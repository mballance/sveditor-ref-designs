/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: saveld1.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=846072888"
.ident "BY rg131678 ON Tue Aug  5 17:58:50 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: saveld1.s,v 1.3 2007/07/05 22:02:02 drp Exp $"
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

mov %l7, %g1
wrpr %g0, 0x0, %cwp
mov %g1, %l7
wrpr %g0, 0x1, %cwp
mov %g1, %l7
wrpr %g0, 0x2, %cwp
mov %g1, %l7
wrpr %g0, 0x3, %cwp
mov %g1, %l7
wrpr %g0, 0x4, %cwp
mov %g1, %l7
wrpr %g0, 0x5, %cwp
mov %g1, %l7
wrpr %g0, 0x6, %cwp
mov %g1, %l7
wrpr %g0, 0x7, %cwp
mov %g1, %l7

!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x5,	%g1
	set	0xB,	%g2
	set	0xD,	%g3
	set	0x3,	%g4
	set	0x2,	%g5
	set	0x2,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0xA,	%i1
	set	-0xC,	%i2
	set	-0x9,	%i3
	set	-0x5,	%i4
	set	-0x9,	%i5
	set	-0x7,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x7D228A13,	%l0
	set	0x4E67732C,	%l1
	set	0x3477D16E,	%l2
	set	0x65A37EC2,	%l3
	set	0x1EC3352C,	%l4
	set	0x0345F1D8,	%l5
	set	0x43BA3F27,	%l6
	!# Output registers
	set	0x0291,	%o0
	set	-0x034D,	%o1
	set	0x0E4A,	%o2
	set	0x00E8,	%o3
	set	-0x0866,	%o4
	set	-0x1D53,	%o5
	set	0x09B2,	%o6
	set	0x0765,	%o7

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

	fmovsneg	%icc,	%f12,	%f10
	save %i3, 0x1DDE, %l5
	movre	%i7,	%g2,	%l0
	subccc	%o3,	0x110C,	%g4
	smulcc	%o0,	0x15E3,	%i0
	movrlez	%g5,	%i1,	%o4
	orncc	%o1,	%o6,	%o7
	movcs	%xcc,	%g7,	%g6
	xnorcc	%g3,	0x02DF,	%i5
	ldsh	[%l7 + 0x7E],	%i2
	sllx	%i4,	0x08,	%l4
	movgu	%icc,	%l2,	%l3
	sdivcc	%i6,	0x0351,	%l1
	fxor	%f12,	%f2,	%f6
	fmovsl	%xcc,	%f13,	%f9
	stw	%o2,	[%l7 + 0x30]
	fmovrslez	%l6,	%f15,	%f0
	movle	%icc,	%g1,	%i3
	stb	%l5,	[%l7 + 0x09]
	lduw	[%l7 + 0x4C],	%o5
	movleu	%xcc,	%g2,	%l0
	xnor	%o3,	0x169F,	%i7
	alignaddr	%g4,	%i0,	%o0
	movvc	%icc,	%g5,	%i1
	lduw	[%l7 + 0x14],	%o1
	andncc	%o6,	%o7,	%o4
	fnegd	%f2,	%f4
	umulcc	%g6,	0x027F,	%g3
	fandnot2s	%f11,	%f8,	%f10
	stw	%g7,	[%l7 + 0x2C]
	edge8l	%i2,	%i5,	%l4
	movg	%icc,	%l2,	%i4
	addccc	%l3,	0x1B90,	%l1
	fmovse	%icc,	%f10,	%f4
	sll	%i6,	%o2,	%g1
	ldd	[%l7 + 0x50],	%i2
	movne	%xcc,	%l5,	%l6
	srax	%o5,	0x0B,	%l0
	udiv	%g2,	0x1192,	%o3
	sdivcc	%i7,	0x1C36,	%i0
	and	%o0,	%g4,	%g5
	edge8l	%i1,	%o6,	%o1
	alignaddrl	%o4,	%o7,	%g3
	popc	%g7,	%g6
	fpadd16s	%f1,	%f14,	%f3
	lduh	[%l7 + 0x62],	%i2
	array8	%l4,	%i5,	%l2
	movl	%xcc,	%l3,	%l1
	subc	%i6,	%o2,	%i4
	stx	%i3,	[%l7 + 0x28]
	fmovdleu	%icc,	%f2,	%f1
	fmovdpos	%xcc,	%f1,	%f1
	fmovdvs	%xcc,	%f8,	%f15
	orn	%l5,	0x1F01,	%g1
	edge32l	%l6,	%o5,	%l0
	add	%g2,	0x0A26,	%o3
	subcc	%i0,	0x0B0E,	%i7
	subcc	%g4,	0x078C,	%o0
	orn	%g5,	%i1,	%o1
	array32	%o6,	%o4,	%g3
	save %g7, %g6, %o7
	ldsh	[%l7 + 0x10],	%l4
	srax	%i2,	0x09,	%l2
	andn	%l3,	0x02F1,	%i5
	fmovda	%xcc,	%f1,	%f12
	array16	%l1,	%o2,	%i4
	movneg	%icc,	%i6,	%l5
	movrne	%g1,	%i3,	%l6
	lduh	[%l7 + 0x48],	%l0
	movcs	%icc,	%o5,	%g2
	xor	%o3,	0x180C,	%i7
	ldsw	[%l7 + 0x7C],	%g4
	movg	%icc,	%i0,	%o0
	move	%xcc,	%i1,	%g5
	movne	%icc,	%o6,	%o1
	fxors	%f14,	%f14,	%f1
	movpos	%icc,	%g3,	%o4
	ldx	[%l7 + 0x68],	%g7
	array16	%g6,	%o7,	%i2
	fmovdge	%icc,	%f3,	%f15
	movvc	%icc,	%l4,	%l3
	array8	%l2,	%i5,	%l1
	and	%o2,	0x0EA4,	%i4
	fnor	%f8,	%f0,	%f8
	move	%xcc,	%i6,	%l5
	subccc	%i3,	0x0AB3,	%g1
	edge8	%l6,	%l0,	%o5
	array16	%g2,	%i7,	%o3
	popc	%i0,	%o0
	edge32	%g4,	%i1,	%o6
	movpos	%xcc,	%g5,	%g3
	srax	%o1,	0x1F,	%g7
	edge16	%o4,	%g6,	%i2
	edge16	%l4,	%l3,	%l2
	move	%icc,	%o7,	%l1
	movne	%icc,	%o2,	%i5
	movl	%xcc,	%i6,	%l5
	xor	%i4,	%i3,	%g1
	addc	%l0,	0x1DFC,	%l6
	movn	%icc,	%g2,	%o5
	ld	[%l7 + 0x10],	%f10
	fnot1s	%f10,	%f6
	mova	%icc,	%i7,	%o3
	andncc	%o0,	%i0,	%i1
	orn	%o6,	0x0C96,	%g4
	fexpand	%f11,	%f2
	xnorcc	%g3,	0x0CEE,	%g5
	movgu	%xcc,	%o1,	%g7
	edge16l	%o4,	%i2,	%g6
	lduh	[%l7 + 0x0A],	%l4
	movcc	%icc,	%l2,	%l3
	fmovs	%f7,	%f8
	for	%f4,	%f14,	%f0
	movcs	%icc,	%o7,	%o2
	fmovdne	%icc,	%f0,	%f0
	fmovrdgz	%i5,	%f10,	%f4
	smul	%l1,	%l5,	%i4
	ldx	[%l7 + 0x48],	%i6
	fmovrse	%g1,	%f4,	%f6
	edge16ln	%i3,	%l6,	%g2
	fmuld8ulx16	%f0,	%f13,	%f0
	movrlez	%o5,	%l0,	%i7
	subc	%o0,	0x1CD4,	%i0
	edge16ln	%i1,	%o6,	%g4
	ldsb	[%l7 + 0x0F],	%g3
	movrlz	%g5,	0x16A,	%o1
	edge32l	%g7,	%o3,	%i2
	subc	%g6,	0x0C89,	%o4
	sth	%l2,	[%l7 + 0x16]
	stb	%l4,	[%l7 + 0x79]
	subccc	%o7,	0x1D62,	%l3
	sra	%i5,	0x0B,	%o2
	ldsw	[%l7 + 0x74],	%l1
	mulx	%l5,	0x0DD5,	%i6
	for	%f2,	%f4,	%f8
	fmovspos	%icc,	%f3,	%f5
	fandnot2	%f0,	%f4,	%f12
	movle	%xcc,	%g1,	%i4
	fmovrdne	%i3,	%f6,	%f8
	lduw	[%l7 + 0x10],	%g2
	xnorcc	%l6,	0x0B9A,	%l0
	edge32	%o5,	%o0,	%i7
	sethi	0x1DBB,	%i0
	ldsh	[%l7 + 0x6C],	%i1
	move	%icc,	%g4,	%g3
	udivx	%o6,	0x052B,	%g5
	smul	%g7,	0x169B,	%o3
	edge8n	%o1,	%g6,	%o4
	lduw	[%l7 + 0x40],	%i2
	edge32	%l4,	%o7,	%l2
	movvs	%xcc,	%i5,	%o2
	movn	%icc,	%l3,	%l5
	movcs	%xcc,	%l1,	%i6
	fmovrsne	%i4,	%f3,	%f10
	sdivx	%i3,	0x04E9,	%g1
	addccc	%g2,	%l0,	%o5
	edge32	%l6,	%i7,	%o0
	ldx	[%l7 + 0x20],	%i0
	fmovdvc	%xcc,	%f9,	%f3
	fmul8x16au	%f1,	%f7,	%f2
	edge32l	%i1,	%g4,	%g3
	stx	%g5,	[%l7 + 0x78]
	stb	%g7,	[%l7 + 0x53]
	ldsw	[%l7 + 0x4C],	%o6
	edge32l	%o1,	%g6,	%o4
	ldx	[%l7 + 0x28],	%o3
	array8	%i2,	%l4,	%o7
	movrne	%i5,	%o2,	%l2
	or	%l3,	0x1CA6,	%l1
	sll	%i6,	%l5,	%i4
	movn	%xcc,	%i3,	%g1
	alignaddr	%g2,	%o5,	%l0
	movre	%l6,	0x3C1,	%i7
	sth	%o0,	[%l7 + 0x1C]
	smul	%i0,	0x1D6E,	%g4
	fones	%f0
	edge32ln	%g3,	%g5,	%i1
	popc	0x18E4,	%o6
	pdist	%f0,	%f0,	%f0
	edge16	%g7,	%g6,	%o4
	edge8l	%o1,	%i2,	%o3
	movne	%icc,	%l4,	%i5
	edge8n	%o2,	%l2,	%o7
	fpsub16s	%f9,	%f11,	%f11
	ldsh	[%l7 + 0x68],	%l3
	movcs	%xcc,	%i6,	%l5
	fornot1s	%f12,	%f6,	%f15
	fcmpd	%fcc1,	%f12,	%f6
	ldd	[%l7 + 0x48],	%f8
	xor	%l1,	0x0F80,	%i4
	alignaddrl	%g1,	%i3,	%g2
	movpos	%icc,	%l0,	%l6
	fmovrdlez	%i7,	%f6,	%f6
	stw	%o0,	[%l7 + 0x7C]
	edge32ln	%o5,	%g4,	%g3
	sethi	0x0EA0,	%g5
	movn	%icc,	%i0,	%o6
	edge32n	%g7,	%i1,	%o4
	array32	%g6,	%o1,	%o3
	fcmple16	%f6,	%f4,	%i2
	alignaddrl	%i5,	%o2,	%l4
	udivx	%o7,	0x1546,	%l3
	fzeros	%f1
	movre	%l2,	0x08C,	%l5
	fmovdg	%icc,	%f6,	%f13
	addcc	%l1,	0x0149,	%i4
	fmovrdgez	%g1,	%f0,	%f12
	ldsw	[%l7 + 0x14],	%i3
	srlx	%g2,	%l0,	%i6
	movrlz	%l6,	0x22A,	%i7
	alignaddrl	%o0,	%g4,	%o5
	xorcc	%g3,	%i0,	%o6
	edge32	%g5,	%g7,	%i1
	sethi	0x10DE,	%g6
	movpos	%xcc,	%o1,	%o3
	movrlz	%i2,	0x30B,	%i5
	andcc	%o2,	0x0995,	%o4
	addc	%o7,	0x041D,	%l3
	movre	%l2,	%l4,	%l5
	movleu	%icc,	%i4,	%g1
	subccc	%l1,	%i3,	%g2
	stx	%l0,	[%l7 + 0x78]
	fmovrsne	%i6,	%f1,	%f11
	addcc	%i7,	0x08BF,	%o0
	movgu	%xcc,	%l6,	%g4
	edge32ln	%g3,	%i0,	%o5
	move	%icc,	%g5,	%g7
	fpadd16	%f4,	%f0,	%f6
	subccc	%o6,	0x043E,	%g6
	xnorcc	%o1,	0x1D4C,	%i1
	sll	%i2,	%o3,	%o2
	movleu	%icc,	%o4,	%i5
	ldsb	[%l7 + 0x13],	%l3
	movle	%xcc,	%o7,	%l2
	subccc	%l5,	0x1D32,	%l4
	ldd	[%l7 + 0x58],	%f14
	movrlez	%i4,	%g1,	%i3
	stb	%g2,	[%l7 + 0x1E]
	smul	%l0,	0x1C1C,	%l1
	edge32ln	%i7,	%o0,	%i6
	subc	%l6,	%g3,	%g4
	fxnor	%f10,	%f2,	%f0
	udivx	%o5,	0x0E30,	%i0
	sdivx	%g7,	0x1B9B,	%g5
	sra	%g6,	0x0C,	%o6
	movvc	%xcc,	%i1,	%i2
	andcc	%o1,	%o2,	%o4
	fmovscc	%icc,	%f13,	%f7
	udivcc	%i5,	0x0869,	%o3
	edge8ln	%l3,	%o7,	%l2
	move	%xcc,	%l5,	%l4
	faligndata	%f12,	%f6,	%f6
	fmovdleu	%icc,	%f8,	%f3
	fpadd32	%f8,	%f4,	%f0
	sethi	0x13A7,	%i4
	edge8ln	%i3,	%g1,	%l0
	ldd	[%l7 + 0x50],	%l0
	xnorcc	%g2,	0x0CC8,	%i7
	fornot1s	%f11,	%f6,	%f2
	edge32	%o0,	%i6,	%g3
	smul	%l6,	0x1DBF,	%o5
	movrgz	%i0,	0x00C,	%g7
	stb	%g5,	[%l7 + 0x28]
	pdist	%f4,	%f10,	%f0
	stw	%g4,	[%l7 + 0x0C]
	mulscc	%o6,	0x191F,	%i1
	umulcc	%g6,	%o1,	%o2
	fandnot1	%f10,	%f10,	%f12
	fmovrdne	%i2,	%f10,	%f0
	srlx	%o4,	0x18,	%i5
	smulcc	%o3,	0x0113,	%o7
	mova	%xcc,	%l3,	%l5
	subcc	%l4,	%l2,	%i3
	movvs	%icc,	%i4,	%l0
	movg	%icc,	%g1,	%l1
	fcmpeq16	%f2,	%f10,	%g2
	popc	0x0686,	%i7
	movpos	%icc,	%o0,	%g3
	orncc	%l6,	%i6,	%o5
	save %g7, %g5, %g4
	movre	%o6,	%i1,	%i0
	fpack32	%f10,	%f14,	%f2
	fmovrde	%g6,	%f10,	%f12
	ldub	[%l7 + 0x52],	%o1
	sra	%i2,	0x18,	%o2
	fnegs	%f14,	%f8
	fmul8x16	%f11,	%f2,	%f4
	umulcc	%o4,	0x0727,	%i5
	ldd	[%l7 + 0x28],	%f4
	movvs	%icc,	%o7,	%l3
	umulcc	%l5,	%o3,	%l4
	umulcc	%l2,	0x1991,	%i3
	fcmpne32	%f6,	%f12,	%i4
	alignaddrl	%l0,	%g1,	%l1
	movrlz	%i7,	0x128,	%g2
	subc	%o0,	0x0A3E,	%g3
	movpos	%icc,	%i6,	%o5
	fxnors	%f5,	%f2,	%f6
	movn	%icc,	%l6,	%g7
	popc	0x0632,	%g4
	fornot1	%f8,	%f10,	%f12
	fmovrdlz	%o6,	%f6,	%f12
	restore %i1, 0x1E9B, %g5
	srlx	%g6,	0x14,	%i0
	sth	%o1,	[%l7 + 0x64]
	add	%o2,	%o4,	%i5
	edge32l	%i2,	%o7,	%l5
	array32	%o3,	%l4,	%l2
	add	%l3,	%i4,	%i3
	stx	%g1,	[%l7 + 0x58]
	edge8	%l1,	%l0,	%g2
	fcmpd	%fcc3,	%f6,	%f10
	movpos	%xcc,	%i7,	%o0
	st	%f9,	[%l7 + 0x70]
	srl	%i6,	0x02,	%o5
	mulscc	%g3,	%g7,	%g4
	movcc	%icc,	%o6,	%i1
	st	%f8,	[%l7 + 0x44]
	movvc	%icc,	%l6,	%g5
	ldd	[%l7 + 0x70],	%i0
	array32	%o1,	%o2,	%o4
	srl	%i5,	0x14,	%g6
	fmovrse	%i2,	%f1,	%f13
	edge32l	%l5,	%o7,	%l4
	addcc	%l2,	0x1D6B,	%o3
	stw	%l3,	[%l7 + 0x48]
	xnorcc	%i3,	0x0C9E,	%i4
	ldub	[%l7 + 0x1C],	%l1
	fmovda	%icc,	%f12,	%f15
	movne	%xcc,	%l0,	%g1
	fmovdgu	%icc,	%f0,	%f10
	movg	%xcc,	%g2,	%i7
	edge8l	%i6,	%o5,	%o0
	orncc	%g3,	0x07EC,	%g4
	save %o6, %g7, %i1
	edge8	%l6,	%i0,	%o1
	mulx	%g5,	0x04E2,	%o2
	fmovrse	%i5,	%f9,	%f9
	std	%f2,	[%l7 + 0x60]
	movleu	%icc,	%o4,	%g6
	orn	%l5,	0x18C5,	%i2
	ldd	[%l7 + 0x10],	%f0
	bshuffle	%f0,	%f2,	%f0
	udivcc	%l4,	0x0D51,	%o7
	save %o3, 0x1B55, %l3
	udivx	%i3,	0x0A76,	%i4
	movpos	%xcc,	%l2,	%l1
	fmovde	%xcc,	%f0,	%f13
	addc	%g1,	0x181B,	%l0
	xorcc	%i7,	%g2,	%o5
	fandnot1s	%f5,	%f15,	%f6
	fcmpes	%fcc1,	%f6,	%f2
	ld	[%l7 + 0x40],	%f12
	std	%f2,	[%l7 + 0x70]
	fcmps	%fcc0,	%f7,	%f5
	srl	%i6,	0x0F,	%g3
	movneg	%xcc,	%o0,	%o6
	fmovspos	%icc,	%f2,	%f3
	mova	%icc,	%g7,	%i1
	fcmple32	%f6,	%f0,	%g4
	andncc	%l6,	%o1,	%g5
	edge8l	%o2,	%i5,	%o4
	srlx	%i0,	%l5,	%i2
	movvs	%icc,	%g6,	%o7
	sllx	%o3,	%l4,	%i3
	array16	%i4,	%l3,	%l2
	sra	%g1,	%l1,	%i7
	fnors	%f14,	%f4,	%f0
	movgu	%icc,	%l0,	%g2
	sub	%o5,	%g3,	%i6
	udivx	%o0,	0x1835,	%g7
	fsrc2s	%f2,	%f10
	movgu	%icc,	%o6,	%i1
	fpadd32	%f4,	%f4,	%f10
	ldsb	[%l7 + 0x50],	%l6
	edge8	%o1,	%g4,	%o2
	xnor	%i5,	0x0F45,	%o4
	umul	%g5,	%i0,	%l5
	ld	[%l7 + 0x2C],	%f3
	save %g6, %i2, %o7
	mulscc	%o3,	0x1C04,	%l4
	movleu	%xcc,	%i3,	%l3
	restore %l2, 0x0987, %g1
	subc	%i4,	%i7,	%l0
	alignaddrl	%g2,	%o5,	%g3
	edge16l	%l1,	%o0,	%i6
	fmovdn	%xcc,	%f10,	%f8
	movneg	%xcc,	%o6,	%i1
	edge8l	%l6,	%g7,	%o1
	fmul8x16al	%f2,	%f5,	%f8
	fmovrsgez	%g4,	%f14,	%f4
	edge16l	%o2,	%o4,	%i5
	movge	%icc,	%i0,	%l5
	fmovse	%icc,	%f4,	%f6
	or	%g6,	%g5,	%i2
	subcc	%o7,	0x1741,	%o3
	addc	%i3,	%l3,	%l4
	popc	%l2,	%i4
	movrne	%i7,	%l0,	%g2
	andncc	%g1,	%o5,	%l1
	fsrc1	%f12,	%f12
	st	%f9,	[%l7 + 0x50]
	edge16l	%g3,	%i6,	%o6
	save %i1, %o0, %g7
	movrlez	%o1,	%g4,	%l6
	restore %o2, 0x01EE, %i5
	ld	[%l7 + 0x28],	%f0
	lduh	[%l7 + 0x2E],	%i0
	ldd	[%l7 + 0x30],	%o4
	ldd	[%l7 + 0x28],	%g6
	fcmpne32	%f8,	%f4,	%l5
	restore %g5, %i2, %o7
	movcc	%xcc,	%o3,	%l3
	array16	%l4,	%l2,	%i4
	fsrc2	%f4,	%f0
	sethi	0x0F35,	%i7
	ldsh	[%l7 + 0x26],	%i3
	movl	%icc,	%g2,	%g1
	ldsw	[%l7 + 0x78],	%l0
	fmul8ulx16	%f0,	%f4,	%f0
	xnor	%l1,	0x0A19,	%o5
	stx	%g3,	[%l7 + 0x78]
	ldsw	[%l7 + 0x68],	%o6
	fmovdcs	%xcc,	%f0,	%f7
	smulcc	%i1,	0x111E,	%i6
	sll	%g7,	%o0,	%g4
	fsrc1s	%f4,	%f5
	fmovsvs	%icc,	%f15,	%f2
	orn	%o1,	0x1CEB,	%o2
	stx	%l6,	[%l7 + 0x60]
	movneg	%icc,	%i5,	%o4
	pdist	%f6,	%f10,	%f6
	udivx	%i0,	0x0DAE,	%l5
	udivcc	%g5,	0x1AFF,	%g6
	mova	%icc,	%i2,	%o7
	movrlez	%o3,	%l3,	%l4
	srl	%i4,	%i7,	%l2
	movrlez	%g2,	0x0A7,	%i3
	movleu	%xcc,	%g1,	%l0
	fpsub16s	%f4,	%f2,	%f1
	xor	%l1,	0x0586,	%o5
	movcc	%icc,	%g3,	%i1
	fandnot2	%f4,	%f10,	%f4
	umul	%o6,	%g7,	%o0
	movge	%xcc,	%g4,	%o1
	edge32ln	%o2,	%l6,	%i5
	array32	%i6,	%i0,	%o4
	fabsd	%f12,	%f2
	restore %g5, %l5, %i2
	subccc	%g6,	%o7,	%l3
	udivcc	%o3,	0x0C75,	%l4
	orncc	%i7,	%i4,	%l2
	ld	[%l7 + 0x0C],	%f7
	andcc	%g2,	%g1,	%i3
	edge8l	%l0,	%o5,	%l1
	orcc	%g3,	%o6,	%g7
	fmuld8sux16	%f1,	%f6,	%f6
	edge8	%o0,	%i1,	%o1
	movl	%icc,	%g4,	%o2
	fpack16	%f6,	%f13
	subc	%l6,	%i6,	%i5
	mulscc	%o4,	0x0B35,	%g5
	movg	%icc,	%l5,	%i0
	stb	%i2,	[%l7 + 0x1F]
	addc	%o7,	0x09CF,	%g6
	fcmpd	%fcc3,	%f4,	%f12
	fnors	%f1,	%f7,	%f5
	fpsub32s	%f12,	%f10,	%f10
	sllx	%l3,	0x06,	%o3
	fcmpne16	%f14,	%f0,	%l4
	stb	%i4,	[%l7 + 0x79]
	faligndata	%f2,	%f12,	%f14
	edge32ln	%i7,	%l2,	%g2
	fabsd	%f0,	%f2
	fzeros	%f5
	sth	%i3,	[%l7 + 0x4A]
	ldsw	[%l7 + 0x0C],	%l0
	ldsh	[%l7 + 0x64],	%g1
	fcmpgt32	%f6,	%f6,	%l1
	umul	%o5,	%g3,	%g7
	orn	%o0,	0x084E,	%i1
	movrne	%o6,	%g4,	%o2
	bshuffle	%f6,	%f10,	%f8
	andncc	%l6,	%o1,	%i5
	restore %i6, %o4, %g5
	fsrc2	%f6,	%f8
	umulcc	%l5,	0x005E,	%i2
	fone	%f14
	movcs	%icc,	%i0,	%o7
	stb	%l3,	[%l7 + 0x57]
	fmovd	%f4,	%f0
	fmovsl	%icc,	%f3,	%f3
	fmovdneg	%xcc,	%f14,	%f3
	movgu	%icc,	%g6,	%l4
	fsrc2	%f10,	%f12
	fpmerge	%f9,	%f13,	%f14
	andncc	%o3,	%i4,	%i7
	fsrc2	%f0,	%f2
	popc	%l2,	%g2
	movvc	%icc,	%l0,	%g1
	edge16l	%i3,	%l1,	%g3
	mulscc	%g7,	0x01CE,	%o0
	add	%i1,	%o6,	%o5
	save %o2, %g4, %o1
	movrgez	%i5,	0x119,	%i6
	and	%o4,	0x1FC1,	%l6
	umulcc	%g5,	0x1FAF,	%l5
	srax	%i0,	0x19,	%i2
	movgu	%xcc,	%o7,	%g6
	edge16ln	%l3,	%o3,	%i4
	edge8ln	%l4,	%i7,	%l2
	subccc	%l0,	0x19D4,	%g1
	sll	%i3,	0x1C,	%l1
	std	%f12,	[%l7 + 0x40]
	stx	%g2,	[%l7 + 0x08]
	movneg	%icc,	%g7,	%o0
	andn	%g3,	%o6,	%o5
	ldsh	[%l7 + 0x4E],	%o2
	edge8l	%i1,	%g4,	%o1
	fxnor	%f6,	%f4,	%f14
	fcmpeq32	%f12,	%f8,	%i6
	array32	%o4,	%i5,	%l6
	fmovdvs	%xcc,	%f2,	%f4
	orn	%g5,	0x0855,	%l5
	addc	%i0,	%i2,	%o7
	udiv	%l3,	0x1948,	%o3
	restore %g6, %l4, %i7
	sethi	0x06FF,	%i4
	movrlz	%l2,	%l0,	%g1
	srax	%l1,	%i3,	%g2
	fmul8x16al	%f3,	%f3,	%f2
	movrne	%o0,	%g7,	%o6
	xor	%o5,	%o2,	%i1
	srlx	%g4,	0x07,	%o1
	add	%g3,	%o4,	%i5
	edge32n	%l6,	%g5,	%l5
	ldx	[%l7 + 0x38],	%i0
	fmovrdgz	%i6,	%f14,	%f12
	edge8n	%i2,	%o7,	%l3
	fmovdg	%icc,	%f13,	%f11
	ldsw	[%l7 + 0x7C],	%g6
	fcmpeq32	%f6,	%f0,	%o3
	subc	%i7,	0x031E,	%l4
	movg	%icc,	%i4,	%l0
	addcc	%l2,	0x067B,	%l1
	srl	%i3,	0x13,	%g2
	fmovdvs	%icc,	%f15,	%f10
	add	%o0,	0x1097,	%g7
	movrlez	%o6,	%g1,	%o5
	lduw	[%l7 + 0x30],	%i1
	edge32	%o2,	%g4,	%o1
	ldsw	[%l7 + 0x4C],	%o4
	fmovrdlz	%g3,	%f2,	%f6
	smul	%i5,	0x0CB3,	%l6
	orn	%g5,	%i0,	%l5
	fpadd16s	%f2,	%f14,	%f9
	smul	%i6,	%o7,	%i2
	fmul8sux16	%f6,	%f10,	%f10
	fsrc2	%f14,	%f4
	movg	%xcc,	%g6,	%l3
	movrgz	%i7,	0x203,	%l4
	ldub	[%l7 + 0x0F],	%o3
	mova	%xcc,	%i4,	%l0
	fcmpeq32	%f12,	%f6,	%l1
	edge16ln	%l2,	%i3,	%o0
	edge32	%g7,	%o6,	%g1
	fpsub16s	%f7,	%f15,	%f4
	andncc	%g2,	%o5,	%o2
	sdivcc	%i1,	0x0C81,	%o1
	xorcc	%g4,	%o4,	%g3
	st	%f14,	[%l7 + 0x74]
	edge16n	%l6,	%g5,	%i0
	edge32	%l5,	%i6,	%o7
	movrgez	%i5,	0x378,	%i2
	faligndata	%f8,	%f8,	%f14
	popc	0x0BF2,	%l3
	movcc	%icc,	%g6,	%i7
	sth	%o3,	[%l7 + 0x48]
	addcc	%l4,	%l0,	%l1
	srax	%i4,	0x00,	%l2
	edge16l	%i3,	%o0,	%g7
	edge32ln	%o6,	%g1,	%g2
	umulcc	%o5,	%o2,	%i1
	sll	%o1,	%g4,	%o4
	ldsb	[%l7 + 0x3C],	%g3
	mova	%xcc,	%g5,	%l6
	srl	%l5,	%i0,	%i6
	movneg	%icc,	%o7,	%i2
	xnor	%i5,	%l3,	%g6
	srlx	%i7,	%o3,	%l4
	popc	%l0,	%i4
	fcmpne32	%f0,	%f0,	%l2
	and	%l1,	0x0818,	%i3
	stw	%g7,	[%l7 + 0x60]
	movl	%xcc,	%o6,	%o0
	array8	%g1,	%o5,	%o2
	fmovs	%f15,	%f13
	edge8ln	%g2,	%o1,	%g4
	umul	%o4,	%i1,	%g3
	edge8l	%g5,	%l6,	%i0
	ldd	[%l7 + 0x10],	%l4
	sethi	0x02F2,	%i6
	popc	0x0374,	%o7
	subcc	%i2,	0x1E16,	%i5
	fmovdneg	%icc,	%f5,	%f1
	fpadd16	%f2,	%f14,	%f10
	fsrc2s	%f11,	%f14
	addccc	%g6,	%i7,	%o3
	stb	%l4,	[%l7 + 0x54]
	ldsw	[%l7 + 0x70],	%l0
	edge32ln	%l3,	%i4,	%l1
	add	%l2,	0x15AA,	%i3
	lduh	[%l7 + 0x58],	%g7
	movvc	%xcc,	%o0,	%g1
	udivcc	%o6,	0x1E36,	%o2
	fcmpeq16	%f12,	%f10,	%o5
	fmovs	%f4,	%f11
	array16	%o1,	%g4,	%o4
	fand	%f12,	%f6,	%f14
	udivx	%g2,	0x000D,	%g3
	add	%i1,	%l6,	%g5
	and	%l5,	%i0,	%o7
	sdiv	%i2,	0x067A,	%i6
	std	%f8,	[%l7 + 0x30]
	sllx	%g6,	%i7,	%i5
	movl	%xcc,	%o3,	%l0
	movgu	%xcc,	%l3,	%i4
	popc	%l4,	%l2
	xnor	%i3,	0x0396,	%g7
	st	%f8,	[%l7 + 0x74]
	sth	%o0,	[%l7 + 0x16]
	fnands	%f5,	%f6,	%f2
	movrlez	%g1,	%o6,	%l1
	restore %o5, 0x1918, %o2
	movrgz	%o1,	%g4,	%g2
	sllx	%g3,	0x14,	%i1
	mulscc	%l6,	%o4,	%g5
	srl	%l5,	0x03,	%i0
	movl	%xcc,	%i2,	%i6
	stx	%g6,	[%l7 + 0x28]
	movcc	%xcc,	%i7,	%o7
	array32	%o3,	%l0,	%i5
	edge8	%i4,	%l3,	%l4
	fcmpgt16	%f8,	%f4,	%i3
	movcs	%xcc,	%l2,	%o0
	fmovsvc	%icc,	%f2,	%f12
	movrlez	%g7,	0x343,	%o6
	fornot2	%f8,	%f2,	%f6
	fornot2s	%f3,	%f4,	%f3
	orn	%l1,	%g1,	%o5
	pdist	%f10,	%f8,	%f10
	st	%f10,	[%l7 + 0x60]
	fmovdcc	%xcc,	%f8,	%f5
	lduh	[%l7 + 0x24],	%o2
	udivcc	%o1,	0x1D4D,	%g4
	ldsh	[%l7 + 0x2C],	%g2
	mova	%xcc,	%g3,	%i1
	subcc	%l6,	%g5,	%l5
	alignaddr	%i0,	%o4,	%i6
	sdivx	%g6,	0x0635,	%i2
	movl	%xcc,	%i7,	%o7
	fmovrse	%l0,	%f14,	%f7
	and	%o3,	0x0FC8,	%i5
	edge8ln	%i4,	%l3,	%i3
	fmovdcc	%icc,	%f3,	%f4
	ldsw	[%l7 + 0x54],	%l4
	edge16ln	%o0,	%l2,	%g7
	movl	%xcc,	%l1,	%o6
	edge32	%o5,	%o2,	%g1
	fmovrdgz	%g4,	%f8,	%f12
	orcc	%o1,	%g3,	%g2
	stx	%l6,	[%l7 + 0x48]
	xor	%g5,	0x1FB8,	%i1
	edge16n	%l5,	%i0,	%o4
	sub	%i6,	%g6,	%i7
	fandnot1s	%f5,	%f9,	%f11
	edge16ln	%i2,	%l0,	%o3
	move	%icc,	%o7,	%i5
	fmuld8sux16	%f7,	%f8,	%f0
	andncc	%l3,	%i4,	%i3
	fpackfix	%f4,	%f3
	and	%l4,	0x1742,	%o0
	array8	%g7,	%l2,	%l1
	subccc	%o6,	%o2,	%o5
	ldd	[%l7 + 0x48],	%f0
	movleu	%xcc,	%g4,	%o1
	array16	%g3,	%g1,	%l6
	lduh	[%l7 + 0x50],	%g2
	edge8l	%i1,	%l5,	%i0
	move	%icc,	%g5,	%i6
	fpack16	%f4,	%f15
	fmovrsgz	%g6,	%f12,	%f7
	siam	0x7
	save %o4, %i7, %i2
	ldsw	[%l7 + 0x60],	%l0
	edge8	%o3,	%o7,	%i5
	ld	[%l7 + 0x2C],	%f2
	movvs	%xcc,	%i4,	%l3
	srax	%l4,	%i3,	%g7
	fnot1	%f4,	%f0
	movneg	%icc,	%l2,	%o0
	save %l1, %o2, %o5
	lduw	[%l7 + 0x70],	%g4
	fmovsge	%xcc,	%f1,	%f13
	sdivcc	%o1,	0x049D,	%g3
	edge16	%g1,	%o6,	%l6
	udiv	%g2,	0x0B39,	%i1
	xnorcc	%i0,	0x1679,	%l5
	xnorcc	%i6,	0x0C74,	%g5
	fmovdneg	%xcc,	%f8,	%f3
	sub	%g6,	%o4,	%i2
	fmovse	%icc,	%f7,	%f3
	add	%l0,	%i7,	%o7
	mulscc	%o3,	0x16BE,	%i5
	movrgz	%i4,	%l4,	%i3
	edge16n	%g7,	%l3,	%l2
	fmovde	%icc,	%f8,	%f3
	stb	%l1,	[%l7 + 0x2A]
	ldd	[%l7 + 0x70],	%f2
	orcc	%o2,	%o5,	%g4
	fzeros	%f9
	edge16l	%o0,	%g3,	%g1
	lduh	[%l7 + 0x7E],	%o1
	array8	%o6,	%g2,	%i1
	xor	%i0,	0x0EA1,	%l5
	fmovrde	%i6,	%f8,	%f8
	subcc	%g5,	%l6,	%g6
	alignaddr	%o4,	%l0,	%i2
	movpos	%icc,	%i7,	%o3
	fmuld8ulx16	%f7,	%f4,	%f0
	sth	%i5,	[%l7 + 0x30]
	fmovrsne	%o7,	%f2,	%f12
	ldsh	[%l7 + 0x3C],	%i4
	ldd	[%l7 + 0x78],	%f6
	stw	%i3,	[%l7 + 0x44]
	movpos	%icc,	%l4,	%l3
	fmovsl	%icc,	%f1,	%f11
	edge32n	%g7,	%l1,	%o2
	lduh	[%l7 + 0x6E],	%l2
	movleu	%icc,	%g4,	%o0
	movneg	%xcc,	%o5,	%g1
	smulcc	%g3,	%o6,	%o1
	fmovdneg	%icc,	%f13,	%f10
	edge32ln	%g2,	%i0,	%l5
	mulscc	%i6,	%i1,	%l6
	fzeros	%f12
	udiv	%g5,	0x1E69,	%g6
	movrgez	%o4,	0x140,	%i2
	srlx	%l0,	%i7,	%i5
	movcc	%xcc,	%o3,	%i4
	edge16ln	%o7,	%i3,	%l3
	subccc	%l4,	%l1,	%o2
	sdivcc	%l2,	0x012B,	%g4
	movneg	%icc,	%o0,	%g7
	fpadd32	%f14,	%f8,	%f14
	edge32	%g1,	%o5,	%o6
	xnorcc	%g3,	0x0399,	%o1
	sth	%g2,	[%l7 + 0x36]
	mulx	%l5,	0x023D,	%i0
	mulscc	%i6,	%i1,	%l6
	umul	%g5,	0x13AC,	%o4
	fxor	%f2,	%f8,	%f4
	movpos	%xcc,	%i2,	%g6
	siam	0x6
	ldd	[%l7 + 0x30],	%i6
	movre	%l0,	%i5,	%i4
	umulcc	%o7,	0x01EA,	%o3
	restore %l3, %l4, %i3
	movle	%xcc,	%l1,	%o2
	ld	[%l7 + 0x2C],	%f9
	edge16l	%g4,	%o0,	%g7
	fmovsneg	%xcc,	%f6,	%f12
	movgu	%icc,	%g1,	%l2
	edge32l	%o6,	%o5,	%g3
	movpos	%icc,	%o1,	%l5
	edge32ln	%i0,	%g2,	%i1
	sll	%l6,	0x11,	%i6
	ldsh	[%l7 + 0x5E],	%o4
	movrlez	%i2,	0x1F8,	%g6
	fcmpes	%fcc0,	%f14,	%f1
	ldx	[%l7 + 0x48],	%g5
	alignaddr	%i7,	%i5,	%l0
	fcmple32	%f4,	%f2,	%i4
	edge8	%o7,	%l3,	%l4
	ldd	[%l7 + 0x28],	%i2
	move	%icc,	%l1,	%o3
	sub	%g4,	%o2,	%o0
	stw	%g7,	[%l7 + 0x48]
	stb	%l2,	[%l7 + 0x37]
	srl	%g1,	%o5,	%g3
	ld	[%l7 + 0x44],	%f14
	stx	%o1,	[%l7 + 0x28]
	movle	%icc,	%o6,	%i0
	movrne	%l5,	0x1D6,	%i1
	st	%f5,	[%l7 + 0x6C]
	orcc	%l6,	0x1BE0,	%g2
	fmovdpos	%xcc,	%f11,	%f11
	and	%i6,	0x078E,	%i2
	ldsw	[%l7 + 0x08],	%g6
	add	%g5,	%i7,	%i5
	movrne	%l0,	%o4,	%i4
	popc	%o7,	%l4
	movvc	%icc,	%i3,	%l1
	edge32l	%l3,	%o3,	%o2
	movvc	%icc,	%g4,	%g7
	movge	%xcc,	%l2,	%g1
	fabsd	%f4,	%f14
	movn	%xcc,	%o5,	%o0
	fnot2	%f14,	%f14
	movneg	%icc,	%g3,	%o1
	fornot2	%f0,	%f4,	%f0
	fmovsg	%icc,	%f14,	%f10
	std	%f6,	[%l7 + 0x08]
	fpadd32	%f4,	%f4,	%f14
	fcmpne16	%f4,	%f10,	%o6
	movrlez	%i0,	%i1,	%l6
	fandnot2s	%f7,	%f11,	%f8
	movneg	%xcc,	%l5,	%i6
	sdiv	%g2,	0x1684,	%g6
	ldx	[%l7 + 0x60],	%g5
	sllx	%i2,	0x16,	%i7
	sdivx	%i5,	0x0288,	%o4
	edge32ln	%i4,	%l0,	%o7
	movgu	%xcc,	%l4,	%l1
	fmovsne	%xcc,	%f3,	%f13
	movrlz	%i3,	%o3,	%o2
	ldub	[%l7 + 0x43],	%g4
	ldsb	[%l7 + 0x50],	%g7
	move	%xcc,	%l2,	%g1
	xorcc	%l3,	%o5,	%o0
	fmovrdlz	%o1,	%f12,	%f0
	subc	%g3,	%i0,	%i1
	subcc	%l6,	%l5,	%o6
	std	%f4,	[%l7 + 0x60]
	srax	%i6,	0x01,	%g6
	or	%g5,	%i2,	%g2
	and	%i5,	%i7,	%o4
	fandnot2	%f8,	%f10,	%f8
	alignaddr	%i4,	%l0,	%l4
	lduh	[%l7 + 0x42],	%o7
	movrgez	%l1,	0x198,	%i3
	popc	%o2,	%g4
	save %o3, %g7, %l2
	sub	%l3,	0x0C93,	%o5
	edge16ln	%g1,	%o1,	%g3
	movcc	%icc,	%i0,	%i1
	ld	[%l7 + 0x34],	%f9
	lduh	[%l7 + 0x76],	%o0
	andcc	%l6,	%l5,	%o6
	orn	%i6,	%g5,	%g6
	move	%xcc,	%g2,	%i2
	lduw	[%l7 + 0x2C],	%i5
	srl	%i7,	0x1C,	%i4
	fpadd32s	%f5,	%f8,	%f13
	movpos	%xcc,	%o4,	%l4
	umul	%l0,	0x1BD8,	%o7
	std	%f0,	[%l7 + 0x58]
	smul	%l1,	0x0EA4,	%i3
	ldd	[%l7 + 0x58],	%o2
	mulscc	%o3,	%g4,	%g7
	edge8l	%l3,	%l2,	%o5
	udivx	%o1,	0x1BE7,	%g3
	edge16l	%i0,	%g1,	%o0
	movrgz	%l6,	0x046,	%l5
	stw	%o6,	[%l7 + 0x7C]
	mova	%xcc,	%i1,	%i6
	movpos	%icc,	%g6,	%g5
	umulcc	%g2,	0x01EE,	%i5
	movvs	%icc,	%i7,	%i2
	umulcc	%o4,	0x0BCB,	%i4
	edge8	%l0,	%o7,	%l1
	movneg	%icc,	%l4,	%o2
	subcc	%o3,	%i3,	%g7
	srax	%l3,	%l2,	%g4
	std	%f4,	[%l7 + 0x20]
	fxnors	%f2,	%f8,	%f5
	lduh	[%l7 + 0x60],	%o5
	srl	%o1,	0x04,	%g3
	fmul8ulx16	%f6,	%f0,	%f12
	array16	%i0,	%g1,	%l6
	st	%f1,	[%l7 + 0x14]
	faligndata	%f4,	%f12,	%f14
	umulcc	%l5,	0x0773,	%o0
	orcc	%i1,	0x0BCE,	%o6
	edge8ln	%g6,	%i6,	%g2
	movvs	%icc,	%i5,	%i7
	addcc	%i2,	%o4,	%g5
	edge32ln	%l0,	%i4,	%o7
	array16	%l1,	%l4,	%o2
	sra	%i3,	%g7,	%o3
	st	%f0,	[%l7 + 0x48]
	subc	%l3,	0x1478,	%g4
	fmovdleu	%icc,	%f0,	%f12
	movcc	%icc,	%l2,	%o5
	orn	%o1,	%g3,	%g1
	movg	%icc,	%i0,	%l5
	sllx	%o0,	0x00,	%l6
	array16	%i1,	%g6,	%o6
	movgu	%xcc,	%g2,	%i6
	movcc	%icc,	%i7,	%i5
	movrgz	%o4,	%g5,	%i2
	movcs	%xcc,	%i4,	%l0
	mulscc	%l1,	%o7,	%l4
	fzero	%f10
	ldx	[%l7 + 0x38],	%i3
	sdivcc	%g7,	0x1E2D,	%o3
	fmul8ulx16	%f6,	%f10,	%f0
	movvs	%xcc,	%l3,	%g4
	sra	%l2,	%o5,	%o1
	addccc	%g3,	0x0157,	%g1
	movcs	%icc,	%o2,	%l5
	sub	%o0,	0x0DF1,	%l6
	movge	%icc,	%i0,	%g6
	udiv	%i1,	0x1C39,	%o6
	movvc	%xcc,	%i6,	%g2
	stx	%i7,	[%l7 + 0x28]
	lduh	[%l7 + 0x4A],	%i5
	edge8n	%o4,	%i2,	%i4
	movg	%icc,	%g5,	%l1
	ld	[%l7 + 0x50],	%f10
	edge8l	%o7,	%l0,	%l4
	edge8l	%g7,	%o3,	%l3
	andncc	%i3,	%g4,	%l2
	movrlez	%o5,	0x045,	%o1
	movpos	%icc,	%g3,	%o2
	movgu	%xcc,	%g1,	%l5
	addc	%l6,	%i0,	%g6
	fmovdvc	%xcc,	%f10,	%f3
	xor	%i1,	0x18AD,	%o6
	std	%f4,	[%l7 + 0x50]
	alignaddrl	%i6,	%o0,	%g2
	fxors	%f9,	%f15,	%f2
	movg	%xcc,	%i7,	%i5
	fnand	%f0,	%f10,	%f8
	movrgez	%i2,	%i4,	%g5
	fcmpd	%fcc1,	%f2,	%f2
	move	%xcc,	%l1,	%o7
	save %o4, 0x1890, %l0
	movle	%icc,	%g7,	%o3
	movle	%icc,	%l3,	%l4
	fmovdg	%icc,	%f15,	%f11
	subc	%g4,	0x1BC0,	%i3
	movleu	%xcc,	%o5,	%l2
	movne	%xcc,	%o1,	%o2
	edge8n	%g3,	%l5,	%l6
	array32	%g1,	%g6,	%i1
	edge16ln	%i0,	%i6,	%o0
	ldsh	[%l7 + 0x3E],	%g2
	fmovdgu	%icc,	%f8,	%f14
	fmuld8ulx16	%f1,	%f2,	%f4
	movrne	%i7,	%i5,	%o6
	movl	%icc,	%i2,	%i4
	sdivx	%g5,	0x0ABC,	%l1
	fmovdge	%icc,	%f15,	%f4
	movrne	%o7,	0x325,	%o4
	ldsb	[%l7 + 0x18],	%l0
	udivx	%g7,	0x16AA,	%o3
	fexpand	%f4,	%f2
	srax	%l3,	%l4,	%i3
	and	%g4,	%o5,	%o1
	subccc	%l2,	%g3,	%l5
	and	%o2,	%l6,	%g1
	movrlz	%i1,	%i0,	%i6
	fzero	%f2
	ldd	[%l7 + 0x78],	%o0
	movleu	%icc,	%g6,	%i7
	fmovdvc	%icc,	%f1,	%f12
	move	%icc,	%g2,	%o6
	sth	%i2,	[%l7 + 0x60]
	subc	%i4,	0x0FD1,	%g5
	edge32l	%l1,	%i5,	%o7
	ldx	[%l7 + 0x08],	%o4
	edge16	%l0,	%g7,	%l3
	fmovdpos	%icc,	%f7,	%f0
	fmovdneg	%icc,	%f0,	%f13
	sll	%o3,	%l4,	%g4
	fmovrse	%o5,	%f9,	%f13
	xnorcc	%i3,	%o1,	%l2
	subc	%g3,	%l5,	%o2
	fpackfix	%f2,	%f14
	movneg	%xcc,	%g1,	%i1
	fzeros	%f1
	ld	[%l7 + 0x3C],	%f9
	orn	%i0,	%l6,	%i6
	restore %g6, 0x1A92, %o0
	array16	%i7,	%g2,	%i2
	fmovdl	%icc,	%f10,	%f7
	orncc	%o6,	%g5,	%l1
	ld	[%l7 + 0x60],	%f6
	edge16ln	%i5,	%o7,	%i4
	sllx	%l0,	0x1D,	%g7
	movg	%icc,	%l3,	%o4
	stw	%l4,	[%l7 + 0x7C]
	lduw	[%l7 + 0x1C],	%g4
	umul	%o3,	%i3,	%o1
	orn	%o5,	%g3,	%l2
	sdiv	%o2,	0x0F63,	%g1
	edge16n	%i1,	%i0,	%l5
	movrlez	%i6,	%g6,	%o0
	addc	%l6,	0x0F38,	%i7
	alignaddr	%i2,	%g2,	%g5
	andncc	%l1,	%i5,	%o6
	edge32	%i4,	%o7,	%g7
	fcmpeq32	%f4,	%f10,	%l3
	orcc	%o4,	0x166A,	%l0
	orncc	%g4,	0x0EC7,	%o3
	movrlz	%l4,	%i3,	%o5
	fmuld8sux16	%f8,	%f11,	%f12
	subc	%g3,	0x1C8A,	%l2
	smulcc	%o2,	%g1,	%o1
	sdiv	%i0,	0x14AD,	%l5
	fnot1s	%f3,	%f1
	sllx	%i1,	0x1F,	%i6
	movrlez	%o0,	0x1A7,	%l6
	movvs	%icc,	%i7,	%g6
	movcs	%icc,	%i2,	%g2
	array16	%l1,	%i5,	%o6
	fmovde	%xcc,	%f14,	%f6
	mulx	%g5,	0x1EB9,	%o7
	ldub	[%l7 + 0x74],	%i4
	std	%f10,	[%l7 + 0x28]
	movle	%icc,	%g7,	%o4
	andncc	%l3,	%g4,	%l0
	fmovrse	%o3,	%f6,	%f4
	lduw	[%l7 + 0x40],	%i3
	movpos	%icc,	%o5,	%l4
	fmovdcs	%xcc,	%f4,	%f1
	smul	%l2,	%o2,	%g3
	fmovdgu	%xcc,	%f8,	%f11
	ldsw	[%l7 + 0x1C],	%g1
	fmovspos	%xcc,	%f6,	%f2
	restore %o1, 0x026A, %i0
	fnegd	%f2,	%f6
	mova	%xcc,	%l5,	%i6
	move	%xcc,	%i1,	%l6
	fpsub32s	%f13,	%f6,	%f14
	movcc	%xcc,	%o0,	%i7
	ldsw	[%l7 + 0x44],	%g6
	edge16l	%i2,	%g2,	%i5
	orn	%l1,	0x1173,	%g5
	umul	%o6,	0x108F,	%i4
	edge8	%o7,	%g7,	%o4
	movrne	%g4,	%l3,	%l0
	sdiv	%o3,	0x0734,	%i3
	movl	%xcc,	%o5,	%l2
	faligndata	%f10,	%f4,	%f2
	fmovrdlez	%l4,	%f14,	%f8
	srax	%o2,	%g3,	%g1
	and	%i0,	0x0A4C,	%o1
	srlx	%l5,	0x10,	%i6
	movrlz	%l6,	0x3E0,	%o0
	fmovdle	%icc,	%f10,	%f11
	movcc	%xcc,	%i7,	%i1
	sll	%g6,	0x0F,	%g2
	xnorcc	%i5,	0x1357,	%l1
	and	%i2,	%o6,	%g5
	fcmpeq16	%f8,	%f4,	%o7
	subccc	%g7,	%i4,	%o4
	edge8l	%l3,	%l0,	%o3
	ldd	[%l7 + 0x28],	%i2
	edge32	%g4,	%o5,	%l2
	array16	%o2,	%l4,	%g1
	ldd	[%l7 + 0x50],	%g2
	addccc	%i0,	%l5,	%i6
	umul	%l6,	0x09B8,	%o1
	lduw	[%l7 + 0x68],	%o0
	fxor	%f2,	%f4,	%f4
	sub	%i1,	0x05BE,	%g6
	movrne	%i7,	0x380,	%g2
	andncc	%l1,	%i2,	%i5
	stw	%o6,	[%l7 + 0x1C]
	movpos	%icc,	%o7,	%g5
	movrne	%i4,	0x050,	%o4
	umul	%l3,	0x1910,	%g7
	edge32	%o3,	%l0,	%i3
	movl	%xcc,	%g4,	%l2
	ldsb	[%l7 + 0x49],	%o2
	fmovscc	%icc,	%f2,	%f11
	edge8n	%o5,	%l4,	%g3
	fcmpeq32	%f4,	%f4,	%g1
	ldd	[%l7 + 0x78],	%f8
	srl	%i0,	0x07,	%i6
	xorcc	%l5,	%l6,	%o1
	fmovdneg	%xcc,	%f0,	%f1
	orcc	%i1,	0x1AD1,	%o0
	stx	%i7,	[%l7 + 0x08]
	fnegd	%f14,	%f12
	mulscc	%g2,	0x11A4,	%l1
	movrlez	%i2,	%i5,	%o6
	array32	%g6,	%g5,	%i4
	bshuffle	%f4,	%f2,	%f4
	movg	%xcc,	%o7,	%l3
	fornot1s	%f7,	%f11,	%f14
	srl	%g7,	%o3,	%l0
	srlx	%i3,	%o4,	%l2
	umulcc	%g4,	0x1D2D,	%o2
	orcc	%o5,	0x0D4C,	%l4
	ldsw	[%l7 + 0x58],	%g1
	fnot2	%f14,	%f8
	array32	%g3,	%i0,	%l5
	movn	%xcc,	%i6,	%o1
	orncc	%l6,	%o0,	%i7
	ld	[%l7 + 0x58],	%f5
	and	%g2,	0x0302,	%i1
	addcc	%l1,	%i5,	%o6
	movrne	%g6,	0x38F,	%i2
	fands	%f11,	%f6,	%f15
	sethi	0x0DB9,	%i4
	xnorcc	%g5,	0x1B42,	%o7
	andn	%l3,	%g7,	%o3
	st	%f8,	[%l7 + 0x14]
	mulx	%i3,	0x18DE,	%l0
	orn	%l2,	0x1C51,	%o4
	fmovdl	%xcc,	%f4,	%f4
	bshuffle	%f10,	%f8,	%f12
	movcc	%xcc,	%o2,	%o5
	sllx	%g4,	%g1,	%g3
	edge8n	%l4,	%i0,	%i6
	xnorcc	%o1,	%l5,	%l6
	ldsb	[%l7 + 0x5E],	%i7
	lduw	[%l7 + 0x50],	%g2
	fpack16	%f10,	%f14
	edge32	%i1,	%l1,	%o0
	sdivcc	%o6,	0x1B3F,	%g6
	edge8	%i2,	%i5,	%g5
	st	%f7,	[%l7 + 0x34]
	movrgez	%o7,	%l3,	%i4
	lduw	[%l7 + 0x64],	%g7
	edge8n	%i3,	%l0,	%l2
	edge16	%o4,	%o3,	%o5
	edge8n	%o2,	%g1,	%g4
	fcmpne32	%f14,	%f0,	%g3
	fmovsg	%xcc,	%f5,	%f11
	move	%icc,	%l4,	%i6
	fcmpeq32	%f0,	%f12,	%i0
	xor	%l5,	0x0E1C,	%o1
	lduh	[%l7 + 0x68],	%l6
	xorcc	%i7,	0x17D8,	%i1
	sll	%l1,	%g2,	%o6
	fmovde	%xcc,	%f1,	%f2
	sra	%o0,	%i2,	%i5
	xnor	%g6,	%g5,	%l3
	fand	%f10,	%f12,	%f0
	fmuld8ulx16	%f4,	%f11,	%f8
	fmovdg	%icc,	%f11,	%f14
	movpos	%xcc,	%o7,	%g7
	smul	%i3,	0x1773,	%i4
	orn	%l2,	%o4,	%o3
	movgu	%icc,	%o5,	%o2
	or	%g1,	%g4,	%g3
	movvc	%xcc,	%l4,	%i6
	mova	%xcc,	%l0,	%i0
	save %l5, 0x1BE1, %l6
	std	%f14,	[%l7 + 0x10]
	edge16ln	%i7,	%o1,	%i1
	edge8ln	%g2,	%l1,	%o6
	subccc	%o0,	%i2,	%g6
	fmovsa	%xcc,	%f15,	%f12
	udiv	%i5,	0x004B,	%g5
	movrne	%l3,	%o7,	%i3
	edge16n	%g7,	%i4,	%o4
	srlx	%o3,	%o5,	%o2
	fpsub32	%f10,	%f12,	%f14
	ldd	[%l7 + 0x48],	%f2
	fmovd	%f4,	%f12
	sub	%g1,	%g4,	%l2
	fpsub32	%f10,	%f6,	%f0
	udivx	%l4,	0x153F,	%i6
	subc	%l0,	%g3,	%i0
	subcc	%l5,	0x0C45,	%i7
	array32	%l6,	%o1,	%g2
	umul	%i1,	%l1,	%o0
	fpsub32s	%f8,	%f3,	%f12
	stx	%i2,	[%l7 + 0x40]
	fmovdcc	%xcc,	%f15,	%f5
	sethi	0x01DF,	%g6
	edge8	%o6,	%g5,	%i5
	fmovsne	%xcc,	%f6,	%f15
	xnor	%l3,	%o7,	%g7
	sra	%i3,	0x00,	%o4
	sub	%o3,	0x1DFE,	%i4
	xor	%o5,	0x135D,	%o2
	ldub	[%l7 + 0x26],	%g4
	array16	%l2,	%g1,	%l4
	movpos	%icc,	%l0,	%i6
	udiv	%g3,	0x0E29,	%i0
	fsrc1	%f2,	%f4
	xorcc	%i7,	%l6,	%l5
	sdivcc	%g2,	0x0D79,	%o1
	movg	%xcc,	%i1,	%l1
	edge8n	%o0,	%i2,	%g6
	edge8l	%g5,	%i5,	%o6
	udivcc	%l3,	0x1DB0,	%g7
	movcs	%xcc,	%o7,	%i3
	edge32ln	%o4,	%o3,	%i4
	xorcc	%o5,	0x1BA8,	%o2
	edge16n	%l2,	%g1,	%l4
	smulcc	%l0,	0x18DE,	%i6
	movn	%icc,	%g3,	%i0
	mulscc	%g4,	0x0513,	%l6
	movleu	%icc,	%i7,	%g2
	fnand	%f0,	%f6,	%f6
	fmul8x16al	%f6,	%f8,	%f10
	stw	%l5,	[%l7 + 0x44]
	movne	%xcc,	%o1,	%i1
	andn	%l1,	0x1A3C,	%o0
	st	%f7,	[%l7 + 0x08]
	std	%f0,	[%l7 + 0x10]
	srax	%i2,	%g6,	%i5
	movg	%xcc,	%o6,	%g5
	addcc	%g7,	%o7,	%l3
	sethi	0x0F36,	%o4
	fmovrsgz	%i3,	%f15,	%f10
	movg	%xcc,	%i4,	%o3
	movcs	%icc,	%o5,	%l2
	xor	%o2,	%l4,	%l0
	edge16l	%i6,	%g3,	%i0
	smulcc	%g1,	0x17DF,	%g4
	udiv	%i7,	0x16E6,	%g2
	fpmerge	%f8,	%f15,	%f8
	srax	%l5,	%o1,	%l6
	edge16n	%l1,	%i1,	%i2
	edge32l	%g6,	%i5,	%o6
	edge32ln	%o0,	%g5,	%o7
	edge8l	%g7,	%o4,	%i3
	udivx	%l3,	0x06EC,	%i4
	alignaddrl	%o5,	%l2,	%o3
	edge8	%l4,	%o2,	%i6
	save %g3, 0x10BF, %l0
	sdivcc	%g1,	0x075A,	%i0
	ldsh	[%l7 + 0x7C],	%g4
	subc	%i7,	0x0897,	%l5
	stx	%g2,	[%l7 + 0x08]
	move	%xcc,	%l6,	%l1
	fexpand	%f2,	%f0
	mulx	%i1,	0x0D01,	%i2
	popc	%g6,	%i5
	fornot1	%f12,	%f14,	%f14
	sllx	%o6,	%o0,	%g5
	movpos	%icc,	%o7,	%o1
	ldx	[%l7 + 0x20],	%o4
	orn	%g7,	%l3,	%i4
	edge8ln	%o5,	%i3,	%l2
	movn	%icc,	%l4,	%o2
	edge16	%i6,	%o3,	%l0
	orn	%g1,	0x0F77,	%g3
	ldsw	[%l7 + 0x50],	%i0
	sth	%g4,	[%l7 + 0x1E]
	movvc	%xcc,	%l5,	%i7
	fornot2s	%f0,	%f12,	%f7
	movle	%icc,	%l6,	%l1
	fnegs	%f15,	%f6
	edge16n	%i1,	%g2,	%i2
	ldub	[%l7 + 0x49],	%i5
	edge8l	%g6,	%o0,	%o6
	sth	%g5,	[%l7 + 0x7C]
	fandnot1s	%f2,	%f6,	%f12
	mova	%xcc,	%o1,	%o4
	lduh	[%l7 + 0x7E],	%g7
	sll	%l3,	%o7,	%o5
	fnands	%f2,	%f1,	%f10
	ldx	[%l7 + 0x20],	%i3
	array16	%i4,	%l4,	%o2
	alignaddr	%i6,	%o3,	%l0
	addc	%l2,	0x029B,	%g1
	ldx	[%l7 + 0x10],	%i0
	move	%icc,	%g3,	%l5
	movge	%icc,	%i7,	%l6
	movleu	%xcc,	%g4,	%l1
	fpackfix	%f10,	%f15
	fpsub16s	%f13,	%f15,	%f8
	movvc	%icc,	%i1,	%i2
	fmovdgu	%xcc,	%f2,	%f14
	smulcc	%i5,	%g2,	%o0
	subcc	%o6,	%g6,	%g5
	udivcc	%o4,	0x11D0,	%g7
	lduw	[%l7 + 0x54],	%l3
	edge8	%o1,	%o5,	%o7
	ldx	[%l7 + 0x68],	%i3
	addcc	%i4,	%l4,	%o2
	fpadd16	%f6,	%f8,	%f0
	ld	[%l7 + 0x54],	%f7
	mulscc	%o3,	0x1869,	%i6
	and	%l0,	0x10FD,	%l2
	movleu	%icc,	%g1,	%g3
	udiv	%i0,	0x0ADD,	%l5
	movcc	%icc,	%l6,	%i7
	array16	%g4,	%l1,	%i1
	fmul8ulx16	%f12,	%f6,	%f12
	sra	%i5,	0x14,	%g2
	ldsb	[%l7 + 0x63],	%o0
	xnor	%o6,	%i2,	%g6
	fpackfix	%f6,	%f14
	xnorcc	%g5,	0x1216,	%o4
	umul	%l3,	%o1,	%o5
	srax	%o7,	0x03,	%i3
	udivcc	%g7,	0x07A7,	%l4
	subccc	%o2,	%o3,	%i6
	movleu	%icc,	%i4,	%l0
	fxor	%f4,	%f4,	%f4
	array8	%l2,	%g1,	%i0
	sdivx	%l5,	0x163A,	%l6
	umul	%i7,	%g3,	%g4
	mulx	%l1,	0x1437,	%i1
	fornot2s	%f8,	%f14,	%f5
	movvc	%icc,	%i5,	%g2
	srlx	%o6,	%i2,	%g6
	ldd	[%l7 + 0x38],	%f14
	popc	%g5,	%o0
	siam	0x2
	sdivcc	%o4,	0x1445,	%o1
	restore %o5, 0x0BDB, %l3
	sth	%o7,	[%l7 + 0x2A]
	movcs	%icc,	%i3,	%g7
	andcc	%o2,	%l4,	%o3
	fcmpgt16	%f8,	%f4,	%i6
	edge32n	%l0,	%l2,	%g1
	ldsw	[%l7 + 0x74],	%i4
	fnot2	%f0,	%f6
	fmul8x16au	%f14,	%f2,	%f14
	edge8n	%l5,	%i0,	%i7
	movge	%xcc,	%g3,	%l6
	fnot1	%f4,	%f12
	addc	%g4,	%l1,	%i1
	sdivx	%g2,	0x05F0,	%o6
	fmovrsgz	%i5,	%f11,	%f5
	fpsub32	%f12,	%f10,	%f0
	edge32l	%i2,	%g6,	%g5
	lduh	[%l7 + 0x16],	%o0
	edge16l	%o4,	%o5,	%o1
	edge8n	%l3,	%o7,	%g7
	ldsh	[%l7 + 0x12],	%i3
	movvs	%icc,	%l4,	%o2
	edge8l	%i6,	%o3,	%l2
	fcmpes	%fcc0,	%f14,	%f11
	ldsb	[%l7 + 0x17],	%l0
	fandnot1	%f8,	%f2,	%f4
	movrlz	%g1,	%l5,	%i0
	ldub	[%l7 + 0x53],	%i4
	alignaddr	%g3,	%i7,	%l6
	movpos	%icc,	%l1,	%i1
	xnor	%g2,	%o6,	%g4
	ldx	[%l7 + 0x78],	%i5
	edge8	%g6,	%g5,	%o0
	ldsh	[%l7 + 0x6C],	%o4
	movrgez	%i2,	0x066,	%o5
	fpadd32s	%f8,	%f1,	%f5
	fmovsle	%icc,	%f8,	%f0
	movre	%o1,	0x061,	%l3
	srax	%o7,	%i3,	%l4
	for	%f12,	%f2,	%f8
	movle	%icc,	%o2,	%i6
	movneg	%icc,	%g7,	%l2
	sub	%o3,	0x0C67,	%l0
	edge8	%g1,	%l5,	%i4
	movrgz	%i0,	%i7,	%l6
	movcs	%xcc,	%l1,	%g3
	movl	%icc,	%g2,	%o6
	smul	%g4,	0x0CBB,	%i1
	array16	%g6,	%g5,	%o0
	udivcc	%o4,	0x1132,	%i2
	umulcc	%i5,	%o5,	%o1
	fmovd	%f0,	%f4
	fmovdvc	%icc,	%f4,	%f0
	xnorcc	%o7,	0x0C64,	%l3
	movrgz	%l4,	0x1EF,	%i3
	fabss	%f8,	%f12
	ldsw	[%l7 + 0x40],	%o2
	for	%f8,	%f12,	%f2
	movge	%icc,	%i6,	%l2
	orn	%o3,	%g7,	%l0
	movcc	%icc,	%l5,	%g1
	fzeros	%f7
	fsrc1	%f8,	%f12
	andcc	%i0,	%i7,	%i4
	ldd	[%l7 + 0x28],	%l0
	st	%f14,	[%l7 + 0x08]
	stx	%g3,	[%l7 + 0x58]
	sdiv	%g2,	0x14B3,	%l6
	alignaddr	%o6,	%i1,	%g4
	edge16	%g5,	%o0,	%o4
	sdiv	%i2,	0x0795,	%i5
	fcmpd	%fcc3,	%f0,	%f8
	addc	%o5,	0x0660,	%g6
	edge16l	%o1,	%l3,	%o7
	edge32n	%l4,	%i3,	%o2
	fnands	%f5,	%f5,	%f1
	movle	%icc,	%i6,	%l2
	umulcc	%g7,	0x1C9D,	%l0
	sll	%l5,	0x17,	%o3
	fcmple32	%f2,	%f10,	%i0
	sethi	0x18B1,	%g1
	move	%xcc,	%i7,	%l1
	movrgez	%i4,	0x057,	%g2
	movge	%icc,	%l6,	%g3
	fmuld8sux16	%f5,	%f0,	%f12
	st	%f0,	[%l7 + 0x24]
	srax	%i1,	%g4,	%g5
	xnorcc	%o0,	0x171A,	%o6
	fmovsvc	%xcc,	%f6,	%f1
	fnand	%f8,	%f8,	%f12
	movne	%xcc,	%i2,	%o4
	movne	%icc,	%o5,	%i5
	movg	%icc,	%o1,	%g6
	ldsw	[%l7 + 0x14],	%o7
	fnor	%f2,	%f4,	%f12
	srax	%l4,	0x0E,	%i3
	edge32n	%l3,	%i6,	%o2
	fpadd16	%f4,	%f12,	%f6
	addccc	%l2,	0x1778,	%l0
	andn	%g7,	%l5,	%i0
	xorcc	%g1,	0x1950,	%i7
	umul	%l1,	%o3,	%g2
	udiv	%i4,	0x0A68,	%g3
	fornot1s	%f2,	%f3,	%f9
	andcc	%l6,	%g4,	%g5
	sllx	%o0,	0x11,	%i1
	udivcc	%o6,	0x0C1A,	%i2
	fzeros	%f0
	fpmerge	%f3,	%f12,	%f2
	sdiv	%o4,	0x05C9,	%i5
	xorcc	%o5,	%o1,	%g6
	edge8ln	%o7,	%i3,	%l3
	sub	%l4,	0x1379,	%o2
	stw	%l2,	[%l7 + 0x78]
	smulcc	%l0,	%g7,	%i6
	fmovsgu	%xcc,	%f9,	%f4
	movn	%xcc,	%l5,	%g1
	ldd	[%l7 + 0x70],	%f0
	movrlz	%i7,	0x058,	%l1
	fmovsge	%xcc,	%f4,	%f2
	fmuld8sux16	%f1,	%f4,	%f0
	movgu	%icc,	%o3,	%g2
	andncc	%i4,	%i0,	%l6
	subc	%g3,	0x0684,	%g5
	fnand	%f10,	%f6,	%f6
	fmovdvc	%xcc,	%f2,	%f14
	mova	%icc,	%g4,	%i1
	ldsh	[%l7 + 0x16],	%o6
	fmovsvs	%xcc,	%f10,	%f14
	sra	%o0,	0x14,	%o4
	movrgz	%i2,	0x36B,	%o5
	andn	%o1,	0x1C00,	%i5
	ldd	[%l7 + 0x68],	%g6
	edge8ln	%i3,	%o7,	%l3
	mulx	%l4,	0x1713,	%l2
	fmovsle	%xcc,	%f14,	%f6
	fmovsl	%icc,	%f3,	%f7
	fcmpgt16	%f6,	%f8,	%l0
	sra	%o2,	%i6,	%g7
	movneg	%xcc,	%l5,	%i7
	bshuffle	%f12,	%f8,	%f4
	sra	%g1,	%l1,	%g2
	subc	%o3,	0x150C,	%i0
	umul	%l6,	0x0E7D,	%g3
	restore %i4, 0x0FFA, %g4
	lduw	[%l7 + 0x64],	%g5
	fmovsne	%icc,	%f10,	%f11
	fcmpeq32	%f10,	%f0,	%i1
	movge	%icc,	%o0,	%o6
	movg	%xcc,	%i2,	%o4
	orn	%o5,	%o1,	%i5
	fmovsn	%icc,	%f0,	%f10
	movre	%i3,	0x3A7,	%g6
	fandnot1	%f8,	%f8,	%f2
	edge32ln	%l3,	%o7,	%l2
	ldd	[%l7 + 0x28],	%l0
	edge32	%l4,	%i6,	%g7
	sra	%o2,	0x08,	%i7
	movne	%icc,	%l5,	%l1
	movleu	%xcc,	%g1,	%g2
	fmovscs	%xcc,	%f9,	%f1
	udivx	%i0,	0x0EA9,	%l6
	ldsb	[%l7 + 0x57],	%g3
	subc	%i4,	0x0BF0,	%o3
	fmovdle	%icc,	%f1,	%f13
	movvc	%xcc,	%g5,	%i1
	fmovspos	%xcc,	%f1,	%f12
	edge16	%g4,	%o0,	%o6
	srlx	%o4,	%i2,	%o5
	fands	%f11,	%f3,	%f6
	sdivcc	%o1,	0x0069,	%i5
	fands	%f2,	%f4,	%f0
	udivx	%i3,	0x0838,	%g6
	ld	[%l7 + 0x1C],	%f10
	popc	%o7,	%l2
	subc	%l3,	0x1C08,	%l0
	orcc	%i6,	%l4,	%o2
	ldsw	[%l7 + 0x28],	%i7
	ldub	[%l7 + 0x77],	%g7
	mova	%icc,	%l5,	%l1
	movle	%icc,	%g1,	%g2
	edge16l	%i0,	%g3,	%l6
	xnorcc	%i4,	0x1FC1,	%g5
	ld	[%l7 + 0x1C],	%f3
	edge16l	%o3,	%i1,	%o0
	move	%icc,	%o6,	%o4
	fpadd32s	%f4,	%f10,	%f13
	faligndata	%f0,	%f2,	%f4
	stx	%g4,	[%l7 + 0x48]
	movl	%xcc,	%i2,	%o5
	subccc	%o1,	0x01EC,	%i5
	ldx	[%l7 + 0x70],	%i3
	movvs	%icc,	%g6,	%l2
	udivx	%l3,	0x1CB9,	%l0
	umulcc	%o7,	0x080A,	%l4
	smul	%i6,	%o2,	%g7
	lduw	[%l7 + 0x68],	%i7
	edge16n	%l1,	%g1,	%l5
	fsrc1	%f12,	%f0
	fpsub32s	%f4,	%f9,	%f0
	sethi	0x1E7D,	%g2
	edge8	%g3,	%i0,	%l6
	array8	%g5,	%i4,	%o3
	smul	%o0,	%o6,	%o4
	ldsh	[%l7 + 0x2A],	%g4
	fnot2	%f4,	%f4
	array8	%i1,	%i2,	%o1
	movrlz	%i5,	%i3,	%o5
	or	%g6,	0x1CEF,	%l3
	udivcc	%l0,	0x17AA,	%l2
	orcc	%o7,	%i6,	%l4
	edge32l	%o2,	%g7,	%l1
	xnorcc	%g1,	0x1442,	%l5
	subccc	%i7,	0x0671,	%g3
	subcc	%i0,	%g2,	%l6
	fmovdge	%xcc,	%f7,	%f13
	orn	%i4,	%g5,	%o3
	sdiv	%o0,	0x17E8,	%o6
	ldub	[%l7 + 0x0E],	%o4
	ldd	[%l7 + 0x78],	%i0
	restore %g4, 0x17C8, %o1
  	  add     %g0,    0x0,    %g0
	  add     %g1,    0x0,    %g1
	  add     %g2,    0x0,    %g2
	  add     %g3,    0x0,    %g3
	  add     %g4,    0x0,    %g4
	  add     %g5,    0x0,    %g5
	  add     %g6,    0x0,    %g6
	  add     %g7,    0x0,    %g7	
  	  add     %l0,    0x0,    %l0
	  add     %l1,    0x0,    %l1
	  add     %l2,    0x0,    %l2
	  add     %l3,    0x0,    %l3
	  add     %l4,    0x0,    %l4
	  add     %l5,    0x0,    %l5
	  add     %l6,    0x0,    %l6
	  add     %l7,    0x0,    %l7	
  	  add     %i0,    0x0,    %i0
	  add     %i1,    0x0,    %i1
	  add     %i2,    0x0,    %i2
	  add     %i3,    0x0,    %i3
	  add     %i4,    0x0,    %i4
	  add     %i5,    0x0,    %i5
	  add     %i6,    0x0,    %i6
	  add     %i7,    0x0,    %i7	
  	  add     %o0,    0x0,    %o0
	  add     %o1,    0x0,    %o1
	  add     %o2,    0x0,    %o2
	  add     %o3,    0x0,    %o3
	  add     %o4,    0x0,    %o4
	  add     %o5,    0x0,    %o5
	  add     %o6,    0x0,    %o6
	  add     %o7,    0x0,    %o7	
	movne	%icc,	%i2,	%i3
	array16	%o5,	%i5,	%g6
	edge16	%l3,	%l0,	%o7
	fmovdge	%icc,	%f11,	%f9
	lduh	[%l7 + 0x1A],	%l2
	orcc	%i6,	%l4,	%g7
	fmovsl	%xcc,	%f4,	%f15
	edge16	%o2,	%l1,	%g1
	sth	%l5,	[%l7 + 0x28]
	fabsd	%f2,	%f2
	mulx	%i7,	0x0F51,	%i0
	movrlz	%g3,	%g2,	%i4
	edge32ln	%l6,	%g5,	%o0
	mulx	%o6,	0x0ACF,	%o4
	movrne	%o3,	%i1,	%o1
	andcc	%i2,	%i3,	%o5
	smul	%g4,	%g6,	%l3
	movrgez	%l0,	0x34B,	%i5
	orcc	%o7,	0x0F8E,	%i6
	movn	%icc,	%l4,	%g7
	sub	%o2,	0x1C67,	%l1
	andn	%g1,	0x1A6A,	%l5
	movcc	%icc,	%i7,	%i0
	movleu	%xcc,	%g3,	%g2
	edge16l	%i4,	%l6,	%l2
	ldd	[%l7 + 0x60],	%f12
	edge16n	%o0,	%o6,	%o4
	mova	%icc,	%o3,	%i1
	fnegd	%f10,	%f2
	xor	%g5,	0x19B1,	%i2
	fcmple32	%f0,	%f6,	%i3
	movcs	%xcc,	%o1,	%g4
	ldsw	[%l7 + 0x20],	%g6
	andn	%l3,	0x160A,	%l0
	edge32	%i5,	%o5,	%o7
	sllx	%i6,	%l4,	%o2
	array32	%l1,	%g7,	%l5
	fpadd16s	%f14,	%f0,	%f11
	movl	%icc,	%i7,	%g1
	std	%f6,	[%l7 + 0x78]
	fmovsn	%icc,	%f5,	%f14
	ldsh	[%l7 + 0x18],	%g3
	movrgez	%i0,	%g2,	%i4
	mulscc	%l2,	0x0A61,	%l6
	mulx	%o6,	0x0EAA,	%o0
	fmovd	%f0,	%f6
	movrgez	%o4,	0x3A3,	%o3
	udiv	%i1,	0x0405,	%g5
	sth	%i2,	[%l7 + 0x72]
	alignaddrl	%i3,	%g4,	%o1
	subcc	%l3,	%g6,	%l0
	fnot1	%f2,	%f10
	movrgez	%i5,	%o7,	%i6
	mulscc	%l4,	%o2,	%o5
	ld	[%l7 + 0x1C],	%f12
	addcc	%g7,	0x15F2,	%l5
	edge32n	%i7,	%l1,	%g3
	fmovdneg	%xcc,	%f15,	%f0
	movrlez	%g1,	0x316,	%g2
	fornot2s	%f2,	%f2,	%f1
	sub	%i4,	0x0BCF,	%l2
	movrlez	%l6,	%i0,	%o0
	edge8ln	%o4,	%o6,	%i1
	edge16ln	%g5,	%o3,	%i3
	andcc	%i2,	0x1267,	%o1
	sdivx	%l3,	0x1B6B,	%g4
	ld	[%l7 + 0x74],	%f6
	array8	%g6,	%l0,	%o7
	edge32l	%i6,	%l4,	%i5
	stb	%o2,	[%l7 + 0x2C]
	udivx	%o5,	0x0270,	%g7
	udivcc	%i7,	0x1605,	%l5
	move	%icc,	%l1,	%g1
	add	%g2,	0x062C,	%g3
	fmovsvc	%icc,	%f2,	%f9
	fabss	%f12,	%f12
	andn	%i4,	0x14A9,	%l2
	array8	%i0,	%l6,	%o4
	ldub	[%l7 + 0x0A],	%o0
	mulscc	%o6,	0x1A28,	%g5
	movvs	%icc,	%i1,	%i3
	add	%i2,	0x011B,	%o3
	edge16	%o1,	%g4,	%g6
	xnor	%l3,	%l0,	%o7
	or	%l4,	0x1531,	%i5
	for	%f6,	%f6,	%f14
	mulscc	%o2,	%i6,	%o5
	ldsh	[%l7 + 0x56],	%i7
	mulx	%g7,	0x0B63,	%l1
	sdivcc	%g1,	0x103B,	%g2
	array16	%g3,	%i4,	%l2
	popc	0x0B36,	%i0
	udiv	%l5,	0x1BAC,	%o4
	subccc	%o0,	%l6,	%g5
	fsrc1s	%f10,	%f8
	array32	%i1,	%i3,	%i2
	fcmped	%fcc3,	%f0,	%f10
	movrgez	%o3,	0x2BD,	%o6
	fcmpeq32	%f14,	%f4,	%o1
	fand	%f14,	%f10,	%f8
	movn	%icc,	%g4,	%l3
	mulx	%g6,	%l0,	%l4
	save %i5, 0x017D, %o7
	edge16l	%o2,	%i6,	%o5
	ldub	[%l7 + 0x4F],	%g7
	addcc	%i7,	%l1,	%g2
	xnor	%g1,	%i4,	%g3
	movpos	%xcc,	%l2,	%l5
	add	%i0,	0x197F,	%o0
	alignaddr	%o4,	%g5,	%l6
	fmovsle	%icc,	%f14,	%f3
	orcc	%i3,	%i2,	%i1
	edge32l	%o3,	%o6,	%g4
	movrne	%l3,	%g6,	%l0
	array16	%o1,	%l4,	%o7
	fxnors	%f10,	%f2,	%f10
	ldd	[%l7 + 0x70],	%i4
	fpadd32s	%f4,	%f6,	%f14
	edge32l	%o2,	%i6,	%g7
	bshuffle	%f12,	%f6,	%f12
	fcmped	%fcc1,	%f12,	%f4
	sub	%i7,	%o5,	%l1
	edge16	%g2,	%g1,	%i4
	fmovrdgez	%l2,	%f10,	%f10
	lduw	[%l7 + 0x3C],	%l5
	andcc	%i0,	0x0B99,	%g3
	movvc	%icc,	%o4,	%o0
	movcs	%icc,	%l6,	%i3
	fors	%f4,	%f1,	%f10
	subccc	%g5,	0x1DBE,	%i2
	movge	%icc,	%i1,	%o3
	movn	%xcc,	%o6,	%l3
	edge32n	%g4,	%l0,	%o1
	orncc	%g6,	%o7,	%l4
	fpadd32	%f2,	%f10,	%f14
	subccc	%i5,	%i6,	%o2
	fmovsleu	%icc,	%f3,	%f14
	movl	%xcc,	%g7,	%i7
	addccc	%o5,	0x12FD,	%l1
	andcc	%g2,	0x167D,	%i4
	sethi	0x1215,	%g1
	xnor	%l2,	0x0BEE,	%i0
	addccc	%g3,	0x19E6,	%o4
	fnands	%f15,	%f12,	%f13
	srl	%o0,	%l5,	%i3
	mulscc	%l6,	0x0449,	%i2
	mulx	%i1,	0x1514,	%o3
	stw	%g5,	[%l7 + 0x24]
	fmovrdlez	%l3,	%f0,	%f6
	fxnor	%f0,	%f10,	%f10
	edge8n	%g4,	%l0,	%o6
	ld	[%l7 + 0x38],	%f1
	fmovrdlez	%o1,	%f8,	%f10
	sra	%o7,	0x03,	%l4
	addccc	%i5,	0x18ED,	%i6
	movvc	%icc,	%g6,	%o2
	fmul8x16	%f8,	%f6,	%f6
	st	%f8,	[%l7 + 0x10]
	xnor	%g7,	0x0695,	%i7
	stb	%o5,	[%l7 + 0x7A]
	edge32ln	%l1,	%i4,	%g2
	addc	%l2,	0x0DCA,	%i0
	fone	%f10
	umulcc	%g3,	%o4,	%g1
	sll	%o0,	0x14,	%l5
	xnor	%l6,	0x1AC0,	%i3
	fmovspos	%icc,	%f7,	%f15
	stw	%i2,	[%l7 + 0x64]
	add	%i1,	%o3,	%g5
	edge8n	%g4,	%l3,	%l0
	ldd	[%l7 + 0x38],	%o6
	movrgez	%o7,	0x15E,	%o1
	fors	%f3,	%f15,	%f5
	udivcc	%l4,	0x0841,	%i5
	srlx	%i6,	%g6,	%o2
	edge8	%g7,	%i7,	%o5
	movvc	%icc,	%l1,	%i4
	fmovdl	%xcc,	%f6,	%f8
	xorcc	%l2,	0x1FEE,	%i0
	fcmpgt32	%f14,	%f0,	%g2
	fmuld8ulx16	%f13,	%f12,	%f4
	movge	%xcc,	%o4,	%g3
	movrlez	%g1,	0x247,	%l5
	movg	%icc,	%o0,	%i3
	alignaddr	%l6,	%i2,	%o3
	edge32l	%g5,	%g4,	%i1
	movge	%xcc,	%l3,	%l0
	edge32	%o6,	%o1,	%o7
	fandnot2	%f14,	%f12,	%f12
	edge8	%l4,	%i5,	%i6
	edge16l	%g6,	%g7,	%o2
	fmovdle	%xcc,	%f1,	%f1
	restore %o5, 0x1B37, %i7
	ldd	[%l7 + 0x18],	%l0
	fpadd16s	%f11,	%f4,	%f0
	srlx	%i4,	%l2,	%i0
	ldsb	[%l7 + 0x71],	%o4
	stw	%g3,	[%l7 + 0x40]
	smul	%g2,	%l5,	%g1
	movcs	%icc,	%o0,	%l6
	edge8n	%i3,	%o3,	%i2
	edge16n	%g5,	%i1,	%l3
	srlx	%l0,	%g4,	%o6
	fcmpes	%fcc3,	%f10,	%f15
	ldub	[%l7 + 0x6C],	%o1
	edge8ln	%l4,	%i5,	%o7
	xorcc	%i6,	0x09DA,	%g6
	edge8ln	%o2,	%o5,	%g7
	udivx	%i7,	0x045D,	%i4
	subccc	%l2,	%i0,	%o4
	movneg	%xcc,	%l1,	%g2
	fmovsa	%icc,	%f11,	%f0
	sth	%l5,	[%l7 + 0x1A]
	sdiv	%g1,	0x0BA2,	%g3
	movpos	%xcc,	%l6,	%i3
	umul	%o0,	%i2,	%g5
	movrlez	%o3,	0x009,	%l3
	movpos	%xcc,	%i1,	%g4
	fmul8x16au	%f5,	%f9,	%f8
	subccc	%o6,	0x192B,	%l0
	sdivcc	%l4,	0x1C41,	%o1
	alignaddr	%o7,	%i6,	%i5
	edge8n	%g6,	%o2,	%o5
	andn	%g7,	0x1739,	%i4
	sub	%i7,	%i0,	%o4
	fsrc2s	%f8,	%f12
	edge8l	%l1,	%g2,	%l2
	fsrc1	%f8,	%f14
	fmovrdlez	%g1,	%f0,	%f8
	lduw	[%l7 + 0x78],	%l5
	umul	%g3,	%i3,	%l6
	fcmpgt32	%f6,	%f10,	%i2
	smul	%g5,	%o0,	%l3
	orncc	%o3,	%g4,	%i1
	movrlz	%o6,	0x088,	%l0
	fmovdne	%icc,	%f11,	%f0
	add	%o1,	%o7,	%l4
	movne	%icc,	%i6,	%i5
	addc	%g6,	%o5,	%o2
	xnor	%i4,	%i7,	%i0
	udiv	%o4,	0x16FA,	%l1
	fcmpeq32	%f14,	%f10,	%g7
	edge16	%g2,	%g1,	%l5
	sra	%g3,	0x08,	%l2
	orcc	%i3,	0x0D52,	%l6
	add	%g5,	%o0,	%l3
	movl	%xcc,	%i2,	%g4
	addcc	%o3,	0x0D64,	%o6
	stw	%l0,	[%l7 + 0x70]
	fpsub16s	%f12,	%f12,	%f12
	ld	[%l7 + 0x64],	%f14
	sdivcc	%i1,	0x1567,	%o7
	subc	%l4,	%o1,	%i5
	edge32ln	%i6,	%o5,	%g6
	fmovspos	%icc,	%f8,	%f7
	movneg	%xcc,	%i4,	%o2
	subc	%i0,	%o4,	%l1
	sra	%g7,	0x10,	%g2
	save %i7, %l5, %g1
	sdivx	%g3,	0x04A5,	%l2
	sdivcc	%l6,	0x09E4,	%i3
	orcc	%o0,	0x1D47,	%g5
	fpackfix	%f0,	%f10
	addcc	%i2,	%l3,	%o3
	movl	%icc,	%o6,	%l0
	sll	%g4,	%o7,	%l4
	lduw	[%l7 + 0x78],	%o1
	fabsd	%f4,	%f14
	ldd	[%l7 + 0x30],	%i0
	fsrc2	%f8,	%f8
	std	%f0,	[%l7 + 0x20]
	orn	%i6,	%o5,	%g6
	xnorcc	%i4,	%o2,	%i5
	movrgez	%o4,	0x2D8,	%i0
	fnands	%f3,	%f11,	%f9
	ldsw	[%l7 + 0x24],	%l1
	movrne	%g2,	%g7,	%i7
	udivx	%l5,	0x0936,	%g1
	edge32l	%g3,	%l2,	%i3
	fmovdcc	%xcc,	%f10,	%f8
	smul	%l6,	%g5,	%o0
	movneg	%xcc,	%i2,	%o3
	fmuld8ulx16	%f2,	%f4,	%f14
	fsrc2	%f6,	%f6
	ldub	[%l7 + 0x38],	%o6
	fsrc2	%f2,	%f4
	stb	%l3,	[%l7 + 0x66]
	addcc	%g4,	%l0,	%o7
	fmovsneg	%icc,	%f13,	%f8
	movrgz	%o1,	%l4,	%i1
	subccc	%i6,	%o5,	%i4
	fcmpes	%fcc0,	%f6,	%f4
	movpos	%xcc,	%g6,	%o2
	lduh	[%l7 + 0x6E],	%o4
	fsrc2s	%f15,	%f5
	fmovrde	%i5,	%f10,	%f2
	addcc	%l1,	0x17D5,	%g2
	udiv	%i0,	0x1BC4,	%g7
	sllx	%l5,	%g1,	%g3
	fmovdn	%xcc,	%f8,	%f9
	fornot1	%f8,	%f6,	%f6
	xnor	%l2,	0x1419,	%i7
	fmovrdlez	%i3,	%f8,	%f6
	orn	%l6,	%o0,	%g5
	sllx	%i2,	%o3,	%o6
	fnot1s	%f2,	%f15
	umul	%l3,	0x1805,	%l0
	fcmpgt16	%f12,	%f6,	%o7
	sra	%g4,	%l4,	%i1
	fpadd16s	%f2,	%f6,	%f10
	xnor	%o1,	0x18E5,	%o5
	fxors	%f3,	%f7,	%f0
	sll	%i4,	0x10,	%i6
	sll	%o2,	0x1A,	%o4
	fmovda	%xcc,	%f3,	%f10
	edge32l	%i5,	%g6,	%l1
	edge8n	%g2,	%i0,	%g7
	srl	%l5,	%g1,	%g3
	sethi	0x0508,	%l2
	ldd	[%l7 + 0x40],	%f2
	fmovsa	%xcc,	%f2,	%f12
	orn	%i7,	0x13D7,	%i3
	fmovspos	%xcc,	%f7,	%f12
	and	%l6,	0x0823,	%o0
	save %i2, 0x01C4, %g5
	fcmple16	%f8,	%f8,	%o6
	edge32n	%o3,	%l0,	%o7
	stx	%g4,	[%l7 + 0x60]
	fmovsgu	%icc,	%f11,	%f1
	xor	%l3,	%i1,	%o1
	ldsw	[%l7 + 0x38],	%o5
	movleu	%xcc,	%i4,	%i6
	sub	%o2,	0x1649,	%o4
	fors	%f8,	%f1,	%f7
	edge8ln	%l4,	%g6,	%i5
	siam	0x5
	ldd	[%l7 + 0x68],	%l0
	edge32ln	%i0,	%g2,	%l5
	ld	[%l7 + 0x64],	%f13
	ldsw	[%l7 + 0x18],	%g7
	movvc	%icc,	%g3,	%l2
	fpadd16s	%f6,	%f10,	%f13
	add	%g1,	%i7,	%i3
	fmovsne	%icc,	%f5,	%f3
	ldd	[%l7 + 0x78],	%f10
	movrlez	%o0,	%l6,	%i2
	sdivx	%o6,	0x1D27,	%o3
	sdivcc	%l0,	0x0165,	%o7
	srax	%g4,	%l3,	%i1
	alignaddr	%o1,	%g5,	%o5
	edge8	%i6,	%i4,	%o2
	fmovs	%f4,	%f14
	fmovdcs	%icc,	%f11,	%f11
	fcmpgt16	%f6,	%f0,	%l4
	movrne	%g6,	%i5,	%l1
	addcc	%o4,	%g2,	%l5
	sth	%i0,	[%l7 + 0x32]
	add	%g7,	%l2,	%g1
	lduh	[%l7 + 0x70],	%g3
	fmuld8ulx16	%f0,	%f1,	%f0
	udiv	%i7,	0x07D2,	%o0
	edge16n	%i3,	%l6,	%o6
	xorcc	%o3,	%i2,	%o7
	fornot2s	%f12,	%f0,	%f3
	move	%xcc,	%l0,	%l3
	movrlz	%g4,	0x16F,	%o1
	move	%icc,	%g5,	%o5
	movgu	%icc,	%i6,	%i1
	fpack16	%f12,	%f2
	fpsub16s	%f4,	%f12,	%f5
	andcc	%o2,	%l4,	%g6
	movge	%xcc,	%i4,	%i5
	fmovsa	%xcc,	%f0,	%f7
	sethi	0x13AD,	%l1
	xnor	%o4,	0x1CE7,	%l5
	orcc	%g2,	0x1727,	%i0
	mulscc	%l2,	0x077C,	%g7
	fmovde	%icc,	%f12,	%f5
	movvs	%xcc,	%g3,	%g1
	fpadd16	%f14,	%f0,	%f2
	fcmpeq16	%f8,	%f8,	%o0
	xorcc	%i3,	%i7,	%l6
	ldd	[%l7 + 0x60],	%o2
	xnor	%i2,	%o7,	%o6
	fabsd	%f10,	%f10
	movne	%icc,	%l3,	%g4
	ldsh	[%l7 + 0x44],	%l0
	lduw	[%l7 + 0x2C],	%g5
	for	%f6,	%f12,	%f14
	subc	%o5,	0x1ADB,	%o1
	movg	%icc,	%i1,	%o2
	fmul8ulx16	%f10,	%f0,	%f4
	sllx	%l4,	%g6,	%i6
	sdivcc	%i4,	0x169E,	%i5
	edge32	%l1,	%l5,	%o4
	array16	%g2,	%i0,	%l2
	movneg	%xcc,	%g3,	%g7
	sethi	0x158E,	%g1
	movrgez	%i3,	%o0,	%i7
	std	%f12,	[%l7 + 0x30]
	udivx	%l6,	0x19A2,	%i2
	srl	%o3,	%o6,	%o7
	andncc	%l3,	%l0,	%g5
	movrlez	%g4,	%o5,	%o1
	mulx	%o2,	%i1,	%l4
	andcc	%g6,	%i4,	%i6
	movre	%l1,	0x387,	%l5
	fcmpgt32	%f2,	%f8,	%i5
	orncc	%o4,	%g2,	%i0
	sll	%l2,	%g3,	%g1
	udiv	%i3,	0x03D6,	%o0
	andn	%g7,	%l6,	%i2
	ldx	[%l7 + 0x28],	%o3
	for	%f4,	%f8,	%f8
	movvc	%icc,	%i7,	%o7
	edge8	%o6,	%l3,	%l0
	move	%xcc,	%g4,	%g5
	movpos	%icc,	%o5,	%o1
	movre	%o2,	0x0FF,	%l4
	fandnot1	%f2,	%f12,	%f10
	sra	%i1,	%g6,	%i4
	orn	%l1,	%i6,	%i5
	movrlez	%l5,	0x1C0,	%o4
	edge16ln	%g2,	%l2,	%i0
	fornot2	%f8,	%f14,	%f8
	ldsw	[%l7 + 0x70],	%g1
	edge8ln	%i3,	%o0,	%g3
	movcs	%xcc,	%l6,	%i2
	sdivx	%o3,	0x0692,	%i7
	movl	%icc,	%o7,	%o6
	edge16n	%l3,	%g7,	%g4
	or	%g5,	%l0,	%o1
	alignaddr	%o5,	%o2,	%i1
	edge32	%l4,	%i4,	%g6
	edge32l	%l1,	%i5,	%l5
	movrne	%i6,	0x028,	%g2
	fpsub16s	%f6,	%f10,	%f11
	move	%xcc,	%l2,	%i0
	sllx	%g1,	0x1A,	%i3
	orncc	%o4,	%o0,	%g3
	array32	%i2,	%o3,	%l6
	andncc	%o7,	%i7,	%o6
	subcc	%l3,	%g4,	%g5
	popc	0x0001,	%l0
	movne	%xcc,	%o1,	%o5
	movcs	%icc,	%g7,	%o2
	fmul8x16al	%f2,	%f10,	%f6
	ldsb	[%l7 + 0x6C],	%l4
	fmovdvs	%xcc,	%f1,	%f3
	mova	%icc,	%i1,	%i4
	move	%icc,	%l1,	%i5
	subccc	%g6,	0x0330,	%l5
	lduh	[%l7 + 0x0C],	%g2
	orn	%i6,	%i0,	%l2
	lduw	[%l7 + 0x7C],	%g1
	movrlz	%o4,	%o0,	%g3
	array32	%i3,	%i2,	%o3
	fxors	%f4,	%f14,	%f10
	xorcc	%l6,	%i7,	%o6
	mova	%icc,	%o7,	%l3
	ldsh	[%l7 + 0x14],	%g5
	smulcc	%g4,	0x0808,	%l0
	fabss	%f10,	%f14
	edge16l	%o5,	%o1,	%o2
	alignaddrl	%g7,	%i1,	%l4
	movgu	%icc,	%l1,	%i5
	lduh	[%l7 + 0x48],	%i4
	ldsb	[%l7 + 0x7B],	%l5
	mulscc	%g2,	%i6,	%g6
	lduw	[%l7 + 0x6C],	%l2
	edge16	%g1,	%i0,	%o0
	sdiv	%g3,	0x0794,	%o4
	addcc	%i3,	%o3,	%i2
	udivcc	%l6,	0x09D9,	%o6
	sth	%o7,	[%l7 + 0x48]
	fcmpne16	%f8,	%f2,	%l3
	fmovdcs	%icc,	%f13,	%f11
	edge8ln	%i7,	%g4,	%l0
	edge8l	%o5,	%g5,	%o2
	movneg	%icc,	%g7,	%o1
	lduh	[%l7 + 0x1A],	%l4
	udivcc	%i1,	0x005C,	%i5
	edge16l	%l1,	%l5,	%i4
	fpsub32s	%f11,	%f4,	%f13
	movvs	%xcc,	%g2,	%g6
	edge16n	%l2,	%g1,	%i6
	fmovrdgz	%o0,	%f14,	%f8
	movvc	%icc,	%i0,	%g3
	edge32	%o4,	%i3,	%o3
	srlx	%i2,	%l6,	%o6
	fornot1s	%f13,	%f8,	%f14
	ldd	[%l7 + 0x78],	%f12
	edge16ln	%o7,	%l3,	%g4
	movle	%xcc,	%l0,	%o5
	fmovspos	%icc,	%f1,	%f14
	sdivx	%i7,	0x0D60,	%o2
	smul	%g7,	0x157B,	%g5
	edge32l	%l4,	%i1,	%o1
	xnorcc	%i5,	%l5,	%l1
	sdivx	%g2,	0x11FC,	%g6
	alignaddrl	%l2,	%g1,	%i4
	fornot1	%f10,	%f6,	%f8
	lduh	[%l7 + 0x58],	%o0
	movg	%icc,	%i0,	%i6
	siam	0x3
	smul	%g3,	%o4,	%o3
	movcc	%xcc,	%i2,	%l6
	fmovsne	%xcc,	%f2,	%f6
	stw	%i3,	[%l7 + 0x54]
	and	%o6,	0x0D15,	%o7
	ld	[%l7 + 0x70],	%f1
	popc	%l3,	%g4
	sethi	0x108B,	%l0
	fcmpgt32	%f4,	%f12,	%i7
	move	%icc,	%o2,	%g7
	xor	%o5,	0x16A4,	%l4
	fmovd	%f4,	%f6
	fsrc2	%f0,	%f14
	sethi	0x15AE,	%g5
	lduh	[%l7 + 0x20],	%o1
	andncc	%i5,	%i1,	%l1
	alignaddr	%g2,	%l5,	%g6
	movl	%icc,	%g1,	%i4
	fmovrde	%o0,	%f12,	%f8
	fcmpne16	%f4,	%f14,	%l2
	fmovdneg	%xcc,	%f12,	%f12
	or	%i6,	%g3,	%i0
	srlx	%o4,	0x0D,	%o3
	and	%l6,	%i2,	%o6
	fcmpne16	%f0,	%f2,	%o7
	mulx	%i3,	%g4,	%l0
	fmovse	%icc,	%f8,	%f7
	smulcc	%i7,	0x0E65,	%o2
	fandnot1	%f6,	%f10,	%f6
	edge32n	%l3,	%o5,	%l4
	sub	%g5,	%o1,	%i5
	fpmerge	%f0,	%f10,	%f0
	fpsub32	%f10,	%f0,	%f6
	movneg	%xcc,	%g7,	%i1
	ldsb	[%l7 + 0x7C],	%g2
	subcc	%l1,	%l5,	%g6
	xor	%i4,	0x1427,	%o0
	array32	%l2,	%g1,	%i6
	andncc	%g3,	%i0,	%o3
	movrlz	%l6,	%i2,	%o6
	and	%o7,	%o4,	%i3
	fnot1	%f4,	%f10
	fands	%f13,	%f0,	%f10
	and	%g4,	%i7,	%l0
	smulcc	%l3,	%o5,	%o2
	movl	%xcc,	%g5,	%o1
	array16	%l4,	%g7,	%i1
	fcmple16	%f4,	%f8,	%g2
	fmovsvc	%icc,	%f12,	%f5
	xor	%l1,	%i5,	%l5
	xorcc	%i4,	0x02BC,	%g6
	movne	%icc,	%o0,	%g1
	edge32n	%l2,	%g3,	%i0
	fmul8x16	%f1,	%f8,	%f8
	mova	%icc,	%i6,	%o3
	edge16	%l6,	%o6,	%i2
	fmovsn	%icc,	%f3,	%f13
	ldub	[%l7 + 0x66],	%o7
	edge8	%i3,	%g4,	%o4
	xorcc	%i7,	%l3,	%l0
	fmovrdlez	%o2,	%f4,	%f12
	fnors	%f3,	%f6,	%f2
	array32	%o5,	%o1,	%l4
	fmovdvc	%xcc,	%f8,	%f11
	fcmpne32	%f12,	%f10,	%g7
	fmovsvs	%xcc,	%f3,	%f8
	ldub	[%l7 + 0x3A],	%i1
	movvc	%xcc,	%g2,	%g5
	smul	%i5,	%l5,	%i4
	fandnot2s	%f1,	%f15,	%f12
	array32	%g6,	%l1,	%o0
	fornot1s	%f3,	%f14,	%f8
	edge32	%g1,	%l2,	%i0
	orncc	%i6,	0x1571,	%o3
	sra	%g3,	%l6,	%i2
	array16	%o7,	%o6,	%g4
	edge16ln	%o4,	%i3,	%i7
	fmovsg	%xcc,	%f2,	%f6
	fabsd	%f0,	%f10
	movle	%icc,	%l0,	%o2
	st	%f7,	[%l7 + 0x18]
	orncc	%l3,	0x02A0,	%o5
	ld	[%l7 + 0x68],	%f0
	subc	%l4,	0x0D61,	%o1
	movrgz	%g7,	0x1B9,	%g2
	fmovsne	%icc,	%f4,	%f0
	stx	%i1,	[%l7 + 0x60]
	srl	%i5,	%g5,	%i4
	movre	%l5,	0x2C5,	%l1
	movle	%xcc,	%g6,	%g1
	fsrc1s	%f11,	%f4
	stx	%o0,	[%l7 + 0x50]
	fcmpd	%fcc3,	%f2,	%f6
	fmovdle	%icc,	%f8,	%f0
	fmovdleu	%icc,	%f3,	%f10
	subcc	%l2,	0x0E17,	%i6
	edge8l	%i0,	%o3,	%l6
	movge	%xcc,	%i2,	%g3
	fornot1s	%f15,	%f7,	%f14
	edge8n	%o6,	%o7,	%g4
	fmovdleu	%icc,	%f15,	%f1
	smulcc	%i3,	%o4,	%i7
	fmovsle	%icc,	%f11,	%f6
	movrgz	%l0,	%l3,	%o2
	movleu	%icc,	%o5,	%l4
	fpack16	%f2,	%f3
	movge	%xcc,	%o1,	%g7
	movneg	%xcc,	%g2,	%i1
	movvs	%icc,	%i5,	%i4
	movneg	%icc,	%g5,	%l5
	and	%g6,	0x0E6B,	%l1
	array8	%o0,	%g1,	%l2
	sdivx	%i0,	0x1CE5,	%i6
	fcmpgt16	%f8,	%f4,	%l6
	fandnot1s	%f5,	%f4,	%f6
	fmovd	%f6,	%f0
	fmovsge	%xcc,	%f5,	%f1
	movvc	%icc,	%o3,	%i2
	fxors	%f0,	%f0,	%f11
	srax	%o6,	%o7,	%g4
	movgu	%icc,	%g3,	%o4
	orcc	%i7,	0x1DED,	%i3
	fmovrde	%l0,	%f6,	%f0
	subcc	%l3,	0x03C2,	%o5
	movpos	%xcc,	%l4,	%o2
	xor	%o1,	%g7,	%i1
	edge16ln	%i5,	%g2,	%i4
	orn	%g5,	0x018A,	%g6
	fornot1	%f12,	%f2,	%f14
	pdist	%f0,	%f12,	%f10
	fcmpgt16	%f2,	%f12,	%l1
	movrlz	%l5,	0x143,	%o0
	subc	%l2,	%i0,	%g1
	xorcc	%i6,	%l6,	%i2
	movrlez	%o3,	%o6,	%g4
	stx	%g3,	[%l7 + 0x10]
	addc	%o4,	%i7,	%i3
	popc	%o7,	%l0
	andcc	%o5,	0x0460,	%l4
	movleu	%icc,	%l3,	%o1
	alignaddr	%o2,	%g7,	%i5
	xnor	%i1,	0x1AF8,	%i4
	ldsw	[%l7 + 0x10],	%g5
	save %g2, %g6, %l1
	popc	%l5,	%l2
	umul	%o0,	0x1774,	%g1
	stw	%i6,	[%l7 + 0x38]
	fmuld8ulx16	%f3,	%f4,	%f2
	fcmps	%fcc3,	%f10,	%f9
	edge32l	%i0,	%i2,	%o3
	udiv	%o6,	0x0B50,	%l6
	lduh	[%l7 + 0x6C],	%g4
	stw	%g3,	[%l7 + 0x08]
	move	%xcc,	%i7,	%o4
	orcc	%o7,	%l0,	%i3
	edge32n	%o5,	%l3,	%l4
	movvs	%icc,	%o2,	%o1
	fcmpd	%fcc3,	%f14,	%f0
	edge16ln	%g7,	%i1,	%i5
	sdiv	%g5,	0x06F9,	%i4
	ldsb	[%l7 + 0x0B],	%g2
	fsrc2s	%f2,	%f15
	fmul8sux16	%f4,	%f6,	%f12
	move	%icc,	%g6,	%l5
	fmovdle	%xcc,	%f2,	%f7
	movvc	%xcc,	%l1,	%l2
	edge16ln	%g1,	%o0,	%i0
	movvs	%xcc,	%i6,	%o3
	movne	%icc,	%o6,	%i2
	movrgz	%g4,	%g3,	%l6
	andncc	%i7,	%o7,	%l0
	udivx	%o4,	0x0D58,	%o5
	smul	%i3,	0x087D,	%l3
	movl	%xcc,	%l4,	%o1
	sllx	%g7,	%o2,	%i1
	fpsub16	%f12,	%f12,	%f10
	andcc	%g5,	%i4,	%i5
	subc	%g6,	0x04C9,	%g2
	or	%l5,	0x1C02,	%l1
	movn	%icc,	%l2,	%g1
	std	%f10,	[%l7 + 0x58]
	fandnot2s	%f2,	%f10,	%f4
	fpsub32	%f4,	%f4,	%f2
	andncc	%i0,	%o0,	%o3
	movre	%i6,	%i2,	%g4
	bshuffle	%f6,	%f8,	%f10
	edge8	%g3,	%o6,	%l6
	array32	%i7,	%o7,	%o4
	fmovrdlez	%o5,	%f14,	%f0
	sll	%l0,	%i3,	%l3
	fmovsle	%icc,	%f14,	%f8
	udiv	%o1,	0x0976,	%l4
	fmovsleu	%xcc,	%f6,	%f7
	ldsb	[%l7 + 0x3B],	%g7
	lduh	[%l7 + 0x52],	%o2
	andcc	%g5,	0x173A,	%i1
	ldsb	[%l7 + 0x0C],	%i4
	subcc	%i5,	0x086B,	%g6
	array32	%l5,	%l1,	%g2
	edge32n	%l2,	%g1,	%o0
	ldsb	[%l7 + 0x2A],	%o3
	andcc	%i0,	%i2,	%g4
	subcc	%i6,	%g3,	%o6
	udiv	%l6,	0x10AA,	%i7
	srl	%o4,	%o5,	%l0
	ldx	[%l7 + 0x58],	%o7
	movle	%xcc,	%l3,	%i3
	ldsb	[%l7 + 0x7B],	%o1
	movge	%icc,	%g7,	%o2
	fpsub16	%f8,	%f8,	%f12
	andncc	%l4,	%g5,	%i1
	move	%icc,	%i4,	%g6
	subcc	%i5,	%l1,	%g2
	orcc	%l2,	%g1,	%o0
	stb	%l5,	[%l7 + 0x1E]
	xnorcc	%o3,	%i2,	%i0
	movrgez	%i6,	0x251,	%g3
	edge32n	%o6,	%g4,	%l6
	alignaddr	%o4,	%i7,	%l0
	movrlz	%o5,	0x30F,	%l3
	fandnot1s	%f5,	%f3,	%f9
	sdiv	%o7,	0x17FB,	%i3
	udiv	%g7,	0x1F38,	%o1
	fone	%f2
	movrgz	%l4,	%g5,	%o2
	xor	%i4,	%i1,	%g6
	fzeros	%f8
	umul	%l1,	0x07B1,	%g2
	movg	%xcc,	%l2,	%g1
	stx	%i5,	[%l7 + 0x78]
	fabss	%f11,	%f5
	edge8l	%l5,	%o0,	%i2
	sdivx	%o3,	0x0428,	%i6
	ldd	[%l7 + 0x40],	%i0
	sll	%g3,	0x02,	%g4
	fcmple32	%f8,	%f8,	%o6
	orncc	%l6,	0x0C01,	%o4
	edge32l	%i7,	%o5,	%l0
	andcc	%l3,	0x1EA1,	%o7
	ldsw	[%l7 + 0x54],	%g7
	smulcc	%o1,	%i3,	%l4
	fpack16	%f10,	%f9
	edge16n	%o2,	%i4,	%i1
	popc	%g6,	%g5
	array8	%l1,	%g2,	%g1
	edge16	%l2,	%l5,	%i5
	fmovscs	%icc,	%f2,	%f11
	smulcc	%i2,	%o3,	%i6
	andcc	%i0,	%g3,	%g4
	movcc	%icc,	%o0,	%o6
	movge	%xcc,	%l6,	%i7
	movrgez	%o5,	0x3AF,	%l0
	sethi	0x1825,	%o4
	sll	%o7,	0x11,	%g7
	xnor	%l3,	0x0D20,	%o1
	smulcc	%l4,	%o2,	%i3
	andn	%i4,	%g6,	%g5
	andn	%i1,	%l1,	%g2
	sdiv	%g1,	0x0F38,	%l5
	movvs	%xcc,	%i5,	%l2
	fmul8x16au	%f5,	%f11,	%f2
	fmovscc	%xcc,	%f9,	%f14
	edge8	%i2,	%i6,	%i0
	movvs	%icc,	%o3,	%g3
	fzero	%f0
	edge16n	%g4,	%o6,	%l6
	fone	%f2
	mova	%icc,	%o0,	%o5
	srl	%i7,	%l0,	%o4
	popc	%o7,	%l3
	srlx	%g7,	0x05,	%l4
	edge32	%o1,	%i3,	%o2
	ldsb	[%l7 + 0x66],	%g6
	fones	%f10
	xnor	%g5,	%i1,	%l1
	sth	%g2,	[%l7 + 0x78]
	fsrc1s	%f7,	%f0
	edge32ln	%g1,	%l5,	%i4
	udivcc	%l2,	0x0EC9,	%i5
	movre	%i6,	0x007,	%i2
	sll	%o3,	0x0E,	%g3
	movvc	%xcc,	%g4,	%i0
	movg	%icc,	%l6,	%o0
	ldsw	[%l7 + 0x3C],	%o5
	ldsb	[%l7 + 0x23],	%i7
	fmovrdlz	%o6,	%f2,	%f14
	andcc	%l0,	0x1523,	%o4
	edge32ln	%l3,	%o7,	%l4
	ldd	[%l7 + 0x60],	%f14
	edge8n	%o1,	%i3,	%o2
	add	%g6,	0x1712,	%g7
	fcmped	%fcc2,	%f10,	%f8
	fnegs	%f13,	%f3
	xnor	%g5,	0x1E20,	%i1
	subc	%l1,	0x0E33,	%g2
	fmuld8sux16	%f2,	%f12,	%f10
	lduw	[%l7 + 0x70],	%g1
	xor	%l5,	0x1AA2,	%l2
	lduh	[%l7 + 0x1C],	%i5
	movle	%icc,	%i4,	%i6
	edge8	%i2,	%g3,	%o3
	umul	%i0,	%g4,	%l6
	movl	%icc,	%o0,	%i7
	fpack32	%f10,	%f14,	%f4
	ldsb	[%l7 + 0x0F],	%o5
	ldsh	[%l7 + 0x26],	%l0
	fnot1s	%f6,	%f10
	stw	%o6,	[%l7 + 0x58]
	umul	%l3,	%o4,	%o7
	edge8ln	%o1,	%i3,	%l4
	edge8l	%o2,	%g6,	%g7
	ldsw	[%l7 + 0x18],	%g5
	umulcc	%l1,	0x0D42,	%i1
	fnands	%f5,	%f13,	%f8
	fmovdle	%xcc,	%f10,	%f10
	fxnors	%f13,	%f1,	%f12
	fmovdl	%xcc,	%f9,	%f8
	fmovrse	%g1,	%f0,	%f13
	umul	%g2,	0x0F99,	%l2
	ldsh	[%l7 + 0x08],	%l5
	sth	%i4,	[%l7 + 0x7A]
	fabsd	%f8,	%f10
	movcc	%xcc,	%i5,	%i2
	udivcc	%i6,	0x0D86,	%g3
	movvs	%xcc,	%i0,	%g4
	umulcc	%l6,	%o3,	%o0
	lduh	[%l7 + 0x0E],	%o5
	sra	%i7,	0x07,	%o6
	stx	%l0,	[%l7 + 0x78]
	move	%xcc,	%l3,	%o4
	edge8l	%o1,	%i3,	%l4
	fnot1s	%f14,	%f11
	movneg	%icc,	%o7,	%g6
	movge	%xcc,	%o2,	%g5
	orcc	%g7,	0x0084,	%i1
	movg	%xcc,	%g1,	%l1
	movrgez	%g2,	%l5,	%i4
	movgu	%icc,	%i5,	%l2
	fand	%f2,	%f6,	%f10
	ldsb	[%l7 + 0x0D],	%i2
	stw	%g3,	[%l7 + 0x70]
	edge32l	%i0,	%i6,	%g4
	fnot1s	%f1,	%f1
	sll	%o3,	0x00,	%l6
	restore %o0, %o5, %o6
	movn	%icc,	%l0,	%l3
	fmovsl	%xcc,	%f10,	%f13
	ldsh	[%l7 + 0x64],	%o4
	fcmpne32	%f4,	%f2,	%o1
	edge32ln	%i3,	%l4,	%o7
	save %g6, %o2, %g5
	ldsb	[%l7 + 0x65],	%i7
	movpos	%xcc,	%g7,	%g1
	edge16ln	%i1,	%l1,	%g2
	sth	%l5,	[%l7 + 0x4E]
	movleu	%icc,	%i5,	%i4
	save %l2, 0x1EC3, %g3
	fmovdneg	%icc,	%f4,	%f2
	movcc	%xcc,	%i0,	%i2
	subccc	%g4,	%i6,	%o3
	edge16n	%o0,	%l6,	%o5
	udivcc	%l0,	0x1FB7,	%l3
	fmovrde	%o4,	%f8,	%f6
	addc	%o6,	%o1,	%l4
	edge16n	%o7,	%i3,	%o2
	st	%f9,	[%l7 + 0x34]
	alignaddr	%g6,	%i7,	%g7
	fmovspos	%xcc,	%f14,	%f10
	xorcc	%g5,	0x1D0A,	%g1
	fpackfix	%f14,	%f6
	movcc	%xcc,	%l1,	%g2
	ldsh	[%l7 + 0x38],	%l5
	fpackfix	%f12,	%f15
	subccc	%i1,	0x192F,	%i4
	movrne	%i5,	%l2,	%i0
	fpack16	%f2,	%f10
	movcc	%xcc,	%i2,	%g4
	alignaddr	%g3,	%o3,	%o0
	fmovsl	%icc,	%f0,	%f14
	ldd	[%l7 + 0x38],	%i6
	fmovrslz	%i6,	%f12,	%f13
	stb	%o5,	[%l7 + 0x71]
	movvc	%icc,	%l3,	%o4
	fmovdcs	%icc,	%f9,	%f14
	subccc	%l0,	0x1B50,	%o6
	lduw	[%l7 + 0x50],	%l4
	array16	%o1,	%o7,	%i3
	fmovse	%icc,	%f1,	%f5
	save %g6, 0x09CE, %i7
	sll	%o2,	%g5,	%g7
	edge8l	%l1,	%g1,	%g2
	xor	%i1,	0x168D,	%l5
	std	%f10,	[%l7 + 0x58]
	fmovsgu	%xcc,	%f14,	%f8
	umul	%i5,	%i4,	%l2
	umul	%i2,	0x1DC5,	%i0
	movne	%icc,	%g4,	%g3
	fsrc2	%f10,	%f6
	smulcc	%o3,	%o0,	%l6
	fmovdvs	%icc,	%f14,	%f14
	smulcc	%i6,	%o5,	%l3
	umul	%l0,	%o6,	%o4
	movcc	%icc,	%o1,	%o7
	movgu	%xcc,	%l4,	%i3
	movvc	%xcc,	%i7,	%g6
	sra	%g5,	0x00,	%o2
	fandnot2	%f4,	%f14,	%f12
	fcmpeq16	%f2,	%f6,	%l1
	edge32n	%g7,	%g1,	%g2
	fmovrdgez	%i1,	%f14,	%f8
	udiv	%i5,	0x1490,	%l5
	fabss	%f2,	%f4
	edge8ln	%i4,	%l2,	%i2
	movneg	%icc,	%g4,	%g3
	orncc	%i0,	%o0,	%o3
	ldsb	[%l7 + 0x68],	%l6
	edge32n	%o5,	%i6,	%l0
	mova	%icc,	%o6,	%l3
	fcmpgt32	%f10,	%f0,	%o4
	fnors	%f2,	%f0,	%f15
	array16	%o7,	%o1,	%i3
	movl	%xcc,	%i7,	%l4
	movl	%xcc,	%g6,	%o2
	movgu	%icc,	%g5,	%g7
	edge16	%l1,	%g1,	%i1
	add	%g2,	%l5,	%i4
	movg	%xcc,	%i5,	%i2
	ldsw	[%l7 + 0x5C],	%g4
	alignaddr	%g3,	%l2,	%o0
	movne	%icc,	%i0,	%l6
	add	%o5,	%o3,	%l0
	addc	%o6,	%i6,	%l3
	fones	%f9
	ldub	[%l7 + 0x1D],	%o4
	orn	%o1,	%o7,	%i7
	xorcc	%l4,	0x1799,	%g6
	edge32l	%i3,	%o2,	%g7
	xnorcc	%l1,	0x017C,	%g1
	fnegs	%f9,	%f8
	udiv	%g5,	0x19C3,	%i1
	fmovdleu	%xcc,	%f1,	%f1
	fexpand	%f11,	%f6
	udivcc	%g2,	0x142F,	%l5
	fmovsg	%icc,	%f1,	%f5
	srax	%i5,	%i2,	%g4
	andncc	%i4,	%l2,	%o0
	edge16l	%g3,	%i0,	%l6
	stw	%o3,	[%l7 + 0x28]
	array32	%l0,	%o6,	%i6
	xor	%l3,	0x1C48,	%o5
	mulscc	%o4,	0x05B1,	%o1
	fpack16	%f10,	%f9
	or	%o7,	%l4,	%g6
	edge8n	%i7,	%o2,	%g7
	ldx	[%l7 + 0x28],	%i3
	fnands	%f5,	%f13,	%f10
	fmovrdgz	%l1,	%f14,	%f12
	udivx	%g5,	0x1209,	%g1
	array16	%g2,	%l5,	%i1
	fmul8x16al	%f0,	%f7,	%f4
	fcmpeq32	%f6,	%f0,	%i2
	srax	%g4,	%i5,	%l2
	udivx	%i4,	0x0139,	%o0
	fornot2s	%f3,	%f10,	%f11
	movneg	%icc,	%i0,	%l6
	stw	%g3,	[%l7 + 0x60]
	movrlez	%o3,	%l0,	%o6
	stx	%l3,	[%l7 + 0x48]
	fmovscc	%xcc,	%f15,	%f14
	subc	%i6,	0x1721,	%o4
	fmovdneg	%icc,	%f7,	%f7
	edge8l	%o1,	%o5,	%o7
	andn	%l4,	%g6,	%i7
	andn	%g7,	%i3,	%o2
	faligndata	%f6,	%f10,	%f12
	sth	%l1,	[%l7 + 0x20]
	ldx	[%l7 + 0x58],	%g1
	fmovde	%icc,	%f2,	%f14
	subc	%g5,	%l5,	%i1
	move	%icc,	%i2,	%g2
	fmovde	%icc,	%f11,	%f12
	stb	%i5,	[%l7 + 0x2E]
	fcmped	%fcc2,	%f6,	%f14
	ldsb	[%l7 + 0x11],	%g4
	andn	%i4,	0x0E1F,	%o0
	ldsh	[%l7 + 0x5E],	%l2
	lduh	[%l7 + 0x66],	%i0
	mulscc	%g3,	%l6,	%o3
	fornot2s	%f2,	%f3,	%f6
	fmovsleu	%xcc,	%f1,	%f2
	orncc	%l0,	0x1624,	%o6
	fand	%f14,	%f6,	%f4
	move	%xcc,	%l3,	%o4
	srax	%i6,	%o1,	%o7
	popc	%l4,	%g6
	smul	%o5,	0x022F,	%g7
	edge32l	%i3,	%o2,	%l1
	edge16n	%i7,	%g5,	%g1
	smul	%l5,	%i2,	%i1
	restore %g2, 0x0832, %i5
	srax	%g4,	0x05,	%i4
	xorcc	%o0,	%l2,	%g3
	ldsb	[%l7 + 0x2D],	%i0
	umul	%o3,	%l6,	%l0
	subc	%o6,	0x16C3,	%l3
	movvs	%xcc,	%o4,	%o1
	restore %o7, %i6, %g6
	movpos	%xcc,	%l4,	%o5
	edge16n	%i3,	%o2,	%l1
	edge16l	%g7,	%g5,	%g1
	movpos	%xcc,	%l5,	%i7
	edge8	%i2,	%i1,	%i5
	edge32l	%g4,	%g2,	%o0
	smulcc	%l2,	0x1238,	%g3
	orncc	%i0,	%i4,	%l6
	subc	%l0,	%o6,	%o3
	addcc	%o4,	0x0935,	%l3
	movne	%icc,	%o1,	%o7
	sub	%g6,	0x0043,	%i6
	bshuffle	%f0,	%f6,	%f12
	fxors	%f8,	%f15,	%f8
	ldub	[%l7 + 0x3F],	%l4
	udivx	%i3,	0x1586,	%o2
	movl	%xcc,	%o5,	%g7
	srax	%g5,	0x15,	%g1
	st	%f3,	[%l7 + 0x7C]
	fmul8ulx16	%f12,	%f10,	%f2
	fmovsge	%icc,	%f4,	%f4
	fmovdne	%xcc,	%f10,	%f8
	fmovdneg	%icc,	%f2,	%f2
	add	%l1,	%l5,	%i2
	orncc	%i7,	0x013E,	%i5
	xorcc	%g4,	0x143F,	%g2
	xnorcc	%o0,	%l2,	%g3
	sllx	%i0,	0x01,	%i4
	lduh	[%l7 + 0x2C],	%l6
	restore %i1, %l0, %o6
	subc	%o4,	0x1FDB,	%l3
	save %o1, 0x078C, %o3
	andn	%g6,	%i6,	%l4
	movrgz	%i3,	%o2,	%o7
	edge8l	%g7,	%g5,	%g1
	for	%f14,	%f6,	%f4
	st	%f8,	[%l7 + 0x78]
	for	%f2,	%f14,	%f12
	udiv	%l1,	0x0C56,	%l5
	xnor	%i2,	%i7,	%i5
	fpsub16	%f6,	%f8,	%f4
	ldsh	[%l7 + 0x14],	%g4
	xorcc	%o5,	0x0686,	%o0
	fnand	%f14,	%f6,	%f14
	umulcc	%l2,	%g3,	%i0
	movl	%icc,	%g2,	%l6
	subccc	%i1,	%l0,	%i4
	movrne	%o6,	%l3,	%o4
	ldx	[%l7 + 0x08],	%o3
	movrgz	%o1,	%g6,	%i6
	movn	%icc,	%l4,	%i3
	fmovsleu	%icc,	%f9,	%f5
	movrgz	%o7,	0x05D,	%g7
	edge16	%o2,	%g5,	%l1
	udiv	%g1,	0x0386,	%l5
	ldd	[%l7 + 0x08],	%i6
	edge32l	%i2,	%i5,	%o5
	save %g4, 0x1084, %o0
	edge16l	%g3,	%i0,	%l2
	smul	%g2,	%l6,	%l0
	movgu	%xcc,	%i4,	%i1
	subcc	%l3,	%o6,	%o4
	edge8	%o1,	%g6,	%o3
	fmovdpos	%xcc,	%f1,	%f0
	movgu	%icc,	%i6,	%i3
	edge8l	%o7,	%g7,	%o2
	subccc	%g5,	%l1,	%g1
	movrne	%l4,	%l5,	%i2
	mulx	%i5,	0x010B,	%i7
	smulcc	%o5,	0x068A,	%o0
	or	%g3,	%i0,	%g4
	ldsb	[%l7 + 0x57],	%l2
	addc	%g2,	0x11B6,	%l6
	subc	%i4,	0x17FC,	%l0
	fcmpne16	%f2,	%f12,	%i1
	movgu	%icc,	%o6,	%l3
	edge32ln	%o4,	%g6,	%o1
	movleu	%xcc,	%o3,	%i3
	sub	%o7,	%g7,	%i6
	fors	%f6,	%f9,	%f0
	sdivcc	%o2,	0x1492,	%g5
	addccc	%l1,	0x1A6B,	%l4
	stx	%g1,	[%l7 + 0x60]
	andn	%i2,	%l5,	%i5
	ldsw	[%l7 + 0x34],	%i7
	movcc	%xcc,	%o5,	%g3
	ldd	[%l7 + 0x40],	%i0
	movleu	%icc,	%g4,	%o0
	lduh	[%l7 + 0x3E],	%l2
	smulcc	%l6,	0x1793,	%g2
	fmovrdne	%i4,	%f0,	%f14
	smul	%l0,	0x07E0,	%o6
	mulx	%i1,	0x1110,	%l3
	edge8l	%g6,	%o1,	%o4
	fors	%f11,	%f3,	%f2
	siam	0x2
	edge8l	%o3,	%i3,	%o7
	movrgz	%g7,	%i6,	%g5
	add	%l1,	0x1452,	%o2
	fpadd32s	%f13,	%f4,	%f3
	sth	%l4,	[%l7 + 0x0E]
	movrlz	%i2,	%g1,	%i5
	mulscc	%l5,	%o5,	%i7
	movge	%icc,	%g3,	%g4
	array8	%i0,	%o0,	%l6
	stw	%g2,	[%l7 + 0x58]
	udivx	%l2,	0x0091,	%i4
	movcs	%icc,	%l0,	%i1
	edge32n	%o6,	%l3,	%o1
	fmovdne	%xcc,	%f8,	%f12
	fmovspos	%icc,	%f0,	%f3
	edge8ln	%o4,	%g6,	%o3
	movleu	%xcc,	%o7,	%i3
	fmovscs	%icc,	%f7,	%f10
	edge8l	%g7,	%i6,	%l1
	lduw	[%l7 + 0x40],	%o2
	subcc	%l4,	0x129D,	%g5
	fmovscc	%xcc,	%f13,	%f2
	orncc	%i2,	0x1EEE,	%i5
	edge8n	%g1,	%o5,	%l5
	edge32n	%g3,	%g4,	%i0
	movg	%xcc,	%o0,	%l6
	ldsw	[%l7 + 0x64],	%g2
	udivx	%l2,	0x1687,	%i4
	fcmpne16	%f4,	%f14,	%l0
	movrgez	%i1,	%o6,	%l3
	restore %o1, 0x1FEC, %o4
	array32	%g6,	%o3,	%o7
	alignaddr	%i7,	%i3,	%g7
	fmovdne	%icc,	%f1,	%f4
	fsrc1s	%f5,	%f10
	movcs	%icc,	%i6,	%l1
	movre	%l4,	%o2,	%i2
	move	%xcc,	%g5,	%i5
	movle	%xcc,	%o5,	%l5
	movgu	%xcc,	%g1,	%g4
	orn	%i0,	0x0F33,	%g3
	stx	%l6,	[%l7 + 0x08]
	movvc	%icc,	%o0,	%l2
	edge8n	%g2,	%i4,	%i1
	stw	%l0,	[%l7 + 0x54]
	movleu	%icc,	%l3,	%o6
	sethi	0x0B46,	%o4
	xnorcc	%o1,	%o3,	%g6
	st	%f6,	[%l7 + 0x6C]
	fsrc1	%f2,	%f2
	xnorcc	%o7,	0x054A,	%i3
	fpsub32s	%f7,	%f4,	%f11
	andn	%i7,	%i6,	%g7
	addc	%l1,	0x072F,	%o2
	movpos	%xcc,	%i2,	%l4
	movrne	%g5,	%o5,	%i5
	sdiv	%l5,	0x1757,	%g4
	sub	%i0,	%g3,	%g1
	smul	%l6,	0x1B0A,	%o0
	sra	%g2,	%i4,	%l2
	fmovdpos	%icc,	%f6,	%f10
	fpmerge	%f15,	%f4,	%f0
	xor	%l0,	0x11AB,	%l3
	ldsh	[%l7 + 0x6C],	%o6
	smul	%i1,	%o4,	%o3
	fabss	%f2,	%f6
	edge8l	%g6,	%o1,	%i3
	movcs	%xcc,	%i7,	%i6
	movl	%xcc,	%o7,	%g7
	fmovd	%f2,	%f14
	sethi	0x12BD,	%o2
	ldsw	[%l7 + 0x3C],	%i2
	orncc	%l1,	0x0AC9,	%l4
	subcc	%g5,	%i5,	%l5
	movleu	%xcc,	%o5,	%g4
	fmovrdgz	%g3,	%f4,	%f6
	array32	%i0,	%l6,	%g1
	fmul8x16	%f14,	%f4,	%f14
	movvs	%icc,	%o0,	%g2
	smulcc	%l2,	%l0,	%i4
	movrne	%o6,	%i1,	%l3
	edge16ln	%o3,	%g6,	%o1
	subc	%i3,	0x1E80,	%i7
	subc	%i6,	0x1EB2,	%o7
	srl	%g7,	0x18,	%o4
	xnorcc	%i2,	%l1,	%o2
	umulcc	%l4,	%i5,	%g5
	edge32ln	%l5,	%g4,	%g3
	movrlez	%o5,	0x052,	%i0
	movg	%icc,	%l6,	%g1
	addcc	%g2,	0x05C9,	%o0
	or	%l0,	%l2,	%o6
	movcc	%icc,	%i4,	%l3
	fzero	%f4
	alignaddr	%i1,	%g6,	%o3
	fand	%f6,	%f2,	%f12
	fmovdgu	%icc,	%f9,	%f4
	movrgez	%i3,	%o1,	%i6
	sdivcc	%o7,	0x16A1,	%i7
	stb	%g7,	[%l7 + 0x5F]
	fmovrde	%o4,	%f4,	%f4
	movneg	%xcc,	%l1,	%o2
	lduh	[%l7 + 0x3E],	%l4
	xorcc	%i5,	0x0231,	%i2
	subcc	%l5,	%g5,	%g4
	addccc	%o5,	0x0B57,	%i0
	fandnot1	%f14,	%f10,	%f12
	andcc	%g3,	0x15E5,	%g1
	movg	%icc,	%g2,	%l6
	andncc	%o0,	%l0,	%o6
	movcs	%icc,	%l2,	%l3
	movne	%xcc,	%i4,	%g6
	edge16l	%o3,	%i1,	%i3
	ldsh	[%l7 + 0x3E],	%o1
	array32	%o7,	%i7,	%i6
	edge32	%o4,	%l1,	%o2
	xorcc	%g7,	0x093C,	%l4
	fpsub32	%f10,	%f8,	%f14
	fcmple16	%f10,	%f4,	%i5
	stb	%i2,	[%l7 + 0x77]
	fmovrdgez	%g5,	%f6,	%f14
	fmovdn	%xcc,	%f9,	%f12
	std	%f6,	[%l7 + 0x58]
	ldd	[%l7 + 0x68],	%g4
	ldsh	[%l7 + 0x38],	%l5
	movn	%xcc,	%o5,	%i0
	edge8	%g1,	%g3,	%g2
	save %o0, 0x152D, %l0
	ld	[%l7 + 0x10],	%f13
	edge32n	%l6,	%l2,	%l3
	fpsub16s	%f7,	%f5,	%f6
	edge8ln	%o6,	%i4,	%g6
	ldd	[%l7 + 0x78],	%f4
	movpos	%xcc,	%i1,	%o3
	alignaddrl	%i3,	%o7,	%o1
	addcc	%i7,	%i6,	%l1
	alignaddrl	%o2,	%o4,	%g7
	umulcc	%l4,	%i2,	%g5
	fpack16	%f10,	%f5
	ldx	[%l7 + 0x60],	%g4
	edge32ln	%l5,	%o5,	%i0
	movrlz	%i5,	0x2EC,	%g1
	subc	%g3,	0x14D3,	%o0
	movrne	%g2,	%l0,	%l6
	andn	%l3,	0x05DA,	%l2
	fcmpeq32	%f2,	%f0,	%i4
	andncc	%g6,	%o6,	%i1
	umul	%o3,	%i3,	%o7
	addccc	%i7,	%i6,	%l1
	xor	%o1,	0x06BF,	%o2
	stw	%o4,	[%l7 + 0x2C]
	andncc	%g7,	%i2,	%g5
	st	%f7,	[%l7 + 0x28]
	movgu	%xcc,	%l4,	%l5
	xnorcc	%g4,	%o5,	%i0
	mulx	%i5,	0x0070,	%g1
	andcc	%o0,	0x1E55,	%g2
	edge16n	%g3,	%l0,	%l3
	ldx	[%l7 + 0x30],	%l2
	fcmpne32	%f6,	%f4,	%i4
	xorcc	%l6,	0x0497,	%g6
	addcc	%i1,	0x0DDE,	%o6
	fnor	%f2,	%f0,	%f12
	movg	%xcc,	%o3,	%i3
	edge32n	%i7,	%i6,	%o7
	andncc	%o1,	%l1,	%o2
	fmovdne	%xcc,	%f2,	%f3
	ldd	[%l7 + 0x08],	%o4
	movge	%xcc,	%i2,	%g5
	ldd	[%l7 + 0x70],	%f2
	umulcc	%l4,	%l5,	%g7
	movg	%xcc,	%o5,	%i0
	movle	%xcc,	%g4,	%i5
	subc	%o0,	0x0DAD,	%g2
	movgu	%icc,	%g3,	%g1
	srl	%l3,	%l0,	%l2
	movrgz	%i4,	%l6,	%i1
	sdivx	%g6,	0x0FCC,	%o6
	sub	%o3,	0x150F,	%i3
	fpadd32s	%f12,	%f15,	%f7
	movgu	%xcc,	%i6,	%i7
	std	%f0,	[%l7 + 0x50]
	edge16l	%o7,	%l1,	%o2
	sllx	%o4,	%o1,	%i2
	fxnors	%f7,	%f4,	%f0
	or	%l4,	0x1B63,	%g5
	umul	%g7,	0x03E0,	%l5
	movrlz	%o5,	%i0,	%i5
	xor	%o0,	%g4,	%g2
	ldx	[%l7 + 0x60],	%g3
	stb	%l3,	[%l7 + 0x5C]
	popc	%l0,	%l2
	movpos	%xcc,	%g1,	%l6
	movne	%icc,	%i1,	%i4
	ldx	[%l7 + 0x40],	%o6
	st	%f1,	[%l7 + 0x14]
	edge32ln	%o3,	%i3,	%g6
	sdivcc	%i7,	0x1A24,	%i6
	stw	%l1,	[%l7 + 0x50]
	srl	%o7,	0x1E,	%o4
	andncc	%o2,	%i2,	%l4
	xor	%o1,	%g7,	%l5
	addccc	%g5,	0x0414,	%i0
	xnorcc	%o5,	0x04E2,	%o0
	alignaddr	%g4,	%i5,	%g3
	smul	%g2,	%l3,	%l0
	mulx	%l2,	0x165A,	%g1
	edge16	%i1,	%i4,	%l6
	ldx	[%l7 + 0x70],	%o6
	fnot1	%f14,	%f4
	andncc	%o3,	%i3,	%g6
	or	%i7,	0x174E,	%i6
	xnorcc	%l1,	0x1713,	%o7
	movpos	%xcc,	%o2,	%o4
	edge8	%i2,	%l4,	%o1
	fmovd	%f10,	%f6
	for	%f2,	%f4,	%f12
	movneg	%xcc,	%l5,	%g5
	ldsb	[%l7 + 0x77],	%i0
	movrlz	%g7,	0x0A4,	%o5
	edge16l	%g4,	%o0,	%i5
	lduw	[%l7 + 0x48],	%g3
	fmovdneg	%icc,	%f3,	%f5
	edge32	%l3,	%g2,	%l2
	array32	%g1,	%i1,	%i4
	ld	[%l7 + 0x7C],	%f12
	smul	%l6,	%o6,	%l0
	fnand	%f4,	%f8,	%f10
	alignaddr	%o3,	%i3,	%i7
	stb	%g6,	[%l7 + 0x09]
	ldsw	[%l7 + 0x2C],	%l1
	movneg	%xcc,	%o7,	%o2
	ld	[%l7 + 0x1C],	%f4
	movle	%icc,	%i6,	%o4
	add	%i2,	%l4,	%o1
	movpos	%xcc,	%l5,	%g5
	ldsw	[%l7 + 0x20],	%g7
	mulscc	%i0,	%o5,	%g4
	andn	%o0,	0x1887,	%i5
	edge16l	%l3,	%g2,	%l2
	fcmps	%fcc2,	%f4,	%f1
	fmovrslz	%g1,	%f14,	%f11
	fabsd	%f6,	%f12
	movne	%icc,	%g3,	%i1
	edge8ln	%l6,	%i4,	%o6
	movne	%icc,	%l0,	%i3
	fcmpne16	%f14,	%f12,	%i7
	edge32	%g6,	%l1,	%o3
	umulcc	%o2,	%o7,	%o4
	fmovrdne	%i6,	%f8,	%f10
	umulcc	%i2,	%o1,	%l5
	fmovsge	%xcc,	%f12,	%f15
	ldx	[%l7 + 0x68],	%l4
	ldx	[%l7 + 0x60],	%g7
	srax	%g5,	0x1C,	%o5
	movvs	%xcc,	%i0,	%o0
	sdiv	%g4,	0x07F4,	%i5
	save %g2, 0x1F19, %l3
	fmovsne	%xcc,	%f13,	%f1
	array32	%l2,	%g1,	%g3
	move	%xcc,	%l6,	%i1
	movl	%xcc,	%o6,	%l0
	movge	%icc,	%i3,	%i7
	xor	%i4,	0x0F9F,	%l1
	andncc	%o3,	%o2,	%o7
	siam	0x4
	or	%g6,	%i6,	%o4
	edge32l	%o1,	%l5,	%i2
	edge16n	%l4,	%g7,	%o5
	ldd	[%l7 + 0x40],	%f14
	sdiv	%i0,	0x0351,	%g5
	lduh	[%l7 + 0x0A],	%o0
	movvs	%xcc,	%i5,	%g2
	fandnot1s	%f2,	%f8,	%f3
	movge	%xcc,	%l3,	%g4
	ldsb	[%l7 + 0x77],	%l2
	fcmpeq16	%f4,	%f12,	%g3
	addccc	%l6,	0x0E2A,	%g1
	movg	%icc,	%i1,	%l0
	fmovrslz	%i3,	%f8,	%f9
	movrne	%o6,	0x284,	%i4
	stb	%l1,	[%l7 + 0x58]
	movle	%icc,	%o3,	%o2
	fmuld8ulx16	%f0,	%f8,	%f6
	ld	[%l7 + 0x10],	%f2
	fnegd	%f4,	%f8
	smulcc	%i7,	0x1F0C,	%o7
	smulcc	%g6,	0x099D,	%o4
	edge16n	%o1,	%i6,	%i2
	sethi	0x11F6,	%l4
	movvs	%xcc,	%l5,	%g7
	edge8	%o5,	%g5,	%o0
	ldub	[%l7 + 0x72],	%i5
	ldx	[%l7 + 0x40],	%i0
	xor	%g2,	%l3,	%l2
	fmovscc	%icc,	%f9,	%f1
	stb	%g4,	[%l7 + 0x69]
	movg	%icc,	%l6,	%g3
	fmovdpos	%xcc,	%f13,	%f4
	fcmpes	%fcc3,	%f1,	%f0
	xnorcc	%i1,	%g1,	%l0
	restore %o6, 0x1BBF, %i3
	mulx	%i4,	0x09F5,	%o3
	fmovsvs	%icc,	%f15,	%f5
	fnors	%f7,	%f2,	%f2
	edge16l	%l1,	%i7,	%o7
	xnor	%g6,	%o2,	%o4
	sll	%i6,	0x06,	%o1
	stx	%i2,	[%l7 + 0x38]
	movvc	%xcc,	%l4,	%g7
	std	%f12,	[%l7 + 0x18]
	movne	%xcc,	%l5,	%g5
	fcmpd	%fcc3,	%f0,	%f14
	xorcc	%o5,	0x08B1,	%o0
	edge8n	%i0,	%g2,	%l3
	srax	%l2,	0x04,	%i5
	array32	%g4,	%g3,	%i1
	srax	%l6,	%g1,	%l0
	addc	%o6,	0x13A2,	%i4
	smulcc	%o3,	0x15F2,	%i3
	array8	%i7,	%l1,	%g6
	xor	%o2,	%o7,	%o4
	addc	%o1,	0x0C6C,	%i2
	umul	%i6,	0x01F3,	%l4
	andcc	%g7,	0x19AF,	%l5
	ldx	[%l7 + 0x18],	%o5
	array8	%o0,	%g5,	%g2
	fone	%f8
	ldsb	[%l7 + 0x41],	%l3
	andncc	%i0,	%l2,	%g4
	or	%i5,	0x08E0,	%g3
	stx	%l6,	[%l7 + 0x30]
	umulcc	%g1,	%l0,	%i1
	edge16	%o6,	%i4,	%i3
	fpadd32	%f0,	%f0,	%f4
	fmovdgu	%xcc,	%f5,	%f1
	movg	%icc,	%o3,	%i7
	std	%f12,	[%l7 + 0x40]
	stb	%g6,	[%l7 + 0x13]
	srl	%l1,	%o2,	%o4
	ldsw	[%l7 + 0x78],	%o1
	sethi	0x04B0,	%i2
	movne	%xcc,	%i6,	%o7
	edge16l	%l4,	%g7,	%o5
	sethi	0x0BFB,	%l5
	fmovsvc	%icc,	%f7,	%f11
	fandnot1s	%f2,	%f10,	%f1
	movcc	%xcc,	%o0,	%g5
	fpadd16	%f0,	%f12,	%f10
	fpsub16	%f14,	%f0,	%f12
	fmovdle	%xcc,	%f15,	%f3
	edge8l	%g2,	%i0,	%l2
	fmovscc	%xcc,	%f10,	%f9
	edge32l	%l3,	%g4,	%g3
	ldd	[%l7 + 0x40],	%f12
	mova	%icc,	%l6,	%i5
	popc	%g1,	%l0
	srlx	%i1,	0x0F,	%o6
	movgu	%xcc,	%i3,	%i4
	orcc	%o3,	0x0BEF,	%g6
	movne	%icc,	%i7,	%o2
	subc	%o4,	0x00AF,	%l1
	pdist	%f4,	%f8,	%f10
	std	%f14,	[%l7 + 0x20]
	movpos	%icc,	%o1,	%i6
	umul	%o7,	%l4,	%g7
	andcc	%i2,	0x120D,	%l5
	and	%o5,	%o0,	%g5
	edge16ln	%g2,	%i0,	%l3
	sdivx	%g4,	0x060A,	%g3
	movvs	%icc,	%l2,	%i5
	fmovdne	%xcc,	%f1,	%f11
	movg	%xcc,	%g1,	%l0
	edge16	%i1,	%o6,	%i3
	udiv	%i4,	0x1279,	%l6
	sdivcc	%g6,	0x11F3,	%o3
	subc	%i7,	%o4,	%o2
	edge32	%o1,	%i6,	%o7
	udivx	%l4,	0x0739,	%l1
	srl	%g7,	%i2,	%o5
	movrlez	%o0,	0x39C,	%g5
	sub	%g2,	0x0EB0,	%i0
	st	%f13,	[%l7 + 0x1C]
	movcs	%icc,	%l5,	%l3
	ldsh	[%l7 + 0x28],	%g4
	stx	%g3,	[%l7 + 0x18]
	srax	%i5,	%l2,	%g1
	edge16l	%l0,	%o6,	%i1
	subc	%i3,	%i4,	%l6
	edge8l	%o3,	%g6,	%i7
	xor	%o4,	%o2,	%o1
	movne	%xcc,	%o7,	%l4
	fxnor	%f6,	%f4,	%f10
	ldx	[%l7 + 0x78],	%i6
	edge8	%l1,	%g7,	%i2
	fcmpeq16	%f0,	%f14,	%o0
	fmovde	%xcc,	%f9,	%f0
	save %o5, 0x1577, %g2
	movrne	%i0,	%g5,	%l5
	sra	%l3,	%g4,	%i5
	sdivx	%l2,	0x10E6,	%g1
	fsrc2s	%f3,	%f6
	edge32n	%l0,	%o6,	%i1
	popc	0x155C,	%i3
	movpos	%xcc,	%i4,	%l6
	ldx	[%l7 + 0x10],	%g3
	movleu	%icc,	%g6,	%o3
	xnor	%i7,	0x1741,	%o2
	stw	%o1,	[%l7 + 0x18]
	movleu	%icc,	%o7,	%o4
	sllx	%l4,	0x18,	%i6
	orncc	%g7,	0x05D4,	%i2
	add	%o0,	%o5,	%g2
	movrlz	%i0,	0x0F5,	%l1
	movne	%icc,	%l5,	%l3
	fnors	%f15,	%f4,	%f10
	movrlez	%g5,	0x055,	%i5
	ldx	[%l7 + 0x10],	%g4
	fmovrslz	%l2,	%f1,	%f2
	fmovdle	%xcc,	%f9,	%f4
	lduh	[%l7 + 0x5C],	%g1
	st	%f10,	[%l7 + 0x68]
	edge32ln	%o6,	%l0,	%i1
	st	%f9,	[%l7 + 0x40]
	edge16l	%i3,	%l6,	%i4
	edge8	%g6,	%g3,	%i7
	fandnot1s	%f9,	%f4,	%f3
	xnor	%o2,	0x1C1B,	%o3
	movrlz	%o1,	%o4,	%l4
	fmovdn	%xcc,	%f8,	%f4
	fcmpne32	%f8,	%f4,	%o7
	umul	%g7,	%i6,	%i2
	fands	%f9,	%f11,	%f0
	move	%xcc,	%o5,	%o0
	fsrc2	%f6,	%f2
	sethi	0x0D8F,	%i0
	sdiv	%g2,	0x0259,	%l5
	orcc	%l3,	0x08F7,	%g5
	restore %i5, 0x0329, %l1
	or	%l2,	0x0558,	%g4
	ld	[%l7 + 0x7C],	%f7
	restore %o6, %g1, %i1
	movgu	%icc,	%l0,	%i3
	udivx	%l6,	0x04FC,	%i4
	array16	%g3,	%i7,	%o2
	popc	0x13B5,	%o3
	fpadd16s	%f0,	%f14,	%f12
	alignaddr	%g6,	%o4,	%o1
	std	%f14,	[%l7 + 0x78]
	edge16ln	%l4,	%g7,	%i6
	movgu	%xcc,	%i2,	%o7
	fmovsvs	%xcc,	%f12,	%f13
	or	%o0,	%i0,	%o5
	edge32	%l5,	%l3,	%g2
	fnegs	%f12,	%f15
	fmovsvs	%xcc,	%f7,	%f8
	fnor	%f4,	%f10,	%f12
	or	%i5,	0x0817,	%l1
	alignaddr	%l2,	%g5,	%g4
	fmovspos	%icc,	%f15,	%f1
	or	%g1,	%o6,	%l0
	ldd	[%l7 + 0x70],	%f8
	stx	%i3,	[%l7 + 0x58]
	array8	%l6,	%i4,	%g3
	add	%i7,	%o2,	%o3
	edge32n	%i1,	%g6,	%o4
	fmovspos	%xcc,	%f3,	%f3
	andcc	%o1,	0x0EE7,	%g7
	ldx	[%l7 + 0x68],	%l4
	save %i2, 0x0C74, %o7
	array32	%o0,	%i6,	%o5
	udiv	%i0,	0x008E,	%l3
	udivcc	%g2,	0x1BA8,	%i5
	stx	%l5,	[%l7 + 0x18]
	array8	%l2,	%l1,	%g4
	mulscc	%g1,	0x14BA,	%o6
	sllx	%g5,	0x0A,	%i3
	movcc	%icc,	%l0,	%i4
	movvc	%icc,	%l6,	%i7
	srlx	%o2,	0x03,	%o3
	array16	%i1,	%g6,	%o4
	movvc	%icc,	%o1,	%g7
	orcc	%g3,	0x00F3,	%l4
	add	%o7,	%i2,	%o0
	fandnot1	%f12,	%f4,	%f4
	fmovrde	%i6,	%f12,	%f8
	ldsw	[%l7 + 0x34],	%i0
	movrgez	%o5,	0x39F,	%g2
	movrgez	%l3,	%i5,	%l2
	stw	%l5,	[%l7 + 0x34]
	ldd	[%l7 + 0x68],	%g4
	movne	%icc,	%g1,	%o6
	ldsh	[%l7 + 0x78],	%g5
	fcmpeq32	%f12,	%f8,	%l1
	smul	%i3,	0x1AAC,	%l0
	subcc	%l6,	0x10E0,	%i7
	edge16ln	%o2,	%o3,	%i4
	movge	%xcc,	%i1,	%g6
	sth	%o1,	[%l7 + 0x3E]
	edge32l	%o4,	%g3,	%g7
	movpos	%icc,	%l4,	%o7
	movl	%xcc,	%i2,	%o0
	movcc	%icc,	%i6,	%o5
	fsrc1s	%f11,	%f3
	fmovdle	%icc,	%f12,	%f15
	addccc	%g2,	%l3,	%i0
	udivx	%i5,	0x1E7D,	%l2
	andcc	%g4,	%g1,	%o6
	and	%g5,	0x12F7,	%l1
	subccc	%i3,	%l5,	%l0
	fpsub32s	%f0,	%f14,	%f13
	srlx	%l6,	%o2,	%i7
	movrgez	%i4,	%o3,	%i1
	fsrc2s	%f15,	%f10
	fcmpd	%fcc0,	%f4,	%f10
	fmovse	%xcc,	%f1,	%f7
	array32	%o1,	%g6,	%o4
	movg	%xcc,	%g7,	%l4
	ldsw	[%l7 + 0x08],	%g3
	alignaddr	%o7,	%o0,	%i6
	ld	[%l7 + 0x78],	%f12
	sll	%i2,	0x00,	%g2
	save %o5, 0x00FD, %i0
	fmovdvs	%icc,	%f2,	%f11
	edge32l	%i5,	%l2,	%g4
	mova	%icc,	%g1,	%o6
	addc	%g5,	%l1,	%i3
	fmovsle	%xcc,	%f12,	%f1
	andcc	%l3,	0x064B,	%l0
	ldsb	[%l7 + 0x62],	%l5
	fnand	%f4,	%f4,	%f10
	ld	[%l7 + 0x1C],	%f12
	xorcc	%o2,	%i7,	%i4
	movl	%xcc,	%l6,	%i1
	fmovsl	%xcc,	%f6,	%f1
	ldd	[%l7 + 0x40],	%o2
	edge8ln	%g6,	%o1,	%o4
	ldx	[%l7 + 0x58],	%g7
	movcs	%xcc,	%l4,	%g3
	movn	%icc,	%o0,	%o7
	or	%i2,	0x1A3F,	%i6
	array16	%g2,	%o5,	%i0
	fmul8x16	%f14,	%f8,	%f0
	udivcc	%l2,	0x18C7,	%i5
	movvc	%xcc,	%g1,	%o6
	fpackfix	%f12,	%f3
	fmovrslez	%g4,	%f10,	%f3
	array16	%g5,	%i3,	%l3
	orn	%l0,	0x0651,	%l5
	add	%o2,	%l1,	%i7
	andcc	%l6,	%i4,	%i1
	movleu	%icc,	%g6,	%o3
	umul	%o4,	%g7,	%o1
	ldsb	[%l7 + 0x3A],	%g3
	edge8n	%l4,	%o7,	%i2
	fmovsa	%icc,	%f7,	%f7
	sth	%o0,	[%l7 + 0x66]
	addccc	%i6,	%g2,	%o5
	alignaddr	%l2,	%i0,	%g1
	srlx	%i5,	%g4,	%g5
	sub	%o6,	%i3,	%l3
	umul	%l0,	0x147B,	%l5
	edge16l	%o2,	%i7,	%l6
	udivcc	%i4,	0x0A5A,	%i1
	sth	%g6,	[%l7 + 0x62]
	edge16n	%l1,	%o4,	%g7
	fone	%f2
	and	%o1,	%g3,	%o3
	subc	%l4,	%o7,	%o0
	fzeros	%f12
	lduh	[%l7 + 0x7C],	%i2
	edge32l	%i6,	%o5,	%g2
	edge8	%i0,	%g1,	%l2
	edge8ln	%i5,	%g5,	%o6
	array16	%g4,	%l3,	%i3
	array32	%l0,	%l5,	%i7
	move	%icc,	%o2,	%i4
	popc	%i1,	%l6
	movg	%icc,	%g6,	%o4
	fmovsneg	%xcc,	%f1,	%f4
	movleu	%xcc,	%g7,	%o1
	restore %g3, %l1, %o3
	orncc	%o7,	0x15BC,	%o0
	st	%f8,	[%l7 + 0x74]
	stx	%i2,	[%l7 + 0x58]
	and	%i6,	%o5,	%g2
	movrne	%i0,	0x321,	%l4
	fmovs	%f11,	%f12
	xnor	%g1,	%i5,	%g5
	mulscc	%o6,	%g4,	%l3
	fmul8ulx16	%f14,	%f10,	%f14
	ldub	[%l7 + 0x1A],	%l2
	std	%f10,	[%l7 + 0x18]
	fmovdgu	%icc,	%f4,	%f8
	stx	%i3,	[%l7 + 0x20]
	movrlez	%l0,	%l5,	%o2
	fmul8sux16	%f4,	%f14,	%f0
	stx	%i4,	[%l7 + 0x10]
	xorcc	%i7,	%l6,	%i1
	umulcc	%g6,	0x18A7,	%o4
	sdiv	%o1,	0x14FB,	%g7
	movgu	%xcc,	%g3,	%l1
	movrgz	%o3,	%o7,	%i2
	st	%f0,	[%l7 + 0x70]
	array8	%o0,	%i6,	%g2
	movvs	%xcc,	%i0,	%l4
	sth	%o5,	[%l7 + 0x0C]
	alignaddrl	%g1,	%g5,	%o6
	lduh	[%l7 + 0x4E],	%g4
	edge8n	%l3,	%l2,	%i3
	udiv	%i5,	0x0A22,	%l0
	move	%icc,	%o2,	%i4
	movcs	%xcc,	%l5,	%l6
	ldsh	[%l7 + 0x7A],	%i1
	movg	%icc,	%g6,	%o4
	fpadd32	%f6,	%f0,	%f2
	umulcc	%o1,	%g7,	%g3
	fcmpes	%fcc2,	%f3,	%f9
	stb	%i7,	[%l7 + 0x0E]
	andn	%l1,	%o3,	%i2
	movneg	%xcc,	%o0,	%o7
	orcc	%g2,	0x1FCE,	%i0
	fpadd32s	%f5,	%f4,	%f0
	ldx	[%l7 + 0x68],	%i6
	movrlez	%o5,	%g1,	%g5
	ldub	[%l7 + 0x41],	%o6
	fxor	%f10,	%f10,	%f6
	edge16ln	%g4,	%l3,	%l4
	fmovdvs	%icc,	%f4,	%f15
	movrgez	%l2,	%i3,	%i5
	fpsub32	%f10,	%f12,	%f10
	fmovdge	%icc,	%f9,	%f7
	movpos	%icc,	%o2,	%i4
	restore %l5, 0x0700, %l6
	edge8l	%i1,	%l0,	%o4
	sdivcc	%g6,	0x0647,	%g7
	smul	%g3,	0x009B,	%i7
	ldsh	[%l7 + 0x32],	%o1
	fmovsvc	%xcc,	%f7,	%f5
	ldsh	[%l7 + 0x76],	%o3
	fzero	%f10
	sub	%i2,	0x046A,	%l1
	srl	%o0,	0x18,	%g2
	edge8ln	%i0,	%i6,	%o5
	xorcc	%g1,	%g5,	%o6
	edge16l	%g4,	%o7,	%l4
	alignaddr	%l2,	%i3,	%l3
	fandnot1s	%f9,	%f12,	%f7
	edge32ln	%o2,	%i4,	%i5
	xor	%l6,	%i1,	%l5
	addccc	%l0,	%g6,	%o4
	fmovrdgz	%g3,	%f12,	%f2
	fxors	%f10,	%f15,	%f1
	fexpand	%f14,	%f6
	movgu	%xcc,	%g7,	%i7
	fornot2	%f8,	%f6,	%f2
	movre	%o3,	0x087,	%o1
	or	%i2,	0x02D5,	%l1
	sdivx	%o0,	0x0C9E,	%g2
	fmul8x16au	%f2,	%f4,	%f0
	fnands	%f3,	%f1,	%f0
	st	%f14,	[%l7 + 0x58]
	udivcc	%i6,	0x1078,	%i0
	movneg	%xcc,	%g1,	%g5
	ldsh	[%l7 + 0x50],	%o5
	restore %o6, 0x0AFD, %o7
	restore %g4, %l2, %i3
	movvs	%icc,	%l3,	%o2
	edge8l	%l4,	%i5,	%i4
	fxnors	%f5,	%f7,	%f12
	fmovde	%xcc,	%f8,	%f10
	fmovrdgz	%l6,	%f12,	%f14
	andcc	%l5,	%l0,	%i1
	fmovrslz	%o4,	%f4,	%f14
	movvc	%icc,	%g3,	%g6
	movrlz	%g7,	0x164,	%o3
	fnot2	%f8,	%f4
	array8	%i7,	%i2,	%l1
	array16	%o0,	%g2,	%i6
	fmovdneg	%icc,	%f14,	%f7
	popc	%o1,	%g1
	fsrc1s	%f0,	%f0
	sdivx	%g5,	0x174A,	%i0
	movg	%icc,	%o5,	%o6
	subc	%g4,	%o7,	%l2
	edge32l	%l3,	%o2,	%i3
	array8	%l4,	%i5,	%i4
	ldsh	[%l7 + 0x20],	%l6
	umul	%l0,	%l5,	%o4
	ldub	[%l7 + 0x36],	%g3
	fmovrde	%g6,	%f0,	%f8
	bshuffle	%f0,	%f4,	%f0
	srlx	%g7,	0x15,	%o3
	movn	%icc,	%i7,	%i2
	andncc	%i1,	%o0,	%l1
	edge8ln	%g2,	%i6,	%g1
	andcc	%g5,	0x1AA7,	%i0
	fzeros	%f5
	fnot2s	%f10,	%f6
	movcs	%xcc,	%o5,	%o1
	fmovsa	%xcc,	%f12,	%f8
	fornot2s	%f0,	%f7,	%f2
	xnorcc	%g4,	0x0A1E,	%o7
	edge8n	%o6,	%l3,	%o2
	movne	%icc,	%l2,	%i3
	movneg	%xcc,	%i5,	%i4
	fornot2	%f8,	%f12,	%f2
	movcs	%xcc,	%l6,	%l4
	edge16	%l0,	%o4,	%l5
	fmovsle	%icc,	%f4,	%f9
	udiv	%g6,	0x12FF,	%g7
	sub	%g3,	%i7,	%o3
	fnot2	%f10,	%f12
	orcc	%i2,	0x1BDA,	%o0
	andn	%l1,	0x1A6C,	%i1
	fmovsgu	%xcc,	%f8,	%f12
	movrlez	%i6,	%g2,	%g5
	fornot2	%f6,	%f0,	%f10
	movrlz	%g1,	0x39C,	%i0
	xnor	%o5,	%o1,	%g4
	andn	%o6,	0x1CE2,	%l3
	orcc	%o2,	0x0C23,	%o7
	smul	%i3,	%i5,	%l2
	ldub	[%l7 + 0x1F],	%l6
	add	%l4,	%l0,	%i4
	fmovdvc	%xcc,	%f5,	%f2
	orncc	%o4,	0x1130,	%l5
	lduw	[%l7 + 0x20],	%g6
	edge16n	%g7,	%g3,	%i7
	st	%f2,	[%l7 + 0x78]
	umulcc	%o3,	%o0,	%i2
	sdivcc	%i1,	0x0902,	%i6
	movneg	%xcc,	%l1,	%g5
	sdivx	%g2,	0x13BC,	%i0
	popc	%o5,	%g1
	edge16	%o1,	%g4,	%o6
	st	%f14,	[%l7 + 0x3C]
	xnorcc	%o2,	%l3,	%i3
	movre	%i5,	%l2,	%l6
	move	%xcc,	%o7,	%l0
	fxors	%f8,	%f2,	%f14
	srlx	%l4,	0x08,	%o4
	xnor	%i4,	%l5,	%g7
	andncc	%g6,	%g3,	%i7
	ldd	[%l7 + 0x20],	%o0
	fpsub32	%f0,	%f0,	%f8
	ldub	[%l7 + 0x0F],	%o3
	fmovscs	%xcc,	%f0,	%f13
	fcmpne16	%f4,	%f14,	%i2
	addccc	%i6,	0x0638,	%l1
	fabss	%f2,	%f13
	array16	%i1,	%g2,	%i0
	fmovda	%xcc,	%f2,	%f2
	fabsd	%f4,	%f6
	movrgz	%o5,	%g1,	%o1
	fxnors	%f6,	%f12,	%f14
	orcc	%g4,	%o6,	%o2
	addcc	%g5,	%l3,	%i5
	fornot2	%f0,	%f8,	%f14
	and	%l2,	0x0F9C,	%i3
	array8	%l6,	%o7,	%l4
	movvs	%xcc,	%l0,	%o4
	subccc	%l5,	0x0B90,	%g7
	or	%i4,	%g6,	%g3
	movvc	%icc,	%o0,	%i7
	umul	%i2,	0x1513,	%o3
	movvs	%xcc,	%l1,	%i6
	sllx	%g2,	%i0,	%i1
	movleu	%icc,	%o5,	%o1
	orn	%g1,	0x1EA5,	%g4
	fnor	%f8,	%f2,	%f4
	movrgez	%o6,	%g5,	%l3
	fpadd32	%f12,	%f14,	%f12
	add	%o2,	%i5,	%i3
	smul	%l6,	0x1FC2,	%l2
	fmul8ulx16	%f6,	%f14,	%f8
	movg	%icc,	%o7,	%l0
	fcmple32	%f8,	%f0,	%o4
	edge8l	%l4,	%l5,	%i4
	movrne	%g6,	0x183,	%g7
	movrgez	%o0,	%g3,	%i2
	edge16ln	%i7,	%o3,	%l1
	movne	%icc,	%i6,	%g2
	movpos	%icc,	%i0,	%i1
	fmovrsgez	%o5,	%f15,	%f13
	array8	%g1,	%o1,	%g4
	fsrc1	%f10,	%f4
	movrgz	%g5,	0x3F8,	%l3
	orn	%o6,	%i5,	%i3
	alignaddrl	%l6,	%l2,	%o7
	sra	%o2,	0x1F,	%o4
	fcmped	%fcc2,	%f2,	%f4
	umul	%l0,	0x0B1A,	%l4
	addc	%l5,	0x0C39,	%i4
	movrgz	%g6,	0x0E1,	%g7
	move	%xcc,	%o0,	%i2
	edge32n	%g3,	%o3,	%l1
	udiv	%i7,	0x0127,	%g2
	fsrc1s	%f2,	%f8
	array32	%i0,	%i1,	%i6
	movvc	%icc,	%o5,	%o1
	xor	%g1,	0x0199,	%g4
	fmul8x16au	%f12,	%f5,	%f14
	stw	%g5,	[%l7 + 0x1C]
	siam	0x2
	or	%l3,	0x1977,	%i5
	stw	%o6,	[%l7 + 0x30]
	edge8ln	%l6,	%l2,	%i3
	fmovspos	%icc,	%f9,	%f5
	stb	%o2,	[%l7 + 0x37]
	movpos	%xcc,	%o7,	%l0
	array32	%l4,	%l5,	%o4
	sethi	0x14CD,	%g6
	srl	%g7,	%o0,	%i2
	movneg	%xcc,	%i4,	%g3
	fmovsa	%xcc,	%f9,	%f7
	xnor	%o3,	0x0F32,	%l1
	ldsw	[%l7 + 0x0C],	%g2
	movneg	%xcc,	%i7,	%i0
	sra	%i1,	0x03,	%i6
	xnorcc	%o5,	%o1,	%g4
	edge8	%g1,	%l3,	%g5
	fcmple16	%f2,	%f0,	%i5
	move	%icc,	%o6,	%l6
	edge8l	%i3,	%l2,	%o7
	movrgez	%o2,	%l0,	%l4
	fmovrde	%l5,	%f0,	%f10
	sra	%o4,	%g7,	%g6
	alignaddrl	%i2,	%o0,	%i4
	movcc	%icc,	%g3,	%o3
	srax	%l1,	%i7,	%g2
	orcc	%i0,	0x0CCC,	%i6
	alignaddrl	%o5,	%i1,	%o1
	fabsd	%f2,	%f4
	edge16n	%g4,	%g1,	%g5
	movvc	%icc,	%i5,	%l3
	move	%icc,	%o6,	%l6
	movgu	%xcc,	%i3,	%o7
	xorcc	%l2,	%o2,	%l0
	move	%xcc,	%l4,	%o4
	ldd	[%l7 + 0x30],	%g6
	sth	%l5,	[%l7 + 0x24]
	subcc	%g6,	0x0BFF,	%o0
	movrgz	%i4,	%g3,	%i2
	addcc	%o3,	0x1553,	%l1
	movre	%g2,	0x039,	%i7
	edge8ln	%i6,	%i0,	%o5
	edge8	%i1,	%o1,	%g4
	udiv	%g5,	0x08D2,	%g1
	std	%f8,	[%l7 + 0x50]
	fmovda	%icc,	%f2,	%f15
	movrne	%l3,	%i5,	%l6
	fnand	%f6,	%f12,	%f2
	fmovdpos	%icc,	%f7,	%f7
	smulcc	%o6,	0x13C6,	%i3
	fexpand	%f11,	%f4
	fmovsle	%icc,	%f7,	%f9
	movvc	%icc,	%l2,	%o2
	fpack16	%f2,	%f6
	fmovdle	%icc,	%f12,	%f6
	stw	%l0,	[%l7 + 0x28]
	st	%f12,	[%l7 + 0x2C]
	fmovse	%icc,	%f1,	%f15
	umulcc	%o7,	%l4,	%o4
	addccc	%g7,	%l5,	%g6
	ld	[%l7 + 0x38],	%f11
	lduw	[%l7 + 0x48],	%i4
	fpackfix	%f4,	%f0
	sdivx	%g3,	0x04C8,	%i2
	smul	%o0,	0x17B8,	%l1
	orncc	%g2,	%i7,	%o3
	movleu	%xcc,	%i0,	%i6
	fmovdge	%icc,	%f11,	%f7
	movpos	%icc,	%i1,	%o5
	edge16l	%g4,	%o1,	%g1
	st	%f8,	[%l7 + 0x68]
	srl	%l3,	0x1F,	%i5
	edge32ln	%l6,	%o6,	%g5
	sth	%i3,	[%l7 + 0x3A]
	umulcc	%o2,	0x09A7,	%l0
	save %o7, 0x0DC2, %l2
	xorcc	%l4,	0x1738,	%g7
	array32	%l5,	%o4,	%g6
	sll	%i4,	%i2,	%g3
	stx	%l1,	[%l7 + 0x78]
	fsrc2	%f14,	%f14
	srl	%o0,	0x09,	%i7
	fmovda	%icc,	%f11,	%f15
	movgu	%xcc,	%g2,	%i0
	udiv	%o3,	0x00A5,	%i1
	array8	%i6,	%g4,	%o1
	edge16n	%g1,	%o5,	%i5
	orcc	%l6,	0x07FD,	%o6
	fmovdgu	%xcc,	%f11,	%f5
	fnot2s	%f5,	%f12
	fmovsvc	%icc,	%f12,	%f7
	orncc	%g5,	0x1413,	%i3
	movge	%xcc,	%o2,	%l3
	edge8ln	%l0,	%l2,	%o7
	andcc	%l4,	0x0AA2,	%l5
	edge8ln	%g7,	%o4,	%g6
	srlx	%i2,	0x1D,	%i4
	edge16l	%g3,	%l1,	%i7
	udivx	%g2,	0x0C65,	%i0
	ldx	[%l7 + 0x38],	%o3
	ldsb	[%l7 + 0x55],	%i1
	mulx	%o0,	0x1AE4,	%i6
	fxnors	%f9,	%f0,	%f6
	ldsh	[%l7 + 0x62],	%o1
	fsrc1	%f8,	%f0
	restore %g4, 0x031A, %o5
	fand	%f2,	%f2,	%f4
	addcc	%g1,	0x146F,	%i5
	edge32l	%l6,	%g5,	%o6
	orncc	%i3,	%o2,	%l0
	and	%l3,	%l2,	%o7
	fmovdcs	%xcc,	%f0,	%f10
	movgu	%xcc,	%l5,	%g7
	fmovdne	%xcc,	%f8,	%f10
	fmovde	%icc,	%f8,	%f6
	edge32ln	%o4,	%l4,	%i2
	ldsh	[%l7 + 0x70],	%i4
	ld	[%l7 + 0x5C],	%f10
	sth	%g3,	[%l7 + 0x42]
	xorcc	%g6,	0x1D84,	%l1
	umul	%i7,	%g2,	%o3
	fornot1	%f10,	%f10,	%f6
	udivcc	%i1,	0x1DEB,	%o0
	bshuffle	%f6,	%f14,	%f12
	ldd	[%l7 + 0x10],	%f12
	movvs	%xcc,	%i6,	%o1
	move	%icc,	%g4,	%o5
	fcmps	%fcc2,	%f14,	%f7
	sll	%i0,	0x1B,	%i5
	stb	%l6,	[%l7 + 0x2C]
	fones	%f7
	move	%xcc,	%g5,	%o6
	movg	%xcc,	%g1,	%i3
	mulscc	%o2,	0x0D76,	%l3
	edge16n	%l2,	%o7,	%l0
	subc	%l5,	0x1035,	%o4
	xor	%l4,	%i2,	%g7
	fnand	%f0,	%f8,	%f10
	fmovdle	%xcc,	%f11,	%f1
	xnorcc	%g3,	%i4,	%g6
	fandnot1	%f12,	%f8,	%f14
	smul	%i7,	0x1B7F,	%g2
	siam	0x7
	xnor	%l1,	%o3,	%o0
	fmovsn	%xcc,	%f12,	%f7
	movl	%icc,	%i6,	%o1
	edge32n	%i1,	%o5,	%g4
	udivcc	%i0,	0x052E,	%l6
	fcmpne16	%f8,	%f12,	%g5
	sdivcc	%i5,	0x1C2A,	%o6
	srl	%i3,	%g1,	%o2
	movgu	%icc,	%l2,	%o7
	movrlz	%l0,	%l3,	%o4
	fpack32	%f14,	%f10,	%f14
	movneg	%icc,	%l4,	%i2
	fmovdgu	%xcc,	%f6,	%f2
	sdiv	%l5,	0x0240,	%g3
	srax	%g7,	%g6,	%i7
	sdiv	%i4,	0x001D,	%l1
	edge16l	%o3,	%o0,	%g2
	smulcc	%i6,	0x042D,	%i1
	movneg	%xcc,	%o1,	%g4
	movn	%xcc,	%i0,	%o5
	fmovdge	%icc,	%f1,	%f9
	lduh	[%l7 + 0x6A],	%l6
	ldx	[%l7 + 0x28],	%g5
	pdist	%f2,	%f14,	%f8
	sdivcc	%o6,	0x1B6D,	%i3
	sub	%i5,	0x0B4E,	%g1
	lduh	[%l7 + 0x34],	%l2
	subccc	%o2,	0x105F,	%o7
	movcc	%xcc,	%l3,	%l0
	movrgz	%o4,	0x381,	%l4
	or	%i2,	%g3,	%g7
	movre	%l5,	0x222,	%i7
	fcmpd	%fcc1,	%f0,	%f14
	fmovsa	%icc,	%f12,	%f6
	fnot2s	%f2,	%f0
	movre	%i4,	%g6,	%l1
	xorcc	%o0,	%o3,	%i6
	fnegd	%f2,	%f8
	lduh	[%l7 + 0x72],	%g2
	movvs	%icc,	%o1,	%i1
	movrgez	%g4,	%o5,	%l6
	smulcc	%i0,	%o6,	%i3
	fmovd	%f8,	%f8
	udivx	%g5,	0x00B3,	%i5
	fcmpgt32	%f6,	%f6,	%g1
	subccc	%o2,	0x0CDB,	%l2
	ldsh	[%l7 + 0x48],	%o7
	movleu	%xcc,	%l3,	%l0
	xnor	%l4,	%i2,	%o4
	array8	%g3,	%l5,	%i7
	ld	[%l7 + 0x58],	%f13
	addccc	%g7,	0x0EBA,	%g6
	umul	%i4,	%l1,	%o3
	addc	%o0,	%g2,	%o1
	ldsh	[%l7 + 0x2E],	%i1
	movgu	%xcc,	%i6,	%g4
	edge16l	%l6,	%o5,	%o6
	srlx	%i0,	0x07,	%g5
	move	%icc,	%i3,	%g1
	stx	%i5,	[%l7 + 0x78]
	stb	%l2,	[%l7 + 0x23]
	edge8ln	%o7,	%l3,	%l0
	edge8n	%l4,	%o2,	%i2
	stx	%g3,	[%l7 + 0x58]
	fcmpne32	%f0,	%f6,	%o4
	subc	%i7,	0x08F0,	%g7
	movrgz	%l5,	%g6,	%l1
	srax	%o3,	%i4,	%g2
	st	%f5,	[%l7 + 0x7C]
	fmovdleu	%icc,	%f6,	%f15
	array16	%o1,	%i1,	%o0
	andcc	%g4,	0x045A,	%l6
	umul	%o5,	%i6,	%o6
	mulx	%i0,	0x065C,	%g5
	movcs	%icc,	%i3,	%i5
	udiv	%g1,	0x0512,	%l2
	udivcc	%l3,	0x0FEA,	%l0
	edge32n	%l4,	%o7,	%i2
	umulcc	%g3,	%o4,	%i7
	fpadd16	%f2,	%f8,	%f10
	movgu	%xcc,	%o2,	%g7
	subccc	%l5,	0x1DA1,	%l1
	movcs	%xcc,	%g6,	%o3
	andn	%i4,	%o1,	%g2
	or	%o0,	0x1A81,	%g4
	movne	%icc,	%l6,	%o5
	sra	%i1,	0x01,	%i6
	std	%f4,	[%l7 + 0x38]
	fmovdpos	%xcc,	%f15,	%f2
	pdist	%f14,	%f0,	%f4
	movge	%xcc,	%i0,	%g5
	movpos	%icc,	%i3,	%o6
	lduh	[%l7 + 0x56],	%g1
	movvc	%xcc,	%l2,	%l3
	ldub	[%l7 + 0x0F],	%l0
	array32	%i5,	%o7,	%l4
	stb	%g3,	[%l7 + 0x5F]
	movrne	%o4,	%i2,	%i7
	sdiv	%g7,	0x03BD,	%l5
	fcmpgt16	%f8,	%f0,	%l1
	edge16	%o2,	%o3,	%g6
	array16	%o1,	%i4,	%g2
	edge8l	%o0,	%g4,	%o5
	movg	%icc,	%i1,	%i6
	ldx	[%l7 + 0x40],	%l6
	fnors	%f10,	%f9,	%f10
	sethi	0x1D66,	%i0
	addcc	%i3,	0x166D,	%o6
	edge32	%g1,	%g5,	%l2
	ldsh	[%l7 + 0x40],	%l3
	fmovdle	%xcc,	%f0,	%f6
	ldsw	[%l7 + 0x54],	%l0
	sdivcc	%o7,	0x0A44,	%i5
	fmovdcc	%icc,	%f11,	%f13
	udiv	%l4,	0x1FC3,	%o4
	xorcc	%i2,	0x0930,	%i7
	xorcc	%g3,	0x0746,	%g7
	andcc	%l5,	%o2,	%o3
	add	%l1,	%g6,	%i4
	array8	%g2,	%o1,	%o0
	sth	%g4,	[%l7 + 0x74]
	edge8l	%i1,	%i6,	%o5
	srlx	%i0,	0x09,	%i3
	addccc	%l6,	0x09D9,	%o6
	edge32ln	%g5,	%g1,	%l2
	edge16ln	%l3,	%o7,	%l0
	stx	%i5,	[%l7 + 0x68]
	movrgz	%o4,	%i2,	%l4
	movle	%xcc,	%i7,	%g3
	subccc	%g7,	%l5,	%o2
	addccc	%o3,	%l1,	%g6
	fpsub16s	%f10,	%f13,	%f15
	fpsub16s	%f10,	%f1,	%f6
	ldd	[%l7 + 0x50],	%f0
	fmovsn	%icc,	%f13,	%f5
	edge8	%g2,	%o1,	%o0
	fmovdgu	%icc,	%f9,	%f15
	fnegd	%f2,	%f6
	umulcc	%g4,	0x1ABB,	%i1
	sll	%i4,	0x02,	%i6
	array8	%i0,	%i3,	%l6
	fpadd16s	%f5,	%f10,	%f12
	movvc	%xcc,	%o6,	%g5
	fmovsvc	%icc,	%f14,	%f3
	ldsb	[%l7 + 0x4B],	%g1
	xorcc	%l2,	%l3,	%o7
	fpsub16s	%f9,	%f13,	%f4
	fmovrsgz	%o5,	%f1,	%f12
	fpadd16s	%f6,	%f9,	%f7
	movrlez	%i5,	%l0,	%i2
	fcmpgt16	%f8,	%f0,	%l4
	lduh	[%l7 + 0x50],	%o4
	ldd	[%l7 + 0x70],	%i6
	xorcc	%g3,	%g7,	%o2
	edge32	%o3,	%l1,	%g6
	ldsb	[%l7 + 0x22],	%l5
	fmovdn	%icc,	%f3,	%f9
	sdivx	%o1,	0x0F21,	%g2
	ldd	[%l7 + 0x38],	%f14
	movg	%icc,	%g4,	%o0
	edge16ln	%i1,	%i4,	%i6
	edge32ln	%i0,	%i3,	%o6
	subc	%l6,	0x01C3,	%g1
	restore %g5, %l3, %o7
	movpos	%icc,	%l2,	%i5
	edge8ln	%o5,	%i2,	%l0
	alignaddr	%l4,	%i7,	%g3
	movle	%xcc,	%o4,	%g7
	save %o2, 0x1F7D, %l1
	umulcc	%g6,	0x076C,	%o3
	fmovdn	%icc,	%f8,	%f11
	fmovsvc	%icc,	%f1,	%f14
	edge32n	%o1,	%g2,	%g4
	fmovsa	%xcc,	%f12,	%f5
	fpsub16	%f6,	%f6,	%f0
	edge8n	%l5,	%o0,	%i1
	sll	%i6,	0x1E,	%i0
	edge8ln	%i4,	%i3,	%l6
	movgu	%icc,	%o6,	%g5
	ldsb	[%l7 + 0x42],	%l3
	fmovrdlez	%o7,	%f10,	%f12
	fpsub32s	%f10,	%f3,	%f7
	udivcc	%g1,	0x0CE4,	%l2
	fmovdvc	%xcc,	%f14,	%f9
	movle	%xcc,	%i5,	%o5
	movl	%xcc,	%i2,	%l0
	subc	%l4,	%g3,	%i7
	movleu	%xcc,	%g7,	%o2
	fmovse	%icc,	%f11,	%f6
	and	%o4,	0x1539,	%l1
	fmovdvc	%icc,	%f12,	%f9
	udiv	%o3,	0x1A05,	%g6
	ldd	[%l7 + 0x68],	%f10
	popc	0x0C72,	%g2
	stb	%g4,	[%l7 + 0x42]
	ldx	[%l7 + 0x50],	%l5
	lduh	[%l7 + 0x08],	%o1
	edge8ln	%i1,	%o0,	%i0
	movne	%xcc,	%i6,	%i3
	fmovdn	%xcc,	%f15,	%f12
	movleu	%xcc,	%i4,	%l6
	movgu	%icc,	%o6,	%l3
	alignaddrl	%o7,	%g5,	%g1
	subccc	%i5,	%l2,	%o5
	ldd	[%l7 + 0x78],	%f10
	ldd	[%l7 + 0x78],	%i2
	fmovdleu	%icc,	%f3,	%f12
	sdivcc	%l0,	0x15E8,	%l4
	and	%i7,	%g3,	%o2
	sethi	0x1254,	%o4
	edge16	%l1,	%o3,	%g7
	udiv	%g6,	0x10FF,	%g4
	udivcc	%g2,	0x1EC3,	%l5
	alignaddrl	%o1,	%i1,	%o0
	movvc	%xcc,	%i6,	%i3
	edge8ln	%i0,	%l6,	%o6
	movre	%i4,	%o7,	%l3
	array8	%g5,	%g1,	%i5
	movrlez	%l2,	0x096,	%i2
	srax	%o5,	0x0F,	%l4
	ld	[%l7 + 0x28],	%f3
	fand	%f14,	%f10,	%f10
	movgu	%xcc,	%i7,	%g3
	fmovdge	%icc,	%f14,	%f11
	sub	%l0,	0x00ED,	%o4
	srlx	%l1,	%o3,	%g7
	sll	%o2,	0x1D,	%g6
	stw	%g4,	[%l7 + 0x30]
	andn	%g2,	0x046D,	%o1
	xor	%l5,	%i1,	%i6
	movrgez	%i3,	0x33B,	%i0
	lduh	[%l7 + 0x54],	%o0
	ldx	[%l7 + 0x28],	%l6
	xor	%i4,	0x0549,	%o6
	fmovdne	%xcc,	%f13,	%f12
	stb	%l3,	[%l7 + 0x42]
	ldd	[%l7 + 0x50],	%f10
	subc	%o7,	0x0781,	%g5
	fnands	%f11,	%f13,	%f9
	udivx	%g1,	0x17DA,	%l2
	movgu	%xcc,	%i2,	%i5
	smulcc	%o5,	0x1F9A,	%l4
	fnands	%f11,	%f8,	%f6
	smulcc	%g3,	0x0E5B,	%i7
	xnorcc	%o4,	0x1DB9,	%l1
	subccc	%o3,	0x0F51,	%g7
	ldub	[%l7 + 0x44],	%o2
	edge16ln	%l0,	%g4,	%g6
	fmovd	%f10,	%f6
	subcc	%g2,	0x1460,	%o1
	orcc	%l5,	%i1,	%i6
	save %i3, %o0, %i0
	smulcc	%i4,	%l6,	%o6
	std	%f8,	[%l7 + 0x50]
	ldd	[%l7 + 0x70],	%f4
	xor	%l3,	0x1CDB,	%o7
	fmovrsne	%g1,	%f6,	%f15
	fmovsgu	%icc,	%f3,	%f0
	fmovsa	%icc,	%f15,	%f5
	fmovsl	%xcc,	%f3,	%f14
	movne	%icc,	%g5,	%i2
	movne	%icc,	%i5,	%o5
	fmovsne	%xcc,	%f10,	%f4
	fmovrdgz	%l4,	%f6,	%f6
	sllx	%l2,	%i7,	%o4
	movrlez	%g3,	0x09B,	%l1
	ldx	[%l7 + 0x28],	%o3
	fmovdle	%xcc,	%f8,	%f13
	sdivx	%g7,	0x1079,	%o2
	sdivx	%l0,	0x195D,	%g6
	movcs	%icc,	%g4,	%g2
	edge8	%l5,	%i1,	%o1
	edge32n	%i6,	%o0,	%i3
	or	%i0,	0x01B1,	%i4
	or	%o6,	0x14D4,	%l3
	ldsh	[%l7 + 0x46],	%l6
	movg	%icc,	%g1,	%g5
	edge8	%i2,	%i5,	%o7
	addccc	%l4,	0x0332,	%o5
	addc	%l2,	%o4,	%g3
	mova	%icc,	%l1,	%o3
	fcmped	%fcc1,	%f4,	%f0
	xor	%i7,	%o2,	%l0
	fmul8ulx16	%f4,	%f0,	%f6
	orcc	%g6,	0x05D7,	%g7
	array8	%g2,	%l5,	%i1
	fcmpd	%fcc0,	%f0,	%f0
	edge16l	%o1,	%i6,	%g4
	fornot2	%f14,	%f10,	%f8
	movne	%xcc,	%o0,	%i3
	sdivx	%i0,	0x12FD,	%i4
	subc	%o6,	0x1FD4,	%l6
	xor	%g1,	0x1A4A,	%g5
	orncc	%l3,	0x10C0,	%i5
	subcc	%o7,	0x0906,	%l4
	edge32n	%o5,	%i2,	%o4
	xnorcc	%g3,	%l1,	%o3
	movle	%xcc,	%i7,	%l2
	xnor	%o2,	0x0B86,	%l0
	fmuld8ulx16	%f0,	%f3,	%f12
	array8	%g7,	%g2,	%g6
	smulcc	%i1,	%o1,	%i6
	orn	%l5,	0x0B26,	%g4
	restore %o0, 0x1F14, %i3
	movgu	%icc,	%i0,	%i4
	movne	%xcc,	%o6,	%l6
	movrlez	%g5,	0x2B9,	%l3
	subcc	%g1,	0x0269,	%o7
	edge32ln	%i5,	%o5,	%i2
	movle	%xcc,	%l4,	%g3
	ld	[%l7 + 0x20],	%f15
	movn	%icc,	%o4,	%l1
	sth	%i7,	[%l7 + 0x6E]
	xorcc	%o3,	0x0E0A,	%o2
	sdivcc	%l2,	0x08A9,	%l0
	edge8	%g2,	%g7,	%g6
	fmovspos	%icc,	%f3,	%f6
	stb	%i1,	[%l7 + 0x64]
	movne	%xcc,	%o1,	%i6
	udivcc	%l5,	0x1D66,	%o0
	movrgz	%g4,	0x2BB,	%i0
	fpadd32s	%f9,	%f10,	%f0
	stb	%i3,	[%l7 + 0x53]
	movcc	%icc,	%i4,	%o6
	sdivx	%l6,	0x0858,	%l3
	xnorcc	%g1,	0x0141,	%o7
	edge32	%g5,	%i5,	%o5
	umulcc	%i2,	0x18E6,	%l4
	stw	%g3,	[%l7 + 0x60]
	udivcc	%l1,	0x07FC,	%o4
	st	%f4,	[%l7 + 0x24]
	movneg	%xcc,	%o3,	%i7
	edge8l	%o2,	%l2,	%g2
	fmovsne	%xcc,	%f14,	%f7
	stw	%l0,	[%l7 + 0x60]
	fsrc2s	%f7,	%f15
	addcc	%g6,	%g7,	%i1
	ld	[%l7 + 0x24],	%f14
	st	%f6,	[%l7 + 0x1C]
	sth	%i6,	[%l7 + 0x16]
	movvc	%xcc,	%o1,	%l5
	fornot1s	%f3,	%f2,	%f0
	smulcc	%o0,	%i0,	%i3
	edge32n	%i4,	%o6,	%g4
	edge16l	%l6,	%l3,	%o7
	xorcc	%g5,	%i5,	%o5
	mulscc	%i2,	%l4,	%g1
	array32	%g3,	%o4,	%l1
	fmovsgu	%icc,	%f12,	%f1
	fnot2	%f2,	%f12
	movn	%xcc,	%o3,	%i7
	sdiv	%o2,	0x1624,	%g2
	movrlez	%l0,	%l2,	%g7
	movrgez	%i1,	%i6,	%o1
	edge32n	%l5,	%o0,	%g6
	fcmped	%fcc1,	%f12,	%f0
	sdivx	%i3,	0x09AB,	%i0
	edge32	%o6,	%g4,	%l6
	srax	%l3,	%o7,	%i4
	andn	%g5,	%i5,	%i2
	std	%f14,	[%l7 + 0x70]
	fabsd	%f2,	%f0
	movvs	%icc,	%o5,	%l4
	movrgez	%g3,	0x27C,	%o4
	edge8ln	%l1,	%o3,	%g1
	orncc	%o2,	0x0368,	%i7
	udivx	%g2,	0x1825,	%l0
	sdivx	%l2,	0x0B90,	%i1
	movvs	%xcc,	%i6,	%o1
	fsrc2s	%f3,	%f5
	edge16l	%l5,	%g7,	%g6
	stw	%o0,	[%l7 + 0x18]
	fnot1s	%f6,	%f9
	popc	%i3,	%i0
	xnor	%g4,	%l6,	%l3
	stw	%o7,	[%l7 + 0x78]
	xnorcc	%o6,	%i4,	%g5
	array32	%i2,	%i5,	%o5
	fxor	%f4,	%f6,	%f4
	andn	%g3,	0x057F,	%o4
	fpadd16	%f12,	%f12,	%f4
	array32	%l4,	%o3,	%g1
	fnand	%f2,	%f14,	%f6
	array16	%l1,	%o2,	%i7
	edge32n	%l0,	%l2,	%i1
	udivcc	%g2,	0x1422,	%o1
	fmovrse	%l5,	%f8,	%f14
	st	%f2,	[%l7 + 0x70]
	udivcc	%i6,	0x158A,	%g6
	sll	%o0,	%i3,	%i0
	sra	%g7,	%l6,	%g4
	movge	%icc,	%l3,	%o7
	st	%f15,	[%l7 + 0x74]
	srlx	%i4,	%o6,	%g5
	mova	%xcc,	%i5,	%i2
	movge	%icc,	%g3,	%o5
	movpos	%icc,	%l4,	%o3
	movne	%icc,	%o4,	%g1
	edge32ln	%l1,	%o2,	%l0
	fmovrdlez	%l2,	%f12,	%f12
	orncc	%i7,	0x0CD4,	%i1
	save %o1, %g2, %l5
	edge32ln	%i6,	%o0,	%g6
	add	%i0,	%g7,	%l6
	save %i3, 0x1DBC, %g4
	sra	%o7,	%l3,	%i4
	fmovdge	%icc,	%f11,	%f8
	srlx	%g5,	0x08,	%i5
	sethi	0x0D84,	%i2
	sdiv	%o6,	0x0822,	%g3
	srlx	%o5,	%o3,	%l4
	ld	[%l7 + 0x20],	%f0
	edge8ln	%g1,	%l1,	%o4
	edge32	%l0,	%o2,	%i7
	faligndata	%f4,	%f12,	%f0
	siam	0x5
	fandnot2	%f4,	%f6,	%f14
	udivx	%l2,	0x177C,	%o1
	addccc	%g2,	0x1262,	%l5
	subccc	%i1,	0x182D,	%o0
	orn	%i6,	0x0723,	%i0
	sllx	%g7,	0x05,	%g6
	stx	%l6,	[%l7 + 0x68]
	edge16n	%i3,	%g4,	%o7
	xorcc	%i4,	%l3,	%i5
	stx	%i2,	[%l7 + 0x28]
	std	%f8,	[%l7 + 0x70]
	movcs	%xcc,	%g5,	%g3
	fmovdle	%xcc,	%f2,	%f13
	array16	%o6,	%o5,	%o3
	fmovsg	%icc,	%f2,	%f11
	edge8l	%g1,	%l1,	%l4
	array16	%o4,	%o2,	%i7
	movle	%xcc,	%l2,	%o1
	st	%f12,	[%l7 + 0x4C]
	subccc	%l0,	%g2,	%i1
	andcc	%o0,	%i6,	%i0
	sdiv	%g7,	0x0FDD,	%g6
	andn	%l6,	0x11E9,	%i3
	edge32	%l5,	%g4,	%i4
	move	%xcc,	%o7,	%i5
	fornot1s	%f14,	%f11,	%f3
	array16	%i2,	%g5,	%g3
	sethi	0x000B,	%l3
	xor	%o6,	%o3,	%g1
	fmovse	%xcc,	%f10,	%f0
	fmovrdgez	%o5,	%f4,	%f2
	fpadd32s	%f9,	%f9,	%f4
	mulx	%l4,	0x1146,	%o4
	movcs	%xcc,	%l1,	%i7
	array32	%l2,	%o2,	%l0
	pdist	%f8,	%f10,	%f2
	srl	%o1,	%g2,	%i1
	sll	%o0,	0x02,	%i6
	stx	%g7,	[%l7 + 0x58]
	ldsw	[%l7 + 0x40],	%i0
	xnor	%g6,	%l6,	%i3
	and	%g4,	0x0B98,	%l5
	save %o7, 0x1C96, %i5
	movl	%icc,	%i2,	%g5
	ldsw	[%l7 + 0x74],	%g3
	st	%f1,	[%l7 + 0x38]
	edge8n	%l3,	%o6,	%o3
	array32	%i4,	%g1,	%o5
	movpos	%xcc,	%l4,	%l1
	edge16ln	%i7,	%l2,	%o2
	fandnot2	%f6,	%f4,	%f4
	smulcc	%o4,	%o1,	%l0
	ldd	[%l7 + 0x40],	%g2
	ldsb	[%l7 + 0x1C],	%i1
	orcc	%o0,	0x1718,	%i6
	edge16n	%g7,	%i0,	%g6
	sll	%l6,	%i3,	%l5
	fmovsvs	%xcc,	%f9,	%f1
	movl	%icc,	%o7,	%g4
	andcc	%i5,	%g5,	%i2
	addccc	%l3,	%o6,	%o3
	edge8	%g3,	%g1,	%o5
	umul	%l4,	%l1,	%i4
	movvs	%icc,	%l2,	%i7
	ldd	[%l7 + 0x18],	%o2
	andn	%o4,	0x0EB7,	%o1
	fxnor	%f6,	%f4,	%f0
	add	%l0,	0x0AF4,	%i1
	movne	%xcc,	%o0,	%g2
	umulcc	%g7,	%i0,	%g6
	orcc	%i6,	0x1250,	%i3
	edge16	%l5,	%l6,	%o7
	popc	0x1D25,	%i5
	edge16	%g5,	%i2,	%g4
	movg	%icc,	%o6,	%l3
	addc	%g3,	0x1B5D,	%g1
	fsrc1	%f12,	%f4
	movne	%icc,	%o5,	%l4
	fsrc2	%f14,	%f2
	fnot1	%f4,	%f0
	fmovrse	%l1,	%f11,	%f11
	edge8l	%i4,	%l2,	%i7
	ld	[%l7 + 0x4C],	%f7
	sub	%o2,	%o3,	%o1
	move	%icc,	%o4,	%l0
	siam	0x7
	stb	%o0,	[%l7 + 0x44]
	sdiv	%g2,	0x071A,	%i1
	movne	%icc,	%i0,	%g7
	ldub	[%l7 + 0x21],	%i6
	fmovdg	%icc,	%f8,	%f2
	sra	%g6,	%l5,	%l6
	udiv	%i3,	0x18FF,	%o7
	edge8l	%i5,	%g5,	%g4
	subccc	%o6,	%l3,	%g3
	andn	%i2,	0x142D,	%g1
	movgu	%xcc,	%l4,	%l1
	fandnot2	%f4,	%f2,	%f6
	movrgez	%i4,	0x01D,	%o5
	sub	%l2,	0x0FD4,	%i7
	movpos	%icc,	%o2,	%o1
	fmovsl	%icc,	%f0,	%f9
	fabss	%f2,	%f12
	movcc	%xcc,	%o4,	%o3
	movne	%xcc,	%o0,	%l0
	sth	%g2,	[%l7 + 0x46]
	sethi	0x1E71,	%i0
	fpmerge	%f0,	%f9,	%f0
	lduw	[%l7 + 0x14],	%g7
	xorcc	%i1,	%g6,	%i6
	sll	%l5,	0x0C,	%l6
	movgu	%icc,	%i3,	%o7
	add	%i5,	%g5,	%o6
	fmul8x16	%f8,	%f6,	%f6
	edge32ln	%g4,	%g3,	%l3
	movrne	%g1,	%l4,	%i2
	fcmpes	%fcc0,	%f4,	%f0
	sethi	0x1793,	%l1
	movcc	%icc,	%i4,	%l2
	sethi	0x1A51,	%o5
	movrne	%o2,	0x17B,	%o1
	movne	%xcc,	%o4,	%i7
	udivcc	%o3,	0x0A71,	%l0
	sethi	0x1DB0,	%o0
	fmovscs	%icc,	%f9,	%f3
	sdivcc	%i0,	0x0AD8,	%g7
	movrgz	%i1,	%g6,	%g2
	stw	%l5,	[%l7 + 0x3C]
	movvc	%icc,	%i6,	%i3
	udivx	%o7,	0x1FB7,	%l6
	fmovrdlez	%i5,	%f6,	%f0
	array32	%g5,	%g4,	%o6
	movgu	%icc,	%g3,	%g1
	sub	%l3,	%i2,	%l1
	sll	%i4,	%l2,	%o5
	movvs	%icc,	%l4,	%o1
	smulcc	%o2,	%o4,	%o3
	srax	%i7,	%o0,	%i0
	addccc	%l0,	%i1,	%g7
	movvc	%xcc,	%g6,	%l5
	edge32l	%i6,	%g2,	%o7
	srl	%l6,	%i3,	%g5
	movrlz	%g4,	0x073,	%o6
	ldd	[%l7 + 0x60],	%f2
	fmovdvc	%icc,	%f8,	%f0
	sll	%g3,	%g1,	%l3
	fpadd32s	%f13,	%f13,	%f11
	xor	%i2,	0x16C9,	%l1
	stw	%i5,	[%l7 + 0x54]
	array32	%l2,	%o5,	%i4
	ldub	[%l7 + 0x0A],	%l4
	fmovdgu	%xcc,	%f3,	%f4
	fmovdneg	%xcc,	%f8,	%f15
	smul	%o1,	%o2,	%o3
	sth	%i7,	[%l7 + 0x46]
	fnands	%f10,	%f15,	%f2
	udivx	%o0,	0x186B,	%o4
	edge8ln	%i0,	%i1,	%g7
	fmovrslz	%l0,	%f0,	%f1
	sub	%l5,	0x02FB,	%g6
	xnor	%g2,	%o7,	%l6
	fcmpes	%fcc1,	%f7,	%f8
	subccc	%i6,	%i3,	%g5
	lduw	[%l7 + 0x40],	%g4
	edge16ln	%g3,	%o6,	%g1
	fmul8x16au	%f1,	%f6,	%f14
	movrgz	%i2,	%l1,	%i5
	sllx	%l2,	%l3,	%i4
	stb	%l4,	[%l7 + 0x7E]
	sethi	0x185F,	%o1
	std	%f0,	[%l7 + 0x68]
	movn	%xcc,	%o5,	%o3
	std	%f14,	[%l7 + 0x40]
	subccc	%o2,	%i7,	%o0
	or	%i0,	%o4,	%g7
	lduw	[%l7 + 0x44],	%l0
	fexpand	%f15,	%f12
	fnegd	%f12,	%f6
	mulx	%i1,	%g6,	%g2
	edge32l	%l5,	%o7,	%i6
	movne	%icc,	%i3,	%g5
	srlx	%l6,	0x19,	%g3
	movl	%xcc,	%g4,	%g1
	fmovdvc	%xcc,	%f14,	%f5
	andncc	%o6,	%i2,	%i5
	edge32l	%l2,	%l1,	%i4
	addcc	%l4,	0x0C37,	%o1
	faligndata	%f6,	%f0,	%f4
	edge32n	%o5,	%o3,	%l3
	fnot1s	%f6,	%f4
	fmovsge	%xcc,	%f12,	%f10
	fnot2	%f2,	%f2
	stw	%o2,	[%l7 + 0x08]
	edge32ln	%i7,	%i0,	%o4
	fxnors	%f2,	%f1,	%f2
	ldub	[%l7 + 0x62],	%o0
	fmovdn	%icc,	%f1,	%f7
	stw	%g7,	[%l7 + 0x78]
	edge8l	%l0,	%g6,	%g2
	smulcc	%l5,	0x1AB4,	%i1
	addcc	%i6,	0x0DD7,	%i3
	movre	%o7,	%g5,	%g3
	fmovdvs	%xcc,	%f10,	%f15
	movgu	%xcc,	%g4,	%l6
	subccc	%g1,	0x1235,	%o6
	movneg	%icc,	%i2,	%i5
	movrgz	%l2,	%i4,	%l4
	edge8ln	%l1,	%o1,	%o3
	udiv	%o5,	0x07B4,	%o2
	edge32	%i7,	%l3,	%o4
	fandnot2s	%f11,	%f15,	%f3
	fnot2s	%f8,	%f11
	fnot1s	%f0,	%f7
	fpsub16	%f8,	%f8,	%f14
	movvs	%icc,	%o0,	%g7
	ldsb	[%l7 + 0x0F],	%i0
	sth	%g6,	[%l7 + 0x68]
	move	%xcc,	%l0,	%g2
	movre	%i1,	%l5,	%i3
	movvs	%icc,	%o7,	%i6
	lduw	[%l7 + 0x38],	%g3
	sra	%g4,	%g5,	%l6
	ld	[%l7 + 0x18],	%f14
	siam	0x0
	movle	%icc,	%g1,	%o6
	ldd	[%l7 + 0x58],	%f4
	movne	%xcc,	%i5,	%l2
	sethi	0x1096,	%i4
	fpsub32	%f4,	%f10,	%f12
	lduw	[%l7 + 0x30],	%i2
	movrgz	%l4,	%l1,	%o3
	addcc	%o5,	%o2,	%i7
	edge8n	%l3,	%o1,	%o4
	sll	%o0,	%i0,	%g6
	subccc	%g7,	%g2,	%l0
	fmovdn	%xcc,	%f8,	%f3
	sllx	%l5,	%i1,	%i3
	move	%xcc,	%o7,	%i6
	fpadd32	%f6,	%f10,	%f10
	and	%g3,	%g4,	%g5
	subcc	%l6,	0x0DD1,	%g1
	udiv	%o6,	0x0A1B,	%i5
	movvs	%xcc,	%i4,	%l2
	fmovdneg	%xcc,	%f12,	%f0
	fcmple16	%f8,	%f0,	%l4
	movn	%xcc,	%l1,	%o3
	sub	%o5,	%i2,	%i7
	edge8ln	%l3,	%o2,	%o4
	orcc	%o1,	0x019E,	%i0
	andn	%o0,	%g7,	%g6
	fcmpd	%fcc1,	%f6,	%f2
	fmovrsgz	%l0,	%f0,	%f14
	edge32	%l5,	%g2,	%i1
	movre	%i3,	0x2B3,	%o7
	fcmple32	%f8,	%f4,	%i6
	fcmped	%fcc1,	%f8,	%f4
	fmovdpos	%xcc,	%f11,	%f3
	srl	%g4,	0x15,	%g3
	fnegs	%f3,	%f12
	movrne	%g5,	0x3F1,	%l6
	fcmpgt32	%f14,	%f6,	%o6
	movgu	%xcc,	%g1,	%i4
	movn	%xcc,	%l2,	%i5
	andncc	%l4,	%o3,	%l1
	udivcc	%i2,	0x065F,	%o5
	array16	%l3,	%i7,	%o2
	smul	%o4,	%o1,	%o0
	std	%f2,	[%l7 + 0x10]
	movre	%i0,	0x092,	%g6
	sub	%g7,	%l5,	%g2
	sdivx	%l0,	0x1ADA,	%i1
	sdivx	%i3,	0x0DC7,	%i6
	fzero	%f0
	movrgez	%o7,	%g3,	%g4
	fpackfix	%f0,	%f6
	edge8	%l6,	%o6,	%g1
	ldsw	[%l7 + 0x3C],	%i4
	popc	%l2,	%i5
	movcs	%icc,	%l4,	%o3
	fnors	%f8,	%f1,	%f5
	fmovsne	%xcc,	%f13,	%f0
	xorcc	%g5,	0x1BF1,	%l1
	mulx	%i2,	0x1A65,	%l3
	edge16l	%i7,	%o2,	%o5
	fmovrdgez	%o4,	%f10,	%f2
	srax	%o1,	%i0,	%o0
	movrgez	%g6,	0x37D,	%g7
	ld	[%l7 + 0x30],	%f0
	xor	%g2,	%l5,	%l0
	ldsh	[%l7 + 0x7C],	%i3
	movrlz	%i1,	0x1DB,	%o7
	movrgez	%i6,	0x351,	%g3
	move	%icc,	%l6,	%o6
	fcmpgt32	%f0,	%f4,	%g1
	restore %g4, 0x12DC, %l2
	movrlez	%i4,	%l4,	%i5
	orn	%o3,	%g5,	%i2
	udivcc	%l3,	0x1DBC,	%i7
	fmovsle	%icc,	%f12,	%f10
	andcc	%o2,	0x1F85,	%o5
	fmovrde	%l1,	%f0,	%f12
	std	%f12,	[%l7 + 0x78]
	fornot2	%f14,	%f14,	%f0
	fmul8sux16	%f6,	%f4,	%f8
	or	%o1,	0x0C06,	%o4
	add	%i0,	0x1654,	%o0
	edge16	%g6,	%g2,	%g7
	smulcc	%l5,	0x061F,	%l0
	fmuld8ulx16	%f7,	%f0,	%f12
	ldub	[%l7 + 0x24],	%i1
	smulcc	%o7,	%i6,	%g3
	xnorcc	%l6,	0x141B,	%o6
	umulcc	%g1,	0x009C,	%g4
	orcc	%i3,	0x1967,	%i4
	smul	%l4,	%i5,	%l2
	andn	%g5,	0x1CA4,	%o3
	movcs	%icc,	%l3,	%i2
	xnor	%o2,	%i7,	%l1
	stx	%o5,	[%l7 + 0x60]
	lduw	[%l7 + 0x7C],	%o1
	edge16n	%i0,	%o4,	%g6
	subccc	%o0,	0x05B6,	%g7
	srax	%l5,	%l0,	%i1
	edge16l	%g2,	%o7,	%g3
	fmovs	%f15,	%f0
	movrlz	%i6,	0x02D,	%l6
	ldsh	[%l7 + 0x3A],	%g1
	fpadd32	%f14,	%f14,	%f0
	movle	%xcc,	%o6,	%g4
	sllx	%i3,	%i4,	%l4
	fcmpgt32	%f0,	%f10,	%i5
	movrlz	%g5,	0x3CF,	%l2
	orn	%o3,	0x1083,	%i2
	andncc	%l3,	%i7,	%l1
	udivcc	%o2,	0x0626,	%o5
	ld	[%l7 + 0x5C],	%f14
	fcmpne32	%f10,	%f6,	%i0
	edge32	%o4,	%g6,	%o1
	or	%o0,	0x0159,	%g7
	array16	%l5,	%i1,	%l0
	subc	%g2,	0x16B7,	%o7
	fandnot1s	%f2,	%f9,	%f11
	or	%i6,	%l6,	%g3
	array16	%o6,	%g1,	%i3
	ldd	[%l7 + 0x50],	%f8
	edge16	%g4,	%l4,	%i4
	movre	%i5,	%l2,	%o3
	movcs	%xcc,	%g5,	%l3
	movvc	%icc,	%i7,	%l1
	smul	%i2,	%o2,	%o5
	fsrc1s	%f13,	%f0
	movgu	%icc,	%i0,	%g6
	orncc	%o4,	0x0F73,	%o0
	fands	%f7,	%f1,	%f15
	save %o1, %g7, %l5
	fmovdl	%xcc,	%f14,	%f1
	popc	%l0,	%g2
	fcmpeq32	%f8,	%f14,	%i1
	save %o7, 0x04D8, %l6
	edge8ln	%g3,	%o6,	%g1
	ldd	[%l7 + 0x78],	%i2
	movcc	%icc,	%i6,	%l4
	stb	%g4,	[%l7 + 0x19]
	sdiv	%i5,	0x1651,	%l2
	fmovdle	%xcc,	%f1,	%f3
	stx	%o3,	[%l7 + 0x30]
	fmovscs	%icc,	%f2,	%f1
	array8	%g5,	%l3,	%i7
	addccc	%i4,	0x08CE,	%i2
	movrne	%l1,	%o5,	%i0
	movge	%icc,	%g6,	%o2
	fnor	%f2,	%f12,	%f12
	edge32l	%o0,	%o4,	%g7
	andn	%o1,	%l0,	%g2
	ldd	[%l7 + 0x48],	%f14
	edge32ln	%i1,	%l5,	%l6
	st	%f8,	[%l7 + 0x24]
	edge32ln	%o7,	%g3,	%g1
	movre	%i3,	%o6,	%l4
	xnorcc	%g4,	0x0683,	%i6
	fpsub16	%f14,	%f8,	%f0
	udivcc	%i5,	0x0224,	%l2
	addc	%o3,	%g5,	%l3
	udiv	%i4,	0x1CD1,	%i7
	movvc	%icc,	%l1,	%i2
	mulscc	%o5,	0x1DA3,	%i0
	stw	%g6,	[%l7 + 0x2C]
	edge32l	%o0,	%o2,	%o4
	umul	%g7,	%l0,	%o1
	fnot2	%f14,	%f12
	ldsw	[%l7 + 0x28],	%g2
	movcs	%xcc,	%l5,	%i1
	movre	%l6,	0x1D2,	%o7
	edge16ln	%g3,	%g1,	%o6
	fmovrsgez	%i3,	%f7,	%f5
	udivx	%g4,	0x08B7,	%i6
	ldsw	[%l7 + 0x48],	%l4
	fmovdleu	%icc,	%f6,	%f11
	ldub	[%l7 + 0x27],	%i5
	orn	%l2,	0x1465,	%g5
	xor	%l3,	0x0CF8,	%o3
	movleu	%xcc,	%i4,	%i7
	edge8n	%i2,	%l1,	%o5
	sll	%i0,	0x18,	%o0
	edge32l	%g6,	%o2,	%o4
	fmovrsne	%g7,	%f4,	%f6
	ldsb	[%l7 + 0x5C],	%o1
	ld	[%l7 + 0x68],	%f5
	move	%xcc,	%g2,	%l0
	andn	%l5,	0x17E8,	%i1
	fnegs	%f11,	%f6
	fpadd16s	%f1,	%f14,	%f4
	fmovdge	%xcc,	%f13,	%f4
	edge32ln	%o7,	%l6,	%g3
	smul	%g1,	%o6,	%g4
	fand	%f10,	%f2,	%f2
	andn	%i6,	0x08B7,	%l4
	ldd	[%l7 + 0x20],	%f8
	stw	%i3,	[%l7 + 0x3C]
	subcc	%l2,	0x1635,	%i5
	edge8	%l3,	%g5,	%o3
	xnor	%i4,	%i7,	%l1
	lduw	[%l7 + 0x74],	%i2
	fmovsleu	%xcc,	%f15,	%f15
	or	%i0,	0x01FD,	%o5
	orn	%g6,	0x1BDB,	%o2
	movgu	%xcc,	%o4,	%o0
	fcmpne16	%f0,	%f14,	%g7
	xorcc	%o1,	0x1399,	%l0
	sth	%l5,	[%l7 + 0x3A]
	sdiv	%g2,	0x0657,	%o7
	fmul8x16	%f0,	%f12,	%f14
	smul	%i1,	%g3,	%l6
	sdivcc	%o6,	0x1AA1,	%g1
	edge32	%g4,	%i6,	%i3
	sdivcc	%l4,	0x011B,	%i5
	array32	%l3,	%l2,	%o3
	array16	%i4,	%g5,	%l1
	ldx	[%l7 + 0x50],	%i7
	edge32ln	%i2,	%o5,	%g6
	sdivx	%i0,	0x0A40,	%o4
	movl	%xcc,	%o0,	%o2
	fpadd16	%f2,	%f8,	%f4
	or	%o1,	%g7,	%l5
	fnand	%f8,	%f4,	%f2
	fnot1	%f6,	%f4
	sub	%g2,	%o7,	%i1
	move	%xcc,	%l0,	%l6
	faligndata	%f8,	%f6,	%f2
	sra	%g3,	%g1,	%o6
	xor	%g4,	0x18EA,	%i3
	fmovsle	%xcc,	%f9,	%f14
	udiv	%l4,	0x1EB0,	%i5
	srl	%l3,	0x08,	%i6
	edge8ln	%o3,	%l2,	%i4
	fmovd	%f12,	%f6
	fabsd	%f6,	%f10
	fmovdne	%xcc,	%f5,	%f10
	umul	%l1,	0x0C61,	%i7
	movg	%icc,	%g5,	%o5
	umulcc	%i2,	0x1D33,	%g6
	udivcc	%o4,	0x01BE,	%o0
	udivcc	%i0,	0x1DAF,	%o2
	lduw	[%l7 + 0x14],	%g7
	fzero	%f0
	movrgez	%o1,	%l5,	%o7
	movpos	%xcc,	%i1,	%l0
	movvs	%icc,	%l6,	%g2
	movne	%icc,	%g3,	%g1
	array8	%o6,	%i3,	%g4
	smul	%i5,	%l3,	%l4
	fmovspos	%xcc,	%f8,	%f9
	movgu	%xcc,	%i6,	%l2
	xnor	%o3,	%i4,	%i7
	umul	%l1,	%g5,	%o5
	andncc	%i2,	%g6,	%o0
	sra	%o4,	0x1A,	%o2
	fnands	%f14,	%f6,	%f2
	move	%icc,	%i0,	%g7
	movrne	%o1,	%o7,	%l5
	xor	%l0,	0x1E47,	%i1
	addccc	%g2,	%l6,	%g3
	mova	%xcc,	%g1,	%o6
	array8	%g4,	%i3,	%i5
	edge32n	%l4,	%l3,	%i6
	fmovse	%icc,	%f7,	%f0
	stw	%o3,	[%l7 + 0x54]
	alignaddrl	%i4,	%i7,	%l1
	fandnot1s	%f11,	%f12,	%f12
	subcc	%l2,	%o5,	%g5
	ldsw	[%l7 + 0x3C],	%i2
	edge32n	%o0,	%o4,	%o2
	fnot1	%f8,	%f0
	xnorcc	%i0,	0x1E21,	%g6
	orn	%g7,	%o1,	%l5
	edge8n	%o7,	%l0,	%g2
	subccc	%i1,	%l6,	%g3
	udiv	%o6,	0x0EEE,	%g4
	stx	%i3,	[%l7 + 0x68]
	movvc	%icc,	%i5,	%l4
	addc	%l3,	0x0D46,	%i6
	restore %g1, %i4, %i7
	fcmpeq16	%f8,	%f6,	%l1
	xorcc	%l2,	%o3,	%g5
	sdiv	%o5,	0x1A19,	%o0
	stx	%o4,	[%l7 + 0x38]
	umulcc	%o2,	%i2,	%g6
	subc	%i0,	%o1,	%g7
	xorcc	%l5,	%o7,	%g2
	subccc	%i1,	%l0,	%g3
	movneg	%icc,	%l6,	%g4
	subcc	%i3,	%i5,	%l4
	alignaddrl	%l3,	%o6,	%g1
	fmovscs	%xcc,	%f3,	%f0
	fmovrdlez	%i6,	%f12,	%f6
	edge16n	%i4,	%l1,	%i7
	fandnot1	%f0,	%f2,	%f6
	movle	%icc,	%o3,	%g5
	std	%f8,	[%l7 + 0x78]
	udivx	%l2,	0x146E,	%o5
	ldub	[%l7 + 0x12],	%o4
	sdiv	%o0,	0x09E6,	%i2
	fnand	%f14,	%f6,	%f8
	ldx	[%l7 + 0x60],	%o2
	ldx	[%l7 + 0x68],	%i0
	fpsub16	%f4,	%f4,	%f8
	xorcc	%g6,	%g7,	%o1
	fmovsn	%xcc,	%f6,	%f5
	edge8n	%l5,	%o7,	%g2
	or	%l0,	0x1C3C,	%g3
	movgu	%icc,	%l6,	%g4
	fmovsvc	%icc,	%f10,	%f4
	movpos	%icc,	%i3,	%i5
	lduw	[%l7 + 0x08],	%l4
	srax	%l3,	%o6,	%g1
	edge16n	%i6,	%i4,	%l1
	movvs	%icc,	%i1,	%i7
	add	%o3,	%g5,	%l2
	andcc	%o5,	0x1977,	%o4
	fands	%f8,	%f15,	%f10
	fcmpgt16	%f14,	%f0,	%i2
	fxor	%f4,	%f4,	%f2
	movg	%xcc,	%o2,	%i0
	sethi	0x0E9D,	%o0
	movgu	%xcc,	%g7,	%o1
	andcc	%g6,	%l5,	%g2
	array16	%l0,	%o7,	%g3
	sdiv	%g4,	0x1AE8,	%i3
	fzeros	%f14
	sdiv	%i5,	0x126A,	%l6
	andn	%l3,	%l4,	%g1
	movcs	%xcc,	%i6,	%o6
	fmovrdgez	%l1,	%f0,	%f2
	st	%f7,	[%l7 + 0x14]
	fnegd	%f6,	%f0
	fmul8ulx16	%f4,	%f12,	%f10
	fmovde	%xcc,	%f5,	%f11
	fmovdleu	%xcc,	%f7,	%f12
	movrgz	%i4,	%i1,	%o3
	smul	%i7,	0x1C0D,	%g5
	ldd	[%l7 + 0x38],	%o4
	edge32	%o4,	%l2,	%o2
	movvs	%xcc,	%i0,	%i2
	movneg	%xcc,	%o0,	%o1
	movre	%g7,	0x020,	%g6
	subccc	%l5,	%g2,	%l0
	mulx	%o7,	%g4,	%i3
	movle	%icc,	%g3,	%i5
	fmovdneg	%icc,	%f6,	%f1
	edge8	%l3,	%l6,	%l4
	st	%f5,	[%l7 + 0x58]
	fmovsle	%xcc,	%f11,	%f3
	ldd	[%l7 + 0x08],	%f12
	edge8	%i6,	%g1,	%l1
	edge8	%o6,	%i1,	%i4
	fmovsleu	%icc,	%f2,	%f10
	sethi	0x0123,	%i7
	fzero	%f12
	mulx	%o3,	%o5,	%g5
	ld	[%l7 + 0x10],	%f12
	andncc	%l2,	%o4,	%i0
	mova	%xcc,	%i2,	%o2
	edge16ln	%o1,	%g7,	%o0
	subcc	%g6,	0x07BF,	%g2
	srax	%l5,	%o7,	%g4
	ldsw	[%l7 + 0x64],	%l0
	movn	%xcc,	%i3,	%i5
	fpadd32	%f4,	%f6,	%f4
	sll	%l3,	%g3,	%l6
	edge32	%l4,	%g1,	%i6
	fnors	%f3,	%f3,	%f8
	fmovdn	%xcc,	%f6,	%f11
	fone	%f14
	udivx	%l1,	0x0D0C,	%i1
	udiv	%i4,	0x10D7,	%i7
	andcc	%o3,	0x125C,	%o5
	movl	%xcc,	%o6,	%l2
	xnorcc	%g5,	%o4,	%i2
	edge8ln	%o2,	%i0,	%o1
	movrlz	%g7,	0x187,	%g6
	andcc	%g2,	0x01F3,	%o0
	lduh	[%l7 + 0x14],	%o7
	subc	%g4,	%l0,	%l5
	movvc	%xcc,	%i5,	%i3
	movrlez	%l3,	%l6,	%g3
	orncc	%l4,	%g1,	%i6
	fmuld8sux16	%f3,	%f10,	%f14
	orn	%l1,	%i1,	%i7
	movleu	%icc,	%i4,	%o5
	fmovdvc	%xcc,	%f13,	%f4
	xor	%o6,	%o3,	%l2
	movrne	%g5,	%i2,	%o2
	add	%i0,	%o1,	%g7
	srax	%o4,	%g6,	%o0
	edge8	%o7,	%g4,	%g2
	fnot2	%f4,	%f0
	movvc	%xcc,	%l0,	%i5
	fpadd32s	%f12,	%f14,	%f15
	fmovdle	%icc,	%f12,	%f8
	fcmps	%fcc0,	%f9,	%f0
	edge8	%l5,	%i3,	%l3
	movrne	%l6,	0x1BC,	%g3
	fmovrdlez	%g1,	%f14,	%f2
	fmul8sux16	%f8,	%f8,	%f14
	alignaddrl	%l4,	%l1,	%i1
	fornot1s	%f0,	%f0,	%f3
	addccc	%i6,	%i7,	%i4
	ldsb	[%l7 + 0x53],	%o6
	movre	%o5,	%o3,	%g5
	umul	%l2,	0x0790,	%o2
	movcc	%xcc,	%i0,	%i2
	fmovrslez	%o1,	%f9,	%f15
	sdivcc	%g7,	0x1F3F,	%g6
	edge8	%o0,	%o7,	%g4
	edge8ln	%g2,	%o4,	%i5
	udivx	%l5,	0x0448,	%l0
	xor	%i3,	0x13B9,	%l6
	smul	%l3,	%g1,	%g3
	ldub	[%l7 + 0x74],	%l1
	srl	%i1,	0x11,	%l4
	lduh	[%l7 + 0x16],	%i6
	xnor	%i4,	0x0775,	%o6
	edge16l	%i7,	%o5,	%g5
	movrlz	%o3,	0x25A,	%l2
	movcs	%icc,	%o2,	%i0
	udiv	%o1,	0x1950,	%g7
	edge16ln	%i2,	%g6,	%o7
	addcc	%o0,	%g4,	%o4
	sth	%i5,	[%l7 + 0x20]
	fnegs	%f5,	%f10
	fsrc1	%f12,	%f0
	movrgez	%g2,	%l0,	%i3
	movleu	%icc,	%l6,	%l3
	fmovdcs	%icc,	%f0,	%f7
	edge32	%l5,	%g1,	%l1
	fnand	%f10,	%f10,	%f10
	andncc	%i1,	%g3,	%l4
	fnand	%f2,	%f8,	%f10
	fmovrse	%i6,	%f11,	%f8
	movle	%xcc,	%o6,	%i4
	fmovrdgz	%i7,	%f6,	%f4
	fmovrse	%g5,	%f0,	%f15
	fmuld8sux16	%f13,	%f5,	%f12
	orn	%o3,	0x1DA0,	%l2
	popc	0x16B8,	%o5
	move	%xcc,	%i0,	%o1
	mulscc	%o2,	0x0B70,	%g7
	lduw	[%l7 + 0x34],	%i2
	array32	%g6,	%o7,	%o0
	fzero	%f10
	sub	%o4,	%g4,	%g2
	fornot1	%f12,	%f6,	%f8
	movrgz	%l0,	%i5,	%i3
	array16	%l6,	%l3,	%l5
	subc	%g1,	0x13AB,	%i1
	movg	%xcc,	%g3,	%l1
	fandnot1s	%f11,	%f0,	%f9
	srl	%l4,	%o6,	%i6
	bshuffle	%f14,	%f10,	%f6
	orncc	%i4,	%i7,	%g5
	movle	%icc,	%l2,	%o5
	fmovdne	%xcc,	%f6,	%f10
	fnands	%f0,	%f11,	%f0
	movpos	%icc,	%i0,	%o3
	sub	%o2,	0x18E1,	%o1
	fcmpne32	%f14,	%f2,	%g7
	stw	%g6,	[%l7 + 0x30]
	edge32l	%o7,	%i2,	%o4
	alignaddr	%g4,	%g2,	%l0
	sub	%o0,	%i5,	%l6
	srl	%i3,	0x06,	%l5
	subcc	%l3,	0x11E3,	%g1
	sth	%g3,	[%l7 + 0x62]
	fmovsgu	%icc,	%f9,	%f15
	fpadd32	%f14,	%f14,	%f8
	ldsb	[%l7 + 0x40],	%l1
	andncc	%l4,	%i1,	%o6
	movrlez	%i4,	0x080,	%i7
	udivcc	%i6,	0x0992,	%g5
	stb	%o5,	[%l7 + 0x09]
	andn	%i0,	0x0684,	%l2
	ldd	[%l7 + 0x60],	%f12
	addccc	%o2,	0x137D,	%o3
	movrgez	%g7,	0x08D,	%o1
	sdiv	%g6,	0x055E,	%i2
	st	%f7,	[%l7 + 0x5C]
	smul	%o7,	0x113B,	%o4
	fmovrsgz	%g2,	%f1,	%f0
	ldub	[%l7 + 0x32],	%g4
	edge8l	%o0,	%i5,	%l6
	lduh	[%l7 + 0x30],	%i3
	mulscc	%l5,	0x035F,	%l0
	umul	%l3,	%g1,	%g3
	xor	%l1,	0x14A7,	%i1
	restore %l4, %i4, %i7
	fcmped	%fcc0,	%f6,	%f10
	ldd	[%l7 + 0x78],	%f0
	st	%f8,	[%l7 + 0x08]
	save %o6, 0x1C28, %i6
	movrgz	%g5,	0x0E4,	%i0
	movleu	%icc,	%l2,	%o5
	fmovdleu	%icc,	%f4,	%f0
	movrgez	%o2,	0x18A,	%o3
	movrlz	%g7,	0x161,	%g6
	edge32l	%i2,	%o1,	%o7
	umul	%o4,	0x02DD,	%g4
	fmovrslz	%g2,	%f5,	%f10
	andncc	%i5,	%l6,	%o0
	sth	%l5,	[%l7 + 0x4C]
	fpsub32s	%f10,	%f1,	%f1
	fzero	%f0
	edge32ln	%i3,	%l3,	%g1
	edge16n	%g3,	%l0,	%i1
	stx	%l4,	[%l7 + 0x38]
	mulx	%i4,	%i7,	%o6
	sub	%i6,	0x0080,	%l1
	movl	%xcc,	%g5,	%i0
	edge16	%o5,	%l2,	%o3
	pdist	%f8,	%f6,	%f8
	udivx	%g7,	0x09F3,	%o2
	orn	%g6,	%i2,	%o1
	umul	%o4,	%g4,	%g2
	edge16l	%i5,	%l6,	%o0
	movrgez	%o7,	%l5,	%i3
	sdivcc	%g1,	0x042E,	%l3
	ldd	[%l7 + 0x08],	%l0
	fmul8x16	%f7,	%f10,	%f10
	mulscc	%g3,	0x04E0,	%i1
	ld	[%l7 + 0x18],	%f5
	fmovs	%f14,	%f3
	umulcc	%i4,	0x0990,	%l4
	fmul8ulx16	%f10,	%f4,	%f4
	udiv	%o6,	0x0C39,	%i6
	fmovsvc	%icc,	%f4,	%f10
	sethi	0x0C49,	%l1
	movleu	%xcc,	%i7,	%i0
	ldd	[%l7 + 0x28],	%o4
	srax	%g5,	0x13,	%o3
	smulcc	%l2,	%g7,	%o2
	srl	%g6,	%o1,	%i2
	fxnor	%f10,	%f10,	%f6
	fsrc1s	%f4,	%f0
	edge8l	%o4,	%g4,	%g2
	array8	%i5,	%o0,	%l6
	sdiv	%o7,	0x0925,	%i3
	sra	%g1,	0x0C,	%l5
	smul	%l3,	%l0,	%g3
	fsrc2s	%f15,	%f15
	popc	0x1B91,	%i1
	movvc	%icc,	%i4,	%o6
	ldd	[%l7 + 0x70],	%l4
	fmovsg	%xcc,	%f10,	%f6
	st	%f12,	[%l7 + 0x24]
	move	%icc,	%i6,	%i7
	fmovrde	%i0,	%f0,	%f6
	subc	%o5,	%g5,	%o3
	mulx	%l1,	0x1CC9,	%g7
	fmovdle	%icc,	%f2,	%f11
	srax	%o2,	%l2,	%o1
	movrne	%g6,	0x09E,	%o4
	fandnot2s	%f5,	%f8,	%f7
	xnor	%g4,	%i2,	%i5
	movle	%icc,	%o0,	%l6
	edge16	%o7,	%i3,	%g1
	mulx	%g2,	0x0464,	%l5
	save %l3, %l0, %g3
	addc	%i4,	0x02FE,	%i1
	movleu	%icc,	%l4,	%o6
	movrgez	%i6,	%i0,	%i7
	movvs	%xcc,	%o5,	%o3
	ldsw	[%l7 + 0x08],	%g5
	alignaddrl	%g7,	%o2,	%l1
	stw	%l2,	[%l7 + 0x54]
	edge32	%o1,	%g6,	%o4
	fmovrdgz	%g4,	%f2,	%f2
	fnot1	%f4,	%f4
	movrgez	%i5,	%o0,	%l6
	movcs	%xcc,	%i2,	%i3
	movne	%icc,	%g1,	%o7
	smulcc	%l5,	%g2,	%l0
	pdist	%f4,	%f6,	%f0
	udivx	%g3,	0x0999,	%i4
	ldub	[%l7 + 0x37],	%i1
	lduw	[%l7 + 0x30],	%l4
	movcs	%icc,	%l3,	%i6
	fcmpgt16	%f12,	%f14,	%i0
	st	%f12,	[%l7 + 0x70]
	xnor	%i7,	%o5,	%o6
	edge16n	%g5,	%g7,	%o3
	popc	%o2,	%l1
	fmovsn	%xcc,	%f3,	%f13
	fcmpgt32	%f2,	%f4,	%o1
	fmovdle	%icc,	%f14,	%f0
	movrgez	%l2,	0x16A,	%g6
	subc	%o4,	0x0158,	%g4
	sethi	0x1918,	%i5
	edge8l	%l6,	%i2,	%i3
	umulcc	%o0,	0x09D5,	%o7
	edge8ln	%l5,	%g2,	%g1
	srax	%l0,	%g3,	%i4
	fmovsg	%xcc,	%f7,	%f10
	smul	%i1,	%l4,	%l3
	fcmpne16	%f6,	%f6,	%i6
	andncc	%i7,	%o5,	%o6
	umul	%g5,	%i0,	%g7
	stb	%o2,	[%l7 + 0x17]
	fmovdge	%xcc,	%f2,	%f10
	fpsub16	%f4,	%f4,	%f12
	movvc	%xcc,	%l1,	%o1
	fandnot1	%f8,	%f12,	%f12
	fmul8x16au	%f7,	%f0,	%f0
	fmovscs	%xcc,	%f3,	%f2
	restore %o3, 0x0913, %l2
	orncc	%o4,	0x0204,	%g4
	andcc	%i5,	0x1E11,	%l6
	movleu	%icc,	%g6,	%i2
	fornot1	%f2,	%f8,	%f10
	smul	%o0,	%i3,	%l5
	ld	[%l7 + 0x0C],	%f15
	xnor	%g2,	0x11CC,	%g1
	fmovdleu	%xcc,	%f3,	%f7
	sra	%o7,	%l0,	%g3
	srax	%i4,	0x05,	%l4
	sub	%l3,	%i1,	%i6
	fmovrdlz	%o5,	%f14,	%f2
	ldsb	[%l7 + 0x6E],	%o6
	addc	%g5,	0x0C13,	%i0
	orn	%g7,	%o2,	%i7
	fxor	%f6,	%f0,	%f8
	movle	%icc,	%o1,	%l1
	movle	%icc,	%o3,	%o4
	xnor	%g4,	0x12D9,	%i5
	movre	%l2,	0x3BB,	%g6
	fmovrsne	%l6,	%f9,	%f2
	movg	%icc,	%i2,	%i3
	srlx	%o0,	%g2,	%l5
	srax	%g1,	0x06,	%o7
	edge16	%g3,	%l0,	%i4
	fmovsge	%icc,	%f7,	%f9
	xorcc	%l3,	%i1,	%l4
	edge16ln	%o5,	%i6,	%g5
	edge8l	%o6,	%g7,	%i0
	fpadd16	%f6,	%f8,	%f2
	mulx	%o2,	0x09DD,	%o1
	srl	%l1,	0x1E,	%i7
	ldd	[%l7 + 0x48],	%f2
	sdivx	%o4,	0x0827,	%o3
	umulcc	%g4,	0x1E34,	%i5
	fmovsl	%xcc,	%f8,	%f7
	movle	%icc,	%g6,	%l2
	fornot2	%f6,	%f0,	%f6
	fmul8sux16	%f0,	%f12,	%f8
	fsrc2s	%f0,	%f3
	ld	[%l7 + 0x2C],	%f12
	mulx	%i2,	%l6,	%o0
	sllx	%i3,	%g2,	%g1
	movre	%o7,	0x125,	%g3
	fmul8ulx16	%f12,	%f14,	%f10
	sdivcc	%l0,	0x02F7,	%i4
	udiv	%l3,	0x136B,	%i1
	array8	%l4,	%o5,	%l5
	sdivcc	%g5,	0x1296,	%o6
	mulx	%i6,	0x11B3,	%g7
	udiv	%o2,	0x1A13,	%o1
	edge16ln	%l1,	%i0,	%o4
	restore %i7, 0x09DA, %g4
	fmuld8sux16	%f3,	%f9,	%f4
	movg	%icc,	%i5,	%o3
	sll	%g6,	%i2,	%l6
	sethi	0x05BF,	%l2
	lduh	[%l7 + 0x2C],	%i3
	add	%o0,	0x1AE0,	%g2
	ldsh	[%l7 + 0x4A],	%o7
	edge32n	%g1,	%l0,	%g3
	mova	%xcc,	%i4,	%l3
	movneg	%xcc,	%l4,	%i1
	ld	[%l7 + 0x78],	%f1
	ldx	[%l7 + 0x08],	%l5
	sdivcc	%o5,	0x005E,	%g5
	fpsub32s	%f9,	%f5,	%f7
	fpackfix	%f8,	%f1
	ldd	[%l7 + 0x60],	%o6
	movne	%icc,	%i6,	%g7
	edge32	%o2,	%o1,	%l1
	subc	%o4,	%i0,	%g4
	edge8ln	%i5,	%i7,	%o3
	ldsh	[%l7 + 0x36],	%i2
	mova	%xcc,	%g6,	%l6
	fmovrdgz	%l2,	%f8,	%f6
	umul	%o0,	%g2,	%o7
	andn	%i3,	%g1,	%l0
	udivcc	%g3,	0x18ED,	%i4
	xnorcc	%l3,	0x08CB,	%i1
	lduh	[%l7 + 0x48],	%l4
	movne	%xcc,	%l5,	%g5
	fcmpes	%fcc0,	%f8,	%f7
	edge8l	%o6,	%i6,	%g7
	array8	%o2,	%o5,	%l1
	fcmpgt16	%f10,	%f14,	%o1
	udivcc	%o4,	0x1F43,	%g4
	movrlz	%i5,	0x2B6,	%i0
	umulcc	%o3,	%i2,	%i7
	ldsb	[%l7 + 0x42],	%g6
	subc	%l2,	0x1E67,	%o0
	sllx	%l6,	%o7,	%g2
	srlx	%i3,	%l0,	%g3
	movrlz	%g1,	%l3,	%i1
	array8	%i4,	%l5,	%l4
	movl	%xcc,	%o6,	%g5
	movg	%icc,	%i6,	%o2
	ldd	[%l7 + 0x70],	%g6
	smulcc	%o5,	0x1AD7,	%l1
	addc	%o4,	%g4,	%i5
	movrne	%i0,	%o1,	%o3
	array16	%i2,	%g6,	%i7
	subcc	%l2,	0x03C8,	%o0
	movg	%icc,	%o7,	%g2
	umulcc	%i3,	%l6,	%g3
	movvs	%icc,	%g1,	%l0
	udivx	%l3,	0x0254,	%i4
	move	%icc,	%i1,	%l5
	udivcc	%l4,	0x1FCA,	%o6
	movvs	%icc,	%g5,	%i6
	mulscc	%o2,	%o5,	%g7
	edge32l	%l1,	%g4,	%i5
	movrgz	%o4,	%o1,	%o3
	srlx	%i2,	%i0,	%i7
	fmovscs	%icc,	%f14,	%f3
	edge32ln	%l2,	%o0,	%o7
	fmovrdlez	%g6,	%f2,	%f12
	fand	%f6,	%f12,	%f10
	fmul8sux16	%f14,	%f2,	%f6
	st	%f0,	[%l7 + 0x30]
	fmuld8ulx16	%f5,	%f9,	%f14
	fmovdle	%icc,	%f9,	%f10
	xnorcc	%g2,	%l6,	%g3
	restore %i3, 0x15F0, %l0
	xnorcc	%g1,	%i4,	%l3
	movne	%icc,	%l5,	%l4
	movrlz	%o6,	%g5,	%i6
	ldsw	[%l7 + 0x50],	%o2
	fcmpgt16	%f2,	%f14,	%o5
	array16	%g7,	%i1,	%l1
	fornot1	%f12,	%f0,	%f6
	or	%g4,	%i5,	%o4
	edge16n	%o1,	%o3,	%i2
	movrlz	%i0,	0x1F0,	%l2
	mova	%xcc,	%o0,	%i7
	fornot1	%f10,	%f8,	%f0
	fcmpgt16	%f8,	%f8,	%o7
	array16	%g6,	%g2,	%g3
	and	%l6,	0x1BC4,	%l0
	sub	%g1,	%i4,	%i3
	fmovrde	%l5,	%f6,	%f14
	alignaddr	%l3,	%l4,	%o6
	edge32	%g5,	%i6,	%o2
	movvs	%xcc,	%g7,	%i1
	array32	%o5,	%g4,	%i5
	smulcc	%o4,	0x0300,	%o1
	movg	%icc,	%l1,	%o3
	addc	%i0,	0x01E7,	%i2
	andn	%l2,	%i7,	%o7
	fsrc1s	%f0,	%f2
	movrne	%g6,	0x141,	%g2
	fcmple16	%f12,	%f6,	%o0
	umulcc	%l6,	%g3,	%g1
	xor	%i4,	0x1DC8,	%l0
	subc	%i3,	0x0DBD,	%l3
	fmul8x16	%f3,	%f12,	%f14
	movrlz	%l5,	0x26C,	%o6
	bshuffle	%f14,	%f8,	%f2
	sllx	%l4,	%g5,	%i6
	mulscc	%o2,	0x1DA7,	%i1
	sdivx	%g7,	0x0BD7,	%g4
	udivx	%o5,	0x0A65,	%i5
	movrgz	%o4,	0x3B7,	%l1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type f   	: 1077
