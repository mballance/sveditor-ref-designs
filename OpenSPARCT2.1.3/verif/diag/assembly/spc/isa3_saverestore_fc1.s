/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_saverestore_fc1.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ./spc_basic_isa3.pl FOCUS_SEED=339701460"
.ident "BY rg131678 ON Wed Aug  6 18:03:09 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_saverestore_fc1.s,v 1.3 2007/07/05 22:01:52 drp Exp $"
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
	set	0xC,	%g1
	set	0x2,	%g2
	set	0xD,	%g3
	set	0x5,	%g4
	set	0x7,	%g5
	set	0x0,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0xF,	%i1
	set	-0x9,	%i2
	set	-0x2,	%i3
	set	-0x6,	%i4
	set	-0xD,	%i5
	set	-0xF,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x10F241A3,	%l0
	set	0x255DF8E9,	%l1
	set	0x080FE5A1,	%l2
	set	0x0491356F,	%l3
	set	0x5939FA9A,	%l4
	set	0x4A967A7C,	%l5
	set	0x6CC4805F,	%l6
	!# Output registers
	set	0x1A71,	%o0
	set	0x0AEB,	%o1
	set	0x154B,	%o2
	set	-0x1266,	%o3
	set	0x190A,	%o4
	set	-0x0B33,	%o5
	set	0x0150,	%o6
	set	-0x1EAB,	%o7

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

	fmovdne	%icc,	%f6,	%f2
	movcs	%xcc,	%g6,	%i5
	fmovrsgez	%o7,	%f15,	%f2
	or	%o1,	%i7,	%l3
	movgu	%icc,	%o5,	%l0
	fcmpne32	%f2,	%f14,	%g5
	fmovrdlz	%o2,	%f6,	%f6
	fmovsvc	%icc,	%f5,	%f3
	mova	%icc,	%g4,	%i0
	addcc	%g2,	0x1D95,	%i6
	orcc	%l6,	%g7,	%l5
	smulcc	%g1,	%l1,	%g3
	fmovrdlez	%o3,	%f10,	%f0
	fmovsne	%icc,	%f6,	%f8
	lduh	[%l7 + 0x3A],	%o4
	and	%l2,	0x15A2,	%i2
	stb	%i1,	[%l7 + 0x0C]
	fnot2	%f2,	%f12
	sra	%o0,	%i4,	%o6
	fmovdneg	%icc,	%f12,	%f9
	movne	%xcc,	%l4,	%g6
	addcc	%i5,	0x156C,	%o7
	stb	%i3,	[%l7 + 0x74]
	udivx	%i7,	0x11A9,	%l3
	sub	%o5,	%o1,	%l0
	or	%o2,	0x0172,	%g4
	sdivcc	%g5,	0x0989,	%g2
	orn	%i0,	%l6,	%g7
	ldsh	[%l7 + 0x0C],	%l5
	xor	%g1,	0x0A66,	%l1
	andncc	%i6,	%o3,	%o4
	move	%icc,	%l2,	%i2
	movleu	%icc,	%i1,	%o0
	lduh	[%l7 + 0x76],	%i4
	fzeros	%f7
	popc	%o6,	%g3
	stb	%l4,	[%l7 + 0x37]
	edge32l	%i5,	%o7,	%i3
	ld	[%l7 + 0x30],	%f6
	umul	%g6,	%l3,	%i7
	srlx	%o1,	%l0,	%o5
	stw	%o2,	[%l7 + 0x58]
	movrne	%g4,	%g2,	%i0
	fmovrde	%l6,	%f4,	%f2
	fmuld8sux16	%f15,	%f1,	%f0
	alignaddr	%g7,	%l5,	%g1
	ld	[%l7 + 0x14],	%f5
	lduw	[%l7 + 0x1C],	%g5
	fors	%f2,	%f14,	%f10
	sth	%l1,	[%l7 + 0x3A]
	fmovdvs	%icc,	%f14,	%f9
	addcc	%i6,	0x1F6F,	%o4
	fnot2s	%f14,	%f8
	edge16n	%o3,	%i2,	%i1
	ldsh	[%l7 + 0x6A],	%o0
	array16	%i4,	%l2,	%o6
	fmul8x16	%f5,	%f6,	%f12
	edge16	%g3,	%i5,	%o7
	ldsh	[%l7 + 0x3E],	%i3
	subccc	%l4,	0x0E9B,	%l3
	fmovsg	%icc,	%f4,	%f14
	smul	%g6,	0x17E5,	%o1
	xor	%l0,	%o5,	%o2
	popc	%g4,	%g2
	fmuld8sux16	%f9,	%f5,	%f0
	orn	%i0,	%i7,	%l6
	sllx	%g7,	0x17,	%l5
	fmovdvc	%xcc,	%f1,	%f0
	sethi	0x05D1,	%g1
	subcc	%g5,	%l1,	%o4
	edge32n	%i6,	%i2,	%i1
	stx	%o3,	[%l7 + 0x08]
	umulcc	%i4,	%l2,	%o6
	fmovsge	%icc,	%f5,	%f6
	stx	%g3,	[%l7 + 0x28]
	movrlez	%o0,	%o7,	%i5
	addcc	%l4,	0x1FFD,	%l3
	udiv	%i3,	0x0A58,	%g6
	sth	%o1,	[%l7 + 0x12]
	ldd	[%l7 + 0x18],	%f0
	xor	%o5,	%l0,	%g4
	or	%o2,	%g2,	%i7
	movge	%xcc,	%i0,	%g7
	stw	%l6,	[%l7 + 0x1C]
	edge8n	%g1,	%g5,	%l1
	fornot2s	%f3,	%f13,	%f14
	mulscc	%l5,	0x08C7,	%o4
	xor	%i2,	%i1,	%i6
	fmovsg	%icc,	%f5,	%f2
	udiv	%o3,	0x1392,	%i4
	fmovscs	%icc,	%f6,	%f10
	movcs	%xcc,	%l2,	%g3
	edge8l	%o0,	%o6,	%i5
	edge32	%o7,	%l4,	%i3
	fmovscs	%xcc,	%f10,	%f5
	udiv	%l3,	0x11FE,	%g6
	and	%o1,	0x14EA,	%o5
	subcc	%g4,	0x0603,	%l0
	andn	%o2,	%i7,	%i0
	udivx	%g7,	0x069E,	%g2
	mulx	%g1,	%g5,	%l1
	fmovsle	%icc,	%f11,	%f11
	andcc	%l6,	0x02C9,	%o4
	edge16l	%i2,	%i1,	%i6
	andncc	%o3,	%i4,	%l2
	subcc	%g3,	%l5,	%o0
	ldsw	[%l7 + 0x24],	%o6
	fcmpgt16	%f2,	%f0,	%o7
	fsrc1	%f4,	%f6
	andn	%l4,	0x1924,	%i5
	movrgez	%i3,	0x0C8,	%l3
	movpos	%xcc,	%o1,	%g6
	movne	%icc,	%o5,	%g4
	umul	%o2,	0x0C4E,	%i7
	movrne	%i0,	%g7,	%l0
	fmovs	%f13,	%f3
	sdiv	%g1,	0x044A,	%g2
	addcc	%g5,	%l1,	%l6
	sra	%o4,	%i1,	%i6
	stw	%o3,	[%l7 + 0x34]
	movcc	%xcc,	%i2,	%i4
	addc	%g3,	0x12AE,	%l5
	stx	%o0,	[%l7 + 0x18]
	fnot1s	%f9,	%f13
	ldx	[%l7 + 0x30],	%l2
	stw	%o6,	[%l7 + 0x40]
	movge	%icc,	%l4,	%o7
	or	%i5,	%l3,	%i3
	edge8	%g6,	%o5,	%o1
	subc	%o2,	0x1445,	%g4
	edge8l	%i7,	%g7,	%l0
	fmovrsne	%i0,	%f15,	%f7
	stx	%g2,	[%l7 + 0x48]
	move	%xcc,	%g5,	%g1
	andcc	%l6,	0x0188,	%l1
	edge8n	%o4,	%i6,	%o3
	edge8	%i1,	%i2,	%i4
	sethi	0x11C1,	%g3
	movvs	%icc,	%o0,	%l2
	fcmpne32	%f6,	%f14,	%l5
	sllx	%o6,	0x18,	%l4
	fmul8sux16	%f6,	%f10,	%f12
	ldx	[%l7 + 0x60],	%i5
	fandnot2s	%f8,	%f2,	%f5
	movleu	%icc,	%o7,	%l3
	array16	%g6,	%i3,	%o5
	addcc	%o1,	0x105F,	%o2
	sethi	0x0198,	%i7
	sra	%g7,	%l0,	%g4
	srax	%i0,	0x00,	%g5
	fmovspos	%xcc,	%f2,	%f14
	fmovdpos	%xcc,	%f2,	%f2
	smulcc	%g2,	0x1972,	%l6
	or	%g1,	0x1E3D,	%l1
	udivx	%i6,	0x0006,	%o4
	xnor	%o3,	%i2,	%i4
	fnegd	%f4,	%f0
	fsrc1	%f0,	%f0
	fcmpne16	%f10,	%f14,	%i1
	edge8n	%o0,	%l2,	%g3
	stw	%l5,	[%l7 + 0x38]
	lduh	[%l7 + 0x48],	%o6
	orncc	%i5,	%l4,	%l3
	movre	%g6,	0x296,	%o7
	subccc	%i3,	%o1,	%o2
	edge32	%o5,	%g7,	%l0
	orncc	%i7,	0x09C6,	%g4
	fmovscs	%icc,	%f1,	%f8
	movrgz	%g5,	0x28E,	%i0
	movvs	%xcc,	%l6,	%g1
	mulscc	%g2,	%i6,	%l1
	save %o4, %i2, %o3
	mulx	%i4,	%i1,	%o0
	fone	%f12
	movrgez	%l2,	%g3,	%l5
	movle	%xcc,	%i5,	%l4
	save %l3, 0x056B, %o6
	fnor	%f10,	%f2,	%f6
	fmovsg	%xcc,	%f0,	%f12
	movleu	%xcc,	%g6,	%i3
	xor	%o7,	%o2,	%o1
	edge32ln	%o5,	%l0,	%i7
	srl	%g4,	%g5,	%i0
	sra	%l6,	%g7,	%g2
	fpsub16s	%f14,	%f7,	%f9
	ldub	[%l7 + 0x5F],	%i6
	xorcc	%l1,	0x0722,	%o4
	fmul8x16al	%f15,	%f12,	%f8
	fmovscs	%icc,	%f8,	%f0
	ldd	[%l7 + 0x18],	%g0
	fpadd32	%f2,	%f6,	%f2
	lduh	[%l7 + 0x72],	%i2
	movrlz	%o3,	0x288,	%i4
	fmovscc	%xcc,	%f11,	%f12
	edge8ln	%o0,	%l2,	%g3
	st	%f9,	[%l7 + 0x08]
	fone	%f6
	edge16ln	%l5,	%i5,	%i1
	movgu	%xcc,	%l3,	%l4
	edge32ln	%g6,	%o6,	%i3
	move	%xcc,	%o7,	%o1
	ld	[%l7 + 0x58],	%f8
	smul	%o5,	0x1139,	%l0
	edge8l	%o2,	%i7,	%g4
	edge16ln	%i0,	%l6,	%g5
	fornot2s	%f3,	%f10,	%f3
	bshuffle	%f12,	%f10,	%f10
	sll	%g7,	%g2,	%i6
	array8	%l1,	%g1,	%o4
	movrgez	%o3,	%i4,	%i2
	smul	%l2,	%g3,	%o0
	ldsb	[%l7 + 0x0C],	%i5
	sth	%l5,	[%l7 + 0x14]
	xorcc	%i1,	0x1D9A,	%l3
	movne	%xcc,	%g6,	%o6
	sdivx	%i3,	0x1F39,	%l4
	andncc	%o1,	%o5,	%o7
	ldd	[%l7 + 0x08],	%l0
	addccc	%i7,	%o2,	%g4
	sth	%l6,	[%l7 + 0x12]
	umul	%g5,	0x1DD5,	%g7
	udiv	%i0,	0x17F8,	%i6
	array16	%g2,	%l1,	%o4
	addcc	%o3,	%i4,	%g1
	srlx	%l2,	%i2,	%g3
	subc	%o0,	%i5,	%i1
	addccc	%l3,	%l5,	%o6
	ldx	[%l7 + 0x78],	%g6
	sdivx	%l4,	0x00D7,	%o1
	edge16l	%i3,	%o5,	%o7
	edge8ln	%l0,	%o2,	%g4
	movvs	%xcc,	%l6,	%g5
	fpadd16s	%f6,	%f6,	%f12
	fnot2	%f0,	%f12
	udivx	%i7,	0x1CB6,	%g7
	fnand	%f10,	%f2,	%f10
	edge8	%i0,	%g2,	%l1
	subcc	%o4,	0x16EB,	%i6
	edge32	%o3,	%i4,	%g1
	edge8ln	%i2,	%l2,	%o0
	fmovsge	%icc,	%f2,	%f7
	movcs	%xcc,	%i5,	%g3
	xnor	%l3,	0x03E9,	%l5
	movcc	%xcc,	%i1,	%o6
	fmovdle	%icc,	%f4,	%f9
	array32	%g6,	%o1,	%i3
	ld	[%l7 + 0x6C],	%f12
	udiv	%l4,	0x0ED7,	%o7
	fmovspos	%xcc,	%f15,	%f11
	sllx	%o5,	%o2,	%g4
	smulcc	%l6,	0x191E,	%g5
	movg	%icc,	%i7,	%g7
	stx	%l0,	[%l7 + 0x10]
	movg	%icc,	%i0,	%g2
	udivcc	%o4,	0x1DEE,	%l1
	srlx	%i6,	0x08,	%i4
	xnorcc	%o3,	%g1,	%l2
	srax	%i2,	0x0D,	%i5
	array8	%o0,	%g3,	%l5
	andcc	%i1,	%l3,	%g6
	fmovdl	%xcc,	%f13,	%f8
	fnot1s	%f4,	%f12
	fnot1	%f8,	%f8
	movleu	%icc,	%o1,	%o6
	alignaddrl	%l4,	%i3,	%o5
	ldd	[%l7 + 0x50],	%o6
	sth	%g4,	[%l7 + 0x44]
	umulcc	%o2,	%l6,	%g5
	fmovsle	%xcc,	%f9,	%f14
	fmovsg	%icc,	%f0,	%f1
	faligndata	%f6,	%f12,	%f10
	movle	%xcc,	%i7,	%l0
	movn	%xcc,	%i0,	%g7
	std	%f14,	[%l7 + 0x78]
	fmovrse	%o4,	%f15,	%f0
	srlx	%l1,	%g2,	%i4
	xorcc	%o3,	0x0E5F,	%i6
	udivcc	%l2,	0x0EB7,	%g1
	udiv	%i5,	0x0F09,	%o0
	sub	%g3,	0x1C48,	%l5
	edge8l	%i1,	%i2,	%g6
	movrlez	%l3,	%o1,	%o6
	stb	%i3,	[%l7 + 0x56]
	fmovsle	%xcc,	%f1,	%f1
	ld	[%l7 + 0x20],	%f15
	alignaddr	%l4,	%o5,	%g4
	popc	%o2,	%o7
	ld	[%l7 + 0x70],	%f11
	udivcc	%l6,	0x0983,	%i7
	orncc	%l0,	%i0,	%g7
	xorcc	%g5,	%o4,	%l1
	fpadd16s	%f14,	%f6,	%f3
	xorcc	%g2,	%i4,	%i6
	movvs	%icc,	%l2,	%o3
	movg	%xcc,	%i5,	%o0
	ldsb	[%l7 + 0x1B],	%g3
	orncc	%g1,	%i1,	%i2
	fmovdg	%xcc,	%f11,	%f7
	andncc	%g6,	%l3,	%o1
	fsrc1s	%f0,	%f12
	array32	%o6,	%l5,	%i3
	fpadd32	%f0,	%f12,	%f10
	fzero	%f10
	stw	%l4,	[%l7 + 0x14]
	edge32l	%g4,	%o5,	%o2
	alignaddrl	%l6,	%i7,	%o7
	fmovrsgez	%i0,	%f9,	%f11
	addcc	%l0,	%g7,	%g5
	addcc	%o4,	%g2,	%i4
	stx	%i6,	[%l7 + 0x60]
	movrlez	%l1,	%o3,	%l2
	fmovsleu	%xcc,	%f5,	%f15
	fpadd32	%f8,	%f4,	%f0
	addccc	%o0,	0x1410,	%g3
	add	%g1,	0x11AA,	%i5
	array8	%i1,	%g6,	%l3
	save %i2, %o1, %o6
	or	%l5,	0x0DAC,	%i3
	edge32l	%l4,	%o5,	%g4
	mova	%icc,	%l6,	%i7
	xnorcc	%o2,	%i0,	%o7
	xor	%g7,	0x0DFF,	%g5
	fmul8x16al	%f10,	%f2,	%f8
	fone	%f0
	xnorcc	%o4,	0x1993,	%g2
	lduh	[%l7 + 0x74],	%i4
	sub	%l0,	%i6,	%o3
	smulcc	%l1,	%o0,	%l2
	movl	%xcc,	%g1,	%i5
	mova	%icc,	%g3,	%g6
	udivx	%i1,	0x0DA6,	%i2
	movcs	%xcc,	%o1,	%o6
	addc	%l3,	%l5,	%i3
	movre	%l4,	0x291,	%o5
	udiv	%l6,	0x1C77,	%i7
	edge16	%g4,	%i0,	%o2
	mulscc	%o7,	%g7,	%g5
	siam	0x1
	movrgz	%g2,	0x0D7,	%o4
	fmovde	%xcc,	%f4,	%f5
	fzeros	%f15
	movle	%xcc,	%l0,	%i4
	st	%f7,	[%l7 + 0x50]
	subcc	%o3,	0x1D9B,	%i6
	fsrc1s	%f15,	%f10
	fnor	%f4,	%f2,	%f0
	movg	%icc,	%l1,	%o0
	xorcc	%l2,	%g1,	%i5
	xor	%g3,	0x07C4,	%g6
	movrne	%i2,	0x0B9,	%o1
	sub	%i1,	0x0F0F,	%o6
	stw	%l3,	[%l7 + 0x60]
	addc	%i3,	%l5,	%l4
	movg	%icc,	%o5,	%i7
	movle	%icc,	%l6,	%i0
	movrlz	%g4,	0x182,	%o7
	sdivx	%g7,	0x036B,	%g5
	fmovsl	%icc,	%f8,	%f7
	fmovsa	%xcc,	%f9,	%f15
	array8	%o2,	%o4,	%l0
	edge32n	%g2,	%i4,	%o3
	edge32n	%i6,	%l1,	%o0
	array32	%l2,	%i5,	%g1
	popc	%g3,	%i2
	srax	%g6,	%o1,	%i1
	lduw	[%l7 + 0x58],	%o6
	add	%l3,	%l5,	%i3
	sra	%l4,	%i7,	%l6
	movrlz	%o5,	%i0,	%g4
	subcc	%o7,	%g5,	%g7
	fmovdle	%xcc,	%f12,	%f15
	fsrc1s	%f7,	%f4
	popc	0x0222,	%o4
	fnot2s	%f0,	%f0
	subccc	%o2,	%l0,	%g2
	udiv	%o3,	0x121F,	%i6
	movvs	%icc,	%l1,	%i4
	srlx	%l2,	0x04,	%o0
	movrne	%i5,	0x27B,	%g1
	ldub	[%l7 + 0x6B],	%i2
	fmovdcs	%icc,	%f5,	%f3
	movge	%xcc,	%g6,	%g3
	smulcc	%o1,	%i1,	%l3
	ldx	[%l7 + 0x30],	%o6
	sth	%i3,	[%l7 + 0x26]
	fcmpgt32	%f8,	%f4,	%l4
	sdivx	%i7,	0x0088,	%l6
	movrlez	%l5,	%o5,	%i0
	movneg	%icc,	%o7,	%g4
	movrgez	%g7,	0x07F,	%o4
	sethi	0x1DF7,	%o2
	srlx	%g5,	%l0,	%o3
	fmovsle	%icc,	%f4,	%f1
	st	%f1,	[%l7 + 0x14]
	ldx	[%l7 + 0x60],	%g2
	or	%l1,	0x13D3,	%i6
	movge	%xcc,	%i4,	%o0
	addc	%i5,	%l2,	%g1
	fmovsg	%xcc,	%f8,	%f3
	fnors	%f2,	%f10,	%f1
	or	%i2,	%g6,	%o1
	orcc	%i1,	%g3,	%o6
	addcc	%l3,	%i3,	%i7
	move	%icc,	%l4,	%l6
	movl	%icc,	%o5,	%l5
	movre	%o7,	0x3F8,	%g4
	xor	%g7,	%o4,	%o2
	fxors	%f5,	%f14,	%f7
	ldd	[%l7 + 0x48],	%i0
	fnot1	%f14,	%f4
	movre	%g5,	0x014,	%o3
	fandnot1	%f6,	%f6,	%f10
	ldsw	[%l7 + 0x5C],	%g2
	umulcc	%l1,	%i6,	%i4
	mulscc	%l0,	%i5,	%o0
	edge16ln	%g1,	%l2,	%g6
	sllx	%o1,	0x02,	%i1
	fandnot1	%f0,	%f8,	%f4
	fmovse	%icc,	%f2,	%f7
	fmovdleu	%icc,	%f8,	%f2
	edge32n	%i2,	%o6,	%l3
	ldsb	[%l7 + 0x15],	%i3
	save %g3, 0x1574, %l4
	sdivcc	%l6,	0x1BE8,	%i7
	ldsh	[%l7 + 0x30],	%o5
	movcs	%xcc,	%l5,	%o7
	sth	%g4,	[%l7 + 0x36]
	addcc	%o4,	0x07EE,	%g7
	movrgz	%o2,	0x052,	%i0
	srl	%g5,	0x0F,	%g2
	movn	%xcc,	%o3,	%l1
	fmovde	%xcc,	%f4,	%f15
	smul	%i4,	%i6,	%l0
	fones	%f7
	alignaddr	%o0,	%g1,	%i5
	bshuffle	%f6,	%f12,	%f6
	edge16l	%l2,	%o1,	%i1
	movpos	%icc,	%g6,	%i2
	udivcc	%l3,	0x06DD,	%i3
	addccc	%g3,	0x1841,	%l4
	array32	%l6,	%o6,	%i7
	movpos	%xcc,	%l5,	%o5
	umulcc	%o7,	0x1C2D,	%g4
	fnot2s	%f13,	%f6
	subc	%o4,	%g7,	%i0
	orcc	%g5,	0x1E89,	%g2
	stw	%o3,	[%l7 + 0x0C]
	lduh	[%l7 + 0x08],	%l1
	lduh	[%l7 + 0x1E],	%o2
	movne	%icc,	%i6,	%i4
	srax	%o0,	%l0,	%g1
	st	%f5,	[%l7 + 0x1C]
	sdivcc	%i5,	0x16C5,	%l2
	movvs	%xcc,	%o1,	%g6
	movrlz	%i2,	0x3E7,	%i1
	fnot1s	%f5,	%f11
	edge8	%i3,	%l3,	%g3
	movn	%xcc,	%l6,	%o6
	sdivcc	%l4,	0x16B4,	%l5
	sra	%i7,	0x1B,	%o5
	movrgz	%g4,	%o7,	%o4
	edge32n	%i0,	%g5,	%g7
	umul	%o3,	%g2,	%o2
	fmovsleu	%xcc,	%f4,	%f0
	add	%l1,	%i4,	%o0
	movvs	%icc,	%l0,	%i6
	edge32	%i5,	%g1,	%l2
	array32	%o1,	%i2,	%i1
	edge8	%i3,	%g6,	%g3
	stx	%l3,	[%l7 + 0x48]
	addc	%l6,	%l4,	%l5
	bshuffle	%f8,	%f10,	%f0
	movrne	%i7,	0x2F2,	%o6
	save %o5, 0x1711, %g4
	for	%f8,	%f12,	%f14
	sub	%o4,	0x1362,	%i0
	and	%g5,	0x1F9A,	%o7
	udivcc	%o3,	0x1329,	%g7
	restore %o2, %l1, %g2
	movgu	%icc,	%o0,	%l0
	fandnot2	%f8,	%f0,	%f4
	orncc	%i6,	%i4,	%i5
	fmovdvs	%xcc,	%f7,	%f9
	faligndata	%f0,	%f14,	%f6
	add	%l2,	0x112A,	%o1
	addc	%i2,	%i1,	%g1
	umul	%i3,	0x0494,	%g3
	movg	%icc,	%g6,	%l3
	mulx	%l6,	0x0C51,	%l4
	fmuld8ulx16	%f1,	%f5,	%f6
	for	%f6,	%f4,	%f10
	addccc	%i7,	%o6,	%l5
	ldx	[%l7 + 0x18],	%o5
	movneg	%icc,	%g4,	%i0
	movle	%xcc,	%g5,	%o7
	edge8l	%o4,	%g7,	%o3
	fmul8sux16	%f2,	%f10,	%f10
	popc	%l1,	%o2
	srax	%g2,	%o0,	%l0
	edge32l	%i6,	%i4,	%l2
	sra	%i5,	%i2,	%o1
	alignaddr	%i1,	%g1,	%i3
	sub	%g3,	0x1E6F,	%l3
	ldd	[%l7 + 0x20],	%i6
	movrlez	%l4,	0x079,	%i7
	movcs	%xcc,	%o6,	%g6
	fpack32	%f10,	%f8,	%f14
	movcc	%icc,	%o5,	%l5
	orncc	%g4,	%g5,	%i0
	ldsb	[%l7 + 0x0B],	%o7
	save %o4, 0x1B2C, %g7
	ldsb	[%l7 + 0x1C],	%o3
	array8	%l1,	%o2,	%o0
	edge8ln	%l0,	%i6,	%g2
	restore %i4, 0x0EB2, %i5
	movre	%i2,	0x07F,	%o1
	fpadd16s	%f3,	%f9,	%f7
	edge32ln	%l2,	%i1,	%i3
	movrgz	%g3,	%l3,	%l6
	mova	%icc,	%l4,	%i7
	ldsb	[%l7 + 0x62],	%o6
	xorcc	%g6,	0x198D,	%o5
	xnor	%g1,	0x1098,	%l5
	orn	%g5,	%g4,	%o7
	fmovdn	%icc,	%f8,	%f12
	restore %i0, %o4, %o3
	edge8	%g7,	%o2,	%o0
	udivcc	%l0,	0x15A6,	%l1
	fmul8x16	%f10,	%f4,	%f4
	movrne	%i6,	0x0F9,	%i4
	fmovsneg	%xcc,	%f0,	%f11
	movrgez	%g2,	0x349,	%i2
	sdivcc	%o1,	0x110A,	%l2
	fcmpgt16	%f12,	%f14,	%i5
	edge32	%i3,	%i1,	%g3
	array8	%l3,	%l4,	%i7
	andcc	%o6,	0x1096,	%l6
	fmovrsne	%o5,	%f6,	%f1
	sdivcc	%g6,	0x1D3E,	%l5
	movne	%icc,	%g5,	%g4
	stx	%g1,	[%l7 + 0x70]
	array32	%o7,	%i0,	%o3
	fcmple16	%f6,	%f12,	%o4
	fabss	%f9,	%f15
	orn	%g7,	%o2,	%l0
	edge16	%l1,	%o0,	%i4
	fmovrslez	%i6,	%f2,	%f8
	movleu	%icc,	%i2,	%g2
	ldub	[%l7 + 0x26],	%l2
	fcmpne16	%f12,	%f10,	%i5
	fnot2s	%f1,	%f15
	movleu	%icc,	%o1,	%i1
	movre	%i3,	%l3,	%l4
	add	%i7,	0x02A8,	%g3
	or	%o6,	0x0601,	%l6
	edge32	%g6,	%o5,	%g5
	andncc	%l5,	%g4,	%o7
	move	%icc,	%i0,	%o3
	andcc	%o4,	%g1,	%o2
	movcs	%xcc,	%l0,	%g7
	fcmped	%fcc3,	%f2,	%f0
	stw	%o0,	[%l7 + 0x3C]
	fands	%f9,	%f1,	%f10
	fcmpne16	%f8,	%f0,	%l1
	subc	%i4,	%i6,	%i2
	array32	%l2,	%g2,	%i5
	fnor	%f0,	%f12,	%f12
	umul	%i1,	0x0720,	%o1
	sra	%i3,	0x03,	%l4
	fxors	%f15,	%f15,	%f12
	restore %l3, 0x104A, %i7
	andncc	%o6,	%g3,	%l6
	edge8	%g6,	%g5,	%l5
	andn	%g4,	%o7,	%i0
	smul	%o5,	%o3,	%o4
	movle	%icc,	%g1,	%l0
	sub	%g7,	%o0,	%o2
	movrgz	%l1,	0x2E9,	%i4
	edge16ln	%i2,	%i6,	%g2
	movleu	%xcc,	%l2,	%i5
	umulcc	%i1,	%o1,	%l4
	array32	%l3,	%i7,	%i3
	fxor	%f2,	%f8,	%f6
	andn	%g3,	0x1ED3,	%o6
	xorcc	%g6,	%g5,	%l5
	fnot1	%f4,	%f6
	movrgz	%l6,	0x172,	%o7
	andcc	%g4,	0x1F9F,	%i0
	movrlez	%o3,	%o5,	%g1
	fcmped	%fcc1,	%f2,	%f0
	edge8l	%o4,	%l0,	%o0
	edge32l	%g7,	%l1,	%i4
	st	%f4,	[%l7 + 0x40]
	edge32ln	%i2,	%o2,	%i6
	save %g2, %l2, %i5
	movg	%icc,	%i1,	%o1
	st	%f1,	[%l7 + 0x20]
	movcs	%xcc,	%l3,	%i7
	sethi	0x075C,	%i3
	orncc	%l4,	0x1ACE,	%g3
	sth	%g6,	[%l7 + 0x2A]
	movcc	%xcc,	%o6,	%g5
	stb	%l5,	[%l7 + 0x33]
	array8	%l6,	%g4,	%i0
	fpack16	%f8,	%f13
	udiv	%o7,	0x1996,	%o5
	edge8ln	%o3,	%g1,	%l0
	ldsb	[%l7 + 0x1D],	%o0
	udiv	%o4,	0x0D77,	%l1
	movpos	%xcc,	%i4,	%g7
	fmovdcc	%xcc,	%f15,	%f7
	fpmerge	%f5,	%f9,	%f0
	ld	[%l7 + 0x64],	%f6
	edge8	%i2,	%o2,	%g2
	smul	%i6,	0x0D0A,	%i5
	fmovdvs	%xcc,	%f7,	%f12
	mulscc	%i1,	%o1,	%l2
	sdivx	%i7,	0x08D7,	%i3
	edge8n	%l4,	%g3,	%g6
	or	%o6,	%g5,	%l5
	ldd	[%l7 + 0x40],	%i6
	edge16	%l3,	%i0,	%g4
	movle	%icc,	%o5,	%o3
	save %g1, 0x0BA7, %o7
	array16	%o0,	%l0,	%o4
	fcmps	%fcc3,	%f5,	%f0
	edge8n	%i4,	%g7,	%l1
	popc	0x0F4E,	%i2
	move	%xcc,	%o2,	%i6
	ldx	[%l7 + 0x18],	%g2
	movrgez	%i5,	0x32C,	%o1
	ldsw	[%l7 + 0x78],	%i1
	fmovsvs	%xcc,	%f3,	%f8
	udivx	%i7,	0x1984,	%l2
	movrlez	%l4,	0x2B7,	%g3
	mulx	%g6,	%o6,	%i3
	fmovsne	%xcc,	%f4,	%f5
	edge8	%g5,	%l6,	%l5
	orncc	%i0,	0x05B5,	%g4
	alignaddr	%l3,	%o3,	%g1
	sethi	0x13C8,	%o5
	fabss	%f2,	%f6
	edge32l	%o7,	%l0,	%o0
	udivcc	%o4,	0x111E,	%g7
	fpackfix	%f10,	%f14
	xnor	%l1,	0x1C16,	%i2
	edge16ln	%o2,	%i4,	%i6
	st	%f6,	[%l7 + 0x2C]
	save %g2, 0x1C82, %i5
	edge8l	%i1,	%o1,	%i7
	fmovdne	%icc,	%f1,	%f0
	mulx	%l4,	0x0EEC,	%l2
	sth	%g6,	[%l7 + 0x50]
	orn	%o6,	%g3,	%g5
	st	%f6,	[%l7 + 0x68]
	edge16l	%l6,	%l5,	%i3
	fnot1s	%f10,	%f0
	fsrc2s	%f11,	%f9
	orn	%i0,	%l3,	%o3
	lduw	[%l7 + 0x48],	%g4
	fmovd	%f6,	%f4
	fpadd32s	%f4,	%f0,	%f11
	fmovdn	%icc,	%f5,	%f7
	edge8n	%o5,	%o7,	%l0
	movrgez	%o0,	0x29A,	%g1
	movneg	%icc,	%g7,	%l1
	restore %o4, %i2, %o2
	smulcc	%i6,	%g2,	%i5
	sdivx	%i4,	0x057C,	%o1
	sethi	0x1030,	%i7
	udivcc	%l4,	0x1311,	%l2
	fmovdne	%xcc,	%f14,	%f14
	and	%i1,	0x0B34,	%g6
	alignaddr	%o6,	%g3,	%l6
	smulcc	%g5,	0x05AA,	%i3
	bshuffle	%f0,	%f2,	%f12
	edge32l	%i0,	%l5,	%l3
	subc	%g4,	0x00A9,	%o3
	st	%f8,	[%l7 + 0x68]
	fcmpeq32	%f4,	%f14,	%o5
	fpack16	%f8,	%f3
	edge32n	%l0,	%o7,	%o0
	udiv	%g7,	0x1D89,	%g1
	movge	%xcc,	%l1,	%i2
	ldub	[%l7 + 0x39],	%o2
	edge32l	%o4,	%g2,	%i6
	ld	[%l7 + 0x30],	%f9
	edge8	%i5,	%o1,	%i7
	stx	%i4,	[%l7 + 0x78]
	ldub	[%l7 + 0x7F],	%l2
	fmovd	%f8,	%f12
	sdivx	%i1,	0x1885,	%g6
	subcc	%l4,	%g3,	%l6
	movl	%xcc,	%o6,	%g5
	xnorcc	%i0,	%i3,	%l3
	fcmpne32	%f12,	%f12,	%g4
	mulscc	%o3,	0x17AF,	%o5
	smul	%l0,	%o7,	%o0
	movvs	%icc,	%g7,	%g1
	movvs	%icc,	%l1,	%l5
	edge8n	%i2,	%o2,	%g2
	fmovse	%icc,	%f14,	%f4
	xor	%o4,	%i6,	%o1
	andcc	%i5,	0x0399,	%i4
	edge16ln	%i7,	%i1,	%g6
	mulscc	%l4,	%l2,	%l6
	edge32ln	%g3,	%o6,	%g5
	siam	0x5
	orcc	%i0,	0x025C,	%i3
	fpadd32	%f2,	%f14,	%f2
	addccc	%g4,	0x1673,	%o3
	fnot1	%f10,	%f4
	movne	%icc,	%l3,	%o5
	orncc	%l0,	%o0,	%o7
	srl	%g7,	%l1,	%g1
	fmovscs	%xcc,	%f11,	%f5
	movle	%xcc,	%l5,	%i2
	sllx	%o2,	%g2,	%o4
	sdivcc	%i6,	0x12FE,	%i5
	fmovrdlez	%i4,	%f14,	%f8
	movgu	%xcc,	%o1,	%i7
	edge16	%g6,	%l4,	%i1
	edge8l	%l2,	%l6,	%g3
	and	%o6,	0x16FF,	%i0
	edge16l	%i3,	%g4,	%g5
	movrne	%o3,	0x0CB,	%l3
	stb	%l0,	[%l7 + 0x34]
	move	%icc,	%o0,	%o7
	srax	%g7,	%o5,	%g1
	movpos	%xcc,	%l5,	%i2
	fnot1	%f4,	%f10
	ldd	[%l7 + 0x38],	%f0
	fmovrde	%l1,	%f8,	%f0
	edge16ln	%o2,	%g2,	%i6
	and	%o4,	0x06FD,	%i5
	movleu	%icc,	%o1,	%i7
	array16	%i4,	%l4,	%i1
	or	%g6,	0x1749,	%l6
	sub	%l2,	%g3,	%o6
	movvc	%icc,	%i3,	%i0
	save %g4, 0x00AE, %g5
	ldd	[%l7 + 0x18],	%l2
	movrlz	%o3,	%l0,	%o0
	andcc	%o7,	%o5,	%g1
	addc	%g7,	%l5,	%i2
	fpadd16s	%f14,	%f2,	%f15
	fmovsvs	%xcc,	%f14,	%f12
	edge8ln	%o2,	%l1,	%g2
	movle	%icc,	%o4,	%i6
	std	%f2,	[%l7 + 0x60]
	sdivcc	%o1,	0x1E3C,	%i7
	udiv	%i4,	0x1D0A,	%l4
	subcc	%i1,	0x1231,	%i5
	movvs	%icc,	%l6,	%l2
	std	%f12,	[%l7 + 0x18]
	array8	%g3,	%g6,	%o6
	movleu	%icc,	%i3,	%i0
	fmovrdne	%g5,	%f8,	%f12
	ldx	[%l7 + 0x08],	%l3
	subcc	%g4,	0x0872,	%l0
	subc	%o0,	%o3,	%o5
	fandnot2	%f4,	%f10,	%f8
	orncc	%o7,	0x13F9,	%g7
	mulscc	%g1,	%i2,	%l5
	edge16ln	%l1,	%g2,	%o2
	edge32ln	%i6,	%o4,	%i7
	fpsub32s	%f6,	%f13,	%f4
	mulx	%o1,	0x15F4,	%l4
	fmovse	%xcc,	%f7,	%f9
	edge8	%i4,	%i1,	%i5
	movneg	%icc,	%l6,	%l2
	lduh	[%l7 + 0x1C],	%g3
	addc	%o6,	0x0F22,	%i3
	stw	%g6,	[%l7 + 0x2C]
	fmovrse	%i0,	%f10,	%f10
	movge	%icc,	%l3,	%g5
	move	%xcc,	%l0,	%g4
	fnot1s	%f1,	%f12
	lduw	[%l7 + 0x38],	%o3
	fnot2	%f2,	%f14
	smulcc	%o0,	0x157D,	%o7
	movge	%xcc,	%o5,	%g1
	popc	%i2,	%l5
	fmovscc	%icc,	%f2,	%f13
	restore %g7, 0x104E, %l1
	fmovdleu	%icc,	%f5,	%f15
	movvc	%xcc,	%o2,	%i6
	sdivx	%o4,	0x0E30,	%i7
	fones	%f0
	fcmpeq16	%f8,	%f6,	%o1
	save %g2, 0x0659, %i4
	orn	%i1,	%l4,	%i5
	add	%l2,	%g3,	%o6
	ldd	[%l7 + 0x58],	%i6
	movl	%xcc,	%i3,	%g6
	sllx	%i0,	%l3,	%g5
	add	%l0,	%g4,	%o0
	edge16n	%o3,	%o7,	%o5
	orcc	%i2,	%g1,	%g7
	restore %l1, 0x030A, %o2
	fmul8sux16	%f8,	%f14,	%f4
	mova	%xcc,	%i6,	%l5
	ldd	[%l7 + 0x30],	%i6
	movgu	%icc,	%o1,	%o4
	ldub	[%l7 + 0x34],	%i4
	umul	%i1,	%g2,	%i5
	fcmped	%fcc2,	%f2,	%f14
	fmovde	%icc,	%f7,	%f10
	move	%xcc,	%l2,	%g3
	fpackfix	%f4,	%f1
	edge8	%l4,	%l6,	%o6
	siam	0x3
	ldd	[%l7 + 0x70],	%f12
	sth	%g6,	[%l7 + 0x2E]
	orcc	%i0,	%i3,	%g5
	mova	%xcc,	%l3,	%g4
	alignaddr	%l0,	%o3,	%o7
	movrgez	%o0,	%i2,	%g1
	ldsw	[%l7 + 0x44],	%o5
	fnands	%f4,	%f13,	%f1
	sll	%l1,	0x0D,	%o2
	udivcc	%g7,	0x08D2,	%l5
	xor	%i6,	0x06DC,	%o1
	movle	%xcc,	%i7,	%i4
	andcc	%o4,	0x142C,	%i1
	fmovs	%f10,	%f5
	sdivx	%g2,	0x1DDE,	%l2
	std	%f0,	[%l7 + 0x48]
	fands	%f13,	%f13,	%f8
	stw	%i5,	[%l7 + 0x54]
	movn	%xcc,	%g3,	%l4
	alignaddr	%l6,	%o6,	%i0
	bshuffle	%f14,	%f8,	%f4
	edge8	%g6,	%i3,	%g5
	smulcc	%g4,	0x03FF,	%l3
	edge16n	%o3,	%o7,	%o0
	fmovdgu	%icc,	%f11,	%f7
	fandnot1	%f14,	%f0,	%f10
	srax	%l0,	%i2,	%o5
	mulx	%g1,	0x0CFB,	%l1
	edge32n	%g7,	%o2,	%i6
	movcs	%icc,	%l5,	%i7
	move	%icc,	%o1,	%o4
	xnorcc	%i4,	%i1,	%l2
	fand	%f2,	%f8,	%f14
	fabsd	%f2,	%f14
	ldd	[%l7 + 0x60],	%f4
	fpackfix	%f12,	%f12
	add	%g2,	0x13DA,	%g3
	ld	[%l7 + 0x2C],	%f9
	fnors	%f15,	%f0,	%f11
	xorcc	%l4,	%l6,	%o6
	srax	%i5,	%i0,	%g6
	movrlez	%g5,	%g4,	%i3
	fmovrdlz	%l3,	%f8,	%f2
	edge16n	%o3,	%o7,	%o0
	srax	%i2,	%l0,	%g1
	ldsw	[%l7 + 0x7C],	%l1
	fcmpgt32	%f2,	%f2,	%o5
	edge16	%g7,	%o2,	%l5
	addc	%i6,	%o1,	%o4
	sethi	0x1F0A,	%i4
	fors	%f7,	%f5,	%f0
	srax	%i7,	0x0A,	%l2
	fcmpes	%fcc2,	%f4,	%f13
	addc	%i1,	0x0A09,	%g3
	sth	%g2,	[%l7 + 0x22]
	lduh	[%l7 + 0x46],	%l4
	array32	%o6,	%l6,	%i5
	sethi	0x04E3,	%i0
	fandnot2	%f8,	%f10,	%f12
	umul	%g6,	%g5,	%g4
	fmovdne	%icc,	%f3,	%f5
	orcc	%i3,	%l3,	%o7
	fpsub32s	%f4,	%f8,	%f9
	add	%o0,	0x1CC2,	%i2
	array16	%o3,	%g1,	%l1
	array8	%l0,	%g7,	%o2
	fmovdcs	%xcc,	%f3,	%f15
	movrlz	%l5,	0x22F,	%i6
	sra	%o1,	%o5,	%o4
	edge32l	%i4,	%l2,	%i7
	edge16	%g3,	%i1,	%g2
	add	%o6,	0x115D,	%l6
	mova	%icc,	%l4,	%i0
	ldub	[%l7 + 0x73],	%g6
	movre	%i5,	%g4,	%g5
	fnot1	%f6,	%f6
	srl	%l3,	%o7,	%o0
	xnor	%i3,	0x15F2,	%i2
	movre	%o3,	0x390,	%g1
	movn	%xcc,	%l0,	%g7
	sll	%l1,	%o2,	%i6
	fmovsl	%xcc,	%f12,	%f7
	fpackfix	%f12,	%f9
	fnot2	%f6,	%f10
	mulscc	%o1,	0x0BBC,	%l5
	movneg	%icc,	%o4,	%o5
	edge16ln	%l2,	%i7,	%g3
	fcmpgt32	%f8,	%f12,	%i1
	sub	%g2,	%o6,	%i4
	fmovsvs	%xcc,	%f1,	%f14
	fsrc1	%f6,	%f4
	fpack32	%f6,	%f4,	%f8
	ldd	[%l7 + 0x50],	%f2
	movre	%l6,	0x038,	%l4
	sdivcc	%i0,	0x007A,	%g6
	edge32	%i5,	%g5,	%g4
	save %o7, 0x077D, %l3
	movrlez	%o0,	%i3,	%o3
	alignaddr	%g1,	%l0,	%i2
	movrne	%g7,	0x3BE,	%l1
	movrne	%o2,	0x229,	%i6
	orncc	%l5,	%o4,	%o1
	edge8l	%o5,	%i7,	%l2
	movre	%i1,	%g2,	%g3
	xorcc	%o6,	0x0CA8,	%i4
	xor	%l4,	%i0,	%g6
	fmovdneg	%icc,	%f14,	%f14
	alignaddr	%i5,	%g5,	%l6
	movre	%g4,	0x365,	%l3
	sll	%o0,	0x10,	%o7
	edge32l	%i3,	%o3,	%g1
	edge32ln	%l0,	%i2,	%g7
	and	%l1,	0x1C99,	%o2
	movpos	%icc,	%i6,	%o4
	std	%f6,	[%l7 + 0x48]
	orn	%l5,	0x0016,	%o1
	fmovsge	%icc,	%f14,	%f9
	array32	%o5,	%i7,	%i1
	movrgez	%l2,	0x27E,	%g3
	fpadd32s	%f11,	%f2,	%f1
	siam	0x1
	orcc	%o6,	0x0C23,	%i4
	ldsb	[%l7 + 0x19],	%l4
	fornot1	%f6,	%f12,	%f10
	st	%f14,	[%l7 + 0x48]
	ld	[%l7 + 0x40],	%f11
	edge16	%g2,	%g6,	%i5
	fornot1	%f4,	%f14,	%f6
	ldub	[%l7 + 0x3B],	%g5
	fmovsg	%xcc,	%f9,	%f8
	ldd	[%l7 + 0x48],	%f2
	subcc	%l6,	0x0AD7,	%g4
	xnorcc	%l3,	0x1748,	%i0
	fmovsne	%icc,	%f3,	%f8
	andn	%o7,	%o0,	%o3
	edge8l	%g1,	%l0,	%i2
	sra	%i3,	%g7,	%l1
	and	%i6,	%o4,	%l5
	subc	%o1,	0x1898,	%o5
	mova	%xcc,	%i7,	%o2
	movn	%xcc,	%i1,	%g3
	ldx	[%l7 + 0x10],	%o6
	movrlez	%l2,	%i4,	%l4
	edge16ln	%g6,	%g2,	%g5
	fmul8x16al	%f13,	%f12,	%f4
	umul	%i5,	0x005E,	%g4
	std	%f8,	[%l7 + 0x28]
	ldx	[%l7 + 0x70],	%l3
	edge32	%i0,	%o7,	%l6
	fnot2s	%f3,	%f3
	movrgz	%o3,	%o0,	%l0
	movg	%xcc,	%i2,	%g1
	movg	%xcc,	%g7,	%l1
	stx	%i3,	[%l7 + 0x58]
	fmul8x16	%f3,	%f8,	%f8
	udivx	%o4,	0x146F,	%l5
	edge32l	%i6,	%o1,	%o5
	edge16l	%o2,	%i1,	%i7
	movge	%icc,	%g3,	%l2
	smul	%o6,	%i4,	%l4
	fornot1	%f14,	%f4,	%f14
	ldx	[%l7 + 0x58],	%g6
	sdivcc	%g2,	0x12D3,	%i5
	fmovrsgez	%g4,	%f8,	%f15
	movneg	%xcc,	%g5,	%l3
	fmovde	%xcc,	%f7,	%f0
	fpadd16	%f2,	%f6,	%f2
	edge16n	%i0,	%l6,	%o3
	fmovdl	%icc,	%f2,	%f12
	ldx	[%l7 + 0x28],	%o7
	xnorcc	%o0,	%l0,	%i2
	subcc	%g1,	%g7,	%i3
	alignaddrl	%o4,	%l5,	%i6
	sdivx	%o1,	0x0517,	%o5
	edge32	%l1,	%i1,	%o2
	sdivx	%g3,	0x0E43,	%i7
	fmovdne	%icc,	%f1,	%f9
	sllx	%o6,	%l2,	%l4
	lduh	[%l7 + 0x2C],	%i4
	fmovsg	%icc,	%f4,	%f0
	movrlz	%g2,	0x207,	%i5
	sdivx	%g6,	0x0CCD,	%g5
	edge32	%g4,	%l3,	%l6
	sllx	%i0,	%o3,	%o7
	subccc	%l0,	0x0C3F,	%i2
	srax	%g1,	%o0,	%i3
	movrlz	%g7,	0x3C5,	%l5
	movle	%icc,	%i6,	%o1
	and	%o5,	%o4,	%l1
	edge32ln	%i1,	%o2,	%i7
	sdivcc	%g3,	0x1AA2,	%o6
	ldsb	[%l7 + 0x2A],	%l4
	fmovrsne	%l2,	%f10,	%f3
	movrne	%g2,	0x08B,	%i5
	stb	%i4,	[%l7 + 0x70]
	fmovde	%icc,	%f13,	%f11
	xorcc	%g5,	0x1B98,	%g4
	fsrc2s	%f7,	%f7
	and	%g6,	0x0816,	%l3
	fpack32	%f0,	%f2,	%f14
	udivx	%l6,	0x13ED,	%o3
	movgu	%icc,	%o7,	%i0
	subcc	%i2,	0x0FBA,	%g1
	and	%o0,	%l0,	%g7
	st	%f6,	[%l7 + 0x2C]
	siam	0x1
	sllx	%l5,	0x06,	%i3
	array32	%i6,	%o1,	%o4
	sth	%o5,	[%l7 + 0x6C]
	andn	%i1,	0x1D64,	%o2
	smul	%l1,	%i7,	%o6
	mova	%icc,	%g3,	%l2
	sethi	0x1211,	%g2
	orcc	%i5,	%i4,	%l4
	edge8n	%g4,	%g5,	%l3
	fmuld8sux16	%f13,	%f9,	%f2
	fornot2s	%f9,	%f12,	%f7
	xnorcc	%l6,	0x1E5D,	%g6
	umulcc	%o3,	0x0C28,	%o7
	edge32l	%i2,	%g1,	%o0
	movge	%xcc,	%i0,	%l0
	fmovrsne	%g7,	%f3,	%f0
	fand	%f4,	%f0,	%f6
	movvc	%xcc,	%l5,	%i6
	movrgz	%i3,	0x036,	%o4
	add	%o1,	%o5,	%i1
	fmovdcc	%xcc,	%f7,	%f7
	ldd	[%l7 + 0x40],	%l0
	fmovrsgz	%i7,	%f1,	%f5
	add	%o2,	0x06A5,	%g3
	edge8l	%l2,	%g2,	%o6
	subc	%i5,	%l4,	%g4
	movrgez	%g5,	0x210,	%l3
	edge32	%l6,	%i4,	%g6
	fmul8x16au	%f3,	%f5,	%f10
	restore %o3, 0x0142, %i2
	movrlz	%o7,	%g1,	%o0
	array16	%l0,	%i0,	%l5
	fzeros	%f10
	udivcc	%g7,	0x1626,	%i3
	siam	0x5
	or	%i6,	%o4,	%o5
	xnor	%i1,	%o1,	%l1
	edge32	%o2,	%i7,	%l2
	add	%g3,	0x1D48,	%g2
	addccc	%o6,	0x0EAE,	%l4
	ldub	[%l7 + 0x57],	%i5
	umulcc	%g4,	%l3,	%l6
	movn	%icc,	%i4,	%g6
	subccc	%g5,	0x15D8,	%i2
	smulcc	%o7,	%g1,	%o0
	udiv	%o3,	0x1292,	%i0
	alignaddr	%l0,	%g7,	%i3
	ldx	[%l7 + 0x28],	%i6
	lduh	[%l7 + 0x34],	%o4
	ldsb	[%l7 + 0x53],	%o5
	movle	%icc,	%l5,	%o1
	sth	%i1,	[%l7 + 0x0C]
	fsrc2	%f2,	%f4
	orncc	%o2,	0x1205,	%i7
	fcmps	%fcc1,	%f9,	%f15
	ldub	[%l7 + 0x2E],	%l2
	lduw	[%l7 + 0x78],	%g3
	fcmpd	%fcc0,	%f8,	%f8
	edge16n	%l1,	%o6,	%g2
	xorcc	%i5,	0x14D8,	%g4
	edge16n	%l4,	%l3,	%i4
	pdist	%f0,	%f14,	%f2
	save %g6, %l6, %i2
	fpsub16	%f0,	%f2,	%f10
	movpos	%xcc,	%g5,	%g1
	addc	%o7,	0x03E6,	%o3
	xnorcc	%o0,	%i0,	%l0
	sethi	0x05ED,	%i3
	ldub	[%l7 + 0x73],	%i6
	addc	%g7,	0x08A3,	%o5
	edge8n	%o4,	%l5,	%o1
	fcmpgt16	%f14,	%f14,	%i1
	edge8n	%i7,	%o2,	%g3
	sdivx	%l1,	0x0855,	%o6
	orcc	%g2,	%l2,	%i5
	movcc	%xcc,	%g4,	%l3
	andcc	%i4,	%g6,	%l4
	movneg	%icc,	%l6,	%g5
	fmovde	%icc,	%f13,	%f15
	srl	%g1,	0x12,	%i2
	lduh	[%l7 + 0x12],	%o3
	ldub	[%l7 + 0x74],	%o0
	edge8n	%i0,	%l0,	%i3
	mulscc	%o7,	%i6,	%o5
	addc	%o4,	0x061C,	%g7
	fmovdn	%xcc,	%f11,	%f3
	ldub	[%l7 + 0x47],	%l5
	sll	%i1,	0x0E,	%o1
	movn	%xcc,	%i7,	%o2
	edge8n	%g3,	%o6,	%l1
	faligndata	%f2,	%f6,	%f6
	umul	%g2,	0x0A29,	%l2
	sub	%g4,	0x09C6,	%i5
	xorcc	%l3,	0x0AF6,	%i4
	movrne	%l4,	0x1D0,	%g6
	ldsw	[%l7 + 0x10],	%l6
	movge	%icc,	%g1,	%i2
	movneg	%xcc,	%g5,	%o0
	lduh	[%l7 + 0x64],	%i0
	array32	%l0,	%o3,	%o7
	srl	%i3,	0x1F,	%o5
	ldsb	[%l7 + 0x29],	%o4
	sethi	0x0503,	%i6
	ldsh	[%l7 + 0x08],	%g7
	array32	%l5,	%o1,	%i1
	ld	[%l7 + 0x50],	%f5
	fsrc1	%f10,	%f4
	std	%f10,	[%l7 + 0x20]
	movgu	%xcc,	%o2,	%g3
	fmovdpos	%icc,	%f8,	%f3
	fornot2s	%f13,	%f14,	%f12
	fnors	%f10,	%f8,	%f10
	fpsub32	%f6,	%f2,	%f12
	ldsw	[%l7 + 0x24],	%o6
	movneg	%xcc,	%i7,	%g2
	array16	%l2,	%l1,	%i5
	alignaddr	%g4,	%l3,	%l4
	sllx	%i4,	%g6,	%g1
	movneg	%xcc,	%i2,	%l6
	mova	%xcc,	%g5,	%o0
	fmovsa	%icc,	%f10,	%f4
	edge8	%i0,	%o3,	%l0
	stw	%o7,	[%l7 + 0x0C]
	movrlez	%i3,	0x270,	%o4
	movn	%icc,	%o5,	%i6
	movrlz	%l5,	0x152,	%g7
	fabsd	%f6,	%f4
	subccc	%i1,	0x0864,	%o1
	ldsw	[%l7 + 0x20],	%o2
	movcc	%xcc,	%g3,	%o6
	fmovsn	%icc,	%f14,	%f11
	edge32	%i7,	%g2,	%l1
	ldsh	[%l7 + 0x3A],	%i5
	xnor	%l2,	0x0EA3,	%l3
	movpos	%icc,	%l4,	%g4
	movrlz	%g6,	0x228,	%i4
	sll	%i2,	0x01,	%g1
	orcc	%g5,	%l6,	%o0
	movrgez	%o3,	%l0,	%i0
	restore %o7, 0x125F, %o4
	lduh	[%l7 + 0x52],	%i3
	edge32	%o5,	%i6,	%l5
	ldd	[%l7 + 0x68],	%f6
	ldsw	[%l7 + 0x24],	%i1
	sth	%o1,	[%l7 + 0x3A]
	sdiv	%o2,	0x0CF8,	%g3
	edge32n	%g7,	%o6,	%g2
	edge8l	%l1,	%i7,	%l2
	xorcc	%i5,	0x1421,	%l4
	sethi	0x15B0,	%l3
	movcc	%icc,	%g4,	%g6
	smulcc	%i4,	0x038E,	%g1
	subc	%g5,	%l6,	%i2
	movneg	%icc,	%o3,	%o0
	or	%l0,	%o7,	%o4
	fmul8sux16	%f8,	%f6,	%f14
	fcmped	%fcc2,	%f2,	%f10
	fmovdpos	%icc,	%f9,	%f14
	srax	%i0,	%i3,	%o5
	ldsw	[%l7 + 0x34],	%l5
	fcmpgt16	%f0,	%f4,	%i1
	orcc	%i6,	%o2,	%o1
	lduw	[%l7 + 0x14],	%g7
	lduw	[%l7 + 0x0C],	%g3
	movpos	%icc,	%g2,	%o6
	fmul8ulx16	%f14,	%f2,	%f8
	udivx	%l1,	0x0475,	%l2
	mulx	%i5,	%i7,	%l3
	stb	%l4,	[%l7 + 0x2D]
	sdiv	%g6,	0x136D,	%i4
	smulcc	%g1,	%g4,	%l6
	movcc	%icc,	%g5,	%i2
	stb	%o0,	[%l7 + 0x42]
	fcmpeq32	%f14,	%f6,	%l0
	ldsw	[%l7 + 0x38],	%o7
	ldd	[%l7 + 0x58],	%f10
	sub	%o3,	0x00E7,	%o4
	edge16l	%i0,	%o5,	%l5
	movneg	%xcc,	%i1,	%i3
	ldsw	[%l7 + 0x7C],	%i6
	orncc	%o2,	0x0DCD,	%g7
	sethi	0x031E,	%g3
	addccc	%g2,	0x19C1,	%o1
	movrgez	%l1,	0x077,	%l2
	ldsw	[%l7 + 0x70],	%i5
	fones	%f0
	xnorcc	%o6,	%i7,	%l4
	array16	%l3,	%i4,	%g1
	andcc	%g6,	%l6,	%g5
	stw	%g4,	[%l7 + 0x54]
	ld	[%l7 + 0x24],	%f5
	movn	%icc,	%i2,	%l0
	addcc	%o7,	0x0620,	%o0
	movg	%xcc,	%o3,	%o4
	srl	%o5,	0x01,	%i0
	movrgez	%l5,	%i1,	%i3
	andncc	%i6,	%o2,	%g3
	udivx	%g7,	0x1F47,	%g2
	stx	%l1,	[%l7 + 0x68]
	umul	%l2,	0x1DB9,	%o1
	fmovdn	%xcc,	%f15,	%f8
	edge16ln	%o6,	%i7,	%l4
	fmul8x16au	%f1,	%f2,	%f12
	srax	%l3,	%i5,	%g1
	ldd	[%l7 + 0x30],	%f6
	fornot2s	%f7,	%f13,	%f13
	fmovdne	%icc,	%f13,	%f12
	std	%f12,	[%l7 + 0x10]
	ldsw	[%l7 + 0x58],	%i4
	fmovd	%f8,	%f14
	sub	%g6,	%l6,	%g5
	mulx	%g4,	0x0E3F,	%l0
	movleu	%icc,	%i2,	%o0
	movvc	%xcc,	%o3,	%o7
	fandnot1s	%f0,	%f13,	%f8
	edge8l	%o5,	%i0,	%l5
	ldd	[%l7 + 0x70],	%o4
	edge16	%i3,	%i6,	%i1
	fnot1s	%f5,	%f14
	fmovdn	%icc,	%f15,	%f9
	fmovdcc	%icc,	%f13,	%f4
	udiv	%g3,	0x153D,	%g7
	stb	%o2,	[%l7 + 0x34]
	fmovdg	%icc,	%f0,	%f12
	fmovsg	%icc,	%f8,	%f10
	subccc	%l1,	0x1BF3,	%g2
	addc	%o1,	%o6,	%l2
	srax	%i7,	%l3,	%l4
	and	%g1,	0x0C32,	%i5
	fmovrslz	%i4,	%f0,	%f1
	sll	%l6,	0x1D,	%g6
	mulx	%g4,	%l0,	%g5
	fmul8x16al	%f4,	%f4,	%f14
	fmovdpos	%icc,	%f2,	%f6
	udivx	%i2,	0x0A48,	%o3
	andncc	%o0,	%o5,	%o7
	alignaddrl	%i0,	%o4,	%l5
	subc	%i3,	%i6,	%i1
	mova	%xcc,	%g3,	%g7
	movrgez	%l1,	%o2,	%g2
	umulcc	%o1,	%o6,	%l2
	fmovrsgz	%l3,	%f0,	%f7
	alignaddrl	%i7,	%l4,	%g1
	sdivcc	%i4,	0x0A17,	%i5
	orcc	%l6,	0x17E8,	%g4
	fxnors	%f1,	%f1,	%f1
	fmovsg	%xcc,	%f4,	%f10
	ldub	[%l7 + 0x4E],	%g6
	fmovsa	%xcc,	%f15,	%f2
	ldx	[%l7 + 0x10],	%l0
	edge8ln	%g5,	%i2,	%o0
	alignaddrl	%o5,	%o3,	%i0
	fmovrdgz	%o4,	%f4,	%f2
	edge32	%o7,	%l5,	%i6
	or	%i1,	0x0C29,	%i3
	fnor	%f8,	%f10,	%f6
	umul	%g3,	0x0160,	%g7
	ldx	[%l7 + 0x08],	%l1
	fxors	%f9,	%f4,	%f11
	mulx	%g2,	%o2,	%o6
	fnot2s	%f3,	%f2
	fmovdleu	%xcc,	%f6,	%f12
	edge32n	%o1,	%l3,	%i7
	fmovrslz	%l4,	%f3,	%f7
	orn	%g1,	%l2,	%i5
	movleu	%xcc,	%l6,	%i4
	fmovdcs	%icc,	%f2,	%f8
	orn	%g6,	%l0,	%g4
	mova	%xcc,	%g5,	%o0
	fcmpeq32	%f2,	%f10,	%o5
	sethi	0x021B,	%o3
	ldsh	[%l7 + 0x1E],	%i2
	fmovrse	%o4,	%f1,	%f7
	fmovdl	%icc,	%f6,	%f5
	smulcc	%i0,	0x0878,	%o7
	fmovdvc	%icc,	%f0,	%f11
	edge8ln	%l5,	%i1,	%i6
	std	%f12,	[%l7 + 0x38]
	xnor	%g3,	%g7,	%l1
	smul	%i3,	0x13D8,	%g2
	umul	%o2,	0x15BC,	%o6
	subcc	%o1,	0x043C,	%l3
	fmovdneg	%icc,	%f10,	%f11
	fnot2	%f6,	%f6
	array32	%i7,	%l4,	%g1
	udivcc	%i5,	0x1051,	%l6
	mova	%icc,	%i4,	%g6
	fmovdne	%xcc,	%f14,	%f3
	popc	0x1F93,	%l0
	fmovsl	%xcc,	%f15,	%f10
	sllx	%g4,	%g5,	%o0
	fpsub32	%f4,	%f6,	%f2
	fcmpes	%fcc3,	%f6,	%f13
	edge32	%l2,	%o3,	%i2
	fmovrdgez	%o4,	%f14,	%f2
	sll	%o5,	0x02,	%o7
	udivcc	%l5,	0x1F2F,	%i0
	sethi	0x1C0C,	%i1
	sdiv	%i6,	0x0CED,	%g3
	save %g7, 0x0E38, %l1
	xor	%g2,	%o2,	%i3
	ldsw	[%l7 + 0x50],	%o6
	add	%o1,	%i7,	%l3
	fsrc2	%f0,	%f10
	movrlz	%l4,	%g1,	%l6
	movcc	%icc,	%i4,	%i5
	alignaddrl	%l0,	%g6,	%g5
	sub	%o0,	%l2,	%g4
	movneg	%icc,	%i2,	%o3
	edge8n	%o5,	%o7,	%l5
	ldsh	[%l7 + 0x0E],	%o4
	sllx	%i1,	%i0,	%g3
	edge8	%g7,	%l1,	%g2
	std	%f12,	[%l7 + 0x68]
	restore %i6, 0x0820, %o2
	std	%f14,	[%l7 + 0x10]
	srax	%o6,	0x1E,	%o1
	andcc	%i3,	0x1050,	%i7
	array8	%l4,	%g1,	%l6
	edge32n	%l3,	%i4,	%i5
	ldd	[%l7 + 0x78],	%f6
	fmovsgu	%icc,	%f14,	%f15
	movvs	%xcc,	%l0,	%g6
	sdivx	%o0,	0x0124,	%l2
	fmovse	%xcc,	%f4,	%f3
	and	%g5,	%g4,	%i2
	fornot1	%f8,	%f12,	%f4
	array32	%o3,	%o7,	%l5
	stx	%o4,	[%l7 + 0x78]
	ldsh	[%l7 + 0x50],	%o5
	sethi	0x1927,	%i0
	andncc	%i1,	%g7,	%l1
	andn	%g3,	0x0A46,	%g2
	array32	%o2,	%o6,	%o1
	edge16ln	%i6,	%i3,	%l4
	srax	%i7,	0x03,	%l6
	ldsh	[%l7 + 0x72],	%l3
	movrne	%i4,	0x05E,	%g1
	sdivcc	%l0,	0x0DFD,	%g6
	stb	%o0,	[%l7 + 0x64]
	fnot1s	%f8,	%f15
	addccc	%i5,	0x1934,	%g5
	addcc	%l2,	0x1C65,	%g4
	udivcc	%o3,	0x032D,	%o7
	fmovda	%icc,	%f3,	%f1
	fmovdcc	%icc,	%f5,	%f9
	alignaddr	%l5,	%i2,	%o5
	andncc	%o4,	%i0,	%i1
	orcc	%g7,	0x1D29,	%g3
	movre	%g2,	%l1,	%o6
	edge32l	%o2,	%o1,	%i6
	edge8n	%i3,	%i7,	%l6
	sra	%l3,	%l4,	%g1
	fmuld8ulx16	%f3,	%f6,	%f12
	movn	%icc,	%l0,	%i4
	fnors	%f7,	%f14,	%f2
	andn	%o0,	%i5,	%g5
	ldd	[%l7 + 0x70],	%g6
	movneg	%xcc,	%g4,	%o3
	lduh	[%l7 + 0x74],	%l2
	addc	%l5,	0x1351,	%i2
	fones	%f11
	st	%f3,	[%l7 + 0x64]
	movre	%o7,	%o4,	%i0
	ldsh	[%l7 + 0x32],	%i1
	edge16	%o5,	%g3,	%g2
	orn	%g7,	0x0167,	%o6
	movgu	%xcc,	%l1,	%o1
	xor	%o2,	0x10B8,	%i3
	movge	%icc,	%i6,	%i7
	edge8l	%l6,	%l3,	%l4
	xor	%l0,	0x0986,	%g1
	xnor	%o0,	0x1098,	%i5
	ldx	[%l7 + 0x70],	%i4
	movge	%xcc,	%g6,	%g5
	ldub	[%l7 + 0x43],	%o3
	array16	%g4,	%l2,	%i2
	addc	%l5,	0x0FAC,	%o7
	subcc	%i0,	%o4,	%o5
	ldsw	[%l7 + 0x6C],	%g3
	ldsw	[%l7 + 0x50],	%g2
	andncc	%i1,	%o6,	%l1
	fornot1	%f8,	%f8,	%f8
	fmul8x16au	%f14,	%f9,	%f6
	fornot1	%f14,	%f14,	%f12
	sllx	%g7,	0x15,	%o2
	fnand	%f10,	%f10,	%f2
	stw	%i3,	[%l7 + 0x5C]
	andncc	%o1,	%i7,	%l6
	ldd	[%l7 + 0x60],	%f6
	fpsub16s	%f6,	%f1,	%f8
	fmovrslez	%i6,	%f9,	%f15
	fsrc2s	%f1,	%f6
	mulscc	%l3,	%l0,	%g1
	movcs	%xcc,	%o0,	%i5
	xnor	%i4,	0x1498,	%g6
	movcc	%icc,	%l4,	%o3
	sdivx	%g4,	0x08F0,	%g5
	movn	%icc,	%i2,	%l5
	edge16ln	%o7,	%i0,	%o4
	std	%f12,	[%l7 + 0x30]
	ldsh	[%l7 + 0x60],	%o5
	movleu	%xcc,	%g3,	%g2
	alignaddr	%l2,	%o6,	%l1
	edge32l	%g7,	%i1,	%o2
	fmovsl	%xcc,	%f1,	%f5
	movcs	%icc,	%i3,	%o1
	ldd	[%l7 + 0x58],	%f2
	fmovde	%xcc,	%f11,	%f4
	add	%l6,	0x1D47,	%i7
	mulscc	%l3,	%l0,	%i6
	srl	%g1,	0x11,	%o0
	orcc	%i4,	%i5,	%g6
	ldsh	[%l7 + 0x0E],	%o3
	orncc	%g4,	0x13D5,	%l4
	edge8ln	%g5,	%i2,	%o7
	ld	[%l7 + 0x78],	%f11
	fsrc1s	%f3,	%f2
	array32	%l5,	%i0,	%o4
	fmovrslz	%g3,	%f15,	%f13
	sethi	0x0EE9,	%o5
	stw	%l2,	[%l7 + 0x38]
	fmovrdgez	%g2,	%f14,	%f12
	fmul8x16	%f9,	%f14,	%f12
	xnorcc	%l1,	0x1BB5,	%o6
	ld	[%l7 + 0x30],	%f6
	sdivx	%i1,	0x0DAD,	%o2
	fsrc2s	%f14,	%f15
	sdiv	%i3,	0x0751,	%o1
	fpadd16	%f0,	%f4,	%f8
	fsrc2s	%f11,	%f0
	st	%f14,	[%l7 + 0x40]
	movre	%g7,	0x184,	%l6
	fmovdgu	%icc,	%f7,	%f14
	subc	%l3,	%l0,	%i7
	array32	%g1,	%i6,	%o0
	andn	%i5,	0x1539,	%g6
	stx	%i4,	[%l7 + 0x10]
	popc	%o3,	%g4
	edge32l	%l4,	%i2,	%o7
	fxor	%f10,	%f4,	%f8
	fxnors	%f14,	%f11,	%f11
	movn	%xcc,	%g5,	%l5
	move	%xcc,	%o4,	%g3
	movg	%icc,	%o5,	%i0
	fsrc1	%f8,	%f0
	lduh	[%l7 + 0x58],	%g2
	fors	%f6,	%f0,	%f3
	fmovdge	%icc,	%f3,	%f6
	move	%icc,	%l1,	%l2
	fmovrsgez	%o6,	%f14,	%f7
	orn	%o2,	%i1,	%o1
	sdivcc	%g7,	0x1297,	%l6
	andncc	%i3,	%l3,	%l0
	fcmpgt16	%f0,	%f2,	%g1
	move	%xcc,	%i6,	%o0
	ldsb	[%l7 + 0x50],	%i7
	movgu	%xcc,	%i5,	%g6
	fmovspos	%xcc,	%f0,	%f7
	edge16n	%o3,	%i4,	%l4
	movl	%icc,	%i2,	%g4
	fmovsg	%icc,	%f1,	%f3
	fcmpgt32	%f0,	%f2,	%o7
	addc	%l5,	%g5,	%o4
	movrlez	%g3,	%o5,	%g2
	sll	%l1,	0x11,	%l2
	mulx	%i0,	0x0FDC,	%o2
	addccc	%o6,	%i1,	%g7
	xnorcc	%l6,	%o1,	%i3
	movl	%icc,	%l3,	%l0
	movrgez	%i6,	%g1,	%i7
	movvc	%icc,	%i5,	%g6
	movcs	%icc,	%o3,	%i4
	subc	%l4,	0x1CB8,	%o0
	edge8ln	%g4,	%o7,	%i2
	andcc	%l5,	0x0CA6,	%o4
	sth	%g3,	[%l7 + 0x08]
	fsrc1s	%f10,	%f2
	fmovsneg	%xcc,	%f5,	%f11
	fmovrde	%o5,	%f6,	%f8
	udivx	%g5,	0x1022,	%g2
	edge32ln	%l1,	%l2,	%i0
	ldsw	[%l7 + 0x18],	%o2
	movrlz	%o6,	0x233,	%i1
	sdiv	%l6,	0x0FE1,	%o1
	array8	%i3,	%l3,	%g7
	st	%f5,	[%l7 + 0x40]
	edge16n	%l0,	%i6,	%i7
	movrne	%g1,	%g6,	%i5
	movge	%icc,	%o3,	%l4
	add	%i4,	%o0,	%o7
	fcmpne32	%f4,	%f8,	%i2
	restore %l5, 0x1C30, %o4
	ldsb	[%l7 + 0x43],	%g3
	edge32	%o5,	%g5,	%g2
	addccc	%l1,	0x0492,	%g4
	ldsw	[%l7 + 0x30],	%l2
	srl	%i0,	0x17,	%o6
	smul	%i1,	%o2,	%l6
	edge32l	%o1,	%i3,	%l3
	xnorcc	%g7,	0x1585,	%i6
	array8	%i7,	%l0,	%g1
	smulcc	%i5,	0x0A4D,	%o3
	ld	[%l7 + 0x08],	%f3
	fmovspos	%icc,	%f14,	%f13
	and	%l4,	0x1DC7,	%i4
	xnor	%g6,	%o0,	%o7
	sdivx	%i2,	0x028B,	%o4
	sdivcc	%g3,	0x194A,	%l5
	udivcc	%o5,	0x01FE,	%g5
	stw	%l1,	[%l7 + 0x20]
	alignaddr	%g2,	%g4,	%l2
	edge16	%i0,	%o6,	%o2
	lduh	[%l7 + 0x66],	%i1
	subcc	%o1,	0x1ADE,	%i3
	edge32	%l3,	%l6,	%i6
	edge16n	%i7,	%l0,	%g7
	array8	%g1,	%i5,	%o3
	movne	%icc,	%l4,	%i4
	sdivcc	%g6,	0x1739,	%o7
	movrgz	%o0,	0x35B,	%o4
	andcc	%g3,	0x16B2,	%l5
	st	%f14,	[%l7 + 0x34]
	st	%f3,	[%l7 + 0x5C]
	ld	[%l7 + 0x38],	%f14
	sethi	0x0B2E,	%o5
	stw	%i2,	[%l7 + 0x24]
	xor	%l1,	%g2,	%g5
	movre	%g4,	%l2,	%i0
	smulcc	%o6,	%i1,	%o2
	fpadd32	%f12,	%f0,	%f4
	andcc	%o1,	%i3,	%l6
	edge16n	%i6,	%i7,	%l0
	edge16n	%g7,	%g1,	%i5
	edge32l	%l3,	%l4,	%o3
	movrlz	%g6,	0x338,	%o7
	umulcc	%o0,	0x0BD2,	%i4
	srax	%o4,	%l5,	%g3
	fmovdg	%icc,	%f9,	%f6
	fmovspos	%xcc,	%f4,	%f1
	movcc	%xcc,	%o5,	%l1
	movge	%xcc,	%g2,	%i2
	edge32	%g5,	%g4,	%i0
	ldub	[%l7 + 0x63],	%l2
	fzeros	%f12
	edge16	%o6,	%i1,	%o1
	movne	%xcc,	%i3,	%l6
	udivx	%o2,	0x0FC6,	%i6
	sllx	%i7,	0x17,	%g7
	subc	%g1,	%l0,	%l3
	xor	%i5,	0x177A,	%o3
	ldd	[%l7 + 0x30],	%g6
	ldsw	[%l7 + 0x7C],	%l4
	edge8n	%o7,	%o0,	%i4
	std	%f12,	[%l7 + 0x70]
	mulscc	%o4,	0x17C2,	%l5
	andncc	%o5,	%l1,	%g2
	addc	%g3,	0x1A3A,	%g5
	save %i2, %g4, %l2
	addc	%i0,	%o6,	%i1
	popc	0x0DE3,	%o1
	sra	%l6,	%i3,	%o2
	movrne	%i7,	%i6,	%g1
	fmovrdgez	%l0,	%f10,	%f6
	fmovdpos	%icc,	%f6,	%f2
	bshuffle	%f0,	%f12,	%f14
	umul	%l3,	%i5,	%g7
	and	%o3,	0x1CA3,	%g6
	udivx	%l4,	0x06EF,	%o0
	and	%i4,	%o4,	%o7
	movcc	%xcc,	%l5,	%o5
	edge16ln	%l1,	%g2,	%g3
	ldsb	[%l7 + 0x67],	%g5
	orcc	%i2,	0x058F,	%g4
	ldsw	[%l7 + 0x58],	%i0
	movre	%l2,	0x016,	%o6
	or	%o1,	0x1141,	%l6
	ldub	[%l7 + 0x42],	%i1
	fmovrsgez	%o2,	%f5,	%f4
	stb	%i7,	[%l7 + 0x47]
	movle	%xcc,	%i6,	%i3
	andncc	%l0,	%g1,	%l3
	fands	%f9,	%f11,	%f14
	movn	%icc,	%g7,	%o3
	movl	%xcc,	%i5,	%l4
	sdivx	%o0,	0x03BA,	%g6
	edge16ln	%i4,	%o4,	%l5
	array16	%o7,	%l1,	%o5
	sth	%g2,	[%l7 + 0x52]
	fandnot2s	%f13,	%f6,	%f12
	add	%g3,	%i2,	%g5
	movvc	%icc,	%g4,	%i0
	edge32	%o6,	%o1,	%l6
	movrne	%i1,	0x318,	%o2
	edge32	%l2,	%i7,	%i3
	movne	%xcc,	%i6,	%l0
	movn	%icc,	%g1,	%l3
	lduh	[%l7 + 0x4E],	%o3
	movrgez	%i5,	%l4,	%g7
	fmovrdgez	%o0,	%f2,	%f14
	sethi	0x087B,	%i4
	fmovsa	%icc,	%f15,	%f9
	fpackfix	%f12,	%f12
	sethi	0x0480,	%g6
	xnorcc	%l5,	%o4,	%o7
	fmovde	%icc,	%f15,	%f13
	save %l1, %g2, %o5
	edge8l	%g3,	%i2,	%g5
	movcc	%xcc,	%g4,	%i0
	srlx	%o6,	0x1E,	%l6
	and	%o1,	%i1,	%o2
	edge32	%l2,	%i3,	%i7
	udiv	%i6,	0x13B3,	%l0
	udiv	%l3,	0x1420,	%g1
	sra	%o3,	0x07,	%l4
	stx	%i5,	[%l7 + 0x48]
	subccc	%o0,	0x16B1,	%i4
	popc	0x15AF,	%g6
	movrne	%l5,	0x256,	%g7
	subc	%o7,	0x187C,	%o4
	movrgz	%l1,	0x0D8,	%o5
	movcc	%xcc,	%g3,	%i2
	fmul8x16al	%f10,	%f11,	%f8
	fpmerge	%f11,	%f5,	%f12
	xnorcc	%g2,	0x1A8C,	%g4
	movcs	%xcc,	%i0,	%g5
	for	%f14,	%f14,	%f2
	movrne	%o6,	0x352,	%o1
	umulcc	%i1,	%o2,	%l6
	ldub	[%l7 + 0x1B],	%i3
	sdivx	%i7,	0x1AEA,	%i6
	bshuffle	%f12,	%f14,	%f14
	fpmerge	%f9,	%f6,	%f2
	lduh	[%l7 + 0x42],	%l0
	popc	0x0526,	%l2
	ldsh	[%l7 + 0x7C],	%g1
	movn	%icc,	%l3,	%l4
	xnor	%i5,	0x1AB4,	%o3
	movrlz	%o0,	0x2FB,	%i4
	fmovse	%xcc,	%f6,	%f0
	ldsw	[%l7 + 0x10],	%l5
	sll	%g7,	%o7,	%o4
	movne	%icc,	%l1,	%o5
	add	%g6,	0x1C80,	%i2
	st	%f6,	[%l7 + 0x3C]
	fmovrsne	%g3,	%f13,	%f12
	fpadd32	%f10,	%f14,	%f12
	or	%g2,	%g4,	%g5
	array8	%o6,	%i0,	%o1
	fone	%f6
	edge16	%o2,	%i1,	%i3
	sethi	0x1B27,	%l6
	edge32	%i6,	%l0,	%l2
	or	%i7,	0x0238,	%l3
	andn	%g1,	%l4,	%o3
	movl	%icc,	%i5,	%o0
	movn	%xcc,	%i4,	%l5
	movre	%g7,	0x23E,	%o7
	movne	%icc,	%o4,	%l1
	restore %g6, 0x0514, %i2
	mova	%icc,	%o5,	%g2
	mova	%icc,	%g3,	%g4
	fornot2s	%f8,	%f15,	%f8
	sth	%o6,	[%l7 + 0x0C]
	sdivx	%g5,	0x1A03,	%i0
	fnot2s	%f0,	%f12
	fandnot1s	%f0,	%f2,	%f8
	xorcc	%o2,	0x0B07,	%i1
	subcc	%o1,	0x0E2E,	%l6
	fpadd32s	%f1,	%f8,	%f10
	movvc	%icc,	%i6,	%i3
	stw	%l2,	[%l7 + 0x44]
	smul	%i7,	%l3,	%g1
	edge16ln	%l0,	%o3,	%l4
	sdiv	%o0,	0x106E,	%i4
	fpack16	%f0,	%f2
	sdivx	%l5,	0x0697,	%g7
	sethi	0x1E94,	%i5
	fands	%f9,	%f0,	%f4
	fmovsvs	%xcc,	%f0,	%f3
	orn	%o4,	%o7,	%l1
	movl	%icc,	%g6,	%i2
	edge32l	%g2,	%g3,	%o5
	movcs	%xcc,	%o6,	%g5
	lduh	[%l7 + 0x16],	%g4
	xnorcc	%i0,	%i1,	%o2
	std	%f0,	[%l7 + 0x68]
	fpack16	%f8,	%f11
	smul	%l6,	0x0CC3,	%o1
	srax	%i3,	0x15,	%l2
	fmovdn	%icc,	%f2,	%f10
	edge16l	%i6,	%i7,	%g1
	fmovdge	%icc,	%f12,	%f11
	addc	%l3,	%o3,	%l0
	movg	%xcc,	%l4,	%o0
	fmovscs	%icc,	%f10,	%f4
	srl	%i4,	%g7,	%i5
	andcc	%l5,	%o7,	%o4
	movpos	%xcc,	%l1,	%i2
	srlx	%g2,	%g3,	%g6
	fexpand	%f14,	%f6
	movl	%xcc,	%o6,	%g5
	fmul8sux16	%f0,	%f0,	%f0
	fmovdcs	%icc,	%f8,	%f3
	array8	%o5,	%g4,	%i0
	movre	%i1,	0x3CA,	%o2
	fones	%f12
	st	%f9,	[%l7 + 0x50]
	stb	%o1,	[%l7 + 0x74]
	fcmps	%fcc2,	%f6,	%f10
	array16	%i3,	%l6,	%i6
	std	%f4,	[%l7 + 0x68]
	edge32	%l2,	%g1,	%i7
	edge32n	%l3,	%l0,	%o3
	ldd	[%l7 + 0x10],	%o0
	movrne	%i4,	%l4,	%i5
	st	%f14,	[%l7 + 0x30]
	smulcc	%g7,	%o7,	%l5
	movrlz	%l1,	0x197,	%o4
	fnor	%f14,	%f12,	%f10
	fpackfix	%f6,	%f6
	umulcc	%g2,	%i2,	%g6
	subc	%g3,	%g5,	%o5
	fcmpgt32	%f0,	%f2,	%o6
	ld	[%l7 + 0x7C],	%f12
	xnor	%i0,	%g4,	%i1
	xnorcc	%o2,	0x1519,	%o1
	movcc	%icc,	%l6,	%i6
	subccc	%i3,	0x03EC,	%g1
	sdiv	%i7,	0x0EE1,	%l2
	ldsw	[%l7 + 0x74],	%l0
	fsrc1s	%f0,	%f4
	stb	%o3,	[%l7 + 0x58]
	sdivx	%o0,	0x1491,	%l3
	srlx	%i4,	%l4,	%i5
	sethi	0x0563,	%g7
	or	%o7,	%l5,	%o4
	edge16l	%l1,	%i2,	%g6
	st	%f6,	[%l7 + 0x6C]
	movrgz	%g2,	%g5,	%g3
	fmovdcs	%xcc,	%f5,	%f15
	ldub	[%l7 + 0x11],	%o5
	alignaddr	%i0,	%g4,	%i1
	fabss	%f2,	%f2
	ldsh	[%l7 + 0x3A],	%o6
	srl	%o2,	0x06,	%l6
	edge32ln	%o1,	%i3,	%g1
	alignaddr	%i7,	%i6,	%l2
	fcmpes	%fcc2,	%f1,	%f10
	edge32	%o3,	%o0,	%l0
	udiv	%i4,	0x1103,	%l3
	movn	%xcc,	%i5,	%l4
	edge8ln	%o7,	%g7,	%l5
	lduh	[%l7 + 0x10],	%o4
	or	%i2,	0x11E7,	%g6
	fnand	%f4,	%f8,	%f2
	fnegs	%f7,	%f10
	ldub	[%l7 + 0x5F],	%l1
	sth	%g5,	[%l7 + 0x74]
	smul	%g3,	%g2,	%i0
	udivcc	%g4,	0x0438,	%i1
	fmovdleu	%xcc,	%f8,	%f1
	xorcc	%o6,	%o5,	%o2
	movgu	%icc,	%o1,	%i3
	alignaddrl	%g1,	%l6,	%i6
	movcs	%icc,	%i7,	%o3
	or	%o0,	%l2,	%i4
	fpsub32	%f2,	%f8,	%f0
	movle	%xcc,	%l3,	%l0
	movvs	%xcc,	%i5,	%o7
	fmovdne	%icc,	%f12,	%f2
	movl	%xcc,	%g7,	%l4
	sdivx	%o4,	0x15A8,	%l5
	movrne	%g6,	0x0E6,	%l1
	sth	%i2,	[%l7 + 0x46]
	movvs	%xcc,	%g3,	%g5
	orncc	%g2,	%i0,	%i1
	sra	%g4,	0x0C,	%o5
	stx	%o6,	[%l7 + 0x70]
	fsrc1	%f0,	%f14
	save %o1, 0x13D3, %o2
	movrlz	%i3,	%g1,	%l6
	xor	%i7,	%o3,	%o0
	orncc	%i6,	%l2,	%i4
	movgu	%xcc,	%l0,	%i5
	mulx	%l3,	%g7,	%o7
	ldsh	[%l7 + 0x6E],	%l4
	movg	%icc,	%o4,	%l5
	fone	%f8
	fpadd16	%f0,	%f10,	%f6
	movcc	%icc,	%l1,	%g6
	andcc	%g3,	0x13C5,	%g5
	srl	%g2,	%i2,	%i0
	fmovsle	%icc,	%f2,	%f14
	fmovsne	%icc,	%f0,	%f15
	sth	%g4,	[%l7 + 0x5A]
	restore %i1, 0x122F, %o6
	edge16ln	%o1,	%o5,	%i3
	sll	%g1,	%o2,	%i7
	alignaddrl	%o3,	%l6,	%i6
	umul	%o0,	%l2,	%i4
	alignaddrl	%l0,	%i5,	%g7
	fmovrse	%l3,	%f5,	%f10
	fmovsg	%icc,	%f5,	%f2
	fcmpne32	%f4,	%f4,	%o7
	movle	%xcc,	%o4,	%l5
	mulx	%l1,	0x105C,	%l4
	movn	%icc,	%g3,	%g5
	movgu	%icc,	%g6,	%g2
	sll	%i0,	%i2,	%i1
	or	%o6,	0x0AF1,	%g4
	fornot2	%f6,	%f14,	%f14
	sdivcc	%o1,	0x1E75,	%i3
	fnegs	%f0,	%f13
	movcs	%xcc,	%g1,	%o2
	fornot2	%f4,	%f8,	%f6
	orcc	%o5,	%i7,	%l6
	ldub	[%l7 + 0x37],	%o3
	edge16l	%o0,	%i6,	%l2
	ld	[%l7 + 0x7C],	%f4
	edge32l	%l0,	%i5,	%i4
	srax	%g7,	%o7,	%l3
	edge32ln	%o4,	%l1,	%l4
	edge8l	%l5,	%g3,	%g5
	fnegs	%f10,	%f8
	std	%f4,	[%l7 + 0x08]
	array8	%g2,	%i0,	%g6
	andcc	%i1,	%i2,	%g4
	orcc	%o1,	%o6,	%g1
	movge	%icc,	%o2,	%i3
	add	%i7,	0x0ECA,	%o5
	xorcc	%o3,	%l6,	%o0
	lduw	[%l7 + 0x08],	%i6
	ldsb	[%l7 + 0x47],	%l0
	fmul8sux16	%f0,	%f8,	%f10
	movle	%xcc,	%l2,	%i5
	srl	%i4,	%g7,	%l3
	movn	%icc,	%o4,	%l1
	move	%icc,	%l4,	%o7
	and	%l5,	0x0566,	%g3
	fmovrdgez	%g5,	%f4,	%f12
	alignaddrl	%i0,	%g2,	%i1
	addccc	%i2,	%g4,	%o1
	srax	%o6,	0x12,	%g6
	array16	%o2,	%g1,	%i3
	mulx	%o5,	%i7,	%o3
	movn	%icc,	%l6,	%o0
	movrgz	%i6,	0x126,	%l0
	umul	%i5,	0x1F79,	%l2
	fmovdl	%icc,	%f1,	%f0
	sllx	%g7,	%i4,	%o4
	movcc	%icc,	%l1,	%l3
	movg	%xcc,	%l4,	%l5
	movg	%xcc,	%o7,	%g3
	array8	%i0,	%g5,	%g2
	edge8l	%i1,	%i2,	%o1
	ldsw	[%l7 + 0x48],	%o6
	xorcc	%g6,	%g4,	%o2
	fmovdl	%icc,	%f15,	%f5
	movne	%icc,	%g1,	%o5
	edge8	%i3,	%i7,	%o3
	or	%o0,	0x008C,	%i6
	fsrc1	%f10,	%f14
	fmovdl	%icc,	%f0,	%f7
	array16	%l6,	%i5,	%l2
	umul	%l0,	0x08AC,	%i4
	fmovdleu	%icc,	%f8,	%f11
	movcc	%xcc,	%g7,	%l1
	ld	[%l7 + 0x38],	%f10
	edge8l	%o4,	%l3,	%l4
	fmovrdlz	%o7,	%f2,	%f8
	lduw	[%l7 + 0x60],	%l5
	edge16	%i0,	%g3,	%g2
	movle	%icc,	%i1,	%g5
	edge32l	%o1,	%i2,	%g6
	edge32n	%g4,	%o6,	%g1
	alignaddrl	%o5,	%i3,	%o2
	move	%xcc,	%o3,	%o0
	movl	%xcc,	%i7,	%l6
	movle	%icc,	%i6,	%l2
	movrgez	%i5,	0x1BA,	%l0
	stw	%i4,	[%l7 + 0x2C]
	array8	%l1,	%o4,	%l3
	addccc	%l4,	%o7,	%l5
	movre	%i0,	%g3,	%g2
	movg	%icc,	%g7,	%g5
	edge32l	%o1,	%i1,	%g6
	srlx	%g4,	%i2,	%g1
	alignaddr	%o6,	%i3,	%o2
	fmovdcc	%xcc,	%f6,	%f4
	udivx	%o5,	0x1150,	%o3
	andncc	%i7,	%o0,	%l6
	fand	%f10,	%f14,	%f0
	fmovscs	%xcc,	%f14,	%f14
	subc	%l2,	%i5,	%l0
	movvc	%xcc,	%i6,	%i4
	ld	[%l7 + 0x74],	%f6
	fnands	%f0,	%f10,	%f5
	ldd	[%l7 + 0x10],	%f14
	udivcc	%o4,	0x066B,	%l3
	srl	%l1,	0x19,	%o7
	fpadd32	%f12,	%f6,	%f8
	stw	%l4,	[%l7 + 0x68]
	lduw	[%l7 + 0x2C],	%i0
	ldub	[%l7 + 0x7C],	%l5
	sdiv	%g3,	0x02D0,	%g7
	fornot2	%f6,	%f6,	%f12
	ldx	[%l7 + 0x40],	%g5
	smulcc	%g2,	0x1FF2,	%i1
	add	%o1,	%g4,	%g6
	move	%icc,	%g1,	%o6
	movvc	%xcc,	%i3,	%o2
	fandnot1s	%f10,	%f4,	%f2
	fmul8x16au	%f2,	%f6,	%f10
	fones	%f12
	subccc	%o5,	%i2,	%o3
	fmul8sux16	%f10,	%f4,	%f8
	movrgz	%i7,	%l6,	%l2
	srlx	%i5,	0x16,	%l0
	fcmpgt16	%f12,	%f6,	%i6
	sdivx	%o0,	0x1FFE,	%o4
	mulx	%i4,	0x1802,	%l1
	sub	%o7,	%l3,	%i0
	fnor	%f6,	%f2,	%f14
	and	%l4,	0x145A,	%g3
	array8	%l5,	%g7,	%g5
	srax	%i1,	%g2,	%g4
	udivcc	%o1,	0x0527,	%g6
	movge	%icc,	%g1,	%o6
	edge32ln	%i3,	%o2,	%o5
	xnorcc	%o3,	%i2,	%l6
	movleu	%xcc,	%i7,	%l2
	mulscc	%i5,	0x1773,	%l0
	edge32ln	%i6,	%o4,	%i4
	fmuld8ulx16	%f2,	%f4,	%f2
	edge32l	%l1,	%o0,	%l3
	srax	%o7,	0x07,	%i0
	srax	%l4,	%l5,	%g7
	ldd	[%l7 + 0x28],	%g4
	fmovdcs	%xcc,	%f8,	%f6
	movne	%xcc,	%g3,	%g2
	subc	%i1,	0x188A,	%g4
	fornot2	%f2,	%f6,	%f4
	fmul8x16	%f10,	%f8,	%f4
	movrgez	%g6,	%g1,	%o1
	srax	%o6,	%i3,	%o5
	fmovdgu	%xcc,	%f12,	%f12
	array32	%o3,	%i2,	%o2
	edge16n	%l6,	%l2,	%i5
	fabsd	%f6,	%f8
	edge16	%l0,	%i6,	%o4
	fmovsge	%icc,	%f9,	%f1
	subccc	%i4,	%i7,	%o0
	sdivcc	%l3,	0x1FCF,	%o7
	movleu	%icc,	%i0,	%l1
	lduw	[%l7 + 0x54],	%l5
	movcs	%xcc,	%g7,	%g5
	fmovsne	%icc,	%f4,	%f13
	fcmped	%fcc2,	%f12,	%f6
	xnorcc	%g3,	0x19A9,	%l4
	movcc	%icc,	%i1,	%g4
	sll	%g2,	0x0B,	%g1
	fmovsvs	%xcc,	%f2,	%f4
	ldd	[%l7 + 0x10],	%f4
	fmovrdgez	%g6,	%f12,	%f12
	ldd	[%l7 + 0x08],	%f14
	edge8n	%o1,	%i3,	%o5
	lduw	[%l7 + 0x14],	%o6
	fandnot2	%f10,	%f8,	%f4
	add	%i2,	0x11E2,	%o3
	movrgez	%o2,	0x12F,	%l2
	edge32n	%l6,	%l0,	%i6
	udivcc	%i5,	0x0231,	%i4
	umulcc	%i7,	0x0969,	%o4
	edge8n	%o0,	%o7,	%l3
	ld	[%l7 + 0x38],	%f4
	fmovrdgez	%i0,	%f0,	%f8
	array16	%l5,	%l1,	%g7
	ldub	[%l7 + 0x70],	%g5
	fmul8x16al	%f10,	%f6,	%f10
	movl	%xcc,	%g3,	%i1
	fmovrdne	%l4,	%f2,	%f10
	ld	[%l7 + 0x40],	%f9
	move	%icc,	%g4,	%g1
	edge8l	%g2,	%g6,	%i3
	smulcc	%o1,	%o6,	%o5
	edge16	%o3,	%i2,	%l2
	andncc	%l6,	%l0,	%i6
	popc	0x0DC3,	%i5
	sra	%i4,	0x01,	%i7
	movrgez	%o2,	%o0,	%o7
	popc	0x0E64,	%o4
	subc	%i0,	%l3,	%l1
	edge16l	%l5,	%g7,	%g5
	popc	0x0397,	%g3
	std	%f8,	[%l7 + 0x30]
	ldd	[%l7 + 0x40],	%f8
	alignaddrl	%i1,	%g4,	%l4
	fmovrsgez	%g1,	%f5,	%f6
	edge8l	%g2,	%g6,	%o1
	array16	%i3,	%o5,	%o6
	sll	%o3,	0x19,	%i2
	fcmpeq16	%f12,	%f12,	%l6
	fmuld8ulx16	%f2,	%f3,	%f14
	fcmpd	%fcc0,	%f8,	%f4
	fmovsvs	%xcc,	%f4,	%f7
	xor	%l2,	0x1FBF,	%i6
	fmovdn	%icc,	%f10,	%f3
	smul	%l0,	%i4,	%i7
	sra	%o2,	0x07,	%o0
	xorcc	%i5,	%o7,	%i0
	sethi	0x1D06,	%o4
	udivcc	%l3,	0x0187,	%l5
	restore %g7, %l1, %g3
	fcmps	%fcc0,	%f15,	%f6
	sdivx	%g5,	0x0956,	%g4
	fmul8x16au	%f9,	%f2,	%f14
	sethi	0x02EC,	%i1
	movg	%xcc,	%l4,	%g1
	umulcc	%g2,	0x0041,	%g6
	std	%f8,	[%l7 + 0x10]
	fnegd	%f4,	%f4
	addccc	%i3,	%o1,	%o5
	fcmpgt16	%f14,	%f8,	%o6
	save %o3, 0x02BA, %i2
	fmovdne	%icc,	%f6,	%f3
	move	%icc,	%l2,	%l6
	ldd	[%l7 + 0x70],	%l0
	fpsub16	%f6,	%f0,	%f14
	fnegd	%f10,	%f14
	fmovdn	%icc,	%f2,	%f7
	fmovdgu	%xcc,	%f3,	%f4
	sll	%i6,	0x0E,	%i4
	fmovs	%f7,	%f8
	xnorcc	%o2,	0x102B,	%o0
	smul	%i5,	%i7,	%o7
	fmovscc	%xcc,	%f10,	%f6
	lduh	[%l7 + 0x10],	%o4
	subc	%i0,	%l5,	%l3
	fmovdleu	%icc,	%f10,	%f4
	fmovsg	%icc,	%f15,	%f13
	ld	[%l7 + 0x2C],	%f4
	movvs	%xcc,	%l1,	%g3
	sll	%g7,	0x15,	%g5
	andncc	%g4,	%l4,	%i1
	subccc	%g1,	%g2,	%g6
	fmovdleu	%xcc,	%f1,	%f1
	sdiv	%o1,	0x110E,	%o5
	udivcc	%i3,	0x1FC5,	%o6
	movle	%icc,	%i2,	%l2
	udivx	%o3,	0x0628,	%l0
	andn	%i6,	%i4,	%o2
	fmul8ulx16	%f0,	%f6,	%f4
	stw	%l6,	[%l7 + 0x58]
	fmovdvs	%icc,	%f12,	%f8
	edge32l	%o0,	%i7,	%i5
	sth	%o4,	[%l7 + 0x24]
	fmovscs	%xcc,	%f0,	%f7
	addcc	%o7,	0x16F5,	%l5
	ldsb	[%l7 + 0x15],	%i0
	orcc	%l3,	0x1FE3,	%g3
	fnegs	%f4,	%f1
	movre	%g7,	%g5,	%l1
	srl	%g4,	0x13,	%i1
	array8	%g1,	%g2,	%g6
	udivcc	%o1,	0x0C73,	%l4
	edge8n	%o5,	%i3,	%o6
	ldx	[%l7 + 0x20],	%l2
	movvc	%xcc,	%o3,	%l0
	movgu	%icc,	%i6,	%i4
	andncc	%i2,	%o2,	%l6
	edge8n	%o0,	%i5,	%i7
	andn	%o4,	0x1039,	%l5
	addc	%i0,	%l3,	%g3
	stb	%o7,	[%l7 + 0x1F]
	add	%g7,	0x1B3D,	%l1
	umul	%g5,	%g4,	%i1
	fmovscs	%icc,	%f11,	%f14
	umul	%g2,	0x150C,	%g1
	andcc	%g6,	0x0670,	%l4
	andcc	%o5,	%o1,	%o6
	stb	%i3,	[%l7 + 0x17]
	edge8n	%o3,	%l2,	%l0
	movpos	%xcc,	%i6,	%i2
	fornot1	%f8,	%f14,	%f14
	pdist	%f0,	%f0,	%f2
	stw	%o2,	[%l7 + 0x6C]
	mulx	%l6,	%o0,	%i4
	orncc	%i5,	%i7,	%o4
	array16	%l5,	%l3,	%g3
	xorcc	%o7,	0x045C,	%g7
	addcc	%l1,	%g5,	%i0
	edge16n	%i1,	%g4,	%g2
	xnorcc	%g1,	0x16D0,	%l4
	ldsb	[%l7 + 0x6F],	%o5
	fmovsvc	%xcc,	%f2,	%f0
	ldx	[%l7 + 0x58],	%o1
	ldsb	[%l7 + 0x58],	%g6
	fcmpd	%fcc1,	%f8,	%f8
	movg	%icc,	%o6,	%o3
	fmovrdlz	%i3,	%f4,	%f6
	movge	%xcc,	%l0,	%l2
	sra	%i2,	0x15,	%i6
	movrgez	%l6,	0x30D,	%o2
	fnors	%f4,	%f0,	%f12
	orcc	%i4,	0x0018,	%i5
	fmovdg	%icc,	%f13,	%f14
	xnor	%i7,	0x11AA,	%o0
	restore %o4, 0x1A9E, %l3
	fmovrde	%g3,	%f6,	%f14
	srlx	%o7,	%l5,	%g7
	alignaddr	%l1,	%i0,	%g5
	srl	%g4,	%i1,	%g2
	subc	%l4,	0x1F9F,	%g1
	smulcc	%o5,	%g6,	%o1
	orncc	%o3,	0x0D24,	%o6
	sll	%l0,	%i3,	%l2
	movg	%icc,	%i2,	%l6
	fsrc2	%f10,	%f2
	movre	%i6,	0x043,	%o2
	sra	%i4,	%i7,	%o0
	fmovspos	%xcc,	%f12,	%f12
	fmovdgu	%icc,	%f10,	%f9
	fmovdle	%icc,	%f7,	%f1
	andn	%i5,	0x1613,	%l3
	edge16ln	%o4,	%g3,	%o7
	edge16l	%l5,	%g7,	%l1
	sub	%g5,	%g4,	%i0
	edge16	%i1,	%g2,	%l4
	sth	%o5,	[%l7 + 0x2E]
	fmovscc	%icc,	%f3,	%f15
	fcmpeq16	%f14,	%f0,	%g6
	fmovdleu	%icc,	%f4,	%f0
	fxnor	%f0,	%f8,	%f4
	restore %g1, 0x0063, %o3
	movgu	%icc,	%o1,	%o6
	udivx	%i3,	0x1B96,	%l0
	move	%xcc,	%l2,	%i2
	fmul8ulx16	%f8,	%f8,	%f4
	alignaddrl	%l6,	%o2,	%i4
	movre	%i7,	0x203,	%i6
	sllx	%i5,	0x16,	%l3
	ldd	[%l7 + 0x50],	%o0
	andn	%g3,	0x1465,	%o7
	fpadd16	%f14,	%f4,	%f14
	movrlz	%o4,	%l5,	%g7
	fxnor	%f8,	%f10,	%f12
	edge8n	%g5,	%g4,	%i0
	restore %l1, %i1, %g2
	fsrc2	%f6,	%f12
	edge8l	%o5,	%g6,	%g1
	movcs	%xcc,	%l4,	%o1
	mulx	%o6,	0x14D5,	%i3
	restore %o3, %l0, %l2
	mulx	%i2,	0x0212,	%o2
	xor	%i4,	%i7,	%l6
	or	%i6,	0x0A9B,	%l3
	save %i5, 0x0127, %g3
	movre	%o7,	%o0,	%l5
	fmovdge	%xcc,	%f12,	%f0
	smul	%g7,	%o4,	%g5
	movrne	%g4,	%l1,	%i0
	fandnot2s	%f3,	%f11,	%f0
	subccc	%g2,	0x002E,	%o5
	ldsb	[%l7 + 0x4F],	%i1
	fnands	%f0,	%f4,	%f14
	movg	%icc,	%g1,	%l4
	st	%f14,	[%l7 + 0x5C]
	movne	%icc,	%g6,	%o6
	stb	%i3,	[%l7 + 0x3B]
	fmovdcs	%icc,	%f6,	%f13
	save %o1, %o3, %l0
	move	%xcc,	%l2,	%i2
	fpadd16s	%f9,	%f0,	%f14
	orn	%i4,	0x12BA,	%i7
	srl	%l6,	%i6,	%o2
	ldd	[%l7 + 0x10],	%f2
	edge16	%l3,	%g3,	%i5
	fpack16	%f4,	%f3
	sdivx	%o0,	0x0922,	%l5
	edge32l	%g7,	%o4,	%g5
	smul	%g4,	0x1B31,	%l1
	srl	%o7,	%i0,	%o5
	for	%f4,	%f12,	%f4
	edge8	%i1,	%g1,	%g2
	fpack32	%f2,	%f6,	%f10
	movrne	%l4,	%g6,	%o6
	xnorcc	%i3,	0x069F,	%o1
	edge8	%l0,	%o3,	%l2
	movcc	%xcc,	%i4,	%i2
	fxnors	%f2,	%f10,	%f12
	xnor	%l6,	0x1A61,	%i6
	movrlez	%o2,	%l3,	%i7
	edge16ln	%i5,	%g3,	%l5
	orn	%g7,	%o0,	%g5
	ldsw	[%l7 + 0x64],	%o4
	andn	%l1,	%o7,	%g4
	std	%f8,	[%l7 + 0x08]
	movrlez	%o5,	0x225,	%i0
	movrlez	%g1,	%g2,	%l4
	edge8l	%i1,	%g6,	%o6
	smul	%i3,	0x0676,	%l0
	fmovsneg	%xcc,	%f11,	%f8
	movne	%icc,	%o1,	%o3
	sethi	0x02D8,	%i4
	edge8l	%l2,	%l6,	%i6
	udivcc	%o2,	0x1E53,	%i2
	sth	%l3,	[%l7 + 0x58]
	movvs	%xcc,	%i7,	%g3
	edge32	%i5,	%g7,	%l5
	movrgz	%g5,	%o0,	%l1
	ldx	[%l7 + 0x10],	%o7
	array16	%o4,	%o5,	%g4
	sra	%g1,	0x0C,	%i0
	ldsb	[%l7 + 0x44],	%l4
	fornot1	%f10,	%f10,	%f2
	movrne	%i1,	0x110,	%g6
	movre	%g2,	%o6,	%l0
	orncc	%o1,	%i3,	%i4
	movre	%l2,	0x1C3,	%o3
	move	%xcc,	%l6,	%i6
	movvc	%xcc,	%o2,	%l3
	srl	%i2,	%g3,	%i7
	fpsub32	%f14,	%f0,	%f0
	movvs	%icc,	%i5,	%l5
	array8	%g7,	%g5,	%l1
	fmovrdgez	%o7,	%f0,	%f0
	sdivcc	%o4,	0x188E,	%o0
	fmovdne	%icc,	%f7,	%f6
	andcc	%o5,	0x127F,	%g4
	sth	%g1,	[%l7 + 0x3C]
	sdivcc	%l4,	0x1219,	%i1
	add	%i0,	%g6,	%o6
	array8	%l0,	%g2,	%i3
	edge8ln	%o1,	%i4,	%o3
	xor	%l2,	%l6,	%o2
	alignaddr	%i6,	%i2,	%g3
	smulcc	%i7,	%l3,	%i5
	edge8ln	%l5,	%g5,	%l1
	sllx	%g7,	%o4,	%o7
	fcmpes	%fcc2,	%f8,	%f12
	fnot2	%f0,	%f4
	mulscc	%o5,	%g4,	%o0
	fandnot2s	%f4,	%f8,	%f5
	lduh	[%l7 + 0x5C],	%l4
	fmovdle	%icc,	%f14,	%f4
	ldub	[%l7 + 0x10],	%i1
	fpsub32	%f8,	%f0,	%f14
	movre	%g1,	%i0,	%g6
	addc	%l0,	%g2,	%o6
	andn	%i3,	0x13CB,	%i4
	fmovsgu	%xcc,	%f9,	%f5
	fandnot1s	%f9,	%f2,	%f1
	st	%f5,	[%l7 + 0x48]
	ldsb	[%l7 + 0x62],	%o1
	ldsw	[%l7 + 0x60],	%o3
	addcc	%l2,	%l6,	%o2
	fpsub16s	%f3,	%f3,	%f15
	add	%i2,	%g3,	%i7
	subccc	%l3,	0x05D4,	%i5
	mulx	%i6,	%l5,	%l1
	srax	%g7,	0x06,	%o4
	ldub	[%l7 + 0x09],	%o7
	andcc	%g5,	0x1992,	%o5
	edge8l	%o0,	%g4,	%l4
	fmovsvs	%xcc,	%f0,	%f3
	udivx	%g1,	0x1DFD,	%i1
	fmovdleu	%icc,	%f0,	%f6
	array16	%i0,	%g6,	%g2
	fmovrse	%l0,	%f15,	%f11
	movrlez	%o6,	0x23D,	%i4
	movrlz	%o1,	%i3,	%o3
	udivx	%l6,	0x061B,	%l2
	fmovrsgz	%o2,	%f13,	%f4
	sdiv	%g3,	0x1F35,	%i7
	addccc	%l3,	%i2,	%i5
	movn	%icc,	%i6,	%l1
	and	%l5,	0x0AA6,	%o4
	ldd	[%l7 + 0x10],	%f6
	fmovscs	%xcc,	%f11,	%f5
	movleu	%icc,	%o7,	%g5
	fcmpgt16	%f4,	%f10,	%g7
	movgu	%icc,	%o5,	%g4
	fmovdleu	%xcc,	%f15,	%f14
	sdivx	%l4,	0x1DC4,	%g1
	lduh	[%l7 + 0x5E],	%i1
	fornot1s	%f6,	%f13,	%f2
	movcc	%xcc,	%o0,	%g6
	orcc	%g2,	%i0,	%l0
	fpadd16s	%f8,	%f5,	%f8
	addcc	%i4,	%o6,	%o1
	ld	[%l7 + 0x08],	%f15
	edge32l	%o3,	%l6,	%l2
	orncc	%i3,	0x1CA5,	%g3
	popc	0x1870,	%o2
	fzeros	%f6
	ldsw	[%l7 + 0x6C],	%i7
	fmovde	%icc,	%f8,	%f10
	sdivcc	%i2,	0x02A9,	%i5
	sdivcc	%i6,	0x08B1,	%l3
	fmovdl	%xcc,	%f12,	%f1
	movleu	%icc,	%l5,	%l1
	fmovs	%f15,	%f14
	subcc	%o7,	0x1D8E,	%o4
	fmovdn	%xcc,	%f7,	%f1
	stx	%g5,	[%l7 + 0x50]
	edge32n	%o5,	%g7,	%l4
	sethi	0x06FD,	%g4
	movl	%icc,	%i1,	%g1
	edge8l	%g6,	%o0,	%g2
	smulcc	%i0,	0x1948,	%i4
	stx	%l0,	[%l7 + 0x18]
	srlx	%o6,	0x12,	%o3
	std	%f14,	[%l7 + 0x58]
	sll	%l6,	0x11,	%o1
	srl	%l2,	%g3,	%i3
	xnorcc	%o2,	%i7,	%i5
	mova	%xcc,	%i2,	%i6
	edge16n	%l3,	%l5,	%l1
	fornot2s	%f9,	%f5,	%f5
	xnor	%o4,	%o7,	%o5
	smul	%g7,	0x1815,	%l4
	movl	%xcc,	%g4,	%g5
	fcmpne16	%f14,	%f2,	%i1
	stb	%g6,	[%l7 + 0x57]
	movvc	%xcc,	%o0,	%g1
	movrgez	%g2,	%i4,	%l0
	addccc	%o6,	%i0,	%l6
	and	%o1,	0x1889,	%o3
	fmovscc	%xcc,	%f6,	%f6
	movrlz	%l2,	%g3,	%o2
	mulscc	%i7,	0x1C5D,	%i5
	movn	%xcc,	%i3,	%i6
	movrne	%i2,	%l3,	%l5
	add	%l1,	%o7,	%o4
	alignaddrl	%o5,	%l4,	%g7
	fnot1	%f12,	%f2
	fmovrde	%g4,	%f12,	%f12
	movg	%icc,	%i1,	%g6
	movg	%xcc,	%o0,	%g5
	subcc	%g2,	%i4,	%g1
	sra	%l0,	0x17,	%o6
	alignaddr	%l6,	%i0,	%o1
	sub	%l2,	%o3,	%g3
	sub	%o2,	0x0CB0,	%i5
	movrne	%i3,	0x09B,	%i6
	fxor	%f14,	%f0,	%f6
	array8	%i2,	%i7,	%l3
	sdiv	%l5,	0x03CE,	%l1
	movrgz	%o7,	0x221,	%o5
	fmovrdne	%l4,	%f6,	%f14
	sra	%o4,	%g4,	%i1
	fnegd	%f6,	%f8
	movpos	%icc,	%g7,	%o0
	sllx	%g5,	%g2,	%g6
	fpsub16s	%f1,	%f3,	%f13
	move	%icc,	%g1,	%l0
	mulscc	%i4,	0x093A,	%l6
	subccc	%i0,	%o6,	%l2
	stx	%o3,	[%l7 + 0x20]
	addc	%g3,	%o2,	%o1
	orn	%i5,	%i6,	%i3
	sdivx	%i2,	0x0A03,	%l3
	sra	%l5,	0x13,	%i7
	ld	[%l7 + 0x7C],	%f10
	edge32ln	%o7,	%o5,	%l4
	fors	%f7,	%f15,	%f11
	edge32	%o4,	%g4,	%l1
	sethi	0x1AAF,	%i1
	edge32l	%o0,	%g7,	%g5
	movrgz	%g2,	%g1,	%g6
	mulx	%i4,	0x0BFC,	%l6
	popc	%l0,	%i0
	bshuffle	%f10,	%f8,	%f6
	mulscc	%o6,	0x0DBB,	%o3
	movrgz	%g3,	0x3F3,	%l2
	smul	%o2,	0x058F,	%o1
	mulx	%i6,	%i3,	%i2
	movrlez	%i5,	%l5,	%l3
	ldx	[%l7 + 0x38],	%o7
	sth	%i7,	[%l7 + 0x4E]
	sdiv	%l4,	0x06FD,	%o4
	movrgez	%o5,	%l1,	%g4
	sethi	0x0C97,	%i1
	fmovd	%f4,	%f8
	array8	%g7,	%o0,	%g2
	ldsb	[%l7 + 0x3C],	%g1
	or	%g5,	%g6,	%i4
	movgu	%icc,	%l6,	%l0
	fxnors	%f1,	%f6,	%f3
	fnegs	%f0,	%f10
	stw	%i0,	[%l7 + 0x18]
	stw	%o3,	[%l7 + 0x3C]
	or	%o6,	%g3,	%l2
	edge32	%o1,	%i6,	%o2
	edge32	%i2,	%i5,	%l5
	andcc	%i3,	0x010E,	%o7
	array8	%l3,	%i7,	%o4
	edge16ln	%l4,	%l1,	%g4
	xorcc	%o5,	%g7,	%i1
	add	%o0,	0x0862,	%g1
	ldx	[%l7 + 0x20],	%g2
	udivcc	%g5,	0x01D5,	%g6
	fpack16	%f10,	%f9
	edge16n	%i4,	%l0,	%l6
	fnands	%f7,	%f12,	%f9
	sllx	%o3,	%o6,	%g3
	save %i0, 0x110B, %l2
	ldd	[%l7 + 0x48],	%o0
	addccc	%i6,	0x0AF8,	%o2
	srax	%i5,	0x05,	%l5
	edge32ln	%i2,	%o7,	%i3
	mova	%xcc,	%l3,	%o4
	udivcc	%l4,	0x1B8B,	%l1
	and	%g4,	0x090F,	%o5
	fsrc1s	%f4,	%f10
	fornot1	%f4,	%f0,	%f10
	movle	%xcc,	%g7,	%i7
	stw	%o0,	[%l7 + 0x28]
	orncc	%g1,	%g2,	%i1
	srl	%g5,	%i4,	%l0
	edge16n	%g6,	%l6,	%o6
	movrlz	%g3,	0x3F0,	%i0
	smulcc	%o3,	0x06ED,	%o1
	fpadd32s	%f13,	%f0,	%f8
	fnot2	%f0,	%f12
	andcc	%i6,	0x04B4,	%l2
	ldsb	[%l7 + 0x55],	%i5
	ldsb	[%l7 + 0x24],	%l5
	smul	%i2,	0x0714,	%o2
	movgu	%icc,	%i3,	%o7
	movleu	%icc,	%o4,	%l3
	fpmerge	%f2,	%f7,	%f2
	sdivcc	%l1,	0x06A3,	%g4
	movcc	%xcc,	%o5,	%g7
	orncc	%l4,	0x1A78,	%o0
	sethi	0x11C9,	%i7
	edge16	%g1,	%g2,	%i1
	orn	%i4,	%l0,	%g6
	edge16	%g5,	%l6,	%g3
	fnegs	%f2,	%f0
	fabss	%f0,	%f0
	movre	%i0,	%o6,	%o3
	popc	%i6,	%l2
	edge16n	%o1,	%i5,	%l5
	movne	%xcc,	%i2,	%i3
	fmovrse	%o2,	%f4,	%f9
	save %o4, 0x0EEE, %o7
	sllx	%l3,	%g4,	%l1
	fpadd16	%f14,	%f0,	%f14
	movcc	%xcc,	%g7,	%o5
	orncc	%o0,	0x08B4,	%l4
	fmovrsgez	%g1,	%f13,	%f2
	smulcc	%g2,	%i7,	%i1
	movcs	%icc,	%i4,	%l0
	xorcc	%g6,	0x1D29,	%l6
	movrlez	%g5,	%g3,	%i0
	fmovrdlez	%o3,	%f12,	%f14
	stb	%i6,	[%l7 + 0x31]
	addcc	%o6,	0x011A,	%l2
	fmovdl	%icc,	%f9,	%f6
	sethi	0x0EB5,	%o1
	movpos	%icc,	%l5,	%i2
	xnor	%i3,	0x0428,	%o2
	movcs	%xcc,	%o4,	%o7
	lduh	[%l7 + 0x32],	%l3
	fmovs	%f7,	%f6
	andn	%i5,	%l1,	%g4
	fmovda	%icc,	%f13,	%f12
	edge16n	%o5,	%g7,	%l4
	edge8l	%g1,	%g2,	%o0
	movrgz	%i1,	%i7,	%i4
	edge8n	%l0,	%l6,	%g5
	mulx	%g6,	%i0,	%o3
	movrgz	%g3,	%o6,	%l2
	stb	%o1,	[%l7 + 0x13]
	sth	%l5,	[%l7 + 0x5E]
	movcs	%xcc,	%i2,	%i3
	fmovdn	%icc,	%f7,	%f4
	addc	%i6,	%o4,	%o7
	mova	%xcc,	%l3,	%i5
	movgu	%icc,	%l1,	%o2
	ldsb	[%l7 + 0x1A],	%g4
	edge16n	%o5,	%l4,	%g7
	movrlez	%g1,	0x05D,	%g2
	fands	%f4,	%f1,	%f4
	fcmpne32	%f4,	%f4,	%i1
	umulcc	%i7,	%i4,	%o0
	lduw	[%l7 + 0x40],	%l6
	fmovsvc	%icc,	%f10,	%f0
	smulcc	%g5,	0x1966,	%l0
	umulcc	%i0,	0x1557,	%o3
	fmovdle	%xcc,	%f10,	%f2
	movgu	%icc,	%g3,	%g6
	andncc	%o6,	%l2,	%l5
	add	%o1,	%i2,	%i3
	fcmple32	%f12,	%f4,	%o4
	fmovdcs	%icc,	%f4,	%f5
	smulcc	%i6,	%o7,	%i5
	sethi	0x08D9,	%l3
	fxnors	%f15,	%f7,	%f12
	fmovdn	%icc,	%f5,	%f14
	or	%o2,	%l1,	%g4
	subcc	%o5,	0x0893,	%l4
	umulcc	%g7,	%g2,	%i1
	fmovrdgz	%i7,	%f8,	%f0
	movrgz	%i4,	%g1,	%o0
	movrlez	%g5,	0x303,	%l0
	movn	%xcc,	%i0,	%o3
	fmul8sux16	%f8,	%f8,	%f2
	sth	%g3,	[%l7 + 0x1E]
	andcc	%g6,	0x085D,	%l6
	array16	%o6,	%l5,	%l2
	fpadd16	%f10,	%f2,	%f0
	edge16n	%o1,	%i3,	%o4
	fpackfix	%f12,	%f5
	fcmpd	%fcc2,	%f0,	%f8
	fmovrslez	%i2,	%f6,	%f12
	movge	%icc,	%o7,	%i6
	movcs	%xcc,	%i5,	%l3
	movvc	%icc,	%o2,	%l1
	st	%f4,	[%l7 + 0x08]
	movleu	%xcc,	%o5,	%l4
	fmovdpos	%xcc,	%f4,	%f2
	subcc	%g7,	0x1CD4,	%g4
	orn	%g2,	0x0F48,	%i1
	fsrc2s	%f7,	%f0
	movleu	%icc,	%i7,	%g1
	edge32l	%i4,	%o0,	%g5
	sdivcc	%i0,	0x0EEE,	%o3
	stx	%l0,	[%l7 + 0x38]
	popc	0x16CE,	%g6
	udivcc	%g3,	0x03E6,	%o6
	array8	%l5,	%l2,	%l6
	udivcc	%i3,	0x1CB9,	%o4
	array16	%i2,	%o1,	%o7
	add	%i6,	%i5,	%o2
	alignaddr	%l3,	%o5,	%l1
	ldsb	[%l7 + 0x79],	%l4
	srax	%g7,	0x1E,	%g2
	lduw	[%l7 + 0x28],	%i1
	ldd	[%l7 + 0x28],	%i6
	xnorcc	%g4,	%i4,	%o0
	fmovsle	%xcc,	%f15,	%f15
	fmovdle	%icc,	%f9,	%f7
	sll	%g5,	%g1,	%i0
	fors	%f3,	%f2,	%f0
	udivx	%o3,	0x177E,	%l0
	stx	%g3,	[%l7 + 0x08]
	umulcc	%o6,	0x1D22,	%g6
	and	%l2,	0x07EE,	%l5
	mulx	%l6,	0x1F85,	%i3
	fornot2	%f10,	%f14,	%f4
	alignaddr	%i2,	%o4,	%o7
	sethi	0x0BD7,	%o1
	movcc	%xcc,	%i5,	%o2
	movn	%icc,	%i6,	%o5
	xor	%l3,	0x08C8,	%l1
	sth	%l4,	[%l7 + 0x22]
	save %g7, %i1, %g2
	siam	0x3
	movg	%icc,	%g4,	%i4
	fsrc2	%f8,	%f4
	edge8n	%i7,	%o0,	%g1
	ldd	[%l7 + 0x10],	%f14
	orcc	%g5,	%i0,	%l0
	smulcc	%g3,	%o3,	%o6
	fexpand	%f5,	%f14
	ldsw	[%l7 + 0x1C],	%g6
	movre	%l2,	0x1AF,	%l5
	movn	%icc,	%i3,	%l6
	edge32	%i2,	%o4,	%o7
	fmul8sux16	%f10,	%f10,	%f4
	edge32	%o1,	%o2,	%i6
	edge16l	%i5,	%o5,	%l3
	lduh	[%l7 + 0x10],	%l1
	movrgz	%g7,	%i1,	%g2
	edge16	%l4,	%i4,	%i7
	restore %o0, %g4, %g1
	edge16l	%i0,	%g5,	%g3
	movrlez	%l0,	0x175,	%o3
	st	%f13,	[%l7 + 0x10]
	mulscc	%g6,	0x1AA1,	%o6
	xorcc	%l5,	0x1F4E,	%i3
	fmovscs	%icc,	%f5,	%f8
	ldd	[%l7 + 0x58],	%f14
	edge16ln	%l6,	%l2,	%o4
	movvs	%icc,	%i2,	%o7
	movrgez	%o1,	%o2,	%i5
	movn	%icc,	%o5,	%i6
	andncc	%l1,	%l3,	%i1
	stx	%g2,	[%l7 + 0x20]
	edge16ln	%l4,	%i4,	%i7
	movvs	%xcc,	%o0,	%g4
	siam	0x7
	movne	%xcc,	%g1,	%g7
	fmuld8ulx16	%f2,	%f12,	%f4
	movre	%g5,	0x00E,	%i0
	sllx	%l0,	%g3,	%o3
	orcc	%o6,	%l5,	%i3
	fcmped	%fcc3,	%f2,	%f12
	addc	%g6,	0x0404,	%l2
	edge16ln	%l6,	%i2,	%o7
	orn	%o4,	0x0DF6,	%o1
	movne	%icc,	%i5,	%o5
	ldsb	[%l7 + 0x36],	%i6
	movrgez	%l1,	%l3,	%o2
	and	%i1,	0x19ED,	%l4
	fpadd32	%f0,	%f6,	%f6
	siam	0x4
	movvc	%xcc,	%g2,	%i4
	movg	%xcc,	%o0,	%i7
	fcmpeq16	%f4,	%f12,	%g4
	alignaddrl	%g1,	%g5,	%g7
	sub	%l0,	%i0,	%o3
	and	%g3,	0x060B,	%l5
	fpsub32	%f2,	%f0,	%f2
	srlx	%o6,	0x0A,	%i3
	fornot2	%f10,	%f2,	%f0
	fmovsleu	%icc,	%f12,	%f6
	subc	%g6,	0x0BC1,	%l6
	lduh	[%l7 + 0x3E],	%l2
	movvs	%icc,	%o7,	%i2
	sth	%o4,	[%l7 + 0x7C]
	movcc	%icc,	%o1,	%i5
	sll	%o5,	%i6,	%l3
	ldsw	[%l7 + 0x18],	%o2
	movrgez	%l1,	0x2DF,	%i1
	fcmps	%fcc2,	%f15,	%f7
	fxor	%f8,	%f10,	%f2
	edge32	%l4,	%i4,	%g2
	sll	%i7,	%o0,	%g1
	movne	%icc,	%g5,	%g7
	fand	%f10,	%f2,	%f0
	fmovdne	%xcc,	%f1,	%f12
	fmovsvs	%xcc,	%f12,	%f11
	addc	%l0,	%g4,	%o3
	movcc	%icc,	%i0,	%g3
	edge8ln	%l5,	%i3,	%g6
	stx	%o6,	[%l7 + 0x10]
	fmul8x16al	%f12,	%f13,	%f4
	ld	[%l7 + 0x1C],	%f9
	movg	%xcc,	%l6,	%o7
	movg	%icc,	%l2,	%i2
	ldub	[%l7 + 0x4F],	%o1
	fmovsvc	%icc,	%f0,	%f3
	xorcc	%o4,	%i5,	%i6
	edge8n	%l3,	%o2,	%l1
	addcc	%i1,	0x1289,	%o5
	movle	%icc,	%i4,	%l4
	array8	%i7,	%o0,	%g1
	addccc	%g5,	0x0A2A,	%g2
	array8	%g7,	%g4,	%l0
	sdivcc	%i0,	0x1F54,	%o3
	subccc	%g3,	%l5,	%i3
	movvs	%xcc,	%o6,	%g6
	sdiv	%l6,	0x1A8E,	%o7
	fcmps	%fcc2,	%f3,	%f13
	stx	%i2,	[%l7 + 0x38]
	fnand	%f14,	%f0,	%f4
	movpos	%icc,	%o1,	%l2
	movrgez	%i5,	0x2E9,	%i6
	edge16	%l3,	%o2,	%l1
	ldsh	[%l7 + 0x62],	%i1
	sllx	%o4,	0x13,	%i4
	fmovdg	%icc,	%f4,	%f12
	addccc	%o5,	%l4,	%o0
	udiv	%i7,	0x1C1F,	%g1
	udiv	%g5,	0x1C2B,	%g7
	smul	%g4,	%l0,	%i0
	umul	%o3,	0x0F2C,	%g3
	fcmple16	%f6,	%f4,	%l5
	for	%f14,	%f10,	%f6
	stw	%g2,	[%l7 + 0x58]
	mulscc	%o6,	%g6,	%i3
	edge32l	%o7,	%l6,	%o1
	srax	%i2,	%i5,	%i6
	fmovrslez	%l3,	%f13,	%f15
	movrlz	%o2,	0x197,	%l1
	edge32n	%l2,	%o4,	%i1
	fpsub32	%f2,	%f8,	%f6
	stx	%i4,	[%l7 + 0x30]
	fxors	%f13,	%f8,	%f3
	sdivx	%l4,	0x1F9B,	%o5
	xnor	%o0,	0x08ED,	%g1
	movvs	%xcc,	%g5,	%g7
	st	%f14,	[%l7 + 0x08]
	ldx	[%l7 + 0x78],	%g4
	sdiv	%l0,	0x11D9,	%i7
	smul	%o3,	%g3,	%l5
	lduw	[%l7 + 0x1C],	%i0
	or	%o6,	0x0C23,	%g6
	movvs	%xcc,	%g2,	%o7
	ld	[%l7 + 0x24],	%f7
	fornot2	%f14,	%f0,	%f12
	restore %l6, %o1, %i2
	ld	[%l7 + 0x50],	%f1
	ldub	[%l7 + 0x2A],	%i5
	udiv	%i6,	0x0ED0,	%l3
	ld	[%l7 + 0x70],	%f4
	add	%o2,	%l1,	%l2
	udivcc	%o4,	0x11DF,	%i1
	orcc	%i4,	0x1D81,	%i3
	ldx	[%l7 + 0x30],	%l4
	lduh	[%l7 + 0x1E],	%o0
	xorcc	%o5,	%g5,	%g7
	fpsub32	%f10,	%f8,	%f0
	pdist	%f14,	%f6,	%f6
	sra	%g4,	%l0,	%i7
	movleu	%icc,	%o3,	%g3
	fmovsa	%icc,	%f7,	%f4
	udivx	%l5,	0x14BA,	%g1
	ldd	[%l7 + 0x20],	%f10
	fzero	%f2
	and	%o6,	%i0,	%g6
	fmuld8ulx16	%f11,	%f6,	%f4
	ldx	[%l7 + 0x28],	%g2
	movrlz	%o7,	%l6,	%o1
	movleu	%xcc,	%i2,	%i5
	fmovspos	%xcc,	%f4,	%f10
	umulcc	%i6,	0x1980,	%o2
	fornot2s	%f10,	%f4,	%f12
	sra	%l1,	0x04,	%l3
	save %o4, %l2, %i1
	fpsub32s	%f11,	%f2,	%f8
	and	%i3,	0x0EBB,	%i4
	movge	%xcc,	%l4,	%o5
	fnot1s	%f1,	%f6
	ldsb	[%l7 + 0x11],	%o0
	fmovrsne	%g7,	%f13,	%f1
	fmul8ulx16	%f4,	%f14,	%f2
	array8	%g4,	%l0,	%i7
	sll	%o3,	0x1A,	%g5
	addccc	%g3,	0x05E7,	%g1
	movcs	%xcc,	%l5,	%o6
	sdivcc	%g6,	0x10EF,	%i0
	and	%o7,	0x0549,	%g2
	orcc	%l6,	%o1,	%i2
	movcc	%icc,	%i5,	%i6
	movneg	%xcc,	%l1,	%o2
	addccc	%l3,	0x0A27,	%l2
	edge8	%i1,	%o4,	%i3
	fmovsl	%icc,	%f4,	%f4
	subccc	%l4,	%i4,	%o5
	movl	%icc,	%g7,	%g4
	lduw	[%l7 + 0x30],	%l0
	movge	%xcc,	%o0,	%o3
	xnorcc	%i7,	0x0DB5,	%g3
	edge8ln	%g5,	%l5,	%g1
	edge8	%g6,	%o6,	%o7
	ldsw	[%l7 + 0x48],	%i0
	save %l6, 0x0B7F, %o1
	fmovd	%f0,	%f0
	movrne	%i2,	%i5,	%g2
	sllx	%i6,	0x03,	%o2
	andncc	%l1,	%l3,	%i1
	movrne	%l2,	0x2C7,	%o4
	mulscc	%l4,	0x091C,	%i3
	fmovsvc	%xcc,	%f4,	%f0
	add	%o5,	%i4,	%g7
	udivcc	%l0,	0x0955,	%g4
	xorcc	%o3,	0x0FD9,	%i7
	array32	%o0,	%g3,	%l5
	fmul8x16	%f0,	%f4,	%f14
	edge16l	%g1,	%g5,	%g6
	siam	0x5
	mova	%xcc,	%o7,	%i0
	sra	%o6,	%l6,	%i2
	ldsb	[%l7 + 0x69],	%o1
	fmovdvs	%icc,	%f0,	%f7
	subccc	%g2,	%i6,	%o2
	movg	%icc,	%l1,	%l3
	smul	%i1,	%l2,	%i5
	ldub	[%l7 + 0x55],	%o4
	andn	%l4,	%o5,	%i3
	andncc	%g7,	%i4,	%g4
	array32	%l0,	%i7,	%o0
	umulcc	%g3,	0x1F6B,	%o3
	ldx	[%l7 + 0x48],	%g1
	sdiv	%g5,	0x04CD,	%g6
	udiv	%o7,	0x1B45,	%i0
	ldd	[%l7 + 0x10],	%l4
	fnand	%f12,	%f2,	%f0
	xorcc	%o6,	0x1105,	%i2
	movpos	%icc,	%l6,	%g2
	fzeros	%f7
	edge32ln	%o1,	%o2,	%l1
	ld	[%l7 + 0x40],	%f11
	fmuld8sux16	%f5,	%f4,	%f12
	fmovs	%f9,	%f13
	movl	%xcc,	%i6,	%l3
	movvc	%xcc,	%l2,	%i5
	fmovdpos	%xcc,	%f11,	%f7
	fmovrdlz	%i1,	%f0,	%f4
	edge32ln	%l4,	%o5,	%i3
	move	%icc,	%o4,	%i4
	fones	%f11
	movrne	%g4,	%g7,	%i7
	edge16ln	%l0,	%o0,	%g3
	fnegd	%f12,	%f6
	ldub	[%l7 + 0x2B],	%o3
	movl	%icc,	%g5,	%g6
	movge	%icc,	%g1,	%o7
	ldub	[%l7 + 0x7C],	%l5
	std	%f8,	[%l7 + 0x08]
	umulcc	%i0,	%o6,	%l6
	fmuld8sux16	%f0,	%f11,	%f2
	udiv	%i2,	0x036B,	%g2
	orn	%o1,	%l1,	%i6
	fmuld8sux16	%f9,	%f8,	%f14
	fmovrdgez	%o2,	%f12,	%f6
	fpadd32s	%f0,	%f11,	%f1
	fmovdne	%icc,	%f3,	%f7
	edge8n	%l3,	%l2,	%i5
	srl	%l4,	0x0E,	%o5
	fmovdle	%icc,	%f6,	%f2
	orcc	%i3,	%i1,	%o4
	udiv	%i4,	0x13A8,	%g4
	sub	%i7,	0x1D59,	%l0
	umul	%g7,	0x1FBE,	%g3
	edge16ln	%o3,	%g5,	%o0
	mova	%icc,	%g6,	%o7
	fmovsle	%icc,	%f2,	%f2
	movle	%xcc,	%l5,	%g1
	sethi	0x05D4,	%i0
	alignaddrl	%o6,	%l6,	%g2
	edge16l	%o1,	%l1,	%i2
	addccc	%o2,	%i6,	%l2
	edge8	%i5,	%l4,	%l3
	fxor	%f4,	%f6,	%f14
	ldsh	[%l7 + 0x70],	%o5
	umul	%i3,	0x1CB8,	%o4
	xnorcc	%i1,	%i4,	%i7
	udivcc	%g4,	0x15BB,	%g7
	fmovsa	%icc,	%f0,	%f7
	movn	%icc,	%g3,	%o3
	addc	%l0,	0x0FBC,	%o0
	ldx	[%l7 + 0x50],	%g5
	edge32ln	%g6,	%l5,	%g1
	lduh	[%l7 + 0x4E],	%o7
	orn	%o6,	%l6,	%i0
	fnegd	%f2,	%f10
	movleu	%xcc,	%o1,	%l1
	ldsh	[%l7 + 0x0C],	%i2
	movneg	%xcc,	%g2,	%i6
	alignaddrl	%o2,	%i5,	%l4
	restore %l2, 0x112B, %l3
	std	%f14,	[%l7 + 0x38]
	xnor	%o5,	0x19CF,	%i3
	umulcc	%o4,	%i1,	%i7
	movrlz	%i4,	%g4,	%g7
	ldd	[%l7 + 0x48],	%g2
	move	%xcc,	%l0,	%o0
	ldub	[%l7 + 0x52],	%g5
	edge16n	%g6,	%o3,	%l5
	orncc	%g1,	0x036E,	%o7
	movre	%o6,	0x177,	%i0
	fmul8sux16	%f10,	%f4,	%f14
	fmovsvc	%xcc,	%f0,	%f7
	xnor	%l6,	0x0F79,	%o1
	ldd	[%l7 + 0x30],	%i2
	udivcc	%g2,	0x0582,	%l1
	fmovdne	%xcc,	%f13,	%f11
	edge16ln	%o2,	%i5,	%l4
	addccc	%l2,	%l3,	%i6
	srlx	%o5,	%i3,	%o4
	ldsb	[%l7 + 0x0E],	%i7
	fcmple32	%f4,	%f0,	%i1
	fmovsneg	%icc,	%f10,	%f8
	addccc	%g4,	0x11FB,	%g7
	alignaddr	%g3,	%i4,	%o0
	sdivx	%l0,	0x0CED,	%g5
	array16	%o3,	%l5,	%g6
	umulcc	%g1,	%o6,	%o7
	st	%f8,	[%l7 + 0x0C]
	fcmpes	%fcc0,	%f5,	%f15
	smul	%i0,	0x1011,	%l6
	subccc	%i2,	0x11AD,	%o1
	st	%f2,	[%l7 + 0x40]
	st	%f10,	[%l7 + 0x30]
	edge16ln	%g2,	%l1,	%o2
	movl	%icc,	%l4,	%i5
	movl	%icc,	%l3,	%i6
	xnor	%l2,	%o5,	%o4
	fpsub16s	%f8,	%f1,	%f11
	array8	%i7,	%i1,	%i3
	edge32ln	%g4,	%g7,	%g3
	sdiv	%i4,	0x0BFF,	%l0
	subccc	%o0,	%g5,	%l5
	addccc	%o3,	0x09E4,	%g6
	mulx	%g1,	%o7,	%i0
	sdivx	%l6,	0x12A8,	%i2
	srl	%o1,	0x1B,	%o6
	movrne	%g2,	0x000,	%l1
	std	%f6,	[%l7 + 0x70]
	movrgez	%o2,	0x012,	%i5
	sethi	0x1773,	%l3
	srl	%l4,	%l2,	%o5
	movn	%icc,	%o4,	%i7
	orncc	%i6,	%i1,	%i3
	ldub	[%l7 + 0x3D],	%g4
	ldub	[%l7 + 0x3E],	%g3
	movre	%g7,	%l0,	%o0
	sllx	%g5,	%l5,	%o3
	xorcc	%g6,	0x1FA6,	%g1
	fmovsleu	%icc,	%f10,	%f6
	and	%o7,	%i0,	%i4
	movg	%icc,	%l6,	%i2
	ldsb	[%l7 + 0x46],	%o1
	edge8n	%o6,	%l1,	%g2
	popc	%o2,	%l3
	udivx	%l4,	0x04E7,	%i5
	movneg	%xcc,	%o5,	%o4
	subcc	%l2,	%i6,	%i7
	fsrc2	%f6,	%f2
	edge8n	%i1,	%i3,	%g3
	fnors	%f14,	%f12,	%f2
	stb	%g4,	[%l7 + 0x6F]
	st	%f5,	[%l7 + 0x14]
	mova	%xcc,	%l0,	%g7
	movle	%icc,	%o0,	%g5
	movn	%icc,	%l5,	%o3
	movcc	%xcc,	%g1,	%o7
	sethi	0x00C6,	%g6
	std	%f4,	[%l7 + 0x60]
	movpos	%icc,	%i4,	%l6
	movvc	%icc,	%i2,	%i0
	movleu	%xcc,	%o6,	%o1
	sll	%g2,	%o2,	%l3
	movrlez	%l4,	0x06A,	%l1
	xnor	%o5,	%i5,	%l2
	and	%o4,	%i7,	%i1
	fmovsl	%xcc,	%f8,	%f7
	move	%xcc,	%i6,	%i3
	fandnot1s	%f0,	%f13,	%f5
	xnor	%g4,	%g3,	%g7
	movn	%xcc,	%l0,	%o0
	andcc	%l5,	0x0AC2,	%g5
	fmovs	%f11,	%f3
	andn	%g1,	%o7,	%g6
	ldx	[%l7 + 0x40],	%i4
	and	%l6,	0x0B9C,	%o3
	ld	[%l7 + 0x10],	%f8
	fornot1	%f0,	%f10,	%f8
	sdivcc	%i2,	0x1E60,	%i0
	movne	%icc,	%o1,	%g2
	stx	%o2,	[%l7 + 0x60]
	movle	%icc,	%o6,	%l3
	movg	%icc,	%l1,	%o5
	andcc	%i5,	0x19AC,	%l2
	and	%l4,	%o4,	%i1
	udiv	%i7,	0x1F15,	%i6
	orcc	%i3,	0x0C4A,	%g4
	edge16	%g7,	%l0,	%g3
	edge16l	%o0,	%l5,	%g5
	fpadd16	%f0,	%f2,	%f14
	sdivx	%o7,	0x163A,	%g1
	udivx	%g6,	0x1D5B,	%l6
	edge8l	%i4,	%i2,	%i0
	fnegs	%f3,	%f8
	subc	%o3,	%g2,	%o2
	udivx	%o1,	0x0FF2,	%o6
	movre	%l3,	0x3FC,	%o5
	mulx	%l1,	%l2,	%i5
	udivcc	%o4,	0x0599,	%l4
	edge32n	%i7,	%i1,	%i3
	movne	%icc,	%i6,	%g7
	andn	%g4,	0x1CA0,	%l0
	movgu	%icc,	%o0,	%l5
	xor	%g5,	0x0826,	%g3
	ldx	[%l7 + 0x20],	%o7
	umul	%g1,	0x1FA9,	%g6
	movcs	%xcc,	%l6,	%i4
	udiv	%i0,	0x1735,	%o3
	mulx	%g2,	0x11FF,	%i2
	ldd	[%l7 + 0x40],	%f14
	sra	%o1,	%o6,	%o2
	fmovrslez	%o5,	%f7,	%f5
	fmovdneg	%icc,	%f10,	%f11
	sub	%l1,	%l3,	%l2
	lduh	[%l7 + 0x52],	%o4
	fpackfix	%f12,	%f6
	fmovdge	%icc,	%f3,	%f14
	orn	%l4,	%i5,	%i7
	ldub	[%l7 + 0x12],	%i1
	sll	%i3,	0x0B,	%g7
	udivx	%g4,	0x01EC,	%i6
	fmovd	%f14,	%f4
	smulcc	%o0,	0x1928,	%l0
	sethi	0x0AA3,	%g5
	edge16n	%g3,	%l5,	%o7
	sdivx	%g6,	0x1B43,	%l6
	fmovscs	%xcc,	%f13,	%f0
	stx	%i4,	[%l7 + 0x68]
	udiv	%i0,	0x0015,	%g1
	edge32ln	%g2,	%o3,	%i2
	srlx	%o6,	0x04,	%o2
	fmul8sux16	%f0,	%f14,	%f10
	fnegd	%f4,	%f10
	xorcc	%o5,	0x1BB8,	%l1
	subccc	%o1,	0x1009,	%l2
	smulcc	%l3,	%l4,	%i5
	bshuffle	%f8,	%f0,	%f2
	fnegs	%f4,	%f12
	fnor	%f0,	%f6,	%f12
	stx	%i7,	[%l7 + 0x68]
	fmovsa	%xcc,	%f12,	%f14
	fmovdle	%xcc,	%f10,	%f5
	xor	%o4,	0x115C,	%i1
	alignaddrl	%i3,	%g4,	%i6
	subccc	%g7,	0x0F0E,	%l0
	ldx	[%l7 + 0x18],	%g5
	fmovdn	%icc,	%f0,	%f14
	fnor	%f10,	%f6,	%f14
	fnot1	%f6,	%f4
	movle	%xcc,	%g3,	%l5
	movrne	%o7,	%g6,	%l6
	sra	%i4,	0x03,	%i0
	andncc	%o0,	%g2,	%o3
	movvs	%icc,	%i2,	%g1
	fmul8x16al	%f3,	%f8,	%f6
	movge	%icc,	%o2,	%o5
	srax	%l1,	%o1,	%l2
	fmovrslz	%o6,	%f6,	%f15
	edge32	%l3,	%i5,	%l4
	movvc	%icc,	%o4,	%i7
	movleu	%xcc,	%i3,	%g4
	ldd	[%l7 + 0x40],	%i0
	fcmple32	%f6,	%f10,	%g7
	subccc	%i6,	%l0,	%g3
	ldub	[%l7 + 0x5B],	%l5
	smul	%o7,	0x0F46,	%g6
	fmovsgu	%icc,	%f13,	%f3
	xnor	%l6,	0x1453,	%g5
	movpos	%xcc,	%i0,	%i4
	fmovsl	%icc,	%f8,	%f15
	array32	%o0,	%o3,	%g2
	sdivx	%i2,	0x05F1,	%o2
	movge	%xcc,	%o5,	%l1
	edge16ln	%g1,	%l2,	%o6
	movrne	%o1,	0x0AB,	%i5
	movcc	%xcc,	%l3,	%o4
	movvs	%xcc,	%l4,	%i7
	fpackfix	%f2,	%f3
	edge8n	%g4,	%i3,	%g7
	subcc	%i6,	0x1EBD,	%i1
	save %l0, 0x1AEC, %g3
	fcmps	%fcc1,	%f8,	%f13
	movn	%xcc,	%o7,	%g6
	add	%l6,	%g5,	%i0
	udivx	%l5,	0x183E,	%i4
	edge32n	%o0,	%g2,	%o3
	movge	%icc,	%o2,	%i2
	stx	%o5,	[%l7 + 0x48]
	fmovspos	%xcc,	%f0,	%f15
	srl	%g1,	0x13,	%l2
	move	%icc,	%o6,	%o1
	andcc	%i5,	%l1,	%o4
	ldsw	[%l7 + 0x18],	%l4
	xorcc	%i7,	%l3,	%g4
	edge16n	%g7,	%i3,	%i6
	fnot2	%f12,	%f12
	alignaddrl	%l0,	%i1,	%g3
	for	%f10,	%f12,	%f14
	stw	%o7,	[%l7 + 0x3C]
	edge16ln	%g6,	%l6,	%g5
	stx	%l5,	[%l7 + 0x38]
	andn	%i4,	%o0,	%g2
	xor	%o3,	0x19D6,	%i0
	fsrc2s	%f2,	%f10
	ldd	[%l7 + 0x20],	%f10
	mova	%icc,	%o2,	%i2
	and	%o5,	%l2,	%o6
	orncc	%o1,	%i5,	%g1
	ldsh	[%l7 + 0x56],	%l1
	mulscc	%l4,	0x0345,	%i7
	xnor	%l3,	0x0CBD,	%g4
	ldsw	[%l7 + 0x30],	%o4
	edge32	%g7,	%i6,	%l0
	movgu	%xcc,	%i3,	%g3
	fmovrdgez	%i1,	%f0,	%f12
	alignaddr	%o7,	%g6,	%l6
	movn	%xcc,	%g5,	%l5
	ldx	[%l7 + 0x60],	%i4
	fmovrde	%o0,	%f4,	%f4
	fandnot1	%f4,	%f14,	%f12
	udiv	%o3,	0x1783,	%i0
	array16	%o2,	%g2,	%o5
	ldsw	[%l7 + 0x54],	%l2
	edge8l	%o6,	%i2,	%i5
	and	%o1,	%l1,	%g1
	movne	%icc,	%l4,	%l3
	edge16n	%i7,	%o4,	%g4
	srlx	%g7,	%l0,	%i3
	array16	%i6,	%i1,	%g3
	smulcc	%g6,	%l6,	%g5
	ldsw	[%l7 + 0x50],	%l5
	udivx	%i4,	0x1023,	%o7
	edge32ln	%o0,	%o3,	%i0
	std	%f2,	[%l7 + 0x78]
	movrgz	%g2,	0x0DE,	%o5
	ldub	[%l7 + 0x22],	%o2
	edge8ln	%o6,	%l2,	%i2
	fmovdvs	%icc,	%f2,	%f9
	array8	%i5,	%o1,	%g1
	fmovscc	%xcc,	%f2,	%f3
	and	%l1,	%l4,	%i7
	fxors	%f2,	%f1,	%f14
	sdivcc	%l3,	0x08AA,	%g4
	sth	%g7,	[%l7 + 0x32]
	movn	%xcc,	%o4,	%i3
	array32	%l0,	%i1,	%i6
	subccc	%g6,	%g3,	%g5
	edge32ln	%l5,	%l6,	%o7
	umulcc	%o0,	%o3,	%i4
	fnegs	%f12,	%f8
	edge32l	%i0,	%g2,	%o5
	ldx	[%l7 + 0x48],	%o2
	movrne	%l2,	0x32D,	%i2
	fone	%f10
	std	%f6,	[%l7 + 0x78]
	xor	%i5,	0x1D66,	%o6
	movleu	%icc,	%o1,	%l1
	smul	%g1,	%i7,	%l4
	srlx	%g4,	%l3,	%o4
	srl	%g7,	%l0,	%i1
	sll	%i6,	%i3,	%g3
	ldd	[%l7 + 0x50],	%g4
	fmovscc	%xcc,	%f10,	%f15
	subccc	%g6,	%l5,	%l6
	fnand	%f2,	%f10,	%f14
	ld	[%l7 + 0x14],	%f14
	fmovs	%f15,	%f10
	stb	%o7,	[%l7 + 0x53]
	move	%xcc,	%o0,	%i4
	smul	%o3,	%g2,	%o5
	edge16l	%i0,	%l2,	%o2
	xnorcc	%i2,	%i5,	%o1
	movrlz	%o6,	%g1,	%i7
	sethi	0x05BA,	%l1
	fmovrdlez	%l4,	%f2,	%f6
	udiv	%l3,	0x012D,	%o4
	orncc	%g4,	0x1477,	%l0
	fnands	%f3,	%f7,	%f10
	edge8	%g7,	%i1,	%i3
	std	%f0,	[%l7 + 0x10]
	movne	%icc,	%g3,	%g5
	fmul8ulx16	%f12,	%f0,	%f14
	orn	%i6,	%l5,	%g6
	fmovrsgez	%l6,	%f10,	%f10
	sdivx	%o0,	0x0B21,	%o7
	array32	%o3,	%i4,	%o5
	movrlez	%g2,	0x076,	%i0
	fmovrslz	%o2,	%f14,	%f9
	edge8l	%i2,	%i5,	%l2
	fcmpd	%fcc1,	%f14,	%f0
	fmul8x16au	%f14,	%f8,	%f0
	sth	%o1,	[%l7 + 0x5C]
	orn	%o6,	%g1,	%l1
	ldsb	[%l7 + 0x0B],	%l4
	movcc	%xcc,	%l3,	%o4
	smul	%g4,	%l0,	%g7
	sllx	%i1,	0x1A,	%i7
	edge32l	%i3,	%g3,	%i6
	ldx	[%l7 + 0x78],	%l5
	fpadd32s	%f11,	%f13,	%f0
	udiv	%g6,	0x1A0A,	%g5
	fcmpeq32	%f6,	%f10,	%o0
	fmovdvc	%xcc,	%f0,	%f5
	fornot2	%f14,	%f6,	%f12
	fmovdleu	%icc,	%f13,	%f8
	subcc	%l6,	0x08D2,	%o3
	movg	%xcc,	%o7,	%i4
	ld	[%l7 + 0x54],	%f0
	fmovdcc	%xcc,	%f2,	%f5
	fmovsvc	%icc,	%f3,	%f13
	movpos	%xcc,	%o5,	%i0
	move	%icc,	%g2,	%o2
	fmovdneg	%xcc,	%f13,	%f13
	fmovscc	%xcc,	%f9,	%f3
	ldsw	[%l7 + 0x10],	%i2
	and	%l2,	%i5,	%o1
	ldsw	[%l7 + 0x30],	%g1
	movle	%xcc,	%o6,	%l1
	sub	%l3,	%o4,	%l4
	subcc	%l0,	0x1388,	%g7
	fmovscc	%xcc,	%f10,	%f2
	fmovsle	%icc,	%f1,	%f3
	movpos	%xcc,	%g4,	%i1
	movle	%xcc,	%i3,	%g3
	edge16n	%i6,	%l5,	%g6
	ldd	[%l7 + 0x70],	%i6
	fmul8x16	%f0,	%f10,	%f10
	xor	%g5,	0x1C1A,	%l6
	fmovsle	%xcc,	%f8,	%f2
	mulscc	%o3,	%o0,	%i4
	udivcc	%o7,	0x1D08,	%o5
	and	%i0,	0x1DF0,	%o2
	subc	%g2,	%l2,	%i5
	bshuffle	%f0,	%f14,	%f0
	edge32n	%i2,	%o1,	%g1
	fpadd16	%f8,	%f2,	%f0
	fpadd32	%f12,	%f2,	%f14
	lduh	[%l7 + 0x34],	%o6
	edge8ln	%l3,	%o4,	%l4
	addccc	%l1,	0x1B27,	%g7
	andcc	%g4,	%i1,	%i3
	edge32ln	%g3,	%i6,	%l0
	movpos	%icc,	%l5,	%g6
	smulcc	%i7,	0x0160,	%l6
	movle	%icc,	%g5,	%o3
	sdiv	%o0,	0x07B0,	%o7
	add	%i4,	%o5,	%i0
	movrgez	%o2,	%g2,	%i5
	movpos	%xcc,	%i2,	%l2
	srax	%o1,	%o6,	%l3
	movre	%o4,	%g1,	%l1
	mulscc	%l4,	0x12E6,	%g7
	fxors	%f13,	%f1,	%f1
	addc	%i1,	%g4,	%g3
	smulcc	%i3,	%l0,	%i6
	udivx	%l5,	0x10E1,	%g6
	ld	[%l7 + 0x38],	%f0
	movn	%icc,	%l6,	%i7
	fmovdpos	%xcc,	%f10,	%f9
	srl	%o3,	%o0,	%o7
	fexpand	%f2,	%f2
	edge8l	%i4,	%o5,	%g5
	fnands	%f15,	%f14,	%f14
	move	%xcc,	%o2,	%i0
	stx	%i5,	[%l7 + 0x78]
	mova	%xcc,	%g2,	%l2
	fxors	%f6,	%f15,	%f13
	subcc	%i2,	%o1,	%o6
	sdiv	%l3,	0x0FC8,	%o4
	fnot1s	%f1,	%f3
	movn	%icc,	%l1,	%l4
	orcc	%g7,	0x08E3,	%i1
	smulcc	%g1,	0x083E,	%g3
	ldx	[%l7 + 0x10],	%i3
	andn	%l0,	0x09A6,	%g4
	movcs	%icc,	%i6,	%g6
	fmovsneg	%icc,	%f13,	%f9
	movleu	%xcc,	%l6,	%l5
	edge32l	%o3,	%i7,	%o7
	sethi	0x1D58,	%i4
	orn	%o5,	0x023A,	%o0
	fpsub16	%f4,	%f10,	%f4
	ldd	[%l7 + 0x78],	%f10
	udiv	%g5,	0x1ECD,	%i0
	fnands	%f3,	%f3,	%f8
	andcc	%i5,	%g2,	%l2
	sub	%o2,	%o1,	%o6
	subcc	%i2,	0x17B3,	%o4
	lduw	[%l7 + 0x5C],	%l1
	fpsub32	%f4,	%f0,	%f14
	fmovdl	%xcc,	%f2,	%f3
	addccc	%l4,	%g7,	%i1
	fmuld8ulx16	%f9,	%f8,	%f2
	subccc	%l3,	%g3,	%i3
	xor	%g1,	%g4,	%l0
	array16	%i6,	%l6,	%g6
	andn	%o3,	0x162C,	%i7
	fxnor	%f2,	%f4,	%f4
	edge8n	%o7,	%l5,	%o5
	movg	%xcc,	%o0,	%g5
	or	%i4,	0x04E4,	%i0
	ldd	[%l7 + 0x20],	%g2
	subc	%l2,	0x0234,	%i5
	orn	%o1,	0x1671,	%o2
	fmovrslez	%o6,	%f2,	%f3
	sra	%i2,	%o4,	%l4
	lduh	[%l7 + 0x76],	%g7
	ldd	[%l7 + 0x48],	%l0
	and	%i1,	0x176E,	%l3
	umul	%g3,	0x1B81,	%i3
	movrlez	%g1,	0x33E,	%l0
	movne	%xcc,	%i6,	%g4
	sth	%g6,	[%l7 + 0x74]
	for	%f0,	%f10,	%f14
	ldsw	[%l7 + 0x44],	%l6
	fmovsne	%xcc,	%f2,	%f11
	fmovrdgez	%o3,	%f4,	%f2
	sethi	0x025F,	%i7
	movpos	%icc,	%o7,	%o5
	movle	%xcc,	%o0,	%l5
	movrgz	%g5,	0x071,	%i0
	fornot2s	%f2,	%f15,	%f5
	move	%icc,	%g2,	%l2
	smulcc	%i5,	0x19EA,	%i4
	movn	%xcc,	%o1,	%o2
	sdiv	%i2,	0x0F4E,	%o4
	array32	%l4,	%g7,	%o6
	sll	%i1,	0x1D,	%l1
	add	%g3,	%i3,	%l3
	fmovsgu	%xcc,	%f14,	%f0
	st	%f5,	[%l7 + 0x0C]
	andcc	%g1,	%l0,	%g4
	fmul8x16al	%f11,	%f15,	%f14
	edge8	%i6,	%l6,	%g6
	fnands	%f10,	%f5,	%f15
	movg	%icc,	%i7,	%o3
	movn	%icc,	%o7,	%o0
	fnands	%f8,	%f2,	%f6
	stw	%l5,	[%l7 + 0x5C]
	smul	%o5,	%g5,	%i0
	or	%l2,	0x06F8,	%g2
	fmovdneg	%xcc,	%f10,	%f7
	mulx	%i5,	%o1,	%o2
	fmovsl	%xcc,	%f3,	%f15
	subcc	%i4,	0x1298,	%i2
	fmovsn	%icc,	%f13,	%f10
	subc	%o4,	0x13D8,	%g7
	udivx	%l4,	0x1DC7,	%o6
	edge16n	%i1,	%g3,	%i3
	subcc	%l3,	%g1,	%l1
	xnorcc	%l0,	%i6,	%g4
	fmovse	%xcc,	%f7,	%f9
	sll	%l6,	%g6,	%i7
	fcmple16	%f0,	%f10,	%o3
	fpsub32s	%f4,	%f15,	%f14
	ld	[%l7 + 0x18],	%f9
	array8	%o0,	%l5,	%o5
	mova	%icc,	%o7,	%g5
	mova	%xcc,	%i0,	%g2
	smul	%i5,	0x195A,	%o1
	stx	%o2,	[%l7 + 0x30]
	smulcc	%i4,	0x0CE1,	%l2
	addcc	%i2,	%g7,	%o4
	edge32	%o6,	%l4,	%g3
	stb	%i1,	[%l7 + 0x56]
	fcmpd	%fcc3,	%f6,	%f6
	orn	%i3,	%g1,	%l1
	movne	%icc,	%l3,	%i6
	sdivcc	%l0,	0x1931,	%l6
	fpsub32	%f14,	%f4,	%f2
	orcc	%g6,	0x1514,	%i7
	mulx	%g4,	%o0,	%o3
	stx	%l5,	[%l7 + 0x78]
	edge32n	%o5,	%o7,	%i0
	std	%f12,	[%l7 + 0x60]
	move	%xcc,	%g2,	%i5
	fmovdvs	%icc,	%f7,	%f3
	movne	%xcc,	%g5,	%o2
	alignaddr	%i4,	%l2,	%i2
	sdiv	%g7,	0x06CD,	%o4
	fmovrde	%o6,	%f2,	%f8
	popc	0x12AA,	%l4
	xor	%g3,	%o1,	%i1
	edge8ln	%g1,	%i3,	%l3
	restore %l1, %i6, %l0
	fnors	%f1,	%f13,	%f8
	sth	%g6,	[%l7 + 0x5C]
	fmovsneg	%icc,	%f9,	%f2
	bshuffle	%f0,	%f4,	%f8
	fornot2s	%f11,	%f14,	%f10
	addcc	%l6,	%g4,	%i7
	movrgez	%o0,	0x290,	%l5
	andcc	%o3,	0x1F45,	%o7
	orn	%i0,	%o5,	%i5
	movcc	%xcc,	%g2,	%g5
	movl	%icc,	%i4,	%l2
	fmovsleu	%xcc,	%f15,	%f12
	fnot2s	%f12,	%f4
	movg	%xcc,	%i2,	%g7
	subcc	%o4,	0x1F09,	%o2
	orcc	%l4,	%g3,	%o6
	edge8l	%i1,	%o1,	%i3
	movre	%l3,	0x270,	%l1
	st	%f3,	[%l7 + 0x50]
	movn	%icc,	%i6,	%g1
	edge32n	%g6,	%l6,	%l0
	movcs	%xcc,	%g4,	%i7
	movge	%xcc,	%o0,	%o3
	sdivcc	%l5,	0x0536,	%o7
	fnot1s	%f7,	%f15
	movgu	%xcc,	%i0,	%o5
	sdiv	%i5,	0x1650,	%g2
	movrlez	%i4,	%l2,	%i2
	movgu	%icc,	%g5,	%g7
	movcc	%icc,	%o2,	%o4
	ldsh	[%l7 + 0x1A],	%l4
	udiv	%g3,	0x19DE,	%i1
	array8	%o6,	%i3,	%o1
	fmovdpos	%xcc,	%f10,	%f15
	movge	%xcc,	%l3,	%l1
	mulscc	%g1,	0x0B53,	%g6
	sdivx	%l6,	0x0FC6,	%i6
	subc	%l0,	%i7,	%o0
	sub	%g4,	%o3,	%l5
	fabsd	%f8,	%f14
	movrne	%o7,	%i0,	%o5
	srax	%g2,	0x11,	%i4
	lduh	[%l7 + 0x32],	%l2
	fors	%f7,	%f7,	%f7
	edge16	%i2,	%i5,	%g7
	edge8n	%o2,	%g5,	%l4
	umulcc	%g3,	%o4,	%o6
	umul	%i3,	0x015F,	%i1
	fmul8sux16	%f14,	%f2,	%f8
	edge16n	%l3,	%l1,	%o1
	xnorcc	%g1,	0x13E2,	%g6
	edge16n	%i6,	%l6,	%i7
	edge16ln	%l0,	%g4,	%o0
	mulx	%l5,	0x0427,	%o3
	movpos	%icc,	%o7,	%o5
	fcmple16	%f2,	%f4,	%g2
	sth	%i0,	[%l7 + 0x78]
	movl	%xcc,	%i4,	%i2
	udivx	%l2,	0x1842,	%g7
	udiv	%o2,	0x1901,	%g5
	orcc	%i5,	0x0F5D,	%g3
	siam	0x1
	xnorcc	%o4,	%l4,	%o6
	fabsd	%f8,	%f0
	fzero	%f12
	move	%icc,	%i3,	%i1
	fpsub16s	%f4,	%f12,	%f8
	fsrc2	%f8,	%f8
	edge32l	%l1,	%l3,	%o1
	sdivx	%g6,	0x056F,	%i6
	restore %g1, %l6, %i7
	move	%icc,	%g4,	%l0
	movneg	%xcc,	%o0,	%o3
	ld	[%l7 + 0x7C],	%f11
	subc	%o7,	0x04EC,	%o5
	orncc	%g2,	%i0,	%i4
	movcs	%icc,	%i2,	%l2
	sdivcc	%l5,	0x10CC,	%g7
	andcc	%o2,	%i5,	%g3
	fmovrsgz	%g5,	%f1,	%f0
	ld	[%l7 + 0x2C],	%f13
	movvc	%icc,	%l4,	%o4
	edge8n	%o6,	%i1,	%i3
	fmovsg	%xcc,	%f0,	%f14
	subcc	%l1,	0x0FA2,	%l3
	edge16ln	%o1,	%i6,	%g6
	lduw	[%l7 + 0x34],	%g1
	movcc	%icc,	%l6,	%i7
	ldsh	[%l7 + 0x16],	%l0
	movn	%xcc,	%o0,	%g4
	stb	%o7,	[%l7 + 0x3B]
	movg	%icc,	%o3,	%g2
	sdivx	%i0,	0x165E,	%i4
	orcc	%i2,	%l2,	%o5
	edge8l	%g7,	%o2,	%i5
	st	%f8,	[%l7 + 0x70]
	fexpand	%f3,	%f0
	edge32	%l5,	%g3,	%l4
	add	%g5,	0x00FE,	%o4
	move	%icc,	%i1,	%o6
	movvc	%xcc,	%i3,	%l3
	save %l1, %i6, %o1
	edge16l	%g6,	%g1,	%l6
	ldd	[%l7 + 0x38],	%l0
	edge32n	%o0,	%i7,	%o7
	xnor	%g4,	%g2,	%i0
	fand	%f6,	%f2,	%f10
	fandnot2	%f4,	%f6,	%f4
	stx	%i4,	[%l7 + 0x08]
	edge32n	%i2,	%l2,	%o3
	restore %o5, %o2, %g7
	smul	%i5,	0x06CA,	%g3
	movrlz	%l5,	%g5,	%o4
	orncc	%i1,	%l4,	%i3
	fnot1	%f4,	%f4
	alignaddrl	%o6,	%l1,	%l3
	sub	%i6,	%o1,	%g1
	fxor	%f4,	%f10,	%f2
	fcmpgt16	%f10,	%f6,	%l6
	fornot1s	%f6,	%f0,	%f8
	xor	%g6,	%o0,	%l0
	movg	%icc,	%i7,	%g4
	fmovrsgez	%o7,	%f1,	%f15
	movcs	%xcc,	%i0,	%i4
	smul	%i2,	0x0C2F,	%l2
	sdiv	%g2,	0x0300,	%o5
	edge16l	%o3,	%g7,	%o2
	udiv	%i5,	0x1D4D,	%l5
	edge32n	%g5,	%o4,	%i1
	fornot1	%f6,	%f4,	%f10
	movle	%icc,	%g3,	%i3
	movrne	%l4,	0x34E,	%l1
	umulcc	%l3,	%o6,	%i6
	umul	%o1,	0x19BF,	%l6
	umul	%g6,	%g1,	%l0
	edge16l	%o0,	%g4,	%o7
	edge16l	%i0,	%i7,	%i4
	movvc	%icc,	%l2,	%i2
	xor	%o5,	%g2,	%g7
	movle	%icc,	%o3,	%o2
	sra	%l5,	%g5,	%i5
	edge16l	%o4,	%g3,	%i3
	movre	%i1,	%l1,	%l4
	alignaddrl	%o6,	%l3,	%o1
	mulx	%i6,	0x0718,	%l6
	fmovscc	%xcc,	%f1,	%f9
	ldsw	[%l7 + 0x48],	%g6
	edge32	%l0,	%o0,	%g1
	movre	%o7,	0x314,	%g4
	fmovrsne	%i7,	%f15,	%f14
	fsrc2s	%f13,	%f2
	and	%i0,	%i4,	%i2
	add	%l2,	%g2,	%o5
	edge8ln	%g7,	%o3,	%o2
	movcs	%icc,	%g5,	%l5
	srl	%o4,	0x1A,	%i5
	mulx	%i3,	%i1,	%g3
	andcc	%l1,	%l4,	%o6
	fmovsa	%icc,	%f4,	%f2
	movneg	%icc,	%l3,	%i6
	add	%l6,	%g6,	%o1
	smul	%l0,	0x04C9,	%g1
	mova	%icc,	%o7,	%o0
	mulscc	%i7,	%i0,	%g4
	stw	%i4,	[%l7 + 0x1C]
	add	%i2,	%l2,	%g2
	fsrc1s	%f3,	%f12
	fmovrdgz	%o5,	%f14,	%f6
	movgu	%xcc,	%o3,	%g7
	ldsh	[%l7 + 0x18],	%o2
	mulscc	%g5,	0x07EA,	%l5
	subcc	%i5,	0x0310,	%o4
	sethi	0x1AD6,	%i1
	add	%g3,	0x086B,	%l1
	ld	[%l7 + 0x48],	%f1
	movcc	%icc,	%l4,	%o6
	fmul8sux16	%f2,	%f4,	%f0
	xnorcc	%i3,	0x0C36,	%l3
	movvc	%icc,	%i6,	%g6
	sll	%o1,	%l6,	%l0
	andcc	%g1,	%o0,	%o7
	edge8	%i7,	%i0,	%i4
	movn	%icc,	%g4,	%l2
	lduw	[%l7 + 0x18],	%g2
	movl	%icc,	%i2,	%o3
	fnegs	%f5,	%f2
	movre	%o5,	0x080,	%g7
	xnorcc	%o2,	0x1BAB,	%g5
	edge8ln	%l5,	%i5,	%i1
	stw	%o4,	[%l7 + 0x60]
	faligndata	%f10,	%f14,	%f10
	std	%f2,	[%l7 + 0x28]
	srlx	%l1,	%g3,	%l4
	movne	%icc,	%o6,	%i3
	ldsh	[%l7 + 0x3C],	%l3
	ldsb	[%l7 + 0x3A],	%i6
	add	%g6,	0x1878,	%o1
	xorcc	%l6,	0x01E5,	%l0
	fsrc2	%f4,	%f0
	edge16l	%g1,	%o7,	%i7
	edge8n	%i0,	%i4,	%o0
	edge32n	%l2,	%g2,	%g4
	andn	%i2,	%o3,	%g7
	ldd	[%l7 + 0x70],	%f0
	fsrc2	%f12,	%f14
	popc	0x15C0,	%o5
	srlx	%g5,	0x08,	%o2
	fmovdneg	%icc,	%f11,	%f6
	sll	%l5,	%i5,	%o4
	fpsub16s	%f1,	%f9,	%f9
	fcmpgt32	%f2,	%f0,	%i1
	lduh	[%l7 + 0x32],	%g3
	fnot2	%f10,	%f14
	edge16l	%l4,	%o6,	%l1
	ldx	[%l7 + 0x58],	%i3
	movre	%l3,	%g6,	%i6
	fmovdle	%icc,	%f2,	%f6
	xnor	%o1,	0x1B0F,	%l6
	edge32n	%g1,	%o7,	%l0
	fmovsn	%icc,	%f5,	%f14
	fmovrsne	%i7,	%f1,	%f5
	stx	%i0,	[%l7 + 0x10]
	addcc	%i4,	%o0,	%g2
	movn	%icc,	%l2,	%g4
	movcs	%icc,	%i2,	%o3
	movvs	%xcc,	%g7,	%g5
	movrgez	%o5,	%l5,	%i5
	ldub	[%l7 + 0x12],	%o4
	edge16ln	%o2,	%i1,	%l4
	ldd	[%l7 + 0x60],	%f10
	fmuld8ulx16	%f12,	%f6,	%f12
	edge8	%o6,	%g3,	%l1
	fmovdle	%xcc,	%f8,	%f1
	sub	%i3,	%g6,	%l3
	orn	%o1,	%l6,	%i6
	movrgez	%o7,	0x28D,	%l0
	sub	%i7,	0x1AA1,	%i0
	sdivcc	%g1,	0x10AA,	%i4
	array32	%g2,	%o0,	%g4
	fandnot2s	%f4,	%f9,	%f9
	alignaddrl	%i2,	%l2,	%o3
	fmovrdgz	%g5,	%f14,	%f0
	fmovsle	%xcc,	%f2,	%f11
	array32	%o5,	%g7,	%l5
	fone	%f0
	ldub	[%l7 + 0x68],	%o4
	subc	%o2,	%i5,	%l4
	movrlz	%i1,	%g3,	%l1
	fmovrde	%i3,	%f6,	%f8
	edge32	%g6,	%l3,	%o6
	fsrc1s	%f14,	%f15
	fsrc1s	%f12,	%f8
	umul	%l6,	0x1356,	%o1
	array32	%o7,	%l0,	%i7
	edge8ln	%i6,	%g1,	%i4
	xnor	%g2,	%i0,	%g4
	xor	%i2,	0x1CCB,	%l2
	fxors	%f3,	%f14,	%f6
	edge32l	%o3,	%o0,	%g5
	fmovsleu	%icc,	%f11,	%f11
	fmul8ulx16	%f0,	%f0,	%f8
	movpos	%xcc,	%o5,	%l5
	sra	%o4,	0x10,	%g7
	sll	%i5,	0x13,	%l4
	sethi	0x1BF0,	%i1
	sdivcc	%g3,	0x0D27,	%o2
	fornot2s	%f14,	%f0,	%f3
	srlx	%i3,	0x0E,	%l1
	stx	%g6,	[%l7 + 0x18]
	subccc	%l3,	0x19E9,	%o6
	ldd	[%l7 + 0x50],	%f10
	movpos	%xcc,	%l6,	%o7
	add	%l0,	%i7,	%o1
	andncc	%g1,	%i6,	%g2
	pdist	%f4,	%f6,	%f4
	ldd	[%l7 + 0x48],	%i0
	sll	%i4,	0x1C,	%g4
	fmovspos	%icc,	%f0,	%f5
	edge16n	%l2,	%i2,	%o3
	umulcc	%o0,	0x06B9,	%o5
	movge	%icc,	%l5,	%o4
	add	%g5,	0x1BBF,	%i5
	or	%l4,	0x1539,	%g7
	sth	%i1,	[%l7 + 0x32]
	movcc	%icc,	%g3,	%o2
	srlx	%l1,	0x1B,	%i3
	alignaddrl	%g6,	%o6,	%l3
	movge	%xcc,	%l6,	%o7
	fcmpgt32	%f10,	%f4,	%i7
	umul	%o1,	%g1,	%i6
	movrgz	%g2,	%l0,	%i0
	sub	%i4,	0x070D,	%l2
	move	%xcc,	%i2,	%o3
	sll	%g4,	%o0,	%l5
	ldsw	[%l7 + 0x0C],	%o4
	fexpand	%f9,	%f0
	xnorcc	%g5,	%i5,	%o5
	popc	%l4,	%g7
	lduw	[%l7 + 0x18],	%g3
	fsrc1	%f4,	%f0
	edge16l	%i1,	%l1,	%o2
	fands	%f9,	%f10,	%f8
	movne	%xcc,	%g6,	%o6
	movle	%icc,	%l3,	%i3
	mulscc	%o7,	0x1C88,	%l6
	alignaddr	%o1,	%i7,	%i6
	fmovdne	%icc,	%f1,	%f6
	fmovdpos	%icc,	%f2,	%f10
	sub	%g2,	0x1D8D,	%g1
	popc	0x0739,	%i0
	movvc	%icc,	%i4,	%l0
	andncc	%i2,	%o3,	%l2
	fmovsvc	%icc,	%f4,	%f10
	movcc	%xcc,	%o0,	%g4
	mulscc	%l5,	0x13A0,	%o4
	movcs	%icc,	%g5,	%i5
	faligndata	%f10,	%f4,	%f10
	and	%l4,	0x0038,	%g7
	edge32n	%o5,	%i1,	%l1
	udiv	%o2,	0x176E,	%g6
	addccc	%g3,	%o6,	%l3
	and	%o7,	%i3,	%l6
	sdivcc	%o1,	0x05B9,	%i6
	sllx	%i7,	0x13,	%g1
	smulcc	%g2,	0x1825,	%i0
	save %l0, %i4, %i2
	movrne	%l2,	%o0,	%o3
	movl	%icc,	%l5,	%o4
	fmovsge	%icc,	%f8,	%f13
	edge8ln	%g5,	%i5,	%g4
	movneg	%icc,	%l4,	%o5
	fmovse	%icc,	%f8,	%f2
	fmovrdgez	%i1,	%f8,	%f6
	fmuld8sux16	%f8,	%f11,	%f0
	sllx	%g7,	0x06,	%l1
	fmovdg	%icc,	%f8,	%f4
	movrgez	%g6,	%g3,	%o6
	fnot2s	%f5,	%f5
	edge8ln	%o2,	%l3,	%i3
	xnor	%l6,	0x14E4,	%o1
	edge8ln	%o7,	%i7,	%g1
	save %i6, 0x14FB, %i0
	sdivx	%l0,	0x1753,	%g2
	edge8l	%i2,	%i4,	%l2
	fmovdl	%xcc,	%f6,	%f5
	andn	%o3,	%o0,	%l5
	srlx	%g5,	%i5,	%o4
	xnor	%g4,	0x1C4C,	%o5
	fpadd16s	%f4,	%f6,	%f13
	movneg	%icc,	%l4,	%i1
	movpos	%icc,	%g7,	%l1
	fmovsgu	%icc,	%f10,	%f6
	movrne	%g6,	%g3,	%o2
	restore %l3, %o6, %i3
	fmovdneg	%icc,	%f6,	%f4
	ldsh	[%l7 + 0x52],	%o1
	sdiv	%l6,	0x0253,	%i7
	movcs	%xcc,	%g1,	%i6
	fornot2s	%f10,	%f1,	%f4
	fmovda	%icc,	%f11,	%f0
	movne	%icc,	%o7,	%i0
	movle	%icc,	%g2,	%i2
	addcc	%l0,	%i4,	%o3
	and	%o0,	0x1368,	%l5
	movcs	%xcc,	%g5,	%i5
	movl	%icc,	%o4,	%l2
	siam	0x7
	xnor	%g4,	%o5,	%i1
	move	%xcc,	%g7,	%l4
	udivcc	%l1,	0x08F2,	%g6
	fornot2	%f8,	%f8,	%f12
	subccc	%g3,	%l3,	%o2
	fcmpd	%fcc0,	%f10,	%f12
	edge32n	%i3,	%o1,	%l6
	edge8	%o6,	%g1,	%i6
	lduw	[%l7 + 0x0C],	%o7
	array32	%i7,	%g2,	%i0
	movl	%icc,	%l0,	%i2
	movcs	%xcc,	%o3,	%o0
	udiv	%i4,	0x1FBA,	%g5
	edge32	%l5,	%o4,	%i5
	movn	%xcc,	%g4,	%l2
	edge16	%i1,	%o5,	%l4
	edge8l	%l1,	%g7,	%g3
	fands	%f7,	%f4,	%f6
	fpadd32s	%f8,	%f6,	%f14
	subccc	%g6,	%l3,	%i3
	edge8n	%o1,	%l6,	%o2
	movn	%xcc,	%g1,	%o6
	edge8l	%o7,	%i6,	%i7
	sub	%i0,	0x0631,	%l0
	edge16	%g2,	%o3,	%i2
	movge	%icc,	%i4,	%o0
	fmovsvs	%xcc,	%f3,	%f0
	fmovdge	%icc,	%f5,	%f5
	fnot1s	%f10,	%f8
	subc	%g5,	%l5,	%o4
	xnor	%i5,	0x144B,	%g4
	fcmple32	%f4,	%f12,	%i1
	array8	%o5,	%l2,	%l4
	ldub	[%l7 + 0x1D],	%l1
	movrgz	%g3,	%g6,	%l3
	fnor	%f2,	%f6,	%f8
	subccc	%i3,	%g7,	%l6
	stw	%o1,	[%l7 + 0x1C]
	add	%g1,	%o2,	%o7
	fmovd	%f14,	%f4
	andcc	%o6,	%i6,	%i7
	edge8l	%i0,	%g2,	%o3
	udivcc	%i2,	0x1FA1,	%l0
	srl	%o0,	%g5,	%i4
	movrlz	%l5,	0x2E6,	%i5
	alignaddrl	%g4,	%i1,	%o5
	smulcc	%o4,	0x1A83,	%l2
	lduh	[%l7 + 0x2E],	%l4
	mova	%xcc,	%l1,	%g3
	stb	%l3,	[%l7 + 0x6E]
	array16	%i3,	%g7,	%l6
	fmul8x16al	%f6,	%f13,	%f12
	edge16	%o1,	%g6,	%o2
	fmovs	%f2,	%f2
	fnors	%f12,	%f0,	%f10
	edge16n	%g1,	%o6,	%o7
	xnorcc	%i6,	%i7,	%g2
	srlx	%i0,	%o3,	%l0
	addc	%i2,	0x1426,	%g5
	faligndata	%f10,	%f10,	%f0
	andcc	%o0,	0x0BE5,	%i4
	smul	%i5,	%g4,	%l5
	ldub	[%l7 + 0x5A],	%o5
	ldd	[%l7 + 0x28],	%f0
	fmovdge	%xcc,	%f1,	%f9
	ldsb	[%l7 + 0x0F],	%i1
	subcc	%o4,	0x1DF8,	%l2
	fmovdleu	%xcc,	%f1,	%f4
	sdivcc	%l4,	0x0261,	%g3
	movpos	%icc,	%l3,	%l1
	udivcc	%g7,	0x1F1A,	%l6
	save %i3, 0x19BB, %o1
	edge32	%o2,	%g6,	%o6
	orcc	%g1,	0x1F03,	%i6
	fmovrsgez	%o7,	%f1,	%f5
	movg	%xcc,	%i7,	%i0
	orn	%o3,	%l0,	%g2
	fornot2s	%f1,	%f8,	%f11
	sdivx	%g5,	0x0A82,	%i2
	ldsh	[%l7 + 0x4C],	%i4
	fcmpgt16	%f0,	%f4,	%o0
	srax	%i5,	%g4,	%l5
	xnor	%i1,	0x023D,	%o5
	array8	%o4,	%l2,	%l4
	xorcc	%l3,	%l1,	%g3
	array16	%g7,	%l6,	%o1
	orncc	%o2,	%g6,	%i3
	array8	%o6,	%i6,	%g1
	edge32	%i7,	%o7,	%o3
	srlx	%l0,	%g2,	%i0
	xor	%g5,	%i4,	%o0
	st	%f3,	[%l7 + 0x38]
	movl	%xcc,	%i2,	%i5
	sllx	%l5,	%i1,	%o5
	fpadd32s	%f8,	%f13,	%f13
	sth	%o4,	[%l7 + 0x40]
	fmovrsgez	%l2,	%f7,	%f11
	lduw	[%l7 + 0x24],	%l4
	restore %g4, %l3, %g3
	andn	%l1,	0x1068,	%g7
	subc	%l6,	0x094F,	%o1
	fmovrde	%g6,	%f12,	%f4
	edge16ln	%i3,	%o6,	%i6
	fsrc1s	%f8,	%f0
	ldsh	[%l7 + 0x7C],	%g1
	movneg	%icc,	%o2,	%i7
	movgu	%xcc,	%o7,	%l0
	and	%g2,	0x03DE,	%i0
	stw	%o3,	[%l7 + 0x18]
	movrgz	%i4,	0x3DE,	%o0
	fmul8x16	%f10,	%f4,	%f14
	orn	%g5,	0x0A5A,	%i5
	edge32n	%i2,	%l5,	%i1
	fmovsneg	%icc,	%f5,	%f4
	orn	%o4,	%o5,	%l2
	st	%f2,	[%l7 + 0x78]
	fabss	%f15,	%f1
	array16	%l4,	%g4,	%g3
	srl	%l1,	0x13,	%g7
	or	%l6,	%o1,	%g6
	move	%xcc,	%i3,	%o6
	edge16l	%i6,	%l3,	%g1
	fandnot2	%f6,	%f4,	%f6
	ldub	[%l7 + 0x16],	%i7
	alignaddr	%o7,	%o2,	%l0
	stw	%g2,	[%l7 + 0x44]
	fmovsleu	%xcc,	%f10,	%f13
	lduh	[%l7 + 0x7C],	%o3
	ldsw	[%l7 + 0x68],	%i0
	fmovscs	%icc,	%f12,	%f5
	xor	%o0,	%i4,	%i5
	addcc	%g5,	0x0877,	%l5
	movrne	%i1,	%o4,	%o5
	movre	%l2,	%l4,	%g4
	edge16n	%i2,	%g3,	%l1
	movleu	%icc,	%l6,	%g7
	or	%o1,	0x1C73,	%i3
	addccc	%o6,	%g6,	%l3
	stw	%i6,	[%l7 + 0x4C]
	add	%i7,	0x1809,	%o7
	fmovrslz	%g1,	%f7,	%f14
	movleu	%xcc,	%l0,	%g2
	faligndata	%f0,	%f10,	%f0
	ldub	[%l7 + 0x7D],	%o2
	movgu	%icc,	%o3,	%i0
	fmovsg	%icc,	%f11,	%f14
	ldsh	[%l7 + 0x2E],	%i4
	andcc	%o0,	%g5,	%l5
	fnands	%f3,	%f13,	%f1
	srlx	%i5,	%o4,	%i1
	xnor	%o5,	%l2,	%g4
	movre	%i2,	0x3C6,	%g3
	move	%icc,	%l4,	%l1
	andncc	%g7,	%l6,	%o1
	fmovsneg	%xcc,	%f5,	%f15
	fmovd	%f8,	%f4
	save %o6, 0x0A99, %g6
	movre	%i3,	%i6,	%i7
	sub	%l3,	0x1B6A,	%o7
	stx	%l0,	[%l7 + 0x30]
	orcc	%g1,	0x0BBC,	%o2
	sllx	%o3,	0x12,	%i0
	movrgez	%i4,	%g2,	%o0
	sra	%g5,	%l5,	%i5
	restore %i1, %o4, %o5
	fmovdvs	%icc,	%f2,	%f10
	ldsw	[%l7 + 0x18],	%g4
	srlx	%l2,	0x0A,	%i2
	smulcc	%g3,	%l4,	%g7
	fors	%f8,	%f13,	%f9
	andncc	%l1,	%o1,	%o6
	movrlz	%l6,	%i3,	%i6
	edge16n	%i7,	%g6,	%l3
	subcc	%o7,	0x0D7B,	%g1
	array8	%l0,	%o3,	%i0
	std	%f14,	[%l7 + 0x50]
	movgu	%icc,	%i4,	%o2
	movcc	%icc,	%o0,	%g2
	std	%f4,	[%l7 + 0x68]
	edge16n	%l5,	%g5,	%i5
	orn	%i1,	0x1E23,	%o4
	st	%f12,	[%l7 + 0x64]
	edge32	%g4,	%o5,	%i2
	sethi	0x0B4B,	%g3
	ldsw	[%l7 + 0x64],	%l4
	fandnot1s	%f1,	%f4,	%f12
	lduw	[%l7 + 0x0C],	%g7
	sethi	0x156F,	%l1
	stb	%l2,	[%l7 + 0x68]
	edge16ln	%o1,	%l6,	%o6
	movrgz	%i6,	0x009,	%i7
	array32	%i3,	%g6,	%l3
	fmovrdgz	%o7,	%f4,	%f0
	fcmps	%fcc2,	%f8,	%f9
	edge32	%g1,	%l0,	%o3
	st	%f2,	[%l7 + 0x24]
	lduw	[%l7 + 0x5C],	%i0
	fornot2s	%f6,	%f10,	%f14
	lduh	[%l7 + 0x62],	%i4
	fands	%f2,	%f4,	%f11
	srl	%o2,	0x08,	%o0
	fmovse	%xcc,	%f14,	%f9
	fones	%f1
	edge8n	%g2,	%l5,	%g5
	stx	%i5,	[%l7 + 0x40]
	sdiv	%o4,	0x080F,	%g4
	udivx	%o5,	0x04F6,	%i2
	fpadd32	%f6,	%f14,	%f8
	movvc	%icc,	%g3,	%l4
	edge16l	%i1,	%g7,	%l1
	ldsb	[%l7 + 0x2F],	%o1
	array8	%l2,	%o6,	%i6
	array16	%i7,	%i3,	%l6
	andcc	%l3,	%g6,	%g1
	orn	%l0,	0x1AC8,	%o3
	sethi	0x1C37,	%o7
	smul	%i0,	%o2,	%i4
	edge16ln	%g2,	%l5,	%o0
	sdiv	%g5,	0x0EE2,	%o4
	umul	%i5,	%o5,	%i2
	fcmpeq32	%f6,	%f6,	%g4
	ldsh	[%l7 + 0x0C],	%l4
	edge32n	%i1,	%g3,	%l1
	addc	%g7,	0x0EB6,	%l2
	fcmpgt16	%f2,	%f8,	%o1
	fone	%f2
	udivx	%o6,	0x028E,	%i6
	movle	%icc,	%i3,	%l6
	movcc	%icc,	%i7,	%g6
	edge8l	%g1,	%l3,	%l0
	fpack32	%f6,	%f8,	%f14
	addc	%o7,	0x0047,	%i0
	or	%o2,	%o3,	%i4
	ldd	[%l7 + 0x08],	%f8
	alignaddr	%l5,	%g2,	%o0
	fmovrslz	%g5,	%f0,	%f13
	edge32n	%i5,	%o5,	%o4
	fmul8sux16	%f8,	%f12,	%f2
	sub	%g4,	0x1E0F,	%l4
	xnorcc	%i1,	0x07F6,	%g3
	ldsh	[%l7 + 0x48],	%i2
	fsrc2s	%f4,	%f11
	udivx	%g7,	0x1282,	%l2
	srax	%o1,	0x13,	%o6
	fandnot1	%f10,	%f2,	%f4
	edge32n	%l1,	%i6,	%l6
	or	%i3,	0x0C21,	%i7
	stb	%g1,	[%l7 + 0x42]
	xor	%l3,	%l0,	%g6
	stw	%i0,	[%l7 + 0x14]
	srax	%o7,	%o2,	%o3
	fnors	%f8,	%f9,	%f2
	stw	%l5,	[%l7 + 0x54]
	fmovdg	%icc,	%f7,	%f13
	edge8l	%i4,	%o0,	%g5
	lduh	[%l7 + 0x22],	%i5
	movgu	%xcc,	%o5,	%g2
	movneg	%icc,	%g4,	%l4
	edge32l	%i1,	%g3,	%o4
	sth	%i2,	[%l7 + 0x6C]
	fmovsn	%icc,	%f0,	%f8
	smulcc	%g7,	0x17C0,	%l2
	subcc	%o6,	0x1C6D,	%o1
	subccc	%i6,	%l6,	%i3
	edge16l	%l1,	%i7,	%l3
	sllx	%g1,	0x04,	%g6
	fpadd32	%f0,	%f4,	%f14
	stx	%l0,	[%l7 + 0x38]
	andn	%o7,	0x029D,	%o2
	lduw	[%l7 + 0x58],	%i0
	fmovrslez	%o3,	%f3,	%f15
	movrlz	%l5,	%o0,	%i4
	and	%g5,	0x0019,	%i5
	edge32	%o5,	%g4,	%g2
	sdivx	%i1,	0x0CFF,	%g3
	andncc	%l4,	%o4,	%g7
	xor	%i2,	0x08BC,	%o6
	xor	%o1,	%i6,	%l2
	restore %l6, 0x1F00, %i3
	sth	%l1,	[%l7 + 0x28]
	array8	%l3,	%g1,	%g6
	xor	%l0,	%i7,	%o2
	ldsb	[%l7 + 0x24],	%o7
	smulcc	%o3,	%l5,	%o0
	movrlz	%i0,	%g5,	%i5
	umulcc	%o5,	%g4,	%g2
	sth	%i4,	[%l7 + 0x16]
	fcmple32	%f4,	%f14,	%i1
	xor	%g3,	0x0A03,	%l4
	movcs	%xcc,	%g7,	%o4
	fmovsn	%icc,	%f4,	%f6
	fmovsg	%icc,	%f6,	%f11
	sll	%o6,	%i2,	%o1
	movrgez	%i6,	0x285,	%l2
	fmovsne	%xcc,	%f11,	%f8
	fmovsg	%icc,	%f9,	%f15
	array16	%i3,	%l1,	%l6
	or	%g1,	0x141C,	%g6
	ldub	[%l7 + 0x6C],	%l3
	udivx	%i7,	0x0570,	%l0
	xorcc	%o2,	%o3,	%l5
	smul	%o0,	%o7,	%g5
	movneg	%xcc,	%i5,	%i0
	edge16	%o5,	%g2,	%i4
	ldd	[%l7 + 0x50],	%f8
	fpackfix	%f12,	%f5
	sdivx	%g4,	0x19C9,	%i1
	ld	[%l7 + 0x60],	%f0
	smulcc	%g3,	0x0E6A,	%g7
	srl	%l4,	0x13,	%o4
	fmul8x16	%f0,	%f12,	%f4
	smulcc	%o6,	%o1,	%i2
	movrlez	%l2,	0x1FC,	%i6
	sth	%i3,	[%l7 + 0x2E]
	movleu	%icc,	%l6,	%g1
	movrgez	%l1,	%g6,	%i7
	fmovsneg	%icc,	%f15,	%f6
	fmovd	%f10,	%f14
	sllx	%l3,	0x0A,	%o2
	lduh	[%l7 + 0x40],	%o3
	movrlez	%l5,	0x36A,	%o0
	movrlez	%l0,	0x07C,	%g5
	stb	%i5,	[%l7 + 0x20]
	fands	%f14,	%f1,	%f3
	stx	%o7,	[%l7 + 0x78]
	lduw	[%l7 + 0x3C],	%i0
	fmovsg	%icc,	%f10,	%f12
	fcmpeq16	%f10,	%f10,	%o5
	edge8n	%i4,	%g2,	%g4
	andcc	%i1,	0x18C3,	%g7
	movrne	%l4,	%o4,	%o6
	edge32n	%g3,	%o1,	%i2
	srl	%i6,	%l2,	%i3
	fmovsn	%icc,	%f4,	%f7
	mulx	%g1,	%l1,	%l6
	fmovs	%f9,	%f13
	edge32	%g6,	%l3,	%i7
	stb	%o2,	[%l7 + 0x2E]
	sth	%o3,	[%l7 + 0x7A]
	edge32	%l5,	%l0,	%o0
	lduh	[%l7 + 0x72],	%i5
	fands	%f6,	%f6,	%f9
	mulx	%o7,	%g5,	%i0
	movne	%icc,	%i4,	%o5
	ldsh	[%l7 + 0x68],	%g4
	fxnor	%f14,	%f10,	%f4
	subcc	%g2,	0x1E24,	%g7
	fmovrslz	%i1,	%f4,	%f6
	ldd	[%l7 + 0x68],	%f4
	st	%f8,	[%l7 + 0x7C]
	fmovdgu	%xcc,	%f13,	%f12
	movg	%icc,	%l4,	%o4
	edge16n	%o6,	%o1,	%i2
	movcc	%xcc,	%g3,	%l2
	array8	%i6,	%i3,	%g1
	movvs	%xcc,	%l6,	%g6
	andncc	%l1,	%l3,	%o2
	movne	%icc,	%i7,	%l5
	movrgez	%o3,	%o0,	%l0
	subc	%i5,	%o7,	%i0
	fcmple16	%f10,	%f4,	%i4
	movgu	%xcc,	%g5,	%g4
	srlx	%o5,	0x01,	%g2
	movle	%xcc,	%g7,	%l4
	movrne	%i1,	0x0E1,	%o4
	udiv	%o1,	0x022A,	%o6
	lduw	[%l7 + 0x30],	%g3
	andn	%i2,	%l2,	%i3
	fmovrsne	%i6,	%f4,	%f7
	subc	%l6,	0x0396,	%g1
	smulcc	%g6,	%l3,	%l1
	edge32n	%o2,	%l5,	%i7
	siam	0x6
	move	%xcc,	%o3,	%o0
	srlx	%l0,	0x12,	%o7
	edge32n	%i0,	%i4,	%g5
	fmovsvs	%xcc,	%f0,	%f5
	movle	%xcc,	%g4,	%o5
	movvs	%xcc,	%g2,	%g7
	andcc	%l4,	0x192C,	%i1
	sethi	0x0BA1,	%i5
	ldd	[%l7 + 0x20],	%o0
	udivcc	%o6,	0x14B7,	%o4
	fmovda	%icc,	%f5,	%f7
	fmovspos	%xcc,	%f12,	%f0
	movleu	%icc,	%g3,	%l2
	stb	%i3,	[%l7 + 0x5F]
	stb	%i6,	[%l7 + 0x71]
	fmovdvs	%xcc,	%f6,	%f2
	mulscc	%l6,	0x0190,	%i2
	addc	%g6,	0x01AE,	%l3
	popc	%l1,	%o2
	mulscc	%g1,	%i7,	%l5
	popc	%o3,	%l0
	movcc	%icc,	%o0,	%i0
	addcc	%o7,	0x1BF4,	%g5
	fandnot2	%f12,	%f4,	%f10
	mova	%xcc,	%i4,	%g4
	xnor	%g2,	%o5,	%g7
	add	%l4,	%i5,	%i1
	save %o6, %o4, %o1
	fxnors	%f12,	%f4,	%f1
	movrlz	%g3,	%i3,	%i6
	movne	%xcc,	%l6,	%i2
	fmovd	%f6,	%f12
	stb	%l2,	[%l7 + 0x1F]
	fnot2s	%f5,	%f15
	fmovdvs	%icc,	%f8,	%f12
	array32	%l3,	%l1,	%g6
	ldub	[%l7 + 0x6B],	%g1
	add	%i7,	0x0060,	%l5
	fabss	%f4,	%f2
	edge8n	%o3,	%o2,	%l0
	orn	%o0,	0x1136,	%i0
	fpadd32s	%f5,	%f8,	%f9
	edge8l	%g5,	%o7,	%i4
	mulscc	%g2,	%o5,	%g7
	edge16	%l4,	%g4,	%i5
	popc	0x0A44,	%o6
	fzero	%f2
	fmovdneg	%xcc,	%f4,	%f15
	subccc	%o4,	0x0BD5,	%i1
	movrlez	%g3,	0x04B,	%o1
	or	%i3,	%i6,	%i2
	andcc	%l2,	0x1DC8,	%l6
	fcmpne16	%f8,	%f0,	%l3
	movre	%l1,	0x28A,	%g1
	movrlez	%g6,	0x2C9,	%i7
	udivx	%o3,	0x031A,	%o2
	movrgez	%l0,	0x1FB,	%l5
	xor	%i0,	0x0429,	%g5
	ldx	[%l7 + 0x50],	%o7
	ld	[%l7 + 0x5C],	%f10
	fcmpeq16	%f4,	%f12,	%o0
	srlx	%g2,	%o5,	%g7
	add	%l4,	%i4,	%i5
	fmovdne	%icc,	%f14,	%f5
	or	%o6,	%o4,	%i1
	movrlez	%g4,	0x396,	%o1
	move	%icc,	%g3,	%i6
	movcs	%icc,	%i3,	%l2
	addc	%i2,	%l6,	%l3
	mulx	%g1,	0x1B6C,	%l1
	movre	%i7,	0x043,	%o3
	movl	%icc,	%o2,	%l0
	umulcc	%l5,	%g6,	%i0
	and	%g5,	%o0,	%g2
	edge16l	%o7,	%o5,	%g7
	orn	%l4,	0x157A,	%i5
	save %i4, %o4, %o6
	sra	%g4,	%i1,	%g3
	xnorcc	%o1,	%i3,	%l2
	fmovsle	%xcc,	%f4,	%f13
	sllx	%i2,	%l6,	%l3
	mulx	%i6,	%l1,	%i7
	ldd	[%l7 + 0x08],	%g0
	edge32	%o2,	%o3,	%l0
	std	%f6,	[%l7 + 0x30]
	mova	%xcc,	%g6,	%l5
	lduh	[%l7 + 0x6C],	%g5
	fnors	%f7,	%f11,	%f14
	fmovsleu	%icc,	%f7,	%f12
	ldd	[%l7 + 0x20],	%i0
	ldub	[%l7 + 0x5A],	%g2
	edge8ln	%o0,	%o5,	%g7
	ldx	[%l7 + 0x40],	%o7
	ldsh	[%l7 + 0x5C],	%l4
	alignaddr	%i4,	%i5,	%o4
	fmovrdgz	%g4,	%f8,	%f2
	movleu	%xcc,	%i1,	%o6
	sllx	%g3,	%o1,	%l2
	srlx	%i3,	0x1C,	%i2
	movleu	%icc,	%l3,	%l6
	movneg	%xcc,	%i6,	%l1
	orn	%g1,	%o2,	%o3
	orcc	%l0,	%g6,	%i7
	xor	%l5,	%i0,	%g2
	movleu	%icc,	%g5,	%o5
	movge	%xcc,	%g7,	%o7
	andncc	%l4,	%i4,	%o0
	array16	%o4,	%g4,	%i5
	andn	%o6,	0x0D02,	%i1
	sdiv	%o1,	0x1BFE,	%l2
	udivx	%g3,	0x1770,	%i3
	ld	[%l7 + 0x54],	%f0
	fpadd32	%f10,	%f14,	%f6
	sll	%i2,	0x12,	%l6
	edge8ln	%l3,	%l1,	%g1
	ld	[%l7 + 0x24],	%f6
	add	%i6,	%o2,	%l0
	fzero	%f12
	popc	0x02B3,	%o3
	fcmpgt16	%f4,	%f14,	%i7
	umul	%g6,	%i0,	%l5
	edge8	%g5,	%o5,	%g7
	addcc	%g2,	0x15AF,	%l4
	fsrc1s	%f7,	%f0
	or	%i4,	%o7,	%o0
	stx	%g4,	[%l7 + 0x78]
	fmovrsgez	%i5,	%f7,	%f9
	edge16n	%o6,	%o4,	%i1
	movl	%icc,	%l2,	%o1
	st	%f10,	[%l7 + 0x50]
	fcmpgt32	%f14,	%f10,	%g3
	srl	%i3,	0x1D,	%l6
	udivcc	%i2,	0x01E4,	%l1
	srl	%l3,	%i6,	%g1
	fabsd	%f12,	%f6
	fmovsvs	%xcc,	%f10,	%f15
	fmovda	%icc,	%f15,	%f15
	popc	%o2,	%o3
	movl	%xcc,	%l0,	%i7
	movleu	%icc,	%g6,	%i0
	lduw	[%l7 + 0x5C],	%l5
	movn	%icc,	%g5,	%o5
	fmovdcs	%xcc,	%f4,	%f13
	edge8	%g2,	%g7,	%l4
	fxor	%f12,	%f10,	%f14
	smul	%i4,	0x12BA,	%o0
	movn	%xcc,	%g4,	%i5
	fmovrde	%o7,	%f2,	%f12
	edge16	%o6,	%i1,	%l2
	fmovsl	%icc,	%f8,	%f13
	andncc	%o4,	%o1,	%i3
	fornot1s	%f4,	%f10,	%f6
	movle	%icc,	%g3,	%l6
	stb	%l1,	[%l7 + 0x71]
	movle	%xcc,	%i2,	%l3
	fpsub16s	%f14,	%f12,	%f13
	ldd	[%l7 + 0x10],	%f4
	fxors	%f4,	%f2,	%f9
	edge8n	%g1,	%o2,	%i6
	move	%icc,	%o3,	%l0
	sdivcc	%g6,	0x1DC2,	%i7
	edge8l	%i0,	%l5,	%g5
	siam	0x5
	sub	%g2,	0x1FDB,	%g7
	fmovsl	%xcc,	%f1,	%f4
	pdist	%f14,	%f2,	%f6
	sll	%l4,	0x13,	%i4
	sub	%o5,	%g4,	%i5
	fmovs	%f8,	%f14
	alignaddr	%o7,	%o0,	%i1
	edge16ln	%o6,	%o4,	%o1
	movneg	%xcc,	%l2,	%g3
	fcmped	%fcc2,	%f6,	%f2
	fmovsgu	%icc,	%f9,	%f8
	edge32ln	%l6,	%i3,	%l1
	edge32l	%i2,	%g1,	%o2
	edge16n	%i6,	%l3,	%l0
	fpack16	%f8,	%f7
	movne	%xcc,	%g6,	%o3
	fnot1	%f6,	%f10
	edge32l	%i0,	%i7,	%l5
	ldsb	[%l7 + 0x5B],	%g5
	movgu	%icc,	%g7,	%l4
	movg	%xcc,	%i4,	%o5
	alignaddrl	%g2,	%i5,	%o7
	fmul8x16	%f12,	%f6,	%f0
	fmul8ulx16	%f12,	%f8,	%f10
	orncc	%g4,	%o0,	%i1
	edge32	%o4,	%o6,	%l2
	movl	%xcc,	%o1,	%l6
	movneg	%icc,	%g3,	%i3
	edge32ln	%i2,	%l1,	%o2
	and	%g1,	0x1FE0,	%l3
	edge16	%l0,	%i6,	%o3
	ldsh	[%l7 + 0x44],	%g6
	srlx	%i7,	0x19,	%i0
	add	%g5,	%g7,	%l5
	fnor	%f2,	%f12,	%f12
	fpadd32	%f2,	%f14,	%f12
	fmovs	%f14,	%f5
	umul	%l4,	0x0C79,	%o5
	xnor	%g2,	%i5,	%o7
	sllx	%g4,	0x1E,	%i4
	movrgz	%i1,	%o0,	%o4
	edge8l	%o6,	%l2,	%l6
	movle	%icc,	%g3,	%o1
	fcmple16	%f0,	%f6,	%i2
	orncc	%i3,	%o2,	%g1
	fmovsg	%icc,	%f8,	%f14
	stw	%l1,	[%l7 + 0x5C]
	edge16l	%l0,	%l3,	%o3
	fxnors	%f10,	%f4,	%f2
	fpadd16	%f8,	%f14,	%f10
	edge32l	%i6,	%g6,	%i0
	orncc	%i7,	%g7,	%g5
	mulx	%l5,	%o5,	%l4
	mova	%xcc,	%g2,	%i5
	fands	%f13,	%f9,	%f10
	sra	%o7,	%g4,	%i4
	andncc	%o0,	%o4,	%o6
	ld	[%l7 + 0x1C],	%f4
	sllx	%l2,	0x00,	%i1
	sub	%g3,	0x1E0E,	%o1
	ld	[%l7 + 0x2C],	%f0
	addccc	%l6,	%i2,	%o2
	ldsw	[%l7 + 0x18],	%g1
	umul	%l1,	0x0655,	%l0
	alignaddr	%i3,	%l3,	%o3
	edge32	%g6,	%i6,	%i0
	fnand	%f12,	%f8,	%f14
	movvs	%icc,	%i7,	%g5
	movcs	%icc,	%l5,	%g7
	array8	%o5,	%g2,	%i5
	udivcc	%l4,	0x063D,	%o7
	fmovrdgez	%g4,	%f8,	%f2
	edge8	%o0,	%o4,	%i4
	fandnot2s	%f0,	%f8,	%f12
	subccc	%l2,	0x120A,	%o6
	edge8ln	%i1,	%g3,	%l6
	movrgz	%o1,	0x3D0,	%i2
	subc	%o2,	%l1,	%l0
	and	%i3,	0x1AD4,	%g1
	udiv	%o3,	0x1154,	%g6
	edge8l	%i6,	%i0,	%i7
	fpack32	%f0,	%f4,	%f10
	edge32ln	%l3,	%l5,	%g7
	fmovsg	%icc,	%f0,	%f15
	fmovrsgez	%o5,	%f3,	%f3
	stb	%g5,	[%l7 + 0x4A]
	edge32ln	%i5,	%l4,	%g2
	edge32ln	%o7,	%o0,	%g4
	fcmpes	%fcc3,	%f13,	%f11
	fnegs	%f6,	%f5
	fmul8x16au	%f6,	%f5,	%f12
	subcc	%i4,	%l2,	%o6
	udiv	%i1,	0x1356,	%o4
	sll	%l6,	%g3,	%o1
	edge8ln	%o2,	%l1,	%l0
	xnor	%i2,	%g1,	%i3
	edge16l	%o3,	%g6,	%i0
	movge	%xcc,	%i6,	%i7
	movvs	%icc,	%l3,	%g7
	fpadd16s	%f4,	%f12,	%f4
	subc	%l5,	%o5,	%g5
	edge16l	%l4,	%g2,	%o7
	mulscc	%o0,	%g4,	%i5
	fmovdgu	%xcc,	%f14,	%f8
	edge32l	%l2,	%o6,	%i1
	xor	%i4,	%o4,	%l6
	sdiv	%o1,	0x06A6,	%o2
	fmul8x16al	%f0,	%f14,	%f10
	andn	%g3,	0x1DCC,	%l0
	movrgz	%l1,	0x3C3,	%g1
	xnor	%i2,	0x09F1,	%i3
	fmovs	%f15,	%f14
	add	%o3,	%i0,	%i6
	fmovrdlez	%i7,	%f14,	%f2
	sdivx	%g6,	0x1E64,	%g7
	ldx	[%l7 + 0x58],	%l5
	fmovrsgz	%o5,	%f14,	%f1
	movgu	%xcc,	%g5,	%l3
	edge8ln	%g2,	%l4,	%o0
	fmovsleu	%icc,	%f10,	%f10
	restore %g4, %i5, %l2
	andncc	%o6,	%i1,	%i4
	movrgez	%o4,	%o7,	%l6
	sth	%o2,	[%l7 + 0x52]
	fmovdleu	%xcc,	%f9,	%f8
	edge16l	%g3,	%l0,	%l1
	smulcc	%o1,	%g1,	%i2
	restore %o3, 0x13E2, %i3
	stb	%i6,	[%l7 + 0x4E]
	udiv	%i7,	0x1DD2,	%g6
	udivcc	%g7,	0x0741,	%i0
	lduw	[%l7 + 0x54],	%o5
	ldsw	[%l7 + 0x08],	%g5
	mova	%xcc,	%l3,	%l5
	mulscc	%l4,	0x140F,	%g2
	smulcc	%o0,	0x1729,	%g4
	move	%xcc,	%l2,	%i5
	ld	[%l7 + 0x20],	%f8
	edge16n	%i1,	%i4,	%o4
	andcc	%o6,	0x1672,	%o7
	umul	%o2,	%l6,	%g3
	fand	%f4,	%f10,	%f4
	ldx	[%l7 + 0x78],	%l0
	srlx	%l1,	0x1B,	%g1
	edge16	%i2,	%o3,	%o1
	stw	%i6,	[%l7 + 0x60]
	movrne	%i3,	%i7,	%g7
	xnorcc	%i0,	%o5,	%g6
	mova	%xcc,	%l3,	%l5
	add	%g5,	0x19CB,	%l4
	andncc	%g2,	%g4,	%l2
	xor	%o0,	0x09EA,	%i5
	edge32ln	%i4,	%i1,	%o4
	restore %o6, %o7, %l6
	fmul8x16	%f8,	%f10,	%f14
	fmovs	%f2,	%f10
	move	%icc,	%o2,	%l0
	fmovrsgz	%l1,	%f14,	%f7
	movleu	%icc,	%g1,	%i2
	movcs	%icc,	%g3,	%o1
	edge8ln	%i6,	%i3,	%o3
	mova	%xcc,	%i7,	%i0
	sll	%o5,	0x07,	%g7
	fpadd32s	%f11,	%f0,	%f9
	fmovsn	%xcc,	%f13,	%f14
	sethi	0x0B82,	%l3
	edge16	%l5,	%g6,	%g5
	xorcc	%g2,	0x1AEB,	%l4
	subccc	%l2,	0x1D6D,	%g4
	ld	[%l7 + 0x2C],	%f3
	sra	%o0,	%i5,	%i4
	ldsw	[%l7 + 0x40],	%i1
	srax	%o6,	%o4,	%o7
	subc	%o2,	0x1BB0,	%l6
	edge8l	%l1,	%g1,	%l0
	movle	%xcc,	%g3,	%i2
	movne	%xcc,	%o1,	%i3
	and	%o3,	0x0B70,	%i6
	ldsb	[%l7 + 0x11],	%i7
	sth	%o5,	[%l7 + 0x60]
	ldsh	[%l7 + 0x38],	%g7
	fnegs	%f4,	%f1
	sdivx	%l3,	0x1BD4,	%l5
	orn	%i0,	0x0DFB,	%g5
	sth	%g6,	[%l7 + 0x7C]
	fmovsa	%icc,	%f14,	%f5
	st	%f10,	[%l7 + 0x34]
	bshuffle	%f14,	%f4,	%f6
	sdivx	%l4,	0x1C83,	%g2
	movvs	%icc,	%l2,	%o0
	addc	%i5,	%i4,	%g4
	sll	%o6,	%i1,	%o7
	ldub	[%l7 + 0x4B],	%o4
	sdivcc	%o2,	0x0214,	%l6
	addccc	%l1,	%l0,	%g3
	sll	%i2,	%o1,	%g1
	fnegs	%f13,	%f11
	fmovrdgz	%i3,	%f10,	%f2
	stb	%o3,	[%l7 + 0x5E]
	fabsd	%f8,	%f14
	ldsb	[%l7 + 0x30],	%i7
	sethi	0x16F4,	%o5
	fmovdl	%icc,	%f14,	%f1
	sll	%g7,	%l3,	%l5
	subcc	%i6,	0x1247,	%i0
	add	%g5,	0x0E01,	%g6
	save %g2, 0x0308, %l4
	ldx	[%l7 + 0x58],	%l2
	fsrc2s	%f10,	%f0
	subccc	%o0,	0x04ED,	%i5
	orn	%g4,	%o6,	%i4
	fmovdg	%xcc,	%f13,	%f2
	fmovdl	%icc,	%f12,	%f14
	fmovrslez	%o7,	%f9,	%f7
	fmovdn	%icc,	%f2,	%f9
	ld	[%l7 + 0x28],	%f12
	fornot1s	%f4,	%f12,	%f5
	fcmpgt32	%f8,	%f8,	%o4
	movcc	%icc,	%o2,	%l6
	fmul8ulx16	%f10,	%f0,	%f2
	edge16l	%i1,	%l1,	%l0
	sethi	0x1252,	%g3
	ldub	[%l7 + 0x74],	%o1
	udiv	%g1,	0x058C,	%i3
	edge8n	%i2,	%o3,	%i7
	fmovsleu	%icc,	%f12,	%f1
	lduw	[%l7 + 0x68],	%g7
	srlx	%l3,	%o5,	%l5
	edge32n	%i0,	%i6,	%g6
	mulscc	%g2,	0x0EBE,	%l4
	xorcc	%l2,	%g5,	%i5
	mulscc	%o0,	%g4,	%i4
	movrne	%o6,	0x2D2,	%o4
	edge32l	%o2,	%l6,	%i1
	fnors	%f3,	%f9,	%f4
	edge16ln	%o7,	%l1,	%l0
	edge16ln	%g3,	%o1,	%g1
	fmovdge	%icc,	%f4,	%f1
	sll	%i2,	%o3,	%i3
	fpmerge	%f3,	%f3,	%f6
	movcs	%icc,	%i7,	%l3
	movl	%icc,	%g7,	%l5
	movn	%xcc,	%i0,	%o5
	edge32n	%i6,	%g2,	%l4
	mova	%icc,	%l2,	%g5
	movrne	%i5,	%o0,	%g6
	stb	%g4,	[%l7 + 0x67]
	movcs	%xcc,	%i4,	%o4
	fnand	%f10,	%f0,	%f6
	mulscc	%o2,	%l6,	%i1
	fcmpeq32	%f12,	%f8,	%o6
	movrgez	%l1,	0x022,	%o7
	fcmpne32	%f6,	%f4,	%l0
	fand	%f0,	%f12,	%f10
	addcc	%o1,	%g3,	%i2
	lduw	[%l7 + 0x20],	%g1
	movre	%i3,	0x25F,	%i7
	mulscc	%l3,	%o3,	%l5
	edge16l	%g7,	%o5,	%i0
	movn	%xcc,	%g2,	%i6
	add	%l2,	0x0DF2,	%g5
	add	%i5,	0x150B,	%l4
	fmovsvs	%icc,	%f14,	%f3
	movg	%icc,	%o0,	%g6
	fandnot1s	%f7,	%f0,	%f7
	fabsd	%f2,	%f12
	fmovrsgez	%g4,	%f9,	%f2
	std	%f2,	[%l7 + 0x38]
	or	%i4,	%o4,	%l6
	mulscc	%i1,	0x1319,	%o6
	alignaddrl	%o2,	%l1,	%l0
	movre	%o1,	0x080,	%o7
	fpadd32s	%f10,	%f15,	%f9
	movgu	%icc,	%g3,	%i2
	orncc	%i3,	%i7,	%l3
	sub	%o3,	%g1,	%l5
	addc	%o5,	0x0DD2,	%g7
	lduh	[%l7 + 0x12],	%g2
	edge32ln	%i0,	%l2,	%g5
	edge16ln	%i5,	%i6,	%o0
	addc	%l4,	0x0D21,	%g6
	popc	%i4,	%g4
	stb	%o4,	[%l7 + 0x28]
	fcmped	%fcc0,	%f14,	%f10
	andn	%i1,	0x0BFB,	%o6
	stb	%l6,	[%l7 + 0x4B]
	edge32l	%o2,	%l1,	%l0
	udivcc	%o7,	0x14C7,	%g3
	edge16ln	%i2,	%i3,	%i7
	edge32	%l3,	%o3,	%o1
	mulx	%g1,	%o5,	%l5
	srax	%g2,	0x04,	%g7
	edge32n	%l2,	%i0,	%i5
	fnand	%f0,	%f6,	%f14
	movge	%xcc,	%g5,	%o0
	fmovdl	%icc,	%f9,	%f7
	fmuld8ulx16	%f14,	%f6,	%f14
	movrlez	%l4,	0x3C8,	%i6
	fmovs	%f11,	%f2
	movrne	%g6,	0x302,	%g4
	ldsh	[%l7 + 0x48],	%o4
	sdivcc	%i4,	0x1344,	%o6
	fmovdle	%icc,	%f2,	%f9
	stw	%i1,	[%l7 + 0x38]
	udivcc	%l6,	0x03A0,	%o2
	fmovde	%icc,	%f9,	%f6
	andn	%l0,	0x0E61,	%l1
	sethi	0x0854,	%g3
	subcc	%i2,	0x0EFA,	%i3
	fmul8x16	%f11,	%f4,	%f2
	fmul8sux16	%f14,	%f4,	%f0
	std	%f14,	[%l7 + 0x70]
	ldsb	[%l7 + 0x3E],	%i7
	xnor	%o7,	0x081F,	%o3
	stb	%o1,	[%l7 + 0x5B]
	movg	%xcc,	%l3,	%o5
	sth	%g1,	[%l7 + 0x38]
	umul	%g2,	0x176F,	%g7
	fpsub32	%f0,	%f0,	%f14
	fnands	%f14,	%f1,	%f0
	fpsub32	%f8,	%f10,	%f12
	srl	%l5,	0x19,	%l2
	movleu	%xcc,	%i5,	%g5
	edge16	%o0,	%i0,	%i6
	and	%l4,	0x1F9E,	%g4
	stw	%g6,	[%l7 + 0x38]
	orncc	%o4,	%o6,	%i1
	fnands	%f8,	%f13,	%f2
	smulcc	%i4,	0x0458,	%l6
	edge32l	%o2,	%l0,	%l1
	fmovrslez	%g3,	%f1,	%f8
	udivx	%i3,	0x18D8,	%i7
	fmovrsgez	%o7,	%f7,	%f12
	fmovde	%icc,	%f10,	%f3
	sub	%o3,	%o1,	%l3
	ld	[%l7 + 0x40],	%f1
	movre	%o5,	%i2,	%g2
	edge8	%g1,	%g7,	%l5
	xnorcc	%i5,	0x072E,	%g5
	restore %l2, 0x1A72, %o0
	edge16	%i6,	%i0,	%l4
	fmovsne	%xcc,	%f11,	%f11
	srax	%g4,	%g6,	%o4
	fmul8x16au	%f15,	%f0,	%f0
	movn	%icc,	%i1,	%o6
	fcmpgt16	%f12,	%f4,	%l6
	movne	%xcc,	%o2,	%l0
	orn	%l1,	0x049E,	%g3
	array16	%i4,	%i3,	%o7
	fnegd	%f4,	%f4
	array32	%o3,	%i7,	%l3
	srlx	%o5,	0x19,	%o1
	subc	%i2,	%g1,	%g2
	movvs	%xcc,	%g7,	%l5
	sethi	0x081C,	%i5
	st	%f10,	[%l7 + 0x10]
	ldsb	[%l7 + 0x65],	%l2
	sra	%g5,	0x1D,	%o0
	array16	%i0,	%l4,	%g4
	move	%icc,	%g6,	%i6
	popc	0x15A8,	%i1
	udivcc	%o6,	0x1716,	%l6
	edge32l	%o2,	%o4,	%l0
	mova	%icc,	%l1,	%i4
	ldd	[%l7 + 0x48],	%f2
	mova	%icc,	%i3,	%g3
	movneg	%icc,	%o3,	%i7
	ldsw	[%l7 + 0x2C],	%o7
	addcc	%o5,	0x09D3,	%o1
	movleu	%xcc,	%i2,	%g1
	alignaddr	%g2,	%l3,	%l5
	array16	%i5,	%l2,	%g5
	srax	%g7,	%o0,	%i0
	ldsh	[%l7 + 0x6C],	%l4
	restore %g6, 0x1781, %i6
	mova	%icc,	%i1,	%g4
	xor	%l6,	%o6,	%o4
	sdivcc	%o2,	0x0F38,	%l1
	umul	%l0,	%i3,	%i4
	andncc	%g3,	%i7,	%o7
	fors	%f9,	%f14,	%f4
	xorcc	%o5,	%o1,	%o3
	fmovsvs	%icc,	%f3,	%f4
	fpsub16	%f12,	%f14,	%f4
	ldsb	[%l7 + 0x6C],	%g1
	fabss	%f7,	%f10
	fmovdcs	%xcc,	%f3,	%f1
	fxnors	%f0,	%f8,	%f15
	sllx	%i2,	%l3,	%l5
	alignaddrl	%i5,	%l2,	%g5
	st	%f5,	[%l7 + 0x18]
	sdivcc	%g7,	0x1DA2,	%o0
	movneg	%xcc,	%g2,	%l4
	stx	%i0,	[%l7 + 0x78]
	fmovdne	%xcc,	%f2,	%f8
	movrne	%g6,	%i6,	%g4
	edge8n	%i1,	%o6,	%l6
	xnor	%o2,	%o4,	%l0
	fandnot1	%f14,	%f0,	%f0
	fcmpne16	%f6,	%f6,	%l1
	edge32ln	%i3,	%i4,	%i7
	subccc	%o7,	%o5,	%o1
	fcmpne32	%f14,	%f4,	%o3
	ldd	[%l7 + 0x08],	%f10
	ld	[%l7 + 0x68],	%f0
	movrlz	%g3,	%g1,	%i2
	fexpand	%f15,	%f10
	udivcc	%l5,	0x185E,	%i5
	orncc	%l2,	0x132D,	%l3
	udivcc	%g7,	0x1DBE,	%o0
	siam	0x1
	addccc	%g5,	%g2,	%i0
	movrgz	%g6,	%i6,	%g4
	fcmped	%fcc1,	%f14,	%f10
	edge8ln	%i1,	%o6,	%l6
	movrne	%o2,	%o4,	%l0
	fxor	%f14,	%f10,	%f6
	fmovsl	%icc,	%f4,	%f15
	srlx	%l1,	0x0C,	%i3
	xnorcc	%i4,	%i7,	%l4
	subc	%o5,	0x03DD,	%o1
	stb	%o7,	[%l7 + 0x55]
	movle	%xcc,	%o3,	%g1
	mova	%icc,	%g3,	%l5
	sll	%i2,	%i5,	%l2
	orn	%l3,	0x19ED,	%o0
	mulscc	%g5,	%g7,	%i0
	fandnot1s	%f10,	%f6,	%f12
	andncc	%g2,	%g6,	%g4
	fmovdvs	%icc,	%f10,	%f15
	ldub	[%l7 + 0x24],	%i1
	movle	%icc,	%o6,	%i6
	mova	%xcc,	%o2,	%l6
	srlx	%l0,	0x07,	%l1
	restore %i3, %i4, %i7
	ldsw	[%l7 + 0x5C],	%o4
	sll	%l4,	%o1,	%o5
	andcc	%o7,	%g1,	%o3
	array8	%l5,	%g3,	%i2
	fpadd16	%f2,	%f12,	%f0
	fcmpgt32	%f8,	%f8,	%l2
	sdiv	%l3,	0x0FC8,	%o0
	udivcc	%g5,	0x17B3,	%i5
	subcc	%g7,	0x031B,	%g2
	array32	%i0,	%g4,	%i1
	ldd	[%l7 + 0x48],	%f14
	addcc	%g6,	%i6,	%o6
	fmovde	%icc,	%f9,	%f8
	fmovrdlz	%l6,	%f0,	%f14
	fmovdcc	%xcc,	%f3,	%f13
	fornot2s	%f15,	%f10,	%f8
	st	%f7,	[%l7 + 0x3C]
	fmovrslz	%o2,	%f15,	%f2
	stb	%l1,	[%l7 + 0x11]
	fzero	%f4
	fnot1	%f14,	%f10
	movrgez	%i3,	%i4,	%l0
	ldd	[%l7 + 0x58],	%f2
	movge	%xcc,	%i7,	%l4
	std	%f8,	[%l7 + 0x18]
	fexpand	%f4,	%f6
	fmovsl	%xcc,	%f0,	%f10
	movgu	%xcc,	%o1,	%o5
	move	%icc,	%o7,	%g1
	fmovrdne	%o4,	%f6,	%f14
	sllx	%o3,	%g3,	%l5
	addccc	%l2,	%l3,	%o0
	xnorcc	%g5,	%i2,	%i5
	fmovsl	%xcc,	%f15,	%f1
	fxnor	%f0,	%f6,	%f8
	movcs	%xcc,	%g7,	%i0
	fcmpeq16	%f2,	%f4,	%g2
	fxor	%f6,	%f10,	%f10
	edge16ln	%i1,	%g4,	%i6
	orn	%g6,	0x04B3,	%l6
	fandnot1	%f0,	%f14,	%f14
	movrgz	%o2,	0x3B7,	%l1
	stx	%i3,	[%l7 + 0x08]
	fnands	%f15,	%f2,	%f2
	array16	%o6,	%i4,	%l0
	umul	%l4,	0x0FCC,	%i7
	lduw	[%l7 + 0x54],	%o5
	movvs	%xcc,	%o1,	%o7
	stx	%o4,	[%l7 + 0x38]
	movgu	%xcc,	%o3,	%g1
	mulx	%g3,	%l2,	%l3
	fcmpgt16	%f0,	%f8,	%o0
	ldx	[%l7 + 0x08],	%l5
	movcs	%xcc,	%g5,	%i5
	movvc	%xcc,	%i2,	%i0
	xor	%g2,	0x0391,	%g7
	sth	%i1,	[%l7 + 0x6C]
	sub	%i6,	%g6,	%g4
	fcmple16	%f2,	%f12,	%l6
	array32	%l1,	%i3,	%o6
	edge16ln	%o2,	%l0,	%i4
	ldsw	[%l7 + 0x34],	%i7
	edge32n	%l4,	%o5,	%o1
	fands	%f10,	%f3,	%f14
	fpadd32s	%f1,	%f0,	%f9
	popc	0x01EB,	%o7
	movl	%xcc,	%o3,	%g1
	sth	%o4,	[%l7 + 0x3A]
	edge8n	%g3,	%l2,	%o0
	fmovrsgz	%l5,	%f6,	%f6
	orcc	%g5,	%i5,	%l3
	edge32n	%i0,	%i2,	%g7
	or	%g2,	%i1,	%g6
	edge32ln	%g4,	%i6,	%l1
	movpos	%xcc,	%l6,	%i3
	fmuld8sux16	%f8,	%f7,	%f6
	fpack16	%f4,	%f11
	andn	%o2,	0x18C8,	%l0
	fmovrdgz	%o6,	%f0,	%f8
	alignaddrl	%i4,	%i7,	%l4
	fmovrse	%o1,	%f11,	%f3
	edge16ln	%o5,	%o3,	%g1
	movrlz	%o7,	%o4,	%l2
	ldsh	[%l7 + 0x5E],	%g3
	stw	%l5,	[%l7 + 0x14]
	ldub	[%l7 + 0x18],	%o0
	fandnot1s	%f13,	%f12,	%f7
	stx	%i5,	[%l7 + 0x10]
	subccc	%l3,	%i0,	%g5
	move	%icc,	%g7,	%g2
	movrgez	%i1,	%i2,	%g4
	movneg	%icc,	%i6,	%g6
	stw	%l6,	[%l7 + 0x48]
	ldsb	[%l7 + 0x6E],	%l1
	array8	%i3,	%o2,	%l0
	alignaddrl	%i4,	%o6,	%i7
	edge16	%l4,	%o5,	%o1
	array8	%o3,	%o7,	%o4
	array8	%l2,	%g1,	%g3
	fxnors	%f13,	%f0,	%f5
	fmovscc	%xcc,	%f8,	%f15
	ldd	[%l7 + 0x40],	%o0
	sdiv	%l5,	0x0737,	%l3
	movneg	%icc,	%i0,	%i5
	ld	[%l7 + 0x68],	%f14
	addccc	%g5,	%g7,	%g2
	fnands	%f10,	%f13,	%f15
	sra	%i2,	%g4,	%i6
	edge8ln	%g6,	%i1,	%l6
	movvc	%xcc,	%l1,	%o2
	lduw	[%l7 + 0x68],	%i3
	fmovdne	%xcc,	%f14,	%f10
	srlx	%l0,	%i4,	%i7
	sdivx	%l4,	0x1A92,	%o6
	subcc	%o5,	0x1A2F,	%o3
	array8	%o7,	%o1,	%l2
	fmovdpos	%xcc,	%f6,	%f0
	smulcc	%g1,	0x121A,	%g3
	addc	%o0,	0x0017,	%l5
	ldub	[%l7 + 0x35],	%l3
	umul	%i0,	%i5,	%o4
	fors	%f8,	%f0,	%f8
	orncc	%g7,	0x18B6,	%g5
	umulcc	%i2,	%g2,	%i6
	ldsw	[%l7 + 0x78],	%g4
	sth	%g6,	[%l7 + 0x74]
	xor	%l6,	%i1,	%o2
	movrgez	%l1,	0x3A7,	%l0
	ldd	[%l7 + 0x10],	%i2
	edge8ln	%i7,	%l4,	%o6
	ldx	[%l7 + 0x28],	%i4
	subccc	%o3,	%o5,	%o1
	fabsd	%f4,	%f0
	edge8	%o7,	%g1,	%l2
	movrlez	%g3,	%o0,	%l3
	add	%i0,	%i5,	%l5
	movcs	%icc,	%g7,	%g5
	mulx	%i2,	%o4,	%i6
	fpsub16s	%f14,	%f1,	%f8
	fmovse	%icc,	%f7,	%f12
	subccc	%g2,	0x1826,	%g6
	st	%f6,	[%l7 + 0x4C]
	udiv	%g4,	0x054A,	%i1
	addccc	%l6,	0x0DDD,	%o2
	lduh	[%l7 + 0x0E],	%l0
	xnorcc	%i3,	%i7,	%l4
	std	%f14,	[%l7 + 0x20]
	fcmpeq16	%f0,	%f2,	%l1
	srax	%o6,	%i4,	%o3
	movl	%icc,	%o5,	%o7
	fnors	%f13,	%f7,	%f1
	edge32	%o1,	%g1,	%l2
	fpmerge	%f15,	%f15,	%f0
	xor	%g3,	%l3,	%i0
	sll	%i5,	0x1C,	%l5
	sethi	0x05D1,	%g7
	movrlez	%o0,	%i2,	%g5
	sll	%o4,	%i6,	%g2
	ld	[%l7 + 0x0C],	%f11
	array8	%g4,	%g6,	%l6
	lduw	[%l7 + 0x44],	%o2
	sdivcc	%i1,	0x0880,	%i3
	fmovsle	%icc,	%f1,	%f14
	addccc	%i7,	0x134E,	%l0
	edge8n	%l4,	%o6,	%l1
	smulcc	%i4,	0x0846,	%o3
	fmovdcc	%icc,	%f11,	%f5
	fmovsvs	%xcc,	%f10,	%f15
	edge32	%o7,	%o1,	%o5
	movrgz	%l2,	%g3,	%g1
	ldub	[%l7 + 0x36],	%l3
	srlx	%i5,	0x09,	%l5
	fmovdn	%xcc,	%f11,	%f6
	movrgz	%i0,	%o0,	%g7
	fzero	%f2
	and	%i2,	0x060A,	%o4
	movre	%i6,	0x0DD,	%g5
	edge8l	%g4,	%g6,	%g2
	fpsub16	%f10,	%f8,	%f6
	movle	%icc,	%o2,	%i1
	or	%l6,	%i3,	%i7
	edge16n	%l4,	%l0,	%o6
	srlx	%l1,	%i4,	%o3
	fpadd16	%f2,	%f10,	%f0
	subccc	%o1,	0x05F7,	%o7
	movneg	%icc,	%o5,	%l2
	sethi	0x08A2,	%g1
	movrne	%g3,	0x150,	%l3
	movrgez	%l5,	%i0,	%o0
	movn	%xcc,	%i5,	%i2
	xorcc	%o4,	%i6,	%g5
	ldsw	[%l7 + 0x20],	%g4
	lduw	[%l7 + 0x68],	%g6
	subc	%g7,	%g2,	%o2
	edge8l	%i1,	%i3,	%i7
	edge32l	%l4,	%l0,	%l6
	lduh	[%l7 + 0x08],	%l1
	fcmpeq32	%f12,	%f12,	%o6
	fmovdne	%xcc,	%f2,	%f13
	xorcc	%i4,	0x1831,	%o3
	edge8ln	%o7,	%o1,	%o5
	lduw	[%l7 + 0x10],	%g1
	fpadd32	%f12,	%f14,	%f0
	fmovdvc	%xcc,	%f14,	%f10
	mulx	%l2,	%l3,	%l5
	fpadd32	%f6,	%f4,	%f2
	ld	[%l7 + 0x54],	%f15
	ld	[%l7 + 0x14],	%f9
	array8	%i0,	%o0,	%g3
	movg	%icc,	%i2,	%o4
	edge16ln	%i5,	%i6,	%g4
	movg	%icc,	%g5,	%g7
	ldsh	[%l7 + 0x70],	%g2
	fmovrslez	%g6,	%f3,	%f15
	movleu	%xcc,	%o2,	%i1
	sth	%i3,	[%l7 + 0x46]
	add	%i7,	0x1955,	%l4
	fmovspos	%icc,	%f4,	%f12
	mulscc	%l0,	0x0ACF,	%l6
	stx	%l1,	[%l7 + 0x18]
	movrgz	%i4,	0x294,	%o3
	fmovdl	%icc,	%f6,	%f8
	addccc	%o7,	0x185E,	%o1
	edge8n	%o6,	%g1,	%o5
	umul	%l3,	0x1A9D,	%l2
	udiv	%i0,	0x034C,	%o0
	mulx	%l5,	%g3,	%o4
	sth	%i2,	[%l7 + 0x3E]
	movrlz	%i5,	%g4,	%i6
	fsrc2s	%f15,	%f12
	sll	%g7,	0x16,	%g5
	umul	%g6,	0x03DD,	%g2
	movrlez	%i1,	%i3,	%i7
	addc	%o2,	0x1E92,	%l0
	lduw	[%l7 + 0x20],	%l6
	alignaddrl	%l4,	%l1,	%i4
	and	%o3,	0x0AF0,	%o1
	andn	%o7,	0x0A83,	%g1
	edge32l	%o5,	%o6,	%l2
	lduh	[%l7 + 0x74],	%l3
	fexpand	%f10,	%f14
	edge8l	%o0,	%i0,	%l5
	std	%f12,	[%l7 + 0x08]
	and	%g3,	%i2,	%o4
	addccc	%i5,	%i6,	%g4
	fmuld8sux16	%f14,	%f12,	%f4
	subcc	%g7,	0x1558,	%g6
	movvs	%xcc,	%g2,	%i1
	movne	%xcc,	%i3,	%g5
	movge	%xcc,	%o2,	%i7
	movneg	%icc,	%l0,	%l4
	ldsh	[%l7 + 0x7C],	%l6
	bshuffle	%f6,	%f14,	%f12
	fsrc2	%f10,	%f14
	move	%icc,	%l1,	%o3
	andcc	%o1,	0x1E4F,	%o7
	umul	%i4,	0x022A,	%o5
	ldd	[%l7 + 0x60],	%f2
	mova	%xcc,	%g1,	%o6
	addccc	%l2,	%o0,	%i0
	subc	%l3,	%l5,	%i2
	movrgz	%o4,	%g3,	%i5
	fornot1	%f4,	%f8,	%f6
	sdivcc	%g4,	0x1DE9,	%i6
	udiv	%g7,	0x05C7,	%g2
	mulscc	%g6,	%i1,	%i3
	umul	%g5,	%o2,	%i7
	fmuld8sux16	%f8,	%f0,	%f8
	fnot2	%f14,	%f12
	move	%icc,	%l4,	%l6
	movcc	%xcc,	%l1,	%o3
	save %l0, 0x0293, %o7
	sdivx	%o1,	0x10B2,	%i4
	fmovrsgz	%g1,	%f11,	%f7
	orcc	%o5,	%o6,	%o0
	xnor	%l2,	%i0,	%l3
	movpos	%icc,	%l5,	%i2
	restore %g3, %i5, %g4
	std	%f10,	[%l7 + 0x60]
	sdivcc	%i6,	0x090C,	%o4
	move	%xcc,	%g7,	%g2
	movrgez	%g6,	%i1,	%i3
	move	%xcc,	%g5,	%o2
	andn	%i7,	0x0EFA,	%l6
	fzero	%f12
	andcc	%l1,	0x11CE,	%o3
	fandnot2s	%f9,	%f14,	%f12
	edge8l	%l4,	%o7,	%l0
	sethi	0x1F6C,	%o1
	fnegs	%f1,	%f3
	fpack16	%f12,	%f10
	movge	%icc,	%i4,	%g1
	fmovrdlez	%o6,	%f2,	%f2
	edge32ln	%o5,	%l2,	%o0
	andncc	%l3,	%i0,	%l5
	fpadd32s	%f3,	%f1,	%f13
	movn	%icc,	%g3,	%i5
	ldsw	[%l7 + 0x7C],	%i2
	mulx	%g4,	0x1DBC,	%o4
	mova	%icc,	%g7,	%i6
	fmovdvc	%xcc,	%f4,	%f1
	movcc	%xcc,	%g6,	%g2
	array32	%i3,	%i1,	%g5
	popc	0x156F,	%o2
	edge16	%i7,	%l1,	%o3
	or	%l6,	0x1E55,	%l4
	edge8l	%o7,	%l0,	%o1
	orn	%g1,	0x1EDD,	%i4
	edge16l	%o5,	%l2,	%o6
	fors	%f10,	%f6,	%f0
	movneg	%icc,	%o0,	%i0
	lduh	[%l7 + 0x78],	%l5
	subccc	%g3,	0x10A9,	%i5
	array16	%l3,	%g4,	%o4
	add	%i2,	%i6,	%g7
	fornot2	%f0,	%f10,	%f10
	fmovdvc	%xcc,	%f9,	%f9
	fmovdneg	%xcc,	%f11,	%f2
	udiv	%g6,	0x1076,	%g2
	or	%i3,	0x100B,	%g5
	fnot1s	%f3,	%f3
	fmovdne	%xcc,	%f6,	%f14
	movne	%xcc,	%i1,	%i7
	smulcc	%l1,	0x1C87,	%o3
	fxnors	%f9,	%f10,	%f7
	ldsh	[%l7 + 0x48],	%l6
	orn	%o2,	0x0D8E,	%o7
	edge16	%l0,	%l4,	%o1
	subcc	%i4,	%o5,	%g1
	move	%xcc,	%o6,	%l2
	fmovdle	%icc,	%f12,	%f6
	movg	%xcc,	%o0,	%i0
	array32	%l5,	%i5,	%g3
	edge8	%l3,	%g4,	%o4
	movrlez	%i6,	0x020,	%g7
	andncc	%i2,	%g2,	%g6
	edge32	%g5,	%i1,	%i3
	stw	%i7,	[%l7 + 0x1C]
	ldub	[%l7 + 0x25],	%l1
	movpos	%icc,	%l6,	%o3
	fmovdleu	%xcc,	%f8,	%f7
	fones	%f15
	fzero	%f10
	array8	%o2,	%o7,	%l0
	ldub	[%l7 + 0x28],	%l4
	andncc	%i4,	%o1,	%g1
	edge16ln	%o5,	%l2,	%o0
	fmovse	%icc,	%f10,	%f15
	fmovda	%xcc,	%f9,	%f7
	movre	%o6,	0x2A4,	%i0
	fnot1	%f2,	%f14
	ldsb	[%l7 + 0x15],	%i5
	udiv	%l5,	0x1F95,	%g3
	movneg	%icc,	%l3,	%o4
	fsrc2s	%f11,	%f13
	andcc	%i6,	0x13EF,	%g4
	fmovdcc	%xcc,	%f1,	%f10
	fandnot1	%f4,	%f8,	%f2
	fcmple16	%f14,	%f12,	%g7
	movvc	%icc,	%g2,	%g6
	move	%icc,	%i2,	%i1
	alignaddr	%i3,	%g5,	%i7
	fmovsne	%xcc,	%f10,	%f9
	movcc	%xcc,	%l1,	%l6
	movrlz	%o2,	0x380,	%o7
	fpackfix	%f4,	%f10
	movneg	%icc,	%l0,	%l4
	ldsb	[%l7 + 0x12],	%o3
	mulx	%i4,	%g1,	%o5
	movcc	%xcc,	%l2,	%o1
	array8	%o6,	%i0,	%o0
	orncc	%l5,	%g3,	%l3
	movre	%o4,	%i5,	%i6
	udiv	%g7,	0x1B59,	%g4
	array16	%g6,	%g2,	%i2
	ldx	[%l7 + 0x78],	%i1
	stb	%i3,	[%l7 + 0x12]
	fnot1	%f10,	%f2
	edge16ln	%g5,	%i7,	%l6
	srlx	%o2,	0x06,	%l1
	pdist	%f14,	%f2,	%f8
	edge8n	%o7,	%l4,	%l0
	fnot1s	%f13,	%f7
	smul	%o3,	%g1,	%i4
	edge32n	%l2,	%o1,	%o5
	ldub	[%l7 + 0x65],	%i0
	move	%xcc,	%o0,	%l5
	movge	%xcc,	%o6,	%g3
	movneg	%icc,	%l3,	%o4
	fpsub32s	%f9,	%f14,	%f6
	mulscc	%i5,	0x1ADD,	%g7
	andcc	%i6,	0x09B4,	%g4
	sllx	%g6,	%i2,	%g2
	smulcc	%i1,	%i3,	%g5
	fnot1	%f2,	%f14
	fzeros	%f0
	addccc	%i7,	0x12EB,	%o2
	andcc	%l6,	%l1,	%o7
	fabsd	%f6,	%f12
	edge8	%l0,	%l4,	%o3
	orncc	%i4,	0x03BA,	%l2
	move	%icc,	%o1,	%g1
	ldd	[%l7 + 0x70],	%i0
	fabsd	%f10,	%f8
	sth	%o0,	[%l7 + 0x54]
	smul	%o5,	0x1D64,	%o6
	sdiv	%l5,	0x05EE,	%g3
	ldsh	[%l7 + 0x68],	%l3
	save %o4, %i5, %g7
	fmovsgu	%xcc,	%f11,	%f0
	mova	%icc,	%i6,	%g6
	movn	%xcc,	%i2,	%g2
	movleu	%xcc,	%i1,	%g4
	edge16l	%g5,	%i3,	%o2
	restore %i7, 0x1B4E, %l1
	umul	%l6,	%o7,	%l0
	movrlez	%l4,	%o3,	%i4
	orcc	%l2,	%o1,	%i0
	sdivcc	%g1,	0x1860,	%o5
	ldsh	[%l7 + 0x72],	%o0
	fmovdn	%icc,	%f4,	%f6
	umulcc	%o6,	%l5,	%l3
	movl	%xcc,	%o4,	%g3
	movn	%xcc,	%i5,	%i6
	popc	0x0581,	%g6
	sra	%g7,	%g2,	%i2
	movne	%icc,	%g4,	%i1
	ldd	[%l7 + 0x50],	%f14
	movvs	%xcc,	%g5,	%o2
	sll	%i3,	0x12,	%l1
	fornot2s	%f3,	%f12,	%f0
	fmovdleu	%xcc,	%f6,	%f5
	srlx	%l6,	0x0F,	%i7
	ldx	[%l7 + 0x70],	%o7
	fmovrslez	%l4,	%f3,	%f11
	for	%f2,	%f6,	%f2
	fmovrsgez	%o3,	%f14,	%f1
	fpmerge	%f9,	%f10,	%f4
	xnorcc	%i4,	0x1664,	%l0
	lduw	[%l7 + 0x30],	%l2
	movle	%xcc,	%o1,	%g1
	edge8ln	%o5,	%o0,	%i0
	movne	%icc,	%l5,	%o6
	fnot2s	%f11,	%f5
	addc	%l3,	%o4,	%g3
	fand	%f0,	%f0,	%f14
	movl	%xcc,	%i5,	%g6
	fmovsa	%icc,	%f8,	%f1
	sdiv	%g7,	0x12F4,	%i6
	ldub	[%l7 + 0x19],	%i2
	movle	%icc,	%g4,	%i1
	subccc	%g2,	%o2,	%g5
	movn	%icc,	%i3,	%l6
	fmovsgu	%xcc,	%f11,	%f8
	xnor	%i7,	0x14B0,	%o7
	edge8l	%l4,	%l1,	%o3
	fmovrdlz	%l0,	%f4,	%f14
	andncc	%l2,	%i4,	%g1
	movre	%o5,	0x0AA,	%o0
	movvs	%xcc,	%i0,	%o1
	edge8l	%l5,	%o6,	%o4
	save %l3, 0x0BF2, %g3
	movgu	%xcc,	%g6,	%g7
	ldub	[%l7 + 0x57],	%i5
	stx	%i6,	[%l7 + 0x18]
	fmovsne	%xcc,	%f2,	%f9
	addccc	%g4,	0x16AD,	%i1
	edge8l	%g2,	%o2,	%i2
	fcmpeq16	%f0,	%f2,	%i3
	lduh	[%l7 + 0x72],	%g5
	andncc	%i7,	%o7,	%l6
	edge16	%l1,	%o3,	%l0
	edge32n	%l2,	%i4,	%g1
	ldsb	[%l7 + 0x11],	%o5
	for	%f10,	%f10,	%f4
	array16	%l4,	%i0,	%o0
	edge8n	%o1,	%o6,	%l5
	xnorcc	%l3,	0x1015,	%g3
	udivx	%o4,	0x098F,	%g7
	andcc	%g6,	%i5,	%i6
	ldub	[%l7 + 0x17],	%i1
	fmovsg	%xcc,	%f2,	%f5
	alignaddrl	%g2,	%o2,	%g4
	andncc	%i2,	%i3,	%g5
	fpack32	%f6,	%f10,	%f4
	edge8ln	%i7,	%l6,	%l1
	edge32n	%o7,	%l0,	%o3
	addcc	%i4,	0x1EDA,	%g1
	srl	%l2,	%o5,	%l4
	movcc	%icc,	%i0,	%o1
	srlx	%o6,	%l5,	%o0
	edge32	%g3,	%o4,	%g7
	fmovsneg	%xcc,	%f11,	%f7
	xnorcc	%l3,	0x071B,	%g6
	sdivx	%i6,	0x0FCF,	%i5
	fpmerge	%f14,	%f8,	%f10
	fmul8sux16	%f10,	%f0,	%f2
	mulscc	%g2,	%o2,	%i1
	movle	%xcc,	%g4,	%i3
	andn	%g5,	%i7,	%l6
	movneg	%icc,	%i2,	%l1
	movre	%l0,	0x177,	%o7
	movg	%xcc,	%o3,	%g1
	lduw	[%l7 + 0x3C],	%i4
	fpsub16s	%f0,	%f2,	%f12
	fnot2	%f0,	%f14
	fcmped	%fcc3,	%f4,	%f0
	popc	0x1742,	%l2
	stw	%l4,	[%l7 + 0x50]
	and	%o5,	%o1,	%o6
	ldd	[%l7 + 0x08],	%i0
	umul	%o0,	%g3,	%o4
	srlx	%g7,	%l5,	%g6
	move	%icc,	%l3,	%i5
	edge8l	%i6,	%g2,	%o2
	mulx	%i1,	%g4,	%i3
	edge8l	%i7,	%l6,	%g5
	stb	%i2,	[%l7 + 0x6F]
	movgu	%icc,	%l0,	%o7
	movg	%icc,	%o3,	%l1
	fandnot2	%f8,	%f2,	%f8
	movrlez	%i4,	0x23A,	%l2
	alignaddr	%g1,	%o5,	%o1
	addc	%o6,	%l4,	%o0
	subc	%g3,	0x06E2,	%o4
	bshuffle	%f0,	%f14,	%f12
	fnands	%f1,	%f11,	%f0
	fmovrsne	%i0,	%f12,	%f1
	addc	%g7,	0x0E62,	%l5
	alignaddrl	%l3,	%g6,	%i6
	udiv	%g2,	0x0574,	%o2
	fandnot1s	%f1,	%f12,	%f6
	or	%i1,	0x05EF,	%g4
	fpsub32s	%f13,	%f6,	%f6
	movcc	%xcc,	%i5,	%i7
	movrgez	%i3,	0x328,	%l6
	fpadd16s	%f5,	%f7,	%f14
	movge	%icc,	%i2,	%l0
	alignaddr	%o7,	%g5,	%l1
	subccc	%o3,	%i4,	%l2
	movn	%xcc,	%g1,	%o1
	xor	%o5,	%l4,	%o0
	ldsb	[%l7 + 0x10],	%g3
	ld	[%l7 + 0x74],	%f6
	edge8n	%o6,	%i0,	%g7
	fmovda	%icc,	%f14,	%f0
	edge32l	%o4,	%l3,	%g6
	srl	%l5,	0x05,	%g2
	ldd	[%l7 + 0x30],	%f2
	mova	%icc,	%o2,	%i1
	fpmerge	%f11,	%f6,	%f0
	fmovdl	%icc,	%f4,	%f13
	subc	%g4,	0x05A4,	%i5
	edge8	%i6,	%i3,	%i7
	sub	%l6,	%i2,	%o7
	stw	%g5,	[%l7 + 0x68]
	orncc	%l1,	%o3,	%i4
	fnegs	%f7,	%f12
	addcc	%l2,	0x11D5,	%g1
	fmovsvs	%xcc,	%f0,	%f7
	movn	%xcc,	%l0,	%o5
	xorcc	%l4,	%o1,	%o0
	edge8	%o6,	%g3,	%i0
	movleu	%icc,	%g7,	%o4
	fpack32	%f0,	%f8,	%f6
	edge16n	%l3,	%g6,	%g2
	edge32l	%o2,	%l5,	%g4
	movvc	%xcc,	%i5,	%i6
	pdist	%f8,	%f8,	%f8
	edge32l	%i1,	%i7,	%i3
	orcc	%i2,	%o7,	%l6
	sth	%l1,	[%l7 + 0x46]
	addcc	%o3,	%g5,	%l2
	fandnot2s	%f1,	%f0,	%f2
	fnand	%f6,	%f14,	%f2
	fpsub32	%f0,	%f2,	%f6
	stw	%g1,	[%l7 + 0x48]
	sdiv	%i4,	0x00FD,	%l0
	mova	%icc,	%l4,	%o5
	fmovdg	%icc,	%f0,	%f15
	srl	%o0,	%o1,	%g3
	movne	%icc,	%o6,	%i0
	subcc	%o4,	0x03E3,	%g7
	movl	%icc,	%l3,	%g6
	sdiv	%g2,	0x07C6,	%l5
	addc	%o2,	0x1629,	%i5
	for	%f14,	%f0,	%f4
	std	%f12,	[%l7 + 0x78]
	fmovsge	%xcc,	%f12,	%f4
	fand	%f6,	%f14,	%f6
	srax	%i6,	0x06,	%g4
	sllx	%i7,	%i3,	%i1
	mulscc	%i2,	0x04DC,	%o7
	movcc	%icc,	%l1,	%o3
	restore %g5, 0x180D, %l6
	fmovdcs	%icc,	%f12,	%f1
	fornot1s	%f7,	%f8,	%f14
	ldsh	[%l7 + 0x2E],	%g1
	edge8n	%l2,	%l0,	%l4
	edge32n	%i4,	%o0,	%o5
	siam	0x0
	fmovdcc	%xcc,	%f5,	%f15
	alignaddr	%g3,	%o6,	%o1
	mulscc	%i0,	%o4,	%g7
	movrgz	%g6,	0x129,	%l3
	movvs	%xcc,	%g2,	%l5
	movgu	%xcc,	%o2,	%i6
	edge16ln	%i5,	%g4,	%i3
	fmul8x16	%f4,	%f6,	%f10
	edge8l	%i7,	%i2,	%i1
	movpos	%xcc,	%o7,	%o3
	move	%icc,	%l1,	%l6
	sth	%g5,	[%l7 + 0x4A]
	alignaddr	%l2,	%g1,	%l0
	fand	%f6,	%f2,	%f2
	andcc	%i4,	0x06AF,	%l4
	ldd	[%l7 + 0x18],	%o0
	fpsub16	%f0,	%f14,	%f10
	ld	[%l7 + 0x18],	%f5
	movvc	%xcc,	%g3,	%o5
	addcc	%o1,	%i0,	%o6
	lduh	[%l7 + 0x0E],	%g7
	fpadd16	%f14,	%f6,	%f6
	ldx	[%l7 + 0x28],	%o4
	subcc	%g6,	%g2,	%l3
	movn	%xcc,	%o2,	%i6
	fmovdpos	%icc,	%f2,	%f11
	xor	%i5,	0x08F5,	%g4
	fornot2	%f6,	%f12,	%f0
	save %i3, %l5, %i7
	edge32n	%i1,	%i2,	%o3
	orcc	%l1,	0x0C69,	%l6
	std	%f8,	[%l7 + 0x18]
	movcs	%xcc,	%o7,	%g5
	subc	%g1,	0x144A,	%l0
	lduw	[%l7 + 0x14],	%l2
	save %i4, 0x0CD5, %o0
	fmovrsgez	%l4,	%f14,	%f1
	xnor	%g3,	0x0C2C,	%o1
	edge16n	%o5,	%i0,	%o6
	fmovsg	%icc,	%f15,	%f10
	fmul8x16	%f5,	%f0,	%f14
	movrgz	%o4,	%g7,	%g6
	fcmpgt32	%f14,	%f10,	%g2
	fpadd32s	%f3,	%f13,	%f15
	xnor	%o2,	0x1F6A,	%l3
	stb	%i6,	[%l7 + 0x6E]
	edge32ln	%g4,	%i3,	%l5
	fors	%f14,	%f5,	%f2
	edge8l	%i5,	%i7,	%i2
	ldsh	[%l7 + 0x50],	%o3
	xorcc	%i1,	0x0F4C,	%l6
	movvc	%xcc,	%l1,	%o7
	fmovrslez	%g1,	%f13,	%f9
	udivcc	%g5,	0x0135,	%l0
	xnor	%i4,	0x1AFC,	%l2
	fmovdpos	%xcc,	%f2,	%f5
	xnor	%o0,	%g3,	%o1
	edge8n	%l4,	%i0,	%o5
	fmovrdne	%o4,	%f12,	%f4
	edge16n	%o6,	%g6,	%g7
	lduw	[%l7 + 0x64],	%o2
	mulscc	%g2,	%i6,	%l3
	movn	%xcc,	%g4,	%i3
	udivx	%i5,	0x1DEC,	%l5
	movne	%xcc,	%i2,	%o3
	edge16n	%i7,	%i1,	%l6
	fpsub32s	%f8,	%f10,	%f9
	array16	%l1,	%o7,	%g1
	array32	%l0,	%g5,	%i4
	udiv	%o0,	0x03D3,	%l2
	fmovspos	%xcc,	%f13,	%f13
	fpmerge	%f12,	%f9,	%f0
	sdivcc	%g3,	0x01B7,	%o1
	fmovdle	%icc,	%f6,	%f14
	subccc	%l4,	0x0FFA,	%o5
	sll	%o4,	0x05,	%o6
	fpadd16s	%f8,	%f6,	%f4
	subc	%g6,	0x16F2,	%g7
	subcc	%i0,	%g2,	%o2
	std	%f4,	[%l7 + 0x38]
	stb	%i6,	[%l7 + 0x74]
	alignaddr	%g4,	%i3,	%i5
	ldsw	[%l7 + 0x54],	%l5
	fpmerge	%f10,	%f9,	%f6
	edge16l	%l3,	%i2,	%i7
	subcc	%o3,	%i1,	%l1
	udiv	%l6,	0x17B6,	%o7
	and	%g1,	0x0BAF,	%g5
	edge16n	%i4,	%l0,	%o0
	edge32n	%g3,	%l2,	%o1
	edge8	%o5,	%o4,	%l4
	edge8ln	%o6,	%g6,	%g7
	mova	%icc,	%g2,	%i0
	srlx	%o2,	0x03,	%i6
	ld	[%l7 + 0x74],	%f8
	ldsh	[%l7 + 0x26],	%g4
	xor	%i3,	0x0309,	%l5
	fmovsl	%icc,	%f1,	%f12
	ldsh	[%l7 + 0x58],	%i5
	ldd	[%l7 + 0x20],	%l2
	smulcc	%i7,	%i2,	%i1
	addc	%l1,	0x155C,	%o3
	std	%f10,	[%l7 + 0x50]
	fpsub16s	%f11,	%f0,	%f1
	edge16ln	%l6,	%g1,	%o7
	edge32ln	%g5,	%l0,	%i4
	movg	%xcc,	%g3,	%o0
	movneg	%xcc,	%l2,	%o1
	sdivx	%o5,	0x13C0,	%l4
	movpos	%xcc,	%o6,	%o4
	udivcc	%g7,	0x1DEA,	%g2
	movcc	%icc,	%g6,	%o2
	fmovdgu	%xcc,	%f10,	%f11
	fone	%f4
	movn	%xcc,	%i0,	%i6
	lduh	[%l7 + 0x0C],	%g4
	edge8n	%i3,	%l5,	%i5
	or	%i7,	%l3,	%i1
	sdivcc	%l1,	0x0E50,	%i2
	movrlez	%o3,	0x2E5,	%g1
	edge8l	%l6,	%o7,	%g5
	add	%l0,	0x0C8C,	%i4
	or	%g3,	0x16DF,	%l2
	xnor	%o0,	0x184D,	%o5
	ldd	[%l7 + 0x58],	%f2
	srax	%l4,	0x1F,	%o1
	andncc	%o4,	%o6,	%g7
	fmuld8ulx16	%f9,	%f15,	%f4
	movn	%xcc,	%g6,	%g2
	fmovrdlez	%i0,	%f10,	%f2
	xor	%i6,	0x0569,	%g4
	stx	%o2,	[%l7 + 0x10]
	smul	%l5,	%i5,	%i7
	andcc	%l3,	%i1,	%l1
	mulscc	%i2,	%o3,	%i3
	srlx	%g1,	0x0D,	%l6
	restore %o7, 0x1922, %g5
	addc	%l0,	%g3,	%l2
	fnot1	%f2,	%f12
	fabss	%f8,	%f11
	fnegd	%f6,	%f12
	movne	%xcc,	%i4,	%o0
	fnot2	%f8,	%f2
	array32	%l4,	%o1,	%o5
	xnorcc	%o4,	0x0A36,	%o6
	move	%icc,	%g6,	%g2
	fxor	%f12,	%f14,	%f8
	fpadd32s	%f11,	%f5,	%f7
	orn	%i0,	%g7,	%i6
	move	%icc,	%o2,	%g4
	edge16l	%l5,	%i7,	%l3
	movre	%i5,	%i1,	%l1
	xorcc	%o3,	0x0F8C,	%i2
	ldd	[%l7 + 0x18],	%i2
	edge32	%l6,	%g1,	%g5
	fcmpne16	%f2,	%f10,	%l0
	fmovrde	%o7,	%f4,	%f4
	popc	0x1F5A,	%l2
	array16	%i4,	%o0,	%g3
	orn	%l4,	%o1,	%o5
	xorcc	%o6,	0x09B2,	%g6
	movl	%icc,	%o4,	%g2
	xor	%i0,	%i6,	%o2
	fzero	%f0
	std	%f10,	[%l7 + 0x38]
	ldd	[%l7 + 0x48],	%g6
	fpadd32	%f10,	%f8,	%f4
	fmovdneg	%xcc,	%f7,	%f2
	fmovrslez	%g4,	%f1,	%f12
	lduh	[%l7 + 0x0C],	%l5
	movpos	%xcc,	%l3,	%i5
	ld	[%l7 + 0x30],	%f6
	std	%f4,	[%l7 + 0x10]
	restore %i1, %l1, %i7
	mova	%icc,	%i2,	%i3
	andncc	%o3,	%l6,	%g5
	sub	%l0,	0x0D22,	%g1
	edge16l	%l2,	%i4,	%o7
	lduw	[%l7 + 0x54],	%o0
	sll	%l4,	0x06,	%g3
	movrlz	%o1,	0x007,	%o5
	fmovscs	%icc,	%f13,	%f14
	edge8	%g6,	%o4,	%g2
	edge8l	%i0,	%o6,	%o2
	lduh	[%l7 + 0x0A],	%g7
	movleu	%icc,	%i6,	%l5
	edge16l	%l3,	%i5,	%i1
	edge32n	%l1,	%g4,	%i7
	sdivx	%i3,	0x175F,	%o3
	umulcc	%l6,	%i2,	%g5
	save %g1, %l0, %i4
	fcmped	%fcc3,	%f12,	%f6
	edge16	%l2,	%o0,	%l4
	movge	%icc,	%g3,	%o7
	andncc	%o5,	%o1,	%g6
	fsrc1	%f12,	%f10
	fnegs	%f8,	%f5
	restore %g2, %o4, %i0
	stw	%o6,	[%l7 + 0x2C]
	stx	%g7,	[%l7 + 0x68]
	edge16l	%i6,	%o2,	%l3
	fandnot2s	%f12,	%f10,	%f0
	movge	%xcc,	%i5,	%i1
	sdivcc	%l5,	0x1BED,	%l1
	orcc	%g4,	%i3,	%o3
	fmovsl	%xcc,	%f15,	%f8
	edge32n	%i7,	%l6,	%g5
	sth	%i2,	[%l7 + 0x54]
	movn	%xcc,	%l0,	%i4
	edge32n	%g1,	%l2,	%o0
	movrlez	%g3,	%l4,	%o7
	move	%icc,	%o5,	%g6
	xnorcc	%o1,	%o4,	%i0
	udivcc	%g2,	0x1018,	%o6
	stb	%i6,	[%l7 + 0x53]
	udiv	%o2,	0x0EA2,	%g7
	sll	%i5,	%i1,	%l3
	alignaddrl	%l1,	%g4,	%i3
	xnor	%o3,	%l5,	%l6
	lduh	[%l7 + 0x52],	%i7
	movrlez	%i2,	%l0,	%g5
	movcs	%icc,	%g1,	%i4
	fmovrde	%l2,	%f8,	%f8
	mulscc	%o0,	0x0E90,	%g3
	ldsw	[%l7 + 0x40],	%o7
	fnand	%f14,	%f2,	%f4
	xnorcc	%o5,	%l4,	%g6
	ldsb	[%l7 + 0x20],	%o1
	fmovsneg	%xcc,	%f4,	%f12
	fmovde	%xcc,	%f15,	%f13
	addccc	%o4,	0x1E9A,	%g2
	fmovdne	%xcc,	%f10,	%f6
	mova	%icc,	%o6,	%i6
	movrgez	%o2,	0x3E1,	%g7
	movpos	%xcc,	%i0,	%i5
	fmovse	%icc,	%f4,	%f8
	ldub	[%l7 + 0x11],	%l3
	andcc	%i1,	0x0157,	%g4
	srlx	%i3,	0x00,	%o3
	edge16	%l5,	%l1,	%l6
	edge32n	%i7,	%l0,	%i2
	edge32n	%g1,	%i4,	%g5
	fmovrse	%o0,	%f15,	%f1
	fnand	%f4,	%f10,	%f8
	edge16ln	%g3,	%o7,	%o5
	xnorcc	%l2,	0x00C7,	%l4
	orcc	%o1,	0x0368,	%g6
	movrgz	%g2,	%o6,	%i6
	fcmpgt16	%f6,	%f10,	%o4
	edge8ln	%o2,	%i0,	%i5
	srax	%g7,	%i1,	%l3
	movn	%icc,	%g4,	%o3
	movvs	%xcc,	%l5,	%l1
	fpadd16s	%f0,	%f6,	%f4
	subccc	%i3,	%i7,	%l0
	movre	%i2,	0x2A7,	%l6
	fmovdg	%xcc,	%f2,	%f6
	movrlz	%i4,	%g5,	%o0
	fmovsg	%xcc,	%f8,	%f5
	subccc	%g3,	0x03ED,	%o7
	movgu	%xcc,	%o5,	%g1
	fmovrsne	%l2,	%f5,	%f14
	and	%o1,	0x0DD4,	%g6
	st	%f11,	[%l7 + 0x54]
	sdivx	%l4,	0x0365,	%g2
	udiv	%i6,	0x0BEB,	%o4
	sra	%o6,	0x0C,	%i0
	popc	0x18E9,	%o2
	addccc	%i5,	%i1,	%l3
	stw	%g7,	[%l7 + 0x40]
	movrlz	%o3,	%g4,	%l1
	fcmple16	%f12,	%f2,	%i3
	movrlz	%i7,	0x286,	%l5
	ldub	[%l7 + 0x46],	%i2
	fmovdcs	%xcc,	%f11,	%f4
	fmovsneg	%icc,	%f6,	%f5
	lduh	[%l7 + 0x20],	%l0
	smulcc	%l6,	0x10A7,	%g5
	xnorcc	%i4,	%o0,	%g3
	ldsw	[%l7 + 0x50],	%o5
	movn	%xcc,	%o7,	%l2
	fnor	%f4,	%f8,	%f2
	sth	%g1,	[%l7 + 0x4C]
	edge32n	%g6,	%l4,	%g2
	array16	%i6,	%o1,	%o4
	fnot2	%f2,	%f10
	fmovsleu	%icc,	%f2,	%f15
	fmovdge	%icc,	%f6,	%f14
	fpadd32s	%f2,	%f3,	%f6
	movrne	%i0,	%o2,	%o6
	movge	%xcc,	%i1,	%i5
	addcc	%l3,	0x14F4,	%o3
	sll	%g4,	0x0D,	%l1
	fone	%f2
	edge32l	%i3,	%i7,	%l5
	edge8ln	%g7,	%i2,	%l6
	xorcc	%l0,	0x0369,	%g5
	sth	%i4,	[%l7 + 0x66]
	array32	%o0,	%g3,	%o7
	andn	%l2,	%g1,	%g6
	ldub	[%l7 + 0x24],	%o5
	popc	%l4,	%i6
	fmovrse	%g2,	%f8,	%f12
	lduw	[%l7 + 0x44],	%o1
	save %o4, %o2, %o6
	andn	%i0,	%i1,	%l3
	fcmpne32	%f6,	%f12,	%i5
	movl	%icc,	%o3,	%l1
	fsrc2s	%f2,	%f3
	movgu	%icc,	%g4,	%i7
	fandnot2s	%f4,	%f1,	%f9
	movcs	%xcc,	%l5,	%i3
	edge32n	%g7,	%i2,	%l0
	fmovdgu	%xcc,	%f1,	%f15
	alignaddr	%g5,	%i4,	%o0
	lduh	[%l7 + 0x1A],	%l6
	edge32	%g3,	%o7,	%g1
	subccc	%g6,	0x00F6,	%o5
	array32	%l2,	%i6,	%l4
	lduw	[%l7 + 0x4C],	%g2
	fmovdle	%xcc,	%f10,	%f10
	mulx	%o4,	0x1611,	%o1
	addccc	%o6,	%o2,	%i1
	sdivx	%i0,	0x0D08,	%i5
	ldd	[%l7 + 0x30],	%f6
	restore %l3, %l1, %g4
	stx	%o3,	[%l7 + 0x48]
	save %i7, 0x1F84, %l5
	alignaddr	%g7,	%i2,	%i3
	edge16l	%g5,	%l0,	%i4
	udivx	%o0,	0x03AE,	%g3
	pdist	%f4,	%f12,	%f12
	movrlz	%o7,	%g1,	%g6
	fones	%f5
	edge8ln	%l6,	%o5,	%i6
	stw	%l4,	[%l7 + 0x78]
	fmul8x16al	%f4,	%f13,	%f8
	srax	%g2,	0x0B,	%o4
	sdivcc	%l2,	0x0DAD,	%o6
	ldd	[%l7 + 0x18],	%o2
	udivcc	%o1,	0x0B04,	%i0
	movne	%xcc,	%i5,	%i1
	fmovda	%xcc,	%f11,	%f1
	ldsw	[%l7 + 0x1C],	%l1
	movrlz	%g4,	0x1B9,	%o3
	sdivcc	%l3,	0x1C90,	%l5
	movn	%xcc,	%i7,	%g7
	ldd	[%l7 + 0x40],	%i2
	edge16l	%i3,	%l0,	%i4
	movvc	%icc,	%o0,	%g5
	srlx	%o7,	0x1D,	%g3
	edge8	%g1,	%g6,	%l6
	sll	%o5,	0x1A,	%l4
	movg	%icc,	%i6,	%o4
	fpack16	%f2,	%f13
	subcc	%g2,	%o6,	%l2
	fmovdn	%xcc,	%f15,	%f6
	stb	%o1,	[%l7 + 0x29]
	edge8l	%o2,	%i5,	%i0
	xorcc	%l1,	%i1,	%g4
	fmovdcs	%icc,	%f1,	%f9
	sra	%o3,	%l5,	%l3
	sdivcc	%g7,	0x174A,	%i2
	movg	%xcc,	%i3,	%l0
	movne	%icc,	%i7,	%i4
	edge32l	%o0,	%o7,	%g5
	addccc	%g1,	0x05BA,	%g3
	ldsb	[%l7 + 0x39],	%g6
	popc	0x0FA5,	%o5
	popc	%l6,	%l4
	edge8ln	%o4,	%g2,	%i6
	edge32	%o6,	%l2,	%o2
	srl	%i5,	%i0,	%l1
	movcc	%xcc,	%o1,	%i1
	fnegd	%f4,	%f0
	movpos	%icc,	%g4,	%o3
	alignaddrl	%l5,	%g7,	%i2
	fmovdge	%icc,	%f0,	%f5
	udivcc	%l3,	0x04A8,	%l0
	edge8n	%i3,	%i4,	%i7
	movle	%icc,	%o0,	%g5
	popc	0x0ABE,	%o7
	stb	%g1,	[%l7 + 0x33]
	fmovdn	%icc,	%f8,	%f7
	stw	%g3,	[%l7 + 0x18]
	movcc	%xcc,	%o5,	%l6
	srlx	%l4,	%g6,	%o4
	fmovsneg	%icc,	%f15,	%f3
	st	%f9,	[%l7 + 0x28]
	movl	%icc,	%i6,	%g2
	mulx	%o6,	0x07AE,	%o2
	std	%f4,	[%l7 + 0x78]
	orcc	%l2,	%i0,	%i5
	mulx	%l1,	0x0101,	%o1
	fzero	%f12
	fones	%f9
	movrgz	%g4,	0x18B,	%i1
	ldd	[%l7 + 0x38],	%f4
	mulscc	%o3,	%l5,	%i2
	addccc	%l3,	%g7,	%i3
	fone	%f14
	array16	%i4,	%l0,	%i7
	array8	%o0,	%o7,	%g1
	edge16	%g3,	%o5,	%l6
	udivx	%l4,	0x108D,	%g5
	movvc	%xcc,	%g6,	%i6
	smul	%g2,	0x0B5C,	%o4
	andncc	%o6,	%l2,	%o2
	fcmpne32	%f6,	%f6,	%i0
	array32	%i5,	%o1,	%g4
	std	%f6,	[%l7 + 0x10]
	sub	%l1,	0x0586,	%o3
	fmovrsne	%i1,	%f1,	%f10
	mulscc	%l5,	%l3,	%g7
	array8	%i2,	%i4,	%l0
	fmovsne	%xcc,	%f5,	%f14
	fmovsneg	%icc,	%f2,	%f3
	stb	%i3,	[%l7 + 0x53]
	edge32n	%i7,	%o0,	%o7
	array16	%g3,	%g1,	%o5
	movvs	%xcc,	%l6,	%g5
	subcc	%l4,	0x0C59,	%g6
	fxnor	%f6,	%f12,	%f0
	udiv	%g2,	0x0CC4,	%o4
	fabss	%f11,	%f13
	subccc	%o6,	%l2,	%i6
	st	%f0,	[%l7 + 0x3C]
	sethi	0x0BCD,	%i0
	sllx	%i5,	%o1,	%g4
	and	%o2,	%l1,	%i1
	umul	%l5,	0x18CB,	%l3
	edge8n	%o3,	%i2,	%i4
	movneg	%xcc,	%g7,	%i3
	lduw	[%l7 + 0x6C],	%i7
	fmul8x16au	%f8,	%f5,	%f10
	edge16l	%o0,	%l0,	%g3
	udiv	%g1,	0x168C,	%o5
	fpackfix	%f2,	%f7
	movrlz	%l6,	0x1D2,	%o7
	xor	%l4,	%g6,	%g2
	sra	%g5,	0x19,	%o4
	orcc	%o6,	0x01E8,	%i6
	stx	%i0,	[%l7 + 0x50]
	stb	%l2,	[%l7 + 0x1F]
	sth	%o1,	[%l7 + 0x70]
	movle	%icc,	%i5,	%g4
	umul	%o2,	0x1942,	%l1
	smul	%l5,	0x1F97,	%l3
	fmovdcc	%xcc,	%f14,	%f8
	movneg	%xcc,	%i1,	%i2
	fmul8x16au	%f6,	%f15,	%f6
	udivcc	%o3,	0x1A8D,	%i4
	movrgz	%i3,	0x3E6,	%i7
	save %g7, 0x1089, %l0
	srlx	%g3,	%o0,	%o5
	edge8l	%l6,	%o7,	%l4
	fxnors	%f0,	%f6,	%f14
	movl	%icc,	%g6,	%g1
	sth	%g5,	[%l7 + 0x42]
	fmovsa	%xcc,	%f1,	%f9
	lduh	[%l7 + 0x70],	%o4
	fmovsvc	%xcc,	%f0,	%f7
	ldx	[%l7 + 0x50],	%o6
	edge16n	%g2,	%i6,	%l2
	movneg	%icc,	%o1,	%i0
	movvc	%icc,	%i5,	%o2
	ld	[%l7 + 0x40],	%f1
	sth	%g4,	[%l7 + 0x16]
	sra	%l1,	0x0D,	%l3
	ldsb	[%l7 + 0x57],	%l5
	ld	[%l7 + 0x6C],	%f12
	xnor	%i2,	%o3,	%i1
	movneg	%icc,	%i3,	%i4
	edge8n	%i7,	%l0,	%g3
	and	%g7,	%o5,	%l6
	popc	0x1183,	%o7
	ldd	[%l7 + 0x78],	%f14
	sth	%o0,	[%l7 + 0x56]
	movrgez	%l4,	0x143,	%g6
	fmovrslez	%g5,	%f6,	%f10
	edge32l	%o4,	%o6,	%g1
	ldsw	[%l7 + 0x54],	%i6
	movle	%xcc,	%g2,	%l2
	sdivcc	%o1,	0x1390,	%i5
	for	%f10,	%f12,	%f10
	subcc	%o2,	%g4,	%i0
	addcc	%l1,	%l5,	%i2
	sra	%l3,	0x15,	%i1
	smul	%o3,	0x1657,	%i4
	save %i3, %i7, %g3
	ldsh	[%l7 + 0x42],	%g7
	xor	%o5,	0x0DD2,	%l6
	fxnor	%f4,	%f10,	%f0
	array8	%o7,	%l0,	%l4
	addccc	%o0,	0x16D0,	%g6
	fand	%f2,	%f8,	%f14
	fmovrslez	%o4,	%f15,	%f10
	orcc	%g5,	%o6,	%i6
	fcmpeq16	%f14,	%f10,	%g1
	movrlz	%l2,	0x2BF,	%o1
	udivx	%i5,	0x1451,	%g2
	movrgz	%g4,	0x1FA,	%i0
	sub	%l1,	%l5,	%i2
	lduw	[%l7 + 0x5C],	%o2
	sdiv	%i1,	0x1C97,	%l3
	ldd	[%l7 + 0x08],	%i4
	movpos	%icc,	%i3,	%i7
	xorcc	%g3,	%g7,	%o3
	movne	%xcc,	%l6,	%o5
	orcc	%o7,	0x0904,	%l4
	movpos	%xcc,	%o0,	%g6
	fones	%f9
	xorcc	%l0,	%o4,	%o6
	xor	%g5,	%g1,	%l2
	andcc	%i6,	%i5,	%g2
	array8	%o1,	%g4,	%l1
	movrlz	%l5,	%i0,	%i2
	movle	%xcc,	%o2,	%l3
	fornot2	%f8,	%f6,	%f0
	movge	%icc,	%i4,	%i3
	movpos	%xcc,	%i7,	%g3
	edge32ln	%i1,	%g7,	%o3
	ldsh	[%l7 + 0x56],	%l6
	movvc	%xcc,	%o7,	%o5
	sethi	0x1B52,	%o0
	for	%f4,	%f14,	%f14
	srax	%g6,	0x00,	%l4
	srax	%l0,	%o6,	%o4
	orcc	%g1,	%l2,	%g5
	addccc	%i6,	0x1C48,	%i5
	subc	%g2,	0x015E,	%g4
	add	%l1,	%l5,	%o1
	fmovsleu	%icc,	%f0,	%f11
	movge	%icc,	%i2,	%o2
	movne	%icc,	%l3,	%i4
	subccc	%i0,	%i7,	%g3
	stw	%i3,	[%l7 + 0x14]
	fmovrdlez	%i1,	%f4,	%f6
	lduw	[%l7 + 0x0C],	%g7
	xor	%l6,	%o7,	%o5
	fmovscc	%xcc,	%f9,	%f2
	fcmple32	%f10,	%f12,	%o0
	edge32ln	%o3,	%l4,	%l0
	ldsw	[%l7 + 0x60],	%g6
	movrgez	%o6,	%g1,	%o4
	ldd	[%l7 + 0x38],	%g4
	umul	%l2,	0x002F,	%i6
	subcc	%g2,	%i5,	%g4
	fsrc2	%f10,	%f12
	xnor	%l5,	0x0761,	%l1
	save %o1, 0x1C1C, %i2
	fpack32	%f10,	%f14,	%f2
	fmovsvs	%icc,	%f10,	%f5
	andcc	%l3,	0x0B66,	%i4
	mulscc	%o2,	0x1930,	%i7
	movle	%icc,	%i0,	%g3
	movvs	%xcc,	%i1,	%g7
	sdiv	%l6,	0x03F0,	%i3
	fmovdn	%icc,	%f14,	%f2
	ldsw	[%l7 + 0x54],	%o5
	andcc	%o0,	%o3,	%o7
	movn	%xcc,	%l0,	%l4
	fmuld8sux16	%f1,	%f0,	%f4
	xor	%g6,	0x14C6,	%o6
	ldub	[%l7 + 0x74],	%o4
	andn	%g1,	%g5,	%i6
	fmovscs	%icc,	%f4,	%f14
	fmovdne	%icc,	%f9,	%f7
	udivx	%l2,	0x1172,	%i5
	fmuld8sux16	%f2,	%f14,	%f12
	movneg	%xcc,	%g4,	%g2
	movrlez	%l5,	%l1,	%o1
	fnegs	%f14,	%f8
	movg	%xcc,	%l3,	%i2
	or	%o2,	0x0DC2,	%i7
	xnorcc	%i0,	0x015E,	%i4
	sll	%g3,	%i1,	%l6
	array8	%g7,	%o5,	%o0
	movrlez	%o3,	0x369,	%o7
	sra	%l0,	0x18,	%l4
	ldd	[%l7 + 0x78],	%g6
	lduh	[%l7 + 0x3A],	%o6
	movrgz	%o4,	%g1,	%i3
	sth	%g5,	[%l7 + 0x70]
	stb	%l2,	[%l7 + 0x0B]
	array32	%i5,	%i6,	%g4
	movpos	%xcc,	%g2,	%l1
	andcc	%l5,	0x02CE,	%o1
	sllx	%i2,	0x1A,	%l3
	fmovdgu	%xcc,	%f6,	%f12
	movvc	%xcc,	%i7,	%o2
	mulscc	%i4,	0x1EDD,	%g3
	sdivx	%i0,	0x1F9D,	%l6
	ldsb	[%l7 + 0x7E],	%g7
	array32	%o5,	%i1,	%o0
	fmovdne	%icc,	%f9,	%f3
	edge32l	%o7,	%l0,	%l4
	fmovdleu	%xcc,	%f12,	%f12
	edge32l	%g6,	%o6,	%o4
	addcc	%o3,	%g1,	%i3
	subc	%g5,	%i5,	%i6
	fmul8x16	%f4,	%f4,	%f0
	fxors	%f6,	%f5,	%f4
	xorcc	%l2,	0x189C,	%g2
	srl	%g4,	0x1B,	%l5
	sllx	%o1,	%l1,	%l3
	orn	%i7,	0x01B8,	%i2
	ldd	[%l7 + 0x28],	%f12
	umul	%i4,	%g3,	%o2
	subccc	%i0,	0x0702,	%g7
	movrne	%o5,	%l6,	%i1
	mulscc	%o7,	0x10C1,	%l0
	mulx	%o0,	%l4,	%g6
	orncc	%o6,	0x0CFE,	%o4
	addc	%o3,	0x0725,	%g1
	lduw	[%l7 + 0x34],	%i3
	edge16	%i5,	%i6,	%l2
	fzeros	%f1
	udivx	%g5,	0x127D,	%g2
	alignaddrl	%g4,	%o1,	%l1
	fmovde	%icc,	%f10,	%f10
	fmovrsne	%l5,	%f5,	%f2
	fmovrdne	%i7,	%f14,	%f8
	udiv	%l3,	0x1522,	%i2
	subcc	%g3,	0x0996,	%i4
	edge8l	%o2,	%g7,	%o5
	fsrc1s	%f10,	%f1
	fmovspos	%xcc,	%f8,	%f1
	sllx	%i0,	%i1,	%l6
	andn	%o7,	%o0,	%l0
	movvs	%xcc,	%g6,	%l4
	stb	%o6,	[%l7 + 0x5E]
	movle	%xcc,	%o4,	%g1
	srax	%i3,	%i5,	%i6
	stx	%l2,	[%l7 + 0x68]
	xor	%g5,	0x120C,	%o3
	alignaddrl	%g2,	%g4,	%l1
	fxnor	%f14,	%f10,	%f14
	std	%f0,	[%l7 + 0x48]
	ldub	[%l7 + 0x66],	%l5
	ldub	[%l7 + 0x32],	%o1
	lduh	[%l7 + 0x68],	%l3
	fand	%f6,	%f10,	%f4
	movrgez	%i7,	%i2,	%g3
	movvc	%xcc,	%o2,	%g7
	fmovd	%f10,	%f8
	edge8ln	%i4,	%i0,	%o5
	movrne	%i1,	0x3DD,	%o7
	movleu	%xcc,	%l6,	%o0
	move	%icc,	%l0,	%l4
	umulcc	%o6,	%o4,	%g6
	sra	%i3,	0x06,	%g1
	xnor	%i6,	0x1CB5,	%i5
	movge	%xcc,	%g5,	%o3
	umulcc	%g2,	0x189C,	%l2
	movrgz	%g4,	%l5,	%l1
	mulscc	%l3,	0x0598,	%i7
	mulscc	%i2,	%o1,	%o2
	subc	%g3,	0x12DF,	%i4
	lduw	[%l7 + 0x68],	%i0
	smulcc	%g7,	0x06F9,	%i1
	orncc	%o7,	0x0D85,	%l6
	udiv	%o0,	0x16F8,	%l0
	lduw	[%l7 + 0x2C],	%l4
	stb	%o5,	[%l7 + 0x20]
	popc	%o6,	%g6
	movneg	%xcc,	%o4,	%g1
	movrne	%i6,	%i3,	%g5
	restore %i5, 0x0ECD, %o3
	fexpand	%f14,	%f4
	fmovsneg	%icc,	%f13,	%f7
	bshuffle	%f0,	%f0,	%f8
	edge16	%l2,	%g4,	%g2
	sth	%l5,	[%l7 + 0x1C]
	addccc	%l1,	0x134D,	%l3
	fnot2s	%f7,	%f15
	udivx	%i7,	0x1653,	%o1
	ldsw	[%l7 + 0x78],	%i2
	ldx	[%l7 + 0x40],	%g3
	addc	%i4,	%i0,	%o2
	pdist	%f14,	%f4,	%f0
	edge16	%i1,	%o7,	%l6
	xnorcc	%g7,	0x0591,	%l0
	fnegd	%f12,	%f12
	ldd	[%l7 + 0x58],	%f12
	addccc	%o0,	%l4,	%o6
	ldx	[%l7 + 0x30],	%o5
	umulcc	%g6,	0x1EAC,	%g1
	fcmps	%fcc0,	%f6,	%f11
	movrlz	%o4,	0x178,	%i3
	stx	%i6,	[%l7 + 0x28]
	fmovd	%f2,	%f8
	fcmpgt32	%f10,	%f0,	%g5
	fmovdgu	%xcc,	%f5,	%f14
	fmovdl	%xcc,	%f3,	%f10
	xor	%i5,	0x067E,	%o3
	edge32ln	%g4,	%l2,	%g2
	srlx	%l1,	0x0F,	%l3
	lduw	[%l7 + 0x78],	%i7
	umulcc	%l5,	%o1,	%i2
	fcmped	%fcc0,	%f0,	%f6
	restore %i4, %i0, %g3
	restore %i1, 0x03AD, %o7
	ldsw	[%l7 + 0x70],	%o2
	ldsw	[%l7 + 0x40],	%l6
	xorcc	%g7,	%o0,	%l0
	fmovrslez	%l4,	%f6,	%f3
	movvc	%icc,	%o5,	%o6
	edge8ln	%g1,	%o4,	%g6
	mova	%xcc,	%i6,	%g5
	movrne	%i5,	0x04B,	%o3
	fnot2s	%f0,	%f0
	restore %i3, 0x1497, %g4
	fnot1	%f2,	%f0
	subc	%l2,	0x0FFF,	%g2
	fmuld8ulx16	%f1,	%f0,	%f4
	stx	%l3,	[%l7 + 0x18]
	edge16ln	%l1,	%i7,	%o1
	fpadd16s	%f6,	%f5,	%f2
	fpadd16s	%f0,	%f3,	%f15
	addc	%i2,	0x1B34,	%i4
	sra	%i0,	%g3,	%i1
	edge8l	%o7,	%o2,	%l6
	bshuffle	%f6,	%f14,	%f8
	movge	%xcc,	%l5,	%g7
	sethi	0x0AA7,	%l0
	ldsw	[%l7 + 0x48],	%l4
	edge16l	%o5,	%o6,	%o0
	fornot1s	%f12,	%f9,	%f11
	add	%o4,	%g6,	%i6
	srax	%g5,	%g1,	%i5
	fpadd16s	%f3,	%f14,	%f13
	fmovsneg	%icc,	%f13,	%f15
	ldsh	[%l7 + 0x52],	%o3
	smulcc	%g4,	%l2,	%g2
	movge	%xcc,	%l3,	%i3
	udiv	%i7,	0x0D5B,	%l1
	ldx	[%l7 + 0x58],	%i2
	movrlez	%i4,	0x3B9,	%i0
	ldd	[%l7 + 0x58],	%o0
	subccc	%g3,	%i1,	%o2
	fpadd16	%f4,	%f8,	%f2
	fandnot2s	%f15,	%f9,	%f1
	fmovdvc	%icc,	%f6,	%f14
	srlx	%o7,	0x0F,	%l5
	array8	%l6,	%g7,	%l4
	fmovsgu	%icc,	%f3,	%f15
	movgu	%xcc,	%l0,	%o5
	fcmpgt16	%f10,	%f6,	%o6
	addcc	%o4,	0x1EF9,	%o0
	lduh	[%l7 + 0x24],	%i6
	movvs	%xcc,	%g6,	%g5
	movrgez	%g1,	0x1FA,	%i5
	ldd	[%l7 + 0x38],	%f8
	ldub	[%l7 + 0x61],	%o3
	umulcc	%g4,	%g2,	%l3
	popc	0x0198,	%l2
	st	%f5,	[%l7 + 0x38]
	fmovs	%f1,	%f5
	fxors	%f4,	%f11,	%f6
	addcc	%i7,	%l1,	%i2
	st	%f5,	[%l7 + 0x68]
	movrgz	%i3,	%i0,	%i4
	movcs	%xcc,	%g3,	%i1
	ldsw	[%l7 + 0x64],	%o2
	ldsb	[%l7 + 0x7A],	%o1
	alignaddrl	%l5,	%o7,	%l6
	andn	%g7,	0x098C,	%l4
	st	%f4,	[%l7 + 0x6C]
	edge8	%o5,	%l0,	%o6
	or	%o0,	0x12CA,	%o4
	fnot1s	%f9,	%f9
	add	%i6,	%g6,	%g1
	ldub	[%l7 + 0x4F],	%i5
	andn	%g5,	0x1D2D,	%g4
	fxnor	%f2,	%f10,	%f12
	fpsub32s	%f12,	%f9,	%f7
	srax	%g2,	%o3,	%l3
	fmovdcc	%xcc,	%f14,	%f9
	movl	%icc,	%i7,	%l2
	ldsh	[%l7 + 0x74],	%i2
	fcmpgt32	%f0,	%f2,	%l1
	st	%f0,	[%l7 + 0x44]
	ldd	[%l7 + 0x10],	%f12
	stb	%i3,	[%l7 + 0x26]
	movcc	%icc,	%i4,	%i0
	fcmple32	%f10,	%f0,	%i1
	alignaddrl	%g3,	%o1,	%o2
	save %l5, 0x119F, %o7
	sdivx	%l6,	0x16C1,	%g7
	popc	%l4,	%o5
	andncc	%o6,	%o0,	%o4
	edge32	%i6,	%g6,	%g1
	movvs	%icc,	%l0,	%g5
	fcmpd	%fcc2,	%f4,	%f2
	and	%g4,	0x1A05,	%i5
	fmovrse	%g2,	%f2,	%f15
	subccc	%l3,	%i7,	%l2
	edge8l	%o3,	%l1,	%i2
	sth	%i3,	[%l7 + 0x7A]
	ldd	[%l7 + 0x78],	%i0
	fpadd32	%f0,	%f14,	%f6
	array32	%i1,	%i4,	%o1
	addc	%o2,	0x1144,	%l5
	ldub	[%l7 + 0x3B],	%o7
	alignaddr	%g3,	%l6,	%g7
	andcc	%o5,	0x0E40,	%l4
	sdivcc	%o0,	0x18CD,	%o4
	edge16ln	%o6,	%i6,	%g1
	fcmpeq16	%f0,	%f12,	%g6
	sth	%l0,	[%l7 + 0x5A]
	ldd	[%l7 + 0x48],	%g4
	movcs	%icc,	%g5,	%i5
	sth	%g2,	[%l7 + 0x44]
	udivx	%l3,	0x18DB,	%i7
	sdiv	%o3,	0x02FC,	%l2
	subcc	%l1,	%i3,	%i2
	edge16n	%i1,	%i4,	%i0
	andcc	%o1,	0x11EE,	%l5
	add	%o2,	0x0FF0,	%g3
	edge8l	%o7,	%l6,	%o5
	movrgez	%g7,	%l4,	%o0
	umul	%o6,	0x13F6,	%i6
	subc	%g1,	0x122D,	%o4
	movrlz	%g6,	0x354,	%l0
	ldd	[%l7 + 0x58],	%f14
	edge8ln	%g5,	%g4,	%i5
	edge16	%l3,	%g2,	%i7
	addc	%o3,	%l2,	%i3
	orncc	%l1,	0x1EFC,	%i2
	fands	%f1,	%f7,	%f3
	movrgz	%i4,	0x16E,	%i0
	ldd	[%l7 + 0x58],	%f8
	sdivx	%i1,	0x0FB7,	%l5
	sdivx	%o1,	0x0642,	%o2
	fmovda	%icc,	%f0,	%f6
	edge8	%g3,	%l6,	%o5
	andcc	%o7,	%l4,	%g7
	orncc	%o0,	0x1645,	%i6
	fmovrsgez	%o6,	%f8,	%f9
	movl	%xcc,	%g1,	%o4
	andn	%g6,	%g5,	%g4
	addcc	%i5,	%l3,	%g2
	edge16	%i7,	%l0,	%o3
	fpack16	%f2,	%f9
	fmovsle	%xcc,	%f10,	%f13
	fmovrsne	%i3,	%f3,	%f7
	sub	%l2,	%i2,	%i4
	movleu	%icc,	%l1,	%i0
	sra	%i1,	0x0E,	%o1
	edge8ln	%o2,	%g3,	%l5
	umulcc	%o5,	0x18C5,	%o7
	alignaddr	%l6,	%l4,	%o0
	ldx	[%l7 + 0x20],	%i6
	fmovdl	%icc,	%f3,	%f2
	xorcc	%o6,	%g7,	%g1
	fmovd	%f4,	%f10
	stb	%o4,	[%l7 + 0x4B]
	srl	%g6,	%g4,	%g5
	movpos	%icc,	%i5,	%g2
	popc	0x0F84,	%i7
	edge32n	%l0,	%o3,	%i3
	fmovsleu	%xcc,	%f10,	%f6
	movvc	%icc,	%l3,	%i2
	fandnot2	%f4,	%f8,	%f12
	edge8	%l2,	%l1,	%i0
	fnors	%f1,	%f4,	%f11
	addcc	%i1,	0x02C9,	%i4
	edge8l	%o1,	%o2,	%g3
	srax	%l5,	0x1C,	%o7
	st	%f14,	[%l7 + 0x64]
	restore %l6, 0x0D40, %l4
	umul	%o5,	%o0,	%i6
	ldub	[%l7 + 0x49],	%g7
	fmovdpos	%xcc,	%f0,	%f6
	fzero	%f6
	ldsh	[%l7 + 0x08],	%g1
	and	%o6,	%o4,	%g6
	andncc	%g4,	%i5,	%g5
	xorcc	%i7,	0x17C7,	%g2
	smul	%l0,	0x12A4,	%i3
	stb	%l3,	[%l7 + 0x71]
	save %o3, %l2, %l1
	sra	%i0,	0x01,	%i2
	ldsw	[%l7 + 0x58],	%i1
	fmovdcc	%icc,	%f0,	%f3
	fabss	%f5,	%f8
	movrgez	%o1,	%o2,	%i4
	st	%f11,	[%l7 + 0x50]
	mulscc	%l5,	0x1122,	%o7
	ldsh	[%l7 + 0x72],	%g3
	movrgz	%l4,	0x3F3,	%o5
	array16	%o0,	%i6,	%l6
	xor	%g7,	0x136D,	%g1
	sra	%o6,	%o4,	%g6
	addc	%g4,	0x145E,	%g5
	stb	%i5,	[%l7 + 0x60]
	subcc	%g2,	%l0,	%i3
	movle	%xcc,	%l3,	%o3
	andn	%i7,	%l1,	%l2
	fpsub16	%f10,	%f2,	%f12
	sub	%i2,	0x03FE,	%i1
	xnorcc	%i0,	0x1A4D,	%o1
	fmovsvs	%icc,	%f13,	%f13
	fmovsge	%icc,	%f15,	%f11
	fmovscs	%icc,	%f3,	%f2
	movcs	%icc,	%o2,	%l5
	mulscc	%i4,	%g3,	%l4
	movrgz	%o5,	%o7,	%o0
	movne	%xcc,	%i6,	%l6
	fmovsne	%xcc,	%f0,	%f8
	alignaddr	%g7,	%o6,	%g1
	fxors	%f3,	%f15,	%f11
	movrgz	%g6,	%o4,	%g5
	fnegs	%f0,	%f12
	xor	%i5,	%g4,	%l0
	fandnot1s	%f11,	%f1,	%f13
	ldsh	[%l7 + 0x66],	%g2
	movrlz	%l3,	%o3,	%i7
	move	%icc,	%i3,	%l2
	ldd	[%l7 + 0x28],	%f12
	ldd	[%l7 + 0x78],	%i2
	ld	[%l7 + 0x10],	%f11
	fmovdn	%xcc,	%f15,	%f12
	movl	%icc,	%l1,	%i1
	fmovrsgz	%i0,	%f3,	%f1
	smul	%o1,	0x1D60,	%l5
	edge8ln	%i4,	%o2,	%g3
	edge8l	%o5,	%o7,	%o0
	movrlez	%l4,	0x15F,	%l6
	movg	%icc,	%g7,	%o6
	fmovsgu	%icc,	%f6,	%f15
	std	%f4,	[%l7 + 0x70]
	edge8n	%g1,	%g6,	%i6
	srlx	%o4,	0x0F,	%g5
	orn	%i5,	%l0,	%g4
	ldd	[%l7 + 0x18],	%f8
	sdivcc	%g2,	0x1BC7,	%o3
	xnor	%l3,	0x1708,	%i7
	andcc	%i3,	%i2,	%l1
	movrgz	%l2,	0x11E,	%i0
	ldd	[%l7 + 0x40],	%f2
	edge8	%o1,	%i1,	%i4
	xor	%l5,	0x0E82,	%o2
	array16	%g3,	%o7,	%o5
	st	%f8,	[%l7 + 0x4C]
	edge32l	%o0,	%l4,	%g7
	xorcc	%o6,	0x01C1,	%l6
	fmovsge	%icc,	%f0,	%f9
	srlx	%g1,	%g6,	%o4
	movrlz	%i6,	%i5,	%g5
	stw	%g4,	[%l7 + 0x70]
	movcs	%xcc,	%g2,	%o3
	umul	%l3,	%i7,	%i3
	movvc	%xcc,	%i2,	%l1
	addcc	%l2,	0x1A50,	%i0
	umulcc	%o1,	%l0,	%i4
	save %l5, %o2, %i1
	bshuffle	%f8,	%f10,	%f10
	movne	%icc,	%g3,	%o5
	fmovdl	%xcc,	%f6,	%f5
	ldsb	[%l7 + 0x5D],	%o7
	ldd	[%l7 + 0x78],	%f12
	srlx	%l4,	0x03,	%o0
	fandnot2s	%f2,	%f3,	%f5
	udivcc	%o6,	0x1B5A,	%l6
	std	%f12,	[%l7 + 0x68]
	movgu	%icc,	%g7,	%g1
	fnors	%f9,	%f1,	%f0
	umulcc	%o4,	0x1E3C,	%g6
	alignaddr	%i6,	%g5,	%g4
	fmovdvs	%icc,	%f0,	%f10
	xorcc	%g2,	0x0F3F,	%o3
	fmovsle	%xcc,	%f7,	%f12
	array8	%l3,	%i5,	%i7
	fones	%f11
	and	%i3,	%l1,	%i2
	movrlz	%i0,	0x2FF,	%l2
	for	%f6,	%f6,	%f10
	fnegs	%f7,	%f8
	fones	%f5
	popc	%l0,	%o1
	xor	%l5,	0x135B,	%i4
	addc	%o2,	%i1,	%o5
	smulcc	%o7,	0x06FF,	%l4
	sdivx	%o0,	0x1AE2,	%g3
	andcc	%l6,	%g7,	%o6
	addcc	%g1,	0x1DEA,	%o4
	srl	%i6,	%g5,	%g6
	andn	%g4,	0x0FD2,	%o3
	mova	%xcc,	%g2,	%l3
	xnorcc	%i5,	0x097E,	%i7
	movn	%xcc,	%l1,	%i2
	smul	%i0,	%l2,	%l0
	umul	%i3,	%o1,	%l5
	udiv	%i4,	0x08A1,	%i1
	mova	%icc,	%o2,	%o7
	add	%l4,	0x1451,	%o5
	udiv	%o0,	0x07AF,	%g3
	movge	%icc,	%g7,	%o6
	ldsb	[%l7 + 0x7A],	%l6
	movrne	%g1,	0x39E,	%o4
	lduh	[%l7 + 0x44],	%g5
	xorcc	%i6,	0x1A8A,	%g6
	std	%f0,	[%l7 + 0x50]
	or	%o3,	%g4,	%g2
	movleu	%xcc,	%l3,	%i5
	edge8n	%i7,	%i2,	%i0
	movne	%icc,	%l1,	%l0
	ldsw	[%l7 + 0x38],	%l2
	edge8ln	%i3,	%o1,	%i4
	edge8l	%l5,	%o2,	%i1
	ldsh	[%l7 + 0x5E],	%l4
	fcmps	%fcc1,	%f15,	%f8
	popc	0x1CE9,	%o5
	udivcc	%o0,	0x153E,	%o7
	array8	%g3,	%g7,	%l6
	edge8	%g1,	%o4,	%o6
	subccc	%g5,	%i6,	%o3
	fpackfix	%f4,	%f12
	orcc	%g4,	%g2,	%g6
	sethi	0x0878,	%i5
	udivcc	%l3,	0x0ED4,	%i2
	movneg	%icc,	%i0,	%i7
	fmovde	%xcc,	%f7,	%f12
	orncc	%l1,	0x04AF,	%l2
	fcmps	%fcc1,	%f13,	%f10
	subccc	%i3,	%o1,	%l0
	smul	%l5,	%i4,	%i1
	ldd	[%l7 + 0x38],	%o2
	edge8ln	%o5,	%o0,	%o7
	addccc	%g3,	%g7,	%l4
	edge32l	%g1,	%o4,	%o6
	addccc	%l6,	0x13B2,	%i6
	ldsw	[%l7 + 0x10],	%o3
	and	%g5,	%g2,	%g4
	or	%g6,	%i5,	%i2
	sth	%l3,	[%l7 + 0x46]
	ldd	[%l7 + 0x48],	%f8
	fmovdle	%xcc,	%f6,	%f8
	movrlez	%i0,	0x044,	%i7
	stw	%l2,	[%l7 + 0x74]
	sdivx	%i3,	0x0358,	%l1
	umul	%o1,	0x098B,	%l0
	mulscc	%l5,	%i1,	%i4
	movcc	%icc,	%o2,	%o0
	movvs	%icc,	%o7,	%g3
	fmovdpos	%icc,	%f4,	%f7
	stb	%g7,	[%l7 + 0x3B]
	fcmped	%fcc1,	%f0,	%f8
	umulcc	%l4,	%g1,	%o5
	fandnot2s	%f8,	%f14,	%f3
	ldd	[%l7 + 0x68],	%f2
	array8	%o6,	%o4,	%l6
	andncc	%o3,	%g5,	%i6
	fnot1	%f2,	%f12
	fmovrdne	%g4,	%f4,	%f2
	ld	[%l7 + 0x70],	%f0
	sth	%g2,	[%l7 + 0x34]
	edge32n	%g6,	%i2,	%i5
	orncc	%i0,	0x0302,	%l3
	sth	%i7,	[%l7 + 0x5C]
	edge32ln	%i3,	%l2,	%o1
	edge16l	%l0,	%l1,	%i1
	movgu	%xcc,	%l5,	%i4
	movvc	%icc,	%o0,	%o2
	edge32	%o7,	%g3,	%l4
	fnegd	%f4,	%f2
	fmul8x16al	%f12,	%f4,	%f2
	movgu	%xcc,	%g1,	%o5
	array16	%o6,	%g7,	%l6
	fandnot1	%f12,	%f6,	%f8
	lduw	[%l7 + 0x1C],	%o3
	movneg	%xcc,	%g5,	%o4
	fandnot2s	%f4,	%f14,	%f8
	ldx	[%l7 + 0x38],	%g4
	fmovdpos	%icc,	%f10,	%f0
	addcc	%i6,	0x0055,	%g6
	movneg	%xcc,	%i2,	%i5
	udiv	%i0,	0x1526,	%l3
	sth	%g2,	[%l7 + 0x16]
	fabsd	%f4,	%f10
	edge16l	%i7,	%i3,	%o1
	addc	%l2,	0x0454,	%l1
	addcc	%l0,	0x0B31,	%i1
	udiv	%l5,	0x0E39,	%i4
	fmovdvs	%xcc,	%f6,	%f11
	sra	%o2,	%o0,	%o7
	orn	%g3,	%l4,	%o5
	ld	[%l7 + 0x64],	%f5
	fmovsg	%icc,	%f6,	%f6
	movvs	%icc,	%o6,	%g7
	fmovdge	%icc,	%f10,	%f0
	movgu	%xcc,	%g1,	%l6
	subcc	%g5,	0x10BB,	%o3
	srlx	%o4,	%i6,	%g4
	movrlz	%i2,	0x106,	%g6
	alignaddr	%i5,	%i0,	%l3
	fmul8x16	%f8,	%f4,	%f14
	ldd	[%l7 + 0x78],	%g2
	fnot1	%f6,	%f0
	alignaddrl	%i3,	%o1,	%i7
	ldub	[%l7 + 0x19],	%l1
	movvs	%xcc,	%l2,	%l0
	sll	%l5,	0x0F,	%i1
	ldsh	[%l7 + 0x3A],	%o2
	fmovrdgz	%o0,	%f14,	%f10
	fmovsvc	%xcc,	%f6,	%f8
	andn	%i4,	0x09BE,	%o7
	fmovrde	%l4,	%f8,	%f12
	edge16l	%g3,	%o6,	%o5
	orn	%g7,	%l6,	%g1
	fcmpgt16	%f10,	%f4,	%g5
	fmovsle	%icc,	%f13,	%f10
	andn	%o4,	0x1D0A,	%i6
	movrgz	%g4,	0x244,	%o3
	subc	%i2,	0x0CD5,	%i5
	save %g6, %l3, %g2
	fcmpne32	%f8,	%f8,	%i3
	sll	%i0,	0x1B,	%o1
	edge16ln	%l1,	%l2,	%l0
	movneg	%xcc,	%i7,	%l5
	popc	0x0C5C,	%o2
	movrlez	%i1,	0x119,	%o0
	udiv	%o7,	0x0D32,	%l4
	stw	%i4,	[%l7 + 0x2C]
	fcmpgt16	%f2,	%f4,	%g3
	movpos	%icc,	%o6,	%g7
	movn	%xcc,	%o5,	%l6
	movneg	%xcc,	%g5,	%g1
	fmovs	%f9,	%f15
	fmovsg	%xcc,	%f7,	%f1
	sllx	%i6,	%g4,	%o3
	fzero	%f14
	fnors	%f15,	%f11,	%f0
	xnor	%o4,	0x067F,	%i2
	movcc	%icc,	%g6,	%i5
	stw	%l3,	[%l7 + 0x28]
	edge16ln	%g2,	%i0,	%i3
	edge16	%l1,	%l2,	%l0
	fmovdvs	%icc,	%f10,	%f5
	sdivx	%o1,	0x1B72,	%l5
	movn	%icc,	%i7,	%i1
	add	%o0,	0x0586,	%o7
	addccc	%o2,	0x1634,	%l4
	movcc	%xcc,	%i4,	%o6
	sra	%g7,	%o5,	%g3
	st	%f11,	[%l7 + 0x44]
	save %l6, 0x1534, %g5
	array8	%i6,	%g1,	%g4
	movge	%xcc,	%o3,	%o4
	faligndata	%f0,	%f4,	%f12
	movrgez	%g6,	0x226,	%i2
	smul	%i5,	%l3,	%i0
	st	%f13,	[%l7 + 0x28]
	fmovrsne	%g2,	%f11,	%f0
	movgu	%xcc,	%l1,	%i3
	movcs	%xcc,	%l2,	%o1
	orcc	%l0,	0x110C,	%l5
	ldub	[%l7 + 0x0B],	%i7
	lduh	[%l7 + 0x20],	%o0
	array8	%o7,	%i1,	%l4
	fmovrsgez	%i4,	%f1,	%f15
	movne	%icc,	%o6,	%g7
	fpack32	%f0,	%f6,	%f4
	movn	%icc,	%o2,	%g3
	alignaddr	%o5,	%g5,	%i6
	std	%f6,	[%l7 + 0x28]
	srlx	%l6,	0x15,	%g4
	sethi	0x1EC5,	%g1
	movle	%xcc,	%o4,	%o3
	orcc	%g6,	0x040A,	%i5
	ld	[%l7 + 0x6C],	%f9
	fmovsn	%xcc,	%f5,	%f11
	fmovrde	%i2,	%f2,	%f6
	fmovscs	%xcc,	%f13,	%f2
	fnot2	%f10,	%f0
	addccc	%l3,	%i0,	%l1
	movl	%icc,	%i3,	%g2
	lduh	[%l7 + 0x2C],	%l2
	ldsb	[%l7 + 0x74],	%l0
	edge8ln	%l5,	%i7,	%o0
	sth	%o1,	[%l7 + 0x5C]
	movrlz	%i1,	0x004,	%o7
	xor	%l4,	%o6,	%i4
	udiv	%o2,	0x1CFA,	%g3
	mulx	%o5,	0x15B9,	%g5
	fmuld8ulx16	%f13,	%f13,	%f4
	ldsb	[%l7 + 0x3A],	%i6
	sth	%g7,	[%l7 + 0x6A]
	fmovde	%icc,	%f1,	%f15
	movle	%xcc,	%g4,	%l6
	fmuld8ulx16	%f5,	%f8,	%f6
	movle	%xcc,	%g1,	%o4
	subccc	%g6,	%i5,	%i2
	edge32ln	%l3,	%o3,	%i0
	fmovd	%f0,	%f0
	srl	%i3,	%g2,	%l1
	sra	%l0,	%l2,	%l5
	edge8l	%o0,	%o1,	%i7
	fmovscc	%xcc,	%f6,	%f6
	subcc	%i1,	%l4,	%o6
	fabsd	%f10,	%f12
	mulx	%o7,	0x10BB,	%o2
	sra	%g3,	0x03,	%i4
	fmul8sux16	%f6,	%f6,	%f8
	fzero	%f6
	fmovrsne	%o5,	%f0,	%f4
	popc	0x1B32,	%i6
	stw	%g7,	[%l7 + 0x7C]
	movge	%icc,	%g5,	%g4
	udiv	%l6,	0x134B,	%g1
	edge32	%o4,	%i5,	%i2
	alignaddrl	%l3,	%g6,	%i0
	fmovs	%f8,	%f1
	move	%icc,	%i3,	%g2
	fmul8x16	%f12,	%f4,	%f14
	fnegd	%f6,	%f0
	xor	%o3,	0x131E,	%l1
	edge16	%l2,	%l5,	%o0
	movcc	%xcc,	%l0,	%i7
	xorcc	%i1,	0x1DF5,	%o1
	ldsw	[%l7 + 0x08],	%o6
	std	%f2,	[%l7 + 0x40]
	edge8l	%o7,	%l4,	%g3
	ldsw	[%l7 + 0x5C],	%i4
	xorcc	%o2,	0x1932,	%o5
	udiv	%i6,	0x0AC3,	%g5
	movrne	%g4,	%l6,	%g7
	ldd	[%l7 + 0x30],	%o4
	fpsub32s	%f12,	%f11,	%f15
	fcmpd	%fcc1,	%f6,	%f6
	fmovrdgz	%i5,	%f8,	%f12
	smul	%g1,	0x0E81,	%i2
	addcc	%g6,	0x14C7,	%l3
	orncc	%i3,	%g2,	%i0
	sll	%l1,	%o3,	%l2
	movrgez	%l5,	0x122,	%l0
	ldsw	[%l7 + 0x60],	%o0
	movleu	%xcc,	%i1,	%i7
	umulcc	%o6,	0x16C6,	%o7
	sdivx	%o1,	0x1DC5,	%l4
	array32	%i4,	%g3,	%o5
	movle	%xcc,	%o2,	%g5
	array32	%i6,	%g4,	%l6
	lduh	[%l7 + 0x32],	%o4
	movleu	%xcc,	%i5,	%g1
	edge32ln	%g7,	%g6,	%i2
	movle	%icc,	%i3,	%l3
	alignaddr	%i0,	%g2,	%l1
	smul	%o3,	0x0AF4,	%l2
	fpadd32	%f8,	%f8,	%f6
	fmovrslez	%l5,	%f8,	%f15
	movre	%o0,	%i1,	%l0
	ldd	[%l7 + 0x48],	%f6
	save %i7, %o7, %o6
	or	%l4,	%o1,	%g3
	sll	%i4,	%o2,	%g5
	umulcc	%o5,	0x1367,	%i6
	srax	%g4,	0x19,	%l6
	alignaddr	%i5,	%o4,	%g1
	sdiv	%g6,	0x1470,	%g7
	alignaddr	%i3,	%l3,	%i2
	lduh	[%l7 + 0x5C],	%g2
	orn	%l1,	%i0,	%o3
	fmovdleu	%xcc,	%f10,	%f15
	fmovd	%f8,	%f2
	sth	%l5,	[%l7 + 0x3E]
	lduh	[%l7 + 0x1E],	%o0
	subcc	%l2,	0x06D0,	%l0
	sth	%i7,	[%l7 + 0x68]
	fmovrsgz	%i1,	%f1,	%f12
	stx	%o7,	[%l7 + 0x18]
	subc	%o6,	%l4,	%g3
	addcc	%o1,	%i4,	%g5
	udivx	%o5,	0x18D8,	%o2
	stb	%g4,	[%l7 + 0x64]
	movle	%xcc,	%l6,	%i6
	movne	%icc,	%o4,	%i5
	ldsb	[%l7 + 0x70],	%g1
	fpack32	%f4,	%f4,	%f12
	ldd	[%l7 + 0x58],	%f6
	edge16n	%g6,	%i3,	%l3
	ldd	[%l7 + 0x20],	%f4
	stw	%i2,	[%l7 + 0x50]
	edge16ln	%g7,	%l1,	%i0
	array16	%g2,	%o3,	%o0
	fornot1s	%f5,	%f12,	%f6
	stw	%l5,	[%l7 + 0x70]
	andcc	%l0,	0x17E3,	%l2
	fmovrsgz	%i7,	%f5,	%f13
	sdiv	%i1,	0x0B47,	%o7
	move	%icc,	%o6,	%g3
	edge8n	%l4,	%i4,	%o1
	orncc	%o5,	0x1823,	%o2
	sll	%g4,	%l6,	%i6
	std	%f2,	[%l7 + 0x78]
	fcmped	%fcc1,	%f14,	%f10
	andncc	%o4,	%i5,	%g5
	movvc	%icc,	%g6,	%i3
	edge8n	%l3,	%i2,	%g7
	lduw	[%l7 + 0x64],	%g1
	sdivx	%l1,	0x18D8,	%i0
	xnor	%g2,	0x00B1,	%o3
	or	%l5,	%l0,	%o0
	xorcc	%i7,	%l2,	%o7
	movrgez	%i1,	%o6,	%l4
	fmovsl	%icc,	%f0,	%f6
	restore %i4, %g3, %o1
	movpos	%icc,	%o2,	%g4
	sub	%o5,	%i6,	%o4
	movrlz	%l6,	0x095,	%g5
	orn	%g6,	0x1950,	%i3
	andcc	%i5,	%l3,	%g7
	addcc	%i2,	%l1,	%i0
	fsrc1	%f0,	%f12
	movcc	%xcc,	%g2,	%g1
	subcc	%l5,	0x0488,	%l0
	stb	%o3,	[%l7 + 0x5D]
	fandnot1s	%f14,	%f5,	%f4
	edge32	%i7,	%o0,	%l2
	fcmple16	%f14,	%f12,	%o7
	ldub	[%l7 + 0x17],	%o6
	subcc	%l4,	0x0F69,	%i4
	movg	%icc,	%i1,	%o1
	fmovrdgez	%g3,	%f10,	%f12
	sub	%g4,	0x1034,	%o5
	fcmped	%fcc1,	%f10,	%f0
	udiv	%i6,	0x1082,	%o4
	fmovs	%f10,	%f7
	fcmpes	%fcc1,	%f9,	%f5
	umul	%o2,	0x1C46,	%g5
	movcs	%icc,	%g6,	%l6
	movrgz	%i3,	0x176,	%l3
	sdiv	%i5,	0x0BB1,	%g7
	xorcc	%l1,	0x092E,	%i0
	ldx	[%l7 + 0x10],	%i2
	fsrc2s	%f11,	%f3
	edge8	%g1,	%g2,	%l0
	xorcc	%l5,	0x144C,	%i7
	xnor	%o3,	0x09B5,	%l2
	alignaddr	%o0,	%o7,	%o6
	andn	%i4,	0x0272,	%i1
	faligndata	%f12,	%f0,	%f4
	andn	%o1,	%g3,	%g4
	fandnot2s	%f15,	%f9,	%f6
	udiv	%o5,	0x16DC,	%i6
	fnand	%f8,	%f6,	%f14
	popc	0x034C,	%l4
	fmovsgu	%xcc,	%f14,	%f0
	srlx	%o2,	0x06,	%g5
	fmovrsgez	%g6,	%f2,	%f2
	mulscc	%l6,	0x1798,	%i3
	lduh	[%l7 + 0x7A],	%l3
	movgu	%xcc,	%i5,	%o4
	edge32l	%l1,	%g7,	%i0
	mulx	%i2,	0x0596,	%g1
	movne	%xcc,	%l0,	%l5
	fmovrse	%i7,	%f14,	%f9
	fornot2	%f10,	%f4,	%f12
	ldsh	[%l7 + 0x76],	%o3
	save %g2, 0x12DB, %o0
	fmovsne	%xcc,	%f15,	%f0
	fmovsa	%xcc,	%f2,	%f12
	fmovsg	%icc,	%f7,	%f14
	movneg	%xcc,	%l2,	%o7
	movleu	%xcc,	%o6,	%i1
	udivx	%o1,	0x15B1,	%g3
	fmovdcc	%xcc,	%f14,	%f1
	ldd	[%l7 + 0x70],	%i4
	ldsh	[%l7 + 0x52],	%o5
	fmovdle	%icc,	%f5,	%f3
	edge8n	%i6,	%g4,	%l4
	fmovrsgz	%g5,	%f11,	%f13
	ldub	[%l7 + 0x1D],	%o2
	ldsh	[%l7 + 0x7E],	%l6
	umulcc	%g6,	0x176C,	%l3
	restore %i5, %o4, %l1
	subc	%g7,	%i0,	%i2
	andn	%g1,	0x0E1C,	%l0
	sll	%i3,	%l5,	%o3
	sra	%g2,	0x06,	%o0
	smul	%i7,	%l2,	%o6
	sth	%o7,	[%l7 + 0x6E]
	add	%i1,	0x0E7A,	%o1
	fzero	%f4
	sdivcc	%g3,	0x1E88,	%o5
	st	%f2,	[%l7 + 0x24]
	fmovdvc	%xcc,	%f14,	%f9
	movre	%i4,	0x345,	%g4
	movre	%l4,	%g5,	%o2
	stb	%i6,	[%l7 + 0x19]
	fmovsvc	%xcc,	%f11,	%f13
	fnot2s	%f5,	%f6
	xorcc	%l6,	%g6,	%i5
	fmovs	%f6,	%f14
	fornot1	%f8,	%f10,	%f2
	smulcc	%o4,	%l3,	%l1
	smul	%g7,	0x166E,	%i2
	edge32n	%g1,	%i0,	%i3
	andncc	%l5,	%l0,	%g2
	ldd	[%l7 + 0x28],	%f10
	fnot1s	%f12,	%f14
	movrne	%o3,	0x0E8,	%i7
	subcc	%l2,	%o6,	%o0
	movrlez	%i1,	%o1,	%o7
	edge8n	%o5,	%i4,	%g3
	andcc	%g4,	%l4,	%g5
	move	%xcc,	%o2,	%i6
	orncc	%g6,	%i5,	%o4
	xnor	%l6,	%l3,	%l1
	stw	%i2,	[%l7 + 0x58]
	xorcc	%g7,	0x01DE,	%i0
	addcc	%i3,	0x02D4,	%l5
	or	%l0,	0x03A3,	%g2
	andn	%o3,	%g1,	%i7
	subcc	%o6,	%o0,	%l2
	edge16l	%i1,	%o7,	%o5
	andn	%i4,	0x0528,	%g3
	fornot1	%f12,	%f12,	%f12
	andn	%o1,	0x198A,	%g4
	ldsb	[%l7 + 0x6A],	%l4
	array8	%g5,	%i6,	%g6
	edge8l	%o2,	%i5,	%o4
	smulcc	%l3,	%l1,	%i2
	movvs	%icc,	%g7,	%l6
	movrne	%i0,	%i3,	%l0
	orcc	%g2,	%o3,	%l5
	stx	%i7,	[%l7 + 0x30]
	st	%f2,	[%l7 + 0x48]
	movn	%xcc,	%o6,	%g1
	sll	%o0,	%l2,	%i1
	fpack32	%f8,	%f0,	%f8
	fpadd16	%f4,	%f14,	%f10
	movrne	%o7,	0x250,	%o5
	udivx	%g3,	0x0761,	%i4
	add	%o1,	%g4,	%g5
	stx	%l4,	[%l7 + 0x68]
	fcmpeq16	%f8,	%f14,	%g6
	udivcc	%o2,	0x060A,	%i5
	umul	%o4,	0x16A2,	%i6
	srax	%l3,	0x04,	%i2
	movrlez	%l1,	%l6,	%i0
	restore %i3, %l0, %g2
	fors	%f0,	%f14,	%f6
	mulx	%o3,	0x01CE,	%g7
	orcc	%l5,	%o6,	%i7
	edge8n	%o0,	%g1,	%l2
	move	%xcc,	%i1,	%o5
	lduh	[%l7 + 0x10],	%g3
	subccc	%i4,	%o7,	%g4
	edge8n	%o1,	%g5,	%g6
	ldsw	[%l7 + 0x64],	%l4
	smul	%i5,	0x156E,	%o4
	movne	%xcc,	%i6,	%o2
	movvc	%xcc,	%l3,	%l1
	fabss	%f6,	%f15
	edge16n	%i2,	%i0,	%i3
	xnor	%l6,	0x0DB1,	%g2
	alignaddrl	%l0,	%o3,	%l5
	mulx	%o6,	0x16FC,	%g7
	subcc	%i7,	%o0,	%l2
	edge16n	%g1,	%i1,	%g3
	or	%o5,	%o7,	%g4
	stb	%o1,	[%l7 + 0x5C]
	edge8ln	%i4,	%g6,	%l4
	movvs	%xcc,	%g5,	%i5
	sll	%i6,	%o4,	%o2
	edge32l	%l1,	%i2,	%i0
	fxnors	%f4,	%f14,	%f5
	sdivcc	%i3,	0x1B22,	%l6
	sth	%l3,	[%l7 + 0x28]
	mulscc	%l0,	%g2,	%l5
	fnand	%f14,	%f2,	%f2
	ldsw	[%l7 + 0x48],	%o3
	umul	%o6,	%i7,	%g7
	fmovrsne	%l2,	%f3,	%f3
	st	%f4,	[%l7 + 0x38]
	stw	%g1,	[%l7 + 0x60]
	sdivx	%i1,	0x0076,	%o0
	fmovrse	%o5,	%f10,	%f9
	movcc	%icc,	%o7,	%g3
	umul	%g4,	%o1,	%g6
	srax	%l4,	0x1E,	%i4
	lduh	[%l7 + 0x28],	%g5
	sll	%i5,	0x05,	%i6
	fmovdvs	%icc,	%f2,	%f5
	subccc	%o2,	%l1,	%i2
	fzero	%f14
	edge32ln	%i0,	%i3,	%o4
	fpack32	%f6,	%f8,	%f8
	array8	%l6,	%l0,	%l3
	smul	%l5,	0x100E,	%g2
	movcc	%xcc,	%o3,	%i7
	ldx	[%l7 + 0x48],	%g7
	srlx	%o6,	%g1,	%i1
	fmovrdgz	%o0,	%f2,	%f10
	fxnor	%f8,	%f12,	%f4
	mova	%icc,	%o5,	%o7
	fmovrdlz	%g3,	%f10,	%f14
	sub	%l2,	0x077F,	%g4
	sdivcc	%g6,	0x0664,	%o1
	fmul8x16au	%f7,	%f8,	%f8
	edge32ln	%l4,	%i4,	%g5
	ldsh	[%l7 + 0x38],	%i5
	srlx	%i6,	0x1A,	%l1
	umul	%i2,	0x1BB2,	%o2
	fmovrdgz	%i3,	%f14,	%f0
	movcs	%icc,	%o4,	%i0
	fmuld8sux16	%f14,	%f3,	%f0
	fmovsne	%icc,	%f8,	%f13
	movrgz	%l0,	0x181,	%l6
	edge16l	%l5,	%g2,	%o3
	movvs	%icc,	%i7,	%l3
	fsrc2s	%f9,	%f13
	fzero	%f8
	fcmps	%fcc0,	%f10,	%f4
	movvc	%xcc,	%o6,	%g1
	udiv	%i1,	0x1DEA,	%g7
	lduh	[%l7 + 0x1C],	%o0
	edge8l	%o7,	%g3,	%l2
	stw	%o5,	[%l7 + 0x70]
	mulscc	%g6,	%g4,	%o1
	lduw	[%l7 + 0x30],	%i4
	ldd	[%l7 + 0x38],	%f12
	sdivx	%l4,	0x0879,	%i5
	movrgz	%g5,	0x22E,	%i6
	std	%f0,	[%l7 + 0x70]
	fmovrdlz	%i2,	%f2,	%f8
	addc	%o2,	0x0334,	%i3
	udivx	%l1,	0x1BA4,	%i0
	xor	%o4,	%l6,	%l5
	fmovse	%xcc,	%f6,	%f11
	movpos	%icc,	%l0,	%o3
	fxors	%f1,	%f5,	%f12
	fmovrse	%i7,	%f13,	%f9
	edge16n	%l3,	%g2,	%g1
	or	%i1,	0x0717,	%o6
	fnegd	%f0,	%f6
	subcc	%o0,	0x05AF,	%g7
	umul	%o7,	%l2,	%g3
	movleu	%xcc,	%o5,	%g4
	movgu	%xcc,	%g6,	%o1
	edge32l	%i4,	%l4,	%i5
	ldx	[%l7 + 0x40],	%i6
	ldsb	[%l7 + 0x7C],	%g5
	movre	%i2,	0x195,	%i3
	movpos	%xcc,	%o2,	%i0
	stw	%l1,	[%l7 + 0x08]
	edge8l	%o4,	%l6,	%l5
	fcmpgt32	%f6,	%f8,	%l0
	udiv	%i7,	0x0665,	%o3
	srlx	%l3,	%g1,	%g2
	fmovrdlez	%o6,	%f4,	%f12
	fnands	%f14,	%f5,	%f12
	sra	%i1,	0x0F,	%g7
	orcc	%o7,	%l2,	%g3
	orn	%o0,	%g4,	%g6
	fmovdle	%xcc,	%f1,	%f2
	movrgez	%o5,	%o1,	%l4
	sth	%i4,	[%l7 + 0x62]
	edge32ln	%i6,	%i5,	%i2
	fcmple16	%f14,	%f2,	%i3
	subc	%o2,	%g5,	%l1
	addcc	%i0,	0x167A,	%o4
	ld	[%l7 + 0x50],	%f4
	sdivx	%l5,	0x1DDC,	%l6
	ld	[%l7 + 0x44],	%f10
	andcc	%l0,	0x185B,	%i7
	edge16n	%o3,	%l3,	%g2
	stw	%g1,	[%l7 + 0x38]
	fmovdge	%xcc,	%f14,	%f12
	sll	%i1,	%g7,	%o7
	subc	%l2,	%g3,	%o0
	sdiv	%o6,	0x1B40,	%g6
	orn	%o5,	%g4,	%l4
	fpsub32s	%f11,	%f9,	%f10
	andcc	%o1,	0x1946,	%i4
	movcs	%icc,	%i5,	%i6
	edge8	%i2,	%i3,	%o2
	ldub	[%l7 + 0x6E],	%g5
	restore %l1, %i0, %l5
	fmovspos	%xcc,	%f1,	%f0
	movrne	%l6,	0x3C8,	%l0
	addc	%i7,	0x018D,	%o3
	subccc	%l3,	%o4,	%g2
	edge8n	%i1,	%g7,	%g1
	sllx	%o7,	0x0E,	%l2
	xor	%g3,	%o6,	%o0
	fmovspos	%icc,	%f13,	%f3
	ldd	[%l7 + 0x50],	%o4
	ldsw	[%l7 + 0x08],	%g4
	srax	%l4,	0x12,	%g6
	movn	%icc,	%o1,	%i5
	movleu	%xcc,	%i6,	%i4
	movre	%i3,	%i2,	%g5
	fmovspos	%icc,	%f14,	%f0
	movl	%icc,	%o2,	%l1
	sdivcc	%l5,	0x0C86,	%l6
	edge8	%i0,	%i7,	%o3
	move	%xcc,	%l3,	%o4
	sra	%g2,	%i1,	%g7
	umul	%l0,	%o7,	%l2
	mulx	%g1,	%g3,	%o0
	ldd	[%l7 + 0x50],	%o6
	xnorcc	%g4,	0x037C,	%l4
	addc	%g6,	%o1,	%o5
	and	%i5,	%i4,	%i6
	movrgz	%i2,	0x224,	%i3
	std	%f2,	[%l7 + 0x08]
	popc	0x0668,	%g5
	edge8n	%l1,	%o2,	%l6
	sethi	0x146D,	%i0
	smul	%i7,	0x0E07,	%o3
	movvs	%xcc,	%l3,	%o4
	orn	%l5,	%g2,	%g7
	fmovsgu	%icc,	%f15,	%f14
	alignaddr	%l0,	%i1,	%o7
	edge32n	%l2,	%g1,	%g3
	movpos	%icc,	%o6,	%o0
	umulcc	%g4,	0x034D,	%l4
	ldd	[%l7 + 0x60],	%f8
	movleu	%icc,	%o1,	%g6
	fornot1s	%f7,	%f4,	%f1
	movge	%xcc,	%o5,	%i4
	movrlez	%i6,	%i5,	%i2
	save %i3, 0x180E, %l1
	orcc	%o2,	0x04C1,	%g5
	fxnors	%f10,	%f11,	%f2
	ldd	[%l7 + 0x30],	%f10
	movrne	%l6,	0x0AA,	%i0
	movpos	%xcc,	%i7,	%l3
	alignaddrl	%o3,	%o4,	%l5
	std	%f12,	[%l7 + 0x58]
	edge8ln	%g7,	%g2,	%i1
	sub	%l0,	0x06D8,	%o7
	umulcc	%g1,	0x0B48,	%g3
	and	%l2,	0x04BB,	%o6
	udiv	%g4,	0x111C,	%l4
	st	%f0,	[%l7 + 0x08]
	stb	%o1,	[%l7 + 0x4C]
	ldub	[%l7 + 0x38],	%g6
	fmovrse	%o5,	%f6,	%f11
	udiv	%o0,	0x05DC,	%i6
	fornot1s	%f9,	%f0,	%f15
	subccc	%i5,	%i4,	%i3
	siam	0x1
	and	%l1,	%o2,	%g5
	and	%l6,	%i0,	%i7
	edge8n	%i2,	%o3,	%o4
	or	%l3,	%g7,	%g2
	edge8l	%i1,	%l0,	%o7
	or	%l5,	%g3,	%l2
	edge16	%g1,	%g4,	%o6
	movrlez	%l4,	0x2BC,	%o1
	sra	%g6,	0x14,	%o0
	subccc	%o5,	%i6,	%i5
	edge16l	%i3,	%l1,	%o2
	subcc	%i4,	%l6,	%g5
	fcmple32	%f6,	%f2,	%i7
	movrlez	%i0,	0x1EB,	%o3
	fnegd	%f8,	%f2
	edge8	%i2,	%o4,	%g7
	fnands	%f3,	%f10,	%f0
	fnot1	%f4,	%f6
	fornot2s	%f3,	%f8,	%f0
	stw	%l3,	[%l7 + 0x50]
	edge32	%i1,	%l0,	%g2
	fpmerge	%f5,	%f1,	%f10
	edge8n	%o7,	%g3,	%l5
	and	%l2,	%g1,	%o6
	ldsb	[%l7 + 0x49],	%g4
	orcc	%l4,	0x04AC,	%o1
	fones	%f14
	sdiv	%g6,	0x08CE,	%o0
	srax	%i6,	%i5,	%o5
	movneg	%icc,	%l1,	%o2
	sdivcc	%i3,	0x120A,	%i4
	ldx	[%l7 + 0x70],	%g5
	fmovs	%f4,	%f4
	smul	%l6,	%i0,	%o3
	ld	[%l7 + 0x10],	%f14
	movn	%xcc,	%i2,	%i7
	movle	%icc,	%o4,	%l3
	fmovde	%xcc,	%f11,	%f1
	fcmped	%fcc2,	%f6,	%f10
	movgu	%xcc,	%i1,	%l0
	umulcc	%g7,	%g2,	%g3
	ldsb	[%l7 + 0x72],	%l5
	stx	%o7,	[%l7 + 0x48]
	mulscc	%l2,	%g1,	%g4
	st	%f14,	[%l7 + 0x5C]
	ldsb	[%l7 + 0x4C],	%l4
	array32	%o1,	%g6,	%o0
	movg	%xcc,	%i6,	%i5
	fnor	%f8,	%f0,	%f4
	movvc	%xcc,	%o6,	%o5
	stw	%o2,	[%l7 + 0x4C]
	movleu	%icc,	%l1,	%i4
	edge16	%g5,	%l6,	%i0
	ldsb	[%l7 + 0x52],	%o3
	movne	%icc,	%i2,	%i7
	fmovdcc	%xcc,	%f1,	%f15
	and	%o4,	%i3,	%l3
	lduh	[%l7 + 0x4A],	%i1
	movpos	%xcc,	%l0,	%g2
	subccc	%g3,	0x06E4,	%l5
	sub	%g7,	0x1FAA,	%l2
	movpos	%xcc,	%g1,	%g4
	movvs	%icc,	%l4,	%o7
	subccc	%o1,	%g6,	%i6
	smulcc	%i5,	%o0,	%o5
	add	%o6,	0x1EF7,	%o2
	fmovdvs	%xcc,	%f3,	%f8
	subc	%l1,	%i4,	%g5
	movrgz	%i0,	%l6,	%o3
	orcc	%i7,	%o4,	%i2
	smulcc	%i3,	%l3,	%i1
	sra	%l0,	0x16,	%g3
	movge	%xcc,	%g2,	%g7
	fnot2	%f12,	%f8
	fmovsg	%xcc,	%f13,	%f2
	ldd	[%l7 + 0x68],	%f12
	edge32	%l5,	%l2,	%g1
	edge16ln	%l4,	%o7,	%g4
	fmovrde	%o1,	%f8,	%f6
	movgu	%xcc,	%g6,	%i6
	movge	%icc,	%i5,	%o0
	sllx	%o5,	%o2,	%o6
	movcs	%icc,	%i4,	%l1
	mova	%icc,	%g5,	%i0
	movre	%o3,	%i7,	%o4
	fmovrse	%l6,	%f15,	%f8
	ldd	[%l7 + 0x60],	%f14
	srlx	%i3,	%l3,	%i1
	movle	%icc,	%i2,	%g3
	fzeros	%f4
	umul	%g2,	%g7,	%l0
	fmovdpos	%icc,	%f14,	%f10
	edge16n	%l5,	%l2,	%l4
	umul	%o7,	%g4,	%o1
	andcc	%g1,	0x1406,	%g6
	fmovsg	%icc,	%f2,	%f1
	restore %i6, %o0, %o5
	move	%icc,	%i5,	%o2
	sll	%o6,	%l1,	%i4
	movg	%icc,	%g5,	%i0
	movn	%xcc,	%i7,	%o4
	fpmerge	%f10,	%f13,	%f12
	xnor	%o3,	0x1607,	%l6
	stw	%i3,	[%l7 + 0x48]
	movg	%icc,	%i1,	%l3
	edge16ln	%g3,	%i2,	%g7
	smulcc	%l0,	0x05ED,	%g2
	umul	%l5,	%l2,	%l4
	alignaddrl	%o7,	%g4,	%o1
	fnot2s	%f2,	%f8
	movneg	%icc,	%g1,	%g6
	edge8ln	%i6,	%o5,	%o0
	smul	%i5,	%o2,	%l1
	movcs	%xcc,	%i4,	%g5
	subccc	%i0,	0x0D03,	%i7
	udivcc	%o6,	0x04FC,	%o4
	edge8n	%o3,	%i3,	%l6
	sllx	%l3,	0x00,	%g3
	fnot1s	%f0,	%f3
	addcc	%i2,	%g7,	%l0
	movcs	%xcc,	%i1,	%g2
	sth	%l2,	[%l7 + 0x7E]
	movrne	%l5,	%o7,	%g4
	popc	%o1,	%g1
	xnorcc	%l4,	0x10BB,	%i6
	sllx	%g6,	0x0E,	%o0
	ldsw	[%l7 + 0x24],	%o5
	ldsw	[%l7 + 0x34],	%i5
	ld	[%l7 + 0x4C],	%f0
	fmovsne	%xcc,	%f6,	%f2
	lduw	[%l7 + 0x1C],	%o2
	lduh	[%l7 + 0x2E],	%l1
	stw	%i4,	[%l7 + 0x20]
	ldd	[%l7 + 0x38],	%i0
	movgu	%xcc,	%i7,	%o6
	edge16n	%g5,	%o3,	%o4
	move	%icc,	%l6,	%i3
	xorcc	%g3,	0x0B52,	%i2
	fone	%f8
	orcc	%g7,	%l0,	%i1
	fandnot2	%f4,	%f4,	%f8
	fmovs	%f4,	%f7
	save %l3, 0x1287, %g2
	ldsh	[%l7 + 0x08],	%l5
	move	%xcc,	%l2,	%g4
	movvc	%xcc,	%o1,	%g1
	add	%l4,	%i6,	%o7
	array32	%o0,	%o5,	%g6
	fcmped	%fcc0,	%f4,	%f2
	edge16ln	%i5,	%o2,	%l1
	movrlz	%i0,	%i7,	%o6
	fmovrdlz	%g5,	%f4,	%f0
	addccc	%o3,	%i4,	%o4
	fcmps	%fcc3,	%f10,	%f5
	ldsh	[%l7 + 0x50],	%l6
	andn	%i3,	0x142C,	%i2
	fpmerge	%f6,	%f3,	%f8
	orncc	%g7,	%l0,	%g3
	movrgz	%l3,	0x2DA,	%i1
	array16	%l5,	%l2,	%g4
	fpadd16s	%f5,	%f6,	%f10
	andn	%o1,	%g1,	%g2
	fcmpes	%fcc1,	%f14,	%f1
	stw	%i6,	[%l7 + 0x7C]
	mulx	%l4,	0x1E04,	%o0
	xor	%o7,	%o5,	%i5
	sll	%o2,	%g6,	%i0
	stb	%l1,	[%l7 + 0x0C]
	fmovsn	%icc,	%f4,	%f2
	umul	%i7,	%o6,	%g5
	smul	%o3,	%o4,	%l6
	edge16l	%i3,	%i2,	%g7
	smul	%l0,	0x120F,	%i4
	ld	[%l7 + 0x48],	%f15
	fcmpne16	%f8,	%f14,	%l3
	array16	%g3,	%i1,	%l2
	ldsh	[%l7 + 0x16],	%g4
	mulx	%o1,	0x1D93,	%g1
	addccc	%g2,	%i6,	%l4
	fpsub32s	%f0,	%f0,	%f6
	edge16ln	%o0,	%o7,	%o5
	ldub	[%l7 + 0x71],	%i5
	xnorcc	%o2,	%g6,	%i0
	mulscc	%l1,	%i7,	%l5
	fpack32	%f14,	%f0,	%f0
	edge32l	%o6,	%o3,	%g5
	subccc	%l6,	%o4,	%i2
	ldsb	[%l7 + 0x7E],	%g7
	fcmple32	%f14,	%f10,	%i3
	std	%f0,	[%l7 + 0x78]
	sdivx	%l0,	0x0350,	%l3
	andcc	%i4,	0x16AE,	%g3
	umulcc	%i1,	%l2,	%g4
	movrgez	%g1,	%g2,	%o1
	xorcc	%i6,	0x1132,	%l4
	udivx	%o0,	0x0325,	%o5
	ldx	[%l7 + 0x78],	%o7
	sra	%i5,	%o2,	%g6
	ldsh	[%l7 + 0x50],	%i0
	lduw	[%l7 + 0x60],	%l1
	edge8	%i7,	%o6,	%o3
	fmovdneg	%icc,	%f9,	%f11
	sdivx	%l5,	0x1989,	%l6
	fors	%f13,	%f8,	%f1
	movl	%icc,	%g5,	%i2
	edge16l	%o4,	%i3,	%g7
	fornot2	%f4,	%f8,	%f4
	edge32	%l3,	%l0,	%g3
	movl	%icc,	%i4,	%l2
	edge32	%i1,	%g4,	%g1
	orcc	%o1,	%g2,	%i6
	fmovdne	%icc,	%f4,	%f15
	movle	%xcc,	%o0,	%o5
	udiv	%o7,	0x1F39,	%l4
	mulx	%o2,	0x1931,	%i5
	fsrc2s	%f12,	%f5
	fcmpeq16	%f2,	%f6,	%i0
	movrlez	%g6,	%l1,	%o6
	sth	%i7,	[%l7 + 0x44]
	edge8l	%o3,	%l5,	%g5
	move	%xcc,	%i2,	%l6
	xnorcc	%o4,	0x17A8,	%i3
	std	%f6,	[%l7 + 0x60]
	sdivx	%g7,	0x1EC7,	%l0
	fmovrdlz	%g3,	%f8,	%f12
	sub	%l3,	0x1B38,	%i4
	movrlez	%i1,	0x2C4,	%l2
	movrgez	%g1,	%o1,	%g2
	xnorcc	%g4,	%o0,	%o5
	ld	[%l7 + 0x5C],	%f0
	udivx	%o7,	0x13DB,	%i6
	ldsb	[%l7 + 0x08],	%l4
	subc	%i5,	%i0,	%g6
	edge16l	%o2,	%l1,	%i7
	edge16ln	%o3,	%l5,	%g5
	fpadd32s	%f9,	%f3,	%f10
	fones	%f9
	movle	%icc,	%i2,	%l6
	sll	%o4,	%o6,	%g7
	fxnors	%f10,	%f13,	%f10
	movre	%l0,	%i3,	%g3
	ldub	[%l7 + 0x5C],	%i4
	srl	%l3,	%i1,	%l2
	movrlz	%g1,	%o1,	%g2
	alignaddr	%o0,	%g4,	%o7
	for	%f0,	%f14,	%f10
	udiv	%o5,	0x056F,	%l4
	andn	%i5,	0x08E8,	%i6
	movgu	%icc,	%i0,	%o2
	srl	%g6,	%i7,	%o3
	sra	%l5,	%l1,	%g5
	fnand	%f6,	%f0,	%f12
	movn	%icc,	%i2,	%o4
	smul	%o6,	%l6,	%g7
	fmovdneg	%icc,	%f11,	%f9
	smulcc	%i3,	0x1CE3,	%g3
	smulcc	%l0,	%l3,	%i1
	ldub	[%l7 + 0x7D],	%i4
	fmovsgu	%icc,	%f13,	%f15
	movn	%xcc,	%g1,	%o1
	add	%g2,	%l2,	%g4
	andncc	%o0,	%o7,	%o5
	movgu	%icc,	%i5,	%l4
	stx	%i0,	[%l7 + 0x70]
	xnorcc	%o2,	0x02AA,	%i6
	edge16	%g6,	%o3,	%l5
	stx	%l1,	[%l7 + 0x58]
	srax	%i7,	0x02,	%g5
	lduh	[%l7 + 0x36],	%o4
	alignaddrl	%o6,	%l6,	%i2
	fpmerge	%f4,	%f3,	%f0
	sub	%i3,	%g7,	%g3
	movg	%icc,	%l0,	%l3
	sdivx	%i4,	0x1998,	%i1
	smul	%o1,	0x1408,	%g2
	sth	%g1,	[%l7 + 0x2E]
	sll	%l2,	%o0,	%g4
	fmovdvc	%icc,	%f7,	%f7
	subc	%o7,	0x0389,	%i5
	edge16n	%l4,	%i0,	%o2
	ldsw	[%l7 + 0x20],	%o5
	edge32n	%i6,	%g6,	%l5
	udiv	%l1,	0x19B9,	%o3
	fones	%f2
	mova	%icc,	%i7,	%g5
	edge16n	%o6,	%l6,	%i2
	or	%i3,	%g7,	%o4
	edge16n	%l0,	%g3,	%l3
	fmovdle	%icc,	%f7,	%f10
	fmovdvc	%xcc,	%f6,	%f13
	fcmpne16	%f10,	%f10,	%i4
	edge32ln	%i1,	%o1,	%g1
	mulx	%l2,	0x015D,	%g2
	movge	%xcc,	%o0,	%o7
	fabss	%f12,	%f3
	subc	%i5,	%l4,	%g4
	subccc	%i0,	0x13B8,	%o2
	movne	%xcc,	%o5,	%g6
	edge8l	%l5,	%l1,	%i6
	movne	%xcc,	%o3,	%i7
	movre	%g5,	%o6,	%l6
	std	%f8,	[%l7 + 0x48]
	save %i2, 0x0DC7, %g7
	fmovsvs	%icc,	%f6,	%f3
	movne	%icc,	%i3,	%l0
	ldx	[%l7 + 0x48],	%o4
	add	%l3,	0x0F78,	%i4
	andncc	%i1,	%g3,	%g1
	ldd	[%l7 + 0x48],	%l2
	fcmpgt16	%f8,	%f0,	%g2
	edge16n	%o1,	%o0,	%o7
	fpadd32	%f0,	%f14,	%f6
	movrlz	%i5,	0x172,	%g4
	or	%l4,	%o2,	%i0
	st	%f1,	[%l7 + 0x24]
	udivx	%o5,	0x0B66,	%g6
	fandnot2s	%f3,	%f4,	%f9
	ldx	[%l7 + 0x08],	%l1
	and	%i6,	0x17EB,	%l5
	edge32	%o3,	%g5,	%o6
	xnor	%l6,	%i2,	%i7
	stb	%g7,	[%l7 + 0x5B]
	alignaddr	%l0,	%o4,	%i3
	movg	%icc,	%i4,	%i1
	lduh	[%l7 + 0x68],	%g3
	fxors	%f12,	%f3,	%f2
	move	%xcc,	%g1,	%l3
	movrne	%g2,	0x16D,	%o1
	orcc	%o0,	0x0FAB,	%l2
	fmovsa	%xcc,	%f6,	%f4
	fmovrslez	%i5,	%f15,	%f11
	orncc	%o7,	0x082C,	%g4
	fmovrdne	%l4,	%f6,	%f10
	restore %o2, 0x18D2, %i0
	fmovdleu	%xcc,	%f7,	%f10
	edge16	%o5,	%g6,	%l1
	movge	%icc,	%l5,	%o3
	andncc	%i6,	%g5,	%o6
	fmovrsgz	%l6,	%f6,	%f12
	fands	%f5,	%f15,	%f10
	fmovdg	%icc,	%f10,	%f12
	orn	%i2,	%g7,	%i7
	edge8l	%o4,	%i3,	%l0
	fcmpeq32	%f8,	%f4,	%i4
	subcc	%g3,	%i1,	%g1
	movneg	%icc,	%g2,	%o1
	movneg	%xcc,	%o0,	%l2
	std	%f12,	[%l7 + 0x60]
	xor	%i5,	0x0942,	%l3
	fmovd	%f8,	%f8
	fsrc1	%f6,	%f2
	fexpand	%f3,	%f10
	addc	%g4,	%l4,	%o2
	ldd	[%l7 + 0x70],	%i0
	edge8n	%o7,	%o5,	%l1
	andcc	%l5,	0x015D,	%o3
	edge16ln	%i6,	%g5,	%o6
	fmovdvs	%xcc,	%f5,	%f1
	edge32n	%g6,	%l6,	%g7
	ldd	[%l7 + 0x28],	%f6
	fxnors	%f8,	%f8,	%f4
	movrgez	%i2,	%i7,	%o4
	edge16n	%i3,	%l0,	%g3
	edge32n	%i1,	%i4,	%g2
	fornot2	%f2,	%f12,	%f12
	edge8n	%o1,	%o0,	%l2
	srlx	%g1,	0x18,	%i5
	umulcc	%g4,	%l3,	%l4
	movrne	%i0,	%o7,	%o5
	umul	%l1,	%l5,	%o2
	edge8n	%i6,	%g5,	%o3
	subc	%o6,	0x0E6D,	%g6
	or	%g7,	%l6,	%i7
	subc	%o4,	%i2,	%l0
	udivcc	%g3,	0x1D75,	%i3
	movrlz	%i4,	%i1,	%o1
	edge8	%g2,	%l2,	%g1
	fmovrse	%i5,	%f9,	%f13
	movpos	%xcc,	%o0,	%g4
	ldub	[%l7 + 0x7B],	%l3
	andncc	%l4,	%i0,	%o5
	movn	%xcc,	%l1,	%l5
	sethi	0x118D,	%o7
	edge32	%i6,	%g5,	%o2
	fmul8ulx16	%f2,	%f6,	%f0
	ldsh	[%l7 + 0x22],	%o3
	mova	%icc,	%o6,	%g6
	edge32	%l6,	%i7,	%g7
	edge32ln	%i2,	%l0,	%g3
	movneg	%icc,	%o4,	%i4
	sdivx	%i3,	0x1A54,	%i1
	fmovsa	%xcc,	%f11,	%f3
	smulcc	%o1,	%l2,	%g1
	array16	%i5,	%o0,	%g2
	edge8n	%g4,	%l3,	%i0
	lduh	[%l7 + 0x6E],	%l4
	fnor	%f2,	%f14,	%f4
	umul	%l1,	0x1817,	%l5
	andcc	%o5,	0x0827,	%o7
	lduw	[%l7 + 0x60],	%g5
	ldsw	[%l7 + 0x40],	%o2
	srlx	%i6,	0x00,	%o3
	edge32	%o6,	%g6,	%i7
	sdivx	%l6,	0x0E1A,	%g7
	movcs	%xcc,	%l0,	%g3
	movne	%icc,	%o4,	%i2
	andncc	%i3,	%i4,	%i1
	smul	%o1,	0x0AD2,	%g1
	sdiv	%i5,	0x173E,	%o0
	ld	[%l7 + 0x10],	%f7
	subcc	%g2,	%l2,	%g4
	fcmpne32	%f2,	%f2,	%i0
	fmovrdgz	%l4,	%f12,	%f4
	addc	%l3,	%l5,	%l1
	bshuffle	%f12,	%f6,	%f4
	movneg	%icc,	%o5,	%g5
	andn	%o7,	0x0B38,	%i6
	alignaddr	%o2,	%o6,	%g6
	ldsb	[%l7 + 0x30],	%i7
	edge8l	%l6,	%g7,	%o3
	fmul8x16au	%f10,	%f10,	%f8
	sdivx	%l0,	0x1D6C,	%g3
	fxor	%f12,	%f4,	%f12
	movg	%xcc,	%i2,	%o4
	alignaddrl	%i3,	%i1,	%o1
	sth	%i4,	[%l7 + 0x58]
	sdivx	%g1,	0x081C,	%i5
	fnors	%f9,	%f2,	%f8
	fsrc1	%f6,	%f2
	fnors	%f6,	%f14,	%f3
	addccc	%o0,	%g2,	%l2
	xor	%i0,	%l4,	%l3
	movvs	%xcc,	%g4,	%l5
	movg	%xcc,	%l1,	%o5
	xor	%o7,	%i6,	%g5
	edge8	%o6,	%o2,	%g6
	fnor	%f4,	%f2,	%f14
	edge32ln	%i7,	%g7,	%o3
	xnorcc	%l6,	%l0,	%g3
	fmovrslz	%i2,	%f0,	%f6
	pdist	%f4,	%f14,	%f2
	movrgz	%o4,	0x1A6,	%i3
	srl	%o1,	%i4,	%i1
	srl	%g1,	%o0,	%i5
	fcmped	%fcc1,	%f14,	%f14
	edge8ln	%l2,	%i0,	%g2
	fnot1s	%f15,	%f14
	or	%l3,	0x1174,	%g4
	bshuffle	%f8,	%f4,	%f6
	alignaddrl	%l4,	%l1,	%o5
	fnot2s	%f9,	%f7
	array32	%o7,	%i6,	%g5
	mulx	%o6,	%o2,	%l5
	fmovdvc	%xcc,	%f2,	%f3
	fmovdcs	%xcc,	%f0,	%f3
	orncc	%i7,	%g7,	%o3
	orn	%g6,	0x1724,	%l6
	sllx	%l0,	0x0C,	%g3
	sth	%i2,	[%l7 + 0x16]
	subccc	%o4,	0x1FE5,	%i3
	edge16l	%i4,	%o1,	%g1
	movle	%icc,	%o0,	%i5
	edge32l	%i1,	%l2,	%i0
	movvc	%xcc,	%g2,	%g4
	ldsh	[%l7 + 0x34],	%l4
	subc	%l3,	0x1097,	%o5
	orcc	%o7,	0x07B6,	%l1
	ld	[%l7 + 0x20],	%f7
	fmovsleu	%icc,	%f7,	%f5
	edge8l	%i6,	%o6,	%g5
	udivx	%o2,	0x1466,	%i7
	movvs	%xcc,	%l5,	%o3
	fnegs	%f10,	%f15
	movrlez	%g7,	%l6,	%g6
	sdivx	%l0,	0x0F6F,	%i2
	movrlez	%o4,	%i3,	%g3
	fxor	%f12,	%f12,	%f12
	lduw	[%l7 + 0x1C],	%o1
	fxnor	%f4,	%f2,	%f10
	fxor	%f12,	%f6,	%f2
	andncc	%g1,	%i4,	%o0
	ld	[%l7 + 0x64],	%f13
	movre	%i5,	%l2,	%i0
	fpack16	%f6,	%f1
	sethi	0x103B,	%i1
	fnot2	%f14,	%f10
	fmovdvc	%xcc,	%f5,	%f10
	movge	%xcc,	%g4,	%g2
	fcmple16	%f14,	%f12,	%l3
	xnor	%l4,	0x0AC8,	%o7
	array8	%l1,	%o5,	%o6
	ldd	[%l7 + 0x18],	%g4
	fmovrslez	%i6,	%f15,	%f7
	addccc	%o2,	0x0CF6,	%i7
	mova	%xcc,	%l5,	%o3
	subcc	%g7,	%g6,	%l6
	stx	%i2,	[%l7 + 0x18]
	fnot2s	%f7,	%f15
	movneg	%icc,	%l0,	%o4
	xorcc	%g3,	0x003A,	%i3
	andn	%o1,	%g1,	%o0
	ldd	[%l7 + 0x68],	%f10
	stw	%i5,	[%l7 + 0x50]
	fcmpd	%fcc1,	%f4,	%f2
	smul	%i4,	%l2,	%i0
	array32	%g4,	%g2,	%i1
	edge32ln	%l4,	%o7,	%l3
	movgu	%icc,	%o5,	%l1
	fmovsg	%xcc,	%f11,	%f9
	andcc	%o6,	0x0B17,	%i6
	bshuffle	%f12,	%f12,	%f6
	sethi	0x03BF,	%g5
	orncc	%o2,	%i7,	%l5
	alignaddr	%o3,	%g7,	%l6
	fsrc1s	%f9,	%f15
	fmovde	%icc,	%f9,	%f11
	bshuffle	%f4,	%f10,	%f8
	and	%g6,	0x0C2E,	%l0
	fors	%f11,	%f2,	%f3
	ldub	[%l7 + 0x15],	%i2
	edge8	%o4,	%g3,	%o1
	xor	%g1,	%o0,	%i5
	stw	%i4,	[%l7 + 0x24]
	edge32	%l2,	%i0,	%g4
	save %g2, 0x0AE4, %i3
	save %i1, %o7, %l4
	fcmps	%fcc0,	%f4,	%f9
	st	%f0,	[%l7 + 0x68]
	ldsw	[%l7 + 0x24],	%o5
	umulcc	%l1,	0x0AEA,	%l3
	move	%xcc,	%i6,	%o6
	movrgz	%o2,	%i7,	%g5
	movl	%icc,	%o3,	%l5
	orncc	%l6,	%g6,	%g7
	mulx	%i2,	%l0,	%o4
	mova	%xcc,	%o1,	%g1
	array32	%g3,	%i5,	%i4
	fmovsneg	%icc,	%f14,	%f14
	or	%o0,	%i0,	%l2
	ldx	[%l7 + 0x70],	%g4
	smulcc	%i3,	%i1,	%o7
	array32	%l4,	%o5,	%l1
	movrlez	%l3,	%g2,	%o6
	movneg	%icc,	%i6,	%o2
	orcc	%g5,	%o3,	%l5
	srl	%l6,	0x0A,	%i7
	movne	%icc,	%g6,	%i2
	xorcc	%l0,	0x0F42,	%g7
	sub	%o1,	0x1D3E,	%o4
	movcs	%xcc,	%g1,	%g3
	fmovsleu	%icc,	%f7,	%f9
	fmovdle	%icc,	%f5,	%f11
	ldd	[%l7 + 0x50],	%f0
	addcc	%i4,	0x1C60,	%o0
	movleu	%icc,	%i0,	%i5
	xnor	%g4,	0x1B3A,	%i3
	ldx	[%l7 + 0x30],	%i1
	edge32	%o7,	%l2,	%o5
	addccc	%l1,	0x169E,	%l3
	movvs	%xcc,	%g2,	%o6
	mulx	%l4,	0x1208,	%o2
	orncc	%g5,	%o3,	%l5
	edge8n	%i6,	%l6,	%g6
	fmovscc	%icc,	%f14,	%f6
	addc	%i2,	0x0D9E,	%l0
	ldsh	[%l7 + 0x66],	%g7
	movn	%xcc,	%i7,	%o4
	fmovdcc	%xcc,	%f2,	%f4
	edge32	%g1,	%g3,	%i4
	fnot1	%f14,	%f2
	fandnot2s	%f6,	%f7,	%f5
	orn	%o1,	0x1115,	%o0
	xnor	%i5,	0x0DEC,	%g4
	orn	%i0,	0x0680,	%i3
	sub	%i1,	0x13CC,	%o7
	fnot2s	%f1,	%f3
	fornot2s	%f15,	%f10,	%f12
	orcc	%l2,	0x05CF,	%l1
	fmovsgu	%xcc,	%f9,	%f15
	smul	%o5,	%g2,	%o6
	fcmpne16	%f14,	%f4,	%l4
	edge32ln	%o2,	%g5,	%l3
	fnot1	%f6,	%f6
	fmovscc	%icc,	%f9,	%f1
	andn	%l5,	%i6,	%o3
	edge8ln	%g6,	%l6,	%l0
	fcmpne16	%f6,	%f2,	%i2
	xnorcc	%i7,	%g7,	%g1
	xnorcc	%o4,	%g3,	%i4
	addcc	%o1,	0x0B4D,	%o0
	ldd	[%l7 + 0x50],	%i4
	ldd	[%l7 + 0x48],	%i0
	movge	%xcc,	%i3,	%g4
	fmovsleu	%icc,	%f7,	%f12
	ldsw	[%l7 + 0x20],	%i1
	std	%f4,	[%l7 + 0x70]
	andn	%l2,	%l1,	%o7
	movrlez	%g2,	0x2B4,	%o5
	ldub	[%l7 + 0x62],	%l4
	edge8n	%o2,	%o6,	%l3
	fzero	%f10
	stb	%g5,	[%l7 + 0x51]
	fpack32	%f14,	%f10,	%f8
	sdivcc	%l5,	0x036B,	%o3
	srax	%g6,	%l6,	%l0
	fcmpes	%fcc2,	%f2,	%f15
	edge16n	%i2,	%i7,	%i6
	ldd	[%l7 + 0x20],	%f6
	fmovdneg	%icc,	%f0,	%f7
	st	%f11,	[%l7 + 0x18]
	movneg	%xcc,	%g7,	%o4
	fmovdne	%xcc,	%f1,	%f9
	edge32n	%g1,	%g3,	%o1
	movrgez	%o0,	%i4,	%i5
	edge32	%i0,	%i3,	%g4
	st	%f13,	[%l7 + 0x40]
	edge8n	%l2,	%l1,	%o7
	lduh	[%l7 + 0x6A],	%g2
	sth	%i1,	[%l7 + 0x60]
	mova	%xcc,	%o5,	%o2
	umul	%l4,	0x1185,	%l3
	movvc	%xcc,	%o6,	%g5
	fnot2s	%f2,	%f15
	fmovdn	%icc,	%f5,	%f15
	std	%f14,	[%l7 + 0x68]
	xorcc	%l5,	0x17FA,	%g6
	subcc	%l6,	0x1442,	%l0
	array32	%o3,	%i7,	%i6
	edge8ln	%i2,	%o4,	%g7
	edge32	%g3,	%g1,	%o1
	udivcc	%i4,	0x0BC1,	%o0
	edge8	%i5,	%i0,	%g4
	movrne	%i3,	%l1,	%l2
	edge8l	%g2,	%i1,	%o7
	fmul8x16al	%f4,	%f10,	%f8
	array32	%o5,	%o2,	%l3
	fmovrsne	%l4,	%f8,	%f12
	srl	%g5,	%o6,	%g6
	andncc	%l5,	%l6,	%o3
	fmovscc	%icc,	%f14,	%f7
	ldd	[%l7 + 0x28],	%f12
	edge8ln	%i7,	%l0,	%i2
	fsrc2	%f10,	%f2
	fcmpgt32	%f6,	%f2,	%o4
	movrlz	%g7,	%g3,	%g1
	array8	%o1,	%i4,	%o0
	or	%i5,	0x0814,	%i6
	sdivx	%g4,	0x00A3,	%i3
	edge32l	%i0,	%l1,	%l2
	edge16	%g2,	%i1,	%o5
	sth	%o7,	[%l7 + 0x3E]
	fcmple16	%f8,	%f0,	%o2
	addc	%l3,	%g5,	%l4
	movcc	%icc,	%o6,	%l5
	movge	%icc,	%l6,	%g6
	fmovrdlez	%i7,	%f10,	%f10
	fandnot1	%f4,	%f10,	%f12
	sub	%l0,	%i2,	%o4
	ld	[%l7 + 0x30],	%f1
	sdivx	%g7,	0x095C,	%o3
	movg	%icc,	%g1,	%o1
	stb	%g3,	[%l7 + 0x72]
	st	%f0,	[%l7 + 0x34]
	addcc	%i4,	%i5,	%i6
	fmul8ulx16	%f2,	%f8,	%f8
	fmul8x16au	%f4,	%f10,	%f10
	movn	%icc,	%o0,	%g4
	umul	%i3,	%i0,	%l2
	fcmpd	%fcc0,	%f6,	%f0
	st	%f14,	[%l7 + 0x18]
	stw	%l1,	[%l7 + 0x68]
	srax	%i1,	0x1B,	%o5
	restore %g2, %o2, %l3
	fxors	%f2,	%f12,	%f14
	movrgz	%o7,	%g5,	%l4
	smul	%l5,	0x05AC,	%o6
	fsrc1	%f10,	%f10
	fcmpes	%fcc1,	%f8,	%f11
	array16	%l6,	%g6,	%i7
	srl	%l0,	0x05,	%i2
	movge	%icc,	%g7,	%o3
	restore %g1, 0x0741, %o4
	movrgz	%g3,	0x332,	%i4
	sllx	%o1,	%i5,	%i6
	ldx	[%l7 + 0x38],	%o0
	sub	%i3,	0x015B,	%i0
	movrlz	%g4,	0x3A6,	%l1
	edge32n	%i1,	%o5,	%g2
	movre	%l2,	0x2E6,	%l3
	fors	%f11,	%f10,	%f12
	movge	%icc,	%o7,	%g5
	movl	%icc,	%o2,	%l4
	edge32	%o6,	%l6,	%l5
	movl	%xcc,	%g6,	%l0
	addccc	%i2,	%g7,	%i7
	mulscc	%g1,	0x0FA7,	%o4
	sllx	%g3,	%i4,	%o1
	fmovsvs	%xcc,	%f8,	%f6
	mulx	%i5,	0x0F95,	%i6
	addcc	%o0,	0x1132,	%i3
	ld	[%l7 + 0x18],	%f6
	popc	0x1CF9,	%o3
	edge8ln	%g4,	%l1,	%i0
	sra	%i1,	%g2,	%l2
	sllx	%l3,	%o7,	%o5
	fpack16	%f0,	%f6
	restore %g5, 0x1960, %o2
	movle	%xcc,	%l4,	%o6
	stw	%l5,	[%l7 + 0x14]
	andncc	%l6,	%l0,	%g6
	lduw	[%l7 + 0x40],	%g7
	edge16l	%i2,	%i7,	%g1
	fmovsge	%xcc,	%f10,	%f11
	ldsh	[%l7 + 0x18],	%o4
	sth	%g3,	[%l7 + 0x32]
	movrne	%o1,	0x086,	%i5
	udiv	%i6,	0x12C1,	%o0
	restore %i3, %o3, %g4
	array16	%i4,	%l1,	%i1
	bshuffle	%f12,	%f6,	%f10
	lduw	[%l7 + 0x54],	%g2
	movgu	%xcc,	%l2,	%i0
	mova	%icc,	%o7,	%l3
	and	%g5,	0x14C0,	%o2
	movg	%icc,	%l4,	%o6
	udiv	%o5,	0x149A,	%l6
	fnegs	%f7,	%f15
	fpack32	%f14,	%f4,	%f12
	array32	%l0,	%g6,	%l5
	movrne	%i2,	0x120,	%i7
	movre	%g7,	%o4,	%g3
	srax	%o1,	0x02,	%i5
	fone	%f2
	fmovdge	%icc,	%f12,	%f13
	fmovrse	%g1,	%f15,	%f12
	ld	[%l7 + 0x0C],	%f0
	save %i6, %o0, %i3
	stw	%g4,	[%l7 + 0x4C]
	fandnot1s	%f13,	%f12,	%f4
	array32	%i4,	%o3,	%i1
	andn	%l1,	%l2,	%i0
	smul	%o7,	%l3,	%g2
	fornot2	%f6,	%f12,	%f10
	ldub	[%l7 + 0x6A],	%g5
	ldd	[%l7 + 0x38],	%l4
	movcs	%icc,	%o6,	%o2
	fmovde	%icc,	%f12,	%f5
	bshuffle	%f6,	%f10,	%f10
	subc	%l6,	0x0E2E,	%o5
	stw	%l0,	[%l7 + 0x48]
	restore %g6, 0x0D4E, %i2
	fpmerge	%f6,	%f0,	%f12
	movl	%icc,	%l5,	%g7
	udiv	%i7,	0x115D,	%g3
	movre	%o4,	%i5,	%g1
	array16	%o1,	%o0,	%i3
	fnors	%f1,	%f0,	%f14
	edge8l	%i6,	%g4,	%i4
	xor	%o3,	0x08AB,	%l1
	movcs	%xcc,	%i1,	%l2
	save %o7, %l3, %g2
	subcc	%g5,	%l4,	%i0
	alignaddr	%o6,	%l6,	%o2
	sub	%o5,	0x14EE,	%l0
	movcs	%icc,	%i2,	%g6
	movrgez	%g7,	%l5,	%g3
	ldx	[%l7 + 0x20],	%o4
	srlx	%i7,	0x0E,	%g1
	ldsb	[%l7 + 0x66],	%i5
	fcmple32	%f0,	%f10,	%o1
	subc	%i3,	%i6,	%g4
	edge8ln	%o0,	%i4,	%l1
	popc	%i1,	%o3
	movre	%l2,	%o7,	%l3
	xnorcc	%g5,	%g2,	%i0
	edge8l	%o6,	%l6,	%o2
	save %l4, %o5, %i2
	stb	%g6,	[%l7 + 0x4D]
	ld	[%l7 + 0x64],	%f11
	ldsh	[%l7 + 0x7C],	%l0
	movl	%xcc,	%g7,	%g3
	srlx	%l5,	%o4,	%g1
	fmovdneg	%icc,	%f15,	%f12
	addcc	%i7,	%o1,	%i5
	fmuld8ulx16	%f7,	%f12,	%f2
	movcs	%icc,	%i3,	%i6
	orn	%g4,	%o0,	%i4
	edge16ln	%l1,	%i1,	%o3
	movrlz	%l2,	0x235,	%l3
	save %g5, 0x08AC, %o7
	subccc	%i0,	%g2,	%o6
	sethi	0x0019,	%o2
	pdist	%f12,	%f12,	%f8
	sdivcc	%l4,	0x13EF,	%l6
	movle	%icc,	%o5,	%i2
	fandnot1	%f12,	%f10,	%f4
	lduw	[%l7 + 0x0C],	%g6
	fmovrslez	%g7,	%f9,	%f3
	stb	%l0,	[%l7 + 0x4D]
	movg	%xcc,	%l5,	%g3
	movre	%o4,	%i7,	%g1
	subc	%o1,	%i3,	%i6
	and	%g4,	%o0,	%i5
	umul	%l1,	%i4,	%i1
	fmovsvs	%xcc,	%f1,	%f15
	srax	%l2,	0x05,	%l3
	popc	%o3,	%g5
	movle	%icc,	%i0,	%o7
	movn	%xcc,	%g2,	%o6
	fmovsl	%xcc,	%f12,	%f12
	xorcc	%l4,	%l6,	%o2
	edge16	%o5,	%i2,	%g7
	st	%f4,	[%l7 + 0x54]
	fmovsge	%icc,	%f5,	%f5
	xor	%g6,	%l5,	%l0
	edge32ln	%o4,	%g3,	%i7
	st	%f0,	[%l7 + 0x50]
	andn	%o1,	0x049C,	%i3
	mova	%icc,	%g1,	%g4
	mulscc	%i6,	0x1860,	%o0
	mulscc	%l1,	%i5,	%i1
	fmovsg	%icc,	%f13,	%f15
	fand	%f10,	%f2,	%f6
	std	%f10,	[%l7 + 0x30]
	fnot1	%f2,	%f4
	ld	[%l7 + 0x48],	%f8
	fmovse	%icc,	%f9,	%f13
	edge8	%l2,	%i4,	%o3
	movle	%xcc,	%g5,	%l3
	movvc	%icc,	%o7,	%g2
	fmovspos	%icc,	%f5,	%f6
	movl	%xcc,	%i0,	%l4
	ldsh	[%l7 + 0x64],	%l6
	sllx	%o6,	0x1A,	%o5
	mulx	%i2,	%o2,	%g7
	fxnor	%f6,	%f8,	%f2
	fsrc2	%f8,	%f4
	edge8ln	%g6,	%l5,	%l0
	edge32	%o4,	%i7,	%g3
	ldx	[%l7 + 0x48],	%o1
	std	%f0,	[%l7 + 0x68]
	orcc	%g1,	0x10AF,	%i3
	sethi	0x1997,	%i6
	fpadd16	%f8,	%f4,	%f10
	xor	%g4,	%l1,	%o0
	movrlez	%i5,	%i1,	%l2
	sdiv	%o3,	0x1901,	%g5
	orcc	%i4,	0x1E92,	%l3
	andcc	%o7,	%i0,	%l4
	umul	%g2,	0x000A,	%l6
	edge16ln	%o5,	%o6,	%o2
	udiv	%i2,	0x18E0,	%g7
	andncc	%g6,	%l5,	%o4
	fpack16	%f6,	%f15
	edge8ln	%l0,	%i7,	%o1
	fxnors	%f5,	%f0,	%f5
	fnot2s	%f4,	%f1
	edge32l	%g3,	%g1,	%i3
	fnot2	%f2,	%f14
	add	%i6,	%l1,	%o0
	array32	%g4,	%i1,	%i5
	edge32n	%o3,	%l2,	%i4
	movge	%icc,	%l3,	%o7
	edge8n	%i0,	%g5,	%g2
	subc	%l4,	0x135D,	%o5
	movvc	%xcc,	%o6,	%l6
	fmovs	%f7,	%f15
	mova	%icc,	%o2,	%i2
	sra	%g6,	0x01,	%l5
	edge8	%g7,	%l0,	%o4
	fmul8x16au	%f11,	%f7,	%f0
	umul	%o1,	%g3,	%g1
	movvs	%icc,	%i3,	%i6
	movneg	%icc,	%l1,	%o0
	srlx	%g4,	0x18,	%i1
	st	%f10,	[%l7 + 0x20]
	alignaddrl	%i7,	%o3,	%l2
	andncc	%i4,	%i5,	%o7
	fcmped	%fcc1,	%f12,	%f6
	subc	%l3,	0x143F,	%g5
	fnot1s	%f3,	%f15
	movrgz	%g2,	0x15D,	%l4
	andn	%o5,	0x100D,	%o6
	andn	%l6,	%i0,	%i2
	ldsw	[%l7 + 0x08],	%o2
	subccc	%l5,	0x005E,	%g7
	movneg	%xcc,	%l0,	%o4
	std	%f14,	[%l7 + 0x28]
	andcc	%o1,	%g3,	%g1
	sdivcc	%i3,	0x1CA8,	%i6
	sra	%g6,	%o0,	%g4
	fcmpd	%fcc2,	%f14,	%f8
	udiv	%i1,	0x04AA,	%l1
	fmovrslez	%i7,	%f14,	%f11
	sll	%l2,	%o3,	%i5
	movneg	%icc,	%i4,	%o7
	movcs	%icc,	%l3,	%g5
	sdivx	%g2,	0x00CB,	%l4
	movne	%xcc,	%o6,	%o5
	srl	%l6,	0x1A,	%i0
	movl	%xcc,	%o2,	%l5
	sethi	0x0678,	%g7
	movn	%xcc,	%l0,	%o4
	lduh	[%l7 + 0x5E],	%i2
	addc	%o1,	0x0A7B,	%g1
	fabss	%f1,	%f0
	ldsh	[%l7 + 0x38],	%i3
	ldsh	[%l7 + 0x16],	%i6
	faligndata	%f0,	%f2,	%f8
	fpadd16s	%f8,	%f15,	%f2
	array16	%g6,	%g3,	%g4
	edge16n	%i1,	%l1,	%o0
	edge16ln	%l2,	%i7,	%o3
	xnorcc	%i4,	%o7,	%i5
	movrlez	%g5,	0x3D6,	%l3
	fmovdgu	%icc,	%f12,	%f7
	addccc	%l4,	0x1000,	%g2
	addc	%o6,	0x0DA5,	%l6
	xorcc	%i0,	%o2,	%l5
	fmovdleu	%xcc,	%f8,	%f0
	andcc	%g7,	%l0,	%o4
	movl	%icc,	%i2,	%o1
	array32	%g1,	%o5,	%i6
	sllx	%i3,	%g3,	%g4
	add	%g6,	0x1F61,	%l1
	ldsb	[%l7 + 0x4B],	%i1
	fornot2s	%f14,	%f2,	%f3
	add	%l2,	0x0338,	%i7
	movge	%xcc,	%o3,	%i4
	sdivx	%o0,	0x0A9A,	%o7
	movcs	%icc,	%i5,	%g5
	fmovrdgez	%l4,	%f10,	%f2
	movl	%icc,	%l3,	%o6
	fandnot1s	%f8,	%f10,	%f15
	st	%f12,	[%l7 + 0x1C]
	edge32l	%g2,	%i0,	%o2
	lduh	[%l7 + 0x18],	%l5
	edge32l	%g7,	%l6,	%l0
	fcmpgt32	%f14,	%f4,	%i2
	fcmple32	%f8,	%f4,	%o4
	orcc	%g1,	0x0102,	%o5
	movg	%xcc,	%i6,	%i3
	movrlez	%g3,	%g4,	%o1
	fmovrdgez	%l1,	%f4,	%f4
	edge32l	%i1,	%g6,	%l2
	ldsh	[%l7 + 0x70],	%o3
	movrgz	%i7,	%o0,	%i4
	sll	%o7,	%i5,	%l4
	fmul8x16au	%f8,	%f0,	%f8
	ldsh	[%l7 + 0x14],	%l3
	movcc	%icc,	%o6,	%g2
	fornot1s	%f6,	%f3,	%f12
	fcmped	%fcc3,	%f12,	%f4
	array32	%i0,	%o2,	%l5
	sdiv	%g7,	0x1B6A,	%g5
	sth	%l6,	[%l7 + 0x40]
	sethi	0x1107,	%i2
	fmovrsne	%o4,	%f1,	%f14
	sra	%g1,	%l0,	%i6
	restore %i3, 0x1548, %o5
	mulscc	%g3,	0x1570,	%o1
	fmuld8sux16	%f1,	%f11,	%f14
	movrlez	%l1,	0x3F3,	%g4
	sub	%i1,	%g6,	%l2
	alignaddr	%o3,	%i7,	%o0
	fmovrdlez	%o7,	%f2,	%f12
	xorcc	%i4,	%i5,	%l4
	sth	%l3,	[%l7 + 0x4A]
	array32	%o6,	%i0,	%g2
	ld	[%l7 + 0x14],	%f1
	movgu	%xcc,	%l5,	%o2
	lduw	[%l7 + 0x60],	%g5
	andncc	%l6,	%i2,	%o4
	fpsub32s	%f2,	%f1,	%f8
	fcmpeq16	%f6,	%f0,	%g7
	movrgez	%g1,	0x388,	%i6
	array8	%l0,	%o5,	%g3
	ldsh	[%l7 + 0x68],	%o1
	fmovdpos	%icc,	%f1,	%f8
	udiv	%i3,	0x0F11,	%g4
	sdiv	%l1,	0x150E,	%i1
	ldsw	[%l7 + 0x30],	%g6
	alignaddrl	%l2,	%o3,	%o0
	subc	%o7,	%i4,	%i5
	umulcc	%i7,	%l3,	%o6
	edge32n	%l4,	%i0,	%l5
	movcs	%icc,	%g2,	%g5
	alignaddr	%l6,	%i2,	%o4
	movrgez	%g7,	%g1,	%i6
	fmul8sux16	%f0,	%f14,	%f14
	fnot2	%f0,	%f4
	ldsb	[%l7 + 0x32],	%l0
	std	%f2,	[%l7 + 0x10]
	sub	%o2,	0x0A0D,	%o5
	ldsh	[%l7 + 0x38],	%g3
	mulscc	%i3,	%o1,	%l1
	fnot2	%f6,	%f6
	ldsb	[%l7 + 0x24],	%i1
	udiv	%g4,	0x0550,	%g6
	andn	%o3,	%o0,	%o7
	add	%l2,	0x153B,	%i5
	fmovrdgz	%i4,	%f10,	%f14
	fnegs	%f5,	%f3
	movrne	%i7,	0x012,	%l3
	movpos	%xcc,	%o6,	%i0
	smulcc	%l5,	%l4,	%g2
	std	%f10,	[%l7 + 0x38]
	smulcc	%l6,	0x13E7,	%i2
	ldsw	[%l7 + 0x24],	%g5
	xor	%o4,	0x0BEC,	%g1
	sllx	%i6,	0x14,	%l0
	subcc	%o2,	0x027B,	%g7
	edge32l	%g3,	%o5,	%o1
	sth	%i3,	[%l7 + 0x24]
	edge8n	%i1,	%g4,	%l1
	fmovdpos	%icc,	%f9,	%f14
	udivcc	%g6,	0x0466,	%o3
	fmovsleu	%icc,	%f1,	%f13
	fmovrslz	%o7,	%f0,	%f9
	fmovdg	%xcc,	%f1,	%f15
	fpsub32s	%f2,	%f1,	%f6
	smul	%l2,	%o0,	%i4
	movn	%icc,	%i7,	%i5
	srlx	%l3,	0x16,	%o6
	fxnors	%f4,	%f0,	%f3
	or	%l5,	0x1296,	%l4
	movrlz	%i0,	%l6,	%i2
	movge	%xcc,	%g5,	%g2
	edge16n	%g1,	%i6,	%l0
	fmovdvc	%icc,	%f4,	%f5
	fmovdl	%icc,	%f10,	%f11
	subccc	%o2,	0x040E,	%g7
	fsrc1	%f2,	%f2
	subc	%o4,	0x071E,	%o5
	fmovse	%xcc,	%f2,	%f13
	fpadd16s	%f4,	%f0,	%f6
	movle	%icc,	%o1,	%i3
	sub	%g3,	%i1,	%l1
	fmovdneg	%icc,	%f9,	%f8
	popc	0x053D,	%g6
	array32	%o3,	%o7,	%l2
	edge8n	%g4,	%i4,	%o0
	movrne	%i7,	%i5,	%o6
	movle	%icc,	%l3,	%l4
	movrlz	%i0,	0x366,	%l6
	ldx	[%l7 + 0x28],	%i2
	or	%l5,	0x13CF,	%g2
	or	%g1,	0x1A19,	%g5
	alignaddrl	%l0,	%i6,	%g7
	srax	%o2,	%o4,	%o1
	smul	%i3,	0x103D,	%o5
	stb	%g3,	[%l7 + 0x6B]
	bshuffle	%f0,	%f12,	%f0
	edge32n	%l1,	%i1,	%g6
	movrlz	%o3,	0x03F,	%o7
	edge8n	%g4,	%i4,	%l2
	sub	%i7,	0x14FD,	%i5
	edge32ln	%o6,	%o0,	%l4
	movneg	%xcc,	%l3,	%l6
	alignaddrl	%i0,	%i2,	%g2
	ld	[%l7 + 0x7C],	%f0
	smul	%g1,	%g5,	%l0
	std	%f6,	[%l7 + 0x18]
	sub	%i6,	%g7,	%o2
	fmovrslez	%l5,	%f3,	%f2
	and	%o4,	%i3,	%o1
	restore %g3, %l1, %o5
	edge32ln	%i1,	%g6,	%o7
	edge16n	%g4,	%o3,	%l2
	save %i4, %i5, %o6
	ldsb	[%l7 + 0x79],	%i7
	andncc	%l4,	%o0,	%l6
	xnor	%i0,	%l3,	%i2
	stb	%g2,	[%l7 + 0x11]
	ldsw	[%l7 + 0x7C],	%g1
	movrgez	%l0,	0x17B,	%i6
	ldd	[%l7 + 0x08],	%g4
	movle	%icc,	%g7,	%o2
	fmovdcs	%xcc,	%f5,	%f10
	movgu	%icc,	%o4,	%i3
	andn	%o1,	0x140E,	%l5
	edge16ln	%g3,	%o5,	%l1
	fnot1	%f8,	%f12
	alignaddrl	%i1,	%g6,	%g4
	fmuld8ulx16	%f4,	%f2,	%f6
	umul	%o3,	0x17D0,	%l2
	array16	%o7,	%i5,	%o6
	fmovsleu	%icc,	%f9,	%f15
	fmovdge	%xcc,	%f1,	%f3
	edge8n	%i7,	%i4,	%o0
	fandnot1s	%f12,	%f1,	%f7
	movle	%icc,	%l4,	%l6
	edge16	%i0,	%i2,	%l3
	array16	%g1,	%g2,	%i6
	fmovsg	%xcc,	%f10,	%f13
	fmovscc	%icc,	%f14,	%f5
	fmovdleu	%xcc,	%f13,	%f4
	sethi	0x04B6,	%l0
	fcmpes	%fcc2,	%f10,	%f9
	smul	%g5,	0x1041,	%o2
	fcmpeq16	%f2,	%f6,	%g7
	std	%f6,	[%l7 + 0x10]
	srlx	%i3,	%o1,	%l5
	sll	%o4,	0x16,	%g3
	fmovdge	%icc,	%f9,	%f3
	fmovsge	%xcc,	%f9,	%f14
	edge16ln	%o5,	%l1,	%i1
	fmovsg	%icc,	%f11,	%f10
	array16	%g6,	%g4,	%l2
	fexpand	%f8,	%f4
	umul	%o3,	%o7,	%o6
	subcc	%i7,	%i5,	%i4
	edge32	%o0,	%l6,	%i0
	edge8ln	%i2,	%l4,	%g1
	subc	%l3,	%i6,	%l0
	edge8n	%g5,	%o2,	%g7
	lduh	[%l7 + 0x24],	%i3
	fcmpeq32	%f10,	%f14,	%g2
	edge8	%o1,	%l5,	%o4
	sra	%o5,	0x05,	%g3
	xnor	%l1,	0x0BFF,	%g6
	udivcc	%g4,	0x1058,	%i1
	edge16l	%o3,	%l2,	%o7
	umulcc	%i7,	0x0997,	%o6
	array16	%i5,	%o0,	%i4
	smulcc	%l6,	%i0,	%l4
	edge16	%i2,	%g1,	%i6
	movvc	%xcc,	%l3,	%l0
	mulscc	%g5,	0x13A7,	%g7
	movre	%o2,	0x3EF,	%g2
	edge32n	%i3,	%l5,	%o4
	movrgz	%o1,	%g3,	%l1
	movpos	%xcc,	%g6,	%g4
	addcc	%i1,	0x0D2F,	%o5
	orn	%o3,	%l2,	%o7
	sth	%i7,	[%l7 + 0x52]
	fpsub16	%f2,	%f10,	%f2
	fxnors	%f0,	%f1,	%f7
	fmovde	%icc,	%f15,	%f12
	edge32ln	%i5,	%o0,	%i4
	xnorcc	%o6,	%l6,	%i0
	fnot2	%f8,	%f0
	addcc	%i2,	0x1EFC,	%g1
	array16	%i6,	%l3,	%l4
	sra	%l0,	0x00,	%g7
	sdiv	%g5,	0x0EC7,	%o2
	ldub	[%l7 + 0x58],	%i3
	andn	%l5,	0x1142,	%g2
	array16	%o4,	%g3,	%o1
	fsrc1s	%f2,	%f14
	popc	%l1,	%g6
	movge	%icc,	%i1,	%g4
	popc	%o5,	%l2
	orcc	%o3,	0x0A87,	%o7
	fcmpd	%fcc1,	%f10,	%f6
	fnot2s	%f7,	%f9
	movpos	%icc,	%i5,	%o0
	save %i4, %o6, %l6
	fsrc1	%f6,	%f8
	movcc	%xcc,	%i0,	%i7
	movrne	%i2,	0x3B5,	%i6
	subc	%g1,	%l3,	%l0
	movrgz	%l4,	0x0AE,	%g5
	fsrc1	%f0,	%f0
	umul	%o2,	%g7,	%i3
	fmovsn	%xcc,	%f10,	%f13
	sdivcc	%g2,	0x112F,	%l5
	fands	%f5,	%f0,	%f12
	ldsh	[%l7 + 0x3A],	%o4
	lduh	[%l7 + 0x36],	%o1
	fmul8ulx16	%f14,	%f2,	%f10
	edge8n	%l1,	%g6,	%i1
	fmovd	%f0,	%f4
	edge32	%g4,	%g3,	%o5
	fmovrde	%o3,	%f6,	%f4
	sdivcc	%o7,	0x0E4D,	%l2
	ld	[%l7 + 0x70],	%f12
	ldd	[%l7 + 0x38],	%f2
	movcs	%xcc,	%i5,	%i4
	bshuffle	%f12,	%f0,	%f14
	smul	%o0,	0x006E,	%o6
	sth	%l6,	[%l7 + 0x3A]
	movgu	%xcc,	%i7,	%i2
	mulx	%i0,	%g1,	%l3
	umul	%l0,	0x16F2,	%i6
	array16	%g5,	%o2,	%g7
	fornot2s	%f2,	%f10,	%f7
	xorcc	%l4,	%g2,	%l5
	ldd	[%l7 + 0x68],	%f2
	andn	%o4,	0x18FD,	%o1
	add	%l1,	%g6,	%i1
	edge32	%i3,	%g3,	%o5
	mulx	%g4,	%o7,	%o3
	orncc	%l2,	%i4,	%o0
	lduw	[%l7 + 0x50],	%o6
	fmovsg	%xcc,	%f3,	%f11
	fmovrse	%l6,	%f14,	%f0
	movle	%xcc,	%i7,	%i5
	ldd	[%l7 + 0x60],	%f8
	save %i2, 0x07E9, %i0
	xnor	%l3,	%g1,	%i6
	movcs	%xcc,	%l0,	%g5
	fornot1	%f12,	%f6,	%f14
	srlx	%o2,	%g7,	%l4
	udiv	%l5,	0x0BF0,	%o4
	fnot1	%f4,	%f10
	fmovdcc	%icc,	%f13,	%f0
	fmovrslez	%o1,	%f3,	%f8
	restore %l1, %g6, %g2
	mova	%xcc,	%i3,	%g3
	alignaddrl	%i1,	%g4,	%o5
	udivx	%o7,	0x127B,	%o3
	movrlz	%l2,	%o0,	%i4
	fsrc1s	%f13,	%f4
	movl	%icc,	%l6,	%i7
	fmovsleu	%icc,	%f12,	%f13
	movvc	%icc,	%i5,	%o6
	xorcc	%i2,	%i0,	%l3
	movneg	%icc,	%i6,	%g1
	array32	%l0,	%g5,	%o2
	smulcc	%g7,	0x1CA7,	%l5
	movgu	%xcc,	%o4,	%o1
	xnorcc	%l1,	0x0EE0,	%g6
	edge32l	%l4,	%i3,	%g2
	movleu	%xcc,	%i1,	%g3
	xorcc	%o5,	0x1E1B,	%g4
	sra	%o3,	%o7,	%l2
	array16	%i4,	%o0,	%i7
	movneg	%xcc,	%i5,	%o6
	ldx	[%l7 + 0x18],	%i2
	fmul8x16al	%f5,	%f12,	%f14
	sra	%l6,	0x04,	%i0
	udivcc	%l3,	0x1D79,	%g1
	umul	%i6,	%g5,	%l0
	umul	%o2,	0x0B6B,	%l5
	subcc	%o4,	%o1,	%l1
	ldub	[%l7 + 0x23],	%g7
	sra	%l4,	0x12,	%i3
	fmovrsne	%g2,	%f10,	%f15
	andcc	%i1,	%g3,	%g6
	movvs	%xcc,	%g4,	%o3
	sllx	%o7,	0x11,	%o5
	subccc	%l2,	0x0D77,	%o0
	edge32n	%i7,	%i5,	%o6
	stb	%i4,	[%l7 + 0x27]
	std	%f4,	[%l7 + 0x60]
	andcc	%l6,	%i0,	%i2
	fmovd	%f8,	%f10
	edge8	%l3,	%i6,	%g5
	fnor	%f6,	%f2,	%f2
	fnand	%f6,	%f6,	%f14
	movcc	%icc,	%l0,	%o2
	smul	%l5,	0x1453,	%g1
	array16	%o4,	%o1,	%g7
	movre	%l1,	%i3,	%l4
	movge	%icc,	%g2,	%g3
	xorcc	%i1,	%g4,	%g6
	movneg	%xcc,	%o7,	%o5
	sll	%l2,	0x1B,	%o0
	array32	%o3,	%i5,	%o6
	sdivx	%i7,	0x1660,	%l6
	fcmple32	%f4,	%f12,	%i4
	fmovrslz	%i0,	%f7,	%f13
	fnand	%f0,	%f12,	%f10
	umul	%l3,	%i6,	%i2
	alignaddr	%l0,	%o2,	%l5
	movge	%xcc,	%g1,	%o4
	movrne	%o1,	%g7,	%g5
	movrgz	%i3,	%l1,	%g2
	edge32n	%g3,	%i1,	%l4
	alignaddr	%g6,	%o7,	%g4
	udivcc	%l2,	0x0B1B,	%o5
	movvc	%icc,	%o0,	%i5
	fmul8x16au	%f14,	%f4,	%f6
	andcc	%o6,	%o3,	%i7
	sdivcc	%l6,	0x150C,	%i4
	smul	%l3,	%i0,	%i6
	mulx	%l0,	%o2,	%i2
	sra	%l5,	0x14,	%o4
	movrlz	%g1,	0x399,	%o1
	edge16ln	%g5,	%i3,	%g7
	movcc	%xcc,	%g2,	%l1
	array32	%g3,	%l4,	%i1
	edge16n	%g6,	%g4,	%o7
	mova	%icc,	%l2,	%o0
	mova	%icc,	%o5,	%o6
	mulscc	%o3,	0x0CC5,	%i5
	subcc	%l6,	%i4,	%i7
	edge32l	%i0,	%l3,	%l0
	ld	[%l7 + 0x74],	%f11
	movg	%xcc,	%o2,	%i2
	array16	%l5,	%o4,	%i6
	fcmpne32	%f14,	%f8,	%o1
	sth	%g5,	[%l7 + 0x56]
	xor	%g1,	%g7,	%g2
	edge8n	%l1,	%g3,	%l4
	sllx	%i3,	0x14,	%g6
	andn	%g4,	%i1,	%o7
	and	%l2,	0x09A2,	%o5
	fcmpne16	%f14,	%f8,	%o0
	movgu	%icc,	%o3,	%o6
	stw	%l6,	[%l7 + 0x68]
	movn	%xcc,	%i4,	%i5
	edge32ln	%i0,	%l3,	%i7
	ldsb	[%l7 + 0x43],	%o2
	udiv	%i2,	0x04C9,	%l5
	andcc	%o4,	0x0391,	%l0
	movn	%icc,	%o1,	%g5
	ldsh	[%l7 + 0x3C],	%g1
	ldd	[%l7 + 0x28],	%f8
	movn	%icc,	%i6,	%g2
	stx	%g7,	[%l7 + 0x20]
	fcmple32	%f6,	%f0,	%g3
	xnor	%l4,	%l1,	%g6
	stb	%g4,	[%l7 + 0x23]
	sra	%i1,	0x0D,	%o7
	fcmple32	%f0,	%f14,	%i3
	std	%f12,	[%l7 + 0x38]
	addc	%l2,	%o0,	%o3
	srax	%o6,	%o5,	%l6
	andncc	%i5,	%i4,	%i0
	movrgz	%l3,	0x26A,	%o2
	save %i2, %l5, %i7
	movleu	%xcc,	%o4,	%o1
	add	%l0,	%g1,	%g5
	ldd	[%l7 + 0x50],	%i6
	udiv	%g2,	0x0A3F,	%g3
	edge16n	%g7,	%l1,	%g6
	sdivcc	%g4,	0x0802,	%i1
	movcc	%icc,	%l4,	%i3
	alignaddrl	%l2,	%o0,	%o3
	or	%o6,	%o5,	%l6
	andcc	%i5,	0x0219,	%i4
	edge16ln	%i0,	%o7,	%o2
	sdiv	%i2,	0x1DBD,	%l5
	movrgez	%l3,	%o4,	%i7
	sll	%o1,	%g1,	%g5
	edge32ln	%l0,	%g2,	%g3
	movre	%i6,	0x2C8,	%l1
	movrne	%g7,	0x091,	%g4
	stx	%g6,	[%l7 + 0x10]
	or	%l4,	0x05B7,	%i1
	fabsd	%f10,	%f6
	udivx	%i3,	0x0AF9,	%l2
	edge32l	%o0,	%o3,	%o5
	lduh	[%l7 + 0x26],	%l6
	subcc	%o6,	%i5,	%i0
	bshuffle	%f6,	%f0,	%f4
	or	%o7,	%o2,	%i2
	fornot2	%f4,	%f2,	%f10
	fsrc1	%f12,	%f4
	sdivcc	%i4,	0x07FD,	%l5
	movg	%icc,	%o4,	%l3
	st	%f11,	[%l7 + 0x74]
	ldsh	[%l7 + 0x7C],	%i7
	addccc	%g1,	%o1,	%l0
	movn	%xcc,	%g5,	%g2
	edge16ln	%i6,	%g3,	%g7
	st	%f2,	[%l7 + 0x64]
	fabss	%f13,	%f9
	movrlz	%g4,	%l1,	%l4
	subc	%i1,	%g6,	%l2
	move	%icc,	%o0,	%o3
	srl	%i3,	%l6,	%o6
	edge8ln	%i5,	%i0,	%o7
	mova	%icc,	%o2,	%i2
	sdivcc	%o5,	0x0238,	%l5
	ldx	[%l7 + 0x08],	%o4
	sdiv	%l3,	0x0183,	%i4
	sra	%i7,	0x10,	%g1
	subccc	%l0,	%o1,	%g2
	stb	%g5,	[%l7 + 0x32]
	edge8l	%i6,	%g3,	%g7
	movrgez	%g4,	%l4,	%i1
	ldd	[%l7 + 0x78],	%l0
	umul	%g6,	0x0B14,	%o0
	alignaddrl	%l2,	%o3,	%i3
	addc	%l6,	0x0CB2,	%o6
	fmovda	%icc,	%f7,	%f2
	sethi	0x1E8C,	%i0
	udivx	%i5,	0x1472,	%o2
	stb	%i2,	[%l7 + 0x74]
	movrgez	%o7,	0x0D3,	%l5
	fcmpeq32	%f0,	%f6,	%o4
	array32	%o5,	%l3,	%i7
	mulx	%g1,	%l0,	%o1
	sub	%i4,	0x15C0,	%g2
	edge8l	%i6,	%g3,	%g5
	fmovsg	%xcc,	%f13,	%f14
	ldub	[%l7 + 0x56],	%g4
	fcmpgt32	%f4,	%f0,	%l4
	movre	%g7,	%i1,	%g6
	edge8n	%o0,	%l2,	%o3
	fmovsvc	%icc,	%f14,	%f6
	ld	[%l7 + 0x0C],	%f6
	add	%l1,	0x1DA4,	%i3
	movvc	%xcc,	%l6,	%i0
	fmovdvs	%icc,	%f12,	%f10
	stx	%i5,	[%l7 + 0x08]
	movle	%icc,	%o2,	%o6
	fmuld8sux16	%f10,	%f8,	%f4
	ldub	[%l7 + 0x5E],	%i2
	array32	%l5,	%o7,	%o4
	alignaddr	%l3,	%i7,	%o5
	srax	%g1,	%l0,	%i4
	addc	%g2,	0x0E3C,	%o1
	fmovsleu	%xcc,	%f4,	%f2
	ldx	[%l7 + 0x68],	%g3
	fmovsl	%icc,	%f11,	%f12
	fxor	%f8,	%f6,	%f8
	fnands	%f3,	%f7,	%f7
	movcc	%xcc,	%g5,	%i6
	movle	%icc,	%g4,	%l4
	fmovrsgz	%i1,	%f10,	%f15
	edge32n	%g7,	%g6,	%l2
	srlx	%o3,	0x0C,	%l1
	sdivx	%o0,	0x0DF7,	%i3
	edge8ln	%l6,	%i5,	%i0
	and	%o2,	%o6,	%l5
	movpos	%xcc,	%i2,	%o4
	array8	%o7,	%i7,	%l3
	lduh	[%l7 + 0x34],	%g1
	ldsh	[%l7 + 0x6A],	%o5
	edge16ln	%i4,	%l0,	%g2
	sub	%o1,	%g5,	%i6
	sub	%g4,	%l4,	%i1
	movrlz	%g3,	0x3F1,	%g7
	ldx	[%l7 + 0x20],	%g6
	fexpand	%f11,	%f8
	umulcc	%o3,	0x1D69,	%l2
	add	%o0,	%i3,	%l6
	sllx	%i5,	%l1,	%i0
	fmovdpos	%xcc,	%f15,	%f0
	subcc	%o6,	%o2,	%i2
	and	%l5,	%o7,	%i7
	alignaddrl	%o4,	%g1,	%o5
	edge8ln	%i4,	%l0,	%l3
	ldsh	[%l7 + 0x10],	%o1
	addcc	%g2,	0x1DBA,	%i6
	fcmpne16	%f14,	%f14,	%g5
	fornot1s	%f12,	%f0,	%f15
	restore %g4, 0x1795, %l4
	movn	%xcc,	%i1,	%g7
	movvc	%xcc,	%g6,	%g3
	ldd	[%l7 + 0x78],	%o2
	sllx	%l2,	0x0A,	%o0
	alignaddrl	%l6,	%i5,	%i3
	move	%icc,	%l1,	%o6
	smul	%o2,	%i2,	%l5
	movne	%icc,	%o7,	%i0
	fand	%f14,	%f10,	%f10
	mulscc	%o4,	0x0F07,	%i7
	fornot2s	%f15,	%f15,	%f6
	sll	%g1,	0x0B,	%i4
	udivcc	%l0,	0x1C7F,	%o5
	fmovspos	%icc,	%f4,	%f9
	edge32l	%l3,	%o1,	%g2
	alignaddrl	%i6,	%g5,	%g4
	edge32l	%i1,	%l4,	%g6
	movne	%icc,	%g7,	%o3
	array32	%l2,	%o0,	%g3
	xorcc	%i5,	%i3,	%l6
	sdivcc	%l1,	0x08C5,	%o6
	fmovrde	%o2,	%f12,	%f12
	fzero	%f0
	fmovsle	%icc,	%f5,	%f4
	fornot1	%f12,	%f6,	%f10
	movgu	%xcc,	%l5,	%o7
	srl	%i0,	0x1F,	%i2
	xorcc	%i7,	0x095D,	%o4
	fcmped	%fcc3,	%f4,	%f10
	edge16	%g1,	%l0,	%o5
	fpack16	%f2,	%f14
	xor	%l3,	%o1,	%g2
	edge8	%i4,	%g5,	%g4
	mulscc	%i1,	0x04E3,	%l4
	edge8ln	%i6,	%g7,	%g6
	movpos	%icc,	%o3,	%o0
	movn	%xcc,	%g3,	%l2
	sethi	0x1528,	%i5
	fmovdn	%xcc,	%f12,	%f14
	smul	%l6,	%l1,	%o6
	movrgz	%o2,	0x1E5,	%i3
	fandnot1	%f4,	%f12,	%f2
	fmovdl	%icc,	%f2,	%f12
	movre	%l5,	%o7,	%i2
	edge32ln	%i7,	%o4,	%i0
	movneg	%icc,	%g1,	%l0
	ldd	[%l7 + 0x48],	%f12
	alignaddrl	%o5,	%l3,	%o1
	movre	%i4,	%g2,	%g4
	ldub	[%l7 + 0x4B],	%g5
	sdivx	%l4,	0x00CF,	%i1
	stb	%g7,	[%l7 + 0x75]
	movrgz	%g6,	0x2D8,	%i6
	sll	%o0,	0x0A,	%o3
	fcmped	%fcc3,	%f0,	%f14
	edge16n	%l2,	%g3,	%l6
	sdiv	%i5,	0x0766,	%l1
	mulscc	%o2,	%o6,	%l5
	andncc	%o7,	%i3,	%i2
	edge16n	%i7,	%i0,	%g1
	umul	%l0,	0x166E,	%o5
	subcc	%o4,	0x17E9,	%l3
	std	%f10,	[%l7 + 0x60]
	movne	%xcc,	%i4,	%g2
	array32	%g4,	%o1,	%g5
	lduh	[%l7 + 0x18],	%i1
	orcc	%l4,	%g7,	%i6
	fone	%f14
	ldx	[%l7 + 0x60],	%o0
	edge32ln	%o3,	%l2,	%g6
	ld	[%l7 + 0x50],	%f0
	lduw	[%l7 + 0x64],	%g3
	sllx	%i5,	0x19,	%l6
	subcc	%o2,	%o6,	%l5
	addccc	%l1,	%o7,	%i3
	edge32	%i2,	%i7,	%g1
	xnorcc	%l0,	0x18DB,	%i0
	lduw	[%l7 + 0x74],	%o4
	movrlz	%o5,	%l3,	%g2
	addcc	%g4,	0x0DA2,	%i4
	fnor	%f10,	%f8,	%f2
	ldsh	[%l7 + 0x34],	%o1
	fone	%f6
	smul	%g5,	0x11AC,	%l4
	movge	%icc,	%i1,	%i6
	subcc	%o0,	0x11C1,	%g7
	fnegs	%f15,	%f3
	std	%f12,	[%l7 + 0x30]
	ldd	[%l7 + 0x08],	%o2
	sdiv	%g6,	0x170D,	%l2
	lduw	[%l7 + 0x7C],	%i5
	movgu	%xcc,	%l6,	%o2
	fornot2	%f4,	%f4,	%f14
	sth	%g3,	[%l7 + 0x76]
	fnegs	%f13,	%f1
	fmovdl	%xcc,	%f5,	%f5
	lduw	[%l7 + 0x1C],	%o6
	restore %l1, %o7, %i3
	movne	%icc,	%i2,	%l5
	fmul8x16	%f8,	%f10,	%f2
	ldsh	[%l7 + 0x66],	%g1
	andcc	%l0,	%i0,	%o4
	umul	%i7,	%o5,	%g2
	fmovsneg	%xcc,	%f12,	%f2
	fmovd	%f6,	%f12
	add	%l3,	%i4,	%o1
	xorcc	%g4,	%g5,	%i1
	stw	%i6,	[%l7 + 0x0C]
	udivcc	%o0,	0x086D,	%g7
	fpsub16	%f10,	%f10,	%f10
	stb	%l4,	[%l7 + 0x5A]
	fsrc1	%f4,	%f8
	subc	%o3,	0x1877,	%g6
	ldsh	[%l7 + 0x58],	%i5
	edge8ln	%l6,	%o2,	%l2
	movcs	%icc,	%g3,	%l1
	addc	%o6,	0x13C7,	%o7
	fmovsl	%xcc,	%f15,	%f15
	edge8l	%i2,	%l5,	%g1
	stx	%l0,	[%l7 + 0x60]
	fmovsne	%icc,	%f4,	%f13
	edge16n	%i0,	%i3,	%o4
	restore %i7, %o5, %g2
	save %l3, 0x00CA, %o1
	orncc	%g4,	%i4,	%g5
	movle	%xcc,	%i1,	%i6
	movrgez	%g7,	0x12A,	%l4
	fmovdle	%icc,	%f3,	%f4
	movge	%xcc,	%o0,	%o3
	smul	%g6,	0x1CA1,	%i5
	sth	%l6,	[%l7 + 0x68]
	andcc	%o2,	0x0936,	%g3
	fornot1	%f4,	%f10,	%f14
	movcs	%xcc,	%l2,	%o6
	save %o7, 0x01CD, %i2
	edge16n	%l1,	%g1,	%l5
	orcc	%l0,	%i3,	%o4
	andn	%i7,	%i0,	%g2
	or	%l3,	%o1,	%g4
	srl	%i4,	0x1F,	%o5
	movrlz	%g5,	0x307,	%i1
	stw	%g7,	[%l7 + 0x20]
	lduh	[%l7 + 0x0E],	%i6
	orncc	%o0,	%l4,	%o3
	add	%g6,	%i5,	%o2
	st	%f10,	[%l7 + 0x64]
	mulscc	%l6,	%l2,	%o6
	movrgez	%g3,	0x067,	%o7
	ld	[%l7 + 0x64],	%f4
	fcmpne16	%f8,	%f12,	%l1
	fpsub32	%f6,	%f2,	%f2
	alignaddr	%i2,	%l5,	%l0
	edge16	%i3,	%o4,	%i7
	move	%xcc,	%i0,	%g1
	ldx	[%l7 + 0x08],	%l3
	mova	%xcc,	%g2,	%o1
	ldd	[%l7 + 0x58],	%i4
	lduw	[%l7 + 0x4C],	%g4
	st	%f10,	[%l7 + 0x70]
	lduw	[%l7 + 0x48],	%o5
	ldsh	[%l7 + 0x2E],	%g5
	edge32l	%g7,	%i6,	%o0
	edge16ln	%i1,	%o3,	%l4
	fmovsl	%xcc,	%f12,	%f8
	array16	%i5,	%o2,	%g6
	edge8n	%l6,	%o6,	%l2
	ldd	[%l7 + 0x38],	%f0
	movneg	%xcc,	%g3,	%o7
	edge32l	%i2,	%l1,	%l0
	movvc	%icc,	%l5,	%o4
	fmovdge	%icc,	%f6,	%f2
	srax	%i7,	0x07,	%i0
	ldx	[%l7 + 0x78],	%i3
	fmovdvc	%xcc,	%f12,	%f7
	sllx	%g1,	0x0D,	%g2
	ldsb	[%l7 + 0x68],	%l3
	movcs	%icc,	%o1,	%g4
	edge32	%i4,	%g5,	%g7
	edge16ln	%i6,	%o0,	%i1
	fmovd	%f8,	%f2
	movcs	%xcc,	%o5,	%l4
	edge8n	%i5,	%o2,	%g6
	edge8ln	%o3,	%l6,	%o6
	orncc	%l2,	%g3,	%o7
	subc	%l1,	%i2,	%l5
	fmovsle	%icc,	%f6,	%f2
	sll	%o4,	0x12,	%i7
	movneg	%icc,	%i0,	%i3
	andncc	%l0,	%g1,	%l3
	movre	%o1,	%g4,	%g2
	movpos	%icc,	%g5,	%i4
	fmovda	%xcc,	%f12,	%f0
	subcc	%i6,	%o0,	%i1
	add	%g7,	0x0616,	%l4
	movge	%xcc,	%o5,	%i5
	edge32n	%o2,	%o3,	%l6
	sllx	%o6,	0x15,	%l2
	srax	%g6,	%o7,	%l1
	orncc	%i2,	%l5,	%o4
	movn	%xcc,	%i7,	%i0
	fpadd16s	%f11,	%f12,	%f12
	movcs	%xcc,	%i3,	%l0
	mova	%xcc,	%g3,	%g1
	movre	%o1,	0x00C,	%l3
	udiv	%g4,	0x1CE1,	%g2
	ldd	[%l7 + 0x70],	%f0
	ldd	[%l7 + 0x48],	%f2
	fcmpes	%fcc2,	%f14,	%f6
	edge8	%i4,	%i6,	%o0
	fcmple32	%f14,	%f14,	%i1
	xor	%g7,	0x0C67,	%g5
	umul	%l4,	0x0E6A,	%o5
	movle	%icc,	%o2,	%o3
	mulscc	%i5,	0x03C3,	%o6
	fmovrde	%l2,	%f0,	%f8
	udiv	%l6,	0x12BA,	%o7
	sth	%g6,	[%l7 + 0x10]
	array8	%l1,	%l5,	%o4
	xor	%i7,	%i0,	%i2
	fmovdne	%xcc,	%f15,	%f10
	xorcc	%l0,	0x12BA,	%g3
	ldsb	[%l7 + 0x24],	%g1
	fmovsle	%xcc,	%f8,	%f6
	fmuld8sux16	%f12,	%f14,	%f12
	fmovrsgez	%i3,	%f6,	%f3
	srlx	%o1,	%g4,	%g2
	edge32n	%i4,	%l3,	%i6
	edge32l	%o0,	%i1,	%g7
	fones	%f10
	orncc	%g5,	%l4,	%o2
	mova	%xcc,	%o5,	%i5
	addccc	%o3,	0x0EB6,	%o6
	fxnor	%f6,	%f6,	%f8
	fnegs	%f4,	%f5
	movrgez	%l6,	0x387,	%l2
	fmovspos	%xcc,	%f0,	%f3
	fmovdleu	%icc,	%f9,	%f10
	fpadd16	%f14,	%f14,	%f4
	orn	%o7,	0x017C,	%l1
	movrne	%g6,	0x2B1,	%l5
	orcc	%i7,	0x057D,	%o4
	edge16l	%i2,	%i0,	%g3
	xnor	%g1,	%i3,	%o1
	ldsh	[%l7 + 0x42],	%l0
	fmul8x16au	%f11,	%f2,	%f14
	alignaddrl	%g2,	%g4,	%l3
	edge16n	%i4,	%o0,	%i6
	movne	%xcc,	%i1,	%g7
	stb	%g5,	[%l7 + 0x70]
	fcmpne32	%f8,	%f0,	%l4
	movle	%icc,	%o5,	%o2
	edge8n	%o3,	%i5,	%o6
	movne	%icc,	%l2,	%l6
	edge16l	%l1,	%g6,	%o7
	fmovdl	%xcc,	%f11,	%f6
	ld	[%l7 + 0x28],	%f6
	mova	%xcc,	%i7,	%o4
	array32	%l5,	%i0,	%i2
	fmovdcs	%xcc,	%f1,	%f7
	fpsub16s	%f7,	%f6,	%f5
	stx	%g1,	[%l7 + 0x60]
	ldsh	[%l7 + 0x3C],	%i3
	orn	%o1,	0x0B45,	%l0
	xnor	%g2,	0x1C61,	%g4
	edge32ln	%g3,	%i4,	%l3
	movpos	%xcc,	%o0,	%i1
	sllx	%g7,	0x0F,	%i6
	edge32ln	%g5,	%l4,	%o5
	fmovrsgz	%o3,	%f12,	%f6
	addcc	%i5,	%o2,	%l2
	fmovsne	%icc,	%f15,	%f11
	orncc	%o6,	%l1,	%l6
	umulcc	%o7,	0x1E21,	%i7
	ldd	[%l7 + 0x50],	%f2
	ldsb	[%l7 + 0x0D],	%g6
	xor	%l5,	%i0,	%i2
	movn	%icc,	%g1,	%o4
	smulcc	%o1,	0x14A3,	%i3
	edge16l	%g2,	%l0,	%g4
	array8	%g3,	%l3,	%i4
	movpos	%icc,	%i1,	%g7
	mulscc	%o0,	0x1EA8,	%i6
	movrne	%g5,	%l4,	%o5
	mulx	%o3,	0x1A53,	%i5
	ld	[%l7 + 0x24],	%f5
	movrlz	%l2,	0x005,	%o2
	fone	%f0
	ldx	[%l7 + 0x08],	%o6
	fsrc1s	%f13,	%f5
	edge32l	%l6,	%o7,	%l1
	edge16n	%i7,	%g6,	%i0
	smul	%l5,	0x0B00,	%i2
	fpsub32s	%f4,	%f6,	%f0
	ldsw	[%l7 + 0x5C],	%o4
	fnor	%f4,	%f14,	%f4
	andn	%o1,	%g1,	%g2
	srax	%i3,	%g4,	%g3
	and	%l0,	%i4,	%i1
	save %g7, 0x17C6, %l3
	edge16	%o0,	%i6,	%l4
	sth	%g5,	[%l7 + 0x26]
	udivx	%o5,	0x0405,	%i5
	add	%l2,	%o2,	%o6
	sub	%o3,	0x00F3,	%o7
	ldd	[%l7 + 0x50],	%i6
	xor	%l1,	%i7,	%g6
	pdist	%f10,	%f4,	%f12
	movg	%icc,	%i0,	%l5
	sllx	%i2,	%o1,	%o4
	edge8	%g1,	%i3,	%g2
	st	%f0,	[%l7 + 0x40]
	sra	%g3,	%g4,	%l0
	xor	%i4,	%i1,	%g7
	fpadd32s	%f5,	%f12,	%f13
	fsrc1	%f6,	%f2
	subcc	%l3,	0x0A5B,	%o0
	alignaddr	%i6,	%g5,	%l4
	sth	%i5,	[%l7 + 0x3C]
	lduw	[%l7 + 0x70],	%o5
	movre	%o2,	%o6,	%o3
	sth	%o7,	[%l7 + 0x50]
	ldub	[%l7 + 0x40],	%l6
	std	%f6,	[%l7 + 0x48]
	popc	0x18A7,	%l1
	fxnors	%f15,	%f15,	%f12
	lduh	[%l7 + 0x12],	%i7
	movleu	%xcc,	%g6,	%i0
	stb	%l5,	[%l7 + 0x60]
	udiv	%i2,	0x0F86,	%l2
	fmul8ulx16	%f4,	%f4,	%f8
	std	%f10,	[%l7 + 0x60]
	movpos	%icc,	%o1,	%g1
	edge32n	%o4,	%g2,	%i3
	fornot2	%f8,	%f14,	%f4
	ldd	[%l7 + 0x18],	%f4
	fornot1	%f0,	%f4,	%f12
	movg	%xcc,	%g3,	%g4
	orcc	%l0,	%i4,	%g7
	addccc	%l3,	0x1C5B,	%i1
	alignaddr	%o0,	%g5,	%l4
	fmovdleu	%icc,	%f7,	%f12
	fmovdne	%xcc,	%f8,	%f1
	sra	%i6,	0x0F,	%o5
	sub	%i5,	0x0099,	%o6
	and	%o2,	0x10E8,	%o3
	array32	%o7,	%l1,	%i7
	edge8	%g6,	%l6,	%i0
	alignaddrl	%i2,	%l5,	%o1
	movvs	%xcc,	%l2,	%g1
	movcc	%xcc,	%g2,	%o4
	xnorcc	%i3,	0x1CA9,	%g3
	edge16	%g4,	%i4,	%g7
	edge16ln	%l3,	%l0,	%i1
	subcc	%g5,	%o0,	%l4
	stb	%o5,	[%l7 + 0x0F]
	fmovrse	%i5,	%f12,	%f9
	bshuffle	%f10,	%f10,	%f0
	fands	%f2,	%f14,	%f4
	edge32	%i6,	%o2,	%o3
	udivcc	%o6,	0x0150,	%o7
	orncc	%l1,	0x011E,	%g6
	stx	%i7,	[%l7 + 0x58]
	sdivcc	%i0,	0x055A,	%i2
	movg	%xcc,	%l6,	%o1
	sub	%l2,	0x1834,	%l5
	movrne	%g1,	%g2,	%o4
	restore %g3, 0x1F32, %g4
	edge32n	%i3,	%i4,	%g7
	st	%f11,	[%l7 + 0x48]
	st	%f8,	[%l7 + 0x48]
	movrlez	%l0,	%l3,	%i1
	udivcc	%g5,	0x08B0,	%o0
	for	%f2,	%f12,	%f0
	subcc	%o5,	%l4,	%i6
	orcc	%i5,	%o3,	%o6
	movcc	%icc,	%o7,	%l1
	orncc	%g6,	%i7,	%o2
	edge32n	%i2,	%i0,	%l6
	st	%f6,	[%l7 + 0x68]
	srlx	%l2,	0x17,	%l5
	orcc	%o1,	%g2,	%g1
	edge8l	%o4,	%g4,	%g3
	fmovdneg	%icc,	%f0,	%f10
	movg	%icc,	%i3,	%i4
	fmovscs	%icc,	%f8,	%f5
	fmovrdne	%l0,	%f10,	%f12
	fabss	%f6,	%f10
	edge8l	%g7,	%l3,	%g5
	ldub	[%l7 + 0x5D],	%o0
	movvs	%icc,	%i1,	%l4
	movg	%xcc,	%o5,	%i5
	movrlz	%o3,	0x0F8,	%i6
	sethi	0x1E52,	%o6
	edge8n	%o7,	%l1,	%g6
	xor	%i7,	%i2,	%i0
	movrlz	%l6,	0x2BA,	%o2
	ldub	[%l7 + 0x30],	%l2
	fmovsvc	%xcc,	%f7,	%f10
	ldx	[%l7 + 0x58],	%o1
	fmovsg	%xcc,	%f15,	%f0
	fmovdvs	%xcc,	%f14,	%f0
	popc	%l5,	%g2
	edge8l	%g1,	%g4,	%g3
	movpos	%icc,	%i3,	%i4
	sdivx	%o4,	0x18F6,	%g7
	movcc	%icc,	%l3,	%g5
	siam	0x4
	orn	%o0,	0x077E,	%i1
	udiv	%l0,	0x1E52,	%o5
	stb	%l4,	[%l7 + 0x59]
	movrlez	%i5,	%i6,	%o3
	or	%o7,	0x0040,	%o6
	movpos	%icc,	%g6,	%i7
	stw	%i2,	[%l7 + 0x1C]
	movne	%xcc,	%i0,	%l1
	fmovdneg	%xcc,	%f14,	%f12
	fmovsge	%icc,	%f8,	%f0
	popc	%o2,	%l2
	srax	%o1,	%l5,	%g2
	array16	%l6,	%g1,	%g4
	fmovdg	%icc,	%f2,	%f10
	fmovrsgz	%g3,	%f15,	%f7
	fmul8x16au	%f14,	%f14,	%f10
	faligndata	%f4,	%f0,	%f4
	srlx	%i3,	0x17,	%i4
	edge8	%g7,	%l3,	%o4
	movre	%o0,	0x290,	%g5
	fxnor	%f12,	%f14,	%f12
	fornot1	%f4,	%f2,	%f14
	fmovdgu	%xcc,	%f5,	%f12
	smulcc	%i1,	%l0,	%l4
	lduh	[%l7 + 0x44],	%i5
	sth	%o5,	[%l7 + 0x68]
	orncc	%i6,	%o3,	%o7
	xor	%g6,	%o6,	%i2
	fmovdne	%xcc,	%f13,	%f9
	xnorcc	%i0,	%l1,	%o2
	mova	%icc,	%i7,	%l2
	stw	%l5,	[%l7 + 0x30]
	fmul8x16	%f5,	%f2,	%f6
	orn	%o1,	%l6,	%g2
	sth	%g1,	[%l7 + 0x4C]
	fpack32	%f2,	%f0,	%f10
	movle	%icc,	%g3,	%g4
	fcmpne16	%f4,	%f10,	%i4
	orcc	%g7,	%l3,	%i3
	fmovdgu	%xcc,	%f8,	%f8
	fand	%f8,	%f6,	%f6
	movpos	%xcc,	%o0,	%g5
	movn	%icc,	%i1,	%l0
	std	%f6,	[%l7 + 0x20]
	smul	%l4,	0x004E,	%o4
	sub	%i5,	%o5,	%i6
	fmovrde	%o3,	%f4,	%f4
	xnorcc	%o7,	%g6,	%i2
	xorcc	%o6,	%i0,	%o2
	stw	%i7,	[%l7 + 0x3C]
	srl	%l2,	0x00,	%l1
	array32	%o1,	%l5,	%g2
	array32	%g1,	%g3,	%l6
	subc	%g4,	%i4,	%l3
	ldsb	[%l7 + 0x0F],	%i3
	fcmpd	%fcc1,	%f14,	%f14
	edge8l	%o0,	%g7,	%g5
	edge32l	%i1,	%l0,	%l4
	fpadd16	%f8,	%f4,	%f6
	edge16l	%i5,	%o5,	%o4
	sra	%i6,	%o3,	%o7
	edge32ln	%i2,	%g6,	%o6
	xor	%i0,	0x0C89,	%i7
	srax	%l2,	0x00,	%o2
	stb	%l1,	[%l7 + 0x42]
	movn	%icc,	%l5,	%g2
	mulscc	%o1,	%g3,	%l6
	fpack32	%f0,	%f8,	%f8
	movleu	%icc,	%g4,	%i4
	array32	%g1,	%i3,	%o0
	fmovde	%xcc,	%f2,	%f14
	subc	%l3,	0x1174,	%g5
	fmovdvs	%xcc,	%f4,	%f1
	movre	%g7,	0x12A,	%l0
	edge32ln	%l4,	%i5,	%i1
	edge32	%o4,	%i6,	%o3
	subccc	%o7,	0x039F,	%o5
	fandnot2	%f4,	%f0,	%f8
	movgu	%xcc,	%i2,	%o6
	edge16l	%i0,	%g6,	%l2
	subcc	%i7,	0x0102,	%o2
	xnor	%l1,	0x1740,	%l5
	movrlez	%o1,	%g2,	%g3
	edge32	%l6,	%g4,	%g1
	or	%i3,	%i4,	%l3
	ld	[%l7 + 0x50],	%f2
	umul	%o0,	%g5,	%g7
	fmovsneg	%xcc,	%f5,	%f1
	sdiv	%l0,	0x047C,	%l4
	udiv	%i1,	0x0FAD,	%o4
	srlx	%i6,	0x16,	%o3
	fnands	%f3,	%f15,	%f12
	sdiv	%o7,	0x1C40,	%o5
	xnor	%i2,	%i5,	%i0
	ldd	[%l7 + 0x38],	%g6
	fandnot2s	%f5,	%f12,	%f9
	xnor	%l2,	%i7,	%o6
	movneg	%icc,	%l1,	%o2
	fmul8ulx16	%f2,	%f4,	%f4
	smul	%o1,	0x0418,	%g2
	sethi	0x1ECA,	%l5
	fmuld8sux16	%f4,	%f9,	%f14
	movg	%xcc,	%g3,	%g4
	sllx	%g1,	0x16,	%i3
	fmul8sux16	%f8,	%f2,	%f12
	udivcc	%l6,	0x1860,	%i4
	fexpand	%f9,	%f2
	ldsb	[%l7 + 0x2D],	%o0
	move	%icc,	%l3,	%g7
	movneg	%icc,	%l0,	%g5
	move	%icc,	%i1,	%o4
	fmovdle	%icc,	%f8,	%f4
	edge16n	%i6,	%l4,	%o7
	andn	%o3,	0x0F5E,	%i2
	fmovda	%icc,	%f10,	%f12
	umul	%i5,	0x193C,	%o5
	sll	%i0,	%g6,	%l2
	fmovdn	%icc,	%f12,	%f10
	movleu	%xcc,	%o6,	%i7
	edge8	%l1,	%o2,	%g2
	save %l5, %g3, %g4
	subc	%g1,	%o1,	%l6
	ldsb	[%l7 + 0x47],	%i3
	fpsub32	%f2,	%f12,	%f6
	movg	%icc,	%i4,	%o0
	udivcc	%g7,	0x0D33,	%l0
	or	%l3,	0x1B94,	%i1
	movcc	%xcc,	%o4,	%i6
	add	%l4,	%g5,	%o7
	sdivx	%i2,	0x0862,	%o3
	ld	[%l7 + 0x48],	%f3
	udivcc	%o5,	0x0CF5,	%i0
	xnor	%i5,	%l2,	%g6
	movrgez	%i7,	%o6,	%o2
	stx	%g2,	[%l7 + 0x78]
	movle	%xcc,	%l5,	%l1
	move	%xcc,	%g3,	%g1
	fornot1s	%f5,	%f13,	%f14
	ld	[%l7 + 0x4C],	%f2
	fabsd	%f2,	%f0
	xor	%g4,	0x141D,	%o1
	move	%xcc,	%i3,	%i4
	st	%f10,	[%l7 + 0x18]
	mova	%icc,	%o0,	%g7
	fmovdgu	%xcc,	%f8,	%f4
	addccc	%l0,	%l3,	%i1
	umul	%o4,	0x1884,	%l6
	move	%xcc,	%l4,	%i6
	sub	%o7,	%g5,	%i2
	for	%f10,	%f2,	%f2
	movgu	%icc,	%o5,	%i0
	stb	%i5,	[%l7 + 0x47]
	sllx	%l2,	%o3,	%g6
	movre	%o6,	%o2,	%i7
	udiv	%l5,	0x0B70,	%l1
	movneg	%xcc,	%g2,	%g3
	smul	%g4,	0x1109,	%o1
	xnorcc	%g1,	%i4,	%i3
	mulscc	%g7,	%o0,	%l0
	sll	%i1,	%o4,	%l3
	movcc	%xcc,	%l6,	%i6
	udivcc	%l4,	0x1527,	%g5
	fpsub16s	%f7,	%f13,	%f11
	std	%f2,	[%l7 + 0x08]
	edge16n	%o7,	%o5,	%i0
	movleu	%xcc,	%i2,	%i5
	stx	%o3,	[%l7 + 0x60]
	ldd	[%l7 + 0x28],	%f4
	fnors	%f12,	%f8,	%f6
	movrne	%g6,	%l2,	%o6
	andncc	%o2,	%l5,	%l1
	fmul8sux16	%f6,	%f12,	%f8
	faligndata	%f8,	%f12,	%f6
	fmovrse	%i7,	%f10,	%f11
	movrne	%g2,	%g4,	%o1
	lduw	[%l7 + 0x6C],	%g1
	xorcc	%g3,	%i4,	%i3
	mulscc	%o0,	0x1B5C,	%l0
	mova	%xcc,	%i1,	%o4
	smul	%l3,	0x112F,	%g7
	srl	%i6,	%l6,	%g5
	stb	%l4,	[%l7 + 0x45]
	fpackfix	%f2,	%f7
	orn	%o5,	0x09DF,	%i0
	udivcc	%o7,	0x1DF9,	%i2
	array16	%o3,	%i5,	%l2
	andncc	%g6,	%o2,	%l5
	andn	%o6,	%i7,	%g2
	edge16n	%l1,	%g4,	%g1
	fmovscs	%xcc,	%f4,	%f12
	udivx	%o1,	0x0610,	%g3
	edge16l	%i4,	%i3,	%o0
	udivx	%i1,	0x0CAA,	%o4
	edge32n	%l0,	%l3,	%g7
	add	%i6,	%g5,	%l4
	fmovspos	%xcc,	%f5,	%f3
	udiv	%o5,	0x10B0,	%l6
	fmovsne	%icc,	%f9,	%f1
	move	%icc,	%o7,	%i0
	subc	%o3,	%i5,	%i2
	fmovrse	%g6,	%f1,	%f12
	fandnot2	%f4,	%f12,	%f8
	addccc	%o2,	%l5,	%o6
	umulcc	%l2,	%g2,	%i7
	movvs	%icc,	%l1,	%g1
	andcc	%g4,	%g3,	%o1
	fexpand	%f2,	%f4
	edge8l	%i4,	%i3,	%o0
	fornot1	%f8,	%f4,	%f14
	umul	%i1,	%l0,	%o4
	movg	%icc,	%l3,	%g7
	movge	%icc,	%i6,	%l4
	movle	%icc,	%g5,	%o5
	edge16l	%o7,	%i0,	%o3
	ldd	[%l7 + 0x50],	%i4
	fmovdne	%xcc,	%f11,	%f2
	subccc	%i2,	%l6,	%g6
	fpadd16s	%f9,	%f13,	%f4
	sll	%l5,	0x10,	%o6
	srl	%o2,	%g2,	%l2
	fmul8ulx16	%f2,	%f10,	%f2
	umulcc	%l1,	%g1,	%i7
	fnors	%f12,	%f11,	%f12
	fmovsvs	%icc,	%f3,	%f14
	std	%f2,	[%l7 + 0x58]
	edge16n	%g4,	%o1,	%i4
	movl	%icc,	%i3,	%g3
	mova	%xcc,	%o0,	%l0
	mulx	%o4,	0x06CF,	%l3
	movle	%icc,	%g7,	%i6
	sdivcc	%i1,	0x0EC9,	%l4
	movne	%icc,	%g5,	%o7
	fmovsg	%icc,	%f11,	%f14
	alignaddr	%o5,	%o3,	%i0
	fmovsgu	%xcc,	%f12,	%f15
	movrlez	%i5,	0x035,	%i2
	movl	%icc,	%l6,	%l5
	edge8l	%o6,	%o2,	%g6
	movg	%icc,	%g2,	%l2
	fmuld8sux16	%f7,	%f13,	%f8
	edge8	%l1,	%g1,	%i7
	fmovrsgez	%g4,	%f4,	%f3
	fmovrslez	%o1,	%f14,	%f12
	edge16l	%i4,	%g3,	%o0
	add	%i3,	%o4,	%l3
	movrlez	%g7,	%l0,	%i6
	movrlez	%l4,	0x152,	%g5
	movgu	%icc,	%i1,	%o5
	movrne	%o3,	0x160,	%o7
	mulscc	%i0,	%i5,	%l6
	ldub	[%l7 + 0x77],	%l5
	restore %o6, %i2, %o2
	srl	%g6,	0x17,	%l2
	stb	%l1,	[%l7 + 0x5D]
	fpadd32	%f2,	%f4,	%f8
	fmul8x16au	%f2,	%f7,	%f10
	edge8n	%g1,	%g2,	%g4
	save %i7, 0x17BE, %o1
	ldub	[%l7 + 0x17],	%g3
	array16	%o0,	%i4,	%i3
	fmovrse	%l3,	%f9,	%f10
	edge16	%g7,	%o4,	%l0
	fmovdn	%icc,	%f9,	%f9
	andcc	%i6,	%g5,	%i1
	fmovscc	%xcc,	%f2,	%f4
	movvc	%xcc,	%l4,	%o5
	srl	%o7,	%i0,	%i5
	movgu	%icc,	%l6,	%l5
	restore %o3, 0x1793, %o6
	array16	%o2,	%g6,	%l2
	fcmpne32	%f6,	%f14,	%l1
	fandnot1	%f4,	%f0,	%f0
	array16	%i2,	%g2,	%g1
	stb	%i7,	[%l7 + 0x4D]
	movgu	%icc,	%o1,	%g3
	move	%xcc,	%o0,	%i4
	sth	%g4,	[%l7 + 0x3E]
	addccc	%l3,	%g7,	%i3
	movleu	%xcc,	%o4,	%i6
	fones	%f11
	movge	%icc,	%l0,	%g5
	fsrc1s	%f5,	%f12
	smulcc	%l4,	0x03B8,	%i1
	sllx	%o5,	0x17,	%i0
	fpadd16	%f6,	%f14,	%f0
	andncc	%o7,	%l6,	%l5
	fmuld8ulx16	%f6,	%f2,	%f8
	sethi	0x13D6,	%o3
	stw	%o6,	[%l7 + 0x7C]
	ldd	[%l7 + 0x28],	%o2
	fmovde	%xcc,	%f11,	%f1
	ldub	[%l7 + 0x08],	%g6
	fmul8sux16	%f2,	%f2,	%f4
	ldd	[%l7 + 0x10],	%l2
	udivcc	%i5,	0x0A94,	%l1
	smulcc	%i2,	%g1,	%i7
	mova	%icc,	%g2,	%o1
	fmovspos	%icc,	%f2,	%f4
	edge8ln	%o0,	%g3,	%i4
	movrgz	%g4,	%g7,	%i3
	fmovdg	%xcc,	%f5,	%f7
	movre	%o4,	%l3,	%i6
	srax	%g5,	0x08,	%l0
	udivcc	%l4,	0x0CD7,	%i1
	edge8	%o5,	%i0,	%l6
	st	%f12,	[%l7 + 0x50]
	stb	%l5,	[%l7 + 0x69]
	addc	%o7,	%o3,	%o2
	movre	%o6,	0x043,	%g6
	ldd	[%l7 + 0x28],	%f4
	fmovsvs	%xcc,	%f8,	%f10
	fpadd16s	%f15,	%f5,	%f1
	edge32	%i5,	%l2,	%i2
	addcc	%l1,	%i7,	%g2
	orn	%o1,	0x1A98,	%o0
	andncc	%g3,	%i4,	%g1
	edge32ln	%g4,	%g7,	%i3
	movne	%icc,	%l3,	%i6
	edge16l	%g5,	%o4,	%l0
	movgu	%icc,	%l4,	%o5
	sub	%i1,	0x1FA5,	%l6
	edge16n	%l5,	%o7,	%i0
	fxnor	%f2,	%f8,	%f4
	stb	%o2,	[%l7 + 0x7F]
	popc	0x0F3F,	%o6
	movvc	%xcc,	%g6,	%i5
	addcc	%o3,	0x144A,	%l2
	edge32n	%i2,	%l1,	%i7
	ldsw	[%l7 + 0x78],	%o1
	fxors	%f1,	%f15,	%f9
	edge32ln	%o0,	%g3,	%i4
	movre	%g1,	0x3A6,	%g2
	fmovdvc	%icc,	%f9,	%f4
	srax	%g4,	%i3,	%l3
	stw	%g7,	[%l7 + 0x68]
	andn	%i6,	%g5,	%l0
	udivx	%l4,	0x1DEA,	%o4
	movleu	%xcc,	%i1,	%l6
	fmovsneg	%icc,	%f9,	%f13
	srl	%o5,	%o7,	%l5
	mulscc	%o2,	%i0,	%o6
	fexpand	%f9,	%f4
	ldsb	[%l7 + 0x14],	%i5
	lduh	[%l7 + 0x56],	%g6
	fmovdg	%icc,	%f5,	%f14
	edge32l	%o3,	%i2,	%l2
	stb	%i7,	[%l7 + 0x4B]
	sub	%l1,	%o1,	%o0
	move	%xcc,	%i4,	%g3
	lduh	[%l7 + 0x44],	%g1
	fpack16	%f12,	%f4
	movleu	%xcc,	%g2,	%g4
	fexpand	%f0,	%f0
	movl	%xcc,	%l3,	%i3
	add	%g7,	0x0445,	%i6
	udiv	%l0,	0x1509,	%g5
	fmovrdgz	%o4,	%f2,	%f6
	fcmpeq16	%f4,	%f10,	%i1
	sra	%l4,	%l6,	%o7
	array32	%l5,	%o5,	%o2
	fmovrdne	%o6,	%f14,	%f2
	fcmple16	%f14,	%f12,	%i0
	orn	%i5,	0x039B,	%o3
	edge32l	%g6,	%i2,	%i7
	move	%xcc,	%l1,	%o1
	movl	%icc,	%o0,	%l2
	smulcc	%i4,	%g1,	%g3
	stx	%g2,	[%l7 + 0x28]
	fand	%f0,	%f10,	%f2
	std	%f6,	[%l7 + 0x18]
	fnegd	%f0,	%f12
	fpadd16s	%f12,	%f9,	%f11
	fmovrsgz	%l3,	%f11,	%f7
	fzero	%f14
	subc	%i3,	%g7,	%g4
	fmul8x16al	%f12,	%f1,	%f14
	movge	%xcc,	%i6,	%l0
	fnot1s	%f9,	%f13
	xor	%g5,	0x1842,	%o4
	addc	%i1,	%l6,	%o7
	sth	%l4,	[%l7 + 0x68]
	fmovdle	%icc,	%f11,	%f11
	subcc	%o5,	0x043D,	%o2
	ldsw	[%l7 + 0x4C],	%o6
	sll	%l5,	0x16,	%i5
	alignaddr	%o3,	%i0,	%i2
	sll	%i7,	0x15,	%g6
	lduh	[%l7 + 0x1A],	%o1
	or	%o0,	0x0429,	%l2
	xor	%i4,	%l1,	%g1
	ldd	[%l7 + 0x58],	%g2
	orcc	%g2,	0x0982,	%i3
	fsrc2s	%f0,	%f6
	edge8ln	%l3,	%g4,	%i6
	movrlez	%g7,	0x08E,	%l0
	edge32l	%o4,	%i1,	%g5
	fmovda	%icc,	%f14,	%f11
	alignaddr	%o7,	%l6,	%l4
	array16	%o5,	%o6,	%l5
	fmovsleu	%icc,	%f0,	%f6
	movrlz	%i5,	0x182,	%o2
	fpadd32	%f2,	%f6,	%f8
	fsrc2s	%f1,	%f0
	fmovrslez	%o3,	%f4,	%f1
	restore %i0, 0x13C4, %i7
	movcs	%icc,	%g6,	%i2
	sdivcc	%o1,	0x1008,	%l2
	subcc	%i4,	0x150F,	%o0
	movrgz	%l1,	%g1,	%g2
	popc	%g3,	%i3
	umul	%g4,	0x0B8C,	%i6
	array32	%g7,	%l3,	%o4
	andcc	%i1,	%l0,	%o7
	ldub	[%l7 + 0x5C],	%l6
	stx	%g5,	[%l7 + 0x60]
	movpos	%icc,	%l4,	%o5
	edge32n	%o6,	%i5,	%o2
	and	%o3,	0x1800,	%i0
	srlx	%l5,	%g6,	%i2
	fmovdpos	%icc,	%f5,	%f12
	sdivx	%i7,	0x1E4C,	%l2
	xor	%i4,	0x0B4E,	%o1
	ldsb	[%l7 + 0x7D],	%o0
	ldub	[%l7 + 0x78],	%l1
	movrgz	%g1,	0x0B5,	%g2
	array32	%i3,	%g4,	%g3
	movle	%xcc,	%g7,	%i6
	lduw	[%l7 + 0x1C],	%l3
	lduw	[%l7 + 0x34],	%i1
	alignaddrl	%l0,	%o4,	%l6
	fnot1	%f4,	%f6
	mova	%xcc,	%o7,	%l4
	fcmpgt32	%f10,	%f2,	%g5
	fnot2	%f4,	%f2
	addccc	%o5,	%i5,	%o2
	mulscc	%o3,	%o6,	%i0
	or	%l5,	0x12A5,	%g6
	edge8n	%i2,	%i7,	%i4
	fpsub16	%f2,	%f14,	%f4
	ldsw	[%l7 + 0x3C],	%o1
	srlx	%l2,	0x19,	%l1
	srl	%o0,	%g2,	%i3
	movne	%icc,	%g1,	%g3
	ldsw	[%l7 + 0x14],	%g4
	sra	%g7,	%l3,	%i1
	movgu	%xcc,	%i6,	%l0
	stw	%l6,	[%l7 + 0x4C]
	srlx	%o7,	%l4,	%o4
	mulx	%g5,	%o5,	%o2
	fmovsa	%icc,	%f5,	%f13
	movg	%icc,	%i5,	%o3
	fmovdleu	%xcc,	%f1,	%f5
	edge8l	%o6,	%l5,	%i0
	std	%f10,	[%l7 + 0x40]
	smulcc	%g6,	0x17EA,	%i2
	subc	%i7,	0x0B4F,	%i4
	xnor	%o1,	0x0C8D,	%l2
	fzero	%f8
	ldd	[%l7 + 0x20],	%f10
	mulx	%l1,	0x0438,	%g2
	andncc	%o0,	%i3,	%g1
	movrne	%g4,	%g3,	%g7
	ldsh	[%l7 + 0x64],	%i1
	fornot2	%f6,	%f4,	%f2
	mova	%icc,	%l3,	%l0
	movl	%icc,	%l6,	%o7
	stb	%i6,	[%l7 + 0x30]
	movcs	%xcc,	%o4,	%g5
	ld	[%l7 + 0x18],	%f11
	sllx	%o5,	%l4,	%o2
	fmovsneg	%icc,	%f13,	%f14
	fornot2s	%f10,	%f11,	%f8
	array16	%o3,	%i5,	%o6
	move	%xcc,	%i0,	%l5
	stx	%i2,	[%l7 + 0x40]
	fmovsne	%xcc,	%f5,	%f9
	orncc	%g6,	0x1885,	%i4
	srl	%i7,	0x0E,	%l2
	udivcc	%o1,	0x029B,	%l1
	srl	%o0,	0x07,	%i3
	movcc	%xcc,	%g2,	%g1
	movvc	%icc,	%g3,	%g4
	edge8n	%i1,	%g7,	%l3
	fmovdne	%xcc,	%f14,	%f3
	fmul8x16al	%f3,	%f12,	%f2
	udivcc	%l6,	0x14EE,	%l0
	andn	%i6,	%o7,	%g5
	ld	[%l7 + 0x0C],	%f9
	edge16l	%o5,	%o4,	%l4
	edge32	%o2,	%o3,	%i5
	xor	%o6,	%l5,	%i0
	edge16ln	%i2,	%i4,	%g6
	fornot1	%f2,	%f10,	%f14
	array32	%i7,	%l2,	%o1
	siam	0x2
	orncc	%l1,	0x167A,	%i3
	orncc	%g2,	0x04FB,	%g1
	udiv	%o0,	0x01D6,	%g4
	addc	%g3,	0x1F31,	%g7
	movrlez	%l3,	0x25B,	%i1
	sth	%l0,	[%l7 + 0x38]
	ldsh	[%l7 + 0x54],	%l6
	fxnors	%f14,	%f8,	%f7
	fnor	%f4,	%f12,	%f2
	fmuld8ulx16	%f9,	%f11,	%f14
	sub	%o7,	%i6,	%g5
	xnor	%o4,	%l4,	%o2
	movrgez	%o5,	%i5,	%o6
	movgu	%icc,	%l5,	%o3
	edge8l	%i2,	%i0,	%i4
	edge8n	%i7,	%g6,	%o1
	sdivcc	%l1,	0x1462,	%i3
	movrne	%g2,	%l2,	%g1
	fmovd	%f2,	%f6
	array8	%o0,	%g3,	%g7
	edge32n	%l3,	%g4,	%i1
	edge8l	%l6,	%l0,	%i6
	fandnot1	%f2,	%f0,	%f6
	sub	%o7,	0x1D99,	%g5
	ld	[%l7 + 0x74],	%f10
	fmovdne	%xcc,	%f3,	%f0
	fcmpeq16	%f12,	%f2,	%o4
	mova	%xcc,	%l4,	%o5
	xnorcc	%i5,	%o6,	%o2
	mulscc	%l5,	%o3,	%i0
	xnorcc	%i4,	0x1FAD,	%i7
	srlx	%i2,	%o1,	%l1
	mova	%icc,	%g6,	%i3
	lduh	[%l7 + 0x56],	%l2
	fcmps	%fcc3,	%f14,	%f10
	srlx	%g2,	%o0,	%g1
	fexpand	%f10,	%f2
	orncc	%g7,	%g3,	%g4
	edge8l	%l3,	%i1,	%l6
	edge16l	%l0,	%o7,	%g5
	orn	%i6,	0x1827,	%o4
	movvs	%icc,	%l4,	%i5
	lduw	[%l7 + 0x0C],	%o6
	save %o2, %l5, %o3
	fzeros	%f7
	udivcc	%i0,	0x0AD6,	%o5
	umul	%i7,	%i4,	%o1
	fnands	%f15,	%f0,	%f6
	movleu	%icc,	%i2,	%g6
	edge32l	%l1,	%l2,	%g2
	movl	%icc,	%i3,	%o0
	movle	%xcc,	%g7,	%g3
	smul	%g1,	%g4,	%l3
	fpadd16s	%f9,	%f7,	%f0
	sdivx	%l6,	0x0EC2,	%i1
	edge32n	%o7,	%g5,	%i6
	add	%o4,	0x110A,	%l0
	array8	%i5,	%l4,	%o6
	fnot1	%f2,	%f12
	st	%f13,	[%l7 + 0x50]
	ldub	[%l7 + 0x37],	%l5
	sdivx	%o2,	0x135A,	%o3
	xor	%o5,	0x1E43,	%i7
	sethi	0x0049,	%i0
	mova	%icc,	%o1,	%i4
	ldd	[%l7 + 0x70],	%i2
	mulscc	%l1,	%g6,	%l2
	fpadd32	%f12,	%f8,	%f8
	fmuld8sux16	%f9,	%f4,	%f2
	sll	%i3,	%g2,	%g7
	xorcc	%g3,	0x02CB,	%o0
	edge16l	%g1,	%g4,	%l3
	ldub	[%l7 + 0x2F],	%l6
	array16	%i1,	%g5,	%o7
	ldx	[%l7 + 0x10],	%o4
	srlx	%l0,	0x1D,	%i5
	edge32ln	%i6,	%l4,	%l5
	xnorcc	%o6,	%o3,	%o5
	movrgez	%o2,	%i7,	%o1
	fmovda	%icc,	%f7,	%f15
	array8	%i4,	%i0,	%i2
	fmovsleu	%icc,	%f6,	%f14
	movrne	%l1,	%g6,	%i3
	ldd	[%l7 + 0x58],	%f10
	ldd	[%l7 + 0x28],	%l2
	fxnors	%f10,	%f14,	%f9
	xnor	%g7,	%g2,	%g3
	orn	%o0,	%g4,	%l3
	sdivcc	%g1,	0x04FF,	%i1
	srax	%l6,	%o7,	%o4
	movcs	%icc,	%l0,	%i5
	fmovspos	%icc,	%f2,	%f1
	smul	%i6,	0x1C1F,	%l4
	edge16ln	%l5,	%g5,	%o3
	restore %o5, %o2, %o6
	stw	%o1,	[%l7 + 0x0C]
	movrgz	%i7,	%i4,	%i0
	udivx	%l1,	0x09C1,	%i2
	sdivx	%i3,	0x0EF5,	%l2
	and	%g6,	%g2,	%g7
	movne	%icc,	%o0,	%g3
	stb	%l3,	[%l7 + 0x78]
	movrne	%g1,	%i1,	%g4
	movvc	%icc,	%o7,	%o4
	edge8n	%l0,	%l6,	%i5
	stw	%i6,	[%l7 + 0x60]
	sllx	%l5,	%g5,	%o3
	array32	%l4,	%o2,	%o6
	smulcc	%o1,	0x028A,	%o5
	ldsw	[%l7 + 0x68],	%i7
	sdivcc	%i4,	0x1409,	%l1
	popc	0x058C,	%i0
	smul	%i2,	0x1756,	%i3
	srax	%g6,	%l2,	%g2
	fnot2s	%f1,	%f12
	st	%f12,	[%l7 + 0x74]
	move	%xcc,	%o0,	%g7
	andn	%l3,	0x1DD5,	%g3
	edge8	%i1,	%g1,	%o7
	umulcc	%o4,	0x0ECE,	%l0
	andcc	%g4,	%i5,	%l6
	sdiv	%i6,	0x160B,	%l5
	edge32l	%o3,	%l4,	%g5
	fmovda	%xcc,	%f2,	%f3
	smul	%o2,	%o6,	%o1
	udiv	%o5,	0x113C,	%i4
	edge8l	%l1,	%i0,	%i2
	fcmped	%fcc0,	%f6,	%f4
	add	%i7,	%g6,	%i3
	edge8	%l2,	%o0,	%g2
	fcmple16	%f8,	%f2,	%l3
	fpsub32	%f0,	%f8,	%f10
	ldd	[%l7 + 0x58],	%f14
	movcs	%icc,	%g3,	%g7
	addccc	%i1,	%o7,	%o4
	fmovrdgz	%g1,	%f10,	%f2
	movrgez	%g4,	0x320,	%l0
	movrlez	%i5,	%l6,	%l5
	array32	%o3,	%i6,	%g5
	xor	%l4,	%o2,	%o1
	move	%icc,	%o6,	%o5
	add	%l1,	0x10A8,	%i4
	movcs	%xcc,	%i2,	%i0
	ldd	[%l7 + 0x70],	%f12
	subcc	%g6,	0x0BAC,	%i7
	add	%i3,	0x05ED,	%o0
	fnot2	%f4,	%f12
	alignaddr	%l2,	%l3,	%g2
	save %g7, 0x02C3, %i1
	fabsd	%f4,	%f0
	ldsb	[%l7 + 0x7D],	%g3
	orcc	%o4,	%o7,	%g1
	save %l0, %g4, %l6
	fmovscc	%xcc,	%f7,	%f9
	ldsw	[%l7 + 0x14],	%i5
	fpackfix	%f12,	%f15
	fmovsne	%xcc,	%f10,	%f12
	fmovsa	%icc,	%f8,	%f10
	subc	%l5,	%o3,	%i6
	smulcc	%g5,	0x1D8D,	%l4
	ldub	[%l7 + 0x45],	%o2
	fmovrdlz	%o6,	%f0,	%f10
	or	%o1,	0x0EB6,	%l1
	edge8ln	%i4,	%i2,	%i0
	edge8ln	%g6,	%o5,	%i3
	movleu	%xcc,	%i7,	%o0
	siam	0x0
	fmovdl	%icc,	%f9,	%f5
	movvs	%icc,	%l2,	%g2
	fmovdleu	%xcc,	%f14,	%f0
	ldsb	[%l7 + 0x7C],	%g7
	fpack16	%f4,	%f2
	fmovs	%f5,	%f3
	edge32ln	%l3,	%g3,	%o4
	and	%o7,	0x0F2A,	%g1
	fmovdl	%xcc,	%f11,	%f1
	fcmpeq16	%f14,	%f8,	%l0
	lduw	[%l7 + 0x74],	%i1
	edge16ln	%g4,	%i5,	%l5
	fmovspos	%xcc,	%f3,	%f6
	movne	%xcc,	%o3,	%l6
	popc	0x1023,	%g5
	fpack32	%f6,	%f6,	%f14
	ldd	[%l7 + 0x60],	%l4
	sth	%o2,	[%l7 + 0x32]
	fnot1	%f6,	%f12
	fsrc2s	%f0,	%f15
	popc	%o6,	%o1
	edge32n	%i6,	%i4,	%i2
	or	%l1,	%i0,	%g6
	sdivcc	%i3,	0x1DDB,	%i7
	stw	%o5,	[%l7 + 0x1C]
	std	%f8,	[%l7 + 0x78]
	edge16	%l2,	%g2,	%g7
	movleu	%icc,	%l3,	%g3
	fmovse	%icc,	%f12,	%f14
	stb	%o4,	[%l7 + 0x35]
	orn	%o0,	%o7,	%l0
	fmovrsgez	%g1,	%f2,	%f8
	fcmps	%fcc3,	%f5,	%f2
	edge8	%g4,	%i5,	%i1
	alignaddr	%l5,	%l6,	%g5
	fxor	%f4,	%f4,	%f2
	popc	%l4,	%o3
	std	%f4,	[%l7 + 0x68]
	lduh	[%l7 + 0x0E],	%o6
	smulcc	%o1,	0x1BC0,	%i6
	add	%o2,	0x1949,	%i4
	stb	%i2,	[%l7 + 0x32]
	fmovs	%f2,	%f8
	andncc	%l1,	%i0,	%g6
	add	%i7,	0x099A,	%o5
	umul	%i3,	%g2,	%g7
	fmovdvs	%xcc,	%f8,	%f0
	fmovsa	%xcc,	%f4,	%f6
	mulx	%l2,	0x0CB3,	%g3
	addc	%o4,	%o0,	%o7
	edge32n	%l0,	%l3,	%g4
	movre	%g1,	0x32F,	%i1
	fmovse	%xcc,	%f14,	%f2
	orcc	%l5,	%l6,	%g5
	fmovsge	%xcc,	%f5,	%f2
	movrlz	%l4,	0x01B,	%i5
	ldx	[%l7 + 0x08],	%o3
	edge32	%o6,	%o1,	%i6
	sethi	0x1D63,	%o2
	movrlez	%i4,	%i2,	%l1
	fmul8x16au	%f4,	%f14,	%f0
	andn	%g6,	0x032B,	%i7
	ld	[%l7 + 0x70],	%f9
	subcc	%i0,	%i3,	%o5
	or	%g2,	%l2,	%g3
	lduw	[%l7 + 0x14],	%g7
	move	%icc,	%o0,	%o4
	edge16	%o7,	%l3,	%l0
	fcmpeq32	%f14,	%f12,	%g1
	fmovspos	%xcc,	%f3,	%f7
	movrlz	%g4,	0x2C6,	%l5
	std	%f8,	[%l7 + 0x20]
	sub	%i1,	0x1549,	%l6
	or	%g5,	%i5,	%o3
	movl	%xcc,	%l4,	%o1
	smulcc	%o6,	%i6,	%o2
	sth	%i2,	[%l7 + 0x58]
	alignaddrl	%l1,	%i4,	%i7
	edge16l	%g6,	%i0,	%o5
	sub	%i3,	%g2,	%g3
	edge16n	%g7,	%l2,	%o0
	edge8n	%o7,	%l3,	%o4
	ldd	[%l7 + 0x38],	%g0
	ldx	[%l7 + 0x28],	%g4
	smul	%l0,	0x1C83,	%i1
	fpsub16s	%f6,	%f1,	%f1
	fcmple32	%f8,	%f8,	%l5
	stw	%l6,	[%l7 + 0x28]
	fpsub16s	%f11,	%f1,	%f7
	alignaddr	%g5,	%i5,	%l4
	sdivx	%o1,	0x1813,	%o6
	array16	%i6,	%o2,	%i2
	mulscc	%l1,	0x0EDF,	%o3
	addccc	%i7,	0x1113,	%g6
	stb	%i0,	[%l7 + 0x59]
	add	%i4,	%o5,	%g2
	mulx	%g3,	%g7,	%l2
	fmul8x16au	%f12,	%f11,	%f4
	fnand	%f14,	%f0,	%f8
	xnorcc	%i3,	0x098F,	%o0
	movg	%icc,	%l3,	%o7
	subcc	%o4,	%g4,	%g1
	addccc	%i1,	%l0,	%l5
	movle	%icc,	%g5,	%l6
	edge16	%l4,	%o1,	%o6
	lduw	[%l7 + 0x64],	%i5
	stw	%o2,	[%l7 + 0x34]
	array16	%i2,	%i6,	%o3
	fmovde	%icc,	%f1,	%f14
	fpsub32	%f4,	%f0,	%f2
	movrlez	%i7,	%l1,	%g6
	sdiv	%i4,	0x0180,	%o5
	fmovdle	%icc,	%f2,	%f4
	sethi	0x1667,	%i0
	fcmps	%fcc1,	%f8,	%f8
	movre	%g2,	0x23E,	%g7
	std	%f6,	[%l7 + 0x70]
	fmovsleu	%icc,	%f11,	%f3
	edge32	%l2,	%i3,	%o0
	edge16n	%g3,	%o7,	%o4
	mova	%xcc,	%l3,	%g4
	array32	%g1,	%i1,	%l5
	fpsub32	%f8,	%f12,	%f12
	restore %l0, 0x09FD, %g5
	fmovdcs	%xcc,	%f11,	%f2
	fcmps	%fcc1,	%f5,	%f14
	udivx	%l6,	0x10ED,	%o1
	movrne	%o6,	0x3DA,	%i5
	movvc	%xcc,	%o2,	%i2
	umulcc	%l4,	0x1501,	%i6
	sdivx	%i7,	0x1852,	%o3
	save %l1, %i4, %o5
	movne	%xcc,	%i0,	%g6
	xnorcc	%g2,	%l2,	%g7
	sub	%i3,	0x0D98,	%o0
	mulx	%o7,	0x08A5,	%o4
	movcc	%xcc,	%l3,	%g3
	movgu	%icc,	%g1,	%g4
	andcc	%i1,	0x0039,	%l5
	edge8	%l0,	%l6,	%o1
	smulcc	%g5,	%i5,	%o2
	fpadd32s	%f14,	%f15,	%f3
	smul	%o6,	0x1531,	%i2
	edge8ln	%i6,	%l4,	%o3
	fzero	%f10
	subcc	%i7,	0x1C3F,	%l1
	fpadd16	%f6,	%f0,	%f8
	sub	%i4,	%i0,	%o5
	addcc	%g6,	%l2,	%g2
	fmovrsgz	%i3,	%f7,	%f1
	subcc	%g7,	0x0734,	%o0
	movn	%icc,	%o4,	%o7
	movvc	%icc,	%g3,	%l3
	edge8n	%g1,	%i1,	%g4
	movleu	%xcc,	%l0,	%l5
	movcs	%icc,	%l6,	%o1
	fmovsvc	%xcc,	%f12,	%f14
	movpos	%xcc,	%i5,	%g5
	fcmpne16	%f14,	%f2,	%o2
	xnor	%o6,	%i6,	%i2
	movcs	%xcc,	%o3,	%i7
	mulx	%l1,	%l4,	%i4
	st	%f11,	[%l7 + 0x74]
	addccc	%i0,	0x115B,	%g6
	movgu	%icc,	%o5,	%l2
	mulx	%i3,	0x0210,	%g7
	ldsb	[%l7 + 0x0F],	%g2
	ldd	[%l7 + 0x28],	%f6
	edge16n	%o4,	%o7,	%o0
	fmovdge	%xcc,	%f8,	%f5
	edge8ln	%l3,	%g3,	%i1
	subc	%g1,	%l0,	%g4
	movcs	%xcc,	%l6,	%l5
	mulscc	%o1,	%g5,	%o2
	movrgz	%o6,	%i5,	%i2
	fmovsn	%icc,	%f6,	%f14
	addc	%i6,	0x07DA,	%o3
	restore %i7, %l4, %l1
	orncc	%i0,	0x12D0,	%i4
	sll	%o5,	0x00,	%l2
	fpadd32	%f8,	%f8,	%f4
	fmovrsne	%g6,	%f11,	%f8
	stb	%g7,	[%l7 + 0x7B]
	andcc	%i3,	%g2,	%o4
	ldsb	[%l7 + 0x3B],	%o0
	fmovrslez	%l3,	%f12,	%f1
	edge32	%o7,	%g3,	%i1
	mulx	%l0,	0x0155,	%g1
	fcmpd	%fcc2,	%f12,	%f8
	sethi	0x1710,	%g4
	orncc	%l5,	0x14B9,	%l6
	edge8ln	%o1,	%g5,	%o6
	movvs	%xcc,	%i5,	%i2
	addc	%i6,	%o2,	%o3
	ldsw	[%l7 + 0x60],	%i7
	fpsub32	%f0,	%f8,	%f6
	addccc	%l4,	%i0,	%l1
	fmovrde	%i4,	%f12,	%f0
	movrne	%o5,	0x31B,	%l2
	sub	%g6,	0x034E,	%i3
	edge8n	%g7,	%g2,	%o4
	xnorcc	%o0,	%o7,	%l3
	movleu	%icc,	%g3,	%l0
	sdivcc	%i1,	0x0551,	%g1
	umul	%l5,	0x0AF3,	%g4
	udivx	%o1,	0x1BA4,	%l6
	movgu	%xcc,	%o6,	%i5
	edge32n	%i2,	%i6,	%g5
	fmovrsne	%o3,	%f6,	%f9
	smul	%i7,	0x167D,	%o2
	sdiv	%i0,	0x19E4,	%l4
	movne	%xcc,	%i4,	%o5
	movcs	%icc,	%l1,	%g6
	std	%f6,	[%l7 + 0x20]
	xor	%i3,	0x0DA8,	%g7
	array16	%g2,	%o4,	%l2
	edge16n	%o0,	%o7,	%g3
	movrlez	%l0,	%i1,	%g1
	edge32n	%l3,	%g4,	%l5
	srax	%l6,	%o1,	%i5
	umulcc	%o6,	%i2,	%g5
	array16	%o3,	%i6,	%i7
	ldsb	[%l7 + 0x5E],	%o2
	fmovsneg	%xcc,	%f14,	%f7
	movne	%icc,	%i0,	%l4
	stw	%o5,	[%l7 + 0x18]
	fors	%f7,	%f3,	%f6
	movg	%icc,	%i4,	%l1
	fabsd	%f2,	%f6
	movne	%icc,	%g6,	%i3
	lduh	[%l7 + 0x14],	%g7
	andncc	%o4,	%g2,	%l2
	siam	0x0
	movrlz	%o7,	%g3,	%l0
	sllx	%o0,	0x12,	%i1
	fmovda	%xcc,	%f2,	%f15
	movvc	%icc,	%l3,	%g1
	movcc	%xcc,	%l5,	%g4
	edge8n	%o1,	%i5,	%o6
	fmovd	%f14,	%f14
	edge16ln	%l6,	%g5,	%i2
	movpos	%xcc,	%o3,	%i7
	movl	%icc,	%i6,	%i0
	sdiv	%l4,	0x086B,	%o5
	ldx	[%l7 + 0x30],	%o2
	fmovsg	%icc,	%f11,	%f6
	movvs	%icc,	%i4,	%g6
	andn	%l1,	0x09FE,	%g7
	mova	%xcc,	%o4,	%g2
	smul	%l2,	0x1BE6,	%o7
	mulscc	%g3,	0x1FA5,	%l0
	sth	%o0,	[%l7 + 0x4E]
	sra	%i1,	0x11,	%i3
	subccc	%g1,	%l3,	%l5
	fmovdvs	%xcc,	%f12,	%f4
	movcc	%xcc,	%g4,	%i5
	xor	%o6,	%l6,	%o1
	mulscc	%g5,	0x0C8B,	%o3
	fmovsge	%icc,	%f7,	%f14
	fpsub16s	%f1,	%f6,	%f10
	fornot2	%f0,	%f12,	%f0
	movcs	%xcc,	%i7,	%i6
	pdist	%f0,	%f6,	%f8
	popc	0x087E,	%i0
	fabss	%f11,	%f15
	ld	[%l7 + 0x38],	%f5
	siam	0x5
	smul	%l4,	0x15D6,	%i2
	ldd	[%l7 + 0x70],	%o2
	movneg	%icc,	%o5,	%g6
	restore %i4, %g7, %l1
	stw	%g2,	[%l7 + 0x2C]
	mulscc	%o4,	0x16CF,	%o7
	ld	[%l7 + 0x18],	%f10
	andn	%l2,	%g3,	%l0
	movleu	%icc,	%o0,	%i1
	std	%f6,	[%l7 + 0x70]
	edge8n	%i3,	%g1,	%l3
	edge32l	%g4,	%i5,	%o6
	addcc	%l6,	%o1,	%l5
	movcc	%icc,	%g5,	%i7
	movle	%icc,	%o3,	%i0
	udivcc	%i6,	0x1832,	%l4
	sra	%i2,	%o2,	%g6
	movneg	%icc,	%i4,	%o5
	ldx	[%l7 + 0x10],	%l1
	fmovd	%f12,	%f14
	movleu	%icc,	%g2,	%g7
	lduw	[%l7 + 0x6C],	%o7
	stb	%l2,	[%l7 + 0x3A]
	udivx	%o4,	0x0C9C,	%g3
	edge16	%o0,	%l0,	%i1
	ldd	[%l7 + 0x38],	%f8
	movcc	%xcc,	%g1,	%l3
	movle	%xcc,	%i3,	%i5
	andncc	%g4,	%l6,	%o6
	fpadd32s	%f1,	%f0,	%f9
	xnor	%l5,	0x03A1,	%o1
	xnorcc	%g5,	%o3,	%i0
	edge16	%i7,	%l4,	%i2
	fpadd16	%f2,	%f4,	%f12
	sll	%i6,	%g6,	%i4
	movle	%icc,	%o2,	%o5
	xorcc	%l1,	%g2,	%g7
	srl	%l2,	0x13,	%o4
	udiv	%g3,	0x0AA0,	%o7
	fpsub32s	%f0,	%f3,	%f10
	xnor	%l0,	%o0,	%i1
	edge32l	%g1,	%i3,	%i5
	andncc	%l3,	%g4,	%o6
	fxors	%f3,	%f15,	%f0
	siam	0x1
	ldsb	[%l7 + 0x0E],	%l6
	edge8l	%l5,	%g5,	%o3
	andn	%i0,	0x033E,	%i7
	edge16l	%o1,	%l4,	%i2
	edge32n	%i6,	%i4,	%o2
	fpadd16s	%f0,	%f1,	%f9
	edge16	%o5,	%g6,	%g2
	fpack32	%f10,	%f2,	%f8
	fandnot2s	%f7,	%f0,	%f12
	movpos	%xcc,	%l1,	%g7
	mulscc	%l2,	%g3,	%o7
	array32	%l0,	%o4,	%i1
	alignaddr	%g1,	%o0,	%i3
	edge16l	%l3,	%i5,	%g4
	smul	%l6,	%o6,	%l5
	lduh	[%l7 + 0x6E],	%g5
	fxor	%f4,	%f10,	%f14
	add	%o3,	0x17DC,	%i0
	fmovdneg	%xcc,	%f5,	%f12
	fandnot1	%f0,	%f6,	%f14
	ldsh	[%l7 + 0x40],	%i7
	addc	%l4,	%o1,	%i6
	sdivcc	%i2,	0x0279,	%i4
	movpos	%xcc,	%o5,	%o2
	fxnors	%f10,	%f10,	%f5
	mulscc	%g2,	%l1,	%g7
	movn	%xcc,	%l2,	%g6
	edge32	%g3,	%o7,	%l0
	xor	%i1,	0x06F3,	%o4
	movcc	%icc,	%g1,	%i3
	pdist	%f14,	%f12,	%f10
	movvs	%xcc,	%l3,	%o0
	movre	%i5,	0x3E1,	%g4
	stx	%o6,	[%l7 + 0x50]
	movrlez	%l5,	%l6,	%g5
	movle	%icc,	%i0,	%o3
	movvs	%icc,	%l4,	%o1
	andcc	%i7,	%i6,	%i2
	movgu	%xcc,	%o5,	%i4
	fsrc1	%f14,	%f10
	movgu	%icc,	%g2,	%o2
	movpos	%xcc,	%l1,	%g7
	ldd	[%l7 + 0x78],	%g6
	fnot2s	%f2,	%f8
	ldsb	[%l7 + 0x3F],	%g3
	movvc	%icc,	%o7,	%l0
	edge8n	%l2,	%o4,	%i1
	movleu	%icc,	%i3,	%l3
	fmovrdgz	%o0,	%f2,	%f0
	sdivcc	%i5,	0x1BE0,	%g4
	edge32	%o6,	%l5,	%g1
	subc	%l6,	%i0,	%g5
	movcc	%icc,	%o3,	%o1
	movre	%l4,	0x3DD,	%i7
	alignaddrl	%i6,	%i2,	%o5
	srax	%i4,	%g2,	%o2
	fcmple16	%f2,	%f10,	%l1
	movgu	%icc,	%g6,	%g3
	movne	%xcc,	%g7,	%l0
	addccc	%o7,	%l2,	%i1
	sdivcc	%o4,	0x0C7C,	%i3
	fmovsg	%icc,	%f14,	%f13
	st	%f12,	[%l7 + 0x54]
	udivx	%o0,	0x1FDA,	%i5
	movrlez	%l3,	0x0C0,	%g4
	ldx	[%l7 + 0x08],	%o6
	andcc	%g1,	%l5,	%i0
	andncc	%l6,	%o3,	%o1
	subccc	%l4,	0x1D3D,	%g5
	fmovs	%f12,	%f12
	edge8ln	%i7,	%i6,	%i2
	movg	%xcc,	%i4,	%o5
	xor	%g2,	0x0B76,	%l1
	fxors	%f11,	%f0,	%f4
	andcc	%g6,	%o2,	%g7
	fsrc2	%f0,	%f2
	xnorcc	%l0,	0x08E2,	%o7
	sra	%g3,	%l2,	%o4
	sth	%i1,	[%l7 + 0x4E]
	xor	%i3,	0x126D,	%i5
	movrgez	%l3,	0x3DF,	%g4
	movn	%icc,	%o6,	%g1
	st	%f10,	[%l7 + 0x7C]
	fcmpeq32	%f6,	%f4,	%l5
	umul	%i0,	0x1CBC,	%o0
	edge16n	%l6,	%o3,	%o1
	sra	%g5,	0x0B,	%l4
	fmovsg	%xcc,	%f5,	%f14
	ldd	[%l7 + 0x10],	%f0
	movrlz	%i7,	%i2,	%i4
	sllx	%o5,	0x15,	%i6
	sth	%l1,	[%l7 + 0x0A]
	fpsub16s	%f1,	%f4,	%f6
	array8	%g2,	%o2,	%g7
	ldsw	[%l7 + 0x50],	%g6
	edge16n	%l0,	%o7,	%g3
	fmuld8ulx16	%f8,	%f2,	%f6
	xnor	%l2,	%i1,	%o4
	lduw	[%l7 + 0x30],	%i5
	andn	%l3,	%g4,	%i3
	fmovsn	%xcc,	%f5,	%f12
	sethi	0x1365,	%o6
	orcc	%l5,	%g1,	%o0
	fmovrslz	%i0,	%f14,	%f15
	orcc	%l6,	0x1FCE,	%o1
	movvs	%icc,	%o3,	%l4
	sdivx	%i7,	0x0670,	%g5
	smulcc	%i4,	0x1AB3,	%i2
	stw	%i6,	[%l7 + 0x34]
	edge8	%l1,	%g2,	%o5
	fandnot1s	%f8,	%f1,	%f10
	fornot2	%f8,	%f0,	%f12
	subccc	%o2,	0x15E0,	%g6
	sdivx	%l0,	0x06B0,	%g7
	restore %o7, 0x097F, %g3
	movl	%xcc,	%l2,	%o4
	subcc	%i1,	0x0E4D,	%i5
	stw	%g4,	[%l7 + 0x78]
	popc	%l3,	%o6
	edge8l	%i3,	%g1,	%l5
	xnorcc	%o0,	%l6,	%i0
	popc	%o1,	%l4
	st	%f6,	[%l7 + 0x38]
	fmovda	%xcc,	%f2,	%f15
	edge32l	%o3,	%i7,	%g5
	edge16	%i4,	%i6,	%l1
	smul	%g2,	%i2,	%o5
	fornot2	%f10,	%f2,	%f10
	ldub	[%l7 + 0x79],	%o2
	edge8l	%l0,	%g7,	%o7
	addcc	%g6,	0x1439,	%l2
	fmovsg	%xcc,	%f4,	%f9
	movpos	%xcc,	%o4,	%i1
	srl	%g3,	%i5,	%l3
	movge	%xcc,	%g4,	%o6
	sth	%i3,	[%l7 + 0x6A]
	ldsh	[%l7 + 0x6E],	%g1
	movcs	%icc,	%o0,	%l6
	mulx	%i0,	0x0BBB,	%l5
	fpadd16s	%f11,	%f10,	%f4
	sra	%o1,	%o3,	%i7
	ldsw	[%l7 + 0x28],	%l4
	sdivcc	%g5,	0x0540,	%i4
	movne	%icc,	%i6,	%g2
	fxnors	%f0,	%f5,	%f8
	pdist	%f0,	%f6,	%f0
	addc	%l1,	0x06CA,	%o5
	subc	%o2,	0x17A0,	%i2
	ldsb	[%l7 + 0x2C],	%l0
	udivcc	%o7,	0x0F63,	%g7
	movrgz	%l2,	%g6,	%i1
	ldx	[%l7 + 0x18],	%g3
	fsrc2	%f4,	%f2
	add	%o4,	0x088F,	%l3
	umul	%i5,	%g4,	%i3
	udivcc	%o6,	0x0A34,	%g1
	ldsh	[%l7 + 0x5E],	%l6
	mulscc	%i0,	0x17DF,	%l5
	st	%f7,	[%l7 + 0x6C]
	srax	%o1,	0x17,	%o0
	fnands	%f11,	%f1,	%f2
	fmul8sux16	%f0,	%f6,	%f2
	stw	%o3,	[%l7 + 0x1C]
	xnor	%l4,	0x0AAA,	%g5
	sll	%i4,	%i7,	%i6
	movpos	%icc,	%l1,	%o5
	stw	%o2,	[%l7 + 0x1C]
	fornot1	%f8,	%f14,	%f2
	movrgz	%i2,	%l0,	%g2
	srlx	%g7,	%l2,	%g6
	movle	%icc,	%o7,	%g3
	fornot1s	%f9,	%f0,	%f14
	subccc	%o4,	0x11AB,	%l3
	stx	%i1,	[%l7 + 0x10]
	udivcc	%g4,	0x1994,	%i5
	edge32	%i3,	%g1,	%l6
	movleu	%xcc,	%i0,	%l5
	sra	%o6,	%o0,	%o1
	stx	%o3,	[%l7 + 0x38]
	fmovdge	%xcc,	%f11,	%f15
	fcmpne32	%f2,	%f6,	%l4
	ldd	[%l7 + 0x08],	%g4
	movre	%i7,	0x1DB,	%i6
	udivcc	%l1,	0x0C39,	%i4
	move	%icc,	%o5,	%i2
	movle	%xcc,	%o2,	%l0
	movgu	%xcc,	%g7,	%l2
	or	%g6,	0x04EB,	%g2
	movl	%icc,	%o7,	%o4
	ldd	[%l7 + 0x78],	%f14
	ldx	[%l7 + 0x48],	%l3
	lduw	[%l7 + 0x4C],	%g3
	fmovsleu	%icc,	%f1,	%f8
	fzeros	%f3
	array32	%i1,	%i5,	%i3
	ldub	[%l7 + 0x1F],	%g1
	fmul8x16al	%f7,	%f13,	%f8
	move	%icc,	%l6,	%g4
	edge32n	%i0,	%o6,	%o0
	movle	%icc,	%l5,	%o1
	ldsw	[%l7 + 0x28],	%o3
	array16	%g5,	%i7,	%i6
	addcc	%l4,	0x0DCF,	%l1
	mova	%xcc,	%i4,	%i2
	srax	%o2,	0x15,	%o5
	edge16n	%l0,	%g7,	%l2
	addccc	%g2,	%g6,	%o4
	edge8	%o7,	%l3,	%g3
	addcc	%i1,	%i3,	%i5
	udiv	%l6,	0x0D27,	%g4
	or	%i0,	0x1382,	%g1
	for	%f4,	%f0,	%f8
	smulcc	%o0,	0x0573,	%l5
	mulscc	%o1,	%o6,	%g5
	fcmpne32	%f12,	%f8,	%i7
	ldsb	[%l7 + 0x49],	%o3
	bshuffle	%f8,	%f6,	%f8
	fornot1	%f2,	%f12,	%f14
	ldub	[%l7 + 0x52],	%i6
	xnor	%l4,	%i4,	%i2
	xnorcc	%l1,	%o2,	%o5
	fors	%f12,	%f6,	%f1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type f   	: 2201
!	Type i   	: 6365
!	Type l   	: 1434
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xFA43F16D
.word 0x64F7D880
.word 0xDFBDBA1F
.word 0xB91C6E93
.word 0x90430AFF
.word 0xDF150158
.word 0xC5DF6481
.word 0x1FA7F366
.word 0x29207157
.word 0xDCF9958B
.word 0x4B9E52EE
.word 0xB54992BD
.word 0x8AA47631
.word 0xCFA3948A
.word 0x1D7FEDAA
.word 0xA25136EC
.word 0xC800C2AE
.word 0xD2C0828B
.word 0x158B264E
.word 0xEC661E86
.word 0x8EAB67C1
.word 0x9E8EC6B7
.word 0x03AB7566
.word 0x7839BD02
.word 0x4759B747
.word 0xAC6D4AB8
.word 0xFB0E631C
.word 0x058B42B5
.word 0x6583BDFF
.word 0x426F9E34
.word 0x2ABE3A2D
.word 0x6CED10AE
.word 0x43063BAB
.word 0x04A206FA
.word 0xFA976978
.word 0xCE162B42
.word 0x783E90E3
.word 0x160F7BC5
.word 0xCE939FF4
.word 0xA0A63AC5
.word 0x60940EE0
.word 0xA2EA11E8
.word 0x1B4184B5
.word 0x7FB935F8
.word 0xB3E29D75
.word 0x6010416D
.word 0x5980791B
.word 0x98FEE7D5
.word 0x0294F942
.word 0x7C7B43E8
.word 0x6810B3F7
.word 0x62AF2F1A
.word 0xD8DD8B73
.word 0x28CF459A
.word 0x57C29035
.word 0x5E544627
.word 0x21F0AE68
.word 0x084A099D
.word 0xD823AE8F
.word 0x721851E8
.word 0x92073245
.word 0x06B7BEEE
.word 0x2511CF14
.word 0xBC5EC2C4
.end
