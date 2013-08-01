/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_saverestore_fc0.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ./spc_basic_isa3.pl FOCUS_SEED=249502435"
.ident "BY rg131678 ON Wed Aug  6 18:02:48 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_saverestore_fc0.s,v 1.3 2007/07/05 22:01:50 drp Exp $"
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
	set	0x4,	%g2
	set	0x1,	%g3
	set	0xC,	%g4
	set	0x0,	%g5
	set	0x3,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0xF,	%i1
	set	-0xF,	%i2
	set	-0x1,	%i3
	set	-0x0,	%i4
	set	-0x1,	%i5
	set	-0x3,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x4D49EDCD,	%l0
	set	0x287D7378,	%l1
	set	0x51B74048,	%l2
	set	0x1D75572F,	%l3
	set	0x10335445,	%l4
	set	0x45675E45,	%l5
	set	0x45D96BD9,	%l6
	!# Output registers
	set	-0x170D,	%o0
	set	-0x02C3,	%o1
	set	0x0CD4,	%o2
	set	-0x01FD,	%o3
	set	0x0905,	%o4
	set	0x117A,	%o5
	set	-0x0920,	%o6
	set	0x0A1A,	%o7

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

	movvs	%icc,	%o5,	%i7
	lduw	[%l7 + 0x20],	%l3
	fsrc1s	%f12,	%f2
	fmovdvs	%icc,	%f2,	%f4
	edge16n	%g3,	%i6,	%o3
	edge32n	%l5,	%i5,	%l0
	xnor	%g6,	%i0,	%o4
	mova	%icc,	%l1,	%g4
	array32	%o6,	%o0,	%i3
	edge32ln	%o2,	%o7,	%l6
	fabss	%f3,	%f6
	ldsh	[%l7 + 0x5E],	%g1
	orn	%g5,	0x01E1,	%l2
	edge8	%i1,	%i4,	%g7
	array16	%g2,	%i2,	%o1
	fnands	%f11,	%f0,	%f9
	edge8	%l4,	%i7,	%l3
	udivcc	%g3,	0x1ACF,	%i6
	subccc	%o3,	0x044C,	%o5
	sdivcc	%l5,	0x031A,	%i5
	edge32n	%g6,	%l0,	%o4
	edge32	%l1,	%i0,	%o6
	edge16	%o0,	%g4,	%i3
	edge8l	%o2,	%l6,	%o7
	udivcc	%g1,	0x0805,	%l2
	fmovdle	%xcc,	%f11,	%f15
	ldsb	[%l7 + 0x39],	%i1
	fornot2	%f2,	%f8,	%f14
	fmovrde	%i4,	%f6,	%f0
	movrgz	%g5,	%g7,	%i2
	movcc	%xcc,	%g2,	%o1
	fnegd	%f6,	%f8
	sllx	%l4,	0x14,	%i7
	fmovrslz	%l3,	%f3,	%f14
	movl	%icc,	%g3,	%o3
	orncc	%i6,	%o5,	%l5
	subccc	%i5,	%g6,	%o4
	andcc	%l1,	0x0DC7,	%l0
	movrne	%i0,	0x24C,	%o6
	array32	%g4,	%o0,	%o2
	xnor	%i3,	%l6,	%o7
	lduh	[%l7 + 0x52],	%g1
	srl	%l2,	0x08,	%i1
	add	%i4,	%g7,	%g5
	sub	%i2,	%o1,	%g2
	edge8l	%i7,	%l3,	%g3
	ld	[%l7 + 0x40],	%f10
	movge	%icc,	%l4,	%o3
	umul	%i6,	%o5,	%l5
	edge32l	%g6,	%i5,	%l1
	alignaddr	%l0,	%i0,	%o4
	edge16n	%g4,	%o6,	%o2
	edge16l	%i3,	%l6,	%o7
	addccc	%g1,	%l2,	%o0
	udivcc	%i4,	0x152E,	%g7
	edge32n	%i1,	%i2,	%g5
	srlx	%o1,	%g2,	%l3
	edge32	%i7,	%g3,	%o3
	movvs	%icc,	%l4,	%i6
	mova	%icc,	%l5,	%o5
	stb	%g6,	[%l7 + 0x72]
	addcc	%l1,	0x06EC,	%l0
	fmul8ulx16	%f4,	%f10,	%f6
	save %i5, %o4, %i0
	fnot2s	%f13,	%f7
	udivcc	%g4,	0x19E7,	%o2
	udivcc	%i3,	0x0D69,	%o6
	ldub	[%l7 + 0x6B],	%l6
	udivx	%g1,	0x154C,	%o7
	movrlez	%l2,	%i4,	%g7
	ldd	[%l7 + 0x40],	%f12
	alignaddr	%i1,	%i2,	%g5
	movgu	%icc,	%o1,	%g2
	st	%f14,	[%l7 + 0x34]
	fcmpne32	%f10,	%f0,	%o0
	alignaddrl	%i7,	%l3,	%g3
	std	%f0,	[%l7 + 0x30]
	edge8l	%l4,	%i6,	%l5
	movvs	%xcc,	%o3,	%o5
	st	%f11,	[%l7 + 0x48]
	popc	0x020F,	%g6
	fmovdgu	%xcc,	%f5,	%f13
	fxor	%f8,	%f2,	%f12
	smul	%l1,	0x069B,	%l0
	st	%f6,	[%l7 + 0x54]
	ldsw	[%l7 + 0x30],	%i5
	add	%o4,	0x15EF,	%i0
	and	%g4,	%o2,	%o6
	xnor	%l6,	%i3,	%g1
	fpsub16s	%f14,	%f1,	%f8
	fmovrsgz	%l2,	%f4,	%f15
	udivx	%i4,	0x0E7F,	%g7
	udiv	%i1,	0x0C54,	%o7
	movrgez	%g5,	0x389,	%o1
	fmovsleu	%icc,	%f6,	%f4
	edge32	%g2,	%o0,	%i2
	mulx	%i7,	%l3,	%g3
	fmovdn	%icc,	%f10,	%f1
	edge32l	%l4,	%i6,	%l5
	sll	%o5,	%g6,	%o3
	sth	%l0,	[%l7 + 0x74]
	smulcc	%l1,	%i5,	%i0
	sub	%g4,	0x086D,	%o2
	movge	%xcc,	%o4,	%l6
	fmovdleu	%icc,	%f9,	%f10
	movcs	%icc,	%i3,	%g1
	fands	%f3,	%f10,	%f9
	orncc	%l2,	0x1040,	%o6
	sdiv	%i4,	0x05C7,	%g7
	or	%o7,	%i1,	%g5
	edge8l	%g2,	%o0,	%i2
	fors	%f3,	%f7,	%f10
	sra	%i7,	%l3,	%g3
	movne	%xcc,	%o1,	%i6
	orcc	%l5,	0x1179,	%l4
	movn	%icc,	%o5,	%g6
	fmovdle	%icc,	%f1,	%f0
	movrlz	%l0,	%o3,	%i5
	movne	%xcc,	%l1,	%i0
	st	%f1,	[%l7 + 0x50]
	array8	%o2,	%g4,	%o4
	fmovscc	%xcc,	%f13,	%f1
	fmovsleu	%xcc,	%f5,	%f5
	ldsh	[%l7 + 0x4C],	%l6
	array32	%i3,	%g1,	%o6
	movg	%icc,	%i4,	%g7
	fmovdvc	%xcc,	%f9,	%f0
	sub	%l2,	%o7,	%g5
	fmovs	%f6,	%f13
	for	%f14,	%f0,	%f4
	udivcc	%g2,	0x0713,	%o0
	addcc	%i1,	%i2,	%l3
	or	%i7,	0x039C,	%o1
	udiv	%g3,	0x10D2,	%i6
	add	%l5,	%l4,	%g6
	stb	%l0,	[%l7 + 0x40]
	ldsw	[%l7 + 0x50],	%o3
	andcc	%o5,	%l1,	%i0
	movne	%xcc,	%o2,	%g4
	fmovsgu	%xcc,	%f3,	%f3
	fmovdcs	%xcc,	%f8,	%f1
	movg	%xcc,	%i5,	%l6
	siam	0x3
	movvs	%xcc,	%i3,	%o4
	movne	%xcc,	%o6,	%g1
	edge16	%i4,	%l2,	%g7
	edge32l	%o7,	%g5,	%g2
	sra	%o0,	0x1A,	%i2
	array8	%i1,	%i7,	%o1
	fones	%f6
	ldd	[%l7 + 0x68],	%f4
	mulx	%g3,	%i6,	%l3
	st	%f15,	[%l7 + 0x10]
	sra	%l5,	0x17,	%l4
	sdivcc	%l0,	0x11F5,	%o3
	stb	%g6,	[%l7 + 0x5E]
	std	%f2,	[%l7 + 0x40]
	movleu	%xcc,	%l1,	%i0
	sllx	%o5,	0x1F,	%o2
	fmul8x16	%f1,	%f8,	%f14
	movrne	%g4,	%l6,	%i5
	fnot2	%f8,	%f6
	edge32l	%o4,	%i3,	%g1
	movvc	%xcc,	%o6,	%l2
	movge	%icc,	%g7,	%o7
	mulx	%g5,	%g2,	%o0
	fnot1	%f4,	%f2
	fcmped	%fcc2,	%f4,	%f12
	fnot2s	%f12,	%f15
	mova	%icc,	%i4,	%i1
	fands	%f10,	%f15,	%f15
	fmovrde	%i7,	%f0,	%f4
	fnor	%f12,	%f2,	%f0
	movle	%icc,	%o1,	%i2
	fsrc1s	%f9,	%f13
	srax	%g3,	%l3,	%l5
	sll	%i6,	%l0,	%l4
	movvs	%xcc,	%o3,	%g6
	lduw	[%l7 + 0x08],	%l1
	addcc	%o5,	%o2,	%g4
	fmul8sux16	%f6,	%f8,	%f10
	edge32l	%l6,	%i5,	%o4
	ldsh	[%l7 + 0x2C],	%i3
	addccc	%g1,	%i0,	%l2
	ldd	[%l7 + 0x08],	%o6
	orncc	%o7,	0x17F0,	%g7
	stb	%g5,	[%l7 + 0x45]
	fmul8x16	%f13,	%f2,	%f12
	movge	%xcc,	%g2,	%i4
	umulcc	%i1,	%i7,	%o0
	fpackfix	%f10,	%f4
	xorcc	%i2,	0x192D,	%o1
	ld	[%l7 + 0x0C],	%f12
	sethi	0x1530,	%g3
	fzeros	%f0
	edge32ln	%l3,	%l5,	%l0
	xorcc	%i6,	0x10EF,	%o3
	movvs	%xcc,	%g6,	%l1
	alignaddrl	%o5,	%o2,	%l4
	movrne	%l6,	%g4,	%i5
	fmul8x16	%f15,	%f0,	%f10
	std	%f2,	[%l7 + 0x48]
	movvs	%icc,	%i3,	%g1
	std	%f6,	[%l7 + 0x28]
	and	%i0,	0x1903,	%o4
	fmovs	%f1,	%f2
	fcmpgt32	%f4,	%f2,	%o6
	edge8ln	%o7,	%l2,	%g7
	std	%f6,	[%l7 + 0x58]
	sllx	%g5,	%i4,	%i1
	movrgez	%g2,	%i7,	%i2
	fmovsgu	%xcc,	%f9,	%f7
	udivx	%o1,	0x08EE,	%g3
	movrgez	%o0,	%l3,	%l5
	alignaddrl	%l0,	%o3,	%i6
	bshuffle	%f0,	%f14,	%f12
	fmovdl	%xcc,	%f8,	%f2
	ldd	[%l7 + 0x60],	%f0
	popc	%l1,	%o5
	movg	%xcc,	%g6,	%o2
	umul	%l4,	%l6,	%g4
	fnegd	%f4,	%f4
	fsrc1s	%f14,	%f10
	fpackfix	%f0,	%f3
	edge32ln	%i5,	%i3,	%g1
	fmovsg	%icc,	%f10,	%f5
	fcmpes	%fcc0,	%f0,	%f5
	andcc	%i0,	0x0DD6,	%o4
	movvs	%icc,	%o6,	%o7
	movcc	%xcc,	%l2,	%g5
	xnorcc	%i4,	0x065E,	%i1
	st	%f14,	[%l7 + 0x34]
	edge32	%g7,	%i7,	%i2
	xorcc	%o1,	0x0CB7,	%g3
	smulcc	%o0,	0x0E4E,	%l3
	fabss	%f8,	%f12
	fmovdvs	%xcc,	%f11,	%f12
	st	%f1,	[%l7 + 0x24]
	edge32n	%l5,	%l0,	%o3
	stb	%i6,	[%l7 + 0x50]
	popc	0x10F2,	%l1
	fmovd	%f8,	%f0
	movrlez	%o5,	%g6,	%g2
	ldd	[%l7 + 0x70],	%f0
	smulcc	%o2,	0x19F4,	%l6
	mulscc	%g4,	0x0813,	%i5
	movrgz	%i3,	%l4,	%g1
	edge32ln	%i0,	%o4,	%o7
	smulcc	%l2,	0x1836,	%o6
	edge32	%g5,	%i1,	%i4
	xnor	%g7,	%i7,	%i2
	sra	%o1,	%g3,	%o0
	edge16ln	%l3,	%l0,	%l5
	sethi	0x14C8,	%i6
	stb	%l1,	[%l7 + 0x42]
	andn	%o5,	0x0189,	%o3
	srax	%g2,	0x0A,	%g6
	sub	%l6,	%o2,	%g4
	movl	%icc,	%i3,	%i5
	umul	%l4,	%g1,	%o4
	sdivx	%i0,	0x1028,	%l2
	edge8n	%o7,	%g5,	%i1
	orn	%i4,	0x1166,	%g7
	srax	%i7,	%o6,	%o1
	sth	%i2,	[%l7 + 0x3C]
	std	%f14,	[%l7 + 0x38]
	srl	%o0,	0x10,	%l3
	mova	%icc,	%l0,	%g3
	umulcc	%l5,	0x11C5,	%l1
	sth	%o5,	[%l7 + 0x28]
	umul	%i6,	0x009A,	%g2
	lduh	[%l7 + 0x6E],	%o3
	subcc	%g6,	0x1A92,	%o2
	lduw	[%l7 + 0x58],	%l6
	movpos	%xcc,	%i3,	%i5
	movvs	%icc,	%g4,	%g1
	stw	%l4,	[%l7 + 0x0C]
	movpos	%xcc,	%i0,	%l2
	movcs	%icc,	%o7,	%g5
	movle	%xcc,	%i1,	%i4
	mova	%xcc,	%g7,	%i7
	ldd	[%l7 + 0x48],	%f6
	fpsub32s	%f15,	%f0,	%f7
	ldd	[%l7 + 0x78],	%f12
	fcmple16	%f14,	%f4,	%o4
	fones	%f13
	sdiv	%o1,	0x18CE,	%o6
	andn	%i2,	0x0B0B,	%l3
	movvs	%icc,	%l0,	%o0
	ldsh	[%l7 + 0x16],	%l5
	fmovsl	%xcc,	%f12,	%f1
	stx	%g3,	[%l7 + 0x58]
	std	%f0,	[%l7 + 0x78]
	edge8ln	%l1,	%i6,	%g2
	edge32l	%o3,	%g6,	%o5
	orn	%o2,	%i3,	%i5
	sllx	%g4,	%g1,	%l6
	xor	%i0,	%l2,	%o7
	edge16l	%g5,	%i1,	%i4
	st	%f5,	[%l7 + 0x18]
	array16	%l4,	%i7,	%o4
	fmul8sux16	%f12,	%f10,	%f8
	edge16ln	%o1,	%g7,	%i2
	xnor	%o6,	%l3,	%o0
	fmovsl	%xcc,	%f4,	%f7
	ldsh	[%l7 + 0x78],	%l5
	fornot2	%f2,	%f12,	%f4
	fmovdcc	%icc,	%f7,	%f12
	udivcc	%l0,	0x1C01,	%g3
	lduw	[%l7 + 0x24],	%l1
	movrlz	%i6,	0x1EE,	%g2
	sdiv	%g6,	0x0E8B,	%o5
	std	%f14,	[%l7 + 0x40]
	popc	%o3,	%o2
	addc	%i5,	0x0FDE,	%g4
	sllx	%i3,	0x1B,	%l6
	mova	%icc,	%g1,	%l2
	srax	%o7,	%i0,	%i1
	addc	%i4,	%g5,	%l4
	edge16ln	%o4,	%o1,	%i7
	edge8ln	%g7,	%o6,	%i2
	ldd	[%l7 + 0x38],	%f6
	save %o0, 0x160F, %l5
	subccc	%l3,	0x0C9C,	%g3
	orn	%l1,	0x1F5C,	%i6
	xorcc	%l0,	0x0F8D,	%g2
	popc	0x0E7A,	%o5
	movle	%icc,	%g6,	%o3
	move	%xcc,	%i5,	%o2
	ld	[%l7 + 0x50],	%f15
	movge	%icc,	%g4,	%i3
	ldsb	[%l7 + 0x7C],	%g1
	addc	%l6,	0x01E7,	%o7
	sub	%l2,	%i1,	%i0
	srax	%i4,	%l4,	%g5
	lduh	[%l7 + 0x7A],	%o1
	udiv	%o4,	0x0249,	%i7
	ldsw	[%l7 + 0x6C],	%g7
	sdivx	%o6,	0x146B,	%o0
	sll	%i2,	0x15,	%l3
	movn	%xcc,	%g3,	%l1
	movl	%icc,	%l5,	%l0
	fcmpne32	%f10,	%f0,	%g2
	subcc	%i6,	%g6,	%o3
	alignaddr	%o5,	%o2,	%i5
	sra	%g4,	%i3,	%g1
	ldsw	[%l7 + 0x08],	%o7
	fxors	%f14,	%f11,	%f14
	fmovsneg	%xcc,	%f8,	%f1
	fzero	%f10
	udiv	%l2,	0x0F29,	%i1
	fone	%f4
	xnorcc	%i0,	0x0837,	%l6
	save %l4, 0x0846, %i4
	st	%f10,	[%l7 + 0x74]
	stw	%g5,	[%l7 + 0x14]
	movne	%icc,	%o4,	%o1
	st	%f14,	[%l7 + 0x28]
	xnorcc	%g7,	0x1C58,	%i7
	orn	%o0,	0x0E46,	%i2
	fmovdg	%xcc,	%f14,	%f6
	edge32	%l3,	%g3,	%o6
	fmovsge	%xcc,	%f8,	%f5
	fornot2	%f0,	%f0,	%f8
	xnor	%l5,	%l1,	%g2
	sub	%l0,	%i6,	%o3
	movne	%icc,	%g6,	%o5
	sll	%o2,	%g4,	%i5
	fsrc1	%f0,	%f4
	sdiv	%g1,	0x153C,	%i3
	movrlz	%l2,	0x0D4,	%i1
	fsrc2s	%f11,	%f6
	sub	%i0,	0x0CE7,	%l6
	std	%f8,	[%l7 + 0x78]
	udiv	%l4,	0x0482,	%i4
	udivcc	%g5,	0x0C77,	%o4
	fmovrdgz	%o7,	%f0,	%f10
	andn	%o1,	%g7,	%o0
	save %i2, %l3, %g3
	fmovdgu	%icc,	%f15,	%f10
	ldsw	[%l7 + 0x2C],	%o6
	siam	0x0
	fmul8x16al	%f7,	%f6,	%f4
	movvs	%xcc,	%i7,	%l5
	fandnot1	%f12,	%f4,	%f2
	fcmple16	%f2,	%f0,	%g2
	fmovrdgez	%l0,	%f6,	%f2
	edge16	%i6,	%l1,	%o3
	fmovsgu	%xcc,	%f9,	%f3
	fmovsne	%xcc,	%f15,	%f2
	sth	%o5,	[%l7 + 0x48]
	fmovdvs	%xcc,	%f9,	%f7
	orncc	%o2,	0x1551,	%g6
	fpadd16s	%f2,	%f5,	%f10
	orncc	%i5,	%g1,	%i3
	restore %l2, %g4, %i0
	sdivcc	%l6,	0x0034,	%i1
	sdivcc	%i4,	0x1587,	%g5
	umulcc	%l4,	%o4,	%o1
	edge8ln	%o7,	%o0,	%i2
	add	%l3,	%g7,	%g3
	save %i7, 0x1300, %l5
	fpadd32	%f10,	%f6,	%f4
	lduh	[%l7 + 0x74],	%g2
	sllx	%l0,	0x09,	%o6
	subc	%i6,	0x1540,	%l1
	fcmpd	%fcc2,	%f2,	%f14
	add	%o3,	%o5,	%g6
	smul	%i5,	%g1,	%i3
	edge32n	%l2,	%o2,	%g4
	addc	%l6,	%i1,	%i0
	movn	%xcc,	%g5,	%i4
	fnot1	%f4,	%f10
	alignaddr	%l4,	%o4,	%o7
	ldsb	[%l7 + 0x63],	%o0
	movrgz	%i2,	%o1,	%l3
	edge8l	%g7,	%i7,	%l5
	fpsub32	%f12,	%f14,	%f6
	smul	%g3,	0x1282,	%l0
	orncc	%g2,	%o6,	%l1
	fxnors	%f12,	%f11,	%f9
	andcc	%o3,	0x160C,	%o5
	movcc	%xcc,	%i6,	%i5
	fnot2	%f14,	%f8
	fnot2	%f8,	%f4
	sethi	0x16C7,	%g6
	edge16ln	%i3,	%l2,	%g1
	stw	%g4,	[%l7 + 0x58]
	ld	[%l7 + 0x08],	%f15
	orn	%o2,	0x1BD1,	%i1
	edge16l	%l6,	%g5,	%i0
	fmovscs	%icc,	%f2,	%f8
	movg	%icc,	%l4,	%i4
	movrgez	%o4,	%o7,	%i2
	edge32ln	%o1,	%l3,	%g7
	movrgez	%o0,	%l5,	%i7
	fexpand	%f5,	%f2
	fmul8ulx16	%f10,	%f2,	%f4
	stw	%l0,	[%l7 + 0x40]
	movrlz	%g3,	%o6,	%g2
	srl	%o3,	%o5,	%l1
	fornot1	%f0,	%f8,	%f10
	edge16l	%i6,	%i5,	%i3
	movcc	%xcc,	%g6,	%g1
	movle	%icc,	%l2,	%o2
	fmovsl	%icc,	%f1,	%f11
	fmovdvs	%xcc,	%f14,	%f7
	mulx	%i1,	0x0301,	%l6
	movl	%icc,	%g4,	%g5
	edge8	%i0,	%l4,	%o4
	movcs	%icc,	%o7,	%i2
	fpack16	%f12,	%f4
	fmovrslez	%i4,	%f8,	%f0
	add	%l3,	%g7,	%o0
	lduh	[%l7 + 0x52],	%o1
	movrlez	%i7,	%l0,	%g3
	addc	%o6,	0x0C65,	%l5
	andn	%o3,	%o5,	%g2
	edge16l	%i6,	%i5,	%i3
	edge32n	%g6,	%l1,	%l2
	edge32	%o2,	%g1,	%l6
	orcc	%i1,	0x01E9,	%g4
	subc	%i0,	%g5,	%l4
	andcc	%o4,	%i2,	%o7
	movle	%xcc,	%i4,	%g7
	ldx	[%l7 + 0x38],	%o0
	fnor	%f14,	%f14,	%f10
	fmovspos	%icc,	%f1,	%f0
	sub	%l3,	%o1,	%i7
	stw	%g3,	[%l7 + 0x30]
	edge8l	%l0,	%l5,	%o3
	add	%o6,	0x0455,	%o5
	movleu	%xcc,	%g2,	%i6
	edge16ln	%i5,	%g6,	%l1
	ldd	[%l7 + 0x60],	%i2
	xnor	%o2,	%l2,	%l6
	array8	%i1,	%g1,	%i0
	fornot2	%f6,	%f2,	%f4
	movne	%icc,	%g5,	%g4
	xor	%o4,	0x00D0,	%l4
	fcmpeq32	%f8,	%f4,	%o7
	orn	%i2,	0x0BA8,	%g7
	fsrc2	%f14,	%f4
	addc	%i4,	0x1EA5,	%l3
	addc	%o0,	%o1,	%i7
	ldd	[%l7 + 0x50],	%l0
	edge16l	%g3,	%l5,	%o6
	fmuld8sux16	%f5,	%f8,	%f2
	std	%f4,	[%l7 + 0x60]
	movrgz	%o5,	%o3,	%i6
	movneg	%xcc,	%g2,	%i5
	fandnot1	%f0,	%f2,	%f12
	orncc	%l1,	0x1AD5,	%g6
	addccc	%o2,	0x0540,	%l2
	subc	%i3,	%l6,	%g1
	ldd	[%l7 + 0x08],	%i0
	fmul8x16al	%f2,	%f5,	%f12
	ldx	[%l7 + 0x68],	%g5
	sdivx	%g4,	0x07E4,	%i1
	andcc	%o4,	%l4,	%i2
	save %o7, 0x1F02, %i4
	array16	%l3,	%g7,	%o1
	edge8l	%o0,	%l0,	%g3
	fexpand	%f3,	%f8
	ldd	[%l7 + 0x68],	%f14
	edge16l	%i7,	%l5,	%o5
	andcc	%o6,	0x0612,	%o3
	fnor	%f12,	%f4,	%f2
	sth	%g2,	[%l7 + 0x68]
	fmovse	%xcc,	%f10,	%f7
	movleu	%xcc,	%i6,	%i5
	fcmple16	%f8,	%f10,	%g6
	addccc	%l1,	%o2,	%i3
	fcmpne16	%f14,	%f14,	%l6
	edge8ln	%l2,	%i0,	%g5
	restore %g4, %i1, %g1
	ld	[%l7 + 0x7C],	%f0
	andncc	%o4,	%i2,	%l4
	sethi	0x1E1A,	%i4
	sllx	%o7,	%g7,	%l3
	sra	%o0,	%o1,	%l0
	fmovdcc	%xcc,	%f14,	%f15
	popc	0x1B36,	%i7
	fornot1	%f10,	%f14,	%f8
	fmovsl	%icc,	%f1,	%f13
	fornot1s	%f0,	%f8,	%f5
	movvc	%xcc,	%l5,	%g3
	smul	%o5,	0x0914,	%o3
	lduh	[%l7 + 0x14],	%o6
	edge32l	%g2,	%i5,	%g6
	sub	%l1,	%o2,	%i6
	xorcc	%l6,	0x1923,	%i3
	ldd	[%l7 + 0x38],	%f6
	sth	%i0,	[%l7 + 0x6A]
	movge	%xcc,	%l2,	%g4
	orcc	%i1,	%g5,	%o4
	fmovdneg	%icc,	%f14,	%f9
	udivx	%i2,	0x158B,	%g1
	ldsw	[%l7 + 0x60],	%i4
	edge8n	%o7,	%g7,	%l3
	sth	%l4,	[%l7 + 0x66]
	stx	%o0,	[%l7 + 0x28]
	sdivcc	%o1,	0x10DD,	%i7
	mova	%xcc,	%l5,	%g3
	fzero	%f10
	sub	%o5,	%o3,	%o6
	edge16n	%g2,	%i5,	%g6
	edge32	%l1,	%o2,	%i6
	sdiv	%l0,	0x0BFF,	%l6
	edge32l	%i3,	%i0,	%l2
	fnot2	%f4,	%f12
	array16	%g4,	%g5,	%o4
	andncc	%i1,	%i2,	%g1
	sdiv	%i4,	0x064F,	%g7
	subccc	%o7,	%l4,	%o0
	array16	%l3,	%i7,	%o1
	edge16l	%l5,	%g3,	%o5
	subc	%o6,	%o3,	%g2
	fmovsleu	%xcc,	%f7,	%f10
	sub	%i5,	0x1125,	%l1
	movpos	%icc,	%g6,	%o2
	stb	%i6,	[%l7 + 0x1B]
	addc	%l6,	0x165B,	%i3
	orn	%l0,	%l2,	%i0
	edge32ln	%g4,	%o4,	%g5
	xnorcc	%i1,	%i2,	%g1
	fmovdge	%icc,	%f1,	%f3
	fornot2s	%f1,	%f9,	%f13
	subcc	%g7,	0x0FCC,	%o7
	pdist	%f8,	%f2,	%f8
	pdist	%f8,	%f14,	%f2
	movg	%icc,	%l4,	%i4
	umulcc	%l3,	0x1FF4,	%o0
	fsrc2	%f8,	%f4
	fsrc2s	%f0,	%f11
	movg	%xcc,	%o1,	%l5
	ldd	[%l7 + 0x58],	%f8
	or	%g3,	%o5,	%i7
	umulcc	%o6,	%g2,	%i5
	std	%f8,	[%l7 + 0x10]
	andncc	%o3,	%l1,	%g6
	edge8	%o2,	%i6,	%i3
	subcc	%l6,	0x1BA0,	%l0
	movgu	%xcc,	%l2,	%i0
	movge	%xcc,	%o4,	%g4
	fmovdpos	%xcc,	%f14,	%f9
	sdivcc	%i1,	0x0AB5,	%g5
	ldd	[%l7 + 0x78],	%g0
	udivx	%g7,	0x168E,	%i2
	stw	%o7,	[%l7 + 0x7C]
	edge16	%i4,	%l3,	%l4
	ldx	[%l7 + 0x10],	%o1
	movle	%icc,	%l5,	%o0
	sdivcc	%o5,	0x1F5C,	%i7
	fmovdgu	%xcc,	%f14,	%f15
	movvs	%icc,	%o6,	%g3
	edge8ln	%g2,	%o3,	%l1
	movrgz	%i5,	%g6,	%o2
	orncc	%i3,	%l6,	%i6
	edge32l	%l2,	%i0,	%l0
	fnand	%f2,	%f4,	%f6
	add	%g4,	0x0F43,	%i1
	edge32ln	%o4,	%g5,	%g7
	mova	%icc,	%g1,	%i2
	andncc	%i4,	%l3,	%o7
	fabss	%f10,	%f11
	addcc	%o1,	%l5,	%o0
	fmovsge	%xcc,	%f6,	%f0
	xor	%o5,	0x19B0,	%l4
	movcs	%xcc,	%o6,	%i7
	umul	%g2,	%o3,	%g3
	fmovda	%xcc,	%f7,	%f13
	movgu	%xcc,	%i5,	%g6
	umul	%l1,	0x0C87,	%o2
	udivcc	%l6,	0x0D83,	%i3
	fpsub16s	%f12,	%f7,	%f8
	pdist	%f2,	%f12,	%f0
	xorcc	%l2,	0x1089,	%i6
	lduw	[%l7 + 0x18],	%l0
	fpadd32	%f12,	%f12,	%f8
	edge16l	%i0,	%g4,	%i1
	edge16l	%o4,	%g7,	%g5
	movneg	%xcc,	%g1,	%i2
	edge32l	%l3,	%o7,	%o1
	movleu	%xcc,	%i4,	%o0
	xor	%o5,	%l4,	%l5
	alignaddrl	%o6,	%i7,	%o3
	edge32n	%g3,	%i5,	%g2
	for	%f12,	%f8,	%f4
	ldsb	[%l7 + 0x1D],	%g6
	edge16ln	%o2,	%l1,	%l6
	sethi	0x0F45,	%i3
	andncc	%i6,	%l0,	%i0
	alignaddrl	%g4,	%i1,	%o4
	lduh	[%l7 + 0x4A],	%g7
	andcc	%l2,	%g1,	%g5
	udivcc	%l3,	0x16E1,	%o7
	save %o1, 0x06DE, %i4
	fnegs	%f6,	%f12
	sdivx	%o0,	0x00B3,	%i2
	fpack16	%f8,	%f12
	movrne	%o5,	0x0E7,	%l5
	srax	%l4,	0x00,	%i7
	movcc	%icc,	%o3,	%o6
	movrlz	%g3,	0x399,	%i5
	edge32l	%g2,	%o2,	%g6
	fornot1s	%f3,	%f14,	%f1
	subcc	%l6,	%i3,	%l1
	andcc	%l0,	%i6,	%i0
	movrgez	%g4,	%i1,	%g7
	subc	%l2,	0x10E9,	%g1
	ldub	[%l7 + 0x0A],	%g5
	subcc	%o4,	%o7,	%o1
	udivx	%i4,	0x14D8,	%l3
	sth	%i2,	[%l7 + 0x6A]
	udivcc	%o5,	0x0D87,	%l5
	sll	%o0,	0x1F,	%i7
	fmovse	%xcc,	%f4,	%f5
	edge32l	%l4,	%o6,	%g3
	stb	%o3,	[%l7 + 0x46]
	siam	0x1
	edge16	%i5,	%g2,	%g6
	edge8ln	%l6,	%i3,	%l1
	edge16	%o2,	%i6,	%l0
	movvc	%icc,	%g4,	%i1
	movgu	%icc,	%i0,	%g7
	mulx	%l2,	0x0DEA,	%g1
	udivcc	%g5,	0x0283,	%o7
	stw	%o4,	[%l7 + 0x1C]
	orcc	%i4,	0x0CB1,	%o1
	fmovse	%xcc,	%f11,	%f3
	movpos	%xcc,	%l3,	%o5
	movgu	%icc,	%i2,	%o0
	fand	%f4,	%f10,	%f10
	srax	%i7,	%l4,	%o6
	sub	%g3,	0x01A3,	%o3
	movpos	%xcc,	%i5,	%l5
	stx	%g6,	[%l7 + 0x08]
	or	%l6,	%i3,	%l1
	movle	%xcc,	%o2,	%i6
	udiv	%g2,	0x13DC,	%g4
	ld	[%l7 + 0x64],	%f5
	array16	%i1,	%i0,	%l0
	fmul8x16au	%f14,	%f3,	%f8
	movge	%icc,	%l2,	%g7
	andcc	%g5,	%g1,	%o4
	fcmpd	%fcc0,	%f10,	%f6
	std	%f2,	[%l7 + 0x08]
	fnands	%f9,	%f12,	%f11
	movcc	%icc,	%o7,	%i4
	movrgz	%o1,	%o5,	%l3
	restore %i2, 0x14EA, %o0
	ld	[%l7 + 0x60],	%f4
	sdiv	%i7,	0x0126,	%l4
	ldub	[%l7 + 0x44],	%g3
	fmovdcc	%icc,	%f1,	%f7
	mova	%xcc,	%o6,	%i5
	movn	%icc,	%l5,	%g6
	lduh	[%l7 + 0x16],	%l6
	alignaddr	%o3,	%l1,	%i3
	fnot1s	%f8,	%f12
	fornot2s	%f1,	%f6,	%f11
	subc	%o2,	%i6,	%g2
	fnot2	%f8,	%f0
	udivx	%g4,	0x1619,	%i1
	fpadd16	%f2,	%f6,	%f2
	ldub	[%l7 + 0x4A],	%i0
	sdivcc	%l2,	0x0DC2,	%g7
	array16	%l0,	%g1,	%g5
	umul	%o4,	0x1BEA,	%o7
	sll	%i4,	%o5,	%l3
	for	%f10,	%f10,	%f12
	fmovrde	%i2,	%f8,	%f10
	fmovsa	%icc,	%f9,	%f5
	array16	%o1,	%i7,	%o0
	movrne	%g3,	0x2C1,	%o6
	udiv	%l4,	0x0EC2,	%i5
	subccc	%g6,	%l5,	%o3
	edge32	%l6,	%i3,	%l1
	fmovsleu	%xcc,	%f10,	%f4
	edge16	%i6,	%g2,	%o2
	smul	%i1,	0x1765,	%i0
	fpack32	%f0,	%f6,	%f0
	fmovde	%icc,	%f0,	%f10
	udivcc	%g4,	0x1733,	%l2
	edge8l	%g7,	%l0,	%g1
	edge16l	%g5,	%o4,	%o7
	srlx	%o5,	%l3,	%i4
	lduh	[%l7 + 0x5A],	%o1
	ldx	[%l7 + 0x60],	%i2
	edge32ln	%o0,	%g3,	%i7
	restore %l4, %o6, %i5
	array8	%l5,	%o3,	%l6
	sth	%i3,	[%l7 + 0x30]
	movgu	%xcc,	%l1,	%g6
	mulx	%i6,	%o2,	%g2
	fandnot1	%f6,	%f8,	%f12
	movrlz	%i1,	0x024,	%i0
	fmovsle	%icc,	%f14,	%f13
	edge32	%l2,	%g4,	%l0
	movrgz	%g1,	%g5,	%g7
	edge32n	%o7,	%o5,	%o4
	fmovrdgez	%l3,	%f2,	%f0
	stw	%o1,	[%l7 + 0x7C]
	edge8n	%i4,	%o0,	%i2
	movrne	%g3,	0x1BD,	%i7
	smul	%o6,	0x1CF4,	%l4
	edge16ln	%i5,	%l5,	%o3
	movvs	%icc,	%l6,	%i3
	fpsub32	%f8,	%f10,	%f8
	stx	%l1,	[%l7 + 0x10]
	add	%g6,	0x1E18,	%o2
	edge8ln	%g2,	%i6,	%i0
	edge32n	%i1,	%l2,	%l0
	srax	%g1,	%g5,	%g7
	movrlz	%g4,	%o5,	%o7
	xorcc	%l3,	%o1,	%i4
	fmul8x16	%f5,	%f0,	%f2
	fmovdl	%icc,	%f1,	%f15
	ldsh	[%l7 + 0x70],	%o4
	addc	%o0,	%i2,	%i7
	fmovsle	%icc,	%f4,	%f5
	fcmped	%fcc0,	%f12,	%f10
	alignaddrl	%o6,	%l4,	%i5
	edge16l	%g3,	%l5,	%l6
	array8	%i3,	%l1,	%g6
	ldsw	[%l7 + 0x4C],	%o2
	andncc	%g2,	%o3,	%i6
	fmovsle	%icc,	%f11,	%f4
	lduw	[%l7 + 0x30],	%i1
	stx	%i0,	[%l7 + 0x40]
	fcmpeq32	%f2,	%f12,	%l0
	ldd	[%l7 + 0x78],	%f0
	ldsw	[%l7 + 0x18],	%g1
	andn	%g5,	0x1FC4,	%l2
	edge32	%g4,	%g7,	%o5
	ldsh	[%l7 + 0x62],	%l3
	movgu	%xcc,	%o1,	%o7
	fnot1s	%f0,	%f13
	fmovs	%f7,	%f2
	ldsw	[%l7 + 0x3C],	%i4
	movgu	%icc,	%o4,	%o0
	movvc	%icc,	%i2,	%o6
	stb	%l4,	[%l7 + 0x26]
	umulcc	%i7,	0x13F2,	%i5
	xnorcc	%l5,	0x16D2,	%l6
	movrgz	%i3,	%g3,	%g6
	fnors	%f11,	%f11,	%f8
	movpos	%xcc,	%l1,	%o2
	or	%g2,	0x1343,	%o3
	movrne	%i6,	%i0,	%i1
	ldd	[%l7 + 0x38],	%f2
	array8	%g1,	%l0,	%l2
	fcmpne32	%f14,	%f10,	%g5
	movvc	%xcc,	%g4,	%o5
	fmovrdgez	%l3,	%f4,	%f0
	restore %g7, 0x052F, %o1
	xorcc	%o7,	0x1555,	%o4
	fors	%f1,	%f9,	%f8
	stb	%o0,	[%l7 + 0x52]
	srlx	%i2,	%i4,	%l4
	movrlez	%i7,	0x310,	%i5
	fmul8x16au	%f5,	%f13,	%f2
	fmovrslz	%o6,	%f1,	%f7
	orncc	%l5,	0x112C,	%i3
	lduw	[%l7 + 0x38],	%l6
	movl	%xcc,	%g6,	%g3
	movvs	%icc,	%l1,	%o2
	fmovdcs	%xcc,	%f11,	%f11
	fnegd	%f2,	%f10
	popc	0x160A,	%o3
	orn	%i6,	%g2,	%i0
	fmovsle	%xcc,	%f6,	%f0
	sub	%i1,	%g1,	%l0
	restore %g5, 0x0E18, %g4
	lduw	[%l7 + 0x08],	%l2
	sllx	%l3,	%o5,	%g7
	ld	[%l7 + 0x64],	%f4
	umulcc	%o1,	0x1665,	%o4
	udivx	%o0,	0x0D8B,	%i2
	edge16n	%o7,	%i4,	%l4
	save %i5, %i7, %l5
	edge32	%i3,	%l6,	%g6
	ldsw	[%l7 + 0x10],	%o6
	movcc	%icc,	%l1,	%g3
	fnot2s	%f8,	%f10
	fpackfix	%f10,	%f13
	xorcc	%o2,	0x0C2B,	%i6
	edge32l	%o3,	%i0,	%g2
	edge8ln	%g1,	%i1,	%l0
	fcmpgt32	%f10,	%f8,	%g4
	fcmpeq32	%f8,	%f10,	%g5
	alignaddr	%l3,	%l2,	%g7
	xor	%o5,	0x12BD,	%o1
	movne	%xcc,	%o4,	%o0
	movcs	%icc,	%o7,	%i4
	udivx	%l4,	0x1A22,	%i2
	ldd	[%l7 + 0x28],	%i4
	subc	%l5,	0x1267,	%i3
	fmovrsgz	%i7,	%f11,	%f7
	popc	%g6,	%o6
	edge32n	%l1,	%l6,	%g3
	edge32l	%o2,	%i6,	%i0
	xor	%g2,	%o3,	%g1
	sth	%l0,	[%l7 + 0x3E]
	array16	%g4,	%g5,	%l3
	popc	0x1281,	%l2
	srlx	%g7,	0x13,	%i1
	fmovs	%f2,	%f5
	st	%f1,	[%l7 + 0x14]
	ldsh	[%l7 + 0x64],	%o1
	sra	%o4,	0x09,	%o0
	srax	%o7,	%i4,	%o5
	sdiv	%i2,	0x0AD0,	%i5
	xorcc	%l5,	0x01F2,	%i3
	movl	%xcc,	%l4,	%i7
	fnegs	%f3,	%f10
	addccc	%g6,	0x0422,	%l1
	alignaddr	%o6,	%g3,	%o2
	xor	%i6,	0x1CDB,	%l6
	addccc	%g2,	%o3,	%i0
	fmovsleu	%icc,	%f15,	%f1
	movl	%xcc,	%g1,	%g4
	mova	%icc,	%l0,	%g5
	sdiv	%l2,	0x17B3,	%g7
	fmovdcc	%icc,	%f4,	%f14
	movle	%icc,	%l3,	%o1
	fpadd32s	%f12,	%f11,	%f6
	movgu	%xcc,	%i1,	%o4
	udivcc	%o7,	0x0F85,	%i4
	sth	%o0,	[%l7 + 0x50]
	srl	%o5,	0x14,	%i5
	edge16n	%l5,	%i3,	%l4
	movn	%icc,	%i7,	%i2
	smulcc	%l1,	0x12B9,	%o6
	fmovrslez	%g3,	%f6,	%f11
	or	%o2,	%g6,	%i6
	fcmple16	%f10,	%f2,	%l6
	xnorcc	%g2,	0x1F2D,	%o3
	save %g1, %i0, %l0
	mulscc	%g5,	%l2,	%g7
	array8	%g4,	%o1,	%i1
	array32	%o4,	%l3,	%i4
	movleu	%icc,	%o0,	%o5
	add	%i5,	%l5,	%o7
	movvc	%icc,	%i3,	%l4
	edge16n	%i2,	%l1,	%i7
	ldx	[%l7 + 0x38],	%o6
	array32	%g3,	%o2,	%g6
	andn	%l6,	0x0333,	%i6
	sethi	0x1EBC,	%o3
	save %g2, 0x145C, %g1
	fmovdvs	%icc,	%f2,	%f1
	addccc	%i0,	0x1E2B,	%g5
	movcs	%icc,	%l0,	%g7
	subcc	%g4,	%o1,	%l2
	fmovse	%xcc,	%f14,	%f10
	edge32n	%i1,	%l3,	%o4
	movn	%icc,	%i4,	%o5
	subcc	%i5,	0x0814,	%o0
	sra	%l5,	0x19,	%i3
	array16	%l4,	%o7,	%i2
	orncc	%l1,	0x0231,	%i7
	movge	%icc,	%g3,	%o2
	stb	%g6,	[%l7 + 0x53]
	stw	%l6,	[%l7 + 0x14]
	fzeros	%f1
	fmovspos	%icc,	%f13,	%f6
	mova	%xcc,	%i6,	%o6
	fcmpes	%fcc2,	%f6,	%f10
	edge16	%o3,	%g2,	%i0
	srax	%g5,	0x0A,	%l0
	movne	%icc,	%g1,	%g7
	edge32l	%o1,	%g4,	%l2
	edge8ln	%i1,	%l3,	%o4
	edge8l	%o5,	%i5,	%i4
	lduh	[%l7 + 0x7E],	%o0
	fmovsgu	%icc,	%f4,	%f14
	or	%l5,	0x0ABD,	%i3
	stx	%l4,	[%l7 + 0x30]
	alignaddr	%i2,	%l1,	%o7
	fcmpgt16	%f4,	%f10,	%g3
	mulscc	%o2,	0x1567,	%g6
	stb	%l6,	[%l7 + 0x74]
	st	%f8,	[%l7 + 0x48]
	edge32ln	%i6,	%i7,	%o6
	alignaddr	%o3,	%i0,	%g2
	edge8l	%l0,	%g5,	%g1
	xor	%o1,	0x1D22,	%g7
	movne	%icc,	%g4,	%i1
	xnorcc	%l2,	%l3,	%o5
	movcc	%xcc,	%o4,	%i5
	orn	%o0,	0x0B7F,	%l5
	array8	%i4,	%i3,	%l4
	fmovsneg	%xcc,	%f5,	%f0
	fmovdvc	%icc,	%f15,	%f7
	stw	%l1,	[%l7 + 0x34]
	orcc	%i2,	%o7,	%g3
	udiv	%g6,	0x1DDE,	%l6
	movne	%icc,	%o2,	%i6
	movn	%icc,	%o6,	%i7
	mulx	%i0,	%g2,	%o3
	subccc	%g5,	%g1,	%l0
	edge8l	%o1,	%g4,	%g7
	xorcc	%l2,	0x0C3C,	%l3
	fmovsa	%xcc,	%f5,	%f14
	edge8l	%i1,	%o5,	%i5
	sth	%o0,	[%l7 + 0x38]
	fcmps	%fcc1,	%f11,	%f9
	addcc	%o4,	%l5,	%i4
	addcc	%l4,	0x1B79,	%i3
	andn	%l1,	0x09AE,	%i2
	movcs	%xcc,	%g3,	%o7
	subccc	%l6,	%g6,	%i6
	edge8ln	%o2,	%i7,	%i0
	fmovda	%xcc,	%f15,	%f3
	add	%g2,	%o3,	%o6
	save %g5, %g1, %o1
	fmovsleu	%xcc,	%f7,	%f13
	movrgez	%g4,	0x2BC,	%l0
	fnors	%f4,	%f2,	%f8
	restore %g7, %l3, %i1
	mulscc	%l2,	0x0BA3,	%o5
	restore %i5, %o0, %l5
	xnorcc	%i4,	0x088A,	%o4
	ld	[%l7 + 0x64],	%f3
	movrlz	%i3,	%l1,	%i2
	fmovrslz	%l4,	%f1,	%f7
	edge8l	%o7,	%l6,	%g3
	movcs	%xcc,	%g6,	%o2
	xorcc	%i6,	0x05BA,	%i0
	fmovdcc	%icc,	%f10,	%f14
	andcc	%g2,	%o3,	%o6
	popc	%i7,	%g1
	srax	%o1,	%g5,	%l0
	ldub	[%l7 + 0x62],	%g4
	movle	%xcc,	%g7,	%l3
	movrne	%l2,	0x2F0,	%i1
	fcmpd	%fcc0,	%f6,	%f6
	and	%o5,	0x01C9,	%o0
	popc	0x1E45,	%i5
	add	%l5,	0x1EC0,	%o4
	mova	%icc,	%i3,	%l1
	sth	%i2,	[%l7 + 0x16]
	alignaddrl	%l4,	%o7,	%l6
	add	%g3,	0x005A,	%g6
	fsrc1s	%f9,	%f0
	fandnot1s	%f8,	%f1,	%f2
	addc	%o2,	0x1F6A,	%i6
	umul	%i0,	0x0C59,	%g2
	sllx	%i4,	%o6,	%o3
	fcmpgt32	%f12,	%f10,	%g1
	popc	0x0169,	%o1
	sethi	0x19C1,	%i7
	movvc	%xcc,	%g5,	%l0
	edge8	%g7,	%l3,	%g4
	sdivx	%i1,	0x1B14,	%o5
	fmuld8sux16	%f3,	%f7,	%f6
	orncc	%l2,	%i5,	%l5
	fxors	%f9,	%f11,	%f2
	fmovsle	%xcc,	%f1,	%f3
	movre	%o0,	%i3,	%l1
	move	%xcc,	%o4,	%l4
	bshuffle	%f2,	%f4,	%f12
	add	%o7,	0x19F9,	%i2
	fcmple32	%f14,	%f6,	%l6
	sdiv	%g3,	0x05EF,	%g6
	mulscc	%o2,	0x1522,	%i0
	movre	%g2,	%i6,	%i4
	orn	%o3,	%g1,	%o1
	edge32	%i7,	%g5,	%l0
	movcc	%xcc,	%o6,	%l3
	subcc	%g7,	0x0EB7,	%i1
	sdivx	%g4,	0x1A51,	%l2
	sdivcc	%i5,	0x0C3F,	%o5
	fxor	%f10,	%f14,	%f14
	st	%f3,	[%l7 + 0x7C]
	ldsb	[%l7 + 0x30],	%o0
	fmovspos	%xcc,	%f8,	%f8
	sdivx	%l5,	0x1469,	%l1
	andn	%o4,	%l4,	%o7
	xnor	%i2,	0x0091,	%l6
	movrgez	%i3,	%g6,	%o2
	fnors	%f6,	%f4,	%f3
	sdivx	%g3,	0x0F2A,	%g2
	edge8l	%i0,	%i4,	%i6
	andcc	%o3,	0x026C,	%g1
	movre	%i7,	%o1,	%g5
	movleu	%icc,	%o6,	%l0
	fcmple32	%f12,	%f8,	%g7
	restore %l3, %i1, %l2
	fandnot2s	%f12,	%f1,	%f10
	addccc	%g4,	0x0B11,	%o5
	movvs	%xcc,	%o0,	%i5
	movge	%icc,	%l5,	%l1
	ldd	[%l7 + 0x78],	%f10
	movrlz	%l4,	%o4,	%o7
	fcmpne32	%f4,	%f4,	%l6
	alignaddrl	%i3,	%i2,	%g6
	alignaddrl	%g3,	%g2,	%i0
	edge16n	%o2,	%i6,	%o3
	fmovrsgz	%i4,	%f12,	%f5
	fmovd	%f10,	%f2
	umul	%i7,	%g1,	%o1
	orcc	%g5,	0x01E2,	%l0
	array32	%g7,	%l3,	%o6
	fmovdl	%xcc,	%f12,	%f8
	fmovspos	%icc,	%f4,	%f1
	sth	%i1,	[%l7 + 0x20]
	sdivcc	%g4,	0x1EDD,	%o5
	movcs	%icc,	%o0,	%i5
	xnorcc	%l5,	0x0788,	%l2
	subcc	%l4,	0x1FC7,	%l1
	edge32n	%o7,	%l6,	%o4
	sll	%i3,	0x08,	%g6
	srl	%g3,	%g2,	%i2
	sub	%o2,	0x1C1F,	%i0
	fcmple32	%f12,	%f2,	%o3
	sth	%i6,	[%l7 + 0x7E]
	smul	%i7,	0x18B1,	%i4
	lduw	[%l7 + 0x60],	%g1
	fmovsl	%xcc,	%f12,	%f0
	movn	%icc,	%o1,	%g5
	movre	%l0,	%g7,	%o6
	fzero	%f0
	sdivx	%i1,	0x0513,	%g4
	std	%f6,	[%l7 + 0x10]
	movle	%xcc,	%l3,	%o5
	movn	%xcc,	%o0,	%l5
	sll	%l2,	0x19,	%i5
	lduh	[%l7 + 0x10],	%l1
	subccc	%o7,	%l6,	%l4
	fcmps	%fcc0,	%f7,	%f14
	lduh	[%l7 + 0x40],	%o4
	xor	%i3,	0x017F,	%g6
	smul	%g3,	%i2,	%o2
	edge8l	%g2,	%o3,	%i0
	srax	%i6,	%i4,	%g1
	smul	%i7,	%g5,	%o1
	edge8	%g7,	%o6,	%l0
	fmovsg	%xcc,	%f14,	%f13
	ldub	[%l7 + 0x71],	%i1
	edge8	%l3,	%o5,	%g4
	movvc	%xcc,	%l5,	%l2
	sethi	0x1A9F,	%o0
	edge16ln	%l1,	%i5,	%l6
	sub	%l4,	0x0277,	%o7
	ldsh	[%l7 + 0x50],	%i3
	stw	%g6,	[%l7 + 0x4C]
	movrlz	%g3,	%i2,	%o2
	edge8	%g2,	%o4,	%i0
	fmovrdlez	%i6,	%f6,	%f6
	edge32n	%i4,	%g1,	%o3
	smul	%g5,	0x0F09,	%o1
	mova	%xcc,	%g7,	%o6
	fmovsa	%xcc,	%f15,	%f8
	sdivcc	%l0,	0x06B9,	%i1
	ld	[%l7 + 0x30],	%f15
	ldd	[%l7 + 0x18],	%i6
	xnor	%o5,	0x0396,	%l3
	fmovdne	%xcc,	%f0,	%f11
	orn	%l5,	0x0FD0,	%l2
	stw	%g4,	[%l7 + 0x0C]
	xnor	%o0,	%l1,	%i5
	and	%l6,	%o7,	%l4
	fmul8x16	%f4,	%f12,	%f12
	edge8n	%g6,	%g3,	%i3
	fxor	%f14,	%f0,	%f14
	edge16l	%i2,	%o2,	%o4
	edge16	%i0,	%i6,	%g2
	edge32n	%i4,	%g1,	%g5
	xnorcc	%o3,	%g7,	%o1
	umul	%l0,	0x0CF6,	%o6
	edge8n	%i7,	%i1,	%o5
	ldsh	[%l7 + 0x2E],	%l3
	stw	%l5,	[%l7 + 0x08]
	restore %l2, %g4, %l1
	fmovdvs	%xcc,	%f10,	%f10
	movneg	%icc,	%i5,	%l6
	addccc	%o0,	0x1A17,	%o7
	sll	%l4,	0x0F,	%g6
	edge32ln	%i3,	%i2,	%o2
	stw	%o4,	[%l7 + 0x58]
	edge8ln	%g3,	%i6,	%i0
	sll	%i4,	%g1,	%g2
	movre	%g5,	%o3,	%o1
	edge8ln	%g7,	%o6,	%i7
	sdivx	%l0,	0x0BCF,	%o5
	array32	%l3,	%l5,	%l2
	movne	%icc,	%i1,	%l1
	movcc	%xcc,	%g4,	%l6
	xor	%o0,	0x0141,	%o7
	movre	%l4,	%g6,	%i3
	ldub	[%l7 + 0x2D],	%i2
	fornot1	%f6,	%f6,	%f2
	sdivx	%o2,	0x0AF5,	%i5
	edge32ln	%g3,	%i6,	%o4
	fcmpne16	%f10,	%f4,	%i4
	subc	%i0,	%g1,	%g5
	fmul8x16al	%f10,	%f14,	%f4
	fmovsg	%icc,	%f8,	%f6
	fexpand	%f2,	%f14
	movvc	%icc,	%g2,	%o3
	move	%xcc,	%o1,	%g7
	fmovsne	%icc,	%f11,	%f15
	edge16l	%o6,	%i7,	%o5
	ld	[%l7 + 0x64],	%f2
	srlx	%l0,	0x10,	%l5
	srlx	%l2,	0x10,	%l3
	fors	%f2,	%f7,	%f10
	fmovse	%xcc,	%f9,	%f7
	orcc	%i1,	%g4,	%l6
	movn	%icc,	%l1,	%o7
	edge8l	%l4,	%g6,	%o0
	udivx	%i3,	0x11F5,	%i2
	edge16	%i5,	%g3,	%i6
	popc	0x010C,	%o4
	movleu	%xcc,	%o2,	%i4
	movrgez	%g1,	0x33A,	%i0
	xnor	%g2,	%o3,	%g5
	sdivcc	%g7,	0x0AB8,	%o6
	sdivcc	%i7,	0x0B5B,	%o5
	movrlez	%o1,	%l5,	%l2
	sll	%l0,	0x06,	%l3
	addccc	%i1,	0x15E6,	%g4
	movvc	%icc,	%l1,	%l6
	fmul8x16au	%f5,	%f2,	%f0
	movvs	%xcc,	%o7,	%l4
	movleu	%xcc,	%g6,	%o0
	edge32l	%i2,	%i3,	%g3
	addc	%i6,	0x1894,	%i5
	sll	%o4,	0x02,	%i4
	ldsb	[%l7 + 0x28],	%g1
	movrgez	%o2,	%g2,	%o3
	edge16ln	%i0,	%g5,	%g7
	edge16	%o6,	%o5,	%o1
	lduh	[%l7 + 0x1E],	%l5
	lduh	[%l7 + 0x26],	%i7
	fmovde	%xcc,	%f14,	%f15
	andncc	%l0,	%l2,	%l3
	sethi	0x1009,	%i1
	movvc	%icc,	%g4,	%l1
	addc	%o7,	0x1CAA,	%l4
	stb	%g6,	[%l7 + 0x2C]
	ldsb	[%l7 + 0x77],	%l6
	xnorcc	%o0,	%i2,	%g3
	restore %i3, 0x1CF8, %i5
	orncc	%o4,	0x0CFC,	%i4
	fmovrse	%g1,	%f1,	%f4
	subc	%o2,	%i6,	%o3
	stb	%i0,	[%l7 + 0x30]
	array16	%g5,	%g2,	%o6
	lduw	[%l7 + 0x54],	%g7
	udiv	%o1,	0x1045,	%o5
	movrlz	%i7,	%l0,	%l2
	movrlez	%l3,	%l5,	%g4
	edge32	%l1,	%i1,	%o7
	edge32n	%l4,	%g6,	%l6
	fnegd	%f4,	%f0
	edge32ln	%i2,	%o0,	%i3
	alignaddrl	%g3,	%i5,	%i4
	xnorcc	%o4,	%g1,	%o2
	alignaddrl	%i6,	%i0,	%o3
	fone	%f0
	sdiv	%g2,	0x11FC,	%g5
	fmovda	%icc,	%f8,	%f2
	fmovrdne	%o6,	%f6,	%f4
	save %o1, %g7, %i7
	fcmpgt16	%f2,	%f4,	%l0
	edge32	%o5,	%l3,	%l5
	movne	%xcc,	%g4,	%l2
	ldsb	[%l7 + 0x2E],	%i1
	movle	%xcc,	%l1,	%l4
	xnorcc	%g6,	%l6,	%o7
	udivx	%o0,	0x106D,	%i2
	mulx	%g3,	%i5,	%i3
	xor	%o4,	0x14F9,	%g1
	mova	%xcc,	%i4,	%o2
	subc	%i6,	0x1641,	%o3
	add	%g2,	0x0878,	%g5
	sth	%o6,	[%l7 + 0x6C]
	stw	%i0,	[%l7 + 0x44]
	fpsub16s	%f11,	%f9,	%f0
	movrlz	%g7,	0x3A8,	%o1
	orn	%i7,	0x141B,	%l0
	bshuffle	%f0,	%f14,	%f4
	move	%xcc,	%l3,	%l5
	fmovse	%xcc,	%f11,	%f14
	edge8l	%o5,	%g4,	%l2
	fmovrse	%l1,	%f9,	%f1
	movleu	%icc,	%l4,	%g6
	std	%f14,	[%l7 + 0x28]
	sdivx	%l6,	0x1864,	%i1
	fmovrde	%o7,	%f8,	%f12
	sdiv	%i2,	0x0364,	%g3
	fmovdle	%icc,	%f6,	%f10
	udivcc	%o0,	0x031B,	%i5
	addcc	%o4,	0x1CBF,	%g1
	srlx	%i4,	%o2,	%i6
	ldd	[%l7 + 0x10],	%o2
	sub	%g2,	%g5,	%o6
	fmovdge	%xcc,	%f9,	%f8
	restore %i3, %i0, %g7
	fcmpne16	%f2,	%f0,	%o1
	movge	%icc,	%i7,	%l0
	sth	%l5,	[%l7 + 0x52]
	stb	%o5,	[%l7 + 0x0E]
	mulscc	%l3,	0x14B0,	%l2
	movrgz	%l1,	%g4,	%l4
	subcc	%g6,	0x1966,	%l6
	mulscc	%o7,	%i2,	%g3
	smulcc	%o0,	%i1,	%i5
	xorcc	%g1,	%o4,	%o2
	sub	%i6,	0x0B22,	%i4
	popc	%o3,	%g2
	save %g5, %i3, %i0
	movne	%icc,	%g7,	%o6
	orn	%o1,	%l0,	%l5
	movre	%o5,	0x14B,	%l3
	edge16n	%l2,	%l1,	%g4
	ld	[%l7 + 0x2C],	%f9
	edge8	%i7,	%l4,	%g6
	addccc	%o7,	0x0ABE,	%i2
	edge32n	%l6,	%o0,	%i1
	ldsh	[%l7 + 0x3A],	%g3
	edge16ln	%g1,	%o4,	%i5
	edge32ln	%i6,	%i4,	%o2
	sth	%g2,	[%l7 + 0x70]
	udiv	%o3,	0x01D4,	%i3
	save %i0, 0x1C62, %g5
	restore %o6, %g7, %o1
	edge32n	%l0,	%o5,	%l5
	ldsw	[%l7 + 0x3C],	%l2
	xorcc	%l3,	%l1,	%g4
	mulscc	%l4,	0x1180,	%g6
	sdivcc	%o7,	0x1080,	%i2
	edge16ln	%l6,	%o0,	%i1
	fpsub16s	%f6,	%f2,	%f10
	ldx	[%l7 + 0x08],	%i7
	addc	%g1,	0x1CE4,	%g3
	mova	%icc,	%i5,	%o4
	sth	%i4,	[%l7 + 0x4C]
	udivcc	%o2,	0x1637,	%g2
	movvs	%xcc,	%i6,	%i3
	ldd	[%l7 + 0x68],	%f4
	movcs	%icc,	%o3,	%g5
	fmul8x16au	%f4,	%f4,	%f0
	movrne	%i0,	%g7,	%o6
	movpos	%xcc,	%l0,	%o1
	fmovrde	%o5,	%f2,	%f0
	stb	%l2,	[%l7 + 0x0B]
	movgu	%xcc,	%l5,	%l3
	xnor	%l1,	%l4,	%g6
	edge32	%g4,	%o7,	%i2
	ldsb	[%l7 + 0x57],	%l6
	fsrc1	%f2,	%f10
	alignaddr	%i1,	%i7,	%g1
	movrne	%g3,	%i5,	%o4
	sdivx	%i4,	0x1BA9,	%o2
	fmovscs	%xcc,	%f14,	%f7
	addcc	%g2,	0x13D1,	%o0
	edge16l	%i6,	%i3,	%g5
	fcmps	%fcc2,	%f6,	%f14
	fmul8sux16	%f2,	%f4,	%f0
	fands	%f8,	%f5,	%f2
	smulcc	%i0,	%g7,	%o3
	ldub	[%l7 + 0x0B],	%o6
	movvs	%icc,	%o1,	%l0
	ldsb	[%l7 + 0x4D],	%l2
	fmovrdgz	%l5,	%f4,	%f0
	movcc	%xcc,	%l3,	%l1
	lduh	[%l7 + 0x5E],	%l4
	xnor	%g6,	0x08B8,	%o5
	ldd	[%l7 + 0x40],	%o6
	array32	%g4,	%l6,	%i1
	movrgez	%i7,	0x00E,	%i2
	movrgez	%g1,	0x250,	%i5
	st	%f0,	[%l7 + 0x24]
	srax	%g3,	%o4,	%i4
	popc	0x19D8,	%o2
	fpadd32s	%f3,	%f11,	%f2
	sdivcc	%o0,	0x0E5A,	%g2
	fpsub32	%f10,	%f14,	%f0
	mulscc	%i3,	0x0566,	%g5
	stb	%i0,	[%l7 + 0x18]
	array32	%g7,	%i6,	%o6
	fnors	%f3,	%f4,	%f9
	movpos	%xcc,	%o3,	%o1
	movg	%xcc,	%l2,	%l0
	sdivcc	%l3,	0x1468,	%l1
	edge32ln	%l5,	%l4,	%g6
	ldub	[%l7 + 0x5E],	%o7
	andn	%o5,	%l6,	%g4
	fcmpes	%fcc3,	%f2,	%f1
	std	%f4,	[%l7 + 0x10]
	save %i7, 0x0D15, %i2
	fmovsvc	%icc,	%f10,	%f12
	fcmpes	%fcc2,	%f7,	%f1
	smulcc	%g1,	0x1CF8,	%i1
	xnorcc	%g3,	%i5,	%i4
	stb	%o4,	[%l7 + 0x14]
	edge8l	%o0,	%o2,	%i3
	fpsub16	%f2,	%f4,	%f2
	sub	%g5,	0x05CE,	%g2
	movne	%icc,	%i0,	%i6
	mulscc	%o6,	%o3,	%o1
	restore %g7, %l0, %l3
	udivcc	%l1,	0x1C19,	%l2
	array16	%l5,	%l4,	%g6
	fmovsle	%xcc,	%f2,	%f11
	fpadd32	%f12,	%f12,	%f6
	st	%f5,	[%l7 + 0x34]
	sdivx	%o7,	0x17D8,	%o5
	fmovsa	%icc,	%f1,	%f13
	fmovdvc	%icc,	%f4,	%f13
	fcmpne16	%f2,	%f6,	%l6
	ld	[%l7 + 0x3C],	%f4
	movrlz	%i7,	%g4,	%g1
	movpos	%xcc,	%i1,	%i2
	andcc	%i5,	%g3,	%i4
	popc	%o0,	%o2
	sdiv	%o4,	0x12FB,	%g5
	sdivcc	%i3,	0x0F74,	%i0
	popc	%g2,	%o6
	fsrc2	%f0,	%f0
	movne	%xcc,	%o3,	%i6
	alignaddr	%g7,	%l0,	%l3
	fxor	%f0,	%f2,	%f8
	sth	%o1,	[%l7 + 0x66]
	fabsd	%f12,	%f10
	fmovrsne	%l2,	%f11,	%f8
	movneg	%icc,	%l1,	%l4
	udivx	%g6,	0x1A87,	%o7
	ldsh	[%l7 + 0x2E],	%o5
	movvs	%xcc,	%l5,	%l6
	ldsh	[%l7 + 0x3E],	%g4
	edge8ln	%g1,	%i7,	%i1
	orn	%i2,	0x0D4E,	%i5
	subc	%g3,	%i4,	%o0
	edge16l	%o2,	%o4,	%g5
	sll	%i0,	0x18,	%g2
	fmovs	%f11,	%f3
	fandnot1s	%f15,	%f6,	%f4
	fmovdvc	%icc,	%f12,	%f13
	orcc	%i3,	0x05C1,	%o3
	movle	%icc,	%o6,	%g7
	movne	%xcc,	%l0,	%i6
	ldd	[%l7 + 0x38],	%f2
	fornot1s	%f7,	%f15,	%f4
	or	%l3,	%l2,	%l1
	subccc	%l4,	0x134B,	%o1
	sllx	%g6,	0x0C,	%o7
	sth	%l5,	[%l7 + 0x10]
	fmovdneg	%icc,	%f11,	%f4
	fcmpd	%fcc2,	%f0,	%f8
	stb	%l6,	[%l7 + 0x4B]
	sll	%g4,	%o5,	%g1
	sll	%i7,	%i1,	%i5
	umulcc	%g3,	0x14C0,	%i4
	array16	%o0,	%o2,	%o4
	andcc	%g5,	%i0,	%g2
	srl	%i2,	0x15,	%i3
	array16	%o6,	%g7,	%l0
	movneg	%xcc,	%o3,	%l3
	movn	%xcc,	%i6,	%l2
	addccc	%l4,	%o1,	%g6
	sethi	0x0F2D,	%o7
	restore %l1, 0x10B9, %l5
	movvc	%icc,	%g4,	%o5
	sdivcc	%l6,	0x0958,	%i7
	andcc	%g1,	%i5,	%g3
	array16	%i4,	%o0,	%o2
	ldsw	[%l7 + 0x3C],	%i1
	stx	%g5,	[%l7 + 0x30]
	addcc	%o4,	%g2,	%i0
	sethi	0x09D8,	%i2
	edge16l	%o6,	%g7,	%l0
	fmul8ulx16	%f2,	%f0,	%f8
	mulscc	%o3,	%i3,	%i6
	ld	[%l7 + 0x44],	%f5
	fpsub32	%f4,	%f12,	%f6
	udivx	%l3,	0x1067,	%l4
	for	%f4,	%f10,	%f12
	move	%icc,	%o1,	%g6
	fand	%f14,	%f10,	%f12
	addcc	%o7,	%l2,	%l5
	sdivx	%l1,	0x100F,	%o5
	andn	%l6,	0x0BF8,	%i7
	fors	%f15,	%f2,	%f8
	fmul8ulx16	%f8,	%f4,	%f6
	orn	%g4,	%i5,	%g3
	udiv	%g1,	0x13C9,	%o0
	fmovsgu	%icc,	%f0,	%f0
	movle	%icc,	%i4,	%o2
	fnot2s	%f7,	%f2
	mova	%xcc,	%g5,	%o4
	orcc	%i1,	0x1F5C,	%i0
	movleu	%icc,	%g2,	%i2
	movrlz	%o6,	%g7,	%o3
	lduh	[%l7 + 0x24],	%i3
	xnorcc	%l0,	0x024C,	%i6
	udiv	%l4,	0x18C3,	%l3
	xnor	%g6,	0x1E77,	%o1
	xnorcc	%l2,	0x1C0E,	%o7
	andn	%l5,	0x1436,	%o5
	ldx	[%l7 + 0x78],	%l6
	movrlez	%l1,	%i7,	%i5
	fnors	%f3,	%f8,	%f3
	udiv	%g3,	0x004B,	%g4
	movcc	%icc,	%g1,	%o0
	smul	%i4,	%o2,	%g5
	andn	%o4,	0x18B2,	%i0
	andn	%g2,	%i1,	%o6
	fabss	%f1,	%f4
	umulcc	%i2,	%o3,	%i3
	addc	%g7,	0x1030,	%l0
	orcc	%i6,	0x0375,	%l4
	movneg	%icc,	%g6,	%o1
	ldub	[%l7 + 0x2F],	%l2
	fmul8x16al	%f11,	%f5,	%f4
	ldd	[%l7 + 0x08],	%o6
	fsrc1	%f8,	%f12
	popc	%l3,	%o5
	edge32l	%l5,	%l1,	%l6
	movne	%xcc,	%i5,	%i7
	addccc	%g3,	%g1,	%o0
	ldsw	[%l7 + 0x48],	%g4
	sdiv	%o2,	0x0574,	%g5
	smul	%o4,	0x19FE,	%i0
	movge	%icc,	%i4,	%g2
	edge16n	%o6,	%i2,	%o3
	fmovrdlez	%i1,	%f12,	%f2
	fmovde	%icc,	%f3,	%f11
	edge16l	%g7,	%l0,	%i3
	sdiv	%i6,	0x0544,	%g6
	array16	%l4,	%o1,	%l2
	sll	%l3,	%o5,	%l5
	fxnors	%f9,	%f13,	%f6
	alignaddrl	%o7,	%l1,	%l6
	add	%i5,	%g3,	%i7
	ldd	[%l7 + 0x78],	%f10
	fmovdl	%icc,	%f7,	%f13
	fmovrde	%g1,	%f2,	%f8
	smul	%o0,	0x055E,	%g4
	addcc	%o2,	%g5,	%i0
	ldub	[%l7 + 0x34],	%i4
	mulx	%o4,	%g2,	%i2
	save %o3, 0x02D1, %o6
	edge8	%i1,	%l0,	%i3
	movcs	%xcc,	%i6,	%g7
	movg	%xcc,	%l4,	%o1
	subc	%l2,	%g6,	%l3
	fpackfix	%f4,	%f9
	movn	%icc,	%o5,	%o7
	subcc	%l1,	0x07C2,	%l5
	lduh	[%l7 + 0x34],	%l6
	smul	%i5,	%i7,	%g3
	umul	%o0,	%g1,	%g4
	fandnot1	%f4,	%f0,	%f4
	orcc	%g5,	%o2,	%i4
	udivx	%o4,	0x00BB,	%i0
	fmovdneg	%icc,	%f5,	%f2
	movcc	%icc,	%i2,	%o3
	fnands	%f5,	%f5,	%f13
	mova	%xcc,	%g2,	%o6
	edge8ln	%i1,	%l0,	%i6
	fcmpne16	%f2,	%f14,	%i3
	faligndata	%f14,	%f12,	%f0
	sdivcc	%g7,	0x1890,	%l4
	fmovda	%xcc,	%f7,	%f5
	ld	[%l7 + 0x24],	%f15
	edge8l	%o1,	%l2,	%l3
	movcc	%xcc,	%g6,	%o5
	edge8ln	%l1,	%l5,	%l6
	movrne	%o7,	0x19B,	%i5
	sdivx	%i7,	0x12AD,	%g3
	ldd	[%l7 + 0x38],	%f8
	fmovsge	%icc,	%f8,	%f1
	fmovrslz	%o0,	%f12,	%f15
	fpackfix	%f14,	%f2
	sllx	%g1,	0x17,	%g5
	xorcc	%g4,	%i4,	%o4
	movrne	%o2,	0x06B,	%i2
	movn	%icc,	%o3,	%g2
	alignaddr	%o6,	%i1,	%i0
	fors	%f3,	%f4,	%f4
	movvs	%xcc,	%l0,	%i3
	movre	%g7,	0x1B3,	%l4
	andn	%o1,	%l2,	%i6
	orn	%g6,	%o5,	%l3
	and	%l5,	0x0D68,	%l1
	srax	%l6,	0x05,	%o7
	srax	%i5,	0x00,	%i7
	popc	%o0,	%g3
	save %g1, 0x0689, %g4
	umul	%i4,	%o4,	%g5
	movrne	%i2,	0x1EA,	%o2
	movrne	%g2,	%o3,	%i1
	st	%f3,	[%l7 + 0x70]
	edge16	%o6,	%i0,	%i3
	fmovdge	%xcc,	%f2,	%f1
	sub	%l0,	%l4,	%g7
	sdiv	%l2,	0x190F,	%o1
	movrne	%g6,	0x17A,	%i6
	sllx	%l3,	0x02,	%l5
	subccc	%o5,	%l1,	%l6
	edge32	%i5,	%i7,	%o0
	addc	%g3,	0x04A5,	%g1
	fmovsg	%xcc,	%f1,	%f9
	mova	%icc,	%g4,	%o7
	ldsh	[%l7 + 0x22],	%o4
	addccc	%i4,	0x1AB7,	%g5
	ldd	[%l7 + 0x30],	%o2
	ldd	[%l7 + 0x60],	%f8
	movpos	%xcc,	%g2,	%i2
	stx	%i1,	[%l7 + 0x50]
	mulscc	%o6,	%o3,	%i3
	ldsb	[%l7 + 0x68],	%i0
	movcs	%xcc,	%l0,	%g7
	fpmerge	%f3,	%f12,	%f12
	movn	%xcc,	%l2,	%l4
	orcc	%g6,	0x08FF,	%o1
	edge32l	%l3,	%i6,	%o5
	srl	%l1,	%l6,	%l5
	edge32l	%i5,	%o0,	%i7
	fcmped	%fcc2,	%f10,	%f2
	ldd	[%l7 + 0x40],	%f2
	fmovdge	%icc,	%f12,	%f0
	movg	%icc,	%g3,	%g4
	ldd	[%l7 + 0x60],	%f10
	ldsb	[%l7 + 0x6E],	%g1
	lduw	[%l7 + 0x28],	%o4
	edge8ln	%o7,	%g5,	%i4
	fxors	%f1,	%f11,	%f10
	array16	%o2,	%i2,	%i1
	sdivcc	%o6,	0x0BCC,	%o3
	sll	%i3,	0x04,	%g2
	array32	%l0,	%i0,	%l2
	andcc	%g7,	%g6,	%o1
	udivcc	%l4,	0x0F2A,	%i6
	sll	%o5,	0x08,	%l3
	fmovrsgz	%l6,	%f10,	%f11
	alignaddrl	%l1,	%l5,	%o0
	udivx	%i5,	0x0554,	%i7
	edge16ln	%g3,	%g1,	%g4
	sdivcc	%o4,	0x0570,	%o7
	and	%g5,	0x1D6C,	%o2
	umulcc	%i2,	0x1C58,	%i1
	stw	%i4,	[%l7 + 0x38]
	subcc	%o6,	%i3,	%g2
	sra	%o3,	0x16,	%l0
	xnorcc	%l2,	%i0,	%g7
	fands	%f7,	%f9,	%f9
	ld	[%l7 + 0x14],	%f3
	fcmpeq32	%f4,	%f10,	%o1
	fmovse	%xcc,	%f14,	%f6
	addcc	%g6,	%l4,	%i6
	fornot2s	%f8,	%f0,	%f8
	ldx	[%l7 + 0x10],	%o5
	subccc	%l3,	%l1,	%l5
	xnorcc	%o0,	0x11EB,	%l6
	srl	%i5,	0x17,	%i7
	alignaddrl	%g1,	%g4,	%g3
	sdivx	%o7,	0x1114,	%g5
	alignaddrl	%o4,	%i2,	%o2
	sra	%i1,	%o6,	%i4
	movle	%xcc,	%g2,	%o3
	fnot1	%f12,	%f14
	edge32ln	%l0,	%l2,	%i0
	fpackfix	%f0,	%f4
	sdiv	%g7,	0x0C8D,	%o1
	orcc	%i3,	0x192F,	%g6
	restore %i6, %l4, %o5
	std	%f12,	[%l7 + 0x70]
	sth	%l3,	[%l7 + 0x1A]
	fcmpne16	%f6,	%f2,	%l5
	stw	%l1,	[%l7 + 0x3C]
	movge	%xcc,	%o0,	%i5
	addccc	%i7,	0x0B6D,	%l6
	array8	%g1,	%g4,	%o7
	move	%xcc,	%g3,	%g5
	popc	0x1610,	%o4
	movrgz	%i2,	%i1,	%o6
	stb	%o2,	[%l7 + 0x4F]
	fmovspos	%icc,	%f7,	%f5
	ldub	[%l7 + 0x4C],	%i4
	xor	%g2,	0x0232,	%o3
	movge	%xcc,	%l0,	%l2
	udiv	%g7,	0x04FC,	%i0
	and	%o1,	0x0146,	%i3
	edge8ln	%g6,	%i6,	%o5
	movle	%icc,	%l4,	%l3
	movl	%icc,	%l5,	%l1
	ldsh	[%l7 + 0x1E],	%o0
	fornot1s	%f4,	%f11,	%f13
	move	%icc,	%i5,	%l6
	sth	%g1,	[%l7 + 0x50]
	xnor	%g4,	0x0087,	%o7
	lduh	[%l7 + 0x70],	%g3
	fpadd32	%f2,	%f4,	%f4
	fmovsleu	%xcc,	%f14,	%f3
	restore %i7, 0x0294, %o4
	sdivx	%g5,	0x0F3C,	%i2
	alignaddrl	%o6,	%o2,	%i4
	fandnot2s	%f0,	%f6,	%f13
	and	%g2,	%o3,	%i1
	srax	%l2,	0x07,	%g7
	array8	%i0,	%o1,	%i3
	movrlez	%g6,	%l0,	%o5
	fcmple16	%f14,	%f10,	%l4
	movpos	%xcc,	%i6,	%l5
	movre	%l1,	%l3,	%i5
	andncc	%l6,	%o0,	%g1
	edge16n	%o7,	%g3,	%i7
	ldsw	[%l7 + 0x78],	%g4
	mulscc	%g5,	0x1F45,	%i2
	bshuffle	%f4,	%f8,	%f6
	smul	%o4,	0x010A,	%o2
	alignaddrl	%o6,	%i4,	%g2
	edge32	%o3,	%i1,	%g7
	sra	%l2,	0x00,	%i0
	addcc	%o1,	%g6,	%i3
	std	%f8,	[%l7 + 0x50]
	andncc	%o5,	%l0,	%l4
	fcmps	%fcc2,	%f8,	%f9
	sdivx	%i6,	0x07F8,	%l1
	sra	%l5,	0x0A,	%i5
	movrgz	%l6,	%l3,	%o0
	sdivx	%g1,	0x0818,	%o7
	movrgz	%i7,	%g4,	%g3
	fxor	%f8,	%f14,	%f8
	ldsh	[%l7 + 0x10],	%g5
	edge16n	%i2,	%o2,	%o6
	fmovdg	%xcc,	%f9,	%f11
	fpsub32s	%f11,	%f15,	%f4
	orncc	%i4,	0x07DF,	%o4
	or	%g2,	%i1,	%o3
	stw	%l2,	[%l7 + 0x7C]
	fabsd	%f8,	%f14
	add	%g7,	0x1685,	%i0
	pdist	%f4,	%f12,	%f14
	edge16n	%o1,	%g6,	%o5
	edge32n	%i3,	%l0,	%l4
	sdivcc	%i6,	0x18A0,	%l1
	smul	%i5,	0x076D,	%l5
	andcc	%l6,	%o0,	%l3
	andn	%g1,	%o7,	%i7
	fmovscc	%xcc,	%f4,	%f0
	fmovsne	%icc,	%f0,	%f8
	fabsd	%f6,	%f6
	fnot1	%f6,	%f2
	fnot1	%f2,	%f10
	sllx	%g4,	%g5,	%i2
	xorcc	%g3,	0x0A1C,	%o6
	udivcc	%i4,	0x092A,	%o2
	array16	%g2,	%i1,	%o3
	andcc	%o4,	0x1E0E,	%g7
	ldub	[%l7 + 0x51],	%i0
	fxors	%f5,	%f9,	%f3
	movrne	%l2,	0x040,	%o1
	orn	%g6,	%i3,	%o5
	xor	%l0,	%i6,	%l4
	fmovscs	%icc,	%f13,	%f14
	fxors	%f10,	%f8,	%f14
	fnot1s	%f9,	%f6
	popc	0x02DD,	%i5
	movvc	%xcc,	%l5,	%l6
	sllx	%o0,	%l3,	%l1
	sdiv	%g1,	0x1775,	%i7
	umulcc	%o7,	%g5,	%i2
	orn	%g4,	%o6,	%i4
	lduh	[%l7 + 0x52],	%g3
	fpsub16s	%f3,	%f7,	%f11
	xnor	%g2,	%o2,	%o3
	srl	%o4,	0x06,	%g7
	fabss	%f12,	%f13
	fmovrsne	%i0,	%f7,	%f1
	fmul8x16au	%f4,	%f2,	%f12
	fmovdcs	%xcc,	%f4,	%f1
	lduh	[%l7 + 0x10],	%i1
	fmul8x16al	%f0,	%f15,	%f0
	fmovdcs	%icc,	%f11,	%f13
	array32	%o1,	%g6,	%l2
	array16	%i3,	%o5,	%l0
	fmovsg	%icc,	%f5,	%f5
	movpos	%icc,	%i6,	%i5
	movcs	%icc,	%l5,	%l4
	andcc	%l6,	0x1B2B,	%o0
	movgu	%xcc,	%l3,	%g1
	movrne	%l1,	%i7,	%g5
	orcc	%o7,	0x190E,	%i2
	fcmpne32	%f12,	%f12,	%o6
	udivcc	%i4,	0x10B5,	%g4
	xnorcc	%g3,	0x01FF,	%o2
	movl	%icc,	%o3,	%g2
	fmovdcs	%xcc,	%f1,	%f9
	fpack16	%f12,	%f2
	fmovrse	%o4,	%f3,	%f13
	and	%i0,	0x1EB7,	%i1
	array32	%g7,	%g6,	%l2
	movgu	%xcc,	%i3,	%o5
	ld	[%l7 + 0x10],	%f11
	fmovrslez	%l0,	%f4,	%f0
	mulscc	%i6,	%i5,	%o1
	edge32	%l5,	%l6,	%o0
	fmovsleu	%icc,	%f0,	%f1
	st	%f5,	[%l7 + 0x60]
	movvc	%xcc,	%l3,	%g1
	ldsb	[%l7 + 0x4B],	%l1
	movrlez	%l4,	0x3AA,	%i7
	ldub	[%l7 + 0x49],	%g5
	array8	%o7,	%i2,	%o6
	movn	%icc,	%g4,	%g3
	save %i4, 0x17C9, %o2
	orn	%g2,	0x167C,	%o4
	movn	%icc,	%i0,	%i1
	mulscc	%o3,	0x0052,	%g7
	srlx	%l2,	%i3,	%o5
	fornot1	%f6,	%f14,	%f4
	popc	%l0,	%i6
	movcc	%xcc,	%g6,	%i5
	ldsb	[%l7 + 0x4D],	%l5
	fxnor	%f4,	%f12,	%f6
	and	%l6,	0x153B,	%o0
	fmovdne	%xcc,	%f13,	%f14
	andn	%o1,	0x02BA,	%l3
	sethi	0x0E04,	%l1
	add	%g1,	0x0705,	%i7
	ld	[%l7 + 0x5C],	%f11
	ldd	[%l7 + 0x30],	%f2
	move	%icc,	%g5,	%l4
	subcc	%i2,	0x1907,	%o6
	srax	%g4,	0x12,	%g3
	addc	%i4,	%o7,	%o2
	movn	%xcc,	%g2,	%i0
	fmovsleu	%xcc,	%f13,	%f8
	fmovrsne	%o4,	%f2,	%f10
	ldub	[%l7 + 0x53],	%o3
	andcc	%i1,	%l2,	%i3
	edge8ln	%o5,	%l0,	%g7
	fcmped	%fcc3,	%f14,	%f0
	movcc	%xcc,	%g6,	%i5
	udivcc	%l5,	0x1A5E,	%i6
	xnorcc	%l6,	0x173A,	%o1
	array8	%o0,	%l3,	%l1
	fors	%f14,	%f2,	%f0
	edge32n	%i7,	%g1,	%g5
	addcc	%i2,	0x100B,	%o6
	stw	%g4,	[%l7 + 0x64]
	stx	%l4,	[%l7 + 0x50]
	popc	%i4,	%o7
	movneg	%xcc,	%o2,	%g2
	andncc	%i0,	%g3,	%o3
	fpadd16s	%f5,	%f13,	%f14
	sethi	0x0821,	%o4
	addc	%i1,	%i3,	%o5
	movrgz	%l0,	0x18C,	%l2
	movle	%xcc,	%g7,	%i5
	fnegd	%f14,	%f0
	fcmpne32	%f12,	%f12,	%l5
	fpackfix	%f2,	%f8
	andncc	%i6,	%g6,	%l6
	fmovsleu	%icc,	%f7,	%f10
	subcc	%o1,	0x1A8C,	%l3
	orn	%l1,	%i7,	%o0
	ldx	[%l7 + 0x68],	%g5
	ldd	[%l7 + 0x38],	%g0
	movn	%xcc,	%o6,	%g4
	fexpand	%f10,	%f6
	lduw	[%l7 + 0x3C],	%l4
	fmovdvc	%icc,	%f12,	%f4
	sra	%i4,	%i2,	%o7
	sdivcc	%g2,	0x0280,	%o2
	ldsb	[%l7 + 0x37],	%i0
	sll	%o3,	0x11,	%o4
	and	%g3,	%i1,	%i3
	mova	%xcc,	%o5,	%l0
	edge8n	%g7,	%l2,	%l5
	alignaddr	%i5,	%i6,	%g6
	umul	%o1,	%l6,	%l3
	fnot1s	%f10,	%f5
	and	%l1,	0x1025,	%i7
	sethi	0x1B3D,	%g5
	movleu	%xcc,	%o0,	%o6
	edge16l	%g4,	%l4,	%g1
	subcc	%i2,	%o7,	%i4
	fcmped	%fcc3,	%f0,	%f14
	edge8	%o2,	%g2,	%o3
	fmovscs	%icc,	%f7,	%f13
	xorcc	%i0,	0x1BB9,	%o4
	xnor	%i1,	0x0D9A,	%g3
	sllx	%i3,	%o5,	%l0
	ldsw	[%l7 + 0x50],	%g7
	ldx	[%l7 + 0x20],	%l2
	ldsh	[%l7 + 0x4C],	%l5
	srl	%i5,	0x10,	%i6
	movre	%g6,	0x16E,	%o1
	xnorcc	%l3,	%l6,	%l1
	restore %g5, 0x13F6, %i7
	mulscc	%o6,	0x134F,	%g4
	movpos	%icc,	%l4,	%g1
	or	%o0,	%o7,	%i4
	srax	%i2,	0x0A,	%g2
	lduw	[%l7 + 0x2C],	%o3
	srl	%i0,	%o2,	%i1
	st	%f6,	[%l7 + 0x7C]
	ldsh	[%l7 + 0x38],	%g3
	fpadd32	%f10,	%f8,	%f8
	fmovsneg	%xcc,	%f6,	%f14
	udivcc	%o4,	0x0E27,	%o5
	fornot2	%f10,	%f6,	%f10
	sdiv	%i3,	0x036E,	%g7
	fmovsa	%icc,	%f12,	%f9
	sub	%l2,	0x1A46,	%l0
	orncc	%l5,	0x138C,	%i5
	addc	%i6,	0x0DE0,	%g6
	smulcc	%o1,	0x0B26,	%l3
	alignaddr	%l1,	%l6,	%i7
	andn	%g5,	0x16E8,	%o6
	stx	%g4,	[%l7 + 0x20]
	fmovdvs	%icc,	%f3,	%f6
	stb	%g1,	[%l7 + 0x57]
	movcs	%icc,	%l4,	%o7
	umulcc	%o0,	0x1A03,	%i4
	fmovsge	%xcc,	%f11,	%f6
	umul	%i2,	0x1FC6,	%g2
	fcmpne16	%f4,	%f10,	%i0
	for	%f8,	%f6,	%f10
	edge32	%o3,	%o2,	%g3
	sll	%i1,	0x1E,	%o4
	stb	%i3,	[%l7 + 0x15]
	sdivcc	%o5,	0x1A40,	%g7
	andcc	%l0,	%l2,	%l5
	fandnot1s	%f10,	%f13,	%f8
	mulscc	%i6,	0x000A,	%g6
	save %o1, 0x1C39, %l3
	ldsh	[%l7 + 0x74],	%i5
	sllx	%l6,	%l1,	%i7
	subcc	%o6,	%g4,	%g5
	ld	[%l7 + 0x50],	%f9
	edge32n	%g1,	%o7,	%l4
	edge16n	%i4,	%i2,	%g2
	subcc	%i0,	0x00F1,	%o3
	movcc	%xcc,	%o2,	%o0
	fnegs	%f3,	%f15
	alignaddr	%i1,	%o4,	%g3
	xor	%o5,	%i3,	%l0
	smulcc	%l2,	%g7,	%i6
	orncc	%g6,	%o1,	%l3
	fmovsneg	%icc,	%f0,	%f4
	movg	%icc,	%l5,	%l6
	edge16ln	%i5,	%l1,	%i7
	sdiv	%g4,	0x0677,	%o6
	fmovdge	%icc,	%f2,	%f5
	andncc	%g5,	%o7,	%l4
	ldd	[%l7 + 0x30],	%i4
	for	%f14,	%f2,	%f12
	and	%i2,	0x0CFC,	%g2
	fpack32	%f10,	%f2,	%f6
	fmovdvc	%xcc,	%f15,	%f13
	fmovrdgez	%g1,	%f4,	%f12
	udiv	%o3,	0x1461,	%i0
	andcc	%o0,	0x0AC7,	%i1
	array16	%o2,	%g3,	%o5
	stx	%o4,	[%l7 + 0x60]
	addccc	%i3,	%l0,	%l2
	orncc	%i6,	%g7,	%g6
	edge8n	%o1,	%l5,	%l3
	std	%f2,	[%l7 + 0x40]
	sllx	%l6,	0x1E,	%i5
	xnorcc	%l1,	%g4,	%i7
	fmovrdgez	%g5,	%f10,	%f8
	and	%o6,	%o7,	%i4
	fcmpgt32	%f6,	%f12,	%l4
	sub	%i2,	0x1FB1,	%g2
	and	%g1,	%i0,	%o0
	save %i1, 0x10ED, %o2
	fmovsle	%xcc,	%f10,	%f10
	subc	%o3,	0x10BB,	%g3
	smulcc	%o5,	%i3,	%l0
	fsrc1s	%f6,	%f11
	movn	%icc,	%o4,	%l2
	fmovsgu	%xcc,	%f1,	%f12
	movn	%icc,	%i6,	%g6
	movvc	%xcc,	%g7,	%l5
	movvc	%xcc,	%o1,	%l3
	edge8	%l6,	%l1,	%i5
	fmovdg	%xcc,	%f14,	%f2
	udiv	%i7,	0x09FA,	%g4
	movle	%xcc,	%o6,	%o7
	movpos	%icc,	%g5,	%l4
	subcc	%i2,	0x1C81,	%i4
	save %g2, %i0, %o0
	fsrc2s	%f1,	%f0
	edge32l	%i1,	%g1,	%o3
	move	%xcc,	%o2,	%o5
	movne	%icc,	%g3,	%i3
	st	%f0,	[%l7 + 0x40]
	fmovrdlez	%o4,	%f12,	%f0
	orncc	%l0,	0x0039,	%l2
	movvc	%xcc,	%i6,	%g6
	fmovsvc	%xcc,	%f7,	%f4
	alignaddr	%l5,	%o1,	%l3
	alignaddrl	%g7,	%l1,	%l6
	sub	%i5,	%g4,	%i7
	alignaddrl	%o7,	%g5,	%o6
	fcmpne32	%f8,	%f10,	%l4
	sethi	0x17D1,	%i4
	orcc	%g2,	%i0,	%o0
	and	%i2,	0x1C85,	%i1
	movn	%xcc,	%g1,	%o3
	alignaddrl	%o2,	%o5,	%i3
	fcmped	%fcc2,	%f10,	%f14
	ldsh	[%l7 + 0x28],	%o4
	ldx	[%l7 + 0x68],	%l0
	orcc	%g3,	%i6,	%l2
	movleu	%xcc,	%g6,	%o1
	andncc	%l5,	%l3,	%g7
	subccc	%l6,	%i5,	%g4
	fxors	%f8,	%f13,	%f9
	fmovspos	%xcc,	%f9,	%f14
	movg	%xcc,	%l1,	%o7
	fnegd	%f4,	%f10
	ldd	[%l7 + 0x58],	%g4
	st	%f5,	[%l7 + 0x1C]
	fsrc2s	%f6,	%f0
	edge8ln	%o6,	%l4,	%i7
	subccc	%i4,	0x1F42,	%i0
	fpackfix	%f10,	%f10
	st	%f10,	[%l7 + 0x5C]
	st	%f12,	[%l7 + 0x60]
	movleu	%xcc,	%g2,	%i2
	popc	0x0EE0,	%i1
	movpos	%xcc,	%g1,	%o0
	movcc	%icc,	%o3,	%o5
	andncc	%o2,	%i3,	%l0
	fmovdcc	%xcc,	%f15,	%f8
	sub	%o4,	0x1F0D,	%g3
	smul	%i6,	0x1896,	%g6
	sethi	0x1DA2,	%o1
	alignaddrl	%l2,	%l5,	%l3
	xor	%g7,	0x04BF,	%i5
	movrlez	%g4,	%l6,	%o7
	ldd	[%l7 + 0x20],	%g4
	srlx	%l1,	%l4,	%o6
	subcc	%i7,	%i0,	%i4
	xnorcc	%g2,	%i1,	%i2
	andncc	%g1,	%o3,	%o0
	alignaddr	%o5,	%i3,	%l0
	popc	0x07AD,	%o2
	movpos	%icc,	%g3,	%i6
	fcmpes	%fcc2,	%f0,	%f4
	array32	%o4,	%o1,	%l2
	fpsub16	%f0,	%f6,	%f6
	sth	%l5,	[%l7 + 0x0E]
	fpadd16	%f6,	%f14,	%f8
	fcmpgt16	%f0,	%f14,	%l3
	edge32n	%g7,	%g6,	%i5
	fnot1s	%f0,	%f2
	ldd	[%l7 + 0x78],	%f10
	addccc	%l6,	%o7,	%g5
	movg	%icc,	%l1,	%l4
	ldub	[%l7 + 0x45],	%g4
	edge8l	%o6,	%i0,	%i4
	umul	%g2,	0x0B28,	%i1
	edge16n	%i7,	%g1,	%i2
	ldsb	[%l7 + 0x6B],	%o0
	or	%o5,	%i3,	%l0
	sethi	0x0223,	%o2
	fexpand	%f14,	%f8
	edge8ln	%g3,	%i6,	%o4
	array8	%o1,	%o3,	%l2
	ldd	[%l7 + 0x38],	%l2
	movrgez	%g7,	%l5,	%i5
	edge32l	%l6,	%o7,	%g5
	srlx	%g6,	0x1E,	%l4
	umul	%l1,	%g4,	%i0
	fornot1s	%f13,	%f10,	%f2
	movrlez	%i4,	0x2D1,	%o6
	edge8	%i1,	%g2,	%g1
	move	%xcc,	%i7,	%i2
	udivx	%o0,	0x1408,	%o5
	movrgez	%l0,	0x15C,	%o2
	fmovsa	%icc,	%f2,	%f13
	srax	%i3,	%g3,	%i6
	srl	%o1,	%o3,	%o4
	ldd	[%l7 + 0x38],	%f14
	save %l2, 0x00FA, %g7
	fmovsn	%icc,	%f0,	%f9
	sdiv	%l5,	0x13BF,	%i5
	sth	%l3,	[%l7 + 0x62]
	fcmpne32	%f8,	%f10,	%l6
	sethi	0x0BE2,	%g5
	fnors	%f2,	%f10,	%f14
	movrgz	%g6,	0x0FA,	%l4
	movre	%o7,	%l1,	%i0
	fmovdge	%xcc,	%f4,	%f7
	subc	%g4,	0x0A52,	%i4
	sdivx	%i1,	0x005F,	%o6
	and	%g2,	%i7,	%i2
	umul	%o0,	0x0727,	%g1
	movn	%xcc,	%o5,	%o2
	fmovd	%f2,	%f10
	edge32l	%i3,	%l0,	%i6
	lduw	[%l7 + 0x28],	%o1
	ldx	[%l7 + 0x68],	%o3
	fcmped	%fcc0,	%f4,	%f8
	fmovde	%icc,	%f8,	%f6
	movneg	%xcc,	%g3,	%l2
	movl	%xcc,	%o4,	%g7
	andn	%l5,	0x02B6,	%i5
	array16	%l6,	%l3,	%g6
	movle	%xcc,	%g5,	%o7
	udiv	%l4,	0x0771,	%i0
	udiv	%l1,	0x0D3D,	%i4
	edge32	%i1,	%o6,	%g2
	fpack16	%f8,	%f10
	fmovdg	%icc,	%f4,	%f2
	fmovde	%xcc,	%f14,	%f7
	edge32	%i7,	%i2,	%g4
	fcmple32	%f10,	%f12,	%o0
	stw	%g1,	[%l7 + 0x08]
	udiv	%o2,	0x1E1D,	%o5
	ld	[%l7 + 0x10],	%f2
	movgu	%xcc,	%i3,	%l0
	movg	%icc,	%o1,	%o3
	fmuld8sux16	%f13,	%f15,	%f4
	edge8n	%i6,	%g3,	%l2
	popc	%g7,	%o4
	andcc	%i5,	0x1D62,	%l5
	edge16l	%l3,	%l6,	%g6
	ldsh	[%l7 + 0x30],	%g5
	ldsw	[%l7 + 0x74],	%o7
	andn	%i0,	%l4,	%l1
	xnorcc	%i4,	%i1,	%g2
	fcmped	%fcc2,	%f4,	%f0
	sdivcc	%o6,	0x1EDC,	%i2
	fmovsl	%xcc,	%f11,	%f4
	edge32	%i7,	%o0,	%g1
	fmovrdgez	%o2,	%f14,	%f12
	edge16l	%g4,	%i3,	%l0
	movrne	%o5,	%o3,	%i6
	movleu	%icc,	%g3,	%l2
	ldsh	[%l7 + 0x7A],	%g7
	movg	%icc,	%o4,	%i5
	pdist	%f6,	%f2,	%f0
	ldsw	[%l7 + 0x40],	%l5
	mulx	%o1,	0x10B9,	%l3
	fmovrslz	%l6,	%f5,	%f2
	array8	%g5,	%g6,	%i0
	movrlez	%o7,	0x270,	%l4
	array8	%i4,	%l1,	%g2
	addccc	%i1,	0x0008,	%i2
	movl	%xcc,	%i7,	%o0
	fornot1s	%f2,	%f0,	%f1
	subccc	%o6,	0x06DC,	%o2
	lduw	[%l7 + 0x38],	%g4
	smulcc	%i3,	%l0,	%o5
	smulcc	%g1,	%i6,	%o3
	udiv	%g3,	0x1EAD,	%l2
	fmovsleu	%icc,	%f1,	%f1
	addccc	%o4,	%i5,	%g7
	udiv	%l5,	0x126E,	%l3
	fmovdleu	%icc,	%f13,	%f11
	fmovsa	%icc,	%f12,	%f1
	fcmped	%fcc1,	%f14,	%f0
	fmovda	%xcc,	%f11,	%f6
	fmovrdlez	%o1,	%f2,	%f8
	srlx	%g5,	0x18,	%l6
	edge8	%i0,	%g6,	%l4
	st	%f15,	[%l7 + 0x50]
	fxnor	%f12,	%f10,	%f12
	fcmpgt32	%f2,	%f8,	%i4
	movneg	%xcc,	%l1,	%g2
	umulcc	%o7,	%i1,	%i7
	smul	%i2,	0x16D3,	%o6
	fmovsle	%icc,	%f12,	%f13
	fmovrdgz	%o2,	%f2,	%f8
	restore %g4, 0x1D90, %i3
	fors	%f14,	%f12,	%f4
	mulscc	%o0,	0x0E41,	%l0
	ldx	[%l7 + 0x58],	%o5
	movcs	%icc,	%g1,	%o3
	fmovspos	%icc,	%f13,	%f2
	movneg	%xcc,	%i6,	%g3
	udivx	%l2,	0x158D,	%i5
	addc	%o4,	0x0595,	%l5
	save %g7, 0x1AC0, %l3
	movleu	%icc,	%o1,	%g5
	subcc	%i0,	%l6,	%l4
	movrgez	%i4,	0x335,	%g6
	movvc	%icc,	%l1,	%o7
	andncc	%g2,	%i7,	%i2
	restore %o6, 0x1314, %i1
	restore %o2, %g4, %o0
	fcmpd	%fcc3,	%f4,	%f12
	ld	[%l7 + 0x44],	%f8
	fmovrdlez	%l0,	%f8,	%f0
	addcc	%o5,	0x0696,	%i3
	sth	%o3,	[%l7 + 0x42]
	edge16n	%i6,	%g1,	%g3
	sdiv	%l2,	0x175D,	%o4
	faligndata	%f14,	%f12,	%f14
	movg	%icc,	%i5,	%l5
	fcmpgt16	%f0,	%f8,	%g7
	xorcc	%l3,	0x192C,	%g5
	fmovdn	%xcc,	%f0,	%f1
	ldx	[%l7 + 0x60],	%o1
	subccc	%i0,	0x1BEE,	%l4
	fzero	%f14
	fmovrslz	%l6,	%f12,	%f15
	movg	%icc,	%i4,	%l1
	andncc	%g6,	%o7,	%i7
	edge8ln	%g2,	%o6,	%i2
	faligndata	%f12,	%f4,	%f8
	xor	%o2,	%i1,	%o0
	edge32l	%l0,	%o5,	%g4
	ldx	[%l7 + 0x50],	%i3
	fmovrslez	%i6,	%f12,	%f12
	ldub	[%l7 + 0x7E],	%g1
	sll	%g3,	%l2,	%o3
	andn	%i5,	%o4,	%g7
	array32	%l3,	%l5,	%g5
	edge8	%o1,	%l4,	%i0
	edge8l	%i4,	%l1,	%g6
	edge32	%l6,	%o7,	%g2
	fnegd	%f6,	%f4
	subccc	%o6,	0x0DDF,	%i7
	edge8ln	%i2,	%i1,	%o2
	movg	%xcc,	%l0,	%o5
	fpack16	%f0,	%f7
	movre	%g4,	%o0,	%i3
	array32	%i6,	%g1,	%g3
	edge32l	%l2,	%o3,	%o4
	fcmpne32	%f4,	%f8,	%i5
	lduw	[%l7 + 0x4C],	%g7
	umul	%l3,	0x0E66,	%l5
	fcmped	%fcc3,	%f6,	%f12
	ldsb	[%l7 + 0x39],	%g5
	xorcc	%o1,	0x0939,	%i0
	addccc	%l4,	%l1,	%i4
	andncc	%g6,	%l6,	%g2
	movgu	%icc,	%o7,	%o6
	movne	%icc,	%i2,	%i7
	movrgez	%i1,	%o2,	%o5
	ldsh	[%l7 + 0x40],	%l0
	movrgz	%g4,	%i3,	%i6
	ldub	[%l7 + 0x41],	%o0
	fmovsa	%icc,	%f0,	%f14
	siam	0x0
	sdivcc	%g1,	0x1AEA,	%l2
	xor	%o3,	%o4,	%i5
	movpos	%xcc,	%g7,	%l3
	fnot1	%f4,	%f12
	movvs	%icc,	%g3,	%l5
	mova	%icc,	%g5,	%i0
	fnot2	%f4,	%f4
	fpadd32s	%f14,	%f9,	%f8
	orn	%l4,	%o1,	%i4
	st	%f9,	[%l7 + 0x50]
	movn	%icc,	%l1,	%l6
	fands	%f7,	%f13,	%f4
	xor	%g2,	%g6,	%o7
	stw	%o6,	[%l7 + 0x08]
	fmovde	%xcc,	%f8,	%f13
	move	%icc,	%i7,	%i1
	ldsb	[%l7 + 0x39],	%o2
	orcc	%i2,	%o5,	%l0
	subc	%i3,	%g4,	%o0
	fmovdgu	%icc,	%f13,	%f5
	movcc	%xcc,	%i6,	%l2
	or	%o3,	%g1,	%o4
	udivcc	%i5,	0x09B0,	%g7
	fmovd	%f6,	%f2
	andncc	%l3,	%g3,	%g5
	st	%f4,	[%l7 + 0x14]
	addc	%l5,	%i0,	%l4
	movne	%xcc,	%o1,	%i4
	andcc	%l6,	0x11D1,	%g2
	orcc	%l1,	%g6,	%o7
	movrgz	%i7,	0x289,	%o6
	sethi	0x1CE3,	%o2
	ldsb	[%l7 + 0x76],	%i2
	sth	%o5,	[%l7 + 0x20]
	mulx	%i1,	0x189D,	%i3
	lduw	[%l7 + 0x14],	%l0
	ldsh	[%l7 + 0x6E],	%g4
	and	%i6,	0x11D8,	%o0
	ldsw	[%l7 + 0x28],	%o3
	addccc	%g1,	0x06EA,	%o4
	xor	%l2,	0x010E,	%i5
	movpos	%xcc,	%l3,	%g3
	sub	%g5,	0x0FED,	%g7
	movgu	%icc,	%i0,	%l4
	save %o1, %i4, %l5
	movrgez	%g2,	%l6,	%l1
	andn	%o7,	%i7,	%o6
	srl	%g6,	0x05,	%o2
	subcc	%i2,	%i1,	%i3
	orcc	%o5,	%g4,	%i6
	fmovrde	%l0,	%f4,	%f4
	sll	%o3,	%g1,	%o4
	edge32ln	%l2,	%o0,	%l3
	stw	%g3,	[%l7 + 0x14]
	mulx	%i5,	%g7,	%g5
	save %i0, 0x1BB5, %l4
	move	%xcc,	%i4,	%l5
	lduw	[%l7 + 0x4C],	%o1
	movcs	%xcc,	%l6,	%l1
	save %o7, 0x17A6, %g2
	movneg	%icc,	%o6,	%i7
	ldx	[%l7 + 0x58],	%g6
	stw	%o2,	[%l7 + 0x20]
	andn	%i1,	%i2,	%i3
	edge16ln	%g4,	%o5,	%l0
	edge32n	%i6,	%o3,	%g1
	movvc	%icc,	%o4,	%o0
	fmuld8sux16	%f6,	%f15,	%f4
	edge8	%l2,	%l3,	%i5
	edge32	%g7,	%g3,	%i0
	umul	%l4,	%g5,	%i4
	xor	%l5,	%l6,	%l1
	xnorcc	%o1,	0x1B6B,	%o7
	sdivcc	%g2,	0x0F1C,	%o6
	movrlz	%i7,	0x14D,	%o2
	addc	%i1,	0x010E,	%i2
	subcc	%i3,	%g4,	%o5
	fcmpgt16	%f0,	%f12,	%l0
	fabss	%f7,	%f12
	ldx	[%l7 + 0x30],	%g6
	edge16n	%i6,	%g1,	%o4
	srlx	%o0,	%l2,	%o3
	movvs	%xcc,	%i5,	%l3
	add	%g7,	%i0,	%g3
	andncc	%l4,	%i4,	%g5
	xnorcc	%l5,	%l1,	%l6
	stw	%o1,	[%l7 + 0x4C]
	movrne	%g2,	%o6,	%o7
	movg	%xcc,	%i7,	%o2
	movpos	%icc,	%i1,	%i3
	ldsb	[%l7 + 0x0B],	%i2
	stx	%o5,	[%l7 + 0x10]
	edge16n	%g4,	%g6,	%i6
	addc	%l0,	0x1214,	%g1
	xnor	%o0,	0x16AC,	%l2
	fcmpd	%fcc3,	%f14,	%f4
	xorcc	%o4,	0x0AAF,	%i5
	sethi	0x0FE5,	%o3
	mulx	%l3,	0x03B6,	%g7
	fpackfix	%f8,	%f14
	srax	%g3,	0x1B,	%i0
	movne	%icc,	%l4,	%g5
	fxors	%f10,	%f13,	%f11
	movrgz	%l5,	0x290,	%l1
	edge16l	%l6,	%i4,	%g2
	xnorcc	%o6,	0x057B,	%o1
	xnor	%i7,	%o2,	%o7
	fornot1s	%f1,	%f14,	%f13
	array8	%i3,	%i1,	%o5
	fmovdneg	%xcc,	%f10,	%f1
	xnorcc	%i2,	0x09A9,	%g6
	movleu	%icc,	%i6,	%l0
	ldd	[%l7 + 0x70],	%g0
	add	%g4,	%o0,	%l2
	mulscc	%i5,	%o3,	%l3
	fmovdne	%xcc,	%f13,	%f1
	fmovsge	%icc,	%f14,	%f11
	movvs	%xcc,	%g7,	%g3
	orncc	%i0,	0x0A1B,	%o4
	restore %l4, 0x02A8, %l5
	umulcc	%l1,	0x07F2,	%g5
	stw	%i4,	[%l7 + 0x0C]
	stb	%g2,	[%l7 + 0x70]
	fpsub16	%f14,	%f12,	%f10
	fmovrdgez	%l6,	%f12,	%f10
	fpsub16s	%f15,	%f4,	%f10
	fabsd	%f12,	%f14
	movrlez	%o1,	%i7,	%o6
	lduh	[%l7 + 0x4A],	%o7
	ldd	[%l7 + 0x08],	%f10
	movge	%xcc,	%o2,	%i1
	fmovrse	%i3,	%f8,	%f15
	lduw	[%l7 + 0x68],	%o5
	srl	%g6,	%i2,	%i6
	movg	%icc,	%l0,	%g1
	edge8ln	%g4,	%o0,	%l2
	movrne	%i5,	0x249,	%o3
	xorcc	%l3,	0x09E7,	%g7
	addc	%g3,	%i0,	%o4
	sdivx	%l5,	0x0BDA,	%l1
	and	%g5,	%l4,	%i4
	restore %g2, %o1, %l6
	edge8l	%i7,	%o7,	%o6
	fmovrsne	%o2,	%f13,	%f6
	fcmple16	%f8,	%f8,	%i3
	srl	%o5,	%g6,	%i1
	array32	%i2,	%l0,	%i6
	save %g1, %g4, %o0
	xorcc	%l2,	%i5,	%o3
	addc	%l3,	0x10CF,	%g7
	fmovrslez	%i0,	%f6,	%f0
	fxors	%f2,	%f5,	%f15
	movre	%o4,	0x1F1,	%g3
	sra	%l1,	0x0E,	%l5
	fmovspos	%xcc,	%f10,	%f2
	movvs	%icc,	%l4,	%g5
	sdivx	%i4,	0x1C56,	%g2
	ldub	[%l7 + 0x19],	%o1
	movrne	%i7,	0x05E,	%l6
	andn	%o7,	0x1A2B,	%o6
	fmovse	%xcc,	%f10,	%f0
	fxors	%f0,	%f11,	%f1
	movvc	%xcc,	%o2,	%o5
	fmovsgu	%xcc,	%f15,	%f10
	edge8n	%g6,	%i1,	%i2
	umulcc	%l0,	%i6,	%g1
	fnegs	%f7,	%f8
	xor	%i3,	0x044C,	%o0
	siam	0x1
	movne	%icc,	%l2,	%g4
	xor	%i5,	0x0583,	%l3
	umul	%o3,	%i0,	%o4
	movn	%icc,	%g7,	%g3
	fmovrslz	%l5,	%f10,	%f0
	std	%f12,	[%l7 + 0x50]
	fpsub16s	%f15,	%f12,	%f15
	edge16l	%l1,	%g5,	%l4
	fnot1	%f8,	%f8
	andncc	%g2,	%i4,	%o1
	stw	%l6,	[%l7 + 0x14]
	fpsub32s	%f5,	%f2,	%f9
	srax	%o7,	%i7,	%o2
	sdiv	%o6,	0x0B44,	%o5
	orn	%i1,	%g6,	%l0
	sethi	0x1515,	%i6
	movl	%xcc,	%i2,	%g1
	and	%i3,	%o0,	%l2
	andncc	%i5,	%l3,	%g4
	mulx	%i0,	0x0059,	%o3
	array8	%g7,	%g3,	%l5
	sllx	%l1,	0x03,	%g5
	movcs	%icc,	%o4,	%g2
	edge8n	%i4,	%o1,	%l6
	ldx	[%l7 + 0x50],	%o7
	addccc	%l4,	0x03C2,	%i7
	restore %o2, %o6, %o5
	lduw	[%l7 + 0x3C],	%g6
	addcc	%i1,	0x05F6,	%i6
	fnands	%f13,	%f1,	%f1
	addc	%l0,	%g1,	%i2
	ldsb	[%l7 + 0x0F],	%i3
	fmovdpos	%xcc,	%f10,	%f12
	stx	%o0,	[%l7 + 0x78]
	fpadd32	%f10,	%f10,	%f0
	fsrc1	%f12,	%f10
	ldsb	[%l7 + 0x48],	%l2
	srl	%l3,	%i5,	%i0
	fmovrdgz	%o3,	%f10,	%f12
	fmul8x16al	%f14,	%f5,	%f6
	sll	%g7,	0x1A,	%g3
	and	%l5,	%g4,	%g5
	edge8ln	%l1,	%o4,	%g2
	sdiv	%o1,	0x186D,	%i4
	orn	%l6,	%l4,	%o7
	alignaddrl	%i7,	%o6,	%o5
	fpsub16s	%f11,	%f13,	%f2
	orn	%o2,	%i1,	%i6
	andn	%g6,	0x1141,	%g1
	ldx	[%l7 + 0x30],	%l0
	ld	[%l7 + 0x68],	%f10
	movn	%icc,	%i3,	%i2
	xor	%o0,	%l2,	%i5
	sdivcc	%i0,	0x1CA1,	%o3
	movcc	%icc,	%l3,	%g7
	subcc	%l5,	0x0AE6,	%g4
	lduh	[%l7 + 0x54],	%g3
	movre	%g5,	0x19E,	%o4
	movl	%icc,	%l1,	%g2
	or	%i4,	0x1917,	%l6
	smul	%l4,	%o7,	%o1
	udivcc	%i7,	0x1007,	%o5
	popc	0x1283,	%o2
	movrne	%o6,	%i6,	%g6
	siam	0x6
	fmovdge	%icc,	%f0,	%f5
	addc	%i1,	0x0A98,	%g1
	fmovscc	%xcc,	%f12,	%f11
	xor	%i3,	0x18C2,	%l0
	fornot2s	%f8,	%f12,	%f5
	orcc	%o0,	0x1562,	%l2
	movrlz	%i2,	0x198,	%i0
	smul	%i5,	%o3,	%l3
	movcs	%icc,	%l5,	%g4
	andcc	%g3,	0x0D65,	%g5
	sdivx	%o4,	0x1DBA,	%l1
	mulx	%g7,	%g2,	%i4
	movre	%l6,	0x261,	%l4
	ldsw	[%l7 + 0x0C],	%o7
	movg	%xcc,	%o1,	%o5
	smul	%o2,	0x16AD,	%o6
	fornot2s	%f11,	%f1,	%f9
	movrgz	%i6,	%g6,	%i7
	add	%i1,	%g1,	%l0
	ldd	[%l7 + 0x50],	%i2
	sth	%o0,	[%l7 + 0x50]
	lduw	[%l7 + 0x70],	%i2
	array8	%i0,	%l2,	%i5
	udivcc	%o3,	0x1932,	%l5
	fmovdne	%xcc,	%f12,	%f2
	orn	%l3,	0x1DEE,	%g4
	movg	%xcc,	%g5,	%o4
	subc	%g3,	%g7,	%l1
	fmovdvc	%icc,	%f15,	%f6
	movcc	%icc,	%g2,	%i4
	stx	%l4,	[%l7 + 0x30]
	movne	%icc,	%o7,	%l6
	edge8ln	%o1,	%o2,	%o6
	mova	%icc,	%i6,	%g6
	andncc	%i7,	%i1,	%g1
	movle	%xcc,	%o5,	%i3
	stx	%o0,	[%l7 + 0x08]
	movrlez	%l0,	0x3F0,	%i2
	fcmpgt32	%f10,	%f8,	%i0
	fmovscc	%icc,	%f12,	%f2
	fmovrdlz	%l2,	%f6,	%f6
	orncc	%i5,	%o3,	%l5
	sth	%l3,	[%l7 + 0x1E]
	fcmple32	%f14,	%f14,	%g5
	lduh	[%l7 + 0x7A],	%o4
	srlx	%g3,	%g4,	%g7
	fmul8x16	%f2,	%f0,	%f4
	movpos	%xcc,	%l1,	%i4
	fabsd	%f14,	%f4
	fmovsvs	%icc,	%f8,	%f0
	subccc	%l4,	%o7,	%l6
	xnor	%g2,	0x1B2E,	%o2
	edge16ln	%o6,	%i6,	%o1
	edge32n	%i7,	%i1,	%g1
	udivx	%g6,	0x0870,	%i3
	fcmple16	%f2,	%f10,	%o5
	edge32n	%l0,	%i2,	%i0
	fornot1s	%f1,	%f9,	%f11
	srlx	%o0,	%i5,	%o3
	movleu	%icc,	%l5,	%l3
	edge8	%l2,	%g5,	%o4
	move	%xcc,	%g3,	%g4
	fmul8x16au	%f13,	%f15,	%f0
	subc	%l1,	0x126B,	%i4
	addc	%g7,	0x164F,	%o7
	fmovdneg	%icc,	%f11,	%f13
	fcmped	%fcc0,	%f12,	%f8
	movn	%icc,	%l6,	%g2
	fmovdcc	%xcc,	%f9,	%f12
	movrgez	%o2,	0x257,	%l4
	fmovdle	%xcc,	%f1,	%f5
	for	%f0,	%f4,	%f10
	movne	%xcc,	%o6,	%i6
	fmovsn	%icc,	%f8,	%f15
	ldd	[%l7 + 0x70],	%i6
	fsrc2s	%f7,	%f2
	edge16l	%i1,	%g1,	%o1
	ldsb	[%l7 + 0x18],	%i3
	movrlz	%g6,	%l0,	%i2
	move	%xcc,	%o5,	%i0
	addc	%o0,	%o3,	%i5
	xnorcc	%l5,	%l2,	%l3
	ldsb	[%l7 + 0x5F],	%g5
	movrgz	%o4,	0x203,	%g4
	array32	%l1,	%i4,	%g7
	movle	%icc,	%o7,	%g3
	array8	%l6,	%g2,	%l4
	fpadd32s	%f13,	%f10,	%f12
	mova	%xcc,	%o2,	%o6
	lduh	[%l7 + 0x16],	%i6
	edge16l	%i7,	%g1,	%i1
	alignaddrl	%i3,	%o1,	%l0
	edge16ln	%i2,	%g6,	%o5
	edge8l	%i0,	%o0,	%i5
	sdiv	%l5,	0x1DD0,	%o3
	smul	%l3,	0x12F2,	%l2
	ldub	[%l7 + 0x34],	%o4
	andn	%g4,	%g5,	%l1
	add	%i4,	0x17F7,	%o7
	movre	%g7,	%l6,	%g2
	fmul8x16	%f10,	%f4,	%f2
	srlx	%l4,	0x16,	%g3
	fmovdcs	%xcc,	%f5,	%f14
	fmovsleu	%xcc,	%f1,	%f15
	addcc	%o6,	%i6,	%i7
	udivcc	%g1,	0x1732,	%o2
	ldd	[%l7 + 0x50],	%i0
	movrlez	%i3,	0x389,	%l0
	fmovscs	%xcc,	%f0,	%f12
	movvs	%xcc,	%o1,	%g6
	ldsb	[%l7 + 0x1F],	%o5
	std	%f0,	[%l7 + 0x60]
	fmovscs	%icc,	%f6,	%f6
	movpos	%icc,	%i2,	%i0
	fmul8x16al	%f4,	%f1,	%f0
	edge16ln	%i5,	%o0,	%o3
	move	%xcc,	%l3,	%l5
	fcmpd	%fcc2,	%f0,	%f8
	fmovrse	%l2,	%f14,	%f2
	edge8	%o4,	%g5,	%l1
	array8	%i4,	%g4,	%g7
	edge16n	%l6,	%g2,	%l4
	subccc	%g3,	0x146E,	%o6
	movn	%xcc,	%i6,	%i7
	or	%o7,	0x07EB,	%g1
	xnor	%i1,	0x1D65,	%i3
	fmovrdlz	%l0,	%f6,	%f0
	movleu	%xcc,	%o1,	%o2
	fmovrslz	%g6,	%f8,	%f7
	fmovrdgz	%o5,	%f8,	%f6
	movrlz	%i2,	0x168,	%i0
	movrne	%i5,	%o0,	%o3
	subcc	%l3,	0x0513,	%l5
	udivx	%o4,	0x0A9F,	%l2
	movvs	%icc,	%g5,	%l1
	ldd	[%l7 + 0x28],	%i4
	sllx	%g4,	%l6,	%g7
	sll	%g2,	0x06,	%l4
	fmovdgu	%icc,	%f11,	%f12
	mova	%xcc,	%g3,	%o6
	edge16n	%i7,	%i6,	%o7
	fzeros	%f7
	movne	%xcc,	%i1,	%g1
	movvs	%xcc,	%i3,	%l0
	fmovsneg	%xcc,	%f9,	%f8
	stb	%o1,	[%l7 + 0x4E]
	ldd	[%l7 + 0x30],	%g6
	fmovrdgz	%o5,	%f12,	%f6
	fandnot2s	%f6,	%f13,	%f13
	fmovsl	%icc,	%f6,	%f12
	movrgz	%i2,	%o2,	%i5
	fnor	%f0,	%f6,	%f0
	fmovrdlz	%o0,	%f2,	%f8
	stb	%o3,	[%l7 + 0x75]
	subc	%l3,	%i0,	%o4
	fmovsleu	%xcc,	%f0,	%f3
	popc	%l5,	%g5
	fmovrdgez	%l1,	%f8,	%f2
	xnor	%l2,	0x0299,	%i4
	srlx	%l6,	0x0F,	%g7
	alignaddrl	%g4,	%l4,	%g3
	mulscc	%o6,	%i7,	%g2
	array32	%i6,	%i1,	%o7
	lduh	[%l7 + 0x26],	%i3
	movvc	%xcc,	%g1,	%o1
	addc	%g6,	0x0CAD,	%l0
	andn	%i2,	0x1DAC,	%o2
	ldsb	[%l7 + 0x41],	%i5
	movg	%icc,	%o0,	%o5
	subc	%l3,	0x10D1,	%o3
	umul	%o4,	0x1E8E,	%l5
	movvc	%xcc,	%i0,	%g5
	stb	%l2,	[%l7 + 0x09]
	fsrc2	%f4,	%f10
	edge8	%i4,	%l1,	%l6
	edge8	%g7,	%l4,	%g4
	xor	%o6,	0x07B5,	%i7
	fcmpgt16	%f4,	%f4,	%g2
	movvc	%icc,	%i6,	%g3
	fmul8sux16	%f14,	%f8,	%f12
	movrlez	%i1,	0x0BA,	%o7
	fmovde	%icc,	%f15,	%f6
	fpsub16s	%f7,	%f9,	%f10
	ldub	[%l7 + 0x6C],	%i3
	udiv	%o1,	0x1D12,	%g1
	lduw	[%l7 + 0x58],	%g6
	movpos	%icc,	%i2,	%o2
	movl	%icc,	%l0,	%o0
	smul	%i5,	%o5,	%l3
	fmovse	%xcc,	%f13,	%f6
	ld	[%l7 + 0x38],	%f8
	bshuffle	%f8,	%f12,	%f4
	edge8	%o3,	%l5,	%i0
	udiv	%o4,	0x03AB,	%g5
	udivx	%l2,	0x034C,	%l1
	xnor	%i4,	%l6,	%g7
	subc	%g4,	0x034B,	%o6
	movcs	%icc,	%l4,	%i7
	edge16ln	%i6,	%g2,	%i1
	fmovdle	%xcc,	%f9,	%f12
	fcmpgt32	%f10,	%f12,	%g3
	ldsh	[%l7 + 0x3A],	%o7
	movrlez	%i3,	%o1,	%g6
	ldsw	[%l7 + 0x24],	%i2
	or	%o2,	%g1,	%o0
	umulcc	%l0,	%i5,	%o5
	stx	%l3,	[%l7 + 0x28]
	restore %o3, 0x0231, %l5
	fmovrdne	%i0,	%f4,	%f8
	xnorcc	%g5,	0x035C,	%o4
	orcc	%l2,	0x146E,	%l1
	stx	%i4,	[%l7 + 0x28]
	edge16	%g7,	%g4,	%l6
	std	%f14,	[%l7 + 0x30]
	fmovrslez	%o6,	%f13,	%f3
	fmovda	%icc,	%f10,	%f5
	smulcc	%l4,	0x060D,	%i7
	fmovscc	%xcc,	%f12,	%f6
	stb	%g2,	[%l7 + 0x52]
	movleu	%xcc,	%i6,	%i1
	array32	%g3,	%i3,	%o1
	pdist	%f10,	%f0,	%f12
	movcs	%xcc,	%o7,	%g6
	fnors	%f9,	%f15,	%f14
	edge8	%i2,	%g1,	%o0
	lduh	[%l7 + 0x5A],	%o2
	ldsw	[%l7 + 0x6C],	%i5
	fmul8x16al	%f3,	%f6,	%f4
	edge32ln	%o5,	%l0,	%l3
	edge16l	%o3,	%i0,	%l5
	ldd	[%l7 + 0x68],	%g4
	andn	%l2,	%o4,	%l1
	movge	%xcc,	%i4,	%g4
	fsrc2	%f8,	%f0
	smulcc	%g7,	%o6,	%l4
	movg	%icc,	%i7,	%g2
	movg	%xcc,	%l6,	%i6
	movvs	%xcc,	%i1,	%i3
	addccc	%o1,	0x1FB5,	%o7
	ldub	[%l7 + 0x30],	%g6
	restore %i2, %g1, %g3
	array32	%o0,	%i5,	%o2
	fcmped	%fcc2,	%f4,	%f10
	or	%l0,	0x04BC,	%l3
	smulcc	%o5,	0x0091,	%o3
	movg	%icc,	%l5,	%g5
	ldsh	[%l7 + 0x74],	%l2
	srlx	%i0,	%l1,	%o4
	move	%xcc,	%i4,	%g7
	srlx	%o6,	0x0A,	%l4
	edge32l	%i7,	%g2,	%l6
	fmovrsne	%g4,	%f6,	%f4
	ldd	[%l7 + 0x68],	%f12
	movge	%xcc,	%i1,	%i6
	bshuffle	%f0,	%f6,	%f4
	sdiv	%o1,	0x0079,	%o7
	movrlez	%i3,	0x079,	%i2
	ldsh	[%l7 + 0x5E],	%g1
	ldsh	[%l7 + 0x7E],	%g6
	movvs	%icc,	%g3,	%o0
	orcc	%o2,	%i5,	%l0
	udivx	%l3,	0x0718,	%o5
	fmovrslez	%l5,	%f11,	%f7
	ldub	[%l7 + 0x12],	%g5
	edge8	%l2,	%i0,	%o3
	lduw	[%l7 + 0x14],	%l1
	movpos	%xcc,	%o4,	%i4
	fcmpgt16	%f4,	%f4,	%g7
	restore %l4, 0x0314, %i7
	movre	%g2,	%l6,	%g4
	fornot1	%f0,	%f0,	%f12
	edge32ln	%o6,	%i1,	%i6
	edge16	%o7,	%o1,	%i2
	fmovrdlz	%g1,	%f4,	%f8
	xnorcc	%g6,	%g3,	%i3
	movrne	%o0,	%o2,	%l0
	array32	%i5,	%l3,	%l5
	sdivcc	%o5,	0x109B,	%g5
	subc	%l2,	0x08E1,	%i0
	alignaddr	%l1,	%o3,	%o4
	edge8	%i4,	%g7,	%i7
	movcs	%xcc,	%g2,	%l4
	movrgz	%g4,	0x39F,	%o6
	ldsb	[%l7 + 0x17],	%l6
	save %i6, %o7, %i1
	srl	%i2,	0x19,	%g1
	ldd	[%l7 + 0x48],	%g6
	edge16	%g3,	%i3,	%o0
	andn	%o1,	%o2,	%l0
	ldsb	[%l7 + 0x6D],	%l3
	edge8	%i5,	%l5,	%o5
	alignaddr	%l2,	%i0,	%l1
	fmovrslz	%o3,	%f6,	%f7
	and	%g5,	%o4,	%g7
	addcc	%i7,	%g2,	%l4
	edge8	%g4,	%i4,	%o6
	std	%f2,	[%l7 + 0x78]
	orn	%i6,	0x11CF,	%l6
	fmovsa	%xcc,	%f5,	%f13
	fnor	%f0,	%f0,	%f6
	subccc	%i1,	0x0668,	%i2
	stb	%o7,	[%l7 + 0x4E]
	andcc	%g6,	%g3,	%i3
	ldsb	[%l7 + 0x37],	%o0
	movrlez	%o1,	%g1,	%l0
	smul	%o2,	0x1458,	%i5
	movn	%icc,	%l5,	%l3
	fxor	%f6,	%f8,	%f10
	and	%o5,	%l2,	%l1
	lduh	[%l7 + 0x5E],	%o3
	movle	%xcc,	%g5,	%o4
	movl	%icc,	%g7,	%i0
	movvs	%xcc,	%i7,	%g2
	fmovsleu	%xcc,	%f15,	%f11
	udiv	%g4,	0x001B,	%l4
	mulscc	%i4,	%i6,	%o6
	edge8	%l6,	%i1,	%o7
	movn	%xcc,	%g6,	%g3
	mulscc	%i3,	0x1718,	%o0
	smul	%o1,	0x17CA,	%g1
	ldub	[%l7 + 0x0B],	%i2
	sdivcc	%o2,	0x1546,	%i5
	xorcc	%l0,	%l5,	%l3
	edge16l	%l2,	%l1,	%o3
	fmovd	%f4,	%f12
	fmovdn	%icc,	%f0,	%f7
	xor	%g5,	%o5,	%g7
	fnors	%f3,	%f0,	%f7
	fmul8ulx16	%f4,	%f14,	%f12
	subccc	%i0,	%o4,	%g2
	popc	%g4,	%l4
	stx	%i7,	[%l7 + 0x60]
	add	%i6,	%i4,	%l6
	edge8l	%o6,	%o7,	%i1
	fmovdneg	%icc,	%f11,	%f6
	fmul8x16al	%f5,	%f6,	%f10
	fsrc2s	%f4,	%f7
	sll	%g3,	%g6,	%o0
	ld	[%l7 + 0x44],	%f1
	movn	%icc,	%o1,	%i3
	mova	%xcc,	%g1,	%o2
	sth	%i2,	[%l7 + 0x08]
	movrlez	%i5,	0x197,	%l0
	fmovrdne	%l5,	%f14,	%f14
	movcc	%icc,	%l2,	%l3
	movge	%xcc,	%l1,	%o3
	movcs	%icc,	%g5,	%o5
	andncc	%i0,	%g7,	%g2
	fmovs	%f11,	%f0
	fmul8ulx16	%f6,	%f6,	%f12
	ldd	[%l7 + 0x28],	%f0
	edge8ln	%g4,	%l4,	%i7
	sth	%o4,	[%l7 + 0x6E]
	ldsh	[%l7 + 0x0E],	%i4
	lduw	[%l7 + 0x38],	%i6
	edge32	%o6,	%o7,	%l6
	ldsb	[%l7 + 0x34],	%i1
	movge	%icc,	%g3,	%g6
	movrlez	%o0,	0x26A,	%o1
	fzero	%f2
	lduh	[%l7 + 0x6A],	%g1
	ldsb	[%l7 + 0x38],	%i3
	movg	%xcc,	%i2,	%o2
	udivcc	%l0,	0x1D13,	%i5
	fmovrsgez	%l2,	%f14,	%f5
	edge16ln	%l3,	%l5,	%o3
	stb	%g5,	[%l7 + 0x37]
	sth	%o5,	[%l7 + 0x14]
	movpos	%xcc,	%i0,	%l1
	fmovda	%icc,	%f14,	%f11
	smulcc	%g2,	%g7,	%l4
	st	%f11,	[%l7 + 0x68]
	srax	%g4,	%i7,	%i4
	udiv	%i6,	0x15B9,	%o4
	fnegd	%f0,	%f2
	subccc	%o7,	0x0A09,	%o6
	fcmps	%fcc2,	%f3,	%f10
	stb	%i1,	[%l7 + 0x65]
	fpadd16s	%f1,	%f9,	%f7
	sllx	%g3,	0x14,	%l6
	fmovdleu	%xcc,	%f14,	%f5
	movcc	%xcc,	%o0,	%o1
	stx	%g6,	[%l7 + 0x50]
	edge16l	%i3,	%g1,	%o2
	fmovrse	%i2,	%f8,	%f0
	lduw	[%l7 + 0x60],	%l0
	fcmpeq32	%f4,	%f12,	%l2
	xorcc	%i5,	%l5,	%l3
	mulx	%g5,	%o5,	%o3
	srax	%i0,	%l1,	%g2
	fmovdn	%icc,	%f14,	%f9
	movre	%l4,	0x343,	%g7
	movre	%g4,	0x105,	%i7
	orn	%i4,	0x02F8,	%o4
	udivcc	%i6,	0x125E,	%o7
	movcc	%icc,	%i1,	%o6
	st	%f6,	[%l7 + 0x70]
	smul	%g3,	0x062B,	%o0
	edge16n	%l6,	%g6,	%i3
	edge32l	%o1,	%g1,	%i2
	edge16	%o2,	%l2,	%i5
	xorcc	%l0,	%l5,	%g5
	fmovdge	%xcc,	%f15,	%f10
	array16	%l3,	%o5,	%o3
	ldx	[%l7 + 0x48],	%l1
	movrgz	%g2,	0x296,	%l4
	lduw	[%l7 + 0x30],	%g7
	save %i0, 0x1FCC, %g4
	addcc	%i4,	%i7,	%o4
	sdiv	%o7,	0x02E5,	%i1
	ldsh	[%l7 + 0x5E],	%o6
	fandnot2	%f2,	%f14,	%f12
	fmovdle	%icc,	%f15,	%f9
	srlx	%i6,	%o0,	%l6
	movg	%xcc,	%g3,	%i3
	edge32	%g6,	%o1,	%g1
	xnor	%o2,	%i2,	%l2
	fors	%f11,	%f0,	%f3
	edge32ln	%l0,	%l5,	%i5
	movle	%icc,	%g5,	%o5
	alignaddrl	%l3,	%l1,	%o3
	movgu	%icc,	%l4,	%g2
	fpadd32	%f12,	%f6,	%f2
	movleu	%icc,	%i0,	%g7
	ldsb	[%l7 + 0x11],	%i4
	or	%i7,	%g4,	%o4
	mova	%icc,	%o7,	%o6
	subccc	%i6,	0x0631,	%i1
	array32	%o0,	%l6,	%i3
	orncc	%g6,	%o1,	%g3
	fnot1	%f4,	%f6
	movrgez	%g1,	0x2FF,	%i2
	fmul8x16au	%f0,	%f7,	%f14
	xorcc	%l2,	0x0DCF,	%o2
	edge8	%l0,	%l5,	%i5
	fnegd	%f14,	%f12
	sdiv	%o5,	0x1A39,	%g5
	fmovdneg	%xcc,	%f10,	%f2
	addccc	%l3,	%o3,	%l1
	edge32n	%g2,	%i0,	%l4
	orn	%i4,	%i7,	%g7
	or	%g4,	%o7,	%o4
	edge8l	%i6,	%o6,	%i1
	stb	%o0,	[%l7 + 0x37]
	stx	%l6,	[%l7 + 0x08]
	ldd	[%l7 + 0x58],	%f14
	edge8	%g6,	%o1,	%g3
	fmovdvc	%xcc,	%f5,	%f4
	ldx	[%l7 + 0x08],	%i3
	fexpand	%f4,	%f0
	srl	%i2,	0x13,	%g1
	udivcc	%l2,	0x1BBD,	%l0
	sra	%o2,	%i5,	%o5
	add	%l5,	0x1B4F,	%l3
	edge32l	%o3,	%g5,	%g2
	andcc	%l1,	0x02B3,	%l4
	fzeros	%f13
	movne	%xcc,	%i0,	%i7
	fcmpne32	%f14,	%f2,	%i4
	sth	%g7,	[%l7 + 0x6C]
	fxnor	%f2,	%f0,	%f2
	edge32l	%g4,	%o7,	%i6
	orn	%o6,	%i1,	%o4
	orcc	%o0,	%l6,	%g6
	movcs	%xcc,	%o1,	%i3
	for	%f12,	%f6,	%f10
	srlx	%i2,	0x1C,	%g1
	umul	%g3,	%l0,	%l2
	udivcc	%i5,	0x15D9,	%o2
	fmovdleu	%xcc,	%f12,	%f12
	sethi	0x047D,	%l5
	xor	%o5,	0x1942,	%o3
	movleu	%xcc,	%l3,	%g2
	stw	%l1,	[%l7 + 0x7C]
	addccc	%g5,	%l4,	%i0
	fmovdcc	%xcc,	%f4,	%f8
	array32	%i4,	%i7,	%g4
	orncc	%o7,	%i6,	%o6
	sdivcc	%i1,	0x0C4B,	%g7
	movcc	%xcc,	%o0,	%l6
	movrlz	%o4,	%o1,	%g6
	ld	[%l7 + 0x5C],	%f7
	orncc	%i2,	%g1,	%g3
	andcc	%l0,	0x180C,	%l2
	smulcc	%i5,	0x0BD5,	%o2
	udivx	%l5,	0x0F11,	%o5
	fors	%f10,	%f1,	%f3
	array8	%o3,	%i3,	%l3
	mova	%icc,	%g2,	%g5
	movcc	%xcc,	%l1,	%i0
	umulcc	%l4,	%i4,	%i7
	stw	%g4,	[%l7 + 0x40]
	fnand	%f10,	%f14,	%f8
	edge32l	%i6,	%o7,	%i1
	edge8l	%g7,	%o6,	%o0
	edge32l	%l6,	%o4,	%o1
	fmovsleu	%icc,	%f6,	%f10
	ld	[%l7 + 0x40],	%f2
	movrlez	%g6,	%g1,	%g3
	fmovdleu	%xcc,	%f1,	%f11
	save %i2, 0x0E32, %l0
	ldsw	[%l7 + 0x6C],	%i5
	srl	%l2,	0x1B,	%l5
	lduw	[%l7 + 0x6C],	%o5
	fone	%f12
	array8	%o3,	%o2,	%i3
	edge16n	%l3,	%g5,	%l1
	fcmpes	%fcc3,	%f1,	%f3
	edge32ln	%i0,	%g2,	%i4
	stw	%i7,	[%l7 + 0x10]
	array8	%g4,	%l4,	%o7
	sdivx	%i6,	0x0BDA,	%i1
	sethi	0x0946,	%g7
	edge32n	%o0,	%l6,	%o6
	fxor	%f2,	%f6,	%f6
	fmovdpos	%xcc,	%f15,	%f2
	ldx	[%l7 + 0x38],	%o1
	sethi	0x1E01,	%g6
	fsrc1	%f8,	%f2
	edge8ln	%o4,	%g1,	%g3
	fmovspos	%xcc,	%f9,	%f7
	mova	%icc,	%i2,	%l0
	addc	%i5,	0x19F3,	%l2
	fmovdcs	%icc,	%f7,	%f11
	fabss	%f2,	%f1
	movvs	%icc,	%l5,	%o5
	smul	%o3,	0x1203,	%i3
	smul	%l3,	%o2,	%g5
	movl	%xcc,	%i0,	%l1
	sth	%g2,	[%l7 + 0x4E]
	ldx	[%l7 + 0x70],	%i7
	andcc	%g4,	%i4,	%l4
	fnot2	%f12,	%f6
	fmovrsgz	%i6,	%f11,	%f8
	umulcc	%i1,	%g7,	%o0
	movvc	%icc,	%o7,	%l6
	edge16ln	%o1,	%g6,	%o4
	fnegd	%f8,	%f0
	orncc	%o6,	%g1,	%g3
	smulcc	%l0,	%i2,	%l2
	fnand	%f4,	%f12,	%f14
	and	%i5,	0x001A,	%l5
	sllx	%o3,	%o5,	%i3
	fpack16	%f14,	%f6
	ldsh	[%l7 + 0x4A],	%l3
	movne	%icc,	%o2,	%i0
	sra	%l1,	0x07,	%g2
	movvc	%xcc,	%i7,	%g5
	mulx	%i4,	0x0F9B,	%l4
	edge32n	%i6,	%i1,	%g7
	edge16ln	%o0,	%o7,	%g4
	sra	%l6,	%g6,	%o4
	movpos	%xcc,	%o1,	%o6
	ldsw	[%l7 + 0x44],	%g3
	sdivcc	%g1,	0x0F24,	%l0
	sra	%i2,	%l2,	%i5
	fcmped	%fcc3,	%f14,	%f14
	edge8n	%l5,	%o5,	%o3
	fexpand	%f2,	%f4
	mulx	%i3,	0x1839,	%o2
	move	%xcc,	%i0,	%l1
	smul	%l3,	%i7,	%g2
	andcc	%i4,	0x18B5,	%l4
	edge32	%i6,	%g5,	%g7
	ldsh	[%l7 + 0x7E],	%o0
	xor	%i1,	%o7,	%l6
	xnorcc	%g6,	0x1676,	%o4
	movrgez	%o1,	%g4,	%o6
	sth	%g1,	[%l7 + 0x5E]
	edge8l	%g3,	%i2,	%l2
	fcmpgt32	%f10,	%f2,	%l0
	fpsub32	%f4,	%f0,	%f6
	edge32	%l5,	%i5,	%o5
	array8	%i3,	%o3,	%i0
	movrlz	%o2,	%l1,	%l3
	xor	%g2,	%i4,	%l4
	fsrc2s	%f11,	%f2
	st	%f14,	[%l7 + 0x14]
	fmul8x16au	%f0,	%f10,	%f14
	fmovdge	%icc,	%f1,	%f5
	udivcc	%i7,	0x1003,	%i6
	ldd	[%l7 + 0x68],	%g6
	udiv	%g5,	0x0D94,	%i1
	bshuffle	%f6,	%f2,	%f2
	fmovsl	%xcc,	%f12,	%f15
	ldd	[%l7 + 0x60],	%o6
	mulscc	%o0,	0x0A56,	%l6
	fmovsle	%xcc,	%f11,	%f2
	st	%f2,	[%l7 + 0x34]
	edge8l	%o4,	%g6,	%g4
	fmovd	%f6,	%f12
	fone	%f2
	fandnot1s	%f1,	%f13,	%f10
	movrgez	%o1,	0x2D4,	%o6
	lduh	[%l7 + 0x1A],	%g1
	ldsb	[%l7 + 0x35],	%i2
	sth	%l2,	[%l7 + 0x42]
	movleu	%xcc,	%g3,	%l0
	movre	%i5,	0x013,	%l5
	edge32	%i3,	%o5,	%i0
	movgu	%icc,	%o2,	%l1
	sdivx	%l3,	0x1B79,	%o3
	fpsub16	%f12,	%f2,	%f14
	andncc	%g2,	%l4,	%i4
	smulcc	%i6,	%g7,	%i7
	ldsh	[%l7 + 0x5E],	%g5
	sethi	0x08FC,	%i1
	srax	%o0,	%o7,	%o4
	fzeros	%f11
	andncc	%g6,	%l6,	%g4
	fmovdle	%icc,	%f4,	%f6
	fsrc2	%f0,	%f2
	fmovdn	%xcc,	%f6,	%f5
	edge8	%o6,	%g1,	%o1
	edge8	%l2,	%i2,	%l0
	sdivx	%g3,	0x1434,	%i5
	movvc	%xcc,	%i3,	%l5
	sra	%i0,	%o2,	%o5
	sra	%l3,	0x16,	%l1
	fmovrse	%g2,	%f6,	%f5
	addc	%l4,	0x1851,	%i4
	ldsw	[%l7 + 0x2C],	%i6
	mulscc	%g7,	%i7,	%o3
	sub	%i1,	%g5,	%o0
	std	%f12,	[%l7 + 0x58]
	array8	%o7,	%o4,	%g6
	xnor	%g4,	0x1F23,	%o6
	lduh	[%l7 + 0x52],	%g1
	lduw	[%l7 + 0x7C],	%l6
	fnot2s	%f12,	%f13
	ldd	[%l7 + 0x20],	%l2
	subccc	%i2,	0x0FF2,	%l0
	movl	%xcc,	%o1,	%g3
	subcc	%i3,	0x01B7,	%l5
	movvs	%xcc,	%i5,	%i0
	movrlez	%o2,	0x1A4,	%o5
	xor	%l3,	0x0A05,	%g2
	st	%f10,	[%l7 + 0x70]
	smulcc	%l1,	0x06ED,	%l4
	fmovrdgez	%i4,	%f4,	%f6
	orcc	%i6,	0x1E69,	%g7
	ld	[%l7 + 0x40],	%f4
	stx	%o3,	[%l7 + 0x38]
	xnor	%i7,	0x075E,	%g5
	fmovdpos	%xcc,	%f0,	%f8
	udiv	%i1,	0x066E,	%o7
	ldsh	[%l7 + 0x26],	%o4
	movneg	%icc,	%g6,	%g4
	sth	%o0,	[%l7 + 0x78]
	andn	%o6,	0x0508,	%g1
	addc	%l2,	0x098C,	%l6
	fmovrdgz	%l0,	%f14,	%f14
	xnorcc	%i2,	%o1,	%i3
	movrlez	%g3,	%l5,	%i0
	fpmerge	%f2,	%f8,	%f8
	fmovsneg	%icc,	%f13,	%f10
	fcmpeq32	%f8,	%f0,	%o2
	xor	%i5,	%o5,	%g2
	edge8	%l1,	%l3,	%i4
	sll	%l4,	%g7,	%o3
	xnorcc	%i6,	%g5,	%i1
	movne	%icc,	%i7,	%o4
	udivcc	%o7,	0x088C,	%g4
	fmovsa	%xcc,	%f0,	%f12
	udivx	%g6,	0x1514,	%o6
	add	%g1,	0x1EF1,	%l2
	sdiv	%o0,	0x1172,	%l0
	ldd	[%l7 + 0x10],	%f12
	array8	%i2,	%o1,	%l6
	mulx	%i3,	0x1FE7,	%g3
	fzero	%f10
	fcmps	%fcc2,	%f12,	%f14
	edge32n	%l5,	%i0,	%i5
	add	%o2,	%o5,	%g2
	stb	%l3,	[%l7 + 0x27]
	fmovspos	%xcc,	%f15,	%f6
	fmovsa	%icc,	%f4,	%f7
	fmovrdgez	%i4,	%f2,	%f8
	edge16ln	%l1,	%g7,	%l4
	save %o3, 0x0B75, %g5
	ldsw	[%l7 + 0x70],	%i6
	sdivcc	%i7,	0x1E11,	%o4
	stb	%o7,	[%l7 + 0x46]
	ldd	[%l7 + 0x28],	%f0
	fpsub32	%f4,	%f4,	%f8
	lduh	[%l7 + 0x4A],	%g4
	movneg	%xcc,	%i1,	%o6
	ldsw	[%l7 + 0x70],	%g6
	movleu	%icc,	%g1,	%l2
	array16	%l0,	%o0,	%i2
	ldsw	[%l7 + 0x58],	%o1
	fmovrdne	%l6,	%f2,	%f0
	edge16ln	%g3,	%l5,	%i3
	movle	%icc,	%i0,	%i5
	ldd	[%l7 + 0x40],	%f12
	movvc	%xcc,	%o2,	%g2
	fmovrslz	%l3,	%f9,	%f13
	edge8ln	%i4,	%l1,	%o5
	sdivx	%l4,	0x1383,	%o3
	movrgz	%g7,	%i6,	%g5
	fmovsa	%icc,	%f6,	%f15
	srax	%o4,	0x08,	%i7
	orncc	%o7,	%i1,	%o6
	addc	%g4,	0x1C30,	%g1
	fmovrdgz	%g6,	%f8,	%f10
	movle	%icc,	%l2,	%l0
	move	%xcc,	%o0,	%i2
	fzeros	%f2
	mulx	%o1,	0x1314,	%l6
	sethi	0x154B,	%g3
	fors	%f15,	%f11,	%f13
	lduh	[%l7 + 0x70],	%i3
	xor	%i0,	0x1E5E,	%i5
	movvc	%icc,	%o2,	%g2
	alignaddr	%l3,	%l5,	%i4
	umulcc	%o5,	%l4,	%o3
	array32	%g7,	%i6,	%l1
	edge8n	%o4,	%g5,	%o7
	array32	%i1,	%o6,	%i7
	fsrc1	%f12,	%f4
	fcmple16	%f10,	%f12,	%g4
	stw	%g6,	[%l7 + 0x3C]
	andn	%g1,	%l0,	%o0
	ldsh	[%l7 + 0x38],	%i2
	alignaddrl	%o1,	%l2,	%l6
	andn	%g3,	0x1A09,	%i3
	move	%xcc,	%i5,	%o2
	sllx	%g2,	%l3,	%i0
	ldsw	[%l7 + 0x54],	%i4
	addccc	%l5,	0x1397,	%o5
	sdivcc	%l4,	0x15AA,	%g7
	srax	%i6,	0x00,	%o3
	fcmpgt32	%f6,	%f0,	%o4
	ldx	[%l7 + 0x10],	%g5
	or	%l1,	0x1A59,	%o7
	fmovsneg	%icc,	%f10,	%f0
	movvs	%xcc,	%i1,	%i7
	subccc	%g4,	%o6,	%g6
	subcc	%g1,	0x0F46,	%l0
	stx	%i2,	[%l7 + 0x10]
	and	%o0,	%l2,	%l6
	subcc	%o1,	%i3,	%g3
	sdivx	%o2,	0x0636,	%i5
	movpos	%icc,	%l3,	%g2
	fmovdpos	%xcc,	%f8,	%f11
	fmovrdlez	%i0,	%f10,	%f14
	edge32ln	%i4,	%o5,	%l5
	edge16	%l4,	%g7,	%o3
	addcc	%o4,	0x1B80,	%g5
	smulcc	%l1,	0x1614,	%i6
	ldub	[%l7 + 0x55],	%o7
	edge16l	%i7,	%g4,	%i1
	movre	%o6,	0x05D,	%g6
	fcmpeq16	%f8,	%f12,	%l0
	orcc	%g1,	%i2,	%l2
	fmovrsgez	%o0,	%f3,	%f13
	sub	%l6,	%o1,	%i3
	movn	%xcc,	%g3,	%i5
	sub	%l3,	0x0FC3,	%g2
	andncc	%o2,	%i4,	%i0
	movle	%icc,	%l5,	%l4
	orn	%g7,	%o3,	%o5
	edge8l	%g5,	%l1,	%i6
	addccc	%o4,	%i7,	%g4
	fsrc1s	%f2,	%f14
	smul	%i1,	%o6,	%g6
	xnor	%o7,	%g1,	%l0
	movrgz	%l2,	0x2A8,	%o0
	restore %l6, 0x020A, %i2
	bshuffle	%f8,	%f2,	%f14
	subc	%o1,	%g3,	%i5
	st	%f5,	[%l7 + 0x68]
	sllx	%i3,	%l3,	%g2
	subcc	%i4,	0x1017,	%o2
	popc	%i0,	%l5
	movleu	%xcc,	%l4,	%o3
	restore %o5, 0x0DA2, %g5
	udivcc	%l1,	0x122B,	%g7
	smulcc	%i6,	0x1B4A,	%i7
	addc	%o4,	%i1,	%o6
	andcc	%g6,	%o7,	%g4
	subcc	%g1,	0x00A8,	%l2
	ld	[%l7 + 0x30],	%f11
	st	%f8,	[%l7 + 0x2C]
	movpos	%xcc,	%l0,	%o0
	ldd	[%l7 + 0x48],	%f4
	orn	%i2,	0x0BE9,	%l6
	umulcc	%o1,	%i5,	%g3
	sdivx	%l3,	0x03B8,	%g2
	sth	%i3,	[%l7 + 0x4C]
	movge	%xcc,	%o2,	%i4
	ldx	[%l7 + 0x38],	%l5
	and	%i0,	0x0148,	%l4
	edge32	%o3,	%g5,	%o5
	subccc	%l1,	0x031C,	%g7
	srl	%i6,	0x1A,	%o4
	ld	[%l7 + 0x10],	%f2
	xor	%i7,	%o6,	%i1
	srax	%o7,	%g6,	%g4
	movn	%icc,	%l2,	%l0
	ldd	[%l7 + 0x60],	%g0
	fmovrsne	%o0,	%f3,	%f12
	movrgz	%i2,	%l6,	%o1
	fmovdl	%icc,	%f13,	%f5
	fpsub32s	%f12,	%f0,	%f10
	sethi	0x0970,	%g3
	fmuld8sux16	%f3,	%f8,	%f10
	udivcc	%i5,	0x02B9,	%g2
	movgu	%icc,	%l3,	%o2
	fones	%f12
	ldsw	[%l7 + 0x10],	%i4
	sdiv	%l5,	0x049C,	%i0
	umul	%i3,	0x1A12,	%o3
	edge16ln	%g5,	%l4,	%o5
	movl	%xcc,	%l1,	%g7
	smul	%i6,	%i7,	%o6
	movneg	%icc,	%o4,	%o7
	fmovs	%f14,	%f12
	std	%f14,	[%l7 + 0x30]
	edge16ln	%i1,	%g6,	%l2
	alignaddr	%l0,	%g4,	%g1
	ldsw	[%l7 + 0x1C],	%o0
	udiv	%l6,	0x1F7C,	%i2
	movgu	%icc,	%o1,	%g3
	edge8n	%i5,	%l3,	%g2
	alignaddrl	%i4,	%o2,	%l5
	smulcc	%i0,	%o3,	%g5
	restore %i3, 0x0042, %o5
	fandnot2s	%f5,	%f14,	%f5
	edge16l	%l4,	%l1,	%g7
	fnegs	%f3,	%f9
	movcs	%icc,	%i6,	%i7
	fzero	%f14
	fmovs	%f7,	%f11
	addcc	%o6,	%o4,	%o7
	sra	%i1,	%g6,	%l2
	lduh	[%l7 + 0x78],	%g4
	fcmpgt16	%f0,	%f14,	%l0
	andn	%o0,	%g1,	%l6
	smulcc	%i2,	%g3,	%o1
	sethi	0x1213,	%i5
	fmovdn	%icc,	%f5,	%f9
	mova	%icc,	%g2,	%l3
	lduh	[%l7 + 0x42],	%i4
	fpadd16	%f14,	%f8,	%f6
	fnot2	%f6,	%f2
	edge32	%l5,	%i0,	%o3
	or	%g5,	%i3,	%o2
	and	%o5,	0x1790,	%l1
	edge32l	%g7,	%i6,	%i7
	orn	%o6,	%o4,	%o7
	movge	%xcc,	%l4,	%g6
	edge32ln	%l2,	%g4,	%l0
	sdiv	%i1,	0x0C1B,	%g1
	array8	%l6,	%i2,	%o0
	fmul8x16au	%f7,	%f12,	%f2
	xor	%o1,	%i5,	%g3
	srlx	%l3,	%g2,	%i4
	mulscc	%i0,	%l5,	%o3
	ldub	[%l7 + 0x2F],	%i3
	array8	%o2,	%o5,	%l1
	ldsb	[%l7 + 0x53],	%g5
	fpmerge	%f5,	%f13,	%f10
	sdivcc	%i6,	0x1EC0,	%g7
	edge32	%o6,	%o4,	%o7
	andn	%l4,	0x0A43,	%g6
	fmul8ulx16	%f2,	%f10,	%f12
	array32	%i7,	%g4,	%l0
	orcc	%l2,	%i1,	%g1
	fmovdvc	%icc,	%f8,	%f7
	save %i2, %o0, %o1
	sllx	%l6,	0x12,	%i5
	orcc	%l3,	%g2,	%g3
	ldd	[%l7 + 0x50],	%i4
	addcc	%i0,	%l5,	%i3
	alignaddr	%o2,	%o5,	%l1
	ldsh	[%l7 + 0x5E],	%o3
	fcmpne16	%f12,	%f6,	%g5
	subc	%i6,	0x0CF7,	%o6
	mulscc	%g7,	%o4,	%l4
	andn	%g6,	%i7,	%g4
	movle	%xcc,	%l0,	%l2
	smul	%i1,	0x002C,	%o7
	fmovspos	%icc,	%f10,	%f6
	fpackfix	%f8,	%f5
	addccc	%i2,	%g1,	%o1
	ldd	[%l7 + 0x40],	%o0
	fmovsvc	%xcc,	%f8,	%f15
	array8	%i5,	%l6,	%l3
	movrlez	%g3,	%g2,	%i4
	movgu	%icc,	%i0,	%i3
	popc	%o2,	%o5
	movcc	%xcc,	%l1,	%l5
	umulcc	%g5,	%i6,	%o3
	srax	%o6,	0x0C,	%g7
	edge8ln	%l4,	%o4,	%i7
	restore %g6, 0x1741, %l0
	movrgz	%g4,	0x19D,	%i1
	mova	%xcc,	%o7,	%l2
	movleu	%icc,	%i2,	%o1
	ldsb	[%l7 + 0x2E],	%o0
	edge8n	%i5,	%l6,	%g1
	fcmple16	%f0,	%f10,	%l3
	sth	%g2,	[%l7 + 0x26]
	movrne	%g3,	0x3DC,	%i4
	fmovse	%xcc,	%f3,	%f12
	fnegd	%f12,	%f6
	ld	[%l7 + 0x4C],	%f10
	orncc	%i3,	%i0,	%o5
	movle	%xcc,	%o2,	%l5
	xorcc	%g5,	0x1484,	%l1
	sdivx	%o3,	0x0B3B,	%o6
	movgu	%xcc,	%i6,	%g7
	sdivx	%o4,	0x1AC8,	%i7
	st	%f13,	[%l7 + 0x64]
	subccc	%l4,	0x10F3,	%g6
	sdiv	%l0,	0x1CCE,	%i1
	move	%xcc,	%g4,	%l2
	or	%o7,	0x18D8,	%i2
	sub	%o0,	0x0A64,	%i5
	umulcc	%l6,	%g1,	%o1
	subccc	%g2,	0x0EF8,	%g3
	or	%i4,	0x1B2E,	%l3
	movrgz	%i3,	0x0A5,	%o5
	restore %i0, %o2, %g5
	siam	0x6
	fsrc2	%f8,	%f12
	andncc	%l5,	%l1,	%o3
	fmul8x16	%f5,	%f2,	%f8
	movrgz	%i6,	0x352,	%g7
	ldd	[%l7 + 0x10],	%f12
	fcmpeq32	%f14,	%f10,	%o6
	movgu	%icc,	%i7,	%o4
	mulscc	%g6,	0x0AF3,	%l0
	ldd	[%l7 + 0x60],	%l4
	stb	%g4,	[%l7 + 0x20]
	fmovsa	%xcc,	%f3,	%f2
	edge32n	%l2,	%o7,	%i1
	fnors	%f10,	%f6,	%f4
	umulcc	%i2,	0x19A6,	%o0
	array8	%i5,	%g1,	%o1
	move	%xcc,	%l6,	%g2
	ld	[%l7 + 0x24],	%f8
	subc	%i4,	0x041F,	%g3
	smul	%i3,	%l3,	%i0
	umul	%o5,	%g5,	%o2
	movre	%l1,	%l5,	%o3
	movrne	%g7,	%i6,	%o6
	ldd	[%l7 + 0x38],	%f10
	stb	%i7,	[%l7 + 0x3E]
	andncc	%o4,	%g6,	%l4
	movrlz	%g4,	%l0,	%l2
	sethi	0x15EE,	%o7
	andcc	%i1,	0x16DA,	%i2
	ld	[%l7 + 0x0C],	%f0
	movl	%icc,	%i5,	%o0
	fcmps	%fcc3,	%f7,	%f10
	fpadd32s	%f12,	%f5,	%f14
	movcc	%xcc,	%g1,	%l6
	move	%icc,	%o1,	%i4
	orn	%g3,	0x0178,	%g2
	edge16l	%l3,	%i0,	%i3
	stw	%o5,	[%l7 + 0x14]
	ld	[%l7 + 0x30],	%f2
	subcc	%o2,	%g5,	%l1
	sub	%o3,	0x08F3,	%g7
	ldd	[%l7 + 0x78],	%f10
	move	%xcc,	%l5,	%i6
	movl	%icc,	%o6,	%i7
	movrlz	%g6,	%o4,	%g4
	ldx	[%l7 + 0x58],	%l4
	edge16ln	%l2,	%l0,	%i1
	movcs	%icc,	%i2,	%i5
	movrgz	%o7,	0x1C9,	%o0
	movne	%xcc,	%l6,	%g1
	fornot1	%f8,	%f14,	%f6
	sub	%o1,	%g3,	%i4
	edge16l	%l3,	%i0,	%g2
	movge	%xcc,	%o5,	%i3
	fmul8x16au	%f11,	%f9,	%f0
	edge16n	%g5,	%o2,	%l1
	ldx	[%l7 + 0x48],	%o3
	fmovspos	%icc,	%f15,	%f13
	stw	%l5,	[%l7 + 0x4C]
	orn	%i6,	0x1413,	%g7
	ldd	[%l7 + 0x50],	%f0
	fmovrsgz	%i7,	%f4,	%f11
	mova	%icc,	%g6,	%o6
	udivx	%g4,	0x1E67,	%o4
	std	%f10,	[%l7 + 0x20]
	fmovsvc	%icc,	%f12,	%f14
	fcmped	%fcc1,	%f8,	%f12
	fmovsle	%icc,	%f1,	%f4
	fnors	%f13,	%f8,	%f12
	and	%l2,	0x1818,	%l0
	xor	%l4,	%i2,	%i5
	fmovrslez	%o7,	%f15,	%f13
	sll	%i1,	0x1F,	%l6
	popc	%o0,	%o1
	addccc	%g3,	0x0790,	%g1
	fones	%f5
	fcmple16	%f0,	%f2,	%i4
	fmovd	%f14,	%f10
	udivx	%i0,	0x1BA4,	%l3
	fmovscs	%icc,	%f9,	%f0
	movvs	%xcc,	%o5,	%g2
	udivx	%g5,	0x0CD8,	%i3
	edge8	%o2,	%l1,	%o3
	mova	%xcc,	%l5,	%g7
	edge32n	%i7,	%i6,	%g6
	edge8ln	%o6,	%o4,	%g4
	sethi	0x006A,	%l0
	sdivcc	%l2,	0x0788,	%i2
	andn	%i5,	0x086C,	%o7
	fmovdge	%icc,	%f5,	%f13
	movrlz	%l4,	0x1F8,	%l6
	edge8l	%o0,	%o1,	%i1
	subc	%g1,	0x1C31,	%g3
	movrlez	%i0,	0x2F7,	%l3
	fsrc2	%f12,	%f6
	lduh	[%l7 + 0x1A],	%o5
	sdivx	%i4,	0x1980,	%g5
	subcc	%g2,	%i3,	%o2
	orncc	%l1,	%l5,	%g7
	fmul8sux16	%f0,	%f0,	%f8
	subcc	%i7,	%i6,	%o3
	movrlez	%g6,	%o4,	%o6
	movre	%l0,	%l2,	%g4
	siam	0x5
	fors	%f8,	%f2,	%f11
	movge	%xcc,	%i5,	%i2
	fors	%f6,	%f15,	%f10
	andn	%l4,	%o7,	%o0
	movge	%icc,	%l6,	%o1
	movrlz	%i1,	0x05B,	%g3
	mulscc	%i0,	%g1,	%l3
	sra	%o5,	%i4,	%g2
	edge32l	%i3,	%o2,	%l1
	ldsh	[%l7 + 0x40],	%g5
	movne	%xcc,	%g7,	%i7
	sdivx	%i6,	0x13DF,	%l5
	fpsub16	%f0,	%f10,	%f6
	fabss	%f8,	%f5
	movvc	%icc,	%g6,	%o3
	movneg	%xcc,	%o4,	%o6
	fandnot2	%f14,	%f6,	%f6
	alignaddrl	%l2,	%g4,	%l0
	std	%f14,	[%l7 + 0x30]
	edge16ln	%i5,	%l4,	%o7
	fmovrdlez	%i2,	%f10,	%f2
	sll	%o0,	0x05,	%l6
	ldx	[%l7 + 0x30],	%o1
	edge8l	%i1,	%i0,	%g1
	fcmped	%fcc1,	%f14,	%f6
	fmovsa	%icc,	%f1,	%f8
	movvs	%xcc,	%g3,	%o5
	edge16l	%l3,	%i4,	%i3
	edge16l	%g2,	%o2,	%g5
	udivx	%l1,	0x1EBC,	%g7
	fmovdcs	%icc,	%f7,	%f12
	edge8l	%i6,	%l5,	%g6
	save %o3, %o4, %i7
	movcc	%xcc,	%o6,	%g4
	array16	%l2,	%i5,	%l4
	andcc	%o7,	0x184C,	%l0
	edge8ln	%o0,	%i2,	%l6
	sth	%i1,	[%l7 + 0x72]
	movrgz	%o1,	0x056,	%g1
	fmovsg	%icc,	%f8,	%f5
	fones	%f14
	subc	%i0,	0x0355,	%g3
	movpos	%icc,	%o5,	%i4
	srl	%i3,	%g2,	%l3
	smul	%g5,	0x117C,	%o2
	sdivcc	%l1,	0x1CF3,	%i6
	movl	%xcc,	%g7,	%l5
	edge16	%g6,	%o3,	%i7
	edge16n	%o6,	%g4,	%l2
	fmuld8sux16	%f14,	%f14,	%f14
	edge8ln	%o4,	%i5,	%l4
	udivcc	%o7,	0x1C7F,	%l0
	movrlez	%o0,	0x174,	%l6
	edge32n	%i2,	%i1,	%g1
	umul	%i0,	%g3,	%o1
	xnor	%i4,	%o5,	%i3
	edge8l	%g2,	%g5,	%l3
	ldd	[%l7 + 0x08],	%f12
	sethi	0x0014,	%l1
	movcs	%xcc,	%i6,	%o2
	fsrc2	%f4,	%f12
	and	%l5,	%g7,	%g6
	ldsh	[%l7 + 0x26],	%o3
	fornot1s	%f14,	%f7,	%f0
	movrlez	%o6,	0x081,	%i7
	restore %g4, %o4, %i5
	save %l4, 0x08D7, %l2
	movleu	%icc,	%l0,	%o0
	ldd	[%l7 + 0x20],	%i6
	udiv	%i2,	0x0CB2,	%o7
	fpsub16s	%f14,	%f7,	%f15
	edge8n	%i1,	%g1,	%g3
	save %i0, %i4, %o1
	srl	%i3,	%o5,	%g2
	movvc	%xcc,	%g5,	%l3
	mulx	%l1,	0x1FE3,	%i6
	sdiv	%l5,	0x0405,	%o2
	orncc	%g6,	%g7,	%o6
	fnot1	%f6,	%f4
	smul	%i7,	0x0794,	%o3
	fmovsg	%icc,	%f4,	%f8
	alignaddrl	%g4,	%i5,	%o4
	andncc	%l2,	%l0,	%o0
	fmovdge	%xcc,	%f5,	%f8
	umulcc	%l6,	0x0D01,	%i2
	lduh	[%l7 + 0x46],	%l4
	edge8	%o7,	%i1,	%g1
	movrlez	%i0,	0x3C7,	%g3
	fmovsgu	%icc,	%f8,	%f13
	edge8l	%o1,	%i4,	%i3
	udiv	%o5,	0x1CDA,	%g2
	mulscc	%g5,	0x0BFA,	%l1
	edge16n	%i6,	%l5,	%l3
	orcc	%g6,	0x1F59,	%g7
	xorcc	%o6,	0x1042,	%i7
	fmovrslez	%o2,	%f5,	%f8
	ldx	[%l7 + 0x18],	%g4
	edge16n	%i5,	%o4,	%l2
	andncc	%l0,	%o3,	%o0
	fandnot2	%f6,	%f12,	%f0
	ld	[%l7 + 0x38],	%f0
	fmovse	%icc,	%f3,	%f7
	udivcc	%i2,	0x1B14,	%l4
	movvc	%icc,	%l6,	%o7
	umulcc	%i1,	%i0,	%g3
	fmovdcs	%xcc,	%f2,	%f11
	udivcc	%o1,	0x07A3,	%g1
	edge8n	%i3,	%o5,	%i4
	array8	%g5,	%l1,	%g2
	movrne	%l5,	0x1BD,	%i6
	fsrc1s	%f8,	%f12
	movpos	%xcc,	%g6,	%l3
	edge8n	%o6,	%g7,	%o2
	udivx	%i7,	0x10FD,	%g4
	edge16	%o4,	%i5,	%l2
	ldsb	[%l7 + 0x48],	%l0
	fmovse	%icc,	%f0,	%f15
	addcc	%o0,	0x0C42,	%o3
	smulcc	%l4,	%i2,	%o7
	ldsw	[%l7 + 0x34],	%i1
	ldsw	[%l7 + 0x64],	%l6
	lduh	[%l7 + 0x7C],	%i0
	udiv	%g3,	0x0E45,	%g1
	fmovs	%f8,	%f1
	sub	%o1,	0x1757,	%i3
	subc	%i4,	%o5,	%g5
	srlx	%l1,	%l5,	%g2
	lduw	[%l7 + 0x50],	%i6
	lduh	[%l7 + 0x1A],	%l3
	movcs	%xcc,	%g6,	%o6
	popc	0x0CA2,	%g7
	array16	%o2,	%g4,	%i7
	fcmpeq32	%f6,	%f4,	%i5
	movrlz	%o4,	%l0,	%o0
	fandnot2	%f2,	%f2,	%f4
	alignaddrl	%o3,	%l2,	%i2
	save %l4, 0x1B3C, %i1
	edge32	%o7,	%i0,	%g3
	fpsub32s	%f0,	%f8,	%f11
	fmovsneg	%icc,	%f7,	%f13
	sllx	%g1,	%l6,	%i3
	movcc	%icc,	%o1,	%i4
	xnorcc	%o5,	0x093E,	%g5
	alignaddrl	%l5,	%l1,	%i6
	mulscc	%g2,	%g6,	%l3
	ldsb	[%l7 + 0x23],	%o6
	fandnot2s	%f4,	%f0,	%f8
	udivx	%g7,	0x0A5F,	%o2
	movleu	%xcc,	%i7,	%i5
	ldx	[%l7 + 0x58],	%o4
	movvc	%icc,	%l0,	%g4
	fcmpne16	%f4,	%f2,	%o0
	fmovsne	%xcc,	%f13,	%f7
	fmovrdne	%l2,	%f6,	%f6
	movg	%icc,	%i2,	%o3
	subcc	%i1,	%o7,	%i0
	fnand	%f0,	%f12,	%f2
	udivx	%g3,	0x0EAC,	%l4
	smulcc	%l6,	%i3,	%o1
	orncc	%i4,	%g1,	%o5
	add	%g5,	%l5,	%i6
	movvc	%icc,	%g2,	%g6
	fandnot2	%f10,	%f6,	%f12
	movcc	%icc,	%l1,	%l3
	addccc	%g7,	%o2,	%i7
	mova	%xcc,	%i5,	%o6
	lduw	[%l7 + 0x5C],	%l0
	fxnor	%f0,	%f2,	%f8
	edge32	%g4,	%o0,	%o4
	alignaddrl	%i2,	%l2,	%o3
	movleu	%xcc,	%o7,	%i1
	movgu	%icc,	%i0,	%l4
	fmovsg	%xcc,	%f6,	%f4
	umulcc	%l6,	%g3,	%o1
	umulcc	%i3,	0x1220,	%i4
	fnot1s	%f3,	%f5
	fcmpeq16	%f14,	%f2,	%o5
	fnegs	%f5,	%f4
	fmovsg	%icc,	%f4,	%f8
	fxnors	%f9,	%f0,	%f8
	restore %g5, %l5, %g1
	array32	%g2,	%i6,	%g6
	sth	%l1,	[%l7 + 0x4C]
	stb	%l3,	[%l7 + 0x44]
	movrne	%o2,	%g7,	%i7
	or	%o6,	0x000E,	%i5
	fcmpgt16	%f14,	%f12,	%g4
	xorcc	%l0,	0x0434,	%o4
	pdist	%f8,	%f12,	%f8
	std	%f6,	[%l7 + 0x68]
	edge8n	%o0,	%i2,	%l2
	edge32	%o7,	%i1,	%i0
	alignaddrl	%o3,	%l6,	%l4
	ldsw	[%l7 + 0x24],	%g3
	sub	%i3,	0x1B51,	%i4
	fzero	%f8
	popc	0x1B0F,	%o1
	edge32ln	%o5,	%l5,	%g1
	edge32n	%g5,	%g2,	%i6
	orn	%l1,	%g6,	%l3
	subccc	%o2,	%i7,	%g7
	or	%i5,	%g4,	%l0
	move	%xcc,	%o4,	%o6
	lduh	[%l7 + 0x46],	%i2
	edge8l	%l2,	%o7,	%i1
	fcmped	%fcc0,	%f12,	%f0
	fmovda	%icc,	%f11,	%f10
	subccc	%i0,	0x07C3,	%o3
	movrgz	%l6,	0x151,	%o0
	xorcc	%l4,	%i3,	%g3
	fmovscs	%icc,	%f1,	%f14
	movne	%xcc,	%i4,	%o5
	fmovrslz	%l5,	%f2,	%f7
	xorcc	%o1,	%g5,	%g1
	stw	%g2,	[%l7 + 0x6C]
	popc	%i6,	%l1
	fmovsvc	%icc,	%f13,	%f10
	edge8n	%l3,	%g6,	%i7
	mova	%xcc,	%o2,	%g7
	udivx	%i5,	0x0A45,	%g4
	fxnor	%f12,	%f4,	%f12
	stw	%o4,	[%l7 + 0x34]
	ldd	[%l7 + 0x68],	%o6
	fmovdn	%xcc,	%f12,	%f1
	edge8	%i2,	%l0,	%o7
	movvc	%icc,	%i1,	%l2
	or	%o3,	%i0,	%o0
	movpos	%xcc,	%l4,	%i3
	fcmps	%fcc3,	%f10,	%f8
	and	%g3,	%l6,	%o5
	smulcc	%i4,	0x1707,	%l5
	movrgz	%g5,	0x052,	%o1
	udivx	%g2,	0x0CBD,	%g1
	fzero	%f8
	array8	%l1,	%l3,	%g6
	umul	%i7,	%o2,	%g7
	sth	%i5,	[%l7 + 0x0C]
	addc	%g4,	%o4,	%o6
	st	%f7,	[%l7 + 0x2C]
	lduw	[%l7 + 0x34],	%i2
	movg	%xcc,	%i6,	%o7
	fcmpeq32	%f12,	%f12,	%l0
	fnot2	%f6,	%f8
	fmovdpos	%icc,	%f2,	%f13
	ldsb	[%l7 + 0x28],	%i1
	fmovsa	%icc,	%f15,	%f5
	edge32	%o3,	%i0,	%l2
	movl	%icc,	%o0,	%i3
	movrgz	%g3,	0x342,	%l4
	edge32l	%l6,	%o5,	%l5
	edge8ln	%g5,	%i4,	%g2
	fmovrde	%o1,	%f12,	%f8
	fcmpgt32	%f12,	%f10,	%g1
	ldsb	[%l7 + 0x12],	%l3
	save %l1, %g6, %o2
	orncc	%i7,	0x0624,	%g7
	sub	%i5,	%g4,	%o4
	udivx	%o6,	0x040E,	%i2
	fcmpes	%fcc0,	%f1,	%f13
	movn	%xcc,	%o7,	%i6
	fpmerge	%f15,	%f3,	%f14
	fmovdvc	%xcc,	%f15,	%f13
	edge32n	%i1,	%l0,	%i0
	edge8ln	%o3,	%o0,	%i3
	fmovscs	%icc,	%f15,	%f14
	edge8n	%l2,	%l4,	%g3
	smul	%o5,	%l6,	%g5
	fnot2	%f8,	%f8
	udivcc	%l5,	0x042E,	%i4
	add	%g2,	0x0663,	%g1
	fmovsvs	%xcc,	%f2,	%f13
	sth	%o1,	[%l7 + 0x70]
	smul	%l3,	0x096F,	%g6
	array32	%o2,	%i7,	%g7
	movl	%xcc,	%l1,	%g4
	fmuld8ulx16	%f13,	%f11,	%f0
	edge32	%o4,	%o6,	%i2
	movrgez	%o7,	%i5,	%i6
	ldub	[%l7 + 0x72],	%i1
	udivcc	%i0,	0x1E49,	%l0
	fsrc1s	%f10,	%f2
	edge32l	%o0,	%o3,	%l2
	smul	%i3,	0x0FE6,	%g3
	fcmpeq16	%f6,	%f0,	%l4
	srax	%l6,	%o5,	%l5
	edge32	%i4,	%g2,	%g5
	movrne	%g1,	%l3,	%o1
	ld	[%l7 + 0x44],	%f5
	movg	%icc,	%g6,	%i7
	fcmpes	%fcc2,	%f2,	%f6
	movneg	%xcc,	%g7,	%o2
	fmovrse	%l1,	%f3,	%f13
	fpsub32s	%f8,	%f6,	%f0
	fpadd32s	%f6,	%f5,	%f2
	ldsb	[%l7 + 0x41],	%g4
	stw	%o4,	[%l7 + 0x78]
	movrlz	%o6,	0x3CE,	%i2
	fornot2	%f10,	%f0,	%f8
	fpsub32	%f10,	%f10,	%f6
	addcc	%i5,	0x0491,	%i6
	fandnot2	%f8,	%f8,	%f0
	alignaddrl	%o7,	%i0,	%l0
	movle	%xcc,	%i1,	%o0
	alignaddr	%o3,	%i3,	%l2
	fxnor	%f0,	%f10,	%f8
	fxor	%f2,	%f0,	%f0
	orn	%l4,	%l6,	%o5
	mulscc	%l5,	0x0121,	%i4
	fnands	%f15,	%f6,	%f14
	xor	%g3,	%g5,	%g1
	move	%icc,	%g2,	%o1
	fmovsg	%xcc,	%f13,	%f10
	fpsub32s	%f8,	%f7,	%f14
	fsrc1	%f14,	%f0
	ldx	[%l7 + 0x20],	%l3
	sdivcc	%g6,	0x1BB3,	%g7
	fcmple16	%f4,	%f14,	%o2
	smulcc	%l1,	0x0489,	%g4
	smulcc	%i7,	0x141B,	%o6
	sub	%i2,	%i5,	%i6
	xnorcc	%o4,	%i0,	%o7
	stw	%l0,	[%l7 + 0x10]
	umul	%i1,	0x131C,	%o3
	ldx	[%l7 + 0x38],	%o0
	array32	%l2,	%i3,	%l6
	ldsh	[%l7 + 0x7E],	%l4
	and	%l5,	%o5,	%g3
	bshuffle	%f4,	%f6,	%f0
	ld	[%l7 + 0x64],	%f12
	stb	%g5,	[%l7 + 0x6C]
	ldub	[%l7 + 0x12],	%i4
	subc	%g1,	0x1EB6,	%g2
	movvs	%icc,	%l3,	%o1
	edge8ln	%g7,	%g6,	%o2
	sllx	%g4,	%i7,	%o6
	alignaddr	%i2,	%l1,	%i5
	movl	%xcc,	%i6,	%o4
	subccc	%o7,	%i0,	%i1
	andncc	%o3,	%l0,	%l2
	edge32l	%o0,	%i3,	%l4
	ldsb	[%l7 + 0x7D],	%l6
	sub	%l5,	0x060F,	%o5
	udiv	%g5,	0x0617,	%i4
	fzero	%f6
	smul	%g1,	0x0EEE,	%g2
	orncc	%g3,	%o1,	%g7
	mova	%icc,	%l3,	%g6
	addcc	%o2,	%g4,	%o6
	edge8n	%i7,	%l1,	%i5
	movrgz	%i6,	0x278,	%i2
	xnorcc	%o4,	0x0A89,	%o7
	addccc	%i0,	%o3,	%l0
	edge8l	%i1,	%l2,	%i3
	umul	%o0,	0x1702,	%l6
	movge	%icc,	%l5,	%l4
	std	%f10,	[%l7 + 0x08]
	sdivx	%g5,	0x0089,	%i4
	movneg	%xcc,	%g1,	%g2
	fmovs	%f14,	%f14
	umul	%o5,	0x1048,	%g3
	sth	%o1,	[%l7 + 0x42]
	edge16l	%l3,	%g6,	%o2
	ld	[%l7 + 0x6C],	%f11
	movrgz	%g7,	%g4,	%o6
	movn	%icc,	%i7,	%l1
	ldub	[%l7 + 0x09],	%i5
	orn	%i6,	%o4,	%i2
	sdivcc	%o7,	0x02B3,	%o3
	fmovsvc	%xcc,	%f11,	%f4
	add	%i0,	%i1,	%l2
	edge8n	%i3,	%l0,	%o0
	array16	%l6,	%l5,	%l4
	array16	%i4,	%g5,	%g2
	edge8n	%g1,	%g3,	%o5
	move	%icc,	%o1,	%g6
	orn	%l3,	%g7,	%g4
	edge32	%o2,	%o6,	%i7
	fmovrdne	%l1,	%f0,	%f2
	sub	%i5,	0x1656,	%o4
	edge16	%i6,	%i2,	%o3
	fpadd16	%f14,	%f2,	%f0
	movge	%xcc,	%i0,	%i1
	fcmpne32	%f2,	%f12,	%o7
	mulscc	%l2,	0x1E12,	%i3
	movl	%xcc,	%o0,	%l0
	fzero	%f8
	fornot2s	%f14,	%f12,	%f9
	edge32l	%l5,	%l4,	%l6
	edge32l	%g5,	%g2,	%i4
	movne	%xcc,	%g3,	%g1
	subc	%o5,	%o1,	%g6
	fmovdleu	%icc,	%f14,	%f3
	ldub	[%l7 + 0x53],	%g7
	xor	%g4,	0x13C1,	%o2
	andncc	%l3,	%i7,	%o6
	udivx	%i5,	0x1879,	%l1
	alignaddr	%o4,	%i2,	%i6
	edge32l	%o3,	%i1,	%o7
	for	%f4,	%f6,	%f8
	movcc	%xcc,	%l2,	%i3
	edge16n	%o0,	%l0,	%i0
	fmovdcs	%icc,	%f0,	%f9
	sth	%l4,	[%l7 + 0x74]
	fmovsn	%icc,	%f12,	%f12
	fmovsgu	%icc,	%f6,	%f3
	ldsh	[%l7 + 0x38],	%l5
	edge32l	%g5,	%l6,	%g2
	move	%icc,	%g3,	%i4
	fmovda	%xcc,	%f0,	%f0
	subc	%o5,	0x032B,	%o1
	save %g6, 0x0D68, %g7
	edge8l	%g1,	%g4,	%l3
	fandnot1s	%f3,	%f15,	%f10
	ldsh	[%l7 + 0x54],	%o2
	movvs	%xcc,	%o6,	%i5
	fmovda	%icc,	%f11,	%f14
	fandnot2	%f4,	%f8,	%f4
	edge8ln	%i7,	%o4,	%i2
	movneg	%xcc,	%i6,	%o3
	udivcc	%l1,	0x1DF5,	%o7
	andcc	%l2,	0x0D7A,	%i1
	movle	%icc,	%o0,	%i3
	umul	%l0,	0x11C3,	%i0
	fmovda	%xcc,	%f14,	%f6
	ldub	[%l7 + 0x37],	%l4
	subc	%l5,	0x06E0,	%g5
	movvc	%icc,	%l6,	%g2
	ld	[%l7 + 0x70],	%f9
	edge32ln	%i4,	%o5,	%g3
	movl	%xcc,	%o1,	%g7
	fmovsne	%xcc,	%f8,	%f3
	fnegs	%f2,	%f15
	movleu	%xcc,	%g1,	%g6
	fcmpgt16	%f4,	%f2,	%g4
	array32	%l3,	%o6,	%i5
	addcc	%o2,	0x1BFC,	%i7
	array8	%o4,	%i2,	%o3
	edge8n	%l1,	%i6,	%o7
	xnorcc	%i1,	0x085E,	%l2
	stx	%o0,	[%l7 + 0x20]
	fmovdle	%icc,	%f6,	%f13
	std	%f2,	[%l7 + 0x48]
	movne	%xcc,	%i3,	%l0
	fmovda	%icc,	%f4,	%f8
	fmovdgu	%xcc,	%f6,	%f0
	fmovsle	%icc,	%f14,	%f6
	edge32	%i0,	%l4,	%g5
	edge8n	%l5,	%l6,	%i4
	sra	%g2,	%g3,	%o5
	orncc	%g7,	0x161D,	%o1
	add	%g6,	%g1,	%g4
	xnorcc	%o6,	%l3,	%i5
	movge	%xcc,	%o2,	%i7
	fnegd	%f12,	%f2
	edge8ln	%o4,	%o3,	%i2
	orcc	%l1,	%o7,	%i6
	subccc	%l2,	0x175F,	%i1
	ldsw	[%l7 + 0x2C],	%i3
	movcs	%icc,	%l0,	%o0
	fpsub32s	%f14,	%f1,	%f10
	movvc	%icc,	%l4,	%g5
	restore %i0, %l5, %i4
	array8	%l6,	%g3,	%o5
	fpsub32s	%f14,	%f13,	%f8
	fmovsn	%xcc,	%f15,	%f3
	mova	%icc,	%g2,	%g7
	ldx	[%l7 + 0x60],	%g6
	save %g1, %g4, %o6
	or	%l3,	%o1,	%i5
	sra	%o2,	0x08,	%i7
	movleu	%icc,	%o4,	%i2
	lduw	[%l7 + 0x18],	%l1
	ldx	[%l7 + 0x30],	%o3
	mulx	%o7,	%i6,	%i1
	movn	%icc,	%i3,	%l0
	fmovsleu	%xcc,	%f11,	%f2
	sra	%l2,	0x0F,	%o0
	fmovrdlez	%l4,	%f0,	%f2
	sub	%i0,	0x1651,	%l5
	fpadd32s	%f3,	%f5,	%f15
	smulcc	%i4,	0x1A14,	%l6
	andncc	%g3,	%g5,	%o5
	movvs	%icc,	%g2,	%g7
	edge32n	%g6,	%g1,	%g4
	xnor	%l3,	%o6,	%i5
	movcc	%icc,	%o2,	%o1
	edge16	%i7,	%o4,	%i2
	orncc	%l1,	0x0622,	%o3
	edge8n	%o7,	%i1,	%i6
	movcc	%xcc,	%l0,	%l2
	srl	%i3,	%l4,	%i0
	stx	%l5,	[%l7 + 0x78]
	srax	%o0,	0x0A,	%i4
	fmuld8ulx16	%f0,	%f8,	%f4
	lduw	[%l7 + 0x08],	%l6
	fpadd32	%f2,	%f0,	%f4
	edge32	%g5,	%o5,	%g3
	orcc	%g2,	%g7,	%g1
	fpadd32s	%f10,	%f9,	%f11
	movrlez	%g6,	%g4,	%o6
	movneg	%icc,	%l3,	%o2
	edge16l	%i5,	%i7,	%o1
	fcmpgt32	%f2,	%f6,	%o4
	fandnot2s	%f11,	%f15,	%f5
	xnor	%l1,	%i2,	%o7
	andncc	%o3,	%i1,	%l0
	fmovsgu	%icc,	%f9,	%f8
	fcmped	%fcc3,	%f14,	%f14
	xnorcc	%l2,	%i3,	%l4
	andncc	%i6,	%l5,	%o0
	ldd	[%l7 + 0x78],	%i0
	edge8	%l6,	%i4,	%o5
	subccc	%g5,	0x0A28,	%g3
	movneg	%icc,	%g7,	%g2
	fors	%f9,	%f9,	%f4
	umulcc	%g6,	%g4,	%o6
	udivcc	%g1,	0x1C17,	%o2
	umul	%l3,	%i5,	%o1
	movg	%xcc,	%o4,	%i7
	fmuld8sux16	%f0,	%f11,	%f12
	subcc	%i2,	%o7,	%o3
	fmovscs	%icc,	%f15,	%f10
	sdivx	%i1,	0x12B7,	%l0
	lduh	[%l7 + 0x0C],	%l1
	subccc	%i3,	0x0E84,	%l2
	andcc	%i6,	%l5,	%l4
	udivx	%i0,	0x152F,	%o0
	umulcc	%i4,	0x0FBF,	%l6
	fmovrsne	%o5,	%f12,	%f11
	restore %g5, 0x017E, %g3
	move	%xcc,	%g7,	%g6
	sub	%g2,	%g4,	%o6
	addcc	%o2,	0x1645,	%l3
	umul	%g1,	%o1,	%i5
	edge32n	%i7,	%o4,	%o7
	sdiv	%i2,	0x1ACA,	%i1
	fmovdg	%icc,	%f8,	%f3
	ldsb	[%l7 + 0x3B],	%o3
	mulscc	%l1,	%l0,	%i3
	movrgz	%i6,	%l2,	%l5
	movrne	%l4,	0x17D,	%i0
	sll	%i4,	%l6,	%o0
	movg	%icc,	%o5,	%g3
	stb	%g7,	[%l7 + 0x5C]
	or	%g6,	0x13B2,	%g2
	subccc	%g5,	0x1980,	%g4
	fmovrdne	%o2,	%f10,	%f8
	movrlez	%l3,	0x098,	%g1
	edge8l	%o6,	%o1,	%i5
	stx	%o4,	[%l7 + 0x30]
	fmovscs	%xcc,	%f7,	%f10
	xorcc	%o7,	0x1C00,	%i7
	movg	%icc,	%i1,	%o3
	fmovdn	%icc,	%f9,	%f14
	movne	%icc,	%l1,	%l0
	fmovsg	%xcc,	%f9,	%f6
	fmovdgu	%xcc,	%f3,	%f1
	sdiv	%i2,	0x1ABE,	%i6
	movrgz	%l2,	%l5,	%l4
	alignaddrl	%i3,	%i4,	%l6
	array32	%o0,	%i0,	%o5
	fabsd	%f8,	%f10
	addc	%g7,	0x09CC,	%g3
	smul	%g6,	%g5,	%g2
	subc	%o2,	0x165E,	%g4
	fmovsleu	%xcc,	%f2,	%f0
	addc	%l3,	%o6,	%o1
	andncc	%i5,	%g1,	%o7
	sdiv	%i7,	0x0515,	%i1
	mulscc	%o4,	%l1,	%l0
	array8	%i2,	%i6,	%o3
	stw	%l5,	[%l7 + 0x40]
	fand	%f4,	%f10,	%f8
	edge16ln	%l4,	%l2,	%i3
	restore %l6, %o0, %i4
	movcc	%xcc,	%i0,	%g7
	fmovrse	%g3,	%f12,	%f4
	movle	%xcc,	%g6,	%g5
	movrgez	%g2,	%o2,	%g4
	movrlez	%l3,	0x320,	%o5
	movle	%icc,	%o6,	%i5
	lduw	[%l7 + 0x24],	%g1
	movcc	%icc,	%o7,	%i7
	subc	%i1,	0x05AD,	%o4
	fmovsleu	%icc,	%f8,	%f2
	lduh	[%l7 + 0x30],	%o1
	umulcc	%l1,	%l0,	%i2
	movl	%xcc,	%o3,	%l5
	fmovrslz	%i6,	%f15,	%f2
	edge16n	%l4,	%i3,	%l2
	mova	%icc,	%l6,	%o0
	fmovsn	%icc,	%f2,	%f7
	edge8	%i0,	%i4,	%g3
	sdiv	%g6,	0x0234,	%g5
	movrne	%g2,	0x2C6,	%g7
	st	%f13,	[%l7 + 0x4C]
	movle	%xcc,	%g4,	%o2
	fmovrdgez	%l3,	%f14,	%f8
	movrlez	%o6,	0x09A,	%o5
	save %g1, %o7, %i5
	movn	%icc,	%i7,	%o4
	std	%f0,	[%l7 + 0x38]
	movcs	%icc,	%o1,	%i1
	addccc	%l0,	0x1A22,	%i2
	fmovrde	%o3,	%f10,	%f4
	movre	%l5,	%l1,	%i6
	ldd	[%l7 + 0x70],	%i2
	movleu	%icc,	%l4,	%l6
	subccc	%l2,	%o0,	%i0
	srlx	%i4,	%g6,	%g5
	fmovdl	%xcc,	%f5,	%f10
	lduh	[%l7 + 0x7E],	%g2
	array32	%g3,	%g7,	%g4
	andcc	%l3,	0x18CD,	%o6
	sth	%o2,	[%l7 + 0x10]
	xnorcc	%o5,	0x1366,	%o7
	ldsb	[%l7 + 0x7C],	%i5
	udivcc	%i7,	0x0F03,	%g1
	sllx	%o4,	0x0C,	%i1
	fpsub32s	%f7,	%f4,	%f13
	ldd	[%l7 + 0x10],	%o0
	smulcc	%l0,	%o3,	%l5
	orcc	%i2,	0x183A,	%l1
	lduh	[%l7 + 0x6A],	%i6
	addc	%l4,	%l6,	%l2
	fmovrdne	%i3,	%f6,	%f0
	srlx	%i0,	%i4,	%o0
	ldsh	[%l7 + 0x0E],	%g6
	st	%f8,	[%l7 + 0x40]
	st	%f7,	[%l7 + 0x70]
	lduw	[%l7 + 0x24],	%g5
	sdivx	%g3,	0x0203,	%g7
	movne	%icc,	%g4,	%g2
	orcc	%l3,	0x08D9,	%o6
	movne	%icc,	%o5,	%o7
	sdiv	%o2,	0x0BE9,	%i5
	sth	%g1,	[%l7 + 0x78]
	ldd	[%l7 + 0x18],	%f14
	udivx	%i7,	0x1D4D,	%o4
	edge16	%o1,	%l0,	%o3
	fcmpgt16	%f10,	%f14,	%i1
	fmovrdlz	%l5,	%f10,	%f10
	srax	%l1,	0x1F,	%i2
	edge8l	%i6,	%l6,	%l2
	sethi	0x1F6F,	%l4
	fmovdpos	%xcc,	%f15,	%f9
	save %i0, %i4, %i3
	sdivcc	%o0,	0x152B,	%g6
	addcc	%g3,	%g7,	%g4
	fmovdcs	%xcc,	%f12,	%f2
	add	%g2,	%g5,	%l3
	subcc	%o5,	%o6,	%o7
	sdiv	%o2,	0x0F36,	%g1
	fmovdcs	%xcc,	%f0,	%f6
	ld	[%l7 + 0x78],	%f9
	subcc	%i7,	%o4,	%o1
	fsrc1	%f0,	%f12
	restore %i5, %o3, %i1
	ldd	[%l7 + 0x08],	%f6
	mulscc	%l5,	0x1E83,	%l1
	ldd	[%l7 + 0x28],	%i2
	orcc	%l0,	%i6,	%l6
	lduw	[%l7 + 0x4C],	%l2
	smulcc	%i0,	%i4,	%i3
	array16	%l4,	%o0,	%g3
	sth	%g7,	[%l7 + 0x5C]
	ldx	[%l7 + 0x20],	%g4
	sdiv	%g6,	0x0D21,	%g5
	ldsb	[%l7 + 0x2D],	%g2
	fmuld8ulx16	%f4,	%f7,	%f8
	movrgez	%o5,	0x1D9,	%l3
	srax	%o7,	0x1A,	%o6
	mulx	%o2,	%i7,	%g1
	fmovrsne	%o4,	%f9,	%f2
	mova	%icc,	%i5,	%o1
	movvs	%xcc,	%o3,	%l5
	umul	%l1,	0x1B4C,	%i1
	orcc	%i2,	%i6,	%l0
	srl	%l6,	0x11,	%l2
	edge16l	%i4,	%i3,	%l4
	udiv	%o0,	0x04D8,	%g3
	movrgez	%g7,	0x370,	%i0
	xor	%g4,	0x0B86,	%g5
	fabsd	%f12,	%f12
	move	%xcc,	%g2,	%o5
	umulcc	%g6,	0x0252,	%o7
	edge32n	%o6,	%o2,	%i7
	mulx	%g1,	0x10CC,	%l3
	edge16	%i5,	%o1,	%o3
	ldub	[%l7 + 0x48],	%o4
	st	%f5,	[%l7 + 0x0C]
	fmovrdne	%l5,	%f14,	%f0
	subc	%l1,	0x1735,	%i2
	orn	%i6,	%i1,	%l6
	array32	%l0,	%i4,	%l2
	andncc	%l4,	%i3,	%o0
	array8	%g7,	%g3,	%i0
	sdivx	%g4,	0x1DB0,	%g5
	array8	%g2,	%g6,	%o7
	fmovdvs	%xcc,	%f11,	%f2
	movrlz	%o5,	0x120,	%o6
	xnorcc	%o2,	%i7,	%g1
	smulcc	%l3,	%o1,	%i5
	edge16l	%o4,	%l5,	%o3
	edge32	%i2,	%l1,	%i1
	stw	%l6,	[%l7 + 0x24]
	fmovdg	%xcc,	%f11,	%f14
	srlx	%i6,	%i4,	%l2
	orcc	%l4,	0x0817,	%i3
	lduh	[%l7 + 0x12],	%l0
	movleu	%xcc,	%g7,	%o0
	ldsb	[%l7 + 0x5B],	%g3
	xnor	%g4,	0x1071,	%g5
	movrne	%i0,	0x2D5,	%g6
	movl	%xcc,	%o7,	%o5
	edge8n	%g2,	%o2,	%i7
	alignaddr	%g1,	%l3,	%o6
	srlx	%i5,	%o1,	%o4
	movge	%xcc,	%o3,	%i2
	movrlez	%l5,	0x0A2,	%l1
	st	%f14,	[%l7 + 0x14]
	array16	%i1,	%l6,	%i6
	movrgz	%l2,	%i4,	%i3
	fand	%f2,	%f4,	%f6
	sdivcc	%l0,	0x0B51,	%l4
	orncc	%o0,	0x06DC,	%g3
	edge32ln	%g4,	%g7,	%i0
	move	%icc,	%g6,	%o7
	edge32ln	%o5,	%g5,	%o2
	ldd	[%l7 + 0x58],	%f14
	orncc	%g2,	0x047F,	%g1
	lduw	[%l7 + 0x6C],	%i7
	edge32n	%l3,	%i5,	%o1
	movge	%icc,	%o4,	%o3
	edge8ln	%o6,	%l5,	%i2
	fmovscs	%xcc,	%f11,	%f1
	udiv	%i1,	0x199A,	%l1
	mulscc	%i6,	%l2,	%l6
	fandnot2s	%f2,	%f5,	%f10
	movgu	%xcc,	%i3,	%l0
	edge32l	%i4,	%o0,	%l4
	edge8	%g3,	%g7,	%i0
	andncc	%g4,	%g6,	%o5
	fmovrslz	%g5,	%f1,	%f4
	edge8l	%o2,	%g2,	%g1
	xnor	%o7,	0x0DDD,	%i7
	xnor	%l3,	%o1,	%i5
	edge16n	%o4,	%o3,	%o6
	fmovsl	%xcc,	%f4,	%f11
	umul	%i2,	%l5,	%l1
	subccc	%i1,	%i6,	%l6
	fcmpd	%fcc2,	%f0,	%f10
	mulscc	%i3,	0x0A5A,	%l0
	save %i4, %o0, %l2
	movcc	%xcc,	%l4,	%g3
	std	%f8,	[%l7 + 0x58]
	ld	[%l7 + 0x64],	%f4
	edge8l	%i0,	%g7,	%g6
	sth	%g4,	[%l7 + 0x32]
	ldd	[%l7 + 0x38],	%g4
	xorcc	%o5,	0x1520,	%o2
	fnegd	%f14,	%f6
	ldx	[%l7 + 0x70],	%g2
	movl	%xcc,	%g1,	%i7
	fandnot2s	%f4,	%f1,	%f4
	ldsw	[%l7 + 0x54],	%o7
	and	%l3,	%i5,	%o1
	srl	%o4,	0x13,	%o3
	ldd	[%l7 + 0x58],	%f2
	st	%f13,	[%l7 + 0x4C]
	array8	%o6,	%l5,	%l1
	movrgz	%i2,	%i6,	%i1
	fsrc1s	%f6,	%f1
	umulcc	%l6,	0x0ACF,	%l0
	lduh	[%l7 + 0x78],	%i3
	alignaddr	%o0,	%l2,	%l4
	ldx	[%l7 + 0x70],	%g3
	fmovdgu	%xcc,	%f13,	%f14
	sdiv	%i0,	0x1990,	%g7
	andcc	%i4,	0x1D92,	%g6
	movvs	%xcc,	%g4,	%o5
	subcc	%o2,	0x0C41,	%g5
	edge8ln	%g1,	%i7,	%g2
	sdivx	%l3,	0x05B2,	%i5
	sth	%o1,	[%l7 + 0x24]
	movrne	%o7,	%o4,	%o6
	ldsw	[%l7 + 0x28],	%o3
	ldd	[%l7 + 0x60],	%l4
	movne	%icc,	%i2,	%i6
	fmovrdlz	%l1,	%f2,	%f4
	edge32l	%l6,	%l0,	%i1
	movre	%o0,	%l2,	%l4
	umul	%i3,	%i0,	%g3
	subcc	%i4,	%g7,	%g4
	fcmpgt16	%f0,	%f2,	%o5
	edge32n	%o2,	%g6,	%g5
	fornot1	%f14,	%f12,	%f0
	srax	%g1,	%g2,	%i7
	umul	%i5,	0x0198,	%o1
	movrlez	%o7,	%l3,	%o4
	fornot2	%f6,	%f6,	%f14
	srl	%o3,	0x1A,	%o6
	move	%icc,	%i2,	%l5
	fandnot1s	%f3,	%f11,	%f15
	fpadd32	%f6,	%f2,	%f8
	orn	%l1,	%l6,	%i6
	restore %l0, %i1, %l2
	lduh	[%l7 + 0x10],	%l4
	fpsub32s	%f7,	%f10,	%f7
	andncc	%i3,	%o0,	%i0
	smulcc	%i4,	%g7,	%g4
	fnors	%f1,	%f8,	%f8
	edge16	%o5,	%o2,	%g6
	srax	%g5,	0x02,	%g3
	fmovrsne	%g1,	%f12,	%f4
	addcc	%g2,	0x1BA3,	%i7
	fmuld8ulx16	%f11,	%f11,	%f0
	udivcc	%i5,	0x1072,	%o1
	move	%icc,	%o7,	%o4
	sllx	%o3,	0x15,	%l3
	smul	%i2,	%o6,	%l5
	add	%l1,	0x10CA,	%l6
	xnorcc	%i6,	%l0,	%l2
	fmovsge	%icc,	%f8,	%f6
	stx	%i1,	[%l7 + 0x08]
	movne	%xcc,	%i3,	%o0
	andn	%l4,	%i4,	%i0
	fmovdle	%icc,	%f7,	%f3
	fpadd16	%f14,	%f6,	%f14
	and	%g7,	%o5,	%o2
	edge8l	%g6,	%g5,	%g3
	ldsw	[%l7 + 0x2C],	%g4
	fornot1	%f6,	%f2,	%f8
	movgu	%icc,	%g2,	%i7
	fsrc2	%f4,	%f10
	sethi	0x0775,	%i5
	movvc	%icc,	%o1,	%o7
	fcmped	%fcc2,	%f4,	%f0
	mulscc	%o4,	0x1AB7,	%g1
	fmovdgu	%xcc,	%f10,	%f14
	fpadd32	%f12,	%f14,	%f14
	xor	%l3,	%o3,	%i2
	popc	0x0769,	%o6
	edge16l	%l5,	%l1,	%i6
	sdivcc	%l0,	0x1578,	%l2
	movrlz	%l6,	%i3,	%o0
	ldub	[%l7 + 0x30],	%l4
	subccc	%i1,	0x11DF,	%i4
	movn	%icc,	%i0,	%g7
	movvc	%xcc,	%o5,	%o2
	sdiv	%g5,	0x153E,	%g6
	edge32l	%g3,	%g2,	%i7
	srax	%i5,	0x04,	%g4
	fmul8x16	%f15,	%f14,	%f10
	movn	%xcc,	%o7,	%o1
	sra	%g1,	%o4,	%o3
	movl	%xcc,	%i2,	%l3
	andncc	%o6,	%l5,	%i6
	stw	%l0,	[%l7 + 0x6C]
	fsrc2	%f6,	%f2
	fmovrsne	%l1,	%f12,	%f13
	sth	%l2,	[%l7 + 0x3C]
	andncc	%i3,	%l6,	%l4
	udivcc	%o0,	0x13D8,	%i1
	fabsd	%f2,	%f8
	array16	%i0,	%i4,	%g7
	sdiv	%o2,	0x1EFE,	%o5
	siam	0x0
	save %g5, 0x0CEC, %g6
	sdivcc	%g2,	0x0834,	%i7
	movle	%icc,	%g3,	%i5
	ldsb	[%l7 + 0x5C],	%o7
	sllx	%g4,	0x16,	%g1
	xorcc	%o4,	0x1917,	%o3
	umulcc	%o1,	0x1380,	%i2
	fmovdvc	%xcc,	%f7,	%f5
	and	%o6,	%l3,	%l5
	addcc	%i6,	%l0,	%l1
	fmovscc	%xcc,	%f12,	%f1
	fnot1s	%f12,	%f6
	ldd	[%l7 + 0x20],	%i2
	fors	%f1,	%f6,	%f5
	mulx	%l2,	%l6,	%o0
	edge32	%i1,	%i0,	%l4
	movle	%xcc,	%g7,	%o2
	orcc	%i4,	%o5,	%g5
	mulx	%g6,	0x09BF,	%i7
	ldsw	[%l7 + 0x10],	%g3
	fnegd	%f12,	%f8
	edge8n	%i5,	%g2,	%g4
	or	%g1,	%o4,	%o3
	movrgez	%o7,	%i2,	%o1
	fmovse	%xcc,	%f4,	%f10
	ldd	[%l7 + 0x58],	%f0
	fmovsle	%xcc,	%f15,	%f5
	ldsw	[%l7 + 0x1C],	%o6
	subccc	%l5,	0x03D5,	%i6
	udivx	%l3,	0x16B0,	%l0
	movvc	%icc,	%i3,	%l1
	fandnot1s	%f5,	%f13,	%f6
	movg	%xcc,	%l2,	%l6
	array16	%i1,	%i0,	%l4
	sra	%o0,	%o2,	%i4
	ldsh	[%l7 + 0x12],	%g7
	movle	%icc,	%g5,	%o5
	edge16l	%i7,	%g3,	%i5
	andncc	%g6,	%g4,	%g1
	movvc	%xcc,	%g2,	%o4
	movre	%o3,	%i2,	%o1
	stb	%o7,	[%l7 + 0x15]
	movvs	%xcc,	%o6,	%i6
	fmovsleu	%xcc,	%f15,	%f12
	sra	%l3,	0x0F,	%l5
	array8	%i3,	%l1,	%l2
	fmovdgu	%icc,	%f0,	%f8
	fnands	%f14,	%f9,	%f9
	fmovdvs	%icc,	%f1,	%f14
	ldsw	[%l7 + 0x30],	%l0
	ldd	[%l7 + 0x60],	%i6
	fmovscc	%icc,	%f10,	%f6
	sethi	0x1712,	%i0
	sub	%i1,	%l4,	%o2
	edge16l	%i4,	%g7,	%g5
	edge8n	%o0,	%i7,	%o5
	fmovdcs	%xcc,	%f8,	%f15
	ldsb	[%l7 + 0x5F],	%g3
	subccc	%g6,	%i5,	%g4
	fpsub16	%f8,	%f12,	%f10
	movne	%xcc,	%g2,	%o4
	movrlez	%g1,	0x345,	%o3
	edge8	%i2,	%o1,	%o7
	alignaddr	%i6,	%o6,	%l3
	addccc	%l5,	0x1BB5,	%i3
	subc	%l1,	%l2,	%l6
	fmul8x16au	%f10,	%f2,	%f6
	addcc	%i0,	%l0,	%l4
	mulx	%i1,	0x14F7,	%o2
	fpadd32	%f8,	%f6,	%f0
	movg	%xcc,	%i4,	%g5
	fcmpeq32	%f6,	%f14,	%g7
	edge16	%o0,	%i7,	%o5
	array8	%g6,	%g3,	%g4
	movle	%icc,	%g2,	%o4
	orn	%i5,	%g1,	%o3
	mova	%xcc,	%i2,	%o7
	fpadd32	%f4,	%f10,	%f4
	mova	%xcc,	%i6,	%o1
	fmovdneg	%xcc,	%f8,	%f4
	addcc	%o6,	0x1851,	%l3
	ldd	[%l7 + 0x60],	%f0
	movrgez	%i3,	%l5,	%l2
	sdivcc	%l1,	0x1A20,	%l6
	movvs	%icc,	%i0,	%l4
	subcc	%i1,	%o2,	%l0
	andn	%i4,	%g7,	%o0
	fmovrdgez	%g5,	%f12,	%f14
	add	%o5,	0x0F9E,	%i7
	array16	%g6,	%g3,	%g2
	fxor	%f14,	%f14,	%f2
	orncc	%o4,	0x1374,	%i5
	fcmpeq32	%f8,	%f6,	%g4
	xnorcc	%o3,	0x0E2E,	%g1
	ldsw	[%l7 + 0x7C],	%o7
	srl	%i6,	%i2,	%o1
	andcc	%l3,	%i3,	%o6
	udivcc	%l5,	0x04D5,	%l1
	movgu	%xcc,	%l6,	%i0
	st	%f3,	[%l7 + 0x40]
	fmovsg	%icc,	%f2,	%f14
	array32	%l2,	%i1,	%o2
	move	%xcc,	%l4,	%i4
	sllx	%g7,	0x10,	%l0
	fmovrsne	%o0,	%f4,	%f6
	ldd	[%l7 + 0x68],	%f10
	edge32n	%g5,	%o5,	%i7
	edge8l	%g3,	%g2,	%o4
	edge32l	%i5,	%g4,	%g6
	ld	[%l7 + 0x70],	%f3
	and	%o3,	%o7,	%i6
	ldsh	[%l7 + 0x50],	%g1
	fmovdle	%icc,	%f1,	%f12
	ldsh	[%l7 + 0x08],	%o1
	movge	%xcc,	%l3,	%i2
	edge32ln	%i3,	%l5,	%o6
	fnegd	%f12,	%f8
	movrgz	%l1,	0x171,	%i0
	std	%f12,	[%l7 + 0x60]
	movrgz	%l2,	0x29D,	%i1
	fnot1s	%f13,	%f9
	xnorcc	%l6,	0x075A,	%o2
	subcc	%l4,	%i4,	%l0
	srax	%o0,	0x07,	%g7
	ld	[%l7 + 0x3C],	%f15
	edge8	%o5,	%i7,	%g3
	edge8n	%g5,	%g2,	%o4
	movrne	%g4,	0x0A1,	%g6
	subccc	%o3,	%i5,	%i6
	edge8n	%o7,	%o1,	%g1
	fcmpgt32	%f6,	%f12,	%i2
	fmovdcc	%xcc,	%f15,	%f10
	udiv	%l3,	0x013D,	%l5
	fmovdle	%xcc,	%f6,	%f13
	edge8ln	%i3,	%l1,	%i0
	movge	%icc,	%l2,	%i1
	edge32l	%l6,	%o2,	%o6
	array32	%l4,	%i4,	%o0
	movrgz	%g7,	0x135,	%o5
	array32	%l0,	%i7,	%g3
	andncc	%g5,	%o4,	%g4
	fmovdle	%xcc,	%f11,	%f2
	save %g6, %g2, %i5
	fmovspos	%xcc,	%f4,	%f5
	fsrc2s	%f12,	%f9
	edge32ln	%i6,	%o7,	%o1
	fcmpne16	%f2,	%f2,	%g1
	movpos	%xcc,	%o3,	%l3
	fmovsne	%icc,	%f15,	%f2
	movcs	%icc,	%l5,	%i2
	movl	%icc,	%l1,	%i3
	restore %l2, 0x056E, %i0
	udivcc	%i1,	0x1512,	%o2
	edge32l	%l6,	%o6,	%i4
	movg	%icc,	%o0,	%l4
	xorcc	%o5,	%g7,	%i7
	movcc	%xcc,	%g3,	%g5
	sdivx	%o4,	0x1467,	%l0
	subc	%g6,	0x1A9F,	%g4
	alignaddrl	%g2,	%i5,	%i6
	movneg	%icc,	%o1,	%o7
	edge16ln	%o3,	%l3,	%l5
	movrne	%i2,	%l1,	%i3
	xnorcc	%g1,	0x12CD,	%i0
	srl	%l2,	%o2,	%l6
	udivcc	%i1,	0x0234,	%i4
	fmovdl	%icc,	%f4,	%f0
	array8	%o0,	%o6,	%o5
	movge	%icc,	%l4,	%g7
	ldub	[%l7 + 0x33],	%g3
	move	%xcc,	%g5,	%i7
	array8	%o4,	%l0,	%g6
	edge16ln	%g2,	%i5,	%i6
	fmul8ulx16	%f8,	%f2,	%f8
	lduh	[%l7 + 0x46],	%o1
	popc	%o7,	%o3
	fnot2s	%f13,	%f7
	fnot2s	%f14,	%f12
	fpackfix	%f6,	%f4
	movcs	%xcc,	%l3,	%g4
	edge8ln	%i2,	%l1,	%i3
	ldsh	[%l7 + 0x40],	%g1
	orn	%i0,	%l5,	%o2
	restore %l2, 0x1E3E, %i1
	array16	%l6,	%o0,	%i4
	sllx	%o5,	0x1C,	%l4
	restore %o6, 0x00A6, %g7
	fmul8x16	%f5,	%f12,	%f10
	addc	%g3,	%g5,	%i7
	movcc	%xcc,	%l0,	%o4
	popc	%g6,	%g2
	edge8	%i5,	%o1,	%i6
	ldsw	[%l7 + 0x68],	%o3
	xor	%o7,	0x1A11,	%l3
	edge32l	%g4,	%l1,	%i3
	restore %i2, 0x0174, %g1
	fmovdn	%xcc,	%f8,	%f13
	fxors	%f15,	%f7,	%f2
	movvs	%icc,	%l5,	%o2
	fnors	%f3,	%f14,	%f0
	movvs	%icc,	%l2,	%i1
	fnot2s	%f1,	%f11
	fmovspos	%icc,	%f0,	%f7
	ldx	[%l7 + 0x38],	%l6
	movle	%icc,	%o0,	%i0
	edge16ln	%o5,	%i4,	%l4
	stb	%o6,	[%l7 + 0x5B]
	sdivx	%g7,	0x1248,	%g5
	edge16	%g3,	%l0,	%o4
	edge32l	%g6,	%g2,	%i7
	sethi	0x0B93,	%i5
	umul	%o1,	0x1A76,	%o3
	stx	%i6,	[%l7 + 0x48]
	fmovsge	%xcc,	%f4,	%f3
	umulcc	%l3,	%o7,	%l1
	movne	%icc,	%g4,	%i3
	ldd	[%l7 + 0x60],	%i2
	subc	%g1,	0x1021,	%o2
	movvc	%icc,	%l5,	%i1
	movle	%icc,	%l6,	%l2
	xor	%o0,	0x19A1,	%o5
	array32	%i4,	%i0,	%o6
	udivcc	%l4,	0x0C02,	%g5
	restore %g7, 0x0451, %g3
	srl	%o4,	0x09,	%g6
	fmovrsgez	%l0,	%f9,	%f2
	popc	%i7,	%g2
	movneg	%icc,	%o1,	%o3
	for	%f2,	%f0,	%f10
	orn	%i6,	0x137E,	%l3
	ldsh	[%l7 + 0x44],	%i5
	edge16n	%o7,	%g4,	%i3
	alignaddr	%i2,	%g1,	%l1
	xor	%o2,	0x1752,	%i1
	orn	%l5,	%l6,	%o0
	addc	%l2,	0x06ED,	%o5
	fmovdg	%icc,	%f10,	%f15
	ldd	[%l7 + 0x30],	%i4
	movre	%o6,	0x38C,	%l4
	movgu	%icc,	%i0,	%g7
	sdivx	%g5,	0x07E1,	%o4
	orncc	%g6,	0x06E5,	%l0
	fabsd	%f8,	%f12
	fmovsne	%icc,	%f8,	%f11
	movrgz	%g3,	%g2,	%i7
	fnegd	%f6,	%f2
	ldd	[%l7 + 0x20],	%o0
	or	%o3,	%i6,	%i5
	fnegs	%f0,	%f12
	udivx	%l3,	0x1EC9,	%o7
	save %i3, 0x1204, %g4
	movneg	%xcc,	%g1,	%l1
	movle	%xcc,	%i2,	%i1
	movcc	%icc,	%o2,	%l6
	edge32l	%l5,	%o0,	%l2
	srlx	%o5,	0x1F,	%i4
	ldub	[%l7 + 0x4E],	%o6
	alignaddrl	%l4,	%i0,	%g5
	and	%g7,	0x06A9,	%o4
	fmovsgu	%icc,	%f12,	%f14
	ldsw	[%l7 + 0x74],	%g6
	sdiv	%l0,	0x02EB,	%g3
	fmovsn	%icc,	%f5,	%f12
	movcs	%icc,	%g2,	%i7
	ldd	[%l7 + 0x08],	%f6
	fmovsneg	%xcc,	%f6,	%f15
	and	%o1,	%o3,	%i5
	movrgez	%i6,	0x3EC,	%o7
	ldx	[%l7 + 0x50],	%l3
	ldsh	[%l7 + 0x54],	%g4
	umulcc	%g1,	%i3,	%l1
	ldub	[%l7 + 0x17],	%i2
	stw	%o2,	[%l7 + 0x4C]
	umulcc	%i1,	0x1B2B,	%l6
	edge16ln	%l5,	%l2,	%o5
	srax	%i4,	0x17,	%o0
	andn	%l4,	0x1160,	%o6
	fnors	%f15,	%f2,	%f0
	edge16	%g5,	%i0,	%g7
	subc	%g6,	%o4,	%g3
	std	%f6,	[%l7 + 0x78]
	ld	[%l7 + 0x5C],	%f14
	subcc	%g2,	%l0,	%i7
	fone	%f10
	fnegd	%f0,	%f8
	for	%f14,	%f2,	%f10
	edge8ln	%o1,	%i5,	%o3
	fmovdgu	%icc,	%f9,	%f10
	fmul8x16	%f9,	%f14,	%f4
	fpadd16	%f10,	%f2,	%f8
	sra	%i6,	%o7,	%l3
	movrgz	%g1,	%g4,	%i3
	sth	%l1,	[%l7 + 0x64]
	ldsh	[%l7 + 0x3E],	%o2
	srl	%i1,	%i2,	%l5
	edge8l	%l6,	%o5,	%l2
	edge16	%o0,	%i4,	%o6
	umul	%l4,	%g5,	%g7
	fones	%f4
	movrgz	%i0,	%o4,	%g3
	st	%f15,	[%l7 + 0x74]
	sll	%g6,	0x11,	%l0
	sub	%i7,	0x0805,	%g2
	smulcc	%o1,	0x1689,	%o3
	movcc	%xcc,	%i5,	%i6
	fmuld8ulx16	%f1,	%f3,	%f14
	orn	%l3,	%o7,	%g1
	movg	%xcc,	%i3,	%l1
	subccc	%o2,	0x048E,	%g4
	movpos	%icc,	%i2,	%i1
	ld	[%l7 + 0x78],	%f4
	fmovrdgez	%l5,	%f4,	%f2
	siam	0x4
	sdivcc	%l6,	0x00CB,	%l2
	udivcc	%o5,	0x10BF,	%o0
	movcs	%xcc,	%o6,	%i4
	alignaddr	%l4,	%g7,	%g5
	ldd	[%l7 + 0x50],	%f6
	edge16ln	%i0,	%o4,	%g6
	srl	%g3,	0x19,	%l0
	std	%f0,	[%l7 + 0x30]
	umul	%i7,	0x19EA,	%g2
	addc	%o3,	0x1782,	%o1
	edge8ln	%i5,	%l3,	%i6
	alignaddrl	%g1,	%o7,	%l1
	fnot1s	%f3,	%f11
	edge16ln	%o2,	%i3,	%i2
	ld	[%l7 + 0x08],	%f12
	ld	[%l7 + 0x28],	%f9
	edge32ln	%g4,	%l5,	%l6
	udivx	%l2,	0x105D,	%o5
	sethi	0x1ADA,	%o0
	fmovde	%xcc,	%f5,	%f9
	save %i1, 0x1A48, %o6
	fmuld8ulx16	%f13,	%f0,	%f10
	stx	%l4,	[%l7 + 0x28]
	edge16l	%g7,	%g5,	%i4
	std	%f8,	[%l7 + 0x08]
	edge16	%i0,	%g6,	%o4
	fsrc1	%f6,	%f2
	addccc	%g3,	0x033F,	%i7
	ldd	[%l7 + 0x68],	%f12
	mulx	%g2,	%o3,	%l0
	movleu	%icc,	%i5,	%l3
	movrgz	%o1,	0x387,	%g1
	lduw	[%l7 + 0x44],	%i6
	fmovrdlez	%o7,	%f12,	%f2
	fmovsle	%xcc,	%f2,	%f9
	srl	%l1,	%o2,	%i2
	fandnot2	%f2,	%f0,	%f6
	movrgez	%g4,	0x31E,	%i3
	andncc	%l6,	%l2,	%l5
	umul	%o5,	0x0290,	%o0
	movrgz	%i1,	%l4,	%o6
	fpsub32s	%f5,	%f3,	%f5
	st	%f4,	[%l7 + 0x40]
	mulx	%g5,	0x1CEF,	%g7
	stb	%i0,	[%l7 + 0x2D]
	umulcc	%g6,	0x1A0C,	%o4
	array16	%g3,	%i4,	%g2
	smulcc	%i7,	0x0058,	%l0
	sdiv	%i5,	0x1240,	%o3
	movgu	%icc,	%l3,	%o1
	fmovde	%xcc,	%f8,	%f0
	edge32ln	%g1,	%i6,	%o7
	edge8l	%l1,	%i2,	%o2
	mulx	%i3,	%l6,	%l2
	edge32n	%l5,	%o5,	%o0
	movvs	%xcc,	%i1,	%g4
	umul	%l4,	0x18AE,	%g5
	sub	%g7,	0x140F,	%i0
	movrgz	%g6,	%o4,	%o6
	udivcc	%g3,	0x0548,	%i4
	movvs	%icc,	%g2,	%i7
	srlx	%l0,	0x1E,	%o3
	movle	%xcc,	%i5,	%o1
	movrlez	%g1,	%l3,	%o7
	sth	%i6,	[%l7 + 0x3C]
	sdivx	%i2,	0x070B,	%l1
	fmovdleu	%icc,	%f5,	%f15
	sub	%o2,	%l6,	%l2
	fandnot1s	%f5,	%f13,	%f1
	restore %i3, 0x1DF6, %o5
	array16	%l5,	%o0,	%g4
	fmovdvc	%icc,	%f14,	%f8
	sdivx	%l4,	0x1D12,	%g5
	sth	%i1,	[%l7 + 0x50]
	movneg	%xcc,	%i0,	%g7
	edge32l	%g6,	%o4,	%o6
	smulcc	%i4,	0x0F13,	%g2
	sub	%i7,	0x0FA8,	%g3
	array16	%o3,	%l0,	%i5
	edge8n	%g1,	%o1,	%o7
	movrlez	%l3,	0x287,	%i2
	fcmpd	%fcc2,	%f14,	%f4
	fmovdge	%xcc,	%f13,	%f6
	sll	%l1,	%o2,	%l6
	ldsw	[%l7 + 0x6C],	%l2
	fmovdgu	%xcc,	%f9,	%f11
	ldsb	[%l7 + 0x7D],	%i3
	srax	%o5,	%i6,	%o0
	orcc	%g4,	%l4,	%g5
	fnors	%f5,	%f10,	%f14
	smulcc	%i1,	%i0,	%g7
	ld	[%l7 + 0x6C],	%f6
	edge32ln	%l5,	%g6,	%o4
	movrlez	%o6,	%g2,	%i7
	fcmped	%fcc3,	%f14,	%f6
	umul	%i4,	%g3,	%l0
	srlx	%o3,	0x16,	%i5
	fpsub32s	%f1,	%f2,	%f6
	orncc	%g1,	0x03F6,	%o1
	fors	%f1,	%f1,	%f6
	movpos	%icc,	%o7,	%i2
	mulscc	%l3,	%o2,	%l1
	fmovrdgz	%l2,	%f6,	%f0
	fmovdvc	%icc,	%f4,	%f1
	movvc	%icc,	%l6,	%o5
	ldx	[%l7 + 0x28],	%i3
	sll	%i6,	0x0A,	%o0
	sdivcc	%g4,	0x1A6A,	%g5
	udivcc	%i1,	0x08E8,	%i0
	fnot2s	%f2,	%f13
	mulx	%l4,	0x182F,	%l5
	fmovrdgez	%g7,	%f2,	%f14
	save %o4, %o6, %g2
	fmovrdgz	%g6,	%f2,	%f14
	movge	%xcc,	%i4,	%g3
	fcmpd	%fcc3,	%f6,	%f8
	movneg	%icc,	%i7,	%o3
	movre	%i5,	%g1,	%o1
	alignaddrl	%l0,	%i2,	%l3
	udiv	%o7,	0x1A0C,	%o2
	edge16n	%l2,	%l1,	%l6
	sll	%i3,	0x01,	%i6
	sll	%o5,	%g4,	%o0
	sethi	0x0473,	%i1
	orncc	%i0,	0x0CD0,	%g5
	ldsh	[%l7 + 0x76],	%l5
	movcc	%icc,	%g7,	%o4
	ldsb	[%l7 + 0x58],	%o6
	mulscc	%g2,	%g6,	%i4
	movle	%xcc,	%l4,	%i7
	ld	[%l7 + 0x10],	%f15
	fnot1s	%f13,	%f4
	xorcc	%o3,	0x1FD9,	%g3
	orn	%i5,	0x0E3C,	%o1
	movn	%xcc,	%l0,	%g1
	ldub	[%l7 + 0x60],	%l3
	fmovdne	%icc,	%f13,	%f11
	array16	%i2,	%o2,	%o7
	movneg	%xcc,	%l2,	%l1
	ldx	[%l7 + 0x30],	%i3
	edge32l	%i6,	%l6,	%g4
	movg	%icc,	%o0,	%i1
	orn	%i0,	%g5,	%l5
	ldsw	[%l7 + 0x44],	%o5
	std	%f6,	[%l7 + 0x70]
	and	%o4,	0x0ADB,	%g7
	fcmple16	%f8,	%f8,	%g2
	st	%f15,	[%l7 + 0x3C]
	xnorcc	%g6,	0x19A8,	%o6
	movleu	%icc,	%i4,	%l4
	movrne	%i7,	%o3,	%g3
	save %i5, %l0, %o1
	fmovrdgez	%g1,	%f6,	%f10
	orcc	%i2,	0x1204,	%o2
	addcc	%o7,	%l3,	%l1
	movgu	%xcc,	%l2,	%i6
	stb	%i3,	[%l7 + 0x45]
	ldub	[%l7 + 0x79],	%g4
	alignaddr	%l6,	%o0,	%i0
	fxors	%f2,	%f11,	%f0
	movre	%i1,	0x3AD,	%l5
	movvc	%xcc,	%g5,	%o4
	stb	%o5,	[%l7 + 0x31]
	movcs	%xcc,	%g7,	%g6
	edge32l	%o6,	%g2,	%l4
	save %i4, 0x16DA, %i7
	add	%g3,	%o3,	%i5
	and	%o1,	%l0,	%i2
	std	%f4,	[%l7 + 0x78]
	srax	%g1,	0x04,	%o7
	std	%f10,	[%l7 + 0x78]
	addccc	%o2,	%l1,	%l2
	umul	%i6,	%i3,	%l3
	save %g4, %o0, %i0
	ldub	[%l7 + 0x57],	%l6
	srlx	%l5,	%i1,	%g5
	fpsub32s	%f6,	%f11,	%f5
	mulx	%o5,	0x0245,	%o4
	movrne	%g7,	0x3E2,	%o6
	fmovdg	%xcc,	%f9,	%f11
	movrne	%g6,	0x176,	%l4
	addcc	%i4,	0x107A,	%g2
	movn	%xcc,	%i7,	%g3
	srax	%i5,	0x11,	%o3
	std	%f12,	[%l7 + 0x68]
	fmovrsgez	%l0,	%f4,	%f10
	ldub	[%l7 + 0x2A],	%i2
	xorcc	%o1,	0x14D6,	%g1
	fmovrslez	%o7,	%f12,	%f13
	edge8l	%o2,	%l2,	%i6
	subcc	%l1,	0x0DBD,	%l3
	xorcc	%i3,	%g4,	%o0
	movcc	%icc,	%l6,	%i0
	fmul8x16	%f10,	%f14,	%f2
	fmovda	%xcc,	%f2,	%f1
	smul	%l5,	0x17C9,	%g5
	fcmpgt16	%f14,	%f10,	%i1
	xor	%o5,	%g7,	%o4
	sdiv	%g6,	0x0FD3,	%o6
	bshuffle	%f8,	%f12,	%f14
	ldsw	[%l7 + 0x60],	%i4
	movcc	%xcc,	%l4,	%g2
	move	%icc,	%g3,	%i7
	movvs	%icc,	%i5,	%o3
	movg	%xcc,	%i2,	%l0
	fone	%f8
	ldsw	[%l7 + 0x54],	%g1
	array16	%o1,	%o2,	%l2
	edge16l	%i6,	%o7,	%l1
	stw	%l3,	[%l7 + 0x6C]
	movrne	%g4,	0x2EF,	%i3
	movrlz	%o0,	%i0,	%l6
	move	%xcc,	%g5,	%i1
	mulx	%o5,	0x10C4,	%l5
	sll	%g7,	0x1C,	%g6
	addcc	%o4,	0x0507,	%o6
	popc	%l4,	%g2
	fmovdgu	%icc,	%f2,	%f7
	xorcc	%i4,	0x087E,	%g3
	movcc	%icc,	%i5,	%o3
	sll	%i2,	0x12,	%l0
	fsrc2s	%f1,	%f14
	addccc	%g1,	%o1,	%i7
	srax	%o2,	0x1B,	%l2
	stw	%o7,	[%l7 + 0x10]
	movge	%xcc,	%l1,	%l3
	andn	%i6,	0x1116,	%g4
	movvs	%icc,	%i3,	%o0
	fornot2	%f6,	%f14,	%f4
	alignaddrl	%i0,	%g5,	%i1
	movrlez	%o5,	%l5,	%l6
	array16	%g6,	%g7,	%o6
	edge16ln	%l4,	%g2,	%o4
	or	%i4,	0x060A,	%g3
	fmovdneg	%icc,	%f13,	%f1
	subc	%o3,	0x1D38,	%i2
	xorcc	%l0,	0x1C25,	%i5
	lduh	[%l7 + 0x24],	%g1
	fnor	%f12,	%f12,	%f14
	movg	%xcc,	%o1,	%i7
	fpsub16	%f8,	%f4,	%f2
	and	%o2,	%o7,	%l1
	fexpand	%f7,	%f8
	and	%l3,	0x0D7C,	%l2
	xor	%i6,	0x166F,	%i3
	ldsh	[%l7 + 0x3E],	%o0
	ldd	[%l7 + 0x50],	%g4
	array8	%i0,	%g5,	%i1
	umulcc	%l5,	0x1B60,	%o5
	stw	%g6,	[%l7 + 0x14]
	edge32ln	%g7,	%o6,	%l4
	edge8l	%l6,	%o4,	%i4
	smul	%g2,	%g3,	%i2
	addcc	%o3,	%l0,	%i5
	array8	%g1,	%o1,	%o2
	edge8l	%o7,	%i7,	%l1
	fmovscc	%icc,	%f12,	%f7
	ldd	[%l7 + 0x08],	%l2
	movl	%xcc,	%l3,	%i3
	ldd	[%l7 + 0x48],	%o0
	orcc	%i6,	%i0,	%g4
	and	%i1,	%g5,	%o5
	fmovsge	%xcc,	%f12,	%f14
	edge16	%l5,	%g7,	%o6
	fpack16	%f8,	%f0
	ldd	[%l7 + 0x70],	%l4
	movcc	%xcc,	%g6,	%o4
	popc	0x0DCE,	%l6
	sllx	%i4,	0x19,	%g2
	fsrc2s	%f5,	%f12
	movge	%xcc,	%i2,	%g3
	stx	%l0,	[%l7 + 0x60]
	ldd	[%l7 + 0x10],	%i4
	subc	%g1,	%o1,	%o3
	sethi	0x12DD,	%o7
	udiv	%o2,	0x0F09,	%l1
	sdivcc	%i7,	0x0E5A,	%l2
	movcc	%xcc,	%l3,	%o0
	movre	%i6,	%i3,	%g4
	siam	0x0
	fandnot2s	%f0,	%f15,	%f1
	movle	%icc,	%i0,	%i1
	movleu	%xcc,	%o5,	%l5
	sdiv	%g5,	0x1CAE,	%g7
	sth	%l4,	[%l7 + 0x4E]
	edge8l	%g6,	%o4,	%o6
	move	%xcc,	%i4,	%l6
	sth	%g2,	[%l7 + 0x34]
	fpack32	%f10,	%f4,	%f0
	udivcc	%i2,	0x0A22,	%l0
	std	%f10,	[%l7 + 0x40]
	andcc	%g3,	0x158A,	%g1
	movgu	%icc,	%o1,	%o3
	st	%f15,	[%l7 + 0x18]
	fmovdcs	%xcc,	%f2,	%f13
	addccc	%o7,	0x08BC,	%o2
	ldd	[%l7 + 0x08],	%i4
	array16	%l1,	%i7,	%l2
	movle	%icc,	%l3,	%o0
	and	%i6,	%i3,	%g4
	orcc	%i1,	%o5,	%i0
	sth	%l5,	[%l7 + 0x58]
	fnot1	%f10,	%f12
	mova	%icc,	%g5,	%g7
	ldub	[%l7 + 0x73],	%g6
	alignaddrl	%l4,	%o4,	%o6
	orcc	%i4,	0x03B8,	%g2
	subccc	%i2,	0x1436,	%l0
	sdivx	%g3,	0x1C65,	%l6
	lduw	[%l7 + 0x24],	%o1
	edge16ln	%g1,	%o7,	%o2
	lduh	[%l7 + 0x50],	%i5
	srl	%l1,	0x00,	%i7
	movn	%icc,	%l2,	%l3
	popc	%o0,	%o3
	edge8ln	%i6,	%i3,	%i1
	sdivcc	%g4,	0x0F3F,	%o5
	srlx	%i0,	%g5,	%l5
	movcs	%xcc,	%g7,	%l4
	sdivx	%g6,	0x1CCF,	%o4
	edge32ln	%i4,	%g2,	%i2
	fnot1s	%f3,	%f13
	umul	%l0,	%o6,	%g3
	addcc	%l6,	%g1,	%o1
	fmovdn	%xcc,	%f8,	%f8
	subcc	%o2,	0x01A6,	%i5
	fmovdle	%xcc,	%f15,	%f10
	umulcc	%l1,	%i7,	%l2
	movneg	%xcc,	%o7,	%o0
	lduw	[%l7 + 0x60],	%l3
	restore %i6, %o3, %i1
	smul	%i3,	%g4,	%i0
	orncc	%g5,	0x0EB3,	%l5
	lduh	[%l7 + 0x72],	%o5
	add	%l4,	%g6,	%o4
	st	%f4,	[%l7 + 0x54]
	sub	%g7,	%g2,	%i2
	subc	%i4,	%o6,	%g3
	sub	%l6,	%g1,	%l0
	sth	%o2,	[%l7 + 0x52]
	sdiv	%i5,	0x034D,	%l1
	movrgez	%o1,	%l2,	%o7
	fmovscs	%icc,	%f7,	%f6
	movcs	%icc,	%o0,	%l3
	ldsb	[%l7 + 0x50],	%i7
	stx	%i6,	[%l7 + 0x48]
	stx	%i1,	[%l7 + 0x48]
	movrlz	%i3,	%g4,	%i0
	stb	%o3,	[%l7 + 0x5C]
	subcc	%g5,	0x0065,	%o5
	ldx	[%l7 + 0x50],	%l5
	edge32	%l4,	%o4,	%g6
	edge32l	%g2,	%g7,	%i4
	udivx	%i2,	0x16E5,	%o6
	ldd	[%l7 + 0x38],	%g2
	fcmple32	%f4,	%f0,	%l6
	save %l0, %o2, %g1
	ldub	[%l7 + 0x43],	%l1
	fornot2s	%f0,	%f1,	%f8
	movrlez	%i5,	0x089,	%o1
	stx	%l2,	[%l7 + 0x20]
	movcc	%xcc,	%o7,	%o0
	popc	0x1A14,	%l3
	edge8ln	%i6,	%i1,	%i3
	restore %i7, %i0, %g4
	ldd	[%l7 + 0x50],	%o2
	save %g5, 0x0200, %o5
	bshuffle	%f4,	%f6,	%f6
	fcmple32	%f10,	%f2,	%l5
	sethi	0x1DE4,	%o4
	fmovdg	%xcc,	%f3,	%f2
	fabss	%f0,	%f4
	fmovdg	%icc,	%f2,	%f2
	mulscc	%l4,	0x0B96,	%g2
	mova	%icc,	%g6,	%i4
	ldub	[%l7 + 0x17],	%g7
	subc	%o6,	0x09CB,	%g3
	array32	%l6,	%i2,	%o2
	ldsb	[%l7 + 0x49],	%l0
	ldub	[%l7 + 0x5B],	%g1
	fmovspos	%xcc,	%f11,	%f7
	smulcc	%l1,	%i5,	%o1
	subcc	%l2,	%o7,	%l3
	lduw	[%l7 + 0x3C],	%i6
	fpadd32s	%f7,	%f0,	%f1
	edge8ln	%i1,	%o0,	%i3
	ldx	[%l7 + 0x68],	%i0
	movn	%xcc,	%g4,	%i7
	sdiv	%o3,	0x0A2C,	%o5
	popc	0x0034,	%l5
	addc	%o4,	%g5,	%l4
	stw	%g6,	[%l7 + 0x30]
	array8	%i4,	%g2,	%o6
	fmovdvs	%icc,	%f14,	%f1
	fornot2s	%f6,	%f2,	%f11
	mova	%xcc,	%g7,	%g3
	andncc	%l6,	%o2,	%l0
	fmul8x16al	%f14,	%f3,	%f2
	stb	%i2,	[%l7 + 0x3F]
	movrgez	%l1,	0x16F,	%g1
	fmovrsgez	%o1,	%f5,	%f4
	fpmerge	%f2,	%f6,	%f4
	subccc	%i5,	0x0BCE,	%l2
	udivcc	%l3,	0x0928,	%i6
	ldsh	[%l7 + 0x12],	%o7
	movcs	%icc,	%o0,	%i3
	orncc	%i1,	%i0,	%i7
	std	%f8,	[%l7 + 0x58]
	sra	%g4,	%o5,	%l5
	fmovdn	%xcc,	%f5,	%f5
	ldub	[%l7 + 0x43],	%o4
	movleu	%icc,	%g5,	%l4
	fpadd32	%f0,	%f6,	%f12
	movcs	%icc,	%g6,	%o3
	sll	%i4,	%g2,	%g7
	umulcc	%o6,	%l6,	%g3
	movrlez	%o2,	%l0,	%l1
	movle	%xcc,	%i2,	%o1
	edge8l	%i5,	%l2,	%l3
	stb	%g1,	[%l7 + 0x0B]
	udiv	%i6,	0x17EE,	%o0
	andncc	%o7,	%i1,	%i3
	edge16n	%i7,	%g4,	%o5
	sub	%i0,	%l5,	%o4
	movcs	%xcc,	%l4,	%g6
	subc	%o3,	0x04F5,	%g5
	fmovdcc	%xcc,	%f11,	%f7
	movn	%icc,	%g2,	%g7
	edge32n	%i4,	%o6,	%g3
	ldd	[%l7 + 0x20],	%i6
	fpack32	%f8,	%f10,	%f14
	fmovrdlez	%l0,	%f6,	%f10
	ldub	[%l7 + 0x6C],	%o2
	fmovsleu	%xcc,	%f13,	%f1
	smul	%i2,	0x1621,	%l1
	fcmpeq32	%f6,	%f8,	%o1
	fxor	%f14,	%f0,	%f6
	ldub	[%l7 + 0x27],	%l2
	fmovde	%xcc,	%f15,	%f2
	edge16	%l3,	%i5,	%i6
	xnorcc	%o0,	0x165B,	%g1
	edge32l	%i1,	%i3,	%o7
	mulscc	%g4,	%o5,	%i0
	stx	%i7,	[%l7 + 0x18]
	ldub	[%l7 + 0x1D],	%l5
	sethi	0x0733,	%l4
	sdivcc	%o4,	0x01A8,	%o3
	orn	%g6,	%g2,	%g7
	xnorcc	%g5,	%i4,	%o6
	array8	%l6,	%l0,	%g3
	andn	%o2,	0x12A6,	%l1
	edge8	%o1,	%i2,	%l2
	subccc	%l3,	0x16AC,	%i6
	udivx	%o0,	0x1FDD,	%g1
	edge16	%i1,	%i5,	%i3
	movcc	%xcc,	%o7,	%o5
	movle	%icc,	%i0,	%i7
	stx	%g4,	[%l7 + 0x60]
	addccc	%l5,	0x04DE,	%o4
	xnor	%o3,	0x0C32,	%l4
	fnot2s	%f2,	%f7
	subcc	%g6,	0x0F0B,	%g2
	popc	%g5,	%g7
	movcs	%icc,	%o6,	%i4
	fmovdne	%icc,	%f12,	%f14
	fpsub16s	%f4,	%f5,	%f5
	fmovsleu	%icc,	%f1,	%f15
	fsrc1	%f12,	%f10
	fpack16	%f4,	%f7
	movle	%xcc,	%l0,	%l6
	fzeros	%f14
	edge16ln	%o2,	%g3,	%o1
	movrgz	%i2,	0x1EA,	%l2
	xnor	%l1,	0x1D89,	%l3
	fmovrdne	%o0,	%f12,	%f2
	ldsw	[%l7 + 0x74],	%i6
	movle	%xcc,	%i1,	%g1
	fxors	%f11,	%f2,	%f0
	fmovsle	%xcc,	%f9,	%f3
	movgu	%icc,	%i3,	%i5
	sethi	0x07F6,	%o7
	ld	[%l7 + 0x30],	%f12
	edge8n	%o5,	%i7,	%i0
	fnand	%f8,	%f2,	%f2
	movcc	%icc,	%l5,	%g4
	stx	%o3,	[%l7 + 0x78]
	fmovrdgez	%o4,	%f10,	%f6
	ldsb	[%l7 + 0x26],	%g6
	sethi	0x0E37,	%g2
	udivx	%l4,	0x1B02,	%g7
	add	%g5,	0x047A,	%i4
	alignaddrl	%o6,	%l6,	%l0
	array16	%o2,	%o1,	%g3
	edge16l	%l2,	%i2,	%l3
	fmovrdgez	%l1,	%f8,	%f12
	fabss	%f7,	%f12
	mulx	%o0,	%i1,	%g1
	movpos	%xcc,	%i6,	%i3
	xnor	%o7,	0x1E08,	%i5
	fmul8x16al	%f14,	%f10,	%f4
	ldsh	[%l7 + 0x64],	%o5
	std	%f8,	[%l7 + 0x60]
	and	%i0,	0x07F2,	%l5
	ld	[%l7 + 0x34],	%f11
	fmul8x16	%f7,	%f12,	%f6
	fnands	%f7,	%f5,	%f12
	fornot2s	%f11,	%f0,	%f9
	xorcc	%g4,	0x02F0,	%o3
	fmovrdlez	%i7,	%f10,	%f10
	xnorcc	%g6,	0x1CEA,	%g2
	sub	%o4,	%l4,	%g5
	movre	%i4,	%o6,	%l6
	mova	%icc,	%g7,	%o2
	fnot1s	%f8,	%f10
	fmovsleu	%xcc,	%f14,	%f13
	movrlz	%l0,	0x3EA,	%g3
	ldub	[%l7 + 0x65],	%l2
	smulcc	%i2,	0x0720,	%o1
	movrgz	%l1,	0x1C3,	%o0
	fmovrsne	%l3,	%f7,	%f6
	umul	%i1,	0x0028,	%i6
	fmovdvs	%icc,	%f3,	%f0
	udiv	%g1,	0x1B06,	%o7
	sub	%i5,	0x0B74,	%o5
	ldx	[%l7 + 0x60],	%i3
	udiv	%l5,	0x1A9F,	%g4
	array8	%o3,	%i7,	%g6
	andn	%i0,	0x0054,	%o4
	edge16l	%g2,	%l4,	%g5
	ldub	[%l7 + 0x69],	%o6
	udiv	%i4,	0x15FF,	%g7
	move	%xcc,	%o2,	%l6
	smulcc	%g3,	%l2,	%i2
	fmovdne	%icc,	%f1,	%f5
	xor	%o1,	0x011E,	%l0
	edge16ln	%l1,	%o0,	%i1
	stw	%i6,	[%l7 + 0x4C]
	array16	%g1,	%l3,	%o7
	movrgez	%i5,	0x04F,	%i3
	st	%f3,	[%l7 + 0x28]
	ldd	[%l7 + 0x50],	%o4
	edge32l	%l5,	%o3,	%g4
	edge32l	%i7,	%i0,	%o4
	ldsh	[%l7 + 0x5E],	%g2
	fmovrdlez	%l4,	%f10,	%f8
	sdiv	%g5,	0x1688,	%o6
	fnot2s	%f13,	%f3
	movrgz	%i4,	%g6,	%g7
	and	%o2,	0x1BEF,	%g3
	movcc	%icc,	%l6,	%i2
	movrne	%o1,	%l0,	%l1
	umulcc	%o0,	%i1,	%i6
	sdivcc	%g1,	0x0F13,	%l2
	srl	%o7,	0x02,	%l3
	udiv	%i5,	0x10F0,	%o5
	sdiv	%l5,	0x136E,	%o3
	fands	%f6,	%f15,	%f12
	array16	%i3,	%i7,	%g4
	movpos	%icc,	%o4,	%i0
	movg	%icc,	%l4,	%g5
	movrgz	%g2,	0x36C,	%o6
	andn	%g6,	%i4,	%g7
	movcc	%icc,	%o2,	%l6
	restore %g3, %o1, %l0
	fmovsn	%icc,	%f14,	%f2
	mulscc	%l1,	%o0,	%i2
	movrlez	%i6,	0x399,	%i1
	edge8	%l2,	%g1,	%o7
	fsrc2s	%f6,	%f10
	ldsw	[%l7 + 0x58],	%l3
	edge16n	%o5,	%i5,	%l5
	alignaddrl	%o3,	%i3,	%i7
	movne	%icc,	%o4,	%g4
	xnor	%i0,	0x074B,	%g5
	ldub	[%l7 + 0x37],	%l4
	edge32l	%o6,	%g2,	%i4
	edge8l	%g6,	%g7,	%o2
	fmul8ulx16	%f2,	%f0,	%f8
	xnorcc	%l6,	%g3,	%o1
	edge16n	%l0,	%o0,	%i2
	movge	%xcc,	%l1,	%i6
	movgu	%xcc,	%l2,	%i1
	addccc	%g1,	%o7,	%o5
	mulscc	%i5,	%l5,	%l3
	movle	%icc,	%i3,	%i7
	ldd	[%l7 + 0x68],	%o4
	movgu	%xcc,	%g4,	%i0
	sth	%g5,	[%l7 + 0x78]
	edge16	%l4,	%o3,	%g2
	edge16n	%o6,	%i4,	%g6
	sub	%g7,	%o2,	%l6
	sra	%o1,	0x1C,	%g3
	move	%icc,	%o0,	%l0
	smul	%i2,	%l1,	%l2
	fmovsa	%icc,	%f6,	%f4
	edge16l	%i1,	%i6,	%g1
	std	%f0,	[%l7 + 0x68]
	movne	%icc,	%o7,	%i5
	udivx	%l5,	0x063A,	%l3
	xnor	%o5,	%i7,	%o4
	movrne	%i3,	0x0C2,	%g4
	movcs	%icc,	%g5,	%i0
	edge16	%o3,	%g2,	%o6
	umul	%l4,	0x04E5,	%g6
	movge	%xcc,	%g7,	%o2
	fmovrdgz	%i4,	%f12,	%f10
	fmovdne	%xcc,	%f7,	%f15
	edge8ln	%l6,	%o1,	%g3
	umulcc	%l0,	%i2,	%o0
	sub	%l1,	0x14A5,	%i1
	fmovrde	%l2,	%f0,	%f10
	movcs	%xcc,	%g1,	%i6
	or	%i5,	0x0E0F,	%l5
	fmovsa	%icc,	%f14,	%f11
	addc	%o7,	0x08F4,	%l3
	popc	%i7,	%o4
	movrlz	%i3,	0x2DD,	%g4
	mulx	%o5,	0x1F73,	%g5
	fmovsa	%xcc,	%f13,	%f11
	xnorcc	%o3,	%g2,	%i0
	movgu	%xcc,	%l4,	%o6
	movcs	%xcc,	%g6,	%g7
	sdivx	%i4,	0x016B,	%l6
	fpack32	%f2,	%f4,	%f4
	addccc	%o1,	0x1585,	%g3
	subcc	%o2,	0x0837,	%i2
	edge32n	%o0,	%l1,	%l0
	stb	%i1,	[%l7 + 0x1E]
	std	%f8,	[%l7 + 0x20]
	ldub	[%l7 + 0x32],	%l2
	restore %i6, 0x0837, %i5
	fpack16	%f0,	%f12
	fmovrde	%l5,	%f10,	%f8
	edge16n	%g1,	%l3,	%o7
	fnot2s	%f15,	%f11
	sllx	%o4,	0x0F,	%i3
	movneg	%xcc,	%g4,	%o5
	fcmple16	%f8,	%f0,	%g5
	fnors	%f1,	%f4,	%f1
	fmovdcs	%xcc,	%f15,	%f10
	movgu	%icc,	%i7,	%o3
	edge8ln	%g2,	%l4,	%o6
	stx	%i0,	[%l7 + 0x50]
	fmovsvc	%icc,	%f3,	%f7
	fands	%f3,	%f3,	%f4
	array8	%g7,	%i4,	%l6
	fmovscc	%xcc,	%f14,	%f6
	stw	%o1,	[%l7 + 0x18]
	andn	%g3,	0x1DA8,	%g6
	array32	%i2,	%o2,	%l1
	fones	%f13
	fmovdneg	%icc,	%f2,	%f1
	edge32n	%l0,	%o0,	%i1
	fxors	%f4,	%f5,	%f12
	fcmpgt16	%f4,	%f14,	%l2
	ldsb	[%l7 + 0x71],	%i5
	fnand	%f8,	%f8,	%f12
	movrgez	%i6,	%g1,	%l5
	edge8n	%l3,	%o4,	%i3
	umulcc	%o7,	0x1AC9,	%o5
	fpack16	%f8,	%f9
	andn	%g4,	%i7,	%g5
	movrgz	%o3,	0x0B4,	%g2
	movl	%xcc,	%l4,	%i0
	edge32n	%g7,	%o6,	%i4
	move	%xcc,	%l6,	%g3
	fmovd	%f2,	%f0
	movrlz	%g6,	0x310,	%i2
	xor	%o2,	%l1,	%o1
	orncc	%o0,	%i1,	%l0
	and	%l2,	%i6,	%i5
	subc	%g1,	0x0D17,	%l3
	srlx	%l5,	%i3,	%o4
	edge32l	%o7,	%g4,	%i7
	add	%o5,	%o3,	%g5
	fmuld8sux16	%f2,	%f3,	%f8
	fxors	%f15,	%f11,	%f2
	edge32n	%l4,	%i0,	%g2
	fcmple32	%f0,	%f12,	%g7
	edge16l	%i4,	%l6,	%g3
	bshuffle	%f6,	%f0,	%f0
	ldub	[%l7 + 0x30],	%g6
	array8	%i2,	%o2,	%o6
	fmuld8sux16	%f6,	%f10,	%f12
	edge16n	%l1,	%o1,	%i1
	addc	%o0,	0x0FF6,	%l2
	stb	%l0,	[%l7 + 0x15]
	sth	%i5,	[%l7 + 0x08]
	fcmpgt16	%f10,	%f14,	%i6
	addccc	%g1,	%l3,	%l5
	movg	%xcc,	%i3,	%o7
	udiv	%g4,	0x0BEF,	%i7
	edge16l	%o4,	%o5,	%o3
	lduw	[%l7 + 0x6C],	%l4
	fmovsneg	%icc,	%f4,	%f8
	and	%g5,	%g2,	%g7
	fnors	%f6,	%f10,	%f12
	alignaddr	%i4,	%l6,	%i0
	fnot2s	%f15,	%f11
	addcc	%g6,	0x0A86,	%g3
	ld	[%l7 + 0x6C],	%f13
	fpsub16	%f4,	%f14,	%f2
	alignaddrl	%i2,	%o2,	%o6
	ldsb	[%l7 + 0x0E],	%l1
	xnorcc	%i1,	%o0,	%o1
	xor	%l2,	0x15DE,	%l0
	xnor	%i5,	%i6,	%l3
	move	%icc,	%l5,	%g1
	sdivx	%o7,	0x185C,	%g4
	orn	%i3,	%o4,	%o5
	alignaddr	%i7,	%o3,	%g5
	ldd	[%l7 + 0x38],	%l4
	lduw	[%l7 + 0x2C],	%g7
	edge8l	%i4,	%g2,	%l6
	movg	%icc,	%g6,	%i0
	movgu	%icc,	%g3,	%o2
	umulcc	%o6,	%l1,	%i2
	fnot1s	%f2,	%f12
	fornot2s	%f8,	%f14,	%f14
	fmovsn	%icc,	%f3,	%f8
	udivcc	%i1,	0x1998,	%o1
	fpsub16s	%f3,	%f13,	%f10
	orn	%l2,	%o0,	%l0
	addccc	%i5,	0x0D0A,	%i6
	edge32n	%l5,	%l3,	%g1
	subcc	%o7,	%i3,	%g4
	fmovdne	%icc,	%f14,	%f8
	mova	%icc,	%o5,	%o4
	edge8l	%i7,	%o3,	%g5
	movrne	%l4,	%g7,	%g2
	edge16	%i4,	%l6,	%i0
	array16	%g3,	%o2,	%g6
	fornot2s	%f14,	%f8,	%f6
	ldx	[%l7 + 0x38],	%o6
	sdivx	%i2,	0x12D8,	%i1
	move	%icc,	%l1,	%l2
	andn	%o1,	0x0494,	%l0
	edge32ln	%i5,	%i6,	%o0
	movcc	%icc,	%l5,	%l3
	stx	%g1,	[%l7 + 0x50]
	edge32l	%i3,	%g4,	%o5
	fmovsn	%xcc,	%f1,	%f14
	fmovsg	%xcc,	%f8,	%f3
	ldsh	[%l7 + 0x0C],	%o7
	orn	%o4,	0x07AD,	%i7
	fmovdvc	%xcc,	%f1,	%f11
	popc	%o3,	%l4
	fmovrsne	%g7,	%f8,	%f9
	andcc	%g2,	0x0153,	%g5
	fandnot1s	%f4,	%f6,	%f6
	ld	[%l7 + 0x58],	%f12
	movge	%icc,	%i4,	%i0
	ldd	[%l7 + 0x28],	%f14
	fmovdgu	%icc,	%f15,	%f10
	movneg	%icc,	%l6,	%o2
	edge16	%g3,	%o6,	%g6
	edge8	%i1,	%l1,	%l2
	edge8	%i2,	%o1,	%i5
	ldx	[%l7 + 0x28],	%l0
	edge16n	%i6,	%l5,	%l3
	edge8l	%o0,	%i3,	%g4
	fmovrdlz	%g1,	%f8,	%f12
	fandnot2	%f4,	%f10,	%f10
	movge	%icc,	%o5,	%o4
	movre	%i7,	0x194,	%o7
	ldsh	[%l7 + 0x46],	%o3
	addc	%g7,	0x113D,	%g2
	fsrc2s	%f4,	%f0
	fandnot1	%f4,	%f14,	%f4
	movrne	%g5,	0x359,	%l4
	andcc	%i4,	0x03F4,	%l6
	addcc	%i0,	%g3,	%o2
	fnot2	%f2,	%f8
	edge8n	%o6,	%g6,	%l1
	xnor	%i1,	%i2,	%l2
	fpackfix	%f14,	%f4
	fnegd	%f2,	%f6
	faligndata	%f12,	%f8,	%f2
	array8	%i5,	%l0,	%i6
	edge8	%o1,	%l3,	%o0
	smulcc	%l5,	0x19DE,	%i3
	fmovrsne	%g1,	%f7,	%f3
	movrlz	%g4,	0x3D4,	%o4
	movge	%xcc,	%o5,	%i7
	ldd	[%l7 + 0x50],	%o6
	movvs	%xcc,	%o3,	%g7
	fcmpeq16	%f10,	%f4,	%g5
	movn	%xcc,	%l4,	%g2
	movne	%icc,	%i4,	%l6
	array16	%g3,	%o2,	%o6
	orn	%g6,	0x0461,	%l1
	andncc	%i1,	%i0,	%l2
	movrlz	%i2,	0x0D6,	%l0
	srax	%i5,	0x0C,	%i6
	fxors	%f3,	%f8,	%f8
	fmovda	%icc,	%f2,	%f11
	restore %o1, %o0, %l3
	fpsub32	%f6,	%f14,	%f8
	edge16ln	%i3,	%l5,	%g1
	ldub	[%l7 + 0x6F],	%g4
	sllx	%o5,	%i7,	%o4
	fabss	%f4,	%f7
	fmovdcs	%xcc,	%f8,	%f6
	edge8	%o7,	%g7,	%o3
	ldsh	[%l7 + 0x6A],	%g5
	array16	%l4,	%i4,	%g2
	udivcc	%l6,	0x0657,	%g3
	srlx	%o2,	%o6,	%g6
	edge16	%l1,	%i0,	%l2
	fands	%f13,	%f11,	%f13
	ldsw	[%l7 + 0x08],	%i2
	ldd	[%l7 + 0x40],	%f14
	xnor	%i1,	%l0,	%i5
	stb	%i6,	[%l7 + 0x4B]
	fsrc2	%f6,	%f14
	fmuld8sux16	%f12,	%f11,	%f6
	fxors	%f9,	%f3,	%f8
	fmovsa	%icc,	%f3,	%f7
	fmovde	%icc,	%f5,	%f7
	movcc	%xcc,	%o1,	%o0
	fandnot1	%f6,	%f2,	%f10
	faligndata	%f4,	%f8,	%f0
	stb	%i3,	[%l7 + 0x29]
	fors	%f10,	%f9,	%f0
	fsrc2	%f6,	%f0
	addcc	%l3,	0x12D1,	%l5
	fcmpgt16	%f10,	%f6,	%g1
	fnor	%f2,	%f2,	%f14
	srlx	%g4,	%o5,	%o4
	mova	%xcc,	%o7,	%i7
	movvc	%xcc,	%g7,	%g5
	faligndata	%f10,	%f6,	%f8
	smul	%l4,	0x045B,	%i4
	movgu	%icc,	%o3,	%g2
	ld	[%l7 + 0x4C],	%f5
	movvc	%icc,	%l6,	%g3
	srax	%o2,	0x08,	%o6
	fmovdvs	%icc,	%f4,	%f15
	stw	%l1,	[%l7 + 0x68]
	alignaddr	%g6,	%i0,	%i2
	sdivx	%i1,	0x1682,	%l2
	fandnot2	%f10,	%f8,	%f14
	fmovrde	%i5,	%f6,	%f8
	edge16ln	%l0,	%i6,	%o1
	movgu	%xcc,	%i3,	%l3
	fmovsvc	%xcc,	%f12,	%f14
	orncc	%o0,	%l5,	%g4
	fornot1	%f14,	%f14,	%f2
	orcc	%g1,	0x1C8D,	%o5
	movrgz	%o7,	%i7,	%g7
	sdivcc	%g5,	0x0200,	%l4
	fmovrslez	%o4,	%f4,	%f10
	movn	%icc,	%i4,	%o3
	sdiv	%g2,	0x0E44,	%l6
	alignaddrl	%o2,	%o6,	%l1
	fmovrsgz	%g6,	%f11,	%f0
	orn	%i0,	%g3,	%i2
	movleu	%xcc,	%l2,	%i1
	move	%xcc,	%l0,	%i5
	fsrc2s	%f13,	%f2
	smul	%i6,	%o1,	%i3
	movrgez	%l3,	0x049,	%o0
	subc	%l5,	0x1086,	%g4
	sdivcc	%g1,	0x0751,	%o5
	st	%f3,	[%l7 + 0x08]
	movgu	%xcc,	%i7,	%g7
	subccc	%o7,	0x00FA,	%g5
	edge32	%l4,	%o4,	%o3
	save %i4, 0x059D, %g2
	stx	%o2,	[%l7 + 0x28]
	movre	%l6,	%l1,	%o6
	sub	%i0,	%g6,	%g3
	ld	[%l7 + 0x44],	%f12
	edge32ln	%l2,	%i1,	%i2
	subc	%l0,	%i5,	%i6
	edge8l	%o1,	%l3,	%o0
	addcc	%i3,	0x0288,	%l5
	movg	%xcc,	%g4,	%g1
	mulscc	%o5,	0x1B99,	%i7
	orn	%g7,	%g5,	%o7
	array8	%o4,	%o3,	%i4
	andcc	%g2,	%l4,	%o2
	edge32ln	%l1,	%o6,	%i0
	ldx	[%l7 + 0x18],	%g6
	sth	%l6,	[%l7 + 0x12]
	lduw	[%l7 + 0x14],	%g3
	movrlez	%i1,	%i2,	%l2
	ldx	[%l7 + 0x68],	%l0
	edge8l	%i6,	%i5,	%o1
	edge32ln	%o0,	%i3,	%l5
	add	%l3,	%g4,	%o5
	stb	%i7,	[%l7 + 0x10]
	udiv	%g7,	0x1E2D,	%g1
	srl	%o7,	%g5,	%o4
	sub	%i4,	%g2,	%o3
	fmul8x16au	%f14,	%f1,	%f8
	mulx	%o2,	%l1,	%o6
	subccc	%i0,	0x0574,	%l4
	stb	%g6,	[%l7 + 0x0C]
	udiv	%l6,	0x0ED1,	%i1
	subcc	%g3,	%i2,	%l2
	fornot1s	%f13,	%f8,	%f0
	subc	%i6,	0x1141,	%l0
	movpos	%icc,	%i5,	%o1
	ldd	[%l7 + 0x38],	%f6
	ldd	[%l7 + 0x20],	%i2
	fabss	%f7,	%f9
	stx	%l5,	[%l7 + 0x10]
	movleu	%icc,	%o0,	%l3
	srax	%o5,	%i7,	%g7
	subccc	%g4,	0x072C,	%g1
	add	%o7,	%g5,	%o4
	alignaddrl	%g2,	%i4,	%o3
	umulcc	%o2,	%l1,	%o6
	ldx	[%l7 + 0x68],	%l4
	movrgez	%i0,	%l6,	%i1
	addccc	%g3,	%g6,	%i2
	std	%f0,	[%l7 + 0x58]
	movre	%i6,	%l0,	%l2
	ldsw	[%l7 + 0x38],	%i5
	array8	%o1,	%i3,	%l5
	subc	%o0,	%l3,	%o5
	orn	%g7,	0x17D3,	%i7
	fmovrdgez	%g1,	%f2,	%f10
	edge8n	%g4,	%g5,	%o4
	fabsd	%f2,	%f0
	movrne	%g2,	%i4,	%o3
	fpsub16	%f2,	%f8,	%f0
	stw	%o2,	[%l7 + 0x78]
	movne	%xcc,	%l1,	%o6
	movg	%xcc,	%l4,	%i0
	movne	%xcc,	%l6,	%o7
	edge32l	%i1,	%g3,	%i2
	fmovsge	%icc,	%f5,	%f8
	edge8ln	%g6,	%i6,	%l0
	stb	%l2,	[%l7 + 0x37]
	popc	0x13EC,	%i5
	edge8l	%o1,	%l5,	%i3
	ldsh	[%l7 + 0x2A],	%o0
	movpos	%xcc,	%l3,	%o5
	alignaddrl	%i7,	%g7,	%g4
	fnot2s	%f4,	%f6
	stw	%g5,	[%l7 + 0x74]
	edge32	%o4,	%g1,	%g2
	sdivx	%i4,	0x1E7D,	%o2
	fmul8ulx16	%f8,	%f8,	%f6
	movn	%xcc,	%l1,	%o3
	srlx	%o6,	%i0,	%l6
	movvc	%icc,	%l4,	%o7
	edge8n	%g3,	%i2,	%g6
	smulcc	%i6,	%l0,	%i1
	srl	%i5,	%l2,	%o1
	orn	%i3,	0x06DE,	%l5
	edge16ln	%l3,	%o5,	%i7
	movl	%icc,	%g7,	%o0
	movn	%icc,	%g4,	%g5
	edge8ln	%g1,	%g2,	%i4
	movpos	%icc,	%o2,	%o4
	ldx	[%l7 + 0x68],	%l1
	save %o3, %o6, %i0
	fmovscc	%icc,	%f2,	%f0
	sth	%l4,	[%l7 + 0x4E]
	movcs	%xcc,	%o7,	%l6
	mulscc	%i2,	%g3,	%g6
	edge16n	%i6,	%i1,	%l0
	ld	[%l7 + 0x54],	%f14
	bshuffle	%f6,	%f6,	%f2
	sth	%i5,	[%l7 + 0x1E]
	and	%o1,	%l2,	%l5
	andncc	%i3,	%o5,	%i7
	edge16	%l3,	%o0,	%g7
	fmovdgu	%xcc,	%f4,	%f3
	popc	0x08F8,	%g4
	alignaddrl	%g5,	%g2,	%g1
	edge8ln	%o2,	%i4,	%l1
	edge16l	%o3,	%o4,	%i0
	ldub	[%l7 + 0x58],	%o6
	movrne	%o7,	%l4,	%i2
	udivcc	%g3,	0x0D1A,	%l6
	movle	%xcc,	%g6,	%i6
	movrgez	%i1,	0x024,	%l0
	sll	%o1,	%l2,	%i5
	srl	%i3,	0x02,	%o5
	orncc	%i7,	%l3,	%o0
	ld	[%l7 + 0x50],	%f2
	movgu	%icc,	%l5,	%g7
	edge8n	%g5,	%g4,	%g2
	srl	%o2,	%i4,	%l1
	sdivcc	%g1,	0x0DFE,	%o4
	fnegd	%f6,	%f14
	ld	[%l7 + 0x0C],	%f8
	edge32	%o3,	%o6,	%o7
	fmovs	%f0,	%f12
	st	%f10,	[%l7 + 0x60]
	mulscc	%l4,	%i2,	%g3
	mulscc	%i0,	%l6,	%i6
	stb	%g6,	[%l7 + 0x48]
	movrne	%l0,	%o1,	%l2
	fmovdne	%xcc,	%f13,	%f9
	fmovsvs	%icc,	%f3,	%f5
	edge32ln	%i5,	%i1,	%i3
	orncc	%o5,	%l3,	%i7
	sdivcc	%l5,	0x0975,	%o0
	edge32ln	%g7,	%g5,	%g4
	fpadd16s	%f11,	%f12,	%f14
	edge32ln	%g2,	%i4,	%l1
	array8	%g1,	%o2,	%o3
	andn	%o6,	%o4,	%o7
	mulscc	%i2,	%g3,	%i0
	sub	%l4,	0x01FA,	%i6
	movle	%xcc,	%l6,	%g6
	stx	%l0,	[%l7 + 0x28]
	sdivcc	%l2,	0x1263,	%o1
	ld	[%l7 + 0x68],	%f7
	andncc	%i5,	%i3,	%i1
	movrgez	%o5,	%i7,	%l3
	fmovd	%f14,	%f6
	edge16	%l5,	%g7,	%o0
	lduw	[%l7 + 0x50],	%g4
	sub	%g5,	0x1F7B,	%g2
	st	%f9,	[%l7 + 0x2C]
	addccc	%l1,	0x1413,	%g1
	alignaddrl	%o2,	%i4,	%o3
	save %o4, %o7, %o6
	and	%i2,	%g3,	%i0
	sll	%i6,	%l4,	%l6
	fmovdcc	%icc,	%f1,	%f13
	andcc	%l0,	%l2,	%g6
	sll	%i5,	%o1,	%i1
	mulx	%o5,	0x1490,	%i3
	fxnors	%f5,	%f10,	%f2
	umul	%l3,	0x194D,	%i7
	movleu	%xcc,	%l5,	%g7
	restore %o0, 0x0D9D, %g5
	stx	%g4,	[%l7 + 0x08]
	smulcc	%l1,	%g2,	%g1
	array32	%i4,	%o3,	%o4
	mulx	%o2,	0x15FB,	%o7
	lduh	[%l7 + 0x60],	%i2
	ldsh	[%l7 + 0x12],	%o6
	subc	%i0,	0x1B61,	%i6
	xorcc	%g3,	%l4,	%l6
	andncc	%l2,	%g6,	%i5
	mulx	%o1,	0x1D5C,	%l0
	stb	%o5,	[%l7 + 0x41]
	fpsub16s	%f8,	%f2,	%f5
	fnot1s	%f8,	%f2
	movrgz	%i3,	%i1,	%i7
	movcc	%icc,	%l3,	%g7
	edge8	%l5,	%g5,	%g4
	fpsub16	%f10,	%f8,	%f4
	stb	%o0,	[%l7 + 0x1E]
	xnor	%l1,	%g2,	%i4
	andncc	%g1,	%o3,	%o4
	alignaddrl	%o7,	%i2,	%o6
	stb	%i0,	[%l7 + 0x08]
	movg	%xcc,	%i6,	%g3
	movge	%icc,	%o2,	%l6
	edge16ln	%l4,	%l2,	%i5
	edge16n	%g6,	%o1,	%o5
	sll	%l0,	%i3,	%i1
	movneg	%xcc,	%l3,	%i7
	orcc	%l5,	%g7,	%g5
	array8	%g4,	%o0,	%l1
	fmul8x16au	%f15,	%f9,	%f14
	fpadd16s	%f12,	%f11,	%f9
	movgu	%icc,	%g2,	%i4
	xnor	%g1,	%o3,	%o4
	add	%i2,	%o6,	%o7
	and	%i0,	0x16FE,	%i6
	ldd	[%l7 + 0x40],	%g2
	movvs	%icc,	%o2,	%l4
	orncc	%l6,	%i5,	%g6
	fmovrsgz	%o1,	%f3,	%f10
	subc	%o5,	0x1E16,	%l0
	mulscc	%i3,	0x0E14,	%i1
	addc	%l3,	%i7,	%l5
	fmovdneg	%xcc,	%f2,	%f0
	st	%f6,	[%l7 + 0x3C]
	udiv	%l2,	0x0475,	%g7
	movle	%xcc,	%g4,	%g5
	movrgez	%l1,	0x00C,	%o0
	edge8	%i4,	%g2,	%o3
	fcmple32	%f4,	%f4,	%o4
	fmovrsgz	%i2,	%f1,	%f8
	movn	%icc,	%g1,	%o7
	umulcc	%o6,	0x1701,	%i0
	fand	%f14,	%f0,	%f12
	mulscc	%g3,	%i6,	%l4
	fmul8x16au	%f7,	%f8,	%f4
	srax	%o2,	0x17,	%l6
	subc	%g6,	0x1D9E,	%o1
	popc	%o5,	%l0
	st	%f15,	[%l7 + 0x28]
	sllx	%i3,	0x19,	%i5
	umul	%i1,	0x10B0,	%i7
	edge32l	%l3,	%l2,	%g7
	movneg	%icc,	%l5,	%g4
	stw	%l1,	[%l7 + 0x7C]
	fornot1s	%f3,	%f5,	%f8
	movvs	%xcc,	%g5,	%o0
	fmovrde	%i4,	%f12,	%f12
	fmovsge	%xcc,	%f3,	%f12
	edge16	%o3,	%o4,	%i2
	save %g1, %o7, %g2
	ldd	[%l7 + 0x48],	%f6
	movvs	%icc,	%o6,	%g3
	popc	0x0CC5,	%i0
	movle	%icc,	%i6,	%o2
	and	%l4,	0x0756,	%l6
	mulscc	%g6,	0x12C2,	%o1
	lduw	[%l7 + 0x6C],	%o5
	fcmped	%fcc0,	%f2,	%f14
	alignaddrl	%l0,	%i5,	%i3
	ldsh	[%l7 + 0x68],	%i1
	movleu	%xcc,	%l3,	%i7
	fmuld8sux16	%f2,	%f8,	%f2
	popc	0x0FE5,	%l2
	stx	%g7,	[%l7 + 0x58]
	andncc	%g4,	%l5,	%g5
	sth	%l1,	[%l7 + 0x50]
	array32	%i4,	%o3,	%o4
	movg	%icc,	%o0,	%i2
	xorcc	%g1,	%o7,	%o6
	fzeros	%f5
	fmovdcs	%xcc,	%f8,	%f13
	sdivx	%g2,	0x1083,	%i0
	edge16	%i6,	%o2,	%l4
	xnorcc	%g3,	0x119A,	%l6
	stw	%o1,	[%l7 + 0x64]
	xor	%g6,	%l0,	%o5
	ldsh	[%l7 + 0x44],	%i3
	smulcc	%i1,	%l3,	%i7
	fmovsne	%icc,	%f6,	%f4
	stb	%i5,	[%l7 + 0x26]
	alignaddrl	%g7,	%l2,	%g4
	movrlez	%g5,	%l1,	%i4
	array32	%o3,	%l5,	%o4
	movneg	%xcc,	%o0,	%i2
	movn	%xcc,	%g1,	%o7
	alignaddr	%o6,	%i0,	%i6
	alignaddrl	%g2,	%o2,	%l4
	fornot1	%f6,	%f4,	%f4
	fcmpeq16	%f6,	%f14,	%l6
	movl	%xcc,	%g3,	%g6
	sub	%l0,	0x003C,	%o1
	ldsw	[%l7 + 0x50],	%i3
	fpmerge	%f5,	%f5,	%f10
	fzero	%f0
	smulcc	%o5,	%l3,	%i1
	mulscc	%i7,	%i5,	%g7
	movpos	%xcc,	%l2,	%g4
	subcc	%l1,	%i4,	%g5
	array32	%l5,	%o3,	%o4
	movneg	%icc,	%i2,	%o0
	edge8l	%g1,	%o7,	%o6
	fcmped	%fcc0,	%f10,	%f4
	fmovrslez	%i6,	%f4,	%f1
	fsrc1	%f10,	%f6
	fands	%f11,	%f2,	%f13
	movrne	%g2,	%o2,	%l4
	andn	%l6,	%g3,	%g6
	udiv	%l0,	0x1760,	%i0
	fmovrslez	%o1,	%f14,	%f3
	srl	%o5,	0x19,	%i3
	movrne	%i1,	0x19B,	%i7
	udivcc	%i5,	0x0E2C,	%g7
	xorcc	%l2,	0x0F2B,	%g4
	andn	%l1,	%l3,	%i4
	movrlz	%l5,	0x150,	%o3
	fsrc1	%f10,	%f2
	sllx	%g5,	0x00,	%i2
	fmovrsgez	%o4,	%f9,	%f12
	sub	%g1,	0x0E67,	%o7
	srlx	%o0,	%o6,	%g2
	xorcc	%i6,	%l4,	%o2
	orcc	%l6,	%g6,	%g3
	umulcc	%i0,	0x015D,	%o1
	fpsub32	%f2,	%f2,	%f8
	array16	%l0,	%o5,	%i1
	movrlez	%i3,	%i7,	%i5
	lduh	[%l7 + 0x34],	%g7
	edge8ln	%l2,	%l1,	%l3
	movn	%icc,	%g4,	%l5
	sub	%o3,	0x1EF7,	%g5
	fnands	%f4,	%f5,	%f10
	movvs	%xcc,	%i4,	%i2
	edge16ln	%g1,	%o7,	%o0
	alignaddrl	%o4,	%g2,	%o6
	st	%f1,	[%l7 + 0x78]
	umul	%l4,	0x1F61,	%o2
	fmovrdgez	%l6,	%f14,	%f8
	mova	%icc,	%g6,	%i6
	sra	%i0,	%g3,	%l0
	sdiv	%o1,	0x0983,	%o5
	umul	%i3,	%i1,	%i7
	ldd	[%l7 + 0x08],	%f4
	sdiv	%g7,	0x0126,	%i5
	sth	%l2,	[%l7 + 0x5C]
	fmovsle	%icc,	%f9,	%f11
	movcc	%xcc,	%l3,	%g4
	ldsb	[%l7 + 0x33],	%l5
	orn	%o3,	0x1762,	%g5
	lduh	[%l7 + 0x1A],	%l1
	fmovsneg	%icc,	%f11,	%f2
	movrlz	%i4,	0x035,	%g1
	sll	%i2,	%o0,	%o7
	sethi	0x1C40,	%g2
	ldx	[%l7 + 0x50],	%o4
	srlx	%o6,	0x0D,	%l4
	udiv	%l6,	0x1FCA,	%o2
	xor	%g6,	0x0A5F,	%i0
	ldsw	[%l7 + 0x24],	%i6
	stb	%g3,	[%l7 + 0x60]
	movrlez	%l0,	%o1,	%o5
	movg	%xcc,	%i1,	%i3
	array8	%g7,	%i7,	%l2
	fmovsge	%icc,	%f8,	%f14
	srlx	%i5,	0x1C,	%l3
	udivx	%g4,	0x19C0,	%o3
	xnorcc	%g5,	0x032B,	%l5
	edge32	%i4,	%g1,	%l1
	add	%i2,	%o7,	%o0
	addcc	%o4,	0x1CB6,	%g2
	fpack16	%f6,	%f15
	ld	[%l7 + 0x5C],	%f7
	fmovrse	%l4,	%f8,	%f10
	ldsb	[%l7 + 0x2D],	%o6
	fcmpne16	%f10,	%f2,	%o2
	ldsb	[%l7 + 0x7B],	%g6
	fmovs	%f10,	%f1
	movl	%icc,	%i0,	%l6
	movrlz	%g3,	0x37B,	%i6
	edge32	%o1,	%l0,	%i1
	sdivcc	%o5,	0x00D6,	%g7
	movleu	%icc,	%i7,	%l2
	popc	%i5,	%l3
	bshuffle	%f4,	%f8,	%f0
	edge32	%i3,	%o3,	%g5
	orncc	%l5,	0x0178,	%g4
	fandnot1s	%f12,	%f11,	%f0
	ldd	[%l7 + 0x18],	%f12
	mulscc	%i4,	0x08EE,	%l1
	udivcc	%g1,	0x041B,	%i2
	addc	%o7,	%o0,	%g2
	movle	%xcc,	%o4,	%l4
	stx	%o6,	[%l7 + 0x30]
	array8	%o2,	%i0,	%g6
	fnegd	%f12,	%f8
	fnot2s	%f14,	%f3
	fzero	%f2
	movpos	%xcc,	%l6,	%i6
	movn	%icc,	%g3,	%o1
	srlx	%i1,	%o5,	%g7
	st	%f6,	[%l7 + 0x14]
	fmovdne	%icc,	%f1,	%f6
	add	%l0,	0x1DD2,	%l2
	edge32l	%i5,	%i7,	%i3
	movcc	%xcc,	%l3,	%o3
	fmul8x16	%f8,	%f14,	%f10
	sub	%l5,	0x1BDA,	%g5
	pdist	%f10,	%f8,	%f0
	fnand	%f12,	%f12,	%f10
	array32	%g4,	%l1,	%g1
	edge8n	%i2,	%i4,	%o0
	fcmpeq32	%f14,	%f2,	%o7
	edge8	%g2,	%l4,	%o6
	xor	%o2,	0x154A,	%i0
	mulx	%o4,	%g6,	%l6
	fmovrslz	%g3,	%f3,	%f3
	edge8ln	%i6,	%o1,	%o5
	stw	%g7,	[%l7 + 0x40]
	ldd	[%l7 + 0x58],	%l0
	movge	%icc,	%l2,	%i1
	orcc	%i5,	%i7,	%i3
	fmovrdne	%l3,	%f0,	%f0
	lduw	[%l7 + 0x74],	%o3
	xnorcc	%l5,	0x1F9A,	%g5
	edge32n	%g4,	%l1,	%g1
	edge8ln	%i4,	%i2,	%o7
	addc	%o0,	0x0467,	%g2
	movrlez	%o6,	%l4,	%o2
	fandnot2	%f10,	%f6,	%f10
	st	%f11,	[%l7 + 0x30]
	fnors	%f1,	%f3,	%f0
	st	%f11,	[%l7 + 0x70]
	xorcc	%i0,	%o4,	%l6
	fmovda	%xcc,	%f7,	%f1
	udiv	%g3,	0x13BB,	%g6
	edge32	%o1,	%i6,	%o5
	sllx	%g7,	%l2,	%l0
	andn	%i1,	0x0A35,	%i5
	movvs	%icc,	%i7,	%l3
	movle	%icc,	%o3,	%l5
	ld	[%l7 + 0x58],	%f7
	orncc	%i3,	0x1549,	%g4
	sll	%l1,	0x0F,	%g1
	andncc	%g5,	%i4,	%o7
	popc	0x1232,	%i2
	lduh	[%l7 + 0x56],	%o0
	fmovrdgz	%o6,	%f4,	%f6
	fmovdl	%icc,	%f13,	%f11
	orncc	%l4,	0x07F4,	%g2
	xnor	%i0,	%o2,	%o4
	fcmpne16	%f4,	%f6,	%g3
	sethi	0x1DD4,	%g6
	fnot1	%f2,	%f8
	movn	%xcc,	%l6,	%o1
	movre	%i6,	%o5,	%l2
	movcs	%icc,	%l0,	%g7
	movleu	%xcc,	%i5,	%i7
	sdiv	%i1,	0x18C0,	%l3
	movvc	%icc,	%l5,	%o3
	addccc	%i3,	%g4,	%l1
	stw	%g5,	[%l7 + 0x4C]
	ld	[%l7 + 0x74],	%f11
	addc	%i4,	%g1,	%i2
	alignaddr	%o7,	%o6,	%o0
	std	%f12,	[%l7 + 0x30]
	mova	%icc,	%g2,	%l4
	restore %o2, %i0, %g3
	fcmpne32	%f14,	%f12,	%g6
	movg	%xcc,	%l6,	%o1
	move	%xcc,	%o4,	%i6
	fpadd32	%f10,	%f10,	%f14
	orcc	%o5,	%l0,	%g7
	smulcc	%i5,	%l2,	%i7
	movpos	%icc,	%l3,	%i1
	ldsw	[%l7 + 0x0C],	%l5
	andn	%o3,	0x184D,	%i3
	edge8	%g4,	%g5,	%i4
	subc	%g1,	%i2,	%o7
	movg	%icc,	%l1,	%o6
	fandnot1s	%f7,	%f14,	%f5
	stx	%o0,	[%l7 + 0x38]
	addccc	%l4,	%g2,	%o2
	ldsw	[%l7 + 0x7C],	%i0
	ldsh	[%l7 + 0x54],	%g3
	fmovs	%f14,	%f1
	sll	%l6,	0x14,	%o1
	fmovsle	%xcc,	%f8,	%f3
	add	%o4,	0x1BA8,	%g6
	fmul8sux16	%f8,	%f14,	%f12
	mova	%icc,	%i6,	%l0
	popc	%g7,	%o5
	sdiv	%i5,	0x05C5,	%l2
	ldub	[%l7 + 0x52],	%l3
	movpos	%xcc,	%i1,	%l5
	sllx	%i7,	%o3,	%g4
	edge32ln	%i3,	%g5,	%i4
	movl	%xcc,	%g1,	%i2
	addcc	%l1,	0x1E8D,	%o6
	mova	%icc,	%o0,	%o7
	stb	%g2,	[%l7 + 0x5A]
	movge	%icc,	%l4,	%o2
	edge32	%i0,	%g3,	%l6
	fmovse	%icc,	%f2,	%f8
	fpsub32s	%f13,	%f12,	%f3
	fmovscs	%icc,	%f9,	%f0
	fmovdvc	%icc,	%f12,	%f1
	edge8l	%o4,	%g6,	%i6
	addcc	%l0,	0x08EF,	%o1
	stb	%o5,	[%l7 + 0x4A]
	stb	%g7,	[%l7 + 0x3D]
	udivx	%i5,	0x0597,	%l3
	fmovse	%icc,	%f1,	%f7
	xnor	%i1,	0x07FB,	%l5
	and	%i7,	0x0D04,	%l2
	movrne	%o3,	0x18D,	%i3
	stx	%g5,	[%l7 + 0x70]
	movgu	%icc,	%g4,	%g1
	movge	%icc,	%i2,	%i4
	ldsh	[%l7 + 0x20],	%l1
	edge32	%o6,	%o7,	%g2
	movvs	%icc,	%l4,	%o0
	sdivx	%i0,	0x1B70,	%g3
	ldsw	[%l7 + 0x3C],	%l6
	edge8n	%o4,	%o2,	%i6
	fmovsvs	%icc,	%f15,	%f8
	movgu	%xcc,	%l0,	%g6
	fcmpgt32	%f6,	%f2,	%o1
	ldx	[%l7 + 0x48],	%g7
	andncc	%i5,	%l3,	%o5
	udivcc	%i1,	0x1159,	%i7
	movrne	%l5,	0x37E,	%o3
	mulx	%i3,	0x0FF8,	%g5
	ldx	[%l7 + 0x68],	%g4
	fmovdge	%icc,	%f11,	%f5
	fcmple16	%f2,	%f14,	%g1
	fpack32	%f14,	%f10,	%f10
	lduw	[%l7 + 0x6C],	%i2
	move	%icc,	%i4,	%l2
	movrgz	%l1,	%o7,	%g2
	sdivcc	%l4,	0x0278,	%o0
	movcs	%xcc,	%o6,	%g3
	fmovrsgez	%i0,	%f7,	%f1
	srlx	%o4,	%l6,	%o2
	udiv	%i6,	0x0589,	%g6
	save %o1, %g7, %i5
	fmovrse	%l3,	%f7,	%f13
	movrlez	%o5,	%l0,	%i1
	mulx	%i7,	0x1BFD,	%l5
	array16	%i3,	%g5,	%o3
	ld	[%l7 + 0x74],	%f12
	fornot2s	%f6,	%f15,	%f8
	sdivx	%g4,	0x159A,	%i2
	ldx	[%l7 + 0x68],	%g1
	fcmped	%fcc0,	%f14,	%f6
	udivcc	%i4,	0x0F7B,	%l2
	ldsh	[%l7 + 0x5C],	%l1
	add	%g2,	0x1B16,	%l4
	stx	%o7,	[%l7 + 0x58]
	fpsub32	%f10,	%f14,	%f0
	fpsub32s	%f12,	%f4,	%f12
	smulcc	%o0,	%o6,	%i0
	stx	%g3,	[%l7 + 0x60]
	andcc	%o4,	0x17C4,	%o2
	fmovscs	%icc,	%f0,	%f10
	movg	%xcc,	%l6,	%i6
	movg	%icc,	%o1,	%g7
	movvc	%xcc,	%i5,	%g6
	sllx	%l3,	0x0B,	%l0
	std	%f14,	[%l7 + 0x10]
	fornot1	%f4,	%f0,	%f6
	fcmpgt16	%f2,	%f2,	%i1
	edge32	%o5,	%i7,	%l5
	restore %i3, %g5, %g4
	subccc	%i2,	0x059B,	%g1
	stw	%o3,	[%l7 + 0x6C]
	movleu	%xcc,	%i4,	%l1
	movrgez	%l2,	%g2,	%o7
	xnorcc	%o0,	%l4,	%i0
	movrgz	%g3,	%o6,	%o2
	fpsub32s	%f3,	%f2,	%f3
	sll	%o4,	%i6,	%o1
	fmovdne	%xcc,	%f0,	%f11
	fandnot2	%f12,	%f2,	%f4
	fandnot1	%f8,	%f4,	%f10
	edge32ln	%g7,	%i5,	%l6
	lduw	[%l7 + 0x14],	%g6
	ldsh	[%l7 + 0x08],	%l0
	fmovsle	%icc,	%f13,	%f10
	fmovs	%f1,	%f2
	subc	%l3,	0x1E2A,	%i1
	movcc	%icc,	%o5,	%i7
	edge32ln	%l5,	%i3,	%g5
	fmul8x16au	%f9,	%f6,	%f10
	edge16	%i2,	%g1,	%o3
	faligndata	%f8,	%f10,	%f8
	fmovrdgz	%g4,	%f12,	%f8
	fmovsvs	%icc,	%f7,	%f9
	array8	%i4,	%l2,	%l1
	std	%f10,	[%l7 + 0x58]
	edge32	%g2,	%o0,	%o7
	srax	%l4,	0x1F,	%g3
	addc	%o6,	0x1FCA,	%o2
	siam	0x1
	array16	%i0,	%i6,	%o4
	movneg	%icc,	%o1,	%i5
	movpos	%icc,	%g7,	%l6
	edge32n	%l0,	%l3,	%i1
	movl	%icc,	%g6,	%o5
	fmovrdgz	%l5,	%f2,	%f4
	movgu	%icc,	%i3,	%g5
	ldd	[%l7 + 0x08],	%f0
	andn	%i2,	0x1085,	%g1
	edge32ln	%o3,	%i7,	%i4
	ldsb	[%l7 + 0x32],	%l2
	save %l1, 0x0AC9, %g2
	edge8l	%o0,	%o7,	%g4
	movn	%icc,	%g3,	%l4
	lduh	[%l7 + 0x3C],	%o2
	edge32	%i0,	%o6,	%i6
	fexpand	%f7,	%f4
	ld	[%l7 + 0x50],	%f9
	ldsh	[%l7 + 0x60],	%o4
	edge8	%i5,	%o1,	%l6
	fzeros	%f3
	edge32l	%l0,	%g7,	%l3
	fands	%f6,	%f6,	%f9
	fpadd32s	%f10,	%f15,	%f12
	edge32	%i1,	%g6,	%l5
	srl	%i3,	%g5,	%i2
	edge32n	%g1,	%o3,	%i7
	fmovsvs	%xcc,	%f15,	%f2
	movn	%xcc,	%o5,	%l2
	mulscc	%i4,	%g2,	%o0
	sethi	0x0467,	%l1
	sllx	%o7,	%g4,	%l4
	andn	%g3,	%o2,	%i0
	edge8	%i6,	%o6,	%o4
	edge32	%o1,	%l6,	%l0
	sth	%i5,	[%l7 + 0x0E]
	add	%g7,	%i1,	%l3
	movrne	%g6,	0x2DD,	%l5
	array8	%i3,	%g5,	%g1
	and	%i2,	%o3,	%o5
	fmovdcc	%icc,	%f13,	%f9
	xnorcc	%i7,	0x09A1,	%l2
	edge8l	%i4,	%o0,	%g2
	fpmerge	%f10,	%f0,	%f4
	movre	%o7,	%g4,	%l1
	std	%f4,	[%l7 + 0x48]
	sdivcc	%l4,	0x02D9,	%o2
	edge8ln	%g3,	%i0,	%i6
	fmovdcs	%xcc,	%f9,	%f0
	array16	%o6,	%o4,	%o1
	movcc	%xcc,	%l6,	%i5
	fandnot2	%f14,	%f4,	%f8
	edge8ln	%g7,	%l0,	%i1
	fands	%f12,	%f2,	%f1
	alignaddr	%g6,	%l5,	%i3
	array16	%g5,	%g1,	%i2
	movcs	%icc,	%l3,	%o3
	ldub	[%l7 + 0x6C],	%i7
	alignaddrl	%o5,	%i4,	%o0
	srl	%g2,	%o7,	%g4
	fmovsne	%icc,	%f12,	%f5
	fmovrse	%l2,	%f3,	%f8
	fmovrdgz	%l4,	%f14,	%f6
	smulcc	%o2,	%g3,	%l1
	fxor	%f2,	%f8,	%f12
	movge	%xcc,	%i6,	%o6
	movleu	%xcc,	%i0,	%o1
	sub	%l6,	%i5,	%g7
	add	%l0,	0x124A,	%i1
	movrgez	%o4,	0x2E1,	%l5
	fandnot2	%f0,	%f6,	%f12
	edge8	%i3,	%g5,	%g1
	orn	%g6,	0x1E1B,	%i2
	fcmpne32	%f12,	%f2,	%o3
	movvc	%xcc,	%i7,	%l3
	udiv	%i4,	0x1110,	%o0
	xnor	%g2,	%o7,	%o5
	edge8ln	%g4,	%l2,	%l4
	smul	%g3,	0x042A,	%l1
	array32	%o2,	%o6,	%i0
	sllx	%i6,	%l6,	%o1
	movcc	%icc,	%i5,	%l0
	movg	%icc,	%g7,	%o4
	edge32ln	%i1,	%i3,	%l5
	movrgz	%g5,	%g6,	%i2
	edge16n	%g1,	%o3,	%l3
	edge8l	%i4,	%i7,	%o0
	ldsw	[%l7 + 0x20],	%o7
	orncc	%o5,	0x1C7E,	%g4
	std	%f4,	[%l7 + 0x68]
	fmovrdne	%l2,	%f14,	%f12
	xor	%g2,	%l4,	%l1
	movl	%icc,	%o2,	%g3
	addcc	%i0,	%o6,	%i6
	subc	%l6,	%i5,	%l0
	movg	%icc,	%g7,	%o1
	movrgz	%o4,	0x1C0,	%i1
	orncc	%i3,	0x15AE,	%g5
	sdiv	%g6,	0x0B44,	%i2
	fmuld8sux16	%f11,	%f13,	%f0
	ldub	[%l7 + 0x2B],	%g1
	edge32ln	%l5,	%l3,	%o3
	alignaddr	%i4,	%i7,	%o0
	edge8l	%o7,	%o5,	%g4
	st	%f3,	[%l7 + 0x70]
	movrgz	%g2,	0x2CF,	%l2
	movrgez	%l1,	0x0A6,	%l4
	sdivcc	%g3,	0x1511,	%o2
	edge32ln	%o6,	%i6,	%i0
	fmovd	%f8,	%f12
	restore %l6, %i5, %g7
	ldd	[%l7 + 0x20],	%f2
	srl	%l0,	0x0B,	%o4
	smulcc	%i1,	%o1,	%g5
	movne	%icc,	%g6,	%i2
	fxor	%f4,	%f6,	%f12
	movrlez	%i3,	0x065,	%g1
	fornot1s	%f4,	%f15,	%f9
	stx	%l5,	[%l7 + 0x78]
	ldsh	[%l7 + 0x5E],	%o3
	movrlz	%l3,	0x12B,	%i7
	movle	%icc,	%o0,	%o7
	fmovdg	%xcc,	%f14,	%f0
	umulcc	%i4,	0x0BB1,	%g4
	mova	%xcc,	%g2,	%o5
	fsrc1s	%f6,	%f2
	popc	0x1F1D,	%l2
	array32	%l4,	%l1,	%g3
	sdivcc	%o6,	0x1370,	%o2
	srax	%i0,	0x07,	%l6
	movgu	%xcc,	%i6,	%i5
	sll	%l0,	%g7,	%o4
	fmul8x16al	%f8,	%f4,	%f10
	edge32n	%i1,	%g5,	%o1
	udivx	%i2,	0x1E79,	%i3
	array8	%g6,	%g1,	%o3
	movrlez	%l3,	%i7,	%o0
	edge8ln	%o7,	%l5,	%i4
	edge8n	%g4,	%g2,	%l2
	movcc	%xcc,	%o5,	%l1
	movge	%xcc,	%l4,	%g3
	subc	%o6,	0x1781,	%i0
	save %l6, 0x1887, %o2
	edge32ln	%i6,	%l0,	%g7
	edge16l	%i5,	%i1,	%o4
	fnot1s	%f2,	%f13
	fand	%f4,	%f10,	%f2
	umul	%o1,	%i2,	%i3
	movvs	%icc,	%g6,	%g5
	subc	%o3,	0x06B6,	%l3
	sdivx	%g1,	0x00EB,	%i7
	edge8n	%o0,	%l5,	%i4
	addc	%o7,	0x0EE8,	%g2
	stw	%l2,	[%l7 + 0x58]
	orn	%o5,	0x1373,	%g4
	mulx	%l4,	%l1,	%o6
	array8	%i0,	%l6,	%o2
	fmovrdlz	%g3,	%f6,	%f0
	movl	%xcc,	%l0,	%i6
	array32	%i5,	%i1,	%g7
	lduh	[%l7 + 0x1C],	%o1
	sdiv	%o4,	0x0272,	%i3
	edge32	%i2,	%g6,	%g5
	edge8ln	%l3,	%o3,	%i7
	ldd	[%l7 + 0x18],	%f10
	sra	%g1,	0x1E,	%l5
	subcc	%i4,	0x1ECC,	%o0
	movpos	%icc,	%o7,	%g2
	xor	%o5,	0x1371,	%g4
	fmovsge	%xcc,	%f4,	%f7
	fmul8x16al	%f7,	%f5,	%f10
	srl	%l4,	0x07,	%l1
	ldsb	[%l7 + 0x24],	%o6
	sethi	0x1060,	%l2
	xnorcc	%l6,	%i0,	%o2
	fandnot2	%f2,	%f4,	%f8
	orncc	%l0,	0x145C,	%i6
	subc	%g3,	0x152E,	%i1
	lduw	[%l7 + 0x30],	%g7
	edge8n	%o1,	%i5,	%i3
	movcc	%xcc,	%i2,	%g6
	movpos	%xcc,	%g5,	%o4
	edge16n	%o3,	%l3,	%g1
	array16	%i7,	%l5,	%i4
	edge16n	%o0,	%g2,	%o7
	stw	%g4,	[%l7 + 0x68]
	ldd	[%l7 + 0x30],	%o4
	umulcc	%l1,	0x1FF3,	%l4
	subccc	%l2,	%o6,	%l6
	subc	%i0,	0x15D8,	%o2
	movne	%xcc,	%l0,	%i6
	movvs	%icc,	%i1,	%g7
	edge32ln	%g3,	%o1,	%i5
	ldx	[%l7 + 0x38],	%i3
	addcc	%i2,	0x1757,	%g5
	stb	%o4,	[%l7 + 0x10]
	smulcc	%g6,	%o3,	%g1
	fmovdgu	%xcc,	%f9,	%f4
	srl	%l3,	%i7,	%i4
	umul	%o0,	0x0021,	%g2
	movneg	%icc,	%o7,	%g4
	addc	%l5,	%l1,	%l4
	edge8ln	%l2,	%o5,	%l6
	popc	0x1615,	%i0
	stx	%o6,	[%l7 + 0x60]
	xor	%l0,	%i6,	%o2
	movvs	%xcc,	%i1,	%g7
	fnot1	%f4,	%f0
	fmovdneg	%icc,	%f5,	%f12
	sth	%o1,	[%l7 + 0x6C]
	srl	%g3,	0x01,	%i3
	edge16ln	%i2,	%i5,	%g5
	orncc	%g6,	0x0292,	%o3
	movrlez	%o4,	%g1,	%i7
	fmovscs	%xcc,	%f10,	%f3
	edge8n	%i4,	%o0,	%l3
	movg	%xcc,	%o7,	%g4
	sllx	%g2,	%l5,	%l4
	edge16ln	%l1,	%o5,	%l6
	fmovspos	%icc,	%f0,	%f7
	fmovrsgz	%l2,	%f12,	%f6
	orcc	%i0,	0x16EB,	%l0
	alignaddrl	%o6,	%o2,	%i6
	addcc	%i1,	%o1,	%g7
	edge16n	%g3,	%i2,	%i3
	srlx	%g5,	%g6,	%o3
	edge8n	%i5,	%o4,	%g1
	movvs	%xcc,	%i7,	%i4
	mulx	%l3,	%o7,	%o0
	sethi	0x0F07,	%g2
	edge16ln	%l5,	%g4,	%l4
	fmovrsgz	%l1,	%f5,	%f0
	fmovdpos	%xcc,	%f8,	%f8
	fandnot2	%f8,	%f14,	%f10
	movleu	%xcc,	%o5,	%l2
	movcs	%xcc,	%i0,	%l6
	sdivcc	%o6,	0x12FA,	%l0
	stb	%o2,	[%l7 + 0x6D]
	movcs	%icc,	%i1,	%o1
	srl	%g7,	0x1D,	%i6
	sdivx	%i2,	0x1159,	%i3
	addcc	%g3,	%g5,	%g6
	array16	%i5,	%o4,	%o3
	edge32	%g1,	%i7,	%i4
	fmovrsgez	%l3,	%f6,	%f2
	lduh	[%l7 + 0x42],	%o0
	lduw	[%l7 + 0x18],	%g2
	fmovsvs	%xcc,	%f3,	%f0
	edge32	%l5,	%o7,	%g4
	edge16ln	%l4,	%l1,	%l2
	ldsh	[%l7 + 0x54],	%o5
	umul	%i0,	0x0312,	%o6
	movcc	%xcc,	%l6,	%l0
	mulx	%o2,	0x0560,	%i1
	stx	%o1,	[%l7 + 0x10]
	subccc	%g7,	0x0495,	%i2
	movg	%xcc,	%i3,	%i6
	udivcc	%g3,	0x0A8F,	%g5
	andncc	%i5,	%g6,	%o3
	udivx	%g1,	0x1BB8,	%i7
	fands	%f5,	%f6,	%f11
	edge8ln	%i4,	%o4,	%l3
	ldsb	[%l7 + 0x73],	%g2
	fmovsgu	%icc,	%f14,	%f8
	movneg	%icc,	%l5,	%o0
	movl	%xcc,	%o7,	%g4
	popc	0x088C,	%l1
	sllx	%l2,	0x11,	%o5
	restore %l4, %i0, %o6
	alignaddrl	%l0,	%l6,	%o2
	edge16l	%o1,	%i1,	%g7
	std	%f14,	[%l7 + 0x38]
	subc	%i2,	0x199D,	%i3
	edge32l	%i6,	%g5,	%g3
	or	%g6,	%i5,	%o3
	sdivx	%g1,	0x072A,	%i7
	ldd	[%l7 + 0x10],	%f12
	add	%i4,	0x0C8B,	%o4
	fandnot2s	%f1,	%f8,	%f5
	edge16ln	%g2,	%l3,	%l5
	umulcc	%o0,	%g4,	%l1
	orncc	%l2,	%o7,	%l4
	fnor	%f10,	%f0,	%f10
	sllx	%i0,	%o6,	%o5
	faligndata	%f4,	%f6,	%f0
	edge16l	%l6,	%o2,	%o1
	xnor	%l0,	%g7,	%i1
	orcc	%i3,	0x0A1D,	%i2
	fpsub16	%f12,	%f12,	%f10
	fmovrslz	%g5,	%f4,	%f3
	movcs	%icc,	%i6,	%g3
	addc	%g6,	0x0083,	%o3
	movrlz	%g1,	%i7,	%i4
	movg	%icc,	%i5,	%o4
	fcmpgt16	%f12,	%f12,	%g2
	ld	[%l7 + 0x78],	%f11
	add	%l3,	%l5,	%o0
	addcc	%l1,	%g4,	%l2
	sth	%o7,	[%l7 + 0x12]
	lduh	[%l7 + 0x56],	%l4
	edge16ln	%o6,	%i0,	%o5
	movge	%xcc,	%o2,	%o1
	movvs	%xcc,	%l6,	%l0
	orncc	%i1,	0x1CDE,	%i3
	xorcc	%i2,	%g5,	%g7
	std	%f4,	[%l7 + 0x48]
	addcc	%i6,	0x031C,	%g3
	sra	%o3,	%g1,	%i7
	edge32l	%i4,	%i5,	%o4
	movrgz	%g2,	%g6,	%l5
	sra	%o0,	%l1,	%g4
	stw	%l3,	[%l7 + 0x78]
	udiv	%o7,	0x1C54,	%l4
	sra	%o6,	0x14,	%l2
	subccc	%o5,	%o2,	%i0
	xnor	%o1,	0x0FC6,	%l0
	mova	%xcc,	%l6,	%i1
	ldub	[%l7 + 0x14],	%i3
	fmovrdlz	%g5,	%f0,	%f2
	sdivx	%i2,	0x0FDF,	%i6
	sra	%g7,	%o3,	%g1
	smul	%g3,	0x15D1,	%i4
	stw	%i5,	[%l7 + 0x24]
	movrgez	%o4,	0x1FD,	%g2
	lduw	[%l7 + 0x1C],	%g6
	movneg	%xcc,	%l5,	%o0
	fmovs	%f14,	%f9
	edge16	%l1,	%g4,	%i7
	ldd	[%l7 + 0x20],	%f6
	movg	%icc,	%l3,	%l4
	movleu	%xcc,	%o7,	%l2
	addc	%o5,	0x05FD,	%o6
	ldsh	[%l7 + 0x58],	%i0
	ldx	[%l7 + 0x70],	%o1
	smulcc	%o2,	0x0EC0,	%l6
	xnor	%l0,	0x0A6D,	%i1
	sra	%i3,	%i2,	%g5
	subccc	%g7,	0x1AC6,	%o3
	sdivcc	%i6,	0x1793,	%g1
	fmovdg	%icc,	%f13,	%f14
	movn	%xcc,	%g3,	%i4
	movre	%o4,	%i5,	%g2
	umul	%g6,	0x1948,	%o0
	alignaddr	%l5,	%g4,	%i7
	ldsb	[%l7 + 0x4A],	%l1
	movgu	%icc,	%l3,	%o7
	mulx	%l4,	%l2,	%o6
	ldsh	[%l7 + 0x54],	%i0
	sllx	%o5,	0x04,	%o1
	orn	%l6,	0x1C79,	%l0
	andn	%i1,	%i3,	%i2
	orn	%g5,	%g7,	%o3
	movrgez	%o2,	0x1C0,	%i6
	sra	%g3,	0x19,	%i4
	xnor	%g1,	%i5,	%g2
	andncc	%o4,	%o0,	%g6
	popc	0x0866,	%g4
	fzero	%f6
	ldx	[%l7 + 0x50],	%l5
	move	%xcc,	%i7,	%l3
	movvs	%xcc,	%o7,	%l1
	fmul8x16al	%f0,	%f4,	%f14
	movneg	%icc,	%l4,	%o6
	fmovdn	%xcc,	%f9,	%f1
	movrgz	%i0,	%o5,	%l2
	fcmple16	%f2,	%f10,	%l6
	smulcc	%l0,	%i1,	%i3
	edge32ln	%o1,	%g5,	%g7
	ldd	[%l7 + 0x70],	%f6
	umul	%o3,	0x1D0B,	%i2
	movrgz	%i6,	%g3,	%i4
	ldsb	[%l7 + 0x11],	%o2
	lduw	[%l7 + 0x1C],	%g1
	orcc	%g2,	0x1E49,	%i5
	movcc	%xcc,	%o4,	%g6
	fnands	%f2,	%f11,	%f15
	fandnot2s	%f8,	%f0,	%f5
	movpos	%xcc,	%g4,	%o0
	srlx	%l5,	0x06,	%i7
	movpos	%icc,	%o7,	%l1
	array32	%l3,	%l4,	%o6
	ldub	[%l7 + 0x55],	%o5
	movvc	%xcc,	%l2,	%i0
	fcmpgt32	%f10,	%f8,	%l0
	movl	%icc,	%l6,	%i1
	movgu	%xcc,	%o1,	%i3
	fmovdne	%icc,	%f2,	%f1
	ldsw	[%l7 + 0x5C],	%g5
	srlx	%g7,	0x1E,	%i2
	ldx	[%l7 + 0x68],	%i6
	udivx	%g3,	0x0E83,	%i4
	restore %o3, 0x01F9, %g1
	edge8n	%g2,	%o2,	%o4
	fcmpeq32	%f12,	%f8,	%g6
	edge32	%i5,	%o0,	%l5
	array16	%g4,	%i7,	%l1
	orcc	%l3,	%l4,	%o6
	stx	%o7,	[%l7 + 0x38]
	edge32l	%o5,	%l2,	%l0
	fnor	%f0,	%f14,	%f4
	sub	%i0,	%l6,	%o1
	std	%f4,	[%l7 + 0x60]
	xor	%i1,	%i3,	%g5
	fmovsvs	%icc,	%f9,	%f8
	umul	%i2,	%g7,	%g3
	fcmpes	%fcc1,	%f8,	%f3
	fpsub32s	%f10,	%f4,	%f4
	movrlez	%i4,	%i6,	%o3
	edge32l	%g1,	%g2,	%o4
	umul	%g6,	0x16EA,	%o2
	fornot2s	%f5,	%f9,	%f3
	fmul8x16al	%f12,	%f8,	%f8
	srax	%o0,	%l5,	%i5
	xor	%g4,	%l1,	%l3
	sllx	%i7,	%l4,	%o6
	movle	%icc,	%o5,	%o7
	ldsh	[%l7 + 0x38],	%l2
	udivx	%i0,	0x115B,	%l0
	sll	%l6,	%i1,	%i3
	udivcc	%g5,	0x1ACB,	%o1
	ldub	[%l7 + 0x4E],	%g7
	sdivx	%g3,	0x0F5A,	%i4
	addcc	%i2,	0x1E32,	%o3
	fcmpeq32	%f8,	%f8,	%i6
	edge16l	%g2,	%g1,	%o4
	fmovrsgez	%o2,	%f14,	%f14
	ldd	[%l7 + 0x08],	%g6
	addccc	%l5,	%i5,	%o0
	umul	%g4,	%l3,	%i7
	fmovrdlez	%l4,	%f10,	%f2
	array8	%o6,	%l1,	%o5
	andn	%l2,	0x04A8,	%i0
	edge8	%l0,	%o7,	%l6
	edge32n	%i1,	%g5,	%i3
	fpsub32s	%f3,	%f9,	%f2
	movvc	%icc,	%g7,	%g3
	fcmps	%fcc0,	%f1,	%f3
	sdivcc	%i4,	0x0C9D,	%i2
	movg	%icc,	%o1,	%o3
	andncc	%i6,	%g1,	%g2
	fabss	%f2,	%f9
	fmovrdne	%o2,	%f2,	%f10
	andncc	%o4,	%l5,	%i5
	mulscc	%g6,	%g4,	%o0
	movrgz	%i7,	0x153,	%l3
	xor	%l4,	0x15D0,	%o6
	array8	%o5,	%l2,	%i0
	andcc	%l0,	0x0BA3,	%o7
	alignaddr	%l6,	%l1,	%g5
	xor	%i1,	0x156E,	%g7
	alignaddr	%g3,	%i3,	%i2
	sth	%i4,	[%l7 + 0x0C]
	fmovdg	%xcc,	%f8,	%f0
	mova	%xcc,	%o3,	%o1
	ld	[%l7 + 0x60],	%f0
	movn	%xcc,	%i6,	%g1
	xnorcc	%o2,	0x1EEE,	%g2
	ldsb	[%l7 + 0x10],	%l5
	ld	[%l7 + 0x18],	%f3
	sllx	%i5,	%o4,	%g6
	movle	%xcc,	%g4,	%o0
	popc	0x17F2,	%l3
	udivx	%i7,	0x13A3,	%l4
	movgu	%xcc,	%o5,	%l2
	edge8l	%o6,	%i0,	%l0
	stx	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x60],	%f5
	movvs	%icc,	%l1,	%o7
	movrgz	%g5,	%i1,	%g3
	orn	%i3,	%i2,	%i4
	fcmpes	%fcc3,	%f7,	%f1
	fmovsg	%icc,	%f11,	%f8
	edge8n	%g7,	%o3,	%i6
	edge32	%g1,	%o1,	%o2
	fabsd	%f8,	%f14
	umul	%g2,	0x01C3,	%l5
	movge	%xcc,	%i5,	%o4
	sethi	0x07A9,	%g6
	fmul8sux16	%f8,	%f2,	%f12
	addc	%g4,	%o0,	%i7
	fpadd32s	%f4,	%f15,	%f7
	fpack16	%f2,	%f6
	edge8l	%l3,	%o5,	%l2
	edge16ln	%l4,	%i0,	%l0
	movcs	%icc,	%o6,	%l6
	sllx	%l1,	0x02,	%o7
	andcc	%g5,	%i1,	%g3
	fxors	%f7,	%f2,	%f0
	fxnors	%f5,	%f1,	%f6
	srlx	%i2,	%i4,	%i3
	fpackfix	%f2,	%f14
	movvs	%icc,	%o3,	%g7
	movvs	%xcc,	%g1,	%o1
	edge32l	%i6,	%o2,	%g2
	save %l5, 0x0D13, %i5
	fmul8x16au	%f14,	%f6,	%f0
	fsrc2s	%f5,	%f13
	movre	%g6,	%o4,	%o0
	movgu	%xcc,	%i7,	%g4
	fmovrsne	%o5,	%f6,	%f4
	array16	%l3,	%l4,	%l2
	array16	%i0,	%o6,	%l0
	fmovdvc	%xcc,	%f1,	%f7
	fnegd	%f2,	%f14
	edge8ln	%l6,	%l1,	%g5
	ldx	[%l7 + 0x70],	%i1
	movrgez	%g3,	%o7,	%i2
	fmul8x16	%f9,	%f10,	%f8
	fmul8x16au	%f6,	%f1,	%f8
	udivcc	%i4,	0x167A,	%i3
	sdivcc	%g7,	0x02E7,	%o3
	xor	%o1,	0x0A17,	%i6
	fnegd	%f4,	%f2
	fmovda	%icc,	%f14,	%f2
	movl	%xcc,	%g1,	%g2
	smulcc	%l5,	0x18D5,	%i5
	udiv	%o2,	0x1D6C,	%o4
	for	%f6,	%f14,	%f8
	addccc	%g6,	%o0,	%g4
	umul	%i7,	0x17CB,	%o5
	mova	%icc,	%l4,	%l3
	st	%f8,	[%l7 + 0x70]
	fpackfix	%f14,	%f2
	xorcc	%i0,	%o6,	%l0
	ldsw	[%l7 + 0x54],	%l6
	andn	%l2,	%l1,	%g5
	movn	%icc,	%g3,	%o7
	edge16l	%i1,	%i2,	%i4
	fcmpgt16	%f12,	%f0,	%g7
	movleu	%icc,	%i3,	%o3
	xorcc	%o1,	%g1,	%g2
	fmovs	%f7,	%f13
	stx	%l5,	[%l7 + 0x08]
	mova	%xcc,	%i5,	%i6
	ld	[%l7 + 0x20],	%f7
	subcc	%o4,	%g6,	%o2
	udivx	%g4,	0x1380,	%o0
	ldsh	[%l7 + 0x7A],	%i7
	ldd	[%l7 + 0x78],	%f12
	fmovdl	%xcc,	%f9,	%f14
	movn	%icc,	%o5,	%l3
	fmovdg	%xcc,	%f3,	%f10
	fsrc1	%f6,	%f10
	fpsub16	%f14,	%f4,	%f8
	ldsh	[%l7 + 0x6C],	%l4
	edge32ln	%i0,	%l0,	%o6
	fpackfix	%f2,	%f0
	array16	%l2,	%l1,	%l6
	mulscc	%g5,	%o7,	%g3
	edge32l	%i1,	%i2,	%g7
	xor	%i4,	%o3,	%i3
	movre	%o1,	0x26D,	%g2
	edge16l	%l5,	%i5,	%i6
	andncc	%g1,	%g6,	%o2
	std	%f8,	[%l7 + 0x08]
	movrlez	%g4,	0x10B,	%o0
	umul	%i7,	%o4,	%o5
	fmovdl	%icc,	%f11,	%f5
	edge32ln	%l3,	%l4,	%l0
	edge16l	%i0,	%l2,	%o6
	movleu	%xcc,	%l6,	%l1
	fpack32	%f6,	%f12,	%f12
	movrgz	%o7,	%g3,	%i1
	std	%f10,	[%l7 + 0x58]
	fnegd	%f10,	%f12
	fmovsgu	%icc,	%f2,	%f1
	lduh	[%l7 + 0x1E],	%i2
	and	%g5,	0x035B,	%i4
	alignaddrl	%g7,	%o3,	%i3
	movvs	%xcc,	%g2,	%l5
	movrlez	%o1,	%i5,	%g1
	movgu	%xcc,	%g6,	%o2
	stx	%i6,	[%l7 + 0x38]
	ldx	[%l7 + 0x68],	%g4
	array16	%o0,	%o4,	%o5
	subccc	%l3,	0x1173,	%l4
	ldd	[%l7 + 0x10],	%l0
	fmovsa	%xcc,	%f7,	%f6
	movpos	%icc,	%i7,	%i0
	fcmpeq32	%f14,	%f4,	%o6
	fcmpne32	%f6,	%f10,	%l2
	edge8n	%l6,	%o7,	%l1
	fnor	%f14,	%f8,	%f4
	sth	%g3,	[%l7 + 0x6A]
	ldx	[%l7 + 0x28],	%i2
	subc	%g5,	%i1,	%i4
	sdivcc	%g7,	0x0750,	%i3
	stb	%g2,	[%l7 + 0x30]
	ldd	[%l7 + 0x20],	%f0
	alignaddrl	%o3,	%o1,	%i5
	ldub	[%l7 + 0x7A],	%l5
	fnot1	%f6,	%f8
	fmul8sux16	%f10,	%f14,	%f8
	stb	%g1,	[%l7 + 0x73]
	movleu	%xcc,	%g6,	%i6
	fmovrslz	%g4,	%f10,	%f9
	sdivcc	%o0,	0x0145,	%o4
	movcc	%xcc,	%o2,	%o5
	fcmpes	%fcc2,	%f14,	%f11
	edge16ln	%l4,	%l3,	%i7
	movvs	%xcc,	%i0,	%o6
	movcc	%xcc,	%l2,	%l0
	fsrc1s	%f12,	%f13
	mova	%icc,	%o7,	%l6
	sethi	0x065E,	%l1
	movle	%xcc,	%i2,	%g5
	srax	%g3,	%i4,	%g7
	sra	%i1,	%i3,	%g2
	popc	%o1,	%i5
	sth	%o3,	[%l7 + 0x44]
	subccc	%g1,	0x13DA,	%g6
	edge32	%i6,	%g4,	%l5
	umul	%o0,	0x18FC,	%o2
	fxnors	%f3,	%f5,	%f5
	fmovdvs	%icc,	%f13,	%f2
	smulcc	%o4,	%o5,	%l4
	andncc	%i7,	%l3,	%i0
	move	%icc,	%l2,	%l0
	for	%f8,	%f12,	%f10
	movvc	%xcc,	%o6,	%l6
	ldd	[%l7 + 0x20],	%l0
	fmul8x16	%f11,	%f12,	%f6
	subcc	%i2,	0x1321,	%g5
	fmovscs	%xcc,	%f5,	%f6
	fmovsge	%icc,	%f15,	%f0
	andncc	%g3,	%o7,	%i4
	addcc	%i1,	0x0D17,	%g7
	andn	%g2,	%i3,	%i5
	xnorcc	%o1,	%g1,	%g6
	fmovrslz	%i6,	%f11,	%f10
	lduh	[%l7 + 0x40],	%o3
	udivx	%l5,	0x0A45,	%o0
	lduh	[%l7 + 0x6E],	%g4
	srlx	%o4,	%o5,	%l4
	udivcc	%o2,	0x1AB0,	%l3
	array8	%i7,	%l2,	%l0
	edge16	%i0,	%o6,	%l1
	andncc	%i2,	%l6,	%g5
	subcc	%g3,	%o7,	%i1
	edge32	%g7,	%g2,	%i3
	sth	%i5,	[%l7 + 0x2C]
	fmovdpos	%xcc,	%f9,	%f3
	fcmped	%fcc1,	%f0,	%f12
	movgu	%xcc,	%i4,	%o1
	srax	%g6,	%i6,	%o3
	subc	%l5,	%g1,	%o0
	xorcc	%o4,	0x087B,	%o5
	movgu	%icc,	%l4,	%o2
	edge16ln	%l3,	%g4,	%l2
	fmovdne	%xcc,	%f14,	%f11
	fcmpes	%fcc3,	%f15,	%f2
	xnor	%l0,	0x1718,	%i7
	sra	%i0,	0x0D,	%l1
	fmuld8sux16	%f13,	%f10,	%f14
	movcc	%icc,	%o6,	%l6
	fpsub16	%f6,	%f12,	%f4
	movrlz	%i2,	%g3,	%o7
	fexpand	%f0,	%f6
	ldd	[%l7 + 0x50],	%i0
	st	%f7,	[%l7 + 0x3C]
	movrlz	%g5,	%g2,	%i3
	edge16l	%i5,	%i4,	%g7
	ldsh	[%l7 + 0x0E],	%g6
	mulscc	%o1,	%i6,	%l5
	ld	[%l7 + 0x0C],	%f7
	sethi	0x17AA,	%o3
	movgu	%icc,	%g1,	%o0
	fmovdl	%xcc,	%f8,	%f2
	array16	%o5,	%o4,	%l4
	xorcc	%o2,	%l3,	%l2
	movrlz	%g4,	%i7,	%l0
	fcmple16	%f8,	%f14,	%i0
	orncc	%o6,	%l1,	%i2
	sllx	%g3,	%o7,	%i1
	ldsb	[%l7 + 0x08],	%g5
	udivx	%l6,	0x0B5C,	%g2
	xnorcc	%i3,	%i5,	%g7
	edge16n	%g6,	%i4,	%i6
	stw	%o1,	[%l7 + 0x38]
	fcmpd	%fcc0,	%f6,	%f0
	movge	%icc,	%o3,	%l5
	ldd	[%l7 + 0x58],	%g0
	movgu	%xcc,	%o0,	%o5
	orn	%l4,	%o4,	%o2
	movrlez	%l2,	0x1F0,	%g4
	sub	%l3,	0x1B6B,	%l0
	st	%f3,	[%l7 + 0x24]
	xorcc	%i7,	0x026D,	%o6
	udiv	%i0,	0x1F30,	%i2
	movrlez	%g3,	%l1,	%i1
	sethi	0x1ADB,	%o7
	fandnot1s	%f9,	%f10,	%f4
	movcc	%xcc,	%g5,	%l6
	fmovsl	%icc,	%f0,	%f15
	movrne	%i3,	%i5,	%g7
	bshuffle	%f8,	%f12,	%f4
	and	%g6,	0x079A,	%g2
	alignaddrl	%i4,	%o1,	%o3
	ldx	[%l7 + 0x50],	%l5
	ldsw	[%l7 + 0x50],	%i6
	mulx	%g1,	%o5,	%l4
	fmuld8ulx16	%f13,	%f13,	%f10
	std	%f12,	[%l7 + 0x48]
	movrgz	%o4,	%o0,	%l2
	array8	%g4,	%o2,	%l0
	edge8	%l3,	%o6,	%i0
	edge8ln	%i7,	%i2,	%g3
	movrne	%i1,	%o7,	%g5
	movrne	%l6,	0x03D,	%i3
	edge8	%l1,	%i5,	%g6
	sra	%g7,	%g2,	%i4
	movg	%icc,	%o3,	%l5
	ldsb	[%l7 + 0x15],	%i6
	edge8l	%g1,	%o5,	%o1
	udivx	%l4,	0x0AC4,	%o4
	sllx	%o0,	%l2,	%g4
	mulx	%o2,	%l3,	%l0
	sethi	0x1367,	%o6
	smulcc	%i7,	%i0,	%g3
	movleu	%icc,	%i1,	%i2
	fxor	%f0,	%f4,	%f4
	edge32ln	%g5,	%l6,	%o7
	and	%i3,	0x1504,	%i5
	srl	%g6,	0x14,	%l1
	array8	%g2,	%i4,	%o3
	fornot1s	%f8,	%f7,	%f12
	subccc	%l5,	%i6,	%g7
	mulscc	%g1,	0x1871,	%o1
	udiv	%l4,	0x1516,	%o5
	movge	%xcc,	%o4,	%l2
	mulx	%g4,	0x0131,	%o0
	movle	%xcc,	%o2,	%l0
	xorcc	%l3,	%o6,	%i0
	movcc	%xcc,	%g3,	%i1
	fmovrdne	%i2,	%f0,	%f4
	addc	%i7,	%g5,	%l6
	fnor	%f8,	%f6,	%f12
	movn	%xcc,	%o7,	%i3
	std	%f4,	[%l7 + 0x68]
	ldub	[%l7 + 0x44],	%g6
	sdivcc	%l1,	0x010A,	%i5
	smul	%i4,	%o3,	%g2
	mulx	%l5,	%g7,	%g1
	sdivx	%i6,	0x0DE6,	%l4
	fmovrdne	%o1,	%f12,	%f8
	ldd	[%l7 + 0x08],	%f4
	orn	%o4,	0x1F2D,	%l2
	stx	%g4,	[%l7 + 0x28]
	save %o5, %o0, %l0
	movgu	%xcc,	%l3,	%o2
	sethi	0x1536,	%o6
	movvs	%icc,	%g3,	%i1
	mulscc	%i0,	0x1947,	%i7
	fxnors	%f5,	%f11,	%f10
	fmovrdne	%i2,	%f0,	%f4
	movn	%icc,	%l6,	%o7
	subcc	%g5,	0x04D1,	%i3
	popc	0x0FCD,	%l1
	restore %g6, %i4, %i5
	edge8n	%g2,	%l5,	%g7
	movcc	%icc,	%o3,	%i6
	edge8	%l4,	%g1,	%o1
	fmovdneg	%icc,	%f14,	%f6
	xor	%o4,	0x02EE,	%g4
	sdivcc	%o5,	0x1622,	%o0
	sth	%l0,	[%l7 + 0x60]
	fcmpgt32	%f14,	%f12,	%l3
	sll	%l2,	%o6,	%o2
	fpsub32	%f0,	%f2,	%f2
	fpmerge	%f12,	%f13,	%f4
	fnegd	%f0,	%f8
	movrlez	%g3,	0x356,	%i0
	andn	%i7,	%i2,	%l6
	fcmple32	%f4,	%f4,	%o7
	mova	%xcc,	%i1,	%i3
	mulscc	%g5,	0x1CD6,	%g6
	movneg	%xcc,	%l1,	%i4
	fmovdn	%xcc,	%f14,	%f8
	fmovrslez	%i5,	%f9,	%f2
	sethi	0x1FA4,	%l5
	fmul8x16	%f0,	%f12,	%f12
	movrgz	%g7,	0x15B,	%g2
	sll	%i6,	%l4,	%o3
	andncc	%g1,	%o1,	%g4
	edge32	%o4,	%o5,	%l0
	ld	[%l7 + 0x4C],	%f7
	fcmpne32	%f2,	%f8,	%o0
	movne	%icc,	%l3,	%l2
	lduw	[%l7 + 0x28],	%o6
	move	%icc,	%o2,	%g3
	popc	%i7,	%i2
	array8	%i0,	%o7,	%l6
	edge16ln	%i1,	%g5,	%i3
	xorcc	%l1,	0x04E8,	%i4
	fmovsa	%xcc,	%f11,	%f6
	fcmpeq32	%f14,	%f14,	%g6
	array16	%i5,	%g7,	%l5
	movrlz	%i6,	0x218,	%g2
	fcmpeq16	%f0,	%f10,	%l4
	and	%g1,	%o3,	%g4
	fsrc1s	%f7,	%f0
	fmovrsne	%o1,	%f9,	%f0
	movrlz	%o4,	0x1E5,	%o5
	edge16n	%l0,	%l3,	%l2
	udiv	%o6,	0x0CC7,	%o2
	sethi	0x1B75,	%o0
	movleu	%xcc,	%i7,	%g3
	edge32n	%i2,	%o7,	%i0
	movpos	%xcc,	%i1,	%g5
	movrlz	%i3,	0x30B,	%l1
	fpack16	%f2,	%f12
	subccc	%i4,	%g6,	%i5
	fcmpeq16	%f8,	%f12,	%l6
	alignaddr	%l5,	%g7,	%g2
	fpadd32	%f8,	%f14,	%f2
	orcc	%i6,	0x1914,	%l4
	move	%xcc,	%o3,	%g4
	movne	%icc,	%g1,	%o1
	fmovsvs	%icc,	%f2,	%f13
	fpack16	%f10,	%f9
	udivcc	%o5,	0x04FD,	%l0
	and	%l3,	%o4,	%l2
	movrlz	%o2,	%o6,	%o0
	edge16	%g3,	%i7,	%o7
	popc	%i0,	%i2
	sll	%i1,	0x0A,	%i3
	orcc	%l1,	0x1A9D,	%i4
	movrlez	%g6,	%i5,	%l6
	restore %g5, 0x00FE, %l5
	alignaddr	%g2,	%i6,	%l4
	movne	%icc,	%o3,	%g4
	ldsh	[%l7 + 0x38],	%g7
	addccc	%o1,	%g1,	%o5
	andcc	%l0,	0x05E5,	%l3
	movn	%icc,	%l2,	%o4
	fmovsle	%xcc,	%f15,	%f4
	movrne	%o2,	0x14B,	%o6
	edge32ln	%o0,	%g3,	%i7
	edge16l	%i0,	%i2,	%i1
	sub	%o7,	%i3,	%i4
	fmovsn	%xcc,	%f3,	%f14
	fsrc1s	%f9,	%f15
	udivx	%g6,	0x11EE,	%l1
	sllx	%l6,	%g5,	%i5
	movl	%icc,	%g2,	%l5
	umul	%l4,	%i6,	%o3
	xnor	%g7,	0x1480,	%g4
	fmovsl	%icc,	%f6,	%f6
	fors	%f15,	%f2,	%f13
	udivcc	%g1,	0x02E2,	%o5
	sll	%o1,	%l3,	%l2
	sdivcc	%o4,	0x06A9,	%l0
	movrlz	%o6,	0x2ED,	%o0
	fpadd32	%f14,	%f4,	%f8
	and	%o2,	0x1331,	%i7
	andn	%i0,	0x0B7D,	%i2
	edge8l	%g3,	%i1,	%o7
	sth	%i4,	[%l7 + 0x7C]
	fmul8x16au	%f10,	%f11,	%f8
	sth	%i3,	[%l7 + 0x6A]
	sdiv	%l1,	0x1EB6,	%g6
	movg	%xcc,	%g5,	%i5
	pdist	%f12,	%f10,	%f4
	movne	%icc,	%g2,	%l5
	stw	%l6,	[%l7 + 0x20]
	movpos	%xcc,	%l4,	%o3
	addccc	%i6,	%g4,	%g1
	mova	%icc,	%g7,	%o5
	edge32ln	%o1,	%l2,	%o4
	movrgez	%l3,	%l0,	%o0
	movle	%icc,	%o6,	%i7
	fornot1s	%f15,	%f4,	%f8
	andncc	%o2,	%i2,	%i0
	fnot1	%f6,	%f12
	edge16	%i1,	%g3,	%i4
	ldsb	[%l7 + 0x1D],	%i3
	srlx	%o7,	%g6,	%g5
	ldx	[%l7 + 0x28],	%i5
	save %g2, %l1, %l5
	srlx	%l6,	%o3,	%l4
	orcc	%i6,	%g4,	%g1
	udiv	%g7,	0x0C1F,	%o5
	edge16n	%l2,	%o1,	%o4
	srlx	%l0,	%o0,	%o6
	movvc	%icc,	%i7,	%o2
	andcc	%l3,	%i2,	%i1
	movrlz	%i0,	%g3,	%i4
	movl	%xcc,	%i3,	%g6
	ld	[%l7 + 0x30],	%f4
	movvc	%icc,	%g5,	%i5
	movcs	%xcc,	%o7,	%g2
	movrne	%l1,	0x03F,	%l6
	fsrc1	%f2,	%f4
	fabsd	%f6,	%f14
	ldd	[%l7 + 0x08],	%o2
	addc	%l4,	0x057C,	%l5
	sllx	%i6,	0x10,	%g4
	srax	%g7,	%o5,	%g1
	sllx	%l2,	0x09,	%o4
	sdiv	%l0,	0x103B,	%o0
	xorcc	%o1,	0x020B,	%i7
	udivcc	%o6,	0x1C89,	%o2
	stw	%i2,	[%l7 + 0x24]
	sra	%l3,	%i1,	%g3
	movge	%icc,	%i4,	%i3
	umul	%i0,	%g6,	%g5
	sdivx	%o7,	0x1D84,	%i5
	srl	%g2,	0x15,	%l1
	movgu	%icc,	%l6,	%l4
	sllx	%l5,	%i6,	%o3
	movrlz	%g4,	0x04C,	%o5
	movl	%xcc,	%g1,	%g7
	fcmpgt16	%f6,	%f10,	%o4
	fcmple16	%f12,	%f6,	%l0
	subccc	%o0,	0x07C7,	%l2
	fpack16	%f8,	%f9
	fzeros	%f13
	sdiv	%o1,	0x19D0,	%i7
	edge8ln	%o6,	%i2,	%l3
	mulx	%o2,	0x0038,	%g3
	fornot1s	%f2,	%f10,	%f4
	sethi	0x16D9,	%i1
	fmovsl	%xcc,	%f0,	%f11
	array16	%i4,	%i0,	%i3
	srax	%g6,	0x01,	%o7
	sllx	%i5,	0x06,	%g2
	orn	%g5,	%l6,	%l4
	fmovrde	%l1,	%f14,	%f14
	udivcc	%l5,	0x158E,	%i6
	edge32n	%g4,	%o5,	%g1
	movle	%xcc,	%g7,	%o3
	movcc	%xcc,	%l0,	%o0
	fpack32	%f0,	%f10,	%f12
	srax	%l2,	0x0E,	%o1
	edge8ln	%o4,	%i7,	%o6
	fmovrdlz	%l3,	%f6,	%f0
	addccc	%o2,	%i2,	%i1
	sll	%i4,	%i0,	%g3
	ldsb	[%l7 + 0x4F],	%i3
	edge16	%g6,	%o7,	%g2
	movle	%xcc,	%i5,	%g5
	edge16	%l4,	%l6,	%l5
	umulcc	%i6,	0x1BB2,	%l1
	subccc	%g4,	0x142C,	%g1
	ldub	[%l7 + 0x20],	%g7
	ldub	[%l7 + 0x37],	%o5
	ldsb	[%l7 + 0x65],	%o3
	fnegd	%f12,	%f6
	lduh	[%l7 + 0x52],	%l0
	movle	%xcc,	%o0,	%o1
	ldd	[%l7 + 0x50],	%o4
	srax	%l2,	%i7,	%l3
	restore %o6, %i2, %o2
	movvc	%xcc,	%i1,	%i4
	fmuld8ulx16	%f13,	%f6,	%f12
	srl	%i0,	0x0C,	%i3
	subc	%g3,	0x0398,	%g6
	sdiv	%g2,	0x033B,	%o7
	fand	%f14,	%f6,	%f2
	fnegd	%f0,	%f0
	edge16n	%g5,	%l4,	%l6
	fmovsge	%icc,	%f4,	%f13
	movpos	%icc,	%l5,	%i5
	subcc	%l1,	0x1BD7,	%i6
	fcmple32	%f10,	%f2,	%g1
	edge32l	%g7,	%o5,	%g4
	edge8	%o3,	%o0,	%l0
	lduw	[%l7 + 0x28],	%o4
	umul	%o1,	0x15D9,	%l2
	orncc	%l3,	0x1B32,	%i7
	movrlz	%i2,	0x1F5,	%o2
	smulcc	%i1,	0x02FD,	%i4
	fandnot1s	%f12,	%f8,	%f2
	save %i0, 0x11F9, %o6
	edge16l	%i3,	%g3,	%g2
	fmovdcs	%xcc,	%f5,	%f10
	stx	%g6,	[%l7 + 0x58]
	movrlz	%o7,	%g5,	%l4
	udivcc	%l6,	0x14A4,	%l5
	addcc	%l1,	%i5,	%g1
	andn	%g7,	%i6,	%g4
	ldsh	[%l7 + 0x32],	%o5
	ld	[%l7 + 0x7C],	%f10
	orcc	%o0,	%o3,	%o4
	fmovdvs	%icc,	%f7,	%f9
	movgu	%xcc,	%o1,	%l2
	move	%xcc,	%l3,	%l0
	movvc	%xcc,	%i2,	%o2
	edge32ln	%i7,	%i1,	%i4
	umul	%i0,	0x0AFA,	%o6
	edge32	%g3,	%i3,	%g2
	mulx	%g6,	%o7,	%l4
	fabss	%f9,	%f1
	fmovdn	%xcc,	%f6,	%f4
	fmovsgu	%xcc,	%f1,	%f13
	movvc	%xcc,	%g5,	%l6
	ldd	[%l7 + 0x10],	%f4
	sub	%l5,	0x1D55,	%i5
	edge16	%g1,	%g7,	%l1
	fmovrslz	%g4,	%f4,	%f7
	mova	%icc,	%i6,	%o0
	fpsub16s	%f6,	%f2,	%f14
	and	%o3,	0x1DFC,	%o5
	lduw	[%l7 + 0x40],	%o4
	fcmps	%fcc0,	%f12,	%f14
	movvs	%xcc,	%o1,	%l2
	smul	%l0,	0x11E8,	%l3
	orcc	%o2,	%i7,	%i2
	sdivcc	%i1,	0x0FA5,	%i0
	restore %i4, 0x1F26, %o6
	movrlez	%i3,	0x13B,	%g2
	fmovde	%xcc,	%f12,	%f1
	orn	%g3,	%o7,	%g6
	subc	%g5,	0x1F36,	%l6
	movre	%l4,	0x2BB,	%i5
	mova	%xcc,	%g1,	%g7
	smulcc	%l1,	0x15E4,	%g4
	movne	%icc,	%i6,	%o0
	movge	%xcc,	%l5,	%o3
	fandnot2	%f12,	%f10,	%f4
	fpadd32s	%f9,	%f14,	%f9
	xnor	%o4,	%o5,	%l2
	smulcc	%l0,	%o1,	%l3
	orncc	%o2,	%i2,	%i1
	fpack16	%f14,	%f12
	alignaddr	%i0,	%i7,	%o6
	or	%i3,	0x1C42,	%i4
	sllx	%g3,	0x0E,	%o7
	ldsw	[%l7 + 0x0C],	%g6
	ldx	[%l7 + 0x08],	%g2
	movle	%xcc,	%l6,	%l4
	and	%g5,	%i5,	%g7
	edge32n	%l1,	%g4,	%g1
	ldub	[%l7 + 0x59],	%o0
	addc	%l5,	%o3,	%o4
	edge32ln	%o5,	%l2,	%l0
	ldsh	[%l7 + 0x5A],	%i6
	fzero	%f4
	movge	%icc,	%l3,	%o1
	fmovrdne	%o2,	%f12,	%f0
	movle	%icc,	%i2,	%i1
	fmovsleu	%icc,	%f11,	%f11
	movle	%xcc,	%i0,	%i7
	mulscc	%i3,	%o6,	%i4
	addccc	%g3,	0x18EA,	%g6
	umulcc	%g2,	0x137C,	%l6
	fcmpes	%fcc0,	%f8,	%f8
	umul	%l4,	0x1BFE,	%g5
	bshuffle	%f2,	%f2,	%f2
	fpmerge	%f7,	%f0,	%f12
	fornot1s	%f9,	%f3,	%f1
	stb	%o7,	[%l7 + 0x6A]
	sdiv	%g7,	0x1BA8,	%i5
	ldub	[%l7 + 0x23],	%g4
	subcc	%l1,	0x0C90,	%g1
	movrne	%o0,	0x032,	%l5
	umulcc	%o4,	0x01ED,	%o5
	edge16n	%l2,	%o3,	%l0
	restore %l3, 0x0110, %o1
	array16	%i6,	%o2,	%i2
	movvs	%icc,	%i0,	%i1
	fornot1s	%f9,	%f13,	%f12
	movle	%xcc,	%i7,	%o6
	smulcc	%i3,	0x0AA2,	%i4
	fmovdgu	%icc,	%f8,	%f11
	edge16	%g6,	%g2,	%g3
	fmovsle	%xcc,	%f14,	%f10
	ldd	[%l7 + 0x58],	%i6
	mulx	%g5,	%l4,	%g7
	stx	%i5,	[%l7 + 0x08]
	movgu	%icc,	%g4,	%l1
	fmovsl	%icc,	%f9,	%f12
	fcmpeq16	%f4,	%f6,	%o7
	srlx	%g1,	%l5,	%o4
	movle	%icc,	%o0,	%o5
	movcs	%xcc,	%o3,	%l2
	mova	%xcc,	%l0,	%l3
	edge8ln	%i6,	%o2,	%o1
	subcc	%i2,	0x1BCA,	%i1
	fxor	%f10,	%f6,	%f12
	smulcc	%i7,	%i0,	%i3
	movpos	%icc,	%i4,	%g6
	fcmpne16	%f10,	%f4,	%g2
	sth	%o6,	[%l7 + 0x5C]
	stw	%l6,	[%l7 + 0x30]
	array8	%g5,	%g3,	%g7
	movne	%xcc,	%i5,	%g4
	movne	%icc,	%l1,	%o7
	ldsb	[%l7 + 0x41],	%l4
	xorcc	%l5,	%g1,	%o4
	edge8ln	%o5,	%o0,	%l2
	sethi	0x0393,	%o3
	fsrc1	%f8,	%f2
	faligndata	%f2,	%f6,	%f2
	movvc	%icc,	%l0,	%l3
	alignaddr	%o2,	%i6,	%o1
	sdiv	%i2,	0x1472,	%i7
	std	%f6,	[%l7 + 0x20]
	ldsh	[%l7 + 0x6E],	%i0
	fmovrse	%i3,	%f11,	%f5
	fmovrsgz	%i4,	%f4,	%f13
	sdivcc	%g6,	0x111F,	%i1
	orncc	%o6,	%g2,	%l6
	and	%g5,	%g3,	%g7
	andn	%g4,	%l1,	%i5
	movcc	%icc,	%l4,	%o7
	lduh	[%l7 + 0x74],	%l5
	fandnot1	%f6,	%f10,	%f8
	xorcc	%g1,	0x18E8,	%o5
	addcc	%o4,	%o0,	%l2
	movle	%xcc,	%o3,	%l3
	edge8	%o2,	%i6,	%l0
	fand	%f0,	%f8,	%f4
	fpadd32	%f10,	%f2,	%f6
	array32	%o1,	%i7,	%i0
	subcc	%i2,	0x1F44,	%i3
	orcc	%g6,	%i4,	%o6
	fmovrdne	%g2,	%f14,	%f10
	move	%xcc,	%l6,	%g5
	fzero	%f10
	srl	%i1,	0x06,	%g3
	fandnot2	%f2,	%f12,	%f2
	mulx	%g7,	0x1185,	%g4
	fmovrde	%i5,	%f2,	%f10
	edge32	%l1,	%o7,	%l5
	subcc	%g1,	%o5,	%l4
	xnor	%o4,	0x0A3E,	%l2
	movrlez	%o0,	%l3,	%o3
	fnegd	%f8,	%f10
	edge16n	%o2,	%l0,	%o1
	movrgz	%i6,	%i0,	%i2
	subc	%i7,	%g6,	%i4
	lduh	[%l7 + 0x14],	%o6
	array8	%g2,	%i3,	%g5
	fnors	%f11,	%f10,	%f4
	edge8n	%l6,	%g3,	%g7
	save %i1, 0x1C61, %g4
	lduh	[%l7 + 0x4E],	%i5
	movge	%icc,	%o7,	%l5
	movn	%xcc,	%l1,	%g1
	orncc	%l4,	%o4,	%l2
	sub	%o0,	0x0478,	%o5
	std	%f0,	[%l7 + 0x10]
	ldx	[%l7 + 0x70],	%l3
	edge8n	%o3,	%l0,	%o1
	addccc	%i6,	%o2,	%i0
	sll	%i2,	%g6,	%i4
	alignaddrl	%o6,	%g2,	%i7
	fsrc2s	%f9,	%f12
	fnegs	%f7,	%f10
	movl	%icc,	%g5,	%i3
	edge16	%g3,	%g7,	%l6
	edge8l	%i1,	%i5,	%o7
	addc	%g4,	0x11BA,	%l1
	alignaddrl	%g1,	%l4,	%l5
	sdivx	%o4,	0x0EAB,	%l2
	fornot2	%f12,	%f14,	%f2
	udiv	%o0,	0x12D7,	%o5
	ld	[%l7 + 0x50],	%f4
	movre	%o3,	0x1EC,	%l0
	smulcc	%o1,	%i6,	%l3
	fmovdl	%icc,	%f8,	%f11
	movn	%icc,	%o2,	%i2
	ldx	[%l7 + 0x58],	%i0
	save %g6, %i4, %g2
	array32	%i7,	%o6,	%i3
	or	%g5,	%g3,	%g7
	stx	%l6,	[%l7 + 0x28]
	fpadd16s	%f12,	%f6,	%f14
	and	%i5,	0x193F,	%o7
	smul	%i1,	0x1EC4,	%l1
	movneg	%xcc,	%g1,	%g4
	xnorcc	%l5,	%l4,	%o4
	move	%icc,	%o0,	%l2
	edge16l	%o3,	%l0,	%o5
	edge16	%i6,	%l3,	%o2
	fmul8x16al	%f15,	%f0,	%f2
	mova	%icc,	%i2,	%i0
	restore %g6, %i4, %o1
	edge16ln	%i7,	%o6,	%g2
	movneg	%xcc,	%g5,	%i3
	save %g7, %g3, %l6
	ldub	[%l7 + 0x4B],	%o7
	subcc	%i5,	0x0B2A,	%l1
	fpmerge	%f3,	%f15,	%f2
	fpmerge	%f14,	%f4,	%f4
	sub	%i1,	0x1D5D,	%g4
	stx	%g1,	[%l7 + 0x08]
	fpsub16s	%f15,	%f9,	%f1
	fpsub32s	%f3,	%f2,	%f7
	udivx	%l4,	0x13BA,	%o4
	movle	%xcc,	%o0,	%l5
	udiv	%o3,	0x07A0,	%l2
	and	%l0,	0x0212,	%o5
	fcmpeq32	%f12,	%f6,	%i6
	edge16n	%o2,	%i2,	%i0
	std	%f2,	[%l7 + 0x40]
	st	%f6,	[%l7 + 0x1C]
	or	%g6,	0x15E0,	%i4
	fmovdvs	%xcc,	%f1,	%f12
	fand	%f8,	%f8,	%f8
	alignaddrl	%o1,	%i7,	%l3
	stw	%o6,	[%l7 + 0x38]
	subccc	%g2,	0x1EB4,	%g5
	movrlez	%g7,	%g3,	%i3
	sll	%o7,	%i5,	%l1
	edge8	%i1,	%g4,	%l6
	addcc	%l4,	0x0B80,	%g1
	alignaddrl	%o0,	%o4,	%o3
	edge16l	%l2,	%l5,	%l0
	addcc	%i6,	%o2,	%i2
	sth	%i0,	[%l7 + 0x72]
	edge16	%g6,	%o5,	%i4
	movcc	%icc,	%i7,	%o1
	andncc	%o6,	%l3,	%g5
	movcc	%xcc,	%g2,	%g7
	edge32n	%g3,	%i3,	%i5
	movcc	%icc,	%l1,	%i1
	fmovrdlz	%o7,	%f6,	%f10
	umul	%l6,	%l4,	%g1
	xor	%o0,	%g4,	%o4
	edge16n	%o3,	%l2,	%l0
	edge8ln	%i6,	%o2,	%l5
	andn	%i0,	0x1F39,	%g6
	movl	%icc,	%o5,	%i2
	movgu	%xcc,	%i4,	%i7
	movgu	%icc,	%o1,	%o6
	array16	%g5,	%l3,	%g2
	movrgez	%g3,	%g7,	%i3
	addcc	%l1,	0x1E64,	%i1
	andcc	%i5,	0x0B9F,	%l6
	fors	%f12,	%f11,	%f6
	or	%o7,	0x0B2E,	%g1
	orncc	%l4,	%g4,	%o4
	ldsb	[%l7 + 0x2B],	%o3
	edge8l	%o0,	%l0,	%i6
	ldsb	[%l7 + 0x73],	%l2
	lduw	[%l7 + 0x34],	%l5
	fandnot1s	%f15,	%f4,	%f15
	alignaddr	%o2,	%g6,	%o5
	stb	%i0,	[%l7 + 0x65]
	ldx	[%l7 + 0x08],	%i2
	umulcc	%i4,	0x08AF,	%o1
	fxors	%f1,	%f1,	%f7
	ldsw	[%l7 + 0x74],	%i7
	smul	%o6,	0x00AA,	%g5
	fcmpgt16	%f14,	%f4,	%l3
	fnot1s	%f2,	%f13
	ldsw	[%l7 + 0x68],	%g3
	fand	%f10,	%f2,	%f0
	subc	%g2,	%i3,	%g7
	or	%l1,	0x14A4,	%i1
	udivx	%i5,	0x1FB1,	%o7
	movleu	%xcc,	%g1,	%l4
	edge32l	%g4,	%o4,	%l6
	movle	%icc,	%o0,	%o3
	xor	%i6,	%l0,	%l5
	fpack16	%f0,	%f15
	fmovspos	%xcc,	%f8,	%f14
	fors	%f6,	%f15,	%f11
	andn	%o2,	0x17A6,	%l2
	fmovdle	%xcc,	%f14,	%f3
	fnands	%f10,	%f2,	%f9
	fcmple32	%f10,	%f6,	%o5
	stb	%g6,	[%l7 + 0x3F]
	fcmpd	%fcc0,	%f14,	%f10
	popc	%i2,	%i0
	fors	%f4,	%f8,	%f10
	addccc	%i4,	0x0CF1,	%i7
	ldsw	[%l7 + 0x1C],	%o6
	mulx	%o1,	%g5,	%g3
	umulcc	%g2,	0x124E,	%i3
	array16	%g7,	%l3,	%i1
	fmovrsne	%i5,	%f8,	%f3
	ldsw	[%l7 + 0x0C],	%o7
	lduw	[%l7 + 0x3C],	%g1
	movcs	%xcc,	%l4,	%l1
	ldsb	[%l7 + 0x64],	%g4
	udiv	%o4,	0x170C,	%l6
	fmul8x16au	%f4,	%f5,	%f6
	srlx	%o3,	0x06,	%i6
	movleu	%xcc,	%l0,	%l5
	fpadd16	%f12,	%f6,	%f6
	xnor	%o2,	%o0,	%l2
	lduw	[%l7 + 0x3C],	%g6
	movvc	%xcc,	%i2,	%i0
	sub	%o5,	%i7,	%i4
	fnot1s	%f0,	%f7
	addc	%o6,	%g5,	%g3
	fxnors	%f1,	%f6,	%f11
	fabsd	%f12,	%f2
	addccc	%o1,	0x149C,	%i3
	movne	%icc,	%g7,	%g2
	stx	%i1,	[%l7 + 0x38]
	fnor	%f4,	%f2,	%f4
	orcc	%i5,	%l3,	%g1
	movle	%xcc,	%o7,	%l4
	fmul8x16au	%f0,	%f6,	%f6
	srlx	%g4,	%o4,	%l6
	fmovrdgz	%o3,	%f12,	%f4
	add	%i6,	%l0,	%l5
	edge16	%l1,	%o2,	%l2
	fxnor	%f8,	%f14,	%f6
	fmovsgu	%xcc,	%f0,	%f6
	fcmpes	%fcc2,	%f0,	%f10
	xnor	%g6,	%i2,	%o0
	fabss	%f8,	%f4
	orcc	%o5,	%i0,	%i7
	udivx	%o6,	0x180A,	%g5
	srl	%g3,	0x07,	%i4
	fmovsn	%icc,	%f7,	%f6
	ldd	[%l7 + 0x48],	%i2
	fmovrdgz	%o1,	%f14,	%f10
	fcmple16	%f0,	%f8,	%g2
	fors	%f14,	%f1,	%f12
	orcc	%g7,	%i5,	%l3
	move	%xcc,	%i1,	%g1
	edge32ln	%l4,	%g4,	%o7
	ldd	[%l7 + 0x38],	%i6
	edge8n	%o4,	%o3,	%i6
	fmovda	%xcc,	%f7,	%f9
	fmovsl	%xcc,	%f8,	%f11
	movge	%icc,	%l5,	%l1
	movre	%o2,	%l0,	%g6
	movle	%xcc,	%l2,	%i2
	sethi	0x1DF6,	%o0
	addc	%i0,	0x0890,	%i7
	fmovsg	%xcc,	%f3,	%f13
	fnegd	%f4,	%f12
	fxor	%f4,	%f14,	%f0
	fmovsn	%xcc,	%f3,	%f4
	fmovrslz	%o6,	%f9,	%f10
	orn	%g5,	0x17CD,	%g3
	alignaddr	%i4,	%o5,	%o1
	fcmple16	%f12,	%f0,	%g2
	mulscc	%i3,	%g7,	%i5
	sllx	%l3,	0x12,	%g1
	subccc	%i1,	0x1DCB,	%g4
	mulscc	%o7,	%l6,	%l4
	edge8ln	%o4,	%i6,	%o3
	edge32n	%l1,	%o2,	%l5
	edge8l	%g6,	%l0,	%i2
	fmovdvc	%xcc,	%f1,	%f14
	array16	%o0,	%l2,	%i7
	movre	%i0,	0x05A,	%o6
	movvs	%icc,	%g5,	%i4
	subc	%o5,	%g3,	%o1
	fmovscc	%icc,	%f7,	%f11
	movle	%icc,	%i3,	%g2
	fmovsge	%icc,	%f3,	%f2
	srax	%i5,	0x1D,	%g7
	st	%f4,	[%l7 + 0x3C]
	movge	%icc,	%g1,	%l3
	addcc	%i1,	%o7,	%l6
	movl	%icc,	%l4,	%g4
	array16	%o4,	%i6,	%o3
	movrgz	%o2,	0x1AE,	%l5
	fmovdcs	%icc,	%f2,	%f10
	sethi	0x0DC0,	%l1
	fmovsl	%icc,	%f8,	%f14
	ldsh	[%l7 + 0x44],	%l0
	udivcc	%g6,	0x1C08,	%o0
	smulcc	%l2,	%i2,	%i0
	xorcc	%i7,	0x1D54,	%o6
	edge32ln	%g5,	%o5,	%g3
	restore %i4, 0x1112, %i3
	popc	%g2,	%i5
	fmovdcc	%xcc,	%f9,	%f9
	movrlez	%o1,	%g7,	%g1
	orncc	%i1,	%l3,	%o7
	andncc	%l4,	%g4,	%l6
	mova	%icc,	%o4,	%i6
	movneg	%icc,	%o3,	%o2
	movre	%l5,	%l0,	%l1
	udiv	%g6,	0x1B20,	%l2
	srax	%i2,	%o0,	%i0
	movg	%icc,	%i7,	%g5
	ldd	[%l7 + 0x38],	%o6
	sll	%g3,	0x17,	%i4
	movl	%icc,	%o5,	%g2
	fpsub16	%f10,	%f2,	%f14
	fmovrdne	%i5,	%f12,	%f6
	edge8l	%o1,	%i3,	%g7
	udivcc	%g1,	0x10FF,	%i1
	movn	%icc,	%l3,	%o7
	edge32n	%g4,	%l4,	%l6
	fmovsge	%xcc,	%f9,	%f9
	fmovrsgez	%o4,	%f12,	%f12
	fcmpes	%fcc3,	%f0,	%f9
	fcmped	%fcc3,	%f12,	%f12
	sll	%o3,	0x14,	%i6
	addc	%o2,	0x0CE1,	%l5
	fones	%f4
	stx	%l1,	[%l7 + 0x08]
	edge32n	%g6,	%l0,	%l2
	fpadd32	%f10,	%f4,	%f4
	save %i2, %i0, %o0
	edge16n	%i7,	%g5,	%o6
	move	%icc,	%i4,	%g3
	sub	%o5,	0x0394,	%g2
	sdivcc	%o1,	0x12D3,	%i5
	ldsw	[%l7 + 0x3C],	%i3
	edge8n	%g7,	%i1,	%g1
	popc	0x1B8B,	%l3
	movl	%icc,	%g4,	%l4
	edge32	%l6,	%o4,	%o7
	mulscc	%o3,	0x1711,	%i6
	add	%o2,	0x0A9B,	%l1
	ldd	[%l7 + 0x78],	%g6
	orncc	%l0,	%l5,	%l2
	movre	%i2,	0x2E3,	%o0
	andcc	%i0,	0x0CAB,	%g5
	umulcc	%o6,	0x16E1,	%i7
	subccc	%g3,	0x0C8F,	%o5
	alignaddr	%g2,	%i4,	%o1
	movvc	%xcc,	%i5,	%i3
	sll	%i1,	%g1,	%l3
	fnor	%f2,	%f10,	%f4
	sra	%g7,	%g4,	%l4
	array8	%l6,	%o4,	%o7
	orcc	%i6,	0x105A,	%o2
	ldsb	[%l7 + 0x73],	%l1
	alignaddrl	%o3,	%g6,	%l5
	std	%f6,	[%l7 + 0x38]
	movneg	%xcc,	%l2,	%i2
	lduh	[%l7 + 0x32],	%o0
	add	%l0,	0x027E,	%i0
	or	%o6,	%i7,	%g3
	fmovdvs	%icc,	%f2,	%f13
	edge32n	%o5,	%g2,	%g5
	addc	%o1,	0x1226,	%i5
	sdivcc	%i3,	0x0077,	%i4
	fcmpes	%fcc1,	%f15,	%f15
	fones	%f9
	addcc	%g1,	0x1591,	%i1
	fmovrsgez	%g7,	%f12,	%f14
	sub	%g4,	%l4,	%l3
	fzero	%f12
	movrgez	%o4,	0x1FD,	%o7
	srlx	%i6,	%o2,	%l6
	movge	%icc,	%o3,	%g6
	srlx	%l5,	0x00,	%l1
	sllx	%l2,	%i2,	%l0
	fcmple32	%f12,	%f6,	%i0
	ldub	[%l7 + 0x6C],	%o0
	array8	%o6,	%i7,	%g3
	movge	%icc,	%g2,	%o5
	subc	%g5,	%o1,	%i3
	movge	%xcc,	%i5,	%g1
	popc	0x1B0E,	%i1
	addcc	%i4,	0x161C,	%g4
	movn	%xcc,	%l4,	%g7
	xorcc	%l3,	0x0B86,	%o4
	fmovsn	%xcc,	%f2,	%f10
	edge8ln	%o7,	%o2,	%i6
	edge8	%l6,	%o3,	%g6
	movleu	%xcc,	%l5,	%l1
	fcmpgt32	%f14,	%f4,	%i2
	stw	%l0,	[%l7 + 0x54]
	fcmpeq16	%f14,	%f10,	%i0
	stx	%o0,	[%l7 + 0x28]
	edge32	%o6,	%l2,	%g3
	srl	%g2,	%o5,	%i7
	orncc	%o1,	%i3,	%i5
	popc	0x1A55,	%g1
	stw	%i1,	[%l7 + 0x14]
	edge8	%g5,	%g4,	%i4
	edge32ln	%g7,	%l4,	%o4
	move	%icc,	%o7,	%o2
	fmovda	%icc,	%f11,	%f6
	orn	%i6,	0x115B,	%l3
	popc	0x18F4,	%l6
	lduh	[%l7 + 0x76],	%g6
	orcc	%l5,	0x1741,	%l1
	ldub	[%l7 + 0x6B],	%o3
	save %i2, 0x0D62, %l0
	fmovrslz	%i0,	%f10,	%f12
	umulcc	%o0,	0x0480,	%o6
	array32	%g3,	%l2,	%g2
	movpos	%xcc,	%i7,	%o5
	orcc	%o1,	%i3,	%i5
	orcc	%i1,	%g5,	%g1
	orcc	%g4,	%i4,	%l4
	udivcc	%o4,	0x054C,	%o7
	movgu	%icc,	%o2,	%i6
	fmovrslez	%g7,	%f8,	%f2
	movl	%xcc,	%l6,	%g6
	andn	%l3,	0x1B9A,	%l5
	fmovrdlez	%o3,	%f4,	%f4
	addccc	%l1,	0x1EFB,	%i2
	fnot1s	%f4,	%f7
	ld	[%l7 + 0x3C],	%f0
	sdivcc	%i0,	0x124E,	%l0
	xorcc	%o6,	0x09E4,	%o0
	movpos	%icc,	%g3,	%l2
	movle	%icc,	%g2,	%o5
	movle	%xcc,	%o1,	%i3
	sethi	0x08FE,	%i7
	movge	%xcc,	%i5,	%g5
	xorcc	%i1,	0x1318,	%g1
	ldsh	[%l7 + 0x34],	%i4
	edge32n	%l4,	%o4,	%g4
	movgu	%icc,	%o2,	%o7
	movne	%xcc,	%g7,	%l6
	edge32ln	%g6,	%l3,	%i6
	srax	%l5,	%o3,	%i2
	add	%i0,	%l0,	%l1
	orcc	%o0,	0x083B,	%o6
	subccc	%l2,	%g3,	%g2
	subc	%o5,	%o1,	%i3
	movrne	%i5,	%g5,	%i1
	alignaddr	%i7,	%g1,	%l4
	fsrc1	%f0,	%f2
	movgu	%icc,	%o4,	%g4
	fmovrdlz	%o2,	%f14,	%f14
	edge8n	%i4,	%o7,	%g7
	fandnot1	%f8,	%f10,	%f10
	restore %l6, %l3, %g6
	sth	%l5,	[%l7 + 0x30]
	movpos	%icc,	%i6,	%i2
	ldd	[%l7 + 0x30],	%f0
	add	%o3,	0x049E,	%l0
	movrlez	%l1,	0x1B0,	%o0
	save %i0, 0x168F, %o6
	addccc	%g3,	0x158D,	%g2
	fnot2s	%f6,	%f7
	fmul8x16au	%f13,	%f3,	%f12
	smul	%o5,	0x1DFB,	%o1
	fcmpne16	%f2,	%f4,	%l2
	restore %i5, %g5, %i3
	ldd	[%l7 + 0x68],	%i6
	array32	%i1,	%g1,	%o4
	movcc	%xcc,	%l4,	%g4
	addcc	%o2,	%o7,	%i4
	movrgz	%g7,	0x106,	%l3
	array32	%l6,	%g6,	%l5
	srax	%i6,	%i2,	%l0
	fmovs	%f0,	%f12
	srlx	%o3,	%l1,	%i0
	fmovsg	%icc,	%f12,	%f2
	sethi	0x0F41,	%o6
	movre	%g3,	%o0,	%g2
	fors	%f9,	%f3,	%f6
	std	%f2,	[%l7 + 0x68]
	ldub	[%l7 + 0x5A],	%o1
	sub	%l2,	0x0480,	%o5
	mulx	%g5,	%i5,	%i7
	movcs	%icc,	%i1,	%i3
	xor	%o4,	0x07E7,	%l4
	movvs	%xcc,	%g1,	%g4
	andcc	%o7,	%i4,	%g7
	alignaddr	%o2,	%l6,	%l3
	movcs	%icc,	%g6,	%i6
	edge16l	%l5,	%i2,	%l0
	fnors	%f7,	%f15,	%f13
	fabss	%f1,	%f12
	array16	%o3,	%i0,	%l1
	ld	[%l7 + 0x68],	%f12
	save %g3, %o0, %o6
	edge32l	%o1,	%l2,	%o5
	movne	%icc,	%g2,	%i5
	sllx	%i7,	0x05,	%i1
	array16	%i3,	%g5,	%l4
	move	%xcc,	%o4,	%g4
	movvs	%xcc,	%o7,	%i4
	xorcc	%g7,	%o2,	%l6
	alignaddr	%l3,	%g1,	%i6
	movleu	%icc,	%g6,	%i2
	fmul8x16	%f2,	%f14,	%f4
	array16	%l0,	%o3,	%i0
	fnegs	%f13,	%f1
	for	%f2,	%f12,	%f2
	lduh	[%l7 + 0x2C],	%l5
	ldd	[%l7 + 0x40],	%f8
	movrne	%g3,	%o0,	%o6
	and	%o1,	0x1281,	%l2
	fxor	%f12,	%f4,	%f4
	ldd	[%l7 + 0x20],	%f12
	alignaddr	%o5,	%l1,	%g2
	ldsw	[%l7 + 0x28],	%i5
	fnot2	%f8,	%f2
	fnand	%f10,	%f14,	%f0
	fmovrdlez	%i1,	%f12,	%f0
	udiv	%i7,	0x1143,	%g5
	edge32l	%i3,	%o4,	%l4
	add	%g4,	%i4,	%o7
	xor	%g7,	%l6,	%o2
	edge32ln	%g1,	%i6,	%l3
	edge32	%g6,	%i2,	%l0
	ldsw	[%l7 + 0x10],	%i0
	edge32l	%l5,	%g3,	%o3
	fpadd32s	%f12,	%f11,	%f3
	fcmpeq32	%f14,	%f4,	%o0
	or	%o6,	0x1D0E,	%l2
	edge32n	%o5,	%l1,	%o1
	addccc	%g2,	0x04CA,	%i5
	ldd	[%l7 + 0x18],	%i0
	ldsw	[%l7 + 0x44],	%i7
	addccc	%g5,	%o4,	%i3
	add	%g4,	%i4,	%l4
	movrgez	%g7,	%l6,	%o7
	subc	%o2,	0x1158,	%g1
	for	%f2,	%f2,	%f0
	umulcc	%l3,	0x1C17,	%i6
	movre	%i2,	0x255,	%l0
	srax	%g6,	%i0,	%l5
	udivx	%o3,	0x0098,	%g3
	edge32n	%o6,	%o0,	%l2
	sra	%o5,	0x09,	%l1
	popc	0x0BAC,	%g2
	smulcc	%o1,	0x1778,	%i5
	stx	%i7,	[%l7 + 0x10]
	movle	%xcc,	%i1,	%g5
	lduh	[%l7 + 0x7C],	%i3
	orcc	%o4,	%i4,	%l4
	movge	%xcc,	%g4,	%l6
	ld	[%l7 + 0x50],	%f11
	movneg	%xcc,	%g7,	%o2
	movgu	%xcc,	%o7,	%g1
	fpadd16s	%f15,	%f13,	%f15
	fpmerge	%f12,	%f8,	%f6
	smulcc	%l3,	0x1067,	%i2
	orn	%l0,	0x1343,	%g6
	edge8	%i6,	%l5,	%i0
	fcmpes	%fcc0,	%f15,	%f0
	addc	%g3,	0x0498,	%o6
	fmovscc	%xcc,	%f6,	%f14
	ldsb	[%l7 + 0x14],	%o3
	fnand	%f0,	%f14,	%f12
	sdivcc	%o0,	0x0157,	%l2
	fandnot1	%f2,	%f12,	%f12
	alignaddr	%o5,	%l1,	%o1
	alignaddrl	%i5,	%g2,	%i7
	movneg	%xcc,	%g5,	%i1
	lduh	[%l7 + 0x0C],	%o4
	fmovdg	%icc,	%f11,	%f3
	sra	%i3,	%i4,	%g4
	movvs	%xcc,	%l6,	%l4
	ldub	[%l7 + 0x0F],	%o2
	ld	[%l7 + 0x48],	%f11
	edge32n	%g7,	%o7,	%l3
	add	%i2,	%g1,	%l0
	stx	%g6,	[%l7 + 0x40]
	movle	%xcc,	%l5,	%i0
	ld	[%l7 + 0x1C],	%f8
	ldx	[%l7 + 0x28],	%i6
	edge16n	%g3,	%o3,	%o0
	fandnot1s	%f9,	%f13,	%f3
	edge8n	%o6,	%l2,	%l1
	edge32ln	%o5,	%o1,	%i5
	orn	%g2,	%i7,	%i1
	stx	%g5,	[%l7 + 0x18]
	restore %o4, 0x0D27, %i4
	edge16n	%g4,	%l6,	%i3
	edge32	%l4,	%g7,	%o2
	orn	%l3,	%i2,	%o7
	ldsw	[%l7 + 0x68],	%g1
	fmovrde	%l0,	%f10,	%f8
	smul	%l5,	0x0956,	%g6
	xnorcc	%i6,	0x03BF,	%g3
	movle	%icc,	%o3,	%o0
	movleu	%icc,	%o6,	%i0
	umulcc	%l1,	%l2,	%o5
	edge8ln	%i5,	%o1,	%g2
	lduh	[%l7 + 0x62],	%i7
	umul	%i1,	0x126E,	%o4
	movgu	%xcc,	%i4,	%g4
	movrlez	%g5,	0x211,	%i3
	bshuffle	%f0,	%f4,	%f6
	sdiv	%l6,	0x0E93,	%l4
	movleu	%icc,	%g7,	%l3
	alignaddrl	%i2,	%o2,	%o7
	edge8	%g1,	%l5,	%g6
	edge32	%i6,	%g3,	%o3
	edge32l	%l0,	%o0,	%i0
	fabss	%f2,	%f7
	ld	[%l7 + 0x7C],	%f15
	ldd	[%l7 + 0x48],	%l0
	std	%f2,	[%l7 + 0x58]
	subc	%l2,	0x0B51,	%o5
	sdivx	%i5,	0x1DA2,	%o1
	xorcc	%o6,	0x0D3E,	%i7
	fcmpgt32	%f14,	%f4,	%i1
	movrlz	%g2,	0x378,	%o4
	movrne	%g4,	0x330,	%g5
	sethi	0x18C1,	%i3
	fmovdgu	%icc,	%f3,	%f2
	array32	%i4,	%l6,	%g7
	edge16n	%l4,	%l3,	%o2
	srl	%o7,	0x14,	%g1
	sll	%i2,	%g6,	%l5
	edge32l	%i6,	%o3,	%g3
	ldd	[%l7 + 0x18],	%o0
	std	%f10,	[%l7 + 0x78]
	mulx	%l0,	%i0,	%l2
	sra	%l1,	%o5,	%i5
	smul	%o6,	0x1E55,	%i7
	andcc	%o1,	0x0C46,	%g2
	and	%o4,	0x0EF0,	%i1
	edge16ln	%g5,	%i3,	%g4
	fmovdneg	%icc,	%f11,	%f13
	umulcc	%l6,	%g7,	%i4
	fmovsne	%xcc,	%f0,	%f6
	array8	%l3,	%o2,	%l4
	xnor	%o7,	0x1AC2,	%g1
	std	%f12,	[%l7 + 0x58]
	ldsw	[%l7 + 0x14],	%i2
	and	%g6,	%i6,	%o3
	edge16ln	%l5,	%o0,	%l0
	save %i0, %l2, %g3
	ldsb	[%l7 + 0x78],	%l1
	fsrc1s	%f10,	%f2
	fmovrdne	%i5,	%f12,	%f8
	ldsb	[%l7 + 0x1E],	%o6
	add	%o5,	0x1567,	%o1
	movne	%xcc,	%g2,	%i7
	edge16l	%i1,	%g5,	%i3
	movvs	%icc,	%o4,	%l6
	edge32ln	%g7,	%g4,	%i4
	movneg	%icc,	%o2,	%l3
	edge8ln	%l4,	%g1,	%i2
	xor	%o7,	0x1D7B,	%g6
	std	%f0,	[%l7 + 0x50]
	edge8	%o3,	%i6,	%l5
	fpack32	%f2,	%f8,	%f8
	popc	%o0,	%l0
	mulx	%l2,	0x14EC,	%i0
	ldsw	[%l7 + 0x4C],	%l1
	array8	%i5,	%o6,	%g3
	addccc	%o5,	0x0C9A,	%o1
	sth	%g2,	[%l7 + 0x22]
	udiv	%i7,	0x15D6,	%g5
	edge32	%i1,	%o4,	%l6
	udivx	%i3,	0x0D83,	%g4
	movl	%icc,	%i4,	%o2
	lduw	[%l7 + 0x1C],	%l3
	fxors	%f9,	%f0,	%f2
	fmovdpos	%icc,	%f1,	%f13
	mova	%xcc,	%l4,	%g1
	movrgz	%i2,	0x065,	%g7
	ldx	[%l7 + 0x68],	%o7
	andcc	%o3,	0x11EC,	%g6
	sub	%l5,	0x00A9,	%i6
	or	%l0,	0x188D,	%l2
	fmul8ulx16	%f4,	%f6,	%f12
	movcs	%xcc,	%i0,	%l1
	ldsh	[%l7 + 0x56],	%i5
	subccc	%o6,	0x135E,	%o0
	orn	%g3,	0x199A,	%o1
	orncc	%g2,	0x05E6,	%o5
	fpsub32s	%f4,	%f5,	%f6
	ldd	[%l7 + 0x08],	%i6
	fmovsg	%icc,	%f5,	%f4
	fmovdgu	%xcc,	%f15,	%f4
	andn	%i1,	0x1F97,	%o4
	movrlez	%l6,	0x356,	%i3
	smul	%g4,	%g5,	%i4
	sethi	0x05BF,	%o2
	addccc	%l4,	%l3,	%g1
	movgu	%icc,	%g7,	%i2
	movrne	%o3,	%g6,	%l5
	xnor	%i6,	0x052F,	%o7
	mulx	%l2,	%l0,	%i0
	udivcc	%l1,	0x1C6D,	%i5
	fmovsneg	%icc,	%f15,	%f8
	movvs	%icc,	%o6,	%o0
	fmovdvs	%xcc,	%f3,	%f7
	ldub	[%l7 + 0x6D],	%o1
	smulcc	%g2,	0x0BAA,	%o5
	fmovdg	%icc,	%f6,	%f8
	udivcc	%g3,	0x0A9D,	%i1
	edge8l	%o4,	%l6,	%i7
	movrgez	%i3,	0x28C,	%g5
	alignaddr	%g4,	%o2,	%i4
	edge32l	%l3,	%g1,	%g7
	movge	%xcc,	%l4,	%o3
	movneg	%xcc,	%g6,	%i2
	movgu	%xcc,	%l5,	%o7
	edge16ln	%l2,	%i6,	%i0
	mulx	%l1,	%i5,	%l0
	or	%o6,	%o0,	%g2
	addccc	%o5,	%g3,	%i1
	stw	%o1,	[%l7 + 0x68]
	stw	%l6,	[%l7 + 0x38]
	popc	%i7,	%i3
	mova	%icc,	%g5,	%o4
	subccc	%g4,	0x1F20,	%o2
	movrgez	%l3,	0x197,	%g1
	addccc	%g7,	0x03CF,	%l4
	fmovsge	%icc,	%f14,	%f14
	fmovrse	%o3,	%f10,	%f13
	sth	%g6,	[%l7 + 0x14]
	fandnot2s	%f0,	%f14,	%f0
	subcc	%i2,	0x1376,	%i4
	movrgz	%o7,	0x2F6,	%l2
	st	%f12,	[%l7 + 0x50]
	movpos	%icc,	%i6,	%l5
	movvc	%icc,	%l1,	%i5
	edge8ln	%i0,	%o6,	%l0
	orcc	%o0,	%o5,	%g2
	fmovsvs	%xcc,	%f6,	%f2
	orn	%i1,	0x0397,	%o1
	sdiv	%l6,	0x128D,	%g3
	sth	%i7,	[%l7 + 0x34]
	andn	%g5,	%o4,	%i3
	fmovrsgz	%o2,	%f14,	%f15
	sdivx	%l3,	0x1BAB,	%g4
	sdivcc	%g1,	0x0519,	%l4
	add	%g7,	%o3,	%g6
	fmovdcc	%icc,	%f1,	%f3
	andcc	%i4,	0x1D49,	%i2
	movge	%xcc,	%l2,	%i6
	fornot1	%f8,	%f8,	%f14
	smul	%l5,	0x1896,	%o7
	fand	%f8,	%f10,	%f14
	smulcc	%i5,	%i0,	%o6
	orn	%l0,	%l1,	%o0
	fpack32	%f6,	%f14,	%f0
	fmovsvs	%xcc,	%f9,	%f1
	restore %g2, 0x02D7, %o5
	sdivcc	%o1,	0x18C6,	%l6
	save %g3, 0x141C, %i1
	ld	[%l7 + 0x68],	%f1
	xor	%i7,	%o4,	%g5
	fsrc1s	%f9,	%f13
	sdiv	%o2,	0x134F,	%i3
	andn	%l3,	%g4,	%g1
	movge	%icc,	%g7,	%l4
	fabss	%f1,	%f3
	stb	%o3,	[%l7 + 0x30]
	add	%g6,	%i2,	%i4
	srl	%l2,	%i6,	%l5
	ldsh	[%l7 + 0x7A],	%i5
	andn	%i0,	%o7,	%o6
	umul	%l0,	%o0,	%g2
	fnands	%f7,	%f12,	%f5
	subcc	%o5,	0x1888,	%l1
	or	%l6,	%o1,	%g3
	fornot2s	%f13,	%f0,	%f11
	movge	%icc,	%i1,	%o4
	sub	%i7,	0x066D,	%o2
	orn	%i3,	%g5,	%l3
	ldd	[%l7 + 0x78],	%g0
	edge8	%g7,	%l4,	%g4
	xnorcc	%o3,	%g6,	%i4
	sth	%l2,	[%l7 + 0x0C]
	fmovspos	%xcc,	%f12,	%f10
	edge32l	%i2,	%i6,	%l5
	move	%xcc,	%i0,	%o7
	subc	%i5,	%o6,	%o0
	popc	%g2,	%o5
	orncc	%l0,	0x192C,	%l6
	udiv	%o1,	0x16A7,	%g3
	sra	%i1,	0x18,	%o4
	smul	%l1,	%i7,	%o2
	fmovscc	%icc,	%f6,	%f11
	subccc	%g5,	0x0779,	%l3
	smulcc	%i3,	0x0879,	%g7
	sdivcc	%l4,	0x1935,	%g1
	smulcc	%g4,	%o3,	%i4
	fmovsa	%xcc,	%f2,	%f14
	fmovdge	%xcc,	%f4,	%f11
	fmovdn	%xcc,	%f14,	%f6
	lduh	[%l7 + 0x12],	%g6
	movl	%xcc,	%i2,	%i6
	addc	%l5,	%i0,	%o7
	fmovsn	%xcc,	%f5,	%f5
	subcc	%i5,	0x12AA,	%l2
	fpadd32s	%f3,	%f15,	%f6
	mulx	%o6,	%o0,	%g2
	addcc	%o5,	%l0,	%l6
	sdivx	%o1,	0x16B2,	%i1
	sdiv	%g3,	0x0E31,	%l1
	fnegs	%f4,	%f14
	fmovrsgez	%o4,	%f8,	%f1
	fmuld8ulx16	%f4,	%f13,	%f6
	movcs	%icc,	%i7,	%o2
	movl	%icc,	%g5,	%l3
	fnot1	%f8,	%f6
	movrlz	%g7,	%l4,	%i3
	ldsh	[%l7 + 0x1C],	%g1
	sll	%o3,	0x14,	%i4
	edge32n	%g6,	%i2,	%i6
	fmovspos	%xcc,	%f5,	%f1
	fornot1	%f10,	%f12,	%f6
	movge	%icc,	%g4,	%i0
	edge16	%o7,	%i5,	%l5
	fsrc1s	%f8,	%f9
	sra	%l2,	0x0A,	%o6
	fmovdn	%xcc,	%f6,	%f13
	fxor	%f2,	%f12,	%f6
	ldub	[%l7 + 0x33],	%g2
	orn	%o0,	0x08E7,	%o5
	ldd	[%l7 + 0x48],	%f12
	ldx	[%l7 + 0x48],	%l6
	sdivx	%o1,	0x16BA,	%i1
	sethi	0x0BBD,	%l0
	edge32n	%l1,	%o4,	%i7
	udiv	%g3,	0x083E,	%o2
	edge16ln	%g5,	%g7,	%l4
	edge8n	%l3,	%g1,	%o3
	andn	%i4,	%g6,	%i3
	std	%f2,	[%l7 + 0x18]
	restore %i6, 0x07BC, %i2
	orcc	%i0,	0x015C,	%o7
	movrlz	%g4,	%i5,	%l5
	fpadd16s	%f15,	%f11,	%f1
	mulscc	%l2,	%o6,	%o0
	edge32n	%g2,	%l6,	%o5
	movpos	%icc,	%i1,	%l0
	sdivx	%o1,	0x1D35,	%l1
	fpadd32	%f6,	%f2,	%f10
	edge32ln	%o4,	%g3,	%i7
	edge16ln	%o2,	%g5,	%l4
	fsrc1s	%f11,	%f13
	fmovdvs	%xcc,	%f0,	%f7
	fmovs	%f0,	%f13
	alignaddrl	%l3,	%g7,	%g1
	xor	%i4,	0x08D9,	%o3
	srax	%g6,	0x1B,	%i6
	movge	%xcc,	%i3,	%i0
	ldx	[%l7 + 0x68],	%i2
	fmovdvs	%xcc,	%f11,	%f9
	fmovrdgez	%g4,	%f14,	%f12
	fmovrdlez	%i5,	%f2,	%f12
	fmovrdgez	%o7,	%f14,	%f12
	andncc	%l2,	%o6,	%o0
	fcmped	%fcc0,	%f8,	%f12
	movcc	%xcc,	%l5,	%l6
	movpos	%xcc,	%g2,	%o5
	sll	%i1,	0x04,	%o1
	movvs	%xcc,	%l1,	%l0
	movcc	%icc,	%o4,	%i7
	udivcc	%o2,	0x0312,	%g3
	sdivcc	%g5,	0x08DB,	%l4
	movle	%icc,	%l3,	%g1
	lduh	[%l7 + 0x26],	%i4
	lduh	[%l7 + 0x66],	%o3
	fmovdpos	%icc,	%f1,	%f14
	movrgz	%g7,	0x0B3,	%g6
	edge8	%i3,	%i6,	%i0
	xor	%g4,	0x0C11,	%i5
	edge8l	%i2,	%o7,	%o6
	edge16n	%l2,	%o0,	%l5
	edge32l	%l6,	%g2,	%i1
	movvc	%xcc,	%o1,	%o5
	umulcc	%l1,	%o4,	%i7
	sdivx	%o2,	0x0064,	%l0
	xnorcc	%g5,	%g3,	%l4
	ldd	[%l7 + 0x48],	%g0
	save %i4, 0x083C, %l3
	or	%g7,	%g6,	%i3
	ldd	[%l7 + 0x30],	%o2
	sth	%i6,	[%l7 + 0x5A]
	ldd	[%l7 + 0x20],	%i0
	fpadd16	%f2,	%f8,	%f8
	smul	%i5,	0x0BA6,	%i2
	fmovdvc	%xcc,	%f13,	%f15
	fandnot2s	%f14,	%f4,	%f5
	fmovrslz	%o7,	%f11,	%f5
	edge8	%o6,	%g4,	%l2
	andn	%o0,	0x1ECA,	%l5
	srl	%l6,	%i1,	%g2
	fsrc1	%f2,	%f8
	array32	%o1,	%l1,	%o5
	edge8l	%o4,	%i7,	%l0
	movvc	%xcc,	%g5,	%o2
	fmovsle	%xcc,	%f14,	%f14
	xor	%g3,	%l4,	%g1
	fmovrsgz	%i4,	%f7,	%f3
	fpadd16s	%f8,	%f10,	%f15
	andncc	%l3,	%g7,	%g6
	umul	%o3,	0x0FFB,	%i3
	ldd	[%l7 + 0x38],	%i0
	ldub	[%l7 + 0x25],	%i6
	fmovdleu	%icc,	%f4,	%f5
	ldd	[%l7 + 0x38],	%f2
	fmovda	%xcc,	%f6,	%f3
	st	%f12,	[%l7 + 0x74]
	movrne	%i5,	0x23B,	%o7
	umulcc	%i2,	0x134C,	%g4
	edge16ln	%o6,	%l2,	%l5
	edge16n	%l6,	%i1,	%g2
	ldsw	[%l7 + 0x60],	%o0
	fmovsvs	%icc,	%f3,	%f11
	movvc	%icc,	%o1,	%l1
	srl	%o4,	%i7,	%l0
	mova	%icc,	%g5,	%o2
	ldd	[%l7 + 0x30],	%o4
	movgu	%xcc,	%g3,	%l4
	array16	%g1,	%l3,	%i4
	fmuld8ulx16	%f15,	%f2,	%f14
	udiv	%g6,	0x1718,	%g7
	fpsub16	%f10,	%f8,	%f4
	edge16l	%o3,	%i3,	%i0
	or	%i6,	0x17A9,	%o7
	xnor	%i2,	%i5,	%g4
	sll	%l2,	%l5,	%l6
	ld	[%l7 + 0x64],	%f4
	add	%i1,	0x02CB,	%o6
	movneg	%icc,	%o0,	%g2
	edge32	%o1,	%o4,	%i7
	udivx	%l1,	0x1FCE,	%g5
	srlx	%l0,	0x05,	%o2
	sdivcc	%g3,	0x193F,	%o5
	udivcc	%l4,	0x0BED,	%l3
	movpos	%xcc,	%i4,	%g6
	movn	%xcc,	%g1,	%o3
	fxor	%f2,	%f8,	%f12
	popc	0x187A,	%i3
	alignaddr	%i0,	%g7,	%i6
	sdiv	%o7,	0x0722,	%i5
	fcmpeq32	%f14,	%f10,	%i2
	edge16ln	%g4,	%l2,	%l5
	fmul8x16	%f13,	%f0,	%f12
	st	%f14,	[%l7 + 0x48]
	movre	%l6,	0x246,	%i1
	movrlz	%o0,	0x161,	%o6
	fmuld8ulx16	%f2,	%f0,	%f8
	add	%o1,	%o4,	%g2
	movne	%xcc,	%l1,	%g5
	lduh	[%l7 + 0x7A],	%i7
	fmovse	%xcc,	%f10,	%f3
	srax	%l0,	0x15,	%g3
	sdivx	%o2,	0x055E,	%l4
	fmul8ulx16	%f14,	%f2,	%f0
	alignaddr	%l3,	%o5,	%i4
	movrlez	%g6,	0x2AD,	%g1
	restore %i3, 0x1BEA, %o3
	udivx	%i0,	0x0B07,	%i6
	edge16	%g7,	%i5,	%o7
	ldd	[%l7 + 0x70],	%g4
	andcc	%i2,	0x15E1,	%l5
	edge32	%l6,	%l2,	%i1
	udiv	%o0,	0x0C92,	%o1
	srax	%o4,	%o6,	%g2
	fmovdvs	%icc,	%f6,	%f11
	movrgz	%g5,	0x038,	%l1
	movrgez	%l0,	%g3,	%i7
	fmovdleu	%xcc,	%f12,	%f11
	fmovdl	%icc,	%f10,	%f1
	movg	%icc,	%l4,	%l3
	xor	%o5,	%o2,	%i4
	movre	%g1,	0x29C,	%g6
	srlx	%o3,	0x0B,	%i3
	movvs	%xcc,	%i0,	%g7
	fxnors	%f0,	%f11,	%f2
	sub	%i6,	0x04E5,	%i5
	ldd	[%l7 + 0x30],	%o6
	subcc	%i2,	%g4,	%l5
	movl	%icc,	%l6,	%i1
	array16	%l2,	%o0,	%o1
	edge32	%o6,	%o4,	%g2
	sub	%l1,	%l0,	%g5
	movge	%icc,	%i7,	%l4
	orcc	%l3,	%g3,	%o2
	fnand	%f2,	%f4,	%f12
	alignaddr	%o5,	%i4,	%g6
	alignaddr	%g1,	%i3,	%o3
	fcmpne16	%f10,	%f10,	%g7
	xorcc	%i6,	0x08C2,	%i5
	array8	%o7,	%i0,	%g4
	edge8ln	%i2,	%l6,	%l5
	and	%l2,	0x043F,	%i1
	movge	%xcc,	%o0,	%o1
	ldd	[%l7 + 0x10],	%f0
	fmovse	%xcc,	%f4,	%f11
	addc	%o4,	%o6,	%g2
	xnor	%l0,	0x17D1,	%l1
	movne	%xcc,	%g5,	%l4
	fones	%f0
	addcc	%i7,	0x1617,	%g3
	edge32n	%o2,	%l3,	%o5
	xnorcc	%g6,	%i4,	%g1
	andcc	%i3,	%g7,	%i6
	movneg	%xcc,	%o3,	%o7
	movn	%icc,	%i0,	%g4
	fandnot1	%f0,	%f6,	%f10
	sdiv	%i5,	0x0506,	%l6
	andncc	%i2,	%l2,	%i1
	ldub	[%l7 + 0x2B],	%l5
	sth	%o0,	[%l7 + 0x4C]
	andn	%o1,	%o4,	%o6
	andncc	%g2,	%l1,	%g5
	andncc	%l4,	%i7,	%g3
	addcc	%l0,	%l3,	%o5
	orncc	%o2,	0x13AA,	%i4
	stw	%g6,	[%l7 + 0x4C]
	edge32	%i3,	%g1,	%i6
	fmul8sux16	%f14,	%f4,	%f2
	xorcc	%g7,	0x1B91,	%o7
	lduw	[%l7 + 0x7C],	%i0
	stw	%o3,	[%l7 + 0x78]
	fmovsg	%xcc,	%f2,	%f14
	udivcc	%g4,	0x0C18,	%l6
	ldx	[%l7 + 0x10],	%i5
	fandnot1	%f0,	%f10,	%f4
	edge16n	%l2,	%i2,	%i1
	st	%f1,	[%l7 + 0x78]
	orcc	%l5,	%o0,	%o1
	array16	%o6,	%g2,	%l1
	udivx	%g5,	0x02E4,	%o4
	edge8n	%i7,	%l4,	%g3
	st	%f4,	[%l7 + 0x48]
	pdist	%f6,	%f14,	%f6
	fmovs	%f13,	%f1
	fmovrsne	%l3,	%f4,	%f1
	sdivcc	%l0,	0x1B55,	%o2
	fnot2	%f4,	%f8
	fmuld8sux16	%f7,	%f10,	%f6
	fnot1	%f6,	%f14
	fmovdleu	%xcc,	%f5,	%f5
	fmovspos	%icc,	%f7,	%f9
	umulcc	%o5,	0x02A0,	%i4
	sllx	%i3,	0x0E,	%g6
	fmovdvc	%icc,	%f10,	%f1
	movle	%icc,	%i6,	%g1
	mova	%xcc,	%o7,	%g7
	faligndata	%f10,	%f2,	%f8
	fnot2	%f10,	%f14
	stw	%o3,	[%l7 + 0x38]
	stx	%g4,	[%l7 + 0x40]
	xnor	%l6,	%i5,	%l2
	movrgez	%i0,	%i2,	%l5
	fandnot2s	%f4,	%f2,	%f4
	movpos	%xcc,	%i1,	%o1
	fmovrdlez	%o6,	%f12,	%f0
	edge32n	%g2,	%l1,	%o0
	fmul8sux16	%f10,	%f6,	%f4
	edge32l	%o4,	%g5,	%l4
	ldd	[%l7 + 0x60],	%f4
	edge16l	%g3,	%i7,	%l0
	ldsh	[%l7 + 0x4A],	%l3
	edge8l	%o2,	%i4,	%i3
	movpos	%icc,	%g6,	%i6
	ldd	[%l7 + 0x58],	%f4
	fpadd32s	%f7,	%f14,	%f3
	fmovdge	%icc,	%f12,	%f15
	fmovse	%xcc,	%f6,	%f7
	xor	%g1,	%o5,	%o7
	xorcc	%g7,	0x1422,	%o3
	movrlz	%g4,	0x026,	%l6
	andn	%i5,	%l2,	%i2
	fpack32	%f0,	%f6,	%f2
	orncc	%i0,	0x1448,	%i1
	movrne	%l5,	0x3BC,	%o6
	sethi	0x0AB3,	%g2
	movrgez	%o1,	0x2FA,	%o0
	sethi	0x0319,	%o4
	fmovdvs	%xcc,	%f13,	%f11
	orcc	%g5,	%l1,	%g3
	fand	%f4,	%f14,	%f8
	edge32ln	%i7,	%l4,	%l3
	fmovsgu	%xcc,	%f11,	%f9
	fcmpd	%fcc2,	%f10,	%f0
	umul	%l0,	0x1033,	%i4
	addcc	%o2,	0x031C,	%g6
	subcc	%i3,	%i6,	%g1
	movrlez	%o5,	0x023,	%g7
	mova	%icc,	%o3,	%o7
	fands	%f5,	%f1,	%f11
	addc	%l6,	%i5,	%l2
	sth	%i2,	[%l7 + 0x3C]
	ldub	[%l7 + 0x26],	%i0
	fmovscs	%xcc,	%f4,	%f3
	ldx	[%l7 + 0x60],	%i1
	xor	%g4,	0x0E55,	%l5
	movrgz	%g2,	0x23B,	%o1
	movcc	%xcc,	%o0,	%o6
	ldsh	[%l7 + 0x34],	%g5
	lduh	[%l7 + 0x52],	%o4
	addccc	%g3,	0x082A,	%i7
	srlx	%l1,	0x11,	%l3
	srax	%l4,	0x15,	%i4
	edge32n	%o2,	%g6,	%i3
	movne	%xcc,	%i6,	%l0
	st	%f0,	[%l7 + 0x50]
	ldsw	[%l7 + 0x18],	%g1
	movge	%xcc,	%o5,	%o3
	fmovdcc	%icc,	%f10,	%f11
	edge32	%o7,	%g7,	%i5
	movg	%xcc,	%l2,	%i2
	sub	%i0,	0x13F9,	%l6
	fmovdleu	%icc,	%f13,	%f14
	or	%g4,	%l5,	%i1
	stb	%o1,	[%l7 + 0x61]
	smulcc	%o0,	%g2,	%o6
	movge	%xcc,	%o4,	%g5
	movrgz	%g3,	%l1,	%l3
	ldsb	[%l7 + 0x45],	%l4
	subcc	%i7,	%i4,	%g6
	ldsw	[%l7 + 0x34],	%i3
	sllx	%o2,	%l0,	%i6
	ld	[%l7 + 0x28],	%f15
	edge32ln	%o5,	%g1,	%o3
	movge	%xcc,	%g7,	%i5
	movvc	%xcc,	%l2,	%o7
	ldd	[%l7 + 0x08],	%f10
	umul	%i0,	0x1760,	%i2
	edge8ln	%g4,	%l5,	%i1
	sethi	0x0735,	%o1
	sth	%l6,	[%l7 + 0x66]
	movrgez	%g2,	0x156,	%o6
	subccc	%o0,	%g5,	%g3
	fnors	%f4,	%f12,	%f2
	movrgz	%o4,	%l1,	%l4
	srl	%l3,	%i4,	%i7
	add	%i3,	0x0C12,	%o2
	movvs	%icc,	%l0,	%i6
	lduw	[%l7 + 0x64],	%g6
	alignaddr	%o5,	%o3,	%g1
	array8	%i5,	%l2,	%g7
	fmovsgu	%xcc,	%f13,	%f12
	ldd	[%l7 + 0x38],	%f14
	umul	%o7,	%i0,	%g4
	movneg	%icc,	%i2,	%i1
	xorcc	%o1,	0x14ED,	%l5
	movcc	%xcc,	%l6,	%o6
	movle	%icc,	%g2,	%o0
	fmul8sux16	%f2,	%f12,	%f10
	orn	%g5,	0x0FA5,	%g3
	fandnot2s	%f13,	%f0,	%f12
	ldsw	[%l7 + 0x50],	%o4
	fmovrdgz	%l1,	%f14,	%f8
	fsrc1	%f6,	%f6
	fands	%f0,	%f12,	%f13
	edge8	%l4,	%l3,	%i7
	fmovdgu	%icc,	%f15,	%f10
	stx	%i4,	[%l7 + 0x68]
	fandnot2	%f12,	%f10,	%f4
	edge32ln	%o2,	%i3,	%l0
	fandnot2	%f4,	%f8,	%f4
	xnorcc	%i6,	%o5,	%g6
	edge32l	%o3,	%i5,	%g1
	faligndata	%f6,	%f4,	%f4
	udivcc	%g7,	0x1C87,	%l2
	fpsub32	%f2,	%f8,	%f4
	umulcc	%o7,	0x1834,	%i0
	movcs	%icc,	%i2,	%i1
	movvc	%icc,	%g4,	%l5
	srax	%o1,	%o6,	%g2
	fpsub16	%f8,	%f10,	%f10
	andn	%o0,	%l6,	%g3
	sllx	%g5,	0x1A,	%l1
	ldsh	[%l7 + 0x70],	%l4
	sdiv	%l3,	0x16D2,	%i7
	andn	%i4,	0x0DB0,	%o4
	fpadd16s	%f6,	%f8,	%f14
	pdist	%f14,	%f6,	%f10
	fmovrdlz	%i3,	%f0,	%f2
	fnegd	%f14,	%f12
	addc	%o2,	%l0,	%i6
	movneg	%xcc,	%o5,	%g6
	lduh	[%l7 + 0x5C],	%i5
	andcc	%g1,	%g7,	%l2
	fmovdn	%xcc,	%f6,	%f15
	fcmpeq32	%f2,	%f0,	%o3
	ld	[%l7 + 0x64],	%f6
	fornot2	%f14,	%f8,	%f0
	fmovrdgez	%o7,	%f6,	%f12
	fzero	%f14
	fmovrslez	%i2,	%f12,	%f3
	fandnot1	%f4,	%f0,	%f2
	ldsb	[%l7 + 0x6B],	%i0
	edge8	%g4,	%l5,	%i1
	movvc	%xcc,	%o1,	%o6
	sllx	%g2,	0x16,	%l6
	movleu	%xcc,	%o0,	%g5
	movgu	%xcc,	%l1,	%l4
	stx	%g3,	[%l7 + 0x58]
	and	%i7,	0x0EE5,	%i4
	edge8ln	%o4,	%i3,	%l3
	movle	%icc,	%l0,	%i6
	move	%icc,	%o5,	%o2
	subcc	%i5,	0x0C82,	%g6
	udiv	%g1,	0x1FB6,	%l2
	sdivcc	%o3,	0x1B0D,	%o7
	movge	%xcc,	%i2,	%i0
	movcc	%icc,	%g7,	%l5
	movpos	%xcc,	%i1,	%g4
	ldub	[%l7 + 0x41],	%o1
	move	%icc,	%o6,	%g2
	fmovsge	%icc,	%f15,	%f14
	ldub	[%l7 + 0x41],	%l6
	fornot2s	%f3,	%f10,	%f6
	subccc	%o0,	%g5,	%l1
	movpos	%icc,	%l4,	%g3
	fmovrdne	%i7,	%f4,	%f14
	srl	%i4,	0x01,	%i3
	array32	%o4,	%l0,	%l3
	ldsb	[%l7 + 0x0D],	%o5
	edge32l	%i6,	%i5,	%g6
	movleu	%icc,	%g1,	%l2
	or	%o2,	%o3,	%i2
	pdist	%f14,	%f8,	%f2
	movpos	%xcc,	%o7,	%i0
	movrne	%l5,	0x33A,	%i1
	fcmpne32	%f12,	%f0,	%g7
	fmovdg	%xcc,	%f9,	%f11
	fcmpgt32	%f8,	%f12,	%g4
	orncc	%o6,	0x0EE1,	%g2
	smul	%l6,	%o0,	%g5
	fmovdcs	%icc,	%f15,	%f9
	fexpand	%f9,	%f12
	smul	%o1,	%l4,	%l1
	fmovrslz	%i7,	%f12,	%f12
	orcc	%g3,	%i3,	%i4
	movvc	%xcc,	%o4,	%l3
	udiv	%o5,	0x0DBC,	%l0
	save %i6, %g6, %g1
	subccc	%i5,	%l2,	%o3
	sra	%i2,	0x04,	%o2
	sdivcc	%o7,	0x0E82,	%l5
	edge32n	%i0,	%g7,	%g4
	addcc	%o6,	0x1BA5,	%i1
	andn	%g2,	0x06EE,	%o0
	edge16n	%l6,	%g5,	%o1
	umul	%l1,	%l4,	%g3
	fcmpeq32	%f4,	%f4,	%i7
	movvs	%icc,	%i4,	%o4
	orn	%i3,	0x09D6,	%o5
	edge32n	%l3,	%i6,	%l0
	movg	%icc,	%g1,	%g6
	fandnot1	%f4,	%f14,	%f12
	xor	%i5,	%l2,	%o3
	subcc	%i2,	0x1A12,	%o7
	edge8n	%o2,	%l5,	%g7
	sethi	0x0BC0,	%i0
	fors	%f2,	%f15,	%f11
	ldsb	[%l7 + 0x65],	%g4
	fpack32	%f12,	%f12,	%f2
	ldsb	[%l7 + 0x58],	%i1
	fmovsn	%icc,	%f12,	%f15
	smulcc	%g2,	%o6,	%l6
	edge8ln	%o0,	%o1,	%g5
	sdiv	%l1,	0x1203,	%g3
	subccc	%i7,	%i4,	%l4
	lduh	[%l7 + 0x50],	%i3
	movl	%xcc,	%o4,	%o5
	array16	%i6,	%l0,	%l3
	subcc	%g1,	%g6,	%i5
	addccc	%l2,	%i2,	%o7
	fmovdcs	%icc,	%f3,	%f10
	sth	%o3,	[%l7 + 0x10]
	movcc	%icc,	%o2,	%l5
	srlx	%i0,	%g4,	%i1
	mulx	%g7,	%o6,	%l6
	ldx	[%l7 + 0x70],	%g2
	sub	%o0,	0x1044,	%g5
	edge32ln	%l1,	%o1,	%g3
	sth	%i7,	[%l7 + 0x2C]
	xor	%l4,	0x1B9C,	%i3
	andn	%o4,	%i4,	%o5
	addc	%l0,	0x086C,	%i6
	movn	%icc,	%g1,	%l3
	subcc	%g6,	%i5,	%i2
	alignaddrl	%l2,	%o7,	%o3
	movvs	%icc,	%o2,	%l5
	edge32ln	%g4,	%i0,	%g7
	srlx	%i1,	0x1B,	%o6
	fmovrdne	%l6,	%f8,	%f12
	fpmerge	%f15,	%f6,	%f0
	addc	%o0,	%g5,	%g2
	fcmped	%fcc3,	%f6,	%f10
	fpsub32	%f4,	%f14,	%f2
	fmovde	%icc,	%f2,	%f11
	fxors	%f13,	%f9,	%f12
	fmovsne	%icc,	%f2,	%f14
	popc	0x075F,	%l1
	sllx	%g3,	%o1,	%i7
	orn	%i3,	0x1A0C,	%o4
	alignaddr	%i4,	%l4,	%o5
	fcmped	%fcc1,	%f0,	%f14
	orn	%i6,	0x0695,	%g1
	orn	%l3,	%g6,	%i5
	fmovsl	%icc,	%f13,	%f6
	movneg	%xcc,	%i2,	%l0
	movg	%xcc,	%o7,	%l2
	ldsb	[%l7 + 0x74],	%o2
	and	%l5,	0x12B8,	%o3
	array8	%g4,	%g7,	%i0
	fcmpne16	%f10,	%f6,	%i1
	fmovrdgez	%l6,	%f8,	%f2
	alignaddr	%o6,	%g5,	%o0
	stx	%g2,	[%l7 + 0x30]
	srl	%l1,	0x03,	%o1
	move	%icc,	%i7,	%g3
	fmovde	%icc,	%f5,	%f11
	smul	%o4,	%i3,	%l4
	xorcc	%i4,	0x1965,	%o5
	xorcc	%i6,	0x0408,	%l3
	fxors	%f2,	%f7,	%f4
	orcc	%g6,	%g1,	%i5
	fcmps	%fcc2,	%f8,	%f14
	fmovsvs	%xcc,	%f3,	%f14
	fmovd	%f8,	%f10
	movrgez	%i2,	%l0,	%o7
	fcmps	%fcc2,	%f9,	%f7
	udivcc	%o2,	0x0D17,	%l5
	array16	%o3,	%l2,	%g7
	ld	[%l7 + 0x24],	%f15
	fmovdcc	%xcc,	%f3,	%f4
	edge16ln	%g4,	%i1,	%l6
	srl	%o6,	0x07,	%g5
	subccc	%o0,	0x0362,	%g2
	st	%f12,	[%l7 + 0x3C]
	fones	%f2
	orncc	%i0,	0x1129,	%l1
	ldsb	[%l7 + 0x78],	%o1
	sll	%g3,	%i7,	%i3
	fmovrsgz	%l4,	%f13,	%f10
	edge8ln	%o4,	%o5,	%i4
	edge32l	%i6,	%l3,	%g1
	fmovrsgz	%g6,	%f5,	%f0
	srax	%i5,	0x01,	%i2
	umul	%o7,	%o2,	%l0
	movcc	%icc,	%l5,	%l2
	subcc	%o3,	%g4,	%i1
	edge8	%g7,	%l6,	%o6
	fmovdge	%icc,	%f8,	%f15
	umul	%o0,	0x04D3,	%g5
	udivcc	%g2,	0x1F75,	%i0
	alignaddrl	%o1,	%g3,	%i7
	edge32	%l1,	%l4,	%i3
	fnegd	%f2,	%f4
	movn	%icc,	%o4,	%o5
	movrlz	%i6,	0x34D,	%i4
	movvc	%xcc,	%l3,	%g6
	edge16ln	%i5,	%g1,	%o7
	edge8n	%i2,	%l0,	%l5
	orncc	%o2,	%o3,	%g4
	xnorcc	%i1,	%l2,	%l6
	ldd	[%l7 + 0x70],	%f10
	movrne	%g7,	%o6,	%g5
	ldsw	[%l7 + 0x5C],	%o0
	restore %g2, 0x0845, %o1
	movvc	%xcc,	%i0,	%i7
	fcmple32	%f4,	%f14,	%l1
	xnorcc	%g3,	0x18D4,	%i3
	move	%icc,	%o4,	%o5
	udivx	%l4,	0x08E7,	%i4
	edge8	%i6,	%g6,	%l3
	fmovscc	%xcc,	%f0,	%f15
	fsrc1	%f2,	%f8
	xnor	%i5,	%g1,	%i2
	ldx	[%l7 + 0x08],	%l0
	subc	%o7,	%o2,	%o3
	movg	%icc,	%l5,	%i1
	and	%g4,	0x0324,	%l2
	fmul8ulx16	%f6,	%f4,	%f8
	movl	%icc,	%l6,	%o6
	movrgz	%g5,	%g7,	%g2
	xor	%o1,	%o0,	%i7
	movne	%icc,	%l1,	%i0
	smulcc	%g3,	%i3,	%o5
	sth	%l4,	[%l7 + 0x44]
	sethi	0x13D8,	%o4
	movvc	%xcc,	%i4,	%g6
	fmovsa	%xcc,	%f0,	%f3
	xnorcc	%l3,	0x0AD6,	%i6
	ldsh	[%l7 + 0x10],	%i5
	andcc	%g1,	0x133A,	%i2
	edge32l	%o7,	%l0,	%o3
	fsrc2s	%f3,	%f9
	sdiv	%o2,	0x1606,	%l5
	movle	%icc,	%i1,	%g4
	ldx	[%l7 + 0x50],	%l2
	fandnot1	%f2,	%f6,	%f14
	lduh	[%l7 + 0x0E],	%l6
	movrlz	%o6,	0x168,	%g7
	alignaddr	%g5,	%g2,	%o1
	mova	%icc,	%o0,	%i7
	subccc	%i0,	0x00F6,	%g3
	fcmpes	%fcc0,	%f1,	%f12
	array16	%l1,	%i3,	%o5
	subcc	%o4,	0x1D96,	%i4
	movrne	%g6,	0x20B,	%l3
	and	%l4,	%i5,	%g1
	subcc	%i2,	%i6,	%o7
	movrgez	%o3,	%o2,	%l5
	sllx	%l0,	0x0F,	%g4
	st	%f12,	[%l7 + 0x2C]
	andn	%l2,	0x1125,	%l6
	srax	%i1,	%g7,	%o6
	umul	%g2,	%g5,	%o1
	edge32	%o0,	%i7,	%g3
	xnor	%i0,	%l1,	%o5
	edge16ln	%o4,	%i4,	%i3
	srlx	%g6,	0x0A,	%l3
	mova	%xcc,	%i5,	%g1
	ldd	[%l7 + 0x70],	%l4
	fcmple16	%f2,	%f14,	%i6
	fnegs	%f14,	%f4
	edge16l	%o7,	%o3,	%o2
	edge8ln	%i2,	%l0,	%g4
	fmovsa	%xcc,	%f11,	%f8
	fmovdleu	%icc,	%f4,	%f10
	ldx	[%l7 + 0x60],	%l2
	movneg	%icc,	%l5,	%i1
	movn	%icc,	%l6,	%g7
	xor	%o6,	%g5,	%g2
	st	%f9,	[%l7 + 0x54]
	movcc	%xcc,	%o0,	%o1
	edge32ln	%g3,	%i7,	%i0
	movneg	%icc,	%o5,	%l1
	movpos	%xcc,	%o4,	%i3
	ldd	[%l7 + 0x68],	%f2
	ld	[%l7 + 0x58],	%f8
	movge	%icc,	%i4,	%g6
	fpadd32s	%f9,	%f4,	%f15
	sdiv	%i5,	0x1BB2,	%l3
	stx	%l4,	[%l7 + 0x10]
	addcc	%g1,	%i6,	%o3
	fandnot1	%f10,	%f12,	%f10
	st	%f2,	[%l7 + 0x44]
	and	%o2,	%o7,	%l0
	movge	%icc,	%g4,	%l2
	alignaddr	%i2,	%i1,	%l6
	fabsd	%f6,	%f8
	stb	%g7,	[%l7 + 0x52]
	edge32	%o6,	%l5,	%g5
	fcmps	%fcc2,	%f10,	%f10
	fone	%f2
	movvs	%xcc,	%o0,	%g2
	sethi	0x060C,	%g3
	fcmpeq16	%f8,	%f10,	%i7
	subccc	%i0,	%o1,	%l1
	smul	%o4,	%o5,	%i4
	subcc	%i3,	%g6,	%l3
	stw	%i5,	[%l7 + 0x10]
	sra	%l4,	%g1,	%o3
	edge16l	%i6,	%o2,	%l0
	movre	%g4,	%o7,	%l2
	fmovrsgez	%i2,	%f13,	%f1
	sdiv	%i1,	0x05E4,	%l6
	ldsb	[%l7 + 0x36],	%o6
	fandnot1s	%f15,	%f4,	%f8
	ldub	[%l7 + 0x61],	%g7
	srax	%l5,	0x04,	%g5
	stx	%o0,	[%l7 + 0x38]
	subcc	%g3,	0x0614,	%g2
	andn	%i7,	%i0,	%l1
	stx	%o1,	[%l7 + 0x68]
	orncc	%o4,	%o5,	%i3
	fmovrsgz	%g6,	%f8,	%f0
	edge16	%i4,	%l3,	%l4
	fnand	%f10,	%f8,	%f14
	add	%i5,	0x0ECA,	%o3
	fexpand	%f7,	%f6
	movneg	%icc,	%g1,	%o2
	sdivcc	%i6,	0x149C,	%l0
	sethi	0x18C4,	%o7
	fcmpgt16	%f12,	%f2,	%g4
	andcc	%i2,	0x17EE,	%i1
	sdivcc	%l2,	0x0452,	%o6
	sdivcc	%g7,	0x017E,	%l6
	edge16n	%l5,	%g5,	%o0
	or	%g3,	0x1788,	%g2
	edge16	%i0,	%i7,	%o1
	orn	%o4,	0x0E03,	%o5
	xnor	%i3,	0x15B1,	%l1
	fpsub32s	%f5,	%f6,	%f15
	andcc	%g6,	%i4,	%l3
	mulx	%l4,	0x0162,	%o3
	sdivcc	%g1,	0x0BB0,	%i5
	edge32	%o2,	%i6,	%l0
	fsrc1s	%f11,	%f9
	or	%g4,	%i2,	%o7
	movl	%xcc,	%l2,	%i1
	andn	%g7,	0x069E,	%l6
	edge8ln	%l5,	%g5,	%o0
	edge8	%g3,	%o6,	%g2
	orncc	%i7,	0x1424,	%o1
	st	%f9,	[%l7 + 0x78]
	movne	%xcc,	%o4,	%i0
	sethi	0x1955,	%i3
	fnands	%f15,	%f3,	%f3
	lduh	[%l7 + 0x78],	%o5
	sdivx	%l1,	0x0CFB,	%g6
	ldub	[%l7 + 0x59],	%i4
	addc	%l3,	%o3,	%g1
	add	%l4,	0x06BC,	%o2
	fmovsgu	%xcc,	%f6,	%f0
	edge8	%i5,	%i6,	%l0
	st	%f5,	[%l7 + 0x4C]
	movvs	%icc,	%i2,	%o7
	edge16ln	%g4,	%i1,	%l2
	lduh	[%l7 + 0x46],	%g7
	fabsd	%f10,	%f8
	fzero	%f0
	movrgez	%l6,	0x17A,	%l5
	movrgz	%o0,	0x1A2,	%g3
	movle	%icc,	%o6,	%g5
	lduh	[%l7 + 0x6E],	%i7
	movgu	%xcc,	%g2,	%o1
	udivcc	%o4,	0x1B2E,	%i3
	smulcc	%i0,	0x1ED1,	%o5
	siam	0x7
	lduh	[%l7 + 0x10],	%g6
	smulcc	%i4,	%l1,	%l3
	subcc	%o3,	0x0AFD,	%g1
	move	%xcc,	%o2,	%i5
	stw	%l4,	[%l7 + 0x6C]
	fmovsleu	%xcc,	%f2,	%f0
	fmovdvc	%icc,	%f7,	%f5
	ldsh	[%l7 + 0x68],	%l0
	fmovrsne	%i2,	%f0,	%f10
	fxnors	%f10,	%f13,	%f4
	pdist	%f2,	%f14,	%f10
	edge32n	%o7,	%g4,	%i6
	sllx	%l2,	%i1,	%g7
	mulx	%l6,	0x0D82,	%o0
	movcs	%xcc,	%g3,	%l5
	mulx	%o6,	0x0D3A,	%g5
	xor	%g2,	%i7,	%o4
	move	%icc,	%i3,	%i0
	edge32ln	%o1,	%g6,	%i4
	smul	%o5,	%l1,	%l3
	pdist	%f14,	%f10,	%f8
	smulcc	%g1,	0x024C,	%o2
	udiv	%o3,	0x0EC3,	%l4
	fmul8sux16	%f12,	%f4,	%f2
	umulcc	%l0,	%i2,	%i5
	udivx	%o7,	0x167B,	%g4
	udivcc	%i6,	0x1113,	%l2
	edge32l	%i1,	%l6,	%o0
	udiv	%g7,	0x0B71,	%g3
	lduw	[%l7 + 0x30],	%l5
	udivcc	%g5,	0x1307,	%o6
	edge8l	%g2,	%o4,	%i3
	popc	0x1FB9,	%i7
	ld	[%l7 + 0x74],	%f14
	fmovdpos	%xcc,	%f9,	%f13
	ldd	[%l7 + 0x28],	%i0
	st	%f10,	[%l7 + 0x4C]
	std	%f8,	[%l7 + 0x58]
	ldub	[%l7 + 0x4F],	%o1
	edge32n	%g6,	%o5,	%l1
	edge16ln	%l3,	%g1,	%o2
	movrlz	%o3,	%i4,	%l0
	fpadd32	%f0,	%f2,	%f0
	xnor	%i2,	%l4,	%i5
	save %o7, %i6, %l2
	sub	%i1,	%g4,	%o0
	subccc	%g7,	0x10D7,	%l6
	udivcc	%g3,	0x1A4F,	%l5
	srax	%g5,	0x19,	%o6
	srlx	%g2,	0x10,	%i3
	edge16	%o4,	%i0,	%o1
	movrgez	%i7,	0x335,	%o5
	addcc	%g6,	0x106D,	%l1
	fnegs	%f5,	%f12
	movneg	%icc,	%l3,	%g1
	fmovscs	%xcc,	%f8,	%f3
	fcmps	%fcc0,	%f1,	%f15
	fnegd	%f4,	%f8
	movrgez	%o2,	0x1F1,	%i4
	movre	%l0,	%i2,	%l4
	sub	%o3,	%o7,	%i6
	popc	%l2,	%i1
	movrlez	%i5,	%g4,	%g7
	fzeros	%f12
	andn	%l6,	0x0FC7,	%o0
	smulcc	%l5,	0x0C5D,	%g3
	edge32ln	%g5,	%g2,	%i3
	fxnor	%f6,	%f14,	%f0
	movvs	%icc,	%o4,	%o6
	fmovsge	%icc,	%f10,	%f10
	fornot1s	%f10,	%f9,	%f13
	movrlz	%i0,	%o1,	%o5
	xnor	%g6,	0x13EC,	%l1
	movpos	%xcc,	%l3,	%g1
	ldub	[%l7 + 0x51],	%i7
	mulx	%i4,	0x1A76,	%o2
	xnorcc	%l0,	%l4,	%o3
	fnot1	%f14,	%f6
	sethi	0x17FB,	%o7
	subc	%i2,	0x09FA,	%l2
	fabsd	%f4,	%f6
	fandnot2s	%f5,	%f11,	%f4
	subcc	%i1,	0x043C,	%i5
	array32	%i6,	%g4,	%g7
	edge32n	%l6,	%l5,	%g3
	fmul8sux16	%f4,	%f14,	%f4
	restore %o0, %g5, %i3
	save %o4, 0x0697, %g2
	movrgez	%o6,	%o1,	%i0
	movg	%xcc,	%g6,	%l1
	edge32n	%l3,	%g1,	%o5
	xnor	%i7,	%i4,	%o2
	lduh	[%l7 + 0x22],	%l4
	sub	%l0,	0x08C1,	%o7
	edge16	%i2,	%l2,	%o3
	st	%f0,	[%l7 + 0x54]
	mulscc	%i5,	0x0A8A,	%i6
	addccc	%g4,	%g7,	%i1
	movrgz	%l5,	%g3,	%l6
	edge16l	%o0,	%i3,	%o4
	sllx	%g2,	0x16,	%g5
	udivcc	%o1,	0x11DF,	%o6
	st	%f15,	[%l7 + 0x54]
	movrgez	%g6,	%i0,	%l1
	array16	%l3,	%g1,	%o5
	movrgz	%i4,	%i7,	%l4
	ldx	[%l7 + 0x68],	%l0
	xnorcc	%o2,	%i2,	%l2
	edge16	%o7,	%i5,	%i6
	fpack32	%f2,	%f10,	%f10
	lduh	[%l7 + 0x56],	%g4
	fmovscs	%icc,	%f1,	%f6
	edge32l	%o3,	%i1,	%g7
	bshuffle	%f0,	%f14,	%f4
	movrgez	%g3,	%l5,	%l6
	edge32n	%o0,	%o4,	%g2
	edge32n	%g5,	%o1,	%o6
	xor	%i3,	0x0F14,	%g6
	fsrc2s	%f8,	%f14
	fnand	%f6,	%f4,	%f4
	and	%i0,	0x019A,	%l1
	fmovdle	%icc,	%f3,	%f15
	movne	%xcc,	%l3,	%o5
	movrlz	%g1,	0x0EE,	%i7
	subccc	%l4,	%i4,	%o2
	fones	%f10
	ldub	[%l7 + 0x28],	%l0
	orncc	%l2,	0x1640,	%o7
	andn	%i5,	%i6,	%i2
	sdivx	%g4,	0x15EF,	%i1
	fmul8x16	%f14,	%f12,	%f4
	ldsh	[%l7 + 0x7C],	%o3
	sllx	%g3,	0x13,	%l5
	mulscc	%l6,	0x1BC1,	%g7
	srlx	%o0,	0x03,	%g2
	andncc	%g5,	%o4,	%o1
	orncc	%o6,	%g6,	%i3
	fpmerge	%f5,	%f14,	%f0
	movrlez	%l1,	%i0,	%l3
	edge8ln	%g1,	%o5,	%l4
	fmovsneg	%xcc,	%f5,	%f1
	std	%f8,	[%l7 + 0x68]
	fmovdvc	%icc,	%f8,	%f1
	andcc	%i4,	%o2,	%l0
	ldd	[%l7 + 0x08],	%f6
	udivx	%l2,	0x137E,	%o7
	udivcc	%i5,	0x11A9,	%i6
	lduw	[%l7 + 0x60],	%i7
	srl	%g4,	%i1,	%o3
	andcc	%i2,	0x110B,	%g3
	movvc	%icc,	%l5,	%g7
	fpadd32s	%f13,	%f12,	%f13
	xor	%l6,	0x1F51,	%o0
	lduh	[%l7 + 0x6C],	%g5
	array8	%o4,	%g2,	%o1
	sdivcc	%o6,	0x092D,	%g6
	movrlz	%i3,	0x067,	%l1
	fxors	%f9,	%f14,	%f2
	movcs	%icc,	%l3,	%g1
	edge8ln	%i0,	%l4,	%o5
	alignaddr	%i4,	%o2,	%l0
	alignaddrl	%o7,	%i5,	%l2
	sllx	%i6,	%i7,	%g4
	edge8	%o3,	%i2,	%i1
	stb	%g3,	[%l7 + 0x5F]
	sll	%l5,	0x13,	%l6
	movvc	%xcc,	%o0,	%g5
	fcmpgt16	%f2,	%f8,	%o4
	stw	%g2,	[%l7 + 0x48]
	sdivx	%g7,	0x1FCF,	%o6
	array32	%o1,	%i3,	%l1
	fmovsneg	%xcc,	%f14,	%f10
	ldd	[%l7 + 0x40],	%f12
	movre	%l3,	0x356,	%g6
	ldub	[%l7 + 0x57],	%g1
	smulcc	%l4,	0x045A,	%i0
	udivx	%i4,	0x07D5,	%o2
	edge8n	%l0,	%o7,	%o5
	sub	%l2,	%i5,	%i7
	smul	%i6,	%g4,	%o3
	restore %i2, 0x032A, %g3
	ldsw	[%l7 + 0x4C],	%i1
	xor	%l5,	0x01EF,	%o0
	umulcc	%l6,	0x0B20,	%g5
	movleu	%icc,	%g2,	%g7
	edge8n	%o4,	%o1,	%i3
	edge16l	%l1,	%o6,	%g6
	edge16ln	%g1,	%l3,	%i0
	fpack16	%f6,	%f7
	array16	%l4,	%i4,	%l0
	addccc	%o7,	%o5,	%o2
	smulcc	%l2,	0x0251,	%i5
	fsrc2	%f0,	%f0
	array8	%i6,	%g4,	%i7
	subcc	%o3,	%g3,	%i2
	movneg	%xcc,	%l5,	%o0
	edge8n	%i1,	%g5,	%l6
	mova	%xcc,	%g7,	%o4
	sra	%g2,	0x01,	%o1
	fmovdcc	%xcc,	%f11,	%f15
	edge8l	%l1,	%o6,	%i3
	udiv	%g1,	0x04D1,	%g6
	edge16	%i0,	%l4,	%l3
	movg	%icc,	%i4,	%o7
	ld	[%l7 + 0x3C],	%f6
	movpos	%icc,	%l0,	%o2
	movcs	%icc,	%o5,	%i5
	lduw	[%l7 + 0x48],	%l2
	ldsw	[%l7 + 0x40],	%i6
	array16	%i7,	%o3,	%g4
	array32	%g3,	%l5,	%i2
	fmovsa	%xcc,	%f15,	%f5
	fmovrsne	%i1,	%f9,	%f11
	fmuld8ulx16	%f12,	%f2,	%f12
	stx	%o0,	[%l7 + 0x60]
	subccc	%l6,	0x1AE5,	%g5
	movge	%icc,	%g7,	%g2
	edge16l	%o4,	%l1,	%o6
	srax	%i3,	0x0F,	%g1
	udiv	%g6,	0x0763,	%i0
	sdivx	%o1,	0x1FB5,	%l4
	ldsb	[%l7 + 0x77],	%i4
	movrne	%o7,	%l3,	%l0
	ldsw	[%l7 + 0x6C],	%o5
	fandnot2s	%f2,	%f6,	%f11
	stx	%i5,	[%l7 + 0x60]
	sll	%l2,	%o2,	%i6
	add	%i7,	%g4,	%g3
	restore %l5, 0x0088, %i2
	movcc	%xcc,	%o3,	%o0
	smul	%l6,	0x0FF0,	%g5
	mulscc	%g7,	0x0919,	%i1
	movge	%xcc,	%o4,	%g2
	fnot1	%f10,	%f0
	stx	%o6,	[%l7 + 0x48]
	fpsub32s	%f10,	%f11,	%f15
	sdiv	%i3,	0x00B6,	%g1
	array32	%g6,	%i0,	%o1
	sra	%l4,	0x1D,	%i4
	fmovdvc	%icc,	%f6,	%f0
	andcc	%l1,	%l3,	%l0
	array8	%o7,	%o5,	%i5
	edge8l	%o2,	%l2,	%i6
	sllx	%g4,	%g3,	%l5
	mulscc	%i2,	%o3,	%o0
	movcc	%icc,	%l6,	%i7
	alignaddrl	%g7,	%g5,	%o4
	movrne	%g2,	0x141,	%o6
	edge32l	%i1,	%i3,	%g6
	fornot1	%f4,	%f8,	%f0
	srlx	%g1,	%i0,	%l4
	ldd	[%l7 + 0x30],	%f2
	fxnors	%f2,	%f15,	%f5
	edge8ln	%i4,	%l1,	%o1
	sllx	%l0,	0x0D,	%o7
	edge16n	%l3,	%i5,	%o5
	fandnot1s	%f1,	%f1,	%f8
	lduh	[%l7 + 0x58],	%l2
	fcmpeq32	%f6,	%f6,	%i6
	subc	%o2,	%g4,	%g3
	stw	%i2,	[%l7 + 0x3C]
	fnor	%f10,	%f10,	%f10
	array8	%l5,	%o3,	%l6
	mova	%xcc,	%o0,	%g7
	andncc	%g5,	%o4,	%i7
	restore %o6, 0x1B54, %g2
	movvc	%xcc,	%i1,	%g6
	fornot2s	%f2,	%f7,	%f14
	ldsw	[%l7 + 0x70],	%i3
	movge	%icc,	%g1,	%l4
	ld	[%l7 + 0x38],	%f13
	edge16	%i0,	%l1,	%o1
	edge16ln	%l0,	%i4,	%l3
	fmovscc	%icc,	%f8,	%f7
	subc	%i5,	0x0300,	%o5
	array8	%l2,	%i6,	%o7
	ldsw	[%l7 + 0x34],	%o2
	fornot2	%f12,	%f2,	%f12
	and	%g3,	%g4,	%i2
	mova	%xcc,	%o3,	%l6
	fmovdneg	%xcc,	%f5,	%f7
	pdist	%f8,	%f6,	%f2
	fmovsvc	%icc,	%f9,	%f5
	movrlz	%l5,	%g7,	%o0
	move	%xcc,	%o4,	%g5
	pdist	%f12,	%f10,	%f10
	xorcc	%i7,	0x016A,	%o6
	fxnors	%f11,	%f13,	%f7
	fnor	%f0,	%f4,	%f8
	stw	%i1,	[%l7 + 0x28]
	movg	%xcc,	%g6,	%g2
	andn	%g1,	0x1B37,	%l4
	fpadd32s	%f0,	%f1,	%f12
	fmuld8sux16	%f11,	%f14,	%f6
	fmovrsne	%i3,	%f10,	%f8
	orcc	%l1,	0x0BE5,	%i0
	st	%f12,	[%l7 + 0x68]
	sdivcc	%o1,	0x1156,	%l0
	ldsb	[%l7 + 0x3D],	%l3
	subc	%i5,	%o5,	%i4
	srax	%l2,	0x18,	%i6
	movn	%icc,	%o2,	%o7
	fmovrslz	%g4,	%f3,	%f4
	and	%g3,	%o3,	%l6
	ldd	[%l7 + 0x30],	%i2
	sth	%g7,	[%l7 + 0x10]
	movleu	%xcc,	%o0,	%o4
	subc	%l5,	%i7,	%g5
	movneg	%xcc,	%o6,	%g6
	lduh	[%l7 + 0x42],	%g2
	addccc	%i1,	%g1,	%l4
	fornot2	%f2,	%f10,	%f4
	fsrc1s	%f1,	%f5
	edge32	%l1,	%i3,	%i0
	ldsh	[%l7 + 0x50],	%l0
	movvs	%icc,	%o1,	%l3
	movle	%xcc,	%i5,	%o5
	movgu	%icc,	%i4,	%l2
	edge8ln	%o2,	%i6,	%g4
	edge16ln	%o7,	%g3,	%o3
	fmovdgu	%xcc,	%f8,	%f15
	edge32l	%i2,	%l6,	%g7
	stw	%o4,	[%l7 + 0x4C]
	orncc	%l5,	%o0,	%i7
	fmovda	%icc,	%f13,	%f12
	smulcc	%o6,	%g6,	%g2
	fmovdvs	%xcc,	%f7,	%f13
	array8	%g5,	%i1,	%g1
	subc	%l4,	0x1A5E,	%i3
	andn	%l1,	0x1F67,	%i0
	edge8	%o1,	%l0,	%l3
	popc	0x121C,	%i5
	edge16ln	%o5,	%l2,	%i4
	fmovdgu	%xcc,	%f15,	%f7
	fmovrsne	%i6,	%f10,	%f11
	fzeros	%f12
	xor	%g4,	0x074F,	%o2
	movcc	%xcc,	%o7,	%g3
	fcmped	%fcc0,	%f12,	%f8
	fmul8sux16	%f10,	%f8,	%f10
	edge32n	%i2,	%l6,	%o3
	fmovsneg	%xcc,	%f2,	%f4
	fmul8x16au	%f6,	%f11,	%f0
	fnands	%f9,	%f2,	%f4
	add	%o4,	%l5,	%g7
	edge16n	%i7,	%o0,	%g6
	stw	%o6,	[%l7 + 0x1C]
	mova	%icc,	%g5,	%i1
	array16	%g1,	%g2,	%i3
	movcs	%xcc,	%l1,	%i0
	edge32l	%l4,	%l0,	%l3
	edge16	%i5,	%o1,	%l2
	edge8n	%o5,	%i6,	%i4
	ldd	[%l7 + 0x58],	%g4
	fmovdcc	%icc,	%f10,	%f8
	edge16ln	%o2,	%o7,	%i2
	edge8l	%l6,	%o3,	%o4
	sethi	0x127A,	%l5
	ld	[%l7 + 0x58],	%f1
	smulcc	%g3,	0x0C93,	%i7
	fcmple32	%f12,	%f2,	%g7
	movge	%icc,	%o0,	%o6
	edge16	%g5,	%g6,	%g1
	ldsw	[%l7 + 0x48],	%g2
	movpos	%icc,	%i3,	%l1
	fmovrsgz	%i0,	%f8,	%f13
	orn	%i1,	%l4,	%l3
	orn	%i5,	0x08A8,	%o1
	addccc	%l0,	%o5,	%i6
	and	%i4,	0x1935,	%l2
	orn	%g4,	%o7,	%o2
	fcmped	%fcc3,	%f0,	%f6
	array32	%l6,	%i2,	%o4
	srl	%o3,	0x03,	%g3
	sra	%i7,	0x1F,	%g7
	edge16ln	%l5,	%o6,	%g5
	orn	%o0,	%g1,	%g2
	fornot2	%f10,	%f12,	%f2
	fors	%f1,	%f5,	%f15
	fxors	%f5,	%f2,	%f0
	edge16l	%g6,	%l1,	%i0
	fmovsneg	%icc,	%f2,	%f2
	fmovdvs	%icc,	%f1,	%f12
	fcmpgt16	%f4,	%f10,	%i3
	orcc	%i1,	0x0621,	%l3
	srlx	%i5,	%o1,	%l4
	smul	%o5,	0x1AFB,	%l0
	addcc	%i4,	0x1CEB,	%i6
	srl	%l2,	0x09,	%o7
	sra	%g4,	0x1A,	%o2
	movrgz	%i2,	%l6,	%o3
	fmovrde	%o4,	%f12,	%f12
	fmuld8ulx16	%f4,	%f14,	%f12
	array16	%i7,	%g3,	%g7
	subcc	%o6,	%g5,	%l5
	sdiv	%g1,	0x0A30,	%o0
	alignaddrl	%g2,	%g6,	%l1
	movl	%icc,	%i0,	%i3
	fandnot2s	%f11,	%f14,	%f9
	ldd	[%l7 + 0x40],	%i0
	ldsw	[%l7 + 0x64],	%l3
	addcc	%i5,	0x0E6D,	%o1
	std	%f0,	[%l7 + 0x78]
	sll	%o5,	%l0,	%l4
	edge32	%i6,	%l2,	%i4
	movrgez	%g4,	%o7,	%o2
	alignaddr	%l6,	%i2,	%o3
	subccc	%o4,	0x1595,	%g3
	movleu	%xcc,	%i7,	%o6
	xnorcc	%g5,	0x1DDB,	%l5
	stb	%g1,	[%l7 + 0x16]
	edge16l	%o0,	%g2,	%g6
	fmovse	%xcc,	%f1,	%f5
	movrgez	%g7,	%l1,	%i3
	fmul8sux16	%f14,	%f14,	%f10
	fmovdcc	%xcc,	%f8,	%f1
	edge16ln	%i0,	%l3,	%i1
	udivcc	%i5,	0x0218,	%o5
	ldd	[%l7 + 0x38],	%f6
	srl	%o1,	0x19,	%l0
	for	%f8,	%f0,	%f6
	edge8n	%i6,	%l4,	%l2
	srax	%g4,	%i4,	%o7
	alignaddrl	%l6,	%i2,	%o2
	mova	%icc,	%o4,	%g3
	movleu	%xcc,	%i7,	%o3
	ldd	[%l7 + 0x70],	%g4
	fmovscs	%xcc,	%f8,	%f3
	ldsh	[%l7 + 0x6C],	%o6
	xnor	%g1,	%o0,	%g2
	xor	%g6,	0x0E6E,	%g7
	fabsd	%f14,	%f10
	ldsb	[%l7 + 0x22],	%l5
	andcc	%i3,	%i0,	%l3
	xor	%l1,	%i5,	%i1
	stw	%o1,	[%l7 + 0x54]
	save %l0, %o5, %i6
	ldd	[%l7 + 0x40],	%f6
	for	%f2,	%f0,	%f12
	fandnot2s	%f9,	%f8,	%f11
	addccc	%l2,	%g4,	%i4
	sdivcc	%l4,	0x034E,	%o7
	ldd	[%l7 + 0x70],	%i6
	stb	%o2,	[%l7 + 0x69]
	fmovse	%xcc,	%f4,	%f9
	movrgez	%i2,	%o4,	%g3
	stb	%o3,	[%l7 + 0x5C]
	ldd	[%l7 + 0x60],	%f14
	fxors	%f13,	%f4,	%f4
	and	%i7,	%o6,	%g1
	fnands	%f5,	%f12,	%f0
	movleu	%xcc,	%g5,	%g2
	xor	%o0,	0x1584,	%g7
	movcs	%xcc,	%l5,	%i3
	andcc	%i0,	%g6,	%l3
	sra	%l1,	%i5,	%o1
	movrgz	%l0,	0x260,	%i1
	edge16	%o5,	%i6,	%g4
	movvs	%icc,	%i4,	%l4
	fmul8x16al	%f1,	%f1,	%f2
	sethi	0x1E3F,	%l2
	movleu	%xcc,	%o7,	%l6
	fmovsvc	%icc,	%f1,	%f1
	edge32ln	%o2,	%o4,	%i2
	movgu	%xcc,	%o3,	%i7
	movrlz	%g3,	%g1,	%o6
	fmovdvc	%xcc,	%f11,	%f4
	movge	%xcc,	%g2,	%g5
	and	%g7,	%o0,	%i3
	fmovdvs	%xcc,	%f15,	%f4
	srl	%l5,	%g6,	%l3
	fnot1	%f2,	%f10
	ldsb	[%l7 + 0x11],	%l1
	edge8	%i0,	%i5,	%l0
	ldsh	[%l7 + 0x0C],	%i1
	sth	%o5,	[%l7 + 0x40]
	movleu	%icc,	%i6,	%g4
	xorcc	%i4,	0x095E,	%l4
	for	%f2,	%f4,	%f2
	edge32ln	%o1,	%o7,	%l6
	fmovda	%icc,	%f1,	%f5
	movleu	%icc,	%o2,	%o4
	ldsw	[%l7 + 0x5C],	%l2
	fpack32	%f12,	%f6,	%f6
	sllx	%o3,	0x10,	%i2
	fones	%f12
	fmovrslez	%i7,	%f15,	%f2
	array16	%g3,	%o6,	%g2
	or	%g5,	0x059C,	%g1
	subc	%o0,	0x178D,	%i3
	fmovdleu	%xcc,	%f1,	%f13
	sdivx	%g7,	0x00CF,	%l5
	edge8n	%l3,	%l1,	%g6
	umul	%i5,	%l0,	%i0
	or	%o5,	0x06B8,	%i1
	fabsd	%f6,	%f8
	udiv	%i6,	0x0ECC,	%g4
	srlx	%i4,	0x11,	%l4
	ldsw	[%l7 + 0x28],	%o1
	xorcc	%o7,	0x1D0C,	%l6
	fmovdleu	%xcc,	%f2,	%f15
	movn	%icc,	%o2,	%o4
	movrlz	%l2,	%o3,	%i2
	xnor	%i7,	%g3,	%g2
	movrlz	%o6,	0x3D9,	%g1
	movn	%icc,	%o0,	%g5
	srax	%i3,	0x05,	%l5
	alignaddrl	%l3,	%l1,	%g7
	movl	%xcc,	%i5,	%g6
	subccc	%l0,	%o5,	%i0
	popc	%i1,	%i6
	orn	%g4,	0x1B2C,	%l4
	movrgz	%i4,	%o1,	%o7
	umulcc	%l6,	%o2,	%l2
	mulscc	%o4,	%i2,	%i7
	alignaddrl	%o3,	%g3,	%o6
	popc	%g1,	%o0
	fmul8x16al	%f5,	%f12,	%f12
	mulscc	%g5,	0x01EA,	%g2
	array16	%l5,	%l3,	%i3
	save %g7, 0x0E72, %l1
	fmovsgu	%xcc,	%f6,	%f14
	andncc	%i5,	%g6,	%l0
	fmovdvs	%xcc,	%f12,	%f6
	edge8	%o5,	%i0,	%i1
	fsrc2s	%f12,	%f11
	edge32n	%g4,	%i6,	%i4
	fmovdg	%xcc,	%f1,	%f7
	addc	%o1,	0x1464,	%l4
	edge32	%o7,	%l6,	%l2
	fmovsg	%icc,	%f3,	%f10
	fmul8sux16	%f14,	%f14,	%f14
	ldub	[%l7 + 0x76],	%o4
	fmovrde	%o2,	%f6,	%f10
	smulcc	%i7,	%i2,	%o3
	fcmpes	%fcc2,	%f12,	%f0
	lduw	[%l7 + 0x0C],	%o6
	xorcc	%g3,	%o0,	%g1
	fcmped	%fcc2,	%f8,	%f8
	ldsw	[%l7 + 0x18],	%g5
	sra	%g2,	%l5,	%l3
	fcmpd	%fcc1,	%f14,	%f6
	ldsb	[%l7 + 0x21],	%i3
	fnot1s	%f7,	%f12
	movne	%xcc,	%g7,	%i5
	xnor	%l1,	%g6,	%l0
	fxnor	%f10,	%f4,	%f0
	fpadd32	%f8,	%f8,	%f10
	or	%o5,	%i0,	%i1
	st	%f15,	[%l7 + 0x4C]
	xorcc	%g4,	0x1E9F,	%i4
	fmovsn	%icc,	%f1,	%f2
	addcc	%o1,	%l4,	%i6
	add	%o7,	0x0F97,	%l2
	fmuld8ulx16	%f2,	%f7,	%f2
	edge32l	%l6,	%o4,	%o2
	orcc	%i7,	%i2,	%o3
	fpadd32	%f0,	%f6,	%f0
	sllx	%o6,	%o0,	%g1
	movn	%xcc,	%g3,	%g2
	movrlez	%l5,	0x14E,	%g5
	subc	%i3,	0x1585,	%l3
	save %i5, 0x1663, %l1
	fmul8ulx16	%f6,	%f0,	%f12
	movleu	%icc,	%g7,	%l0
	lduh	[%l7 + 0x44],	%g6
	fandnot1	%f4,	%f4,	%f14
	fands	%f4,	%f7,	%f15
	edge32l	%i0,	%i1,	%g4
	edge16l	%i4,	%o1,	%l4
	fpadd32	%f14,	%f12,	%f4
	edge8	%i6,	%o7,	%l2
	pdist	%f6,	%f4,	%f6
	movn	%icc,	%l6,	%o5
	fmovde	%xcc,	%f6,	%f6
	edge8n	%o2,	%i7,	%i2
	fmovdge	%icc,	%f1,	%f15
	orn	%o4,	0x03DE,	%o6
	andn	%o3,	0x18C6,	%g1
	movle	%icc,	%o0,	%g2
	umul	%g3,	0x1262,	%l5
	movgu	%xcc,	%g5,	%l3
	movleu	%xcc,	%i3,	%i5
	stw	%l1,	[%l7 + 0x60]
	fmovdvs	%xcc,	%f14,	%f6
	ldd	[%l7 + 0x68],	%f10
	xnorcc	%g7,	0x0C2C,	%g6
	movge	%xcc,	%l0,	%i0
	movcs	%xcc,	%i1,	%g4
	edge32l	%i4,	%o1,	%i6
	ldd	[%l7 + 0x60],	%o6
	array16	%l4,	%l6,	%o5
	sdivx	%l2,	0x15D7,	%o2
	fcmple16	%f12,	%f14,	%i7
	ldsb	[%l7 + 0x1A],	%o4
	subccc	%o6,	%i2,	%o3
	edge16ln	%o0,	%g2,	%g1
	mova	%xcc,	%g3,	%l5
	fand	%f8,	%f6,	%f10
	edge8n	%l3,	%g5,	%i5
	lduh	[%l7 + 0x72],	%i3
	fornot1s	%f0,	%f11,	%f6
	srlx	%l1,	0x08,	%g6
	fcmpeq16	%f4,	%f8,	%g7
	umul	%l0,	%i0,	%g4
	fand	%f10,	%f2,	%f12
	movle	%xcc,	%i4,	%i1
	xor	%o1,	0x1EE1,	%i6
	sllx	%o7,	0x15,	%l6
	fmovrsne	%o5,	%f11,	%f11
	move	%xcc,	%l2,	%o2
	ldd	[%l7 + 0x60],	%i6
	ld	[%l7 + 0x50],	%f1
	movpos	%icc,	%o4,	%l4
	move	%xcc,	%i2,	%o3
	stx	%o6,	[%l7 + 0x28]
	restore %g2, 0x0FD9, %o0
	addcc	%g1,	%g3,	%l5
	alignaddrl	%g5,	%l3,	%i3
	mulscc	%i5,	0x084E,	%l1
	sll	%g7,	0x01,	%g6
	edge16l	%l0,	%i0,	%g4
	sdiv	%i1,	0x0DAB,	%i4
	popc	0x1781,	%i6
	stw	%o7,	[%l7 + 0x30]
	addcc	%o1,	%l6,	%l2
	fmovdpos	%xcc,	%f9,	%f14
	mova	%icc,	%o5,	%o2
	movge	%xcc,	%i7,	%o4
	lduw	[%l7 + 0x18],	%i2
	ldx	[%l7 + 0x20],	%o3
	lduh	[%l7 + 0x4E],	%l4
	ldd	[%l7 + 0x48],	%o6
	movrne	%g2,	%g1,	%o0
	mulx	%l5,	%g5,	%l3
	andn	%i3,	0x0447,	%i5
	fandnot2	%f8,	%f12,	%f2
	mulx	%l1,	%g3,	%g7
	fnands	%f13,	%f6,	%f10
	fpsub16	%f12,	%f8,	%f0
	fmovdn	%xcc,	%f9,	%f1
	movg	%xcc,	%l0,	%g6
	fmovrdlz	%i0,	%f6,	%f0
	sllx	%g4,	0x19,	%i4
	umul	%i1,	0x12BE,	%o7
	sra	%o1,	0x16,	%i6
	edge16ln	%l6,	%l2,	%o2
	lduh	[%l7 + 0x1C],	%o5
	fmovdcc	%xcc,	%f3,	%f6
	sra	%o4,	%i2,	%i7
	srlx	%o3,	%l4,	%g2
	fcmpne32	%f8,	%f4,	%g1
	movl	%xcc,	%o0,	%l5
	ldub	[%l7 + 0x70],	%o6
	udivcc	%g5,	0x09DF,	%l3
	movne	%icc,	%i5,	%i3
	udivx	%l1,	0x1D20,	%g7
	and	%g3,	%l0,	%i0
	ldsh	[%l7 + 0x26],	%g4
	edge8ln	%g6,	%i1,	%o7
	fandnot1s	%f6,	%f6,	%f15
	movre	%i4,	%i6,	%l6
	and	%o1,	0x11E7,	%l2
	movrgz	%o2,	0x2D8,	%o5
	movgu	%xcc,	%i2,	%o4
	movge	%xcc,	%i7,	%o3
	movrne	%l4,	0x21B,	%g2
	movrne	%o0,	%g1,	%l5
	xorcc	%o6,	0x1CFA,	%l3
	lduh	[%l7 + 0x4E],	%i5
	movne	%xcc,	%i3,	%l1
	edge8l	%g7,	%g3,	%g5
	lduh	[%l7 + 0x78],	%l0
	lduh	[%l7 + 0x70],	%g4
	subccc	%i0,	0x02B6,	%g6
	fsrc2	%f2,	%f0
	udiv	%i1,	0x0BDE,	%o7
	fmovsg	%icc,	%f10,	%f4
	fmovdcc	%icc,	%f2,	%f11
	ldsw	[%l7 + 0x3C],	%i6
	umulcc	%l6,	0x1F20,	%o1
	restore %l2, %i4, %o5
	alignaddrl	%o2,	%o4,	%i7
	fmuld8sux16	%f13,	%f5,	%f12
	movrlz	%o3,	%l4,	%g2
	ld	[%l7 + 0x6C],	%f12
	fnors	%f5,	%f12,	%f14
	ldsw	[%l7 + 0x3C],	%o0
	fmovsvs	%xcc,	%f0,	%f2
	fsrc1s	%f6,	%f9
	fmovrde	%g1,	%f0,	%f12
	fornot2s	%f15,	%f11,	%f0
	std	%f10,	[%l7 + 0x28]
	for	%f14,	%f8,	%f10
	movg	%xcc,	%l5,	%o6
	movne	%xcc,	%i2,	%i5
	srax	%l3,	%l1,	%g7
	movrgz	%i3,	%g3,	%g5
	addcc	%l0,	0x1186,	%i0
	ldx	[%l7 + 0x50],	%g6
	sdivx	%g4,	0x16C6,	%i1
	edge8	%o7,	%l6,	%i6
	add	%l2,	%i4,	%o1
	and	%o2,	%o4,	%o5
	fandnot2s	%f5,	%f5,	%f10
	fmovsge	%icc,	%f0,	%f12
	array32	%o3,	%i7,	%l4
	movleu	%xcc,	%g2,	%o0
	movn	%icc,	%g1,	%l5
	fpadd16s	%f4,	%f10,	%f7
	movvs	%xcc,	%o6,	%i2
	fcmpgt32	%f10,	%f10,	%i5
	fmul8sux16	%f14,	%f6,	%f12
	restore %l1, %l3, %g7
	alignaddrl	%g3,	%g5,	%i3
	sra	%l0,	0x03,	%i0
	st	%f1,	[%l7 + 0x0C]
	stw	%g4,	[%l7 + 0x0C]
	ldd	[%l7 + 0x60],	%g6
	ldx	[%l7 + 0x48],	%o7
	array16	%i1,	%i6,	%l6
	movcc	%xcc,	%l2,	%o1
	sll	%i4,	%o2,	%o5
	edge8ln	%o3,	%i7,	%l4
	udiv	%o4,	0x0CBB,	%o0
	umulcc	%g1,	%g2,	%l5
	subcc	%o6,	%i5,	%l1
	fmovsleu	%icc,	%f7,	%f13
	sdivx	%l3,	0x1411,	%g7
	edge16ln	%g3,	%g5,	%i2
	lduw	[%l7 + 0x44],	%i3
	fmovscc	%xcc,	%f5,	%f3
	sth	%l0,	[%l7 + 0x7A]
	edge32l	%i0,	%g6,	%o7
	array32	%g4,	%i1,	%i6
	ldsb	[%l7 + 0x0F],	%l2
	std	%f0,	[%l7 + 0x20]
	edge8n	%o1,	%l6,	%i4
	umulcc	%o5,	%o3,	%i7
	or	%l4,	0x0FB6,	%o4
	movcc	%xcc,	%o2,	%g1
	fpackfix	%f12,	%f10
	orncc	%g2,	0x07B0,	%o0
	edge16l	%o6,	%l5,	%l1
	ldsw	[%l7 + 0x60],	%l3
	fmul8x16au	%f9,	%f11,	%f4
	fmuld8sux16	%f4,	%f0,	%f0
	sdivx	%i5,	0x1928,	%g7
	movn	%xcc,	%g5,	%i2
	fmovsa	%xcc,	%f10,	%f5
	xor	%i3,	0x0A52,	%l0
	xorcc	%g3,	0x14D0,	%g6
	movrlz	%o7,	%i0,	%g4
	umulcc	%i6,	0x0B65,	%i1
	subccc	%l2,	%o1,	%i4
	stx	%l6,	[%l7 + 0x18]
	ldd	[%l7 + 0x50],	%f6
	sethi	0x0CF5,	%o3
	udivcc	%o5,	0x12A3,	%i7
	movrlz	%l4,	0x3D0,	%o2
	fandnot2	%f14,	%f2,	%f8
	mulx	%o4,	0x18CF,	%g2
	edge16	%g1,	%o0,	%o6
	ldd	[%l7 + 0x58],	%l0
	movvs	%icc,	%l3,	%l5
	movcc	%icc,	%g7,	%g5
	movrlz	%i5,	%i2,	%l0
	add	%i3,	%g6,	%g3
	ldx	[%l7 + 0x78],	%i0
	movne	%icc,	%g4,	%i6
	fmovsg	%icc,	%f15,	%f10
	srax	%o7,	%i1,	%l2
	movgu	%icc,	%o1,	%i4
	save %l6, 0x1480, %o3
	st	%f15,	[%l7 + 0x68]
	edge16ln	%o5,	%l4,	%o2
	stx	%i7,	[%l7 + 0x30]
	fmovda	%xcc,	%f3,	%f13
	subcc	%g2,	0x03EA,	%o4
	mulx	%g1,	0x0899,	%o6
	ldx	[%l7 + 0x08],	%o0
	sethi	0x01F1,	%l3
	fmovdne	%icc,	%f5,	%f5
	udiv	%l1,	0x0A73,	%g7
	smul	%l5,	%g5,	%i5
	fnegs	%f8,	%f14
	udivx	%l0,	0x19A6,	%i3
	movrgez	%i2,	0x2D2,	%g3
	fmovsn	%xcc,	%f5,	%f10
	addcc	%i0,	%g4,	%i6
	fmovdcs	%xcc,	%f14,	%f9
	ldub	[%l7 + 0x77],	%g6
	sllx	%i1,	0x05,	%l2
	lduh	[%l7 + 0x76],	%o1
	movl	%icc,	%i4,	%o7
	movgu	%xcc,	%l6,	%o3
	add	%o5,	0x08DE,	%o2
	xnor	%i7,	0x0DF0,	%l4
	fornot1s	%f1,	%f15,	%f12
	fands	%f13,	%f3,	%f8
	movrlz	%o4,	0x00D,	%g1
	fmovsl	%xcc,	%f9,	%f13
	movrlz	%g2,	%o0,	%l3
	edge16l	%l1,	%g7,	%l5
	ld	[%l7 + 0x58],	%f7
	fmovdle	%icc,	%f9,	%f8
	movvs	%icc,	%o6,	%g5
	fmovsgu	%icc,	%f12,	%f4
	stw	%i5,	[%l7 + 0x64]
	srax	%i3,	%l0,	%g3
	movrgez	%i2,	0x3F3,	%i0
	st	%f4,	[%l7 + 0x68]
	udivcc	%g4,	0x0319,	%g6
	fmovsn	%xcc,	%f6,	%f9
	sub	%i1,	%i6,	%l2
	addc	%i4,	%o7,	%o1
	addc	%o3,	0x0BF5,	%l6
	fmovdle	%icc,	%f11,	%f0
	edge8	%o5,	%o2,	%i7
	fnegs	%f5,	%f2
	fpsub32s	%f6,	%f10,	%f8
	fmovdl	%icc,	%f14,	%f7
	fmovdleu	%xcc,	%f3,	%f3
	movvs	%xcc,	%o4,	%g1
	fcmpd	%fcc2,	%f12,	%f10
	movn	%xcc,	%l4,	%o0
	lduh	[%l7 + 0x48],	%l3
	subccc	%l1,	%g7,	%g2
	ldsh	[%l7 + 0x7A],	%l5
	srax	%o6,	0x00,	%g5
	srax	%i5,	%l0,	%g3
	array32	%i3,	%i0,	%g4
	fzeros	%f7
	std	%f14,	[%l7 + 0x38]
	fmovscs	%icc,	%f5,	%f12
	andcc	%i2,	%i1,	%g6
	movvc	%icc,	%l2,	%i6
	fmovrdlz	%o7,	%f14,	%f8
	edge16n	%o1,	%o3,	%i4
	addccc	%o5,	0x0C49,	%l6
	edge8ln	%o2,	%i7,	%g1
	umul	%o4,	0x1529,	%l4
	save %o0, %l3, %g7
	edge32n	%g2,	%l5,	%o6
	ldsb	[%l7 + 0x79],	%g5
	subc	%l1,	%i5,	%g3
	edge8n	%l0,	%i3,	%i0
	movrlez	%i2,	%g4,	%g6
	ldd	[%l7 + 0x20],	%f14
	stw	%l2,	[%l7 + 0x48]
	fmovdcs	%xcc,	%f13,	%f15
	movcc	%icc,	%i6,	%i1
	movleu	%xcc,	%o7,	%o1
	fcmpgt32	%f10,	%f0,	%o3
	fmul8x16al	%f8,	%f12,	%f4
	subcc	%i4,	%o5,	%l6
	edge8l	%i7,	%o2,	%g1
	fnor	%f8,	%f10,	%f14
	fmovrdgz	%o4,	%f2,	%f4
	srax	%l4,	0x0D,	%o0
	srl	%g7,	%l3,	%l5
	fmovrsne	%o6,	%f10,	%f8
	edge8n	%g2,	%l1,	%g5
	ldd	[%l7 + 0x20],	%f2
	edge32	%g3,	%l0,	%i3
	movne	%xcc,	%i5,	%i0
	fmovrsgz	%i2,	%f1,	%f8
	srl	%g4,	%l2,	%i6
	sdiv	%i1,	0x146E,	%o7
	sllx	%g6,	%o3,	%o1
	udivx	%i4,	0x006C,	%o5
	fmovde	%xcc,	%f13,	%f11
	edge8n	%i7,	%o2,	%g1
	movl	%icc,	%l6,	%l4
	fnot1s	%f4,	%f0
	fsrc1	%f2,	%f0
	fmovsg	%icc,	%f10,	%f14
	xorcc	%o0,	%g7,	%l3
	edge16	%o4,	%o6,	%g2
	movrlz	%l5,	%g5,	%l1
	xnorcc	%g3,	0x16D5,	%i3
	movvs	%icc,	%l0,	%i0
	udivx	%i2,	0x07F6,	%i5
	srlx	%g4,	0x06,	%l2
	fabss	%f13,	%f11
	xnorcc	%i6,	0x0AF7,	%i1
	subc	%g6,	%o7,	%o3
	edge32n	%o1,	%i4,	%o5
	movvs	%xcc,	%i7,	%g1
	fands	%f3,	%f8,	%f5
	stw	%l6,	[%l7 + 0x48]
	xnor	%l4,	0x0175,	%o0
	umul	%o2,	0x1674,	%l3
	movrgez	%g7,	0x214,	%o4
	fcmpeq32	%f12,	%f4,	%g2
	movvc	%xcc,	%l5,	%g5
	ldsh	[%l7 + 0x30],	%o6
	addc	%g3,	0x1759,	%i3
	xorcc	%l0,	%l1,	%i0
	and	%i2,	0x0D52,	%g4
	srlx	%l2,	%i5,	%i6
	movrlez	%g6,	0x1A6,	%o7
	ldsw	[%l7 + 0x50],	%o3
	fcmpgt16	%f14,	%f8,	%o1
	fcmpeq16	%f8,	%f14,	%i1
	subc	%i4,	0x1A20,	%i7
	orcc	%g1,	0x0505,	%l6
	add	%l4,	%o0,	%o5
	fornot2s	%f8,	%f3,	%f2
	stw	%o2,	[%l7 + 0x24]
	fmovrdlez	%g7,	%f2,	%f14
	addccc	%l3,	%g2,	%l5
	movrgz	%o4,	0x324,	%o6
	movre	%g3,	%i3,	%g5
	sth	%l0,	[%l7 + 0x10]
	xorcc	%l1,	%i2,	%g4
	alignaddr	%i0,	%l2,	%i6
	orn	%g6,	0x07A4,	%o7
	umul	%o3,	0x167E,	%o1
	array16	%i1,	%i4,	%i5
	addccc	%g1,	%i7,	%l4
	fmovrdlz	%l6,	%f14,	%f0
	sethi	0x008B,	%o0
	subccc	%o2,	%o5,	%l3
	smul	%g7,	0x15B8,	%l5
	movleu	%xcc,	%o4,	%g2
	smulcc	%g3,	%o6,	%i3
	fnot1s	%f0,	%f3
	addcc	%g5,	0x0BFE,	%l1
	addccc	%l0,	0x0807,	%i2
	ldd	[%l7 + 0x78],	%g4
	ld	[%l7 + 0x3C],	%f11
	movrne	%l2,	%i0,	%g6
	sethi	0x1FBA,	%o7
	movpos	%xcc,	%o3,	%i6
	orncc	%i1,	0x0046,	%i4
	ldd	[%l7 + 0x70],	%f0
	xorcc	%o1,	0x1B7C,	%i5
	subc	%i7,	0x0BE7,	%g1
	stx	%l6,	[%l7 + 0x50]
	move	%xcc,	%o0,	%l4
	lduh	[%l7 + 0x20],	%o2
	addc	%o5,	%l3,	%g7
	edge8n	%l5,	%g2,	%o4
	edge32ln	%o6,	%i3,	%g5
	movne	%xcc,	%g3,	%l1
	st	%f12,	[%l7 + 0x78]
	lduh	[%l7 + 0x48],	%l0
	edge32l	%g4,	%i2,	%i0
	popc	%l2,	%o7
	addccc	%g6,	0x1C0E,	%i6
	fmul8sux16	%f0,	%f2,	%f14
	srax	%o3,	0x18,	%i4
	fcmple32	%f4,	%f4,	%i1
	fmovdneg	%xcc,	%f11,	%f2
	ldsh	[%l7 + 0x56],	%i5
	edge8ln	%i7,	%g1,	%o1
	movneg	%icc,	%l6,	%l4
	edge16ln	%o0,	%o5,	%o2
	movvc	%xcc,	%g7,	%l3
	fmovsg	%icc,	%f4,	%f7
	or	%g2,	0x1951,	%l5
	stb	%o4,	[%l7 + 0x4D]
	ldx	[%l7 + 0x38],	%o6
	movvc	%xcc,	%i3,	%g3
	xor	%l1,	%l0,	%g5
	mulscc	%g4,	%i2,	%l2
	movpos	%xcc,	%o7,	%i0
	ldd	[%l7 + 0x28],	%i6
	fandnot1	%f12,	%f10,	%f10
	subcc	%o3,	0x08D4,	%g6
	fcmple16	%f14,	%f0,	%i4
	subcc	%i5,	0x1F0D,	%i1
	fexpand	%f8,	%f12
	movrgz	%i7,	%o1,	%g1
	orcc	%l4,	0x1436,	%o0
	addc	%o5,	0x0967,	%l6
	or	%o2,	%g7,	%g2
	movle	%xcc,	%l5,	%l3
	lduh	[%l7 + 0x56],	%o6
	movrgez	%o4,	0x0B3,	%i3
	lduh	[%l7 + 0x6A],	%g3
	movrne	%l1,	0x355,	%g5
	edge8n	%g4,	%l0,	%l2
	ldx	[%l7 + 0x58],	%o7
	sdiv	%i0,	0x0FE9,	%i6
	addcc	%i2,	0x1F47,	%g6
	orcc	%i4,	0x10EE,	%o3
	fandnot2s	%f14,	%f2,	%f3
	movl	%xcc,	%i1,	%i7
	ldd	[%l7 + 0x68],	%f0
	udiv	%i5,	0x0AAC,	%g1
	fmovsvc	%xcc,	%f12,	%f13
	fcmple32	%f12,	%f0,	%o1
	movvc	%icc,	%o0,	%l4
	fxnors	%f1,	%f12,	%f4
	fmovsvc	%xcc,	%f6,	%f8
	fcmple16	%f8,	%f0,	%l6
	movre	%o2,	0x2D0,	%o5
	alignaddrl	%g7,	%l5,	%l3
	edge32ln	%g2,	%o6,	%o4
	umul	%i3,	%l1,	%g3
	fmovspos	%xcc,	%f7,	%f10
	movrlz	%g4,	0x1E7,	%g5
	edge8l	%l2,	%l0,	%o7
	fone	%f6
	sth	%i6,	[%l7 + 0x6C]
	udiv	%i0,	0x00DA,	%i2
	orncc	%i4,	%g6,	%o3
	fmovsl	%xcc,	%f6,	%f15
	stb	%i1,	[%l7 + 0x66]
	fmovrse	%i5,	%f0,	%f11
	fsrc2s	%f15,	%f0
	fnors	%f13,	%f15,	%f14
	edge32n	%g1,	%o1,	%i7
	xor	%o0,	0x10A3,	%l6
	xorcc	%l4,	0x1E2C,	%o5
	fmovdleu	%xcc,	%f11,	%f6
	mova	%icc,	%g7,	%o2
	fpsub16	%f8,	%f0,	%f8
	fmovspos	%xcc,	%f9,	%f4
	movleu	%icc,	%l5,	%g2
	fabss	%f1,	%f9
	addcc	%o6,	%o4,	%i3
	restore %l1, 0x1F97, %l3
	fnot1	%f10,	%f6
	ldub	[%l7 + 0x09],	%g4
	subcc	%g5,	%l2,	%l0
	fpackfix	%f14,	%f11
	fpackfix	%f2,	%f15
	orncc	%g3,	%o7,	%i0
	fmul8x16au	%f6,	%f11,	%f6
	udiv	%i2,	0x01BC,	%i6
	sth	%i4,	[%l7 + 0x4C]
	smul	%g6,	0x1891,	%o3
	ld	[%l7 + 0x08],	%f11
	fmovdpos	%xcc,	%f11,	%f7
	fmovdge	%xcc,	%f5,	%f12
	fmovsn	%icc,	%f0,	%f13
	movleu	%xcc,	%i1,	%g1
	srlx	%i5,	0x1E,	%o1
	srl	%i7,	0x0F,	%o0
	ldsh	[%l7 + 0x22],	%l6
	xnorcc	%l4,	%o5,	%g7
	movrgz	%o2,	0x020,	%l5
	st	%f13,	[%l7 + 0x24]
	xnor	%g2,	%o6,	%i3
	fmovsvc	%xcc,	%f11,	%f13
	fcmpd	%fcc1,	%f0,	%f4
	orncc	%l1,	%o4,	%l3
	subc	%g4,	0x1ABB,	%l2
	xorcc	%g5,	%g3,	%o7
	movre	%i0,	%i2,	%l0
	st	%f12,	[%l7 + 0x70]
	and	%i6,	%g6,	%o3
	edge8ln	%i4,	%g1,	%i1
	sdivcc	%i5,	0x03D0,	%o1
	sdivx	%o0,	0x059C,	%l6
	mulscc	%i7,	%o5,	%g7
	fpsub32	%f0,	%f4,	%f0
	andcc	%o2,	%l5,	%g2
	movre	%o6,	%i3,	%l1
	addc	%l4,	%o4,	%l3
	sdivcc	%l2,	0x094C,	%g4
	ldub	[%l7 + 0x4E],	%g5
	fabsd	%f0,	%f0
	addccc	%g3,	0x0755,	%i0
	sllx	%o7,	0x0E,	%l0
	edge32l	%i2,	%g6,	%o3
	movleu	%icc,	%i6,	%g1
	save %i1, 0x1496, %i5
	edge8ln	%i4,	%o1,	%o0
	stw	%l6,	[%l7 + 0x30]
	xnorcc	%i7,	%g7,	%o2
	restore %l5, %o5, %g2
	edge32	%o6,	%i3,	%l4
	fcmped	%fcc1,	%f10,	%f2
	edge32ln	%l1,	%l3,	%l2
	movcc	%xcc,	%g4,	%g5
	xnor	%g3,	0x0A73,	%i0
	orcc	%o4,	0x15DB,	%o7
	udivcc	%l0,	0x1BFB,	%i2
	sethi	0x0D27,	%o3
	sdiv	%g6,	0x0300,	%g1
	movvs	%icc,	%i6,	%i1
	movre	%i4,	%i5,	%o1
	array16	%o0,	%i7,	%l6
	lduw	[%l7 + 0x54],	%g7
	smul	%l5,	0x13EF,	%o5
	andncc	%o2,	%o6,	%i3
	edge8ln	%l4,	%g2,	%l1
	subc	%l2,	0x1272,	%l3
	fsrc1s	%f2,	%f7
	udivx	%g5,	0x1E09,	%g3
	movpos	%xcc,	%g4,	%o4
	fpmerge	%f5,	%f8,	%f4
	edge16n	%o7,	%l0,	%i2
	fcmple32	%f8,	%f0,	%i0
	fcmpgt16	%f0,	%f0,	%g6
	movcs	%icc,	%o3,	%g1
	mova	%xcc,	%i6,	%i1
	fnands	%f10,	%f4,	%f11
	bshuffle	%f6,	%f12,	%f0
	fxnor	%f4,	%f4,	%f8
	andcc	%i5,	0x12E4,	%o1
	fmovrslz	%o0,	%f15,	%f8
	movge	%xcc,	%i4,	%l6
	fornot2	%f8,	%f4,	%f10
	srl	%g7,	0x06,	%i7
	movrne	%l5,	%o5,	%o6
	subcc	%i3,	0x1B7B,	%o2
	andncc	%g2,	%l1,	%l4
	sdivx	%l2,	0x1E28,	%g5
	fmovdvs	%xcc,	%f4,	%f6
	ldsh	[%l7 + 0x38],	%l3
	alignaddrl	%g3,	%o4,	%o7
	fpadd32	%f12,	%f4,	%f6
	subccc	%g4,	%l0,	%i2
	add	%g6,	0x080A,	%i0
	orncc	%o3,	%g1,	%i6
	srax	%i1,	%o1,	%i5
	addcc	%o0,	0x0E21,	%i4
	edge16l	%g7,	%i7,	%l5
	fxnors	%f1,	%f11,	%f13
	fcmple32	%f14,	%f6,	%l6
	srlx	%o6,	0x11,	%i3
	edge16	%o5,	%g2,	%l1
	addccc	%o2,	%l4,	%g5
	xorcc	%l3,	%g3,	%l2
	xnor	%o4,	%g4,	%l0
	fexpand	%f0,	%f6
	fmovsne	%xcc,	%f14,	%f14
	restore %i2, 0x0BDC, %o7
	ldd	[%l7 + 0x38],	%g6
	andcc	%i0,	%o3,	%i6
	save %g1, 0x0FCC, %i1
	xor	%i5,	%o0,	%o1
	sdiv	%i4,	0x05ED,	%g7
	or	%l5,	0x0FFB,	%i7
	movge	%icc,	%l6,	%o6
	movre	%i3,	0x387,	%o5
	sra	%l1,	0x05,	%o2
	movn	%xcc,	%g2,	%g5
	edge32ln	%l3,	%g3,	%l2
	edge8ln	%l4,	%o4,	%l0
	fnands	%f12,	%f13,	%f10
	fmovdne	%icc,	%f14,	%f3
	fcmpne32	%f14,	%f4,	%i2
	movgu	%icc,	%o7,	%g6
	lduh	[%l7 + 0x36],	%g4
	xnorcc	%o3,	%i6,	%i0
	srax	%g1,	0x12,	%i5
	movrne	%i1,	%o1,	%i4
	fors	%f7,	%f1,	%f3
	andncc	%o0,	%l5,	%i7
	alignaddr	%l6,	%o6,	%i3
	fsrc1s	%f1,	%f2
	restore %o5, 0x07D5, %l1
	fnors	%f5,	%f0,	%f15
	udiv	%g7,	0x0052,	%g2
	or	%o2,	0x0617,	%l3
	fxnors	%f13,	%f14,	%f12
	srl	%g5,	%l2,	%g3
	orncc	%o4,	0x03D7,	%l0
	fcmpeq32	%f2,	%f4,	%l4
	ldsw	[%l7 + 0x10],	%i2
	udivcc	%o7,	0x10F5,	%g6
	xnorcc	%o3,	%i6,	%g4
	xnorcc	%i0,	0x02E6,	%g1
	movpos	%icc,	%i1,	%i5
	edge16n	%i4,	%o0,	%o1
	ldsh	[%l7 + 0x3E],	%l5
	movg	%xcc,	%l6,	%o6
	save %i7, %i3, %o5
	fnegs	%f12,	%f15
	movleu	%xcc,	%l1,	%g7
	st	%f7,	[%l7 + 0x24]
	fmovsleu	%icc,	%f6,	%f10
	add	%g2,	%o2,	%l3
	movl	%icc,	%l2,	%g3
	movle	%icc,	%g5,	%l0
	srax	%l4,	%i2,	%o4
	edge32n	%o7,	%g6,	%o3
	fxnor	%f6,	%f14,	%f10
	edge32	%g4,	%i6,	%g1
	add	%i1,	0x077B,	%i5
	edge32n	%i0,	%o0,	%o1
	stx	%i4,	[%l7 + 0x68]
	edge32l	%l5,	%l6,	%i7
	fandnot2s	%f6,	%f5,	%f6
	xnorcc	%i3,	%o6,	%l1
	movcs	%icc,	%g7,	%o5
	movgu	%icc,	%o2,	%l3
	andncc	%g2,	%g3,	%g5
	movcs	%xcc,	%l2,	%l4
	subccc	%l0,	%o4,	%i2
	edge32n	%g6,	%o7,	%g4
	fmovdvs	%xcc,	%f13,	%f1
	stw	%o3,	[%l7 + 0x28]
	movrgz	%g1,	%i6,	%i1
	stx	%i0,	[%l7 + 0x08]
	movvc	%icc,	%o0,	%i5
	smul	%o1,	0x0F60,	%l5
	smul	%i4,	%i7,	%l6
	fcmpne16	%f0,	%f6,	%o6
	fmovsle	%xcc,	%f8,	%f7
	smulcc	%l1,	%i3,	%o5
	sdivcc	%o2,	0x1139,	%g7
	udiv	%g2,	0x11D6,	%l3
	alignaddrl	%g3,	%l2,	%l4
	or	%l0,	%g5,	%o4
	stx	%g6,	[%l7 + 0x28]
	ldd	[%l7 + 0x40],	%f0
	andn	%o7,	0x1428,	%g4
	edge32	%o3,	%i2,	%i6
	srlx	%g1,	%i1,	%o0
	xorcc	%i5,	%i0,	%o1
	subcc	%i4,	0x07A9,	%i7
	mulscc	%l6,	%l5,	%o6
	fones	%f8
	sra	%i3,	0x06,	%o5
	fnegs	%f13,	%f10
	stb	%l1,	[%l7 + 0x5B]
	fmovrdlez	%o2,	%f2,	%f14
	fandnot2	%f0,	%f4,	%f0
	movge	%xcc,	%g7,	%l3
	srl	%g2,	%l2,	%l4
	save %l0, %g5, %o4
	fnot1s	%f1,	%f3
	edge32	%g6,	%o7,	%g4
	st	%f4,	[%l7 + 0x10]
	movneg	%icc,	%o3,	%i2
	subcc	%i6,	%g3,	%g1
	movneg	%xcc,	%o0,	%i5
	movg	%xcc,	%i1,	%o1
	fmovsg	%xcc,	%f9,	%f10
	fmovscs	%xcc,	%f8,	%f6
	fpmerge	%f15,	%f1,	%f6
	movre	%i4,	0x3C9,	%i7
	sethi	0x1EEE,	%i0
	fexpand	%f7,	%f4
	stb	%l6,	[%l7 + 0x37]
	ldd	[%l7 + 0x28],	%f6
	lduh	[%l7 + 0x20],	%o6
	movcs	%icc,	%i3,	%o5
	edge8l	%l1,	%l5,	%o2
	ldub	[%l7 + 0x66],	%g7
	srlx	%l3,	0x16,	%l2
	fmovrdgez	%l4,	%f4,	%f10
	fmovscs	%xcc,	%f11,	%f10
	sll	%g2,	%g5,	%o4
	lduw	[%l7 + 0x68],	%l0
	fxor	%f8,	%f8,	%f2
	andncc	%g6,	%o7,	%g4
	alignaddr	%i2,	%i6,	%g3
	sub	%g1,	%o0,	%i5
	movrne	%o3,	%o1,	%i4
	movre	%i1,	0x25F,	%i0
	sdivx	%l6,	0x1DC3,	%o6
	fornot2	%f14,	%f2,	%f4
	xnorcc	%i3,	%i7,	%l1
	movvs	%xcc,	%l5,	%o5
	movgu	%icc,	%g7,	%o2
	fmovdcs	%xcc,	%f3,	%f8
	fmovsle	%xcc,	%f5,	%f8
	add	%l3,	%l2,	%g2
	xor	%g5,	0x1708,	%o4
	fnand	%f10,	%f2,	%f10
	movrgez	%l0,	0x288,	%l4
	umul	%o7,	%g6,	%i2
	movcs	%xcc,	%g4,	%g3
	stb	%i6,	[%l7 + 0x18]
	subcc	%g1,	0x1924,	%o0
	fcmple16	%f4,	%f0,	%o3
	movvc	%icc,	%o1,	%i4
	edge32n	%i1,	%i0,	%l6
	array8	%i5,	%i3,	%i7
	fmovdgu	%icc,	%f4,	%f5
	xnorcc	%l1,	0x183E,	%o6
	edge32l	%o5,	%g7,	%o2
	fcmpeq16	%f8,	%f8,	%l5
	ldd	[%l7 + 0x30],	%f4
	edge32ln	%l2,	%l3,	%g2
	sdiv	%g5,	0x0C20,	%l0
	movrgez	%l4,	%o4,	%g6
	edge16	%i2,	%g4,	%o7
	ldd	[%l7 + 0x60],	%g2
	andcc	%g1,	%i6,	%o0
	fcmpes	%fcc1,	%f3,	%f14
	fpackfix	%f10,	%f10
	ldsw	[%l7 + 0x28],	%o1
	orn	%i4,	%o3,	%i0
	edge32l	%i1,	%l6,	%i5
	fmovrsgez	%i3,	%f0,	%f4
	orncc	%l1,	%o6,	%o5
	ldd	[%l7 + 0x40],	%i6
	save %g7, 0x1F4E, %l5
	orcc	%l2,	0x00E4,	%o2
	edge16l	%l3,	%g5,	%g2
	edge8n	%l0,	%l4,	%g6
	fnot2	%f2,	%f8
	lduh	[%l7 + 0x56],	%i2
	umul	%g4,	0x1ACE,	%o4
	fmovsg	%xcc,	%f13,	%f7
	fcmpeq16	%f12,	%f10,	%o7
	smulcc	%g3,	%i6,	%g1
	edge16ln	%o0,	%o1,	%o3
	ldd	[%l7 + 0x20],	%f2
	ldsh	[%l7 + 0x6E],	%i4
	stb	%i0,	[%l7 + 0x48]
	stx	%i1,	[%l7 + 0x68]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type f   	: 2175
!	Type i   	: 6396
!	Type l   	: 1429
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x499D786A
.word 0x4D1047E8
.word 0xEC64F53D
.word 0xCE1739F5
.word 0x400BAC42
.word 0x2DA86385
.word 0x10A55022
.word 0x08C7E6DD
.word 0x8B8AA906
.word 0x55FE6F1C
.word 0x69E4D060
.word 0x5A478419
.word 0x48BA677A
.word 0xE1EBB785
.word 0x5A290A8B
.word 0x9D1E8CFA
.word 0x16D0D9A4
.word 0x90559363
.word 0xA6B8B256
.word 0x30FC1D7C
.word 0xBC05F111
.word 0x388526AC
.word 0x6B2FACD4
.word 0x11B50713
.word 0x0E330B53
.word 0xF7B489A9
.word 0x2A9E581B
.word 0xA239B992
.word 0x34127DB0
.word 0x979C715E
.word 0xDCA47D75
.word 0xB5A19D91
.word 0x40877986
.word 0xF520EF94
.word 0x5F166161
.word 0x87578E7C
.word 0x1A62F5A3
.word 0x9E711E34
.word 0x0BA085AF
.word 0xB30B81E8
.word 0xDC447FF1
.word 0x25ED640B
.word 0x68793719
.word 0x26094744
.word 0xCD021FAD
.word 0x89872326
.word 0xE3ADDD0F
.word 0x03A0F0C5
.word 0x9F7307C6
.word 0xB12E0FC7
.word 0x2E63668B
.word 0x95FFC372
.word 0x5A807B37
.word 0x2855063A
.word 0x58620267
.word 0x6AB179A1
.word 0x96ACA5A4
.word 0x73192BF1
.word 0x011AB00F
.word 0x65B0C19F
.word 0x466D7472
.word 0x6D9786EB
.word 0x620AF864
.word 0xE5C1DA17
.end