!	Type i   	: 3239
!	Type l   	: 684
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x486C38E3
.word 0xC74CF8C9
.word 0x1A642520
.word 0x52BF75C5
.word 0xD3808576
.word 0x428FA0B7
.word 0x2DE46CFD
.word 0x529C9A77
.word 0x3F1E1ECA
.word 0x5BEA40C4
.word 0x934B6F70
.word 0xA851AD43
.word 0x6BDDC68F
.word 0x45FC5990
.word 0x6207FB57
.word 0xBAAFF776
.word 0x6EEB24F4
.word 0xFFAD553A
.word 0x968D64B4
.word 0xBF4C94C6
.word 0x59D2874B
.word 0x3B147AEB
.word 0xFC9125E8
.word 0x4334C063
.word 0xFFA0DB10
.word 0x0D549A13
.word 0xE7A16092
.word 0xE6A54834
.word 0xBCCCF634
.word 0x6C091899
.word 0x97187610
.word 0xA4C2E436
.word 0x2CDEF1AC
.word 0xBBDE2B51
.word 0x1B083301
.word 0xF0093520
.word 0x1FD11BA4
.word 0x7F067F6F
.word 0x61D5BB6E
.word 0xEB422DFC
.word 0xF1FD72BB
.word 0x7229FD12
.word 0x6259272D
.word 0xAD7C4E87
.word 0x49A26BA2
.word 0xF386FC5A
.word 0x962E7F0D
.word 0xF15D37B3
.word 0xCE10480A
.word 0x6A863680
.word 0xC3EB5C40
.word 0xBE7B5D68
.word 0x8AFEE78B
.word 0xFD6CCA37
.word 0x63A4EDE3
.word 0x81A0B799
.word 0xB8C5BC55
.word 0x511E32D4
.word 0x41B89AE4
.word 0xEF6BE0D4
.word 0xA41583A5
.word 0x5A246687
.word 0xD5C02B5E
.word 0xC838C5F5
.end
