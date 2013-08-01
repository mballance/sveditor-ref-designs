/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_saverestore_fc3.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ./spc_basic_isa3.pl FOCUS_SEED=941275903"
.ident "BY rg131678 ON Wed Aug  6 18:03:51 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_saverestore_fc3.s,v 1.3 2007/07/05 22:01:55 drp Exp $"
#include "defines.h"
#include "nmacros.h"
#include "old_boot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */


	ta	T_RD_THID
	mov	%o1, %l6
	umul	%l6, 256, %l7
	setx	DIAG_DATA_AREA, %g1, %g3
	add	%l7, %g3, %l7

!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x9,	%g1
	set	0x3,	%g2
	set	0xC,	%g3
	set	0x3,	%g4
	set	0xE,	%g5
	set	0xE,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x9,	%i1
	set	-0xA,	%i2
	set	-0x3,	%i3
	set	-0x7,	%i4
	set	-0x7,	%i5
	set	-0x4,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x4B531286,	%l0
	set	0x1279ED64,	%l1
	set	0x36248E0F,	%l2
	set	0x1508031C,	%l3
	set	0x39CEEEF4,	%l4
	set	0x7FCA1FBF,	%l5
	set	0x51EDDE29,	%l6
	!# Output registers
	set	-0x1A48,	%o0
	set	0x1DD4,	%o1
	set	-0x1FB2,	%o2
	set	0x0EE9,	%o3
	set	0x13E7,	%o4
	set	0x0893,	%o5
	set	0x103A,	%o6
	set	-0x14CC,	%o7

	!# Float Registers
	INIT_TH_FP_REG(%l7, %f0, 0x55555555aaaaaaaa)
	INIT_TH_FP_REG(%l7, %f2, 0xaaaaaaaa55555555)
	INIT_TH_FP_REG(%l7, %f4, 0xfedcba9876543210)
	INIT_TH_FP_REG(%l7, %f6, 0x0123456789abcdef)
	INIT_TH_FP_REG(%l7, %f8, 0x55aa55aaff00ff00)
	INIT_TH_FP_REG(%l7, %f10, 0x1111111111111111)
	INIT_TH_FP_REG(%l7, %f12, 0x8888888888888888)
	INIT_TH_FP_REG(%l7, %f14, 0xfedcba9876543210)

	!# Execute some ALU ops ..

	fcmple16	%f12,	%f12,	%g3
	fmovdne	%xcc,	%f10,	%f10
	edge16l	%g5,	%g7,	%o5
	srl	%o0,	%l2,	%g2
	fandnot1	%f10,	%f14,	%f2
	or	%l0,	%g6,	%i6
	edge16ln	%o3,	%l6,	%o2
	sdivcc	%i5,	0x116E,	%i4
	fandnot2s	%f1,	%f3,	%f9
	andncc	%l1,	%l3,	%i1
	udivcc	%g4,	0x0E2C,	%o7
	edge16l	%o1,	%l4,	%i0
	subcc	%i7,	0x0858,	%g1
	fsrc1	%f6,	%f6
	edge32ln	%o6,	%l5,	%i2
	xnor	%o4,	0x1B68,	%i3
	umul	%g5,	0x1DE8,	%g7
	addccc	%g3,	%o5,	%l2
	std	%f4,	[%l7 + 0x78]
	lduw	[%l7 + 0x24],	%g2
	popc	%o0,	%l0
	udivcc	%i6,	0x03AD,	%g6
	edge8ln	%l6,	%o3,	%i5
	subc	%i4,	0x1A1B,	%l1
	movrlz	%o2,	0x019,	%l3
	movleu	%icc,	%g4,	%i1
	sllx	%o1,	0x14,	%l4
	sethi	0x069D,	%o7
	fmovsvs	%icc,	%f9,	%f10
	movrlez	%i0,	%i7,	%g1
	movneg	%xcc,	%l5,	%i2
	fmovsneg	%xcc,	%f5,	%f11
	move	%icc,	%o6,	%i3
	mulx	%g5,	0x0DC6,	%g7
	lduw	[%l7 + 0x1C],	%o4
	orcc	%g3,	%l2,	%o5
	subc	%o0,	0x1144,	%l0
	edge8n	%i6,	%g6,	%g2
	popc	0x05F7,	%l6
	sdiv	%i5,	0x17E3,	%o3
	fpsub16s	%f9,	%f3,	%f13
	popc	0x0FCE,	%i4
	mova	%xcc,	%l1,	%l3
	udiv	%g4,	0x0CB0,	%o2
	ldsb	[%l7 + 0x70],	%o1
	edge8	%i1,	%o7,	%l4
	sra	%i7,	0x16,	%i0
	movre	%g1,	0x105,	%i2
	or	%l5,	0x1C5B,	%i3
	alignaddrl	%o6,	%g5,	%o4
	udivcc	%g7,	0x1CCC,	%l2
	fmovda	%xcc,	%f1,	%f5
	array8	%g3,	%o5,	%o0
	edge16n	%l0,	%g6,	%i6
	array32	%l6,	%g2,	%o3
	fmul8x16au	%f14,	%f11,	%f0
	ldd	[%l7 + 0x70],	%i4
	addcc	%i5,	%l1,	%l3
	fmovrdne	%g4,	%f12,	%f2
	fmovsn	%xcc,	%f14,	%f3
	stb	%o1,	[%l7 + 0x6A]
	popc	%o2,	%i1
	alignaddrl	%o7,	%l4,	%i7
	sth	%i0,	[%l7 + 0x74]
	xnorcc	%i2,	%g1,	%i3
	movl	%xcc,	%o6,	%g5
	sethi	0x09A2,	%o4
	movrlz	%g7,	0x0F0,	%l2
	movrgz	%l5,	0x2E4,	%o5
	movvs	%icc,	%g3,	%l0
	or	%g6,	%i6,	%o0
	orn	%g2,	%l6,	%i4
	edge16l	%o3,	%i5,	%l1
	fcmpne32	%f6,	%f2,	%g4
	edge8l	%l3,	%o2,	%o1
	save %o7, %i1, %l4
	movrne	%i7,	%i2,	%i0
	fmuld8ulx16	%f5,	%f14,	%f8
	edge8	%g1,	%o6,	%i3
	fmovsge	%icc,	%f5,	%f13
	movg	%icc,	%g5,	%g7
	xnorcc	%l2,	%l5,	%o4
	fabsd	%f0,	%f6
	movpos	%xcc,	%o5,	%l0
	udivx	%g6,	0x09DA,	%i6
	movneg	%xcc,	%o0,	%g2
	array8	%l6,	%i4,	%g3
	edge8	%i5,	%o3,	%g4
	restore %l1, 0x0C61, %o2
	movgu	%xcc,	%l3,	%o1
	xnor	%i1,	%l4,	%o7
	alignaddrl	%i2,	%i0,	%i7
	addcc	%o6,	%i3,	%g5
	movrne	%g1,	0x2E4,	%g7
	srax	%l2,	0x17,	%l5
	edge16	%o4,	%l0,	%g6
	fmovdpos	%xcc,	%f3,	%f0
	movle	%icc,	%o5,	%i6
	xnorcc	%o0,	%g2,	%l6
	ldd	[%l7 + 0x50],	%g2
	fmuld8ulx16	%f8,	%f11,	%f0
	movle	%icc,	%i4,	%o3
	addcc	%i5,	%g4,	%o2
	array32	%l1,	%o1,	%l3
	edge16l	%i1,	%l4,	%i2
	ld	[%l7 + 0x0C],	%f2
	array32	%o7,	%i7,	%o6
	lduh	[%l7 + 0x54],	%i0
	st	%f13,	[%l7 + 0x24]
	srlx	%g5,	0x04,	%i3
	fand	%f2,	%f10,	%f4
	sll	%g1,	%l2,	%g7
	lduw	[%l7 + 0x14],	%o4
	srlx	%l5,	%l0,	%g6
	save %o5, 0x0711, %o0
	save %i6, 0x183C, %g2
	subcc	%l6,	0x1186,	%g3
	movvc	%icc,	%o3,	%i5
	fones	%f11
	addc	%i4,	0x07F9,	%g4
	fsrc1	%f0,	%f12
	srl	%o2,	0x00,	%o1
	fmovrdne	%l1,	%f10,	%f0
	movneg	%icc,	%l3,	%i1
	edge8l	%l4,	%o7,	%i2
	for	%f8,	%f4,	%f14
	edge16	%o6,	%i0,	%i7
	fmovsa	%icc,	%f0,	%f6
	fmovsgu	%xcc,	%f14,	%f10
	edge32	%i3,	%g1,	%g5
	fpsub16	%f12,	%f14,	%f8
	orncc	%g7,	%o4,	%l5
	fmovdn	%icc,	%f14,	%f15
	edge32n	%l2,	%g6,	%o5
	addccc	%o0,	0x0BF4,	%l0
	edge16ln	%i6,	%g2,	%l6
	sub	%g3,	%o3,	%i5
	save %i4, %g4, %o2
	srlx	%l1,	%o1,	%l3
	xnor	%i1,	%l4,	%o7
	sethi	0x0887,	%i2
	fcmpes	%fcc3,	%f6,	%f14
	ldd	[%l7 + 0x10],	%i0
	mulscc	%o6,	0x087C,	%i3
	stb	%i7,	[%l7 + 0x2D]
	ld	[%l7 + 0x18],	%f8
	xorcc	%g5,	%g1,	%g7
	mulscc	%o4,	%l2,	%l5
	move	%xcc,	%o5,	%o0
	stb	%g6,	[%l7 + 0x7B]
	move	%xcc,	%i6,	%g2
	edge16ln	%l0,	%g3,	%o3
	movrne	%i5,	%l6,	%i4
	sth	%o2,	[%l7 + 0x2A]
	subcc	%l1,	%o1,	%l3
	sdivcc	%i1,	0x1F7E,	%l4
	fsrc2	%f8,	%f14
	fmovrslez	%o7,	%f5,	%f1
	smulcc	%i2,	0x0C26,	%i0
	udivx	%o6,	0x1A97,	%i3
	fmovrsgez	%g4,	%f12,	%f15
	movrlz	%i7,	0x2E6,	%g5
	ldub	[%l7 + 0x0E],	%g1
	fands	%f14,	%f3,	%f3
	edge8n	%g7,	%l2,	%o4
	fmovrdgez	%l5,	%f2,	%f10
	fpadd16s	%f7,	%f14,	%f6
	movl	%xcc,	%o5,	%g6
	fnors	%f1,	%f9,	%f11
	edge16ln	%o0,	%g2,	%i6
	fmovspos	%icc,	%f7,	%f4
	fmovsge	%icc,	%f11,	%f12
	edge32l	%l0,	%g3,	%o3
	sdivcc	%l6,	0x177A,	%i4
	movrlz	%i5,	0x06A,	%o2
	and	%l1,	0x01D5,	%o1
	fmovrsgez	%l3,	%f14,	%f15
	alignaddr	%i1,	%l4,	%o7
	subcc	%i0,	%i2,	%o6
	umulcc	%g4,	0x1D6D,	%i3
	ldx	[%l7 + 0x30],	%i7
	array32	%g1,	%g5,	%l2
	fnand	%f0,	%f4,	%f4
	fmovdg	%xcc,	%f0,	%f9
	fmovdgu	%icc,	%f1,	%f10
	umulcc	%o4,	0x0371,	%l5
	edge8n	%o5,	%g6,	%g7
	movrlz	%g2,	%i6,	%l0
	fmovrde	%g3,	%f14,	%f4
	edge16n	%o0,	%l6,	%i4
	orn	%o3,	0x0371,	%o2
	movge	%icc,	%i5,	%l1
	fmul8x16	%f9,	%f10,	%f8
	ldd	[%l7 + 0x70],	%l2
	edge32n	%i1,	%o1,	%o7
	udivcc	%l4,	0x0DC2,	%i0
	srax	%o6,	%i2,	%i3
	movrne	%g4,	0x17C,	%i7
	movrgez	%g1,	0x2D4,	%g5
	movrne	%o4,	0x009,	%l5
	fnegs	%f15,	%f7
	movg	%xcc,	%o5,	%l2
	add	%g6,	%g2,	%i6
	movcc	%icc,	%l0,	%g3
	stx	%g7,	[%l7 + 0x48]
	fnegd	%f6,	%f12
	mova	%icc,	%o0,	%i4
	array8	%l6,	%o2,	%o3
	sll	%l1,	0x01,	%l3
	movre	%i1,	%i5,	%o7
	array8	%o1,	%i0,	%o6
	sdivx	%i2,	0x15D1,	%l4
	fpsub16s	%f4,	%f9,	%f13
	bshuffle	%f4,	%f12,	%f8
	movleu	%icc,	%g4,	%i3
	fmovrde	%i7,	%f2,	%f4
	movge	%xcc,	%g5,	%o4
	edge16n	%l5,	%o5,	%l2
	mova	%icc,	%g6,	%g2
	std	%f12,	[%l7 + 0x38]
	edge16l	%i6,	%l0,	%g1
	mulx	%g7,	0x118E,	%o0
	faligndata	%f10,	%f14,	%f10
	movrgez	%g3,	%l6,	%o2
	movg	%xcc,	%i4,	%o3
	addcc	%l1,	%i1,	%l3
	andncc	%i5,	%o7,	%o1
	fxnor	%f4,	%f4,	%f6
	fcmple16	%f8,	%f4,	%o6
	fmul8sux16	%f10,	%f6,	%f12
	srlx	%i2,	%i0,	%g4
	fands	%f12,	%f5,	%f11
	movpos	%icc,	%i3,	%i7
	ldsb	[%l7 + 0x45],	%g5
	alignaddrl	%o4,	%l4,	%l5
	srlx	%l2,	%o5,	%g2
	edge32l	%i6,	%l0,	%g6
	array8	%g1,	%g7,	%g3
	movvc	%icc,	%o0,	%l6
	array8	%i4,	%o3,	%l1
	sdivx	%o2,	0x0F05,	%i1
	stx	%i5,	[%l7 + 0x38]
	mulx	%o7,	%o1,	%o6
	fcmpne16	%f0,	%f0,	%l3
	fcmpgt32	%f12,	%f2,	%i2
	fpsub16	%f4,	%f10,	%f14
	movg	%xcc,	%i0,	%g4
	movvc	%xcc,	%i7,	%g5
	restore %i3, 0x1152, %o4
	movl	%icc,	%l4,	%l2
	udivcc	%o5,	0x0F24,	%l5
	ldd	[%l7 + 0x30],	%g2
	fnot1s	%f9,	%f10
	fexpand	%f4,	%f0
	fmovrdlez	%l0,	%f14,	%f10
	ldsb	[%l7 + 0x42],	%g6
	movleu	%icc,	%i6,	%g1
	edge32	%g7,	%o0,	%g3
	fpackfix	%f14,	%f8
	ld	[%l7 + 0x70],	%f6
	fxnors	%f15,	%f4,	%f15
	popc	0x1B1A,	%i4
	sub	%o3,	%l6,	%l1
	stw	%o2,	[%l7 + 0x1C]
	fcmpne32	%f4,	%f12,	%i5
	edge16n	%i1,	%o1,	%o6
	movvc	%icc,	%l3,	%o7
	stb	%i2,	[%l7 + 0x5C]
	save %g4, %i0, %i7
	stx	%i3,	[%l7 + 0x40]
	edge8n	%o4,	%g5,	%l4
	ld	[%l7 + 0x10],	%f8
	edge32ln	%l2,	%l5,	%o5
	fpmerge	%f6,	%f2,	%f4
	addcc	%l0,	0x1AA6,	%g6
	fcmple16	%f4,	%f0,	%i6
	srax	%g1,	%g2,	%g7
	xorcc	%g3,	0x128B,	%i4
	addccc	%o3,	0x0CB8,	%l6
	movvs	%icc,	%o0,	%l1
	fmuld8sux16	%f11,	%f12,	%f6
	fcmpeq32	%f12,	%f10,	%i5
	fmul8x16	%f0,	%f6,	%f12
	ldsb	[%l7 + 0x43],	%o2
	or	%o1,	0x1651,	%o6
	orn	%l3,	0x02EE,	%i1
	alignaddrl	%o7,	%i2,	%g4
	mulscc	%i0,	%i3,	%i7
	xnor	%g5,	%l4,	%l2
	and	%l5,	%o5,	%l0
	fcmpd	%fcc1,	%f8,	%f12
	st	%f15,	[%l7 + 0x58]
	add	%g6,	0x0A28,	%o4
	std	%f10,	[%l7 + 0x78]
	sll	%i6,	%g1,	%g7
	xnor	%g2,	%g3,	%o3
	ldsb	[%l7 + 0x0E],	%i4
	fsrc1	%f4,	%f8
	save %l6, %o0, %l1
	addcc	%i5,	%o1,	%o2
	movgu	%icc,	%o6,	%i1
	ldd	[%l7 + 0x50],	%o6
	lduw	[%l7 + 0x7C],	%i2
	movpos	%icc,	%g4,	%i0
	edge32	%i3,	%i7,	%l3
	ldsb	[%l7 + 0x12],	%g5
	movneg	%xcc,	%l2,	%l5
	edge8l	%l4,	%l0,	%o5
	subccc	%g6,	%i6,	%g1
	mova	%icc,	%o4,	%g2
	movl	%xcc,	%g7,	%g3
	ldsw	[%l7 + 0x24],	%o3
	fcmpd	%fcc1,	%f2,	%f12
	mulx	%l6,	%i4,	%o0
	sdivx	%l1,	0x1B7C,	%o1
	ldub	[%l7 + 0x67],	%o2
	fmovsa	%xcc,	%f8,	%f8
	xor	%i5,	%i1,	%o7
	fmovd	%f6,	%f0
	pdist	%f6,	%f2,	%f12
	movrlez	%o6,	0x3DF,	%g4
	smul	%i0,	0x183F,	%i2
	fmovs	%f15,	%f12
	move	%icc,	%i7,	%i3
	edge32l	%g5,	%l2,	%l3
	save %l5, %l4, %o5
	movleu	%xcc,	%l0,	%i6
	edge16	%g6,	%g1,	%g2
	srlx	%o4,	0x06,	%g3
	move	%icc,	%o3,	%g7
	movvc	%xcc,	%l6,	%i4
	alignaddr	%o0,	%o1,	%o2
	addcc	%l1,	0x0316,	%i1
	movleu	%icc,	%o7,	%i5
	movcc	%icc,	%g4,	%o6
	addccc	%i2,	%i7,	%i0
	ldub	[%l7 + 0x37],	%i3
	fmovdg	%xcc,	%f6,	%f15
	ld	[%l7 + 0x74],	%f14
	movre	%l2,	%l3,	%l5
	st	%f6,	[%l7 + 0x6C]
	smulcc	%g5,	%l4,	%o5
	subccc	%l0,	%i6,	%g1
	xorcc	%g2,	%o4,	%g6
	movrlz	%o3,	%g7,	%l6
	andncc	%g3,	%i4,	%o1
	movrgez	%o0,	%l1,	%i1
	fmuld8ulx16	%f6,	%f9,	%f10
	subcc	%o2,	%i5,	%g4
	array8	%o6,	%i2,	%i7
	movcs	%xcc,	%o7,	%i3
	ldd	[%l7 + 0x30],	%f14
	ld	[%l7 + 0x18],	%f0
	xor	%l2,	%i0,	%l5
	ldx	[%l7 + 0x70],	%g5
	std	%f0,	[%l7 + 0x58]
	ldsh	[%l7 + 0x4A],	%l4
	xnorcc	%l3,	0x12BC,	%o5
	srax	%i6,	%l0,	%g2
	andn	%o4,	%g1,	%o3
	st	%f8,	[%l7 + 0x50]
	fnegs	%f6,	%f13
	sra	%g7,	0x16,	%g6
	fmul8sux16	%f14,	%f4,	%f2
	mulx	%l6,	0x041D,	%g3
	stx	%o1,	[%l7 + 0x28]
	mova	%icc,	%o0,	%i4
	fabss	%f8,	%f3
	edge16l	%l1,	%o2,	%i1
	umulcc	%i5,	%o6,	%g4
	srlx	%i2,	%i7,	%i3
	popc	%l2,	%i0
	movrne	%o7,	%g5,	%l5
	subccc	%l3,	%o5,	%l4
	fmovsn	%icc,	%f10,	%f10
	sllx	%l0,	%i6,	%o4
	ldub	[%l7 + 0x17],	%g1
	orn	%g2,	%o3,	%g6
	fzeros	%f8
	fnegs	%f15,	%f10
	udivcc	%g7,	0x064E,	%g3
	sth	%l6,	[%l7 + 0x48]
	stb	%o1,	[%l7 + 0x72]
	fcmpeq16	%f0,	%f12,	%i4
	edge32	%l1,	%o0,	%i1
	addc	%o2,	%o6,	%g4
	movl	%icc,	%i5,	%i7
	fmovdvc	%icc,	%f15,	%f7
	fexpand	%f15,	%f6
	fnot1	%f4,	%f6
	udiv	%i2,	0x0620,	%l2
	ldd	[%l7 + 0x28],	%i0
	xnorcc	%o7,	%g5,	%i3
	movrgez	%l3,	%l5,	%o5
	addc	%l0,	%l4,	%o4
	alignaddrl	%g1,	%g2,	%o3
	edge32	%i6,	%g7,	%g3
	movneg	%xcc,	%l6,	%o1
	fcmple32	%f0,	%f6,	%g6
	edge8	%l1,	%i4,	%o0
	fnegs	%f6,	%f6
	edge16n	%o2,	%o6,	%i1
	array32	%g4,	%i7,	%i5
	addccc	%i2,	%i0,	%l2
	andcc	%g5,	%i3,	%o7
	movre	%l5,	0x22D,	%l3
	fxors	%f13,	%f9,	%f12
	movcs	%xcc,	%l0,	%o5
	edge16l	%o4,	%l4,	%g2
	fcmple32	%f4,	%f12,	%g1
	array16	%o3,	%g7,	%i6
	sdivx	%g3,	0x12D8,	%o1
	ld	[%l7 + 0x2C],	%f15
	array16	%l6,	%l1,	%i4
	movge	%icc,	%g6,	%o0
	fpsub16	%f10,	%f8,	%f2
	movrgz	%o6,	%o2,	%g4
	edge8ln	%i1,	%i5,	%i7
	edge32	%i2,	%i0,	%g5
	fcmpne16	%f4,	%f2,	%l2
	smul	%i3,	%o7,	%l3
	fmovrsgz	%l5,	%f13,	%f12
	udivcc	%o5,	0x0E62,	%l0
	stw	%l4,	[%l7 + 0x3C]
	movrlz	%o4,	0x263,	%g1
	popc	0x1800,	%o3
	smulcc	%g7,	%g2,	%i6
	andncc	%o1,	%l6,	%g3
	sllx	%i4,	0x05,	%g6
	move	%icc,	%o0,	%o6
	ldd	[%l7 + 0x58],	%f8
	array16	%l1,	%o2,	%g4
	srax	%i1,	%i5,	%i7
	alignaddrl	%i2,	%g5,	%i0
	movrlz	%l2,	0x048,	%o7
	ldd	[%l7 + 0x78],	%f6
	fmovsg	%icc,	%f3,	%f5
	xnorcc	%l3,	0x1B8B,	%i3
	fsrc1s	%f6,	%f2
	movcc	%icc,	%l5,	%o5
	movle	%icc,	%l0,	%l4
	stw	%o4,	[%l7 + 0x24]
	fxor	%f4,	%f10,	%f14
	movpos	%icc,	%g1,	%o3
	fmovdneg	%xcc,	%f2,	%f5
	fsrc1s	%f8,	%f14
	restore %g2, 0x075E, %g7
	st	%f3,	[%l7 + 0x54]
	movn	%icc,	%o1,	%i6
	movrlz	%l6,	0x2EC,	%i4
	alignaddrl	%g6,	%o0,	%o6
	fpadd16	%f8,	%f8,	%f12
	movvc	%icc,	%g3,	%o2
	lduw	[%l7 + 0x50],	%g4
	udivcc	%i1,	0x1802,	%l1
	ldsh	[%l7 + 0x70],	%i7
	fabss	%f12,	%f6
	addccc	%i2,	0x1E26,	%i5
	fcmpeq16	%f2,	%f4,	%i0
	xor	%l2,	0x1453,	%g5
	lduh	[%l7 + 0x08],	%l3
	srax	%i3,	%l5,	%o7
	fmovsvc	%icc,	%f6,	%f15
	sllx	%o5,	0x0C,	%l4
	subc	%o4,	0x174E,	%l0
	fzeros	%f8
	movle	%icc,	%g1,	%o3
	lduw	[%l7 + 0x20],	%g7
	udiv	%g2,	0x18B1,	%o1
	srlx	%i6,	0x10,	%l6
	fnot2s	%f4,	%f5
	udivcc	%i4,	0x0EF8,	%g6
	movvs	%xcc,	%o0,	%o6
	movcs	%xcc,	%g3,	%g4
	movrlez	%o2,	0x3E3,	%l1
	ldsw	[%l7 + 0x70],	%i7
	andcc	%i2,	0x1CD4,	%i5
	andn	%i0,	%i1,	%g5
	udiv	%l3,	0x1C5C,	%l2
	save %i3, 0x12B6, %o7
	edge8ln	%l5,	%o5,	%l4
	fmuld8ulx16	%f5,	%f3,	%f6
	sth	%l0,	[%l7 + 0x50]
	movre	%g1,	0x3BA,	%o4
	movcc	%icc,	%o3,	%g2
	alignaddr	%g7,	%i6,	%o1
	fzeros	%f4
	movn	%xcc,	%i4,	%l6
	movn	%xcc,	%g6,	%o0
	mulscc	%o6,	%g4,	%o2
	orn	%g3,	%i7,	%l1
	fmovdvs	%icc,	%f8,	%f11
	movgu	%xcc,	%i2,	%i5
	st	%f6,	[%l7 + 0x68]
	array16	%i0,	%g5,	%i1
	orncc	%l2,	%l3,	%o7
	stx	%i3,	[%l7 + 0x28]
	sethi	0x0B35,	%l5
	fsrc1s	%f15,	%f12
	subc	%l4,	0x0DAD,	%l0
	andn	%g1,	%o4,	%o3
	mulscc	%g2,	%o5,	%i6
	array16	%g7,	%i4,	%l6
	mulscc	%g6,	0x1B49,	%o1
	sth	%o6,	[%l7 + 0x1E]
	andncc	%o0,	%o2,	%g3
	movrlz	%g4,	0x34B,	%i7
	movrlz	%l1,	0x383,	%i5
	fxors	%f3,	%f3,	%f11
	sth	%i0,	[%l7 + 0x44]
	srax	%i2,	0x00,	%i1
	stw	%g5,	[%l7 + 0x5C]
	add	%l3,	%o7,	%i3
	array32	%l5,	%l4,	%l2
	fcmple32	%f12,	%f4,	%l0
	fpackfix	%f2,	%f14
	fmovrsgz	%o4,	%f13,	%f1
	fmovdne	%xcc,	%f13,	%f13
	andncc	%g1,	%g2,	%o5
	mulscc	%i6,	%g7,	%o3
	alignaddr	%l6,	%g6,	%o1
	movge	%xcc,	%i4,	%o6
	movcc	%xcc,	%o0,	%g3
	stw	%o2,	[%l7 + 0x64]
	smul	%i7,	0x1D45,	%l1
	fpadd16	%f6,	%f10,	%f14
	movcc	%icc,	%i5,	%i0
	sth	%g4,	[%l7 + 0x0C]
	sethi	0x0169,	%i1
	movgu	%icc,	%g5,	%l3
	subccc	%o7,	%i3,	%i2
	umul	%l4,	0x18D2,	%l5
	movvs	%icc,	%l2,	%l0
	srax	%g1,	%g2,	%o4
	array8	%i6,	%g7,	%o3
	ldx	[%l7 + 0x48],	%o5
	array32	%l6,	%o1,	%i4
	movrgz	%g6,	0x1D6,	%o6
	orn	%g3,	%o2,	%o0
	fnand	%f12,	%f12,	%f0
	xnor	%l1,	%i5,	%i0
	fors	%f6,	%f13,	%f1
	fornot1s	%f14,	%f12,	%f4
	fmuld8sux16	%f5,	%f5,	%f10
	edge32l	%g4,	%i1,	%g5
	fmovdge	%icc,	%f10,	%f7
	ldx	[%l7 + 0x40],	%l3
	movcs	%icc,	%o7,	%i7
	stb	%i2,	[%l7 + 0x42]
	sethi	0x065C,	%i3
	movl	%xcc,	%l5,	%l4
	andn	%l2,	0x03D9,	%l0
	array8	%g2,	%g1,	%i6
	ldsh	[%l7 + 0x6C],	%g7
	movgu	%xcc,	%o3,	%o5
	sth	%l6,	[%l7 + 0x22]
	edge8n	%o1,	%o4,	%i4
	mulscc	%o6,	%g6,	%g3
	alignaddr	%o2,	%o0,	%i5
	umulcc	%l1,	0x1269,	%i0
	udivx	%g4,	0x1E9F,	%i1
	fmul8x16au	%f7,	%f9,	%f0
	smul	%l3,	0x1C63,	%g5
	movge	%xcc,	%o7,	%i2
	ldsb	[%l7 + 0x15],	%i7
	orcc	%i3,	%l5,	%l4
	smul	%l2,	0x008E,	%l0
	sethi	0x01D6,	%g2
	edge32l	%g1,	%i6,	%g7
	fcmps	%fcc0,	%f1,	%f8
	or	%o5,	%o3,	%l6
	ldsb	[%l7 + 0x11],	%o1
	fxor	%f12,	%f10,	%f2
	sub	%i4,	0x0A5D,	%o6
	sethi	0x1334,	%o4
	ld	[%l7 + 0x20],	%f3
	movneg	%xcc,	%g6,	%o2
	movne	%xcc,	%g3,	%o0
	or	%i5,	0x1DC8,	%l1
	fone	%f4
	std	%f2,	[%l7 + 0x18]
	smul	%g4,	0x1ACB,	%i1
	fmovdle	%icc,	%f2,	%f13
	restore %l3, 0x0FFD, %i0
	edge16n	%g5,	%i2,	%i7
	addc	%o7,	%l5,	%l4
	movrne	%i3,	%l2,	%g2
	fpsub16s	%f12,	%f9,	%f1
	fones	%f6
	move	%icc,	%l0,	%g1
	fsrc1s	%f0,	%f7
	fmovdn	%xcc,	%f1,	%f10
	fmovrslez	%i6,	%f4,	%f11
	fones	%f7
	ld	[%l7 + 0x58],	%f3
	sdivx	%g7,	0x0DAC,	%o3
	srl	%o5,	0x0F,	%l6
	fmovdneg	%icc,	%f0,	%f13
	add	%i4,	%o1,	%o6
	addcc	%g6,	0x048B,	%o4
	srax	%g3,	0x04,	%o2
	fmovdne	%xcc,	%f14,	%f10
	movrne	%o0,	%i5,	%l1
	orncc	%g4,	0x089A,	%l3
	movn	%icc,	%i1,	%g5
	fmovd	%f0,	%f8
	ldd	[%l7 + 0x58],	%i2
	fmovdl	%icc,	%f3,	%f7
	fors	%f9,	%f11,	%f1
	smulcc	%i7,	0x069A,	%o7
	srl	%l5,	0x1D,	%l4
	fcmps	%fcc2,	%f6,	%f1
	smulcc	%i0,	0x1748,	%l2
	movrlz	%i3,	%l0,	%g2
	sllx	%i6,	0x14,	%g1
	movvc	%icc,	%o3,	%o5
	fones	%f13
	movcs	%xcc,	%g7,	%l6
	movvc	%icc,	%i4,	%o6
	movl	%icc,	%o1,	%o4
	xnorcc	%g3,	0x1E29,	%o2
	add	%o0,	%g6,	%l1
	fmul8ulx16	%f14,	%f6,	%f6
	movn	%icc,	%i5,	%l3
	movne	%xcc,	%g4,	%i1
	array32	%i2,	%g5,	%i7
	xnor	%l5,	%l4,	%o7
	lduw	[%l7 + 0x28],	%i0
	siam	0x4
	edge16l	%l2,	%i3,	%g2
	edge16ln	%l0,	%i6,	%o3
	orn	%g1,	%g7,	%o5
	ld	[%l7 + 0x40],	%f10
	sub	%l6,	%i4,	%o1
	alignaddr	%o6,	%g3,	%o2
	andcc	%o0,	%g6,	%o4
	array16	%i5,	%l3,	%l1
	smulcc	%i1,	0x15E2,	%i2
	movneg	%xcc,	%g5,	%g4
	stb	%l5,	[%l7 + 0x5D]
	ldd	[%l7 + 0x08],	%l4
	sdivx	%o7,	0x117F,	%i7
	fornot1s	%f14,	%f10,	%f10
	srax	%i0,	0x0F,	%i3
	edge8n	%l2,	%g2,	%i6
	orcc	%l0,	%g1,	%o3
	sdivcc	%o5,	0x1D34,	%g7
	mova	%xcc,	%l6,	%i4
	udivcc	%o6,	0x02D2,	%g3
	movrlz	%o2,	%o1,	%o0
	edge8ln	%o4,	%g6,	%l3
	movrgz	%i5,	0x33F,	%i1
	umul	%l1,	%g5,	%i2
	fmovd	%f10,	%f12
	udivx	%l5,	0x0687,	%g4
	fornot2s	%f12,	%f6,	%f8
	and	%o7,	0x1CEE,	%l4
	edge16l	%i7,	%i3,	%i0
	edge16ln	%l2,	%g2,	%i6
	srlx	%l0,	%o3,	%g1
	add	%o5,	%g7,	%i4
	fnot2	%f6,	%f6
	fcmps	%fcc1,	%f14,	%f13
	sllx	%l6,	%o6,	%o2
	movrlz	%g3,	%o0,	%o4
	edge8	%o1,	%g6,	%l3
	fnands	%f5,	%f13,	%f13
	edge8l	%i5,	%i1,	%l1
	movleu	%icc,	%i2,	%g5
	movge	%icc,	%l5,	%g4
	edge16ln	%o7,	%l4,	%i7
	umulcc	%i3,	%l2,	%g2
	ldd	[%l7 + 0x18],	%f14
	fmovdcc	%icc,	%f12,	%f10
	movre	%i6,	%l0,	%i0
	subc	%g1,	0x06A8,	%o5
	andncc	%g7,	%i4,	%o3
	movvs	%xcc,	%o6,	%l6
	mulscc	%o2,	0x0EBB,	%o0
	ldx	[%l7 + 0x50],	%o4
	srlx	%g3,	0x0C,	%g6
	bshuffle	%f14,	%f12,	%f8
	fmovrdgz	%o1,	%f12,	%f14
	addccc	%i5,	%i1,	%l3
	stb	%l1,	[%l7 + 0x68]
	add	%g5,	0x12CC,	%l5
	sll	%g4,	0x17,	%o7
	array32	%l4,	%i7,	%i3
	ldub	[%l7 + 0x79],	%l2
	move	%xcc,	%i2,	%g2
	fmovdl	%icc,	%f11,	%f10
	udivx	%i6,	0x1F49,	%i0
	ldub	[%l7 + 0x66],	%l0
	edge16n	%g1,	%g7,	%o5
	movrne	%o3,	%o6,	%l6
	fmovs	%f4,	%f4
	array32	%i4,	%o0,	%o2
	fzeros	%f3
	alignaddrl	%o4,	%g3,	%o1
	fsrc2	%f14,	%f12
	fnegs	%f7,	%f10
	fnands	%f8,	%f4,	%f13
	fors	%f11,	%f11,	%f0
	fmovrsgez	%g6,	%f14,	%f12
	movre	%i1,	%i5,	%l3
	std	%f10,	[%l7 + 0x30]
	movvc	%xcc,	%g5,	%l5
	siam	0x1
	ldsb	[%l7 + 0x11],	%l1
	lduh	[%l7 + 0x5A],	%o7
	ldsb	[%l7 + 0x33],	%l4
	xor	%i7,	0x045F,	%g4
	stb	%l2,	[%l7 + 0x66]
	st	%f11,	[%l7 + 0x40]
	subccc	%i3,	%i2,	%g2
	fmovsa	%xcc,	%f14,	%f4
	movrgez	%i0,	0x02B,	%i6
	lduh	[%l7 + 0x32],	%l0
	smulcc	%g1,	%o5,	%g7
	fmovsvc	%xcc,	%f11,	%f7
	smul	%o6,	%l6,	%o3
	lduh	[%l7 + 0x26],	%o0
	fmovs	%f8,	%f1
	fmovdgu	%icc,	%f14,	%f0
	subccc	%o2,	%o4,	%g3
	xorcc	%o1,	%i4,	%g6
	edge8ln	%i5,	%l3,	%g5
	movl	%icc,	%i1,	%l1
	edge8ln	%l5,	%l4,	%o7
	movn	%icc,	%i7,	%g4
	fmovdl	%xcc,	%f0,	%f15
	movrne	%i3,	%i2,	%l2
	udiv	%i0,	0x0FC7,	%i6
	mova	%icc,	%g2,	%l0
	fcmple32	%f6,	%f12,	%g1
	ldsh	[%l7 + 0x1E],	%g7
	sra	%o6,	%o5,	%o3
	movgu	%xcc,	%l6,	%o0
	addcc	%o2,	0x0B3C,	%g3
	movrne	%o1,	%o4,	%i4
	fors	%f0,	%f8,	%f0
	edge8l	%g6,	%l3,	%g5
	ldsh	[%l7 + 0x7A],	%i5
	sub	%i1,	0x019A,	%l5
	movl	%icc,	%l1,	%o7
	st	%f4,	[%l7 + 0x24]
	or	%i7,	%l4,	%g4
	edge16n	%i2,	%i3,	%l2
	xnor	%i6,	0x1ED2,	%g2
	stw	%i0,	[%l7 + 0x08]
	or	%g1,	0x1583,	%g7
	orncc	%o6,	0x0349,	%o5
	addccc	%o3,	0x11ED,	%l0
	addc	%l6,	%o0,	%o2
	sdivcc	%g3,	0x06CB,	%o4
	array32	%i4,	%o1,	%g6
	std	%f12,	[%l7 + 0x68]
	alignaddrl	%g5,	%l3,	%i5
	srl	%l5,	0x1E,	%i1
	fmul8ulx16	%f14,	%f2,	%f4
	fnor	%f12,	%f0,	%f2
	sdivx	%o7,	0x0684,	%i7
	movrlez	%l4,	%l1,	%g4
	movneg	%icc,	%i3,	%l2
	orn	%i2,	0x11CE,	%g2
	ldx	[%l7 + 0x28],	%i0
	movcc	%xcc,	%i6,	%g1
	fmovs	%f10,	%f14
	fone	%f10
	movge	%icc,	%o6,	%g7
	ldsh	[%l7 + 0x18],	%o5
	movrlez	%l0,	0x226,	%o3
	movrgez	%l6,	%o0,	%g3
	movcc	%icc,	%o2,	%o4
	mulscc	%i4,	0x0FC7,	%o1
	fmovrsne	%g5,	%f1,	%f8
	udivx	%l3,	0x1858,	%g6
	ldub	[%l7 + 0x22],	%l5
	sethi	0x18FE,	%i5
	mulscc	%o7,	%i1,	%i7
	edge8ln	%l4,	%l1,	%i3
	xnorcc	%g4,	%i2,	%l2
	edge8n	%i0,	%g2,	%g1
	movgu	%xcc,	%o6,	%g7
	umul	%o5,	0x110F,	%l0
	umul	%i6,	%o3,	%o0
	movne	%xcc,	%g3,	%o2
	std	%f6,	[%l7 + 0x78]
	fcmpeq32	%f8,	%f14,	%l6
	movrgez	%o4,	0x2F7,	%i4
	subccc	%o1,	0x0D90,	%g5
	st	%f12,	[%l7 + 0x54]
	add	%g6,	0x1BCD,	%l3
	siam	0x1
	movgu	%xcc,	%l5,	%o7
	movrgez	%i5,	%i7,	%i1
	movneg	%icc,	%l1,	%i3
	subccc	%l4,	%i2,	%g4
	ldx	[%l7 + 0x68],	%l2
	fnand	%f10,	%f14,	%f6
	ldsh	[%l7 + 0x40],	%g2
	for	%f6,	%f4,	%f14
	movrlez	%i0,	%g1,	%g7
	umul	%o6,	%o5,	%l0
	fsrc1	%f4,	%f2
	lduh	[%l7 + 0x28],	%o3
	mulx	%o0,	0x11CA,	%g3
	fpmerge	%f8,	%f10,	%f14
	fmul8x16al	%f11,	%f14,	%f0
	fmovrsne	%i6,	%f7,	%f14
	srax	%l6,	0x1F,	%o4
	lduh	[%l7 + 0x14],	%i4
	fmovdl	%xcc,	%f7,	%f12
	fmovrde	%o2,	%f12,	%f12
	xnor	%g5,	%o1,	%g6
	mova	%xcc,	%l3,	%o7
	movrne	%l5,	%i7,	%i1
	srl	%i5,	%l1,	%i3
	add	%i2,	%l4,	%l2
	stx	%g2,	[%l7 + 0x48]
	udivx	%i0,	0x0560,	%g1
	save %g7, %g4, %o5
	movne	%xcc,	%l0,	%o6
	fmovdcs	%icc,	%f14,	%f4
	ldsw	[%l7 + 0x2C],	%o0
	umulcc	%o3,	0x120B,	%i6
	movneg	%icc,	%g3,	%l6
	stb	%i4,	[%l7 + 0x71]
	sethi	0x1DB4,	%o2
	andcc	%o4,	0x01C8,	%o1
	fpsub16s	%f4,	%f10,	%f13
	xnorcc	%g6,	%g5,	%o7
	fnors	%f10,	%f4,	%f14
	movre	%l3,	0x34E,	%l5
	sethi	0x1E1E,	%i1
	edge16	%i5,	%l1,	%i3
	edge8n	%i7,	%i2,	%l2
	xor	%l4,	%i0,	%g1
	fnegs	%f8,	%f8
	orn	%g7,	0x1714,	%g2
	fmovspos	%xcc,	%f4,	%f12
	movcc	%icc,	%g4,	%o5
	lduh	[%l7 + 0x4E],	%o6
	edge32l	%o0,	%o3,	%i6
	stw	%l0,	[%l7 + 0x10]
	movleu	%icc,	%l6,	%i4
	andncc	%g3,	%o4,	%o2
	or	%g6,	%o1,	%o7
	ldsb	[%l7 + 0x6C],	%g5
	sth	%l3,	[%l7 + 0x7C]
	ldd	[%l7 + 0x48],	%f6
	movgu	%icc,	%i1,	%l5
	addccc	%i5,	%i3,	%i7
	srl	%i2,	%l2,	%l4
	umul	%l1,	%i0,	%g7
	sdivcc	%g1,	0x1D19,	%g2
	ldsb	[%l7 + 0x18],	%o5
	sra	%g4,	0x17,	%o0
	fmovscc	%icc,	%f11,	%f3
	array8	%o6,	%i6,	%l0
	udivcc	%l6,	0x0026,	%o3
	udiv	%i4,	0x0FFE,	%g3
	restore %o4, %g6, %o2
	srax	%o7,	0x03,	%g5
	fpackfix	%f8,	%f12
	sdivcc	%l3,	0x117B,	%i1
	srl	%l5,	%i5,	%o1
	fpackfix	%f10,	%f6
	edge32n	%i3,	%i2,	%i7
	ldub	[%l7 + 0x42],	%l4
	umul	%l2,	0x0F53,	%i0
	sdivx	%g7,	0x0631,	%g1
	fmovsle	%icc,	%f9,	%f11
	restore %l1, 0x07FD, %g2
	ldx	[%l7 + 0x40],	%o5
	mulx	%g4,	%o0,	%i6
	fandnot2	%f8,	%f0,	%f12
	movpos	%icc,	%l0,	%o6
	ldsw	[%l7 + 0x18],	%o3
	movrgez	%l6,	%g3,	%o4
	sra	%i4,	0x1B,	%g6
	fand	%f4,	%f2,	%f0
	edge16	%o7,	%o2,	%g5
	subccc	%l3,	0x03DC,	%l5
	fmovscs	%icc,	%f0,	%f5
	orncc	%i5,	%i1,	%i3
	movre	%i2,	0x1B1,	%i7
	edge32ln	%l4,	%o1,	%l2
	srlx	%i0,	%g1,	%g7
	sdivcc	%l1,	0x1D26,	%g2
	stw	%o5,	[%l7 + 0x38]
	udiv	%o0,	0x0AFE,	%g4
	fxnors	%f6,	%f4,	%f7
	fcmped	%fcc1,	%f2,	%f14
	fmovsn	%icc,	%f10,	%f15
	edge32l	%i6,	%l0,	%o6
	edge32	%o3,	%g3,	%l6
	movvc	%xcc,	%i4,	%o4
	stb	%o7,	[%l7 + 0x66]
	fnors	%f4,	%f11,	%f13
	sll	%o2,	%g5,	%g6
	ldd	[%l7 + 0x10],	%l2
	alignaddrl	%i5,	%i1,	%i3
	fcmpd	%fcc3,	%f14,	%f12
	movcc	%icc,	%i2,	%i7
	ldd	[%l7 + 0x68],	%f12
	or	%l5,	%o1,	%l2
	fnands	%f1,	%f3,	%f10
	movle	%xcc,	%i0,	%l4
	addc	%g1,	0x11F8,	%g7
	addc	%l1,	0x0672,	%g2
	sdiv	%o5,	0x0B88,	%o0
	edge32	%i6,	%l0,	%g4
	ldsb	[%l7 + 0x4C],	%o6
	fmovrdlz	%g3,	%f12,	%f8
	stw	%o3,	[%l7 + 0x44]
	fmovs	%f0,	%f2
	mova	%xcc,	%l6,	%o4
	fmovdleu	%icc,	%f7,	%f14
	ldd	[%l7 + 0x08],	%i4
	lduh	[%l7 + 0x10],	%o2
	edge8ln	%o7,	%g5,	%g6
	orn	%l3,	0x02AA,	%i1
	udivx	%i3,	0x0A58,	%i2
	and	%i7,	0x0981,	%i5
	movg	%xcc,	%o1,	%l5
	addcc	%l2,	0x1849,	%i0
	movleu	%xcc,	%g1,	%l4
	fexpand	%f12,	%f8
	stw	%l1,	[%l7 + 0x28]
	movge	%xcc,	%g7,	%o5
	fornot1s	%f12,	%f7,	%f14
	movleu	%xcc,	%g2,	%o0
	orncc	%i6,	0x1679,	%g4
	edge8l	%l0,	%g3,	%o3
	movg	%icc,	%l6,	%o4
	st	%f7,	[%l7 + 0x20]
	lduw	[%l7 + 0x5C],	%i4
	movg	%icc,	%o6,	%o2
	movrgez	%g5,	%g6,	%l3
	udiv	%i1,	0x06BE,	%o7
	orn	%i2,	%i7,	%i5
	edge32l	%i3,	%o1,	%l2
	movg	%icc,	%i0,	%g1
	edge8l	%l5,	%l4,	%l1
	movcc	%xcc,	%o5,	%g7
	sdivx	%o0,	0x0425,	%i6
	edge32ln	%g2,	%g4,	%g3
	movge	%icc,	%l0,	%l6
	xor	%o4,	0x1D0E,	%o3
	fand	%f8,	%f12,	%f12
	movne	%xcc,	%i4,	%o2
	andncc	%o6,	%g5,	%g6
	move	%icc,	%l3,	%i1
	smulcc	%o7,	0x0996,	%i2
	andcc	%i7,	%i5,	%o1
	move	%xcc,	%l2,	%i0
	subc	%i3,	%l5,	%g1
	movl	%icc,	%l1,	%l4
	addcc	%o5,	0x01D7,	%g7
	ldx	[%l7 + 0x38],	%o0
	fmovscc	%xcc,	%f0,	%f5
	srl	%i6,	%g4,	%g2
	lduw	[%l7 + 0x20],	%g3
	restore %l6, %o4, %o3
	edge16l	%i4,	%l0,	%o6
	xnor	%g5,	0x17F6,	%o2
	edge32ln	%g6,	%l3,	%o7
	sdiv	%i2,	0x1AA6,	%i7
	fmul8x16au	%f1,	%f13,	%f6
	add	%i5,	%o1,	%l2
	fpack32	%f6,	%f10,	%f8
	umulcc	%i0,	%i3,	%i1
	edge8n	%g1,	%l5,	%l4
	edge16	%o5,	%l1,	%o0
	subcc	%g7,	%g4,	%g2
	std	%f12,	[%l7 + 0x50]
	movre	%g3,	%i6,	%o4
	fmovdvs	%xcc,	%f0,	%f0
	stw	%o3,	[%l7 + 0x34]
	orn	%i4,	0x03EF,	%l0
	edge32n	%o6,	%l6,	%o2
	addcc	%g5,	%g6,	%o7
	sub	%i2,	0x1284,	%i7
	smul	%i5,	0x0015,	%l3
	movg	%xcc,	%l2,	%o1
	array16	%i0,	%i3,	%i1
	movneg	%icc,	%g1,	%l4
	fmovsn	%xcc,	%f14,	%f10
	xnorcc	%o5,	%l5,	%o0
	ldd	[%l7 + 0x30],	%f2
	ldsb	[%l7 + 0x52],	%g7
	ldsw	[%l7 + 0x54],	%l1
	edge16l	%g4,	%g3,	%g2
	subc	%o4,	%i6,	%i4
	mulx	%o3,	0x1754,	%o6
	subccc	%l6,	0x01AD,	%l0
	fandnot2s	%f3,	%f6,	%f9
	movle	%xcc,	%g5,	%g6
	pdist	%f6,	%f12,	%f12
	stw	%o7,	[%l7 + 0x3C]
	edge8	%o2,	%i7,	%i2
	movleu	%xcc,	%i5,	%l2
	smul	%l3,	0x0DF4,	%i0
	fmovdne	%xcc,	%f7,	%f9
	orn	%i3,	%o1,	%i1
	movneg	%icc,	%l4,	%g1
	fmul8ulx16	%f4,	%f2,	%f8
	movvc	%xcc,	%o5,	%l5
	fmovdcc	%xcc,	%f11,	%f1
	addc	%o0,	%g7,	%g4
	edge32ln	%l1,	%g2,	%o4
	sethi	0x0FB3,	%i6
	srlx	%g3,	%o3,	%i4
	udivcc	%o6,	0x0FCE,	%l0
	edge8ln	%g5,	%l6,	%o7
	fmovscc	%xcc,	%f5,	%f7
	fmovsleu	%icc,	%f4,	%f2
	andcc	%o2,	%i7,	%i2
	sra	%g6,	0x0D,	%i5
	movn	%icc,	%l2,	%l3
	addcc	%i0,	%i3,	%o1
	fzeros	%f3
	movrgez	%l4,	%g1,	%i1
	smulcc	%l5,	0x1486,	%o5
	andncc	%o0,	%g7,	%l1
	subcc	%g2,	%o4,	%g4
	movl	%xcc,	%i6,	%o3
	addc	%i4,	0x0D3A,	%o6
	ldub	[%l7 + 0x16],	%g3
	add	%l0,	0x0CA4,	%g5
	subccc	%l6,	0x1042,	%o7
	save %o2, %i7, %i2
	movleu	%xcc,	%g6,	%l2
	edge16	%l3,	%i5,	%i0
	fmovse	%xcc,	%f13,	%f7
	xnor	%o1,	0x19DE,	%l4
	save %g1, 0x08F1, %i3
	movle	%icc,	%l5,	%i1
	fpsub16s	%f0,	%f7,	%f6
	fcmpes	%fcc0,	%f12,	%f1
	movne	%icc,	%o5,	%g7
	ld	[%l7 + 0x14],	%f7
	array16	%o0,	%g2,	%l1
	mulscc	%g4,	0x0CA3,	%o4
	stw	%i6,	[%l7 + 0x7C]
	addccc	%o3,	%o6,	%i4
	ldd	[%l7 + 0x20],	%f14
	faligndata	%f4,	%f12,	%f0
	std	%f0,	[%l7 + 0x78]
	ldsh	[%l7 + 0x7C],	%g3
	fmovse	%icc,	%f11,	%f8
	sth	%l0,	[%l7 + 0x5C]
	addcc	%g5,	0x142E,	%l6
	fcmpgt16	%f8,	%f2,	%o2
	add	%o7,	%i2,	%i7
	fcmps	%fcc1,	%f9,	%f13
	and	%g6,	%l3,	%i5
	mulscc	%i0,	%o1,	%l2
	fandnot1	%f8,	%f8,	%f14
	stx	%l4,	[%l7 + 0x50]
	srl	%g1,	%l5,	%i3
	sllx	%o5,	0x06,	%i1
	edge32	%g7,	%g2,	%l1
	fabsd	%f10,	%f12
	fornot1s	%f15,	%f0,	%f8
	lduw	[%l7 + 0x08],	%o0
	mova	%xcc,	%o4,	%g4
	sethi	0x100D,	%o3
	ldub	[%l7 + 0x22],	%i6
	andn	%o6,	%g3,	%i4
	and	%l0,	%l6,	%g5
	fcmple16	%f2,	%f12,	%o2
	sdivx	%i2,	0x14E9,	%o7
	andcc	%i7,	0x196C,	%g6
	movrlz	%l3,	0x392,	%i5
	movrgez	%o1,	%i0,	%l2
	fmul8sux16	%f10,	%f14,	%f2
	udivx	%g1,	0x1EDF,	%l5
	edge16n	%l4,	%i3,	%i1
	alignaddr	%g7,	%g2,	%l1
	move	%xcc,	%o5,	%o4
	smulcc	%o0,	0x0D4F,	%g4
	sethi	0x1566,	%o3
	fcmpne32	%f10,	%f14,	%i6
	smulcc	%o6,	%g3,	%l0
	movrlz	%i4,	%l6,	%g5
	fandnot2	%f10,	%f2,	%f6
	subccc	%o2,	%o7,	%i7
	edge16n	%g6,	%l3,	%i5
	srax	%o1,	0x1F,	%i2
	edge8l	%i0,	%g1,	%l5
	sll	%l2,	%l4,	%i1
	sub	%i3,	0x0376,	%g2
	srax	%g7,	%o5,	%l1
	udiv	%o0,	0x0CA5,	%g4
	fnor	%f2,	%f8,	%f6
	fxors	%f3,	%f12,	%f5
	edge16l	%o4,	%i6,	%o3
	ldub	[%l7 + 0x13],	%g3
	addccc	%o6,	%i4,	%l6
	movrne	%l0,	%o2,	%o7
	edge32n	%g5,	%i7,	%g6
	restore %l3, %i5, %o1
	umulcc	%i2,	%g1,	%i0
	edge32ln	%l5,	%l2,	%i1
	movrgz	%i3,	0x3C5,	%l4
	xnorcc	%g7,	%o5,	%g2
	sllx	%l1,	0x19,	%o0
	sethi	0x19A3,	%g4
	sdivcc	%i6,	0x11B6,	%o3
	smulcc	%o4,	0x04A5,	%g3
	popc	0x1782,	%o6
	ldub	[%l7 + 0x59],	%i4
	movre	%l6,	0x000,	%l0
	edge32n	%o7,	%o2,	%g5
	fmovda	%xcc,	%f2,	%f8
	srl	%i7,	%l3,	%i5
	andcc	%g6,	0x0D00,	%i2
	array16	%o1,	%i0,	%g1
	subccc	%l2,	%i1,	%i3
	ldd	[%l7 + 0x58],	%f8
	popc	%l4,	%l5
	edge16n	%o5,	%g7,	%l1
	sub	%o0,	%g2,	%i6
	subccc	%g4,	%o4,	%o3
	sdiv	%o6,	0x1F55,	%i4
	udivx	%l6,	0x14A0,	%g3
	ld	[%l7 + 0x20],	%f11
	fcmpes	%fcc0,	%f11,	%f12
	subccc	%l0,	%o2,	%g5
	ldsb	[%l7 + 0x44],	%i7
	restore %l3, %o7, %i5
	sth	%i2,	[%l7 + 0x42]
	movn	%xcc,	%o1,	%g6
	faligndata	%f12,	%f10,	%f4
	movneg	%xcc,	%i0,	%g1
	andn	%i1,	0x17E4,	%i3
	ldsh	[%l7 + 0x52],	%l2
	fpadd16s	%f11,	%f0,	%f6
	edge32	%l5,	%o5,	%l4
	stb	%l1,	[%l7 + 0x0B]
	fmovdl	%icc,	%f12,	%f5
	stx	%g7,	[%l7 + 0x10]
	fcmpd	%fcc2,	%f2,	%f2
	and	%g2,	%i6,	%o0
	movle	%icc,	%o4,	%g4
	orncc	%o6,	0x05B2,	%i4
	subcc	%l6,	%o3,	%l0
	or	%g3,	%o2,	%i7
	fabss	%f8,	%f5
	sra	%g5,	%o7,	%l3
	movge	%icc,	%i2,	%o1
	fcmple16	%f4,	%f14,	%i5
	array32	%i0,	%g6,	%g1
	save %i3, %l2, %l5
	or	%o5,	%l4,	%l1
	stb	%g7,	[%l7 + 0x46]
	sdivx	%i1,	0x1AE7,	%g2
	fnot2	%f14,	%f2
	add	%o0,	0x064D,	%o4
	fcmpeq32	%f6,	%f4,	%g4
	fmovsvc	%xcc,	%f13,	%f12
	sdivx	%i6,	0x01A2,	%o6
	fmovsvs	%icc,	%f14,	%f0
	edge32l	%l6,	%i4,	%l0
	array16	%o3,	%o2,	%i7
	mulscc	%g5,	0x1BA2,	%g3
	edge8	%l3,	%i2,	%o1
	sdivx	%o7,	0x190D,	%i5
	movvs	%xcc,	%i0,	%g1
	fpadd32s	%f8,	%f9,	%f14
	add	%g6,	%i3,	%l2
	movpos	%icc,	%o5,	%l4
	xnorcc	%l5,	0x1748,	%g7
	mulx	%i1,	%g2,	%o0
	edge16n	%o4,	%l1,	%g4
	lduh	[%l7 + 0x28],	%o6
	orncc	%i6,	%l6,	%l0
	ldsb	[%l7 + 0x6C],	%i4
	fmovsg	%xcc,	%f10,	%f7
	stx	%o3,	[%l7 + 0x50]
	xnor	%o2,	%g5,	%g3
	mulscc	%i7,	0x1B61,	%i2
	popc	0x1631,	%l3
	orcc	%o1,	%o7,	%i0
	edge8l	%i5,	%g6,	%g1
	mulscc	%l2,	%o5,	%i3
	movle	%xcc,	%l4,	%l5
	sth	%g7,	[%l7 + 0x78]
	subcc	%i1,	0x038C,	%o0
	movvc	%xcc,	%o4,	%l1
	edge8n	%g4,	%g2,	%o6
	fmovrdlz	%i6,	%f12,	%f2
	ldd	[%l7 + 0x58],	%i6
	movl	%xcc,	%l0,	%o3
	or	%i4,	0x1769,	%o2
	fmovrdlz	%g3,	%f2,	%f12
	movge	%icc,	%i7,	%g5
	movrgz	%i2,	0x355,	%o1
	stx	%o7,	[%l7 + 0x20]
	movrne	%i0,	%i5,	%g6
	move	%icc,	%g1,	%l2
	edge16	%o5,	%i3,	%l4
	andncc	%l3,	%g7,	%l5
	xnor	%i1,	0x11FA,	%o4
	movg	%icc,	%l1,	%o0
	xorcc	%g4,	%g2,	%i6
	sllx	%l6,	%l0,	%o3
	mova	%xcc,	%o6,	%o2
	st	%f4,	[%l7 + 0x70]
	ldd	[%l7 + 0x28],	%f8
	edge16l	%i4,	%g3,	%i7
	srax	%i2,	0x12,	%g5
	sll	%o7,	0x16,	%i0
	movcc	%icc,	%o1,	%g6
	st	%f9,	[%l7 + 0x54]
	fmovrslez	%i5,	%f12,	%f15
	sdiv	%l2,	0x0B86,	%g1
	move	%xcc,	%o5,	%l4
	fpmerge	%f9,	%f6,	%f8
	andn	%l3,	0x080F,	%g7
	fmovdvc	%xcc,	%f6,	%f2
	array32	%l5,	%i1,	%i3
	alignaddrl	%l1,	%o4,	%o0
	fzeros	%f8
	andcc	%g4,	%i6,	%l6
	sth	%l0,	[%l7 + 0x6C]
	edge16ln	%g2,	%o6,	%o3
	orncc	%i4,	0x1A6C,	%g3
	smulcc	%o2,	%i2,	%i7
	array8	%o7,	%g5,	%i0
	edge8	%o1,	%i5,	%l2
	movvc	%xcc,	%g6,	%o5
	move	%xcc,	%g1,	%l4
	fmovdn	%xcc,	%f1,	%f0
	xnor	%l3,	%l5,	%g7
	movge	%icc,	%i1,	%l1
	movcs	%icc,	%i3,	%o0
	smulcc	%g4,	0x1061,	%o4
	udivx	%l6,	0x01BF,	%l0
	movrlez	%g2,	%i6,	%o3
	fpackfix	%f4,	%f0
	alignaddrl	%i4,	%g3,	%o6
	fmovda	%xcc,	%f10,	%f8
	sll	%o2,	%i7,	%i2
	movvc	%icc,	%g5,	%i0
	stb	%o1,	[%l7 + 0x63]
	movg	%icc,	%i5,	%l2
	alignaddr	%g6,	%o5,	%o7
	fnors	%f8,	%f8,	%f5
	lduw	[%l7 + 0x68],	%l4
	fxor	%f14,	%f2,	%f2
	ldsh	[%l7 + 0x7C],	%l3
	array16	%l5,	%g1,	%i1
	subc	%l1,	0x17DD,	%g7
	fcmped	%fcc1,	%f10,	%f4
	edge32ln	%i3,	%o0,	%o4
	array8	%g4,	%l6,	%g2
	ldx	[%l7 + 0x70],	%i6
	umul	%l0,	0x0104,	%o3
	udiv	%i4,	0x0F8D,	%g3
	fmovrdlez	%o6,	%f2,	%f6
	movleu	%icc,	%o2,	%i7
	ld	[%l7 + 0x5C],	%f10
	array8	%g5,	%i2,	%o1
	subc	%i0,	0x05D6,	%l2
	movrlz	%g6,	0x15F,	%i5
	lduw	[%l7 + 0x68],	%o5
	fzero	%f2
	movneg	%xcc,	%l4,	%l3
	fmovsgu	%icc,	%f11,	%f15
	fmovrslez	%l5,	%f7,	%f5
	fmovrsgz	%o7,	%f11,	%f13
	edge32	%g1,	%l1,	%g7
	alignaddr	%i1,	%i3,	%o4
	movl	%xcc,	%o0,	%g4
	movg	%xcc,	%l6,	%g2
	fornot2	%f2,	%f8,	%f8
	fpsub16	%f8,	%f12,	%f10
	stb	%l0,	[%l7 + 0x2E]
	umul	%o3,	0x19EA,	%i6
	stx	%i4,	[%l7 + 0x50]
	std	%f2,	[%l7 + 0x48]
	subccc	%o6,	0x1C87,	%g3
	ldsb	[%l7 + 0x39],	%o2
	fsrc1	%f14,	%f2
	subcc	%i7,	%g5,	%i2
	ldub	[%l7 + 0x71],	%i0
	edge16n	%l2,	%g6,	%i5
	movre	%o1,	%o5,	%l4
	movcs	%xcc,	%l3,	%l5
	sethi	0x0278,	%g1
	restore %l1, %o7, %g7
	edge16n	%i1,	%i3,	%o0
	movrne	%o4,	%l6,	%g4
	movle	%xcc,	%g2,	%l0
	fpadd16s	%f3,	%f9,	%f0
	or	%o3,	0x1840,	%i6
	edge8l	%i4,	%g3,	%o2
	movvs	%xcc,	%i7,	%g5
	smulcc	%o6,	%i0,	%i2
	ldd	[%l7 + 0x20],	%l2
	srl	%i5,	0x19,	%o1
	edge16l	%o5,	%g6,	%l4
	array32	%l5,	%g1,	%l3
	edge16l	%l1,	%g7,	%o7
	movpos	%xcc,	%i3,	%i1
	fnot1	%f8,	%f12
	popc	%o0,	%l6
	addccc	%o4,	%g2,	%l0
	sub	%o3,	%i6,	%g4
	addccc	%i4,	%o2,	%i7
	xorcc	%g5,	%o6,	%g3
	movle	%xcc,	%i2,	%i0
	sdivcc	%i5,	0x171C,	%o1
	subcc	%o5,	%g6,	%l2
	array16	%l4,	%g1,	%l5
	sdivx	%l1,	0x0761,	%g7
	lduh	[%l7 + 0x2C],	%l3
	move	%xcc,	%o7,	%i1
	fmovsgu	%xcc,	%f1,	%f6
	fmovsne	%icc,	%f4,	%f6
	srl	%i3,	%o0,	%o4
	st	%f0,	[%l7 + 0x44]
	siam	0x2
	ldub	[%l7 + 0x37],	%l6
	array16	%l0,	%g2,	%i6
	movrlez	%g4,	%i4,	%o2
	lduh	[%l7 + 0x14],	%i7
	srl	%o3,	%o6,	%g3
	subc	%i2,	0x01E1,	%i0
	sll	%i5,	%g5,	%o1
	movpos	%xcc,	%g6,	%o5
	smul	%l2,	%g1,	%l5
	fmovrslez	%l4,	%f4,	%f13
	edge32	%l1,	%g7,	%l3
	mulscc	%o7,	%i1,	%o0
	fpmerge	%f12,	%f1,	%f8
	ldd	[%l7 + 0x20],	%f6
	fpack16	%f14,	%f2
	popc	0x1CA2,	%o4
	movrgez	%l6,	%i3,	%l0
	std	%f2,	[%l7 + 0x08]
	fmovrsgez	%g2,	%f10,	%f9
	subc	%g4,	0x19A5,	%i6
	lduw	[%l7 + 0x10],	%o2
	edge32	%i4,	%o3,	%i7
	umul	%o6,	%i2,	%g3
	movcs	%xcc,	%i5,	%i0
	fmovrdlz	%o1,	%f0,	%f8
	sdivcc	%g5,	0x0AB0,	%g6
	smulcc	%o5,	%g1,	%l5
	movcs	%icc,	%l2,	%l1
	save %l4, 0x107F, %g7
	ldsb	[%l7 + 0x1D],	%o7
	fands	%f14,	%f11,	%f0
	siam	0x5
	ldx	[%l7 + 0x48],	%l3
	alignaddr	%o0,	%i1,	%o4
	edge16l	%i3,	%l6,	%g2
	sth	%g4,	[%l7 + 0x74]
	array8	%l0,	%o2,	%i4
	add	%i6,	%o3,	%o6
	smulcc	%i7,	0x0DA8,	%g3
	addccc	%i2,	%i5,	%o1
	alignaddr	%i0,	%g6,	%g5
	movpos	%xcc,	%g1,	%l5
	ldd	[%l7 + 0x60],	%f8
	movleu	%xcc,	%l2,	%o5
	movcc	%icc,	%l4,	%l1
	array32	%g7,	%l3,	%o0
	fone	%f8
	edge32l	%i1,	%o7,	%o4
	orncc	%i3,	0x0BC6,	%l6
	lduw	[%l7 + 0x60],	%g4
	fmul8x16au	%f7,	%f14,	%f6
	alignaddrl	%g2,	%l0,	%o2
	lduw	[%l7 + 0x20],	%i6
	smulcc	%o3,	%i4,	%i7
	fmovrsne	%o6,	%f12,	%f11
	sdiv	%i2,	0x1F08,	%i5
	umulcc	%o1,	%i0,	%g6
	movpos	%xcc,	%g5,	%g1
	fabsd	%f12,	%f8
	sdivx	%l5,	0x0B92,	%g3
	xor	%l2,	0x1FAE,	%o5
	fmovrsgz	%l4,	%f1,	%f7
	fmovdleu	%icc,	%f12,	%f11
	subcc	%g7,	%l3,	%l1
	movl	%icc,	%i1,	%o7
	movle	%icc,	%o0,	%o4
	edge16	%i3,	%g4,	%l6
	lduw	[%l7 + 0x30],	%l0
	udivcc	%o2,	0x035B,	%g2
	subccc	%o3,	0x0F3E,	%i4
	ldd	[%l7 + 0x10],	%i6
	udivx	%o6,	0x1A2E,	%i7
	popc	%i5,	%o1
	movvc	%icc,	%i0,	%g6
	movrlz	%i2,	%g5,	%g1
	fors	%f12,	%f11,	%f5
	fcmps	%fcc3,	%f3,	%f7
	movpos	%icc,	%l5,	%l2
	movleu	%xcc,	%o5,	%g3
	edge8l	%l4,	%g7,	%l1
	stw	%i1,	[%l7 + 0x60]
	udiv	%o7,	0x1C12,	%o0
	orncc	%o4,	%l3,	%i3
	movrlez	%l6,	0x32F,	%g4
	fmovdpos	%xcc,	%f8,	%f11
	smul	%l0,	%g2,	%o3
	sll	%o2,	%i4,	%o6
	orcc	%i6,	%i7,	%o1
	smul	%i5,	0x04ED,	%i0
	movvs	%xcc,	%i2,	%g6
	lduw	[%l7 + 0x10],	%g1
	movvc	%xcc,	%l5,	%g5
	fornot2s	%f8,	%f6,	%f12
	add	%o5,	%g3,	%l4
	fnegd	%f4,	%f4
	xnorcc	%g7,	%l1,	%l2
	array32	%o7,	%o0,	%o4
	fmovrdne	%i1,	%f10,	%f10
	subc	%l3,	%l6,	%i3
	fmovdcs	%icc,	%f5,	%f9
	sth	%l0,	[%l7 + 0x4C]
	smul	%g2,	0x10DB,	%o3
	lduh	[%l7 + 0x08],	%g4
	fcmple32	%f14,	%f0,	%o2
	addc	%o6,	%i6,	%i7
	fpmerge	%f9,	%f2,	%f14
	xorcc	%o1,	0x0753,	%i4
	fnegs	%f10,	%f5
	fmovrsgez	%i5,	%f15,	%f14
	fornot2	%f14,	%f2,	%f2
	xor	%i0,	%i2,	%g6
	xor	%l5,	0x0961,	%g1
	fcmps	%fcc3,	%f3,	%f8
	edge16	%o5,	%g5,	%g3
	popc	0x0D61,	%g7
	movrne	%l1,	%l2,	%o7
	addcc	%o0,	0x1DC9,	%o4
	fmovs	%f10,	%f0
	addcc	%l4,	%i1,	%l6
	movrlz	%l3,	0x2C4,	%l0
	edge8ln	%g2,	%o3,	%g4
	fmul8ulx16	%f4,	%f0,	%f2
	fmovdn	%icc,	%f0,	%f6
	fmovdn	%icc,	%f11,	%f15
	fmovde	%icc,	%f9,	%f11
	and	%i3,	0x1150,	%o6
	fpack32	%f4,	%f0,	%f14
	sll	%o2,	0x11,	%i6
	or	%o1,	0x0052,	%i4
	popc	0x0F07,	%i7
	andcc	%i5,	%i0,	%g6
	add	%i2,	%l5,	%g1
	std	%f4,	[%l7 + 0x48]
	smulcc	%o5,	0x1B29,	%g3
	ldsw	[%l7 + 0x54],	%g5
	fpsub16	%f8,	%f2,	%f8
	movcc	%icc,	%g7,	%l1
	xnor	%o7,	0x1DA3,	%o0
	orn	%o4,	%l4,	%l2
	fzeros	%f12
	stb	%l6,	[%l7 + 0x11]
	smul	%l3,	%l0,	%g2
	edge8	%i1,	%o3,	%g4
	edge32n	%o6,	%o2,	%i3
	edge32l	%o1,	%i4,	%i6
	movrgez	%i7,	0x1BC,	%i5
	array32	%i0,	%g6,	%i2
	fcmple16	%f14,	%f2,	%l5
	fmovdg	%xcc,	%f13,	%f3
	movg	%icc,	%g1,	%g3
	movneg	%icc,	%o5,	%g5
	movn	%icc,	%g7,	%l1
	alignaddr	%o0,	%o4,	%o7
	ldsw	[%l7 + 0x48],	%l4
	movge	%xcc,	%l6,	%l2
	fmovrdlez	%l0,	%f8,	%f14
	subccc	%g2,	%l3,	%i1
	movge	%icc,	%o3,	%g4
	fandnot2	%f14,	%f4,	%f2
	udivcc	%o2,	0x0809,	%i3
	ldd	[%l7 + 0x20],	%o0
	edge16n	%o6,	%i4,	%i6
	movle	%icc,	%i7,	%i0
	fnot2s	%f14,	%f1
	fnegs	%f14,	%f10
	movgu	%xcc,	%i5,	%g6
	std	%f4,	[%l7 + 0x78]
	or	%i2,	%g1,	%g3
	st	%f4,	[%l7 + 0x70]
	movpos	%icc,	%o5,	%g5
	stw	%l5,	[%l7 + 0x34]
	movne	%xcc,	%l1,	%o0
	stb	%g7,	[%l7 + 0x1C]
	std	%f8,	[%l7 + 0x18]
	movrlz	%o4,	%o7,	%l4
	addcc	%l6,	%l0,	%g2
	edge32ln	%l2,	%l3,	%o3
	stb	%g4,	[%l7 + 0x6B]
	edge32n	%o2,	%i1,	%i3
	srax	%o1,	0x0B,	%i4
	udivcc	%o6,	0x01AD,	%i6
	xnorcc	%i7,	0x07DE,	%i0
	fmovrdlez	%i5,	%f0,	%f0
	fmovdn	%icc,	%f11,	%f6
	mova	%icc,	%i2,	%g1
	fone	%f10
	alignaddr	%g3,	%g6,	%g5
	edge8l	%l5,	%l1,	%o0
	save %o5, 0x187F, %g7
	movrgz	%o7,	%l4,	%o4
	edge32	%l6,	%g2,	%l0
	fmovdn	%xcc,	%f0,	%f7
	edge16n	%l2,	%l3,	%o3
	fnegd	%f4,	%f8
	subccc	%o2,	0x0F37,	%g4
	xor	%i1,	0x1F10,	%i3
	fnands	%f2,	%f15,	%f2
	sdiv	%o1,	0x0274,	%i4
	fandnot2	%f6,	%f12,	%f4
	fcmpne32	%f12,	%f0,	%o6
	ld	[%l7 + 0x6C],	%f13
	fmovrsgez	%i7,	%f1,	%f5
	xor	%i0,	0x0868,	%i5
	smul	%i6,	%i2,	%g3
	fcmpne32	%f10,	%f0,	%g1
	srl	%g5,	%l5,	%l1
	fcmped	%fcc0,	%f10,	%f8
	subc	%o0,	%g6,	%g7
	array8	%o7,	%o5,	%o4
	movcs	%icc,	%l6,	%l4
	edge8n	%g2,	%l0,	%l3
	std	%f4,	[%l7 + 0x70]
	fmovrdlz	%l2,	%f8,	%f8
	fcmps	%fcc2,	%f2,	%f10
	ldd	[%l7 + 0x30],	%o2
	xnorcc	%g4,	0x19F9,	%i1
	stb	%i3,	[%l7 + 0x35]
	fxor	%f14,	%f12,	%f0
	movrgez	%o3,	%i4,	%o6
	mulscc	%o1,	%i0,	%i5
	ldd	[%l7 + 0x70],	%f2
	srlx	%i7,	%i6,	%g3
	fmovsgu	%xcc,	%f13,	%f11
	movne	%icc,	%g1,	%g5
	sdiv	%i2,	0x05A3,	%l1
	movcc	%icc,	%o0,	%g6
	movre	%l5,	%o7,	%g7
	fmovdvc	%icc,	%f3,	%f5
	movne	%icc,	%o5,	%l6
	std	%f10,	[%l7 + 0x68]
	array16	%l4,	%g2,	%l0
	fandnot1s	%f9,	%f8,	%f7
	save %o4, 0x12B2, %l3
	ldx	[%l7 + 0x50],	%l2
	orn	%o2,	%i1,	%g4
	restore %o3, %i4, %i3
	stb	%o1,	[%l7 + 0x2E]
	edge32	%i0,	%i5,	%i7
	edge32n	%o6,	%g3,	%i6
	ldd	[%l7 + 0x38],	%f8
	ldx	[%l7 + 0x08],	%g5
	stw	%g1,	[%l7 + 0x0C]
	xorcc	%l1,	%o0,	%i2
	siam	0x5
	st	%f6,	[%l7 + 0x5C]
	umul	%g6,	0x0036,	%l5
	edge8l	%g7,	%o5,	%l6
	subcc	%o7,	%l4,	%l0
	fexpand	%f9,	%f0
	ldx	[%l7 + 0x78],	%o4
	popc	0x1E0E,	%g2
	fnor	%f10,	%f2,	%f8
	sub	%l3,	%l2,	%o2
	edge8n	%g4,	%o3,	%i4
	fpsub16s	%f8,	%f4,	%f0
	and	%i3,	%o1,	%i0
	fmovdvs	%icc,	%f14,	%f10
	ldx	[%l7 + 0x68],	%i5
	fmul8x16au	%f12,	%f15,	%f10
	movcs	%xcc,	%i7,	%o6
	alignaddr	%g3,	%i1,	%g5
	mova	%icc,	%g1,	%l1
	movrgz	%i6,	0x0CB,	%i2
	fmovs	%f13,	%f4
	addccc	%g6,	%l5,	%g7
	movvc	%icc,	%o0,	%o5
	edge32ln	%o7,	%l6,	%l0
	array16	%l4,	%o4,	%g2
	ldsb	[%l7 + 0x77],	%l3
	movle	%xcc,	%l2,	%g4
	udiv	%o3,	0x177B,	%o2
	st	%f4,	[%l7 + 0x18]
	and	%i4,	%o1,	%i0
	movn	%xcc,	%i3,	%i7
	fmovrdgz	%i5,	%f12,	%f4
	ldx	[%l7 + 0x78],	%o6
	orncc	%i1,	0x1A8F,	%g3
	movge	%xcc,	%g1,	%g5
	subc	%i6,	%i2,	%l1
	fmovsne	%icc,	%f4,	%f11
	fmovdleu	%icc,	%f1,	%f15
	ldsw	[%l7 + 0x60],	%l5
	orn	%g7,	0x1634,	%o0
	mova	%icc,	%o5,	%o7
	sdivcc	%l6,	0x0E62,	%g6
	udivcc	%l4,	0x0080,	%o4
	movne	%xcc,	%l0,	%g2
	edge16	%l3,	%g4,	%o3
	fxors	%f7,	%f5,	%f7
	addc	%l2,	0x0FF6,	%i4
	andn	%o1,	0x14AE,	%i0
	fmovda	%icc,	%f5,	%f1
	addccc	%o2,	%i3,	%i7
	movrne	%o6,	%i1,	%i5
	andn	%g3,	0x0923,	%g5
	movrgz	%g1,	0x1B9,	%i6
	mova	%icc,	%i2,	%l1
	ldub	[%l7 + 0x7F],	%g7
	movleu	%icc,	%l5,	%o5
	pdist	%f8,	%f6,	%f8
	edge8	%o0,	%o7,	%g6
	sdiv	%l6,	0x1E65,	%o4
	array8	%l4,	%g2,	%l3
	movrne	%g4,	0x3F3,	%l0
	ldx	[%l7 + 0x50],	%o3
	sth	%l2,	[%l7 + 0x6A]
	array8	%o1,	%i4,	%i0
	restore %i3, 0x1095, %o2
	movge	%xcc,	%o6,	%i7
	srlx	%i5,	%g3,	%i1
	stb	%g5,	[%l7 + 0x41]
	edge16	%i6,	%g1,	%l1
	srl	%i2,	0x16,	%g7
	and	%l5,	%o0,	%o5
	edge8	%o7,	%g6,	%l6
	mova	%xcc,	%l4,	%o4
	fxors	%f12,	%f14,	%f6
	faligndata	%f12,	%f6,	%f2
	fmovdge	%xcc,	%f14,	%f9
	ldsh	[%l7 + 0x2C],	%l3
	addcc	%g4,	%l0,	%o3
	edge8l	%g2,	%l2,	%o1
	alignaddrl	%i4,	%i3,	%o2
	sra	%o6,	0x14,	%i7
	movne	%xcc,	%i5,	%g3
	fnot2	%f2,	%f14
	movle	%icc,	%i0,	%i1
	movrne	%i6,	%g5,	%g1
	subcc	%i2,	0x17A7,	%l1
	movle	%xcc,	%g7,	%l5
	restore %o5, 0x0A05, %o7
	addc	%o0,	%g6,	%l6
	movrgez	%o4,	0x194,	%l4
	movrlz	%l3,	0x111,	%g4
	fmovrdlz	%l0,	%f6,	%f14
	fmovsne	%xcc,	%f5,	%f11
	edge8ln	%g2,	%l2,	%o3
	movrlz	%o1,	%i3,	%i4
	movne	%xcc,	%o6,	%o2
	movrlez	%i5,	%g3,	%i0
	ldd	[%l7 + 0x68],	%f4
	fmul8ulx16	%f6,	%f0,	%f8
	sdiv	%i7,	0x0EBD,	%i1
	fmovdne	%icc,	%f13,	%f8
	edge16l	%i6,	%g5,	%g1
	mova	%xcc,	%l1,	%i2
	movleu	%icc,	%g7,	%o5
	ld	[%l7 + 0x44],	%f8
	movg	%xcc,	%l5,	%o0
	array16	%o7,	%g6,	%o4
	st	%f0,	[%l7 + 0x50]
	alignaddrl	%l6,	%l4,	%g4
	fxor	%f0,	%f2,	%f10
	fmovsne	%icc,	%f3,	%f13
	ldsh	[%l7 + 0x58],	%l3
	fzeros	%f1
	subccc	%g2,	%l0,	%o3
	alignaddrl	%l2,	%i3,	%o1
	and	%i4,	%o6,	%o2
	sethi	0x06B6,	%g3
	edge16ln	%i5,	%i7,	%i0
	fmovdg	%icc,	%f12,	%f5
	addc	%i6,	0x1D46,	%i1
	andcc	%g1,	0x187A,	%g5
	srlx	%l1,	%i2,	%g7
	stw	%o5,	[%l7 + 0x3C]
	andcc	%o0,	0x05DC,	%o7
	fmovdvs	%xcc,	%f1,	%f14
	smul	%l5,	%o4,	%l6
	srax	%g6,	0x12,	%l4
	fmovrdne	%l3,	%f6,	%f14
	subc	%g4,	%g2,	%l0
	fmovrsgz	%l2,	%f11,	%f6
	fcmpeq16	%f14,	%f14,	%i3
	ldub	[%l7 + 0x58],	%o3
	smulcc	%i4,	0x18D5,	%o1
	save %o6, 0x0567, %o2
	lduh	[%l7 + 0x18],	%i5
	orcc	%i7,	0x00B5,	%i0
	fmovrdne	%g3,	%f12,	%f8
	movcc	%icc,	%i6,	%g1
	sdivx	%i1,	0x0DCC,	%l1
	edge32ln	%g5,	%i2,	%g7
	and	%o5,	%o7,	%l5
	movrlz	%o0,	%l6,	%o4
	ldx	[%l7 + 0x48],	%g6
	udivcc	%l3,	0x103B,	%l4
	fcmpne32	%f2,	%f10,	%g4
	edge16	%l0,	%g2,	%l2
	edge16l	%o3,	%i4,	%i3
	array32	%o1,	%o6,	%o2
	ldub	[%l7 + 0x39],	%i7
	stx	%i5,	[%l7 + 0x58]
	subcc	%g3,	%i0,	%i6
	subcc	%i1,	%g1,	%l1
	stx	%i2,	[%l7 + 0x30]
	fnot1s	%f15,	%f2
	fnands	%f6,	%f14,	%f4
	ldub	[%l7 + 0x38],	%g7
	orn	%o5,	0x03EE,	%g5
	fmovdcs	%icc,	%f11,	%f13
	std	%f4,	[%l7 + 0x40]
	andn	%l5,	%o7,	%l6
	fsrc2	%f0,	%f4
	subccc	%o4,	0x107D,	%o0
	movpos	%xcc,	%l3,	%l4
	movcc	%xcc,	%g6,	%g4
	sra	%g2,	%l2,	%l0
	fcmped	%fcc3,	%f10,	%f12
	fmovdg	%icc,	%f10,	%f10
	fabss	%f1,	%f3
	edge8	%o3,	%i3,	%i4
	umul	%o1,	%o6,	%o2
	fnor	%f14,	%f0,	%f0
	popc	%i7,	%i5
	sethi	0x1A61,	%i0
	xnor	%g3,	0x1EF8,	%i6
	andcc	%g1,	0x17DB,	%l1
	mulx	%i2,	%i1,	%g7
	sllx	%o5,	0x0C,	%g5
	orcc	%o7,	0x03DC,	%l6
	movgu	%xcc,	%l5,	%o4
	fmovrdne	%o0,	%f0,	%f0
	sdiv	%l3,	0x0C23,	%g6
	addcc	%l4,	0x1F7C,	%g4
	lduh	[%l7 + 0x58],	%l2
	ldub	[%l7 + 0x6A],	%g2
	smulcc	%o3,	0x1468,	%l0
	fmovsl	%xcc,	%f0,	%f6
	movgu	%xcc,	%i3,	%i4
	ldsh	[%l7 + 0x6E],	%o6
	edge8l	%o2,	%o1,	%i7
	movleu	%xcc,	%i5,	%g3
	ldsh	[%l7 + 0x6E],	%i0
	alignaddr	%i6,	%g1,	%l1
	fxnor	%f2,	%f12,	%f0
	movn	%xcc,	%i2,	%i1
	restore %g7, %o5, %o7
	array8	%g5,	%l6,	%l5
	fmul8x16al	%f4,	%f15,	%f8
	ldd	[%l7 + 0x78],	%o0
	smulcc	%o4,	%g6,	%l4
	srax	%l3,	%l2,	%g4
	stw	%g2,	[%l7 + 0x34]
	umulcc	%l0,	%i3,	%i4
	xor	%o3,	0x1C40,	%o6
	fmovsgu	%icc,	%f12,	%f1
	alignaddrl	%o2,	%o1,	%i7
	subcc	%i5,	0x1C6B,	%i0
	xnor	%g3,	%i6,	%l1
	restore %g1, %i1, %g7
	fnand	%f0,	%f6,	%f10
	ld	[%l7 + 0x40],	%f4
	movcs	%xcc,	%o5,	%i2
	xnorcc	%o7,	0x15C2,	%g5
	orn	%l6,	0x15B8,	%o0
	fnand	%f12,	%f2,	%f6
	edge8ln	%o4,	%l5,	%l4
	andn	%l3,	%g6,	%g4
	xor	%g2,	0x09FC,	%l0
	movrlez	%l2,	%i3,	%o3
	ldsw	[%l7 + 0x3C],	%o6
	or	%i4,	0x19B2,	%o2
	fnot1	%f0,	%f12
	fsrc2s	%f3,	%f14
	edge32l	%i7,	%o1,	%i5
	lduh	[%l7 + 0x1E],	%i0
	or	%g3,	%i6,	%g1
	st	%f2,	[%l7 + 0x40]
	fmovsne	%xcc,	%f11,	%f11
	fzero	%f12
	fandnot2	%f6,	%f6,	%f8
	edge32ln	%l1,	%g7,	%o5
	sra	%i1,	0x00,	%o7
	stw	%g5,	[%l7 + 0x5C]
	save %i2, 0x1BC9, %o0
	sth	%l6,	[%l7 + 0x12]
	andncc	%l5,	%l4,	%l3
	popc	0x0F53,	%o4
	fpmerge	%f13,	%f3,	%f10
	fmovrsne	%g6,	%f15,	%f15
	ldd	[%l7 + 0x78],	%f10
	fpadd32	%f2,	%f6,	%f0
	xorcc	%g4,	0x02A3,	%l0
	restore %g2, %l2, %i3
	andn	%o6,	%i4,	%o3
	sllx	%o2,	0x17,	%i7
	fpsub32s	%f1,	%f10,	%f4
	stb	%o1,	[%l7 + 0x34]
	edge32	%i5,	%i0,	%g3
	movneg	%icc,	%i6,	%g1
	udivcc	%g7,	0x1DA4,	%l1
	edge16n	%o5,	%o7,	%g5
	st	%f13,	[%l7 + 0x1C]
	add	%i2,	0x03AD,	%i1
	movleu	%xcc,	%o0,	%l5
	udivcc	%l6,	0x1F01,	%l3
	edge16ln	%o4,	%l4,	%g6
	fmovsn	%icc,	%f3,	%f1
	edge8ln	%g4,	%l0,	%l2
	movrlez	%g2,	%i3,	%i4
	subccc	%o3,	%o2,	%i7
	fsrc1	%f0,	%f8
	sth	%o1,	[%l7 + 0x7C]
	srax	%i5,	%o6,	%i0
	movn	%xcc,	%g3,	%i6
	std	%f6,	[%l7 + 0x30]
	mova	%xcc,	%g1,	%g7
	fmovsn	%icc,	%f1,	%f5
	andcc	%l1,	%o5,	%g5
	lduh	[%l7 + 0x7E],	%o7
	movrlez	%i1,	%i2,	%l5
	fmovsleu	%xcc,	%f1,	%f10
	smul	%o0,	%l3,	%l6
	ldsb	[%l7 + 0x10],	%o4
	xnor	%l4,	%g4,	%l0
	subccc	%g6,	%g2,	%l2
	umulcc	%i4,	%i3,	%o2
	alignaddr	%i7,	%o3,	%i5
	fnand	%f12,	%f12,	%f0
	array32	%o6,	%i0,	%o1
	movne	%xcc,	%i6,	%g3
	sub	%g7,	0x09D1,	%l1
	movneg	%icc,	%o5,	%g1
	movleu	%icc,	%g5,	%o7
	st	%f1,	[%l7 + 0x10]
	fabss	%f8,	%f2
	ldx	[%l7 + 0x58],	%i1
	sdivx	%l5,	0x1754,	%o0
	fmovdge	%xcc,	%f4,	%f7
	pdist	%f6,	%f8,	%f2
	fsrc2s	%f13,	%f5
	fmovrdne	%i2,	%f2,	%f4
	restore %l3, 0x039B, %l6
	movcc	%icc,	%o4,	%g4
	ldx	[%l7 + 0x70],	%l0
	ldd	[%l7 + 0x18],	%g6
	fmovdvs	%xcc,	%f6,	%f5
	sethi	0x15A7,	%g2
	fsrc1	%f12,	%f12
	sdiv	%l2,	0x0DA5,	%i4
	movcc	%icc,	%l4,	%i3
	movneg	%xcc,	%i7,	%o3
	fandnot1s	%f0,	%f11,	%f9
	fmul8sux16	%f8,	%f12,	%f10
	xnor	%i5,	%o6,	%o2
	movrgz	%i0,	0x307,	%i6
	fmovdvc	%xcc,	%f3,	%f3
	smul	%o1,	0x1BB5,	%g3
	edge16n	%g7,	%o5,	%g1
	sdivcc	%g5,	0x12B1,	%l1
	mulx	%i1,	%o7,	%o0
	srl	%i2,	0x04,	%l3
	fornot2s	%f10,	%f4,	%f15
	alignaddrl	%l6,	%l5,	%o4
	edge16l	%l0,	%g4,	%g6
	movg	%xcc,	%l2,	%i4
	movle	%xcc,	%l4,	%g2
	subcc	%i7,	0x0AA9,	%i3
	fmuld8ulx16	%f13,	%f2,	%f14
	edge16n	%i5,	%o6,	%o2
	save %o3, %i0, %i6
	xnorcc	%o1,	0x0EFD,	%g7
	movrlz	%g3,	0x15E,	%g1
	fmuld8ulx16	%f2,	%f9,	%f2
	fcmple32	%f0,	%f2,	%o5
	restore %g5, %l1, %i1
	fmovrdgez	%o0,	%f12,	%f12
	edge8l	%o7,	%l3,	%i2
	umulcc	%l6,	%l5,	%o4
	fmovrde	%l0,	%f2,	%f8
	movle	%icc,	%g6,	%l2
	std	%f8,	[%l7 + 0x08]
	fmovdcs	%icc,	%f13,	%f5
	xnorcc	%g4,	%l4,	%g2
	movrlez	%i7,	%i4,	%i5
	fmovscc	%xcc,	%f5,	%f13
	movleu	%xcc,	%i3,	%o2
	movg	%icc,	%o3,	%o6
	fmovdl	%xcc,	%f13,	%f1
	ldd	[%l7 + 0x20],	%i0
	subcc	%o1,	0x045E,	%g7
	subc	%g3,	0x1621,	%g1
	sub	%i6,	0x0038,	%o5
	std	%f2,	[%l7 + 0x70]
	edge16ln	%l1,	%g5,	%o0
	alignaddr	%o7,	%i1,	%i2
	xorcc	%l6,	0x10DB,	%l5
	ldsh	[%l7 + 0x16],	%l3
	movrgez	%l0,	0x126,	%o4
	movcs	%xcc,	%g6,	%g4
	sethi	0x029B,	%l4
	xnor	%l2,	%i7,	%i4
	edge16l	%i5,	%i3,	%g2
	ldsh	[%l7 + 0x7C],	%o3
	addccc	%o2,	%i0,	%o1
	array16	%g7,	%o6,	%g3
	edge8ln	%g1,	%o5,	%i6
	ldd	[%l7 + 0x28],	%l0
	edge32	%o0,	%g5,	%i1
	fmul8ulx16	%f8,	%f8,	%f6
	edge32l	%o7,	%i2,	%l6
	fcmpes	%fcc3,	%f1,	%f11
	movrgz	%l5,	0x057,	%l0
	edge8l	%o4,	%g6,	%g4
	subc	%l3,	%l4,	%i7
	movcs	%xcc,	%l2,	%i4
	stx	%i3,	[%l7 + 0x28]
	movneg	%xcc,	%g2,	%i5
	move	%xcc,	%o2,	%i0
	lduw	[%l7 + 0x78],	%o1
	movge	%icc,	%g7,	%o3
	movcc	%xcc,	%g3,	%o6
	ldub	[%l7 + 0x3D],	%o5
	fandnot2	%f8,	%f2,	%f2
	ldsb	[%l7 + 0x11],	%g1
	edge32	%l1,	%i6,	%g5
	ldx	[%l7 + 0x38],	%i1
	fsrc2	%f2,	%f6
	ldsb	[%l7 + 0x5E],	%o0
	umul	%o7,	0x1357,	%l6
	movrlz	%l5,	0x306,	%l0
	srax	%i2,	0x0E,	%g6
	movl	%icc,	%o4,	%l3
	ldd	[%l7 + 0x20],	%f8
	fmovsne	%xcc,	%f13,	%f13
	xorcc	%g4,	0x1A16,	%l4
	movl	%xcc,	%i7,	%l2
	movre	%i4,	%i3,	%i5
	move	%icc,	%o2,	%i0
	fcmpd	%fcc1,	%f2,	%f14
	ldd	[%l7 + 0x28],	%o0
	movne	%xcc,	%g2,	%g7
	xnor	%o3,	0x0B6D,	%o6
	xnorcc	%o5,	0x1999,	%g1
	lduh	[%l7 + 0x0A],	%g3
	fornot2s	%f1,	%f2,	%f5
	fnands	%f10,	%f13,	%f1
	array8	%l1,	%i6,	%g5
	edge16	%i1,	%o7,	%o0
	edge16l	%l6,	%l5,	%l0
	lduh	[%l7 + 0x22],	%i2
	fmovd	%f2,	%f12
	orcc	%o4,	%g6,	%g4
	movvc	%icc,	%l4,	%i7
	movl	%xcc,	%l2,	%i4
	fand	%f6,	%f10,	%f0
	movcc	%icc,	%i3,	%l3
	edge8	%i5,	%o2,	%i0
	ld	[%l7 + 0x78],	%f3
	array32	%g2,	%o1,	%g7
	movvs	%xcc,	%o6,	%o3
	smul	%o5,	0x016E,	%g3
	sethi	0x17A8,	%l1
	edge16l	%g1,	%i6,	%i1
	add	%g5,	%o7,	%o0
	xnorcc	%l5,	0x1363,	%l6
	xnor	%l0,	0x1860,	%i2
	ldub	[%l7 + 0x0D],	%g6
	fexpand	%f4,	%f2
	andcc	%g4,	0x11A1,	%o4
	xorcc	%i7,	%l4,	%i4
	save %l2, 0x11D1, %i3
	fxnors	%f10,	%f1,	%f10
	pdist	%f10,	%f4,	%f2
	fpadd16s	%f10,	%f12,	%f9
	subc	%i5,	0x10B8,	%o2
	ldsw	[%l7 + 0x10],	%i0
	edge16n	%g2,	%o1,	%g7
	subcc	%o6,	%l3,	%o3
	fmovrsne	%g3,	%f5,	%f10
	array32	%l1,	%g1,	%i6
	sdiv	%i1,	0x1286,	%o5
	fones	%f2
	addccc	%g5,	%o0,	%l5
	xnorcc	%l6,	0x1CBF,	%o7
	movrgz	%l0,	%g6,	%i2
	fcmpne32	%f8,	%f2,	%o4
	array8	%i7,	%l4,	%i4
	udiv	%g4,	0x022E,	%i3
	srlx	%i5,	%o2,	%i0
	sub	%l2,	%o1,	%g7
	move	%icc,	%o6,	%l3
	fzero	%f6
	xor	%g2,	%o3,	%l1
	edge8	%g1,	%g3,	%i6
	mulscc	%i1,	0x147A,	%o5
	subccc	%o0,	%g5,	%l6
	subc	%o7,	%l5,	%g6
	srl	%i2,	0x12,	%o4
	fmovdcs	%xcc,	%f5,	%f8
	orncc	%i7,	%l4,	%l0
	subc	%g4,	0x15B0,	%i3
	movg	%icc,	%i4,	%o2
	edge32l	%i5,	%l2,	%o1
	fandnot2	%f0,	%f0,	%f4
	fnot1	%f12,	%f0
	sub	%i0,	%g7,	%o6
	ldsh	[%l7 + 0x60],	%l3
	edge32n	%g2,	%l1,	%o3
	stw	%g1,	[%l7 + 0x44]
	add	%i6,	0x1FF4,	%g3
	sethi	0x0FBD,	%o5
	orncc	%o0,	%i1,	%l6
	movrne	%g5,	%o7,	%l5
	stb	%g6,	[%l7 + 0x78]
	movrgz	%i2,	0x379,	%i7
	or	%o4,	0x1C48,	%l0
	mulx	%g4,	%l4,	%i3
	movcs	%xcc,	%o2,	%i4
	edge8n	%l2,	%o1,	%i5
	movg	%xcc,	%g7,	%i0
	smul	%l3,	0x1C33,	%g2
	ld	[%l7 + 0x44],	%f13
	smulcc	%l1,	0x01D0,	%o6
	fornot1s	%f13,	%f9,	%f7
	udiv	%o3,	0x01C2,	%g1
	andncc	%g3,	%o5,	%i6
	move	%xcc,	%o0,	%i1
	sdivcc	%g5,	0x1558,	%l6
	andn	%l5,	0x0947,	%g6
	movpos	%icc,	%i2,	%o7
	fmovrse	%i7,	%f8,	%f9
	ldsb	[%l7 + 0x7D],	%o4
	mova	%xcc,	%l0,	%l4
	ldd	[%l7 + 0x38],	%f4
	xnor	%i3,	0x0B3F,	%o2
	fnors	%f9,	%f14,	%f12
	edge8n	%i4,	%g4,	%l2
	xorcc	%i5,	0x142E,	%o1
	xorcc	%i0,	%g7,	%g2
	alignaddrl	%l3,	%o6,	%l1
	fcmpne32	%f8,	%f6,	%o3
	movpos	%xcc,	%g1,	%g3
	movle	%icc,	%i6,	%o0
	movcs	%icc,	%o5,	%g5
	for	%f2,	%f2,	%f8
	stb	%i1,	[%l7 + 0x24]
	or	%l5,	%l6,	%i2
	fmovrde	%g6,	%f8,	%f2
	movleu	%icc,	%i7,	%o4
	edge8l	%l0,	%l4,	%o7
	sdivx	%o2,	0x1059,	%i3
	sdivcc	%g4,	0x1791,	%i4
	sth	%l2,	[%l7 + 0x3A]
	fmovsn	%icc,	%f1,	%f13
	alignaddrl	%i5,	%o1,	%i0
	edge16l	%g2,	%g7,	%o6
	fcmpeq16	%f4,	%f10,	%l3
	smulcc	%l1,	0x1C3D,	%g1
	movpos	%xcc,	%o3,	%g3
	fpsub32s	%f0,	%f13,	%f10
	xorcc	%i6,	%o5,	%g5
	std	%f2,	[%l7 + 0x40]
	ldub	[%l7 + 0x40],	%i1
	st	%f4,	[%l7 + 0x3C]
	sdivcc	%o0,	0x13D2,	%l6
	edge32l	%i2,	%g6,	%l5
	ldsw	[%l7 + 0x48],	%o4
	restore %l0, %l4, %o7
	fmovsle	%icc,	%f10,	%f3
	fmovdle	%xcc,	%f4,	%f9
	lduh	[%l7 + 0x4C],	%o2
	addccc	%i3,	0x0FE7,	%g4
	fmovsn	%icc,	%f5,	%f13
	addc	%i4,	0x0290,	%i7
	edge32	%i5,	%o1,	%i0
	sdivx	%l2,	0x1F85,	%g7
	fpadd32	%f2,	%f4,	%f8
	udiv	%g2,	0x0109,	%o6
	ld	[%l7 + 0x28],	%f4
	xorcc	%l3,	%g1,	%o3
	sth	%l1,	[%l7 + 0x22]
	st	%f0,	[%l7 + 0x24]
	fmuld8sux16	%f0,	%f14,	%f8
	fand	%f4,	%f10,	%f2
	edge32ln	%i6,	%o5,	%g3
	smulcc	%i1,	0x0726,	%o0
	add	%g5,	0x0AC8,	%l6
	edge32ln	%i2,	%g6,	%o4
	movn	%xcc,	%l5,	%l0
	sdivx	%l4,	0x1EDE,	%o7
	and	%o2,	0x19F7,	%g4
	addc	%i3,	%i7,	%i4
	edge8n	%i5,	%o1,	%l2
	fexpand	%f8,	%f10
	sdiv	%i0,	0x19F4,	%g7
	addcc	%o6,	%g2,	%l3
	lduw	[%l7 + 0x1C],	%g1
	movle	%xcc,	%l1,	%o3
	lduh	[%l7 + 0x3E],	%i6
	xnor	%o5,	%i1,	%o0
	or	%g5,	%l6,	%i2
	movpos	%icc,	%g3,	%o4
	srax	%l5,	0x1A,	%g6
	edge8l	%l0,	%l4,	%o7
	edge32l	%g4,	%o2,	%i7
	stb	%i3,	[%l7 + 0x1C]
	fmovrde	%i4,	%f10,	%f4
	movge	%icc,	%o1,	%l2
	fmovsn	%icc,	%f15,	%f15
	srl	%i0,	0x18,	%i5
	edge32n	%o6,	%g7,	%l3
	movl	%icc,	%g2,	%l1
	umulcc	%g1,	%i6,	%o3
	andcc	%i1,	%o5,	%o0
	udivx	%l6,	0x0F18,	%g5
	fcmpgt16	%f6,	%f2,	%g3
	fmovrslez	%o4,	%f2,	%f14
	fsrc2	%f8,	%f8
	smulcc	%l5,	0x0120,	%g6
	lduh	[%l7 + 0x40],	%i2
	sll	%l4,	0x02,	%o7
	subccc	%g4,	0x1E33,	%o2
	movneg	%xcc,	%l0,	%i3
	addc	%i4,	0x17E5,	%i7
	xnor	%o1,	%i0,	%l2
	movcc	%xcc,	%i5,	%o6
	edge16l	%l3,	%g2,	%l1
	smul	%g1,	%g7,	%i6
	movrgez	%i1,	0x042,	%o5
	addc	%o0,	0x1B61,	%l6
	srlx	%g5,	%g3,	%o3
	alignaddr	%l5,	%g6,	%o4
	fmovd	%f10,	%f0
	edge32n	%l4,	%i2,	%o7
	array32	%o2,	%l0,	%g4
	andncc	%i3,	%i7,	%i4
	movcs	%icc,	%i0,	%o1
	xor	%l2,	%o6,	%l3
	move	%icc,	%g2,	%l1
	fabss	%f5,	%f1
	fnands	%f9,	%f3,	%f6
	andcc	%g1,	%i5,	%i6
	movne	%xcc,	%g7,	%i1
	fmovdg	%xcc,	%f14,	%f2
	edge16	%o0,	%o5,	%g5
	ldd	[%l7 + 0x30],	%i6
	fmovscs	%icc,	%f7,	%f3
	edge8n	%o3,	%g3,	%l5
	ldd	[%l7 + 0x70],	%f12
	fnegs	%f8,	%f5
	and	%g6,	0x0314,	%o4
	fnot2s	%f1,	%f4
	fmovdl	%icc,	%f13,	%f6
	lduw	[%l7 + 0x48],	%l4
	add	%o7,	0x1DE0,	%o2
	movcc	%icc,	%i2,	%g4
	ldsb	[%l7 + 0x4F],	%l0
	movpos	%xcc,	%i3,	%i7
	movn	%icc,	%i0,	%o1
	movpos	%xcc,	%i4,	%l2
	srlx	%l3,	0x06,	%o6
	fmovdcc	%icc,	%f9,	%f0
	save %l1, 0x0805, %g1
	sethi	0x13B9,	%i5
	movrne	%g2,	%g7,	%i6
	movgu	%xcc,	%o0,	%i1
	array16	%o5,	%g5,	%o3
	movrne	%g3,	0x001,	%l5
	array16	%g6,	%o4,	%l6
	xnor	%o7,	0x0D2F,	%o2
	udivx	%l4,	0x0B14,	%g4
	fmul8sux16	%f10,	%f2,	%f4
	movpos	%icc,	%l0,	%i3
	movg	%xcc,	%i7,	%i2
	pdist	%f4,	%f8,	%f10
	fors	%f12,	%f15,	%f3
	fmovsvs	%icc,	%f5,	%f2
	edge8n	%o1,	%i4,	%l2
	udiv	%i0,	0x08B7,	%o6
	stx	%l1,	[%l7 + 0x28]
	lduw	[%l7 + 0x2C],	%g1
	fmovsleu	%icc,	%f15,	%f8
	movrgz	%i5,	%l3,	%g2
	movrgez	%i6,	%o0,	%i1
	movrne	%g7,	%g5,	%o3
	sdiv	%g3,	0x1CA7,	%o5
	edge16l	%l5,	%g6,	%l6
	and	%o7,	0x100E,	%o4
	array8	%l4,	%g4,	%o2
	array16	%l0,	%i3,	%i7
	fmovsn	%xcc,	%f13,	%f6
	stb	%o1,	[%l7 + 0x3B]
	stb	%i4,	[%l7 + 0x53]
	edge8l	%l2,	%i0,	%o6
	addccc	%l1,	%i2,	%g1
	array16	%l3,	%g2,	%i6
	fnot2s	%f8,	%f15
	alignaddr	%i5,	%o0,	%i1
	sll	%g7,	%g5,	%o3
	edge8ln	%g3,	%l5,	%o5
	popc	0x17D7,	%l6
	faligndata	%f2,	%f8,	%f10
	addcc	%g6,	%o4,	%l4
	alignaddr	%g4,	%o2,	%o7
	subc	%i3,	0x0876,	%i7
	fcmpeq16	%f14,	%f8,	%l0
	array16	%o1,	%l2,	%i0
	fmovrse	%o6,	%f10,	%f8
	st	%f8,	[%l7 + 0x3C]
	movrne	%l1,	0x094,	%i4
	sdiv	%i2,	0x071F,	%l3
	stx	%g1,	[%l7 + 0x28]
	fpadd16s	%f4,	%f7,	%f2
	sdivcc	%i6,	0x128B,	%i5
	ldd	[%l7 + 0x68],	%o0
	fpadd32s	%f7,	%f14,	%f9
	sllx	%g2,	%g7,	%g5
	movl	%icc,	%i1,	%o3
	sdivcc	%l5,	0x0096,	%g3
	ldsh	[%l7 + 0x1C],	%o5
	movrne	%g6,	%o4,	%l4
	ld	[%l7 + 0x5C],	%f1
	fmovspos	%icc,	%f15,	%f13
	fpack32	%f6,	%f10,	%f12
	movgu	%xcc,	%g4,	%o2
	for	%f12,	%f14,	%f6
	fmovrslez	%o7,	%f1,	%f7
	edge16l	%l6,	%i7,	%i3
	fpack32	%f4,	%f0,	%f2
	movvs	%icc,	%o1,	%l0
	fone	%f10
	andcc	%i0,	0x0997,	%o6
	sth	%l1,	[%l7 + 0x5E]
	edge8l	%i4,	%l2,	%i2
	movleu	%icc,	%l3,	%i6
	ldd	[%l7 + 0x50],	%f4
	fmovsle	%xcc,	%f2,	%f1
	lduw	[%l7 + 0x48],	%g1
	ldsh	[%l7 + 0x6E],	%i5
	xor	%o0,	0x0EE7,	%g2
	and	%g5,	0x0E17,	%i1
	xnor	%o3,	0x15AB,	%l5
	udiv	%g7,	0x1A22,	%o5
	ldsw	[%l7 + 0x28],	%g3
	movvs	%icc,	%o4,	%g6
	subcc	%l4,	%g4,	%o7
	ldub	[%l7 + 0x70],	%o2
	orn	%l6,	%i3,	%o1
	fmovdvs	%xcc,	%f14,	%f9
	addcc	%l0,	0x1516,	%i0
	movl	%icc,	%i7,	%o6
	andcc	%i4,	0x0D3B,	%l1
	andn	%l2,	0x1DA6,	%i2
	popc	%l3,	%i6
	sdivx	%g1,	0x0EDC,	%i5
	fxors	%f15,	%f12,	%f6
	or	%o0,	%g5,	%i1
	movrgz	%g2,	0x3FF,	%o3
	ldsw	[%l7 + 0x24],	%l5
	or	%o5,	0x1E77,	%g7
	subccc	%g3,	%g6,	%o4
	andn	%g4,	%l4,	%o7
	ldsb	[%l7 + 0x0F],	%o2
	edge16	%i3,	%o1,	%l6
	mulscc	%l0,	%i7,	%i0
	fnot2	%f4,	%f4
	srlx	%i4,	0x1C,	%o6
	ldd	[%l7 + 0x30],	%l2
	fpadd32	%f4,	%f8,	%f8
	orn	%l1,	0x1EC2,	%i2
	ldd	[%l7 + 0x58],	%f2
	ldsw	[%l7 + 0x34],	%i6
	array32	%g1,	%i5,	%o0
	movg	%icc,	%g5,	%i1
	popc	0x00D5,	%g2
	fmovdneg	%icc,	%f14,	%f8
	movl	%xcc,	%l3,	%o3
	fnot2s	%f7,	%f5
	andncc	%l5,	%o5,	%g3
	std	%f12,	[%l7 + 0x70]
	edge16ln	%g6,	%g7,	%g4
	fandnot2s	%f7,	%f7,	%f14
	fmovrslez	%o4,	%f9,	%f0
	sll	%o7,	%o2,	%i3
	movrne	%l4,	%o1,	%l0
	fabss	%f0,	%f14
	subcc	%i7,	%l6,	%i0
	lduw	[%l7 + 0x10],	%i4
	ldsw	[%l7 + 0x58],	%o6
	ldsh	[%l7 + 0x2E],	%l2
	edge8ln	%l1,	%i2,	%g1
	sub	%i6,	0x00CC,	%o0
	udiv	%g5,	0x093A,	%i5
	fands	%f13,	%f0,	%f13
	subccc	%g2,	0x090D,	%l3
	movrgez	%o3,	0x0B8,	%l5
	sllx	%i1,	0x07,	%g3
	xorcc	%g6,	%o5,	%g4
	movrgez	%o4,	%o7,	%o2
	andcc	%i3,	0x1C7F,	%l4
	fexpand	%f2,	%f4
	edge16	%g7,	%l0,	%i7
	stx	%l6,	[%l7 + 0x28]
	movgu	%xcc,	%o1,	%i0
	ld	[%l7 + 0x24],	%f1
	mova	%icc,	%o6,	%l2
	srlx	%l1,	%i4,	%g1
	fmul8x16al	%f11,	%f2,	%f2
	movvs	%icc,	%i6,	%i2
	mulx	%g5,	%i5,	%g2
	sdivcc	%l3,	0x0605,	%o0
	movge	%xcc,	%l5,	%o3
	edge8ln	%i1,	%g3,	%o5
	edge16ln	%g4,	%g6,	%o4
	srax	%o2,	0x06,	%o7
	fcmpgt32	%f10,	%f2,	%i3
	fsrc1s	%f3,	%f1
	fmovd	%f6,	%f0
	addcc	%l4,	%g7,	%i7
	ldsw	[%l7 + 0x78],	%l0
	edge16n	%o1,	%i0,	%o6
	movleu	%xcc,	%l6,	%l1
	movg	%xcc,	%i4,	%g1
	fmovrdgez	%i6,	%f14,	%f10
	edge32	%l2,	%i2,	%g5
	and	%i5,	%l3,	%o0
	edge32	%l5,	%o3,	%i1
	movpos	%icc,	%g2,	%g3
	and	%o5,	%g4,	%o4
	addcc	%g6,	%o7,	%o2
	andcc	%i3,	%g7,	%l4
	fpadd32	%f8,	%f14,	%f2
	fpmerge	%f0,	%f6,	%f6
	st	%f3,	[%l7 + 0x48]
	and	%l0,	%o1,	%i7
	umul	%o6,	%i0,	%l6
	mulscc	%l1,	%g1,	%i6
	fnor	%f12,	%f4,	%f14
	xnor	%l2,	0x07DB,	%i2
	sdiv	%i4,	0x197B,	%i5
	ldsw	[%l7 + 0x48],	%g5
	fmovsa	%icc,	%f6,	%f1
	array32	%o0,	%l3,	%l5
	ldsb	[%l7 + 0x50],	%i1
	fnot2s	%f12,	%f7
	fmovdcc	%icc,	%f6,	%f1
	array8	%o3,	%g2,	%o5
	smulcc	%g4,	%o4,	%g6
	movg	%xcc,	%g3,	%o2
	fexpand	%f13,	%f4
	movrgz	%i3,	0x29F,	%g7
	edge32	%l4,	%o7,	%o1
	array16	%i7,	%l0,	%o6
	ldd	[%l7 + 0x28],	%i6
	edge8ln	%i0,	%l1,	%g1
	movrgz	%l2,	%i2,	%i6
	movcc	%xcc,	%i4,	%i5
	and	%o0,	0x1D11,	%l3
	xor	%g5,	0x1518,	%i1
	lduh	[%l7 + 0x2C],	%o3
	sdivcc	%g2,	0x03B9,	%o5
	ld	[%l7 + 0x64],	%f1
	fcmpeq32	%f8,	%f10,	%l5
	movrlz	%g4,	0x233,	%o4
	sth	%g6,	[%l7 + 0x26]
	mulscc	%g3,	%i3,	%g7
	edge32	%l4,	%o2,	%o7
	edge8l	%i7,	%l0,	%o6
	ldsh	[%l7 + 0x72],	%l6
	alignaddrl	%o1,	%i0,	%l1
	movrgz	%l2,	%g1,	%i2
	ldsw	[%l7 + 0x54],	%i4
	edge32l	%i6,	%i5,	%o0
	fmovrsne	%l3,	%f11,	%f7
	srl	%g5,	%o3,	%g2
	movleu	%xcc,	%o5,	%i1
	fmovdvs	%icc,	%f0,	%f8
	movcc	%xcc,	%g4,	%l5
	movrne	%g6,	%g3,	%o4
	ldsb	[%l7 + 0x10],	%g7
	fzero	%f6
	addccc	%l4,	0x1887,	%i3
	array32	%o2,	%o7,	%i7
	xnor	%l0,	0x05F8,	%o6
	lduh	[%l7 + 0x76],	%l6
	fmovsle	%xcc,	%f6,	%f0
	movneg	%icc,	%o1,	%i0
	fmovsg	%xcc,	%f4,	%f4
	std	%f12,	[%l7 + 0x48]
	fandnot2s	%f10,	%f1,	%f8
	fmovsne	%icc,	%f8,	%f4
	sra	%l2,	%g1,	%i2
	std	%f12,	[%l7 + 0x38]
	subccc	%l1,	0x1CE1,	%i6
	ldub	[%l7 + 0x11],	%i4
	edge8n	%i5,	%o0,	%g5
	udiv	%o3,	0x0258,	%l3
	ldsh	[%l7 + 0x36],	%o5
	subc	%i1,	%g2,	%l5
	fcmpgt16	%f6,	%f12,	%g6
	addcc	%g3,	%g4,	%g7
	andn	%o4,	0x0E2F,	%i3
	fpack32	%f14,	%f8,	%f2
	movrgez	%l4,	0x364,	%o7
	sub	%i7,	0x1406,	%o2
	edge8n	%l0,	%l6,	%o6
	orn	%i0,	0x1CFB,	%l2
	movge	%icc,	%o1,	%i2
	and	%g1,	0x0D6F,	%i6
	movn	%xcc,	%l1,	%i5
	fmovdne	%xcc,	%f2,	%f11
	orncc	%i4,	0x019D,	%g5
	movge	%icc,	%o3,	%o0
	umulcc	%o5,	0x007B,	%i1
	fmovsle	%xcc,	%f10,	%f12
	xor	%g2,	0x07E3,	%l5
	srlx	%g6,	%l3,	%g3
	srax	%g4,	%g7,	%i3
	movpos	%icc,	%l4,	%o4
	sll	%o7,	%i7,	%l0
	array32	%l6,	%o2,	%i0
	stx	%o6,	[%l7 + 0x78]
	fsrc1	%f0,	%f6
	movre	%l2,	0x044,	%o1
	umul	%g1,	%i2,	%i6
	lduw	[%l7 + 0x40],	%i5
	edge32	%i4,	%l1,	%o3
	fmovsgu	%icc,	%f4,	%f2
	save %o0, 0x1104, %o5
	fmovscs	%xcc,	%f6,	%f13
	edge8n	%i1,	%g2,	%l5
	fcmpes	%fcc2,	%f15,	%f3
	movne	%xcc,	%g5,	%g6
	movpos	%icc,	%g3,	%g4
	movcc	%xcc,	%g7,	%i3
	movneg	%icc,	%l4,	%l3
	movn	%xcc,	%o7,	%o4
	ldsb	[%l7 + 0x57],	%i7
	addcc	%l6,	0x0F9E,	%l0
	andncc	%o2,	%i0,	%o6
	st	%f6,	[%l7 + 0x50]
	orcc	%l2,	%g1,	%o1
	fmovsneg	%icc,	%f15,	%f7
	fcmpd	%fcc2,	%f2,	%f6
	edge32ln	%i6,	%i5,	%i2
	addccc	%l1,	%o3,	%o0
	fors	%f5,	%f12,	%f5
	ldsb	[%l7 + 0x15],	%i4
	addc	%i1,	%g2,	%o5
	fabsd	%f14,	%f10
	fandnot2s	%f11,	%f2,	%f14
	udiv	%l5,	0x1705,	%g5
	srax	%g3,	%g6,	%g7
	array32	%i3,	%g4,	%l4
	ldd	[%l7 + 0x60],	%f14
	movneg	%xcc,	%l3,	%o7
	subc	%i7,	%l6,	%o4
	fmovsvc	%xcc,	%f3,	%f15
	sllx	%l0,	0x06,	%o2
	edge16	%i0,	%l2,	%g1
	movrgz	%o1,	0x2E1,	%o6
	sra	%i5,	%i6,	%l1
	movrne	%i2,	%o3,	%o0
	for	%f10,	%f6,	%f0
	udivcc	%i4,	0x0203,	%g2
	or	%o5,	0x0398,	%i1
	xor	%l5,	%g5,	%g3
	stb	%g7,	[%l7 + 0x55]
	lduh	[%l7 + 0x62],	%i3
	stw	%g6,	[%l7 + 0x3C]
	mulscc	%l4,	0x1D5E,	%l3
	fexpand	%f9,	%f12
	movneg	%xcc,	%g4,	%o7
	srl	%l6,	%i7,	%l0
	movneg	%icc,	%o2,	%o4
	fmovrsgez	%i0,	%f6,	%f10
	ldsb	[%l7 + 0x7A],	%g1
	orn	%l2,	0x16C0,	%o6
	addccc	%i5,	%o1,	%i6
	mulx	%i2,	%l1,	%o3
	stw	%o0,	[%l7 + 0x78]
	andncc	%g2,	%o5,	%i1
	fmovscs	%xcc,	%f12,	%f10
	sethi	0x178D,	%l5
	fmovrdlz	%i4,	%f0,	%f0
	fmul8sux16	%f2,	%f12,	%f4
	std	%f12,	[%l7 + 0x40]
	movn	%xcc,	%g5,	%g7
	lduh	[%l7 + 0x7E],	%g3
	edge8l	%i3,	%g6,	%l3
	andncc	%g4,	%o7,	%l4
	movleu	%icc,	%l6,	%i7
	restore %o2, 0x0C23, %l0
	ldsb	[%l7 + 0x0C],	%o4
	edge16	%i0,	%l2,	%g1
	edge32n	%i5,	%o6,	%o1
	sdiv	%i2,	0x0D3D,	%l1
	movne	%icc,	%o3,	%i6
	udivx	%o0,	0x013C,	%g2
	fexpand	%f3,	%f8
	fmovdcs	%xcc,	%f5,	%f14
	orcc	%i1,	%l5,	%o5
	fcmple32	%f6,	%f12,	%g5
	sth	%g7,	[%l7 + 0x7C]
	for	%f4,	%f2,	%f6
	movgu	%xcc,	%g3,	%i3
	fnand	%f2,	%f0,	%f4
	sdiv	%i4,	0x1042,	%l3
	fmovs	%f5,	%f4
	fmovdle	%xcc,	%f5,	%f11
	std	%f2,	[%l7 + 0x48]
	ldsb	[%l7 + 0x43],	%g6
	ldsw	[%l7 + 0x1C],	%o7
	movl	%icc,	%l4,	%g4
	movvs	%xcc,	%l6,	%i7
	movne	%icc,	%o2,	%o4
	fnor	%f0,	%f6,	%f14
	udiv	%l0,	0x1959,	%i0
	array8	%l2,	%i5,	%o6
	fmovdge	%xcc,	%f5,	%f1
	fnors	%f15,	%f11,	%f11
	movn	%icc,	%o1,	%g1
	fmovdl	%icc,	%f13,	%f6
	fabss	%f1,	%f6
	fcmpgt16	%f12,	%f4,	%i2
	movg	%icc,	%l1,	%o3
	srl	%i6,	%o0,	%g2
	fmovrdlz	%l5,	%f2,	%f6
	srax	%o5,	%g5,	%i1
	smul	%g3,	%i3,	%g7
	fpadd32s	%f9,	%f3,	%f15
	addc	%l3,	0x1AE2,	%i4
	addcc	%g6,	%o7,	%g4
	or	%l4,	%i7,	%o2
	lduw	[%l7 + 0x60],	%o4
	sdivx	%l6,	0x0810,	%l0
	edge16n	%l2,	%i5,	%i0
	movl	%icc,	%o1,	%o6
	st	%f12,	[%l7 + 0x64]
	fmovdne	%icc,	%f1,	%f8
	ldx	[%l7 + 0x08],	%i2
	ldd	[%l7 + 0x48],	%f10
	array32	%l1,	%g1,	%o3
	movre	%i6,	%o0,	%l5
	xnorcc	%g2,	0x0CF6,	%g5
	smul	%i1,	0x0D89,	%g3
	movrgz	%i3,	0x135,	%g7
	movvs	%icc,	%o5,	%i4
	movrlz	%g6,	%o7,	%g4
	addccc	%l4,	0x124E,	%i7
	edge32ln	%l3,	%o4,	%o2
	movrlez	%l6,	%l0,	%l2
	sth	%i0,	[%l7 + 0x74]
	fmovrsgz	%i5,	%f4,	%f5
	lduw	[%l7 + 0x54],	%o1
	subc	%i2,	%l1,	%g1
	fsrc2s	%f9,	%f6
	fone	%f2
	movne	%xcc,	%o3,	%o6
	srl	%o0,	%i6,	%l5
	movrlz	%g2,	0x3B7,	%g5
	movvc	%icc,	%i1,	%g3
	edge8l	%i3,	%g7,	%i4
	srl	%o5,	0x1F,	%o7
	movcs	%icc,	%g4,	%g6
	stw	%i7,	[%l7 + 0x38]
	orncc	%l4,	%l3,	%o2
	st	%f0,	[%l7 + 0x34]
	movvs	%xcc,	%l6,	%l0
	edge16l	%o4,	%l2,	%i0
	movrlz	%i5,	%i2,	%l1
	edge32	%o1,	%g1,	%o6
	ldsw	[%l7 + 0x20],	%o3
	movvc	%icc,	%i6,	%o0
	fmovdgu	%xcc,	%f0,	%f14
	addccc	%g2,	0x133C,	%g5
	edge16ln	%i1,	%g3,	%l5
	ldub	[%l7 + 0x16],	%g7
	movn	%xcc,	%i4,	%i3
	ldd	[%l7 + 0x40],	%f12
	movcc	%icc,	%o5,	%g4
	edge16l	%o7,	%g6,	%l4
	ld	[%l7 + 0x7C],	%f7
	orn	%i7,	%l3,	%l6
	sdivx	%o2,	0x0311,	%l0
	edge32n	%o4,	%i0,	%l2
	udiv	%i2,	0x0D43,	%l1
	edge16	%i5,	%g1,	%o1
	orncc	%o3,	%i6,	%o0
	fcmple16	%f4,	%f12,	%o6
	edge32n	%g2,	%i1,	%g3
	fpsub16	%f6,	%f4,	%f0
	restore %g5, %l5, %i4
	fmul8sux16	%f6,	%f4,	%f0
	fmovsne	%icc,	%f0,	%f2
	sdivcc	%g7,	0x1F67,	%i3
	movle	%icc,	%o5,	%o7
	std	%f2,	[%l7 + 0x20]
	edge8l	%g4,	%l4,	%g6
	movn	%icc,	%l3,	%i7
	lduh	[%l7 + 0x10],	%l6
	fcmpeq32	%f0,	%f8,	%l0
	fxnor	%f14,	%f0,	%f10
	movvs	%xcc,	%o4,	%i0
	fnot1	%f12,	%f0
	edge16	%o2,	%i2,	%l1
	fmovrslez	%i5,	%f2,	%f7
	sth	%g1,	[%l7 + 0x4E]
	save %l2, 0x0269, %o1
	movrgz	%o3,	0x273,	%i6
	subccc	%o6,	%o0,	%g2
	orncc	%i1,	%g3,	%g5
	sdivx	%l5,	0x0CBA,	%g7
	movrgez	%i3,	0x361,	%o5
	movre	%i4,	%o7,	%g4
	sdivcc	%l4,	0x123A,	%l3
	mulx	%g6,	%l6,	%l0
	lduw	[%l7 + 0x08],	%i7
	ldsb	[%l7 + 0x79],	%i0
	edge8l	%o4,	%i2,	%l1
	ldsw	[%l7 + 0x40],	%i5
	fmovrse	%g1,	%f3,	%f14
	andncc	%l2,	%o2,	%o3
	sll	%i6,	0x00,	%o6
	subccc	%o1,	%o0,	%g2
	srl	%g3,	%g5,	%i1
	udiv	%l5,	0x150D,	%i3
	add	%g7,	0x10F0,	%o5
	movleu	%xcc,	%o7,	%g4
	srax	%l4,	%i4,	%g6
	fpackfix	%f8,	%f2
	movre	%l3,	0x119,	%l0
	ld	[%l7 + 0x34],	%f11
	fornot2	%f12,	%f8,	%f2
	subc	%l6,	%i0,	%i7
	sdiv	%o4,	0x09A3,	%i2
	movge	%xcc,	%l1,	%i5
	movrgez	%g1,	%l2,	%o2
	edge32ln	%o3,	%o6,	%i6
	movn	%xcc,	%o0,	%o1
	mulx	%g2,	%g5,	%i1
	fpadd32	%f14,	%f2,	%f6
	std	%f0,	[%l7 + 0x10]
	fmovrsne	%g3,	%f3,	%f2
	fmovrdlez	%i3,	%f0,	%f14
	fnors	%f14,	%f0,	%f9
	edge16ln	%l5,	%g7,	%o7
	fand	%f10,	%f6,	%f14
	movneg	%icc,	%g4,	%o5
	restore %l4, %i4, %g6
	fpadd16s	%f1,	%f15,	%f2
	fmovscc	%icc,	%f11,	%f3
	fcmpeq16	%f2,	%f14,	%l0
	xnorcc	%l6,	0x065A,	%i0
	ldsw	[%l7 + 0x58],	%i7
	sll	%l3,	0x05,	%i2
	smulcc	%o4,	0x1B1B,	%i5
	edge16ln	%l1,	%g1,	%l2
	andn	%o2,	%o3,	%i6
	movrne	%o0,	%o6,	%o1
	array32	%g5,	%g2,	%g3
	edge8l	%i3,	%i1,	%l5
	edge16	%o7,	%g4,	%g7
	ldsw	[%l7 + 0x50],	%o5
	movcc	%icc,	%l4,	%g6
	fornot1	%f10,	%f14,	%f2
	movn	%xcc,	%i4,	%l0
	array8	%i0,	%l6,	%i7
	ldd	[%l7 + 0x68],	%l2
	st	%f1,	[%l7 + 0x10]
	fmovdne	%xcc,	%f8,	%f13
	lduw	[%l7 + 0x40],	%i2
	fmovdvs	%icc,	%f6,	%f1
	movvc	%icc,	%o4,	%l1
	or	%g1,	%l2,	%i5
	ldd	[%l7 + 0x78],	%f4
	udivcc	%o2,	0x1199,	%i6
	sdiv	%o3,	0x0039,	%o6
	lduh	[%l7 + 0x36],	%o1
	edge32ln	%o0,	%g2,	%g5
	orcc	%g3,	%i1,	%l5
	movvs	%xcc,	%i3,	%g4
	ldsh	[%l7 + 0x20],	%g7
	fpsub16	%f6,	%f4,	%f12
	movrne	%o7,	%l4,	%o5
	ldsh	[%l7 + 0x38],	%i4
	edge32l	%g6,	%i0,	%l0
	edge16l	%l6,	%i7,	%l3
	srlx	%i2,	0x08,	%o4
	umul	%l1,	%l2,	%g1
	movne	%xcc,	%i5,	%i6
	fmovdvc	%xcc,	%f10,	%f12
	ldsw	[%l7 + 0x70],	%o3
	andcc	%o2,	%o1,	%o0
	movcc	%xcc,	%g2,	%o6
	addccc	%g5,	%i1,	%g3
	udivx	%i3,	0x19D9,	%g4
	and	%g7,	0x132C,	%l5
	movrne	%o7,	%o5,	%l4
	orcc	%g6,	%i0,	%l0
	udiv	%i4,	0x0748,	%l6
	smul	%l3,	0x1CD7,	%i7
	fmovdleu	%xcc,	%f1,	%f11
	andncc	%o4,	%l1,	%l2
	movrgz	%i2,	0x323,	%g1
	udivcc	%i5,	0x14B6,	%o3
	movl	%icc,	%i6,	%o2
	edge32	%o0,	%o1,	%o6
	sdivx	%g5,	0x1D03,	%i1
	fmul8x16al	%f12,	%f8,	%f10
	addcc	%g2,	%i3,	%g3
	sdivx	%g4,	0x0D3D,	%l5
	fcmpne32	%f2,	%f12,	%g7
	xnor	%o5,	0x04AC,	%o7
	movpos	%icc,	%g6,	%i0
	edge16n	%l4,	%l0,	%i4
	fpmerge	%f15,	%f3,	%f0
	andncc	%l6,	%i7,	%o4
	andn	%l3,	0x0547,	%l2
	edge16ln	%l1,	%g1,	%i5
	fcmpne32	%f10,	%f12,	%o3
	fmovsvs	%icc,	%f5,	%f5
	bshuffle	%f8,	%f4,	%f4
	fmovsle	%xcc,	%f11,	%f2
	lduh	[%l7 + 0x0E],	%i2
	orcc	%o2,	0x09DC,	%i6
	srl	%o1,	0x1F,	%o6
	stb	%o0,	[%l7 + 0x09]
	array32	%i1,	%g5,	%i3
	edge32l	%g2,	%g3,	%g4
	addcc	%l5,	0x19B0,	%o5
	stx	%o7,	[%l7 + 0x08]
	xorcc	%g7,	%i0,	%l4
	sra	%l0,	0x01,	%i4
	movvc	%xcc,	%l6,	%g6
	srlx	%i7,	%o4,	%l2
	lduw	[%l7 + 0x38],	%l3
	srl	%l1,	%g1,	%o3
	add	%i2,	%i5,	%o2
	ldsh	[%l7 + 0x5C],	%i6
	save %o1, 0x02E2, %o0
	fmovsvc	%xcc,	%f2,	%f9
	fsrc1	%f2,	%f8
	st	%f10,	[%l7 + 0x7C]
	fnegd	%f2,	%f6
	ldd	[%l7 + 0x70],	%f10
	array32	%o6,	%g5,	%i1
	movne	%icc,	%i3,	%g2
	sra	%g3,	0x1C,	%g4
	fandnot1	%f14,	%f10,	%f4
	fmovdcs	%xcc,	%f5,	%f8
	movl	%xcc,	%o5,	%o7
	fcmple16	%f12,	%f2,	%g7
	xnor	%l5,	0x0C01,	%i0
	fmovdl	%xcc,	%f7,	%f13
	std	%f14,	[%l7 + 0x48]
	umul	%l4,	%l0,	%i4
	fandnot2s	%f9,	%f1,	%f1
	fornot1s	%f7,	%f0,	%f3
	ldd	[%l7 + 0x60],	%i6
	andcc	%i7,	%g6,	%l2
	fmovrsgez	%o4,	%f9,	%f4
	stb	%l3,	[%l7 + 0x7B]
	fexpand	%f7,	%f0
	umulcc	%l1,	%g1,	%i2
	movne	%icc,	%o3,	%o2
	fmovrdgz	%i6,	%f8,	%f6
	fnegs	%f10,	%f6
	smulcc	%o1,	0x1ED1,	%i5
	movvc	%icc,	%o6,	%o0
	fcmps	%fcc0,	%f3,	%f1
	ldub	[%l7 + 0x30],	%i1
	movrgez	%g5,	0x12C,	%i3
	stw	%g2,	[%l7 + 0x24]
	srl	%g4,	0x1C,	%o5
	edge32	%o7,	%g7,	%g3
	fmovsl	%xcc,	%f6,	%f11
	movle	%icc,	%l5,	%l4
	movrlz	%l0,	0x10B,	%i0
	fandnot1	%f6,	%f14,	%f4
	fmul8ulx16	%f0,	%f14,	%f12
	movrgz	%i4,	%l6,	%i7
	lduh	[%l7 + 0x1E],	%l2
	sdiv	%g6,	0x057B,	%l3
	fpadd16	%f10,	%f4,	%f8
	ldsh	[%l7 + 0x62],	%o4
	fcmpgt32	%f12,	%f4,	%g1
	udiv	%l1,	0x1BA0,	%i2
	fpsub32	%f14,	%f8,	%f8
	sra	%o2,	0x02,	%i6
	fmovdl	%xcc,	%f3,	%f13
	ld	[%l7 + 0x0C],	%f7
	fmul8x16	%f2,	%f12,	%f0
	add	%o1,	0x1778,	%o3
	srlx	%i5,	0x07,	%o6
	sdiv	%i1,	0x1AD2,	%o0
	movrgez	%g5,	0x23B,	%i3
	fnegd	%f8,	%f4
	orcc	%g2,	0x082D,	%g4
	orn	%o7,	%g7,	%o5
	add	%l5,	0x059B,	%g3
	array32	%l0,	%i0,	%l4
	std	%f2,	[%l7 + 0x78]
	movne	%icc,	%l6,	%i4
	edge16n	%i7,	%g6,	%l3
	movne	%icc,	%o4,	%l2
	fpack32	%f12,	%f8,	%f14
	fmovrde	%g1,	%f6,	%f10
	xnor	%i2,	%o2,	%l1
	xnorcc	%o1,	%i6,	%i5
	sethi	0x1F38,	%o3
	srlx	%i1,	%o6,	%o0
	edge16	%i3,	%g2,	%g4
	movl	%xcc,	%o7,	%g5
	movl	%xcc,	%o5,	%g7
	smulcc	%g3,	0x0708,	%l5
	sethi	0x1FF3,	%l0
	orn	%l4,	%l6,	%i4
	srax	%i7,	%i0,	%g6
	orcc	%o4,	%l2,	%l3
	st	%f10,	[%l7 + 0x30]
	xor	%g1,	%i2,	%l1
	andn	%o2,	%i6,	%o1
	or	%i5,	0x0013,	%o3
	edge16ln	%o6,	%o0,	%i1
	or	%i3,	0x100B,	%g2
	restore %g4, 0x0939, %o7
	fmovdleu	%xcc,	%f3,	%f12
	fmovdpos	%xcc,	%f12,	%f12
	orn	%g5,	%g7,	%o5
	umul	%l5,	0x1B67,	%g3
	fmovdn	%xcc,	%f1,	%f15
	fors	%f11,	%f12,	%f10
	array8	%l0,	%l6,	%i4
	edge8n	%l4,	%i7,	%g6
	edge16n	%o4,	%i0,	%l3
	srl	%l2,	0x08,	%g1
	movneg	%xcc,	%i2,	%o2
	fmovrsgez	%i6,	%f4,	%f14
	movre	%l1,	%i5,	%o3
	fsrc1	%f4,	%f10
	faligndata	%f6,	%f6,	%f4
	alignaddrl	%o6,	%o1,	%o0
	stw	%i3,	[%l7 + 0x6C]
	movl	%icc,	%g2,	%i1
	movne	%icc,	%g4,	%o7
	fmovdcs	%xcc,	%f3,	%f14
	umul	%g5,	0x0399,	%g7
	xorcc	%o5,	%l5,	%l0
	mova	%xcc,	%l6,	%i4
	ldd	[%l7 + 0x70],	%g2
	movrlez	%i7,	0x25C,	%l4
	sethi	0x09F0,	%o4
	movrgez	%g6,	0x08F,	%l3
	movgu	%icc,	%i0,	%l2
	sth	%i2,	[%l7 + 0x50]
	st	%f8,	[%l7 + 0x34]
	fmovdcc	%xcc,	%f4,	%f9
	srl	%o2,	0x05,	%g1
	movne	%icc,	%i6,	%i5
	fmovscs	%xcc,	%f0,	%f10
	sth	%o3,	[%l7 + 0x42]
	umul	%o6,	0x0A2E,	%o1
	array8	%o0,	%l1,	%i3
	alignaddrl	%g2,	%g4,	%o7
	smul	%i1,	%g7,	%g5
	edge32n	%o5,	%l5,	%l0
	lduh	[%l7 + 0x5E],	%i4
	alignaddrl	%g3,	%i7,	%l6
	movcs	%xcc,	%l4,	%o4
	movvs	%icc,	%l3,	%i0
	movne	%icc,	%g6,	%l2
	movneg	%icc,	%i2,	%g1
	movcs	%xcc,	%o2,	%i5
	movrgez	%o3,	0x211,	%o6
	movge	%icc,	%i6,	%o1
	movn	%xcc,	%o0,	%l1
	addc	%i3,	0x03A9,	%g4
	movcs	%icc,	%o7,	%g2
	movcs	%icc,	%i1,	%g7
	fand	%f10,	%f4,	%f14
	sth	%g5,	[%l7 + 0x48]
	fcmple16	%f10,	%f14,	%o5
	movleu	%icc,	%l0,	%l5
	fmovdneg	%icc,	%f2,	%f7
	stb	%g3,	[%l7 + 0x31]
	sra	%i7,	0x02,	%l6
	sdivx	%l4,	0x0278,	%o4
	fnors	%f1,	%f13,	%f15
	movrgz	%i4,	0x12B,	%l3
	fmovsa	%icc,	%f0,	%f11
	fmovdle	%icc,	%f9,	%f4
	movvs	%xcc,	%i0,	%g6
	edge32l	%l2,	%i2,	%o2
	alignaddrl	%i5,	%g1,	%o6
	fnors	%f11,	%f15,	%f14
	srlx	%o3,	0x16,	%i6
	orn	%o1,	0x165B,	%l1
	andn	%i3,	%g4,	%o0
	ldd	[%l7 + 0x18],	%f0
	umulcc	%o7,	%g2,	%g7
	movl	%xcc,	%i1,	%g5
	fnot2s	%f5,	%f10
	fmovsl	%icc,	%f0,	%f0
	fcmpeq32	%f4,	%f6,	%o5
	edge32l	%l5,	%g3,	%i7
	edge16l	%l6,	%l0,	%l4
	move	%icc,	%i4,	%l3
	movcs	%icc,	%i0,	%g6
	fmovrdlz	%o4,	%f10,	%f4
	siam	0x2
	fone	%f6
	udivx	%i2,	0x009D,	%l2
	movge	%xcc,	%i5,	%o2
	addc	%o6,	0x0222,	%g1
	sdivx	%o3,	0x0A5D,	%o1
	fpmerge	%f0,	%f0,	%f2
	fmovsa	%icc,	%f4,	%f2
	edge16l	%i6,	%i3,	%g4
	udivx	%o0,	0x0715,	%o7
	fors	%f12,	%f3,	%f12
	movrlez	%l1,	0x172,	%g7
	movn	%xcc,	%i1,	%g5
	ldub	[%l7 + 0x21],	%g2
	fmovrslz	%o5,	%f12,	%f11
	array8	%g3,	%l5,	%l6
	fmovrde	%i7,	%f14,	%f2
	xorcc	%l0,	%l4,	%i4
	movpos	%icc,	%l3,	%i0
	subc	%g6,	0x17A6,	%i2
	sethi	0x126E,	%l2
	andncc	%o4,	%i5,	%o2
	fcmpne16	%f2,	%f10,	%g1
	fmovdcc	%icc,	%f3,	%f14
	fands	%f9,	%f6,	%f2
	addccc	%o6,	%o3,	%i6
	sdiv	%o1,	0x0246,	%i3
	alignaddrl	%g4,	%o7,	%o0
	umul	%l1,	0x115E,	%i1
	edge8ln	%g7,	%g5,	%g2
	array8	%g3,	%l5,	%o5
	movrgez	%l6,	%i7,	%l4
	fpadd16	%f2,	%f6,	%f0
	movne	%icc,	%i4,	%l3
	xor	%i0,	0x190C,	%l0
	orn	%i2,	0x041B,	%l2
	sub	%g6,	0x0127,	%i5
	fmul8sux16	%f10,	%f14,	%f4
	udivcc	%o2,	0x181F,	%g1
	edge16	%o4,	%o3,	%i6
	fmovdle	%xcc,	%f3,	%f5
	fsrc2s	%f8,	%f11
	move	%icc,	%o1,	%o6
	ldsb	[%l7 + 0x3F],	%i3
	or	%g4,	%o0,	%l1
	fmovrdlz	%o7,	%f6,	%f6
	edge8ln	%i1,	%g5,	%g2
	lduh	[%l7 + 0x58],	%g3
	udiv	%l5,	0x18A9,	%o5
	lduh	[%l7 + 0x7A],	%l6
	edge16	%g7,	%l4,	%i7
	addcc	%l3,	%i4,	%l0
	xorcc	%i0,	0x1772,	%l2
	fcmpne32	%f12,	%f6,	%g6
	fmovsgu	%icc,	%f10,	%f12
	edge8	%i2,	%o2,	%i5
	movrne	%o4,	0x3C7,	%o3
	edge8	%g1,	%o1,	%o6
	edge16ln	%i3,	%g4,	%o0
	mova	%icc,	%i6,	%l1
	and	%i1,	0x1387,	%g5
	movleu	%icc,	%g2,	%g3
	srax	%o7,	%l5,	%o5
	sethi	0x1F8A,	%l6
	fabsd	%f0,	%f14
	fmovspos	%icc,	%f6,	%f3
	fmovrslz	%g7,	%f13,	%f11
	ldsh	[%l7 + 0x2C],	%i7
	stx	%l3,	[%l7 + 0x28]
	alignaddrl	%i4,	%l0,	%i0
	fsrc1	%f4,	%f14
	alignaddrl	%l4,	%g6,	%l2
	edge8n	%i2,	%i5,	%o4
	movre	%o2,	0x358,	%g1
	edge16n	%o3,	%o1,	%o6
	sethi	0x1022,	%i3
	addcc	%g4,	%o0,	%l1
	mulx	%i6,	%g5,	%i1
	subc	%g3,	0x0F82,	%o7
	fmovsgu	%xcc,	%f10,	%f11
	movrlez	%g2,	%l5,	%l6
	movre	%o5,	0x3A4,	%g7
	movrgz	%l3,	%i4,	%i7
	sdivx	%i0,	0x1F52,	%l4
	movpos	%icc,	%l0,	%g6
	srlx	%l2,	%i2,	%i5
	fnand	%f4,	%f2,	%f14
	addccc	%o4,	%o2,	%o3
	fornot1	%f0,	%f2,	%f0
	alignaddr	%o1,	%g1,	%o6
	orcc	%g4,	%o0,	%i3
	srlx	%l1,	%i6,	%i1
	orcc	%g3,	0x0501,	%o7
	udiv	%g5,	0x078C,	%g2
	ldub	[%l7 + 0x44],	%l6
	faligndata	%f12,	%f6,	%f6
	fornot1s	%f12,	%f11,	%f2
	ldd	[%l7 + 0x38],	%f10
	array16	%o5,	%g7,	%l5
	edge32n	%l3,	%i4,	%i7
	fmovrdgez	%l4,	%f14,	%f0
	sub	%i0,	%g6,	%l2
	edge16n	%i2,	%l0,	%i5
	fabsd	%f14,	%f10
	addc	%o2,	%o3,	%o4
	or	%o1,	%g1,	%g4
	edge16n	%o6,	%o0,	%l1
	array16	%i6,	%i3,	%g3
	fpackfix	%f8,	%f3
	edge8	%o7,	%g5,	%i1
	save %g2, %l6, %o5
	ldsw	[%l7 + 0x50],	%g7
	edge8n	%l5,	%i4,	%i7
	edge16	%l3,	%l4,	%i0
	ldx	[%l7 + 0x78],	%g6
	movleu	%xcc,	%i2,	%l0
	movl	%xcc,	%i5,	%l2
	xnor	%o2,	%o3,	%o1
	fcmpeq32	%f2,	%f12,	%o4
	fcmpgt32	%f2,	%f0,	%g1
	movvs	%xcc,	%o6,	%o0
	array16	%l1,	%g4,	%i6
	fzeros	%f0
	lduh	[%l7 + 0x34],	%g3
	restore %o7, 0x0A8B, %i3
	edge32ln	%g5,	%g2,	%l6
	fcmpeq32	%f2,	%f2,	%o5
	fpsub32	%f8,	%f2,	%f6
	edge32n	%g7,	%i1,	%i4
	addccc	%i7,	0x03E9,	%l3
	alignaddr	%l5,	%i0,	%g6
	xorcc	%i2,	0x1968,	%l0
	mulx	%i5,	%l4,	%l2
	orcc	%o3,	0x05AB,	%o2
	orn	%o4,	%o1,	%o6
	andn	%g1,	0x017C,	%o0
	lduw	[%l7 + 0x10],	%l1
	edge8ln	%g4,	%g3,	%i6
	movpos	%icc,	%i3,	%o7
	lduh	[%l7 + 0x22],	%g2
	pdist	%f0,	%f8,	%f8
	save %g5, 0x0D2D, %o5
	sdiv	%l6,	0x11C7,	%i1
	alignaddrl	%g7,	%i7,	%l3
	stw	%i4,	[%l7 + 0x68]
	edge32n	%i0,	%l5,	%i2
	fmovrslz	%g6,	%f12,	%f14
	and	%i5,	0x00AB,	%l4
	udiv	%l0,	0x00AC,	%l2
	movvs	%xcc,	%o2,	%o3
	xnorcc	%o1,	0x154C,	%o6
	mulx	%o4,	%g1,	%l1
	movcs	%xcc,	%o0,	%g3
	movrlz	%i6,	%i3,	%o7
	stw	%g2,	[%l7 + 0x2C]
	fmovdpos	%icc,	%f1,	%f11
	sdivx	%g5,	0x0FC1,	%o5
	mulx	%l6,	%g4,	%i1
	edge8n	%i7,	%l3,	%i4
	fmovrsgez	%g7,	%f14,	%f1
	fsrc2s	%f4,	%f4
	movle	%xcc,	%i0,	%i2
	movvs	%xcc,	%g6,	%i5
	sdivx	%l4,	0x0D50,	%l5
	movne	%xcc,	%l2,	%l0
	fmovrsgz	%o3,	%f4,	%f0
	umul	%o2,	0x045F,	%o6
	movleu	%xcc,	%o1,	%g1
	stx	%o4,	[%l7 + 0x18]
	popc	0x01E5,	%o0
	addc	%l1,	%i6,	%i3
	orncc	%g3,	%g2,	%g5
	subc	%o5,	%o7,	%l6
	stx	%g4,	[%l7 + 0x58]
	movrlz	%i7,	0x088,	%l3
	edge32ln	%i1,	%i4,	%g7
	fpsub32s	%f1,	%f4,	%f0
	fmovsneg	%xcc,	%f9,	%f10
	umulcc	%i2,	%g6,	%i5
	ldx	[%l7 + 0x58],	%i0
	movg	%xcc,	%l5,	%l4
	fcmpes	%fcc0,	%f3,	%f15
	fornot1	%f12,	%f8,	%f10
	xorcc	%l2,	%l0,	%o2
	ldsw	[%l7 + 0x18],	%o6
	edge16ln	%o1,	%o3,	%o4
	sethi	0x14E3,	%o0
	std	%f2,	[%l7 + 0x10]
	std	%f14,	[%l7 + 0x48]
	ldx	[%l7 + 0x38],	%l1
	movcc	%xcc,	%i6,	%g1
	movcc	%xcc,	%g3,	%g2
	movrgz	%g5,	%i3,	%o5
	edge32n	%o7,	%g4,	%i7
	edge16l	%l3,	%i1,	%i4
	popc	0x04DA,	%g7
	and	%i2,	%l6,	%g6
	andcc	%i5,	0x1FD0,	%i0
	siam	0x7
	fmovrdlz	%l5,	%f2,	%f14
	sth	%l2,	[%l7 + 0x56]
	sdivcc	%l0,	0x1C09,	%l4
	fmovrsgz	%o6,	%f14,	%f5
	smul	%o2,	%o1,	%o3
	fxnor	%f8,	%f6,	%f14
	addc	%o4,	0x0D1E,	%o0
	add	%i6,	0x0E5B,	%g1
	fand	%f2,	%f4,	%f0
	xorcc	%g3,	0x1443,	%g2
	movge	%xcc,	%l1,	%g5
	xnor	%i3,	%o7,	%o5
	subcc	%i7,	0x127C,	%g4
	movge	%icc,	%i1,	%l3
	orcc	%i4,	0x01F4,	%i2
	movrgz	%l6,	%g7,	%i5
	edge16l	%g6,	%i0,	%l5
	sll	%l2,	%l4,	%o6
	edge8	%l0,	%o2,	%o3
	ldub	[%l7 + 0x50],	%o4
	edge8l	%o1,	%i6,	%o0
	movvs	%xcc,	%g3,	%g2
	sethi	0x1DFD,	%g1
	movl	%xcc,	%g5,	%l1
	movleu	%icc,	%i3,	%o7
	alignaddr	%i7,	%o5,	%g4
	fcmps	%fcc3,	%f15,	%f5
	movcc	%xcc,	%l3,	%i4
	array16	%i1,	%l6,	%i2
	srlx	%i5,	0x0D,	%g6
	fmovrsgz	%g7,	%f12,	%f5
	movrlz	%l5,	0x323,	%l2
	fnands	%f11,	%f8,	%f9
	sra	%i0,	0x0D,	%l4
	movg	%xcc,	%o6,	%l0
	save %o3, 0x0B79, %o2
	fcmpgt32	%f0,	%f4,	%o1
	edge16n	%o4,	%i6,	%g3
	srax	%g2,	0x1B,	%o0
	ldd	[%l7 + 0x38],	%f6
	fpadd32	%f10,	%f2,	%f10
	alignaddrl	%g1,	%l1,	%i3
	movrgez	%o7,	0x214,	%i7
	fzero	%f2
	edge8ln	%o5,	%g5,	%l3
	lduw	[%l7 + 0x34],	%g4
	movcs	%icc,	%i4,	%i1
	array32	%i2,	%i5,	%g6
	udivx	%l6,	0x1477,	%l5
	fpadd16s	%f12,	%f2,	%f13
	xnor	%g7,	%l2,	%i0
	umul	%o6,	0x180E,	%l0
	and	%l4,	%o3,	%o1
	movvs	%icc,	%o2,	%i6
	ldd	[%l7 + 0x38],	%f4
	sdivx	%o4,	0x1302,	%g3
	and	%o0,	0x0AE9,	%g2
	edge32n	%l1,	%g1,	%i3
	edge8	%o7,	%i7,	%g5
	stx	%o5,	[%l7 + 0x48]
	sdiv	%l3,	0x0A11,	%g4
	fand	%f10,	%f6,	%f14
	sub	%i4,	0x0D50,	%i1
	sllx	%i5,	0x16,	%i2
	ld	[%l7 + 0x68],	%f4
	subccc	%l6,	0x0AD2,	%l5
	xnorcc	%g7,	0x1B2D,	%l2
	umul	%i0,	%g6,	%l0
	fmovdpos	%icc,	%f15,	%f13
	subc	%l4,	0x1E95,	%o3
	sub	%o1,	0x0960,	%o6
	fornot1	%f4,	%f14,	%f4
	subccc	%i6,	0x0F2B,	%o2
	array8	%o4,	%o0,	%g3
	xorcc	%g2,	%l1,	%i3
	lduw	[%l7 + 0x48],	%g1
	movrlz	%i7,	0x021,	%g5
	ldsh	[%l7 + 0x1A],	%o5
	edge32	%l3,	%g4,	%i4
	xnorcc	%i1,	0x12F8,	%o7
	edge16n	%i2,	%l6,	%i5
	subcc	%l5,	%l2,	%g7
	and	%i0,	%g6,	%l4
	ldsh	[%l7 + 0x5A],	%o3
	movre	%l0,	%o1,	%o6
	movrgz	%o2,	%i6,	%o4
	ldsw	[%l7 + 0x24],	%g3
	udiv	%g2,	0x0195,	%o0
	ldx	[%l7 + 0x60],	%i3
	sllx	%g1,	0x1D,	%l1
	edge8l	%i7,	%g5,	%l3
	movneg	%icc,	%o5,	%i4
	edge32ln	%i1,	%o7,	%g4
	movge	%xcc,	%l6,	%i2
	sra	%i5,	%l2,	%g7
	add	%l5,	0x0EDF,	%i0
	ldsb	[%l7 + 0x73],	%g6
	array8	%l4,	%l0,	%o1
	sllx	%o6,	0x0E,	%o3
	xor	%i6,	0x0D86,	%o2
	ldsw	[%l7 + 0x0C],	%o4
	mova	%xcc,	%g3,	%g2
	movleu	%xcc,	%i3,	%g1
	edge32l	%o0,	%l1,	%i7
	srl	%l3,	0x0A,	%o5
	fnor	%f12,	%f8,	%f10
	fnot2s	%f5,	%f15
	ldx	[%l7 + 0x38],	%g5
	fmovrdgz	%i1,	%f14,	%f0
	umul	%i4,	0x16FE,	%g4
	ldx	[%l7 + 0x78],	%o7
	stw	%l6,	[%l7 + 0x44]
	std	%f10,	[%l7 + 0x58]
	mova	%icc,	%i2,	%i5
	umulcc	%l2,	0x0764,	%l5
	subcc	%i0,	%g7,	%g6
	stb	%l0,	[%l7 + 0x26]
	movvc	%icc,	%o1,	%o6
	movcc	%icc,	%o3,	%l4
	srl	%i6,	%o4,	%g3
	subc	%o2,	0x0F8D,	%g2
	ldd	[%l7 + 0x58],	%i2
	addcc	%g1,	0x1131,	%o0
	fandnot2	%f12,	%f6,	%f10
	addcc	%i7,	%l1,	%o5
	sub	%g5,	%i1,	%i4
	fmovrde	%l3,	%f12,	%f10
	array32	%g4,	%l6,	%o7
	movge	%xcc,	%i2,	%i5
	fmovdn	%icc,	%f6,	%f14
	sethi	0x1E36,	%l5
	edge32ln	%i0,	%g7,	%g6
	subccc	%l0,	0x1777,	%o1
	sdivx	%l2,	0x1C0A,	%o3
	fcmps	%fcc1,	%f12,	%f5
	edge32	%l4,	%i6,	%o6
	srax	%o4,	%g3,	%o2
	and	%g2,	0x033F,	%g1
	fmovdcs	%icc,	%f8,	%f11
	fmovse	%icc,	%f15,	%f1
	fsrc2s	%f4,	%f2
	movgu	%xcc,	%o0,	%i3
	subc	%l1,	0x1519,	%i7
	subccc	%g5,	%o5,	%i4
	ldsw	[%l7 + 0x40],	%i1
	smulcc	%l3,	0x1917,	%g4
	array32	%o7,	%i2,	%i5
	fexpand	%f12,	%f2
	restore %l6, %i0, %g7
	fmovsa	%icc,	%f12,	%f12
	orncc	%l5,	0x070F,	%g6
	movvs	%icc,	%o1,	%l0
	andn	%l2,	0x19A5,	%l4
	fmul8x16	%f6,	%f8,	%f8
	ldub	[%l7 + 0x1B],	%i6
	movrgez	%o3,	0x115,	%o4
	fnot1s	%f9,	%f9
	ldx	[%l7 + 0x60],	%o6
	fandnot2s	%f3,	%f0,	%f2
	movl	%icc,	%g3,	%o2
	xnor	%g1,	0x11FC,	%o0
	edge8l	%i3,	%l1,	%g2
	fmovsneg	%xcc,	%f11,	%f8
	sdivx	%i7,	0x0BAB,	%o5
	srlx	%i4,	%i1,	%g5
	fmovd	%f14,	%f14
	movre	%l3,	0x146,	%g4
	edge32l	%o7,	%i2,	%l6
	subc	%i5,	%i0,	%g7
	fcmped	%fcc3,	%f6,	%f6
	movcc	%xcc,	%g6,	%o1
	udivx	%l0,	0x1076,	%l5
	movle	%xcc,	%l2,	%i6
	fmovsneg	%icc,	%f5,	%f8
	pdist	%f8,	%f8,	%f2
	andn	%o3,	%o4,	%l4
	movre	%o6,	0x05A,	%o2
	stw	%g1,	[%l7 + 0x4C]
	fcmple32	%f2,	%f4,	%g3
	addccc	%i3,	0x1A07,	%o0
	movn	%icc,	%g2,	%i7
	edge8n	%o5,	%l1,	%i4
	srax	%g5,	0x14,	%l3
	fmul8x16au	%f3,	%f3,	%f4
	or	%g4,	0x164E,	%i1
	fcmpeq16	%f8,	%f12,	%o7
	movvc	%xcc,	%i2,	%i5
	ldd	[%l7 + 0x38],	%i0
	edge16n	%g7,	%g6,	%o1
	fsrc1	%f12,	%f0
	edge8ln	%l6,	%l5,	%l0
	sth	%l2,	[%l7 + 0x28]
	subc	%o3,	0x1B8C,	%i6
	fmovsvc	%icc,	%f9,	%f11
	smulcc	%o4,	0x07AD,	%l4
	edge32l	%o6,	%g1,	%g3
	andncc	%i3,	%o0,	%o2
	srl	%i7,	0x02,	%o5
	movcs	%xcc,	%l1,	%i4
	fmovrsne	%g2,	%f4,	%f11
	sdivcc	%g5,	0x068C,	%l3
	xor	%i1,	0x1D5E,	%o7
	movle	%icc,	%g4,	%i5
	orncc	%i2,	0x1811,	%i0
	movl	%icc,	%g7,	%o1
	fmovdcc	%icc,	%f4,	%f8
	umulcc	%g6,	%l5,	%l6
	subcc	%l0,	0x131F,	%l2
	movvs	%icc,	%o3,	%i6
	mova	%xcc,	%o4,	%o6
	std	%f4,	[%l7 + 0x78]
	fmovsne	%xcc,	%f8,	%f13
	udiv	%g1,	0x135C,	%g3
	fandnot1	%f10,	%f8,	%f14
	edge8ln	%l4,	%i3,	%o2
	ldsw	[%l7 + 0x58],	%o0
	movcs	%xcc,	%i7,	%o5
	srlx	%i4,	%g2,	%g5
	sdivcc	%l3,	0x00A8,	%i1
	edge16l	%l1,	%o7,	%g4
	ldd	[%l7 + 0x38],	%f8
	sllx	%i5,	%i0,	%g7
	edge16l	%i2,	%g6,	%o1
	mulx	%l5,	0x1E58,	%l6
	xorcc	%l2,	0x1DA0,	%l0
	subccc	%o3,	%o4,	%o6
	movvc	%icc,	%g1,	%g3
	edge16ln	%l4,	%i3,	%i6
	ldsb	[%l7 + 0x44],	%o0
	edge16l	%i7,	%o2,	%i4
	andcc	%g2,	%g5,	%o5
	fpack16	%f10,	%f11
	stw	%i1,	[%l7 + 0x78]
	ldsw	[%l7 + 0x1C],	%l3
	fmul8x16	%f3,	%f14,	%f14
	st	%f5,	[%l7 + 0x5C]
	ldx	[%l7 + 0x30],	%l1
	lduh	[%l7 + 0x5E],	%o7
	movvc	%icc,	%g4,	%i5
	restore %i0, %i2, %g7
	fpsub32	%f2,	%f4,	%f10
	movcc	%xcc,	%g6,	%o1
	ldsw	[%l7 + 0x40],	%l5
	ld	[%l7 + 0x14],	%f14
	fnand	%f0,	%f2,	%f14
	fmovrslz	%l6,	%f8,	%f8
	movrgez	%l0,	0x009,	%o3
	movrgez	%l2,	%o6,	%o4
	ldsh	[%l7 + 0x2E],	%g1
	xnor	%g3,	%i3,	%l4
	movpos	%xcc,	%o0,	%i6
	edge16l	%o2,	%i4,	%i7
	edge8l	%g5,	%g2,	%o5
	andncc	%l3,	%l1,	%i1
	sdiv	%g4,	0x1113,	%i5
	fmuld8ulx16	%f8,	%f6,	%f8
	edge8	%o7,	%i2,	%g7
	fmovsne	%xcc,	%f11,	%f3
	ldd	[%l7 + 0x68],	%g6
	umul	%o1,	%i0,	%l5
	subcc	%l0,	%l6,	%l2
	movcc	%icc,	%o3,	%o6
	array16	%o4,	%g3,	%i3
	sth	%l4,	[%l7 + 0x14]
	ldsb	[%l7 + 0x51],	%g1
	edge8l	%i6,	%o0,	%o2
	mulx	%i7,	%i4,	%g2
	lduw	[%l7 + 0x14],	%o5
	edge16n	%l3,	%l1,	%g5
	movvc	%icc,	%g4,	%i5
	movvs	%xcc,	%i1,	%i2
	smul	%g7,	0x1E38,	%g6
	movcs	%xcc,	%o1,	%i0
	fnegs	%f0,	%f14
	umul	%l5,	0x0A92,	%o7
	addcc	%l0,	%l6,	%o3
	movne	%xcc,	%o6,	%l2
	movn	%xcc,	%o4,	%g3
	edge16	%i3,	%g1,	%l4
	srax	%i6,	0x0C,	%o0
	ldd	[%l7 + 0x68],	%o2
	fnegd	%f14,	%f2
	movrne	%i4,	0x158,	%i7
	movrgez	%g2,	0x25F,	%l3
	movcc	%icc,	%l1,	%g5
	edge8	%g4,	%i5,	%o5
	sdiv	%i1,	0x1BAB,	%g7
	edge16ln	%g6,	%i2,	%i0
	movpos	%xcc,	%o1,	%l5
	movpos	%icc,	%o7,	%l6
	movle	%xcc,	%l0,	%o3
	popc	0x0F68,	%o6
	fand	%f4,	%f10,	%f8
	movneg	%icc,	%o4,	%l2
	fors	%f5,	%f2,	%f7
	array16	%g3,	%g1,	%i3
	xorcc	%l4,	%o0,	%o2
	smul	%i4,	0x1E9F,	%i7
	umulcc	%g2,	%l3,	%i6
	array8	%g5,	%g4,	%i5
	mulscc	%l1,	0x1653,	%i1
	fmovsge	%xcc,	%f14,	%f15
	fnot1	%f8,	%f14
	for	%f10,	%f8,	%f0
	save %g7, %g6, %o5
	movrlz	%i0,	0x339,	%o1
	fnor	%f10,	%f12,	%f6
	fmovdl	%xcc,	%f7,	%f11
	ldsb	[%l7 + 0x3A],	%l5
	edge16ln	%i2,	%l6,	%o7
	edge8l	%o3,	%o6,	%l0
	stw	%l2,	[%l7 + 0x10]
	movrne	%g3,	0x0F1,	%o4
	fornot2s	%f8,	%f10,	%f8
	edge32n	%i3,	%l4,	%g1
	std	%f2,	[%l7 + 0x18]
	fmuld8sux16	%f0,	%f5,	%f14
	subcc	%o2,	%o0,	%i7
	edge8l	%i4,	%l3,	%g2
	ldub	[%l7 + 0x74],	%i6
	movcc	%icc,	%g5,	%i5
	edge32l	%l1,	%i1,	%g4
	umulcc	%g7,	%g6,	%o5
	movvs	%icc,	%i0,	%l5
	sllx	%o1,	%l6,	%i2
	fand	%f2,	%f14,	%f12
	movrgz	%o3,	0x116,	%o6
	fcmps	%fcc3,	%f7,	%f4
	edge16n	%l0,	%o7,	%l2
	ldd	[%l7 + 0x30],	%f14
	edge32ln	%g3,	%i3,	%o4
	subc	%l4,	%o2,	%o0
	umulcc	%i7,	%g1,	%l3
	addcc	%g2,	0x06F3,	%i4
	array16	%i6,	%g5,	%i5
	movneg	%icc,	%l1,	%i1
	fpadd32s	%f11,	%f9,	%f3
	faligndata	%f6,	%f10,	%f14
	xorcc	%g4,	0x0F48,	%g7
	udivx	%g6,	0x0371,	%o5
	restore %l5, %i0, %o1
	addccc	%l6,	%i2,	%o3
	array8	%l0,	%o6,	%o7
	array16	%l2,	%g3,	%o4
	xnorcc	%i3,	%o2,	%o0
	lduh	[%l7 + 0x0A],	%l4
	udivx	%g1,	0x015D,	%l3
	alignaddrl	%g2,	%i7,	%i4
	subcc	%g5,	%i6,	%l1
	addc	%i5,	%i1,	%g4
	orn	%g7,	0x1ECC,	%g6
	fmovsvc	%xcc,	%f11,	%f11
	edge16l	%l5,	%o5,	%o1
	stx	%i0,	[%l7 + 0x70]
	addc	%l6,	%i2,	%o3
	edge32	%l0,	%o6,	%o7
	umulcc	%g3,	%o4,	%l2
	ldsw	[%l7 + 0x28],	%i3
	xorcc	%o2,	%o0,	%g1
	fmovsg	%icc,	%f6,	%f3
	sethi	0x16AA,	%l3
	alignaddr	%g2,	%i7,	%i4
	subc	%l4,	0x169C,	%i6
	ldub	[%l7 + 0x71],	%g5
	fmovrsgz	%l1,	%f12,	%f12
	stw	%i1,	[%l7 + 0x30]
	edge8n	%i5,	%g4,	%g7
	movle	%xcc,	%g6,	%l5
	ldsb	[%l7 + 0x18],	%o5
	sdivx	%i0,	0x1A47,	%l6
	subcc	%i2,	0x1911,	%o3
	fnors	%f13,	%f3,	%f0
	sethi	0x175B,	%o1
	subcc	%o6,	%o7,	%g3
	fmovscs	%xcc,	%f10,	%f8
	move	%xcc,	%o4,	%l0
	save %l2, %i3, %o2
	edge8n	%g1,	%l3,	%g2
	movn	%icc,	%o0,	%i7
	movcc	%xcc,	%i4,	%l4
	fmovdg	%xcc,	%f12,	%f4
	fmovrdlz	%i6,	%f0,	%f6
	edge16l	%l1,	%i1,	%i5
	movne	%icc,	%g4,	%g7
	fcmpne32	%f4,	%f14,	%g5
	fnegd	%f6,	%f14
	andn	%g6,	%o5,	%i0
	fsrc1	%f6,	%f4
	fpadd32s	%f5,	%f2,	%f10
	fmovdpos	%xcc,	%f13,	%f14
	umulcc	%l6,	0x1D29,	%i2
	std	%f0,	[%l7 + 0x50]
	edge16l	%l5,	%o3,	%o6
	fand	%f0,	%f0,	%f2
	fexpand	%f15,	%f10
	andcc	%o7,	%o1,	%o4
	ld	[%l7 + 0x6C],	%f3
	move	%xcc,	%g3,	%l0
	ldsh	[%l7 + 0x20],	%l2
	fmovsleu	%icc,	%f0,	%f3
	movle	%xcc,	%o2,	%i3
	std	%f12,	[%l7 + 0x40]
	popc	%l3,	%g2
	stw	%g1,	[%l7 + 0x0C]
	edge16	%o0,	%i4,	%i7
	stx	%l4,	[%l7 + 0x50]
	fcmple16	%f8,	%f4,	%l1
	fmovsvc	%icc,	%f14,	%f11
	movge	%icc,	%i6,	%i5
	andncc	%i1,	%g4,	%g7
	andcc	%g6,	%g5,	%o5
	sdiv	%l6,	0x1811,	%i2
	fandnot1	%f0,	%f0,	%f10
	fnot2	%f10,	%f4
	edge32ln	%i0,	%o3,	%l5
	andncc	%o6,	%o7,	%o4
	orncc	%g3,	%l0,	%l2
	save %o2, 0x117A, %o1
	umulcc	%i3,	%g2,	%g1
	movge	%icc,	%l3,	%o0
	mova	%icc,	%i4,	%i7
	fand	%f2,	%f10,	%f2
	movpos	%xcc,	%l1,	%i6
	array16	%l4,	%i1,	%i5
	movre	%g4,	0x1F1,	%g6
	fcmpes	%fcc2,	%f11,	%f13
	andcc	%g5,	0x0A8E,	%g7
	xor	%o5,	%i2,	%i0
	udivx	%l6,	0x124F,	%o3
	udivcc	%o6,	0x0109,	%l5
	movpos	%xcc,	%o7,	%g3
	fmovsgu	%xcc,	%f9,	%f1
	lduh	[%l7 + 0x0A],	%o4
	movl	%xcc,	%l2,	%l0
	umul	%o1,	0x0911,	%i3
	fexpand	%f13,	%f6
	lduh	[%l7 + 0x0A],	%o2
	udiv	%g1,	0x1510,	%l3
	movge	%icc,	%o0,	%i4
	orn	%g2,	%l1,	%i7
	fmovrdlez	%l4,	%f4,	%f10
	edge8n	%i6,	%i1,	%i5
	sethi	0x15CC,	%g6
	movrne	%g4,	0x2C1,	%g7
	addc	%g5,	0x16B9,	%o5
	edge16n	%i2,	%i0,	%l6
	movcc	%xcc,	%o6,	%l5
	edge16n	%o7,	%o3,	%g3
	movrlez	%l2,	%l0,	%o1
	umulcc	%i3,	%o4,	%o2
	array8	%g1,	%o0,	%l3
	srlx	%i4,	0x01,	%l1
	fpadd32	%f6,	%f0,	%f14
	alignaddrl	%g2,	%i7,	%l4
	movrgz	%i1,	%i5,	%g6
	edge32	%i6,	%g4,	%g7
	udiv	%o5,	0x0C26,	%g5
	fcmpeq32	%f8,	%f10,	%i0
	edge8	%l6,	%o6,	%l5
	lduw	[%l7 + 0x08],	%o7
	sdiv	%i2,	0x1402,	%g3
	mulx	%l2,	0x0DB4,	%o3
	movvc	%xcc,	%o1,	%i3
	fmovscs	%icc,	%f13,	%f5
	smul	%l0,	0x1D44,	%o2
	edge16	%g1,	%o0,	%o4
	xorcc	%l3,	0x044C,	%i4
	movrne	%g2,	0x273,	%l1
	movvs	%xcc,	%i7,	%i1
	movpos	%icc,	%l4,	%g6
	array8	%i6,	%g4,	%i5
	edge16n	%g7,	%g5,	%o5
	edge8	%l6,	%i0,	%o6
	fsrc1s	%f10,	%f13
	lduh	[%l7 + 0x42],	%l5
	movge	%xcc,	%i2,	%g3
	fnor	%f0,	%f8,	%f8
	subcc	%o7,	%o3,	%l2
	orcc	%i3,	%o1,	%l0
	st	%f10,	[%l7 + 0x68]
	movrlz	%o2,	0x10F,	%g1
	fcmple16	%f10,	%f2,	%o4
	orncc	%o0,	%i4,	%g2
	fmovrdgz	%l3,	%f0,	%f4
	ldsw	[%l7 + 0x3C],	%i7
	orn	%l1,	0x03AE,	%i1
	fmovdpos	%icc,	%f10,	%f1
	subc	%l4,	0x0958,	%g6
	movrlz	%g4,	%i6,	%i5
	ldd	[%l7 + 0x58],	%g4
	ld	[%l7 + 0x48],	%f14
	movcs	%xcc,	%o5,	%l6
	xorcc	%g7,	0x002B,	%i0
	ld	[%l7 + 0x3C],	%f4
	srax	%o6,	0x1C,	%i2
	fpadd16s	%f2,	%f1,	%f9
	fmovsvc	%xcc,	%f2,	%f15
	subcc	%l5,	0x09BB,	%o7
	movre	%g3,	0x06F,	%o3
	fmovsn	%icc,	%f7,	%f2
	movvs	%xcc,	%i3,	%o1
	fmovrdlez	%l2,	%f14,	%f14
	fnot1s	%f4,	%f13
	array8	%o2,	%l0,	%g1
	movvc	%xcc,	%o4,	%i4
	movvc	%icc,	%o0,	%g2
	stw	%l3,	[%l7 + 0x6C]
	addccc	%l1,	%i7,	%l4
	fmovsne	%icc,	%f6,	%f1
	array16	%i1,	%g4,	%i6
	edge8	%i5,	%g5,	%o5
	movrlez	%g6,	0x1B8,	%g7
	movcs	%xcc,	%i0,	%l6
	stb	%i2,	[%l7 + 0x1C]
	andcc	%l5,	%o6,	%g3
	smul	%o7,	%o3,	%o1
	edge16ln	%l2,	%o2,	%l0
	edge8	%g1,	%o4,	%i3
	movre	%i4,	0x15E,	%g2
	sth	%o0,	[%l7 + 0x1E]
	movrne	%l1,	%l3,	%i7
	movrgez	%i1,	%g4,	%i6
	subc	%l4,	%i5,	%o5
	edge8ln	%g5,	%g6,	%i0
	edge16	%g7,	%l6,	%l5
	sdivcc	%o6,	0x1A09,	%g3
	ldsw	[%l7 + 0x28],	%i2
	or	%o7,	%o1,	%o3
	ldx	[%l7 + 0x50],	%l2
	movrlez	%o2,	%l0,	%o4
	srlx	%g1,	%i4,	%i3
	fabsd	%f8,	%f14
	movleu	%icc,	%o0,	%l1
	alignaddr	%g2,	%i7,	%l3
	fzeros	%f5
	srl	%i1,	0x1B,	%g4
	or	%l4,	0x0B3C,	%i6
	movl	%xcc,	%o5,	%g5
	movre	%g6,	%i0,	%i5
	addcc	%l6,	%g7,	%l5
	fands	%f14,	%f3,	%f4
	fcmpne16	%f8,	%f2,	%g3
	movvs	%xcc,	%i2,	%o6
	movge	%icc,	%o1,	%o3
	fand	%f6,	%f10,	%f10
	ldd	[%l7 + 0x28],	%l2
	array8	%o2,	%o7,	%l0
	sdiv	%g1,	0x02FC,	%i4
	ldd	[%l7 + 0x30],	%f6
	sllx	%o4,	%o0,	%l1
	sdivx	%g2,	0x0B0E,	%i7
	orn	%l3,	%i3,	%g4
	popc	%i1,	%i6
	fmul8x16	%f3,	%f8,	%f2
	fmovrsgz	%l4,	%f15,	%f11
	addccc	%g5,	0x1F6E,	%o5
	sra	%g6,	0x0B,	%i0
	srl	%l6,	0x14,	%i5
	fmovsn	%xcc,	%f4,	%f7
	array8	%g7,	%g3,	%i2
	movleu	%xcc,	%l5,	%o1
	udivcc	%o3,	0x1488,	%o6
	fmovrsne	%l2,	%f0,	%f15
	fmovdne	%xcc,	%f12,	%f15
	movge	%xcc,	%o2,	%o7
	fmuld8sux16	%f9,	%f0,	%f12
	fpack32	%f10,	%f6,	%f0
	movn	%icc,	%l0,	%i4
	movrgz	%o4,	0x34C,	%o0
	edge16	%g1,	%g2,	%l1
	movrlez	%l3,	0x3A7,	%i7
	fmuld8ulx16	%f7,	%f15,	%f6
	add	%g4,	0x1568,	%i3
	lduw	[%l7 + 0x50],	%i6
	fmovse	%icc,	%f14,	%f1
	array32	%i1,	%l4,	%o5
	fpack32	%f6,	%f8,	%f10
	lduh	[%l7 + 0x16],	%g5
	fone	%f14
	andcc	%i0,	%l6,	%g6
	srl	%i5,	0x01,	%g7
	fmovda	%xcc,	%f13,	%f4
	alignaddr	%g3,	%i2,	%o1
	movpos	%icc,	%o3,	%o6
	ld	[%l7 + 0x7C],	%f4
	fexpand	%f1,	%f10
	edge16l	%l2,	%l5,	%o2
	srlx	%l0,	0x16,	%i4
	movleu	%xcc,	%o4,	%o7
	subccc	%o0,	0x0249,	%g2
	addc	%l1,	0x08FC,	%l3
	andn	%i7,	%g4,	%g1
	stw	%i3,	[%l7 + 0x28]
	edge32l	%i1,	%l4,	%i6
	fornot1	%f10,	%f4,	%f4
	restore %g5, %o5, %l6
	sdivx	%i0,	0x1F14,	%g6
	lduw	[%l7 + 0x34],	%g7
	smulcc	%g3,	0x0A3C,	%i5
	and	%o1,	%i2,	%o6
	movg	%icc,	%l2,	%l5
	subcc	%o3,	0x133E,	%o2
	movrgez	%l0,	0x192,	%o4
	fandnot1	%f14,	%f4,	%f10
	lduw	[%l7 + 0x58],	%i4
	fandnot1	%f12,	%f10,	%f0
	edge8l	%o7,	%o0,	%l1
	fmovrde	%g2,	%f4,	%f10
	movgu	%icc,	%i7,	%l3
	movne	%xcc,	%g4,	%i3
	fzeros	%f12
	udivcc	%i1,	0x0FE3,	%g1
	ldsh	[%l7 + 0x12],	%i6
	udivx	%g5,	0x06E8,	%l4
	edge8l	%o5,	%l6,	%g6
	ldx	[%l7 + 0x60],	%g7
	mova	%icc,	%i0,	%g3
	fnot2s	%f6,	%f8
	movn	%xcc,	%i5,	%i2
	ldub	[%l7 + 0x2D],	%o6
	fpack32	%f8,	%f4,	%f0
	std	%f14,	[%l7 + 0x20]
	std	%f14,	[%l7 + 0x20]
	umul	%o1,	%l5,	%o3
	subccc	%l2,	0x1FC0,	%l0
	fnand	%f8,	%f0,	%f14
	fnot1	%f10,	%f0
	movg	%icc,	%o4,	%o2
	fornot2s	%f12,	%f10,	%f1
	mulscc	%o7,	0x1DDC,	%i4
	sllx	%l1,	%g2,	%i7
	orncc	%l3,	%g4,	%i3
	movrne	%o0,	%i1,	%i6
	subcc	%g5,	0x0D5A,	%g1
	array8	%l4,	%o5,	%g6
	array16	%l6,	%g7,	%i0
	fxors	%f0,	%f15,	%f14
	sdivcc	%g3,	0x18E8,	%i2
	edge16n	%i5,	%o1,	%o6
	movvc	%icc,	%o3,	%l2
	addc	%l5,	0x09FE,	%l0
	orn	%o4,	0x11FB,	%o7
	srl	%o2,	%i4,	%g2
	mulx	%i7,	%l1,	%g4
	sll	%i3,	0x05,	%o0
	ldd	[%l7 + 0x38],	%f4
	movne	%icc,	%l3,	%i1
	fabsd	%f4,	%f12
	edge32n	%g5,	%g1,	%l4
	movrlez	%o5,	%i6,	%l6
	edge32n	%g6,	%g7,	%g3
	xor	%i0,	0x186B,	%i2
	movcc	%icc,	%i5,	%o1
	lduw	[%l7 + 0x70],	%o6
	sdivcc	%o3,	0x1074,	%l2
	sra	%l0,	%l5,	%o4
	st	%f11,	[%l7 + 0x20]
	subc	%o2,	%i4,	%g2
	fmovrsgez	%i7,	%f13,	%f11
	udivx	%l1,	0x0132,	%g4
	udivx	%i3,	0x0276,	%o0
	ldd	[%l7 + 0x30],	%f14
	subc	%l3,	%o7,	%i1
	mulx	%g1,	0x0FF4,	%g5
	fornot1	%f2,	%f10,	%f6
	stb	%l4,	[%l7 + 0x5E]
	fmovrdgez	%o5,	%f2,	%f14
	fandnot1s	%f14,	%f0,	%f9
	mova	%icc,	%l6,	%i6
	add	%g6,	%g3,	%i0
	pdist	%f12,	%f8,	%f0
	mulscc	%i2,	%i5,	%g7
	smulcc	%o1,	%o3,	%l2
	sethi	0x04EE,	%l0
	movg	%xcc,	%o6,	%o4
	pdist	%f8,	%f8,	%f12
	add	%l5,	0x0C36,	%i4
	alignaddrl	%g2,	%o2,	%i7
	move	%xcc,	%g4,	%l1
	fcmpne32	%f2,	%f4,	%i3
	fmovs	%f9,	%f10
	array16	%l3,	%o7,	%i1
	udivcc	%g1,	0x1179,	%o0
	stx	%l4,	[%l7 + 0x68]
	move	%icc,	%g5,	%l6
	sdiv	%i6,	0x0CD6,	%o5
	sdivcc	%g6,	0x0A14,	%g3
	edge32	%i2,	%i0,	%g7
	fmovsne	%icc,	%f10,	%f12
	ldsb	[%l7 + 0x76],	%i5
	umulcc	%o1,	%l2,	%o3
	edge8	%o6,	%l0,	%o4
	mulx	%i4,	0x0D84,	%l5
	edge32	%o2,	%i7,	%g4
	edge32	%l1,	%g2,	%i3
	fandnot2	%f8,	%f0,	%f2
	ldsw	[%l7 + 0x48],	%o7
	sub	%l3,	%i1,	%o0
	edge8	%l4,	%g1,	%g5
	movrlez	%i6,	%l6,	%g6
	addccc	%g3,	0x0E0F,	%i2
	subcc	%i0,	0x1CBE,	%g7
	ldsb	[%l7 + 0x40],	%i5
	addccc	%o1,	0x0E98,	%o5
	std	%f0,	[%l7 + 0x78]
	umulcc	%o3,	0x0078,	%l2
	fcmpeq32	%f8,	%f8,	%l0
	ldsw	[%l7 + 0x48],	%o4
	fmovda	%xcc,	%f3,	%f3
	sdivx	%i4,	0x136A,	%l5
	array8	%o2,	%i7,	%o6
	or	%l1,	0x07C2,	%g4
	ldd	[%l7 + 0x68],	%i2
	movrlz	%o7,	0x113,	%l3
	orn	%i1,	%g2,	%l4
	array32	%o0,	%g1,	%i6
	popc	%g5,	%g6
	srlx	%l6,	%i2,	%g3
	mulscc	%i0,	0x0BB8,	%i5
	stx	%g7,	[%l7 + 0x50]
	fcmpgt32	%f6,	%f0,	%o5
	andn	%o1,	%o3,	%l2
	xnorcc	%o4,	0x1D1F,	%i4
	srax	%l5,	%l0,	%o2
	edge32l	%i7,	%o6,	%g4
	sllx	%l1,	0x1A,	%i3
	array32	%l3,	%o7,	%i1
	movleu	%icc,	%g2,	%l4
	udivcc	%g1,	0x03C7,	%o0
	ldsb	[%l7 + 0x31],	%i6
	ldsb	[%l7 + 0x21],	%g6
	edge8	%l6,	%g5,	%i2
	srlx	%g3,	0x1E,	%i5
	ldsw	[%l7 + 0x70],	%i0
	edge32l	%g7,	%o5,	%o1
	fpack16	%f10,	%f13
	andcc	%o3,	%o4,	%i4
	movgu	%icc,	%l2,	%l5
	subccc	%l0,	0x0FA8,	%i7
	sdiv	%o2,	0x052D,	%o6
	sub	%g4,	0x1774,	%i3
	fmovdgu	%xcc,	%f9,	%f7
	orn	%l3,	0x059C,	%o7
	fornot1	%f6,	%f2,	%f14
	st	%f6,	[%l7 + 0x14]
	fmovdcc	%icc,	%f5,	%f6
	ldx	[%l7 + 0x20],	%l1
	movpos	%icc,	%g2,	%l4
	edge32	%i1,	%g1,	%i6
	stb	%o0,	[%l7 + 0x28]
	fmovsne	%xcc,	%f1,	%f4
	stx	%l6,	[%l7 + 0x40]
	fand	%f4,	%f12,	%f14
	fxors	%f7,	%f4,	%f14
	andn	%g6,	%i2,	%g3
	srax	%i5,	0x1B,	%i0
	sra	%g7,	%o5,	%o1
	smulcc	%g5,	%o3,	%o4
	sll	%i4,	0x03,	%l5
	edge8n	%l2,	%l0,	%i7
	fcmpne32	%f0,	%f0,	%o6
	smul	%g4,	0x0838,	%o2
	movleu	%xcc,	%i3,	%l3
	fmovdl	%xcc,	%f4,	%f15
	sdivcc	%l1,	0x1C2E,	%g2
	sll	%l4,	0x1F,	%i1
	edge16n	%g1,	%i6,	%o7
	ldx	[%l7 + 0x58],	%o0
	sllx	%l6,	0x0C,	%g6
	andncc	%g3,	%i5,	%i0
	fnand	%f4,	%f8,	%f6
	sub	%i2,	0x0708,	%g7
	edge32	%o1,	%o5,	%g5
	edge32l	%o3,	%i4,	%o4
	edge16	%l2,	%l0,	%l5
	sethi	0x00DF,	%i7
	xor	%g4,	%o2,	%i3
	fmul8x16	%f5,	%f4,	%f12
	umulcc	%o6,	0x181A,	%l3
	stb	%g2,	[%l7 + 0x2E]
	for	%f6,	%f2,	%f10
	srax	%l4,	%i1,	%g1
	umulcc	%i6,	0x18CF,	%o7
	sdivx	%l1,	0x0666,	%o0
	fmovsl	%xcc,	%f7,	%f13
	ldd	[%l7 + 0x68],	%f12
	fmul8sux16	%f12,	%f8,	%f0
	fnors	%f10,	%f7,	%f12
	andcc	%l6,	%g3,	%g6
	movneg	%icc,	%i0,	%i2
	movrne	%g7,	%o1,	%o5
	fmovdgu	%xcc,	%f14,	%f5
	xnor	%i5,	%g5,	%i4
	movrlz	%o3,	0x3C0,	%o4
	fand	%f10,	%f6,	%f6
	fornot2	%f0,	%f4,	%f8
	fpmerge	%f14,	%f5,	%f14
	fcmpne32	%f14,	%f6,	%l0
	or	%l2,	%l5,	%i7
	andncc	%o2,	%i3,	%g4
	movrlz	%l3,	%o6,	%g2
	ldsh	[%l7 + 0x08],	%l4
	sra	%g1,	0x0D,	%i6
	addc	%i1,	0x1D40,	%o7
	stx	%l1,	[%l7 + 0x30]
	edge32ln	%o0,	%g3,	%l6
	srlx	%i0,	%i2,	%g6
	sra	%o1,	%g7,	%o5
	xnorcc	%g5,	0x0EE6,	%i4
	movg	%xcc,	%i5,	%o3
	fcmple32	%f4,	%f14,	%l0
	ldub	[%l7 + 0x7B],	%l2
	edge8	%o4,	%l5,	%o2
	stx	%i3,	[%l7 + 0x18]
	add	%i7,	%l3,	%g4
	movle	%icc,	%g2,	%l4
	std	%f10,	[%l7 + 0x40]
	ldd	[%l7 + 0x48],	%g0
	or	%o6,	0x1BAF,	%i6
	srax	%o7,	0x17,	%i1
	st	%f14,	[%l7 + 0x44]
	edge16n	%l1,	%g3,	%o0
	mulx	%i0,	%l6,	%g6
	fmovdle	%xcc,	%f2,	%f13
	array32	%o1,	%i2,	%o5
	srax	%g5,	%g7,	%i5
	orncc	%i4,	0x000D,	%l0
	save %o3, %l2, %l5
	std	%f10,	[%l7 + 0x50]
	sub	%o2,	%o4,	%i3
	ldsw	[%l7 + 0x40],	%l3
	subccc	%g4,	%i7,	%l4
	subcc	%g1,	0x06AC,	%g2
	edge32	%i6,	%o6,	%i1
	edge16ln	%o7,	%l1,	%g3
	lduh	[%l7 + 0x36],	%i0
	xorcc	%o0,	0x186A,	%g6
	xorcc	%l6,	0x15F0,	%o1
	movrgez	%i2,	%o5,	%g7
	and	%g5,	0x025E,	%i4
	edge16l	%l0,	%o3,	%l2
	or	%l5,	0x07AA,	%i5
	sub	%o2,	0x1BF0,	%o4
	movcs	%icc,	%i3,	%g4
	fmovscs	%xcc,	%f3,	%f10
	umulcc	%l3,	0x0C24,	%i7
	movgu	%icc,	%l4,	%g2
	lduw	[%l7 + 0x74],	%g1
	stb	%i6,	[%l7 + 0x29]
	ldsh	[%l7 + 0x1C],	%i1
	array16	%o7,	%o6,	%g3
	st	%f6,	[%l7 + 0x3C]
	edge32l	%l1,	%o0,	%g6
	fandnot2	%f2,	%f2,	%f10
	srax	%l6,	0x09,	%o1
	edge32n	%i2,	%o5,	%i0
	ldsb	[%l7 + 0x28],	%g5
	movcs	%xcc,	%g7,	%l0
	movneg	%icc,	%i4,	%l2
	movleu	%icc,	%o3,	%l5
	sdiv	%i5,	0x13A9,	%o4
	srl	%o2,	0x1A,	%i3
	umul	%l3,	0x0644,	%g4
	ldsb	[%l7 + 0x1B],	%i7
	fmovsle	%xcc,	%f8,	%f13
	ldsh	[%l7 + 0x10],	%l4
	fmovdvs	%icc,	%f4,	%f10
	fmovrdne	%g2,	%f0,	%f10
	movpos	%icc,	%g1,	%i6
	fcmpd	%fcc0,	%f12,	%f10
	movge	%icc,	%i1,	%o7
	ldsh	[%l7 + 0x66],	%g3
	st	%f2,	[%l7 + 0x30]
	edge32ln	%o6,	%o0,	%l1
	movleu	%icc,	%l6,	%o1
	edge8ln	%i2,	%o5,	%g6
	srl	%g5,	0x04,	%g7
	std	%f0,	[%l7 + 0x38]
	fmovdne	%xcc,	%f2,	%f10
	movrlez	%i0,	0x3AE,	%l0
	edge32n	%l2,	%o3,	%i4
	movleu	%icc,	%i5,	%l5
	movgu	%icc,	%o2,	%i3
	ldsb	[%l7 + 0x0E],	%l3
	andn	%o4,	0x0932,	%i7
	alignaddrl	%l4,	%g2,	%g1
	edge16n	%g4,	%i1,	%i6
	edge32	%g3,	%o6,	%o0
	smul	%o7,	0x1B9A,	%l6
	fcmpne16	%f10,	%f10,	%o1
	movvs	%icc,	%i2,	%o5
	sth	%g6,	[%l7 + 0x3A]
	sdivx	%g5,	0x003D,	%g7
	fmuld8ulx16	%f10,	%f15,	%f4
	fnands	%f4,	%f11,	%f3
	and	%i0,	0x126A,	%l0
	sth	%l2,	[%l7 + 0x20]
	edge16	%o3,	%l1,	%i5
	andncc	%l5,	%o2,	%i3
	movl	%icc,	%i4,	%o4
	sra	%l3,	0x13,	%l4
	mulx	%i7,	0x1AFC,	%g2
	popc	%g1,	%i1
	sdivcc	%g4,	0x1547,	%g3
	fmovsvs	%icc,	%f3,	%f7
	addccc	%o6,	0x16C2,	%o0
	fand	%f6,	%f8,	%f4
	edge32ln	%i6,	%l6,	%o7
	lduw	[%l7 + 0x38],	%o1
	mulscc	%o5,	0x0036,	%i2
	udiv	%g6,	0x1C1F,	%g5
	edge16n	%i0,	%g7,	%l2
	ldx	[%l7 + 0x38],	%o3
	edge8ln	%l1,	%l0,	%i5
	fpsub16	%f12,	%f8,	%f0
	udiv	%o2,	0x15BF,	%i3
	xnorcc	%l5,	%o4,	%l3
	and	%i4,	0x1BD7,	%l4
	array8	%i7,	%g1,	%i1
	std	%f4,	[%l7 + 0x28]
	movcs	%icc,	%g2,	%g4
	edge16ln	%g3,	%o6,	%i6
	fcmped	%fcc3,	%f8,	%f0
	sdivx	%o0,	0x0B35,	%o7
	stw	%o1,	[%l7 + 0x58]
	std	%f4,	[%l7 + 0x28]
	movpos	%icc,	%o5,	%l6
	fnot2s	%f15,	%f7
	lduw	[%l7 + 0x54],	%i2
	edge8n	%g6,	%i0,	%g5
	lduw	[%l7 + 0x0C],	%l2
	movge	%xcc,	%o3,	%l1
	and	%l0,	0x1116,	%i5
	fmovdl	%xcc,	%f9,	%f9
	srlx	%g7,	0x02,	%o2
	array8	%l5,	%o4,	%i3
	move	%xcc,	%l3,	%l4
	array8	%i4,	%g1,	%i7
	movrne	%g2,	0x0E3,	%i1
	fandnot1	%f14,	%f8,	%f12
	ldsh	[%l7 + 0x46],	%g4
	andncc	%o6,	%i6,	%o0
	fands	%f14,	%f11,	%f12
	fmovsgu	%icc,	%f13,	%f2
	popc	%o7,	%o1
	movn	%icc,	%o5,	%g3
	srlx	%l6,	%i2,	%g6
	srl	%i0,	0x1D,	%g5
	andcc	%l2,	%o3,	%l1
	sra	%i5,	%l0,	%g7
	movrne	%l5,	%o4,	%i3
	alignaddrl	%l3,	%o2,	%l4
	edge8	%i4,	%i7,	%g1
	mulx	%i1,	%g4,	%o6
	sdivx	%g2,	0x1464,	%i6
	srlx	%o0,	%o7,	%o1
	fcmpd	%fcc1,	%f8,	%f2
	or	%o5,	%g3,	%i2
	fnegs	%f6,	%f13
	movvs	%icc,	%g6,	%i0
	edge8ln	%g5,	%l2,	%o3
	xor	%l6,	%l1,	%l0
	array32	%i5,	%g7,	%l5
	sethi	0x1D32,	%i3
	fexpand	%f1,	%f10
	fmuld8sux16	%f2,	%f6,	%f8
	sll	%o4,	%o2,	%l3
	stw	%l4,	[%l7 + 0x7C]
	xorcc	%i7,	%g1,	%i1
	movn	%xcc,	%i4,	%o6
	edge8ln	%g2,	%i6,	%g4
	edge16	%o0,	%o1,	%o5
	fornot1s	%f3,	%f6,	%f11
	orn	%g3,	%o7,	%g6
	orcc	%i0,	0x1017,	%g5
	movrne	%i2,	%l2,	%o3
	smul	%l1,	%l6,	%i5
	ldub	[%l7 + 0x49],	%g7
	fnot1	%f0,	%f14
	fmovdcc	%xcc,	%f3,	%f5
	ld	[%l7 + 0x5C],	%f12
	save %l5, %i3, %l0
	movrlez	%o4,	0x076,	%l3
	movre	%l4,	0x1C8,	%i7
	movrne	%o2,	0x25A,	%g1
	andcc	%i1,	0x00BD,	%o6
	save %g2, %i6, %g4
	movl	%icc,	%i4,	%o1
	movge	%icc,	%o0,	%g3
	mova	%xcc,	%o5,	%g6
	subccc	%o7,	0x1D1B,	%g5
	array16	%i2,	%i0,	%o3
	movne	%xcc,	%l2,	%l6
	ldd	[%l7 + 0x08],	%f2
	srl	%l1,	0x0B,	%i5
	stb	%l5,	[%l7 + 0x37]
	and	%i3,	%l0,	%g7
	lduh	[%l7 + 0x28],	%o4
	fcmple32	%f10,	%f0,	%l4
	movl	%xcc,	%i7,	%l3
	umulcc	%g1,	0x0C81,	%i1
	udivx	%o6,	0x114D,	%g2
	xor	%o2,	0x1C5C,	%g4
	orn	%i4,	0x1CE2,	%i6
	edge16n	%o0,	%g3,	%o1
	movvc	%icc,	%o5,	%o7
	movrgez	%g6,	0x372,	%g5
	udiv	%i2,	0x1E3B,	%o3
	st	%f9,	[%l7 + 0x78]
	movpos	%xcc,	%l2,	%i0
	st	%f5,	[%l7 + 0x5C]
	fabsd	%f8,	%f6
	fmovrsgz	%l1,	%f12,	%f7
	fcmpeq16	%f2,	%f14,	%i5
	st	%f8,	[%l7 + 0x20]
	fpadd32	%f2,	%f2,	%f12
	sth	%l6,	[%l7 + 0x48]
	movg	%icc,	%i3,	%l0
	movn	%icc,	%g7,	%o4
	array16	%l4,	%i7,	%l5
	fabss	%f1,	%f7
	movrlz	%g1,	0x374,	%l3
	edge16ln	%o6,	%i1,	%g2
	smulcc	%g4,	%i4,	%i6
	movl	%icc,	%o2,	%g3
	sllx	%o1,	0x06,	%o0
	mulx	%o7,	%o5,	%g5
	alignaddr	%i2,	%o3,	%g6
	andn	%l2,	%i0,	%i5
	edge16l	%l6,	%i3,	%l1
	sethi	0x1351,	%g7
	orcc	%o4,	0x1882,	%l4
	movrlz	%i7,	%l5,	%g1
	sllx	%l0,	%l3,	%o6
	movge	%icc,	%g2,	%i1
	edge8	%i4,	%i6,	%g4
	andn	%g3,	%o2,	%o0
	edge8ln	%o7,	%o1,	%g5
	stb	%o5,	[%l7 + 0x7D]
	st	%f4,	[%l7 + 0x34]
	udivx	%i2,	0x1D9A,	%o3
	sll	%g6,	%i0,	%i5
	ldub	[%l7 + 0x24],	%l2
	sdivcc	%i3,	0x1AB6,	%l6
	edge16n	%l1,	%o4,	%l4
	ldx	[%l7 + 0x60],	%g7
	movvc	%icc,	%i7,	%l5
	fcmps	%fcc1,	%f5,	%f15
	and	%l0,	0x0FA5,	%l3
	udivx	%o6,	0x01A6,	%g2
	lduh	[%l7 + 0x0C],	%g1
	sdivcc	%i4,	0x1874,	%i1
	or	%g4,	0x0A91,	%g3
	sdivx	%o2,	0x0885,	%i6
	ldub	[%l7 + 0x1F],	%o0
	fpadd32s	%f1,	%f10,	%f4
	array32	%o7,	%g5,	%o1
	subcc	%o5,	0x1531,	%o3
	fcmpne32	%f2,	%f8,	%i2
	movrgz	%i0,	%g6,	%i5
	movvc	%icc,	%i3,	%l2
	subccc	%l6,	0x05D3,	%l1
	edge32n	%l4,	%g7,	%i7
	mova	%xcc,	%o4,	%l5
	xnorcc	%l3,	%l0,	%g2
	fandnot1s	%f5,	%f6,	%f14
	orncc	%o6,	%i4,	%i1
	udiv	%g1,	0x11AD,	%g3
	xnor	%g4,	%o2,	%i6
	sllx	%o0,	0x14,	%g5
	fmul8x16al	%f10,	%f2,	%f12
	udiv	%o1,	0x0A98,	%o7
	restore %o3, 0x114B, %i2
	edge32l	%o5,	%g6,	%i5
	ldsb	[%l7 + 0x6B],	%i0
	sdivcc	%i3,	0x02ED,	%l2
	addccc	%l1,	%l6,	%l4
	fcmpne16	%f4,	%f4,	%g7
	fnand	%f14,	%f4,	%f14
	fmovdpos	%icc,	%f11,	%f6
	fmovdneg	%icc,	%f12,	%f12
	addc	%o4,	0x033A,	%l5
	andn	%l3,	0x120A,	%i7
	andcc	%g2,	%l0,	%i4
	subcc	%o6,	0x0974,	%g1
	sdivcc	%i1,	0x1E88,	%g3
	orcc	%g4,	0x0D85,	%i6
	andn	%o0,	%o2,	%g5
	edge8	%o7,	%o3,	%i2
	sllx	%o1,	0x0C,	%g6
	save %o5, 0x1F55, %i5
	ldsh	[%l7 + 0x4E],	%i3
	edge8ln	%i0,	%l1,	%l6
	movrne	%l2,	%l4,	%g7
	andncc	%l5,	%l3,	%o4
	fcmple32	%f4,	%f2,	%i7
	fors	%f6,	%f6,	%f3
	lduh	[%l7 + 0x1E],	%g2
	mulx	%i4,	%o6,	%g1
	sethi	0x00F2,	%l0
	edge32n	%g3,	%i1,	%i6
	addcc	%o0,	%g4,	%o2
	ldd	[%l7 + 0x38],	%f4
	fmovrdlz	%o7,	%f10,	%f2
	edge32	%g5,	%o3,	%i2
	sth	%o1,	[%l7 + 0x64]
	edge8l	%o5,	%g6,	%i3
	fornot2s	%f1,	%f11,	%f14
	xor	%i0,	%l1,	%i5
	srax	%l6,	0x08,	%l2
	ldsh	[%l7 + 0x50],	%g7
	sllx	%l4,	%l3,	%l5
	fmovrsgez	%o4,	%f1,	%f15
	edge16ln	%i7,	%i4,	%o6
	and	%g1,	%g2,	%l0
	udivx	%i1,	0x0342,	%i6
	restore %o0, %g3, %o2
	sll	%o7,	0x1A,	%g5
	srax	%g4,	0x03,	%o3
	subc	%o1,	%i2,	%g6
	srax	%i3,	0x1B,	%i0
	ldx	[%l7 + 0x20],	%o5
	fmovdge	%icc,	%f14,	%f2
	edge32l	%l1,	%l6,	%l2
	addccc	%g7,	0x0EA2,	%l4
	edge16n	%i5,	%l3,	%o4
	alignaddr	%l5,	%i7,	%i4
	edge16	%o6,	%g2,	%g1
	edge16l	%i1,	%i6,	%l0
	edge16	%o0,	%g3,	%o7
	fmovsg	%xcc,	%f15,	%f1
	mulscc	%g5,	%g4,	%o3
	lduh	[%l7 + 0x48],	%o2
	std	%f6,	[%l7 + 0x08]
	andncc	%i2,	%g6,	%o1
	std	%f4,	[%l7 + 0x40]
	sll	%i0,	%i3,	%o5
	fmovdcc	%icc,	%f7,	%f0
	movrlez	%l1,	0x006,	%l2
	xor	%l6,	%l4,	%g7
	movvs	%xcc,	%l3,	%i5
	movleu	%xcc,	%o4,	%l5
	umulcc	%i4,	0x1A12,	%i7
	subcc	%g2,	0x06D7,	%g1
	srl	%i1,	%o6,	%i6
	movrlz	%l0,	0x0BC,	%o0
	fmovrse	%o7,	%f13,	%f11
	mulx	%g3,	0x04AD,	%g5
	edge8l	%g4,	%o2,	%i2
	movpos	%icc,	%o3,	%o1
	fnor	%f10,	%f10,	%f12
	movn	%xcc,	%i0,	%i3
	fmovdleu	%xcc,	%f8,	%f0
	fmovdcs	%icc,	%f12,	%f11
	ldsh	[%l7 + 0x22],	%g6
	smul	%l1,	0x06B5,	%l2
	ldd	[%l7 + 0x48],	%o4
	mulscc	%l4,	%g7,	%l6
	sll	%l3,	%o4,	%i5
	and	%l5,	0x0D16,	%i7
	stb	%i4,	[%l7 + 0x59]
	ldd	[%l7 + 0x08],	%f0
	smulcc	%g1,	0x1286,	%i1
	movrgez	%g2,	%i6,	%o6
	srax	%l0,	0x13,	%o7
	edge8	%g3,	%g5,	%o0
	edge32l	%o2,	%i2,	%g4
	fcmpes	%fcc0,	%f15,	%f4
	fmovrde	%o3,	%f14,	%f14
	fcmps	%fcc3,	%f14,	%f12
	edge16n	%o1,	%i3,	%i0
	smul	%l1,	0x02EF,	%g6
	ldsw	[%l7 + 0x28],	%l2
	fpadd32s	%f4,	%f12,	%f15
	edge32l	%l4,	%o5,	%g7
	stb	%l6,	[%l7 + 0x11]
	fmovdgu	%xcc,	%f12,	%f9
	andcc	%o4,	0x04F5,	%i5
	fmovsn	%icc,	%f10,	%f4
	fmovspos	%xcc,	%f5,	%f2
	edge32n	%l5,	%i7,	%i4
	fmovdvc	%icc,	%f6,	%f11
	fmovrsgz	%l3,	%f4,	%f3
	movcs	%icc,	%i1,	%g2
	movgu	%xcc,	%g1,	%i6
	movneg	%icc,	%l0,	%o7
	movg	%xcc,	%o6,	%g3
	fors	%f0,	%f14,	%f4
	udivcc	%o0,	0x1C05,	%g5
	ld	[%l7 + 0x08],	%f10
	stb	%i2,	[%l7 + 0x60]
	andncc	%o2,	%g4,	%o3
	ldd	[%l7 + 0x30],	%i2
	srlx	%o1,	0x09,	%l1
	orcc	%g6,	%l2,	%l4
	movcc	%icc,	%o5,	%i0
	fpadd16	%f14,	%f2,	%f8
	fmovrsgz	%g7,	%f14,	%f13
	sdivx	%l6,	0x0C3F,	%o4
	udivx	%i5,	0x0EC6,	%l5
	xnor	%i4,	%l3,	%i1
	umul	%i7,	%g1,	%g2
	faligndata	%f2,	%f8,	%f4
	stx	%l0,	[%l7 + 0x18]
	movpos	%icc,	%i6,	%o7
	sll	%g3,	%o6,	%o0
	edge16l	%i2,	%o2,	%g4
	move	%xcc,	%g5,	%o3
	ldd	[%l7 + 0x78],	%f0
	andn	%i3,	0x066B,	%o1
	udiv	%l1,	0x162B,	%g6
	edge8n	%l4,	%o5,	%i0
	alignaddr	%l2,	%l6,	%o4
	movrlz	%g7,	%l5,	%i4
	fpsub32s	%f2,	%f7,	%f7
	smulcc	%i5,	%l3,	%i7
	movn	%icc,	%g1,	%g2
	fmovdpos	%icc,	%f10,	%f6
	movvc	%icc,	%i1,	%i6
	edge8l	%o7,	%g3,	%l0
	srax	%o0,	%o6,	%o2
	fmul8x16au	%f1,	%f10,	%f4
	ldd	[%l7 + 0x70],	%f6
	std	%f10,	[%l7 + 0x50]
	udivcc	%g4,	0x18FD,	%i2
	fpadd32s	%f3,	%f13,	%f5
	edge8n	%o3,	%g5,	%o1
	fmovsle	%icc,	%f5,	%f7
	sth	%l1,	[%l7 + 0x1C]
	addcc	%g6,	%i3,	%o5
	fpsub16s	%f14,	%f13,	%f14
	array8	%i0,	%l2,	%l6
	edge8ln	%o4,	%l4,	%g7
	srax	%l5,	0x16,	%i5
	ldx	[%l7 + 0x10],	%l3
	edge8n	%i4,	%i7,	%g2
	subccc	%g1,	%i6,	%i1
	edge16l	%g3,	%o7,	%o0
	ldx	[%l7 + 0x30],	%l0
	xnorcc	%o2,	%g4,	%i2
	edge32	%o6,	%o3,	%g5
	orncc	%o1,	0x18D3,	%l1
	edge8n	%g6,	%o5,	%i0
	movl	%xcc,	%l2,	%i3
	fmul8ulx16	%f2,	%f12,	%f10
	fxnors	%f8,	%f9,	%f3
	fexpand	%f4,	%f0
	array8	%l6,	%o4,	%l4
	movrne	%g7,	%i5,	%l3
	udiv	%i4,	0x08E8,	%i7
	fmovscc	%icc,	%f5,	%f12
	movrgez	%g2,	%l5,	%i6
	fcmple32	%f10,	%f8,	%g1
	orcc	%g3,	0x1D14,	%i1
	edge32ln	%o7,	%o0,	%o2
	movrne	%l0,	%g4,	%o6
	fmul8x16al	%f15,	%f7,	%f4
	xorcc	%i2,	%g5,	%o1
	movge	%icc,	%o3,	%l1
	restore %g6, 0x0417, %i0
	stb	%l2,	[%l7 + 0x15]
	ldsw	[%l7 + 0x4C],	%o5
	movle	%xcc,	%i3,	%l6
	save %l4, 0x1AE9, %g7
	stw	%o4,	[%l7 + 0x7C]
	edge16n	%i5,	%l3,	%i7
	stw	%i4,	[%l7 + 0x30]
	edge16n	%g2,	%i6,	%g1
	sll	%g3,	0x1D,	%i1
	smulcc	%l5,	%o7,	%o2
	move	%icc,	%o0,	%l0
	fmovdvc	%xcc,	%f5,	%f1
	movre	%g4,	%o6,	%i2
	ldd	[%l7 + 0x28],	%g4
	movvs	%icc,	%o3,	%o1
	fands	%f12,	%f0,	%f15
	fmovrsne	%g6,	%f7,	%f0
	movrlez	%i0,	%l1,	%o5
	sll	%i3,	0x02,	%l2
	ldd	[%l7 + 0x08],	%i6
	orncc	%l4,	%g7,	%o4
	addccc	%i5,	%l3,	%i4
	ldsw	[%l7 + 0x0C],	%i7
	sdivcc	%g2,	0x1427,	%g1
	array16	%i6,	%g3,	%i1
	orcc	%l5,	%o2,	%o7
	edge32l	%o0,	%g4,	%o6
	movrlez	%i2,	0x367,	%l0
	sth	%o3,	[%l7 + 0x24]
	xor	%g5,	%o1,	%g6
	udivx	%i0,	0x1010,	%o5
	movn	%icc,	%i3,	%l1
	movge	%xcc,	%l2,	%l4
	edge32l	%g7,	%l6,	%i5
	movrgez	%l3,	%i4,	%o4
	fpadd32s	%f2,	%f13,	%f7
	restore %i7, 0x1B68, %g2
	edge8ln	%i6,	%g3,	%i1
	fnor	%f0,	%f2,	%f2
	fpsub32s	%f3,	%f3,	%f13
	sdivcc	%l5,	0x0CE7,	%o2
	movleu	%xcc,	%o7,	%o0
	sethi	0x1631,	%g1
	alignaddrl	%g4,	%o6,	%i2
	edge16n	%l0,	%o3,	%g5
	move	%icc,	%o1,	%g6
	sdivcc	%i0,	0x1666,	%o5
	xorcc	%l1,	0x003E,	%i3
	movgu	%icc,	%l4,	%l2
	lduw	[%l7 + 0x48],	%g7
	fcmpeq16	%f10,	%f10,	%i5
	smul	%l3,	%i4,	%l6
	edge8n	%i7,	%o4,	%g2
	movg	%xcc,	%g3,	%i6
	umul	%i1,	0x1D6E,	%o2
	ldub	[%l7 + 0x18],	%o7
	and	%l5,	0x1FC9,	%o0
	orn	%g4,	0x1D68,	%g1
	addc	%i2,	0x0EF6,	%l0
	fmovrsgz	%o3,	%f7,	%f7
	fmovdne	%icc,	%f6,	%f1
	alignaddrl	%o6,	%o1,	%g6
	fcmps	%fcc0,	%f6,	%f13
	movge	%xcc,	%i0,	%o5
	fmovdl	%xcc,	%f7,	%f11
	sllx	%g5,	%l1,	%l4
	fmul8x16	%f10,	%f10,	%f2
	alignaddrl	%l2,	%i3,	%i5
	subc	%g7,	%l3,	%l6
	addcc	%i7,	%i4,	%o4
	andcc	%g3,	%i6,	%g2
	movrgez	%i1,	0x246,	%o7
	movrgez	%o2,	0x329,	%l5
	edge16ln	%o0,	%g1,	%g4
	movcs	%icc,	%i2,	%l0
	sdivcc	%o6,	0x0B51,	%o3
	fones	%f12
	movn	%icc,	%g6,	%i0
	movre	%o1,	0x19C,	%g5
	fnor	%f0,	%f2,	%f10
	fpmerge	%f6,	%f13,	%f12
	ldub	[%l7 + 0x50],	%l1
	edge32ln	%l4,	%o5,	%l2
	udivx	%i3,	0x163E,	%i5
	ldub	[%l7 + 0x7F],	%g7
	fexpand	%f0,	%f0
	edge32l	%l3,	%i7,	%i4
	movn	%icc,	%l6,	%g3
	st	%f13,	[%l7 + 0x5C]
	movvs	%xcc,	%o4,	%i6
	movcs	%icc,	%g2,	%o7
	pdist	%f14,	%f12,	%f8
	ld	[%l7 + 0x70],	%f10
	save %o2, 0x1B65, %l5
	subcc	%o0,	%g1,	%g4
	srlx	%i1,	%i2,	%o6
	fnor	%f6,	%f10,	%f2
	fmovrse	%o3,	%f6,	%f2
	mulx	%g6,	%l0,	%i0
	movvs	%icc,	%g5,	%l1
	alignaddr	%o1,	%l4,	%o5
	addccc	%l2,	0x0CCD,	%i3
	edge16ln	%i5,	%g7,	%l3
	srax	%i7,	0x04,	%l6
	edge8l	%g3,	%i4,	%i6
	movcs	%icc,	%o4,	%o7
	fmovdne	%xcc,	%f14,	%f1
	ldsb	[%l7 + 0x6B],	%o2
	addccc	%l5,	%g2,	%g1
	fnor	%f2,	%f14,	%f12
	fmul8x16au	%f14,	%f4,	%f6
	xor	%o0,	0x1AA8,	%g4
	movle	%icc,	%i2,	%o6
	fnot2	%f10,	%f8
	edge16ln	%o3,	%g6,	%l0
	xnor	%i1,	%i0,	%g5
	ldx	[%l7 + 0x68],	%o1
	movle	%xcc,	%l1,	%o5
	edge8n	%l2,	%i3,	%i5
	fmovsl	%icc,	%f11,	%f11
	andcc	%l4,	%l3,	%g7
	fabsd	%f8,	%f10
	ldd	[%l7 + 0x38],	%f4
	fpsub32	%f6,	%f10,	%f4
	fmul8sux16	%f14,	%f8,	%f4
	ldsh	[%l7 + 0x0A],	%l6
	fmovdvc	%icc,	%f8,	%f13
	fmovdgu	%xcc,	%f2,	%f15
	movrlz	%g3,	0x01A,	%i7
	movleu	%xcc,	%i6,	%i4
	smul	%o7,	0x0392,	%o4
	movvs	%xcc,	%o2,	%l5
	alignaddr	%g2,	%o0,	%g4
	fcmpgt32	%f0,	%f14,	%i2
	mulx	%g1,	%o6,	%o3
	edge16ln	%g6,	%i1,	%l0
	lduh	[%l7 + 0x78],	%i0
	edge8ln	%g5,	%o1,	%o5
	movrne	%l2,	0x3CD,	%i3
	edge8	%l1,	%l4,	%l3
	popc	0x039C,	%g7
	sdivx	%l6,	0x099A,	%i5
	lduh	[%l7 + 0x46],	%g3
	sethi	0x1A4C,	%i7
	srax	%i4,	0x0B,	%o7
	edge8	%i6,	%o4,	%l5
	add	%g2,	%o2,	%o0
	movcc	%icc,	%i2,	%g4
	array32	%o6,	%g1,	%o3
	srax	%g6,	%l0,	%i0
	fpadd32s	%f2,	%f0,	%f15
	movgu	%icc,	%g5,	%i1
	movl	%icc,	%o1,	%l2
	edge32	%i3,	%o5,	%l4
	sdivcc	%l3,	0x1C02,	%l1
	fsrc1s	%f11,	%f1
	std	%f12,	[%l7 + 0x18]
	andncc	%g7,	%l6,	%i5
	movleu	%icc,	%i7,	%g3
	movrlz	%o7,	0x357,	%i6
	stw	%o4,	[%l7 + 0x30]
	fcmple32	%f2,	%f6,	%l5
	movn	%icc,	%g2,	%o2
	movg	%xcc,	%i4,	%i2
	edge16l	%o0,	%g4,	%o6
	fsrc2s	%f3,	%f0
	smul	%g1,	%g6,	%l0
	movge	%icc,	%o3,	%i0
	mulx	%g5,	%i1,	%o1
	fcmps	%fcc2,	%f12,	%f14
	xnor	%i3,	%l2,	%l4
	fpadd32s	%f1,	%f4,	%f7
	mulscc	%o5,	%l3,	%l1
	movrlez	%g7,	0x32D,	%l6
	udivx	%i7,	0x128A,	%g3
	movrlez	%i5,	0x352,	%i6
	andn	%o4,	0x03B7,	%l5
	movrlez	%g2,	%o7,	%i4
	srlx	%o2,	%i2,	%o0
	lduh	[%l7 + 0x5E],	%g4
	addccc	%o6,	%g6,	%g1
	andn	%o3,	%i0,	%g5
	fornot1s	%f8,	%f2,	%f9
	fsrc1s	%f6,	%f0
	alignaddr	%l0,	%i1,	%o1
	movl	%xcc,	%i3,	%l2
	addc	%l4,	%l3,	%o5
	smulcc	%l1,	%g7,	%i7
	edge8	%l6,	%i5,	%g3
	movcc	%xcc,	%o4,	%l5
	sra	%i6,	%g2,	%i4
	movcs	%xcc,	%o7,	%o2
	lduh	[%l7 + 0x7C],	%i2
	fpsub16s	%f14,	%f0,	%f11
	fmuld8ulx16	%f7,	%f13,	%f10
	srl	%o0,	%o6,	%g4
	xnorcc	%g6,	0x082E,	%g1
	edge8l	%o3,	%g5,	%i0
	movle	%icc,	%i1,	%l0
	edge8n	%i3,	%l2,	%l4
	xnor	%o1,	%l3,	%l1
	umul	%o5,	0x1645,	%i7
	srax	%g7,	0x08,	%i5
	xor	%l6,	%o4,	%l5
	smulcc	%g3,	%g2,	%i4
	and	%o7,	%o2,	%i6
	umul	%o0,	%i2,	%g4
	movn	%icc,	%g6,	%o6
	fandnot2	%f12,	%f4,	%f12
	fsrc2s	%f3,	%f5
	sub	%g1,	0x15BC,	%g5
	ldsh	[%l7 + 0x4E],	%i0
	movne	%icc,	%i1,	%l0
	andcc	%o3,	%i3,	%l4
	smulcc	%l2,	%l3,	%o1
	fmovrdne	%l1,	%f12,	%f10
	mulx	%i7,	0x17FC,	%o5
	or	%g7,	%i5,	%l6
	edge8	%o4,	%g3,	%l5
	fmovdn	%icc,	%f6,	%f7
	sub	%i4,	0x1147,	%o7
	movre	%o2,	%i6,	%g2
	ldd	[%l7 + 0x10],	%f6
	sdivx	%i2,	0x0F1F,	%g4
	fornot2	%f10,	%f4,	%f6
	stw	%o0,	[%l7 + 0x6C]
	alignaddr	%o6,	%g1,	%g5
	mova	%icc,	%i0,	%g6
	movne	%icc,	%l0,	%i1
	subc	%o3,	%i3,	%l2
	fmovsge	%icc,	%f8,	%f14
	fmovrslez	%l4,	%f7,	%f11
	lduw	[%l7 + 0x20],	%o1
	movvs	%xcc,	%l1,	%i7
	orcc	%l3,	0x16DB,	%o5
	udiv	%g7,	0x1A8F,	%i5
	sub	%o4,	%g3,	%l5
	movl	%xcc,	%l6,	%o7
	sdiv	%i4,	0x1D08,	%o2
	fmovrse	%i6,	%f6,	%f9
	fmovdgu	%icc,	%f10,	%f4
	fmovrdgz	%g2,	%f14,	%f8
	umulcc	%i2,	0x1DA8,	%g4
	orcc	%o0,	%o6,	%g1
	movne	%xcc,	%i0,	%g5
	edge16	%l0,	%i1,	%g6
	xnor	%o3,	0x04EF,	%i3
	edge16ln	%l2,	%l4,	%o1
	xor	%l1,	0x1010,	%i7
	movvs	%xcc,	%l3,	%g7
	movpos	%icc,	%i5,	%o5
	movg	%icc,	%o4,	%l5
	edge16l	%g3,	%l6,	%o7
	ld	[%l7 + 0x18],	%f9
	fpack16	%f8,	%f2
	and	%i4,	%o2,	%g2
	srl	%i2,	0x15,	%i6
	fzero	%f8
	sra	%o0,	%o6,	%g1
	movpos	%icc,	%g4,	%g5
	siam	0x4
	st	%f14,	[%l7 + 0x58]
	addccc	%i0,	%l0,	%g6
	ldsb	[%l7 + 0x79],	%i1
	smulcc	%o3,	0x1BA7,	%l2
	movl	%icc,	%i3,	%o1
	ldsb	[%l7 + 0x51],	%l4
	fcmpgt32	%f12,	%f12,	%l1
	mulscc	%l3,	0x06EB,	%i7
	fsrc2s	%f15,	%f10
	edge32n	%g7,	%i5,	%o4
	move	%icc,	%o5,	%l5
	fnand	%f4,	%f6,	%f10
	edge32ln	%l6,	%o7,	%i4
	movre	%o2,	0x153,	%g2
	and	%g3,	0x10E6,	%i2
	smul	%i6,	%o0,	%o6
	st	%f4,	[%l7 + 0x4C]
	stw	%g4,	[%l7 + 0x68]
	movgu	%icc,	%g1,	%g5
	addccc	%i0,	%g6,	%i1
	edge32ln	%o3,	%l2,	%i3
	movrgez	%l0,	0x22B,	%o1
	ldd	[%l7 + 0x10],	%f10
	fornot1	%f0,	%f12,	%f2
	sdiv	%l4,	0x15A6,	%l3
	st	%f8,	[%l7 + 0x5C]
	fmovdl	%xcc,	%f9,	%f4
	movvc	%icc,	%l1,	%i7
	movg	%icc,	%g7,	%o4
	std	%f10,	[%l7 + 0x30]
	movvs	%icc,	%o5,	%i5
	edge32	%l6,	%o7,	%l5
	fmovrdlz	%i4,	%f0,	%f4
	stx	%o2,	[%l7 + 0x48]
	sdiv	%g2,	0x1B94,	%i2
	fmul8x16au	%f13,	%f10,	%f0
	sethi	0x1B4C,	%g3
	edge8	%i6,	%o6,	%o0
	srax	%g1,	0x13,	%g4
	subc	%g5,	%i0,	%i1
	save %o3, %g6, %i3
	movrlez	%l0,	0x382,	%l2
	movre	%l4,	%o1,	%l1
	fpadd32	%f0,	%f4,	%f12
	array8	%l3,	%i7,	%g7
	xorcc	%o4,	0x03BA,	%i5
	alignaddr	%o5,	%l6,	%o7
	subccc	%i4,	%o2,	%l5
	fcmpeq16	%f0,	%f12,	%g2
	mulscc	%g3,	0x0E62,	%i6
	andcc	%i2,	%o0,	%g1
	subcc	%g4,	0x06DD,	%g5
	fxor	%f12,	%f4,	%f2
	fcmpgt32	%f14,	%f4,	%o6
	movgu	%icc,	%i0,	%i1
	edge8l	%g6,	%i3,	%o3
	xor	%l0,	%l4,	%l2
	fmovdg	%icc,	%f3,	%f2
	fmuld8ulx16	%f0,	%f15,	%f2
	ldub	[%l7 + 0x6D],	%o1
	movneg	%icc,	%l1,	%l3
	fandnot2	%f4,	%f2,	%f4
	fornot1s	%f3,	%f5,	%f5
	movrgez	%g7,	%i7,	%o4
	sdiv	%i5,	0x1BC2,	%l6
	fmovrslz	%o5,	%f7,	%f0
	std	%f6,	[%l7 + 0x68]
	add	%o7,	0x1694,	%i4
	or	%o2,	%g2,	%g3
	lduh	[%l7 + 0x38],	%i6
	ldsw	[%l7 + 0x24],	%i2
	save %o0, 0x046D, %l5
	fcmpne16	%f8,	%f14,	%g4
	movneg	%xcc,	%g5,	%o6
	orcc	%g1,	0x1BBE,	%i0
	sll	%g6,	%i3,	%i1
	fnegd	%f8,	%f4
	fandnot2	%f2,	%f4,	%f8
	edge16ln	%l0,	%l4,	%o3
	udivx	%l2,	0x0A19,	%l1
	sllx	%l3,	%g7,	%o1
	fmovdvs	%xcc,	%f11,	%f10
	edge16	%i7,	%i5,	%o4
	fabss	%f0,	%f6
	stx	%l6,	[%l7 + 0x48]
	restore %o7, 0x074E, %o5
	sdivx	%o2,	0x0544,	%g2
	stw	%g3,	[%l7 + 0x20]
	sllx	%i4,	%i6,	%i2
	for	%f2,	%f2,	%f2
	fmovsne	%xcc,	%f10,	%f8
	stx	%o0,	[%l7 + 0x50]
	mulscc	%l5,	%g4,	%g5
	alignaddr	%o6,	%g1,	%i0
	ldsb	[%l7 + 0x27],	%g6
	movleu	%icc,	%i3,	%i1
	ldd	[%l7 + 0x58],	%l4
	stb	%o3,	[%l7 + 0x54]
	for	%f12,	%f12,	%f10
	sra	%l2,	0x17,	%l1
	movne	%xcc,	%l3,	%l0
	movre	%o1,	0x193,	%g7
	sth	%i5,	[%l7 + 0x48]
	addccc	%i7,	0x0DAB,	%o4
	umul	%l6,	%o5,	%o7
	lduw	[%l7 + 0x54],	%g2
	fxnors	%f14,	%f0,	%f0
	mulx	%g3,	0x00FF,	%i4
	sub	%i6,	%o2,	%o0
	popc	0x179D,	%l5
	array32	%g4,	%g5,	%o6
	umul	%i2,	%i0,	%g1
	udiv	%i3,	0x1C79,	%g6
	sethi	0x049E,	%i1
	stb	%l4,	[%l7 + 0x5B]
	fmovrdgez	%o3,	%f14,	%f4
	ldsb	[%l7 + 0x57],	%l2
	sth	%l1,	[%l7 + 0x62]
	fones	%f10
	fmovdvs	%icc,	%f8,	%f12
	orncc	%l3,	0x1741,	%l0
	movrlz	%g7,	%o1,	%i7
	ldsb	[%l7 + 0x53],	%o4
	edge32ln	%i5,	%l6,	%o7
	movrgz	%g2,	0x2E1,	%g3
	fandnot1s	%f8,	%f10,	%f12
	srax	%o5,	0x11,	%i6
	array8	%i4,	%o2,	%l5
	umulcc	%g4,	0x1F1F,	%g5
	movcc	%xcc,	%o0,	%i2
	movn	%xcc,	%o6,	%g1
	mulscc	%i3,	0x1EBA,	%i0
	movge	%icc,	%i1,	%g6
	fpadd16	%f12,	%f14,	%f6
	movg	%icc,	%l4,	%l2
	movrlz	%o3,	%l1,	%l0
	save %l3, %g7, %o1
	sdivx	%o4,	0x1D7A,	%i7
	mulscc	%l6,	%i5,	%g2
	addccc	%g3,	0x0D05,	%o5
	lduw	[%l7 + 0x6C],	%o7
	andcc	%i4,	%i6,	%l5
	movn	%icc,	%o2,	%g4
	fcmpd	%fcc3,	%f6,	%f10
	lduw	[%l7 + 0x18],	%o0
	edge16l	%g5,	%i2,	%o6
	std	%f8,	[%l7 + 0x10]
	fsrc2	%f12,	%f10
	sethi	0x1044,	%g1
	fpsub16s	%f7,	%f3,	%f14
	sra	%i3,	%i0,	%g6
	fmovdvs	%icc,	%f3,	%f11
	ldd	[%l7 + 0x70],	%l4
	srlx	%l2,	%o3,	%i1
	movpos	%xcc,	%l1,	%l0
	fmovdg	%xcc,	%f9,	%f14
	andncc	%l3,	%g7,	%o1
	umul	%o4,	%l6,	%i5
	andncc	%i7,	%g3,	%g2
	edge32ln	%o7,	%o5,	%i6
	sdivx	%i4,	0x041F,	%l5
	movvs	%xcc,	%g4,	%o2
	fmovdge	%icc,	%f13,	%f15
	umul	%g5,	%i2,	%o0
	alignaddr	%g1,	%o6,	%i0
	mulscc	%i3,	0x0EBD,	%g6
	edge8n	%l4,	%l2,	%i1
	srl	%l1,	0x01,	%l0
	and	%o3,	0x0398,	%l3
	fmovda	%xcc,	%f0,	%f13
	array16	%o1,	%g7,	%l6
	ldsw	[%l7 + 0x54],	%i5
	movrlez	%o4,	%g3,	%i7
	movvc	%icc,	%o7,	%g2
	ldd	[%l7 + 0x30],	%i6
	ld	[%l7 + 0x64],	%f1
	movn	%xcc,	%i4,	%o5
	xnor	%g4,	0x1E84,	%o2
	fpsub16	%f4,	%f0,	%f2
	fnors	%f14,	%f6,	%f2
	movcs	%xcc,	%g5,	%i2
	fmovdle	%icc,	%f12,	%f12
	movne	%xcc,	%o0,	%g1
	fsrc2s	%f9,	%f4
	fmovdg	%icc,	%f8,	%f15
	udivcc	%o6,	0x0A62,	%i0
	restore %i3, %l5, %l4
	sll	%l2,	0x1E,	%i1
	fzeros	%f13
	edge16	%l1,	%g6,	%o3
	edge32ln	%l0,	%l3,	%o1
	sll	%l6,	0x0A,	%g7
	movcs	%icc,	%i5,	%o4
	restore %g3, 0x1F20, %o7
	addccc	%i7,	%g2,	%i6
	movre	%o5,	0x16D,	%g4
	movne	%xcc,	%i4,	%g5
	fmovsle	%icc,	%f11,	%f14
	array16	%o2,	%i2,	%g1
	ldsb	[%l7 + 0x0F],	%o0
	smul	%o6,	0x0029,	%i3
	and	%i0,	%l5,	%l2
	movneg	%icc,	%l4,	%i1
	add	%g6,	%o3,	%l0
	fmul8x16al	%f1,	%f13,	%f12
	sllx	%l3,	0x15,	%o1
	edge32l	%l1,	%g7,	%i5
	edge8l	%o4,	%l6,	%o7
	fmul8sux16	%f4,	%f4,	%f10
	sdivx	%g3,	0x13BD,	%g2
	add	%i7,	0x1E73,	%i6
	st	%f12,	[%l7 + 0x44]
	fxnor	%f4,	%f14,	%f4
	andcc	%g4,	%i4,	%g5
	movrgz	%o2,	%o5,	%i2
	umulcc	%o0,	%o6,	%i3
	edge8ln	%i0,	%l5,	%l2
	andncc	%g1,	%i1,	%g6
	subc	%l4,	0x1919,	%o3
	andcc	%l3,	0x1774,	%o1
	umulcc	%l0,	0x1E9F,	%g7
	st	%f2,	[%l7 + 0x44]
	stw	%l1,	[%l7 + 0x28]
	addc	%i5,	0x04EB,	%o4
	std	%f4,	[%l7 + 0x18]
	ldub	[%l7 + 0x1C],	%o7
	fcmpgt32	%f4,	%f6,	%g3
	movvs	%xcc,	%l6,	%i7
	stw	%g2,	[%l7 + 0x78]
	movneg	%xcc,	%i6,	%i4
	andn	%g4,	0x0F43,	%o2
	movrne	%o5,	%i2,	%o0
	srl	%g5,	%o6,	%i3
	edge32l	%l5,	%l2,	%g1
	xorcc	%i0,	%i1,	%l4
	movn	%icc,	%o3,	%l3
	movcs	%icc,	%o1,	%l0
	fandnot1	%f2,	%f12,	%f6
	sdiv	%g6,	0x1DEC,	%g7
	ldd	[%l7 + 0x10],	%i4
	movrgz	%o4,	0x30E,	%l1
	movneg	%icc,	%g3,	%l6
	edge32l	%i7,	%o7,	%g2
	xorcc	%i6,	0x0BFC,	%i4
	fcmple32	%f8,	%f4,	%g4
	sll	%o5,	0x10,	%i2
	for	%f12,	%f14,	%f0
	movcs	%xcc,	%o2,	%g5
	sra	%o0,	%o6,	%l5
	movge	%icc,	%l2,	%i3
	std	%f14,	[%l7 + 0x60]
	movcs	%icc,	%i0,	%i1
	edge16ln	%l4,	%g1,	%l3
	popc	%o3,	%o1
	sth	%l0,	[%l7 + 0x2C]
	edge8l	%g7,	%g6,	%o4
	movleu	%xcc,	%i5,	%g3
	ldub	[%l7 + 0x4E],	%l1
	fmovdgu	%icc,	%f5,	%f9
	lduh	[%l7 + 0x4A],	%l6
	movcs	%xcc,	%o7,	%g2
	movvs	%icc,	%i7,	%i6
	edge16l	%g4,	%i4,	%o5
	alignaddrl	%o2,	%g5,	%o0
	orncc	%o6,	%i2,	%l2
	addcc	%l5,	0x1E0B,	%i3
	fpackfix	%f4,	%f10
	save %i1, %l4, %g1
	udivx	%l3,	0x0E40,	%o3
	fmovdg	%xcc,	%f7,	%f4
	srlx	%o1,	%l0,	%i0
	subccc	%g7,	%g6,	%i5
	srl	%g3,	%l1,	%l6
	fmovrsgez	%o7,	%f1,	%f5
	subc	%o4,	0x19D3,	%g2
	ldsh	[%l7 + 0x0C],	%i6
	add	%g4,	0x0938,	%i4
	subc	%i7,	%o2,	%o5
	restore %g5, %o0, %i2
	fsrc2	%f14,	%f6
	srl	%l2,	0x17,	%l5
	movrgz	%i3,	%i1,	%l4
	fmovsgu	%icc,	%f7,	%f13
	stw	%o6,	[%l7 + 0x34]
	xor	%l3,	%g1,	%o1
	sra	%l0,	0x0C,	%o3
	movg	%xcc,	%g7,	%i0
	edge8	%g6,	%i5,	%g3
	fcmpgt16	%f8,	%f14,	%l6
	subccc	%o7,	0x14CF,	%o4
	edge8l	%g2,	%l1,	%g4
	mulscc	%i6,	%i7,	%o2
	sdivcc	%o5,	0x1F9C,	%i4
	stx	%o0,	[%l7 + 0x40]
	xor	%g5,	0x1A9A,	%l2
	lduw	[%l7 + 0x4C],	%l5
	umulcc	%i3,	%i1,	%l4
	sth	%o6,	[%l7 + 0x1C]
	orcc	%i2,	0x0871,	%l3
	movne	%icc,	%o1,	%g1
	fnegd	%f14,	%f8
	fexpand	%f9,	%f0
	alignaddr	%o3,	%g7,	%l0
	sdivx	%i0,	0x05CD,	%i5
	sethi	0x040E,	%g3
	sdivcc	%l6,	0x1EB2,	%g6
	for	%f0,	%f10,	%f8
	orncc	%o4,	%o7,	%g2
	sdivcc	%l1,	0x1569,	%g4
	sth	%i6,	[%l7 + 0x52]
	udivx	%i7,	0x1127,	%o5
	fxor	%f12,	%f14,	%f2
	fpsub32	%f14,	%f8,	%f6
	subc	%o2,	0x0658,	%o0
	popc	0x0A76,	%g5
	orn	%i4,	0x1EA3,	%l5
	for	%f4,	%f2,	%f14
	movrne	%l2,	0x04F,	%i3
	fpsub16	%f2,	%f10,	%f6
	alignaddrl	%l4,	%i1,	%i2
	movne	%xcc,	%o6,	%l3
	st	%f2,	[%l7 + 0x70]
	movg	%icc,	%o1,	%o3
	mova	%xcc,	%g7,	%l0
	movvs	%xcc,	%i0,	%g1
	alignaddr	%g3,	%l6,	%g6
	srax	%i5,	0x16,	%o4
	sllx	%g2,	0x08,	%o7
	fpack16	%f2,	%f0
	mova	%icc,	%l1,	%g4
	edge16ln	%i7,	%i6,	%o2
	or	%o5,	%o0,	%g5
	movrgz	%i4,	%l5,	%l2
	andn	%i3,	0x1664,	%i1
	addc	%l4,	%o6,	%i2
	movrne	%l3,	%o1,	%g7
	edge32n	%o3,	%i0,	%g1
	sllx	%l0,	%g3,	%l6
	andn	%g6,	%i5,	%g2
	stx	%o4,	[%l7 + 0x38]
	array32	%o7,	%g4,	%i7
	ldub	[%l7 + 0x64],	%i6
	fxor	%f14,	%f8,	%f2
	fones	%f8
	subccc	%o2,	%o5,	%o0
	fmovdcc	%xcc,	%f10,	%f3
	add	%l1,	%g5,	%l5
	edge8	%i4,	%l2,	%i3
	edge16	%i1,	%l4,	%o6
	movvs	%icc,	%i2,	%o1
	movvs	%xcc,	%g7,	%o3
	edge32l	%l3,	%i0,	%g1
	srl	%g3,	0x16,	%l6
	xorcc	%l0,	0x0DC6,	%i5
	umul	%g2,	0x1162,	%g6
	save %o7, 0x1B48, %g4
	movle	%xcc,	%o4,	%i7
	fcmple16	%f8,	%f8,	%o2
	edge8n	%i6,	%o0,	%l1
	movcc	%icc,	%g5,	%o5
	udivcc	%i4,	0x102B,	%l5
	std	%f14,	[%l7 + 0x30]
	sdivcc	%i3,	0x181B,	%l2
	fmuld8ulx16	%f8,	%f11,	%f6
	stb	%l4,	[%l7 + 0x4C]
	orncc	%o6,	%i2,	%o1
	alignaddr	%g7,	%o3,	%i1
	movneg	%icc,	%i0,	%l3
	xorcc	%g3,	%g1,	%l0
	fmovdle	%icc,	%f10,	%f4
	udivcc	%i5,	0x0EE8,	%l6
	fmuld8ulx16	%f9,	%f13,	%f0
	or	%g2,	0x11C9,	%o7
	fnegd	%f6,	%f4
	add	%g4,	%o4,	%g6
	subcc	%i7,	%o2,	%i6
	udiv	%l1,	0x122F,	%g5
	fsrc2	%f4,	%f12
	fmovrdgz	%o5,	%f0,	%f8
	edge32	%o0,	%l5,	%i3
	fnot2s	%f6,	%f7
	ldd	[%l7 + 0x68],	%l2
	stx	%l4,	[%l7 + 0x30]
	ld	[%l7 + 0x44],	%f1
	edge8l	%i4,	%i2,	%o6
	xor	%o1,	0x1183,	%g7
	movrne	%i1,	%o3,	%i0
	sllx	%g3,	%l3,	%l0
	edge32n	%i5,	%g1,	%l6
	array16	%o7,	%g2,	%o4
	udivcc	%g6,	0x000F,	%i7
	fxnor	%f0,	%f14,	%f8
	movrlz	%g4,	%i6,	%l1
	umul	%g5,	%o5,	%o0
	move	%icc,	%o2,	%l5
	subc	%l2,	0x0A48,	%i3
	sethi	0x18C2,	%l4
	edge16ln	%i4,	%i2,	%o1
	sra	%o6,	%i1,	%g7
	movn	%xcc,	%i0,	%o3
	addcc	%g3,	%l3,	%i5
	edge32l	%l0,	%l6,	%o7
	movrne	%g1,	0x0BA,	%o4
	subc	%g6,	0x07F7,	%g2
	fands	%f15,	%f3,	%f5
	movneg	%xcc,	%i7,	%i6
	movvs	%xcc,	%g4,	%g5
	andcc	%o5,	0x0533,	%l1
	edge32l	%o0,	%l5,	%l2
	fmovrdne	%o2,	%f12,	%f4
	fandnot1	%f12,	%f14,	%f4
	sll	%i3,	%l4,	%i2
	movge	%icc,	%o1,	%o6
	addc	%i4,	0x1AC9,	%g7
	fmovdvs	%xcc,	%f14,	%f5
	movg	%icc,	%i0,	%i1
	movrne	%g3,	%l3,	%i5
	subccc	%o3,	0x0B23,	%l6
	array8	%l0,	%g1,	%o7
	sdivcc	%g6,	0x1539,	%o4
	stx	%i7,	[%l7 + 0x38]
	fmovse	%icc,	%f7,	%f8
	andcc	%g2,	%g4,	%i6
	smulcc	%g5,	0x12A3,	%l1
	edge8n	%o5,	%l5,	%l2
	movneg	%icc,	%o0,	%o2
	fmul8ulx16	%f6,	%f10,	%f6
	sllx	%l4,	%i3,	%i2
	subcc	%o6,	%o1,	%i4
	move	%icc,	%g7,	%i0
	xnor	%g3,	0x09F7,	%l3
	movvc	%xcc,	%i5,	%o3
	orn	%i1,	%l6,	%l0
	orncc	%o7,	0x0DE2,	%g6
	andcc	%g1,	0x0487,	%o4
	movgu	%xcc,	%i7,	%g4
	ldd	[%l7 + 0x78],	%f2
	addccc	%i6,	%g2,	%l1
	orn	%g5,	0x0D95,	%o5
	array16	%l2,	%l5,	%o0
	sllx	%o2,	%l4,	%i2
	andn	%o6,	%i3,	%o1
	stb	%i4,	[%l7 + 0x36]
	xnorcc	%i0,	%g7,	%l3
	movrlz	%i5,	0x0A8,	%g3
	movcc	%icc,	%o3,	%i1
	xnorcc	%l6,	%o7,	%g6
	mulx	%g1,	0x1D7D,	%o4
	fands	%f2,	%f4,	%f2
	edge32	%i7,	%g4,	%i6
	fmovdvc	%icc,	%f5,	%f4
	fmovrsgez	%g2,	%f4,	%f11
	movleu	%xcc,	%l1,	%g5
	movneg	%xcc,	%o5,	%l2
	edge8n	%l0,	%l5,	%o0
	smul	%o2,	%i2,	%l4
	and	%i3,	0x082E,	%o1
	edge8ln	%i4,	%o6,	%i0
	movre	%l3,	0x202,	%g7
	stb	%g3,	[%l7 + 0x33]
	addc	%i5,	0x0813,	%o3
	sllx	%l6,	0x08,	%i1
	stw	%o7,	[%l7 + 0x58]
	restore %g1, %o4, %i7
	save %g4, 0x0344, %i6
	fsrc2s	%f8,	%f8
	subcc	%g6,	0x0FF2,	%g2
	ldsb	[%l7 + 0x27],	%l1
	move	%xcc,	%g5,	%l2
	or	%l0,	%l5,	%o0
	edge32l	%o5,	%i2,	%o2
	movvc	%xcc,	%i3,	%o1
	fmovde	%xcc,	%f12,	%f8
	fcmpne16	%f14,	%f2,	%l4
	srl	%i4,	0x1B,	%o6
	xorcc	%i0,	%l3,	%g7
	smul	%i5,	0x0E73,	%g3
	stw	%o3,	[%l7 + 0x08]
	srlx	%l6,	0x13,	%i1
	lduh	[%l7 + 0x6C],	%g1
	fpsub32s	%f12,	%f3,	%f7
	stx	%o7,	[%l7 + 0x18]
	edge8	%o4,	%i7,	%i6
	movneg	%xcc,	%g6,	%g4
	movgu	%icc,	%g2,	%l1
	ldd	[%l7 + 0x50],	%f6
	edge8ln	%g5,	%l0,	%l2
	ldsb	[%l7 + 0x55],	%o0
	ldsw	[%l7 + 0x18],	%l5
	edge8l	%o5,	%o2,	%i3
	edge8	%o1,	%l4,	%i4
	edge32	%i2,	%i0,	%o6
	movne	%xcc,	%l3,	%i5
	mulscc	%g3,	0x0D5A,	%g7
	fmovde	%xcc,	%f7,	%f5
	umul	%l6,	0x08EB,	%o3
	popc	0x0CC7,	%i1
	fmovrdlez	%o7,	%f12,	%f2
	fmul8sux16	%f6,	%f4,	%f14
	edge32ln	%g1,	%o4,	%i6
	ldsh	[%l7 + 0x76],	%g6
	ldsw	[%l7 + 0x38],	%i7
	movn	%xcc,	%g2,	%l1
	movrlez	%g4,	%l0,	%l2
	array32	%g5,	%l5,	%o5
	stb	%o0,	[%l7 + 0x08]
	movgu	%xcc,	%o2,	%o1
	umul	%i3,	%l4,	%i4
	edge32ln	%i2,	%o6,	%l3
	fmovrslez	%i5,	%f15,	%f2
	fxor	%f2,	%f10,	%f8
	movpos	%xcc,	%g3,	%i0
	edge16ln	%l6,	%o3,	%g7
	edge16	%o7,	%i1,	%g1
	lduh	[%l7 + 0x68],	%o4
	movl	%icc,	%g6,	%i7
	array8	%g2,	%l1,	%i6
	movvs	%xcc,	%g4,	%l0
	fpmerge	%f15,	%f9,	%f8
	edge8l	%l2,	%l5,	%g5
	edge32n	%o5,	%o0,	%o1
	stw	%o2,	[%l7 + 0x44]
	movrgz	%l4,	%i4,	%i3
	edge32n	%i2,	%o6,	%i5
	edge8l	%l3,	%g3,	%l6
	stx	%o3,	[%l7 + 0x18]
	fcmpeq32	%f4,	%f4,	%i0
	fandnot1s	%f8,	%f13,	%f12
	sll	%o7,	%i1,	%g1
	movne	%icc,	%g7,	%g6
	edge8n	%o4,	%g2,	%l1
	fmul8x16au	%f4,	%f2,	%f12
	xorcc	%i7,	%i6,	%g4
	ldsb	[%l7 + 0x3D],	%l2
	srax	%l5,	0x0B,	%g5
	fpack32	%f10,	%f0,	%f0
	ldsh	[%l7 + 0x4A],	%o5
	edge16ln	%o0,	%l0,	%o2
	edge32	%o1,	%l4,	%i3
	move	%xcc,	%i2,	%o6
	fmovrde	%i4,	%f6,	%f12
	subc	%l3,	%g3,	%l6
	and	%o3,	%i5,	%i0
	move	%xcc,	%o7,	%g1
	edge32ln	%g7,	%i1,	%o4
	movge	%icc,	%g6,	%g2
	edge16n	%i7,	%l1,	%g4
	fandnot1	%f14,	%f8,	%f2
	lduh	[%l7 + 0x6E],	%i6
	fmovsleu	%icc,	%f9,	%f13
	fxnor	%f0,	%f12,	%f8
	fzeros	%f7
	udivx	%l5,	0x0D6A,	%g5
	fmovde	%icc,	%f2,	%f6
	ldsb	[%l7 + 0x5A],	%o5
	subcc	%l2,	%o0,	%o2
	and	%l0,	%o1,	%i3
	fmovrse	%i2,	%f7,	%f5
	orn	%o6,	0x00C6,	%l4
	smulcc	%l3,	%i4,	%g3
	edge8ln	%o3,	%i5,	%i0
	orcc	%o7,	0x033D,	%g1
	edge8l	%l6,	%g7,	%o4
	sra	%g6,	%i1,	%i7
	edge32n	%g2,	%l1,	%i6
	movrlz	%l5,	0x20B,	%g5
	st	%f3,	[%l7 + 0x44]
	udivcc	%o5,	0x0D08,	%g4
	fpack16	%f4,	%f1
	movrlez	%o0,	%l2,	%l0
	add	%o1,	%o2,	%i3
	movgu	%xcc,	%i2,	%l4
	ldd	[%l7 + 0x78],	%f2
	movle	%icc,	%o6,	%l3
	alignaddr	%g3,	%i4,	%o3
	fmul8x16al	%f4,	%f5,	%f6
	subcc	%i5,	0x070E,	%i0
	movleu	%xcc,	%g1,	%l6
	restore %o7, 0x106E, %o4
	udiv	%g7,	0x171E,	%g6
	movvc	%icc,	%i7,	%i1
	pdist	%f14,	%f6,	%f14
	fcmps	%fcc0,	%f6,	%f1
	array8	%l1,	%i6,	%g2
	fabss	%f5,	%f10
	umul	%g5,	%l5,	%o5
	edge8n	%g4,	%o0,	%l0
	array16	%l2,	%o1,	%i3
	xnorcc	%i2,	0x0971,	%l4
	ldub	[%l7 + 0x57],	%o6
	subcc	%o2,	%g3,	%i4
	ldsh	[%l7 + 0x0A],	%l3
	sdivcc	%o3,	0x1DE1,	%i5
	fmovdg	%xcc,	%f2,	%f7
	movre	%g1,	0x21B,	%i0
	orcc	%o7,	%l6,	%g7
	edge8l	%g6,	%i7,	%o4
	movgu	%icc,	%l1,	%i6
	ldx	[%l7 + 0x48],	%i1
	ld	[%l7 + 0x64],	%f11
	fpsub32	%f2,	%f0,	%f8
	edge32n	%g2,	%l5,	%g5
	fornot2s	%f4,	%f2,	%f2
	fnot2s	%f11,	%f13
	fnot2s	%f4,	%f13
	fornot2s	%f1,	%f2,	%f14
	udivcc	%o5,	0x0525,	%g4
	movcs	%xcc,	%o0,	%l0
	fmuld8sux16	%f13,	%f15,	%f0
	edge8	%l2,	%o1,	%i2
	edge32l	%l4,	%o6,	%o2
	movrlz	%g3,	%i3,	%i4
	add	%l3,	%i5,	%o3
	alignaddrl	%g1,	%o7,	%l6
	movrlez	%i0,	%g7,	%g6
	fnors	%f1,	%f10,	%f14
	fnot2	%f2,	%f10
	xnorcc	%o4,	%l1,	%i6
	smul	%i7,	0x181D,	%i1
	edge32n	%l5,	%g5,	%g2
	movpos	%xcc,	%o5,	%g4
	edge32ln	%o0,	%l2,	%o1
	pdist	%f12,	%f0,	%f10
	movgu	%xcc,	%i2,	%l4
	ldd	[%l7 + 0x50],	%o6
	fcmple16	%f10,	%f8,	%o2
	addc	%l0,	0x01E9,	%i3
	fpsub16	%f6,	%f6,	%f10
	fmovda	%icc,	%f6,	%f4
	movne	%icc,	%g3,	%i4
	edge8n	%l3,	%o3,	%g1
	subc	%o7,	%i5,	%l6
	std	%f12,	[%l7 + 0x38]
	fandnot2s	%f12,	%f13,	%f7
	subccc	%g7,	%g6,	%o4
	movrlez	%l1,	%i6,	%i7
	subc	%i1,	0x17C2,	%i0
	edge32ln	%l5,	%g2,	%o5
	movcc	%xcc,	%g4,	%g5
	fcmpgt32	%f12,	%f8,	%o0
	andncc	%l2,	%i2,	%o1
	and	%l4,	%o6,	%l0
	umulcc	%i3,	0x1716,	%o2
	ldsb	[%l7 + 0x2B],	%g3
	srax	%l3,	%i4,	%g1
	xor	%o3,	%i5,	%l6
	addccc	%o7,	0x0A08,	%g6
	ldsb	[%l7 + 0x16],	%g7
	fmovsleu	%xcc,	%f1,	%f12
	xnor	%o4,	0x01AB,	%l1
	and	%i7,	0x003A,	%i6
	mulx	%i0,	0x1F36,	%i1
	movge	%icc,	%l5,	%o5
	movvs	%xcc,	%g2,	%g4
	fzero	%f4
	sra	%o0,	%g5,	%i2
	udivcc	%o1,	0x130F,	%l2
	andncc	%l4,	%l0,	%o6
	edge32l	%o2,	%i3,	%g3
	ldsb	[%l7 + 0x15],	%l3
	lduh	[%l7 + 0x24],	%i4
	orcc	%g1,	%o3,	%i5
	fmovrdlez	%l6,	%f2,	%f14
	subc	%o7,	0x1D3B,	%g6
	st	%f10,	[%l7 + 0x10]
	fornot1s	%f5,	%f13,	%f7
	ldx	[%l7 + 0x60],	%g7
	alignaddr	%l1,	%o4,	%i6
	alignaddrl	%i0,	%i7,	%i1
	siam	0x1
	movpos	%icc,	%o5,	%g2
	sub	%l5,	%g4,	%g5
	sll	%i2,	%o1,	%l2
	move	%xcc,	%o0,	%l4
	st	%f8,	[%l7 + 0x74]
	fmovdl	%xcc,	%f0,	%f1
	mulscc	%o6,	0x0718,	%o2
	sdivcc	%l0,	0x199B,	%g3
	edge8l	%i3,	%i4,	%g1
	srax	%l3,	%o3,	%i5
	fnand	%f8,	%f8,	%f2
	ldd	[%l7 + 0x10],	%o6
	edge32l	%l6,	%g6,	%g7
	ldsb	[%l7 + 0x72],	%o4
	orn	%i6,	%l1,	%i7
	fcmpes	%fcc3,	%f7,	%f7
	xor	%i0,	0x112F,	%o5
	movpos	%icc,	%g2,	%i1
	movcs	%xcc,	%g4,	%g5
	ldd	[%l7 + 0x30],	%f12
	xorcc	%l5,	%o1,	%l2
	st	%f0,	[%l7 + 0x18]
	xnorcc	%i2,	%l4,	%o6
	movne	%xcc,	%o2,	%o0
	st	%f1,	[%l7 + 0x40]
	stx	%g3,	[%l7 + 0x50]
	udivcc	%i3,	0x12FD,	%i4
	movneg	%xcc,	%l0,	%l3
	movrlz	%o3,	0x208,	%g1
	xorcc	%o7,	0x1CC3,	%l6
	move	%icc,	%i5,	%g6
	movle	%xcc,	%g7,	%i6
	edge32n	%o4,	%l1,	%i0
	ldsb	[%l7 + 0x22],	%o5
	movre	%i7,	%i1,	%g2
	orncc	%g5,	%l5,	%o1
	save %l2, %g4, %l4
	fpsub32	%f12,	%f0,	%f6
	edge32	%i2,	%o6,	%o0
	movne	%icc,	%o2,	%i3
	move	%icc,	%i4,	%l0
	array32	%l3,	%o3,	%g1
	restore %g3, %l6, %i5
	fcmpne16	%f4,	%f10,	%g6
	fpadd32	%f2,	%f2,	%f14
	fmovsa	%xcc,	%f14,	%f14
	movn	%icc,	%o7,	%i6
	fpadd16	%f8,	%f0,	%f2
	ldsb	[%l7 + 0x3D],	%g7
	fmovrdgez	%l1,	%f14,	%f8
	fors	%f14,	%f6,	%f2
	alignaddrl	%i0,	%o4,	%o5
	subccc	%i7,	0x0F01,	%i1
	xnorcc	%g5,	%g2,	%l5
	edge8	%l2,	%g4,	%l4
	edge8	%o1,	%i2,	%o6
	edge8	%o2,	%i3,	%i4
	ldd	[%l7 + 0x20],	%f12
	pdist	%f6,	%f12,	%f10
	fpmerge	%f7,	%f15,	%f0
	alignaddr	%o0,	%l3,	%o3
	sub	%g1,	0x0BB9,	%g3
	sethi	0x002B,	%l6
	fmovdl	%xcc,	%f9,	%f11
	movleu	%xcc,	%i5,	%g6
	ld	[%l7 + 0x48],	%f11
	fnegd	%f2,	%f0
	sra	%o7,	0x01,	%i6
	fmovde	%icc,	%f8,	%f2
	mulx	%l0,	0x1E93,	%l1
	fpadd16s	%f11,	%f7,	%f6
	fabsd	%f8,	%f4
	movn	%xcc,	%g7,	%i0
	stw	%o4,	[%l7 + 0x48]
	udiv	%o5,	0x0D44,	%i1
	orcc	%i7,	0x0FE4,	%g5
	edge16	%g2,	%l2,	%l5
	fmovsle	%icc,	%f0,	%f3
	movne	%icc,	%g4,	%o1
	addccc	%l4,	0x06B9,	%o6
	movre	%i2,	0x349,	%i3
	fmul8x16au	%f11,	%f7,	%f8
	fcmple16	%f8,	%f12,	%o2
	ldd	[%l7 + 0x58],	%o0
	udivx	%l3,	0x1B6E,	%o3
	edge32l	%i4,	%g1,	%g3
	movleu	%icc,	%l6,	%i5
	stb	%g6,	[%l7 + 0x29]
	fmul8ulx16	%f6,	%f8,	%f14
	stw	%o7,	[%l7 + 0x20]
	edge16	%i6,	%l0,	%l1
	andcc	%g7,	0x1B45,	%o4
	stb	%i0,	[%l7 + 0x1C]
	fcmpes	%fcc1,	%f1,	%f10
	std	%f2,	[%l7 + 0x10]
	st	%f9,	[%l7 + 0x20]
	addc	%i1,	%o5,	%g5
	fmovscc	%xcc,	%f15,	%f3
	save %i7, %l2, %g2
	andcc	%g4,	%o1,	%l4
	restore %l5, 0x0650, %i2
	ldsw	[%l7 + 0x7C],	%i3
	fmovscc	%xcc,	%f13,	%f0
	fpadd16	%f6,	%f6,	%f0
	edge16l	%o6,	%o2,	%l3
	fcmpd	%fcc1,	%f12,	%f0
	fabss	%f15,	%f4
	fcmpgt16	%f8,	%f6,	%o0
	fmovrsgez	%i4,	%f9,	%f9
	sllx	%g1,	%g3,	%o3
	fmovdleu	%xcc,	%f5,	%f3
	and	%i5,	%l6,	%g6
	fmovse	%icc,	%f6,	%f6
	fandnot2	%f0,	%f10,	%f14
	fmul8x16au	%f12,	%f13,	%f2
	movrne	%i6,	%l0,	%o7
	movcs	%xcc,	%l1,	%g7
	lduh	[%l7 + 0x70],	%o4
	alignaddr	%i1,	%o5,	%g5
	stw	%i7,	[%l7 + 0x28]
	fpack16	%f10,	%f10
	fmovrdgz	%i0,	%f8,	%f12
	fcmpeq16	%f2,	%f0,	%g2
	edge16	%l2,	%g4,	%o1
	alignaddr	%l4,	%i2,	%i3
	movle	%icc,	%o6,	%o2
	udiv	%l3,	0x09BF,	%l5
	edge8ln	%o0,	%g1,	%g3
	edge8	%i4,	%i5,	%o3
	udivcc	%g6,	0x0DE8,	%i6
	fmovrse	%l0,	%f3,	%f4
	edge32ln	%o7,	%l1,	%g7
	movre	%o4,	%l6,	%i1
	movrgz	%o5,	0x244,	%g5
	fmovsa	%icc,	%f4,	%f6
	andcc	%i0,	0x150E,	%i7
	udivcc	%g2,	0x0516,	%g4
	std	%f12,	[%l7 + 0x58]
	sdivx	%l2,	0x19AD,	%l4
	movge	%xcc,	%o1,	%i3
	fornot1	%f10,	%f6,	%f6
	ldsb	[%l7 + 0x7A],	%i2
	movre	%o6,	0x3D6,	%o2
	andcc	%l3,	0x0821,	%l5
	fcmple32	%f2,	%f14,	%o0
	subcc	%g3,	%i4,	%g1
	mulx	%i5,	0x0146,	%o3
	stb	%g6,	[%l7 + 0x6A]
	move	%xcc,	%i6,	%l0
	xnor	%l1,	%g7,	%o7
	alignaddr	%l6,	%o4,	%o5
	fmovspos	%icc,	%f15,	%f15
	subc	%g5,	%i1,	%i0
	udiv	%i7,	0x1A49,	%g2
	fmovdneg	%icc,	%f15,	%f12
	or	%g4,	%l4,	%o1
	ld	[%l7 + 0x68],	%f2
	srax	%i3,	0x17,	%l2
	array8	%o6,	%i2,	%l3
	smul	%o2,	%o0,	%l5
	umul	%i4,	%g3,	%i5
	movvc	%xcc,	%o3,	%g1
	sra	%g6,	%l0,	%i6
	stx	%l1,	[%l7 + 0x50]
	fcmple16	%f4,	%f12,	%o7
	mulx	%g7,	0x0357,	%l6
	addcc	%o4,	0x1E28,	%o5
	lduw	[%l7 + 0x78],	%i1
	fornot2s	%f11,	%f10,	%f9
	restore %i0, %g5, %i7
	lduh	[%l7 + 0x7C],	%g4
	movcc	%icc,	%l4,	%o1
	fnegs	%f3,	%f13
	ldsh	[%l7 + 0x24],	%i3
	addc	%l2,	0x1E99,	%g2
	movneg	%icc,	%o6,	%l3
	fcmpeq16	%f2,	%f8,	%o2
	xnorcc	%o0,	0x063B,	%i2
	edge16n	%l5,	%i4,	%g3
	movcs	%xcc,	%o3,	%g1
	movge	%icc,	%g6,	%l0
	fornot2s	%f13,	%f0,	%f11
	addcc	%i6,	0x1E1B,	%i5
	udivx	%o7,	0x044B,	%l1
	andncc	%g7,	%o4,	%l6
	umulcc	%o5,	%i1,	%g5
	fmovdcs	%icc,	%f5,	%f15
	ldsb	[%l7 + 0x2D],	%i0
	edge32	%i7,	%g4,	%l4
	fcmpne16	%f0,	%f4,	%o1
	save %l2, 0x1974, %i3
	orcc	%g2,	%o6,	%o2
	siam	0x5
	sub	%l3,	%i2,	%l5
	fmovde	%xcc,	%f4,	%f13
	popc	%o0,	%g3
	umul	%o3,	0x19CC,	%g1
	edge8ln	%i4,	%g6,	%l0
	fabss	%f14,	%f9
	fmul8x16al	%f1,	%f1,	%f10
	fmovdcc	%xcc,	%f10,	%f9
	fpsub32s	%f12,	%f6,	%f8
	subccc	%i5,	0x025B,	%o7
	smulcc	%l1,	%g7,	%o4
	udivcc	%l6,	0x1194,	%i6
	mulscc	%i1,	0x1B59,	%o5
	movne	%icc,	%i0,	%i7
	fmovdleu	%icc,	%f4,	%f5
	subcc	%g5,	%g4,	%o1
	edge16l	%l4,	%i3,	%l2
	udivx	%o6,	0x0621,	%o2
	fmovrsgz	%l3,	%f3,	%f10
	movvc	%xcc,	%g2,	%l5
	edge32l	%o0,	%i2,	%g3
	movn	%xcc,	%o3,	%i4
	fzeros	%f15
	movg	%icc,	%g6,	%g1
	mulx	%l0,	0x15D1,	%o7
	edge16l	%i5,	%l1,	%g7
	movpos	%icc,	%l6,	%i6
	popc	%i1,	%o4
	ldd	[%l7 + 0x08],	%o4
	movg	%xcc,	%i0,	%i7
	popc	%g5,	%o1
	edge32	%l4,	%g4,	%l2
	fmovrsne	%i3,	%f5,	%f15
	sdivx	%o2,	0x119C,	%o6
	fsrc1s	%f9,	%f9
	std	%f14,	[%l7 + 0x28]
	umul	%g2,	%l3,	%o0
	sll	%l5,	0x1E,	%g3
	addccc	%i2,	%i4,	%g6
	fmovscs	%icc,	%f15,	%f0
	srl	%g1,	%l0,	%o3
	restore %i5, 0x1D31, %o7
	movneg	%xcc,	%l1,	%l6
	ldub	[%l7 + 0x7E],	%g7
	orcc	%i1,	%o4,	%o5
	add	%i6,	%i0,	%g5
	smul	%o1,	%i7,	%l4
	andn	%g4,	%i3,	%l2
	fpsub32s	%f10,	%f3,	%f13
	xnor	%o6,	0x0887,	%g2
	sdivx	%l3,	0x0B17,	%o2
	fmovd	%f10,	%f10
	movge	%xcc,	%l5,	%g3
	pdist	%f6,	%f10,	%f2
	umulcc	%o0,	%i2,	%i4
	fnegs	%f14,	%f8
	andcc	%g1,	%g6,	%o3
	stb	%i5,	[%l7 + 0x4B]
	fcmpes	%fcc2,	%f4,	%f2
	edge8l	%l0,	%l1,	%o7
	ldub	[%l7 + 0x3D],	%l6
	array8	%i1,	%o4,	%o5
	and	%i6,	0x04BD,	%i0
	stb	%g5,	[%l7 + 0x7C]
	stx	%o1,	[%l7 + 0x40]
	sra	%g7,	%i7,	%g4
	edge8ln	%l4,	%l2,	%i3
	sra	%o6,	%g2,	%l3
	smulcc	%o2,	0x09C6,	%l5
	fandnot2	%f6,	%f12,	%f0
	stw	%g3,	[%l7 + 0x38]
	subc	%i2,	%i4,	%o0
	movcs	%icc,	%g6,	%o3
	xor	%g1,	0x1C1E,	%l0
	std	%f12,	[%l7 + 0x08]
	ldsb	[%l7 + 0x7C],	%l1
	movl	%xcc,	%o7,	%l6
	fcmpd	%fcc0,	%f8,	%f12
	orcc	%i1,	%i5,	%o5
	orn	%o4,	%i0,	%i6
	fnor	%f0,	%f10,	%f2
	sll	%o1,	0x05,	%g7
	ldsw	[%l7 + 0x38],	%g5
	subc	%g4,	0x153C,	%i7
	fmovdle	%xcc,	%f11,	%f12
	srl	%l4,	%l2,	%i3
	fpadd16s	%f15,	%f2,	%f5
	movn	%xcc,	%o6,	%g2
	fmovrse	%o2,	%f14,	%f3
	andcc	%l3,	0x0854,	%g3
	fone	%f12
	movvs	%icc,	%l5,	%i4
	fmovsa	%xcc,	%f12,	%f12
	sdivx	%o0,	0x0429,	%i2
	movrne	%o3,	%g1,	%g6
	movl	%icc,	%l1,	%o7
	addcc	%l6,	0x1543,	%i1
	movneg	%xcc,	%l0,	%i5
	array32	%o4,	%o5,	%i6
	lduw	[%l7 + 0x78],	%o1
	sethi	0x1882,	%g7
	ldd	[%l7 + 0x68],	%g4
	edge8l	%g4,	%i0,	%i7
	addc	%l4,	0x01F2,	%l2
	fors	%f4,	%f6,	%f8
	sub	%i3,	0x1909,	%o6
	orncc	%o2,	%g2,	%l3
	sub	%l5,	%g3,	%i4
	popc	%o0,	%i2
	fmul8x16	%f13,	%f12,	%f10
	ldsh	[%l7 + 0x5C],	%o3
	edge32ln	%g6,	%l1,	%g1
	sth	%o7,	[%l7 + 0x76]
	sethi	0x0A6B,	%i1
	and	%l0,	0x088F,	%i5
	lduw	[%l7 + 0x18],	%o4
	sub	%l6,	%i6,	%o1
	alignaddrl	%g7,	%o5,	%g5
	st	%f5,	[%l7 + 0x3C]
	addc	%g4,	0x11B2,	%i0
	addcc	%i7,	%l4,	%l2
	array16	%i3,	%o6,	%g2
	movrlez	%o2,	0x2A5,	%l5
	srl	%l3,	%g3,	%o0
	fmovse	%xcc,	%f6,	%f1
	lduh	[%l7 + 0x16],	%i4
	movrgez	%o3,	%g6,	%l1
	edge16ln	%i2,	%o7,	%i1
	fmovdg	%icc,	%f13,	%f7
	sub	%l0,	%i5,	%g1
	array32	%l6,	%i6,	%o4
	movrne	%o1,	0x2E1,	%g7
	fmovdpos	%icc,	%f10,	%f0
	fmovrdne	%o5,	%f10,	%f10
	udivcc	%g5,	0x1B46,	%g4
	ldd	[%l7 + 0x28],	%i0
	movrgez	%l4,	0x212,	%l2
	edge16	%i7,	%i3,	%o6
	add	%o2,	0x07A4,	%l5
	fnand	%f4,	%f0,	%f6
	movge	%icc,	%g2,	%g3
	add	%l3,	0x01D5,	%i4
	movn	%xcc,	%o0,	%o3
	udivx	%l1,	0x0948,	%g6
	ldsb	[%l7 + 0x4D],	%o7
	edge32	%i2,	%i1,	%l0
	fmovrse	%i5,	%f8,	%f1
	addccc	%g1,	%i6,	%o4
	ldsh	[%l7 + 0x50],	%l6
	fmovsvc	%icc,	%f15,	%f13
	fmovsgu	%xcc,	%f3,	%f9
	udiv	%o1,	0x118D,	%o5
	srlx	%g5,	0x00,	%g7
	fpadd16	%f8,	%f14,	%f0
	fmul8x16al	%f0,	%f15,	%f4
	umulcc	%i0,	0x00E0,	%g4
	srax	%l4,	0x15,	%l2
	movn	%xcc,	%i3,	%i7
	srlx	%o6,	%o2,	%l5
	movcc	%icc,	%g3,	%g2
	alignaddr	%i4,	%o0,	%o3
	edge8n	%l3,	%g6,	%o7
	stx	%l1,	[%l7 + 0x68]
	fmovd	%f12,	%f8
	xorcc	%i1,	%l0,	%i2
	movrne	%i5,	%g1,	%i6
	popc	0x0BF8,	%l6
	sdivcc	%o1,	0x0F32,	%o4
	orn	%g5,	0x0812,	%g7
	movge	%icc,	%i0,	%o5
	fnegd	%f8,	%f8
	movneg	%icc,	%g4,	%l2
	movvc	%xcc,	%i3,	%i7
	fornot1s	%f3,	%f10,	%f5
	fmovd	%f4,	%f6
	fxnor	%f0,	%f14,	%f4
	ldx	[%l7 + 0x60],	%l4
	edge32	%o2,	%l5,	%o6
	std	%f4,	[%l7 + 0x70]
	fpack16	%f12,	%f12
	mulscc	%g3,	0x18B6,	%g2
	st	%f12,	[%l7 + 0x10]
	stb	%i4,	[%l7 + 0x3B]
	edge8n	%o0,	%l3,	%o3
	ldsh	[%l7 + 0x14],	%g6
	movpos	%xcc,	%l1,	%i1
	ldd	[%l7 + 0x30],	%f12
	fone	%f4
	fcmple32	%f14,	%f0,	%o7
	ldsh	[%l7 + 0x5A],	%i2
	edge8n	%i5,	%l0,	%i6
	orn	%l6,	0x1736,	%g1
	sdiv	%o1,	0x06F4,	%o4
	or	%g7,	0x13E1,	%g5
	fnot2s	%f4,	%f14
	stw	%o5,	[%l7 + 0x58]
	edge8l	%g4,	%i0,	%l2
	restore %i7, %l4, %o2
	or	%l5,	0x18CF,	%i3
	sdivcc	%o6,	0x0220,	%g2
	array32	%g3,	%o0,	%l3
	addcc	%o3,	0x1371,	%g6
	ld	[%l7 + 0x4C],	%f7
	sll	%l1,	0x13,	%i1
	srax	%o7,	0x03,	%i4
	umulcc	%i5,	0x0E46,	%l0
	srl	%i2,	0x14,	%i6
	movcs	%xcc,	%l6,	%g1
	alignaddr	%o4,	%g7,	%g5
	std	%f2,	[%l7 + 0x20]
	subccc	%o1,	%g4,	%i0
	ldd	[%l7 + 0x58],	%f4
	edge16n	%o5,	%i7,	%l2
	udiv	%l4,	0x1372,	%o2
	movle	%xcc,	%i3,	%l5
	orncc	%g2,	0x006E,	%g3
	edge8ln	%o6,	%l3,	%o3
	fnors	%f10,	%f3,	%f15
	stx	%g6,	[%l7 + 0x58]
	fmovrdgz	%o0,	%f10,	%f0
	movrgez	%i1,	0x379,	%l1
	andncc	%i4,	%i5,	%o7
	fmovdvc	%icc,	%f12,	%f8
	fmovdgu	%icc,	%f7,	%f7
	edge32	%l0,	%i6,	%l6
	fmul8x16al	%f3,	%f14,	%f14
	fmovrsgz	%g1,	%f5,	%f14
	srl	%i2,	0x0D,	%g7
	std	%f0,	[%l7 + 0x48]
	fcmped	%fcc0,	%f10,	%f2
	smul	%o4,	%g5,	%g4
	alignaddr	%o1,	%o5,	%i7
	sth	%i0,	[%l7 + 0x16]
	sethi	0x08BD,	%l4
	movrgez	%o2,	%l2,	%l5
	fmovscc	%icc,	%f10,	%f9
	edge16	%g2,	%i3,	%o6
	alignaddr	%g3,	%o3,	%l3
	edge16	%o0,	%g6,	%i1
	sub	%i4,	%i5,	%l1
	xnor	%l0,	%i6,	%l6
	movne	%icc,	%o7,	%i2
	restore %g7, 0x0AE0, %o4
	fandnot1s	%f14,	%f4,	%f8
	movne	%icc,	%g1,	%g4
	sllx	%o1,	%o5,	%i7
	edge8ln	%g5,	%i0,	%l4
	fexpand	%f2,	%f12
	stb	%l2,	[%l7 + 0x17]
	fmovsvs	%icc,	%f7,	%f14
	fmovdle	%xcc,	%f12,	%f1
	std	%f14,	[%l7 + 0x20]
	udivx	%l5,	0x0967,	%g2
	sth	%o2,	[%l7 + 0x6A]
	addccc	%i3,	%o6,	%o3
	st	%f1,	[%l7 + 0x2C]
	ldub	[%l7 + 0x76],	%g3
	fmovdleu	%xcc,	%f9,	%f2
	movrgez	%l3,	%o0,	%i1
	fnegd	%f4,	%f6
	std	%f4,	[%l7 + 0x48]
	subcc	%g6,	0x01B1,	%i4
	sra	%i5,	0x00,	%l1
	sth	%i6,	[%l7 + 0x12]
	fmovdl	%xcc,	%f9,	%f14
	srax	%l6,	0x03,	%o7
	umulcc	%l0,	0x0C74,	%i2
	sdivcc	%g7,	0x01CB,	%g1
	popc	0x1E47,	%o4
	fpack32	%f12,	%f0,	%f14
	fmovdneg	%xcc,	%f13,	%f5
	mova	%icc,	%o1,	%g4
	andn	%o5,	0x057F,	%g5
	movn	%xcc,	%i0,	%i7
	movrgez	%l4,	%l2,	%g2
	fpadd16s	%f12,	%f9,	%f8
	edge32l	%l5,	%i3,	%o6
	sll	%o3,	0x1C,	%g3
	ldsh	[%l7 + 0x76],	%l3
	sra	%o2,	0x16,	%i1
	edge8n	%o0,	%i4,	%g6
	fmovsle	%xcc,	%f14,	%f15
	smul	%i5,	%i6,	%l6
	fnegd	%f12,	%f12
	fmovdvs	%icc,	%f14,	%f6
	andncc	%l1,	%l0,	%o7
	andn	%g7,	0x1C49,	%i2
	ldd	[%l7 + 0x48],	%g0
	subc	%o4,	0x0435,	%g4
	ldsb	[%l7 + 0x76],	%o5
	fmovrsne	%o1,	%f12,	%f14
	fxnor	%f12,	%f0,	%f2
	addccc	%g5,	0x0C6B,	%i0
	array16	%i7,	%l4,	%l2
	movpos	%xcc,	%l5,	%i3
	fmovsvs	%xcc,	%f14,	%f3
	srl	%o6,	0x08,	%o3
	movne	%xcc,	%g3,	%g2
	edge16	%l3,	%i1,	%o0
	fmovdn	%xcc,	%f11,	%f9
	edge16ln	%i4,	%g6,	%o2
	mova	%icc,	%i5,	%i6
	srax	%l1,	0x0D,	%l0
	movgu	%xcc,	%o7,	%g7
	sdiv	%i2,	0x1248,	%g1
	fmuld8ulx16	%f14,	%f0,	%f6
	stw	%o4,	[%l7 + 0x68]
	xnorcc	%l6,	0x152F,	%g4
	st	%f3,	[%l7 + 0x28]
	udivcc	%o1,	0x1253,	%g5
	movg	%xcc,	%o5,	%i7
	sllx	%i0,	%l2,	%l5
	orn	%l4,	0x06C5,	%o6
	array8	%o3,	%g3,	%i3
	movg	%icc,	%l3,	%g2
	addcc	%i1,	%i4,	%g6
	array8	%o2,	%i5,	%o0
	edge16l	%l1,	%l0,	%i6
	edge8	%o7,	%i2,	%g1
	edge8n	%g7,	%l6,	%g4
	stw	%o1,	[%l7 + 0x58]
	fcmpes	%fcc0,	%f7,	%f12
	fcmpgt32	%f0,	%f6,	%g5
	xnor	%o4,	0x00BB,	%i7
	std	%f0,	[%l7 + 0x60]
	sth	%o5,	[%l7 + 0x1E]
	addccc	%i0,	%l2,	%l5
	or	%o6,	%o3,	%g3
	edge32l	%i3,	%l4,	%g2
	fmovrdgez	%i1,	%f12,	%f0
	movgu	%icc,	%l3,	%i4
	andn	%o2,	%i5,	%g6
	ldsb	[%l7 + 0x2E],	%o0
	edge16n	%l1,	%i6,	%o7
	umulcc	%l0,	%i2,	%g1
	move	%xcc,	%g7,	%g4
	subccc	%l6,	%g5,	%o1
	movne	%icc,	%o4,	%i7
	edge16n	%i0,	%l2,	%l5
	save %o6, %o5, %g3
	fandnot2s	%f9,	%f14,	%f12
	popc	0x1896,	%i3
	srl	%l4,	0x19,	%o3
	fandnot2	%f12,	%f0,	%f4
	for	%f6,	%f14,	%f2
	fcmpeq32	%f12,	%f6,	%i1
	sdiv	%l3,	0x06C6,	%g2
	addcc	%i4,	%o2,	%i5
	fnegd	%f8,	%f8
	addcc	%g6,	%o0,	%l1
	fandnot2	%f8,	%f0,	%f6
	alignaddr	%i6,	%o7,	%l0
	or	%g1,	0x0590,	%i2
	std	%f8,	[%l7 + 0x08]
	alignaddr	%g7,	%l6,	%g5
	sub	%g4,	%o4,	%i7
	fands	%f1,	%f14,	%f13
	sllx	%o1,	%i0,	%l5
	xorcc	%l2,	0x0302,	%o6
	ldd	[%l7 + 0x38],	%g2
	faligndata	%f6,	%f12,	%f6
	movneg	%icc,	%o5,	%l4
	fand	%f4,	%f12,	%f0
	fmovsvc	%xcc,	%f3,	%f0
	ldd	[%l7 + 0x50],	%f12
	fnot1	%f8,	%f10
	edge32l	%o3,	%i3,	%l3
	fornot1s	%f10,	%f15,	%f0
	array8	%g2,	%i4,	%o2
	addcc	%i5,	0x02FA,	%g6
	subcc	%i1,	%o0,	%i6
	ldub	[%l7 + 0x59],	%o7
	sllx	%l0,	%g1,	%i2
	mova	%xcc,	%g7,	%l1
	srl	%l6,	%g4,	%g5
	fmovrdgz	%i7,	%f2,	%f12
	edge8l	%o4,	%i0,	%l5
	movpos	%icc,	%l2,	%o1
	array32	%g3,	%o5,	%o6
	fnot1s	%f6,	%f14
	fnot2	%f2,	%f4
	edge32l	%o3,	%i3,	%l3
	lduw	[%l7 + 0x7C],	%l4
	restore %g2, 0x0767, %o2
	fmul8x16al	%f10,	%f2,	%f6
	movrlez	%i4,	%i5,	%g6
	srl	%i1,	0x08,	%o0
	edge32	%o7,	%l0,	%i6
	umul	%i2,	0x0E38,	%g1
	ldsw	[%l7 + 0x30],	%g7
	movpos	%xcc,	%l1,	%g4
	movneg	%icc,	%l6,	%i7
	xorcc	%g5,	%o4,	%i0
	sra	%l5,	0x02,	%o1
	lduh	[%l7 + 0x12],	%g3
	fsrc1s	%f10,	%f13
	edge16n	%l2,	%o5,	%o3
	movneg	%xcc,	%o6,	%l3
	fmovsne	%icc,	%f3,	%f9
	srlx	%l4,	0x08,	%i3
	edge8	%o2,	%g2,	%i4
	fcmpes	%fcc0,	%f3,	%f0
	edge8	%g6,	%i1,	%o0
	sethi	0x1AF6,	%i5
	popc	0x0C36,	%o7
	fmul8sux16	%f8,	%f8,	%f6
	fcmple16	%f0,	%f12,	%l0
	umulcc	%i2,	0x016B,	%g1
	edge16ln	%i6,	%g7,	%l1
	fpsub32s	%f12,	%f8,	%f14
	sra	%l6,	0x1E,	%g4
	movneg	%xcc,	%g5,	%i7
	movcc	%xcc,	%i0,	%l5
	umulcc	%o1,	0x053C,	%g3
	subcc	%l2,	%o4,	%o3
	fpadd16	%f4,	%f14,	%f12
	ldsw	[%l7 + 0x24],	%o6
	edge16l	%l3,	%o5,	%l4
	edge16l	%o2,	%g2,	%i4
	save %g6, 0x07EC, %i3
	movvc	%icc,	%i1,	%o0
	fnand	%f8,	%f8,	%f4
	edge16n	%o7,	%i5,	%i2
	fnor	%f12,	%f8,	%f6
	array16	%l0,	%g1,	%g7
	umul	%i6,	%l1,	%l6
	edge32	%g5,	%g4,	%i7
	stb	%l5,	[%l7 + 0x4B]
	sdiv	%i0,	0x05EB,	%g3
	fmovse	%icc,	%f2,	%f14
	addcc	%l2,	0x026C,	%o4
	addcc	%o3,	0x1D2F,	%o6
	fabss	%f3,	%f11
	fmovdvs	%icc,	%f6,	%f0
	movre	%l3,	0x240,	%o1
	sth	%o5,	[%l7 + 0x24]
	sra	%o2,	%l4,	%g2
	lduh	[%l7 + 0x72],	%i4
	movrgez	%i3,	0x23B,	%g6
	subc	%o0,	%o7,	%i5
	movrlz	%i2,	%i1,	%g1
	movre	%g7,	%l0,	%l1
	fmul8x16au	%f1,	%f5,	%f10
	udivx	%l6,	0x1CA2,	%g5
	udiv	%g4,	0x14BB,	%i7
	movre	%l5,	%i6,	%g3
	subc	%i0,	0x0E9D,	%l2
	fmovdgu	%icc,	%f3,	%f13
	alignaddrl	%o4,	%o6,	%o3
	stb	%o1,	[%l7 + 0x5F]
	movrgz	%l3,	%o5,	%o2
	ldx	[%l7 + 0x28],	%l4
	fmovdl	%xcc,	%f11,	%f7
	orn	%g2,	%i4,	%i3
	movrlz	%o0,	%o7,	%g6
	movpos	%icc,	%i5,	%i1
	fmovdcc	%icc,	%f13,	%f12
	edge8n	%g1,	%i2,	%l0
	sth	%g7,	[%l7 + 0x10]
	edge8l	%l1,	%g5,	%g4
	umulcc	%l6,	0x17FE,	%l5
	sdivx	%i7,	0x11B9,	%g3
	sllx	%i0,	0x0D,	%i6
	umulcc	%o4,	0x095E,	%o6
	ldd	[%l7 + 0x68],	%l2
	fmul8ulx16	%f6,	%f14,	%f4
	edge32ln	%o3,	%l3,	%o1
	udiv	%o5,	0x06D2,	%o2
	popc	0x1EB8,	%g2
	edge8	%i4,	%i3,	%o0
	edge16	%l4,	%o7,	%g6
	srl	%i1,	%i5,	%i2
	movne	%xcc,	%l0,	%g7
	smulcc	%g1,	0x12A0,	%g5
	fpack32	%f0,	%f14,	%f6
	movcc	%icc,	%g4,	%l6
	fpadd32	%f8,	%f14,	%f6
	andncc	%l5,	%i7,	%g3
	orn	%l1,	%i0,	%o4
	smulcc	%o6,	%l2,	%o3
	edge8ln	%l3,	%o1,	%o5
	orcc	%o2,	0x1380,	%i6
	movne	%xcc,	%g2,	%i3
	fmovrde	%i4,	%f14,	%f6
	mulscc	%l4,	0x1DFF,	%o0
	smul	%g6,	0x14F3,	%o7
	sll	%i1,	0x1B,	%i2
	orcc	%l0,	0x1DC3,	%g7
	for	%f2,	%f8,	%f0
	udiv	%g1,	0x0CB6,	%i5
	fmovs	%f13,	%f3
	movrgz	%g4,	%g5,	%l5
	movrne	%l6,	%g3,	%i7
	fmovdg	%icc,	%f3,	%f1
	smulcc	%i0,	%o4,	%l1
	edge16	%l2,	%o3,	%o6
	save %l3, %o1, %o2
	movneg	%icc,	%i6,	%g2
	ldx	[%l7 + 0x78],	%i3
	lduh	[%l7 + 0x08],	%o5
	fmovsg	%icc,	%f3,	%f13
	fmovrdlez	%i4,	%f10,	%f0
	ld	[%l7 + 0x2C],	%f0
	subccc	%o0,	0x0709,	%l4
	edge8	%g6,	%i1,	%o7
	fmovdneg	%icc,	%f0,	%f0
	move	%xcc,	%i2,	%l0
	fmul8ulx16	%f6,	%f8,	%f10
	udivcc	%g7,	0x1318,	%i5
	fmovdl	%xcc,	%f0,	%f10
	addc	%g1,	0x0FB0,	%g5
	movcs	%icc,	%l5,	%g4
	fabsd	%f0,	%f6
	fmovsleu	%xcc,	%f3,	%f15
	edge16	%g3,	%l6,	%i7
	fmovdge	%icc,	%f9,	%f9
	array32	%i0,	%l1,	%o4
	array8	%o3,	%l2,	%l3
	edge32n	%o1,	%o6,	%i6
	fxors	%f13,	%f12,	%f0
	srax	%o2,	0x0D,	%i3
	fmovsa	%xcc,	%f0,	%f15
	ldd	[%l7 + 0x78],	%g2
	srl	%i4,	%o0,	%l4
	fcmped	%fcc2,	%f0,	%f12
	orcc	%g6,	%o5,	%o7
	ldsw	[%l7 + 0x10],	%i2
	movrlz	%i1,	%g7,	%l0
	array8	%g1,	%g5,	%l5
	addcc	%i5,	%g4,	%l6
	movneg	%icc,	%g3,	%i7
	movn	%icc,	%i0,	%l1
	fmul8x16au	%f14,	%f10,	%f8
	srlx	%o4,	%l2,	%o3
	sdivx	%l3,	0x1AD7,	%o1
	ldd	[%l7 + 0x60],	%o6
	movne	%xcc,	%i6,	%i3
	fmovsge	%icc,	%f13,	%f5
	edge32	%g2,	%i4,	%o2
	movge	%xcc,	%l4,	%g6
	ld	[%l7 + 0x14],	%f9
	array32	%o0,	%o5,	%i2
	movcc	%icc,	%i1,	%o7
	movrlz	%g7,	%g1,	%g5
	alignaddr	%l0,	%l5,	%g4
	fmovrdne	%l6,	%f14,	%f12
	stx	%g3,	[%l7 + 0x08]
	movrlz	%i7,	0x1D8,	%i5
	srl	%l1,	0x17,	%o4
	bshuffle	%f0,	%f2,	%f4
	stb	%l2,	[%l7 + 0x4C]
	std	%f6,	[%l7 + 0x08]
	fmovrse	%o3,	%f4,	%f11
	fornot1s	%f9,	%f8,	%f8
	siam	0x7
	umulcc	%l3,	%o1,	%i0
	fpadd32s	%f0,	%f9,	%f4
	orn	%i6,	%i3,	%g2
	addccc	%i4,	%o6,	%l4
	smulcc	%o2,	0x15C0,	%g6
	array8	%o0,	%i2,	%o5
	std	%f8,	[%l7 + 0x30]
	srlx	%o7,	0x0A,	%g7
	movvc	%icc,	%g1,	%g5
	fmovsa	%icc,	%f2,	%f3
	edge32l	%l0,	%l5,	%g4
	movge	%icc,	%l6,	%g3
	fnegs	%f14,	%f10
	edge8n	%i7,	%i5,	%l1
	sethi	0x1BD4,	%o4
	subccc	%i1,	0x085B,	%o3
	smulcc	%l2,	%l3,	%i0
	movle	%xcc,	%i6,	%i3
	array8	%o1,	%g2,	%i4
	movleu	%xcc,	%o6,	%l4
	orn	%o2,	%g6,	%i2
	fcmpd	%fcc2,	%f6,	%f12
	movneg	%icc,	%o0,	%o7
	movge	%icc,	%o5,	%g1
	fpsub16	%f2,	%f12,	%f12
	fmul8x16au	%f8,	%f3,	%f10
	movrlez	%g5,	%l0,	%l5
	mulscc	%g7,	0x1E9B,	%l6
	mulscc	%g4,	0x0B06,	%i7
	andncc	%i5,	%g3,	%o4
	lduw	[%l7 + 0x3C],	%i1
	fcmple16	%f12,	%f6,	%o3
	andcc	%l1,	%l2,	%l3
	fone	%f14
	umulcc	%i6,	0x1C5D,	%i3
	ldsh	[%l7 + 0x72],	%i0
	fmul8x16au	%f0,	%f11,	%f10
	fzero	%f12
	movg	%xcc,	%o1,	%i4
	udiv	%o6,	0x0297,	%l4
	movge	%xcc,	%g2,	%o2
	movcc	%xcc,	%i2,	%o0
	fand	%f14,	%f14,	%f10
	sethi	0x1B53,	%o7
	udivx	%g6,	0x1656,	%g1
	fnor	%f6,	%f2,	%f4
	alignaddr	%o5,	%g5,	%l0
	edge8	%g7,	%l5,	%l6
	fexpand	%f8,	%f4
	fabss	%f2,	%f9
	udivcc	%i7,	0x1683,	%i5
	stx	%g4,	[%l7 + 0x18]
	ldd	[%l7 + 0x28],	%o4
	movvc	%xcc,	%i1,	%o3
	ldx	[%l7 + 0x10],	%l1
	fmovsleu	%xcc,	%f3,	%f9
	edge8l	%g3,	%l2,	%i6
	edge8l	%i3,	%l3,	%i0
	fpsub16	%f10,	%f12,	%f6
	array32	%o1,	%i4,	%l4
	xnor	%o6,	0x0600,	%g2
	sra	%o2,	%i2,	%o7
	udiv	%o0,	0x1EB2,	%g1
	ldub	[%l7 + 0x6D],	%o5
	array8	%g5,	%g6,	%l0
	fands	%f11,	%f5,	%f11
	xnor	%l5,	%l6,	%i7
	sdiv	%i5,	0x02F6,	%g7
	lduw	[%l7 + 0x0C],	%g4
	edge32ln	%o4,	%i1,	%o3
	andncc	%g3,	%l1,	%i6
	ldsb	[%l7 + 0x2E],	%l2
	fabsd	%f14,	%f12
	fandnot2s	%f11,	%f6,	%f12
	fmovd	%f10,	%f6
	move	%xcc,	%l3,	%i3
	udivcc	%o1,	0x1507,	%i4
	restore %i0, %l4, %g2
	movleu	%icc,	%o6,	%o2
	subccc	%o7,	%i2,	%g1
	addcc	%o5,	%g5,	%o0
	fmovsn	%xcc,	%f10,	%f2
	movcs	%icc,	%l0,	%g6
	srax	%l5,	%i7,	%l6
	popc	%g7,	%g4
	array8	%i5,	%i1,	%o4
	movn	%icc,	%o3,	%l1
	fmovdvs	%icc,	%f11,	%f11
	std	%f2,	[%l7 + 0x60]
	alignaddrl	%i6,	%l2,	%l3
	fors	%f9,	%f15,	%f5
	movl	%xcc,	%i3,	%g3
	addc	%o1,	%i4,	%i0
	edge16	%g2,	%l4,	%o6
	xorcc	%o7,	%i2,	%o2
	movvc	%icc,	%g1,	%o5
	popc	0x0721,	%o0
	movcs	%xcc,	%g5,	%l0
	orcc	%l5,	0x076D,	%g6
	umul	%i7,	0x12F8,	%l6
	movrgez	%g7,	0x0B9,	%i5
	subccc	%i1,	0x04CE,	%o4
	fandnot1s	%f0,	%f1,	%f9
	movle	%xcc,	%o3,	%l1
	edge32l	%g4,	%i6,	%l3
	movneg	%xcc,	%l2,	%g3
	movneg	%icc,	%i3,	%i4
	array32	%i0,	%o1,	%g2
	xorcc	%o6,	0x12D0,	%l4
	fmovdle	%icc,	%f12,	%f6
	orn	%o7,	0x10E7,	%o2
	fmovsa	%xcc,	%f15,	%f10
	movne	%xcc,	%g1,	%i2
	st	%f4,	[%l7 + 0x40]
	sethi	0x00E0,	%o5
	xnor	%o0,	0x034F,	%g5
	xorcc	%l5,	0x0FD0,	%l0
	orcc	%g6,	%l6,	%i7
	subc	%i5,	%g7,	%i1
	add	%o4,	0x03E5,	%l1
	move	%xcc,	%g4,	%o3
	edge32l	%i6,	%l2,	%g3
	add	%l3,	%i3,	%i0
	fmovsl	%xcc,	%f5,	%f8
	fmul8ulx16	%f0,	%f2,	%f4
	fmovdg	%xcc,	%f10,	%f15
	movre	%i4,	%o1,	%o6
	movge	%xcc,	%g2,	%l4
	movn	%icc,	%o7,	%o2
	movcs	%icc,	%g1,	%i2
	array16	%o5,	%g5,	%o0
	ldub	[%l7 + 0x6A],	%l0
	movrgz	%l5,	%l6,	%i7
	ld	[%l7 + 0x34],	%f0
	movrgz	%g6,	0x09B,	%g7
	movne	%icc,	%i1,	%o4
	srlx	%l1,	%g4,	%i5
	stb	%i6,	[%l7 + 0x69]
	move	%xcc,	%o3,	%l2
	move	%xcc,	%g3,	%i3
	edge16	%i0,	%l3,	%o1
	fnor	%f14,	%f4,	%f8
	srax	%i4,	0x00,	%g2
	movpos	%icc,	%o6,	%l4
	movleu	%xcc,	%o7,	%o2
	fmovdg	%xcc,	%f3,	%f6
	fmovrde	%g1,	%f8,	%f8
	stb	%i2,	[%l7 + 0x53]
	fmovrdlez	%o5,	%f0,	%f12
	fmul8sux16	%f8,	%f4,	%f12
	srlx	%g5,	%l0,	%l5
	addccc	%l6,	0x1974,	%i7
	edge32l	%o0,	%g7,	%i1
	movcc	%icc,	%g6,	%o4
	array8	%l1,	%i5,	%g4
	fmovsvs	%icc,	%f1,	%f13
	addc	%o3,	0x0883,	%i6
	movpos	%icc,	%l2,	%i3
	stx	%g3,	[%l7 + 0x68]
	addcc	%l3,	%i0,	%i4
	edge8l	%o1,	%g2,	%o6
	movre	%l4,	0x1FE,	%o2
	stw	%o7,	[%l7 + 0x38]
	std	%f4,	[%l7 + 0x30]
	andn	%g1,	%o5,	%g5
	edge16	%l0,	%i2,	%l6
	fpack16	%f12,	%f8
	ldd	[%l7 + 0x68],	%f12
	fmovdneg	%icc,	%f15,	%f15
	sra	%l5,	%i7,	%g7
	movvc	%icc,	%o0,	%i1
	andcc	%o4,	0x0680,	%g6
	subccc	%i5,	0x014D,	%l1
	array32	%g4,	%i6,	%l2
	restore %o3, 0x09A9, %g3
	movn	%icc,	%i3,	%i0
	edge32n	%l3,	%i4,	%o1
	movg	%icc,	%g2,	%o6
	udivcc	%l4,	0x1C04,	%o2
	fmul8x16al	%f6,	%f1,	%f10
	srl	%o7,	0x15,	%g1
	udivx	%g5,	0x085F,	%o5
	andncc	%l0,	%i2,	%l5
	sdivx	%l6,	0x056A,	%i7
	sethi	0x0094,	%g7
	fones	%f3
	ldsw	[%l7 + 0x78],	%o0
	or	%i1,	%o4,	%i5
	orn	%l1,	%g6,	%i6
	movl	%xcc,	%l2,	%o3
	ld	[%l7 + 0x18],	%f3
	fmovsneg	%xcc,	%f12,	%f14
	movrne	%g3,	%g4,	%i0
	stb	%l3,	[%l7 + 0x45]
	umul	%i3,	0x172E,	%o1
	fmovsl	%icc,	%f12,	%f13
	save %i4, 0x09B3, %o6
	movrgz	%l4,	0x034,	%o2
	fmovsneg	%xcc,	%f15,	%f6
	movcc	%icc,	%g2,	%g1
	ldsw	[%l7 + 0x4C],	%o7
	movrlz	%g5,	0x223,	%l0
	xorcc	%i2,	%o5,	%l5
	movneg	%icc,	%l6,	%g7
	edge16ln	%i7,	%i1,	%o0
	sth	%o4,	[%l7 + 0x1C]
	movcs	%icc,	%l1,	%g6
	movrlez	%i5,	%l2,	%o3
	fnegs	%f0,	%f0
	srl	%i6,	%g3,	%g4
	movne	%icc,	%i0,	%l3
	fcmpne16	%f14,	%f10,	%i3
	movrlz	%o1,	0x0AA,	%o6
	subccc	%l4,	%o2,	%g2
	movg	%icc,	%i4,	%o7
	orncc	%g5,	0x03E7,	%g1
	orn	%i2,	0x0477,	%l0
	andcc	%l5,	0x032F,	%o5
	fnor	%f4,	%f0,	%f14
	add	%l6,	%i7,	%g7
	array32	%i1,	%o4,	%l1
	srlx	%g6,	0x06,	%o0
	movl	%xcc,	%i5,	%o3
	fmovsle	%icc,	%f3,	%f3
	st	%f8,	[%l7 + 0x18]
	subccc	%i6,	0x032C,	%l2
	movneg	%icc,	%g3,	%i0
	sdivx	%l3,	0x1A60,	%g4
	movleu	%xcc,	%i3,	%o6
	sth	%l4,	[%l7 + 0x36]
	alignaddrl	%o1,	%g2,	%o2
	umul	%i4,	0x183F,	%g5
	edge16ln	%o7,	%g1,	%l0
	xor	%l5,	0x14F3,	%i2
	movgu	%xcc,	%l6,	%o5
	fpadd16s	%f7,	%f11,	%f10
	sub	%g7,	0x05C9,	%i1
	or	%i7,	%o4,	%g6
	fxor	%f2,	%f6,	%f4
	sdiv	%o0,	0x0D9D,	%l1
	fornot2	%f12,	%f8,	%f8
	edge8l	%i5,	%o3,	%l2
	movl	%xcc,	%i6,	%g3
	sdiv	%l3,	0x1D84,	%i0
	addc	%i3,	%g4,	%l4
	orn	%o1,	%g2,	%o2
	move	%icc,	%i4,	%g5
	edge16	%o7,	%g1,	%o6
	sth	%l5,	[%l7 + 0x0E]
	fnot2	%f4,	%f8
	edge8	%l0,	%l6,	%i2
	fmovdneg	%xcc,	%f14,	%f2
	smulcc	%o5,	0x02DB,	%i1
	subcc	%i7,	%g7,	%g6
	ldx	[%l7 + 0x78],	%o4
	movg	%xcc,	%l1,	%i5
	movneg	%xcc,	%o0,	%l2
	addccc	%i6,	%g3,	%l3
	pdist	%f2,	%f14,	%f12
	movneg	%xcc,	%i0,	%o3
	andcc	%i3,	%g4,	%l4
	alignaddrl	%o1,	%o2,	%i4
	popc	0x0926,	%g2
	subc	%g5,	0x17FC,	%o7
	ld	[%l7 + 0x3C],	%f7
	movgu	%icc,	%g1,	%o6
	sethi	0x0DAA,	%l5
	fmovsl	%icc,	%f12,	%f3
	array16	%l0,	%l6,	%o5
	edge16n	%i2,	%i7,	%i1
	edge8	%g7,	%o4,	%l1
	edge16ln	%i5,	%o0,	%g6
	sethi	0x0B8E,	%i6
	sll	%g3,	0x10,	%l3
	edge32n	%l2,	%i0,	%o3
	fmovse	%xcc,	%f4,	%f2
	orncc	%i3,	%l4,	%o1
	sth	%o2,	[%l7 + 0x74]
	ldub	[%l7 + 0x1C],	%i4
	fornot2s	%f0,	%f9,	%f4
	edge8ln	%g2,	%g5,	%o7
	fpack32	%f2,	%f14,	%f12
	andcc	%g1,	%g4,	%l5
	lduw	[%l7 + 0x30],	%l0
	mulscc	%l6,	0x16CF,	%o5
	orn	%i2,	%o6,	%i1
	edge16l	%i7,	%g7,	%l1
	fmovs	%f0,	%f1
	movrne	%i5,	%o0,	%g6
	movn	%xcc,	%o4,	%g3
	orncc	%l3,	0x0479,	%l2
	srlx	%i6,	0x08,	%i0
	movvs	%icc,	%o3,	%i3
	movge	%icc,	%o1,	%o2
	edge8	%l4,	%g2,	%i4
	fcmpeq16	%f4,	%f12,	%g5
	fmovdpos	%xcc,	%f10,	%f7
	edge8	%g1,	%g4,	%o7
	movrgz	%l0,	0x368,	%l5
	fcmped	%fcc2,	%f10,	%f10
	movvs	%icc,	%o5,	%i2
	xor	%o6,	0x1617,	%l6
	udiv	%i1,	0x1E4C,	%i7
	for	%f4,	%f0,	%f6
	orn	%g7,	%i5,	%o0
	fmovsle	%xcc,	%f3,	%f15
	fcmple32	%f12,	%f14,	%l1
	sll	%g6,	%o4,	%l3
	stw	%g3,	[%l7 + 0x28]
	subc	%l2,	%i0,	%o3
	fsrc2	%f2,	%f0
	fmovsvc	%icc,	%f10,	%f12
	fmovsleu	%icc,	%f13,	%f6
	sll	%i3,	%o1,	%i6
	lduh	[%l7 + 0x54],	%l4
	andcc	%g2,	0x15EC,	%o2
	and	%i4,	0x04B1,	%g1
	movvs	%xcc,	%g5,	%g4
	sllx	%o7,	0x0F,	%l5
	edge16ln	%l0,	%i2,	%o5
	edge32n	%o6,	%i1,	%l6
	addc	%i7,	%g7,	%i5
	ldsb	[%l7 + 0x16],	%l1
	movrgz	%g6,	0x0AD,	%o4
	edge16	%o0,	%l3,	%g3
	srl	%l2,	0x0D,	%o3
	movl	%icc,	%i0,	%o1
	fone	%f6
	umul	%i3,	%i6,	%g2
	addccc	%l4,	0x1CBC,	%i4
	movne	%icc,	%g1,	%o2
	fors	%f11,	%f7,	%f9
	umulcc	%g5,	%g4,	%o7
	mulscc	%l0,	%i2,	%l5
	mova	%icc,	%o6,	%o5
	edge8l	%i1,	%i7,	%g7
	movpos	%xcc,	%l6,	%i5
	fmovrsne	%l1,	%f13,	%f9
	mulx	%o4,	%g6,	%l3
	orn	%o0,	%g3,	%o3
	movrlz	%l2,	%i0,	%o1
	movg	%icc,	%i6,	%i3
	subc	%l4,	0x1A3C,	%i4
	movle	%xcc,	%g2,	%g1
	fmovscs	%icc,	%f10,	%f6
	ldd	[%l7 + 0x70],	%g4
	movleu	%xcc,	%g4,	%o2
	fmovsne	%xcc,	%f0,	%f14
	mulscc	%o7,	0x01A2,	%i2
	ldsw	[%l7 + 0x7C],	%l0
	movrlz	%o6,	%l5,	%o5
	sdiv	%i1,	0x0946,	%g7
	udivcc	%l6,	0x1349,	%i5
	fmovdge	%xcc,	%f11,	%f1
	addccc	%i7,	%l1,	%g6
	movvs	%icc,	%l3,	%o4
	orncc	%g3,	0x1B7A,	%o0
	sra	%o3,	0x1B,	%i0
	mulx	%o1,	0x0BF2,	%l2
	stx	%i3,	[%l7 + 0x10]
	sub	%i6,	%l4,	%g2
	fornot1s	%f1,	%f2,	%f12
	edge16ln	%i4,	%g5,	%g4
	sdivx	%g1,	0x0ACB,	%o7
	fmovsa	%icc,	%f9,	%f1
	fcmpgt32	%f14,	%f4,	%o2
	fnors	%f13,	%f3,	%f13
	fmuld8sux16	%f3,	%f8,	%f2
	udivx	%i2,	0x0656,	%o6
	udivx	%l5,	0x1B6F,	%l0
	andcc	%i1,	%o5,	%l6
	xnorcc	%g7,	%i5,	%l1
	sra	%g6,	%l3,	%i7
	udivcc	%g3,	0x17F7,	%o0
	fmovsn	%icc,	%f15,	%f15
	and	%o4,	%o3,	%i0
	sra	%o1,	0x09,	%i3
	fcmple32	%f0,	%f12,	%l2
	fmovdl	%xcc,	%f5,	%f5
	movgu	%xcc,	%i6,	%l4
	xor	%i4,	0x0B10,	%g5
	save %g2, %g1, %g4
	stw	%o2,	[%l7 + 0x40]
	and	%o7,	%i2,	%o6
	edge32n	%l5,	%l0,	%o5
	ldx	[%l7 + 0x18],	%i1
	stw	%g7,	[%l7 + 0x68]
	ldd	[%l7 + 0x60],	%i4
	movrne	%l1,	0x182,	%g6
	fabsd	%f6,	%f10
	movge	%xcc,	%l3,	%l6
	edge16	%g3,	%i7,	%o4
	addccc	%o3,	0x093C,	%i0
	movrgez	%o1,	0x23D,	%i3
	srl	%o0,	%l2,	%i6
	fmovrse	%l4,	%f4,	%f5
	fmovdcs	%xcc,	%f13,	%f3
	popc	%g5,	%i4
	restore %g2, %g1, %g4
	fmuld8sux16	%f1,	%f14,	%f14
	move	%icc,	%o7,	%o2
	addc	%i2,	%l5,	%l0
	movvc	%xcc,	%o5,	%o6
	edge32	%i1,	%i5,	%l1
	xnor	%g7,	0x1577,	%g6
	or	%l3,	%g3,	%i7
	array16	%l6,	%o4,	%i0
	movneg	%icc,	%o1,	%i3
	alignaddrl	%o3,	%l2,	%o0
	ldd	[%l7 + 0x78],	%f4
	movpos	%icc,	%i6,	%l4
	addccc	%g5,	0x1012,	%i4
	restore %g1, 0x1430, %g4
	popc	%g2,	%o2
	umulcc	%i2,	0x015E,	%o7
	movcc	%icc,	%l0,	%o5
	save %o6, %l5, %i5
	movneg	%icc,	%i1,	%g7
	and	%g6,	0x02B3,	%l1
	fxor	%f4,	%f10,	%f8
	movvc	%xcc,	%g3,	%l3
	sdivcc	%l6,	0x1C80,	%i7
	umul	%i0,	0x1FF4,	%o1
	restore %o4, %o3, %l2
	andcc	%o0,	0x17CD,	%i6
	movge	%icc,	%i3,	%g5
	edge16ln	%i4,	%l4,	%g1
	fandnot2	%f14,	%f6,	%f4
	fmovsleu	%xcc,	%f9,	%f0
	fnors	%f9,	%f11,	%f4
	fornot2	%f10,	%f2,	%f6
	movg	%xcc,	%g2,	%g4
	alignaddrl	%i2,	%o7,	%l0
	fmul8x16au	%f12,	%f13,	%f12
	edge32l	%o5,	%o2,	%l5
	or	%i5,	%i1,	%g7
	fsrc2s	%f9,	%f2
	orncc	%o6,	%g6,	%g3
	subccc	%l3,	0x102A,	%l6
	st	%f11,	[%l7 + 0x68]
	ldub	[%l7 + 0x0B],	%i7
	movrgz	%l1,	%o1,	%i0
	movrgz	%o4,	%l2,	%o0
	movn	%icc,	%i6,	%i3
	fmul8x16au	%f8,	%f14,	%f14
	edge16	%o3,	%i4,	%l4
	edge32l	%g5,	%g2,	%g4
	edge32n	%g1,	%i2,	%o7
	edge8l	%l0,	%o2,	%o5
	fnors	%f15,	%f9,	%f0
	edge16n	%l5,	%i5,	%g7
	fones	%f11
	lduw	[%l7 + 0x48],	%i1
	save %o6, %g3, %l3
	udivcc	%g6,	0x1A1C,	%l6
	edge8l	%l1,	%i7,	%o1
	addccc	%o4,	0x0B0E,	%i0
	movg	%icc,	%o0,	%l2
	edge32	%i6,	%o3,	%i3
	ldsb	[%l7 + 0x7C],	%l4
	edge32	%i4,	%g2,	%g5
	sra	%g4,	0x17,	%i2
	fpadd16	%f10,	%f0,	%f12
	xnor	%o7,	0x060E,	%l0
	or	%o2,	0x10B5,	%o5
	sth	%l5,	[%l7 + 0x66]
	ldsh	[%l7 + 0x54],	%g1
	fmovdneg	%icc,	%f12,	%f10
	fpack16	%f10,	%f3
	fnands	%f11,	%f14,	%f14
	srax	%i5,	%g7,	%o6
	srlx	%i1,	%g3,	%l3
	sdivx	%l6,	0x0443,	%g6
	ldub	[%l7 + 0x43],	%i7
	fandnot1s	%f13,	%f5,	%f4
	edge32	%l1,	%o1,	%i0
	lduw	[%l7 + 0x28],	%o4
	xnor	%l2,	0x1B95,	%o0
	edge8ln	%o3,	%i6,	%l4
	movge	%icc,	%i4,	%i3
	or	%g2,	%g4,	%i2
	st	%f1,	[%l7 + 0x4C]
	smulcc	%g5,	%o7,	%o2
	umul	%o5,	0x14C6,	%l5
	mulscc	%g1,	0x1D4A,	%l0
	array32	%i5,	%g7,	%o6
	ldsb	[%l7 + 0x45],	%g3
	movcc	%xcc,	%i1,	%l6
	andcc	%l3,	0x0373,	%g6
	stb	%i7,	[%l7 + 0x30]
	array8	%l1,	%i0,	%o1
	array16	%o4,	%l2,	%o3
	edge8n	%o0,	%l4,	%i6
	srlx	%i3,	%g2,	%i4
	andcc	%g4,	%i2,	%g5
	ldub	[%l7 + 0x5E],	%o7
	edge32l	%o2,	%l5,	%o5
	fmovrsgz	%l0,	%f3,	%f7
	movre	%i5,	%g1,	%g7
	udiv	%g3,	0x0935,	%o6
	ldd	[%l7 + 0x38],	%i0
	srl	%l6,	%l3,	%g6
	movle	%icc,	%i7,	%l1
	subccc	%o1,	%i0,	%l2
	fmovrse	%o3,	%f15,	%f1
	lduh	[%l7 + 0x66],	%o0
	movrgz	%l4,	%i6,	%o4
	fpmerge	%f4,	%f5,	%f4
	fsrc1	%f14,	%f4
	edge8ln	%g2,	%i4,	%i3
	sllx	%i2,	%g5,	%o7
	edge8ln	%o2,	%l5,	%o5
	fnot1	%f4,	%f12
	fcmpeq16	%f8,	%f8,	%g4
	std	%f12,	[%l7 + 0x78]
	ldsh	[%l7 + 0x2A],	%i5
	andcc	%g1,	0x0057,	%g7
	srl	%g3,	%o6,	%l0
	std	%f0,	[%l7 + 0x40]
	umulcc	%l6,	0x134B,	%i1
	movneg	%xcc,	%g6,	%i7
	movn	%xcc,	%l3,	%o1
	fmovse	%icc,	%f0,	%f13
	stx	%i0,	[%l7 + 0x78]
	smul	%l1,	0x065D,	%o3
	lduw	[%l7 + 0x0C],	%l2
	ldd	[%l7 + 0x58],	%f6
	movrgez	%o0,	%l4,	%o4
	ldd	[%l7 + 0x60],	%f4
	movrlz	%i6,	0x308,	%i4
	fmovdleu	%xcc,	%f4,	%f5
	stx	%g2,	[%l7 + 0x08]
	edge16n	%i3,	%g5,	%i2
	fxors	%f2,	%f12,	%f6
	lduh	[%l7 + 0x7C],	%o7
	movn	%xcc,	%o2,	%l5
	fornot2s	%f12,	%f12,	%f11
	udivx	%o5,	0x1CC9,	%g4
	fmovdvc	%icc,	%f4,	%f15
	edge8l	%i5,	%g1,	%g7
	udivx	%g3,	0x1965,	%l0
	restore %o6, 0x1ABE, %l6
	edge16	%i1,	%i7,	%g6
	fones	%f0
	movcc	%xcc,	%o1,	%i0
	sdiv	%l1,	0x09DD,	%o3
	edge16	%l3,	%o0,	%l2
	addcc	%l4,	%i6,	%o4
	andcc	%i4,	0x1EE9,	%g2
	xorcc	%i3,	%g5,	%o7
	save %i2, %o2, %l5
	orn	%o5,	0x153E,	%g4
	fpackfix	%f8,	%f12
	movrgez	%g1,	0x154,	%g7
	sub	%g3,	%i5,	%l0
	fmul8x16	%f7,	%f14,	%f12
	fmuld8ulx16	%f14,	%f5,	%f10
	addc	%o6,	%i1,	%l6
	fpackfix	%f12,	%f4
	fnand	%f6,	%f14,	%f12
	sllx	%i7,	0x1E,	%o1
	addc	%g6,	%l1,	%i0
	fmovdg	%xcc,	%f2,	%f7
	std	%f4,	[%l7 + 0x28]
	fcmpeq16	%f0,	%f4,	%o3
	andn	%o0,	0x10A7,	%l3
	edge16ln	%l2,	%l4,	%o4
	movpos	%icc,	%i4,	%g2
	edge8	%i3,	%i6,	%g5
	xorcc	%i2,	0x0922,	%o7
	lduh	[%l7 + 0x4E],	%l5
	edge8	%o2,	%o5,	%g4
	mulx	%g1,	0x15CA,	%g7
	sll	%i5,	%l0,	%o6
	sethi	0x1A1A,	%i1
	movl	%icc,	%l6,	%g3
	fsrc2	%f14,	%f0
	ldsb	[%l7 + 0x65],	%o1
	edge32	%i7,	%l1,	%g6
	stb	%i0,	[%l7 + 0x34]
	fmovsge	%xcc,	%f2,	%f14
	umulcc	%o3,	%l3,	%l2
	fmuld8ulx16	%f1,	%f2,	%f4
	movrlz	%o0,	0x01A,	%l4
	fpsub32	%f8,	%f0,	%f4
	fnand	%f0,	%f8,	%f4
	st	%f8,	[%l7 + 0x74]
	movpos	%icc,	%o4,	%i4
	movpos	%icc,	%g2,	%i6
	edge8l	%i3,	%i2,	%o7
	fmovda	%xcc,	%f10,	%f3
	ldsw	[%l7 + 0x20],	%l5
	st	%f3,	[%l7 + 0x34]
	movre	%o2,	0x0B5,	%o5
	smulcc	%g4,	0x1A3D,	%g1
	fnor	%f4,	%f8,	%f8
	mulscc	%g5,	0x18DC,	%g7
	fors	%f10,	%f7,	%f8
	fornot2	%f4,	%f4,	%f14
	andn	%l0,	%o6,	%i1
	addcc	%l6,	%g3,	%o1
	fpadd32s	%f11,	%f15,	%f10
	alignaddrl	%i5,	%i7,	%l1
	fcmpeq32	%f6,	%f2,	%g6
	smulcc	%o3,	0x1A70,	%l3
	fmovdvc	%xcc,	%f1,	%f5
	udivx	%l2,	0x07AF,	%o0
	movrne	%i0,	0x18D,	%o4
	edge16l	%l4,	%g2,	%i6
	fandnot1s	%f1,	%f4,	%f10
	fmovse	%xcc,	%f10,	%f6
	array8	%i4,	%i2,	%i3
	movg	%icc,	%o7,	%l5
	sdivx	%o2,	0x16F6,	%o5
	fmovsvc	%xcc,	%f1,	%f2
	save %g4, 0x0880, %g5
	fpsub16s	%f7,	%f9,	%f7
	array32	%g1,	%l0,	%g7
	fornot2	%f8,	%f6,	%f14
	srlx	%i1,	0x08,	%l6
	fnot2	%f4,	%f10
	sll	%g3,	0x05,	%o6
	edge16l	%o1,	%i7,	%l1
	movl	%icc,	%i5,	%g6
	edge32l	%l3,	%l2,	%o3
	movn	%icc,	%o0,	%o4
	lduh	[%l7 + 0x44],	%l4
	movcc	%xcc,	%i0,	%i6
	sllx	%g2,	0x1C,	%i4
	fnot2	%f2,	%f2
	movcs	%icc,	%i3,	%i2
	edge32ln	%l5,	%o7,	%o2
	movl	%xcc,	%g4,	%g5
	st	%f6,	[%l7 + 0x1C]
	movvs	%xcc,	%g1,	%o5
	lduh	[%l7 + 0x24],	%g7
	orcc	%l0,	0x072E,	%l6
	sdivcc	%i1,	0x1027,	%g3
	fpadd32	%f4,	%f6,	%f14
	fmovrdlez	%o6,	%f12,	%f4
	move	%icc,	%i7,	%o1
	xnorcc	%l1,	%i5,	%l3
	sllx	%l2,	0x1E,	%g6
	movg	%xcc,	%o3,	%o0
	movcs	%icc,	%l4,	%i0
	and	%o4,	%i6,	%g2
	umul	%i4,	%i3,	%i2
	array8	%o7,	%l5,	%g4
	ldd	[%l7 + 0x08],	%f10
	bshuffle	%f0,	%f8,	%f10
	addccc	%o2,	%g5,	%g1
	fmovdcs	%xcc,	%f10,	%f9
	fpsub16s	%f1,	%f1,	%f4
	add	%g7,	0x1DD7,	%l0
	fsrc2	%f0,	%f14
	sll	%l6,	%o5,	%i1
	fmovrslez	%g3,	%f14,	%f10
	and	%i7,	%o6,	%o1
	stb	%i5,	[%l7 + 0x70]
	sethi	0x0E02,	%l1
	fxor	%f8,	%f10,	%f2
	sra	%l2,	0x19,	%g6
	srax	%o3,	0x06,	%l3
	sth	%l4,	[%l7 + 0x1E]
	udivcc	%o0,	0x1032,	%o4
	orn	%i0,	0x0333,	%i6
	fsrc2	%f10,	%f2
	fmovsleu	%xcc,	%f11,	%f7
	edge16l	%g2,	%i4,	%i3
	edge8l	%i2,	%l5,	%o7
	ldsh	[%l7 + 0x5E],	%o2
	popc	0x0C87,	%g4
	movne	%icc,	%g5,	%g7
	andncc	%l0,	%g1,	%o5
	xnor	%l6,	0x072D,	%i1
	movrlez	%g3,	%o6,	%o1
	popc	%i5,	%i7
	movgu	%icc,	%l1,	%l2
	edge8l	%g6,	%l3,	%o3
	addccc	%l4,	0x05BA,	%o0
	array32	%i0,	%i6,	%o4
	movvs	%icc,	%i4,	%g2
	ldx	[%l7 + 0x70],	%i2
	fcmpes	%fcc1,	%f0,	%f8
	ldub	[%l7 + 0x12],	%i3
	save %o7, %o2, %l5
	udivcc	%g4,	0x1B46,	%g5
	smulcc	%g7,	0x16F8,	%l0
	andn	%g1,	%l6,	%i1
	edge16ln	%o5,	%g3,	%o6
	ldsb	[%l7 + 0x36],	%i5
	lduh	[%l7 + 0x6E],	%o1
	std	%f2,	[%l7 + 0x18]
	movrlz	%l1,	%i7,	%g6
	fmovsneg	%icc,	%f7,	%f11
	fmuld8ulx16	%f5,	%f8,	%f4
	save %l3, %l2, %o3
	sdiv	%o0,	0x0C51,	%i0
	xnorcc	%i6,	%l4,	%i4
	fmovdneg	%xcc,	%f5,	%f2
	fsrc1	%f12,	%f10
	movl	%icc,	%g2,	%i2
	mulx	%i3,	0x1D1E,	%o7
	fcmpne16	%f0,	%f2,	%o4
	smul	%o2,	%g4,	%g5
	popc	0x042B,	%g7
	mulx	%l0,	%g1,	%l5
	move	%xcc,	%i1,	%o5
	sdiv	%l6,	0x1F62,	%o6
	array8	%g3,	%o1,	%i5
	stx	%i7,	[%l7 + 0x38]
	movrne	%g6,	%l1,	%l2
	orn	%l3,	0x0FAB,	%o3
	restore %o0, %i6, %i0
	array16	%l4,	%g2,	%i2
	umul	%i3,	0x1E10,	%o7
	ldub	[%l7 + 0x4D],	%i4
	fmovda	%icc,	%f5,	%f14
	udiv	%o4,	0x0C9A,	%g4
	sra	%o2,	%g5,	%g7
	sdiv	%l0,	0x14E6,	%l5
	edge32l	%g1,	%o5,	%i1
	movcs	%xcc,	%l6,	%o6
	edge8	%o1,	%g3,	%i7
	movl	%xcc,	%g6,	%l1
	andncc	%i5,	%l3,	%l2
	xnorcc	%o3,	0x06FA,	%i6
	movvs	%icc,	%i0,	%o0
	popc	%l4,	%i2
	movne	%icc,	%i3,	%g2
	movcc	%icc,	%o7,	%i4
	alignaddr	%g4,	%o4,	%o2
	edge8	%g7,	%g5,	%l0
	fcmpgt16	%f6,	%f12,	%g1
	sub	%o5,	0x04F1,	%i1
	movne	%icc,	%l6,	%l5
	fmovrdgez	%o6,	%f14,	%f6
	stx	%g3,	[%l7 + 0x58]
	fmovdleu	%icc,	%f7,	%f0
	fsrc1	%f2,	%f8
	smulcc	%i7,	0x166C,	%o1
	edge8n	%g6,	%i5,	%l1
	andcc	%l2,	%l3,	%i6
	stb	%i0,	[%l7 + 0x15]
	udivcc	%o0,	0x0C02,	%o3
	orn	%i2,	0x1E3B,	%i3
	edge8ln	%l4,	%o7,	%g2
	stx	%i4,	[%l7 + 0x60]
	fmovd	%f4,	%f12
	srax	%o4,	0x04,	%o2
	movge	%icc,	%g7,	%g4
	sra	%l0,	%g1,	%g5
	edge32n	%o5,	%i1,	%l5
	lduw	[%l7 + 0x7C],	%l6
	edge32n	%g3,	%o6,	%i7
	fabsd	%f8,	%f8
	edge8l	%o1,	%i5,	%g6
	fmovse	%xcc,	%f6,	%f3
	addc	%l1,	%l3,	%l2
	addcc	%i0,	%i6,	%o3
	ldsw	[%l7 + 0x6C],	%o0
	std	%f12,	[%l7 + 0x18]
	fnot1	%f2,	%f0
	fmovsvc	%icc,	%f1,	%f11
	restore %i2, 0x1441, %i3
	lduw	[%l7 + 0x30],	%o7
	array8	%l4,	%i4,	%g2
	stx	%o2,	[%l7 + 0x50]
	fmovrdgz	%g7,	%f8,	%f6
	andn	%g4,	%l0,	%o4
	fcmpgt32	%f14,	%f8,	%g5
	edge16	%o5,	%g1,	%l5
	array32	%l6,	%g3,	%o6
	mova	%xcc,	%i7,	%o1
	fmovrslez	%i1,	%f12,	%f11
	fmovdvs	%icc,	%f13,	%f11
	sth	%i5,	[%l7 + 0x64]
	fandnot1	%f14,	%f14,	%f0
	movvs	%xcc,	%l1,	%l3
	andn	%g6,	%l2,	%i0
	orncc	%o3,	0x10B9,	%i6
	fmovdleu	%icc,	%f2,	%f5
	sethi	0x02A6,	%i2
	movn	%icc,	%o0,	%i3
	orncc	%l4,	0x08F4,	%o7
	udivx	%g2,	0x0D48,	%i4
	movrne	%o2,	0x1D1,	%g4
	fandnot1s	%f8,	%f10,	%f12
	edge16l	%g7,	%l0,	%o4
	fmovsneg	%icc,	%f0,	%f0
	addccc	%o5,	0x0B09,	%g1
	ldd	[%l7 + 0x50],	%g4
	ldsw	[%l7 + 0x54],	%l5
	mova	%icc,	%l6,	%o6
	movle	%icc,	%i7,	%g3
	edge32	%o1,	%i5,	%l1
	xnor	%l3,	%i1,	%g6
	sdivx	%i0,	0x050D,	%l2
	sth	%o3,	[%l7 + 0x64]
	movre	%i6,	0x21F,	%o0
	ld	[%l7 + 0x78],	%f6
	alignaddr	%i2,	%i3,	%o7
	for	%f14,	%f6,	%f14
	mulx	%g2,	0x1A3E,	%i4
	edge32l	%l4,	%o2,	%g7
	edge32l	%l0,	%o4,	%o5
	edge32	%g1,	%g4,	%g5
	fpsub32	%f8,	%f2,	%f0
	edge16l	%l6,	%o6,	%l5
	sth	%g3,	[%l7 + 0x2A]
	lduh	[%l7 + 0x10],	%o1
	mova	%icc,	%i7,	%l1
	sub	%i5,	%l3,	%g6
	sll	%i0,	%l2,	%i1
	stw	%o3,	[%l7 + 0x78]
	move	%icc,	%i6,	%i2
	alignaddr	%i3,	%o0,	%g2
	ld	[%l7 + 0x5C],	%f12
	mova	%icc,	%i4,	%o7
	fxnors	%f1,	%f1,	%f3
	alignaddr	%l4,	%g7,	%o2
	fcmps	%fcc2,	%f14,	%f9
	ld	[%l7 + 0x18],	%f13
	ld	[%l7 + 0x18],	%f12
	fmovsa	%xcc,	%f3,	%f3
	fmovrslz	%l0,	%f13,	%f7
	sllx	%o4,	0x0C,	%g1
	xorcc	%g4,	%g5,	%l6
	movcs	%xcc,	%o6,	%l5
	lduh	[%l7 + 0x6C],	%o5
	fornot1	%f6,	%f2,	%f10
	mulx	%g3,	0x0558,	%i7
	edge16n	%l1,	%i5,	%o1
	movge	%icc,	%l3,	%g6
	movrgz	%l2,	%i1,	%i0
	fsrc2	%f2,	%f8
	sdiv	%o3,	0x02FE,	%i2
	fsrc1	%f12,	%f4
	umul	%i6,	%o0,	%g2
	fpsub16s	%f10,	%f2,	%f6
	movge	%xcc,	%i4,	%i3
	fmovda	%icc,	%f9,	%f4
	st	%f5,	[%l7 + 0x78]
	edge16ln	%l4,	%o7,	%o2
	fmovsvs	%icc,	%f6,	%f0
	or	%g7,	0x0BDC,	%o4
	andcc	%l0,	%g1,	%g5
	fmovrdgez	%l6,	%f2,	%f6
	fnegs	%f4,	%f9
	sll	%g4,	0x05,	%o6
	array16	%o5,	%l5,	%i7
	srl	%l1,	%i5,	%g3
	sth	%l3,	[%l7 + 0x52]
	fmovsg	%icc,	%f9,	%f8
	andn	%o1,	%g6,	%l2
	move	%xcc,	%i0,	%o3
	sllx	%i1,	0x0E,	%i6
	edge16l	%o0,	%i2,	%i4
	umulcc	%i3,	%l4,	%o7
	movle	%icc,	%g2,	%o2
	fmul8x16al	%f15,	%f6,	%f14
	lduh	[%l7 + 0x4E],	%g7
	ldd	[%l7 + 0x60],	%l0
	array16	%o4,	%g5,	%l6
	array8	%g4,	%g1,	%o6
	stx	%o5,	[%l7 + 0x58]
	fmovrslez	%l5,	%f5,	%f13
	subc	%i7,	0x0AF7,	%i5
	smul	%l1,	%g3,	%o1
	smul	%g6,	%l2,	%i0
	fcmpgt16	%f14,	%f14,	%o3
	fand	%f6,	%f6,	%f6
	sth	%i1,	[%l7 + 0x5E]
	edge16n	%l3,	%i6,	%i2
	sdivx	%i4,	0x1621,	%i3
	movn	%icc,	%l4,	%o7
	xnor	%o0,	0x06BC,	%o2
	mova	%xcc,	%g7,	%l0
	movrlz	%g2,	0x3C1,	%o4
	ld	[%l7 + 0x64],	%f15
	addc	%g5,	0x0674,	%g4
	edge16l	%g1,	%o6,	%l6
	ld	[%l7 + 0x70],	%f11
	std	%f8,	[%l7 + 0x58]
	srlx	%o5,	0x06,	%i7
	sth	%l5,	[%l7 + 0x30]
	fcmpeq32	%f14,	%f12,	%i5
	faligndata	%f2,	%f6,	%f6
	fcmpes	%fcc1,	%f12,	%f8
	ldd	[%l7 + 0x18],	%l0
	fmovdvc	%icc,	%f11,	%f14
	edge8	%o1,	%g6,	%l2
	sll	%i0,	%o3,	%i1
	fandnot1s	%f2,	%f0,	%f9
	fmovsa	%icc,	%f1,	%f15
	subccc	%g3,	0x088D,	%i6
	alignaddr	%i2,	%i4,	%l3
	ldd	[%l7 + 0x78],	%i2
	fones	%f8
	mova	%icc,	%l4,	%o0
	lduh	[%l7 + 0x6E],	%o7
	movcc	%xcc,	%g7,	%l0
	fpsub16	%f14,	%f12,	%f2
	fcmpeq16	%f0,	%f14,	%o2
	movg	%xcc,	%o4,	%g5
	fmovrsgez	%g4,	%f3,	%f13
	movrgez	%g2,	%g1,	%l6
	array16	%o6,	%o5,	%i7
	mulscc	%i5,	%l5,	%l1
	move	%xcc,	%g6,	%o1
	move	%icc,	%l2,	%i0
	andn	%o3,	0x1B7F,	%i1
	mova	%icc,	%i6,	%i2
	xorcc	%i4,	0x1558,	%g3
	srl	%i3,	%l4,	%l3
	movg	%xcc,	%o7,	%g7
	sdivcc	%l0,	0x12E5,	%o2
	udivcc	%o0,	0x0D36,	%o4
	mulscc	%g4,	%g2,	%g5
	smulcc	%l6,	0x062D,	%g1
	ldd	[%l7 + 0x68],	%f2
	add	%o6,	%o5,	%i5
	movle	%xcc,	%l5,	%l1
	sdiv	%i7,	0x0755,	%g6
	stx	%o1,	[%l7 + 0x28]
	edge16ln	%l2,	%o3,	%i1
	std	%f8,	[%l7 + 0x58]
	andn	%i6,	0x0400,	%i2
	udivcc	%i4,	0x1EC6,	%g3
	addc	%i3,	0x1080,	%i0
	fcmpne32	%f8,	%f14,	%l3
	sll	%l4,	%g7,	%o7
	fmovrse	%o2,	%f7,	%f2
	fmovrdne	%l0,	%f0,	%f4
	movgu	%xcc,	%o0,	%g4
	add	%o4,	%g5,	%g2
	sdivcc	%l6,	0x1D9A,	%o6
	movl	%icc,	%o5,	%g1
	fmovsne	%xcc,	%f3,	%f3
	orn	%i5,	0x13DD,	%l1
	edge8l	%l5,	%g6,	%o1
	std	%f10,	[%l7 + 0x38]
	fnor	%f12,	%f8,	%f0
	edge32n	%l2,	%i7,	%o3
	save %i1, 0x0EC8, %i6
	edge16	%i2,	%g3,	%i3
	movgu	%xcc,	%i4,	%l3
	sethi	0x1A51,	%l4
	edge8	%i0,	%g7,	%o2
	ldd	[%l7 + 0x40],	%f10
	move	%icc,	%l0,	%o7
	array16	%g4,	%o0,	%g5
	lduh	[%l7 + 0x14],	%g2
	mulscc	%l6,	0x1EC1,	%o4
	subc	%o5,	0x0057,	%g1
	fmovsgu	%xcc,	%f7,	%f11
	xorcc	%i5,	0x16EE,	%l1
	sdivcc	%l5,	0x0F33,	%o6
	movcc	%xcc,	%o1,	%l2
	sdivx	%i7,	0x09EF,	%g6
	fmul8x16	%f4,	%f12,	%f14
	fpmerge	%f1,	%f7,	%f12
	edge32	%o3,	%i6,	%i1
	movne	%xcc,	%g3,	%i2
	move	%xcc,	%i3,	%i4
	fmovrslz	%l4,	%f10,	%f15
	fpack16	%f6,	%f2
	movrlz	%i0,	%g7,	%o2
	movcc	%icc,	%l3,	%o7
	andn	%l0,	0x16CC,	%g4
	movre	%g5,	0x044,	%g2
	fand	%f12,	%f10,	%f8
	st	%f5,	[%l7 + 0x10]
	fornot2s	%f7,	%f7,	%f5
	movcs	%xcc,	%o0,	%o4
	movneg	%icc,	%o5,	%l6
	move	%icc,	%g1,	%i5
	sra	%l5,	%l1,	%o6
	fmovsl	%xcc,	%f1,	%f13
	movleu	%icc,	%l2,	%o1
	orncc	%i7,	%g6,	%i6
	fmovsa	%icc,	%f3,	%f2
	for	%f4,	%f8,	%f10
	edge16n	%o3,	%i1,	%i2
	sth	%g3,	[%l7 + 0x10]
	save %i4, 0x0DDA, %i3
	fandnot1s	%f4,	%f6,	%f1
	sth	%i0,	[%l7 + 0x1A]
	umul	%g7,	0x0C1D,	%o2
	movrgz	%l3,	%l4,	%l0
	ldsb	[%l7 + 0x74],	%o7
	add	%g5,	0x10D2,	%g4
	subc	%g2,	%o4,	%o0
	ld	[%l7 + 0x4C],	%f3
	edge16n	%l6,	%g1,	%i5
	movle	%icc,	%l5,	%o5
	andncc	%o6,	%l2,	%o1
	stx	%i7,	[%l7 + 0x78]
	edge8	%l1,	%g6,	%o3
	movrgez	%i6,	%i1,	%g3
	st	%f1,	[%l7 + 0x5C]
	mova	%icc,	%i2,	%i3
	edge32ln	%i4,	%g7,	%o2
	sdivx	%i0,	0x0C8A,	%l4
	sdivx	%l3,	0x1EE9,	%l0
	movpos	%xcc,	%g5,	%o7
	fmovdgu	%xcc,	%f1,	%f12
	sub	%g2,	%o4,	%g4
	movgu	%icc,	%o0,	%l6
	srlx	%g1,	%i5,	%l5
	move	%icc,	%o6,	%o5
	movgu	%xcc,	%o1,	%l2
	movge	%xcc,	%l1,	%g6
	sdivx	%o3,	0x07B1,	%i7
	edge16ln	%i6,	%g3,	%i1
	srlx	%i2,	%i4,	%g7
	movleu	%icc,	%o2,	%i3
	fandnot1	%f6,	%f2,	%f2
	xorcc	%i0,	%l4,	%l0
	edge16ln	%g5,	%o7,	%g2
	edge8n	%o4,	%g4,	%o0
	alignaddr	%l6,	%l3,	%g1
	ldd	[%l7 + 0x48],	%f6
	fnand	%f6,	%f8,	%f6
	movn	%xcc,	%l5,	%i5
	sllx	%o6,	%o5,	%l2
	fmul8sux16	%f6,	%f0,	%f12
	fpack16	%f8,	%f15
	edge16l	%l1,	%o1,	%o3
	umulcc	%i7,	0x02FC,	%i6
	ldd	[%l7 + 0x28],	%g2
	ldub	[%l7 + 0x49],	%g6
	fmovdl	%xcc,	%f7,	%f3
	fmovsne	%xcc,	%f5,	%f4
	edge8l	%i2,	%i1,	%g7
	array32	%i4,	%i3,	%o2
	movre	%i0,	0x3AD,	%l0
	movvc	%xcc,	%g5,	%o7
	movvc	%xcc,	%g2,	%l4
	mulx	%g4,	0x0AEA,	%o0
	array16	%l6,	%o4,	%g1
	fexpand	%f15,	%f10
	movl	%icc,	%l3,	%l5
	restore %o6, 0x0891, %i5
	edge32	%o5,	%l1,	%o1
	subcc	%l2,	%o3,	%i7
	mulscc	%i6,	%g3,	%g6
	xnor	%i1,	0x0049,	%g7
	fmovdleu	%icc,	%f14,	%f5
	andncc	%i4,	%i2,	%i3
	fmovdle	%icc,	%f0,	%f9
	edge32n	%i0,	%o2,	%g5
	ld	[%l7 + 0x18],	%f1
	movn	%xcc,	%l0,	%o7
	movpos	%icc,	%g2,	%l4
	or	%g4,	0x1766,	%l6
	lduw	[%l7 + 0x10],	%o4
	move	%xcc,	%g1,	%o0
	stx	%l5,	[%l7 + 0x48]
	movrgez	%l3,	%o6,	%i5
	alignaddr	%o5,	%l1,	%o1
	fxor	%f4,	%f2,	%f6
	or	%o3,	0x0072,	%i7
	movn	%icc,	%l2,	%g3
	array32	%i6,	%i1,	%g6
	fmovdleu	%xcc,	%f5,	%f8
	fmovrsgz	%i4,	%f6,	%f2
	fmovdg	%icc,	%f12,	%f5
	ldx	[%l7 + 0x70],	%g7
	movrgez	%i2,	%i0,	%i3
	movrne	%g5,	%l0,	%o2
	lduh	[%l7 + 0x34],	%g2
	and	%o7,	0x1FAC,	%l4
	fpadd16	%f12,	%f10,	%f14
	sdiv	%g4,	0x0006,	%l6
	movleu	%xcc,	%g1,	%o4
	std	%f14,	[%l7 + 0x20]
	edge16	%l5,	%o0,	%o6
	save %l3, %o5, %l1
	movn	%icc,	%i5,	%o1
	stw	%i7,	[%l7 + 0x5C]
	movneg	%xcc,	%o3,	%g3
	udivcc	%l2,	0x0FCA,	%i1
	fpackfix	%f6,	%f6
	fmovsn	%icc,	%f15,	%f12
	add	%i6,	0x1F79,	%g6
	sll	%g7,	%i2,	%i4
	movgu	%xcc,	%i3,	%g5
	mulx	%i0,	%o2,	%g2
	array32	%l0,	%l4,	%o7
	fmovsn	%xcc,	%f10,	%f9
	smulcc	%g4,	%l6,	%g1
	movge	%icc,	%l5,	%o0
	fxors	%f3,	%f9,	%f7
	movn	%icc,	%o4,	%l3
	srax	%o5,	%l1,	%o6
	fsrc2s	%f7,	%f12
	lduw	[%l7 + 0x14],	%o1
	fones	%f1
	array32	%i5,	%o3,	%i7
	fmul8ulx16	%f12,	%f6,	%f4
	stb	%l2,	[%l7 + 0x2B]
	edge8	%g3,	%i6,	%i1
	edge8	%g6,	%i2,	%g7
	fabsd	%f2,	%f8
	fmuld8ulx16	%f13,	%f10,	%f14
	move	%icc,	%i3,	%i4
	srlx	%g5,	0x08,	%o2
	add	%i0,	0x0BE0,	%g2
	st	%f11,	[%l7 + 0x50]
	edge16ln	%l4,	%l0,	%o7
	orncc	%l6,	0x00C6,	%g4
	fmovrdlez	%l5,	%f14,	%f0
	fnor	%f14,	%f14,	%f10
	movcc	%icc,	%o0,	%o4
	sra	%l3,	%o5,	%g1
	ldsw	[%l7 + 0x0C],	%o6
	andncc	%o1,	%l1,	%i5
	mova	%icc,	%o3,	%i7
	edge8	%g3,	%i6,	%l2
	stb	%g6,	[%l7 + 0x35]
	lduh	[%l7 + 0x42],	%i2
	subc	%g7,	%i1,	%i4
	xnorcc	%g5,	%o2,	%i0
	mulscc	%g2,	0x0159,	%l4
	movne	%icc,	%i3,	%l0
	sll	%l6,	%o7,	%l5
	edge8ln	%o0,	%o4,	%l3
	ldsb	[%l7 + 0x61],	%o5
	fnor	%f2,	%f6,	%f14
	movleu	%xcc,	%g4,	%o6
	alignaddrl	%o1,	%g1,	%l1
	xorcc	%o3,	0x09FA,	%i5
	ldub	[%l7 + 0x74],	%i7
	edge32l	%g3,	%l2,	%g6
	movrlez	%i6,	0x3D6,	%i2
	xorcc	%i1,	%i4,	%g5
	fmul8x16al	%f2,	%f14,	%f6
	fcmpgt16	%f4,	%f6,	%g7
	edge8ln	%i0,	%g2,	%l4
	or	%i3,	0x0B4D,	%l0
	edge16n	%l6,	%o2,	%l5
	edge16l	%o0,	%o7,	%o4
	addcc	%l3,	0x0CB4,	%o5
	edge16n	%o6,	%o1,	%g4
	fmovrsne	%g1,	%f2,	%f0
	srlx	%o3,	%l1,	%i5
	edge8ln	%g3,	%l2,	%g6
	or	%i7,	%i6,	%i2
	udivcc	%i4,	0x1CA6,	%g5
	orcc	%i1,	%g7,	%i0
	edge16n	%l4,	%i3,	%g2
	movpos	%icc,	%l0,	%l6
	orn	%l5,	0x1AD4,	%o2
	fmovscs	%icc,	%f14,	%f15
	movg	%icc,	%o7,	%o4
	restore %o0, %o5, %l3
	fmovsg	%icc,	%f11,	%f10
	fmovdcc	%icc,	%f1,	%f11
	sdiv	%o6,	0x002C,	%o1
	edge32ln	%g1,	%g4,	%o3
	edge32	%i5,	%l1,	%g3
	fmovdl	%icc,	%f0,	%f15
	ldd	[%l7 + 0x28],	%l2
	edge16ln	%g6,	%i6,	%i7
	xor	%i2,	%i4,	%i1
	subc	%g7,	0x1BE1,	%i0
	lduh	[%l7 + 0x10],	%l4
	udivcc	%g5,	0x1AA6,	%i3
	sth	%g2,	[%l7 + 0x24]
	orn	%l0,	0x032B,	%l6
	edge16l	%o2,	%o7,	%o4
	stb	%l5,	[%l7 + 0x3C]
	udiv	%o0,	0x164E,	%l3
	ldub	[%l7 + 0x13],	%o5
	addc	%o1,	%g1,	%o6
	ldsb	[%l7 + 0x0D],	%g4
	fmovdvs	%icc,	%f13,	%f11
	sethi	0x1825,	%i5
	xorcc	%l1,	0x1507,	%o3
	movle	%xcc,	%g3,	%l2
	alignaddrl	%i6,	%i7,	%g6
	movvs	%icc,	%i4,	%i2
	fmul8sux16	%f8,	%f6,	%f14
	edge8l	%i1,	%i0,	%g7
	edge32n	%l4,	%i3,	%g5
	fnegs	%f3,	%f4
	alignaddr	%l0,	%g2,	%l6
	movrlez	%o7,	0x256,	%o2
	xnorcc	%l5,	%o4,	%o0
	xor	%l3,	%o5,	%o1
	addcc	%o6,	%g4,	%g1
	ldsb	[%l7 + 0x69],	%l1
	smulcc	%o3,	0x0813,	%g3
	fpsub16	%f10,	%f10,	%f4
	ldd	[%l7 + 0x28],	%f12
	udivcc	%i5,	0x029B,	%l2
	movvc	%icc,	%i6,	%i7
	fmovda	%icc,	%f0,	%f6
	edge8n	%i4,	%i2,	%i1
	orncc	%i0,	0x1EC6,	%g6
	orncc	%g7,	%l4,	%i3
	popc	0x01F2,	%l0
	sdivcc	%g2,	0x0792,	%l6
	sdiv	%g5,	0x1113,	%o2
	save %o7, 0x0969, %l5
	fmovsl	%icc,	%f15,	%f7
	fmovdle	%xcc,	%f13,	%f6
	or	%o0,	0x1E49,	%o4
	sll	%l3,	%o5,	%o1
	movre	%o6,	%g1,	%g4
	movge	%xcc,	%o3,	%l1
	movcs	%icc,	%g3,	%l2
	fnot1	%f2,	%f4
	subc	%i5,	%i6,	%i7
	array32	%i4,	%i2,	%i1
	ldub	[%l7 + 0x54],	%g6
	fxnors	%f1,	%f3,	%f8
	edge8	%i0,	%g7,	%i3
	srlx	%l0,	%g2,	%l4
	array8	%g5,	%o2,	%o7
	edge8ln	%l6,	%l5,	%o0
	movpos	%xcc,	%o4,	%o5
	fsrc1s	%f0,	%f8
	edge8ln	%o1,	%l3,	%g1
	movvc	%xcc,	%g4,	%o3
	fnot2	%f12,	%f12
	edge16n	%l1,	%g3,	%l2
	fmovrdne	%i5,	%f14,	%f10
	srax	%i6,	%o6,	%i7
	for	%f0,	%f14,	%f0
	movrne	%i2,	%i4,	%g6
	std	%f10,	[%l7 + 0x68]
	edge32ln	%i1,	%i0,	%i3
	fnot1s	%f8,	%f9
	ldsb	[%l7 + 0x7C],	%l0
	ldub	[%l7 + 0x3D],	%g7
	edge16	%l4,	%g2,	%o2
	lduw	[%l7 + 0x38],	%g5
	stb	%o7,	[%l7 + 0x5A]
	ldx	[%l7 + 0x58],	%l6
	fornot1	%f12,	%f0,	%f14
	fmovdle	%icc,	%f5,	%f10
	ldd	[%l7 + 0x70],	%f8
	fmuld8sux16	%f8,	%f8,	%f8
	move	%xcc,	%l5,	%o0
	fmovda	%xcc,	%f15,	%f15
	smulcc	%o5,	0x0242,	%o4
	std	%f6,	[%l7 + 0x28]
	addc	%o1,	%l3,	%g1
	edge8n	%o3,	%l1,	%g3
	ldd	[%l7 + 0x60],	%g4
	andncc	%i5,	%i6,	%l2
	sub	%i7,	%i2,	%o6
	edge8	%g6,	%i1,	%i4
	fpack32	%f14,	%f2,	%f10
	fmovdvs	%icc,	%f8,	%f14
	fcmple16	%f8,	%f2,	%i3
	popc	0x07EE,	%l0
	addc	%g7,	%l4,	%g2
	ldsh	[%l7 + 0x1E],	%i0
	xor	%g5,	%o2,	%o7
	andn	%l5,	0x10ED,	%l6
	fcmple32	%f10,	%f12,	%o0
	movg	%xcc,	%o5,	%o4
	fmul8x16	%f15,	%f12,	%f14
	udiv	%o1,	0x0A6D,	%g1
	subcc	%o3,	0x18C4,	%l1
	or	%g3,	%g4,	%i5
	mulscc	%i6,	0x0FA9,	%l3
	movcc	%icc,	%l2,	%i7
	fpmerge	%f9,	%f7,	%f6
	movneg	%icc,	%o6,	%g6
	edge16ln	%i1,	%i4,	%i3
	movl	%xcc,	%l0,	%i2
	xnor	%l4,	%g7,	%g2
	fmovsneg	%icc,	%f4,	%f8
	fmul8x16au	%f5,	%f2,	%f0
	movcc	%icc,	%g5,	%o2
	movpos	%xcc,	%o7,	%i0
	fabss	%f6,	%f8
	fxnor	%f6,	%f12,	%f8
	ldx	[%l7 + 0x28],	%l5
	addccc	%l6,	0x1F67,	%o0
	fones	%f12
	umulcc	%o5,	%o4,	%o1
	mova	%icc,	%g1,	%o3
	array16	%l1,	%g3,	%i5
	ldsh	[%l7 + 0x16],	%i6
	edge8l	%g4,	%l2,	%l3
	ld	[%l7 + 0x1C],	%f9
	stb	%o6,	[%l7 + 0x56]
	fmul8x16	%f14,	%f10,	%f10
	orn	%g6,	0x1718,	%i7
	popc	%i4,	%i3
	edge16n	%l0,	%i2,	%i1
	ldd	[%l7 + 0x60],	%f2
	fmovdvc	%icc,	%f5,	%f13
	edge32ln	%g7,	%l4,	%g2
	and	%o2,	%g5,	%o7
	udivx	%i0,	0x10B2,	%l5
	andncc	%o0,	%l6,	%o5
	fmovrsgez	%o1,	%f15,	%f7
	movgu	%icc,	%o4,	%g1
	st	%f15,	[%l7 + 0x50]
	andcc	%o3,	%g3,	%l1
	orn	%i5,	%g4,	%i6
	edge8l	%l2,	%l3,	%g6
	xor	%i7,	0x0F72,	%i4
	movne	%xcc,	%i3,	%l0
	fmovse	%xcc,	%f8,	%f15
	xor	%o6,	0x076E,	%i1
	orncc	%g7,	%l4,	%g2
	fcmpne32	%f12,	%f14,	%o2
	fmovdcc	%icc,	%f7,	%f1
	ldsb	[%l7 + 0x18],	%i2
	fcmpeq32	%f8,	%f2,	%g5
	ldd	[%l7 + 0x78],	%f2
	orncc	%o7,	%l5,	%i0
	movn	%icc,	%o0,	%o5
	fnot1s	%f12,	%f4
	andn	%o1,	%l6,	%o4
	addc	%o3,	%g1,	%l1
	st	%f15,	[%l7 + 0x3C]
	stx	%i5,	[%l7 + 0x18]
	edge16ln	%g3,	%i6,	%l2
	addcc	%g4,	0x0FDD,	%g6
	fmovrsgz	%l3,	%f4,	%f7
	movgu	%icc,	%i4,	%i3
	std	%f4,	[%l7 + 0x70]
	ld	[%l7 + 0x4C],	%f6
	edge8	%l0,	%o6,	%i7
	movgu	%icc,	%g7,	%i1
	movrlz	%l4,	%g2,	%o2
	fcmpgt16	%f8,	%f12,	%i2
	mulscc	%g5,	%o7,	%l5
	fmovdleu	%xcc,	%f12,	%f9
	edge16	%i0,	%o5,	%o1
	andcc	%o0,	%o4,	%o3
	stx	%l6,	[%l7 + 0x58]
	srax	%l1,	%g1,	%i5
	xor	%g3,	%i6,	%l2
	fcmpd	%fcc1,	%f14,	%f4
	subc	%g6,	0x05B9,	%g4
	srax	%i4,	%i3,	%l0
	st	%f13,	[%l7 + 0x58]
	movvs	%xcc,	%l3,	%o6
	alignaddrl	%i7,	%i1,	%g7
	fabsd	%f4,	%f14
	stb	%l4,	[%l7 + 0x34]
	edge8n	%o2,	%g2,	%i2
	srlx	%o7,	%g5,	%l5
	edge16	%o5,	%i0,	%o0
	addccc	%o4,	0x06B5,	%o1
	stw	%o3,	[%l7 + 0x58]
	edge16n	%l6,	%l1,	%i5
	subc	%g3,	%g1,	%l2
	sub	%g6,	0x1E30,	%g4
	ldd	[%l7 + 0x68],	%f12
	edge16	%i4,	%i6,	%l0
	edge16l	%l3,	%i3,	%i7
	stb	%i1,	[%l7 + 0x3B]
	smulcc	%o6,	0x129C,	%l4
	movl	%xcc,	%g7,	%o2
	srax	%i2,	%g2,	%o7
	ldx	[%l7 + 0x18],	%l5
	alignaddrl	%g5,	%o5,	%o0
	fmovsleu	%icc,	%f0,	%f14
	movleu	%icc,	%o4,	%i0
	sdivx	%o3,	0x0DBD,	%o1
	sth	%l6,	[%l7 + 0x4E]
	movrne	%i5,	%l1,	%g1
	subc	%g3,	%g6,	%g4
	srax	%l2,	%i4,	%i6
	fmovscc	%icc,	%f4,	%f5
	ldd	[%l7 + 0x78],	%l2
	smul	%l0,	0x0CC4,	%i7
	ld	[%l7 + 0x74],	%f0
	fmovsvs	%icc,	%f14,	%f4
	alignaddr	%i1,	%o6,	%i3
	sdivx	%l4,	0x0F49,	%g7
	ldx	[%l7 + 0x30],	%i2
	subcc	%o2,	0x040F,	%o7
	subc	%l5,	%g5,	%g2
	sub	%o0,	%o5,	%o4
	orn	%i0,	%o3,	%l6
	stx	%o1,	[%l7 + 0x08]
	smul	%l1,	0x0C36,	%g1
	ldx	[%l7 + 0x30],	%i5
	ldub	[%l7 + 0x3F],	%g3
	movcc	%icc,	%g4,	%g6
	array16	%l2,	%i4,	%i6
	fmovsgu	%xcc,	%f7,	%f9
	ld	[%l7 + 0x28],	%f5
	alignaddr	%l3,	%l0,	%i1
	xnor	%o6,	%i3,	%l4
	edge8l	%g7,	%i7,	%i2
	for	%f14,	%f6,	%f2
	edge32ln	%o7,	%l5,	%g5
	xor	%o2,	%g2,	%o5
	addcc	%o0,	%o4,	%o3
	fabsd	%f0,	%f10
	add	%l6,	%i0,	%l1
	alignaddrl	%g1,	%o1,	%i5
	ldd	[%l7 + 0x10],	%g4
	movne	%icc,	%g6,	%l2
	edge32n	%g3,	%i4,	%l3
	fmovsle	%icc,	%f3,	%f1
	movg	%xcc,	%i6,	%i1
	movcs	%xcc,	%o6,	%i3
	ldx	[%l7 + 0x50],	%l0
	ldd	[%l7 + 0x38],	%f12
	edge32l	%g7,	%i7,	%i2
	smulcc	%o7,	%l5,	%g5
	sdivx	%l4,	0x1F4D,	%o2
	andcc	%g2,	%o5,	%o4
	edge8	%o3,	%o0,	%i0
	movpos	%icc,	%l1,	%l6
	fmovse	%xcc,	%f6,	%f15
	fmovsge	%xcc,	%f6,	%f5
	or	%o1,	0x103B,	%g1
	ldx	[%l7 + 0x08],	%g4
	st	%f1,	[%l7 + 0x48]
	fmul8x16	%f12,	%f6,	%f4
	movrlez	%g6,	0x09D,	%i5
	and	%g3,	0x070F,	%i4
	fmovsgu	%icc,	%f9,	%f3
	fmovdg	%icc,	%f7,	%f14
	movle	%xcc,	%l3,	%l2
	fmovdvs	%xcc,	%f2,	%f10
	xnor	%i1,	0x1459,	%o6
	mulscc	%i3,	0x1342,	%l0
	fmul8x16au	%f9,	%f6,	%f14
	fcmpgt16	%f10,	%f2,	%i6
	umulcc	%i7,	%i2,	%g7
	subcc	%o7,	0x1DD4,	%g5
	ldsw	[%l7 + 0x70],	%l4
	sethi	0x1BA0,	%o2
	orncc	%l5,	0x081D,	%g2
	fmul8x16	%f4,	%f12,	%f14
	udivx	%o4,	0x1BA8,	%o5
	mulscc	%o0,	%o3,	%l1
	sub	%l6,	0x173B,	%i0
	sub	%g1,	%g4,	%o1
	alignaddrl	%i5,	%g3,	%i4
	movne	%icc,	%l3,	%l2
	fmovrslz	%g6,	%f10,	%f7
	fnot1s	%f12,	%f5
	xor	%o6,	0x1C63,	%i1
	fmovdle	%xcc,	%f6,	%f13
	smulcc	%i3,	%i6,	%l0
	edge16n	%i2,	%i7,	%o7
	movneg	%xcc,	%g7,	%l4
	fnands	%f3,	%f7,	%f2
	lduh	[%l7 + 0x5A],	%g5
	fsrc1s	%f14,	%f4
	or	%o2,	%l5,	%o4
	subcc	%o5,	0x1F87,	%g2
	srlx	%o3,	0x0E,	%l1
	andcc	%l6,	%o0,	%g1
	alignaddr	%g4,	%i0,	%o1
	mulscc	%g3,	%i4,	%l3
	movge	%xcc,	%l2,	%g6
	mulscc	%i5,	%i1,	%i3
	array16	%o6,	%i6,	%i2
	movneg	%xcc,	%i7,	%o7
	st	%f8,	[%l7 + 0x7C]
	fmovsa	%icc,	%f12,	%f11
	fmovdge	%icc,	%f8,	%f10
	movne	%xcc,	%g7,	%l4
	fcmpgt16	%f2,	%f14,	%l0
	fmul8ulx16	%f2,	%f6,	%f10
	umulcc	%o2,	0x1387,	%g5
	edge16n	%o4,	%o5,	%l5
	fnands	%f9,	%f7,	%f8
	udivcc	%o3,	0x0C06,	%l1
	movne	%icc,	%g2,	%l6
	subccc	%o0,	%g1,	%i0
	fsrc2s	%f8,	%f10
	mulx	%o1,	0x1573,	%g4
	fone	%f12
	xor	%g3,	0x1519,	%l3
	movrne	%l2,	0x0E3,	%g6
	fmovdgu	%icc,	%f11,	%f3
	sdivcc	%i4,	0x1F95,	%i5
	orncc	%i3,	0x08A4,	%o6
	orncc	%i6,	%i2,	%i1
	array16	%i7,	%o7,	%l4
	fzero	%f4
	umulcc	%g7,	%o2,	%l0
	edge32	%g5,	%o4,	%l5
	fmovde	%xcc,	%f15,	%f14
	fmovrdlz	%o3,	%f14,	%f4
	lduh	[%l7 + 0x4C],	%l1
	srl	%o5,	0x1E,	%l6
	fnands	%f11,	%f1,	%f10
	edge32ln	%g2,	%o0,	%i0
	fmovdleu	%xcc,	%f9,	%f5
	edge32l	%g1,	%o1,	%g4
	movrgez	%l3,	0x15F,	%l2
	orn	%g3,	0x1B88,	%i4
	fornot2s	%f10,	%f13,	%f12
	movrlez	%g6,	%i5,	%o6
	movrgz	%i6,	%i2,	%i1
	movrlez	%i7,	%i3,	%l4
	movge	%icc,	%g7,	%o2
	movge	%xcc,	%l0,	%g5
	sdivcc	%o4,	0x1528,	%l5
	sll	%o7,	0x03,	%o3
	orcc	%o5,	0x0588,	%l1
	movle	%xcc,	%g2,	%o0
	sethi	0x0CDA,	%l6
	edge16l	%g1,	%o1,	%i0
	fmul8ulx16	%f2,	%f4,	%f4
	fmovspos	%xcc,	%f7,	%f6
	movrgez	%l3,	%g4,	%g3
	fornot2	%f14,	%f2,	%f6
	movrlz	%i4,	0x3FF,	%l2
	umul	%g6,	%i5,	%i6
	fexpand	%f4,	%f8
	ld	[%l7 + 0x2C],	%f1
	stw	%i2,	[%l7 + 0x18]
	fmovsvs	%icc,	%f5,	%f8
	save %i1, 0x17BC, %o6
	udivcc	%i3,	0x1A44,	%l4
	orn	%i7,	0x0E1E,	%o2
	stb	%l0,	[%l7 + 0x40]
	subcc	%g7,	0x1E76,	%g5
	sra	%o4,	%l5,	%o3
	fmovrsgz	%o5,	%f0,	%f0
	fmovs	%f1,	%f8
	udiv	%l1,	0x0AA6,	%g2
	sra	%o0,	%o7,	%l6
	fnegd	%f14,	%f10
	fandnot1	%f14,	%f2,	%f4
	movvc	%xcc,	%g1,	%o1
	xnorcc	%l3,	%i0,	%g4
	sub	%g3,	%l2,	%g6
	sllx	%i5,	0x00,	%i6
	fmovsleu	%icc,	%f4,	%f9
	sdivcc	%i2,	0x0E7C,	%i1
	edge8n	%o6,	%i4,	%l4
	ldd	[%l7 + 0x10],	%f14
	movrlez	%i3,	%i7,	%l0
	fornot1	%f6,	%f14,	%f12
	movleu	%icc,	%g7,	%g5
	movpos	%xcc,	%o4,	%o2
	std	%f4,	[%l7 + 0x68]
	fmovspos	%xcc,	%f12,	%f9
	fcmpeq16	%f10,	%f4,	%o3
	sub	%o5,	0x04FD,	%l5
	movcs	%xcc,	%l1,	%o0
	movre	%o7,	%l6,	%g1
	addccc	%g2,	0x1A16,	%o1
	lduh	[%l7 + 0x40],	%i0
	smulcc	%g4,	%l3,	%g3
	ldd	[%l7 + 0x10],	%f12
	stx	%g6,	[%l7 + 0x38]
	addc	%i5,	0x0A12,	%l2
	addcc	%i2,	0x1C94,	%i6
	sdiv	%o6,	0x135F,	%i4
	or	%l4,	0x1332,	%i1
	subccc	%i7,	%i3,	%l0
	xnorcc	%g5,	%o4,	%o2
	edge32l	%g7,	%o5,	%o3
	fmuld8sux16	%f13,	%f13,	%f8
	fornot2	%f10,	%f12,	%f2
	ldsh	[%l7 + 0x68],	%l5
	movre	%o0,	%o7,	%l1
	andn	%g1,	%l6,	%o1
	sllx	%i0,	%g2,	%l3
	sub	%g4,	%g3,	%i5
	sdiv	%l2,	0x15BF,	%i2
	fmovse	%icc,	%f2,	%f15
	fcmps	%fcc0,	%f5,	%f12
	fmovsl	%icc,	%f5,	%f4
	mulscc	%i6,	%g6,	%i4
	subccc	%o6,	0x156A,	%i1
	sub	%i7,	0x1BC1,	%l4
	movneg	%icc,	%i3,	%g5
	edge32ln	%o4,	%l0,	%o2
	xor	%g7,	%o5,	%o3
	edge32l	%o0,	%l5,	%l1
	fands	%f8,	%f4,	%f8
	fandnot2s	%f5,	%f5,	%f7
	sethi	0x0128,	%g1
	lduw	[%l7 + 0x58],	%o7
	movpos	%icc,	%o1,	%l6
	movrgez	%i0,	%g2,	%l3
	fmovsne	%xcc,	%f5,	%f1
	fmul8x16	%f0,	%f14,	%f12
	or	%g3,	%g4,	%i5
	fmovrse	%l2,	%f9,	%f5
	add	%i6,	0x0EDE,	%g6
	movpos	%xcc,	%i2,	%o6
	smul	%i4,	%i1,	%l4
	movrgz	%i3,	%i7,	%o4
	mova	%xcc,	%l0,	%o2
	ldd	[%l7 + 0x40],	%f4
	mulx	%g7,	0x08E3,	%o5
	array8	%g5,	%o3,	%o0
	ldub	[%l7 + 0x66],	%l1
	movcc	%xcc,	%l5,	%o7
	edge8	%g1,	%l6,	%i0
	stx	%o1,	[%l7 + 0x18]
	subcc	%l3,	0x0C1F,	%g2
	restore %g4, %i5, %l2
	edge8	%g3,	%g6,	%i6
	movvs	%icc,	%o6,	%i2
	movcs	%icc,	%i1,	%i4
	orn	%l4,	%i7,	%o4
	ldx	[%l7 + 0x58],	%i3
	subcc	%l0,	%o2,	%g7
	std	%f6,	[%l7 + 0x08]
	subc	%o5,	%o3,	%g5
	add	%o0,	0x058B,	%l1
	movrne	%l5,	%g1,	%l6
	xorcc	%i0,	0x0593,	%o7
	movrlz	%o1,	0x22E,	%g2
	ldsw	[%l7 + 0x18],	%l3
	smulcc	%i5,	%g4,	%g3
	and	%g6,	%i6,	%o6
	addccc	%l2,	0x0931,	%i2
	edge8n	%i4,	%i1,	%i7
	orncc	%o4,	0x1BF6,	%l4
	mulx	%l0,	%i3,	%o2
	st	%f10,	[%l7 + 0x68]
	fmovsne	%xcc,	%f15,	%f1
	movgu	%icc,	%g7,	%o3
	sdivcc	%g5,	0x1F4B,	%o0
	lduh	[%l7 + 0x12],	%o5
	ldd	[%l7 + 0x60],	%l4
	stb	%g1,	[%l7 + 0x3F]
	fpsub32	%f4,	%f8,	%f8
	fnot2	%f4,	%f8
	alignaddr	%l1,	%i0,	%l6
	fmovse	%icc,	%f14,	%f11
	edge16	%o1,	%g2,	%l3
	fpadd32	%f6,	%f12,	%f10
	subc	%i5,	%g4,	%o7
	movcc	%xcc,	%g6,	%g3
	ld	[%l7 + 0x30],	%f15
	sll	%i6,	%o6,	%i2
	popc	0x08A2,	%l2
	addc	%i1,	0x16C6,	%i7
	array8	%o4,	%l4,	%l0
	std	%f8,	[%l7 + 0x78]
	and	%i3,	%o2,	%i4
	sll	%g7,	%o3,	%g5
	sub	%o0,	0x1DD3,	%o5
	edge32n	%l5,	%l1,	%i0
	edge16	%l6,	%g1,	%g2
	andn	%l3,	0x1B57,	%i5
	movl	%icc,	%g4,	%o1
	sll	%o7,	0x1D,	%g6
	movl	%icc,	%i6,	%g3
	fmul8x16	%f13,	%f0,	%f2
	addccc	%o6,	0x1B6C,	%i2
	movcc	%xcc,	%i1,	%i7
	andn	%o4,	%l2,	%l4
	popc	%l0,	%i3
	movpos	%xcc,	%o2,	%i4
	movge	%icc,	%g7,	%o3
	edge32n	%o0,	%o5,	%g5
	movrlez	%l1,	%l5,	%l6
	fmovrsgez	%g1,	%f15,	%f9
	ld	[%l7 + 0x28],	%f3
	st	%f3,	[%l7 + 0x18]
	fnor	%f2,	%f6,	%f14
	edge32ln	%g2,	%l3,	%i5
	stx	%i0,	[%l7 + 0x60]
	umul	%g4,	%o1,	%o7
	movneg	%xcc,	%g6,	%g3
	movgu	%icc,	%i6,	%o6
	edge16n	%i1,	%i7,	%i2
	fmovde	%xcc,	%f10,	%f2
	popc	0x1BFC,	%o4
	fandnot1	%f0,	%f12,	%f12
	movgu	%icc,	%l4,	%l0
	subc	%i3,	%l2,	%o2
	move	%icc,	%g7,	%i4
	xnorcc	%o0,	0x15FF,	%o3
	fabss	%f12,	%f9
	fmovrsne	%o5,	%f12,	%f15
	smul	%l1,	%l5,	%g5
	fcmple32	%f0,	%f8,	%l6
	andncc	%g1,	%g2,	%l3
	edge32l	%i5,	%i0,	%g4
	edge32n	%o1,	%g6,	%o7
	fmovs	%f5,	%f9
	sub	%i6,	0x00D7,	%o6
	fcmple16	%f12,	%f2,	%g3
	std	%f10,	[%l7 + 0x78]
	xor	%i7,	%i1,	%i2
	edge16l	%o4,	%l4,	%i3
	andn	%l0,	%o2,	%g7
	sra	%l2,	%i4,	%o0
	smulcc	%o3,	0x04DC,	%l1
	edge16l	%o5,	%l5,	%l6
	andn	%g1,	0x0203,	%g5
	movvc	%xcc,	%g2,	%l3
	movcs	%icc,	%i5,	%i0
	movleu	%icc,	%g4,	%o1
	stb	%g6,	[%l7 + 0x3C]
	udivcc	%i6,	0x1713,	%o7
	ldsh	[%l7 + 0x54],	%o6
	addcc	%g3,	%i7,	%i1
	sra	%i2,	%o4,	%l4
	fmovrsne	%l0,	%f3,	%f15
	sethi	0x1FB7,	%o2
	addccc	%g7,	%l2,	%i3
	andcc	%i4,	0x14B5,	%o3
	edge16	%l1,	%o0,	%o5
	edge8	%l6,	%g1,	%l5
	orn	%g5,	0x0DF0,	%l3
	edge8ln	%i5,	%i0,	%g2
	addccc	%g4,	0x1239,	%o1
	andn	%g6,	0x1A4E,	%o7
	sdiv	%i6,	0x1A44,	%g3
	xor	%o6,	0x1E84,	%i1
	ldd	[%l7 + 0x10],	%f14
	sra	%i2,	%o4,	%l4
	fmovrdne	%i7,	%f0,	%f14
	smul	%l0,	%o2,	%g7
	movre	%l2,	%i3,	%i4
	save %o3, %o0, %o5
	orn	%l1,	%l6,	%g1
	array32	%l5,	%g5,	%i5
	movl	%icc,	%i0,	%l3
	sdiv	%g4,	0x0C56,	%g2
	xor	%o1,	0x0ADD,	%o7
	addc	%i6,	%g3,	%g6
	movle	%icc,	%o6,	%i1
	alignaddrl	%o4,	%i2,	%l4
	and	%l0,	%i7,	%o2
	fpmerge	%f0,	%f8,	%f0
	ld	[%l7 + 0x0C],	%f8
	fmovsg	%xcc,	%f9,	%f3
	movcs	%xcc,	%g7,	%l2
	sdiv	%i3,	0x13B0,	%i4
	mulx	%o3,	0x1227,	%o0
	movpos	%xcc,	%l1,	%o5
	fmovde	%xcc,	%f4,	%f12
	fmovsg	%xcc,	%f15,	%f1
	smulcc	%g1,	%l5,	%g5
	edge16l	%l6,	%i0,	%i5
	fmovdne	%xcc,	%f3,	%f1
	orn	%l3,	0x1D2A,	%g2
	stx	%g4,	[%l7 + 0x40]
	fcmpne32	%f0,	%f14,	%o7
	fmuld8sux16	%f10,	%f5,	%f14
	addc	%i6,	%o1,	%g3
	fone	%f12
	sdivx	%o6,	0x0B5F,	%i1
	movrgz	%g6,	0x124,	%o4
	srax	%l4,	0x19,	%i2
	movrgez	%l0,	0x3F8,	%o2
	fmovd	%f14,	%f4
	fmovscs	%xcc,	%f3,	%f9
	fxors	%f0,	%f0,	%f7
	move	%icc,	%g7,	%i7
	fmovsneg	%icc,	%f13,	%f9
	sra	%i3,	0x05,	%i4
	edge8l	%o3,	%o0,	%l1
	std	%f6,	[%l7 + 0x18]
	movleu	%icc,	%l2,	%g1
	xor	%o5,	%l5,	%g5
	umul	%i0,	%l6,	%l3
	udiv	%i5,	0x1E56,	%g4
	ldx	[%l7 + 0x60],	%g2
	udiv	%i6,	0x05D0,	%o7
	udivx	%o1,	0x1E30,	%o6
	movne	%xcc,	%i1,	%g3
	ldd	[%l7 + 0x18],	%f6
	xor	%g6,	%l4,	%o4
	addcc	%l0,	0x0150,	%o2
	umulcc	%i2,	0x0C97,	%i7
	sub	%i3,	%g7,	%i4
	movre	%o3,	0x0D3,	%l1
	array32	%o0,	%g1,	%l2
	andn	%o5,	0x0696,	%g5
	movpos	%icc,	%i0,	%l6
	edge16	%l3,	%l5,	%i5
	movrgz	%g2,	%g4,	%o7
	or	%i6,	%o6,	%o1
	movgu	%icc,	%g3,	%g6
	bshuffle	%f12,	%f14,	%f12
	fmovdge	%xcc,	%f0,	%f4
	sth	%l4,	[%l7 + 0x0E]
	edge32n	%i1,	%l0,	%o4
	ldd	[%l7 + 0x28],	%f0
	fcmpeq32	%f4,	%f2,	%o2
	xorcc	%i7,	%i2,	%i3
	xor	%g7,	%i4,	%o3
	edge32n	%l1,	%o0,	%g1
	array16	%o5,	%g5,	%i0
	orn	%l2,	0x0EF7,	%l3
	movleu	%icc,	%l5,	%i5
	fors	%f11,	%f2,	%f8
	subcc	%l6,	0x1898,	%g4
	fmovsle	%xcc,	%f14,	%f12
	mova	%xcc,	%o7,	%i6
	popc	0x1BE2,	%o6
	movge	%icc,	%g2,	%o1
	movvc	%icc,	%g6,	%l4
	movvs	%icc,	%i1,	%l0
	ldd	[%l7 + 0x50],	%g2
	subcc	%o2,	%o4,	%i7
	alignaddr	%i2,	%i3,	%g7
	movle	%icc,	%i4,	%l1
	fmul8x16au	%f9,	%f12,	%f10
	movvc	%xcc,	%o3,	%o0
	umulcc	%g1,	%o5,	%i0
	andcc	%l2,	0x081C,	%g5
	move	%icc,	%l5,	%l3
	alignaddr	%l6,	%g4,	%o7
	fmovscc	%xcc,	%f9,	%f6
	move	%xcc,	%i6,	%o6
	edge8ln	%g2,	%o1,	%i5
	fnors	%f13,	%f14,	%f3
	fpmerge	%f7,	%f10,	%f12
	fmovscc	%xcc,	%f5,	%f1
	movneg	%icc,	%g6,	%l4
	fmovsa	%xcc,	%f5,	%f3
	andcc	%l0,	%i1,	%g3
	sra	%o4,	0x0A,	%o2
	fexpand	%f15,	%f10
	sub	%i7,	%i2,	%g7
	add	%i4,	%l1,	%o3
	ldd	[%l7 + 0x78],	%o0
	fornot1s	%f0,	%f9,	%f14
	mova	%xcc,	%i3,	%g1
	sllx	%i0,	0x07,	%l2
	std	%f0,	[%l7 + 0x10]
	udiv	%g5,	0x1BF8,	%l5
	subccc	%o5,	%l3,	%l6
	movrlz	%o7,	%i6,	%g4
	fmuld8ulx16	%f2,	%f10,	%f6
	fmovsge	%xcc,	%f14,	%f4
	fcmped	%fcc0,	%f0,	%f0
	movg	%xcc,	%o6,	%o1
	std	%f4,	[%l7 + 0x68]
	xnor	%i5,	0x1FDD,	%g2
	st	%f13,	[%l7 + 0x74]
	edge16l	%l4,	%l0,	%i1
	fone	%f2
	st	%f8,	[%l7 + 0x14]
	smul	%g3,	%g6,	%o4
	edge8l	%i7,	%o2,	%i2
	sll	%i4,	0x1F,	%l1
	sllx	%g7,	%o3,	%i3
	sllx	%g1,	%o0,	%i0
	andncc	%g5,	%l5,	%l2
	fsrc2	%f4,	%f6
	movn	%icc,	%l3,	%l6
	movrlez	%o5,	%o7,	%i6
	umul	%o6,	%o1,	%i5
	fcmps	%fcc3,	%f15,	%f3
	pdist	%f6,	%f0,	%f8
	orncc	%g4,	%g2,	%l4
	fmovdn	%xcc,	%f9,	%f0
	addc	%l0,	%g3,	%i1
	alignaddr	%o4,	%i7,	%o2
	orn	%g6,	0x0F44,	%i2
	fsrc1s	%f15,	%f11
	andcc	%l1,	%g7,	%o3
	sdiv	%i4,	0x095B,	%i3
	movne	%icc,	%g1,	%i0
	std	%f12,	[%l7 + 0x78]
	sdivcc	%o0,	0x1D94,	%g5
	umulcc	%l2,	0x1561,	%l5
	fmovdge	%xcc,	%f5,	%f1
	sllx	%l6,	0x1C,	%o5
	fpack32	%f14,	%f4,	%f2
	alignaddr	%l3,	%i6,	%o7
	movg	%icc,	%o6,	%i5
	fxnors	%f1,	%f6,	%f7
	movl	%icc,	%o1,	%g2
	smul	%l4,	0x03FB,	%g4
	movpos	%xcc,	%l0,	%g3
	fmul8sux16	%f6,	%f10,	%f6
	fornot1	%f0,	%f12,	%f4
	movrgez	%i1,	0x30E,	%i7
	addccc	%o2,	0x0011,	%o4
	fmovspos	%xcc,	%f8,	%f9
	movge	%xcc,	%i2,	%l1
	fmovsgu	%icc,	%f5,	%f2
	ldsw	[%l7 + 0x50],	%g6
	orcc	%g7,	0x0D58,	%o3
	xorcc	%i3,	%i4,	%i0
	movl	%icc,	%o0,	%g5
	array8	%g1,	%l2,	%l6
	smul	%l5,	0x1E72,	%l3
	movneg	%xcc,	%o5,	%o7
	fandnot2s	%f9,	%f12,	%f6
	movge	%icc,	%i6,	%o6
	movge	%icc,	%o1,	%g2
	fmovscs	%xcc,	%f2,	%f0
	fpadd16s	%f1,	%f2,	%f10
	fmovdn	%xcc,	%f5,	%f8
	umulcc	%l4,	0x1505,	%g4
	umulcc	%l0,	0x0A4B,	%i5
	subcc	%i1,	0x0AFA,	%g3
	mulx	%i7,	0x0503,	%o4
	edge32	%i2,	%l1,	%o2
	and	%g6,	0x0FC6,	%g7
	mova	%xcc,	%i3,	%i4
	fcmps	%fcc2,	%f4,	%f6
	movrgz	%i0,	%o0,	%o3
	fcmpd	%fcc3,	%f6,	%f0
	std	%f12,	[%l7 + 0x20]
	fmovrdlz	%g5,	%f0,	%f2
	restore %g1, %l6, %l2
	sethi	0x0145,	%l3
	ldx	[%l7 + 0x10],	%l5
	edge8ln	%o5,	%o7,	%o6
	fmuld8ulx16	%f14,	%f6,	%f6
	movrgez	%i6,	%o1,	%l4
	edge8ln	%g4,	%g2,	%l0
	srlx	%i5,	0x03,	%i1
	sub	%i7,	%o4,	%i2
	udivcc	%l1,	0x1C78,	%o2
	std	%f14,	[%l7 + 0x48]
	movre	%g6,	0x297,	%g3
	edge32l	%g7,	%i4,	%i0
	udivcc	%o0,	0x11EC,	%o3
	andcc	%i3,	0x0636,	%g1
	ldsh	[%l7 + 0x58],	%l6
	xor	%g5,	%l2,	%l3
	movle	%xcc,	%o5,	%o7
	or	%o6,	0x0790,	%i6
	edge8l	%l5,	%l4,	%g4
	movl	%xcc,	%g2,	%l0
	movne	%icc,	%i5,	%i1
	sth	%o1,	[%l7 + 0x76]
	udivcc	%i7,	0x17EE,	%o4
	mulscc	%i2,	0x0689,	%l1
	fpadd32	%f10,	%f12,	%f6
	fone	%f4
	fsrc1s	%f1,	%f11
	fmul8x16au	%f14,	%f8,	%f6
	udivcc	%o2,	0x04EF,	%g3
	ldx	[%l7 + 0x18],	%g6
	sra	%i4,	0x0E,	%g7
	sdivx	%i0,	0x1C59,	%o3
	fmovscc	%icc,	%f9,	%f14
	addccc	%i3,	0x0EE9,	%o0
	edge16l	%l6,	%g5,	%g1
	ld	[%l7 + 0x2C],	%f4
	movg	%icc,	%l2,	%l3
	fpsub16	%f10,	%f14,	%f10
	sdivx	%o7,	0x0F38,	%o5
	movrgez	%i6,	%l5,	%o6
	stx	%g4,	[%l7 + 0x68]
	fmovd	%f10,	%f4
	fnot2	%f6,	%f8
	move	%xcc,	%g2,	%l4
	ldsw	[%l7 + 0x20],	%l0
	udivcc	%i1,	0x0A98,	%o1
	edge32l	%i5,	%i7,	%o4
	edge16l	%i2,	%l1,	%g3
	fornot2	%f14,	%f12,	%f0
	fcmple32	%f10,	%f6,	%g6
	mova	%icc,	%i4,	%g7
	fnot1	%f8,	%f2
	fmovdg	%icc,	%f6,	%f6
	fmuld8ulx16	%f13,	%f14,	%f6
	fzeros	%f1
	fmovsgu	%xcc,	%f9,	%f13
	xnorcc	%i0,	%o2,	%o3
	fmovsvs	%icc,	%f3,	%f11
	st	%f6,	[%l7 + 0x38]
	orncc	%i3,	%l6,	%o0
	popc	0x16CF,	%g1
	movrgz	%g5,	%l2,	%l3
	orn	%o5,	0x1CAA,	%i6
	movg	%xcc,	%l5,	%o6
	array32	%o7,	%g4,	%g2
	fandnot2s	%f14,	%f4,	%f9
	subccc	%l4,	%i1,	%l0
	ldsb	[%l7 + 0x47],	%i5
	restore %i7, %o4, %o1
	sethi	0x0BA7,	%i2
	orn	%g3,	%g6,	%l1
	movleu	%icc,	%g7,	%i0
	std	%f4,	[%l7 + 0x30]
	sth	%o2,	[%l7 + 0x4C]
	movn	%icc,	%o3,	%i4
	fmovdne	%xcc,	%f1,	%f0
	movrgz	%l6,	0x3CE,	%i3
	ldub	[%l7 + 0x42],	%g1
	edge16l	%g5,	%l2,	%l3
	add	%o5,	0x0818,	%i6
	popc	%o0,	%o6
	sub	%o7,	0x1B90,	%g4
	fpmerge	%f0,	%f11,	%f10
	edge32	%g2,	%l5,	%i1
	fnor	%f6,	%f8,	%f6
	srlx	%l4,	0x17,	%i5
	fandnot2s	%f13,	%f15,	%f7
	sllx	%i7,	%o4,	%o1
	ldx	[%l7 + 0x20],	%l0
	movle	%xcc,	%i2,	%g3
	sra	%g6,	%l1,	%i0
	movvs	%xcc,	%g7,	%o2
	array16	%o3,	%i4,	%l6
	movne	%xcc,	%g1,	%i3
	fmovrdgez	%l2,	%f4,	%f2
	fcmpes	%fcc0,	%f6,	%f2
	stw	%g5,	[%l7 + 0x34]
	fornot2s	%f0,	%f7,	%f11
	edge32l	%l3,	%i6,	%o5
	ldsw	[%l7 + 0x30],	%o6
	movvc	%xcc,	%o7,	%g4
	fcmpne32	%f4,	%f14,	%o0
	fmovdgu	%xcc,	%f13,	%f6
	smulcc	%g2,	%l5,	%i1
	udivcc	%l4,	0x0B19,	%i5
	fmovsleu	%icc,	%f8,	%f3
	orncc	%i7,	%o1,	%o4
	fxor	%f14,	%f6,	%f8
	edge16	%l0,	%g3,	%i2
	udiv	%g6,	0x1F3F,	%i0
	fzeros	%f15
	edge32l	%g7,	%l1,	%o2
	movrlz	%i4,	%l6,	%o3
	movg	%xcc,	%g1,	%l2
	srl	%i3,	%l3,	%g5
	umulcc	%i6,	%o6,	%o7
	umulcc	%o5,	%g4,	%o0
	edge8l	%l5,	%i1,	%g2
	fexpand	%f14,	%f4
	st	%f2,	[%l7 + 0x20]
	sdiv	%l4,	0x126C,	%i7
	subccc	%o1,	%o4,	%i5
	ldsw	[%l7 + 0x30],	%l0
	stb	%i2,	[%l7 + 0x7D]
	andn	%g3,	0x03D1,	%g6
	fmovsle	%xcc,	%f14,	%f15
	fandnot2s	%f12,	%f0,	%f9
	fmovsne	%xcc,	%f10,	%f6
	addc	%g7,	0x148D,	%i0
	ldx	[%l7 + 0x60],	%o2
	movg	%xcc,	%l1,	%i4
	movleu	%xcc,	%l6,	%g1
	ldsw	[%l7 + 0x64],	%l2
	move	%xcc,	%i3,	%l3
	movvs	%xcc,	%o3,	%i6
	movrgz	%o6,	%o7,	%o5
	stw	%g4,	[%l7 + 0x24]
	andn	%g5,	%o0,	%l5
	array8	%i1,	%g2,	%i7
	srax	%l4,	%o4,	%o1
	ldsh	[%l7 + 0x12],	%i5
	movpos	%icc,	%i2,	%g3
	edge16n	%l0,	%g7,	%g6
	restore %o2, %l1, %i0
	alignaddrl	%i4,	%g1,	%l2
	subc	%i3,	0x1E20,	%l6
	st	%f6,	[%l7 + 0x40]
	subccc	%l3,	%o3,	%i6
	edge16	%o7,	%o6,	%o5
	srlx	%g4,	0x1F,	%g5
	movpos	%icc,	%l5,	%i1
	fnor	%f10,	%f14,	%f10
	sdiv	%o0,	0x1696,	%i7
	edge16n	%g2,	%l4,	%o4
	sdiv	%i5,	0x01E2,	%o1
	array8	%g3,	%i2,	%g7
	ld	[%l7 + 0x54],	%f15
	umul	%l0,	%o2,	%g6
	srl	%i0,	%i4,	%l1
	sll	%l2,	0x1F,	%g1
	umulcc	%l6,	0x1968,	%l3
	andn	%i3,	%o3,	%i6
	movvs	%xcc,	%o7,	%o6
	sdiv	%o5,	0x1A9C,	%g4
	addccc	%g5,	%l5,	%o0
	ldd	[%l7 + 0x20],	%i6
	edge32	%i1,	%g2,	%l4
	lduw	[%l7 + 0x3C],	%o4
	orn	%i5,	%o1,	%i2
	subcc	%g7,	0x0362,	%l0
	edge32l	%g3,	%o2,	%g6
	andcc	%i4,	%i0,	%l1
	fandnot1	%f12,	%f10,	%f6
	stw	%g1,	[%l7 + 0x2C]
	stw	%l6,	[%l7 + 0x68]
	fmovrde	%l3,	%f6,	%f10
	movgu	%icc,	%i3,	%o3
	fzero	%f6
	sdivx	%i6,	0x0EDD,	%o7
	movleu	%xcc,	%o6,	%o5
	ldsb	[%l7 + 0x7F],	%g4
	fornot1	%f6,	%f12,	%f14
	sllx	%l2,	%l5,	%g5
	sllx	%i7,	0x13,	%i1
	array32	%o0,	%g2,	%o4
	movcc	%icc,	%l4,	%i5
	fmovsgu	%xcc,	%f8,	%f2
	fmovse	%icc,	%f12,	%f2
	edge16n	%o1,	%g7,	%i2
	ldx	[%l7 + 0x18],	%l0
	fmovsvc	%icc,	%f1,	%f4
	save %o2, 0x17E9, %g3
	fpadd16s	%f12,	%f11,	%f6
	movpos	%icc,	%g6,	%i0
	fmovscc	%xcc,	%f9,	%f14
	ldsh	[%l7 + 0x78],	%l1
	array8	%i4,	%g1,	%l6
	fandnot1s	%f5,	%f0,	%f15
	mova	%icc,	%l3,	%i3
	movrgz	%i6,	0x3EB,	%o7
	sdiv	%o6,	0x1C18,	%o3
	xorcc	%o5,	%g4,	%l2
	subccc	%l5,	0x08A1,	%i7
	fxnor	%f8,	%f6,	%f4
	ldd	[%l7 + 0x20],	%f4
	faligndata	%f4,	%f0,	%f4
	fmovscc	%xcc,	%f7,	%f0
	edge8n	%i1,	%g5,	%g2
	movge	%xcc,	%o4,	%o0
	stw	%i5,	[%l7 + 0x54]
	lduh	[%l7 + 0x30],	%l4
	movcc	%icc,	%g7,	%o1
	ldsb	[%l7 + 0x0F],	%i2
	sdiv	%o2,	0x1E40,	%g3
	ldsb	[%l7 + 0x27],	%l0
	smulcc	%i0,	0x192B,	%l1
	subcc	%i4,	0x1363,	%g6
	alignaddr	%g1,	%l6,	%l3
	andncc	%i6,	%o7,	%i3
	fnot1s	%f4,	%f10
	movcc	%icc,	%o6,	%o5
	edge16l	%o3,	%g4,	%l5
	alignaddrl	%i7,	%i1,	%g5
	umul	%g2,	%o4,	%l2
	fxors	%f10,	%f13,	%f0
	stb	%o0,	[%l7 + 0x79]
	fsrc2	%f10,	%f14
	fone	%f10
	udivcc	%i5,	0x0359,	%l4
	ldsh	[%l7 + 0x48],	%g7
	movrne	%i2,	0x1FF,	%o2
	fmovrde	%g3,	%f4,	%f14
	array16	%o1,	%i0,	%l1
	popc	0x106C,	%l0
	udivx	%i4,	0x1258,	%g6
	fmovrsgez	%l6,	%f9,	%f3
	edge8n	%g1,	%l3,	%o7
	popc	0x125F,	%i6
	sethi	0x17AA,	%o6
	movcc	%icc,	%i3,	%o5
	andcc	%g4,	%o3,	%i7
	movg	%xcc,	%l5,	%g5
	stx	%g2,	[%l7 + 0x40]
	subcc	%i1,	%l2,	%o0
	std	%f14,	[%l7 + 0x48]
	movne	%icc,	%i5,	%o4
	movcs	%xcc,	%l4,	%i2
	smul	%g7,	0x0499,	%g3
	umulcc	%o2,	0x0F14,	%i0
	stx	%l1,	[%l7 + 0x30]
	movcc	%xcc,	%l0,	%o1
	stb	%g6,	[%l7 + 0x35]
	movrne	%l6,	0x2C1,	%i4
	movrlz	%l3,	%g1,	%o7
	srax	%o6,	0x0A,	%i3
	edge16n	%o5,	%g4,	%o3
	fcmpeq16	%f0,	%f10,	%i6
	andncc	%i7,	%l5,	%g2
	srax	%i1,	0x0A,	%g5
	sdiv	%o0,	0x083C,	%l2
	std	%f14,	[%l7 + 0x58]
	srl	%o4,	0x03,	%i5
	sdivx	%i2,	0x0809,	%g7
	andcc	%g3,	0x046B,	%o2
	fcmps	%fcc3,	%f4,	%f11
	smul	%l4,	0x0F2D,	%i0
	fmovrsgz	%l0,	%f3,	%f13
	stb	%o1,	[%l7 + 0x4F]
	move	%icc,	%l1,	%g6
	fpsub32s	%f5,	%f6,	%f3
	sdivcc	%i4,	0x0F06,	%l6
	alignaddr	%l3,	%g1,	%o7
	movg	%icc,	%i3,	%o5
	movg	%icc,	%o6,	%g4
	st	%f15,	[%l7 + 0x48]
	movvc	%xcc,	%o3,	%i6
	movl	%xcc,	%l5,	%g2
	fandnot2s	%f4,	%f0,	%f5
	movleu	%xcc,	%i1,	%i7
	subc	%g5,	%o0,	%l2
	addcc	%o4,	0x0957,	%i2
	fcmpd	%fcc0,	%f4,	%f10
	sethi	0x120F,	%g7
	ldsw	[%l7 + 0x78],	%i5
	stw	%o2,	[%l7 + 0x74]
	movrgez	%l4,	%g3,	%l0
	movle	%xcc,	%i0,	%l1
	srl	%o1,	0x11,	%i4
	ldsb	[%l7 + 0x56],	%l6
	ldsw	[%l7 + 0x7C],	%g6
	movrgez	%g1,	0x062,	%o7
	andn	%l3,	0x0132,	%o5
	ldx	[%l7 + 0x08],	%o6
	restore %i3, 0x0FF8, %g4
	subcc	%o3,	0x0F3B,	%i6
	ldsh	[%l7 + 0x3E],	%l5
	move	%icc,	%i1,	%i7
	sdivcc	%g5,	0x19CB,	%g2
	udivx	%o0,	0x125C,	%l2
	orn	%o4,	%g7,	%i2
	movcs	%xcc,	%o2,	%l4
	stx	%g3,	[%l7 + 0x60]
	subcc	%l0,	%i0,	%l1
	edge8	%o1,	%i4,	%i5
	subccc	%l6,	%g1,	%g6
	movcc	%icc,	%l3,	%o5
	st	%f3,	[%l7 + 0x14]
	srlx	%o7,	0x18,	%i3
	andn	%g4,	0x1BD2,	%o3
	movne	%icc,	%o6,	%l5
	edge16n	%i1,	%i7,	%i6
	subccc	%g5,	%g2,	%l2
	faligndata	%f4,	%f14,	%f10
	fmovsn	%xcc,	%f4,	%f8
	mulx	%o4,	%g7,	%o0
	array16	%o2,	%i2,	%g3
	fmovdvs	%xcc,	%f4,	%f10
	movrgez	%l0,	0x36E,	%l4
	fabss	%f4,	%f5
	movl	%icc,	%i0,	%l1
	save %i4, %i5, %l6
	fmovsne	%icc,	%f8,	%f0
	movpos	%icc,	%o1,	%g6
	edge32n	%l3,	%g1,	%o5
	umul	%i3,	0x1859,	%o7
	udivx	%g4,	0x12E6,	%o6
	array16	%o3,	%l5,	%i7
	ldsb	[%l7 + 0x16],	%i1
	and	%i6,	%g5,	%g2
	fmovdgu	%xcc,	%f5,	%f2
	movrgez	%l2,	0x2C9,	%o4
	movrne	%o0,	%o2,	%g7
	edge8n	%g3,	%i2,	%l4
	fmovdg	%icc,	%f9,	%f3
	fpadd32s	%f14,	%f0,	%f11
	fmovrde	%i0,	%f14,	%f14
	ldd	[%l7 + 0x48],	%f12
	andn	%l1,	%i4,	%i5
	stw	%l6,	[%l7 + 0x28]
	addccc	%o1,	0x1650,	%g6
	addc	%l3,	%g1,	%o5
	movvs	%xcc,	%l0,	%o7
	fcmps	%fcc0,	%f4,	%f4
	edge8n	%i3,	%g4,	%o6
	srlx	%o3,	0x10,	%i7
	xnorcc	%i1,	0x1991,	%i6
	edge16ln	%g5,	%l5,	%l2
	srl	%o4,	0x00,	%o0
	or	%o2,	0x0915,	%g7
	movrlez	%g2,	%g3,	%l4
	fnor	%f0,	%f4,	%f12
	sth	%i0,	[%l7 + 0x78]
	movneg	%icc,	%i2,	%l1
	edge8	%i4,	%i5,	%l6
	xorcc	%g6,	%o1,	%l3
	umulcc	%o5,	0x1109,	%l0
	move	%icc,	%g1,	%o7
	edge32n	%g4,	%i3,	%o6
	move	%icc,	%i7,	%o3
	edge32l	%i1,	%g5,	%i6
	alignaddr	%l5,	%l2,	%o0
	lduw	[%l7 + 0x64],	%o2
	alignaddrl	%o4,	%g7,	%g2
	ldsh	[%l7 + 0x64],	%g3
	alignaddr	%i0,	%i2,	%l4
	fmovsge	%icc,	%f14,	%f15
	stw	%i4,	[%l7 + 0x74]
	edge16	%l1,	%l6,	%g6
	sra	%i5,	%o1,	%l3
	movvc	%icc,	%o5,	%l0
	xnor	%g1,	%g4,	%i3
	movle	%icc,	%o6,	%o7
	movleu	%xcc,	%o3,	%i7
	ldub	[%l7 + 0x77],	%i1
	ldsb	[%l7 + 0x7B],	%g5
	srlx	%l5,	%i6,	%l2
	stb	%o0,	[%l7 + 0x32]
	fmuld8ulx16	%f7,	%f4,	%f6
	fmul8x16al	%f12,	%f3,	%f6
	sth	%o4,	[%l7 + 0x5E]
	fsrc1	%f8,	%f14
	ldd	[%l7 + 0x58],	%f12
	fcmpgt32	%f8,	%f10,	%g7
	sdivcc	%g2,	0x14D5,	%o2
	movne	%icc,	%g3,	%i0
	fxnor	%f14,	%f14,	%f8
	fmovdleu	%xcc,	%f9,	%f2
	sdivcc	%l4,	0x11FE,	%i2
	edge16n	%i4,	%l1,	%l6
	sdivcc	%g6,	0x1942,	%i5
	sub	%o1,	%l3,	%l0
	array16	%o5,	%g4,	%i3
	movrlez	%g1,	%o7,	%o3
	sllx	%i7,	0x1E,	%i1
	add	%o6,	%l5,	%i6
	fnegs	%f12,	%f14
	array16	%g5,	%l2,	%o0
	orncc	%g7,	%g2,	%o2
	andcc	%o4,	0x02A0,	%g3
	edge32ln	%i0,	%i2,	%l4
	fpsub16	%f14,	%f6,	%f10
	ldsh	[%l7 + 0x56],	%l1
	edge32	%i4,	%l6,	%i5
	udiv	%o1,	0x0F38,	%g6
	subcc	%l0,	0x1166,	%l3
	movrgez	%g4,	0x325,	%i3
	sub	%o5,	0x1474,	%o7
	stb	%g1,	[%l7 + 0x66]
	fmovse	%icc,	%f0,	%f2
	ldx	[%l7 + 0x28],	%o3
	udivx	%i1,	0x10F6,	%i7
	popc	0x1502,	%l5
	save %i6, 0x0ADC, %o6
	andn	%l2,	%o0,	%g7
	fzero	%f2
	srax	%g2,	%g5,	%o4
	sllx	%g3,	%o2,	%i0
	movle	%icc,	%i2,	%l1
	orncc	%i4,	0x059B,	%l6
	fmovrdne	%l4,	%f4,	%f2
	movne	%xcc,	%o1,	%i5
	movcs	%icc,	%l0,	%g6
	fcmpd	%fcc1,	%f10,	%f14
	save %l3, %g4, %o5
	sra	%i3,	%o7,	%g1
	umulcc	%i1,	%i7,	%o3
	movl	%xcc,	%l5,	%i6
	smul	%l2,	%o0,	%g7
	edge16n	%o6,	%g2,	%g5
	ldsb	[%l7 + 0x3B],	%g3
	ld	[%l7 + 0x34],	%f12
	fcmpeq16	%f8,	%f2,	%o2
	alignaddr	%o4,	%i2,	%i0
	edge8ln	%i4,	%l6,	%l4
	fpadd32	%f14,	%f6,	%f6
	sth	%o1,	[%l7 + 0x26]
	edge32ln	%l1,	%i5,	%l0
	fmovde	%icc,	%f7,	%f12
	lduw	[%l7 + 0x14],	%l3
	edge8	%g6,	%g4,	%o5
	fmovrsgez	%i3,	%f1,	%f13
	fnegd	%f14,	%f4
	ldsh	[%l7 + 0x34],	%g1
	andncc	%i1,	%i7,	%o7
	add	%l5,	0x06A4,	%o3
	fpsub32	%f12,	%f14,	%f8
	stx	%l2,	[%l7 + 0x28]
	movne	%xcc,	%i6,	%o0
	faligndata	%f12,	%f8,	%f0
	orncc	%g7,	0x1AFE,	%o6
	xorcc	%g5,	0x1E6B,	%g2
	movge	%xcc,	%g3,	%o2
	smulcc	%o4,	0x06B8,	%i0
	sdivcc	%i2,	0x11C5,	%l6
	movne	%xcc,	%l4,	%o1
	umul	%i4,	0x0524,	%i5
	fmovda	%xcc,	%f7,	%f0
	addccc	%l0,	0x1559,	%l1
	std	%f10,	[%l7 + 0x68]
	fmovdl	%xcc,	%f6,	%f4
	st	%f3,	[%l7 + 0x14]
	ldsw	[%l7 + 0x44],	%g6
	st	%f13,	[%l7 + 0x38]
	andcc	%l3,	0x1917,	%o5
	umul	%i3,	%g4,	%i1
	and	%i7,	%o7,	%l5
	alignaddr	%o3,	%g1,	%l2
	edge16	%o0,	%g7,	%i6
	xnorcc	%g5,	0x0C8E,	%g2
	edge32	%g3,	%o6,	%o2
	srl	%i0,	%o4,	%i2
	andcc	%l4,	0x0CD3,	%o1
	lduh	[%l7 + 0x6A],	%i4
	ldd	[%l7 + 0x50],	%i6
	mova	%icc,	%i5,	%l0
	srax	%l1,	0x1E,	%l3
	edge8ln	%g6,	%o5,	%g4
	fpackfix	%f10,	%f9
	srl	%i3,	0x17,	%i1
	movre	%i7,	0x13B,	%o7
	movg	%icc,	%l5,	%o3
	edge8l	%g1,	%l2,	%o0
	fmovrdlez	%i6,	%f10,	%f4
	movne	%xcc,	%g7,	%g5
	ldsh	[%l7 + 0x38],	%g3
	and	%o6,	%o2,	%i0
	array8	%o4,	%i2,	%g2
	sra	%l4,	0x17,	%o1
	movneg	%icc,	%l6,	%i5
	stx	%i4,	[%l7 + 0x10]
	ld	[%l7 + 0x44],	%f9
	fcmpgt16	%f14,	%f10,	%l0
	movrlez	%l1,	0x2F9,	%l3
	movle	%icc,	%g6,	%o5
	movleu	%xcc,	%g4,	%i1
	addccc	%i3,	0x0FB4,	%o7
	udiv	%l5,	0x1ECD,	%i7
	udivx	%g1,	0x119D,	%o3
	sdivx	%o0,	0x1786,	%i6
	edge16n	%g7,	%l2,	%g3
	add	%o6,	0x082D,	%o2
	addc	%i0,	%g5,	%o4
	fmovsl	%xcc,	%f15,	%f1
	edge32	%i2,	%g2,	%o1
	fpsub32	%f12,	%f6,	%f6
	udivx	%l6,	0x085C,	%i5
	and	%l4,	%i4,	%l0
	edge32	%l3,	%g6,	%l1
	ldd	[%l7 + 0x50],	%o4
	ldsw	[%l7 + 0x24],	%i1
	srl	%i3,	0x02,	%g4
	edge16l	%l5,	%o7,	%g1
	addccc	%o3,	0x0A13,	%o0
	fmovsvc	%xcc,	%f11,	%f0
	orn	%i7,	%g7,	%i6
	orncc	%l2,	0x1C0E,	%o6
	udivx	%o2,	0x02FC,	%i0
	subccc	%g5,	%g3,	%i2
	xnor	%o4,	%o1,	%l6
	fxnor	%f12,	%f12,	%f14
	sll	%i5,	0x0E,	%g2
	edge8	%i4,	%l0,	%l3
	edge16l	%l4,	%l1,	%g6
	stx	%i1,	[%l7 + 0x20]
	stx	%o5,	[%l7 + 0x70]
	fmovse	%icc,	%f15,	%f5
	std	%f0,	[%l7 + 0x40]
	fpsub16s	%f5,	%f5,	%f2
	movrgz	%i3,	%l5,	%g4
	fmovsl	%icc,	%f14,	%f15
	movvc	%icc,	%o7,	%g1
	sth	%o3,	[%l7 + 0x1A]
	movcs	%xcc,	%i7,	%o0
	umulcc	%g7,	0x1F85,	%l2
	smulcc	%o6,	0x01E5,	%o2
	movl	%xcc,	%i6,	%g5
	fmovsn	%xcc,	%f8,	%f11
	fmovdcs	%xcc,	%f5,	%f13
	fmovscs	%xcc,	%f7,	%f11
	restore %i0, %g3, %o4
	fsrc2	%f8,	%f12
	array32	%o1,	%l6,	%i2
	alignaddrl	%i5,	%g2,	%l0
	fmuld8sux16	%f2,	%f3,	%f4
	and	%l3,	0x1161,	%l4
	fmovdpos	%icc,	%f5,	%f14
	movge	%icc,	%l1,	%i4
	fpadd16s	%f8,	%f13,	%f4
	ld	[%l7 + 0x7C],	%f12
	fpadd16	%f14,	%f10,	%f4
	subcc	%g6,	0x1436,	%o5
	movl	%icc,	%i3,	%i1
	fmovdgu	%xcc,	%f1,	%f9
	sdivx	%l5,	0x0C16,	%g4
	sethi	0x1ADE,	%g1
	fmovrdne	%o3,	%f0,	%f4
	fmovse	%xcc,	%f10,	%f7
	sra	%o7,	%i7,	%g7
	movrgz	%l2,	0x353,	%o6
	andn	%o2,	%o0,	%g5
	fmovsvc	%icc,	%f12,	%f0
	sethi	0x1E5E,	%i0
	umulcc	%g3,	%o4,	%o1
	edge16l	%i6,	%l6,	%i2
	movvs	%xcc,	%i5,	%l0
	sth	%g2,	[%l7 + 0x5C]
	st	%f5,	[%l7 + 0x70]
	udivx	%l3,	0x1593,	%l4
	alignaddr	%l1,	%g6,	%o5
	edge16ln	%i4,	%i1,	%i3
	fmovdvc	%xcc,	%f7,	%f1
	ldd	[%l7 + 0x40],	%l4
	xnor	%g1,	%o3,	%g4
	ldd	[%l7 + 0x18],	%f12
	edge32	%i7,	%g7,	%o7
	movn	%xcc,	%o6,	%o2
	for	%f2,	%f10,	%f8
	sllx	%l2,	%g5,	%i0
	movrgz	%g3,	%o0,	%o4
	movle	%icc,	%o1,	%i6
	fmovdn	%xcc,	%f7,	%f3
	fcmpes	%fcc1,	%f15,	%f3
	sethi	0x025E,	%i2
	addccc	%i5,	0x1A81,	%l6
	sdiv	%l0,	0x109F,	%l3
	addc	%l4,	0x151D,	%l1
	xor	%g2,	0x0C62,	%o5
	alignaddrl	%i4,	%i1,	%g6
	movrne	%l5,	0x1BC,	%i3
	movn	%icc,	%o3,	%g4
	movvc	%xcc,	%g1,	%g7
	ldd	[%l7 + 0x78],	%i6
	movg	%icc,	%o7,	%o2
	subcc	%l2,	%o6,	%i0
	add	%g3,	%g5,	%o4
	fexpand	%f5,	%f6
	st	%f13,	[%l7 + 0x3C]
	st	%f0,	[%l7 + 0x28]
	sethi	0x1269,	%o1
	xnor	%i6,	0x0AFF,	%o0
	fmuld8ulx16	%f5,	%f13,	%f8
	sll	%i5,	0x1D,	%i2
	and	%l0,	%l3,	%l4
	fmovsa	%icc,	%f0,	%f0
	lduw	[%l7 + 0x14],	%l6
	array16	%g2,	%o5,	%l1
	or	%i4,	%i1,	%g6
	std	%f4,	[%l7 + 0x28]
	addccc	%i3,	%l5,	%g4
	sth	%g1,	[%l7 + 0x30]
	restore %o3, %g7, %i7
	smulcc	%o2,	0x0B94,	%o7
	add	%o6,	%l2,	%i0
	movrgz	%g3,	%g5,	%o4
	andn	%i6,	0x07BF,	%o1
	movrgz	%o0,	%i2,	%l0
	array32	%l3,	%i5,	%l6
	fmovse	%icc,	%f8,	%f8
	ldx	[%l7 + 0x10],	%l4
	add	%o5,	%l1,	%i4
	fsrc1	%f10,	%f8
	ldx	[%l7 + 0x60],	%i1
	orn	%g2,	0x0953,	%g6
	addccc	%l5,	%i3,	%g1
	sdivcc	%o3,	0x1CF8,	%g7
	subccc	%g4,	0x0253,	%o2
	sllx	%i7,	0x1A,	%o6
	udivx	%l2,	0x0DB0,	%i0
	edge8	%o7,	%g5,	%g3
	lduh	[%l7 + 0x18],	%o4
	ldx	[%l7 + 0x58],	%o1
	movleu	%xcc,	%o0,	%i2
	fmovrslz	%i6,	%f2,	%f0
	umulcc	%l3,	0x098B,	%i5
	fors	%f0,	%f3,	%f1
	fcmpne16	%f6,	%f2,	%l6
	orcc	%l0,	0x10E4,	%l4
	ldub	[%l7 + 0x53],	%o5
	fmovde	%icc,	%f6,	%f6
	popc	%i4,	%l1
	fcmpes	%fcc3,	%f5,	%f4
	sdivx	%g2,	0x06AB,	%g6
	umul	%l5,	0x04C5,	%i1
	movgu	%xcc,	%i3,	%o3
	movn	%icc,	%g7,	%g4
	umulcc	%o2,	0x0769,	%g1
	fcmpd	%fcc1,	%f4,	%f12
	addc	%o6,	%i7,	%l2
	sdivcc	%i0,	0x1ADC,	%o7
	move	%xcc,	%g3,	%g5
	movleu	%xcc,	%o1,	%o4
	movcs	%icc,	%i2,	%i6
	sth	%o0,	[%l7 + 0x7E]
	subccc	%l3,	0x0CF4,	%i5
	edge32l	%l6,	%l4,	%l0
	fmovrsgz	%i4,	%f2,	%f4
	sdiv	%o5,	0x14A7,	%g2
	fpsub32	%f0,	%f12,	%f6
	lduh	[%l7 + 0x1A],	%l1
	fmovdvs	%icc,	%f10,	%f2
	sth	%g6,	[%l7 + 0x7E]
	fpackfix	%f10,	%f0
	ldd	[%l7 + 0x38],	%f10
	fmovdl	%icc,	%f1,	%f14
	fpadd16s	%f5,	%f15,	%f14
	array16	%i1,	%i3,	%l5
	edge16ln	%g7,	%g4,	%o3
	movn	%xcc,	%o2,	%o6
	sdiv	%i7,	0x0AF9,	%g1
	ldd	[%l7 + 0x48],	%l2
	subccc	%i0,	%g3,	%g5
	save %o7, 0x0A17, %o4
	subc	%i2,	0x0C36,	%o1
	srax	%i6,	%l3,	%o0
	xnor	%l6,	%i5,	%l0
	and	%i4,	0x16CE,	%o5
	udivx	%g2,	0x1F60,	%l1
	edge8n	%l4,	%g6,	%i1
	addc	%i3,	0x0782,	%g7
	fandnot1	%f0,	%f14,	%f0
	array8	%g4,	%l5,	%o2
	movleu	%icc,	%o3,	%i7
	fmovrdlez	%g1,	%f8,	%f10
	fandnot1	%f14,	%f4,	%f2
	ldsh	[%l7 + 0x68],	%o6
	edge16l	%i0,	%g3,	%l2
	or	%g5,	0x130F,	%o4
	andn	%o7,	%o1,	%i6
	alignaddr	%i2,	%o0,	%l6
	ld	[%l7 + 0x20],	%f3
	fnot2	%f0,	%f8
	udivx	%l3,	0x11BC,	%l0
	fpack32	%f6,	%f8,	%f12
	andncc	%i4,	%i5,	%o5
	fxnors	%f14,	%f1,	%f9
	movne	%xcc,	%g2,	%l4
	array32	%g6,	%l1,	%i3
	fmovdg	%xcc,	%f9,	%f10
	sdivcc	%g7,	0x1DCB,	%g4
	umul	%l5,	%i1,	%o3
	fcmpes	%fcc1,	%f4,	%f13
	fmul8x16au	%f0,	%f5,	%f2
	fnot1	%f8,	%f6
	movneg	%xcc,	%o2,	%i7
	orcc	%g1,	0x0562,	%o6
	ldsh	[%l7 + 0x72],	%i0
	ldx	[%l7 + 0x78],	%l2
	ldub	[%l7 + 0x5F],	%g3
	subc	%o4,	%o7,	%o1
	movleu	%icc,	%i6,	%g5
	fands	%f14,	%f8,	%f15
	edge8l	%o0,	%i2,	%l6
	movn	%icc,	%l0,	%i4
	xorcc	%l3,	0x102B,	%i5
	sdiv	%g2,	0x1941,	%o5
	movvs	%xcc,	%l4,	%g6
	srlx	%l1,	0x04,	%g7
	fsrc1s	%f15,	%f14
	orn	%i3,	%g4,	%l5
	ldub	[%l7 + 0x79],	%o3
	edge16n	%i1,	%o2,	%g1
	sth	%i7,	[%l7 + 0x24]
	andn	%o6,	0x0201,	%i0
	edge16n	%l2,	%g3,	%o4
	for	%f10,	%f12,	%f8
	addcc	%o7,	0x0EB2,	%o1
	restore %g5, %i6, %o0
	ldsb	[%l7 + 0x60],	%l6
	movleu	%xcc,	%i2,	%i4
	add	%l0,	%i5,	%g2
	xnorcc	%l3,	0x01E1,	%l4
	edge32n	%o5,	%g6,	%g7
	fcmpgt16	%f8,	%f8,	%i3
	edge32	%l1,	%g4,	%l5
	add	%i1,	0x16DA,	%o3
	sub	%g1,	%i7,	%o6
	fnot2	%f8,	%f6
	fnegs	%f0,	%f2
	edge16n	%o2,	%i0,	%l2
	stw	%o4,	[%l7 + 0x0C]
	array8	%g3,	%o1,	%o7
	ldd	[%l7 + 0x20],	%g4
	mulscc	%i6,	0x055A,	%o0
	array16	%l6,	%i2,	%l0
	stw	%i4,	[%l7 + 0x1C]
	fpsub16	%f10,	%f0,	%f12
	ldub	[%l7 + 0x0D],	%g2
	fmovsa	%icc,	%f3,	%f12
	edge8l	%i5,	%l4,	%l3
	stx	%o5,	[%l7 + 0x48]
	fsrc2	%f12,	%f10
	edge32ln	%g7,	%i3,	%l1
	sub	%g6,	0x01F9,	%l5
	movre	%g4,	%o3,	%i1
	mova	%icc,	%i7,	%g1
	smul	%o6,	0x0C56,	%i0
	ldx	[%l7 + 0x70],	%o2
	xnor	%o4,	0x0FA8,	%l2
	fmovrdgez	%g3,	%f6,	%f6
	ld	[%l7 + 0x50],	%f8
	sll	%o1,	0x0B,	%g5
	ld	[%l7 + 0x44],	%f10
	alignaddrl	%i6,	%o7,	%o0
	subccc	%i2,	%l0,	%l6
	array8	%g2,	%i4,	%l4
	orncc	%i5,	%l3,	%o5
	movrlz	%i3,	%l1,	%g6
	mulx	%g7,	%l5,	%g4
	array8	%i1,	%o3,	%g1
	srl	%o6,	%i7,	%o2
	smulcc	%i0,	0x163E,	%o4
	fmovrslz	%g3,	%f2,	%f13
	alignaddrl	%l2,	%g5,	%o1
	alignaddrl	%i6,	%o7,	%o0
	orncc	%l0,	%l6,	%g2
	ldsh	[%l7 + 0x2A],	%i2
	fcmple32	%f14,	%f10,	%i4
	movrlez	%i5,	%l3,	%o5
	movre	%l4,	0x061,	%i3
	movle	%xcc,	%g6,	%g7
	ldsb	[%l7 + 0x6E],	%l5
	orncc	%l1,	%g4,	%o3
	alignaddrl	%g1,	%i1,	%i7
	movgu	%xcc,	%o6,	%o2
	sdivx	%i0,	0x1F7C,	%o4
	fmovspos	%icc,	%f7,	%f6
	movge	%icc,	%g3,	%g5
	fone	%f12
	movrlz	%l2,	0x258,	%o1
	edge32l	%i6,	%o0,	%o7
	fmovdle	%xcc,	%f11,	%f5
	subc	%l0,	0x170E,	%g2
	fcmple16	%f6,	%f2,	%i2
	ldsb	[%l7 + 0x0E],	%i4
	movleu	%icc,	%i5,	%l6
	fnors	%f3,	%f13,	%f6
	and	%l3,	0x194C,	%o5
	ldsh	[%l7 + 0x7E],	%l4
	ldd	[%l7 + 0x78],	%f8
	fandnot1s	%f8,	%f4,	%f3
	sra	%i3,	0x13,	%g6
	alignaddr	%l5,	%l1,	%g7
	fors	%f12,	%f2,	%f0
	movre	%g4,	0x0CA,	%g1
	edge32n	%o3,	%i7,	%o6
	fcmpes	%fcc0,	%f15,	%f8
	ldsb	[%l7 + 0x0E],	%o2
	movl	%icc,	%i0,	%i1
	edge16	%o4,	%g5,	%l2
	fand	%f6,	%f10,	%f10
	movge	%icc,	%g3,	%o1
	sra	%o0,	%o7,	%l0
	alignaddrl	%g2,	%i6,	%i4
	srlx	%i2,	0x1B,	%i5
	fpackfix	%f14,	%f14
	st	%f2,	[%l7 + 0x24]
	sethi	0x17C7,	%l3
	addc	%o5,	0x0F2D,	%l6
	fmovsleu	%icc,	%f13,	%f14
	xorcc	%i3,	%g6,	%l5
	or	%l4,	0x0240,	%l1
	sdivx	%g4,	0x191A,	%g7
	edge8n	%o3,	%g1,	%i7
	fnot2	%f10,	%f14
	edge16l	%o2,	%i0,	%o6
	subcc	%i1,	%g5,	%l2
	ldsh	[%l7 + 0x0C],	%g3
	fxor	%f4,	%f6,	%f10
	edge16n	%o4,	%o0,	%o1
	umulcc	%l0,	0x0183,	%g2
	fpsub16	%f12,	%f6,	%f2
	umulcc	%i6,	0x11B2,	%i4
	fcmpd	%fcc1,	%f4,	%f14
	fmovdpos	%icc,	%f2,	%f1
	fmovdle	%xcc,	%f6,	%f14
	xnorcc	%o7,	%i5,	%i2
	fmovscc	%icc,	%f7,	%f7
	udivcc	%o5,	0x1428,	%l6
	xor	%l3,	0x13B7,	%i3
	movg	%xcc,	%l5,	%g6
	edge16n	%l4,	%l1,	%g4
	ldd	[%l7 + 0x60],	%o2
	xnorcc	%g1,	0x156C,	%i7
	movge	%icc,	%o2,	%g7
	fnand	%f6,	%f14,	%f8
	movle	%icc,	%i0,	%i1
	smulcc	%g5,	%l2,	%o6
	fmovdle	%xcc,	%f7,	%f13
	fmovsge	%xcc,	%f10,	%f10
	st	%f10,	[%l7 + 0x38]
	mova	%icc,	%g3,	%o4
	fmovscc	%xcc,	%f6,	%f2
	udivx	%o1,	0x121C,	%l0
	fmovscs	%icc,	%f8,	%f1
	movgu	%xcc,	%o0,	%i6
	edge8ln	%i4,	%g2,	%o7
	fors	%f15,	%f15,	%f11
	siam	0x2
	and	%i5,	%i2,	%o5
	edge16ln	%l3,	%l6,	%i3
	edge8l	%l5,	%l4,	%l1
	fcmple16	%f10,	%f2,	%g6
	sllx	%g4,	%o3,	%i7
	std	%f2,	[%l7 + 0x58]
	xnor	%o2,	%g7,	%g1
	addccc	%i0,	%i1,	%g5
	udivx	%o6,	0x194B,	%g3
	addcc	%l2,	0x1AF9,	%o1
	udivx	%o4,	0x0C5F,	%o0
	movrgz	%l0,	%i6,	%i4
	fmovrsgz	%o7,	%f3,	%f5
	alignaddrl	%i5,	%i2,	%g2
	ldsh	[%l7 + 0x7E],	%l3
	fornot1	%f10,	%f14,	%f0
	udiv	%o5,	0x15F9,	%l6
	movn	%xcc,	%l5,	%l4
	andn	%i3,	0x0333,	%l1
	fcmped	%fcc1,	%f8,	%f10
	popc	%g6,	%o3
	sll	%i7,	0x19,	%o2
	srlx	%g4,	0x0C,	%g7
	movneg	%icc,	%i0,	%i1
	orn	%g5,	%g1,	%g3
	fmovspos	%icc,	%f14,	%f7
	stw	%o6,	[%l7 + 0x7C]
	array32	%l2,	%o1,	%o0
	srax	%l0,	0x11,	%o4
	fmovsge	%xcc,	%f14,	%f8
	fpadd32	%f12,	%f12,	%f0
	srlx	%i6,	0x1D,	%i4
	movneg	%xcc,	%i5,	%i2
	ldsw	[%l7 + 0x70],	%g2
	edge32n	%l3,	%o5,	%l6
	movvc	%icc,	%l5,	%l4
	fexpand	%f1,	%f12
	movvc	%icc,	%i3,	%o7
	edge32ln	%g6,	%l1,	%i7
	popc	%o3,	%g4
	sllx	%g7,	0x19,	%o2
	fcmpgt16	%f12,	%f12,	%i1
	addccc	%g5,	0x13E9,	%i0
	stb	%g3,	[%l7 + 0x5C]
	movcs	%xcc,	%o6,	%g1
	st	%f4,	[%l7 + 0x60]
	fornot1s	%f5,	%f0,	%f3
	std	%f0,	[%l7 + 0x38]
	ldsw	[%l7 + 0x18],	%o1
	ldsb	[%l7 + 0x6F],	%o0
	edge8	%l2,	%l0,	%i6
	edge32	%o4,	%i4,	%i2
	srax	%g2,	0x0C,	%i5
	edge16	%o5,	%l6,	%l3
	movrgez	%l4,	%l5,	%i3
	edge8l	%o7,	%l1,	%i7
	udivcc	%o3,	0x0DDB,	%g6
	save %g7, %o2, %i1
	edge8l	%g5,	%i0,	%g3
	alignaddrl	%o6,	%g4,	%g1
	movpos	%xcc,	%o1,	%o0
	std	%f14,	[%l7 + 0x40]
	popc	0x1308,	%l2
	std	%f2,	[%l7 + 0x60]
	popc	%l0,	%o4
	fmuld8sux16	%f11,	%f10,	%f4
	movcs	%icc,	%i6,	%i4
	edge16ln	%i2,	%g2,	%i5
	orn	%l6,	%o5,	%l4
	orcc	%l3,	0x07F4,	%i3
	movl	%icc,	%o7,	%l1
	movle	%xcc,	%l5,	%o3
	srax	%g6,	%i7,	%g7
	sll	%o2,	%i1,	%i0
	ldsb	[%l7 + 0x25],	%g3
	st	%f5,	[%l7 + 0x3C]
	fcmped	%fcc1,	%f14,	%f14
	smul	%o6,	%g5,	%g1
	movrlez	%g4,	%o1,	%l2
	udiv	%o0,	0x11C2,	%l0
	xnor	%i6,	%o4,	%i4
	lduw	[%l7 + 0x54],	%g2
	umulcc	%i5,	%i2,	%o5
	ldsw	[%l7 + 0x28],	%l6
	array8	%l3,	%l4,	%i3
	movg	%xcc,	%o7,	%l1
	edge8ln	%l5,	%o3,	%g6
	mulscc	%g7,	0x1C2B,	%i7
	fmovse	%icc,	%f3,	%f9
	subc	%o2,	0x0B35,	%i1
	ldd	[%l7 + 0x30],	%f10
	xnor	%i0,	0x027C,	%o6
	movn	%xcc,	%g5,	%g3
	addccc	%g4,	%g1,	%o1
	movcs	%xcc,	%o0,	%l2
	movge	%icc,	%i6,	%l0
	movvs	%icc,	%i4,	%o4
	fmovsa	%xcc,	%f8,	%f13
	ldsb	[%l7 + 0x47],	%i5
	movn	%xcc,	%i2,	%o5
	orncc	%l6,	%l3,	%g2
	sdivcc	%l4,	0x044B,	%i3
	movrgez	%l1,	0x099,	%l5
	srl	%o3,	0x01,	%o7
	udivx	%g6,	0x1FE0,	%g7
	mulscc	%i7,	%o2,	%i1
	ldsb	[%l7 + 0x62],	%o6
	edge32ln	%g5,	%g3,	%g4
	fmovrdlez	%g1,	%f10,	%f10
	fmovde	%xcc,	%f12,	%f3
	ldsh	[%l7 + 0x0A],	%i0
	edge32n	%o0,	%o1,	%l2
	ld	[%l7 + 0x0C],	%f7
	movrgz	%i6,	0x395,	%i4
	sub	%l0,	%o4,	%i5
	or	%o5,	%l6,	%i2
	fxor	%f6,	%f10,	%f0
	edge16l	%l3,	%g2,	%i3
	smulcc	%l1,	0x1CF6,	%l5
	popc	%l4,	%o7
	ld	[%l7 + 0x48],	%f3
	fmul8sux16	%f6,	%f10,	%f0
	smul	%g6,	%g7,	%o3
	fpsub32	%f10,	%f2,	%f4
	andn	%o2,	%i7,	%i1
	add	%o6,	0x0EE8,	%g3
	sdivcc	%g4,	0x0775,	%g5
	sub	%g1,	0x0826,	%o0
	udivcc	%i0,	0x050D,	%l2
	fmovdn	%icc,	%f4,	%f9
	fmovsa	%icc,	%f12,	%f8
	subcc	%o1,	%i6,	%i4
	fmul8x16	%f11,	%f6,	%f0
	fmovsgu	%icc,	%f3,	%f7
	sdivx	%o4,	0x0AB3,	%i5
	edge8ln	%l0,	%o5,	%i2
	lduw	[%l7 + 0x44],	%l3
	mova	%icc,	%g2,	%i3
	restore %l1, %l6, %l5
	smulcc	%o7,	0x1E39,	%g6
	restore %l4, 0x0339, %o3
	mulscc	%o2,	0x1AB2,	%g7
	movvc	%icc,	%i7,	%o6
	subc	%g3,	%g4,	%i1
	subccc	%g1,	0x1CBD,	%g5
	alignaddr	%o0,	%i0,	%o1
	xnor	%i6,	0x1441,	%l2
	fornot1	%f8,	%f0,	%f8
	restore %o4, %i4, %l0
	ld	[%l7 + 0x0C],	%f8
	xnorcc	%i5,	%o5,	%l3
	fandnot2	%f8,	%f2,	%f8
	fcmple32	%f8,	%f6,	%i2
	popc	%i3,	%l1
	subcc	%l6,	%l5,	%g2
	fpadd16	%f14,	%f4,	%f2
	ld	[%l7 + 0x48],	%f8
	fcmpne16	%f2,	%f6,	%g6
	ldd	[%l7 + 0x70],	%o6
	fmovsg	%xcc,	%f6,	%f5
	movcs	%icc,	%o3,	%o2
	restore %g7, %l4, %i7
	smul	%o6,	0x0893,	%g3
	fmovdne	%icc,	%f12,	%f11
	sethi	0x165B,	%i1
	movleu	%icc,	%g4,	%g1
	movl	%icc,	%o0,	%i0
	fcmpes	%fcc2,	%f10,	%f15
	sethi	0x19C8,	%o1
	popc	0x1AF3,	%i6
	xnorcc	%l2,	%o4,	%i4
	ldub	[%l7 + 0x46],	%g5
	smulcc	%i5,	%l0,	%o5
	fpackfix	%f6,	%f9
	srax	%l3,	%i2,	%l1
	edge32	%l6,	%l5,	%g2
	edge32	%g6,	%i3,	%o7
	fmul8ulx16	%f2,	%f8,	%f6
	andcc	%o3,	%g7,	%o2
	andncc	%l4,	%o6,	%g3
	ldub	[%l7 + 0x42],	%i1
	movre	%g4,	0x1A3,	%i7
	fmuld8sux16	%f2,	%f1,	%f8
	addc	%o0,	0x1A22,	%g1
	subccc	%i0,	%i6,	%l2
	sdiv	%o4,	0x0133,	%i4
	sdivcc	%o1,	0x1155,	%i5
	mulx	%l0,	%o5,	%g5
	sub	%i2,	0x02F9,	%l1
	sll	%l6,	0x0D,	%l5
	ldsw	[%l7 + 0x18],	%l3
	add	%g6,	0x124A,	%i3
	andncc	%g2,	%o3,	%o7
	srl	%g7,	%l4,	%o6
	fsrc1s	%f7,	%f8
	movg	%xcc,	%o2,	%i1
	movvs	%xcc,	%g3,	%g4
	fmovdne	%xcc,	%f15,	%f8
	move	%icc,	%i7,	%o0
	udiv	%i0,	0x0CF6,	%g1
	movrgez	%l2,	0x297,	%i6
	sethi	0x0BAE,	%i4
	movvs	%icc,	%o4,	%i5
	orn	%l0,	%o5,	%g5
	fands	%f9,	%f4,	%f1
	xorcc	%o1,	0x1F1F,	%l1
	edge32ln	%i2,	%l6,	%l5
	fmovdcs	%icc,	%f7,	%f4
	ldsw	[%l7 + 0x14],	%l3
	udiv	%i3,	0x07A4,	%g6
	movge	%icc,	%g2,	%o7
	subccc	%g7,	%o3,	%o6
	ldx	[%l7 + 0x48],	%o2
	lduh	[%l7 + 0x22],	%l4
	edge32	%g3,	%i1,	%g4
	ldub	[%l7 + 0x43],	%i7
	fpmerge	%f14,	%f2,	%f0
	fcmple32	%f10,	%f2,	%i0
	fornot2	%f6,	%f14,	%f4
	ldub	[%l7 + 0x1C],	%g1
	st	%f10,	[%l7 + 0x3C]
	movle	%icc,	%o0,	%l2
	alignaddrl	%i6,	%o4,	%i5
	sra	%l0,	%i4,	%g5
	ldsh	[%l7 + 0x42],	%o1
	fnegd	%f2,	%f0
	sll	%l1,	0x10,	%i2
	xor	%l6,	%l5,	%o5
	addc	%i3,	%g6,	%l3
	subccc	%g2,	%g7,	%o7
	fcmpeq32	%f0,	%f8,	%o3
	st	%f15,	[%l7 + 0x50]
	fxnors	%f0,	%f5,	%f0
	subcc	%o2,	0x0F63,	%o6
	save %g3, 0x0C57, %l4
	std	%f14,	[%l7 + 0x48]
	edge16l	%g4,	%i7,	%i1
	ldsw	[%l7 + 0x18],	%i0
	st	%f1,	[%l7 + 0x14]
	edge32ln	%g1,	%l2,	%o0
	edge8ln	%i6,	%o4,	%i5
	movrgz	%i4,	0x0DE,	%l0
	xorcc	%o1,	%g5,	%i2
	sra	%l1,	0x03,	%l5
	ldsh	[%l7 + 0x3A],	%o5
	fnors	%f8,	%f13,	%f1
	edge32l	%i3,	%g6,	%l6
	popc	0x1725,	%l3
	movrlz	%g7,	%o7,	%g2
	sth	%o2,	[%l7 + 0x26]
	fmovsgu	%icc,	%f0,	%f1
	sethi	0x1100,	%o3
	fmovscs	%xcc,	%f5,	%f1
	fornot1	%f0,	%f4,	%f6
	save %g3, %l4, %g4
	srax	%o6,	0x1E,	%i7
	sllx	%i0,	0x0C,	%i1
	save %l2, 0x161E, %g1
	subccc	%i6,	0x12EF,	%o4
	alignaddrl	%o0,	%i4,	%l0
	fmovrdne	%o1,	%f8,	%f2
	fmovrdgz	%g5,	%f2,	%f4
	addccc	%i5,	%i2,	%l1
	addc	%o5,	%l5,	%g6
	fmovsleu	%icc,	%f13,	%f0
	movrgez	%i3,	%l3,	%g7
	subc	%l6,	0x150B,	%g2
	ldd	[%l7 + 0x48],	%o6
	fmovrsgz	%o2,	%f7,	%f12
	fnot1s	%f10,	%f7
	sra	%o3,	%l4,	%g4
	mova	%icc,	%o6,	%g3
	alignaddr	%i7,	%i1,	%l2
	edge32l	%i0,	%i6,	%o4
	edge8n	%g1,	%o0,	%l0
	movrlz	%o1,	0x36F,	%i4
	sra	%i5,	0x00,	%i2
	fmovrslez	%l1,	%f13,	%f9
	movvs	%xcc,	%o5,	%l5
	sethi	0x0E13,	%g5
	edge32l	%g6,	%i3,	%g7
	subc	%l6,	0x1DB9,	%l3
	array32	%g2,	%o2,	%o7
	array8	%o3,	%l4,	%g4
	fmovrsgz	%o6,	%f8,	%f1
	movle	%icc,	%i7,	%i1
	fmovdne	%xcc,	%f15,	%f13
	orncc	%l2,	%g3,	%i0
	fpsub32s	%f6,	%f15,	%f8
	subcc	%o4,	0x1CB0,	%i6
	orn	%o0,	0x1534,	%g1
	movpos	%icc,	%l0,	%o1
	addcc	%i4,	0x0FD7,	%i5
	addccc	%l1,	0x01B4,	%o5
	edge32	%l5,	%i2,	%g6
	andncc	%g5,	%g7,	%l6
	fmovrsgz	%i3,	%f8,	%f7
	lduh	[%l7 + 0x50],	%g2
	movrgez	%o2,	0x233,	%o7
	sllx	%l3,	0x05,	%l4
	array16	%o3,	%o6,	%g4
	movvs	%icc,	%i1,	%l2
	movvc	%xcc,	%i7,	%i0
	edge16	%g3,	%o4,	%i6
	mova	%icc,	%g1,	%l0
	movcc	%icc,	%o0,	%o1
	umulcc	%i4,	0x1D50,	%i5
	xor	%l1,	0x19F5,	%l5
	subc	%o5,	%i2,	%g5
	edge32ln	%g7,	%g6,	%l6
	smul	%i3,	%g2,	%o7
	edge8l	%l3,	%l4,	%o2
	movleu	%xcc,	%o6,	%o3
	subc	%i1,	%l2,	%g4
	sethi	0x1541,	%i0
	movl	%icc,	%g3,	%o4
	add	%i7,	%g1,	%l0
	edge16n	%o0,	%i6,	%o1
	sra	%i4,	%i5,	%l5
	edge32l	%o5,	%l1,	%i2
	mulx	%g5,	%g7,	%l6
	fnegs	%f15,	%f13
	fmovrsgez	%g6,	%f0,	%f15
	mulscc	%g2,	0x14BF,	%o7
	smul	%l3,	0x1ED5,	%i3
	srl	%o2,	0x0F,	%l4
	movrlz	%o3,	%i1,	%l2
	lduw	[%l7 + 0x1C],	%o6
	mulx	%g4,	%i0,	%g3
	fornot1s	%f13,	%f11,	%f5
	alignaddrl	%i7,	%o4,	%g1
	udivx	%o0,	0x171A,	%i6
	movrlz	%l0,	0x3AF,	%i4
	movrgz	%o1,	%l5,	%o5
	umulcc	%l1,	0x15D3,	%i2
	fmovrdne	%g5,	%f14,	%f12
	restore %g7, 0x0F62, %i5
	fmovsne	%icc,	%f14,	%f0
	fmovrdlez	%l6,	%f12,	%f2
	movge	%xcc,	%g6,	%g2
	xnorcc	%l3,	%i3,	%o2
	fmovsg	%icc,	%f5,	%f11
	sdivcc	%l4,	0x1309,	%o7
	movn	%xcc,	%o3,	%i1
	ldsh	[%l7 + 0x7C],	%o6
	umulcc	%g4,	0x1219,	%l2
	movg	%xcc,	%i0,	%i7
	subc	%g3,	%o4,	%o0
	movrgez	%i6,	%l0,	%g1
	movvc	%xcc,	%o1,	%l5
	sub	%i4,	0x06B0,	%l1
	movge	%xcc,	%i2,	%o5
	fmovscs	%xcc,	%f12,	%f14
	and	%g5,	%g7,	%i5
	movl	%xcc,	%g6,	%l6
	edge16l	%l3,	%g2,	%i3
	ldub	[%l7 + 0x49],	%o2
	ldsw	[%l7 + 0x78],	%l4
	fnegd	%f0,	%f4
	fmovrslez	%o3,	%f12,	%f0
	ld	[%l7 + 0x18],	%f3
	movn	%icc,	%o7,	%o6
	movrgez	%i1,	0x083,	%l2
	fcmpgt32	%f2,	%f12,	%g4
	sdivcc	%i7,	0x1C27,	%i0
	alignaddr	%g3,	%o4,	%o0
	addcc	%i6,	0x1F16,	%l0
	fpackfix	%f8,	%f8
	movgu	%xcc,	%g1,	%l5
	movg	%icc,	%i4,	%o1
	fcmpne16	%f14,	%f2,	%i2
	fsrc2s	%f13,	%f3
	addc	%o5,	0x0C6F,	%g5
	ld	[%l7 + 0x14],	%f5
	ldx	[%l7 + 0x30],	%g7
	fmuld8sux16	%f2,	%f8,	%f2
	movvc	%icc,	%i5,	%l1
	add	%g6,	0x01E2,	%l3
	orn	%g2,	%i3,	%l6
	orcc	%l4,	%o3,	%o2
	fmovsne	%xcc,	%f2,	%f13
	subccc	%o6,	0x0D21,	%i1
	andncc	%o7,	%l2,	%g4
	edge8	%i7,	%g3,	%i0
	andn	%o4,	0x13D4,	%i6
	ldd	[%l7 + 0x38],	%o0
	mova	%xcc,	%l0,	%g1
	movre	%l5,	0x306,	%i4
	ldsh	[%l7 + 0x32],	%i2
	addccc	%o1,	%g5,	%g7
	edge16l	%o5,	%i5,	%g6
	fpsub16s	%f4,	%f14,	%f2
	sdivcc	%l3,	0x08CE,	%l1
	movrgez	%i3,	%l6,	%g2
	xnor	%l4,	%o3,	%o2
	fmovdn	%xcc,	%f10,	%f14
	save %i1, 0x1195, %o7
	udiv	%l2,	0x08EA,	%g4
	fpsub32s	%f6,	%f6,	%f13
	ldsh	[%l7 + 0x74],	%o6
	save %i7, 0x0AC9, %g3
	movre	%i0,	0x0DC,	%i6
	fmovrsne	%o4,	%f5,	%f1
	ldd	[%l7 + 0x20],	%f6
	fnor	%f6,	%f10,	%f10
	fmovsgu	%icc,	%f2,	%f11
	orncc	%l0,	%g1,	%l5
	edge8ln	%o0,	%i2,	%o1
	fpack32	%f0,	%f2,	%f4
	fcmple32	%f2,	%f0,	%g5
	andncc	%i4,	%o5,	%i5
	edge16ln	%g7,	%l3,	%g6
	ldd	[%l7 + 0x20],	%l0
	array8	%i3,	%g2,	%l4
	edge8n	%l6,	%o3,	%o2
	edge16ln	%o7,	%i1,	%l2
	movge	%icc,	%g4,	%o6
	fcmpgt32	%f2,	%f2,	%g3
	and	%i7,	0x0D78,	%i6
	addccc	%o4,	0x16E8,	%l0
	ldsw	[%l7 + 0x60],	%i0
	fnands	%f2,	%f15,	%f9
	lduw	[%l7 + 0x6C],	%g1
	fpadd16	%f8,	%f12,	%f2
	fexpand	%f5,	%f4
	umulcc	%l5,	%i2,	%o0
	xnor	%g5,	%o1,	%o5
	restore %i4, %g7, %i5
	stw	%g6,	[%l7 + 0x3C]
	fpsub16s	%f10,	%f11,	%f7
	mulx	%l1,	0x0391,	%i3
	movn	%xcc,	%l3,	%g2
	ldub	[%l7 + 0x3A],	%l4
	stx	%l6,	[%l7 + 0x78]
	lduw	[%l7 + 0x1C],	%o3
	xnor	%o2,	%i1,	%l2
	edge16l	%g4,	%o6,	%o7
	stw	%g3,	[%l7 + 0x34]
	smulcc	%i7,	0x1A4E,	%o4
	movvs	%xcc,	%i6,	%l0
	udivcc	%g1,	0x0B89,	%l5
	mova	%xcc,	%i0,	%i2
	move	%icc,	%g5,	%o0
	alignaddrl	%o1,	%i4,	%g7
	or	%o5,	0x1315,	%g6
	fmovdvs	%xcc,	%f13,	%f10
	movge	%icc,	%l1,	%i5
	array8	%i3,	%l3,	%l4
	fmovsgu	%xcc,	%f5,	%f5
	movrgz	%l6,	%g2,	%o3
	or	%i1,	0x0333,	%l2
	subcc	%g4,	0x072E,	%o6
	movvs	%xcc,	%o2,	%g3
	st	%f4,	[%l7 + 0x60]
	orncc	%i7,	%o7,	%i6
	udivcc	%l0,	0x0030,	%g1
	movl	%icc,	%l5,	%i0
	udiv	%o4,	0x081C,	%g5
	fcmpeq32	%f0,	%f2,	%i2
	fone	%f12
	movrlez	%o0,	%o1,	%g7
	sra	%o5,	%i4,	%g6
	add	%l1,	0x0306,	%i3
	and	%i5,	0x1094,	%l3
	edge16l	%l4,	%l6,	%o3
	array8	%g2,	%l2,	%i1
	xnor	%o6,	%g4,	%o2
	stx	%g3,	[%l7 + 0x20]
	move	%icc,	%i7,	%o7
	fzero	%f10
	andncc	%l0,	%g1,	%l5
	restore %i6, 0x0D85, %i0
	subcc	%o4,	0x1EAF,	%g5
	restore %o0, %o1, %g7
	movvc	%xcc,	%o5,	%i2
	ldsw	[%l7 + 0x08],	%i4
	fmul8x16al	%f0,	%f2,	%f2
	lduw	[%l7 + 0x28],	%l1
	array8	%g6,	%i3,	%i5
	movleu	%icc,	%l3,	%l6
	edge8l	%o3,	%l4,	%l2
	fors	%f5,	%f9,	%f0
	movge	%icc,	%i1,	%o6
	edge8ln	%g4,	%o2,	%g3
	save %g2, %i7, %l0
	sub	%g1,	%o7,	%l5
	ldsb	[%l7 + 0x17],	%i0
	srlx	%i6,	%g5,	%o0
	fcmpne32	%f12,	%f10,	%o1
	fmovs	%f15,	%f15
	movcs	%xcc,	%o4,	%o5
	movle	%icc,	%g7,	%i4
	movrgz	%i2,	%g6,	%i3
	edge8ln	%l1,	%l3,	%i5
	movne	%icc,	%l6,	%o3
	mulscc	%l2,	%i1,	%o6
	ldsb	[%l7 + 0x15],	%g4
	ldsb	[%l7 + 0x7E],	%o2
	addccc	%l4,	0x1C13,	%g2
	fmovda	%xcc,	%f15,	%f8
	fmovsl	%icc,	%f5,	%f8
	fmovsl	%xcc,	%f13,	%f8
	edge16n	%g3,	%l0,	%g1
	movle	%xcc,	%i7,	%l5
	smulcc	%o7,	0x1DBD,	%i6
	edge16n	%g5,	%o0,	%o1
	edge16n	%i0,	%o5,	%o4
	subccc	%i4,	%g7,	%i2
	save %g6, 0x1DEF, %i3
	ldsb	[%l7 + 0x2A],	%l3
	edge16l	%i5,	%l6,	%o3
	srl	%l2,	%l1,	%o6
	edge8l	%g4,	%i1,	%l4
	srax	%g2,	%o2,	%l0
	sub	%g3,	%g1,	%l5
	xorcc	%i7,	0x07F7,	%i6
	fsrc1s	%f8,	%f1
	fnot1s	%f7,	%f9
	orcc	%o7,	0x10B1,	%o0
	sethi	0x03DE,	%g5
	fnot1s	%f8,	%f13
	movg	%icc,	%o1,	%i0
	fmovse	%icc,	%f12,	%f0
	fmovdn	%xcc,	%f2,	%f15
	move	%icc,	%o5,	%i4
	ldd	[%l7 + 0x78],	%g6
	fcmpes	%fcc3,	%f8,	%f11
	popc	0x02CA,	%o4
	srax	%i2,	0x05,	%i3
	movre	%l3,	0x0DB,	%g6
	save %l6, %i5, %l2
	sra	%l1,	%o6,	%g4
	array32	%o3,	%l4,	%g2
	sethi	0x1792,	%o2
	movn	%xcc,	%l0,	%g3
	fornot2	%f0,	%f10,	%f8
	umulcc	%g1,	%l5,	%i1
	addcc	%i7,	0x1241,	%i6
	smul	%o7,	0x0C2D,	%o0
	fcmpes	%fcc2,	%f13,	%f4
	fmovsneg	%icc,	%f9,	%f0
	fcmped	%fcc2,	%f0,	%f0
	sdivx	%g5,	0x1790,	%o1
	srl	%i0,	%o5,	%i4
	restore %g7, %o4, %i3
	add	%l3,	0x0A0B,	%g6
	ldsw	[%l7 + 0x48],	%i2
	and	%l6,	0x1983,	%i5
	fcmpes	%fcc1,	%f0,	%f8
	alignaddrl	%l2,	%o6,	%l1
	addcc	%o3,	%g4,	%g2
	alignaddrl	%l4,	%l0,	%g3
	pdist	%f2,	%f0,	%f10
	movrlez	%g1,	0x1BD,	%l5
	movgu	%xcc,	%o2,	%i7
	srl	%i1,	0x10,	%i6
	popc	%o7,	%o0
	mulx	%o1,	0x0B38,	%i0
	sub	%g5,	%i4,	%o5
	stw	%g7,	[%l7 + 0x10]
	subcc	%o4,	0x1C1E,	%i3
	std	%f14,	[%l7 + 0x10]
	lduh	[%l7 + 0x44],	%g6
	edge8	%l3,	%l6,	%i2
	movrne	%i5,	0x096,	%l2
	movgu	%xcc,	%o6,	%o3
	fnor	%f8,	%f10,	%f12
	ldd	[%l7 + 0x68],	%f6
	edge8ln	%g4,	%g2,	%l4
	movge	%icc,	%l1,	%l0
	udiv	%g3,	0x076F,	%l5
	movrgez	%g1,	0x14B,	%i7
	smul	%o2,	0x0E6C,	%i6
	fmovsgu	%xcc,	%f6,	%f1
	subc	%i1,	0x07E2,	%o7
	fornot2	%f4,	%f0,	%f0
	smul	%o0,	0x0261,	%o1
	ld	[%l7 + 0x08],	%f6
	sdiv	%g5,	0x1964,	%i0
	movle	%xcc,	%o5,	%i4
	xorcc	%o4,	%i3,	%g6
	movrlz	%l3,	%l6,	%g7
	fones	%f7
	ld	[%l7 + 0x30],	%f11
	srl	%i5,	%l2,	%o6
	array32	%o3,	%g4,	%i2
	movgu	%xcc,	%l4,	%l1
	edge32l	%g2,	%l0,	%l5
	movleu	%xcc,	%g1,	%i7
	xor	%g3,	0x1A4B,	%o2
	fnot1	%f2,	%f10
	fone	%f2
	fnors	%f9,	%f7,	%f10
	subcc	%i1,	%i6,	%o0
	fmuld8ulx16	%f5,	%f15,	%f4
	ld	[%l7 + 0x2C],	%f10
	sth	%o7,	[%l7 + 0x38]
	xnor	%o1,	%i0,	%g5
	ldsb	[%l7 + 0x6A],	%i4
	sllx	%o5,	%i3,	%g6
	movl	%icc,	%l3,	%l6
	movcc	%icc,	%o4,	%i5
	orncc	%g7,	%l2,	%o3
	edge16ln	%g4,	%i2,	%o6
	subccc	%l1,	%g2,	%l4
	sub	%l5,	%l0,	%g1
	movl	%icc,	%g3,	%i7
	edge16l	%o2,	%i6,	%o0
	movl	%xcc,	%i1,	%o7
	array32	%i0,	%g5,	%o1
	sub	%i4,	%i3,	%g6
	xnorcc	%l3,	0x0DF5,	%l6
	movge	%icc,	%o4,	%i5
	srlx	%g7,	%o5,	%l2
	std	%f4,	[%l7 + 0x20]
	sethi	0x0291,	%g4
	ldd	[%l7 + 0x40],	%f6
	fmovsa	%icc,	%f15,	%f6
	ldsb	[%l7 + 0x2C],	%i2
	ldx	[%l7 + 0x18],	%o6
	edge8ln	%o3,	%g2,	%l4
	subc	%l1,	%l0,	%l5
	umulcc	%g1,	0x1EBE,	%g3
	srlx	%o2,	0x14,	%i6
	sdiv	%i7,	0x1B04,	%o0
	std	%f6,	[%l7 + 0x20]
	std	%f4,	[%l7 + 0x28]
	edge8ln	%o7,	%i1,	%g5
	fcmpgt32	%f10,	%f14,	%o1
	edge16n	%i0,	%i3,	%g6
	fmovdcs	%icc,	%f9,	%f6
	ldsh	[%l7 + 0x28],	%l3
	subc	%l6,	%i4,	%o4
	movcs	%xcc,	%g7,	%o5
	xnor	%l2,	0x1D4C,	%g4
	popc	%i5,	%o6
	add	%o3,	%i2,	%g2
	move	%xcc,	%l4,	%l1
	edge8	%l5,	%l0,	%g1
	andncc	%o2,	%i6,	%g3
	orn	%i7,	%o7,	%o0
	edge32	%g5,	%o1,	%i0
	edge8n	%i1,	%i3,	%l3
	stw	%g6,	[%l7 + 0x14]
	xor	%l6,	0x15D3,	%o4
	fmovdvc	%xcc,	%f9,	%f9
	or	%g7,	%o5,	%i4
	movpos	%xcc,	%l2,	%i5
	fcmped	%fcc0,	%f12,	%f8
	std	%f0,	[%l7 + 0x20]
	udiv	%o6,	0x00AE,	%g4
	movrgz	%i2,	0x34B,	%g2
	srlx	%l4,	%o3,	%l5
	srax	%l0,	0x0F,	%g1
	fsrc1s	%f1,	%f1
	array32	%l1,	%i6,	%g3
	movrne	%i7,	0x06D,	%o7
	andn	%o2,	%o0,	%g5
	sub	%o1,	0x15C0,	%i0
	fcmpd	%fcc0,	%f0,	%f12
	movge	%xcc,	%i1,	%l3
	edge8	%i3,	%g6,	%l6
	edge8ln	%g7,	%o4,	%o5
	fmovrdlz	%i4,	%f2,	%f8
	addcc	%l2,	%o6,	%g4
	movneg	%icc,	%i5,	%i2
	fmovsl	%xcc,	%f0,	%f13
	restore %l4, %g2, %o3
	edge8ln	%l5,	%g1,	%l1
	mova	%xcc,	%i6,	%l0
	fcmped	%fcc2,	%f4,	%f12
	xnorcc	%i7,	%g3,	%o2
	fnot2s	%f8,	%f10
	array16	%o0,	%g5,	%o1
	umulcc	%i0,	%i1,	%l3
	udivcc	%i3,	0x170B,	%g6
	movpos	%icc,	%l6,	%o7
	fones	%f6
	alignaddrl	%o4,	%g7,	%i4
	mulscc	%o5,	0x138F,	%o6
	fpsub16	%f2,	%f8,	%f12
	ldd	[%l7 + 0x78],	%f12
	fmovrslez	%l2,	%f4,	%f1
	movl	%xcc,	%i5,	%i2
	fxnors	%f4,	%f8,	%f14
	sub	%g4,	%g2,	%o3
	movg	%xcc,	%l5,	%l4
	ldd	[%l7 + 0x60],	%f0
	fmovrdgz	%l1,	%f14,	%f0
	fmovscc	%icc,	%f2,	%f7
	fmul8ulx16	%f8,	%f14,	%f8
	edge16ln	%i6,	%l0,	%g1
	fmovscc	%xcc,	%f9,	%f13
	mulscc	%i7,	0x0E53,	%g3
	fxnor	%f12,	%f4,	%f14
	ldub	[%l7 + 0x53],	%o2
	edge8n	%o0,	%o1,	%g5
	subccc	%i0,	%i1,	%l3
	edge32l	%i3,	%g6,	%o7
	movrlez	%l6,	%o4,	%g7
	fmovrslz	%o5,	%f5,	%f12
	movrne	%o6,	%l2,	%i4
	and	%i5,	0x01B9,	%i2
	orn	%g4,	0x0B18,	%g2
	movrlz	%o3,	0x0C9,	%l4
	movvc	%xcc,	%l5,	%l1
	sdivx	%i6,	0x0FE6,	%l0
	fmovdvs	%icc,	%f12,	%f5
	fone	%f0
	fpsub32s	%f9,	%f15,	%f7
	std	%f6,	[%l7 + 0x60]
	andn	%g1,	0x067A,	%i7
	movre	%o2,	%o0,	%g3
	mulx	%g5,	0x19BD,	%i0
	edge8l	%o1,	%l3,	%i3
	fmovdleu	%icc,	%f6,	%f9
	sllx	%i1,	0x03,	%o7
	edge8n	%g6,	%o4,	%l6
	andncc	%o5,	%o6,	%g7
	movpos	%icc,	%i4,	%i5
	fsrc1s	%f8,	%f10
	subc	%i2,	0x155B,	%l2
	addccc	%g2,	0x1B94,	%g4
	ldsw	[%l7 + 0x30],	%o3
	andncc	%l4,	%l5,	%i6
	fone	%f10
	movvs	%icc,	%l0,	%l1
	edge32l	%i7,	%o2,	%g1
	movrgez	%g3,	%g5,	%i0
	orcc	%o0,	%l3,	%o1
	sth	%i1,	[%l7 + 0x14]
	ldd	[%l7 + 0x68],	%i2
	fmovrdlz	%o7,	%f4,	%f0
	movvc	%xcc,	%g6,	%o4
	fnot2	%f12,	%f12
	fnot2s	%f8,	%f12
	umulcc	%l6,	0x16AB,	%o6
	std	%f0,	[%l7 + 0x50]
	udivcc	%g7,	0x1516,	%o5
	movge	%icc,	%i5,	%i2
	fcmpgt16	%f2,	%f8,	%l2
	movge	%xcc,	%i4,	%g4
	fabss	%f8,	%f12
	add	%g2,	%o3,	%l4
	ldd	[%l7 + 0x68],	%i6
	srlx	%l0,	%l1,	%l5
	movrlez	%o2,	0x01F,	%g1
	mulx	%g3,	0x1780,	%i7
	fmovrslz	%g5,	%f2,	%f5
	sethi	0x0A56,	%i0
	fmovse	%xcc,	%f14,	%f14
	fmovdcc	%icc,	%f5,	%f8
	fandnot1s	%f0,	%f7,	%f5
	movrlez	%l3,	0x20B,	%o1
	udiv	%o0,	0x1319,	%i1
	fnot1s	%f11,	%f7
	array8	%o7,	%g6,	%i3
	alignaddr	%l6,	%o6,	%o4
	mulscc	%o5,	0x07FC,	%i5
	mova	%xcc,	%i2,	%l2
	movvs	%icc,	%g7,	%g4
	movne	%icc,	%g2,	%o3
	fmul8sux16	%f6,	%f8,	%f4
	movrgez	%l4,	0x0CF,	%i4
	array32	%l0,	%i6,	%l5
	save %o2, %l1, %g3
	movge	%xcc,	%i7,	%g5
	edge8n	%g1,	%i0,	%o1
	movpos	%icc,	%l3,	%o0
	edge32l	%i1,	%g6,	%o7
	ldsb	[%l7 + 0x37],	%l6
	edge16	%i3,	%o4,	%o5
	sll	%o6,	0x0C,	%i5
	subcc	%i2,	%l2,	%g7
	fpsub16s	%f3,	%f9,	%f7
	srax	%g4,	%g2,	%l4
	st	%f13,	[%l7 + 0x40]
	sub	%o3,	0x161E,	%l0
	addcc	%i4,	%l5,	%i6
	movrgz	%l1,	%o2,	%i7
	ldx	[%l7 + 0x10],	%g3
	fpsub32	%f0,	%f2,	%f0
	fmovscc	%icc,	%f5,	%f8
	srl	%g1,	%g5,	%o1
	fmovdgu	%xcc,	%f6,	%f11
	srax	%l3,	0x1E,	%o0
	alignaddr	%i1,	%g6,	%i0
	ldsw	[%l7 + 0x70],	%o7
	movrlz	%l6,	%i3,	%o5
	fmovdle	%icc,	%f3,	%f6
	fornot1	%f0,	%f0,	%f10
	edge16l	%o4,	%i5,	%i2
	movvs	%xcc,	%o6,	%g7
	move	%xcc,	%g4,	%g2
	mulscc	%l2,	0x0F4E,	%l4
	sll	%l0,	0x16,	%i4
	bshuffle	%f8,	%f6,	%f12
	array8	%l5,	%o3,	%i6
	xnor	%o2,	0x1BC8,	%i7
	fornot1s	%f15,	%f7,	%f9
	addccc	%g3,	0x1FA4,	%l1
	udiv	%g1,	0x1AEC,	%o1
	fpsub16s	%f12,	%f12,	%f14
	restore %l3, %g5, %i1
	movcc	%icc,	%o0,	%g6
	sdivcc	%i0,	0x0993,	%o7
	fmovd	%f10,	%f6
	srlx	%l6,	%i3,	%o5
	sll	%i5,	0x05,	%i2
	andncc	%o6,	%o4,	%g7
	movn	%icc,	%g4,	%l2
	fcmple16	%f4,	%f10,	%g2
	subcc	%l0,	%i4,	%l5
	fmovdg	%xcc,	%f11,	%f2
	fmovse	%xcc,	%f11,	%f10
	addccc	%l4,	0x1E39,	%i6
	srax	%o3,	%o2,	%i7
	subcc	%l1,	0x1F60,	%g1
	orn	%o1,	%g3,	%g5
	fmovsleu	%xcc,	%f4,	%f7
	addccc	%l3,	%o0,	%g6
	movn	%xcc,	%i1,	%o7
	move	%icc,	%i0,	%i3
	smulcc	%o5,	0x1995,	%l6
	fmul8sux16	%f8,	%f10,	%f10
	movge	%icc,	%i5,	%o6
	fpack32	%f6,	%f14,	%f2
	movrgez	%i2,	%g7,	%g4
	xor	%l2,	%o4,	%l0
	edge8	%i4,	%l5,	%l4
	edge32	%g2,	%o3,	%o2
	subccc	%i7,	%i6,	%g1
	umul	%l1,	%o1,	%g3
	orn	%g5,	0x0EE6,	%l3
	array8	%g6,	%o0,	%o7
	movn	%xcc,	%i0,	%i3
	subc	%o5,	0x0B77,	%l6
	fmovdl	%xcc,	%f13,	%f9
	lduh	[%l7 + 0x68],	%i5
	edge8l	%o6,	%i1,	%i2
	movcs	%icc,	%g7,	%g4
	xorcc	%o4,	0x14D3,	%l0
	movne	%icc,	%l2,	%i4
	sllx	%l5,	0x1A,	%l4
	smul	%g2,	0x09DE,	%o2
	andn	%o3,	%i7,	%i6
	srl	%l1,	0x02,	%o1
	smulcc	%g1,	0x1A63,	%g3
	edge16	%l3,	%g6,	%g5
	addc	%o7,	%i0,	%i3
	ld	[%l7 + 0x10],	%f0
	andncc	%o0,	%o5,	%l6
	sdiv	%o6,	0x0C94,	%i1
	fmovde	%xcc,	%f9,	%f2
	ldd	[%l7 + 0x30],	%f14
	movg	%icc,	%i2,	%i5
	fmovsn	%icc,	%f2,	%f7
	edge8ln	%g4,	%g7,	%o4
	ldsb	[%l7 + 0x2C],	%l2
	ld	[%l7 + 0x38],	%f1
	ldd	[%l7 + 0x50],	%f4
	fpsub32s	%f9,	%f3,	%f0
	std	%f0,	[%l7 + 0x30]
	fmovdvs	%icc,	%f0,	%f7
	edge8ln	%i4,	%l5,	%l0
	movcs	%icc,	%g2,	%o2
	orncc	%o3,	0x1892,	%i7
	movle	%icc,	%l4,	%l1
	fmovrdgez	%o1,	%f10,	%f12
	stb	%i6,	[%l7 + 0x50]
	fmovdn	%icc,	%f7,	%f9
	sub	%g1,	0x17B7,	%g3
	movleu	%xcc,	%l3,	%g5
	sethi	0x1BC6,	%o7
	fnot2s	%f0,	%f5
	sll	%i0,	%g6,	%o0
	edge16l	%o5,	%l6,	%i3
	stx	%o6,	[%l7 + 0x38]
	umul	%i1,	%i2,	%i5
	movl	%icc,	%g7,	%g4
	udiv	%l2,	0x0B33,	%i4
	ldsh	[%l7 + 0x46],	%o4
	stw	%l0,	[%l7 + 0x4C]
	mulx	%l5,	%g2,	%o3
	ldub	[%l7 + 0x21],	%o2
	movl	%icc,	%l4,	%i7
	udivx	%l1,	0x0A6F,	%i6
	ldd	[%l7 + 0x10],	%g0
	movleu	%icc,	%g3,	%l3
	movne	%icc,	%o1,	%g5
	fmovrsgez	%o7,	%f1,	%f14
	edge8n	%g6,	%i0,	%o5
	mulscc	%l6,	%o0,	%i3
	fpack16	%f0,	%f7
	popc	0x0E2C,	%i1
	fsrc2s	%f11,	%f3
	fcmpeq32	%f8,	%f14,	%o6
	fzero	%f2
	fandnot1	%f4,	%f14,	%f0
	srax	%i5,	%i2,	%g7
	popc	0x0D7E,	%g4
	ldx	[%l7 + 0x58],	%l2
	edge16	%i4,	%o4,	%l0
	stw	%l5,	[%l7 + 0x18]
	fnot2s	%f11,	%f8
	move	%xcc,	%o3,	%g2
	restore %l4, %i7, %o2
	restore %i6, %g1, %g3
	ldsh	[%l7 + 0x54],	%l3
	edge32ln	%l1,	%g5,	%o1
	movge	%icc,	%o7,	%i0
	fmovsvs	%icc,	%f12,	%f9
	xnorcc	%o5,	0x0E48,	%l6
	edge16l	%o0,	%g6,	%i3
	edge16n	%i1,	%i5,	%i2
	xnor	%o6,	%g7,	%l2
	movcc	%xcc,	%g4,	%o4
	movgu	%icc,	%i4,	%l0
	fornot1	%f4,	%f12,	%f8
	movrgz	%l5,	0x170,	%o3
	sll	%g2,	%l4,	%o2
	xnorcc	%i7,	%i6,	%g1
	sdivx	%g3,	0x18B4,	%l3
	fone	%f4
	edge16ln	%l1,	%o1,	%g5
	fmovrdgz	%o7,	%f14,	%f0
	ldx	[%l7 + 0x28],	%i0
	ldx	[%l7 + 0x68],	%o5
	siam	0x5
	edge8	%l6,	%g6,	%i3
	subc	%o0,	0x0299,	%i1
	fmovdneg	%icc,	%f6,	%f12
	mova	%icc,	%i5,	%i2
	save %g7, 0x18CF, %o6
	ldsb	[%l7 + 0x79],	%g4
	fmovs	%f12,	%f3
	ldub	[%l7 + 0x42],	%l2
	movrlez	%o4,	%i4,	%l5
	alignaddr	%o3,	%g2,	%l4
	edge32ln	%o2,	%i7,	%i6
	xnor	%g1,	0x125E,	%l0
	mova	%xcc,	%g3,	%l3
	movrgez	%o1,	%l1,	%g5
	move	%icc,	%o7,	%o5
	andncc	%l6,	%g6,	%i3
	fmovdleu	%xcc,	%f6,	%f10
	addccc	%o0,	%i0,	%i5
	srl	%i1,	0x13,	%i2
	alignaddr	%g7,	%g4,	%o6
	ldx	[%l7 + 0x30],	%o4
	fones	%f13
	movneg	%icc,	%i4,	%l2
	fmul8x16au	%f3,	%f10,	%f6
	sdivx	%l5,	0x0470,	%g2
	addcc	%o3,	0x0E94,	%l4
	alignaddr	%o2,	%i7,	%g1
	udiv	%l0,	0x10BB,	%i6
	fmovscs	%xcc,	%f3,	%f8
	sdivx	%l3,	0x0C57,	%o1
	alignaddr	%l1,	%g3,	%g5
	andn	%o5,	%o7,	%g6
	umulcc	%i3,	0x1B5A,	%l6
	ldd	[%l7 + 0x78],	%o0
	sdivx	%i5,	0x17BC,	%i1
	popc	0x13C3,	%i0
	std	%f14,	[%l7 + 0x48]
	array32	%i2,	%g4,	%o6
	edge16	%g7,	%o4,	%i4
	subcc	%l5,	0x1B00,	%g2
	xnor	%o3,	%l4,	%l2
	ldsb	[%l7 + 0x69],	%i7
	ld	[%l7 + 0x0C],	%f8
	fzeros	%f5
	ldsb	[%l7 + 0x11],	%g1
	movpos	%icc,	%o2,	%l0
	sth	%i6,	[%l7 + 0x7E]
	smulcc	%o1,	0x13E1,	%l3
	edge8l	%g3,	%g5,	%o5
	edge8	%l1,	%o7,	%i3
	edge32ln	%g6,	%o0,	%i5
	andncc	%i1,	%l6,	%i0
	movrlz	%i2,	%g4,	%g7
	edge8	%o6,	%i4,	%o4
	fmovrsgz	%l5,	%f5,	%f5
	fmovdge	%icc,	%f4,	%f12
	movneg	%xcc,	%o3,	%g2
	fmovrdlez	%l4,	%f8,	%f2
	movle	%xcc,	%l2,	%i7
	addcc	%o2,	0x1EEB,	%l0
	smul	%i6,	%g1,	%l3
	xorcc	%o1,	0x0019,	%g5
	sra	%o5,	0x14,	%l1
	lduh	[%l7 + 0x4E],	%g3
	andn	%i3,	0x0FCE,	%g6
	movcc	%xcc,	%o0,	%o7
	movvc	%icc,	%i1,	%i5
	andcc	%l6,	0x199F,	%i0
	edge16	%g4,	%i2,	%o6
	orncc	%g7,	%o4,	%i4
	fzeros	%f12
	srlx	%o3,	0x0B,	%l5
	and	%g2,	0x0E60,	%l2
	srl	%i7,	0x0E,	%o2
	fmul8x16au	%f2,	%f7,	%f6
	sllx	%l4,	0x12,	%i6
	movgu	%icc,	%l0,	%l3
	movne	%icc,	%o1,	%g5
	fmul8ulx16	%f0,	%f6,	%f8
	or	%g1,	%l1,	%o5
	edge32l	%g3,	%g6,	%o0
	andn	%i3,	0x0A06,	%o7
	fmovdle	%xcc,	%f8,	%f7
	ldsh	[%l7 + 0x46],	%i5
	ld	[%l7 + 0x3C],	%f15
	srl	%l6,	0x10,	%i1
	lduh	[%l7 + 0x34],	%g4
	movrlez	%i0,	%o6,	%g7
	alignaddrl	%i2,	%i4,	%o3
	fmovrdlez	%l5,	%f4,	%f8
	fcmpne16	%f10,	%f10,	%o4
	movvc	%icc,	%g2,	%l2
	orncc	%i7,	0x19B2,	%l4
	fmovdge	%xcc,	%f8,	%f9
	movre	%i6,	0x11A,	%o2
	movrne	%l0,	0x369,	%o1
	edge8n	%g5,	%l3,	%g1
	edge32ln	%o5,	%g3,	%g6
	movrgez	%o0,	%i3,	%l1
	ldsh	[%l7 + 0x0E],	%i5
	sra	%o7,	%l6,	%g4
	subccc	%i0,	%i1,	%o6
	umul	%g7,	%i2,	%o3
	save %i4, 0x0DA4, %l5
	fmovsvc	%icc,	%f11,	%f11
	movrlez	%o4,	%l2,	%g2
	andcc	%l4,	0x15BA,	%i6
	lduh	[%l7 + 0x40],	%o2
	array16	%l0,	%o1,	%g5
	pdist	%f8,	%f4,	%f10
	edge16ln	%i7,	%g1,	%o5
	fmul8sux16	%f12,	%f10,	%f14
	movcs	%xcc,	%g3,	%l3
	ldsb	[%l7 + 0x08],	%o0
	movg	%icc,	%g6,	%i3
	std	%f12,	[%l7 + 0x68]
	orcc	%i5,	%o7,	%l6
	sethi	0x180B,	%l1
	edge8l	%i0,	%g4,	%o6
	orncc	%g7,	0x00A8,	%i2
	subcc	%o3,	0x1998,	%i1
	movrlez	%l5,	%o4,	%i4
	movg	%icc,	%l2,	%g2
	andncc	%l4,	%i6,	%l0
	andncc	%o1,	%o2,	%g5
	lduw	[%l7 + 0x2C],	%g1
	fmovsge	%xcc,	%f15,	%f15
	ldub	[%l7 + 0x45],	%i7
	popc	%o5,	%g3
	ldsh	[%l7 + 0x76],	%l3
	fpadd32s	%f5,	%f6,	%f13
	stb	%o0,	[%l7 + 0x26]
	sdivx	%i3,	0x01AB,	%i5
	ldd	[%l7 + 0x60],	%f4
	edge16ln	%g6,	%o7,	%l6
	fsrc2s	%f1,	%f1
	or	%i0,	%l1,	%o6
	stx	%g7,	[%l7 + 0x48]
	smul	%g4,	%i2,	%o3
	lduw	[%l7 + 0x7C],	%i1
	movvc	%xcc,	%o4,	%i4
	ldsb	[%l7 + 0x2D],	%l5
	sethi	0x1E4D,	%l2
	movrlz	%l4,	%i6,	%g2
	movrlez	%o1,	%l0,	%g5
	movcs	%xcc,	%o2,	%g1
	smul	%i7,	%o5,	%g3
	sra	%l3,	0x00,	%o0
	movrgz	%i5,	%i3,	%g6
	ldx	[%l7 + 0x68],	%l6
	movn	%icc,	%i0,	%l1
	ldub	[%l7 + 0x40],	%o7
	edge16n	%o6,	%g7,	%i2
	addc	%o3,	0x16D8,	%i1
	stx	%g4,	[%l7 + 0x20]
	ldx	[%l7 + 0x10],	%i4
	subcc	%l5,	%o4,	%l4
	addccc	%i6,	0x0B0B,	%g2
	fcmps	%fcc2,	%f9,	%f10
	alignaddrl	%l2,	%o1,	%l0
	sth	%g5,	[%l7 + 0x34]
	fmovs	%f13,	%f12
	addcc	%o2,	0x05BF,	%i7
	stx	%g1,	[%l7 + 0x18]
	movne	%xcc,	%o5,	%l3
	fnot1s	%f8,	%f4
	edge8	%o0,	%g3,	%i5
	orncc	%i3,	0x1AFD,	%l6
	fmovsa	%icc,	%f15,	%f10
	movneg	%icc,	%i0,	%l1
	movcs	%xcc,	%o7,	%g6
	movrlz	%g7,	0x000,	%i2
	srl	%o3,	%i1,	%g4
	fand	%f10,	%f0,	%f12
	fnot2	%f14,	%f14
	ldsb	[%l7 + 0x11],	%i4
	xorcc	%o6,	0x141A,	%o4
	fmovdne	%xcc,	%f10,	%f8
	ldsh	[%l7 + 0x08],	%l5
	ldd	[%l7 + 0x28],	%l4
	popc	%g2,	%l2
	fmovsg	%xcc,	%f0,	%f0
	fmul8x16	%f3,	%f2,	%f6
	popc	%o1,	%l0
	or	%i6,	0x1BD0,	%g5
	array32	%i7,	%o2,	%o5
	umul	%g1,	%o0,	%l3
	edge16l	%g3,	%i5,	%l6
	movg	%xcc,	%i0,	%i3
	movvc	%xcc,	%o7,	%g6
	sethi	0x026F,	%l1
	edge8ln	%i2,	%o3,	%i1
	movrlz	%g7,	%g4,	%o6
	movvs	%xcc,	%o4,	%l5
	fmovdcc	%xcc,	%f8,	%f1
	lduw	[%l7 + 0x08],	%i4
	movrne	%g2,	0x0B5,	%l2
	siam	0x7
	fpsub32	%f6,	%f4,	%f10
	movcs	%xcc,	%l4,	%l0
	xorcc	%o1,	0x190A,	%g5
	sth	%i6,	[%l7 + 0x5A]
	fmul8x16au	%f12,	%f12,	%f12
	fmovd	%f4,	%f0
	smulcc	%i7,	0x0C98,	%o5
	fandnot2	%f0,	%f8,	%f8
	edge32l	%g1,	%o2,	%o0
	movrne	%g3,	%l3,	%l6
	ldx	[%l7 + 0x68],	%i5
	fcmped	%fcc1,	%f4,	%f14
	edge16ln	%i3,	%i0,	%g6
	movleu	%icc,	%l1,	%i2
	edge16ln	%o7,	%i1,	%o3
	fmovdneg	%icc,	%f4,	%f7
	edge32n	%g7,	%o6,	%o4
	movg	%icc,	%g4,	%l5
	movle	%xcc,	%g2,	%i4
	movcc	%xcc,	%l4,	%l2
	fmovrslz	%l0,	%f12,	%f3
	fandnot1	%f4,	%f6,	%f6
	andcc	%g5,	%o1,	%i6
	fmovdl	%xcc,	%f8,	%f15
	ldsh	[%l7 + 0x78],	%o5
	fpsub16	%f0,	%f0,	%f10
	edge16n	%g1,	%i7,	%o0
	edge8l	%o2,	%g3,	%l3
	movvc	%xcc,	%l6,	%i3
	andcc	%i5,	0x199E,	%g6
	ldsw	[%l7 + 0x48],	%i0
	fmovsn	%xcc,	%f6,	%f4
	move	%xcc,	%l1,	%o7
	array32	%i2,	%o3,	%g7
	movvs	%xcc,	%i1,	%o6
	andncc	%o4,	%l5,	%g2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type f   	: 2120
!	Type i   	: 6461
!	Type l   	: 1419
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x56D523D8
.word 0xB4CF158D
.word 0xF739BD6A
.word 0x2C2520F2
.word 0x7817135D
.word 0x9BDFFC35
.word 0xD9DE4121
.word 0x9D7FE0C3
.word 0x825437A2
.word 0x0167A525
.word 0x353B7E10
.word 0x167E7A7E
.word 0xDB640CA5
.word 0x59451038
.word 0xA44A0BBE
.word 0x054D4B43
.word 0x7C99C769
.word 0x5B3D541A
.word 0x19C057F2
.word 0x8DDFE98C
.word 0xBB686156
.word 0xEC5B8382
.word 0x81FBCBA9
.word 0x4376A8F5
.word 0x8BEB5ACE
.word 0xC06C8B8B
.word 0x6E635CFD
.word 0xABB8BCC4
.word 0x412497DE
.word 0x499E4A35
.word 0xE177F33C
.word 0xF8F076B1
.word 0xBA20DF7B
.word 0x3F9601AA
.word 0xBA77CFA4
.word 0xFB96B955
.word 0x55C11B73
.word 0xAFB9D3CF
.word 0x8266AA08
.word 0x0B90AA9F
.word 0xD6D30133
.word 0xD1C0C7CD
.word 0x430ABD96
.word 0xE11B3A5E
.word 0x1433A6FE
.word 0xBE836814
.word 0x203A169E
.word 0x3B6C5F1A
.word 0x423C69E5
.word 0x278BE6F9
.word 0x27302052
.word 0x298CAA80
.word 0x4910FC1B
.word 0x9C694500
.word 0xE99FE0BA
.word 0x9E15A8A6
.word 0xCB555C26
.word 0x2358B83A
.word 0x3E4B41C3
.word 0x24C97D12
.word 0xA8F7930E
.word 0x95FFD978
.word 0xDB01123F
.word 0x7CF67145
.end
