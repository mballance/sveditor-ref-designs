/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_saverestore_fc4.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ./spc_basic_isa3.pl FOCUS_SEED=414326434"
.ident "BY rg131678 ON Wed Aug  6 18:04:13 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_saverestore_fc4.s,v 1.3 2007/07/05 22:01:56 drp Exp $"
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
	set	0x7,	%g1
	set	0x3,	%g2
	set	0xB,	%g3
	set	0x2,	%g4
	set	0x5,	%g5
	set	0x8,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0xF,	%i1
	set	-0xF,	%i2
	set	-0x9,	%i3
	set	-0xF,	%i4
	set	-0x5,	%i5
	set	-0x7,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x08DDDCA4,	%l0
	set	0x7A5D8B09,	%l1
	set	0x75064764,	%l2
	set	0x311614B9,	%l3
	set	0x4B791849,	%l4
	set	0x7538FBB9,	%l5
	set	0x4FC04029,	%l6
	!# Output registers
	set	0x1E0F,	%o0
	set	-0x1459,	%o1
	set	0x1D0E,	%o2
	set	0x1E33,	%o3
	set	-0x17AF,	%o4
	set	-0x0B85,	%o5
	set	-0x0E15,	%o6
	set	-0x122A,	%o7

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

	or	%i7,	0x100E,	%g1
	fornot1	%f8,	%f12,	%f8
	andn	%g7,	0x08A3,	%o2
	fcmped	%fcc1,	%f6,	%f6
	edge32n	%g4,	%i0,	%i6
	sub	%l4,	0x1360,	%o3
	movvc	%icc,	%l5,	%l2
	movvs	%icc,	%g5,	%i2
	umulcc	%o5,	0x0CFF,	%o0
	subccc	%g6,	0x1BB8,	%o7
	movl	%icc,	%l3,	%i3
	fpadd32	%f0,	%f0,	%f2
	fcmpeq32	%f8,	%f10,	%o4
	fsrc1	%f0,	%f12
	ld	[%l7 + 0x54],	%f1
	ldsw	[%l7 + 0x34],	%i5
	movle	%icc,	%l1,	%i4
	xor	%o6,	0x122A,	%g2
	ldsh	[%l7 + 0x14],	%l6
	fmovdn	%icc,	%f4,	%f4
	movneg	%xcc,	%o1,	%i1
	fors	%f14,	%f14,	%f8
	fpadd32s	%f8,	%f15,	%f4
	umulcc	%l0,	%g3,	%i7
	andncc	%g1,	%o2,	%g7
	ldd	[%l7 + 0x18],	%g4
	save %i6, 0x109C, %i0
	lduh	[%l7 + 0x60],	%o3
	fmovsge	%xcc,	%f9,	%f14
	fcmpeq16	%f14,	%f0,	%l4
	restore %l5, %l2, %i2
	fmovdge	%icc,	%f5,	%f9
	for	%f6,	%f6,	%f4
	srlx	%g5,	0x19,	%o5
	movneg	%xcc,	%o0,	%o7
	movne	%icc,	%l3,	%g6
	movgu	%icc,	%o4,	%i5
	or	%i3,	%i4,	%l1
	ldsh	[%l7 + 0x26],	%o6
	lduw	[%l7 + 0x64],	%g2
	sllx	%o1,	0x07,	%l6
	fnot2	%f0,	%f8
	fcmps	%fcc3,	%f2,	%f8
	ldsh	[%l7 + 0x20],	%i1
	stx	%g3,	[%l7 + 0x18]
	mova	%xcc,	%l0,	%i7
	ldub	[%l7 + 0x7B],	%o2
	srlx	%g7,	%g4,	%g1
	movne	%xcc,	%i6,	%o3
	edge32n	%l4,	%i0,	%l2
	subccc	%i2,	%g5,	%l5
	array16	%o5,	%o0,	%o7
	edge16l	%g6,	%o4,	%l3
	udivx	%i3,	0x18AB,	%i4
	for	%f14,	%f4,	%f12
	stw	%l1,	[%l7 + 0x40]
	sllx	%o6,	%i5,	%g2
	xor	%o1,	0x0243,	%i1
	ldsb	[%l7 + 0x0B],	%l6
	edge8ln	%l0,	%g3,	%i7
	ld	[%l7 + 0x44],	%f12
	edge8	%g7,	%o2,	%g1
	edge16	%i6,	%o3,	%l4
	fpsub16	%f8,	%f0,	%f2
	std	%f4,	[%l7 + 0x08]
	std	%f4,	[%l7 + 0x18]
	xorcc	%i0,	0x19DB,	%g4
	pdist	%f4,	%f10,	%f8
	ldub	[%l7 + 0x66],	%i2
	umul	%l2,	0x1E0B,	%g5
	lduw	[%l7 + 0x0C],	%o5
	sllx	%o0,	%o7,	%l5
	movle	%xcc,	%o4,	%g6
	fandnot2s	%f12,	%f0,	%f10
	udivcc	%i3,	0x1A49,	%l3
	fmovd	%f10,	%f14
	edge16l	%l1,	%o6,	%i4
	umulcc	%g2,	%i5,	%o1
	andncc	%l6,	%i1,	%l0
	movrgez	%g3,	%i7,	%o2
	fmovdn	%icc,	%f12,	%f12
	fnor	%f10,	%f6,	%f12
	srax	%g7,	%i6,	%o3
	sra	%l4,	%i0,	%g4
	faligndata	%f4,	%f12,	%f4
	movvc	%xcc,	%i2,	%g1
	fpackfix	%f4,	%f11
	and	%l2,	%g5,	%o5
	addccc	%o0,	0x042A,	%o7
	edge32l	%l5,	%o4,	%g6
	xnorcc	%l3,	%i3,	%o6
	fnand	%f10,	%f14,	%f2
	edge8ln	%l1,	%i4,	%g2
	fcmpeq16	%f10,	%f14,	%i5
	fmovsvs	%icc,	%f15,	%f12
	sth	%o1,	[%l7 + 0x32]
	edge16ln	%l6,	%l0,	%i1
	ldd	[%l7 + 0x10],	%f4
	umul	%i7,	%o2,	%g7
	fnand	%f12,	%f2,	%f0
	fmovrse	%i6,	%f6,	%f2
	sethi	0x05FB,	%g3
	xnor	%o3,	%i0,	%l4
	fpadd32	%f8,	%f4,	%f8
	fmovsge	%icc,	%f12,	%f15
	sub	%i2,	%g4,	%g1
	lduh	[%l7 + 0x4A],	%g5
	edge32l	%l2,	%o5,	%o7
	fzero	%f10
	sdiv	%o0,	0x135B,	%o4
	movrlz	%g6,	0x1BE,	%l3
	sdivcc	%l5,	0x0AF5,	%i3
	fmovsn	%icc,	%f9,	%f12
	movl	%icc,	%l1,	%i4
	movge	%icc,	%g2,	%i5
	ldx	[%l7 + 0x40],	%o6
	andncc	%o1,	%l6,	%i1
	stb	%i7,	[%l7 + 0x3F]
	lduh	[%l7 + 0x48],	%l0
	sdiv	%g7,	0x17E7,	%o2
	xor	%g3,	%o3,	%i6
	edge32n	%i0,	%i2,	%g4
	movgu	%xcc,	%g1,	%g5
	fmovdcc	%xcc,	%f3,	%f3
	or	%l4,	%o5,	%o7
	movleu	%icc,	%l2,	%o0
	edge8	%g6,	%l3,	%o4
	sethi	0x04A3,	%i3
	subcc	%l1,	%i4,	%l5
	edge32n	%i5,	%o6,	%g2
	edge16ln	%o1,	%i1,	%i7
	edge16	%l6,	%g7,	%l0
	addcc	%o2,	%o3,	%i6
	fmovsleu	%xcc,	%f9,	%f7
	xnorcc	%g3,	0x18FC,	%i2
	stw	%g4,	[%l7 + 0x64]
	sll	%g1,	0x00,	%g5
	std	%f8,	[%l7 + 0x70]
	andcc	%i0,	%l4,	%o7
	mulscc	%o5,	%o0,	%l2
	save %g6, 0x0852, %o4
	array8	%i3,	%l1,	%l3
	subcc	%i4,	0x092C,	%l5
	edge16n	%o6,	%g2,	%i5
	movcc	%icc,	%i1,	%i7
	ldsw	[%l7 + 0x40],	%o1
	movn	%xcc,	%l6,	%g7
	stx	%l0,	[%l7 + 0x20]
	addccc	%o3,	%i6,	%g3
	fpsub32s	%f9,	%f8,	%f1
	xnor	%o2,	%g4,	%i2
	restore %g5, 0x16E2, %i0
	movcc	%xcc,	%g1,	%l4
	movl	%icc,	%o7,	%o5
	addccc	%l2,	0x124E,	%o0
	fmovrdlz	%o4,	%f0,	%f2
	xorcc	%i3,	%g6,	%l3
	st	%f8,	[%l7 + 0x18]
	edge32l	%l1,	%i4,	%l5
	fmul8x16au	%f15,	%f3,	%f8
	movcc	%icc,	%o6,	%i5
	udiv	%g2,	0x1BB1,	%i7
	edge16n	%o1,	%l6,	%g7
	xnorcc	%i1,	0x1100,	%l0
	fpmerge	%f14,	%f8,	%f12
	mulscc	%i6,	0x0FD5,	%o3
	udivcc	%o2,	0x09E2,	%g3
	fmovdneg	%icc,	%f9,	%f14
	sethi	0x0766,	%i2
	movpos	%xcc,	%g4,	%i0
	fors	%f1,	%f1,	%f0
	edge32n	%g5,	%g1,	%o7
	save %l4, 0x1BF9, %o5
	edge16l	%l2,	%o4,	%i3
	mulscc	%g6,	0x0676,	%l3
	fmovd	%f14,	%f10
	and	%o0,	%i4,	%l1
	alignaddrl	%l5,	%i5,	%o6
	array16	%g2,	%i7,	%l6
	xnor	%g7,	%i1,	%o1
	smulcc	%i6,	0x09E4,	%o3
	fexpand	%f9,	%f10
	fnot2s	%f3,	%f2
	sdivx	%o2,	0x0514,	%l0
	orn	%i2,	0x137D,	%g3
	udivcc	%g4,	0x0BD2,	%i0
	srax	%g5,	%o7,	%g1
	fmovrsgz	%o5,	%f0,	%f7
	fcmpne16	%f6,	%f12,	%l2
	alignaddr	%l4,	%o4,	%g6
	edge16ln	%l3,	%i3,	%o0
	sth	%i4,	[%l7 + 0x26]
	lduw	[%l7 + 0x38],	%l1
	srlx	%i5,	0x05,	%l5
	fsrc1	%f10,	%f0
	orcc	%o6,	0x07D1,	%g2
	fsrc1s	%f8,	%f10
	sub	%i7,	0x1EC1,	%l6
	fmovdle	%icc,	%f0,	%f10
	movrgez	%g7,	%i1,	%i6
	and	%o1,	0x1A97,	%o2
	sdiv	%o3,	0x107E,	%l0
	edge16n	%g3,	%g4,	%i2
	movrgez	%g5,	%o7,	%g1
	andn	%o5,	0x1BCC,	%i0
	smulcc	%l2,	0x0B1C,	%o4
	std	%f12,	[%l7 + 0x78]
	movgu	%xcc,	%g6,	%l4
	subccc	%i3,	%l3,	%i4
	movge	%xcc,	%o0,	%l1
	movvc	%icc,	%l5,	%i5
	fnot1s	%f10,	%f1
	mulscc	%g2,	%o6,	%i7
	movrlez	%l6,	0x02E,	%i1
	fmovdpos	%xcc,	%f7,	%f8
	movre	%g7,	0x295,	%i6
	array32	%o2,	%o3,	%l0
	orcc	%o1,	%g4,	%i2
	restore %g5, 0x0C06, %o7
	fnot1s	%f6,	%f15
	movcs	%xcc,	%g3,	%o5
	edge32l	%g1,	%i0,	%o4
	fornot2	%f8,	%f8,	%f2
	movvs	%xcc,	%g6,	%l4
	fmovdcs	%icc,	%f6,	%f2
	fmuld8ulx16	%f11,	%f0,	%f14
	fmovsa	%xcc,	%f10,	%f5
	edge32ln	%i3,	%l3,	%l2
	sdiv	%i4,	0x011E,	%o0
	and	%l1,	0x0FF1,	%i5
	fnor	%f4,	%f8,	%f8
	lduw	[%l7 + 0x1C],	%l5
	andncc	%o6,	%i7,	%g2
	xnorcc	%l6,	%i1,	%i6
	smulcc	%g7,	0x074C,	%o3
	stb	%o2,	[%l7 + 0x32]
	edge16ln	%o1,	%l0,	%i2
	umulcc	%g4,	%o7,	%g3
	fmovscc	%xcc,	%f13,	%f15
	ldd	[%l7 + 0x30],	%o4
	movrgez	%g5,	0x386,	%i0
	andncc	%o4,	%g6,	%g1
	sethi	0x0324,	%i3
	sdivcc	%l4,	0x1B74,	%l3
	movvs	%xcc,	%i4,	%o0
	stx	%l2,	[%l7 + 0x50]
	movrlz	%i5,	0x29D,	%l1
	udiv	%o6,	0x10B9,	%l5
	std	%f4,	[%l7 + 0x40]
	movcc	%xcc,	%i7,	%g2
	siam	0x0
	andcc	%i1,	%i6,	%l6
	alignaddr	%g7,	%o3,	%o2
	ld	[%l7 + 0x4C],	%f1
	and	%l0,	%i2,	%g4
	ldd	[%l7 + 0x68],	%f12
	movrlez	%o1,	%o7,	%o5
	srax	%g3,	0x12,	%g5
	edge16ln	%o4,	%g6,	%g1
	fpmerge	%f3,	%f8,	%f14
	ldd	[%l7 + 0x70],	%i2
	ldx	[%l7 + 0x18],	%i0
	movrne	%l3,	%l4,	%o0
	umul	%i4,	%i5,	%l2
	sethi	0x1905,	%l1
	movleu	%xcc,	%o6,	%i7
	fpadd32	%f2,	%f6,	%f10
	fmovsge	%icc,	%f10,	%f8
	addcc	%g2,	%l5,	%i6
	mulx	%i1,	%g7,	%l6
	movpos	%icc,	%o2,	%l0
	fexpand	%f4,	%f8
	and	%o3,	%i2,	%g4
	srl	%o1,	0x19,	%o5
	sdivcc	%g3,	0x0BA9,	%g5
	movle	%icc,	%o4,	%g6
	array16	%o7,	%g1,	%i3
	fnot1	%f12,	%f14
	sth	%l3,	[%l7 + 0x66]
	sdivcc	%i0,	0x1F83,	%o0
	fmovsl	%icc,	%f9,	%f4
	array32	%l4,	%i4,	%i5
	subcc	%l1,	%o6,	%i7
	udivx	%l2,	0x0EB5,	%g2
	fmovsg	%xcc,	%f4,	%f12
	sth	%i6,	[%l7 + 0x3A]
	fmovdg	%icc,	%f15,	%f11
	ld	[%l7 + 0x7C],	%f7
	fandnot1	%f10,	%f10,	%f6
	fnors	%f5,	%f7,	%f15
	movleu	%xcc,	%l5,	%i1
	sdivx	%l6,	0x1C09,	%g7
	andncc	%l0,	%o2,	%i2
	movrgz	%g4,	%o1,	%o5
	srlx	%g3,	%o3,	%g5
	subc	%g6,	0x1F7E,	%o4
	alignaddrl	%o7,	%g1,	%i3
	edge16n	%l3,	%o0,	%i0
	sethi	0x1483,	%l4
	umulcc	%i5,	0x1AE1,	%l1
	sdiv	%i4,	0x1CBC,	%i7
	ldsh	[%l7 + 0x2E],	%l2
	and	%g2,	%o6,	%l5
	and	%i1,	0x01CB,	%i6
	fmovda	%xcc,	%f5,	%f0
	mulscc	%g7,	%l0,	%l6
	addccc	%i2,	0x0EC6,	%g4
	fcmpeq16	%f8,	%f6,	%o1
	movge	%icc,	%o2,	%g3
	fpadd32	%f12,	%f12,	%f4
	alignaddrl	%o5,	%o3,	%g5
	fnot2	%f6,	%f10
	fcmple16	%f12,	%f12,	%g6
	xnorcc	%o7,	%g1,	%i3
	add	%o4,	0x00DF,	%o0
	save %i0, 0x1CB3, %l4
	mulscc	%i5,	%l1,	%l3
	edge32	%i7,	%l2,	%g2
	edge16ln	%o6,	%l5,	%i4
	srlx	%i6,	%g7,	%i1
	ldd	[%l7 + 0x48],	%l0
	fcmpne16	%f0,	%f4,	%l6
	movgu	%xcc,	%i2,	%g4
	lduw	[%l7 + 0x18],	%o1
	orcc	%g3,	%o2,	%o3
	umul	%g5,	%g6,	%o5
	subccc	%o7,	%g1,	%i3
	ldd	[%l7 + 0x10],	%o0
	and	%o4,	0x18D3,	%l4
	stx	%i0,	[%l7 + 0x20]
	lduw	[%l7 + 0x40],	%i5
	xor	%l3,	0x03DB,	%l1
	fone	%f4
	subcc	%i7,	0x0633,	%g2
	faligndata	%f8,	%f14,	%f14
	movrgez	%l2,	%l5,	%o6
	stw	%i4,	[%l7 + 0x24]
	fornot2	%f4,	%f10,	%f6
	sub	%i6,	%g7,	%l0
	siam	0x7
	srax	%l6,	0x1C,	%i1
	std	%f14,	[%l7 + 0x10]
	stb	%i2,	[%l7 + 0x70]
	ldsh	[%l7 + 0x56],	%g4
	fmul8x16	%f0,	%f12,	%f8
	fmovdvc	%icc,	%f7,	%f13
	array16	%g3,	%o2,	%o1
	fmovdpos	%icc,	%f10,	%f1
	edge8l	%g5,	%o3,	%o5
	sth	%o7,	[%l7 + 0x5E]
	lduw	[%l7 + 0x6C],	%g1
	orn	%g6,	%i3,	%o4
	movrlez	%l4,	0x278,	%i0
	movrgez	%i5,	0x36F,	%o0
	ldsh	[%l7 + 0x4A],	%l1
	sth	%i7,	[%l7 + 0x52]
	fones	%f10
	orcc	%g2,	%l3,	%l5
	stb	%o6,	[%l7 + 0x5C]
	fmovsa	%icc,	%f2,	%f3
	fpsub16s	%f11,	%f3,	%f1
	fzeros	%f10
	movrlz	%i4,	0x197,	%i6
	sethi	0x19E7,	%g7
	edge8	%l2,	%l0,	%i1
	faligndata	%f6,	%f0,	%f8
	ldd	[%l7 + 0x10],	%f0
	alignaddr	%l6,	%g4,	%g3
	orn	%o2,	%i2,	%g5
	udivx	%o3,	0x1DC3,	%o1
	xnor	%o7,	0x0436,	%g1
	movle	%xcc,	%g6,	%i3
	smulcc	%o4,	%o5,	%l4
	alignaddrl	%i5,	%i0,	%l1
	ldx	[%l7 + 0x20],	%i7
	andncc	%g2,	%o0,	%l3
	addcc	%o6,	%l5,	%i4
	fmovdcc	%icc,	%f9,	%f7
	fmul8sux16	%f12,	%f12,	%f0
	addcc	%i6,	%l2,	%l0
	bshuffle	%f2,	%f14,	%f0
	movcc	%xcc,	%g7,	%i1
	srax	%g4,	0x16,	%l6
	sdivx	%g3,	0x1350,	%o2
	edge32l	%g5,	%i2,	%o1
	udivx	%o7,	0x0C71,	%g1
	fornot2s	%f10,	%f6,	%f13
	edge16	%o3,	%g6,	%o4
	mulx	%i3,	0x0F8F,	%l4
	std	%f4,	[%l7 + 0x78]
	movcs	%xcc,	%i5,	%o5
	sra	%l1,	%i0,	%g2
	move	%icc,	%o0,	%i7
	ldub	[%l7 + 0x33],	%l3
	orncc	%l5,	0x0DC2,	%i4
	add	%o6,	%i6,	%l2
	fexpand	%f13,	%f8
	xor	%g7,	0x0954,	%l0
	ldsh	[%l7 + 0x52],	%g4
	stx	%l6,	[%l7 + 0x40]
	subc	%i1,	%g3,	%o2
	movrlez	%i2,	0x2AA,	%o1
	movpos	%xcc,	%o7,	%g5
	stx	%g1,	[%l7 + 0x48]
	fmovdvc	%xcc,	%f14,	%f2
	fmovrdgez	%o3,	%f14,	%f4
	sdiv	%o4,	0x0A73,	%i3
	fmovrdlez	%l4,	%f0,	%f14
	edge32l	%i5,	%o5,	%g6
	std	%f14,	[%l7 + 0x30]
	fmovrse	%i0,	%f10,	%f9
	sethi	0x0446,	%g2
	fnot2s	%f5,	%f15
	addcc	%l1,	0x1A74,	%i7
	movge	%xcc,	%l3,	%o0
	ldd	[%l7 + 0x28],	%f6
	fpsub16s	%f2,	%f11,	%f3
	srl	%i4,	%o6,	%l5
	fmovrdgez	%l2,	%f6,	%f12
	smulcc	%i6,	%l0,	%g4
	fmovrdne	%g7,	%f2,	%f4
	fmovsgu	%xcc,	%f2,	%f15
	addccc	%l6,	%i1,	%g3
	movle	%icc,	%i2,	%o2
	fmul8ulx16	%f0,	%f10,	%f2
	std	%f10,	[%l7 + 0x58]
	fzeros	%f4
	stx	%o7,	[%l7 + 0x30]
	add	%g5,	0x1DA4,	%o1
	sllx	%o3,	0x05,	%g1
	smul	%o4,	%l4,	%i3
	smulcc	%o5,	%g6,	%i5
	mova	%xcc,	%g2,	%l1
	movgu	%xcc,	%i7,	%l3
	movle	%xcc,	%o0,	%i0
	ldub	[%l7 + 0x7F],	%o6
	fmovd	%f14,	%f4
	movre	%l5,	0x250,	%i4
	edge16	%i6,	%l0,	%l2
	fmovd	%f0,	%f10
	umul	%g7,	%l6,	%i1
	movrgez	%g3,	%g4,	%o2
	movneg	%xcc,	%i2,	%g5
	sub	%o1,	0x0B67,	%o3
	andn	%g1,	%o7,	%o4
	movle	%xcc,	%l4,	%i3
	andncc	%g6,	%i5,	%g2
	smul	%o5,	%i7,	%l1
	fand	%f6,	%f8,	%f8
	edge16	%o0,	%i0,	%l3
	movne	%xcc,	%l5,	%o6
	move	%xcc,	%i4,	%l0
	subc	%i6,	%l2,	%l6
	fzeros	%f4
	fzeros	%f9
	sth	%g7,	[%l7 + 0x40]
	xor	%g3,	%i1,	%g4
	fmuld8sux16	%f2,	%f12,	%f14
	ldd	[%l7 + 0x28],	%o2
	sdiv	%g5,	0x1A6D,	%i2
	umulcc	%o1,	%g1,	%o7
	stx	%o3,	[%l7 + 0x78]
	movn	%xcc,	%o4,	%l4
	movgu	%xcc,	%g6,	%i5
	sdiv	%g2,	0x1B3F,	%o5
	or	%i7,	%i3,	%l1
	movrgz	%o0,	0x19A,	%l3
	fmovrde	%l5,	%f10,	%f0
	fsrc1s	%f7,	%f3
	srlx	%i0,	0x1D,	%o6
	edge16	%i4,	%i6,	%l0
	fexpand	%f8,	%f2
	ldub	[%l7 + 0x6E],	%l2
	fxnor	%f6,	%f10,	%f14
	fandnot1	%f6,	%f12,	%f14
	ldub	[%l7 + 0x3D],	%l6
	fcmpes	%fcc1,	%f11,	%f10
	movrne	%g7,	0x25B,	%i1
	st	%f2,	[%l7 + 0x40]
	movl	%xcc,	%g4,	%g3
	restore %o2, %i2, %g5
	fmovdge	%xcc,	%f5,	%f10
	mulx	%o1,	0x16FC,	%o7
	addccc	%o3,	%g1,	%l4
	sdivx	%o4,	0x1B25,	%i5
	sllx	%g2,	%g6,	%i7
	udivcc	%i3,	0x0F29,	%o5
	fmovsg	%icc,	%f13,	%f11
	edge32	%l1,	%o0,	%l5
	fmul8x16	%f5,	%f4,	%f12
	fmovrsgez	%i0,	%f8,	%f12
	ldsb	[%l7 + 0x31],	%l3
	fcmpgt16	%f4,	%f0,	%o6
	stw	%i6,	[%l7 + 0x08]
	xnorcc	%l0,	0x1E3F,	%l2
	movrne	%l6,	0x2B2,	%i4
	array16	%g7,	%i1,	%g4
	movrlez	%o2,	%g3,	%g5
	addc	%i2,	%o7,	%o1
	edge32n	%g1,	%l4,	%o3
	edge32l	%i5,	%g2,	%o4
	xnorcc	%g6,	%i3,	%i7
	edge16n	%o5,	%l1,	%o0
	fpmerge	%f6,	%f8,	%f0
	sdiv	%l5,	0x1228,	%l3
	movrlz	%o6,	0x07A,	%i6
	movcs	%icc,	%l0,	%i0
	movl	%xcc,	%l2,	%l6
	sth	%g7,	[%l7 + 0x30]
	andcc	%i4,	%i1,	%g4
	array32	%g3,	%g5,	%o2
	umul	%i2,	%o7,	%g1
	edge32	%l4,	%o1,	%i5
	movle	%xcc,	%o3,	%o4
	edge32l	%g6,	%i3,	%g2
	addccc	%i7,	0x1BBA,	%l1
	add	%o0,	%o5,	%l5
	ldsb	[%l7 + 0x5B],	%l3
	sdivcc	%i6,	0x08A8,	%l0
	fmovsa	%icc,	%f14,	%f3
	fxor	%f0,	%f14,	%f0
	sra	%o6,	%i0,	%l2
	fnot1s	%f13,	%f8
	fmovrslez	%g7,	%f5,	%f2
	edge32ln	%i4,	%i1,	%g4
	save %l6, 0x0339, %g3
	and	%o2,	0x1345,	%i2
	edge16ln	%g5,	%g1,	%o7
	andncc	%l4,	%i5,	%o3
	xnorcc	%o4,	0x1D05,	%g6
	movcc	%icc,	%o1,	%g2
	udiv	%i7,	0x07DD,	%l1
	fsrc2s	%f12,	%f14
	movcc	%xcc,	%i3,	%o5
	fone	%f10
	movre	%l5,	0x3C5,	%l3
	stw	%o0,	[%l7 + 0x44]
	ldd	[%l7 + 0x30],	%i6
	fmovdvc	%xcc,	%f8,	%f10
	srl	%l0,	0x11,	%o6
	movrgez	%i0,	0x18C,	%g7
	siam	0x3
	edge8n	%i4,	%i1,	%g4
	lduh	[%l7 + 0x2C],	%l2
	sdiv	%l6,	0x160F,	%g3
	addc	%o2,	%i2,	%g1
	popc	%g5,	%o7
	edge8n	%i5,	%o3,	%o4
	movge	%xcc,	%l4,	%g6
	move	%icc,	%g2,	%o1
	andcc	%l1,	%i7,	%o5
	fmovrsne	%l5,	%f8,	%f4
	movrne	%i3,	0x35D,	%o0
	ldsb	[%l7 + 0x3F],	%l3
	edge32l	%l0,	%o6,	%i6
	movneg	%icc,	%i0,	%i4
	movcs	%xcc,	%g7,	%g4
	move	%icc,	%l2,	%l6
	sll	%i1,	0x0A,	%o2
	movrgz	%g3,	0x1D8,	%g1
	udivx	%g5,	0x0A24,	%o7
	fpmerge	%f1,	%f8,	%f0
	fsrc2s	%f13,	%f4
	srl	%i2,	0x1E,	%i5
	fxor	%f10,	%f4,	%f2
	lduw	[%l7 + 0x68],	%o3
	ld	[%l7 + 0x18],	%f9
	fcmpne16	%f0,	%f4,	%l4
	srax	%o4,	0x05,	%g2
	lduw	[%l7 + 0x18],	%o1
	andncc	%l1,	%g6,	%i7
	fmovdl	%icc,	%f10,	%f7
	mulx	%o5,	%i3,	%l5
	andn	%l3,	%l0,	%o0
	stw	%o6,	[%l7 + 0x6C]
	fmovse	%xcc,	%f6,	%f13
	fandnot2s	%f7,	%f7,	%f15
	lduw	[%l7 + 0x74],	%i0
	xor	%i4,	0x12A8,	%g7
	fcmple16	%f8,	%f8,	%g4
	srax	%l2,	0x0B,	%i6
	fcmps	%fcc2,	%f3,	%f13
	edge16l	%i1,	%o2,	%g3
	edge32	%l6,	%g5,	%g1
	ldsw	[%l7 + 0x30],	%i2
	movre	%o7,	0x0F7,	%i5
	addccc	%o3,	0x146D,	%l4
	andcc	%g2,	%o1,	%l1
	move	%xcc,	%o4,	%i7
	edge16n	%g6,	%o5,	%i3
	fcmple32	%f10,	%f0,	%l5
	movneg	%xcc,	%l3,	%l0
	array16	%o0,	%o6,	%i4
	ldd	[%l7 + 0x30],	%f8
	ldd	[%l7 + 0x60],	%f10
	lduw	[%l7 + 0x10],	%g7
	edge16ln	%i0,	%g4,	%l2
	sllx	%i1,	%o2,	%g3
	fmovrde	%i6,	%f0,	%f0
	movre	%l6,	0x20B,	%g1
	fmovdgu	%icc,	%f6,	%f8
	edge16l	%g5,	%o7,	%i5
	addccc	%i2,	%o3,	%l4
	fmovsne	%xcc,	%f10,	%f0
	xnorcc	%o1,	%l1,	%o4
	fmovdn	%icc,	%f1,	%f10
	umul	%i7,	0x0FB8,	%g6
	mova	%xcc,	%o5,	%i3
	fmovdleu	%xcc,	%f6,	%f7
	ldx	[%l7 + 0x50],	%g2
	lduh	[%l7 + 0x14],	%l3
	xnorcc	%l5,	0x0799,	%o0
	fmovdl	%icc,	%f2,	%f3
	movpos	%xcc,	%l0,	%i4
	fmovdcs	%xcc,	%f11,	%f1
	stx	%g7,	[%l7 + 0x40]
	xnorcc	%o6,	%g4,	%i0
	subccc	%i1,	0x0CA8,	%l2
	fand	%f6,	%f0,	%f4
	movpos	%icc,	%o2,	%g3
	srax	%i6,	0x1B,	%g1
	fmovsa	%icc,	%f4,	%f14
	fmovsge	%xcc,	%f2,	%f7
	siam	0x2
	movcs	%icc,	%g5,	%o7
	movneg	%icc,	%l6,	%i5
	fmovdle	%xcc,	%f12,	%f3
	ld	[%l7 + 0x34],	%f6
	fmuld8sux16	%f13,	%f1,	%f10
	movne	%xcc,	%o3,	%l4
	movvs	%icc,	%o1,	%i2
	array16	%l1,	%i7,	%g6
	movneg	%icc,	%o4,	%i3
	fmovscc	%icc,	%f11,	%f2
	movrgez	%g2,	0x267,	%o5
	array8	%l5,	%l3,	%l0
	sll	%o0,	%i4,	%g7
	edge16l	%o6,	%i0,	%g4
	sth	%l2,	[%l7 + 0x2C]
	movcc	%icc,	%i1,	%o2
	movpos	%xcc,	%i6,	%g3
	orncc	%g5,	%g1,	%o7
	save %i5, 0x18FF, %o3
	edge32l	%l4,	%o1,	%l6
	std	%f14,	[%l7 + 0x20]
	std	%f2,	[%l7 + 0x50]
	movle	%xcc,	%i2,	%i7
	edge16n	%g6,	%l1,	%i3
	movrlz	%o4,	0x1F3,	%o5
	udiv	%l5,	0x12EF,	%g2
	movrlez	%l3,	%o0,	%l0
	movn	%icc,	%i4,	%o6
	fmovdpos	%xcc,	%f7,	%f7
	xnor	%i0,	0x1D17,	%g7
	ldd	[%l7 + 0x38],	%f4
	orcc	%l2,	0x1B78,	%g4
	movrne	%o2,	%i6,	%g3
	fmovsgu	%xcc,	%f12,	%f2
	fmovsle	%icc,	%f12,	%f10
	fcmpes	%fcc3,	%f1,	%f8
	movle	%icc,	%g5,	%g1
	fpackfix	%f4,	%f2
	edge16	%o7,	%i5,	%o3
	restore %l4, %i1, %o1
	movre	%i2,	0x10F,	%i7
	fornot2s	%f10,	%f15,	%f4
	subccc	%g6,	0x025A,	%l1
	fmovspos	%icc,	%f3,	%f13
	fmovdvs	%xcc,	%f8,	%f3
	popc	0x149F,	%l6
	popc	%i3,	%o4
	movcs	%icc,	%l5,	%o5
	ldd	[%l7 + 0x28],	%f8
	fmovrslez	%g2,	%f3,	%f2
	ldx	[%l7 + 0x08],	%o0
	ldub	[%l7 + 0x1D],	%l3
	fmovsl	%icc,	%f10,	%f2
	fxnor	%f2,	%f14,	%f10
	movre	%i4,	0x295,	%l0
	sll	%i0,	0x04,	%o6
	orn	%g7,	0x0217,	%g4
	edge8n	%o2,	%i6,	%l2
	fpadd32	%f12,	%f8,	%f12
	movrne	%g3,	0x0C3,	%g1
	restore %o7, 0x04FA, %g5
	fcmpne16	%f2,	%f10,	%i5
	fmul8x16al	%f4,	%f10,	%f14
	addccc	%o3,	0x0938,	%i1
	movleu	%icc,	%o1,	%l4
	fmuld8sux16	%f1,	%f0,	%f8
	movrlez	%i7,	0x124,	%i2
	andn	%l1,	%g6,	%l6
	movgu	%xcc,	%o4,	%l5
	and	%o5,	%i3,	%o0
	ldx	[%l7 + 0x78],	%l3
	umulcc	%g2,	%i4,	%l0
	ldd	[%l7 + 0x60],	%i0
	xorcc	%o6,	%g7,	%g4
	sdiv	%o2,	0x180E,	%l2
	xor	%g3,	%g1,	%o7
	fmovrsgz	%i6,	%f1,	%f3
	fnand	%f6,	%f4,	%f6
	fmuld8sux16	%f2,	%f13,	%f2
	movgu	%xcc,	%i5,	%g5
	andncc	%i1,	%o1,	%o3
	ldd	[%l7 + 0x38],	%i6
	sdiv	%i2,	0x0B6B,	%l4
	stw	%l1,	[%l7 + 0x60]
	fmul8x16au	%f12,	%f7,	%f12
	sllx	%g6,	%o4,	%l5
	movrgez	%l6,	%i3,	%o0
	lduh	[%l7 + 0x60],	%l3
	fmovsle	%xcc,	%f10,	%f1
	udiv	%o5,	0x0A34,	%i4
	movpos	%icc,	%l0,	%g2
	xnor	%o6,	%i0,	%g7
	xorcc	%g4,	0x0854,	%l2
	edge8ln	%o2,	%g1,	%o7
	umul	%i6,	%g3,	%g5
	movrlz	%i1,	0x012,	%i5
	fnegd	%f2,	%f2
	movne	%icc,	%o3,	%i7
	fcmple32	%f8,	%f10,	%i2
	fmovsgu	%icc,	%f0,	%f9
	ldsh	[%l7 + 0x60],	%o1
	movn	%icc,	%l1,	%g6
	movle	%xcc,	%l4,	%o4
	stw	%l5,	[%l7 + 0x7C]
	movle	%icc,	%l6,	%o0
	fmovrsgz	%l3,	%f10,	%f7
	orncc	%i3,	0x033D,	%i4
	fmovdpos	%xcc,	%f0,	%f8
	mova	%xcc,	%o5,	%l0
	movvc	%icc,	%o6,	%i0
	movn	%xcc,	%g2,	%g7
	ldx	[%l7 + 0x10],	%l2
	edge16l	%g4,	%g1,	%o7
	srax	%o2,	%i6,	%g3
	stw	%g5,	[%l7 + 0x14]
	array16	%i5,	%o3,	%i7
	lduh	[%l7 + 0x0A],	%i1
	lduw	[%l7 + 0x0C],	%i2
	sra	%l1,	0x00,	%o1
	fmovdleu	%xcc,	%f1,	%f0
	subccc	%g6,	0x1946,	%o4
	fxors	%f2,	%f13,	%f5
	lduh	[%l7 + 0x58],	%l4
	fmul8ulx16	%f6,	%f2,	%f12
	udivx	%l5,	0x14EF,	%l6
	pdist	%f2,	%f12,	%f2
	fnot2	%f4,	%f6
	addc	%o0,	0x1A1D,	%i3
	sub	%l3,	0x16B4,	%i4
	movle	%icc,	%l0,	%o5
	srlx	%i0,	%o6,	%g2
	orn	%g7,	%l2,	%g1
	fnegs	%f11,	%f11
	fnot1	%f2,	%f10
	mulx	%g4,	%o2,	%i6
	addccc	%o7,	0x1EE8,	%g5
	ldx	[%l7 + 0x18],	%i5
	save %o3, %g3, %i1
	move	%xcc,	%i2,	%i7
	umulcc	%l1,	%o1,	%o4
	fcmpeq16	%f0,	%f10,	%l4
	stx	%g6,	[%l7 + 0x28]
	edge32l	%l6,	%o0,	%l5
	stx	%l3,	[%l7 + 0x60]
	addc	%i4,	0x0CC4,	%l0
	sub	%o5,	%i3,	%o6
	fors	%f10,	%f13,	%f8
	fnegs	%f1,	%f1
	smul	%i0,	0x0051,	%g2
	smulcc	%l2,	%g1,	%g7
	or	%g4,	0x1829,	%o2
	fxors	%f1,	%f1,	%f11
	move	%xcc,	%o7,	%g5
	add	%i5,	%o3,	%i6
	ldsb	[%l7 + 0x78],	%g3
	udivcc	%i2,	0x17D8,	%i7
	fmovrslez	%i1,	%f0,	%f5
	edge16n	%o1,	%o4,	%l4
	umulcc	%g6,	0x1F3B,	%l6
	sll	%l1,	0x0B,	%l5
	fones	%f10
	ldx	[%l7 + 0x18],	%o0
	array32	%l3,	%l0,	%o5
	stx	%i4,	[%l7 + 0x78]
	movg	%icc,	%o6,	%i0
	andcc	%g2,	%i3,	%g1
	movpos	%xcc,	%l2,	%g7
	move	%xcc,	%g4,	%o2
	edge16l	%o7,	%g5,	%o3
	edge8l	%i5,	%i6,	%g3
	edge32l	%i2,	%i1,	%o1
	edge8ln	%i7,	%l4,	%g6
	sdiv	%o4,	0x1C0A,	%l6
	fmovsg	%icc,	%f0,	%f6
	fsrc2	%f14,	%f0
	umul	%l1,	%o0,	%l5
	udivx	%l3,	0x055B,	%o5
	smul	%l0,	%o6,	%i0
	sra	%g2,	%i4,	%i3
	ldd	[%l7 + 0x30],	%l2
	fnegs	%f14,	%f2
	or	%g7,	%g1,	%o2
	move	%icc,	%o7,	%g5
	xorcc	%o3,	0x1936,	%i5
	edge16l	%g4,	%g3,	%i2
	addccc	%i6,	%o1,	%i1
	edge8	%l4,	%g6,	%o4
	fmovse	%icc,	%f0,	%f6
	movleu	%xcc,	%l6,	%i7
	fmovd	%f12,	%f12
	move	%icc,	%l1,	%o0
	std	%f10,	[%l7 + 0x40]
	udiv	%l5,	0x06EC,	%o5
	restore %l0, %o6, %l3
	sdiv	%g2,	0x0A69,	%i0
	alignaddrl	%i4,	%l2,	%g7
	ldsh	[%l7 + 0x5C],	%i3
	alignaddrl	%g1,	%o2,	%g5
	faligndata	%f14,	%f8,	%f10
	ldsw	[%l7 + 0x54],	%o7
	and	%o3,	%g4,	%g3
	movrgez	%i2,	%i6,	%i5
	edge16l	%i1,	%l4,	%o1
	array32	%g6,	%o4,	%l6
	movre	%i7,	0x2FE,	%l1
	fcmpgt32	%f12,	%f12,	%o0
	fmul8ulx16	%f12,	%f8,	%f12
	lduw	[%l7 + 0x54],	%l5
	fmovdg	%icc,	%f14,	%f4
	srlx	%o5,	0x07,	%o6
	andncc	%l3,	%l0,	%g2
	fpadd32s	%f0,	%f7,	%f1
	fmuld8sux16	%f6,	%f10,	%f10
	orcc	%i4,	%l2,	%g7
	srlx	%i3,	0x04,	%g1
	xnor	%o2,	0x0F87,	%g5
	movge	%icc,	%i0,	%o7
	fnegd	%f8,	%f12
	edge8l	%o3,	%g4,	%g3
	fmovrdne	%i2,	%f8,	%f2
	movcc	%icc,	%i5,	%i1
	lduh	[%l7 + 0x26],	%i6
	ld	[%l7 + 0x50],	%f2
	edge8ln	%l4,	%o1,	%o4
	subccc	%g6,	0x0092,	%i7
	movvc	%icc,	%l6,	%l1
	addc	%o0,	0x01BF,	%l5
	sll	%o5,	%l3,	%o6
	xor	%g2,	%l0,	%i4
	array8	%l2,	%i3,	%g7
	edge16	%o2,	%g5,	%i0
	or	%g1,	%o7,	%g4
	xor	%g3,	%o3,	%i2
	lduw	[%l7 + 0x10],	%i1
	srax	%i6,	0x0B,	%l4
	movvc	%icc,	%o1,	%o4
	fxnor	%f0,	%f6,	%f10
	fmul8x16al	%f0,	%f0,	%f4
	srlx	%i5,	%i7,	%g6
	save %l1, %o0, %l5
	xnorcc	%o5,	0x055A,	%l6
	fsrc2s	%f2,	%f7
	add	%l3,	%g2,	%l0
	lduh	[%l7 + 0x66],	%i4
	edge32n	%l2,	%o6,	%i3
	fnot2s	%f0,	%f2
	smulcc	%g7,	%g5,	%i0
	movle	%icc,	%g1,	%o2
	movrgz	%o7,	%g4,	%g3
	fcmpgt32	%f2,	%f4,	%i2
	fmovsa	%xcc,	%f0,	%f9
	movpos	%xcc,	%i1,	%i6
	movleu	%xcc,	%l4,	%o1
	array32	%o3,	%o4,	%i5
	fmovdge	%xcc,	%f9,	%f1
	subc	%g6,	%l1,	%o0
	stx	%i7,	[%l7 + 0x18]
	fcmple16	%f12,	%f4,	%o5
	sethi	0x09C9,	%l6
	sub	%l5,	0x1C25,	%g2
	sdiv	%l0,	0x0799,	%l3
	movrlez	%l2,	%o6,	%i3
	mulscc	%g7,	0x16C4,	%g5
	ldsb	[%l7 + 0x3F],	%i0
	fmovrdne	%i4,	%f6,	%f14
	fsrc2s	%f0,	%f14
	stb	%o2,	[%l7 + 0x14]
	movne	%icc,	%g1,	%o7
	alignaddr	%g4,	%i2,	%i1
	movge	%icc,	%i6,	%l4
	edge8	%o1,	%o3,	%o4
	alignaddrl	%i5,	%g6,	%g3
	edge16ln	%l1,	%o0,	%o5
	subccc	%i7,	0x1B66,	%l5
	andcc	%l6,	%g2,	%l3
	alignaddr	%l2,	%l0,	%i3
	ldd	[%l7 + 0x60],	%f4
	orncc	%g7,	%g5,	%i0
	addccc	%o6,	%i4,	%g1
	movcc	%icc,	%o7,	%o2
	udivcc	%g4,	0x00A1,	%i2
	orcc	%i6,	0x0609,	%l4
	restore %o1, %o3, %i1
	edge32	%i5,	%o4,	%g6
	ldx	[%l7 + 0x20],	%l1
	mova	%icc,	%o0,	%o5
	fmovsgu	%icc,	%f8,	%f3
	andncc	%i7,	%g3,	%l6
	movn	%xcc,	%l5,	%g2
	alignaddr	%l3,	%l0,	%i3
	save %g7, 0x04E8, %g5
	sdivx	%l2,	0x1CCC,	%o6
	andncc	%i0,	%i4,	%o7
	orn	%o2,	0x0F28,	%g4
	lduw	[%l7 + 0x40],	%g1
	restore %i6, 0x0830, %i2
	movre	%o1,	0x1BC,	%l4
	mulscc	%i1,	%o3,	%i5
	sdiv	%o4,	0x1C9D,	%g6
	edge16n	%l1,	%o0,	%i7
	srlx	%o5,	%l6,	%g3
	movle	%icc,	%g2,	%l5
	ldx	[%l7 + 0x48],	%l0
	fand	%f6,	%f12,	%f14
	srax	%i3,	%g7,	%g5
	xorcc	%l2,	0x088D,	%o6
	edge32n	%i0,	%l3,	%o7
	fmul8x16au	%f3,	%f4,	%f4
	fmovrdgez	%i4,	%f2,	%f4
	ldsb	[%l7 + 0x55],	%g4
	save %g1, %o2, %i6
	array8	%i2,	%l4,	%i1
	and	%o1,	0x1ED0,	%o3
	subccc	%i5,	%g6,	%o4
	srlx	%o0,	%i7,	%l1
	ldsh	[%l7 + 0x7E],	%o5
	movleu	%icc,	%l6,	%g2
	movg	%xcc,	%l5,	%l0
	udivx	%i3,	0x0A53,	%g7
	fnegd	%f4,	%f0
	orcc	%g5,	%l2,	%g3
	movrgz	%i0,	0x0F3,	%l3
	mulscc	%o7,	%i4,	%g4
	fmovrdgez	%o6,	%f2,	%f12
	popc	0x1FA0,	%g1
	stw	%o2,	[%l7 + 0x50]
	orn	%i6,	%l4,	%i2
	array8	%i1,	%o3,	%o1
	move	%icc,	%g6,	%o4
	edge8	%o0,	%i7,	%i5
	umulcc	%o5,	0x15A2,	%l6
	movn	%xcc,	%l1,	%l5
	movvs	%xcc,	%l0,	%i3
	stb	%g7,	[%l7 + 0x56]
	ldsw	[%l7 + 0x44],	%g5
	fmovsvc	%icc,	%f4,	%f15
	alignaddrl	%l2,	%g3,	%i0
	fnot1s	%f1,	%f11
	edge32ln	%g2,	%o7,	%l3
	fmovdn	%icc,	%f5,	%f2
	movcc	%xcc,	%i4,	%o6
	fmovsvs	%xcc,	%f2,	%f0
	subc	%g1,	0x1F8B,	%o2
	edge16	%i6,	%g4,	%l4
	srlx	%i1,	%i2,	%o1
	restore %g6, %o4, %o0
	movrgz	%o3,	0x0E6,	%i5
	stx	%o5,	[%l7 + 0x10]
	andncc	%i7,	%l1,	%l5
	fmovsa	%icc,	%f0,	%f6
	array16	%l0,	%l6,	%i3
	fcmpgt32	%f8,	%f14,	%g5
	xorcc	%l2,	0x07DF,	%g3
	xorcc	%g7,	%g2,	%i0
	fand	%f14,	%f0,	%f4
	movne	%icc,	%l3,	%i4
	edge32n	%o7,	%g1,	%o2
	save %o6, %i6, %g4
	srl	%i1,	0x15,	%i2
	sethi	0x14E2,	%l4
	movvc	%xcc,	%o1,	%o4
	move	%icc,	%o0,	%o3
	save %i5, %g6, %o5
	edge16n	%i7,	%l1,	%l0
	fcmpne32	%f8,	%f14,	%l5
	std	%f6,	[%l7 + 0x20]
	mova	%icc,	%l6,	%g5
	addc	%l2,	%i3,	%g3
	save %g7, 0x11AA, %g2
	fmovscc	%xcc,	%f9,	%f9
	fornot2s	%f15,	%f13,	%f12
	lduw	[%l7 + 0x74],	%l3
	movg	%xcc,	%i4,	%o7
	subc	%g1,	0x0C80,	%i0
	alignaddrl	%o2,	%i6,	%o6
	movg	%xcc,	%g4,	%i1
	sra	%i2,	%l4,	%o1
	for	%f12,	%f4,	%f12
	subcc	%o0,	0x1CD6,	%o3
	srax	%i5,	0x0D,	%g6
	edge16n	%o5,	%o4,	%l1
	alignaddrl	%l0,	%l5,	%i7
	sdivx	%l6,	0x0019,	%l2
	movn	%icc,	%i3,	%g3
	srlx	%g5,	0x15,	%g7
	udivcc	%l3,	0x0AD0,	%i4
	movrgez	%o7,	0x30D,	%g2
	xnor	%i0,	%g1,	%i6
	movneg	%xcc,	%o2,	%o6
	ldd	[%l7 + 0x28],	%f14
	or	%i1,	%g4,	%i2
	fandnot2	%f2,	%f2,	%f8
	umul	%o1,	0x0054,	%l4
	fmovdgu	%xcc,	%f1,	%f13
	fmovs	%f9,	%f3
	srax	%o0,	0x10,	%o3
	movcc	%xcc,	%g6,	%o5
	orncc	%i5,	%l1,	%l0
	udivcc	%l5,	0x0047,	%i7
	faligndata	%f14,	%f2,	%f2
	fandnot2	%f4,	%f8,	%f0
	ldd	[%l7 + 0x30],	%i6
	alignaddr	%o4,	%i3,	%l2
	mova	%icc,	%g3,	%g5
	andncc	%g7,	%l3,	%i4
	fpmerge	%f12,	%f3,	%f8
	std	%f8,	[%l7 + 0x60]
	lduw	[%l7 + 0x74],	%o7
	movrlz	%i0,	%g2,	%g1
	and	%i6,	0x061C,	%o2
	movl	%icc,	%o6,	%i1
	addcc	%i2,	%g4,	%o1
	orcc	%o0,	0x0D3E,	%o3
	edge8	%g6,	%l4,	%i5
	alignaddrl	%o5,	%l1,	%l0
	edge16ln	%l5,	%i7,	%l6
	addcc	%o4,	%i3,	%g3
	fmovsl	%icc,	%f1,	%f15
	edge16ln	%g5,	%g7,	%l3
	and	%i4,	0x0C92,	%l2
	fnor	%f14,	%f8,	%f8
	xorcc	%i0,	%g2,	%g1
	ldd	[%l7 + 0x48],	%f2
	andcc	%o7,	0x1E6E,	%o2
	ld	[%l7 + 0x24],	%f14
	fmovsl	%xcc,	%f6,	%f14
	sth	%o6,	[%l7 + 0x2E]
	movpos	%xcc,	%i6,	%i2
	ldub	[%l7 + 0x6C],	%i1
	movg	%icc,	%g4,	%o0
	movrgz	%o1,	%o3,	%g6
	fcmped	%fcc3,	%f0,	%f12
	fxnor	%f2,	%f14,	%f12
	fmovscc	%icc,	%f4,	%f8
	sub	%i5,	%l4,	%o5
	and	%l1,	%l5,	%i7
	movg	%icc,	%l6,	%l0
	fcmple32	%f4,	%f10,	%i3
	srlx	%g3,	%o4,	%g7
	fpack32	%f6,	%f6,	%f6
	ld	[%l7 + 0x58],	%f6
	ld	[%l7 + 0x30],	%f15
	orn	%g5,	%i4,	%l2
	fmovrdgez	%l3,	%f4,	%f12
	umul	%i0,	%g2,	%g1
	array8	%o2,	%o7,	%i6
	sdivx	%o6,	0x1E90,	%i2
	andncc	%i1,	%o0,	%o1
	edge8n	%g4,	%o3,	%i5
	andn	%g6,	0x02B2,	%o5
	movl	%xcc,	%l1,	%l4
	edge16	%i7,	%l5,	%l0
	restore %i3, 0x154D, %g3
	sth	%l6,	[%l7 + 0x70]
	fnot2s	%f9,	%f13
	sll	%g7,	0x11,	%o4
	fmovdneg	%icc,	%f6,	%f13
	sub	%g5,	0x1BC2,	%l2
	movn	%xcc,	%l3,	%i0
	xor	%g2,	0x0EF0,	%i4
	srax	%g1,	0x0E,	%o2
	fcmple16	%f4,	%f4,	%o7
	st	%f1,	[%l7 + 0x44]
	popc	0x0C36,	%o6
	movge	%icc,	%i6,	%i2
	fmovs	%f8,	%f11
	fcmpgt16	%f2,	%f0,	%i1
	or	%o0,	%o1,	%o3
	fmovsge	%xcc,	%f5,	%f8
	fors	%f4,	%f7,	%f15
	lduw	[%l7 + 0x34],	%i5
	or	%g4,	0x0B7A,	%g6
	movneg	%xcc,	%l1,	%l4
	movvs	%xcc,	%i7,	%o5
	movrlez	%l5,	%i3,	%g3
	fandnot1	%f8,	%f8,	%f8
	bshuffle	%f2,	%f4,	%f6
	sdiv	%l0,	0x05CA,	%l6
	udiv	%o4,	0x0A9E,	%g5
	array32	%l2,	%g7,	%l3
	sub	%g2,	%i4,	%i0
	add	%g1,	%o2,	%o7
	addccc	%o6,	%i2,	%i1
	xnorcc	%i6,	%o0,	%o3
	alignaddrl	%i5,	%g4,	%g6
	sethi	0x0751,	%o1
	movrne	%l4,	%l1,	%o5
	edge32l	%l5,	%i3,	%g3
	fmovrdlz	%l0,	%f0,	%f4
	xnorcc	%l6,	%i7,	%o4
	edge8	%l2,	%g5,	%g7
	andn	%g2,	0x18E5,	%l3
	movvc	%icc,	%i4,	%i0
	orn	%g1,	0x1F43,	%o2
	add	%o6,	0x0B68,	%o7
	edge8n	%i2,	%i6,	%o0
	fcmpgt32	%f12,	%f10,	%o3
	restore %i5, 0x1DCE, %i1
	fnot2s	%f5,	%f4
	edge8ln	%g4,	%g6,	%o1
	fmovsn	%icc,	%f7,	%f7
	ldub	[%l7 + 0x5E],	%l4
	fsrc1	%f14,	%f10
	fmovsvc	%xcc,	%f9,	%f11
	orn	%o5,	%l1,	%i3
	udivx	%g3,	0x0B44,	%l0
	fones	%f6
	alignaddr	%l5,	%l6,	%i7
	edge16l	%l2,	%o4,	%g7
	fmuld8ulx16	%f1,	%f12,	%f0
	array32	%g5,	%l3,	%g2
	fnors	%f2,	%f7,	%f11
	subc	%i4,	%i0,	%o2
	fmovdvs	%xcc,	%f10,	%f11
	orncc	%g1,	%o7,	%o6
	movle	%icc,	%i6,	%i2
	edge8ln	%o0,	%o3,	%i1
	edge16l	%g4,	%i5,	%o1
	smulcc	%g6,	0x0E6C,	%l4
	stx	%o5,	[%l7 + 0x20]
	movre	%l1,	0x3C4,	%g3
	movrlez	%i3,	%l0,	%l5
	sll	%i7,	%l2,	%l6
	array16	%g7,	%o4,	%g5
	smul	%g2,	0x1647,	%i4
	fnors	%f15,	%f9,	%f0
	sdiv	%l3,	0x062C,	%i0
	sllx	%o2,	0x0A,	%o7
	fands	%f10,	%f12,	%f6
	srl	%g1,	%o6,	%i6
	edge32l	%i2,	%o3,	%o0
	xor	%g4,	%i1,	%o1
	fors	%f15,	%f9,	%f4
	fornot1	%f6,	%f8,	%f10
	movvc	%icc,	%i5,	%l4
	fpadd16s	%f8,	%f3,	%f8
	ldd	[%l7 + 0x58],	%o4
	movneg	%icc,	%l1,	%g3
	fand	%f4,	%f10,	%f2
	movrgez	%i3,	%g6,	%l0
	fsrc1	%f4,	%f10
	sdivcc	%i7,	0x0D7B,	%l2
	ldx	[%l7 + 0x48],	%l6
	fmovdg	%icc,	%f7,	%f5
	sdivcc	%g7,	0x0C78,	%o4
	movrlz	%l5,	%g2,	%i4
	fmovscc	%icc,	%f11,	%f10
	edge16	%g5,	%i0,	%o2
	movvs	%icc,	%o7,	%l3
	xnor	%o6,	0x0029,	%i6
	alignaddrl	%i2,	%g1,	%o3
	edge16ln	%g4,	%i1,	%o0
	fcmple32	%f0,	%f2,	%i5
	ldsb	[%l7 + 0x61],	%l4
	fmovsl	%icc,	%f5,	%f6
	fsrc1	%f10,	%f4
	addccc	%o5,	%l1,	%g3
	sub	%o1,	%i3,	%l0
	std	%f14,	[%l7 + 0x20]
	movne	%xcc,	%g6,	%l2
	xor	%i7,	0x1220,	%l6
	fmovdn	%xcc,	%f3,	%f13
	movl	%xcc,	%g7,	%o4
	ldsw	[%l7 + 0x50],	%g2
	umulcc	%i4,	%g5,	%i0
	fornot2s	%f1,	%f0,	%f1
	edge8l	%l5,	%o2,	%l3
	fands	%f9,	%f5,	%f3
	sub	%o6,	0x0BE7,	%i6
	movrlez	%o7,	0x0F2,	%i2
	udivcc	%g1,	0x0D11,	%g4
	srl	%i1,	%o3,	%o0
	popc	%l4,	%i5
	fpsub32	%f12,	%f4,	%f0
	fmovdge	%icc,	%f5,	%f1
	edge16l	%o5,	%l1,	%g3
	sub	%i3,	0x1746,	%l0
	fandnot2s	%f9,	%f5,	%f4
	move	%xcc,	%o1,	%l2
	udivx	%i7,	0x0344,	%l6
	fnors	%f5,	%f7,	%f11
	movgu	%icc,	%g7,	%o4
	edge8l	%g2,	%g6,	%g5
	fnor	%f8,	%f8,	%f0
	sllx	%i0,	%i4,	%l5
	fmovsle	%icc,	%f2,	%f8
	edge16	%l3,	%o2,	%i6
	edge32ln	%o6,	%i2,	%g1
	movvc	%xcc,	%g4,	%i1
	or	%o3,	%o0,	%o7
	lduh	[%l7 + 0x7C],	%i5
	orn	%l4,	0x0525,	%l1
	movge	%xcc,	%g3,	%i3
	ldd	[%l7 + 0x68],	%f4
	movcc	%icc,	%o5,	%o1
	edge32	%l0,	%i7,	%l6
	movpos	%xcc,	%l2,	%g7
	addc	%o4,	0x1784,	%g2
	sdivx	%g5,	0x1897,	%i0
	lduw	[%l7 + 0x28],	%g6
	sdivcc	%l5,	0x059C,	%l3
	addcc	%o2,	0x1A3E,	%i6
	fmovrsgz	%i4,	%f9,	%f9
	fzero	%f14
	smulcc	%o6,	0x1A4D,	%g1
	movge	%icc,	%i2,	%g4
	movcs	%icc,	%i1,	%o3
	andncc	%o7,	%i5,	%o0
	srl	%l4,	0x0C,	%g3
	fmovrdlez	%l1,	%f14,	%f8
	fmovrdlez	%o5,	%f6,	%f4
	fpmerge	%f7,	%f0,	%f14
	fpadd16s	%f4,	%f12,	%f4
	ldsh	[%l7 + 0x30],	%i3
	edge32l	%o1,	%l0,	%i7
	ldub	[%l7 + 0x6E],	%l6
	udivx	%l2,	0x1787,	%o4
	edge16	%g7,	%g5,	%i0
	movre	%g6,	0x20E,	%l5
	edge8	%l3,	%g2,	%o2
	movl	%xcc,	%i4,	%i6
	mova	%icc,	%g1,	%o6
	orn	%i2,	0x13EF,	%g4
	fmovscc	%xcc,	%f1,	%f3
	edge16l	%i1,	%o7,	%i5
	sdiv	%o3,	0x02C9,	%l4
	umulcc	%o0,	0x0AED,	%l1
	xnorcc	%o5,	%g3,	%i3
	fmovs	%f12,	%f12
	popc	%o1,	%i7
	movl	%icc,	%l0,	%l2
	fnot1	%f4,	%f2
	umulcc	%l6,	%o4,	%g7
	fxor	%f2,	%f2,	%f8
	fmul8x16au	%f7,	%f5,	%f0
	xnorcc	%g5,	%i0,	%g6
	xorcc	%l3,	%l5,	%o2
	fmovs	%f0,	%f1
	movrgez	%g2,	0x2BA,	%i6
	fmul8x16al	%f9,	%f4,	%f10
	addc	%i4,	%o6,	%g1
	edge8n	%g4,	%i2,	%o7
	movl	%xcc,	%i1,	%o3
	restore %l4, 0x095C, %o0
	mulscc	%i5,	0x0E2F,	%o5
	edge16l	%l1,	%g3,	%o1
	movrgz	%i7,	%i3,	%l2
	fmovda	%icc,	%f0,	%f6
	fmovdne	%xcc,	%f5,	%f11
	lduw	[%l7 + 0x58],	%l6
	fmovdleu	%icc,	%f1,	%f13
	fmovdn	%xcc,	%f10,	%f6
	ldub	[%l7 + 0x5B],	%o4
	fmovse	%icc,	%f15,	%f15
	movpos	%icc,	%g7,	%l0
	fcmpgt32	%f12,	%f0,	%g5
	edge32n	%i0,	%g6,	%l3
	mulx	%o2,	%g2,	%i6
	ld	[%l7 + 0x58],	%f2
	fmul8ulx16	%f2,	%f8,	%f12
	fand	%f2,	%f12,	%f8
	fnands	%f15,	%f15,	%f7
	fmovrslz	%l5,	%f7,	%f0
	fnegs	%f9,	%f15
	fmuld8sux16	%f13,	%f3,	%f4
	udivcc	%o6,	0x1DE7,	%g1
	sdivx	%i4,	0x10CD,	%g4
	movcs	%icc,	%i2,	%i1
	edge32	%o7,	%l4,	%o0
	lduw	[%l7 + 0x64],	%o3
	std	%f8,	[%l7 + 0x78]
	sth	%o5,	[%l7 + 0x5E]
	edge8n	%l1,	%i5,	%g3
	sll	%i7,	0x02,	%i3
	fpadd32s	%f0,	%f4,	%f11
	fmovsvs	%icc,	%f14,	%f13
	fnot1	%f8,	%f6
	addc	%o1,	0x0C5F,	%l2
	fmovrdlz	%l6,	%f14,	%f2
	sdivx	%o4,	0x09F5,	%l0
	fmovdcs	%xcc,	%f8,	%f6
	ld	[%l7 + 0x38],	%f14
	movvs	%icc,	%g7,	%g5
	fmovdgu	%icc,	%f9,	%f5
	stw	%g6,	[%l7 + 0x0C]
	movre	%l3,	%o2,	%g2
	andncc	%i0,	%i6,	%l5
	sdiv	%g1,	0x19D4,	%i4
	andcc	%g4,	0x16C3,	%o6
	fmovrse	%i1,	%f13,	%f5
	save %o7, 0x0F9A, %l4
	bshuffle	%f12,	%f8,	%f2
	ldsw	[%l7 + 0x08],	%o0
	movvc	%icc,	%i2,	%o3
	orcc	%l1,	%o5,	%g3
	movrgz	%i5,	%i3,	%i7
	ldx	[%l7 + 0x60],	%o1
	movneg	%icc,	%l2,	%o4
	orn	%l6,	0x19E3,	%l0
	fsrc2s	%f7,	%f7
	movrlez	%g5,	%g7,	%g6
	sdivx	%l3,	0x1896,	%o2
	array32	%i0,	%g2,	%l5
	mova	%xcc,	%i6,	%i4
	stb	%g1,	[%l7 + 0x5F]
	edge32ln	%o6,	%g4,	%i1
	sub	%l4,	0x12AA,	%o0
	fabss	%f5,	%f12
	fcmped	%fcc3,	%f6,	%f6
	fmovdcc	%icc,	%f12,	%f5
	ld	[%l7 + 0x1C],	%f7
	fcmpeq16	%f4,	%f14,	%i2
	edge8l	%o7,	%o3,	%o5
	alignaddr	%g3,	%i5,	%i3
	fmovsneg	%xcc,	%f14,	%f5
	restore %i7, %l1, %o1
	xnorcc	%o4,	%l6,	%l2
	fmovsa	%xcc,	%f13,	%f0
	andcc	%g5,	%l0,	%g7
	fmul8x16al	%f10,	%f2,	%f8
	ldub	[%l7 + 0x5B],	%g6
	fmovsne	%icc,	%f11,	%f8
	fcmpgt32	%f6,	%f4,	%o2
	movcs	%xcc,	%i0,	%l3
	smul	%g2,	%l5,	%i6
	edge8l	%i4,	%o6,	%g1
	fcmple32	%f2,	%f12,	%i1
	fcmple16	%f6,	%f10,	%g4
	movrlez	%l4,	%o0,	%o7
	sll	%i2,	0x01,	%o3
	fmovdpos	%xcc,	%f4,	%f14
	sllx	%o5,	%g3,	%i5
	mulx	%i3,	0x14EC,	%l1
	fors	%f7,	%f6,	%f11
	fsrc2s	%f1,	%f10
	sdiv	%o1,	0x0059,	%o4
	orcc	%l6,	%l2,	%i7
	mova	%xcc,	%l0,	%g5
	fone	%f12
	fnegs	%f2,	%f13
	movge	%xcc,	%g6,	%o2
	movrgez	%g7,	%i0,	%l3
	edge8ln	%g2,	%l5,	%i4
	stw	%i6,	[%l7 + 0x50]
	xnor	%g1,	0x0ED5,	%o6
	mulscc	%i1,	%g4,	%l4
	fmovdpos	%xcc,	%f12,	%f15
	edge16l	%o0,	%i2,	%o3
	move	%xcc,	%o7,	%o5
	fpsub32s	%f15,	%f13,	%f10
	xorcc	%i5,	0x15EE,	%i3
	edge16n	%g3,	%o1,	%l1
	movl	%icc,	%o4,	%l6
	alignaddrl	%l2,	%l0,	%g5
	srax	%g6,	%i7,	%o2
	smulcc	%g7,	%l3,	%g2
	sllx	%l5,	%i0,	%i4
	add	%i6,	%o6,	%g1
	alignaddrl	%g4,	%i1,	%l4
	subcc	%i2,	%o0,	%o3
	fmovrsgez	%o5,	%f8,	%f6
	edge32n	%o7,	%i5,	%g3
	fnot1s	%f6,	%f5
	fmovrsgez	%i3,	%f5,	%f14
	fmovdvs	%icc,	%f4,	%f4
	movge	%icc,	%o1,	%o4
	subc	%l1,	%l6,	%l2
	subccc	%g5,	%l0,	%g6
	movcc	%xcc,	%o2,	%g7
	sethi	0x1E56,	%l3
	add	%i7,	%l5,	%g2
	array32	%i0,	%i6,	%i4
	move	%icc,	%o6,	%g4
	fmovrdlez	%g1,	%f14,	%f14
	movre	%l4,	0x2A8,	%i2
	udivx	%i1,	0x1A1C,	%o0
	movg	%icc,	%o3,	%o7
	ld	[%l7 + 0x1C],	%f0
	array32	%i5,	%o5,	%g3
	edge32	%i3,	%o1,	%o4
	stb	%l6,	[%l7 + 0x42]
	mova	%icc,	%l1,	%g5
	stw	%l0,	[%l7 + 0x24]
	ldsw	[%l7 + 0x78],	%l2
	fpsub32	%f12,	%f14,	%f0
	fmovsa	%icc,	%f13,	%f8
	movpos	%icc,	%g6,	%o2
	sll	%l3,	%g7,	%l5
	array8	%i7,	%g2,	%i0
	andncc	%i6,	%o6,	%i4
	ldx	[%l7 + 0x08],	%g4
	alignaddr	%l4,	%i2,	%g1
	fmovdvc	%icc,	%f15,	%f6
	fmuld8ulx16	%f10,	%f14,	%f2
	andncc	%i1,	%o3,	%o7
	sllx	%i5,	0x1C,	%o0
	fnor	%f0,	%f10,	%f6
	addccc	%o5,	0x0DC4,	%i3
	addcc	%g3,	%o4,	%o1
	sdivcc	%l1,	0x1079,	%l6
	fones	%f10
	edge16	%l0,	%l2,	%g5
	smul	%g6,	%l3,	%g7
	udiv	%l5,	0x0C19,	%o2
	sdiv	%g2,	0x18E0,	%i0
	popc	0x1888,	%i6
	edge8ln	%i7,	%i4,	%o6
	srax	%g4,	%i2,	%l4
	smulcc	%g1,	%i1,	%o3
	ldd	[%l7 + 0x48],	%i4
	fornot1s	%f0,	%f2,	%f0
	fnegs	%f0,	%f14
	movcc	%xcc,	%o0,	%o7
	movle	%icc,	%o5,	%g3
	sth	%i3,	[%l7 + 0x4C]
	addccc	%o1,	%l1,	%l6
	smul	%o4,	0x065B,	%l2
	fnands	%f7,	%f11,	%f13
	fand	%f14,	%f4,	%f2
	fnot2s	%f9,	%f5
	movrgez	%g5,	%l0,	%l3
	array16	%g7,	%g6,	%o2
	movcs	%xcc,	%g2,	%l5
	move	%xcc,	%i0,	%i7
	ldsh	[%l7 + 0x48],	%i6
	fmuld8sux16	%f13,	%f13,	%f4
	fmovscs	%icc,	%f3,	%f11
	ldd	[%l7 + 0x60],	%f12
	movleu	%xcc,	%o6,	%g4
	array32	%i4,	%i2,	%g1
	movneg	%icc,	%l4,	%i1
	movpos	%icc,	%o3,	%o0
	smulcc	%i5,	0x0384,	%o5
	fzeros	%f12
	xor	%o7,	%i3,	%g3
	udivcc	%o1,	0x06AD,	%l1
	sra	%o4,	%l6,	%l2
	alignaddrl	%g5,	%l0,	%l3
	orn	%g6,	%g7,	%o2
	fors	%f13,	%f2,	%f13
	fmul8ulx16	%f10,	%f8,	%f4
	movrlz	%g2,	%l5,	%i7
	srl	%i0,	%i6,	%g4
	addc	%o6,	0x1783,	%i4
	mulscc	%i2,	0x0B73,	%l4
	sth	%i1,	[%l7 + 0x72]
	and	%g1,	%o0,	%i5
	udiv	%o5,	0x143A,	%o7
	fmovdn	%xcc,	%f14,	%f4
	fmovdgu	%xcc,	%f10,	%f5
	addc	%i3,	%g3,	%o3
	edge16n	%o1,	%o4,	%l6
	fsrc2	%f6,	%f14
	movrne	%l2,	%l1,	%g5
	movcs	%icc,	%l0,	%g6
	fcmpne32	%f10,	%f4,	%l3
	movrlez	%o2,	%g2,	%l5
	movrgz	%g7,	0x1AC,	%i0
	ldsh	[%l7 + 0x3E],	%i7
	save %i6, %o6, %i4
	movrgz	%i2,	%l4,	%i1
	andn	%g4,	0x1239,	%o0
	popc	%i5,	%o5
	stb	%o7,	[%l7 + 0x24]
	lduw	[%l7 + 0x5C],	%i3
	fmovrdgz	%g3,	%f2,	%f4
	fmul8x16au	%f15,	%f10,	%f4
	edge8	%g1,	%o3,	%o1
	restore %l6, %l2, %o4
	xor	%g5,	0x1DBB,	%l1
	stx	%g6,	[%l7 + 0x30]
	std	%f8,	[%l7 + 0x58]
	fand	%f8,	%f8,	%f8
	array16	%l0,	%o2,	%l3
	fnot2	%f4,	%f0
	sll	%l5,	%g7,	%g2
	std	%f14,	[%l7 + 0x60]
	popc	%i0,	%i7
	or	%o6,	0x10CE,	%i4
	movne	%xcc,	%i6,	%i2
	ldsb	[%l7 + 0x4E],	%i1
	array8	%l4,	%g4,	%o0
	alignaddrl	%o5,	%o7,	%i5
	fsrc2	%f2,	%f4
	mova	%icc,	%i3,	%g1
	orncc	%g3,	%o3,	%l6
	lduw	[%l7 + 0x30],	%l2
	sth	%o4,	[%l7 + 0x32]
	addc	%o1,	%l1,	%g6
	edge8l	%g5,	%l0,	%o2
	save %l5, %g7, %g2
	fornot1	%f2,	%f4,	%f2
	fcmpgt32	%f4,	%f0,	%l3
	fcmpd	%fcc3,	%f8,	%f6
	sethi	0x10DE,	%i0
	movcc	%icc,	%o6,	%i4
	sdivcc	%i6,	0x1526,	%i2
	fpadd16	%f2,	%f2,	%f2
	movne	%icc,	%i1,	%i7
	edge8l	%g4,	%o0,	%l4
	orn	%o5,	0x0061,	%o7
	orcc	%i5,	0x0FB6,	%i3
	movvc	%xcc,	%g1,	%g3
	subc	%o3,	0x0C39,	%l6
	movrgz	%l2,	%o1,	%o4
	movgu	%xcc,	%g6,	%l1
	fmovrslz	%l0,	%f3,	%f5
	fornot1s	%f7,	%f2,	%f2
	fmovdvs	%xcc,	%f2,	%f1
	xorcc	%g5,	0x10F9,	%l5
	udiv	%o2,	0x0FE1,	%g7
	add	%l3,	0x019A,	%g2
	subcc	%i0,	0x1406,	%i4
	smulcc	%i6,	0x09D7,	%o6
	alignaddrl	%i2,	%i1,	%i7
	movgu	%icc,	%g4,	%l4
	movre	%o5,	%o0,	%i5
	fpsub32	%f12,	%f2,	%f12
	fmovsvs	%xcc,	%f4,	%f1
	fmovse	%xcc,	%f5,	%f6
	lduw	[%l7 + 0x64],	%o7
	save %i3, %g1, %g3
	edge32ln	%o3,	%l2,	%o1
	srl	%l6,	%o4,	%l1
	edge16l	%g6,	%l0,	%g5
	std	%f2,	[%l7 + 0x50]
	lduw	[%l7 + 0x50],	%l5
	save %o2, %l3, %g2
	addcc	%i0,	0x1AE4,	%i4
	array32	%g7,	%i6,	%i2
	array16	%o6,	%i7,	%g4
	popc	%l4,	%i1
	ldsh	[%l7 + 0x0E],	%o5
	lduw	[%l7 + 0x60],	%i5
	smulcc	%o0,	%o7,	%g1
	add	%i3,	0x1C8A,	%g3
	xor	%o3,	%o1,	%l6
	movrne	%l2,	0x294,	%l1
	stx	%g6,	[%l7 + 0x60]
	fmul8x16al	%f12,	%f6,	%f10
	fmovrsgz	%l0,	%f0,	%f8
	save %g5, %o4, %o2
	addccc	%l3,	%l5,	%i0
	fmovscc	%xcc,	%f10,	%f7
	udivcc	%g2,	0x12F3,	%i4
	movvc	%xcc,	%g7,	%i2
	movrgez	%o6,	0x0D0,	%i7
	srl	%i6,	0x15,	%g4
	fcmple32	%f12,	%f0,	%l4
	fmovdcs	%icc,	%f14,	%f12
	fones	%f14
	movvs	%xcc,	%i1,	%o5
	edge16	%o0,	%o7,	%g1
	fmovdneg	%xcc,	%f2,	%f3
	srl	%i3,	%i5,	%g3
	subccc	%o1,	%l6,	%o3
	movge	%icc,	%l2,	%l1
	movpos	%xcc,	%l0,	%g5
	sth	%g6,	[%l7 + 0x20]
	edge8ln	%o2,	%l3,	%l5
	add	%o4,	0x14D3,	%g2
	sethi	0x0B39,	%i0
	popc	0x0691,	%g7
	mulx	%i2,	0x0522,	%o6
	srax	%i7,	0x15,	%i4
	movleu	%icc,	%g4,	%i6
	lduw	[%l7 + 0x78],	%l4
	array8	%i1,	%o0,	%o7
	save %g1, %i3, %o5
	edge16n	%g3,	%o1,	%l6
	fnands	%f7,	%f13,	%f10
	udivcc	%o3,	0x1158,	%l2
	movcs	%xcc,	%i5,	%l1
	ldsb	[%l7 + 0x7F],	%g5
	udivx	%g6,	0x1468,	%o2
	ldd	[%l7 + 0x10],	%f0
	smul	%l3,	%l5,	%l0
	sub	%g2,	%i0,	%o4
	fpsub32s	%f4,	%f10,	%f9
	edge16ln	%i2,	%g7,	%o6
	fmovrdlez	%i7,	%f14,	%f10
	edge8l	%g4,	%i4,	%l4
	movrlez	%i6,	%i1,	%o0
	movne	%xcc,	%o7,	%g1
	edge32	%i3,	%g3,	%o5
	movg	%icc,	%l6,	%o3
	popc	%o1,	%i5
	movvc	%icc,	%l2,	%l1
	faligndata	%f8,	%f8,	%f4
	umulcc	%g6,	%g5,	%l3
	addc	%l5,	%o2,	%g2
	fabss	%f4,	%f2
	movvc	%xcc,	%l0,	%o4
	ldd	[%l7 + 0x58],	%f6
	fmul8x16al	%f2,	%f7,	%f6
	umulcc	%i2,	0x1BA2,	%g7
	orncc	%i0,	0x0533,	%i7
	and	%o6,	%i4,	%l4
	fpadd16	%f0,	%f12,	%f4
	srlx	%i6,	%i1,	%o0
	edge16	%g4,	%g1,	%i3
	fandnot2s	%f1,	%f5,	%f4
	fnot1	%f0,	%f14
	fpsub16	%f8,	%f10,	%f8
	sth	%o7,	[%l7 + 0x2E]
	array16	%g3,	%o5,	%l6
	lduw	[%l7 + 0x30],	%o1
	alignaddr	%o3,	%l2,	%l1
	fmovd	%f12,	%f0
	movle	%icc,	%g6,	%i5
	ldx	[%l7 + 0x20],	%g5
	stw	%l5,	[%l7 + 0x5C]
	and	%l3,	0x19AD,	%o2
	movle	%xcc,	%l0,	%g2
	array32	%o4,	%g7,	%i2
	fmovsleu	%xcc,	%f3,	%f1
	xorcc	%i0,	%i7,	%i4
	edge32l	%o6,	%i6,	%l4
	fmovsneg	%icc,	%f1,	%f4
	fmovdvs	%icc,	%f14,	%f14
	fmovsge	%icc,	%f2,	%f9
	ldx	[%l7 + 0x60],	%i1
	ldd	[%l7 + 0x58],	%g4
	stb	%o0,	[%l7 + 0x24]
	fmovdl	%xcc,	%f13,	%f10
	addccc	%g1,	%i3,	%g3
	fzero	%f12
	lduh	[%l7 + 0x14],	%o7
	ldx	[%l7 + 0x38],	%l6
	srl	%o5,	%o1,	%l2
	edge16n	%l1,	%g6,	%i5
	srl	%g5,	0x01,	%o3
	udivcc	%l3,	0x041E,	%o2
	sll	%l0,	0x04,	%g2
	sethi	0x1293,	%l5
	fmovdvc	%xcc,	%f15,	%f7
	ldsb	[%l7 + 0x4F],	%g7
	movrgez	%o4,	0x33C,	%i2
	lduw	[%l7 + 0x48],	%i7
	restore %i4, %o6, %i6
	addc	%l4,	%i1,	%g4
	save %i0, %g1, %o0
	ldsw	[%l7 + 0x14],	%i3
	edge32ln	%o7,	%g3,	%o5
	movvs	%icc,	%o1,	%l6
	movneg	%xcc,	%l1,	%g6
	orcc	%l2,	%g5,	%o3
	umulcc	%l3,	0x1658,	%i5
	xnor	%o2,	%g2,	%l0
	movg	%xcc,	%g7,	%l5
	fcmple16	%f14,	%f8,	%i2
	umul	%o4,	%i4,	%i7
	fcmped	%fcc2,	%f0,	%f14
	edge8	%o6,	%i6,	%i1
	movrlez	%g4,	0x1D7,	%i0
	stw	%g1,	[%l7 + 0x1C]
	fabsd	%f14,	%f12
	edge16l	%o0,	%l4,	%o7
	subcc	%g3,	%i3,	%o1
	movneg	%icc,	%l6,	%l1
	sth	%o5,	[%l7 + 0x20]
	edge32ln	%g6,	%g5,	%l2
	fcmpne32	%f12,	%f14,	%o3
	movne	%xcc,	%i5,	%o2
	fornot1s	%f4,	%f15,	%f3
	subcc	%l3,	0x0F84,	%l0
	fmuld8sux16	%f2,	%f13,	%f10
	movneg	%icc,	%g7,	%l5
	pdist	%f10,	%f4,	%f0
	restore %g2, 0x1FFF, %i2
	andncc	%o4,	%i4,	%i7
	popc	%o6,	%i1
	andncc	%i6,	%g4,	%g1
	popc	%o0,	%i0
	addc	%o7,	%l4,	%i3
	movre	%o1,	%l6,	%l1
	stx	%o5,	[%l7 + 0x30]
	edge32n	%g3,	%g5,	%g6
	stb	%l2,	[%l7 + 0x47]
	edge16ln	%i5,	%o3,	%o2
	sdivx	%l0,	0x1A43,	%l3
	fmul8sux16	%f6,	%f2,	%f8
	xnorcc	%l5,	0x0A02,	%g7
	fmovsg	%xcc,	%f2,	%f14
	movre	%g2,	0x317,	%i2
	edge32n	%o4,	%i4,	%i7
	fpadd16s	%f4,	%f1,	%f0
	movg	%xcc,	%o6,	%i1
	fcmpeq32	%f10,	%f4,	%g4
	xorcc	%i6,	0x01AA,	%g1
	edge16ln	%i0,	%o0,	%l4
	edge16l	%o7,	%o1,	%i3
	movrgez	%l6,	%l1,	%g3
	edge8n	%o5,	%g5,	%g6
	edge32l	%l2,	%i5,	%o2
	srax	%o3,	%l0,	%l5
	fcmpeq32	%f12,	%f6,	%g7
	edge8ln	%l3,	%i2,	%o4
	movpos	%xcc,	%i4,	%g2
	sub	%o6,	%i1,	%g4
	subc	%i6,	%g1,	%i7
	movg	%xcc,	%o0,	%i0
	popc	%l4,	%o1
	andcc	%o7,	%i3,	%l1
	edge32	%l6,	%g3,	%g5
	edge32l	%o5,	%l2,	%g6
	sllx	%i5,	%o3,	%l0
	orncc	%l5,	0x1C24,	%o2
	fmovdleu	%icc,	%f13,	%f2
	fcmpeq16	%f4,	%f2,	%l3
	fornot1	%f4,	%f8,	%f2
	sllx	%i2,	0x07,	%o4
	fornot2	%f12,	%f2,	%f0
	movcs	%xcc,	%g7,	%i4
	fmul8x16al	%f1,	%f1,	%f12
	orncc	%g2,	0x18E7,	%i1
	sra	%g4,	%o6,	%g1
	st	%f3,	[%l7 + 0x50]
	edge8l	%i7,	%o0,	%i0
	subcc	%i6,	0x03CF,	%l4
	fmovdge	%icc,	%f7,	%f12
	edge8l	%o7,	%o1,	%i3
	orncc	%l1,	%l6,	%g5
	edge16ln	%o5,	%l2,	%g6
	fsrc2s	%f10,	%f7
	movcs	%xcc,	%g3,	%i5
	movl	%icc,	%o3,	%l0
	fmovdle	%xcc,	%f0,	%f5
	sra	%o2,	%l5,	%l3
	movcs	%xcc,	%i2,	%g7
	movre	%o4,	0x2D2,	%i4
	fmovdgu	%icc,	%f4,	%f9
	fmovdl	%xcc,	%f3,	%f12
	alignaddr	%i1,	%g4,	%g2
	lduw	[%l7 + 0x20],	%g1
	ldx	[%l7 + 0x10],	%o6
	fmul8sux16	%f0,	%f4,	%f8
	fmul8sux16	%f14,	%f2,	%f4
	ldd	[%l7 + 0x08],	%o0
	subc	%i0,	0x1EE1,	%i7
	move	%xcc,	%i6,	%o7
	std	%f12,	[%l7 + 0x50]
	fpsub16	%f12,	%f8,	%f0
	movcc	%xcc,	%l4,	%o1
	movg	%icc,	%i3,	%l1
	ldub	[%l7 + 0x46],	%g5
	orn	%o5,	%l2,	%l6
	addccc	%g3,	0x1181,	%g6
	srax	%o3,	%i5,	%l0
	andn	%o2,	%l3,	%l5
	addc	%i2,	0x03D4,	%o4
	edge8l	%i4,	%g7,	%i1
	andcc	%g4,	0x108F,	%g1
	movpos	%xcc,	%g2,	%o0
	sra	%o6,	0x05,	%i0
	sub	%i7,	0x1CE9,	%i6
	ldsw	[%l7 + 0x74],	%o7
	and	%o1,	0x11CC,	%i3
	umulcc	%l1,	0x0416,	%l4
	mova	%icc,	%g5,	%l2
	fone	%f14
	fmovsneg	%icc,	%f14,	%f6
	ldd	[%l7 + 0x28],	%o4
	subccc	%l6,	%g6,	%o3
	movrgez	%g3,	0x2B3,	%i5
	movg	%xcc,	%o2,	%l0
	movcc	%icc,	%l3,	%l5
	std	%f12,	[%l7 + 0x30]
	st	%f12,	[%l7 + 0x78]
	andn	%i2,	%i4,	%o4
	xnor	%i1,	0x0A69,	%g4
	xnorcc	%g1,	%g2,	%o0
	restore %o6, 0x0F7F, %i0
	fnot1	%f6,	%f4
	movvs	%xcc,	%g7,	%i7
	sethi	0x0CB7,	%o7
	sllx	%o1,	%i6,	%i3
	fnot1s	%f5,	%f2
	move	%icc,	%l1,	%g5
	sethi	0x11C0,	%l2
	save %l4, 0x1900, %o5
	subc	%l6,	0x0F0A,	%o3
	movne	%icc,	%g6,	%i5
	addccc	%o2,	%l0,	%l3
	fcmpes	%fcc0,	%f2,	%f13
	array16	%l5,	%g3,	%i4
	udivcc	%o4,	0x04A9,	%i2
	lduh	[%l7 + 0x20],	%i1
	subccc	%g1,	0x157F,	%g2
	ldsh	[%l7 + 0x26],	%g4
	sdivx	%o6,	0x003F,	%i0
	xorcc	%o0,	0x1D03,	%i7
	movrgz	%g7,	0x162,	%o1
	lduh	[%l7 + 0x12],	%o7
	subcc	%i6,	0x189B,	%i3
	movre	%g5,	%l2,	%l4
	orcc	%o5,	%l6,	%l1
	andncc	%o3,	%i5,	%o2
	save %g6, %l3, %l0
	orn	%l5,	0x02A0,	%i4
	ldsh	[%l7 + 0x74],	%o4
	fmovsneg	%xcc,	%f10,	%f0
	sll	%i2,	%i1,	%g1
	movrlez	%g2,	%g4,	%g3
	movvc	%icc,	%o6,	%i0
	st	%f15,	[%l7 + 0x3C]
	fmul8ulx16	%f0,	%f6,	%f8
	movcs	%icc,	%i7,	%g7
	fone	%f10
	edge8l	%o1,	%o7,	%o0
	ldsh	[%l7 + 0x24],	%i6
	sdiv	%i3,	0x0A93,	%l2
	addc	%g5,	0x0207,	%l4
	fmovsl	%icc,	%f4,	%f0
	movneg	%icc,	%l6,	%o5
	umulcc	%o3,	0x16CE,	%i5
	and	%l1,	0x10DB,	%g6
	andcc	%o2,	%l0,	%l5
	lduh	[%l7 + 0x28],	%i4
	orcc	%o4,	0x09F5,	%l3
	mulscc	%i1,	0x03D7,	%g1
	movn	%xcc,	%g2,	%i2
	srlx	%g3,	%g4,	%i0
	fsrc2	%f4,	%f2
	alignaddr	%i7,	%g7,	%o1
	movcs	%icc,	%o6,	%o0
	fandnot1	%f14,	%f10,	%f4
	movrgez	%i6,	0x174,	%i3
	movrlez	%l2,	0x3DF,	%g5
	fmovsleu	%icc,	%f7,	%f1
	restore %l4, %o7, %o5
	movvs	%icc,	%l6,	%i5
	movrlez	%l1,	%o3,	%g6
	addc	%o2,	%l0,	%l5
	xor	%o4,	0x068F,	%l3
	sll	%i4,	0x1A,	%g1
	stx	%g2,	[%l7 + 0x60]
	srax	%i1,	%g3,	%g4
	ldx	[%l7 + 0x20],	%i2
	restore %i0, 0x031D, %i7
	array16	%g7,	%o6,	%o1
	movg	%icc,	%o0,	%i3
	fpadd32s	%f0,	%f6,	%f1
	sethi	0x190B,	%l2
	fmuld8sux16	%f15,	%f13,	%f10
	sll	%g5,	%l4,	%o7
	ldd	[%l7 + 0x60],	%o4
	fand	%f2,	%f4,	%f14
	fnand	%f0,	%f12,	%f6
	udiv	%i6,	0x01C6,	%i5
	umulcc	%l6,	0x1011,	%l1
	sdivx	%g6,	0x0434,	%o3
	stw	%l0,	[%l7 + 0x6C]
	array32	%l5,	%o4,	%l3
	fmovsvs	%xcc,	%f14,	%f8
	fmovdle	%xcc,	%f4,	%f13
	stx	%i4,	[%l7 + 0x38]
	stb	%g1,	[%l7 + 0x44]
	fmovdcc	%xcc,	%f0,	%f4
	stx	%g2,	[%l7 + 0x40]
	edge32n	%i1,	%g3,	%g4
	subc	%o2,	%i2,	%i7
	movneg	%xcc,	%g7,	%i0
	orncc	%o6,	0x1D35,	%o1
	fmovdn	%icc,	%f5,	%f2
	fmovdge	%icc,	%f7,	%f11
	subc	%o0,	0x03D2,	%i3
	xnor	%l2,	0x0CE4,	%l4
	movge	%xcc,	%o7,	%o5
	fors	%f10,	%f5,	%f2
	sdivx	%i6,	0x1DDB,	%i5
	st	%f14,	[%l7 + 0x50]
	andn	%g5,	0x1F94,	%l6
	edge8l	%g6,	%l1,	%l0
	edge8ln	%o3,	%l5,	%l3
	fpsub16	%f14,	%f10,	%f8
	fxnors	%f1,	%f8,	%f13
	edge32l	%o4,	%g1,	%g2
	fmovrse	%i1,	%f10,	%f5
	fmovrsne	%i4,	%f3,	%f12
	movrlz	%g4,	0x22A,	%g3
	fmovdge	%xcc,	%f11,	%f10
	udivx	%i2,	0x06F0,	%o2
	sethi	0x19E1,	%i7
	fornot1s	%f13,	%f14,	%f5
	movrlz	%i0,	%o6,	%o1
	andn	%o0,	%i3,	%g7
	udivx	%l2,	0x1638,	%o7
	stx	%l4,	[%l7 + 0x28]
	movn	%xcc,	%o5,	%i5
	ldsb	[%l7 + 0x0E],	%i6
	movn	%icc,	%g5,	%l6
	smul	%g6,	%l1,	%l0
	orncc	%l5,	0x1A5F,	%o3
	xnorcc	%o4,	%l3,	%g1
	movl	%icc,	%g2,	%i1
	popc	0x0317,	%i4
	st	%f6,	[%l7 + 0x1C]
	movrgz	%g4,	%g3,	%o2
	edge32n	%i2,	%i0,	%i7
	array32	%o1,	%o6,	%o0
	save %i3, %g7, %l2
	std	%f14,	[%l7 + 0x40]
	subccc	%o7,	0x18CF,	%o5
	sra	%l4,	0x16,	%i5
	ldsh	[%l7 + 0x52],	%g5
	edge16l	%l6,	%i6,	%g6
	sdivcc	%l1,	0x0274,	%l0
	movle	%icc,	%l5,	%o4
	movvs	%xcc,	%o3,	%l3
	fmovdle	%icc,	%f1,	%f6
	orncc	%g1,	0x06B7,	%i1
	movrgz	%g2,	0x120,	%g4
	fpsub16	%f14,	%f2,	%f0
	srlx	%i4,	0x0D,	%o2
	orn	%i2,	0x0CBD,	%i0
	stw	%i7,	[%l7 + 0x30]
	fpsub32s	%f15,	%f4,	%f10
	ldsh	[%l7 + 0x24],	%o1
	ldub	[%l7 + 0x15],	%g3
	sth	%o6,	[%l7 + 0x50]
	fmovdpos	%icc,	%f4,	%f7
	edge8ln	%i3,	%g7,	%o0
	udivx	%l2,	0x1A55,	%o5
	orncc	%o7,	%l4,	%g5
	std	%f12,	[%l7 + 0x08]
	mova	%xcc,	%l6,	%i6
	lduh	[%l7 + 0x64],	%g6
	edge32ln	%i5,	%l1,	%l5
	fandnot1	%f4,	%f6,	%f14
	mulx	%l0,	0x1085,	%o3
	orncc	%l3,	0x156B,	%g1
	edge8ln	%o4,	%g2,	%i1
	movn	%xcc,	%i4,	%o2
	movgu	%icc,	%g4,	%i2
	fsrc1	%f0,	%f12
	fnegd	%f8,	%f10
	stw	%i7,	[%l7 + 0x7C]
	fcmple32	%f0,	%f12,	%o1
	movrgz	%g3,	%o6,	%i3
	sethi	0x00DB,	%g7
	edge16ln	%i0,	%l2,	%o0
	movcc	%icc,	%o5,	%o7
	faligndata	%f14,	%f6,	%f10
	sra	%g5,	0x17,	%l4
	and	%i6,	0x0610,	%l6
	ldub	[%l7 + 0x59],	%g6
	addccc	%l1,	0x153C,	%i5
	fmovscs	%icc,	%f3,	%f2
	fmul8x16	%f5,	%f4,	%f0
	movle	%icc,	%l0,	%l5
	movvs	%icc,	%l3,	%o3
	sub	%g1,	%o4,	%g2
	ldsb	[%l7 + 0x75],	%i4
	movrgz	%i1,	%o2,	%i2
	edge16n	%i7,	%g4,	%o1
	fand	%f12,	%f6,	%f8
	edge32n	%g3,	%i3,	%o6
	andncc	%g7,	%l2,	%i0
	movrlz	%o0,	0x372,	%o7
	faligndata	%f2,	%f8,	%f8
	srlx	%o5,	%l4,	%g5
	restore %l6, 0x080D, %i6
	edge16ln	%l1,	%i5,	%g6
	smul	%l5,	0x06E3,	%l0
	sll	%o3,	%l3,	%g1
	orcc	%g2,	0x12E3,	%i4
	ldub	[%l7 + 0x0B],	%i1
	movn	%icc,	%o2,	%i2
	orncc	%i7,	0x09FB,	%g4
	stw	%o1,	[%l7 + 0x14]
	fmovdvc	%icc,	%f11,	%f0
	edge32ln	%o4,	%i3,	%o6
	smul	%g7,	0x1AD2,	%g3
	mulscc	%i0,	0x1146,	%o0
	sth	%l2,	[%l7 + 0x10]
	andn	%o5,	0x1F15,	%o7
	orncc	%l4,	%g5,	%l6
	edge16ln	%i6,	%l1,	%g6
	stx	%i5,	[%l7 + 0x38]
	edge8l	%l5,	%o3,	%l3
	fornot2s	%f0,	%f9,	%f13
	fmovsle	%xcc,	%f14,	%f3
	fnot2	%f6,	%f0
	movrne	%g1,	0x387,	%l0
	fornot2	%f12,	%f2,	%f8
	mulx	%i4,	0x0458,	%i1
	edge32	%o2,	%g2,	%i7
	udivx	%g4,	0x1CA8,	%o1
	subcc	%i2,	%i3,	%o6
	pdist	%f6,	%f4,	%f2
	ld	[%l7 + 0x28],	%f12
	stx	%o4,	[%l7 + 0x10]
	xor	%g7,	0x1377,	%i0
	st	%f15,	[%l7 + 0x20]
	save %g3, 0x0CBC, %l2
	fmovrsne	%o5,	%f2,	%f5
	ldsw	[%l7 + 0x14],	%o0
	movn	%xcc,	%l4,	%o7
	mova	%xcc,	%g5,	%l6
	edge8l	%l1,	%g6,	%i6
	edge8ln	%l5,	%o3,	%i5
	edge32l	%l3,	%g1,	%i4
	xnor	%l0,	%i1,	%o2
	fmuld8sux16	%f5,	%f4,	%f6
	fone	%f0
	udivx	%g2,	0x0027,	%i7
	ldx	[%l7 + 0x38],	%o1
	edge32ln	%g4,	%i3,	%o6
	andcc	%o4,	%i2,	%i0
	lduh	[%l7 + 0x3C],	%g7
	stx	%l2,	[%l7 + 0x30]
	alignaddr	%o5,	%o0,	%l4
	edge32	%o7,	%g3,	%g5
	fmovrdlz	%l1,	%f14,	%f8
	edge16n	%g6,	%l6,	%i6
	or	%o3,	%i5,	%l5
	movgu	%icc,	%l3,	%g1
	fmovrse	%l0,	%f3,	%f10
	srl	%i4,	%o2,	%g2
	movcc	%xcc,	%i7,	%i1
	sll	%o1,	%i3,	%o6
	fnot2s	%f2,	%f2
	xnor	%g4,	%i2,	%i0
	add	%g7,	%o4,	%o5
	std	%f6,	[%l7 + 0x38]
	fxnors	%f5,	%f9,	%f9
	restore %o0, %l4, %o7
	fmuld8sux16	%f9,	%f1,	%f14
	alignaddrl	%l2,	%g5,	%g3
	fmovsl	%icc,	%f15,	%f13
	ldsb	[%l7 + 0x2B],	%g6
	fornot1s	%f15,	%f11,	%f7
	edge16l	%l1,	%l6,	%o3
	fpsub32s	%f14,	%f1,	%f9
	movcs	%xcc,	%i6,	%i5
	fones	%f5
	udivcc	%l5,	0x197D,	%l3
	edge16l	%g1,	%l0,	%o2
	ldx	[%l7 + 0x70],	%i4
	fmovdcc	%icc,	%f12,	%f13
	xnor	%g2,	%i1,	%i7
	edge32ln	%o1,	%i3,	%o6
	array16	%i2,	%g4,	%i0
	fzeros	%f11
	mova	%xcc,	%g7,	%o5
	movne	%xcc,	%o4,	%l4
	movle	%icc,	%o7,	%l2
	xnor	%g5,	%g3,	%g6
	restore %o0, %l6, %o3
	fmovdn	%icc,	%f2,	%f15
	movvc	%icc,	%l1,	%i5
	udiv	%i6,	0x0CC7,	%l3
	movcc	%xcc,	%g1,	%l0
	fcmpeq32	%f0,	%f8,	%l5
	orcc	%i4,	%g2,	%i1
	edge32n	%i7,	%o2,	%i3
	orcc	%o6,	0x07AF,	%o1
	movl	%xcc,	%i2,	%i0
	sdiv	%g7,	0x1963,	%g4
	lduw	[%l7 + 0x4C],	%o4
	movvc	%icc,	%o5,	%l4
	movg	%icc,	%l2,	%g5
	mulscc	%o7,	%g6,	%g3
	edge8l	%l6,	%o0,	%o3
	udivcc	%i5,	0x0081,	%l1
	sllx	%i6,	%g1,	%l3
	stw	%l0,	[%l7 + 0x70]
	sth	%i4,	[%l7 + 0x50]
	mova	%xcc,	%l5,	%i1
	fmovrsgz	%i7,	%f8,	%f9
	popc	0x1E84,	%g2
	sdivcc	%i3,	0x134C,	%o2
	array8	%o6,	%o1,	%i0
	movl	%icc,	%i2,	%g7
	movvs	%xcc,	%o4,	%o5
	fmovrdlez	%l4,	%f10,	%f14
	movl	%xcc,	%l2,	%g5
	ldd	[%l7 + 0x40],	%o6
	sra	%g6,	%g3,	%l6
	srl	%g4,	%o3,	%i5
	fmovsvs	%icc,	%f15,	%f7
	edge32	%o0,	%i6,	%g1
	xorcc	%l1,	0x00DF,	%l0
	ldd	[%l7 + 0x68],	%l2
	sll	%i4,	0x1D,	%i1
	udivx	%i7,	0x0CAC,	%g2
	fpack32	%f0,	%f0,	%f12
	mulscc	%i3,	0x0C46,	%o2
	edge8ln	%o6,	%o1,	%i0
	movre	%l5,	%i2,	%o4
	sth	%o5,	[%l7 + 0x2E]
	edge32n	%l4,	%g7,	%l2
	sth	%g5,	[%l7 + 0x74]
	srax	%g6,	%o7,	%l6
	subcc	%g4,	%o3,	%g3
	srlx	%i5,	%i6,	%o0
	fmovdle	%xcc,	%f7,	%f13
	fexpand	%f11,	%f14
	xor	%g1,	%l0,	%l1
	sdivcc	%l3,	0x073E,	%i1
	lduw	[%l7 + 0x38],	%i7
	alignaddr	%g2,	%i3,	%i4
	fcmps	%fcc3,	%f13,	%f13
	sdivcc	%o6,	0x1B93,	%o1
	fmovsvc	%icc,	%f12,	%f5
	lduw	[%l7 + 0x0C],	%o2
	addcc	%i0,	0x1B7E,	%l5
	sdiv	%i2,	0x1A8A,	%o4
	ldx	[%l7 + 0x50],	%o5
	ldd	[%l7 + 0x20],	%l4
	stb	%g7,	[%l7 + 0x55]
	fandnot2s	%f10,	%f6,	%f4
	sll	%g5,	0x12,	%g6
	addccc	%l2,	0x051F,	%o7
	popc	%l6,	%g4
	and	%o3,	%g3,	%i5
	movleu	%icc,	%i6,	%o0
	movrlz	%g1,	%l1,	%l0
	movcc	%xcc,	%l3,	%i1
	subc	%g2,	%i3,	%i7
	lduh	[%l7 + 0x5C],	%i4
	fmovrdne	%o6,	%f4,	%f12
	fmovrdgz	%o1,	%f12,	%f4
	fandnot2	%f4,	%f2,	%f10
	andncc	%i0,	%l5,	%o2
	movn	%xcc,	%o4,	%o5
	popc	%l4,	%g7
	andn	%i2,	%g6,	%g5
	array16	%o7,	%l2,	%g4
	sdiv	%l6,	0x12DB,	%g3
	movcc	%icc,	%o3,	%i6
	addccc	%o0,	0x0F62,	%i5
	fmovd	%f0,	%f8
	fmovda	%xcc,	%f10,	%f1
	smul	%g1,	0x008F,	%l1
	movleu	%icc,	%l0,	%i1
	movne	%xcc,	%l3,	%g2
	movcs	%xcc,	%i3,	%i7
	sethi	0x1605,	%i4
	fmovrsgz	%o1,	%f7,	%f9
	fmovscs	%xcc,	%f4,	%f1
	alignaddrl	%o6,	%i0,	%l5
	lduw	[%l7 + 0x4C],	%o2
	edge32n	%o4,	%o5,	%g7
	restore %l4, %g6, %g5
	fmovsl	%xcc,	%f11,	%f5
	ldd	[%l7 + 0x78],	%o6
	fandnot2	%f6,	%f0,	%f0
	siam	0x4
	ldsb	[%l7 + 0x32],	%l2
	ldd	[%l7 + 0x48],	%i2
	edge32	%l6,	%g3,	%g4
	fmovdl	%icc,	%f12,	%f3
	sdivcc	%o3,	0x17C1,	%o0
	fmovrslz	%i5,	%f7,	%f15
	fxnors	%f10,	%f15,	%f0
	fmovdge	%xcc,	%f12,	%f3
	srax	%g1,	%i6,	%l0
	andcc	%l1,	0x0E59,	%i1
	andcc	%g2,	%l3,	%i3
	edge16l	%i4,	%i7,	%o6
	fmovrsgez	%o1,	%f11,	%f9
	movl	%icc,	%l5,	%i0
	fmovrsne	%o4,	%f5,	%f7
	edge16l	%o2,	%g7,	%o5
	edge8ln	%g6,	%l4,	%g5
	smulcc	%o7,	%l2,	%i2
	fmovsge	%xcc,	%f0,	%f4
	edge32n	%l6,	%g4,	%o3
	restore %o0, 0x1FBD, %i5
	movpos	%xcc,	%g1,	%g3
	ld	[%l7 + 0x4C],	%f10
	edge16l	%l0,	%l1,	%i1
	fmovsle	%icc,	%f4,	%f6
	array8	%i6,	%l3,	%i3
	lduw	[%l7 + 0x34],	%i4
	edge16l	%g2,	%i7,	%o1
	fpsub32s	%f14,	%f12,	%f15
	ldx	[%l7 + 0x68],	%o6
	fand	%f0,	%f2,	%f2
	fcmpes	%fcc0,	%f9,	%f1
	fmovdcc	%icc,	%f11,	%f15
	lduw	[%l7 + 0x50],	%i0
	addcc	%o4,	0x1205,	%l5
	fmul8x16	%f10,	%f4,	%f6
	sll	%g7,	0x03,	%o5
	ldsw	[%l7 + 0x18],	%o2
	subccc	%g6,	%l4,	%o7
	edge16n	%l2,	%i2,	%l6
	lduh	[%l7 + 0x4C],	%g4
	umul	%g5,	0x14A8,	%o3
	smul	%o0,	0x0622,	%i5
	and	%g1,	0x018A,	%g3
	edge8l	%l0,	%i1,	%l1
	subcc	%l3,	%i3,	%i4
	movcs	%xcc,	%g2,	%i7
	edge16l	%i6,	%o6,	%i0
	array8	%o4,	%l5,	%o1
	edge8l	%o5,	%o2,	%g6
	movrne	%l4,	0x0A2,	%o7
	mulscc	%l2,	0x0BB3,	%g7
	edge32ln	%l6,	%i2,	%g4
	edge16ln	%g5,	%o0,	%i5
	fmovdneg	%xcc,	%f13,	%f8
	ldd	[%l7 + 0x58],	%f6
	fpadd32	%f12,	%f12,	%f2
	orncc	%o3,	%g1,	%l0
	movrgz	%i1,	0x258,	%g3
	movleu	%icc,	%l1,	%l3
	fmovsne	%icc,	%f12,	%f9
	umulcc	%i3,	%g2,	%i7
	mulx	%i4,	0x11FE,	%i6
	sdivx	%o6,	0x0264,	%i0
	addccc	%l5,	%o1,	%o5
	mulx	%o2,	%g6,	%o4
	sethi	0x1C18,	%o7
	stx	%l2,	[%l7 + 0x18]
	popc	%l4,	%g7
	movleu	%xcc,	%l6,	%g4
	stx	%i2,	[%l7 + 0x30]
	fsrc2s	%f1,	%f5
	umulcc	%g5,	%o0,	%o3
	subcc	%g1,	0x10F5,	%i5
	sllx	%i1,	0x07,	%g3
	smul	%l0,	%l1,	%i3
	movl	%icc,	%g2,	%l3
	edge32l	%i4,	%i7,	%i6
	ld	[%l7 + 0x5C],	%f15
	edge32	%o6,	%i0,	%o1
	umulcc	%o5,	0x1B4A,	%o2
	for	%f2,	%f6,	%f0
	fnor	%f2,	%f10,	%f12
	std	%f8,	[%l7 + 0x20]
	and	%g6,	0x1F78,	%l5
	lduh	[%l7 + 0x38],	%o4
	fmovdneg	%icc,	%f10,	%f11
	edge16l	%l2,	%o7,	%g7
	xnor	%l4,	%g4,	%i2
	smulcc	%g5,	%o0,	%l6
	movrlz	%g1,	%o3,	%i5
	movvc	%xcc,	%g3,	%l0
	movcs	%icc,	%i1,	%l1
	movrne	%i3,	%g2,	%l3
	udivx	%i7,	0x01F9,	%i6
	movleu	%icc,	%i4,	%i0
	ldsh	[%l7 + 0x7A],	%o1
	mulx	%o6,	%o2,	%o5
	fones	%f9
	fmovspos	%xcc,	%f6,	%f5
	fnot1s	%f13,	%f8
	fmovrse	%g6,	%f10,	%f7
	mova	%icc,	%l5,	%l2
	mulscc	%o4,	%g7,	%l4
	edge16n	%g4,	%o7,	%i2
	edge16l	%g5,	%l6,	%o0
	array8	%g1,	%i5,	%o3
	sub	%l0,	0x1D77,	%g3
	srlx	%i1,	%l1,	%g2
	sethi	0x182C,	%l3
	fand	%f2,	%f6,	%f12
	sll	%i3,	%i7,	%i4
	array32	%i6,	%i0,	%o1
	mulx	%o2,	%o5,	%o6
	movl	%icc,	%l5,	%g6
	alignaddrl	%l2,	%o4,	%l4
	andn	%g4,	0x0BF3,	%o7
	xnorcc	%g7,	%i2,	%l6
	edge32ln	%g5,	%o0,	%i5
	alignaddr	%o3,	%g1,	%l0
	addccc	%i1,	%g3,	%g2
	mulscc	%l3,	%l1,	%i3
	fmovsa	%xcc,	%f0,	%f14
	fpadd16	%f0,	%f2,	%f0
	andn	%i4,	%i6,	%i7
	lduh	[%l7 + 0x1A],	%o1
	fandnot2	%f8,	%f10,	%f6
	sethi	0x1D2C,	%o2
	edge8n	%i0,	%o5,	%l5
	andcc	%g6,	0x1B4C,	%o6
	fsrc2	%f12,	%f0
	save %l2, 0x075B, %o4
	stx	%g4,	[%l7 + 0x68]
	sra	%o7,	%g7,	%l4
	movrlz	%l6,	0x08F,	%g5
	stx	%i2,	[%l7 + 0x20]
	ldub	[%l7 + 0x68],	%o0
	sethi	0x1617,	%i5
	movrlez	%o3,	0x1EB,	%l0
	mulscc	%i1,	%g1,	%g2
	addccc	%g3,	%l3,	%i3
	xorcc	%i4,	%i6,	%l1
	alignaddr	%o1,	%i7,	%o2
	movrlez	%i0,	%o5,	%l5
	ld	[%l7 + 0x48],	%f0
	fcmpes	%fcc1,	%f3,	%f6
	movne	%xcc,	%g6,	%l2
	andncc	%o4,	%g4,	%o6
	mova	%xcc,	%o7,	%g7
	movn	%icc,	%l4,	%g5
	fmovdge	%icc,	%f3,	%f0
	orn	%l6,	%i2,	%o0
	fmovrse	%o3,	%f8,	%f14
	fpsub16	%f4,	%f0,	%f0
	movn	%icc,	%i5,	%i1
	srax	%g1,	0x13,	%l0
	orn	%g3,	%l3,	%g2
	fmovdg	%icc,	%f9,	%f1
	array16	%i3,	%i4,	%i6
	mova	%icc,	%o1,	%l1
	fandnot1s	%f2,	%f1,	%f10
	movpos	%xcc,	%o2,	%i7
	fmovdvc	%xcc,	%f6,	%f8
	fmovdg	%xcc,	%f6,	%f1
	edge16	%i0,	%o5,	%g6
	fabss	%f8,	%f12
	movneg	%icc,	%l2,	%l5
	alignaddr	%g4,	%o4,	%o7
	sll	%o6,	0x16,	%l4
	fpack16	%f2,	%f11
	fmovspos	%icc,	%f2,	%f8
	fmovsne	%xcc,	%f0,	%f13
	srlx	%g7,	%l6,	%i2
	fabss	%f4,	%f5
	stx	%g5,	[%l7 + 0x58]
	array16	%o3,	%o0,	%i1
	movrne	%g1,	%l0,	%i5
	sth	%g3,	[%l7 + 0x64]
	fxors	%f14,	%f7,	%f14
	sll	%g2,	%i3,	%i4
	fones	%f11
	movleu	%icc,	%i6,	%l3
	addc	%o1,	0x099F,	%l1
	edge32n	%o2,	%i0,	%i7
	movcc	%xcc,	%o5,	%g6
	fmovsvc	%icc,	%f6,	%f2
	fmovrdgz	%l5,	%f0,	%f14
	edge8	%l2,	%o4,	%o7
	movpos	%xcc,	%g4,	%o6
	stx	%l4,	[%l7 + 0x08]
	subcc	%g7,	0x1019,	%l6
	fmovdle	%icc,	%f4,	%f11
	fmovrdne	%g5,	%f2,	%f8
	umul	%o3,	%o0,	%i2
	edge32l	%g1,	%i1,	%i5
	srax	%g3,	%l0,	%i3
	ldd	[%l7 + 0x78],	%g2
	array8	%i4,	%i6,	%o1
	movleu	%xcc,	%l3,	%l1
	edge16	%o2,	%i7,	%i0
	sub	%o5,	0x1BB9,	%g6
	edge8ln	%l5,	%l2,	%o4
	edge8l	%o7,	%o6,	%g4
	fcmpne32	%f0,	%f4,	%l4
	orncc	%g7,	%g5,	%o3
	xnor	%l6,	%o0,	%g1
	fmovsne	%xcc,	%f10,	%f12
	mulx	%i1,	0x0864,	%i5
	udiv	%i2,	0x07D5,	%g3
	umulcc	%i3,	0x04B1,	%g2
	movge	%xcc,	%i4,	%l0
	alignaddr	%o1,	%i6,	%l3
	movre	%l1,	%i7,	%i0
	ldsw	[%l7 + 0x38],	%o2
	popc	%g6,	%o5
	sub	%l5,	%l2,	%o4
	fmovdcs	%icc,	%f8,	%f1
	movvs	%xcc,	%o7,	%o6
	edge32n	%g4,	%g7,	%l4
	fsrc2	%f6,	%f8
	subccc	%o3,	%g5,	%l6
	edge16n	%o0,	%i1,	%i5
	xorcc	%i2,	0x1A9E,	%g3
	xnorcc	%g1,	%i3,	%i4
	movleu	%xcc,	%l0,	%o1
	mulx	%i6,	%g2,	%l1
	umul	%l3,	%i7,	%i0
	edge8	%g6,	%o2,	%o5
	fmul8x16al	%f1,	%f1,	%f2
	sth	%l2,	[%l7 + 0x10]
	fcmps	%fcc1,	%f8,	%f12
	alignaddr	%o4,	%l5,	%o6
	fpack32	%f8,	%f12,	%f10
	fmovrdgz	%g4,	%f10,	%f6
	mova	%xcc,	%g7,	%l4
	mulscc	%o7,	%o3,	%l6
	movgu	%icc,	%g5,	%o0
	addcc	%i1,	%i2,	%g3
	or	%i5,	0x1ACB,	%i3
	movl	%icc,	%i4,	%l0
	ldsh	[%l7 + 0x34],	%g1
	movvc	%icc,	%i6,	%o1
	movn	%icc,	%g2,	%l3
	movre	%i7,	%i0,	%g6
	fmovsl	%icc,	%f11,	%f1
	restore %l1, %o5, %l2
	addcc	%o2,	0x042C,	%l5
	udiv	%o6,	0x061A,	%g4
	fcmped	%fcc1,	%f6,	%f2
	fsrc2s	%f13,	%f11
	umul	%o4,	%l4,	%o7
	smulcc	%o3,	%g7,	%l6
	add	%o0,	%i1,	%g5
	ldub	[%l7 + 0x15],	%i2
	alignaddr	%g3,	%i5,	%i3
	movl	%xcc,	%i4,	%g1
	array8	%l0,	%o1,	%g2
	stb	%i6,	[%l7 + 0x1D]
	ld	[%l7 + 0x0C],	%f0
	edge16n	%i7,	%i0,	%g6
	fors	%f5,	%f7,	%f7
	edge16n	%l3,	%o5,	%l1
	siam	0x0
	ldsb	[%l7 + 0x1D],	%o2
	movn	%icc,	%l2,	%o6
	fabsd	%f0,	%f2
	fmul8x16au	%f1,	%f7,	%f6
	xnorcc	%l5,	0x02C2,	%o4
	movrne	%l4,	0x1FE,	%o7
	or	%g4,	%o3,	%l6
	save %g7, 0x00B1, %i1
	fmovrsne	%g5,	%f10,	%f14
	fmovdcs	%icc,	%f4,	%f13
	stb	%i2,	[%l7 + 0x68]
	edge16l	%g3,	%o0,	%i5
	movvs	%icc,	%i3,	%i4
	umul	%g1,	%l0,	%o1
	edge32l	%g2,	%i7,	%i0
	edge8n	%i6,	%l3,	%g6
	fmovde	%xcc,	%f6,	%f2
	andncc	%l1,	%o2,	%l2
	array32	%o6,	%l5,	%o4
	orn	%l4,	0x0F48,	%o7
	movg	%icc,	%o5,	%o3
	ldd	[%l7 + 0x20],	%i6
	ldd	[%l7 + 0x50],	%g6
	movne	%icc,	%g4,	%g5
	fpsub16s	%f6,	%f4,	%f1
	umul	%i1,	0x0419,	%g3
	movcc	%xcc,	%i2,	%o0
	ldx	[%l7 + 0x58],	%i5
	fmovrdlez	%i3,	%f12,	%f0
	move	%icc,	%g1,	%l0
	fmovsa	%xcc,	%f11,	%f15
	movvs	%icc,	%o1,	%i4
	edge16l	%g2,	%i0,	%i7
	fandnot2	%f14,	%f8,	%f12
	stb	%l3,	[%l7 + 0x1D]
	smul	%i6,	%l1,	%o2
	andn	%g6,	%l2,	%l5
	movrlez	%o4,	0x25F,	%o6
	fmovdvs	%xcc,	%f14,	%f15
	fxor	%f12,	%f8,	%f12
	edge32ln	%o7,	%l4,	%o5
	sdivx	%l6,	0x0457,	%o3
	stx	%g4,	[%l7 + 0x40]
	sdiv	%g7,	0x003A,	%g5
	sdivcc	%i1,	0x0F3B,	%g3
	fnot1s	%f14,	%f6
	array16	%o0,	%i5,	%i2
	ld	[%l7 + 0x64],	%f7
	fones	%f11
	ldsw	[%l7 + 0x0C],	%g1
	popc	%l0,	%i3
	fmuld8ulx16	%f0,	%f12,	%f6
	xnor	%o1,	0x1300,	%g2
	lduw	[%l7 + 0x0C],	%i4
	fpsub32s	%f11,	%f0,	%f1
	movrgz	%i7,	%l3,	%i6
	fnors	%f2,	%f1,	%f0
	movre	%i0,	0x314,	%o2
	fmovsne	%icc,	%f0,	%f8
	smul	%l1,	0x028B,	%l2
	edge16l	%g6,	%o4,	%o6
	xorcc	%o7,	%l4,	%l5
	fmovspos	%icc,	%f13,	%f8
	movrne	%o5,	%o3,	%l6
	lduh	[%l7 + 0x30],	%g4
	srl	%g7,	%g5,	%i1
	movcc	%xcc,	%o0,	%g3
	srlx	%i5,	0x1A,	%g1
	orncc	%i2,	0x0AC4,	%l0
	fcmpgt16	%f2,	%f0,	%o1
	srlx	%i3,	%g2,	%i7
	udiv	%l3,	0x19D4,	%i6
	fmovrse	%i0,	%f2,	%f6
	sdivcc	%o2,	0x1693,	%l1
	fmovdvs	%icc,	%f12,	%f5
	save %l2, 0x100F, %g6
	xorcc	%o4,	%o6,	%i4
	udivx	%o7,	0x1443,	%l4
	fmovdle	%xcc,	%f6,	%f14
	sub	%o5,	0x1658,	%l5
	array16	%o3,	%g4,	%l6
	ldsb	[%l7 + 0x27],	%g7
	srl	%i1,	%g5,	%g3
	stx	%i5,	[%l7 + 0x10]
	edge8n	%o0,	%g1,	%l0
	subc	%i2,	0x12A9,	%i3
	umul	%g2,	0x1729,	%i7
	andcc	%o1,	%l3,	%i6
	fmovda	%xcc,	%f6,	%f9
	edge16	%o2,	%i0,	%l1
	movvs	%icc,	%l2,	%g6
	udiv	%o4,	0x0BFC,	%i4
	mulx	%o7,	0x0BD8,	%l4
	movneg	%xcc,	%o6,	%l5
	edge8l	%o5,	%g4,	%l6
	andncc	%o3,	%g7,	%g5
	fmovdg	%icc,	%f13,	%f1
	udiv	%i1,	0x1ED9,	%g3
	sdiv	%i5,	0x18E3,	%o0
	save %l0, 0x1C42, %g1
	addc	%i2,	%i3,	%g2
	edge16n	%o1,	%i7,	%l3
	fnot1	%f12,	%f12
	fmovsneg	%xcc,	%f4,	%f10
	movle	%xcc,	%i6,	%o2
	save %l1, 0x0853, %l2
	srax	%g6,	%i0,	%o4
	restore %i4, 0x0A15, %o7
	edge32n	%l4,	%o6,	%l5
	orcc	%o5,	%l6,	%g4
	popc	0x1EE5,	%o3
	movpos	%xcc,	%g5,	%i1
	edge16	%g3,	%i5,	%g7
	bshuffle	%f6,	%f0,	%f8
	andncc	%o0,	%g1,	%i2
	umul	%i3,	%g2,	%l0
	movne	%icc,	%i7,	%o1
	srl	%l3,	0x04,	%o2
	ldsw	[%l7 + 0x30],	%l1
	restore %i6, 0x1D4E, %l2
	movl	%icc,	%i0,	%o4
	ldsb	[%l7 + 0x28],	%i4
	movre	%o7,	%g6,	%l4
	orn	%o6,	0x036D,	%l5
	orncc	%l6,	0x1D79,	%o5
	ldub	[%l7 + 0x7A],	%g4
	st	%f3,	[%l7 + 0x54]
	ldsb	[%l7 + 0x5B],	%g5
	fandnot2	%f10,	%f8,	%f14
	movle	%xcc,	%i1,	%o3
	or	%g3,	0x09B2,	%g7
	fsrc2	%f0,	%f4
	ldsb	[%l7 + 0x12],	%o0
	fnot1s	%f2,	%f9
	alignaddrl	%g1,	%i5,	%i2
	st	%f13,	[%l7 + 0x78]
	movl	%xcc,	%i3,	%l0
	fmuld8ulx16	%f12,	%f14,	%f0
	fornot1	%f12,	%f10,	%f10
	sethi	0x1988,	%g2
	fpsub32s	%f1,	%f15,	%f10
	orn	%o1,	%l3,	%i7
	movre	%l1,	%i6,	%o2
	movge	%icc,	%l2,	%i0
	movg	%xcc,	%i4,	%o4
	restore %g6, 0x1484, %l4
	edge8n	%o6,	%l5,	%o7
	sll	%o5,	%l6,	%g4
	movvs	%xcc,	%g5,	%i1
	udivx	%g3,	0x033A,	%o3
	subcc	%g7,	0x0101,	%g1
	fmovsn	%xcc,	%f2,	%f1
	edge8l	%o0,	%i2,	%i5
	fnors	%f11,	%f14,	%f12
	andcc	%i3,	0x1132,	%l0
	andncc	%o1,	%l3,	%g2
	srax	%i7,	%l1,	%i6
	fmovrse	%l2,	%f14,	%f4
	pdist	%f2,	%f0,	%f14
	movvs	%xcc,	%o2,	%i0
	movrne	%o4,	0x2DA,	%i4
	fcmple32	%f6,	%f2,	%g6
	movrgez	%o6,	0x244,	%l4
	stx	%l5,	[%l7 + 0x78]
	orn	%o5,	0x020D,	%o7
	fmovse	%icc,	%f1,	%f15
	movre	%l6,	0x32B,	%g5
	ldsw	[%l7 + 0x20],	%i1
	fmovscs	%xcc,	%f6,	%f9
	edge8l	%g4,	%o3,	%g7
	umulcc	%g1,	0x101D,	%g3
	fmovs	%f12,	%f11
	movrlz	%i2,	0x33E,	%i5
	xorcc	%o0,	%l0,	%o1
	movrgez	%l3,	0x0A0,	%i3
	pdist	%f10,	%f2,	%f12
	addcc	%g2,	0x1D9B,	%i7
	xor	%i6,	0x0C05,	%l2
	subccc	%l1,	0x1F1C,	%i0
	movrgz	%o4,	0x251,	%o2
	edge16	%i4,	%o6,	%l4
	and	%g6,	0x0F56,	%l5
	smulcc	%o7,	0x1C94,	%o5
	stx	%g5,	[%l7 + 0x38]
	udivx	%i1,	0x067E,	%l6
	subccc	%g4,	0x13C1,	%g7
	edge8ln	%o3,	%g3,	%g1
	ld	[%l7 + 0x18],	%f12
	movrne	%i2,	%i5,	%l0
	udivcc	%o0,	0x0224,	%o1
	xorcc	%l3,	0x007C,	%i3
	movle	%icc,	%i7,	%g2
	movvc	%xcc,	%l2,	%i6
	stx	%l1,	[%l7 + 0x60]
	sdivcc	%o4,	0x17C1,	%o2
	fcmpes	%fcc3,	%f12,	%f2
	umul	%i0,	0x07A0,	%o6
	movrgz	%l4,	0x180,	%i4
	sdiv	%g6,	0x1467,	%o7
	alignaddrl	%o5,	%l5,	%g5
	movneg	%icc,	%i1,	%l6
	movleu	%xcc,	%g7,	%o3
	udiv	%g4,	0x1A1E,	%g3
	stx	%i2,	[%l7 + 0x70]
	subcc	%i5,	%g1,	%l0
	movpos	%xcc,	%o1,	%o0
	xorcc	%i3,	%i7,	%l3
	movrgz	%l2,	%i6,	%l1
	xor	%g2,	%o2,	%i0
	fmovdcc	%xcc,	%f13,	%f1
	movcs	%icc,	%o6,	%l4
	edge8n	%i4,	%o4,	%g6
	alignaddr	%o5,	%l5,	%g5
	ldx	[%l7 + 0x08],	%i1
	fmovspos	%icc,	%f6,	%f11
	sdivcc	%l6,	0x0ED1,	%g7
	save %o3, 0x0C9C, %o7
	movn	%xcc,	%g4,	%g3
	edge32	%i2,	%i5,	%g1
	sdivcc	%l0,	0x0212,	%o1
	fzero	%f6
	ldub	[%l7 + 0x6C],	%i3
	sllx	%o0,	0x10,	%l3
	ldd	[%l7 + 0x40],	%l2
	ldsb	[%l7 + 0x53],	%i7
	fzeros	%f8
	fmovdgu	%icc,	%f15,	%f15
	mulx	%i6,	0x18A1,	%g2
	movg	%icc,	%l1,	%o2
	andcc	%i0,	0x1ACE,	%l4
	movgu	%xcc,	%o6,	%o4
	fmul8ulx16	%f8,	%f10,	%f2
	fcmpes	%fcc0,	%f5,	%f2
	movrlz	%i4,	0x0FE,	%o5
	sub	%l5,	0x02D7,	%g5
	smul	%i1,	0x07EA,	%l6
	ld	[%l7 + 0x20],	%f11
	movcs	%icc,	%g6,	%o3
	fones	%f2
	movge	%icc,	%g7,	%o7
	umul	%g3,	%i2,	%g4
	movge	%xcc,	%i5,	%g1
	fmovsle	%icc,	%f15,	%f1
	udiv	%o1,	0x0BBC,	%l0
	restore %o0, %l3, %i3
	fcmpne16	%f14,	%f14,	%l2
	andn	%i6,	0x13B6,	%g2
	movl	%icc,	%i7,	%l1
	ldsh	[%l7 + 0x4E],	%i0
	sdiv	%o2,	0x0E2F,	%l4
	sdivcc	%o4,	0x03BB,	%i4
	ldd	[%l7 + 0x28],	%f10
	andncc	%o6,	%l5,	%o5
	and	%i1,	%l6,	%g5
	edge32	%o3,	%g7,	%g6
	fmovrdlz	%o7,	%f12,	%f14
	add	%g3,	0x070A,	%i2
	udivcc	%i5,	0x09B0,	%g4
	move	%xcc,	%o1,	%g1
	edge16n	%o0,	%l3,	%i3
	mova	%icc,	%l0,	%l2
	subcc	%g2,	0x0073,	%i7
	addccc	%i6,	%i0,	%l1
	movrlez	%l4,	%o2,	%i4
	srlx	%o4,	0x03,	%l5
	edge32n	%o6,	%i1,	%l6
	subc	%o5,	%o3,	%g7
	lduh	[%l7 + 0x1E],	%g6
	edge32n	%o7,	%g5,	%g3
	fpsub16s	%f10,	%f7,	%f4
	sra	%i2,	0x13,	%i5
	fpadd16s	%f12,	%f0,	%f11
	xnorcc	%o1,	%g4,	%g1
	fmul8x16	%f10,	%f14,	%f8
	srl	%l3,	0x19,	%o0
	edge32n	%l0,	%i3,	%l2
	udiv	%g2,	0x1D86,	%i7
	edge32l	%i0,	%l1,	%i6
	sth	%o2,	[%l7 + 0x20]
	mulscc	%i4,	%o4,	%l4
	smul	%l5,	0x1356,	%i1
	sdivx	%l6,	0x0FFC,	%o5
	siam	0x4
	sth	%o6,	[%l7 + 0x14]
	sdivx	%g7,	0x0E75,	%o3
	fmovdl	%xcc,	%f1,	%f6
	srlx	%o7,	0x17,	%g5
	stw	%g3,	[%l7 + 0x3C]
	mova	%xcc,	%g6,	%i5
	fcmpes	%fcc2,	%f9,	%f12
	addc	%i2,	%o1,	%g1
	movcs	%icc,	%g4,	%l3
	fmovdg	%icc,	%f2,	%f5
	edge8n	%l0,	%i3,	%l2
	smul	%g2,	0x17D7,	%i7
	subccc	%i0,	%l1,	%o0
	addc	%i6,	%o2,	%o4
	mulx	%l4,	%i4,	%i1
	edge32ln	%l5,	%l6,	%o6
	fmovrdlez	%g7,	%f0,	%f10
	ldx	[%l7 + 0x08],	%o5
	fand	%f10,	%f10,	%f2
	ldd	[%l7 + 0x58],	%f2
	movge	%xcc,	%o7,	%g5
	orcc	%g3,	%g6,	%i5
	movl	%icc,	%o3,	%i2
	fmovrdlz	%g1,	%f6,	%f12
	smulcc	%o1,	0x0275,	%g4
	ldub	[%l7 + 0x7D],	%l3
	edge8ln	%l0,	%i3,	%g2
	movvc	%xcc,	%i7,	%i0
	addccc	%l2,	%l1,	%i6
	movleu	%xcc,	%o0,	%o4
	edge32ln	%l4,	%i4,	%i1
	edge8	%o2,	%l6,	%o6
	restore %g7, %o5, %l5
	popc	%g5,	%o7
	sethi	0x1A9B,	%g3
	udivx	%g6,	0x0EE8,	%o3
	edge8ln	%i5,	%i2,	%o1
	orncc	%g1,	%l3,	%g4
	addcc	%i3,	%l0,	%i7
	stx	%g2,	[%l7 + 0x40]
	fornot2s	%f0,	%f15,	%f1
	udivcc	%l2,	0x19B1,	%i0
	fnot2s	%f10,	%f12
	fpsub16s	%f4,	%f6,	%f4
	udiv	%l1,	0x10EC,	%i6
	lduw	[%l7 + 0x24],	%o0
	ldx	[%l7 + 0x40],	%l4
	edge32ln	%o4,	%i1,	%o2
	fmovrslez	%i4,	%f7,	%f5
	ld	[%l7 + 0x40],	%f9
	addc	%l6,	%g7,	%o5
	sth	%l5,	[%l7 + 0x60]
	subcc	%g5,	%o7,	%o6
	smulcc	%g3,	0x1C04,	%o3
	fmovd	%f10,	%f4
	sdiv	%i5,	0x011E,	%i2
	fmovse	%icc,	%f6,	%f4
	mova	%icc,	%g6,	%g1
	movrlez	%l3,	0x355,	%o1
	ldsh	[%l7 + 0x74],	%g4
	srax	%i3,	0x07,	%i7
	mova	%xcc,	%l0,	%g2
	movpos	%icc,	%l2,	%i0
	array16	%l1,	%i6,	%o0
	movge	%xcc,	%o4,	%i1
	movleu	%xcc,	%o2,	%i4
	andcc	%l6,	%g7,	%o5
	edge32ln	%l4,	%l5,	%o7
	srax	%g5,	0x08,	%o6
	movge	%icc,	%g3,	%i5
	ldsw	[%l7 + 0x38],	%o3
	stx	%g6,	[%l7 + 0x60]
	addcc	%i2,	%g1,	%l3
	movg	%xcc,	%g4,	%i3
	edge8l	%i7,	%o1,	%g2
	sdivx	%l2,	0x1E21,	%i0
	stw	%l1,	[%l7 + 0x44]
	ldub	[%l7 + 0x0C],	%l0
	fmovda	%xcc,	%f2,	%f8
	orn	%i6,	%o4,	%i1
	andn	%o2,	0x0561,	%i4
	or	%l6,	%o0,	%o5
	fmovdge	%icc,	%f12,	%f6
	movrlez	%g7,	0x19A,	%l5
	umulcc	%l4,	0x0F5F,	%g5
	udivx	%o6,	0x000F,	%o7
	fmul8x16au	%f0,	%f4,	%f6
	srlx	%g3,	0x1D,	%o3
	alignaddr	%i5,	%i2,	%g1
	movn	%icc,	%l3,	%g6
	fands	%f3,	%f12,	%f1
	mulscc	%i3,	%g4,	%i7
	stb	%o1,	[%l7 + 0x40]
	fmuld8ulx16	%f4,	%f4,	%f0
	udivx	%g2,	0x10DB,	%i0
	fmovrse	%l2,	%f7,	%f14
	array32	%l0,	%i6,	%l1
	srax	%i1,	0x08,	%o4
	edge8l	%o2,	%i4,	%o0
	edge16l	%o5,	%g7,	%l6
	udivx	%l5,	0x0885,	%g5
	fcmple32	%f8,	%f6,	%l4
	lduw	[%l7 + 0x74],	%o6
	ldd	[%l7 + 0x70],	%f4
	ldsw	[%l7 + 0x28],	%o7
	mulscc	%o3,	%g3,	%i2
	movrne	%g1,	0x250,	%i5
	edge16	%l3,	%g6,	%i3
	ldsb	[%l7 + 0x2A],	%i7
	udiv	%o1,	0x0919,	%g4
	orcc	%i0,	%l2,	%g2
	smul	%i6,	0x1F32,	%l0
	stw	%l1,	[%l7 + 0x18]
	fmovde	%icc,	%f10,	%f1
	andcc	%i1,	0x0BD5,	%o4
	edge8ln	%o2,	%i4,	%o5
	udivcc	%o0,	0x1F1C,	%g7
	or	%l5,	0x0DB9,	%l6
	array16	%l4,	%g5,	%o7
	edge16n	%o3,	%g3,	%i2
	addc	%o6,	0x18B8,	%i5
	ld	[%l7 + 0x58],	%f8
	fabsd	%f12,	%f0
	fmovsa	%icc,	%f13,	%f9
	ldsw	[%l7 + 0x50],	%l3
	smul	%g6,	%i3,	%g1
	ldsh	[%l7 + 0x6C],	%i7
	alignaddr	%g4,	%i0,	%l2
	umulcc	%g2,	%o1,	%i6
	fmovdn	%xcc,	%f10,	%f7
	xnorcc	%l0,	0x1E33,	%l1
	move	%icc,	%i1,	%o2
	sra	%o4,	0x18,	%o5
	fpack32	%f10,	%f10,	%f6
	lduh	[%l7 + 0x18],	%i4
	ldx	[%l7 + 0x10],	%g7
	fmovsvc	%icc,	%f14,	%f14
	xorcc	%o0,	0x022C,	%l6
	fmovsa	%xcc,	%f2,	%f13
	fcmpeq16	%f2,	%f6,	%l4
	faligndata	%f6,	%f2,	%f2
	fpsub32	%f6,	%f0,	%f4
	fmul8x16al	%f2,	%f9,	%f6
	move	%xcc,	%l5,	%o7
	fmovdcs	%xcc,	%f12,	%f8
	udivx	%g5,	0x105F,	%g3
	add	%i2,	%o3,	%o6
	sllx	%l3,	%g6,	%i5
	movne	%icc,	%i3,	%g1
	fmovdge	%xcc,	%f1,	%f8
	fmovsneg	%icc,	%f2,	%f6
	xorcc	%g4,	%i7,	%i0
	edge16l	%l2,	%g2,	%o1
	movvs	%icc,	%i6,	%l1
	fpsub32	%f2,	%f8,	%f12
	umulcc	%l0,	0x057E,	%i1
	movrlz	%o4,	%o2,	%i4
	ldsb	[%l7 + 0x71],	%o5
	movvs	%xcc,	%o0,	%l6
	movge	%icc,	%l4,	%l5
	std	%f14,	[%l7 + 0x60]
	fnegd	%f10,	%f2
	edge8ln	%g7,	%o7,	%g3
	andncc	%i2,	%o3,	%g5
	sra	%l3,	%g6,	%i5
	lduh	[%l7 + 0x0A],	%o6
	sdivcc	%i3,	0x1C60,	%g4
	lduh	[%l7 + 0x0E],	%i7
	edge16l	%i0,	%g1,	%g2
	orncc	%o1,	0x1F1A,	%i6
	andcc	%l2,	0x0723,	%l0
	and	%i1,	%l1,	%o2
	save %i4, %o5, %o4
	movg	%icc,	%l6,	%l4
	st	%f8,	[%l7 + 0x3C]
	movrgez	%o0,	%l5,	%g7
	xor	%g3,	%o7,	%i2
	orcc	%o3,	0x0692,	%l3
	sethi	0x1557,	%g6
	ldx	[%l7 + 0x70],	%i5
	smulcc	%g5,	%i3,	%g4
	umul	%i7,	0x0B2B,	%o6
	fmovdgu	%xcc,	%f12,	%f3
	xor	%g1,	%g2,	%i0
	srlx	%o1,	%i6,	%l0
	umul	%i1,	%l2,	%l1
	fmovrsne	%i4,	%f5,	%f13
	sth	%o2,	[%l7 + 0x12]
	ldx	[%l7 + 0x48],	%o5
	ldd	[%l7 + 0x60],	%f10
	movrgez	%l6,	0x16C,	%l4
	movge	%icc,	%o0,	%l5
	move	%icc,	%o4,	%g7
	andn	%g3,	0x02DD,	%o7
	ld	[%l7 + 0x18],	%f9
	fmovdl	%xcc,	%f9,	%f4
	fexpand	%f6,	%f0
	or	%o3,	0x02B7,	%i2
	fmovrdlz	%l3,	%f10,	%f12
	or	%i5,	0x13CC,	%g6
	movrgez	%i3,	0x201,	%g4
	edge8n	%i7,	%o6,	%g5
	and	%g1,	%i0,	%g2
	ldd	[%l7 + 0x50],	%o0
	fxnors	%f2,	%f2,	%f15
	andcc	%l0,	0x1C93,	%i1
	fmovdne	%xcc,	%f5,	%f9
	umulcc	%l2,	0x1D73,	%l1
	movge	%xcc,	%i6,	%i4
	lduh	[%l7 + 0x3E],	%o2
	addc	%o5,	0x06C3,	%l4
	udivx	%l6,	0x160F,	%o0
	sethi	0x0BBB,	%l5
	movleu	%xcc,	%g7,	%o4
	fmovrse	%o7,	%f8,	%f0
	andncc	%g3,	%i2,	%l3
	alignaddrl	%o3,	%i5,	%g6
	smulcc	%i3,	0x11ED,	%i7
	ldx	[%l7 + 0x30],	%g4
	sdiv	%g5,	0x1920,	%g1
	move	%xcc,	%i0,	%o6
	udivx	%g2,	0x1F2F,	%l0
	fabss	%f5,	%f8
	st	%f5,	[%l7 + 0x28]
	smulcc	%i1,	%o1,	%l1
	movrgz	%l2,	0x186,	%i6
	and	%o2,	%o5,	%i4
	ldx	[%l7 + 0x18],	%l6
	movle	%xcc,	%o0,	%l4
	fmovsge	%xcc,	%f13,	%f11
	addccc	%g7,	%o4,	%o7
	andncc	%l5,	%i2,	%g3
	edge16l	%l3,	%i5,	%o3
	lduw	[%l7 + 0x28],	%i3
	orncc	%g6,	0x1752,	%i7
	edge8n	%g4,	%g1,	%i0
	array32	%o6,	%g5,	%l0
	movle	%icc,	%g2,	%o1
	andncc	%i1,	%l2,	%i6
	smul	%l1,	0x1E5F,	%o2
	fcmps	%fcc3,	%f4,	%f4
	andn	%o5,	%l6,	%i4
	movleu	%xcc,	%l4,	%o0
	st	%f12,	[%l7 + 0x20]
	edge16l	%o4,	%g7,	%l5
	movcc	%xcc,	%o7,	%g3
	array32	%l3,	%i5,	%o3
	stx	%i3,	[%l7 + 0x38]
	udivcc	%i2,	0x141F,	%i7
	xnor	%g6,	0x1B60,	%g1
	fcmped	%fcc3,	%f12,	%f8
	subc	%g4,	%o6,	%i0
	st	%f14,	[%l7 + 0x48]
	fmovrsne	%l0,	%f10,	%f9
	fnor	%f12,	%f12,	%f14
	sdiv	%g5,	0x1D54,	%g2
	movn	%icc,	%o1,	%i1
	orncc	%l2,	%l1,	%i6
	save %o5, %o2, %i4
	andcc	%l6,	%o0,	%l4
	xnor	%g7,	%l5,	%o7
	edge16ln	%g3,	%l3,	%o4
	fmovsl	%icc,	%f0,	%f0
	movre	%o3,	%i3,	%i5
	movleu	%icc,	%i2,	%i7
	fmovdg	%icc,	%f3,	%f10
	stx	%g1,	[%l7 + 0x20]
	fands	%f0,	%f3,	%f13
	edge8n	%g6,	%o6,	%g4
	edge8	%l0,	%i0,	%g2
	xor	%o1,	%i1,	%g5
	fpadd16s	%f15,	%f6,	%f2
	fors	%f2,	%f0,	%f3
	movvc	%xcc,	%l1,	%i6
	udivx	%o5,	0x094F,	%o2
	edge8	%i4,	%l6,	%l2
	edge8ln	%o0,	%g7,	%l4
	fcmpd	%fcc2,	%f12,	%f14
	movle	%xcc,	%l5,	%o7
	movl	%icc,	%l3,	%o4
	save %g3, 0x1DC2, %i3
	srlx	%i5,	0x11,	%i2
	ldsw	[%l7 + 0x38],	%i7
	addc	%o3,	0x0F79,	%g1
	ldsb	[%l7 + 0x77],	%o6
	edge16	%g6,	%l0,	%g4
	lduh	[%l7 + 0x34],	%g2
	fmul8x16	%f6,	%f12,	%f10
	fmovrslez	%o1,	%f6,	%f9
	edge16n	%i0,	%g5,	%i1
	array8	%i6,	%o5,	%o2
	alignaddr	%l1,	%i4,	%l2
	srax	%l6,	0x05,	%g7
	mova	%xcc,	%o0,	%l5
	add	%l4,	0x1971,	%o7
	movleu	%xcc,	%l3,	%g3
	movneg	%icc,	%i3,	%i5
	movleu	%xcc,	%i2,	%o4
	movrgez	%o3,	%g1,	%i7
	stb	%g6,	[%l7 + 0x4B]
	stb	%o6,	[%l7 + 0x60]
	orncc	%l0,	0x0CF6,	%g4
	fors	%f9,	%f15,	%f9
	array16	%o1,	%g2,	%i0
	movneg	%icc,	%g5,	%i1
	movrlez	%i6,	0x04A,	%o2
	movcs	%xcc,	%o5,	%l1
	edge16ln	%i4,	%l2,	%g7
	edge8l	%l6,	%o0,	%l4
	save %o7, 0x1619, %l3
	move	%xcc,	%l5,	%g3
	movrgez	%i5,	%i3,	%i2
	fandnot2s	%f4,	%f9,	%f9
	ldsh	[%l7 + 0x26],	%o4
	fmovdvc	%xcc,	%f11,	%f14
	ldd	[%l7 + 0x50],	%f12
	st	%f5,	[%l7 + 0x24]
	sra	%g1,	%i7,	%o3
	fnot1	%f12,	%f2
	edge16	%o6,	%g6,	%l0
	subccc	%o1,	0x17CA,	%g2
	fmovrsgez	%g4,	%f5,	%f14
	movcs	%xcc,	%g5,	%i1
	fmovsg	%icc,	%f2,	%f11
	addc	%i6,	0x0A7C,	%i0
	fxnor	%f2,	%f10,	%f2
	fmovda	%xcc,	%f6,	%f9
	umul	%o2,	%o5,	%l1
	movn	%icc,	%l2,	%i4
	movrgz	%l6,	0x036,	%g7
	array32	%o0,	%o7,	%l4
	ld	[%l7 + 0x6C],	%f12
	edge16	%l3,	%g3,	%l5
	srax	%i5,	0x14,	%i2
	movrgez	%i3,	%o4,	%g1
	fcmpeq16	%f4,	%f0,	%o3
	movg	%icc,	%i7,	%o6
	stw	%l0,	[%l7 + 0x68]
	movneg	%icc,	%g6,	%g2
	subccc	%o1,	0x07B2,	%g4
	smul	%i1,	0x1EFB,	%g5
	fmovs	%f4,	%f12
	fxors	%f0,	%f12,	%f4
	movrne	%i0,	0x2C4,	%i6
	lduw	[%l7 + 0x5C],	%o5
	sra	%o2,	%l1,	%i4
	fmovrdgez	%l6,	%f0,	%f14
	mova	%icc,	%g7,	%o0
	smulcc	%l2,	%l4,	%o7
	udiv	%l3,	0x0B97,	%l5
	fcmple16	%f14,	%f4,	%g3
	movneg	%xcc,	%i2,	%i5
	ld	[%l7 + 0x48],	%f3
	sllx	%o4,	0x1C,	%i3
	edge8l	%o3,	%i7,	%g1
	fmovrslez	%o6,	%f8,	%f7
	std	%f6,	[%l7 + 0x60]
	edge32ln	%l0,	%g2,	%o1
	edge8ln	%g6,	%i1,	%g4
	movrne	%g5,	%i6,	%i0
	addcc	%o2,	0x0D9C,	%l1
	mulscc	%i4,	0x1702,	%l6
	movleu	%xcc,	%g7,	%o0
	movrlz	%l2,	0x262,	%l4
	edge16n	%o7,	%l3,	%o5
	sdivcc	%l5,	0x1AF5,	%g3
	fmovrsgz	%i2,	%f9,	%f3
	siam	0x5
	srlx	%o4,	0x0F,	%i5
	udivcc	%o3,	0x0A4F,	%i3
	andn	%i7,	0x0713,	%o6
	lduh	[%l7 + 0x10],	%l0
	movrgez	%g2,	0x010,	%g1
	st	%f8,	[%l7 + 0x08]
	st	%f7,	[%l7 + 0x0C]
	mulscc	%o1,	%i1,	%g4
	movgu	%xcc,	%g6,	%i6
	edge16	%g5,	%o2,	%i0
	ldd	[%l7 + 0x38],	%i4
	movvc	%xcc,	%l6,	%g7
	fmovde	%xcc,	%f9,	%f11
	ld	[%l7 + 0x38],	%f1
	fmovdge	%icc,	%f0,	%f2
	subcc	%o0,	0x1FBC,	%l2
	movrne	%l4,	%l1,	%o7
	sth	%l3,	[%l7 + 0x3C]
	edge8l	%l5,	%g3,	%i2
	ldub	[%l7 + 0x5E],	%o5
	edge32	%o4,	%o3,	%i5
	and	%i7,	0x0041,	%o6
	movrlez	%l0,	%g2,	%i3
	fmuld8ulx16	%f15,	%f8,	%f8
	movre	%o1,	0x030,	%i1
	fmovdne	%icc,	%f4,	%f7
	andcc	%g1,	%g6,	%i6
	fpmerge	%f4,	%f3,	%f14
	movrlez	%g5,	%g4,	%i0
	fnands	%f6,	%f12,	%f11
	ldsh	[%l7 + 0x7A],	%o2
	st	%f0,	[%l7 + 0x0C]
	xnor	%l6,	%i4,	%o0
	umulcc	%l2,	0x03E8,	%g7
	fmovdg	%icc,	%f9,	%f11
	subcc	%l1,	%l4,	%o7
	fxnor	%f6,	%f6,	%f0
	orn	%l5,	%l3,	%i2
	fmovda	%xcc,	%f15,	%f7
	alignaddr	%o5,	%o4,	%g3
	movvs	%icc,	%i5,	%i7
	movre	%o6,	%o3,	%l0
	udiv	%i3,	0x12EA,	%g2
	mulx	%o1,	%i1,	%g6
	orcc	%g1,	0x0D97,	%i6
	subc	%g4,	0x1DB4,	%i0
	edge8l	%g5,	%l6,	%i4
	fnands	%f7,	%f9,	%f3
	movgu	%icc,	%o0,	%o2
	ldsh	[%l7 + 0x12],	%g7
	andcc	%l2,	0x0F03,	%l1
	std	%f14,	[%l7 + 0x20]
	andn	%l4,	%l5,	%l3
	popc	0x1448,	%i2
	fmovde	%xcc,	%f15,	%f8
	addc	%o5,	%o7,	%g3
	movgu	%xcc,	%i5,	%o4
	movvs	%icc,	%i7,	%o3
	ldsh	[%l7 + 0x6A],	%l0
	alignaddr	%o6,	%g2,	%i3
	fnot1	%f10,	%f2
	sub	%i1,	%o1,	%g1
	ld	[%l7 + 0x20],	%f1
	movneg	%icc,	%i6,	%g6
	subc	%i0,	%g4,	%g5
	sdivx	%l6,	0x0A19,	%i4
	fmovsn	%icc,	%f11,	%f4
	fmovd	%f10,	%f8
	fcmpgt32	%f8,	%f12,	%o0
	fmovspos	%icc,	%f13,	%f10
	movrlz	%o2,	%l2,	%g7
	orn	%l1,	%l4,	%l5
	srl	%i2,	%o5,	%o7
	lduw	[%l7 + 0x08],	%l3
	std	%f10,	[%l7 + 0x18]
	movvs	%icc,	%g3,	%o4
	sllx	%i7,	%i5,	%l0
	andn	%o6,	%g2,	%i3
	ldd	[%l7 + 0x18],	%i0
	ldx	[%l7 + 0x68],	%o1
	alignaddrl	%o3,	%i6,	%g6
	movvc	%icc,	%i0,	%g1
	andncc	%g4,	%g5,	%l6
	ldsb	[%l7 + 0x19],	%o0
	movleu	%xcc,	%i4,	%o2
	sll	%l2,	0x15,	%g7
	ldub	[%l7 + 0x28],	%l1
	fpsub16s	%f10,	%f9,	%f3
	movn	%icc,	%l4,	%i2
	addcc	%l5,	0x17E3,	%o5
	alignaddrl	%l3,	%g3,	%o7
	fand	%f0,	%f14,	%f2
	addccc	%o4,	%i7,	%l0
	srlx	%o6,	%i5,	%i3
	andcc	%i1,	0x04D6,	%g2
	orcc	%o1,	%o3,	%i6
	edge16l	%g6,	%i0,	%g1
	sethi	0x0279,	%g4
	sll	%g5,	%o0,	%i4
	edge32ln	%o2,	%l2,	%g7
	udivx	%l1,	0x1D44,	%l6
	orncc	%i2,	%l4,	%o5
	st	%f10,	[%l7 + 0x50]
	fxors	%f13,	%f13,	%f13
	fors	%f9,	%f3,	%f15
	ld	[%l7 + 0x4C],	%f10
	stb	%l5,	[%l7 + 0x1A]
	fnot2	%f12,	%f6
	std	%f4,	[%l7 + 0x60]
	movrlz	%g3,	%o7,	%l3
	sth	%o4,	[%l7 + 0x2A]
	movge	%icc,	%i7,	%l0
	udiv	%o6,	0x0BBF,	%i3
	movrlz	%i5,	0x1C8,	%i1
	movrlz	%g2,	%o1,	%o3
	movvs	%xcc,	%i6,	%i0
	st	%f3,	[%l7 + 0x20]
	fmovd	%f4,	%f4
	fmovscs	%icc,	%f7,	%f6
	movrlez	%g6,	%g4,	%g5
	and	%o0,	%i4,	%o2
	fmovsvs	%icc,	%f3,	%f7
	fmul8x16	%f5,	%f4,	%f8
	udiv	%g1,	0x042D,	%g7
	movre	%l2,	%l6,	%i2
	orcc	%l4,	%o5,	%l1
	edge16l	%g3,	%o7,	%l3
	udivx	%o4,	0x017C,	%l5
	movne	%xcc,	%i7,	%o6
	umulcc	%i3,	0x1259,	%i5
	stw	%i1,	[%l7 + 0x6C]
	fmovrdgz	%l0,	%f14,	%f14
	fzero	%f2
	addc	%o1,	%g2,	%o3
	umul	%i0,	%i6,	%g6
	fandnot1s	%f0,	%f6,	%f13
	edge16ln	%g4,	%g5,	%o0
	sub	%i4,	%o2,	%g7
	edge8l	%g1,	%l6,	%l2
	fmovsneg	%xcc,	%f6,	%f13
	movle	%xcc,	%l4,	%i2
	umul	%o5,	%l1,	%g3
	fpack16	%f4,	%f0
	addc	%o7,	%o4,	%l3
	movcs	%icc,	%i7,	%l5
	array32	%i3,	%i5,	%o6
	fmovsge	%xcc,	%f10,	%f7
	xorcc	%i1,	0x1DD2,	%o1
	stb	%l0,	[%l7 + 0x48]
	movrgz	%g2,	%i0,	%o3
	xorcc	%g6,	%i6,	%g4
	fmovdvc	%xcc,	%f1,	%f2
	movrgz	%o0,	%g5,	%i4
	edge32n	%o2,	%g7,	%l6
	std	%f2,	[%l7 + 0x08]
	edge16l	%l2,	%l4,	%g1
	ldd	[%l7 + 0x78],	%i2
	smul	%l1,	%o5,	%g3
	movrgz	%o7,	%l3,	%o4
	movvc	%xcc,	%i7,	%l5
	fmovrsgez	%i5,	%f8,	%f15
	alignaddrl	%i3,	%o6,	%i1
	fandnot1s	%f10,	%f0,	%f10
	ldsb	[%l7 + 0x60],	%l0
	movne	%xcc,	%g2,	%i0
	sethi	0x1B70,	%o1
	ldd	[%l7 + 0x20],	%g6
	subc	%o3,	%g4,	%o0
	stb	%g5,	[%l7 + 0x5C]
	andn	%i4,	%i6,	%g7
	xnorcc	%l6,	%l2,	%o2
	umul	%l4,	%i2,	%l1
	save %g1, 0x0BAA, %o5
	orcc	%o7,	%g3,	%l3
	movcc	%icc,	%o4,	%l5
	add	%i7,	0x1EBB,	%i3
	movne	%xcc,	%i5,	%i1
	edge16ln	%o6,	%l0,	%g2
	ldsb	[%l7 + 0x3D],	%o1
	movneg	%xcc,	%g6,	%o3
	edge32ln	%i0,	%g4,	%o0
	edge32n	%i4,	%g5,	%i6
	movre	%l6,	0x10D,	%g7
	movneg	%xcc,	%o2,	%l4
	edge8l	%l2,	%l1,	%i2
	andn	%g1,	0x0255,	%o7
	array32	%o5,	%g3,	%o4
	fpmerge	%f11,	%f8,	%f14
	fone	%f0
	fnot1	%f10,	%f12
	ldub	[%l7 + 0x24],	%l5
	ld	[%l7 + 0x4C],	%f3
	sdivcc	%i7,	0x0462,	%l3
	addc	%i3,	%i5,	%o6
	edge32n	%i1,	%g2,	%o1
	movrgz	%l0,	0x2C6,	%o3
	edge8ln	%g6,	%i0,	%g4
	edge32ln	%o0,	%g5,	%i4
	sllx	%l6,	0x04,	%i6
	fmovdleu	%xcc,	%f10,	%f2
	orcc	%g7,	%o2,	%l4
	ld	[%l7 + 0x44],	%f12
	std	%f0,	[%l7 + 0x40]
	ldsb	[%l7 + 0x5A],	%l2
	udivcc	%l1,	0x1775,	%i2
	smulcc	%o7,	0x097A,	%g1
	ld	[%l7 + 0x44],	%f14
	andn	%g3,	%o5,	%l5
	movl	%icc,	%i7,	%l3
	movcs	%icc,	%o4,	%i3
	movl	%xcc,	%o6,	%i1
	movleu	%xcc,	%i5,	%g2
	sra	%o1,	0x02,	%o3
	alignaddrl	%g6,	%i0,	%g4
	udiv	%o0,	0x068F,	%l0
	smul	%i4,	%l6,	%i6
	and	%g5,	0x1D7B,	%o2
	edge16	%g7,	%l4,	%l2
	movrlz	%i2,	%l1,	%o7
	ld	[%l7 + 0x14],	%f0
	sdivcc	%g1,	0x0458,	%g3
	edge8l	%l5,	%o5,	%l3
	fors	%f4,	%f11,	%f15
	subccc	%o4,	%i7,	%o6
	fmovdgu	%xcc,	%f4,	%f14
	subccc	%i1,	0x04DF,	%i3
	add	%g2,	%o1,	%o3
	mova	%xcc,	%i5,	%g6
	add	%i0,	%g4,	%l0
	array32	%o0,	%i4,	%i6
	sdivcc	%g5,	0x175D,	%l6
	movvc	%icc,	%o2,	%g7
	movle	%xcc,	%l2,	%i2
	movg	%icc,	%l1,	%l4
	fmul8x16al	%f15,	%f11,	%f6
	umul	%g1,	0x18CF,	%g3
	andncc	%l5,	%o7,	%o5
	movrlz	%o4,	%l3,	%o6
	array16	%i1,	%i7,	%i3
	orn	%g2,	0x0F14,	%o1
	ldsw	[%l7 + 0x7C],	%i5
	restore %o3, %g6, %i0
	xnor	%g4,	0x0D50,	%o0
	fnot2s	%f8,	%f7
	ldx	[%l7 + 0x70],	%i4
	movvc	%icc,	%l0,	%g5
	movle	%icc,	%l6,	%o2
	fmovdcs	%icc,	%f15,	%f13
	xor	%i6,	0x1496,	%g7
	st	%f7,	[%l7 + 0x24]
	andcc	%i2,	%l1,	%l2
	udivx	%l4,	0x1BC2,	%g1
	movrgz	%g3,	%l5,	%o5
	fpsub32	%f10,	%f10,	%f2
	subccc	%o7,	%l3,	%o4
	xnor	%o6,	0x1217,	%i7
	edge32n	%i3,	%g2,	%o1
	ldsh	[%l7 + 0x64],	%i5
	mulx	%o3,	0x17B1,	%i1
	xor	%g6,	%i0,	%o0
	edge16	%i4,	%g4,	%l0
	srl	%l6,	0x15,	%g5
	fandnot2	%f12,	%f4,	%f14
	fpackfix	%f0,	%f4
	fmovrdlez	%i6,	%f2,	%f14
	addc	%o2,	0x14BA,	%i2
	fornot2	%f0,	%f10,	%f2
	movn	%xcc,	%g7,	%l1
	array8	%l4,	%g1,	%l2
	movrgz	%l5,	%g3,	%o7
	movge	%icc,	%l3,	%o4
	movge	%icc,	%o6,	%i7
	ldd	[%l7 + 0x38],	%o4
	movre	%g2,	0x070,	%o1
	ldsw	[%l7 + 0x7C],	%i5
	ldd	[%l7 + 0x30],	%f10
	array16	%i3,	%o3,	%g6
	sdivx	%i0,	0x0F7F,	%i1
	alignaddrl	%i4,	%g4,	%o0
	ldsw	[%l7 + 0x34],	%l0
	restore %l6, 0x00E0, %g5
	fmovdle	%xcc,	%f2,	%f8
	umul	%i6,	0x110B,	%o2
	ldd	[%l7 + 0x70],	%g6
	edge32n	%l1,	%i2,	%g1
	ldsh	[%l7 + 0x4C],	%l4
	edge8	%l5,	%l2,	%o7
	subccc	%g3,	%o4,	%l3
	movcs	%icc,	%i7,	%o6
	addccc	%o5,	0x0089,	%o1
	fmovse	%icc,	%f6,	%f4
	lduw	[%l7 + 0x34],	%i5
	fors	%f1,	%f14,	%f4
	fzero	%f12
	stx	%i3,	[%l7 + 0x30]
	ldd	[%l7 + 0x78],	%g2
	fnegd	%f10,	%f2
	fors	%f11,	%f6,	%f2
	or	%o3,	%g6,	%i0
	edge32ln	%i1,	%i4,	%g4
	move	%icc,	%l0,	%l6
	orncc	%o0,	%g5,	%i6
	stx	%g7,	[%l7 + 0x18]
	movge	%xcc,	%o2,	%l1
	movvc	%xcc,	%i2,	%g1
	sdivx	%l5,	0x1BC8,	%l4
	edge32ln	%l2,	%o7,	%g3
	ldd	[%l7 + 0x60],	%l2
	fones	%f9
	movrlz	%o4,	0x395,	%o6
	movvs	%xcc,	%i7,	%o5
	fcmpne32	%f8,	%f14,	%o1
	movpos	%icc,	%i3,	%g2
	fmovsgu	%xcc,	%f11,	%f8
	movrne	%o3,	%i5,	%i0
	mulscc	%g6,	0x1DA7,	%i4
	sth	%g4,	[%l7 + 0x22]
	movneg	%icc,	%l0,	%l6
	lduw	[%l7 + 0x64],	%o0
	popc	0x098B,	%i1
	fexpand	%f3,	%f4
	subccc	%i6,	%g5,	%o2
	orcc	%l1,	%g7,	%g1
	movrgz	%l5,	%i2,	%l4
	save %l2, 0x1B57, %g3
	movcs	%xcc,	%l3,	%o7
	std	%f14,	[%l7 + 0x28]
	ld	[%l7 + 0x14],	%f3
	st	%f4,	[%l7 + 0x38]
	fmovrde	%o6,	%f10,	%f12
	movcs	%icc,	%o4,	%i7
	movrgz	%o5,	%o1,	%i3
	ldx	[%l7 + 0x40],	%o3
	movn	%xcc,	%i5,	%i0
	fnand	%f12,	%f2,	%f10
	edge16l	%g6,	%i4,	%g2
	addc	%g4,	0x09A9,	%l6
	edge32ln	%o0,	%l0,	%i6
	movcc	%icc,	%i1,	%g5
	lduw	[%l7 + 0x14],	%o2
	fmuld8sux16	%f10,	%f5,	%f12
	movre	%g7,	0x30B,	%l1
	sra	%g1,	%l5,	%i2
	srl	%l2,	0x0E,	%l4
	sdivcc	%g3,	0x1DD0,	%l3
	subc	%o6,	%o7,	%o4
	sllx	%o5,	%o1,	%i3
	movrne	%i7,	%o3,	%i0
	stx	%g6,	[%l7 + 0x28]
	edge8	%i4,	%i5,	%g2
	st	%f6,	[%l7 + 0x48]
	fcmpgt32	%f6,	%f2,	%l6
	movneg	%xcc,	%o0,	%l0
	fmovrse	%i6,	%f9,	%f8
	fandnot2s	%f12,	%f12,	%f14
	sdiv	%g4,	0x0293,	%g5
	stb	%o2,	[%l7 + 0x59]
	movge	%xcc,	%i1,	%g7
	udiv	%g1,	0x06F4,	%l5
	fpadd32	%f10,	%f14,	%f14
	fpmerge	%f11,	%f3,	%f0
	fpack16	%f14,	%f3
	fmovsneg	%xcc,	%f1,	%f13
	movg	%xcc,	%l1,	%i2
	add	%l4,	0x1F78,	%l2
	fnot2s	%f15,	%f2
	st	%f1,	[%l7 + 0x50]
	mulx	%l3,	0x04CD,	%g3
	orcc	%o7,	0x130D,	%o4
	addcc	%o5,	%o6,	%o1
	subcc	%i3,	0x1E86,	%o3
	movpos	%icc,	%i0,	%i7
	fmuld8ulx16	%f0,	%f11,	%f12
	save %g6, 0x076C, %i4
	ldsb	[%l7 + 0x21],	%g2
	fnot1s	%f13,	%f11
	fpack16	%f0,	%f15
	smulcc	%l6,	%o0,	%i5
	srax	%l0,	0x11,	%g4
	addcc	%g5,	%i6,	%o2
	fornot1s	%f5,	%f4,	%f8
	movne	%icc,	%g7,	%i1
	movrgz	%g1,	0x0C4,	%l5
	andncc	%l1,	%l4,	%l2
	sdivcc	%l3,	0x16B1,	%g3
	andn	%i2,	0x1397,	%o7
	fpsub32	%f12,	%f12,	%f10
	movrgz	%o4,	%o5,	%o1
	srl	%o6,	0x10,	%o3
	mulx	%i3,	%i7,	%i0
	movrgez	%i4,	0x2AA,	%g2
	st	%f9,	[%l7 + 0x5C]
	stb	%g6,	[%l7 + 0x67]
	fpackfix	%f10,	%f11
	udiv	%o0,	0x18D9,	%i5
	edge16n	%l0,	%l6,	%g5
	orn	%g4,	%i6,	%g7
	fmovdcs	%icc,	%f9,	%f6
	andcc	%o2,	%i1,	%g1
	sth	%l1,	[%l7 + 0x10]
	fmovscs	%icc,	%f0,	%f6
	array16	%l4,	%l2,	%l5
	movle	%icc,	%l3,	%i2
	array16	%o7,	%g3,	%o4
	edge8l	%o1,	%o6,	%o5
	mulx	%i3,	%i7,	%i0
	edge32ln	%i4,	%o3,	%g6
	movrlez	%g2,	0x1BD,	%i5
	edge8l	%o0,	%l6,	%g5
	fpsub32	%f6,	%f2,	%f4
	udivcc	%l0,	0x06C5,	%g4
	udivx	%i6,	0x1B69,	%g7
	andncc	%o2,	%g1,	%i1
	movn	%icc,	%l4,	%l2
	andncc	%l1,	%l5,	%i2
	fmovsgu	%xcc,	%f13,	%f9
	smulcc	%l3,	%g3,	%o4
	udivx	%o1,	0x0458,	%o6
	smul	%o5,	%o7,	%i7
	or	%i3,	0x0985,	%i0
	sra	%i4,	0x16,	%g6
	edge16n	%o3,	%i5,	%g2
	alignaddrl	%l6,	%o0,	%l0
	fpsub32s	%f13,	%f2,	%f0
	edge16n	%g5,	%i6,	%g4
	udivcc	%g7,	0x1385,	%g1
	fmovdgu	%xcc,	%f11,	%f10
	lduh	[%l7 + 0x72],	%o2
	fpmerge	%f12,	%f12,	%f12
	std	%f12,	[%l7 + 0x08]
	ldd	[%l7 + 0x38],	%l4
	ldd	[%l7 + 0x78],	%i0
	fandnot2	%f12,	%f10,	%f8
	lduw	[%l7 + 0x20],	%l1
	edge16n	%l2,	%l5,	%l3
	alignaddr	%g3,	%o4,	%i2
	faligndata	%f8,	%f10,	%f6
	smulcc	%o1,	0x126E,	%o6
	movge	%xcc,	%o5,	%i7
	popc	%i3,	%o7
	sdivx	%i0,	0x0B5F,	%i4
	stw	%o3,	[%l7 + 0x7C]
	edge32ln	%g6,	%i5,	%l6
	xor	%g2,	%l0,	%g5
	movre	%i6,	%g4,	%o0
	xnor	%g1,	0x02EA,	%g7
	orn	%l4,	0x111D,	%i1
	sub	%o2,	0x1A4B,	%l1
	popc	%l5,	%l2
	movvc	%xcc,	%g3,	%l3
	lduw	[%l7 + 0x1C],	%o4
	ldsw	[%l7 + 0x20],	%o1
	movrne	%i2,	%o5,	%o6
	umul	%i3,	0x0142,	%o7
	or	%i7,	0x04F6,	%i4
	edge8ln	%i0,	%o3,	%g6
	srlx	%i5,	%g2,	%l6
	movl	%xcc,	%l0,	%i6
	fsrc1s	%f4,	%f13
	movg	%xcc,	%g5,	%o0
	fmovsleu	%xcc,	%f12,	%f10
	fmovdge	%icc,	%f3,	%f13
	ldd	[%l7 + 0x28],	%g4
	edge32n	%g1,	%g7,	%i1
	sdiv	%o2,	0x085F,	%l4
	orn	%l5,	%l1,	%g3
	restore %l3, %o4, %o1
	alignaddrl	%i2,	%l2,	%o6
	movneg	%xcc,	%o5,	%i3
	udivcc	%o7,	0x0CCE,	%i4
	smul	%i0,	%i7,	%o3
	smul	%i5,	0x1A3C,	%g6
	fornot1s	%f13,	%f15,	%f15
	movcs	%xcc,	%g2,	%l0
	fpadd16	%f12,	%f0,	%f14
	fornot2s	%f2,	%f3,	%f0
	edge32	%l6,	%g5,	%o0
	lduw	[%l7 + 0x28],	%i6
	ldsh	[%l7 + 0x08],	%g1
	orn	%g4,	%i1,	%g7
	udivcc	%l4,	0x030A,	%l5
	ldub	[%l7 + 0x09],	%o2
	srlx	%l1,	%l3,	%o4
	st	%f0,	[%l7 + 0x18]
	andcc	%g3,	%o1,	%l2
	ld	[%l7 + 0x20],	%f10
	srl	%o6,	%o5,	%i2
	or	%i3,	0x1657,	%i4
	movl	%icc,	%o7,	%i0
	fcmpes	%fcc2,	%f5,	%f0
	movl	%icc,	%i7,	%i5
	movle	%icc,	%g6,	%g2
	sll	%l0,	%l6,	%o3
	and	%o0,	%i6,	%g1
	xor	%g5,	%g4,	%i1
	or	%l4,	%g7,	%o2
	or	%l1,	%l5,	%o4
	fmovsleu	%icc,	%f7,	%f11
	restore %l3, 0x1F29, %g3
	andncc	%l2,	%o6,	%o5
	srl	%i2,	0x16,	%i3
	edge32	%i4,	%o7,	%o1
	fmul8x16al	%f10,	%f11,	%f14
	andcc	%i0,	%i7,	%g6
	lduh	[%l7 + 0x24],	%g2
	ldsh	[%l7 + 0x0C],	%l0
	fcmpeq32	%f6,	%f14,	%l6
	lduw	[%l7 + 0x7C],	%i5
	edge8n	%o3,	%i6,	%o0
	fmovdcc	%icc,	%f1,	%f8
	fmovrse	%g1,	%f8,	%f6
	stx	%g5,	[%l7 + 0x68]
	xorcc	%i1,	0x0126,	%g4
	fornot2	%f8,	%f14,	%f0
	array16	%g7,	%o2,	%l4
	sethi	0x16B9,	%l5
	fmovda	%xcc,	%f7,	%f11
	fmovscc	%xcc,	%f7,	%f11
	ldsh	[%l7 + 0x76],	%o4
	movneg	%xcc,	%l1,	%l3
	movpos	%xcc,	%l2,	%g3
	movleu	%icc,	%o5,	%i2
	srl	%i3,	0x07,	%o6
	movl	%icc,	%o7,	%i4
	lduw	[%l7 + 0x58],	%i0
	mova	%xcc,	%i7,	%o1
	movleu	%xcc,	%g6,	%g2
	fnot2s	%f10,	%f8
	add	%l6,	0x0D15,	%i5
	movrne	%l0,	%i6,	%o3
	andncc	%g1,	%g5,	%o0
	movne	%icc,	%i1,	%g4
	fpadd16s	%f4,	%f3,	%f10
	ldx	[%l7 + 0x38],	%o2
	lduh	[%l7 + 0x4E],	%l4
	sdiv	%l5,	0x0440,	%g7
	subcc	%o4,	0x0C2D,	%l3
	srl	%l2,	%l1,	%o5
	popc	0x0C4C,	%i2
	movre	%i3,	%o6,	%g3
	fnot2	%f14,	%f4
	orn	%o7,	0x0F3B,	%i0
	fmul8ulx16	%f2,	%f10,	%f12
	smulcc	%i7,	%o1,	%i4
	edge16l	%g6,	%l6,	%i5
	edge16	%l0,	%i6,	%g2
	udivcc	%g1,	0x1796,	%o3
	xorcc	%g5,	%i1,	%g4
	fmovrdne	%o2,	%f0,	%f8
	fmovdneg	%icc,	%f9,	%f2
	edge32l	%l4,	%l5,	%o0
	add	%o4,	0x1F67,	%l3
	ldub	[%l7 + 0x1C],	%l2
	move	%icc,	%l1,	%o5
	lduh	[%l7 + 0x36],	%g7
	edge16n	%i3,	%i2,	%o6
	fmovsa	%icc,	%f11,	%f4
	fmovspos	%xcc,	%f15,	%f14
	edge16l	%o7,	%i0,	%i7
	subcc	%g3,	0x0E24,	%o1
	array32	%i4,	%g6,	%i5
	and	%l6,	0x06FA,	%i6
	udivcc	%g2,	0x098D,	%l0
	umulcc	%o3,	0x0269,	%g1
	srlx	%g5,	%i1,	%g4
	st	%f11,	[%l7 + 0x08]
	sth	%l4,	[%l7 + 0x16]
	smulcc	%o2,	0x061E,	%l5
	xor	%o4,	0x1C70,	%o0
	movg	%icc,	%l3,	%l1
	udivx	%l2,	0x0020,	%g7
	movrlz	%i3,	0x1CB,	%i2
	orcc	%o5,	%o6,	%o7
	edge16ln	%i0,	%g3,	%o1
	bshuffle	%f6,	%f14,	%f2
	addcc	%i7,	%g6,	%i4
	edge16n	%i5,	%l6,	%i6
	faligndata	%f0,	%f2,	%f2
	andncc	%l0,	%o3,	%g1
	fmul8ulx16	%f8,	%f14,	%f4
	srlx	%g2,	0x1A,	%g5
	fcmpeq16	%f0,	%f10,	%i1
	restore %g4, %l4, %o2
	movleu	%xcc,	%l5,	%o4
	orn	%l3,	%o0,	%l2
	ldx	[%l7 + 0x18],	%l1
	movrlz	%i3,	%g7,	%o5
	xnorcc	%i2,	0x19D1,	%o6
	st	%f0,	[%l7 + 0x14]
	xnor	%o7,	0x1A92,	%g3
	movge	%xcc,	%o1,	%i0
	movpos	%xcc,	%g6,	%i4
	movvs	%xcc,	%i7,	%l6
	andn	%i6,	0x1E7A,	%l0
	movrne	%i5,	%o3,	%g2
	fmovsl	%icc,	%f13,	%f2
	fpsub32s	%f0,	%f4,	%f1
	fcmpgt32	%f12,	%f6,	%g5
	udivx	%g1,	0x0EB7,	%g4
	ldsb	[%l7 + 0x68],	%l4
	orn	%o2,	%i1,	%l5
	smulcc	%l3,	0x1E3E,	%o4
	popc	%o0,	%l1
	srax	%l2,	0x10,	%i3
	orncc	%o5,	0x0264,	%i2
	fcmpes	%fcc0,	%f5,	%f2
	ldub	[%l7 + 0x4F],	%o6
	movleu	%xcc,	%g7,	%o7
	fcmpd	%fcc3,	%f8,	%f12
	movrgz	%g3,	%i0,	%g6
	sdivx	%i4,	0x0A2C,	%i7
	ldub	[%l7 + 0x48],	%l6
	fmovdle	%icc,	%f0,	%f1
	andn	%i6,	0x0BB0,	%l0
	and	%i5,	%o1,	%g2
	save %g5, %o3, %g4
	movneg	%icc,	%g1,	%o2
	xorcc	%i1,	0x180C,	%l4
	edge32ln	%l3,	%o4,	%l5
	movle	%icc,	%o0,	%l1
	fmovrsgez	%i3,	%f12,	%f1
	fnand	%f10,	%f12,	%f2
	movrlez	%o5,	%l2,	%o6
	stb	%i2,	[%l7 + 0x3F]
	move	%icc,	%g7,	%o7
	movgu	%icc,	%g3,	%g6
	xnorcc	%i4,	%i7,	%i0
	fcmple16	%f0,	%f2,	%i6
	udivcc	%l6,	0x0183,	%l0
	or	%o1,	0x113F,	%g2
	xnor	%g5,	%i5,	%g4
	ldsw	[%l7 + 0x6C],	%g1
	movrgz	%o3,	0x020,	%o2
	movleu	%xcc,	%i1,	%l3
	andn	%o4,	%l4,	%l5
	fcmpne32	%f12,	%f12,	%o0
	movrgez	%l1,	0x011,	%i3
	movg	%xcc,	%o5,	%o6
	move	%xcc,	%l2,	%g7
	fpsub16s	%f3,	%f0,	%f6
	restore %i2, %o7, %g3
	movle	%xcc,	%g6,	%i7
	ldsb	[%l7 + 0x47],	%i4
	fmul8ulx16	%f14,	%f2,	%f12
	orncc	%i6,	0x0132,	%i0
	movn	%icc,	%l6,	%l0
	addc	%o1,	0x08D9,	%g2
	fmovscs	%icc,	%f6,	%f10
	edge16l	%g5,	%g4,	%i5
	fmovrdlez	%g1,	%f0,	%f14
	alignaddrl	%o2,	%o3,	%i1
	alignaddrl	%o4,	%l4,	%l3
	sdiv	%l5,	0x1EF9,	%l1
	ldx	[%l7 + 0x28],	%i3
	movl	%xcc,	%o0,	%o6
	or	%l2,	0x01F2,	%g7
	fzero	%f14
	fmovdvs	%xcc,	%f11,	%f4
	ldsw	[%l7 + 0x08],	%o5
	edge32ln	%i2,	%g3,	%o7
	fpadd32s	%f15,	%f8,	%f5
	xorcc	%g6,	0x07EE,	%i4
	fcmpes	%fcc2,	%f9,	%f5
	and	%i6,	%i0,	%i7
	movcs	%xcc,	%l6,	%o1
	andn	%l0,	0x1358,	%g5
	movvc	%xcc,	%g4,	%g2
	ldsh	[%l7 + 0x46],	%g1
	ldub	[%l7 + 0x70],	%i5
	movge	%xcc,	%o2,	%o3
	orncc	%o4,	0x0008,	%i1
	fpack32	%f6,	%f10,	%f14
	stw	%l3,	[%l7 + 0x70]
	move	%icc,	%l4,	%l5
	fcmple32	%f14,	%f4,	%l1
	fsrc2s	%f6,	%f0
	orncc	%o0,	0x02BD,	%i3
	ld	[%l7 + 0x48],	%f4
	ldsw	[%l7 + 0x08],	%o6
	movgu	%xcc,	%g7,	%l2
	fcmped	%fcc3,	%f2,	%f6
	add	%o5,	0x042F,	%i2
	movg	%icc,	%g3,	%g6
	ldx	[%l7 + 0x78],	%o7
	movl	%icc,	%i6,	%i0
	fnors	%f15,	%f6,	%f8
	fandnot2	%f12,	%f14,	%f10
	andncc	%i7,	%l6,	%o1
	ldsw	[%l7 + 0x28],	%i4
	xnor	%l0,	%g4,	%g2
	move	%xcc,	%g5,	%g1
	fnegs	%f11,	%f13
	add	%i5,	%o3,	%o4
	fnegd	%f0,	%f2
	movrgez	%i1,	0x0F6,	%o2
	fmovrdlez	%l3,	%f2,	%f8
	umulcc	%l5,	0x0D47,	%l4
	fsrc1	%f8,	%f0
	srax	%l1,	%i3,	%o0
	ldd	[%l7 + 0x10],	%f4
	movgu	%icc,	%o6,	%l2
	edge16n	%g7,	%i2,	%o5
	sdivx	%g3,	0x0212,	%o7
	stb	%g6,	[%l7 + 0x35]
	subcc	%i6,	%i0,	%l6
	ld	[%l7 + 0x30],	%f15
	udiv	%o1,	0x1152,	%i7
	movgu	%xcc,	%l0,	%g4
	addcc	%g2,	0x1813,	%g5
	mulx	%g1,	0x05EF,	%i4
	mulx	%o3,	%o4,	%i1
	srax	%o2,	%i5,	%l3
	stw	%l4,	[%l7 + 0x44]
	movre	%l1,	%l5,	%i3
	fpsub32s	%f2,	%f10,	%f10
	addcc	%o0,	0x1365,	%l2
	subc	%o6,	0x1D3F,	%i2
	sub	%g7,	%g3,	%o7
	fornot2	%f0,	%f14,	%f12
	movpos	%xcc,	%o5,	%i6
	addcc	%g6,	0x0D30,	%l6
	orcc	%o1,	%i0,	%l0
	siam	0x1
	edge32l	%i7,	%g2,	%g5
	subc	%g4,	0x0C2C,	%g1
	array8	%i4,	%o3,	%i1
	xnor	%o2,	0x1338,	%i5
	movrlez	%l3,	%o4,	%l4
	andn	%l5,	%l1,	%o0
	movcc	%xcc,	%i3,	%l2
	fmul8ulx16	%f2,	%f8,	%f8
	lduw	[%l7 + 0x18],	%i2
	fmovdvc	%xcc,	%f8,	%f6
	andcc	%o6,	0x13AE,	%g3
	ldub	[%l7 + 0x50],	%g7
	ldd	[%l7 + 0x38],	%f8
	fandnot2s	%f5,	%f12,	%f4
	srlx	%o7,	%i6,	%o5
	fandnot2	%f6,	%f2,	%f0
	umul	%g6,	%o1,	%i0
	edge32n	%l6,	%l0,	%i7
	edge16ln	%g2,	%g4,	%g5
	movne	%icc,	%i4,	%o3
	alignaddr	%i1,	%o2,	%i5
	fexpand	%f14,	%f4
	addccc	%g1,	%l3,	%o4
	fmovrsne	%l4,	%f0,	%f5
	movle	%icc,	%l5,	%l1
	movrgz	%i3,	%o0,	%i2
	edge8	%o6,	%l2,	%g3
	addcc	%g7,	0x0110,	%o7
	movneg	%icc,	%o5,	%g6
	mulx	%o1,	0x1977,	%i0
	ldx	[%l7 + 0x28],	%i6
	subccc	%l0,	%l6,	%g2
	edge16ln	%g4,	%i7,	%g5
	array32	%i4,	%i1,	%o2
	edge32	%i5,	%g1,	%o3
	fnot1s	%f13,	%f9
	fandnot1	%f8,	%f12,	%f12
	fmovrsgez	%l3,	%f1,	%f8
	alignaddrl	%l4,	%o4,	%l1
	fcmpgt32	%f6,	%f2,	%l5
	andcc	%o0,	%i3,	%o6
	movvs	%xcc,	%i2,	%g3
	edge32n	%l2,	%o7,	%o5
	sdivx	%g7,	0x11B5,	%o1
	ldsb	[%l7 + 0x46],	%i0
	orcc	%g6,	%l0,	%i6
	movrlez	%g2,	0x3CB,	%l6
	fmovdneg	%xcc,	%f0,	%f1
	sub	%g4,	0x06EE,	%g5
	edge8	%i7,	%i4,	%o2
	ldsw	[%l7 + 0x60],	%i1
	movrlez	%i5,	%o3,	%g1
	save %l3, %l4, %o4
	array8	%l5,	%o0,	%l1
	edge16	%o6,	%i2,	%i3
	xor	%g3,	%o7,	%l2
	std	%f8,	[%l7 + 0x28]
	fmovspos	%icc,	%f6,	%f14
	movvs	%icc,	%g7,	%o5
	xor	%i0,	%g6,	%o1
	movcc	%icc,	%l0,	%i6
	fcmps	%fcc0,	%f2,	%f7
	fcmpd	%fcc3,	%f4,	%f0
	array32	%l6,	%g4,	%g5
	movcc	%icc,	%g2,	%i7
	smul	%o2,	0x0666,	%i4
	array8	%i1,	%i5,	%g1
	xorcc	%l3,	%l4,	%o4
	and	%o3,	0x11BB,	%l5
	edge8	%o0,	%o6,	%l1
	array32	%i2,	%g3,	%o7
	alignaddrl	%i3,	%g7,	%l2
	movrgez	%o5,	0x073,	%g6
	movge	%icc,	%o1,	%l0
	subc	%i6,	%i0,	%l6
	fcmpeq16	%f6,	%f10,	%g4
	sethi	0x0EFF,	%g5
	edge8n	%g2,	%i7,	%i4
	orcc	%i1,	0x056E,	%i5
	sll	%o2,	%g1,	%l3
	edge16ln	%o4,	%l4,	%o3
	fmovdvs	%icc,	%f10,	%f1
	ld	[%l7 + 0x78],	%f8
	fcmpeq32	%f8,	%f8,	%o0
	lduw	[%l7 + 0x2C],	%o6
	array16	%l1,	%i2,	%l5
	fnor	%f2,	%f10,	%f2
	edge16ln	%g3,	%i3,	%o7
	edge8	%g7,	%o5,	%g6
	edge8ln	%l2,	%l0,	%i6
	movn	%xcc,	%i0,	%l6
	std	%f8,	[%l7 + 0x30]
	udivcc	%o1,	0x10B1,	%g5
	movg	%xcc,	%g4,	%i7
	movge	%xcc,	%i4,	%g2
	fmovdge	%icc,	%f6,	%f7
	fornot1s	%f3,	%f12,	%f12
	subc	%i5,	%i1,	%g1
	fmovdvc	%icc,	%f1,	%f1
	fornot1	%f14,	%f6,	%f0
	sll	%o2,	0x0D,	%o4
	sethi	0x15C5,	%l4
	xnorcc	%l3,	0x00AC,	%o3
	fsrc2s	%f0,	%f7
	bshuffle	%f4,	%f4,	%f2
	edge32	%o6,	%o0,	%l1
	movge	%xcc,	%l5,	%g3
	addcc	%i3,	%i2,	%g7
	subccc	%o5,	0x11CD,	%g6
	st	%f14,	[%l7 + 0x50]
	fmovscc	%icc,	%f10,	%f11
	fabsd	%f0,	%f6
	andncc	%l2,	%l0,	%o7
	edge8l	%i6,	%l6,	%i0
	stx	%o1,	[%l7 + 0x20]
	udiv	%g5,	0x1D14,	%i7
	ldd	[%l7 + 0x08],	%f4
	fxnors	%f9,	%f0,	%f12
	fmovdleu	%xcc,	%f9,	%f9
	movcs	%icc,	%g4,	%g2
	smulcc	%i5,	0x0D2C,	%i1
	subccc	%i4,	0x0B83,	%o2
	edge16	%g1,	%o4,	%l4
	fmovrslez	%l3,	%f15,	%f6
	fmovsneg	%icc,	%f6,	%f14
	stx	%o3,	[%l7 + 0x58]
	popc	0x09DB,	%o6
	fmovrdgz	%o0,	%f10,	%f0
	edge8n	%l5,	%g3,	%i3
	bshuffle	%f2,	%f8,	%f4
	umul	%l1,	%i2,	%o5
	movcc	%xcc,	%g7,	%l2
	fmovdvs	%xcc,	%f5,	%f14
	smulcc	%l0,	%g6,	%o7
	subc	%i6,	0x1829,	%l6
	fmovsge	%icc,	%f8,	%f7
	xnorcc	%o1,	%g5,	%i7
	ld	[%l7 + 0x6C],	%f1
	movrgez	%i0,	%g2,	%i5
	mulx	%i1,	%g4,	%o2
	fmovde	%xcc,	%f5,	%f10
	srax	%g1,	0x0A,	%o4
	sdivcc	%l4,	0x1E4F,	%l3
	movcc	%icc,	%i4,	%o3
	ldub	[%l7 + 0x1F],	%o0
	subcc	%o6,	0x08B8,	%g3
	fmul8sux16	%f12,	%f14,	%f4
	add	%i3,	0x170B,	%l5
	save %i2, %l1, %o5
	edge8l	%l2,	%l0,	%g7
	fandnot2s	%f6,	%f6,	%f0
	lduw	[%l7 + 0x7C],	%o7
	alignaddr	%g6,	%i6,	%l6
	xorcc	%g5,	0x0C14,	%o1
	fmovdg	%icc,	%f9,	%f7
	smul	%i0,	0x0F83,	%i7
	restore %i5, 0x10EE, %g2
	xor	%i1,	0x1D87,	%g4
	ldx	[%l7 + 0x20],	%g1
	subcc	%o2,	%o4,	%l3
	ldsb	[%l7 + 0x5A],	%i4
	fmovdvs	%icc,	%f5,	%f5
	move	%xcc,	%l4,	%o0
	movre	%o6,	%o3,	%i3
	restore %l5, %g3, %l1
	edge16ln	%i2,	%l2,	%l0
	fmovrslez	%o5,	%f15,	%f4
	udivx	%o7,	0x0503,	%g6
	edge8	%i6,	%l6,	%g5
	andcc	%g7,	0x1366,	%o1
	bshuffle	%f14,	%f2,	%f2
	subc	%i0,	%i7,	%g2
	array8	%i1,	%i5,	%g1
	fmul8x16	%f0,	%f4,	%f4
	fmovrsgez	%o2,	%f3,	%f12
	sra	%o4,	%l3,	%g4
	subccc	%i4,	0x13AB,	%l4
	fpadd16s	%f12,	%f2,	%f3
	subcc	%o6,	%o0,	%o3
	ldx	[%l7 + 0x18],	%i3
	movge	%xcc,	%l5,	%g3
	save %i2, %l1, %l2
	ldub	[%l7 + 0x3F],	%l0
	ldx	[%l7 + 0x50],	%o7
	ldd	[%l7 + 0x10],	%g6
	umulcc	%o5,	0x10A9,	%l6
	udiv	%g5,	0x1753,	%g7
	fmovsne	%icc,	%f11,	%f14
	or	%o1,	0x158A,	%i6
	fpack32	%f6,	%f8,	%f14
	fmovrsne	%i7,	%f8,	%f7
	srl	%i0,	%g2,	%i5
	fmovrdlez	%g1,	%f8,	%f14
	fpack32	%f6,	%f14,	%f12
	xor	%o2,	0x1DBE,	%i1
	fmovdcc	%icc,	%f13,	%f2
	fcmpgt16	%f2,	%f12,	%l3
	fmovsgu	%icc,	%f7,	%f6
	srax	%g4,	%o4,	%l4
	fmovsl	%xcc,	%f0,	%f13
	move	%icc,	%i4,	%o0
	fnor	%f6,	%f0,	%f10
	movrne	%o3,	%o6,	%l5
	movrne	%i3,	0x2AF,	%g3
	edge32	%i2,	%l1,	%l2
	movleu	%xcc,	%l0,	%g6
	xor	%o7,	%o5,	%l6
	ldd	[%l7 + 0x58],	%g4
	subcc	%g7,	%o1,	%i7
	fnot1s	%f2,	%f1
	movpos	%xcc,	%i0,	%g2
	andncc	%i6,	%g1,	%i5
	sethi	0x1045,	%o2
	ldd	[%l7 + 0x50],	%i0
	fornot2	%f8,	%f14,	%f10
	fmovdcs	%xcc,	%f5,	%f2
	fpsub16	%f12,	%f10,	%f8
	movvs	%xcc,	%g4,	%l3
	fmovsleu	%icc,	%f4,	%f2
	fcmpd	%fcc2,	%f8,	%f0
	srl	%l4,	%o4,	%o0
	udiv	%i4,	0x0C9B,	%o3
	fmovrsne	%o6,	%f10,	%f7
	fxors	%f3,	%f7,	%f2
	and	%i3,	%l5,	%i2
	orn	%l1,	0x0AA0,	%g3
	fnand	%f0,	%f10,	%f12
	movcs	%xcc,	%l0,	%l2
	umulcc	%o7,	0x0D48,	%g6
	umul	%l6,	0x00E9,	%o5
	sdivx	%g5,	0x0952,	%g7
	movge	%xcc,	%i7,	%i0
	smulcc	%o1,	%g2,	%i6
	fnands	%f2,	%f4,	%f0
	and	%i5,	0x060A,	%o2
	orn	%g1,	%i1,	%g4
	edge8	%l4,	%l3,	%o4
	movleu	%xcc,	%o0,	%i4
	xnorcc	%o6,	0x11C6,	%o3
	and	%l5,	%i3,	%i2
	fmovrsgz	%l1,	%f10,	%f0
	for	%f6,	%f2,	%f4
	orcc	%l0,	0x0804,	%l2
	save %o7, 0x1B43, %g6
	st	%f1,	[%l7 + 0x78]
	fnot2s	%f4,	%f2
	movge	%xcc,	%l6,	%g3
	edge32l	%o5,	%g7,	%g5
	edge32	%i7,	%o1,	%i0
	edge32l	%i6,	%i5,	%o2
	fnors	%f15,	%f12,	%f9
	array16	%g1,	%i1,	%g2
	movrgez	%g4,	0x3F5,	%l4
	subccc	%l3,	0x0D42,	%o4
	sllx	%o0,	0x0B,	%o6
	fnot2s	%f1,	%f4
	movl	%xcc,	%i4,	%l5
	fmovdgu	%xcc,	%f2,	%f1
	fmovrdgez	%o3,	%f12,	%f8
	array16	%i3,	%l1,	%l0
	sth	%i2,	[%l7 + 0x18]
	edge8n	%o7,	%l2,	%l6
	umul	%g3,	%o5,	%g6
	orn	%g5,	0x13F6,	%i7
	edge16ln	%g7,	%o1,	%i0
	fmovdgu	%icc,	%f13,	%f1
	std	%f12,	[%l7 + 0x30]
	fmovsneg	%icc,	%f13,	%f10
	add	%i6,	%i5,	%g1
	or	%i1,	0x199A,	%o2
	addcc	%g2,	0x0215,	%l4
	fone	%f0
	ldd	[%l7 + 0x40],	%g4
	umulcc	%l3,	0x1203,	%o4
	xor	%o0,	%i4,	%o6
	movre	%o3,	0x18E,	%l5
	andcc	%i3,	0x17A9,	%l0
	edge32	%i2,	%l1,	%l2
	andn	%l6,	%o7,	%g3
	movgu	%xcc,	%o5,	%g5
	st	%f8,	[%l7 + 0x14]
	fornot1s	%f8,	%f1,	%f14
	fnor	%f14,	%f6,	%f8
	move	%icc,	%i7,	%g6
	xnorcc	%g7,	0x0752,	%o1
	std	%f2,	[%l7 + 0x28]
	orcc	%i6,	0x045C,	%i0
	ld	[%l7 + 0x7C],	%f6
	faligndata	%f10,	%f0,	%f10
	or	%i5,	%g1,	%o2
	fmovdge	%icc,	%f0,	%f7
	sethi	0x1A1D,	%i1
	xnorcc	%g2,	%l4,	%l3
	fsrc2	%f8,	%f0
	movre	%o4,	0x38D,	%g4
	udiv	%i4,	0x0C69,	%o0
	or	%o3,	0x0CAD,	%l5
	edge32n	%o6,	%l0,	%i3
	stw	%l1,	[%l7 + 0x4C]
	movrlz	%l2,	%l6,	%o7
	movrne	%i2,	0x014,	%g3
	sdivcc	%g5,	0x00D2,	%i7
	smulcc	%o5,	%g6,	%o1
	fmovrslz	%i6,	%f1,	%f14
	fmovrslz	%i0,	%f8,	%f3
	fsrc2s	%f3,	%f7
	fnot2	%f10,	%f10
	or	%g7,	%i5,	%g1
	xnor	%i1,	%g2,	%l4
	movne	%xcc,	%l3,	%o4
	addc	%o2,	0x1400,	%g4
	ldd	[%l7 + 0x70],	%i4
	movre	%o3,	0x12E,	%l5
	and	%o6,	0x1500,	%l0
	edge32	%o0,	%l1,	%l2
	movge	%icc,	%i3,	%o7
	ldub	[%l7 + 0x45],	%i2
	fcmped	%fcc1,	%f8,	%f6
	xnorcc	%g3,	0x1428,	%l6
	fmovdneg	%xcc,	%f5,	%f9
	ldsb	[%l7 + 0x62],	%g5
	mulscc	%o5,	0x0B46,	%i7
	lduh	[%l7 + 0x46],	%g6
	fmovdgu	%icc,	%f12,	%f2
	fnegs	%f6,	%f14
	andncc	%o1,	%i6,	%i0
	movre	%g7,	0x2E2,	%g1
	movre	%i5,	%i1,	%g2
	movge	%icc,	%l4,	%o4
	fmovsa	%icc,	%f12,	%f2
	stb	%o2,	[%l7 + 0x71]
	fmovrslez	%g4,	%f5,	%f12
	movrne	%i4,	%o3,	%l5
	array16	%o6,	%l3,	%o0
	movrlz	%l0,	0x3BD,	%l2
	fnot1	%f4,	%f12
	ldx	[%l7 + 0x60],	%l1
	sub	%o7,	0x0277,	%i3
	srax	%i2,	%g3,	%g5
	fmovdleu	%xcc,	%f11,	%f3
	fzeros	%f9
	mova	%xcc,	%o5,	%l6
	ldsb	[%l7 + 0x35],	%i7
	edge32n	%g6,	%i6,	%i0
	udivcc	%g7,	0x0522,	%g1
	sra	%o1,	0x15,	%i1
	movvc	%xcc,	%i5,	%g2
	st	%f2,	[%l7 + 0x10]
	movne	%xcc,	%l4,	%o2
	movneg	%xcc,	%g4,	%i4
	alignaddrl	%o3,	%l5,	%o4
	array16	%o6,	%o0,	%l0
	fmovsvc	%xcc,	%f3,	%f4
	std	%f12,	[%l7 + 0x38]
	orn	%l2,	0x1543,	%l3
	smul	%l1,	0x03AF,	%i3
	addcc	%i2,	%o7,	%g3
	sdivcc	%g5,	0x1D44,	%o5
	movrne	%i7,	0x088,	%l6
	fcmpne32	%f8,	%f10,	%i6
	sub	%i0,	0x19D6,	%g6
	udiv	%g1,	0x1FD5,	%g7
	fnand	%f6,	%f12,	%f8
	ldsb	[%l7 + 0x36],	%o1
	srl	%i5,	%g2,	%i1
	movrne	%o2,	0x3A6,	%l4
	fmovdg	%icc,	%f3,	%f13
	ldd	[%l7 + 0x10],	%f12
	stb	%g4,	[%l7 + 0x13]
	fornot1s	%f14,	%f8,	%f12
	ldsb	[%l7 + 0x71],	%o3
	mulx	%i4,	%o4,	%l5
	xnorcc	%o0,	%l0,	%l2
	or	%l3,	%o6,	%l1
	movleu	%xcc,	%i2,	%o7
	edge8ln	%i3,	%g3,	%g5
	st	%f13,	[%l7 + 0x6C]
	lduh	[%l7 + 0x3C],	%o5
	movre	%i7,	0x0E7,	%i6
	udiv	%i0,	0x05EE,	%l6
	mulscc	%g6,	0x1413,	%g7
	ldub	[%l7 + 0x0D],	%g1
	movrlz	%i5,	%o1,	%g2
	mova	%xcc,	%o2,	%i1
	sub	%g4,	%l4,	%o3
	movcs	%icc,	%i4,	%l5
	ldd	[%l7 + 0x08],	%f10
	movleu	%xcc,	%o0,	%l0
	ldd	[%l7 + 0x78],	%f8
	ldd	[%l7 + 0x70],	%f8
	movle	%icc,	%o4,	%l3
	save %l2, 0x0C25, %o6
	fnors	%f14,	%f10,	%f15
	bshuffle	%f4,	%f0,	%f12
	ldsh	[%l7 + 0x6A],	%l1
	fabsd	%f0,	%f8
	sub	%o7,	%i2,	%i3
	movvs	%icc,	%g5,	%g3
	movge	%icc,	%i7,	%o5
	edge8l	%i0,	%i6,	%g6
	alignaddrl	%g7,	%g1,	%l6
	sllx	%i5,	%g2,	%o1
	fcmpgt16	%f14,	%f6,	%o2
	edge16	%i1,	%l4,	%o3
	ldsw	[%l7 + 0x6C],	%i4
	fsrc1s	%f8,	%f13
	movgu	%icc,	%l5,	%o0
	udiv	%l0,	0x156A,	%o4
	fmovrdgez	%l3,	%f14,	%f14
	movrgez	%l2,	%o6,	%g4
	andn	%l1,	0x11C8,	%o7
	lduw	[%l7 + 0x50],	%i2
	xorcc	%g5,	%g3,	%i3
	mulscc	%o5,	%i7,	%i0
	movpos	%icc,	%g6,	%g7
	fmovrdlez	%i6,	%f8,	%f14
	fmovdcc	%icc,	%f15,	%f0
	fpsub32s	%f0,	%f14,	%f5
	udivx	%g1,	0x10CF,	%l6
	movne	%icc,	%i5,	%g2
	fmul8x16au	%f2,	%f12,	%f8
	udiv	%o1,	0x04F2,	%o2
	alignaddrl	%i1,	%l4,	%i4
	and	%o3,	0x0164,	%o0
	ld	[%l7 + 0x40],	%f13
	movcs	%icc,	%l0,	%o4
	fmovrdgez	%l3,	%f2,	%f6
	edge8ln	%l5,	%l2,	%g4
	ldd	[%l7 + 0x28],	%o6
	umul	%o7,	%i2,	%g5
	movl	%icc,	%l1,	%g3
	sth	%o5,	[%l7 + 0x26]
	addc	%i7,	0x152C,	%i0
	movre	%g6,	0x336,	%g7
	addc	%i3,	%i6,	%l6
	movne	%icc,	%i5,	%g1
	udivcc	%o1,	0x1E1C,	%g2
	fnegd	%f14,	%f10
	edge16	%i1,	%o2,	%i4
	sdiv	%o3,	0x00AB,	%l4
	edge16n	%o0,	%o4,	%l0
	sth	%l3,	[%l7 + 0x56]
	fmovdle	%xcc,	%f1,	%f9
	fmuld8ulx16	%f4,	%f11,	%f10
	sdivx	%l2,	0x0731,	%g4
	ldub	[%l7 + 0x51],	%l5
	srax	%o6,	0x08,	%o7
	udiv	%g5,	0x1C6D,	%i2
	popc	0x1C01,	%g3
	srlx	%l1,	0x01,	%o5
	edge32l	%i7,	%g6,	%i0
	movn	%icc,	%i3,	%i6
	fornot1	%f12,	%f14,	%f8
	movvc	%xcc,	%l6,	%i5
	sdivcc	%g1,	0x0583,	%o1
	fnot1	%f4,	%f10
	udiv	%g7,	0x04EF,	%i1
	ldsh	[%l7 + 0x76],	%g2
	popc	%i4,	%o2
	edge32ln	%l4,	%o3,	%o0
	sllx	%l0,	%l3,	%l2
	fmovsneg	%xcc,	%f12,	%f10
	subc	%g4,	0x16D0,	%l5
	restore %o6, 0x0132, %o7
	edge16	%o4,	%g5,	%i2
	or	%g3,	0x11E4,	%o5
	or	%l1,	%g6,	%i0
	fpsub32s	%f5,	%f9,	%f14
	umulcc	%i3,	%i7,	%i6
	fmovdleu	%xcc,	%f12,	%f7
	sdivcc	%i5,	0x1425,	%g1
	fornot2	%f12,	%f14,	%f0
	fmul8sux16	%f8,	%f8,	%f8
	orcc	%o1,	%l6,	%g7
	movgu	%icc,	%g2,	%i1
	mulscc	%i4,	0x0A34,	%l4
	fmovdpos	%xcc,	%f13,	%f15
	fmovrse	%o3,	%f12,	%f14
	alignaddrl	%o0,	%o2,	%l3
	fpsub16s	%f10,	%f2,	%f11
	edge32ln	%l2,	%l0,	%l5
	edge32l	%g4,	%o7,	%o6
	addc	%g5,	0x17DA,	%o4
	fcmpeq32	%f12,	%f10,	%i2
	movn	%icc,	%g3,	%l1
	sdivx	%o5,	0x1A40,	%i0
	smul	%i3,	%g6,	%i7
	fcmpne16	%f2,	%f12,	%i6
	andn	%i5,	%g1,	%o1
	fmovrslez	%l6,	%f8,	%f1
	udiv	%g7,	0x06A0,	%g2
	fors	%f9,	%f14,	%f15
	edge16ln	%i4,	%i1,	%l4
	movleu	%xcc,	%o3,	%o2
	fcmpeq16	%f8,	%f6,	%o0
	ldub	[%l7 + 0x2D],	%l2
	ldub	[%l7 + 0x0B],	%l3
	add	%l0,	0x1AA6,	%l5
	fnot1	%f0,	%f6
	array16	%o7,	%g4,	%g5
	array8	%o4,	%o6,	%g3
	ld	[%l7 + 0x3C],	%f6
	ldub	[%l7 + 0x58],	%i2
	udiv	%o5,	0x0965,	%l1
	xnor	%i0,	%g6,	%i7
	sllx	%i6,	0x05,	%i3
	save %i5, %o1, %g1
	edge8	%l6,	%g2,	%i4
	ldd	[%l7 + 0x70],	%f4
	fand	%f6,	%f6,	%f4
	fpadd32	%f14,	%f12,	%f12
	sethi	0x05D5,	%i1
	ldub	[%l7 + 0x41],	%l4
	movrgz	%o3,	%o2,	%g7
	edge32l	%o0,	%l2,	%l3
	movcs	%xcc,	%l5,	%l0
	udivx	%g4,	0x025C,	%g5
	movgu	%icc,	%o4,	%o7
	fcmpeq32	%f14,	%f8,	%o6
	restore %g3, %i2, %o5
	orncc	%l1,	%g6,	%i7
	fmovrse	%i6,	%f1,	%f9
	fmul8x16al	%f7,	%f9,	%f0
	movrgez	%i3,	%i0,	%o1
	edge32l	%g1,	%l6,	%g2
	edge32n	%i4,	%i5,	%i1
	fsrc1	%f2,	%f8
	sdivx	%o3,	0x07DA,	%o2
	fmovdle	%icc,	%f7,	%f7
	ldx	[%l7 + 0x40],	%l4
	restore %g7, 0x01B4, %o0
	andcc	%l2,	%l3,	%l5
	fmovsne	%icc,	%f14,	%f6
	fmovrdne	%l0,	%f4,	%f14
	xnor	%g4,	0x14B9,	%g5
	umulcc	%o7,	%o6,	%g3
	fmovrslez	%o4,	%f4,	%f6
	fors	%f0,	%f8,	%f14
	andncc	%o5,	%l1,	%i2
	movre	%g6,	0x088,	%i6
	movrgz	%i7,	%i3,	%o1
	orn	%i0,	0x0267,	%g1
	ldd	[%l7 + 0x18],	%f10
	restore %g2, 0x10EB, %i4
	movleu	%xcc,	%i5,	%l6
	edge32l	%i1,	%o2,	%o3
	std	%f10,	[%l7 + 0x78]
	std	%f4,	[%l7 + 0x20]
	subcc	%l4,	%o0,	%l2
	orcc	%l3,	%g7,	%l5
	stw	%g4,	[%l7 + 0x38]
	mulx	%g5,	%l0,	%o6
	array16	%g3,	%o4,	%o7
	fornot1	%f8,	%f0,	%f4
	edge16	%o5,	%l1,	%g6
	movpos	%xcc,	%i2,	%i7
	edge16l	%i3,	%o1,	%i0
	ld	[%l7 + 0x20],	%f0
	fnot2s	%f4,	%f1
	edge32	%i6,	%g2,	%g1
	sdiv	%i5,	0x13BA,	%i4
	orncc	%l6,	0x0B4F,	%o2
	fzero	%f10
	st	%f4,	[%l7 + 0x4C]
	fmovrsgz	%i1,	%f3,	%f12
	ldub	[%l7 + 0x75],	%l4
	fmovdg	%xcc,	%f12,	%f12
	addccc	%o0,	0x0431,	%l2
	addcc	%o3,	0x0CDD,	%g7
	sdivcc	%l3,	0x0AD1,	%l5
	fmovs	%f15,	%f13
	fpadd16s	%f8,	%f10,	%f0
	or	%g5,	0x01AE,	%g4
	movcc	%xcc,	%l0,	%o6
	fmovrsgez	%o4,	%f10,	%f10
	xnor	%g3,	%o5,	%o7
	mova	%icc,	%l1,	%g6
	st	%f4,	[%l7 + 0x44]
	orcc	%i2,	0x0730,	%i3
	movrgz	%o1,	0x0DA,	%i0
	smul	%i7,	0x06F0,	%g2
	edge32n	%g1,	%i6,	%i4
	and	%i5,	%l6,	%o2
	fmovrsgez	%i1,	%f11,	%f0
	array16	%o0,	%l4,	%o3
	restore %g7, %l3, %l5
	std	%f0,	[%l7 + 0x10]
	fmovsa	%xcc,	%f15,	%f10
	mova	%xcc,	%l2,	%g4
	popc	%l0,	%g5
	fones	%f8
	array8	%o4,	%g3,	%o5
	edge32ln	%o6,	%o7,	%g6
	fmul8x16al	%f5,	%f9,	%f2
	srlx	%l1,	%i3,	%o1
	ldd	[%l7 + 0x60],	%f12
	fmul8x16	%f5,	%f12,	%f8
	stb	%i0,	[%l7 + 0x32]
	addccc	%i7,	%g2,	%i2
	sra	%i6,	0x1B,	%g1
	faligndata	%f14,	%f8,	%f0
	edge32n	%i5,	%l6,	%i4
	fcmpeq16	%f14,	%f6,	%o2
	array32	%o0,	%i1,	%o3
	mulx	%l4,	0x0D0C,	%g7
	fmovdcc	%icc,	%f15,	%f2
	fpack32	%f8,	%f6,	%f4
	edge16	%l5,	%l2,	%l3
	sethi	0x18E5,	%l0
	movg	%xcc,	%g4,	%o4
	sra	%g3,	0x1D,	%g5
	umul	%o5,	0x050F,	%o7
	restore %g6, %o6, %i3
	movcs	%icc,	%o1,	%l1
	fmovdneg	%xcc,	%f0,	%f13
	stx	%i7,	[%l7 + 0x38]
	fabsd	%f6,	%f14
	udivx	%g2,	0x1DBD,	%i2
	array16	%i0,	%g1,	%i6
	edge8n	%i5,	%i4,	%o2
	fmovrde	%o0,	%f10,	%f12
	srl	%i1,	%l6,	%l4
	srax	%o3,	0x16,	%g7
	movvc	%icc,	%l5,	%l3
	sdivcc	%l2,	0x18EF,	%g4
	fzeros	%f11
	stb	%l0,	[%l7 + 0x64]
	ldd	[%l7 + 0x58],	%o4
	movcs	%xcc,	%g3,	%g5
	ldd	[%l7 + 0x30],	%o6
	or	%o5,	%g6,	%i3
	movl	%icc,	%o6,	%l1
	movre	%o1,	%g2,	%i7
	lduw	[%l7 + 0x2C],	%i2
	fmovrse	%g1,	%f6,	%f4
	ldsw	[%l7 + 0x4C],	%i0
	ldsw	[%l7 + 0x28],	%i5
	stb	%i4,	[%l7 + 0x0B]
	edge32	%i6,	%o2,	%i1
	fands	%f4,	%f2,	%f1
	andcc	%o0,	%l4,	%o3
	ld	[%l7 + 0x30],	%f1
	movneg	%icc,	%g7,	%l6
	subc	%l5,	%l3,	%l2
	mulx	%l0,	0x00FA,	%g4
	xor	%g3,	0x1BFA,	%g5
	xorcc	%o7,	%o5,	%g6
	fmovdneg	%xcc,	%f10,	%f5
	smul	%o4,	%o6,	%l1
	orncc	%i3,	%g2,	%i7
	lduh	[%l7 + 0x36],	%i2
	sth	%o1,	[%l7 + 0x18]
	stw	%g1,	[%l7 + 0x58]
	movcs	%xcc,	%i5,	%i0
	fmovsgu	%icc,	%f10,	%f3
	fmul8x16al	%f4,	%f6,	%f0
	add	%i4,	0x0F4D,	%o2
	movg	%xcc,	%i6,	%o0
	mulscc	%i1,	0x0033,	%o3
	sub	%g7,	0x09C7,	%l6
	fmovspos	%xcc,	%f13,	%f10
	srl	%l4,	%l5,	%l3
	addcc	%l2,	%g4,	%l0
	sth	%g3,	[%l7 + 0x68]
	stx	%o7,	[%l7 + 0x48]
	siam	0x4
	addc	%o5,	%g6,	%g5
	movle	%xcc,	%o6,	%o4
	fmovsvc	%xcc,	%f2,	%f1
	edge16ln	%l1,	%i3,	%i7
	sllx	%i2,	%o1,	%g2
	array8	%g1,	%i5,	%i0
	edge8l	%o2,	%i6,	%o0
	movleu	%xcc,	%i4,	%i1
	movl	%icc,	%g7,	%o3
	fpadd32	%f14,	%f6,	%f8
	fnot1s	%f12,	%f12
	fmovdcc	%icc,	%f6,	%f3
	srl	%l4,	%l5,	%l6
	save %l2, 0x1779, %l3
	bshuffle	%f8,	%f12,	%f0
	fcmpes	%fcc0,	%f12,	%f3
	fcmpgt32	%f8,	%f12,	%l0
	stx	%g4,	[%l7 + 0x20]
	movrlz	%o7,	0x0B4,	%o5
	smul	%g6,	0x0A61,	%g5
	lduh	[%l7 + 0x26],	%o6
	andn	%g3,	%o4,	%l1
	umulcc	%i7,	0x1D5C,	%i2
	sdivcc	%i3,	0x0EC8,	%o1
	ldd	[%l7 + 0x50],	%f8
	ldsw	[%l7 + 0x1C],	%g1
	movrlez	%g2,	%i5,	%o2
	ldub	[%l7 + 0x21],	%i6
	fmovrdgez	%o0,	%f10,	%f2
	fmovrslez	%i4,	%f14,	%f11
	movcc	%xcc,	%i1,	%g7
	ldd	[%l7 + 0x78],	%o2
	stx	%i0,	[%l7 + 0x28]
	fmul8sux16	%f2,	%f0,	%f8
	pdist	%f14,	%f6,	%f6
	fmovsgu	%icc,	%f0,	%f10
	edge8n	%l4,	%l5,	%l6
	sllx	%l2,	%l3,	%g4
	movneg	%xcc,	%o7,	%l0
	udivcc	%o5,	0x1554,	%g5
	fandnot2	%f14,	%f0,	%f8
	lduh	[%l7 + 0x08],	%g6
	fnors	%f8,	%f7,	%f4
	addccc	%o6,	%g3,	%o4
	fnegs	%f5,	%f4
	movleu	%icc,	%i7,	%l1
	fcmpgt32	%f14,	%f14,	%i2
	xnor	%i3,	0x0A31,	%g1
	subc	%g2,	%o1,	%o2
	edge32l	%i6,	%i5,	%i4
	save %i1, %o0, %g7
	ldsb	[%l7 + 0x6B],	%i0
	stw	%o3,	[%l7 + 0x6C]
	ldsw	[%l7 + 0x28],	%l4
	umul	%l6,	0x1BC4,	%l2
	movvs	%xcc,	%l3,	%l5
	movvs	%icc,	%o7,	%l0
	movleu	%xcc,	%g4,	%g5
	srl	%o5,	0x1F,	%o6
	fmovrse	%g3,	%f6,	%f1
	fsrc2	%f8,	%f14
	array32	%o4,	%g6,	%l1
	fmul8x16al	%f12,	%f9,	%f14
	sdivcc	%i7,	0x0639,	%i2
	movrgz	%g1,	%g2,	%o1
	fpadd32s	%f13,	%f0,	%f0
	movrgz	%i3,	%o2,	%i6
	fmovrdgez	%i5,	%f0,	%f4
	xnorcc	%i4,	%o0,	%g7
	fpadd32	%f8,	%f12,	%f2
	fmovsge	%xcc,	%f2,	%f1
	orncc	%i1,	%i0,	%l4
	ldub	[%l7 + 0x36],	%l6
	movpos	%xcc,	%o3,	%l2
	fmovdl	%icc,	%f10,	%f1
	movneg	%icc,	%l3,	%l5
	movrgez	%o7,	%l0,	%g4
	array32	%o5,	%g5,	%o6
	orncc	%o4,	%g6,	%g3
	movle	%icc,	%l1,	%i7
	edge8	%i2,	%g1,	%o1
	fmovse	%xcc,	%f13,	%f13
	fmovdvs	%xcc,	%f9,	%f15
	ldsh	[%l7 + 0x1C],	%g2
	sll	%o2,	0x02,	%i6
	fmovrsgez	%i3,	%f10,	%f10
	movrlz	%i5,	%o0,	%g7
	ldub	[%l7 + 0x19],	%i1
	popc	%i0,	%l4
	smulcc	%l6,	%o3,	%l2
	fpack16	%f14,	%f6
	edge8ln	%l3,	%i4,	%o7
	array16	%l0,	%l5,	%g4
	fandnot2	%f2,	%f10,	%f6
	fandnot1s	%f1,	%f9,	%f12
	smul	%o5,	%o6,	%o4
	xnorcc	%g5,	%g6,	%l1
	fmovdvs	%icc,	%f1,	%f10
	movcc	%icc,	%i7,	%g3
	edge16l	%g1,	%o1,	%i2
	move	%xcc,	%g2,	%o2
	subccc	%i3,	%i5,	%i6
	edge16ln	%o0,	%g7,	%i1
	sllx	%l4,	0x06,	%l6
	umulcc	%o3,	0x1FFF,	%l2
	movrgz	%l3,	%i0,	%i4
	sth	%l0,	[%l7 + 0x1C]
	popc	0x1DE2,	%o7
	array32	%l5,	%g4,	%o5
	fmovsvs	%xcc,	%f12,	%f14
	for	%f14,	%f8,	%f2
	sdivx	%o6,	0x1FB1,	%g5
	fsrc2	%f0,	%f14
	std	%f8,	[%l7 + 0x50]
	sth	%o4,	[%l7 + 0x1A]
	movneg	%xcc,	%l1,	%g6
	fmovdle	%icc,	%f12,	%f11
	movvc	%icc,	%g3,	%i7
	or	%g1,	0x1822,	%i2
	stx	%g2,	[%l7 + 0x20]
	srlx	%o1,	%o2,	%i3
	mulx	%i6,	%i5,	%o0
	st	%f6,	[%l7 + 0x70]
	array8	%g7,	%i1,	%l6
	movvc	%icc,	%o3,	%l4
	edge32ln	%l2,	%l3,	%i0
	movle	%icc,	%l0,	%i4
	smulcc	%l5,	%g4,	%o5
	sll	%o6,	0x1E,	%o7
	ldub	[%l7 + 0x17],	%o4
	fmovdvs	%xcc,	%f6,	%f4
	bshuffle	%f6,	%f0,	%f10
	add	%g5,	0x03AB,	%g6
	andcc	%g3,	0x15BB,	%l1
	addccc	%g1,	0x0B7A,	%i2
	fmovsle	%icc,	%f5,	%f13
	fmuld8sux16	%f5,	%f3,	%f4
	mulx	%i7,	0x12FF,	%g2
	array8	%o2,	%i3,	%i6
	fmovdn	%icc,	%f9,	%f10
	fmovdn	%xcc,	%f12,	%f15
	subcc	%i5,	0x03F2,	%o0
	xnor	%o1,	0x1A2F,	%g7
	addc	%l6,	0x0667,	%i1
	subc	%l4,	%l2,	%o3
	fzeros	%f1
	fxnors	%f8,	%f13,	%f3
	fpadd32	%f6,	%f4,	%f0
	sdiv	%l3,	0x0ECE,	%i0
	fcmpgt16	%f2,	%f12,	%i4
	ldub	[%l7 + 0x4E],	%l0
	array16	%g4,	%l5,	%o5
	movvs	%icc,	%o6,	%o7
	ldsh	[%l7 + 0x2A],	%g5
	movge	%xcc,	%g6,	%g3
	andn	%l1,	%g1,	%i2
	movrlz	%i7,	0x371,	%g2
	smul	%o2,	0x1DF3,	%i3
	udivx	%i6,	0x12C7,	%o4
	srl	%o0,	%i5,	%g7
	sethi	0x1036,	%o1
	array8	%i1,	%l6,	%l2
	edge8ln	%o3,	%l4,	%i0
	fmuld8ulx16	%f12,	%f14,	%f8
	srl	%l3,	%l0,	%g4
	edge16l	%l5,	%i4,	%o6
	fmovd	%f8,	%f14
	andcc	%o7,	%g5,	%g6
	array8	%o5,	%g3,	%g1
	xor	%l1,	0x1C56,	%i7
	edge32ln	%g2,	%i2,	%i3
	stw	%o2,	[%l7 + 0x60]
	smul	%i6,	0x1590,	%o4
	sdivx	%o0,	0x0959,	%g7
	save %o1, %i5, %l6
	smul	%i1,	0x0C51,	%l2
	array32	%l4,	%o3,	%i0
	fmovdl	%icc,	%f4,	%f3
	edge8	%l3,	%g4,	%l0
	array8	%l5,	%i4,	%o7
	edge32	%g5,	%g6,	%o6
	umul	%o5,	0x06EB,	%g3
	edge32n	%g1,	%i7,	%l1
	movcc	%xcc,	%g2,	%i2
	smulcc	%i3,	%o2,	%i6
	fmul8x16al	%f9,	%f1,	%f8
	move	%icc,	%o0,	%g7
	fpsub32s	%f3,	%f11,	%f11
	add	%o4,	%o1,	%i5
	movgu	%icc,	%i1,	%l6
	fmovsle	%icc,	%f1,	%f14
	movvs	%icc,	%l4,	%o3
	udivx	%l2,	0x02E5,	%l3
	fexpand	%f11,	%f0
	fornot2s	%f8,	%f11,	%f5
	xnor	%g4,	0x1AC2,	%l0
	st	%f3,	[%l7 + 0x70]
	movrlz	%i0,	%i4,	%l5
	edge32n	%o7,	%g6,	%g5
	edge32	%o5,	%g3,	%g1
	fmovsle	%icc,	%f1,	%f6
	movpos	%icc,	%o6,	%i7
	edge32ln	%l1,	%g2,	%i2
	edge8n	%o2,	%i3,	%o0
	stb	%i6,	[%l7 + 0x2B]
	movrlz	%g7,	0x333,	%o1
	fmovrdlez	%i5,	%f0,	%f12
	pdist	%f6,	%f4,	%f12
	or	%i1,	0x02B3,	%l6
	array8	%l4,	%o4,	%l2
	edge8l	%o3,	%l3,	%l0
	restore %i0, 0x0012, %g4
	edge8	%i4,	%l5,	%g6
	sethi	0x0536,	%g5
	and	%o5,	0x1F05,	%g3
	sra	%o7,	%o6,	%i7
	fmovsneg	%xcc,	%f4,	%f6
	xnorcc	%l1,	0x1871,	%g2
	andncc	%i2,	%o2,	%i3
	smul	%o0,	0x1513,	%g1
	ldd	[%l7 + 0x78],	%f6
	fmovsleu	%icc,	%f8,	%f9
	fpadd32	%f6,	%f2,	%f14
	andncc	%i6,	%o1,	%g7
	fcmpgt16	%f4,	%f8,	%i5
	umul	%l6,	%l4,	%o4
	subccc	%i1,	0x1E1E,	%o3
	orncc	%l2,	0x076F,	%l3
	lduh	[%l7 + 0x10],	%l0
	ldsw	[%l7 + 0x54],	%i0
	sdiv	%i4,	0x0E09,	%g4
	srl	%l5,	%g5,	%o5
	movn	%xcc,	%g6,	%o7
	fxnor	%f0,	%f6,	%f6
	movne	%icc,	%o6,	%i7
	fandnot2s	%f15,	%f12,	%f13
	subcc	%l1,	0x1DF3,	%g2
	movg	%icc,	%g3,	%o2
	andncc	%i2,	%i3,	%g1
	addccc	%i6,	0x05ED,	%o1
	array16	%g7,	%i5,	%o0
	andncc	%l6,	%l4,	%o4
	fmovdgu	%xcc,	%f4,	%f8
	andcc	%o3,	0x1EB5,	%i1
	lduh	[%l7 + 0x58],	%l2
	ldsb	[%l7 + 0x13],	%l0
	movge	%icc,	%i0,	%l3
	popc	0x0EC5,	%i4
	movvs	%icc,	%g4,	%l5
	movrlz	%g5,	%g6,	%o5
	edge32	%o7,	%i7,	%o6
	lduh	[%l7 + 0x0C],	%l1
	alignaddr	%g3,	%g2,	%i2
	fmul8sux16	%f14,	%f4,	%f14
	udivcc	%i3,	0x1F86,	%g1
	fmovrsgez	%i6,	%f0,	%f10
	fmovsle	%icc,	%f7,	%f11
	fnands	%f10,	%f1,	%f10
	stw	%o2,	[%l7 + 0x60]
	addccc	%o1,	%g7,	%i5
	subcc	%o0,	%l6,	%l4
	mulscc	%o4,	%i1,	%l2
	fmovsgu	%icc,	%f5,	%f13
	or	%o3,	0x0C7D,	%i0
	fpsub32s	%f10,	%f2,	%f5
	fmovsleu	%xcc,	%f4,	%f1
	udiv	%l0,	0x0DB0,	%l3
	ldd	[%l7 + 0x10],	%i4
	movge	%xcc,	%g4,	%l5
	array32	%g5,	%g6,	%o7
	fcmpne32	%f4,	%f8,	%o5
	movge	%icc,	%o6,	%l1
	alignaddrl	%i7,	%g3,	%g2
	xnorcc	%i3,	0x1830,	%i2
	andncc	%g1,	%i6,	%o2
	std	%f12,	[%l7 + 0x28]
	udivcc	%g7,	0x11A8,	%i5
	st	%f7,	[%l7 + 0x24]
	sdiv	%o1,	0x1C5F,	%l6
	movrgez	%l4,	%o4,	%o0
	ldsh	[%l7 + 0x4E],	%l2
	ldub	[%l7 + 0x7A],	%o3
	ldub	[%l7 + 0x10],	%i1
	std	%f12,	[%l7 + 0x10]
	xorcc	%l0,	0x0A48,	%l3
	smul	%i4,	%i0,	%l5
	udiv	%g4,	0x1000,	%g6
	subc	%o7,	0x18B7,	%o5
	popc	0x0BCE,	%o6
	lduw	[%l7 + 0x58],	%g5
	save %i7, 0x1302, %l1
	stw	%g3,	[%l7 + 0x0C]
	restore %g2, 0x12CD, %i2
	ldx	[%l7 + 0x70],	%g1
	sdiv	%i3,	0x0943,	%i6
	movn	%xcc,	%o2,	%g7
	fcmpeq16	%f4,	%f8,	%o1
	array32	%i5,	%l4,	%l6
	edge16n	%o4,	%o0,	%l2
	sllx	%i1,	%l0,	%o3
	fnot1s	%f1,	%f15
	fand	%f4,	%f2,	%f4
	ldsb	[%l7 + 0x67],	%i4
	movvc	%icc,	%i0,	%l5
	movrne	%g4,	%g6,	%o7
	edge16	%l3,	%o6,	%g5
	udivx	%i7,	0x11E8,	%l1
	fcmpeq32	%f14,	%f14,	%o5
	stx	%g2,	[%l7 + 0x40]
	fornot2	%f4,	%f4,	%f6
	movneg	%xcc,	%i2,	%g3
	lduh	[%l7 + 0x58],	%i3
	smulcc	%g1,	%o2,	%g7
	edge16l	%i6,	%o1,	%i5
	subcc	%l4,	0x1522,	%l6
	fmovsle	%icc,	%f1,	%f1
	xnorcc	%o0,	%l2,	%i1
	mulscc	%l0,	0x0AE6,	%o3
	fcmpne16	%f12,	%f2,	%o4
	std	%f12,	[%l7 + 0x58]
	sub	%i0,	%l5,	%i4
	stw	%g4,	[%l7 + 0x18]
	movge	%icc,	%o7,	%g6
	fnegd	%f4,	%f6
	fcmpeq32	%f6,	%f2,	%l3
	orn	%o6,	0x16E6,	%i7
	or	%l1,	%o5,	%g5
	edge32	%g2,	%i2,	%i3
	st	%f2,	[%l7 + 0x0C]
	fmovsneg	%xcc,	%f3,	%f12
	ldd	[%l7 + 0x78],	%g2
	sra	%g1,	0x02,	%o2
	bshuffle	%f2,	%f14,	%f2
	sdiv	%g7,	0x0667,	%o1
	lduh	[%l7 + 0x56],	%i6
	smulcc	%i5,	0x0EF2,	%l6
	restore %o0, 0x1B73, %l2
	fmovdpos	%xcc,	%f3,	%f14
	movneg	%xcc,	%i1,	%l4
	movcs	%icc,	%l0,	%o4
	sdiv	%i0,	0x1647,	%o3
	edge32n	%i4,	%g4,	%l5
	udiv	%o7,	0x1D71,	%g6
	fmovdcs	%icc,	%f13,	%f4
	ldd	[%l7 + 0x10],	%f6
	faligndata	%f8,	%f0,	%f12
	ld	[%l7 + 0x38],	%f6
	lduh	[%l7 + 0x68],	%l3
	fmovdle	%icc,	%f3,	%f13
	array16	%o6,	%l1,	%i7
	sth	%o5,	[%l7 + 0x32]
	fornot1	%f14,	%f4,	%f0
	addccc	%g5,	%g2,	%i2
	ldsh	[%l7 + 0x62],	%g3
	edge8n	%g1,	%o2,	%i3
	and	%o1,	0x14B2,	%i6
	alignaddr	%i5,	%g7,	%o0
	mulx	%l2,	%i1,	%l6
	addc	%l0,	0x158A,	%o4
	stx	%l4,	[%l7 + 0x20]
	or	%i0,	%o3,	%i4
	sub	%l5,	0x1162,	%g4
	udiv	%o7,	0x0A00,	%g6
	andn	%o6,	%l1,	%i7
	sdiv	%l3,	0x06A2,	%g5
	stb	%o5,	[%l7 + 0x7C]
	movle	%icc,	%g2,	%i2
	sll	%g1,	%g3,	%o2
	smul	%i3,	%i6,	%o1
	sdiv	%g7,	0x1947,	%i5
	fnot1	%f8,	%f12
	fmul8x16	%f7,	%f4,	%f12
	movn	%xcc,	%l2,	%i1
	fand	%f10,	%f10,	%f14
	subc	%l6,	0x04D8,	%l0
	fsrc2s	%f15,	%f13
	mulx	%o4,	0x1A24,	%o0
	edge8ln	%l4,	%i0,	%i4
	fornot1s	%f7,	%f10,	%f3
	fmovdpos	%xcc,	%f14,	%f0
	smulcc	%o3,	0x1126,	%l5
	fexpand	%f15,	%f4
	fmovrdgz	%o7,	%f10,	%f14
	ldx	[%l7 + 0x70],	%g4
	edge8ln	%o6,	%g6,	%l1
	fnot2s	%f9,	%f15
	mova	%xcc,	%l3,	%g5
	mulscc	%i7,	0x0C37,	%o5
	ldd	[%l7 + 0x70],	%f4
	fmovrsgz	%i2,	%f1,	%f2
	edge32	%g1,	%g3,	%o2
	fpsub16s	%f3,	%f0,	%f7
	fpack16	%f4,	%f3
	save %g2, 0x14CA, %i3
	sra	%o1,	%i6,	%i5
	udivcc	%l2,	0x06AD,	%g7
	array16	%l6,	%i1,	%o4
	movleu	%icc,	%l0,	%l4
	sth	%i0,	[%l7 + 0x7C]
	add	%i4,	%o0,	%o3
	srlx	%o7,	0x01,	%g4
	andcc	%l5,	%o6,	%g6
	and	%l1,	%g5,	%l3
	alignaddrl	%o5,	%i7,	%g1
	ldsh	[%l7 + 0x74],	%g3
	fnors	%f3,	%f2,	%f6
	andcc	%i2,	%g2,	%o2
	movl	%xcc,	%o1,	%i6
	subc	%i3,	%i5,	%l2
	ldsw	[%l7 + 0x58],	%l6
	fmuld8ulx16	%f1,	%f9,	%f14
	movrlez	%i1,	0x19E,	%g7
	movleu	%icc,	%l0,	%o4
	srl	%i0,	0x17,	%l4
	umulcc	%o0,	%i4,	%o7
	ld	[%l7 + 0x18],	%f3
	ld	[%l7 + 0x44],	%f11
	sub	%o3,	0x1448,	%l5
	addcc	%g4,	0x0079,	%o6
	array8	%g6,	%l1,	%g5
	movvs	%xcc,	%l3,	%i7
	subc	%o5,	0x1067,	%g1
	edge16ln	%i2,	%g3,	%g2
	fandnot2s	%f0,	%f0,	%f12
	movre	%o1,	0x05C,	%o2
	movcs	%icc,	%i6,	%i3
	umul	%l2,	0x0E21,	%i5
	fmovsvs	%xcc,	%f4,	%f15
	ldd	[%l7 + 0x78],	%f2
	movneg	%xcc,	%l6,	%g7
	alignaddrl	%i1,	%o4,	%i0
	edge32ln	%l0,	%o0,	%l4
	edge16l	%o7,	%o3,	%l5
	array16	%g4,	%o6,	%i4
	addc	%g6,	%l1,	%l3
	edge16	%g5,	%i7,	%g1
	movne	%xcc,	%o5,	%g3
	edge32l	%i2,	%o1,	%o2
	udivcc	%i6,	0x1706,	%g2
	mulscc	%l2,	0x0DA7,	%i5
	udivcc	%l6,	0x1D64,	%g7
	umulcc	%i1,	0x12E4,	%o4
	ldub	[%l7 + 0x79],	%i0
	fmovsne	%icc,	%f5,	%f4
	smul	%i3,	0x05CB,	%o0
	fmovdne	%xcc,	%f8,	%f10
	udivx	%l0,	0x12D9,	%l4
	ldd	[%l7 + 0x10],	%o2
	movrgez	%o7,	0x02C,	%g4
	array8	%l5,	%o6,	%i4
	st	%f13,	[%l7 + 0x50]
	and	%l1,	0x1320,	%l3
	fmul8x16	%f14,	%f8,	%f6
	array8	%g5,	%i7,	%g1
	movl	%icc,	%o5,	%g6
	xorcc	%i2,	0x1167,	%g3
	edge16l	%o2,	%o1,	%i6
	andn	%g2,	%i5,	%l2
	fmovrdlez	%g7,	%f4,	%f0
	ldsh	[%l7 + 0x5C],	%l6
	xor	%o4,	%i0,	%i3
	sdivx	%i1,	0x0C04,	%l0
	ldub	[%l7 + 0x29],	%l4
	edge16	%o0,	%o3,	%g4
	edge16	%o7,	%l5,	%o6
	st	%f5,	[%l7 + 0x50]
	ldsw	[%l7 + 0x10],	%l1
	movgu	%xcc,	%i4,	%l3
	sdivcc	%g5,	0x145A,	%i7
	subccc	%o5,	0x11CF,	%g6
	ldx	[%l7 + 0x60],	%g1
	ldx	[%l7 + 0x18],	%g3
	orn	%o2,	%i2,	%o1
	edge16n	%i6,	%g2,	%l2
	popc	%i5,	%l6
	srlx	%g7,	0x18,	%i0
	edge32	%i3,	%i1,	%l0
	fmovrse	%o4,	%f8,	%f5
	edge16ln	%l4,	%o0,	%o3
	xnorcc	%g4,	0x12DC,	%l5
	movre	%o7,	%o6,	%i4
	movrgz	%l3,	0x32F,	%l1
	edge16l	%g5,	%o5,	%i7
	movneg	%xcc,	%g1,	%g6
	mulscc	%g3,	%i2,	%o1
	movrne	%i6,	%g2,	%o2
	fmovse	%xcc,	%f11,	%f10
	srax	%l2,	%l6,	%g7
	edge32l	%i0,	%i5,	%i3
	fmovsgu	%xcc,	%f13,	%f10
	alignaddrl	%l0,	%i1,	%l4
	smul	%o0,	%o4,	%g4
	edge8l	%l5,	%o3,	%o7
	movne	%xcc,	%i4,	%o6
	alignaddr	%l1,	%g5,	%o5
	orncc	%i7,	0x18BA,	%l3
	udivcc	%g6,	0x06AD,	%g1
	movne	%icc,	%i2,	%g3
	xor	%i6,	%o1,	%o2
	fmovda	%xcc,	%f12,	%f5
	fmovd	%f4,	%f2
	andncc	%l2,	%l6,	%g2
	edge16n	%g7,	%i5,	%i0
	subcc	%l0,	0x07F3,	%i3
	movl	%icc,	%l4,	%i1
	movl	%xcc,	%o0,	%g4
	srax	%o4,	%o3,	%l5
	sethi	0x1D7D,	%o7
	movl	%xcc,	%o6,	%l1
	subccc	%i4,	%g5,	%o5
	add	%l3,	0x0AD1,	%i7
	stw	%g1,	[%l7 + 0x18]
	fmovsvs	%xcc,	%f2,	%f14
	stb	%i2,	[%l7 + 0x0D]
	or	%g3,	%g6,	%i6
	fone	%f14
	or	%o1,	%l2,	%l6
	udivx	%o2,	0x0AE7,	%g2
	fmovrslez	%g7,	%f5,	%f10
	udiv	%i5,	0x0A9C,	%l0
	movrlez	%i3,	0x248,	%l4
	edge32n	%i1,	%o0,	%g4
	movre	%o4,	0x244,	%i0
	andncc	%l5,	%o7,	%o3
	edge32n	%l1,	%i4,	%o6
	sra	%g5,	%l3,	%i7
	edge32l	%g1,	%o5,	%i2
	popc	0x0C99,	%g3
	fnands	%f5,	%f2,	%f4
	movvs	%xcc,	%i6,	%g6
	alignaddr	%o1,	%l6,	%l2
	popc	%o2,	%g2
	umulcc	%i5,	%g7,	%l0
	smul	%l4,	%i3,	%o0
	lduh	[%l7 + 0x1C],	%g4
	movre	%i1,	%i0,	%o4
	movre	%o7,	0x1D7,	%l5
	movge	%xcc,	%l1,	%o3
	xnorcc	%o6,	%i4,	%l3
	ldd	[%l7 + 0x58],	%f2
	orn	%g5,	0x0BCB,	%g1
	smulcc	%o5,	0x06EF,	%i7
	umulcc	%i2,	%i6,	%g3
	sdivcc	%g6,	0x1B8C,	%o1
	subccc	%l6,	%l2,	%o2
	fnot2s	%f4,	%f10
	ldsh	[%l7 + 0x1C],	%i5
	stx	%g7,	[%l7 + 0x68]
	edge16n	%g2,	%l4,	%l0
	fnegs	%f8,	%f8
	orcc	%o0,	0x0B7C,	%i3
	xor	%i1,	%g4,	%o4
	smul	%o7,	0x1E61,	%l5
	ld	[%l7 + 0x58],	%f10
	ldd	[%l7 + 0x28],	%f0
	array8	%i0,	%o3,	%o6
	movcs	%xcc,	%l1,	%i4
	fors	%f3,	%f1,	%f10
	fmovdcc	%xcc,	%f7,	%f8
	sub	%l3,	%g5,	%g1
	fmovdneg	%xcc,	%f11,	%f11
	ld	[%l7 + 0x54],	%f12
	movvc	%xcc,	%o5,	%i7
	andncc	%i6,	%g3,	%i2
	sdivx	%g6,	0x1DB4,	%o1
	andncc	%l2,	%l6,	%i5
	sra	%o2,	%g7,	%g2
	add	%l4,	0x02C3,	%l0
	fmul8x16al	%f14,	%f14,	%f10
	add	%i3,	%i1,	%o0
	fcmpeq32	%f10,	%f2,	%o4
	movrlz	%o7,	0x247,	%g4
	lduw	[%l7 + 0x74],	%l5
	and	%i0,	%o6,	%o3
	popc	%l1,	%l3
	sra	%i4,	0x09,	%g1
	fandnot2	%f4,	%f12,	%f6
	fmul8x16al	%f4,	%f2,	%f14
	xorcc	%g5,	%i7,	%o5
	fabsd	%f6,	%f8
	fnor	%f8,	%f8,	%f10
	ldd	[%l7 + 0x60],	%g2
	pdist	%f8,	%f12,	%f14
	ldub	[%l7 + 0x52],	%i6
	fpsub16	%f14,	%f12,	%f0
	fcmpgt16	%f2,	%f6,	%g6
	srax	%i2,	0x15,	%o1
	movcc	%xcc,	%l6,	%l2
	lduh	[%l7 + 0x16],	%o2
	srax	%i5,	0x09,	%g7
	orcc	%g2,	%l4,	%i3
	mulx	%l0,	0x1D98,	%o0
	lduw	[%l7 + 0x5C],	%i1
	fpadd32s	%f3,	%f14,	%f14
	mulx	%o7,	%o4,	%g4
	fmovscc	%icc,	%f7,	%f1
	srl	%l5,	%o6,	%o3
	edge8ln	%l1,	%l3,	%i4
	edge16n	%i0,	%g5,	%i7
	sdiv	%o5,	0x00CB,	%g3
	fmovdcc	%icc,	%f7,	%f0
	ldd	[%l7 + 0x58],	%f12
	ldsb	[%l7 + 0x27],	%g1
	ldd	[%l7 + 0x20],	%i6
	fmovrdgez	%g6,	%f14,	%f0
	movg	%icc,	%i2,	%l6
	popc	0x08D0,	%o1
	edge8	%l2,	%o2,	%i5
	movne	%xcc,	%g7,	%l4
	movne	%xcc,	%g2,	%i3
	edge32l	%o0,	%l0,	%o7
	xorcc	%i1,	0x087B,	%o4
	fcmps	%fcc0,	%f14,	%f13
	fnand	%f12,	%f14,	%f2
	edge16	%l5,	%o6,	%g4
	smulcc	%o3,	%l1,	%i4
	ldd	[%l7 + 0x58],	%l2
	fmovsle	%icc,	%f2,	%f2
	fandnot2	%f12,	%f4,	%f2
	movrne	%g5,	0x348,	%i7
	ldub	[%l7 + 0x3E],	%o5
	ldsw	[%l7 + 0x68],	%i0
	udiv	%g3,	0x01A1,	%i6
	mulx	%g1,	%i2,	%g6
	movn	%icc,	%o1,	%l2
	mulscc	%l6,	0x0E61,	%o2
	edge8l	%g7,	%l4,	%g2
	fmovrslez	%i3,	%f11,	%f15
	sth	%i5,	[%l7 + 0x6C]
	fmovdleu	%icc,	%f15,	%f6
	movl	%xcc,	%o0,	%l0
	fmovsvc	%icc,	%f7,	%f15
	movneg	%icc,	%i1,	%o4
	ldd	[%l7 + 0x38],	%o6
	lduw	[%l7 + 0x7C],	%l5
	array8	%o6,	%o3,	%l1
	srl	%g4,	0x0E,	%i4
	ld	[%l7 + 0x5C],	%f10
	and	%l3,	0x132D,	%g5
	array32	%i7,	%i0,	%o5
	fmovrdgez	%i6,	%f10,	%f6
	srlx	%g1,	0x07,	%i2
	edge32n	%g3,	%g6,	%l2
	fnot1	%f12,	%f14
	fornot2s	%f4,	%f15,	%f14
	edge32l	%l6,	%o2,	%g7
	stw	%o1,	[%l7 + 0x58]
	restore %g2, %l4, %i5
	umul	%i3,	%l0,	%i1
	fsrc2	%f14,	%f10
	udivcc	%o4,	0x1B69,	%o0
	movrgez	%l5,	%o6,	%o7
	sth	%l1,	[%l7 + 0x24]
	sth	%o3,	[%l7 + 0x54]
	addc	%i4,	0x0B59,	%l3
	array8	%g5,	%i7,	%i0
	fmul8sux16	%f2,	%f10,	%f14
	stb	%g4,	[%l7 + 0x6A]
	fmovrdlz	%o5,	%f10,	%f6
	xnor	%g1,	%i2,	%g3
	or	%g6,	0x0FF7,	%l2
	array8	%l6,	%o2,	%i6
	movvs	%xcc,	%o1,	%g2
	lduh	[%l7 + 0x26],	%g7
	lduw	[%l7 + 0x44],	%i5
	sra	%l4,	0x0B,	%i3
	movleu	%icc,	%l0,	%i1
	mova	%icc,	%o0,	%l5
	umulcc	%o4,	0x0F6D,	%o7
	ldsw	[%l7 + 0x6C],	%o6
	std	%f0,	[%l7 + 0x40]
	ld	[%l7 + 0x70],	%f2
	fmovsvs	%xcc,	%f14,	%f6
	array8	%l1,	%o3,	%l3
	fnors	%f4,	%f15,	%f13
	xorcc	%g5,	%i7,	%i0
	movrgez	%g4,	0x292,	%o5
	sllx	%g1,	0x08,	%i2
	array8	%g3,	%i4,	%g6
	fzero	%f10
	edge8	%l6,	%l2,	%o2
	fmovsneg	%xcc,	%f5,	%f5
	sdivcc	%i6,	0x0020,	%o1
	fnands	%f5,	%f3,	%f8
	add	%g7,	0x077F,	%g2
	subc	%i5,	0x1106,	%i3
	fnegs	%f13,	%f13
	xorcc	%l0,	%l4,	%i1
	udivx	%o0,	0x017B,	%o4
	movvs	%xcc,	%o7,	%l5
	sub	%o6,	%l1,	%o3
	fmovsn	%xcc,	%f0,	%f8
	subcc	%g5,	0x1FA0,	%l3
	fmovdn	%xcc,	%f14,	%f10
	edge16ln	%i7,	%g4,	%o5
	xnorcc	%g1,	0x0DC4,	%i0
	xor	%i2,	%i4,	%g6
	fsrc1	%f4,	%f0
	movrgz	%g3,	%l6,	%l2
	fmovspos	%icc,	%f9,	%f2
	sll	%i6,	%o1,	%g7
	fnand	%f10,	%f2,	%f12
	movle	%xcc,	%g2,	%o2
	move	%icc,	%i3,	%i5
	fxor	%f10,	%f10,	%f8
	std	%f8,	[%l7 + 0x30]
	fpadd32	%f14,	%f6,	%f0
	stw	%l4,	[%l7 + 0x5C]
	movrlez	%i1,	%l0,	%o4
	siam	0x0
	ldsb	[%l7 + 0x5D],	%o0
	xnor	%o7,	%o6,	%l1
	fxnor	%f2,	%f4,	%f0
	fmovrsgez	%o3,	%f9,	%f14
	mulscc	%g5,	%l3,	%i7
	movneg	%xcc,	%l5,	%g4
	andn	%o5,	0x0EBD,	%i0
	addccc	%i2,	0x0CA2,	%i4
	fmovrde	%g6,	%f10,	%f14
	fmovdn	%xcc,	%f8,	%f3
	alignaddr	%g1,	%g3,	%l6
	edge16ln	%l2,	%o1,	%i6
	movg	%icc,	%g7,	%o2
	fmovdn	%icc,	%f0,	%f9
	fmovdgu	%xcc,	%f7,	%f15
	sub	%i3,	%i5,	%l4
	fmovse	%icc,	%f14,	%f1
	edge16	%g2,	%l0,	%i1
	udivx	%o4,	0x19F4,	%o0
	movrne	%o7,	%o6,	%l1
	movrgz	%o3,	0x24C,	%l3
	ldsw	[%l7 + 0x50],	%i7
	lduw	[%l7 + 0x0C],	%l5
	ldsh	[%l7 + 0x34],	%g5
	udivcc	%o5,	0x05FB,	%i0
	sth	%i2,	[%l7 + 0x4E]
	smulcc	%i4,	%g4,	%g6
	orcc	%g3,	0x1D9D,	%g1
	save %l6, %l2, %o1
	sll	%g7,	0x17,	%i6
	movrgez	%o2,	0x340,	%i5
	and	%i3,	%g2,	%l4
	edge16n	%i1,	%o4,	%o0
	move	%xcc,	%o7,	%l0
	edge32	%l1,	%o3,	%o6
	movrlez	%i7,	0x07F,	%l3
	udivx	%l5,	0x1109,	%o5
	ldub	[%l7 + 0x18],	%g5
	restore %i0, 0x09FD, %i2
	restore %g4, 0x08C1, %i4
	fcmped	%fcc1,	%f14,	%f14
	st	%f8,	[%l7 + 0x0C]
	movleu	%icc,	%g3,	%g1
	srax	%l6,	%l2,	%g6
	movn	%icc,	%o1,	%i6
	fxnors	%f5,	%f9,	%f2
	udiv	%g7,	0x192F,	%i5
	edge16l	%o2,	%i3,	%l4
	fmovrdlz	%g2,	%f10,	%f6
	sll	%o4,	%o0,	%o7
	movcc	%icc,	%l0,	%i1
	smulcc	%l1,	%o6,	%o3
	ld	[%l7 + 0x1C],	%f5
	sub	%i7,	0x097A,	%l5
	umulcc	%l3,	0x008B,	%g5
	fmul8x16au	%f13,	%f6,	%f8
	fmovsa	%xcc,	%f5,	%f8
	fnot2s	%f13,	%f14
	sethi	0x1978,	%o5
	mulx	%i0,	0x0FC8,	%g4
	orcc	%i4,	%i2,	%g3
	add	%g1,	%l6,	%g6
	edge8n	%o1,	%i6,	%g7
	lduh	[%l7 + 0x4E],	%l2
	andncc	%o2,	%i3,	%l4
	fcmpgt16	%f12,	%f10,	%g2
	orn	%i5,	%o0,	%o4
	movvc	%xcc,	%o7,	%i1
	stw	%l1,	[%l7 + 0x60]
	subccc	%l0,	%o6,	%o3
	fornot2s	%f4,	%f6,	%f7
	fmul8x16au	%f2,	%f10,	%f12
	edge32	%i7,	%l5,	%l3
	fpadd32	%f4,	%f8,	%f2
	edge32n	%g5,	%i0,	%g4
	sll	%o5,	%i4,	%g3
	edge32l	%g1,	%l6,	%g6
	movneg	%icc,	%o1,	%i2
	movrne	%g7,	0x072,	%l2
	srlx	%i6,	0x16,	%i3
	fone	%f0
	edge16l	%l4,	%g2,	%o2
	edge8n	%i5,	%o0,	%o4
	popc	%o7,	%i1
	addcc	%l1,	0x0833,	%l0
	ldub	[%l7 + 0x61],	%o3
	fmovsg	%icc,	%f3,	%f12
	orn	%i7,	0x1D25,	%o6
	edge8	%l5,	%g5,	%l3
	save %i0, %o5, %i4
	udiv	%g3,	0x1B51,	%g1
	addcc	%g4,	0x054F,	%l6
	subc	%o1,	0x09AD,	%g6
	ldsb	[%l7 + 0x57],	%g7
	fmovrdgez	%l2,	%f12,	%f0
	ldd	[%l7 + 0x08],	%f14
	andn	%i6,	%i3,	%l4
	fxor	%f0,	%f4,	%f10
	srl	%g2,	0x0D,	%o2
	movrgz	%i5,	0x2C2,	%i2
	movpos	%icc,	%o0,	%o4
	fors	%f14,	%f4,	%f6
	andcc	%i1,	%l1,	%o7
	xorcc	%o3,	0x06DF,	%i7
	array16	%l0,	%l5,	%o6
	pdist	%f8,	%f12,	%f10
	movge	%icc,	%l3,	%g5
	movcs	%xcc,	%o5,	%i0
	smulcc	%i4,	0x01BE,	%g1
	ldsh	[%l7 + 0x2C],	%g3
	mulx	%l6,	0x11E7,	%o1
	movcs	%xcc,	%g4,	%g6
	movneg	%xcc,	%g7,	%i6
	subcc	%l2,	%i3,	%l4
	movn	%icc,	%g2,	%i5
	movne	%icc,	%i2,	%o2
	andncc	%o4,	%i1,	%o0
	smul	%l1,	%o7,	%i7
	edge32	%o3,	%l5,	%l0
	orncc	%o6,	0x0698,	%g5
	andn	%o5,	0x0549,	%l3
	edge16n	%i0,	%i4,	%g3
	sth	%l6,	[%l7 + 0x20]
	stw	%g1,	[%l7 + 0x24]
	fnand	%f14,	%f6,	%f6
	movre	%o1,	0x232,	%g4
	movpos	%icc,	%g7,	%g6
	mulx	%i6,	0x1089,	%l2
	move	%xcc,	%l4,	%g2
	ldub	[%l7 + 0x78],	%i3
	fandnot2	%f12,	%f8,	%f4
	orn	%i2,	%o2,	%i5
	ldd	[%l7 + 0x40],	%o4
	xorcc	%i1,	0x0D4E,	%o0
	movg	%xcc,	%o7,	%l1
	addc	%o3,	0x12D3,	%l5
	sra	%l0,	%o6,	%g5
	fornot1s	%f1,	%f7,	%f1
	fmovrdne	%o5,	%f12,	%f6
	srl	%l3,	%i7,	%i4
	fmovrsgz	%g3,	%f12,	%f8
	fandnot1s	%f12,	%f5,	%f11
	ldsh	[%l7 + 0x66],	%l6
	movneg	%xcc,	%g1,	%i0
	movrne	%g4,	%o1,	%g6
	movl	%xcc,	%g7,	%i6
	fors	%f10,	%f1,	%f11
	lduw	[%l7 + 0x24],	%l4
	faligndata	%f6,	%f2,	%f4
	andcc	%g2,	0x0F04,	%i3
	addccc	%l2,	%i2,	%o2
	ldd	[%l7 + 0x30],	%o4
	edge16	%i1,	%o0,	%o7
	array16	%i5,	%l1,	%l5
	fmuld8ulx16	%f11,	%f15,	%f14
	edge32n	%l0,	%o3,	%g5
	fcmple32	%f0,	%f0,	%o5
	movrgez	%l3,	0x19E,	%i7
	fsrc1	%f14,	%f12
	movle	%xcc,	%i4,	%o6
	movpos	%icc,	%l6,	%g3
	mulx	%i0,	%g4,	%o1
	sra	%g1,	0x1C,	%g6
	movre	%i6,	%l4,	%g7
	stw	%g2,	[%l7 + 0x28]
	fmovdgu	%icc,	%f8,	%f2
	alignaddrl	%i3,	%l2,	%i2
	stx	%o2,	[%l7 + 0x08]
	lduh	[%l7 + 0x6E],	%i1
	udiv	%o4,	0x16A2,	%o0
	add	%i5,	0x1B69,	%l1
	sra	%l5,	0x13,	%o7
	fmovsle	%icc,	%f11,	%f6
	ldsh	[%l7 + 0x5C],	%l0
	fpackfix	%f12,	%f9
	std	%f2,	[%l7 + 0x78]
	edge16ln	%o3,	%g5,	%o5
	movle	%xcc,	%i7,	%l3
	fpadd32	%f10,	%f6,	%f10
	movrgez	%o6,	0x014,	%l6
	sll	%i4,	0x04,	%g3
	fmul8x16	%f5,	%f8,	%f12
	fmovrdlez	%i0,	%f2,	%f0
	umul	%o1,	%g4,	%g6
	mulscc	%g1,	%l4,	%g7
	siam	0x4
	srax	%i6,	%g2,	%i3
	movn	%xcc,	%l2,	%i2
	fmul8x16al	%f1,	%f2,	%f12
	mulscc	%o2,	0x12F0,	%o4
	subcc	%i1,	%i5,	%l1
	subccc	%l5,	%o7,	%o0
	or	%o3,	%g5,	%l0
	mulscc	%i7,	0x0CB6,	%o5
	edge16n	%l3,	%l6,	%o6
	movrgz	%i4,	%g3,	%i0
	movrlez	%g4,	0x393,	%g6
	orcc	%g1,	0x1E57,	%l4
	lduh	[%l7 + 0x36],	%o1
	movrlz	%g7,	0x04D,	%i6
	edge32ln	%i3,	%g2,	%l2
	alignaddrl	%i2,	%o2,	%o4
	mulx	%i5,	0x06DB,	%i1
	mova	%icc,	%l5,	%l1
	mulscc	%o7,	%o3,	%o0
	movrlez	%l0,	%i7,	%o5
	addc	%l3,	0x0E6E,	%l6
	fmovsg	%xcc,	%f5,	%f0
	smul	%g5,	0x00D1,	%i4
	st	%f7,	[%l7 + 0x50]
	edge8n	%o6,	%i0,	%g4
	movrgez	%g3,	%g6,	%g1
	ldsb	[%l7 + 0x32],	%l4
	smulcc	%o1,	0x0FF7,	%g7
	edge8n	%i3,	%g2,	%l2
	restore %i2, 0x1947, %o2
	xnor	%i6,	%i5,	%o4
	subc	%l5,	%l1,	%i1
	fzero	%f2
	lduh	[%l7 + 0x62],	%o7
	edge32ln	%o0,	%l0,	%o3
	movpos	%icc,	%i7,	%l3
	array32	%o5,	%l6,	%i4
	movl	%xcc,	%o6,	%i0
	mova	%icc,	%g5,	%g3
	movne	%icc,	%g6,	%g1
	movvs	%icc,	%l4,	%g4
	ld	[%l7 + 0x10],	%f10
	xnor	%g7,	0x1B73,	%i3
	alignaddrl	%g2,	%l2,	%o1
	lduw	[%l7 + 0x74],	%i2
	edge8	%o2,	%i6,	%i5
	movre	%l5,	0x17F,	%l1
	umul	%o4,	%o7,	%o0
	sll	%l0,	%i1,	%i7
	sllx	%o3,	%o5,	%l6
	addcc	%l3,	0x1080,	%i4
	sllx	%o6,	0x1A,	%i0
	ld	[%l7 + 0x0C],	%f11
	movre	%g5,	0x294,	%g6
	std	%f0,	[%l7 + 0x60]
	fcmpeq32	%f12,	%f8,	%g3
	srax	%l4,	0x11,	%g1
	srlx	%g4,	%i3,	%g2
	fxnors	%f8,	%f4,	%f9
	alignaddrl	%l2,	%g7,	%i2
	movvc	%icc,	%o2,	%o1
	fmovdpos	%icc,	%f11,	%f1
	sth	%i5,	[%l7 + 0x78]
	move	%xcc,	%l5,	%i6
	umul	%l1,	0x17B1,	%o7
	xnorcc	%o0,	%o4,	%l0
	movvc	%xcc,	%i7,	%o3
	movrgez	%i1,	0x2D7,	%o5
	std	%f12,	[%l7 + 0x40]
	movl	%icc,	%l6,	%i4
	movre	%l3,	0x1F0,	%i0
	fcmpne16	%f6,	%f6,	%o6
	fnegs	%f9,	%f14
	subc	%g5,	%g3,	%l4
	mova	%icc,	%g1,	%g4
	addcc	%g6,	0x1057,	%g2
	edge8l	%i3,	%l2,	%i2
	fmovscc	%icc,	%f12,	%f0
	orncc	%o2,	%g7,	%i5
	array16	%o1,	%l5,	%i6
	movrlz	%l1,	%o0,	%o7
	edge16	%l0,	%o4,	%o3
	edge8n	%i1,	%o5,	%i7
	edge16l	%l6,	%l3,	%i4
	movle	%xcc,	%i0,	%o6
	umulcc	%g5,	0x0CB3,	%l4
	fpackfix	%f6,	%f4
	fornot2s	%f11,	%f14,	%f8
	mova	%xcc,	%g1,	%g3
	edge8l	%g4,	%g6,	%g2
	movneg	%icc,	%i3,	%l2
	fcmpeq32	%f0,	%f8,	%o2
	movrgez	%g7,	%i5,	%i2
	movne	%xcc,	%l5,	%i6
	movge	%xcc,	%o1,	%l1
	fcmpd	%fcc1,	%f14,	%f10
	movre	%o0,	%o7,	%l0
	movvc	%icc,	%o4,	%i1
	edge8	%o3,	%o5,	%l6
	andncc	%l3,	%i4,	%i0
	xor	%o6,	0x0D97,	%i7
	srlx	%l4,	%g1,	%g3
	edge32	%g5,	%g6,	%g2
	fnands	%f6,	%f10,	%f8
	addc	%i3,	%g4,	%o2
	fnot1s	%f12,	%f14
	fexpand	%f12,	%f12
	add	%g7,	%l2,	%i2
	fxor	%f12,	%f4,	%f14
	movrgez	%i5,	0x12F,	%i6
	orncc	%o1,	0x03E4,	%l1
	fabsd	%f0,	%f8
	fpack32	%f14,	%f6,	%f2
	lduh	[%l7 + 0x48],	%o0
	movrlez	%o7,	%l0,	%o4
	fornot1	%f10,	%f8,	%f2
	movrgz	%i1,	%l5,	%o3
	fmovsvs	%xcc,	%f14,	%f8
	orn	%o5,	0x0B70,	%l3
	fpack32	%f12,	%f10,	%f4
	udivcc	%i4,	0x0A55,	%i0
	edge32l	%o6,	%l6,	%i7
	add	%g1,	0x06B4,	%g3
	fornot2	%f14,	%f12,	%f12
	orcc	%l4,	%g5,	%g2
	add	%i3,	%g4,	%o2
	sethi	0x0B1A,	%g7
	orn	%l2,	0x14E1,	%i2
	umul	%g6,	0x1891,	%i5
	subc	%i6,	%o1,	%o0
	fmovdcc	%xcc,	%f15,	%f14
	orncc	%l1,	0x0467,	%o7
	orn	%l0,	%i1,	%o4
	andncc	%o3,	%o5,	%l3
	popc	0x0F0B,	%l5
	fmuld8ulx16	%f4,	%f4,	%f4
	fandnot2	%f4,	%f2,	%f6
	movvc	%icc,	%i4,	%o6
	edge8l	%l6,	%i7,	%g1
	movneg	%icc,	%g3,	%l4
	fmovdn	%icc,	%f13,	%f14
	fpsub32	%f6,	%f14,	%f0
	andcc	%g5,	0x1EB4,	%i0
	movg	%xcc,	%i3,	%g4
	array16	%g2,	%g7,	%l2
	subc	%i2,	0x0265,	%o2
	fand	%f0,	%f10,	%f12
	save %g6, %i5, %o1
	movle	%icc,	%i6,	%o0
	fmovscs	%xcc,	%f12,	%f12
	alignaddrl	%o7,	%l1,	%l0
	movgu	%xcc,	%o4,	%i1
	movg	%icc,	%o5,	%l3
	movle	%xcc,	%l5,	%i4
	orncc	%o3,	0x18E5,	%o6
	fnot1	%f6,	%f12
	fnot1s	%f3,	%f3
	fmovdl	%icc,	%f3,	%f1
	fcmpd	%fcc0,	%f14,	%f0
	movrgz	%i7,	%g1,	%l6
	mulscc	%l4,	%g3,	%g5
	movneg	%xcc,	%i3,	%g4
	stx	%g2,	[%l7 + 0x48]
	umulcc	%g7,	0x11D5,	%l2
	edge8l	%i2,	%i0,	%o2
	movle	%xcc,	%i5,	%g6
	fabsd	%f10,	%f2
	orcc	%i6,	%o0,	%o1
	fpack16	%f0,	%f8
	fone	%f4
	fcmpeq16	%f0,	%f14,	%l1
	edge8	%l0,	%o4,	%o7
	movrgz	%i1,	0x3BD,	%o5
	subccc	%l3,	%l5,	%i4
	andn	%o6,	%i7,	%g1
	stb	%o3,	[%l7 + 0x3F]
	array8	%l6,	%g3,	%g5
	udivcc	%l4,	0x1ED7,	%i3
	fmovsvs	%icc,	%f5,	%f14
	ld	[%l7 + 0x4C],	%f2
	and	%g2,	0x1113,	%g4
	movvc	%xcc,	%l2,	%i2
	alignaddrl	%g7,	%i0,	%o2
	fmovsvs	%icc,	%f13,	%f7
	subc	%i5,	%g6,	%o0
	edge32n	%i6,	%o1,	%l1
	fcmple16	%f10,	%f10,	%o4
	sth	%l0,	[%l7 + 0x72]
	udivcc	%i1,	0x1DB9,	%o5
	edge32n	%l3,	%o7,	%l5
	ldd	[%l7 + 0x08],	%f6
	udiv	%i4,	0x004A,	%i7
	movgu	%icc,	%g1,	%o6
	fpmerge	%f6,	%f8,	%f6
	movcc	%xcc,	%o3,	%l6
	addcc	%g3,	%l4,	%i3
	movrlez	%g2,	%g4,	%l2
	ld	[%l7 + 0x08],	%f4
	fmovrdgez	%i2,	%f12,	%f4
	mulx	%g5,	%i0,	%g7
	mulx	%i5,	0x1AE1,	%o2
	xor	%o0,	%g6,	%o1
	sllx	%l1,	0x1C,	%i6
	fcmpne32	%f2,	%f0,	%o4
	fornot2	%f8,	%f0,	%f0
	fnors	%f14,	%f6,	%f1
	andn	%l0,	0x0FB9,	%o5
	addcc	%l3,	0x1BFB,	%o7
	edge16ln	%l5,	%i4,	%i1
	andncc	%i7,	%g1,	%o3
	smul	%l6,	0x00A9,	%g3
	movg	%icc,	%o6,	%l4
	srlx	%g2,	0x08,	%g4
	fmovde	%xcc,	%f14,	%f13
	stx	%l2,	[%l7 + 0x48]
	sethi	0x1C61,	%i2
	alignaddrl	%i3,	%i0,	%g7
	sllx	%g5,	%i5,	%o2
	udivx	%o0,	0x1539,	%g6
	ldsw	[%l7 + 0x68],	%l1
	orncc	%i6,	%o1,	%l0
	edge8ln	%o5,	%l3,	%o7
	std	%f6,	[%l7 + 0x50]
	movcs	%xcc,	%l5,	%i4
	lduw	[%l7 + 0x0C],	%i1
	edge32	%o4,	%g1,	%i7
	ldx	[%l7 + 0x40],	%o3
	andncc	%g3,	%o6,	%l6
	sllx	%g2,	0x00,	%g4
	addc	%l2,	0x0DD4,	%i2
	xorcc	%i3,	0x040C,	%i0
	ldd	[%l7 + 0x58],	%f12
	addcc	%l4,	%g5,	%g7
	addcc	%o2,	0x0677,	%i5
	movle	%xcc,	%o0,	%l1
	movrgz	%i6,	%o1,	%l0
	umulcc	%o5,	%l3,	%o7
	array32	%g6,	%l5,	%i4
	ldd	[%l7 + 0x30],	%o4
	ldsw	[%l7 + 0x38],	%g1
	mova	%icc,	%i1,	%i7
	mulscc	%o3,	0x06DB,	%o6
	fmovsl	%icc,	%f15,	%f7
	orncc	%l6,	%g3,	%g4
	ldsh	[%l7 + 0x42],	%l2
	fmovs	%f2,	%f5
	fmovde	%xcc,	%f11,	%f4
	fnor	%f12,	%f8,	%f8
	srl	%g2,	%i2,	%i3
	fsrc1	%f0,	%f14
	movne	%xcc,	%i0,	%g5
	stw	%l4,	[%l7 + 0x58]
	fpadd32s	%f10,	%f3,	%f4
	or	%o2,	%i5,	%o0
	ldsb	[%l7 + 0x37],	%l1
	alignaddrl	%g7,	%o1,	%i6
	movrlz	%o5,	%l3,	%o7
	movpos	%xcc,	%g6,	%l5
	ldd	[%l7 + 0x08],	%i4
	fandnot2	%f0,	%f2,	%f0
	movrgez	%l0,	%o4,	%i1
	sth	%g1,	[%l7 + 0x56]
	std	%f8,	[%l7 + 0x28]
	fnands	%f1,	%f14,	%f3
	fandnot1	%f0,	%f4,	%f14
	fcmpgt32	%f2,	%f12,	%i7
	movrgez	%o3,	0x225,	%l6
	fmovdgu	%icc,	%f15,	%f6
	andn	%g3,	0x0182,	%g4
	sllx	%o6,	%l2,	%g2
	subcc	%i3,	%i2,	%g5
	movgu	%icc,	%l4,	%i0
	fand	%f0,	%f8,	%f2
	edge16l	%o2,	%o0,	%l1
	movvs	%icc,	%i5,	%o1
	sllx	%g7,	0x17,	%i6
	addcc	%o5,	%l3,	%o7
	fmul8x16	%f15,	%f14,	%f6
	srl	%l5,	%i4,	%g6
	movcs	%xcc,	%o4,	%l0
	xor	%g1,	%i1,	%i7
	lduw	[%l7 + 0x7C],	%l6
	lduw	[%l7 + 0x28],	%g3
	fsrc2s	%f12,	%f14
	mova	%xcc,	%g4,	%o3
	xorcc	%o6,	0x1987,	%g2
	alignaddr	%i3,	%i2,	%g5
	edge8	%l4,	%i0,	%o2
	andn	%l2,	%l1,	%o0
	sth	%o1,	[%l7 + 0x6C]
	movpos	%xcc,	%g7,	%i5
	lduw	[%l7 + 0x64],	%i6
	sdivcc	%o5,	0x0B85,	%o7
	ldd	[%l7 + 0x70],	%l2
	movvc	%icc,	%l5,	%i4
	move	%icc,	%g6,	%l0
	movpos	%icc,	%o4,	%g1
	and	%i1,	%i7,	%g3
	mulx	%g4,	%l6,	%o3
	sll	%g2,	%i3,	%i2
	edge16ln	%g5,	%l4,	%o6
	save %o2, %l2, %i0
	fmovrdlez	%o0,	%f10,	%f12
	movpos	%xcc,	%l1,	%g7
	sra	%o1,	0x0D,	%i6
	orn	%i5,	0x0957,	%o5
	udivx	%o7,	0x14EF,	%l5
	ldsb	[%l7 + 0x2A],	%l3
	smul	%i4,	0x1F08,	%l0
	smulcc	%o4,	%g6,	%i1
	popc	0x1D54,	%g1
	subcc	%g3,	%i7,	%g4
	fcmpd	%fcc1,	%f8,	%f10
	lduh	[%l7 + 0x7A],	%l6
	movvc	%xcc,	%o3,	%i3
	array8	%g2,	%i2,	%g5
	add	%o6,	0x162D,	%o2
	and	%l4,	0x196D,	%l2
	movne	%icc,	%o0,	%l1
	smul	%i0,	%g7,	%i6
	movcc	%xcc,	%i5,	%o5
	andncc	%o7,	%o1,	%l5
	sdivx	%l3,	0x1C4F,	%i4
	movvc	%icc,	%l0,	%g6
	save %o4, 0x0845, %g1
	movge	%xcc,	%g3,	%i1
	stw	%g4,	[%l7 + 0x70]
	mulscc	%l6,	%i7,	%i3
	fands	%f5,	%f11,	%f15
	andn	%o3,	0x00B5,	%i2
	mulscc	%g2,	%g5,	%o2
	movre	%l4,	%l2,	%o0
	ld	[%l7 + 0x20],	%f14
	andncc	%l1,	%o6,	%i0
	addc	%g7,	0x0E4C,	%i5
	lduw	[%l7 + 0x14],	%i6
	save %o7, %o5, %o1
	movg	%icc,	%l3,	%i4
	fcmpes	%fcc0,	%f3,	%f9
	edge32n	%l5,	%g6,	%o4
	movrlez	%l0,	%g3,	%g1
	fpackfix	%f6,	%f4
	addc	%g4,	0x084D,	%l6
	mulscc	%i1,	0x064E,	%i7
	fmovdgu	%xcc,	%f15,	%f0
	movcc	%icc,	%i3,	%i2
	edge32l	%o3,	%g2,	%o2
	array32	%l4,	%g5,	%o0
	st	%f5,	[%l7 + 0x60]
	fmovdvc	%xcc,	%f3,	%f2
	udivcc	%l1,	0x0B5B,	%l2
	movcs	%xcc,	%o6,	%i0
	or	%i5,	0x1EEE,	%g7
	ldsw	[%l7 + 0x2C],	%i6
	xnorcc	%o5,	%o1,	%l3
	movneg	%icc,	%o7,	%i4
	sra	%l5,	0x09,	%g6
	movcs	%xcc,	%l0,	%g3
	sdivx	%o4,	0x1427,	%g1
	movrlz	%g4,	%i1,	%i7
	fmovdvs	%icc,	%f5,	%f1
	movneg	%icc,	%l6,	%i3
	sra	%o3,	0x0F,	%g2
	movle	%xcc,	%o2,	%i2
	movleu	%icc,	%g5,	%l4
	fmovdvs	%xcc,	%f11,	%f9
	movrne	%o0,	%l2,	%l1
	std	%f2,	[%l7 + 0x40]
	edge16n	%o6,	%i0,	%g7
	movrne	%i5,	%o5,	%o1
	movl	%xcc,	%l3,	%o7
	edge8	%i6,	%i4,	%g6
	ldsw	[%l7 + 0x78],	%l5
	add	%g3,	0x0094,	%l0
	sllx	%o4,	%g4,	%i1
	fmuld8sux16	%f14,	%f5,	%f8
	ldsw	[%l7 + 0x24],	%i7
	srlx	%g1,	%i3,	%l6
	lduh	[%l7 + 0x66],	%o3
	movleu	%xcc,	%g2,	%o2
	fmovrdgz	%i2,	%f12,	%f12
	ldsb	[%l7 + 0x51],	%g5
	smul	%l4,	0x1D66,	%l2
	subccc	%o0,	%l1,	%o6
	edge32n	%i0,	%g7,	%o5
	fnands	%f1,	%f3,	%f12
	sethi	0x08CA,	%o1
	xnor	%i5,	%l3,	%i6
	mova	%xcc,	%o7,	%i4
	fmovrslez	%l5,	%f5,	%f5
	sethi	0x1C7D,	%g6
	stx	%g3,	[%l7 + 0x08]
	subc	%l0,	0x1EA3,	%g4
	fpadd32s	%f13,	%f14,	%f11
	fxnor	%f4,	%f0,	%f12
	stw	%i1,	[%l7 + 0x6C]
	movleu	%icc,	%o4,	%g1
	fmovdg	%icc,	%f11,	%f0
	movvs	%xcc,	%i7,	%l6
	movneg	%icc,	%i3,	%g2
	edge8l	%o2,	%i2,	%o3
	movg	%icc,	%g5,	%l4
	edge16l	%o0,	%l2,	%l1
	umulcc	%i0,	%g7,	%o5
	fxors	%f1,	%f8,	%f2
	subccc	%o1,	0x1EE7,	%o6
	sra	%i5,	0x00,	%l3
	fzeros	%f7
	std	%f6,	[%l7 + 0x08]
	orncc	%o7,	%i4,	%l5
	movge	%icc,	%g6,	%g3
	stx	%i6,	[%l7 + 0x38]
	movcc	%xcc,	%g4,	%l0
	srl	%i1,	0x11,	%o4
	sethi	0x0534,	%i7
	fabss	%f13,	%f0
	fcmpd	%fcc0,	%f2,	%f6
	udivcc	%g1,	0x07F8,	%l6
	sllx	%g2,	0x19,	%i3
	or	%i2,	0x15E1,	%o3
	fmovsleu	%icc,	%f8,	%f4
	xnor	%o2,	0x1EB9,	%l4
	andncc	%g5,	%l2,	%o0
	fmovdvc	%xcc,	%f6,	%f9
	or	%l1,	%i0,	%o5
	subccc	%g7,	%o1,	%o6
	lduw	[%l7 + 0x7C],	%i5
	edge32n	%o7,	%i4,	%l3
	edge16	%l5,	%g3,	%i6
	fmovsge	%icc,	%f13,	%f12
	mulscc	%g4,	0x046C,	%g6
	array8	%i1,	%l0,	%o4
	smul	%i7,	%g1,	%g2
	fmovrdgz	%i3,	%f6,	%f4
	add	%i2,	%l6,	%o3
	orcc	%l4,	0x1879,	%o2
	edge16	%g5,	%l2,	%l1
	mova	%xcc,	%i0,	%o5
	fmovdvc	%icc,	%f1,	%f9
	save %g7, 0x072C, %o1
	fpadd16s	%f5,	%f1,	%f14
	sub	%o6,	0x0C96,	%i5
	lduh	[%l7 + 0x1A],	%o0
	stw	%o7,	[%l7 + 0x34]
	edge16n	%l3,	%i4,	%g3
	andcc	%l5,	0x09F8,	%i6
	addcc	%g6,	%i1,	%g4
	fmovdcc	%xcc,	%f3,	%f11
	fmovsleu	%icc,	%f8,	%f2
	fpsub32	%f8,	%f8,	%f14
	movcc	%xcc,	%l0,	%i7
	movrgez	%o4,	%g2,	%i3
	smulcc	%i2,	0x197E,	%g1
	move	%icc,	%o3,	%l6
	mulx	%l4,	0x1858,	%o2
	fmovdgu	%icc,	%f7,	%f9
	mulx	%g5,	%l2,	%l1
	movrlz	%i0,	0x3BE,	%g7
	movle	%xcc,	%o1,	%o5
	edge32	%i5,	%o6,	%o0
	stb	%o7,	[%l7 + 0x62]
	alignaddr	%i4,	%l3,	%l5
	movcc	%xcc,	%i6,	%g3
	fmovrsgz	%g6,	%f2,	%f10
	ldub	[%l7 + 0x49],	%g4
	popc	%i1,	%i7
	smul	%l0,	%g2,	%o4
	movle	%icc,	%i2,	%g1
	xor	%o3,	0x15FA,	%i3
	movcc	%xcc,	%l6,	%o2
	udiv	%l4,	0x1F59,	%l2
	fmul8x16al	%f1,	%f13,	%f4
	ldsh	[%l7 + 0x0E],	%g5
	orn	%i0,	0x0D06,	%l1
	umul	%g7,	%o1,	%i5
	subc	%o6,	0x04C8,	%o0
	ldub	[%l7 + 0x73],	%o7
	fpsub16s	%f0,	%f5,	%f1
	st	%f12,	[%l7 + 0x68]
	st	%f4,	[%l7 + 0x20]
	alignaddrl	%i4,	%o5,	%l3
	edge8n	%i6,	%l5,	%g3
	st	%f12,	[%l7 + 0x34]
	orcc	%g4,	0x050E,	%g6
	movleu	%xcc,	%i1,	%i7
	stw	%l0,	[%l7 + 0x28]
	addccc	%g2,	%i2,	%g1
	movgu	%xcc,	%o4,	%i3
	move	%icc,	%l6,	%o3
	mova	%icc,	%o2,	%l4
	ldsh	[%l7 + 0x42],	%g5
	fmovrsne	%l2,	%f15,	%f3
	ldsh	[%l7 + 0x56],	%l1
	srl	%i0,	%g7,	%i5
	smul	%o6,	%o0,	%o1
	sth	%o7,	[%l7 + 0x42]
	edge8n	%o5,	%i4,	%i6
	udivx	%l5,	0x1497,	%l3
	orn	%g3,	%g4,	%g6
	std	%f14,	[%l7 + 0x18]
	ldd	[%l7 + 0x48],	%f2
	xor	%i1,	0x01A1,	%l0
	fmovdvs	%icc,	%f13,	%f14
	edge32	%i7,	%g2,	%g1
	addc	%i2,	0x11E9,	%o4
	alignaddr	%l6,	%o3,	%i3
	add	%l4,	0x0DA1,	%o2
	fnot2s	%f2,	%f0
	orncc	%g5,	0x0B70,	%l1
	movle	%xcc,	%l2,	%i0
	ldub	[%l7 + 0x5A],	%i5
	srl	%g7,	%o0,	%o1
	fandnot2s	%f11,	%f0,	%f3
	fmovrde	%o7,	%f0,	%f14
	smul	%o5,	%o6,	%i6
	orcc	%i4,	0x1995,	%l3
	movne	%icc,	%g3,	%g4
	fnot2s	%f4,	%f1
	fmovsge	%icc,	%f9,	%f12
	movle	%icc,	%g6,	%i1
	alignaddr	%l5,	%i7,	%l0
	addc	%g2,	%g1,	%o4
	lduw	[%l7 + 0x6C],	%l6
	umulcc	%o3,	0x177B,	%i2
	edge8	%i3,	%o2,	%g5
	subc	%l4,	0x07BE,	%l1
	lduw	[%l7 + 0x3C],	%l2
	popc	0x18CB,	%i5
	lduw	[%l7 + 0x2C],	%g7
	sllx	%i0,	0x1D,	%o0
	array32	%o7,	%o5,	%o1
	addccc	%o6,	0x02C3,	%i6
	mulx	%l3,	%g3,	%g4
	sllx	%g6,	0x12,	%i4
	ldsb	[%l7 + 0x0D],	%l5
	fmul8sux16	%f8,	%f8,	%f10
	fmovrdgez	%i1,	%f6,	%f14
	alignaddr	%l0,	%i7,	%g2
	ldsb	[%l7 + 0x7B],	%g1
	movg	%xcc,	%l6,	%o3
	restore %i2, 0x0742, %o4
	fcmple32	%f12,	%f8,	%i3
	fcmpes	%fcc3,	%f7,	%f1
	fsrc1	%f4,	%f2
	subc	%o2,	0x0F15,	%g5
	fmovrdne	%l1,	%f0,	%f4
	fmovdcs	%xcc,	%f0,	%f5
	fcmple16	%f10,	%f12,	%l2
	st	%f7,	[%l7 + 0x70]
	fmovdge	%icc,	%f2,	%f11
	movrlez	%i5,	%g7,	%i0
	fmovd	%f14,	%f4
	array32	%o0,	%o7,	%o5
	fmovdne	%icc,	%f4,	%f7
	edge16	%l4,	%o1,	%o6
	smul	%l3,	0x0B01,	%g3
	mulx	%g4,	%g6,	%i6
	sdiv	%l5,	0x1F03,	%i1
	umul	%i4,	0x094D,	%l0
	movg	%xcc,	%g2,	%g1
	addcc	%l6,	0x1F55,	%o3
	addcc	%i7,	0x1668,	%o4
	srax	%i3,	%i2,	%o2
	orcc	%l1,	0x0AE0,	%l2
	addccc	%g5,	%i5,	%g7
	sub	%i0,	0x15EB,	%o0
	save %o5, 0x1305, %l4
	edge8ln	%o7,	%o1,	%l3
	fmovrsgz	%o6,	%f6,	%f2
	fmovd	%f6,	%f10
	ldx	[%l7 + 0x50],	%g3
	fzero	%f8
	edge32ln	%g4,	%i6,	%l5
	edge8	%g6,	%i1,	%l0
	movrlez	%i4,	%g1,	%l6
	mulscc	%o3,	%g2,	%i7
	array32	%i3,	%o4,	%i2
	addccc	%o2,	0x0D1E,	%l2
	fmovscc	%xcc,	%f3,	%f13
	fornot1	%f10,	%f12,	%f2
	srl	%l1,	%g5,	%i5
	orn	%g7,	%i0,	%o0
	orn	%l4,	0x11B3,	%o7
	ldd	[%l7 + 0x38],	%o4
	ldsb	[%l7 + 0x6A],	%o1
	edge8ln	%o6,	%g3,	%l3
	siam	0x2
	ldub	[%l7 + 0x77],	%g4
	fexpand	%f15,	%f12
	move	%xcc,	%i6,	%l5
	orncc	%i1,	0x1536,	%l0
	ldd	[%l7 + 0x68],	%f6
	ldsb	[%l7 + 0x60],	%i4
	movleu	%xcc,	%g1,	%g6
	fcmple16	%f2,	%f0,	%o3
	umul	%l6,	%g2,	%i3
	sdivx	%i7,	0x0B18,	%i2
	fpmerge	%f13,	%f11,	%f4
	edge8	%o4,	%l2,	%o2
	fxnors	%f2,	%f13,	%f0
	edge32l	%l1,	%i5,	%g5
	fmul8ulx16	%f8,	%f6,	%f12
	movrne	%g7,	%o0,	%i0
	stw	%l4,	[%l7 + 0x6C]
	array8	%o7,	%o1,	%o6
	xnorcc	%g3,	0x0411,	%o5
	addccc	%l3,	0x18B3,	%g4
	restore %l5, %i1, %l0
	fmovdcc	%xcc,	%f13,	%f0
	subcc	%i6,	0x17DF,	%i4
	lduh	[%l7 + 0x30],	%g1
	movge	%icc,	%o3,	%l6
	fmovspos	%icc,	%f5,	%f12
	and	%g2,	0x095C,	%g6
	andn	%i3,	%i2,	%o4
	umul	%l2,	0x1112,	%i7
	fmovdg	%icc,	%f1,	%f7
	movrlez	%o2,	%l1,	%g5
	fandnot1s	%f3,	%f9,	%f7
	subccc	%g7,	%i5,	%o0
	fmovsneg	%icc,	%f8,	%f2
	srl	%i0,	%o7,	%l4
	ldd	[%l7 + 0x18],	%f6
	addc	%o6,	0x0CDE,	%g3
	movle	%xcc,	%o1,	%o5
	andcc	%l3,	%l5,	%g4
	or	%l0,	%i1,	%i4
	edge16	%i6,	%g1,	%l6
	fmovrdgz	%g2,	%f8,	%f10
	umul	%g6,	0x1620,	%o3
	movrgez	%i2,	%o4,	%l2
	subccc	%i3,	%i7,	%o2
	ldd	[%l7 + 0x50],	%f10
	sdivx	%g5,	0x0948,	%g7
	lduw	[%l7 + 0x60],	%i5
	fxnor	%f6,	%f2,	%f4
	or	%l1,	0x060F,	%o0
	ldsw	[%l7 + 0x74],	%o7
	sub	%i0,	%l4,	%g3
	ldsb	[%l7 + 0x57],	%o6
	fandnot1s	%f0,	%f4,	%f5
	umul	%o1,	%l3,	%o5
	sdivcc	%l5,	0x03BA,	%l0
	movcs	%icc,	%i1,	%i4
	ldsh	[%l7 + 0x2C],	%g4
	xorcc	%i6,	0x0F03,	%l6
	pdist	%f4,	%f8,	%f14
	fcmpeq16	%f10,	%f4,	%g2
	ldsh	[%l7 + 0x30],	%g6
	movl	%icc,	%o3,	%i2
	array32	%g1,	%o4,	%i3
	move	%xcc,	%l2,	%o2
	movre	%i7,	0x269,	%g5
	popc	%g7,	%i5
	sra	%l1,	%o0,	%o7
	ldub	[%l7 + 0x71],	%i0
	array8	%g3,	%o6,	%l4
	sdivx	%l3,	0x13A4,	%o1
	sll	%l5,	0x08,	%o5
	srax	%l0,	0x10,	%i4
	umul	%i1,	0x151C,	%g4
	array16	%l6,	%g2,	%i6
	movne	%xcc,	%o3,	%g6
	sub	%g1,	%i2,	%i3
	std	%f14,	[%l7 + 0x48]
	movg	%xcc,	%l2,	%o2
	and	%i7,	0x1884,	%g5
	sll	%g7,	%i5,	%l1
	fones	%f14
	fcmpne16	%f0,	%f12,	%o4
	fand	%f10,	%f12,	%f4
	mulscc	%o0,	0x18FD,	%i0
	fsrc2	%f2,	%f14
	array8	%o7,	%o6,	%g3
	addccc	%l4,	%o1,	%l3
	fmovsneg	%xcc,	%f2,	%f11
	movvs	%xcc,	%l5,	%o5
	udiv	%i4,	0x1E7E,	%i1
	fmovrdgez	%g4,	%f2,	%f4
	movgu	%xcc,	%l6,	%g2
	ldsw	[%l7 + 0x64],	%l0
	stw	%o3,	[%l7 + 0x6C]
	subccc	%g6,	0x098B,	%i6
	ldub	[%l7 + 0x52],	%g1
	fornot1	%f4,	%f12,	%f4
	edge16l	%i2,	%i3,	%o2
	array8	%i7,	%g5,	%g7
	andn	%l2,	0x06CC,	%i5
	movgu	%icc,	%o4,	%l1
	ldsw	[%l7 + 0x24],	%i0
	ldx	[%l7 + 0x50],	%o0
	ldsb	[%l7 + 0x5A],	%o7
	sub	%g3,	0x032B,	%l4
	fmovrdgez	%o6,	%f4,	%f8
	fmovrdlez	%l3,	%f14,	%f0
	xorcc	%l5,	%o1,	%o5
	smul	%i4,	0x0299,	%i1
	fnot2	%f8,	%f14
	ldsb	[%l7 + 0x1C],	%g4
	st	%f6,	[%l7 + 0x5C]
	andn	%g2,	0x093F,	%l6
	udivcc	%o3,	0x0C9A,	%g6
	srlx	%i6,	%l0,	%g1
	ldsh	[%l7 + 0x3A],	%i3
	restore %i2, %o2, %g5
	movpos	%xcc,	%i7,	%g7
	popc	%i5,	%l2
	orcc	%l1,	%o4,	%o0
	xor	%o7,	%g3,	%l4
	andcc	%o6,	%l3,	%i0
	lduh	[%l7 + 0x0C],	%o1
	array32	%o5,	%l5,	%i1
	udivcc	%g4,	0x0AA9,	%g2
	orcc	%l6,	%o3,	%i4
	srlx	%i6,	%l0,	%g1
	smul	%i3,	0x0607,	%i2
	fmovdge	%xcc,	%f4,	%f14
	sub	%g6,	0x0F6E,	%o2
	and	%i7,	0x1E8E,	%g5
	fmul8x16	%f12,	%f10,	%f12
	edge16ln	%g7,	%i5,	%l2
	subcc	%o4,	0x0934,	%o0
	movleu	%xcc,	%o7,	%g3
	sth	%l4,	[%l7 + 0x38]
	srl	%l1,	0x0D,	%l3
	fpack16	%f2,	%f11
	smul	%o6,	0x04C8,	%o1
	fsrc1s	%f9,	%f3
	edge16ln	%i0,	%l5,	%i1
	ldx	[%l7 + 0x60],	%o5
	sth	%g2,	[%l7 + 0x6E]
	movge	%icc,	%g4,	%l6
	fmovscs	%xcc,	%f0,	%f12
	fmovsgu	%xcc,	%f2,	%f14
	sub	%o3,	%i6,	%i4
	edge32ln	%l0,	%i3,	%g1
	movgu	%icc,	%g6,	%i2
	andcc	%o2,	%i7,	%g7
	addccc	%i5,	%g5,	%o4
	fmovsvc	%icc,	%f9,	%f12
	restore %o0, %o7, %g3
	ldd	[%l7 + 0x30],	%f2
	orcc	%l2,	0x1E16,	%l4
	fmovda	%icc,	%f2,	%f9
	ld	[%l7 + 0x28],	%f15
	xor	%l1,	0x1793,	%l3
	movrlz	%o1,	0x36A,	%o6
	fmovdg	%xcc,	%f13,	%f10
	or	%l5,	0x1A02,	%i0
	ldsb	[%l7 + 0x70],	%o5
	movleu	%xcc,	%i1,	%g2
	movrgz	%l6,	0x2C7,	%g4
	addccc	%i6,	0x1029,	%i4
	ld	[%l7 + 0x14],	%f15
	edge8l	%o3,	%l0,	%i3
	mulx	%g1,	0x1AB4,	%g6
	movle	%icc,	%i2,	%o2
	ldsw	[%l7 + 0x58],	%i7
	srax	%g7,	0x00,	%g5
	udiv	%o4,	0x0AE0,	%o0
	stx	%o7,	[%l7 + 0x70]
	udiv	%g3,	0x1D6F,	%l2
	edge32n	%l4,	%l1,	%i5
	andncc	%l3,	%o1,	%l5
	movcc	%xcc,	%o6,	%o5
	fnands	%f0,	%f1,	%f12
	ldd	[%l7 + 0x68],	%f14
	udiv	%i1,	0x1B42,	%i0
	movrlz	%g2,	%g4,	%l6
	alignaddrl	%i6,	%i4,	%l0
	sub	%i3,	0x151D,	%o3
	lduh	[%l7 + 0x64],	%g1
	ldd	[%l7 + 0x48],	%i2
	fand	%f6,	%f4,	%f4
	fornot1s	%f4,	%f3,	%f10
	ldx	[%l7 + 0x30],	%g6
	popc	%i7,	%o2
	smul	%g5,	%g7,	%o0
	sdivcc	%o4,	0x17ED,	%o7
	fnot1	%f14,	%f14
	fmovrdgz	%g3,	%f0,	%f6
	sub	%l4,	%l2,	%l1
	fmovdgu	%icc,	%f1,	%f1
	udivcc	%l3,	0x12AE,	%o1
	stx	%i5,	[%l7 + 0x38]
	fcmpne16	%f8,	%f2,	%l5
	fmovdgu	%xcc,	%f15,	%f15
	sub	%o5,	0x1D66,	%i1
	addccc	%i0,	0x137A,	%o6
	ld	[%l7 + 0x08],	%f6
	sra	%g4,	%g2,	%l6
	popc	0x1402,	%i6
	fpsub16	%f6,	%f10,	%f12
	addccc	%i4,	0x02FC,	%l0
	edge8l	%o3,	%i3,	%g1
	fors	%f9,	%f4,	%f3
	std	%f4,	[%l7 + 0x18]
	udivcc	%i2,	0x0373,	%i7
	xnor	%g6,	%g5,	%g7
	fmovsge	%xcc,	%f8,	%f12
	movrlez	%o0,	0x2B1,	%o4
	sdivcc	%o7,	0x0410,	%g3
	sth	%o2,	[%l7 + 0x0E]
	sdivx	%l4,	0x125F,	%l2
	umul	%l3,	0x1FD4,	%o1
	sll	%l1,	0x13,	%l5
	array16	%i5,	%o5,	%i0
	ldsw	[%l7 + 0x18],	%o6
	fmovdpos	%xcc,	%f10,	%f0
	add	%g4,	0x00A8,	%i1
	fxnor	%f10,	%f12,	%f14
	sra	%l6,	%g2,	%i4
	lduw	[%l7 + 0x58],	%l0
	fpadd32	%f4,	%f6,	%f12
	udiv	%o3,	0x02A5,	%i3
	fnegs	%f5,	%f5
	fmovd	%f10,	%f6
	movneg	%xcc,	%g1,	%i6
	subcc	%i7,	0x1EA3,	%g6
	sub	%g5,	0x1551,	%i2
	orn	%g7,	%o0,	%o7
	orncc	%g3,	0x1FC8,	%o2
	fornot2s	%f7,	%f14,	%f7
	sdivx	%l4,	0x06A8,	%l2
	fcmpeq16	%f8,	%f0,	%l3
	alignaddrl	%o1,	%l1,	%l5
	andn	%o4,	0x0775,	%i5
	subc	%o5,	0x0B34,	%i0
	udivx	%g4,	0x176F,	%o6
	xnorcc	%i1,	%g2,	%l6
	udivx	%l0,	0x05BD,	%o3
	fcmple16	%f10,	%f10,	%i3
	ldsh	[%l7 + 0x1E],	%i4
	fands	%f8,	%f8,	%f15
	umul	%g1,	%i7,	%g6
	stx	%i6,	[%l7 + 0x78]
	movvs	%xcc,	%i2,	%g7
	subccc	%g5,	0x09F5,	%o0
	edge32n	%o7,	%g3,	%l4
	fnot2s	%f4,	%f14
	orn	%l2,	0x149F,	%l3
	edge32	%o2,	%l1,	%l5
	movrgez	%o4,	%i5,	%o5
	sdivx	%o1,	0x0479,	%i0
	array16	%g4,	%o6,	%g2
	mulscc	%i1,	%l0,	%o3
	fandnot2	%f10,	%f14,	%f14
	addc	%l6,	%i3,	%g1
	lduh	[%l7 + 0x3C],	%i7
	fornot2s	%f3,	%f3,	%f2
	orncc	%i4,	%i6,	%i2
	fcmpes	%fcc1,	%f13,	%f0
	alignaddr	%g7,	%g5,	%g6
	array32	%o7,	%g3,	%o0
	addcc	%l4,	%l2,	%l3
	movrlez	%o2,	0x33C,	%l5
	orcc	%o4,	%i5,	%l1
	smul	%o5,	%i0,	%g4
	std	%f6,	[%l7 + 0x60]
	fors	%f7,	%f13,	%f8
	fmovrdgez	%o6,	%f10,	%f0
	ldd	[%l7 + 0x68],	%f12
	xor	%o1,	%g2,	%l0
	movn	%xcc,	%i1,	%o3
	sth	%l6,	[%l7 + 0x76]
	movrlz	%i3,	0x2BD,	%g1
	udiv	%i4,	0x07FC,	%i6
	edge8ln	%i2,	%g7,	%g5
	umul	%i7,	0x1E46,	%g6
	umulcc	%g3,	0x1835,	%o7
	sth	%l4,	[%l7 + 0x5C]
	fmovsg	%xcc,	%f14,	%f3
	edge32	%l2,	%o0,	%o2
	edge16l	%l5,	%o4,	%l3
	ldsb	[%l7 + 0x0B],	%l1
	fmovspos	%xcc,	%f2,	%f3
	movrgez	%i5,	0x1EC,	%o5
	sub	%g4,	%i0,	%o1
	st	%f15,	[%l7 + 0x68]
	edge16l	%g2,	%l0,	%o6
	ld	[%l7 + 0x48],	%f2
	edge16n	%i1,	%o3,	%i3
	andcc	%g1,	0x0F17,	%i4
	sllx	%i6,	%i2,	%g7
	alignaddr	%g5,	%l6,	%i7
	edge32	%g3,	%o7,	%g6
	stx	%l2,	[%l7 + 0x68]
	sll	%o0,	0x00,	%o2
	movrgz	%l4,	0x1AB,	%o4
	ldx	[%l7 + 0x60],	%l3
	xnor	%l1,	%l5,	%o5
	srl	%g4,	0x18,	%i5
	subcc	%o1,	%g2,	%l0
	sll	%i0,	%o6,	%i1
	array16	%i3,	%o3,	%g1
	movneg	%icc,	%i4,	%i6
	array8	%i2,	%g5,	%l6
	movleu	%xcc,	%g7,	%g3
	move	%icc,	%i7,	%g6
	edge8ln	%o7,	%o0,	%o2
	edge8l	%l2,	%o4,	%l3
	fmovrsne	%l4,	%f5,	%f7
	fmovdneg	%icc,	%f12,	%f14
	fnot1	%f10,	%f2
	edge16l	%l1,	%o5,	%l5
	fpsub16	%f6,	%f10,	%f12
	fmovrdgez	%g4,	%f0,	%f12
	fmovsvs	%xcc,	%f3,	%f10
	lduh	[%l7 + 0x6A],	%i5
	umulcc	%o1,	%l0,	%i0
	fmovsneg	%xcc,	%f9,	%f15
	addcc	%o6,	0x17BB,	%i1
	srlx	%i3,	0x03,	%o3
	fmuld8sux16	%f3,	%f8,	%f4
	fsrc1s	%f6,	%f15
	fmovsgu	%xcc,	%f11,	%f15
	restore %g2, 0x1362, %i4
	array8	%g1,	%i6,	%g5
	fmovdn	%xcc,	%f0,	%f7
	fmovsa	%xcc,	%f10,	%f0
	edge32l	%l6,	%g7,	%g3
	sethi	0x15CE,	%i7
	ldsw	[%l7 + 0x14],	%i2
	orn	%g6,	0x0174,	%o7
	andcc	%o0,	%l2,	%o2
	smul	%l3,	%l4,	%l1
	move	%icc,	%o5,	%l5
	addc	%g4,	0x093E,	%o4
	sra	%o1,	%l0,	%i0
	edge16	%i5,	%o6,	%i3
	edge16l	%i1,	%g2,	%o3
	lduw	[%l7 + 0x70],	%g1
	srl	%i4,	%g5,	%i6
	subcc	%g7,	%g3,	%i7
	fmovrdlz	%i2,	%f0,	%f14
	fpmerge	%f4,	%f0,	%f8
	movcc	%icc,	%l6,	%o7
	fcmple16	%f4,	%f6,	%o0
	srlx	%l2,	%g6,	%l3
	fpmerge	%f12,	%f2,	%f10
	movre	%o2,	0x1B1,	%l1
	xorcc	%l4,	0x02B8,	%l5
	ldub	[%l7 + 0x42],	%o5
	movn	%xcc,	%g4,	%o4
	mova	%xcc,	%l0,	%i0
	orcc	%o1,	0x1C45,	%o6
	fmul8x16al	%f2,	%f1,	%f12
	fmovse	%xcc,	%f14,	%f2
	ldsb	[%l7 + 0x40],	%i3
	stw	%i1,	[%l7 + 0x14]
	andn	%i5,	%o3,	%g1
	fmovrdlz	%g2,	%f10,	%f8
	fmovrse	%g5,	%f8,	%f5
	xnor	%i4,	%g7,	%g3
	ldx	[%l7 + 0x58],	%i7
	edge8n	%i6,	%i2,	%o7
	alignaddrl	%l6,	%o0,	%g6
	fxors	%f4,	%f7,	%f7
	fcmpeq32	%f12,	%f2,	%l3
	srlx	%o2,	0x1A,	%l1
	ldx	[%l7 + 0x68],	%l2
	subccc	%l4,	0x14A6,	%o5
	sth	%l5,	[%l7 + 0x7A]
	fxors	%f2,	%f2,	%f14
	movvc	%xcc,	%o4,	%g4
	edge32	%i0,	%l0,	%o6
	ldx	[%l7 + 0x10],	%o1
	fmovspos	%icc,	%f6,	%f7
	sdiv	%i1,	0x1069,	%i3
	movrlez	%i5,	0x3E7,	%g1
	edge16n	%o3,	%g5,	%g2
	srax	%i4,	0x0B,	%g7
	movpos	%icc,	%i7,	%g3
	movvc	%icc,	%i6,	%i2
	srax	%l6,	0x07,	%o7
	ldd	[%l7 + 0x18],	%f2
	movrgz	%g6,	0x241,	%l3
	movrlez	%o2,	0x1D5,	%l1
	fmovdcc	%icc,	%f13,	%f14
	movg	%xcc,	%o0,	%l2
	fmovsge	%icc,	%f4,	%f13
	move	%xcc,	%o5,	%l4
	edge32l	%l5,	%o4,	%i0
	fmovdneg	%xcc,	%f9,	%f15
	movvs	%xcc,	%g4,	%l0
	array16	%o1,	%o6,	%i3
	xnor	%i5,	%i1,	%g1
	udivx	%o3,	0x0445,	%g2
	fmovsa	%xcc,	%f14,	%f2
	movcc	%xcc,	%i4,	%g7
	movrlz	%i7,	%g5,	%g3
	edge16	%i6,	%i2,	%l6
	andncc	%o7,	%g6,	%l3
	fcmple16	%f14,	%f8,	%o2
	popc	0x1A17,	%l1
	sethi	0x04EA,	%o0
	sethi	0x1231,	%l2
	andn	%l4,	0x0304,	%l5
	movge	%xcc,	%o5,	%i0
	fmovsge	%icc,	%f5,	%f8
	andn	%g4,	0x1AAB,	%l0
	fmul8x16al	%f1,	%f6,	%f8
	sth	%o4,	[%l7 + 0x2E]
	umul	%o6,	0x143A,	%i3
	umul	%i5,	0x1E3E,	%i1
	fpadd32	%f8,	%f12,	%f0
	fmovrsgez	%o1,	%f5,	%f3
	ld	[%l7 + 0x3C],	%f13
	andcc	%o3,	0x171F,	%g2
	umulcc	%g1,	0x1AD4,	%g7
	xorcc	%i7,	0x0ADA,	%g5
	fmovspos	%xcc,	%f7,	%f6
	st	%f5,	[%l7 + 0x50]
	sethi	0x17EB,	%g3
	movcs	%xcc,	%i6,	%i4
	fpmerge	%f3,	%f14,	%f8
	srl	%l6,	0x10,	%o7
	edge8n	%i2,	%g6,	%l3
	movrlz	%l1,	%o0,	%l2
	edge8n	%l4,	%l5,	%o5
	fors	%f13,	%f14,	%f8
	sdiv	%o2,	0x0F2F,	%i0
	stb	%g4,	[%l7 + 0x3D]
	movrgez	%o4,	0x12E,	%o6
	ld	[%l7 + 0x70],	%f14
	sdivcc	%l0,	0x0BBC,	%i5
	movre	%i1,	%o1,	%i3
	subccc	%g2,	%o3,	%g7
	array8	%i7,	%g1,	%g5
	udivcc	%g3,	0x083C,	%i6
	edge8l	%l6,	%o7,	%i2
	save %g6, 0x19FD, %i4
	orn	%l3,	%l1,	%o0
	sethi	0x0A55,	%l4
	fmovd	%f2,	%f12
	edge32n	%l5,	%l2,	%o2
	alignaddr	%o5,	%i0,	%g4
	lduw	[%l7 + 0x10],	%o6
	fmul8ulx16	%f6,	%f10,	%f12
	movrgez	%o4,	0x12B,	%l0
	array32	%i5,	%o1,	%i3
	stx	%g2,	[%l7 + 0x50]
	ldx	[%l7 + 0x48],	%i1
	edge32n	%g7,	%i7,	%o3
	mulx	%g5,	%g1,	%g3
	fnot2s	%f14,	%f13
	fxnor	%f6,	%f10,	%f8
	alignaddr	%l6,	%i6,	%i2
	edge8ln	%o7,	%g6,	%l3
	movre	%i4,	%l1,	%l4
	addc	%o0,	%l2,	%l5
	edge8	%o2,	%i0,	%o5
	fpack32	%f12,	%f0,	%f0
	mulx	%o6,	%o4,	%l0
	and	%g4,	%i5,	%i3
	save %g2, 0x0469, %i1
	udiv	%g7,	0x07AB,	%o1
	fcmple16	%f2,	%f12,	%o3
	udivx	%i7,	0x038A,	%g1
	movrlz	%g5,	0x362,	%g3
	udivx	%l6,	0x1399,	%i2
	movne	%icc,	%i6,	%g6
	orcc	%l3,	0x130D,	%i4
	ldd	[%l7 + 0x18],	%f12
	sub	%l1,	0x16BD,	%o7
	add	%o0,	0x0F1B,	%l4
	ldd	[%l7 + 0x10],	%f8
	udiv	%l2,	0x18EB,	%o2
	fnors	%f8,	%f5,	%f13
	fcmple16	%f0,	%f0,	%i0
	sllx	%o5,	%l5,	%o6
	fmovrse	%l0,	%f8,	%f8
	array16	%o4,	%g4,	%i5
	edge16l	%g2,	%i3,	%i1
	sdiv	%g7,	0x0A1F,	%o3
	fcmpne16	%f8,	%f10,	%i7
	ldsb	[%l7 + 0x45],	%o1
	srl	%g5,	0x1D,	%g1
	lduw	[%l7 + 0x58],	%g3
	save %l6, 0x0664, %i6
	mulx	%i2,	%g6,	%l3
	smul	%i4,	%l1,	%o7
	movre	%o0,	%l4,	%l2
	umulcc	%i0,	%o2,	%l5
	add	%o5,	%o6,	%l0
	stb	%g4,	[%l7 + 0x66]
	array8	%o4,	%g2,	%i3
	movl	%xcc,	%i1,	%i5
	fmovrdlz	%g7,	%f12,	%f10
	movgu	%xcc,	%i7,	%o3
	lduh	[%l7 + 0x2A],	%o1
	array32	%g1,	%g5,	%g3
	andncc	%l6,	%i6,	%g6
	movge	%xcc,	%l3,	%i4
	ldsh	[%l7 + 0x1A],	%l1
	movpos	%xcc,	%o7,	%o0
	ldd	[%l7 + 0x40],	%i2
	smulcc	%l4,	0x1BE6,	%i0
	edge32n	%l2,	%o2,	%l5
	edge8l	%o6,	%o5,	%l0
	ldd	[%l7 + 0x48],	%o4
	sth	%g2,	[%l7 + 0x6A]
	sth	%g4,	[%l7 + 0x18]
	save %i3, 0x05DD, %i1
	subc	%i5,	%g7,	%i7
	fmovda	%icc,	%f3,	%f7
	fmovsle	%icc,	%f5,	%f7
	addccc	%o3,	%g1,	%g5
	srax	%o1,	%l6,	%i6
	smulcc	%g3,	0x118A,	%g6
	movvs	%icc,	%l3,	%i4
	ldd	[%l7 + 0x78],	%f4
	subc	%o7,	%l1,	%o0
	sll	%i2,	%l4,	%l2
	fmovrse	%i0,	%f14,	%f8
	for	%f10,	%f14,	%f2
	fmovdge	%xcc,	%f12,	%f13
	sethi	0x1584,	%o2
	movne	%xcc,	%o6,	%o5
	stb	%l0,	[%l7 + 0x52]
	fornot2s	%f9,	%f7,	%f14
	movrgez	%o4,	%l5,	%g2
	mova	%xcc,	%i3,	%i1
	ldsh	[%l7 + 0x44],	%g4
	sll	%i5,	%g7,	%i7
	fcmpeq32	%f0,	%f6,	%o3
	ldub	[%l7 + 0x57],	%g1
	xorcc	%o1,	0x15F0,	%g5
	umulcc	%i6,	0x1D52,	%l6
	array8	%g6,	%l3,	%i4
	edge32n	%o7,	%g3,	%o0
	edge32n	%l1,	%i2,	%l4
	st	%f8,	[%l7 + 0x6C]
	fands	%f0,	%f10,	%f15
	alignaddrl	%l2,	%i0,	%o2
	movrgez	%o5,	%o6,	%o4
	udiv	%l0,	0x19ED,	%l5
	movgu	%xcc,	%g2,	%i1
	movleu	%icc,	%i3,	%g4
	xnor	%g7,	%i7,	%i5
	fmovrdne	%o3,	%f14,	%f0
	array8	%o1,	%g5,	%i6
	faligndata	%f12,	%f2,	%f4
	movrne	%g1,	%l6,	%g6
	std	%f8,	[%l7 + 0x08]
	andncc	%i4,	%o7,	%g3
	movvs	%icc,	%l3,	%l1
	fcmpeq32	%f4,	%f12,	%o0
	movpos	%icc,	%i2,	%l4
	addc	%i0,	0x03A1,	%l2
	mulx	%o5,	%o6,	%o2
	ldd	[%l7 + 0x38],	%f6
	mulx	%l0,	0x1A5B,	%l5
	movg	%xcc,	%g2,	%o4
	fpadd16	%f0,	%f2,	%f2
	stx	%i1,	[%l7 + 0x30]
	movl	%xcc,	%i3,	%g7
	lduw	[%l7 + 0x30],	%i7
	movrgz	%g4,	%o3,	%o1
	ldd	[%l7 + 0x38],	%g4
	fmovsleu	%icc,	%f14,	%f8
	edge16ln	%i6,	%i5,	%l6
	udivcc	%g1,	0x047A,	%g6
	xorcc	%i4,	%o7,	%g3
	stb	%l1,	[%l7 + 0x60]
	sdiv	%o0,	0x1FBF,	%i2
	fornot2	%f0,	%f6,	%f14
	xor	%l4,	0x1C25,	%l3
	xor	%l2,	0x09A5,	%o5
	fmovsleu	%icc,	%f2,	%f2
	fmovdcc	%icc,	%f9,	%f15
	xor	%o6,	%i0,	%l0
	orcc	%l5,	0x0C1B,	%o2
	ld	[%l7 + 0x48],	%f11
	popc	0x15EC,	%g2
	restore %i1, 0x1F7E, %o4
	ld	[%l7 + 0x3C],	%f9
	fcmpeq16	%f12,	%f4,	%i3
	udivcc	%g7,	0x1475,	%i7
	movvs	%xcc,	%g4,	%o1
	movrgz	%g5,	0x141,	%o3
	orcc	%i6,	%i5,	%g1
	edge8ln	%l6,	%g6,	%o7
	edge32ln	%g3,	%l1,	%i4
	edge8	%o0,	%i2,	%l4
	lduh	[%l7 + 0x14],	%l3
	ldub	[%l7 + 0x62],	%o5
	edge16l	%o6,	%l2,	%l0
	subcc	%l5,	%o2,	%i0
	movvs	%xcc,	%i1,	%o4
	edge8ln	%i3,	%g2,	%g7
	stb	%g4,	[%l7 + 0x25]
	fnor	%f8,	%f10,	%f10
	movrgez	%i7,	0x2A9,	%g5
	fmovrsne	%o1,	%f2,	%f13
	fornot1s	%f6,	%f6,	%f11
	array32	%o3,	%i5,	%i6
	alignaddr	%g1,	%g6,	%l6
	sdiv	%g3,	0x1273,	%l1
	sdivcc	%i4,	0x05B8,	%o7
	fmovscs	%xcc,	%f5,	%f10
	xor	%i2,	0x07F0,	%l4
	fmovsgu	%xcc,	%f11,	%f10
	popc	%l3,	%o5
	lduw	[%l7 + 0x7C],	%o0
	edge16n	%l2,	%l0,	%o6
	mulx	%o2,	0x1823,	%l5
	srl	%i0,	0x05,	%i1
	movrlez	%o4,	%i3,	%g2
	movne	%icc,	%g4,	%g7
	edge32	%g5,	%i7,	%o1
	fmovrsne	%o3,	%f5,	%f7
	sdivx	%i5,	0x1D89,	%i6
	movne	%xcc,	%g6,	%g1
	restore %l6, 0x0653, %g3
	movrgz	%i4,	%l1,	%o7
	movg	%xcc,	%l4,	%l3
	fmovdvc	%xcc,	%f7,	%f11
	fmovdvc	%xcc,	%f2,	%f8
	andn	%i2,	%o5,	%l2
	sdivcc	%o0,	0x0BD4,	%o6
	sra	%l0,	%l5,	%i0
	array32	%i1,	%o4,	%i3
	array8	%g2,	%g4,	%o2
	ldub	[%l7 + 0x32],	%g7
	orncc	%i7,	%o1,	%g5
	movrgez	%o3,	0x231,	%i6
	udivcc	%i5,	0x11F4,	%g6
	ldsb	[%l7 + 0x4D],	%g1
	edge16n	%l6,	%i4,	%g3
	move	%xcc,	%l1,	%l4
	lduh	[%l7 + 0x56],	%o7
	subc	%i2,	%l3,	%l2
	fmovsl	%xcc,	%f7,	%f4
	movcs	%icc,	%o0,	%o5
	smulcc	%o6,	0x1DE8,	%l0
	stb	%l5,	[%l7 + 0x5A]
	stb	%i1,	[%l7 + 0x69]
	udivcc	%i0,	0x12EB,	%i3
	orcc	%g2,	%o4,	%g4
	edge16n	%g7,	%o2,	%o1
	andn	%g5,	0x1863,	%i7
	movrne	%i6,	%o3,	%i5
	movge	%xcc,	%g1,	%l6
	umul	%i4,	0x00F1,	%g6
	edge16l	%l1,	%g3,	%l4
	movg	%xcc,	%i2,	%o7
	movn	%xcc,	%l2,	%o0
	movg	%icc,	%l3,	%o6
	orncc	%o5,	%l0,	%l5
	save %i0, %i3, %i1
	fnegs	%f2,	%f3
	edge32ln	%g2,	%g4,	%o4
	movcs	%icc,	%o2,	%g7
	smulcc	%o1,	%i7,	%g5
	movcc	%xcc,	%o3,	%i6
	movpos	%icc,	%i5,	%g1
	andn	%i4,	0x06B5,	%l6
	umulcc	%g6,	%l1,	%l4
	andcc	%g3,	%o7,	%l2
	fmovscs	%icc,	%f11,	%f2
	fxors	%f3,	%f4,	%f9
	sdivcc	%i2,	0x05AA,	%l3
	popc	%o6,	%o5
	sub	%o0,	0x1F97,	%l0
	array32	%l5,	%i0,	%i1
	sdiv	%i3,	0x0D8D,	%g4
	orncc	%o4,	0x091C,	%o2
	movrne	%g7,	0x13C,	%g2
	fors	%f5,	%f5,	%f13
	fmovrsgez	%i7,	%f0,	%f12
	sdivcc	%g5,	0x0770,	%o1
	fmovdleu	%xcc,	%f12,	%f1
	edge8	%i6,	%i5,	%o3
	fmovdcc	%icc,	%f12,	%f2
	andn	%i4,	%g1,	%l6
	movgu	%icc,	%g6,	%l1
	subc	%l4,	0x1756,	%o7
	movneg	%icc,	%l2,	%g3
	stx	%i2,	[%l7 + 0x20]
	movrne	%o6,	0x0B6,	%o5
	movrgz	%l3,	%o0,	%l5
	movvs	%xcc,	%l0,	%i1
	fmovsgu	%xcc,	%f6,	%f3
	restore %i0, %i3, %o4
	popc	%o2,	%g7
	movvs	%xcc,	%g4,	%g2
	edge32l	%i7,	%g5,	%i6
	fcmple16	%f12,	%f6,	%o1
	movl	%xcc,	%o3,	%i4
	fxor	%f2,	%f12,	%f10
	fands	%f14,	%f2,	%f1
	fmovse	%icc,	%f7,	%f4
	edge8	%g1,	%l6,	%i5
	movcc	%xcc,	%g6,	%l1
	lduh	[%l7 + 0x74],	%l4
	edge16n	%o7,	%l2,	%g3
	ldd	[%l7 + 0x50],	%f14
	udivcc	%i2,	0x19F5,	%o6
	fmovsl	%xcc,	%f15,	%f0
	movcc	%icc,	%o5,	%l3
	movleu	%icc,	%o0,	%l5
	sethi	0x134C,	%i1
	addcc	%l0,	0x1E9A,	%i0
	addcc	%i3,	0x0B6A,	%o2
	movne	%icc,	%o4,	%g4
	ldsb	[%l7 + 0x7F],	%g2
	smul	%g7,	%g5,	%i6
	movcs	%icc,	%i7,	%o1
	mulx	%o3,	%g1,	%l6
	xorcc	%i4,	%g6,	%i5
	sll	%l1,	0x13,	%o7
	subcc	%l4,	0x0F5A,	%l2
	st	%f13,	[%l7 + 0x0C]
	fpadd16	%f4,	%f2,	%f0
	movge	%icc,	%i2,	%o6
	umulcc	%g3,	0x0347,	%o5
	edge8	%l3,	%l5,	%i1
	movvs	%icc,	%o0,	%i0
	udivx	%l0,	0x12D5,	%i3
	addc	%o2,	0x07F6,	%o4
	fmovrslz	%g2,	%f6,	%f4
	fabsd	%f10,	%f4
	sdivx	%g4,	0x1869,	%g7
	sdivcc	%i6,	0x1C01,	%g5
	stw	%i7,	[%l7 + 0x3C]
	movleu	%xcc,	%o1,	%g1
	subcc	%l6,	%o3,	%i4
	subccc	%g6,	%l1,	%o7
	ldd	[%l7 + 0x70],	%f0
	smulcc	%i5,	%l2,	%i2
	orncc	%l4,	%g3,	%o5
	smul	%o6,	0x1CED,	%l3
	movle	%xcc,	%i1,	%o0
	movpos	%icc,	%l5,	%i0
	subcc	%i3,	%o2,	%o4
	orn	%g2,	0x0AEF,	%g4
	array16	%g7,	%l0,	%g5
	movrne	%i7,	%i6,	%g1
	movne	%xcc,	%o1,	%l6
	sll	%i4,	%g6,	%o3
	movrgez	%o7,	%l1,	%l2
	sdivx	%i2,	0x0B1B,	%i5
	edge8n	%l4,	%o5,	%g3
	st	%f3,	[%l7 + 0x50]
	array8	%o6,	%i1,	%l3
	xnorcc	%l5,	%o0,	%i3
	movn	%xcc,	%o2,	%o4
	sethi	0x147E,	%i0
	restore %g2, 0x1FF7, %g7
	subcc	%g4,	0x0796,	%l0
	edge16	%g5,	%i6,	%g1
	fandnot1s	%f10,	%f6,	%f4
	fxors	%f8,	%f11,	%f0
	orcc	%i7,	%o1,	%i4
	fpack16	%f2,	%f15
	array8	%g6,	%l6,	%o7
	orcc	%l1,	%o3,	%l2
	udivcc	%i2,	0x19E7,	%l4
	movl	%icc,	%i5,	%g3
	and	%o6,	%i1,	%l3
	sdivx	%o5,	0x00BB,	%o0
	st	%f9,	[%l7 + 0x08]
	movpos	%xcc,	%l5,	%o2
	xorcc	%o4,	%i0,	%i3
	fcmple32	%f8,	%f8,	%g2
	movn	%xcc,	%g7,	%l0
	array32	%g5,	%g4,	%g1
	xorcc	%i6,	0x0414,	%i7
	std	%f0,	[%l7 + 0x20]
	movl	%xcc,	%o1,	%i4
	movn	%icc,	%g6,	%l6
	srlx	%o7,	0x0B,	%o3
	subccc	%l2,	0x1574,	%i2
	array8	%l4,	%l1,	%i5
	subc	%g3,	0x0ED7,	%i1
	sllx	%l3,	%o5,	%o6
	array8	%o0,	%l5,	%o2
	movl	%icc,	%o4,	%i3
	fmovrdne	%g2,	%f12,	%f0
	xor	%i0,	%l0,	%g7
	fmovse	%icc,	%f6,	%f6
	fmovdpos	%icc,	%f6,	%f7
	addcc	%g4,	%g5,	%g1
	fmovdneg	%icc,	%f11,	%f2
	fzero	%f2
	movge	%xcc,	%i7,	%o1
	fmovdcs	%icc,	%f6,	%f6
	stb	%i4,	[%l7 + 0x76]
	mova	%icc,	%g6,	%i6
	edge8l	%o7,	%l6,	%l2
	andncc	%o3,	%i2,	%l1
	sllx	%i5,	%l4,	%i1
	xor	%g3,	%l3,	%o5
	or	%o0,	0x0341,	%l5
	fmul8x16	%f13,	%f0,	%f6
	sll	%o6,	0x13,	%o2
	movle	%icc,	%i3,	%o4
	addc	%g2,	%l0,	%i0
	movne	%xcc,	%g4,	%g5
	ldsb	[%l7 + 0x11],	%g1
	movl	%xcc,	%i7,	%g7
	fcmpeq32	%f2,	%f0,	%o1
	fmovda	%xcc,	%f11,	%f12
	mulscc	%i4,	0x088A,	%g6
	movre	%o7,	%l6,	%l2
	edge16	%i6,	%o3,	%l1
	movl	%icc,	%i5,	%l4
	ldd	[%l7 + 0x58],	%f12
	fornot1s	%f13,	%f4,	%f0
	and	%i1,	%i2,	%g3
	addcc	%l3,	%o5,	%o0
	movn	%xcc,	%l5,	%o6
	fcmpd	%fcc3,	%f8,	%f10
	sdivcc	%o2,	0x176A,	%o4
	movvc	%xcc,	%i3,	%g2
	orcc	%l0,	0x0F75,	%i0
	subc	%g4,	0x1108,	%g1
	siam	0x5
	movl	%icc,	%g5,	%i7
	movrgez	%o1,	0x14B,	%i4
	edge8l	%g6,	%g7,	%l6
	movg	%xcc,	%l2,	%i6
	subccc	%o3,	%l1,	%o7
	movneg	%xcc,	%i5,	%l4
	edge32l	%i1,	%i2,	%l3
	fmovsleu	%xcc,	%f5,	%f0
	stb	%g3,	[%l7 + 0x35]
	edge8n	%o0,	%l5,	%o6
	movcc	%xcc,	%o2,	%o4
	movrgz	%i3,	%g2,	%l0
	movre	%o5,	0x0ED,	%g4
	fmovrde	%i0,	%f14,	%f6
	fmovscc	%xcc,	%f4,	%f1
	stb	%g5,	[%l7 + 0x5C]
	srl	%i7,	0x19,	%o1
	alignaddrl	%i4,	%g6,	%g7
	movpos	%xcc,	%l6,	%l2
	movne	%xcc,	%g1,	%i6
	ldd	[%l7 + 0x70],	%f6
	movvc	%icc,	%o3,	%l1
	fmovdneg	%xcc,	%f6,	%f5
	movcc	%icc,	%i5,	%o7
	srax	%l4,	%i2,	%l3
	edge16l	%i1,	%g3,	%o0
	fsrc2s	%f5,	%f12
	movrgez	%o6,	%o2,	%o4
	orcc	%i3,	%g2,	%l5
	subccc	%l0,	%o5,	%g4
	movl	%icc,	%g5,	%i7
	xnor	%o1,	%i4,	%i0
	subcc	%g6,	%l6,	%g7
	addc	%l2,	%g1,	%o3
	udivcc	%i6,	0x0AD2,	%l1
	orcc	%o7,	%l4,	%i5
	movrgez	%i2,	%l3,	%i1
	stb	%o0,	[%l7 + 0x09]
	array16	%o6,	%o2,	%g3
	orcc	%i3,	%o4,	%l5
	alignaddr	%g2,	%l0,	%g4
	srax	%o5,	%g5,	%i7
	smulcc	%i4,	0x065A,	%o1
	fnand	%f2,	%f4,	%f14
	xor	%i0,	0x19CF,	%l6
	edge16	%g6,	%g7,	%l2
	xnor	%o3,	0x0794,	%g1
	stw	%l1,	[%l7 + 0x34]
	sllx	%i6,	%o7,	%i5
	fornot2s	%f13,	%f11,	%f1
	fone	%f14
	edge16n	%l4,	%l3,	%i1
	edge16n	%i2,	%o0,	%o6
	fcmpne16	%f2,	%f2,	%g3
	fnands	%f13,	%f9,	%f5
	edge16	%o2,	%i3,	%l5
	fandnot2s	%f13,	%f12,	%f15
	movvs	%icc,	%g2,	%l0
	edge8ln	%g4,	%o5,	%g5
	sll	%i7,	%i4,	%o4
	lduw	[%l7 + 0x30],	%o1
	movn	%xcc,	%l6,	%i0
	xor	%g6,	0x0BBD,	%l2
	orncc	%g7,	%g1,	%l1
	srlx	%i6,	0x01,	%o7
	ldub	[%l7 + 0x27],	%i5
	ldd	[%l7 + 0x68],	%o2
	movg	%icc,	%l4,	%i1
	fnor	%f8,	%f0,	%f8
	fxors	%f5,	%f15,	%f15
	sub	%i2,	0x1E08,	%o0
	movle	%icc,	%l3,	%g3
	srlx	%o6,	%o2,	%i3
	movn	%xcc,	%g2,	%l5
	xor	%g4,	0x161C,	%l0
	movcs	%xcc,	%g5,	%i7
	udivcc	%o5,	0x0E9E,	%i4
	smul	%o1,	%l6,	%o4
	orncc	%g6,	%l2,	%g7
	ld	[%l7 + 0x20],	%f14
	fmovsl	%icc,	%f1,	%f14
	mulx	%g1,	%i0,	%l1
	xnorcc	%o7,	%i6,	%i5
	edge8	%l4,	%i1,	%o3
	srl	%i2,	%l3,	%o0
	fpsub16	%f8,	%f6,	%f10
	sll	%o6,	%o2,	%g3
	array16	%i3,	%l5,	%g4
	sdivx	%g2,	0x0C01,	%g5
	mulscc	%i7,	0x157A,	%l0
	or	%i4,	%o5,	%l6
	ldsw	[%l7 + 0x34],	%o4
	edge32ln	%g6,	%l2,	%g7
	fnot1s	%f1,	%f3
	fmovrdne	%g1,	%f10,	%f8
	andn	%o1,	0x084E,	%l1
	movneg	%xcc,	%i0,	%o7
	movre	%i5,	%i6,	%l4
	xor	%o3,	0x1BDD,	%i2
	fmovsvc	%xcc,	%f5,	%f4
	stb	%l3,	[%l7 + 0x50]
	and	%o0,	0x03F0,	%o6
	xnor	%o2,	%g3,	%i3
	sth	%i1,	[%l7 + 0x2A]
	movn	%icc,	%l5,	%g2
	movrgz	%g4,	0x033,	%i7
	fmovspos	%icc,	%f14,	%f7
	srlx	%g5,	%i4,	%o5
	movrgz	%l6,	%l0,	%o4
	alignaddr	%g6,	%l2,	%g1
	xorcc	%g7,	%o1,	%l1
	subc	%o7,	%i0,	%i6
	move	%icc,	%i5,	%l4
	ldsh	[%l7 + 0x1E],	%o3
	udiv	%i2,	0x1868,	%o0
	faligndata	%f12,	%f8,	%f2
	fmovdpos	%icc,	%f1,	%f10
	sth	%l3,	[%l7 + 0x6C]
	orcc	%o2,	0x18C7,	%g3
	srl	%o6,	%i1,	%i3
	save %l5, %g2, %i7
	udivx	%g4,	0x190B,	%i4
	udivx	%g5,	0x1641,	%l6
	subccc	%o5,	%o4,	%g6
	movn	%xcc,	%l2,	%l0
	xnorcc	%g1,	%g7,	%l1
	movpos	%xcc,	%o1,	%i0
	fmovdvc	%icc,	%f1,	%f15
	ldub	[%l7 + 0x43],	%i6
	sethi	0x15B6,	%i5
	lduw	[%l7 + 0x14],	%l4
	restore %o3, %i2, %o7
	ldsb	[%l7 + 0x1B],	%l3
	fcmpd	%fcc2,	%f14,	%f6
	lduw	[%l7 + 0x4C],	%o0
	udiv	%g3,	0x090D,	%o2
	fmovsgu	%xcc,	%f4,	%f8
	movvs	%icc,	%i1,	%i3
	fpackfix	%f12,	%f14
	movne	%xcc,	%o6,	%g2
	array8	%l5,	%g4,	%i7
	ldsh	[%l7 + 0x26],	%i4
	ldub	[%l7 + 0x30],	%l6
	ldd	[%l7 + 0x28],	%o4
	std	%f14,	[%l7 + 0x50]
	ldd	[%l7 + 0x08],	%f2
	movrne	%o4,	%g6,	%l2
	movleu	%xcc,	%g5,	%l0
	movpos	%icc,	%g7,	%g1
	fnor	%f8,	%f6,	%f2
	addc	%l1,	0x0F96,	%o1
	lduw	[%l7 + 0x0C],	%i6
	fcmpeq32	%f8,	%f6,	%i5
	fmovrslez	%l4,	%f0,	%f15
	fmovdne	%xcc,	%f11,	%f8
	movleu	%xcc,	%i0,	%o3
	lduh	[%l7 + 0x50],	%o7
	ldd	[%l7 + 0x70],	%f8
	movle	%icc,	%i2,	%l3
	subccc	%g3,	%o0,	%o2
	fmovsn	%icc,	%f1,	%f13
	sub	%i3,	%i1,	%o6
	ldd	[%l7 + 0x08],	%f6
	fcmpne16	%f4,	%f4,	%g2
	movcc	%xcc,	%l5,	%i7
	fmovdneg	%icc,	%f1,	%f11
	fone	%f6
	orcc	%g4,	%i4,	%o5
	add	%l6,	0x0379,	%g6
	pdist	%f4,	%f10,	%f4
	mulscc	%l2,	0x081E,	%g5
	movcs	%xcc,	%o4,	%l0
	edge16	%g7,	%g1,	%l1
	edge32ln	%i6,	%i5,	%o1
	umul	%l4,	%i0,	%o3
	fcmps	%fcc2,	%f5,	%f2
	edge8n	%o7,	%l3,	%i2
	fcmped	%fcc3,	%f4,	%f6
	pdist	%f12,	%f6,	%f14
	orncc	%o0,	%g3,	%o2
	fnegd	%f6,	%f14
	edge8l	%i3,	%o6,	%i1
	fmovrdlz	%l5,	%f6,	%f6
	array32	%i7,	%g4,	%i4
	edge16ln	%g2,	%o5,	%g6
	edge16	%l2,	%g5,	%o4
	move	%icc,	%l0,	%l6
	fnegd	%f4,	%f2
	orncc	%g1,	0x17D7,	%l1
	edge16ln	%g7,	%i6,	%i5
	edge32	%o1,	%l4,	%i0
	mulx	%o7,	%o3,	%i2
	move	%xcc,	%o0,	%l3
	mova	%xcc,	%o2,	%i3
	srax	%o6,	0x07,	%i1
	orn	%g3,	%i7,	%l5
	xor	%g4,	%i4,	%o5
	fnot2s	%f4,	%f3
	stb	%g2,	[%l7 + 0x39]
	fmovdle	%icc,	%f10,	%f2
	orcc	%g6,	%l2,	%g5
	xnor	%o4,	0x0F53,	%l6
	alignaddr	%l0,	%g1,	%g7
	fzero	%f14
	ldub	[%l7 + 0x79],	%i6
	edge16ln	%l1,	%o1,	%l4
	edge32	%i5,	%i0,	%o7
	fornot2	%f10,	%f4,	%f6
	fcmped	%fcc1,	%f4,	%f4
	ldd	[%l7 + 0x08],	%i2
	movne	%xcc,	%o0,	%l3
	sll	%o2,	%o3,	%i3
	fmovrdgez	%o6,	%f4,	%f2
	fpsub16	%f8,	%f6,	%f12
	sll	%i1,	%g3,	%i7
	andn	%g4,	%l5,	%i4
	ldd	[%l7 + 0x38],	%f4
	fnegd	%f12,	%f6
	subccc	%g2,	0x1ED8,	%g6
	stx	%l2,	[%l7 + 0x58]
	array8	%o5,	%o4,	%g5
	orncc	%l6,	0x1220,	%g1
	edge32n	%l0,	%i6,	%l1
	mulscc	%o1,	0x1ABE,	%l4
	fmovrsgez	%i5,	%f8,	%f14
	smulcc	%i0,	0x0D8E,	%g7
	edge32ln	%o7,	%i2,	%l3
	ldsw	[%l7 + 0x0C],	%o2
	edge16n	%o3,	%o0,	%i3
	orcc	%o6,	0x1A28,	%g3
	movn	%icc,	%i7,	%g4
	sdiv	%i1,	0x18CC,	%l5
	udivx	%g2,	0x1D26,	%g6
	smulcc	%i4,	0x0452,	%o5
	movgu	%xcc,	%l2,	%g5
	udivcc	%o4,	0x12DF,	%l6
	alignaddrl	%g1,	%l0,	%i6
	mova	%icc,	%o1,	%l1
	fornot1	%f12,	%f12,	%f2
	orncc	%i5,	%i0,	%l4
	or	%o7,	0x00E6,	%g7
	ld	[%l7 + 0x14],	%f15
	sra	%i2,	%o2,	%o3
	ldd	[%l7 + 0x58],	%f2
	sethi	0x03F2,	%l3
	move	%icc,	%i3,	%o0
	movvc	%icc,	%o6,	%i7
	edge8n	%g3,	%g4,	%l5
	movgu	%xcc,	%i1,	%g2
	alignaddrl	%i4,	%g6,	%o5
	fmovrdgez	%l2,	%f0,	%f10
	stb	%o4,	[%l7 + 0x52]
	lduh	[%l7 + 0x24],	%l6
	array8	%g1,	%g5,	%i6
	srl	%o1,	0x02,	%l1
	edge16n	%l0,	%i0,	%i5
	stx	%o7,	[%l7 + 0x08]
	fpadd16	%f14,	%f6,	%f6
	movneg	%icc,	%l4,	%g7
	edge16	%i2,	%o3,	%o2
	array8	%i3,	%o0,	%o6
	ldx	[%l7 + 0x60],	%l3
	movvc	%icc,	%g3,	%i7
	xor	%g4,	%l5,	%i1
	andcc	%g2,	0x1CB8,	%g6
	movge	%icc,	%i4,	%l2
	fand	%f4,	%f14,	%f4
	xnor	%o5,	0x176D,	%o4
	movvc	%icc,	%l6,	%g5
	ldub	[%l7 + 0x14],	%g1
	xor	%o1,	%l1,	%l0
	fcmpeq32	%f6,	%f8,	%i6
	fcmpes	%fcc1,	%f3,	%f15
	andn	%i0,	0x057D,	%i5
	orn	%l4,	%o7,	%i2
	fpsub16s	%f1,	%f7,	%f2
	fandnot1	%f12,	%f8,	%f0
	udiv	%o3,	0x1091,	%g7
	movcs	%icc,	%o2,	%i3
	andn	%o0,	%o6,	%g3
	for	%f4,	%f0,	%f14
	ld	[%l7 + 0x7C],	%f3
	alignaddrl	%i7,	%g4,	%l3
	movge	%xcc,	%l5,	%i1
	fmovrdgz	%g6,	%f4,	%f8
	edge32n	%g2,	%l2,	%o5
	fcmpne16	%f14,	%f2,	%i4
	movvc	%xcc,	%o4,	%l6
	udiv	%g5,	0x0B57,	%g1
	sdivcc	%l1,	0x0ABC,	%l0
	lduh	[%l7 + 0x16],	%o1
	movne	%icc,	%i6,	%i5
	udiv	%l4,	0x19DA,	%i0
	lduw	[%l7 + 0x78],	%i2
	sdivx	%o3,	0x1E0C,	%g7
	stx	%o2,	[%l7 + 0x50]
	subcc	%o7,	%o0,	%i3
	edge8	%g3,	%o6,	%g4
	smul	%l3,	0x181A,	%l5
	andncc	%i1,	%g6,	%g2
	movrlez	%l2,	%i7,	%i4
	fnot1s	%f10,	%f11
	umulcc	%o5,	0x09E0,	%l6
	std	%f10,	[%l7 + 0x58]
	fmovdg	%xcc,	%f8,	%f5
	fcmpne16	%f8,	%f12,	%g5
	sdiv	%g1,	0x0E0D,	%o4
	orcc	%l1,	%l0,	%o1
	movcs	%xcc,	%i6,	%i5
	movrgz	%l4,	%i0,	%o3
	stb	%i2,	[%l7 + 0x4E]
	edge16n	%g7,	%o7,	%o2
	ldx	[%l7 + 0x48],	%o0
	edge16l	%i3,	%g3,	%o6
	andcc	%l3,	0x01F9,	%g4
	smulcc	%l5,	%i1,	%g6
	fmovdvc	%icc,	%f5,	%f14
	addc	%l2,	%i7,	%g2
	umulcc	%o5,	0x1A23,	%i4
	movg	%icc,	%g5,	%l6
	xnor	%o4,	0x10D7,	%g1
	fmovdl	%icc,	%f7,	%f15
	fmovsg	%icc,	%f0,	%f15
	sdivcc	%l1,	0x09DB,	%l0
	movgu	%xcc,	%o1,	%i6
	fandnot2s	%f9,	%f15,	%f0
	ldsh	[%l7 + 0x7E],	%l4
	movrgz	%i5,	0x3FC,	%i0
	edge16l	%i2,	%o3,	%g7
	fmovdn	%xcc,	%f4,	%f15
	sth	%o2,	[%l7 + 0x58]
	sll	%o7,	%i3,	%o0
	fmovdle	%icc,	%f0,	%f1
	sdivcc	%o6,	0x03E2,	%g3
	movrgz	%l3,	%l5,	%g4
	edge16l	%i1,	%l2,	%i7
	fmovsg	%xcc,	%f12,	%f15
	subc	%g2,	0x0397,	%o5
	edge32l	%i4,	%g6,	%l6
	movl	%xcc,	%g5,	%g1
	or	%l1,	%l0,	%o1
	fpadd32s	%f2,	%f3,	%f6
	movrgez	%o4,	%i6,	%l4
	st	%f10,	[%l7 + 0x28]
	restore %i5, 0x0E6D, %i0
	fmovdpos	%icc,	%f2,	%f7
	fnegd	%f12,	%f6
	fpsub16s	%f15,	%f11,	%f7
	movne	%icc,	%o3,	%i2
	sllx	%o2,	0x16,	%g7
	stb	%i3,	[%l7 + 0x2E]
	sethi	0x19E4,	%o0
	fmovdvc	%xcc,	%f5,	%f9
	array32	%o6,	%o7,	%l3
	movcs	%icc,	%l5,	%g4
	edge32ln	%g3,	%i1,	%i7
	addccc	%l2,	0x0E23,	%g2
	srl	%i4,	0x0E,	%g6
	fmovdge	%xcc,	%f5,	%f9
	udivx	%l6,	0x04EE,	%g5
	lduh	[%l7 + 0x5A],	%g1
	edge32ln	%l1,	%o5,	%l0
	mova	%icc,	%o1,	%i6
	fpmerge	%f3,	%f6,	%f6
	srl	%l4,	0x1F,	%i5
	sethi	0x0048,	%o4
	srax	%o3,	%i0,	%i2
	movcc	%xcc,	%o2,	%i3
	edge32n	%g7,	%o6,	%o7
	fandnot2s	%f9,	%f14,	%f12
	smulcc	%o0,	0x1472,	%l3
	andn	%l5,	%g3,	%g4
	movge	%icc,	%i7,	%l2
	for	%f14,	%f0,	%f6
	xnor	%g2,	0x075A,	%i1
	movle	%icc,	%g6,	%i4
	fmovsleu	%icc,	%f9,	%f1
	array32	%l6,	%g5,	%l1
	edge32	%g1,	%l0,	%o5
	edge16ln	%i6,	%o1,	%i5
	addccc	%o4,	%l4,	%o3
	ldsw	[%l7 + 0x78],	%i0
	sdivx	%i2,	0x0BF7,	%o2
	subccc	%i3,	%o6,	%g7
	subcc	%o7,	0x0AB6,	%l3
	movrne	%o0,	0x113,	%l5
	xor	%g3,	0x1C1B,	%i7
	srax	%g4,	%g2,	%i1
	edge8l	%g6,	%i4,	%l6
	array16	%g5,	%l1,	%g1
	xnorcc	%l0,	0x116D,	%l2
	ldsh	[%l7 + 0x6A],	%i6
	movrlez	%o1,	0x3C8,	%i5
	fandnot1s	%f0,	%f14,	%f6
	movge	%icc,	%o5,	%o4
	ldsb	[%l7 + 0x23],	%l4
	fmovde	%icc,	%f8,	%f3
	andn	%o3,	%i2,	%i0
	fmovdge	%xcc,	%f10,	%f11
	udivcc	%o2,	0x1DBF,	%i3
	lduh	[%l7 + 0x26],	%g7
	movrgz	%o7,	%o6,	%o0
	fmovsneg	%xcc,	%f4,	%f1
	movrgz	%l5,	0x066,	%g3
	mulscc	%l3,	0x05B1,	%g4
	fcmpes	%fcc0,	%f8,	%f14
	xorcc	%g2,	0x071B,	%i7
	array16	%g6,	%i1,	%l6
	smulcc	%g5,	%i4,	%l1
	movgu	%xcc,	%l0,	%l2
	fmovsl	%icc,	%f2,	%f1
	array32	%i6,	%g1,	%o1
	mulx	%o5,	%i5,	%l4
	andcc	%o4,	0x0665,	%o3
	fabss	%f15,	%f3
	xnorcc	%i2,	%o2,	%i3
	alignaddr	%g7,	%o7,	%i0
	edge8l	%o6,	%l5,	%o0
	movre	%g3,	%g4,	%g2
	smulcc	%l3,	%i7,	%g6
	addccc	%i1,	0x0359,	%l6
	subcc	%i4,	0x1174,	%l1
	fmovrdgz	%g5,	%f4,	%f14
	save %l0, 0x1442, %l2
	fandnot2	%f10,	%f8,	%f0
	movg	%icc,	%i6,	%o1
	srax	%g1,	%i5,	%o5
	ldd	[%l7 + 0x68],	%o4
	movre	%l4,	0x16B,	%o3
	ldsh	[%l7 + 0x78],	%o2
	ld	[%l7 + 0x3C],	%f9
	ldsh	[%l7 + 0x38],	%i2
	st	%f9,	[%l7 + 0x08]
	save %g7, %i3, %i0
	movne	%icc,	%o6,	%o7
	fxnors	%f15,	%f3,	%f9
	pdist	%f8,	%f14,	%f2
	mulx	%l5,	%g3,	%g4
	or	%o0,	%g2,	%i7
	movpos	%xcc,	%l3,	%i1
	movcc	%icc,	%l6,	%g6
	fmuld8sux16	%f0,	%f3,	%f0
	orcc	%l1,	0x04D0,	%i4
	edge32n	%l0,	%g5,	%i6
	fmovdl	%xcc,	%f10,	%f11
	faligndata	%f8,	%f4,	%f0
	fmovrdgez	%l2,	%f8,	%f8
	array8	%g1,	%o1,	%i5
	addcc	%o5,	0x1718,	%l4
	edge32l	%o3,	%o4,	%i2
	ldub	[%l7 + 0x12],	%o2
	or	%g7,	%i0,	%i3
	movvs	%xcc,	%o6,	%l5
	mulscc	%g3,	0x045F,	%g4
	fandnot1s	%f10,	%f3,	%f4
	movre	%o0,	%g2,	%i7
	movleu	%xcc,	%l3,	%i1
	ldub	[%l7 + 0x10],	%l6
	edge32n	%o7,	%g6,	%l1
	alignaddr	%l0,	%i4,	%g5
	movcs	%xcc,	%i6,	%l2
	fmovda	%xcc,	%f11,	%f9
	orn	%o1,	%i5,	%g1
	andn	%o5,	0x0214,	%l4
	fpadd32	%f12,	%f2,	%f2
	andcc	%o4,	%i2,	%o3
	sub	%g7,	%o2,	%i3
	ldsh	[%l7 + 0x7E],	%i0
	srax	%l5,	%g3,	%o6
	movvs	%icc,	%o0,	%g2
	edge8	%i7,	%g4,	%l3
	ld	[%l7 + 0x08],	%f1
	sth	%l6,	[%l7 + 0x40]
	fnot1s	%f2,	%f15
	movne	%xcc,	%o7,	%g6
	edge8l	%i1,	%l0,	%l1
	edge8ln	%g5,	%i4,	%i6
	fmovrsgez	%l2,	%f8,	%f12
	ldd	[%l7 + 0x50],	%f10
	ldd	[%l7 + 0x60],	%o0
	subcc	%i5,	0x0C7E,	%g1
	addcc	%o5,	0x18EF,	%o4
	sdiv	%i2,	0x1E40,	%o3
	fmovsne	%xcc,	%f7,	%f11
	xorcc	%g7,	0x0C9D,	%l4
	ldx	[%l7 + 0x20],	%o2
	edge32ln	%i3,	%l5,	%g3
	andn	%i0,	0x1637,	%o6
	std	%f12,	[%l7 + 0x28]
	movg	%xcc,	%o0,	%g2
	movre	%g4,	0x02A,	%i7
	and	%l3,	%o7,	%l6
	sethi	0x10A8,	%g6
	sdivx	%l0,	0x1C59,	%i1
	subc	%l1,	0x1415,	%i4
	edge8ln	%i6,	%g5,	%o1
	srax	%i5,	0x0C,	%g1
	orcc	%l2,	0x03C7,	%o4
	movge	%icc,	%i2,	%o5
	array32	%o3,	%l4,	%g7
	fmovsle	%icc,	%f11,	%f13
	movn	%xcc,	%o2,	%i3
	sth	%l5,	[%l7 + 0x52]
	xnor	%g3,	0x0FF2,	%o6
	fandnot2	%f6,	%f6,	%f2
	umulcc	%o0,	%g2,	%i0
	stw	%i7,	[%l7 + 0x18]
	sll	%g4,	%l3,	%l6
	edge8n	%g6,	%l0,	%o7
	movvc	%xcc,	%l1,	%i4
	ldd	[%l7 + 0x20],	%i0
	stx	%g5,	[%l7 + 0x70]
	faligndata	%f2,	%f4,	%f4
	edge8n	%i6,	%o1,	%i5
	movleu	%icc,	%l2,	%g1
	movre	%o4,	0x108,	%i2
	sllx	%o5,	0x12,	%o3
	movrlez	%l4,	%o2,	%i3
	movg	%icc,	%l5,	%g3
	fcmple16	%f8,	%f8,	%g7
	movne	%xcc,	%o6,	%o0
	movrlez	%i0,	%g2,	%i7
	addcc	%g4,	%l6,	%l3
	sdivx	%l0,	0x14B9,	%o7
	movne	%xcc,	%g6,	%l1
	fpadd32s	%f0,	%f8,	%f7
	movre	%i4,	0x034,	%i1
	andn	%g5,	%i6,	%o1
	std	%f10,	[%l7 + 0x38]
	udiv	%i5,	0x1F15,	%g1
	fmovsvc	%icc,	%f8,	%f2
	std	%f2,	[%l7 + 0x38]
	umulcc	%o4,	%i2,	%l2
	fnors	%f12,	%f14,	%f0
	sethi	0x0029,	%o3
	edge32ln	%l4,	%o5,	%o2
	fpadd32s	%f5,	%f6,	%f8
	fmovs	%f7,	%f9
	fcmple32	%f4,	%f12,	%l5
	movne	%icc,	%i3,	%g7
	fornot1s	%f8,	%f14,	%f6
	fcmpeq16	%f4,	%f0,	%o6
	edge32	%o0,	%g3,	%g2
	fnor	%f6,	%f0,	%f6
	ldsh	[%l7 + 0x34],	%i7
	fmovdpos	%xcc,	%f11,	%f12
	ldd	[%l7 + 0x70],	%f8
	fmovdne	%xcc,	%f9,	%f11
	fmovdcs	%icc,	%f8,	%f8
	ldub	[%l7 + 0x3E],	%g4
	xnorcc	%l6,	%l3,	%i0
	andn	%o7,	%g6,	%l0
	stb	%l1,	[%l7 + 0x17]
	and	%i1,	0x1646,	%g5
	movrlez	%i6,	0x338,	%o1
	fmovsvs	%xcc,	%f15,	%f15
	movne	%xcc,	%i5,	%i4
	popc	0x15E6,	%o4
	fandnot1s	%f13,	%f12,	%f14
	lduw	[%l7 + 0x70],	%g1
	st	%f5,	[%l7 + 0x08]
	edge32l	%l2,	%o3,	%l4
	movrgez	%i2,	%o2,	%o5
	edge8ln	%i3,	%g7,	%l5
	andn	%o6,	0x0579,	%g3
	mulscc	%o0,	%i7,	%g2
	edge16	%g4,	%l3,	%l6
	sdivcc	%i0,	0x1AD4,	%g6
	save %o7, 0x0A96, %l0
	lduh	[%l7 + 0x6C],	%l1
	or	%g5,	0x10B0,	%i6
	or	%i1,	0x0B85,	%o1
	edge16n	%i4,	%o4,	%g1
	stx	%l2,	[%l7 + 0x70]
	edge32ln	%o3,	%i5,	%i2
	udiv	%l4,	0x07D8,	%o2
	udivcc	%o5,	0x180D,	%g7
	udiv	%l5,	0x094E,	%o6
	udivcc	%g3,	0x1F19,	%i3
	fmovscc	%xcc,	%f13,	%f4
	stw	%o0,	[%l7 + 0x64]
	srlx	%g2,	0x09,	%g4
	edge8	%l3,	%i7,	%i0
	edge8n	%g6,	%l6,	%l0
	for	%f8,	%f4,	%f12
	fmovscc	%xcc,	%f6,	%f8
	ldd	[%l7 + 0x30],	%o6
	orn	%l1,	%i6,	%g5
	st	%f14,	[%l7 + 0x7C]
	sdiv	%o1,	0x1212,	%i1
	xor	%i4,	0x01D3,	%g1
	sllx	%l2,	%o3,	%o4
	movl	%icc,	%i2,	%l4
	sdiv	%o2,	0x05CE,	%o5
	fsrc1	%f2,	%f4
	xor	%i5,	%l5,	%g7
	fmovrdgz	%g3,	%f10,	%f8
	fnot2s	%f13,	%f0
	srlx	%i3,	%o0,	%g2
	ldsw	[%l7 + 0x38],	%g4
	movpos	%icc,	%o6,	%i7
	edge8n	%l3,	%i0,	%l6
	edge16ln	%g6,	%l0,	%o7
	stb	%i6,	[%l7 + 0x5E]
	lduw	[%l7 + 0x30],	%g5
	umul	%o1,	%l1,	%i1
	movgu	%xcc,	%i4,	%l2
	movn	%xcc,	%g1,	%o4
	edge16	%i2,	%l4,	%o3
	fmovrslez	%o2,	%f13,	%f11
	movrlz	%o5,	0x0BA,	%l5
	orcc	%g7,	0x182B,	%i5
	ld	[%l7 + 0x0C],	%f10
	fpadd16s	%f0,	%f3,	%f13
	sra	%i3,	%o0,	%g3
	alignaddr	%g4,	%g2,	%i7
	edge8	%o6,	%l3,	%i0
	ldd	[%l7 + 0x08],	%f12
	fmovrdlez	%g6,	%f6,	%f4
	edge8ln	%l0,	%o7,	%i6
	edge8ln	%l6,	%g5,	%o1
	stb	%l1,	[%l7 + 0x62]
	movrne	%i4,	%i1,	%l2
	edge32l	%o4,	%i2,	%g1
	ldsh	[%l7 + 0x78],	%l4
	srax	%o2,	0x10,	%o3
	or	%l5,	%o5,	%i5
	edge32n	%g7,	%o0,	%i3
	fandnot1	%f10,	%f2,	%f2
	array16	%g4,	%g2,	%i7
	edge8l	%o6,	%l3,	%i0
	movrlz	%g6,	0x1FD,	%l0
	array8	%g3,	%o7,	%l6
	ldub	[%l7 + 0x3A],	%g5
	umul	%i6,	%o1,	%l1
	srlx	%i4,	%i1,	%l2
	subc	%o4,	0x09F1,	%g1
	fornot2	%f4,	%f10,	%f4
	fone	%f12
	movrlez	%l4,	%o2,	%i2
	smulcc	%o3,	%o5,	%i5
	sdiv	%g7,	0x1B61,	%l5
	alignaddr	%i3,	%o0,	%g4
	ldsb	[%l7 + 0x74],	%i7
	movleu	%xcc,	%g2,	%l3
	movpos	%icc,	%i0,	%g6
	sethi	0x0366,	%o6
	movrne	%g3,	0x295,	%l0
	popc	0x1DC2,	%l6
	movcc	%icc,	%g5,	%i6
	movrlez	%o1,	%l1,	%i4
	edge16ln	%o7,	%l2,	%i1
	movn	%xcc,	%g1,	%l4
	fpack32	%f12,	%f8,	%f0
	fnand	%f0,	%f8,	%f6
	mova	%xcc,	%o4,	%i2
	movcc	%icc,	%o2,	%o3
	andcc	%o5,	0x11C7,	%i5
	edge8ln	%g7,	%l5,	%o0
	fmovdn	%xcc,	%f13,	%f9
	movn	%xcc,	%i3,	%g4
	subc	%i7,	%g2,	%i0
	udivx	%l3,	0x08F2,	%o6
	fcmpne16	%f14,	%f0,	%g6
	fnegd	%f14,	%f12
	fxnors	%f6,	%f7,	%f2
	alignaddr	%g3,	%l0,	%g5
	stb	%i6,	[%l7 + 0x3D]
	edge32ln	%o1,	%l1,	%i4
	alignaddr	%l6,	%o7,	%l2
	udiv	%g1,	0x1090,	%i1
	fmul8x16al	%f14,	%f2,	%f4
	subccc	%o4,	%l4,	%i2
	subcc	%o2,	%o5,	%i5
	fmovsle	%xcc,	%f4,	%f2
	movvc	%xcc,	%o3,	%g7
	udivx	%o0,	0x16A2,	%i3
	udivx	%l5,	0x1B7A,	%g4
	fmovde	%icc,	%f3,	%f0
	edge16l	%g2,	%i0,	%l3
	movn	%xcc,	%o6,	%i7
	edge16	%g3,	%l0,	%g5
	movrlez	%i6,	0x16C,	%g6
	udiv	%o1,	0x0A12,	%i4
	move	%xcc,	%l1,	%o7
	movre	%l6,	%l2,	%i1
	fmovdle	%xcc,	%f11,	%f15
	addcc	%g1,	%o4,	%l4
	edge8ln	%o2,	%o5,	%i5
	array32	%o3,	%g7,	%o0
	orn	%i2,	0x1667,	%i3
	movrlez	%l5,	%g4,	%i0
	fmovscs	%icc,	%f11,	%f9
	alignaddrl	%l3,	%o6,	%i7
	fmovsne	%icc,	%f3,	%f7
	edge32ln	%g2,	%g3,	%g5
	fmovrslz	%i6,	%f12,	%f12
	movle	%xcc,	%l0,	%g6
	std	%f6,	[%l7 + 0x70]
	fcmple16	%f6,	%f12,	%o1
	edge8l	%l1,	%i4,	%l6
	fmovdpos	%xcc,	%f1,	%f5
	andcc	%l2,	%i1,	%o7
	edge16n	%g1,	%o4,	%l4
	smul	%o5,	0x0959,	%o2
	siam	0x1
	add	%o3,	%g7,	%i5
	popc	0x1E91,	%i2
	movpos	%xcc,	%i3,	%o0
	popc	%g4,	%l5
	lduw	[%l7 + 0x78],	%l3
	orcc	%o6,	0x134D,	%i0
	array16	%i7,	%g3,	%g5
	fpadd16s	%f9,	%f10,	%f8
	sllx	%g2,	%i6,	%g6
	edge8n	%o1,	%l1,	%i4
	edge32	%l0,	%l2,	%l6
	std	%f8,	[%l7 + 0x60]
	lduh	[%l7 + 0x44],	%i1
	or	%o7,	0x1D0F,	%g1
	move	%xcc,	%l4,	%o5
	movrlez	%o2,	0x164,	%o3
	ldx	[%l7 + 0x40],	%o4
	movre	%g7,	0x3C5,	%i2
	move	%xcc,	%i5,	%o0
	movrgz	%i3,	0x21D,	%l5
	xorcc	%l3,	%g4,	%o6
	fmovsne	%xcc,	%f0,	%f10
	udiv	%i0,	0x0F70,	%i7
	movrlez	%g3,	0x1E6,	%g2
	addccc	%g5,	0x1990,	%i6
	subcc	%o1,	%l1,	%g6
	lduh	[%l7 + 0x3A],	%l0
	ld	[%l7 + 0x30],	%f14
	ld	[%l7 + 0x60],	%f5
	movleu	%xcc,	%l2,	%i4
	ldsw	[%l7 + 0x58],	%i1
	stb	%l6,	[%l7 + 0x26]
	fornot1	%f2,	%f6,	%f2
	lduw	[%l7 + 0x68],	%g1
	srl	%l4,	0x13,	%o7
	srax	%o2,	0x05,	%o5
	ldub	[%l7 + 0x77],	%o4
	movcc	%icc,	%o3,	%g7
	and	%i5,	%i2,	%i3
	xor	%o0,	0x1CE5,	%l3
	sdivx	%g4,	0x1CDD,	%o6
	stx	%i0,	[%l7 + 0x38]
	edge16n	%l5,	%i7,	%g3
	xorcc	%g5,	0x1E37,	%g2
	sub	%i6,	%o1,	%g6
	xnor	%l0,	0x1362,	%l2
	stb	%l1,	[%l7 + 0x44]
	udivx	%i4,	0x161C,	%l6
	movrgez	%g1,	0x264,	%l4
	ldd	[%l7 + 0x28],	%f6
	mulx	%i1,	0x1F50,	%o7
	lduh	[%l7 + 0x6A],	%o5
	edge16l	%o2,	%o3,	%g7
	xnorcc	%i5,	0x0441,	%o4
	restore %i2, %o0, %i3
	andn	%l3,	%g4,	%o6
	srax	%l5,	%i0,	%i7
	umul	%g5,	0x16C7,	%g2
	xnorcc	%g3,	%o1,	%i6
	sub	%l0,	0x1AE5,	%l2
	alignaddrl	%g6,	%i4,	%l1
	fcmpes	%fcc3,	%f2,	%f1
	fxnor	%f2,	%f12,	%f0
	fmovrdlz	%g1,	%f0,	%f2
	sdivcc	%l6,	0x1DE5,	%l4
	xnorcc	%o7,	0x155B,	%o5
	fone	%f14
	alignaddrl	%i1,	%o3,	%o2
	movrne	%g7,	0x386,	%i5
	fpadd16s	%f3,	%f3,	%f0
	mova	%icc,	%i2,	%o0
	array16	%i3,	%l3,	%g4
	subcc	%o6,	%l5,	%i0
	xorcc	%i7,	%o4,	%g5
	sll	%g3,	%o1,	%g2
	fpadd16s	%f7,	%f14,	%f10
	lduh	[%l7 + 0x08],	%i6
	movrgz	%l2,	0x085,	%g6
	srlx	%l0,	0x08,	%i4
	srax	%g1,	%l1,	%l6
	movpos	%xcc,	%o7,	%l4
	edge16	%i1,	%o5,	%o2
	sllx	%o3,	0x0C,	%i5
	subccc	%i2,	%o0,	%g7
	smulcc	%l3,	0x014B,	%g4
	srlx	%o6,	%i3,	%i0
	sdivx	%i7,	0x1492,	%o4
	edge32	%g5,	%g3,	%l5
	ldsw	[%l7 + 0x74],	%g2
	fmul8x16al	%f7,	%f6,	%f0
	movre	%o1,	%l2,	%i6
	stx	%g6,	[%l7 + 0x60]
	addcc	%i4,	0x1F76,	%g1
	lduw	[%l7 + 0x1C],	%l1
	sdivx	%l6,	0x01A1,	%o7
	fmovda	%icc,	%f9,	%f13
	movg	%xcc,	%l4,	%i1
	sethi	0x057A,	%o5
	edge8n	%l0,	%o3,	%o2
	movle	%icc,	%i2,	%o0
	movvc	%xcc,	%i5,	%l3
	ldd	[%l7 + 0x68],	%f12
	array32	%g7,	%g4,	%i3
	sdivcc	%o6,	0x100F,	%i7
	fsrc2s	%f13,	%f9
	edge32ln	%o4,	%g5,	%g3
	subccc	%i0,	%l5,	%g2
	array8	%l2,	%o1,	%g6
	sth	%i4,	[%l7 + 0x16]
	fpadd32s	%f10,	%f7,	%f4
	subc	%g1,	0x1E27,	%i6
	movrne	%l6,	%o7,	%l4
	move	%icc,	%l1,	%i1
	movpos	%icc,	%o5,	%o3
	edge32l	%l0,	%i2,	%o2
	sllx	%i5,	0x0B,	%l3
	ldd	[%l7 + 0x38],	%o0
	fmovdleu	%xcc,	%f10,	%f14
	addc	%g7,	0x113D,	%g4
	movrne	%i3,	0x186,	%o6
	xnorcc	%o4,	%i7,	%g5
	fnors	%f10,	%f8,	%f4
	popc	%g3,	%i0
	sdiv	%g2,	0x1580,	%l2
	edge16n	%l5,	%g6,	%i4
	mulscc	%o1,	%g1,	%l6
	fpsub16	%f0,	%f12,	%f10
	fmovdcs	%xcc,	%f8,	%f15
	fcmpgt16	%f6,	%f10,	%i6
	lduw	[%l7 + 0x3C],	%o7
	andn	%l1,	0x0928,	%l4
	subcc	%o5,	%i1,	%o3
	edge16n	%l0,	%i2,	%i5
	fmovdle	%icc,	%f4,	%f3
	edge8	%l3,	%o0,	%g7
	movge	%icc,	%o2,	%g4
	fabss	%f2,	%f11
	save %i3, %o4, %o6
	sdiv	%i7,	0x11A5,	%g5
	stb	%g3,	[%l7 + 0x24]
	fmovsgu	%icc,	%f2,	%f0
	ldx	[%l7 + 0x48],	%g2
	movcc	%icc,	%l2,	%i0
	fmovdvc	%xcc,	%f15,	%f9
	subccc	%g6,	%i4,	%o1
	andn	%l5,	0x0A7F,	%l6
	popc	0x1E8B,	%g1
	andcc	%o7,	%i6,	%l4
	sll	%l1,	0x0E,	%o5
	stb	%i1,	[%l7 + 0x33]
	and	%l0,	%i2,	%i5
	stx	%o3,	[%l7 + 0x08]
	sub	%o0,	0x1EE8,	%l3
	fmovrslez	%g7,	%f11,	%f5
	sub	%o2,	%g4,	%i3
	ldsb	[%l7 + 0x26],	%o4
	sdivcc	%i7,	0x19F9,	%g5
	sll	%g3,	%g2,	%o6
	fmovdcc	%icc,	%f14,	%f12
	lduh	[%l7 + 0x36],	%l2
	lduw	[%l7 + 0x6C],	%i0
	xnorcc	%g6,	%i4,	%l5
	fmovsn	%icc,	%f7,	%f6
	stx	%l6,	[%l7 + 0x10]
	ldsh	[%l7 + 0x72],	%o1
	smul	%g1,	%o7,	%i6
	andcc	%l4,	0x0DD7,	%l1
	movrne	%o5,	0x3BF,	%i1
	mova	%icc,	%l0,	%i2
	fmovdn	%xcc,	%f8,	%f6
	fabsd	%f8,	%f2
	movvc	%icc,	%o3,	%o0
	addc	%i5,	0x1DD2,	%g7
	fmul8x16al	%f13,	%f6,	%f8
	udiv	%o2,	0x0A27,	%g4
	fsrc2s	%f0,	%f2
	xnor	%i3,	0x09BC,	%o4
	st	%f10,	[%l7 + 0x70]
	for	%f4,	%f12,	%f12
	sra	%i7,	0x0B,	%g5
	fcmpne32	%f6,	%f10,	%l3
	movgu	%icc,	%g2,	%o6
	edge16	%g3,	%l2,	%i0
	fxnor	%f0,	%f10,	%f12
	fmovdne	%icc,	%f7,	%f10
	fmovscc	%xcc,	%f13,	%f11
	addccc	%g6,	0x0637,	%i4
	array32	%l5,	%o1,	%l6
	subccc	%g1,	%i6,	%l4
	sub	%o7,	0x0EFB,	%o5
	movl	%icc,	%i1,	%l0
	and	%i2,	%l1,	%o0
	movrlez	%i5,	%g7,	%o3
	fmovrde	%g4,	%f4,	%f0
	mulscc	%o2,	%i3,	%i7
	subc	%g5,	%l3,	%g2
	bshuffle	%f0,	%f6,	%f2
	edge32n	%o6,	%o4,	%l2
	andn	%g3,	%g6,	%i0
	fmovspos	%xcc,	%f13,	%f14
	std	%f4,	[%l7 + 0x10]
	edge16l	%l5,	%i4,	%l6
	save %g1, %o1, %l4
	fcmps	%fcc0,	%f4,	%f2
	xnorcc	%o7,	%i6,	%i1
	edge16	%l0,	%i2,	%o5
	edge8ln	%o0,	%l1,	%g7
	edge16	%i5,	%g4,	%o3
	edge16l	%i3,	%i7,	%g5
	movcc	%xcc,	%l3,	%g2
	array32	%o6,	%o2,	%o4
	andncc	%g3,	%l2,	%i0
	fcmpeq32	%f4,	%f4,	%g6
	fmovde	%xcc,	%f14,	%f7
	fmovrsgez	%l5,	%f9,	%f0
	array32	%i4,	%g1,	%l6
	mulscc	%l4,	0x178E,	%o1
	sdiv	%i6,	0x1C2D,	%o7
	fmovscs	%icc,	%f3,	%f8
	movcs	%xcc,	%l0,	%i1
	smulcc	%o5,	0x0E1B,	%i2
	edge32	%l1,	%g7,	%i5
	fcmps	%fcc1,	%f3,	%f9
	sllx	%o0,	%o3,	%g4
	srlx	%i7,	0x10,	%i3
	sdiv	%g5,	0x1902,	%l3
	ldsh	[%l7 + 0x10],	%g2
	popc	0x13E2,	%o6
	fors	%f0,	%f15,	%f2
	movn	%xcc,	%o4,	%o2
	fxnors	%f11,	%f3,	%f2
	sdiv	%l2,	0x16F6,	%g3
	ldd	[%l7 + 0x18],	%f0
	stb	%g6,	[%l7 + 0x64]
	or	%i0,	0x16E7,	%i4
	sub	%g1,	0x0318,	%l6
	sth	%l5,	[%l7 + 0x0E]
	ldd	[%l7 + 0x38],	%f8
	sra	%l4,	%i6,	%o1
	xnor	%l0,	0x0D72,	%i1
	umulcc	%o7,	0x0897,	%o5
	movle	%xcc,	%l1,	%i2
	addc	%i5,	0x1EEE,	%g7
	movcc	%xcc,	%o0,	%g4
	lduw	[%l7 + 0x4C],	%o3
	edge8l	%i7,	%i3,	%l3
	sth	%g5,	[%l7 + 0x42]
	andncc	%g2,	%o6,	%o4
	subcc	%l2,	0x0C1A,	%g3
	std	%f14,	[%l7 + 0x60]
	popc	%o2,	%i0
	edge32ln	%g6,	%i4,	%g1
	faligndata	%f2,	%f4,	%f6
	fpsub32s	%f10,	%f10,	%f5
	addccc	%l5,	0x16AD,	%l4
	sth	%i6,	[%l7 + 0x12]
	stb	%o1,	[%l7 + 0x35]
	ldsb	[%l7 + 0x73],	%l0
	ldd	[%l7 + 0x30],	%f8
	movre	%i1,	%o7,	%l6
	movn	%icc,	%l1,	%i2
	movg	%icc,	%i5,	%o5
	mova	%xcc,	%o0,	%g7
	umulcc	%g4,	0x1EE4,	%o3
	mulscc	%i3,	0x124F,	%i7
	udiv	%g5,	0x1AFE,	%l3
	mulscc	%g2,	0x1489,	%o6
	fmovdneg	%icc,	%f8,	%f4
	movl	%icc,	%l2,	%g3
	edge32ln	%o4,	%i0,	%g6
	sra	%i4,	0x07,	%g1
	ldd	[%l7 + 0x58],	%f8
	sub	%l5,	%l4,	%o2
	ldd	[%l7 + 0x58],	%o0
	array32	%i6,	%i1,	%l0
	movleu	%icc,	%l6,	%l1
	smulcc	%i2,	0x0A6D,	%i5
	orn	%o5,	%o7,	%g7
	sub	%o0,	0x0BC5,	%o3
	fsrc2s	%f15,	%f10
	fandnot2s	%f3,	%f2,	%f7
	array16	%i3,	%g4,	%i7
	movrgez	%g5,	%l3,	%o6
	fzeros	%f6
	movge	%xcc,	%l2,	%g3
	lduw	[%l7 + 0x7C],	%g2
	edge8n	%o4,	%g6,	%i4
	xorcc	%g1,	0x1279,	%l5
	and	%i0,	0x0F11,	%o2
	xnor	%o1,	%l4,	%i1
	edge8n	%l0,	%l6,	%i6
	movrgz	%i2,	0x344,	%l1
	udivx	%i5,	0x11A9,	%o7
	lduh	[%l7 + 0x16],	%o5
	edge16l	%o0,	%o3,	%i3
	orncc	%g4,	0x1B51,	%g7
	sllx	%g5,	%i7,	%o6
	fnot1s	%f15,	%f15
	movne	%xcc,	%l3,	%l2
	fxnor	%f0,	%f8,	%f2
	addccc	%g2,	0x1030,	%o4
	movle	%icc,	%g3,	%i4
	ld	[%l7 + 0x34],	%f13
	orn	%g6,	0x0BFE,	%l5
	addccc	%i0,	%o2,	%g1
	and	%l4,	%i1,	%o1
	restore %l0, %l6, %i6
	fmovrdne	%l1,	%f14,	%f10
	addcc	%i2,	%o7,	%o5
	fnor	%f8,	%f14,	%f2
	addcc	%o0,	0x1957,	%i5
	movneg	%xcc,	%o3,	%i3
	subccc	%g7,	%g4,	%g5
	ldx	[%l7 + 0x18],	%i7
	smulcc	%l3,	%o6,	%g2
	ldsh	[%l7 + 0x7A],	%l2
	fnegs	%f9,	%f9
	umulcc	%g3,	%i4,	%g6
	udiv	%l5,	0x1CC5,	%o4
	fmovde	%xcc,	%f11,	%f5
	fmul8sux16	%f12,	%f8,	%f14
	movrlez	%o2,	0x35B,	%g1
	stw	%i0,	[%l7 + 0x20]
	movne	%xcc,	%l4,	%i1
	mova	%xcc,	%o1,	%l0
	restore %i6, %l1, %l6
	fmovdleu	%icc,	%f6,	%f3
	ldsb	[%l7 + 0x78],	%o7
	movrgz	%o5,	0x102,	%i2
	mova	%icc,	%o0,	%i5
	edge32	%i3,	%g7,	%g4
	movcc	%xcc,	%o3,	%g5
	movrlez	%i7,	%l3,	%o6
	movcs	%icc,	%l2,	%g2
	fmovsg	%xcc,	%f11,	%f2
	fmovdneg	%xcc,	%f7,	%f13
	ldsh	[%l7 + 0x3C],	%i4
	fornot1	%f6,	%f8,	%f4
	fcmpeq16	%f14,	%f2,	%g3
	sra	%l5,	0x1E,	%o4
	fmovdcc	%xcc,	%f7,	%f5
	movl	%icc,	%g6,	%o2
	fmovrdgez	%g1,	%f2,	%f0
	mulscc	%i0,	%i1,	%l4
	orncc	%l0,	%i6,	%l1
	movgu	%xcc,	%o1,	%l6
	srax	%o5,	%o7,	%o0
	movrgz	%i2,	%i3,	%g7
	ldub	[%l7 + 0x5A],	%g4
	edge32ln	%o3,	%i5,	%i7
	fsrc1	%f2,	%f12
	sll	%l3,	0x03,	%o6
	ldub	[%l7 + 0x3D],	%l2
	fmovse	%icc,	%f0,	%f0
	edge16ln	%g5,	%i4,	%g2
	fmovsa	%xcc,	%f1,	%f3
	mulx	%l5,	%o4,	%g6
	fzeros	%f9
	orn	%o2,	%g3,	%i0
	sethi	0x01E1,	%g1
	fandnot1	%f12,	%f6,	%f12
	movrne	%l4,	0x11D,	%i1
	movn	%xcc,	%i6,	%l1
	mulscc	%l0,	%o1,	%o5
	fcmpeq16	%f10,	%f8,	%o7
	sethi	0x109C,	%o0
	fmovdg	%xcc,	%f10,	%f9
	fnors	%f2,	%f11,	%f5
	fnot2	%f0,	%f10
	ldub	[%l7 + 0x32],	%i2
	movrgz	%i3,	%g7,	%l6
	edge8	%g4,	%o3,	%i7
	sllx	%i5,	0x09,	%o6
	movleu	%icc,	%l2,	%l3
	addc	%g5,	%i4,	%g2
	lduh	[%l7 + 0x66],	%l5
	ldsh	[%l7 + 0x3E],	%o4
	edge16n	%o2,	%g6,	%g3
	fcmpgt32	%f4,	%f6,	%i0
	ldub	[%l7 + 0x7D],	%g1
	fmovdg	%xcc,	%f7,	%f15
	movrne	%i1,	%i6,	%l1
	fmovdge	%xcc,	%f0,	%f10
	fabsd	%f14,	%f0
	edge8	%l0,	%l4,	%o5
	fornot1s	%f7,	%f11,	%f11
	addccc	%o1,	0x003D,	%o7
	edge8ln	%o0,	%i3,	%i2
	srlx	%l6,	0x08,	%g4
	edge8	%g7,	%i7,	%i5
	movn	%xcc,	%o6,	%o3
	movvc	%icc,	%l3,	%l2
	fnot2	%f14,	%f12
	orn	%i4,	0x05C1,	%g5
	fxnors	%f13,	%f3,	%f1
	movrlez	%g2,	%o4,	%l5
	st	%f14,	[%l7 + 0x68]
	orcc	%g6,	%g3,	%o2
	sll	%g1,	0x05,	%i1
	fnot2	%f8,	%f4
	ldsb	[%l7 + 0x4D],	%i6
	array8	%l1,	%l0,	%l4
	ldd	[%l7 + 0x60],	%i0
	srax	%o1,	%o5,	%o7
	sllx	%o0,	0x0A,	%i2
	edge8n	%i3,	%l6,	%g4
	xnor	%i7,	0x1646,	%i5
	smulcc	%g7,	%o6,	%l3
	ldd	[%l7 + 0x28],	%o2
	udivx	%l2,	0x1276,	%g5
	sdivcc	%g2,	0x0BCF,	%o4
	movrgez	%l5,	%i4,	%g3
	sethi	0x1E35,	%o2
	and	%g1,	0x0D2E,	%i1
	restore %i6, 0x0DA1, %g6
	fmovsle	%xcc,	%f0,	%f1
	restore %l1, %l0, %l4
	fmovdgu	%xcc,	%f11,	%f8
	mulscc	%o1,	0x06C3,	%i0
	fcmped	%fcc0,	%f0,	%f8
	ldub	[%l7 + 0x41],	%o5
	movre	%o0,	0x1BE,	%o7
	movleu	%icc,	%i2,	%i3
	movrgz	%l6,	%g4,	%i5
	srl	%i7,	%g7,	%l3
	fmovrsne	%o3,	%f0,	%f9
	fmovrdlez	%l2,	%f8,	%f14
	fmovde	%icc,	%f13,	%f0
	movl	%icc,	%g5,	%g2
	movn	%icc,	%o4,	%l5
	srlx	%i4,	0x0D,	%g3
	mulx	%o2,	%o6,	%g1
	udiv	%i1,	0x1260,	%g6
	fmovrdne	%i6,	%f6,	%f6
	ldsh	[%l7 + 0x7A],	%l1
	move	%xcc,	%l4,	%l0
	fmovdvs	%icc,	%f4,	%f14
	smul	%i0,	%o1,	%o0
	ldd	[%l7 + 0x40],	%o4
	ldx	[%l7 + 0x60],	%o7
	sdivcc	%i2,	0x05E1,	%i3
	ldd	[%l7 + 0x58],	%g4
	array16	%l6,	%i5,	%g7
	udivcc	%i7,	0x0CA1,	%l3
	ldsw	[%l7 + 0x5C],	%o3
	subc	%l2,	%g5,	%o4
	fmovdvc	%icc,	%f11,	%f7
	orcc	%l5,	0x1150,	%g2
	sdivcc	%i4,	0x1776,	%g3
	srax	%o2,	0x10,	%o6
	ldub	[%l7 + 0x39],	%g1
	edge16	%g6,	%i6,	%l1
	for	%f10,	%f2,	%f0
	fmul8ulx16	%f10,	%f0,	%f12
	subccc	%l4,	%l0,	%i0
	lduh	[%l7 + 0x44],	%o1
	fmovsleu	%xcc,	%f12,	%f13
	fmovdcc	%icc,	%f9,	%f4
	fandnot1	%f14,	%f12,	%f2
	array32	%o0,	%o5,	%o7
	fornot2s	%f1,	%f14,	%f12
	fpack32	%f10,	%f14,	%f6
	stw	%i2,	[%l7 + 0x34]
	movle	%xcc,	%i1,	%i3
	restore %l6, %g4, %i5
	srax	%g7,	%l3,	%o3
	umulcc	%l2,	0x1C34,	%i7
	fmovrsgez	%o4,	%f11,	%f7
	ldd	[%l7 + 0x08],	%l4
	edge16	%g2,	%g5,	%i4
	addcc	%g3,	%o2,	%o6
	subc	%g6,	%i6,	%g1
	sethi	0x0BBB,	%l4
	fmovrdgez	%l0,	%f6,	%f14
	fnot1	%f12,	%f2
	sdivx	%i0,	0x0450,	%l1
	srlx	%o0,	0x07,	%o1
	save %o5, 0x1B9B, %o7
	ldd	[%l7 + 0x60],	%i0
	movre	%i3,	%i2,	%g4
	movrgz	%l6,	%i5,	%g7
	movg	%icc,	%l3,	%o3
	fmul8x16au	%f2,	%f5,	%f0
	movrne	%i7,	%o4,	%l2
	movleu	%icc,	%g2,	%g5
	srax	%i4,	%g3,	%l5
	ldd	[%l7 + 0x28],	%o2
	sth	%g6,	[%l7 + 0x18]
	sdiv	%o6,	0x1AC8,	%g1
	fandnot1	%f4,	%f10,	%f0
	subcc	%l4,	%i6,	%i0
	array16	%l0,	%l1,	%o0
	udiv	%o5,	0x04ED,	%o7
	fpsub32	%f14,	%f4,	%f10
	faligndata	%f6,	%f0,	%f0
	edge32l	%o1,	%i3,	%i2
	add	%g4,	%i1,	%l6
	edge32l	%g7,	%l3,	%o3
	fmovsle	%xcc,	%f9,	%f11
	movge	%icc,	%i5,	%o4
	fabss	%f8,	%f7
	movn	%xcc,	%l2,	%g2
	fmovrsne	%i7,	%f1,	%f4
	addcc	%g5,	%i4,	%g3
	movpos	%icc,	%o2,	%l5
	fmovsneg	%icc,	%f4,	%f13
	fmuld8ulx16	%f14,	%f10,	%f4
	edge16n	%o6,	%g6,	%g1
	udiv	%i6,	0x1E27,	%i0
	movn	%xcc,	%l0,	%l1
	fornot1	%f10,	%f14,	%f0
	edge16ln	%l4,	%o5,	%o0
	udiv	%o7,	0x017A,	%i3
	fmovse	%icc,	%f11,	%f11
	edge8n	%i2,	%g4,	%o1
	edge32l	%i1,	%l6,	%l3
	edge16l	%o3,	%i5,	%g7
	fmovsn	%icc,	%f6,	%f0
	sdiv	%o4,	0x07E9,	%g2
	xorcc	%i7,	%g5,	%l2
	mova	%xcc,	%g3,	%o2
	ldx	[%l7 + 0x30],	%i4
	lduw	[%l7 + 0x0C],	%l5
	edge32ln	%g6,	%o6,	%g1
	xorcc	%i0,	0x01CD,	%i6
	movre	%l1,	%l4,	%o5
	ldd	[%l7 + 0x38],	%o0
	mulx	%o7,	0x1BBA,	%l0
	fmovsle	%icc,	%f4,	%f14
	fmul8x16au	%f9,	%f8,	%f6
	udivx	%i3,	0x1666,	%g4
	ld	[%l7 + 0x74],	%f11
	lduw	[%l7 + 0x40],	%o1
	or	%i1,	%i2,	%l6
	std	%f6,	[%l7 + 0x70]
	subccc	%l3,	0x192E,	%i5
	move	%xcc,	%g7,	%o4
	udivx	%o3,	0x06BF,	%i7
	smulcc	%g2,	%g5,	%g3
	fmovrsgz	%l2,	%f2,	%f10
	fcmpne32	%f8,	%f2,	%i4
	xorcc	%o2,	0x05D1,	%g6
	udiv	%l5,	0x1F27,	%o6
	edge32ln	%g1,	%i0,	%i6
	sth	%l1,	[%l7 + 0x30]
	smul	%o5,	0x1CE4,	%o0
	andcc	%l4,	%o7,	%i3
	ldx	[%l7 + 0x60],	%l0
	stb	%g4,	[%l7 + 0x61]
	movrne	%o1,	%i2,	%l6
	stx	%l3,	[%l7 + 0x50]
	stw	%i1,	[%l7 + 0x70]
	fxors	%f14,	%f7,	%f2
	add	%g7,	0x0607,	%o4
	edge8l	%i5,	%i7,	%o3
	std	%f8,	[%l7 + 0x28]
	sub	%g5,	%g3,	%l2
	fmovdg	%xcc,	%f12,	%f13
	umul	%i4,	%o2,	%g6
	fmovrsgz	%l5,	%f1,	%f8
	subcc	%g2,	0x1E74,	%o6
	edge8	%i0,	%g1,	%i6
	fornot2	%f14,	%f10,	%f12
	fnands	%f0,	%f11,	%f14
	alignaddrl	%o5,	%l1,	%l4
	edge8l	%o7,	%i3,	%o0
	fsrc2	%f8,	%f2
	udiv	%g4,	0x05F0,	%o1
	alignaddrl	%i2,	%l6,	%l0
	fnors	%f0,	%f5,	%f1
	sll	%i1,	%g7,	%o4
	sdiv	%i5,	0x1EFE,	%l3
	movvs	%icc,	%o3,	%g5
	srlx	%g3,	%i7,	%l2
	or	%i4,	%o2,	%g6
	fmovscs	%xcc,	%f8,	%f2
	st	%f12,	[%l7 + 0x7C]
	addc	%l5,	0x0496,	%g2
	mulx	%o6,	%g1,	%i6
	fandnot1	%f10,	%f10,	%f8
	movneg	%icc,	%i0,	%o5
	movne	%xcc,	%l1,	%l4
	popc	0x065C,	%i3
	fpsub16s	%f11,	%f6,	%f9
	umul	%o7,	%g4,	%o1
	popc	%i2,	%o0
	umul	%l6,	0x026F,	%l0
	edge16l	%g7,	%i1,	%o4
	movrlez	%i5,	%o3,	%g5
	add	%g3,	0x1010,	%i7
	fmovdvs	%xcc,	%f1,	%f5
	umulcc	%l3,	%i4,	%o2
	stb	%l2,	[%l7 + 0x77]
	movpos	%icc,	%l5,	%g6
	fpadd16s	%f4,	%f6,	%f0
	movre	%o6,	0x014,	%g2
	fcmpeq32	%f12,	%f8,	%g1
	edge16l	%i0,	%i6,	%l1
	fsrc2	%f0,	%f4
	fpsub16s	%f13,	%f12,	%f15
	movn	%xcc,	%l4,	%i3
	fxor	%f12,	%f8,	%f2
	movrgz	%o5,	0x140,	%o7
	edge8n	%o1,	%i2,	%g4
	orcc	%l6,	%l0,	%g7
	movcs	%xcc,	%o0,	%o4
	sub	%i5,	0x0F4E,	%i1
	srlx	%g5,	%g3,	%i7
	udiv	%l3,	0x0BCF,	%o3
	fmul8ulx16	%f4,	%f4,	%f12
	save %o2, 0x11F5, %i4
	edge32l	%l5,	%g6,	%o6
	movleu	%icc,	%g2,	%g1
	add	%i0,	%l2,	%i6
	fnegd	%f10,	%f14
	orcc	%l4,	0x05D8,	%l1
	ldsh	[%l7 + 0x3E],	%i3
	andncc	%o7,	%o1,	%o5
	edge32l	%i2,	%g4,	%l0
	restore %l6, %g7, %o4
	std	%f6,	[%l7 + 0x50]
	edge16l	%o0,	%i1,	%i5
	movrne	%g5,	0x18D,	%g3
	mulscc	%i7,	0x0C30,	%o3
	array32	%l3,	%o2,	%i4
	addccc	%l5,	%g6,	%g2
	fmovrdgez	%o6,	%f10,	%f6
	sdivx	%g1,	0x047B,	%i0
	fxnors	%f10,	%f11,	%f2
	orcc	%l2,	%i6,	%l4
	ldsb	[%l7 + 0x27],	%i3
	movleu	%icc,	%l1,	%o1
	sub	%o5,	0x1D7C,	%i2
	edge8	%o7,	%l0,	%l6
	umul	%g4,	0x1E79,	%g7
	fnot2s	%f4,	%f1
	array8	%o4,	%o0,	%i5
	std	%f6,	[%l7 + 0x28]
	smul	%g5,	%g3,	%i1
	andn	%i7,	0x1D65,	%o3
	orncc	%l3,	0x036B,	%i4
	fnegs	%f6,	%f5
	alignaddr	%l5,	%g6,	%g2
	popc	%o2,	%o6
	xnorcc	%g1,	0x0103,	%l2
	edge32n	%i0,	%l4,	%i3
	std	%f12,	[%l7 + 0x58]
	smulcc	%i6,	%o1,	%l1
	fornot1s	%f8,	%f10,	%f7
	sub	%i2,	%o5,	%o7
	lduh	[%l7 + 0x3A],	%l6
	mulscc	%l0,	%g4,	%o4
	fxnors	%f3,	%f12,	%f2
	alignaddr	%o0,	%g7,	%i5
	fmul8sux16	%f4,	%f8,	%f0
	stx	%g3,	[%l7 + 0x58]
	subc	%i1,	0x08A1,	%i7
	movl	%icc,	%o3,	%g5
	orn	%i4,	0x1B45,	%l5
	edge16n	%g6,	%l3,	%o2
	fnot2	%f12,	%f2
	orn	%o6,	0x1C06,	%g2
	movg	%xcc,	%l2,	%g1
	alignaddr	%i0,	%i3,	%l4
	move	%icc,	%i6,	%l1
	fcmpgt16	%f10,	%f10,	%i2
	edge32l	%o1,	%o5,	%l6
	fpsub16s	%f6,	%f9,	%f3
	movn	%icc,	%o7,	%g4
	subccc	%l0,	%o4,	%g7
	fnands	%f5,	%f13,	%f11
	alignaddr	%o0,	%g3,	%i1
	ldsb	[%l7 + 0x3F],	%i5
	fmovspos	%xcc,	%f5,	%f5
	fors	%f9,	%f11,	%f15
	movne	%icc,	%o3,	%i7
	ldub	[%l7 + 0x18],	%g5
	array8	%l5,	%g6,	%l3
	movvs	%icc,	%i4,	%o2
	fzero	%f0
	fandnot1	%f6,	%f6,	%f12
	save %o6, %l2, %g1
	stb	%i0,	[%l7 + 0x0A]
	ldd	[%l7 + 0x18],	%f0
	srl	%g2,	0x09,	%i3
	andn	%i6,	0x09F4,	%l1
	mova	%xcc,	%l4,	%o1
	lduw	[%l7 + 0x70],	%o5
	fandnot1s	%f13,	%f6,	%f6
	edge8	%i2,	%o7,	%l6
	smulcc	%l0,	0x1DEA,	%o4
	fmul8sux16	%f8,	%f2,	%f10
	sethi	0x05FF,	%g4
	std	%f8,	[%l7 + 0x28]
	ld	[%l7 + 0x18],	%f15
	udiv	%g7,	0x1536,	%g3
	edge16	%i1,	%o0,	%o3
	movrne	%i7,	0x365,	%i5
	movpos	%icc,	%g5,	%g6
	fnot2s	%f4,	%f10
	fmovdcc	%icc,	%f12,	%f9
	array16	%l5,	%i4,	%o2
	ldx	[%l7 + 0x48],	%o6
	xorcc	%l3,	%g1,	%i0
	movrlez	%l2,	%i3,	%g2
	sll	%l1,	%i6,	%o1
	ldd	[%l7 + 0x68],	%l4
	subcc	%i2,	0x1335,	%o7
	ldd	[%l7 + 0x50],	%f14
	udivx	%o5,	0x0EBF,	%l0
	fmul8x16au	%f5,	%f15,	%f8
	xnorcc	%l6,	0x162F,	%o4
	alignaddr	%g7,	%g4,	%g3
	xor	%i1,	%o3,	%i7
	fmovde	%icc,	%f0,	%f3
	movpos	%icc,	%o0,	%i5
	or	%g6,	%g5,	%i4
	ld	[%l7 + 0x14],	%f12
	movneg	%xcc,	%o2,	%o6
	edge8ln	%l3,	%g1,	%i0
	movvs	%icc,	%l5,	%i3
	andn	%g2,	0x1842,	%l2
	stb	%l1,	[%l7 + 0x5C]
	alignaddrl	%o1,	%l4,	%i6
	movn	%icc,	%i2,	%o5
	fand	%f2,	%f0,	%f10
	std	%f8,	[%l7 + 0x10]
	orn	%o7,	0x0124,	%l6
	xnor	%o4,	%g7,	%g4
	subc	%l0,	%i1,	%o3
	subccc	%g3,	%o0,	%i7
	mova	%xcc,	%i5,	%g5
	fcmpeq32	%f0,	%f12,	%g6
	andncc	%o2,	%i4,	%o6
	sethi	0x0102,	%l3
	add	%g1,	0x0673,	%l5
	movrlez	%i0,	%g2,	%l2
	udiv	%i3,	0x0477,	%l1
	ldx	[%l7 + 0x70],	%l4
	xorcc	%i6,	0x02C2,	%o1
	fxor	%f14,	%f6,	%f2
	sth	%i2,	[%l7 + 0x60]
	sth	%o5,	[%l7 + 0x50]
	save %o7, %o4, %g7
	movrne	%l6,	0x2EE,	%l0
	std	%f0,	[%l7 + 0x68]
	fmovdle	%icc,	%f14,	%f15
	movneg	%icc,	%g4,	%i1
	std	%f10,	[%l7 + 0x58]
	subcc	%o3,	%g3,	%i7
	smul	%i5,	%g5,	%o0
	stb	%g6,	[%l7 + 0x69]
	orncc	%o2,	%o6,	%i4
	fmovdcc	%xcc,	%f1,	%f11
	edge32l	%g1,	%l3,	%l5
	stx	%i0,	[%l7 + 0x40]
	movl	%xcc,	%l2,	%g2
	mulscc	%l1,	%i3,	%i6
	mova	%xcc,	%o1,	%i2
	fpsub16	%f8,	%f8,	%f6
	movl	%icc,	%l4,	%o7
	sub	%o4,	0x03D9,	%o5
	udivcc	%g7,	0x1B80,	%l0
	alignaddrl	%g4,	%i1,	%l6
	alignaddrl	%g3,	%i7,	%i5
	smul	%g5,	%o3,	%g6
	udivcc	%o2,	0x0454,	%o6
	ldx	[%l7 + 0x40],	%i4
	stb	%g1,	[%l7 + 0x66]
	sethi	0x172D,	%o0
	edge32n	%l3,	%l5,	%i0
	fmovrslez	%g2,	%f0,	%f0
	andn	%l2,	%i3,	%l1
	andncc	%o1,	%i2,	%l4
	stb	%o7,	[%l7 + 0x13]
	lduh	[%l7 + 0x26],	%i6
	fmovsneg	%xcc,	%f15,	%f12
	ldsh	[%l7 + 0x2C],	%o4
	movvc	%xcc,	%o5,	%g7
	restore %l0, 0x0EDE, %i1
	movrgz	%l6,	0x0CF,	%g3
	movre	%g4,	%i5,	%i7
	movvs	%icc,	%g5,	%o3
	or	%o2,	0x176B,	%o6
	ldx	[%l7 + 0x40],	%g6
	udivx	%i4,	0x08A9,	%o0
	andn	%l3,	%l5,	%g1
	move	%icc,	%i0,	%g2
	movrgz	%i3,	%l2,	%l1
	movle	%icc,	%o1,	%l4
	movrgz	%o7,	0x0EF,	%i2
	fmovsgu	%xcc,	%f5,	%f1
	fmovrdlz	%o4,	%f14,	%f4
	subccc	%i6,	0x0C7C,	%g7
	array16	%l0,	%o5,	%l6
	sdiv	%g3,	0x0CF0,	%i1
	edge32l	%g4,	%i5,	%i7
	sub	%g5,	%o2,	%o3
	lduh	[%l7 + 0x70],	%g6
	movre	%i4,	0x02E,	%o6
	udivx	%o0,	0x03BB,	%l5
	popc	0x1233,	%l3
	fmovdvc	%xcc,	%f15,	%f6
	mova	%icc,	%i0,	%g1
	pdist	%f12,	%f6,	%f8
	save %i3, 0x174E, %l2
	popc	0x16E8,	%l1
	sll	%o1,	%g2,	%o7
	xorcc	%l4,	%o4,	%i2
	ldx	[%l7 + 0x38],	%g7
	subcc	%i6,	0x0CC9,	%o5
	movpos	%xcc,	%l6,	%l0
	udivx	%i1,	0x1F18,	%g3
	fzero	%f10
	stb	%i5,	[%l7 + 0x7A]
	fpadd16	%f0,	%f0,	%f14
	sra	%g4,	0x0E,	%g5
	movrlz	%o2,	0x36A,	%o3
	array8	%i7,	%g6,	%o6
	fpmerge	%f3,	%f15,	%f0
	array16	%i4,	%o0,	%l3
	fmovrdlez	%i0,	%f10,	%f4
	movge	%xcc,	%g1,	%l5
	addc	%i3,	0x05D6,	%l2
	movg	%icc,	%l1,	%o1
	movge	%xcc,	%g2,	%l4
	udivx	%o7,	0x1A76,	%o4
	edge32	%i2,	%g7,	%i6
	udiv	%l6,	0x058A,	%o5
	lduw	[%l7 + 0x20],	%l0
	umul	%i1,	0x0EEF,	%g3
	fnor	%f0,	%f2,	%f0
	stw	%g4,	[%l7 + 0x7C]
	ldub	[%l7 + 0x39],	%g5
	sra	%o2,	0x14,	%o3
	andncc	%i7,	%g6,	%o6
	fnor	%f2,	%f12,	%f0
	sllx	%i5,	0x0B,	%i4
	edge8n	%o0,	%i0,	%g1
	restore %l5, 0x1A1F, %l3
	movrgz	%i3,	%l2,	%o1
	mulx	%l1,	%g2,	%o7
	movre	%o4,	0x034,	%l4
	edge8n	%g7,	%i6,	%l6
	fcmpeq16	%f4,	%f14,	%o5
	fmovdvc	%xcc,	%f5,	%f11
	popc	0x0E04,	%l0
	movpos	%xcc,	%i2,	%i1
	movn	%icc,	%g4,	%g3
	udiv	%o2,	0x151C,	%g5
	sllx	%i7,	%g6,	%o3
	fmul8x16au	%f6,	%f4,	%f8
	subccc	%o6,	0x0A1C,	%i4
	fmovrslz	%i5,	%f7,	%f8
	move	%xcc,	%i0,	%g1
	movrlez	%o0,	%l5,	%l3
	movl	%icc,	%i3,	%o1
	fmovdcs	%icc,	%f15,	%f11
	edge8	%l1,	%g2,	%o7
	movcs	%icc,	%l2,	%l4
	array16	%g7,	%o4,	%l6
	smulcc	%i6,	0x0FA3,	%l0
	srlx	%i2,	0x10,	%i1
	subc	%g4,	0x074B,	%o5
	ld	[%l7 + 0x20],	%f15
	array8	%g3,	%g5,	%o2
	alignaddr	%g6,	%o3,	%o6
	fmovdpos	%icc,	%f11,	%f5
	movrlz	%i7,	0x1CF,	%i4
	addcc	%i0,	0x1739,	%i5
	array8	%o0,	%l5,	%l3
	movcc	%xcc,	%i3,	%g1
	sub	%l1,	0x1B4F,	%o1
	udivx	%o7,	0x18E7,	%g2
	fmovde	%icc,	%f3,	%f8
	xor	%l4,	0x1556,	%l2
	ldd	[%l7 + 0x58],	%f6
	subc	%g7,	%l6,	%o4
	sth	%l0,	[%l7 + 0x34]
	xnor	%i2,	0x0647,	%i6
	std	%f0,	[%l7 + 0x30]
	addc	%i1,	%g4,	%g3
	fmovsleu	%xcc,	%f10,	%f0
	fnors	%f2,	%f14,	%f6
	xorcc	%o5,	%o2,	%g6
	addcc	%o3,	0x0FE1,	%o6
	fmovsleu	%xcc,	%f4,	%f5
	edge32ln	%g5,	%i4,	%i0
	sra	%i5,	%o0,	%l5
	fmovspos	%xcc,	%f13,	%f4
	srlx	%l3,	0x02,	%i7
	movg	%icc,	%g1,	%l1
	andn	%i3,	0x1CA8,	%o7
	fmovsle	%xcc,	%f8,	%f10
	ld	[%l7 + 0x0C],	%f15
	subcc	%o1,	0x13D7,	%l4
	edge8n	%g2,	%g7,	%l6
	lduw	[%l7 + 0x68],	%l2
	save %l0, 0x0A81, %i2
	fcmps	%fcc1,	%f15,	%f11
	st	%f11,	[%l7 + 0x58]
	edge8	%i6,	%i1,	%o4
	movge	%xcc,	%g3,	%g4
	edge32ln	%o5,	%g6,	%o3
	alignaddrl	%o6,	%o2,	%i4
	srlx	%g5,	%i0,	%o0
	sethi	0x0D86,	%l5
	move	%xcc,	%l3,	%i7
	ldx	[%l7 + 0x50],	%g1
	array32	%i5,	%i3,	%o7
	fandnot2	%f4,	%f12,	%f6
	smulcc	%o1,	0x0E45,	%l4
	edge32ln	%g2,	%g7,	%l1
	movvs	%icc,	%l6,	%l2
	xnor	%i2,	%i6,	%l0
	alignaddr	%i1,	%o4,	%g3
	mulx	%g4,	%o5,	%g6
	mova	%icc,	%o6,	%o2
	fnot1s	%f8,	%f9
	fmovrdlez	%o3,	%f4,	%f6
	movrne	%i4,	%g5,	%o0
	sub	%l5,	%l3,	%i7
	orcc	%i0,	0x1B5D,	%g1
	array32	%i3,	%o7,	%o1
	movgu	%icc,	%i5,	%l4
	fpackfix	%f12,	%f12
	save %g7, 0x164D, %g2
	stw	%l1,	[%l7 + 0x1C]
	pdist	%f6,	%f0,	%f6
	fxor	%f8,	%f0,	%f8
	ldsb	[%l7 + 0x6F],	%l6
	orcc	%l2,	0x08DB,	%i2
	st	%f0,	[%l7 + 0x28]
	mulscc	%l0,	%i1,	%i6
	lduh	[%l7 + 0x56],	%o4
	smul	%g4,	%g3,	%o5
	orcc	%o6,	%g6,	%o3
	movg	%xcc,	%o2,	%i4
	movvs	%icc,	%g5,	%l5
	movneg	%xcc,	%l3,	%i7
	lduh	[%l7 + 0x0A],	%o0
	edge8n	%i0,	%g1,	%i3
	udivcc	%o1,	0x1847,	%o7
	movrlz	%i5,	%g7,	%g2
	edge32n	%l1,	%l4,	%l2
	array16	%l6,	%i2,	%i1
	fmovsge	%xcc,	%f2,	%f9
	or	%l0,	0x0907,	%o4
	edge32l	%g4,	%g3,	%i6
	movrgez	%o6,	0x1E2,	%o5
	save %g6, %o2, %o3
	fors	%f4,	%f11,	%f15
	restore %i4, %g5, %l3
	orn	%l5,	0x1639,	%o0
	smulcc	%i7,	%i0,	%i3
	movleu	%xcc,	%o1,	%g1
	addccc	%i5,	0x1D81,	%o7
	addccc	%g7,	0x0473,	%g2
	fpackfix	%f4,	%f2
	addccc	%l4,	0x0BE7,	%l2
	lduw	[%l7 + 0x38],	%l6
	sra	%i2,	%i1,	%l0
	alignaddr	%o4,	%l1,	%g4
	addccc	%g3,	%i6,	%o5
	orcc	%o6,	%o2,	%g6
	fpadd32	%f8,	%f2,	%f12
	movrgz	%i4,	0x28F,	%o3
	ldd	[%l7 + 0x60],	%f12
	stb	%g5,	[%l7 + 0x46]
	movrlez	%l3,	0x0E0,	%o0
	sra	%l5,	0x00,	%i7
	fmovsvc	%icc,	%f6,	%f13
	or	%i0,	%i3,	%g1
	movne	%xcc,	%i5,	%o7
	udivx	%g7,	0x0285,	%o1
	addc	%g2,	%l2,	%l6
	sra	%i2,	0x08,	%i1
	xnor	%l4,	%o4,	%l0
	sllx	%l1,	0x0A,	%g4
	movrne	%i6,	0x3F7,	%g3
	udivx	%o5,	0x0968,	%o2
	ldsb	[%l7 + 0x17],	%o6
	move	%icc,	%g6,	%o3
	popc	%i4,	%g5
	udiv	%l3,	0x1AEB,	%o0
	array8	%i7,	%i0,	%l5
	fcmped	%fcc1,	%f14,	%f6
	addcc	%g1,	0x1617,	%i3
	ldsh	[%l7 + 0x6E],	%o7
	subccc	%g7,	%o1,	%g2
	movpos	%xcc,	%l2,	%i5
	ldd	[%l7 + 0x10],	%f14
	or	%l6,	%i1,	%l4
	ldsb	[%l7 + 0x09],	%o4
	fpsub32s	%f12,	%f14,	%f7
	edge32ln	%l0,	%i2,	%l1
	movpos	%xcc,	%i6,	%g3
	udiv	%g4,	0x1758,	%o5
	bshuffle	%f2,	%f10,	%f6
	movcc	%icc,	%o2,	%o6
	movrne	%g6,	%o3,	%g5
	fmovsa	%icc,	%f4,	%f6
	orcc	%i4,	%o0,	%i7
	subc	%l3,	0x1645,	%i0
	orncc	%l5,	0x1265,	%g1
	fmul8x16al	%f2,	%f0,	%f4
	fnors	%f5,	%f10,	%f12
	movvc	%xcc,	%o7,	%g7
	fcmpgt32	%f8,	%f14,	%i3
	stb	%g2,	[%l7 + 0x60]
	subc	%l2,	0x1712,	%i5
	movn	%icc,	%l6,	%i1
	sethi	0x1E92,	%l4
	subc	%o1,	%o4,	%l0
	fzero	%f4
	edge8n	%l1,	%i2,	%i6
	alignaddr	%g4,	%o5,	%g3
	edge32n	%o2,	%o6,	%g6
	sra	%g5,	0x1F,	%i4
	xnor	%o3,	%i7,	%l3
	orn	%i0,	%l5,	%g1
	array8	%o7,	%o0,	%g7
	movg	%icc,	%g2,	%i3
	umulcc	%l2,	%i5,	%i1
	movrne	%l6,	0x058,	%l4
	umul	%o4,	%l0,	%l1
	movvc	%xcc,	%i2,	%i6
	srlx	%o1,	0x19,	%o5
	fmovrdlez	%g3,	%f8,	%f12
	andn	%o2,	%o6,	%g6
	stx	%g4,	[%l7 + 0x70]
	movrgz	%i4,	%o3,	%i7
	movvs	%xcc,	%g5,	%i0
	fcmpd	%fcc0,	%f2,	%f12
	fcmpd	%fcc1,	%f6,	%f4
	addcc	%l5,	0x1A77,	%g1
	udivcc	%o7,	0x1988,	%o0
	ldd	[%l7 + 0x38],	%l2
	udiv	%g2,	0x1490,	%i3
	sdiv	%l2,	0x14A5,	%i5
	fmul8x16au	%f0,	%f11,	%f0
	fpack32	%f4,	%f8,	%f14
	alignaddrl	%g7,	%l6,	%i1
	movpos	%icc,	%l4,	%l0
	smul	%l1,	%i2,	%o4
	edge8	%i6,	%o5,	%o1
	edge8	%g3,	%o6,	%o2
	sdivx	%g4,	0x19D1,	%i4
	movg	%icc,	%g6,	%o3
	movcs	%xcc,	%i7,	%g5
	movge	%icc,	%i0,	%l5
	ldub	[%l7 + 0x45],	%g1
	move	%icc,	%o7,	%o0
	sdivcc	%l3,	0x0BDE,	%i3
	fnot2	%f4,	%f2
	lduw	[%l7 + 0x30],	%l2
	subcc	%g2,	%i5,	%g7
	stw	%i1,	[%l7 + 0x48]
	fpack32	%f2,	%f2,	%f14
	xorcc	%l4,	0x16BC,	%l0
	xorcc	%l6,	%i2,	%l1
	fmovsvs	%xcc,	%f10,	%f15
	ldd	[%l7 + 0x50],	%f0
	edge8l	%o4,	%o5,	%o1
	movvs	%icc,	%g3,	%o6
	sdivcc	%i6,	0x1BE0,	%o2
	orcc	%g4,	%i4,	%o3
	stw	%i7,	[%l7 + 0x0C]
	ldsh	[%l7 + 0x4E],	%g6
	srl	%i0,	%l5,	%g5
	fxor	%f14,	%f4,	%f0
	edge8n	%o7,	%g1,	%l3
	movvc	%icc,	%o0,	%l2
	ldx	[%l7 + 0x08],	%i3
	lduw	[%l7 + 0x48],	%g2
	mulx	%g7,	0x0431,	%i5
	fpsub32	%f4,	%f14,	%f12
	fmovrsne	%i1,	%f1,	%f7
	movl	%xcc,	%l4,	%l0
	edge8n	%l6,	%i2,	%l1
	xor	%o4,	%o1,	%g3
	umulcc	%o6,	%i6,	%o5
	movrne	%g4,	%i4,	%o2
	ldd	[%l7 + 0x28],	%o2
	subcc	%i7,	0x0672,	%i0
	addc	%g6,	%g5,	%l5
	fmovrslez	%o7,	%f0,	%f10
	andn	%g1,	%l3,	%o0
	edge8ln	%i3,	%g2,	%l2
	ldd	[%l7 + 0x48],	%i4
	fpackfix	%f2,	%f14
	lduh	[%l7 + 0x76],	%g7
	fnegd	%f10,	%f10
	movl	%icc,	%i1,	%l4
	mova	%xcc,	%l0,	%i2
	subc	%l6,	0x0117,	%o4
	movne	%xcc,	%l1,	%g3
	ldd	[%l7 + 0x08],	%o6
	add	%o1,	%o5,	%i6
	stb	%i4,	[%l7 + 0x13]
	srax	%o2,	%g4,	%o3
	movre	%i0,	%g6,	%g5
	fmovd	%f4,	%f12
	fmovrsne	%i7,	%f4,	%f4
	fnands	%f3,	%f14,	%f3
	fornot2	%f10,	%f6,	%f2
	fmovdl	%xcc,	%f4,	%f12
	movre	%o7,	%l5,	%l3
	movle	%icc,	%o0,	%i3
	movrgez	%g1,	0x191,	%l2
	array32	%g2,	%i5,	%i1
	fpack32	%f4,	%f10,	%f2
	st	%f7,	[%l7 + 0x14]
	edge32	%l4,	%g7,	%l0
	andcc	%l6,	0x1BD4,	%o4
	subcc	%i2,	%l1,	%o6
	subccc	%g3,	%o5,	%o1
	andcc	%i4,	%o2,	%g4
	movvs	%icc,	%o3,	%i0
	fornot2s	%f11,	%f4,	%f0
	stx	%g6,	[%l7 + 0x30]
	sra	%i6,	0x19,	%g5
	for	%f4,	%f0,	%f4
	sdivx	%o7,	0x1E0D,	%l5
	array8	%l3,	%i7,	%i3
	and	%o0,	0x09E6,	%l2
	orncc	%g2,	0x1561,	%i5
	fpadd32	%f10,	%f14,	%f6
	ldsh	[%l7 + 0x78],	%g1
	xnor	%i1,	%g7,	%l4
	movvc	%icc,	%l0,	%l6
	movvc	%icc,	%i2,	%o4
	siam	0x1
	edge16ln	%l1,	%g3,	%o6
	array8	%o5,	%i4,	%o1
	add	%o2,	%o3,	%g4
	fcmpeq32	%f4,	%f0,	%g6
	fzero	%f2
	subc	%i0,	0x0720,	%g5
	sll	%i6,	%l5,	%l3
	edge8n	%o7,	%i3,	%o0
	ld	[%l7 + 0x4C],	%f11
	stw	%l2,	[%l7 + 0x4C]
	srlx	%i7,	%g2,	%i5
	fabsd	%f12,	%f6
	stb	%i1,	[%l7 + 0x2F]
	fpsub32s	%f4,	%f12,	%f0
	lduw	[%l7 + 0x1C],	%g7
	edge32	%l4,	%l0,	%l6
	xnor	%g1,	0x1B56,	%o4
	sll	%i2,	0x11,	%g3
	edge16n	%l1,	%o6,	%o5
	orn	%i4,	0x01EA,	%o2
	edge16n	%o3,	%g4,	%o1
	fmovdneg	%xcc,	%f15,	%f9
	lduh	[%l7 + 0x2A],	%g6
	ldd	[%l7 + 0x68],	%f10
	movrlz	%i0,	%g5,	%l5
	ldsh	[%l7 + 0x66],	%i6
	srlx	%l3,	%i3,	%o0
	fones	%f5
	orncc	%o7,	0x0FA1,	%l2
	udiv	%i7,	0x0A97,	%i5
	lduw	[%l7 + 0x1C],	%i1
	udivx	%g7,	0x083A,	%l4
	smul	%l0,	0x1B03,	%l6
	movrgez	%g1,	%o4,	%i2
	fzeros	%f0
	mova	%icc,	%g2,	%g3
	xnorcc	%l1,	0x1C62,	%o5
	sdivcc	%o6,	0x16C9,	%i4
	edge8ln	%o2,	%o3,	%o1
	sra	%g4,	0x05,	%i0
	edge32l	%g5,	%l5,	%i6
	fmovdpos	%icc,	%f12,	%f1
	sdiv	%l3,	0x0919,	%g6
	array8	%o0,	%i3,	%o7
	xorcc	%i7,	0x09B5,	%i5
	fpackfix	%f2,	%f0
	addcc	%i1,	%l2,	%g7
	ldsh	[%l7 + 0x18],	%l0
	fone	%f2
	ldd	[%l7 + 0x28],	%i6
	edge8l	%l4,	%g1,	%o4
	edge8n	%g2,	%i2,	%l1
	popc	%g3,	%o6
	subcc	%o5,	0x1393,	%i4
	edge8l	%o3,	%o2,	%g4
	movre	%o1,	0x213,	%i0
	ldub	[%l7 + 0x4C],	%l5
	sth	%i6,	[%l7 + 0x6C]
	movrne	%g5,	0x1B1,	%l3
	fcmple16	%f6,	%f6,	%o0
	udiv	%i3,	0x13A9,	%g6
	st	%f2,	[%l7 + 0x38]
	udiv	%i7,	0x103C,	%i5
	movvs	%icc,	%i1,	%o7
	array32	%g7,	%l2,	%l0
	movcc	%icc,	%l6,	%g1
	fmovdge	%icc,	%f9,	%f2
	sth	%l4,	[%l7 + 0x5A]
	umul	%o4,	0x06BF,	%g2
	ldx	[%l7 + 0x38],	%l1
	smul	%i2,	0x018F,	%o6
	orn	%o5,	0x1EA9,	%g3
	mulscc	%o3,	%o2,	%g4
	fcmps	%fcc2,	%f15,	%f6
	subcc	%o1,	%i4,	%l5
	stx	%i6,	[%l7 + 0x50]
	movgu	%icc,	%i0,	%l3
	udiv	%g5,	0x089A,	%i3
	movrgz	%g6,	%i7,	%i5
	orn	%o0,	%i1,	%o7
	movrgz	%g7,	0x3E0,	%l2
	alignaddr	%l6,	%g1,	%l0
	smulcc	%o4,	0x00F4,	%g2
	edge32n	%l4,	%i2,	%l1
	fcmple32	%f4,	%f2,	%o5
	fcmpeq16	%f10,	%f14,	%g3
	edge8ln	%o3,	%o6,	%g4
	std	%f6,	[%l7 + 0x58]
	edge16ln	%o1,	%i4,	%o2
	lduw	[%l7 + 0x64],	%l5
	fmovrdgz	%i0,	%f14,	%f8
	fsrc1	%f6,	%f0
	udiv	%l3,	0x1D52,	%i6
	sllx	%g5,	0x18,	%g6
	ldsb	[%l7 + 0x51],	%i7
	orncc	%i5,	%o0,	%i3
	edge32l	%o7,	%i1,	%g7
	ld	[%l7 + 0x0C],	%f6
	udivcc	%l6,	0x0EED,	%g1
	stx	%l2,	[%l7 + 0x30]
	stw	%l0,	[%l7 + 0x54]
	sth	%g2,	[%l7 + 0x40]
	orcc	%o4,	0x18CB,	%i2
	srlx	%l4,	%o5,	%l1
	movrgez	%g3,	%o3,	%o6
	fmovdle	%xcc,	%f2,	%f9
	andncc	%o1,	%g4,	%o2
	movrgez	%i4,	%l5,	%l3
	edge8n	%i6,	%g5,	%i0
	edge16n	%i7,	%g6,	%o0
	movpos	%icc,	%i3,	%o7
	array32	%i1,	%i5,	%g7
	fnot2	%f2,	%f12
	fnand	%f10,	%f2,	%f0
	movg	%xcc,	%l6,	%g1
	sdiv	%l2,	0x012F,	%l0
	st	%f10,	[%l7 + 0x48]
	mulx	%o4,	%i2,	%g2
	fmovsne	%icc,	%f14,	%f2
	ldsh	[%l7 + 0x5A],	%o5
	xnorcc	%l4,	%l1,	%o3
	fandnot1	%f6,	%f10,	%f0
	xnor	%o6,	%o1,	%g3
	xorcc	%o2,	%i4,	%l5
	edge16l	%l3,	%i6,	%g4
	movcs	%xcc,	%i0,	%i7
	xorcc	%g5,	%o0,	%i3
	fcmps	%fcc0,	%f15,	%f10
	fcmpeq32	%f2,	%f14,	%o7
	fmovrdgez	%g6,	%f4,	%f4
	movge	%icc,	%i1,	%i5
	edge32	%l6,	%g1,	%g7
	edge32n	%l2,	%l0,	%i2
	andn	%g2,	%o4,	%o5
	ldub	[%l7 + 0x63],	%l4
	mulscc	%l1,	0x126B,	%o6
	fxnor	%f6,	%f12,	%f8
	movg	%icc,	%o3,	%g3
	siam	0x0
	edge32ln	%o2,	%i4,	%o1
	array8	%l3,	%i6,	%l5
	array8	%g4,	%i7,	%i0
	andcc	%g5,	%o0,	%i3
	fxnors	%f4,	%f14,	%f14
	edge32ln	%g6,	%i1,	%i5
	fcmpgt16	%f0,	%f4,	%o7
	fmovrsne	%l6,	%f1,	%f12
	umul	%g7,	%g1,	%l0
	move	%xcc,	%l2,	%g2
	ldx	[%l7 + 0x50],	%i2
	xnor	%o5,	%l4,	%o4
	sdivcc	%o6,	0x1034,	%o3
	fmovdg	%xcc,	%f0,	%f8
	alignaddr	%l1,	%g3,	%o2
	srlx	%o1,	0x0D,	%l3
	sethi	0x1297,	%i6
	smul	%l5,	%g4,	%i4
	xnorcc	%i7,	0x17A1,	%i0
	edge32	%g5,	%i3,	%o0
	move	%xcc,	%g6,	%i5
	sll	%i1,	%l6,	%o7
	stw	%g7,	[%l7 + 0x78]
	sub	%g1,	0x0955,	%l0
	srax	%g2,	0x1D,	%i2
	srl	%l2,	%o5,	%o4
	movneg	%xcc,	%l4,	%o3
	for	%f0,	%f6,	%f6
	movl	%xcc,	%l1,	%o6
	fnor	%f8,	%f10,	%f8
	edge16n	%g3,	%o1,	%o2
	fpmerge	%f15,	%f8,	%f8
	movn	%icc,	%i6,	%l5
	andn	%l3,	0x1C83,	%i4
	stb	%g4,	[%l7 + 0x0C]
	ldsb	[%l7 + 0x7C],	%i0
	umulcc	%i7,	%i3,	%o0
	udivx	%g6,	0x07B7,	%i5
	and	%i1,	%l6,	%g5
	mova	%xcc,	%g7,	%g1
	fmovsvs	%xcc,	%f13,	%f14
	movcs	%icc,	%l0,	%g2
	movne	%icc,	%i2,	%o7
	save %o5, 0x11C1, %o4
	movvc	%xcc,	%l4,	%l2
	subccc	%l1,	%o3,	%o6
	fand	%f10,	%f6,	%f12
	ldd	[%l7 + 0x70],	%f10
	subcc	%o1,	%g3,	%i6
	fmovdgu	%xcc,	%f5,	%f0
	and	%l5,	%l3,	%i4
	umulcc	%g4,	0x0EA8,	%i0
	fpsub32s	%f2,	%f14,	%f10
	edge8l	%o2,	%i7,	%o0
	fpsub16s	%f0,	%f8,	%f15
	array8	%g6,	%i5,	%i1
	movrne	%l6,	0x397,	%i3
	sllx	%g5,	%g7,	%g1
	mulx	%g2,	%i2,	%o7
	sth	%o5,	[%l7 + 0x12]
	movpos	%icc,	%o4,	%l4
	sethi	0x1EB2,	%l0
	addcc	%l1,	%l2,	%o6
	edge16	%o1,	%g3,	%o3
	array8	%l5,	%l3,	%i4
	fand	%f2,	%f8,	%f12
	sth	%g4,	[%l7 + 0x3A]
	andncc	%i0,	%i6,	%o2
	fmuld8ulx16	%f12,	%f5,	%f14
	array16	%i7,	%o0,	%i5
	sub	%g6,	0x1235,	%l6
	sra	%i3,	%g5,	%i1
	addccc	%g1,	0x0629,	%g7
	or	%i2,	0x02CD,	%o7
	ldsb	[%l7 + 0x33],	%g2
	fmovspos	%icc,	%f2,	%f7
	movleu	%icc,	%o4,	%o5
	ldd	[%l7 + 0x50],	%l4
	ldd	[%l7 + 0x58],	%f4
	fnot2	%f8,	%f10
	subc	%l0,	%l2,	%o6
	subc	%o1,	%g3,	%l1
	array8	%l5,	%l3,	%i4
	array32	%o3,	%i0,	%i6
	sra	%g4,	%i7,	%o2
	fzeros	%f5
	smul	%i5,	%g6,	%l6
	fnegs	%f14,	%f15
	xorcc	%o0,	%i3,	%g5
	movg	%icc,	%i1,	%g7
	edge32	%i2,	%o7,	%g2
	movcs	%xcc,	%g1,	%o5
	fpsub16	%f6,	%f12,	%f4
	edge32n	%o4,	%l4,	%l2
	sethi	0x1337,	%o6
	movneg	%icc,	%o1,	%l0
	andn	%g3,	0x0B19,	%l1
	edge32n	%l5,	%l3,	%o3
	mulscc	%i0,	0x1217,	%i6
	mulx	%g4,	0x0420,	%i4
	movvc	%xcc,	%o2,	%i7
	xnorcc	%i5,	0x11B1,	%g6
	fpack16	%f14,	%f7
	fmovdvc	%icc,	%f15,	%f6
	movre	%l6,	0x392,	%o0
	array8	%i3,	%g5,	%g7
	sethi	0x0379,	%i1
	movg	%xcc,	%o7,	%i2
	udiv	%g2,	0x1BD1,	%g1
	movl	%xcc,	%o4,	%o5
	mulx	%l2,	0x0434,	%l4
	fmovdl	%xcc,	%f6,	%f15
	alignaddrl	%o1,	%o6,	%g3
	addcc	%l0,	0x1AE3,	%l5
	umul	%l1,	0x051A,	%l3
	std	%f4,	[%l7 + 0x20]
	fmovsvs	%xcc,	%f0,	%f1
	mulx	%i0,	0x0BE6,	%i6
	movne	%xcc,	%g4,	%i4
	xnorcc	%o3,	%i7,	%o2
	fpackfix	%f2,	%f3
	movleu	%icc,	%g6,	%i5
	movcs	%xcc,	%l6,	%i3
	orcc	%o0,	0x106B,	%g7
	ldd	[%l7 + 0x30],	%i0
	edge16l	%g5,	%i2,	%g2
	movneg	%xcc,	%o7,	%g1
	orn	%o5,	%o4,	%l2
	lduw	[%l7 + 0x10],	%o1
	sub	%l4,	0x1A0D,	%o6
	array8	%g3,	%l0,	%l1
	move	%icc,	%l3,	%l5
	orcc	%i6,	%g4,	%i4
	smul	%o3,	%i0,	%o2
	ldsw	[%l7 + 0x54],	%i7
	xorcc	%g6,	0x12D2,	%l6
	fmovrse	%i5,	%f1,	%f12
	orncc	%i3,	%o0,	%i1
	fcmpes	%fcc1,	%f4,	%f8
	lduw	[%l7 + 0x08],	%g7
	alignaddr	%g5,	%i2,	%o7
	fmovdcs	%xcc,	%f12,	%f2
	sth	%g1,	[%l7 + 0x24]
	ld	[%l7 + 0x30],	%f3
	std	%f8,	[%l7 + 0x40]
	udiv	%g2,	0x0245,	%o4
	smulcc	%l2,	0x0412,	%o1
	fmovsle	%xcc,	%f5,	%f8
	sra	%l4,	%o6,	%g3
	fmovrdlz	%o5,	%f12,	%f8
	mova	%icc,	%l1,	%l0
	umulcc	%l5,	0x1D5B,	%l3
	fmovdvc	%xcc,	%f2,	%f12
	array16	%g4,	%i4,	%o3
	sll	%i6,	%i0,	%i7
	sll	%o2,	0x1A,	%g6
	movvs	%icc,	%l6,	%i3
	std	%f4,	[%l7 + 0x78]
	umul	%i5,	%i1,	%o0
	subcc	%g5,	0x17FB,	%g7
	movrlez	%o7,	0x33B,	%g1
	edge16l	%g2,	%i2,	%l2
	fpadd32	%f4,	%f8,	%f0
	srax	%o1,	0x02,	%o4
	orncc	%l4,	%o6,	%g3
	fxor	%f14,	%f12,	%f12
	udivx	%l1,	0x066D,	%l0
	umulcc	%o5,	%l5,	%l3
	movge	%xcc,	%i4,	%g4
	ldd	[%l7 + 0x68],	%i6
	edge16	%i0,	%i7,	%o2
	xnor	%g6,	0x03D2,	%l6
	lduh	[%l7 + 0x74],	%i3
	restore %i5, %i1, %o0
	xor	%g5,	0x1F38,	%o3
	fmovrslz	%g7,	%f6,	%f5
	stb	%o7,	[%l7 + 0x69]
	sdivcc	%g1,	0x1871,	%i2
	addccc	%g2,	%o1,	%l2
	edge8n	%o4,	%l4,	%o6
	fmovspos	%icc,	%f9,	%f2
	alignaddr	%l1,	%g3,	%l0
	udivx	%o5,	0x0737,	%l3
	fmovdpos	%icc,	%f15,	%f11
	ldsb	[%l7 + 0x1A],	%i4
	subccc	%l5,	0x0CF0,	%g4
	fnands	%f3,	%f2,	%f7
	movrne	%i6,	%i0,	%i7
	orcc	%o2,	0x07F3,	%g6
	std	%f0,	[%l7 + 0x40]
	stx	%i3,	[%l7 + 0x08]
	movcc	%icc,	%i5,	%l6
	array16	%o0,	%g5,	%o3
	fmovsne	%icc,	%f12,	%f13
	andn	%g7,	%i1,	%o7
	smulcc	%i2,	0x088A,	%g1
	fsrc2s	%f12,	%f7
	fmovdneg	%icc,	%f2,	%f3
	fmovsg	%icc,	%f0,	%f15
	movge	%xcc,	%g2,	%o1
	fmovscc	%icc,	%f10,	%f3
	movvc	%icc,	%o4,	%l2
	xor	%l4,	0x1083,	%o6
	sll	%g3,	%l1,	%l0
	movre	%o5,	%l3,	%l5
	subcc	%i4,	%g4,	%i6
	stw	%i7,	[%l7 + 0x64]
	movcs	%icc,	%i0,	%o2
	lduw	[%l7 + 0x68],	%i3
	movle	%icc,	%i5,	%g6
	ldd	[%l7 + 0x60],	%f10
	movre	%o0,	%g5,	%l6
	fxors	%f11,	%f4,	%f4
	edge16n	%g7,	%i1,	%o3
	array32	%i2,	%o7,	%g1
	edge8l	%o1,	%g2,	%o4
	st	%f3,	[%l7 + 0x44]
	or	%l4,	%l2,	%g3
	sdivcc	%l1,	0x1401,	%o6
	move	%xcc,	%l0,	%l3
	fornot1s	%f0,	%f15,	%f4
	sth	%l5,	[%l7 + 0x62]
	ldd	[%l7 + 0x58],	%o4
	restore %g4, 0x060C, %i4
	fandnot2	%f12,	%f14,	%f6
	ldd	[%l7 + 0x78],	%i6
	lduh	[%l7 + 0x24],	%i7
	sth	%i0,	[%l7 + 0x76]
	addc	%o2,	%i3,	%g6
	udivcc	%i5,	0x1E52,	%g5
	st	%f8,	[%l7 + 0x70]
	ldub	[%l7 + 0x7E],	%l6
	andn	%g7,	0x0876,	%i1
	ldub	[%l7 + 0x27],	%o0
	edge32ln	%i2,	%o3,	%g1
	stb	%o1,	[%l7 + 0x60]
	ldub	[%l7 + 0x0A],	%o7
	stb	%o4,	[%l7 + 0x3D]
	sll	%g2,	0x00,	%l2
	mova	%icc,	%l4,	%g3
	fmovdleu	%icc,	%f13,	%f12
	movl	%icc,	%o6,	%l0
	ldsb	[%l7 + 0x7B],	%l1
	edge32	%l3,	%o5,	%g4
	edge8	%l5,	%i6,	%i7
	andcc	%i4,	0x1F05,	%o2
	sth	%i0,	[%l7 + 0x3A]
	fand	%f10,	%f14,	%f2
	lduh	[%l7 + 0x32],	%i3
	array8	%i5,	%g6,	%l6
	st	%f12,	[%l7 + 0x74]
	ldub	[%l7 + 0x0B],	%g7
	fmuld8sux16	%f0,	%f5,	%f14
	fandnot2s	%f3,	%f2,	%f9
	edge16	%g5,	%i1,	%i2
	udivx	%o0,	0x0133,	%o3
	fxors	%f3,	%f3,	%f0
	add	%o1,	%g1,	%o4
	fmovscc	%xcc,	%f14,	%f2
	sdivcc	%o7,	0x1C7D,	%l2
	fmovrsgz	%g2,	%f4,	%f11
	fmovrdgez	%g3,	%f6,	%f12
	popc	0x1132,	%o6
	sub	%l0,	%l1,	%l3
	fpsub32	%f0,	%f2,	%f2
	std	%f14,	[%l7 + 0x40]
	fmul8x16al	%f11,	%f15,	%f14
	alignaddr	%l4,	%g4,	%l5
	fxor	%f0,	%f14,	%f10
	movpos	%icc,	%i6,	%i7
	fnot1s	%f5,	%f0
	edge16	%i4,	%o2,	%i0
	subc	%o5,	%i3,	%i5
	edge8ln	%l6,	%g7,	%g6
	fmovdge	%icc,	%f9,	%f1
	xnor	%g5,	0x08DB,	%i1
	movneg	%xcc,	%o0,	%i2
	addccc	%o1,	%o3,	%g1
	fmovrslez	%o7,	%f3,	%f10
	udiv	%o4,	0x0F27,	%g2
	ldsh	[%l7 + 0x2A],	%g3
	mova	%xcc,	%l2,	%o6
	ldub	[%l7 + 0x13],	%l1
	fcmpgt16	%f10,	%f2,	%l0
	alignaddr	%l4,	%l3,	%g4
	ldsb	[%l7 + 0x24],	%l5
	mulscc	%i6,	0x07D6,	%i4
	edge16	%o2,	%i7,	%i0
	andncc	%o5,	%i3,	%l6
	movgu	%xcc,	%g7,	%g6
	fones	%f1
	fornot2	%f14,	%f8,	%f14
	fmovsa	%icc,	%f7,	%f2
	fpmerge	%f6,	%f0,	%f4
	edge32n	%g5,	%i1,	%i5
	subccc	%i2,	%o0,	%o1
	ldub	[%l7 + 0x72],	%g1
	alignaddrl	%o7,	%o3,	%g2
	edge16	%g3,	%l2,	%o4
	movl	%xcc,	%o6,	%l1
	fone	%f10
	fmovsle	%icc,	%f10,	%f1
	fmuld8ulx16	%f4,	%f4,	%f14
	andcc	%l0,	%l3,	%g4
	ldd	[%l7 + 0x38],	%f2
	ldsw	[%l7 + 0x24],	%l4
	or	%i6,	0x0B0C,	%i4
	fpsub32s	%f11,	%f6,	%f15
	movneg	%xcc,	%o2,	%l5
	ldd	[%l7 + 0x68],	%i6
	stx	%o5,	[%l7 + 0x60]
	edge32l	%i3,	%l6,	%i0
	movre	%g7,	0x095,	%g6
	stb	%i1,	[%l7 + 0x67]
	srl	%g5,	%i2,	%o0
	fexpand	%f2,	%f4
	movrgez	%o1,	%g1,	%o7
	movrgz	%o3,	0x31B,	%i5
	array32	%g2,	%l2,	%g3
	fmovrdne	%o6,	%f2,	%f12
	movneg	%icc,	%l1,	%o4
	save %l0, %g4, %l4
	fmovsn	%icc,	%f5,	%f6
	addccc	%i6,	%l3,	%o2
	movneg	%icc,	%l5,	%i7
	subc	%o5,	%i4,	%l6
	popc	%i3,	%g7
	fabsd	%f4,	%f2
	edge32l	%i0,	%i1,	%g5
	stx	%g6,	[%l7 + 0x68]
	sdivx	%i2,	0x1571,	%o0
	fmovsl	%xcc,	%f0,	%f7
	fmovscs	%xcc,	%f1,	%f4
	fmovrdlz	%o1,	%f14,	%f14
	st	%f12,	[%l7 + 0x20]
	subccc	%o7,	%g1,	%i5
	fcmple32	%f0,	%f6,	%o3
	fmovsneg	%xcc,	%f10,	%f1
	edge16	%g2,	%l2,	%o6
	movgu	%icc,	%g3,	%o4
	sethi	0x1B08,	%l1
	subccc	%l0,	%l4,	%i6
	sth	%g4,	[%l7 + 0x18]
	add	%o2,	0x1F98,	%l5
	srax	%i7,	%o5,	%l3
	movrgez	%l6,	0x3D9,	%i4
	sdivcc	%i3,	0x05A2,	%g7
	sllx	%i0,	0x12,	%g5
	ldd	[%l7 + 0x70],	%f12
	fmovsneg	%xcc,	%f0,	%f1
	srlx	%g6,	0x0F,	%i2
	edge16	%i1,	%o1,	%o7
	movl	%icc,	%g1,	%i5
	move	%icc,	%o3,	%g2
	movrlez	%l2,	%o6,	%g3
	movvs	%icc,	%o4,	%l1
	sdivx	%l0,	0x1361,	%o0
	edge32n	%i6,	%g4,	%l4
	fmovrse	%l5,	%f4,	%f11
	fcmple16	%f6,	%f8,	%o2
	fmul8x16	%f1,	%f0,	%f2
	movvc	%icc,	%o5,	%l3
	ldsh	[%l7 + 0x32],	%i7
	movcs	%xcc,	%i4,	%i3
	edge8	%g7,	%l6,	%g5
	stw	%g6,	[%l7 + 0x5C]
	array16	%i0,	%i1,	%i2
	fmovsg	%xcc,	%f5,	%f8
	orn	%o7,	%g1,	%i5
	fmovrslez	%o3,	%f10,	%f14
	fnegd	%f4,	%f8
	sll	%g2,	%o1,	%l2
	movne	%icc,	%o6,	%o4
	sethi	0x0BF6,	%l1
	subcc	%l0,	0x1EA4,	%g3
	stx	%o0,	[%l7 + 0x78]
	edge32ln	%i6,	%g4,	%l5
	sth	%o2,	[%l7 + 0x6E]
	fmovsg	%xcc,	%f8,	%f6
	andn	%l4,	%l3,	%i7
	xnorcc	%o5,	%i4,	%i3
	sra	%l6,	%g7,	%g6
	subccc	%g5,	0x15FC,	%i1
	edge16ln	%i2,	%i0,	%g1
	umulcc	%o7,	0x19DC,	%i5
	ldx	[%l7 + 0x28],	%o3
	stw	%o1,	[%l7 + 0x70]
	subcc	%l2,	%o6,	%o4
	movcc	%xcc,	%l1,	%l0
	move	%icc,	%g2,	%o0
	subc	%g3,	%i6,	%l5
	movre	%o2,	%g4,	%l3
	fmovdge	%xcc,	%f14,	%f7
	fpack16	%f8,	%f10
	restore %l4, 0x132D, %i7
	sdivx	%i4,	0x0135,	%i3
	st	%f10,	[%l7 + 0x30]
	fpadd16s	%f7,	%f5,	%f4
	array32	%o5,	%l6,	%g7
	fmovdcc	%icc,	%f3,	%f3
	siam	0x7
	fmovdge	%xcc,	%f5,	%f1
	fmovdneg	%icc,	%f8,	%f9
	ld	[%l7 + 0x18],	%f7
	addccc	%g6,	%g5,	%i1
	addccc	%i2,	0x09EF,	%i0
	ldx	[%l7 + 0x10],	%o7
	stb	%i5,	[%l7 + 0x3A]
	subc	%o3,	%g1,	%l2
	movne	%icc,	%o6,	%o4
	ldub	[%l7 + 0x57],	%o1
	sdiv	%l0,	0x00F8,	%l1
	andncc	%g2,	%g3,	%i6
	edge32n	%o0,	%l5,	%g4
	subc	%o2,	%l4,	%i7
	ldd	[%l7 + 0x48],	%f4
	fmovsn	%icc,	%f3,	%f1
	fpsub32s	%f10,	%f14,	%f12
	fcmple16	%f12,	%f4,	%i4
	edge16	%l3,	%o5,	%l6
	fcmpgt32	%f10,	%f2,	%i3
	add	%g7,	0x09E0,	%g6
	movrgez	%g5,	0x18A,	%i2
	movcs	%xcc,	%i0,	%o7
	ldsh	[%l7 + 0x18],	%i1
	or	%o3,	0x0537,	%i5
	movcs	%icc,	%l2,	%o6
	std	%f12,	[%l7 + 0x70]
	sllx	%o4,	0x19,	%o1
	ldsb	[%l7 + 0x20],	%l0
	sdiv	%g1,	0x0BCD,	%l1
	edge32l	%g2,	%i6,	%o0
	ld	[%l7 + 0x70],	%f3
	ldsb	[%l7 + 0x78],	%g3
	sdiv	%l5,	0x08B2,	%o2
	sethi	0x0DF5,	%l4
	srlx	%g4,	0x1A,	%i7
	ldd	[%l7 + 0x40],	%f2
	subc	%i4,	%o5,	%l6
	fcmple16	%f12,	%f8,	%i3
	ldx	[%l7 + 0x48],	%g7
	ldub	[%l7 + 0x1B],	%g6
	fmovsn	%xcc,	%f3,	%f3
	movn	%icc,	%g5,	%i2
	movrlz	%i0,	0x01A,	%l3
	faligndata	%f2,	%f4,	%f0
	fornot1s	%f2,	%f0,	%f7
	fmovda	%xcc,	%f9,	%f15
	movl	%icc,	%o7,	%o3
	save %i5, 0x0F20, %l2
	srax	%o6,	%i1,	%o4
	fandnot2s	%f9,	%f14,	%f8
	movl	%icc,	%l0,	%o1
	subccc	%l1,	0x0F8A,	%g1
	movrlz	%i6,	0x265,	%o0
	movcc	%xcc,	%g2,	%l5
	fmovsleu	%icc,	%f13,	%f11
	umulcc	%o2,	%l4,	%g4
	array16	%i7,	%g3,	%i4
	fmovrdne	%o5,	%f4,	%f6
	stx	%l6,	[%l7 + 0x70]
	ldsh	[%l7 + 0x36],	%g7
	fcmps	%fcc3,	%f5,	%f2
	sllx	%i3,	0x1D,	%g5
	orn	%i2,	%g6,	%i0
	movcc	%xcc,	%l3,	%o7
	edge16n	%i5,	%o3,	%l2
	movre	%i1,	0x188,	%o4
	fsrc2	%f0,	%f12
	subcc	%o6,	%l0,	%l1
	save %g1, %o1, %i6
	stx	%o0,	[%l7 + 0x08]
	fandnot1s	%f2,	%f14,	%f10
	std	%f14,	[%l7 + 0x30]
	ldx	[%l7 + 0x68],	%g2
	xnor	%l5,	%o2,	%g4
	pdist	%f10,	%f14,	%f6
	ldsw	[%l7 + 0x54],	%l4
	edge32n	%i7,	%g3,	%o5
	edge32ln	%l6,	%i4,	%i3
	addccc	%g7,	0x1C03,	%g5
	fornot2s	%f14,	%f2,	%f2
	fmovdge	%xcc,	%f15,	%f12
	fcmpeq32	%f2,	%f8,	%g6
	alignaddrl	%i0,	%l3,	%i2
	fmovdneg	%icc,	%f5,	%f5
	fcmped	%fcc0,	%f10,	%f12
	ldsw	[%l7 + 0x0C],	%o7
	alignaddr	%i5,	%l2,	%o3
	movrne	%i1,	%o6,	%l0
	edge32n	%l1,	%g1,	%o4
	stb	%i6,	[%l7 + 0x4E]
	fpsub16s	%f4,	%f2,	%f11
	ldsh	[%l7 + 0x6E],	%o0
	mova	%xcc,	%o1,	%g2
	ldub	[%l7 + 0x5F],	%o2
	sdivx	%l5,	0x0700,	%g4
	movn	%icc,	%i7,	%g3
	mulscc	%o5,	%l4,	%i4
	stx	%i3,	[%l7 + 0x68]
	andn	%g7,	0x1B1F,	%l6
	orncc	%g5,	%i0,	%l3
	fandnot2	%f10,	%f14,	%f6
	edge16	%g6,	%o7,	%i2
	subc	%i5,	0x06D9,	%l2
	sdivx	%i1,	0x0EBD,	%o3
	sdivx	%o6,	0x0141,	%l0
	stx	%l1,	[%l7 + 0x38]
	std	%f10,	[%l7 + 0x68]
	movvs	%xcc,	%o4,	%g1
	fmovsle	%icc,	%f2,	%f11
	edge8n	%o0,	%o1,	%g2
	ldub	[%l7 + 0x7C],	%i6
	sdivx	%l5,	0x1BDB,	%g4
	ld	[%l7 + 0x3C],	%f3
	and	%i7,	0x074A,	%o2
	edge32l	%o5,	%l4,	%i4
	udivx	%i3,	0x16A5,	%g3
	orn	%l6,	%g7,	%g5
	sub	%i0,	%g6,	%o7
	subc	%l3,	%i5,	%i2
	edge8	%i1,	%o3,	%l2
	fnors	%f5,	%f13,	%f7
	stx	%o6,	[%l7 + 0x78]
	andn	%l0,	0x0E79,	%l1
	lduw	[%l7 + 0x1C],	%o4
	sth	%g1,	[%l7 + 0x36]
	andncc	%o0,	%g2,	%o1
	ldsb	[%l7 + 0x6B],	%l5
	movre	%i6,	0x007,	%i7
	addcc	%o2,	%o5,	%g4
	ldub	[%l7 + 0x58],	%l4
	movvc	%xcc,	%i4,	%g3
	edge8	%i3,	%l6,	%g5
	addcc	%i0,	0x0ACD,	%g7
	edge32ln	%g6,	%l3,	%o7
	edge32n	%i5,	%i2,	%i1
	move	%xcc,	%o3,	%o6
	mulx	%l0,	%l1,	%o4
	lduh	[%l7 + 0x72],	%g1
	sub	%o0,	0x0F65,	%g2
	sll	%o1,	%l2,	%l5
	movneg	%xcc,	%i7,	%i6
	fmovscs	%xcc,	%f6,	%f3
	fcmpd	%fcc2,	%f0,	%f12
	alignaddr	%o2,	%o5,	%l4
	umulcc	%g4,	0x13D5,	%g3
	fmovrdgz	%i3,	%f4,	%f8
	ldd	[%l7 + 0x08],	%f10
	andn	%i4,	%g5,	%l6
	sub	%i0,	%g7,	%g6
	lduw	[%l7 + 0x2C],	%l3
	array8	%o7,	%i5,	%i2
	movcs	%icc,	%o3,	%o6
	add	%i1,	0x1186,	%l0
	stb	%o4,	[%l7 + 0x3F]
	andn	%g1,	%l1,	%o0
	movcc	%icc,	%g2,	%o1
	edge8n	%l2,	%i7,	%l5
	smul	%o2,	%i6,	%o5
	addccc	%g4,	%g3,	%l4
	edge32l	%i3,	%g5,	%l6
	subc	%i4,	%g7,	%i0
	ldsw	[%l7 + 0x08],	%g6
	udivcc	%l3,	0x1837,	%i5
	fxors	%f1,	%f6,	%f10
	movge	%xcc,	%i2,	%o3
	fandnot1s	%f0,	%f3,	%f13
	stb	%o6,	[%l7 + 0x29]
	lduw	[%l7 + 0x54],	%i1
	fcmple32	%f0,	%f0,	%l0
	edge8l	%o7,	%o4,	%l1
	mova	%icc,	%g1,	%g2
	ldd	[%l7 + 0x48],	%o0
	ldsh	[%l7 + 0x5E],	%l2
	subc	%o1,	%i7,	%o2
	edge16ln	%l5,	%i6,	%o5
	fpack16	%f10,	%f4
	fcmpd	%fcc1,	%f10,	%f8
	edge8l	%g4,	%g3,	%l4
	ldsh	[%l7 + 0x1C],	%g5
	fmovdpos	%xcc,	%f2,	%f2
	ldub	[%l7 + 0x16],	%l6
	fmovrdgez	%i4,	%f0,	%f2
	movgu	%icc,	%i3,	%i0
	mulscc	%g7,	%g6,	%i5
	movrgz	%l3,	%i2,	%o6
	fcmps	%fcc2,	%f14,	%f7
	ldd	[%l7 + 0x60],	%f12
	andn	%i1,	0x1E75,	%l0
	sll	%o7,	%o3,	%o4
	fmovrdgez	%l1,	%f0,	%f12
	addc	%g1,	%o0,	%l2
	movn	%xcc,	%g2,	%o1
	sllx	%o2,	%i7,	%i6
	ldsw	[%l7 + 0x68],	%l5
	ldsh	[%l7 + 0x52],	%o5
	edge16n	%g4,	%g3,	%l4
	stb	%g5,	[%l7 + 0x5A]
	movcs	%icc,	%l6,	%i3
	mulx	%i4,	0x10C6,	%i0
	sll	%g6,	0x15,	%g7
	xorcc	%i5,	0x09FD,	%l3
	alignaddrl	%i2,	%i1,	%o6
	movcc	%icc,	%o7,	%l0
	add	%o4,	0x0328,	%o3
	fnegd	%f6,	%f12
	edge16ln	%l1,	%g1,	%l2
	fnand	%f2,	%f12,	%f12
	movl	%icc,	%o0,	%o1
	xorcc	%g2,	0x19A7,	%i7
	fandnot2s	%f10,	%f10,	%f0
	srlx	%o2,	%l5,	%o5
	edge32n	%g4,	%g3,	%l4
	edge16ln	%i6,	%g5,	%l6
	popc	0x125D,	%i3
	faligndata	%f10,	%f0,	%f0
	addccc	%i4,	0x0D91,	%g6
	edge16	%i0,	%i5,	%g7
	orcc	%l3,	%i2,	%o6
	xorcc	%i1,	%o7,	%l0
	edge8n	%o4,	%o3,	%g1
	mulscc	%l1,	0x185D,	%o0
	udivx	%l2,	0x1183,	%o1
	alignaddr	%g2,	%o2,	%l5
	ldd	[%l7 + 0x58],	%i6
	ldx	[%l7 + 0x30],	%o5
	orncc	%g3,	0x1627,	%l4
	andcc	%i6,	0x08BF,	%g5
	edge16	%g4,	%i3,	%l6
	srl	%g6,	%i4,	%i0
	array32	%i5,	%l3,	%i2
	sdivcc	%g7,	0x07F4,	%o6
	and	%i1,	0x1E89,	%l0
	orncc	%o7,	0x0566,	%o3
	ldsw	[%l7 + 0x34],	%g1
	fmovs	%f8,	%f3
	sub	%o4,	%o0,	%l2
	or	%o1,	0x1FE5,	%g2
	movl	%xcc,	%l1,	%l5
	orcc	%o2,	%o5,	%g3
	fnegd	%f0,	%f14
	ldd	[%l7 + 0x68],	%l4
	movneg	%icc,	%i6,	%i7
	fnands	%f12,	%f12,	%f3
	mulx	%g5,	0x174B,	%g4
	srl	%l6,	%g6,	%i3
	movvc	%xcc,	%i0,	%i4
	fandnot2s	%f6,	%f0,	%f8
	sllx	%i5,	%l3,	%i2
	lduh	[%l7 + 0x58],	%o6
	array8	%g7,	%i1,	%l0
	ldub	[%l7 + 0x60],	%o7
	movcs	%xcc,	%g1,	%o3
	smulcc	%o0,	0x1A2C,	%l2
	fones	%f0
	fmul8ulx16	%f10,	%f4,	%f10
	array8	%o4,	%o1,	%l1
	lduh	[%l7 + 0x2E],	%l5
	orn	%o2,	0x0300,	%g2
	fmovrse	%g3,	%f14,	%f10
	movre	%l4,	0x3BA,	%i6
	movrlez	%o5,	%i7,	%g4
	subccc	%l6,	%g5,	%i3
	for	%f6,	%f0,	%f12
	sdivx	%g6,	0x12A9,	%i0
	edge32n	%i5,	%i4,	%i2
	alignaddr	%l3,	%o6,	%i1
	fcmpne32	%f14,	%f14,	%l0
	edge8l	%g7,	%g1,	%o3
	edge16	%o0,	%l2,	%o7
	restore %o4, 0x0239, %o1
	edge8l	%l5,	%o2,	%g2
	movrgez	%l1,	0x0E2,	%g3
	xorcc	%i6,	%l4,	%i7
	movleu	%icc,	%o5,	%g4
	fmovs	%f15,	%f10
	subcc	%g5,	0x0E81,	%i3
	addcc	%l6,	0x0D4F,	%i0
	movn	%icc,	%g6,	%i5
	movcc	%icc,	%i2,	%i4
	fnot2s	%f14,	%f13
	orn	%o6,	%i1,	%l0
	andn	%l3,	0x1411,	%g7
	alignaddrl	%o3,	%o0,	%g1
	ldsh	[%l7 + 0x70],	%o7
	ld	[%l7 + 0x58],	%f5
	smulcc	%l2,	0x0E1F,	%o1
	mova	%icc,	%l5,	%o4
	edge16	%o2,	%g2,	%g3
	fmovdgu	%icc,	%f3,	%f10
	orcc	%l1,	%i6,	%l4
	movvc	%icc,	%i7,	%g4
	edge8ln	%o5,	%i3,	%l6
	subc	%i0,	%g6,	%g5
	edge16l	%i2,	%i4,	%i5
	edge8n	%i1,	%l0,	%l3
	ld	[%l7 + 0x08],	%f0
	fmovdg	%xcc,	%f12,	%f3
	mulscc	%o6,	0x0C52,	%o3
	edge32ln	%g7,	%o0,	%g1
	fabsd	%f12,	%f6
	std	%f6,	[%l7 + 0x20]
	ldsw	[%l7 + 0x6C],	%o7
	fmovsleu	%icc,	%f9,	%f15
	ld	[%l7 + 0x7C],	%f5
	fxors	%f8,	%f10,	%f0
	movcc	%xcc,	%l2,	%o1
	xorcc	%o4,	0x0052,	%o2
	sdivx	%l5,	0x07F5,	%g3
	ld	[%l7 + 0x5C],	%f4
	fnot1	%f8,	%f6
	sdivcc	%l1,	0x0176,	%g2
	array16	%l4,	%i6,	%g4
	mulx	%i7,	0x1EFF,	%i3
	edge8	%l6,	%o5,	%i0
	movrne	%g6,	%g5,	%i4
	st	%f0,	[%l7 + 0x38]
	fmovrsgez	%i2,	%f11,	%f6
	stx	%i1,	[%l7 + 0x70]
	edge32	%l0,	%l3,	%i5
	movl	%xcc,	%o3,	%o6
	move	%xcc,	%o0,	%g1
	fornot1s	%f1,	%f4,	%f11
	srlx	%g7,	%o7,	%l2
	andncc	%o1,	%o4,	%l5
	subccc	%o2,	%l1,	%g3
	udivcc	%l4,	0x07E8,	%i6
	xorcc	%g2,	0x1404,	%i7
	movre	%i3,	0x34E,	%g4
	movrgz	%o5,	0x34A,	%i0
	andn	%g6,	0x0E8E,	%l6
	orcc	%i4,	0x0841,	%g5
	andn	%i2,	0x1D0E,	%l0
	ldub	[%l7 + 0x29],	%i1
	fornot1	%f2,	%f14,	%f8
	movgu	%xcc,	%l3,	%o3
	fmovrdlez	%o6,	%f6,	%f12
	mova	%xcc,	%i5,	%g1
	orncc	%g7,	0x0757,	%o7
	addccc	%o0,	%o1,	%o4
	movgu	%xcc,	%l5,	%o2
	orcc	%l2,	0x1C67,	%l1
	fnor	%f2,	%f10,	%f12
	movrgez	%l4,	0x3F1,	%g3
	orncc	%g2,	0x1012,	%i6
	edge8	%i3,	%i7,	%o5
	fands	%f2,	%f6,	%f6
	sdiv	%g4,	0x082B,	%i0
	mulx	%g6,	0x0BE7,	%i4
	subccc	%l6,	%i2,	%l0
	movvs	%xcc,	%g5,	%i1
	fmovrslz	%o3,	%f12,	%f9
	fmul8x16al	%f11,	%f8,	%f6
	std	%f14,	[%l7 + 0x58]
	movvs	%icc,	%o6,	%l3
	movvc	%xcc,	%g1,	%i5
	edge32n	%g7,	%o0,	%o1
	movrlez	%o7,	0x0A4,	%o4
	fmovrde	%o2,	%f0,	%f12
	udivx	%l5,	0x1158,	%l1
	movne	%xcc,	%l2,	%l4
	stw	%g2,	[%l7 + 0x34]
	subc	%g3,	0x03DC,	%i6
	edge8	%i3,	%o5,	%g4
	edge32n	%i7,	%i0,	%i4
	edge8ln	%g6,	%i2,	%l0
	edge8n	%l6,	%i1,	%g5
	sll	%o3,	%o6,	%g1
	edge8	%i5,	%g7,	%o0
	udiv	%o1,	0x079E,	%o7
	xnorcc	%o4,	0x09C8,	%l3
	fpack16	%f6,	%f6
	mova	%xcc,	%o2,	%l5
	andcc	%l1,	%l4,	%l2
	sdivcc	%g3,	0x1EE6,	%i6
	fpackfix	%f6,	%f5
	ldsw	[%l7 + 0x10],	%g2
	movvc	%icc,	%i3,	%g4
	array8	%o5,	%i0,	%i7
	umulcc	%i4,	%i2,	%l0
	sth	%g6,	[%l7 + 0x3A]
	addcc	%i1,	%l6,	%g5
	sdivx	%o3,	0x0096,	%o6
	movg	%xcc,	%g1,	%g7
	orncc	%o0,	%o1,	%i5
	lduh	[%l7 + 0x1C],	%o7
	array8	%o4,	%l3,	%o2
	fmovdg	%xcc,	%f13,	%f15
	edge16	%l5,	%l1,	%l4
	sdiv	%l2,	0x1B51,	%i6
	orcc	%g2,	0x00CD,	%g3
	fpadd16s	%f15,	%f11,	%f12
	addcc	%i3,	%o5,	%g4
	addcc	%i0,	0x1FB6,	%i7
	fmovde	%xcc,	%f8,	%f14
	andn	%i4,	%l0,	%g6
	addc	%i2,	%l6,	%g5
	or	%i1,	%o3,	%g1
	fzero	%f0
	mulx	%o6,	0x0A3A,	%g7
	lduw	[%l7 + 0x48],	%o1
	sdivcc	%o0,	0x02D9,	%i5
	edge8	%o4,	%l3,	%o7
	addccc	%l5,	%l1,	%o2
	fmovdg	%xcc,	%f8,	%f1
	movrgez	%l2,	%l4,	%i6
	movpos	%xcc,	%g2,	%i3
	fornot2	%f2,	%f4,	%f14
	orncc	%g3,	%o5,	%g4
	fmovrslez	%i0,	%f8,	%f9
	movge	%xcc,	%i7,	%i4
	fpack32	%f10,	%f8,	%f0
	ld	[%l7 + 0x24],	%f2
	fornot1s	%f13,	%f15,	%f5
	fnot1	%f4,	%f14
	movpos	%xcc,	%g6,	%l0
	move	%xcc,	%i2,	%g5
	udivcc	%i1,	0x0890,	%l6
	ldx	[%l7 + 0x40],	%o3
	mulscc	%g1,	%g7,	%o1
	fandnot2s	%f7,	%f3,	%f5
	st	%f15,	[%l7 + 0x24]
	alignaddrl	%o6,	%o0,	%i5
	fmovscs	%icc,	%f0,	%f2
	subccc	%o4,	%o7,	%l5
	orn	%l3,	%l1,	%o2
	sub	%l4,	0x05C7,	%l2
	srax	%i6,	0x0A,	%i3
	edge8n	%g2,	%g3,	%g4
	movn	%xcc,	%o5,	%i7
	fmovsg	%icc,	%f14,	%f11
	movpos	%xcc,	%i0,	%g6
	fmovd	%f14,	%f12
	xnorcc	%i4,	%l0,	%i2
	sra	%i1,	%g5,	%l6
	srlx	%o3,	%g7,	%o1
	fmovdg	%icc,	%f13,	%f11
	sdivcc	%o6,	0x0CE7,	%o0
	fmovrdlz	%i5,	%f0,	%f2
	edge16l	%g1,	%o7,	%o4
	fxnor	%f4,	%f2,	%f14
	popc	%l5,	%l3
	fands	%f5,	%f7,	%f10
	fmovrdgz	%o2,	%f0,	%f12
	ldsw	[%l7 + 0x18],	%l1
	fmovrde	%l4,	%f0,	%f4
	sll	%i6,	%i3,	%l2
	fmovde	%icc,	%f1,	%f12
	srax	%g3,	0x0D,	%g4
	subccc	%g2,	0x1AEC,	%o5
	movcs	%icc,	%i0,	%i7
	lduw	[%l7 + 0x34],	%i4
	fmuld8ulx16	%f7,	%f8,	%f14
	mova	%icc,	%g6,	%l0
	subccc	%i1,	%g5,	%l6
	andncc	%i2,	%g7,	%o3
	edge32n	%o6,	%o1,	%o0
	edge32l	%i5,	%g1,	%o4
	fmovrslz	%o7,	%f8,	%f12
	array8	%l3,	%l5,	%o2
	lduh	[%l7 + 0x62],	%l4
	stb	%l1,	[%l7 + 0x49]
	edge16	%i3,	%i6,	%l2
	addccc	%g4,	%g3,	%g2
	subc	%o5,	0x1D54,	%i0
	edge32ln	%i7,	%i4,	%l0
	fcmpes	%fcc2,	%f13,	%f1
	array16	%g6,	%i1,	%g5
	movrgz	%l6,	%g7,	%i2
	fornot1	%f4,	%f0,	%f12
	fpadd16	%f14,	%f10,	%f12
	xnor	%o3,	%o6,	%o0
	subc	%i5,	0x02EC,	%g1
	ldsw	[%l7 + 0x18],	%o4
	movge	%icc,	%o1,	%l3
	lduw	[%l7 + 0x14],	%l5
	xorcc	%o7,	%l4,	%o2
	alignaddrl	%l1,	%i6,	%l2
	st	%f11,	[%l7 + 0x5C]
	fmovrslez	%g4,	%f15,	%f5
	edge8	%i3,	%g3,	%o5
	edge8n	%i0,	%g2,	%i7
	edge32l	%i4,	%l0,	%g6
	edge8l	%i1,	%l6,	%g5
	fandnot1	%f0,	%f12,	%f14
	edge8ln	%g7,	%i2,	%o6
	addcc	%o3,	0x0007,	%o0
	andn	%g1,	0x1767,	%i5
	orncc	%o4,	0x1E37,	%o1
	srlx	%l5,	%o7,	%l4
	ldub	[%l7 + 0x5A],	%o2
	movrlez	%l3,	%l1,	%i6
	fmovsgu	%xcc,	%f6,	%f5
	movvc	%xcc,	%l2,	%g4
	movl	%icc,	%i3,	%g3
	restore %i0, %g2, %o5
	fnand	%f14,	%f6,	%f4
	movn	%icc,	%i4,	%l0
	ldd	[%l7 + 0x08],	%f6
	edge8ln	%g6,	%i7,	%i1
	sdivcc	%l6,	0x00C4,	%g5
	andcc	%i2,	%g7,	%o3
	edge8ln	%o6,	%o0,	%g1
	edge8	%o4,	%o1,	%l5
	or	%o7,	%l4,	%i5
	sub	%l3,	%o2,	%i6
	addcc	%l2,	%l1,	%g4
	addc	%i3,	%g3,	%i0
	lduh	[%l7 + 0x68],	%o5
	fcmpne32	%f0,	%f8,	%i4
	fcmpne16	%f2,	%f10,	%g2
	xnorcc	%g6,	0x161B,	%l0
	movrlz	%i1,	%l6,	%g5
	andcc	%i2,	%i7,	%o3
	edge8	%g7,	%o6,	%o0
	ldsw	[%l7 + 0x5C],	%g1
	subcc	%o1,	%o4,	%l5
	fmovrsgz	%l4,	%f3,	%f15
	alignaddr	%o7,	%l3,	%o2
	fpsub16s	%f0,	%f15,	%f14
	udiv	%i6,	0x1DC4,	%i5
	mova	%xcc,	%l2,	%g4
	subcc	%i3,	0x04A4,	%l1
	xnor	%g3,	0x03AA,	%i0
	fmovsn	%icc,	%f11,	%f11
	fmovrdgez	%o5,	%f10,	%f2
	addcc	%g2,	%i4,	%l0
	xor	%i1,	%g6,	%l6
	movcs	%xcc,	%g5,	%i2
	fmovsl	%icc,	%f1,	%f9
	movrne	%o3,	%g7,	%o6
	ldsw	[%l7 + 0x38],	%i7
	edge32ln	%o0,	%o1,	%g1
	addc	%l5,	0x15A3,	%l4
	orn	%o4,	%o7,	%l3
	ldx	[%l7 + 0x48],	%i6
	movcs	%xcc,	%o2,	%i5
	movcc	%xcc,	%l2,	%g4
	smul	%l1,	0x13EA,	%g3
	movrne	%i0,	0x187,	%i3
	subcc	%g2,	%i4,	%l0
	fmovd	%f6,	%f6
	add	%o5,	%i1,	%l6
	addcc	%g5,	%g6,	%o3
	ldsw	[%l7 + 0x50],	%i2
	movneg	%xcc,	%g7,	%o6
	lduh	[%l7 + 0x54],	%i7
	movneg	%xcc,	%o1,	%g1
	popc	%l5,	%l4
	fcmpeq32	%f12,	%f6,	%o4
	mova	%icc,	%o7,	%o0
	std	%f6,	[%l7 + 0x50]
	alignaddr	%i6,	%o2,	%l3
	movrgz	%l2,	0x003,	%g4
	movvc	%xcc,	%i5,	%g3
	movrgz	%i0,	0x021,	%l1
	lduh	[%l7 + 0x2C],	%g2
	movge	%icc,	%i3,	%l0
	xnor	%o5,	0x196E,	%i1
	fmovdpos	%icc,	%f10,	%f5
	std	%f14,	[%l7 + 0x18]
	fmovrsgz	%l6,	%f8,	%f15
	fornot1	%f10,	%f14,	%f0
	restore %i4, %g6, %o3
	movle	%xcc,	%g5,	%g7
	restore %o6, 0x089C, %i2
	addccc	%i7,	%g1,	%o1
	ldsb	[%l7 + 0x30],	%l4
	movl	%xcc,	%o4,	%l5
	fors	%f9,	%f0,	%f12
	movvs	%icc,	%o7,	%i6
	movg	%icc,	%o2,	%o0
	edge16n	%l2,	%g4,	%l3
	smulcc	%i5,	0x0652,	%i0
	movcc	%icc,	%g3,	%g2
	ldx	[%l7 + 0x10],	%l1
	fmovsa	%icc,	%f4,	%f14
	movcs	%xcc,	%i3,	%l0
	fmul8sux16	%f10,	%f8,	%f12
	movrne	%o5,	0x19E,	%l6
	fmovrdne	%i4,	%f14,	%f12
	movvc	%xcc,	%i1,	%g6
	edge32ln	%o3,	%g5,	%o6
	sethi	0x002F,	%i2
	fexpand	%f1,	%f12
	fmul8ulx16	%f12,	%f4,	%f12
	fmovdvs	%icc,	%f1,	%f10
	movvs	%icc,	%g7,	%g1
	movneg	%icc,	%i7,	%o1
	or	%l4,	%l5,	%o4
	xnor	%o7,	0x113E,	%i6
	fmovdl	%icc,	%f2,	%f8
	sllx	%o2,	0x01,	%o0
	array8	%l2,	%g4,	%i5
	fsrc1	%f10,	%f8
	smulcc	%i0,	0x115F,	%l3
	fzeros	%f11
	popc	%g3,	%g2
	movrlez	%l1,	%i3,	%l0
	and	%o5,	%l6,	%i1
	fnors	%f13,	%f13,	%f13
	fxnor	%f14,	%f10,	%f14
	ldub	[%l7 + 0x13],	%i4
	andncc	%o3,	%g6,	%g5
	ldx	[%l7 + 0x28],	%o6
	st	%f10,	[%l7 + 0x78]
	movle	%icc,	%i2,	%g7
	ldsb	[%l7 + 0x2B],	%g1
	fnands	%f13,	%f8,	%f10
	addccc	%o1,	0x04FF,	%i7
	edge32n	%l5,	%o4,	%l4
	and	%i6,	%o7,	%o0
	stb	%l2,	[%l7 + 0x29]
	xorcc	%o2,	0x1937,	%i5
	fpackfix	%f2,	%f2
	ldd	[%l7 + 0x08],	%i0
	sra	%l3,	%g4,	%g2
	addc	%l1,	0x0000,	%i3
	subc	%l0,	%g3,	%o5
	stx	%i1,	[%l7 + 0x08]
	fmovdleu	%icc,	%f13,	%f6
	edge16n	%i4,	%o3,	%g6
	srax	%l6,	%g5,	%o6
	subc	%i2,	0x0F81,	%g7
	sdivx	%g1,	0x02A7,	%i7
	smulcc	%o1,	0x191A,	%l5
	move	%xcc,	%l4,	%o4
	xor	%i6,	%o7,	%o0
	movre	%o2,	0x343,	%i5
	fones	%f5
	sdivx	%l2,	0x01DB,	%i0
	movg	%xcc,	%g4,	%l3
	orn	%g2,	%i3,	%l0
	udivcc	%g3,	0x0182,	%o5
	mova	%xcc,	%i1,	%i4
	fmovrsgez	%o3,	%f4,	%f4
	fpack16	%f14,	%f0
	lduh	[%l7 + 0x66],	%l1
	fnot1s	%f2,	%f7
	add	%g6,	%g5,	%l6
	movpos	%xcc,	%o6,	%g7
	smul	%g1,	0x1741,	%i2
	fors	%f8,	%f8,	%f8
	movcc	%icc,	%i7,	%l5
	edge8	%o1,	%l4,	%i6
	sdivx	%o4,	0x05D3,	%o7
	mulscc	%o2,	0x03C3,	%o0
	movgu	%xcc,	%l2,	%i5
	movle	%xcc,	%i0,	%l3
	sll	%g4,	0x11,	%g2
	andncc	%l0,	%g3,	%i3
	fpsub16	%f10,	%f8,	%f6
	ldub	[%l7 + 0x0C],	%i1
	fmovsle	%xcc,	%f0,	%f5
	orcc	%o5,	0x1561,	%o3
	edge8n	%i4,	%l1,	%g5
	fpack16	%f8,	%f4
	or	%g6,	0x0BD3,	%o6
	edge8ln	%g7,	%l6,	%i2
	mulscc	%g1,	%i7,	%o1
	movcc	%xcc,	%l4,	%i6
	move	%icc,	%o4,	%l5
	ldd	[%l7 + 0x78],	%o6
	popc	0x10FC,	%o0
	movre	%l2,	%i5,	%i0
	movrlez	%l3,	0x179,	%g4
	umul	%g2,	%l0,	%o2
	edge16	%i3,	%i1,	%g3
	xor	%o5,	0x07AE,	%o3
	fpsub32	%f12,	%f10,	%f2
	subc	%i4,	0x08A8,	%g5
	movre	%g6,	%l1,	%g7
	stb	%o6,	[%l7 + 0x2E]
	movle	%icc,	%i2,	%g1
	mulscc	%l6,	0x011E,	%o1
	andncc	%l4,	%i7,	%i6
	ldx	[%l7 + 0x08],	%o4
	fmovd	%f14,	%f10
	udivx	%l5,	0x0A94,	%o0
	srax	%l2,	0x13,	%o7
	movleu	%xcc,	%i0,	%l3
	move	%xcc,	%g4,	%g2
	srax	%l0,	%i5,	%o2
	sethi	0x13EC,	%i1
	subccc	%i3,	0x1AC2,	%g3
	ldx	[%l7 + 0x48],	%o3
	edge16n	%i4,	%o5,	%g5
	edge16l	%l1,	%g6,	%g7
	mulx	%i2,	0x0215,	%g1
	array32	%o6,	%o1,	%l6
	orcc	%i7,	0x06C7,	%i6
	sdivcc	%l4,	0x0083,	%o4
	ldx	[%l7 + 0x38],	%l5
	movneg	%icc,	%l2,	%o0
	or	%i0,	0x030D,	%l3
	xor	%o7,	0x1DD9,	%g2
	fzeros	%f13
	edge8l	%l0,	%i5,	%g4
	movgu	%icc,	%o2,	%i3
	movcs	%xcc,	%i1,	%g3
	fmovrsgz	%i4,	%f1,	%f9
	edge8	%o3,	%o5,	%g5
	orn	%g6,	%l1,	%i2
	movgu	%icc,	%g1,	%o6
	popc	%o1,	%g7
	ldub	[%l7 + 0x3A],	%i7
	movn	%xcc,	%l6,	%l4
	xor	%o4,	%i6,	%l5
	xorcc	%o0,	0x13A8,	%l2
	or	%l3,	%i0,	%g2
	ld	[%l7 + 0x68],	%f2
	xnor	%o7,	0x0836,	%l0
	srl	%i5,	0x0A,	%o2
	movrlez	%g4,	%i3,	%i1
	movleu	%icc,	%g3,	%i4
	fandnot2s	%f15,	%f5,	%f15
	udiv	%o5,	0x1878,	%o3
	sethi	0x1267,	%g5
	movleu	%xcc,	%g6,	%i2
	movgu	%icc,	%g1,	%l1
	movleu	%icc,	%o1,	%o6
	mulx	%i7,	0x0EFD,	%l6
	fandnot1	%f12,	%f4,	%f10
	addcc	%l4,	0x19B2,	%g7
	andn	%i6,	%l5,	%o4
	lduh	[%l7 + 0x7A],	%l2
	movle	%icc,	%o0,	%i0
	edge8	%g2,	%o7,	%l0
	fmovdle	%icc,	%f12,	%f3
	sllx	%l3,	0x1A,	%o2
	umul	%i5,	0x0B32,	%i3
	movrgz	%g4,	0x241,	%i1
	xnorcc	%g3,	%o5,	%o3
	orn	%i4,	%g5,	%g6
	movgu	%xcc,	%g1,	%i2
	subcc	%l1,	%o1,	%i7
	sth	%o6,	[%l7 + 0x10]
	movcs	%icc,	%l4,	%l6
	fnot2	%f12,	%f6
	edge16	%i6,	%g7,	%o4
	movpos	%xcc,	%l5,	%l2
	pdist	%f0,	%f2,	%f12
	srax	%i0,	0x01,	%g2
	edge16n	%o7,	%o0,	%l0
	alignaddrl	%l3,	%o2,	%i5
	sdivcc	%g4,	0x09C2,	%i3
	fmovdneg	%xcc,	%f14,	%f15
	sth	%g3,	[%l7 + 0x28]
	edge16ln	%o5,	%o3,	%i4
	ldsw	[%l7 + 0x28],	%g5
	movleu	%icc,	%g6,	%i1
	xnorcc	%g1,	0x122C,	%l1
	ldd	[%l7 + 0x58],	%o0
	movn	%xcc,	%i7,	%i2
	fmovrslez	%o6,	%f7,	%f13
	subccc	%l4,	%i6,	%l6
	fmovsle	%icc,	%f6,	%f5
	add	%g7,	0x18F6,	%l5
	subc	%o4,	0x023A,	%l2
	stw	%g2,	[%l7 + 0x4C]
	std	%f4,	[%l7 + 0x78]
	ld	[%l7 + 0x70],	%f2
	add	%o7,	0x0704,	%o0
	fmuld8ulx16	%f8,	%f14,	%f4
	fors	%f14,	%f3,	%f1
	edge32ln	%i0,	%l0,	%l3
	st	%f11,	[%l7 + 0x74]
	udivcc	%i5,	0x158F,	%o2
	movne	%xcc,	%i3,	%g4
	fmovrsne	%g3,	%f6,	%f6
	fmovrsgz	%o3,	%f12,	%f0
	fmovrdlez	%o5,	%f2,	%f14
	std	%f10,	[%l7 + 0x30]
	edge8n	%g5,	%g6,	%i1
	ldsw	[%l7 + 0x38],	%g1
	udiv	%i4,	0x0F37,	%l1
	std	%f14,	[%l7 + 0x08]
	fnot2s	%f1,	%f3
	umul	%o1,	0x02E3,	%i7
	ld	[%l7 + 0x58],	%f0
	fnot2	%f8,	%f4
	fmovsgu	%icc,	%f4,	%f6
	move	%icc,	%o6,	%i2
	movrgez	%i6,	%l4,	%l6
	movl	%xcc,	%g7,	%l5
	movcc	%xcc,	%o4,	%g2
	st	%f14,	[%l7 + 0x48]
	movleu	%xcc,	%o7,	%l2
	fmovdne	%xcc,	%f5,	%f4
	xorcc	%o0,	%l0,	%i0
	srlx	%i5,	%l3,	%o2
	xorcc	%i3,	0x1B15,	%g4
	ldsh	[%l7 + 0x6A],	%g3
	sth	%o5,	[%l7 + 0x5C]
	fand	%f14,	%f14,	%f0
	andcc	%o3,	0x0B32,	%g6
	sll	%i1,	%g1,	%i4
	sra	%g5,	0x0F,	%o1
	edge32n	%i7,	%o6,	%i2
	edge32ln	%i6,	%l4,	%l6
	subcc	%l1,	0x0C7B,	%g7
	movrgz	%l5,	0x01C,	%o4
	movvc	%xcc,	%g2,	%l2
	sdiv	%o7,	0x1690,	%l0
	orn	%i0,	0x1AD6,	%o0
	andcc	%l3,	%o2,	%i5
	ldsw	[%l7 + 0x4C],	%i3
	fmovdcs	%xcc,	%f11,	%f6
	fmovdleu	%xcc,	%f1,	%f12
	alignaddrl	%g3,	%g4,	%o5
	movrlz	%g6,	0x149,	%i1
	xnor	%g1,	0x02A1,	%i4
	edge16ln	%o3,	%o1,	%g5
	ld	[%l7 + 0x58],	%f6
	movne	%xcc,	%i7,	%i2
	fmovdne	%xcc,	%f11,	%f5
	fpsub32s	%f4,	%f3,	%f14
	fcmpeq16	%f0,	%f8,	%i6
	movle	%icc,	%o6,	%l4
	fmuld8sux16	%f0,	%f15,	%f12
	fmovrdlz	%l6,	%f10,	%f0
	sdivx	%l1,	0x1FD3,	%g7
	fmovsn	%xcc,	%f4,	%f6
	save %l5, 0x02EA, %o4
	sllx	%l2,	%g2,	%l0
	andcc	%i0,	%o7,	%l3
	movvs	%xcc,	%o2,	%o0
	movge	%icc,	%i5,	%i3
	mova	%xcc,	%g4,	%g3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type f   	: 2156
!	Type i   	: 6389
!	Type l   	: 1455
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x05825764
.word 0xD4E4E298
.word 0xB28B7212
.word 0x335D0DF6
.word 0xB0C1A929
.word 0x12BA67B3
.word 0xD981C2A5
.word 0x2C9A147C
.word 0x57A89400
.word 0xDDE06410
.word 0xDEBDC895
.word 0x8CC064AE
.word 0xF57C1080
.word 0x153D0AF4
.word 0x68E27746
.word 0x7012DF61
.word 0xE9470C3E
.word 0xC485CEBE
.word 0xEDF2F81E
.word 0x7A6D866C
.word 0x80B6839F
.word 0x9BFD48B7
.word 0x0BAFE856
.word 0x61FDAEC5
.word 0x6E511856
.word 0x1BF0B9F4
.word 0x0BFF0019
.word 0x5584089B
.word 0x9AAF25D9
.word 0x637D2CD1
.word 0x52F5C991
.word 0xFD2E8B5F
.word 0x91BAF8BD
.word 0x5DCA01ED
.word 0xDD8689E9
.word 0x4B948027
.word 0xFD0EBEF8
.word 0x83E7E0B1
.word 0x27759977
.word 0xE3F1ED25
.word 0xC18D1EC2
.word 0x18D0EC88
.word 0xB05076DE
.word 0xD61A47CB
.word 0x004ED04A
.word 0x5C9E9070
.word 0xF1060F1D
.word 0xF9DB073C
.word 0x3878E46C
.word 0xCFF6EAFD
.word 0x49628842
.word 0x751A2392
.word 0x6091EFF8
.word 0x0DAB22DB
.word 0x3DF4B03D
.word 0x6B92281D
.word 0x08BB9938
.word 0xB298DE0D
.word 0x265DBB8B
.word 0x8015DC58
.word 0x747014A2
.word 0x269B6AF6
.word 0x2122CB60
.word 0x7E04FFE6
.end
