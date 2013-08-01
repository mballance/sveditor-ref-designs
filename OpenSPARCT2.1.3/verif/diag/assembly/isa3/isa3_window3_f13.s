/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f13.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f13.s,v 1.1 2007/05/11 17:22:36 drp Exp $"
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
	nop
	setx	0x10D4918400460311,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x0,	%g1
	set	0xE,	%g2
	set	0x7,	%g3
	set	0x1,	%g4
	set	0x4,	%g5
	set	0x7,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0x0,	%i1
	set	-0x6,	%i2
	set	-0x3,	%i3
	set	-0x9,	%i4
	set	-0x6,	%i5
	set	-0x2,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x3EB71AAF,	%l0
	set	0x57923FB2,	%l1
	set	0x11390BC2,	%l2
	set	0x6FD72751,	%l3
	set	0x58FE5D29,	%l4
	set	0x04232D66,	%l5
	set	0x205B4599,	%l6
	!# Output registers
	set	-0x1A16,	%o0
	set	-0x1FAD,	%o1
	set	-0x1C0D,	%o2
	set	-0x04DE,	%o3
	set	0x1F59,	%o4
	set	-0x0372,	%o5
	set	0x0421,	%o6
	set	-0x1F76,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x790A33B4625019B5)
	INIT_TH_FP_REG(%l7,%f2,0x2C88C7539B2A6701)
	INIT_TH_FP_REG(%l7,%f4,0xD9BF884F2FA2611A)
	INIT_TH_FP_REG(%l7,%f6,0x75D5EB06AAEA8148)
	INIT_TH_FP_REG(%l7,%f8,0x6275D3D4DF2591C7)
	INIT_TH_FP_REG(%l7,%f10,0xB22312C79825266F)
	INIT_TH_FP_REG(%l7,%f12,0x9415A800E420A885)
	INIT_TH_FP_REG(%l7,%f14,0xED2F05DD89CB04E4)
	INIT_TH_FP_REG(%l7,%f16,0xAB28DE575DF06784)
	INIT_TH_FP_REG(%l7,%f18,0x2F19BDD250E99844)
	INIT_TH_FP_REG(%l7,%f20,0xC8DE67C0892709A0)
	INIT_TH_FP_REG(%l7,%f22,0x377A8E00119344DB)
	INIT_TH_FP_REG(%l7,%f24,0xC23DD092D2C92F68)
	INIT_TH_FP_REG(%l7,%f26,0xC080A73615BF7E51)
	INIT_TH_FP_REG(%l7,%f28,0x361465B4AD6D297B)
	INIT_TH_FP_REG(%l7,%f30,0x601BC357ED94BF98)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE58, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	ldsh	[%l7 + 0x70],	%i4
	stb	%o5,	[%l7 + 0x1A]
	srl	%g3,	0x14,	%l6
	sdivcc	%i7,	0x0BA3,	%o7
	or	%l0,	%o1,	%l1
	movvs	%xcc,	%l2,	%l4
	udiv	%i0,	0x12F8,	%g1
	edge32ln	%i5,	%i3,	%i6
	fnors	%f27,	%f20,	%f21
	alignaddr	%o0,	%i2,	%g6
	sdivcc	%g4,	0x14F8,	%o2
	fmovsneg	%xcc,	%f18,	%f14
	fmovspos	%icc,	%f18,	%f0
	movneg	%xcc,	%g5,	%o3
	edge16	%o4,	%i1,	%o6
	xnorcc	%l3,	0x06E7,	%g2
	orn	%l5,	%g7,	%o5
	ldd	[%l7 + 0x30],	%f24
	save %i4, %g3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x29],	%o7
	movvs	%xcc,	%l0,	%i7
	edge8n	%o1,	%l2,	%l1
	lduh	[%l7 + 0x48],	%i0
	andncc	%g1,	%l4,	%i3
	edge32	%i6,	%o0,	%i2
	stw	%g6,	[%l7 + 0x38]
	fmovsvs	%icc,	%f22,	%f31
	move	%xcc,	%i5,	%o2
	fnand	%f12,	%f14,	%f22
	fmovdle	%icc,	%f0,	%f14
	lduh	[%l7 + 0x5C],	%g4
	fmul8sux16	%f14,	%f30,	%f2
	mova	%xcc,	%g5,	%o3
	fcmped	%fcc3,	%f20,	%f24
	edge8	%i1,	%o4,	%l3
	mulscc	%g2,	%o6,	%l5
	sir	0x0829
	edge32l	%g7,	%i4,	%g3
	addcc	%l6,	0x0120,	%o5
	andn	%o7,	%l0,	%o1
	mulscc	%l2,	%i7,	%l1
	fnand	%f2,	%f4,	%f8
	andncc	%g1,	%i0,	%i3
	fcmpne32	%f10,	%f26,	%i6
	sth	%o0,	[%l7 + 0x34]
	ldx	[%l7 + 0x58],	%i2
	edge16l	%g6,	%l4,	%i5
	srlx	%g4,	%g5,	%o3
	sub	%i1,	%o2,	%l3
	ldd	[%l7 + 0x68],	%o4
	edge16	%g2,	%l5,	%o6
	ldsb	[%l7 + 0x73],	%g7
	array8	%g3,	%i4,	%l6
	movre	%o5,	0x347,	%l0
	fcmple16	%f18,	%f10,	%o1
	ldd	[%l7 + 0x78],	%l2
	fcmpgt32	%f16,	%f28,	%i7
	sdiv	%o7,	0x17C2,	%g1
	fands	%f27,	%f20,	%f9
	fmuld8ulx16	%f5,	%f30,	%f26
	st	%f22,	[%l7 + 0x50]
	edge8ln	%l1,	%i3,	%i0
	and	%o0,	%i2,	%i6
	fnegs	%f7,	%f12
	fmovde	%xcc,	%f18,	%f15
	edge16l	%l4,	%g6,	%g4
	movneg	%xcc,	%i5,	%g5
	movge	%icc,	%i1,	%o2
	edge8ln	%o3,	%o4,	%l3
	smulcc	%l5,	%g2,	%g7
	edge8	%o6,	%i4,	%l6
	subcc	%o5,	0x0084,	%g3
	movge	%xcc,	%o1,	%l0
	fnot1	%f14,	%f0
	orcc	%l2,	%i7,	%g1
	sethi	0x1847,	%l1
	orn	%o7,	%i0,	%o0
	sub	%i3,	%i6,	%i2
	fcmpne16	%f24,	%f8,	%l4
	orn	%g6,	%i5,	%g5
	stx	%g4,	[%l7 + 0x48]
	fpmerge	%f30,	%f8,	%f30
	addc	%o2,	0x1363,	%i1
	udivx	%o3,	0x1C25,	%l3
	array32	%o4,	%l5,	%g2
	lduw	[%l7 + 0x44],	%o6
	movn	%icc,	%i4,	%g7
	andn	%o5,	%l6,	%o1
	edge8	%l0,	%g3,	%l2
	srax	%g1,	0x12,	%l1
	udiv	%i7,	0x1663,	%i0
	movrlez	%o7,	0x210,	%o0
	add	%i6,	0x13F5,	%i2
	edge32ln	%i3,	%g6,	%i5
	ldd	[%l7 + 0x30],	%l4
	orncc	%g4,	%o2,	%g5
	ldsh	[%l7 + 0x08],	%o3
	umul	%l3,	%i1,	%l5
	andcc	%g2,	0x15D3,	%o6
	movge	%icc,	%o4,	%i4
	sdiv	%o5,	0x157D,	%g7
	fands	%f0,	%f5,	%f22
	xor	%l6,	%l0,	%o1
	ldd	[%l7 + 0x30],	%l2
	fsrc2s	%f20,	%f3
	edge32n	%g1,	%l1,	%g3
	xor	%i0,	0x125B,	%i7
	movneg	%icc,	%o0,	%i6
	fmovrdgz	%i2,	%f16,	%f14
	popc	%o7,	%i3
	edge8l	%g6,	%l4,	%g4
	fors	%f14,	%f13,	%f15
	movl	%icc,	%i5,	%g5
	or	%o2,	0x16F7,	%o3
	movle	%xcc,	%l3,	%i1
	ld	[%l7 + 0x0C],	%f18
	popc	0x1738,	%l5
	fmovdg	%xcc,	%f28,	%f19
	andncc	%o6,	%o4,	%i4
	srlx	%o5,	0x00,	%g7
	movcs	%icc,	%g2,	%l6
	xnorcc	%o1,	%l2,	%g1
	movleu	%xcc,	%l0,	%g3
	movvs	%xcc,	%l1,	%i7
	movvs	%icc,	%i0,	%i6
	movrlz	%i2,	%o7,	%o0
	lduh	[%l7 + 0x36],	%g6
	movl	%icc,	%l4,	%g4
	stb	%i5,	[%l7 + 0x10]
	udivcc	%g5,	0x1E28,	%o2
	edge8l	%i3,	%l3,	%i1
	udivcc	%o3,	0x107E,	%o6
	alignaddr	%l5,	%i4,	%o5
	orncc	%g7,	%o4,	%l6
	edge32	%g2,	%o1,	%g1
	edge32l	%l2,	%l0,	%l1
	nop
	set	0x48, %o7
	ldsh	[%l7 + %o7],	%i7
	movleu	%xcc,	%g3,	%i6
	movg	%icc,	%i2,	%o7
	addcc	%i0,	0x0991,	%g6
	movrgez	%o0,	%g4,	%l4
	fmovdneg	%icc,	%f1,	%f28
	or	%g5,	%o2,	%i5
	mova	%xcc,	%i3,	%i1
	xor	%o3,	%o6,	%l3
	fmovsgu	%xcc,	%f3,	%f13
	movneg	%xcc,	%l5,	%o5
	fpadd16	%f18,	%f4,	%f18
	or	%i4,	0x1E9D,	%g7
	ldd	[%l7 + 0x68],	%f6
	movrne	%l6,	%o4,	%o1
	movpos	%icc,	%g2,	%g1
	movre	%l2,	0x0E0,	%l1
	andn	%l0,	0x0DF0,	%g3
	mulscc	%i7,	%i6,	%i2
	orcc	%i0,	0x04C6,	%o7
	save %o0, 0x0D28, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g4,	0x0FA0,	%g5
	sra	%l4,	%o2,	%i5
	andncc	%i3,	%o3,	%i1
	fands	%f5,	%f11,	%f15
	popc	%o6,	%l5
	sdiv	%o5,	0x0650,	%l3
	udiv	%i4,	0x11D8,	%g7
	udivcc	%l6,	0x1D03,	%o1
	movrlez	%o4,	%g2,	%l2
	movrlz	%l1,	%l0,	%g1
	nop
	set	0x4B, %i7
	stb	%i7,	[%l7 + %i7]
	addcc	%i6,	%i2,	%i0
	stb	%o7,	[%l7 + 0x6F]
	st	%f12,	[%l7 + 0x20]
	edge16n	%o0,	%g6,	%g4
	xnor	%g5,	%l4,	%g3
	mulx	%i5,	%i3,	%o2
	edge16	%o3,	%i1,	%l5
	and	%o5,	0x1722,	%o6
	umulcc	%l3,	%i4,	%l6
	subccc	%o1,	0x0BA0,	%g7
	fand	%f26,	%f24,	%f2
	fxnor	%f10,	%f26,	%f28
	stx	%o4,	[%l7 + 0x78]
	movleu	%xcc,	%l2,	%l1
	movneg	%icc,	%g2,	%g1
	nop
	set	0x4C, %g7
	sth	%i7,	[%l7 + %g7]
	fmovsne	%icc,	%f10,	%f12
	or	%l0,	0x027C,	%i2
	ldd	[%l7 + 0x10],	%i0
	fcmps	%fcc0,	%f24,	%f28
	fmovdvc	%xcc,	%f21,	%f8
	xnor	%i6,	0x1B9A,	%o7
	stb	%g6,	[%l7 + 0x41]
	xnorcc	%o0,	0x023B,	%g5
	popc	%g4,	%l4
	sdivx	%g3,	0x01F6,	%i5
	andncc	%i3,	%o3,	%o2
	fcmple32	%f16,	%f18,	%l5
	xnorcc	%o5,	%o6,	%i1
	movge	%icc,	%i4,	%l3
	ldsw	[%l7 + 0x64],	%o1
	stw	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x40],	%f18
	movrlz	%g7,	0x193,	%l2
	addccc	%o4,	%l1,	%g2
	xnorcc	%i7,	0x0BA4,	%g1
	move	%icc,	%l0,	%i2
	movleu	%xcc,	%i0,	%o7
	fmuld8sux16	%f20,	%f27,	%f8
	umul	%i6,	%o0,	%g5
	edge32	%g4,	%l4,	%g6
	fcmpes	%fcc1,	%f6,	%f3
	orcc	%g3,	%i5,	%i3
	fnor	%f2,	%f10,	%f10
	move	%xcc,	%o2,	%l5
	subcc	%o3,	0x038A,	%o5
	fmovscc	%icc,	%f19,	%f28
	add	%o6,	0x0BF5,	%i1
	orn	%i4,	0x1E7D,	%l3
	fornot1s	%f15,	%f12,	%f16
	fmovsgu	%icc,	%f23,	%f7
	andn	%o1,	0x0365,	%g7
	fmovrdgez	%l2,	%f14,	%f6
	edge16ln	%l6,	%l1,	%g2
	array32	%o4,	%i7,	%l0
	fmuld8ulx16	%f1,	%f26,	%f16
	ldsw	[%l7 + 0x60],	%i2
	movge	%icc,	%g1,	%o7
	and	%i6,	0x198B,	%o0
	fands	%f24,	%f24,	%f6
	fpackfix	%f26,	%f6
	movgu	%icc,	%g5,	%i0
	movvc	%icc,	%g4,	%l4
	sra	%g3,	%i5,	%g6
	array8	%o2,	%i3,	%o3
	movg	%xcc,	%o5,	%o6
	fmovdne	%xcc,	%f27,	%f20
	for	%f2,	%f28,	%f10
	srax	%l5,	%i4,	%i1
	sir	0x0636
	orn	%l3,	%o1,	%l2
	smul	%g7,	%l1,	%g2
	movrlez	%l6,	%o4,	%i7
	movge	%xcc,	%l0,	%i2
	ldsb	[%l7 + 0x56],	%g1
	sdivcc	%i6,	0x0FD5,	%o0
	edge8ln	%o7,	%g5,	%i0
	ldsb	[%l7 + 0x4C],	%g4
	fcmpne16	%f10,	%f24,	%l4
	sllx	%g3,	%g6,	%i5
	fmovdcc	%icc,	%f10,	%f3
	movge	%icc,	%o2,	%o3
	array8	%o5,	%i3,	%o6
	fmovsvc	%icc,	%f29,	%f12
	edge32l	%i4,	%l5,	%l3
	stb	%o1,	[%l7 + 0x58]
	or	%i1,	0x1D6D,	%l2
	fcmpne16	%f6,	%f6,	%g7
	movrgz	%l1,	%l6,	%g2
	srax	%o4,	%i7,	%l0
	fmovdvc	%xcc,	%f0,	%f10
	lduw	[%l7 + 0x68],	%i2
	edge8l	%g1,	%o0,	%i6
	movrne	%g5,	%o7,	%i0
	or	%g4,	%l4,	%g6
	ldsb	[%l7 + 0x5E],	%i5
	mova	%icc,	%g3,	%o2
	edge16l	%o5,	%i3,	%o3
	edge8n	%i4,	%l5,	%l3
	umulcc	%o1,	%o6,	%l2
	orn	%g7,	%i1,	%l6
	mova	%icc,	%l1,	%g2
	lduh	[%l7 + 0x22],	%i7
	mulscc	%l0,	%i2,	%g1
	fxors	%f25,	%f15,	%f18
	edge32	%o0,	%i6,	%g5
	fmovdg	%icc,	%f0,	%f21
	array16	%o4,	%i0,	%o7
	fandnot2	%f28,	%f24,	%f16
	sllx	%l4,	0x10,	%g4
	xor	%i5,	0x10DB,	%g3
	edge32l	%o2,	%o5,	%g6
	sub	%i3,	%o3,	%i4
	fmovsle	%xcc,	%f24,	%f28
	sdivcc	%l3,	0x0917,	%l5
	fmul8ulx16	%f18,	%f14,	%f30
	ld	[%l7 + 0x4C],	%f17
	movrgz	%o6,	%l2,	%o1
	movl	%icc,	%g7,	%i1
	ldd	[%l7 + 0x48],	%f0
	array16	%l1,	%l6,	%i7
	stb	%g2,	[%l7 + 0x32]
	sdivx	%l0,	0x12E2,	%g1
	xor	%i2,	%o0,	%i6
	move	%xcc,	%g5,	%o4
	fmovsneg	%icc,	%f7,	%f9
	ld	[%l7 + 0x28],	%f23
	move	%xcc,	%o7,	%l4
	smul	%i0,	%g4,	%i5
	fornot1s	%f16,	%f2,	%f4
	udivcc	%g3,	0x1E5B,	%o5
	fornot2	%f22,	%f2,	%f0
	udivx	%o2,	0x0E6C,	%i3
	fcmpgt16	%f26,	%f14,	%o3
	movvc	%xcc,	%i4,	%l3
	and	%g6,	%l5,	%l2
	ldd	[%l7 + 0x40],	%f18
	movneg	%xcc,	%o1,	%g7
	edge16l	%i1,	%o6,	%l1
	smul	%i7,	0x17AD,	%g2
	andcc	%l0,	%g1,	%i2
	orncc	%l6,	0x1E82,	%o0
	stx	%i6,	[%l7 + 0x68]
	stx	%g5,	[%l7 + 0x08]
	lduh	[%l7 + 0x2A],	%o7
	array16	%o4,	%i0,	%g4
	add	%l4,	0x0E60,	%i5
	fnegs	%f10,	%f6
	st	%f20,	[%l7 + 0x50]
	movrgez	%o5,	%g3,	%i3
	stw	%o3,	[%l7 + 0x10]
	edge16n	%o2,	%i4,	%l3
	save %l5, %g6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x70, %i4
	ldsh	[%l7 + %i4],	%g7
	fone	%f10
	sdivcc	%o1,	0x1B05,	%i1
	sir	0x01CC
	xnorcc	%o6,	%i7,	%g2
	xorcc	%l1,	0x1AD3,	%g1
	fmovde	%icc,	%f21,	%f6
	sub	%i2,	%l0,	%l6
	fones	%f29
	edge16ln	%i6,	%o0,	%o7
	fone	%f8
	movle	%icc,	%g5,	%o4
	srlx	%i0,	0x13,	%l4
	array8	%g4,	%o5,	%g3
	movrgez	%i3,	0x110,	%i5
	edge32	%o3,	%o2,	%l3
	orn	%i4,	0x047B,	%g6
	addc	%l5,	0x134F,	%g7
	addc	%l2,	0x1F70,	%o1
	movcc	%xcc,	%o6,	%i1
	movrne	%i7,	0x394,	%l1
	umul	%g2,	0x0953,	%i2
	fmovscc	%icc,	%f18,	%f6
	andcc	%g1,	0x1C56,	%l0
	ldsh	[%l7 + 0x22],	%i6
	mova	%xcc,	%o0,	%l6
	sir	0x1FE1
	movvc	%xcc,	%g5,	%o7
	smul	%o4,	%i0,	%g4
	udivx	%o5,	0x0B08,	%l4
	fones	%f17
	movgu	%icc,	%g3,	%i3
	subccc	%i5,	0x1CA3,	%o2
	edge16ln	%o3,	%i4,	%g6
	stx	%l3,	[%l7 + 0x40]
	bshuffle	%f28,	%f0,	%f28
	umul	%g7,	%l2,	%o1
	fsrc1s	%f24,	%f9
	edge32ln	%o6,	%i1,	%l5
	movrlez	%i7,	0x17B,	%g2
	fcmpd	%fcc2,	%f0,	%f14
	ldd	[%l7 + 0x08],	%f24
	srl	%l1,	%i2,	%g1
	umulcc	%l0,	0x1763,	%o0
	fpadd16s	%f29,	%f28,	%f16
	movne	%icc,	%i6,	%g5
	addcc	%l6,	0x1BB0,	%o4
	movre	%i0,	0x191,	%g4
	ldx	[%l7 + 0x60],	%o7
	edge16	%o5,	%l4,	%g3
	edge32l	%i3,	%i5,	%o3
	fnand	%f24,	%f24,	%f14
	xorcc	%i4,	0x1068,	%g6
	stw	%o2,	[%l7 + 0x1C]
	stb	%g7,	[%l7 + 0x22]
	ldsw	[%l7 + 0x70],	%l2
	fcmpne32	%f24,	%f10,	%l3
	movneg	%xcc,	%o1,	%o6
	movneg	%xcc,	%l5,	%i1
	andn	%i7,	%l1,	%g2
	sth	%g1,	[%l7 + 0x70]
	movre	%l0,	%o0,	%i6
	edge32l	%i2,	%l6,	%o4
	smulcc	%g5,	%g4,	%o7
	sir	0x013D
	srl	%i0,	%l4,	%o5
	addccc	%g3,	%i3,	%o3
	array16	%i4,	%i5,	%o2
	umulcc	%g6,	%l2,	%g7
	andncc	%o1,	%l3,	%o6
	xnor	%l5,	0x003E,	%i1
	smul	%i7,	%l1,	%g2
	array8	%g1,	%o0,	%l0
	udivx	%i2,	0x1FDC,	%l6
	edge8l	%i6,	%o4,	%g4
	orncc	%o7,	%g5,	%l4
	subc	%o5,	0x1688,	%i0
	movpos	%xcc,	%g3,	%i3
	sdivcc	%o3,	0x1797,	%i5
	umulcc	%o2,	%i4,	%l2
	array8	%g7,	%g6,	%l3
	addcc	%o1,	%l5,	%o6
	ldx	[%l7 + 0x40],	%i1
	fmovdcs	%icc,	%f21,	%f9
	andcc	%l1,	%g2,	%i7
	stw	%g1,	[%l7 + 0x3C]
	andcc	%o0,	%l0,	%i2
	st	%f29,	[%l7 + 0x1C]
	fpackfix	%f2,	%f17
	edge16n	%i6,	%o4,	%l6
	for	%f2,	%f10,	%f12
	alignaddrl	%o7,	%g5,	%l4
	lduw	[%l7 + 0x34],	%g4
	fmovrde	%o5,	%f12,	%f10
	edge8	%i0,	%i3,	%o3
	movpos	%icc,	%i5,	%g3
	move	%xcc,	%i4,	%l2
	move	%icc,	%g7,	%o2
	andncc	%g6,	%o1,	%l5
	edge16	%o6,	%i1,	%l3
	srax	%l1,	0x02,	%g2
	stx	%i7,	[%l7 + 0x28]
	and	%g1,	0x0FEF,	%o0
	mulx	%l0,	0x15E1,	%i6
	nop
	set	0x6C, %o5
	ldsw	[%l7 + %o5],	%i2
	movle	%xcc,	%o4,	%l6
	subcc	%g5,	%l4,	%o7
	sra	%o5,	%g4,	%i3
	xnorcc	%i0,	%o3,	%g3
	mulscc	%i5,	%l2,	%i4
	fmovrdgez	%g7,	%f2,	%f6
	addc	%g6,	0x18C2,	%o1
	addc	%l5,	0x1863,	%o2
	fmovsneg	%icc,	%f13,	%f26
	movl	%icc,	%i1,	%l3
	ldd	[%l7 + 0x38],	%o6
	movg	%xcc,	%l1,	%g2
	move	%xcc,	%g1,	%i7
	sra	%o0,	%l0,	%i2
	ldsb	[%l7 + 0x53],	%o4
	st	%f26,	[%l7 + 0x7C]
	lduw	[%l7 + 0x44],	%i6
	umul	%g5,	0x0232,	%l4
	save %l6, 0x1644, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%icc,	%f17,	%f4
	ldsw	[%l7 + 0x3C],	%g4
	xnor	%i3,	%o7,	%i0
	fmovdg	%icc,	%f30,	%f23
	srax	%o3,	0x0E,	%i5
	sethi	0x1011,	%g3
	ldd	[%l7 + 0x68],	%l2
	fmovdge	%icc,	%f1,	%f30
	mulx	%i4,	0x0FEA,	%g7
	popc	%g6,	%l5
	stw	%o2,	[%l7 + 0x50]
	edge16l	%o1,	%i1,	%o6
	fmovrdgez	%l3,	%f26,	%f4
	movcs	%xcc,	%g2,	%g1
	lduw	[%l7 + 0x5C],	%l1
	edge8	%o0,	%l0,	%i7
	edge16	%i2,	%o4,	%g5
	movl	%icc,	%l4,	%l6
	sdivx	%i6,	0x1C21,	%o5
	fands	%f16,	%f19,	%f9
	srax	%i3,	%g4,	%i0
	fmovsne	%icc,	%f9,	%f10
	umul	%o7,	0x0309,	%i5
	ldsw	[%l7 + 0x1C],	%g3
	movre	%l2,	0x05A,	%o3
	stw	%i4,	[%l7 + 0x38]
	srlx	%g6,	%l5,	%o2
	sllx	%g7,	0x0C,	%o1
	subcc	%i1,	%l3,	%o6
	edge16	%g2,	%g1,	%l1
	array32	%l0,	%i7,	%o0
	fmovdvc	%icc,	%f17,	%f10
	add	%i2,	0x1F0B,	%g5
	fmovrdgz	%o4,	%f2,	%f14
	sdiv	%l4,	0x1930,	%l6
	fnands	%f24,	%f9,	%f1
	nop
	set	0x22, %l4
	lduh	[%l7 + %l4],	%o5
	sdiv	%i3,	0x1E5E,	%g4
	fzero	%f6
	lduh	[%l7 + 0x7A],	%i0
	sdivx	%o7,	0x008B,	%i5
	fmovsl	%xcc,	%f25,	%f29
	fcmpgt32	%f6,	%f22,	%i6
	movrgez	%l2,	%o3,	%g3
	fmovdcc	%xcc,	%f16,	%f24
	umulcc	%g6,	0x068C,	%l5
	for	%f24,	%f20,	%f6
	fmovrse	%i4,	%f8,	%f3
	fmovsg	%xcc,	%f31,	%f12
	srax	%o2,	%o1,	%g7
	ldsb	[%l7 + 0x29],	%i1
	sllx	%o6,	%l3,	%g2
	fandnot1s	%f19,	%f15,	%f26
	fpsub16	%f22,	%f14,	%f8
	movge	%xcc,	%l1,	%l0
	restore %g1, %i7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o0,	%g5,	%l4
	xnor	%o4,	%l6,	%o5
	fone	%f10
	lduh	[%l7 + 0x36],	%g4
	edge32	%i3,	%o7,	%i5
	sir	0x097B
	smulcc	%i6,	%l2,	%i0
	edge32ln	%o3,	%g6,	%l5
	move	%icc,	%g3,	%o2
	fmovrse	%i4,	%f24,	%f10
	st	%f13,	[%l7 + 0x1C]
	edge16ln	%g7,	%i1,	%o1
	andcc	%l3,	%o6,	%l1
	sth	%g2,	[%l7 + 0x3C]
	move	%xcc,	%g1,	%i7
	movrlez	%l0,	0x2F5,	%i2
	sth	%o0,	[%l7 + 0x22]
	xor	%g5,	0x129C,	%l4
	xnor	%l6,	%o4,	%o5
	sdivx	%i3,	0x03C1,	%o7
	addcc	%i5,	%g4,	%l2
	orcc	%i6,	%i0,	%g6
	stw	%l5,	[%l7 + 0x44]
	movcc	%xcc,	%g3,	%o2
	add	%i4,	%o3,	%g7
	movne	%icc,	%i1,	%o1
	fnands	%f19,	%f15,	%f2
	andcc	%l3,	%o6,	%g2
	movl	%icc,	%g1,	%i7
	array32	%l1,	%i2,	%l0
	mulscc	%g5,	0x1DDA,	%l4
	mulscc	%l6,	0x1D32,	%o0
	sll	%o5,	0x1D,	%i3
	fmovsgu	%icc,	%f16,	%f16
	movleu	%xcc,	%o7,	%i5
	addccc	%g4,	0x0CB8,	%o4
	fcmpeq16	%f4,	%f6,	%i6
	ld	[%l7 + 0x38],	%f12
	udiv	%i0,	0x114E,	%g6
	edge16l	%l2,	%g3,	%l5
	fmovdle	%xcc,	%f18,	%f19
	edge32l	%i4,	%o2,	%g7
	edge32n	%i1,	%o1,	%o3
	orncc	%o6,	%g2,	%l3
	mova	%xcc,	%g1,	%l1
	movrgez	%i2,	0x018,	%l0
	nop
	set	0x32, %o2
	ldub	[%l7 + %o2],	%g5
	stw	%l4,	[%l7 + 0x70]
	movrlz	%l6,	%i7,	%o5
	srax	%i3,	%o7,	%o0
	array16	%g4,	%o4,	%i5
	movvs	%icc,	%i0,	%i6
	mova	%icc,	%g6,	%g3
	fpsub16	%f12,	%f18,	%f4
	array8	%l5,	%l2,	%o2
	fcmpgt16	%f24,	%f22,	%i4
	array8	%g7,	%o1,	%i1
	sth	%o6,	[%l7 + 0x54]
	srax	%o3,	0x19,	%g2
	edge16	%g1,	%l3,	%i2
	add	%l0,	%g5,	%l4
	fnor	%f16,	%f28,	%f6
	movne	%icc,	%l6,	%l1
	fmovsge	%icc,	%f11,	%f3
	movvc	%icc,	%i7,	%i3
	array8	%o5,	%o0,	%g4
	fand	%f24,	%f2,	%f22
	save %o7, %i5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%i0,	%i6
	ldd	[%l7 + 0x40],	%g6
	smul	%g3,	0x1F83,	%l5
	save %l2, %i4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o1,	0x083A,	%o2
	orn	%i1,	%o6,	%o3
	orncc	%g2,	0x1EB0,	%l3
	movrgz	%i2,	0x2C6,	%g1
	udivcc	%l0,	0x131B,	%g5
	xnor	%l4,	%l1,	%l6
	fmovd	%f18,	%f22
	edge8ln	%i3,	%o5,	%o0
	sdivcc	%g4,	0x0CCE,	%i7
	fors	%f2,	%f23,	%f21
	edge8n	%o7,	%o4,	%i5
	addc	%i6,	0x1D57,	%g6
	movg	%icc,	%i0,	%l5
	fmovsleu	%icc,	%f17,	%f20
	ldd	[%l7 + 0x20],	%f2
	fnot1	%f20,	%f18
	sdivcc	%l2,	0x1FDC,	%g3
	ldx	[%l7 + 0x28],	%i4
	movrgz	%o1,	0x221,	%o2
	edge16ln	%i1,	%g7,	%o3
	st	%f20,	[%l7 + 0x7C]
	orn	%g2,	%l3,	%o6
	move	%xcc,	%g1,	%l0
	sdiv	%i2,	0x10B7,	%l4
	ldub	[%l7 + 0x3A],	%l1
	edge32	%l6,	%i3,	%o5
	edge32l	%o0,	%g4,	%g5
	edge8n	%o7,	%o4,	%i5
	edge32l	%i6,	%i7,	%i0
	fpadd16	%f28,	%f12,	%f30
	fexpand	%f7,	%f16
	pdist	%f16,	%f28,	%f6
	edge32l	%l5,	%l2,	%g6
	fandnot1s	%f29,	%f22,	%f19
	fmovrsne	%g3,	%f18,	%f17
	udivcc	%i4,	0x0E57,	%o1
	edge8l	%i1,	%o2,	%g7
	movn	%icc,	%g2,	%l3
	ldx	[%l7 + 0x78],	%o3
	fmovd	%f14,	%f20
	lduw	[%l7 + 0x2C],	%g1
	sdivx	%l0,	0x079E,	%o6
	lduh	[%l7 + 0x5C],	%i2
	ldub	[%l7 + 0x08],	%l1
	udivx	%l4,	0x0C60,	%l6
	orn	%i3,	0x161F,	%o5
	fxnors	%f27,	%f22,	%f19
	fmovrsne	%o0,	%f20,	%f7
	array16	%g5,	%o7,	%g4
	edge32ln	%i5,	%i6,	%o4
	xor	%i7,	%i0,	%l2
	sethi	0x1FFD,	%g6
	srl	%g3,	0x05,	%i4
	edge8l	%l5,	%o1,	%i1
	edge32	%o2,	%g2,	%g7
	stw	%o3,	[%l7 + 0x60]
	fxors	%f29,	%f29,	%f14
	edge16n	%g1,	%l3,	%l0
	fnot1s	%f12,	%f1
	array16	%o6,	%i2,	%l4
	subc	%l1,	%l6,	%o5
	ldsh	[%l7 + 0x60],	%o0
	stx	%i3,	[%l7 + 0x38]
	mulx	%g5,	%o7,	%i5
	edge16n	%i6,	%g4,	%o4
	fmovdne	%xcc,	%f6,	%f14
	sdivcc	%i7,	0x015C,	%l2
	orcc	%i0,	%g6,	%g3
	movrlez	%l5,	0x081,	%o1
	fnor	%f26,	%f24,	%f10
	popc	%i1,	%i4
	edge8n	%o2,	%g2,	%g7
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	movvs	%icc,	%l0,	%i2
	stw	%l4,	[%l7 + 0x50]
	or	%l1,	%l6,	%o6
	edge8n	%o5,	%o0,	%g5
	edge16	%o7,	%i3,	%i6
	ldd	[%l7 + 0x20],	%f18
	xorcc	%g4,	%i5,	%o4
	ldsw	[%l7 + 0x60],	%i7
	restore %i0, %l2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f22,	%f9
	movcs	%icc,	%l5,	%o1
	subc	%g3,	0x1444,	%i1
	stb	%i4,	[%l7 + 0x64]
	xnorcc	%g2,	0x0A4A,	%g7
	fcmpeq16	%f28,	%f0,	%g1
	sdiv	%o2,	0x1CBD,	%o3
	mulx	%l0,	%i2,	%l3
	edge32ln	%l4,	%l1,	%o6
	fmovdvc	%icc,	%f27,	%f17
	nop
	set	0x30, %i6
	ldsh	[%l7 + %i6],	%l6
	move	%xcc,	%o5,	%g5
	alignaddrl	%o7,	%i3,	%o0
	udivx	%i6,	0x16F1,	%i5
	fpadd32s	%f2,	%f10,	%f14
	xorcc	%o4,	%g4,	%i0
	movl	%icc,	%i7,	%g6
	move	%xcc,	%l5,	%o1
	move	%icc,	%g3,	%i1
	edge32	%i4,	%g2,	%l2
	movrlez	%g1,	0x169,	%o2
	mulscc	%g7,	%o3,	%l0
	addc	%i2,	0x0DE3,	%l4
	lduw	[%l7 + 0x28],	%l1
	stw	%l3,	[%l7 + 0x14]
	edge32	%l6,	%o6,	%g5
	fcmpgt16	%f6,	%f24,	%o7
	movvc	%icc,	%i3,	%o5
	fpack16	%f20,	%f31
	srax	%i6,	0x12,	%i5
	fmovrde	%o4,	%f2,	%f4
	mulscc	%g4,	0x0F9E,	%o0
	stx	%i0,	[%l7 + 0x48]
	ldd	[%l7 + 0x48],	%g6
	edge8n	%i7,	%o1,	%l5
	movpos	%icc,	%i1,	%g3
	edge8	%g2,	%i4,	%g1
	edge32	%o2,	%l2,	%g7
	movl	%icc,	%o3,	%l0
	edge32l	%l4,	%l1,	%l3
	fmovrslz	%i2,	%f18,	%f19
	fornot2	%f6,	%f28,	%f2
	ldsh	[%l7 + 0x6C],	%o6
	stb	%l6,	[%l7 + 0x22]
	sethi	0x1367,	%g5
	sethi	0x183B,	%o7
	fmovscs	%xcc,	%f30,	%f6
	subc	%i3,	0x105B,	%i6
	fcmple16	%f20,	%f12,	%o5
	udivx	%o4,	0x0AFB,	%g4
	movge	%icc,	%i5,	%o0
	orcc	%g6,	0x184F,	%i7
	sdiv	%o1,	0x17FF,	%l5
	fmovscs	%icc,	%f13,	%f20
	orncc	%i0,	0x0A26,	%g3
	movle	%icc,	%g2,	%i4
	fcmpd	%fcc0,	%f22,	%f4
	fmovdgu	%xcc,	%f21,	%f30
	fands	%f17,	%f29,	%f4
	movrgez	%i1,	0x0B5,	%g1
	subcc	%l2,	0x038D,	%g7
	fpadd16s	%f27,	%f11,	%f14
	srlx	%o2,	%l0,	%o3
	sth	%l4,	[%l7 + 0x38]
	sir	0x1D6D
	fmovdg	%xcc,	%f0,	%f9
	movrgez	%l1,	%l3,	%o6
	ldx	[%l7 + 0x68],	%i2
	st	%f26,	[%l7 + 0x0C]
	srax	%l6,	0x02,	%g5
	fmovrsgz	%i3,	%f19,	%f22
	udivcc	%i6,	0x0F5C,	%o5
	addccc	%o7,	0x110A,	%o4
	movgu	%xcc,	%i5,	%g4
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	fcmple16	%f26,	%f12,	%l5
	srax	%o1,	%i0,	%g2
	edge8	%i4,	%i1,	%g3
	movn	%icc,	%g1,	%l2
	movneg	%xcc,	%g7,	%o2
	xnor	%l0,	%o3,	%l1
	ld	[%l7 + 0x1C],	%f3
	nop
	set	0x3A, %o3
	lduh	[%l7 + %o3],	%l3
	xorcc	%l4,	%o6,	%i2
	popc	0x0B8E,	%g5
	stx	%i3,	[%l7 + 0x28]
	fxors	%f7,	%f15,	%f15
	move	%xcc,	%l6,	%o5
	addc	%i6,	%o7,	%o4
	fnot2s	%f26,	%f29
	edge8n	%g4,	%g6,	%i7
	ldx	[%l7 + 0x78],	%i5
	movle	%icc,	%l5,	%o1
	edge8l	%i0,	%o0,	%g2
	fornot1	%f22,	%f14,	%f8
	udivcc	%i4,	0x101A,	%i1
	ld	[%l7 + 0x5C],	%f5
	fcmpne16	%f20,	%f12,	%g3
	sllx	%g1,	%l2,	%g7
	sir	0x107F
	ld	[%l7 + 0x6C],	%f24
	save %o2, %o3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x5B],	%l1
	fmovdpos	%xcc,	%f5,	%f30
	smul	%l3,	%l4,	%i2
	movrgz	%g5,	0x098,	%o6
	movleu	%icc,	%i3,	%o5
	umul	%i6,	%o7,	%l6
	nop
	set	0x18, %l5
	std	%f20,	[%l7 + %l5]
	movn	%xcc,	%o4,	%g4
	movcs	%icc,	%g6,	%i5
	movvc	%icc,	%i7,	%o1
	sdivcc	%l5,	0x0ADD,	%i0
	xnorcc	%o0,	%g2,	%i1
	fmovsvc	%xcc,	%f23,	%f9
	ldub	[%l7 + 0x7D],	%g3
	edge16ln	%g1,	%i4,	%l2
	ldx	[%l7 + 0x38],	%o2
	movpos	%xcc,	%g7,	%o3
	xor	%l1,	%l3,	%l4
	ldsw	[%l7 + 0x30],	%i2
	umul	%g5,	0x1823,	%o6
	alignaddr	%l0,	%i3,	%i6
	orncc	%o7,	%o5,	%l6
	fmovse	%xcc,	%f3,	%f11
	ldsh	[%l7 + 0x5A],	%g4
	edge16	%g6,	%o4,	%i7
	sll	%o1,	0x0E,	%i5
	sdivx	%l5,	0x0C90,	%o0
	lduh	[%l7 + 0x60],	%i0
	move	%xcc,	%g2,	%i1
	orncc	%g3,	%g1,	%i4
	xnor	%o2,	%g7,	%l2
	fsrc2s	%f5,	%f12
	ldsh	[%l7 + 0x52],	%o3
	movgu	%icc,	%l1,	%l4
	movre	%l3,	%g5,	%o6
	array16	%i2,	%i3,	%i6
	umulcc	%o7,	%l0,	%l6
	std	%f22,	[%l7 + 0x20]
	sethi	0x06D7,	%g4
	ldd	[%l7 + 0x60],	%f22
	fpsub32s	%f15,	%f2,	%f11
	xnor	%o5,	0x1518,	%g6
	alignaddr	%o4,	%o1,	%i7
	subccc	%i5,	%o0,	%i0
	alignaddrl	%l5,	%i1,	%g3
	fandnot2	%f0,	%f24,	%f8
	fmovsge	%xcc,	%f18,	%f10
	xnorcc	%g1,	%g2,	%o2
	stx	%i4,	[%l7 + 0x40]
	movrgz	%g7,	0x06A,	%o3
	fones	%f28
	addccc	%l1,	%l2,	%l4
	sdivcc	%l3,	0x115F,	%g5
	and	%o6,	0x142A,	%i2
	fnot1	%f0,	%f28
	movpos	%icc,	%i3,	%o7
	edge32l	%i6,	%l6,	%l0
	ldsh	[%l7 + 0x3E],	%g4
	fmovsleu	%icc,	%f2,	%f30
	movcc	%xcc,	%o5,	%g6
	movrlz	%o1,	%i7,	%o4
	fsrc2	%f8,	%f6
	smulcc	%i5,	%i0,	%o0
	movge	%icc,	%l5,	%i1
	sdivx	%g3,	0x18EA,	%g2
	addccc	%g1,	0x09AD,	%i4
	nop
	set	0x58, %o0
	std	%f8,	[%l7 + %o0]
	orncc	%o2,	0x1A6B,	%g7
	sdivx	%o3,	0x0053,	%l2
	udivcc	%l4,	0x13FA,	%l1
	fands	%f12,	%f15,	%f24
	movneg	%xcc,	%l3,	%o6
	edge16	%g5,	%i2,	%o7
	fpadd16	%f10,	%f8,	%f2
	std	%f8,	[%l7 + 0x70]
	smul	%i3,	%l6,	%l0
	fone	%f8
	addc	%g4,	0x1954,	%i6
	fmovsa	%icc,	%f1,	%f26
	sll	%o5,	%g6,	%i7
	pdist	%f12,	%f28,	%f2
	fornot1	%f26,	%f22,	%f24
	edge32n	%o1,	%o4,	%i0
	array8	%i5,	%l5,	%i1
	sdivx	%o0,	0x01E2,	%g3
	ldx	[%l7 + 0x18],	%g2
	array8	%g1,	%o2,	%i4
	nop
	set	0x78, %g3
	stw	%o3,	[%l7 + %g3]
	fandnot1s	%f1,	%f10,	%f6
	movvs	%xcc,	%g7,	%l4
	sll	%l2,	%l3,	%l1
	edge32n	%o6,	%i2,	%o7
	andcc	%g5,	%l6,	%i3
	andn	%g4,	0x0801,	%i6
	andn	%o5,	%g6,	%i7
	stw	%o1,	[%l7 + 0x54]
	ldx	[%l7 + 0x20],	%o4
	fpack16	%f20,	%f2
	fmovdne	%xcc,	%f20,	%f12
	sdivcc	%l0,	0x1A22,	%i0
	fnot1	%f26,	%f4
	movleu	%icc,	%i5,	%i1
	sdiv	%l5,	0x0197,	%g3
	fzero	%f18
	xorcc	%o0,	0x04C4,	%g2
	edge8ln	%g1,	%i4,	%o3
	mulx	%g7,	0x090D,	%l4
	array8	%l2,	%l3,	%l1
	movrlz	%o2,	%o6,	%i2
	ldsb	[%l7 + 0x29],	%g5
	movn	%icc,	%o7,	%i3
	sdiv	%g4,	0x00EA,	%i6
	fmovsne	%icc,	%f17,	%f30
	mulscc	%l6,	0x155C,	%g6
	sdiv	%o5,	0x1421,	%o1
	edge16l	%i7,	%l0,	%i0
	movrgez	%o4,	%i1,	%l5
	movle	%xcc,	%g3,	%o0
	fmovrslez	%i5,	%f27,	%f25
	sdivcc	%g1,	0x0AB3,	%i4
	fmovdge	%icc,	%f24,	%f24
	add	%o3,	%g2,	%l4
	fmul8sux16	%f14,	%f4,	%f20
	fmovrsne	%l2,	%f26,	%f12
	subc	%g7,	%l3,	%o2
	fnot1	%f12,	%f22
	srlx	%o6,	0x10,	%l1
	movrgez	%i2,	0x2C8,	%g5
	udivcc	%i3,	0x12DC,	%g4
	xor	%i6,	%o7,	%l6
	movrgz	%o5,	%g6,	%i7
	ldsw	[%l7 + 0x6C],	%l0
	st	%f28,	[%l7 + 0x08]
	stx	%o1,	[%l7 + 0x30]
	edge16	%i0,	%i1,	%o4
	fcmple32	%f18,	%f6,	%g3
	addc	%o0,	0x12A5,	%i5
	fmovde	%xcc,	%f30,	%f8
	srl	%l5,	%i4,	%o3
	movrne	%g1,	0x1D5,	%l4
	fmovdge	%xcc,	%f30,	%f7
	ldsw	[%l7 + 0x2C],	%g2
	fnot2	%f24,	%f4
	subccc	%g7,	%l2,	%l3
	edge16l	%o2,	%o6,	%l1
	fones	%f14
	movgu	%xcc,	%i2,	%i3
	fmovsneg	%icc,	%f29,	%f9
	fone	%f6
	edge8	%g5,	%i6,	%g4
	edge32ln	%o7,	%l6,	%o5
	sdivcc	%g6,	0x0202,	%l0
	array32	%o1,	%i0,	%i1
	addcc	%o4,	%i7,	%g3
	fmovdcc	%xcc,	%f29,	%f18
	restore %i5, 0x06C6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l5,	%i4,	%o3
	movrlez	%l4,	0x09C,	%g1
	subc	%g2,	0x0207,	%l2
	edge8l	%l3,	%o2,	%o6
	fmovrdne	%l1,	%f20,	%f4
	udivx	%g7,	0x1026,	%i2
	stw	%g5,	[%l7 + 0x40]
	edge32n	%i3,	%i6,	%g4
	ldd	[%l7 + 0x10],	%f30
	alignaddrl	%l6,	%o7,	%o5
	fpackfix	%f28,	%f29
	udivcc	%l0,	0x0066,	%g6
	xnorcc	%i0,	0x016F,	%o1
	movle	%icc,	%i1,	%o4
	fandnot1	%f22,	%f20,	%f18
	movl	%icc,	%i7,	%g3
	sdivx	%i5,	0x0303,	%l5
	fcmps	%fcc1,	%f17,	%f14
	srl	%i4,	0x08,	%o0
	array16	%l4,	%g1,	%g2
	popc	%l2,	%o3
	alignaddr	%l3,	%o2,	%o6
	edge16ln	%l1,	%g7,	%g5
	ldsh	[%l7 + 0x34],	%i3
	movleu	%xcc,	%i6,	%i2
	move	%icc,	%l6,	%o7
	lduh	[%l7 + 0x66],	%g4
	umulcc	%l0,	%g6,	%i0
	lduw	[%l7 + 0x74],	%o5
	xorcc	%o1,	%i1,	%i7
	udivcc	%g3,	0x14CB,	%o4
	movcs	%xcc,	%l5,	%i4
	fabsd	%f20,	%f10
	fxnors	%f23,	%f1,	%f22
	smulcc	%o0,	0x0B66,	%l4
	srl	%g1,	%g2,	%l2
	sra	%o3,	%i5,	%o2
	for	%f16,	%f12,	%f12
	mulx	%o6,	0x189C,	%l1
	sub	%l3,	%g7,	%i3
	smul	%i6,	%g5,	%l6
	andn	%o7,	0x12E4,	%g4
	movrlez	%i2,	0x2D7,	%l0
	fmul8sux16	%f10,	%f20,	%f16
	fnand	%f4,	%f2,	%f6
	ldd	[%l7 + 0x60],	%f0
	array8	%g6,	%o5,	%i0
	stx	%i1,	[%l7 + 0x78]
	andn	%o1,	0x1C6A,	%g3
	or	%o4,	%i7,	%i4
	fmovrse	%l5,	%f0,	%f15
	save %o0, %l4, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%l2,	%g1
	movrne	%o3,	0x3D3,	%o2
	movl	%xcc,	%i5,	%l1
	sra	%o6,	%l3,	%g7
	fmovs	%f5,	%f21
	movne	%xcc,	%i3,	%g5
	umul	%i6,	0x0566,	%o7
	addc	%g4,	0x1B94,	%l6
	sllx	%l0,	0x0A,	%i2
	fpadd16s	%f3,	%f14,	%f13
	subc	%o5,	0x0FD7,	%i0
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	mulx	%g3,	%g6,	%i7
	fand	%f8,	%f26,	%f16
	fmovdcc	%icc,	%f20,	%f24
	fands	%f10,	%f19,	%f9
	restore %i4, %l5, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f30,	%f16,	%f26
	movrne	%l4,	0x14F,	%g2
	movcs	%xcc,	%l2,	%g1
	array32	%o4,	%o3,	%i5
	st	%f30,	[%l7 + 0x1C]
	fpadd32s	%f18,	%f19,	%f5
	fands	%f10,	%f23,	%f8
	sllx	%l1,	%o6,	%l3
	lduw	[%l7 + 0x60],	%o2
	addccc	%g7,	0x0EFD,	%g5
	sth	%i6,	[%l7 + 0x66]
	sra	%o7,	%i3,	%g4
	orncc	%l6,	0x0459,	%i2
	sdiv	%o5,	0x1671,	%i0
	sllx	%l0,	%o1,	%g3
	movne	%xcc,	%i1,	%g6
	alignaddrl	%i4,	%l5,	%i7
	fnands	%f8,	%f24,	%f19
	umul	%l4,	0x0825,	%o0
	smulcc	%g2,	0x1D86,	%g1
	subc	%o4,	%o3,	%i5
	fands	%f30,	%f15,	%f22
	umulcc	%l1,	%o6,	%l2
	fornot1s	%f1,	%f26,	%f20
	fcmple16	%f12,	%f30,	%l3
	ldsw	[%l7 + 0x2C],	%o2
	edge16	%g5,	%g7,	%i6
	stx	%i3,	[%l7 + 0x28]
	fzero	%f0
	xor	%g4,	0x0BD7,	%l6
	udivcc	%o7,	0x15DF,	%o5
	movleu	%icc,	%i2,	%i0
	fcmple16	%f2,	%f14,	%o1
	smul	%l0,	0x03B6,	%i1
	subccc	%g6,	%g3,	%i4
	fmovdge	%xcc,	%f2,	%f1
	nop
	set	0x4C, %l3
	stw	%l5,	[%l7 + %l3]
	andcc	%i7,	%o0,	%l4
	edge8l	%g2,	%o4,	%o3
	and	%g1,	%l1,	%o6
	srax	%i5,	%l3,	%o2
	movrne	%g5,	%g7,	%l2
	ldd	[%l7 + 0x28],	%i6
	ldx	[%l7 + 0x50],	%i3
	stx	%g4,	[%l7 + 0x70]
	addcc	%l6,	%o5,	%o7
	movrne	%i2,	%i0,	%o1
	sra	%l0,	%g6,	%g3
	andncc	%i4,	%l5,	%i7
	movneg	%icc,	%i1,	%l4
	edge32ln	%g2,	%o0,	%o4
	sll	%o3,	%g1,	%l1
	fmovsge	%xcc,	%f22,	%f4
	edge32ln	%i5,	%l3,	%o2
	movne	%xcc,	%g5,	%o6
	fandnot1	%f16,	%f8,	%f2
	andncc	%l2,	%g7,	%i3
	fcmpne32	%f6,	%f30,	%i6
	movpos	%icc,	%l6,	%g4
	fcmpeq16	%f28,	%f16,	%o5
	ldsw	[%l7 + 0x14],	%o7
	edge16ln	%i2,	%i0,	%o1
	stx	%l0,	[%l7 + 0x18]
	fnot2s	%f12,	%f4
	ldsb	[%l7 + 0x1C],	%g6
	sub	%i4,	%g3,	%l5
	movrlez	%i7,	0x2F6,	%l4
	movrgz	%i1,	%g2,	%o0
	movvs	%xcc,	%o3,	%g1
	ldsw	[%l7 + 0x50],	%l1
	st	%f29,	[%l7 + 0x24]
	sth	%o4,	[%l7 + 0x4E]
	edge32	%i5,	%o2,	%l3
	fpadd16s	%f17,	%f22,	%f12
	array16	%o6,	%l2,	%g5
	sir	0x0C3A
	movleu	%xcc,	%g7,	%i3
	stb	%i6,	[%l7 + 0x31]
	movge	%icc,	%l6,	%o5
	addc	%g4,	%i2,	%i0
	addc	%o7,	%o1,	%g6
	movvs	%xcc,	%l0,	%i4
	edge8n	%l5,	%i7,	%l4
	andncc	%g3,	%g2,	%i1
	fnot2	%f26,	%f16
	movvs	%icc,	%o0,	%g1
	movvs	%xcc,	%l1,	%o4
	movrlez	%o3,	0x1D8,	%i5
	for	%f8,	%f2,	%f2
	fmovrdgz	%l3,	%f18,	%f26
	edge16ln	%o6,	%l2,	%o2
	movvs	%icc,	%g7,	%i3
	edge32	%g5,	%l6,	%o5
	fone	%f26
	sdiv	%i6,	0x1DD6,	%i2
	movge	%icc,	%i0,	%g4
	xor	%o7,	0x05D4,	%g6
	addccc	%o1,	%l0,	%l5
	fnegs	%f20,	%f14
	movrlz	%i4,	%l4,	%i7
	array8	%g2,	%g3,	%i1
	save %o0, 0x1E69, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g1,	%o4,	%o3
	ldsb	[%l7 + 0x08],	%i5
	fmovdgu	%icc,	%f6,	%f16
	fmovsa	%xcc,	%f10,	%f14
	nop
	set	0x54, %o4
	stw	%o6,	[%l7 + %o4]
	srlx	%l3,	%o2,	%g7
	ldsb	[%l7 + 0x2D],	%l2
	udiv	%i3,	0x176B,	%g5
	fmovrslz	%l6,	%f29,	%f31
	movre	%o5,	%i6,	%i2
	move	%icc,	%i0,	%g4
	move	%icc,	%o7,	%g6
	srlx	%l0,	%l5,	%i4
	fmovdpos	%xcc,	%f2,	%f31
	fcmpd	%fcc1,	%f6,	%f14
	xorcc	%l4,	%o1,	%g2
	subccc	%g3,	0x05F5,	%i1
	stb	%i7,	[%l7 + 0x52]
	subccc	%o0,	0x1AC4,	%l1
	sdiv	%o4,	0x12FD,	%g1
	addc	%o3,	%i5,	%o6
	mova	%icc,	%l3,	%g7
	fmovrdlz	%o2,	%f12,	%f26
	smul	%l2,	0x1905,	%i3
	udivcc	%l6,	0x094E,	%o5
	movge	%xcc,	%g5,	%i2
	srlx	%i6,	%g4,	%i0
	movneg	%icc,	%o7,	%l0
	addcc	%l5,	%i4,	%l4
	udivx	%g6,	0x0003,	%g2
	addc	%o1,	0x0929,	%g3
	or	%i1,	%i7,	%l1
	edge8ln	%o0,	%g1,	%o3
	fnot2	%f22,	%f4
	fmovrsgz	%i5,	%f30,	%f10
	fone	%f16
	movcs	%icc,	%o4,	%l3
	orcc	%o6,	%o2,	%g7
	movcc	%xcc,	%i3,	%l6
	movg	%xcc,	%l2,	%o5
	or	%g5,	0x03B7,	%i2
	andncc	%g4,	%i0,	%o7
	fmuld8sux16	%f28,	%f27,	%f6
	fcmpes	%fcc2,	%f13,	%f6
	fmovdle	%xcc,	%f3,	%f22
	fxors	%f14,	%f5,	%f17
	add	%l0,	0x0D4F,	%l5
	mulscc	%i6,	%l4,	%g6
	ldd	[%l7 + 0x40],	%g2
	fmovdne	%icc,	%f9,	%f6
	stx	%o1,	[%l7 + 0x58]
	ldd	[%l7 + 0x70],	%g2
	fnot2	%f22,	%f20
	nop
	set	0x64, %l0
	stw	%i1,	[%l7 + %l0]
	fcmpgt16	%f12,	%f8,	%i7
	ldd	[%l7 + 0x30],	%f24
	ldd	[%l7 + 0x20],	%l0
	addcc	%o0,	0x02BC,	%g1
	ldsb	[%l7 + 0x59],	%o3
	or	%i5,	%i4,	%o4
	fsrc1	%f30,	%f12
	fcmpne16	%f2,	%f30,	%o6
	xorcc	%l3,	0x0F4E,	%o2
	umul	%i3,	%g7,	%l2
	umulcc	%l6,	0x11E9,	%g5
	lduh	[%l7 + 0x0E],	%i2
	fandnot2	%f14,	%f30,	%f12
	movneg	%icc,	%o5,	%g4
	addc	%i0,	0x1606,	%o7
	movvs	%icc,	%l0,	%i6
	and	%l5,	0x0E83,	%g6
	movrgez	%l4,	%g2,	%o1
	movrlz	%i1,	0x2F0,	%g3
	ldd	[%l7 + 0x20],	%f6
	std	%f28,	[%l7 + 0x30]
	fxnors	%f30,	%f23,	%f21
	udiv	%l1,	0x1C1F,	%o0
	add	%g1,	%o3,	%i7
	fmul8sux16	%f22,	%f30,	%f14
	smulcc	%i5,	%i4,	%o4
	srl	%l3,	%o6,	%o2
	sir	0x0943
	edge16ln	%i3,	%l2,	%g7
	ldd	[%l7 + 0x60],	%f0
	fcmpne32	%f18,	%f26,	%l6
	fmuld8sux16	%f6,	%f1,	%f16
	bshuffle	%f0,	%f28,	%f16
	ld	[%l7 + 0x2C],	%f29
	sethi	0x037D,	%g5
	sir	0x1390
	mulx	%i2,	%g4,	%o5
	edge32l	%i0,	%l0,	%i6
	lduw	[%l7 + 0x2C],	%l5
	std	%f20,	[%l7 + 0x28]
	movne	%xcc,	%g6,	%l4
	fmovdleu	%xcc,	%f17,	%f22
	move	%icc,	%g2,	%o7
	srax	%o1,	%i1,	%g3
	or	%o0,	0x057A,	%g1
	mulx	%o3,	%i7,	%l1
	movrgez	%i4,	%i5,	%l3
	movvc	%icc,	%o4,	%o6
	st	%f29,	[%l7 + 0x78]
	orncc	%i3,	%l2,	%o2
	fpsub16	%f30,	%f18,	%f16
	xnorcc	%g7,	0x0777,	%l6
	ldd	[%l7 + 0x70],	%g4
	movn	%xcc,	%g4,	%o5
	fpack16	%f16,	%f23
	movcs	%icc,	%i2,	%l0
	andcc	%i6,	%i0,	%l5
	fmul8x16al	%f15,	%f23,	%f20
	and	%l4,	0x1FAF,	%g2
	ld	[%l7 + 0x78],	%f20
	xorcc	%o7,	%g6,	%i1
	ldsb	[%l7 + 0x10],	%g3
	movcs	%xcc,	%o0,	%o1
	stb	%o3,	[%l7 + 0x58]
	edge32n	%i7,	%l1,	%i4
	srlx	%i5,	%l3,	%o4
	orn	%o6,	0x0873,	%g1
	ldx	[%l7 + 0x30],	%l2
	or	%i3,	%o2,	%g7
	sethi	0x1647,	%g5
	movg	%xcc,	%g4,	%o5
	ldsb	[%l7 + 0x3D],	%l6
	lduw	[%l7 + 0x10],	%i2
	sdivcc	%i6,	0x1167,	%l0
	movl	%icc,	%i0,	%l5
	fmovdneg	%icc,	%f24,	%f15
	udivx	%l4,	0x13D6,	%o7
	movge	%xcc,	%g6,	%g2
	andncc	%i1,	%o0,	%g3
	srl	%o1,	%i7,	%l1
	orn	%o3,	%i4,	%l3
	ldd	[%l7 + 0x50],	%f16
	ldsh	[%l7 + 0x4E],	%o4
	addcc	%i5,	%g1,	%o6
	std	%f26,	[%l7 + 0x60]
	fmovdneg	%xcc,	%f10,	%f6
	edge16	%i3,	%l2,	%o2
	nop
	set	0x38, %i0
	stx	%g5,	[%l7 + %i0]
	stb	%g7,	[%l7 + 0x41]
	ldub	[%l7 + 0x47],	%g4
	movge	%icc,	%l6,	%o5
	subcc	%i6,	0x1FB0,	%l0
	fones	%f12
	orn	%i0,	0x1391,	%l5
	movrlz	%i2,	0x0A8,	%l4
	movle	%icc,	%g6,	%o7
	fmovse	%icc,	%f7,	%f3
	movrne	%g2,	%i1,	%o0
	ld	[%l7 + 0x10],	%f9
	edge16ln	%o1,	%g3,	%l1
	umulcc	%o3,	0x19CF,	%i7
	movcc	%xcc,	%i4,	%o4
	edge8n	%l3,	%g1,	%o6
	udiv	%i5,	0x0EA8,	%i3
	movcs	%xcc,	%o2,	%l2
	edge8n	%g5,	%g7,	%l6
	fsrc2	%f12,	%f16
	sdivx	%g4,	0x11DE,	%i6
	mova	%xcc,	%l0,	%i0
	movpos	%xcc,	%l5,	%i2
	fornot1	%f8,	%f8,	%f20
	edge32	%l4,	%o5,	%o7
	orcc	%g6,	%g2,	%i1
	edge16ln	%o1,	%o0,	%l1
	edge32n	%g3,	%o3,	%i4
	pdist	%f0,	%f20,	%f28
	orncc	%i7,	%o4,	%g1
	udivx	%o6,	0x17FA,	%l3
	fmovdpos	%xcc,	%f18,	%f15
	mulx	%i3,	%i5,	%l2
	fmovsg	%xcc,	%f1,	%f16
	addcc	%g5,	%g7,	%o2
	movneg	%icc,	%g4,	%l6
	alignaddr	%l0,	%i6,	%i0
	movrgz	%i2,	%l5,	%o5
	movcs	%xcc,	%o7,	%l4
	subcc	%g6,	%i1,	%g2
	xnor	%o0,	0x1058,	%o1
	addc	%g3,	0x0D8E,	%l1
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	fmovrdlez	%o4,	%f26,	%f20
	fmovrsgez	%i7,	%f27,	%f8
	std	%f14,	[%l7 + 0x78]
	array16	%g1,	%o6,	%i3
	fmovsleu	%xcc,	%f0,	%f28
	fmovrsgez	%l3,	%f18,	%f24
	ldd	[%l7 + 0x68],	%i4
	fcmpeq32	%f26,	%f22,	%g5
	fpsub32s	%f26,	%f12,	%f4
	ldx	[%l7 + 0x38],	%l2
	ld	[%l7 + 0x58],	%f18
	umulcc	%g7,	%g4,	%l6
	sth	%o2,	[%l7 + 0x18]
	fmovse	%icc,	%f5,	%f13
	sth	%l0,	[%l7 + 0x3A]
	xnor	%i6,	%i0,	%l5
	stw	%i2,	[%l7 + 0x4C]
	ldsb	[%l7 + 0x39],	%o5
	addcc	%o7,	0x10CB,	%g6
	popc	0x1C2D,	%l4
	addc	%i1,	%o0,	%g2
	xnorcc	%g3,	%o1,	%l1
	restore %i4, %o3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f6,	%f18
	smulcc	%g1,	0x1A5B,	%i7
	sra	%i3,	%o6,	%l3
	movvs	%icc,	%g5,	%l2
	edge16n	%i5,	%g7,	%l6
	fmovsne	%icc,	%f0,	%f1
	sdiv	%g4,	0x0168,	%l0
	fmovrslz	%o2,	%f9,	%f22
	orn	%i0,	%i6,	%l5
	sll	%o5,	%o7,	%g6
	movvs	%xcc,	%i2,	%l4
	movn	%xcc,	%o0,	%g2
	edge16ln	%i1,	%o1,	%g3
	smul	%l1,	%i4,	%o3
	sth	%o4,	[%l7 + 0x3E]
	fnegd	%f24,	%f2
	sethi	0x01CC,	%i7
	fabsd	%f26,	%f8
	xorcc	%i3,	%g1,	%l3
	movrlez	%g5,	%l2,	%i5
	smul	%g7,	%l6,	%g4
	sdivx	%l0,	0x192D,	%o2
	mulx	%o6,	%i0,	%i6
	fandnot2s	%f17,	%f25,	%f0
	edge16n	%l5,	%o7,	%g6
	move	%icc,	%i2,	%l4
	edge16ln	%o0,	%o5,	%g2
	xorcc	%o1,	%i1,	%g3
	mova	%xcc,	%i4,	%l1
	sir	0x0066
	sdiv	%o4,	0x1D16,	%o3
	udiv	%i7,	0x07A4,	%g1
	movg	%icc,	%i3,	%g5
	ldsw	[%l7 + 0x20],	%l2
	subccc	%l3,	%i5,	%g7
	mulx	%l6,	%l0,	%o2
	movneg	%icc,	%g4,	%o6
	fornot1s	%f19,	%f29,	%f15
	orcc	%i6,	%i0,	%o7
	fexpand	%f28,	%f28
	sdivcc	%l5,	0x196F,	%i2
	std	%f20,	[%l7 + 0x50]
	edge32n	%g6,	%o0,	%l4
	fmovrdgz	%g2,	%f16,	%f6
	movl	%icc,	%o1,	%i1
	ld	[%l7 + 0x74],	%f25
	movge	%xcc,	%o5,	%i4
	edge32	%g3,	%l1,	%o4
	std	%f30,	[%l7 + 0x38]
	move	%xcc,	%i7,	%o3
	umulcc	%i3,	%g1,	%g5
	ldd	[%l7 + 0x08],	%f26
	subccc	%l3,	0x1C10,	%l2
	movleu	%xcc,	%i5,	%l6
	alignaddr	%l0,	%o2,	%g4
	fcmpd	%fcc0,	%f22,	%f14
	or	%o6,	%g7,	%i6
	fmovdpos	%icc,	%f1,	%f6
	ldub	[%l7 + 0x55],	%o7
	edge16l	%i0,	%i2,	%g6
	edge16ln	%o0,	%l4,	%g2
	sethi	0x1666,	%l5
	fmovrslz	%i1,	%f24,	%f6
	edge8	%o5,	%i4,	%g3
	movrgez	%o1,	0x3A0,	%l1
	ldd	[%l7 + 0x58],	%f4
	array32	%i7,	%o3,	%o4
	std	%f6,	[%l7 + 0x58]
	smul	%g1,	0x1B05,	%i3
	fmovdgu	%icc,	%f17,	%f25
	st	%f17,	[%l7 + 0x3C]
	fmovdn	%icc,	%f10,	%f25
	save %g5, %l2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%l3,	0x0DC,	%l6
	movg	%icc,	%o2,	%g4
	addcc	%o6,	0x0CA5,	%g7
	umulcc	%i6,	%o7,	%l0
	popc	0x10C9,	%i0
	ldsh	[%l7 + 0x76],	%i2
	save %o0, 0x0E97, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%xcc,	%f30,	%f3
	movne	%xcc,	%g2,	%l5
	fpsub32	%f16,	%f10,	%f22
	fmul8sux16	%f18,	%f6,	%f30
	movgu	%xcc,	%i1,	%o5
	fpmerge	%f27,	%f24,	%f4
	addc	%i4,	%l4,	%o1
	subc	%g3,	%i7,	%l1
	movl	%icc,	%o3,	%o4
	udivx	%g1,	0x0029,	%i3
	fmovscs	%icc,	%f25,	%f13
	movleu	%xcc,	%l2,	%i5
	sdivcc	%l3,	0x0EE0,	%g5
	edge32n	%o2,	%l6,	%g4
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	fcmped	%fcc0,	%f28,	%f16
	orcc	%l0,	0x051A,	%i0
	fmovsne	%icc,	%f23,	%f4
	fnot2	%f10,	%f6
	fxor	%f10,	%f26,	%f20
	umulcc	%o7,	%i2,	%o0
	alignaddr	%g2,	%g6,	%i1
	andn	%l5,	%o5,	%i4
	udivx	%l4,	0x05B9,	%g3
	fmovdge	%icc,	%f6,	%f22
	andcc	%o1,	%l1,	%i7
	ldd	[%l7 + 0x28],	%o2
	orncc	%o4,	%i3,	%l2
	edge16l	%i5,	%g1,	%g5
	stb	%l3,	[%l7 + 0x73]
	andcc	%o2,	%l6,	%g7
	fmovdpos	%xcc,	%f22,	%f10
	sra	%g4,	0x11,	%i6
	movleu	%xcc,	%o6,	%l0
	subcc	%i0,	%i2,	%o0
	andn	%g2,	0x04CA,	%g6
	sethi	0x1F24,	%i1
	edge8ln	%o7,	%l5,	%i4
	fmovrdgez	%o5,	%f6,	%f10
	ldsw	[%l7 + 0x34],	%l4
	array32	%o1,	%g3,	%i7
	fmul8sux16	%f4,	%f6,	%f26
	orcc	%l1,	0x1030,	%o4
	sub	%o3,	0x1E87,	%l2
	st	%f20,	[%l7 + 0x50]
	movgu	%xcc,	%i3,	%i5
	lduh	[%l7 + 0x34],	%g5
	stx	%l3,	[%l7 + 0x18]
	subc	%o2,	0x1A74,	%g1
	fcmple32	%f8,	%f18,	%l6
	subc	%g7,	0x1AAB,	%g4
	mova	%xcc,	%o6,	%l0
	sdiv	%i6,	0x08DC,	%i2
	alignaddr	%i0,	%g2,	%o0
	std	%f2,	[%l7 + 0x30]
	and	%i1,	%o7,	%l5
	udivcc	%i4,	0x1A25,	%g6
	addc	%o5,	%l4,	%g3
	and	%i7,	0x14AC,	%l1
	orncc	%o4,	%o3,	%o1
	array16	%i3,	%l2,	%i5
	udiv	%g5,	0x1054,	%l3
	lduw	[%l7 + 0x60],	%g1
	movre	%l6,	0x318,	%g7
	fpack16	%f26,	%f19
	umulcc	%g4,	%o6,	%o2
	srax	%i6,	0x0A,	%l0
	umul	%i0,	0x129D,	%g2
	ldsh	[%l7 + 0x0E],	%i2
	edge32	%i1,	%o0,	%o7
	std	%f26,	[%l7 + 0x68]
	movvc	%xcc,	%l5,	%g6
	movcc	%xcc,	%o5,	%l4
	udiv	%i4,	0x1B78,	%g3
	fmovdneg	%icc,	%f5,	%f6
	fmovdvc	%xcc,	%f5,	%f3
	xor	%i7,	%o4,	%l1
	move	%xcc,	%o3,	%o1
	udivcc	%i3,	0x11F7,	%l2
	movrlz	%g5,	%l3,	%i5
	ldsb	[%l7 + 0x65],	%l6
	nop
	set	0x72, %i1
	ldsh	[%l7 + %i1],	%g7
	fpsub32	%f20,	%f6,	%f30
	mulscc	%g1,	0x0CB9,	%g4
	sdiv	%o2,	0x0FD3,	%o6
	std	%f8,	[%l7 + 0x18]
	array8	%i6,	%l0,	%g2
	for	%f24,	%f22,	%f12
	movgu	%icc,	%i0,	%i2
	addcc	%o0,	%i1,	%o7
	addcc	%l5,	0x049A,	%o5
	udivcc	%l4,	0x15B9,	%g6
	fors	%f14,	%f18,	%f25
	pdist	%f4,	%f24,	%f14
	movge	%icc,	%g3,	%i4
	st	%f3,	[%l7 + 0x08]
	array8	%i7,	%l1,	%o3
	sir	0x04F3
	udivx	%o4,	0x0AAF,	%o1
	edge32ln	%i3,	%g5,	%l3
	std	%f12,	[%l7 + 0x18]
	movrlez	%i5,	%l2,	%l6
	sdiv	%g7,	0x0E76,	%g1
	orncc	%g4,	0x130E,	%o2
	fcmps	%fcc1,	%f27,	%f8
	fornot2s	%f12,	%f20,	%f2
	movrgez	%i6,	%l0,	%g2
	addccc	%o6,	0x007B,	%i0
	fmovd	%f2,	%f18
	movrlez	%i2,	%o0,	%i1
	sdivcc	%l5,	0x02D6,	%o5
	fnands	%f27,	%f20,	%f24
	faligndata	%f28,	%f26,	%f12
	udivx	%o7,	0x0DFE,	%g6
	movvs	%icc,	%g3,	%i4
	movge	%xcc,	%l4,	%l1
	std	%f10,	[%l7 + 0x28]
	stx	%o3,	[%l7 + 0x10]
	for	%f20,	%f26,	%f20
	fsrc1s	%f10,	%f17
	fpsub32	%f4,	%f26,	%f30
	udivx	%o4,	0x0138,	%i7
	udivx	%o1,	0x1702,	%g5
	xor	%i3,	%l3,	%i5
	movn	%icc,	%l2,	%g7
	ldd	[%l7 + 0x58],	%g0
	fnand	%f26,	%f20,	%f4
	ld	[%l7 + 0x2C],	%f13
	move	%xcc,	%l6,	%g4
	orncc	%o2,	0x1827,	%l0
	edge8	%g2,	%o6,	%i6
	andncc	%i2,	%i0,	%o0
	stw	%l5,	[%l7 + 0x18]
	fand	%f10,	%f16,	%f4
	edge16	%o5,	%i1,	%g6
	mova	%xcc,	%o7,	%g3
	udivcc	%l4,	0x09F0,	%i4
	sdivx	%o3,	0x1351,	%l1
	udivx	%i7,	0x1A17,	%o1
	fxnors	%f17,	%f3,	%f24
	fcmped	%fcc2,	%f26,	%f10
	sdivcc	%g5,	0x0163,	%o4
	movl	%xcc,	%i3,	%l3
	faligndata	%f28,	%f14,	%f18
	smul	%l2,	0x147D,	%g7
	ldub	[%l7 + 0x51],	%g1
	fmovsge	%icc,	%f31,	%f21
	fcmped	%fcc0,	%f28,	%f8
	ld	[%l7 + 0x50],	%f14
	edge8	%i5,	%g4,	%l6
	fmovsa	%xcc,	%f24,	%f2
	sdivcc	%o2,	0x1A94,	%g2
	std	%f12,	[%l7 + 0x10]
	edge16ln	%l0,	%o6,	%i2
	addc	%i0,	%o0,	%i6
	movre	%o5,	%i1,	%l5
	sdivcc	%g6,	0x02A6,	%g3
	udiv	%o7,	0x19F4,	%l4
	sdiv	%i4,	0x1E0E,	%o3
	sethi	0x1714,	%i7
	smulcc	%o1,	0x18E2,	%g5
	andcc	%o4,	%i3,	%l1
	movrlez	%l3,	%g7,	%l2
	fpackfix	%f14,	%f15
	movl	%xcc,	%i5,	%g1
	sdiv	%g4,	0x114A,	%l6
	edge32l	%o2,	%g2,	%o6
	sra	%l0,	%i2,	%i0
	sll	%o0,	%i6,	%o5
	st	%f1,	[%l7 + 0x20]
	umul	%i1,	%l5,	%g6
	popc	%g3,	%l4
	ldd	[%l7 + 0x50],	%o6
	mulscc	%o3,	0x04AA,	%i4
	fmovscs	%icc,	%f11,	%f26
	umul	%o1,	%i7,	%g5
	edge32	%o4,	%i3,	%l3
	fmovrslez	%g7,	%f24,	%f12
	udivx	%l2,	0x165D,	%l1
	fcmple32	%f26,	%f18,	%i5
	edge8l	%g4,	%g1,	%o2
	mulscc	%g2,	0x175B,	%o6
	sth	%l0,	[%l7 + 0x14]
	fmovsa	%xcc,	%f22,	%f26
	xor	%l6,	%i2,	%i0
	orncc	%i6,	0x19D7,	%o0
	smul	%i1,	%o5,	%l5
	fmovdcc	%xcc,	%f8,	%f2
	movrlez	%g6,	0x282,	%g3
	srl	%l4,	%o3,	%i4
	andcc	%o1,	%i7,	%g5
	fmovrdgez	%o7,	%f12,	%f24
	or	%i3,	%l3,	%g7
	udivx	%o4,	0x1C90,	%l2
	ldsh	[%l7 + 0x36],	%i5
	movn	%xcc,	%g4,	%g1
	ldub	[%l7 + 0x41],	%l1
	edge8l	%g2,	%o6,	%l0
	restore %l6, %o2, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i6,	%i0,	%o0
	addcc	%i1,	%o5,	%g6
	orcc	%g3,	%l5,	%l4
	subccc	%o3,	0x1F31,	%i4
	srax	%i7,	0x14,	%g5
	sllx	%o7,	0x1B,	%o1
	edge32n	%l3,	%g7,	%o4
	sllx	%i3,	0x10,	%i5
	stw	%l2,	[%l7 + 0x28]
	and	%g4,	%l1,	%g1
	fmovdg	%xcc,	%f7,	%f4
	orncc	%g2,	%o6,	%l0
	movneg	%xcc,	%o2,	%i2
	fmovsn	%xcc,	%f27,	%f30
	andncc	%i6,	%i0,	%o0
	xorcc	%i1,	%l6,	%g6
	alignaddrl	%o5,	%g3,	%l4
	edge32ln	%o3,	%i4,	%i7
	sdivcc	%l5,	0x03FA,	%o7
	ldsh	[%l7 + 0x3E],	%g5
	and	%o1,	0x1142,	%g7
	ldd	[%l7 + 0x28],	%o4
	edge8	%i3,	%i5,	%l3
	movg	%xcc,	%g4,	%l1
	edge8l	%l2,	%g2,	%o6
	fsrc1s	%f1,	%f9
	edge16	%g1,	%o2,	%l0
	std	%f18,	[%l7 + 0x78]
	orn	%i6,	%i2,	%o0
	sra	%i1,	%l6,	%i0
	addcc	%g6,	%g3,	%l4
	srl	%o5,	0x1B,	%o3
	sdiv	%i7,	0x0AA8,	%i4
	xor	%l5,	%g5,	%o7
	fcmpes	%fcc1,	%f11,	%f0
	umul	%g7,	0x1389,	%o1
	fpack32	%f18,	%f30,	%f6
	fornot2s	%f1,	%f20,	%f3
	sdivcc	%i3,	0x1ABF,	%o4
	andcc	%l3,	%i5,	%l1
	fmovdle	%icc,	%f17,	%f1
	sdivcc	%g4,	0x19CA,	%l2
	fpsub32s	%f7,	%f5,	%f29
	stw	%o6,	[%l7 + 0x08]
	or	%g2,	%g1,	%o2
	add	%i6,	%l0,	%i2
	ld	[%l7 + 0x40],	%f10
	fandnot1	%f4,	%f22,	%f30
	subcc	%i1,	%l6,	%i0
	faligndata	%f6,	%f14,	%f14
	fornot2	%f12,	%f6,	%f30
	udivx	%o0,	0x1535,	%g3
	udivx	%l4,	0x1201,	%o5
	orn	%o3,	0x18F4,	%g6
	orcc	%i4,	0x1DEB,	%l5
	movcc	%icc,	%i7,	%g5
	edge32ln	%g7,	%o7,	%i3
	udiv	%o1,	0x0DBD,	%l3
	movge	%icc,	%i5,	%l1
	sdiv	%g4,	0x0E7C,	%o4
	fmovd	%f4,	%f20
	andcc	%o6,	%l2,	%g2
	movrne	%g1,	0x234,	%i6
	fmovrdgez	%l0,	%f12,	%f0
	smulcc	%i2,	%i1,	%l6
	edge8l	%o2,	%o0,	%g3
	movrgez	%l4,	%o5,	%o3
	movcc	%icc,	%i0,	%g6
	popc	%l5,	%i7
	movneg	%icc,	%g5,	%g7
	orcc	%i4,	0x1B2E,	%o7
	srax	%i3,	0x04,	%l3
	lduw	[%l7 + 0x10],	%o1
	save %i5, %l1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x74],	%o6
	edge8n	%o4,	%g2,	%g1
	movrlez	%l2,	0x2BA,	%l0
	srlx	%i6,	0x18,	%i1
	movvs	%icc,	%l6,	%i2
	std	%f28,	[%l7 + 0x28]
	fcmped	%fcc0,	%f26,	%f18
	fmovsgu	%xcc,	%f5,	%f29
	sdivx	%o0,	0x11A4,	%o2
	edge8n	%g3,	%o5,	%l4
	edge16n	%o3,	%g6,	%l5
	movrgz	%i0,	0x35D,	%g5
	andncc	%g7,	%i4,	%i7
	xnorcc	%o7,	0x1730,	%l3
	edge32n	%o1,	%i3,	%i5
	array16	%l1,	%g4,	%o4
	sllx	%g2,	%o6,	%l2
	alignaddr	%g1,	%l0,	%i6
	faligndata	%f18,	%f10,	%f4
	lduw	[%l7 + 0x54],	%i1
	andcc	%i2,	%l6,	%o0
	add	%o2,	0x1763,	%o5
	srlx	%g3,	0x16,	%o3
	edge16ln	%g6,	%l4,	%l5
	move	%icc,	%g5,	%i0
	ldsb	[%l7 + 0x4E],	%g7
	addcc	%i4,	%i7,	%o7
	fcmps	%fcc3,	%f14,	%f26
	fmovdl	%xcc,	%f26,	%f7
	movrgez	%o1,	%i3,	%i5
	mova	%xcc,	%l3,	%g4
	movneg	%icc,	%l1,	%g2
	srl	%o4,	0x01,	%l2
	fmovdcs	%xcc,	%f28,	%f20
	movre	%o6,	%g1,	%i6
	stb	%i1,	[%l7 + 0x79]
	xnorcc	%i2,	%l6,	%o0
	andn	%o2,	%o5,	%g3
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%o2
	lduh	[%l7 + 0x62],	%l0
	st	%f19,	[%l7 + 0x1C]
	fmovspos	%icc,	%f28,	%f31
	move	%icc,	%l4,	%l5
	subccc	%g5,	%i0,	%g6
	movg	%xcc,	%i4,	%i7
	smul	%o7,	%o1,	%i3
	movl	%xcc,	%i5,	%g7
	orcc	%g4,	%l1,	%l3
	sth	%o4,	[%l7 + 0x22]
	movcs	%icc,	%g2,	%l2
	save %o6, 0x03C3, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f14,	%f16
	fmovdcs	%xcc,	%f8,	%f30
	popc	0x03AB,	%i6
	edge8l	%i1,	%l6,	%o0
	edge32n	%o2,	%o5,	%g3
	sub	%o3,	0x1535,	%l0
	movre	%l4,	%l5,	%i2
	mova	%xcc,	%g5,	%g6
	edge8n	%i0,	%i4,	%o7
	or	%i7,	0x114A,	%o1
	smulcc	%i5,	0x1655,	%i3
	fmovrdlz	%g4,	%f16,	%f4
	movrgz	%l1,	%l3,	%g7
	fmovsleu	%xcc,	%f20,	%f30
	array16	%o4,	%l2,	%g2
	fnands	%f27,	%f14,	%f12
	subc	%o6,	%g1,	%i6
	andn	%l6,	%i1,	%o2
	sir	0x0F0C
	sll	%o5,	0x03,	%g3
	fmovd	%f28,	%f30
	srlx	%o0,	%o3,	%l0
	udivx	%l4,	0x0205,	%i2
	udivx	%l5,	0x12C0,	%g6
	movre	%i0,	%g5,	%i4
	edge8l	%i7,	%o7,	%i5
	edge8l	%i3,	%g4,	%l1
	subc	%l3,	0x014A,	%g7
	save %o1, 0x0922, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l2,	%g2
	movpos	%xcc,	%g1,	%i6
	fpsub16s	%f3,	%f5,	%f25
	ldsw	[%l7 + 0x68],	%l6
	fpsub16	%f8,	%f4,	%f10
	udivcc	%i1,	0x0A2D,	%o6
	sdiv	%o5,	0x1506,	%o2
	movne	%icc,	%g3,	%o0
	array32	%o3,	%l4,	%l0
	xorcc	%i2,	%g6,	%l5
	orcc	%i0,	%i4,	%i7
	movrlez	%g5,	%i5,	%o7
	andn	%g4,	0x1069,	%i3
	movre	%l1,	%l3,	%o1
	edge32	%o4,	%g7,	%g2
	mova	%icc,	%l2,	%g1
	fandnot1s	%f20,	%f31,	%f12
	movvs	%xcc,	%l6,	%i6
	subccc	%i1,	%o5,	%o6
	movg	%xcc,	%o2,	%g3
	movrne	%o3,	%l4,	%l0
	smul	%i2,	%g6,	%o0
	fpack32	%f20,	%f14,	%f16
	or	%i0,	%i4,	%l5
	sth	%i7,	[%l7 + 0x08]
	fnot1s	%f25,	%f4
	alignaddrl	%i5,	%o7,	%g5
	xnorcc	%g4,	%l1,	%i3
	subccc	%l3,	0x03E8,	%o4
	fmovrsgez	%g7,	%f24,	%f29
	ldd	[%l7 + 0x40],	%g2
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	movrgz	%l6,	%o1,	%i1
	fmovsle	%icc,	%f9,	%f1
	sir	0x0687
	st	%f26,	[%l7 + 0x38]
	movn	%icc,	%i6,	%o6
	addccc	%o5,	0x1106,	%g3
	movn	%icc,	%o3,	%l4
	ld	[%l7 + 0x68],	%f2
	andncc	%l0,	%o2,	%g6
	movvc	%xcc,	%i2,	%o0
	alignaddrl	%i0,	%l5,	%i7
	std	%f12,	[%l7 + 0x50]
	movvc	%xcc,	%i5,	%i4
	add	%o7,	0x1C3F,	%g4
	movrlez	%g5,	0x242,	%i3
	movge	%icc,	%l3,	%o4
	movcs	%icc,	%g7,	%l1
	andncc	%l2,	%g2,	%g1
	sth	%o1,	[%l7 + 0x6E]
	fnot1s	%f11,	%f20
	fpsub16s	%f3,	%f5,	%f20
	fmovrde	%l6,	%f6,	%f2
	sub	%i1,	%i6,	%o6
	addc	%g3,	%o3,	%l4
	srl	%l0,	%o2,	%g6
	movgu	%xcc,	%o5,	%o0
	lduw	[%l7 + 0x28],	%i2
	movneg	%xcc,	%l5,	%i0
	sra	%i5,	%i4,	%i7
	srl	%o7,	%g5,	%g4
	ldsb	[%l7 + 0x2C],	%i3
	orncc	%o4,	%l3,	%g7
	xnor	%l1,	%l2,	%g1
	faligndata	%f8,	%f26,	%f30
	popc	%o1,	%g2
	save %l6, %i1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g3,	%i6,	%l4
	subc	%l0,	%o3,	%o2
	fxnor	%f12,	%f30,	%f2
	lduh	[%l7 + 0x7A],	%o5
	xor	%o0,	%g6,	%l5
	umul	%i2,	%i5,	%i0
	array32	%i4,	%i7,	%g5
	fmovs	%f13,	%f17
	movge	%icc,	%g4,	%o7
	edge8ln	%i3,	%o4,	%g7
	andn	%l3,	%l1,	%g1
	fcmpd	%fcc1,	%f28,	%f24
	andcc	%o1,	%l2,	%g2
	edge32ln	%i1,	%l6,	%g3
	movrne	%i6,	0x112,	%l4
	nop
	set	0x3C, %g6
	lduh	[%l7 + %g6],	%l0
	movgu	%icc,	%o3,	%o6
	lduh	[%l7 + 0x6A],	%o2
	edge8	%o5,	%g6,	%o0
	fones	%f10
	andncc	%l5,	%i5,	%i0
	subcc	%i2,	%i7,	%i4
	fmovdl	%xcc,	%f9,	%f7
	srl	%g5,	%g4,	%i3
	andncc	%o7,	%g7,	%o4
	andcc	%l1,	%g1,	%o1
	sethi	0x0CFE,	%l2
	and	%l3,	0x1215,	%g2
	fmovdle	%icc,	%f8,	%f4
	fpackfix	%f24,	%f18
	save %i1, %g3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i6,	%l4,	%o3
	movrgz	%o6,	%l0,	%o5
	orncc	%g6,	0x1365,	%o0
	movge	%xcc,	%l5,	%o2
	fmovsvc	%xcc,	%f26,	%f9
	movvc	%xcc,	%i5,	%i2
	xor	%i0,	%i7,	%i4
	fpack16	%f10,	%f17
	sir	0x1795
	andcc	%g4,	%i3,	%g5
	fmovs	%f13,	%f22
	sdivcc	%o7,	0x1120,	%g7
	stx	%o4,	[%l7 + 0x60]
	subccc	%g1,	0x092E,	%o1
	mulx	%l1,	0x182F,	%l2
	subccc	%g2,	%l3,	%i1
	fsrc2	%f20,	%f6
	fmovsleu	%xcc,	%f22,	%f20
	restore %g3, %i6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f28,	%f8,	%f2
	fmovdle	%icc,	%f24,	%f28
	alignaddrl	%l4,	%o6,	%l0
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	array16	%o0,	%l5,	%o2
	andcc	%i5,	%i2,	%i0
	fmovdgu	%icc,	%f29,	%f7
	fmovsl	%icc,	%f23,	%f22
	sth	%o3,	[%l7 + 0x28]
	movneg	%icc,	%i7,	%i4
	stb	%g4,	[%l7 + 0x1B]
	orn	%g5,	%i3,	%g7
	movneg	%xcc,	%o7,	%o4
	add	%g1,	0x190A,	%l1
	ldsh	[%l7 + 0x0E],	%o1
	ld	[%l7 + 0x60],	%f16
	xnorcc	%l2,	0x08CC,	%g2
	array8	%i1,	%g3,	%l3
	udivcc	%l6,	0x15CC,	%i6
	udiv	%l4,	0x079A,	%l0
	subc	%o6,	0x033C,	%g6
	lduw	[%l7 + 0x34],	%o5
	fmovsne	%xcc,	%f24,	%f15
	addc	%l5,	%o0,	%o2
	addc	%i2,	%i0,	%i5
	fmovsn	%icc,	%f13,	%f10
	xnorcc	%o3,	%i7,	%i4
	xnorcc	%g5,	0x1E43,	%g4
	movrne	%i3,	0x3F9,	%o7
	edge8l	%g7,	%g1,	%l1
	movrlz	%o1,	%l2,	%g2
	mulscc	%i1,	%o4,	%l3
	edge8	%g3,	%i6,	%l4
	array8	%l0,	%o6,	%g6
	srl	%o5,	%l6,	%o0
	movrne	%o2,	0x3F0,	%l5
	ldsh	[%l7 + 0x16],	%i2
	xor	%i5,	0x131A,	%o3
	smulcc	%i7,	0x055E,	%i4
	fpmerge	%f15,	%f16,	%f10
	edge8n	%i0,	%g4,	%i3
	edge16n	%g5,	%g7,	%o7
	array8	%l1,	%o1,	%l2
	udiv	%g2,	0x198E,	%g1
	sdiv	%o4,	0x1776,	%l3
	fmul8x16	%f20,	%f2,	%f22
	stw	%g3,	[%l7 + 0x20]
	fxors	%f19,	%f0,	%f1
	sdivcc	%i1,	0x1198,	%l4
	addcc	%i6,	%o6,	%g6
	stx	%o5,	[%l7 + 0x28]
	movneg	%icc,	%l6,	%l0
	fmovdne	%icc,	%f21,	%f8
	andncc	%o2,	%o0,	%l5
	edge16l	%i5,	%o3,	%i2
	fmul8ulx16	%f8,	%f30,	%f24
	and	%i4,	0x0E89,	%i7
	xor	%i0,	%i3,	%g4
	sllx	%g5,	%o7,	%l1
	edge16	%g7,	%o1,	%g2
	movne	%xcc,	%l2,	%g1
	array16	%o4,	%l3,	%i1
	ldd	[%l7 + 0x78],	%g2
	mulscc	%l4,	0x17D9,	%o6
	alignaddr	%g6,	%i6,	%l6
	movge	%xcc,	%o5,	%o2
	mulscc	%o0,	0x1466,	%l5
	srl	%i5,	0x07,	%o3
	edge16n	%l0,	%i4,	%i2
	sdiv	%i0,	0x021D,	%i3
	movrgez	%g4,	0x386,	%i7
	andn	%g5,	%l1,	%o7
	sdivcc	%o1,	0x02DB,	%g2
	sdivx	%l2,	0x11C9,	%g7
	edge32l	%o4,	%l3,	%i1
	udiv	%g3,	0x18C6,	%g1
	ldd	[%l7 + 0x60],	%f20
	edge8l	%o6,	%l4,	%g6
	array8	%l6,	%i6,	%o2
	sra	%o0,	0x00,	%l5
	ldd	[%l7 + 0x58],	%o4
	edge8ln	%o3,	%l0,	%i4
	fabsd	%f10,	%f28
	fpsub32s	%f2,	%f19,	%f26
	alignaddr	%i5,	%i2,	%i0
	and	%i3,	%i7,	%g4
	fmovdvs	%icc,	%f24,	%f3
	restore %l1, 0x0830, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f24,	%f14,	%o1
	movleu	%xcc,	%g2,	%o7
	nop
	set	0x6B, %i5
	ldsb	[%l7 + %i5],	%g7
	stw	%l2,	[%l7 + 0x28]
	movl	%xcc,	%o4,	%l3
	edge16ln	%g3,	%i1,	%o6
	mulscc	%g1,	0x1969,	%l4
	movrlez	%l6,	%i6,	%g6
	nop
	set	0x68, %g4
	std	%f10,	[%l7 + %g4]
	ldd	[%l7 + 0x18],	%f24
	sra	%o2,	%l5,	%o0
	movrne	%o3,	0x3F5,	%l0
	movrgz	%o5,	%i4,	%i2
	fsrc2s	%f25,	%f1
	smulcc	%i0,	0x0A84,	%i5
	ldd	[%l7 + 0x68],	%f20
	sll	%i7,	0x1F,	%g4
	fpadd16	%f26,	%f0,	%f14
	edge8n	%l1,	%g5,	%i3
	movge	%xcc,	%o1,	%g2
	stx	%o7,	[%l7 + 0x60]
	ldsb	[%l7 + 0x62],	%g7
	stx	%l2,	[%l7 + 0x68]
	fnegs	%f13,	%f10
	fmul8x16	%f3,	%f6,	%f26
	fcmpne32	%f14,	%f20,	%l3
	fmovdl	%xcc,	%f2,	%f6
	mova	%xcc,	%g3,	%o4
	subccc	%o6,	0x149E,	%g1
	movrgez	%l4,	0x09F,	%i1
	addc	%l6,	0x0B4B,	%i6
	bshuffle	%f24,	%f0,	%f8
	xnor	%g6,	%o2,	%l5
	andn	%o3,	0x1CE7,	%o0
	srlx	%l0,	%i4,	%o5
	fnegs	%f10,	%f31
	movrlez	%i2,	%i5,	%i7
	sdivx	%i0,	0x1869,	%l1
	orncc	%g5,	0x0234,	%i3
	stw	%o1,	[%l7 + 0x3C]
	fmovdg	%icc,	%f19,	%f18
	movl	%xcc,	%g2,	%g4
	fmovdge	%icc,	%f9,	%f24
	array32	%g7,	%l2,	%o7
	fnegd	%f16,	%f2
	ldsh	[%l7 + 0x22],	%l3
	sth	%o4,	[%l7 + 0x52]
	movge	%icc,	%o6,	%g3
	array16	%l4,	%g1,	%i1
	ldub	[%l7 + 0x5B],	%i6
	fcmpes	%fcc2,	%f6,	%f12
	mova	%icc,	%g6,	%o2
	movge	%xcc,	%l5,	%o3
	stx	%o0,	[%l7 + 0x58]
	nop
	set	0x2A, %g1
	sth	%l0,	[%l7 + %g1]
	fmovse	%xcc,	%f8,	%f8
	stb	%l6,	[%l7 + 0x79]
	sllx	%i4,	0x02,	%o5
	alignaddr	%i5,	%i2,	%i0
	movcs	%icc,	%i7,	%g5
	fmovsne	%icc,	%f2,	%f17
	movge	%icc,	%l1,	%i3
	ldsw	[%l7 + 0x38],	%g2
	srax	%o1,	0x0E,	%g7
	orncc	%g4,	0x1FCB,	%o7
	udivx	%l3,	0x1C39,	%o4
	edge8l	%o6,	%g3,	%l2
	edge32l	%l4,	%g1,	%i6
	xnor	%i1,	%g6,	%l5
	movne	%icc,	%o2,	%o0
	movne	%xcc,	%o3,	%l6
	fmovsl	%icc,	%f16,	%f24
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%i4
	fmovdle	%icc,	%f30,	%f18
	fmovdn	%xcc,	%f12,	%f17
	xorcc	%o5,	%i5,	%i2
	fnegd	%f12,	%f22
	stb	%i0,	[%l7 + 0x57]
	lduh	[%l7 + 0x08],	%i7
	sra	%g5,	%l0,	%l1
	stw	%i3,	[%l7 + 0x0C]
	ldd	[%l7 + 0x60],	%g2
	fmovdvs	%xcc,	%f12,	%f2
	movre	%o1,	0x213,	%g4
	popc	0x135A,	%g7
	edge16	%o7,	%l3,	%o6
	std	%f20,	[%l7 + 0x20]
	udivcc	%o4,	0x0AB1,	%g3
	xnor	%l2,	0x0AA2,	%g1
	and	%i6,	%i1,	%l4
	fpackfix	%f8,	%f31
	movn	%icc,	%l5,	%g6
	movrlez	%o2,	0x1D7,	%o3
	sub	%l6,	0x1EB7,	%o0
	mulscc	%i4,	0x129E,	%i5
	movg	%icc,	%i2,	%o5
	fcmpeq16	%f2,	%f8,	%i0
	array32	%g5,	%i7,	%l0
	ldub	[%l7 + 0x79],	%l1
	movle	%icc,	%i3,	%g2
	mova	%icc,	%o1,	%g7
	ldd	[%l7 + 0x28],	%g4
	umul	%l3,	%o7,	%o6
	movrgz	%o4,	0x3F3,	%l2
	fand	%f20,	%f16,	%f0
	movcc	%xcc,	%g3,	%i6
	fmovdneg	%xcc,	%f21,	%f16
	edge16n	%g1,	%l4,	%l5
	sll	%i1,	0x1D,	%g6
	fmovd	%f20,	%f22
	andn	%o3,	0x1758,	%l6
	andcc	%o2,	0x0346,	%i4
	stx	%o0,	[%l7 + 0x70]
	alignaddr	%i2,	%i5,	%i0
	fornot1s	%f13,	%f2,	%f21
	ldx	[%l7 + 0x58],	%o5
	movcc	%icc,	%g5,	%l0
	edge16n	%l1,	%i3,	%i7
	movrlz	%o1,	0x3FB,	%g2
	andcc	%g4,	0x1AB7,	%g7
	srax	%l3,	%o7,	%o6
	array32	%l2,	%g3,	%i6
	fcmps	%fcc1,	%f21,	%f7
	ldd	[%l7 + 0x50],	%f8
	edge16n	%o4,	%l4,	%l5
	movvc	%icc,	%g1,	%g6
	fpackfix	%f2,	%f10
	ldd	[%l7 + 0x70],	%f14
	movrgz	%i1,	%o3,	%l6
	fmovsl	%xcc,	%f24,	%f23
	addccc	%i4,	0x0F3A,	%o0
	ldsb	[%l7 + 0x6F],	%i2
	sdivx	%i5,	0x0878,	%i0
	xnorcc	%o2,	0x02C2,	%o5
	smul	%l0,	%l1,	%g5
	std	%f28,	[%l7 + 0x58]
	fmovdl	%xcc,	%f13,	%f30
	alignaddrl	%i3,	%o1,	%i7
	alignaddr	%g4,	%g2,	%g7
	alignaddr	%l3,	%o7,	%o6
	movvs	%xcc,	%g3,	%i6
	stb	%o4,	[%l7 + 0x4C]
	mulx	%l2,	%l5,	%l4
	stw	%g1,	[%l7 + 0x20]
	mulscc	%i1,	%g6,	%l6
	movn	%xcc,	%o3,	%i4
	srax	%o0,	0x02,	%i2
	movrlez	%i0,	0x10D,	%i5
	st	%f12,	[%l7 + 0x70]
	smul	%o2,	%l0,	%o5
	srlx	%g5,	0x15,	%l1
	mulscc	%i3,	0x1ED6,	%o1
	lduh	[%l7 + 0x56],	%i7
	fpack16	%f12,	%f26
	srax	%g4,	0x1A,	%g7
	fzeros	%f6
	movvs	%xcc,	%g2,	%l3
	edge16	%o6,	%o7,	%i6
	movrne	%g3,	%l2,	%o4
	ldsh	[%l7 + 0x5C],	%l4
	movle	%xcc,	%g1,	%l5
	sdivx	%g6,	0x0988,	%l6
	edge32	%i1,	%o3,	%i4
	edge32ln	%i2,	%o0,	%i5
	fmovdvs	%icc,	%f9,	%f12
	smul	%i0,	0x00F4,	%l0
	movge	%icc,	%o5,	%o2
	movpos	%icc,	%g5,	%i3
	subccc	%l1,	0x0D6E,	%i7
	fpmerge	%f20,	%f7,	%f18
	edge8	%o1,	%g7,	%g4
	fandnot2	%f8,	%f10,	%f2
	fpsub16s	%f6,	%f30,	%f5
	movpos	%xcc,	%g2,	%l3
	fcmped	%fcc1,	%f18,	%f28
	mulscc	%o6,	%i6,	%o7
	array16	%l2,	%o4,	%g3
	ldd	[%l7 + 0x48],	%f2
	fmovsg	%xcc,	%f27,	%f1
	udivx	%g1,	0x1EA4,	%l4
	st	%f7,	[%l7 + 0x3C]
	andcc	%g6,	%l5,	%i1
	subcc	%o3,	%i4,	%l6
	sra	%i2,	%i5,	%i0
	xnorcc	%l0,	0x0426,	%o0
	edge8l	%o5,	%g5,	%i3
	ld	[%l7 + 0x68],	%f14
	lduw	[%l7 + 0x7C],	%l1
	movrgez	%o2,	0x1C6,	%i7
	fmovdpos	%icc,	%f24,	%f30
	udivcc	%o1,	0x16D3,	%g7
	xorcc	%g4,	0x0D7B,	%g2
	edge8n	%l3,	%o6,	%i6
	st	%f22,	[%l7 + 0x38]
	edge8l	%l2,	%o7,	%o4
	movrgez	%g3,	%l4,	%g6
	fmovsneg	%xcc,	%f24,	%f7
	edge8n	%l5,	%i1,	%g1
	movneg	%icc,	%o3,	%i4
	ldub	[%l7 + 0x66],	%l6
	ldub	[%l7 + 0x34],	%i5
	fmovsleu	%icc,	%f31,	%f12
	andcc	%i0,	0x0E88,	%i2
	edge8ln	%l0,	%o5,	%g5
	movleu	%xcc,	%o0,	%i3
	movleu	%xcc,	%o2,	%i7
	edge16ln	%l1,	%o1,	%g7
	movpos	%icc,	%g4,	%l3
	ldsh	[%l7 + 0x70],	%o6
	ldsb	[%l7 + 0x47],	%i6
	alignaddrl	%g2,	%o7,	%l2
	udivx	%g3,	0x1A19,	%o4
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	fmovdge	%icc,	%f3,	%f12
	popc	%l4,	%i1
	fcmple32	%f8,	%f20,	%g1
	sdivx	%i4,	0x107A,	%l6
	edge32l	%o3,	%i0,	%i5
	stw	%l0,	[%l7 + 0x14]
	movle	%icc,	%i2,	%o5
	orn	%o0,	%g5,	%o2
	udiv	%i7,	0x07A2,	%i3
	ld	[%l7 + 0x7C],	%f21
	ldub	[%l7 + 0x36],	%l1
	fands	%f31,	%f19,	%f29
	fmovsg	%icc,	%f26,	%f10
	movl	%xcc,	%g7,	%g4
	fmovsl	%icc,	%f1,	%f10
	movrgz	%l3,	0x04B,	%o6
	lduw	[%l7 + 0x24],	%i6
	movrgz	%o1,	0x3C8,	%g2
	movrlz	%o7,	%l2,	%g3
	addcc	%o4,	%l5,	%l4
	andncc	%g6,	%g1,	%i4
	fmovrdlez	%i1,	%f6,	%f24
	fnor	%f2,	%f30,	%f26
	sethi	0x10A0,	%o3
	ldsh	[%l7 + 0x3A],	%l6
	stb	%i0,	[%l7 + 0x78]
	movrgez	%i5,	%l0,	%o5
	fmuld8ulx16	%f3,	%f7,	%f12
	fmovdgu	%xcc,	%f15,	%f18
	fmovrdlez	%o0,	%f28,	%f14
	alignaddr	%i2,	%g5,	%o2
	fxnor	%f16,	%f20,	%f14
	pdist	%f12,	%f26,	%f0
	move	%icc,	%i3,	%i7
	sdivx	%l1,	0x13C2,	%g4
	add	%g7,	%l3,	%i6
	edge32l	%o6,	%o1,	%g2
	fcmpgt32	%f14,	%f14,	%o7
	save %g3, %o4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l4,	%g6,	%l5
	nop
	set	0x44, %l1
	ldsb	[%l7 + %l1],	%g1
	fornot2	%f6,	%f8,	%f28
	alignaddrl	%i4,	%o3,	%i1
	movgu	%icc,	%i0,	%i5
	sdivcc	%l0,	0x14B6,	%o5
	sdiv	%o0,	0x1232,	%i2
	movge	%xcc,	%l6,	%g5
	edge32ln	%o2,	%i7,	%l1
	sir	0x164E
	xnor	%g4,	%g7,	%i3
	smulcc	%l3,	0x0943,	%i6
	lduw	[%l7 + 0x10],	%o6
	fmovrdgez	%g2,	%f20,	%f4
	movre	%o1,	%o7,	%g3
	movg	%icc,	%o4,	%l2
	fpack32	%f14,	%f10,	%f4
	movrgz	%g6,	%l5,	%g1
	st	%f15,	[%l7 + 0x58]
	fmovsvs	%icc,	%f1,	%f11
	fcmpne32	%f12,	%f10,	%l4
	fsrc2	%f0,	%f30
	umulcc	%i4,	%o3,	%i0
	fpsub32s	%f0,	%f20,	%f17
	movle	%icc,	%i1,	%i5
	movneg	%xcc,	%l0,	%o0
	save %i2, %o5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g5,	0x13,	%o2
	subc	%l1,	%g4,	%g7
	ldd	[%l7 + 0x48],	%f4
	subc	%i7,	0x05BD,	%l3
	smul	%i6,	%o6,	%i3
	ld	[%l7 + 0x64],	%f30
	fcmpgt16	%f8,	%f20,	%g2
	addccc	%o1,	0x1DA5,	%o7
	edge32	%o4,	%g3,	%g6
	sdivcc	%l2,	0x1558,	%g1
	edge16	%l5,	%i4,	%l4
	fcmpes	%fcc3,	%f19,	%f17
	array8	%o3,	%i1,	%i0
	movge	%xcc,	%l0,	%o0
	mulscc	%i2,	%i5,	%o5
	fmul8ulx16	%f10,	%f22,	%f0
	umul	%g5,	0x0C43,	%o2
	ldsh	[%l7 + 0x40],	%l1
	sra	%l6,	%g7,	%i7
	array32	%g4,	%i6,	%l3
	fmul8x16	%f17,	%f24,	%f16
	fpsub16s	%f28,	%f17,	%f22
	sdivx	%o6,	0x1DC5,	%i3
	xnorcc	%g2,	%o1,	%o7
	mulx	%g3,	%o4,	%g6
	popc	%g1,	%l5
	fsrc2	%f30,	%f4
	mova	%icc,	%l2,	%i4
	fnegd	%f6,	%f12
	andcc	%o3,	0x1BDA,	%i1
	ldd	[%l7 + 0x60],	%i0
	add	%l0,	%o0,	%l4
	udiv	%i5,	0x165D,	%o5
	popc	%i2,	%o2
	sth	%g5,	[%l7 + 0x44]
	move	%xcc,	%l1,	%l6
	lduw	[%l7 + 0x1C],	%g7
	movrne	%g4,	0x257,	%i6
	nop
	set	0x6D, %g5
	ldub	[%l7 + %g5],	%l3
	umul	%o6,	0x0F6B,	%i7
	edge8ln	%i3,	%g2,	%o7
	srl	%o1,	0x09,	%o4
	fcmpne16	%f18,	%f26,	%g6
	fmovrdne	%g3,	%f22,	%f22
	fmovscc	%icc,	%f21,	%f17
	srlx	%g1,	%l5,	%i4
	xorcc	%o3,	0x0565,	%i1
	fmovsvs	%icc,	%f29,	%f3
	edge8l	%l2,	%l0,	%o0
	andncc	%l4,	%i5,	%o5
	srl	%i0,	0x10,	%i2
	movrne	%o2,	%g5,	%l6
	orncc	%g7,	0x1C21,	%g4
	add	%l1,	0x07AA,	%i6
	udivcc	%o6,	0x017A,	%l3
	or	%i7,	%g2,	%o7
	movrgez	%i3,	%o1,	%g6
	umul	%o4,	0x0769,	%g1
	sllx	%l5,	0x08,	%g3
	movrlz	%i4,	0x37B,	%i1
	movvs	%xcc,	%o3,	%l2
	mulx	%l0,	%o0,	%l4
	fnot1	%f22,	%f10
	orcc	%o5,	0x1A81,	%i0
	edge8n	%i5,	%i2,	%o2
	srl	%g5,	0x1A,	%g7
	udivx	%g4,	0x1058,	%l1
	movrgz	%i6,	0x1B8,	%o6
	fmovrsne	%l3,	%f7,	%f12
	nop
	set	0x57, %o6
	stb	%i7,	[%l7 + %o6]
	movl	%xcc,	%l6,	%g2
	sra	%i3,	0x18,	%o7
	sub	%g6,	%o1,	%g1
	srax	%l5,	%g3,	%i4
	restore %o4, %o3, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i1,	%o0
	movrne	%l4,	%l0,	%o5
	udiv	%i0,	0x1C40,	%i2
	ldx	[%l7 + 0x48],	%i5
	edge8ln	%g5,	%o2,	%g7
	fmovs	%f12,	%f30
	fmuld8ulx16	%f0,	%f1,	%f22
	fcmps	%fcc3,	%f7,	%f16
	edge32	%g4,	%i6,	%l1
	smulcc	%o6,	%l3,	%i7
	movrlz	%g2,	%i3,	%l6
	andncc	%o7,	%g6,	%g1
	or	%o1,	0x1DD4,	%l5
	andncc	%g3,	%i4,	%o3
	sdivcc	%l2,	0x14C0,	%o4
	fmovrslz	%o0,	%f4,	%f21
	movge	%xcc,	%i1,	%l4
	ldx	[%l7 + 0x68],	%l0
	stw	%i0,	[%l7 + 0x2C]
	srax	%i2,	%o5,	%i5
	movne	%xcc,	%g5,	%g7
	edge32l	%g4,	%o2,	%l1
	stb	%o6,	[%l7 + 0x4C]
	umulcc	%l3,	0x042F,	%i6
	fmovrsgez	%i7,	%f23,	%f5
	movrlez	%i3,	%g2,	%o7
	std	%f8,	[%l7 + 0x58]
	andn	%l6,	0x10F2,	%g1
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	movvs	%icc,	%g3,	%o3
	fmovd	%f8,	%f22
	nop
	set	0x6E, %o1
	ldsh	[%l7 + %o1],	%i4
	fmovsneg	%xcc,	%f19,	%f18
	ldd	[%l7 + 0x68],	%f12
	save %o4, 0x0926, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o0,	0x14E7,	%l4
	sllx	%l0,	0x10,	%i0
	mulx	%i1,	0x0480,	%i2
	fpadd32	%f8,	%f4,	%f10
	fcmpeq16	%f30,	%f20,	%i5
	sllx	%g5,	0x0C,	%g7
	move	%icc,	%g4,	%o2
	sdivx	%o5,	0x12E1,	%l1
	sll	%o6,	0x04,	%i6
	save %l3, 0x0BF0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f28,	%f4,	%f8
	fmovdleu	%xcc,	%f23,	%f31
	fmuld8sux16	%f27,	%f24,	%f0
	movge	%xcc,	%g2,	%i3
	fmovdneg	%xcc,	%f14,	%f28
	sdiv	%l6,	0x069E,	%g1
	umulcc	%o7,	0x129C,	%g6
	edge16ln	%o1,	%l5,	%g3
	lduh	[%l7 + 0x1E],	%o3
	andn	%i4,	0x181A,	%l2
	fmovdg	%xcc,	%f27,	%f20
	xnor	%o4,	%o0,	%l0
	orncc	%i0,	0x1160,	%l4
	movg	%icc,	%i1,	%i2
	edge16l	%i5,	%g7,	%g5
	xnorcc	%g4,	%o2,	%o5
	alignaddr	%l1,	%o6,	%l3
	srax	%i7,	%g2,	%i6
	lduh	[%l7 + 0x0E],	%i3
	udivx	%g1,	0x156C,	%l6
	alignaddr	%g6,	%o1,	%l5
	fcmpd	%fcc0,	%f10,	%f12
	fandnot1	%f24,	%f10,	%f2
	lduw	[%l7 + 0x3C],	%o7
	edge32ln	%o3,	%g3,	%l2
	sdivx	%o4,	0x10F5,	%o0
	ldd	[%l7 + 0x68],	%i4
	movcc	%icc,	%l0,	%i0
	and	%l4,	%i1,	%i5
	movrgz	%g7,	0x102,	%g5
	ldx	[%l7 + 0x70],	%g4
	subc	%i2,	%o2,	%l1
	move	%xcc,	%o5,	%l3
	fmovrsgz	%i7,	%f18,	%f15
	fmovrdne	%g2,	%f20,	%f26
	udiv	%i6,	0x181C,	%i3
	fpadd32s	%f0,	%f28,	%f1
	fcmple16	%f8,	%f28,	%g1
	movcs	%icc,	%o6,	%l6
	subc	%g6,	0x0E3C,	%o1
	andcc	%l5,	%o3,	%g3
	movre	%l2,	%o7,	%o4
	fmovdg	%xcc,	%f7,	%f3
	fmovspos	%icc,	%f25,	%f12
	xorcc	%i4,	0x11F9,	%l0
	movgu	%xcc,	%o0,	%l4
	ldsw	[%l7 + 0x50],	%i1
	fpadd16	%f16,	%f28,	%f0
	andn	%i5,	0x0831,	%g7
	or	%i0,	0x09D5,	%g5
	movrgz	%i2,	0x05D,	%o2
	fcmpeq32	%f28,	%f10,	%l1
	sth	%o5,	[%l7 + 0x6A]
	movrgz	%l3,	0x283,	%i7
	movrne	%g4,	%i6,	%i3
	stx	%g2,	[%l7 + 0x20]
	edge16	%g1,	%l6,	%g6
	ldsb	[%l7 + 0x37],	%o1
	and	%l5,	%o3,	%g3
	udivx	%l2,	0x09B0,	%o7
	xor	%o6,	0x1590,	%i4
	subc	%l0,	0x1D75,	%o4
	fzero	%f10
	sllx	%o0,	%i1,	%l4
	lduw	[%l7 + 0x30],	%g7
	movleu	%icc,	%i0,	%g5
	move	%icc,	%i5,	%i2
	sir	0x1D56
	and	%l1,	0x0137,	%o2
	srlx	%l3,	%o5,	%i7
	mova	%xcc,	%g4,	%i3
	array8	%i6,	%g1,	%g2
	movvc	%icc,	%g6,	%l6
	edge16n	%o1,	%o3,	%l5
	movgu	%xcc,	%l2,	%o7
	movneg	%xcc,	%g3,	%i4
	xorcc	%o6,	%o4,	%o0
	for	%f14,	%f16,	%f20
	fmovrde	%l0,	%f16,	%f8
	fmovsvc	%icc,	%f14,	%f5
	fzeros	%f2
	ldsh	[%l7 + 0x7A],	%l4
	movge	%icc,	%i1,	%i0
	fnor	%f26,	%f0,	%f6
	fnot2s	%f16,	%f9
	movge	%xcc,	%g7,	%i5
	andncc	%i2,	%g5,	%o2
	movn	%icc,	%l3,	%o5
	fsrc2	%f28,	%f30
	fpadd32s	%f5,	%f13,	%f28
	movrlz	%l1,	0x354,	%i7
	movcs	%xcc,	%g4,	%i6
	ldx	[%l7 + 0x40],	%i3
	edge32n	%g2,	%g6,	%g1
	sra	%o1,	0x19,	%l6
	array16	%l5,	%l2,	%o3
	fornot2s	%f27,	%f26,	%f10
	sth	%g3,	[%l7 + 0x6A]
	addc	%i4,	%o7,	%o6
	fones	%f26
	array16	%o0,	%l0,	%l4
	edge16	%o4,	%i1,	%i0
	fmovrsgez	%g7,	%f14,	%f11
	movcs	%icc,	%i5,	%i2
	fpadd32	%f4,	%f20,	%f16
	edge8ln	%g5,	%o2,	%l3
	udivcc	%o5,	0x1D79,	%i7
	srlx	%g4,	0x0D,	%i6
	fcmpeq32	%f26,	%f20,	%l1
	addccc	%i3,	%g2,	%g6
	movcc	%icc,	%g1,	%o1
	sdiv	%l5,	0x1ED9,	%l6
	movcc	%icc,	%o3,	%g3
	popc	0x079F,	%i4
	mulscc	%o7,	0x1025,	%o6
	orncc	%l2,	0x0964,	%o0
	addcc	%l0,	%l4,	%o4
	fcmpgt32	%f16,	%f4,	%i0
	fpsub32	%f14,	%f16,	%f22
	fsrc1s	%f8,	%f17
	edge32n	%g7,	%i5,	%i2
	restore %g5, %o2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o5,	%i1,	%i7
	edge16ln	%i6,	%g4,	%l1
	nop
	set	0x29, %l2
	ldub	[%l7 + %l2],	%i3
	alignaddr	%g6,	%g1,	%o1
	edge8ln	%g2,	%l5,	%o3
	ldsh	[%l7 + 0x7C],	%l6
	fmuld8sux16	%f2,	%f5,	%f20
	smul	%g3,	%i4,	%o7
	fnot1	%f20,	%f14
	array32	%o6,	%o0,	%l2
	orn	%l4,	%l0,	%o4
	move	%xcc,	%g7,	%i5
	edge8	%i2,	%i0,	%g5
	fxor	%f12,	%f16,	%f30
	sll	%l3,	0x07,	%o2
	orn	%o5,	%i1,	%i7
	udivcc	%g4,	0x1F07,	%i6
	stb	%l1,	[%l7 + 0x16]
	nop
	set	0x2A, %i3
	sth	%i3,	[%l7 + %i3]
	ldd	[%l7 + 0x28],	%f8
	andcc	%g1,	%g6,	%g2
	fpack32	%f10,	%f2,	%f24
	edge8ln	%l5,	%o1,	%l6
	movne	%icc,	%o3,	%i4
	xor	%o7,	0x18FD,	%o6
	edge8n	%o0,	%g3,	%l4
	sra	%l0,	0x07,	%l2
	stx	%o4,	[%l7 + 0x10]
	ldsb	[%l7 + 0x34],	%i5
	fmovdvs	%xcc,	%f27,	%f3
	edge8l	%i2,	%g7,	%g5
	edge32l	%l3,	%i0,	%o5
	stb	%i1,	[%l7 + 0x2A]
	fmovrdgez	%i7,	%f10,	%f2
	movcc	%xcc,	%g4,	%o2
	fnors	%f4,	%f2,	%f22
	smul	%i6,	0x1F34,	%l1
	fmovdge	%xcc,	%f1,	%f13
	fmovrsgz	%g1,	%f12,	%f5
	movrlz	%g6,	0x224,	%i3
	smulcc	%l5,	%g2,	%l6
	subccc	%o3,	0x0A60,	%o1
	udiv	%i4,	0x1284,	%o7
	alignaddrl	%o6,	%g3,	%o0
	st	%f11,	[%l7 + 0x7C]
	stx	%l0,	[%l7 + 0x68]
	movrlz	%l4,	%o4,	%l2
	xorcc	%i5,	%g7,	%g5
	fmovdneg	%icc,	%f15,	%f5
	subc	%l3,	%i0,	%i2
	srlx	%o5,	0x1E,	%i1
	movrgez	%g4,	%i7,	%i6
	umul	%o2,	0x1648,	%l1
	stb	%g6,	[%l7 + 0x69]
	srl	%i3,	0x0C,	%l5
	fmovdneg	%icc,	%f26,	%f12
	subc	%g2,	%l6,	%g1
	sdiv	%o3,	0x1BC2,	%o1
	fone	%f6
	sdivx	%i4,	0x12D7,	%o6
	sdivx	%g3,	0x0DA1,	%o7
	alignaddr	%l0,	%o0,	%o4
	fcmple32	%f18,	%f0,	%l2
	sethi	0x192C,	%i5
	pdist	%f16,	%f22,	%f18
	andn	%g7,	%l4,	%g5
	fornot2s	%f14,	%f2,	%f19
	udivcc	%l3,	0x0E92,	%i2
	fornot2	%f16,	%f26,	%f30
	and	%i0,	0x0A26,	%o5
	addc	%i1,	0x0929,	%g4
	subcc	%i7,	0x0ABC,	%i6
	subcc	%l1,	%g6,	%o2
	move	%icc,	%l5,	%g2
	fmovsa	%icc,	%f3,	%f0
	movvc	%xcc,	%l6,	%g1
	edge8	%i3,	%o3,	%i4
	ldub	[%l7 + 0x31],	%o6
	sir	0x0BE3
	edge32l	%o1,	%o7,	%l0
	save %g3, %o4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x38],	%i5
	mulx	%g7,	0x1976,	%l4
	fmovdvc	%xcc,	%f19,	%f13
	orncc	%o0,	0x14D2,	%l3
	orn	%g5,	0x027D,	%i0
	movrne	%i2,	0x3B2,	%i1
	alignaddr	%g4,	%i7,	%o5
	fmovdcs	%xcc,	%f23,	%f18
	fmul8sux16	%f28,	%f0,	%f20
	smul	%i6,	0x0D7A,	%g6
	movrgz	%o2,	0x259,	%l5
	movrlez	%l1,	0x06C,	%g2
	move	%xcc,	%l6,	%g1
	fcmpne32	%f4,	%f26,	%i3
	save %o3, %i4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o6,	%o7,	%l0
	fmovsle	%icc,	%f5,	%f7
	fnor	%f28,	%f16,	%f8
	sth	%o4,	[%l7 + 0x3A]
	sll	%g3,	%i5,	%l2
	fcmpne32	%f22,	%f12,	%g7
	fmovdl	%icc,	%f13,	%f8
	addcc	%o0,	%l3,	%l4
	fmovrslz	%g5,	%f5,	%f9
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%i0
	fmovse	%xcc,	%f6,	%f13
	smul	%i1,	0x136C,	%g4
	fmovdgu	%xcc,	%f10,	%f5
	xnor	%i7,	%o5,	%i6
	stw	%i2,	[%l7 + 0x7C]
	fsrc2s	%f7,	%f18
	fcmpes	%fcc2,	%f9,	%f5
	fcmped	%fcc2,	%f26,	%f18
	stb	%g6,	[%l7 + 0x0F]
	movre	%o2,	0x317,	%l5
	xor	%l1,	%l6,	%g2
	array8	%g1,	%o3,	%i4
	nop
	set	0x64, %o7
	ldsw	[%l7 + %o7],	%i3
	movpos	%icc,	%o1,	%o6
	alignaddr	%o7,	%l0,	%o4
	sub	%g3,	0x043C,	%l2
	fxnors	%f8,	%f18,	%f12
	fmuld8ulx16	%f25,	%f7,	%f26
	sdivcc	%i5,	0x1F46,	%o0
	fmovscs	%icc,	%f26,	%f6
	edge16	%l3,	%l4,	%g5
	andn	%g7,	0x1A58,	%i1
	addccc	%i0,	0x1975,	%i7
	movle	%xcc,	%g4,	%i6
	fzeros	%f0
	orn	%o5,	0x1B33,	%i2
	subccc	%g6,	%l5,	%l1
	ldub	[%l7 + 0x74],	%l6
	mova	%xcc,	%o2,	%g2
	movrlez	%g1,	%o3,	%i4
	udivx	%i3,	0x0F21,	%o6
	fmovsle	%icc,	%f7,	%f5
	sdiv	%o1,	0x03B1,	%l0
	xorcc	%o4,	0x1835,	%g3
	array8	%l2,	%o7,	%o0
	smulcc	%l3,	0x11AA,	%l4
	popc	0x15F7,	%g5
	fcmple16	%f20,	%f14,	%i5
	array16	%g7,	%i1,	%i0
	orncc	%i7,	0x003C,	%g4
	and	%i6,	%o5,	%g6
	udivx	%l5,	0x19B8,	%i2
	stw	%l1,	[%l7 + 0x10]
	movne	%xcc,	%o2,	%g2
	stb	%g1,	[%l7 + 0x45]
	movre	%l6,	0x118,	%o3
	fmuld8ulx16	%f30,	%f15,	%f16
	movge	%xcc,	%i4,	%i3
	fcmple32	%f2,	%f4,	%o6
	udivcc	%l0,	0x13A3,	%o4
	save %g3, %l2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f30,	%f0,	%f0
	fcmps	%fcc3,	%f5,	%f18
	move	%icc,	%o1,	%o0
	srlx	%l3,	%g5,	%l4
	movleu	%icc,	%i5,	%i1
	nop
	set	0x5E, %i7
	ldub	[%l7 + %i7],	%i0
	xnor	%i7,	%g7,	%i6
	movre	%o5,	%g4,	%g6
	movre	%i2,	0x36E,	%l1
	udiv	%l5,	0x144E,	%o2
	sdivcc	%g1,	0x180A,	%g2
	edge8l	%l6,	%i4,	%i3
	umul	%o3,	%o6,	%o4
	edge32l	%g3,	%l2,	%o7
	edge16n	%o1,	%l0,	%l3
	fmovscs	%xcc,	%f4,	%f25
	andn	%g5,	%o0,	%l4
	fmovdn	%xcc,	%f18,	%f23
	movne	%xcc,	%i5,	%i0
	and	%i1,	%g7,	%i6
	movvc	%xcc,	%o5,	%g4
	sdivx	%g6,	0x017E,	%i2
	mulscc	%l1,	0x11F5,	%i7
	edge32ln	%o2,	%g1,	%l5
	orn	%g2,	%l6,	%i4
	fcmpd	%fcc0,	%f8,	%f8
	ldsb	[%l7 + 0x08],	%o3
	movge	%icc,	%o6,	%i3
	fcmpd	%fcc0,	%f0,	%f24
	umul	%g3,	%o4,	%l2
	move	%icc,	%o7,	%l0
	fcmpes	%fcc3,	%f5,	%f7
	smulcc	%o1,	0x0424,	%g5
	sra	%l3,	%o0,	%i5
	ld	[%l7 + 0x0C],	%f0
	movrgz	%l4,	0x21F,	%i1
	edge8n	%g7,	%i0,	%i6
	fpadd16	%f16,	%f30,	%f22
	movvc	%xcc,	%o5,	%g6
	alignaddrl	%g4,	%i2,	%i7
	addcc	%l1,	%g1,	%l5
	orn	%g2,	%o2,	%i4
	movcs	%xcc,	%l6,	%o6
	andncc	%o3,	%g3,	%i3
	srlx	%o4,	0x04,	%l2
	lduh	[%l7 + 0x0A],	%l0
	sub	%o7,	%g5,	%l3
	orcc	%o1,	%o0,	%i5
	st	%f28,	[%l7 + 0x6C]
	nop
	set	0x6D, %g7
	stb	%i1,	[%l7 + %g7]
	fnor	%f8,	%f24,	%f28
	srl	%g7,	0x10,	%l4
	movleu	%xcc,	%i6,	%i0
	mulscc	%g6,	0x1030,	%o5
	andcc	%g4,	%i7,	%l1
	ldsw	[%l7 + 0x7C],	%i2
	movge	%xcc,	%l5,	%g2
	fsrc1s	%f9,	%f21
	fmovrslz	%g1,	%f3,	%f7
	alignaddr	%o2,	%l6,	%i4
	srl	%o3,	%o6,	%g3
	movn	%icc,	%i3,	%l2
	fpadd32	%f22,	%f26,	%f12
	smul	%o4,	%o7,	%g5
	edge32n	%l3,	%l0,	%o0
	array8	%i5,	%o1,	%i1
	edge16l	%l4,	%i6,	%i0
	fmovsge	%xcc,	%f6,	%f0
	fmovsle	%xcc,	%f18,	%f11
	add	%g7,	0x021D,	%o5
	subccc	%g6,	0x0B8C,	%i7
	movl	%xcc,	%l1,	%i2
	edge8n	%g4,	%l5,	%g2
	ldsb	[%l7 + 0x22],	%o2
	fornot1s	%f24,	%f0,	%f14
	udiv	%l6,	0x18E7,	%g1
	ldsw	[%l7 + 0x3C],	%o3
	edge8l	%o6,	%g3,	%i3
	sllx	%i4,	0x19,	%l2
	array32	%o4,	%o7,	%g5
	edge32ln	%l3,	%l0,	%i5
	movvc	%xcc,	%o1,	%o0
	fpsub16s	%f6,	%f16,	%f8
	move	%xcc,	%i1,	%l4
	fnegs	%f29,	%f1
	fnor	%f4,	%f18,	%f0
	array32	%i6,	%g7,	%o5
	ldsw	[%l7 + 0x5C],	%i0
	sir	0x038C
	addcc	%i7,	0x1309,	%l1
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	movpos	%icc,	%l5,	%g2
	sethi	0x0F15,	%o2
	orcc	%g4,	%l6,	%o3
	mulx	%g1,	0x0479,	%g3
	mulscc	%o6,	0x15F5,	%i3
	edge32l	%l2,	%i4,	%o7
	lduh	[%l7 + 0x6E],	%g5
	sdivx	%o4,	0x1F41,	%l3
	movvc	%xcc,	%i5,	%l0
	edge16	%o1,	%o0,	%i1
	mulx	%i6,	0x1B1C,	%l4
	sllx	%o5,	0x12,	%i0
	movl	%xcc,	%g7,	%l1
	ldub	[%l7 + 0x20],	%i7
	edge16l	%i2,	%g6,	%g2
	srlx	%l5,	%g4,	%l6
	edge16ln	%o3,	%g1,	%g3
	xor	%o6,	%o2,	%i3
	array16	%i4,	%l2,	%o7
	sdivcc	%o4,	0x073B,	%l3
	edge16	%i5,	%g5,	%l0
	andcc	%o1,	0x1EC4,	%i1
	movre	%o0,	0x187,	%i6
	array8	%l4,	%o5,	%i0
	std	%f24,	[%l7 + 0x78]
	sra	%g7,	0x05,	%i7
	fcmple16	%f20,	%f10,	%i2
	xor	%g6,	0x02F0,	%g2
	movcc	%xcc,	%l5,	%l1
	fmul8x16	%f22,	%f24,	%f26
	edge8l	%g4,	%l6,	%o3
	edge32l	%g3,	%o6,	%g1
	movrlz	%i3,	%i4,	%o2
	or	%o7,	0x13FE,	%l2
	alignaddrl	%l3,	%i5,	%g5
	sdivx	%o4,	0x08E0,	%o1
	ldub	[%l7 + 0x27],	%i1
	xnorcc	%l0,	%i6,	%o0
	movrgz	%o5,	0x000,	%i0
	orcc	%g7,	%i7,	%i2
	alignaddrl	%g6,	%g2,	%l4
	sra	%l5,	%g4,	%l1
	movg	%xcc,	%l6,	%o3
	fors	%f21,	%f16,	%f22
	srlx	%g3,	0x1C,	%o6
	stx	%g1,	[%l7 + 0x28]
	fpackfix	%f4,	%f26
	fxnor	%f26,	%f8,	%f18
	edge8n	%i3,	%i4,	%o7
	fornot2s	%f3,	%f5,	%f18
	movleu	%icc,	%o2,	%l2
	xnorcc	%l3,	%i5,	%o4
	ldub	[%l7 + 0x6C],	%g5
	sub	%i1,	0x036F,	%l0
	udivcc	%o1,	0x1337,	%o0
	fcmped	%fcc2,	%f14,	%f30
	movg	%icc,	%o5,	%i6
	movl	%icc,	%g7,	%i7
	subc	%i0,	%i2,	%g2
	orn	%l4,	%l5,	%g4
	umul	%l1,	0x0B2B,	%g6
	bshuffle	%f4,	%f22,	%f6
	edge32l	%o3,	%l6,	%g3
	restore %g1, 0x043C, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f9,	%f15,	%f24
	or	%o6,	0x17FD,	%o7
	fmovde	%xcc,	%f8,	%f16
	stx	%i4,	[%l7 + 0x58]
	subc	%o2,	0x1923,	%l2
	fornot2	%f8,	%f18,	%f4
	fmovrdlz	%l3,	%f4,	%f30
	sir	0x020B
	nop
	set	0x60, %i4
	ldx	[%l7 + %i4],	%i5
	xnorcc	%g5,	%i1,	%o4
	addccc	%o1,	%o0,	%o5
	movl	%xcc,	%l0,	%g7
	edge32ln	%i7,	%i6,	%i0
	sra	%i2,	%g2,	%l4
	umul	%g4,	%l1,	%g6
	std	%f10,	[%l7 + 0x10]
	for	%f30,	%f12,	%f0
	umulcc	%o3,	0x0AE9,	%l5
	fmovse	%icc,	%f0,	%f3
	alignaddr	%l6,	%g3,	%i3
	fmul8x16al	%f3,	%f14,	%f20
	movvc	%icc,	%g1,	%o7
	lduh	[%l7 + 0x70],	%i4
	ldub	[%l7 + 0x5A],	%o2
	fmovdcc	%icc,	%f25,	%f8
	sdivcc	%l2,	0x07AE,	%o6
	orncc	%i5,	%g5,	%l3
	edge8n	%o4,	%i1,	%o1
	array8	%o5,	%l0,	%o0
	mova	%xcc,	%g7,	%i7
	st	%f29,	[%l7 + 0x48]
	subccc	%i0,	0x0305,	%i6
	fmul8ulx16	%f0,	%f0,	%f16
	sethi	0x10A5,	%g2
	mova	%xcc,	%l4,	%i2
	ldsw	[%l7 + 0x60],	%l1
	edge32ln	%g4,	%g6,	%l5
	edge8n	%l6,	%o3,	%i3
	addcc	%g3,	0x1B20,	%o7
	save %g1, 0x1866, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%xcc,	%f19,	%f6
	srl	%o2,	0x0D,	%o6
	edge8n	%i5,	%l2,	%g5
	fmovrsne	%l3,	%f21,	%f6
	nop
	set	0x7C, %o5
	ldsb	[%l7 + %o5],	%o4
	andncc	%o1,	%o5,	%i1
	std	%f14,	[%l7 + 0x78]
	movpos	%icc,	%l0,	%o0
	movrlz	%g7,	%i0,	%i6
	fmovd	%f12,	%f12
	movrlz	%i7,	%l4,	%i2
	fmovse	%icc,	%f22,	%f13
	ldd	[%l7 + 0x50],	%l0
	movn	%icc,	%g4,	%g2
	edge8n	%g6,	%l6,	%l5
	edge8	%o3,	%g3,	%i3
	edge8n	%o7,	%g1,	%o2
	fnegd	%f12,	%f10
	movvs	%icc,	%o6,	%i4
	movrlez	%i5,	%l2,	%g5
	stb	%l3,	[%l7 + 0x57]
	andcc	%o1,	0x10AF,	%o5
	fmovdg	%icc,	%f2,	%f25
	fpsub16	%f14,	%f12,	%f24
	udiv	%i1,	0x117B,	%o4
	movcc	%icc,	%o0,	%g7
	movrlz	%i0,	%l0,	%i7
	ldd	[%l7 + 0x18],	%i6
	fmovdl	%xcc,	%f24,	%f10
	save %i2, %l1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%icc,	%f12,	%f9
	sdivx	%g2,	0x05A2,	%g6
	ldsb	[%l7 + 0x4D],	%l4
	movrgz	%l5,	0x1B2,	%o3
	xnorcc	%g3,	%l6,	%o7
	movne	%icc,	%g1,	%i3
	edge32n	%o2,	%o6,	%i5
	smul	%l2,	0x00F6,	%i4
	movn	%icc,	%l3,	%g5
	subccc	%o1,	%o5,	%o4
	andn	%o0,	%i1,	%g7
	movrgez	%i0,	0x11A,	%l0
	movre	%i7,	%i6,	%i2
	fpsub32s	%f14,	%f26,	%f15
	nop
	set	0x10, %l4
	ldx	[%l7 + %l4],	%l1
	add	%g4,	%g2,	%g6
	ldub	[%l7 + 0x4B],	%l5
	movne	%xcc,	%l4,	%g3
	fandnot1	%f30,	%f6,	%f26
	fcmple16	%f8,	%f14,	%l6
	fmovda	%xcc,	%f28,	%f18
	fones	%f24
	udiv	%o3,	0x054D,	%o7
	movne	%icc,	%i3,	%o2
	fmovsn	%icc,	%f12,	%f0
	ldd	[%l7 + 0x48],	%f0
	nop
	set	0x1A, %o2
	sth	%g1,	[%l7 + %o2]
	fxnors	%f3,	%f7,	%f16
	st	%f9,	[%l7 + 0x0C]
	srax	%i5,	%l2,	%o6
	movn	%icc,	%l3,	%i4
	movvs	%icc,	%o1,	%o5
	fsrc2	%f10,	%f16
	alignaddrl	%o4,	%o0,	%i1
	sdiv	%g7,	0x09C3,	%i0
	save %g5, 0x10DF, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i6,	%i7,	%l1
	fcmple32	%f10,	%f20,	%i2
	edge32	%g4,	%g6,	%g2
	ldsw	[%l7 + 0x28],	%l5
	fnor	%f2,	%f14,	%f22
	ldsw	[%l7 + 0x3C],	%g3
	fnot1s	%f21,	%f15
	xnor	%l6,	%l4,	%o7
	fornot2s	%f13,	%f11,	%f2
	edge8ln	%o3,	%o2,	%i3
	fmovdvs	%xcc,	%f7,	%f6
	ldub	[%l7 + 0x57],	%i5
	andcc	%l2,	0x074D,	%g1
	srax	%l3,	0x13,	%i4
	smul	%o1,	%o6,	%o5
	movn	%icc,	%o0,	%o4
	fnot1s	%f24,	%f28
	fcmple16	%f26,	%f18,	%i1
	xnorcc	%g7,	%g5,	%i0
	ldd	[%l7 + 0x50],	%i6
	sdiv	%l0,	0x190F,	%l1
	sdivcc	%i7,	0x0921,	%i2
	movleu	%xcc,	%g6,	%g2
	udivcc	%g4,	0x18E1,	%g3
	ldub	[%l7 + 0x53],	%l5
	edge16	%l6,	%o7,	%o3
	movcc	%xcc,	%o2,	%i3
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	stb	%g1,	[%l7 + 0x2D]
	movl	%icc,	%i4,	%o1
	fsrc1	%f8,	%f26
	fzero	%f2
	fpsub16	%f30,	%f0,	%f0
	ldd	[%l7 + 0x10],	%f20
	movn	%icc,	%o6,	%l3
	sllx	%o5,	%o4,	%i1
	fcmpgt32	%f16,	%f12,	%o0
	udivx	%g5,	0x19A1,	%i0
	alignaddr	%i6,	%l0,	%g7
	sir	0x021D
	fmovdl	%icc,	%f25,	%f22
	fcmpd	%fcc0,	%f20,	%f30
	lduh	[%l7 + 0x24],	%l1
	stx	%i2,	[%l7 + 0x40]
	fmovdcc	%xcc,	%f14,	%f21
	srl	%i7,	0x03,	%g6
	addcc	%g4,	0x0C0B,	%g2
	alignaddrl	%g3,	%l5,	%o7
	movre	%l6,	%o2,	%i3
	srax	%o3,	%l4,	%l2
	xor	%g1,	%i5,	%i4
	edge8	%o6,	%l3,	%o5
	movre	%o1,	0x15E,	%o4
	and	%i1,	%g5,	%i0
	movne	%icc,	%i6,	%l0
	addcc	%o0,	%l1,	%g7
	ldsb	[%l7 + 0x69],	%i2
	nop
	set	0x68, %o3
	lduw	[%l7 + %o3],	%i7
	fexpand	%f0,	%f18
	mulx	%g6,	%g4,	%g2
	edge32	%l5,	%o7,	%g3
	faligndata	%f24,	%f12,	%f24
	fmovrsne	%l6,	%f23,	%f16
	ldub	[%l7 + 0x4A],	%i3
	stb	%o2,	[%l7 + 0x6E]
	movneg	%xcc,	%o3,	%l2
	movcs	%xcc,	%g1,	%i5
	movrne	%l4,	%i4,	%l3
	movre	%o6,	0x066,	%o5
	fmovdgu	%icc,	%f1,	%f26
	movvc	%icc,	%o4,	%o1
	edge8ln	%g5,	%i1,	%i6
	ldd	[%l7 + 0x18],	%l0
	andcc	%o0,	%i0,	%l1
	andcc	%i2,	%i7,	%g6
	add	%g4,	%g2,	%g7
	movre	%o7,	0x002,	%g3
	popc	0x17F0,	%l6
	udiv	%l5,	0x0E3B,	%o2
	movcc	%icc,	%i3,	%o3
	umulcc	%l2,	0x0BE6,	%i5
	srax	%g1,	0x02,	%l4
	edge16n	%i4,	%l3,	%o6
	movneg	%xcc,	%o4,	%o1
	fandnot2	%f4,	%f8,	%f4
	add	%o5,	%i1,	%i6
	addccc	%l0,	%o0,	%g5
	subccc	%i0,	0x08DA,	%l1
	stb	%i7,	[%l7 + 0x3F]
	fpsub32s	%f30,	%f21,	%f3
	fpadd32	%f10,	%f14,	%f8
	umul	%g6,	%g4,	%g2
	andcc	%g7,	0x1635,	%i2
	fxnor	%f0,	%f6,	%f4
	xnorcc	%g3,	0x1CF0,	%l6
	movleu	%xcc,	%o7,	%l5
	edge8ln	%i3,	%o3,	%l2
	edge32ln	%o2,	%g1,	%i5
	ldx	[%l7 + 0x28],	%l4
	fcmpgt32	%f28,	%f18,	%i4
	stw	%o6,	[%l7 + 0x78]
	fpadd32s	%f26,	%f11,	%f4
	edge16	%o4,	%l3,	%o5
	xorcc	%o1,	0x177C,	%i1
	movle	%icc,	%l0,	%o0
	addcc	%i6,	%i0,	%g5
	orncc	%l1,	0x1A70,	%i7
	sdivcc	%g4,	0x0746,	%g2
	andncc	%g6,	%g7,	%i2
	fnands	%f10,	%f4,	%f18
	mulx	%g3,	0x1D6F,	%l6
	array16	%l5,	%i3,	%o7
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%l2
	subcc	%o2,	%o3,	%g1
	fornot1s	%f2,	%f15,	%f23
	xor	%i5,	0x1BAA,	%l4
	edge8	%i4,	%o6,	%o4
	movrlez	%l3,	0x109,	%o1
	fcmps	%fcc3,	%f17,	%f12
	faligndata	%f28,	%f0,	%f10
	edge32l	%o5,	%i1,	%l0
	andn	%o0,	%i6,	%g5
	orn	%i0,	%i7,	%g4
	fandnot2s	%f17,	%f23,	%f6
	udiv	%l1,	0x0BF4,	%g2
	movre	%g7,	0x146,	%i2
	ld	[%l7 + 0x6C],	%f8
	sir	0x095D
	edge8	%g3,	%l6,	%l5
	andn	%g6,	0x1B7F,	%o7
	ldsb	[%l7 + 0x79],	%i3
	udivcc	%o2,	0x0504,	%o3
	edge8ln	%l2,	%g1,	%i5
	sethi	0x1F53,	%i4
	sdivcc	%o6,	0x011B,	%l4
	udivx	%o4,	0x07B6,	%l3
	fcmps	%fcc0,	%f1,	%f8
	movge	%xcc,	%o5,	%o1
	fmovrslez	%l0,	%f4,	%f0
	edge16n	%o0,	%i1,	%i6
	addc	%i0,	%i7,	%g5
	movcc	%xcc,	%l1,	%g4
	fmovrslez	%g2,	%f4,	%f13
	sdivx	%i2,	0x19B6,	%g7
	fors	%f22,	%f16,	%f10
	edge32ln	%l6,	%g3,	%g6
	sth	%l5,	[%l7 + 0x1A]
	movl	%xcc,	%i3,	%o7
	ldsh	[%l7 + 0x6E],	%o2
	movrlez	%l2,	%g1,	%o3
	edge32ln	%i5,	%i4,	%o6
	srax	%l4,	%o4,	%l3
	fmovsg	%xcc,	%f31,	%f30
	ldsb	[%l7 + 0x37],	%o1
	fxor	%f10,	%f0,	%f12
	edge16l	%o5,	%o0,	%l0
	lduw	[%l7 + 0x54],	%i1
	fmovse	%icc,	%f22,	%f30
	movl	%xcc,	%i6,	%i7
	smul	%i0,	%l1,	%g5
	addc	%g4,	%g2,	%g7
	fmovsle	%icc,	%f23,	%f3
	fsrc1	%f0,	%f18
	subcc	%l6,	%g3,	%g6
	andcc	%i2,	%i3,	%o7
	movrlz	%l5,	0x3EF,	%o2
	sra	%l2,	0x11,	%o3
	save %i5, 0x16BF, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f14,	%f28,	%g1
	fmovdcs	%xcc,	%f26,	%f3
	lduh	[%l7 + 0x52],	%o6
	subccc	%l4,	%l3,	%o1
	ldsb	[%l7 + 0x4C],	%o4
	popc	%o5,	%l0
	andncc	%i1,	%i6,	%i7
	xor	%o0,	0x0408,	%l1
	fornot2	%f28,	%f4,	%f20
	umul	%i0,	0x0AAF,	%g5
	addcc	%g2,	%g4,	%g7
	edge32l	%l6,	%g3,	%g6
	fmovrdlez	%i2,	%f8,	%f10
	fandnot1	%f14,	%f2,	%f4
	movrgz	%o7,	%l5,	%i3
	addccc	%l2,	0x1B66,	%o3
	andcc	%o2,	%i5,	%g1
	movvs	%icc,	%o6,	%i4
	ldd	[%l7 + 0x28],	%l4
	edge16ln	%o1,	%o4,	%o5
	movvc	%xcc,	%l3,	%i1
	movrne	%i6,	0x00A,	%l0
	movneg	%xcc,	%i7,	%l1
	popc	%o0,	%g5
	sdiv	%i0,	0x0386,	%g4
	fexpand	%f13,	%f6
	fmul8x16	%f4,	%f20,	%f16
	movcs	%xcc,	%g2,	%l6
	movrlez	%g3,	0x298,	%g6
	fnegd	%f8,	%f2
	addcc	%g7,	%i2,	%o7
	fmovrslez	%i3,	%f2,	%f10
	orncc	%l5,	0x11C3,	%o3
	ldub	[%l7 + 0x3B],	%l2
	restore %i5, 0x1674, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o6,	%g1,	%l4
	alignaddr	%o1,	%o4,	%o5
	movn	%xcc,	%l3,	%i1
	fmovrslez	%i4,	%f9,	%f26
	ldd	[%l7 + 0x68],	%f8
	edge16ln	%l0,	%i6,	%l1
	edge16l	%i7,	%g5,	%o0
	st	%f19,	[%l7 + 0x40]
	edge32l	%g4,	%i0,	%l6
	sdivx	%g2,	0x0B87,	%g3
	edge32n	%g6,	%g7,	%i2
	ldd	[%l7 + 0x10],	%f2
	sllx	%o7,	%l5,	%o3
	sth	%i3,	[%l7 + 0x56]
	subc	%l2,	0x14AD,	%o2
	add	%o6,	0x0C8C,	%i5
	xorcc	%l4,	%g1,	%o1
	fmovscc	%icc,	%f2,	%f6
	fmovdpos	%icc,	%f22,	%f15
	fmovsneg	%xcc,	%f23,	%f4
	fpsub16	%f18,	%f2,	%f30
	fcmple32	%f28,	%f22,	%o4
	fmovd	%f0,	%f20
	movleu	%xcc,	%l3,	%i1
	movn	%xcc,	%i4,	%l0
	fpmerge	%f10,	%f16,	%f8
	edge8l	%o5,	%l1,	%i6
	ldsb	[%l7 + 0x32],	%g5
	subccc	%o0,	0x1548,	%i7
	orcc	%i0,	%l6,	%g4
	movl	%icc,	%g3,	%g6
	edge8n	%g2,	%i2,	%g7
	and	%l5,	0x11FC,	%o3
	move	%icc,	%i3,	%o7
	move	%icc,	%o2,	%l2
	ldd	[%l7 + 0x78],	%f14
	srl	%o6,	0x0B,	%i5
	edge32n	%g1,	%o1,	%o4
	movcc	%icc,	%l4,	%l3
	edge16	%i4,	%l0,	%o5
	std	%f16,	[%l7 + 0x78]
	stx	%l1,	[%l7 + 0x70]
	xor	%i1,	%i6,	%o0
	fpsub16s	%f16,	%f13,	%f17
	sdiv	%g5,	0x0FDF,	%i7
	orn	%i0,	%l6,	%g4
	movrgez	%g6,	%g2,	%g3
	fnors	%f20,	%f14,	%f18
	fnegd	%f18,	%f20
	udiv	%i2,	0x0CB2,	%g7
	sdiv	%o3,	0x1267,	%l5
	movrlez	%i3,	0x1E9,	%o2
	movrne	%l2,	%o6,	%i5
	fcmpd	%fcc3,	%f10,	%f8
	movvc	%xcc,	%g1,	%o7
	sdiv	%o4,	0x0C02,	%l4
	movl	%icc,	%o1,	%l3
	fmul8sux16	%f30,	%f0,	%f12
	ldsb	[%l7 + 0x73],	%i4
	smulcc	%l0,	%l1,	%i1
	fcmpne32	%f8,	%f6,	%i6
	xnor	%o5,	0x030E,	%o0
	movg	%xcc,	%g5,	%i0
	edge16l	%i7,	%g4,	%g6
	sdivcc	%l6,	0x1C1F,	%g2
	movre	%g3,	%i2,	%o3
	udivx	%l5,	0x1FC5,	%g7
	save %o2, 0x0610, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o6,	0x0182,	%i5
	movrgz	%g1,	0x381,	%l2
	subc	%o7,	%o4,	%o1
	fmuld8sux16	%f30,	%f25,	%f8
	ldx	[%l7 + 0x38],	%l3
	fors	%f18,	%f26,	%f17
	fmul8ulx16	%f24,	%f12,	%f14
	addcc	%i4,	%l0,	%l4
	movl	%icc,	%i1,	%l1
	movne	%icc,	%i6,	%o5
	fmul8x16	%f6,	%f30,	%f14
	movleu	%icc,	%o0,	%i0
	xorcc	%i7,	%g5,	%g6
	fandnot2s	%f27,	%f25,	%f15
	fones	%f12
	move	%icc,	%l6,	%g4
	ldd	[%l7 + 0x08],	%f24
	movre	%g2,	0x2AE,	%g3
	fnor	%f0,	%f18,	%f18
	movpos	%icc,	%i2,	%o3
	movcc	%icc,	%l5,	%o2
	edge8	%i3,	%g7,	%o6
	stx	%g1,	[%l7 + 0x30]
	orn	%l2,	0x1121,	%o7
	srlx	%i5,	0x17,	%o1
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	fand	%f20,	%f10,	%f8
	stw	%l0,	[%l7 + 0x5C]
	movge	%xcc,	%i1,	%l4
	std	%f8,	[%l7 + 0x18]
	fmovdcc	%xcc,	%f22,	%f15
	edge8l	%l1,	%i6,	%o0
	stb	%o5,	[%l7 + 0x62]
	edge32ln	%i7,	%i0,	%g5
	add	%l6,	%g4,	%g6
	fmovs	%f4,	%f11
	mova	%icc,	%g3,	%i2
	lduh	[%l7 + 0x2E],	%o3
	edge32ln	%g2,	%l5,	%i3
	and	%g7,	0x04F0,	%o6
	popc	%g1,	%l2
	subcc	%o2,	%o7,	%i5
	orncc	%o4,	%o1,	%i4
	xorcc	%l0,	%l3,	%i1
	fnot2	%f18,	%f26
	ld	[%l7 + 0x78],	%f10
	movgu	%xcc,	%l4,	%i6
	edge32n	%o0,	%o5,	%l1
	edge8	%i0,	%i7,	%l6
	and	%g5,	0x0FF2,	%g4
	mulscc	%g3,	0x0A9D,	%i2
	ldsb	[%l7 + 0x34],	%o3
	edge8ln	%g2,	%g6,	%i3
	xnor	%l5,	%g7,	%g1
	movrlz	%o6,	%l2,	%o7
	edge8ln	%o2,	%o4,	%o1
	srl	%i5,	%l0,	%l3
	addcc	%i4,	%l4,	%i1
	fmovsa	%icc,	%f30,	%f10
	andn	%i6,	%o5,	%o0
	ldsw	[%l7 + 0x7C],	%i0
	sth	%i7,	[%l7 + 0x12]
	stb	%l1,	[%l7 + 0x1D]
	edge32ln	%l6,	%g5,	%g3
	ldsw	[%l7 + 0x48],	%i2
	edge8n	%o3,	%g4,	%g2
	restore %g6, 0x084A, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x15],	%i3
	movcc	%xcc,	%g1,	%o6
	movvs	%icc,	%g7,	%o7
	ldsw	[%l7 + 0x38],	%l2
	lduh	[%l7 + 0x34],	%o2
	and	%o1,	0x160E,	%i5
	fcmpeq16	%f20,	%f4,	%o4
	ldx	[%l7 + 0x38],	%l3
	movg	%icc,	%i4,	%l4
	std	%f4,	[%l7 + 0x58]
	edge8l	%i1,	%l0,	%i6
	movg	%icc,	%o0,	%o5
	ld	[%l7 + 0x18],	%f22
	movgu	%icc,	%i0,	%i7
	movle	%icc,	%l1,	%l6
	umul	%g5,	0x10D3,	%i2
	fmovdcc	%icc,	%f4,	%f9
	fmovda	%icc,	%f30,	%f25
	fmovdcs	%xcc,	%f16,	%f26
	alignaddrl	%g3,	%g4,	%g2
	movrgz	%g6,	%l5,	%i3
	xor	%g1,	0x0980,	%o3
	subcc	%o6,	%o7,	%g7
	orcc	%o2,	0x0285,	%o1
	edge8n	%l2,	%o4,	%i5
	fnor	%f14,	%f16,	%f6
	umul	%l3,	%i4,	%i1
	sll	%l0,	%l4,	%i6
	movgu	%xcc,	%o5,	%i0
	srax	%i7,	%l1,	%o0
	fmul8x16	%f12,	%f2,	%f20
	fnegs	%f13,	%f24
	stx	%g5,	[%l7 + 0x38]
	fabss	%f24,	%f25
	fandnot1	%f2,	%f28,	%f4
	fmovspos	%icc,	%f22,	%f17
	sll	%i2,	%l6,	%g3
	umulcc	%g2,	%g6,	%g4
	ldx	[%l7 + 0x08],	%l5
	array32	%g1,	%i3,	%o3
	alignaddr	%o6,	%o7,	%o2
	save %g7, %o1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i5,	%o4,	%l3
	mova	%icc,	%i4,	%i1
	movrgez	%l0,	%l4,	%o5
	movneg	%icc,	%i6,	%i0
	edge16n	%l1,	%o0,	%g5
	addc	%i2,	0x11D6,	%l6
	movpos	%xcc,	%i7,	%g2
	subc	%g6,	%g3,	%l5
	edge16ln	%g4,	%g1,	%o3
	fandnot2	%f12,	%f14,	%f20
	fands	%f11,	%f23,	%f21
	fpadd16	%f0,	%f10,	%f2
	smul	%o6,	0x1E46,	%i3
	array32	%o2,	%o7,	%o1
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	subc	%o4,	%i5,	%l3
	fpsub32	%f30,	%f0,	%f2
	xorcc	%i4,	%l0,	%i1
	mulx	%o5,	%i6,	%l4
	sir	0x09C1
	fpsub16s	%f11,	%f6,	%f16
	st	%f19,	[%l7 + 0x24]
	sdiv	%i0,	0x14F0,	%l1
	ldsw	[%l7 + 0x54],	%g5
	mulscc	%o0,	%i2,	%i7
	mulx	%g2,	%g6,	%g3
	ldub	[%l7 + 0x2C],	%l6
	movgu	%xcc,	%g4,	%l5
	std	%f2,	[%l7 + 0x70]
	sir	0x0261
	ldsh	[%l7 + 0x1E],	%o3
	move	%xcc,	%o6,	%g1
	movn	%icc,	%i3,	%o2
	edge32	%o7,	%l2,	%g7
	lduw	[%l7 + 0x40],	%o4
	array32	%i5,	%l3,	%o1
	sub	%i4,	0x0DDA,	%i1
	std	%f30,	[%l7 + 0x58]
	andncc	%o5,	%i6,	%l4
	orncc	%i0,	%l0,	%g5
	stx	%o0,	[%l7 + 0x48]
	std	%f28,	[%l7 + 0x08]
	ldsb	[%l7 + 0x64],	%l1
	fmovdl	%xcc,	%f11,	%f13
	movcc	%icc,	%i2,	%g2
	movpos	%icc,	%g6,	%g3
	fmovscs	%icc,	%f6,	%f6
	edge16	%l6,	%g4,	%l5
	movcs	%xcc,	%o3,	%o6
	srlx	%g1,	%i3,	%o2
	addc	%i7,	%l2,	%g7
	fmovrslz	%o4,	%f11,	%f29
	fxnors	%f21,	%f3,	%f21
	fmovsa	%icc,	%f23,	%f20
	stx	%i5,	[%l7 + 0x48]
	fmuld8sux16	%f3,	%f23,	%f18
	orn	%o7,	0x1D37,	%l3
	fmovs	%f24,	%f12
	save %i4, %o1, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%i1,	%l4
	fpadd32s	%f10,	%f14,	%f29
	fmovrsne	%i6,	%f31,	%f12
	edge32	%l0,	%i0,	%o0
	ld	[%l7 + 0x7C],	%f10
	andn	%l1,	0x0FEE,	%g5
	xor	%i2,	%g6,	%g2
	srax	%g3,	0x19,	%g4
	movpos	%icc,	%l6,	%o3
	edge32ln	%o6,	%l5,	%g1
	udiv	%o2,	0x1DEB,	%i7
	sdivx	%l2,	0x0897,	%g7
	fmul8ulx16	%f8,	%f2,	%f20
	addcc	%i3,	0x08C3,	%o4
	stb	%i5,	[%l7 + 0x7B]
	fmovsn	%xcc,	%f14,	%f9
	std	%f28,	[%l7 + 0x50]
	mova	%icc,	%o7,	%i4
	fmovsg	%xcc,	%f6,	%f0
	mulscc	%o1,	%o5,	%i1
	ldx	[%l7 + 0x68],	%l3
	edge32ln	%l4,	%i6,	%i0
	edge16n	%o0,	%l0,	%g5
	sra	%i2,	0x0F,	%l1
	movre	%g6,	0x266,	%g3
	fornot1s	%f28,	%f30,	%f23
	fmovsg	%icc,	%f11,	%f3
	sethi	0x14F0,	%g2
	xor	%l6,	%g4,	%o3
	xorcc	%l5,	0x04C4,	%o6
	sth	%o2,	[%l7 + 0x36]
	fornot1s	%f1,	%f3,	%f25
	movre	%i7,	%g1,	%g7
	or	%l2,	0x0B21,	%o4
	orncc	%i5,	0x1107,	%o7
	ldsw	[%l7 + 0x64],	%i4
	ldsb	[%l7 + 0x2C],	%i3
	edge16l	%o5,	%i1,	%o1
	movrgz	%l3,	0x35B,	%i6
	nop
	set	0x38, %i6
	lduw	[%l7 + %i6],	%i0
	movrne	%o0,	%l4,	%g5
	sdiv	%l0,	0x1C7D,	%l1
	array8	%i2,	%g3,	%g6
	edge8l	%l6,	%g4,	%o3
	stw	%l5,	[%l7 + 0x54]
	andncc	%o6,	%g2,	%i7
	smulcc	%o2,	0x1CC0,	%g1
	fzeros	%f25
	add	%g7,	%o4,	%i5
	edge32ln	%o7,	%i4,	%l2
	array32	%o5,	%i1,	%o1
	fpadd16s	%f27,	%f1,	%f24
	addc	%l3,	0x038C,	%i3
	fmovrsgz	%i0,	%f20,	%f21
	fmovdn	%icc,	%f29,	%f6
	fornot2s	%f21,	%f3,	%f7
	fands	%f0,	%f2,	%f18
	movl	%icc,	%i6,	%l4
	sub	%g5,	%o0,	%l1
	mulx	%i2,	%l0,	%g6
	fornot2	%f30,	%f28,	%f24
	edge32n	%g3,	%l6,	%o3
	movl	%xcc,	%l5,	%o6
	save %g2, %i7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g1,	%o2,	%g7
	fmovdne	%xcc,	%f20,	%f27
	ldsb	[%l7 + 0x44],	%o4
	fmul8x16	%f8,	%f6,	%f12
	movn	%icc,	%i5,	%o7
	restore %i4, 0x111E, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	movrlez	%l3,	0x117,	%i3
	edge16ln	%i0,	%i6,	%g5
	movge	%xcc,	%o0,	%l4
	andn	%l1,	0x0FAF,	%l0
	fand	%f0,	%f6,	%f14
	fmovrdgez	%g6,	%f28,	%f10
	movgu	%icc,	%i2,	%g3
	movrne	%o3,	0x37B,	%l6
	xnorcc	%l5,	%g2,	%i7
	save %g4, %g1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g7,	%o4,	%i5
	ld	[%l7 + 0x40],	%f27
	fzero	%f8
	movrlez	%o2,	%i4,	%o5
	sethi	0x1041,	%l2
	alignaddr	%o7,	%i1,	%l3
	alignaddr	%i3,	%i0,	%i6
	srlx	%g5,	0x09,	%o1
	fmovsge	%xcc,	%f19,	%f25
	fornot1	%f22,	%f26,	%f18
	subcc	%o0,	0x1E73,	%l4
	movne	%xcc,	%l1,	%g6
	movn	%xcc,	%l0,	%i2
	fornot2	%f30,	%f14,	%f6
	faligndata	%f30,	%f30,	%f4
	edge8ln	%o3,	%g3,	%l5
	fzero	%f4
	sethi	0x0B6C,	%l6
	movre	%i7,	0x328,	%g2
	edge32l	%g4,	%o6,	%g1
	edge32	%g7,	%o4,	%o2
	mova	%icc,	%i5,	%i4
	fsrc2s	%f12,	%f21
	addcc	%l2,	0x1233,	%o7
	addccc	%o5,	%i1,	%i3
	alignaddr	%i0,	%i6,	%l3
	alignaddrl	%o1,	%g5,	%l4
	sethi	0x070B,	%l1
	sra	%o0,	0x0F,	%l0
	edge32	%g6,	%i2,	%g3
	add	%o3,	0x0C4B,	%l5
	array16	%i7,	%g2,	%l6
	array8	%g4,	%g1,	%o6
	fpsub16	%f26,	%f10,	%f22
	sdivx	%o4,	0x18AF,	%g7
	movleu	%icc,	%o2,	%i5
	orcc	%i4,	%o7,	%o5
	movneg	%xcc,	%l2,	%i3
	save %i1, %i0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o1,	%i6,	%l4
	xor	%g5,	0x1268,	%l1
	fmovdge	%xcc,	%f27,	%f20
	fpack32	%f8,	%f0,	%f20
	movvs	%xcc,	%l0,	%o0
	fornot1	%f18,	%f26,	%f10
	sllx	%g6,	%i2,	%g3
	edge32	%l5,	%o3,	%g2
	ldsb	[%l7 + 0x51],	%i7
	orncc	%g4,	0x01AB,	%g1
	sdivcc	%o6,	0x13D9,	%l6
	alignaddr	%o4,	%o2,	%i5
	movpos	%icc,	%g7,	%o7
	mulx	%o5,	%i4,	%i3
	sethi	0x00A3,	%i1
	array32	%l2,	%i0,	%l3
	movn	%icc,	%o1,	%l4
	fmovde	%xcc,	%f5,	%f28
	fnegs	%f21,	%f25
	ldsh	[%l7 + 0x38],	%g5
	xor	%i6,	0x0C69,	%l1
	fmovde	%xcc,	%f26,	%f29
	nop
	set	0x74, %o0
	stw	%l0,	[%l7 + %o0]
	ld	[%l7 + 0x10],	%f29
	ldub	[%l7 + 0x0C],	%o0
	restore %i2, 0x1745, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f28,	%f22
	xor	%l5,	0x19E4,	%o3
	subc	%g2,	0x1BC1,	%i7
	stb	%g4,	[%l7 + 0x51]
	save %g3, 0x18CB, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o6,	0x0E,	%l6
	bshuffle	%f16,	%f8,	%f30
	fmovdvc	%icc,	%f20,	%f31
	fmovdcs	%icc,	%f20,	%f0
	sllx	%o2,	0x13,	%i5
	ldsw	[%l7 + 0x78],	%o4
	ldub	[%l7 + 0x2B],	%o7
	udivcc	%g7,	0x17B1,	%o5
	addc	%i4,	%i3,	%l2
	andncc	%i1,	%l3,	%o1
	fornot1	%f12,	%f16,	%f10
	xorcc	%i0,	0x01FD,	%g5
	st	%f1,	[%l7 + 0x0C]
	std	%f2,	[%l7 + 0x20]
	srl	%i6,	%l4,	%l0
	st	%f19,	[%l7 + 0x70]
	fxors	%f24,	%f22,	%f27
	mova	%icc,	%l1,	%i2
	ldsw	[%l7 + 0x38],	%o0
	fmovsleu	%xcc,	%f21,	%f8
	andncc	%l5,	%g6,	%o3
	subccc	%g2,	0x1546,	%i7
	sra	%g4,	0x01,	%g1
	edge16	%g3,	%o6,	%o2
	stw	%l6,	[%l7 + 0x74]
	array32	%i5,	%o7,	%g7
	lduw	[%l7 + 0x7C],	%o4
	smul	%i4,	0x1007,	%i3
	edge8ln	%l2,	%i1,	%l3
	movrlz	%o5,	%o1,	%g5
	sdivcc	%i6,	0x150B,	%l4
	movleu	%xcc,	%l0,	%l1
	ld	[%l7 + 0x08],	%f14
	addccc	%i0,	%i2,	%o0
	movl	%xcc,	%l5,	%o3
	edge32ln	%g6,	%g2,	%g4
	movg	%icc,	%i7,	%g3
	ldsw	[%l7 + 0x44],	%o6
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	fand	%f26,	%f6,	%f12
	movvc	%icc,	%i5,	%l6
	fxnor	%f30,	%f8,	%f10
	movge	%xcc,	%g7,	%o7
	move	%xcc,	%o4,	%i4
	st	%f10,	[%l7 + 0x1C]
	move	%xcc,	%i3,	%i1
	fpsub16s	%f6,	%f25,	%f22
	fabss	%f2,	%f15
	fmovse	%icc,	%f30,	%f25
	sdivcc	%l2,	0x1A14,	%o5
	mulx	%l3,	0x0A66,	%o1
	fands	%f14,	%f27,	%f14
	siam	0x1
	fmovrdgez	%g5,	%f26,	%f0
	ldsb	[%l7 + 0x38],	%i6
	st	%f15,	[%l7 + 0x14]
	popc	%l4,	%l0
	fmovrsne	%i0,	%f27,	%f23
	orncc	%i2,	%o0,	%l1
	fzeros	%f26
	std	%f10,	[%l7 + 0x58]
	ldx	[%l7 + 0x60],	%o3
	fornot2s	%f22,	%f7,	%f0
	edge16ln	%l5,	%g6,	%g2
	fnand	%f14,	%f28,	%f18
	movl	%xcc,	%g4,	%i7
	std	%f12,	[%l7 + 0x58]
	fmovrslz	%o6,	%f22,	%f19
	array32	%o2,	%g3,	%g1
	ldub	[%l7 + 0x7A],	%l6
	array32	%i5,	%o7,	%g7
	subccc	%i4,	%i3,	%o4
	sdivcc	%l2,	0x05CE,	%o5
	andn	%i1,	%o1,	%g5
	stw	%i6,	[%l7 + 0x60]
	fcmpeq32	%f18,	%f6,	%l3
	array16	%l4,	%l0,	%i0
	udivx	%o0,	0x0094,	%i2
	mova	%icc,	%l1,	%l5
	andcc	%g6,	0x14DA,	%g2
	orcc	%g4,	0x0B01,	%o3
	ldub	[%l7 + 0x7E],	%i7
	movrlz	%o2,	0x2ED,	%o6
	movvs	%icc,	%g3,	%l6
	edge8l	%i5,	%g1,	%g7
	edge8	%o7,	%i4,	%o4
	and	%i3,	%o5,	%l2
	fmul8sux16	%f16,	%f18,	%f22
	ldx	[%l7 + 0x50],	%o1
	fmovdg	%icc,	%f20,	%f11
	edge32	%g5,	%i1,	%l3
	sra	%l4,	%i6,	%l0
	std	%f24,	[%l7 + 0x68]
	sir	0x1086
	xnor	%i0,	%i2,	%o0
	movcs	%xcc,	%l1,	%l5
	mulx	%g2,	%g6,	%g4
	fzero	%f0
	xor	%i7,	%o2,	%o6
	array8	%o3,	%g3,	%i5
	movn	%icc,	%g1,	%l6
	stx	%g7,	[%l7 + 0x48]
	subccc	%o7,	%o4,	%i3
	movpos	%xcc,	%o5,	%l2
	fxors	%f8,	%f9,	%f2
	movrgz	%i4,	0x246,	%g5
	fcmple16	%f20,	%f8,	%i1
	lduh	[%l7 + 0x1A],	%l3
	and	%l4,	0x00F8,	%o1
	movle	%xcc,	%l0,	%i6
	fornot1s	%f18,	%f23,	%f13
	fone	%f12
	fmovscs	%xcc,	%f14,	%f13
	mulscc	%i0,	0x1960,	%i2
	movrlz	%l1,	%l5,	%g2
	ld	[%l7 + 0x7C],	%f14
	edge32n	%o0,	%g4,	%g6
	edge32n	%o2,	%i7,	%o6
	xor	%o3,	%i5,	%g3
	movleu	%xcc,	%g1,	%g7
	edge32	%o7,	%l6,	%o4
	fnegd	%f18,	%f18
	movvc	%icc,	%o5,	%i3
	add	%l2,	0x1483,	%g5
	movg	%icc,	%i4,	%i1
	ldsw	[%l7 + 0x18],	%l3
	fabss	%f6,	%f7
	movrlz	%o1,	0x2CB,	%l0
	orncc	%i6,	0x09E0,	%l4
	edge8l	%i2,	%i0,	%l1
	fnors	%f11,	%f21,	%f26
	xnor	%l5,	0x0AA8,	%g2
	movrgz	%o0,	%g6,	%o2
	edge8n	%g4,	%i7,	%o6
	andcc	%i5,	%g3,	%g1
	edge8l	%g7,	%o7,	%l6
	and	%o3,	%o5,	%i3
	or	%o4,	%l2,	%g5
	sth	%i4,	[%l7 + 0x3A]
	udiv	%l3,	0x0DD1,	%o1
	movne	%xcc,	%i1,	%i6
	ld	[%l7 + 0x48],	%f24
	ldub	[%l7 + 0x46],	%l0
	udivcc	%i2,	0x0644,	%i0
	movre	%l4,	0x137,	%l5
	array16	%g2,	%l1,	%g6
	smul	%o2,	%o0,	%g4
	sdivx	%i7,	0x1374,	%o6
	umulcc	%i5,	0x038B,	%g3
	smulcc	%g1,	0x189D,	%g7
	fmovsleu	%icc,	%f5,	%f11
	for	%f26,	%f22,	%f16
	fcmpgt16	%f0,	%f22,	%o7
	fmovrdgz	%l6,	%f20,	%f12
	udivcc	%o3,	0x177E,	%o5
	fpadd16	%f18,	%f6,	%f10
	andcc	%i3,	0x19DB,	%o4
	fmovdcs	%icc,	%f29,	%f26
	ldsb	[%l7 + 0x65],	%l2
	fmuld8ulx16	%f16,	%f18,	%f12
	fors	%f18,	%f0,	%f21
	srax	%g5,	%i4,	%o1
	fnot1s	%f2,	%f10
	fmovde	%xcc,	%f18,	%f27
	movn	%xcc,	%l3,	%i1
	udivcc	%i6,	0x1693,	%i2
	orncc	%i0,	0x1C68,	%l0
	movl	%xcc,	%l4,	%l5
	fmovrsgez	%l1,	%f10,	%f29
	xnorcc	%g2,	%g6,	%o2
	sll	%g4,	0x01,	%o0
	mulscc	%o6,	0x1585,	%i5
	fnors	%f26,	%f24,	%f15
	edge32	%i7,	%g1,	%g7
	sll	%o7,	0x0E,	%g3
	add	%l6,	%o3,	%o5
	movge	%xcc,	%i3,	%l2
	fmovsvs	%xcc,	%f18,	%f1
	stx	%o4,	[%l7 + 0x58]
	sra	%i4,	0x11,	%g5
	ldsw	[%l7 + 0x68],	%o1
	edge32l	%i1,	%l3,	%i2
	movg	%xcc,	%i0,	%l0
	movvc	%xcc,	%i6,	%l4
	smulcc	%l1,	%l5,	%g6
	fpadd16s	%f24,	%f14,	%f27
	srl	%g2,	0x10,	%o2
	sdivx	%o0,	0x1A27,	%o6
	sub	%g4,	0x0DE5,	%i5
	subccc	%i7,	%g1,	%g7
	restore %o7, %g3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o3,	0x05C9,	%o5
	fmovsgu	%icc,	%f22,	%f15
	ldsb	[%l7 + 0x47],	%i3
	subcc	%o4,	0x10F8,	%i4
	fexpand	%f10,	%f30
	pdist	%f4,	%f10,	%f14
	fandnot2s	%f13,	%f0,	%f20
	andcc	%g5,	%o1,	%l2
	edge8n	%i1,	%i2,	%l3
	array16	%i0,	%l0,	%i6
	edge8l	%l4,	%l5,	%g6
	sdivx	%g2,	0x00A8,	%l1
	ld	[%l7 + 0x38],	%f25
	subc	%o2,	0x0FC1,	%o0
	or	%o6,	0x1A89,	%i5
	ldub	[%l7 + 0x35],	%i7
	ldsb	[%l7 + 0x7D],	%g1
	fmovrdlez	%g4,	%f28,	%f16
	movpos	%icc,	%o7,	%g7
	fmovdne	%xcc,	%f27,	%f19
	lduh	[%l7 + 0x5E],	%g3
	sth	%l6,	[%l7 + 0x76]
	movre	%o3,	%i3,	%o4
	fcmpne32	%f8,	%f24,	%o5
	movvc	%icc,	%i4,	%o1
	xorcc	%g5,	0x1538,	%l2
	sll	%i1,	0x06,	%i2
	std	%f10,	[%l7 + 0x40]
	fpsub32s	%f20,	%f15,	%f14
	for	%f2,	%f14,	%f12
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	sth	%l4,	[%l7 + 0x74]
	edge32l	%i6,	%l5,	%g6
	xnor	%l1,	0x1F80,	%o2
	fmovsn	%icc,	%f30,	%f21
	addc	%g2,	%o0,	%i5
	edge32n	%i7,	%o6,	%g4
	movgu	%icc,	%g1,	%g7
	or	%o7,	%g3,	%l6
	addc	%i3,	%o4,	%o5
	smulcc	%i4,	0x1C19,	%o1
	fmovdcc	%xcc,	%f5,	%f22
	array16	%o3,	%g5,	%l2
	subc	%i2,	0x03EC,	%i0
	subccc	%i1,	0x151F,	%l3
	movcc	%icc,	%l4,	%i6
	edge16l	%l5,	%l0,	%l1
	srax	%o2,	0x07,	%g2
	fpsub32	%f24,	%f22,	%f30
	srlx	%g6,	0x01,	%o0
	ldub	[%l7 + 0x1E],	%i7
	add	%o6,	%g4,	%i5
	sethi	0x132C,	%g1
	edge8n	%o7,	%g3,	%l6
	smulcc	%i3,	0x11C7,	%g7
	mova	%icc,	%o5,	%o4
	addccc	%o1,	0x0E59,	%o3
	fmovrslz	%i4,	%f8,	%f21
	sll	%l2,	0x00,	%g5
	alignaddrl	%i2,	%i1,	%l3
	sdivcc	%l4,	0x1C00,	%i6
	sdiv	%i0,	0x1DDC,	%l0
	fsrc2s	%f24,	%f4
	fmuld8ulx16	%f24,	%f30,	%f20
	array8	%l1,	%l5,	%g2
	fmovde	%xcc,	%f13,	%f12
	sdivcc	%o2,	0x1C67,	%g6
	or	%i7,	0x08E7,	%o6
	fmovdn	%icc,	%f4,	%f4
	sllx	%g4,	0x0F,	%o0
	fmovsn	%xcc,	%f2,	%f25
	nop
	set	0x4C, %g3
	lduh	[%l7 + %g3],	%g1
	stb	%i5,	[%l7 + 0x58]
	stb	%g3,	[%l7 + 0x54]
	movcs	%xcc,	%o7,	%l6
	xor	%g7,	%o5,	%o4
	fcmpgt16	%f12,	%f24,	%o1
	fexpand	%f24,	%f10
	fpsub32	%f6,	%f6,	%f14
	fornot2	%f20,	%f8,	%f18
	udivx	%o3,	0x047F,	%i4
	ldub	[%l7 + 0x49],	%i3
	sethi	0x012C,	%g5
	movne	%icc,	%i2,	%l2
	movcc	%icc,	%l3,	%i1
	array8	%i6,	%i0,	%l4
	movrne	%l1,	0x3E0,	%l0
	fsrc1s	%f21,	%f21
	movg	%icc,	%g2,	%o2
	pdist	%f0,	%f22,	%f16
	movrlez	%l5,	%i7,	%o6
	sdiv	%g4,	0x01DB,	%g6
	ldub	[%l7 + 0x08],	%o0
	fpadd16s	%f30,	%f2,	%f17
	edge32ln	%i5,	%g3,	%g1
	orn	%o7,	%g7,	%o5
	array16	%l6,	%o1,	%o4
	sdivx	%i4,	0x1476,	%o3
	mulscc	%i3,	0x17E8,	%g5
	movneg	%icc,	%l2,	%l3
	edge16l	%i1,	%i6,	%i0
	mulx	%l4,	%i2,	%l0
	pdist	%f12,	%f28,	%f24
	movrgez	%l1,	%o2,	%l5
	srl	%i7,	0x08,	%g2
	mova	%icc,	%o6,	%g4
	sth	%o0,	[%l7 + 0x0E]
	fmovsvs	%icc,	%f30,	%f5
	movneg	%xcc,	%i5,	%g3
	restore %g1, 0x0E41, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g6,	0x184,	%g7
	fornot2s	%f30,	%f13,	%f19
	sethi	0x19A5,	%o5
	movl	%icc,	%l6,	%o1
	st	%f18,	[%l7 + 0x1C]
	subc	%o4,	0x1CB6,	%o3
	edge16	%i4,	%g5,	%i3
	edge32l	%l2,	%l3,	%i6
	fandnot1	%f0,	%f28,	%f28
	edge16ln	%i0,	%l4,	%i1
	sra	%i2,	%l0,	%l1
	or	%o2,	0x1DF6,	%i7
	array32	%l5,	%g2,	%g4
	edge32	%o0,	%o6,	%i5
	lduw	[%l7 + 0x08],	%g3
	movge	%xcc,	%o7,	%g6
	umulcc	%g1,	%g7,	%o5
	andcc	%l6,	%o4,	%o3
	movrlez	%i4,	0x130,	%g5
	sir	0x165E
	fsrc2s	%f8,	%f13
	mulx	%o1,	0x1089,	%i3
	movcc	%xcc,	%l2,	%l3
	movrgz	%i6,	%i0,	%i1
	ldub	[%l7 + 0x65],	%i2
	fcmpne16	%f16,	%f30,	%l4
	alignaddr	%l1,	%o2,	%l0
	fmovdge	%xcc,	%f1,	%f29
	fnegd	%f10,	%f22
	xor	%l5,	0x1B2B,	%i7
	ldd	[%l7 + 0x18],	%f18
	or	%g4,	%g2,	%o6
	xor	%i5,	%o0,	%o7
	umulcc	%g3,	0x0641,	%g1
	mulx	%g6,	0x14AC,	%g7
	or	%o5,	%l6,	%o3
	sdiv	%o4,	0x077A,	%g5
	movrlz	%i4,	0x357,	%i3
	movrlz	%o1,	%l2,	%i6
	sdivx	%i0,	0x0D16,	%l3
	sdivcc	%i2,	0x0A6D,	%i1
	fmovsgu	%xcc,	%f26,	%f17
	edge32l	%l4,	%l1,	%o2
	srl	%l5,	0x1A,	%l0
	umul	%i7,	%g2,	%o6
	lduh	[%l7 + 0x56],	%g4
	smul	%i5,	%o7,	%g3
	xnorcc	%g1,	%o0,	%g7
	edge8l	%g6,	%l6,	%o5
	movcc	%icc,	%o4,	%o3
	umul	%g5,	0x074C,	%i3
	ldd	[%l7 + 0x70],	%i4
	fzero	%f6
	lduh	[%l7 + 0x0E],	%o1
	fcmpeq16	%f2,	%f2,	%l2
	edge16n	%i6,	%l3,	%i2
	stx	%i0,	[%l7 + 0x60]
	sth	%i1,	[%l7 + 0x42]
	movg	%icc,	%l1,	%l4
	array8	%o2,	%l0,	%l5
	stw	%i7,	[%l7 + 0x08]
	andncc	%o6,	%g2,	%g4
	fmovde	%xcc,	%f14,	%f20
	edge16	%i5,	%o7,	%g3
	fmovrslz	%g1,	%f22,	%f19
	edge32ln	%o0,	%g6,	%g7
	ldx	[%l7 + 0x28],	%l6
	movrlz	%o4,	%o3,	%g5
	stw	%o5,	[%l7 + 0x34]
	sll	%i3,	0x1F,	%o1
	fmovdge	%icc,	%f6,	%f3
	ldsb	[%l7 + 0x34],	%i4
	save %l2, 0x0AE1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i2,	0x10A5,	%l3
	fmovsge	%xcc,	%f12,	%f11
	movcs	%icc,	%i0,	%l1
	fmovsgu	%icc,	%f17,	%f12
	andncc	%l4,	%o2,	%i1
	ldd	[%l7 + 0x30],	%l0
	sllx	%l5,	0x10,	%o6
	stw	%g2,	[%l7 + 0x44]
	stb	%i7,	[%l7 + 0x7F]
	fmovsvc	%icc,	%f14,	%f13
	orcc	%i5,	0x1338,	%o7
	stb	%g4,	[%l7 + 0x0F]
	edge32ln	%g3,	%o0,	%g6
	fmovscc	%icc,	%f2,	%f21
	and	%g1,	%l6,	%g7
	udiv	%o4,	0x09AB,	%o3
	edge8	%o5,	%i3,	%g5
	ldx	[%l7 + 0x40],	%o1
	nop
	set	0x5A, %o4
	ldsh	[%l7 + %o4],	%i4
	edge32	%i6,	%l2,	%i2
	fcmps	%fcc0,	%f27,	%f8
	fmovsge	%xcc,	%f28,	%f17
	mova	%xcc,	%i0,	%l1
	movgu	%xcc,	%l3,	%o2
	sdivcc	%l4,	0x0E93,	%l0
	stx	%i1,	[%l7 + 0x40]
	and	%l5,	%g2,	%o6
	array16	%i7,	%i5,	%o7
	st	%f30,	[%l7 + 0x08]
	fmul8ulx16	%f28,	%f14,	%f18
	movne	%icc,	%g3,	%o0
	subccc	%g6,	%g4,	%g1
	umul	%l6,	%g7,	%o3
	andcc	%o4,	0x18CE,	%i3
	ldd	[%l7 + 0x48],	%g4
	save %o5, %i4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l2,	0x1D15,	%o1
	subcc	%i2,	%i0,	%l3
	fnot2s	%f24,	%f13
	fmovrse	%o2,	%f5,	%f10
	fpadd16s	%f22,	%f27,	%f30
	movne	%icc,	%l1,	%l0
	stx	%l4,	[%l7 + 0x70]
	andn	%i1,	0x145F,	%g2
	udivcc	%l5,	0x1ADA,	%o6
	fmovrdlez	%i7,	%f12,	%f10
	edge8l	%o7,	%g3,	%i5
	movpos	%icc,	%g6,	%o0
	mulscc	%g4,	0x046C,	%l6
	fmuld8sux16	%f9,	%f8,	%f24
	movrne	%g1,	0x0E1,	%g7
	udivx	%o4,	0x0DA6,	%o3
	sir	0x1405
	addcc	%i3,	%o5,	%i4
	sth	%g5,	[%l7 + 0x1A]
	subcc	%l2,	%i6,	%o1
	movcs	%xcc,	%i2,	%i0
	edge16n	%l3,	%l1,	%l0
	fmuld8ulx16	%f21,	%f6,	%f30
	ldub	[%l7 + 0x78],	%l4
	mova	%icc,	%i1,	%g2
	xorcc	%l5,	0x03D7,	%o6
	xnorcc	%i7,	0x0B0A,	%o2
	fzeros	%f19
	edge32n	%g3,	%i5,	%o7
	xorcc	%g6,	%g4,	%l6
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%g0
	sub	%g7,	0x01DD,	%o0
	movgu	%xcc,	%o4,	%o3
	pdist	%f4,	%f6,	%f14
	fpack32	%f18,	%f12,	%f30
	fandnot2s	%f28,	%f12,	%f21
	sth	%i3,	[%l7 + 0x22]
	xor	%o5,	0x19BF,	%g5
	movgu	%icc,	%l2,	%i4
	ld	[%l7 + 0x0C],	%f6
	lduh	[%l7 + 0x3A],	%i6
	andncc	%i2,	%o1,	%l3
	fmovdneg	%xcc,	%f9,	%f10
	movge	%icc,	%l1,	%l0
	ldd	[%l7 + 0x10],	%i0
	add	%l4,	%i1,	%g2
	movpos	%icc,	%o6,	%i7
	andn	%l5,	0x0537,	%g3
	fmovdle	%xcc,	%f18,	%f29
	srl	%i5,	%o7,	%g6
	lduw	[%l7 + 0x5C],	%g4
	srl	%l6,	%o2,	%g1
	fcmple16	%f16,	%f12,	%g7
	sdivcc	%o0,	0x106A,	%o4
	alignaddrl	%i3,	%o3,	%o5
	stx	%g5,	[%l7 + 0x30]
	movcc	%xcc,	%l2,	%i4
	movge	%icc,	%i2,	%o1
	alignaddrl	%l3,	%i6,	%l0
	movcs	%icc,	%l1,	%l4
	lduw	[%l7 + 0x08],	%i1
	fmovrslez	%i0,	%f13,	%f31
	sth	%g2,	[%l7 + 0x2C]
	movle	%xcc,	%o6,	%l5
	edge32n	%g3,	%i7,	%o7
	movrlz	%g6,	0x266,	%g4
	fornot2	%f0,	%f12,	%f16
	addc	%l6,	%o2,	%g1
	save %g7, %o0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f2,	%f31,	%f22
	sra	%i3,	%o3,	%i5
	movle	%xcc,	%g5,	%o5
	fandnot1s	%f0,	%f22,	%f8
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%f6
	fornot1	%f20,	%f10,	%f22
	movl	%icc,	%l2,	%i4
	movge	%icc,	%o1,	%i2
	xnor	%l3,	0x0B0F,	%l0
	faligndata	%f24,	%f12,	%f10
	sub	%i6,	%l4,	%l1
	fmovsl	%xcc,	%f3,	%f14
	mova	%icc,	%i0,	%g2
	smulcc	%i1,	%l5,	%o6
	fpadd16s	%f2,	%f0,	%f15
	movcs	%icc,	%g3,	%i7
	addcc	%o7,	%g4,	%g6
	movcc	%xcc,	%l6,	%g1
	fpadd32s	%f22,	%f12,	%f10
	ld	[%l7 + 0x30],	%f25
	array32	%g7,	%o0,	%o2
	fmovsn	%xcc,	%f21,	%f17
	addc	%i3,	%o4,	%i5
	ldsw	[%l7 + 0x68],	%o3
	sdiv	%g5,	0x1080,	%o5
	lduh	[%l7 + 0x6E],	%l2
	movre	%o1,	%i4,	%l3
	sdivcc	%l0,	0x0B2C,	%i2
	movcs	%xcc,	%i6,	%l1
	andncc	%i0,	%l4,	%g2
	umul	%i1,	0x0442,	%l5
	fpsub16	%f22,	%f12,	%f20
	fands	%f18,	%f18,	%f24
	movvc	%icc,	%g3,	%o6
	and	%o7,	%g4,	%g6
	fone	%f26
	smul	%i7,	0x131C,	%g1
	stb	%g7,	[%l7 + 0x0D]
	srlx	%o0,	0x0A,	%o2
	fmul8x16au	%f31,	%f2,	%f2
	ldd	[%l7 + 0x78],	%f24
	andncc	%l6,	%o4,	%i5
	movcc	%xcc,	%i3,	%g5
	fnands	%f4,	%f1,	%f18
	edge8ln	%o3,	%l2,	%o1
	edge8l	%o5,	%i4,	%l3
	edge8	%i2,	%l0,	%l1
	addc	%i0,	0x0CAD,	%i6
	lduh	[%l7 + 0x0A],	%g2
	umulcc	%l4,	%l5,	%i1
	orcc	%o6,	%o7,	%g4
	edge16	%g6,	%g3,	%i7
	andn	%g7,	%g1,	%o2
	st	%f29,	[%l7 + 0x20]
	ldsw	[%l7 + 0x64],	%l6
	andncc	%o0,	%i5,	%i3
	array16	%o4,	%g5,	%o3
	array8	%l2,	%o1,	%o5
	movrlez	%l3,	0x04F,	%i2
	fcmpd	%fcc3,	%f22,	%f18
	movre	%l0,	0x2E9,	%i4
	andn	%i0,	0x138D,	%i6
	movleu	%xcc,	%l1,	%l4
	sir	0x16F6
	fmuld8ulx16	%f22,	%f31,	%f12
	srax	%g2,	0x12,	%l5
	xnorcc	%i1,	%o6,	%g4
	subc	%o7,	%g6,	%i7
	fcmple32	%f30,	%f4,	%g7
	srlx	%g3,	0x06,	%o2
	edge8ln	%g1,	%l6,	%i5
	ldsh	[%l7 + 0x5A],	%o0
	fands	%f29,	%f11,	%f4
	fabsd	%f26,	%f14
	sll	%o4,	%i3,	%o3
	umulcc	%g5,	%o1,	%l2
	ldsb	[%l7 + 0x10],	%o5
	fnors	%f28,	%f3,	%f30
	mova	%xcc,	%l3,	%l0
	stx	%i4,	[%l7 + 0x30]
	addc	%i0,	%i2,	%l1
	or	%l4,	%i6,	%l5
	fxor	%f10,	%f14,	%f28
	ldsb	[%l7 + 0x7E],	%i1
	movneg	%xcc,	%g2,	%g4
	movle	%icc,	%o7,	%g6
	srl	%o6,	0x06,	%i7
	sir	0x0DD2
	lduh	[%l7 + 0x2E],	%g7
	st	%f15,	[%l7 + 0x38]
	ldx	[%l7 + 0x28],	%g3
	movrlz	%g1,	0x3FF,	%l6
	ld	[%l7 + 0x14],	%f14
	movneg	%xcc,	%o2,	%i5
	edge8l	%o0,	%o4,	%i3
	sir	0x16AA
	ldub	[%l7 + 0x66],	%o3
	fmovrslez	%g5,	%f29,	%f18
	edge8n	%l2,	%o1,	%l3
	fmovspos	%xcc,	%f22,	%f26
	edge32l	%l0,	%o5,	%i0
	and	%i2,	%i4,	%l1
	edge8l	%i6,	%l5,	%l4
	edge32l	%g2,	%g4,	%i1
	smulcc	%o7,	0x0D22,	%o6
	ldd	[%l7 + 0x38],	%g6
	fmovsvc	%xcc,	%f9,	%f25
	movleu	%icc,	%g7,	%g3
	fmovsle	%xcc,	%f1,	%f26
	movrlz	%i7,	0x355,	%g1
	srl	%o2,	%l6,	%o0
	xor	%o4,	%i3,	%i5
	edge16ln	%g5,	%l2,	%o1
	subcc	%o3,	%l3,	%l0
	ldsb	[%l7 + 0x59],	%o5
	sethi	0x1A18,	%i0
	sdiv	%i2,	0x12B6,	%i4
	orn	%l1,	0x1AC9,	%i6
	fmovrse	%l4,	%f3,	%f28
	movrlez	%g2,	%g4,	%l5
	bshuffle	%f2,	%f10,	%f30
	subcc	%i1,	%o6,	%o7
	udivx	%g7,	0x05C9,	%g6
	edge8ln	%i7,	%g3,	%g1
	fcmpne16	%f14,	%f26,	%o2
	subcc	%l6,	0x05F8,	%o4
	udiv	%o0,	0x1F5C,	%i3
	xnorcc	%i5,	0x00E8,	%l2
	edge32ln	%o1,	%g5,	%l3
	edge16n	%l0,	%o5,	%o3
	orn	%i0,	%i2,	%i4
	andncc	%i6,	%l1,	%l4
	lduh	[%l7 + 0x62],	%g2
	mova	%xcc,	%l5,	%g4
	fmovrdgez	%o6,	%f8,	%f30
	movne	%icc,	%o7,	%i1
	xnorcc	%g6,	%g7,	%i7
	edge8ln	%g1,	%o2,	%l6
	fnot1s	%f11,	%f12
	fors	%f11,	%f30,	%f21
	fmovrdne	%g3,	%f8,	%f12
	subccc	%o4,	0x1DA6,	%o0
	fmovrde	%i5,	%f6,	%f14
	sdivcc	%l2,	0x052C,	%o1
	fxnor	%f10,	%f20,	%f4
	udivcc	%i3,	0x147D,	%l3
	alignaddr	%g5,	%o5,	%l0
	srlx	%i0,	0x08,	%o3
	edge32ln	%i4,	%i2,	%l1
	fmul8sux16	%f8,	%f10,	%f26
	lduw	[%l7 + 0x54],	%l4
	save %i6, 0x056F, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f15,	%f10,	%f29
	fcmple16	%f10,	%f12,	%g4
	mulx	%l5,	0x1B7B,	%o6
	srax	%i1,	0x0F,	%o7
	movrgez	%g6,	0x3F0,	%i7
	movn	%icc,	%g7,	%o2
	edge16n	%g1,	%l6,	%g3
	fmovdg	%icc,	%f10,	%f26
	stx	%o4,	[%l7 + 0x10]
	edge32l	%o0,	%i5,	%l2
	sir	0x0C38
	movcc	%icc,	%i3,	%o1
	movn	%xcc,	%g5,	%l3
	stx	%l0,	[%l7 + 0x28]
	edge8ln	%o5,	%i0,	%o3
	fandnot1s	%f30,	%f11,	%f2
	mulscc	%i2,	%l1,	%l4
	movge	%xcc,	%i6,	%i4
	lduw	[%l7 + 0x4C],	%g2
	nop
	set	0x4F, %l3
	ldsb	[%l7 + %l3],	%g4
	ld	[%l7 + 0x6C],	%f15
	movgu	%xcc,	%o6,	%l5
	edge8ln	%i1,	%g6,	%i7
	fcmpeq32	%f16,	%f0,	%o7
	ldsb	[%l7 + 0x0C],	%o2
	movrgz	%g1,	0x379,	%l6
	ld	[%l7 + 0x50],	%f22
	sth	%g7,	[%l7 + 0x7E]
	smul	%o4,	%o0,	%i5
	edge16	%g3,	%l2,	%i3
	fzero	%f30
	edge16	%g5,	%l3,	%o1
	stb	%l0,	[%l7 + 0x76]
	addcc	%o5,	%i0,	%i2
	movleu	%icc,	%o3,	%l4
	subccc	%i6,	%i4,	%g2
	andcc	%l1,	0x0B08,	%o6
	std	%f10,	[%l7 + 0x50]
	lduw	[%l7 + 0x10],	%l5
	movpos	%xcc,	%i1,	%g4
	fmovsgu	%xcc,	%f30,	%f6
	smul	%i7,	%o7,	%g6
	edge8n	%g1,	%o2,	%g7
	edge32	%o4,	%o0,	%l6
	movneg	%icc,	%i5,	%g3
	fmovdvc	%icc,	%f26,	%f29
	ldd	[%l7 + 0x08],	%f6
	array16	%l2,	%g5,	%l3
	smulcc	%i3,	%o1,	%o5
	srl	%i0,	0x1F,	%i2
	movneg	%xcc,	%l0,	%o3
	fone	%f16
	edge8ln	%l4,	%i6,	%g2
	movrgz	%l1,	0x103,	%o6
	movn	%icc,	%i4,	%l5
	std	%f22,	[%l7 + 0x50]
	edge32l	%i1,	%i7,	%g4
	fmovrsne	%g6,	%f3,	%f5
	faligndata	%f22,	%f8,	%f20
	sdivx	%o7,	0x07D1,	%g1
	edge8	%o2,	%g7,	%o4
	lduh	[%l7 + 0x14],	%l6
	sra	%o0,	0x10,	%i5
	fmovdvs	%xcc,	%f29,	%f28
	udivcc	%l2,	0x147B,	%g5
	movrgez	%l3,	%g3,	%i3
	movvs	%xcc,	%o1,	%i0
	st	%f2,	[%l7 + 0x64]
	stx	%o5,	[%l7 + 0x60]
	or	%i2,	%o3,	%l4
	srlx	%i6,	0x17,	%g2
	movcc	%xcc,	%l0,	%o6
	umul	%l1,	0x0CDA,	%i4
	edge8n	%l5,	%i7,	%i1
	movcc	%xcc,	%g6,	%o7
	udivx	%g4,	0x025C,	%g1
	edge32ln	%g7,	%o4,	%l6
	movpos	%xcc,	%o2,	%o0
	fpsub32	%f30,	%f28,	%f24
	st	%f21,	[%l7 + 0x28]
	andncc	%i5,	%l2,	%l3
	smul	%g3,	0x12AF,	%i3
	edge16	%o1,	%i0,	%g5
	edge8ln	%o5,	%o3,	%l4
	fcmped	%fcc2,	%f4,	%f28
	fmovrslez	%i2,	%f17,	%f6
	std	%f24,	[%l7 + 0x40]
	array32	%i6,	%g2,	%o6
	subcc	%l0,	%l1,	%i4
	movrlz	%l5,	%i7,	%g6
	lduh	[%l7 + 0x20],	%i1
	fcmpd	%fcc3,	%f4,	%f30
	umulcc	%g4,	%g1,	%g7
	sdivx	%o7,	0x1EA9,	%l6
	subccc	%o4,	0x111A,	%o0
	movcc	%xcc,	%i5,	%o2
	sllx	%l2,	0x00,	%l3
	movleu	%xcc,	%g3,	%i3
	sdivx	%o1,	0x02F1,	%g5
	addc	%i0,	%o3,	%o5
	subccc	%i2,	0x17CF,	%i6
	fmovdl	%icc,	%f28,	%f22
	fpsub32s	%f23,	%f3,	%f21
	udivcc	%l4,	0x10B3,	%o6
	srl	%l0,	0x10,	%l1
	smul	%g2,	0x0732,	%i4
	subccc	%i7,	%l5,	%g6
	fmovrsne	%g4,	%f20,	%f29
	ldsh	[%l7 + 0x30],	%i1
	alignaddrl	%g1,	%g7,	%l6
	edge16l	%o7,	%o4,	%o0
	andncc	%o2,	%l2,	%i5
	xor	%l3,	%g3,	%o1
	edge32l	%g5,	%i3,	%i0
	sth	%o3,	[%l7 + 0x58]
	smul	%o5,	%i6,	%l4
	ldd	[%l7 + 0x30],	%i2
	edge32	%l0,	%l1,	%o6
	movneg	%xcc,	%g2,	%i4
	edge8ln	%l5,	%g6,	%g4
	mulx	%i7,	0x1F20,	%g1
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	smulcc	%l6,	0x0958,	%o4
	xnor	%o7,	0x12B0,	%o0
	ldd	[%l7 + 0x28],	%o2
	lduw	[%l7 + 0x48],	%i5
	andncc	%l2,	%g3,	%l3
	fmovdgu	%icc,	%f12,	%f27
	movvs	%xcc,	%o1,	%g5
	fmovdgu	%xcc,	%f23,	%f26
	orcc	%i0,	0x00FF,	%i3
	edge8	%o3,	%o5,	%i6
	movrne	%i2,	0x3AE,	%l0
	fcmpgt32	%f28,	%f6,	%l1
	mulx	%l4,	0x0B67,	%o6
	movpos	%icc,	%g2,	%i4
	andcc	%l5,	0x1F52,	%g6
	edge8ln	%i7,	%g4,	%i1
	fandnot1s	%f16,	%f24,	%f22
	andncc	%g7,	%l6,	%o4
	xnor	%g1,	%o0,	%o2
	stw	%o7,	[%l7 + 0x5C]
	subc	%i5,	%g3,	%l3
	ldsw	[%l7 + 0x70],	%l2
	movge	%icc,	%o1,	%i0
	sethi	0x12BF,	%g5
	srl	%i3,	0x10,	%o5
	sub	%o3,	0x1AF1,	%i2
	sir	0x0FBC
	fsrc1s	%f22,	%f1
	srax	%i6,	%l0,	%l4
	ldd	[%l7 + 0x50],	%l0
	sll	%o6,	0x1A,	%g2
	stx	%i4,	[%l7 + 0x50]
	fmovdcs	%icc,	%f30,	%f14
	stx	%g6,	[%l7 + 0x38]
	addcc	%i7,	%g4,	%i1
	sra	%g7,	%l5,	%l6
	movgu	%icc,	%g1,	%o4
	fmovsa	%icc,	%f18,	%f7
	sethi	0x0D95,	%o2
	andncc	%o7,	%o0,	%i5
	fmovsneg	%icc,	%f24,	%f19
	fandnot1s	%f1,	%f29,	%f19
	array16	%l3,	%g3,	%o1
	xor	%l2,	0x1E86,	%g5
	ldsb	[%l7 + 0x39],	%i3
	edge32l	%i0,	%o3,	%o5
	addccc	%i6,	0x18AB,	%l0
	ldd	[%l7 + 0x10],	%i2
	movne	%icc,	%l4,	%o6
	for	%f30,	%f30,	%f2
	mulx	%l1,	%i4,	%g6
	edge32n	%i7,	%g2,	%i1
	fmovdl	%xcc,	%f2,	%f29
	lduh	[%l7 + 0x30],	%g7
	srax	%l5,	%g4,	%g1
	movrne	%o4,	%o2,	%o7
	sub	%o0,	%i5,	%l3
	lduw	[%l7 + 0x7C],	%l6
	ldd	[%l7 + 0x60],	%g2
	fmovdn	%xcc,	%f16,	%f23
	st	%f2,	[%l7 + 0x7C]
	orncc	%l2,	%g5,	%o1
	movle	%icc,	%i0,	%o3
	sub	%i3,	%i6,	%o5
	fmovdcs	%icc,	%f15,	%f14
	andn	%l0,	0x0519,	%l4
	subccc	%i2,	0x1246,	%l1
	movle	%xcc,	%i4,	%g6
	fmovdle	%xcc,	%f14,	%f2
	sub	%i7,	%g2,	%o6
	lduh	[%l7 + 0x14],	%g7
	fxnor	%f0,	%f6,	%f16
	edge32	%l5,	%i1,	%g4
	sethi	0x0EC2,	%g1
	umulcc	%o4,	0x0A65,	%o2
	save %o0, 0x0D32, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i5,	0x08A,	%l6
	fpsub32	%f30,	%f10,	%f28
	alignaddrl	%g3,	%l3,	%l2
	ldd	[%l7 + 0x50],	%f10
	fmul8x16al	%f21,	%f12,	%f26
	movvs	%xcc,	%o1,	%g5
	smulcc	%o3,	%i3,	%i0
	movrlez	%o5,	0x10E,	%l0
	fpack32	%f26,	%f8,	%f4
	andn	%l4,	0x164F,	%i2
	udivcc	%l1,	0x16EE,	%i6
	edge16	%i4,	%i7,	%g2
	sll	%g6,	%g7,	%o6
	alignaddr	%l5,	%g4,	%i1
	movvs	%xcc,	%g1,	%o2
	std	%f18,	[%l7 + 0x08]
	array8	%o0,	%o7,	%i5
	ldsb	[%l7 + 0x53],	%l6
	umulcc	%o4,	0x1F72,	%l3
	move	%icc,	%g3,	%l2
	array32	%o1,	%o3,	%g5
	movrlz	%i3,	0x24B,	%i0
	movcs	%icc,	%o5,	%l0
	nop
	set	0x28, %g2
	lduw	[%l7 + %g2],	%i2
	movrgz	%l4,	0x280,	%l1
	movcs	%xcc,	%i6,	%i4
	fmovsneg	%icc,	%f18,	%f4
	fnot2	%f16,	%f8
	movl	%icc,	%i7,	%g2
	movvs	%icc,	%g6,	%g7
	movvc	%xcc,	%l5,	%g4
	addccc	%i1,	%o6,	%g1
	sethi	0x1D9F,	%o0
	movrgez	%o7,	%i5,	%o2
	ldub	[%l7 + 0x4D],	%l6
	nop
	set	0x35, %i1
	stb	%l3,	[%l7 + %i1]
	edge32	%o4,	%g3,	%o1
	xnorcc	%o3,	%l2,	%g5
	stw	%i0,	[%l7 + 0x24]
	udivx	%o5,	0x02C8,	%l0
	alignaddrl	%i3,	%l4,	%i2
	smul	%l1,	0x0272,	%i6
	andncc	%i7,	%g2,	%g6
	ldd	[%l7 + 0x20],	%g6
	movne	%icc,	%i4,	%l5
	fmovrsgez	%g4,	%f22,	%f11
	movpos	%xcc,	%i1,	%g1
	sdiv	%o0,	0x0CC9,	%o7
	move	%icc,	%o6,	%i5
	edge32	%l6,	%o2,	%o4
	mova	%xcc,	%l3,	%o1
	udivx	%g3,	0x1CA0,	%l2
	mulscc	%g5,	%o3,	%i0
	fmovspos	%xcc,	%f16,	%f19
	xorcc	%o5,	0x1854,	%i3
	orncc	%l4,	0x0DCB,	%l0
	movneg	%xcc,	%i2,	%i6
	subccc	%l1,	%i7,	%g6
	srl	%g7,	%i4,	%l5
	ldsw	[%l7 + 0x48],	%g2
	udivx	%i1,	0x04A2,	%g1
	edge32	%o0,	%g4,	%o6
	move	%icc,	%i5,	%l6
	add	%o2,	%o4,	%o7
	fandnot2s	%f11,	%f1,	%f4
	fandnot2	%f22,	%f0,	%f12
	stb	%o1,	[%l7 + 0x65]
	fmovsneg	%xcc,	%f6,	%f16
	or	%l3,	%l2,	%g3
	edge32l	%g5,	%i0,	%o5
	edge8ln	%o3,	%i3,	%l4
	or	%i2,	%l0,	%i6
	stx	%l1,	[%l7 + 0x20]
	sdivcc	%i7,	0x1CDD,	%g7
	nop
	set	0x6E, %g6
	lduh	[%l7 + %g6],	%g6
	edge32l	%i4,	%g2,	%l5
	umul	%g1,	0x18F7,	%i1
	sir	0x1C3E
	fmovdl	%xcc,	%f14,	%f6
	add	%o0,	%o6,	%g4
	fmovdleu	%icc,	%f26,	%f19
	stx	%l6,	[%l7 + 0x28]
	sdiv	%o2,	0x0C8F,	%o4
	xorcc	%i5,	0x1A34,	%o1
	ldx	[%l7 + 0x58],	%o7
	udivx	%l3,	0x09CE,	%g3
	movle	%xcc,	%l2,	%i0
	edge8	%o5,	%g5,	%i3
	edge16l	%o3,	%i2,	%l4
	ldx	[%l7 + 0x08],	%l0
	fmovdvs	%icc,	%f19,	%f0
	fmovrdlez	%i6,	%f10,	%f20
	array32	%l1,	%i7,	%g7
	or	%g6,	0x0DA9,	%g2
	srax	%l5,	0x07,	%i4
	ldsb	[%l7 + 0x2C],	%g1
	mulscc	%o0,	0x0800,	%i1
	fmuld8ulx16	%f9,	%f11,	%f10
	fzero	%f0
	movre	%o6,	%g4,	%o2
	addcc	%o4,	0x1851,	%l6
	movcs	%xcc,	%i5,	%o7
	fsrc1	%f0,	%f24
	orcc	%l3,	0x0DC0,	%o1
	sdivx	%l2,	0x00D7,	%g3
	edge8	%i0,	%o5,	%i3
	andncc	%g5,	%o3,	%i2
	smul	%l0,	%l4,	%l1
	fone	%f22
	ldsw	[%l7 + 0x3C],	%i7
	and	%i6,	0x083D,	%g6
	orncc	%g7,	0x0B81,	%g2
	ldd	[%l7 + 0x20],	%i4
	mulscc	%g1,	0x048F,	%l5
	mulscc	%o0,	%o6,	%i1
	movvs	%icc,	%g4,	%o2
	xor	%l6,	0x0E44,	%i5
	move	%xcc,	%o7,	%l3
	movrgez	%o1,	0x1B1,	%o4
	movgu	%icc,	%l2,	%i0
	fcmple32	%f12,	%f4,	%g3
	fcmped	%fcc0,	%f6,	%f10
	andncc	%o5,	%g5,	%o3
	edge16n	%i3,	%i2,	%l4
	movleu	%icc,	%l1,	%i7
	ldsb	[%l7 + 0x13],	%l0
	std	%f30,	[%l7 + 0x68]
	or	%i6,	0x09F9,	%g7
	udiv	%g6,	0x05EB,	%g2
	alignaddrl	%i4,	%l5,	%g1
	andncc	%o0,	%i1,	%o6
	move	%icc,	%g4,	%l6
	fexpand	%f28,	%f30
	movpos	%xcc,	%o2,	%i5
	sdiv	%o7,	0x0956,	%l3
	movleu	%xcc,	%o1,	%o4
	movgu	%xcc,	%i0,	%g3
	movn	%xcc,	%l2,	%g5
	fnors	%f2,	%f25,	%f10
	lduw	[%l7 + 0x30],	%o5
	stb	%i3,	[%l7 + 0x3D]
	sdivx	%i2,	0x0769,	%l4
	fcmpeq16	%f2,	%f2,	%o3
	restore %l1, 0x02C8, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x50],	%i6
	fmovda	%xcc,	%f6,	%f24
	orncc	%i7,	%g6,	%g7
	fmovrsgz	%i4,	%f27,	%f17
	movpos	%xcc,	%l5,	%g1
	andncc	%g2,	%o0,	%o6
	array16	%g4,	%i1,	%l6
	movn	%xcc,	%i5,	%o2
	movneg	%icc,	%l3,	%o1
	ld	[%l7 + 0x64],	%f27
	srl	%o7,	%i0,	%o4
	orcc	%l2,	0x0BBF,	%g5
	fpsub32s	%f16,	%f2,	%f8
	mova	%xcc,	%o5,	%g3
	nop
	set	0x0A, %g4
	sth	%i3,	[%l7 + %g4]
	sdivx	%l4,	0x0FD8,	%i2
	stw	%l1,	[%l7 + 0x5C]
	fornot2	%f30,	%f14,	%f12
	subccc	%o3,	%l0,	%i7
	or	%i6,	0x05D8,	%g7
	movgu	%icc,	%g6,	%l5
	fcmped	%fcc3,	%f10,	%f6
	movle	%xcc,	%g1,	%i4
	fabss	%f29,	%f28
	ldsb	[%l7 + 0x18],	%o0
	edge16	%o6,	%g2,	%g4
	fcmpeq32	%f0,	%f30,	%i1
	orcc	%l6,	%o2,	%i5
	sir	0x0A7E
	movcs	%xcc,	%l3,	%o7
	sir	0x0CC1
	sdivx	%o1,	0x07EA,	%o4
	orn	%l2,	0x15A2,	%g5
	subcc	%i0,	0x0B11,	%o5
	movn	%xcc,	%i3,	%l4
	ldx	[%l7 + 0x50],	%g3
	umulcc	%l1,	%i2,	%o3
	fones	%f3
	ldsb	[%l7 + 0x29],	%i7
	or	%i6,	0x1D10,	%l0
	fsrc2	%f24,	%f28
	movneg	%xcc,	%g7,	%g6
	movrgz	%l5,	0x1B7,	%i4
	fmovrdgz	%o0,	%f10,	%f28
	fmul8x16au	%f11,	%f10,	%f10
	edge32l	%g1,	%o6,	%g2
	move	%xcc,	%i1,	%g4
	movgu	%xcc,	%l6,	%i5
	edge8	%o2,	%o7,	%o1
	nop
	set	0x40, %g1
	lduw	[%l7 + %g1],	%o4
	fpsub32s	%f7,	%f21,	%f22
	movrgez	%l3,	%g5,	%l2
	fcmpne16	%f24,	%f4,	%i0
	fmul8x16al	%f6,	%f16,	%f24
	sub	%i3,	0x020F,	%o5
	edge32l	%l4,	%l1,	%g3
	std	%f12,	[%l7 + 0x40]
	fmovrsgez	%o3,	%f19,	%f6
	fpsub16	%f4,	%f2,	%f24
	fpsub32s	%f13,	%f23,	%f3
	addccc	%i2,	%i6,	%i7
	fabss	%f8,	%f11
	alignaddr	%g7,	%l0,	%l5
	alignaddr	%i4,	%o0,	%g6
	fmuld8ulx16	%f5,	%f9,	%f10
	or	%o6,	0x1A31,	%g1
	xorcc	%i1,	0x122A,	%g2
	mulx	%l6,	%g4,	%i5
	edge32l	%o7,	%o2,	%o4
	movvc	%icc,	%l3,	%g5
	sdivcc	%o1,	0x079F,	%i0
	movgu	%icc,	%i3,	%l2
	fnot2s	%f24,	%f20
	ldsb	[%l7 + 0x56],	%l4
	xnor	%o5,	%g3,	%o3
	edge16	%i2,	%l1,	%i7
	ldsw	[%l7 + 0x74],	%i6
	orcc	%g7,	0x1192,	%l5
	edge16n	%i4,	%l0,	%o0
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	fsrc2s	%f28,	%f11
	xorcc	%i1,	%o6,	%l6
	ldsh	[%l7 + 0x54],	%g2
	fpsub16s	%f27,	%f2,	%f8
	movleu	%icc,	%g4,	%i5
	fcmps	%fcc1,	%f1,	%f18
	edge16ln	%o2,	%o4,	%l3
	fcmple16	%f30,	%f24,	%o7
	add	%o1,	%g5,	%i0
	fmovrsgz	%l2,	%f17,	%f6
	for	%f16,	%f28,	%f30
	movcc	%xcc,	%l4,	%i3
	fnegs	%f8,	%f19
	sra	%g3,	%o3,	%i2
	array16	%l1,	%o5,	%i6
	fcmpgt16	%f10,	%f18,	%g7
	fmovdg	%xcc,	%f27,	%f21
	for	%f6,	%f28,	%f2
	sll	%l5,	%i7,	%i4
	subccc	%o0,	%g6,	%g1
	mova	%icc,	%i1,	%o6
	movgu	%icc,	%l0,	%l6
	movle	%xcc,	%g2,	%g4
	edge32	%i5,	%o4,	%o2
	array8	%l3,	%o7,	%o1
	movleu	%xcc,	%i0,	%l2
	mulscc	%l4,	0x119B,	%i3
	smulcc	%g3,	%g5,	%o3
	sub	%l1,	%i2,	%i6
	smulcc	%g7,	%o5,	%i7
	smul	%i4,	0x18AD,	%o0
	nop
	set	0x1F, %i5
	ldub	[%l7 + %i5],	%g6
	sth	%l5,	[%l7 + 0x28]
	edge8	%i1,	%o6,	%l0
	xnorcc	%l6,	0x076E,	%g1
	addcc	%g2,	%i5,	%o4
	edge32l	%g4,	%o2,	%o7
	sth	%l3,	[%l7 + 0x5C]
	ldsw	[%l7 + 0x2C],	%o1
	alignaddrl	%i0,	%l4,	%i3
	stb	%l2,	[%l7 + 0x79]
	xnorcc	%g3,	%o3,	%g5
	ldx	[%l7 + 0x10],	%i2
	popc	0x1989,	%l1
	smul	%i6,	0x166F,	%g7
	movvc	%xcc,	%o5,	%i4
	nop
	set	0x78, %i2
	std	%f26,	[%l7 + %i2]
	sethi	0x1A00,	%i7
	orncc	%o0,	0x10EE,	%g6
	movneg	%xcc,	%l5,	%i1
	sll	%o6,	%l0,	%l6
	or	%g1,	0x00AF,	%i5
	mulscc	%g2,	%g4,	%o2
	edge16l	%o7,	%l3,	%o4
	sir	0x0E9F
	fsrc1	%f6,	%f30
	movgu	%icc,	%o1,	%l4
	umul	%i3,	%l2,	%i0
	sra	%g3,	%g5,	%o3
	fcmpeq16	%f12,	%f30,	%i2
	fmovdne	%icc,	%f4,	%f31
	sll	%l1,	0x1E,	%i6
	fpack32	%f6,	%f2,	%f28
	or	%g7,	%o5,	%i4
	std	%f6,	[%l7 + 0x08]
	sub	%o0,	0x0C10,	%g6
	stb	%l5,	[%l7 + 0x55]
	and	%i1,	%i7,	%l0
	fmovdg	%xcc,	%f2,	%f22
	mulx	%l6,	0x11CC,	%o6
	udivcc	%g1,	0x12B9,	%i5
	movleu	%icc,	%g2,	%o2
	umul	%g4,	0x1BD1,	%l3
	mulx	%o7,	0x1564,	%o4
	xnorcc	%o1,	0x04A3,	%i3
	fmul8ulx16	%f22,	%f22,	%f30
	or	%l4,	%i0,	%l2
	movleu	%icc,	%g5,	%g3
	sdivx	%i2,	0x17EF,	%o3
	movne	%xcc,	%l1,	%g7
	ldub	[%l7 + 0x5E],	%o5
	xnorcc	%i4,	%i6,	%o0
	fmul8x16al	%f12,	%f21,	%f28
	nop
	set	0x38, %l1
	ldsw	[%l7 + %l1],	%l5
	array32	%i1,	%i7,	%l0
	srax	%l6,	%g6,	%o6
	edge16l	%i5,	%g2,	%g1
	movrlz	%o2,	0x2FC,	%g4
	move	%xcc,	%l3,	%o7
	fsrc2s	%f26,	%f2
	array32	%o4,	%i3,	%l4
	sllx	%i0,	0x13,	%o1
	edge8ln	%g5,	%g3,	%i2
	ldub	[%l7 + 0x6B],	%o3
	fmovsn	%icc,	%f6,	%f6
	andncc	%l1,	%g7,	%o5
	sub	%l2,	0x108B,	%i6
	lduw	[%l7 + 0x7C],	%i4
	sllx	%o0,	0x08,	%l5
	ldd	[%l7 + 0x60],	%i6
	edge16l	%l0,	%i1,	%l6
	sra	%g6,	0x1E,	%o6
	andcc	%g2,	0x123D,	%g1
	edge32l	%o2,	%g4,	%l3
	movn	%xcc,	%o7,	%o4
	xorcc	%i5,	0x1C66,	%i3
	fands	%f13,	%f29,	%f28
	and	%l4,	%i0,	%o1
	subcc	%g5,	%g3,	%i2
	fone	%f18
	edge32n	%o3,	%g7,	%l1
	pdist	%f30,	%f10,	%f24
	movcc	%icc,	%o5,	%l2
	fabss	%f22,	%f17
	sethi	0x013E,	%i4
	srl	%i6,	0x1F,	%o0
	movvs	%xcc,	%i7,	%l5
	fnegs	%f13,	%f19
	fmovsneg	%xcc,	%f12,	%f22
	sll	%l0,	%i1,	%g6
	stw	%o6,	[%l7 + 0x14]
	andn	%l6,	%g1,	%o2
	edge32	%g4,	%l3,	%g2
	stx	%o4,	[%l7 + 0x50]
	st	%f16,	[%l7 + 0x70]
	sdivx	%o7,	0x1A16,	%i5
	fors	%f22,	%f20,	%f27
	edge32n	%l4,	%i0,	%i3
	std	%f2,	[%l7 + 0x28]
	sll	%g5,	%g3,	%i2
	umul	%o3,	%g7,	%l1
	fmovdl	%icc,	%f0,	%f28
	ldsb	[%l7 + 0x3C],	%o1
	stx	%o5,	[%l7 + 0x38]
	srl	%l2,	%i6,	%o0
	edge8l	%i4,	%i7,	%l5
	edge16ln	%l0,	%g6,	%i1
	andncc	%l6,	%o6,	%g1
	movrne	%o2,	0x34A,	%g4
	movne	%xcc,	%g2,	%l3
	ldub	[%l7 + 0x48],	%o4
	edge32l	%i5,	%o7,	%i0
	stw	%l4,	[%l7 + 0x44]
	fmovs	%f3,	%f17
	movneg	%icc,	%i3,	%g5
	movle	%icc,	%g3,	%i2
	movre	%o3,	%l1,	%g7
	stx	%o1,	[%l7 + 0x18]
	fornot1s	%f14,	%f14,	%f15
	array8	%o5,	%l2,	%o0
	movleu	%icc,	%i4,	%i6
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%i6
	subcc	%l0,	%g6,	%l5
	mulscc	%l6,	%i1,	%o6
	array16	%o2,	%g1,	%g2
	alignaddr	%g4,	%o4,	%i5
	st	%f12,	[%l7 + 0x54]
	addccc	%l3,	%o7,	%l4
	edge16n	%i0,	%g5,	%g3
	movg	%xcc,	%i2,	%i3
	movne	%xcc,	%l1,	%g7
	ldd	[%l7 + 0x70],	%f22
	ldsw	[%l7 + 0x10],	%o1
	umulcc	%o5,	0x1B46,	%l2
	fmovdn	%icc,	%f19,	%f30
	smulcc	%o0,	0x0552,	%o3
	movrgz	%i4,	%i6,	%i7
	movrlz	%l0,	%l5,	%l6
	sdiv	%g6,	0x04C2,	%o6
	movrlez	%i1,	0x3D2,	%o2
	movgu	%xcc,	%g1,	%g2
	ldsb	[%l7 + 0x45],	%o4
	save %g4, %i5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l3,	%i0,	%g5
	edge8	%g3,	%i2,	%l4
	fcmpeq16	%f16,	%f4,	%i3
	fpmerge	%f3,	%f8,	%f6
	fabss	%f0,	%f19
	fandnot1	%f16,	%f28,	%f10
	movn	%icc,	%g7,	%o1
	array16	%l1,	%l2,	%o5
	stb	%o0,	[%l7 + 0x1A]
	fmovrslez	%o3,	%f7,	%f28
	movrgz	%i6,	%i4,	%l0
	sdiv	%l5,	0x1272,	%l6
	addc	%i7,	0x0A3A,	%o6
	stb	%g6,	[%l7 + 0x0B]
	ld	[%l7 + 0x28],	%f15
	udivx	%o2,	0x1EC0,	%i1
	orncc	%g2,	0x16B6,	%o4
	fmovscs	%xcc,	%f10,	%f2
	fmovda	%icc,	%f7,	%f3
	fcmpne32	%f22,	%f24,	%g4
	fnand	%f22,	%f22,	%f28
	mova	%xcc,	%i5,	%o7
	fpsub32	%f0,	%f14,	%f8
	lduw	[%l7 + 0x30],	%g1
	ldsb	[%l7 + 0x61],	%i0
	movleu	%xcc,	%l3,	%g5
	ldub	[%l7 + 0x0C],	%g3
	smulcc	%i2,	0x05D8,	%i3
	fmovdl	%xcc,	%f24,	%f4
	fpsub16	%f12,	%f6,	%f18
	sth	%g7,	[%l7 + 0x30]
	edge16l	%o1,	%l4,	%l2
	edge8l	%o5,	%o0,	%o3
	ldub	[%l7 + 0x6F],	%i6
	edge8n	%i4,	%l0,	%l1
	srlx	%l6,	%l5,	%o6
	fmovrdgz	%g6,	%f14,	%f0
	fpadd16	%f22,	%f16,	%f16
	edge8ln	%i7,	%i1,	%o2
	fornot2	%f8,	%f0,	%f4
	fabsd	%f24,	%f14
	fmovsleu	%icc,	%f30,	%f17
	fsrc2	%f24,	%f8
	and	%o4,	0x0F9E,	%g2
	subcc	%g4,	0x116E,	%o7
	srax	%i5,	%i0,	%l3
	srlx	%g5,	0x13,	%g1
	sub	%i2,	0x1AFB,	%i3
	movvs	%icc,	%g3,	%o1
	udivx	%g7,	0x113E,	%l4
	fmovdcs	%xcc,	%f25,	%f9
	edge8ln	%l2,	%o0,	%o3
	fmovsgu	%xcc,	%f26,	%f15
	ldd	[%l7 + 0x20],	%f4
	ldub	[%l7 + 0x30],	%i6
	sth	%i4,	[%l7 + 0x70]
	movpos	%xcc,	%o5,	%l0
	movrlz	%l6,	%l5,	%o6
	edge32l	%g6,	%i7,	%i1
	lduh	[%l7 + 0x30],	%l1
	movn	%xcc,	%o4,	%g2
	andncc	%g4,	%o2,	%i5
	umulcc	%o7,	%l3,	%i0
	fpsub16	%f4,	%f24,	%f26
	fmovrdne	%g1,	%f0,	%f12
	sra	%g5,	%i2,	%g3
	addccc	%o1,	0x04BC,	%i3
	save %l4, %l2, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g7,	%o3,	%i4
	edge16	%i6,	%l0,	%l6
	sdivcc	%o5,	0x1929,	%o6
	alignaddrl	%l5,	%i7,	%i1
	orcc	%l1,	0x19F0,	%g6
	movrlez	%g2,	0x29A,	%g4
	fmovsne	%xcc,	%f21,	%f1
	udiv	%o4,	0x1348,	%o2
	sdivx	%i5,	0x0F90,	%o7
	fpmerge	%f3,	%f4,	%f20
	fpadd32	%f6,	%f2,	%f30
	fsrc1	%f20,	%f12
	movne	%xcc,	%i0,	%l3
	ldsw	[%l7 + 0x3C],	%g1
	fcmple32	%f18,	%f4,	%i2
	movg	%icc,	%g5,	%g3
	fcmpgt32	%f26,	%f26,	%i3
	sllx	%l4,	0x03,	%l2
	srlx	%o0,	0x11,	%g7
	sll	%o1,	%i4,	%i6
	srlx	%o3,	0x19,	%l6
	sethi	0x1FB5,	%l0
	ld	[%l7 + 0x34],	%f8
	movrlez	%o5,	0x13B,	%o6
	ldx	[%l7 + 0x40],	%l5
	ldsb	[%l7 + 0x46],	%i7
	movn	%icc,	%i1,	%l1
	movre	%g6,	0x0B3,	%g4
	mulx	%o4,	%o2,	%i5
	subccc	%o7,	0x1789,	%g2
	movcs	%xcc,	%i0,	%l3
	movpos	%xcc,	%g1,	%g5
	ldsh	[%l7 + 0x22],	%i2
	array8	%i3,	%l4,	%l2
	stw	%o0,	[%l7 + 0x2C]
	subccc	%g3,	0x00C7,	%g7
	edge8n	%o1,	%i6,	%i4
	movrgz	%o3,	0x3B0,	%l0
	sub	%l6,	0x0008,	%o6
	fnand	%f20,	%f20,	%f8
	andncc	%o5,	%i7,	%l5
	fmovdl	%xcc,	%f30,	%f18
	movneg	%icc,	%l1,	%g6
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%i0
	xor	%o4,	%g4,	%o2
	andncc	%i5,	%g2,	%i0
	fmuld8sux16	%f24,	%f25,	%f26
	or	%o7,	0x05D2,	%g1
	movvs	%xcc,	%g5,	%l3
	fandnot1s	%f1,	%f3,	%f4
	sub	%i2,	0x01A7,	%l4
	fmovs	%f25,	%f22
	stb	%l2,	[%l7 + 0x40]
	lduw	[%l7 + 0x60],	%i3
	edge32n	%g3,	%g7,	%o1
	orcc	%i6,	%i4,	%o3
	fpadd32	%f0,	%f22,	%f22
	fmuld8sux16	%f29,	%f12,	%f10
	ld	[%l7 + 0x38],	%f24
	restore %l0, %o0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%o5,	%o6
	sllx	%i7,	%l5,	%l1
	fmovrde	%g6,	%f20,	%f6
	edge8ln	%i1,	%o4,	%o2
	st	%f23,	[%l7 + 0x20]
	fmovda	%xcc,	%f6,	%f17
	fmovrse	%i5,	%f31,	%f6
	lduh	[%l7 + 0x58],	%g4
	sir	0x096E
	fcmpne32	%f30,	%f14,	%g2
	edge8n	%i0,	%o7,	%g1
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	fmovde	%icc,	%f9,	%f5
	movvc	%icc,	%l2,	%i2
	or	%i3,	%g7,	%o1
	movge	%icc,	%i6,	%i4
	alignaddr	%g3,	%o3,	%o0
	array32	%l0,	%o5,	%l6
	popc	%o6,	%i7
	move	%xcc,	%l1,	%l5
	array32	%i1,	%g6,	%o4
	edge16n	%o2,	%i5,	%g4
	srlx	%g2,	0x10,	%o7
	movneg	%xcc,	%i0,	%g1
	mulx	%g5,	0x03E8,	%l3
	fmovsvc	%icc,	%f5,	%f19
	fmovrslez	%l2,	%f14,	%f4
	array8	%l4,	%i3,	%g7
	stb	%o1,	[%l7 + 0x5D]
	udiv	%i6,	0x14C0,	%i4
	fmovrdlez	%g3,	%f16,	%f26
	movvs	%icc,	%i2,	%o3
	andcc	%o0,	0x0792,	%l0
	movpos	%icc,	%o5,	%o6
	for	%f10,	%f14,	%f30
	movge	%xcc,	%i7,	%l1
	array8	%l6,	%i1,	%l5
	or	%o4,	%o2,	%g6
	sllx	%i5,	%g2,	%g4
	fpadd32	%f18,	%f10,	%f0
	fmuld8ulx16	%f5,	%f17,	%f0
	movcs	%xcc,	%i0,	%o7
	xnorcc	%g1,	0x10FB,	%l3
	fnot2	%f4,	%f20
	movrgez	%l2,	0x07C,	%g5
	movpos	%xcc,	%l4,	%g7
	fnot1s	%f2,	%f12
	edge8n	%o1,	%i6,	%i3
	fsrc1s	%f13,	%f3
	st	%f18,	[%l7 + 0x14]
	array8	%i4,	%g3,	%i2
	fpadd16	%f0,	%f24,	%f14
	edge16	%o3,	%l0,	%o0
	orncc	%o6,	%o5,	%i7
	fornot2s	%f11,	%f12,	%f25
	mulx	%l1,	%l6,	%l5
	srl	%i1,	%o4,	%o2
	ldsb	[%l7 + 0x17],	%g6
	addc	%i5,	0x10DA,	%g4
	udivx	%i0,	0x016A,	%g2
	sll	%o7,	0x1D,	%l3
	fnot1s	%f16,	%f0
	movpos	%icc,	%l2,	%g5
	array16	%l4,	%g1,	%g7
	smul	%o1,	%i3,	%i4
	sllx	%i6,	0x03,	%g3
	and	%o3,	0x0D0C,	%l0
	sdiv	%i2,	0x0AC6,	%o6
	xor	%o5,	0x0E43,	%o0
	movpos	%xcc,	%l1,	%i7
	faligndata	%f0,	%f10,	%f10
	ldub	[%l7 + 0x2F],	%l5
	faligndata	%f8,	%f24,	%f18
	fpack16	%f28,	%f5
	udiv	%l6,	0x1868,	%o4
	fcmpeq32	%f26,	%f8,	%i1
	fmovsle	%icc,	%f26,	%f14
	or	%g6,	%o2,	%g4
	fornot2	%f18,	%f8,	%f8
	andncc	%i0,	%i5,	%g2
	array32	%o7,	%l3,	%l2
	sethi	0x0801,	%g5
	fcmpgt16	%f30,	%f18,	%l4
	fandnot2s	%f30,	%f26,	%f3
	orncc	%g7,	0x13F1,	%o1
	srlx	%i3,	%i4,	%i6
	movrne	%g3,	%o3,	%l0
	popc	%g1,	%o6
	edge32l	%o5,	%i2,	%o0
	andcc	%i7,	0x130D,	%l5
	sethi	0x0E00,	%l6
	fmovrslz	%l1,	%f25,	%f0
	movvc	%icc,	%i1,	%g6
	movpos	%icc,	%o4,	%g4
	edge32n	%i0,	%i5,	%o2
	fmovdneg	%icc,	%f11,	%f7
	and	%o7,	%l3,	%l2
	mova	%icc,	%g5,	%l4
	movle	%xcc,	%g7,	%o1
	edge16n	%i3,	%i4,	%i6
	stx	%g2,	[%l7 + 0x40]
	movn	%xcc,	%g3,	%l0
	andncc	%g1,	%o6,	%o5
	lduh	[%l7 + 0x1C],	%i2
	addc	%o3,	%o0,	%i7
	siam	0x7
	fmovda	%xcc,	%f1,	%f8
	fmul8sux16	%f18,	%f10,	%f6
	nop
	set	0x60, %o6
	ldx	[%l7 + %o6],	%l5
	stb	%l1,	[%l7 + 0x35]
	movne	%icc,	%l6,	%g6
	nop
	set	0x50, %l2
	stx	%i1,	[%l7 + %l2]
	st	%f5,	[%l7 + 0x4C]
	srax	%o4,	%g4,	%i5
	srl	%o2,	%o7,	%i0
	sllx	%l2,	0x03,	%l3
	movvc	%icc,	%l4,	%g7
	umulcc	%o1,	0x0BCB,	%i3
	fsrc1	%f22,	%f10
	movne	%icc,	%i4,	%i6
	popc	0x04C8,	%g2
	save %g5, %l0, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o6,	%o5
	andcc	%i2,	%o3,	%o0
	edge16l	%i7,	%g1,	%l1
	fmovrde	%l6,	%f10,	%f2
	umulcc	%g6,	0x1B36,	%i1
	andn	%o4,	0x1B50,	%g4
	edge16	%i5,	%o2,	%o7
	fpsub16	%f26,	%f4,	%f10
	sub	%i0,	0x03CC,	%l2
	sllx	%l3,	0x0C,	%l5
	xnor	%g7,	%o1,	%i3
	subccc	%i4,	0x106A,	%i6
	movneg	%xcc,	%l4,	%g2
	move	%icc,	%l0,	%g3
	fmovsg	%xcc,	%f15,	%f30
	movvc	%icc,	%g5,	%o6
	movge	%icc,	%o5,	%o3
	ldub	[%l7 + 0x1E],	%o0
	add	%i2,	0x19A6,	%g1
	fmovdgu	%xcc,	%f12,	%f14
	movrgz	%i7,	0x32D,	%l6
	edge8	%l1,	%g6,	%i1
	xnor	%o4,	%i5,	%g4
	nop
	set	0x3A, %i3
	ldsb	[%l7 + %i3],	%o2
	ldsw	[%l7 + 0x3C],	%o7
	movneg	%icc,	%l2,	%i0
	srlx	%l3,	%l5,	%g7
	xorcc	%i3,	%o1,	%i4
	movgu	%xcc,	%i6,	%l4
	udivcc	%g2,	0x0EF2,	%l0
	fsrc1s	%f7,	%f23
	sir	0x17DA
	ldd	[%l7 + 0x68],	%f26
	edge16	%g3,	%o6,	%g5
	subcc	%o5,	0x0438,	%o0
	stx	%i2,	[%l7 + 0x78]
	orncc	%g1,	0x0CAC,	%o3
	fcmpeq16	%f14,	%f2,	%l6
	fzero	%f26
	std	%f8,	[%l7 + 0x40]
	fxnors	%f18,	%f5,	%f24
	fmovrdlez	%i7,	%f6,	%f16
	sethi	0x0CD8,	%g6
	andcc	%i1,	0x1195,	%l1
	fmovda	%xcc,	%f14,	%f29
	srax	%o4,	%i5,	%g4
	fmovse	%xcc,	%f8,	%f22
	ldd	[%l7 + 0x70],	%o2
	edge32n	%l2,	%o7,	%i0
	fnot1	%f30,	%f10
	sub	%l5,	%g7,	%i3
	orn	%l3,	0x082A,	%i4
	ldsb	[%l7 + 0x70],	%o1
	fmovrdgz	%l4,	%f16,	%f4
	addcc	%i6,	%g2,	%g3
	subc	%l0,	%g5,	%o6
	fmovdcs	%xcc,	%f26,	%f16
	addcc	%o5,	%o0,	%g1
	umul	%o3,	%l6,	%i2
	sth	%i7,	[%l7 + 0x10]
	subcc	%g6,	0x17E9,	%i1
	fmovdpos	%xcc,	%f19,	%f14
	edge16l	%l1,	%i5,	%o4
	fmovsneg	%xcc,	%f14,	%f4
	umulcc	%g4,	0x17A4,	%l2
	udivcc	%o2,	0x1491,	%i0
	movle	%xcc,	%o7,	%l5
	fmovsleu	%xcc,	%f0,	%f3
	srlx	%g7,	0x06,	%l3
	edge16l	%i4,	%o1,	%l4
	fnegd	%f30,	%f2
	sllx	%i6,	%g2,	%i3
	std	%f28,	[%l7 + 0x50]
	movvc	%icc,	%g3,	%g5
	stb	%l0,	[%l7 + 0x34]
	xor	%o5,	0x1108,	%o0
	movpos	%icc,	%o6,	%g1
	movge	%xcc,	%l6,	%i2
	edge8l	%o3,	%g6,	%i7
	fmovsle	%xcc,	%f19,	%f15
	udiv	%l1,	0x162A,	%i1
	mulscc	%i5,	%o4,	%l2
	lduw	[%l7 + 0x64],	%o2
	fmovrslez	%g4,	%f17,	%f0
	andcc	%i0,	%l5,	%o7
	sdiv	%g7,	0x04A4,	%l3
	umulcc	%o1,	%i4,	%i6
	lduw	[%l7 + 0x54],	%l4
	ldub	[%l7 + 0x62],	%g2
	movrlz	%g3,	0x055,	%i3
	sub	%l0,	%o5,	%o0
	nop
	set	0x08, %o7
	std	%f12,	[%l7 + %o7]
	save %o6, %g5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i2,	%g1
	mova	%xcc,	%o3,	%i7
	movvs	%xcc,	%l1,	%g6
	movvc	%icc,	%i1,	%o4
	fone	%f4
	fnors	%f13,	%f18,	%f0
	fornot1s	%f21,	%f14,	%f28
	movn	%xcc,	%i5,	%l2
	fmovdgu	%icc,	%f24,	%f6
	stb	%o2,	[%l7 + 0x63]
	fmovdcs	%xcc,	%f13,	%f26
	lduw	[%l7 + 0x24],	%g4
	srl	%i0,	%l5,	%o7
	ldsb	[%l7 + 0x39],	%l3
	edge8n	%o1,	%g7,	%i6
	sethi	0x04CB,	%i4
	fands	%f25,	%f4,	%f27
	sdivx	%g2,	0x1391,	%l4
	fpsub16	%f4,	%f0,	%f10
	movvs	%icc,	%i3,	%g3
	mulscc	%l0,	0x1A11,	%o5
	ldx	[%l7 + 0x68],	%o6
	for	%f2,	%f2,	%f28
	popc	0x0376,	%o0
	movne	%icc,	%l6,	%i2
	ldsh	[%l7 + 0x3C],	%g5
	movne	%icc,	%o3,	%g1
	edge32ln	%i7,	%g6,	%i1
	fcmped	%fcc3,	%f12,	%f20
	udivcc	%o4,	0x0550,	%l1
	addcc	%l2,	%i5,	%o2
	fmovsneg	%icc,	%f30,	%f27
	array8	%i0,	%g4,	%l5
	orn	%o7,	0x1383,	%o1
	movcc	%icc,	%l3,	%g7
	udivx	%i4,	0x0860,	%g2
	lduw	[%l7 + 0x14],	%l4
	edge32n	%i3,	%i6,	%l0
	fpadd16	%f20,	%f6,	%f30
	sll	%g3,	0x0E,	%o6
	bshuffle	%f14,	%f26,	%f0
	ldsb	[%l7 + 0x15],	%o5
	fone	%f26
	udivx	%l6,	0x01A2,	%o0
	fmovdcc	%icc,	%f29,	%f7
	andncc	%g5,	%o3,	%i2
	edge16	%i7,	%g1,	%i1
	mulscc	%g6,	%o4,	%l2
	ldd	[%l7 + 0x78],	%f14
	sub	%l1,	%i5,	%i0
	movvs	%icc,	%o2,	%l5
	mulx	%g4,	0x1F4F,	%o7
	fmovscc	%icc,	%f9,	%f8
	sdiv	%l3,	0x183D,	%o1
	movl	%xcc,	%g7,	%i4
	edge16n	%g2,	%l4,	%i3
	fornot2s	%f5,	%f31,	%f25
	fcmpd	%fcc0,	%f16,	%f26
	fmovsl	%icc,	%f24,	%f31
	st	%f29,	[%l7 + 0x70]
	edge16ln	%i6,	%g3,	%l0
	fmovrslez	%o6,	%f13,	%f16
	nop
	set	0x40, %i7
	ldx	[%l7 + %i7],	%o5
	movge	%xcc,	%l6,	%o0
	alignaddrl	%o3,	%g5,	%i7
	sir	0x0C41
	movcc	%icc,	%i2,	%i1
	alignaddrl	%g6,	%o4,	%g1
	restore %l2, 0x14BF, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i5,	0x1D61,	%o2
	fones	%f15
	sllx	%l5,	%i0,	%g4
	orncc	%l3,	%o7,	%g7
	fxor	%f12,	%f2,	%f6
	ldsw	[%l7 + 0x4C],	%o1
	mulx	%i4,	%l4,	%i3
	fxnors	%f6,	%f26,	%f0
	nop
	set	0x3A, %g7
	sth	%i6,	[%l7 + %g7]
	orn	%g3,	0x1FC5,	%l0
	edge16l	%g2,	%o6,	%l6
	sra	%o5,	0x14,	%o3
	fnot2	%f0,	%f0
	array8	%o0,	%g5,	%i2
	movvs	%icc,	%i7,	%g6
	fmovdvs	%icc,	%f9,	%f20
	xnor	%i1,	0x133B,	%g1
	fmovrslz	%o4,	%f2,	%f13
	orncc	%l2,	0x1916,	%i5
	andn	%o2,	0x1FB8,	%l1
	fzero	%f12
	movrne	%l5,	%g4,	%i0
	fmovsgu	%icc,	%f13,	%f0
	fmuld8ulx16	%f30,	%f21,	%f0
	subc	%o7,	%g7,	%o1
	movpos	%xcc,	%i4,	%l4
	movrgz	%i3,	0x2EA,	%i6
	andcc	%g3,	0x1C99,	%l0
	fmovrslz	%l3,	%f5,	%f5
	ldsh	[%l7 + 0x46],	%g2
	fmovsle	%xcc,	%f17,	%f16
	movpos	%xcc,	%o6,	%o5
	andcc	%o3,	0x19A7,	%l6
	srax	%g5,	%i2,	%i7
	st	%f29,	[%l7 + 0x50]
	movvc	%icc,	%g6,	%o0
	alignaddr	%g1,	%o4,	%l2
	sllx	%i1,	%i5,	%l1
	array16	%o2,	%g4,	%i0
	udivx	%l5,	0x1B23,	%g7
	fmovsvs	%xcc,	%f11,	%f29
	ldsh	[%l7 + 0x0C],	%o1
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	andcc	%l4,	0x1FC1,	%g3
	ldd	[%l7 + 0x18],	%f16
	sllx	%i6,	0x1F,	%l0
	umul	%l3,	%g2,	%o5
	ldsw	[%l7 + 0x6C],	%o6
	smul	%o3,	%l6,	%g5
	movrne	%i2,	%i7,	%g6
	movge	%icc,	%o0,	%g1
	stw	%o4,	[%l7 + 0x5C]
	fmovdneg	%xcc,	%f4,	%f22
	xor	%i1,	0x1613,	%i5
	edge32	%l1,	%l2,	%o2
	and	%i0,	0x179E,	%g4
	fors	%f3,	%f21,	%f2
	ldsb	[%l7 + 0x5E],	%g7
	lduh	[%l7 + 0x76],	%o1
	ldsb	[%l7 + 0x46],	%i4
	stx	%l5,	[%l7 + 0x08]
	and	%o7,	0x1329,	%l4
	array16	%i3,	%i6,	%l0
	sll	%g3,	0x1F,	%l3
	fands	%f2,	%f30,	%f2
	movle	%xcc,	%o5,	%o6
	addc	%o3,	0x0669,	%g2
	movn	%xcc,	%g5,	%i2
	movleu	%xcc,	%i7,	%l6
	fcmpeq16	%f20,	%f22,	%g6
	sdiv	%o0,	0x028D,	%g1
	edge32ln	%o4,	%i5,	%i1
	array16	%l2,	%o2,	%l1
	ld	[%l7 + 0x48],	%f12
	mova	%icc,	%i0,	%g7
	movg	%xcc,	%o1,	%i4
	fmovrsgz	%g4,	%f27,	%f27
	array16	%o7,	%l4,	%l5
	edge8l	%i3,	%i6,	%l0
	ldd	[%l7 + 0x70],	%g2
	mulscc	%o5,	0x05C8,	%l3
	fmovdleu	%icc,	%f11,	%f16
	xnor	%o6,	%o3,	%g2
	movrne	%i2,	%i7,	%g5
	udivx	%l6,	0x083E,	%o0
	fnot1s	%f16,	%f2
	edge8	%g6,	%o4,	%i5
	lduw	[%l7 + 0x0C],	%i1
	andncc	%l2,	%o2,	%g1
	xnor	%l1,	%g7,	%o1
	srlx	%i4,	0x1D,	%g4
	xnorcc	%i0,	%l4,	%l5
	edge32	%o7,	%i3,	%i6
	edge32	%g3,	%l0,	%l3
	for	%f8,	%f14,	%f14
	fsrc1s	%f10,	%f6
	orcc	%o6,	%o5,	%o3
	fmovrdlez	%i2,	%f18,	%f4
	addcc	%i7,	%g5,	%l6
	xnor	%o0,	%g2,	%g6
	ldd	[%l7 + 0x18],	%f22
	ldd	[%l7 + 0x10],	%i4
	sllx	%o4,	%l2,	%i1
	orn	%g1,	%l1,	%g7
	move	%icc,	%o2,	%i4
	or	%g4,	%i0,	%o1
	movvs	%icc,	%l4,	%o7
	popc	%i3,	%l5
	popc	0x1BC5,	%g3
	orcc	%l0,	%i6,	%o6
	popc	%o5,	%o3
	xor	%i2,	%l3,	%i7
	array16	%g5,	%o0,	%l6
	movvc	%icc,	%g6,	%i5
	alignaddrl	%o4,	%g2,	%i1
	edge32l	%g1,	%l1,	%l2
	ldsw	[%l7 + 0x70],	%o2
	fpadd32s	%f16,	%f1,	%f4
	mulscc	%i4,	0x08CC,	%g4
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%i0
	sub	%o1,	%l4,	%g7
	movleu	%xcc,	%i3,	%o7
	move	%xcc,	%l5,	%l0
	array16	%g3,	%i6,	%o5
	stw	%o3,	[%l7 + 0x14]
	lduw	[%l7 + 0x5C],	%i2
	edge8n	%o6,	%i7,	%l3
	fexpand	%f0,	%f22
	add	%g5,	%o0,	%l6
	ld	[%l7 + 0x78],	%f20
	sdivx	%g6,	0x1C23,	%o4
	move	%xcc,	%i5,	%i1
	edge8l	%g1,	%g2,	%l2
	sth	%o2,	[%l7 + 0x78]
	addcc	%i4,	%g4,	%l1
	edge16ln	%o1,	%i0,	%l4
	sdiv	%i3,	0x14D9,	%o7
	movcs	%xcc,	%g7,	%l5
	movl	%icc,	%l0,	%g3
	sub	%i6,	%o3,	%i2
	fmovrdlz	%o6,	%f10,	%f16
	fpadd32	%f22,	%f8,	%f14
	stx	%o5,	[%l7 + 0x50]
	andcc	%i7,	0x059A,	%l3
	nop
	set	0x64, %o5
	ldsw	[%l7 + %o5],	%o0
	udivcc	%g5,	0x146D,	%g6
	andn	%o4,	%l6,	%i5
	fmovsgu	%xcc,	%f3,	%f13
	edge16	%g1,	%i1,	%l2
	sllx	%g2,	0x09,	%o2
	xnorcc	%g4,	%i4,	%o1
	fpack16	%f22,	%f23
	std	%f10,	[%l7 + 0x70]
	movrgz	%l1,	%i0,	%i3
	mova	%xcc,	%l4,	%g7
	stb	%o7,	[%l7 + 0x60]
	smul	%l5,	%l0,	%i6
	stw	%o3,	[%l7 + 0x64]
	movre	%g3,	0x03D,	%i2
	orcc	%o6,	%o5,	%l3
	ldx	[%l7 + 0x20],	%i7
	movleu	%icc,	%o0,	%g6
	fxor	%f16,	%f6,	%f26
	movcs	%xcc,	%g5,	%o4
	edge32l	%i5,	%g1,	%l6
	edge8ln	%i1,	%g2,	%l2
	edge16l	%o2,	%g4,	%i4
	fcmps	%fcc0,	%f9,	%f12
	stb	%l1,	[%l7 + 0x31]
	fmovdleu	%icc,	%f1,	%f10
	xnorcc	%o1,	%i3,	%i0
	udivx	%g7,	0x19D8,	%l4
	or	%o7,	0x1EB6,	%l0
	fmul8x16au	%f7,	%f8,	%f8
	xnor	%i6,	%l5,	%o3
	mova	%xcc,	%i2,	%g3
	fmovdle	%icc,	%f24,	%f30
	ldsw	[%l7 + 0x74],	%o5
	fcmpgt16	%f6,	%f14,	%o6
	xor	%l3,	0x1307,	%o0
	edge32	%i7,	%g6,	%o4
	fxors	%f1,	%f5,	%f22
	st	%f7,	[%l7 + 0x64]
	array16	%g5,	%g1,	%l6
	movl	%xcc,	%i1,	%g2
	mulx	%i5,	0x19C1,	%l2
	restore %o2, 0x090C, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x15F4,	%l1
	ld	[%l7 + 0x10],	%f16
	ldd	[%l7 + 0x08],	%i4
	movrlz	%i3,	%o1,	%i0
	movvs	%icc,	%l4,	%o7
	addccc	%g7,	%l0,	%i6
	fmovscc	%icc,	%f12,	%f22
	fmovrsgz	%o3,	%f29,	%f15
	ldsb	[%l7 + 0x6C],	%i2
	sll	%l5,	%g3,	%o5
	nop
	set	0x50, %l6
	stw	%l3,	[%l7 + %l6]
	ld	[%l7 + 0x34],	%f9
	save %o0, %i7, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o4,	%g5,	%g1
	nop
	set	0x60, %o2
	ldsb	[%l7 + %o2],	%l6
	std	%f4,	[%l7 + 0x38]
	fmovsle	%icc,	%f24,	%f18
	xnor	%g6,	0x0698,	%g2
	edge8	%i1,	%i5,	%l2
	sir	0x08D4
	fmovsa	%icc,	%f16,	%f0
	andn	%o2,	%g4,	%l1
	lduh	[%l7 + 0x6A],	%i4
	srlx	%i3,	0x19,	%i0
	ldsw	[%l7 + 0x6C],	%o1
	fnot1s	%f22,	%f9
	mulscc	%o7,	%l4,	%g7
	ldsh	[%l7 + 0x56],	%i6
	srax	%o3,	%l0,	%i2
	fabsd	%f20,	%f10
	lduw	[%l7 + 0x44],	%g3
	fmul8x16au	%f5,	%f0,	%f30
	edge8	%l5,	%o5,	%l3
	ldd	[%l7 + 0x50],	%f6
	umul	%o0,	0x14EB,	%i7
	mulscc	%o6,	%o4,	%g5
	ldd	[%l7 + 0x38],	%g0
	fmovrde	%g6,	%f18,	%f20
	movn	%xcc,	%l6,	%g2
	sllx	%i5,	0x08,	%i1
	fornot1s	%f24,	%f15,	%f16
	smulcc	%o2,	0x0551,	%l2
	sub	%l1,	%g4,	%i4
	ldsh	[%l7 + 0x60],	%i3
	edge32	%i0,	%o1,	%l4
	sth	%g7,	[%l7 + 0x16]
	fones	%f24
	ldsh	[%l7 + 0x28],	%i6
	andn	%o3,	0x0120,	%o7
	edge8	%l0,	%i2,	%g3
	sdivx	%l5,	0x08F1,	%o5
	or	%o0,	0x19AB,	%l3
	ldsh	[%l7 + 0x5E],	%i7
	smul	%o4,	0x13E4,	%g5
	stx	%o6,	[%l7 + 0x78]
	movvs	%xcc,	%g6,	%l6
	std	%f0,	[%l7 + 0x18]
	fpadd16s	%f19,	%f17,	%f5
	mulscc	%g2,	%i5,	%g1
	fmovspos	%icc,	%f10,	%f2
	mova	%icc,	%i1,	%l2
	fmul8x16al	%f9,	%f27,	%f14
	save %l1, %o2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f31,	%f5,	%f15
	popc	%i3,	%i4
	sll	%i0,	0x18,	%l4
	ld	[%l7 + 0x24],	%f18
	subccc	%g7,	%o1,	%i6
	movrlz	%o7,	%o3,	%l0
	fnot1	%f6,	%f16
	ld	[%l7 + 0x64],	%f28
	move	%icc,	%g3,	%l5
	ld	[%l7 + 0x20],	%f21
	movrgz	%i2,	0x381,	%o5
	udivcc	%l3,	0x1CF4,	%o0
	orncc	%i7,	%g5,	%o6
	stx	%g6,	[%l7 + 0x40]
	fmovdcc	%icc,	%f12,	%f25
	movrgz	%l6,	%g2,	%i5
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	umul	%i1,	%l1,	%g4
	faligndata	%f12,	%f2,	%f20
	movneg	%icc,	%i3,	%i4
	srax	%o2,	0x0D,	%l4
	sir	0x022F
	edge32ln	%g7,	%i0,	%o1
	fcmple32	%f28,	%f20,	%i6
	movle	%icc,	%o3,	%l0
	movrgz	%o7,	0x292,	%g3
	umulcc	%l5,	0x1500,	%i2
	srax	%o5,	%o0,	%l3
	sllx	%i7,	0x0F,	%g5
	ldd	[%l7 + 0x60],	%f0
	edge16ln	%o6,	%g6,	%g2
	fmovrdne	%i5,	%f14,	%f0
	ldd	[%l7 + 0x38],	%f28
	ldub	[%l7 + 0x37],	%g1
	sdivcc	%l6,	0x1005,	%o4
	add	%l2,	%l1,	%i1
	fmovdpos	%xcc,	%f18,	%f28
	umul	%g4,	0x0366,	%i4
	fpsub32s	%f16,	%f8,	%f27
	sllx	%i3,	0x09,	%l4
	mova	%icc,	%g7,	%o2
	xnor	%o1,	%i6,	%o3
	fpadd16	%f0,	%f18,	%f8
	movne	%xcc,	%i0,	%l0
	fmovspos	%icc,	%f20,	%f25
	edge16ln	%o7,	%g3,	%i2
	umulcc	%o5,	0x01D7,	%l5
	movneg	%xcc,	%l3,	%i7
	lduh	[%l7 + 0x7A],	%g5
	movcc	%icc,	%o0,	%g6
	srlx	%g2,	0x05,	%o6
	mova	%icc,	%g1,	%i5
	fabsd	%f22,	%f10
	fnot2	%f4,	%f30
	edge16n	%l6,	%o4,	%l1
	srl	%i1,	0x05,	%g4
	fmovse	%xcc,	%f7,	%f24
	xnor	%i4,	%i3,	%l4
	stx	%g7,	[%l7 + 0x10]
	movn	%xcc,	%l2,	%o1
	move	%icc,	%o2,	%i6
	movrlez	%o3,	%l0,	%i0
	movre	%g3,	0x0B7,	%i2
	fmovdl	%icc,	%f30,	%f31
	fabsd	%f16,	%f4
	movcs	%xcc,	%o5,	%o7
	udiv	%l3,	0x0656,	%i7
	fmovsa	%xcc,	%f11,	%f18
	fcmpne32	%f20,	%f30,	%l5
	movcc	%icc,	%o0,	%g6
	nop
	set	0x64, %o3
	stw	%g5,	[%l7 + %o3]
	movleu	%xcc,	%o6,	%g2
	std	%f8,	[%l7 + 0x20]
	fnot2	%f26,	%f8
	movge	%icc,	%g1,	%i5
	save %l6, 0x0EB8, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l1,	0x0F2F,	%g4
	array32	%i4,	%i1,	%l4
	mulscc	%i3,	%l2,	%o1
	andncc	%g7,	%o2,	%o3
	orcc	%l0,	0x0E46,	%i6
	movn	%icc,	%g3,	%i0
	movvc	%icc,	%i2,	%o7
	smul	%l3,	0x005A,	%o5
	alignaddr	%l5,	%o0,	%g6
	alignaddrl	%i7,	%o6,	%g2
	edge16ln	%g5,	%g1,	%i5
	xor	%o4,	0x1951,	%l6
	movge	%xcc,	%l1,	%i4
	edge32	%g4,	%i1,	%l4
	movrgz	%i3,	%o1,	%g7
	xnor	%o2,	%l2,	%o3
	st	%f25,	[%l7 + 0x6C]
	sdiv	%i6,	0x1E05,	%g3
	or	%l0,	%i0,	%o7
	srlx	%i2,	%o5,	%l3
	stb	%o0,	[%l7 + 0x24]
	edge16l	%g6,	%i7,	%o6
	andn	%g2,	0x1B34,	%g5
	ldd	[%l7 + 0x38],	%f26
	edge8n	%g1,	%l5,	%o4
	array32	%l6,	%i5,	%i4
	std	%f22,	[%l7 + 0x48]
	st	%f19,	[%l7 + 0x34]
	fmovsneg	%icc,	%f29,	%f9
	umul	%g4,	0x060B,	%i1
	or	%l4,	0x0796,	%l1
	array8	%i3,	%g7,	%o1
	sth	%l2,	[%l7 + 0x2C]
	sdivx	%o2,	0x12DA,	%i6
	fmul8ulx16	%f26,	%f8,	%f28
	move	%icc,	%o3,	%l0
	udivx	%i0,	0x1787,	%o7
	movvc	%xcc,	%i2,	%o5
	fcmpne16	%f2,	%f20,	%g3
	fmovrslz	%o0,	%f17,	%f6
	fnands	%f21,	%f8,	%f5
	fmovdgu	%icc,	%f9,	%f18
	stx	%g6,	[%l7 + 0x58]
	fnands	%f1,	%f28,	%f25
	edge16ln	%i7,	%l3,	%g2
	std	%f24,	[%l7 + 0x60]
	mova	%xcc,	%o6,	%g1
	fands	%f31,	%f6,	%f30
	edge32n	%g5,	%l5,	%l6
	movpos	%icc,	%o4,	%i5
	movrne	%g4,	%i1,	%i4
	edge8l	%l4,	%i3,	%l1
	xnor	%o1,	%g7,	%o2
	movl	%xcc,	%i6,	%o3
	fmovrdgz	%l0,	%f12,	%f26
	fandnot1s	%f15,	%f3,	%f22
	fnor	%f12,	%f8,	%f18
	sir	0x0855
	movneg	%xcc,	%i0,	%l2
	lduh	[%l7 + 0x72],	%o7
	fmovrdlz	%i2,	%f12,	%f18
	fmul8x16au	%f6,	%f14,	%f8
	st	%f28,	[%l7 + 0x7C]
	addc	%o5,	%g3,	%o0
	edge32	%i7,	%g6,	%g2
	fmovsvs	%xcc,	%f25,	%f19
	fmovsg	%xcc,	%f15,	%f24
	movleu	%icc,	%o6,	%g1
	edge32ln	%l3,	%l5,	%g5
	addcc	%l6,	0x09C4,	%i5
	stb	%g4,	[%l7 + 0x51]
	movrlez	%i1,	0x12C,	%o4
	fexpand	%f28,	%f18
	srlx	%l4,	0x03,	%i4
	edge8ln	%l1,	%o1,	%g7
	sll	%o2,	0x14,	%i3
	alignaddrl	%o3,	%l0,	%i6
	fmovrde	%i0,	%f16,	%f22
	movn	%icc,	%l2,	%i2
	movre	%o5,	%g3,	%o0
	addc	%i7,	0x1F86,	%g6
	edge32ln	%o7,	%g2,	%g1
	sra	%o6,	0x0A,	%l5
	xnorcc	%g5,	%l6,	%i5
	orncc	%l3,	0x1992,	%i1
	fmovsvc	%icc,	%f6,	%f7
	movg	%icc,	%o4,	%l4
	movvs	%icc,	%g4,	%i4
	movvs	%icc,	%o1,	%g7
	sethi	0x1C24,	%o2
	edge16	%l1,	%o3,	%l0
	edge32l	%i6,	%i3,	%i0
	movneg	%xcc,	%l2,	%o5
	movle	%xcc,	%g3,	%o0
	sllx	%i2,	0x08,	%i7
	ldsb	[%l7 + 0x2B],	%o7
	edge16	%g2,	%g1,	%o6
	fxors	%f7,	%f19,	%f24
	xorcc	%l5,	0x0212,	%g6
	udiv	%l6,	0x0AF8,	%g5
	xnor	%l3,	%i1,	%o4
	fornot1s	%f21,	%f12,	%f31
	fmul8sux16	%f12,	%f28,	%f12
	st	%f6,	[%l7 + 0x0C]
	subcc	%i5,	%g4,	%i4
	fsrc1	%f26,	%f30
	xnorcc	%o1,	%l4,	%g7
	fmovsl	%icc,	%f14,	%f0
	smul	%o2,	%o3,	%l1
	movvs	%xcc,	%l0,	%i3
	movvs	%icc,	%i6,	%l2
	stw	%i0,	[%l7 + 0x44]
	fmovsleu	%icc,	%f29,	%f18
	fpsub16s	%f16,	%f17,	%f2
	movneg	%icc,	%g3,	%o5
	edge16l	%i2,	%i7,	%o7
	sub	%o0,	%g2,	%o6
	st	%f26,	[%l7 + 0x30]
	fmovrdlz	%g1,	%f4,	%f30
	movne	%icc,	%g6,	%l6
	orcc	%g5,	%l5,	%i1
	fmovdle	%icc,	%f30,	%f18
	movneg	%icc,	%o4,	%i5
	restore %g4, 0x0096, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o1,	0x0AAD,	%i4
	lduw	[%l7 + 0x3C],	%g7
	edge16l	%o2,	%l4,	%l1
	array32	%o3,	%i3,	%i6
	andncc	%l0,	%i0,	%g3
	edge32ln	%l2,	%o5,	%i2
	addccc	%o7,	0x0A74,	%i7
	sll	%g2,	%o0,	%o6
	fmovdn	%xcc,	%f12,	%f11
	fandnot2	%f18,	%f10,	%f10
	umulcc	%g6,	%g1,	%l6
	or	%l5,	0x0EB4,	%g5
	ld	[%l7 + 0x10],	%f17
	and	%i1,	%i5,	%o4
	umul	%g4,	%o1,	%l3
	ldsb	[%l7 + 0x46],	%g7
	orcc	%o2,	0x19D0,	%l4
	addcc	%l1,	0x1922,	%o3
	udiv	%i4,	0x1505,	%i3
	movrne	%i6,	0x276,	%i0
	fpsub32s	%f15,	%f26,	%f31
	fmovdvc	%xcc,	%f26,	%f15
	lduw	[%l7 + 0x3C],	%g3
	sdivcc	%l0,	0x1572,	%o5
	fmovrde	%l2,	%f20,	%f30
	movrgz	%o7,	%i7,	%g2
	movvs	%xcc,	%o0,	%i2
	fornot1	%f30,	%f22,	%f6
	fmovrdlz	%o6,	%f20,	%f16
	mova	%icc,	%g6,	%g1
	fornot1	%f30,	%f10,	%f8
	movvs	%icc,	%l5,	%l6
	and	%i1,	0x068A,	%g5
	ldsb	[%l7 + 0x21],	%i5
	nop
	set	0x08, %l5
	lduh	[%l7 + %l5],	%g4
	array16	%o1,	%o4,	%l3
	ld	[%l7 + 0x3C],	%f8
	movle	%xcc,	%g7,	%l4
	lduh	[%l7 + 0x34],	%l1
	edge32n	%o3,	%i4,	%o2
	edge16n	%i3,	%i0,	%i6
	ldub	[%l7 + 0x08],	%g3
	fmovsge	%icc,	%f19,	%f7
	fmovsgu	%icc,	%f18,	%f12
	edge32ln	%l0,	%o5,	%l2
	stb	%i7,	[%l7 + 0x19]
	sll	%o7,	%g2,	%o0
	sir	0x0CD8
	srlx	%o6,	0x01,	%g6
	edge8l	%i2,	%l5,	%g1
	array32	%i1,	%g5,	%l6
	edge32ln	%g4,	%o1,	%i5
	ldd	[%l7 + 0x40],	%f26
	fmovrslz	%o4,	%f14,	%f20
	fcmpgt32	%f0,	%f0,	%g7
	movrgz	%l4,	%l3,	%o3
	sir	0x0CF7
	sethi	0x042C,	%i4
	fones	%f9
	srl	%l1,	%o2,	%i3
	fxnors	%f17,	%f8,	%f9
	lduw	[%l7 + 0x60],	%i6
	movge	%xcc,	%g3,	%l0
	fmovspos	%icc,	%f3,	%f17
	srl	%i0,	%o5,	%l2
	edge16	%i7,	%o7,	%o0
	udiv	%g2,	0x11D9,	%g6
	movrlz	%o6,	%l5,	%g1
	fmovsgu	%icc,	%f8,	%f12
	movleu	%xcc,	%i1,	%i2
	movrlez	%l6,	0x1A8,	%g4
	movvs	%icc,	%g5,	%o1
	ld	[%l7 + 0x6C],	%f14
	save %i5, %g7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x68],	%f14
	stw	%l4,	[%l7 + 0x50]
	addccc	%l3,	0x1179,	%o3
	movcs	%xcc,	%l1,	%i4
	sra	%i3,	0x10,	%o2
	xor	%i6,	%g3,	%l0
	edge8ln	%i0,	%o5,	%l2
	fornot1s	%f12,	%f8,	%f9
	fxnor	%f6,	%f24,	%f22
	subccc	%o7,	0x10BF,	%i7
	ldub	[%l7 + 0x3E],	%o0
	smulcc	%g6,	%o6,	%g2
	ld	[%l7 + 0x54],	%f8
	fcmpgt32	%f12,	%f0,	%l5
	movn	%icc,	%i1,	%g1
	sdivx	%i2,	0x03EB,	%g4
	subccc	%g5,	0x1619,	%l6
	addc	%i5,	%g7,	%o1
	edge16ln	%l4,	%l3,	%o3
	addccc	%l1,	0x18F2,	%o4
	sdiv	%i4,	0x1AF2,	%o2
	movneg	%icc,	%i6,	%g3
	xnorcc	%l0,	0x1A39,	%i0
	xnorcc	%o5,	%l2,	%i3
	fmovs	%f12,	%f3
	addc	%o7,	%o0,	%g6
	orn	%o6,	0x0179,	%g2
	sub	%l5,	%i7,	%g1
	fnands	%f13,	%f24,	%f13
	umul	%i1,	%g4,	%g5
	movge	%xcc,	%i2,	%l6
	popc	%g7,	%i5
	fors	%f13,	%f4,	%f4
	movge	%icc,	%l4,	%o1
	movle	%xcc,	%o3,	%l3
	movl	%xcc,	%l1,	%o4
	subc	%o2,	0x116A,	%i4
	ldd	[%l7 + 0x18],	%f2
	fnot2s	%f3,	%f0
	edge8n	%g3,	%i6,	%l0
	movcc	%icc,	%o5,	%i0
	umulcc	%l2,	%o7,	%i3
	andn	%g6,	%o0,	%o6
	smulcc	%g2,	0x1BE4,	%l5
	popc	%g1,	%i1
	movle	%xcc,	%i7,	%g5
	movge	%icc,	%i2,	%l6
	fmovsl	%icc,	%f31,	%f19
	st	%f13,	[%l7 + 0x78]
	siam	0x0
	ldub	[%l7 + 0x2E],	%g4
	edge16n	%g7,	%l4,	%i5
	fsrc1s	%f20,	%f4
	movleu	%xcc,	%o1,	%l3
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	fsrc2s	%f31,	%f2
	srlx	%o4,	%o2,	%i4
	nop
	set	0x6E, %l4
	ldub	[%l7 + %l4],	%g3
	alignaddr	%l0,	%o5,	%i6
	ldx	[%l7 + 0x78],	%l2
	fmovrdgez	%i0,	%f10,	%f6
	ldsb	[%l7 + 0x3A],	%o7
	movn	%xcc,	%g6,	%o0
	movrlz	%i3,	%o6,	%l5
	edge8ln	%g1,	%i1,	%i7
	sub	%g2,	0x09A9,	%i2
	orncc	%l6,	%g4,	%g7
	fmovrdgz	%l4,	%f26,	%f12
	fpsub32s	%f10,	%f22,	%f18
	fnot1s	%f19,	%f9
	fand	%f0,	%f8,	%f2
	fsrc2	%f20,	%f26
	stb	%g5,	[%l7 + 0x08]
	sra	%i5,	%l3,	%o3
	movge	%icc,	%o1,	%o4
	orcc	%o2,	0x029C,	%l1
	xnorcc	%g3,	%l0,	%i4
	movrgz	%i6,	0x0C4,	%o5
	nop
	set	0x1E, %i6
	ldub	[%l7 + %i6],	%l2
	addcc	%o7,	0x1D82,	%i0
	movl	%xcc,	%g6,	%o0
	addcc	%o6,	0x04FC,	%l5
	udivcc	%i3,	0x0637,	%i1
	ldub	[%l7 + 0x26],	%i7
	andn	%g2,	%g1,	%i2
	edge8l	%g4,	%l6,	%l4
	fabss	%f26,	%f19
	xnor	%g7,	%i5,	%l3
	fors	%f3,	%f5,	%f18
	xorcc	%o3,	%o1,	%g5
	orn	%o4,	%o2,	%g3
	std	%f24,	[%l7 + 0x38]
	udivx	%l1,	0x0F57,	%i4
	movge	%icc,	%l0,	%o5
	movpos	%icc,	%l2,	%o7
	fcmpgt32	%f10,	%f16,	%i6
	std	%f0,	[%l7 + 0x08]
	fmovrsgez	%g6,	%f5,	%f15
	fpsub32s	%f24,	%f20,	%f21
	movgu	%icc,	%o0,	%o6
	add	%i0,	0x16BB,	%i3
	alignaddr	%l5,	%i1,	%i7
	addcc	%g2,	%i2,	%g4
	srlx	%l6,	0x1B,	%l4
	fnot1s	%f23,	%f9
	ldsh	[%l7 + 0x5C],	%g7
	udivx	%g1,	0x0AD5,	%l3
	mova	%xcc,	%o3,	%i5
	udivcc	%g5,	0x117D,	%o4
	fmovs	%f15,	%f7
	sdivx	%o1,	0x1917,	%g3
	sdivcc	%o2,	0x12BD,	%i4
	ldd	[%l7 + 0x10],	%f6
	ldsh	[%l7 + 0x28],	%l0
	stx	%l1,	[%l7 + 0x50]
	sth	%l2,	[%l7 + 0x70]
	movrgez	%o5,	%o7,	%g6
	fmovrdgez	%i6,	%f0,	%f4
	andncc	%o0,	%o6,	%i3
	smulcc	%i0,	%i1,	%l5
	sir	0x142C
	fmovrsgz	%i7,	%f8,	%f7
	ldx	[%l7 + 0x08],	%i2
	xnorcc	%g2,	0x0E1C,	%g4
	fabsd	%f6,	%f18
	ldsb	[%l7 + 0x14],	%l6
	movrlz	%l4,	0x160,	%g7
	andncc	%l3,	%o3,	%g1
	lduw	[%l7 + 0x30],	%i5
	fcmped	%fcc1,	%f10,	%f2
	std	%f12,	[%l7 + 0x28]
	bshuffle	%f22,	%f6,	%f22
	fmovsge	%icc,	%f0,	%f14
	fmovd	%f4,	%f30
	orncc	%o4,	%o1,	%g3
	stx	%g5,	[%l7 + 0x40]
	alignaddr	%i4,	%l0,	%o2
	fnands	%f9,	%f0,	%f8
	movrlez	%l2,	0x274,	%l1
	srlx	%o7,	0x1D,	%o5
	fmovrsne	%i6,	%f1,	%f22
	array16	%g6,	%o0,	%o6
	edge16ln	%i0,	%i1,	%l5
	andcc	%i7,	%i2,	%g2
	srl	%i3,	%l6,	%l4
	fones	%f25
	smulcc	%g7,	0x1565,	%g4
	edge8ln	%o3,	%g1,	%i5
	movleu	%xcc,	%o4,	%l3
	mulscc	%o1,	%g5,	%i4
	sllx	%l0,	0x15,	%g3
	ldub	[%l7 + 0x0E],	%l2
	stx	%o2,	[%l7 + 0x30]
	movneg	%icc,	%l1,	%o5
	fxnors	%f30,	%f26,	%f15
	or	%o7,	%i6,	%o0
	addc	%g6,	0x1485,	%o6
	addccc	%i1,	0x1BC3,	%i0
	andncc	%l5,	%i7,	%i2
	and	%g2,	0x0163,	%l6
	st	%f9,	[%l7 + 0x7C]
	fmovrsgz	%i3,	%f4,	%f4
	array32	%l4,	%g7,	%g4
	subccc	%o3,	%g1,	%i5
	fmovde	%xcc,	%f31,	%f7
	fsrc2	%f20,	%f28
	fmovdleu	%icc,	%f20,	%f22
	fcmple16	%f4,	%f6,	%o4
	edge32n	%l3,	%o1,	%g5
	fcmpeq32	%f14,	%f14,	%i4
	or	%g3,	0x1F3B,	%l2
	fmovsvc	%icc,	%f12,	%f13
	movgu	%icc,	%l0,	%o2
	movvc	%icc,	%l1,	%o7
	sethi	0x0A67,	%o5
	ldd	[%l7 + 0x48],	%f4
	srl	%i6,	0x1F,	%o0
	ldsw	[%l7 + 0x60],	%o6
	nop
	set	0x70, %g3
	stx	%i1,	[%l7 + %g3]
	save %g6, 0x1E98, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f29,	%f9,	%f29
	addcc	%i7,	0x1A2D,	%i2
	fmovrse	%l5,	%f11,	%f27
	fcmpes	%fcc2,	%f25,	%f1
	fmovdge	%icc,	%f30,	%f10
	fmovdleu	%xcc,	%f12,	%f31
	fmovse	%icc,	%f10,	%f8
	movcs	%icc,	%l6,	%i3
	edge8l	%g2,	%l4,	%g7
	udivcc	%o3,	0x1C3B,	%g4
	orn	%g1,	%o4,	%l3
	fnands	%f16,	%f7,	%f11
	subc	%i5,	0x132D,	%g5
	nop
	set	0x2F, %o4
	ldsb	[%l7 + %o4],	%i4
	fmovscs	%icc,	%f17,	%f26
	edge32n	%o1,	%l2,	%g3
	sll	%o2,	%l1,	%l0
	st	%f8,	[%l7 + 0x24]
	xorcc	%o7,	%i6,	%o0
	xor	%o5,	%o6,	%i1
	ldd	[%l7 + 0x68],	%f4
	fmovsge	%icc,	%f5,	%f24
	umul	%i0,	%g6,	%i7
	xnor	%i2,	0x1E0F,	%l5
	andcc	%i3,	0x0A84,	%l6
	fcmpes	%fcc1,	%f3,	%f16
	sll	%l4,	%g7,	%o3
	restore %g2, %g1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f26,	[%l7 + 0x28]
	fmovrse	%l3,	%f4,	%f13
	fmovsgu	%xcc,	%f21,	%f25
	fmovdvc	%xcc,	%f13,	%f23
	srlx	%i5,	%g5,	%i4
	stw	%o1,	[%l7 + 0x18]
	mova	%xcc,	%l2,	%g3
	popc	0x0CBC,	%o2
	sll	%l1,	%o4,	%l0
	sdiv	%o7,	0x11B1,	%o0
	ldd	[%l7 + 0x60],	%o4
	ldsb	[%l7 + 0x2E],	%o6
	fmovsn	%icc,	%f11,	%f13
	sdiv	%i1,	0x0624,	%i0
	srl	%i6,	%g6,	%i2
	ldsb	[%l7 + 0x22],	%l5
	fcmpgt16	%f12,	%f12,	%i3
	add	%i7,	%l4,	%l6
	movrne	%o3,	%g2,	%g7
	and	%g4,	0x1B71,	%l3
	lduw	[%l7 + 0x18],	%g1
	movrgez	%g5,	%i4,	%i5
	movrlz	%o1,	0x320,	%l2
	sdivx	%o2,	0x16ED,	%g3
	movle	%xcc,	%o4,	%l0
	fnands	%f28,	%f13,	%f21
	ldsh	[%l7 + 0x32],	%l1
	movge	%xcc,	%o7,	%o5
	fandnot2s	%f7,	%f3,	%f14
	movg	%icc,	%o6,	%i1
	fmovrdgez	%i0,	%f10,	%f16
	edge32n	%i6,	%o0,	%i2
	movg	%icc,	%l5,	%g6
	movrgz	%i7,	%i3,	%l6
	stw	%l4,	[%l7 + 0x2C]
	movleu	%icc,	%g2,	%o3
	orn	%g4,	0x0B22,	%g7
	std	%f2,	[%l7 + 0x40]
	movre	%g1,	0x0F6,	%l3
	sub	%g5,	%i5,	%i4
	fmovda	%icc,	%f21,	%f11
	alignaddr	%l2,	%o2,	%g3
	fmovs	%f4,	%f10
	smul	%o1,	0x1187,	%l0
	xnor	%o4,	0x04B7,	%o7
	edge8n	%o5,	%l1,	%o6
	fmovsn	%xcc,	%f30,	%f23
	fcmpne32	%f8,	%f10,	%i1
	fmovsne	%xcc,	%f1,	%f23
	edge8ln	%i0,	%i6,	%o0
	alignaddr	%i2,	%l5,	%i7
	edge32ln	%g6,	%l6,	%i3
	xorcc	%l4,	0x0002,	%o3
	movcs	%icc,	%g2,	%g7
	movvs	%icc,	%g1,	%g4
	srl	%l3,	%g5,	%i5
	ldx	[%l7 + 0x48],	%l2
	sub	%i4,	0x1214,	%o2
	mulx	%o1,	0x133B,	%g3
	std	%f10,	[%l7 + 0x30]
	fmovdcs	%xcc,	%f26,	%f2
	fmul8ulx16	%f24,	%f8,	%f24
	smulcc	%l0,	%o7,	%o5
	movgu	%xcc,	%l1,	%o4
	sethi	0x0FAE,	%i1
	movg	%xcc,	%o6,	%i0
	movrgez	%i6,	%o0,	%i2
	andcc	%l5,	0x1C80,	%g6
	smulcc	%i7,	%i3,	%l6
	movl	%xcc,	%l4,	%o3
	xorcc	%g7,	0x1BEE,	%g2
	movle	%icc,	%g4,	%g1
	addc	%g5,	%l3,	%i5
	xnorcc	%i4,	0x0C0A,	%o2
	edge16n	%o1,	%g3,	%l0
	smul	%l2,	%o5,	%l1
	umul	%o4,	0x1427,	%o7
	sra	%i1,	%o6,	%i6
	sll	%i0,	%i2,	%o0
	edge32	%g6,	%i7,	%l5
	mova	%icc,	%i3,	%l4
	movrgz	%o3,	0x269,	%l6
	movre	%g7,	0x1A5,	%g2
	fabss	%f15,	%f25
	sdivx	%g4,	0x036B,	%g1
	udivx	%g5,	0x0AEA,	%l3
	pdist	%f28,	%f18,	%f12
	popc	%i5,	%i4
	xor	%o2,	0x095B,	%g3
	movg	%xcc,	%o1,	%l2
	stx	%o5,	[%l7 + 0x40]
	and	%l0,	0x0F40,	%o4
	array8	%l1,	%o7,	%i1
	ldd	[%l7 + 0x48],	%i6
	sllx	%o6,	%i0,	%i2
	edge16ln	%g6,	%o0,	%i7
	movrgz	%l5,	%l4,	%o3
	stx	%i3,	[%l7 + 0x28]
	or	%g7,	%l6,	%g4
	srlx	%g2,	%g5,	%g1
	umul	%i5,	0x1359,	%l3
	movrgz	%i4,	%g3,	%o1
	umulcc	%o2,	0x0600,	%l2
	array16	%o5,	%o4,	%l0
	move	%icc,	%o7,	%l1
	st	%f24,	[%l7 + 0x30]
	movg	%xcc,	%i1,	%i6
	alignaddrl	%o6,	%i0,	%i2
	fmovrdne	%o0,	%f28,	%f6
	fmovrslz	%g6,	%f2,	%f15
	fmovscs	%xcc,	%f11,	%f15
	edge8	%i7,	%l4,	%o3
	mulscc	%l5,	0x0D30,	%i3
	orn	%g7,	0x0D3F,	%l6
	fcmped	%fcc0,	%f8,	%f22
	movn	%icc,	%g4,	%g2
	mova	%icc,	%g1,	%g5
	umulcc	%l3,	0x1E7B,	%i4
	lduh	[%l7 + 0x4A],	%i5
	edge8n	%o1,	%g3,	%o2
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%l2
	ldub	[%l7 + 0x33],	%o5
	orcc	%o4,	0x015B,	%o7
	edge16n	%l0,	%l1,	%i1
	ldsh	[%l7 + 0x74],	%o6
	fmovrdne	%i0,	%f28,	%f16
	ld	[%l7 + 0x68],	%f10
	movrne	%i6,	%i2,	%o0
	ldsh	[%l7 + 0x10],	%i7
	andn	%g6,	0x126B,	%l4
	fnot1s	%f18,	%f3
	alignaddr	%o3,	%l5,	%i3
	fmovrdgz	%g7,	%f10,	%f18
	srl	%l6,	0x06,	%g2
	edge32l	%g4,	%g5,	%g1
	fcmped	%fcc2,	%f0,	%f0
	ldd	[%l7 + 0x18],	%l2
	movneg	%xcc,	%i5,	%i4
	fmovrsgz	%o1,	%f6,	%f29
	umulcc	%g3,	0x0D92,	%o2
	movrlez	%o5,	0x215,	%o4
	udivcc	%o7,	0x1038,	%l0
	subcc	%l2,	0x1619,	%l1
	edge32n	%o6,	%i1,	%i6
	sth	%i0,	[%l7 + 0x10]
	popc	0x16EC,	%o0
	fmul8x16al	%f30,	%f3,	%f22
	movvs	%xcc,	%i2,	%i7
	lduh	[%l7 + 0x0E],	%g6
	ldsh	[%l7 + 0x20],	%o3
	fcmpeq32	%f18,	%f28,	%l5
	mova	%icc,	%l4,	%i3
	fmovdl	%icc,	%f31,	%f12
	orcc	%g7,	%l6,	%g2
	stw	%g5,	[%l7 + 0x34]
	fmul8x16al	%f10,	%f3,	%f30
	nop
	set	0x49, %l0
	stb	%g1,	[%l7 + %l0]
	sdivx	%g4,	0x1573,	%i5
	fnors	%f1,	%f29,	%f13
	fsrc2s	%f18,	%f4
	mulscc	%i4,	%l3,	%o1
	ldsb	[%l7 + 0x2B],	%o2
	lduw	[%l7 + 0x30],	%g3
	fandnot2s	%f18,	%f23,	%f6
	fornot1s	%f13,	%f2,	%f19
	movcc	%icc,	%o5,	%o7
	sdivcc	%l0,	0x02FC,	%o4
	ld	[%l7 + 0x7C],	%f21
	siam	0x0
	sir	0x1D4E
	stx	%l1,	[%l7 + 0x38]
	fmovs	%f20,	%f8
	ldsb	[%l7 + 0x25],	%o6
	array16	%i1,	%l2,	%i0
	sra	%o0,	0x01,	%i2
	movg	%xcc,	%i7,	%i6
	ldsb	[%l7 + 0x3B],	%o3
	udivcc	%l5,	0x16FF,	%g6
	movvs	%xcc,	%l4,	%g7
	fmovdg	%icc,	%f18,	%f8
	fpadd32s	%f26,	%f25,	%f11
	movvs	%xcc,	%i3,	%l6
	movcc	%icc,	%g5,	%g2
	umul	%g4,	0x0BF9,	%i5
	move	%xcc,	%g1,	%i4
	edge16ln	%l3,	%o1,	%o2
	movle	%icc,	%g3,	%o5
	popc	%o7,	%l0
	srlx	%o4,	0x05,	%o6
	orcc	%l1,	0x0565,	%i1
	srl	%l2,	%o0,	%i0
	srl	%i7,	0x11,	%i2
	xnorcc	%i6,	%o3,	%l5
	movrlz	%g6,	0x1F3,	%l4
	movge	%xcc,	%i3,	%g7
	array32	%g5,	%g2,	%g4
	movpos	%icc,	%i5,	%g1
	ld	[%l7 + 0x34],	%f12
	movrlez	%l6,	%i4,	%l3
	srl	%o2,	0x0D,	%g3
	fmovrdlz	%o1,	%f20,	%f18
	ldub	[%l7 + 0x2D],	%o7
	mulscc	%l0,	0x1F51,	%o5
	ldub	[%l7 + 0x5F],	%o4
	edge8ln	%o6,	%l1,	%l2
	fcmps	%fcc0,	%f1,	%f18
	movle	%xcc,	%i1,	%i0
	fmuld8sux16	%f27,	%f24,	%f6
	ldsw	[%l7 + 0x78],	%o0
	sll	%i2,	%i7,	%o3
	udivcc	%l5,	0x130F,	%g6
	ldsh	[%l7 + 0x7A],	%i6
	fabss	%f28,	%f25
	subccc	%l4,	%g7,	%i3
	fmovrdlz	%g5,	%f18,	%f4
	fcmpes	%fcc0,	%f31,	%f20
	orcc	%g2,	%i5,	%g1
	ldx	[%l7 + 0x08],	%l6
	alignaddrl	%i4,	%l3,	%o2
	srax	%g3,	0x01,	%g4
	movleu	%icc,	%o7,	%o1
	edge16ln	%l0,	%o5,	%o4
	fmul8sux16	%f10,	%f30,	%f14
	movle	%icc,	%l1,	%o6
	udivcc	%i1,	0x08DB,	%l2
	fmovdg	%icc,	%f25,	%f16
	lduw	[%l7 + 0x14],	%i0
	add	%i2,	%i7,	%o3
	andn	%l5,	0x1B7E,	%g6
	fabsd	%f20,	%f30
	ldx	[%l7 + 0x30],	%o0
	fmovsge	%icc,	%f15,	%f10
	movvc	%xcc,	%i6,	%l4
	fors	%f15,	%f28,	%f16
	smul	%i3,	0x0132,	%g5
	fmovsa	%icc,	%f10,	%f30
	siam	0x2
	edge8	%g7,	%i5,	%g1
	andn	%g2,	0x0E8D,	%i4
	fpadd16s	%f24,	%f27,	%f7
	xnorcc	%l3,	%l6,	%o2
	udivx	%g4,	0x0FD2,	%g3
	xorcc	%o7,	%o1,	%l0
	orcc	%o5,	%l1,	%o4
	alignaddrl	%o6,	%i1,	%l2
	movcs	%icc,	%i2,	%i0
	fand	%f30,	%f18,	%f20
	edge16ln	%i7,	%o3,	%l5
	or	%o0,	%g6,	%l4
	fmovdn	%xcc,	%f25,	%f1
	fmovrdgez	%i3,	%f28,	%f22
	edge8l	%i6,	%g7,	%g5
	smul	%i5,	%g2,	%g1
	fnot2	%f28,	%f6
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	movvc	%xcc,	%o2,	%g4
	fmovsne	%icc,	%f31,	%f1
	srax	%l3,	%g3,	%o1
	movre	%o7,	0x119,	%l0
	restore %o5, 0x059A, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o4,	%i1,	%l2
	fnot2s	%f1,	%f6
	fmovsneg	%xcc,	%f12,	%f10
	xnor	%o6,	0x17E4,	%i0
	fors	%f24,	%f19,	%f26
	fpadd32	%f16,	%f30,	%f22
	sra	%i2,	%i7,	%o3
	nop
	set	0x79, %l3
	ldub	[%l7 + %l3],	%o0
	popc	%l5,	%g6
	xnorcc	%i3,	%i6,	%g7
	addc	%l4,	0x0F23,	%i5
	fnands	%f10,	%f23,	%f7
	srlx	%g5,	%g2,	%i4
	lduh	[%l7 + 0x6E],	%l6
	andncc	%o2,	%g4,	%g1
	edge16n	%g3,	%o1,	%o7
	ld	[%l7 + 0x2C],	%f18
	subccc	%l3,	0x0046,	%o5
	ldsb	[%l7 + 0x23],	%l0
	fmovrdgz	%l1,	%f2,	%f0
	movrne	%i1,	%l2,	%o6
	andcc	%o4,	0x0E54,	%i0
	movcc	%xcc,	%i2,	%i7
	fmovrsne	%o0,	%f10,	%f5
	movcs	%xcc,	%l5,	%o3
	ldx	[%l7 + 0x58],	%g6
	fmovdne	%xcc,	%f27,	%f5
	udiv	%i3,	0x0B2C,	%g7
	addccc	%l4,	%i6,	%g5
	movrlez	%g2,	0x106,	%i4
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	mulx	%g4,	0x1AF1,	%g1
	addccc	%g3,	0x0FAA,	%o2
	fmovd	%f14,	%f26
	udivx	%o1,	0x1ACC,	%o7
	stw	%l3,	[%l7 + 0x44]
	stw	%o5,	[%l7 + 0x1C]
	movpos	%xcc,	%l0,	%l1
	fsrc1	%f6,	%f20
	orncc	%l2,	0x0EDA,	%o6
	movre	%o4,	%i1,	%i2
	umulcc	%i0,	0x0FAD,	%o0
	addccc	%l5,	%i7,	%o3
	xnorcc	%i3,	%g7,	%l4
	movvc	%icc,	%i6,	%g5
	edge8	%g2,	%g6,	%l6
	movrne	%i5,	0x244,	%i4
	fpadd32	%f4,	%f12,	%f20
	movg	%xcc,	%g1,	%g4
	array8	%o2,	%o1,	%g3
	edge32	%l3,	%o7,	%l0
	alignaddr	%o5,	%l2,	%l1
	or	%o6,	%i1,	%i2
	movleu	%xcc,	%o4,	%o0
	fors	%f11,	%f16,	%f21
	stx	%i0,	[%l7 + 0x48]
	udivcc	%l5,	0x1A29,	%i7
	fmovdle	%icc,	%f22,	%f3
	array16	%i3,	%g7,	%o3
	movgu	%xcc,	%l4,	%i6
	movre	%g2,	%g6,	%l6
	edge8n	%g5,	%i4,	%g1
	ldd	[%l7 + 0x10],	%f22
	edge16n	%i5,	%o2,	%o1
	fsrc1s	%f26,	%f6
	edge32l	%g3,	%l3,	%o7
	sdivcc	%l0,	0x16BF,	%g4
	movvs	%icc,	%l2,	%l1
	alignaddrl	%o6,	%i1,	%i2
	umul	%o4,	0x0B14,	%o5
	lduh	[%l7 + 0x0E],	%i0
	edge16l	%l5,	%o0,	%i3
	edge32l	%i7,	%g7,	%o3
	xnor	%l4,	%i6,	%g2
	fmovsvs	%icc,	%f15,	%f12
	edge32	%g6,	%g5,	%l6
	sth	%i4,	[%l7 + 0x6A]
	smul	%i5,	%o2,	%o1
	srlx	%g3,	%g1,	%l3
	orn	%o7,	0x1938,	%g4
	move	%xcc,	%l2,	%l0
	mulscc	%o6,	%l1,	%i1
	movgu	%icc,	%i2,	%o4
	movneg	%xcc,	%i0,	%l5
	udivx	%o5,	0x09C0,	%o0
	orncc	%i3,	0x1115,	%g7
	sub	%o3,	%i7,	%i6
	movrgez	%l4,	%g6,	%g5
	array8	%l6,	%i4,	%i5
	srl	%g2,	0x03,	%o2
	and	%o1,	0x0675,	%g3
	fmul8x16au	%f29,	%f7,	%f28
	std	%f0,	[%l7 + 0x78]
	srax	%g1,	%o7,	%l3
	ld	[%l7 + 0x6C],	%f29
	array32	%g4,	%l0,	%o6
	subc	%l2,	%l1,	%i2
	sllx	%o4,	0x1A,	%i0
	smulcc	%l5,	%o5,	%i1
	movl	%xcc,	%o0,	%i3
	sub	%o3,	0x00EF,	%g7
	smul	%i6,	%l4,	%i7
	st	%f3,	[%l7 + 0x20]
	movn	%xcc,	%g6,	%g5
	std	%f24,	[%l7 + 0x60]
	subccc	%i4,	%l6,	%g2
	edge8ln	%i5,	%o1,	%o2
	fsrc2	%f28,	%f16
	movpos	%icc,	%g3,	%g1
	srl	%o7,	0x05,	%g4
	edge8n	%l0,	%o6,	%l2
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%f28
	srl	%l3,	0x01,	%l1
	fmovdge	%xcc,	%f19,	%f0
	smul	%i2,	0x1850,	%o4
	sir	0x06D5
	fcmped	%fcc1,	%f30,	%f20
	mulx	%i0,	0x15AF,	%o5
	fors	%f14,	%f5,	%f7
	add	%l5,	0x0D70,	%o0
	orcc	%i3,	0x18BF,	%i1
	sll	%g7,	%o3,	%l4
	fornot1	%f18,	%f30,	%f20
	subccc	%i7,	0x1BE4,	%g6
	fornot2s	%f6,	%f5,	%f3
	siam	0x4
	fsrc2	%f28,	%f6
	lduw	[%l7 + 0x68],	%g5
	alignaddrl	%i6,	%l6,	%g2
	fmovd	%f18,	%f14
	array32	%i5,	%o1,	%o2
	sdiv	%i4,	0x1AC0,	%g3
	srax	%o7,	%g4,	%l0
	stb	%o6,	[%l7 + 0x7F]
	fnands	%f12,	%f9,	%f13
	movg	%xcc,	%l2,	%l3
	mova	%xcc,	%l1,	%i2
	edge32	%o4,	%g1,	%o5
	movpos	%xcc,	%l5,	%i0
	fpack32	%f24,	%f10,	%f16
	save %o0, %i3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i1,	%o3,	%l4
	movrne	%g6,	%g5,	%i6
	fmovrsne	%l6,	%f27,	%f22
	udivcc	%g2,	0x1FE2,	%i5
	movn	%xcc,	%i7,	%o1
	ldsh	[%l7 + 0x34],	%i4
	andncc	%o2,	%g3,	%g4
	array16	%o7,	%l0,	%l2
	sdivx	%o6,	0x05B3,	%l3
	save %l1, 0x15A8, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i2,	%o5
	nop
	set	0x08, %g2
	lduw	[%l7 + %g2],	%g1
	fmul8sux16	%f18,	%f18,	%f18
	movn	%xcc,	%l5,	%o0
	lduh	[%l7 + 0x48],	%i3
	fmovrsgez	%g7,	%f13,	%f1
	movpos	%xcc,	%i0,	%o3
	ldd	[%l7 + 0x20],	%f28
	edge16n	%l4,	%i1,	%g6
	subcc	%i6,	0x15E7,	%l6
	alignaddr	%g5,	%g2,	%i7
	xorcc	%i5,	%i4,	%o1
	umulcc	%o2,	0x1771,	%g3
	fmovsle	%xcc,	%f0,	%f7
	ldub	[%l7 + 0x57],	%g4
	ldd	[%l7 + 0x70],	%o6
	fandnot2	%f12,	%f6,	%f12
	sdivx	%l0,	0x09ED,	%o6
	fxnors	%f8,	%f15,	%f13
	fmovsge	%xcc,	%f1,	%f21
	srl	%l2,	%l1,	%l3
	save %o4, %i2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f28,	%f26,	%l5
	movcc	%xcc,	%o0,	%g1
	subccc	%i3,	0x0A3B,	%i0
	fnegd	%f6,	%f4
	array16	%o3,	%g7,	%i1
	ldub	[%l7 + 0x70],	%l4
	edge32l	%i6,	%l6,	%g5
	std	%f2,	[%l7 + 0x30]
	edge32	%g2,	%i7,	%i5
	srl	%i4,	%o1,	%o2
	andn	%g3,	%g4,	%g6
	or	%l0,	%o7,	%o6
	fpackfix	%f16,	%f21
	movgu	%xcc,	%l1,	%l2
	lduw	[%l7 + 0x44],	%o4
	move	%icc,	%i2,	%o5
	movge	%icc,	%l3,	%o0
	srax	%l5,	0x19,	%i3
	fcmpgt16	%f10,	%f10,	%i0
	mova	%xcc,	%g1,	%o3
	fones	%f1
	fcmple32	%f4,	%f16,	%g7
	stb	%i1,	[%l7 + 0x2C]
	ldsh	[%l7 + 0x0E],	%i6
	sethi	0x17E0,	%l4
	fmovdpos	%xcc,	%f22,	%f2
	movre	%l6,	%g5,	%g2
	movcs	%icc,	%i7,	%i5
	sra	%o1,	%i4,	%o2
	array8	%g3,	%g4,	%g6
	and	%l0,	0x1716,	%o6
	edge16ln	%l1,	%o7,	%o4
	array32	%l2,	%o5,	%l3
	movn	%xcc,	%i2,	%o0
	mulx	%l5,	%i0,	%g1
	xnor	%i3,	0x0023,	%o3
	orncc	%g7,	0x0859,	%i6
	movvc	%icc,	%l4,	%l6
	edge32n	%i1,	%g5,	%i7
	sethi	0x12AF,	%i5
	fmovdne	%icc,	%f6,	%f14
	movleu	%xcc,	%o1,	%i4
	stw	%o2,	[%l7 + 0x2C]
	fmul8x16au	%f16,	%f3,	%f24
	ldd	[%l7 + 0x50],	%g2
	srl	%g3,	0x00,	%g6
	fsrc2	%f26,	%f6
	fnot2	%f30,	%f14
	orcc	%l0,	%g4,	%o6
	udiv	%l1,	0x04C1,	%o4
	orcc	%o7,	0x1D2A,	%o5
	edge16n	%l2,	%i2,	%l3
	srax	%o0,	%i0,	%l5
	orcc	%i3,	%g1,	%o3
	udivx	%g7,	0x09CB,	%i6
	or	%l6,	%l4,	%g5
	and	%i1,	0x1747,	%i5
	ldsb	[%l7 + 0x3E],	%o1
	alignaddrl	%i7,	%i4,	%o2
	srlx	%g3,	%g6,	%l0
	alignaddrl	%g4,	%o6,	%g2
	movleu	%xcc,	%l1,	%o7
	movg	%icc,	%o5,	%l2
	fzero	%f0
	mova	%icc,	%i2,	%l3
	sub	%o0,	%o4,	%l5
	movvs	%icc,	%i3,	%i0
	movrne	%o3,	%g7,	%g1
	movrgz	%l6,	%l4,	%g5
	lduw	[%l7 + 0x18],	%i1
	fmovdvs	%xcc,	%f15,	%f13
	fabsd	%f28,	%f22
	fpsub32s	%f4,	%f17,	%f18
	sdiv	%i5,	0x0150,	%i6
	sub	%i7,	%o1,	%o2
	save %g3, %i4, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f28,	%f30,	%f24
	edge32	%g4,	%o6,	%g6
	fmovsvc	%icc,	%f5,	%f10
	and	%g2,	%o7,	%o5
	subcc	%l2,	%i2,	%l3
	orncc	%o0,	%o4,	%l5
	udiv	%l1,	0x0DBE,	%i3
	fpadd16s	%f26,	%f24,	%f21
	st	%f0,	[%l7 + 0x7C]
	fand	%f20,	%f16,	%f20
	orncc	%i0,	0x1394,	%o3
	fpadd16s	%f11,	%f5,	%f7
	smul	%g1,	0x0A8C,	%g7
	fornot1	%f0,	%f4,	%f20
	restore %l6, %l4, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f11,	%f12,	%f30
	edge32l	%i5,	%i6,	%g5
	udivcc	%o1,	0x1065,	%o2
	ldd	[%l7 + 0x60],	%i6
	bshuffle	%f2,	%f24,	%f14
	mulx	%i4,	%l0,	%g4
	movle	%icc,	%o6,	%g3
	fmovse	%icc,	%f12,	%f12
	stb	%g6,	[%l7 + 0x45]
	movrlez	%g2,	%o5,	%o7
	edge8ln	%l2,	%l3,	%o0
	xorcc	%o4,	0x0F62,	%l5
	orn	%i2,	0x0FCA,	%i3
	movcc	%icc,	%i0,	%l1
	stw	%g1,	[%l7 + 0x18]
	andcc	%g7,	0x1305,	%o3
	movle	%xcc,	%l4,	%l6
	ldsw	[%l7 + 0x74],	%i5
	fmovspos	%icc,	%f3,	%f26
	nop
	set	0x7C, %g6
	lduw	[%l7 + %g6],	%i1
	edge32l	%i6,	%o1,	%g5
	fmovrsgz	%i7,	%f11,	%f26
	ld	[%l7 + 0x4C],	%f21
	edge16	%i4,	%o2,	%l0
	sdiv	%g4,	0x1A5A,	%g3
	st	%f30,	[%l7 + 0x70]
	sir	0x0B1A
	movre	%g6,	0x07E,	%o6
	sir	0x1795
	movle	%xcc,	%o5,	%g2
	nop
	set	0x5D, %i1
	ldub	[%l7 + %i1],	%l2
	or	%o7,	0x0FC8,	%o0
	fmovrdlz	%l3,	%f10,	%f10
	fnot2s	%f18,	%f26
	srl	%o4,	0x07,	%l5
	fnot1	%f16,	%f18
	movle	%xcc,	%i3,	%i2
	movrgez	%i0,	0x2F2,	%l1
	ldd	[%l7 + 0x48],	%f18
	xor	%g1,	0x05CC,	%g7
	sllx	%l4,	%o3,	%l6
	ldx	[%l7 + 0x28],	%i5
	srax	%i1,	%i6,	%o1
	fone	%f12
	mulx	%g5,	%i4,	%o2
	ldx	[%l7 + 0x58],	%i7
	st	%f27,	[%l7 + 0x64]
	array32	%l0,	%g4,	%g6
	movrne	%g3,	%o6,	%g2
	srax	%l2,	%o7,	%o0
	edge32	%o5,	%o4,	%l5
	fpsub32	%f4,	%f2,	%f28
	nop
	set	0x08, %g1
	std	%f18,	[%l7 + %g1]
	movvc	%icc,	%i3,	%l3
	fmul8ulx16	%f20,	%f0,	%f20
	fnot1s	%f8,	%f11
	movl	%icc,	%i2,	%i0
	edge32l	%l1,	%g7,	%g1
	movrgez	%l4,	%o3,	%l6
	fmul8sux16	%f14,	%f16,	%f30
	movrlez	%i1,	0x151,	%i6
	movvs	%xcc,	%o1,	%i5
	fcmpeq32	%f10,	%f2,	%i4
	movg	%xcc,	%g5,	%i7
	fmovrse	%o2,	%f1,	%f6
	movrne	%g4,	0x106,	%l0
	edge32	%g3,	%g6,	%o6
	sll	%g2,	0x0F,	%o7
	edge8	%o0,	%l2,	%o4
	sir	0x0DF4
	edge32l	%o5,	%l5,	%l3
	fandnot2	%f18,	%f24,	%f2
	subc	%i3,	0x1F9E,	%i0
	movne	%xcc,	%i2,	%g7
	xnorcc	%l1,	%g1,	%l4
	fmovdleu	%icc,	%f24,	%f28
	edge32n	%o3,	%l6,	%i6
	fmovdcs	%xcc,	%f26,	%f16
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	ldsh	[%l7 + 0x64],	%i1
	addccc	%i7,	0x099B,	%g5
	for	%f16,	%f4,	%f16
	mulscc	%o2,	%g4,	%l0
	smul	%g3,	0x0059,	%o6
	array16	%g6,	%g2,	%o7
	orncc	%o0,	0x163B,	%o4
	edge32l	%l2,	%l5,	%l3
	movl	%xcc,	%i3,	%i0
	fmovde	%icc,	%f10,	%f17
	siam	0x3
	ldsw	[%l7 + 0x6C],	%o5
	fmovdvs	%xcc,	%f25,	%f5
	ldub	[%l7 + 0x14],	%g7
	srax	%l1,	0x03,	%i2
	umulcc	%l4,	0x09EB,	%g1
	movvs	%icc,	%l6,	%o3
	orn	%i6,	0x1D09,	%i5
	fmovdle	%xcc,	%f6,	%f15
	fornot2s	%f24,	%f5,	%f29
	alignaddr	%i4,	%i1,	%i7
	add	%o1,	0x19CF,	%g5
	sth	%g4,	[%l7 + 0x44]
	ldsw	[%l7 + 0x70],	%o2
	movgu	%xcc,	%l0,	%o6
	andcc	%g3,	%g6,	%g2
	xnorcc	%o7,	%o0,	%o4
	movleu	%xcc,	%l2,	%l5
	fxors	%f11,	%f15,	%f31
	edge16l	%i3,	%l3,	%i0
	std	%f20,	[%l7 + 0x70]
	udiv	%g7,	0x1398,	%o5
	save %l1, %l4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l6,	0x096A,	%o3
	ldub	[%l7 + 0x46],	%g1
	fcmpne16	%f0,	%f28,	%i6
	movge	%icc,	%i5,	%i4
	subccc	%i1,	%o1,	%g5
	edge8n	%g4,	%i7,	%l0
	fpadd16s	%f14,	%f19,	%f13
	save %o2, 0x17D8, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g6,	[%l7 + 0x6A]
	fsrc1s	%f23,	%f2
	orcc	%g2,	0x0D30,	%o7
	orn	%o6,	%o4,	%o0
	lduw	[%l7 + 0x70],	%l5
	xnor	%l2,	0x00D0,	%i3
	edge8n	%l3,	%i0,	%g7
	stw	%l1,	[%l7 + 0x38]
	lduw	[%l7 + 0x58],	%o5
	movrgez	%l4,	0x241,	%l6
	edge8	%i2,	%g1,	%o3
	fmovde	%xcc,	%f18,	%f25
	fmovrde	%i6,	%f12,	%f6
	lduw	[%l7 + 0x18],	%i4
	lduh	[%l7 + 0x44],	%i5
	fpadd32	%f10,	%f26,	%f26
	mova	%xcc,	%o1,	%g5
	movle	%xcc,	%g4,	%i7
	fmuld8ulx16	%f23,	%f22,	%f8
	addcc	%l0,	0x1D98,	%i1
	fornot2	%f24,	%f6,	%f8
	ldd	[%l7 + 0x18],	%g2
	xorcc	%o2,	%g6,	%g2
	fmovsa	%xcc,	%f26,	%f1
	edge16l	%o7,	%o6,	%o0
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%f20
	stx	%l5,	[%l7 + 0x68]
	fmovda	%icc,	%f19,	%f27
	edge32l	%o4,	%i3,	%l3
	stw	%l2,	[%l7 + 0x6C]
	fandnot2	%f26,	%f6,	%f20
	fpadd32s	%f28,	%f5,	%f10
	udivx	%i0,	0x1599,	%g7
	sdivcc	%l1,	0x0544,	%o5
	stx	%l6,	[%l7 + 0x40]
	fnand	%f14,	%f0,	%f8
	sll	%i2,	%l4,	%o3
	sdivx	%g1,	0x1E69,	%i4
	edge32l	%i6,	%o1,	%i5
	std	%f30,	[%l7 + 0x38]
	xnorcc	%g4,	%g5,	%l0
	movrgz	%i1,	0x296,	%g3
	orn	%o2,	0x0CA2,	%i7
	stw	%g2,	[%l7 + 0x14]
	andcc	%g6,	0x08A8,	%o7
	addccc	%o6,	%o0,	%o4
	edge8ln	%l5,	%i3,	%l3
	andcc	%i0,	%g7,	%l2
	sllx	%l1,	0x0A,	%o5
	subcc	%i2,	0x1AA0,	%l4
	fcmpes	%fcc3,	%f15,	%f21
	ldub	[%l7 + 0x58],	%o3
	ld	[%l7 + 0x68],	%f30
	movcc	%xcc,	%g1,	%i4
	xnor	%i6,	%o1,	%i5
	orncc	%l6,	0x16FC,	%g4
	xor	%g5,	0x07D2,	%i1
	stx	%g3,	[%l7 + 0x58]
	movpos	%xcc,	%o2,	%i7
	umulcc	%g2,	%l0,	%o7
	movn	%icc,	%o6,	%o0
	fmul8sux16	%f2,	%f4,	%f26
	stw	%o4,	[%l7 + 0x44]
	movg	%icc,	%g6,	%i3
	movl	%xcc,	%l5,	%i0
	movrne	%g7,	%l3,	%l1
	edge8n	%l2,	%i2,	%l4
	movcc	%xcc,	%o5,	%g1
	fmuld8sux16	%f27,	%f18,	%f6
	restore %i4, %o3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o1,	%i5
	fmovsl	%icc,	%f21,	%f23
	fzero	%f2
	ldd	[%l7 + 0x40],	%i6
	udivcc	%g4,	0x1FB9,	%i1
	movpos	%xcc,	%g5,	%o2
	fcmpgt32	%f18,	%f2,	%i7
	movre	%g3,	%l0,	%o7
	addc	%g2,	%o6,	%o0
	edge8	%o4,	%i3,	%g6
	edge16n	%l5,	%g7,	%i0
	popc	%l1,	%l2
	movrlz	%l3,	%l4,	%o5
	umulcc	%i2,	%i4,	%o3
	xnorcc	%g1,	0x1D3F,	%o1
	movvc	%icc,	%i6,	%i5
	fpmerge	%f5,	%f31,	%f20
	sllx	%g4,	0x11,	%l6
	edge16l	%g5,	%i1,	%o2
	fmovrsgz	%g3,	%f7,	%f27
	sir	0x15A7
	movn	%xcc,	%l0,	%o7
	st	%f11,	[%l7 + 0x30]
	sth	%i7,	[%l7 + 0x7E]
	movge	%icc,	%o6,	%o0
	srax	%g2,	%o4,	%g6
	sllx	%l5,	%i3,	%i0
	mulscc	%l1,	0x0981,	%g7
	and	%l3,	%l2,	%o5
	movvs	%xcc,	%i2,	%i4
	smul	%l4,	0x02C2,	%g1
	stx	%o1,	[%l7 + 0x30]
	st	%f29,	[%l7 + 0x30]
	popc	%i6,	%i5
	xor	%g4,	%l6,	%g5
	srax	%i1,	%o2,	%o3
	mova	%xcc,	%l0,	%g3
	fpackfix	%f6,	%f24
	mova	%icc,	%o7,	%o6
	fone	%f28
	ldd	[%l7 + 0x10],	%o0
	movrgez	%g2,	0x1F1,	%o4
	orn	%i7,	%l5,	%g6
	fmovdvs	%icc,	%f10,	%f22
	movcc	%xcc,	%i0,	%l1
	fands	%f7,	%f22,	%f13
	sethi	0x175D,	%i3
	subc	%l3,	0x1634,	%l2
	edge8n	%o5,	%i2,	%g7
	fornot2s	%f21,	%f17,	%f15
	fpackfix	%f8,	%f15
	movvc	%xcc,	%i4,	%l4
	movcc	%icc,	%g1,	%o1
	addccc	%i6,	0x01AA,	%i5
	xor	%g4,	%g5,	%l6
	andn	%o2,	0x0EC4,	%i1
	movpos	%icc,	%o3,	%l0
	fnot1s	%f9,	%f23
	edge32	%g3,	%o6,	%o7
	fmuld8ulx16	%f20,	%f20,	%f22
	fnegs	%f19,	%f24
	fmovdle	%xcc,	%f4,	%f30
	alignaddr	%o0,	%g2,	%i7
	fmovspos	%xcc,	%f28,	%f5
	edge32ln	%l5,	%g6,	%i0
	addccc	%o4,	0x1960,	%i3
	sub	%l3,	0x099D,	%l2
	fmovrsgz	%o5,	%f19,	%f14
	fmovsgu	%xcc,	%f6,	%f23
	addcc	%l1,	%g7,	%i2
	movpos	%icc,	%i4,	%g1
	st	%f20,	[%l7 + 0x10]
	stx	%l4,	[%l7 + 0x08]
	umul	%o1,	0x1D80,	%i5
	edge8n	%i6,	%g5,	%l6
	addccc	%g4,	0x05E4,	%o2
	fmovsn	%xcc,	%f23,	%f1
	udivcc	%i1,	0x0B6F,	%l0
	movre	%o3,	0x182,	%g3
	srlx	%o6,	%o7,	%g2
	udivx	%i7,	0x1246,	%o0
	addccc	%g6,	%i0,	%o4
	xor	%i3,	0x16B1,	%l5
	movrgez	%l2,	0x18C,	%l3
	fands	%f16,	%f29,	%f13
	movge	%xcc,	%o5,	%g7
	movge	%icc,	%l1,	%i4
	alignaddr	%i2,	%l4,	%o1
	fmuld8sux16	%f29,	%f21,	%f30
	fmul8x16au	%f24,	%f18,	%f22
	edge16n	%i5,	%i6,	%g5
	movvc	%xcc,	%g1,	%l6
	popc	0x03B6,	%o2
	ldsw	[%l7 + 0x5C],	%g4
	edge32	%l0,	%o3,	%g3
	move	%xcc,	%i1,	%o6
	edge8l	%o7,	%g2,	%o0
	ldsw	[%l7 + 0x40],	%i7
	fmovrdgz	%i0,	%f2,	%f4
	move	%xcc,	%o4,	%g6
	udivcc	%l5,	0x194B,	%i3
	movcs	%icc,	%l3,	%o5
	sub	%g7,	%l2,	%l1
	st	%f8,	[%l7 + 0x4C]
	orcc	%i2,	0x1C5F,	%l4
	fmovsge	%xcc,	%f21,	%f10
	fmovrdne	%o1,	%f0,	%f22
	orncc	%i5,	%i4,	%i6
	movpos	%xcc,	%g5,	%g1
	movvc	%xcc,	%l6,	%o2
	movvs	%icc,	%g4,	%l0
	orncc	%o3,	0x1FF9,	%i1
	stw	%o6,	[%l7 + 0x20]
	fmovsle	%xcc,	%f25,	%f26
	edge8	%o7,	%g3,	%g2
	edge8ln	%o0,	%i7,	%i0
	or	%g6,	%o4,	%l5
	andncc	%l3,	%i3,	%o5
	ldsh	[%l7 + 0x7E],	%l2
	movrlez	%l1,	%i2,	%g7
	xnor	%l4,	0x0ADF,	%o1
	fcmpgt32	%f4,	%f16,	%i5
	edge32n	%i6,	%i4,	%g5
	subcc	%l6,	%g1,	%o2
	movrlz	%g4,	%o3,	%i1
	sll	%o6,	0x06,	%l0
	subcc	%g3,	%o7,	%o0
	movneg	%icc,	%i7,	%g2
	subc	%g6,	%o4,	%l5
	or	%l3,	0x0038,	%i3
	alignaddr	%o5,	%l2,	%i0
	fmovse	%icc,	%f29,	%f31
	std	%f14,	[%l7 + 0x48]
	and	%l1,	0x0199,	%g7
	fands	%f22,	%f1,	%f20
	sethi	0x1CC9,	%i2
	fnot1s	%f14,	%f22
	ldx	[%l7 + 0x70],	%l4
	fandnot1	%f22,	%f30,	%f4
	ldd	[%l7 + 0x48],	%i4
	edge32l	%i6,	%i4,	%g5
	mova	%icc,	%o1,	%g1
	smulcc	%l6,	0x0B9D,	%o2
	andcc	%g4,	%o3,	%o6
	fmovd	%f12,	%f0
	fpsub16s	%f3,	%f29,	%f14
	fmovdleu	%icc,	%f4,	%f25
	alignaddrl	%l0,	%i1,	%g3
	srax	%o7,	0x12,	%i7
	udivcc	%g2,	0x0CC0,	%o0
	sll	%g6,	0x1B,	%o4
	move	%icc,	%l3,	%l5
	fornot1	%f20,	%f8,	%f6
	xor	%o5,	%l2,	%i3
	fmovdvc	%icc,	%f2,	%f23
	edge8l	%i0,	%l1,	%g7
	lduw	[%l7 + 0x18],	%i2
	fpack16	%f0,	%f8
	st	%f31,	[%l7 + 0x48]
	movcc	%icc,	%l4,	%i6
	fpackfix	%f30,	%f17
	array32	%i5,	%i4,	%g5
	edge32	%o1,	%l6,	%o2
	movvs	%xcc,	%g4,	%o3
	stb	%o6,	[%l7 + 0x4D]
	addc	%l0,	0x1CE2,	%i1
	move	%icc,	%g1,	%g3
	addcc	%o7,	0x0554,	%g2
	fzeros	%f12
	subccc	%o0,	%g6,	%i7
	nop
	set	0x48, %g4
	lduh	[%l7 + %g4],	%o4
	fmuld8sux16	%f4,	%f6,	%f22
	fmovdle	%icc,	%f0,	%f26
	fmovspos	%xcc,	%f3,	%f31
	movpos	%icc,	%l3,	%l5
	udivcc	%o5,	0x16D9,	%l2
	subc	%i0,	%i3,	%l1
	stb	%g7,	[%l7 + 0x56]
	smul	%l4,	0x1985,	%i6
	umul	%i5,	%i4,	%i2
	andcc	%g5,	%l6,	%o1
	edge16l	%o2,	%g4,	%o3
	andcc	%l0,	0x07BB,	%o6
	fzero	%f4
	ld	[%l7 + 0x74],	%f12
	movpos	%xcc,	%g1,	%i1
	fnot1	%f4,	%f12
	edge8ln	%o7,	%g2,	%o0
	umul	%g3,	0x0825,	%i7
	fmovsg	%xcc,	%f28,	%f13
	lduh	[%l7 + 0x16],	%o4
	edge32	%l3,	%l5,	%g6
	fmuld8ulx16	%f28,	%f24,	%f4
	sethi	0x1501,	%o5
	fmovsneg	%icc,	%f22,	%f2
	movleu	%xcc,	%l2,	%i0
	fmovrdne	%l1,	%f10,	%f24
	movn	%icc,	%g7,	%i3
	alignaddrl	%l4,	%i5,	%i6
	st	%f15,	[%l7 + 0x24]
	umul	%i4,	%g5,	%l6
	siam	0x2
	sdivcc	%o1,	0x0DE0,	%i2
	smul	%g4,	0x0298,	%o2
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%l0
	fmovdcc	%icc,	%f31,	%f16
	orn	%o6,	0x0D41,	%o3
	orcc	%g1,	0x016F,	%i1
	umulcc	%g2,	%o0,	%o7
	xnor	%i7,	0x09C5,	%g3
	andn	%o4,	%l3,	%l5
	sdivx	%g6,	0x1351,	%l2
	subcc	%o5,	0x1FFC,	%i0
	array32	%l1,	%g7,	%l4
	fcmped	%fcc1,	%f24,	%f30
	fmovsge	%xcc,	%f11,	%f7
	fmovdl	%icc,	%f28,	%f4
	udivcc	%i3,	0x0A0C,	%i5
	movn	%icc,	%i6,	%i4
	move	%xcc,	%g5,	%l6
	ldsh	[%l7 + 0x24],	%i2
	array8	%o1,	%g4,	%o2
	andncc	%l0,	%o6,	%g1
	mulscc	%o3,	%i1,	%g2
	ldd	[%l7 + 0x20],	%o6
	fexpand	%f19,	%f18
	fcmple16	%f26,	%f16,	%i7
	andncc	%o0,	%g3,	%l3
	udiv	%l5,	0x0711,	%g6
	addcc	%o4,	%o5,	%i0
	movge	%xcc,	%l1,	%g7
	subc	%l4,	%i3,	%l2
	edge8l	%i6,	%i4,	%i5
	andn	%l6,	0x0B30,	%g5
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	fmovsgu	%icc,	%f19,	%f10
	fmovdl	%xcc,	%f15,	%f3
	srlx	%l0,	0x07,	%o2
	fmovdn	%xcc,	%f6,	%f17
	umul	%g1,	%o3,	%i1
	xorcc	%g2,	%o6,	%i7
	ldsw	[%l7 + 0x28],	%o0
	move	%xcc,	%o7,	%l3
	sethi	0x18FF,	%l5
	edge32l	%g6,	%o4,	%o5
	movre	%g3,	0x172,	%i0
	ldsb	[%l7 + 0x09],	%l1
	xnorcc	%l4,	%g7,	%i3
	or	%i6,	0x08C2,	%i4
	movgu	%icc,	%i5,	%l6
	add	%g5,	%o1,	%l2
	movge	%xcc,	%i2,	%g4
	umulcc	%l0,	%o2,	%g1
	fxors	%f30,	%f13,	%f1
	movleu	%xcc,	%o3,	%g2
	movcs	%icc,	%i1,	%i7
	std	%f2,	[%l7 + 0x08]
	edge8l	%o0,	%o6,	%l3
	fmul8x16al	%f26,	%f23,	%f2
	fmovsn	%icc,	%f10,	%f10
	movcc	%xcc,	%l5,	%g6
	lduw	[%l7 + 0x10],	%o7
	fmovsa	%xcc,	%f4,	%f0
	movcs	%xcc,	%o5,	%o4
	move	%icc,	%i0,	%l1
	orcc	%g3,	0x1882,	%l4
	movleu	%xcc,	%g7,	%i6
	movgu	%xcc,	%i4,	%i5
	fpmerge	%f16,	%f15,	%f10
	xnorcc	%l6,	0x1703,	%g5
	array16	%o1,	%i3,	%l2
	fmuld8sux16	%f6,	%f13,	%f18
	fnot1	%f6,	%f12
	ldsb	[%l7 + 0x4D],	%g4
	ldd	[%l7 + 0x48],	%i2
	edge8ln	%o2,	%l0,	%g1
	udiv	%o3,	0x1C84,	%i1
	fcmpes	%fcc3,	%f27,	%f4
	xor	%g2,	%o0,	%i7
	ld	[%l7 + 0x78],	%f19
	fmovdcc	%xcc,	%f14,	%f23
	movrlz	%o6,	0x117,	%l5
	orncc	%l3,	%g6,	%o5
	movgu	%xcc,	%o7,	%i0
	fmovse	%icc,	%f18,	%f8
	fcmpne32	%f18,	%f24,	%l1
	fmovs	%f9,	%f9
	ldd	[%l7 + 0x68],	%f16
	movge	%xcc,	%o4,	%g3
	udiv	%g7,	0x1B5B,	%i6
	std	%f30,	[%l7 + 0x68]
	add	%l4,	0x18A1,	%i4
	ldx	[%l7 + 0x28],	%l6
	addc	%g5,	0x00C9,	%i5
	sth	%o1,	[%l7 + 0x42]
	addcc	%i3,	0x1A22,	%g4
	edge16l	%i2,	%o2,	%l2
	xorcc	%g1,	%l0,	%i1
	movgu	%icc,	%o3,	%o0
	array32	%g2,	%o6,	%l5
	subccc	%l3,	0x05CE,	%i7
	stx	%g6,	[%l7 + 0x28]
	addc	%o5,	%i0,	%l1
	udiv	%o7,	0x1F2D,	%o4
	restore %g3, %g7, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f18,	%f16,	%i4
	movle	%xcc,	%i6,	%l6
	edge8l	%g5,	%o1,	%i5
	andncc	%i3,	%g4,	%i2
	fxor	%f12,	%f6,	%f4
	mulx	%o2,	0x0A24,	%l2
	fxors	%f26,	%f21,	%f10
	fxnor	%f10,	%f6,	%f12
	array16	%l0,	%i1,	%o3
	edge16l	%o0,	%g1,	%g2
	movl	%xcc,	%l5,	%o6
	fcmple32	%f28,	%f10,	%l3
	add	%i7,	%o5,	%i0
	add	%g6,	%o7,	%l1
	sth	%g3,	[%l7 + 0x2E]
	xor	%o4,	%l4,	%i4
	srax	%g7,	0x17,	%i6
	movvc	%icc,	%g5,	%o1
	sth	%i5,	[%l7 + 0x7A]
	fmovsneg	%icc,	%f15,	%f13
	sethi	0x0C35,	%i3
	xorcc	%l6,	%i2,	%g4
	edge32n	%l2,	%o2,	%i1
	sllx	%o3,	0x00,	%l0
	movg	%xcc,	%o0,	%g1
	udiv	%g2,	0x0407,	%o6
	movneg	%xcc,	%l5,	%l3
	movvs	%icc,	%o5,	%i0
	andcc	%i7,	%g6,	%l1
	udiv	%o7,	0x1E25,	%o4
	pdist	%f26,	%f20,	%f22
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	edge8n	%g3,	%g7,	%g5
	edge16ln	%i6,	%o1,	%i5
	ldsb	[%l7 + 0x15],	%i3
	edge16ln	%i2,	%l6,	%l2
	nop
	set	0x68, %g5
	ldd	[%l7 + %g5],	%g4
	orn	%o2,	%i1,	%l0
	fmovde	%icc,	%f15,	%f17
	edge8	%o0,	%o3,	%g1
	udivcc	%o6,	0x01B9,	%g2
	xor	%l3,	%l5,	%i0
	nop
	set	0x3C, %l1
	ldsw	[%l7 + %l1],	%o5
	fandnot2	%f20,	%f6,	%f24
	edge8l	%g6,	%l1,	%o7
	fcmpgt32	%f0,	%f26,	%o4
	sdivcc	%i7,	0x1BA3,	%l4
	movg	%xcc,	%g3,	%i4
	edge32ln	%g5,	%g7,	%o1
	ldsb	[%l7 + 0x64],	%i5
	sdiv	%i6,	0x0F4E,	%i3
	fmul8x16au	%f19,	%f4,	%f2
	fnor	%f22,	%f2,	%f28
	mulx	%l6,	0x1A72,	%i2
	orn	%g4,	0x1721,	%l2
	movcs	%icc,	%i1,	%o2
	movrgz	%l0,	0x208,	%o3
	xnorcc	%o0,	%o6,	%g2
	move	%xcc,	%l3,	%g1
	fmovs	%f13,	%f20
	ldsw	[%l7 + 0x3C],	%l5
	array8	%i0,	%g6,	%l1
	sllx	%o5,	%o4,	%i7
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%o6
	movcs	%xcc,	%g3,	%i4
	and	%l4,	0x0DAF,	%g5
	umul	%o1,	%g7,	%i5
	save %i3, 0x16D5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x20],	%i6
	movvs	%icc,	%g4,	%l2
	edge16ln	%i1,	%o2,	%l0
	sdivcc	%o3,	0x1E43,	%i2
	edge16l	%o0,	%g2,	%o6
	array16	%g1,	%l5,	%i0
	movle	%icc,	%g6,	%l1
	movrlez	%l3,	0x018,	%o4
	ldsb	[%l7 + 0x7E],	%i7
	movle	%icc,	%o7,	%g3
	orn	%i4,	0x1E0A,	%o5
	movneg	%icc,	%g5,	%o1
	ldsw	[%l7 + 0x30],	%l4
	umul	%i5,	%i3,	%i6
	fcmpgt16	%f12,	%f30,	%l6
	sub	%g7,	%l2,	%g4
	subccc	%o2,	%l0,	%i1
	fmovdvs	%icc,	%f14,	%f12
	umul	%o3,	%i2,	%g2
	fones	%f23
	fmovdvs	%icc,	%f30,	%f31
	subc	%o0,	0x1752,	%g1
	subc	%l5,	0x07DB,	%o6
	st	%f27,	[%l7 + 0x24]
	sdiv	%i0,	0x0899,	%g6
	edge8n	%l1,	%l3,	%o4
	movl	%icc,	%i7,	%o7
	fpackfix	%f0,	%f7
	sdiv	%i4,	0x0E50,	%g3
	fmovdcc	%xcc,	%f0,	%f4
	lduw	[%l7 + 0x7C],	%g5
	movneg	%icc,	%o1,	%l4
	fcmple32	%f4,	%f2,	%i5
	smul	%i3,	%o5,	%i6
	addc	%g7,	0x0D19,	%l2
	movvs	%xcc,	%g4,	%l6
	movg	%icc,	%o2,	%i1
	lduw	[%l7 + 0x6C],	%l0
	add	%i2,	0x0287,	%o3
	st	%f22,	[%l7 + 0x40]
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%g2
	xnor	%g1,	%o0,	%l5
	stx	%o6,	[%l7 + 0x50]
	movneg	%xcc,	%i0,	%g6
	alignaddrl	%l3,	%l1,	%i7
	fmovscs	%icc,	%f16,	%f30
	movpos	%xcc,	%o4,	%o7
	ldub	[%l7 + 0x4A],	%i4
	subcc	%g5,	%g3,	%o1
	ld	[%l7 + 0x10],	%f14
	sll	%l4,	0x1B,	%i3
	udivcc	%o5,	0x14EC,	%i6
	movrgez	%g7,	0x2E4,	%i5
	std	%f28,	[%l7 + 0x60]
	ldsw	[%l7 + 0x1C],	%g4
	and	%l6,	%o2,	%l2
	fmovrslez	%l0,	%f16,	%f0
	sra	%i2,	%o3,	%i1
	fcmple32	%f12,	%f12,	%g2
	udiv	%g1,	0x136A,	%l5
	fmul8x16al	%f5,	%f31,	%f22
	edge32	%o6,	%i0,	%o0
	udivx	%g6,	0x168E,	%l1
	subcc	%l3,	%i7,	%o7
	movgu	%icc,	%o4,	%i4
	fnor	%f12,	%f4,	%f10
	fmovsle	%icc,	%f19,	%f25
	bshuffle	%f10,	%f2,	%f24
	sdivx	%g5,	0x198C,	%g3
	stb	%l4,	[%l7 + 0x6C]
	pdist	%f12,	%f26,	%f10
	movvs	%xcc,	%o1,	%o5
	movvs	%icc,	%i6,	%i3
	fexpand	%f2,	%f4
	fnor	%f4,	%f24,	%f24
	movrne	%i5,	%g4,	%l6
	smulcc	%g7,	0x079B,	%l2
	udivcc	%l0,	0x101D,	%o2
	sll	%i2,	%i1,	%o3
	ld	[%l7 + 0x68],	%f8
	xnor	%g1,	%l5,	%g2
	edge16ln	%i0,	%o6,	%o0
	edge8l	%g6,	%l1,	%i7
	fxor	%f0,	%f14,	%f2
	fnot1	%f24,	%f8
	xor	%l3,	0x12EF,	%o4
	add	%i4,	0x1CB0,	%g5
	sdivcc	%g3,	0x173C,	%l4
	movvs	%xcc,	%o7,	%o1
	movrgez	%o5,	%i3,	%i5
	ldub	[%l7 + 0x6F],	%i6
	movvs	%icc,	%g4,	%l6
	srlx	%g7,	0x0D,	%l0
	movrne	%l2,	0x389,	%i2
	mova	%icc,	%o2,	%o3
	fnot1	%f4,	%f10
	array32	%g1,	%i1,	%l5
	edge8n	%g2,	%o6,	%i0
	ldsw	[%l7 + 0x20],	%g6
	array16	%o0,	%i7,	%l3
	mova	%xcc,	%o4,	%i4
	fandnot1s	%f19,	%f4,	%f23
	subcc	%l1,	0x0FC6,	%g3
	fmuld8ulx16	%f15,	%f3,	%f16
	fornot1s	%f2,	%f25,	%f23
	subc	%g5,	0x0B2B,	%o7
	fzero	%f20
	movrlz	%l4,	0x1F3,	%o1
	fmovdvs	%xcc,	%f6,	%f3
	udiv	%i3,	0x1767,	%o5
	srax	%i5,	%g4,	%i6
	ldx	[%l7 + 0x70],	%g7
	array16	%l0,	%l2,	%l6
	movleu	%icc,	%i2,	%o3
	subc	%o2,	%g1,	%i1
	movrlz	%g2,	0x0C8,	%l5
	edge8ln	%i0,	%g6,	%o0
	or	%o6,	0x0847,	%l3
	edge16l	%o4,	%i7,	%l1
	fxors	%f7,	%f5,	%f31
	and	%g3,	0x0CEE,	%g5
	sra	%o7,	%l4,	%o1
	udiv	%i3,	0x1483,	%o5
	edge8ln	%i4,	%i5,	%g4
	edge16ln	%i6,	%l0,	%g7
	fzero	%f12
	edge32ln	%l2,	%i2,	%l6
	mova	%xcc,	%o2,	%o3
	udivx	%g1,	0x03E3,	%g2
	fnor	%f16,	%f26,	%f0
	fpadd16s	%f24,	%f25,	%f25
	ldub	[%l7 + 0x2F],	%l5
	andcc	%i1,	%i0,	%g6
	fpadd16s	%f31,	%f12,	%f5
	smulcc	%o6,	0x07AA,	%o0
	movleu	%icc,	%o4,	%l3
	lduw	[%l7 + 0x20],	%l1
	stw	%i7,	[%l7 + 0x4C]
	smul	%g5,	%o7,	%l4
	or	%o1,	0x0C8C,	%i3
	stb	%o5,	[%l7 + 0x7F]
	save %g3, %i5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i4,	%i6,	%g7
	fpack32	%f12,	%f6,	%f16
	movvc	%xcc,	%l0,	%i2
	edge32l	%l6,	%o2,	%l2
	umul	%g1,	0x13D3,	%g2
	fornot2s	%f25,	%f24,	%f6
	xnor	%l5,	%i1,	%o3
	udiv	%i0,	0x0C06,	%o6
	array32	%o0,	%o4,	%l3
	addccc	%l1,	%i7,	%g5
	andn	%g6,	0x071B,	%o7
	lduw	[%l7 + 0x28],	%l4
	fcmple32	%f0,	%f12,	%o1
	umulcc	%o5,	0x1EB3,	%g3
	fcmpgt16	%f12,	%f28,	%i3
	fcmple16	%f0,	%f28,	%g4
	edge16l	%i4,	%i5,	%i6
	andncc	%l0,	%i2,	%l6
	addc	%g7,	%o2,	%g1
	fnot2s	%f24,	%f31
	restore %l2, 0x0865, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1CE0,	%g2
	xnorcc	%i1,	%o3,	%i0
	fsrc2s	%f16,	%f12
	movneg	%icc,	%o6,	%o4
	sir	0x0ABC
	movrgz	%o0,	%l1,	%l3
	array16	%g5,	%g6,	%o7
	fmovsleu	%icc,	%f28,	%f5
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	fxnors	%f21,	%f24,	%f27
	fabss	%f25,	%f9
	andn	%o1,	0x18C8,	%g3
	edge32ln	%g4,	%i4,	%i3
	mova	%xcc,	%i6,	%l0
	fmovsl	%xcc,	%f20,	%f15
	edge8	%i5,	%l6,	%i2
	array16	%g7,	%g1,	%o2
	edge32n	%l2,	%l5,	%g2
	movl	%xcc,	%o3,	%i1
	fmovsle	%icc,	%f28,	%f8
	fmovdl	%icc,	%f22,	%f18
	fmovse	%icc,	%f2,	%f10
	addccc	%o6,	0x1E57,	%i0
	mulx	%o0,	0x160C,	%l1
	fpack32	%f12,	%f18,	%f26
	fmovdge	%icc,	%f12,	%f15
	edge8l	%o4,	%l3,	%g6
	for	%f4,	%f26,	%f14
	edge8	%o7,	%g5,	%i7
	edge16n	%l4,	%o1,	%g3
	array32	%o5,	%i4,	%i3
	edge8n	%i6,	%l0,	%g4
	movne	%xcc,	%l6,	%i5
	srl	%g7,	0x19,	%i2
	ldx	[%l7 + 0x40],	%g1
	stx	%l2,	[%l7 + 0x08]
	ldx	[%l7 + 0x20],	%o2
	ldsw	[%l7 + 0x60],	%l5
	ldub	[%l7 + 0x11],	%o3
	movpos	%icc,	%i1,	%o6
	movrgz	%g2,	%i0,	%l1
	fmovdgu	%xcc,	%f28,	%f26
	sth	%o0,	[%l7 + 0x24]
	srax	%l3,	%g6,	%o4
	and	%o7,	0x0793,	%i7
	mulscc	%g5,	%o1,	%g3
	ldd	[%l7 + 0x60],	%f8
	xnor	%o5,	0x0FAC,	%l4
	fmovrdne	%i3,	%f26,	%f18
	xnor	%i4,	0x1EEF,	%l0
	orn	%g4,	0x02B6,	%l6
	andn	%i5,	%i6,	%i2
	st	%f19,	[%l7 + 0x0C]
	fsrc1s	%f0,	%f5
	movg	%xcc,	%g1,	%l2
	fcmpd	%fcc1,	%f10,	%f4
	xnorcc	%g7,	%l5,	%o3
	subc	%o2,	%o6,	%g2
	sll	%i1,	0x14,	%l1
	or	%i0,	%l3,	%o0
	movrlz	%o4,	0x083,	%o7
	or	%g6,	%g5,	%i7
	sra	%g3,	%o1,	%o5
	udivx	%i3,	0x11ED,	%i4
	movge	%icc,	%l4,	%g4
	addcc	%l6,	%i5,	%i6
	fcmpne32	%f14,	%f0,	%l0
	edge32n	%i2,	%l2,	%g7
	edge32ln	%g1,	%o3,	%o2
	fmovrsgez	%l5,	%f16,	%f22
	sub	%o6,	%i1,	%l1
	ldd	[%l7 + 0x10],	%g2
	orncc	%i0,	0x1C13,	%o0
	movneg	%xcc,	%l3,	%o7
	fmul8sux16	%f26,	%f8,	%f28
	fmovdcc	%icc,	%f13,	%f19
	or	%o4,	%g6,	%g5
	movg	%icc,	%i7,	%o1
	orcc	%g3,	0x0519,	%i3
	fmovdn	%xcc,	%f3,	%f14
	add	%i4,	0x194E,	%o5
	movg	%xcc,	%g4,	%l4
	save %i5, 0x1342, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%i6,	%l0
	fandnot1s	%f7,	%f0,	%f9
	edge16ln	%l2,	%g7,	%g1
	fmovs	%f23,	%f29
	std	%f30,	[%l7 + 0x10]
	xorcc	%i2,	%o2,	%l5
	fcmpne32	%f28,	%f8,	%o6
	xor	%i1,	%l1,	%o3
	or	%i0,	%g2,	%l3
	fcmpgt16	%f30,	%f16,	%o0
	movneg	%icc,	%o4,	%g6
	array16	%g5,	%o7,	%o1
	fnot2s	%f4,	%f13
	movg	%xcc,	%g3,	%i3
	fmovsvc	%xcc,	%f9,	%f15
	movleu	%icc,	%i7,	%i4
	addc	%o5,	%g4,	%l4
	ldsb	[%l7 + 0x28],	%i5
	alignaddr	%l6,	%i6,	%l2
	movge	%icc,	%g7,	%l0
	std	%f26,	[%l7 + 0x70]
	movcs	%xcc,	%g1,	%o2
	fcmpd	%fcc1,	%f22,	%f14
	array16	%i2,	%l5,	%o6
	mova	%xcc,	%l1,	%i1
	alignaddr	%o3,	%g2,	%i0
	edge8n	%l3,	%o4,	%o0
	mova	%xcc,	%g5,	%g6
	ldx	[%l7 + 0x10],	%o7
	andcc	%o1,	0x1B32,	%i3
	alignaddrl	%g3,	%i7,	%i4
	udiv	%g4,	0x1EC6,	%o5
	fcmple32	%f24,	%f4,	%l4
	ldd	[%l7 + 0x38],	%f6
	sth	%l6,	[%l7 + 0x5E]
	fpadd16	%f18,	%f4,	%f12
	movg	%icc,	%i6,	%l2
	fands	%f13,	%f5,	%f22
	restore %g7, 0x0B67, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g1,	0x17AE,	%l0
	fcmple16	%f0,	%f28,	%o2
	srl	%l5,	0x0B,	%i2
	addcc	%l1,	%o6,	%o3
	ld	[%l7 + 0x2C],	%f13
	edge16l	%g2,	%i1,	%i0
	alignaddr	%o4,	%o0,	%g5
	fmovdcc	%icc,	%f30,	%f23
	alignaddrl	%g6,	%o7,	%o1
	array8	%i3,	%l3,	%i7
	save %g3, 0x0DA2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o5,	%i4
	move	%icc,	%l6,	%l4
	std	%f6,	[%l7 + 0x28]
	movg	%xcc,	%l2,	%g7
	xor	%i5,	0x0E74,	%i6
	ldsw	[%l7 + 0x0C],	%l0
	sll	%g1,	%o2,	%l5
	fmovrdlez	%i2,	%f6,	%f16
	array32	%l1,	%o6,	%g2
	edge16l	%o3,	%i1,	%o4
	sdiv	%i0,	0x1709,	%g5
	umul	%g6,	%o7,	%o0
	orncc	%o1,	0x0F76,	%i3
	addccc	%l3,	%i7,	%g3
	xnor	%o5,	%g4,	%i4
	edge8n	%l6,	%l2,	%l4
	fmovrdgez	%g7,	%f24,	%f24
	xor	%i6,	0x1224,	%i5
	fxor	%f0,	%f18,	%f10
	edge16n	%l0,	%g1,	%o2
	st	%f28,	[%l7 + 0x50]
	edge16l	%i2,	%l5,	%l1
	umulcc	%g2,	%o3,	%i1
	movrgz	%o6,	%o4,	%g5
	array16	%i0,	%g6,	%o7
	mulx	%o0,	%i3,	%l3
	sllx	%i7,	%g3,	%o1
	edge8l	%o5,	%g4,	%l6
	movrgz	%l2,	%l4,	%g7
	sub	%i4,	%i5,	%l0
	addcc	%i6,	%g1,	%i2
	array16	%o2,	%l1,	%l5
	ldsb	[%l7 + 0x5B],	%g2
	ldd	[%l7 + 0x10],	%i0
	add	%o6,	%o3,	%g5
	fcmpgt32	%f16,	%f16,	%o4
	movg	%icc,	%g6,	%i0
	sth	%o7,	[%l7 + 0x40]
	stw	%o0,	[%l7 + 0x40]
	edge8l	%i3,	%l3,	%i7
	movrgez	%g3,	%o5,	%o1
	sir	0x18ED
	andncc	%g4,	%l2,	%l6
	srlx	%l4,	%i4,	%i5
	xorcc	%l0,	0x1DC4,	%g7
	fnot1s	%f31,	%f2
	edge32l	%i6,	%i2,	%o2
	fpsub16s	%f1,	%f28,	%f24
	sll	%l1,	%l5,	%g2
	edge32l	%g1,	%o6,	%o3
	orn	%g5,	%i1,	%o4
	and	%g6,	%i0,	%o7
	fsrc2s	%f15,	%f16
	subcc	%o0,	0x1F5E,	%l3
	fornot1	%f14,	%f8,	%f6
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	xorcc	%o5,	0x0172,	%i7
	movvc	%icc,	%o1,	%l2
	movre	%l6,	0x099,	%l4
	edge16ln	%i4,	%i5,	%g4
	movrne	%l0,	0x15D,	%i6
	fmovdvs	%xcc,	%f23,	%f27
	alignaddrl	%i2,	%g7,	%l1
	edge16n	%l5,	%g2,	%g1
	fsrc2	%f2,	%f6
	udivcc	%o2,	0x0521,	%o3
	popc	0x0A7F,	%g5
	movneg	%xcc,	%o6,	%i1
	orn	%g6,	0x173A,	%i0
	subccc	%o7,	%o0,	%l3
	sth	%o4,	[%l7 + 0x1A]
	fmovdneg	%icc,	%f11,	%f8
	edge16	%i3,	%g3,	%o5
	xorcc	%i7,	0x0D59,	%o1
	fmovrsne	%l2,	%f14,	%f24
	subccc	%l4,	0x1247,	%l6
	movpos	%icc,	%i5,	%i4
	addc	%l0,	%g4,	%i2
	fpack16	%f24,	%f12
	sdiv	%g7,	0x147A,	%i6
	mulx	%l5,	%g2,	%l1
	array16	%o2,	%g1,	%o3
	lduw	[%l7 + 0x70],	%o6
	xor	%i1,	0x06CC,	%g6
	for	%f10,	%f12,	%f2
	smul	%g5,	0x0FA5,	%o7
	fmovscs	%icc,	%f4,	%f18
	add	%o0,	0x0DBC,	%i0
	lduw	[%l7 + 0x58],	%o4
	edge8ln	%l3,	%i3,	%o5
	sub	%g3,	0x104D,	%i7
	fors	%f27,	%f19,	%f15
	sll	%o1,	%l4,	%l6
	fcmple32	%f2,	%f16,	%l2
	add	%i5,	%l0,	%i4
	sth	%g4,	[%l7 + 0x32]
	movvs	%xcc,	%g7,	%i2
	add	%l5,	0x1116,	%i6
	subcc	%l1,	%g2,	%o2
	or	%o3,	%o6,	%i1
	andncc	%g1,	%g6,	%o7
	subc	%g5,	0x024D,	%o0
	edge16n	%i0,	%l3,	%o4
	umulcc	%i3,	0x18B1,	%o5
	array16	%i7,	%o1,	%l4
	umulcc	%l6,	%l2,	%i5
	subcc	%g3,	%l0,	%g4
	srl	%i4,	0x01,	%i2
	edge16n	%l5,	%i6,	%g7
	edge32	%l1,	%o2,	%g2
	subc	%o6,	%i1,	%o3
	add	%g1,	0x01EA,	%g6
	orn	%o7,	%g5,	%i0
	array8	%l3,	%o0,	%i3
	fabss	%f22,	%f14
	edge16n	%o4,	%o5,	%i7
	fmovdvs	%icc,	%f9,	%f12
	fcmpeq32	%f0,	%f30,	%o1
	fnegs	%f11,	%f6
	sth	%l4,	[%l7 + 0x2A]
	xnorcc	%l6,	0x1871,	%l2
	mova	%xcc,	%g3,	%l0
	sra	%g4,	%i5,	%i4
	edge8ln	%i2,	%l5,	%i6
	ldx	[%l7 + 0x40],	%g7
	xnor	%l1,	0x118E,	%o2
	movrgz	%g2,	%i1,	%o3
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%f6
	ldsw	[%l7 + 0x10],	%g1
	fnot1s	%f31,	%f16
	fpackfix	%f2,	%f18
	orn	%o6,	%g6,	%g5
	orcc	%i0,	%o7,	%o0
	movcc	%xcc,	%i3,	%o4
	fmovrdne	%o5,	%f4,	%f22
	nop
	set	0x2C, %o7
	stw	%l3,	[%l7 + %o7]
	move	%icc,	%i7,	%o1
	for	%f12,	%f20,	%f26
	movvs	%xcc,	%l4,	%l6
	sir	0x1BC4
	edge16ln	%g3,	%l0,	%l2
	lduh	[%l7 + 0x64],	%i5
	ldd	[%l7 + 0x20],	%f24
	fornot1	%f4,	%f4,	%f0
	srax	%i4,	%i2,	%l5
	sdivx	%g4,	0x0DD6,	%i6
	sdivcc	%l1,	0x1FD8,	%o2
	fornot1s	%f6,	%f16,	%f28
	orcc	%g7,	0x0263,	%i1
	sdiv	%o3,	0x0ADA,	%g2
	fzeros	%f23
	andncc	%o6,	%g6,	%g5
	movvs	%xcc,	%i0,	%g1
	sethi	0x1BC6,	%o7
	sdiv	%o0,	0x1931,	%o4
	stx	%o5,	[%l7 + 0x60]
	fornot2s	%f30,	%f8,	%f18
	ldsw	[%l7 + 0x34],	%i3
	sdivx	%i7,	0x0595,	%o1
	sll	%l4,	0x08,	%l6
	subc	%g3,	%l3,	%l2
	addc	%i5,	%l0,	%i4
	sir	0x0640
	fornot1	%f28,	%f16,	%f6
	andn	%i2,	0x1ECB,	%g4
	addc	%i6,	0x1DC6,	%l1
	smul	%l5,	0x166B,	%o2
	sethi	0x1E5A,	%i1
	fmovda	%xcc,	%f22,	%f23
	andn	%o3,	0x0680,	%g7
	xorcc	%g2,	%o6,	%g5
	edge8	%g6,	%i0,	%o7
	movge	%xcc,	%o0,	%o4
	movge	%icc,	%o5,	%g1
	fnor	%f2,	%f4,	%f20
	lduw	[%l7 + 0x28],	%i7
	movre	%o1,	0x12D,	%i3
	popc	0x0378,	%l6
	fzero	%f18
	movge	%xcc,	%g3,	%l3
	edge32n	%l4,	%l2,	%l0
	edge8n	%i4,	%i2,	%g4
	edge32	%i5,	%l1,	%l5
	fcmpes	%fcc0,	%f26,	%f25
	and	%o2,	%i1,	%i6
	move	%xcc,	%o3,	%g7
	udiv	%o6,	0x0A83,	%g5
	orcc	%g6,	%g2,	%i0
	movvs	%icc,	%o0,	%o4
	umul	%o5,	0x1F60,	%g1
	movneg	%xcc,	%o7,	%o1
	andcc	%i3,	0x0E2F,	%i7
	sdivcc	%l6,	0x1887,	%g3
	save %l4, 0x1472, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x64],	%l0
	stx	%i4,	[%l7 + 0x50]
	edge16l	%l2,	%i2,	%g4
	sdivx	%l1,	0x0E85,	%l5
	ldx	[%l7 + 0x08],	%o2
	orncc	%i5,	%i1,	%i6
	edge8ln	%o3,	%g7,	%g5
	andncc	%g6,	%o6,	%i0
	fmovsvc	%xcc,	%f25,	%f3
	fsrc2s	%f10,	%f21
	fpack32	%f30,	%f0,	%f30
	fmovse	%xcc,	%f22,	%f16
	fnegs	%f29,	%f19
	movre	%g2,	%o0,	%o4
	movle	%xcc,	%g1,	%o7
	fmovsle	%icc,	%f12,	%f10
	ldsb	[%l7 + 0x7A],	%o1
	sdivx	%o5,	0x19BE,	%i7
	xorcc	%l6,	%i3,	%l4
	srax	%g3,	%l3,	%i4
	srlx	%l2,	%i2,	%l0
	edge8n	%g4,	%l1,	%l5
	ldx	[%l7 + 0x70],	%i5
	movn	%icc,	%i1,	%i6
	move	%xcc,	%o3,	%o2
	save %g5, 0x04AB, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g6,	%o6
	movrgez	%g2,	0x1A6,	%i0
	stx	%o0,	[%l7 + 0x28]
	orcc	%o4,	%o7,	%g1
	ldd	[%l7 + 0x50],	%f10
	fmovspos	%icc,	%f3,	%f21
	mulx	%o5,	%i7,	%l6
	movrgz	%o1,	0x348,	%l4
	movrgez	%i3,	%l3,	%i4
	fnands	%f28,	%f10,	%f14
	popc	%l2,	%i2
	edge16	%g3,	%l0,	%g4
	st	%f17,	[%l7 + 0x50]
	fmovsl	%xcc,	%f31,	%f19
	addc	%l1,	0x0C59,	%i5
	umulcc	%l5,	0x1FFB,	%i6
	movgu	%xcc,	%i1,	%o2
	fones	%f8
	edge16	%g5,	%g7,	%g6
	restore %o6, %o3, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%i0,	%o4
	fmovrsgz	%o0,	%f7,	%f17
	movne	%xcc,	%g1,	%o7
	umul	%o5,	0x1049,	%l6
	srlx	%o1,	%l4,	%i3
	fmovrsgez	%l3,	%f29,	%f1
	edge16n	%i4,	%i7,	%l2
	fmovrse	%g3,	%f12,	%f30
	edge8ln	%l0,	%i2,	%l1
	edge16n	%i5,	%l5,	%g4
	edge8n	%i6,	%i1,	%o2
	subcc	%g5,	%g6,	%g7
	sub	%o3,	0x136C,	%o6
	movcs	%icc,	%g2,	%i0
	lduh	[%l7 + 0x38],	%o4
	stb	%g1,	[%l7 + 0x69]
	movrlz	%o7,	0x398,	%o0
	subcc	%o5,	0x171C,	%o1
	fmul8x16au	%f29,	%f12,	%f14
	udivcc	%l6,	0x0431,	%i3
	ldsw	[%l7 + 0x64],	%l3
	movne	%xcc,	%i4,	%l4
	umulcc	%i7,	0x1038,	%g3
	edge16l	%l2,	%l0,	%l1
	add	%i2,	0x01B7,	%l5
	umulcc	%i5,	0x001B,	%i6
	xnorcc	%i1,	%g4,	%g5
	fmovrdlz	%o2,	%f18,	%f18
	xorcc	%g7,	0x122F,	%o3
	ldsw	[%l7 + 0x6C],	%g6
	stw	%o6,	[%l7 + 0x38]
	std	%f6,	[%l7 + 0x20]
	edge8l	%i0,	%o4,	%g2
	fmul8x16au	%f14,	%f16,	%f14
	edge32ln	%g1,	%o0,	%o7
	stw	%o5,	[%l7 + 0x60]
	movn	%icc,	%l6,	%i3
	smul	%l3,	%i4,	%l4
	edge8l	%i7,	%g3,	%o1
	movrne	%l2,	0x3CF,	%l0
	lduh	[%l7 + 0x64],	%l1
	ldsb	[%l7 + 0x5F],	%l5
	movrlz	%i2,	%i6,	%i5
	fsrc2s	%f21,	%f31
	movrne	%g4,	%i1,	%o2
	stw	%g5,	[%l7 + 0x38]
	orcc	%o3,	0x1385,	%g7
	movpos	%icc,	%g6,	%o6
	sdivcc	%i0,	0x1B10,	%g2
	pdist	%f18,	%f0,	%f28
	xorcc	%o4,	0x1E2A,	%g1
	fmovdcs	%icc,	%f17,	%f22
	lduw	[%l7 + 0x68],	%o0
	fpackfix	%f16,	%f21
	add	%o7,	0x1942,	%l6
	movne	%xcc,	%o5,	%i3
	array8	%i4,	%l4,	%l3
	fmovsg	%icc,	%f9,	%f0
	sethi	0x13EA,	%g3
	movrlz	%i7,	0x07C,	%l2
	fmovrdlz	%o1,	%f10,	%f4
	movn	%icc,	%l1,	%l5
	andncc	%l0,	%i6,	%i2
	array16	%g4,	%i1,	%i5
	lduw	[%l7 + 0x34],	%o2
	movl	%icc,	%o3,	%g7
	edge32	%g6,	%o6,	%g5
	array16	%i0,	%o4,	%g1
	sllx	%g2,	0x08,	%o7
	stx	%o0,	[%l7 + 0x10]
	andncc	%o5,	%l6,	%i4
	edge32ln	%l4,	%l3,	%i3
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	smulcc	%o1,	%l1,	%i7
	ld	[%l7 + 0x50],	%f27
	lduh	[%l7 + 0x4E],	%l5
	movge	%icc,	%i6,	%i2
	movge	%xcc,	%g4,	%l0
	srl	%i5,	%i1,	%o2
	sllx	%o3,	0x02,	%g7
	sth	%o6,	[%l7 + 0x0A]
	orcc	%g6,	%g5,	%o4
	mulx	%g1,	%g2,	%i0
	sth	%o0,	[%l7 + 0x4C]
	edge32l	%o7,	%l6,	%o5
	fsrc1s	%f26,	%f14
	ldsb	[%l7 + 0x7A],	%i4
	movpos	%xcc,	%l4,	%i3
	fmovrsgez	%g3,	%f15,	%f13
	orn	%l2,	0x1ECB,	%l3
	movrlz	%l1,	0x3F5,	%i7
	movgu	%xcc,	%l5,	%o1
	or	%i6,	0x0917,	%i2
	movrne	%l0,	%g4,	%i5
	udivcc	%i1,	0x195E,	%o2
	srlx	%o3,	%o6,	%g7
	sethi	0x1CF7,	%g6
	and	%o4,	%g5,	%g1
	fmovdpos	%xcc,	%f1,	%f2
	addc	%i0,	%g2,	%o7
	udivx	%o0,	0x1DAC,	%o5
	mova	%icc,	%i4,	%l4
	movneg	%icc,	%i3,	%l6
	fmovdne	%xcc,	%f29,	%f29
	sra	%l2,	%l3,	%g3
	lduw	[%l7 + 0x78],	%i7
	srlx	%l5,	0x14,	%o1
	smul	%i6,	%i2,	%l0
	fmovdleu	%icc,	%f15,	%f24
	sub	%l1,	%g4,	%i5
	movcc	%icc,	%o2,	%i1
	addcc	%o6,	%o3,	%g7
	movleu	%xcc,	%o4,	%g5
	mulx	%g1,	%i0,	%g6
	srax	%g2,	0x15,	%o0
	mulscc	%o7,	0x1621,	%i4
	movrlez	%o5,	%i3,	%l6
	stb	%l2,	[%l7 + 0x42]
	fmovsge	%icc,	%f31,	%f4
	move	%xcc,	%l4,	%g3
	save %i7, %l3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o1,	[%l7 + 0x58]
	save %i2, 0x1501, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l1,	0x0694,	%g4
	nop
	set	0x44, %i7
	lduw	[%l7 + %i7],	%i5
	fone	%f28
	edge8n	%l0,	%i1,	%o6
	andn	%o3,	0x1210,	%o2
	ldd	[%l7 + 0x48],	%f10
	add	%o4,	%g7,	%g5
	lduw	[%l7 + 0x68],	%g1
	fnot2	%f12,	%f10
	sdivx	%g6,	0x0B85,	%g2
	movne	%icc,	%o0,	%i0
	fmovrsgz	%o7,	%f15,	%f20
	stw	%o5,	[%l7 + 0x14]
	xorcc	%i4,	%l6,	%l2
	save %i3, 0x0329, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g3,	%l3,	%l5
	edge16l	%o1,	%i2,	%i7
	andncc	%i6,	%l1,	%i5
	fexpand	%f19,	%f22
	movrgez	%g4,	%i1,	%o6
	fmovrdgez	%o3,	%f2,	%f10
	fone	%f8
	edge8	%o2,	%o4,	%g7
	sll	%l0,	0x02,	%g1
	udivcc	%g5,	0x0B5B,	%g6
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%f26
	fmovsn	%icc,	%f31,	%f3
	fpadd16s	%f19,	%f10,	%f4
	movcs	%xcc,	%o0,	%i0
	move	%icc,	%o7,	%g2
	fandnot1s	%f28,	%f14,	%f8
	faligndata	%f0,	%f4,	%f22
	fornot2s	%f14,	%f22,	%f5
	ldd	[%l7 + 0x70],	%o4
	orncc	%l6,	0x0734,	%i4
	or	%l2,	0x025A,	%i3
	add	%l4,	%l3,	%g3
	add	%o1,	%l5,	%i2
	ldsh	[%l7 + 0x4A],	%i7
	xorcc	%i6,	0x1DEF,	%l1
	fcmpne32	%f14,	%f6,	%g4
	fmovrslz	%i1,	%f25,	%f9
	fmovsvs	%icc,	%f14,	%f10
	umulcc	%i5,	%o3,	%o2
	movne	%xcc,	%o6,	%o4
	edge32ln	%l0,	%g7,	%g1
	sth	%g6,	[%l7 + 0x7A]
	mova	%xcc,	%g5,	%i0
	sra	%o0,	0x13,	%g2
	orcc	%o5,	%o7,	%l6
	array8	%i4,	%i3,	%l4
	movcc	%xcc,	%l3,	%g3
	ldsb	[%l7 + 0x20],	%o1
	fornot2	%f12,	%f12,	%f4
	subc	%l2,	0x099E,	%l5
	movneg	%icc,	%i2,	%i7
	fones	%f8
	sdiv	%l1,	0x0373,	%i6
	edge16ln	%g4,	%i1,	%o3
	smul	%o2,	%o6,	%i5
	ldub	[%l7 + 0x36],	%o4
	movre	%l0,	%g1,	%g6
	movrlez	%g7,	0x1C5,	%i0
	fmuld8sux16	%f31,	%f25,	%f28
	std	%f28,	[%l7 + 0x58]
	movre	%g5,	0x1F6,	%o0
	subc	%g2,	%o5,	%o7
	subccc	%l6,	%i3,	%i4
	movne	%icc,	%l4,	%g3
	movrlz	%o1,	0x025,	%l3
	fand	%f30,	%f22,	%f2
	andn	%l2,	%l5,	%i2
	andn	%l1,	%i7,	%i6
	fmovdl	%icc,	%f27,	%f5
	orn	%g4,	%i1,	%o3
	ldub	[%l7 + 0x44],	%o6
	srl	%o2,	0x15,	%i5
	lduw	[%l7 + 0x30],	%o4
	srl	%g1,	0x0E,	%l0
	fpsub32	%f2,	%f18,	%f2
	edge32l	%g6,	%i0,	%g5
	sdivx	%o0,	0x1F15,	%g7
	udivcc	%o5,	0x1B1E,	%g2
	subcc	%l6,	0x011C,	%o7
	fmovdgu	%icc,	%f14,	%f26
	ldsw	[%l7 + 0x2C],	%i3
	fpadd32s	%f19,	%f23,	%f19
	fmovdvs	%icc,	%f28,	%f12
	sdivcc	%l4,	0x0E4F,	%i4
	edge16ln	%o1,	%g3,	%l2
	edge8	%l5,	%l3,	%i2
	sll	%l1,	0x1E,	%i6
	movcs	%icc,	%g4,	%i7
	edge32l	%o3,	%o6,	%o2
	movcc	%xcc,	%i1,	%i5
	srlx	%o4,	%g1,	%g6
	ldx	[%l7 + 0x78],	%l0
	fmovsneg	%icc,	%f27,	%f9
	udivcc	%i0,	0x118C,	%g5
	edge8n	%o0,	%g7,	%g2
	movleu	%xcc,	%l6,	%o7
	fpmerge	%f6,	%f1,	%f0
	edge32l	%o5,	%i3,	%i4
	ldsb	[%l7 + 0x66],	%o1
	movvc	%icc,	%l4,	%l2
	edge8n	%g3,	%l5,	%l3
	movvs	%xcc,	%l1,	%i2
	sra	%i6,	0x18,	%i7
	ldsb	[%l7 + 0x7B],	%g4
	mulx	%o6,	0x0719,	%o3
	smulcc	%o2,	%i1,	%o4
	alignaddr	%i5,	%g1,	%g6
	edge8n	%i0,	%g5,	%o0
	andncc	%l0,	%g7,	%g2
	edge8ln	%o7,	%l6,	%i3
	xor	%i4,	0x01A6,	%o1
	sdiv	%l4,	0x06F4,	%o5
	fmovdl	%icc,	%f2,	%f22
	ldsh	[%l7 + 0x7C],	%l2
	srl	%g3,	%l5,	%l1
	xnor	%i2,	0x00CE,	%l3
	fmovdl	%xcc,	%f19,	%f11
	edge32l	%i6,	%g4,	%i7
	edge32l	%o3,	%o2,	%i1
	movneg	%xcc,	%o6,	%o4
	andncc	%g1,	%i5,	%g6
	lduw	[%l7 + 0x0C],	%i0
	nop
	set	0x27, %g7
	ldsb	[%l7 + %g7],	%g5
	xnorcc	%o0,	0x121D,	%g7
	fnor	%f20,	%f8,	%f16
	edge8ln	%l0,	%o7,	%l6
	mova	%icc,	%g2,	%i4
	umulcc	%o1,	0x02FD,	%i3
	movle	%icc,	%l4,	%o5
	orcc	%g3,	%l2,	%l1
	fmovrslz	%i2,	%f17,	%f1
	fmovdneg	%xcc,	%f29,	%f5
	fpsub32s	%f12,	%f27,	%f20
	fpadd16	%f12,	%f14,	%f26
	movle	%xcc,	%l3,	%l5
	andcc	%g4,	%i6,	%i7
	alignaddr	%o3,	%i1,	%o2
	subcc	%o6,	%g1,	%i5
	udiv	%g6,	0x0246,	%o4
	smulcc	%g5,	0x1C86,	%i0
	stw	%o0,	[%l7 + 0x24]
	edge16	%g7,	%o7,	%l6
	mova	%icc,	%g2,	%i4
	fcmpes	%fcc1,	%f14,	%f18
	fornot2	%f2,	%f20,	%f2
	ldsh	[%l7 + 0x38],	%o1
	movre	%i3,	%l0,	%l4
	restore %g3, %o5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l1,	0x0B33,	%l3
	fnot2s	%f13,	%f13
	movpos	%icc,	%i2,	%g4
	udivcc	%i6,	0x121F,	%l5
	fmovdg	%xcc,	%f26,	%f21
	edge32l	%i7,	%o3,	%i1
	sdivx	%o6,	0x05BD,	%o2
	srlx	%g1,	0x07,	%i5
	sdiv	%o4,	0x16F6,	%g5
	addccc	%g6,	0x07F0,	%o0
	sdiv	%i0,	0x1982,	%o7
	movge	%xcc,	%g7,	%g2
	edge32	%l6,	%i4,	%o1
	movgu	%xcc,	%i3,	%l0
	xorcc	%l4,	%g3,	%l2
	andcc	%l1,	%o5,	%i2
	edge8	%l3,	%g4,	%i6
	and	%l5,	0x1085,	%i7
	fcmple16	%f16,	%f24,	%o3
	ld	[%l7 + 0x58],	%f13
	subc	%i1,	%o6,	%o2
	movl	%xcc,	%g1,	%o4
	andcc	%i5,	%g6,	%g5
	edge8	%o0,	%i0,	%g7
	fzeros	%f28
	andcc	%g2,	0x08A3,	%o7
	fcmpgt32	%f28,	%f26,	%i4
	addcc	%l6,	0x1C49,	%i3
	fabsd	%f14,	%f24
	ldsh	[%l7 + 0x4A],	%o1
	fmovdn	%icc,	%f25,	%f16
	ldub	[%l7 + 0x40],	%l0
	ldd	[%l7 + 0x58],	%g2
	edge32l	%l4,	%l2,	%o5
	orcc	%l1,	0x0458,	%l3
	popc	0x0136,	%g4
	ldd	[%l7 + 0x30],	%i2
	movgu	%xcc,	%l5,	%i7
	movrne	%o3,	%i6,	%i1
	st	%f23,	[%l7 + 0x54]
	fmovsleu	%icc,	%f31,	%f3
	array32	%o2,	%g1,	%o6
	srax	%o4,	0x15,	%i5
	array32	%g5,	%g6,	%i0
	ldd	[%l7 + 0x50],	%g6
	addcc	%o0,	0x1458,	%g2
	ldsw	[%l7 + 0x3C],	%o7
	orcc	%l6,	%i3,	%o1
	sll	%l0,	%g3,	%i4
	fnot2	%f30,	%f0
	srl	%l4,	0x01,	%l2
	edge8	%l1,	%l3,	%o5
	srl	%g4,	0x0E,	%i2
	srlx	%l5,	0x0B,	%i7
	sllx	%o3,	%i1,	%i6
	ldd	[%l7 + 0x68],	%g0
	sir	0x0937
	srlx	%o6,	0x1C,	%o2
	movrlez	%i5,	0x157,	%o4
	fpack16	%f20,	%f12
	fmovdgu	%icc,	%f20,	%f28
	move	%xcc,	%g6,	%g5
	movcs	%xcc,	%i0,	%o0
	movleu	%xcc,	%g7,	%g2
	umulcc	%o7,	0x1A7A,	%i3
	sdivcc	%o1,	0x0AD4,	%l0
	fmovsvc	%icc,	%f25,	%f0
	umulcc	%g3,	%i4,	%l6
	ldsh	[%l7 + 0x2C],	%l2
	alignaddr	%l1,	%l4,	%o5
	mulx	%l3,	0x15DB,	%g4
	movcs	%xcc,	%l5,	%i2
	movrgez	%o3,	%i7,	%i6
	fnegs	%f23,	%f13
	ldsw	[%l7 + 0x78],	%g1
	andcc	%o6,	0x14B0,	%o2
	movleu	%icc,	%i1,	%i5
	ldsh	[%l7 + 0x12],	%g6
	sdivx	%o4,	0x1AC7,	%g5
	movvs	%xcc,	%o0,	%i0
	orcc	%g7,	0x0FBA,	%o7
	st	%f24,	[%l7 + 0x10]
	srlx	%g2,	%i3,	%l0
	fmovsvc	%xcc,	%f21,	%f21
	umulcc	%g3,	%o1,	%i4
	ldub	[%l7 + 0x3E],	%l2
	fmovsne	%icc,	%f20,	%f6
	lduh	[%l7 + 0x26],	%l6
	stx	%l1,	[%l7 + 0x20]
	sdivcc	%o5,	0x017F,	%l4
	movvs	%xcc,	%g4,	%l5
	movvs	%icc,	%l3,	%o3
	alignaddrl	%i7,	%i2,	%g1
	addccc	%o6,	%o2,	%i6
	array16	%i5,	%i1,	%o4
	mulscc	%g5,	%o0,	%i0
	for	%f14,	%f24,	%f10
	edge16n	%g6,	%o7,	%g7
	sub	%g2,	0x12B9,	%i3
	edge32	%l0,	%o1,	%g3
	fpadd32s	%f20,	%f2,	%f0
	andncc	%l2,	%i4,	%l6
	fnand	%f2,	%f16,	%f14
	save %o5, 0x1A9F, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l1,	0x0EE4,	%g4
	movvs	%icc,	%l5,	%o3
	sub	%i7,	%i2,	%g1
	add	%o6,	%o2,	%i6
	fzeros	%f24
	udivcc	%l3,	0x125C,	%i5
	fand	%f12,	%f26,	%f16
	movcs	%xcc,	%i1,	%o4
	xor	%o0,	0x1E27,	%i0
	sllx	%g5,	0x11,	%o7
	movne	%xcc,	%g7,	%g2
	orcc	%i3,	0x1456,	%l0
	fzeros	%f30
	subccc	%g6,	%g3,	%l2
	fmovscc	%icc,	%f14,	%f27
	movcc	%icc,	%i4,	%o1
	stx	%o5,	[%l7 + 0x58]
	sir	0x1FF0
	edge16n	%l4,	%l6,	%g4
	fands	%f28,	%f14,	%f11
	subcc	%l5,	%l1,	%i7
	ldsw	[%l7 + 0x34],	%i2
	array8	%g1,	%o6,	%o3
	fands	%f15,	%f4,	%f5
	movpos	%xcc,	%i6,	%o2
	fone	%f8
	edge16ln	%l3,	%i5,	%o4
	udivx	%i1,	0x1BBE,	%o0
	movg	%icc,	%g5,	%o7
	edge16ln	%i0,	%g2,	%i3
	array32	%l0,	%g6,	%g3
	fmovdcs	%icc,	%f20,	%f15
	edge16l	%g7,	%l2,	%i4
	edge32ln	%o1,	%o5,	%l6
	andncc	%l4,	%l5,	%g4
	movcc	%icc,	%l1,	%i7
	movneg	%xcc,	%i2,	%o6
	ldx	[%l7 + 0x20],	%g1
	ld	[%l7 + 0x5C],	%f2
	sir	0x1861
	fxor	%f6,	%f4,	%f14
	fmovrdne	%o3,	%f24,	%f10
	sdivcc	%o2,	0x0B29,	%i6
	edge8n	%i5,	%l3,	%o4
	edge16	%o0,	%i1,	%o7
	movl	%xcc,	%g5,	%g2
	movcs	%xcc,	%i3,	%l0
	movle	%xcc,	%i0,	%g6
	sll	%g7,	0x1B,	%l2
	xnorcc	%g3,	%i4,	%o1
	st	%f1,	[%l7 + 0x30]
	mulscc	%o5,	0x1528,	%l4
	movn	%icc,	%l5,	%l6
	addcc	%l1,	0x1465,	%g4
	subccc	%i7,	0x0162,	%o6
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	edge8l	%o2,	%i5,	%l3
	fcmpes	%fcc0,	%f27,	%f10
	stx	%o4,	[%l7 + 0x08]
	sdiv	%o0,	0x0FF4,	%i1
	fmovsl	%icc,	%f2,	%f30
	edge16n	%o7,	%g5,	%g2
	sll	%i6,	%l0,	%i0
	ldsb	[%l7 + 0x16],	%g6
	lduw	[%l7 + 0x54],	%g7
	movrlz	%i3,	%l2,	%g3
	ldd	[%l7 + 0x10],	%i4
	stb	%o1,	[%l7 + 0x2F]
	edge8l	%l4,	%o5,	%l6
	ldd	[%l7 + 0x08],	%l4
	edge32n	%l1,	%i7,	%o6
	fmovrslez	%g1,	%f3,	%f27
	movl	%icc,	%g4,	%i2
	array32	%o3,	%i5,	%o2
	fnot1	%f30,	%f24
	movleu	%xcc,	%l3,	%o4
	orncc	%i1,	%o7,	%o0
	umul	%g2,	%g5,	%i6
	alignaddrl	%l0,	%g6,	%g7
	or	%i3,	%l2,	%g3
	ld	[%l7 + 0x1C],	%f22
	orncc	%i0,	%o1,	%l4
	st	%f24,	[%l7 + 0x28]
	edge8	%i4,	%l6,	%l5
	fnor	%f0,	%f18,	%f22
	lduh	[%l7 + 0x7A],	%o5
	fcmpd	%fcc3,	%f10,	%f10
	xorcc	%i7,	0x075E,	%l1
	umul	%g1,	%o6,	%g4
	st	%f29,	[%l7 + 0x68]
	edge8l	%i2,	%i5,	%o3
	stx	%l3,	[%l7 + 0x28]
	ldsw	[%l7 + 0x18],	%o4
	movleu	%icc,	%i1,	%o7
	fmuld8ulx16	%f21,	%f15,	%f20
	lduh	[%l7 + 0x3E],	%o2
	subc	%g2,	0x08E7,	%o0
	fmovsgu	%icc,	%f8,	%f31
	sth	%i6,	[%l7 + 0x28]
	srl	%l0,	%g5,	%g6
	edge16n	%i3,	%g7,	%g3
	mova	%icc,	%l2,	%i0
	edge32ln	%o1,	%l4,	%l6
	addcc	%l5,	%o5,	%i7
	fandnot1	%f20,	%f0,	%f12
	fandnot2	%f18,	%f8,	%f22
	subcc	%i4,	0x14BF,	%l1
	edge16l	%g1,	%g4,	%i2
	restore %o6, 0x1492, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x76, %o5
	lduh	[%l7 + %o5],	%o3
	subccc	%o4,	0x1B07,	%i1
	mulx	%o7,	%l3,	%o2
	movg	%xcc,	%o0,	%i6
	mulx	%l0,	0x1ECC,	%g5
	orn	%g2,	%i3,	%g7
	umul	%g3,	0x080C,	%g6
	fcmps	%fcc3,	%f21,	%f8
	stb	%i0,	[%l7 + 0x15]
	fabss	%f9,	%f5
	srlx	%l2,	%o1,	%l4
	mulx	%l5,	%l6,	%i7
	stb	%o5,	[%l7 + 0x62]
	fmovrsgz	%i4,	%f18,	%f16
	addccc	%l1,	0x15E2,	%g1
	subc	%g4,	0x0620,	%o6
	addcc	%i2,	%o3,	%i5
	edge8ln	%o4,	%i1,	%l3
	movcs	%icc,	%o7,	%o0
	fnegs	%f6,	%f17
	edge8l	%i6,	%l0,	%g5
	edge8l	%g2,	%o2,	%i3
	edge8ln	%g3,	%g7,	%g6
	fmuld8ulx16	%f31,	%f24,	%f2
	fnegs	%f0,	%f12
	xnor	%i0,	%l2,	%o1
	array8	%l5,	%l4,	%l6
	fcmple16	%f14,	%f24,	%i7
	sdivx	%o5,	0x1C21,	%l1
	fpsub16s	%f3,	%f5,	%f25
	udivx	%i4,	0x075A,	%g4
	mova	%icc,	%g1,	%i2
	edge16l	%o6,	%i5,	%o4
	movn	%icc,	%o3,	%i1
	fmovsle	%icc,	%f11,	%f3
	movrgz	%l3,	%o0,	%o7
	fornot2s	%f27,	%f22,	%f8
	fmovdle	%xcc,	%f18,	%f1
	ld	[%l7 + 0x3C],	%f3
	add	%i6,	%l0,	%g2
	movpos	%xcc,	%o2,	%g5
	subc	%i3,	%g7,	%g3
	movne	%xcc,	%g6,	%i0
	lduw	[%l7 + 0x10],	%l2
	movneg	%xcc,	%l5,	%l4
	fmovde	%icc,	%f30,	%f10
	fmovsle	%xcc,	%f12,	%f28
	fands	%f11,	%f12,	%f4
	movvs	%xcc,	%o1,	%l6
	edge32ln	%i7,	%o5,	%i4
	smulcc	%g4,	0x122C,	%l1
	movge	%xcc,	%i2,	%o6
	srl	%g1,	0x17,	%i5
	umulcc	%o3,	%o4,	%i1
	ld	[%l7 + 0x78],	%f25
	fmovsvs	%icc,	%f20,	%f20
	fmovrslz	%o0,	%f16,	%f6
	stx	%l3,	[%l7 + 0x28]
	ldd	[%l7 + 0x58],	%i6
	subcc	%l0,	0x06A9,	%g2
	xorcc	%o7,	%g5,	%i3
	fcmpeq16	%f6,	%f20,	%o2
	movvs	%icc,	%g7,	%g3
	srlx	%g6,	%l2,	%l5
	ldd	[%l7 + 0x58],	%f12
	fzero	%f6
	sdivcc	%i0,	0x1199,	%o1
	orcc	%l6,	0x1F3F,	%i7
	fmovrse	%o5,	%f29,	%f22
	move	%icc,	%l4,	%i4
	or	%g4,	0x0AFD,	%i2
	subccc	%l1,	0x1C30,	%o6
	movl	%xcc,	%i5,	%g1
	edge32	%o3,	%i1,	%o0
	srl	%o4,	%i6,	%l0
	sethi	0x04B6,	%l3
	umul	%g2,	%o7,	%i3
	alignaddrl	%o2,	%g5,	%g7
	fmovrde	%g3,	%f2,	%f28
	umul	%l2,	%l5,	%g6
	fpsub32	%f14,	%f18,	%f28
	and	%i0,	%o1,	%l6
	smul	%i7,	%l4,	%i4
	fmovscs	%xcc,	%f19,	%f1
	movleu	%xcc,	%g4,	%o5
	fcmps	%fcc2,	%f5,	%f26
	ldd	[%l7 + 0x60],	%i2
	movl	%xcc,	%l1,	%o6
	mulscc	%i5,	%o3,	%g1
	movle	%xcc,	%o0,	%o4
	fmuld8ulx16	%f31,	%f26,	%f16
	movne	%xcc,	%i1,	%i6
	fmovsvc	%icc,	%f5,	%f16
	sdivcc	%l3,	0x159A,	%g2
	popc	0x1B23,	%l0
	edge32n	%o7,	%i3,	%o2
	movvc	%icc,	%g5,	%g3
	st	%f24,	[%l7 + 0x14]
	fsrc2	%f10,	%f22
	sra	%l2,	%l5,	%g7
	xorcc	%i0,	%o1,	%l6
	srax	%i7,	%g6,	%l4
	movne	%icc,	%g4,	%o5
	udivx	%i2,	0x1710,	%l1
	fmovsl	%xcc,	%f8,	%f31
	ldsb	[%l7 + 0x6F],	%i4
	udivcc	%o6,	0x0AAE,	%o3
	fpmerge	%f4,	%f8,	%f4
	srax	%g1,	%i5,	%o4
	stw	%o0,	[%l7 + 0x14]
	subccc	%i6,	%i1,	%l3
	fmovrsgez	%l0,	%f2,	%f8
	edge32ln	%g2,	%o7,	%i3
	orncc	%o2,	%g3,	%g5
	fmul8x16	%f21,	%f6,	%f18
	sethi	0x11E5,	%l2
	edge32	%l5,	%g7,	%o1
	edge32	%i0,	%i7,	%g6
	sir	0x0E3A
	ldd	[%l7 + 0x60],	%f2
	fmovdle	%xcc,	%f30,	%f17
	stw	%l4,	[%l7 + 0x18]
	movrlez	%g4,	0x06B,	%l6
	edge16	%o5,	%i2,	%l1
	fmovdle	%icc,	%f22,	%f9
	fpadd16s	%f4,	%f19,	%f8
	move	%xcc,	%o6,	%o3
	stw	%i4,	[%l7 + 0x28]
	udivcc	%g1,	0x05B6,	%o4
	fmovrde	%i5,	%f24,	%f20
	smulcc	%o0,	0x0D2D,	%i6
	sll	%i1,	%l0,	%g2
	movvc	%xcc,	%o7,	%i3
	movle	%xcc,	%l3,	%o2
	fmovsn	%icc,	%f0,	%f25
	ldd	[%l7 + 0x08],	%f12
	movrgz	%g3,	0x3DB,	%g5
	fmovrde	%l5,	%f18,	%f0
	fpmerge	%f0,	%f27,	%f0
	fmovdcs	%xcc,	%f22,	%f4
	orn	%g7,	%o1,	%i0
	edge8ln	%i7,	%l2,	%l4
	fsrc2	%f8,	%f0
	sdivcc	%g6,	0x19B5,	%g4
	sth	%l6,	[%l7 + 0x08]
	movl	%xcc,	%i2,	%o5
	ldd	[%l7 + 0x58],	%f14
	fmovdvs	%icc,	%f17,	%f8
	srl	%l1,	%o6,	%i4
	bshuffle	%f10,	%f28,	%f30
	or	%g1,	0x0289,	%o4
	ldx	[%l7 + 0x70],	%i5
	array8	%o3,	%i6,	%i1
	fnands	%f4,	%f10,	%f21
	sir	0x185E
	xnor	%l0,	%o0,	%g2
	movleu	%icc,	%i3,	%l3
	nop
	set	0x44, %l6
	ldsh	[%l7 + %l6],	%o7
	movrgz	%o2,	0x3F4,	%g3
	movrgz	%g5,	0x2C7,	%g7
	lduw	[%l7 + 0x6C],	%o1
	sdivcc	%l5,	0x1440,	%i7
	edge32l	%l2,	%l4,	%i0
	lduh	[%l7 + 0x10],	%g4
	fmovrde	%l6,	%f10,	%f10
	stx	%g6,	[%l7 + 0x60]
	srax	%o5,	0x0C,	%i2
	addccc	%o6,	%l1,	%g1
	fnot2	%f16,	%f10
	movg	%xcc,	%i4,	%i5
	fsrc1	%f2,	%f22
	fmovrdgz	%o3,	%f10,	%f26
	sll	%i6,	0x14,	%o4
	movn	%icc,	%l0,	%o0
	movleu	%icc,	%i1,	%g2
	ldd	[%l7 + 0x10],	%f6
	ldd	[%l7 + 0x28],	%f16
	udiv	%l3,	0x039A,	%i3
	sllx	%o2,	0x14,	%o7
	ldd	[%l7 + 0x68],	%g2
	movl	%icc,	%g7,	%g5
	movrgez	%o1,	%i7,	%l2
	array32	%l5,	%l4,	%i0
	xnorcc	%g4,	0x15FA,	%l6
	edge8n	%o5,	%i2,	%o6
	sll	%g6,	%l1,	%g1
	movcc	%icc,	%i4,	%o3
	movneg	%xcc,	%i6,	%i5
	or	%o4,	%l0,	%i1
	movpos	%icc,	%g2,	%l3
	fmovsl	%xcc,	%f6,	%f19
	st	%f25,	[%l7 + 0x70]
	fmovdleu	%xcc,	%f13,	%f4
	fmovdneg	%xcc,	%f31,	%f19
	fmovrsgz	%i3,	%f18,	%f20
	udiv	%o2,	0x16A2,	%o0
	movleu	%icc,	%g3,	%o7
	ldd	[%l7 + 0x48],	%g4
	ldx	[%l7 + 0x48],	%o1
	edge32l	%i7,	%l2,	%g7
	sir	0x1239
	edge16l	%l5,	%l4,	%g4
	movrlez	%i0,	0x19F,	%o5
	sdiv	%l6,	0x1B13,	%i2
	movcc	%icc,	%g6,	%l1
	movcs	%xcc,	%o6,	%i4
	popc	%o3,	%i6
	edge16n	%g1,	%o4,	%l0
	smulcc	%i1,	0x0D8C,	%i5
	edge16n	%l3,	%g2,	%i3
	movl	%xcc,	%o2,	%o0
	srl	%g3,	%g5,	%o7
	movcc	%xcc,	%o1,	%l2
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	addccc	%i7,	0x1FB1,	%g4
	nop
	set	0x24, %i4
	lduh	[%l7 + %i4],	%i0
	sub	%l6,	%o5,	%g6
	fmul8x16au	%f20,	%f19,	%f30
	xorcc	%i2,	%l1,	%o6
	fcmpne32	%f24,	%f6,	%o3
	smul	%i4,	0x071A,	%g1
	fmovsvc	%icc,	%f27,	%f28
	edge32n	%o4,	%i6,	%l0
	edge16	%i5,	%l3,	%i1
	movne	%xcc,	%i3,	%g2
	add	%o0,	0x09E0,	%o2
	movrne	%g5,	0x102,	%g3
	sllx	%o7,	0x15,	%o1
	move	%icc,	%l2,	%g7
	xorcc	%l5,	0x008F,	%l4
	ldsw	[%l7 + 0x68],	%i7
	alignaddrl	%i0,	%l6,	%o5
	ldsh	[%l7 + 0x66],	%g4
	fmovsle	%icc,	%f1,	%f23
	smul	%g6,	0x1C8A,	%i2
	smul	%o6,	%o3,	%i4
	xnorcc	%l1,	%o4,	%i6
	ldsw	[%l7 + 0x0C],	%l0
	subc	%g1,	%l3,	%i5
	edge8l	%i3,	%g2,	%i1
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%o2
	edge32l	%o0,	%g3,	%g5
	srlx	%o7,	0x15,	%l2
	edge32	%o1,	%g7,	%l5
	add	%l4,	%i0,	%i7
	mova	%xcc,	%o5,	%g4
	popc	0x0894,	%g6
	fmovrse	%i2,	%f2,	%f2
	movpos	%icc,	%l6,	%o3
	alignaddrl	%o6,	%l1,	%i4
	array8	%o4,	%i6,	%l0
	fmovsn	%xcc,	%f13,	%f20
	ldx	[%l7 + 0x20],	%g1
	fmovrslz	%i5,	%f22,	%f28
	array32	%l3,	%g2,	%i3
	addc	%i1,	%o2,	%o0
	fcmps	%fcc1,	%f27,	%f15
	udivcc	%g5,	0x0DCD,	%g3
	fxors	%f8,	%f11,	%f12
	fpsub16	%f24,	%f18,	%f26
	fcmps	%fcc3,	%f30,	%f13
	andn	%o7,	%o1,	%g7
	udivcc	%l5,	0x1198,	%l2
	fzeros	%f6
	fnot1s	%f4,	%f19
	edge8l	%i0,	%i7,	%o5
	fandnot1s	%f15,	%f20,	%f10
	st	%f4,	[%l7 + 0x38]
	movcs	%xcc,	%g4,	%l4
	sub	%g6,	%i2,	%o3
	edge32n	%l6,	%o6,	%i4
	fsrc1s	%f16,	%f12
	fmovrsgz	%l1,	%f20,	%f13
	edge8n	%i6,	%l0,	%g1
	edge16	%i5,	%l3,	%g2
	umulcc	%o4,	%i3,	%o2
	ld	[%l7 + 0x74],	%f20
	stb	%o0,	[%l7 + 0x4B]
	movge	%icc,	%g5,	%g3
	xor	%o7,	0x1D56,	%i1
	movl	%xcc,	%g7,	%o1
	movge	%icc,	%l2,	%l5
	or	%i7,	0x1F99,	%i0
	array32	%o5,	%g4,	%l4
	srax	%i2,	0x17,	%g6
	movn	%icc,	%l6,	%o6
	andcc	%o3,	%l1,	%i4
	fcmps	%fcc2,	%f7,	%f8
	fnot1s	%f23,	%f11
	andcc	%l0,	%g1,	%i6
	mulx	%i5,	0x104F,	%g2
	fcmps	%fcc2,	%f1,	%f0
	fcmpes	%fcc3,	%f19,	%f26
	fmovda	%xcc,	%f6,	%f7
	fmuld8ulx16	%f7,	%f1,	%f16
	movle	%icc,	%o4,	%l3
	movgu	%xcc,	%o2,	%o0
	fpsub16s	%f1,	%f4,	%f9
	st	%f30,	[%l7 + 0x50]
	alignaddrl	%i3,	%g5,	%o7
	udiv	%i1,	0x113D,	%g7
	subccc	%g3,	0x1DCC,	%l2
	smul	%o1,	%i7,	%i0
	edge32n	%l5,	%o5,	%l4
	sth	%g4,	[%l7 + 0x3E]
	movcs	%xcc,	%g6,	%l6
	fcmps	%fcc1,	%f17,	%f26
	fandnot1s	%f13,	%f15,	%f28
	or	%i2,	0x02F3,	%o3
	edge32	%o6,	%i4,	%l1
	fandnot2s	%f21,	%f29,	%f5
	movcs	%xcc,	%g1,	%l0
	fmovdn	%xcc,	%f5,	%f25
	addcc	%i6,	%i5,	%o4
	movpos	%icc,	%l3,	%o2
	mova	%xcc,	%o0,	%i3
	fpmerge	%f7,	%f16,	%f12
	sdivx	%g2,	0x0F49,	%g5
	fpack32	%f2,	%f12,	%f6
	movg	%xcc,	%i1,	%o7
	edge8	%g3,	%g7,	%l2
	fmovdle	%xcc,	%f17,	%f22
	movleu	%xcc,	%i7,	%i0
	add	%o1,	0x0E64,	%l5
	fmovsne	%icc,	%f26,	%f5
	fmul8sux16	%f4,	%f0,	%f4
	sllx	%o5,	%g4,	%l4
	andncc	%g6,	%l6,	%o3
	nop
	set	0x7C, %o3
	stw	%o6,	[%l7 + %o3]
	movle	%icc,	%i4,	%l1
	fcmpgt32	%f10,	%f12,	%i2
	fmovrde	%g1,	%f6,	%f24
	addccc	%l0,	%i5,	%o4
	fmovs	%f16,	%f5
	sir	0x1D08
	fmovrsgez	%l3,	%f13,	%f16
	fmovsl	%xcc,	%f27,	%f24
	ld	[%l7 + 0x74],	%f5
	subc	%o2,	0x1145,	%i6
	fmovd	%f0,	%f0
	movrne	%o0,	0x2B8,	%g2
	fands	%f27,	%f31,	%f16
	movge	%icc,	%i3,	%g5
	fmovrdlz	%i1,	%f14,	%f24
	fxnor	%f24,	%f24,	%f30
	movrlz	%o7,	%g7,	%l2
	edge16l	%i7,	%g3,	%i0
	nop
	set	0x32, %l5
	sth	%o1,	[%l7 + %l5]
	movrne	%l5,	%g4,	%l4
	fcmpgt16	%f8,	%f20,	%o5
	movne	%icc,	%l6,	%g6
	edge16n	%o6,	%o3,	%l1
	movn	%xcc,	%i4,	%i2
	movrlz	%l0,	0x153,	%i5
	subcc	%o4,	%l3,	%o2
	ldd	[%l7 + 0x18],	%f26
	addcc	%g1,	0x1968,	%i6
	movgu	%xcc,	%o0,	%g2
	sdivx	%i3,	0x0F05,	%g5
	sub	%o7,	0x04C2,	%i1
	movrne	%l2,	0x1E8,	%i7
	edge8ln	%g7,	%g3,	%o1
	movl	%icc,	%i0,	%g4
	xorcc	%l4,	0x0A47,	%o5
	edge32	%l5,	%l6,	%o6
	edge16	%o3,	%l1,	%i4
	movleu	%xcc,	%g6,	%i2
	umulcc	%i5,	0x190A,	%o4
	fcmpne16	%f20,	%f4,	%l3
	addc	%o2,	0x198F,	%g1
	movgu	%xcc,	%l0,	%i6
	addcc	%g2,	%o0,	%g5
	movrgez	%o7,	0x1A3,	%i3
	udivx	%i1,	0x0695,	%i7
	sth	%g7,	[%l7 + 0x3C]
	movn	%xcc,	%l2,	%g3
	and	%i0,	%o1,	%l4
	addccc	%g4,	%l5,	%l6
	movvc	%xcc,	%o5,	%o6
	movre	%l1,	0x0B8,	%o3
	addccc	%g6,	%i4,	%i5
	stb	%o4,	[%l7 + 0x5A]
	addc	%i2,	0x1C81,	%l3
	orn	%g1,	%l0,	%i6
	fcmped	%fcc0,	%f4,	%f0
	add	%o2,	%g2,	%o0
	stw	%o7,	[%l7 + 0x34]
	movrlez	%g5,	%i1,	%i7
	add	%g7,	0x1BE3,	%l2
	sdivcc	%i3,	0x1062,	%g3
	umul	%o1,	%i0,	%l4
	subccc	%g4,	0x1BC3,	%l5
	movvc	%xcc,	%o5,	%o6
	andncc	%l1,	%l6,	%o3
	movge	%icc,	%i4,	%g6
	addccc	%o4,	%i5,	%i2
	movvc	%xcc,	%g1,	%l0
	movvs	%icc,	%i6,	%l3
	fsrc2s	%f27,	%f22
	edge16ln	%o2,	%o0,	%o7
	fabsd	%f26,	%f22
	nop
	set	0x7A, %i6
	lduh	[%l7 + %i6],	%g5
	bshuffle	%f8,	%f18,	%f6
	save %g2, 0x07E1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g7,	%l2
	array16	%i3,	%g3,	%o1
	fnors	%f5,	%f10,	%f15
	lduw	[%l7 + 0x74],	%i0
	fmovdvc	%xcc,	%f8,	%f31
	edge8n	%l4,	%g4,	%i1
	fmovsn	%xcc,	%f18,	%f3
	movn	%xcc,	%l5,	%o6
	st	%f7,	[%l7 + 0x34]
	save %l1, %o5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l6,	0x1E57,	%i4
	movg	%icc,	%g6,	%o4
	fors	%f4,	%f28,	%f26
	edge8	%i5,	%i2,	%g1
	sll	%i6,	%l0,	%l3
	fmovsge	%xcc,	%f12,	%f28
	nop
	set	0x52, %l4
	lduh	[%l7 + %l4],	%o2
	smul	%o7,	%o0,	%g5
	sir	0x16A3
	srlx	%i7,	%g7,	%g2
	stb	%l2,	[%l7 + 0x3B]
	and	%g3,	%i3,	%o1
	movl	%xcc,	%l4,	%i0
	fmovrsgz	%i1,	%f30,	%f11
	edge16ln	%g4,	%o6,	%l5
	alignaddrl	%l1,	%o3,	%l6
	fpsub32	%f4,	%f26,	%f8
	array16	%i4,	%g6,	%o5
	edge32	%o4,	%i2,	%g1
	edge32ln	%i5,	%i6,	%l0
	andcc	%l3,	%o2,	%o0
	movl	%xcc,	%o7,	%i7
	sra	%g5,	0x1A,	%g2
	mulscc	%g7,	%l2,	%g3
	fand	%f22,	%f4,	%f16
	fabsd	%f24,	%f30
	sth	%i3,	[%l7 + 0x6A]
	edge32	%o1,	%l4,	%i0
	fcmpne16	%f26,	%f18,	%g4
	nop
	set	0x30, %g3
	ldsb	[%l7 + %g3],	%i1
	srl	%l5,	0x0D,	%l1
	sdivx	%o3,	0x0B01,	%o6
	andcc	%l6,	0x10A3,	%i4
	andncc	%o5,	%o4,	%i2
	fnand	%f6,	%f0,	%f8
	movne	%xcc,	%g6,	%g1
	ld	[%l7 + 0x38],	%f3
	movpos	%xcc,	%i6,	%l0
	movl	%icc,	%l3,	%o2
	sdivcc	%i5,	0x1005,	%o0
	orcc	%o7,	%i7,	%g2
	save %g5, 0x0657, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f26
	ldsh	[%l7 + 0x76],	%g3
	ldsb	[%l7 + 0x74],	%i3
	udiv	%g7,	0x0BC8,	%l4
	udiv	%o1,	0x0D83,	%i0
	udivx	%g4,	0x06A5,	%l5
	movl	%xcc,	%i1,	%o3
	orncc	%l1,	%l6,	%i4
	fornot1s	%f27,	%f14,	%f25
	sllx	%o6,	%o4,	%o5
	fmovsg	%xcc,	%f21,	%f12
	ldsw	[%l7 + 0x38],	%i2
	edge8l	%g1,	%i6,	%g6
	ldx	[%l7 + 0x50],	%l0
	xnor	%l3,	0x1B14,	%i5
	movgu	%xcc,	%o0,	%o7
	array8	%i7,	%o2,	%g2
	smulcc	%l2,	%g3,	%g5
	ldx	[%l7 + 0x08],	%g7
	move	%xcc,	%l4,	%i3
	movrlez	%i0,	%o1,	%g4
	array16	%i1,	%o3,	%l5
	fmovde	%xcc,	%f31,	%f21
	fmovdl	%icc,	%f5,	%f30
	fmovscc	%xcc,	%f21,	%f25
	srlx	%l1,	0x1A,	%i4
	edge16	%o6,	%l6,	%o4
	fpsub32s	%f10,	%f2,	%f21
	movre	%i2,	%o5,	%i6
	fnot1	%f16,	%f14
	edge8ln	%g6,	%l0,	%g1
	umulcc	%i5,	%o0,	%o7
	movrlez	%i7,	0x123,	%l3
	orncc	%o2,	%g2,	%l2
	subc	%g3,	%g7,	%g5
	smulcc	%i3,	0x0338,	%l4
	edge32ln	%o1,	%i0,	%i1
	fnot2	%f30,	%f16
	edge16ln	%g4,	%l5,	%l1
	movgu	%icc,	%o3,	%i4
	or	%l6,	0x1841,	%o4
	subc	%o6,	0x1541,	%i2
	stx	%o5,	[%l7 + 0x48]
	sethi	0x0430,	%g6
	srl	%i6,	0x14,	%l0
	popc	%g1,	%o0
	movvs	%xcc,	%i5,	%i7
	mova	%xcc,	%l3,	%o7
	popc	0x111E,	%g2
	movgu	%xcc,	%o2,	%l2
	edge8n	%g7,	%g5,	%i3
	movgu	%icc,	%g3,	%l4
	addc	%i0,	0x1E8A,	%o1
	movneg	%xcc,	%g4,	%l5
	fmovrdne	%l1,	%f24,	%f18
	sra	%i1,	0x11,	%i4
	lduh	[%l7 + 0x3C],	%l6
	orn	%o3,	%o4,	%o6
	fmovspos	%icc,	%f11,	%f13
	sll	%o5,	%g6,	%i6
	ld	[%l7 + 0x14],	%f5
	orn	%l0,	%g1,	%i2
	array32	%i5,	%i7,	%o0
	fcmpgt16	%f6,	%f18,	%o7
	fmovrsgez	%g2,	%f6,	%f18
	movg	%icc,	%l3,	%l2
	st	%f12,	[%l7 + 0x68]
	restore %g7, %g5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g3,	%o2,	%i0
	edge16	%o1,	%l4,	%l5
	subc	%l1,	%g4,	%i4
	fones	%f21
	edge32ln	%l6,	%i1,	%o4
	movle	%xcc,	%o6,	%o5
	edge8n	%g6,	%o3,	%l0
	fsrc2s	%f22,	%f23
	fmovrdlez	%g1,	%f30,	%f28
	fnot2s	%f27,	%f3
	srlx	%i2,	0x1F,	%i5
	subccc	%i7,	0x0254,	%o0
	fmuld8ulx16	%f4,	%f26,	%f26
	xnor	%i6,	%o7,	%l3
	movpos	%xcc,	%g2,	%l2
	movne	%icc,	%g5,	%i3
	sdiv	%g7,	0x124D,	%g3
	ldx	[%l7 + 0x30],	%i0
	sdiv	%o1,	0x150D,	%l4
	array16	%o2,	%l5,	%g4
	fnot2	%f4,	%f20
	edge32n	%i4,	%l6,	%l1
	edge16n	%i1,	%o4,	%o5
	movle	%icc,	%o6,	%o3
	lduh	[%l7 + 0x5E],	%l0
	addcc	%g1,	0x103B,	%g6
	sth	%i2,	[%l7 + 0x70]
	fornot1s	%f14,	%f28,	%f31
	sth	%i5,	[%l7 + 0x7C]
	fmuld8ulx16	%f14,	%f0,	%f20
	pdist	%f2,	%f20,	%f16
	sir	0x12D7
	fmovdleu	%xcc,	%f27,	%f6
	subccc	%o0,	0x1BF9,	%i7
	fcmpd	%fcc2,	%f2,	%f12
	or	%i6,	%l3,	%o7
	addc	%l2,	%g5,	%g2
	movl	%xcc,	%i3,	%g3
	movrlz	%i0,	0x0E5,	%g7
	alignaddrl	%l4,	%o2,	%l5
	edge32n	%g4,	%o1,	%l6
	movn	%xcc,	%l1,	%i4
	movcc	%icc,	%o4,	%i1
	lduw	[%l7 + 0x0C],	%o6
	fnor	%f8,	%f28,	%f0
	xnorcc	%o3,	%o5,	%g1
	sdivx	%g6,	0x0024,	%l0
	umulcc	%i5,	%o0,	%i2
	ldsb	[%l7 + 0x70],	%i6
	movle	%xcc,	%i7,	%o7
	movne	%icc,	%l2,	%g5
	nop
	set	0x50, %o0
	ldd	[%l7 + %o0],	%f24
	faligndata	%f28,	%f10,	%f12
	fpadd16	%f26,	%f8,	%f14
	xnor	%l3,	0x1E4E,	%g2
	nop
	set	0x51, %o4
	ldsb	[%l7 + %o4],	%g3
	sll	%i3,	%g7,	%l4
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	udivcc	%g4,	0x1AB3,	%o1
	fornot2s	%f17,	%f31,	%f1
	ldsw	[%l7 + 0x38],	%l6
	stb	%l1,	[%l7 + 0x19]
	movvs	%xcc,	%i4,	%o4
	movcc	%xcc,	%i1,	%i0
	fpadd32s	%f10,	%f15,	%f13
	fands	%f3,	%f25,	%f20
	fornot2s	%f23,	%f2,	%f10
	orcc	%o6,	0x15BD,	%o3
	umul	%o5,	%g1,	%l0
	srax	%i5,	0x0C,	%g6
	movvs	%icc,	%o0,	%i2
	edge8n	%i6,	%o7,	%l2
	edge8l	%i7,	%l3,	%g5
	fmovdl	%xcc,	%f26,	%f7
	ldsh	[%l7 + 0x36],	%g3
	addcc	%i3,	0x0423,	%g2
	orncc	%g7,	%o2,	%l5
	fmovsg	%xcc,	%f11,	%f0
	umulcc	%l4,	%o1,	%g4
	fpsub32s	%f26,	%f25,	%f29
	fmovrdlz	%l6,	%f20,	%f4
	edge8l	%i4,	%l1,	%i1
	fmuld8sux16	%f11,	%f24,	%f8
	fmovrdlz	%i0,	%f8,	%f10
	movre	%o6,	%o3,	%o5
	addcc	%g1,	%l0,	%o4
	sdivx	%i5,	0x1985,	%g6
	mova	%icc,	%i2,	%i6
	movrlez	%o0,	%l2,	%o7
	edge32n	%l3,	%g5,	%g3
	fand	%f28,	%f8,	%f24
	edge32ln	%i3,	%g2,	%i7
	udiv	%g7,	0x1741,	%o2
	xor	%l5,	0x0014,	%l4
	ldsh	[%l7 + 0x50],	%g4
	sethi	0x02B4,	%l6
	mulscc	%o1,	%l1,	%i4
	ldd	[%l7 + 0x10],	%i0
	movrne	%i0,	0x2FA,	%o6
	fmul8x16al	%f22,	%f1,	%f30
	edge16	%o3,	%o5,	%l0
	fmovde	%icc,	%f14,	%f8
	sdivx	%o4,	0x15D8,	%g1
	restore %i5, %i2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o0,	%l2,	%o7
	alignaddrl	%l3,	%g5,	%g6
	nop
	set	0x24, %l3
	ldsw	[%l7 + %l3],	%g3
	addccc	%i3,	%i7,	%g2
	or	%g7,	%l5,	%o2
	fmovrdgez	%l4,	%f10,	%f28
	fpackfix	%f26,	%f25
	movge	%icc,	%g4,	%l6
	fmovdl	%xcc,	%f1,	%f3
	addcc	%l1,	0x09B1,	%o1
	or	%i4,	0x08C6,	%i0
	lduh	[%l7 + 0x14],	%o6
	ldub	[%l7 + 0x0E],	%o3
	fmovsne	%icc,	%f7,	%f29
	srlx	%i1,	%l0,	%o4
	fmovdleu	%xcc,	%f31,	%f18
	mova	%icc,	%o5,	%i5
	mulscc	%g1,	%i6,	%o0
	movrne	%i2,	0x10A,	%o7
	mulx	%l2,	%g5,	%l3
	stx	%g6,	[%l7 + 0x50]
	orn	%i3,	%i7,	%g3
	srlx	%g7,	0x11,	%g2
	fsrc2s	%f25,	%f20
	udivcc	%l5,	0x1596,	%l4
	xnorcc	%g4,	0x1677,	%o2
	std	%f26,	[%l7 + 0x50]
	movrgz	%l6,	0x053,	%o1
	sdivcc	%l1,	0x1C77,	%i4
	fpackfix	%f22,	%f27
	movleu	%icc,	%i0,	%o6
	or	%o3,	%i1,	%l0
	ldd	[%l7 + 0x10],	%o4
	edge8n	%i5,	%g1,	%i6
	stx	%o0,	[%l7 + 0x58]
	alignaddrl	%i2,	%o7,	%o4
	edge8l	%l2,	%g5,	%g6
	edge32l	%i3,	%l3,	%i7
	addcc	%g3,	0x0213,	%g7
	save %g2, 0x0993, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g4,	0x1E0,	%l5
	movcc	%icc,	%o2,	%l6
	sdivx	%l1,	0x0DAE,	%o1
	edge8l	%i4,	%o6,	%i0
	xor	%i1,	0x0D13,	%o3
	mulx	%o5,	%l0,	%i5
	fones	%f4
	edge32	%g1,	%o0,	%i6
	xnor	%o7,	%i2,	%o4
	fmul8x16al	%f23,	%f13,	%f28
	udiv	%l2,	0x1CBA,	%g5
	or	%g6,	0x092D,	%l3
	edge32n	%i3,	%i7,	%g7
	sra	%g3,	0x1F,	%l4
	movn	%xcc,	%g2,	%g4
	bshuffle	%f28,	%f18,	%f18
	fmovdg	%icc,	%f25,	%f28
	ldub	[%l7 + 0x18],	%o2
	sethi	0x1D29,	%l5
	fandnot1s	%f29,	%f1,	%f9
	edge8ln	%l1,	%o1,	%l6
	edge16ln	%i4,	%o6,	%i0
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	fornot2	%f28,	%f4,	%f0
	movleu	%icc,	%l0,	%o5
	fmovsn	%icc,	%f8,	%f5
	andcc	%g1,	0x1207,	%o0
	fmovdcs	%xcc,	%f13,	%f12
	or	%i6,	%i5,	%o7
	movrgez	%i2,	%l2,	%o4
	fmovrdlez	%g6,	%f12,	%f20
	movne	%xcc,	%l3,	%i3
	fpsub32	%f0,	%f4,	%f8
	edge16n	%g5,	%i7,	%g7
	sdivcc	%g3,	0x1568,	%g2
	xnor	%l4,	%o2,	%g4
	fmovsvc	%icc,	%f11,	%f31
	array16	%l5,	%o1,	%l1
	fnot2s	%f23,	%f3
	subcc	%l6,	0x10F2,	%o6
	movvc	%icc,	%i4,	%i1
	edge32	%i0,	%l0,	%o5
	fandnot2	%f16,	%f8,	%f24
	fnot2	%f10,	%f2
	edge16	%g1,	%o3,	%i6
	fpsub16	%f22,	%f0,	%f20
	orn	%i5,	%o7,	%i2
	fmul8ulx16	%f6,	%f28,	%f2
	udivx	%o0,	0x088D,	%o4
	and	%l2,	%l3,	%i3
	umulcc	%g6,	%i7,	%g5
	edge16n	%g7,	%g2,	%l4
	stx	%g3,	[%l7 + 0x50]
	edge32n	%o2,	%l5,	%o1
	movle	%xcc,	%l1,	%l6
	movg	%icc,	%o6,	%i4
	sllx	%i1,	%g4,	%i0
	fcmpgt32	%f8,	%f0,	%o5
	fmovdg	%icc,	%f16,	%f31
	umul	%l0,	%o3,	%i6
	subc	%g1,	%o7,	%i2
	srax	%o0,	%o4,	%i5
	edge32	%l2,	%l3,	%i3
	movg	%xcc,	%i7,	%g6
	std	%f6,	[%l7 + 0x68]
	movg	%icc,	%g7,	%g5
	movcc	%icc,	%g2,	%g3
	edge8n	%l4,	%l5,	%o2
	ld	[%l7 + 0x48],	%f2
	array16	%l1,	%l6,	%o1
	addc	%o6,	0x13DC,	%i4
	array16	%g4,	%i1,	%o5
	fmovrse	%i0,	%f20,	%f11
	fmul8sux16	%f10,	%f6,	%f28
	movne	%icc,	%l0,	%o3
	alignaddr	%i6,	%o7,	%g1
	smulcc	%o0,	0x1CC8,	%i2
	addccc	%i5,	0x0690,	%o4
	movgu	%xcc,	%l2,	%l3
	fcmpgt16	%f28,	%f8,	%i7
	mulscc	%i3,	0x19A2,	%g6
	fzeros	%f25
	popc	%g5,	%g2
	alignaddr	%g7,	%g3,	%l5
	edge8ln	%o2,	%l1,	%l6
	srl	%o1,	0x13,	%o6
	fsrc1	%f22,	%f30
	srax	%i4,	%l4,	%g4
	srax	%o5,	%i1,	%l0
	mova	%xcc,	%o3,	%i6
	movge	%icc,	%i0,	%o7
	umulcc	%o0,	0x0DA8,	%i2
	subc	%g1,	%i5,	%o4
	save %l2, 0x0828, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x18],	%l2
	movn	%icc,	%g6,	%g5
	andn	%g2,	%i3,	%g3
	umul	%g7,	0x0D66,	%o2
	srax	%l5,	%l6,	%o1
	fmovd	%f2,	%f24
	movg	%icc,	%o6,	%l1
	fpadd32s	%f0,	%f0,	%f4
	edge16	%l4,	%g4,	%o5
	lduw	[%l7 + 0x38],	%i1
	udiv	%l0,	0x0945,	%o3
	edge32	%i6,	%i4,	%i0
	edge8l	%o7,	%i2,	%o0
	addccc	%g1,	%o4,	%i5
	orcc	%l2,	%l3,	%i7
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%g6
	movrgez	%g5,	%g2,	%i3
	fmovde	%icc,	%f31,	%f15
	sll	%g3,	0x1B,	%g7
	sdivcc	%l5,	0x0FB6,	%l6
	fmovdle	%icc,	%f29,	%f17
	fandnot1s	%f24,	%f6,	%f15
	movrlez	%o1,	0x351,	%o2
	fmovdn	%icc,	%f10,	%f31
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%f22
	sdiv	%o6,	0x158C,	%l4
	movl	%xcc,	%l1,	%g4
	array8	%i1,	%o5,	%o3
	stb	%i6,	[%l7 + 0x38]
	fcmps	%fcc3,	%f13,	%f0
	and	%l0,	%i4,	%o7
	fmovsneg	%icc,	%f11,	%f13
	udiv	%i0,	0x1ED2,	%i2
	movge	%xcc,	%o0,	%g1
	sll	%o4,	0x1A,	%l2
	udiv	%l3,	0x0D1E,	%i5
	movrgz	%i7,	%g6,	%g2
	edge8n	%g5,	%i3,	%g7
	edge8ln	%l5,	%l6,	%g3
	edge32ln	%o2,	%o1,	%l4
	fmul8sux16	%f12,	%f14,	%f12
	sethi	0x1A16,	%o6
	ldsb	[%l7 + 0x38],	%g4
	srl	%i1,	0x1B,	%l1
	fabsd	%f22,	%f22
	fmovdcc	%icc,	%f4,	%f26
	fands	%f9,	%f1,	%f12
	save %o3, %i6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i4,	%o7,	%i0
	fmovsleu	%icc,	%f6,	%f26
	fnot1s	%f7,	%f0
	movl	%icc,	%i2,	%o5
	movrgz	%g1,	0x062,	%o4
	fmovrdgz	%l2,	%f10,	%f0
	fnor	%f6,	%f12,	%f22
	fmovrsne	%o0,	%f6,	%f28
	movg	%xcc,	%l3,	%i7
	movrgez	%g6,	%i5,	%g5
	sdiv	%i3,	0x1B9E,	%g2
	movneg	%icc,	%l5,	%g7
	fpsub16	%f28,	%f16,	%f20
	alignaddr	%g3,	%o2,	%l6
	edge8	%o1,	%o6,	%g4
	fmuld8sux16	%f8,	%f16,	%f24
	movgu	%icc,	%l4,	%l1
	edge16l	%o3,	%i1,	%l0
	fmovrslz	%i6,	%f27,	%f20
	smulcc	%i4,	%o7,	%i2
	fxors	%f5,	%f7,	%f22
	addcc	%i0,	%o5,	%g1
	orcc	%o4,	%o0,	%l3
	mulx	%i7,	%l2,	%g6
	edge16	%g5,	%i3,	%g2
	faligndata	%f14,	%f14,	%f0
	fmovsleu	%icc,	%f10,	%f15
	fpadd16s	%f28,	%f30,	%f0
	orncc	%i5,	0x09C1,	%l5
	fmovdvc	%xcc,	%f8,	%f25
	smulcc	%g7,	%o2,	%g3
	array8	%l6,	%o1,	%g4
	ldd	[%l7 + 0x40],	%f26
	edge16ln	%o6,	%l4,	%l1
	lduw	[%l7 + 0x40],	%i1
	siam	0x7
	or	%l0,	0x0F73,	%o3
	movne	%xcc,	%i6,	%o7
	ldx	[%l7 + 0x58],	%i2
	sir	0x04A4
	fmovdne	%xcc,	%f30,	%f17
	movgu	%xcc,	%i0,	%o5
	umulcc	%i4,	0x1B0C,	%o4
	ldub	[%l7 + 0x2F],	%g1
	fcmped	%fcc0,	%f24,	%f24
	fpackfix	%f20,	%f24
	fors	%f31,	%f10,	%f9
	addcc	%l3,	%i7,	%o0
	srlx	%l2,	0x03,	%g6
	fornot1s	%f17,	%f5,	%f2
	fandnot2	%f14,	%f28,	%f4
	andn	%g5,	0x0235,	%i3
	fmuld8sux16	%f22,	%f28,	%f18
	save %i5, 0x0785, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g2,	0x0C96,	%o2
	movl	%icc,	%g7,	%g3
	addcc	%o1,	%l6,	%o6
	array16	%l4,	%g4,	%i1
	fmovdcs	%xcc,	%f30,	%f18
	mulscc	%l0,	%o3,	%l1
	stx	%i6,	[%l7 + 0x08]
	addc	%i2,	0x100C,	%i0
	xnor	%o5,	%o7,	%i4
	fmovrdlez	%o4,	%f22,	%f22
	sra	%g1,	%l3,	%i7
	ld	[%l7 + 0x10],	%f3
	stb	%o0,	[%l7 + 0x6A]
	ld	[%l7 + 0x44],	%f0
	fandnot1s	%f4,	%f20,	%f26
	edge16	%g6,	%g5,	%l2
	ldub	[%l7 + 0x44],	%i5
	fcmpeq32	%f30,	%f2,	%l5
	edge8	%g2,	%o2,	%g7
	subcc	%i3,	0x15D7,	%o1
	array32	%g3,	%o6,	%l6
	movrgz	%g4,	0x394,	%i1
	ldx	[%l7 + 0x10],	%l0
	edge8	%l4,	%o3,	%i6
	edge16	%i2,	%l1,	%i0
	andn	%o5,	0x02F1,	%o7
	ldd	[%l7 + 0x20],	%o4
	or	%i4,	%l3,	%g1
	edge8l	%o0,	%g6,	%i7
	xnorcc	%l2,	%i5,	%l5
	fandnot2	%f16,	%f26,	%f6
	movle	%xcc,	%g5,	%o2
	srax	%g2,	%i3,	%o1
	subcc	%g3,	0x0D30,	%o6
	sllx	%g7,	0x07,	%l6
	fexpand	%f8,	%f14
	ldd	[%l7 + 0x68],	%g4
	edge16ln	%l0,	%l4,	%o3
	fnot2	%f20,	%f28
	ldd	[%l7 + 0x58],	%i6
	ldsb	[%l7 + 0x21],	%i2
	orcc	%i1,	%l1,	%i0
	stx	%o7,	[%l7 + 0x40]
	sub	%o4,	%o5,	%l3
	movneg	%xcc,	%i4,	%g1
	restore %g6, 0x05D5, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%xcc,	%f16,	%f29
	fones	%f16
	fnegs	%f28,	%f10
	popc	%l2,	%i5
	xor	%i7,	0x1B57,	%g5
	fmovdpos	%icc,	%f1,	%f19
	fsrc2	%f22,	%f28
	sub	%l5,	%g2,	%i3
	edge16	%o2,	%o1,	%o6
	fands	%f24,	%f19,	%f5
	fcmple32	%f12,	%f16,	%g3
	edge8l	%g7,	%g4,	%l0
	srax	%l6,	%o3,	%i6
	stx	%i2,	[%l7 + 0x60]
	edge16	%l4,	%i1,	%i0
	array8	%o7,	%o4,	%o5
	fnot1s	%f5,	%f31
	mova	%xcc,	%l1,	%i4
	stw	%g1,	[%l7 + 0x40]
	xorcc	%l3,	%g6,	%l2
	xorcc	%o0,	%i7,	%g5
	movn	%icc,	%i5,	%l5
	alignaddr	%i3,	%g2,	%o2
	movle	%xcc,	%o1,	%g3
	fxnors	%f18,	%f17,	%f30
	ldsw	[%l7 + 0x28],	%o6
	sllx	%g7,	0x09,	%l0
	movrgez	%l6,	0x3E4,	%o3
	fmuld8ulx16	%f0,	%f3,	%f30
	addc	%i6,	%g4,	%l4
	fone	%f14
	fmovscs	%icc,	%f7,	%f3
	movleu	%xcc,	%i2,	%i0
	or	%o7,	0x17CB,	%i1
	movrlez	%o4,	%o5,	%i4
	movge	%xcc,	%l1,	%g1
	ldx	[%l7 + 0x78],	%l3
	andcc	%g6,	%o0,	%l2
	sth	%g5,	[%l7 + 0x64]
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	movrne	%i3,	0x066,	%l5
	movre	%o2,	0x3B6,	%g2
	stb	%o1,	[%l7 + 0x5A]
	movne	%icc,	%g3,	%o6
	subccc	%g7,	0x0D8E,	%l0
	fpmerge	%f1,	%f28,	%f26
	edge16n	%l6,	%i6,	%o3
	xnor	%l4,	0x130E,	%i2
	st	%f11,	[%l7 + 0x34]
	sllx	%g4,	%i0,	%o7
	fzeros	%f2
	lduw	[%l7 + 0x18],	%o4
	udivcc	%i1,	0x0D71,	%o5
	movvs	%xcc,	%i4,	%l1
	ldsh	[%l7 + 0x62],	%g1
	movvs	%xcc,	%l3,	%g6
	movg	%icc,	%o0,	%l2
	fpsub32s	%f16,	%f6,	%f30
	addcc	%g5,	%i5,	%i3
	udivx	%i7,	0x1229,	%l5
	ldx	[%l7 + 0x28],	%o2
	fmovrdne	%o1,	%f26,	%f20
	fmovrsne	%g3,	%f13,	%f13
	smul	%g2,	%o6,	%l0
	fnot2s	%f11,	%f11
	movleu	%icc,	%l6,	%g7
	smulcc	%o3,	0x182F,	%i6
	movne	%xcc,	%i2,	%l4
	fnot2s	%f23,	%f6
	subcc	%g4,	0x0D97,	%i0
	sth	%o4,	[%l7 + 0x0E]
	edge16	%i1,	%o7,	%o5
	sdivcc	%l1,	0x1730,	%g1
	std	%f12,	[%l7 + 0x58]
	movleu	%xcc,	%l3,	%i4
	movleu	%icc,	%g6,	%o0
	fmovrslz	%l2,	%f1,	%f12
	andncc	%i5,	%i3,	%i7
	mulx	%l5,	%o2,	%o1
	fmovrdgz	%g3,	%f22,	%f28
	movn	%icc,	%g2,	%o6
	xnorcc	%g5,	%l6,	%l0
	udivcc	%o3,	0x10E6,	%g7
	subcc	%i6,	0x06B8,	%l4
	stb	%g4,	[%l7 + 0x63]
	subcc	%i0,	0x101A,	%i2
	ld	[%l7 + 0x40],	%f4
	fmovdvc	%icc,	%f26,	%f13
	std	%f18,	[%l7 + 0x48]
	stb	%i1,	[%l7 + 0x72]
	andcc	%o4,	0x0B3E,	%o5
	smul	%o7,	%g1,	%l1
	ldd	[%l7 + 0x18],	%f6
	stw	%l3,	[%l7 + 0x60]
	movrlez	%i4,	0x013,	%g6
	nop
	set	0x20, %g2
	stx	%o0,	[%l7 + %g2]
	movvc	%icc,	%l2,	%i5
	sdivcc	%i7,	0x1D94,	%i3
	movrgz	%l5,	%o1,	%o2
	array16	%g2,	%o6,	%g3
	edge16n	%g5,	%l0,	%o3
	movle	%xcc,	%l6,	%i6
	addc	%l4,	%g4,	%i0
	udiv	%g7,	0x1AC6,	%i1
	ldsh	[%l7 + 0x14],	%o4
	fornot1	%f12,	%f16,	%f26
	array16	%i2,	%o5,	%g1
	subc	%l1,	0x1E8B,	%o7
	mulscc	%i4,	%g6,	%o0
	addcc	%l2,	%l3,	%i7
	movrlz	%i5,	%i3,	%l5
	fmovse	%xcc,	%f14,	%f28
	andn	%o1,	%g2,	%o2
	movcc	%icc,	%o6,	%g3
	movl	%xcc,	%l0,	%g5
	movvc	%xcc,	%l6,	%i6
	xnor	%l4,	%g4,	%o3
	fmovsneg	%xcc,	%f30,	%f10
	edge32n	%g7,	%i1,	%o4
	stx	%i2,	[%l7 + 0x50]
	edge32n	%o5,	%i0,	%l1
	alignaddr	%o7,	%i4,	%g6
	stw	%o0,	[%l7 + 0x20]
	ldsh	[%l7 + 0x4E],	%g1
	std	%f30,	[%l7 + 0x68]
	move	%icc,	%l2,	%i7
	edge16l	%i5,	%i3,	%l5
	fsrc2s	%f7,	%f24
	movleu	%icc,	%o1,	%l3
	movrlz	%g2,	0x1A8,	%o2
	srax	%o6,	%l0,	%g3
	edge8ln	%g5,	%l6,	%i6
	addccc	%g4,	%l4,	%g7
	nop
	set	0x1D, %i1
	ldsb	[%l7 + %i1],	%o3
	lduw	[%l7 + 0x58],	%o4
	ldsw	[%l7 + 0x08],	%i2
	addc	%i1,	0x1DB8,	%o5
	fpsub16	%f12,	%f28,	%f18
	nop
	set	0x37, %g6
	ldsb	[%l7 + %g6],	%i0
	or	%o7,	%i4,	%l1
	movrne	%o0,	%g1,	%l2
	fmovsneg	%xcc,	%f28,	%f26
	andn	%g6,	0x18EA,	%i7
	popc	0x08EC,	%i5
	movrgez	%l5,	0x27B,	%o1
	siam	0x4
	xorcc	%i3,	%l3,	%o2
	mulx	%g2,	%o6,	%g3
	movrgz	%l0,	%l6,	%g5
	ldsh	[%l7 + 0x5A],	%g4
	addcc	%i6,	%l4,	%g7
	fcmpeq32	%f30,	%f14,	%o4
	smul	%o3,	0x035E,	%i1
	ldx	[%l7 + 0x60],	%i2
	fmovrde	%i0,	%f30,	%f30
	andn	%o7,	0x0A3E,	%o5
	ldub	[%l7 + 0x0C],	%i4
	fnors	%f8,	%f13,	%f5
	array8	%l1,	%o0,	%g1
	movg	%icc,	%l2,	%i7
	movg	%xcc,	%g6,	%i5
	st	%f24,	[%l7 + 0x24]
	array16	%o1,	%i3,	%l5
	move	%icc,	%o2,	%g2
	fcmpd	%fcc2,	%f28,	%f30
	movrgz	%o6,	%l3,	%l0
	smul	%l6,	%g3,	%g4
	stw	%i6,	[%l7 + 0x34]
	fmovd	%f0,	%f2
	sethi	0x1E37,	%l4
	srlx	%g5,	%g7,	%o4
	movneg	%icc,	%i1,	%o3
	edge16n	%i2,	%o7,	%i0
	fpackfix	%f10,	%f11
	array16	%o5,	%i4,	%l1
	ldd	[%l7 + 0x48],	%f30
	xorcc	%g1,	%l2,	%o0
	array8	%i7,	%i5,	%o1
	fmovrsne	%i3,	%f6,	%f29
	fones	%f8
	movcs	%icc,	%g6,	%o2
	and	%l5,	%g2,	%o6
	movcs	%xcc,	%l3,	%l6
	udivx	%l0,	0x0FE5,	%g4
	movcc	%icc,	%g3,	%i6
	or	%l4,	%g5,	%o4
	orn	%g7,	%i1,	%o3
	movgu	%icc,	%o7,	%i2
	smul	%i0,	0x0932,	%o5
	nop
	set	0x40, %i5
	lduh	[%l7 + %i5],	%i4
	fmovdne	%icc,	%f30,	%f18
	movleu	%icc,	%g1,	%l2
	edge32l	%l1,	%o0,	%i7
	srax	%i5,	%o1,	%i3
	sir	0x0FC0
	movvc	%icc,	%g6,	%l5
	mulscc	%g2,	0x0126,	%o2
	fnot2	%f6,	%f8
	edge8l	%o6,	%l3,	%l0
	movgu	%icc,	%l6,	%g3
	array8	%i6,	%g4,	%l4
	sir	0x13E5
	sth	%o4,	[%l7 + 0x7A]
	fors	%f22,	%f11,	%f25
	addc	%g5,	%i1,	%o3
	alignaddrl	%g7,	%o7,	%i2
	movneg	%icc,	%o5,	%i4
	addcc	%i0,	0x1742,	%l2
	sdivcc	%g1,	0x1584,	%o0
	umul	%i7,	%l1,	%o1
	save %i3, 0x12D6, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l5,	%i5,	%o2
	movn	%icc,	%o6,	%l3
	sir	0x19E2
	nop
	set	0x4E, %g4
	lduh	[%l7 + %g4],	%g2
	addc	%l0,	%l6,	%g3
	array16	%g4,	%l4,	%i6
	fcmple32	%f4,	%f8,	%g5
	smul	%o4,	%i1,	%o3
	ldx	[%l7 + 0x20],	%g7
	movge	%icc,	%i2,	%o5
	std	%f12,	[%l7 + 0x08]
	lduh	[%l7 + 0x56],	%i4
	ldx	[%l7 + 0x78],	%o7
	fmul8x16au	%f23,	%f11,	%f24
	edge8	%l2,	%i0,	%o0
	nop
	set	0x74, %i2
	lduh	[%l7 + %i2],	%i7
	fornot1s	%f13,	%f17,	%f25
	movcs	%icc,	%g1,	%o1
	subc	%i3,	0x0B23,	%g6
	sub	%l5,	0x113A,	%l1
	edge16l	%i5,	%o2,	%o6
	and	%g2,	0x03C4,	%l0
	fcmpes	%fcc0,	%f29,	%f13
	nop
	set	0x40, %g1
	stx	%l6,	[%l7 + %g1]
	sir	0x095E
	fmovrdgez	%l3,	%f22,	%f12
	addcc	%g3,	%g4,	%l4
	popc	0x0869,	%g5
	movre	%i6,	%i1,	%o3
	movvs	%xcc,	%o4,	%g7
	fmuld8sux16	%f29,	%f27,	%f10
	fmovscs	%icc,	%f3,	%f12
	fpadd16s	%f27,	%f16,	%f16
	stb	%i2,	[%l7 + 0x76]
	srax	%i4,	0x17,	%o7
	fcmped	%fcc1,	%f18,	%f14
	fmovsge	%icc,	%f11,	%f16
	fmul8ulx16	%f28,	%f26,	%f26
	smul	%o5,	0x18CF,	%l2
	sir	0x0E0B
	stb	%i0,	[%l7 + 0x1E]
	fmovsn	%icc,	%f15,	%f24
	siam	0x5
	fmuld8ulx16	%f23,	%f30,	%f22
	sth	%i7,	[%l7 + 0x08]
	addc	%g1,	%o1,	%i3
	ldx	[%l7 + 0x58],	%g6
	alignaddr	%o0,	%l5,	%l1
	sra	%i5,	0x00,	%o2
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%g2
	fpadd16	%f28,	%f20,	%f16
	fors	%f27,	%f25,	%f20
	edge32l	%o6,	%l6,	%l3
	movleu	%xcc,	%g3,	%l0
	fnot2	%f24,	%f18
	array32	%g4,	%g5,	%l4
	ldsb	[%l7 + 0x62],	%i6
	lduh	[%l7 + 0x32],	%i1
	stw	%o3,	[%l7 + 0x50]
	sethi	0x1ABD,	%g7
	orncc	%o4,	0x16E2,	%i4
	movrne	%o7,	%i2,	%l2
	subccc	%o5,	%i7,	%g1
	fmovdcs	%icc,	%f13,	%f8
	ldx	[%l7 + 0x60],	%o1
	fornot2s	%f18,	%f4,	%f31
	or	%i0,	%g6,	%o0
	fmovdg	%icc,	%f1,	%f7
	movle	%xcc,	%l5,	%l1
	edge16n	%i5,	%o2,	%i3
	array16	%g2,	%o6,	%l6
	sllx	%g3,	0x1F,	%l3
	srax	%l0,	%g4,	%l4
	restore %g5, 0x1ABC, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %o3, %g7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i6,	%o7,	%i2
	fandnot2	%f6,	%f20,	%f30
	ldd	[%l7 + 0x18],	%f4
	udiv	%l2,	0x0813,	%i4
	movrgez	%o5,	%g1,	%i7
	siam	0x5
	fmuld8ulx16	%f31,	%f1,	%f18
	ldd	[%l7 + 0x20],	%i0
	edge16n	%g6,	%o1,	%l5
	fpmerge	%f17,	%f27,	%f18
	st	%f26,	[%l7 + 0x28]
	orncc	%o0,	0x0B24,	%i5
	movrlez	%o2,	0x2D1,	%i3
	orncc	%g2,	0x042E,	%l1
	sth	%o6,	[%l7 + 0x30]
	ldsb	[%l7 + 0x2C],	%g3
	xnorcc	%l6,	%l0,	%g4
	ldx	[%l7 + 0x08],	%l4
	fmovsleu	%xcc,	%f11,	%f3
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	orcc	%i1,	0x14AE,	%g7
	movrne	%o4,	0x18B,	%i6
	fmovdvs	%xcc,	%f18,	%f13
	move	%icc,	%o7,	%i2
	andncc	%l2,	%i4,	%o3
	ldsh	[%l7 + 0x36],	%g1
	fpadd16	%f16,	%f12,	%f0
	sir	0x026F
	movle	%icc,	%o5,	%i0
	andn	%g6,	0x0D1A,	%i7
	fandnot2	%f18,	%f16,	%f26
	fmovsge	%icc,	%f13,	%f15
	fmovsa	%xcc,	%f11,	%f21
	ldub	[%l7 + 0x70],	%o1
	ldsw	[%l7 + 0x0C],	%l5
	ldsw	[%l7 + 0x54],	%i5
	popc	%o0,	%o2
	sll	%i3,	0x15,	%g2
	fcmpne16	%f12,	%f28,	%l1
	fmovsleu	%icc,	%f22,	%f16
	ldsh	[%l7 + 0x62],	%g3
	sll	%o6,	%l0,	%g4
	and	%l6,	%l3,	%g5
	fpadd16s	%f4,	%f10,	%f18
	movrlz	%i1,	%l4,	%g7
	addcc	%i6,	0x1465,	%o4
	xor	%o7,	%i2,	%l2
	fsrc1s	%f28,	%f16
	or	%i4,	%o3,	%o5
	sllx	%g1,	0x06,	%i0
	stx	%g6,	[%l7 + 0x20]
	edge16	%o1,	%i7,	%l5
	movn	%icc,	%o0,	%o2
	edge16n	%i5,	%g2,	%l1
	mulscc	%i3,	%g3,	%o6
	fsrc1s	%f19,	%f20
	sra	%g4,	%l0,	%l6
	array8	%l3,	%i1,	%g5
	addccc	%l4,	%i6,	%g7
	edge32ln	%o4,	%o7,	%i2
	subcc	%l2,	0x15B8,	%o3
	array16	%o5,	%i4,	%i0
	subcc	%g1,	%g6,	%i7
	fmovdle	%icc,	%f26,	%f28
	movneg	%xcc,	%o1,	%l5
	ldsw	[%l7 + 0x74],	%o0
	srax	%o2,	%i5,	%g2
	addcc	%l1,	%g3,	%i3
	ld	[%l7 + 0x3C],	%f2
	ld	[%l7 + 0x5C],	%f10
	sethi	0x0216,	%o6
	srl	%g4,	0x12,	%l6
	edge32n	%l0,	%i1,	%l3
	movrne	%l4,	0x122,	%i6
	sra	%g7,	0x11,	%o4
	or	%o7,	%g5,	%l2
	edge32ln	%o3,	%i2,	%i4
	andn	%i0,	%o5,	%g1
	fmovrsne	%g6,	%f12,	%f11
	movrne	%i7,	0x169,	%l5
	siam	0x7
	andn	%o1,	0x1FAE,	%o2
	movvc	%xcc,	%o0,	%i5
	movrne	%l1,	%g3,	%g2
	movrgz	%i3,	%o6,	%l6
	std	%f18,	[%l7 + 0x40]
	edge8	%g4,	%i1,	%l3
	movcs	%icc,	%l4,	%i6
	addcc	%l0,	%o4,	%g7
	fmovrdlz	%g5,	%f4,	%f12
	fand	%f8,	%f2,	%f24
	fsrc1s	%f22,	%f11
	and	%o7,	%l2,	%i2
	movcs	%xcc,	%i4,	%i0
	fmovdn	%xcc,	%f30,	%f7
	edge32n	%o5,	%o3,	%g1
	edge32ln	%i7,	%l5,	%o1
	restore %g6, %o0, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f10,	%f0
	movcs	%icc,	%l1,	%g3
	alignaddrl	%g2,	%i5,	%o6
	xnorcc	%l6,	%i3,	%i1
	xnor	%g4,	0x0E67,	%l4
	fabss	%f4,	%f17
	fmovse	%icc,	%f19,	%f31
	fornot1s	%f6,	%f15,	%f7
	movrgz	%l3,	%i6,	%o4
	fnot1	%f16,	%f14
	fmovrse	%g7,	%f20,	%f0
	umulcc	%g5,	0x0630,	%o7
	popc	0x1B78,	%l0
	edge16	%i2,	%i4,	%i0
	umul	%o5,	%o3,	%g1
	fornot1	%f24,	%f28,	%f26
	sra	%l2,	0x0D,	%i7
	umulcc	%o1,	0x0B76,	%l5
	array32	%o0,	%g6,	%l1
	lduh	[%l7 + 0x22],	%g3
	edge32n	%o2,	%i5,	%g2
	movrgez	%l6,	0x13D,	%i3
	movleu	%icc,	%i1,	%o6
	fmovdvc	%icc,	%f24,	%f28
	lduw	[%l7 + 0x58],	%l4
	xnorcc	%l3,	%i6,	%g4
	popc	0x1197,	%g7
	umulcc	%g5,	0x00C3,	%o7
	andcc	%l0,	%o4,	%i2
	edge16n	%i0,	%o5,	%o3
	edge16	%g1,	%l2,	%i7
	stw	%i4,	[%l7 + 0x48]
	movrgz	%o1,	%o0,	%g6
	array32	%l1,	%g3,	%l5
	stb	%i5,	[%l7 + 0x0B]
	andncc	%g2,	%o2,	%l6
	fnor	%f12,	%f16,	%f4
	fornot1s	%f25,	%f21,	%f6
	mulscc	%i1,	0x05C3,	%i3
	sdivx	%l4,	0x06B4,	%o6
	fnot1	%f4,	%f8
	fmovdne	%icc,	%f26,	%f6
	ldsb	[%l7 + 0x40],	%i6
	xor	%g4,	0x03EF,	%g7
	edge16l	%g5,	%o7,	%l0
	sethi	0x0C46,	%o4
	fpmerge	%f4,	%f16,	%f12
	fmovsn	%icc,	%f12,	%f18
	movgu	%icc,	%i2,	%i0
	sdivcc	%o5,	0x1748,	%o3
	fxor	%f2,	%f22,	%f28
	alignaddrl	%g1,	%l3,	%l2
	ldsw	[%l7 + 0x5C],	%i4
	movre	%o1,	0x2B8,	%o0
	stx	%g6,	[%l7 + 0x08]
	fnor	%f10,	%f2,	%f22
	umul	%l1,	%i7,	%g3
	xnorcc	%i5,	%g2,	%l5
	std	%f12,	[%l7 + 0x40]
	fcmpeq16	%f30,	%f22,	%l6
	sll	%i1,	0x12,	%o2
	fmovdgu	%icc,	%f28,	%f8
	edge8	%i3,	%o6,	%i6
	nop
	set	0x44, %o1
	ldub	[%l7 + %o1],	%l4
	movne	%icc,	%g7,	%g4
	fsrc1s	%f5,	%f16
	subcc	%o7,	%g5,	%l0
	st	%f20,	[%l7 + 0x38]
	st	%f0,	[%l7 + 0x7C]
	movrne	%i2,	%o4,	%i0
	save %o5, 0x0C00, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f30,	[%l7 + 0x18]
	st	%f10,	[%l7 + 0x0C]
	ldsb	[%l7 + 0x12],	%o3
	xnorcc	%l2,	%i4,	%l3
	udivx	%o1,	0x1813,	%g6
	andn	%l1,	%i7,	%o0
	ld	[%l7 + 0x10],	%f14
	fpadd32	%f26,	%f14,	%f24
	nop
	set	0x44, %g5
	stw	%g3,	[%l7 + %g5]
	udivx	%i5,	0x1973,	%g2
	umul	%l6,	%i1,	%o2
	edge8n	%i3,	%l5,	%i6
	or	%o6,	%g7,	%g4
	edge8n	%o7,	%g5,	%l0
	sir	0x15D9
	srl	%l4,	%i2,	%i0
	andn	%o4,	%g1,	%o5
	movcc	%xcc,	%l2,	%i4
	alignaddrl	%l3,	%o1,	%g6
	smulcc	%o3,	0x0478,	%i7
	fmovrdne	%l1,	%f12,	%f30
	sllx	%g3,	0x05,	%i5
	movg	%xcc,	%o0,	%l6
	popc	%i1,	%o2
	movleu	%xcc,	%i3,	%l5
	edge16l	%i6,	%g2,	%o6
	subcc	%g7,	%g4,	%g5
	edge8l	%o7,	%l4,	%l0
	sll	%i2,	0x03,	%o4
	edge32n	%g1,	%o5,	%i0
	fmovsge	%xcc,	%f20,	%f5
	edge32ln	%l2,	%l3,	%i4
	orncc	%g6,	%o1,	%i7
	stw	%l1,	[%l7 + 0x64]
	umul	%o3,	%i5,	%o0
	fmuld8sux16	%f15,	%f3,	%f4
	fsrc1s	%f10,	%f20
	xnor	%l6,	%i1,	%o2
	smul	%g3,	%i3,	%i6
	fmovdpos	%xcc,	%f8,	%f16
	orn	%l5,	0x1BCB,	%g2
	movrgz	%g7,	0x0FC,	%o6
	alignaddrl	%g5,	%o7,	%l4
	fcmpgt32	%f12,	%f2,	%g4
	array8	%i2,	%o4,	%g1
	ldsb	[%l7 + 0x13],	%o5
	srlx	%i0,	%l0,	%l2
	sethi	0x1C9C,	%i4
	fcmped	%fcc1,	%f20,	%f14
	add	%g6,	%l3,	%i7
	edge16n	%o1,	%o3,	%l1
	ldsw	[%l7 + 0x30],	%o0
	ldsh	[%l7 + 0x4A],	%l6
	fmovsg	%icc,	%f7,	%f4
	sth	%i1,	[%l7 + 0x68]
	fmovsneg	%icc,	%f2,	%f19
	subc	%i5,	%g3,	%i3
	stb	%i6,	[%l7 + 0x6B]
	addccc	%o2,	%l5,	%g7
	ldsb	[%l7 + 0x3C],	%o6
	and	%g2,	%o7,	%g5
	fmuld8sux16	%f16,	%f19,	%f24
	edge8	%l4,	%i2,	%g4
	addcc	%g1,	%o5,	%o4
	movgu	%icc,	%l0,	%i0
	srax	%i4,	0x16,	%g6
	edge8ln	%l2,	%i7,	%o1
	sir	0x0AA1
	edge16l	%o3,	%l3,	%o0
	sdivx	%l6,	0x1E14,	%i1
	array8	%i5,	%g3,	%l1
	alignaddr	%i3,	%o2,	%i6
	orcc	%g7,	0x1182,	%o6
	edge8ln	%g2,	%o7,	%l5
	edge32	%g5,	%i2,	%g4
	movgu	%icc,	%l4,	%o5
	alignaddr	%g1,	%o4,	%l0
	fmovsne	%xcc,	%f29,	%f20
	edge32	%i0,	%g6,	%l2
	movgu	%xcc,	%i4,	%i7
	addc	%o1,	0x04A3,	%o3
	fmovdge	%icc,	%f13,	%f22
	udiv	%o0,	0x107E,	%l3
	edge16	%i1,	%i5,	%l6
	fpackfix	%f28,	%f5
	nop
	set	0x18, %l2
	std	%f10,	[%l7 + %l2]
	fpadd16	%f14,	%f22,	%f2
	movpos	%icc,	%g3,	%l1
	stw	%i3,	[%l7 + 0x18]
	fmovdcc	%xcc,	%f10,	%f23
	ldx	[%l7 + 0x38],	%o2
	smul	%g7,	%i6,	%o6
	bshuffle	%f10,	%f22,	%f0
	movcs	%xcc,	%g2,	%l5
	ldsw	[%l7 + 0x6C],	%g5
	udiv	%o7,	0x1D02,	%g4
	umul	%l4,	%o5,	%i2
	orncc	%o4,	%l0,	%i0
	fnor	%f16,	%f6,	%f12
	fxors	%f22,	%f25,	%f5
	ldsb	[%l7 + 0x14],	%g1
	xorcc	%g6,	0x0D6F,	%l2
	smul	%i4,	%o1,	%i7
	udivx	%o3,	0x1C11,	%l3
	fandnot1s	%f4,	%f5,	%f2
	umul	%o0,	%i1,	%l6
	st	%f22,	[%l7 + 0x68]
	mulscc	%g3,	%i5,	%l1
	fmovsl	%icc,	%f25,	%f31
	or	%o2,	%i3,	%g7
	smulcc	%i6,	0x050D,	%g2
	sdivx	%l5,	0x0208,	%o6
	movle	%xcc,	%g5,	%o7
	fcmpgt16	%f0,	%f2,	%g4
	fmovrde	%o5,	%f18,	%f28
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	subcc	%i2,	%l0,	%g1
	orn	%g6,	%l2,	%i0
	fmovda	%icc,	%f26,	%f23
	movcc	%xcc,	%i4,	%o1
	andncc	%o3,	%i7,	%o0
	xorcc	%l3,	%l6,	%i1
	fmovsge	%icc,	%f30,	%f2
	sth	%i5,	[%l7 + 0x50]
	alignaddrl	%l1,	%o2,	%g3
	fornot2s	%f0,	%f13,	%f10
	stw	%g7,	[%l7 + 0x20]
	sdiv	%i3,	0x068E,	%i6
	edge32	%g2,	%l5,	%o6
	sub	%g5,	0x0802,	%g4
	smul	%o7,	0x0758,	%l4
	fmovsn	%xcc,	%f11,	%f30
	movne	%xcc,	%o4,	%o5
	fmovrdlez	%i2,	%f28,	%f16
	movrlz	%g1,	%g6,	%l0
	fpack32	%f2,	%f24,	%f12
	edge8ln	%l2,	%i4,	%o1
	ldsh	[%l7 + 0x42],	%o3
	xor	%i7,	%o0,	%i0
	movrne	%l3,	%i1,	%l6
	mulx	%l1,	%i5,	%o2
	movne	%xcc,	%g7,	%i3
	alignaddrl	%g3,	%g2,	%l5
	fmovscc	%icc,	%f20,	%f27
	movrlez	%o6,	%g5,	%g4
	edge8	%o7,	%l4,	%o4
	movre	%i6,	%i2,	%g1
	stw	%g6,	[%l7 + 0x08]
	lduw	[%l7 + 0x6C],	%l0
	movvc	%xcc,	%l2,	%i4
	ldsb	[%l7 + 0x11],	%o1
	smulcc	%o3,	0x0BD5,	%o5
	edge8n	%o0,	%i7,	%l3
	srlx	%i0,	0x18,	%l6
	add	%i1,	%l1,	%o2
	movge	%icc,	%i5,	%g7
	movvc	%xcc,	%g3,	%i3
	or	%g2,	%l5,	%o6
	movre	%g5,	0x1D2,	%o7
	fandnot1	%f6,	%f16,	%f30
	fmovsvc	%xcc,	%f24,	%f31
	fmuld8ulx16	%f31,	%f16,	%f16
	sllx	%l4,	%o4,	%g4
	subccc	%i2,	%g1,	%i6
	xnor	%g6,	0x173D,	%l2
	udivcc	%l0,	0x008D,	%o1
	movvc	%icc,	%o3,	%o5
	fpadd32	%f2,	%f16,	%f12
	mulscc	%o0,	%i4,	%i7
	edge32ln	%i0,	%l6,	%i1
	movneg	%xcc,	%l1,	%l3
	smulcc	%i5,	%g7,	%o2
	subc	%i3,	%g3,	%l5
	for	%f10,	%f26,	%f0
	movcs	%xcc,	%o6,	%g2
	movpos	%icc,	%o7,	%l4
	stw	%o4,	[%l7 + 0x20]
	movle	%icc,	%g4,	%i2
	addcc	%g1,	0x169D,	%i6
	ldsb	[%l7 + 0x62],	%g6
	addcc	%l2,	%l0,	%o1
	nop
	set	0x7E, %o6
	lduh	[%l7 + %o6],	%g5
	orn	%o3,	%o5,	%i4
	fcmple32	%f22,	%f12,	%i7
	movgu	%icc,	%i0,	%o0
	edge16ln	%i1,	%l1,	%l3
	st	%f15,	[%l7 + 0x10]
	st	%f0,	[%l7 + 0x34]
	xorcc	%i5,	0x0C78,	%l6
	edge8n	%g7,	%o2,	%i3
	fcmple32	%f10,	%f16,	%g3
	fpadd16	%f20,	%f22,	%f4
	sethi	0x01C8,	%l5
	st	%f12,	[%l7 + 0x2C]
	edge8n	%o6,	%o7,	%l4
	fpsub32	%f30,	%f6,	%f20
	orn	%g2,	%g4,	%i2
	orn	%o4,	0x133A,	%i6
	sdivcc	%g6,	0x1911,	%l2
	movleu	%icc,	%l0,	%o1
	sub	%g5,	0x02EC,	%g1
	fmovdge	%icc,	%f19,	%f22
	sethi	0x0201,	%o3
	movneg	%icc,	%i4,	%o5
	popc	0x0426,	%i7
	fmovs	%f15,	%f28
	fcmple32	%f8,	%f26,	%o0
	movge	%icc,	%i1,	%l1
	fmovdl	%xcc,	%f23,	%f31
	ldd	[%l7 + 0x10],	%i0
	fornot2	%f18,	%f6,	%f0
	movne	%icc,	%i5,	%l3
	fcmpes	%fcc3,	%f30,	%f25
	array16	%l6,	%o2,	%i3
	and	%g3,	0x0362,	%g7
	movvs	%xcc,	%l5,	%o7
	pdist	%f8,	%f12,	%f30
	array8	%l4,	%o6,	%g2
	edge32l	%g4,	%i2,	%i6
	movneg	%icc,	%g6,	%l2
	ldsb	[%l7 + 0x23],	%l0
	udivcc	%o1,	0x1D56,	%o4
	sllx	%g5,	0x0B,	%g1
	fpsub16s	%f29,	%f22,	%f30
	ldsb	[%l7 + 0x56],	%i4
	array32	%o3,	%o5,	%i7
	mulx	%i1,	0x0BA0,	%o0
	umulcc	%i0,	%l1,	%l3
	movcs	%icc,	%i5,	%o2
	smulcc	%l6,	%g3,	%g7
	edge16l	%i3,	%o7,	%l5
	movcc	%icc,	%o6,	%g2
	edge16n	%l4,	%g4,	%i2
	andcc	%i6,	%g6,	%l0
	stx	%o1,	[%l7 + 0x20]
	movleu	%icc,	%o4,	%g5
	movvc	%icc,	%l2,	%g1
	movcc	%icc,	%o3,	%o5
	orncc	%i4,	0x1501,	%i7
	array8	%o0,	%i0,	%l1
	addccc	%i1,	%l3,	%i5
	fmovde	%icc,	%f30,	%f24
	array16	%o2,	%g3,	%g7
	st	%f18,	[%l7 + 0x40]
	pdist	%f22,	%f16,	%f24
	edge8n	%i3,	%l6,	%l5
	fmovrslez	%o7,	%f1,	%f28
	movrgz	%g2,	%o6,	%l4
	mova	%xcc,	%i2,	%i6
	array16	%g4,	%g6,	%l0
	srl	%o4,	%g5,	%l2
	fmovrdgz	%o1,	%f6,	%f30
	fcmple32	%f0,	%f6,	%o3
	srl	%o5,	0x0D,	%g1
	fandnot2	%f12,	%f16,	%f0
	movrgz	%i4,	%o0,	%i7
	udivcc	%l1,	0x1C5A,	%i1
	edge16ln	%i0,	%i5,	%l3
	udiv	%g3,	0x12D2,	%g7
	addc	%o2,	0x0D87,	%l6
	edge16ln	%l5,	%i3,	%g2
	fandnot2s	%f27,	%f2,	%f19
	movrlez	%o7,	%o6,	%l4
	stw	%i6,	[%l7 + 0x1C]
	smulcc	%g4,	0x17A0,	%g6
	sllx	%l0,	0x1C,	%o4
	movn	%icc,	%g5,	%l2
	srl	%o1,	%i2,	%o3
	ldsh	[%l7 + 0x28],	%o5
	addcc	%g1,	0x0342,	%i4
	movvc	%xcc,	%o0,	%l1
	movrgz	%i7,	%i1,	%i0
	stw	%i5,	[%l7 + 0x68]
	fmovrdlez	%g3,	%f30,	%f20
	orncc	%g7,	%l3,	%l6
	fmovdcs	%xcc,	%f8,	%f1
	edge8ln	%o2,	%l5,	%g2
	movvs	%xcc,	%o7,	%i3
	movcs	%xcc,	%o6,	%i6
	add	%l4,	%g4,	%l0
	fone	%f6
	umulcc	%o4,	0x1C50,	%g5
	ldx	[%l7 + 0x18],	%l2
	srax	%g6,	%i2,	%o3
	fmovsleu	%icc,	%f11,	%f25
	ld	[%l7 + 0x20],	%f12
	fmovdneg	%xcc,	%f23,	%f5
	edge32ln	%o5,	%o1,	%g1
	movrne	%i4,	%l1,	%i7
	sdivx	%o0,	0x0461,	%i0
	fpadd16	%f10,	%f24,	%f16
	fandnot1	%f24,	%f16,	%f30
	movrgez	%i1,	%g3,	%i5
	save %l3, %g7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%xcc,	%f5,	%f22
	alignaddr	%l6,	%g2,	%o7
	orncc	%l5,	0x1482,	%i3
	sra	%i6,	%o6,	%g4
	fmul8x16au	%f6,	%f5,	%f8
	mova	%icc,	%l4,	%l0
	udivx	%o4,	0x1603,	%g5
	sll	%l2,	0x1C,	%i2
	sethi	0x1BF6,	%g6
	alignaddr	%o3,	%o1,	%g1
	and	%i4,	%o5,	%i7
	sir	0x148A
	fmovsne	%icc,	%f30,	%f11
	edge32l	%o0,	%l1,	%i0
	andncc	%i1,	%g3,	%i5
	mulscc	%g7,	%l3,	%l6
	movg	%xcc,	%o2,	%o7
	smul	%g2,	0x1498,	%l5
	smul	%i6,	0x0A73,	%i3
	array8	%o6,	%g4,	%l4
	array32	%o4,	%l0,	%l2
	subc	%i2,	%g6,	%o3
	smul	%g5,	0x0D58,	%g1
	fmovdg	%xcc,	%f1,	%f8
	or	%i4,	0x0281,	%o5
	mulx	%o1,	0x1822,	%o0
	srlx	%i7,	0x03,	%l1
	fmovdgu	%icc,	%f26,	%f31
	orcc	%i1,	%i0,	%g3
	sdiv	%i5,	0x186D,	%g7
	sth	%l6,	[%l7 + 0x64]
	edge16l	%l3,	%o2,	%g2
	ldd	[%l7 + 0x48],	%f16
	fmovda	%icc,	%f31,	%f21
	movrgz	%o7,	%l5,	%i6
	fnor	%f20,	%f18,	%f24
	fabsd	%f10,	%f18
	fxors	%f11,	%f31,	%f26
	smulcc	%o6,	0x1C54,	%i3
	srax	%g4,	%l4,	%l0
	ldd	[%l7 + 0x30],	%l2
	sub	%i2,	%g6,	%o3
	fpsub32	%f12,	%f0,	%f26
	movg	%xcc,	%g5,	%o4
	umul	%i4,	%g1,	%o1
	udivcc	%o0,	0x1B74,	%i7
	movcc	%icc,	%l1,	%o5
	st	%f22,	[%l7 + 0x0C]
	edge8ln	%i1,	%i0,	%i5
	movrlez	%g7,	%l6,	%l3
	movvc	%xcc,	%o2,	%g3
	subc	%o7,	0x13B7,	%l5
	stx	%g2,	[%l7 + 0x40]
	fmovsle	%icc,	%f15,	%f13
	fpack32	%f24,	%f10,	%f8
	fmovspos	%xcc,	%f23,	%f14
	fmovrsgz	%i6,	%f15,	%f22
	edge32n	%o6,	%i3,	%l4
	movvs	%icc,	%g4,	%l2
	ldd	[%l7 + 0x60],	%f6
	or	%i2,	0x090A,	%l0
	ld	[%l7 + 0x48],	%f11
	udivcc	%g6,	0x15B9,	%o3
	edge16ln	%g5,	%i4,	%g1
	movgu	%xcc,	%o1,	%o0
	xnor	%o4,	%i7,	%l1
	movle	%xcc,	%o5,	%i1
	array8	%i0,	%i5,	%l6
	subcc	%l3,	%o2,	%g3
	srl	%g7,	0x05,	%o7
	lduh	[%l7 + 0x1C],	%g2
	fpadd16	%f22,	%f20,	%f22
	subc	%i6,	0x0FF6,	%l5
	fornot1s	%f14,	%f0,	%f20
	movcs	%icc,	%i3,	%o6
	addc	%l4,	%l2,	%i2
	mulscc	%l0,	%g6,	%o3
	edge16ln	%g4,	%i4,	%g5
	ldsh	[%l7 + 0x70],	%g1
	or	%o1,	0x1799,	%o0
	sdivx	%o4,	0x073E,	%i7
	edge16ln	%o5,	%i1,	%l1
	andncc	%i0,	%l6,	%l3
	ldd	[%l7 + 0x30],	%f6
	fxor	%f20,	%f30,	%f24
	subcc	%o2,	%i5,	%g7
	movpos	%xcc,	%g3,	%g2
	add	%o7,	%i6,	%l5
	save %o6, 0x0A9F, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f9,	%f14,	%f14
	sub	%l2,	0x0324,	%l4
	udivx	%i2,	0x0204,	%g6
	fone	%f26
	ldub	[%l7 + 0x7A],	%o3
	ldd	[%l7 + 0x48],	%f18
	sir	0x1522
	sdiv	%g4,	0x0635,	%i4
	andncc	%g5,	%g1,	%o1
	fmovsn	%xcc,	%f8,	%f4
	movleu	%xcc,	%l0,	%o0
	fornot2s	%f20,	%f15,	%f11
	andn	%o4,	0x1E30,	%o5
	nop
	set	0x10, %o7
	sth	%i1,	[%l7 + %o7]
	fnot1	%f18,	%f24
	ldd	[%l7 + 0x20],	%l0
	ldd	[%l7 + 0x70],	%f24
	subcc	%i7,	%i0,	%l3
	fcmpeq16	%f16,	%f26,	%o2
	ldd	[%l7 + 0x48],	%i6
	xnor	%g7,	0x1A84,	%g3
	movn	%xcc,	%g2,	%o7
	sll	%i5,	0x15,	%i6
	edge8ln	%l5,	%i3,	%o6
	andcc	%l2,	%i2,	%g6
	mulx	%o3,	0x1C97,	%l4
	udivx	%i4,	0x060D,	%g4
	umulcc	%g5,	%g1,	%o1
	movcs	%icc,	%l0,	%o4
	movrne	%o0,	%o5,	%i1
	sir	0x1085
	fmovrdne	%i7,	%f12,	%f2
	mulx	%l1,	%l3,	%i0
	alignaddrl	%l6,	%g7,	%o2
	srax	%g3,	%g2,	%i5
	xor	%o7,	%i6,	%l5
	fpack32	%f20,	%f18,	%f6
	fpadd16s	%f19,	%f8,	%f19
	fmovrslz	%i3,	%f30,	%f28
	fmovda	%xcc,	%f13,	%f29
	stw	%l2,	[%l7 + 0x08]
	ldsw	[%l7 + 0x7C],	%o6
	movcs	%icc,	%i2,	%g6
	andcc	%l4,	0x1834,	%o3
	movle	%xcc,	%i4,	%g5
	std	%f2,	[%l7 + 0x30]
	xor	%g4,	0x059C,	%o1
	addccc	%l0,	%g1,	%o0
	subccc	%o4,	%o5,	%i1
	movl	%icc,	%l1,	%i7
	fcmple16	%f6,	%f10,	%i0
	sethi	0x151C,	%l6
	ldsh	[%l7 + 0x44],	%g7
	stb	%o2,	[%l7 + 0x58]
	fcmpeq32	%f2,	%f6,	%l3
	fzero	%f14
	st	%f27,	[%l7 + 0x50]
	ldd	[%l7 + 0x68],	%g2
	movrlz	%g3,	0x145,	%i5
	ldd	[%l7 + 0x38],	%f6
	edge32	%o7,	%i6,	%l5
	ld	[%l7 + 0x08],	%f20
	subcc	%i3,	0x1678,	%l2
	movn	%icc,	%o6,	%i2
	for	%f22,	%f4,	%f4
	stb	%l4,	[%l7 + 0x09]
	fabsd	%f14,	%f4
	nop
	set	0x60, %i3
	sth	%g6,	[%l7 + %i3]
	or	%o3,	0x1BD0,	%g5
	ldsb	[%l7 + 0x59],	%g4
	xor	%o1,	0x12D8,	%i4
	movpos	%icc,	%l0,	%g1
	sdivcc	%o4,	0x1AE3,	%o0
	fandnot2	%f30,	%f26,	%f24
	move	%xcc,	%i1,	%l1
	movn	%xcc,	%i7,	%i0
	std	%f30,	[%l7 + 0x58]
	srl	%o5,	0x02,	%g7
	fabss	%f8,	%f14
	sdivcc	%l6,	0x0D79,	%o2
	orcc	%l3,	0x1134,	%g2
	add	%i5,	%g3,	%i6
	udiv	%o7,	0x1E49,	%i3
	edge16ln	%l2,	%o6,	%l5
	orn	%l4,	0x12B1,	%g6
	fmul8x16au	%f28,	%f28,	%f20
	srlx	%i2,	0x1F,	%g5
	andcc	%o3,	%o1,	%i4
	fmovsg	%icc,	%f0,	%f3
	ldx	[%l7 + 0x58],	%g4
	move	%xcc,	%g1,	%l0
	subcc	%o0,	%i1,	%l1
	sllx	%o4,	%i0,	%i7
	orn	%o5,	0x087B,	%l6
	and	%o2,	0x009C,	%g7
	fone	%f28
	std	%f26,	[%l7 + 0x10]
	movrgez	%l3,	0x360,	%i5
	srax	%g2,	%i6,	%o7
	fmovrslz	%g3,	%f31,	%f15
	fnands	%f16,	%f19,	%f24
	fnors	%f8,	%f23,	%f7
	movcc	%icc,	%l2,	%o6
	andncc	%i3,	%l4,	%g6
	udiv	%l5,	0x13AC,	%i2
	fpack32	%f12,	%f10,	%f16
	addccc	%o3,	%g5,	%o1
	or	%i4,	0x115A,	%g1
	edge32	%g4,	%o0,	%l0
	fmovdvc	%icc,	%f25,	%f7
	fcmpeq32	%f26,	%f28,	%i1
	fmovrsne	%l1,	%f9,	%f3
	std	%f16,	[%l7 + 0x10]
	mulscc	%o4,	0x02E7,	%i0
	movrlz	%o5,	0x2FB,	%l6
	edge32n	%i7,	%g7,	%o2
	edge8l	%i5,	%l3,	%i6
	fornot1s	%f25,	%f14,	%f5
	srax	%o7,	%g3,	%g2
	subc	%l2,	0x1500,	%o6
	add	%i3,	%g6,	%l5
	mulscc	%l4,	%i2,	%o3
	alignaddr	%g5,	%o1,	%g1
	sll	%i4,	%o0,	%l0
	array8	%g4,	%l1,	%i1
	ldsb	[%l7 + 0x74],	%o4
	fmovrdne	%i0,	%f28,	%f4
	array32	%l6,	%o5,	%i7
	srlx	%o2,	%i5,	%g7
	edge8ln	%l3,	%i6,	%o7
	udiv	%g3,	0x013B,	%l2
	edge32l	%o6,	%i3,	%g6
	orcc	%g2,	%l4,	%l5
	edge8n	%i2,	%g5,	%o1
	subccc	%g1,	%i4,	%o0
	ldub	[%l7 + 0x0A],	%l0
	stx	%o3,	[%l7 + 0x58]
	addcc	%g4,	0x03B2,	%i1
	subc	%o4,	0x1038,	%i0
	ld	[%l7 + 0x40],	%f1
	udivx	%l6,	0x1E74,	%l1
	fmovsneg	%icc,	%f11,	%f20
	stw	%i7,	[%l7 + 0x74]
	stx	%o5,	[%l7 + 0x60]
	movpos	%xcc,	%i5,	%g7
	stx	%o2,	[%l7 + 0x68]
	siam	0x2
	restore %l3, %i6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l2, 0x1C08, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o6,	%i3,	%g2
	add	%g6,	%l4,	%i2
	mulx	%l5,	0x0AC0,	%o1
	ld	[%l7 + 0x68],	%f30
	fmovsvs	%xcc,	%f16,	%f17
	edge8n	%g1,	%i4,	%g5
	movne	%xcc,	%l0,	%o3
	umulcc	%g4,	0x0591,	%o0
	sdivcc	%i1,	0x043D,	%o4
	fcmpgt32	%f8,	%f4,	%l6
	addccc	%i0,	%l1,	%o5
	edge32ln	%i5,	%i7,	%g7
	st	%f19,	[%l7 + 0x1C]
	edge16n	%o2,	%l3,	%g3
	fmovrde	%i6,	%f16,	%f30
	fmovdleu	%icc,	%f11,	%f14
	ldsb	[%l7 + 0x42],	%l2
	orn	%o7,	%i3,	%o6
	sll	%g2,	%g6,	%i2
	std	%f0,	[%l7 + 0x58]
	save %l5, %o1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%i4,	%g1
	fnands	%f7,	%f0,	%f15
	lduh	[%l7 + 0x6E],	%g5
	fsrc2s	%f14,	%f8
	fmovsne	%icc,	%f9,	%f30
	edge32n	%o3,	%l0,	%g4
	array16	%i1,	%o4,	%l6
	sth	%o0,	[%l7 + 0x3C]
	orcc	%l1,	%i0,	%i5
	fmul8ulx16	%f12,	%f8,	%f30
	sdivx	%i7,	0x01BB,	%o5
	stw	%o2,	[%l7 + 0x30]
	umulcc	%l3,	0x140E,	%g3
	umul	%i6,	0x1356,	%g7
	ldsh	[%l7 + 0x64],	%o7
	addcc	%l2,	0x1A01,	%o6
	ldsb	[%l7 + 0x65],	%g2
	fmovsgu	%xcc,	%f7,	%f21
	edge32n	%i3,	%i2,	%g6
	srlx	%o1,	%l4,	%l5
	fmovsgu	%xcc,	%f25,	%f22
	ldsb	[%l7 + 0x31],	%i4
	addcc	%g5,	0x0E05,	%o3
	sub	%l0,	%g1,	%g4
	ldd	[%l7 + 0x50],	%i0
	stx	%l6,	[%l7 + 0x58]
	fones	%f25
	edge8	%o4,	%l1,	%i0
	fmul8x16	%f17,	%f2,	%f26
	ldsh	[%l7 + 0x4A],	%o0
	fpsub16	%f4,	%f0,	%f0
	ldsh	[%l7 + 0x7E],	%i7
	lduw	[%l7 + 0x6C],	%o5
	fpackfix	%f4,	%f22
	lduh	[%l7 + 0x50],	%o2
	nop
	set	0x2C, %i7
	ldsw	[%l7 + %i7],	%i5
	mulx	%l3,	0x0EE5,	%i6
	smul	%g7,	%g3,	%o7
	subcc	%o6,	0x132E,	%g2
	orcc	%i3,	%i2,	%l2
	orncc	%g6,	0x0488,	%l4
	sdivx	%l5,	0x02D5,	%i4
	movle	%icc,	%g5,	%o3
	sub	%o1,	%l0,	%g1
	ldub	[%l7 + 0x60],	%i1
	fmovdge	%icc,	%f12,	%f16
	array8	%g4,	%o4,	%l6
	edge32	%l1,	%o0,	%i7
	andncc	%o5,	%i0,	%o2
	fnand	%f14,	%f24,	%f10
	fmovdpos	%icc,	%f0,	%f8
	stb	%l3,	[%l7 + 0x0F]
	sdivcc	%i5,	0x1A44,	%g7
	subc	%i6,	%o7,	%o6
	mulscc	%g3,	%g2,	%i3
	addcc	%i2,	%l2,	%g6
	udiv	%l5,	0x09E8,	%l4
	ld	[%l7 + 0x3C],	%f6
	fmul8ulx16	%f24,	%f24,	%f8
	fcmpgt32	%f0,	%f12,	%i4
	andncc	%o3,	%o1,	%l0
	stx	%g1,	[%l7 + 0x28]
	srax	%i1,	0x05,	%g4
	sdivcc	%g5,	0x17E0,	%o4
	andn	%l1,	0x05D3,	%l6
	movn	%xcc,	%i7,	%o0
	fsrc1s	%f31,	%f26
	lduh	[%l7 + 0x38],	%o5
	subccc	%o2,	%i0,	%i5
	movg	%xcc,	%l3,	%g7
	ld	[%l7 + 0x20],	%f31
	movneg	%xcc,	%o7,	%o6
	orcc	%i6,	0x12A4,	%g3
	fandnot1s	%f29,	%f0,	%f21
	save %g2, 0x1BEC, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x50],	%i2
	andncc	%g6,	%l5,	%l4
	subc	%i4,	%l2,	%o1
	edge8	%o3,	%g1,	%i1
	ldub	[%l7 + 0x15],	%g4
	fand	%f0,	%f6,	%f20
	movrgz	%l0,	0x392,	%g5
	movl	%icc,	%l1,	%o4
	ldub	[%l7 + 0x7A],	%l6
	umulcc	%o0,	%i7,	%o5
	andcc	%i0,	0x0097,	%i5
	movneg	%icc,	%l3,	%g7
	addcc	%o7,	0x13E5,	%o2
	movcs	%xcc,	%i6,	%g3
	sllx	%o6,	0x0E,	%g2
	sdivx	%i3,	0x1BA1,	%g6
	sethi	0x1CA2,	%i2
	fmul8x16au	%f26,	%f15,	%f18
	fmovrse	%l4,	%f15,	%f21
	sll	%l5,	0x06,	%l2
	movvs	%xcc,	%o1,	%i4
	fandnot1	%f2,	%f6,	%f24
	array32	%o3,	%i1,	%g4
	sth	%l0,	[%l7 + 0x20]
	mova	%icc,	%g1,	%l1
	array32	%o4,	%g5,	%o0
	fmovscs	%xcc,	%f11,	%f13
	orcc	%l6,	0x0CF3,	%i7
	movvs	%xcc,	%o5,	%i5
	edge8l	%l3,	%i0,	%g7
	ldsh	[%l7 + 0x7E],	%o2
	sll	%i6,	0x0D,	%o7
	fpsub32s	%f7,	%f31,	%f27
	udiv	%o6,	0x0066,	%g3
	fmul8x16	%f17,	%f4,	%f20
	smulcc	%g2,	%i3,	%i2
	movvs	%icc,	%g6,	%l4
	or	%l2,	%o1,	%l5
	ld	[%l7 + 0x60],	%f23
	lduw	[%l7 + 0x54],	%o3
	fmovs	%f31,	%f2
	sth	%i1,	[%l7 + 0x76]
	orn	%i4,	%g4,	%l0
	edge32l	%g1,	%o4,	%l1
	fmovdvs	%icc,	%f4,	%f29
	udiv	%o0,	0x0F8C,	%g5
	edge8l	%i7,	%l6,	%i5
	edge32l	%o5,	%l3,	%g7
	fmovsgu	%icc,	%f2,	%f26
	stb	%i0,	[%l7 + 0x1E]
	movrlez	%i6,	0x264,	%o2
	nop
	set	0x12, %g7
	lduh	[%l7 + %g7],	%o6
	mulx	%o7,	%g2,	%i3
	movgu	%icc,	%g3,	%i2
	subc	%l4,	%l2,	%g6
	subccc	%l5,	%o1,	%i1
	sdiv	%o3,	0x1B14,	%g4
	udiv	%l0,	0x115D,	%g1
	movre	%o4,	0x165,	%i4
	srax	%o0,	%g5,	%i7
	movrgez	%l1,	0x077,	%l6
	srax	%o5,	%l3,	%i5
	movneg	%icc,	%g7,	%i6
	edge8l	%i0,	%o2,	%o7
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	sth	%g3,	[%l7 + 0x2A]
	addc	%g2,	%l4,	%i2
	and	%l2,	0x12AA,	%g6
	fmovsl	%xcc,	%f10,	%f9
	movcs	%icc,	%o1,	%l5
	fmovspos	%xcc,	%f9,	%f8
	edge8l	%i1,	%g4,	%o3
	edge16n	%g1,	%l0,	%o4
	umulcc	%i4,	%o0,	%i7
	movrne	%g5,	0x0A3,	%l6
	addcc	%l1,	0x0C7E,	%l3
	subcc	%i5,	%g7,	%i6
	ldd	[%l7 + 0x30],	%f10
	smul	%i0,	%o5,	%o7
	orncc	%o2,	0x1937,	%o6
	smul	%i3,	0x195D,	%g2
	smul	%g3,	0x15EE,	%l4
	umul	%l2,	0x03EC,	%i2
	fmovdcs	%xcc,	%f28,	%f1
	movgu	%icc,	%o1,	%l5
	fone	%f14
	sethi	0x1323,	%i1
	ldsw	[%l7 + 0x18],	%g6
	subcc	%o3,	0x1DDC,	%g1
	edge16ln	%g4,	%o4,	%i4
	movre	%o0,	%l0,	%i7
	fpsub16s	%f0,	%f2,	%f4
	movle	%xcc,	%l6,	%l1
	ldd	[%l7 + 0x40],	%l2
	lduh	[%l7 + 0x10],	%i5
	or	%g7,	%g5,	%i0
	sdivx	%o5,	0x1C3A,	%o7
	movleu	%icc,	%o2,	%i6
	or	%o6,	0x0131,	%g2
	movrlez	%i3,	%g3,	%l4
	for	%f14,	%f14,	%f14
	movcs	%icc,	%l2,	%o1
	sub	%l5,	0x1915,	%i2
	fmovdcs	%xcc,	%f14,	%f4
	smul	%i1,	%o3,	%g1
	sdivx	%g4,	0x007A,	%g6
	edge32	%i4,	%o0,	%l0
	stx	%i7,	[%l7 + 0x70]
	movvc	%xcc,	%l6,	%o4
	movgu	%icc,	%l3,	%i5
	movrgz	%l1,	%g5,	%g7
	sll	%i0,	%o5,	%o7
	fcmpeq32	%f2,	%f30,	%i6
	movcc	%icc,	%o2,	%g2
	sdivx	%o6,	0x1871,	%i3
	restore %l4, 0x171B, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l2,	%o1,	%i2
	movg	%xcc,	%i1,	%l5
	addccc	%g1,	0x0B56,	%g4
	fmovrdgez	%g6,	%f22,	%f4
	edge32	%i4,	%o0,	%o3
	fmovrsgez	%i7,	%f12,	%f10
	addc	%l6,	%o4,	%l0
	mova	%xcc,	%i5,	%l1
	subcc	%l3,	%g5,	%i0
	movleu	%xcc,	%o5,	%g7
	popc	0x10CB,	%o7
	fzero	%f30
	movrgez	%i6,	0x170,	%g2
	sth	%o6,	[%l7 + 0x10]
	andcc	%o2,	%l4,	%i3
	andn	%l2,	0x1B8D,	%o1
	edge16	%i2,	%i1,	%l5
	edge16l	%g1,	%g3,	%g6
	subccc	%i4,	%o0,	%g4
	fmovdl	%icc,	%f20,	%f8
	movgu	%xcc,	%i7,	%o3
	mulx	%l6,	%l0,	%o4
	sllx	%l1,	%l3,	%g5
	ldsh	[%l7 + 0x22],	%i0
	srax	%o5,	%g7,	%i5
	fsrc2	%f12,	%f26
	alignaddr	%i6,	%g2,	%o6
	fmovdg	%icc,	%f4,	%f3
	alignaddr	%o2,	%o7,	%i3
	sth	%l2,	[%l7 + 0x16]
	fsrc1	%f16,	%f26
	and	%o1,	0x109A,	%l4
	stx	%i1,	[%l7 + 0x10]
	mulx	%i2,	%l5,	%g1
	movrgez	%g3,	%i4,	%o0
	movleu	%xcc,	%g6,	%i7
	addccc	%g4,	%o3,	%l0
	mulscc	%o4,	0x02DA,	%l1
	smulcc	%l3,	%l6,	%g5
	fmovsge	%icc,	%f25,	%f26
	alignaddr	%o5,	%i0,	%i5
	sdivx	%i6,	0x074B,	%g2
	alignaddrl	%o6,	%o2,	%o7
	fsrc1	%f28,	%f14
	fmovsge	%xcc,	%f7,	%f20
	movre	%g7,	%i3,	%l2
	st	%f23,	[%l7 + 0x60]
	orncc	%l4,	%i1,	%i2
	fpadd16	%f26,	%f18,	%f12
	fmovdvc	%xcc,	%f9,	%f13
	mulscc	%l5,	0x06BC,	%o1
	ldd	[%l7 + 0x68],	%f0
	orcc	%g1,	0x1FC2,	%i4
	movcc	%xcc,	%o0,	%g6
	edge8n	%i7,	%g4,	%g3
	sub	%l0,	%o4,	%l1
	edge32	%o3,	%l6,	%g5
	fcmpgt16	%f28,	%f14,	%o5
	bshuffle	%f14,	%f16,	%f0
	edge16l	%l3,	%i5,	%i6
	for	%f0,	%f10,	%f18
	edge8n	%i0,	%g2,	%o6
	array32	%o2,	%g7,	%i3
	edge8	%l2,	%l4,	%o7
	smul	%i1,	0x103E,	%i2
	subccc	%o1,	0x1F37,	%g1
	fpadd32s	%f3,	%f17,	%f13
	edge32	%i4,	%l5,	%o0
	fone	%f4
	fmuld8ulx16	%f1,	%f11,	%f24
	sub	%g6,	0x052E,	%g4
	umul	%g3,	%i7,	%o4
	edge16ln	%l1,	%l0,	%o3
	subc	%l6,	0x1C79,	%o5
	lduh	[%l7 + 0x74],	%l3
	subcc	%i5,	%i6,	%i0
	edge8	%g2,	%o6,	%o2
	srax	%g7,	%i3,	%l2
	sllx	%g5,	0x07,	%o7
	fmovrdgz	%l4,	%f16,	%f20
	orncc	%i1,	0x06F2,	%o1
	array32	%i2,	%i4,	%g1
	movrne	%l5,	%g6,	%o0
	movleu	%xcc,	%g3,	%i7
	edge16l	%o4,	%g4,	%l1
	xor	%l0,	%l6,	%o3
	edge32n	%o5,	%i5,	%l3
	sra	%i6,	%i0,	%g2
	fmul8x16	%f12,	%f22,	%f28
	nop
	set	0x0E, %l6
	stb	%o2,	[%l7 + %l6]
	umulcc	%g7,	%i3,	%o6
	edge32l	%g5,	%o7,	%l4
	edge16	%i1,	%l2,	%o1
	fcmpgt16	%f0,	%f26,	%i4
	movre	%g1,	0x392,	%i2
	edge8ln	%g6,	%l5,	%o0
	fmovdgu	%xcc,	%f24,	%f24
	andcc	%g3,	%o4,	%g4
	ldub	[%l7 + 0x08],	%i7
	movl	%xcc,	%l1,	%l6
	udivx	%o3,	0x1052,	%o5
	faligndata	%f12,	%f30,	%f22
	subccc	%i5,	0x0DA0,	%l0
	addcc	%l3,	%i0,	%g2
	sethi	0x03FE,	%o2
	ldd	[%l7 + 0x48],	%f4
	movle	%icc,	%g7,	%i6
	fornot2s	%f13,	%f13,	%f8
	edge32ln	%i3,	%o6,	%g5
	stb	%o7,	[%l7 + 0x15]
	stb	%l4,	[%l7 + 0x13]
	udivcc	%l2,	0x01E9,	%o1
	subccc	%i4,	0x0777,	%g1
	orcc	%i1,	0x0028,	%i2
	orn	%l5,	0x0625,	%g6
	xorcc	%o0,	0x15DF,	%g3
	addc	%g4,	0x05A9,	%i7
	smulcc	%o4,	%l6,	%l1
	fmovsne	%icc,	%f25,	%f22
	edge16n	%o3,	%i5,	%l0
	fpsub32	%f2,	%f2,	%f16
	srax	%l3,	%i0,	%o5
	andcc	%g2,	0x0BB4,	%o2
	fandnot2s	%f4,	%f17,	%f28
	srax	%i6,	0x16,	%i3
	fmovdn	%icc,	%f13,	%f16
	movrlz	%g7,	%o6,	%g5
	addccc	%l4,	%o7,	%l2
	fmovsge	%icc,	%f14,	%f21
	mova	%icc,	%i4,	%g1
	sethi	0x0714,	%i1
	ldd	[%l7 + 0x58],	%i2
	xnor	%l5,	0x0F3D,	%o1
	fmovsne	%xcc,	%f11,	%f2
	udivx	%g6,	0x123C,	%o0
	array16	%g3,	%g4,	%o4
	fmuld8sux16	%f30,	%f20,	%f22
	fmovsge	%xcc,	%f11,	%f30
	movcs	%xcc,	%i7,	%l6
	fcmple32	%f20,	%f0,	%l1
	lduh	[%l7 + 0x0C],	%o3
	umul	%l0,	%l3,	%i5
	addcc	%o5,	0x1E42,	%i0
	popc	%g2,	%o2
	sll	%i3,	%i6,	%o6
	array16	%g7,	%l4,	%g5
	xorcc	%l2,	0x1121,	%o7
	sth	%i4,	[%l7 + 0x6E]
	fmovsg	%icc,	%f24,	%f12
	andncc	%i1,	%i2,	%g1
	subc	%l5,	0x0E42,	%g6
	fpack32	%f20,	%f28,	%f24
	stw	%o1,	[%l7 + 0x2C]
	sdivx	%g3,	0x070B,	%g4
	sllx	%o4,	0x1B,	%o0
	fmovrdlz	%l6,	%f20,	%f26
	orn	%l1,	%i7,	%o3
	alignaddr	%l3,	%i5,	%o5
	save %i0, 0x007C, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%icc,	%f18,	%f26
	edge32ln	%l0,	%o2,	%i6
	sethi	0x044F,	%i3
	movrne	%g7,	%l4,	%g5
	and	%o6,	%o7,	%l2
	edge32ln	%i4,	%i2,	%i1
	bshuffle	%f30,	%f14,	%f26
	xorcc	%l5,	0x0C39,	%g6
	edge32n	%g1,	%g3,	%o1
	sdivcc	%g4,	0x083E,	%o4
	popc	%l6,	%l1
	fpadd32	%f28,	%f22,	%f22
	array8	%i7,	%o3,	%o0
	sdivcc	%l3,	0x0ED9,	%i5
	movrlz	%o5,	0x30F,	%i0
	edge8	%l0,	%o2,	%i6
	addc	%g2,	%i3,	%g7
	ldsh	[%l7 + 0x18],	%l4
	subc	%o6,	%o7,	%l2
	and	%g5,	0x1BA0,	%i2
	subc	%i1,	0x0CC1,	%l5
	fmovsge	%xcc,	%f18,	%f24
	movne	%icc,	%i4,	%g6
	xor	%g1,	%o1,	%g3
	srax	%g4,	0x1A,	%l6
	edge16l	%l1,	%i7,	%o3
	alignaddrl	%o4,	%l3,	%i5
	lduh	[%l7 + 0x1C],	%o0
	fmovrslez	%i0,	%f28,	%f23
	movvc	%xcc,	%l0,	%o2
	fands	%f8,	%f24,	%f17
	fmovsne	%xcc,	%f11,	%f24
	movvc	%xcc,	%o5,	%g2
	fmovdn	%xcc,	%f22,	%f1
	movge	%icc,	%i6,	%g7
	andncc	%l4,	%i3,	%o7
	movrgez	%o6,	%l2,	%i2
	array32	%i1,	%l5,	%i4
	umul	%g6,	%g5,	%o1
	mova	%icc,	%g1,	%g4
	std	%f4,	[%l7 + 0x30]
	srax	%l6,	%l1,	%g3
	nop
	set	0x62, %i4
	stb	%i7,	[%l7 + %i4]
	sll	%o3,	0x10,	%o4
	srax	%l3,	0x05,	%i5
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%f18
	fmul8x16au	%f27,	%f18,	%f26
	movvc	%xcc,	%i0,	%o0
	movg	%icc,	%l0,	%o2
	movn	%icc,	%o5,	%i6
	movne	%xcc,	%g2,	%g7
	alignaddr	%i3,	%o7,	%l4
	fornot2	%f2,	%f10,	%f16
	sth	%l2,	[%l7 + 0x1E]
	stx	%i2,	[%l7 + 0x40]
	srax	%i1,	0x08,	%o6
	sll	%l5,	0x13,	%g6
	xnorcc	%i4,	0x07EB,	%o1
	movl	%icc,	%g5,	%g4
	srl	%l6,	%l1,	%g3
	fmovse	%icc,	%f14,	%f19
	bshuffle	%f10,	%f6,	%f26
	edge8ln	%i7,	%o3,	%o4
	and	%g1,	%l3,	%i0
	orcc	%i5,	0x00E4,	%l0
	xorcc	%o0,	0x16BB,	%o2
	movne	%icc,	%o5,	%g2
	movn	%icc,	%g7,	%i6
	sdiv	%i3,	0x0478,	%o7
	movvs	%icc,	%l4,	%l2
	movpos	%xcc,	%i2,	%o6
	fmovsgu	%icc,	%f0,	%f12
	add	%i1,	0x161A,	%l5
	xnor	%i4,	0x1138,	%g6
	mulscc	%o1,	%g5,	%g4
	edge32ln	%l1,	%l6,	%g3
	fmovdg	%icc,	%f27,	%f26
	popc	%o3,	%o4
	fcmpne16	%f8,	%f14,	%i7
	movcs	%xcc,	%g1,	%i0
	ldsh	[%l7 + 0x26],	%i5
	xor	%l0,	0x0C7E,	%o0
	sethi	0x1DAD,	%l3
	umulcc	%o5,	%g2,	%o2
	sra	%g7,	0x1A,	%i3
	fmovsvc	%icc,	%f22,	%f2
	sdivx	%i6,	0x01FA,	%o7
	mulx	%l4,	0x1D8E,	%l2
	umul	%o6,	%i1,	%l5
	move	%xcc,	%i2,	%i4
	add	%o1,	0x0A8A,	%g6
	fmovdle	%icc,	%f9,	%f10
	stb	%g5,	[%l7 + 0x31]
	srax	%l1,	0x1E,	%l6
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	movcs	%xcc,	%i7,	%g1
	sub	%i0,	0x1092,	%g4
	umulcc	%l0,	0x06AA,	%o0
	ldd	[%l7 + 0x50],	%i4
	fmovda	%icc,	%f31,	%f13
	edge8ln	%o5,	%l3,	%o2
	movne	%xcc,	%g7,	%i3
	fabss	%f18,	%f11
	stx	%g2,	[%l7 + 0x58]
	movg	%xcc,	%o7,	%l4
	std	%f0,	[%l7 + 0x58]
	ldub	[%l7 + 0x3D],	%l2
	fmovsn	%xcc,	%f19,	%f0
	fxors	%f19,	%f30,	%f12
	movpos	%xcc,	%o6,	%i6
	srlx	%i1,	%i2,	%i4
	udivx	%l5,	0x0850,	%g6
	sdiv	%o1,	0x1991,	%l1
	udivx	%l6,	0x08B7,	%g5
	ldd	[%l7 + 0x28],	%f0
	edge8n	%o3,	%g3,	%i7
	fand	%f22,	%f16,	%f14
	fabsd	%f20,	%f30
	sir	0x040C
	edge32	%g1,	%o4,	%i0
	orcc	%g4,	%l0,	%o0
	movvs	%xcc,	%i5,	%l3
	movrlz	%o2,	%g7,	%i3
	umul	%g2,	%o7,	%l4
	xorcc	%l2,	%o6,	%o5
	edge16l	%i1,	%i6,	%i2
	std	%f8,	[%l7 + 0x30]
	movrlez	%i4,	0x0A6,	%l5
	fmovrdgez	%o1,	%f8,	%f22
	smul	%g6,	0x0DBB,	%l6
	movg	%xcc,	%g5,	%l1
	sllx	%o3,	%i7,	%g3
	fandnot2s	%f7,	%f15,	%f14
	movge	%icc,	%o4,	%g1
	ld	[%l7 + 0x1C],	%f2
	fcmpne16	%f26,	%f8,	%g4
	restore %l0, %o0, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l3,	%i5,	%g7
	move	%icc,	%o2,	%i3
	nop
	set	0x63, %o3
	ldsb	[%l7 + %o3],	%o7
	edge8l	%l4,	%g2,	%o6
	sth	%l2,	[%l7 + 0x3C]
	sra	%o5,	0x04,	%i6
	nop
	set	0x4A, %o2
	ldsh	[%l7 + %o2],	%i1
	movle	%icc,	%i4,	%l5
	fabss	%f29,	%f6
	umulcc	%o1,	0x1A61,	%g6
	sth	%l6,	[%l7 + 0x44]
	ldub	[%l7 + 0x75],	%g5
	subc	%i2,	%l1,	%o3
	fmuld8ulx16	%f16,	%f21,	%f18
	and	%i7,	%o4,	%g1
	orncc	%g4,	0x04DD,	%g3
	lduw	[%l7 + 0x18],	%o0
	fmovsl	%xcc,	%f6,	%f12
	move	%icc,	%l0,	%l3
	fcmpeq16	%f26,	%f24,	%i5
	stw	%g7,	[%l7 + 0x34]
	movcs	%icc,	%i0,	%o2
	nop
	set	0x2C, %i6
	stb	%i3,	[%l7 + %i6]
	srax	%l4,	%g2,	%o6
	fmuld8ulx16	%f27,	%f2,	%f18
	movl	%xcc,	%l2,	%o5
	andncc	%i6,	%i1,	%o7
	orn	%l5,	0x0CB0,	%o1
	sra	%i4,	%l6,	%g6
	array32	%g5,	%i2,	%l1
	fmovsge	%xcc,	%f11,	%f31
	movvc	%xcc,	%o3,	%i7
	edge16ln	%g1,	%g4,	%g3
	xnorcc	%o4,	0x18F7,	%o0
	fcmpes	%fcc0,	%f28,	%f15
	edge32n	%l3,	%l0,	%g7
	movle	%icc,	%i5,	%o2
	ldsw	[%l7 + 0x70],	%i3
	edge8n	%i0,	%l4,	%o6
	movcc	%xcc,	%l2,	%o5
	stb	%g2,	[%l7 + 0x5D]
	popc	0x12B2,	%i1
	ldx	[%l7 + 0x28],	%i6
	fpadd16	%f22,	%f8,	%f18
	edge32n	%o7,	%l5,	%i4
	sdiv	%o1,	0x1FBD,	%g6
	ld	[%l7 + 0x7C],	%f24
	movvc	%xcc,	%g5,	%l6
	smul	%i2,	%o3,	%l1
	movvc	%xcc,	%g1,	%g4
	andcc	%i7,	0x07B9,	%g3
	orn	%o0,	%l3,	%l0
	stb	%g7,	[%l7 + 0x7A]
	ldsh	[%l7 + 0x52],	%i5
	srax	%o2,	%i3,	%o4
	fmovdl	%xcc,	%f19,	%f2
	andn	%i0,	0x1CBC,	%o6
	edge16ln	%l4,	%l2,	%g2
	movrlez	%o5,	0x0BB,	%i1
	edge16l	%o7,	%i6,	%l5
	stb	%o1,	[%l7 + 0x51]
	alignaddr	%g6,	%i4,	%g5
	subc	%l6,	0x12C3,	%o3
	smul	%i2,	0x0B4A,	%l1
	st	%f4,	[%l7 + 0x50]
	udivcc	%g1,	0x18D7,	%i7
	umulcc	%g4,	%o0,	%g3
	xnorcc	%l0,	%l3,	%i5
	fornot1s	%f23,	%f24,	%f10
	sth	%o2,	[%l7 + 0x1A]
	movgu	%xcc,	%i3,	%g7
	movrgez	%i0,	%o6,	%l4
	faligndata	%f20,	%f18,	%f30
	andn	%l2,	%g2,	%o5
	edge8	%i1,	%o4,	%o7
	edge8n	%l5,	%o1,	%i6
	movre	%g6,	%g5,	%i4
	movn	%icc,	%l6,	%i2
	movleu	%xcc,	%o3,	%l1
	ldsb	[%l7 + 0x12],	%i7
	ld	[%l7 + 0x5C],	%f28
	nop
	set	0x3C, %l5
	lduh	[%l7 + %l5],	%g1
	edge32l	%o0,	%g4,	%g3
	fmovsvc	%icc,	%f6,	%f2
	smul	%l3,	0x1C07,	%i5
	fsrc2s	%f8,	%f16
	edge32ln	%o2,	%l0,	%g7
	popc	0x09C1,	%i3
	stw	%o6,	[%l7 + 0x68]
	array8	%i0,	%l2,	%g2
	movcs	%xcc,	%o5,	%i1
	sir	0x1770
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	umulcc	%o7,	%o1,	%i6
	srlx	%g5,	%g6,	%l6
	fmul8ulx16	%f12,	%f10,	%f10
	edge32n	%i4,	%i2,	%l1
	edge16ln	%i7,	%g1,	%o0
	movn	%icc,	%g4,	%g3
	fcmpes	%fcc2,	%f16,	%f14
	xnorcc	%l3,	0x0E9B,	%o3
	mulx	%i5,	%l0,	%g7
	movgu	%icc,	%o2,	%o6
	subcc	%i0,	0x10DB,	%i3
	edge32n	%l2,	%g2,	%o5
	umulcc	%o4,	0x0E4F,	%l4
	movrgez	%i1,	0x0B4,	%l5
	st	%f25,	[%l7 + 0x14]
	alignaddr	%o7,	%o1,	%i6
	ldd	[%l7 + 0x08],	%g4
	ldsh	[%l7 + 0x3A],	%l6
	fnor	%f26,	%f30,	%f20
	movl	%icc,	%g6,	%i4
	fmovdleu	%icc,	%f12,	%f15
	array16	%l1,	%i2,	%i7
	array16	%g1,	%o0,	%g3
	sth	%g4,	[%l7 + 0x6E]
	edge16l	%o3,	%l3,	%i5
	sdivcc	%l0,	0x0D81,	%o2
	stb	%g7,	[%l7 + 0x54]
	lduw	[%l7 + 0x2C],	%o6
	movrlez	%i0,	0x3AB,	%l2
	fones	%f29
	sdiv	%g2,	0x0F04,	%o5
	edge32l	%i3,	%o4,	%l4
	movge	%icc,	%i1,	%l5
	sethi	0x18B3,	%o1
	movg	%icc,	%o7,	%g5
	movge	%icc,	%i6,	%l6
	sllx	%g6,	0x13,	%i4
	edge16l	%i2,	%i7,	%g1
	movcs	%xcc,	%o0,	%l1
	xnor	%g4,	0x14FB,	%o3
	movrlez	%l3,	%g3,	%l0
	xnorcc	%i5,	0x00F6,	%o2
	movl	%icc,	%o6,	%i0
	st	%f9,	[%l7 + 0x3C]
	ldsb	[%l7 + 0x43],	%g7
	orncc	%g2,	%l2,	%o5
	udivcc	%i3,	0x0624,	%l4
	and	%i1,	0x125D,	%o4
	edge32ln	%l5,	%o1,	%o7
	fmuld8ulx16	%f19,	%f15,	%f28
	move	%xcc,	%g5,	%i6
	edge8	%l6,	%g6,	%i4
	movpos	%icc,	%i2,	%g1
	fornot2s	%f21,	%f9,	%f19
	edge32ln	%o0,	%i7,	%g4
	sub	%o3,	0x10A6,	%l1
	edge16	%g3,	%l3,	%l0
	movrgz	%o2,	%o6,	%i5
	lduw	[%l7 + 0x4C],	%i0
	fmovsl	%icc,	%f3,	%f0
	fpadd32	%f8,	%f26,	%f30
	subc	%g2,	%l2,	%g7
	movne	%icc,	%i3,	%o5
	movpos	%xcc,	%i1,	%o4
	fpsub16s	%f23,	%f22,	%f27
	andn	%l4,	%l5,	%o1
	movvs	%icc,	%o7,	%g5
	movvc	%icc,	%i6,	%g6
	fmovrdgz	%i4,	%f20,	%f14
	movle	%xcc,	%i2,	%l6
	subcc	%g1,	%i7,	%g4
	movcc	%xcc,	%o3,	%o0
	subc	%g3,	%l3,	%l0
	movrlez	%o2,	%l1,	%i5
	fandnot1	%f12,	%f14,	%f28
	and	%i0,	%o6,	%g2
	xorcc	%l2,	%i3,	%o5
	movleu	%icc,	%i1,	%g7
	edge16n	%l4,	%l5,	%o1
	movneg	%icc,	%o7,	%o4
	movrlz	%i6,	%g6,	%i4
	movre	%i2,	%g5,	%l6
	fand	%f18,	%f6,	%f18
	xnor	%g1,	%g4,	%o3
	addcc	%o0,	%i7,	%g3
	array8	%l0,	%l3,	%l1
	smul	%o2,	0x0B8D,	%i0
	movcs	%icc,	%o6,	%i5
	fsrc1s	%f30,	%f11
	ldx	[%l7 + 0x40],	%l2
	edge8ln	%g2,	%o5,	%i1
	alignaddrl	%g7,	%i3,	%l4
	sllx	%o1,	0x09,	%o7
	movl	%icc,	%l5,	%i6
	bshuffle	%f16,	%f28,	%f6
	movl	%xcc,	%o4,	%g6
	fmovrslz	%i2,	%f20,	%f14
	array32	%g5,	%l6,	%i4
	sethi	0x0B48,	%g1
	addccc	%g4,	0x15C0,	%o3
	orncc	%i7,	0x0926,	%o0
	xnor	%g3,	%l0,	%l3
	movle	%xcc,	%o2,	%i0
	fmovdg	%xcc,	%f11,	%f16
	sdiv	%o6,	0x1765,	%i5
	stx	%l2,	[%l7 + 0x20]
	ldsb	[%l7 + 0x2B],	%g2
	orncc	%o5,	%l1,	%i1
	edge32ln	%i3,	%g7,	%o1
	sra	%o7,	%l4,	%l5
	udiv	%o4,	0x0125,	%i6
	pdist	%f16,	%f6,	%f0
	umul	%g6,	%i2,	%g5
	edge8n	%l6,	%i4,	%g1
	edge32	%o3,	%i7,	%o0
	fornot1	%f0,	%f30,	%f8
	xor	%g3,	%l0,	%l3
	sth	%o2,	[%l7 + 0x2C]
	udivcc	%g4,	0x17A0,	%o6
	edge16ln	%i5,	%l2,	%g2
	stw	%i0,	[%l7 + 0x5C]
	movrlez	%o5,	0x1B2,	%l1
	alignaddrl	%i3,	%i1,	%g7
	fornot1	%f10,	%f22,	%f28
	udivx	%o1,	0x03FC,	%o7
	andcc	%l4,	0x1557,	%o4
	ld	[%l7 + 0x44],	%f28
	fandnot2	%f6,	%f4,	%f28
	srax	%l5,	%i6,	%g6
	xnor	%i2,	%g5,	%i4
	stb	%g1,	[%l7 + 0x19]
	sll	%o3,	0x18,	%i7
	srl	%l6,	0x1B,	%g3
	save %l0, 0x0138, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o2,	%g4,	%o6
	fpsub32	%f20,	%f2,	%f28
	ld	[%l7 + 0x5C],	%f20
	sll	%i5,	0x0D,	%l3
	sdiv	%g2,	0x09EC,	%l2
	for	%f0,	%f16,	%f16
	ldsw	[%l7 + 0x14],	%o5
	subcc	%l1,	0x123B,	%i0
	edge8	%i1,	%i3,	%g7
	subcc	%o7,	%o1,	%o4
	or	%l5,	%l4,	%i6
	andcc	%g6,	%g5,	%i2
	ldsb	[%l7 + 0x19],	%i4
	movn	%icc,	%g1,	%i7
	edge8ln	%o3,	%l6,	%l0
	movrgz	%o0,	%g3,	%g4
	xnorcc	%o6,	%i5,	%l3
	fmovde	%icc,	%f12,	%f14
	addc	%o2,	0x0251,	%l2
	movg	%xcc,	%g2,	%o5
	xnor	%l1,	%i0,	%i1
	fmovrse	%i3,	%f30,	%f2
	udivx	%o7,	0x067A,	%o1
	umul	%g7,	%l5,	%o4
	mulscc	%i6,	%l4,	%g5
	save %g6, %i4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i7,	%o3,	%l6
	subcc	%g1,	0x1F17,	%o0
	movge	%icc,	%l0,	%g3
	fpadd16s	%f16,	%f31,	%f4
	fandnot1s	%f11,	%f20,	%f23
	alignaddrl	%g4,	%i5,	%o6
	xor	%o2,	0x1144,	%l3
	add	%g2,	0x0E19,	%o5
	fmovda	%xcc,	%f11,	%f13
	udivx	%l2,	0x1D8C,	%l1
	popc	0x1146,	%i0
	movge	%xcc,	%i3,	%i1
	addccc	%o1,	0x1FBD,	%g7
	lduw	[%l7 + 0x50],	%l5
	ldsb	[%l7 + 0x2F],	%o4
	xor	%i6,	0x0987,	%l4
	fmovsgu	%icc,	%f30,	%f28
	addc	%g5,	%o7,	%g6
	movre	%i2,	0x263,	%i4
	sdivx	%o3,	0x1CD0,	%i7
	udiv	%g1,	0x035B,	%o0
	movle	%xcc,	%l0,	%l6
	edge16	%g4,	%g3,	%i5
	andcc	%o6,	0x0A56,	%o2
	sir	0x18F4
	movgu	%xcc,	%g2,	%o5
	movvs	%xcc,	%l3,	%l1
	ldd	[%l7 + 0x40],	%f14
	or	%l2,	%i3,	%i0
	movcs	%xcc,	%i1,	%o1
	ldx	[%l7 + 0x08],	%g7
	movrlez	%l5,	0x090,	%o4
	stx	%i6,	[%l7 + 0x18]
	fcmped	%fcc2,	%f28,	%f4
	fmul8sux16	%f30,	%f16,	%f8
	sll	%l4,	0x0F,	%o7
	sll	%g5,	%i2,	%g6
	movpos	%icc,	%i4,	%i7
	edge8	%g1,	%o0,	%o3
	fabss	%f2,	%f4
	mova	%xcc,	%l6,	%l0
	alignaddrl	%g3,	%g4,	%i5
	movrne	%o6,	0x0C3,	%o2
	fxors	%f9,	%f22,	%f29
	sir	0x0471
	fmovse	%icc,	%f11,	%f26
	fmovscc	%xcc,	%f10,	%f31
	edge32	%o5,	%l3,	%g2
	orncc	%l1,	%l2,	%i0
	movle	%xcc,	%i3,	%o1
	mova	%xcc,	%i1,	%l5
	orncc	%g7,	%i6,	%o4
	movvs	%icc,	%o7,	%l4
	movneg	%xcc,	%i2,	%g5
	lduh	[%l7 + 0x5E],	%i4
	mulx	%g6,	%i7,	%o0
	movgu	%xcc,	%g1,	%o3
	movrlez	%l0,	0x09D,	%g3
	movn	%icc,	%l6,	%i5
	smul	%g4,	%o2,	%o6
	orn	%o5,	0x1F2E,	%g2
	udivcc	%l3,	0x0E82,	%l2
	or	%i0,	0x17AC,	%i3
	ldub	[%l7 + 0x18],	%l1
	fmovsleu	%xcc,	%f9,	%f23
	mulx	%i1,	0x1797,	%l5
	srax	%g7,	%o1,	%o4
	fnands	%f1,	%f18,	%f11
	restore %i6, 0x0FF1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i2,	0x027E,	%g5
	udivcc	%i4,	0x0E86,	%g6
	edge16	%o7,	%o0,	%g1
	movrgz	%o3,	0x352,	%l0
	fmovdvs	%icc,	%f11,	%f12
	fmovrdne	%g3,	%f10,	%f16
	movrgez	%i7,	%l6,	%g4
	mova	%xcc,	%o2,	%o6
	edge16l	%o5,	%i5,	%l3
	orn	%g2,	%i0,	%i3
	movne	%xcc,	%l1,	%l2
	orcc	%i1,	0x0FD1,	%l5
	edge8	%g7,	%o4,	%i6
	ldsh	[%l7 + 0x42],	%l4
	fmovsle	%xcc,	%f3,	%f30
	lduw	[%l7 + 0x08],	%i2
	edge8ln	%g5,	%o1,	%i4
	srl	%o7,	%o0,	%g1
	fnot1s	%f1,	%f31
	fmovsn	%icc,	%f13,	%f18
	subcc	%g6,	%l0,	%g3
	ld	[%l7 + 0x1C],	%f24
	edge32	%i7,	%o3,	%g4
	sub	%o2,	%l6,	%o5
	fnors	%f20,	%f18,	%f14
	udivcc	%o6,	0x0612,	%l3
	umul	%g2,	%i0,	%i5
	fpsub16s	%f22,	%f8,	%f8
	edge32	%i3,	%l2,	%i1
	fmovsa	%xcc,	%f28,	%f6
	movcs	%icc,	%l5,	%g7
	movcs	%icc,	%o4,	%l1
	bshuffle	%f26,	%f10,	%f6
	and	%l4,	0x14A1,	%i2
	edge8ln	%i6,	%o1,	%g5
	udivcc	%o7,	0x1702,	%i4
	edge16n	%o0,	%g1,	%g6
	edge32	%g3,	%i7,	%o3
	smul	%g4,	0x10F4,	%o2
	edge16ln	%l6,	%l0,	%o6
	andncc	%l3,	%o5,	%g2
	fors	%f2,	%f27,	%f8
	subccc	%i0,	0x0F72,	%i3
	stx	%i5,	[%l7 + 0x30]
	save %i1, %l2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%o4,	%f26,	%f4
	movge	%xcc,	%l1,	%l4
	movl	%xcc,	%i2,	%l5
	edge16	%i6,	%g5,	%o7
	udivcc	%i4,	0x13E0,	%o0
	fmovdcc	%icc,	%f27,	%f1
	edge32l	%o1,	%g6,	%g3
	fmul8x16au	%f7,	%f22,	%f20
	ldub	[%l7 + 0x6B],	%i7
	udivx	%g1,	0x1075,	%g4
	addccc	%o3,	%l6,	%l0
	fmovrslez	%o2,	%f24,	%f22
	sub	%o6,	%l3,	%o5
	fpsub32	%f16,	%f2,	%f8
	fmovdpos	%xcc,	%f30,	%f6
	and	%g2,	0x03C4,	%i3
	movge	%icc,	%i5,	%i0
	smul	%l2,	0x1CCA,	%g7
	fcmped	%fcc0,	%f20,	%f26
	movre	%o4,	0x389,	%l1
	movrgez	%i1,	%i2,	%l5
	addccc	%i6,	0x1894,	%l4
	fmovdcs	%icc,	%f12,	%f12
	array8	%o7,	%i4,	%o0
	edge32	%o1,	%g5,	%g3
	st	%f3,	[%l7 + 0x64]
	fmovdleu	%xcc,	%f27,	%f25
	sub	%i7,	%g1,	%g4
	move	%icc,	%g6,	%o3
	fcmpeq32	%f24,	%f24,	%l0
	edge16l	%l6,	%o2,	%l3
	fexpand	%f22,	%f22
	and	%o5,	0x0EEE,	%g2
	movge	%xcc,	%i3,	%i5
	fmovdn	%xcc,	%f21,	%f19
	movle	%icc,	%i0,	%l2
	ldsw	[%l7 + 0x50],	%o6
	fone	%f16
	addc	%g7,	0x0539,	%o4
	movge	%xcc,	%l1,	%i1
	fmovsa	%xcc,	%f17,	%f26
	fmovrslez	%i2,	%f31,	%f18
	xnor	%l5,	%l4,	%o7
	orcc	%i6,	%o0,	%o1
	save %g5, 0x159E, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g3,	%i7
	fmovsl	%xcc,	%f19,	%f21
	xorcc	%g1,	0x1FDC,	%g6
	std	%f10,	[%l7 + 0x08]
	smulcc	%o3,	%l0,	%g4
	ldd	[%l7 + 0x30],	%f28
	addcc	%l6,	%o2,	%l3
	array32	%g2,	%o5,	%i3
	ldub	[%l7 + 0x1E],	%i0
	save %i5, 0x1CD5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x54],	%l2
	edge32n	%o4,	%g7,	%l1
	sllx	%i1,	0x19,	%i2
	ldub	[%l7 + 0x60],	%l5
	movpos	%icc,	%l4,	%o7
	stw	%i6,	[%l7 + 0x08]
	fpadd32	%f4,	%f26,	%f4
	fandnot1	%f6,	%f14,	%f2
	alignaddr	%o1,	%g5,	%o0
	xorcc	%i4,	%g3,	%i7
	fmovscc	%icc,	%f22,	%f30
	edge16l	%g6,	%o3,	%g1
	xorcc	%l0,	%l6,	%o2
	smul	%l3,	0x06A4,	%g4
	fmovsge	%icc,	%f13,	%f31
	mulx	%g2,	%o5,	%i0
	sdivx	%i5,	0x1904,	%i3
	fmovdcc	%xcc,	%f19,	%f21
	addccc	%o6,	%o4,	%l2
	edge32ln	%l1,	%i1,	%i2
	movre	%g7,	0x3E7,	%l4
	umul	%o7,	0x1C67,	%i6
	orcc	%o1,	%l5,	%g5
	xnor	%i4,	0x1EED,	%g3
	fmovdleu	%icc,	%f7,	%f7
	smul	%i7,	%o0,	%g6
	srlx	%o3,	0x10,	%l0
	ldub	[%l7 + 0x7C],	%g1
	umulcc	%l6,	0x0C0F,	%l3
	movle	%icc,	%o2,	%g4
	movgu	%icc,	%g2,	%o5
	movpos	%icc,	%i5,	%i3
	nop
	set	0x14, %g3
	ldsw	[%l7 + %g3],	%i0
	fmovdg	%xcc,	%f26,	%f25
	andn	%o6,	%o4,	%l1
	sub	%l2,	0x0BAD,	%i2
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%i0
	ldsb	[%l7 + 0x08],	%g7
	edge16l	%o7,	%l4,	%o1
	edge32n	%l5,	%i6,	%g5
	fmovdne	%xcc,	%f14,	%f31
	fmovrdgez	%g3,	%f22,	%f12
	udivx	%i7,	0x1D91,	%o0
	addcc	%i4,	%o3,	%l0
	edge8ln	%g6,	%g1,	%l3
	andcc	%o2,	0x059D,	%l6
	smulcc	%g4,	0x0CDE,	%g2
	edge8ln	%o5,	%i5,	%i0
	sllx	%i3,	0x19,	%o4
	or	%l1,	0x0646,	%l2
	fmovsn	%icc,	%f5,	%f3
	or	%i2,	0x1A0B,	%i1
	stw	%g7,	[%l7 + 0x2C]
	movre	%o7,	0x31D,	%l4
	fxors	%f26,	%f27,	%f18
	movge	%xcc,	%o1,	%l5
	andncc	%i6,	%g5,	%g3
	save %o6, 0x1EE2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o0,	[%l7 + 0x14]
	edge8n	%o3,	%i4,	%g6
	srlx	%g1,	%l0,	%l3
	edge32	%l6,	%g4,	%o2
	ldsw	[%l7 + 0x6C],	%g2
	stw	%o5,	[%l7 + 0x28]
	sth	%i0,	[%l7 + 0x3C]
	udiv	%i5,	0x1D93,	%i3
	sub	%o4,	%l2,	%i2
	edge32	%l1,	%i1,	%g7
	edge16n	%l4,	%o7,	%l5
	stb	%o1,	[%l7 + 0x49]
	or	%g5,	0x0819,	%i6
	edge16	%g3,	%o6,	%o0
	stb	%o3,	[%l7 + 0x20]
	std	%f30,	[%l7 + 0x58]
	fabsd	%f14,	%f10
	fmovrslez	%i7,	%f20,	%f13
	srlx	%g6,	0x09,	%i4
	orn	%l0,	0x1ECB,	%l3
	edge32n	%l6,	%g4,	%g1
	st	%f3,	[%l7 + 0x10]
	fcmped	%fcc2,	%f30,	%f8
	movcc	%icc,	%g2,	%o2
	alignaddr	%i0,	%o5,	%i5
	ldd	[%l7 + 0x10],	%i2
	fpack16	%f8,	%f25
	std	%f20,	[%l7 + 0x18]
	andcc	%l2,	%o4,	%l1
	lduh	[%l7 + 0x78],	%i2
	fmovrsne	%g7,	%f9,	%f10
	edge32	%l4,	%i1,	%o7
	nop
	set	0x38, %l4
	std	%f28,	[%l7 + %l4]
	st	%f31,	[%l7 + 0x44]
	sub	%l5,	%g5,	%i6
	siam	0x7
	movre	%g3,	%o1,	%o0
	edge32ln	%o3,	%o6,	%g6
	or	%i4,	%i7,	%l3
	addcc	%l0,	%g4,	%l6
	stx	%g1,	[%l7 + 0x08]
	fmovd	%f8,	%f30
	movn	%xcc,	%o2,	%i0
	ldub	[%l7 + 0x0B],	%o5
	ldx	[%l7 + 0x70],	%g2
	srl	%i3,	%l2,	%i5
	movrgez	%o4,	0x2D8,	%l1
	srlx	%i2,	%l4,	%g7
	std	%f16,	[%l7 + 0x50]
	fxor	%f10,	%f20,	%f4
	orcc	%i1,	%o7,	%g5
	fmovsneg	%icc,	%f19,	%f22
	sth	%i6,	[%l7 + 0x78]
	movvs	%icc,	%l5,	%g3
	stx	%o0,	[%l7 + 0x20]
	fmovrde	%o3,	%f30,	%f24
	xor	%o1,	0x10DE,	%g6
	udivcc	%i4,	0x0328,	%i7
	ld	[%l7 + 0x70],	%f3
	sra	%l3,	%l0,	%o6
	or	%l6,	%g4,	%g1
	fxors	%f8,	%f3,	%f30
	srlx	%o2,	0x10,	%i0
	edge32n	%g2,	%o5,	%l2
	movrlez	%i5,	%o4,	%i3
	edge8	%l1,	%l4,	%i2
	orn	%g7,	0x005C,	%o7
	edge8n	%i1,	%g5,	%l5
	ldsw	[%l7 + 0x34],	%g3
	ld	[%l7 + 0x3C],	%f0
	orncc	%i6,	0x1F1D,	%o3
	array32	%o0,	%g6,	%i4
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	ldub	[%l7 + 0x7E],	%i7
	or	%l6,	0x13FB,	%g4
	udivx	%g1,	0x0034,	%o6
	andcc	%o2,	0x1DA4,	%g2
	movl	%xcc,	%o5,	%i0
	fmovdge	%icc,	%f24,	%f14
	alignaddr	%l2,	%i5,	%o4
	nop
	set	0x60, %o4
	stx	%l1,	[%l7 + %o4]
	edge8ln	%l4,	%i3,	%g7
	edge16ln	%o7,	%i1,	%i2
	subcc	%g5,	0x19B6,	%g3
	ldsw	[%l7 + 0x30],	%i6
	bshuffle	%f28,	%f28,	%f18
	nop
	set	0x73, %l3
	ldsb	[%l7 + %l3],	%l5
	udiv	%o0,	0x048A,	%g6
	fmovsleu	%icc,	%f20,	%f10
	fmovdne	%icc,	%f6,	%f21
	edge32ln	%i4,	%o3,	%l3
	array8	%l0,	%i7,	%l6
	movvc	%xcc,	%g4,	%o1
	fmovrse	%g1,	%f5,	%f6
	stw	%o2,	[%l7 + 0x10]
	movl	%icc,	%o6,	%g2
	orncc	%o5,	0x04B1,	%l2
	srlx	%i0,	0x1C,	%i5
	fmul8ulx16	%f12,	%f14,	%f18
	alignaddr	%o4,	%l4,	%l1
	ldx	[%l7 + 0x10],	%i3
	movcs	%xcc,	%g7,	%o7
	fmovscs	%icc,	%f26,	%f28
	mulscc	%i2,	%i1,	%g5
	fandnot1	%f18,	%f28,	%f6
	fornot1	%f20,	%f22,	%f26
	mulscc	%i6,	0x139B,	%g3
	fmovrdlz	%o0,	%f12,	%f28
	stw	%g6,	[%l7 + 0x10]
	edge8l	%i4,	%l5,	%o3
	ldub	[%l7 + 0x5C],	%l3
	umulcc	%i7,	0x0B11,	%l0
	edge32ln	%l6,	%g4,	%g1
	udiv	%o1,	0x0EB6,	%o2
	ldx	[%l7 + 0x40],	%o6
	fcmpne32	%f4,	%f10,	%o5
	st	%f11,	[%l7 + 0x0C]
	nop
	set	0x60, %i0
	stx	%l2,	[%l7 + %i0]
	fnor	%f30,	%f4,	%f20
	udivx	%i0,	0x088F,	%i5
	fmul8sux16	%f6,	%f2,	%f22
	ldsw	[%l7 + 0x58],	%g2
	fcmple32	%f16,	%f26,	%o4
	sdivx	%l4,	0x15E8,	%l1
	smul	%g7,	%o7,	%i2
	andncc	%i3,	%g5,	%i1
	movpos	%xcc,	%g3,	%o0
	movgu	%xcc,	%g6,	%i6
	movcs	%icc,	%l5,	%o3
	movn	%xcc,	%l3,	%i4
	array8	%i7,	%l0,	%g4
	movrne	%g1,	%o1,	%o2
	ld	[%l7 + 0x74],	%f29
	fpsub16	%f26,	%f18,	%f20
	movrlz	%o6,	%o5,	%l6
	xnor	%i0,	%i5,	%g2
	ld	[%l7 + 0x10],	%f0
	xor	%l2,	%o4,	%l1
	edge8ln	%l4,	%g7,	%i2
	sdivcc	%o7,	0x0571,	%g5
	xnor	%i3,	%g3,	%o0
	fzeros	%f5
	edge16n	%g6,	%i1,	%i6
	edge8ln	%l5,	%l3,	%o3
	smulcc	%i4,	%l0,	%g4
	bshuffle	%f14,	%f14,	%f26
	stx	%i7,	[%l7 + 0x08]
	edge32n	%g1,	%o1,	%o2
	edge16n	%o5,	%l6,	%i0
	stb	%o6,	[%l7 + 0x45]
	popc	%i5,	%l2
	movrgez	%g2,	%o4,	%l4
	movneg	%xcc,	%g7,	%i2
	edge16n	%o7,	%l1,	%g5
	srl	%g3,	%i3,	%o0
	fnands	%f24,	%f4,	%f2
	movne	%xcc,	%g6,	%i1
	andcc	%i6,	%l3,	%o3
	fabsd	%f4,	%f24
	subc	%l5,	%i4,	%g4
	fmovspos	%icc,	%f0,	%f1
	ldub	[%l7 + 0x36],	%l0
	add	%i7,	0x1350,	%g1
	sub	%o2,	%o5,	%o1
	edge32	%l6,	%i0,	%o6
	ld	[%l7 + 0x44],	%f28
	movge	%xcc,	%i5,	%l2
	fpackfix	%f8,	%f31
	andn	%o4,	%l4,	%g7
	smulcc	%g2,	0x0665,	%o7
	movcs	%xcc,	%i2,	%g5
	fpadd32s	%f14,	%f3,	%f24
	fmovrsne	%g3,	%f21,	%f0
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%i3
	sll	%l1,	0x1C,	%o0
	orcc	%g6,	%i6,	%l3
	movg	%xcc,	%i1,	%l5
	fornot1s	%f21,	%f10,	%f1
	lduh	[%l7 + 0x60],	%o3
	sdivcc	%g4,	0x03F4,	%l0
	movn	%icc,	%i4,	%g1
	addc	%o2,	%i7,	%o1
	sra	%l6,	0x0E,	%o5
	movpos	%xcc,	%o6,	%i0
	ldd	[%l7 + 0x18],	%f2
	mova	%icc,	%l2,	%o4
	movvs	%xcc,	%l4,	%i5
	fmovsvs	%xcc,	%f26,	%f12
	andcc	%g2,	%g7,	%o7
	movge	%xcc,	%g5,	%g3
	fcmpne32	%f8,	%f6,	%i3
	edge16l	%i2,	%l1,	%g6
	popc	%o0,	%i6
	andn	%i1,	0x041C,	%l3
	add	%o3,	0x1F9F,	%g4
	orncc	%l5,	%l0,	%g1
	st	%f20,	[%l7 + 0x54]
	fmovrde	%i4,	%f22,	%f12
	fornot2s	%f1,	%f2,	%f25
	movle	%icc,	%o2,	%i7
	movre	%o1,	0x033,	%o5
	smul	%o6,	%i0,	%l6
	fsrc2	%f12,	%f20
	movrne	%o4,	%l2,	%i5
	subc	%l4,	%g2,	%g7
	movrlez	%o7,	%g5,	%i3
	sdivcc	%g3,	0x0064,	%l1
	or	%g6,	0x179B,	%i2
	ldx	[%l7 + 0x08],	%o0
	array32	%i6,	%l3,	%i1
	subcc	%o3,	0x1FE8,	%g4
	std	%f30,	[%l7 + 0x08]
	array8	%l0,	%g1,	%l5
	subcc	%i4,	0x0C6A,	%o2
	movrgez	%o1,	0x23F,	%i7
	fnot1	%f28,	%f6
	ldub	[%l7 + 0x4A],	%o5
	xnor	%i0,	%o6,	%l6
	sdivcc	%l2,	0x1950,	%o4
	array8	%l4,	%i5,	%g2
	fmovscs	%xcc,	%f2,	%f9
	or	%o7,	0x049C,	%g7
	orcc	%g5,	0x1A3F,	%i3
	movge	%xcc,	%l1,	%g3
	sdivcc	%g6,	0x0DFE,	%i2
	save %o0, 0x196B, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i1,	0x14AE,	%i6
	alignaddr	%g4,	%o3,	%g1
	movpos	%icc,	%l0,	%i4
	mova	%icc,	%l5,	%o1
	movcs	%xcc,	%o2,	%o5
	movcc	%icc,	%i0,	%o6
	fsrc2	%f20,	%f8
	fandnot1s	%f18,	%f7,	%f20
	sll	%l6,	0x0A,	%l2
	udivx	%i7,	0x0A99,	%l4
	fmovscc	%xcc,	%f10,	%f24
	edge8n	%i5,	%o4,	%o7
	movrgez	%g2,	%g5,	%i3
	sll	%l1,	%g3,	%g6
	addc	%i2,	0x07C0,	%g7
	edge32n	%l3,	%i1,	%o0
	movrlez	%g4,	0x3D6,	%i6
	movrlez	%o3,	%l0,	%i4
	and	%g1,	0x194F,	%o1
	sllx	%l5,	0x0E,	%o2
	fmul8sux16	%f30,	%f22,	%f24
	fmovsg	%icc,	%f5,	%f0
	movge	%icc,	%o5,	%i0
	or	%o6,	%l6,	%l2
	movne	%icc,	%i7,	%i5
	xorcc	%o4,	%o7,	%l4
	movcc	%icc,	%g2,	%g5
	alignaddrl	%i3,	%l1,	%g3
	fcmps	%fcc1,	%f17,	%f27
	sdivcc	%i2,	0x1831,	%g7
	umulcc	%l3,	0x0E2A,	%i1
	xorcc	%o0,	%g6,	%i6
	sir	0x04EC
	fmul8x16au	%f14,	%f30,	%f24
	ldd	[%l7 + 0x38],	%o2
	fsrc2	%f30,	%f12
	xor	%g4,	%l0,	%g1
	lduh	[%l7 + 0x4A],	%i4
	stx	%o1,	[%l7 + 0x68]
	andcc	%o2,	%o5,	%i0
	fcmpgt32	%f16,	%f8,	%l5
	std	%f30,	[%l7 + 0x50]
	udivcc	%o6,	0x1B90,	%l2
	addcc	%l6,	0x1585,	%i5
	srlx	%i7,	0x05,	%o7
	xnorcc	%l4,	%g2,	%g5
	alignaddrl	%i3,	%l1,	%g3
	fcmpd	%fcc2,	%f8,	%f22
	andncc	%i2,	%o4,	%g7
	st	%f6,	[%l7 + 0x24]
	for	%f8,	%f28,	%f14
	xor	%i1,	0x0BA2,	%o0
	fcmpgt16	%f16,	%f14,	%l3
	addcc	%g6,	0x1CD8,	%i6
	movre	%g4,	%l0,	%o3
	fpack16	%f26,	%f5
	edge32ln	%g1,	%o1,	%o2
	sdivcc	%o5,	0x05A6,	%i4
	fmovdleu	%xcc,	%f8,	%f12
	std	%f24,	[%l7 + 0x10]
	movcc	%icc,	%l5,	%i0
	udivx	%l2,	0x1FC6,	%l6
	ldsb	[%l7 + 0x3A],	%i5
	fcmpne16	%f18,	%f30,	%i7
	umulcc	%o7,	%o6,	%l4
	movle	%xcc,	%g5,	%g2
	subccc	%l1,	0x051A,	%i3
	udiv	%g3,	0x029B,	%o4
	ld	[%l7 + 0x50],	%f7
	addc	%g7,	%i2,	%i1
	udiv	%o0,	0x01E7,	%l3
	edge8ln	%g6,	%g4,	%l0
	edge8	%i6,	%o3,	%o1
	edge8	%o2,	%g1,	%o5
	fpadd32s	%f21,	%f6,	%f7
	sra	%l5,	%i0,	%l2
	lduw	[%l7 + 0x34],	%l6
	edge32	%i5,	%i7,	%o7
	mulscc	%o6,	%l4,	%g5
	edge16l	%g2,	%i4,	%i3
	edge32	%g3,	%o4,	%l1
	stx	%i2,	[%l7 + 0x70]
	st	%f28,	[%l7 + 0x44]
	subcc	%i1,	%g7,	%l3
	edge16l	%g6,	%o0,	%l0
	std	%f20,	[%l7 + 0x28]
	movpos	%icc,	%i6,	%g4
	fnor	%f20,	%f16,	%f20
	ldsh	[%l7 + 0x2C],	%o1
	nop
	set	0x60, %i1
	stw	%o3,	[%l7 + %i1]
	move	%xcc,	%g1,	%o5
	fcmped	%fcc1,	%f12,	%f28
	udivx	%o2,	0x1EC9,	%l5
	fornot1s	%f18,	%f16,	%f5
	restore %i0, %l6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i7,	%i5,	%o6
	movrgz	%o7,	%l4,	%g2
	edge16l	%i4,	%g5,	%g3
	smulcc	%o4,	%i3,	%l1
	and	%i2,	%g7,	%l3
	movrgez	%g6,	0x1B8,	%i1
	and	%o0,	0x0F8F,	%i6
	movn	%xcc,	%g4,	%l0
	fandnot1	%f22,	%f28,	%f14
	udivcc	%o3,	0x10F8,	%o1
	fmul8sux16	%f20,	%f16,	%f2
	movcs	%xcc,	%g1,	%o5
	movn	%xcc,	%o2,	%i0
	sub	%l6,	0x0D33,	%l5
	fabsd	%f8,	%f28
	popc	%l2,	%i5
	edge8ln	%i7,	%o7,	%o6
	xnorcc	%g2,	%i4,	%g5
	udivcc	%g3,	0x037D,	%l4
	fandnot1	%f30,	%f30,	%f16
	st	%f19,	[%l7 + 0x44]
	fnors	%f29,	%f27,	%f11
	fpack16	%f6,	%f15
	fornot1	%f24,	%f24,	%f4
	smulcc	%o4,	%i3,	%i2
	movvc	%xcc,	%l1,	%l3
	faligndata	%f22,	%f0,	%f16
	lduw	[%l7 + 0x28],	%g6
	movrgz	%g7,	%o0,	%i6
	ldsh	[%l7 + 0x7C],	%g4
	sra	%i1,	0x19,	%l0
	orncc	%o3,	0x1AB4,	%g1
	edge32	%o1,	%o5,	%o2
	edge32l	%l6,	%i0,	%l2
	subcc	%i5,	%i7,	%o7
	save %o6, 0x1824, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i4,	%g2,	%g3
	array8	%l4,	%g5,	%o4
	sdiv	%i2,	0x16C0,	%i3
	sub	%l1,	0x06E5,	%g6
	fand	%f6,	%f16,	%f6
	fpack32	%f0,	%f4,	%f26
	movgu	%xcc,	%l3,	%g7
	sll	%i6,	0x1E,	%o0
	movre	%i1,	%l0,	%o3
	edge32ln	%g1,	%o1,	%g4
	siam	0x6
	fsrc2	%f24,	%f18
	ldsw	[%l7 + 0x78],	%o5
	alignaddrl	%o2,	%l6,	%i0
	edge16ln	%i5,	%l2,	%o7
	add	%i7,	0x121D,	%o6
	xnorcc	%l5,	0x07CE,	%i4
	fpackfix	%f24,	%f3
	fmovsl	%xcc,	%f22,	%f0
	stw	%g2,	[%l7 + 0x28]
	std	%f16,	[%l7 + 0x60]
	andn	%l4,	0x18BA,	%g5
	srl	%o4,	0x0E,	%g3
	fabsd	%f16,	%f30
	orncc	%i2,	0x082C,	%l1
	fmovdle	%xcc,	%f20,	%f30
	movrlez	%i3,	0x3CB,	%l3
	sdivcc	%g6,	0x1DFF,	%g7
	orn	%i6,	%o0,	%l0
	smul	%i1,	0x030E,	%g1
	edge32	%o1,	%o3,	%o5
	fxnor	%f6,	%f6,	%f28
	sllx	%g4,	%o2,	%i0
	addcc	%l6,	%l2,	%o7
	movvs	%xcc,	%i7,	%i5
	edge16l	%o6,	%l5,	%i4
	sir	0x0ACE
	edge16n	%l4,	%g2,	%g5
	andncc	%g3,	%o4,	%i2
	sth	%i3,	[%l7 + 0x74]
	edge8ln	%l3,	%l1,	%g7
	movvs	%xcc,	%g6,	%i6
	edge16	%l0,	%i1,	%g1
	add	%o0,	0x0B71,	%o3
	addc	%o5,	0x0939,	%g4
	addccc	%o1,	0x1FE9,	%i0
	edge32ln	%o2,	%l6,	%o7
	array16	%i7,	%i5,	%o6
	ldx	[%l7 + 0x40],	%l2
	andncc	%l5,	%l4,	%g2
	subcc	%i4,	0x17F4,	%g3
	orncc	%g5,	%i2,	%i3
	fmovscs	%icc,	%f14,	%f18
	popc	0x1093,	%o4
	ldsb	[%l7 + 0x7A],	%l3
	array16	%l1,	%g7,	%g6
	fmovsleu	%xcc,	%f23,	%f27
	ldsw	[%l7 + 0x20],	%i6
	fmovdneg	%xcc,	%f24,	%f25
	ldd	[%l7 + 0x18],	%i0
	fabss	%f2,	%f20
	add	%g1,	0x1B57,	%l0
	addccc	%o0,	0x1E33,	%o5
	edge32	%g4,	%o1,	%i0
	movpos	%xcc,	%o2,	%o3
	addcc	%o7,	%l6,	%i5
	popc	%o6,	%l2
	srl	%i7,	0x14,	%l4
	fand	%f26,	%f26,	%f26
	mulscc	%l5,	0x121D,	%i4
	fmovdcs	%xcc,	%f9,	%f23
	addccc	%g3,	%g5,	%i2
	edge32ln	%g2,	%o4,	%i3
	edge16	%l3,	%g7,	%g6
	xnor	%l1,	%i6,	%g1
	movneg	%xcc,	%i1,	%l0
	xnor	%o0,	%o5,	%o1
	umulcc	%g4,	%o2,	%i0
	movrne	%o3,	0x224,	%l6
	lduw	[%l7 + 0x08],	%i5
	fcmpeq32	%f20,	%f24,	%o7
	fmul8x16al	%f25,	%f5,	%f10
	movrne	%o6,	0x2C5,	%l2
	fpsub32	%f16,	%f2,	%f30
	array32	%i7,	%l4,	%l5
	ldd	[%l7 + 0x28],	%g2
	fmovdle	%xcc,	%f29,	%f18
	smulcc	%i4,	%i2,	%g2
	subc	%g5,	0x1770,	%i3
	sethi	0x1F7C,	%l3
	ldd	[%l7 + 0x60],	%g6
	fnot1	%f24,	%f10
	movne	%xcc,	%o4,	%g6
	popc	0x079A,	%l1
	move	%xcc,	%g1,	%i6
	sth	%l0,	[%l7 + 0x3E]
	xnorcc	%o0,	%o5,	%i1
	sra	%g4,	0x0A,	%o1
	move	%icc,	%o2,	%o3
	mova	%icc,	%i0,	%l6
	udiv	%i5,	0x13DB,	%o6
	movne	%xcc,	%o7,	%i7
	edge32	%l4,	%l2,	%l5
	movvs	%xcc,	%i4,	%g3
	umul	%i2,	%g5,	%g2
	popc	0x04C3,	%l3
	move	%xcc,	%g7,	%o4
	orncc	%g6,	0x1212,	%i3
	udivcc	%g1,	0x0DFB,	%l1
	smulcc	%i6,	%o0,	%o5
	fxnors	%f6,	%f17,	%f1
	andcc	%l0,	0x1AA0,	%g4
	movleu	%icc,	%o1,	%o2
	udiv	%o3,	0x07B5,	%i0
	edge32	%l6,	%i5,	%o6
	fmovdne	%icc,	%f20,	%f9
	st	%f29,	[%l7 + 0x34]
	udivcc	%i1,	0x1202,	%i7
	fmovdcc	%xcc,	%f28,	%f7
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	udivx	%l4,	0x1768,	%i4
	xorcc	%l5,	0x09C7,	%g3
	subc	%i2,	0x1F8D,	%g2
	fmovrsne	%g5,	%f20,	%f18
	movcs	%xcc,	%l3,	%g7
	xnorcc	%o4,	%i3,	%g1
	fpadd32	%f30,	%f4,	%f12
	mulx	%l1,	%g6,	%o0
	movge	%xcc,	%i6,	%l0
	movl	%icc,	%g4,	%o1
	movvs	%xcc,	%o5,	%o3
	edge8ln	%o2,	%l6,	%i0
	srlx	%i5,	%i1,	%o6
	edge8	%i7,	%l2,	%o7
	alignaddrl	%i4,	%l5,	%g3
	ldx	[%l7 + 0x30],	%i2
	fabsd	%f2,	%f0
	movg	%xcc,	%l4,	%g5
	sll	%l3,	0x1E,	%g2
	array16	%o4,	%g7,	%i3
	mulx	%g1,	%g6,	%l1
	move	%icc,	%i6,	%l0
	ldsw	[%l7 + 0x50],	%g4
	alignaddrl	%o0,	%o1,	%o5
	sth	%o2,	[%l7 + 0x36]
	movgu	%xcc,	%o3,	%l6
	addcc	%i5,	%i1,	%i0
	save %i7, 0x0914, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l2,	%i4,	%o7
	mulscc	%g3,	0x0C72,	%l5
	subc	%i2,	%g5,	%l4
	orncc	%l3,	%g2,	%o4
	and	%i3,	0x1247,	%g1
	movneg	%icc,	%g7,	%l1
	subcc	%g6,	0x0DE7,	%i6
	fexpand	%f2,	%f14
	alignaddr	%g4,	%l0,	%o0
	array16	%o5,	%o2,	%o3
	smul	%l6,	0x092F,	%i5
	fmovse	%xcc,	%f23,	%f26
	ldx	[%l7 + 0x08],	%o1
	udivx	%i0,	0x1087,	%i1
	fandnot1s	%f3,	%f5,	%f18
	edge32n	%o6,	%l2,	%i7
	lduw	[%l7 + 0x74],	%i4
	ld	[%l7 + 0x08],	%f5
	udivx	%g3,	0x1053,	%l5
	and	%o7,	0x17C5,	%i2
	edge32	%l4,	%l3,	%g5
	fnands	%f26,	%f7,	%f8
	sdiv	%g2,	0x1C49,	%o4
	fmovdle	%icc,	%f5,	%f2
	lduh	[%l7 + 0x54],	%g1
	udivcc	%g7,	0x0E11,	%l1
	fpadd32	%f10,	%f20,	%f16
	ldsw	[%l7 + 0x18],	%g6
	stw	%i3,	[%l7 + 0x70]
	edge8ln	%i6,	%l0,	%g4
	andcc	%o5,	0x0FCD,	%o0
	sdivcc	%o2,	0x0EE1,	%l6
	fmovrdne	%i5,	%f30,	%f14
	movrne	%o1,	0x1F9,	%o3
	movne	%icc,	%i0,	%o6
	edge16n	%l2,	%i7,	%i1
	alignaddr	%g3,	%l5,	%i4
	andcc	%i2,	%o7,	%l3
	fnegd	%f20,	%f0
	nop
	set	0x5D, %g2
	stb	%g5,	[%l7 + %g2]
	edge16	%g2,	%l4,	%g1
	edge16l	%g7,	%o4,	%g6
	ldsb	[%l7 + 0x1E],	%i3
	edge8	%i6,	%l0,	%g4
	fnot1s	%f16,	%f20
	udiv	%o5,	0x1129,	%o0
	fsrc1s	%f21,	%f9
	popc	%l1,	%l6
	movrgz	%i5,	0x1C2,	%o1
	add	%o2,	0x05D3,	%i0
	srl	%o6,	%o3,	%l2
	movpos	%xcc,	%i1,	%i7
	fandnot2s	%f20,	%f31,	%f3
	fones	%f17
	andncc	%l5,	%i4,	%g3
	fmuld8ulx16	%f28,	%f5,	%f30
	popc	0x0D5B,	%o7
	edge8n	%i2,	%l3,	%g5
	movn	%xcc,	%l4,	%g1
	fsrc2s	%f29,	%f21
	ldsw	[%l7 + 0x68],	%g2
	ld	[%l7 + 0x40],	%f17
	fcmpne16	%f22,	%f0,	%o4
	subcc	%g6,	%g7,	%i3
	fmovsgu	%xcc,	%f28,	%f28
	fmovsleu	%icc,	%f31,	%f28
	xnor	%l0,	0x1D8E,	%i6
	sub	%g4,	0x122F,	%o5
	smul	%l1,	%o0,	%i5
	popc	0x0BA4,	%l6
	fmovdvc	%xcc,	%f15,	%f8
	ld	[%l7 + 0x28],	%f15
	orn	%o2,	%i0,	%o6
	edge8ln	%o1,	%o3,	%i1
	fpmerge	%f10,	%f17,	%f10
	movre	%i7,	%l5,	%i4
	movl	%icc,	%g3,	%l2
	ldsw	[%l7 + 0x34],	%o7
	faligndata	%f22,	%f0,	%f28
	fsrc2s	%f6,	%f23
	and	%l3,	0x1A3F,	%i2
	addc	%l4,	%g1,	%g2
	alignaddr	%o4,	%g5,	%g7
	orn	%i3,	0x0D99,	%l0
	fxnor	%f10,	%f6,	%f16
	stw	%g6,	[%l7 + 0x5C]
	edge8ln	%i6,	%g4,	%l1
	fmovsn	%xcc,	%f0,	%f26
	movleu	%icc,	%o0,	%i5
	array16	%l6,	%o2,	%o5
	edge8l	%i0,	%o6,	%o1
	lduw	[%l7 + 0x7C],	%o3
	stx	%i1,	[%l7 + 0x70]
	smul	%i7,	%i4,	%l5
	sethi	0x16BC,	%g3
	lduh	[%l7 + 0x10],	%o7
	movg	%xcc,	%l2,	%i2
	movrlez	%l4,	%g1,	%g2
	mulscc	%l3,	%o4,	%g5
	edge16n	%i3,	%g7,	%g6
	srlx	%i6,	%g4,	%l1
	sdivx	%o0,	0x1E00,	%l0
	restore %i5, 0x17DB, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%icc,	%f17,	%f13
	nop
	set	0x70, %g6
	ldx	[%l7 + %g6],	%o5
	edge32ln	%i0,	%o6,	%l6
	sllx	%o3,	0x09,	%i1
	nop
	set	0x20, %i5
	std	%f8,	[%l7 + %i5]
	movcs	%xcc,	%i7,	%i4
	st	%f26,	[%l7 + 0x3C]
	array32	%l5,	%g3,	%o1
	movne	%icc,	%o7,	%i2
	movre	%l4,	%l2,	%g2
	edge8ln	%l3,	%o4,	%g5
	fmovdg	%xcc,	%f7,	%f24
	xnorcc	%i3,	0x0A8C,	%g1
	sdiv	%g7,	0x1DDF,	%i6
	sra	%g6,	%g4,	%l1
	movl	%icc,	%o0,	%l0
	edge8n	%o2,	%o5,	%i0
	movvs	%icc,	%o6,	%l6
	movrne	%o3,	0x2AA,	%i5
	lduw	[%l7 + 0x18],	%i7
	stw	%i1,	[%l7 + 0x10]
	andn	%i4,	0x1266,	%l5
	ld	[%l7 + 0x10],	%f15
	fmovrse	%g3,	%f8,	%f4
	fmovsne	%icc,	%f20,	%f20
	ldsw	[%l7 + 0x40],	%o1
	movrne	%o7,	%i2,	%l4
	movpos	%icc,	%g2,	%l2
	move	%xcc,	%l3,	%g5
	movcc	%icc,	%o4,	%g1
	fandnot2	%f0,	%f6,	%f24
	std	%f18,	[%l7 + 0x38]
	addc	%i3,	%i6,	%g6
	umul	%g4,	%l1,	%g7
	srl	%l0,	0x1C,	%o0
	edge16ln	%o5,	%i0,	%o6
	movneg	%icc,	%o2,	%l6
	movgu	%xcc,	%o3,	%i5
	stw	%i7,	[%l7 + 0x20]
	xnor	%i1,	%l5,	%g3
	fzeros	%f12
	fmovrdlez	%i4,	%f4,	%f22
	st	%f13,	[%l7 + 0x18]
	array8	%o7,	%i2,	%l4
	fzeros	%f17
	fcmpes	%fcc3,	%f22,	%f21
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%f12
	fnot2	%f30,	%f24
	ld	[%l7 + 0x3C],	%f11
	edge32	%g2,	%o1,	%l2
	xorcc	%g5,	%l3,	%o4
	orn	%i3,	%g1,	%g6
	lduh	[%l7 + 0x40],	%g4
	fornot2	%f18,	%f0,	%f2
	fmovrsgez	%i6,	%f14,	%f0
	edge8	%g7,	%l1,	%o0
	fmovdvc	%icc,	%f20,	%f14
	movge	%xcc,	%l0,	%o5
	ldd	[%l7 + 0x20],	%f0
	movrne	%o6,	%i0,	%o2
	fandnot1	%f30,	%f30,	%f24
	and	%l6,	0x193B,	%i5
	pdist	%f28,	%f30,	%f2
	ld	[%l7 + 0x70],	%f6
	fxnor	%f24,	%f10,	%f24
	movrgez	%o3,	%i1,	%i7
	lduh	[%l7 + 0x7E],	%l5
	orn	%g3,	0x037B,	%i4
	ldd	[%l7 + 0x08],	%f10
	edge32n	%i2,	%l4,	%o7
	movneg	%icc,	%g2,	%o1
	movrlez	%l2,	%l3,	%o4
	ldub	[%l7 + 0x71],	%g5
	move	%icc,	%i3,	%g6
	lduh	[%l7 + 0x14],	%g4
	movre	%g1,	%g7,	%l1
	faligndata	%f4,	%f2,	%f18
	udivcc	%o0,	0x029F,	%i6
	fmovrdgez	%l0,	%f4,	%f16
	fmovrslz	%o6,	%f15,	%f28
	lduw	[%l7 + 0x10],	%i0
	sll	%o5,	0x08,	%o2
	fmovsg	%icc,	%f30,	%f19
	for	%f2,	%f4,	%f12
	movrne	%i5,	0x1ED,	%o3
	fmovrsgz	%i1,	%f12,	%f17
	edge32l	%l6,	%i7,	%l5
	fcmpne32	%f26,	%f30,	%i4
	fnegs	%f0,	%f10
	srl	%i2,	%l4,	%o7
	movrlz	%g3,	0x321,	%o1
	fmul8ulx16	%f24,	%f12,	%f2
	smulcc	%l2,	0x12AE,	%g2
	edge16	%l3,	%g5,	%o4
	fnegs	%f7,	%f6
	sll	%i3,	%g6,	%g1
	ldd	[%l7 + 0x30],	%g4
	fmovde	%xcc,	%f14,	%f15
	alignaddr	%g7,	%l1,	%i6
	movcc	%icc,	%o0,	%l0
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	sir	0x1C43
	movneg	%xcc,	%o2,	%i5
	movneg	%xcc,	%i1,	%o3
	fcmple16	%f16,	%f20,	%i7
	save %l6, 0x1781, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x44],	%f6
	sra	%i2,	%i4,	%o7
	fmovdcs	%icc,	%f26,	%f9
	orncc	%g3,	0x06F0,	%l4
	fmovs	%f1,	%f30
	movre	%o1,	0x213,	%l2
	movle	%xcc,	%g2,	%l3
	smulcc	%g5,	%o4,	%i3
	movl	%xcc,	%g6,	%g1
	fmovscc	%xcc,	%f17,	%f26
	or	%g4,	%l1,	%i6
	smulcc	%g7,	0x13A8,	%l0
	fnot2	%f16,	%f6
	alignaddrl	%o6,	%o0,	%i0
	edge16n	%o2,	%o5,	%i5
	subcc	%o3,	0x1308,	%i1
	sir	0x0E6F
	fmovdl	%xcc,	%f18,	%f6
	and	%i7,	0x1442,	%l5
	fsrc1	%f26,	%f10
	movvc	%icc,	%l6,	%i4
	addc	%o7,	0x0D58,	%g3
	edge16n	%i2,	%l4,	%o1
	andn	%g2,	0x12A3,	%l3
	movgu	%icc,	%g5,	%l2
	mova	%xcc,	%o4,	%g6
	sllx	%g1,	%i3,	%g4
	alignaddrl	%i6,	%l1,	%g7
	std	%f4,	[%l7 + 0x18]
	std	%f0,	[%l7 + 0x78]
	movrgez	%l0,	0x15C,	%o6
	edge16l	%o0,	%i0,	%o5
	movrgez	%o2,	0x259,	%i5
	sdiv	%i1,	0x0797,	%i7
	move	%xcc,	%o3,	%l6
	movrne	%l5,	0x12F,	%o7
	stb	%g3,	[%l7 + 0x29]
	umulcc	%i2,	0x151D,	%i4
	edge32	%l4,	%o1,	%g2
	umul	%g5,	0x1FB3,	%l3
	fnor	%f24,	%f14,	%f30
	lduw	[%l7 + 0x18],	%l2
	popc	0x08D3,	%o4
	fpadd16s	%f4,	%f9,	%f16
	fors	%f29,	%f10,	%f12
	fcmpne16	%f0,	%f24,	%g1
	smul	%i3,	0x0290,	%g6
	orn	%g4,	0x04B4,	%i6
	fpsub32	%f24,	%f16,	%f28
	fmovrdlz	%g7,	%f10,	%f6
	fmovdneg	%icc,	%f28,	%f23
	udiv	%l1,	0x0FC0,	%l0
	fnors	%f7,	%f23,	%f14
	mova	%icc,	%o0,	%i0
	fmovdleu	%icc,	%f31,	%f15
	edge32n	%o6,	%o5,	%o2
	orn	%i5,	0x14E6,	%i1
	movcs	%xcc,	%o3,	%l6
	edge32ln	%l5,	%i7,	%o7
	edge16ln	%i2,	%g3,	%l4
	sdivx	%i4,	0x0687,	%g2
	movrgz	%g5,	0x0E9,	%o1
	movrgez	%l3,	%o4,	%l2
	fmovse	%xcc,	%f28,	%f16
	addccc	%g1,	0x047F,	%g6
	sdivx	%g4,	0x0E65,	%i3
	andcc	%i6,	%g7,	%l1
	edge16	%o0,	%i0,	%o6
	add	%l0,	%o2,	%o5
	edge32l	%i5,	%o3,	%l6
	movneg	%xcc,	%i1,	%i7
	edge8n	%l5,	%o7,	%i2
	move	%icc,	%l4,	%g3
	ldd	[%l7 + 0x50],	%f4
	array16	%i4,	%g5,	%g2
	subcc	%l3,	0x0477,	%o1
	mulscc	%o4,	%l2,	%g1
	srax	%g4,	%i3,	%i6
	sir	0x16E4
	movvs	%xcc,	%g7,	%l1
	fzeros	%f1
	movgu	%xcc,	%g6,	%o0
	fcmpgt32	%f14,	%f22,	%i0
	movneg	%icc,	%l0,	%o2
	ldsh	[%l7 + 0x52],	%o5
	alignaddrl	%o6,	%i5,	%l6
	umulcc	%i1,	%i7,	%o3
	edge32ln	%l5,	%o7,	%i2
	movcs	%icc,	%l4,	%i4
	sdivx	%g3,	0x1CB5,	%g5
	edge16n	%l3,	%g2,	%o1
	movcc	%icc,	%o4,	%l2
	movne	%xcc,	%g4,	%g1
	ld	[%l7 + 0x54],	%f13
	fmovdvs	%xcc,	%f16,	%f8
	ld	[%l7 + 0x20],	%f0
	mulx	%i3,	0x1BC2,	%i6
	fpack32	%f10,	%f16,	%f0
	fcmple32	%f26,	%f22,	%g7
	sdivcc	%g6,	0x1AD6,	%l1
	xnorcc	%o0,	%i0,	%l0
	subcc	%o5,	0x14F1,	%o6
	movvs	%xcc,	%o2,	%l6
	movcc	%xcc,	%i5,	%i7
	ldd	[%l7 + 0x18],	%f8
	fmovdle	%xcc,	%f24,	%f6
	sub	%i1,	0x0634,	%l5
	and	%o3,	0x07F7,	%i2
	mova	%icc,	%o7,	%i4
	movcs	%icc,	%l4,	%g3
	movrgz	%g5,	0x198,	%l3
	movrlz	%g2,	%o1,	%l2
	fmovrdlez	%g4,	%f8,	%f12
	movrgz	%o4,	%g1,	%i6
	lduw	[%l7 + 0x64],	%i3
	ldsh	[%l7 + 0x14],	%g7
	fpackfix	%f2,	%f15
	edge32	%l1,	%o0,	%g6
	sub	%l0,	%i0,	%o5
	fnot1s	%f31,	%f21
	nop
	set	0x26, %g1
	stb	%o2,	[%l7 + %g1]
	fmul8x16	%f3,	%f4,	%f28
	orncc	%l6,	%i5,	%o6
	subcc	%i7,	0x0BD7,	%l5
	fcmple32	%f14,	%f12,	%o3
	array16	%i1,	%i2,	%o7
	edge16	%l4,	%g3,	%g5
	andcc	%l3,	%g2,	%o1
	sdiv	%l2,	0x0623,	%g4
	movleu	%icc,	%o4,	%i4
	fcmpne16	%f0,	%f18,	%g1
	ldsw	[%l7 + 0x14],	%i6
	udivcc	%i3,	0x095B,	%l1
	edge16l	%o0,	%g7,	%g6
	fmovspos	%icc,	%f31,	%f6
	xor	%l0,	0x1425,	%i0
	srlx	%o2,	%o5,	%l6
	movn	%xcc,	%i5,	%i7
	fmovrdne	%o6,	%f14,	%f0
	edge8	%l5,	%o3,	%i2
	xnor	%i1,	%o7,	%g3
	save %l4, %g5, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%xcc,	%f26,	%f18
	stw	%l3,	[%l7 + 0x58]
	edge8l	%l2,	%o1,	%o4
	sir	0x0286
	fxor	%f20,	%f8,	%f8
	smul	%g4,	%i4,	%g1
	addccc	%i3,	0x08ED,	%l1
	alignaddr	%i6,	%g7,	%o0
	fabsd	%f22,	%f0
	mulx	%l0,	0x0DC1,	%i0
	edge32	%g6,	%o2,	%o5
	fmovdgu	%icc,	%f4,	%f23
	addc	%l6,	0x003A,	%i5
	movg	%icc,	%i7,	%l5
	array32	%o6,	%o3,	%i1
	udivcc	%i2,	0x0CA0,	%g3
	ldsw	[%l7 + 0x14],	%o7
	orncc	%l4,	0x1923,	%g5
	addc	%l3,	0x0193,	%g2
	fcmpd	%fcc0,	%f24,	%f16
	fmovrsgz	%l2,	%f3,	%f6
	movleu	%icc,	%o4,	%o1
	nop
	set	0x14, %i2
	ldsh	[%l7 + %i2],	%g4
	movre	%g1,	%i3,	%l1
	subccc	%i6,	0x1263,	%i4
	fmovsvs	%icc,	%f5,	%f31
	fmovdcc	%icc,	%f3,	%f15
	array16	%o0,	%l0,	%i0
	addccc	%g7,	0x0453,	%o2
	siam	0x0
	sllx	%g6,	%l6,	%o5
	sra	%i7,	%i5,	%l5
	ldsh	[%l7 + 0x7C],	%o3
	array8	%i1,	%o6,	%g3
	movrlz	%o7,	0x0CA,	%l4
	fcmpgt32	%f12,	%f24,	%g5
	stb	%i2,	[%l7 + 0x79]
	popc	0x0600,	%l3
	fmovsa	%icc,	%f31,	%f22
	array16	%g2,	%o4,	%l2
	umulcc	%g4,	0x1F1C,	%g1
	fcmpne16	%f22,	%f14,	%i3
	movge	%icc,	%o1,	%l1
	movvs	%xcc,	%i4,	%i6
	edge16ln	%o0,	%l0,	%i0
	stw	%g7,	[%l7 + 0x64]
	fandnot2s	%f6,	%f10,	%f14
	movleu	%xcc,	%g6,	%l6
	edge8l	%o2,	%i7,	%i5
	fmul8x16al	%f27,	%f12,	%f12
	edge32n	%o5,	%o3,	%l5
	edge16l	%i1,	%g3,	%o7
	edge32n	%l4,	%g5,	%o6
	alignaddrl	%i2,	%l3,	%g2
	array8	%o4,	%g4,	%l2
	fmovdneg	%icc,	%f19,	%f6
	ldx	[%l7 + 0x60],	%i3
	sethi	0x1CF2,	%o1
	movrgz	%l1,	%g1,	%i4
	add	%o0,	%i6,	%l0
	alignaddrl	%i0,	%g6,	%l6
	alignaddr	%o2,	%g7,	%i7
	and	%i5,	0x0852,	%o3
	xorcc	%o5,	%i1,	%l5
	fandnot1	%f2,	%f8,	%f24
	array32	%g3,	%l4,	%o7
	subc	%o6,	%g5,	%l3
	fmul8x16al	%f0,	%f5,	%f28
	umulcc	%g2,	0x0491,	%i2
	ldub	[%l7 + 0x5E],	%g4
	fornot2s	%f19,	%f26,	%f25
	or	%o4,	%l2,	%i3
	xnorcc	%l1,	%o1,	%i4
	subcc	%o0,	%i6,	%l0
	sdivx	%g1,	0x19DD,	%g6
	edge16n	%l6,	%i0,	%g7
	fnegs	%f7,	%f28
	sllx	%o2,	0x13,	%i5
	fmovdvc	%xcc,	%f0,	%f21
	addc	%o3,	%i7,	%o5
	sth	%i1,	[%l7 + 0x60]
	srl	%l5,	0x0B,	%l4
	andcc	%o7,	0x11CF,	%o6
	restore %g3, 0x0D41, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x18],	%g2
	popc	%g5,	%i2
	edge32n	%g4,	%l2,	%o4
	smul	%l1,	0x1EC4,	%o1
	movrne	%i3,	%i4,	%i6
	udivcc	%o0,	0x00CD,	%g1
	srl	%l0,	0x0F,	%g6
	edge16ln	%i0,	%l6,	%o2
	st	%f7,	[%l7 + 0x44]
	ldd	[%l7 + 0x08],	%f0
	addc	%i5,	0x05AB,	%g7
	fmovrslz	%o3,	%f4,	%f27
	array32	%i7,	%i1,	%o5
	sllx	%l5,	0x0C,	%o7
	ldsb	[%l7 + 0x75],	%l4
	movneg	%xcc,	%o6,	%l3
	movgu	%xcc,	%g3,	%g5
	fxor	%f22,	%f30,	%f22
	or	%i2,	%g2,	%g4
	orcc	%l2,	%l1,	%o1
	movn	%icc,	%o4,	%i4
	sll	%i6,	0x00,	%i3
	or	%g1,	%l0,	%o0
	movrne	%g6,	%i0,	%l6
	stb	%o2,	[%l7 + 0x50]
	fmovdle	%icc,	%f8,	%f10
	edge16	%g7,	%i5,	%i7
	fpadd32	%f18,	%f4,	%f22
	fabsd	%f8,	%f2
	movre	%o3,	%i1,	%l5
	subccc	%o7,	%o5,	%o6
	sdivx	%l4,	0x0626,	%l3
	fpadd16s	%f30,	%f7,	%f29
	addcc	%g5,	0x1FB1,	%i2
	srax	%g3,	%g4,	%l2
	nop
	set	0x6C, %o1
	sth	%g2,	[%l7 + %o1]
	move	%icc,	%l1,	%o4
	popc	%i4,	%o1
	movvs	%icc,	%i6,	%i3
	subccc	%g1,	%l0,	%o0
	umulcc	%g6,	%l6,	%i0
	and	%g7,	0x032B,	%o2
	fmovdge	%icc,	%f18,	%f29
	stb	%i7,	[%l7 + 0x61]
	srl	%o3,	%i5,	%i1
	array16	%o7,	%l5,	%o6
	sdiv	%l4,	0x04E7,	%o5
	subccc	%g5,	%i2,	%l3
	move	%icc,	%g3,	%l2
	fmovdg	%icc,	%f18,	%f2
	udivcc	%g2,	0x1129,	%l1
	movrlez	%o4,	%i4,	%o1
	udivcc	%i6,	0x179D,	%i3
	fnor	%f16,	%f22,	%f28
	smul	%g1,	%g4,	%l0
	fxnors	%f25,	%f9,	%f7
	ldsb	[%l7 + 0x65],	%o0
	andn	%l6,	%i0,	%g7
	sllx	%g6,	%o2,	%i7
	move	%icc,	%i5,	%i1
	movn	%xcc,	%o3,	%o7
	fmovdge	%icc,	%f4,	%f2
	fpackfix	%f16,	%f31
	fmovde	%icc,	%f16,	%f21
	stw	%l5,	[%l7 + 0x30]
	sllx	%l4,	0x02,	%o5
	subccc	%g5,	%i2,	%l3
	alignaddrl	%o6,	%l2,	%g3
	stx	%g2,	[%l7 + 0x30]
	sir	0x01AB
	subc	%l1,	%o4,	%o1
	sth	%i6,	[%l7 + 0x52]
	array8	%i4,	%i3,	%g1
	ldd	[%l7 + 0x48],	%f20
	movrlz	%g4,	%l0,	%o0
	fnot1s	%f23,	%f21
	fpadd32	%f28,	%f24,	%f4
	subccc	%l6,	%i0,	%g6
	ldub	[%l7 + 0x0F],	%o2
	fcmpeq16	%f30,	%f0,	%i7
	subccc	%g7,	0x1C3B,	%i5
	fsrc1s	%f2,	%f0
	movrgez	%i1,	0x222,	%o7
	fandnot1s	%f14,	%f20,	%f25
	andn	%o3,	%l4,	%l5
	sth	%g5,	[%l7 + 0x6A]
	edge16	%i2,	%o5,	%o6
	nop
	set	0x54, %l1
	stw	%l2,	[%l7 + %l1]
	movvs	%xcc,	%g3,	%l3
	stx	%g2,	[%l7 + 0x10]
	orncc	%o4,	%l1,	%o1
	fsrc1s	%f16,	%f8
	sdivcc	%i6,	0x1D93,	%i4
	xnor	%g1,	0x1914,	%i3
	addcc	%l0,	0x1A34,	%o0
	edge8ln	%g4,	%l6,	%i0
	array8	%g6,	%i7,	%g7
	lduh	[%l7 + 0x78],	%o2
	umulcc	%i5,	%o7,	%o3
	movrne	%i1,	0x0C5,	%l4
	movge	%xcc,	%g5,	%l5
	popc	0x1209,	%i2
	sub	%o6,	%l2,	%o5
	fmuld8sux16	%f0,	%f28,	%f12
	andncc	%l3,	%g2,	%g3
	sir	0x0AA1
	edge8	%l1,	%o4,	%o1
	subccc	%i4,	%i6,	%g1
	array16	%l0,	%o0,	%i3
	sth	%l6,	[%l7 + 0x0A]
	movcc	%xcc,	%g4,	%g6
	movne	%xcc,	%i0,	%g7
	addcc	%o2,	%i5,	%i7
	movne	%icc,	%o3,	%i1
	addccc	%o7,	%l4,	%l5
	edge16ln	%g5,	%o6,	%l2
	fcmple16	%f0,	%f24,	%o5
	ldsb	[%l7 + 0x2E],	%l3
	addccc	%i2,	%g3,	%g2
	ldsb	[%l7 + 0x23],	%o4
	movrgz	%o1,	0x224,	%l1
	fxnors	%f31,	%f25,	%f21
	fmovdcc	%xcc,	%f14,	%f19
	edge32n	%i4,	%i6,	%l0
	movl	%xcc,	%o0,	%i3
	mova	%icc,	%g1,	%g4
	movneg	%xcc,	%l6,	%g6
	edge32n	%i0,	%g7,	%i5
	andcc	%o2,	%o3,	%i7
	mova	%xcc,	%o7,	%i1
	addcc	%l5,	0x16CD,	%l4
	fnot2s	%f13,	%f23
	fmovsle	%xcc,	%f31,	%f0
	movrlez	%o6,	%l2,	%o5
	mova	%icc,	%g5,	%i2
	fzeros	%f15
	addcc	%g3,	%g2,	%o4
	orn	%o1,	0x0916,	%l1
	subccc	%l3,	%i6,	%i4
	lduw	[%l7 + 0x10],	%o0
	edge32ln	%l0,	%g1,	%g4
	stb	%i3,	[%l7 + 0x7D]
	fpsub32s	%f11,	%f5,	%f22
	movgu	%xcc,	%l6,	%g6
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%i0
	sll	%g7,	%o2,	%i5
	sub	%o3,	0x1BBE,	%o7
	addc	%i7,	0x1683,	%l5
	movrne	%i1,	%o6,	%l2
	fmuld8sux16	%f8,	%f14,	%f12
	movre	%o5,	0x196,	%l4
	movrgz	%i2,	0x22F,	%g5
	movne	%xcc,	%g3,	%o4
	fmovrsne	%o1,	%f24,	%f30
	array16	%l1,	%l3,	%i6
	addc	%g2,	%o0,	%i4
	fnegd	%f10,	%f10
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	fpadd32	%f24,	%f26,	%f4
	move	%icc,	%i3,	%l0
	edge32	%g6,	%l6,	%g7
	fmovsn	%icc,	%f6,	%f22
	mulx	%o2,	%i0,	%i5
	edge16ln	%o3,	%o7,	%i7
	orncc	%i1,	%o6,	%l5
	mulx	%o5,	0x042E,	%l2
	xnorcc	%i2,	0x179C,	%g5
	or	%g3,	%o4,	%o1
	alignaddr	%l1,	%l4,	%l3
	or	%i6,	0x1DE1,	%o0
	smulcc	%g2,	%i4,	%g1
	fsrc1s	%f8,	%f22
	fmovdge	%xcc,	%f19,	%f9
	fabss	%f7,	%f27
	ldsb	[%l7 + 0x73],	%i3
	mulscc	%g4,	0x1809,	%l0
	sth	%g6,	[%l7 + 0x34]
	mova	%xcc,	%g7,	%o2
	sdivcc	%i0,	0x1229,	%l6
	save %i5, %o7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i1,	%o3,	%l5
	udivx	%o6,	0x0B47,	%l2
	andn	%i2,	0x048B,	%g5
	movrne	%o5,	%o4,	%g3
	addccc	%o1,	0x07F3,	%l4
	movleu	%xcc,	%l3,	%i6
	fxnors	%f16,	%f22,	%f24
	fsrc1s	%f4,	%f14
	movrlez	%l1,	%o0,	%g2
	array8	%i4,	%g1,	%i3
	edge32ln	%g4,	%g6,	%g7
	movrlez	%l0,	0x01A,	%i0
	orcc	%l6,	%o2,	%o7
	and	%i7,	0x10FA,	%i1
	movpos	%xcc,	%o3,	%i5
	fmovdl	%icc,	%f9,	%f24
	alignaddrl	%o6,	%l5,	%i2
	lduw	[%l7 + 0x38],	%l2
	ldsh	[%l7 + 0x16],	%o5
	ldub	[%l7 + 0x77],	%o4
	fmovdle	%icc,	%f31,	%f10
	restore %g3, %o1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f3,	%f13,	%f6
	movrgz	%g5,	%l3,	%i6
	edge16n	%l1,	%o0,	%i4
	andcc	%g1,	%i3,	%g4
	ldd	[%l7 + 0x48],	%f30
	movrlz	%g2,	%g7,	%g6
	srlx	%i0,	%l6,	%l0
	movrgez	%o7,	0x265,	%i7
	edge8n	%i1,	%o2,	%o3
	movvc	%icc,	%i5,	%o6
	smul	%l5,	%l2,	%i2
	fcmple16	%f20,	%f30,	%o5
	mulscc	%o4,	%g3,	%o1
	fnors	%f17,	%f19,	%f21
	srax	%g5,	0x15,	%l4
	edge8n	%l3,	%i6,	%l1
	fmovdpos	%icc,	%f13,	%f17
	xor	%i4,	%g1,	%i3
	fmovdg	%xcc,	%f13,	%f9
	udivcc	%g4,	0x1DD9,	%g2
	fpsub16s	%f1,	%f30,	%f9
	sllx	%o0,	0x01,	%g6
	stx	%g7,	[%l7 + 0x10]
	alignaddrl	%l6,	%l0,	%i0
	edge16ln	%o7,	%i7,	%i1
	ldsb	[%l7 + 0x10],	%o2
	mova	%xcc,	%o3,	%i5
	movne	%icc,	%l5,	%l2
	fmovrde	%i2,	%f8,	%f24
	srax	%o6,	%o4,	%o5
	st	%f12,	[%l7 + 0x14]
	fmovrslz	%o1,	%f28,	%f18
	edge32n	%g5,	%l4,	%g3
	umulcc	%l3,	%i6,	%l1
	movle	%xcc,	%g1,	%i4
	nop
	set	0x69, %l2
	ldub	[%l7 + %l2],	%i3
	sllx	%g4,	0x1E,	%g2
	fabss	%f9,	%f25
	fxor	%f10,	%f16,	%f12
	movvc	%xcc,	%o0,	%g7
	fmovsneg	%icc,	%f25,	%f5
	ldsh	[%l7 + 0x3A],	%g6
	subcc	%l6,	0x14CA,	%i0
	subc	%o7,	0x0401,	%l0
	xnorcc	%i7,	%o2,	%i1
	fpadd32s	%f13,	%f22,	%f18
	sdiv	%o3,	0x168A,	%i5
	movrlz	%l2,	%l5,	%o6
	fandnot2	%f14,	%f24,	%f24
	fmovsgu	%xcc,	%f22,	%f17
	sdivcc	%i2,	0x04DB,	%o5
	fors	%f7,	%f0,	%f23
	sdiv	%o4,	0x1A0F,	%g5
	stx	%o1,	[%l7 + 0x60]
	fpsub32	%f12,	%f14,	%f6
	move	%xcc,	%g3,	%l4
	fmovdge	%icc,	%f24,	%f14
	fmovdl	%icc,	%f23,	%f21
	ldsb	[%l7 + 0x75],	%i6
	movl	%xcc,	%l3,	%l1
	fmovsl	%icc,	%f26,	%f12
	smulcc	%i4,	%g1,	%i3
	smul	%g2,	0x0807,	%o0
	move	%icc,	%g4,	%g6
	udivcc	%g7,	0x1C55,	%i0
	movvs	%icc,	%o7,	%l0
	fmovsg	%icc,	%f28,	%f29
	fcmped	%fcc0,	%f24,	%f30
	movrlez	%i7,	%o2,	%i1
	edge8n	%o3,	%i5,	%l2
	lduh	[%l7 + 0x20],	%l5
	fmovdn	%icc,	%f12,	%f9
	xorcc	%l6,	%o6,	%i2
	array8	%o5,	%g5,	%o1
	sth	%o4,	[%l7 + 0x52]
	fmovd	%f26,	%f2
	fmul8x16au	%f6,	%f29,	%f8
	movn	%icc,	%l4,	%g3
	movcc	%xcc,	%i6,	%l3
	sra	%i4,	%g1,	%i3
	smulcc	%g2,	%l1,	%o0
	udivx	%g6,	0x03F3,	%g7
	edge8n	%g4,	%o7,	%i0
	and	%l0,	0x18F7,	%o2
	sub	%i1,	%i7,	%i5
	sethi	0x0FA5,	%o3
	fnot2	%f18,	%f0
	subcc	%l5,	%l6,	%l2
	movpos	%icc,	%i2,	%o5
	movre	%o6,	%o1,	%o4
	fmovrdlez	%l4,	%f10,	%f20
	sub	%g3,	%i6,	%g5
	pdist	%f12,	%f16,	%f16
	addc	%l3,	0x0CC8,	%g1
	orn	%i4,	0x0CAA,	%g2
	udivx	%i3,	0x1730,	%o0
	movrgz	%g6,	0x0F5,	%l1
	smulcc	%g4,	%g7,	%o7
	fmovsge	%icc,	%f10,	%f27
	srlx	%l0,	%o2,	%i0
	fmovdleu	%icc,	%f28,	%f18
	movvc	%xcc,	%i7,	%i5
	nop
	set	0x60, %o7
	ldx	[%l7 + %o7],	%o3
	fnot1s	%f31,	%f8
	ldub	[%l7 + 0x40],	%i1
	sethi	0x04FA,	%l5
	fones	%f3
	fmul8x16al	%f23,	%f27,	%f28
	movgu	%icc,	%l6,	%i2
	smul	%l2,	%o6,	%o5
	sra	%o4,	0x0C,	%o1
	smul	%l4,	%i6,	%g3
	movrne	%g5,	0x23D,	%g1
	movrlez	%i4,	0x310,	%l3
	std	%f22,	[%l7 + 0x70]
	fpsub32s	%f13,	%f5,	%f18
	sethi	0x1D03,	%g2
	alignaddr	%o0,	%i3,	%l1
	fexpand	%f2,	%f4
	edge8	%g4,	%g7,	%g6
	movre	%o7,	0x3A4,	%l0
	srlx	%i0,	0x00,	%i7
	ldsh	[%l7 + 0x66],	%o2
	movn	%icc,	%o3,	%i1
	fcmple16	%f18,	%f24,	%i5
	andncc	%l6,	%i2,	%l2
	array16	%l5,	%o5,	%o6
	edge8l	%o1,	%o4,	%i6
	andn	%l4,	%g3,	%g1
	move	%icc,	%i4,	%l3
	fandnot2	%f10,	%f28,	%f22
	movneg	%xcc,	%g5,	%g2
	edge16ln	%o0,	%i3,	%g4
	fsrc1s	%f8,	%f27
	udivcc	%l1,	0x0B69,	%g6
	fmovdne	%icc,	%f21,	%f29
	array32	%g7,	%o7,	%i0
	nop
	set	0x20, %i3
	sth	%l0,	[%l7 + %i3]
	and	%i7,	%o3,	%i1
	sethi	0x1FB2,	%o2
	edge32l	%l6,	%i5,	%i2
	edge8l	%l2,	%o5,	%l5
	edge16n	%o6,	%o1,	%o4
	sth	%l4,	[%l7 + 0x18]
	sdiv	%i6,	0x1114,	%g3
	fnegd	%f8,	%f18
	lduh	[%l7 + 0x08],	%g1
	fmovsn	%icc,	%f23,	%f10
	ldsb	[%l7 + 0x5D],	%l3
	stx	%g5,	[%l7 + 0x70]
	st	%f12,	[%l7 + 0x58]
	udiv	%i4,	0x0670,	%g2
	udivcc	%i3,	0x1700,	%o0
	movrlez	%l1,	0x203,	%g6
	ldd	[%l7 + 0x48],	%g6
	edge8ln	%g4,	%o7,	%l0
	orncc	%i7,	%o3,	%i1
	andcc	%o2,	0x051C,	%l6
	fcmpne32	%f24,	%f18,	%i5
	umulcc	%i0,	0x1CDA,	%l2
	udivx	%o5,	0x1FC9,	%i2
	fmul8x16au	%f2,	%f16,	%f14
	movvs	%icc,	%o6,	%o1
	sir	0x07CB
	orncc	%o4,	%l4,	%l5
	ldsw	[%l7 + 0x68],	%i6
	addc	%g3,	%l3,	%g5
	udiv	%g1,	0x177B,	%g2
	ldsw	[%l7 + 0x10],	%i4
	fxors	%f31,	%f11,	%f5
	movgu	%xcc,	%i3,	%l1
	addc	%o0,	0x0555,	%g7
	popc	%g6,	%g4
	std	%f26,	[%l7 + 0x48]
	movrgez	%l0,	0x2C1,	%o7
	fabsd	%f4,	%f24
	ldsb	[%l7 + 0x2D],	%i7
	fsrc1	%f26,	%f4
	fmovdcs	%icc,	%f20,	%f18
	movpos	%icc,	%o3,	%i1
	udivcc	%o2,	0x1F67,	%l6
	edge8ln	%i5,	%i0,	%l2
	move	%icc,	%i2,	%o6
	movrgz	%o5,	%o1,	%l4
	movgu	%icc,	%l5,	%o4
	movrgez	%i6,	%g3,	%l3
	xorcc	%g5,	%g2,	%g1
	fxors	%f20,	%f16,	%f20
	sth	%i4,	[%l7 + 0x50]
	movl	%xcc,	%l1,	%o0
	fcmpne32	%f30,	%f24,	%g7
	udivcc	%i3,	0x1942,	%g4
	stx	%g6,	[%l7 + 0x68]
	movcc	%xcc,	%o7,	%i7
	array32	%l0,	%i1,	%o3
	edge32l	%l6,	%i5,	%o2
	stw	%l2,	[%l7 + 0x34]
	srlx	%i0,	0x0B,	%o6
	faligndata	%f4,	%f20,	%f0
	srl	%i2,	%o1,	%l4
	ldd	[%l7 + 0x58],	%f4
	fexpand	%f5,	%f30
	umul	%l5,	%o5,	%o4
	movrne	%g3,	0x378,	%i6
	srlx	%g5,	%l3,	%g2
	fmovsn	%xcc,	%f13,	%f18
	subc	%i4,	%g1,	%o0
	addcc	%l1,	0x1337,	%g7
	array16	%i3,	%g6,	%o7
	mulscc	%i7,	%g4,	%i1
	subccc	%o3,	0x14EA,	%l6
	smul	%i5,	0x09FA,	%o2
	movrgez	%l0,	%i0,	%l2
	xorcc	%o6,	%o1,	%l4
	xnorcc	%l5,	0x069D,	%i2
	movl	%xcc,	%o5,	%g3
	nop
	set	0x3E, %i7
	sth	%i6,	[%l7 + %i7]
	ldub	[%l7 + 0x53],	%g5
	ldd	[%l7 + 0x30],	%f28
	alignaddrl	%o4,	%l3,	%i4
	movn	%xcc,	%g2,	%o0
	movpos	%xcc,	%g1,	%g7
	fcmps	%fcc3,	%f22,	%f19
	fmovrse	%l1,	%f18,	%f22
	movn	%icc,	%i3,	%g6
	array8	%i7,	%g4,	%i1
	addcc	%o7,	%l6,	%o3
	move	%xcc,	%i5,	%o2
	alignaddrl	%l0,	%i0,	%o6
	addccc	%o1,	%l2,	%l4
	xnorcc	%i2,	0x19E9,	%l5
	fxors	%f18,	%f6,	%f25
	fmovdle	%xcc,	%f22,	%f9
	addc	%g3,	0x068F,	%o5
	smulcc	%i6,	0x003D,	%g5
	ldd	[%l7 + 0x18],	%f20
	mulx	%o4,	0x1E41,	%i4
	for	%f2,	%f12,	%f12
	fands	%f6,	%f26,	%f27
	smul	%g2,	0x1024,	%o0
	movrne	%l3,	0x176,	%g7
	save %l1, %g1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i7,	0x0CE,	%g4
	nop
	set	0x0B, %g7
	ldub	[%l7 + %g7],	%i1
	lduw	[%l7 + 0x48],	%g6
	udivx	%l6,	0x10F3,	%o7
	mova	%icc,	%o3,	%o2
	fcmpne32	%f12,	%f0,	%i5
	array8	%l0,	%i0,	%o6
	movne	%icc,	%l2,	%o1
	movl	%xcc,	%i2,	%l4
	movrgz	%g3,	0x22F,	%l5
	fpadd16s	%f10,	%f22,	%f17
	add	%i6,	0x11BA,	%o5
	subcc	%o4,	0x1B93,	%i4
	move	%icc,	%g5,	%o0
	movgu	%icc,	%g2,	%g7
	edge8ln	%l1,	%l3,	%i3
	and	%i7,	%g4,	%i1
	movrlez	%g1,	0x255,	%g6
	movne	%icc,	%l6,	%o3
	fmovdleu	%xcc,	%f7,	%f11
	mova	%xcc,	%o7,	%i5
	mulscc	%o2,	%l0,	%o6
	movrne	%l2,	0x1E0,	%i0
	orncc	%i2,	%o1,	%l4
	addc	%g3,	%l5,	%o5
	fand	%f18,	%f28,	%f16
	movvs	%xcc,	%i6,	%i4
	fnegd	%f26,	%f20
	sethi	0x0959,	%o4
	edge8n	%o0,	%g2,	%g7
	movne	%icc,	%g5,	%l3
	orncc	%i3,	0x1CD5,	%l1
	ldsh	[%l7 + 0x4C],	%g4
	movre	%i7,	0x38C,	%g1
	movne	%xcc,	%g6,	%l6
	edge16n	%o3,	%i1,	%i5
	move	%icc,	%o2,	%l0
	fmovdleu	%icc,	%f21,	%f22
	nop
	set	0x18, %l6
	stx	%o7,	[%l7 + %l6]
	movcs	%icc,	%o6,	%i0
	fcmpeq32	%f4,	%f22,	%l2
	edge16	%o1,	%l4,	%i2
	ldsw	[%l7 + 0x10],	%g3
	lduw	[%l7 + 0x20],	%l5
	fmovrdlz	%i6,	%f2,	%f20
	edge32n	%i4,	%o4,	%o5
	ldsb	[%l7 + 0x6B],	%o0
	orn	%g2,	%g5,	%g7
	movn	%xcc,	%l3,	%l1
	save %i3, 0x1677, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x7C],	%i7
	movre	%g1,	0x3DD,	%g6
	sub	%o3,	0x128F,	%l6
	mulscc	%i5,	0x057C,	%o2
	array16	%i1,	%o7,	%l0
	udiv	%i0,	0x1F99,	%o6
	subccc	%l2,	%o1,	%l4
	fnot2s	%f28,	%f17
	subcc	%g3,	%l5,	%i6
	fornot2s	%f16,	%f12,	%f10
	nop
	set	0x68, %o6
	std	%f2,	[%l7 + %o6]
	ldx	[%l7 + 0x18],	%i4
	array32	%i2,	%o5,	%o0
	fsrc2	%f24,	%f8
	stx	%o4,	[%l7 + 0x28]
	movl	%xcc,	%g2,	%g7
	andncc	%g5,	%l1,	%l3
	stb	%g4,	[%l7 + 0x69]
	movge	%xcc,	%i3,	%g1
	fmovdcc	%icc,	%f31,	%f18
	movl	%icc,	%g6,	%i7
	srax	%l6,	%i5,	%o3
	sir	0x189C
	ld	[%l7 + 0x14],	%f31
	sllx	%o2,	%i1,	%l0
	st	%f7,	[%l7 + 0x40]
	fmovdpos	%xcc,	%f2,	%f22
	udivcc	%o7,	0x12AD,	%i0
	movrlz	%o6,	%o1,	%l2
	sth	%l4,	[%l7 + 0x14]
	fmovrdlez	%l5,	%f26,	%f22
	andn	%g3,	0x007D,	%i6
	smulcc	%i4,	%o5,	%o0
	st	%f18,	[%l7 + 0x18]
	movle	%xcc,	%i2,	%g2
	fabsd	%f6,	%f28
	movcs	%xcc,	%o4,	%g5
	movg	%icc,	%l1,	%g7
	movrlez	%l3,	0x396,	%g4
	edge8	%i3,	%g1,	%g6
	edge16n	%l6,	%i5,	%i7
	fpack16	%f10,	%f27
	andncc	%o2,	%o3,	%i1
	sra	%o7,	%l0,	%i0
	udiv	%o6,	0x11D9,	%o1
	ldsb	[%l7 + 0x10],	%l2
	popc	%l4,	%l5
	sth	%i6,	[%l7 + 0x72]
	fnands	%f9,	%f9,	%f6
	fnot1	%f28,	%f28
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	umulcc	%o0,	%i4,	%g2
	movg	%xcc,	%o4,	%g5
	stw	%i2,	[%l7 + 0x48]
	array32	%g7,	%l1,	%g4
	srl	%i3,	%g1,	%g6
	ldsb	[%l7 + 0x33],	%l3
	save %i5, %i7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o3,	%l6,	%i1
	movne	%icc,	%o7,	%l0
	xorcc	%o6,	%o1,	%i0
	nop
	set	0x52, %o5
	lduh	[%l7 + %o5],	%l2
	fmovs	%f7,	%f29
	sllx	%l4,	%l5,	%g3
	add	%i6,	0x0C6D,	%o5
	udivcc	%i4,	0x18CD,	%g2
	sethi	0x1095,	%o4
	edge8ln	%o0,	%g5,	%i2
	movn	%icc,	%l1,	%g4
	movneg	%xcc,	%g7,	%i3
	movrgez	%g1,	0x0A3,	%l3
	lduh	[%l7 + 0x6E],	%i5
	add	%g6,	%o2,	%i7
	movpos	%icc,	%o3,	%l6
	sra	%o7,	%i1,	%o6
	fandnot2s	%f5,	%f14,	%f24
	movcc	%icc,	%o1,	%l0
	edge16l	%l2,	%l4,	%i0
	fones	%f16
	movrlz	%l5,	0x01B,	%i6
	array8	%o5,	%i4,	%g3
	orn	%o4,	0x0AC8,	%o0
	xorcc	%g5,	0x01CE,	%g2
	fexpand	%f6,	%f30
	subc	%i2,	%g4,	%l1
	fnot2s	%f2,	%f13
	add	%g7,	0x1B47,	%i3
	st	%f13,	[%l7 + 0x10]
	sdiv	%g1,	0x0B17,	%l3
	movneg	%icc,	%g6,	%i5
	movrgez	%i7,	%o3,	%o2
	mulx	%l6,	0x13CA,	%i1
	ldd	[%l7 + 0x78],	%o6
	xnor	%o7,	0x112F,	%o1
	xor	%l0,	0x1A2C,	%l2
	fmovdge	%icc,	%f6,	%f21
	movvs	%icc,	%l4,	%i0
	edge8	%l5,	%o5,	%i4
	fmuld8ulx16	%f2,	%f9,	%f18
	popc	0x1AF9,	%i6
	ldd	[%l7 + 0x78],	%f6
	movle	%xcc,	%g3,	%o4
	fcmpd	%fcc3,	%f12,	%f26
	fmovdvc	%xcc,	%f15,	%f16
	sir	0x15D2
	ldsh	[%l7 + 0x12],	%o0
	movneg	%icc,	%g2,	%g5
	nop
	set	0x60, %i4
	ldsh	[%l7 + %i4],	%i2
	fnand	%f12,	%f10,	%f2
	movrgez	%l1,	%g4,	%i3
	movrgz	%g7,	%l3,	%g6
	edge32n	%i5,	%i7,	%g1
	fmovrdgez	%o2,	%f14,	%f22
	fmovrse	%o3,	%f2,	%f5
	sll	%l6,	%i1,	%o6
	st	%f6,	[%l7 + 0x60]
	fpackfix	%f8,	%f1
	ld	[%l7 + 0x10],	%f2
	movre	%o7,	0x3C1,	%o1
	stw	%l0,	[%l7 + 0x1C]
	movrlez	%l2,	%i0,	%l5
	movrlez	%l4,	0x39B,	%i4
	smul	%i6,	0x07EA,	%g3
	movne	%xcc,	%o5,	%o4
	movge	%icc,	%g2,	%o0
	alignaddr	%g5,	%l1,	%i2
	ldsb	[%l7 + 0x27],	%g4
	edge16n	%i3,	%l3,	%g6
	orn	%i5,	0x160D,	%g7
	fmovrse	%g1,	%f8,	%f15
	addc	%i7,	%o2,	%l6
	edge16n	%o3,	%o6,	%o7
	stw	%o1,	[%l7 + 0x40]
	fornot1	%f0,	%f22,	%f22
	mulscc	%i1,	%l0,	%l2
	sll	%l5,	0x13,	%l4
	st	%f9,	[%l7 + 0x6C]
	move	%xcc,	%i4,	%i6
	alignaddrl	%g3,	%o5,	%i0
	array32	%o4,	%o0,	%g2
	edge16	%g5,	%l1,	%g4
	fpadd32	%f24,	%f0,	%f12
	edge8l	%i2,	%i3,	%g6
	ldsb	[%l7 + 0x35],	%i5
	andn	%l3,	%g7,	%i7
	srax	%o2,	%l6,	%o3
	array16	%o6,	%g1,	%o7
	edge8ln	%o1,	%l0,	%i1
	restore %l2, %l4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i4,	%i6,	%o5
	movge	%xcc,	%g3,	%o4
	nop
	set	0x70, %o3
	ldsw	[%l7 + %o3],	%o0
	movneg	%icc,	%g2,	%i0
	fmovdvs	%xcc,	%f10,	%f6
	movrgez	%l1,	%g5,	%i2
	movcs	%icc,	%i3,	%g6
	fmovdgu	%xcc,	%f14,	%f17
	ldd	[%l7 + 0x58],	%f30
	movne	%xcc,	%g4,	%l3
	fmuld8ulx16	%f18,	%f10,	%f20
	movneg	%xcc,	%g7,	%i7
	mulx	%o2,	0x127D,	%l6
	edge8	%i5,	%o3,	%g1
	movleu	%icc,	%o7,	%o1
	fandnot2	%f18,	%f14,	%f0
	movcc	%xcc,	%l0,	%o6
	sra	%l2,	0x0C,	%l4
	fmovrsne	%l5,	%f10,	%f15
	srl	%i4,	%i6,	%o5
	movge	%xcc,	%i1,	%g3
	fandnot1	%f14,	%f20,	%f30
	movge	%icc,	%o0,	%o4
	fnand	%f10,	%f28,	%f8
	stw	%g2,	[%l7 + 0x2C]
	xnor	%l1,	0x035F,	%g5
	umulcc	%i2,	0x1F30,	%i3
	move	%xcc,	%i0,	%g4
	movl	%xcc,	%l3,	%g7
	movre	%g6,	%o2,	%l6
	move	%xcc,	%i5,	%o3
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%g0
	sll	%o7,	0x1E,	%i7
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	udivcc	%l2,	0x06FA,	%l4
	movgu	%xcc,	%i4,	%l5
	addcc	%o5,	0x01A5,	%i6
	fmuld8sux16	%f23,	%f22,	%f20
	movrne	%i1,	%o0,	%o4
	siam	0x0
	udivx	%g3,	0x1506,	%l1
	edge8n	%g5,	%g2,	%i2
	fmovscs	%icc,	%f6,	%f20
	fandnot2s	%f3,	%f15,	%f27
	movrlez	%i0,	0x16B,	%i3
	movgu	%xcc,	%g4,	%g7
	st	%f6,	[%l7 + 0x60]
	fmovrsgz	%g6,	%f11,	%f8
	stb	%l3,	[%l7 + 0x5D]
	movg	%xcc,	%l6,	%o2
	sdiv	%o3,	0x011D,	%i5
	subcc	%o7,	0x0001,	%g1
	ldsw	[%l7 + 0x6C],	%i7
	faligndata	%f6,	%f24,	%f12
	xnor	%l0,	0x1A90,	%o6
	edge8n	%o1,	%l2,	%i4
	mulscc	%l5,	0x09AA,	%l4
	stx	%i6,	[%l7 + 0x78]
	addcc	%o5,	%o0,	%i1
	ldsb	[%l7 + 0x66],	%g3
	edge8	%l1,	%g5,	%g2
	fpackfix	%f22,	%f24
	movvc	%xcc,	%o4,	%i2
	array16	%i3,	%i0,	%g7
	movgu	%xcc,	%g6,	%l3
	udivx	%l6,	0x132A,	%o2
	sra	%o3,	0x12,	%i5
	alignaddrl	%o7,	%g1,	%g4
	movleu	%xcc,	%l0,	%i7
	edge16ln	%o6,	%o1,	%i4
	umul	%l2,	%l4,	%l5
	mulx	%i6,	0x0041,	%o0
	ldd	[%l7 + 0x20],	%o4
	xorcc	%g3,	%i1,	%l1
	fnand	%f8,	%f10,	%f24
	popc	0x0868,	%g5
	srl	%g2,	0x1B,	%i2
	popc	%i3,	%i0
	fpack16	%f28,	%f31
	movpos	%icc,	%o4,	%g7
	andcc	%g6,	0x1E8F,	%l3
	xnor	%o2,	%l6,	%o3
	xnorcc	%i5,	%o7,	%g4
	nop
	set	0x40, %o2
	lduw	[%l7 + %o2],	%l0
	ldsw	[%l7 + 0x68],	%g1
	movcc	%icc,	%o6,	%i7
	ldd	[%l7 + 0x18],	%i4
	movrne	%l2,	%o1,	%l4
	sll	%i6,	%o0,	%l5
	movvc	%xcc,	%o5,	%i1
	edge32l	%g3,	%l1,	%g5
	stb	%g2,	[%l7 + 0x25]
	sdiv	%i2,	0x19CC,	%i3
	sub	%i0,	0x1047,	%o4
	std	%f0,	[%l7 + 0x78]
	array32	%g6,	%g7,	%o2
	andcc	%l3,	0x1834,	%l6
	smulcc	%i5,	%o3,	%o7
	alignaddr	%l0,	%g1,	%g4
	fmovsa	%xcc,	%f20,	%f29
	fabss	%f29,	%f15
	movrlz	%o6,	%i4,	%i7
	fmul8sux16	%f26,	%f22,	%f30
	fmovsl	%icc,	%f21,	%f30
	sllx	%o1,	0x11,	%l2
	fmovrdlez	%i6,	%f16,	%f10
	ldsh	[%l7 + 0x24],	%o0
	stw	%l5,	[%l7 + 0x50]
	lduw	[%l7 + 0x30],	%o5
	stw	%l4,	[%l7 + 0x74]
	edge8	%g3,	%l1,	%i1
	fmul8x16al	%f2,	%f2,	%f4
	movre	%g5,	0x03D,	%i2
	ldx	[%l7 + 0x20],	%g2
	edge32n	%i3,	%o4,	%g6
	subccc	%i0,	%g7,	%o2
	ldx	[%l7 + 0x48],	%l3
	sethi	0x15CA,	%l6
	ldsb	[%l7 + 0x44],	%o3
	move	%icc,	%i5,	%o7
	subc	%g1,	0x0FF5,	%g4
	movge	%icc,	%l0,	%o6
	sll	%i7,	0x14,	%i4
	fmovsg	%xcc,	%f20,	%f26
	lduh	[%l7 + 0x20],	%l2
	move	%xcc,	%o1,	%o0
	ld	[%l7 + 0x6C],	%f24
	fmovscc	%xcc,	%f16,	%f19
	orn	%l5,	%o5,	%i6
	fmovde	%icc,	%f2,	%f17
	lduw	[%l7 + 0x18],	%g3
	sethi	0x134A,	%l1
	udiv	%l4,	0x0B28,	%g5
	udivx	%i2,	0x0119,	%g2
	fmovrslez	%i3,	%f17,	%f26
	fornot2s	%f24,	%f7,	%f23
	add	%i1,	0x18DC,	%g6
	xor	%i0,	%o4,	%o2
	srax	%l3,	0x1C,	%g7
	fcmpes	%fcc2,	%f2,	%f16
	movrlz	%l6,	0x241,	%i5
	fmovdcs	%icc,	%f11,	%f15
	sethi	0x0FDB,	%o7
	fcmpne32	%f4,	%f30,	%g1
	fmovrsgz	%o3,	%f23,	%f26
	ldd	[%l7 + 0x40],	%f2
	xorcc	%g4,	0x1B6F,	%l0
	umul	%o6,	%i7,	%l2
	subccc	%i4,	0x0252,	%o0
	mova	%xcc,	%l5,	%o5
	movvc	%icc,	%i6,	%o1
	sethi	0x1356,	%l1
	for	%f10,	%f20,	%f26
	movrgez	%g3,	0x31A,	%g5
	ldd	[%l7 + 0x18],	%i2
	movrlz	%g2,	0x2B3,	%l4
	xnorcc	%i1,	0x07C2,	%g6
	addcc	%i0,	%o4,	%i3
	movre	%o2,	%g7,	%l6
	orncc	%l3,	%o7,	%i5
	stw	%o3,	[%l7 + 0x24]
	edge16ln	%g1,	%l0,	%g4
	edge32l	%i7,	%l2,	%o6
	edge16n	%i4,	%l5,	%o5
	movl	%xcc,	%i6,	%o0
	fcmpeq16	%f4,	%f30,	%o1
	mulx	%l1,	0x1DAF,	%g3
	ldsh	[%l7 + 0x76],	%g5
	fmovrslz	%g2,	%f28,	%f11
	fmovsg	%xcc,	%f9,	%f14
	addc	%i2,	%l4,	%i1
	umulcc	%i0,	%o4,	%g6
	fpadd16s	%f25,	%f20,	%f1
	edge8n	%o2,	%i3,	%g7
	addc	%l3,	0x0655,	%l6
	movvc	%xcc,	%o7,	%i5
	fexpand	%f23,	%f6
	movneg	%icc,	%o3,	%l0
	fandnot2	%f14,	%f26,	%f6
	edge32n	%g1,	%g4,	%l2
	xorcc	%i7,	0x1116,	%i4
	umul	%l5,	%o6,	%o5
	sir	0x1135
	fmovrdgez	%o0,	%f4,	%f10
	edge32	%o1,	%l1,	%i6
	smul	%g5,	%g3,	%g2
	lduh	[%l7 + 0x56],	%l4
	fcmpgt32	%f28,	%f16,	%i1
	mulx	%i2,	%i0,	%o4
	mulscc	%o2,	0x14B6,	%g6
	fmovsvc	%xcc,	%f15,	%f19
	fnegs	%f11,	%f30
	sllx	%i3,	%l3,	%l6
	nop
	set	0x70, %l5
	ldx	[%l7 + %l5],	%o7
	udiv	%i5,	0x11C4,	%g7
	edge8l	%l0,	%g1,	%g4
	ldx	[%l7 + 0x40],	%o3
	std	%f16,	[%l7 + 0x78]
	sllx	%i7,	0x06,	%i4
	alignaddr	%l2,	%l5,	%o5
	fornot2	%f6,	%f14,	%f20
	movvc	%xcc,	%o6,	%o1
	fmovsgu	%xcc,	%f14,	%f14
	ld	[%l7 + 0x6C],	%f18
	xor	%o0,	0x0ED2,	%l1
	addc	%g5,	0x16BF,	%i6
	edge32ln	%g3,	%g2,	%l4
	edge32n	%i2,	%i0,	%o4
	array16	%o2,	%g6,	%i3
	movrlez	%l3,	0x3C1,	%l6
	fpsub32s	%f3,	%f5,	%f26
	save %o7, 0x1C29, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %i1, %l0, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f2,	%f26,	%g4
	orncc	%o3,	0x1BD0,	%i7
	smulcc	%i4,	%l2,	%l5
	fcmped	%fcc0,	%f28,	%f28
	subccc	%o5,	0x1AFC,	%g1
	fandnot1	%f0,	%f20,	%f12
	movrlz	%o1,	%o0,	%l1
	ldsh	[%l7 + 0x68],	%g5
	stw	%i6,	[%l7 + 0x2C]
	movcs	%xcc,	%o6,	%g2
	edge32	%g3,	%l4,	%i0
	add	%o4,	0x1393,	%i2
	xnor	%g6,	%i3,	%o2
	edge32	%l6,	%o7,	%l3
	movcs	%xcc,	%i1,	%i5
	movcc	%xcc,	%l0,	%g4
	restore %o3, %i7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%l2,	%l5
	sir	0x1FC2
	addccc	%g7,	%g1,	%o5
	movle	%xcc,	%o0,	%l1
	fmovdvs	%xcc,	%f26,	%f30
	edge32	%g5,	%o1,	%o6
	edge32n	%i6,	%g3,	%l4
	fmovdg	%xcc,	%f14,	%f13
	fpadd32s	%f21,	%f26,	%f15
	fornot2	%f16,	%f22,	%f18
	popc	0x11BF,	%g2
	smulcc	%o4,	%i2,	%i0
	fmovda	%icc,	%f18,	%f9
	sra	%g6,	%o2,	%l6
	fmovde	%xcc,	%f16,	%f4
	sir	0x14FD
	srlx	%o7,	0x00,	%l3
	sub	%i3,	%i5,	%l0
	movcs	%icc,	%g4,	%i1
	addc	%i7,	%i4,	%o3
	srax	%l5,	0x0D,	%l2
	udivcc	%g7,	0x047E,	%g1
	ldsh	[%l7 + 0x3A],	%o5
	fmovde	%icc,	%f25,	%f7
	array8	%l1,	%g5,	%o1
	fcmpes	%fcc3,	%f14,	%f18
	subc	%o0,	%o6,	%i6
	sllx	%l4,	0x0C,	%g2
	movrlz	%g3,	%i2,	%i0
	st	%f28,	[%l7 + 0x0C]
	xnor	%g6,	0x00A6,	%o2
	movrgez	%l6,	%o4,	%l3
	sir	0x127F
	fmovdn	%icc,	%f25,	%f4
	udivx	%i3,	0x031E,	%o7
	subc	%i5,	0x1A3E,	%g4
	ldsh	[%l7 + 0x16],	%l0
	edge8l	%i1,	%i4,	%o3
	fmovsge	%icc,	%f18,	%f26
	smul	%l5,	0x07E7,	%i7
	lduw	[%l7 + 0x10],	%g7
	movn	%icc,	%l2,	%g1
	bshuffle	%f4,	%f4,	%f14
	srax	%o5,	%l1,	%g5
	ldd	[%l7 + 0x68],	%f12
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	and	%l4,	%i6,	%g2
	addcc	%i2,	0x102C,	%g3
	movrgz	%i0,	0x24A,	%g6
	fmovsvc	%icc,	%f27,	%f19
	move	%icc,	%l6,	%o2
	edge8l	%o4,	%l3,	%o7
	movl	%icc,	%i3,	%i5
	edge16	%l0,	%i1,	%g4
	movle	%icc,	%i4,	%o3
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%f18
	fmovsgu	%icc,	%f28,	%f20
	fornot1	%f2,	%f30,	%f0
	edge32	%l5,	%g7,	%l2
	edge16	%g1,	%i7,	%o5
	array32	%g5,	%l1,	%o6
	orn	%o1,	0x078C,	%o0
	movgu	%icc,	%i6,	%l4
	fmuld8sux16	%f14,	%f20,	%f8
	ldd	[%l7 + 0x58],	%f16
	siam	0x0
	ldd	[%l7 + 0x18],	%g2
	edge8n	%i2,	%g3,	%i0
	fmovsne	%xcc,	%f6,	%f21
	fmovsneg	%xcc,	%f15,	%f15
	movrlez	%g6,	%o2,	%o4
	sllx	%l6,	0x14,	%o7
	addcc	%i3,	0x0198,	%l3
	mova	%icc,	%l0,	%i1
	edge16n	%i5,	%g4,	%o3
	fxnors	%f30,	%f5,	%f25
	udiv	%l5,	0x14B8,	%i4
	subc	%g7,	%g1,	%i7
	std	%f8,	[%l7 + 0x60]
	sdivcc	%l2,	0x175D,	%o5
	fandnot2	%f0,	%f12,	%f20
	fcmpes	%fcc3,	%f4,	%f6
	movgu	%xcc,	%l1,	%o6
	movne	%xcc,	%g5,	%o0
	fpadd16	%f10,	%f10,	%f22
	edge32	%i6,	%l4,	%g2
	ldsb	[%l7 + 0x12],	%o1
	movge	%icc,	%i2,	%i0
	array8	%g6,	%o2,	%o4
	restore %g3, 0x10B1, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i3,	0x09AF,	%o7
	edge8n	%l0,	%i1,	%i5
	edge32n	%l3,	%g4,	%o3
	andcc	%l5,	%g7,	%g1
	movle	%xcc,	%i7,	%i4
	edge32	%o5,	%l2,	%l1
	std	%f24,	[%l7 + 0x28]
	fcmpd	%fcc3,	%f2,	%f24
	movcc	%icc,	%o6,	%g5
	stb	%o0,	[%l7 + 0x55]
	umulcc	%i6,	%l4,	%o1
	fmovsn	%xcc,	%f13,	%f4
	movrne	%g2,	0x1A8,	%i0
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%f22
	fmovrdgez	%g6,	%f16,	%f24
	movle	%xcc,	%i2,	%o4
	fzeros	%f28
	fcmpeq32	%f16,	%f14,	%g3
	or	%o2,	%i3,	%o7
	umulcc	%l6,	0x1652,	%l0
	fnand	%f20,	%f24,	%f2
	alignaddrl	%i5,	%i1,	%g4
	sll	%l3,	0x10,	%o3
	movge	%xcc,	%l5,	%g7
	fmovdneg	%icc,	%f10,	%f11
	sdiv	%g1,	0x1794,	%i4
	fcmpne32	%f6,	%f22,	%i7
	xor	%o5,	%l2,	%l1
	srlx	%o6,	0x00,	%o0
	array16	%g5,	%l4,	%o1
	save %i6, 0x0CC6, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%i0,	%i2
	movne	%icc,	%g6,	%g3
	fpsub32	%f26,	%f16,	%f16
	sethi	0x1E51,	%o4
	ldub	[%l7 + 0x17],	%o2
	movcs	%icc,	%o7,	%l6
	andncc	%l0,	%i3,	%i1
	umul	%i5,	%l3,	%g4
	edge8ln	%l5,	%o3,	%g7
	fpsub16	%f14,	%f16,	%f14
	edge8ln	%g1,	%i4,	%i7
	fnegd	%f12,	%f6
	movle	%icc,	%o5,	%l1
	edge32	%l2,	%o6,	%o0
	sth	%g5,	[%l7 + 0x08]
	fmovsgu	%xcc,	%f29,	%f23
	addccc	%o1,	0x0F4F,	%i6
	save %l4, 0x1E39, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i2,	0x18CB,	%i0
	edge8	%g3,	%o4,	%o2
	fmul8ulx16	%f18,	%f2,	%f16
	save %g6, 0x1E13, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l6,	%i3,	%l0
	fmovs	%f4,	%f20
	ldsb	[%l7 + 0x53],	%i5
	stb	%i1,	[%l7 + 0x22]
	or	%l3,	0x1F46,	%l5
	popc	0x1099,	%o3
	smul	%g7,	0x00BB,	%g4
	subccc	%g1,	%i4,	%i7
	sth	%l1,	[%l7 + 0x52]
	edge16	%o5,	%o6,	%l2
	movl	%xcc,	%g5,	%o1
	mova	%xcc,	%i6,	%l4
	alignaddrl	%o0,	%i2,	%i0
	sub	%g3,	%g2,	%o2
	fmovdcc	%icc,	%f15,	%f11
	fmovdneg	%icc,	%f4,	%f11
	array32	%g6,	%o7,	%o4
	add	%l6,	%l0,	%i5
	orcc	%i1,	%i3,	%l5
	edge8	%l3,	%g7,	%g4
	array32	%o3,	%i4,	%i7
	lduw	[%l7 + 0x18],	%g1
	udivcc	%o5,	0x0A74,	%o6
	movrgz	%l2,	0x14E,	%l1
	addc	%o1,	%g5,	%i6
	orn	%o0,	0x04D9,	%i2
	orncc	%i0,	0x196C,	%g3
	fmovrsne	%g2,	%f23,	%f7
	array8	%l4,	%o2,	%o7
	array8	%g6,	%o4,	%l0
	fpsub32s	%f16,	%f24,	%f2
	sdivx	%i5,	0x1C84,	%l6
	ldx	[%l7 + 0x10],	%i1
	ld	[%l7 + 0x3C],	%f19
	fmul8x16	%f21,	%f4,	%f6
	udivcc	%i3,	0x068B,	%l3
	sdivcc	%l5,	0x0C48,	%g7
	fmovdpos	%icc,	%f15,	%f25
	fpack32	%f4,	%f28,	%f26
	movvs	%xcc,	%g4,	%o3
	xor	%i7,	0x0A35,	%i4
	movrgez	%o5,	%g1,	%l2
	fmuld8sux16	%f29,	%f22,	%f30
	fmovs	%f9,	%f0
	fmovdl	%xcc,	%f11,	%f10
	movle	%xcc,	%o6,	%l1
	sir	0x1892
	sir	0x10FF
	movre	%g5,	%o1,	%i6
	smulcc	%o0,	0x0C5C,	%i0
	sethi	0x09F2,	%g3
	orncc	%g2,	%l4,	%i2
	ldd	[%l7 + 0x30],	%f22
	movgu	%icc,	%o7,	%g6
	faligndata	%f8,	%f0,	%f2
	movvc	%xcc,	%o2,	%l0
	fabsd	%f26,	%f14
	fmovdleu	%icc,	%f10,	%f5
	movl	%icc,	%i5,	%l6
	nop
	set	0x62, %o4
	ldsb	[%l7 + %o4],	%o4
	sllx	%i1,	0x07,	%i3
	nop
	set	0x20, %l4
	stx	%l5,	[%l7 + %l4]
	movneg	%icc,	%l3,	%g4
	addcc	%g7,	0x1776,	%o3
	movle	%icc,	%i7,	%o5
	movpos	%icc,	%i4,	%g1
	add	%o6,	%l1,	%l2
	stb	%g5,	[%l7 + 0x2B]
	edge32n	%i6,	%o1,	%i0
	pdist	%f26,	%f28,	%f6
	movpos	%icc,	%g3,	%g2
	fabss	%f1,	%f29
	fmovdge	%icc,	%f28,	%f21
	edge32ln	%l4,	%o0,	%i2
	ldsw	[%l7 + 0x3C],	%g6
	fmovrdgz	%o7,	%f0,	%f16
	umul	%o2,	0x03ED,	%i5
	fnor	%f6,	%f30,	%f0
	fmovde	%xcc,	%f17,	%f26
	alignaddr	%l6,	%l0,	%i1
	or	%o4,	%i3,	%l3
	umul	%l5,	%g4,	%g7
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	movn	%xcc,	%o3,	%g1
	edge32n	%i4,	%o6,	%l1
	fabsd	%f2,	%f22
	fmovsne	%xcc,	%f19,	%f14
	udiv	%l2,	0x0621,	%i6
	fnot1	%f28,	%f16
	sllx	%o1,	%i0,	%g5
	umulcc	%g2,	0x144F,	%l4
	fnot2s	%f22,	%f17
	movn	%xcc,	%o0,	%g3
	sub	%g6,	0x18AF,	%i2
	edge32l	%o2,	%i5,	%l6
	move	%xcc,	%l0,	%o7
	nop
	set	0x7A, %i0
	ldub	[%l7 + %i0],	%i1
	ldsh	[%l7 + 0x34],	%o4
	movn	%xcc,	%l3,	%l5
	fmovsvc	%icc,	%f11,	%f9
	lduw	[%l7 + 0x7C],	%i3
	fmovdge	%xcc,	%f23,	%f24
	ldsb	[%l7 + 0x60],	%g7
	ldx	[%l7 + 0x40],	%i7
	movcs	%xcc,	%g4,	%o5
	edge16ln	%o3,	%i4,	%g1
	mova	%xcc,	%l1,	%o6
	movn	%xcc,	%i6,	%o1
	edge8l	%i0,	%g5,	%g2
	ld	[%l7 + 0x38],	%f0
	smulcc	%l4,	%l2,	%o0
	array8	%g3,	%g6,	%i2
	movleu	%xcc,	%o2,	%l6
	sth	%i5,	[%l7 + 0x54]
	movvc	%xcc,	%l0,	%i1
	fnot2	%f20,	%f2
	edge32	%o4,	%l3,	%l5
	ld	[%l7 + 0x4C],	%f15
	st	%f25,	[%l7 + 0x10]
	mulscc	%i3,	%o7,	%g7
	fmovdleu	%icc,	%f4,	%f14
	smulcc	%i7,	0x0864,	%o5
	lduw	[%l7 + 0x74],	%g4
	ld	[%l7 + 0x38],	%f7
	umulcc	%o3,	%i4,	%g1
	sir	0x02BD
	edge32	%o6,	%i6,	%o1
	fpadd32	%f26,	%f6,	%f14
	mulx	%l1,	0x0654,	%g5
	popc	%g2,	%l4
	nop
	set	0x3C, %l0
	ldsh	[%l7 + %l0],	%l2
	ld	[%l7 + 0x24],	%f18
	movrlz	%i0,	0x035,	%o0
	add	%g6,	0x02DD,	%g3
	restore %o2, %i2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l0,	0x0FD9,	%i1
	ldd	[%l7 + 0x58],	%f18
	edge32l	%l6,	%o4,	%l3
	addcc	%i3,	0x05CE,	%l5
	sdiv	%o7,	0x0C91,	%g7
	edge32ln	%o5,	%g4,	%i7
	movrne	%o3,	0x124,	%i4
	edge16l	%g1,	%o6,	%i6
	subcc	%o1,	0x1E4B,	%l1
	movne	%xcc,	%g5,	%g2
	orn	%l4,	0x13E5,	%l2
	umul	%i0,	%g6,	%o0
	ldsb	[%l7 + 0x65],	%o2
	ldub	[%l7 + 0x40],	%g3
	movrlz	%i2,	0x200,	%l0
	stw	%i1,	[%l7 + 0x78]
	movneg	%xcc,	%l6,	%o4
	edge8ln	%l3,	%i5,	%i3
	subcc	%o7,	%l5,	%g7
	ldsb	[%l7 + 0x75],	%o5
	fpackfix	%f0,	%f20
	xnorcc	%i7,	0x07FD,	%g4
	movgu	%xcc,	%o3,	%g1
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	movleu	%xcc,	%o1,	%l1
	mulx	%g5,	0x1F2F,	%l4
	sir	0x1962
	ld	[%l7 + 0x70],	%f16
	lduh	[%l7 + 0x3C],	%l2
	nop
	set	0x0C, %i1
	stw	%i0,	[%l7 + %i1]
	sll	%g2,	0x0F,	%o0
	fnot2s	%f27,	%f1
	andncc	%g6,	%o2,	%g3
	andcc	%l0,	0x12CE,	%i2
	fmovsn	%xcc,	%f20,	%f10
	fmovrdgez	%l6,	%f14,	%f8
	orn	%i1,	0x0D86,	%o4
	nop
	set	0x50, %l3
	stw	%i5,	[%l7 + %l3]
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%f22
	mova	%xcc,	%l3,	%o7
	and	%i3,	0x17F8,	%g7
	sethi	0x1339,	%l5
	sdivcc	%o5,	0x161F,	%g4
	xnorcc	%i7,	%o3,	%g1
	movl	%icc,	%i6,	%i4
	faligndata	%f22,	%f4,	%f18
	movvc	%icc,	%o1,	%o6
	sdiv	%g5,	0x1FF9,	%l4
	ldub	[%l7 + 0x29],	%l2
	movle	%xcc,	%l1,	%g2
	movcs	%icc,	%o0,	%g6
	alignaddrl	%o2,	%i0,	%g3
	fnegd	%f2,	%f16
	sdiv	%l0,	0x074A,	%i2
	edge16ln	%l6,	%i1,	%i5
	edge32	%l3,	%o7,	%i3
	sub	%g7,	%l5,	%o4
	movcs	%xcc,	%o5,	%g4
	xorcc	%i7,	0x15A7,	%g1
	ldub	[%l7 + 0x43],	%o3
	alignaddr	%i4,	%i6,	%o1
	edge32	%o6,	%g5,	%l4
	fmovdvs	%xcc,	%f8,	%f27
	movpos	%xcc,	%l2,	%g2
	movg	%xcc,	%o0,	%g6
	movn	%xcc,	%l1,	%o2
	std	%f18,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%g3
	edge32	%i0,	%l0,	%i2
	array16	%i1,	%l6,	%i5
	orn	%o7,	0x1B05,	%i3
	xnor	%l3,	0x09AB,	%g7
	fnands	%f14,	%f8,	%f27
	alignaddrl	%l5,	%o5,	%g4
	stw	%o4,	[%l7 + 0x68]
	movrgz	%g1,	%o3,	%i4
	movcs	%icc,	%i6,	%o1
	lduw	[%l7 + 0x18],	%o6
	fmovrslez	%g5,	%f24,	%f24
	sdiv	%l4,	0x0736,	%i7
	array8	%g2,	%l2,	%g6
	fsrc2s	%f19,	%f23
	alignaddr	%o0,	%o2,	%l1
	fmovsneg	%xcc,	%f24,	%f7
	edge16ln	%g3,	%i0,	%i2
	sub	%i1,	0x12EA,	%l6
	srl	%i5,	0x07,	%o7
	fpsub16	%f22,	%f12,	%f16
	movre	%i3,	0x2A4,	%l0
	xnorcc	%g7,	%l5,	%l3
	movle	%icc,	%o5,	%g4
	edge8l	%g1,	%o4,	%o3
	sll	%i4,	%o1,	%i6
	movcc	%icc,	%o6,	%l4
	edge8	%g5,	%i7,	%g2
	fmovspos	%icc,	%f16,	%f12
	fmovdle	%icc,	%f12,	%f9
	fands	%f0,	%f27,	%f1
	nop
	set	0x55, %i5
	ldub	[%l7 + %i5],	%l2
	edge8ln	%g6,	%o2,	%o0
	edge8l	%l1,	%g3,	%i2
	umul	%i1,	0x1BE9,	%i0
	movg	%xcc,	%l6,	%i5
	movle	%icc,	%i3,	%l0
	sllx	%g7,	%o7,	%l5
	stw	%o5,	[%l7 + 0x14]
	movvc	%xcc,	%g4,	%g1
	addccc	%l3,	%o4,	%o3
	array8	%i4,	%i6,	%o6
	alignaddrl	%o1,	%g5,	%l4
	fnegd	%f30,	%f26
	array32	%i7,	%l2,	%g2
	array8	%g6,	%o0,	%o2
	stb	%l1,	[%l7 + 0x4B]
	smul	%g3,	%i1,	%i0
	ldsb	[%l7 + 0x4F],	%i2
	ldd	[%l7 + 0x28],	%f2
	edge16	%l6,	%i5,	%l0
	sll	%i3,	%o7,	%g7
	fnegd	%f8,	%f12
	movcs	%icc,	%o5,	%l5
	fcmpes	%fcc0,	%f26,	%f22
	fmovrdlz	%g1,	%f28,	%f28
	movleu	%xcc,	%l3,	%g4
	xor	%o3,	%o4,	%i6
	movne	%xcc,	%i4,	%o1
	edge8	%g5,	%o6,	%l4
	mova	%icc,	%i7,	%g2
	ldd	[%l7 + 0x38],	%l2
	srax	%o0,	%o2,	%g6
	umulcc	%g3,	%l1,	%i1
	edge8n	%i2,	%l6,	%i5
	andcc	%l0,	%i0,	%o7
	stw	%i3,	[%l7 + 0x74]
	move	%icc,	%o5,	%l5
	fmovdle	%xcc,	%f21,	%f14
	fcmpne16	%f0,	%f8,	%g7
	sdivx	%l3,	0x0246,	%g1
	umul	%o3,	0x037E,	%g4
	save %o4, 0x0254, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%i6,	%o1
	edge8l	%g5,	%l4,	%o6
	add	%i7,	%g2,	%o0
	movcs	%icc,	%o2,	%g6
	smul	%g3,	%l1,	%i1
	sdivx	%i2,	0x11BA,	%l6
	smul	%i5,	%l2,	%i0
	fxnor	%f16,	%f24,	%f6
	fornot2s	%f20,	%f24,	%f14
	fmul8sux16	%f0,	%f10,	%f26
	edge16ln	%l0,	%o7,	%o5
	sdiv	%l5,	0x1501,	%i3
	addcc	%g7,	0x0674,	%l3
	edge8ln	%o3,	%g4,	%g1
	movne	%xcc,	%o4,	%i6
	smul	%o1,	%i4,	%l4
	stw	%g5,	[%l7 + 0x28]
	fmovsne	%xcc,	%f10,	%f10
	movcc	%xcc,	%i7,	%g2
	movcc	%xcc,	%o0,	%o2
	fornot1s	%f17,	%f1,	%f15
	umul	%g6,	%o6,	%g3
	sra	%i1,	0x07,	%l1
	nop
	set	0x18, %g4
	ldx	[%l7 + %g4],	%i2
	movrgz	%l6,	%i5,	%l2
	udiv	%i0,	0x13E9,	%l0
	fmul8x16al	%f14,	%f23,	%f12
	ldsb	[%l7 + 0x3C],	%o5
	mulx	%o7,	%i3,	%l5
	or	%g7,	%l3,	%g4
	array32	%o3,	%g1,	%o4
	fabsd	%f22,	%f26
	sir	0x13DB
	andncc	%o1,	%i4,	%i6
	movvs	%xcc,	%l4,	%g5
	movrgz	%g2,	0x3B5,	%i7
	movn	%xcc,	%o0,	%o2
	srlx	%g6,	0x06,	%o6
	fmovsgu	%icc,	%f26,	%f8
	orncc	%i1,	0x0630,	%l1
	subc	%g3,	%i2,	%i5
	edge16l	%l2,	%i0,	%l6
	movvs	%icc,	%o5,	%o7
	movl	%icc,	%i3,	%l5
	edge32	%l0,	%g7,	%g4
	edge16l	%l3,	%g1,	%o4
	movle	%xcc,	%o1,	%o3
	movn	%icc,	%i4,	%l4
	movleu	%xcc,	%g5,	%g2
	umulcc	%i6,	%o0,	%i7
	udiv	%o2,	0x1023,	%o6
	fcmpne16	%f24,	%f4,	%g6
	sir	0x1DF2
	umul	%l1,	%g3,	%i2
	movleu	%xcc,	%i1,	%l2
	sethi	0x0017,	%i5
	srl	%i0,	0x05,	%l6
	movre	%o7,	0x151,	%o5
	subccc	%l5,	%i3,	%l0
	fmovrdgez	%g7,	%f20,	%f28
	ldsw	[%l7 + 0x18],	%l3
	fpadd16	%f18,	%f14,	%f26
	fmovsle	%xcc,	%f27,	%f21
	move	%xcc,	%g4,	%g1
	addcc	%o4,	0x1528,	%o1
	move	%xcc,	%o3,	%i4
	addc	%g5,	%l4,	%g2
	andncc	%o0,	%i6,	%i7
	edge32n	%o2,	%o6,	%l1
	fxnor	%f6,	%f8,	%f2
	save %g3, %i2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l2,	%i1,	%i0
	fand	%f0,	%f12,	%f20
	movl	%icc,	%i5,	%o7
	fabsd	%f28,	%f22
	fand	%f30,	%f0,	%f6
	ld	[%l7 + 0x10],	%f0
	stx	%l6,	[%l7 + 0x48]
	movpos	%icc,	%o5,	%i3
	fnot1	%f26,	%f26
	edge32ln	%l0,	%g7,	%l3
	movg	%xcc,	%l5,	%g1
	fornot2s	%f11,	%f18,	%f18
	edge16	%g4,	%o1,	%o4
	fxor	%f10,	%f4,	%f24
	fmovdleu	%xcc,	%f11,	%f23
	orcc	%i4,	%g5,	%l4
	fmovdvs	%xcc,	%f20,	%f24
	fcmple32	%f26,	%f28,	%g2
	fsrc1	%f24,	%f4
	fmul8x16au	%f14,	%f5,	%f14
	movge	%xcc,	%o3,	%i6
	movne	%icc,	%o0,	%i7
	alignaddrl	%o6,	%l1,	%o2
	andncc	%i2,	%g3,	%l2
	movg	%icc,	%g6,	%i1
	edge16l	%i0,	%o7,	%l6
	move	%xcc,	%o5,	%i3
	fmovdle	%xcc,	%f3,	%f12
	srl	%i5,	%g7,	%l3
	addccc	%l0,	0x08A5,	%g1
	movvc	%icc,	%l5,	%o1
	movneg	%xcc,	%g4,	%o4
	subcc	%i4,	0x0D0E,	%l4
	fabss	%f31,	%f3
	popc	%g5,	%g2
	st	%f21,	[%l7 + 0x14]
	movrgz	%o3,	0x31D,	%o0
	edge32l	%i7,	%o6,	%i6
	movne	%icc,	%l1,	%o2
	fmovsa	%xcc,	%f26,	%f4
	fornot1s	%f9,	%f28,	%f19
	movgu	%xcc,	%g3,	%l2
	fmovdcc	%xcc,	%f8,	%f12
	and	%g6,	%i2,	%i1
	edge8l	%o7,	%i0,	%o5
	orncc	%l6,	%i3,	%i5
	stb	%l3,	[%l7 + 0x4C]
	udivcc	%l0,	0x1630,	%g7
	movl	%xcc,	%g1,	%l5
	movre	%o1,	0x0C8,	%o4
	edge32n	%g4,	%l4,	%i4
	array16	%g2,	%o3,	%o0
	fmovsleu	%xcc,	%f4,	%f15
	edge8	%g5,	%o6,	%i7
	fzero	%f2
	fmovsleu	%xcc,	%f19,	%f2
	edge16ln	%i6,	%l1,	%g3
	orcc	%l2,	%g6,	%i2
	fcmpd	%fcc1,	%f24,	%f8
	fmovdl	%icc,	%f8,	%f27
	mulx	%i1,	%o2,	%o7
	movgu	%xcc,	%i0,	%o5
	subccc	%i3,	0x0B54,	%i5
	restore %l6, 0x060E, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l0,	%g7,	%g1
	fabsd	%f20,	%f2
	ldsh	[%l7 + 0x42],	%o1
	edge32	%o4,	%g4,	%l4
	fandnot1	%f0,	%f28,	%f20
	fmovdle	%xcc,	%f15,	%f16
	popc	0x06F2,	%l5
	movrgz	%g2,	%i4,	%o0
	smul	%g5,	%o6,	%o3
	fornot2	%f20,	%f28,	%f4
	or	%i6,	%i7,	%g3
	mova	%xcc,	%l1,	%l2
	movrgez	%g6,	0x249,	%i1
	edge8ln	%i2,	%o7,	%o2
	movcs	%xcc,	%i0,	%i3
	fmovdge	%xcc,	%f15,	%f16
	ldd	[%l7 + 0x40],	%i4
	ld	[%l7 + 0x6C],	%f30
	ldsh	[%l7 + 0x0A],	%o5
	fmovdgu	%icc,	%f18,	%f15
	movleu	%icc,	%l3,	%l0
	sir	0x1923
	edge16ln	%l6,	%g1,	%o1
	movrlez	%o4,	%g7,	%g4
	edge32ln	%l5,	%g2,	%i4
	sll	%l4,	0x0A,	%o0
	sllx	%g5,	%o3,	%o6
	movrgz	%i7,	0x012,	%g3
	srax	%l1,	0x07,	%l2
	andn	%i6,	0x1C3D,	%i1
	smulcc	%i2,	0x0B18,	%g6
	andncc	%o7,	%o2,	%i0
	and	%i3,	%i5,	%l3
	smul	%l0,	%l6,	%g1
	array32	%o1,	%o5,	%g7
	sllx	%o4,	%g4,	%l5
	movrgez	%g2,	%l4,	%o0
	fnands	%f11,	%f13,	%f15
	fnor	%f20,	%f4,	%f6
	orcc	%i4,	0x1F8C,	%o3
	umulcc	%g5,	0x1CAB,	%o6
	fand	%f6,	%f0,	%f24
	lduh	[%l7 + 0x1A],	%i7
	fpadd32	%f28,	%f22,	%f18
	lduh	[%l7 + 0x3C],	%l1
	std	%f6,	[%l7 + 0x18]
	sethi	0x0DB8,	%g3
	movn	%icc,	%i6,	%l2
	andcc	%i2,	%i1,	%g6
	sub	%o7,	0x15D2,	%o2
	xor	%i3,	0x175F,	%i0
	fmovdne	%icc,	%f19,	%f19
	fmovrse	%l3,	%f3,	%f7
	movg	%xcc,	%l0,	%l6
	movvs	%xcc,	%g1,	%i5
	edge32l	%o1,	%o5,	%g7
	fmovrdgez	%g4,	%f30,	%f8
	mulx	%l5,	%o4,	%g2
	fand	%f28,	%f10,	%f24
	edge8	%o0,	%l4,	%i4
	srlx	%o3,	0x1B,	%o6
	movneg	%icc,	%i7,	%l1
	subccc	%g3,	%g5,	%l2
	movg	%xcc,	%i2,	%i6
	movn	%icc,	%g6,	%i1
	fmovsvc	%icc,	%f15,	%f5
	array16	%o7,	%i3,	%i0
	ldd	[%l7 + 0x58],	%f4
	edge32	%l3,	%o2,	%l6
	umulcc	%g1,	0x0BE5,	%l0
	xnorcc	%o1,	%o5,	%g7
	sethi	0x00F9,	%i5
	edge32l	%l5,	%o4,	%g2
	and	%o0,	0x1AE5,	%l4
	fmovrde	%i4,	%f26,	%f2
	fmovde	%xcc,	%f15,	%f20
	movcs	%icc,	%g4,	%o6
	popc	%o3,	%i7
	movl	%icc,	%l1,	%g5
	umulcc	%g3,	0x0838,	%i2
	udiv	%l2,	0x0D11,	%i6
	fmovsvc	%icc,	%f7,	%f3
	st	%f22,	[%l7 + 0x20]
	fzeros	%f13
	mulx	%i1,	0x12B4,	%g6
	fcmpes	%fcc1,	%f8,	%f14
	stb	%o7,	[%l7 + 0x73]
	ldd	[%l7 + 0x40],	%i2
	umul	%i0,	%l3,	%l6
	edge16	%g1,	%l0,	%o2
	stb	%o1,	[%l7 + 0x79]
	subc	%o5,	0x1C36,	%g7
	udivcc	%i5,	0x0304,	%l5
	lduh	[%l7 + 0x68],	%o4
	mova	%icc,	%o0,	%l4
	movle	%icc,	%g2,	%i4
	lduh	[%l7 + 0x2E],	%o6
	fmovrdlz	%g4,	%f28,	%f20
	std	%f8,	[%l7 + 0x20]
	movpos	%icc,	%o3,	%i7
	fmovrde	%l1,	%f2,	%f14
	fmovrsne	%g5,	%f25,	%f15
	edge16l	%g3,	%l2,	%i2
	orncc	%i6,	%i1,	%g6
	edge32l	%o7,	%i0,	%l3
	movle	%xcc,	%l6,	%g1
	srax	%i3,	0x1A,	%o2
	st	%f25,	[%l7 + 0x78]
	fpadd32	%f30,	%f2,	%f6
	fmovsleu	%icc,	%f13,	%f6
	smul	%l0,	0x10E7,	%o1
	xor	%g7,	0x1863,	%o5
	edge16ln	%l5,	%o4,	%i5
	alignaddrl	%o0,	%l4,	%g2
	ldsb	[%l7 + 0x46],	%o6
	array8	%g4,	%i4,	%i7
	srlx	%o3,	%l1,	%g3
	save %l2, %g5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i2,	0x0DD1,	%i1
	ldx	[%l7 + 0x18],	%g6
	save %i0, 0x072B, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l3,	%g1,	%l6
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	fornot1s	%f30,	%f24,	%f24
	movvc	%icc,	%o1,	%g7
	movcs	%icc,	%l0,	%l5
	alignaddr	%o5,	%i5,	%o4
	nop
	set	0x30, %g1
	std	%f30,	[%l7 + %g1]
	for	%f20,	%f10,	%f6
	sra	%l4,	0x15,	%o0
	ldd	[%l7 + 0x50],	%g2
	sll	%o6,	0x01,	%g4
	nop
	set	0x58, %i2
	stb	%i4,	[%l7 + %i2]
	sethi	0x076F,	%i7
	lduh	[%l7 + 0x10],	%l1
	movge	%xcc,	%o3,	%g3
	orcc	%g5,	0x0208,	%l2
	fandnot2s	%f17,	%f13,	%f23
	srax	%i2,	%i1,	%i6
	ldub	[%l7 + 0x6B],	%g6
	udiv	%o7,	0x07AC,	%l3
	fsrc2s	%f0,	%f0
	edge32	%g1,	%i0,	%l6
	edge16n	%i3,	%o2,	%o1
	edge16ln	%g7,	%l0,	%l5
	edge32l	%o5,	%i5,	%l4
	sll	%o4,	%g2,	%o6
	ldsw	[%l7 + 0x64],	%o0
	edge32ln	%g4,	%i4,	%l1
	edge8	%i7,	%o3,	%g3
	orn	%g5,	%l2,	%i2
	fxnor	%f28,	%f16,	%f16
	subcc	%i1,	%g6,	%i6
	movrgez	%l3,	%o7,	%i0
	st	%f13,	[%l7 + 0x1C]
	movrlez	%g1,	%l6,	%o2
	edge32n	%o1,	%g7,	%l0
	subccc	%i3,	%o5,	%i5
	siam	0x7
	edge8n	%l5,	%o4,	%g2
	fpack32	%f20,	%f6,	%f28
	ldsw	[%l7 + 0x58],	%l4
	movgu	%xcc,	%o0,	%o6
	udivx	%i4,	0x01D1,	%g4
	sth	%l1,	[%l7 + 0x78]
	ldsw	[%l7 + 0x70],	%i7
	mova	%icc,	%o3,	%g5
	std	%f2,	[%l7 + 0x50]
	fmovscs	%icc,	%f0,	%f28
	fabsd	%f8,	%f12
	addc	%l2,	0x14CC,	%g3
	srax	%i1,	0x1B,	%i2
	xorcc	%i6,	%g6,	%o7
	movvc	%xcc,	%i0,	%l3
	sth	%g1,	[%l7 + 0x26]
	lduh	[%l7 + 0x4C],	%l6
	movrne	%o1,	0x3A7,	%o2
	orncc	%l0,	%i3,	%o5
	andncc	%g7,	%l5,	%o4
	smul	%g2,	%l4,	%o0
	fpsub32	%f8,	%f4,	%f4
	addc	%i5,	0x0581,	%i4
	srlx	%g4,	%o6,	%i7
	stb	%l1,	[%l7 + 0x63]
	alignaddr	%o3,	%l2,	%g3
	fmovrdlz	%g5,	%f12,	%f24
	umul	%i2,	0x0D36,	%i1
	smulcc	%g6,	%o7,	%i0
	movl	%xcc,	%i6,	%l3
	xnorcc	%g1,	0x14B0,	%l6
	mova	%icc,	%o2,	%o1
	mulx	%l0,	0x128B,	%o5
	movcc	%xcc,	%g7,	%i3
	sth	%l5,	[%l7 + 0x3E]
	movne	%xcc,	%o4,	%g2
	edge8ln	%o0,	%i5,	%l4
	fnot1s	%f6,	%f7
	lduh	[%l7 + 0x5C],	%g4
	addcc	%i4,	0x03D2,	%o6
	fmovdge	%icc,	%f16,	%f8
	mulx	%l1,	%o3,	%l2
	sdivcc	%i7,	0x07CF,	%g5
	fexpand	%f30,	%f4
	ldsw	[%l7 + 0x58],	%g3
	xorcc	%i1,	0x16EE,	%i2
	sethi	0x0AEF,	%g6
	fmovrslz	%i0,	%f1,	%f30
	movvs	%icc,	%i6,	%o7
	movrne	%g1,	%l6,	%l3
	fands	%f14,	%f6,	%f28
	ldub	[%l7 + 0x6D],	%o2
	movrgez	%o1,	0x1D4,	%l0
	movrne	%o5,	0x06A,	%i3
	edge32ln	%g7,	%l5,	%g2
	stw	%o4,	[%l7 + 0x54]
	fornot1	%f22,	%f30,	%f22
	umulcc	%i5,	0x1FB6,	%l4
	movrgez	%o0,	0x150,	%i4
	addccc	%o6,	0x0D4A,	%l1
	stw	%o3,	[%l7 + 0x20]
	popc	%l2,	%g4
	fmovrsgz	%i7,	%f21,	%f20
	mova	%xcc,	%g5,	%i1
	save %i2, %g6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %g3, %i6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f28,	%f30,	%f28
	movvc	%icc,	%l6,	%o7
	umulcc	%o2,	%l3,	%o1
	xnor	%l0,	%i3,	%o5
	edge8ln	%g7,	%l5,	%o4
	orcc	%i5,	0x063F,	%l4
	movg	%xcc,	%o0,	%i4
	orn	%g2,	%l1,	%o3
	mulx	%l2,	0x0860,	%o6
	fmovspos	%xcc,	%f9,	%f19
	sdivcc	%i7,	0x0F24,	%g5
	mulscc	%g4,	%i2,	%g6
	orncc	%i1,	%g3,	%i0
	fmovrsgez	%i6,	%f1,	%f28
	fpackfix	%f8,	%f7
	subccc	%l6,	%o7,	%g1
	fxors	%f20,	%f0,	%f24
	sir	0x0CB8
	movge	%xcc,	%l3,	%o1
	and	%o2,	%i3,	%l0
	movrne	%o5,	%l5,	%g7
	edge8	%i5,	%o4,	%l4
	addccc	%o0,	%g2,	%i4
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	fmovrdlz	%o6,	%f30,	%f28
	edge8	%i7,	%g5,	%g4
	edge32	%l2,	%g6,	%i2
	subc	%g3,	0x0702,	%i0
	srl	%i1,	0x03,	%l6
	sllx	%o7,	%g1,	%l3
	movleu	%icc,	%o1,	%o2
	popc	0x1AB6,	%i3
	movcc	%icc,	%l0,	%i6
	fornot1s	%f13,	%f11,	%f27
	sdivcc	%l5,	0x0FCF,	%g7
	movl	%xcc,	%i5,	%o4
	movrlz	%o5,	0x0B8,	%l4
	fones	%f23
	xnor	%g2,	%o0,	%i4
	udivx	%o3,	0x04F2,	%l1
	udiv	%o6,	0x09AC,	%i7
	array8	%g5,	%g4,	%g6
	srl	%l2,	%i2,	%i0
	lduw	[%l7 + 0x40],	%i1
	addc	%l6,	0x1125,	%o7
	nop
	set	0x10, %g6
	stx	%g3,	[%l7 + %g6]
	srl	%g1,	%l3,	%o1
	movle	%xcc,	%i3,	%l0
	array32	%i6,	%l5,	%o2
	xorcc	%g7,	%i5,	%o4
	fornot2s	%f16,	%f1,	%f22
	movgu	%xcc,	%o5,	%g2
	andncc	%o0,	%l4,	%i4
	alignaddrl	%l1,	%o6,	%i7
	array8	%o3,	%g5,	%g4
	movleu	%icc,	%l2,	%g6
	fmovdg	%icc,	%f28,	%f16
	umul	%i2,	%i1,	%l6
	umul	%i0,	0x03BB,	%g3
	add	%o7,	0x1A6C,	%g1
	fmovrdgez	%l3,	%f28,	%f26
	movleu	%xcc,	%o1,	%i3
	udivcc	%l0,	0x10DF,	%i6
	fmul8x16al	%f7,	%f28,	%f10
	udiv	%l5,	0x1896,	%o2
	movgu	%icc,	%i5,	%g7
	addccc	%o5,	0x1347,	%g2
	array32	%o0,	%l4,	%i4
	fmovrdgz	%l1,	%f4,	%f6
	std	%f22,	[%l7 + 0x60]
	mulscc	%o6,	%o4,	%o3
	edge8n	%g5,	%g4,	%l2
	restore %i7, 0x071E, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i1,	0x00DC,	%l6
	subccc	%i0,	%g3,	%o7
	stx	%g6,	[%l7 + 0x30]
	edge16	%g1,	%o1,	%l3
	fzero	%f0
	fmovrse	%l0,	%f10,	%f14
	movrgez	%i3,	0x1F3,	%i6
	alignaddr	%o2,	%l5,	%i5
	fpsub16	%f28,	%f14,	%f14
	ldd	[%l7 + 0x28],	%f12
	add	%o5,	%g2,	%g7
	subccc	%l4,	%i4,	%l1
	popc	0x14E7,	%o0
	fandnot2	%f20,	%f22,	%f8
	movrlez	%o4,	0x226,	%o3
	fsrc1	%f24,	%f10
	fone	%f2
	alignaddr	%o6,	%g5,	%l2
	movcs	%icc,	%i7,	%g4
	ldd	[%l7 + 0x78],	%i0
	fpadd16s	%f25,	%f27,	%f14
	popc	0x0F99,	%i2
	fmovsgu	%xcc,	%f11,	%f1
	umul	%l6,	0x0BAC,	%i0
	andn	%o7,	%g3,	%g6
	mulscc	%o1,	%l3,	%l0
	movne	%xcc,	%g1,	%i6
	mulx	%o2,	0x0B97,	%i3
	sth	%l5,	[%l7 + 0x30]
	movvc	%icc,	%i5,	%o5
	andn	%g7,	0x19A5,	%g2
	movcs	%icc,	%i4,	%l4
	fmovdge	%xcc,	%f17,	%f23
	udiv	%l1,	0x0D57,	%o4
	sll	%o3,	%o0,	%g5
	fmovdneg	%xcc,	%f5,	%f2
	fmuld8ulx16	%f27,	%f1,	%f28
	andn	%o6,	%i7,	%g4
	edge32l	%i1,	%i2,	%l6
	movne	%xcc,	%i0,	%l2
	movg	%icc,	%o7,	%g3
	edge32n	%g6,	%o1,	%l3
	fmovdvc	%icc,	%f1,	%f6
	edge8	%g1,	%i6,	%l0
	edge8l	%i3,	%l5,	%o2
	sdivcc	%i5,	0x0C3F,	%o5
	edge32ln	%g2,	%i4,	%g7
	array8	%l1,	%l4,	%o4
	movrne	%o0,	%o3,	%g5
	edge16	%o6,	%i7,	%i1
	addcc	%i2,	0x03F5,	%l6
	addccc	%g4,	0x0BD8,	%l2
	and	%i0,	0x0D58,	%g3
	mulx	%o7,	%g6,	%o1
	for	%f10,	%f14,	%f12
	sir	0x1A0F
	add	%g1,	%l3,	%i6
	mova	%icc,	%i3,	%l5
	umul	%o2,	0x0CC6,	%l0
	alignaddrl	%o5,	%g2,	%i4
	fmul8x16al	%f11,	%f0,	%f4
	orncc	%g7,	%l1,	%l4
	sll	%i5,	%o4,	%o0
	fsrc1	%f20,	%f20
	xor	%g5,	0x0490,	%o6
	fmuld8ulx16	%f1,	%f0,	%f4
	alignaddrl	%i7,	%i1,	%o3
	lduh	[%l7 + 0x62],	%l6
	orncc	%i2,	0x06EC,	%l2
	fmovsgu	%xcc,	%f20,	%f23
	sth	%i0,	[%l7 + 0x22]
	andncc	%g4,	%g3,	%o7
	fandnot1	%f8,	%f14,	%f16
	lduh	[%l7 + 0x60],	%g6
	andcc	%o1,	%g1,	%i6
	fmovdne	%icc,	%f18,	%f29
	fmovrslez	%i3,	%f1,	%f19
	and	%l5,	0x0DAE,	%o2
	save %l0, 0x10E1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0BD3,	%g2
	orcc	%o5,	%g7,	%l1
	xnor	%i4,	0x1C32,	%l4
	fandnot1	%f18,	%f10,	%f30
	sll	%i5,	0x11,	%o0
	movpos	%icc,	%g5,	%o6
	sethi	0x0911,	%o4
	movleu	%icc,	%i7,	%i1
	fmovdneg	%xcc,	%f28,	%f27
	srlx	%o3,	%l6,	%l2
	sdiv	%i0,	0x1AB8,	%i2
	edge32ln	%g4,	%o7,	%g3
	sdivcc	%o1,	0x0677,	%g1
	array16	%g6,	%i6,	%i3
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	movl	%icc,	%l3,	%l0
	movcc	%icc,	%g2,	%g7
	ldd	[%l7 + 0x40],	%l0
	addccc	%i4,	0x0AD4,	%l4
	std	%f30,	[%l7 + 0x50]
	fexpand	%f2,	%f26
	edge8l	%i5,	%o5,	%g5
	fxor	%f28,	%f16,	%f28
	restore %o0, 0x08D1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o6,	%i7,	%o3
	udiv	%i1,	0x1D74,	%l2
	ldub	[%l7 + 0x57],	%l6
	orn	%i2,	%i0,	%o7
	edge16ln	%g3,	%g4,	%g1
	ldsh	[%l7 + 0x38],	%g6
	edge16	%i6,	%o1,	%i3
	edge8	%l5,	%o2,	%l0
	movvc	%xcc,	%g2,	%g7
	fnor	%f20,	%f26,	%f10
	pdist	%f26,	%f18,	%f6
	nop
	set	0x60, %o1
	stx	%l1,	[%l7 + %o1]
	xorcc	%l3,	%i4,	%i5
	fpsub16s	%f15,	%f26,	%f13
	edge16	%l4,	%g5,	%o5
	fandnot1s	%f0,	%f2,	%f24
	std	%f24,	[%l7 + 0x38]
	umulcc	%o4,	0x15CB,	%o6
	movleu	%xcc,	%i7,	%o3
	movne	%xcc,	%o0,	%i1
	fandnot2	%f14,	%f2,	%f28
	fnegd	%f0,	%f10
	edge8n	%l6,	%l2,	%i0
	fmovdle	%icc,	%f25,	%f16
	fzeros	%f30
	stx	%o7,	[%l7 + 0x20]
	subccc	%g3,	0x13F8,	%g4
	movrgz	%i2,	%g1,	%i6
	movl	%icc,	%g6,	%o1
	addccc	%l5,	%o2,	%i3
	sth	%g2,	[%l7 + 0x18]
	edge32ln	%g7,	%l1,	%l0
	movvs	%icc,	%i4,	%l3
	fmovrdne	%l4,	%f22,	%f12
	or	%g5,	%i5,	%o5
	umul	%o4,	%o6,	%i7
	and	%o3,	%i1,	%l6
	movl	%xcc,	%o0,	%i0
	movl	%icc,	%o7,	%l2
	fsrc1s	%f18,	%f15
	smul	%g3,	0x0BD5,	%i2
	srl	%g1,	0x01,	%g4
	fcmpeq32	%f28,	%f14,	%g6
	ldsw	[%l7 + 0x14],	%o1
	popc	%l5,	%i6
	udivcc	%i3,	0x0BD6,	%g2
	fnand	%f8,	%f6,	%f8
	fandnot1s	%f3,	%f3,	%f4
	sdivx	%g7,	0x0643,	%o2
	xnorcc	%l0,	%i4,	%l3
	movge	%xcc,	%l1,	%g5
	movg	%xcc,	%i5,	%o5
	smul	%o4,	0x0881,	%o6
	edge32	%l4,	%o3,	%i1
	orn	%l6,	0x0384,	%o0
	srax	%i0,	0x0C,	%i7
	popc	0x1A82,	%l2
	fmovsneg	%icc,	%f21,	%f12
	siam	0x5
	ldub	[%l7 + 0x4A],	%o7
	edge32n	%i2,	%g3,	%g4
	movge	%xcc,	%g1,	%o1
	srax	%g6,	%i6,	%l5
	sdivcc	%g2,	0x0CC9,	%g7
	ldsw	[%l7 + 0x2C],	%i3
	movcs	%icc,	%o2,	%l0
	fpack16	%f20,	%f23
	fpack16	%f12,	%f4
	fnors	%f29,	%f23,	%f24
	st	%f12,	[%l7 + 0x54]
	orncc	%l3,	0x0A35,	%i4
	ldub	[%l7 + 0x43],	%g5
	fands	%f24,	%f5,	%f1
	fabss	%f22,	%f22
	addc	%i5,	%o5,	%l1
	fones	%f18
	udivx	%o4,	0x1739,	%o6
	sth	%l4,	[%l7 + 0x2E]
	movge	%icc,	%i1,	%o3
	addccc	%l6,	%i0,	%o0
	fpadd16s	%f29,	%f2,	%f24
	fpadd32	%f18,	%f18,	%f12
	alignaddr	%l2,	%i7,	%i2
	smul	%g3,	%g4,	%o7
	movcc	%icc,	%o1,	%g6
	edge32n	%g1,	%i6,	%l5
	lduw	[%l7 + 0x74],	%g7
	umulcc	%g2,	%o2,	%i3
	edge8l	%l3,	%l0,	%i4
	fmovsleu	%xcc,	%f6,	%f14
	mulscc	%g5,	0x1611,	%i5
	udivx	%l1,	0x0566,	%o4
	ldx	[%l7 + 0x58],	%o6
	xnorcc	%l4,	%o5,	%o3
	andncc	%l6,	%i0,	%i1
	stx	%l2,	[%l7 + 0x30]
	bshuffle	%f26,	%f26,	%f20
	movpos	%xcc,	%i7,	%i2
	ldd	[%l7 + 0x50],	%f20
	sdivx	%o0,	0x1C3D,	%g3
	or	%o7,	%g4,	%o1
	movcc	%icc,	%g6,	%i6
	movrlez	%g1,	%g7,	%l5
	orncc	%o2,	0x0958,	%g2
	fcmple16	%f2,	%f8,	%l3
	movrne	%l0,	%i4,	%g5
	edge8n	%i3,	%l1,	%o4
	movg	%icc,	%o6,	%i5
	umul	%l4,	0x0E32,	%o5
	and	%l6,	%i0,	%o3
	movne	%xcc,	%l2,	%i1
	fcmpeq32	%f8,	%f28,	%i2
	subccc	%o0,	0x0CD6,	%i7
	fxnors	%f26,	%f30,	%f5
	fpsub32	%f0,	%f30,	%f6
	or	%o7,	%g4,	%o1
	andcc	%g3,	%g6,	%i6
	addccc	%g7,	0x0B2C,	%l5
	xnorcc	%o2,	0x0969,	%g1
	fmovsg	%icc,	%f5,	%f7
	andncc	%g2,	%l0,	%l3
	fandnot1s	%f8,	%f8,	%f7
	save %i4, %g5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l1,	%o4,	%o6
	sdiv	%i5,	0x06FC,	%l4
	edge32l	%o5,	%i0,	%o3
	fmovsle	%icc,	%f3,	%f31
	smulcc	%l2,	%i1,	%i2
	udiv	%l6,	0x06B6,	%i7
	movrlez	%o0,	0x214,	%o7
	fpadd16s	%f17,	%f22,	%f16
	smul	%g4,	%o1,	%g3
	xor	%i6,	%g6,	%g7
	movneg	%xcc,	%l5,	%g1
	nop
	set	0x60, %l1
	stw	%g2,	[%l7 + %l1]
	fmovrdne	%o2,	%f16,	%f22
	alignaddrl	%l0,	%i4,	%g5
	st	%f30,	[%l7 + 0x08]
	edge32	%i3,	%l3,	%o4
	movrgez	%o6,	0x0C3,	%i5
	orcc	%l1,	%o5,	%i0
	edge8	%o3,	%l2,	%l4
	sdiv	%i2,	0x0C4F,	%i1
	and	%l6,	0x0EA5,	%o0
	array8	%i7,	%g4,	%o7
	sdiv	%o1,	0x05B0,	%i6
	array8	%g3,	%g6,	%l5
	fmovrsgz	%g7,	%f14,	%f26
	fone	%f4
	fsrc1	%f2,	%f30
	ldsw	[%l7 + 0x18],	%g1
	movrne	%o2,	%l0,	%i4
	array8	%g2,	%i3,	%g5
	movpos	%xcc,	%o4,	%o6
	movcs	%icc,	%l3,	%l1
	xorcc	%o5,	%i5,	%o3
	ldub	[%l7 + 0x2C],	%l2
	movge	%xcc,	%l4,	%i0
	addc	%i1,	%l6,	%i2
	sub	%o0,	%i7,	%o7
	smulcc	%g4,	0x046A,	%i6
	faligndata	%f18,	%f18,	%f0
	movrlz	%g3,	0x36E,	%g6
	sdivx	%l5,	0x1E56,	%g7
	sdivcc	%g1,	0x08FF,	%o2
	fmovsle	%icc,	%f7,	%f31
	fcmple16	%f20,	%f0,	%l0
	sub	%i4,	0x1A1A,	%g2
	faligndata	%f8,	%f6,	%f4
	ldd	[%l7 + 0x08],	%f24
	edge8n	%o1,	%g5,	%o4
	movge	%icc,	%i3,	%l3
	fandnot1s	%f26,	%f10,	%f11
	edge16ln	%l1,	%o5,	%i5
	umul	%o3,	0x1319,	%o6
	sdivx	%l2,	0x19EC,	%i0
	stx	%i1,	[%l7 + 0x30]
	stx	%l6,	[%l7 + 0x70]
	umulcc	%l4,	0x1CCF,	%o0
	movrne	%i2,	%o7,	%i7
	fcmps	%fcc0,	%f10,	%f0
	srl	%i6,	0x1E,	%g4
	srax	%g3,	0x03,	%g6
	fmovdl	%icc,	%f31,	%f3
	movn	%xcc,	%g7,	%l5
	nop
	set	0x44, %g5
	ldsh	[%l7 + %g5],	%o2
	movpos	%xcc,	%l0,	%i4
	movrne	%g2,	%g1,	%o1
	fsrc1s	%f9,	%f3
	fmovsneg	%icc,	%f16,	%f19
	fmovdg	%icc,	%f12,	%f16
	fxnor	%f16,	%f20,	%f4
	addcc	%g5,	0x14C0,	%o4
	edge32l	%i3,	%l3,	%l1
	alignaddrl	%i5,	%o3,	%o5
	movrne	%o6,	0x376,	%i0
	movne	%xcc,	%i1,	%l2
	add	%l4,	%l6,	%i2
	addccc	%o7,	%i7,	%o0
	subc	%g4,	%g3,	%g6
	sdivx	%i6,	0x16D1,	%l5
	umul	%g7,	0x1050,	%l0
	edge32n	%i4,	%g2,	%g1
	udivx	%o1,	0x0E03,	%g5
	edge32ln	%o2,	%i3,	%o4
	edge16l	%l3,	%i5,	%o3
	movn	%xcc,	%l1,	%o5
	udivcc	%i0,	0x1988,	%o6
	orcc	%l2,	%l4,	%i1
	ldx	[%l7 + 0x18],	%l6
	fcmple16	%f30,	%f18,	%i2
	edge32	%o7,	%i7,	%g4
	orn	%o0,	0x13E8,	%g3
	fnegd	%f12,	%f0
	movrlez	%g6,	0x140,	%l5
	fmovrse	%g7,	%f14,	%f1
	fabsd	%f6,	%f12
	xnor	%l0,	0x0AD3,	%i6
	udiv	%g2,	0x015B,	%i4
	xor	%o1,	%g1,	%o2
	umulcc	%g5,	%i3,	%o4
	addcc	%i5,	%o3,	%l1
	ldsh	[%l7 + 0x46],	%l3
	mulx	%i0,	0x0FE1,	%o5
	andncc	%l2,	%o6,	%i1
	fmovrdgez	%l4,	%f10,	%f22
	andncc	%l6,	%i2,	%i7
	move	%xcc,	%o7,	%o0
	sdivx	%g3,	0x1E5E,	%g6
	fmovrdne	%g4,	%f12,	%f14
	siam	0x4
	movrgz	%l5,	%g7,	%i6
	fornot1s	%f12,	%f16,	%f12
	orn	%g2,	0x17CB,	%l0
	stw	%i4,	[%l7 + 0x14]
	add	%o1,	0x05CA,	%o2
	edge32	%g1,	%g5,	%i3
	array32	%o4,	%o3,	%i5
	fmovdvs	%xcc,	%f14,	%f31
	array16	%l1,	%i0,	%o5
	edge32n	%l3,	%l2,	%i1
	sdiv	%l4,	0x0F29,	%l6
	edge16	%i2,	%i7,	%o6
	alignaddr	%o0,	%o7,	%g3
	sth	%g4,	[%l7 + 0x28]
	array32	%l5,	%g6,	%g7
	xorcc	%g2,	%l0,	%i4
	array32	%i6,	%o1,	%o2
	alignaddrl	%g1,	%i3,	%o4
	xnor	%o3,	%i5,	%g5
	mulx	%l1,	%i0,	%l3
	smulcc	%l2,	%o5,	%l4
	fpsub16s	%f18,	%f14,	%f10
	array32	%l6,	%i2,	%i1
	sll	%o6,	%o0,	%i7
	stw	%o7,	[%l7 + 0x70]
	movrlez	%g3,	%g4,	%g6
	mova	%xcc,	%l5,	%g2
	orn	%g7,	0x02EF,	%l0
	array32	%i4,	%i6,	%o2
	lduw	[%l7 + 0x18],	%o1
	add	%g1,	0x0D90,	%i3
	xnor	%o4,	0x1FC0,	%o3
	fand	%f2,	%f26,	%f8
	movrgez	%g5,	0x2D5,	%i5
	and	%i0,	%l1,	%l3
	fornot1s	%f24,	%f15,	%f14
	or	%o5,	%l4,	%l6
	edge8	%i2,	%i1,	%l2
	add	%o0,	%o6,	%o7
	array8	%g3,	%i7,	%g4
	orn	%l5,	%g2,	%g7
	umul	%g6,	0x0ED3,	%l0
	mulscc	%i4,	0x1AFC,	%o2
	alignaddr	%o1,	%i6,	%i3
	movrgz	%o4,	0x073,	%o3
	fmovspos	%xcc,	%f19,	%f15
	ld	[%l7 + 0x38],	%f31
	fmovrdne	%g1,	%f26,	%f0
	fxnors	%f18,	%f18,	%f22
	nop
	set	0x18, %l2
	std	%f0,	[%l7 + %l2]
	fpack32	%f16,	%f20,	%f0
	movrlez	%i5,	%g5,	%l1
	fmuld8sux16	%f5,	%f20,	%f14
	umul	%i0,	%l3,	%l4
	fabsd	%f10,	%f18
	fmovrdgz	%l6,	%f28,	%f26
	stb	%i2,	[%l7 + 0x26]
	fpsub16s	%f21,	%f25,	%f10
	movrgz	%o5,	%l2,	%o0
	ldd	[%l7 + 0x70],	%i0
	fmovdg	%xcc,	%f26,	%f7
	ldsb	[%l7 + 0x50],	%o6
	smulcc	%o7,	0x04F6,	%i7
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	sub	%g3,	0x11DF,	%g7
	edge32	%g6,	%l0,	%g2
	movcs	%xcc,	%o2,	%i4
	sir	0x073D
	fcmpd	%fcc3,	%f0,	%f16
	movvs	%icc,	%i6,	%o1
	lduw	[%l7 + 0x30],	%i3
	andncc	%o4,	%g1,	%i5
	xnorcc	%g5,	0x0215,	%l1
	srlx	%i0,	0x0E,	%o3
	fmovsvs	%xcc,	%f17,	%f10
	xorcc	%l4,	0x191D,	%l6
	addc	%i2,	0x05D5,	%o5
	and	%l2,	%l3,	%i1
	fxors	%f14,	%f11,	%f15
	smul	%o0,	%o7,	%o6
	orcc	%i7,	%g4,	%l5
	edge32n	%g3,	%g6,	%g7
	edge8l	%g2,	%l0,	%o2
	mulscc	%i4,	%i6,	%o1
	move	%xcc,	%o4,	%g1
	sdivx	%i3,	0x0181,	%g5
	add	%i5,	0x1EF6,	%i0
	fmovdn	%xcc,	%f2,	%f30
	sdiv	%l1,	0x0C06,	%l4
	ldsh	[%l7 + 0x0E],	%l6
	ld	[%l7 + 0x14],	%f22
	movvs	%xcc,	%i2,	%o5
	mova	%xcc,	%l2,	%l3
	xorcc	%i1,	%o0,	%o7
	fmovda	%icc,	%f12,	%f19
	sra	%o3,	0x0D,	%i7
	stw	%o6,	[%l7 + 0x18]
	std	%f14,	[%l7 + 0x68]
	edge8l	%l5,	%g3,	%g4
	subcc	%g7,	%g6,	%l0
	movneg	%icc,	%o2,	%g2
	xnorcc	%i6,	%o1,	%i4
	movvc	%xcc,	%o4,	%i3
	udivcc	%g1,	0x05B3,	%i5
	fpsub32	%f22,	%f22,	%f6
	srax	%i0,	0x14,	%g5
	st	%f12,	[%l7 + 0x10]
	addccc	%l4,	0x1A0A,	%l1
	subccc	%i2,	0x1232,	%l6
	edge8l	%o5,	%l2,	%i1
	xnor	%o0,	%l3,	%o7
	movre	%o3,	0x12A,	%i7
	orn	%l5,	%o6,	%g3
	movrlz	%g4,	0x3A4,	%g7
	sth	%l0,	[%l7 + 0x74]
	fabss	%f0,	%f5
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%o2
	fmul8sux16	%f6,	%f6,	%f28
	sdivx	%g6,	0x0BAB,	%g2
	movrgez	%o1,	0x02D,	%i6
	xor	%i4,	%o4,	%g1
	movne	%icc,	%i5,	%i3
	movrgz	%i0,	0x2AF,	%g5
	subcc	%l1,	0x0568,	%i2
	edge32ln	%l6,	%o5,	%l4
	stb	%l2,	[%l7 + 0x77]
	smul	%o0,	0x1860,	%l3
	stw	%i1,	[%l7 + 0x30]
	edge8l	%o7,	%o3,	%l5
	fpackfix	%f30,	%f18
	subc	%i7,	0x1189,	%g3
	fpadd16	%f4,	%f2,	%f6
	movrgz	%g4,	0x0CB,	%g7
	std	%f10,	[%l7 + 0x20]
	addccc	%l0,	%o6,	%o2
	sdiv	%g6,	0x05F2,	%o1
	fmovdneg	%xcc,	%f25,	%f2
	subcc	%g2,	0x1F37,	%i4
	fmovse	%xcc,	%f1,	%f23
	fmovdge	%xcc,	%f27,	%f30
	xor	%o4,	%i6,	%i5
	addcc	%i3,	0x1C6D,	%i0
	umul	%g1,	%g5,	%i2
	edge16ln	%l1,	%o5,	%l6
	fmul8x16au	%f2,	%f18,	%f4
	srax	%l2,	0x05,	%o0
	fmovsne	%icc,	%f6,	%f0
	umulcc	%l3,	%l4,	%i1
	movvs	%xcc,	%o3,	%o7
	sdivcc	%i7,	0x1965,	%g3
	fcmpes	%fcc3,	%f3,	%f23
	sll	%l5,	0x00,	%g7
	movl	%xcc,	%g4,	%o6
	edge32n	%l0,	%o2,	%o1
	fpsub32	%f6,	%f2,	%f20
	fmovdn	%icc,	%f19,	%f28
	sdivx	%g6,	0x1FBA,	%g2
	ldd	[%l7 + 0x58],	%o4
	fmovscs	%icc,	%f21,	%f6
	edge32	%i4,	%i5,	%i6
	sdiv	%i0,	0x1F53,	%i3
	edge8	%g1,	%i2,	%l1
	movpos	%xcc,	%g5,	%o5
	sir	0x0345
	sll	%l6,	0x0C,	%l2
	edge16ln	%o0,	%l4,	%l3
	movgu	%xcc,	%i1,	%o7
	smul	%o3,	0x0A42,	%i7
	movgu	%icc,	%g3,	%g7
	movrne	%l5,	0x029,	%g4
	addcc	%l0,	0x0FD0,	%o6
	move	%xcc,	%o1,	%g6
	movle	%xcc,	%g2,	%o4
	movne	%icc,	%o2,	%i5
	fmovdl	%xcc,	%f11,	%f29
	fmovscc	%icc,	%f8,	%f14
	edge8	%i4,	%i0,	%i6
	orn	%i3,	%i2,	%l1
	udivx	%g5,	0x1668,	%g1
	fpadd32s	%f12,	%f21,	%f30
	fxnors	%f6,	%f16,	%f8
	sllx	%l6,	0x00,	%l2
	ld	[%l7 + 0x60],	%f9
	edge32	%o0,	%l4,	%o5
	movrgez	%l3,	0x0F2,	%i1
	movn	%xcc,	%o7,	%i7
	mova	%xcc,	%o3,	%g3
	popc	%l5,	%g7
	sethi	0x0793,	%g4
	fcmple16	%f18,	%f24,	%o6
	edge32	%o1,	%g6,	%l0
	movvc	%xcc,	%g2,	%o4
	move	%xcc,	%o2,	%i5
	addcc	%i0,	0x17A5,	%i4
	andn	%i6,	0x1FAF,	%i2
	movrne	%i3,	0x023,	%g5
	movgu	%xcc,	%l1,	%g1
	edge8ln	%l2,	%l6,	%o0
	fmovsn	%xcc,	%f10,	%f31
	movne	%icc,	%o5,	%l4
	lduh	[%l7 + 0x5E],	%l3
	fnot2s	%f2,	%f8
	alignaddr	%o7,	%i7,	%o3
	bshuffle	%f20,	%f26,	%f2
	orcc	%g3,	%l5,	%g7
	stw	%g4,	[%l7 + 0x68]
	array32	%i1,	%o1,	%o6
	mulx	%l0,	%g6,	%g2
	and	%o4,	0x1584,	%o2
	add	%i0,	0x0FAF,	%i5
	sir	0x1492
	xnor	%i6,	0x1CB6,	%i2
	ldsw	[%l7 + 0x10],	%i3
	movrgez	%i4,	%l1,	%g1
	fpsub16s	%f5,	%f30,	%f26
	stx	%l2,	[%l7 + 0x18]
	fcmpes	%fcc1,	%f19,	%f4
	movre	%l6,	0x2F9,	%o0
	edge16n	%o5,	%g5,	%l4
	ld	[%l7 + 0x20],	%f23
	edge16n	%o7,	%i7,	%o3
	or	%g3,	%l5,	%g7
	mova	%icc,	%g4,	%i1
	or	%o1,	%l3,	%o6
	edge8	%l0,	%g2,	%o4
	subcc	%g6,	0x098A,	%i0
	smul	%i5,	%o2,	%i2
	sllx	%i6,	%i3,	%l1
	edge16ln	%i4,	%l2,	%l6
	umulcc	%o0,	0x0851,	%o5
	addccc	%g5,	0x1EA5,	%l4
	movl	%icc,	%o7,	%i7
	fcmpeq16	%f4,	%f12,	%g1
	umul	%g3,	%l5,	%g7
	xnorcc	%o3,	0x09B9,	%i1
	fmovsge	%xcc,	%f29,	%f25
	xor	%g4,	0x1D6C,	%l3
	ldub	[%l7 + 0x33],	%o6
	subccc	%o1,	%g2,	%l0
	xnorcc	%o4,	0x0A7E,	%i0
	movle	%xcc,	%i5,	%g6
	movle	%xcc,	%o2,	%i6
	movcs	%xcc,	%i3,	%i2
	fandnot1	%f30,	%f16,	%f2
	movg	%icc,	%i4,	%l2
	fnor	%f26,	%f2,	%f14
	edge32	%l6,	%o0,	%o5
	movgu	%xcc,	%l1,	%l4
	ldd	[%l7 + 0x28],	%f18
	fabss	%f21,	%f1
	sdiv	%o7,	0x0793,	%g5
	andncc	%g1,	%i7,	%l5
	srl	%g3,	0x0A,	%o3
	movcc	%icc,	%g7,	%i1
	save %l3, 0x1825, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1597
	movn	%icc,	%g4,	%o1
	ldsw	[%l7 + 0x78],	%l0
	udivx	%o4,	0x1F52,	%g2
	alignaddr	%i0,	%i5,	%o2
	lduh	[%l7 + 0x6C],	%g6
	edge8l	%i6,	%i3,	%i4
	lduw	[%l7 + 0x58],	%i2
	edge8	%l6,	%o0,	%o5
	ldx	[%l7 + 0x30],	%l2
	edge8ln	%l4,	%o7,	%g5
	mova	%icc,	%g1,	%i7
	popc	0x15C2,	%l1
	sll	%l5,	%g3,	%o3
	movg	%xcc,	%i1,	%l3
	sdivx	%o6,	0x11AF,	%g7
	movl	%xcc,	%g4,	%l0
	fcmpgt32	%f10,	%f4,	%o1
	array32	%g2,	%i0,	%o4
	array8	%o2,	%g6,	%i6
	alignaddrl	%i5,	%i3,	%i4
	lduh	[%l7 + 0x4A],	%l6
	movl	%xcc,	%i2,	%o0
	popc	0x1142,	%l2
	array16	%o5,	%o7,	%g5
	or	%l4,	0x11E0,	%i7
	sethi	0x0623,	%l1
	fcmpd	%fcc0,	%f0,	%f30
	sllx	%l5,	0x07,	%g1
	edge16	%o3,	%g3,	%i1
	nop
	set	0x78, %i7
	ldd	[%l7 + %i7],	%l2
	fpadd32	%f0,	%f18,	%f2
	xnor	%g7,	%g4,	%l0
	srl	%o1,	%o6,	%g2
	fcmple16	%f4,	%f24,	%i0
	array32	%o4,	%o2,	%g6
	sdivcc	%i5,	0x116F,	%i3
	xnorcc	%i6,	%l6,	%i4
	sdivx	%o0,	0x0D5C,	%l2
	edge16ln	%o5,	%o7,	%i2
	smulcc	%g5,	0x1024,	%l4
	movpos	%icc,	%i7,	%l5
	xorcc	%l1,	%g1,	%g3
	sllx	%i1,	0x1E,	%o3
	fmovrslz	%g7,	%f6,	%f14
	ldd	[%l7 + 0x50],	%f4
	sdiv	%g4,	0x178A,	%l0
	addccc	%l3,	%o6,	%g2
	srax	%i0,	%o1,	%o2
	alignaddr	%o4,	%g6,	%i5
	srlx	%i3,	%l6,	%i6
	save %o0, %l2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i4,	%o7,	%g5
	movvc	%xcc,	%i2,	%i7
	fcmpgt16	%f4,	%f26,	%l4
	fmovs	%f15,	%f17
	array8	%l5,	%l1,	%g1
	andncc	%i1,	%g3,	%o3
	sll	%g7,	%g4,	%l0
	orn	%l3,	%o6,	%g2
	fnors	%f13,	%f12,	%f4
	array8	%o1,	%i0,	%o2
	movge	%icc,	%o4,	%g6
	edge32ln	%i3,	%i5,	%l6
	lduw	[%l7 + 0x30],	%o0
	or	%l2,	0x1711,	%o5
	fmovscc	%xcc,	%f21,	%f17
	edge32ln	%i6,	%i4,	%g5
	fcmple32	%f0,	%f0,	%i2
	smulcc	%o7,	0x1B9C,	%i7
	fand	%f14,	%f0,	%f24
	mulx	%l4,	0x027D,	%l5
	fxnor	%f24,	%f30,	%f20
	xorcc	%l1,	%g1,	%i1
	fmovsneg	%icc,	%f22,	%f19
	andncc	%o3,	%g3,	%g7
	edge8	%g4,	%l3,	%l0
	or	%o6,	%o1,	%g2
	sra	%o2,	0x0C,	%o4
	smulcc	%g6,	%i3,	%i0
	ldsb	[%l7 + 0x65],	%l6
	ldsh	[%l7 + 0x34],	%i5
	sll	%o0,	%l2,	%i6
	ldsh	[%l7 + 0x22],	%o5
	edge8l	%i4,	%i2,	%g5
	fabsd	%f6,	%f12
	fsrc2	%f10,	%f24
	andncc	%i7,	%o7,	%l5
	umulcc	%l4,	0x19C6,	%g1
	ldsw	[%l7 + 0x4C],	%l1
	srax	%o3,	0x0F,	%g3
	movn	%xcc,	%i1,	%g7
	popc	0x1F4D,	%l3
	sra	%l0,	0x15,	%o6
	fcmpgt16	%f28,	%f16,	%o1
	fmovrsgez	%g4,	%f31,	%f27
	ldd	[%l7 + 0x18],	%g2
	fpmerge	%f18,	%f29,	%f0
	movrne	%o2,	0x0E5,	%o4
	save %g6, %i0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%xcc,	%f26,	%f29
	fmul8x16au	%f31,	%f21,	%f0
	fabsd	%f26,	%f26
	fxors	%f12,	%f17,	%f5
	movrgz	%i5,	%o0,	%i3
	save %i6, 0x1C66, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x48],	%f20
	movge	%icc,	%o5,	%i4
	smulcc	%i2,	%i7,	%o7
	xor	%l5,	0x0DC1,	%g5
	fand	%f4,	%f30,	%f28
	fmovrslez	%l4,	%f17,	%f23
	addc	%l1,	%o3,	%g3
	fnot1s	%f28,	%f31
	movvc	%icc,	%i1,	%g7
	movleu	%icc,	%l3,	%l0
	xnor	%o6,	%g1,	%g4
	fmovdge	%icc,	%f20,	%f3
	andncc	%o1,	%g2,	%o4
	fexpand	%f26,	%f12
	movl	%xcc,	%o2,	%i0
	fandnot1	%f6,	%f4,	%f20
	fandnot2	%f0,	%f6,	%f8
	movle	%icc,	%g6,	%l6
	st	%f17,	[%l7 + 0x14]
	sethi	0x007A,	%i5
	edge32l	%o0,	%i6,	%l2
	smulcc	%o5,	0x087A,	%i3
	fmovsgu	%icc,	%f13,	%f6
	fmul8x16al	%f25,	%f6,	%f18
	sra	%i2,	0x13,	%i4
	movneg	%xcc,	%i7,	%l5
	edge16n	%o7,	%g5,	%l4
	fxors	%f26,	%f10,	%f2
	nop
	set	0x40, %g7
	lduw	[%l7 + %g7],	%l1
	st	%f15,	[%l7 + 0x48]
	sethi	0x1DBB,	%g3
	sdivcc	%o3,	0x1E49,	%g7
	smulcc	%l3,	0x11A8,	%l0
	fnegd	%f8,	%f16
	movrne	%i1,	0x222,	%g1
	xnor	%g4,	%o1,	%g2
	fmul8sux16	%f30,	%f2,	%f30
	sll	%o4,	0x1D,	%o6
	add	%o2,	%g6,	%i0
	fandnot2s	%f4,	%f28,	%f24
	edge32l	%i5,	%o0,	%i6
	array16	%l6,	%o5,	%l2
	restore %i3, 0x0030, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i2,	%l5
	mulscc	%i7,	0x027E,	%o7
	popc	%l4,	%g5
	fcmps	%fcc3,	%f24,	%f14
	xor	%g3,	0x03FB,	%l1
	andcc	%g7,	%l3,	%o3
	popc	0x1FA6,	%i1
	movne	%xcc,	%l0,	%g4
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	udiv	%g1,	0x084D,	%o4
	save %o6, 0x10ED, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f12,	%f21,	%f0
	ldx	[%l7 + 0x58],	%g6
	fmovrsgz	%i0,	%f20,	%f22
	fcmpne32	%f8,	%f22,	%i5
	ldx	[%l7 + 0x58],	%i6
	orncc	%l6,	%o0,	%o5
	sth	%l2,	[%l7 + 0x3A]
	edge16	%i4,	%i2,	%l5
	ld	[%l7 + 0x74],	%f23
	fmovscc	%xcc,	%f20,	%f26
	array32	%i7,	%o7,	%l4
	fand	%f10,	%f2,	%f20
	fmul8x16	%f10,	%f24,	%f2
	movrgez	%i3,	%g3,	%l1
	sdivcc	%g7,	0x0C9D,	%l3
	fmovsn	%xcc,	%f22,	%f5
	array32	%o3,	%g5,	%l0
	edge8n	%g4,	%o1,	%g2
	stb	%i1,	[%l7 + 0x2D]
	fpadd32s	%f16,	%f14,	%f6
	lduh	[%l7 + 0x40],	%g1
	fnot1s	%f31,	%f31
	and	%o4,	%o2,	%o6
	movrlz	%g6,	0x126,	%i5
	edge32ln	%i6,	%i0,	%l6
	fcmped	%fcc2,	%f6,	%f2
	edge8n	%o5,	%o0,	%l2
	ldd	[%l7 + 0x18],	%f10
	xnorcc	%i4,	0x16AD,	%l5
	movrne	%i2,	0x11F,	%i7
	addccc	%l4,	%i3,	%g3
	addcc	%l1,	%g7,	%l3
	fmovrdlz	%o7,	%f20,	%f6
	edge8ln	%g5,	%l0,	%g4
	edge16ln	%o1,	%g2,	%i1
	fornot2s	%f10,	%f27,	%f17
	ldsh	[%l7 + 0x68],	%o3
	edge8n	%o4,	%o2,	%o6
	movleu	%icc,	%g1,	%i5
	edge8n	%i6,	%i0,	%l6
	xnorcc	%o5,	%o0,	%l2
	andn	%g6,	%l5,	%i2
	fmovscc	%xcc,	%f12,	%f0
	movrlez	%i4,	0x105,	%l4
	sir	0x0CA6
	xnor	%i7,	%g3,	%i3
	stb	%l1,	[%l7 + 0x3E]
	fpsub32s	%f22,	%f4,	%f29
	mova	%xcc,	%g7,	%l3
	movre	%o7,	0x193,	%g5
	or	%l0,	0x01C1,	%g4
	stx	%g2,	[%l7 + 0x70]
	addcc	%o1,	0x1328,	%i1
	sub	%o3,	0x145E,	%o4
	nop
	set	0x38, %i3
	sth	%o6,	[%l7 + %i3]
	movcc	%icc,	%o2,	%i5
	movcc	%xcc,	%g1,	%i0
	subcc	%i6,	%o5,	%l6
	fmovsg	%xcc,	%f0,	%f25
	movn	%xcc,	%l2,	%o0
	andncc	%g6,	%i2,	%l5
	addcc	%i4,	%i7,	%l4
	edge8l	%g3,	%l1,	%g7
	fcmps	%fcc3,	%f19,	%f16
	stb	%l3,	[%l7 + 0x7D]
	movvc	%icc,	%i3,	%g5
	movpos	%xcc,	%l0,	%g4
	alignaddr	%g2,	%o1,	%i1
	popc	%o7,	%o4
	sth	%o6,	[%l7 + 0x7E]
	movge	%xcc,	%o3,	%o2
	edge8n	%i5,	%i0,	%g1
	fcmple32	%f26,	%f20,	%i6
	movcc	%icc,	%l6,	%l2
	udivcc	%o5,	0x1E80,	%g6
	xorcc	%i2,	0x163B,	%l5
	fmuld8sux16	%f4,	%f26,	%f22
	fexpand	%f20,	%f0
	movg	%xcc,	%o0,	%i4
	movvs	%icc,	%i7,	%l4
	ld	[%l7 + 0x5C],	%f1
	ldsw	[%l7 + 0x34],	%l1
	fmovda	%xcc,	%f21,	%f22
	subc	%g3,	0x1D61,	%g7
	udivcc	%l3,	0x1C85,	%i3
	movpos	%icc,	%g5,	%g4
	orn	%g2,	%o1,	%i1
	alignaddrl	%l0,	%o4,	%o6
	lduw	[%l7 + 0x50],	%o3
	fpadd32s	%f5,	%f28,	%f22
	edge16l	%o2,	%i5,	%o7
	fmul8ulx16	%f30,	%f28,	%f22
	sll	%g1,	0x16,	%i0
	lduh	[%l7 + 0x4C],	%i6
	fmul8sux16	%f18,	%f18,	%f8
	movrgz	%l2,	0x3E1,	%o5
	st	%f13,	[%l7 + 0x34]
	ldub	[%l7 + 0x2A],	%g6
	fnot2	%f26,	%f14
	ldsb	[%l7 + 0x54],	%i2
	ldd	[%l7 + 0x48],	%f22
	array16	%l5,	%l6,	%i4
	addcc	%i7,	0x00DB,	%l4
	udivx	%o0,	0x0BBB,	%g3
	andn	%g7,	%l1,	%l3
	movneg	%xcc,	%i3,	%g5
	srl	%g2,	%o1,	%g4
	edge32ln	%l0,	%i1,	%o4
	movrgez	%o6,	0x08F,	%o2
	restore %i5, 0x0D7D, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g1,	%i0
	subc	%i6,	0x0B86,	%l2
	udiv	%o7,	0x028A,	%o5
	edge32ln	%i2,	%g6,	%l5
	array32	%i4,	%l6,	%i7
	fmovrsgz	%o0,	%f7,	%f3
	movneg	%icc,	%g3,	%g7
	edge32ln	%l1,	%l4,	%l3
	edge16l	%g5,	%i3,	%o1
	smulcc	%g4,	0x0D68,	%l0
	xnor	%i1,	%o4,	%o6
	ld	[%l7 + 0x48],	%f22
	stx	%g2,	[%l7 + 0x20]
	movgu	%icc,	%o2,	%o3
	movrgez	%i5,	0x38D,	%g1
	xnor	%i0,	%l2,	%i6
	fandnot2s	%f11,	%f1,	%f22
	subc	%o7,	%i2,	%g6
	fpack16	%f16,	%f12
	stw	%l5,	[%l7 + 0x74]
	movrlez	%o5,	%i4,	%i7
	fcmpd	%fcc1,	%f10,	%f16
	edge32	%o0,	%g3,	%g7
	std	%f24,	[%l7 + 0x40]
	movcs	%icc,	%l1,	%l4
	movrne	%l6,	%l3,	%g5
	movvc	%xcc,	%o1,	%i3
	udivx	%l0,	0x065F,	%g4
	sllx	%o4,	%o6,	%g2
	fmovda	%icc,	%f25,	%f20
	sir	0x0883
	array16	%o2,	%o3,	%i1
	umulcc	%g1,	%i0,	%i5
	edge16	%l2,	%o7,	%i2
	sth	%g6,	[%l7 + 0x50]
	ldub	[%l7 + 0x37],	%i6
	edge8n	%l5,	%o5,	%i7
	xorcc	%i4,	0x0386,	%g3
	smul	%g7,	%l1,	%l4
	ldd	[%l7 + 0x08],	%i6
	fmovsn	%icc,	%f7,	%f5
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	fmovdpos	%xcc,	%f31,	%f22
	fmovsneg	%xcc,	%f0,	%f30
	fsrc2	%f8,	%f0
	sethi	0x13AB,	%l3
	fmovdg	%icc,	%f16,	%f3
	movleu	%xcc,	%i3,	%l0
	smul	%o1,	%g4,	%o4
	mulx	%g2,	%o2,	%o3
	edge32ln	%i1,	%g1,	%i0
	movvs	%xcc,	%o6,	%l2
	edge32l	%i5,	%o7,	%i2
	edge8	%g6,	%i6,	%l5
	popc	0x04AC,	%i7
	ldx	[%l7 + 0x20],	%o5
	array8	%g3,	%g7,	%i4
	andncc	%l1,	%l4,	%o0
	movn	%icc,	%l6,	%g5
	fcmpd	%fcc3,	%f6,	%f0
	fands	%f28,	%f8,	%f15
	movrlez	%i3,	%l0,	%l3
	movrgz	%g4,	0x174,	%o1
	movrgz	%g2,	%o2,	%o4
	edge8n	%i1,	%o3,	%g1
	movvc	%xcc,	%i0,	%l2
	edge32	%i5,	%o6,	%o7
	srl	%i2,	0x12,	%i6
	srax	%l5,	%g6,	%o5
	umul	%g3,	%i7,	%g7
	ldx	[%l7 + 0x30],	%l1
	udivcc	%i4,	0x0888,	%o0
	array8	%l4,	%l6,	%g5
	fmovdpos	%icc,	%f14,	%f26
	srax	%l0,	%i3,	%g4
	fpsub32	%f2,	%f6,	%f26
	udivx	%o1,	0x0D54,	%g2
	xorcc	%o2,	0x0F98,	%o4
	st	%f0,	[%l7 + 0x44]
	movrlz	%l3,	0x1D7,	%o3
	subc	%g1,	%i1,	%l2
	fmovrsgz	%i5,	%f12,	%f7
	fmovdg	%icc,	%f27,	%f10
	fpadd32s	%f2,	%f25,	%f2
	ldub	[%l7 + 0x59],	%i0
	sdivcc	%o7,	0x0C39,	%i2
	fones	%f24
	movrlez	%i6,	0x106,	%o6
	fmovdle	%xcc,	%f24,	%f0
	movleu	%icc,	%g6,	%l5
	fones	%f5
	edge8l	%o5,	%g3,	%i7
	and	%l1,	0x163C,	%g7
	array32	%i4,	%l4,	%o0
	andcc	%g5,	%l0,	%i3
	fmovsne	%xcc,	%f21,	%f25
	fmovrsne	%l6,	%f19,	%f1
	fmovrslz	%o1,	%f25,	%f14
	fmovsneg	%icc,	%f21,	%f30
	xnor	%g4,	0x0412,	%o2
	sra	%o4,	%l3,	%o3
	ld	[%l7 + 0x44],	%f9
	srax	%g1,	%i1,	%l2
	lduw	[%l7 + 0x58],	%g2
	fcmpeq16	%f2,	%f14,	%i5
	move	%xcc,	%o7,	%i2
	fmovdn	%xcc,	%f13,	%f0
	sdiv	%i0,	0x0B36,	%o6
	udivx	%g6,	0x18CD,	%l5
	fcmpne32	%f6,	%f30,	%i6
	stx	%g3,	[%l7 + 0x20]
	xorcc	%i7,	0x0CB7,	%l1
	edge8l	%o5,	%g7,	%i4
	fabsd	%f4,	%f0
	movrlez	%o0,	%g5,	%l4
	fnors	%f8,	%f9,	%f3
	fcmped	%fcc3,	%f10,	%f12
	fpsub32	%f4,	%f16,	%f22
	movrlz	%i3,	%l0,	%l6
	fabsd	%f18,	%f12
	std	%f6,	[%l7 + 0x10]
	ldx	[%l7 + 0x58],	%g4
	mulscc	%o2,	%o1,	%l3
	edge16	%o3,	%o4,	%i1
	sub	%g1,	%l2,	%g2
	fxors	%f31,	%f21,	%f18
	and	%i5,	0x0E67,	%i2
	fcmpne16	%f18,	%f24,	%i0
	edge8	%o7,	%g6,	%l5
	andncc	%o6,	%g3,	%i6
	addccc	%i7,	%l1,	%g7
	sll	%o5,	0x0E,	%o0
	edge32l	%g5,	%l4,	%i4
	movgu	%icc,	%l0,	%l6
	movge	%xcc,	%i3,	%g4
	fmovse	%icc,	%f20,	%f18
	st	%f8,	[%l7 + 0x08]
	ldub	[%l7 + 0x44],	%o2
	sll	%l3,	0x0E,	%o1
	srax	%o4,	%i1,	%g1
	movneg	%icc,	%o3,	%l2
	ldd	[%l7 + 0x28],	%g2
	ldsh	[%l7 + 0x10],	%i2
	addccc	%i0,	%i5,	%g6
	movcc	%xcc,	%l5,	%o7
	bshuffle	%f30,	%f18,	%f18
	st	%f13,	[%l7 + 0x44]
	stb	%g3,	[%l7 + 0x46]
	fmul8x16au	%f12,	%f25,	%f22
	srax	%i6,	0x0E,	%o6
	addccc	%l1,	%i7,	%g7
	movne	%xcc,	%o5,	%g5
	lduh	[%l7 + 0x54],	%l4
	popc	0x161D,	%i4
	stb	%l0,	[%l7 + 0x16]
	movpos	%xcc,	%o0,	%l6
	xnorcc	%i3,	0x1389,	%g4
	ldsb	[%l7 + 0x63],	%o2
	fmovsg	%icc,	%f2,	%f8
	movg	%icc,	%o1,	%o4
	add	%i1,	0x18C4,	%g1
	sdiv	%o3,	0x0F23,	%l3
	ldsb	[%l7 + 0x6C],	%l2
	fnor	%f22,	%f0,	%f2
	fcmpne32	%f26,	%f24,	%i2
	ldx	[%l7 + 0x60],	%g2
	alignaddr	%i5,	%g6,	%i0
	udivcc	%l5,	0x13B6,	%o7
	srax	%i6,	%g3,	%l1
	sdivcc	%i7,	0x1496,	%g7
	movn	%xcc,	%o5,	%o6
	lduw	[%l7 + 0x0C],	%l4
	andcc	%g5,	0x1C41,	%i4
	faligndata	%f30,	%f4,	%f24
	sdiv	%l0,	0x1B7E,	%o0
	movg	%xcc,	%l6,	%i3
	fone	%f8
	fmovrsne	%g4,	%f2,	%f27
	move	%xcc,	%o2,	%o4
	nop
	set	0x18, %o6
	ldsb	[%l7 + %o6],	%o1
	srax	%g1,	%i1,	%o3
	movl	%xcc,	%l3,	%i2
	add	%l2,	0x106B,	%g2
	fxnor	%f14,	%f4,	%f12
	subccc	%g6,	0x15F5,	%i0
	ldx	[%l7 + 0x50],	%i5
	sir	0x097E
	ldsb	[%l7 + 0x5A],	%l5
	ldsw	[%l7 + 0x14],	%i6
	alignaddr	%g3,	%o7,	%i7
	movre	%g7,	%o5,	%o6
	fmul8x16	%f2,	%f18,	%f30
	mulx	%l4,	%g5,	%i4
	umul	%l1,	0x0DE7,	%l0
	fmovspos	%xcc,	%f9,	%f16
	fmul8sux16	%f10,	%f8,	%f12
	fornot2s	%f5,	%f16,	%f13
	fmovd	%f24,	%f12
	ldub	[%l7 + 0x11],	%o0
	addc	%i3,	0x1CA9,	%g4
	save %o2, %o4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f30,	%f4,	%f31
	add	%l6,	%i1,	%g1
	sll	%o3,	%i2,	%l2
	movpos	%icc,	%g2,	%l3
	sethi	0x0DAA,	%i0
	popc	0x0F9F,	%g6
	movle	%xcc,	%l5,	%i5
	for	%f4,	%f16,	%f6
	movvc	%icc,	%g3,	%i6
	sllx	%o7,	0x1F,	%i7
	udivcc	%o5,	0x1628,	%o6
	fpadd32s	%f18,	%f25,	%f16
	fcmped	%fcc0,	%f12,	%f18
	add	%g7,	0x1817,	%l4
	ld	[%l7 + 0x08],	%f11
	fmovrsne	%g5,	%f19,	%f25
	xnor	%l1,	%l0,	%o0
	ldsw	[%l7 + 0x20],	%i3
	stx	%g4,	[%l7 + 0x20]
	movneg	%icc,	%o2,	%i4
	stx	%o1,	[%l7 + 0x30]
	fmovsne	%xcc,	%f6,	%f14
	fcmpd	%fcc0,	%f18,	%f18
	ld	[%l7 + 0x54],	%f17
	movgu	%icc,	%l6,	%o4
	restore %g1, %o3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l2,	%i1,	%l3
	movrlez	%g2,	0x0F0,	%g6
	mulx	%i0,	0x03ED,	%l5
	fmovdgu	%xcc,	%f27,	%f20
	std	%f28,	[%l7 + 0x38]
	ldsh	[%l7 + 0x56],	%g3
	sdivx	%i5,	0x1473,	%o7
	ldsh	[%l7 + 0x62],	%i6
	edge8ln	%o5,	%i7,	%o6
	edge32n	%l4,	%g5,	%l1
	xnorcc	%g7,	0x049C,	%l0
	srlx	%i3,	%o0,	%g4
	siam	0x1
	edge8	%o2,	%i4,	%l6
	xnorcc	%o4,	%g1,	%o1
	udiv	%o3,	0x1ABD,	%l2
	stx	%i1,	[%l7 + 0x60]
	edge8ln	%l3,	%i2,	%g6
	nop
	set	0x67, %l6
	ldsb	[%l7 + %l6],	%i0
	std	%f30,	[%l7 + 0x60]
	sth	%l5,	[%l7 + 0x36]
	movleu	%icc,	%g2,	%g3
	mulscc	%o7,	0x19F8,	%i6
	srax	%o5,	%i7,	%i5
	sub	%l4,	%g5,	%l1
	sth	%g7,	[%l7 + 0x1E]
	movpos	%icc,	%l0,	%i3
	edge32ln	%o6,	%o0,	%g4
	stb	%i4,	[%l7 + 0x48]
	ld	[%l7 + 0x10],	%f5
	movcc	%icc,	%o2,	%l6
	st	%f19,	[%l7 + 0x54]
	or	%g1,	%o4,	%o3
	pdist	%f8,	%f6,	%f22
	andn	%o1,	%i1,	%l2
	smul	%l3,	0x18F4,	%g6
	movpos	%icc,	%i0,	%l5
	movge	%xcc,	%g2,	%g3
	addcc	%i2,	0x08F6,	%i6
	movvc	%icc,	%o7,	%o5
	fmovsa	%xcc,	%f9,	%f1
	movrgez	%i7,	0x281,	%l4
	movre	%g5,	%i5,	%l1
	subc	%g7,	0x0B28,	%l0
	xnor	%o6,	0x1CB6,	%o0
	fmovdcc	%icc,	%f0,	%f2
	fmul8x16al	%f29,	%f20,	%f12
	umulcc	%i3,	%i4,	%g4
	srax	%l6,	0x0E,	%o2
	fexpand	%f24,	%f8
	subcc	%g1,	%o3,	%o4
	lduh	[%l7 + 0x46],	%o1
	edge16ln	%l2,	%i1,	%g6
	edge16l	%i0,	%l5,	%l3
	movge	%icc,	%g2,	%i2
	mulx	%i6,	0x1AAF,	%o7
	edge16n	%g3,	%i7,	%l4
	edge8ln	%o5,	%i5,	%g5
	sub	%g7,	%l1,	%o6
	array8	%l0,	%i3,	%i4
	sir	0x0F2B
	ldsw	[%l7 + 0x4C],	%o0
	movneg	%xcc,	%g4,	%o2
	lduh	[%l7 + 0x38],	%g1
	edge16l	%o3,	%l6,	%o1
	fpsub32s	%f8,	%f5,	%f31
	sllx	%l2,	%o4,	%g6
	fcmpne16	%f18,	%f12,	%i1
	ldsh	[%l7 + 0x2A],	%i0
	add	%l5,	%l3,	%g2
	sth	%i6,	[%l7 + 0x60]
	fmovrsgez	%i2,	%f7,	%f27
	addccc	%g3,	0x02DF,	%o7
	movrlez	%l4,	%i7,	%i5
	edge8	%o5,	%g5,	%l1
	movcc	%xcc,	%o6,	%g7
	edge32	%i3,	%l0,	%i4
	fmul8x16au	%f2,	%f7,	%f8
	andcc	%g4,	0x0F20,	%o0
	and	%g1,	%o2,	%o3
	alignaddrl	%l6,	%l2,	%o4
	addcc	%g6,	0x176E,	%o1
	fornot1s	%f30,	%f27,	%f14
	stw	%i1,	[%l7 + 0x44]
	orcc	%l5,	0x0618,	%i0
	or	%l3,	%i6,	%g2
	popc	%g3,	%i2
	array32	%l4,	%o7,	%i7
	fcmpne16	%f16,	%f10,	%o5
	udivx	%i5,	0x0CFE,	%l1
	fmul8x16au	%f22,	%f29,	%f26
	ldsh	[%l7 + 0x24],	%o6
	array8	%g5,	%i3,	%l0
	fand	%f0,	%f22,	%f4
	fcmped	%fcc3,	%f26,	%f16
	movrne	%g7,	0x193,	%i4
	edge32n	%g4,	%g1,	%o2
	andncc	%o3,	%o0,	%l6
	ldsh	[%l7 + 0x60],	%o4
	smulcc	%g6,	0x1E07,	%o1
	smulcc	%i1,	%l5,	%l2
	andn	%i0,	0x04B4,	%l3
	movge	%icc,	%g2,	%g3
	sub	%i6,	%i2,	%o7
	edge8l	%l4,	%o5,	%i7
	edge32l	%i5,	%o6,	%l1
	nop
	set	0x48, %o5
	lduh	[%l7 + %o5],	%g5
	edge32l	%l0,	%g7,	%i4
	add	%i3,	0x098E,	%g4
	edge16ln	%o2,	%o3,	%o0
	edge32ln	%l6,	%g1,	%g6
	movpos	%icc,	%o4,	%o1
	movg	%icc,	%i1,	%l5
	fmul8ulx16	%f26,	%f18,	%f24
	edge16ln	%i0,	%l2,	%l3
	edge8n	%g3,	%g2,	%i6
	fpadd32	%f12,	%f22,	%f24
	fmovdvs	%icc,	%f9,	%f16
	st	%f30,	[%l7 + 0x74]
	srax	%i2,	%o7,	%o5
	mulscc	%i7,	%i5,	%l4
	sra	%l1,	0x08,	%o6
	ldx	[%l7 + 0x48],	%g5
	edge16l	%g7,	%l0,	%i3
	or	%i4,	%g4,	%o3
	andn	%o2,	0x0F5E,	%l6
	xor	%g1,	0x1D1A,	%g6
	ldd	[%l7 + 0x70],	%f8
	sir	0x01F2
	nop
	set	0x48, %o3
	stw	%o4,	[%l7 + %o3]
	sllx	%o0,	0x1F,	%o1
	xor	%l5,	0x0D14,	%i0
	fmovdpos	%icc,	%f30,	%f6
	movrlez	%l2,	%l3,	%i1
	lduw	[%l7 + 0x48],	%g3
	edge32l	%g2,	%i6,	%o7
	movge	%icc,	%i2,	%o5
	sir	0x131A
	move	%xcc,	%i5,	%i7
	ld	[%l7 + 0x28],	%f12
	edge8	%l1,	%l4,	%o6
	xnorcc	%g5,	0x1B46,	%g7
	andcc	%i3,	%l0,	%g4
	mulx	%o3,	%o2,	%i4
	stx	%l6,	[%l7 + 0x18]
	edge16	%g1,	%g6,	%o0
	subcc	%o1,	%l5,	%i0
	ldd	[%l7 + 0x40],	%f28
	nop
	set	0x12, %i6
	ldsb	[%l7 + %i6],	%l2
	stx	%o4,	[%l7 + 0x18]
	movg	%icc,	%l3,	%g3
	ldub	[%l7 + 0x23],	%g2
	sdivcc	%i6,	0x12C5,	%i1
	and	%o7,	%i2,	%i5
	ldx	[%l7 + 0x18],	%o5
	movleu	%xcc,	%i7,	%l4
	umul	%o6,	%g5,	%l1
	or	%g7,	0x1F6D,	%i3
	ldsw	[%l7 + 0x24],	%g4
	movn	%xcc,	%l0,	%o3
	edge16	%o2,	%i4,	%g1
	edge8ln	%l6,	%o0,	%o1
	sdiv	%l5,	0x0D3D,	%g6
	srl	%l2,	0x18,	%o4
	lduh	[%l7 + 0x46],	%l3
	fornot1s	%f17,	%f7,	%f29
	mova	%xcc,	%g3,	%i0
	movge	%xcc,	%g2,	%i6
	nop
	set	0x74, %o2
	stw	%o7,	[%l7 + %o2]
	sth	%i1,	[%l7 + 0x76]
	subc	%i5,	%i2,	%i7
	fmovdne	%xcc,	%f30,	%f16
	srax	%o5,	%l4,	%g5
	srax	%o6,	0x00,	%l1
	fmovdcs	%icc,	%f28,	%f5
	udiv	%i3,	0x0979,	%g7
	movrlez	%g4,	%o3,	%l0
	umulcc	%i4,	0x0A75,	%o2
	stb	%l6,	[%l7 + 0x23]
	udivx	%g1,	0x0687,	%o0
	movle	%icc,	%o1,	%l5
	sdivx	%l2,	0x0889,	%o4
	fmovrde	%g6,	%f24,	%f14
	alignaddrl	%l3,	%i0,	%g3
	fnot2	%f8,	%f22
	alignaddr	%g2,	%i6,	%o7
	save %i1, %i5, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%o5,	%i7
	ld	[%l7 + 0x60],	%f26
	edge16n	%g5,	%o6,	%l1
	edge16n	%l4,	%i3,	%g7
	fcmpgt32	%f28,	%f12,	%o3
	fmuld8sux16	%f28,	%f14,	%f30
	fmovsge	%xcc,	%f27,	%f5
	ldx	[%l7 + 0x20],	%g4
	fand	%f16,	%f22,	%f10
	mulx	%i4,	0x1F56,	%o2
	fxors	%f13,	%f11,	%f23
	andncc	%l6,	%g1,	%l0
	edge32l	%o1,	%o0,	%l5
	stb	%o4,	[%l7 + 0x19]
	fmovdcs	%xcc,	%f1,	%f19
	mova	%xcc,	%l2,	%g6
	movle	%icc,	%l3,	%i0
	or	%g3,	0x0154,	%g2
	udivcc	%i6,	0x02CA,	%o7
	movcc	%icc,	%i1,	%i2
	addc	%i5,	0x1F4C,	%i7
	andn	%o5,	0x067D,	%o6
	move	%xcc,	%l1,	%l4
	st	%f5,	[%l7 + 0x50]
	movgu	%xcc,	%g5,	%g7
	edge16n	%o3,	%g4,	%i3
	fabss	%f14,	%f20
	movre	%o2,	0x1B6,	%i4
	stw	%l6,	[%l7 + 0x38]
	save %g1, 0x01CC, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f26,	%f18,	%f18
	fmovrdlz	%o0,	%f18,	%f30
	fcmpgt32	%f16,	%f20,	%o1
	edge8ln	%l5,	%l2,	%o4
	srl	%g6,	%i0,	%g3
	fcmpeq16	%f28,	%f8,	%l3
	smul	%g2,	0x16B2,	%i6
	movgu	%xcc,	%i1,	%o7
	stw	%i5,	[%l7 + 0x7C]
	sub	%i7,	%o5,	%i2
	movrgz	%o6,	%l4,	%l1
	movl	%icc,	%g5,	%o3
	orncc	%g4,	%i3,	%o2
	nop
	set	0x5A, %l5
	ldsb	[%l7 + %l5],	%i4
	udivcc	%l6,	0x085C,	%g7
	fones	%f5
	st	%f1,	[%l7 + 0x60]
	mova	%xcc,	%l0,	%o0
	movrne	%o1,	%l5,	%g1
	xnorcc	%l2,	0x1C93,	%g6
	sth	%o4,	[%l7 + 0x0E]
	andcc	%g3,	0x0CDC,	%l3
	nop
	set	0x2C, %i4
	lduw	[%l7 + %i4],	%i0
	alignaddrl	%g2,	%i6,	%i1
	fexpand	%f22,	%f26
	xnor	%o7,	%i5,	%i7
	sdivcc	%i2,	0x0050,	%o6
	movcs	%xcc,	%o5,	%l1
	fmovsleu	%icc,	%f7,	%f14
	xnorcc	%g5,	0x0AD0,	%l4
	move	%icc,	%g4,	%i3
	edge32n	%o3,	%o2,	%l6
	edge8n	%i4,	%l0,	%o0
	movle	%icc,	%g7,	%o1
	alignaddrl	%l5,	%g1,	%l2
	ldd	[%l7 + 0x70],	%o4
	movrgez	%g6,	0x07E,	%g3
	fmul8x16au	%f10,	%f12,	%f18
	addccc	%l3,	%i0,	%i6
	fpsub16s	%f3,	%f11,	%f7
	fmovsg	%icc,	%f15,	%f0
	smul	%i1,	%o7,	%g2
	stx	%i5,	[%l7 + 0x38]
	andncc	%i2,	%o6,	%i7
	ldd	[%l7 + 0x50],	%f6
	edge16	%l1,	%o5,	%l4
	movge	%icc,	%g5,	%g4
	fmovrsgez	%i3,	%f1,	%f29
	edge8	%o2,	%l6,	%o3
	movrgz	%i4,	%l0,	%g7
	movvc	%icc,	%o1,	%o0
	lduh	[%l7 + 0x4C],	%g1
	movrne	%l2,	0x3BB,	%l5
	subcc	%o4,	%g3,	%l3
	sll	%i0,	0x06,	%g6
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	movrgez	%g2,	%i5,	%i2
	sethi	0x15CF,	%o6
	movle	%icc,	%o7,	%i7
	udivx	%o5,	0x1304,	%l4
	movvs	%icc,	%g5,	%g4
	movn	%xcc,	%i3,	%l1
	array16	%o2,	%o3,	%l6
	fmovdcc	%xcc,	%f4,	%f27
	sllx	%i4,	0x04,	%g7
	andncc	%l0,	%o0,	%o1
	movg	%icc,	%g1,	%l5
	fnand	%f8,	%f26,	%f6
	orncc	%o4,	0x0306,	%g3
	movle	%icc,	%l3,	%l2
	mulx	%g6,	%i0,	%i6
	movg	%xcc,	%i1,	%i5
	fmovd	%f2,	%f30
	movleu	%xcc,	%g2,	%i2
	fcmple16	%f10,	%f20,	%o6
	movcc	%xcc,	%o7,	%o5
	fnegs	%f18,	%f25
	nop
	set	0x54, %o0
	stw	%l4,	[%l7 + %o0]
	array32	%i7,	%g4,	%i3
	movle	%icc,	%l1,	%g5
	ldub	[%l7 + 0x75],	%o2
	movg	%icc,	%l6,	%i4
	sra	%o3,	0x04,	%l0
	sllx	%g7,	0x0C,	%o1
	edge8ln	%o0,	%l5,	%g1
	movne	%icc,	%g3,	%l3
	edge32n	%l2,	%o4,	%g6
	subc	%i0,	%i6,	%i1
	movneg	%xcc,	%g2,	%i5
	stb	%o6,	[%l7 + 0x30]
	addcc	%i2,	0x153D,	%o7
	restore %o5, 0x0414, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i7,	%i3,	%l1
	andncc	%g4,	%o2,	%l6
	subc	%g5,	0x1B6D,	%i4
	edge32ln	%l0,	%o3,	%o1
	array32	%g7,	%l5,	%g1
	movneg	%icc,	%g3,	%o0
	movvc	%xcc,	%l2,	%l3
	ldsb	[%l7 + 0x77],	%g6
	edge32n	%o4,	%i0,	%i6
	addc	%i1,	0x048D,	%g2
	movrlz	%o6,	0x215,	%i2
	subc	%i5,	0x041C,	%o5
	andn	%o7,	%l4,	%i3
	siam	0x1
	save %i7, %g4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o2,	0x043B,	%g5
	bshuffle	%f6,	%f2,	%f26
	movpos	%xcc,	%i4,	%l0
	fmovdcc	%xcc,	%f8,	%f0
	ldsh	[%l7 + 0x6C],	%o3
	movrne	%o1,	0x2ED,	%g7
	orn	%l6,	%l5,	%g1
	fmovse	%xcc,	%f22,	%f5
	movrlz	%o0,	%g3,	%l2
	mulx	%g6,	%l3,	%i0
	popc	0x158F,	%o4
	movn	%xcc,	%i1,	%i6
	fmovsvs	%xcc,	%f19,	%f24
	ldsw	[%l7 + 0x44],	%g2
	movpos	%xcc,	%i2,	%o6
	edge8ln	%i5,	%o7,	%l4
	subc	%i3,	%i7,	%g4
	xnor	%o5,	%o2,	%g5
	xorcc	%l1,	%i4,	%o3
	fnegs	%f23,	%f27
	orncc	%o1,	%l0,	%l6
	udivx	%g7,	0x106A,	%l5
	addccc	%g1,	0x018E,	%g3
	move	%xcc,	%l2,	%g6
	movcs	%icc,	%o0,	%i0
	sdivcc	%o4,	0x09D3,	%l3
	mulx	%i6,	0x1F3D,	%g2
	sub	%i2,	0x1313,	%i1
	fxors	%f11,	%f6,	%f18
	fmovdcc	%xcc,	%f18,	%f21
	movcc	%xcc,	%o6,	%o7
	ld	[%l7 + 0x68],	%f7
	fpadd16	%f14,	%f2,	%f22
	ldx	[%l7 + 0x20],	%l4
	fmovrsgz	%i3,	%f6,	%f3
	fornot1	%f0,	%f6,	%f26
	orncc	%i5,	%g4,	%i7
	stb	%o5,	[%l7 + 0x46]
	movge	%icc,	%g5,	%o2
	ldsb	[%l7 + 0x3B],	%i4
	sub	%l1,	0x18BE,	%o1
	fmovdvs	%icc,	%f20,	%f21
	ldd	[%l7 + 0x78],	%f28
	ldub	[%l7 + 0x16],	%o3
	lduh	[%l7 + 0x78],	%l6
	movleu	%xcc,	%g7,	%l5
	xorcc	%g1,	%l0,	%l2
	edge8l	%g6,	%g3,	%i0
	movrlz	%o4,	0x112,	%o0
	sub	%i6,	0x033F,	%g2
	sra	%i2,	%l3,	%i1
	fones	%f27
	fmovdleu	%xcc,	%f27,	%f22
	fmovsneg	%icc,	%f18,	%f26
	andn	%o6,	0x0396,	%l4
	alignaddrl	%o7,	%i3,	%i5
	ldub	[%l7 + 0x3D],	%g4
	ldub	[%l7 + 0x57],	%i7
	movrne	%o5,	0x261,	%g5
	fnors	%f0,	%f31,	%f16
	siam	0x3
	mova	%icc,	%o2,	%l1
	addccc	%i4,	%o1,	%o3
	udiv	%g7,	0x1DFA,	%l6
	fmovrslez	%l5,	%f27,	%f10
	movrlz	%l0,	%l2,	%g1
	edge32l	%g6,	%g3,	%i0
	ldsh	[%l7 + 0x52],	%o0
	fmul8x16	%f28,	%f24,	%f20
	addccc	%o4,	0x18A7,	%g2
	std	%f16,	[%l7 + 0x50]
	fmovdge	%xcc,	%f13,	%f12
	fmovdgu	%xcc,	%f28,	%f1
	ldd	[%l7 + 0x68],	%f16
	fmovsg	%xcc,	%f29,	%f31
	udivcc	%i6,	0x0D65,	%i2
	smul	%l3,	%i1,	%l4
	xnorcc	%o7,	%i3,	%i5
	fpsub32	%f28,	%f16,	%f14
	srl	%g4,	%i7,	%o5
	orcc	%o6,	%o2,	%l1
	ldd	[%l7 + 0x10],	%f8
	ldd	[%l7 + 0x68],	%g4
	fones	%f14
	sth	%i4,	[%l7 + 0x66]
	pdist	%f24,	%f26,	%f24
	movgu	%xcc,	%o1,	%o3
	movg	%icc,	%g7,	%l5
	edge16l	%l0,	%l6,	%g1
	movre	%l2,	%g3,	%g6
	mulx	%o0,	%i0,	%g2
	fmovsa	%xcc,	%f18,	%f15
	xor	%i6,	0x0F80,	%i2
	addc	%l3,	%i1,	%l4
	std	%f14,	[%l7 + 0x70]
	sll	%o7,	%i3,	%i5
	smulcc	%g4,	0x0445,	%o4
	edge32n	%o5,	%o6,	%o2
	lduh	[%l7 + 0x18],	%l1
	alignaddrl	%g5,	%i4,	%i7
	sll	%o3,	%g7,	%o1
	fnors	%f6,	%f24,	%f3
	movcc	%icc,	%l0,	%l6
	movl	%xcc,	%l5,	%g1
	orncc	%l2,	0x1BF0,	%g3
	addccc	%o0,	%i0,	%g6
	popc	0x138B,	%i6
	edge16n	%i2,	%g2,	%l3
	udivcc	%i1,	0x1DEB,	%o7
	ldx	[%l7 + 0x08],	%l4
	fnegs	%f8,	%f19
	edge8	%i5,	%g4,	%o4
	movneg	%xcc,	%o5,	%o6
	sllx	%o2,	%l1,	%i3
	mulx	%g5,	0x0294,	%i4
	sir	0x1BF1
	fnand	%f26,	%f10,	%f4
	and	%i7,	%g7,	%o1
	srl	%o3,	0x03,	%l6
	popc	0x0402,	%l0
	alignaddr	%g1,	%l5,	%g3
	edge8l	%l2,	%o0,	%i0
	fors	%f22,	%f23,	%f21
	edge16n	%i6,	%i2,	%g2
	sra	%g6,	0x1F,	%i1
	fmovdl	%xcc,	%f18,	%f17
	edge32n	%l3,	%l4,	%o7
	movl	%icc,	%g4,	%i5
	ldub	[%l7 + 0x5C],	%o5
	ldd	[%l7 + 0x28],	%f0
	andn	%o4,	%o2,	%o6
	fone	%f0
	edge32	%i3,	%g5,	%i4
	addc	%i7,	%l1,	%o1
	movgu	%xcc,	%o3,	%l6
	udivcc	%l0,	0x09C8,	%g7
	ldd	[%l7 + 0x08],	%l4
	sra	%g1,	0x00,	%l2
	addccc	%o0,	0x171B,	%g3
	and	%i6,	%i0,	%i2
	sir	0x1C13
	fmovdpos	%xcc,	%f19,	%f31
	movleu	%xcc,	%g2,	%g6
	move	%icc,	%i1,	%l4
	subcc	%o7,	%l3,	%g4
	fsrc1	%f4,	%f22
	movcc	%xcc,	%i5,	%o4
	fmovsgu	%icc,	%f8,	%f30
	movgu	%icc,	%o2,	%o5
	fzero	%f4
	orncc	%o6,	%i3,	%g5
	fpsub16s	%f28,	%f13,	%f0
	edge32ln	%i4,	%l1,	%i7
	orn	%o3,	0x02A4,	%o1
	fmovrdlez	%l6,	%f18,	%f28
	movrgez	%g7,	%l5,	%g1
	sir	0x0B5A
	udiv	%l0,	0x157D,	%l2
	fmovdcc	%icc,	%f16,	%f12
	ldsh	[%l7 + 0x48],	%o0
	udivx	%i6,	0x1FE3,	%g3
	movg	%icc,	%i0,	%g2
	fpadd16s	%f23,	%f22,	%f11
	fandnot1s	%f6,	%f8,	%f10
	fmuld8ulx16	%f26,	%f31,	%f4
	lduw	[%l7 + 0x18],	%i2
	edge32	%i1,	%g6,	%o7
	alignaddr	%l4,	%l3,	%g4
	fmovsneg	%xcc,	%f5,	%f15
	movgu	%icc,	%i5,	%o2
	srax	%o5,	%o6,	%i3
	fpadd16s	%f18,	%f18,	%f11
	udiv	%g5,	0x154E,	%o4
	ldsb	[%l7 + 0x08],	%i4
	ldd	[%l7 + 0x50],	%i6
	ldsb	[%l7 + 0x56],	%l1
	xnor	%o3,	0x1529,	%o1
	array32	%g7,	%l6,	%g1
	stx	%l5,	[%l7 + 0x70]
	ldd	[%l7 + 0x10],	%f18
	alignaddr	%l2,	%o0,	%l0
	add	%g3,	%i6,	%i0
	andcc	%i2,	%g2,	%g6
	fmovsvs	%xcc,	%f7,	%f24
	fsrc2	%f16,	%f0
	fmovsge	%xcc,	%f0,	%f16
	andncc	%o7,	%i1,	%l3
	movn	%icc,	%g4,	%i5
	lduw	[%l7 + 0x18],	%l4
	udivcc	%o2,	0x0922,	%o6
	sub	%i3,	0x1CDA,	%g5
	fmovd	%f4,	%f30
	sir	0x04AA
	ldsb	[%l7 + 0x7D],	%o4
	st	%f1,	[%l7 + 0x68]
	movcs	%xcc,	%o5,	%i4
	edge8n	%l1,	%o3,	%i7
	fabsd	%f26,	%f8
	sdivx	%g7,	0x1021,	%l6
	orncc	%o1,	0x040C,	%l5
	xor	%l2,	%g1,	%o0
	sub	%l0,	%g3,	%i0
	addcc	%i6,	%g2,	%g6
	sethi	0x04F5,	%o7
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%i2
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	addccc	%g4,	0x1A0F,	%l4
	fand	%f2,	%f10,	%f20
	edge16ln	%i5,	%o6,	%o2
	mova	%xcc,	%g5,	%o4
	fpsub32	%f22,	%f26,	%f22
	ld	[%l7 + 0x34],	%f1
	sth	%o5,	[%l7 + 0x18]
	nop
	set	0x55, %l4
	ldub	[%l7 + %l4],	%i3
	movrlez	%i4,	0x2D6,	%o3
	st	%f1,	[%l7 + 0x2C]
	movneg	%xcc,	%i7,	%l1
	edge16n	%g7,	%l6,	%l5
	fornot1s	%f23,	%f28,	%f5
	movl	%xcc,	%l2,	%o1
	or	%o0,	0x1160,	%l0
	edge16l	%g3,	%g1,	%i6
	fmovsle	%xcc,	%f20,	%f8
	fcmple16	%f30,	%f6,	%i0
	array32	%g2,	%o7,	%i2
	fpsub16	%f2,	%f28,	%f24
	lduw	[%l7 + 0x50],	%g6
	popc	0x18C2,	%l3
	edge8	%i1,	%l4,	%g4
	array8	%i5,	%o2,	%g5
	movvs	%icc,	%o4,	%o5
	movgu	%xcc,	%i3,	%i4
	movvc	%icc,	%o6,	%o3
	sth	%l1,	[%l7 + 0x2E]
	or	%i7,	%g7,	%l5
	sll	%l6,	%l2,	%o1
	sdivcc	%l0,	0x150E,	%g3
	popc	0x150E,	%g1
	edge16l	%i6,	%i0,	%o0
	andcc	%o7,	0x0D8A,	%g2
	add	%i2,	%g6,	%i1
	udivcc	%l3,	0x08C8,	%g4
	ldsb	[%l7 + 0x12],	%i5
	fmovdvs	%xcc,	%f5,	%f20
	fpadd32s	%f9,	%f16,	%f16
	orncc	%l4,	%o2,	%g5
	edge8	%o4,	%i3,	%i4
	add	%o6,	%o5,	%l1
	fcmpgt16	%f4,	%f30,	%i7
	fmovdgu	%xcc,	%f16,	%f2
	sllx	%o3,	%l5,	%l6
	array8	%l2,	%g7,	%l0
	andcc	%g3,	%o1,	%g1
	xnorcc	%i0,	%o0,	%i6
	edge32l	%o7,	%i2,	%g6
	smulcc	%i1,	%g2,	%l3
	movl	%xcc,	%g4,	%i5
	sir	0x0572
	fnegd	%f14,	%f18
	sdiv	%o2,	0x0299,	%l4
	faligndata	%f30,	%f10,	%f26
	fcmpgt16	%f20,	%f4,	%o4
	edge32l	%g5,	%i4,	%i3
	edge32n	%o5,	%l1,	%o6
	orncc	%i7,	%l5,	%l6
	fmovsge	%icc,	%f5,	%f24
	stb	%l2,	[%l7 + 0x15]
	xnor	%g7,	%l0,	%g3
	sub	%o1,	0x0D2F,	%o3
	udiv	%i0,	0x0065,	%g1
	udivcc	%i6,	0x196D,	%o7
	edge16l	%i2,	%o0,	%g6
	fandnot2	%f4,	%f12,	%f2
	edge8l	%i1,	%g2,	%g4
	movrgez	%i5,	0x391,	%o2
	sdivcc	%l3,	0x1052,	%l4
	ldx	[%l7 + 0x60],	%o4
	fnand	%f22,	%f20,	%f26
	std	%f28,	[%l7 + 0x78]
	xnor	%g5,	0x0E92,	%i3
	movrgz	%i4,	0x3D0,	%l1
	edge8l	%o6,	%o5,	%i7
	movgu	%xcc,	%l5,	%l2
	fmovrdne	%g7,	%f6,	%f26
	andncc	%l0,	%l6,	%g3
	edge16l	%o1,	%o3,	%g1
	fmovdneg	%xcc,	%f27,	%f17
	sdiv	%i0,	0x13B8,	%o7
	movge	%icc,	%i2,	%o0
	udiv	%g6,	0x08A4,	%i1
	andcc	%i6,	0x0721,	%g4
	umul	%i5,	0x0569,	%g2
	andn	%o2,	0x16F6,	%l4
	fmovdne	%xcc,	%f12,	%f10
	srl	%o4,	0x1B,	%g5
	fsrc1	%f24,	%f2
	fmovdne	%xcc,	%f31,	%f10
	fands	%f28,	%f30,	%f27
	mova	%icc,	%i3,	%i4
	fornot1	%f6,	%f26,	%f0
	xnorcc	%l1,	0x010D,	%l3
	smul	%o5,	0x1BA6,	%o6
	movg	%xcc,	%l5,	%i7
	ldd	[%l7 + 0x30],	%g6
	andn	%l2,	%l0,	%g3
	fnand	%f4,	%f12,	%f4
	sdivcc	%l6,	0x11ED,	%o1
	popc	%g1,	%i0
	movl	%icc,	%o7,	%i2
	edge8n	%o3,	%g6,	%o0
	edge32	%i1,	%i6,	%g4
	move	%icc,	%g2,	%i5
	sethi	0x0EBF,	%l4
	fandnot2	%f20,	%f26,	%f26
	sllx	%o4,	0x04,	%o2
	movrne	%i3,	%i4,	%g5
	sdivx	%l1,	0x010D,	%l3
	mulscc	%o6,	0x059E,	%o5
	subccc	%i7,	%l5,	%l2
	ld	[%l7 + 0x38],	%f19
	array8	%l0,	%g3,	%l6
	movleu	%icc,	%o1,	%g1
	udiv	%i0,	0x0EAF,	%o7
	save %i2, %g7, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o0,	0x14DE,	%g6
	ldx	[%l7 + 0x70],	%i6
	and	%g4,	0x06F0,	%i1
	fmovrsne	%i5,	%f14,	%f16
	umul	%g2,	%l4,	%o2
	sllx	%o4,	%i4,	%g5
	nop
	set	0x48, %i0
	std	%f4,	[%l7 + %i0]
	smulcc	%i3,	%l3,	%l1
	movcs	%xcc,	%o5,	%o6
	fandnot1	%f14,	%f10,	%f12
	ldsb	[%l7 + 0x58],	%i7
	alignaddr	%l5,	%l2,	%l0
	alignaddrl	%g3,	%o1,	%l6
	movg	%icc,	%i0,	%o7
	movvs	%icc,	%i2,	%g1
	sdivcc	%o3,	0x0D74,	%o0
	sir	0x1660
	movneg	%icc,	%g7,	%i6
	ldsb	[%l7 + 0x10],	%g6
	fpackfix	%f24,	%f4
	std	%f20,	[%l7 + 0x40]
	srl	%i1,	%i5,	%g2
	fsrc2s	%f19,	%f19
	ldd	[%l7 + 0x70],	%g4
	srlx	%l4,	0x02,	%o2
	subcc	%i4,	%g5,	%i3
	fands	%f6,	%f0,	%f0
	movre	%o4,	0x387,	%l1
	mulscc	%o5,	%l3,	%i7
	sub	%o6,	0x0865,	%l5
	sdivx	%l2,	0x17B2,	%g3
	ldsb	[%l7 + 0x1B],	%l0
	sllx	%l6,	0x00,	%i0
	udivcc	%o7,	0x0302,	%o1
	fcmpd	%fcc1,	%f4,	%f14
	add	%g1,	0x1DDB,	%o3
	and	%i2,	0x0711,	%o0
	edge16n	%i6,	%g7,	%i1
	edge8	%i5,	%g6,	%g2
	addcc	%l4,	%g4,	%o2
	lduw	[%l7 + 0x38],	%i4
	edge8n	%i3,	%g5,	%l1
	movne	%xcc,	%o5,	%l3
	edge16	%o4,	%i7,	%o6
	edge8ln	%l2,	%g3,	%l0
	sub	%l6,	%i0,	%o7
	edge16n	%o1,	%l5,	%g1
	edge16ln	%o3,	%o0,	%i2
	sdivx	%i6,	0x0F9C,	%g7
	andn	%i1,	0x0733,	%i5
	ldsb	[%l7 + 0x3E],	%g6
	and	%g2,	%l4,	%g4
	ldsw	[%l7 + 0x6C],	%i4
	movrne	%o2,	%g5,	%l1
	movleu	%xcc,	%o5,	%i3
	sub	%o4,	%l3,	%i7
	fornot1	%f16,	%f2,	%f30
	fcmpeq32	%f2,	%f14,	%l2
	movrlz	%o6,	%l0,	%g3
	sdivx	%l6,	0x0148,	%i0
	xnor	%o7,	0x0D03,	%o1
	sdiv	%l5,	0x09C8,	%g1
	and	%o3,	%i2,	%o0
	array32	%i6,	%i1,	%g7
	edge8l	%i5,	%g2,	%l4
	lduw	[%l7 + 0x34],	%g6
	fpackfix	%f8,	%f21
	smulcc	%i4,	0x065C,	%g4
	fpadd16	%f14,	%f20,	%f10
	edge16ln	%o2,	%g5,	%l1
	ldub	[%l7 + 0x13],	%o5
	movrlez	%i3,	%l3,	%i7
	movpos	%xcc,	%l2,	%o6
	fmovrslz	%l0,	%f19,	%f19
	movg	%icc,	%o4,	%l6
	movg	%xcc,	%g3,	%i0
	movne	%xcc,	%o1,	%o7
	subc	%g1,	%l5,	%i2
	fxor	%f30,	%f20,	%f22
	movvc	%xcc,	%o0,	%o3
	fcmpd	%fcc3,	%f12,	%f20
	fcmped	%fcc0,	%f8,	%f20
	ldsh	[%l7 + 0x2C],	%i1
	nop
	set	0x10, %o4
	stx	%i6,	[%l7 + %o4]
	orcc	%i5,	%g2,	%g7
	lduh	[%l7 + 0x30],	%l4
	subc	%g6,	%g4,	%o2
	ld	[%l7 + 0x34],	%f28
	movpos	%icc,	%i4,	%l1
	edge8n	%g5,	%o5,	%i3
	fmul8x16	%f10,	%f26,	%f2
	edge16ln	%i7,	%l3,	%o6
	andncc	%l2,	%o4,	%l0
	fmovdg	%icc,	%f19,	%f10
	move	%icc,	%l6,	%g3
	ld	[%l7 + 0x38],	%f11
	fmovsvc	%xcc,	%f4,	%f12
	fcmpgt16	%f24,	%f26,	%o1
	alignaddr	%i0,	%o7,	%l5
	sethi	0x1DFC,	%g1
	movle	%xcc,	%i2,	%o0
	edge8	%o3,	%i6,	%i5
	smul	%g2,	0x12CB,	%g7
	fmovsle	%xcc,	%f29,	%f7
	movle	%icc,	%i1,	%l4
	edge32ln	%g6,	%g4,	%i4
	movcc	%icc,	%l1,	%g5
	addc	%o5,	0x03A2,	%o2
	array8	%i3,	%l3,	%i7
	andn	%o6,	%o4,	%l0
	ldsh	[%l7 + 0x26],	%l2
	udivcc	%l6,	0x114F,	%g3
	movl	%icc,	%i0,	%o7
	ldsw	[%l7 + 0x2C],	%l5
	fmovdge	%icc,	%f14,	%f14
	ldsb	[%l7 + 0x3E],	%g1
	movrlez	%i2,	%o0,	%o3
	movvs	%icc,	%i6,	%i5
	movrne	%o1,	%g2,	%i1
	addccc	%g7,	%l4,	%g6
	ldx	[%l7 + 0x08],	%g4
	fandnot2s	%f26,	%f4,	%f3
	udivcc	%i4,	0x0BB3,	%l1
	movpos	%icc,	%g5,	%o5
	sir	0x11A5
	ld	[%l7 + 0x50],	%f13
	fmovsg	%xcc,	%f7,	%f2
	stx	%i3,	[%l7 + 0x40]
	mova	%icc,	%o2,	%l3
	orn	%o6,	0x082A,	%i7
	xor	%l0,	0x0040,	%l2
	fcmpes	%fcc3,	%f2,	%f20
	fornot1	%f22,	%f14,	%f28
	stw	%o4,	[%l7 + 0x50]
	fnot1s	%f29,	%f12
	sll	%g3,	0x09,	%i0
	sdivcc	%l6,	0x08E0,	%o7
	movle	%icc,	%l5,	%g1
	movvc	%xcc,	%o0,	%o3
	sir	0x1B31
	lduh	[%l7 + 0x14],	%i6
	movg	%xcc,	%i5,	%o1
	fmovrdne	%g2,	%f14,	%f10
	fnor	%f26,	%f10,	%f10
	movcs	%icc,	%i2,	%g7
	movl	%xcc,	%l4,	%g6
	ldsw	[%l7 + 0x30],	%g4
	fmovrdne	%i1,	%f2,	%f26
	fxors	%f0,	%f29,	%f3
	st	%f18,	[%l7 + 0x58]
	fcmped	%fcc1,	%f12,	%f14
	movn	%icc,	%i4,	%g5
	fnot2	%f10,	%f10
	fornot1s	%f16,	%f29,	%f5
	movre	%l1,	%i3,	%o5
	xorcc	%l3,	0x00C6,	%o2
	andn	%o6,	%l0,	%i7
	movgu	%xcc,	%o4,	%g3
	stw	%i0,	[%l7 + 0x50]
	fand	%f4,	%f20,	%f30
	ldub	[%l7 + 0x54],	%l6
	smul	%o7,	%l2,	%g1
	movle	%icc,	%o0,	%o3
	movcc	%icc,	%i6,	%l5
	ldd	[%l7 + 0x60],	%o0
	sdiv	%i5,	0x0D1E,	%g2
	smulcc	%g7,	0x0353,	%i2
	fcmpgt16	%f8,	%f18,	%g6
	movcs	%xcc,	%g4,	%l4
	andcc	%i4,	0x01D7,	%g5
	xnorcc	%i1,	%l1,	%o5
	fnors	%f25,	%f2,	%f23
	sub	%i3,	0x05FF,	%l3
	ldd	[%l7 + 0x38],	%f28
	fand	%f10,	%f26,	%f0
	andcc	%o6,	0x1763,	%o2
	fmovda	%xcc,	%f18,	%f31
	ld	[%l7 + 0x18],	%f13
	fpsub16	%f24,	%f6,	%f18
	ldsw	[%l7 + 0x18],	%i7
	fmovrde	%o4,	%f22,	%f4
	array16	%l0,	%i0,	%g3
	ldsw	[%l7 + 0x5C],	%o7
	edge32n	%l2,	%l6,	%o0
	sub	%g1,	0x1500,	%i6
	sub	%l5,	0x0A45,	%o1
	movleu	%xcc,	%o3,	%g2
	sdiv	%g7,	0x0221,	%i5
	sll	%i2,	%g4,	%l4
	srax	%i4,	%g6,	%g5
	fmovrdne	%l1,	%f20,	%f30
	fmovscs	%xcc,	%f25,	%f14
	add	%o5,	0x1ED7,	%i1
	fmovdcc	%xcc,	%f20,	%f0
	movpos	%icc,	%l3,	%o6
	movle	%icc,	%o2,	%i7
	subc	%o4,	0x0A7B,	%i3
	andn	%l0,	0x0F55,	%g3
	mulx	%i0,	0x09D8,	%o7
	addccc	%l2,	0x0367,	%l6
	fcmple32	%f18,	%f20,	%g1
	stx	%i6,	[%l7 + 0x18]
	array8	%l5,	%o1,	%o0
	fmovda	%icc,	%f6,	%f7
	fmovrdne	%g2,	%f8,	%f16
	movrlez	%o3,	%g7,	%i5
	movcs	%xcc,	%i2,	%l4
	ld	[%l7 + 0x74],	%f16
	sub	%g4,	0x1B80,	%i4
	subccc	%g6,	%l1,	%o5
	popc	0x0D32,	%i1
	array32	%g5,	%l3,	%o2
	srax	%i7,	0x16,	%o6
	movn	%icc,	%i3,	%o4
	xorcc	%l0,	0x0360,	%g3
	edge16l	%i0,	%l2,	%l6
	edge32	%g1,	%o7,	%l5
	fmovse	%icc,	%f2,	%f13
	umul	%o1,	%o0,	%i6
	ldd	[%l7 + 0x30],	%f0
	fmovdle	%xcc,	%f29,	%f7
	movneg	%icc,	%o3,	%g7
	restore %g2, %i5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g4,	0x04CF,	%i2
	fmovs	%f23,	%f19
	ldsw	[%l7 + 0x64],	%g6
	andncc	%i4,	%o5,	%l1
	mova	%icc,	%i1,	%g5
	addc	%o2,	0x1264,	%i7
	fmuld8ulx16	%f16,	%f26,	%f12
	and	%l3,	%o6,	%i3
	srlx	%o4,	%g3,	%i0
	add	%l0,	%l2,	%g1
	sdivx	%o7,	0x1C65,	%l5
	nop
	set	0x70, %l0
	std	%f16,	[%l7 + %l0]
	ldx	[%l7 + 0x58],	%o1
	edge32ln	%o0,	%i6,	%l6
	edge16n	%g7,	%g2,	%o3
	movrgez	%i5,	%g4,	%i2
	movn	%icc,	%l4,	%i4
	movrlez	%o5,	%l1,	%i1
	fpsub32	%f10,	%f24,	%f0
	alignaddr	%g6,	%o2,	%g5
	subcc	%l3,	%i7,	%o6
	fmovscs	%icc,	%f15,	%f29
	alignaddrl	%i3,	%o4,	%g3
	fpackfix	%f16,	%f9
	sdiv	%i0,	0x0880,	%l0
	stw	%g1,	[%l7 + 0x5C]
	pdist	%f14,	%f30,	%f30
	andncc	%o7,	%l5,	%l2
	xnor	%o0,	0x144E,	%o1
	ldd	[%l7 + 0x38],	%f14
	fmovrdgz	%i6,	%f4,	%f14
	fandnot1s	%f30,	%f24,	%f1
	stw	%l6,	[%l7 + 0x54]
	fmovsvc	%xcc,	%f25,	%f7
	alignaddrl	%g7,	%g2,	%i5
	fmovrdlez	%g4,	%f14,	%f6
	movleu	%icc,	%i2,	%l4
	movg	%icc,	%o3,	%i4
	smul	%o5,	0x145C,	%l1
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	mulx	%l3,	%o2,	%o6
	fmovrdgez	%i7,	%f0,	%f20
	movg	%icc,	%o4,	%g3
	stb	%i3,	[%l7 + 0x40]
	udivx	%l0,	0x024D,	%i0
	movrlez	%g1,	0x10B,	%o7
	edge32ln	%l5,	%l2,	%o1
	orcc	%o0,	%i6,	%l6
	srax	%g2,	%i5,	%g4
	stx	%i2,	[%l7 + 0x20]
	umulcc	%g7,	0x1E6A,	%l4
	fmovscc	%icc,	%f18,	%f9
	movrlez	%o3,	%i4,	%o5
	nop
	set	0x64, %l3
	stw	%l1,	[%l7 + %l3]
	sir	0x01AD
	xorcc	%g6,	%i1,	%l3
	andn	%g5,	%o2,	%i7
	movvs	%icc,	%o6,	%g3
	sdiv	%o4,	0x1B1E,	%l0
	save %i3, 0x05D3, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0C1A,	%o7
	fnegs	%f13,	%f21
	alignaddr	%l5,	%i0,	%o1
	fcmpeq16	%f8,	%f6,	%o0
	subccc	%l2,	0x0AA0,	%l6
	fmovsn	%icc,	%f20,	%f23
	fornot2s	%f21,	%f27,	%f27
	smul	%i6,	0x0E83,	%i5
	fnot2s	%f31,	%f18
	andn	%g2,	%g4,	%i2
	ld	[%l7 + 0x40],	%f16
	udivx	%l4,	0x0F44,	%o3
	edge8	%i4,	%g7,	%o5
	movge	%xcc,	%g6,	%l1
	alignaddr	%i1,	%l3,	%o2
	array16	%g5,	%i7,	%g3
	movneg	%icc,	%o6,	%o4
	movn	%xcc,	%l0,	%g1
	orn	%i3,	%l5,	%o7
	mova	%xcc,	%o1,	%i0
	sra	%o0,	%l2,	%l6
	srl	%i6,	%i5,	%g2
	umulcc	%g4,	0x039B,	%i2
	sdiv	%o3,	0x0A11,	%l4
	fmovrsgez	%i4,	%f19,	%f1
	edge8l	%o5,	%g6,	%l1
	orn	%g7,	0x1349,	%i1
	srl	%o2,	%l3,	%g5
	save %g3, %o6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l0,	%g1,	%i7
	edge32n	%l5,	%o7,	%i3
	addccc	%i0,	%o0,	%o1
	edge16l	%l6,	%i6,	%i5
	subc	%g2,	0x1A1B,	%g4
	sethi	0x1451,	%i2
	orncc	%o3,	0x0E40,	%l4
	orcc	%l2,	%o5,	%g6
	ldsh	[%l7 + 0x32],	%l1
	fmovdcs	%icc,	%f13,	%f22
	orcc	%i4,	%g7,	%i1
	movleu	%icc,	%o2,	%l3
	popc	%g3,	%o6
	fxor	%f28,	%f26,	%f4
	movg	%xcc,	%g5,	%l0
	subc	%o4,	0x1B18,	%g1
	movpos	%xcc,	%i7,	%l5
	umulcc	%i3,	0x186C,	%o7
	addccc	%o0,	%o1,	%i0
	udivx	%i6,	0x0915,	%i5
	movrlez	%l6,	0x248,	%g2
	srax	%i2,	0x09,	%o3
	popc	%g4,	%l2
	fnors	%f23,	%f17,	%f26
	movge	%icc,	%l4,	%o5
	fcmpne16	%f6,	%f0,	%g6
	edge32n	%l1,	%g7,	%i1
	fcmpeq16	%f0,	%f0,	%i4
	movle	%xcc,	%o2,	%l3
	ldd	[%l7 + 0x10],	%f26
	alignaddr	%g3,	%o6,	%l0
	fmovdcs	%icc,	%f25,	%f29
	fmovdvs	%xcc,	%f11,	%f28
	movrne	%g5,	0x0C0,	%g1
	sethi	0x0423,	%i7
	mova	%xcc,	%o4,	%l5
	nop
	set	0x38, %g2
	stw	%i3,	[%l7 + %g2]
	subc	%o0,	%o1,	%i0
	or	%i6,	0x05B9,	%i5
	movrgz	%l6,	0x2FB,	%o7
	mulscc	%g2,	0x13CC,	%o3
	fmovda	%xcc,	%f9,	%f21
	array32	%i2,	%l2,	%l4
	movpos	%xcc,	%g4,	%g6
	edge16	%l1,	%o5,	%g7
	srl	%i1,	%i4,	%o2
	ld	[%l7 + 0x0C],	%f25
	alignaddrl	%l3,	%g3,	%l0
	subcc	%o6,	0x1A25,	%g1
	fnors	%f4,	%f26,	%f30
	edge8ln	%g5,	%i7,	%o4
	movle	%xcc,	%i3,	%o0
	stx	%o1,	[%l7 + 0x08]
	udivx	%l5,	0x08D2,	%i0
	srl	%i5,	%i6,	%o7
	subccc	%l6,	%o3,	%g2
	movcc	%xcc,	%i2,	%l2
	lduh	[%l7 + 0x34],	%l4
	movne	%xcc,	%g6,	%g4
	fands	%f31,	%f31,	%f20
	array8	%o5,	%g7,	%l1
	addccc	%i1,	0x08CE,	%o2
	fnegd	%f8,	%f24
	movl	%icc,	%i4,	%g3
	movrgez	%l3,	0x091,	%o6
	edge32l	%g1,	%g5,	%i7
	std	%f16,	[%l7 + 0x40]
	fmovrdlez	%o4,	%f4,	%f26
	umulcc	%i3,	%o0,	%l0
	add	%o1,	%l5,	%i5
	alignaddrl	%i6,	%i0,	%o7
	udivx	%l6,	0x1AA2,	%g2
	andn	%o3,	0x0163,	%i2
	movl	%xcc,	%l2,	%l4
	mova	%icc,	%g6,	%o5
	edge16l	%g4,	%l1,	%g7
	alignaddr	%i1,	%i4,	%o2
	sll	%l3,	%g3,	%g1
	srl	%g5,	%o6,	%o4
	array8	%i3,	%i7,	%o0
	ldsh	[%l7 + 0x52],	%l0
	movrgez	%o1,	0x313,	%i5
	lduw	[%l7 + 0x60],	%i6
	fnegs	%f30,	%f8
	edge16	%i0,	%l5,	%l6
	edge16ln	%o7,	%o3,	%g2
	sdivx	%i2,	0x19A4,	%l2
	movneg	%xcc,	%g6,	%l4
	umul	%o5,	0x1634,	%l1
	sllx	%g7,	0x0E,	%g4
	movrgz	%i1,	0x1D5,	%o2
	fnand	%f12,	%f10,	%f12
	fnot1s	%f15,	%f25
	umulcc	%i4,	0x0BD9,	%l3
	fones	%f22
	movrgz	%g1,	%g3,	%o6
	fpadd32	%f24,	%f14,	%f20
	pdist	%f22,	%f26,	%f10
	addccc	%g5,	%i3,	%o4
	orn	%o0,	%l0,	%i7
	movrgz	%i5,	0x133,	%i6
	sra	%i0,	0x00,	%l5
	alignaddrl	%l6,	%o7,	%o1
	mova	%xcc,	%o3,	%i2
	bshuffle	%f26,	%f12,	%f0
	smul	%g2,	%g6,	%l2
	or	%o5,	0x0DAB,	%l4
	movleu	%xcc,	%g7,	%l1
	xorcc	%g4,	%o2,	%i1
	fpadd16s	%f13,	%f2,	%f11
	fpmerge	%f11,	%f30,	%f14
	andcc	%l3,	%g1,	%g3
	movrne	%o6,	0x3E5,	%i4
	and	%i3,	0x074B,	%o4
	edge16l	%g5,	%o0,	%l0
	edge8l	%i5,	%i7,	%i6
	fcmpd	%fcc0,	%f14,	%f24
	stb	%l5,	[%l7 + 0x68]
	movvc	%xcc,	%l6,	%i0
	fmovrsgz	%o1,	%f1,	%f6
	movle	%xcc,	%o3,	%i2
	xnorcc	%o7,	%g2,	%g6
	smul	%o5,	%l4,	%g7
	fzero	%f10
	fornot1s	%f28,	%f17,	%f0
	edge8n	%l1,	%g4,	%o2
	popc	%i1,	%l2
	array32	%g1,	%g3,	%l3
	udivcc	%i4,	0x103E,	%o6
	fpadd16s	%f14,	%f0,	%f19
	sra	%i3,	%g5,	%o4
	edge16l	%l0,	%o0,	%i7
	andn	%i6,	%l5,	%i5
	movrlz	%l6,	%i0,	%o3
	addc	%o1,	0x083E,	%o7
	movcc	%xcc,	%g2,	%i2
	array32	%g6,	%o5,	%l4
	fcmpes	%fcc2,	%f27,	%f15
	fpackfix	%f22,	%f8
	orncc	%g7,	0x0401,	%l1
	orn	%g4,	0x1AB3,	%o2
	sub	%l2,	0x044B,	%g1
	sll	%g3,	0x1C,	%i1
	fmovsleu	%xcc,	%f0,	%f17
	fmovspos	%xcc,	%f3,	%f15
	movl	%xcc,	%i4,	%l3
	movle	%icc,	%o6,	%i3
	movleu	%icc,	%o4,	%l0
	nop
	set	0x37, %i5
	stb	%o0,	[%l7 + %i5]
	fmovdneg	%icc,	%f0,	%f4
	edge32n	%g5,	%i7,	%i6
	lduh	[%l7 + 0x72],	%l5
	fmovdvc	%xcc,	%f16,	%f30
	fcmpne32	%f2,	%f8,	%i5
	addcc	%l6,	0x1CF5,	%i0
	alignaddr	%o1,	%o3,	%o7
	addccc	%i2,	%g2,	%g6
	lduh	[%l7 + 0x7E],	%l4
	sll	%o5,	%l1,	%g7
	fcmpne32	%f10,	%f2,	%o2
	fpadd32s	%f13,	%f21,	%f29
	movrne	%l2,	0x19D,	%g4
	movcc	%icc,	%g1,	%i1
	orcc	%i4,	0x0E98,	%g3
	movcc	%xcc,	%l3,	%o6
	edge8l	%o4,	%l0,	%o0
	subccc	%g5,	%i3,	%i7
	std	%f4,	[%l7 + 0x60]
	orncc	%i6,	0x1DA4,	%l5
	fmovse	%icc,	%f13,	%f27
	movrlz	%i5,	%l6,	%o1
	std	%f4,	[%l7 + 0x10]
	movrlz	%i0,	%o3,	%i2
	movl	%xcc,	%o7,	%g6
	movl	%xcc,	%g2,	%l4
	movn	%icc,	%l1,	%o5
	sethi	0x1671,	%o2
	movn	%icc,	%g7,	%g4
	srlx	%g1,	%l2,	%i4
	srl	%g3,	0x08,	%l3
	movg	%icc,	%i1,	%o6
	mulx	%o4,	%o0,	%l0
	fmovdgu	%icc,	%f17,	%f10
	addccc	%i3,	0x1358,	%i7
	sllx	%i6,	%g5,	%l5
	umul	%l6,	0x17A4,	%o1
	fornot1	%f30,	%f0,	%f4
	xnor	%i5,	%i0,	%o3
	popc	%i2,	%o7
	srl	%g6,	0x09,	%g2
	udivcc	%l4,	0x0F16,	%l1
	fones	%f3
	edge32ln	%o5,	%g7,	%o2
	fmovsle	%icc,	%f24,	%f13
	fpackfix	%f30,	%f0
	movrlz	%g1,	%l2,	%i4
	ldd	[%l7 + 0x58],	%g4
	edge8n	%l3,	%i1,	%g3
	edge32n	%o4,	%o6,	%l0
	subccc	%o0,	%i3,	%i6
	fcmpgt32	%f20,	%f8,	%g5
	add	%i7,	%l6,	%o1
	ldd	[%l7 + 0x48],	%i4
	srl	%i0,	0x02,	%o3
	movgu	%xcc,	%i2,	%l5
	fornot2s	%f15,	%f9,	%f9
	array8	%g6,	%g2,	%l4
	fmovdne	%xcc,	%f1,	%f12
	movvs	%xcc,	%o7,	%l1
	edge8l	%o5,	%o2,	%g7
	sir	0x1486
	srlx	%l2,	0x18,	%g1
	fxor	%f12,	%f18,	%f28
	fnor	%f6,	%f20,	%f14
	srlx	%g4,	0x04,	%l3
	subc	%i1,	%i4,	%o4
	umul	%g3,	0x12DA,	%o6
	sra	%l0,	%i3,	%o0
	fcmps	%fcc3,	%f15,	%f18
	movle	%xcc,	%i6,	%i7
	movle	%xcc,	%g5,	%o1
	udivcc	%i5,	0x1C02,	%l6
	sdivcc	%o3,	0x1212,	%i2
	ldsh	[%l7 + 0x44],	%i0
	orcc	%g6,	0x1785,	%g2
	std	%f28,	[%l7 + 0x68]
	fxnor	%f8,	%f26,	%f12
	smulcc	%l4,	%o7,	%l5
	movrgz	%l1,	%o5,	%o2
	subccc	%g7,	%l2,	%g1
	smulcc	%g4,	0x0011,	%i1
	edge8n	%i4,	%l3,	%o4
	movrgz	%o6,	%l0,	%g3
	fmovsg	%icc,	%f15,	%f17
	sub	%i3,	0x1642,	%o0
	and	%i6,	0x1311,	%i7
	movvs	%icc,	%g5,	%o1
	movpos	%xcc,	%l6,	%o3
	andncc	%i2,	%i0,	%g6
	subcc	%g2,	%l4,	%i5
	mulscc	%o7,	%l5,	%l1
	sll	%o5,	%o2,	%l2
	sir	0x15C3
	orncc	%g1,	%g7,	%i1
	udivx	%i4,	0x16D8,	%l3
	edge16ln	%g4,	%o4,	%o6
	fabsd	%f14,	%f10
	ldsb	[%l7 + 0x4F],	%l0
	ldsb	[%l7 + 0x6C],	%g3
	save %i3, 0x00F0, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i7,	%o0,	%o1
	movgu	%xcc,	%g5,	%l6
	sethi	0x1EAC,	%i2
	array16	%o3,	%i0,	%g2
	sethi	0x0C3C,	%l4
	fcmpd	%fcc1,	%f26,	%f0
	movcc	%icc,	%i5,	%g6
	fmovrslez	%l5,	%f2,	%f2
	array32	%l1,	%o5,	%o2
	popc	0x0FD5,	%o7
	fmovrde	%g1,	%f22,	%f26
	andncc	%l2,	%i1,	%g7
	addccc	%i4,	%l3,	%g4
	fmovdne	%icc,	%f10,	%f15
	fornot2	%f0,	%f0,	%f22
	std	%f14,	[%l7 + 0x38]
	stx	%o6,	[%l7 + 0x58]
	edge16ln	%l0,	%o4,	%g3
	xnor	%i6,	0x13F1,	%i7
	srax	%o0,	0x0F,	%i3
	fcmpne16	%f16,	%f20,	%g5
	fmovrdne	%o1,	%f10,	%f30
	fcmpgt32	%f8,	%f30,	%l6
	edge16	%i2,	%i0,	%g2
	sra	%l4,	0x19,	%o3
	sdivcc	%i5,	0x0FBA,	%l5
	sdivx	%g6,	0x1F42,	%o5
	array8	%l1,	%o7,	%g1
	edge32	%o2,	%i1,	%l2
	array32	%g7,	%l3,	%g4
	add	%i4,	%o6,	%o4
	mova	%xcc,	%l0,	%g3
	xnorcc	%i7,	%i6,	%o0
	umul	%i3,	0x011D,	%o1
	edge16l	%g5,	%l6,	%i2
	fmovrdlz	%i0,	%f4,	%f16
	nop
	set	0x68, %g4
	lduw	[%l7 + %g4],	%g2
	movrlez	%l4,	0x3EC,	%o3
	movgu	%icc,	%i5,	%l5
	mova	%xcc,	%o5,	%l1
	orncc	%o7,	0x13AC,	%g6
	edge16ln	%g1,	%i1,	%l2
	fabsd	%f26,	%f20
	alignaddr	%o2,	%l3,	%g4
	subc	%i4,	%o6,	%o4
	ldd	[%l7 + 0x78],	%f12
	fpmerge	%f11,	%f7,	%f14
	save %l0, %g3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i6,	0x093E,	%i7
	fxnors	%f9,	%f1,	%f7
	srl	%o0,	%o1,	%g5
	ldd	[%l7 + 0x68],	%i2
	mulx	%i2,	0x0CB2,	%l6
	addcc	%g2,	0x0AAE,	%i0
	movneg	%icc,	%l4,	%i5
	edge16ln	%l5,	%o5,	%o3
	ldd	[%l7 + 0x48],	%f0
	popc	%l1,	%g6
	movg	%xcc,	%g1,	%o7
	edge8ln	%i1,	%o2,	%l3
	movvc	%xcc,	%g4,	%l2
	edge8ln	%o6,	%i4,	%l0
	ldsh	[%l7 + 0x2A],	%o4
	addcc	%g7,	%i6,	%i7
	movrgez	%g3,	0x115,	%o0
	stb	%o1,	[%l7 + 0x46]
	xor	%i3,	%g5,	%i2
	movcs	%xcc,	%g2,	%i0
	udivx	%l6,	0x153B,	%i5
	movle	%xcc,	%l5,	%l4
	orncc	%o3,	%o5,	%l1
	fcmpd	%fcc0,	%f10,	%f6
	orncc	%g6,	0x1F0A,	%g1
	fmovsl	%xcc,	%f21,	%f19
	fornot1	%f20,	%f30,	%f0
	fmovdl	%xcc,	%f5,	%f10
	fmovrdlz	%o7,	%f26,	%f20
	sub	%i1,	0x020E,	%o2
	fmul8x16au	%f30,	%f25,	%f16
	movcc	%xcc,	%l3,	%g4
	subcc	%o6,	%i4,	%l2
	ldsw	[%l7 + 0x20],	%l0
	fmovscs	%icc,	%f17,	%f5
	addc	%g7,	0x0C79,	%o4
	udivcc	%i7,	0x157F,	%i6
	sth	%g3,	[%l7 + 0x08]
	movgu	%icc,	%o1,	%i3
	movg	%xcc,	%g5,	%i2
	stb	%g2,	[%l7 + 0x5C]
	fornot2s	%f20,	%f14,	%f1
	fnands	%f19,	%f9,	%f15
	sethi	0x1382,	%o0
	fornot1	%f24,	%f30,	%f18
	edge8ln	%l6,	%i0,	%i5
	movrne	%l5,	%o3,	%o5
	array16	%l4,	%l1,	%g1
	edge16	%g6,	%i1,	%o2
	sethi	0x029A,	%l3
	edge32ln	%g4,	%o6,	%o7
	fzeros	%f26
	movcc	%icc,	%i4,	%l0
	add	%g7,	0x1701,	%o4
	movre	%i7,	0x2B5,	%l2
	movge	%xcc,	%g3,	%i6
	movgu	%icc,	%o1,	%i3
	fmovsg	%xcc,	%f27,	%f5
	movcc	%icc,	%i2,	%g2
	udiv	%g5,	0x16C8,	%o0
	sth	%l6,	[%l7 + 0x14]
	sllx	%i0,	0x12,	%i5
	fnor	%f22,	%f26,	%f18
	andcc	%l5,	0x134E,	%o3
	sdiv	%o5,	0x0846,	%l4
	fnegd	%f28,	%f26
	or	%l1,	%g1,	%g6
	fandnot1s	%f3,	%f19,	%f26
	subccc	%i1,	%l3,	%o2
	edge8ln	%o6,	%g4,	%o7
	srl	%l0,	%i4,	%g7
	addc	%o4,	%l2,	%i7
	fpack16	%f14,	%f6
	movgu	%icc,	%g3,	%o1
	stb	%i6,	[%l7 + 0x7A]
	orn	%i3,	0x14BC,	%g2
	mova	%xcc,	%i2,	%o0
	sub	%l6,	%i0,	%i5
	smul	%g5,	%o3,	%l5
	ldsh	[%l7 + 0x74],	%l4
	sub	%o5,	%l1,	%g6
	fmovscs	%xcc,	%f27,	%f3
	popc	%i1,	%l3
	movvs	%icc,	%o2,	%g1
	fone	%f24
	subcc	%o6,	%o7,	%g4
	alignaddrl	%l0,	%i4,	%o4
	fpsub16s	%f26,	%f11,	%f29
	restore %g7, %l2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f1,	%f26
	lduw	[%l7 + 0x78],	%o1
	srl	%i6,	%i7,	%i3
	alignaddrl	%g2,	%i2,	%l6
	movpos	%icc,	%i0,	%o0
	movne	%icc,	%g5,	%o3
	fmovrdlez	%i5,	%f14,	%f16
	st	%f8,	[%l7 + 0x7C]
	sdivcc	%l4,	0x1E74,	%l5
	fand	%f28,	%f8,	%f0
	xnorcc	%l1,	%o5,	%i1
	mova	%icc,	%g6,	%o2
	ldx	[%l7 + 0x20],	%l3
	edge8ln	%o6,	%g1,	%o7
	edge16ln	%g4,	%l0,	%o4
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	orcc	%l2,	%g3,	%i6
	fmovdcs	%xcc,	%f17,	%f15
	fcmpd	%fcc2,	%f0,	%f14
	nop
	set	0x30, %g1
	ldx	[%l7 + %g1],	%o1
	fmovdne	%xcc,	%f1,	%f0
	fcmpne32	%f14,	%f30,	%i3
	stb	%i7,	[%l7 + 0x6D]
	srax	%g2,	0x08,	%i2
	xnorcc	%l6,	%i0,	%g5
	movn	%xcc,	%o3,	%o0
	fmovrdgez	%i5,	%f22,	%f16
	edge8ln	%l4,	%l1,	%o5
	movcs	%icc,	%l5,	%g6
	srl	%o2,	%i1,	%o6
	ldx	[%l7 + 0x40],	%g1
	movrne	%l3,	%g4,	%l0
	fmovrde	%o7,	%f2,	%f22
	smulcc	%o4,	%i4,	%g7
	addcc	%g3,	0x0718,	%i6
	movge	%icc,	%l2,	%o1
	movre	%i7,	%g2,	%i3
	sra	%i2,	0x07,	%i0
	edge16ln	%g5,	%o3,	%o0
	edge32ln	%l6,	%i5,	%l1
	lduh	[%l7 + 0x3A],	%o5
	ldd	[%l7 + 0x58],	%f22
	fandnot2s	%f7,	%f15,	%f0
	subcc	%l5,	%g6,	%o2
	fpmerge	%f17,	%f3,	%f30
	edge32	%i1,	%o6,	%g1
	udivcc	%l4,	0x0DE0,	%l3
	fmul8x16au	%f2,	%f19,	%f12
	fmovrdlez	%g4,	%f0,	%f4
	xorcc	%o7,	%o4,	%l0
	mova	%icc,	%i4,	%g7
	lduh	[%l7 + 0x20],	%i6
	alignaddrl	%g3,	%o1,	%l2
	lduw	[%l7 + 0x48],	%i7
	or	%i3,	0x1D2E,	%g2
	st	%f28,	[%l7 + 0x40]
	movcs	%icc,	%i0,	%i2
	fmovsg	%xcc,	%f14,	%f19
	xnor	%g5,	%o3,	%o0
	nop
	set	0x68, %i1
	ldx	[%l7 + %i1],	%l6
	stb	%l1,	[%l7 + 0x66]
	nop
	set	0x2C, %g6
	ldsw	[%l7 + %g6],	%o5
	edge32ln	%i5,	%l5,	%g6
	edge16ln	%i1,	%o6,	%g1
	fmovsneg	%xcc,	%f2,	%f15
	andn	%o2,	%l4,	%g4
	fmovdgu	%icc,	%f11,	%f27
	move	%icc,	%l3,	%o4
	fmovsgu	%icc,	%f13,	%f14
	smul	%o7,	0x0CC4,	%i4
	lduh	[%l7 + 0x64],	%l0
	umulcc	%i6,	%g7,	%o1
	movge	%icc,	%g3,	%l2
	nop
	set	0x24, %o1
	lduw	[%l7 + %o1],	%i3
	fpsub32s	%f16,	%f18,	%f17
	ldx	[%l7 + 0x38],	%i7
	edge16n	%g2,	%i2,	%g5
	mova	%xcc,	%o3,	%o0
	movrne	%l6,	%i0,	%o5
	movgu	%icc,	%l1,	%i5
	fmovsvs	%xcc,	%f1,	%f31
	movrne	%g6,	0x2BE,	%i1
	subcc	%l5,	0x048E,	%o6
	stb	%o2,	[%l7 + 0x63]
	fand	%f16,	%f26,	%f14
	fmul8sux16	%f2,	%f24,	%f30
	edge8l	%l4,	%g1,	%l3
	fmovdvs	%xcc,	%f25,	%f25
	fnot2s	%f15,	%f23
	save %o4, %g4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l0,	%i6,	%i4
	sra	%g7,	0x00,	%g3
	fmuld8sux16	%f26,	%f1,	%f8
	lduw	[%l7 + 0x28],	%l2
	addc	%i3,	%i7,	%o1
	subcc	%i2,	%g5,	%o3
	xnor	%o0,	%g2,	%i0
	edge16l	%l6,	%l1,	%i5
	ldx	[%l7 + 0x58],	%g6
	movrlez	%i1,	0x0BB,	%l5
	addcc	%o6,	%o2,	%o5
	movrgz	%g1,	%l3,	%l4
	fabss	%f23,	%f26
	srlx	%g4,	%o4,	%l0
	sll	%i6,	%i4,	%o7
	save %g3, %g7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i7,	0x1434,	%l2
	mulscc	%i2,	0x1B89,	%g5
	sdivcc	%o1,	0x1474,	%o3
	srax	%g2,	0x17,	%o0
	fmovsleu	%xcc,	%f4,	%f19
	lduh	[%l7 + 0x14],	%l6
	addccc	%l1,	0x1AB6,	%i0
	stb	%i5,	[%l7 + 0x70]
	edge8	%i1,	%g6,	%o6
	fmovde	%icc,	%f11,	%f8
	fpsub16	%f16,	%f2,	%f4
	movrgz	%o2,	%l5,	%o5
	movre	%g1,	%l4,	%g4
	fmovsleu	%xcc,	%f14,	%f22
	fmovrslez	%l3,	%f13,	%f23
	movcs	%xcc,	%o4,	%l0
	addccc	%i4,	%i6,	%g3
	alignaddr	%o7,	%g7,	%i7
	orcc	%i3,	%i2,	%l2
	movneg	%icc,	%g5,	%o1
	sll	%o3,	0x0D,	%g2
	subcc	%o0,	%l1,	%l6
	edge8n	%i5,	%i0,	%i1
	array32	%g6,	%o6,	%l5
	lduh	[%l7 + 0x18],	%o5
	movrgez	%g1,	0x2FE,	%l4
	fmovrsgez	%g4,	%f25,	%f8
	fmovsn	%icc,	%f2,	%f18
	fnor	%f12,	%f4,	%f20
	stb	%l3,	[%l7 + 0x11]
	movvs	%xcc,	%o2,	%o4
	fcmpes	%fcc3,	%f28,	%f10
	xor	%i4,	0x06AB,	%i6
	fmovdg	%xcc,	%f2,	%f1
	addcc	%g3,	0x15A5,	%o7
	fmovd	%f30,	%f0
	movrlz	%g7,	0x2BB,	%i7
	move	%xcc,	%i3,	%i2
	fpack16	%f16,	%f9
	st	%f4,	[%l7 + 0x0C]
	fxors	%f15,	%f13,	%f6
	edge32n	%l2,	%g5,	%o1
	movrne	%o3,	%l0,	%o0
	addcc	%l1,	0x1DE1,	%l6
	movvc	%xcc,	%i5,	%i0
	ldsh	[%l7 + 0x7C],	%i1
	andcc	%g6,	0x0D9D,	%g2
	sll	%o6,	0x17,	%o5
	movrgez	%g1,	%l5,	%g4
	fandnot1	%f16,	%f0,	%f18
	stx	%l4,	[%l7 + 0x70]
	sll	%l3,	0x1C,	%o2
	or	%o4,	0x176F,	%i6
	subcc	%g3,	%i4,	%g7
	subc	%o7,	%i3,	%i7
	sethi	0x051E,	%l2
	umulcc	%g5,	%i2,	%o3
	fmovspos	%xcc,	%f7,	%f26
	addccc	%o1,	%o0,	%l0
	restore %l1, 0x0410, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f8,	%f16
	popc	0x0F70,	%i5
	ldsh	[%l7 + 0x28],	%i0
	fcmpgt32	%f0,	%f30,	%i1
	umulcc	%g2,	0x18E3,	%o6
	fmovspos	%icc,	%f13,	%f13
	fnands	%f12,	%f17,	%f9
	mova	%icc,	%o5,	%g1
	fmovdpos	%xcc,	%f2,	%f25
	smul	%g6,	%l5,	%g4
	array16	%l4,	%o2,	%o4
	movl	%icc,	%l3,	%g3
	movne	%xcc,	%i4,	%g7
	edge8l	%i6,	%i3,	%i7
	addc	%l2,	0x0DE9,	%g5
	siam	0x2
	sllx	%o7,	%o3,	%i2
	udiv	%o1,	0x1653,	%o0
	ld	[%l7 + 0x68],	%f14
	fcmple16	%f26,	%f12,	%l1
	fmul8x16	%f0,	%f22,	%f4
	movneg	%xcc,	%l0,	%l6
	movcs	%xcc,	%i0,	%i1
	std	%f10,	[%l7 + 0x30]
	orcc	%g2,	%o6,	%i5
	edge32l	%g1,	%g6,	%l5
	fpsub16	%f26,	%f22,	%f24
	movne	%xcc,	%o5,	%g4
	fcmpeq16	%f2,	%f6,	%o2
	udiv	%l4,	0x0DEC,	%o4
	xor	%l3,	0x196D,	%g3
	ldd	[%l7 + 0x30],	%f6
	fmovsleu	%icc,	%f0,	%f6
	lduh	[%l7 + 0x72],	%g7
	sllx	%i6,	0x1C,	%i3
	sub	%i7,	0x149F,	%l2
	popc	0x1069,	%g5
	fsrc1s	%f2,	%f29
	sll	%i4,	0x13,	%o3
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	movpos	%xcc,	%o0,	%l0
	fmul8x16	%f17,	%f18,	%f2
	ldub	[%l7 + 0x16],	%l6
	mova	%xcc,	%i0,	%i1
	movvc	%xcc,	%l1,	%g2
	movrlz	%i5,	0x354,	%g1
	sdivcc	%g6,	0x10EB,	%l5
	st	%f25,	[%l7 + 0x20]
	ldub	[%l7 + 0x53],	%o5
	edge8n	%o6,	%o2,	%g4
	edge32	%o4,	%l3,	%g3
	movn	%xcc,	%l4,	%i6
	fmovdg	%icc,	%f26,	%f25
	sdivcc	%i3,	0x1990,	%g7
	xor	%i7,	0x02F9,	%l2
	xnor	%g5,	0x1374,	%i4
	edge16n	%o3,	%o7,	%o1
	add	%o0,	0x1682,	%l0
	xorcc	%i2,	0x0F2E,	%l6
	movrne	%i0,	%i1,	%l1
	and	%g2,	0x05AD,	%i5
	movgu	%icc,	%g1,	%l5
	alignaddrl	%o5,	%g6,	%o6
	fxors	%f11,	%f20,	%f20
	movpos	%xcc,	%o2,	%g4
	fnegd	%f12,	%f22
	edge32ln	%l3,	%o4,	%g3
	movl	%xcc,	%i6,	%i3
	xorcc	%g7,	%l4,	%i7
	fzeros	%f15
	movneg	%xcc,	%l2,	%g5
	sll	%o3,	0x13,	%o7
	fpadd32s	%f20,	%f13,	%f25
	sdivcc	%o1,	0x068C,	%i4
	stw	%o0,	[%l7 + 0x2C]
	fmovdcs	%xcc,	%f7,	%f13
	addccc	%i2,	0x09DC,	%l0
	edge32	%i0,	%i1,	%l1
	movg	%icc,	%g2,	%l6
	array32	%g1,	%i5,	%l5
	sdivcc	%g6,	0x0485,	%o5
	movneg	%xcc,	%o2,	%g4
	fzero	%f28
	movvs	%icc,	%o6,	%l3
	mulx	%g3,	%i6,	%i3
	udivcc	%g7,	0x19B1,	%o4
	edge16	%l4,	%l2,	%i7
	smulcc	%o3,	0x188C,	%g5
	xorcc	%o1,	0x00A1,	%o7
	movgu	%icc,	%i4,	%i2
	move	%icc,	%l0,	%o0
	fcmpgt16	%f0,	%f0,	%i0
	edge32ln	%i1,	%g2,	%l6
	movvc	%xcc,	%g1,	%l1
	ldd	[%l7 + 0x68],	%l4
	sethi	0x07C9,	%i5
	fpsub16	%f0,	%f26,	%f18
	fmovse	%xcc,	%f11,	%f23
	xor	%g6,	%o2,	%o5
	fpack16	%f0,	%f28
	edge8n	%o6,	%l3,	%g4
	movrlz	%g3,	%i3,	%i6
	addc	%o4,	%g7,	%l2
	fnot2s	%f2,	%f11
	xor	%i7,	%o3,	%g5
	sllx	%l4,	%o1,	%i4
	movcc	%xcc,	%i2,	%l0
	subcc	%o7,	0x0132,	%o0
	edge16	%i1,	%g2,	%i0
	fmuld8sux16	%f29,	%f22,	%f22
	movvs	%xcc,	%g1,	%l6
	subccc	%l1,	0x13DD,	%l5
	ldsh	[%l7 + 0x2C],	%g6
	fmovse	%xcc,	%f6,	%f18
	fandnot2	%f0,	%f12,	%f12
	array32	%o2,	%i5,	%o6
	umulcc	%o5,	0x0282,	%g4
	movg	%icc,	%g3,	%i3
	fmovsl	%xcc,	%f28,	%f25
	movrne	%l3,	%o4,	%i6
	movgu	%icc,	%l2,	%g7
	addcc	%o3,	%g5,	%l4
	smulcc	%i7,	0x0A12,	%o1
	edge16	%i2,	%i4,	%l0
	andcc	%o7,	%i1,	%g2
	and	%o0,	%g1,	%i0
	udiv	%l6,	0x0E12,	%l5
	movrne	%l1,	%o2,	%g6
	xnor	%o6,	%o5,	%i5
	fcmped	%fcc0,	%f14,	%f8
	fnot2	%f28,	%f24
	ld	[%l7 + 0x1C],	%f17
	movl	%icc,	%g4,	%g3
	st	%f21,	[%l7 + 0x34]
	smul	%i3,	%l3,	%o4
	nop
	set	0x50, %l1
	ldx	[%l7 + %l1],	%l2
	mulx	%i6,	%g7,	%g5
	sll	%o3,	0x08,	%i7
	edge8l	%o1,	%i2,	%i4
	stx	%l4,	[%l7 + 0x18]
	lduh	[%l7 + 0x78],	%l0
	srl	%o7,	%g2,	%i1
	edge16	%g1,	%i0,	%l6
	fmovsvc	%xcc,	%f28,	%f7
	or	%l5,	0x05C6,	%l1
	save %o0, %g6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f26,	%f8,	%f24
	ld	[%l7 + 0x10],	%f7
	ldsh	[%l7 + 0x1A],	%o6
	movgu	%icc,	%i5,	%g4
	edge16	%o5,	%g3,	%i3
	orncc	%o4,	0x0042,	%l3
	fnand	%f2,	%f26,	%f10
	movre	%l2,	0x0CB,	%i6
	xor	%g5,	%o3,	%i7
	lduh	[%l7 + 0x66],	%g7
	ldx	[%l7 + 0x18],	%i2
	addcc	%o1,	0x1527,	%l4
	add	%i4,	%l0,	%o7
	mulscc	%g2,	%i1,	%i0
	array8	%l6,	%g1,	%l5
	edge8ln	%l1,	%g6,	%o2
	movpos	%icc,	%o0,	%i5
	fmovrsne	%o6,	%f28,	%f15
	movcc	%icc,	%o5,	%g4
	smul	%g3,	%i3,	%l3
	movle	%icc,	%l2,	%i6
	movcs	%icc,	%g5,	%o4
	subccc	%o3,	0x0BA7,	%i7
	xnorcc	%g7,	0x1D77,	%i2
	stw	%o1,	[%l7 + 0x2C]
	udiv	%l4,	0x1C03,	%l0
	orn	%i4,	%o7,	%i1
	fmovdneg	%xcc,	%f1,	%f10
	movge	%icc,	%i0,	%l6
	fornot2s	%f15,	%f22,	%f31
	movrgez	%g1,	%g2,	%l5
	stx	%g6,	[%l7 + 0x58]
	alignaddrl	%o2,	%o0,	%l1
	subccc	%i5,	0x0FE4,	%o6
	addcc	%g4,	0x164C,	%o5
	edge32l	%i3,	%g3,	%l2
	nop
	set	0x78, %i2
	lduw	[%l7 + %i2],	%i6
	siam	0x6
	fmovs	%f18,	%f7
	sdivx	%l3,	0x1657,	%o4
	mulx	%g5,	%i7,	%g7
	ldsh	[%l7 + 0x60],	%o3
	fnot2	%f14,	%f28
	fcmpes	%fcc0,	%f18,	%f3
	movne	%icc,	%i2,	%l4
	ldsw	[%l7 + 0x74],	%o1
	or	%i4,	0x08BF,	%o7
	fmovrdgz	%l0,	%f4,	%f24
	stx	%i1,	[%l7 + 0x68]
	fand	%f24,	%f24,	%f14
	movre	%i0,	%l6,	%g1
	ld	[%l7 + 0x3C],	%f23
	ldsw	[%l7 + 0x3C],	%l5
	fpack16	%f24,	%f14
	lduw	[%l7 + 0x30],	%g2
	srax	%g6,	%o2,	%o0
	fmovspos	%xcc,	%f13,	%f29
	movgu	%xcc,	%i5,	%l1
	addccc	%g4,	0x19AE,	%o5
	movrlez	%i3,	0x3DF,	%g3
	restore %l2, 0x12CC, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l3,	%o4,	%i6
	fcmped	%fcc0,	%f10,	%f12
	move	%icc,	%g5,	%i7
	movrlz	%g7,	%o3,	%i2
	addcc	%l4,	%i4,	%o1
	fmovdge	%xcc,	%f19,	%f29
	srl	%l0,	0x07,	%o7
	edge8ln	%i1,	%l6,	%i0
	fcmpne32	%f22,	%f14,	%g1
	addc	%l5,	0x0FFB,	%g6
	edge32	%g2,	%o2,	%o0
	edge16	%l1,	%i5,	%g4
	fmovsneg	%xcc,	%f24,	%f17
	sir	0x0C81
	fandnot2	%f12,	%f8,	%f0
	fmovsg	%xcc,	%f26,	%f5
	fmovsle	%xcc,	%f17,	%f29
	movleu	%icc,	%i3,	%g3
	fornot2s	%f0,	%f31,	%f1
	sdivx	%o5,	0x1716,	%l2
	edge32ln	%l3,	%o4,	%i6
	srl	%g5,	%i7,	%g7
	andcc	%o3,	0x02C5,	%i2
	fornot1s	%f12,	%f22,	%f27
	or	%o6,	0x1701,	%l4
	fmovsge	%xcc,	%f11,	%f14
	movg	%xcc,	%o1,	%l0
	nop
	set	0x47, %l2
	stb	%i4,	[%l7 + %l2]
	movge	%icc,	%i1,	%o7
	lduh	[%l7 + 0x4A],	%i0
	fnegs	%f31,	%f27
	fsrc1s	%f12,	%f9
	fpadd32	%f24,	%f6,	%f26
	edge32l	%l6,	%l5,	%g6
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	std	%f26,	[%l7 + 0x08]
	fxnor	%f4,	%f12,	%f16
	edge32n	%g1,	%o0,	%l1
	movrgez	%i5,	0x28B,	%i3
	sethi	0x1E38,	%g3
	edge32ln	%g4,	%l2,	%l3
	xorcc	%o4,	0x07B8,	%i6
	or	%g5,	%o5,	%g7
	movvc	%xcc,	%i7,	%o3
	fsrc1s	%f3,	%f3
	fmovsvs	%icc,	%f11,	%f7
	std	%f16,	[%l7 + 0x28]
	stw	%i2,	[%l7 + 0x60]
	edge16ln	%l4,	%o6,	%l0
	fcmpeq16	%f14,	%f18,	%o1
	edge8n	%i4,	%o7,	%i1
	edge8l	%i0,	%l5,	%l6
	siam	0x1
	edge32ln	%g2,	%o2,	%g1
	orcc	%o0,	%l1,	%g6
	addcc	%i3,	0x1AB5,	%g3
	fcmpne16	%f16,	%f26,	%g4
	fcmps	%fcc0,	%f19,	%f16
	movrne	%i5,	%l3,	%l2
	movrgez	%i6,	0x26C,	%o4
	movn	%icc,	%o5,	%g7
	sra	%i7,	%g5,	%i2
	fcmpes	%fcc2,	%f2,	%f26
	fmovrdlez	%o3,	%f22,	%f30
	fand	%f30,	%f20,	%f30
	add	%o6,	%l0,	%o1
	mulx	%i4,	%l4,	%o7
	mulscc	%i0,	0x004C,	%l5
	sll	%l6,	%g2,	%i1
	stw	%g1,	[%l7 + 0x74]
	fpack16	%f28,	%f2
	fornot2s	%f16,	%f27,	%f2
	std	%f6,	[%l7 + 0x30]
	array8	%o2,	%o0,	%g6
	add	%i3,	0x070D,	%l1
	xnorcc	%g4,	%g3,	%l3
	movg	%icc,	%l2,	%i6
	sll	%i5,	%o4,	%o5
	edge16	%i7,	%g7,	%i2
	popc	0x0DCA,	%o3
	mulx	%o6,	0x1232,	%g5
	fmovdneg	%xcc,	%f5,	%f14
	sub	%l0,	0x131E,	%o1
	sub	%i4,	0x18B9,	%o7
	fmovd	%f4,	%f10
	sethi	0x0892,	%i0
	fmovdleu	%icc,	%f0,	%f6
	andncc	%l5,	%l4,	%g2
	fmul8x16au	%f0,	%f8,	%f8
	ldd	[%l7 + 0x70],	%i6
	movgu	%icc,	%i1,	%g1
	sir	0x1052
	fpsub16s	%f5,	%f5,	%f12
	fxors	%f4,	%f25,	%f5
	save %o0, %g6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%i3,	%l1
	fmovsl	%icc,	%f11,	%f2
	array8	%g4,	%l3,	%l2
	alignaddr	%i6,	%i5,	%o4
	fmovdvc	%icc,	%f22,	%f28
	edge32ln	%o5,	%i7,	%g7
	fmovde	%xcc,	%f29,	%f11
	fpmerge	%f27,	%f4,	%f14
	ld	[%l7 + 0x14],	%f19
	mulx	%g3,	0x17BE,	%i2
	ldd	[%l7 + 0x60],	%f14
	movrgez	%o6,	0x169,	%o3
	ldsh	[%l7 + 0x4C],	%g5
	movvs	%icc,	%l0,	%i4
	andncc	%o1,	%i0,	%o7
	edge16n	%l4,	%l5,	%l6
	movl	%xcc,	%g2,	%g1
	fnors	%f7,	%f21,	%f4
	fmovdneg	%xcc,	%f18,	%f16
	ldub	[%l7 + 0x40],	%o0
	sdiv	%g6,	0x1E6F,	%i1
	movgu	%xcc,	%o2,	%l1
	or	%i3,	0x035E,	%g4
	movrne	%l3,	0x20E,	%i6
	edge16ln	%i5,	%o4,	%o5
	movrne	%l2,	%i7,	%g3
	sethi	0x1D51,	%i2
	lduh	[%l7 + 0x12],	%g7
	edge8n	%o6,	%g5,	%l0
	xorcc	%o3,	%i4,	%i0
	array8	%o1,	%l4,	%l5
	ldub	[%l7 + 0x15],	%l6
	addccc	%g2,	%o7,	%g1
	restore %o0, %i1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f30,	%f14,	%f28
	edge16ln	%g6,	%i3,	%l1
	edge8n	%g4,	%i6,	%i5
	udivx	%l3,	0x16D9,	%o5
	edge16l	%l2,	%o4,	%g3
	std	%f22,	[%l7 + 0x28]
	movl	%icc,	%i7,	%i2
	smul	%g7,	0x0025,	%g5
	fnands	%f28,	%f2,	%f23
	edge8ln	%l0,	%o3,	%o6
	nop
	set	0x30, %o7
	stx	%i0,	[%l7 + %o7]
	movrne	%o1,	0x358,	%l4
	or	%l5,	%i4,	%l6
	addcc	%o7,	%g1,	%o0
	ldub	[%l7 + 0x1E],	%i1
	fmovdgu	%xcc,	%f19,	%f28
	srax	%g2,	0x03,	%o2
	andncc	%i3,	%l1,	%g4
	edge32n	%g6,	%i6,	%i5
	fpsub16	%f2,	%f16,	%f10
	fnors	%f13,	%f9,	%f21
	edge16ln	%o5,	%l2,	%l3
	mulx	%g3,	%i7,	%o4
	ldsh	[%l7 + 0x54],	%i2
	fmovscc	%xcc,	%f6,	%f25
	edge32	%g5,	%l0,	%o3
	edge8	%o6,	%i0,	%g7
	movrne	%l4,	0x362,	%o1
	fmovdg	%xcc,	%f29,	%f8
	fmovdleu	%icc,	%f3,	%f13
	fpack16	%f20,	%f1
	movneg	%icc,	%i4,	%l5
	array32	%o7,	%l6,	%g1
	movl	%xcc,	%o0,	%i1
	fmovse	%xcc,	%f27,	%f4
	fmovspos	%xcc,	%f11,	%f29
	fcmple16	%f4,	%f12,	%g2
	ldsb	[%l7 + 0x70],	%o2
	udiv	%l1,	0x06E8,	%i3
	edge16ln	%g4,	%i6,	%i5
	movle	%icc,	%o5,	%g6
	edge16l	%l3,	%g3,	%l2
	ldd	[%l7 + 0x50],	%o4
	alignaddrl	%i2,	%g5,	%i7
	xorcc	%o3,	0x00DE,	%l0
	fpmerge	%f23,	%f1,	%f12
	stx	%i0,	[%l7 + 0x38]
	fornot1	%f6,	%f18,	%f28
	alignaddr	%g7,	%l4,	%o1
	and	%i4,	0x0492,	%o6
	udiv	%l5,	0x11D5,	%o7
	movleu	%icc,	%g1,	%o0
	or	%l6,	0x0DF6,	%i1
	smul	%o2,	%g2,	%i3
	subccc	%l1,	0x1C59,	%g4
	fnot1	%f28,	%f24
	movleu	%icc,	%i5,	%i6
	movcc	%xcc,	%o5,	%g6
	stx	%g3,	[%l7 + 0x20]
	movle	%icc,	%l2,	%o4
	fands	%f4,	%f22,	%f12
	nop
	set	0x18, %i7
	stx	%i2,	[%l7 + %i7]
	udiv	%l3,	0x108A,	%g5
	smulcc	%i7,	0x0729,	%l0
	sra	%o3,	0x0E,	%i0
	movpos	%xcc,	%l4,	%g7
	sub	%o1,	0x0F8C,	%o6
	fandnot1	%f22,	%f2,	%f8
	smul	%l5,	0x0AA0,	%o7
	fmovsg	%icc,	%f8,	%f16
	sdivx	%i4,	0x1DA9,	%o0
	edge32ln	%l6,	%g1,	%i1
	movvc	%icc,	%o2,	%g2
	sdiv	%l1,	0x1434,	%i3
	lduw	[%l7 + 0x68],	%i5
	orn	%i6,	%g4,	%o5
	orn	%g3,	%g6,	%o4
	fmovdvs	%icc,	%f29,	%f30
	movrgz	%i2,	%l2,	%g5
	movpos	%icc,	%i7,	%l0
	andncc	%l3,	%i0,	%o3
	smulcc	%l4,	0x0953,	%o1
	xor	%g7,	0x005F,	%l5
	movvs	%xcc,	%o7,	%i4
	srax	%o6,	%l6,	%o0
	movneg	%xcc,	%i1,	%g1
	addccc	%g2,	%o2,	%i3
	fmovrslz	%l1,	%f9,	%f12
	movrgz	%i5,	0x1F0,	%g4
	sra	%o5,	0x0A,	%i6
	fcmpne32	%f12,	%f18,	%g3
	movrne	%g6,	0x1A5,	%o4
	xnor	%l2,	%i2,	%i7
	fxor	%f20,	%f26,	%f28
	movvs	%icc,	%g5,	%l0
	move	%xcc,	%l3,	%o3
	sll	%i0,	0x16,	%o1
	ldub	[%l7 + 0x0E],	%g7
	array32	%l4,	%l5,	%o7
	movgu	%xcc,	%i4,	%l6
	sub	%o0,	0x09D3,	%i1
	fmul8x16al	%f7,	%f13,	%f28
	subccc	%o6,	%g2,	%o2
	mulx	%i3,	0x0965,	%l1
	sethi	0x1EAF,	%g1
	edge16n	%g4,	%i5,	%o5
	edge32ln	%i6,	%g3,	%g6
	movg	%xcc,	%l2,	%o4
	array16	%i7,	%g5,	%l0
	stw	%i2,	[%l7 + 0x28]
	lduw	[%l7 + 0x70],	%l3
	xnorcc	%o3,	0x00BC,	%i0
	movrlez	%g7,	%o1,	%l4
	movrlez	%o7,	0x0BF,	%i4
	lduh	[%l7 + 0x4A],	%l6
	movre	%l5,	%i1,	%o0
	fpsub16s	%f29,	%f21,	%f22
	srlx	%o6,	%g2,	%i3
	udivx	%o2,	0x0977,	%l1
	mova	%xcc,	%g4,	%g1
	movcc	%icc,	%o5,	%i5
	edge32l	%i6,	%g3,	%g6
	edge8l	%o4,	%l2,	%i7
	std	%f18,	[%l7 + 0x60]
	and	%g5,	0x15BB,	%i2
	movrne	%l0,	0x1E9,	%o3
	srlx	%l3,	0x14,	%i0
	fxnors	%f30,	%f28,	%f17
	ldd	[%l7 + 0x40],	%o0
	fzeros	%f10
	nop
	set	0x44, %g7
	lduw	[%l7 + %g7],	%g7
	movrgez	%l4,	%i4,	%o7
	lduh	[%l7 + 0x38],	%l6
	movre	%i1,	%o0,	%o6
	stw	%l5,	[%l7 + 0x08]
	nop
	set	0x74, %g5
	ldsw	[%l7 + %g5],	%g2
	popc	%o2,	%l1
	sir	0x07E6
	movpos	%icc,	%i3,	%g1
	ldd	[%l7 + 0x10],	%o4
	mova	%icc,	%i5,	%i6
	movge	%xcc,	%g3,	%g4
	array8	%g6,	%o4,	%i7
	sdiv	%g5,	0x1806,	%i2
	fmovsg	%xcc,	%f5,	%f24
	movcs	%xcc,	%l2,	%l0
	edge16	%o3,	%l3,	%o1
	fmovscs	%xcc,	%f22,	%f14
	for	%f18,	%f8,	%f4
	or	%i0,	%l4,	%g7
	edge32l	%o7,	%l6,	%i1
	and	%o0,	0x18A2,	%o6
	fmovdge	%xcc,	%f19,	%f18
	edge16n	%l5,	%i4,	%g2
	lduw	[%l7 + 0x48],	%o2
	alignaddrl	%i3,	%g1,	%o5
	fcmpeq16	%f0,	%f30,	%l1
	fcmpeq16	%f26,	%f2,	%i6
	xnorcc	%g3,	%i5,	%g6
	movle	%xcc,	%g4,	%i7
	lduw	[%l7 + 0x08],	%g5
	edge8l	%i2,	%o4,	%l0
	ldsw	[%l7 + 0x5C],	%o3
	movrlz	%l2,	0x316,	%l3
	sllx	%o1,	%l4,	%g7
	movn	%xcc,	%o7,	%i0
	subcc	%l6,	%i1,	%o6
	movrlz	%l5,	%o0,	%i4
	add	%g2,	0x1DF5,	%o2
	edge32	%i3,	%o5,	%l1
	movrlez	%i6,	0x39A,	%g1
	movrgz	%g3,	%i5,	%g6
	movrgez	%i7,	0x32A,	%g5
	fsrc1s	%f20,	%f5
	movle	%xcc,	%i2,	%o4
	edge32ln	%l0,	%o3,	%l2
	movre	%g4,	0x0E2,	%o1
	subccc	%l3,	0x04F8,	%g7
	mulscc	%l4,	0x1D9C,	%o7
	sra	%l6,	0x1E,	%i1
	fmovrdne	%i0,	%f30,	%f16
	array32	%o6,	%o0,	%i4
	smul	%l5,	%g2,	%o2
	or	%o5,	%l1,	%i3
	st	%f19,	[%l7 + 0x44]
	movg	%xcc,	%i6,	%g1
	fnegd	%f14,	%f22
	xor	%i5,	0x1818,	%g3
	andcc	%g6,	%i7,	%g5
	edge8ln	%i2,	%l0,	%o3
	fandnot1	%f12,	%f12,	%f30
	movrlz	%o4,	%l2,	%g4
	udiv	%o1,	0x1C62,	%l3
	st	%f27,	[%l7 + 0x70]
	ldd	[%l7 + 0x40],	%g6
	or	%o7,	0x1CD6,	%l6
	movleu	%icc,	%l4,	%i1
	movrne	%o6,	0x376,	%i0
	andn	%i4,	%o0,	%l5
	move	%xcc,	%g2,	%o2
	movn	%icc,	%o5,	%i3
	movneg	%xcc,	%l1,	%g1
	edge8n	%i6,	%g3,	%i5
	movrgez	%i7,	%g6,	%g5
	ldsh	[%l7 + 0x44],	%i2
	orncc	%o3,	%o4,	%l0
	stx	%g4,	[%l7 + 0x70]
	smulcc	%o1,	0x1105,	%l2
	andncc	%g7,	%l3,	%o7
	smul	%l4,	0x1399,	%i1
	edge8ln	%l6,	%i0,	%o6
	edge8l	%o0,	%l5,	%g2
	edge32	%o2,	%i4,	%o5
	edge8l	%l1,	%g1,	%i6
	fmovdleu	%icc,	%f14,	%f31
	sub	%g3,	%i3,	%i7
	alignaddr	%i5,	%g5,	%i2
	srl	%o3,	%g6,	%o4
	fmovrse	%g4,	%f7,	%f28
	srlx	%l0,	0x07,	%l2
	movleu	%icc,	%o1,	%g7
	movgu	%xcc,	%o7,	%l4
	movvs	%icc,	%i1,	%l3
	mova	%xcc,	%i0,	%o6
	fnot1s	%f24,	%f18
	andcc	%l6,	0x1288,	%l5
	fmovdn	%icc,	%f5,	%f3
	stx	%g2,	[%l7 + 0x70]
	array8	%o0,	%i4,	%o5
	xnor	%o2,	0x0E24,	%g1
	andncc	%i6,	%g3,	%l1
	ldx	[%l7 + 0x28],	%i7
	fnot1	%f20,	%f14
	udivcc	%i3,	0x0D77,	%g5
	or	%i5,	%i2,	%o3
	udiv	%o4,	0x04AB,	%g6
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%g4
	fmovrsne	%l2,	%f6,	%f31
	edge32l	%o1,	%g7,	%l0
	ldsb	[%l7 + 0x62],	%o7
	sth	%i1,	[%l7 + 0x78]
	for	%f2,	%f12,	%f16
	st	%f1,	[%l7 + 0x10]
	movrlz	%l4,	0x00F,	%i0
	std	%f2,	[%l7 + 0x28]
	ldub	[%l7 + 0x34],	%l3
	movpos	%xcc,	%l6,	%l5
	sethi	0x1E91,	%g2
	fxnors	%f5,	%f0,	%f5
	fcmple16	%f12,	%f20,	%o0
	fcmpeq16	%f22,	%f28,	%i4
	movvs	%xcc,	%o6,	%o2
	addccc	%g1,	0x01F4,	%i6
	movcs	%xcc,	%g3,	%l1
	umul	%o5,	%i7,	%i3
	fmovrdgz	%g5,	%f0,	%f0
	fmovdne	%xcc,	%f0,	%f24
	fnot1s	%f25,	%f15
	fpack32	%f22,	%f18,	%f20
	fmovde	%icc,	%f1,	%f8
	movg	%icc,	%i5,	%o3
	edge32	%i2,	%o4,	%g6
	movrlz	%l2,	%o1,	%g4
	pdist	%f26,	%f26,	%f8
	fabss	%f3,	%f27
	edge16ln	%g7,	%o7,	%i1
	and	%l0,	0x1C75,	%l4
	umul	%i0,	%l3,	%l5
	edge32n	%g2,	%o0,	%i4
	subcc	%o6,	0x04BC,	%l6
	movrlz	%o2,	0x117,	%i6
	mulscc	%g3,	0x04FB,	%l1
	orn	%g1,	0x13CD,	%o5
	fmovdvs	%xcc,	%f31,	%f6
	movne	%icc,	%i3,	%g5
	fpack16	%f20,	%f18
	mulx	%i5,	%i7,	%o3
	andcc	%o4,	%i2,	%g6
	mulx	%o1,	0x0B7F,	%g4
	orn	%l2,	0x0082,	%g7
	andn	%i1,	0x00E9,	%l0
	xorcc	%o7,	0x052D,	%i0
	fabsd	%f2,	%f10
	lduh	[%l7 + 0x40],	%l4
	fmul8x16	%f3,	%f24,	%f6
	srl	%l3,	%l5,	%o0
	fmovrdlz	%i4,	%f4,	%f8
	popc	%o6,	%l6
	movn	%xcc,	%g2,	%i6
	ldsh	[%l7 + 0x46],	%g3
	fcmpne16	%f30,	%f22,	%l1
	fmovs	%f27,	%f9
	srax	%g1,	%o5,	%o2
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	movn	%xcc,	%i3,	%o3
	andncc	%o4,	%i7,	%g6
	movrgez	%i2,	%o1,	%g4
	orncc	%g7,	%i1,	%l2
	alignaddr	%l0,	%o7,	%l4
	edge32	%i0,	%l3,	%o0
	sethi	0x1DD7,	%i4
	movge	%xcc,	%l5,	%o6
	fmovdvc	%icc,	%f6,	%f19
	fmovdg	%xcc,	%f6,	%f22
	fexpand	%f11,	%f2
	fmovda	%icc,	%f14,	%f24
	subccc	%l6,	0x0203,	%i6
	edge32l	%g3,	%g2,	%l1
	addcc	%g1,	%o2,	%g5
	fmovsvc	%icc,	%f25,	%f7
	smulcc	%o5,	%i3,	%o3
	fand	%f12,	%f2,	%f14
	xnor	%i5,	%o4,	%i7
	fmul8x16	%f5,	%f10,	%f6
	array8	%i2,	%o1,	%g6
	edge16	%g4,	%g7,	%l2
	ldsb	[%l7 + 0x32],	%i1
	addccc	%l0,	0x150A,	%l4
	fpadd16	%f22,	%f10,	%f12
	save %i0, %l3, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x58],	%i4
	fmovrdgz	%o7,	%f20,	%f20
	ldsb	[%l7 + 0x0A],	%o6
	mova	%icc,	%l6,	%l5
	addccc	%i6,	0x0848,	%g3
	fcmpd	%fcc2,	%f24,	%f8
	addc	%g2,	0x0C35,	%l1
	edge16l	%o2,	%g5,	%o5
	faligndata	%f0,	%f10,	%f18
	add	%g1,	0x0E10,	%i3
	fmovrdgz	%o3,	%f20,	%f18
	edge8n	%i5,	%i7,	%i2
	fmovdneg	%icc,	%f31,	%f10
	udivcc	%o4,	0x197C,	%g6
	fmovsneg	%icc,	%f26,	%f3
	fmovdpos	%icc,	%f10,	%f6
	array16	%g4,	%o1,	%g7
	movvs	%xcc,	%l2,	%l0
	movneg	%xcc,	%i1,	%l4
	movrlez	%i0,	%o0,	%i4
	movpos	%icc,	%o7,	%l3
	ldsh	[%l7 + 0x58],	%l6
	fsrc2	%f20,	%f10
	ld	[%l7 + 0x54],	%f30
	movg	%icc,	%l5,	%i6
	movgu	%xcc,	%o6,	%g3
	sra	%g2,	0x18,	%o2
	alignaddrl	%g5,	%o5,	%g1
	stx	%i3,	[%l7 + 0x38]
	movn	%icc,	%l1,	%o3
	srax	%i5,	0x0B,	%i7
	ldd	[%l7 + 0x20],	%f24
	edge8n	%o4,	%g6,	%g4
	fmovdvc	%xcc,	%f2,	%f21
	addccc	%i2,	0x135F,	%o1
	movcc	%icc,	%l2,	%g7
	sdivcc	%i1,	0x09F7,	%l0
	movgu	%xcc,	%i0,	%l4
	sir	0x086C
	alignaddr	%i4,	%o0,	%l3
	array16	%o7,	%l6,	%i6
	st	%f3,	[%l7 + 0x28]
	edge32ln	%l5,	%o6,	%g3
	lduh	[%l7 + 0x56],	%o2
	sth	%g5,	[%l7 + 0x56]
	umulcc	%g2,	%o5,	%i3
	edge16	%l1,	%g1,	%i5
	move	%icc,	%i7,	%o3
	movcc	%xcc,	%g6,	%o4
	mulscc	%i2,	0x093C,	%g4
	sethi	0x135A,	%l2
	movrne	%o1,	%i1,	%l0
	save %i0, 0x0E09, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l4,	%o0,	%i4
	andncc	%l3,	%l6,	%i6
	fmovrdne	%o7,	%f8,	%f16
	sdiv	%o6,	0x1407,	%g3
	fmovdvc	%xcc,	%f7,	%f12
	andcc	%o2,	%g5,	%l5
	orn	%o5,	%i3,	%l1
	andn	%g1,	0x0901,	%i5
	fsrc2	%f16,	%f20
	sdiv	%g2,	0x035D,	%o3
	sub	%i7,	0x10CF,	%g6
	edge32l	%o4,	%i2,	%l2
	movn	%icc,	%o1,	%i1
	ldx	[%l7 + 0x48],	%l0
	movrgez	%i0,	%g7,	%l4
	fmovsneg	%xcc,	%f22,	%f17
	movgu	%icc,	%o0,	%i4
	movg	%icc,	%l3,	%g4
	stb	%l6,	[%l7 + 0x4F]
	movl	%icc,	%o7,	%i6
	fmovrslez	%o6,	%f14,	%f13
	srax	%o2,	0x02,	%g5
	ld	[%l7 + 0x54],	%f19
	sth	%l5,	[%l7 + 0x28]
	smulcc	%o5,	%i3,	%g3
	sir	0x054D
	fpsub16s	%f21,	%f9,	%f23
	smulcc	%l1,	0x1B47,	%i5
	movleu	%icc,	%g2,	%g1
	fornot1s	%f10,	%f25,	%f10
	edge32	%i7,	%o3,	%g6
	fpsub32	%f28,	%f14,	%f18
	ld	[%l7 + 0x28],	%f8
	udivcc	%o4,	0x094F,	%l2
	movrgez	%o1,	0x0A4,	%i2
	subc	%i1,	0x123C,	%l0
	edge32l	%i0,	%l4,	%g7
	xnorcc	%o0,	%i4,	%g4
	subcc	%l3,	0x0C04,	%o7
	sub	%i6,	%o6,	%o2
	array32	%l6,	%g5,	%o5
	add	%l5,	%g3,	%l1
	or	%i3,	%g2,	%g1
	udivcc	%i7,	0x038F,	%i5
	udivx	%g6,	0x0B93,	%o4
	alignaddr	%o3,	%l2,	%i2
	or	%i1,	%o1,	%l0
	array16	%l4,	%g7,	%o0
	lduw	[%l7 + 0x70],	%i0
	fmovsl	%icc,	%f3,	%f14
	movrne	%g4,	0x327,	%l3
	movcs	%icc,	%i4,	%i6
	movn	%xcc,	%o7,	%o2
	movgu	%xcc,	%o6,	%g5
	edge8l	%l6,	%l5,	%g3
	sdivcc	%l1,	0x0145,	%i3
	movvs	%xcc,	%g2,	%g1
	movl	%xcc,	%o5,	%i5
	sth	%g6,	[%l7 + 0x7A]
	movre	%i7,	0x015,	%o4
	mova	%icc,	%l2,	%i2
	umul	%i1,	0x1D28,	%o1
	edge32n	%o3,	%l0,	%l4
	array8	%g7,	%o0,	%g4
	orn	%i0,	%l3,	%i4
	movvc	%icc,	%i6,	%o2
	bshuffle	%f2,	%f24,	%f10
	orncc	%o6,	%g5,	%o7
	fpackfix	%f8,	%f17
	save %l5, %l6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x3A],	%g3
	restore %g2, %g1, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i3,	%i5,	%g6
	lduh	[%l7 + 0x6C],	%i7
	save %l2, 0x0635, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i2,	%i1,	%o1
	edge8	%o3,	%l0,	%l4
	mova	%icc,	%o0,	%g7
	fmovsgu	%xcc,	%f29,	%f12
	fmovdvs	%xcc,	%f24,	%f11
	ldd	[%l7 + 0x18],	%f16
	xor	%i0,	0x1A69,	%g4
	ldub	[%l7 + 0x33],	%i4
	fcmps	%fcc3,	%f8,	%f30
	sethi	0x1D24,	%l3
	andncc	%i6,	%o6,	%g5
	subccc	%o7,	0x020A,	%o2
	fmovdleu	%xcc,	%f24,	%f6
	lduh	[%l7 + 0x56],	%l6
	mulscc	%l1,	0x1FA7,	%l5
	fpadd16	%f16,	%f20,	%f30
	edge8ln	%g3,	%g1,	%g2
	nop
	set	0x46, %o6
	ldsh	[%l7 + %o6],	%i3
	popc	%i5,	%o5
	srlx	%g6,	%i7,	%o4
	edge32n	%i2,	%l2,	%i1
	srlx	%o1,	%o3,	%l4
	array8	%l0,	%g7,	%o0
	edge8	%i0,	%i4,	%g4
	fmul8ulx16	%f24,	%f28,	%f6
	andcc	%l3,	%i6,	%g5
	subccc	%o7,	%o2,	%l6
	mova	%xcc,	%l1,	%l5
	edge16ln	%g3,	%g1,	%o6
	move	%xcc,	%g2,	%i5
	sdivx	%i3,	0x0FA9,	%g6
	add	%o5,	0x0F0F,	%i7
	fpadd32	%f4,	%f14,	%f30
	lduw	[%l7 + 0x7C],	%o4
	stw	%i2,	[%l7 + 0x70]
	movn	%icc,	%l2,	%o1
	orcc	%i1,	0x1478,	%o3
	fxnors	%f29,	%f18,	%f31
	movneg	%icc,	%l4,	%l0
	fcmpeq16	%f30,	%f4,	%o0
	sdivcc	%i0,	0x04B7,	%g7
	fmovda	%xcc,	%f2,	%f17
	edge32ln	%g4,	%i4,	%i6
	fand	%f16,	%f4,	%f4
	srax	%g5,	%l3,	%o2
	smulcc	%l6,	%l1,	%l5
	andcc	%o7,	%g1,	%o6
	fmovrsgz	%g2,	%f2,	%f1
	movne	%icc,	%g3,	%i5
	sub	%g6,	0x190E,	%o5
	movrgz	%i7,	%o4,	%i2
	edge32ln	%l2,	%i3,	%i1
	fpsub16	%f8,	%f30,	%f28
	array16	%o1,	%o3,	%l4
	sethi	0x14F1,	%o0
	sdivcc	%l0,	0x0AF4,	%g7
	fpmerge	%f28,	%f3,	%f6
	fmovsle	%xcc,	%f13,	%f9
	andncc	%i0,	%i4,	%g4
	ldd	[%l7 + 0x50],	%i6
	movpos	%icc,	%l3,	%o2
	save %l6, %g5, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o7,	0x1B,	%l1
	fcmpne32	%f14,	%f28,	%o6
	sra	%g2,	%g1,	%g3
	edge16l	%i5,	%o5,	%i7
	lduh	[%l7 + 0x4C],	%g6
	edge8n	%i2,	%o4,	%i3
	alignaddrl	%l2,	%o1,	%i1
	edge8ln	%l4,	%o3,	%l0
	fxor	%f8,	%f12,	%f14
	movcs	%icc,	%g7,	%o0
	fxnor	%f28,	%f14,	%f10
	udiv	%i0,	0x00D2,	%g4
	sll	%i6,	0x1D,	%l3
	andn	%o2,	0x1776,	%i4
	ldsw	[%l7 + 0x14],	%g5
	alignaddr	%l5,	%o7,	%l1
	edge16ln	%l6,	%o6,	%g1
	fcmpd	%fcc3,	%f18,	%f24
	srlx	%g3,	0x0C,	%g2
	fmovdle	%xcc,	%f9,	%f21
	std	%f10,	[%l7 + 0x10]
	movrlz	%i5,	0x319,	%i7
	edge8l	%g6,	%i2,	%o4
	smul	%o5,	0x15E0,	%l2
	fands	%f9,	%f30,	%f1
	movrne	%o1,	0x36F,	%i1
	sllx	%i3,	0x04,	%o3
	movne	%xcc,	%l4,	%g7
	sir	0x1256
	edge16ln	%l0,	%o0,	%g4
	edge32ln	%i6,	%i0,	%o2
	mulx	%i4,	0x144B,	%g5
	movpos	%icc,	%l3,	%l5
	sra	%l1,	0x00,	%l6
	fxors	%f1,	%f8,	%f7
	movleu	%xcc,	%o6,	%o7
	fmovsleu	%icc,	%f29,	%f8
	sra	%g3,	%g1,	%g2
	fmovrdgz	%i5,	%f8,	%f30
	xor	%g6,	0x113A,	%i7
	edge16ln	%o4,	%i2,	%l2
	edge8n	%o5,	%o1,	%i3
	edge8ln	%i1,	%l4,	%o3
	udiv	%g7,	0x0F38,	%o0
	addccc	%g4,	0x13D0,	%l0
	or	%i0,	0x0F0A,	%o2
	addccc	%i4,	0x0B28,	%i6
	ldd	[%l7 + 0x20],	%g4
	sll	%l3,	%l5,	%l1
	fmovdg	%xcc,	%f6,	%f30
	move	%xcc,	%l6,	%o7
	mova	%icc,	%o6,	%g3
	xnorcc	%g2,	0x03EB,	%i5
	sub	%g6,	0x0521,	%g1
	addccc	%o4,	0x166F,	%i2
	edge8ln	%i7,	%l2,	%o5
	smul	%i3,	0x06F5,	%i1
	array16	%o1,	%l4,	%g7
	movrlz	%o3,	%g4,	%l0
	ldd	[%l7 + 0x78],	%f18
	edge16	%o0,	%o2,	%i4
	fmovdgu	%icc,	%f20,	%f3
	udivcc	%i6,	0x0E47,	%g5
	movre	%l3,	%i0,	%l5
	movre	%l1,	%l6,	%o7
	movcs	%icc,	%o6,	%g3
	or	%g2,	%i5,	%g6
	fmovdge	%xcc,	%f19,	%f20
	movpos	%icc,	%g1,	%o4
	ldx	[%l7 + 0x60],	%i2
	lduw	[%l7 + 0x08],	%i7
	srax	%o5,	%l2,	%i1
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	mova	%icc,	%l4,	%g7
	srl	%o3,	0x07,	%g4
	ldsb	[%l7 + 0x08],	%l0
	fmovsvc	%xcc,	%f3,	%f17
	or	%o0,	%o2,	%i6
	movcc	%icc,	%g5,	%l3
	ldsh	[%l7 + 0x70],	%i4
	smul	%l5,	%i0,	%l6
	fxnor	%f20,	%f10,	%f8
	andn	%o7,	0x1CF2,	%o6
	movvc	%icc,	%g3,	%g2
	mova	%icc,	%l1,	%i5
	fmovdge	%icc,	%f15,	%f13
	mulscc	%g1,	0x0992,	%g6
	fornot2s	%f8,	%f8,	%f15
	orn	%o4,	%i2,	%o5
	movre	%i7,	%i1,	%l2
	addc	%i3,	0x0AE6,	%l4
	edge8l	%o1,	%g7,	%o3
	addcc	%g4,	%o0,	%o2
	fcmpgt16	%f8,	%f6,	%i6
	addcc	%l0,	%l3,	%i4
	orn	%l5,	0x12BD,	%i0
	fmovsge	%icc,	%f13,	%f31
	restore %g5, %o7, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%l6,	%f26,	%f12
	fcmpeq16	%f4,	%f22,	%g3
	fpadd32	%f20,	%f30,	%f30
	edge8ln	%l1,	%g2,	%g1
	movre	%g6,	%o4,	%i5
	sra	%i2,	0x0F,	%i7
	sdivcc	%o5,	0x03F1,	%l2
	movneg	%icc,	%i3,	%l4
	movrgz	%i1,	0x1C7,	%g7
	fnor	%f18,	%f16,	%f4
	edge8ln	%o1,	%g4,	%o3
	udiv	%o2,	0x09C9,	%o0
	edge16n	%l0,	%l3,	%i4
	popc	0x0DAD,	%i6
	ldd	[%l7 + 0x40],	%i0
	sub	%g5,	0x1FBE,	%o7
	move	%icc,	%l5,	%o6
	array8	%g3,	%l1,	%l6
	fmuld8sux16	%f16,	%f19,	%f24
	fmovdpos	%icc,	%f11,	%f11
	save %g2, %g1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%g6,	%i2
	sdivcc	%i7,	0x037D,	%o5
	movrne	%l2,	%i3,	%l4
	sir	0x016B
	addc	%i1,	%i5,	%g7
	lduh	[%l7 + 0x12],	%o1
	sethi	0x13B1,	%g4
	edge8	%o3,	%o0,	%l0
	addccc	%l3,	%i4,	%i6
	for	%f0,	%f24,	%f2
	mova	%icc,	%o2,	%i0
	orcc	%o7,	0x19BD,	%g5
	umulcc	%o6,	0x0626,	%g3
	fmovscs	%xcc,	%f1,	%f1
	movrlz	%l1,	%l6,	%l5
	andncc	%g1,	%o4,	%g6
	array16	%i2,	%i7,	%o5
	or	%l2,	0x1845,	%i3
	fpadd32	%f20,	%f18,	%f28
	addc	%g2,	%i1,	%l4
	xorcc	%i5,	0x1B10,	%o1
	fzeros	%f30
	edge8	%g4,	%g7,	%o0
	fones	%f16
	fcmple16	%f2,	%f20,	%l0
	orcc	%l3,	0x174D,	%i4
	udivcc	%o3,	0x17A1,	%i6
	sllx	%i0,	%o2,	%o7
	movne	%icc,	%g5,	%o6
	udivcc	%g3,	0x04B7,	%l1
	subcc	%l5,	0x18E1,	%l6
	fmul8x16al	%f17,	%f7,	%f12
	edge32n	%g1,	%g6,	%i2
	fmuld8sux16	%f8,	%f7,	%f6
	movgu	%icc,	%i7,	%o5
	mulscc	%l2,	0x0226,	%i3
	xor	%g2,	0x195B,	%i1
	movpos	%xcc,	%o4,	%i5
	alignaddrl	%l4,	%g4,	%o1
	fcmpeq16	%f24,	%f22,	%g7
	umulcc	%o0,	%l3,	%i4
	subc	%l0,	0x14AD,	%i6
	alignaddr	%o3,	%i0,	%o7
	movleu	%icc,	%o2,	%o6
	srl	%g3,	0x0D,	%g5
	movrne	%l5,	0x00F,	%l1
	xor	%g1,	0x189D,	%g6
	array32	%i2,	%i7,	%o5
	lduh	[%l7 + 0x18],	%l2
	stw	%i3,	[%l7 + 0x44]
	fmovsl	%icc,	%f11,	%f2
	andn	%g2,	%l6,	%o4
	orcc	%i5,	%i1,	%l4
	st	%f3,	[%l7 + 0x5C]
	subc	%o1,	%g4,	%g7
	ldsw	[%l7 + 0x18],	%o0
	sdivcc	%i4,	0x19DE,	%l0
	edge32n	%l3,	%o3,	%i6
	movvc	%xcc,	%i0,	%o2
	srax	%o7,	%o6,	%g3
	fcmps	%fcc2,	%f28,	%f26
	umulcc	%l5,	0x11FF,	%g5
	fpadd32s	%f4,	%f16,	%f8
	movrne	%g1,	0x181,	%l1
	edge8ln	%i2,	%g6,	%o5
	sdivx	%l2,	0x1E29,	%i7
	xnor	%g2,	%l6,	%o4
	movne	%icc,	%i3,	%i1
	movne	%icc,	%i5,	%l4
	ldd	[%l7 + 0x48],	%f0
	fmovrdgz	%g4,	%f18,	%f0
	add	%o1,	%g7,	%i4
	smulcc	%o0,	%l0,	%o3
	edge32	%i6,	%i0,	%o2
	srax	%o7,	0x0E,	%o6
	sth	%g3,	[%l7 + 0x32]
	alignaddrl	%l5,	%g5,	%g1
	alignaddr	%l3,	%l1,	%i2
	udivcc	%g6,	0x1170,	%o5
	edge16n	%l2,	%g2,	%l6
	fzeros	%f25
	stb	%i7,	[%l7 + 0x3D]
	movcc	%xcc,	%i3,	%i1
	umulcc	%o4,	0x092D,	%l4
	siam	0x7
	addccc	%i5,	%g4,	%g7
	addcc	%i4,	%o1,	%l0
	array8	%o3,	%i6,	%o0
	ldsh	[%l7 + 0x7E],	%o2
	lduw	[%l7 + 0x78],	%i0
	movrgez	%o7,	%o6,	%g3
	mulx	%g5,	%g1,	%l5
	std	%f20,	[%l7 + 0x40]
	fmovdleu	%xcc,	%f23,	%f16
	andn	%l1,	%l3,	%i2
	smulcc	%o5,	%l2,	%g6
	addcc	%l6,	0x0EE1,	%g2
	edge8n	%i3,	%i1,	%i7
	or	%l4,	%o4,	%g4
	addcc	%g7,	%i5,	%o1
	fmovdle	%xcc,	%f2,	%f9
	umul	%i4,	%o3,	%l0
	movleu	%xcc,	%o0,	%o2
	sdiv	%i0,	0x1157,	%i6
	nop
	set	0x18, %l6
	ldsw	[%l7 + %l6],	%o6
	fsrc2s	%f8,	%f16
	xnorcc	%g3,	%o7,	%g5
	fmovsn	%icc,	%f7,	%f13
	edge32n	%g1,	%l1,	%l3
	andcc	%i2,	%o5,	%l5
	nop
	set	0x72, %o3
	ldsb	[%l7 + %o3],	%g6
	edge32ln	%l2,	%g2,	%l6
	fmul8x16au	%f29,	%f0,	%f26
	movre	%i3,	%i1,	%l4
	alignaddrl	%o4,	%i7,	%g7
	lduh	[%l7 + 0x68],	%g4
	edge32	%i5,	%i4,	%o3
	edge16l	%o1,	%o0,	%o2
	fmovdleu	%xcc,	%f7,	%f19
	array32	%l0,	%i0,	%i6
	fmovsne	%xcc,	%f18,	%f2
	fsrc2	%f22,	%f0
	edge16	%g3,	%o7,	%g5
	fandnot1s	%f24,	%f30,	%f31
	stx	%g1,	[%l7 + 0x28]
	edge16n	%l1,	%o6,	%l3
	fnot2	%f16,	%f2
	ldub	[%l7 + 0x4F],	%i2
	movrlz	%o5,	%l5,	%g6
	ld	[%l7 + 0x34],	%f27
	edge32ln	%g2,	%l2,	%i3
	alignaddrl	%i1,	%l4,	%o4
	mulscc	%l6,	0x0D0F,	%i7
	edge8ln	%g7,	%g4,	%i5
	xor	%o3,	%i4,	%o1
	stw	%o2,	[%l7 + 0x20]
	std	%f2,	[%l7 + 0x10]
	array8	%l0,	%i0,	%i6
	subc	%g3,	0x02CF,	%o0
	movrlez	%o7,	0x2E2,	%g5
	fmovdgu	%icc,	%f20,	%f8
	edge8l	%g1,	%l1,	%o6
	fsrc1s	%f22,	%f4
	stb	%i2,	[%l7 + 0x6C]
	ldub	[%l7 + 0x41],	%l3
	array16	%l5,	%g6,	%o5
	array32	%g2,	%l2,	%i3
	nop
	set	0x6E, %i6
	ldsh	[%l7 + %i6],	%i1
	fmovsneg	%icc,	%f21,	%f12
	orncc	%l4,	%o4,	%l6
	movvc	%icc,	%g7,	%i7
	andcc	%g4,	0x0BF5,	%o3
	udiv	%i4,	0x016B,	%i5
	edge8	%o1,	%o2,	%i0
	edge32	%i6,	%g3,	%l0
	movrgez	%o0,	%g5,	%o7
	move	%icc,	%g1,	%o6
	subccc	%i2,	0x08FA,	%l1
	nop
	set	0x0C, %o2
	lduh	[%l7 + %o2],	%l5
	orcc	%g6,	%o5,	%l3
	fnot1s	%f11,	%f30
	fpadd32s	%f17,	%f22,	%f17
	orn	%l2,	%g2,	%i3
	sir	0x02C0
	movgu	%icc,	%i1,	%l4
	fsrc2s	%f23,	%f23
	sdivcc	%l6,	0x1058,	%o4
	stx	%i7,	[%l7 + 0x40]
	sethi	0x1442,	%g4
	movvs	%xcc,	%g7,	%o3
	mulx	%i4,	%o1,	%o2
	subc	%i5,	0x0B8F,	%i6
	std	%f6,	[%l7 + 0x70]
	and	%g3,	%l0,	%i0
	fmovsge	%xcc,	%f21,	%f25
	fmovdneg	%xcc,	%f8,	%f26
	smulcc	%o0,	%o7,	%g5
	fsrc2	%f4,	%f24
	sdivcc	%o6,	0x149B,	%i2
	sllx	%l1,	0x02,	%l5
	mova	%icc,	%g6,	%g1
	movrlz	%o5,	0x097,	%l3
	subc	%l2,	0x0899,	%i3
	movrgez	%i1,	0x2DE,	%l4
	movvs	%icc,	%g2,	%l6
	sllx	%o4,	%g4,	%i7
	sdivx	%o3,	0x13AE,	%i4
	stw	%g7,	[%l7 + 0x70]
	addc	%o1,	0x12A4,	%o2
	edge8	%i5,	%g3,	%i6
	fcmple16	%f14,	%f2,	%l0
	movrlz	%o0,	0x06F,	%i0
	movl	%xcc,	%g5,	%o6
	fnot1s	%f8,	%f6
	fpsub16s	%f31,	%f18,	%f15
	movrgz	%o7,	0x18B,	%l1
	fmovdvs	%xcc,	%f27,	%f27
	edge32l	%l5,	%g6,	%i2
	subcc	%g1,	0x1B65,	%o5
	addccc	%l2,	%i3,	%i1
	movvs	%xcc,	%l3,	%g2
	smulcc	%l6,	0x06C4,	%l4
	edge16	%o4,	%g4,	%o3
	sub	%i7,	0x00C3,	%i4
	ldd	[%l7 + 0x38],	%f14
	edge8	%g7,	%o2,	%i5
	movl	%icc,	%g3,	%o1
	orcc	%l0,	%i6,	%o0
	ldub	[%l7 + 0x76],	%g5
	fmovscc	%icc,	%f13,	%f23
	edge8ln	%i0,	%o7,	%o6
	fxor	%f22,	%f26,	%f30
	movrne	%l1,	0x064,	%l5
	srax	%g6,	0x0B,	%i2
	edge8ln	%g1,	%l2,	%o5
	fexpand	%f27,	%f14
	smulcc	%i1,	0x0738,	%l3
	sra	%g2,	%l6,	%i3
	xnorcc	%o4,	%g4,	%l4
	sdivcc	%i7,	0x1341,	%i4
	sllx	%g7,	0x0E,	%o2
	or	%i5,	%o3,	%g3
	edge8n	%o1,	%i6,	%o0
	st	%f4,	[%l7 + 0x68]
	udivx	%l0,	0x18A3,	%i0
	add	%g5,	0x1C1D,	%o6
	ldx	[%l7 + 0x48],	%o7
	sub	%l5,	0x1C95,	%l1
	fexpand	%f9,	%f20
	fcmpne32	%f14,	%f30,	%g6
	fmovsa	%icc,	%f22,	%f8
	sllx	%i2,	0x18,	%g1
	sdivcc	%o5,	0x0BF6,	%l2
	bshuffle	%f26,	%f6,	%f22
	array16	%i1,	%g2,	%l6
	save %i3, %l3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1241,	%o4
	orn	%l4,	%i7,	%i4
	movrne	%g7,	%i5,	%o2
	movrne	%g3,	0x3EC,	%o3
	movvc	%icc,	%o1,	%i6
	nop
	set	0x50, %l5
	ldx	[%l7 + %l5],	%l0
	edge32l	%o0,	%g5,	%i0
	orcc	%o6,	%o7,	%l5
	andn	%l1,	0x01E4,	%g6
	sra	%g1,	0x0F,	%o5
	fcmpgt32	%f26,	%f10,	%i2
	movneg	%xcc,	%i1,	%l2
	array16	%g2,	%i3,	%l3
	fmovdcc	%icc,	%f29,	%f26
	subccc	%g4,	%o4,	%l6
	edge32l	%i7,	%i4,	%g7
	edge16n	%l4,	%o2,	%g3
	addcc	%o3,	%o1,	%i6
	movge	%xcc,	%l0,	%i5
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	move	%xcc,	%i0,	%o7
	fandnot2s	%f22,	%f29,	%f1
	edge16	%l5,	%l1,	%g6
	fcmpeq16	%f16,	%f8,	%g1
	orn	%o6,	0x0AB2,	%i2
	fmovrslz	%o5,	%f10,	%f16
	ldd	[%l7 + 0x18],	%i0
	edge32l	%g2,	%l2,	%l3
	edge32	%i3,	%g4,	%o4
	lduw	[%l7 + 0x4C],	%i7
	addc	%l6,	%i4,	%g7
	fexpand	%f31,	%f16
	or	%o2,	%g3,	%o3
	udiv	%o1,	0x092C,	%l4
	umul	%i6,	0x17C5,	%i5
	movne	%icc,	%o0,	%g5
	fmovrde	%l0,	%f16,	%f28
	or	%o7,	0x0A1B,	%i0
	save %l1, 0x1FF8, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%l5,	%o6
	movpos	%xcc,	%g1,	%i2
	xnorcc	%i1,	0x1E85,	%o5
	fmul8ulx16	%f6,	%f4,	%f20
	ldx	[%l7 + 0x48],	%g2
	fpack32	%f2,	%f28,	%f10
	fzero	%f16
	srlx	%l3,	0x1E,	%l2
	fmovrse	%i3,	%f0,	%f6
	orcc	%g4,	0x1F2B,	%o4
	fmovdne	%xcc,	%f6,	%f19
	umulcc	%l6,	%i4,	%i7
	fcmpeq16	%f16,	%f20,	%o2
	stb	%g7,	[%l7 + 0x74]
	alignaddr	%o3,	%o1,	%g3
	fpsub16s	%f14,	%f30,	%f12
	fnors	%f13,	%f3,	%f13
	fcmpeq16	%f30,	%f18,	%l4
	fabss	%f28,	%f16
	fmovrslez	%i6,	%f24,	%f8
	mova	%xcc,	%o0,	%g5
	ldsw	[%l7 + 0x54],	%l0
	umulcc	%o7,	0x16D0,	%i5
	move	%icc,	%l1,	%i0
	addcc	%l5,	0x0A53,	%g6
	fone	%f12
	edge8	%g1,	%i2,	%o6
	fpsub32s	%f24,	%f15,	%f31
	movne	%icc,	%i1,	%o5
	fmul8sux16	%f6,	%f16,	%f26
	nop
	set	0x6A, %i4
	sth	%g2,	[%l7 + %i4]
	restore %l2, 0x1336, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g4,	%l3,	%l6
	movrgz	%i4,	%i7,	%o2
	udivx	%o4,	0x1A1B,	%g7
	andncc	%o3,	%o1,	%g3
	orcc	%i6,	0x171F,	%o0
	fmovrdne	%g5,	%f22,	%f2
	fexpand	%f9,	%f8
	udiv	%l4,	0x0AE2,	%l0
	orn	%o7,	0x0438,	%l1
	alignaddrl	%i5,	%l5,	%g6
	fzeros	%f11
	sir	0x1C48
	sdivx	%g1,	0x0144,	%i2
	movgu	%icc,	%o6,	%i1
	fcmpes	%fcc0,	%f28,	%f25
	edge8ln	%o5,	%i0,	%g2
	edge32l	%l2,	%i3,	%g4
	fcmpgt32	%f16,	%f24,	%l3
	movrgz	%i4,	%l6,	%i7
	orn	%o4,	0x11EA,	%o2
	movl	%xcc,	%o3,	%g7
	sdivx	%g3,	0x098B,	%i6
	fcmpgt16	%f24,	%f30,	%o0
	and	%o1,	0x1D20,	%l4
	stw	%l0,	[%l7 + 0x68]
	fsrc2s	%f27,	%f20
	lduh	[%l7 + 0x6E],	%g5
	andcc	%o7,	0x12D3,	%i5
	umulcc	%l5,	0x0F56,	%l1
	edge32l	%g6,	%i2,	%o6
	mova	%icc,	%i1,	%o5
	smul	%i0,	0x1C47,	%g2
	array8	%g1,	%l2,	%i3
	andn	%g4,	%l3,	%l6
	fmul8sux16	%f6,	%f4,	%f22
	fnot2	%f16,	%f18
	add	%i4,	0x14A6,	%o4
	udivx	%i7,	0x1BB7,	%o2
	fpsub32	%f14,	%f24,	%f18
	fcmpes	%fcc3,	%f20,	%f16
	or	%o3,	%g3,	%i6
	edge16ln	%o0,	%o1,	%l4
	stw	%l0,	[%l7 + 0x14]
	sir	0x1089
	movvs	%icc,	%g7,	%g5
	andncc	%o7,	%l5,	%i5
	fandnot1	%f6,	%f2,	%f26
	array8	%l1,	%i2,	%g6
	or	%o6,	0x1387,	%o5
	fnot2s	%f14,	%f15
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%i0
	movrlz	%g2,	%i0,	%l2
	fsrc1s	%f29,	%f22
	move	%xcc,	%g1,	%i3
	edge32	%l3,	%g4,	%i4
	fmovdleu	%xcc,	%f30,	%f4
	movre	%l6,	0x1FF,	%i7
	fsrc1	%f10,	%f2
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	subcc	%o2,	%o0,	%i6
	edge32	%o1,	%l4,	%l0
	fmovdl	%icc,	%f20,	%f23
	ldsb	[%l7 + 0x18],	%g5
	sethi	0x15C3,	%g7
	srlx	%o7,	0x1D,	%i5
	popc	0x0BA3,	%l5
	subc	%i2,	%l1,	%o6
	fmovdn	%icc,	%f27,	%f10
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%f4
	fpack32	%f12,	%f24,	%f12
	fone	%f12
	smul	%o5,	%i1,	%g2
	sth	%i0,	[%l7 + 0x54]
	movrlz	%l2,	0x3FD,	%g1
	movrlez	%g6,	0x31F,	%l3
	sra	%i3,	0x00,	%i4
	xor	%l6,	0x14B0,	%i7
	move	%icc,	%o4,	%g4
	movrlez	%o3,	%g3,	%o2
	add	%i6,	0x0A1D,	%o1
	ldub	[%l7 + 0x1E],	%o0
	mulscc	%l4,	0x0B82,	%l0
	ldsw	[%l7 + 0x58],	%g5
	ld	[%l7 + 0x28],	%f3
	or	%o7,	0x0879,	%g7
	nop
	set	0x4C, %l4
	lduw	[%l7 + %l4],	%l5
	sir	0x1FC2
	nop
	set	0x5D, %g3
	stb	%i2,	[%l7 + %g3]
	fnot1s	%f11,	%f6
	fabss	%f3,	%f22
	udiv	%l1,	0x0345,	%i5
	edge16l	%o6,	%o5,	%g2
	movrgez	%i1,	0x34E,	%i0
	addc	%g1,	0x0B03,	%l2
	fcmpne16	%f22,	%f2,	%g6
	ldd	[%l7 + 0x10],	%l2
	array8	%i3,	%l6,	%i4
	fnors	%f3,	%f30,	%f22
	restore %i7, 0x1CC9, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0389,	%o3
	fmovdle	%icc,	%f4,	%f30
	save %g3, %g4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f25,	%f6,	%f26
	fmovrslez	%o1,	%f8,	%f20
	addccc	%o0,	%o2,	%l0
	fcmpd	%fcc1,	%f22,	%f26
	stw	%g5,	[%l7 + 0x28]
	edge16n	%o7,	%g7,	%l4
	fcmped	%fcc1,	%f10,	%f10
	array32	%l5,	%i2,	%l1
	ldx	[%l7 + 0x38],	%i5
	edge32n	%o6,	%o5,	%g2
	movrlz	%i1,	0x325,	%i0
	addc	%l2,	%g6,	%l3
	fpsub32s	%f25,	%f13,	%f19
	edge8ln	%g1,	%l6,	%i4
	alignaddr	%i3,	%o4,	%i7
	edge16ln	%g3,	%o3,	%g4
	fpmerge	%f17,	%f10,	%f0
	fmovsgu	%xcc,	%f16,	%f2
	andn	%i6,	0x105C,	%o0
	edge16	%o1,	%l0,	%g5
	fmuld8ulx16	%f22,	%f24,	%f20
	sth	%o2,	[%l7 + 0x1A]
	fmovs	%f26,	%f8
	lduh	[%l7 + 0x46],	%g7
	fmul8x16	%f7,	%f14,	%f16
	srlx	%l4,	0x0D,	%o7
	fexpand	%f26,	%f28
	or	%l5,	%i2,	%i5
	movcs	%icc,	%l1,	%o6
	fcmpgt32	%f26,	%f22,	%g2
	sethi	0x1980,	%o5
	sdivcc	%i0,	0x1BF0,	%l2
	ldub	[%l7 + 0x4A],	%g6
	movrgz	%i1,	%g1,	%l6
	movneg	%xcc,	%i4,	%l3
	movneg	%xcc,	%o4,	%i7
	movneg	%xcc,	%i3,	%g3
	fmovdle	%icc,	%f31,	%f0
	movrne	%g4,	%o3,	%i6
	udiv	%o0,	0x0658,	%l0
	xnor	%g5,	0x0F3C,	%o1
	array16	%o2,	%l4,	%o7
	fandnot2s	%f28,	%f13,	%f29
	udiv	%l5,	0x0C62,	%g7
	movne	%icc,	%i2,	%l1
	array16	%o6,	%g2,	%i5
	fmovdvs	%xcc,	%f12,	%f4
	fpack32	%f8,	%f22,	%f8
	movg	%xcc,	%i0,	%l2
	fxnor	%f30,	%f4,	%f24
	edge8n	%g6,	%i1,	%g1
	fpsub16	%f22,	%f2,	%f28
	fnegd	%f26,	%f14
	lduh	[%l7 + 0x6C],	%l6
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%o4
	xorcc	%i4,	%o4,	%l3
	addcc	%i3,	%i7,	%g3
	fmul8x16au	%f10,	%f26,	%f26
	movle	%xcc,	%g4,	%i6
	fmovdn	%icc,	%f31,	%f11
	srl	%o3,	%l0,	%o0
	mova	%icc,	%o1,	%o2
	fmovdn	%xcc,	%f17,	%f4
	sdivx	%g5,	0x1508,	%l4
	umul	%o7,	%g7,	%i2
	edge8	%l5,	%l1,	%g2
	or	%i5,	0x03DD,	%o6
	movge	%xcc,	%l2,	%i0
	array8	%i1,	%g6,	%l6
	movl	%icc,	%o5,	%i4
	addc	%g1,	0x062E,	%l3
	fpsub16	%f2,	%f12,	%f14
	movle	%icc,	%i3,	%o4
	sllx	%g3,	%i7,	%i6
	fmovdcs	%icc,	%f29,	%f7
	mulx	%o3,	0x10D7,	%l0
	fmovsvc	%icc,	%f30,	%f30
	orncc	%o0,	%g4,	%o1
	alignaddrl	%g5,	%o2,	%o7
	umulcc	%l4,	0x112C,	%i2
	xorcc	%l5,	%l1,	%g7
	movrlz	%i5,	0x18B,	%o6
	movrlz	%g2,	0x345,	%l2
	fpsub16	%f16,	%f28,	%f28
	movpos	%icc,	%i1,	%g6
	fmovrslez	%l6,	%f28,	%f3
	fmovrdgz	%i0,	%f24,	%f26
	sdivcc	%i4,	0x1795,	%g1
	fpadd16	%f8,	%f2,	%f26
	movrlz	%l3,	0x32C,	%i3
	movg	%xcc,	%o4,	%g3
	xor	%i7,	0x1B8B,	%i6
	xnor	%o5,	%o3,	%o0
	srax	%g4,	%l0,	%o1
	movre	%o2,	0x1C8,	%o7
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%f18
	lduh	[%l7 + 0x18],	%l4
	edge16ln	%i2,	%g5,	%l1
	edge32l	%g7,	%i5,	%o6
	andn	%g2,	%l2,	%l5
	edge8	%g6,	%i1,	%i0
	edge8ln	%i4,	%g1,	%l3
	xnor	%l6,	%o4,	%g3
	fcmpes	%fcc2,	%f0,	%f15
	edge8n	%i7,	%i6,	%i3
	fxor	%f22,	%f14,	%f6
	fcmple32	%f24,	%f8,	%o5
	xorcc	%o0,	%g4,	%o3
	umul	%l0,	%o2,	%o1
	ldx	[%l7 + 0x50],	%o7
	ldd	[%l7 + 0x60],	%i2
	movne	%icc,	%g5,	%l4
	edge8n	%l1,	%i5,	%o6
	fcmped	%fcc1,	%f18,	%f8
	fmovdge	%xcc,	%f29,	%f24
	movrgez	%g2,	%l2,	%l5
	subc	%g6,	0x1658,	%g7
	xnor	%i0,	%i4,	%i1
	stw	%l3,	[%l7 + 0x2C]
	xorcc	%g1,	%o4,	%l6
	fands	%f21,	%f16,	%f8
	udivcc	%i7,	0x1096,	%i6
	addccc	%g3,	%i3,	%o0
	ld	[%l7 + 0x50],	%f7
	fcmpgt16	%f2,	%f28,	%g4
	std	%f30,	[%l7 + 0x60]
	movgu	%xcc,	%o5,	%o3
	edge8	%o2,	%o1,	%l0
	fors	%f19,	%f13,	%f7
	ldsb	[%l7 + 0x64],	%o7
	fmovdg	%xcc,	%f5,	%f13
	xor	%i2,	0x0EA7,	%l4
	alignaddrl	%l1,	%g5,	%o6
	edge8ln	%i5,	%g2,	%l5
	edge8l	%l2,	%g6,	%g7
	edge16	%i4,	%i0,	%i1
	stw	%g1,	[%l7 + 0x4C]
	subcc	%o4,	0x1234,	%l3
	ldx	[%l7 + 0x58],	%i7
	edge16n	%i6,	%g3,	%i3
	movg	%icc,	%l6,	%o0
	fmovsleu	%xcc,	%f0,	%f30
	subc	%g4,	0x1201,	%o5
	st	%f21,	[%l7 + 0x4C]
	mova	%icc,	%o2,	%o1
	addc	%l0,	%o7,	%i2
	sdiv	%o3,	0x1BC0,	%l1
	fandnot2	%f6,	%f22,	%f10
	ldsh	[%l7 + 0x44],	%l4
	fandnot1	%f6,	%f12,	%f10
	fcmpne32	%f6,	%f6,	%o6
	st	%f25,	[%l7 + 0x5C]
	edge16	%i5,	%g5,	%g2
	movvs	%icc,	%l2,	%l5
	stb	%g6,	[%l7 + 0x0C]
	orcc	%g7,	%i0,	%i1
	or	%i4,	%o4,	%g1
	movrlz	%i7,	0x06C,	%i6
	orn	%l3,	%i3,	%g3
	orcc	%o0,	0x0B85,	%l6
	smulcc	%o5,	0x058A,	%o2
	fmovsvc	%icc,	%f30,	%f26
	edge8	%g4,	%o1,	%l0
	edge32ln	%i2,	%o3,	%l1
	std	%f4,	[%l7 + 0x58]
	udivcc	%l4,	0x1938,	%o6
	fmovde	%xcc,	%f4,	%f12
	popc	%o7,	%g5
	fones	%f31
	fzero	%f22
	fmovrsne	%i5,	%f21,	%f3
	edge16l	%g2,	%l5,	%g6
	fmovrsne	%l2,	%f29,	%f3
	fexpand	%f18,	%f30
	fmul8x16al	%f18,	%f29,	%f22
	edge16n	%i0,	%i1,	%i4
	sdiv	%o4,	0x0731,	%g7
	movre	%g1,	0x382,	%i6
	sdivcc	%i7,	0x19EF,	%l3
	smulcc	%g3,	0x1131,	%o0
	orn	%i3,	%l6,	%o5
	mova	%icc,	%o2,	%g4
	movrlz	%o1,	0x2E9,	%i2
	mulx	%o3,	%l0,	%l1
	ldsb	[%l7 + 0x50],	%l4
	movvs	%icc,	%o6,	%g5
	movvc	%icc,	%o7,	%i5
	edge16l	%l5,	%g2,	%g6
	smul	%i0,	0x06E8,	%i1
	srlx	%l2,	0x05,	%i4
	movrlez	%o4,	%g7,	%i6
	array8	%i7,	%g1,	%g3
	save %l3, %o0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f9,	%f24,	%f22
	fmovsleu	%xcc,	%f14,	%f4
	edge16ln	%o5,	%i3,	%g4
	edge32l	%o1,	%i2,	%o3
	fxors	%f15,	%f11,	%f31
	fabss	%f14,	%f6
	array16	%o2,	%l1,	%l4
	sir	0x0F75
	sdivcc	%o6,	0x17FB,	%g5
	xor	%o7,	%i5,	%l5
	ldd	[%l7 + 0x48],	%g2
	edge32l	%g6,	%l0,	%i1
	ldd	[%l7 + 0x68],	%i0
	popc	0x1197,	%i4
	fzeros	%f13
	umul	%l2,	%g7,	%i6
	std	%f26,	[%l7 + 0x48]
	addc	%i7,	%o4,	%g3
	umulcc	%g1,	%l3,	%l6
	lduh	[%l7 + 0x0A],	%o0
	fsrc2	%f20,	%f24
	srl	%o5,	%i3,	%g4
	movcc	%icc,	%o1,	%i2
	fcmpgt32	%f6,	%f26,	%o3
	fcmped	%fcc3,	%f0,	%f12
	fxnors	%f29,	%f9,	%f1
	ldsw	[%l7 + 0x78],	%l1
	movg	%icc,	%o2,	%o6
	ldd	[%l7 + 0x70],	%g4
	ldd	[%l7 + 0x60],	%f14
	ldub	[%l7 + 0x25],	%l4
	edge32l	%o7,	%i5,	%g2
	fmovdvs	%icc,	%f12,	%f7
	fmovsvc	%xcc,	%f16,	%f10
	fornot2	%f0,	%f28,	%f16
	fxnors	%f21,	%f8,	%f20
	fpmerge	%f29,	%f17,	%f30
	array32	%l5,	%g6,	%l0
	array16	%i1,	%i0,	%l2
	edge16	%g7,	%i4,	%i6
	srlx	%o4,	%g3,	%g1
	edge8n	%l3,	%l6,	%i7
	fmul8x16au	%f28,	%f15,	%f20
	ldub	[%l7 + 0x43],	%o5
	stw	%i3,	[%l7 + 0x54]
	fpmerge	%f13,	%f9,	%f4
	fmovrdne	%o0,	%f6,	%f6
	movrne	%g4,	0x08F,	%o1
	bshuffle	%f8,	%f26,	%f20
	edge8n	%o3,	%l1,	%o2
	sdivcc	%i2,	0x097B,	%g5
	umulcc	%o6,	%l4,	%o7
	ldx	[%l7 + 0x58],	%g2
	orcc	%l5,	0x13FA,	%i5
	fmovdgu	%xcc,	%f2,	%f30
	fnor	%f18,	%f16,	%f14
	fmovsvs	%icc,	%f12,	%f16
	edge16ln	%l0,	%i1,	%g6
	edge16	%l2,	%i0,	%i4
	fmovdge	%xcc,	%f1,	%f6
	fsrc2s	%f3,	%f27
	movrlez	%g7,	0x34C,	%i6
	movrlez	%o4,	0x3EA,	%g3
	st	%f14,	[%l7 + 0x60]
	xorcc	%g1,	0x027E,	%l6
	addcc	%i7,	0x0820,	%o5
	andn	%l3,	%o0,	%i3
	fandnot1s	%f0,	%f2,	%f9
	fmovspos	%xcc,	%f9,	%f4
	ldsh	[%l7 + 0x4A],	%g4
	fmovrsne	%o1,	%f16,	%f29
	and	%o3,	0x1228,	%l1
	movle	%icc,	%o2,	%i2
	movrne	%o6,	%l4,	%o7
	alignaddr	%g2,	%g5,	%l5
	movrlz	%l0,	0x24F,	%i1
	fcmpne32	%f18,	%f20,	%i5
	edge8l	%l2,	%g6,	%i0
	fandnot2s	%f10,	%f5,	%f7
	sllx	%i4,	0x0D,	%g7
	add	%o4,	0x1AB3,	%i6
	subc	%g1,	0x1FAD,	%g3
	movge	%xcc,	%i7,	%l6
	udivx	%l3,	0x0FF1,	%o5
	orcc	%i3,	0x0942,	%o0
	ldd	[%l7 + 0x60],	%f26
	srax	%o1,	%o3,	%g4
	addcc	%o2,	%i2,	%o6
	movvc	%icc,	%l1,	%l4
	fmovsle	%icc,	%f26,	%f21
	ld	[%l7 + 0x3C],	%f17
	movvc	%xcc,	%g2,	%o7
	ldsh	[%l7 + 0x62],	%g5
	edge8l	%l5,	%l0,	%i5
	or	%l2,	%i1,	%i0
	array32	%g6,	%i4,	%g7
	ld	[%l7 + 0x68],	%f30
	stx	%i6,	[%l7 + 0x48]
	movvs	%icc,	%o4,	%g3
	xor	%g1,	%l6,	%l3
	fmovrsgez	%o5,	%f18,	%f11
	fones	%f17
	addcc	%i7,	%i3,	%o0
	movrgz	%o1,	%o3,	%o2
	sra	%g4,	%i2,	%l1
	umulcc	%o6,	%l4,	%g2
	andn	%g5,	0x0218,	%l5
	stw	%l0,	[%l7 + 0x30]
	xnorcc	%o7,	%l2,	%i1
	movne	%icc,	%i5,	%i0
	edge8l	%g6,	%g7,	%i6
	sra	%i4,	%o4,	%g3
	save %l6, 0x1106, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f1,	%f9
	edge8ln	%o5,	%i7,	%i3
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	movvc	%xcc,	%o2,	%o3
	xorcc	%i2,	%g4,	%o6
	movg	%xcc,	%l1,	%l4
	stx	%g2,	[%l7 + 0x70]
	sub	%l5,	%g5,	%l0
	fmovs	%f0,	%f8
	ldd	[%l7 + 0x18],	%f16
	xnorcc	%l2,	0x1237,	%o7
	udivcc	%i5,	0x1F1E,	%i0
	fmovscc	%xcc,	%f5,	%f22
	movn	%icc,	%i1,	%g7
	fmovdge	%icc,	%f16,	%f19
	std	%f30,	[%l7 + 0x48]
	movneg	%xcc,	%g6,	%i6
	edge16	%i4,	%g3,	%o4
	ldd	[%l7 + 0x18],	%i6
	addcc	%g1,	%i7,	%o5
	sth	%i3,	[%l7 + 0x38]
	sll	%l3,	0x11,	%o0
	movne	%icc,	%o1,	%o2
	sll	%o3,	%g4,	%i2
	edge16l	%l1,	%l4,	%g2
	sdivx	%l5,	0x15A9,	%o6
	addccc	%g5,	%l0,	%l2
	sllx	%o7,	0x0D,	%i5
	fnegs	%f28,	%f28
	fmovdgu	%icc,	%f16,	%f1
	movre	%i1,	%i0,	%g6
	movre	%g7,	0x334,	%i6
	movcs	%icc,	%g3,	%o4
	edge32	%l6,	%g1,	%i4
	movvc	%icc,	%i7,	%o5
	fpack32	%f30,	%f12,	%f24
	orn	%i3,	%l3,	%o1
	movcs	%icc,	%o0,	%o3
	edge32n	%g4,	%i2,	%o2
	or	%l1,	0x0E6D,	%l4
	xor	%g2,	%l5,	%o6
	add	%g5,	%l0,	%l2
	alignaddrl	%o7,	%i1,	%i5
	fnand	%f20,	%f20,	%f24
	restore %g6, %g7, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g3,	%o4,	%i6
	addc	%g1,	0x0053,	%l6
	movrne	%i4,	%o5,	%i3
	addccc	%l3,	%i7,	%o0
	edge8	%o1,	%o3,	%i2
	edge8l	%o2,	%l1,	%g4
	ldx	[%l7 + 0x30],	%g2
	fmuld8ulx16	%f10,	%f2,	%f28
	subcc	%l4,	0x185F,	%o6
	edge8ln	%l5,	%g5,	%l0
	umul	%l2,	0x086A,	%i1
	fmul8sux16	%f22,	%f12,	%f24
	andn	%i5,	%g6,	%g7
	ldd	[%l7 + 0x48],	%o6
	xnor	%g3,	%o4,	%i0
	movpos	%xcc,	%g1,	%l6
	movg	%xcc,	%i4,	%i6
	movre	%i3,	0x113,	%l3
	movgu	%icc,	%i7,	%o5
	fmovd	%f26,	%f8
	movleu	%icc,	%o0,	%o1
	xnor	%i2,	0x05A1,	%o3
	fzeros	%f11
	fmovd	%f26,	%f2
	ldub	[%l7 + 0x74],	%l1
	fmul8x16al	%f20,	%f15,	%f6
	fmovdvs	%icc,	%f9,	%f1
	subcc	%o2,	0x0A0F,	%g4
	fcmpne32	%f24,	%f0,	%l4
	edge16n	%g2,	%o6,	%g5
	fabsd	%f22,	%f30
	ldd	[%l7 + 0x20],	%f26
	nop
	set	0x46, %o4
	ldsb	[%l7 + %o4],	%l0
	smul	%l5,	0x0BA6,	%l2
	addc	%i1,	0x1CFE,	%i5
	stw	%g7,	[%l7 + 0x7C]
	fxors	%f19,	%f2,	%f25
	mulx	%g6,	0x0E82,	%o7
	ld	[%l7 + 0x4C],	%f2
	movpos	%icc,	%g3,	%i0
	sth	%o4,	[%l7 + 0x5E]
	add	%g1,	%l6,	%i4
	fpack32	%f10,	%f18,	%f30
	stb	%i6,	[%l7 + 0x1B]
	add	%i3,	%i7,	%l3
	addcc	%o5,	0x1F37,	%o1
	fmul8ulx16	%f20,	%f16,	%f2
	fmovscs	%icc,	%f30,	%f20
	edge16	%o0,	%o3,	%i2
	and	%o2,	%l1,	%l4
	fmul8x16	%f26,	%f10,	%f16
	udivcc	%g2,	0x087F,	%g4
	fandnot1s	%f17,	%f30,	%f17
	edge32	%o6,	%g5,	%l0
	fmovsneg	%icc,	%f24,	%f22
	stw	%l2,	[%l7 + 0x4C]
	srl	%i1,	%i5,	%g7
	fandnot2	%f20,	%f8,	%f24
	fmovrde	%l5,	%f2,	%f20
	umulcc	%o7,	%g3,	%g6
	ldd	[%l7 + 0x68],	%f30
	ldub	[%l7 + 0x69],	%i0
	fornot1	%f14,	%f14,	%f14
	fmovdneg	%xcc,	%f22,	%f5
	srlx	%g1,	0x04,	%l6
	subcc	%o4,	%i6,	%i4
	addc	%i7,	0x0704,	%i3
	sll	%l3,	%o5,	%o1
	fmovsl	%xcc,	%f1,	%f12
	fmovrse	%o0,	%f22,	%f1
	array16	%o3,	%o2,	%l1
	movrne	%i2,	0x10D,	%g2
	edge8	%g4,	%o6,	%l4
	fmul8x16au	%f14,	%f26,	%f2
	movre	%g5,	0x0C1,	%l2
	sll	%l0,	%i5,	%i1
	fmul8x16au	%f29,	%f13,	%f8
	fmovsn	%icc,	%f20,	%f4
	sra	%g7,	0x17,	%o7
	alignaddr	%g3,	%g6,	%l5
	udivcc	%g1,	0x1E87,	%i0
	stw	%l6,	[%l7 + 0x74]
	movg	%xcc,	%o4,	%i4
	movneg	%xcc,	%i7,	%i3
	subccc	%i6,	%o5,	%l3
	xnorcc	%o0,	%o1,	%o3
	srax	%l1,	%i2,	%g2
	movn	%icc,	%o2,	%o6
	fsrc2	%f4,	%f4
	edge16	%l4,	%g4,	%l2
	sdivcc	%l0,	0x0CE8,	%g5
	movle	%xcc,	%i5,	%i1
	ldsb	[%l7 + 0x3B],	%o7
	andcc	%g3,	%g7,	%g6
	movneg	%xcc,	%g1,	%l5
	std	%f12,	[%l7 + 0x78]
	edge32l	%i0,	%l6,	%i4
	movl	%xcc,	%i7,	%o4
	alignaddrl	%i6,	%i3,	%l3
	alignaddr	%o0,	%o5,	%o3
	fmuld8sux16	%f16,	%f0,	%f16
	edge16ln	%l1,	%i2,	%g2
	fmovrde	%o2,	%f0,	%f26
	alignaddrl	%o6,	%o1,	%l4
	sir	0x16EC
	andncc	%g4,	%l2,	%l0
	udivx	%i5,	0x0CDA,	%g5
	xnor	%o7,	0x0AC6,	%g3
	movrgz	%g7,	0x0E7,	%g6
	movn	%icc,	%g1,	%l5
	edge32ln	%i1,	%i0,	%i4
	andn	%l6,	%o4,	%i6
	umul	%i7,	0x0561,	%l3
	fmovdle	%icc,	%f25,	%f17
	orn	%o0,	%o5,	%i3
	movre	%o3,	0x2A0,	%i2
	fone	%f22
	udivx	%l1,	0x0E35,	%o2
	add	%g2,	%o1,	%o6
	movn	%xcc,	%g4,	%l2
	fmovrslez	%l4,	%f21,	%f9
	movgu	%icc,	%i5,	%g5
	movpos	%icc,	%o7,	%l0
	edge16n	%g7,	%g3,	%g1
	edge32l	%g6,	%l5,	%i0
	mulscc	%i1,	%l6,	%o4
	fmovdg	%icc,	%f0,	%f15
	fandnot1s	%f24,	%f27,	%f25
	movrlz	%i4,	%i6,	%i7
	fone	%f8
	subc	%l3,	%o5,	%o0
	edge16	%i3,	%i2,	%o3
	smulcc	%o2,	%l1,	%o1
	fsrc2s	%f9,	%f8
	sdiv	%g2,	0x046B,	%g4
	fmovsle	%xcc,	%f7,	%f0
	alignaddr	%l2,	%o6,	%l4
	edge16ln	%g5,	%o7,	%i5
	fmovsge	%icc,	%f10,	%f11
	fmovscc	%icc,	%f4,	%f29
	save %l0, 0x1A03, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%icc,	%f9,	%f17
	edge16l	%g3,	%g1,	%g6
	stb	%i0,	[%l7 + 0x66]
	fmovdvc	%xcc,	%f31,	%f24
	orcc	%i1,	0x1FD8,	%l5
	ldd	[%l7 + 0x70],	%i6
	andn	%i4,	%i6,	%i7
	subccc	%o4,	0x1DC8,	%o5
	movrlz	%o0,	0x2B1,	%l3
	xnor	%i2,	0x1211,	%o3
	movrgz	%o2,	0x349,	%l1
	movpos	%icc,	%o1,	%i3
	fmul8x16al	%f4,	%f19,	%f10
	fmovdneg	%icc,	%f20,	%f18
	movleu	%icc,	%g4,	%l2
	lduw	[%l7 + 0x74],	%g2
	fmovdleu	%icc,	%f0,	%f20
	fmovsle	%icc,	%f1,	%f9
	fmovsne	%xcc,	%f24,	%f1
	addc	%o6,	0x00EA,	%g5
	sdivcc	%o7,	0x1113,	%l4
	fmovdcs	%icc,	%f3,	%f4
	smulcc	%l0,	%i5,	%g7
	fand	%f26,	%f30,	%f0
	sllx	%g1,	0x1E,	%g3
	edge32ln	%g6,	%i0,	%l5
	move	%xcc,	%i1,	%l6
	stw	%i6,	[%l7 + 0x68]
	edge32l	%i4,	%o4,	%i7
	sub	%o0,	%l3,	%o5
	and	%o3,	%i2,	%l1
	movn	%xcc,	%o2,	%i3
	popc	%g4,	%o1
	array8	%l2,	%g2,	%o6
	orcc	%o7,	%g5,	%l0
	edge8	%i5,	%g7,	%l4
	movcs	%icc,	%g1,	%g6
	fxnor	%f16,	%f16,	%f0
	mulscc	%g3,	%i0,	%l5
	andn	%l6,	0x1242,	%i1
	ld	[%l7 + 0x10],	%f29
	ldub	[%l7 + 0x68],	%i6
	movrgez	%o4,	%i7,	%i4
	movleu	%xcc,	%l3,	%o5
	fmovsn	%xcc,	%f14,	%f13
	movrlez	%o3,	0x134,	%o0
	srl	%i2,	0x0F,	%o2
	array32	%i3,	%g4,	%o1
	sth	%l1,	[%l7 + 0x1C]
	fmul8ulx16	%f12,	%f30,	%f26
	sir	0x0F07
	edge8l	%l2,	%g2,	%o7
	ldx	[%l7 + 0x10],	%o6
	and	%g5,	%l0,	%i5
	andncc	%l4,	%g1,	%g6
	srl	%g3,	0x1E,	%g7
	ldx	[%l7 + 0x28],	%l5
	movn	%icc,	%i0,	%l6
	ldd	[%l7 + 0x28],	%i6
	sdivx	%i1,	0x0C30,	%o4
	edge8n	%i7,	%i4,	%o5
	ld	[%l7 + 0x0C],	%f10
	or	%o3,	%l3,	%o0
	ldsb	[%l7 + 0x33],	%o2
	stx	%i2,	[%l7 + 0x28]
	ldsh	[%l7 + 0x22],	%g4
	fpadd16s	%f0,	%f23,	%f26
	alignaddr	%i3,	%o1,	%l2
	edge8ln	%l1,	%o7,	%g2
	ldx	[%l7 + 0x08],	%g5
	lduw	[%l7 + 0x58],	%o6
	xor	%i5,	%l4,	%g1
	srl	%l0,	0x11,	%g3
	edge8l	%g7,	%l5,	%i0
	addcc	%g6,	0x0BE3,	%l6
	st	%f27,	[%l7 + 0x10]
	alignaddrl	%i1,	%o4,	%i7
	sll	%i4,	%o5,	%o3
	movrlz	%i6,	%o0,	%l3
	fnors	%f30,	%f23,	%f2
	movgu	%icc,	%i2,	%g4
	subc	%i3,	%o1,	%o2
	popc	%l2,	%l1
	fpadd16	%f26,	%f20,	%f4
	umulcc	%g2,	%o7,	%o6
	srax	%i5,	0x15,	%l4
	sdivcc	%g1,	0x00DF,	%l0
	mulx	%g3,	0x1220,	%g5
	fmovdl	%icc,	%f23,	%f5
	andcc	%l5,	%g7,	%g6
	mova	%xcc,	%l6,	%i1
	orncc	%o4,	%i0,	%i4
	fnot1	%f8,	%f2
	ldsh	[%l7 + 0x52],	%o5
	fpack16	%f10,	%f8
	fpack16	%f10,	%f2
	fmul8x16	%f6,	%f16,	%f0
	fornot2s	%f28,	%f28,	%f5
	addc	%o3,	0x118B,	%i6
	fcmped	%fcc2,	%f24,	%f14
	xnor	%i7,	0x04B3,	%l3
	edge32n	%i2,	%o0,	%i3
	movne	%icc,	%o1,	%o2
	movleu	%icc,	%g4,	%l1
	array32	%g2,	%l2,	%o7
	movne	%icc,	%i5,	%o6
	sdivcc	%g1,	0x0A0A,	%l4
	srlx	%g3,	%g5,	%l0
	movre	%g7,	0x1AC,	%g6
	sth	%l6,	[%l7 + 0x36]
	movl	%xcc,	%l5,	%o4
	popc	0x0D6D,	%i0
	ldsb	[%l7 + 0x21],	%i1
	movleu	%xcc,	%o5,	%o3
	edge32ln	%i6,	%i7,	%l3
	fxnor	%f6,	%f12,	%f28
	and	%i4,	0x058F,	%i2
	fexpand	%f6,	%f4
	edge16n	%o0,	%i3,	%o1
	fmovsgu	%xcc,	%f1,	%f31
	orn	%o2,	%g4,	%g2
	stb	%l1,	[%l7 + 0x1E]
	ldx	[%l7 + 0x68],	%l2
	edge32n	%o7,	%i5,	%g1
	mova	%xcc,	%o6,	%l4
	sllx	%g5,	0x0D,	%l0
	popc	%g3,	%g7
	stw	%l6,	[%l7 + 0x64]
	fcmpgt32	%f14,	%f14,	%l5
	fandnot2	%f4,	%f12,	%f30
	alignaddrl	%o4,	%i0,	%g6
	ldd	[%l7 + 0x50],	%i0
	addccc	%o3,	0x1FF1,	%o5
	sethi	0x1332,	%i6
	movrgez	%i7,	%i4,	%l3
	ldub	[%l7 + 0x17],	%o0
	fnors	%f1,	%f14,	%f10
	st	%f6,	[%l7 + 0x40]
	xor	%i3,	%i2,	%o2
	xorcc	%o1,	0x142F,	%g4
	lduw	[%l7 + 0x74],	%g2
	fmovrslez	%l2,	%f26,	%f10
	sll	%o7,	%i5,	%l1
	fmovd	%f20,	%f2
	xor	%o6,	0x11EF,	%g1
	sdiv	%l4,	0x1DC3,	%l0
	fmul8x16al	%f11,	%f27,	%f22
	andn	%g3,	%g5,	%g7
	andn	%l6,	%o4,	%i0
	fxors	%f27,	%f3,	%f5
	ldub	[%l7 + 0x5D],	%l5
	fmovsleu	%xcc,	%f22,	%f16
	movne	%icc,	%i1,	%o3
	fcmpne16	%f28,	%f14,	%g6
	fmovscc	%icc,	%f9,	%f1
	edge16	%i6,	%i7,	%i4
	fmuld8sux16	%f30,	%f22,	%f30
	sra	%o5,	%l3,	%o0
	ld	[%l7 + 0x64],	%f15
	edge8l	%i2,	%i3,	%o1
	ld	[%l7 + 0x60],	%f5
	movpos	%xcc,	%o2,	%g2
	srl	%g4,	%o7,	%l2
	fpsub16s	%f29,	%f22,	%f24
	orcc	%l1,	%o6,	%g1
	orn	%l4,	0x1FEC,	%l0
	fmovde	%xcc,	%f5,	%f16
	array32	%i5,	%g5,	%g3
	fmovrdlz	%l6,	%f10,	%f6
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%o4
	popc	%g7,	%i0
	movn	%icc,	%l5,	%o3
	xorcc	%g6,	0x01E1,	%i6
	ld	[%l7 + 0x2C],	%f6
	movrlz	%i1,	%i7,	%o5
	fpadd32s	%f6,	%f10,	%f24
	orn	%i4,	%l3,	%o0
	sdivcc	%i2,	0x1582,	%o1
	std	%f22,	[%l7 + 0x30]
	addcc	%i3,	0x1B5C,	%o2
	move	%xcc,	%g4,	%g2
	edge8l	%o7,	%l2,	%l1
	fandnot1s	%f29,	%f1,	%f0
	alignaddr	%g1,	%l4,	%l0
	movcs	%icc,	%o6,	%g5
	fcmpgt32	%f28,	%f26,	%g3
	fandnot1	%f20,	%f10,	%f2
	orncc	%l6,	0x1F4F,	%i5
	movge	%xcc,	%g7,	%i0
	movpos	%xcc,	%l5,	%o4
	lduw	[%l7 + 0x44],	%g6
	edge32n	%i6,	%i1,	%i7
	andncc	%o5,	%o3,	%i4
	umul	%l3,	%o0,	%o1
	movrgez	%i2,	%o2,	%g4
	move	%icc,	%i3,	%g2
	edge8n	%o7,	%l1,	%l2
	movcs	%xcc,	%g1,	%l4
	alignaddrl	%o6,	%l0,	%g5
	mulx	%g3,	0x078B,	%l6
	sethi	0x048B,	%i5
	fcmpeq32	%f16,	%f10,	%i0
	xor	%g7,	%o4,	%l5
	smul	%i6,	0x0379,	%i1
	sth	%i7,	[%l7 + 0x0E]
	ldd	[%l7 + 0x70],	%f6
	fxor	%f0,	%f28,	%f8
	xnorcc	%g6,	%o5,	%i4
	xorcc	%o3,	%o0,	%l3
	fxor	%f12,	%f18,	%f2
	sdivcc	%o1,	0x11FD,	%i2
	ldsw	[%l7 + 0x20],	%o2
	edge16l	%i3,	%g4,	%o7
	fpadd16	%f22,	%f4,	%f12
	nop
	set	0x08, %g2
	stb	%g2,	[%l7 + %g2]
	udivx	%l1,	0x0B45,	%l2
	movrlez	%l4,	%o6,	%l0
	lduh	[%l7 + 0x30],	%g5
	orn	%g1,	0x1B0B,	%l6
	movvs	%xcc,	%i5,	%i0
	edge8n	%g7,	%o4,	%g3
	xorcc	%l5,	0x06F0,	%i1
	stx	%i6,	[%l7 + 0x78]
	edge8l	%g6,	%o5,	%i4
	array8	%i7,	%o0,	%o3
	movpos	%icc,	%l3,	%i2
	movgu	%icc,	%o1,	%o2
	xnor	%i3,	%o7,	%g4
	sth	%g2,	[%l7 + 0x76]
	st	%f12,	[%l7 + 0x58]
	st	%f13,	[%l7 + 0x40]
	fxors	%f0,	%f8,	%f23
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	ldx	[%l7 + 0x18],	%l2
	addc	%o6,	%g5,	%l0
	sth	%g1,	[%l7 + 0x62]
	movneg	%xcc,	%i5,	%l6
	andcc	%g7,	0x1B62,	%i0
	movre	%o4,	%l5,	%i1
	fxnors	%f23,	%f13,	%f16
	orncc	%i6,	%g6,	%g3
	srl	%o5,	%i7,	%i4
	sll	%o3,	0x17,	%l3
	edge32n	%i2,	%o0,	%o1
	movre	%i3,	0x28A,	%o7
	movrgez	%g4,	0x016,	%o2
	fnot2s	%f23,	%f6
	andncc	%g2,	%l1,	%l2
	fmovsgu	%xcc,	%f11,	%f18
	fmovdvs	%xcc,	%f21,	%f5
	alignaddrl	%o6,	%l4,	%l0
	sra	%g1,	%g5,	%l6
	mulx	%g7,	%i5,	%i0
	xnorcc	%o4,	%l5,	%i6
	srax	%g6,	%g3,	%o5
	sra	%i7,	%i1,	%i4
	fmovdl	%xcc,	%f2,	%f0
	movvs	%xcc,	%o3,	%l3
	movre	%i2,	%o0,	%i3
	srl	%o1,	0x13,	%o7
	fsrc2s	%f10,	%f8
	sdiv	%o2,	0x0B19,	%g4
	movgu	%icc,	%l1,	%g2
	fand	%f4,	%f2,	%f18
	stx	%l2,	[%l7 + 0x38]
	fnegs	%f22,	%f20
	udivx	%o6,	0x0AE6,	%l4
	popc	%g1,	%l0
	siam	0x3
	edge16	%l6,	%g5,	%g7
	udivx	%i5,	0x067C,	%i0
	ldub	[%l7 + 0x6B],	%l5
	fpadd16	%f22,	%f28,	%f6
	edge8ln	%i6,	%g6,	%o4
	std	%f8,	[%l7 + 0x58]
	movrgez	%g3,	%i7,	%i1
	fnot1	%f26,	%f12
	mulx	%o5,	%i4,	%l3
	ldd	[%l7 + 0x58],	%f0
	sra	%i2,	0x1B,	%o3
	edge8	%i3,	%o1,	%o0
	smulcc	%o2,	%g4,	%o7
	and	%g2,	%l2,	%l1
	fmul8x16au	%f24,	%f22,	%f18
	fmuld8sux16	%f25,	%f28,	%f14
	movrlez	%o6,	%l4,	%g1
	edge16ln	%l6,	%l0,	%g5
	movrlez	%i5,	%g7,	%i0
	sdiv	%i6,	0x1E89,	%g6
	edge8l	%o4,	%g3,	%i7
	save %l5, 0x06F5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f19,	%f27
	movre	%i4,	%l3,	%i2
	sdivx	%o3,	0x1008,	%i3
	addccc	%o1,	%o5,	%o2
	fpsub16	%f20,	%f14,	%f18
	movl	%icc,	%o0,	%g4
	alignaddr	%g2,	%l2,	%l1
	fandnot1s	%f12,	%f17,	%f10
	umul	%o6,	%l4,	%g1
	fnot1	%f30,	%f28
	movvs	%icc,	%l6,	%l0
	andncc	%o7,	%i5,	%g7
	fcmpne32	%f28,	%f30,	%i0
	movvc	%icc,	%g5,	%i6
	stx	%o4,	[%l7 + 0x78]
	st	%f21,	[%l7 + 0x3C]
	edge16	%g3,	%g6,	%l5
	movrlez	%i7,	0x014,	%i4
	alignaddrl	%l3,	%i1,	%i2
	fmovdgu	%icc,	%f13,	%f17
	udivx	%i3,	0x1799,	%o1
	fands	%f31,	%f28,	%f29
	subccc	%o3,	%o5,	%o2
	fcmpne16	%f0,	%f28,	%o0
	sra	%g2,	0x06,	%g4
	movvs	%icc,	%l1,	%l2
	fmovdle	%xcc,	%f18,	%f3
	movcs	%icc,	%o6,	%l4
	alignaddr	%l6,	%g1,	%l0
	edge16n	%i5,	%g7,	%o7
	sdivcc	%i0,	0x199D,	%g5
	movvs	%xcc,	%i6,	%g3
	orncc	%o4,	%g6,	%i7
	movrlz	%l5,	0x0D5,	%i4
	umulcc	%i1,	0x1E89,	%i2
	edge16	%l3,	%i3,	%o3
	sllx	%o5,	0x1E,	%o1
	fpadd16s	%f31,	%f31,	%f31
	stb	%o0,	[%l7 + 0x61]
	sdiv	%o2,	0x0A93,	%g2
	movvs	%xcc,	%l1,	%g4
	st	%f21,	[%l7 + 0x34]
	movcs	%icc,	%o6,	%l4
	addccc	%l6,	%g1,	%l2
	movvs	%xcc,	%l0,	%g7
	movrgez	%o7,	%i0,	%g5
	umul	%i6,	%i5,	%o4
	orncc	%g6,	%g3,	%i7
	sethi	0x07F7,	%i4
	ldub	[%l7 + 0x0E],	%l5
	fsrc1s	%f28,	%f29
	srax	%i2,	0x1E,	%l3
	mulx	%i1,	%o3,	%o5
	movrlz	%o1,	0x1CE,	%i3
	movpos	%xcc,	%o0,	%o2
	ldsb	[%l7 + 0x26],	%g2
	fcmpgt16	%f28,	%f6,	%l1
	fpadd32s	%f13,	%f22,	%f23
	ldsh	[%l7 + 0x54],	%g4
	udiv	%l4,	0x1D81,	%o6
	ldsw	[%l7 + 0x18],	%g1
	fcmple32	%f24,	%f4,	%l6
	sllx	%l2,	%g7,	%o7
	fmovrdgz	%l0,	%f2,	%f8
	fpsub16s	%f18,	%f27,	%f2
	edge32	%i0,	%g5,	%i6
	sra	%i5,	%o4,	%g6
	srlx	%i7,	0x0B,	%g3
	movvc	%icc,	%l5,	%i2
	ldd	[%l7 + 0x30],	%f4
	addccc	%l3,	%i4,	%i1
	udivcc	%o5,	0x1C46,	%o3
	ldub	[%l7 + 0x27],	%i3
	fabsd	%f6,	%f22
	array16	%o0,	%o1,	%o2
	sdivx	%l1,	0x1256,	%g4
	move	%icc,	%g2,	%o6
	addccc	%g1,	%l4,	%l6
	ldd	[%l7 + 0x78],	%f10
	umul	%l2,	%o7,	%l0
	stw	%g7,	[%l7 + 0x28]
	and	%g5,	%i6,	%i5
	xnor	%o4,	0x0BD7,	%i0
	smulcc	%i7,	0x0FE5,	%g6
	sdivx	%g3,	0x0FE1,	%l5
	edge32ln	%i2,	%l3,	%i1
	fmovrde	%i4,	%f26,	%f2
	edge16	%o5,	%i3,	%o0
	fmovsg	%icc,	%f0,	%f9
	fmovdneg	%icc,	%f21,	%f24
	umulcc	%o3,	0x0AF4,	%o1
	ldsw	[%l7 + 0x28],	%o2
	edge16ln	%g4,	%l1,	%o6
	xor	%g1,	0x1B1C,	%l4
	umul	%l6,	0x1D2A,	%l2
	edge32n	%o7,	%g2,	%l0
	xorcc	%g7,	%i6,	%g5
	sub	%o4,	0x09A9,	%i5
	udiv	%i7,	0x1453,	%i0
	movrgz	%g6,	%g3,	%l5
	umul	%i2,	0x08B8,	%i1
	fmovrdgz	%l3,	%f18,	%f18
	andncc	%o5,	%i4,	%i3
	movrne	%o0,	%o1,	%o3
	array8	%o2,	%l1,	%o6
	stx	%g4,	[%l7 + 0x68]
	sdivcc	%l4,	0x1A6C,	%g1
	fmovdpos	%icc,	%f24,	%f6
	umulcc	%l6,	0x16AF,	%l2
	fornot1	%f18,	%f16,	%f4
	addccc	%o7,	0x1B27,	%g2
	movgu	%icc,	%l0,	%i6
	fones	%f25
	sll	%g7,	%o4,	%g5
	fnor	%f20,	%f16,	%f22
	movrgez	%i5,	%i0,	%g6
	andn	%i7,	0x1DBC,	%l5
	ldd	[%l7 + 0x40],	%i2
	array8	%g3,	%i1,	%o5
	stw	%l3,	[%l7 + 0x74]
	sdivx	%i3,	0x07F3,	%i4
	edge32l	%o0,	%o1,	%o2
	and	%o3,	%l1,	%o6
	array16	%g4,	%g1,	%l4
	fmovscc	%xcc,	%f20,	%f16
	fmovrdlez	%l6,	%f6,	%f28
	orcc	%o7,	%g2,	%l2
	add	%i6,	0x02EA,	%g7
	array16	%l0,	%o4,	%i5
	srax	%g5,	0x1A,	%g6
	fmovrdgez	%i7,	%f0,	%f6
	fmovsvs	%xcc,	%f25,	%f11
	fmovdle	%icc,	%f2,	%f15
	fpadd16s	%f14,	%f4,	%f3
	umul	%l5,	0x157A,	%i2
	and	%i0,	%g3,	%i1
	fandnot2s	%f21,	%f18,	%f12
	srl	%o5,	%i3,	%l3
	movrne	%o0,	%o1,	%i4
	fnot1s	%f18,	%f21
	sub	%o2,	0x165F,	%l1
	fandnot2	%f14,	%f14,	%f4
	movvs	%xcc,	%o3,	%g4
	restore %g1, 0x1446, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l6,	0x1865,	%l4
	fmovspos	%icc,	%f7,	%f19
	stx	%g2,	[%l7 + 0x50]
	for	%f18,	%f30,	%f14
	subcc	%l2,	%i6,	%g7
	srl	%o7,	%o4,	%l0
	fmovscs	%xcc,	%f13,	%f29
	sethi	0x100D,	%i5
	nop
	set	0x64, %g4
	lduh	[%l7 + %g4],	%g5
	andcc	%g6,	0x0430,	%l5
	fmul8sux16	%f30,	%f10,	%f6
	movre	%i2,	0x112,	%i7
	mova	%icc,	%i0,	%g3
	ld	[%l7 + 0x74],	%f14
	xorcc	%i1,	0x0FCC,	%i3
	movrgez	%l3,	%o0,	%o5
	array16	%i4,	%o2,	%l1
	edge32	%o3,	%o1,	%g4
	edge16l	%o6,	%l6,	%l4
	ldub	[%l7 + 0x44],	%g1
	movrgz	%g2,	%i6,	%l2
	add	%g7,	%o7,	%l0
	movcs	%xcc,	%o4,	%i5
	edge8l	%g5,	%l5,	%i2
	srlx	%g6,	0x11,	%i7
	movpos	%icc,	%i0,	%g3
	ldx	[%l7 + 0x60],	%i3
	movleu	%xcc,	%i1,	%o0
	sethi	0x072C,	%l3
	or	%i4,	%o2,	%o5
	edge32ln	%l1,	%o3,	%o1
	fmovscc	%icc,	%f8,	%f9
	mova	%xcc,	%g4,	%l6
	orn	%l4,	%o6,	%g2
	fcmpes	%fcc0,	%f5,	%f3
	sdiv	%i6,	0x1E83,	%g1
	orncc	%g7,	0x05B7,	%l2
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	sdiv	%g5,	0x1F08,	%i5
	udivx	%l5,	0x0C96,	%i2
	fpackfix	%f24,	%f9
	subc	%i7,	%g6,	%g3
	movre	%i3,	%i0,	%i1
	alignaddrl	%l3,	%o0,	%o2
	fcmpeq16	%f12,	%f8,	%i4
	ldsw	[%l7 + 0x2C],	%o5
	fmovrsgez	%o3,	%f25,	%f2
	restore %l1, %o1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l6,	%l4,	%o6
	save %g2, 0x156A, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g7,	[%l7 + 0x79]
	fmovsvc	%icc,	%f9,	%f24
	sdivx	%l2,	0x15B6,	%o7
	movpos	%icc,	%i6,	%l0
	movle	%icc,	%o4,	%i5
	or	%l5,	0x01D8,	%g5
	fornot2	%f28,	%f22,	%f8
	fcmpne32	%f14,	%f4,	%i7
	or	%g6,	%i2,	%g3
	fnegd	%f4,	%f22
	ld	[%l7 + 0x70],	%f30
	fpadd32s	%f22,	%f26,	%f2
	fsrc2s	%f13,	%f19
	xorcc	%i0,	0x073E,	%i3
	array8	%i1,	%l3,	%o2
	fmovrdgz	%o0,	%f8,	%f2
	fnegd	%f14,	%f2
	fcmpgt32	%f28,	%f22,	%o5
	popc	%i4,	%l1
	edge32l	%o3,	%g4,	%o1
	smulcc	%l6,	0x082A,	%o6
	fnands	%f20,	%f12,	%f0
	sdiv	%g2,	0x0A33,	%g1
	edge16ln	%g7,	%l2,	%l4
	sdivcc	%o7,	0x1C5D,	%i6
	movn	%xcc,	%o4,	%i5
	popc	0x1FC2,	%l5
	array8	%l0,	%g5,	%i7
	fmovsvc	%icc,	%f31,	%f8
	movneg	%icc,	%i2,	%g3
	orcc	%g6,	%i0,	%i3
	or	%i1,	%o2,	%o0
	fcmpeq32	%f20,	%f0,	%o5
	edge32ln	%l3,	%l1,	%i4
	sdivx	%g4,	0x0507,	%o3
	edge8	%o1,	%o6,	%l6
	array8	%g2,	%g7,	%l2
	umulcc	%g1,	0x090B,	%o7
	movg	%icc,	%i6,	%o4
	andcc	%l4,	%i5,	%l0
	udivx	%g5,	0x1DBF,	%l5
	sdiv	%i2,	0x07F2,	%i7
	edge16	%g3,	%g6,	%i0
	movg	%icc,	%i1,	%i3
	edge32n	%o0,	%o5,	%o2
	alignaddrl	%l1,	%i4,	%l3
	fnot2	%f2,	%f28
	fmovrdgez	%o3,	%f18,	%f6
	ldd	[%l7 + 0x50],	%f6
	std	%f6,	[%l7 + 0x60]
	fmul8sux16	%f16,	%f22,	%f10
	fandnot2	%f2,	%f28,	%f28
	movle	%icc,	%g4,	%o6
	or	%o1,	0x1ADA,	%l6
	edge16ln	%g7,	%g2,	%g1
	edge32ln	%o7,	%l2,	%o4
	fornot2	%f8,	%f26,	%f24
	subcc	%i6,	0x1C91,	%l4
	movvc	%icc,	%l0,	%g5
	addccc	%i5,	0x0B3D,	%i2
	movgu	%icc,	%i7,	%l5
	fpadd16s	%f18,	%f10,	%f30
	ldub	[%l7 + 0x5F],	%g6
	udivcc	%i0,	0x1812,	%g3
	movrgz	%i1,	%i3,	%o5
	subcc	%o2,	0x098D,	%o0
	edge32ln	%i4,	%l3,	%l1
	ldx	[%l7 + 0x30],	%o3
	movne	%icc,	%o6,	%o1
	lduh	[%l7 + 0x36],	%g4
	fmovsne	%xcc,	%f20,	%f31
	sub	%l6,	0x08D1,	%g7
	stb	%g1,	[%l7 + 0x7B]
	fpsub32	%f2,	%f6,	%f30
	edge32ln	%o7,	%g2,	%l2
	edge32n	%i6,	%o4,	%l0
	fmovdcs	%icc,	%f29,	%f22
	fmovd	%f26,	%f0
	sdivx	%g5,	0x1A5C,	%l4
	movge	%xcc,	%i5,	%i7
	movne	%xcc,	%l5,	%i2
	smulcc	%g6,	0x0BF0,	%i0
	movle	%icc,	%i1,	%g3
	nop
	set	0x76, %i5
	lduh	[%l7 + %i5],	%i3
	array32	%o2,	%o5,	%o0
	alignaddrl	%l3,	%i4,	%o3
	fmovsvs	%xcc,	%f27,	%f9
	umul	%o6,	0x031F,	%l1
	orcc	%o1,	%g4,	%g7
	udivx	%l6,	0x0C22,	%o7
	movcs	%xcc,	%g1,	%l2
	edge8	%g2,	%o4,	%i6
	umul	%g5,	%l0,	%l4
	edge8	%i5,	%l5,	%i2
	xnorcc	%g6,	%i7,	%i1
	movrne	%g3,	0x2B8,	%i3
	bshuffle	%f18,	%f14,	%f16
	fmovdcc	%icc,	%f30,	%f2
	orncc	%i0,	%o2,	%o5
	movn	%icc,	%o0,	%l3
	srl	%i4,	%o3,	%o6
	orncc	%l1,	%o1,	%g4
	xnor	%l6,	%g7,	%g1
	stx	%l2,	[%l7 + 0x70]
	movcc	%icc,	%o7,	%o4
	edge16n	%i6,	%g5,	%l0
	fmovrslz	%l4,	%f22,	%f18
	alignaddr	%i5,	%g2,	%i2
	edge16l	%l5,	%g6,	%i7
	movrgz	%g3,	%i1,	%i3
	orncc	%o2,	%i0,	%o5
	sdivcc	%o0,	0x0BD8,	%l3
	srax	%o3,	%o6,	%i4
	movge	%icc,	%l1,	%o1
	fabss	%f6,	%f13
	std	%f2,	[%l7 + 0x10]
	ldd	[%l7 + 0x40],	%g4
	save %l6, %g1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o7,	%l2,	%i6
	movg	%xcc,	%g5,	%l0
	fmovde	%icc,	%f5,	%f1
	fmovrslz	%o4,	%f10,	%f22
	sth	%i5,	[%l7 + 0x0C]
	udiv	%g2,	0x12AE,	%l4
	edge8	%l5,	%i2,	%g6
	fpadd16s	%f2,	%f23,	%f0
	mova	%icc,	%g3,	%i1
	fone	%f18
	fmovrdgez	%i3,	%f16,	%f2
	fnot2	%f14,	%f28
	udivx	%o2,	0x1EBF,	%i0
	andn	%o5,	0x187B,	%o0
	edge8n	%i7,	%o3,	%o6
	edge32ln	%i4,	%l1,	%l3
	andncc	%g4,	%o1,	%g1
	alignaddrl	%l6,	%o7,	%l2
	udivcc	%i6,	0x050E,	%g5
	orn	%l0,	0x0317,	%g7
	fzeros	%f1
	ldd	[%l7 + 0x18],	%f18
	edge16	%o4,	%g2,	%i5
	fornot2s	%f23,	%f0,	%f29
	xnor	%l5,	0x1601,	%l4
	sethi	0x071D,	%g6
	edge8	%i2,	%i1,	%i3
	subccc	%o2,	0x1D18,	%i0
	edge32l	%g3,	%o5,	%o0
	ldd	[%l7 + 0x40],	%f0
	ld	[%l7 + 0x3C],	%f27
	fpadd16	%f10,	%f24,	%f6
	addccc	%i7,	%o3,	%i4
	movle	%icc,	%o6,	%l1
	fmovdvs	%xcc,	%f31,	%f9
	movn	%xcc,	%l3,	%g4
	udiv	%g1,	0x1247,	%l6
	sdivcc	%o1,	0x0C8A,	%l2
	edge8l	%o7,	%g5,	%i6
	sllx	%g7,	%l0,	%o4
	fmovdgu	%icc,	%f2,	%f18
	lduh	[%l7 + 0x60],	%g2
	stw	%l5,	[%l7 + 0x40]
	alignaddr	%i5,	%l4,	%g6
	nop
	set	0x78, %g1
	lduw	[%l7 + %g1],	%i2
	edge32l	%i3,	%o2,	%i0
	fcmpd	%fcc3,	%f16,	%f4
	fpadd32	%f30,	%f12,	%f6
	std	%f22,	[%l7 + 0x20]
	movpos	%icc,	%g3,	%o5
	stx	%o0,	[%l7 + 0x70]
	subcc	%i7,	%o3,	%i1
	fand	%f26,	%f20,	%f0
	add	%o6,	0x0FEF,	%i4
	fors	%f28,	%f29,	%f6
	fmul8x16au	%f24,	%f23,	%f26
	fpsub16	%f4,	%f4,	%f8
	fmovdleu	%icc,	%f3,	%f31
	movrlez	%l3,	%g4,	%l1
	movcs	%icc,	%g1,	%o1
	fmovrslz	%l6,	%f17,	%f4
	and	%o7,	0x1E24,	%l2
	nop
	set	0x58, %g6
	lduw	[%l7 + %g6],	%g5
	fpmerge	%f13,	%f30,	%f10
	fpadd32	%f10,	%f28,	%f6
	edge8n	%g7,	%l0,	%o4
	addc	%i6,	%l5,	%g2
	edge32n	%l4,	%g6,	%i2
	movcs	%icc,	%i3,	%i5
	andncc	%o2,	%g3,	%i0
	movrgez	%o0,	%o5,	%i7
	std	%f6,	[%l7 + 0x10]
	ldsb	[%l7 + 0x76],	%o3
	umulcc	%i1,	0x0864,	%o6
	fmuld8ulx16	%f26,	%f27,	%f20
	ldd	[%l7 + 0x40],	%i4
	fmovdcc	%icc,	%f19,	%f0
	std	%f6,	[%l7 + 0x40]
	stw	%g4,	[%l7 + 0x18]
	fmovsa	%icc,	%f10,	%f1
	edge8ln	%l3,	%g1,	%l1
	pdist	%f18,	%f0,	%f16
	movneg	%xcc,	%l6,	%o1
	fmovdcs	%xcc,	%f4,	%f21
	fnors	%f27,	%f4,	%f22
	udiv	%l2,	0x10C7,	%g5
	array32	%g7,	%l0,	%o7
	edge8n	%i6,	%l5,	%g2
	movcc	%icc,	%o4,	%l4
	ldsw	[%l7 + 0x20],	%i2
	sub	%i3,	%i5,	%o2
	fmovrdlz	%g6,	%f8,	%f18
	for	%f28,	%f12,	%f28
	fnot1	%f24,	%f12
	movcc	%icc,	%g3,	%o0
	movrlez	%o5,	0x1C1,	%i7
	fandnot2s	%f5,	%f29,	%f29
	stw	%i0,	[%l7 + 0x30]
	movl	%icc,	%i1,	%o3
	smul	%o6,	%g4,	%l3
	srlx	%i4,	0x1A,	%g1
	popc	%l1,	%o1
	orn	%l2,	0x09D2,	%g5
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%g6
	subcc	%l0,	0x0A58,	%l6
	movvc	%icc,	%i6,	%o7
	movrne	%g2,	%o4,	%l4
	fnot1s	%f12,	%f15
	fmovdgu	%icc,	%f4,	%f6
	udivcc	%i2,	0x1083,	%l5
	lduh	[%l7 + 0x32],	%i5
	udivcc	%i3,	0x0D03,	%o2
	movpos	%icc,	%g6,	%o0
	mova	%xcc,	%g3,	%o5
	movre	%i7,	%i0,	%i1
	fmovdleu	%xcc,	%f18,	%f8
	sdivcc	%o3,	0x062B,	%g4
	fcmpeq16	%f0,	%f26,	%o6
	edge16	%l3,	%i4,	%g1
	fnors	%f25,	%f30,	%f20
	edge8ln	%o1,	%l1,	%l2
	movne	%xcc,	%g5,	%l0
	sra	%l6,	%i6,	%o7
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	movgu	%xcc,	%i2,	%l5
	movl	%xcc,	%i5,	%l4
	edge8ln	%i3,	%g6,	%o2
	edge16	%o0,	%o5,	%i7
	orncc	%g3,	%i0,	%i1
	edge16ln	%o3,	%g4,	%l3
	movcs	%xcc,	%o6,	%i4
	movrgz	%g1,	%l1,	%l2
	and	%g5,	0x0A19,	%o1
	andn	%l6,	%l0,	%i6
	movrlez	%o7,	%o4,	%g7
	fmovrsgez	%i2,	%f8,	%f24
	orn	%g2,	%l5,	%l4
	fcmped	%fcc0,	%f18,	%f22
	fcmpgt32	%f20,	%f10,	%i5
	sllx	%g6,	%o2,	%o0
	andncc	%i3,	%o5,	%g3
	movn	%icc,	%i7,	%i1
	fmovsge	%xcc,	%f3,	%f5
	sll	%i0,	0x12,	%o3
	fmovdl	%xcc,	%f14,	%f18
	add	%g4,	%l3,	%i4
	umul	%o6,	0x14A7,	%l1
	ldsw	[%l7 + 0x38],	%l2
	sll	%g1,	0x03,	%o1
	movl	%xcc,	%l6,	%l0
	orn	%g5,	0x0297,	%o7
	fmul8ulx16	%f10,	%f4,	%f14
	srlx	%i6,	%g7,	%i2
	addcc	%o4,	0x090D,	%l5
	ldsb	[%l7 + 0x29],	%l4
	ldx	[%l7 + 0x20],	%i5
	edge32	%g2,	%o2,	%o0
	fcmpne32	%f12,	%f4,	%i3
	ldsw	[%l7 + 0x3C],	%o5
	movne	%xcc,	%g3,	%i7
	save %i1, %i0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x08, %l1
	ldx	[%l7 + %l1],	%g6
	fpadd16	%f8,	%f2,	%f18
	movl	%icc,	%g4,	%i4
	smulcc	%o6,	%l1,	%l3
	stw	%l2,	[%l7 + 0x58]
	edge16	%o1,	%l6,	%l0
	fnegs	%f14,	%f14
	fmovrdgez	%g1,	%f24,	%f26
	srl	%o7,	%g5,	%i6
	stb	%g7,	[%l7 + 0x79]
	movgu	%xcc,	%o4,	%l5
	andcc	%l4,	0x109C,	%i2
	subc	%g2,	0x026C,	%i5
	st	%f22,	[%l7 + 0x28]
	sdivcc	%o0,	0x01D7,	%i3
	subc	%o5,	%o2,	%g3
	lduh	[%l7 + 0x64],	%i7
	subc	%i1,	%i0,	%o3
	ldx	[%l7 + 0x18],	%g6
	umul	%g4,	0x1D67,	%i4
	srl	%o6,	0x0F,	%l1
	edge32ln	%l3,	%l2,	%o1
	smul	%l6,	0x0E5F,	%l0
	sdivx	%o7,	0x0740,	%g1
	stb	%i6,	[%l7 + 0x7D]
	edge32ln	%g5,	%g7,	%o4
	subccc	%l4,	0x1843,	%i2
	fxnor	%f4,	%f6,	%f26
	edge32n	%l5,	%i5,	%o0
	xor	%g2,	%o5,	%o2
	fcmple32	%f0,	%f28,	%i3
	udivx	%i7,	0x0AD0,	%i1
	alignaddr	%i0,	%g3,	%g6
	fandnot1	%f18,	%f18,	%f2
	fabsd	%f10,	%f0
	sllx	%g4,	%i4,	%o3
	edge16l	%l1,	%o6,	%l2
	movge	%icc,	%l3,	%o1
	edge16n	%l6,	%l0,	%g1
	ldsh	[%l7 + 0x5E],	%i6
	orcc	%g5,	0x04F0,	%o7
	movgu	%xcc,	%g7,	%l4
	fmovrslez	%i2,	%f26,	%f11
	stx	%o4,	[%l7 + 0x08]
	sth	%l5,	[%l7 + 0x18]
	fcmple16	%f0,	%f14,	%i5
	nop
	set	0x72, %o1
	ldsh	[%l7 + %o1],	%g2
	udiv	%o5,	0x1332,	%o0
	stw	%i3,	[%l7 + 0x2C]
	orncc	%o2,	0x0DEF,	%i7
	popc	0x1CBC,	%i0
	sdivx	%i1,	0x09E6,	%g3
	edge32ln	%g4,	%i4,	%o3
	sir	0x0E25
	umulcc	%g6,	0x17D8,	%l1
	movle	%icc,	%l2,	%l3
	sdivx	%o6,	0x1389,	%l6
	sdivx	%l0,	0x15CC,	%g1
	fornot2	%f28,	%f20,	%f28
	lduw	[%l7 + 0x18],	%i6
	ldd	[%l7 + 0x18],	%f6
	lduw	[%l7 + 0x40],	%g5
	fmovsg	%xcc,	%f12,	%f18
	fnegs	%f20,	%f13
	fnors	%f29,	%f6,	%f29
	sll	%o1,	0x10,	%g7
	stx	%l4,	[%l7 + 0x48]
	fmovscs	%icc,	%f14,	%f20
	ld	[%l7 + 0x18],	%f5
	edge32n	%o7,	%o4,	%i2
	movcc	%xcc,	%i5,	%l5
	sdiv	%o5,	0x168D,	%g2
	srax	%i3,	0x17,	%o2
	udivcc	%i7,	0x1E7E,	%o0
	andcc	%i1,	0x163A,	%i0
	movl	%xcc,	%g3,	%i4
	movrlez	%o3,	0x027,	%g6
	ldd	[%l7 + 0x40],	%l0
	sllx	%l2,	0x0E,	%g4
	addc	%o6,	%l3,	%l6
	lduw	[%l7 + 0x70],	%g1
	udivx	%i6,	0x1553,	%l0
	fpadd32s	%f8,	%f9,	%f8
	xnor	%o1,	0x185E,	%g5
	srl	%l4,	0x1E,	%o7
	xnor	%o4,	%i2,	%i5
	addccc	%g7,	0x0DF3,	%o5
	subc	%g2,	%i3,	%o2
	movvc	%icc,	%i7,	%l5
	nop
	set	0x20, %i2
	stx	%o0,	[%l7 + %i2]
	edge8	%i0,	%g3,	%i4
	sub	%i1,	0x1CD2,	%o3
	fpackfix	%f0,	%f0
	fpadd32	%f16,	%f26,	%f28
	orn	%l1,	%g6,	%l2
	movrne	%g4,	%l3,	%o6
	edge16ln	%g1,	%l6,	%i6
	edge8ln	%o1,	%g5,	%l0
	fmovrse	%l4,	%f30,	%f18
	udivcc	%o7,	0x006C,	%i2
	ldub	[%l7 + 0x14],	%o4
	fcmpgt16	%f8,	%f10,	%i5
	fmovda	%icc,	%f17,	%f10
	sra	%g7,	0x1E,	%g2
	ld	[%l7 + 0x78],	%f2
	udiv	%o5,	0x1997,	%i3
	smul	%o2,	%l5,	%i7
	sth	%i0,	[%l7 + 0x64]
	fnot2	%f12,	%f6
	fandnot2s	%f17,	%f31,	%f28
	siam	0x2
	fnors	%f23,	%f16,	%f31
	addccc	%o0,	%i4,	%i1
	edge8l	%o3,	%g3,	%g6
	sir	0x084D
	siam	0x7
	movleu	%xcc,	%l1,	%g4
	movcc	%icc,	%l3,	%l2
	fmovda	%icc,	%f19,	%f30
	std	%f14,	[%l7 + 0x68]
	fcmpes	%fcc0,	%f31,	%f0
	srax	%o6,	%g1,	%i6
	fmovsvs	%icc,	%f25,	%f13
	ldsb	[%l7 + 0x5A],	%o1
	movge	%xcc,	%l6,	%l0
	addcc	%l4,	0x04AC,	%g5
	ldsb	[%l7 + 0x45],	%i2
	movrlz	%o7,	0x0FB,	%o4
	sdivx	%g7,	0x13C6,	%g2
	add	%o5,	0x1630,	%i3
	movcc	%xcc,	%i5,	%l5
	mulx	%o2,	0x00FD,	%i7
	save %i0, %i4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o3,	%i1,	%g3
	fcmple16	%f16,	%f14,	%g6
	addc	%g4,	0x1364,	%l3
	stb	%l1,	[%l7 + 0x5E]
	lduh	[%l7 + 0x76],	%o6
	xor	%g1,	0x1BAB,	%l2
	edge32n	%o1,	%l6,	%i6
	movne	%xcc,	%l4,	%l0
	st	%f29,	[%l7 + 0x64]
	fmovspos	%icc,	%f21,	%f11
	ldsh	[%l7 + 0x50],	%g5
	movcc	%icc,	%i2,	%o7
	smul	%g7,	%o4,	%g2
	edge16l	%o5,	%i5,	%i3
	addc	%o2,	%l5,	%i7
	movneg	%icc,	%i0,	%i4
	save %o3, 0x095F, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i1,	%g3,	%g4
	movn	%icc,	%l3,	%l1
	fmovse	%icc,	%f8,	%f19
	fornot2	%f24,	%f22,	%f8
	movneg	%xcc,	%o6,	%g1
	sdiv	%g6,	0x0BAE,	%o1
	fcmpgt16	%f12,	%f10,	%l6
	fmovse	%icc,	%f6,	%f13
	edge32ln	%l2,	%l4,	%l0
	xnorcc	%i6,	%i2,	%g5
	movrgz	%o7,	%o4,	%g2
	edge8	%o5,	%g7,	%i3
	udivx	%i5,	0x0E44,	%o2
	fmovsleu	%xcc,	%f14,	%f25
	fpackfix	%f12,	%f8
	stb	%i7,	[%l7 + 0x69]
	udiv	%i0,	0x0D8B,	%i4
	sdivx	%o3,	0x092F,	%o0
	array32	%i1,	%g3,	%l5
	fmovsg	%icc,	%f7,	%f16
	movneg	%icc,	%g4,	%l3
	fandnot2s	%f20,	%f19,	%f6
	fmovsle	%xcc,	%f19,	%f18
	popc	0x09C1,	%o6
	movrlez	%l1,	0x167,	%g1
	xnorcc	%g6,	0x127E,	%l6
	edge32l	%l2,	%l4,	%o1
	fmovsne	%xcc,	%f26,	%f28
	fcmpes	%fcc0,	%f18,	%f31
	edge8ln	%i6,	%i2,	%g5
	std	%f30,	[%l7 + 0x38]
	ldd	[%l7 + 0x58],	%f18
	ldd	[%l7 + 0x70],	%f12
	fones	%f26
	xor	%o7,	0x1637,	%l0
	fpadd16s	%f6,	%f24,	%f0
	fpadd16s	%f30,	%f17,	%f10
	pdist	%f22,	%f12,	%f28
	stb	%o4,	[%l7 + 0x2B]
	movrlez	%g2,	%o5,	%g7
	ldub	[%l7 + 0x6F],	%i3
	mova	%icc,	%o2,	%i7
	andn	%i5,	%i4,	%i0
	movn	%xcc,	%o0,	%i1
	fornot2s	%f30,	%f25,	%f22
	mova	%icc,	%g3,	%o3
	edge32n	%g4,	%l5,	%o6
	lduh	[%l7 + 0x12],	%l1
	fandnot1s	%f2,	%f1,	%f10
	fornot1	%f22,	%f4,	%f12
	fnegs	%f6,	%f2
	umul	%l3,	%g1,	%l6
	fxnors	%f20,	%f20,	%f6
	srl	%l2,	0x02,	%g6
	fzeros	%f22
	fmovrsgz	%l4,	%f12,	%f23
	movre	%i6,	0x0C3,	%i2
	umul	%g5,	%o1,	%l0
	addccc	%o4,	%g2,	%o7
	sra	%g7,	0x15,	%o5
	fmovsn	%xcc,	%f29,	%f15
	fcmpeq32	%f20,	%f16,	%o2
	fpadd32	%f12,	%f14,	%f8
	edge32	%i3,	%i7,	%i4
	fmovsg	%icc,	%f21,	%f20
	addcc	%i0,	0x16B1,	%o0
	sra	%i5,	%i1,	%g3
	fmuld8ulx16	%f9,	%f25,	%f24
	fmovsgu	%icc,	%f14,	%f0
	sdivcc	%o3,	0x1416,	%g4
	movle	%xcc,	%l5,	%l1
	fandnot1s	%f17,	%f14,	%f0
	fmovsa	%icc,	%f3,	%f15
	fmovrslz	%o6,	%f9,	%f4
	mova	%icc,	%g1,	%l3
	umulcc	%l2,	%g6,	%l4
	fornot2	%f18,	%f4,	%f0
	fmovdleu	%xcc,	%f15,	%f23
	array32	%l6,	%i6,	%i2
	movleu	%xcc,	%g5,	%o1
	edge8n	%l0,	%o4,	%o7
	and	%g2,	0x15C9,	%g7
	fnot1	%f20,	%f26
	restore %o2, %o5, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%i4,	%f22,	%f6
	movn	%xcc,	%i3,	%i0
	umul	%o0,	0x0506,	%i5
	fmovrde	%i1,	%f20,	%f24
	save %o3, %g3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%g4,	%l1
	movrlz	%g1,	%l3,	%l2
	lduh	[%l7 + 0x36],	%g6
	ld	[%l7 + 0x40],	%f30
	fmovde	%icc,	%f6,	%f24
	orncc	%o6,	%l4,	%i6
	edge8l	%i2,	%l6,	%o1
	fcmpeq16	%f16,	%f20,	%g5
	movrne	%l0,	0x270,	%o4
	move	%xcc,	%g2,	%g7
	xorcc	%o7,	%o5,	%o2
	movvs	%xcc,	%i4,	%i7
	fsrc1	%f0,	%f2
	add	%i0,	%i3,	%i5
	popc	0x03F1,	%i1
	ldsw	[%l7 + 0x58],	%o3
	xorcc	%g3,	0x06B0,	%o0
	array32	%g4,	%l5,	%l1
	smul	%g1,	%l3,	%l2
	xnorcc	%g6,	0x1449,	%o6
	fnor	%f20,	%f16,	%f14
	movn	%icc,	%i6,	%i2
	orncc	%l4,	0x1528,	%o1
	fcmpeq32	%f26,	%f26,	%g5
	ldd	[%l7 + 0x10],	%f26
	subc	%l0,	0x1E8C,	%o4
	nop
	set	0x40, %o7
	ldsw	[%l7 + %o7],	%l6
	fmovdpos	%xcc,	%f19,	%f4
	fpadd32	%f12,	%f26,	%f2
	movle	%xcc,	%g2,	%o7
	movleu	%xcc,	%g7,	%o5
	movneg	%icc,	%o2,	%i4
	xorcc	%i7,	0x1709,	%i3
	udivcc	%i0,	0x061F,	%i5
	mulscc	%i1,	%g3,	%o0
	fmovrdlez	%o3,	%f2,	%f0
	movl	%icc,	%l5,	%g4
	ldd	[%l7 + 0x68],	%g0
	fornot1s	%f26,	%f16,	%f3
	fmovdn	%xcc,	%f6,	%f15
	edge16ln	%l1,	%l2,	%g6
	fmovdn	%xcc,	%f18,	%f2
	movrlez	%o6,	0x3E1,	%i6
	edge8ln	%i2,	%l3,	%o1
	orncc	%g5,	0x012F,	%l0
	orncc	%l4,	0x1512,	%o4
	fxor	%f10,	%f0,	%f16
	fmovrsgz	%l6,	%f31,	%f1
	movleu	%xcc,	%o7,	%g7
	addccc	%g2,	%o5,	%o2
	andcc	%i4,	%i3,	%i7
	fnand	%f24,	%f16,	%f14
	fmuld8sux16	%f12,	%f0,	%f8
	fpack16	%f20,	%f26
	umul	%i5,	0x1A7B,	%i1
	orn	%i0,	0x1C59,	%o0
	lduw	[%l7 + 0x78],	%o3
	fmovdneg	%icc,	%f18,	%f30
	sll	%l5,	0x01,	%g4
	and	%g3,	%g1,	%l2
	edge32n	%l1,	%g6,	%i6
	nop
	set	0x74, %i7
	lduh	[%l7 + %i7],	%o6
	stb	%i2,	[%l7 + 0x38]
	xor	%l3,	0x04CA,	%g5
	array16	%l0,	%o1,	%o4
	movneg	%xcc,	%l6,	%l4
	udiv	%g7,	0x1C7F,	%o7
	sdivcc	%o5,	0x0148,	%g2
	edge32	%i4,	%o2,	%i7
	fmovdg	%xcc,	%f21,	%f22
	subc	%i3,	%i5,	%i1
	orcc	%i0,	%o3,	%o0
	mulscc	%l5,	%g4,	%g1
	fmul8sux16	%f0,	%f20,	%f22
	std	%f6,	[%l7 + 0x78]
	xorcc	%g3,	0x027A,	%l1
	smul	%l2,	%i6,	%g6
	pdist	%f16,	%f16,	%f10
	sethi	0x1720,	%o6
	array32	%l3,	%g5,	%l0
	movge	%xcc,	%i2,	%o4
	fmovsgu	%xcc,	%f1,	%f3
	fmul8x16au	%f26,	%f11,	%f28
	edge8n	%o1,	%l6,	%l4
	fcmple16	%f14,	%f18,	%g7
	movrgez	%o7,	0x30E,	%g2
	movne	%xcc,	%i4,	%o2
	stb	%o5,	[%l7 + 0x11]
	fmovdvc	%icc,	%f15,	%f0
	movl	%xcc,	%i7,	%i5
	subc	%i3,	%i1,	%o3
	orn	%i0,	0x0D16,	%l5
	movvs	%icc,	%g4,	%o0
	fandnot2s	%f4,	%f26,	%f18
	fones	%f27
	stw	%g1,	[%l7 + 0x74]
	subc	%g3,	0x1CFC,	%l2
	fmovrsgz	%l1,	%f13,	%f13
	fones	%f7
	array32	%i6,	%g6,	%l3
	sra	%o6,	%g5,	%i2
	fmovdvs	%icc,	%f29,	%f12
	orn	%l0,	%o4,	%l6
	move	%icc,	%o1,	%g7
	fexpand	%f13,	%f6
	ldsb	[%l7 + 0x24],	%o7
	movvc	%xcc,	%g2,	%l4
	movvc	%xcc,	%o2,	%i4
	srlx	%i7,	0x0E,	%o5
	sub	%i5,	%i3,	%i1
	movre	%o3,	0x2D9,	%l5
	fpadd32	%f24,	%f28,	%f10
	stb	%g4,	[%l7 + 0x1F]
	st	%f12,	[%l7 + 0x6C]
	movgu	%xcc,	%o0,	%i0
	udivx	%g1,	0x18C7,	%g3
	array32	%l1,	%l2,	%g6
	umulcc	%i6,	%l3,	%o6
	addcc	%g5,	%i2,	%o4
	fcmps	%fcc0,	%f27,	%f13
	fnegs	%f15,	%f27
	mulx	%l0,	0x1F59,	%o1
	ldsb	[%l7 + 0x7B],	%g7
	edge32l	%o7,	%l6,	%g2
	smulcc	%l4,	%o2,	%i7
	ldsb	[%l7 + 0x46],	%i4
	fmovrslz	%i5,	%f31,	%f16
	fnot1s	%f25,	%f17
	ldsb	[%l7 + 0x2C],	%o5
	std	%f8,	[%l7 + 0x48]
	udivcc	%i3,	0x0DF6,	%i1
	fcmple32	%f0,	%f16,	%o3
	fornot1	%f14,	%f12,	%f6
	ldx	[%l7 + 0x60],	%g4
	sll	%l5,	0x15,	%i0
	addcc	%g1,	0x1CF8,	%o0
	fmovrsne	%g3,	%f1,	%f10
	srlx	%l1,	0x19,	%l2
	movgu	%icc,	%g6,	%l3
	sub	%i6,	%o6,	%i2
	ldx	[%l7 + 0x40],	%g5
	sub	%l0,	%o1,	%g7
	movrlz	%o7,	%l6,	%o4
	xnor	%g2,	0x0EC2,	%l4
	fxors	%f24,	%f4,	%f22
	or	%i7,	0x0C26,	%o2
	srax	%i4,	%i5,	%i3
	subcc	%o5,	%i1,	%o3
	udivx	%l5,	0x08DD,	%g4
	lduw	[%l7 + 0x58],	%i0
	edge32ln	%g1,	%o0,	%l1
	ldsh	[%l7 + 0x70],	%g3
	sth	%l2,	[%l7 + 0x72]
	fsrc2s	%f15,	%f22
	fnot1	%f20,	%f28
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	movl	%icc,	%g6,	%i2
	udiv	%g5,	0x0871,	%o6
	fmul8ulx16	%f12,	%f20,	%f12
	andn	%o1,	%g7,	%l0
	addc	%o7,	0x1C3A,	%l6
	udiv	%o4,	0x019B,	%l4
	orcc	%i7,	%o2,	%i4
	edge16	%g2,	%i5,	%i3
	orcc	%o5,	%i1,	%o3
	andn	%g4,	0x024A,	%l5
	smulcc	%i0,	%o0,	%l1
	movl	%xcc,	%g3,	%l2
	and	%g1,	%l3,	%i6
	edge32l	%i2,	%g6,	%o6
	fors	%f21,	%f19,	%f19
	stw	%g5,	[%l7 + 0x24]
	ldub	[%l7 + 0x16],	%o1
	fmovdcs	%xcc,	%f30,	%f2
	fpmerge	%f24,	%f12,	%f18
	faligndata	%f2,	%f12,	%f0
	movvc	%icc,	%l0,	%g7
	fmovdleu	%xcc,	%f31,	%f9
	xnor	%l6,	0x0487,	%o7
	movrlz	%l4,	0x1CB,	%o4
	subcc	%o2,	%i7,	%g2
	orcc	%i4,	0x1BA0,	%i3
	addcc	%o5,	0x1D5D,	%i1
	restore %o3, %g4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l5,	%i0,	%l1
	alignaddr	%g3,	%o0,	%l2
	movgu	%xcc,	%l3,	%g1
	stb	%i2,	[%l7 + 0x2F]
	array8	%g6,	%o6,	%i6
	movrgez	%o1,	%l0,	%g5
	sth	%l6,	[%l7 + 0x5E]
	andn	%g7,	%l4,	%o4
	ldsh	[%l7 + 0x52],	%o2
	fmovdl	%xcc,	%f23,	%f24
	smulcc	%i7,	0x12E3,	%g2
	xor	%i4,	%o7,	%i3
	fcmps	%fcc3,	%f21,	%f26
	fmovdcs	%xcc,	%f1,	%f24
	fmuld8sux16	%f29,	%f1,	%f2
	movpos	%icc,	%o5,	%i1
	movcc	%icc,	%g4,	%i5
	subc	%o3,	0x161C,	%i0
	orcc	%l5,	0x00D4,	%g3
	fnegd	%f4,	%f0
	alignaddrl	%l1,	%o0,	%l3
	mulx	%g1,	%i2,	%g6
	addcc	%o6,	0x1DC7,	%l2
	ld	[%l7 + 0x58],	%f1
	subcc	%i6,	%o1,	%l0
	xorcc	%l6,	0x18DE,	%g7
	mova	%xcc,	%l4,	%g5
	array16	%o4,	%o2,	%i7
	alignaddrl	%g2,	%i4,	%i3
	sdivx	%o5,	0x195E,	%i1
	umulcc	%g4,	%i5,	%o7
	edge16	%i0,	%o3,	%l5
	movrlez	%g3,	0x3D2,	%l1
	xorcc	%o0,	0x17FD,	%l3
	ldd	[%l7 + 0x38],	%f0
	fmovsneg	%xcc,	%f30,	%f13
	ldx	[%l7 + 0x18],	%g1
	fandnot1s	%f7,	%f4,	%f9
	fsrc1s	%f8,	%f15
	andncc	%i2,	%o6,	%g6
	fornot1	%f4,	%f24,	%f14
	movrlez	%i6,	%l2,	%o1
	fmovscc	%icc,	%f14,	%f0
	fmovdpos	%xcc,	%f31,	%f29
	addccc	%l0,	%l6,	%g7
	addccc	%g5,	0x10D9,	%l4
	sll	%o4,	%i7,	%o2
	fors	%f15,	%f7,	%f10
	movne	%icc,	%g2,	%i3
	movle	%xcc,	%i4,	%i1
	xnor	%g4,	0x151C,	%i5
	edge32n	%o7,	%i0,	%o5
	ldx	[%l7 + 0x18],	%o3
	sethi	0x17DC,	%l5
	smulcc	%g3,	%o0,	%l3
	ldub	[%l7 + 0x29],	%l1
	sllx	%i2,	0x0E,	%g1
	edge32l	%o6,	%i6,	%g6
	ldsh	[%l7 + 0x7E],	%o1
	sra	%l0,	0x1D,	%l6
	edge16l	%l2,	%g7,	%l4
	sir	0x0EBF
	or	%g5,	0x054D,	%i7
	fpadd16s	%f31,	%f23,	%f1
	fandnot1	%f22,	%f0,	%f18
	andcc	%o4,	%g2,	%o2
	mulx	%i3,	0x02CD,	%i4
	addccc	%i1,	%i5,	%o7
	andncc	%i0,	%g4,	%o3
	xnor	%o5,	%l5,	%g3
	fcmpeq16	%f28,	%f12,	%l3
	edge8ln	%l1,	%i2,	%g1
	movpos	%icc,	%o6,	%i6
	movrlz	%o0,	0x04A,	%o1
	array8	%l0,	%g6,	%l2
	edge8ln	%l6,	%g7,	%l4
	srlx	%i7,	%g5,	%g2
	movrlez	%o2,	0x1BB,	%i3
	save %o4, 0x1AF6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i1,	%o7,	%i5
	edge32n	%g4,	%i0,	%o3
	edge8n	%o5,	%g3,	%l5
	bshuffle	%f26,	%f20,	%f26
	fmovdvc	%icc,	%f17,	%f11
	andncc	%l1,	%i2,	%l3
	or	%g1,	0x0EFF,	%o6
	edge8	%o0,	%o1,	%i6
	lduw	[%l7 + 0x70],	%g6
	stw	%l0,	[%l7 + 0x20]
	edge32ln	%l2,	%l6,	%g7
	save %i7, 0x1FC2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g2,	0x166A,	%l4
	fmovdne	%xcc,	%f14,	%f25
	movcs	%icc,	%i3,	%o2
	stb	%o4,	[%l7 + 0x54]
	movrgz	%i1,	%o7,	%i5
	stx	%g4,	[%l7 + 0x70]
	movneg	%xcc,	%i4,	%i0
	fcmple16	%f8,	%f0,	%o3
	movvc	%xcc,	%g3,	%l5
	andncc	%o5,	%l1,	%i2
	addcc	%l3,	0x0FF4,	%g1
	fcmpeq32	%f14,	%f26,	%o6
	stx	%o0,	[%l7 + 0x68]
	addccc	%o1,	%i6,	%g6
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	udiv	%i7,	0x087D,	%g7
	std	%f24,	[%l7 + 0x28]
	umulcc	%g5,	0x05B7,	%l4
	ldsw	[%l7 + 0x38],	%g2
	sth	%i3,	[%l7 + 0x5C]
	srl	%o2,	0x07,	%o4
	mova	%icc,	%i1,	%o7
	movrgez	%i5,	%g4,	%i0
	save %o3, %i4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o5,	%l1,	%i2
	orncc	%g3,	%l3,	%g1
	and	%o0,	%o6,	%i6
	fmovdvs	%icc,	%f17,	%f29
	fpmerge	%f6,	%f19,	%f18
	siam	0x2
	fornot1	%f12,	%f28,	%f8
	st	%f9,	[%l7 + 0x74]
	fnors	%f3,	%f20,	%f10
	alignaddrl	%g6,	%o1,	%l2
	edge8ln	%l6,	%i7,	%g7
	fcmpeq16	%f24,	%f30,	%l0
	sir	0x0AEB
	movvc	%xcc,	%g5,	%g2
	sethi	0x0436,	%l4
	orcc	%o2,	0x04DB,	%o4
	ldd	[%l7 + 0x08],	%f8
	fmovdpos	%xcc,	%f28,	%f6
	orncc	%i1,	0x080C,	%i3
	srlx	%o7,	0x1B,	%g4
	add	%i0,	%o3,	%i5
	movrgz	%l5,	0x2DB,	%o5
	fandnot2	%f2,	%f20,	%f30
	fmovdleu	%icc,	%f21,	%f5
	add	%i4,	0x13AE,	%l1
	fxnors	%f16,	%f20,	%f17
	fcmple32	%f0,	%f24,	%i2
	fmovse	%xcc,	%f25,	%f26
	ldd	[%l7 + 0x28],	%l2
	movg	%xcc,	%g3,	%o0
	edge16	%o6,	%i6,	%g1
	mulx	%g6,	0x1E0F,	%o1
	movg	%xcc,	%l2,	%l6
	fmovsle	%xcc,	%f10,	%f26
	edge32l	%g7,	%l0,	%i7
	edge8n	%g5,	%g2,	%l4
	fnor	%f8,	%f20,	%f2
	sethi	0x0BD5,	%o4
	mova	%xcc,	%i1,	%o2
	edge32	%i3,	%g4,	%i0
	movre	%o7,	%o3,	%l5
	edge16	%i5,	%i4,	%l1
	restore %i2, 0x0BA7, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f7,	%f8
	st	%f26,	[%l7 + 0x18]
	fornot1	%f30,	%f28,	%f8
	edge8	%o5,	%g3,	%o0
	ldub	[%l7 + 0x40],	%i6
	ldub	[%l7 + 0x1E],	%o6
	save %g1, %g6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o1,	%l6,	%l0
	edge32	%g7,	%i7,	%g5
	fnot2	%f14,	%f2
	mova	%xcc,	%l4,	%g2
	subc	%o4,	%i1,	%i3
	fzero	%f26
	udivx	%g4,	0x1953,	%i0
	sdiv	%o2,	0x037B,	%o7
	edge16l	%o3,	%i5,	%l5
	mova	%xcc,	%i4,	%i2
	edge8l	%l3,	%o5,	%l1
	movrlez	%o0,	%g3,	%i6
	andcc	%g1,	0x18A0,	%g6
	movrne	%l2,	0x059,	%o6
	movrlz	%o1,	%l6,	%g7
	fmovdge	%xcc,	%f5,	%f12
	edge16ln	%i7,	%l0,	%g5
	ldsw	[%l7 + 0x20],	%l4
	fmovsn	%icc,	%f3,	%f19
	movrlez	%o4,	0x2D4,	%g2
	srl	%i3,	0x09,	%g4
	std	%f28,	[%l7 + 0x48]
	fmuld8sux16	%f7,	%f16,	%f28
	addc	%i0,	%i1,	%o2
	movrlez	%o7,	0x0E5,	%i5
	addcc	%o3,	%i4,	%i2
	andn	%l3,	%o5,	%l5
	andcc	%l1,	%g3,	%i6
	udivcc	%o0,	0x0122,	%g1
	fmovrdgez	%l2,	%f22,	%f28
	fornot2	%f8,	%f22,	%f6
	array16	%g6,	%o1,	%o6
	edge32l	%g7,	%i7,	%l6
	xor	%g5,	0x19C9,	%l4
	popc	%l0,	%o4
	addccc	%i3,	0x075F,	%g4
	movl	%icc,	%g2,	%i0
	edge16l	%i1,	%o2,	%i5
	fmovdleu	%icc,	%f4,	%f12
	subcc	%o3,	0x07DC,	%i4
	xnorcc	%i2,	0x01D8,	%o7
	sllx	%o5,	%l3,	%l1
	edge8ln	%g3,	%l5,	%i6
	edge8n	%o0,	%l2,	%g6
	orcc	%g1,	0x0103,	%o1
	sir	0x0400
	array8	%g7,	%o6,	%l6
	andcc	%g5,	0x0353,	%i7
	mova	%icc,	%l0,	%o4
	subccc	%i3,	0x01A6,	%g4
	addcc	%g2,	%l4,	%i0
	array16	%o2,	%i1,	%o3
	fmovdg	%icc,	%f3,	%f20
	ldsh	[%l7 + 0x62],	%i4
	std	%f6,	[%l7 + 0x68]
	st	%f4,	[%l7 + 0x08]
	mova	%icc,	%i2,	%i5
	lduh	[%l7 + 0x70],	%o7
	sllx	%o5,	%l1,	%l3
	orn	%g3,	%i6,	%l5
	edge32n	%l2,	%o0,	%g1
	addcc	%g6,	0x008F,	%o1
	smul	%o6,	%l6,	%g5
	ldub	[%l7 + 0x6E],	%g7
	fornot2s	%f7,	%f28,	%f24
	edge32n	%l0,	%i7,	%o4
	movgu	%xcc,	%i3,	%g4
	movneg	%xcc,	%g2,	%l4
	fmovsn	%icc,	%f11,	%f22
	or	%i0,	0x1AE7,	%i1
	movneg	%icc,	%o2,	%o3
	srax	%i2,	0x10,	%i4
	orncc	%o7,	0x0A71,	%i5
	fmovse	%icc,	%f30,	%f11
	edge8l	%o5,	%l3,	%l1
	fandnot2s	%f6,	%f21,	%f19
	edge16l	%g3,	%i6,	%l5
	ldd	[%l7 + 0x50],	%f26
	movg	%icc,	%l2,	%o0
	udivx	%g1,	0x05BA,	%g6
	lduh	[%l7 + 0x44],	%o1
	edge16l	%l6,	%g5,	%g7
	andncc	%o6,	%i7,	%l0
	udiv	%i3,	0x15E1,	%o4
	move	%xcc,	%g4,	%g2
	edge16l	%l4,	%i0,	%o2
	fpackfix	%f6,	%f30
	alignaddr	%o3,	%i1,	%i4
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	fmovde	%xcc,	%f13,	%f16
	edge16n	%o5,	%o7,	%l1
	movge	%xcc,	%l3,	%g3
	addccc	%i6,	%l5,	%l2
	movrlez	%g1,	0x3FA,	%o0
	ldx	[%l7 + 0x18],	%o1
	fornot1s	%f24,	%f5,	%f24
	sdivcc	%g6,	0x0AFD,	%g5
	movl	%icc,	%l6,	%o6
	fornot2	%f30,	%f30,	%f4
	smul	%i7,	0x1C5A,	%g7
	add	%l0,	0x0149,	%i3
	xnor	%g4,	%o4,	%g2
	alignaddrl	%l4,	%o2,	%o3
	array32	%i1,	%i4,	%i0
	addc	%i5,	%i2,	%o7
	move	%xcc,	%l1,	%l3
	edge16n	%g3,	%o5,	%l5
	stw	%l2,	[%l7 + 0x20]
	sethi	0x0C0C,	%i6
	movl	%xcc,	%g1,	%o0
	fmovsn	%icc,	%f4,	%f29
	for	%f4,	%f26,	%f12
	fmovrdlz	%g6,	%f2,	%f20
	lduw	[%l7 + 0x10],	%o1
	xnorcc	%g5,	0x1931,	%o6
	fnand	%f18,	%f22,	%f26
	mova	%icc,	%l6,	%g7
	array16	%l0,	%i3,	%g4
	mulscc	%o4,	0x0F24,	%i7
	srax	%l4,	0x02,	%g2
	fpsub32	%f4,	%f4,	%f2
	movrgz	%o2,	%o3,	%i4
	movcs	%icc,	%i0,	%i1
	movrgez	%i2,	%o7,	%l1
	fnot1s	%f23,	%f13
	lduh	[%l7 + 0x28],	%i5
	fmovsleu	%icc,	%f4,	%f17
	movpos	%xcc,	%g3,	%l3
	movg	%icc,	%o5,	%l5
	lduw	[%l7 + 0x30],	%l2
	movge	%xcc,	%g1,	%i6
	std	%f20,	[%l7 + 0x18]
	mova	%xcc,	%g6,	%o1
	addcc	%o0,	%g5,	%l6
	fnands	%f3,	%f29,	%f15
	st	%f2,	[%l7 + 0x38]
	edge16	%o6,	%l0,	%i3
	ldx	[%l7 + 0x68],	%g7
	movrne	%o4,	%i7,	%g4
	fandnot2s	%f24,	%f23,	%f25
	movrgez	%l4,	%o2,	%g2
	nop
	set	0x7E, %l2
	lduh	[%l7 + %l2],	%o3
	movrlez	%i0,	%i1,	%i4
	umul	%i2,	0x0979,	%l1
	fmul8x16	%f8,	%f4,	%f24
	ldsb	[%l7 + 0x50],	%i5
	stb	%o7,	[%l7 + 0x70]
	nop
	set	0x50, %g7
	ldx	[%l7 + %g7],	%l3
	udiv	%o5,	0x119B,	%g3
	lduw	[%l7 + 0x60],	%l2
	sra	%g1,	0x16,	%l5
	ld	[%l7 + 0x54],	%f6
	move	%xcc,	%g6,	%o1
	fxors	%f22,	%f12,	%f14
	fmovda	%xcc,	%f27,	%f31
	edge32	%i6,	%g5,	%l6
	mulx	%o6,	0x03B6,	%o0
	move	%xcc,	%l0,	%g7
	umul	%i3,	0x08A0,	%o4
	srl	%g4,	%l4,	%o2
	fmovsgu	%xcc,	%f13,	%f8
	movgu	%xcc,	%i7,	%o3
	edge16	%i0,	%g2,	%i1
	edge8n	%i4,	%l1,	%i5
	lduh	[%l7 + 0x42],	%i2
	sir	0x03AC
	movl	%icc,	%o7,	%l3
	xor	%g3,	0x1C69,	%l2
	movvs	%xcc,	%g1,	%o5
	sth	%g6,	[%l7 + 0x6E]
	sll	%l5,	0x1E,	%i6
	andncc	%o1,	%l6,	%o6
	fmovdleu	%xcc,	%f6,	%f15
	movrgez	%g5,	%o0,	%l0
	fmovdgu	%xcc,	%f21,	%f15
	fmovrde	%g7,	%f30,	%f16
	popc	%i3,	%o4
	movrgez	%l4,	0x355,	%o2
	srl	%i7,	0x05,	%o3
	ldsb	[%l7 + 0x38],	%i0
	movrgz	%g4,	%g2,	%i1
	srlx	%i4,	0x01,	%l1
	xnorcc	%i2,	0x0C65,	%i5
	stw	%l3,	[%l7 + 0x38]
	mova	%xcc,	%o7,	%l2
	umul	%g1,	%g3,	%g6
	xorcc	%o5,	0x11FE,	%l5
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%i6
	edge8ln	%o1,	%l6,	%g5
	array8	%o0,	%l0,	%g7
	orncc	%i3,	%o6,	%l4
	movneg	%xcc,	%o2,	%i7
	srlx	%o3,	0x17,	%i0
	ldub	[%l7 + 0x5D],	%o4
	movrlz	%g2,	%g4,	%i4
	save %l1, 0x1F59, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i5,	0x0C58,	%l3
	alignaddrl	%o7,	%i1,	%l2
	edge16ln	%g1,	%g6,	%o5
	movpos	%xcc,	%g3,	%l5
	fabss	%f29,	%f14
	srax	%i6,	0x0A,	%l6
	fpsub16	%f10,	%f18,	%f2
	stb	%g5,	[%l7 + 0x64]
	movrne	%o0,	%o1,	%g7
	xnor	%l0,	%i3,	%o6
	array8	%o2,	%i7,	%o3
	edge16n	%l4,	%o4,	%i0
	fcmpeq16	%f26,	%f24,	%g2
	lduh	[%l7 + 0x50],	%i4
	fxnor	%f30,	%f24,	%f12
	umul	%g4,	%l1,	%i2
	edge8n	%l3,	%o7,	%i5
	subccc	%i1,	%g1,	%l2
	or	%o5,	%g6,	%g3
	ldd	[%l7 + 0x40],	%f10
	smulcc	%l5,	%i6,	%g5
	sdiv	%o0,	0x0C7F,	%o1
	addccc	%l6,	0x0BE8,	%l0
	mova	%xcc,	%i3,	%o6
	umul	%o2,	%i7,	%g7
	fcmpne16	%f12,	%f12,	%l4
	sir	0x0588
	nop
	set	0x6A, %i3
	ldsh	[%l7 + %i3],	%o4
	addccc	%i0,	0x0C54,	%g2
	edge32n	%o3,	%g4,	%l1
	orncc	%i2,	0x1BCE,	%l3
	fmovsne	%icc,	%f26,	%f1
	addccc	%o7,	0x1549,	%i4
	fmovsvc	%icc,	%f31,	%f7
	orn	%i1,	%g1,	%i5
	alignaddr	%l2,	%o5,	%g6
	fabsd	%f16,	%f22
	fmuld8ulx16	%f18,	%f3,	%f14
	movvc	%xcc,	%l5,	%i6
	edge8	%g3,	%o0,	%g5
	smulcc	%o1,	%l0,	%l6
	sllx	%o6,	0x0A,	%i3
	fmovrslz	%i7,	%f20,	%f28
	ldd	[%l7 + 0x50],	%g6
	array8	%o2,	%o4,	%l4
	fmovdn	%xcc,	%f5,	%f20
	edge16	%g2,	%o3,	%i0
	addc	%l1,	0x1DEB,	%g4
	fsrc2s	%f9,	%f22
	sub	%l3,	%i2,	%i4
	alignaddr	%o7,	%g1,	%i1
	edge8	%l2,	%i5,	%o5
	move	%xcc,	%g6,	%l5
	fcmpne32	%f18,	%f10,	%g3
	edge8l	%i6,	%o0,	%o1
	subccc	%l0,	0x12D1,	%g5
	bshuffle	%f22,	%f12,	%f28
	movleu	%xcc,	%o6,	%i3
	addccc	%i7,	%l6,	%o2
	fsrc2s	%f15,	%f17
	udiv	%o4,	0x052A,	%l4
	edge8l	%g7,	%o3,	%i0
	bshuffle	%f28,	%f18,	%f22
	fxnors	%f22,	%f14,	%f19
	smulcc	%g2,	0x04A3,	%l1
	stw	%l3,	[%l7 + 0x6C]
	umul	%g4,	%i2,	%i4
	alignaddrl	%g1,	%o7,	%i1
	or	%i5,	%l2,	%o5
	sub	%g6,	0x182D,	%l5
	sll	%i6,	0x1B,	%g3
	std	%f18,	[%l7 + 0x78]
	edge8n	%o0,	%l0,	%o1
	sllx	%g5,	%o6,	%i7
	stw	%l6,	[%l7 + 0x38]
	movvc	%icc,	%o2,	%i3
	fmovrslz	%l4,	%f13,	%f29
	smulcc	%o4,	%o3,	%g7
	movrgz	%i0,	0x204,	%l1
	movvs	%xcc,	%l3,	%g4
	stw	%g2,	[%l7 + 0x44]
	udiv	%i4,	0x0A60,	%i2
	fornot1s	%f4,	%f31,	%f10
	array16	%o7,	%g1,	%i5
	movcc	%icc,	%l2,	%o5
	fornot2s	%f0,	%f29,	%f22
	addc	%g6,	%l5,	%i6
	fmovsle	%icc,	%f14,	%f6
	move	%xcc,	%g3,	%o0
	popc	%l0,	%o1
	andcc	%i1,	0x02EA,	%o6
	sethi	0x0C48,	%g5
	std	%f10,	[%l7 + 0x70]
	movre	%i7,	%o2,	%i3
	edge16n	%l6,	%l4,	%o4
	fone	%f14
	fpack32	%f28,	%f26,	%f0
	andncc	%o3,	%i0,	%g7
	edge16ln	%l3,	%l1,	%g2
	movvs	%icc,	%g4,	%i4
	restore %o7, %g1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f18,	%f12
	movleu	%xcc,	%i5,	%l2
	movneg	%icc,	%o5,	%l5
	fmul8x16al	%f31,	%f10,	%f4
	lduh	[%l7 + 0x46],	%i6
	edge32	%g3,	%g6,	%o0
	andcc	%l0,	0x1A60,	%o1
	addcc	%o6,	0x1656,	%i1
	array8	%i7,	%g5,	%o2
	sth	%l6,	[%l7 + 0x10]
	udivcc	%l4,	0x16EA,	%o4
	fmovscs	%xcc,	%f20,	%f19
	ld	[%l7 + 0x7C],	%f21
	lduw	[%l7 + 0x54],	%i3
	umul	%i0,	0x1C23,	%o3
	movrlz	%g7,	0x245,	%l1
	fabsd	%f22,	%f14
	fmul8x16	%f7,	%f10,	%f24
	edge8	%l3,	%g4,	%i4
	edge32n	%g2,	%g1,	%i2
	movrlez	%o7,	0x1AF,	%i5
	edge32ln	%l2,	%l5,	%o5
	sdivx	%i6,	0x1598,	%g3
	movn	%icc,	%o0,	%l0
	mulscc	%o1,	%g6,	%o6
	fmovdleu	%xcc,	%f10,	%f21
	udivcc	%i1,	0x0131,	%g5
	movleu	%icc,	%i7,	%o2
	movre	%l6,	0x0AD,	%o4
	fsrc1s	%f11,	%f20
	udivcc	%i3,	0x106D,	%l4
	lduw	[%l7 + 0x3C],	%o3
	fpadd32	%f20,	%f0,	%f8
	umulcc	%i0,	0x17EB,	%l1
	ldd	[%l7 + 0x48],	%l2
	movcc	%icc,	%g7,	%i4
	sra	%g2,	0x1B,	%g4
	edge16	%i2,	%o7,	%g1
	ldsb	[%l7 + 0x21],	%i5
	srlx	%l2,	%l5,	%i6
	fmovspos	%xcc,	%f23,	%f0
	ldsb	[%l7 + 0x19],	%g3
	umul	%o0,	%l0,	%o5
	fsrc1s	%f6,	%f17
	movleu	%xcc,	%o1,	%g6
	ldsh	[%l7 + 0x7A],	%i1
	movleu	%xcc,	%o6,	%g5
	std	%f20,	[%l7 + 0x48]
	fmovrdne	%o2,	%f12,	%f18
	fmovrdne	%i7,	%f18,	%f30
	fabsd	%f0,	%f30
	stb	%o4,	[%l7 + 0x2C]
	addc	%i3,	0x0675,	%l6
	st	%f5,	[%l7 + 0x40]
	movrne	%o3,	%i0,	%l1
	udiv	%l3,	0x09C5,	%g7
	sllx	%i4,	%g2,	%g4
	movg	%icc,	%l4,	%o7
	sethi	0x1BAD,	%i2
	fone	%f22
	array16	%g1,	%l2,	%i5
	sethi	0x0072,	%l5
	array16	%g3,	%i6,	%l0
	st	%f30,	[%l7 + 0x60]
	sll	%o5,	0x1A,	%o1
	sth	%o0,	[%l7 + 0x52]
	ldd	[%l7 + 0x48],	%f8
	movle	%icc,	%i1,	%o6
	ldx	[%l7 + 0x48],	%g6
	movgu	%icc,	%g5,	%o2
	udiv	%i7,	0x1143,	%o4
	edge16l	%l6,	%o3,	%i3
	fmovspos	%icc,	%f15,	%f1
	orncc	%i0,	0x11EB,	%l3
	movrlez	%g7,	%i4,	%g2
	edge32n	%l1,	%g4,	%l4
	edge16	%i2,	%g1,	%o7
	ld	[%l7 + 0x64],	%f2
	stx	%l2,	[%l7 + 0x50]
	ld	[%l7 + 0x38],	%f8
	movneg	%icc,	%l5,	%g3
	movneg	%xcc,	%i5,	%i6
	movvs	%icc,	%l0,	%o1
	addcc	%o0,	%i1,	%o5
	edge16ln	%o6,	%g6,	%o2
	mova	%xcc,	%i7,	%g5
	fpsub32	%f2,	%f16,	%f22
	fornot1s	%f5,	%f7,	%f19
	fmovdvc	%xcc,	%f2,	%f25
	movl	%icc,	%l6,	%o4
	fmovsleu	%xcc,	%f1,	%f2
	edge8ln	%i3,	%o3,	%i0
	fandnot1s	%f4,	%f10,	%f26
	fmovrsgz	%l3,	%f16,	%f16
	edge32n	%g7,	%g2,	%l1
	movl	%xcc,	%i4,	%g4
	fones	%f4
	andncc	%i2,	%l4,	%o7
	movl	%xcc,	%g1,	%l5
	edge16l	%l2,	%i5,	%i6
	edge16l	%g3,	%o1,	%l0
	ldd	[%l7 + 0x50],	%f10
	fxors	%f16,	%f4,	%f3
	xorcc	%i1,	0x1ACD,	%o5
	movrlez	%o0,	0x1B1,	%o6
	edge32ln	%o2,	%i7,	%g5
	movn	%icc,	%g6,	%l6
	edge32l	%i3,	%o3,	%o4
	movvc	%icc,	%l3,	%g7
	fmovde	%icc,	%f29,	%f0
	mulscc	%i0,	0x095D,	%g2
	fpadd16	%f12,	%f20,	%f22
	sra	%l1,	0x19,	%g4
	andncc	%i2,	%i4,	%l4
	stx	%o7,	[%l7 + 0x20]
	movn	%icc,	%g1,	%l5
	umul	%l2,	0x12D4,	%i5
	edge32	%g3,	%i6,	%l0
	movrlez	%i1,	0x1A6,	%o1
	orn	%o0,	0x1D10,	%o5
	alignaddrl	%o6,	%o2,	%g5
	fmovsvs	%icc,	%f23,	%f30
	ldsh	[%l7 + 0x46],	%g6
	sth	%l6,	[%l7 + 0x42]
	movleu	%icc,	%i7,	%o3
	fmovda	%icc,	%f2,	%f12
	orncc	%i3,	%l3,	%g7
	fpadd32	%f26,	%f2,	%f20
	orncc	%o4,	%g2,	%i0
	stb	%l1,	[%l7 + 0x39]
	ldub	[%l7 + 0x0A],	%g4
	fpsub32s	%f18,	%f11,	%f16
	udivcc	%i4,	0x0FA2,	%l4
	udivx	%o7,	0x1575,	%i2
	fmovsneg	%icc,	%f17,	%f13
	edge8l	%g1,	%l2,	%l5
	movl	%xcc,	%g3,	%i5
	addcc	%l0,	0x14F9,	%i1
	sub	%i6,	0x0ABF,	%o0
	addccc	%o1,	0x1395,	%o6
	udivcc	%o5,	0x040B,	%g5
	fmovrse	%o2,	%f18,	%f2
	movvc	%xcc,	%l6,	%i7
	alignaddr	%o3,	%g6,	%l3
	edge16l	%i3,	%g7,	%o4
	movleu	%icc,	%i0,	%g2
	bshuffle	%f26,	%f22,	%f12
	ldsb	[%l7 + 0x44],	%l1
	subc	%g4,	0x180B,	%i4
	movrne	%o7,	0x267,	%l4
	edge8ln	%g1,	%l2,	%l5
	fandnot2	%f24,	%f0,	%f8
	fnor	%f28,	%f30,	%f2
	fmovdne	%xcc,	%f19,	%f21
	array16	%i2,	%g3,	%i5
	movrne	%i1,	0x298,	%i6
	sllx	%o0,	%l0,	%o6
	mulx	%o5,	%g5,	%o2
	fmovsge	%icc,	%f15,	%f16
	movleu	%xcc,	%l6,	%o1
	fmovrdlz	%i7,	%f8,	%f12
	udivx	%o3,	0x1E2D,	%l3
	edge32l	%g6,	%i3,	%g7
	srax	%o4,	%i0,	%l1
	movre	%g2,	0x078,	%i4
	addc	%o7,	%g4,	%g1
	addcc	%l4,	%l2,	%l5
	subcc	%i2,	0x13AD,	%g3
	fnot1s	%f7,	%f13
	subccc	%i5,	%i6,	%o0
	movrlz	%i1,	%l0,	%o5
	alignaddrl	%o6,	%g5,	%l6
	nop
	set	0x24, %l6
	ldsh	[%l7 + %l6],	%o1
	orn	%o2,	%o3,	%i7
	popc	%l3,	%i3
	movleu	%icc,	%g7,	%g6
	fmovse	%icc,	%f0,	%f6
	fpsub16s	%f4,	%f1,	%f21
	stx	%i0,	[%l7 + 0x08]
	movrlz	%o4,	0x3E4,	%l1
	movne	%icc,	%i4,	%g2
	fandnot2	%f14,	%f16,	%f28
	fmul8ulx16	%f26,	%f20,	%f16
	mulscc	%g4,	0x0675,	%g1
	mulscc	%o7,	%l4,	%l2
	edge16n	%l5,	%g3,	%i5
	addccc	%i6,	0x06D4,	%i2
	fmovdcc	%icc,	%f30,	%f21
	fpadd32	%f18,	%f26,	%f10
	fnot2	%f4,	%f4
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	stw	%o6,	[%l7 + 0x60]
	fmul8x16au	%f29,	%f29,	%f16
	orcc	%o5,	%g5,	%l6
	fmuld8ulx16	%f5,	%f24,	%f18
	movn	%icc,	%o2,	%o1
	fcmpd	%fcc2,	%f30,	%f26
	xorcc	%i7,	%l3,	%o3
	fmuld8ulx16	%f27,	%f11,	%f22
	sth	%i3,	[%l7 + 0x70]
	addc	%g7,	0x0D6F,	%i0
	edge16	%g6,	%o4,	%l1
	xnorcc	%g2,	%g4,	%i4
	movl	%icc,	%o7,	%g1
	movle	%icc,	%l2,	%l5
	fmul8sux16	%f22,	%f22,	%f0
	udiv	%l4,	0x0768,	%g3
	edge32ln	%i6,	%i5,	%o0
	fmovscc	%icc,	%f4,	%f20
	fxnors	%f25,	%f16,	%f11
	smulcc	%i2,	%i1,	%l0
	ldx	[%l7 + 0x20],	%o6
	fmovse	%xcc,	%f22,	%f25
	alignaddr	%g5,	%l6,	%o5
	ldx	[%l7 + 0x18],	%o2
	xnor	%i7,	0x093D,	%l3
	add	%o3,	%i3,	%g7
	movg	%xcc,	%o1,	%g6
	edge8n	%i0,	%o4,	%g2
	orcc	%l1,	0x1E04,	%i4
	movpos	%xcc,	%o7,	%g4
	fnot1s	%f2,	%f0
	fornot1	%f22,	%f4,	%f10
	st	%f17,	[%l7 + 0x6C]
	edge32ln	%g1,	%l5,	%l2
	sethi	0x11A0,	%l4
	movg	%xcc,	%i6,	%g3
	std	%f0,	[%l7 + 0x10]
	xor	%i5,	0x1536,	%o0
	nop
	set	0x56, %o6
	sth	%i2,	[%l7 + %o6]
	ldx	[%l7 + 0x20],	%l0
	fmovde	%icc,	%f12,	%f15
	ldsh	[%l7 + 0x48],	%i1
	sdiv	%g5,	0x00E8,	%o6
	udivcc	%o5,	0x1E65,	%o2
	fmovdvc	%xcc,	%f24,	%f28
	stb	%l6,	[%l7 + 0x54]
	andncc	%i7,	%l3,	%o3
	st	%f29,	[%l7 + 0x40]
	bshuffle	%f18,	%f30,	%f0
	movrlz	%g7,	%o1,	%g6
	save %i3, 0x1275, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g2,	%l1,	%i0
	fmovscs	%icc,	%f5,	%f16
	edge16n	%i4,	%o7,	%g4
	addccc	%l5,	%g1,	%l4
	fxor	%f16,	%f24,	%f18
	fxor	%f16,	%f6,	%f18
	fmovrsgz	%l2,	%f11,	%f14
	sdivx	%i6,	0x0CC0,	%i5
	umulcc	%g3,	0x07D0,	%o0
	sdiv	%i2,	0x0890,	%l0
	movcs	%xcc,	%g5,	%i1
	sethi	0x1CF2,	%o6
	fpadd16s	%f30,	%f17,	%f10
	fone	%f16
	fmovsvs	%icc,	%f1,	%f24
	edge32n	%o2,	%o5,	%i7
	st	%f26,	[%l7 + 0x14]
	edge8n	%l6,	%l3,	%o3
	fmul8sux16	%f2,	%f8,	%f12
	edge8ln	%g7,	%o1,	%i3
	stb	%o4,	[%l7 + 0x4F]
	smulcc	%g6,	%g2,	%l1
	popc	0x0D67,	%i0
	array16	%i4,	%g4,	%l5
	stw	%g1,	[%l7 + 0x44]
	array8	%o7,	%l2,	%i6
	std	%f28,	[%l7 + 0x70]
	umul	%i5,	%g3,	%l4
	pdist	%f20,	%f30,	%f22
	faligndata	%f8,	%f30,	%f6
	edge16l	%o0,	%i2,	%l0
	lduw	[%l7 + 0x0C],	%i1
	ldx	[%l7 + 0x40],	%o6
	movn	%xcc,	%g5,	%o2
	restore %o5, 0x0CAC, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%icc,	%f6,	%f3
	movrgez	%i7,	0x310,	%o3
	st	%f7,	[%l7 + 0x64]
	edge32ln	%g7,	%l3,	%i3
	movn	%xcc,	%o4,	%o1
	fmovrdlz	%g2,	%f16,	%f22
	bshuffle	%f2,	%f0,	%f28
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	orn	%l1,	%i4,	%l5
	smul	%g1,	%o7,	%l2
	movvc	%icc,	%g4,	%i6
	fmul8x16al	%f19,	%f29,	%f18
	fmovrde	%g3,	%f22,	%f20
	st	%f23,	[%l7 + 0x2C]
	movl	%icc,	%i5,	%o0
	fmovsn	%icc,	%f12,	%f27
	restore %i2, 0x0126, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l0,	0x12EF,	%i1
	addcc	%o6,	%g5,	%o5
	edge8ln	%l6,	%i7,	%o3
	fzeros	%f25
	sir	0x06E8
	movleu	%xcc,	%g7,	%o2
	fpackfix	%f0,	%f12
	movn	%icc,	%l3,	%o4
	movne	%xcc,	%o1,	%g2
	fpack32	%f10,	%f12,	%f22
	andcc	%g6,	%i3,	%l1
	srl	%i4,	0x07,	%i0
	movn	%xcc,	%g1,	%l5
	sdiv	%o7,	0x1FBD,	%l2
	st	%f26,	[%l7 + 0x54]
	fpadd16	%f8,	%f24,	%f0
	fcmpne32	%f22,	%f0,	%i6
	sdivx	%g4,	0x0E31,	%i5
	fmovsgu	%xcc,	%f5,	%f21
	fmovde	%xcc,	%f16,	%f19
	movne	%icc,	%o0,	%i2
	alignaddr	%g3,	%l4,	%l0
	edge8ln	%i1,	%g5,	%o5
	fone	%f4
	srl	%l6,	0x01,	%o6
	ldd	[%l7 + 0x30],	%o2
	stw	%g7,	[%l7 + 0x18]
	fmovrdlez	%o2,	%f2,	%f14
	mova	%icc,	%l3,	%o4
	mulx	%o1,	0x0979,	%i7
	movvc	%xcc,	%g6,	%g2
	movle	%icc,	%i3,	%i4
	sdivcc	%i0,	0x11BA,	%g1
	edge16ln	%l1,	%l5,	%o7
	umulcc	%i6,	%g4,	%l2
	ldsh	[%l7 + 0x6C],	%o0
	movg	%xcc,	%i2,	%g3
	fnot2	%f18,	%f24
	xorcc	%l4,	%l0,	%i1
	lduw	[%l7 + 0x4C],	%i5
	srl	%o5,	0x13,	%l6
	udivcc	%g5,	0x10AD,	%o6
	fmovspos	%xcc,	%f16,	%f5
	sub	%o3,	%o2,	%g7
	edge8n	%l3,	%o4,	%i7
	edge16ln	%g6,	%o1,	%g2
	array16	%i3,	%i4,	%g1
	ldsb	[%l7 + 0x16],	%l1
	sth	%i0,	[%l7 + 0x40]
	fmovsn	%xcc,	%f21,	%f12
	movcc	%xcc,	%l5,	%o7
	popc	%g4,	%l2
	sll	%i6,	0x17,	%o0
	andcc	%i2,	0x0484,	%g3
	ldd	[%l7 + 0x18],	%f10
	fpack16	%f0,	%f6
	fmovdge	%icc,	%f19,	%f18
	andn	%l0,	%i1,	%l4
	movcs	%icc,	%o5,	%l6
	fcmped	%fcc2,	%f22,	%f16
	lduw	[%l7 + 0x40],	%i5
	alignaddr	%g5,	%o3,	%o6
	array32	%o2,	%l3,	%g7
	fmovd	%f8,	%f0
	pdist	%f0,	%f6,	%f4
	fmovdle	%xcc,	%f2,	%f4
	array8	%o4,	%i7,	%o1
	add	%g2,	%i3,	%g6
	stx	%g1,	[%l7 + 0x50]
	ldsb	[%l7 + 0x11],	%l1
	movle	%icc,	%i4,	%l5
	sdivcc	%o7,	0x040D,	%i0
	mulscc	%g4,	0x18B2,	%i6
	fsrc1	%f24,	%f16
	array32	%l2,	%o0,	%g3
	fmovrdne	%i2,	%f0,	%f16
	fcmpeq32	%f14,	%f30,	%i1
	ldx	[%l7 + 0x60],	%l0
	movn	%xcc,	%o5,	%l6
	addccc	%l4,	0x1479,	%g5
	ldx	[%l7 + 0x10],	%o3
	xor	%i5,	%o6,	%l3
	fpsub16	%f22,	%f26,	%f24
	bshuffle	%f8,	%f30,	%f10
	mova	%xcc,	%g7,	%o4
	umul	%i7,	0x0F74,	%o1
	array8	%o2,	%g2,	%i3
	movrlz	%g1,	0x159,	%l1
	fors	%f12,	%f29,	%f9
	orn	%g6,	%i4,	%o7
	edge32	%l5,	%g4,	%i6
	fmovdg	%xcc,	%f26,	%f15
	mulscc	%l2,	%o0,	%i0
	add	%i2,	%g3,	%i1
	or	%l0,	0x05EA,	%l6
	lduh	[%l7 + 0x34],	%o5
	ldd	[%l7 + 0x58],	%f18
	fsrc2s	%f26,	%f15
	orn	%g5,	%l4,	%i5
	movvc	%icc,	%o6,	%o3
	fmovrdgz	%l3,	%f20,	%f8
	ldsh	[%l7 + 0x1E],	%o4
	movcc	%xcc,	%g7,	%i7
	save %o2, %o1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g1,	%i3,	%g6
	fandnot1	%f6,	%f6,	%f24
	ldd	[%l7 + 0x30],	%f6
	orncc	%i4,	%o7,	%l1
	movge	%xcc,	%l5,	%g4
	stx	%l2,	[%l7 + 0x70]
	edge32n	%o0,	%i0,	%i6
	popc	%i2,	%i1
	ld	[%l7 + 0x4C],	%f19
	sllx	%g3,	%l6,	%o5
	fmuld8ulx16	%f14,	%f2,	%f26
	sdivcc	%g5,	0x085E,	%l4
	mulscc	%l0,	%i5,	%o3
	fornot1	%f14,	%f30,	%f8
	edge8l	%l3,	%o4,	%o6
	movre	%i7,	0x0DE,	%o2
	xorcc	%g7,	0x0835,	%o1
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	edge8n	%g1,	%g6,	%o7
	orcc	%i4,	%l5,	%g4
	orcc	%l1,	0x08AC,	%l2
	andcc	%o0,	0x16B4,	%i0
	fpack16	%f22,	%f30
	movcc	%xcc,	%i2,	%i1
	edge8n	%g3,	%l6,	%o5
	array32	%g5,	%l4,	%i6
	movcc	%icc,	%i5,	%o3
	sll	%l3,	%l0,	%o4
	ldx	[%l7 + 0x38],	%i7
	edge32l	%o6,	%o2,	%o1
	movrlz	%g2,	0x1F2,	%i3
	save %g7, 0x1773, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o7,	%g1
	movcc	%icc,	%i4,	%l5
	fpadd16s	%f28,	%f27,	%f20
	movgu	%icc,	%l1,	%l2
	nop
	set	0x78, %o3
	sth	%g4,	[%l7 + %o3]
	movrlz	%i0,	%i2,	%i1
	add	%g3,	0x1227,	%o0
	movvs	%icc,	%o5,	%g5
	move	%icc,	%l6,	%l4
	xor	%i6,	0x1025,	%o3
	edge32	%l3,	%l0,	%i5
	subccc	%o4,	%i7,	%o2
	movgu	%xcc,	%o1,	%o6
	movcs	%icc,	%g2,	%i3
	andncc	%g7,	%o7,	%g6
	movleu	%xcc,	%i4,	%l5
	udivcc	%g1,	0x18F7,	%l2
	xorcc	%l1,	%g4,	%i0
	srlx	%i1,	%i2,	%g3
	alignaddrl	%o0,	%g5,	%o5
	fmuld8ulx16	%f27,	%f6,	%f8
	movrgz	%l6,	0x268,	%l4
	xorcc	%o3,	%i6,	%l3
	fmuld8sux16	%f30,	%f31,	%f8
	subccc	%l0,	0x0704,	%i5
	bshuffle	%f22,	%f24,	%f14
	movcc	%xcc,	%i7,	%o2
	save %o1, 0x05BC, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o6,	%g2,	%g7
	edge8ln	%o7,	%g6,	%i3
	orcc	%l5,	%i4,	%l2
	fxors	%f11,	%f28,	%f17
	lduw	[%l7 + 0x3C],	%g1
	edge16l	%l1,	%i0,	%i1
	fpadd16s	%f29,	%f13,	%f21
	array16	%g4,	%i2,	%o0
	popc	%g3,	%g5
	movrgez	%l6,	%o5,	%o3
	edge8ln	%i6,	%l4,	%l3
	fcmple32	%f26,	%f6,	%l0
	edge8l	%i7,	%i5,	%o2
	fpsub16s	%f5,	%f25,	%f12
	stw	%o4,	[%l7 + 0x28]
	movrlz	%o6,	%g2,	%g7
	sir	0x08B9
	addcc	%o1,	%g6,	%i3
	movl	%xcc,	%o7,	%l5
	movcc	%xcc,	%i4,	%l2
	fmovdg	%icc,	%f25,	%f29
	nop
	set	0x48, %i6
	stx	%l1,	[%l7 + %i6]
	sethi	0x0A95,	%g1
	fzero	%f28
	sdivx	%i1,	0x00DE,	%g4
	fmovrdne	%i2,	%f24,	%f16
	udiv	%o0,	0x0850,	%i0
	ldd	[%l7 + 0x28],	%g4
	orn	%g3,	%o5,	%o3
	xnorcc	%l6,	0x11D9,	%l4
	movrgz	%l3,	%i6,	%i7
	movrlz	%l0,	%o2,	%o4
	save %o6, 0x10A7, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f25,	%f28
	alignaddr	%g7,	%i5,	%g6
	edge8	%o1,	%i3,	%o7
	fxors	%f4,	%f28,	%f10
	movrlez	%i4,	%l2,	%l5
	udivcc	%l1,	0x16E5,	%g1
	srlx	%i1,	%g4,	%i2
	addcc	%i0,	0x16F0,	%o0
	fmovdgu	%icc,	%f8,	%f29
	ldd	[%l7 + 0x70],	%f22
	sllx	%g3,	0x18,	%o5
	fmul8x16	%f10,	%f22,	%f14
	sth	%g5,	[%l7 + 0x66]
	array16	%o3,	%l4,	%l6
	stw	%i6,	[%l7 + 0x68]
	fcmpeq16	%f0,	%f10,	%i7
	subc	%l3,	%l0,	%o4
	array8	%o2,	%o6,	%g2
	movcc	%xcc,	%g7,	%i5
	sra	%g6,	%i3,	%o1
	movcs	%icc,	%o7,	%i4
	andn	%l5,	0x186A,	%l1
	movpos	%icc,	%l2,	%g1
	add	%g4,	%i2,	%i1
	edge16ln	%i0,	%o0,	%o5
	movrgez	%g3,	0x311,	%g5
	movgu	%icc,	%l4,	%o3
	smulcc	%l6,	0x00EC,	%i7
	movrlz	%l3,	0x281,	%i6
	or	%l0,	%o2,	%o6
	ldsb	[%l7 + 0x0D],	%g2
	movl	%icc,	%o4,	%g7
	edge32	%g6,	%i3,	%o1
	movre	%i5,	%i4,	%o7
	edge8l	%l5,	%l1,	%g1
	fpsub16	%f22,	%f10,	%f10
	fxor	%f0,	%f16,	%f22
	fcmple32	%f28,	%f10,	%l2
	andn	%i2,	%i1,	%g4
	udivx	%o0,	0x0402,	%i0
	lduw	[%l7 + 0x28],	%g3
	edge32	%o5,	%l4,	%g5
	sdivcc	%o3,	0x1FE7,	%i7
	movpos	%xcc,	%l3,	%l6
	srax	%i6,	%l0,	%o2
	movvc	%xcc,	%o6,	%g2
	movle	%xcc,	%g7,	%g6
	fabss	%f27,	%f0
	ldub	[%l7 + 0x33],	%i3
	srl	%o4,	0x10,	%o1
	fandnot1s	%f3,	%f3,	%f30
	andn	%i4,	%o7,	%i5
	movrgez	%l5,	0x0FD,	%g1
	addc	%l2,	0x0DD3,	%i2
	addc	%i1,	0x1991,	%g4
	movvc	%xcc,	%l1,	%i0
	mulscc	%o0,	%o5,	%l4
	fmovsne	%icc,	%f17,	%f3
	udiv	%g3,	0x0173,	%g5
	fmovrslez	%i7,	%f14,	%f29
	movg	%icc,	%l3,	%o3
	udivcc	%i6,	0x0EA6,	%l6
	orn	%o2,	%l0,	%g2
	smulcc	%o6,	%g7,	%i3
	and	%o4,	0x1335,	%g6
	movre	%i4,	%o7,	%o1
	fpsub16s	%f0,	%f12,	%f13
	lduw	[%l7 + 0x1C],	%i5
	andcc	%g1,	%l5,	%l2
	siam	0x6
	sir	0x1B15
	fxor	%f18,	%f18,	%f10
	fmovsneg	%icc,	%f28,	%f10
	edge16l	%i2,	%i1,	%g4
	fsrc1s	%f1,	%f12
	sethi	0x15F1,	%l1
	sllx	%i0,	%o0,	%l4
	array16	%g3,	%o5,	%g5
	sethi	0x19C0,	%l3
	srax	%i7,	0x14,	%o3
	add	%i6,	0x1D0C,	%o2
	popc	0x004B,	%l0
	edge8n	%l6,	%g2,	%g7
	alignaddr	%o6,	%o4,	%i3
	xnorcc	%i4,	%o7,	%g6
	fcmpgt16	%f24,	%f6,	%o1
	faligndata	%f22,	%f8,	%f22
	xnor	%g1,	0x08F8,	%i5
	movneg	%xcc,	%l2,	%i2
	edge32	%i1,	%l5,	%g4
	sdivx	%l1,	0x046E,	%i0
	std	%f26,	[%l7 + 0x28]
	sth	%o0,	[%l7 + 0x6C]
	fmul8x16	%f8,	%f24,	%f18
	udivcc	%g3,	0x1164,	%l4
	ldub	[%l7 + 0x56],	%g5
	save %o5, 0x1D69, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l3,	%o3,	%o2
	movrne	%i6,	%l0,	%g2
	edge8	%g7,	%l6,	%o4
	srl	%i3,	%o6,	%i4
	edge32	%g6,	%o7,	%o1
	stb	%i5,	[%l7 + 0x6E]
	movne	%icc,	%l2,	%i2
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%f28
	fcmped	%fcc3,	%f14,	%f4
	fnot1s	%f31,	%f9
	orcc	%i1,	0x1673,	%l5
	fornot1s	%f0,	%f12,	%f18
	array16	%g1,	%g4,	%l1
	fmovdcc	%xcc,	%f20,	%f21
	edge8	%i0,	%o0,	%l4
	lduh	[%l7 + 0x10],	%g5
	andncc	%g3,	%i7,	%l3
	ldsh	[%l7 + 0x40],	%o5
	array8	%o2,	%i6,	%l0
	srl	%g2,	%o3,	%l6
	st	%f18,	[%l7 + 0x7C]
	array32	%o4,	%i3,	%o6
	orcc	%i4,	%g6,	%g7
	popc	0x1C01,	%o1
	sir	0x053B
	andn	%i5,	0x1EA4,	%o7
	edge16	%i2,	%l2,	%i1
	st	%f15,	[%l7 + 0x48]
	ldub	[%l7 + 0x1A],	%l5
	fornot2s	%f13,	%f17,	%f31
	xor	%g1,	%l1,	%g4
	edge32l	%i0,	%l4,	%g5
	edge16n	%o0,	%g3,	%l3
	xnor	%o5,	%o2,	%i6
	edge32n	%i7,	%l0,	%o3
	sdivcc	%l6,	0x1200,	%o4
	ldsw	[%l7 + 0x34],	%g2
	mova	%icc,	%i3,	%o6
	ldd	[%l7 + 0x08],	%i4
	udivcc	%g7,	0x1112,	%g6
	sdivcc	%i5,	0x0E1E,	%o7
	smulcc	%o1,	0x1B74,	%i2
	ldsh	[%l7 + 0x52],	%l2
	umul	%l5,	0x1F5C,	%g1
	fmovsa	%icc,	%f7,	%f29
	for	%f22,	%f14,	%f22
	movrgez	%i1,	%g4,	%l1
	addcc	%l4,	0x170E,	%g5
	ldub	[%l7 + 0x10],	%o0
	movre	%g3,	0x176,	%l3
	umul	%o5,	0x0319,	%o2
	sll	%i0,	0x05,	%i7
	edge32l	%l0,	%i6,	%o3
	movrlez	%l6,	%o4,	%g2
	movge	%xcc,	%i3,	%o6
	alignaddr	%i4,	%g6,	%i5
	fornot1s	%f27,	%f0,	%f21
	fandnot1s	%f8,	%f18,	%f22
	fpsub32s	%f26,	%f17,	%f6
	movn	%icc,	%g7,	%o1
	ldd	[%l7 + 0x78],	%i2
	array32	%o7,	%l5,	%g1
	array32	%i1,	%l2,	%g4
	fnot1	%f28,	%f18
	movne	%xcc,	%l4,	%g5
	andn	%l1,	%o0,	%g3
	sdivcc	%o5,	0x1B4C,	%l3
	udiv	%i0,	0x12E5,	%o2
	movrlez	%l0,	%i7,	%i6
	edge16l	%o3,	%l6,	%g2
	sllx	%i3,	0x1E,	%o6
	fmovda	%xcc,	%f4,	%f24
	movvs	%xcc,	%i4,	%o4
	orncc	%i5,	%g6,	%o1
	ldub	[%l7 + 0x49],	%g7
	movneg	%xcc,	%o7,	%l5
	ldsh	[%l7 + 0x26],	%g1
	srl	%i1,	%l2,	%i2
	ldsb	[%l7 + 0x41],	%l4
	ldsw	[%l7 + 0x64],	%g5
	edge16ln	%g4,	%l1,	%g3
	mulscc	%o0,	%l3,	%o5
	movrlz	%o2,	%l0,	%i0
	movn	%xcc,	%i6,	%o3
	sllx	%i7,	0x04,	%g2
	sdiv	%i3,	0x08C3,	%o6
	st	%f15,	[%l7 + 0x60]
	fpsub32	%f0,	%f16,	%f26
	nop
	set	0x4E, %i4
	ldsb	[%l7 + %i4],	%i4
	edge8n	%l6,	%i5,	%o4
	movneg	%xcc,	%o1,	%g6
	sdivcc	%o7,	0x1F07,	%g7
	fmovrde	%l5,	%f14,	%f14
	movneg	%xcc,	%i1,	%l2
	fands	%f0,	%f19,	%f3
	orn	%i2,	0x07C1,	%g1
	movneg	%icc,	%g5,	%g4
	movge	%xcc,	%l1,	%l4
	orncc	%g3,	0x1ED2,	%o0
	fmovsg	%icc,	%f14,	%f5
	fmovscc	%xcc,	%f14,	%f30
	umulcc	%o5,	%o2,	%l3
	edge32	%l0,	%i6,	%o3
	fmovrdgez	%i0,	%f24,	%f22
	sth	%i7,	[%l7 + 0x36]
	sethi	0x1486,	%g2
	restore %i3, %o6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l6,	0x0389,	%i5
	movcs	%icc,	%o1,	%o4
	udivx	%g6,	0x1CC3,	%o7
	umul	%l5,	0x12C6,	%i1
	popc	%l2,	%i2
	mulscc	%g1,	%g7,	%g4
	movrne	%g5,	%l4,	%l1
	orncc	%o0,	0x0078,	%g3
	ldsb	[%l7 + 0x38],	%o2
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	udivx	%l0,	0x1B5A,	%i0
	fmul8sux16	%f6,	%f20,	%f8
	ldub	[%l7 + 0x1D],	%i7
	ld	[%l7 + 0x20],	%f2
	fnot1s	%f10,	%f19
	fabss	%f31,	%f30
	umulcc	%g2,	%o3,	%o6
	move	%xcc,	%i4,	%i3
	nop
	set	0x36, %l5
	ldsh	[%l7 + %l5],	%i5
	alignaddr	%o1,	%l6,	%g6
	restore %o4, %l5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%l2,	%i1
	addccc	%g1,	0x0AA9,	%i2
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	array16	%l4,	%o0,	%l1
	sra	%g3,	0x17,	%o5
	movl	%icc,	%o2,	%l3
	alignaddr	%l0,	%i6,	%i0
	movrlez	%i7,	%g2,	%o6
	array32	%o3,	%i4,	%i3
	movrlz	%i5,	0x258,	%o1
	fpsub16	%f10,	%f24,	%f8
	srax	%l6,	%g6,	%o4
	mova	%icc,	%l5,	%o7
	edge16	%i1,	%g1,	%i2
	edge32ln	%g4,	%g7,	%l2
	fmovsge	%icc,	%f25,	%f3
	sir	0x11AC
	alignaddrl	%l4,	%o0,	%g5
	edge32ln	%g3,	%l1,	%o5
	move	%xcc,	%o2,	%l0
	smul	%i6,	%i0,	%l3
	mulscc	%i7,	0x0368,	%o6
	fornot1	%f16,	%f2,	%f18
	edge16ln	%g2,	%o3,	%i4
	mulscc	%i5,	%i3,	%l6
	mulx	%g6,	0x1054,	%o4
	fmovrsgez	%l5,	%f15,	%f31
	fnands	%f0,	%f17,	%f27
	edge16	%o1,	%i1,	%o7
	alignaddrl	%i2,	%g4,	%g1
	movneg	%icc,	%l2,	%g7
	fmul8ulx16	%f0,	%f22,	%f20
	lduw	[%l7 + 0x08],	%l4
	udivx	%o0,	0x1D80,	%g5
	xnorcc	%l1,	0x1D03,	%o5
	sllx	%g3,	0x19,	%o2
	array32	%l0,	%i0,	%l3
	sdivx	%i6,	0x013C,	%o6
	fcmpgt16	%f30,	%f12,	%i7
	array8	%o3,	%i4,	%i5
	orcc	%i3,	%g2,	%l6
	ld	[%l7 + 0x5C],	%f10
	fmovrdne	%o4,	%f26,	%f16
	fmovdgu	%xcc,	%f2,	%f7
	fmovsne	%xcc,	%f7,	%f18
	sethi	0x19BB,	%l5
	sdivx	%o1,	0x13A8,	%i1
	subcc	%g6,	0x1B47,	%i2
	movcs	%xcc,	%g4,	%o7
	edge32	%g1,	%l2,	%g7
	fmovdn	%xcc,	%f25,	%f9
	array8	%o0,	%g5,	%l4
	st	%f22,	[%l7 + 0x4C]
	movgu	%xcc,	%o5,	%l1
	subc	%o2,	%g3,	%i0
	fcmpeq16	%f10,	%f24,	%l0
	fors	%f17,	%f3,	%f7
	movpos	%xcc,	%i6,	%o6
	movne	%xcc,	%l3,	%i7
	ldsh	[%l7 + 0x64],	%i4
	movrgz	%o3,	0x121,	%i3
	movvc	%icc,	%i5,	%g2
	movcs	%xcc,	%l6,	%l5
	fmovrdgz	%o1,	%f26,	%f16
	edge32	%i1,	%o4,	%i2
	mulscc	%g6,	%o7,	%g4
	sir	0x0AA2
	fors	%f31,	%f14,	%f12
	fmovscs	%icc,	%f1,	%f25
	edge8ln	%l2,	%g7,	%o0
	movle	%xcc,	%g5,	%l4
	orn	%o5,	0x1CFC,	%l1
	fnegs	%f3,	%f15
	edge8	%o2,	%g1,	%g3
	alignaddr	%i0,	%l0,	%o6
	ldsb	[%l7 + 0x7D],	%l3
	movrlz	%i7,	%i6,	%i4
	ldsw	[%l7 + 0x60],	%o3
	smulcc	%i3,	0x0AB1,	%i5
	ld	[%l7 + 0x5C],	%f11
	smulcc	%l6,	0x067A,	%l5
	stw	%g2,	[%l7 + 0x24]
	fandnot2s	%f28,	%f5,	%f3
	mova	%xcc,	%o1,	%o4
	alignaddrl	%i1,	%g6,	%i2
	movre	%g4,	%o7,	%g7
	andn	%l2,	%o0,	%l4
	movvs	%icc,	%g5,	%o5
	lduh	[%l7 + 0x28],	%o2
	fmovsle	%xcc,	%f8,	%f0
	sdiv	%g1,	0x0506,	%g3
	sir	0x1F46
	lduw	[%l7 + 0x78],	%i0
	movne	%xcc,	%l1,	%l0
	sub	%l3,	%i7,	%i6
	edge32l	%i4,	%o6,	%o3
	edge32n	%i3,	%l6,	%i5
	movn	%icc,	%g2,	%o1
	edge16l	%l5,	%i1,	%o4
	xnor	%i2,	%g4,	%g6
	srlx	%g7,	0x00,	%o7
	fnot2s	%f3,	%f12
	movrlez	%o0,	%l4,	%l2
	andcc	%g5,	%o5,	%o2
	alignaddrl	%g1,	%i0,	%l1
	nop
	set	0x1B, %o5
	ldub	[%l7 + %o5],	%l0
	fnands	%f5,	%f6,	%f13
	ldsw	[%l7 + 0x4C],	%l3
	fmovdcs	%xcc,	%f13,	%f22
	fnands	%f5,	%f21,	%f8
	ldx	[%l7 + 0x48],	%i7
	move	%icc,	%i6,	%i4
	fcmpes	%fcc2,	%f29,	%f10
	udiv	%g3,	0x1AD5,	%o3
	xnor	%i3,	0x0349,	%l6
	alignaddrl	%o6,	%g2,	%o1
	sth	%l5,	[%l7 + 0x12]
	edge8l	%i1,	%i5,	%o4
	stb	%i2,	[%l7 + 0x66]
	movcs	%icc,	%g6,	%g4
	orn	%g7,	0x061C,	%o7
	array32	%o0,	%l2,	%l4
	edge16ln	%g5,	%o5,	%o2
	sra	%g1,	0x11,	%i0
	smul	%l0,	%l1,	%i7
	movne	%icc,	%i6,	%l3
	ldsw	[%l7 + 0x78],	%g3
	fmovse	%icc,	%f16,	%f29
	smul	%o3,	%i4,	%i3
	ldd	[%l7 + 0x68],	%o6
	alignaddr	%l6,	%o1,	%g2
	udivx	%l5,	0x0D9C,	%i1
	fcmpeq32	%f20,	%f22,	%i5
	fmovrsne	%o4,	%f6,	%f10
	edge16ln	%i2,	%g4,	%g6
	srax	%g7,	%o0,	%l2
	sll	%o7,	%l4,	%o5
	movre	%o2,	0x217,	%g1
	edge16n	%g5,	%i0,	%l0
	subccc	%i7,	%i6,	%l1
	fmovsvs	%icc,	%f7,	%f25
	fones	%f6
	nop
	set	0x54, %o0
	ldsw	[%l7 + %o0],	%g3
	sdivx	%l3,	0x03CE,	%o3
	fmovse	%icc,	%f27,	%f30
	fpack32	%f4,	%f26,	%f10
	sth	%i3,	[%l7 + 0x28]
	popc	%i4,	%o6
	fmovsne	%icc,	%f7,	%f14
	save %o1, %l6, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i1,	0x0DDB,	%l5
	std	%f26,	[%l7 + 0x18]
	fnegs	%f28,	%f9
	fnor	%f24,	%f22,	%f30
	ldsw	[%l7 + 0x6C],	%i5
	srax	%i2,	%g4,	%g6
	edge8l	%o4,	%o0,	%l2
	fnegs	%f12,	%f12
	fmovsne	%icc,	%f23,	%f18
	restore %o7, 0x0D00, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l4,	%o5,	%g1
	movrgez	%g5,	0x0A6,	%o2
	fcmps	%fcc3,	%f1,	%f20
	movl	%xcc,	%l0,	%i0
	fcmpeq32	%f26,	%f20,	%i7
	movvc	%xcc,	%l1,	%i6
	fcmpd	%fcc1,	%f6,	%f6
	edge16n	%g3,	%l3,	%i3
	ldd	[%l7 + 0x48],	%o2
	fxnors	%f20,	%f24,	%f3
	sir	0x075D
	lduh	[%l7 + 0x22],	%i4
	movcc	%icc,	%o1,	%o6
	udivx	%g2,	0x19E8,	%l6
	udivcc	%i1,	0x1720,	%l5
	fandnot1	%f10,	%f8,	%f18
	movcc	%xcc,	%i2,	%i5
	movcc	%icc,	%g4,	%o4
	subcc	%g6,	0x0C0B,	%l2
	fmovrse	%o0,	%f3,	%f9
	edge8ln	%g7,	%l4,	%o5
	andcc	%g1,	%o7,	%g5
	array32	%l0,	%i0,	%o2
	fmovsl	%icc,	%f26,	%f9
	sir	0x01BE
	orcc	%l1,	0x1E86,	%i6
	movl	%xcc,	%g3,	%i7
	fmovse	%xcc,	%f19,	%f2
	and	%i3,	0x0344,	%l3
	umulcc	%o3,	%o1,	%i4
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%g2
	movge	%xcc,	%l6,	%o6
	xor	%i1,	0x0878,	%l5
	udiv	%i5,	0x1834,	%i2
	fmovrdlz	%g4,	%f8,	%f30
	movleu	%icc,	%o4,	%g6
	movvc	%icc,	%l2,	%g7
	pdist	%f6,	%f30,	%f16
	move	%xcc,	%l4,	%o0
	srlx	%o5,	%g1,	%o7
	sth	%l0,	[%l7 + 0x62]
	movrgez	%g5,	0x135,	%o2
	movre	%i0,	0x246,	%i6
	xnor	%g3,	%l1,	%i3
	movge	%icc,	%l3,	%o3
	and	%o1,	0x194E,	%i4
	movpos	%icc,	%g2,	%i7
	lduh	[%l7 + 0x64],	%o6
	movrgez	%i1,	%l5,	%i5
	fpackfix	%f16,	%f25
	edge8ln	%i2,	%g4,	%o4
	mova	%xcc,	%l6,	%g6
	movleu	%xcc,	%g7,	%l2
	ldsh	[%l7 + 0x2C],	%o0
	mova	%icc,	%l4,	%o5
	addccc	%o7,	%g1,	%l0
	movpos	%xcc,	%o2,	%i0
	stx	%i6,	[%l7 + 0x58]
	edge8ln	%g5,	%g3,	%l1
	movrgz	%i3,	%l3,	%o3
	popc	%i4,	%o1
	fmovsvc	%icc,	%f21,	%f12
	fabss	%f31,	%f4
	nop
	set	0x78, %g3
	stx	%i7,	[%l7 + %g3]
	faligndata	%f6,	%f20,	%f26
	andncc	%o6,	%i1,	%g2
	srlx	%i5,	%i2,	%l5
	fnot1	%f20,	%f20
	subcc	%o4,	0x0B26,	%l6
	ldd	[%l7 + 0x08],	%f6
	add	%g4,	%g7,	%l2
	sub	%o0,	0x0CCA,	%g6
	movcc	%icc,	%o5,	%l4
	sdiv	%g1,	0x176D,	%o7
	lduh	[%l7 + 0x28],	%o2
	edge8n	%l0,	%i6,	%i0
	edge32ln	%g5,	%g3,	%l1
	movrgez	%i3,	0x171,	%o3
	fmovdgu	%xcc,	%f6,	%f3
	fcmple32	%f18,	%f22,	%i4
	st	%f30,	[%l7 + 0x38]
	movrlez	%l3,	0x183,	%o1
	pdist	%f26,	%f24,	%f18
	stb	%o6,	[%l7 + 0x4C]
	fandnot2s	%f25,	%f11,	%f7
	fmovsle	%icc,	%f21,	%f14
	st	%f2,	[%l7 + 0x44]
	movvc	%xcc,	%i7,	%i1
	movcs	%icc,	%g2,	%i5
	subcc	%l5,	0x0099,	%i2
	xnorcc	%l6,	0x078F,	%g4
	movl	%xcc,	%g7,	%l2
	edge16ln	%o4,	%g6,	%o0
	edge16ln	%o5,	%g1,	%l4
	array16	%o2,	%o7,	%l0
	ldsw	[%l7 + 0x50],	%i6
	add	%i0,	%g3,	%g5
	save %i3, %o3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i4,	%o1
	udivcc	%o6,	0x06A5,	%i7
	fpack32	%f6,	%f6,	%f18
	movcc	%icc,	%l3,	%i1
	xorcc	%g2,	0x16FA,	%l5
	udivcc	%i2,	0x045D,	%i5
	xnor	%l6,	%g4,	%g7
	edge16n	%l2,	%g6,	%o0
	ldx	[%l7 + 0x58],	%o5
	fmovda	%xcc,	%f7,	%f6
	add	%g1,	0x14A3,	%l4
	movl	%xcc,	%o2,	%o7
	edge8ln	%l0,	%i6,	%o4
	edge32ln	%i0,	%g3,	%i3
	lduw	[%l7 + 0x28],	%o3
	fmovsgu	%xcc,	%f6,	%f20
	sub	%l1,	0x1B20,	%i4
	fmovse	%xcc,	%f20,	%f25
	umulcc	%g5,	0x1CED,	%o1
	edge16l	%i7,	%o6,	%l3
	udiv	%i1,	0x056E,	%l5
	edge8l	%i2,	%g2,	%i5
	stb	%g4,	[%l7 + 0x53]
	movg	%icc,	%g7,	%l2
	lduh	[%l7 + 0x66],	%l6
	ld	[%l7 + 0x74],	%f4
	ldsb	[%l7 + 0x3E],	%g6
	edge32ln	%o5,	%o0,	%l4
	sllx	%o2,	0x08,	%o7
	udivcc	%g1,	0x1C34,	%l0
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	sdivx	%g3,	0x1FAD,	%i6
	lduh	[%l7 + 0x34],	%o3
	nop
	set	0x26, %l0
	ldub	[%l7 + %l0],	%i3
	udiv	%l1,	0x01A9,	%i4
	fmovsne	%icc,	%f2,	%f1
	array8	%o1,	%i7,	%o6
	movpos	%icc,	%l3,	%g5
	addc	%i1,	%l5,	%i2
	xnor	%g2,	%i5,	%g4
	subcc	%g7,	0x0A5B,	%l6
	fmovsleu	%xcc,	%f15,	%f24
	movl	%xcc,	%g6,	%l2
	edge8n	%o5,	%l4,	%o0
	ldx	[%l7 + 0x78],	%o2
	edge32l	%o7,	%g1,	%o4
	fabss	%f2,	%f4
	ldd	[%l7 + 0x68],	%l0
	sub	%g3,	%i6,	%i0
	fmovdne	%xcc,	%f9,	%f31
	or	%o3,	0x1720,	%i3
	fabsd	%f8,	%f10
	subcc	%i4,	%o1,	%i7
	edge32ln	%o6,	%l3,	%l1
	xnorcc	%g5,	0x0272,	%l5
	edge16	%i2,	%g2,	%i1
	fmul8x16au	%f20,	%f10,	%f4
	srax	%i5,	0x03,	%g4
	udivcc	%l6,	0x1E12,	%g7
	movrne	%g6,	%l2,	%o5
	edge8	%l4,	%o2,	%o0
	stw	%o7,	[%l7 + 0x6C]
	movrgz	%g1,	%l0,	%o4
	udiv	%g3,	0x1D6E,	%i6
	stw	%o3,	[%l7 + 0x10]
	smulcc	%i0,	0x0092,	%i3
	fmovsleu	%xcc,	%f6,	%f15
	ldd	[%l7 + 0x50],	%f24
	stb	%o1,	[%l7 + 0x13]
	movneg	%xcc,	%i4,	%i7
	array8	%o6,	%l1,	%g5
	edge16l	%l5,	%i2,	%l3
	fpsub32	%f8,	%f10,	%f4
	fornot1s	%f13,	%f4,	%f4
	xorcc	%g2,	%i1,	%g4
	xorcc	%l6,	%i5,	%g6
	stw	%l2,	[%l7 + 0x30]
	ld	[%l7 + 0x7C],	%f28
	fandnot1s	%f7,	%f11,	%f8
	fnors	%f3,	%f3,	%f3
	lduw	[%l7 + 0x6C],	%g7
	sir	0x0999
	addc	%o5,	%l4,	%o2
	save %o0, %o7, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o4,	%g3,	%g1
	udivx	%i6,	0x1AE7,	%i0
	std	%f4,	[%l7 + 0x20]
	sth	%i3,	[%l7 + 0x64]
	bshuffle	%f8,	%f24,	%f20
	ldd	[%l7 + 0x38],	%f22
	mulx	%o1,	0x178B,	%i4
	fandnot1	%f10,	%f18,	%f12
	array16	%o3,	%o6,	%i7
	movle	%icc,	%g5,	%l5
	smulcc	%l1,	%l3,	%i2
	sdivx	%g2,	0x0A4C,	%g4
	fnot1s	%f23,	%f15
	sll	%l6,	%i1,	%i5
	array32	%l2,	%g7,	%o5
	sth	%g6,	[%l7 + 0x36]
	andcc	%l4,	0x1753,	%o2
	stb	%o7,	[%l7 + 0x21]
	st	%f27,	[%l7 + 0x38]
	lduh	[%l7 + 0x0A],	%o0
	fmovsvs	%icc,	%f28,	%f1
	fmul8x16	%f31,	%f18,	%f24
	save %l0, %o4, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i6,	%i0,	%i3
	subc	%g3,	0x13D5,	%i4
	movcs	%icc,	%o3,	%o6
	fmovde	%xcc,	%f3,	%f4
	alignaddrl	%o1,	%i7,	%l5
	ldub	[%l7 + 0x1F],	%g5
	andcc	%l3,	%i2,	%l1
	movrlz	%g2,	%g4,	%l6
	edge32n	%i5,	%i1,	%g7
	sdivcc	%l2,	0x07C7,	%o5
	movcc	%xcc,	%l4,	%o2
	subccc	%g6,	%o0,	%o7
	movvs	%icc,	%l0,	%g1
	addccc	%o4,	0x0E53,	%i6
	fmovdcs	%xcc,	%f1,	%f3
	edge16n	%i0,	%i3,	%i4
	movleu	%xcc,	%o3,	%g3
	xnor	%o6,	0x085C,	%o1
	movneg	%icc,	%l5,	%i7
	fnand	%f16,	%f16,	%f18
	edge8ln	%l3,	%g5,	%l1
	nop
	set	0x48, %o4
	stw	%i2,	[%l7 + %o4]
	fnot1	%f0,	%f8
	srax	%g4,	%g2,	%l6
	fpadd32s	%f1,	%f12,	%f18
	fpack16	%f20,	%f17
	orncc	%i1,	%g7,	%l2
	edge32l	%o5,	%i5,	%o2
	stw	%l4,	[%l7 + 0x44]
	mova	%xcc,	%g6,	%o0
	movge	%icc,	%l0,	%g1
	orncc	%o7,	%o4,	%i6
	edge32	%i0,	%i3,	%i4
	fpack32	%f18,	%f16,	%f26
	udivx	%o3,	0x1BD4,	%g3
	andcc	%o1,	0x0438,	%o6
	ld	[%l7 + 0x54],	%f30
	fmovde	%xcc,	%f2,	%f11
	mulx	%i7,	0x0828,	%l3
	nop
	set	0x2D, %i0
	ldub	[%l7 + %i0],	%l5
	fmovsa	%xcc,	%f20,	%f7
	sll	%g5,	%l1,	%i2
	movl	%icc,	%g4,	%g2
	movneg	%xcc,	%l6,	%i1
	fnand	%f14,	%f2,	%f30
	edge32	%g7,	%o5,	%l2
	edge16ln	%i5,	%o2,	%l4
	fones	%f31
	restore %o0, %g6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f14,	[%l7 + 0x18]
	alignaddr	%l0,	%o7,	%o4
	movcc	%xcc,	%i6,	%i0
	fand	%f6,	%f2,	%f20
	edge32	%i4,	%i3,	%g3
	stx	%o3,	[%l7 + 0x58]
	andn	%o6,	0x039C,	%i7
	ldub	[%l7 + 0x3A],	%o1
	fmovdg	%xcc,	%f25,	%f5
	sdivcc	%l3,	0x135F,	%g5
	ldub	[%l7 + 0x27],	%l5
	fmovdgu	%icc,	%f25,	%f26
	udiv	%i2,	0x1C4E,	%g4
	movleu	%xcc,	%l1,	%l6
	edge16l	%i1,	%g7,	%o5
	subc	%l2,	%g2,	%o2
	fmovrsgz	%i5,	%f19,	%f11
	movgu	%xcc,	%o0,	%g6
	fpadd16s	%f25,	%f6,	%f17
	fmovdneg	%xcc,	%f16,	%f11
	fones	%f11
	fandnot1s	%f30,	%f10,	%f22
	edge32	%l4,	%g1,	%l0
	ldd	[%l7 + 0x68],	%o4
	movrgz	%i6,	%o7,	%i4
	move	%icc,	%i3,	%g3
	addc	%i0,	0x064F,	%o6
	edge16n	%o3,	%o1,	%i7
	orn	%g5,	%l5,	%l3
	fmul8sux16	%f14,	%f26,	%f4
	ldsw	[%l7 + 0x40],	%g4
	fands	%f0,	%f21,	%f10
	fzero	%f0
	smulcc	%l1,	0x074C,	%l6
	orncc	%i2,	0x1FE7,	%i1
	srax	%g7,	0x05,	%o5
	xnorcc	%g2,	0x06EC,	%l2
	movg	%icc,	%o2,	%o0
	ldx	[%l7 + 0x18],	%i5
	movl	%icc,	%l4,	%g1
	smul	%g6,	%o4,	%i6
	movrlz	%o7,	%l0,	%i3
	movcs	%xcc,	%i4,	%g3
	udivx	%i0,	0x0EF3,	%o6
	mulscc	%o1,	0x0542,	%i7
	orncc	%g5,	0x1002,	%o3
	movneg	%xcc,	%l3,	%g4
	umul	%l1,	0x0FE0,	%l6
	mulscc	%i2,	%i1,	%l5
	andcc	%g7,	%o5,	%g2
	subccc	%o2,	%o0,	%i5
	srax	%l2,	0x1B,	%l4
	movleu	%xcc,	%g6,	%g1
	fmovsne	%icc,	%f21,	%f22
	movgu	%xcc,	%i6,	%o7
	andn	%l0,	%o4,	%i4
	movpos	%xcc,	%g3,	%i0
	movne	%icc,	%o6,	%o1
	movg	%icc,	%i3,	%i7
	fmovrslz	%o3,	%f11,	%f5
	movl	%icc,	%l3,	%g4
	sll	%g5,	0x18,	%l6
	edge16	%l1,	%i1,	%i2
	movle	%xcc,	%l5,	%o5
	fmovse	%xcc,	%f26,	%f18
	subc	%g2,	%o2,	%o0
	fmovdg	%xcc,	%f18,	%f18
	mulscc	%i5,	0x1938,	%l2
	fmovd	%f18,	%f22
	alignaddr	%l4,	%g6,	%g1
	save %i6, %o7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o4,	%i4,	%g3
	movleu	%xcc,	%i0,	%l0
	mova	%icc,	%o6,	%o1
	umulcc	%i3,	0x048D,	%o3
	and	%l3,	0x0E0C,	%i7
	fcmple32	%f8,	%f22,	%g5
	movn	%icc,	%g4,	%l6
	andn	%i1,	0x1D45,	%i2
	ldsh	[%l7 + 0x2C],	%l5
	orn	%o5,	0x19DE,	%l1
	ldx	[%l7 + 0x40],	%g2
	fmovrslz	%o0,	%f11,	%f5
	mova	%xcc,	%i5,	%o2
	fxor	%f6,	%f4,	%f30
	and	%l2,	0x0540,	%l4
	array32	%g6,	%i6,	%o7
	srlx	%g7,	%o4,	%g1
	ldsb	[%l7 + 0x0A],	%g3
	array16	%i4,	%l0,	%o6
	fands	%f15,	%f0,	%f8
	movg	%icc,	%i0,	%o1
	save %i3, %o3, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%g5,	%f30,	%f28
	fmovrdlz	%i7,	%f14,	%f8
	movrlz	%g4,	%l6,	%i2
	alignaddrl	%i1,	%o5,	%l5
	ld	[%l7 + 0x64],	%f27
	movpos	%xcc,	%l1,	%g2
	subcc	%i5,	%o0,	%o2
	udivx	%l4,	0x16B3,	%g6
	movle	%xcc,	%i6,	%o7
	sdivx	%l2,	0x151D,	%g7
	fmovdl	%xcc,	%f14,	%f18
	fcmps	%fcc0,	%f14,	%f20
	alignaddrl	%o4,	%g3,	%i4
	mova	%xcc,	%l0,	%g1
	smulcc	%o6,	0x03D1,	%i0
	ld	[%l7 + 0x74],	%f26
	edge32ln	%i3,	%o3,	%l3
	addccc	%o1,	%g5,	%g4
	fmovrdlz	%i7,	%f2,	%f8
	fmovscs	%xcc,	%f25,	%f28
	subcc	%l6,	0x048C,	%i1
	fmovrse	%i2,	%f27,	%f1
	udivcc	%l5,	0x0D98,	%l1
	addccc	%o5,	0x1F6B,	%g2
	addccc	%o0,	0x1CE4,	%o2
	lduw	[%l7 + 0x58],	%i5
	ldd	[%l7 + 0x48],	%l4
	sth	%i6,	[%l7 + 0x40]
	edge32	%g6,	%o7,	%l2
	sra	%o4,	%g7,	%i4
	movcs	%xcc,	%l0,	%g1
	movneg	%icc,	%g3,	%i0
	xnor	%o6,	0x1133,	%o3
	fpsub32	%f14,	%f6,	%f6
	movrgez	%i3,	%o1,	%l3
	udivcc	%g4,	0x12BE,	%g5
	add	%i7,	0x1E50,	%l6
	movg	%xcc,	%i2,	%i1
	popc	0x0B2D,	%l5
	lduw	[%l7 + 0x70],	%o5
	xorcc	%l1,	0x004C,	%g2
	smul	%o2,	0x194C,	%o0
	andcc	%i5,	0x172E,	%l4
	fcmps	%fcc2,	%f27,	%f7
	lduh	[%l7 + 0x08],	%g6
	edge8ln	%i6,	%l2,	%o7
	sra	%o4,	%i4,	%g7
	movne	%icc,	%l0,	%g3
	ldsw	[%l7 + 0x18],	%i0
	edge8n	%g1,	%o3,	%i3
	fzero	%f28
	alignaddrl	%o6,	%o1,	%l3
	edge16n	%g5,	%g4,	%i7
	edge8	%i2,	%l6,	%l5
	movge	%xcc,	%o5,	%i1
	edge16	%l1,	%o2,	%g2
	sdivcc	%i5,	0x1F00,	%l4
	ldd	[%l7 + 0x30],	%g6
	fmovsvc	%icc,	%f21,	%f17
	stb	%o0,	[%l7 + 0x7B]
	pdist	%f22,	%f24,	%f16
	movcc	%xcc,	%i6,	%l2
	movrne	%o7,	%o4,	%g7
	srax	%l0,	%i4,	%i0
	array8	%g3,	%g1,	%i3
	xor	%o6,	%o3,	%o1
	nop
	set	0x38, %g2
	ldsw	[%l7 + %g2],	%g5
	subc	%g4,	%l3,	%i2
	movrlz	%i7,	%l6,	%l5
	sethi	0x1A13,	%o5
	movneg	%icc,	%i1,	%l1
	fcmped	%fcc1,	%f20,	%f28
	edge16l	%g2,	%i5,	%o2
	stw	%g6,	[%l7 + 0x6C]
	mova	%icc,	%l4,	%i6
	fmovdpos	%icc,	%f16,	%f11
	udiv	%o0,	0x0F07,	%o7
	fpack32	%f8,	%f6,	%f18
	sll	%l2,	%g7,	%o4
	stb	%l0,	[%l7 + 0x47]
	fpadd32s	%f22,	%f10,	%f5
	sra	%i0,	%g3,	%i4
	save %g1, 0x17BF, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i3,	0x12A0,	%o1
	array8	%g5,	%g4,	%l3
	movvc	%icc,	%o3,	%i2
	srlx	%i7,	%l5,	%o5
	stb	%i1,	[%l7 + 0x78]
	subccc	%l1,	0x158B,	%l6
	edge16l	%g2,	%i5,	%o2
	alignaddr	%l4,	%g6,	%i6
	sir	0x1260
	fmul8sux16	%f28,	%f2,	%f28
	subccc	%o7,	0x0CFB,	%l2
	addc	%o0,	0x0F95,	%o4
	xnorcc	%l0,	0x18B3,	%i0
	fcmpd	%fcc1,	%f26,	%f12
	sth	%g7,	[%l7 + 0x1C]
	umulcc	%i4,	%g1,	%o6
	ldsh	[%l7 + 0x5A],	%g3
	xnor	%o1,	0x18DC,	%i3
	add	%g5,	0x01DC,	%l3
	movneg	%xcc,	%g4,	%o3
	sethi	0x0766,	%i7
	movle	%icc,	%l5,	%o5
	fmovrde	%i2,	%f0,	%f24
	sth	%l1,	[%l7 + 0x60]
	fmovde	%icc,	%f7,	%f7
	fxors	%f14,	%f2,	%f7
	move	%xcc,	%l6,	%i1
	addcc	%g2,	0x094B,	%i5
	ldd	[%l7 + 0x20],	%f28
	udiv	%o2,	0x0B48,	%g6
	ldsw	[%l7 + 0x24],	%l4
	movpos	%icc,	%o7,	%l2
	ldsb	[%l7 + 0x36],	%o0
	array8	%i6,	%o4,	%i0
	movleu	%xcc,	%l0,	%i4
	ldx	[%l7 + 0x50],	%g7
	fnegs	%f26,	%f0
	movvc	%xcc,	%g1,	%g3
	fmovse	%icc,	%f6,	%f16
	movrgez	%o6,	0x3C8,	%o1
	movne	%icc,	%i3,	%g5
	or	%l3,	%g4,	%o3
	movgu	%icc,	%i7,	%l5
	edge16n	%o5,	%i2,	%l1
	fmul8x16al	%f10,	%f12,	%f14
	mulscc	%i1,	0x1575,	%g2
	ldub	[%l7 + 0x3A],	%l6
	fones	%f1
	movrgez	%i5,	%o2,	%g6
	movge	%xcc,	%l4,	%o7
	ldd	[%l7 + 0x08],	%f6
	movge	%icc,	%o0,	%i6
	fmovsvs	%xcc,	%f25,	%f12
	fsrc1	%f6,	%f12
	fmovrsne	%o4,	%f26,	%f11
	edge32ln	%l2,	%l0,	%i0
	fnot1s	%f6,	%f1
	fmul8x16al	%f20,	%f16,	%f16
	fmovsa	%xcc,	%f4,	%f11
	movl	%icc,	%g7,	%i4
	lduw	[%l7 + 0x18],	%g1
	move	%xcc,	%g3,	%o1
	fmovsa	%xcc,	%f6,	%f22
	edge8l	%i3,	%o6,	%l3
	fmul8x16al	%f28,	%f0,	%f8
	sdiv	%g4,	0x1BC4,	%g5
	fmovrdlz	%i7,	%f4,	%f8
	movre	%l5,	0x1D4,	%o3
	or	%i2,	%o5,	%i1
	sir	0x0073
	movrlez	%g2,	%l1,	%i5
	mulscc	%o2,	%l6,	%g6
	movrgez	%o7,	%l4,	%o0
	fmovse	%xcc,	%f18,	%f21
	movneg	%xcc,	%i6,	%l2
	movrgz	%o4,	0x3A2,	%l0
	array16	%g7,	%i4,	%i0
	edge32	%g1,	%o1,	%g3
	edge16	%o6,	%l3,	%g4
	mulscc	%i3,	0x0D40,	%g5
	subc	%i7,	%l5,	%o3
	array32	%o5,	%i2,	%i1
	movvs	%xcc,	%l1,	%g2
	movne	%icc,	%o2,	%i5
	edge16	%l6,	%g6,	%l4
	fmovrsgz	%o0,	%f6,	%f6
	edge8l	%i6,	%l2,	%o7
	movre	%l0,	%o4,	%i4
	fornot2	%f24,	%f4,	%f4
	movvs	%xcc,	%i0,	%g1
	andncc	%o1,	%g3,	%g7
	edge32	%o6,	%g4,	%i3
	lduw	[%l7 + 0x58],	%l3
	sub	%g5,	%l5,	%i7
	movgu	%xcc,	%o5,	%i2
	ldub	[%l7 + 0x68],	%o3
	st	%f11,	[%l7 + 0x68]
	and	%l1,	0x0BA2,	%g2
	umul	%i1,	0x1CD4,	%o2
	smul	%l6,	0x1CFC,	%i5
	ldsh	[%l7 + 0x62],	%l4
	move	%icc,	%g6,	%i6
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	fornot2s	%f7,	%f13,	%f11
	fcmpeq32	%f2,	%f20,	%o7
	udivx	%o4,	0x149C,	%i0
	ldd	[%l7 + 0x18],	%f22
	addcc	%g1,	0x1328,	%i4
	fmovsl	%xcc,	%f12,	%f27
	addc	%g3,	0x071C,	%g7
	alignaddrl	%o1,	%o6,	%i3
	subc	%g4,	0x0989,	%g5
	fmul8x16	%f21,	%f28,	%f0
	mulscc	%l3,	0x132E,	%i7
	sir	0x078B
	ldsh	[%l7 + 0x24],	%l5
	edge8ln	%i2,	%o5,	%l1
	sll	%g2,	0x1B,	%o3
	sir	0x1364
	movvs	%icc,	%o2,	%i1
	orcc	%l6,	%l4,	%g6
	fones	%f17
	fxnor	%f28,	%f6,	%f18
	fpsub32	%f28,	%f12,	%f28
	move	%icc,	%i5,	%i6
	lduh	[%l7 + 0x6C],	%o0
	movvs	%xcc,	%l2,	%o7
	lduh	[%l7 + 0x0A],	%l0
	fmovsneg	%xcc,	%f6,	%f17
	movle	%icc,	%i0,	%o4
	sdivx	%g1,	0x0A38,	%g3
	sir	0x19CA
	sra	%g7,	%o1,	%i4
	restore %i3, 0x1F44, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%g5,	%l3
	mova	%xcc,	%i7,	%l5
	fexpand	%f20,	%f10
	movcs	%icc,	%g4,	%i2
	fmovsa	%xcc,	%f25,	%f18
	orncc	%l1,	%g2,	%o3
	fmovsgu	%xcc,	%f14,	%f27
	movrgez	%o5,	%o2,	%l6
	srlx	%i1,	0x14,	%l4
	xor	%g6,	%i6,	%o0
	srlx	%l2,	0x19,	%i5
	fpsub32s	%f29,	%f5,	%f7
	fmul8x16	%f17,	%f24,	%f16
	edge32l	%o7,	%l0,	%o4
	orn	%i0,	0x1EA5,	%g3
	edge32n	%g1,	%g7,	%i4
	nop
	set	0x38, %l3
	ldx	[%l7 + %l3],	%o1
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	fmul8x16al	%f30,	%f13,	%f4
	movne	%icc,	%g5,	%i7
	mova	%xcc,	%l3,	%l5
	edge16n	%g4,	%i2,	%l1
	mova	%icc,	%o3,	%o5
	smulcc	%o2,	0x1A15,	%g2
	alignaddr	%l6,	%i1,	%g6
	fcmpd	%fcc1,	%f12,	%f20
	for	%f20,	%f6,	%f22
	fands	%f9,	%f29,	%f17
	fnors	%f19,	%f1,	%f8
	udivx	%l4,	0x026D,	%o0
	mulscc	%i6,	0x0AFE,	%i5
	st	%f18,	[%l7 + 0x34]
	lduh	[%l7 + 0x2C],	%o7
	ldd	[%l7 + 0x20],	%l2
	fmovrdgz	%l0,	%f8,	%f4
	popc	%o4,	%i0
	fmovdcc	%xcc,	%f11,	%f26
	udiv	%g3,	0x06F1,	%g1
	fmovsn	%icc,	%f25,	%f26
	edge16	%g7,	%i4,	%o1
	xnorcc	%o6,	%i3,	%g5
	movcs	%icc,	%l3,	%i7
	movpos	%icc,	%l5,	%g4
	fnors	%f23,	%f29,	%f28
	movne	%xcc,	%i2,	%l1
	fabsd	%f24,	%f14
	sth	%o5,	[%l7 + 0x3C]
	addc	%o3,	0x153E,	%g2
	movcs	%icc,	%o2,	%i1
	subc	%l6,	%l4,	%o0
	fmovrdlz	%i6,	%f14,	%f18
	movrgez	%g6,	%o7,	%i5
	srlx	%l0,	0x03,	%o4
	addcc	%l2,	%i0,	%g1
	movn	%xcc,	%g3,	%i4
	orcc	%g7,	%o6,	%i3
	sub	%o1,	0x170A,	%l3
	movrne	%g5,	0x190,	%l5
	movgu	%icc,	%i7,	%g4
	sub	%i2,	0x1136,	%o5
	movgu	%xcc,	%o3,	%g2
	array8	%l1,	%o2,	%i1
	addcc	%l6,	0x029C,	%o0
	movl	%xcc,	%i6,	%g6
	orcc	%l4,	%i5,	%o7
	smul	%o4,	0x1AD9,	%l2
	ldsw	[%l7 + 0x34],	%l0
	movn	%xcc,	%g1,	%i0
	ldsw	[%l7 + 0x6C],	%g3
	fmovsg	%icc,	%f30,	%f4
	ldd	[%l7 + 0x38],	%i4
	udivcc	%g7,	0x1A90,	%i3
	std	%f30,	[%l7 + 0x38]
	sdiv	%o1,	0x1F62,	%o6
	fcmpgt16	%f10,	%f20,	%g5
	umulcc	%l5,	0x1B80,	%l3
	sdiv	%g4,	0x116A,	%i2
	fsrc2s	%f25,	%f6
	umul	%i7,	0x0629,	%o5
	sllx	%o3,	0x0B,	%l1
	edge8l	%o2,	%i1,	%g2
	ld	[%l7 + 0x28],	%f0
	or	%l6,	%i6,	%o0
	andncc	%g6,	%l4,	%o7
	ldsb	[%l7 + 0x61],	%o4
	ldd	[%l7 + 0x60],	%f0
	movre	%i5,	0x211,	%l0
	udiv	%g1,	0x1E81,	%i0
	fmuld8sux16	%f5,	%f30,	%f14
	alignaddr	%l2,	%i4,	%g7
	orncc	%g3,	0x1AA9,	%i3
	sra	%o1,	0x0C,	%g5
	and	%l5,	%o6,	%g4
	fsrc2s	%f12,	%f3
	mova	%xcc,	%l3,	%i7
	fcmpeq16	%f6,	%f30,	%o5
	sdivcc	%o3,	0x1418,	%l1
	movgu	%xcc,	%i2,	%o2
	st	%f29,	[%l7 + 0x64]
	smul	%g2,	0x0D20,	%i1
	addccc	%i6,	0x08A2,	%l6
	siam	0x6
	smul	%o0,	%l4,	%o7
	xor	%g6,	0x035F,	%i5
	fcmple32	%f8,	%f8,	%o4
	edge16ln	%g1,	%l0,	%l2
	sethi	0x03DE,	%i4
	udivx	%g7,	0x0170,	%i0
	fmovsvc	%icc,	%f25,	%f13
	movvc	%xcc,	%g3,	%o1
	movrlz	%g5,	0x076,	%l5
	srl	%i3,	0x0B,	%g4
	fmovdcc	%icc,	%f21,	%f4
	array32	%o6,	%i7,	%o5
	fornot1s	%f9,	%f28,	%f1
	and	%l3,	0x1267,	%o3
	andncc	%l1,	%i2,	%g2
	sth	%o2,	[%l7 + 0x36]
	srl	%i1,	%i6,	%o0
	fxnor	%f18,	%f14,	%f20
	mulx	%l4,	%l6,	%g6
	edge16	%o7,	%i5,	%g1
	edge8n	%l0,	%o4,	%l2
	move	%xcc,	%i4,	%i0
	xorcc	%g7,	0x00F9,	%o1
	movcc	%xcc,	%g5,	%g3
	stb	%l5,	[%l7 + 0x44]
	andn	%i3,	%g4,	%i7
	movg	%xcc,	%o6,	%o5
	fornot1	%f22,	%f4,	%f16
	fzero	%f28
	fxnor	%f8,	%f0,	%f26
	ldd	[%l7 + 0x10],	%f14
	umul	%l3,	%l1,	%o3
	movrgz	%g2,	%i2,	%i1
	stw	%i6,	[%l7 + 0x24]
	fcmpne32	%f30,	%f16,	%o0
	move	%icc,	%l4,	%o2
	edge32ln	%g6,	%l6,	%o7
	addccc	%g1,	0x071D,	%i5
	subcc	%l0,	0x0F3F,	%l2
	ld	[%l7 + 0x08],	%f20
	and	%o4,	0x181B,	%i4
	subccc	%i0,	0x02D8,	%o1
	edge16	%g7,	%g5,	%g3
	fmul8ulx16	%f6,	%f14,	%f16
	movcs	%icc,	%l5,	%i3
	move	%xcc,	%g4,	%i7
	edge16ln	%o6,	%l3,	%l1
	fmovrdlz	%o5,	%f30,	%f16
	umulcc	%g2,	0x0749,	%o3
	fmovdle	%xcc,	%f24,	%f14
	ldsh	[%l7 + 0x1C],	%i2
	add	%i6,	%o0,	%i1
	orn	%l4,	0x02A0,	%g6
	movn	%xcc,	%l6,	%o2
	ld	[%l7 + 0x2C],	%f6
	sth	%g1,	[%l7 + 0x5A]
	fnor	%f30,	%f24,	%f12
	nop
	set	0x2A, %i5
	stb	%i5,	[%l7 + %i5]
	add	%l0,	0x0872,	%o7
	fmul8x16al	%f20,	%f27,	%f20
	fcmped	%fcc3,	%f16,	%f16
	array16	%l2,	%o4,	%i4
	addcc	%i0,	0x190C,	%o1
	sub	%g7,	%g3,	%g5
	fnot1s	%f27,	%f10
	fmovrdgz	%i3,	%f16,	%f14
	movg	%icc,	%l5,	%i7
	sdiv	%o6,	0x06B1,	%g4
	movneg	%icc,	%l1,	%o5
	stx	%l3,	[%l7 + 0x70]
	ldsw	[%l7 + 0x3C],	%o3
	sir	0x19AD
	fpack32	%f0,	%f30,	%f18
	edge32	%i2,	%g2,	%i6
	xor	%o0,	%i1,	%g6
	array32	%l6,	%l4,	%o2
	udivx	%i5,	0x197F,	%l0
	fmovdvs	%xcc,	%f22,	%f7
	fmovdpos	%xcc,	%f8,	%f1
	edge32	%o7,	%g1,	%l2
	fmovrdne	%i4,	%f0,	%f14
	sth	%i0,	[%l7 + 0x12]
	srax	%o1,	0x1A,	%g7
	edge16ln	%g3,	%g5,	%i3
	movl	%xcc,	%l5,	%i7
	edge16ln	%o6,	%o4,	%l1
	movcc	%icc,	%o5,	%l3
	smul	%o3,	%i2,	%g4
	array8	%i6,	%o0,	%g2
	movne	%xcc,	%i1,	%g6
	sdivx	%l6,	0x16FD,	%o2
	movvc	%icc,	%i5,	%l0
	edge32	%o7,	%l4,	%g1
	fmovrdgz	%i4,	%f4,	%f0
	movrgz	%l2,	%i0,	%g7
	edge8ln	%o1,	%g3,	%g5
	srax	%l5,	%i7,	%i3
	fmovrsgz	%o6,	%f26,	%f6
	nop
	set	0x4A, %g4
	ldsh	[%l7 + %g4],	%l1
	edge16ln	%o4,	%o5,	%l3
	and	%o3,	0x0C50,	%i2
	fmovrsne	%i6,	%f21,	%f28
	subcc	%o0,	0x19E9,	%g2
	movne	%xcc,	%i1,	%g6
	or	%l6,	0x05D6,	%o2
	edge16n	%g4,	%i5,	%l0
	sth	%l4,	[%l7 + 0x22]
	sethi	0x0DDC,	%o7
	andn	%i4,	%g1,	%i0
	edge32l	%g7,	%o1,	%g3
	movgu	%xcc,	%g5,	%l5
	edge16	%i7,	%i3,	%l2
	ldsb	[%l7 + 0x6E],	%o6
	edge16n	%o4,	%o5,	%l1
	fcmpeq16	%f26,	%f20,	%o3
	subccc	%l3,	%i6,	%o0
	fandnot1s	%f28,	%f11,	%f24
	edge16l	%g2,	%i2,	%i1
	save %l6, 0x08BC, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%g4,	%f16,	%f12
	fmovsa	%icc,	%f16,	%f30
	fabss	%f2,	%f5
	movvs	%xcc,	%i5,	%o2
	movneg	%xcc,	%l4,	%o7
	fmovrsne	%i4,	%f8,	%f14
	fmovrsne	%l0,	%f25,	%f18
	orncc	%g1,	0x156A,	%g7
	fpack16	%f14,	%f6
	smul	%i0,	0x13B7,	%g3
	movleu	%xcc,	%o1,	%l5
	fpack16	%f0,	%f5
	sra	%g5,	%i3,	%i7
	orn	%l2,	%o6,	%o4
	fexpand	%f17,	%f0
	lduh	[%l7 + 0x70],	%l1
	ldd	[%l7 + 0x70],	%f10
	mova	%icc,	%o3,	%l3
	movge	%icc,	%i6,	%o0
	fmovda	%icc,	%f6,	%f13
	std	%f10,	[%l7 + 0x08]
	udiv	%g2,	0x017B,	%o5
	umulcc	%i1,	%l6,	%i2
	fnand	%f0,	%f28,	%f10
	sub	%g4,	0x186C,	%g6
	sll	%o2,	%i5,	%l4
	addc	%i4,	0x08FF,	%l0
	stw	%g1,	[%l7 + 0x70]
	udivcc	%g7,	0x1953,	%i0
	stw	%g3,	[%l7 + 0x64]
	addcc	%o7,	0x0755,	%l5
	movpos	%xcc,	%o1,	%i3
	array32	%g5,	%l2,	%i7
	array32	%o4,	%o6,	%l1
	add	%o3,	%l3,	%o0
	edge16ln	%g2,	%i6,	%i1
	subccc	%o5,	0x04E3,	%i2
	fmovdge	%xcc,	%f5,	%f26
	udivcc	%g4,	0x1292,	%l6
	edge32l	%g6,	%o2,	%i5
	movre	%i4,	%l0,	%l4
	sra	%g1,	0x1B,	%i0
	fmul8x16	%f13,	%f2,	%f28
	edge8	%g7,	%o7,	%g3
	fpsub16	%f22,	%f10,	%f16
	fcmple16	%f8,	%f4,	%l5
	fmovrdgz	%o1,	%f18,	%f12
	movpos	%xcc,	%g5,	%i3
	edge16n	%l2,	%o4,	%i7
	fmovscc	%icc,	%f28,	%f15
	fmul8x16al	%f2,	%f12,	%f30
	fpadd32s	%f30,	%f12,	%f18
	ldsw	[%l7 + 0x70],	%l1
	udiv	%o6,	0x1D5B,	%o3
	fcmpgt32	%f20,	%f0,	%l3
	fornot2s	%f3,	%f13,	%f17
	nop
	set	0x4A, %g6
	sth	%o0,	[%l7 + %g6]
	movge	%icc,	%g2,	%i1
	smul	%i6,	%o5,	%i2
	fsrc2	%f18,	%f20
	edge16l	%l6,	%g6,	%o2
	movl	%xcc,	%g4,	%i5
	edge16l	%l0,	%i4,	%g1
	fmovdn	%xcc,	%f6,	%f25
	movleu	%xcc,	%l4,	%g7
	movgu	%xcc,	%o7,	%i0
	fmovsl	%xcc,	%f0,	%f21
	edge16ln	%l5,	%g3,	%g5
	edge32ln	%i3,	%l2,	%o4
	sra	%i7,	%o1,	%o6
	xnorcc	%o3,	0x1505,	%l3
	stw	%l1,	[%l7 + 0x2C]
	addcc	%o0,	%g2,	%i1
	ldub	[%l7 + 0x64],	%o5
	sub	%i6,	%l6,	%i2
	xnor	%g6,	0x0B4A,	%g4
	sra	%o2,	%i5,	%l0
	movle	%icc,	%g1,	%l4
	st	%f28,	[%l7 + 0x50]
	fmuld8ulx16	%f31,	%f9,	%f22
	edge16n	%g7,	%i4,	%i0
	fones	%f11
	movl	%xcc,	%l5,	%o7
	fmovdvs	%xcc,	%f1,	%f31
	for	%f12,	%f30,	%f4
	movrgz	%g5,	%i3,	%g3
	ldsh	[%l7 + 0x3E],	%o4
	fmuld8sux16	%f23,	%f15,	%f6
	alignaddr	%l2,	%o1,	%o6
	edge8ln	%o3,	%i7,	%l1
	subccc	%o0,	0x1F95,	%l3
	movre	%i1,	0x0A6,	%o5
	mulx	%i6,	0x1482,	%l6
	movrlez	%i2,	%g6,	%g4
	sir	0x1117
	ldub	[%l7 + 0x17],	%o2
	or	%i5,	%g2,	%g1
	ldd	[%l7 + 0x28],	%l4
	xnor	%l0,	0x183F,	%g7
	fcmpne32	%f18,	%f8,	%i0
	ldsh	[%l7 + 0x3E],	%l5
	fmovsl	%xcc,	%f20,	%f20
	fnegs	%f1,	%f10
	orncc	%i4,	0x099C,	%g5
	add	%o7,	0x16DA,	%i3
	sub	%g3,	%o4,	%o1
	fmovrde	%o6,	%f12,	%f22
	fpmerge	%f13,	%f24,	%f2
	mulscc	%l2,	0x0309,	%o3
	array32	%l1,	%o0,	%i7
	udivx	%l3,	0x1912,	%o5
	lduh	[%l7 + 0x64],	%i1
	restore %l6, 0x0D57, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f10,	%f28,	%i2
	edge32	%g6,	%o2,	%i5
	and	%g2,	0x0388,	%g1
	fxnor	%f4,	%f6,	%f6
	smul	%g4,	%l0,	%g7
	movrgz	%i0,	0x23C,	%l4
	array16	%l5,	%g5,	%o7
	array8	%i4,	%i3,	%o4
	smul	%g3,	%o6,	%l2
	fmovs	%f19,	%f12
	edge8	%o3,	%o1,	%o0
	sll	%l1,	%i7,	%o5
	movrne	%i1,	%l6,	%l3
	array16	%i2,	%g6,	%i6
	and	%i5,	0x08FD,	%o2
	stx	%g2,	[%l7 + 0x78]
	fmul8sux16	%f2,	%f8,	%f18
	edge8	%g1,	%l0,	%g4
	udiv	%g7,	0x1FAB,	%i0
	movrgez	%l4,	0x3C3,	%g5
	srax	%l5,	%o7,	%i4
	movrlez	%i3,	%o4,	%o6
	andncc	%g3,	%l2,	%o3
	movre	%o0,	0x1D4,	%l1
	fand	%f14,	%f14,	%f4
	array8	%o1,	%i7,	%o5
	edge32	%l6,	%i1,	%l3
	fmovdpos	%xcc,	%f27,	%f23
	sdivx	%g6,	0x1E91,	%i2
	movre	%i5,	%o2,	%g2
	fmovrsgz	%g1,	%f15,	%f5
	andn	%l0,	%g4,	%i6
	st	%f0,	[%l7 + 0x28]
	fcmps	%fcc3,	%f2,	%f21
	or	%g7,	%i0,	%g5
	srax	%l4,	%l5,	%i4
	movn	%icc,	%o7,	%o4
	nop
	set	0x7F, %g1
	ldub	[%l7 + %g1],	%i3
	edge16ln	%o6,	%g3,	%l2
	movleu	%icc,	%o3,	%o0
	movcc	%icc,	%l1,	%o1
	addccc	%o5,	0x1F8A,	%l6
	xor	%i7,	0x1C77,	%i1
	edge8l	%g6,	%i2,	%i5
	udivx	%o2,	0x071F,	%l3
	fmovs	%f24,	%f6
	stx	%g1,	[%l7 + 0x70]
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	edge8	%g2,	%g7,	%i0
	movne	%icc,	%i6,	%g5
	srl	%l4,	%i4,	%o7
	udivcc	%l5,	0x1C01,	%i3
	ld	[%l7 + 0x70],	%f11
	movrgez	%o4,	%o6,	%g3
	fmovrslez	%l2,	%f16,	%f12
	stx	%o0,	[%l7 + 0x30]
	movle	%xcc,	%o3,	%o1
	movvs	%xcc,	%o5,	%l6
	smulcc	%l1,	0x142E,	%i1
	movrne	%g6,	0x37B,	%i2
	sdivcc	%i5,	0x06BD,	%o2
	subc	%i7,	0x1B57,	%l3
	array32	%g1,	%l0,	%g2
	move	%icc,	%g7,	%i0
	srlx	%i6,	0x05,	%g4
	fmovrslz	%g5,	%f16,	%f25
	ld	[%l7 + 0x6C],	%f5
	subccc	%l4,	%o7,	%l5
	fcmpgt32	%f4,	%f28,	%i4
	movleu	%icc,	%i3,	%o4
	popc	0x1BFB,	%g3
	fmovsgu	%xcc,	%f6,	%f29
	movvs	%icc,	%l2,	%o0
	movcs	%icc,	%o3,	%o1
	ld	[%l7 + 0x64],	%f5
	edge16	%o5,	%o6,	%l6
	umulcc	%l1,	%g6,	%i1
	srax	%i5,	%o2,	%i7
	andn	%i2,	%g1,	%l3
	array32	%l0,	%g7,	%i0
	ldsw	[%l7 + 0x74],	%i6
	edge32ln	%g4,	%g5,	%l4
	xnor	%g2,	%o7,	%i4
	movrlz	%l5,	0x20D,	%i3
	movle	%icc,	%g3,	%o4
	alignaddr	%o0,	%o3,	%o1
	fsrc2	%f20,	%f16
	fmovda	%icc,	%f11,	%f2
	array32	%o5,	%o6,	%l2
	fxors	%f31,	%f19,	%f18
	popc	0x02D6,	%l1
	sth	%g6,	[%l7 + 0x52]
	alignaddrl	%i1,	%i5,	%o2
	addcc	%l6,	%i2,	%g1
	andn	%i7,	%l3,	%l0
	subcc	%i0,	%g7,	%g4
	move	%xcc,	%g5,	%l4
	ld	[%l7 + 0x38],	%f15
	sir	0x020A
	udivcc	%g2,	0x0975,	%o7
	fmovdgu	%xcc,	%f15,	%f10
	movcc	%xcc,	%i6,	%i4
	fnot1	%f12,	%f10
	edge8l	%l5,	%g3,	%o4
	fcmpne16	%f24,	%f10,	%o0
	restore %o3, 0x0E24, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i3,	0x16E0,	%o6
	fcmpeq32	%f4,	%f2,	%o5
	edge8n	%l1,	%l2,	%i1
	movle	%xcc,	%i5,	%o2
	edge16n	%g6,	%l6,	%i2
	fmul8x16au	%f11,	%f28,	%f28
	subc	%g1,	%l3,	%i7
	addcc	%i0,	0x182A,	%g7
	save %l0, %g4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g2,	0x17,	%o7
	edge32ln	%i6,	%g5,	%l5
	subcc	%g3,	%i4,	%o0
	ld	[%l7 + 0x74],	%f23
	udivcc	%o3,	0x1821,	%o4
	popc	0x10F9,	%i3
	srlx	%o6,	%o5,	%o1
	fpadd32	%f20,	%f30,	%f14
	fornot2s	%f1,	%f9,	%f26
	stw	%l1,	[%l7 + 0x50]
	fpsub16s	%f18,	%f11,	%f26
	srlx	%i1,	%l2,	%o2
	edge16	%i5,	%l6,	%g6
	fcmple32	%f28,	%f28,	%i2
	movn	%icc,	%l3,	%g1
	fandnot1s	%f22,	%f30,	%f11
	fcmpgt16	%f0,	%f12,	%i7
	sub	%g7,	0x10C4,	%l0
	array8	%g4,	%l4,	%i0
	sra	%g2,	0x0D,	%i6
	fnot2	%f14,	%f16
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	fpadd32	%f26,	%f6,	%f6
	nop
	set	0x74, %l1
	ldsw	[%l7 + %l1],	%i4
	sdiv	%o0,	0x0DD0,	%l5
	ldd	[%l7 + 0x20],	%f22
	nop
	set	0x38, %o1
	ldx	[%l7 + %o1],	%o4
	sdiv	%i3,	0x1B39,	%o6
	andncc	%o5,	%o1,	%o3
	movcs	%icc,	%l1,	%i1
	sll	%o2,	%l2,	%i5
	fpsub32	%f26,	%f28,	%f20
	popc	%g6,	%l6
	smulcc	%l3,	%i2,	%i7
	ldsb	[%l7 + 0x18],	%g7
	movn	%xcc,	%l0,	%g1
	sllx	%g4,	0x14,	%l4
	sethi	0x02FE,	%i0
	movvc	%xcc,	%i6,	%g2
	fnegs	%f15,	%f27
	movcc	%icc,	%g5,	%g3
	movl	%xcc,	%i4,	%o7
	edge8l	%o0,	%o4,	%l5
	umulcc	%o6,	0x1801,	%o5
	mulscc	%i3,	0x036E,	%o3
	movleu	%xcc,	%l1,	%i1
	movgu	%xcc,	%o2,	%o1
	fmuld8ulx16	%f15,	%f18,	%f28
	save %l2, 0x060F, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %l6, %l3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i5,	%g7,	%l0
	xorcc	%i7,	%g1,	%g4
	andcc	%i0,	0x0B79,	%i6
	nop
	set	0x10, %i1
	std	%f16,	[%l7 + %i1]
	sir	0x1BC6
	srlx	%l4,	0x15,	%g2
	movneg	%icc,	%g5,	%g3
	fmovdcc	%icc,	%f23,	%f0
	fmovdleu	%icc,	%f23,	%f0
	smul	%i4,	0x151C,	%o0
	fmovdgu	%xcc,	%f4,	%f0
	fandnot2	%f22,	%f22,	%f28
	alignaddrl	%o7,	%l5,	%o4
	movvc	%icc,	%o5,	%o6
	addccc	%o3,	0x0DBA,	%l1
	umul	%i1,	0x0DC4,	%i3
	popc	0x1BD4,	%o2
	fmovrsne	%l2,	%f25,	%f15
	sethi	0x1129,	%g6
	movrgez	%l6,	%l3,	%o1
	movcs	%icc,	%i2,	%i5
	edge16n	%g7,	%i7,	%l0
	stx	%g4,	[%l7 + 0x60]
	or	%g1,	0x0AE0,	%i6
	udivcc	%l4,	0x1253,	%i0
	movrlez	%g2,	0x03D,	%g5
	fcmped	%fcc2,	%f24,	%f12
	stx	%i4,	[%l7 + 0x10]
	sdiv	%g3,	0x1EDD,	%o7
	movvc	%xcc,	%l5,	%o4
	movge	%icc,	%o0,	%o5
	movgu	%xcc,	%o3,	%o6
	and	%i1,	%i3,	%l1
	addccc	%o2,	%g6,	%l2
	movle	%icc,	%l6,	%l3
	movneg	%icc,	%i2,	%o1
	movvs	%icc,	%g7,	%i7
	fornot1	%f4,	%f8,	%f12
	sdivx	%l0,	0x09F0,	%g4
	or	%g1,	0x1752,	%i5
	srl	%i6,	0x1E,	%l4
	lduh	[%l7 + 0x48],	%g2
	save %i0, 0x180C, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i4,	%o7,	%g3
	subcc	%l5,	%o0,	%o5
	subccc	%o3,	%o4,	%i1
	udivcc	%o6,	0x1709,	%l1
	edge16n	%o2,	%i3,	%g6
	sethi	0x1E37,	%l6
	fors	%f28,	%f7,	%f5
	sth	%l3,	[%l7 + 0x0E]
	movrgz	%i2,	0x052,	%l2
	xorcc	%g7,	%o1,	%i7
	ld	[%l7 + 0x58],	%f13
	umul	%g4,	%l0,	%i5
	edge32ln	%g1,	%i6,	%l4
	movrgez	%i0,	0x005,	%g2
	sll	%i4,	0x0A,	%o7
	movcs	%xcc,	%g5,	%g3
	orcc	%o0,	%o5,	%l5
	orcc	%o4,	0x1DE6,	%i1
	movrlz	%o3,	0x328,	%l1
	ldub	[%l7 + 0x32],	%o6
	movcc	%icc,	%o2,	%g6
	alignaddrl	%i3,	%l6,	%i2
	ldsb	[%l7 + 0x75],	%l2
	edge16n	%l3,	%g7,	%o1
	sllx	%g4,	0x11,	%l0
	fnot2s	%f8,	%f9
	srax	%i7,	0x14,	%g1
	edge32ln	%i6,	%i5,	%l4
	array32	%g2,	%i4,	%i0
	ld	[%l7 + 0x5C],	%f20
	fmovsleu	%xcc,	%f28,	%f13
	fzeros	%f9
	ldd	[%l7 + 0x48],	%f30
	edge8l	%g5,	%o7,	%g3
	umul	%o0,	%o5,	%o4
	udivx	%l5,	0x0A8B,	%o3
	ldsb	[%l7 + 0x1D],	%i1
	fmul8x16au	%f25,	%f2,	%f14
	movge	%icc,	%o6,	%o2
	fmovsvs	%xcc,	%f29,	%f9
	movrlz	%g6,	%i3,	%l1
	movre	%i2,	%l2,	%l3
	fmovsa	%xcc,	%f14,	%f15
	stx	%g7,	[%l7 + 0x28]
	addccc	%o1,	%g4,	%l6
	sdivx	%l0,	0x1048,	%g1
	xnor	%i6,	%i7,	%i5
	andcc	%g2,	0x11AA,	%i4
	sdiv	%l4,	0x055C,	%g5
	fzero	%f2
	fpsub32s	%f16,	%f22,	%f24
	andcc	%i0,	0x1879,	%o7
	udivx	%g3,	0x16A0,	%o5
	fsrc1s	%f10,	%f31
	movcs	%icc,	%o0,	%o4
	fmovrdlz	%l5,	%f0,	%f14
	srl	%i1,	%o3,	%o2
	orcc	%g6,	0x1CAF,	%o6
	movge	%xcc,	%i3,	%i2
	srlx	%l2,	%l3,	%l1
	addccc	%o1,	%g4,	%l6
	fcmple16	%f30,	%f4,	%g7
	fmovrdlz	%l0,	%f4,	%f4
	movrlz	%i6,	%g1,	%i5
	umulcc	%i7,	0x021B,	%i4
	fmovrdne	%l4,	%f30,	%f12
	ldd	[%l7 + 0x10],	%g2
	sdivcc	%i0,	0x111B,	%o7
	edge16n	%g5,	%o5,	%o0
	orncc	%g3,	0x08D5,	%l5
	edge8l	%o4,	%i1,	%o3
	fzeros	%f20
	andn	%o2,	0x0FB6,	%o6
	edge32n	%i3,	%i2,	%l2
	andn	%g6,	%l1,	%o1
	std	%f18,	[%l7 + 0x38]
	srl	%g4,	%l6,	%g7
	fmul8x16al	%f31,	%f29,	%f0
	fmovdcs	%xcc,	%f28,	%f10
	edge8	%l3,	%l0,	%g1
	fmul8sux16	%f24,	%f16,	%f6
	save %i5, %i7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l4,	0x0AE2,	%i4
	sdivx	%i0,	0x0CB8,	%o7
	movcs	%xcc,	%g5,	%o5
	sth	%o0,	[%l7 + 0x16]
	stx	%g3,	[%l7 + 0x18]
	orncc	%l5,	0x02A3,	%g2
	or	%i1,	0x0A8F,	%o4
	sllx	%o3,	0x1D,	%o2
	std	%f30,	[%l7 + 0x58]
	movge	%icc,	%o6,	%i3
	nop
	set	0x78, %i2
	ldx	[%l7 + %i2],	%i2
	movneg	%xcc,	%l2,	%l1
	edge8n	%o1,	%g4,	%l6
	movne	%icc,	%g7,	%g6
	ldd	[%l7 + 0x30],	%l0
	movn	%xcc,	%l3,	%i5
	andncc	%i7,	%i6,	%l4
	fabsd	%f26,	%f20
	ld	[%l7 + 0x44],	%f3
	fpsub32s	%f17,	%f7,	%f10
	xor	%g1,	%i4,	%o7
	edge32l	%i0,	%o5,	%g5
	orn	%o0,	0x04B2,	%g3
	fxors	%f16,	%f20,	%f8
	addccc	%g2,	%l5,	%o4
	xor	%o3,	%o2,	%o6
	sdivcc	%i3,	0x01AB,	%i1
	srl	%l2,	0x0A,	%i2
	orcc	%o1,	0x17E3,	%g4
	movrlz	%l6,	0x23B,	%g7
	srax	%g6,	%l0,	%l1
	ld	[%l7 + 0x24],	%f3
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	popc	0x172C,	%l4
	fmul8x16	%f17,	%f22,	%f2
	faligndata	%f16,	%f0,	%f14
	sdivx	%i5,	0x0F46,	%g1
	srax	%o7,	%i4,	%o5
	fabss	%f0,	%f4
	lduw	[%l7 + 0x34],	%g5
	movleu	%icc,	%o0,	%g3
	stw	%i0,	[%l7 + 0x6C]
	alignaddr	%g2,	%l5,	%o3
	edge16ln	%o4,	%o2,	%i3
	edge32	%o6,	%i1,	%l2
	edge8ln	%o1,	%g4,	%l6
	xnor	%i2,	0x1A92,	%g7
	fmovrse	%l0,	%f13,	%f18
	udiv	%g6,	0x020D,	%l1
	subc	%i7,	0x1E5B,	%i6
	st	%f17,	[%l7 + 0x3C]
	addc	%l3,	%i5,	%g1
	edge32l	%o7,	%l4,	%i4
	array16	%g5,	%o0,	%o5
	fmovdneg	%xcc,	%f17,	%f19
	orn	%g3,	0x00E0,	%i0
	xor	%l5,	%o3,	%g2
	orcc	%o2,	0x0C77,	%o4
	fnegs	%f11,	%f22
	movne	%icc,	%i3,	%i1
	movl	%xcc,	%o6,	%o1
	sllx	%g4,	0x07,	%l6
	st	%f20,	[%l7 + 0x58]
	array32	%l2,	%g7,	%l0
	sdivcc	%i2,	0x12A8,	%g6
	edge8l	%l1,	%i6,	%i7
	movre	%i5,	0x190,	%l3
	edge8ln	%g1,	%o7,	%i4
	sir	0x0C95
	smulcc	%l4,	%g5,	%o5
	udivcc	%o0,	0x1CE5,	%i0
	fcmple32	%f28,	%f30,	%g3
	movvs	%icc,	%o3,	%l5
	fornot1	%f22,	%f0,	%f8
	add	%o2,	%o4,	%g2
	xnor	%i3,	0x08C4,	%i1
	movgu	%xcc,	%o1,	%o6
	subc	%l6,	%l2,	%g4
	ldx	[%l7 + 0x58],	%l0
	ldx	[%l7 + 0x20],	%g7
	edge8ln	%i2,	%g6,	%l1
	movneg	%xcc,	%i7,	%i5
	fmovrslz	%i6,	%f1,	%f12
	fzeros	%f25
	udivx	%l3,	0x0218,	%o7
	nop
	set	0x20, %i7
	ldx	[%l7 + %i7],	%g1
	fmovrslez	%i4,	%f12,	%f9
	add	%l4,	0x1C95,	%o5
	fmovrslez	%o0,	%f17,	%f28
	ldd	[%l7 + 0x38],	%i0
	xorcc	%g5,	0x0277,	%g3
	nop
	set	0x56, %o7
	sth	%o3,	[%l7 + %o7]
	fmul8x16au	%f12,	%f27,	%f0
	fmovdleu	%xcc,	%f9,	%f1
	fnor	%f28,	%f12,	%f2
	fcmpgt16	%f20,	%f26,	%l5
	edge32l	%o2,	%o4,	%i3
	array8	%g2,	%i1,	%o6
	fnand	%f22,	%f0,	%f22
	fnegs	%f6,	%f24
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%o0
	or	%l6,	0x1322,	%g4
	movvc	%icc,	%l0,	%l2
	sdiv	%i2,	0x05A3,	%g7
	smulcc	%g6,	%l1,	%i5
	smul	%i6,	%l3,	%o7
	edge32n	%g1,	%i7,	%l4
	sir	0x1439
	sethi	0x0212,	%o5
	sra	%i4,	%o0,	%i0
	fmovdle	%xcc,	%f1,	%f2
	fxor	%f30,	%f18,	%f6
	fxors	%f17,	%f27,	%f21
	or	%g5,	%g3,	%l5
	mulx	%o3,	%o2,	%i3
	fmovdcc	%xcc,	%f27,	%f7
	fmovsne	%icc,	%f29,	%f18
	move	%xcc,	%o4,	%g2
	fmovse	%icc,	%f25,	%f13
	fmovrsne	%o6,	%f13,	%f17
	fpack16	%f30,	%f11
	umul	%o1,	0x1F2D,	%l6
	edge16	%g4,	%i1,	%l2
	or	%i2,	0x04D4,	%l0
	edge8	%g7,	%l1,	%i5
	andcc	%i6,	%l3,	%g6
	sdivx	%g1,	0x0578,	%o7
	fpsub16s	%f15,	%f25,	%f10
	edge32ln	%l4,	%i7,	%o5
	fmovdgu	%xcc,	%f17,	%f26
	edge32n	%i4,	%o0,	%g5
	addc	%i0,	%g3,	%l5
	sir	0x1D2D
	fnot1	%f4,	%f26
	umul	%o3,	0x0865,	%o2
	andcc	%o4,	0x1D08,	%g2
	orcc	%o6,	0x14EC,	%o1
	siam	0x3
	udiv	%l6,	0x0F55,	%i3
	edge32ln	%g4,	%l2,	%i1
	std	%f28,	[%l7 + 0x20]
	movleu	%icc,	%l0,	%g7
	std	%f8,	[%l7 + 0x78]
	fmovs	%f3,	%f30
	srlx	%l1,	%i2,	%i6
	movvs	%xcc,	%l3,	%g6
	fmovsgu	%xcc,	%f28,	%f11
	sub	%i5,	%g1,	%l4
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f28
	udivcc	%o7,	0x03C5,	%o5
	fpack32	%f16,	%f20,	%f20
	xnor	%i4,	%i7,	%o0
	stw	%i0,	[%l7 + 0x2C]
	sdiv	%g5,	0x13BB,	%l5
	edge8	%o3,	%o2,	%o4
	movneg	%icc,	%g3,	%o6
	and	%g2,	%o1,	%i3
	fmovrse	%l6,	%f0,	%f20
	edge16	%g4,	%l2,	%l0
	movpos	%xcc,	%g7,	%l1
	smul	%i2,	%i1,	%l3
	udivx	%g6,	0x1635,	%i6
	and	%g1,	%i5,	%o7
	fmovdleu	%xcc,	%f24,	%f5
	andcc	%l4,	0x10E1,	%i4
	fmuld8ulx16	%f13,	%f26,	%f8
	st	%f1,	[%l7 + 0x4C]
	and	%i7,	%o0,	%o5
	mulscc	%g5,	%l5,	%i0
	addccc	%o2,	%o3,	%o4
	edge8	%o6,	%g2,	%g3
	ldsb	[%l7 + 0x3D],	%o1
	and	%l6,	%i3,	%l2
	fmovdpos	%icc,	%f12,	%f2
	move	%xcc,	%l0,	%g7
	fcmpne32	%f18,	%f14,	%g4
	udiv	%l1,	0x1437,	%i1
	edge32l	%i2,	%g6,	%i6
	ld	[%l7 + 0x14],	%f16
	movne	%icc,	%l3,	%g1
	xorcc	%i5,	0x01C7,	%o7
	srlx	%i4,	%l4,	%o0
	ldd	[%l7 + 0x20],	%f10
	fsrc2	%f16,	%f14
	movg	%icc,	%i7,	%o5
	addccc	%l5,	%g5,	%i0
	movl	%xcc,	%o2,	%o4
	edge32l	%o3,	%g2,	%g3
	fmovdl	%icc,	%f27,	%f20
	stw	%o6,	[%l7 + 0x3C]
	ldd	[%l7 + 0x28],	%f30
	edge32l	%l6,	%i3,	%l2
	edge32ln	%o1,	%g7,	%g4
	sdivcc	%l0,	0x172C,	%l1
	xor	%i2,	%i1,	%g6
	movleu	%xcc,	%i6,	%l3
	fcmpne16	%f4,	%f28,	%g1
	fmuld8sux16	%f2,	%f12,	%f14
	stw	%i5,	[%l7 + 0x60]
	movcs	%icc,	%i4,	%o7
	addcc	%l4,	%o0,	%o5
	srlx	%i7,	%l5,	%g5
	addcc	%o2,	0x1285,	%o4
	stw	%o3,	[%l7 + 0x5C]
	ldsh	[%l7 + 0x7C],	%i0
	edge16l	%g3,	%o6,	%g2
	srl	%i3,	%l6,	%l2
	sethi	0x0E75,	%o1
	udivcc	%g4,	0x1400,	%g7
	movvs	%xcc,	%l1,	%l0
	stx	%i1,	[%l7 + 0x30]
	save %g6, %i2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %i6, 0x16DF, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1998,	%i5
	srlx	%i4,	0x0A,	%l4
	add	%o7,	0x0DCB,	%o5
	movrne	%i7,	0x28F,	%o0
	nop
	set	0x71, %l2
	ldub	[%l7 + %l2],	%g5
	sdivx	%o2,	0x1A43,	%o4
	ldsh	[%l7 + 0x76],	%o3
	ldx	[%l7 + 0x58],	%l5
	movne	%xcc,	%i0,	%g3
	fones	%f19
	lduh	[%l7 + 0x78],	%o6
	ldd	[%l7 + 0x30],	%i2
	ldsw	[%l7 + 0x48],	%l6
	movvs	%icc,	%g2,	%l2
	alignaddr	%o1,	%g7,	%l1
	fmovscs	%icc,	%f6,	%f6
	sub	%l0,	%g4,	%i1
	smulcc	%g6,	0x079A,	%i2
	fxnor	%f24,	%f26,	%f28
	fnegd	%f22,	%f18
	ld	[%l7 + 0x1C],	%f2
	fcmpeq32	%f6,	%f30,	%l3
	fmovdg	%icc,	%f24,	%f22
	fmovrde	%g1,	%f14,	%f28
	lduw	[%l7 + 0x58],	%i5
	sub	%i6,	%i4,	%l4
	array8	%o7,	%o5,	%o0
	ldsb	[%l7 + 0x74],	%i7
	andncc	%o2,	%g5,	%o4
	edge8ln	%o3,	%i0,	%l5
	ldx	[%l7 + 0x40],	%g3
	movg	%icc,	%i3,	%l6
	xor	%o6,	%g2,	%o1
	mova	%xcc,	%g7,	%l1
	sdiv	%l0,	0x17F0,	%l2
	edge32	%i1,	%g4,	%i2
	udivx	%g6,	0x00DD,	%l3
	popc	%i5,	%i6
	ldub	[%l7 + 0x28],	%i4
	smul	%l4,	%g1,	%o7
	movl	%icc,	%o0,	%i7
	edge32	%o5,	%o2,	%g5
	addcc	%o3,	0x18D6,	%o4
	fmovrslz	%i0,	%f23,	%f19
	ld	[%l7 + 0x38],	%f8
	sll	%l5,	0x1F,	%i3
	movpos	%icc,	%g3,	%o6
	lduw	[%l7 + 0x7C],	%l6
	sth	%g2,	[%l7 + 0x64]
	bshuffle	%f14,	%f12,	%f0
	movg	%xcc,	%o1,	%g7
	orncc	%l0,	0x1124,	%l2
	stx	%l1,	[%l7 + 0x30]
	fmovrslz	%i1,	%f1,	%f8
	std	%f22,	[%l7 + 0x58]
	movvc	%xcc,	%i2,	%g4
	fcmple16	%f26,	%f10,	%g6
	mulscc	%i5,	0x1CD6,	%l3
	movle	%icc,	%i6,	%l4
	fmovdpos	%icc,	%f27,	%f25
	movrlz	%g1,	0x338,	%o7
	mulx	%o0,	0x033D,	%i4
	fpack16	%f18,	%f7
	or	%o5,	0x0AE0,	%o2
	fnegd	%f0,	%f6
	movrlz	%g5,	0x2DF,	%i7
	add	%o4,	%i0,	%o3
	mulscc	%l5,	0x001F,	%g3
	movg	%xcc,	%i3,	%o6
	std	%f24,	[%l7 + 0x08]
	fmovsne	%xcc,	%f21,	%f7
	movg	%icc,	%g2,	%o1
	save %l6, %l0, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l1,	%i1,	%i2
	fmovsneg	%xcc,	%f2,	%f2
	sll	%g4,	%g6,	%i5
	edge32	%l2,	%l3,	%i6
	fmovrdne	%l4,	%f0,	%f20
	nop
	set	0x10, %i3
	ldsw	[%l7 + %i3],	%g1
	sra	%o0,	%i4,	%o7
	popc	%o2,	%g5
	edge16	%o5,	%o4,	%i0
	mova	%xcc,	%i7,	%o3
	sra	%l5,	%i3,	%o6
	fornot1s	%f2,	%f26,	%f5
	st	%f25,	[%l7 + 0x78]
	bshuffle	%f12,	%f28,	%f4
	movrgez	%g2,	0x105,	%o1
	stb	%g3,	[%l7 + 0x26]
	xnorcc	%l0,	0x0DBB,	%g7
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	edge16l	%g4,	%i2,	%g6
	fmul8x16au	%f0,	%f17,	%f28
	movge	%icc,	%l2,	%i5
	edge8l	%i6,	%l4,	%g1
	fmovdne	%xcc,	%f29,	%f20
	fnegs	%f31,	%f17
	movle	%icc,	%o0,	%l3
	move	%icc,	%i4,	%o7
	andn	%g5,	%o5,	%o4
	edge32ln	%i0,	%o2,	%i7
	movrlez	%l5,	%i3,	%o6
	edge32l	%g2,	%o1,	%o3
	fnegd	%f22,	%f14
	udiv	%g3,	0x0303,	%l0
	edge32n	%l1,	%g7,	%l6
	fandnot1s	%f16,	%f13,	%f14
	or	%g4,	%i2,	%g6
	fandnot2	%f6,	%f28,	%f6
	popc	%i1,	%i5
	nop
	set	0x10, %l6
	sth	%i6,	[%l7 + %l6]
	fmovrdgz	%l4,	%f0,	%f6
	movrgz	%g1,	%l2,	%o0
	ld	[%l7 + 0x2C],	%f25
	ld	[%l7 + 0x60],	%f5
	fnot1s	%f10,	%f21
	fxnors	%f12,	%f10,	%f12
	sra	%i4,	0x16,	%o7
	ldx	[%l7 + 0x48],	%l3
	subc	%g5,	%o4,	%i0
	edge16	%o5,	%i7,	%o2
	fpadd16	%f12,	%f10,	%f22
	movn	%icc,	%l5,	%i3
	and	%g2,	%o1,	%o6
	add	%o3,	0x1FD3,	%l0
	fmovs	%f17,	%f16
	alignaddr	%g3,	%l1,	%l6
	movpos	%icc,	%g4,	%i2
	sdiv	%g6,	0x1F53,	%i1
	smulcc	%i5,	0x17B9,	%i6
	add	%l4,	0x083D,	%g7
	and	%l2,	0x0727,	%o0
	st	%f14,	[%l7 + 0x54]
	udivx	%g1,	0x180B,	%o7
	add	%l3,	0x0229,	%i4
	fcmpne16	%f10,	%f12,	%o4
	ld	[%l7 + 0x54],	%f4
	edge16	%i0,	%g5,	%i7
	movg	%xcc,	%o5,	%o2
	umul	%l5,	0x0A81,	%g2
	edge16l	%o1,	%i3,	%o6
	edge16l	%o3,	%g3,	%l1
	andcc	%l0,	%l6,	%g4
	ldd	[%l7 + 0x78],	%f28
	edge8l	%i2,	%i1,	%i5
	move	%xcc,	%g6,	%i6
	fcmped	%fcc0,	%f16,	%f30
	mova	%icc,	%l4,	%l2
	fmovspos	%icc,	%f16,	%f3
	movvc	%icc,	%o0,	%g7
	xor	%g1,	%l3,	%i4
	movvc	%xcc,	%o7,	%i0
	movne	%icc,	%g5,	%o4
	fmovsgu	%icc,	%f13,	%f17
	fmovdn	%xcc,	%f11,	%f17
	edge8l	%o5,	%i7,	%l5
	addc	%g2,	%o1,	%o2
	edge32ln	%i3,	%o6,	%g3
	fmovsvc	%xcc,	%f14,	%f11
	mulx	%l1,	0x104F,	%l0
	movrlez	%o3,	0x170,	%l6
	std	%f30,	[%l7 + 0x10]
	subc	%i2,	0x080E,	%g4
	edge16ln	%i1,	%g6,	%i6
	udiv	%l4,	0x0F1F,	%l2
	restore %o0, %g7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l3,	%i4,	%g1
	addcc	%i0,	%g5,	%o7
	addc	%o5,	%i7,	%l5
	movrlz	%o4,	%o1,	%o2
	movg	%xcc,	%i3,	%g2
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%f8
	smulcc	%o6,	%g3,	%l0
	fmovsl	%xcc,	%f21,	%f12
	fmovdleu	%xcc,	%f26,	%f7
	movvc	%xcc,	%o3,	%l1
	movle	%xcc,	%l6,	%g4
	fsrc2	%f24,	%f10
	movrgz	%i1,	0x21E,	%g6
	movneg	%icc,	%i6,	%l4
	st	%f12,	[%l7 + 0x08]
	andn	%i2,	0x0222,	%o0
	xnor	%g7,	0x1F7B,	%l2
	orncc	%i5,	0x0EA7,	%i4
	edge8n	%l3,	%g1,	%g5
	ldsb	[%l7 + 0x33],	%i0
	fmovdpos	%xcc,	%f23,	%f14
	edge8l	%o5,	%o7,	%i7
	nop
	set	0x44, %o3
	stw	%l5,	[%l7 + %o3]
	save %o4, 0x1875, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o1,	%g2
	fnegd	%f18,	%f20
	xnor	%o6,	%g3,	%l0
	fmovrdlz	%o3,	%f24,	%f24
	xnor	%l1,	0x056A,	%i3
	fnot1	%f30,	%f18
	move	%icc,	%g4,	%l6
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	edge16	%i6,	%i2,	%g7
	ldd	[%l7 + 0x28],	%o0
	move	%icc,	%l2,	%i5
	movcs	%xcc,	%l3,	%g1
	umulcc	%i4,	%i0,	%g5
	addccc	%o7,	%o5,	%i7
	ldd	[%l7 + 0x70],	%o4
	move	%xcc,	%l5,	%o1
	fnot2s	%f31,	%f30
	fmovrdgez	%g2,	%f22,	%f2
	umul	%o6,	%o2,	%g3
	movpos	%xcc,	%o3,	%l1
	andcc	%l0,	0x190C,	%g4
	movcs	%xcc,	%i3,	%i1
	movne	%xcc,	%g6,	%l6
	udivcc	%l4,	0x0196,	%i2
	movg	%icc,	%g7,	%o0
	movpos	%xcc,	%l2,	%i5
	movvc	%icc,	%i6,	%l3
	srax	%i4,	0x0A,	%i0
	edge32l	%g1,	%o7,	%g5
	edge16ln	%i7,	%o4,	%l5
	fornot2	%f2,	%f22,	%f20
	edge8n	%o5,	%g2,	%o6
	movleu	%icc,	%o2,	%g3
	srlx	%o3,	0x1B,	%l1
	lduh	[%l7 + 0x1A],	%l0
	array8	%o1,	%g4,	%i1
	edge32ln	%g6,	%i3,	%l6
	fmovsl	%xcc,	%f15,	%f8
	xnor	%l4,	%g7,	%i2
	ldsb	[%l7 + 0x14],	%l2
	smulcc	%i5,	0x1CCA,	%o0
	umul	%i6,	0x0EEF,	%l3
	umul	%i0,	0x1991,	%i4
	fandnot2s	%f23,	%f18,	%f7
	fnot2s	%f18,	%f31
	std	%f26,	[%l7 + 0x38]
	fmovdpos	%xcc,	%f5,	%f27
	movg	%icc,	%o7,	%g1
	movrlz	%i7,	0x34A,	%g5
	edge8	%o4,	%l5,	%g2
	lduh	[%l7 + 0x7A],	%o6
	lduh	[%l7 + 0x62],	%o5
	udivcc	%g3,	0x1CD9,	%o2
	edge16	%o3,	%l1,	%l0
	edge32	%o1,	%i1,	%g6
	fxors	%f31,	%f11,	%f29
	fcmpne16	%f8,	%f24,	%i3
	fcmpd	%fcc3,	%f30,	%f16
	subccc	%l6,	%g4,	%g7
	andn	%l4,	%i2,	%i5
	lduw	[%l7 + 0x4C],	%l2
	sllx	%o0,	%l3,	%i0
	sll	%i6,	0x05,	%i4
	movne	%icc,	%g1,	%i7
	ldsb	[%l7 + 0x67],	%g5
	sub	%o4,	0x0E60,	%o7
	save %l5, 0x1D0D, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o5,	%g3,	%o2
	sllx	%g2,	%o3,	%l1
	edge32	%l0,	%i1,	%o1
	movcc	%icc,	%g6,	%l6
	movne	%icc,	%i3,	%g7
	fmovsle	%icc,	%f13,	%f11
	ldx	[%l7 + 0x08],	%g4
	xorcc	%l4,	%i2,	%l2
	ldd	[%l7 + 0x78],	%o0
	restore %l3, 0x0AB2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f12,	%f25
	sir	0x0755
	movcc	%icc,	%i5,	%i4
	array32	%i6,	%g1,	%g5
	fnor	%f16,	%f4,	%f10
	srax	%o4,	%o7,	%l5
	movrgez	%o6,	%o5,	%g3
	fmovdn	%icc,	%f29,	%f14
	edge8ln	%o2,	%g2,	%i7
	subcc	%l1,	%l0,	%o3
	ldsw	[%l7 + 0x70],	%i1
	movneg	%icc,	%o1,	%l6
	mulx	%i3,	%g6,	%g4
	udiv	%l4,	0x0959,	%g7
	edge16n	%i2,	%o0,	%l2
	alignaddrl	%l3,	%i0,	%i4
	andncc	%i6,	%i5,	%g5
	subccc	%g1,	%o7,	%o4
	edge8	%o6,	%o5,	%l5
	edge32l	%o2,	%g2,	%i7
	umulcc	%g3,	%l0,	%l1
	sdiv	%o3,	0x017C,	%o1
	srlx	%i1,	0x07,	%i3
	movl	%xcc,	%l6,	%g4
	fzeros	%f16
	andncc	%l4,	%g6,	%g7
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%f16
	edge16	%o0,	%i2,	%l3
	sub	%l2,	%i0,	%i4
	popc	0x0119,	%i5
	sethi	0x1861,	%g5
	mova	%icc,	%g1,	%i6
	udiv	%o4,	0x1483,	%o6
	fmovs	%f2,	%f22
	array8	%o7,	%o5,	%l5
	ld	[%l7 + 0x78],	%f25
	edge16n	%g2,	%o2,	%g3
	edge32n	%i7,	%l0,	%l1
	srl	%o1,	0x0E,	%o3
	sdivcc	%i1,	0x1980,	%l6
	nop
	set	0x5B, %o2
	ldsb	[%l7 + %o2],	%i3
	xnor	%l4,	%g6,	%g4
	srax	%g7,	%o0,	%l3
	edge16ln	%i2,	%l2,	%i4
	edge8l	%i5,	%i0,	%g1
	fcmpeq32	%f4,	%f4,	%i6
	movpos	%icc,	%o4,	%g5
	lduh	[%l7 + 0x56],	%o6
	sdivx	%o5,	0x06EB,	%o7
	fcmps	%fcc2,	%f17,	%f6
	umulcc	%g2,	%o2,	%l5
	andcc	%g3,	0x0DE4,	%i7
	edge16ln	%l0,	%o1,	%o3
	fmovrslz	%i1,	%f23,	%f21
	fmovscs	%icc,	%f21,	%f4
	movne	%icc,	%l1,	%l6
	for	%f8,	%f30,	%f8
	sdivcc	%l4,	0x1B78,	%g6
	array8	%i3,	%g7,	%g4
	fandnot1	%f2,	%f22,	%f18
	ldd	[%l7 + 0x58],	%f14
	movneg	%xcc,	%o0,	%l3
	xor	%l2,	%i2,	%i5
	movcs	%xcc,	%i4,	%i0
	udivcc	%i6,	0x1FD0,	%o4
	srlx	%g5,	%o6,	%o5
	sdivx	%o7,	0x1C6A,	%g1
	fmovsvs	%xcc,	%f29,	%f18
	movcc	%xcc,	%o2,	%l5
	fmovsvs	%xcc,	%f25,	%f31
	xnor	%g2,	0x00EF,	%i7
	movrne	%l0,	0x3A2,	%g3
	sdivcc	%o3,	0x1DD8,	%o1
	ldub	[%l7 + 0x3D],	%l1
	array16	%i1,	%l6,	%g6
	fmovscc	%xcc,	%f21,	%f18
	ldsw	[%l7 + 0x1C],	%l4
	sub	%g7,	%i3,	%o0
	xnor	%l3,	%g4,	%l2
	sdiv	%i2,	0x03AA,	%i4
	fzeros	%f3
	fmovdvc	%icc,	%f4,	%f3
	udiv	%i5,	0x0343,	%i0
	save %i6, %o4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f3,	%f1
	smul	%o5,	%g5,	%o7
	fandnot2s	%f2,	%f28,	%f6
	ldub	[%l7 + 0x35],	%o2
	fmovrdne	%g1,	%f24,	%f12
	popc	%g2,	%l5
	sub	%i7,	%l0,	%o3
	sth	%g3,	[%l7 + 0x16]
	mulx	%o1,	0x072B,	%l1
	fmovdn	%icc,	%f6,	%f31
	fmovrslez	%l6,	%f15,	%f2
	srax	%i1,	0x04,	%g6
	mulx	%l4,	%g7,	%o0
	fandnot1s	%f10,	%f30,	%f21
	ldd	[%l7 + 0x60],	%i2
	ldub	[%l7 + 0x13],	%l3
	movcc	%xcc,	%g4,	%l2
	sub	%i2,	0x1375,	%i4
	udivcc	%i5,	0x13B5,	%i6
	array8	%o4,	%i0,	%o6
	fpsub16s	%f9,	%f2,	%f21
	movrgz	%g5,	%o7,	%o5
	andcc	%g1,	%g2,	%l5
	udivx	%i7,	0x1DA3,	%o2
	fexpand	%f19,	%f26
	movrlez	%l0,	%g3,	%o3
	movre	%o1,	0x1C3,	%l1
	orn	%i1,	0x1719,	%l6
	addc	%g6,	0x1458,	%g7
	movcc	%xcc,	%o0,	%i3
	subcc	%l3,	%l4,	%l2
	sethi	0x163A,	%g4
	sdiv	%i4,	0x1E61,	%i2
	movn	%xcc,	%i5,	%o4
	fmovsvc	%icc,	%f21,	%f3
	movle	%xcc,	%i0,	%o6
	array32	%i6,	%o7,	%o5
	orcc	%g1,	%g5,	%l5
	udivx	%i7,	0x1C11,	%g2
	edge8ln	%l0,	%o2,	%g3
	srlx	%o1,	0x1B,	%l1
	fmovdg	%xcc,	%f7,	%f16
	udiv	%o3,	0x1C54,	%i1
	movgu	%xcc,	%l6,	%g7
	nop
	set	0x10, %l5
	ldsw	[%l7 + %l5],	%o0
	subc	%g6,	0x0154,	%l3
	fmovdge	%xcc,	%f27,	%f20
	mova	%xcc,	%i3,	%l4
	fmovsge	%xcc,	%f14,	%f13
	fxors	%f16,	%f10,	%f27
	fmovsvs	%icc,	%f18,	%f26
	andncc	%l2,	%i4,	%i2
	fpadd16s	%f16,	%f22,	%f16
	fnand	%f10,	%f8,	%f8
	alignaddr	%i5,	%o4,	%i0
	sra	%o6,	0x06,	%i6
	fmovdcs	%xcc,	%f3,	%f0
	movneg	%xcc,	%g4,	%o5
	sdiv	%o7,	0x1E52,	%g1
	fmovsvc	%xcc,	%f0,	%f29
	pdist	%f10,	%f22,	%f22
	fnors	%f3,	%f9,	%f5
	sra	%l5,	0x13,	%g5
	xnorcc	%i7,	0x10EF,	%l0
	ldd	[%l7 + 0x20],	%f20
	array16	%o2,	%g3,	%o1
	addc	%g2,	0x138F,	%l1
	srl	%o3,	%i1,	%g7
	fmovrsgez	%l6,	%f21,	%f21
	array8	%g6,	%l3,	%i3
	sdivx	%o0,	0x12B0,	%l4
	movgu	%xcc,	%l2,	%i4
	andcc	%i5,	%o4,	%i0
	movcs	%xcc,	%o6,	%i6
	lduh	[%l7 + 0x5E],	%g4
	movpos	%icc,	%i2,	%o5
	ld	[%l7 + 0x7C],	%f2
	ldsw	[%l7 + 0x2C],	%o7
	fpack16	%f26,	%f14
	fmovrslez	%l5,	%f19,	%f11
	movcc	%icc,	%g5,	%g1
	stx	%i7,	[%l7 + 0x30]
	movg	%icc,	%o2,	%g3
	edge16l	%o1,	%g2,	%l1
	movleu	%xcc,	%o3,	%i1
	stx	%l0,	[%l7 + 0x18]
	fmovspos	%icc,	%f0,	%f9
	fmovdg	%xcc,	%f22,	%f10
	movrne	%g7,	%g6,	%l3
	movre	%i3,	0x09E,	%l6
	fmovdcc	%xcc,	%f25,	%f21
	movcc	%xcc,	%o0,	%l4
	movle	%icc,	%i4,	%l2
	edge16l	%o4,	%i5,	%o6
	sub	%i0,	%i6,	%g4
	movre	%o5,	%o7,	%i2
	std	%f12,	[%l7 + 0x70]
	smulcc	%l5,	0x10C7,	%g1
	edge16	%i7,	%g5,	%g3
	smulcc	%o2,	%g2,	%l1
	xor	%o1,	%i1,	%o3
	sra	%l0,	0x12,	%g7
	for	%f18,	%f6,	%f24
	fmul8x16	%f11,	%f0,	%f22
	ldub	[%l7 + 0x23],	%g6
	lduw	[%l7 + 0x40],	%l3
	fzero	%f20
	fcmpgt32	%f24,	%f22,	%i3
	edge32l	%o0,	%l4,	%l6
	fmovrse	%i4,	%f30,	%f2
	st	%f2,	[%l7 + 0x28]
	fone	%f20
	ldx	[%l7 + 0x48],	%o4
	srlx	%l2,	%o6,	%i0
	movre	%i6,	%i5,	%o5
	andncc	%o7,	%i2,	%l5
	fornot2	%f10,	%f30,	%f26
	edge8l	%g1,	%g4,	%g5
	fmovscs	%xcc,	%f10,	%f10
	ldd	[%l7 + 0x40],	%g2
	ldsb	[%l7 + 0x36],	%o2
	lduh	[%l7 + 0x42],	%g2
	movrgez	%i7,	%o1,	%i1
	fmovdvs	%xcc,	%f31,	%f28
	edge32	%l1,	%o3,	%g7
	fmovdg	%icc,	%f10,	%f27
	ldub	[%l7 + 0x11],	%l0
	sir	0x15F6
	edge32ln	%l3,	%g6,	%i3
	andncc	%l4,	%l6,	%o0
	std	%f28,	[%l7 + 0x58]
	fnors	%f19,	%f10,	%f19
	stx	%i4,	[%l7 + 0x30]
	srlx	%l2,	0x1E,	%o4
	edge32ln	%o6,	%i6,	%i0
	addc	%o5,	0x1D3A,	%o7
	fpmerge	%f21,	%f23,	%f2
	fabss	%f0,	%f3
	lduh	[%l7 + 0x7C],	%i2
	array16	%l5,	%g1,	%g4
	fmovsvs	%xcc,	%f23,	%f14
	stw	%g5,	[%l7 + 0x28]
	movl	%icc,	%i5,	%g3
	movrgz	%g2,	0x33F,	%o2
	fsrc1	%f16,	%f12
	fsrc2	%f26,	%f20
	udiv	%o1,	0x0616,	%i1
	sdivcc	%i7,	0x1B7F,	%o3
	srlx	%l1,	%g7,	%l0
	fones	%f3
	sll	%l3,	0x0D,	%g6
	andcc	%l4,	%i3,	%l6
	fcmple32	%f22,	%f12,	%i4
	alignaddrl	%l2,	%o4,	%o0
	sdiv	%i6,	0x0821,	%o6
	ld	[%l7 + 0x30],	%f10
	std	%f28,	[%l7 + 0x10]
	fmovrde	%i0,	%f14,	%f10
	fmovdvc	%xcc,	%f10,	%f4
	sllx	%o7,	0x1F,	%i2
	nop
	set	0x78, %o5
	ldx	[%l7 + %o5],	%o5
	subccc	%l5,	%g1,	%g5
	st	%f3,	[%l7 + 0x1C]
	ldx	[%l7 + 0x28],	%g4
	ldub	[%l7 + 0x22],	%i5
	lduh	[%l7 + 0x36],	%g2
	subcc	%g3,	0x0D0A,	%o1
	movvs	%xcc,	%i1,	%o2
	udivcc	%i7,	0x05A2,	%o3
	umulcc	%l1,	0x16EA,	%l0
	ldd	[%l7 + 0x58],	%l2
	sdivx	%g7,	0x15D5,	%l4
	sth	%g6,	[%l7 + 0x14]
	array16	%i3,	%l6,	%i4
	movrlz	%l2,	%o4,	%i6
	srax	%o6,	%i0,	%o0
	movge	%icc,	%i2,	%o7
	fcmpd	%fcc0,	%f8,	%f14
	movrlez	%l5,	%o5,	%g1
	array32	%g4,	%i5,	%g2
	fmovdneg	%xcc,	%f1,	%f18
	std	%f18,	[%l7 + 0x50]
	siam	0x7
	ldsw	[%l7 + 0x14],	%g3
	stb	%o1,	[%l7 + 0x6B]
	std	%f30,	[%l7 + 0x50]
	ldd	[%l7 + 0x08],	%g4
	andn	%i1,	%o2,	%o3
	smul	%i7,	%l1,	%l3
	fmovsneg	%xcc,	%f4,	%f9
	popc	%l0,	%l4
	movrlz	%g7,	0x0AD,	%g6
	xor	%i3,	%i4,	%l6
	addcc	%l2,	%i6,	%o4
	mova	%icc,	%i0,	%o0
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f18
	movre	%i2,	%o6,	%l5
	fmovrdgez	%o7,	%f10,	%f12
	orn	%o5,	0x1F2A,	%g1
	fnands	%f0,	%f16,	%f26
	fmovsne	%xcc,	%f24,	%f20
	udivcc	%g4,	0x04A5,	%i5
	udiv	%g2,	0x1794,	%o1
	alignaddrl	%g3,	%i1,	%o2
	fmul8x16au	%f13,	%f13,	%f18
	fcmpes	%fcc1,	%f13,	%f1
	ldub	[%l7 + 0x29],	%o3
	edge32n	%g5,	%l1,	%l3
	stb	%i7,	[%l7 + 0x24]
	addc	%l0,	0x1447,	%l4
	ldub	[%l7 + 0x51],	%g6
	stw	%i3,	[%l7 + 0x48]
	fmovsne	%xcc,	%f8,	%f23
	xor	%i4,	0x13E1,	%l6
	lduw	[%l7 + 0x3C],	%g7
	sub	%i6,	0x15FD,	%l2
	edge8l	%o4,	%o0,	%i0
	alignaddr	%o6,	%i2,	%o7
	fmovsneg	%icc,	%f30,	%f16
	edge8	%o5,	%g1,	%l5
	fcmpd	%fcc1,	%f16,	%f8
	ldsb	[%l7 + 0x11],	%i5
	orn	%g4,	%g2,	%g3
	lduw	[%l7 + 0x14],	%i1
	sdivcc	%o1,	0x1A49,	%o3
	addccc	%o2,	%l1,	%g5
	xorcc	%i7,	%l3,	%l0
	lduw	[%l7 + 0x64],	%l4
	ldsh	[%l7 + 0x18],	%i3
	array8	%i4,	%l6,	%g7
	mova	%icc,	%g6,	%l2
	st	%f15,	[%l7 + 0x78]
	ld	[%l7 + 0x44],	%f15
	sdivcc	%i6,	0x0B45,	%o0
	xnorcc	%o4,	%i0,	%o6
	lduw	[%l7 + 0x3C],	%o7
	movg	%icc,	%o5,	%i2
	fmovsvs	%xcc,	%f15,	%f3
	xnor	%g1,	%l5,	%g4
	fmovsl	%icc,	%f7,	%f9
	movne	%icc,	%i5,	%g2
	sllx	%g3,	0x11,	%i1
	lduw	[%l7 + 0x50],	%o1
	umulcc	%o2,	%o3,	%g5
	movrgz	%i7,	0x13E,	%l1
	ldub	[%l7 + 0x55],	%l0
	fmovrdlez	%l3,	%f22,	%f18
	movne	%icc,	%l4,	%i3
	fmovrdlz	%l6,	%f8,	%f12
	ldd	[%l7 + 0x18],	%g6
	fcmpeq16	%f24,	%f4,	%g6
	umulcc	%l2,	%i4,	%i6
	fpadd32	%f26,	%f28,	%f26
	sllx	%o4,	0x1C,	%i0
	ldx	[%l7 + 0x58],	%o6
	xnor	%o7,	%o5,	%o0
	sra	%g1,	%i2,	%l5
	fmovrdlz	%g4,	%f12,	%f30
	fors	%f5,	%f2,	%f0
	edge32l	%i5,	%g2,	%g3
	ldd	[%l7 + 0x30],	%f16
	movrne	%o1,	%o2,	%o3
	umul	%g5,	%i7,	%i1
	edge16	%l1,	%l0,	%l4
	fandnot2	%f8,	%f2,	%f28
	ldd	[%l7 + 0x70],	%l2
	smul	%i3,	%l6,	%g6
	movg	%icc,	%l2,	%i4
	mulx	%g7,	0x1988,	%o4
	umulcc	%i6,	0x13C0,	%i0
	umul	%o7,	0x1E36,	%o5
	xorcc	%o0,	%g1,	%o6
	ldd	[%l7 + 0x30],	%f18
	fcmped	%fcc3,	%f16,	%f26
	umul	%i2,	%g4,	%i5
	st	%f26,	[%l7 + 0x6C]
	fors	%f21,	%f27,	%f9
	ldsb	[%l7 + 0x35],	%l5
	fors	%f19,	%f18,	%f14
	movleu	%icc,	%g3,	%g2
	xor	%o2,	%o3,	%o1
	sethi	0x16A8,	%i7
	edge16n	%g5,	%i1,	%l1
	edge8l	%l4,	%l3,	%i3
	fsrc2	%f4,	%f24
	orn	%l0,	0x1EA3,	%g6
	edge32ln	%l2,	%l6,	%g7
	xnor	%i4,	0x17DB,	%o4
	movge	%icc,	%i6,	%i0
	stw	%o5,	[%l7 + 0x68]
	move	%xcc,	%o0,	%g1
	edge8n	%o7,	%i2,	%o6
	xnor	%i5,	%l5,	%g3
	faligndata	%f6,	%f30,	%f24
	edge16l	%g4,	%o2,	%o3
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	addccc	%i1,	0x003B,	%g5
	mova	%icc,	%l4,	%l1
	lduw	[%l7 + 0x0C],	%l3
	fxnors	%f22,	%f31,	%f16
	movrne	%i3,	0x36B,	%g6
	fabss	%f17,	%f22
	subcc	%l0,	%l2,	%l6
	movg	%icc,	%g7,	%i4
	nop
	set	0x1C, %i4
	lduh	[%l7 + %i4],	%i6
	fsrc2	%f14,	%f4
	add	%i0,	%o4,	%o0
	fxnor	%f12,	%f16,	%f10
	movl	%xcc,	%o5,	%g1
	fnot1s	%f5,	%f5
	edge8ln	%o7,	%i2,	%i5
	sllx	%l5,	%o6,	%g3
	sir	0x1271
	subccc	%o2,	0x086A,	%o3
	addcc	%g4,	%i7,	%o1
	ldx	[%l7 + 0x40],	%g2
	sdivcc	%g5,	0x07D7,	%i1
	fnegs	%f25,	%f24
	fornot2s	%f16,	%f2,	%f20
	alignaddr	%l4,	%l1,	%i3
	ldsw	[%l7 + 0x60],	%g6
	lduw	[%l7 + 0x50],	%l3
	sethi	0x1E6B,	%l0
	movvc	%xcc,	%l2,	%l6
	or	%g7,	%i4,	%i0
	edge32l	%i6,	%o0,	%o4
	fmovrsne	%g1,	%f29,	%f10
	edge16ln	%o7,	%i2,	%i5
	ld	[%l7 + 0x34],	%f8
	edge32	%o5,	%l5,	%g3
	movleu	%icc,	%o2,	%o6
	ld	[%l7 + 0x0C],	%f13
	fnands	%f17,	%f15,	%f23
	fpsub16s	%f23,	%f19,	%f29
	movneg	%icc,	%g4,	%o3
	edge32l	%i7,	%o1,	%g2
	edge8n	%g5,	%i1,	%l1
	fpsub16s	%f11,	%f22,	%f15
	movvc	%xcc,	%i3,	%l4
	nop
	set	0x58, %g3
	lduh	[%l7 + %g3],	%g6
	array8	%l3,	%l2,	%l0
	mulscc	%g7,	0x0BE9,	%i4
	udiv	%l6,	0x11CA,	%i6
	array8	%o0,	%o4,	%i0
	fmovde	%xcc,	%f11,	%f28
	orn	%o7,	0x14A2,	%g1
	andn	%i2,	%i5,	%l5
	umulcc	%o5,	0x1C99,	%g3
	umulcc	%o2,	0x0196,	%o6
	fmovscs	%icc,	%f7,	%f4
	ldsh	[%l7 + 0x40],	%g4
	fmovde	%icc,	%f22,	%f8
	save %i7, %o3, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g5,	%o1,	%i1
	movle	%icc,	%i3,	%l1
	ldd	[%l7 + 0x08],	%l4
	fsrc1	%f26,	%f6
	sub	%g6,	0x14B0,	%l3
	st	%f30,	[%l7 + 0x20]
	fornot1s	%f0,	%f22,	%f18
	array32	%l2,	%l0,	%g7
	fmovdgu	%icc,	%f11,	%f9
	edge8n	%l6,	%i4,	%i6
	edge32ln	%o0,	%i0,	%o4
	addccc	%g1,	%i2,	%o7
	fmovsge	%icc,	%f18,	%f22
	srl	%l5,	%o5,	%g3
	movl	%xcc,	%o2,	%o6
	movgu	%icc,	%g4,	%i5
	lduw	[%l7 + 0x54],	%o3
	sth	%g2,	[%l7 + 0x64]
	or	%g5,	0x04FB,	%i7
	movcs	%xcc,	%o1,	%i1
	fandnot1	%f20,	%f28,	%f28
	xor	%l1,	%i3,	%l4
	udivcc	%g6,	0x175C,	%l2
	fmovsvs	%icc,	%f3,	%f31
	fornot1s	%f1,	%f22,	%f4
	lduw	[%l7 + 0x64],	%l3
	save %g7, %l6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x19FC
	fmovrde	%l0,	%f10,	%f26
	edge32n	%o0,	%i6,	%i0
	std	%f0,	[%l7 + 0x38]
	edge8ln	%g1,	%i2,	%o7
	udiv	%o4,	0x0134,	%o5
	mova	%xcc,	%l5,	%g3
	ldsb	[%l7 + 0x1A],	%o6
	sdivcc	%o2,	0x0876,	%i5
	xorcc	%g4,	0x1723,	%g2
	save %g5, 0x0780, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o3,	%o1,	%i1
	fcmpgt16	%f4,	%f10,	%l1
	srlx	%i3,	%g6,	%l4
	fmovs	%f16,	%f23
	smulcc	%l2,	%l3,	%g7
	fmovdgu	%icc,	%f31,	%f4
	fcmple32	%f20,	%f28,	%i4
	fpsub32s	%f5,	%f25,	%f28
	sdivcc	%l0,	0x0921,	%o0
	fmovsl	%xcc,	%f12,	%f24
	fpadd32	%f16,	%f22,	%f20
	movg	%xcc,	%i6,	%i0
	fmovsle	%icc,	%f10,	%f16
	fmovdpos	%xcc,	%f19,	%f13
	fcmpgt16	%f22,	%f26,	%l6
	sir	0x0196
	umulcc	%i2,	%g1,	%o7
	subcc	%o5,	0x1E14,	%l5
	lduw	[%l7 + 0x7C],	%g3
	movvc	%xcc,	%o6,	%o4
	edge8n	%o2,	%i5,	%g2
	ldub	[%l7 + 0x17],	%g4
	udivx	%g5,	0x1BAB,	%o3
	ldd	[%l7 + 0x30],	%i6
	movrlez	%o1,	0x2A7,	%i1
	srlx	%i3,	%l1,	%g6
	stb	%l4,	[%l7 + 0x1E]
	ldsb	[%l7 + 0x3C],	%l3
	sll	%g7,	0x15,	%l2
	xor	%i4,	0x179D,	%l0
	movrlez	%o0,	%i6,	%l6
	movne	%xcc,	%i0,	%g1
	orn	%i2,	%o7,	%l5
	ldd	[%l7 + 0x58],	%g2
	edge16n	%o5,	%o6,	%o2
	fpsub16s	%f6,	%f28,	%f18
	edge16	%i5,	%g2,	%o4
	movpos	%xcc,	%g4,	%g5
	fpack32	%f4,	%f22,	%f14
	mova	%icc,	%i7,	%o3
	array8	%i1,	%i3,	%o1
	movg	%xcc,	%l1,	%l4
	andcc	%g6,	%l3,	%g7
	stx	%i4,	[%l7 + 0x30]
	fcmple32	%f10,	%f10,	%l0
	subccc	%o0,	%l2,	%i6
	ldsh	[%l7 + 0x18],	%l6
	udivx	%g1,	0x0A3E,	%i2
	movgu	%icc,	%o7,	%i0
	fzero	%f8
	sub	%l5,	0x1E83,	%g3
	fmul8x16au	%f26,	%f0,	%f24
	ldsh	[%l7 + 0x42],	%o6
	fnot1s	%f7,	%f21
	fmovrse	%o5,	%f9,	%f7
	fpadd32s	%f21,	%f12,	%f0
	edge8n	%i5,	%o2,	%g2
	addc	%g4,	0x0746,	%g5
	fcmpgt32	%f6,	%f12,	%i7
	orncc	%o4,	0x05E6,	%i1
	movn	%xcc,	%i3,	%o3
	edge32ln	%o1,	%l1,	%l4
	ldx	[%l7 + 0x50],	%l3
	st	%f15,	[%l7 + 0x68]
	edge16ln	%g7,	%g6,	%l0
	fzeros	%f8
	alignaddr	%o0,	%l2,	%i4
	fpsub16s	%f8,	%f10,	%f13
	nop
	set	0x7C, %l4
	ldub	[%l7 + %l4],	%i6
	movrlez	%l6,	%i2,	%o7
	movpos	%xcc,	%i0,	%l5
	xorcc	%g3,	0x02DD,	%o6
	movrgz	%g1,	%i5,	%o5
	subccc	%g2,	0x1BF5,	%o2
	sdivx	%g5,	0x1EA5,	%i7
	mulx	%o4,	0x1F1C,	%i1
	edge16l	%i3,	%g4,	%o3
	fornot1s	%f3,	%f20,	%f3
	sra	%l1,	%l4,	%o1
	udivx	%g7,	0x1906,	%l3
	fmovrdlez	%l0,	%f14,	%f12
	sethi	0x11F6,	%o0
	fcmpne16	%f24,	%f22,	%l2
	array16	%i4,	%i6,	%l6
	movneg	%icc,	%g6,	%i2
	umul	%i0,	%o7,	%g3
	fmovdleu	%xcc,	%f5,	%f12
	orncc	%o6,	%g1,	%l5
	edge32n	%o5,	%i5,	%o2
	sll	%g2,	0x19,	%i7
	fcmpes	%fcc3,	%f21,	%f15
	xorcc	%g5,	%i1,	%o4
	orcc	%g4,	0x1F3B,	%i3
	xor	%o3,	%l4,	%l1
	fmovda	%xcc,	%f17,	%f6
	fmovrdlz	%g7,	%f12,	%f16
	movrlz	%l3,	0x0F5,	%l0
	std	%f18,	[%l7 + 0x68]
	movpos	%xcc,	%o0,	%l2
	orncc	%o1,	%i6,	%l6
	fmul8ulx16	%f24,	%f14,	%f2
	edge8	%g6,	%i2,	%i4
	movle	%xcc,	%o7,	%i0
	edge8ln	%o6,	%g1,	%l5
	fcmpne16	%f8,	%f4,	%g3
	pdist	%f4,	%f6,	%f6
	andcc	%i5,	0x156C,	%o2
	ldsh	[%l7 + 0x5A],	%o5
	orn	%g2,	%i7,	%i1
	fmovdge	%icc,	%f8,	%f15
	mulscc	%o4,	%g4,	%i3
	andcc	%g5,	%l4,	%l1
	ldd	[%l7 + 0x28],	%g6
	edge16n	%o3,	%l0,	%l3
	movvc	%xcc,	%o0,	%o1
	movrlez	%l2,	0x328,	%l6
	fcmpeq32	%f28,	%f18,	%g6
	fmovsn	%icc,	%f20,	%f20
	fmovdgu	%icc,	%f8,	%f9
	edge8	%i2,	%i6,	%o7
	sethi	0x1E7A,	%i4
	nop
	set	0x26, %o4
	sth	%i0,	[%l7 + %o4]
	movrlez	%g1,	%l5,	%o6
	mulx	%i5,	0x1291,	%g3
	andn	%o5,	0x1F3D,	%g2
	fmul8ulx16	%f4,	%f18,	%f30
	movne	%xcc,	%o2,	%i7
	movge	%xcc,	%i1,	%g4
	movl	%icc,	%i3,	%o4
	fmul8ulx16	%f30,	%f8,	%f6
	stx	%g5,	[%l7 + 0x48]
	sdiv	%l1,	0x1753,	%l4
	pdist	%f8,	%f30,	%f0
	sth	%o3,	[%l7 + 0x20]
	edge32l	%g7,	%l3,	%o0
	orn	%o1,	%l0,	%l2
	array16	%l6,	%i2,	%g6
	orn	%i6,	0x0312,	%i4
	move	%xcc,	%i0,	%o7
	srl	%l5,	%g1,	%o6
	edge8	%i5,	%g3,	%o5
	subccc	%g2,	%i7,	%i1
	popc	%o2,	%g4
	fnot2s	%f22,	%f29
	xnor	%o4,	0x08D1,	%i3
	for	%f4,	%f10,	%f26
	std	%f18,	[%l7 + 0x78]
	movle	%xcc,	%l1,	%g5
	subccc	%o3,	%g7,	%l3
	xor	%l4,	%o0,	%l0
	sdivcc	%o1,	0x056F,	%l2
	fornot1s	%f14,	%f1,	%f8
	movl	%xcc,	%l6,	%g6
	edge32l	%i2,	%i6,	%i4
	orn	%i0,	0x0EBC,	%o7
	mulscc	%g1,	%o6,	%l5
	fands	%f30,	%f13,	%f18
	edge8l	%i5,	%g3,	%o5
	fmovdne	%xcc,	%f16,	%f3
	edge32l	%g2,	%i7,	%o2
	movle	%icc,	%i1,	%g4
	subccc	%i3,	0x0F70,	%l1
	sethi	0x1EF4,	%g5
	move	%xcc,	%o4,	%o3
	sir	0x1F08
	umulcc	%l3,	0x0ECA,	%g7
	udiv	%l4,	0x036D,	%l0
	subcc	%o1,	0x0FCA,	%o0
	edge8ln	%l6,	%l2,	%i2
	movne	%icc,	%g6,	%i6
	sll	%i4,	0x03,	%i0
	xnorcc	%o7,	%o6,	%g1
	fcmpne16	%f26,	%f26,	%l5
	orn	%g3,	0x1D94,	%o5
	movrgez	%i5,	0x20C,	%g2
	sll	%o2,	%i7,	%g4
	mova	%icc,	%i3,	%l1
	move	%icc,	%g5,	%o4
	xor	%i1,	%o3,	%g7
	stw	%l4,	[%l7 + 0x70]
	movrlz	%l3,	0x11A,	%o1
	fmovrsne	%o0,	%f9,	%f8
	fabsd	%f8,	%f22
	fmovrdgz	%l6,	%f10,	%f6
	ldd	[%l7 + 0x78],	%f16
	movcs	%icc,	%l0,	%l2
	alignaddr	%i2,	%i6,	%g6
	fmuld8sux16	%f11,	%f20,	%f4
	fmul8x16	%f4,	%f0,	%f30
	fnands	%f5,	%f1,	%f17
	fpadd16s	%f19,	%f14,	%f6
	ldx	[%l7 + 0x18],	%i4
	subcc	%o7,	0x1FBB,	%i0
	fmovdl	%icc,	%f23,	%f6
	movrgz	%g1,	%o6,	%l5
	stx	%g3,	[%l7 + 0x30]
	srl	%i5,	0x05,	%g2
	st	%f6,	[%l7 + 0x5C]
	fmovscc	%xcc,	%f24,	%f13
	mulx	%o2,	0x00F6,	%o5
	fone	%f18
	fpack32	%f8,	%f24,	%f4
	xorcc	%g4,	0x1527,	%i3
	xor	%l1,	0x011A,	%i7
	nop
	set	0x62, %i0
	ldsh	[%l7 + %i0],	%o4
	movle	%icc,	%i1,	%o3
	subc	%g7,	%l4,	%g5
	edge16ln	%l3,	%o0,	%l6
	addccc	%o1,	0x1B11,	%l0
	fxnors	%f7,	%f23,	%f20
	sub	%i2,	0x1B53,	%l2
	fxnors	%f15,	%f14,	%f31
	fnor	%f4,	%f8,	%f2
	fabss	%f29,	%f26
	edge32	%i6,	%i4,	%o7
	smulcc	%g6,	%g1,	%i0
	stx	%l5,	[%l7 + 0x78]
	ld	[%l7 + 0x08],	%f19
	move	%xcc,	%o6,	%g3
	fmovsg	%xcc,	%f28,	%f11
	ldd	[%l7 + 0x50],	%i4
	udiv	%g2,	0x0660,	%o2
	stx	%g4,	[%l7 + 0x58]
	sdiv	%o5,	0x0D25,	%l1
	movleu	%xcc,	%i3,	%i7
	ldsw	[%l7 + 0x54],	%o4
	umulcc	%o3,	0x16B1,	%i1
	edge8n	%g7,	%l4,	%l3
	fandnot1s	%f19,	%f19,	%f3
	fsrc1s	%f27,	%f15
	add	%o0,	%l6,	%g5
	fmul8ulx16	%f28,	%f2,	%f24
	fpsub16	%f30,	%f24,	%f4
	fpadd32s	%f15,	%f6,	%f29
	movrne	%o1,	0x011,	%l0
	fmul8sux16	%f30,	%f24,	%f12
	edge8l	%i2,	%i6,	%l2
	or	%i4,	0x0AB8,	%o7
	xnorcc	%g6,	0x0C0D,	%i0
	movrgez	%l5,	%g1,	%g3
	orcc	%o6,	%i5,	%o2
	fpsub16	%f4,	%f14,	%f2
	edge16ln	%g4,	%o5,	%g2
	addc	%i3,	0x08E2,	%l1
	nop
	set	0x20, %l0
	std	%f6,	[%l7 + %l0]
	stx	%i7,	[%l7 + 0x40]
	stb	%o4,	[%l7 + 0x60]
	move	%xcc,	%i1,	%g7
	srl	%o3,	%l3,	%o0
	fpadd16s	%f16,	%f29,	%f17
	sdiv	%l6,	0x0759,	%l4
	st	%f31,	[%l7 + 0x70]
	array16	%o1,	%g5,	%i2
	fmuld8sux16	%f7,	%f4,	%f20
	fcmpgt32	%f20,	%f10,	%i6
	sllx	%l2,	%i4,	%l0
	ldx	[%l7 + 0x48],	%g6
	add	%o7,	%i0,	%l5
	mova	%xcc,	%g1,	%g3
	movrlz	%o6,	%o2,	%g4
	ldd	[%l7 + 0x70],	%o4
	subccc	%i5,	0x0B8D,	%i3
	fmovrde	%l1,	%f14,	%f2
	stb	%g2,	[%l7 + 0x18]
	movcs	%xcc,	%o4,	%i1
	movrlez	%i7,	%g7,	%o3
	orcc	%l3,	0x10F7,	%o0
	bshuffle	%f8,	%f30,	%f16
	sth	%l6,	[%l7 + 0x0E]
	fmovdvc	%icc,	%f6,	%f21
	stw	%o1,	[%l7 + 0x10]
	sdivcc	%g5,	0x1E80,	%l4
	fmovrdgz	%i6,	%f16,	%f6
	array16	%l2,	%i2,	%l0
	movgu	%icc,	%g6,	%i4
	std	%f16,	[%l7 + 0x40]
	st	%f5,	[%l7 + 0x34]
	ldub	[%l7 + 0x70],	%o7
	edge8ln	%i0,	%l5,	%g1
	movn	%icc,	%g3,	%o6
	ldx	[%l7 + 0x70],	%o2
	alignaddrl	%o5,	%i5,	%g4
	edge8ln	%i3,	%g2,	%l1
	edge32ln	%i1,	%o4,	%i7
	edge32n	%o3,	%l3,	%o0
	edge32l	%g7,	%o1,	%g5
	fmuld8sux16	%f7,	%f7,	%f4
	smulcc	%l4,	0x0F03,	%i6
	movcs	%xcc,	%l2,	%i2
	edge16l	%l0,	%l6,	%g6
	sdivcc	%o7,	0x0A8B,	%i4
	movvs	%icc,	%l5,	%i0
	edge8	%g3,	%o6,	%o2
	sdiv	%o5,	0x122E,	%g1
	xor	%g4,	0x0A3E,	%i5
	movl	%xcc,	%g2,	%l1
	fmovdneg	%xcc,	%f10,	%f31
	fmuld8sux16	%f23,	%f0,	%f22
	edge16ln	%i3,	%o4,	%i1
	movrlez	%i7,	%o3,	%o0
	smulcc	%l3,	%g7,	%g5
	umulcc	%o1,	0x0599,	%i6
	mova	%icc,	%l2,	%i2
	fandnot2	%f14,	%f0,	%f28
	fnand	%f14,	%f0,	%f4
	movrne	%l4,	0x21E,	%l6
	fornot1	%f24,	%f2,	%f14
	addccc	%g6,	%l0,	%o7
	sdiv	%l5,	0x0985,	%i0
	subccc	%i4,	%o6,	%g3
	edge16l	%o5,	%o2,	%g1
	subc	%g4,	%i5,	%g2
	sdivx	%i3,	0x01E7,	%o4
	movrgez	%l1,	%i1,	%o3
	edge32l	%o0,	%i7,	%g7
	sll	%g5,	%o1,	%i6
	fcmpne16	%f8,	%f20,	%l2
	stx	%l3,	[%l7 + 0x30]
	mulx	%i2,	0x018E,	%l4
	udivx	%g6,	0x06C3,	%l0
	udivx	%l6,	0x1520,	%l5
	addccc	%i0,	0x1451,	%i4
	fmovdleu	%icc,	%f23,	%f28
	fmovse	%icc,	%f20,	%f1
	edge8	%o6,	%g3,	%o7
	edge16ln	%o5,	%o2,	%g1
	movl	%xcc,	%g4,	%g2
	movgu	%xcc,	%i5,	%o4
	ldd	[%l7 + 0x28],	%l0
	mova	%xcc,	%i3,	%i1
	movcs	%icc,	%o0,	%o3
	faligndata	%f20,	%f6,	%f12
	udivx	%i7,	0x0CDC,	%g7
	add	%g5,	0x1FBC,	%o1
	udivcc	%i6,	0x167E,	%l3
	addccc	%l2,	%l4,	%g6
	ldub	[%l7 + 0x56],	%i2
	edge8ln	%l6,	%l0,	%i0
	and	%l5,	%i4,	%o6
	fmovrdlez	%g3,	%f6,	%f28
	movgu	%icc,	%o5,	%o7
	movle	%icc,	%o2,	%g4
	save %g1, 0x1025, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o4,	[%l7 + 0x48]
	fmovspos	%icc,	%f21,	%f24
	subc	%i5,	0x1472,	%i3
	udivcc	%l1,	0x0C17,	%o0
	smulcc	%o3,	0x1A6E,	%i1
	smulcc	%g7,	0x1E79,	%i7
	umulcc	%o1,	0x1FB3,	%g5
	andncc	%l3,	%i6,	%l4
	fmovrdne	%l2,	%f28,	%f12
	smulcc	%g6,	%l6,	%i2
	fmuld8ulx16	%f29,	%f22,	%f2
	or	%l0,	0x08D6,	%l5
	fnand	%f0,	%f30,	%f24
	array32	%i0,	%i4,	%o6
	addccc	%g3,	%o7,	%o5
	fmovdcs	%xcc,	%f9,	%f28
	ldx	[%l7 + 0x28],	%o2
	fmovda	%icc,	%f9,	%f18
	orncc	%g1,	0x1D2D,	%g2
	sdiv	%o4,	0x03EB,	%g4
	edge32ln	%i3,	%i5,	%l1
	fors	%f18,	%f25,	%f28
	smulcc	%o0,	%o3,	%i1
	edge32ln	%g7,	%o1,	%i7
	smul	%g5,	%i6,	%l3
	addcc	%l2,	0x164A,	%g6
	fmovs	%f28,	%f13
	ldub	[%l7 + 0x62],	%l4
	movre	%l6,	0x28B,	%i2
	mova	%icc,	%l5,	%l0
	sth	%i0,	[%l7 + 0x08]
	movpos	%xcc,	%o6,	%g3
	movn	%xcc,	%i4,	%o5
	addccc	%o7,	0x1DCE,	%o2
	stw	%g2,	[%l7 + 0x08]
	array8	%g1,	%g4,	%o4
	subc	%i5,	0x05E1,	%i3
	fmovsneg	%xcc,	%f15,	%f7
	edge16l	%l1,	%o3,	%i1
	movn	%xcc,	%g7,	%o1
	umulcc	%i7,	%o0,	%g5
	movrlz	%l3,	%l2,	%g6
	array8	%l4,	%i6,	%i2
	movvs	%icc,	%l6,	%l5
	nop
	set	0x72, %l3
	sth	%i0,	[%l7 + %l3]
	fandnot1	%f4,	%f22,	%f22
	movne	%icc,	%o6,	%g3
	sub	%l0,	0x012E,	%o5
	fnor	%f28,	%f26,	%f4
	movrne	%i4,	0x1B8,	%o2
	udivx	%g2,	0x0AF9,	%g1
	fexpand	%f24,	%f4
	xnor	%g4,	%o4,	%i5
	fors	%f12,	%f30,	%f27
	array16	%i3,	%l1,	%o7
	movcc	%xcc,	%i1,	%g7
	fmul8sux16	%f18,	%f0,	%f6
	udiv	%o1,	0x1B38,	%i7
	addcc	%o3,	0x081E,	%o0
	fmul8x16au	%f31,	%f24,	%f0
	movn	%icc,	%g5,	%l2
	fnot2	%f4,	%f14
	fmovsne	%xcc,	%f9,	%f10
	ld	[%l7 + 0x08],	%f24
	mulx	%g6,	%l3,	%i6
	fandnot2	%f12,	%f10,	%f10
	fmovscs	%xcc,	%f0,	%f6
	fpack32	%f0,	%f18,	%f22
	fpadd16	%f14,	%f18,	%f20
	restore %i2, 0x08BC, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l5,	0x0733,	%l6
	fabss	%f22,	%f3
	movne	%icc,	%i0,	%g3
	sll	%l0,	%o5,	%i4
	fpack16	%f0,	%f3
	fcmple16	%f6,	%f28,	%o6
	sllx	%g2,	0x0F,	%o2
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	movl	%xcc,	%i5,	%g4
	sra	%i3,	0x06,	%o7
	fandnot2s	%f10,	%f7,	%f10
	std	%f18,	[%l7 + 0x70]
	fmovsle	%xcc,	%f3,	%f27
	fpmerge	%f6,	%f16,	%f18
	edge16l	%l1,	%g7,	%i1
	fmovdn	%icc,	%f27,	%f20
	fnor	%f24,	%f0,	%f24
	fsrc1s	%f5,	%f20
	stw	%i7,	[%l7 + 0x14]
	fzeros	%f27
	sll	%o1,	0x0D,	%o0
	orn	%o3,	%g5,	%l2
	subccc	%g6,	%l3,	%i2
	edge8ln	%i6,	%l5,	%l6
	umul	%l4,	%i0,	%g3
	st	%f9,	[%l7 + 0x38]
	faligndata	%f28,	%f22,	%f12
	movrgz	%o5,	%i4,	%o6
	fmovrdlez	%l0,	%f26,	%f0
	fmovde	%xcc,	%f21,	%f30
	movleu	%icc,	%g2,	%o2
	movcc	%icc,	%g1,	%i5
	edge16ln	%g4,	%o4,	%o7
	movn	%icc,	%i3,	%l1
	xnorcc	%i1,	0x0AE9,	%i7
	sth	%g7,	[%l7 + 0x22]
	fmovrdlz	%o0,	%f6,	%f0
	sra	%o1,	0x04,	%o3
	orcc	%g5,	0x12E4,	%l2
	fcmpne32	%f28,	%f26,	%g6
	xorcc	%l3,	%i2,	%i6
	popc	0x135B,	%l5
	sub	%l4,	0x03F5,	%i0
	ldsh	[%l7 + 0x62],	%l6
	andn	%o5,	0x1E06,	%i4
	subc	%o6,	%l0,	%g3
	ldd	[%l7 + 0x20],	%f16
	movg	%icc,	%g2,	%o2
	edge32ln	%g1,	%i5,	%o4
	std	%f30,	[%l7 + 0x50]
	nop
	set	0x2D, %i5
	stb	%o7,	[%l7 + %i5]
	array8	%g4,	%i3,	%l1
	mulscc	%i1,	%g7,	%o0
	fmovrsgz	%o1,	%f11,	%f27
	fornot2s	%f27,	%f19,	%f2
	fmovsa	%icc,	%f12,	%f16
	edge32n	%o3,	%i7,	%l2
	udivcc	%g6,	0x1E9B,	%g5
	fmovrdlez	%i2,	%f16,	%f14
	fmovrdgez	%i6,	%f20,	%f20
	siam	0x6
	fnegs	%f7,	%f21
	sra	%l3,	%l4,	%l5
	mulx	%i0,	0x1110,	%l6
	movn	%icc,	%o5,	%i4
	sdivx	%o6,	0x1BA8,	%g3
	xnorcc	%g2,	%l0,	%o2
	popc	0x07AD,	%g1
	orncc	%o4,	%o7,	%i5
	fxnor	%f2,	%f16,	%f12
	mulscc	%g4,	%i3,	%l1
	movrlez	%i1,	0x07F,	%g7
	edge8l	%o1,	%o3,	%i7
	edge16l	%o0,	%l2,	%g5
	stb	%i2,	[%l7 + 0x61]
	nop
	set	0x60, %g2
	ldsw	[%l7 + %g2],	%g6
	fornot1s	%f20,	%f11,	%f0
	fmovrse	%l3,	%f21,	%f24
	edge8l	%i6,	%l5,	%i0
	edge32ln	%l4,	%o5,	%l6
	fornot1	%f26,	%f20,	%f8
	subc	%i4,	%g3,	%g2
	movg	%xcc,	%l0,	%o2
	fmovdcc	%xcc,	%f11,	%f27
	ldd	[%l7 + 0x78],	%f20
	ldsb	[%l7 + 0x78],	%g1
	fmovda	%icc,	%f14,	%f13
	nop
	set	0x61, %g4
	ldub	[%l7 + %g4],	%o4
	movl	%xcc,	%o7,	%i5
	orcc	%o6,	%g4,	%i3
	andn	%l1,	%g7,	%o1
	faligndata	%f6,	%f4,	%f8
	sub	%o3,	0x0276,	%i7
	movrlz	%i1,	0x178,	%o0
	sdiv	%l2,	0x112E,	%i2
	fandnot2	%f4,	%f8,	%f20
	movrlz	%g5,	0x238,	%l3
	ld	[%l7 + 0x10],	%f0
	edge8n	%g6,	%l5,	%i0
	ldub	[%l7 + 0x11],	%l4
	array8	%o5,	%l6,	%i4
	fpack32	%f16,	%f30,	%f28
	edge32n	%g3,	%g2,	%l0
	edge8ln	%i6,	%o2,	%o4
	srax	%g1,	0x18,	%o7
	edge8n	%i5,	%g4,	%o6
	ldd	[%l7 + 0x60],	%f30
	udivcc	%i3,	0x0395,	%l1
	movl	%xcc,	%g7,	%o3
	movrgez	%i7,	%i1,	%o1
	mulx	%o0,	0x0F3D,	%i2
	sdivcc	%g5,	0x114A,	%l2
	std	%f10,	[%l7 + 0x50]
	subccc	%l3,	%l5,	%g6
	edge16l	%i0,	%o5,	%l6
	movgu	%xcc,	%l4,	%i4
	edge32l	%g2,	%l0,	%g3
	movrlz	%o2,	0x008,	%i6
	subccc	%g1,	%o4,	%o7
	nop
	set	0x2C, %g1
	sth	%i5,	[%l7 + %g1]
	fmovsvs	%icc,	%f23,	%f10
	array16	%o6,	%g4,	%i3
	edge8	%l1,	%o3,	%g7
	srax	%i1,	0x1F,	%i7
	xnor	%o1,	0x1255,	%i2
	nop
	set	0x3C, %l1
	stw	%g5,	[%l7 + %l1]
	smulcc	%o0,	0x06B5,	%l3
	nop
	set	0x1A, %o1
	ldsh	[%l7 + %o1],	%l5
	ldub	[%l7 + 0x1F],	%l2
	sir	0x1290
	addcc	%g6,	0x1BD5,	%o5
	movrne	%i0,	%l4,	%i4
	fmuld8ulx16	%f4,	%f9,	%f20
	fmovdvc	%xcc,	%f9,	%f1
	edge16ln	%g2,	%l0,	%l6
	fnor	%f10,	%f24,	%f14
	udivx	%g3,	0x0841,	%o2
	std	%f12,	[%l7 + 0x70]
	sdivx	%i6,	0x1511,	%g1
	movg	%xcc,	%o7,	%o4
	mulx	%i5,	%g4,	%i3
	alignaddr	%l1,	%o3,	%o6
	fsrc2s	%f21,	%f8
	movne	%xcc,	%i1,	%g7
	edge8n	%i7,	%o1,	%g5
	umul	%o0,	%i2,	%l3
	sth	%l5,	[%l7 + 0x60]
	addc	%l2,	0x042F,	%g6
	movrlez	%o5,	0x1E0,	%i0
	sdivcc	%l4,	0x1E48,	%g2
	srl	%l0,	0x10,	%i4
	movleu	%xcc,	%g3,	%l6
	edge16n	%o2,	%i6,	%o7
	edge32ln	%o4,	%i5,	%g1
	fmovdge	%icc,	%f15,	%f6
	movcc	%xcc,	%g4,	%l1
	fmovs	%f4,	%f26
	or	%o3,	0x0B28,	%o6
	st	%f11,	[%l7 + 0x14]
	mulscc	%i1,	0x1B0F,	%i3
	smul	%i7,	%g7,	%o1
	movcc	%xcc,	%g5,	%i2
	fmovrde	%o0,	%f16,	%f4
	ldd	[%l7 + 0x48],	%f12
	movneg	%xcc,	%l5,	%l2
	xorcc	%g6,	%l3,	%i0
	edge16n	%l4,	%o5,	%g2
	mulx	%l0,	%g3,	%i4
	umulcc	%l6,	0x0738,	%o2
	xor	%i6,	0x0A0B,	%o7
	fone	%f18
	edge8ln	%o4,	%i5,	%g4
	mova	%icc,	%l1,	%o3
	udivcc	%g1,	0x1D82,	%i1
	addccc	%o6,	%i7,	%i3
	umul	%g7,	%o1,	%g5
	fpsub16s	%f27,	%f13,	%f5
	orn	%o0,	%i2,	%l2
	srl	%g6,	%l3,	%i0
	fmovsg	%xcc,	%f19,	%f8
	fmovda	%icc,	%f3,	%f31
	movcs	%xcc,	%l5,	%o5
	udivcc	%l4,	0x1E78,	%l0
	movpos	%xcc,	%g2,	%i4
	andn	%g3,	%o2,	%l6
	srax	%i6,	%o4,	%i5
	fcmped	%fcc3,	%f26,	%f12
	fcmpgt16	%f6,	%f2,	%o7
	smulcc	%l1,	%g4,	%g1
	fpadd16	%f6,	%f18,	%f10
	addc	%o3,	%o6,	%i1
	movle	%icc,	%i7,	%i3
	sllx	%o1,	0x00,	%g5
	xorcc	%g7,	0x1EB7,	%i2
	srl	%o0,	%l2,	%g6
	fandnot2s	%f0,	%f21,	%f8
	sth	%l3,	[%l7 + 0x10]
	movleu	%icc,	%i0,	%o5
	ldsb	[%l7 + 0x47],	%l4
	xorcc	%l0,	0x1F76,	%g2
	sub	%i4,	%l5,	%o2
	popc	0x0DA9,	%l6
	faligndata	%f16,	%f16,	%f26
	fandnot2s	%f16,	%f11,	%f7
	ldsb	[%l7 + 0x5E],	%g3
	fcmple32	%f0,	%f14,	%i6
	edge8	%i5,	%o4,	%l1
	fmovsge	%xcc,	%f11,	%f0
	orncc	%o7,	%g4,	%o3
	mova	%icc,	%g1,	%o6
	ldsh	[%l7 + 0x34],	%i7
	sdivx	%i1,	0x0ADC,	%o1
	ldub	[%l7 + 0x27],	%g5
	fmovscc	%icc,	%f11,	%f0
	mulx	%g7,	%i2,	%o0
	sir	0x1948
	movrlez	%i3,	%l2,	%g6
	ldub	[%l7 + 0x1D],	%l3
	fzeros	%f6
	movrgez	%i0,	%o5,	%l0
	movrlez	%g2,	%i4,	%l5
	ldsh	[%l7 + 0x3E],	%l4
	stx	%o2,	[%l7 + 0x28]
	edge16n	%g3,	%i6,	%l6
	movcs	%xcc,	%i5,	%l1
	move	%icc,	%o7,	%g4
	fabss	%f6,	%f5
	restore %o3, %g1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%i7,	%i1
	lduw	[%l7 + 0x5C],	%o1
	edge8n	%g5,	%g7,	%o4
	fmovrslz	%i2,	%f25,	%f2
	movvs	%icc,	%o0,	%i3
	mova	%icc,	%g6,	%l3
	edge16	%l2,	%i0,	%l0
	fmovdcc	%xcc,	%f6,	%f12
	fpsub32s	%f23,	%f7,	%f7
	movvc	%xcc,	%g2,	%i4
	movle	%xcc,	%l5,	%o5
	movg	%xcc,	%l4,	%o2
	subccc	%g3,	0x0A61,	%i6
	alignaddrl	%i5,	%l1,	%o7
	movcc	%icc,	%l6,	%g4
	fmovscs	%xcc,	%f10,	%f31
	edge32ln	%g1,	%o3,	%o6
	st	%f11,	[%l7 + 0x54]
	fmul8x16au	%f22,	%f3,	%f10
	sub	%i1,	%o1,	%g5
	xnor	%g7,	%i7,	%o4
	ldsw	[%l7 + 0x74],	%i2
	lduh	[%l7 + 0x6A],	%i3
	ldub	[%l7 + 0x7B],	%o0
	srlx	%g6,	0x11,	%l2
	srl	%i0,	0x19,	%l0
	nop
	set	0x28, %g6
	lduh	[%l7 + %g6],	%g2
	movcs	%icc,	%i4,	%l5
	fnor	%f28,	%f30,	%f6
	edge16	%l3,	%l4,	%o5
	fcmpne16	%f24,	%f18,	%o2
	orcc	%i6,	%g3,	%l1
	ldx	[%l7 + 0x10],	%o7
	addccc	%i5,	0x069B,	%g4
	movg	%xcc,	%g1,	%l6
	ldsw	[%l7 + 0x08],	%o3
	edge32l	%o6,	%o1,	%g5
	save %i1, 0x1810, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0DFE,	%o4
	udiv	%g7,	0x09B5,	%i3
	lduw	[%l7 + 0x64],	%o0
	lduw	[%l7 + 0x74],	%g6
	movgu	%xcc,	%i2,	%l2
	fmovdge	%icc,	%f8,	%f6
	lduh	[%l7 + 0x36],	%i0
	movne	%xcc,	%g2,	%i4
	fmovsvs	%xcc,	%f3,	%f29
	lduh	[%l7 + 0x5C],	%l5
	fmovdg	%icc,	%f10,	%f19
	fmovdpos	%xcc,	%f2,	%f5
	fmul8x16	%f11,	%f22,	%f4
	edge32l	%l3,	%l4,	%o5
	and	%o2,	0x1CF6,	%l0
	edge8ln	%g3,	%i6,	%o7
	movneg	%icc,	%i5,	%l1
	ldd	[%l7 + 0x70],	%g4
	srl	%l6,	0x1F,	%g1
	movn	%xcc,	%o3,	%o6
	fsrc2s	%f15,	%f23
	stx	%g5,	[%l7 + 0x58]
	umul	%i1,	%o1,	%i7
	movne	%xcc,	%o4,	%i3
	movgu	%xcc,	%o0,	%g7
	faligndata	%f24,	%f26,	%f26
	addccc	%i2,	0x016D,	%l2
	stx	%g6,	[%l7 + 0x10]
	lduh	[%l7 + 0x6E],	%g2
	xnorcc	%i4,	0x0D24,	%i0
	edge32ln	%l3,	%l4,	%l5
	movrgz	%o5,	0x3A1,	%o2
	sub	%l0,	0x0507,	%i6
	edge32ln	%o7,	%i5,	%l1
	movrlez	%g4,	0x11E,	%l6
	move	%xcc,	%g3,	%o3
	ldd	[%l7 + 0x68],	%o6
	st	%f31,	[%l7 + 0x38]
	nop
	set	0x10, %i2
	stw	%g5,	[%l7 + %i2]
	fmovsl	%xcc,	%f29,	%f8
	ldd	[%l7 + 0x38],	%f20
	popc	%i1,	%g1
	mulscc	%i7,	%o4,	%o1
	smul	%o0,	%i3,	%g7
	ldsh	[%l7 + 0x46],	%i2
	movn	%xcc,	%g6,	%l2
	stb	%g2,	[%l7 + 0x35]
	edge8l	%i4,	%l3,	%l4
	orcc	%l5,	0x156E,	%o5
	ldd	[%l7 + 0x30],	%i0
	mova	%icc,	%l0,	%i6
	move	%icc,	%o2,	%i5
	movvc	%xcc,	%o7,	%g4
	nop
	set	0x3E, %i1
	ldsh	[%l7 + %i1],	%l6
	fmovdpos	%xcc,	%f21,	%f19
	std	%f18,	[%l7 + 0x28]
	ldx	[%l7 + 0x68],	%l1
	fxors	%f7,	%f12,	%f13
	fmovdcs	%icc,	%f7,	%f31
	smul	%g3,	%o3,	%o6
	fmovrdne	%g5,	%f24,	%f18
	sth	%i1,	[%l7 + 0x52]
	movg	%xcc,	%g1,	%i7
	edge8n	%o1,	%o0,	%o4
	subccc	%g7,	0x19B8,	%i2
	movvs	%xcc,	%i3,	%l2
	mulscc	%g6,	%g2,	%i4
	or	%l3,	0x1FBD,	%l4
	fxnor	%f6,	%f28,	%f18
	xorcc	%o5,	%l5,	%l0
	xor	%i6,	0x04D6,	%o2
	smul	%i0,	%o7,	%i5
	edge16ln	%l6,	%g4,	%g3
	subccc	%o3,	%l1,	%o6
	fabsd	%f2,	%f22
	fsrc2	%f12,	%f2
	sra	%g5,	%i1,	%g1
	sll	%o1,	0x00,	%i7
	subc	%o4,	0x0E4C,	%o0
	movle	%icc,	%i2,	%i3
	movneg	%icc,	%l2,	%g7
	sir	0x1540
	edge32n	%g2,	%g6,	%i4
	st	%f15,	[%l7 + 0x6C]
	fcmpeq16	%f18,	%f4,	%l3
	subcc	%l4,	0x00DA,	%l5
	andn	%l0,	0x13F7,	%i6
	std	%f12,	[%l7 + 0x20]
	ld	[%l7 + 0x78],	%f12
	smulcc	%o2,	%i0,	%o5
	pdist	%f4,	%f4,	%f24
	movre	%o7,	%l6,	%i5
	array8	%g3,	%g4,	%o3
	movpos	%icc,	%o6,	%g5
	subc	%l1,	%g1,	%o1
	ldsb	[%l7 + 0x46],	%i1
	movl	%xcc,	%i7,	%o0
	andcc	%i2,	%o4,	%i3
	ldsh	[%l7 + 0x62],	%l2
	fmovde	%icc,	%f5,	%f17
	srlx	%g7,	0x18,	%g6
	movgu	%xcc,	%g2,	%i4
	mulx	%l3,	0x0045,	%l5
	xorcc	%l4,	%i6,	%o2
	edge8ln	%l0,	%o5,	%i0
	ldd	[%l7 + 0x78],	%f28
	alignaddr	%o7,	%l6,	%g3
	ldsw	[%l7 + 0x60],	%g4
	fnot1s	%f14,	%f19
	sethi	0x0E67,	%o3
	ldsw	[%l7 + 0x2C],	%o6
	ldx	[%l7 + 0x48],	%i5
	subcc	%g5,	0x0E08,	%g1
	sdivx	%l1,	0x191E,	%i1
	st	%f19,	[%l7 + 0x48]
	xor	%i7,	%o1,	%o0
	mulx	%o4,	0x0F98,	%i3
	sdiv	%l2,	0x0499,	%g7
	addccc	%g6,	%i2,	%i4
	orncc	%g2,	0x07FC,	%l3
	std	%f16,	[%l7 + 0x48]
	udivcc	%l5,	0x1B6C,	%i6
	movge	%xcc,	%o2,	%l4
	fmovd	%f20,	%f0
	fmovdn	%icc,	%f18,	%f6
	ldx	[%l7 + 0x30],	%l0
	fmul8x16	%f20,	%f6,	%f24
	nop
	set	0x0E, %o7
	lduh	[%l7 + %o7],	%i0
	fabss	%f22,	%f7
	ldd	[%l7 + 0x58],	%o4
	fxnors	%f7,	%f4,	%f29
	st	%f3,	[%l7 + 0x40]
	alignaddr	%l6,	%o7,	%g3
	ldsb	[%l7 + 0x40],	%g4
	fmovsg	%icc,	%f4,	%f7
	ldd	[%l7 + 0x78],	%o6
	ldsw	[%l7 + 0x68],	%o3
	movvc	%icc,	%g5,	%g1
	move	%icc,	%l1,	%i1
	movpos	%icc,	%i7,	%o1
	movn	%xcc,	%i5,	%o4
	fmovscs	%icc,	%f31,	%f7
	ldsh	[%l7 + 0x42],	%i3
	alignaddrl	%o0,	%g7,	%l2
	sth	%g6,	[%l7 + 0x7E]
	edge16l	%i4,	%i2,	%g2
	edge8	%l3,	%i6,	%l5
	subc	%o2,	0x1CFF,	%l0
	xor	%l4,	0x03A2,	%i0
	movcs	%xcc,	%l6,	%o7
	andncc	%g3,	%g4,	%o5
	fmovdle	%icc,	%f28,	%f0
	fnot2s	%f19,	%f15
	srl	%o6,	%o3,	%g1
	move	%xcc,	%g5,	%l1
	xnorcc	%i1,	0x0FBB,	%i7
	alignaddrl	%i5,	%o1,	%i3
	popc	0x049B,	%o4
	srl	%o0,	0x13,	%g7
	and	%g6,	%i4,	%l2
	fnands	%f20,	%f15,	%f20
	fcmps	%fcc1,	%f1,	%f19
	edge16	%i2,	%g2,	%i6
	ldd	[%l7 + 0x78],	%l2
	sra	%o2,	%l5,	%l4
	xor	%l0,	%i0,	%o7
	fnegs	%f24,	%f1
	bshuffle	%f10,	%f30,	%f24
	movrne	%l6,	0x0C0,	%g4
	movrlz	%g3,	%o6,	%o5
	fmovrslez	%o3,	%f25,	%f31
	ldsb	[%l7 + 0x3A],	%g1
	mova	%icc,	%l1,	%i1
	fmuld8sux16	%f1,	%f10,	%f18
	fcmpeq32	%f26,	%f28,	%g5
	fmovsneg	%xcc,	%f21,	%f27
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	restore %i3, %o4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i5,	%g7
	fnand	%f14,	%f8,	%f12
	movgu	%xcc,	%i4,	%g6
	sdivx	%l2,	0x1C67,	%g2
	lduw	[%l7 + 0x48],	%i6
	xnor	%i2,	%l3,	%l5
	fmovsne	%xcc,	%f20,	%f29
	sra	%l4,	%o2,	%l0
	xor	%o7,	0x0252,	%l6
	edge16n	%g4,	%g3,	%i0
	std	%f26,	[%l7 + 0x50]
	movleu	%xcc,	%o6,	%o5
	srl	%o3,	0x0F,	%g1
	fmovd	%f2,	%f14
	fcmpeq16	%f14,	%f24,	%i1
	smulcc	%g5,	%l1,	%o1
	array32	%i3,	%i7,	%o4
	sdivcc	%o0,	0x181B,	%g7
	xorcc	%i5,	0x10AA,	%i4
	alignaddrl	%g6,	%g2,	%l2
	xorcc	%i6,	0x0319,	%l3
	edge32	%l5,	%l4,	%i2
	fcmpgt32	%f14,	%f0,	%l0
	ldsb	[%l7 + 0x45],	%o2
	ldsw	[%l7 + 0x24],	%l6
	umul	%g4,	0x06F4,	%o7
	umulcc	%g3,	0x1DF1,	%i0
	fpadd32s	%f25,	%f27,	%f31
	udivcc	%o5,	0x1E87,	%o3
	nop
	set	0x40, %g7
	stx	%g1,	[%l7 + %g7]
	sir	0x0D94
	fmovscs	%icc,	%f28,	%f11
	move	%xcc,	%i1,	%o6
	orn	%g5,	%l1,	%i3
	fmul8sux16	%f0,	%f20,	%f24
	andcc	%i7,	%o1,	%o4
	nop
	set	0x7E, %i7
	sth	%o0,	[%l7 + %i7]
	xnorcc	%i5,	0x17AC,	%g7
	array8	%g6,	%i4,	%l2
	fmovrdne	%g2,	%f6,	%f20
	array8	%l3,	%l5,	%i6
	nop
	set	0x14, %g5
	ldsw	[%l7 + %g5],	%i2
	orcc	%l0,	%l4,	%l6
	fpadd32s	%f19,	%f29,	%f11
	edge8	%g4,	%o2,	%g3
	addc	%i0,	%o7,	%o3
	or	%g1,	0x0965,	%i1
	edge32l	%o5,	%o6,	%l1
	lduh	[%l7 + 0x08],	%g5
	fandnot2	%f28,	%f28,	%f0
	movne	%xcc,	%i3,	%i7
	ldsw	[%l7 + 0x50],	%o1
	fcmpgt16	%f0,	%f6,	%o4
	movgu	%icc,	%o0,	%g7
	mova	%icc,	%i5,	%i4
	movre	%g6,	%g2,	%l2
	fmul8x16au	%f2,	%f10,	%f20
	lduh	[%l7 + 0x16],	%l3
	ldsw	[%l7 + 0x60],	%i6
	ldsw	[%l7 + 0x10],	%l5
	fmovdpos	%xcc,	%f6,	%f2
	edge32	%i2,	%l4,	%l6
	sdivx	%l0,	0x0FB6,	%g4
	stb	%g3,	[%l7 + 0x77]
	movn	%xcc,	%o2,	%i0
	fpackfix	%f10,	%f22
	fcmpgt16	%f6,	%f30,	%o7
	fmovdcc	%icc,	%f6,	%f15
	movneg	%xcc,	%g1,	%o3
	movre	%i1,	%o5,	%o6
	fmovdgu	%icc,	%f11,	%f17
	movvs	%xcc,	%g5,	%i3
	and	%i7,	%l1,	%o1
	st	%f10,	[%l7 + 0x6C]
	movg	%icc,	%o0,	%o4
	popc	0x170F,	%g7
	alignaddrl	%i4,	%g6,	%g2
	fnands	%f30,	%f25,	%f16
	edge32n	%i5,	%l2,	%i6
	smulcc	%l5,	%i2,	%l4
	add	%l6,	%l0,	%g4
	fmul8x16au	%f25,	%f24,	%f28
	sdivx	%g3,	0x0CE1,	%l3
	sir	0x11BC
	movrgez	%i0,	%o7,	%g1
	fmovdpos	%xcc,	%f5,	%f17
	movrgz	%o2,	0x0F4,	%i1
	smulcc	%o3,	%o5,	%g5
	lduw	[%l7 + 0x18],	%i3
	st	%f9,	[%l7 + 0x0C]
	alignaddrl	%o6,	%i7,	%o1
	andcc	%l1,	0x0C60,	%o4
	edge16	%g7,	%o0,	%i4
	faligndata	%f28,	%f12,	%f10
	edge8ln	%g2,	%i5,	%l2
	edge32n	%g6,	%i6,	%i2
	andn	%l5,	%l4,	%l0
	fnands	%f24,	%f9,	%f26
	edge32ln	%g4,	%l6,	%l3
	ldsh	[%l7 + 0x30],	%g3
	ldd	[%l7 + 0x58],	%f14
	fmovdne	%icc,	%f28,	%f18
	nop
	set	0x44, %l2
	sth	%i0,	[%l7 + %l2]
	ldsb	[%l7 + 0x46],	%o7
	for	%f10,	%f28,	%f8
	fzero	%f8
	nop
	set	0x38, %l6
	ldsw	[%l7 + %l6],	%o2
	add	%g1,	0x1ED1,	%i1
	ldx	[%l7 + 0x40],	%o3
	mulx	%g5,	%o5,	%o6
	fornot2	%f22,	%f26,	%f6
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%f14
	fmovrdne	%i3,	%f30,	%f4
	ldd	[%l7 + 0x58],	%f4
	array32	%i7,	%o1,	%o4
	edge8l	%g7,	%o0,	%l1
	sdiv	%g2,	0x0ADE,	%i4
	mova	%xcc,	%l2,	%g6
	fcmple32	%f10,	%f14,	%i5
	addcc	%i6,	0x1675,	%i2
	addc	%l4,	%l5,	%g4
	or	%l6,	0x0764,	%l3
	xorcc	%g3,	0x085D,	%l0
	fsrc2	%f26,	%f10
	movle	%icc,	%o7,	%i0
	mulx	%g1,	0x1437,	%o2
	fmovrse	%i1,	%f11,	%f19
	movpos	%icc,	%o3,	%o5
	andncc	%o6,	%g5,	%i7
	xor	%i3,	%o1,	%o4
	fpmerge	%f25,	%f7,	%f30
	stx	%o0,	[%l7 + 0x50]
	srl	%l1,	0x03,	%g7
	fpadd32	%f22,	%f2,	%f22
	movrgz	%i4,	0x247,	%g2
	srl	%g6,	0x11,	%l2
	movre	%i6,	%i5,	%i2
	array8	%l4,	%g4,	%l5
	fmul8ulx16	%f20,	%f24,	%f18
	andncc	%l3,	%l6,	%g3
	add	%l0,	0x0E18,	%o7
	mulx	%g1,	%o2,	%i1
	movn	%icc,	%o3,	%o5
	udiv	%i0,	0x000C,	%o6
	fxnors	%f29,	%f22,	%f2
	movrlez	%i7,	%i3,	%g5
	fmovsl	%xcc,	%f25,	%f22
	ldsw	[%l7 + 0x70],	%o4
	srax	%o0,	0x1E,	%l1
	movpos	%xcc,	%o1,	%i4
	movcs	%xcc,	%g2,	%g7
	and	%l2,	%g6,	%i6
	edge16ln	%i2,	%l4,	%i5
	fcmped	%fcc0,	%f14,	%f12
	andncc	%l5,	%l3,	%l6
	ldd	[%l7 + 0x10],	%g2
	edge16	%g4,	%o7,	%g1
	xorcc	%l0,	0x006F,	%i1
	nop
	set	0x20, %o3
	ldx	[%l7 + %o3],	%o3
	movcc	%xcc,	%o2,	%o5
	fmovda	%icc,	%f22,	%f30
	orncc	%i0,	%o6,	%i3
	fand	%f18,	%f14,	%f30
	edge8	%i7,	%o4,	%o0
	movg	%icc,	%l1,	%o1
	orncc	%g5,	%g2,	%i4
	move	%xcc,	%l2,	%g7
	edge16n	%i6,	%g6,	%i2
	movrgez	%i5,	0x3AE,	%l4
	sth	%l5,	[%l7 + 0x5E]
	sdivx	%l3,	0x1579,	%g3
	edge16l	%l6,	%o7,	%g4
	ldsh	[%l7 + 0x12],	%l0
	sra	%i1,	0x0C,	%o3
	udivcc	%g1,	0x1013,	%o5
	orcc	%i0,	%o2,	%o6
	addcc	%i7,	0x190D,	%i3
	mova	%xcc,	%o4,	%l1
	sth	%o0,	[%l7 + 0x70]
	edge8	%o1,	%g2,	%g5
	fmovspos	%icc,	%f6,	%f2
	fexpand	%f12,	%f26
	fpackfix	%f0,	%f13
	edge8n	%l2,	%g7,	%i6
	sir	0x004D
	sllx	%g6,	%i4,	%i2
	movcc	%icc,	%i5,	%l5
	st	%f9,	[%l7 + 0x18]
	popc	%l3,	%l4
	orncc	%l6,	0x04F0,	%o7
	save %g4, %g3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x6A],	%i1
	nop
	set	0x54, %i6
	ldsw	[%l7 + %i6],	%g1
	movrne	%o5,	%o3,	%o2
	save %o6, %i7, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o4,	%i3,	%l1
	movvc	%xcc,	%o1,	%g2
	move	%icc,	%g5,	%l2
	edge32n	%o0,	%i6,	%g7
	movn	%icc,	%g6,	%i2
	fandnot2s	%f24,	%f20,	%f11
	addc	%i5,	%l5,	%l3
	ldsb	[%l7 + 0x19],	%l4
	popc	0x092D,	%l6
	and	%o7,	0x048F,	%i4
	popc	0x1A96,	%g3
	ldub	[%l7 + 0x7E],	%g4
	andncc	%i1,	%g1,	%o5
	movneg	%xcc,	%l0,	%o2
	alignaddrl	%o6,	%o3,	%i0
	umulcc	%o4,	%i3,	%l1
	movre	%o1,	%i7,	%g2
	fandnot1s	%f15,	%f1,	%f0
	addc	%g5,	0x0EAF,	%o0
	fornot2s	%f2,	%f31,	%f5
	sll	%l2,	%g7,	%i6
	movneg	%xcc,	%g6,	%i2
	movleu	%icc,	%i5,	%l5
	movre	%l4,	0x05D,	%l6
	mova	%icc,	%l3,	%o7
	sllx	%i4,	%g4,	%g3
	udivx	%i1,	0x1070,	%g1
	edge8	%l0,	%o5,	%o6
	movcs	%xcc,	%o2,	%i0
	fxors	%f17,	%f31,	%f4
	srl	%o3,	0x13,	%o4
	ldsh	[%l7 + 0x1E],	%i3
	st	%f7,	[%l7 + 0x28]
	fsrc1	%f8,	%f10
	fsrc1	%f24,	%f20
	fnor	%f24,	%f6,	%f18
	edge16l	%l1,	%i7,	%g2
	sdiv	%o1,	0x014C,	%g5
	edge8l	%l2,	%o0,	%g7
	ldd	[%l7 + 0x38],	%i6
	sdivcc	%i2,	0x127A,	%g6
	lduh	[%l7 + 0x5E],	%i5
	lduh	[%l7 + 0x38],	%l5
	edge32	%l6,	%l4,	%o7
	stb	%l3,	[%l7 + 0x32]
	fmovrse	%i4,	%f19,	%f28
	mulscc	%g4,	0x1B0B,	%g3
	movrne	%g1,	0x302,	%i1
	fsrc2	%f16,	%f20
	subccc	%l0,	%o5,	%o6
	edge32ln	%o2,	%o3,	%o4
	xor	%i3,	%i0,	%l1
	popc	0x1023,	%g2
	movne	%xcc,	%i7,	%g5
	udivcc	%o1,	0x0ABD,	%l2
	fmul8sux16	%f0,	%f0,	%f4
	movpos	%icc,	%o0,	%i6
	addc	%g7,	%i2,	%g6
	fzeros	%f24
	movpos	%xcc,	%l5,	%i5
	fmovdge	%xcc,	%f12,	%f18
	fpsub16s	%f3,	%f17,	%f18
	movpos	%icc,	%l6,	%o7
	edge8n	%l4,	%l3,	%i4
	movgu	%icc,	%g3,	%g1
	movrlz	%g4,	0x2A8,	%i1
	subc	%l0,	0x0231,	%o5
	fmovsl	%xcc,	%f26,	%f7
	edge32n	%o2,	%o6,	%o4
	faligndata	%f6,	%f28,	%f8
	udivcc	%i3,	0x1F3D,	%i0
	st	%f3,	[%l7 + 0x7C]
	movvc	%xcc,	%l1,	%o3
	movne	%xcc,	%i7,	%g5
	save %g2, 0x004E, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o1,	%o0,	%i6
	movneg	%icc,	%i2,	%g7
	movn	%icc,	%g6,	%l5
	xnorcc	%l6,	0x1733,	%o7
	movpos	%icc,	%l4,	%l3
	andcc	%i5,	0x11DE,	%g3
	save %i4, 0x1F1B, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g1,	0x0D82,	%l0
	array32	%o5,	%o2,	%o6
	fmovdl	%xcc,	%f19,	%f1
	edge8ln	%o4,	%i1,	%i0
	ldsw	[%l7 + 0x28],	%i3
	movl	%icc,	%o3,	%i7
	ldx	[%l7 + 0x18],	%g5
	edge16	%l1,	%g2,	%o1
	andn	%o0,	%i6,	%l2
	fsrc1	%f22,	%f6
	or	%g7,	0x0C6D,	%i2
	ldd	[%l7 + 0x20],	%f10
	mova	%xcc,	%l5,	%g6
	smulcc	%l6,	0x1DE9,	%l4
	smulcc	%o7,	0x16D8,	%l3
	fmovdvc	%xcc,	%f25,	%f11
	fmovd	%f24,	%f4
	sdivx	%i5,	0x0523,	%g3
	edge16ln	%g4,	%g1,	%i4
	edge16n	%o5,	%l0,	%o2
	ldx	[%l7 + 0x68],	%o6
	fand	%f6,	%f14,	%f26
	sdiv	%i1,	0x17B1,	%o4
	edge16	%i3,	%i0,	%o3
	sth	%g5,	[%l7 + 0x58]
	smul	%l1,	0x12FF,	%i7
	srlx	%g2,	0x02,	%o0
	movgu	%xcc,	%i6,	%o1
	fcmpeq32	%f14,	%f8,	%g7
	xorcc	%i2,	%l5,	%g6
	sir	0x195E
	move	%xcc,	%l2,	%l6
	srax	%o7,	%l4,	%i5
	addc	%g3,	%g4,	%l3
	ldd	[%l7 + 0x48],	%i4
	sth	%g1,	[%l7 + 0x0C]
	mulx	%l0,	%o5,	%o6
	addcc	%o2,	0x1DB7,	%o4
	siam	0x6
	fnot2s	%f7,	%f7
	stx	%i3,	[%l7 + 0x78]
	stw	%i0,	[%l7 + 0x50]
	edge16n	%o3,	%i1,	%l1
	fmovrdgez	%g5,	%f12,	%f2
	xorcc	%g2,	%o0,	%i6
	array32	%i7,	%g7,	%i2
	nop
	set	0x30, %o6
	std	%f6,	[%l7 + %o6]
	edge8l	%o1,	%l5,	%l2
	fzero	%f26
	movrlez	%g6,	%o7,	%l6
	and	%i5,	%l4,	%g4
	sdivcc	%g3,	0x1F01,	%l3
	andncc	%i4,	%g1,	%l0
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	umulcc	%i3,	%i0,	%o3
	popc	%i1,	%l1
	st	%f1,	[%l7 + 0x14]
	edge8n	%o4,	%g5,	%o0
	popc	%g2,	%i7
	smulcc	%i6,	0x1BB1,	%i2
	subc	%o1,	0x0DFF,	%l5
	movrgez	%l2,	0x0F0,	%g7
	addccc	%g6,	%o7,	%l6
	sra	%l4,	0x10,	%i5
	movg	%xcc,	%g4,	%g3
	srl	%l3,	0x0E,	%i4
	umul	%g1,	0x04A9,	%l0
	fornot1s	%f1,	%f23,	%f24
	fmovsgu	%xcc,	%f8,	%f3
	movl	%icc,	%o2,	%o6
	edge32n	%i3,	%i0,	%o3
	movre	%i1,	%l1,	%o4
	ldsb	[%l7 + 0x5F],	%o5
	edge32l	%g5,	%o0,	%i7
	ldd	[%l7 + 0x50],	%f6
	movpos	%xcc,	%g2,	%i2
	fmovscs	%xcc,	%f5,	%f4
	add	%o1,	%i6,	%l2
	edge16	%g7,	%l5,	%g6
	stw	%o7,	[%l7 + 0x40]
	ldsh	[%l7 + 0x2E],	%l6
	subccc	%i5,	0x0587,	%g4
	fnot1	%f4,	%f18
	sllx	%l4,	0x15,	%l3
	movl	%xcc,	%i4,	%g3
	ldx	[%l7 + 0x58],	%g1
	addccc	%l0,	%o6,	%i3
	addc	%i0,	%o2,	%o3
	srax	%i1,	%o4,	%o5
	fnot2	%f8,	%f26
	sll	%g5,	0x18,	%l1
	edge16ln	%o0,	%g2,	%i7
	movge	%icc,	%o1,	%i6
	orcc	%l2,	%g7,	%l5
	subc	%i2,	0x1417,	%o7
	save %g6, %l6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x20],	%f3
	edge32ln	%g4,	%l3,	%l4
	sth	%g3,	[%l7 + 0x2C]
	stb	%i4,	[%l7 + 0x79]
	alignaddrl	%l0,	%o6,	%i3
	sdiv	%g1,	0x159D,	%o2
	edge32n	%o3,	%i1,	%o4
	movleu	%xcc,	%i0,	%g5
	sethi	0x0428,	%o5
	movrne	%l1,	0x3D8,	%g2
	std	%f28,	[%l7 + 0x40]
	addcc	%i7,	%o1,	%o0
	fmovdge	%icc,	%f25,	%f4
	sethi	0x1928,	%l2
	sub	%g7,	0x0B91,	%i6
	edge8l	%l5,	%i2,	%o7
	fmovrsne	%g6,	%f10,	%f21
	movrlz	%i5,	%l6,	%l3
	fcmpne16	%f2,	%f18,	%g4
	srl	%g3,	%l4,	%l0
	movrgez	%o6,	%i4,	%g1
	movrne	%o2,	0x15A,	%i3
	fmovdvs	%xcc,	%f4,	%f13
	movle	%icc,	%o3,	%i1
	edge8	%i0,	%o4,	%g5
	stb	%o5,	[%l7 + 0x26]
	umulcc	%g2,	%l1,	%o1
	addcc	%i7,	0x10D3,	%l2
	sdivx	%g7,	0x1842,	%i6
	movleu	%xcc,	%l5,	%o0
	movrgz	%i2,	0x079,	%o7
	alignaddrl	%g6,	%i5,	%l3
	stb	%l6,	[%l7 + 0x28]
	fands	%f12,	%f15,	%f9
	sethi	0x00D8,	%g3
	std	%f24,	[%l7 + 0x48]
	udivx	%l4,	0x06FD,	%g4
	srl	%l0,	%i4,	%o6
	add	%o2,	0x04C7,	%g1
	edge16ln	%i3,	%i1,	%i0
	array32	%o3,	%o4,	%o5
	smulcc	%g2,	%l1,	%g5
	array32	%i7,	%o1,	%g7
	umul	%i6,	%l2,	%o0
	subccc	%l5,	0x15CB,	%o7
	fmovdgu	%icc,	%f6,	%f5
	movneg	%icc,	%i2,	%i5
	sethi	0x17CF,	%g6
	array16	%l3,	%l6,	%g3
	lduh	[%l7 + 0x10],	%g4
	andn	%l0,	0x0464,	%l4
	fmovspos	%icc,	%f20,	%f1
	fpmerge	%f9,	%f5,	%f14
	movrgz	%i4,	0x232,	%o6
	edge8n	%g1,	%o2,	%i1
	orncc	%i0,	%i3,	%o4
	edge8l	%o5,	%o3,	%l1
	umul	%g2,	0x0A67,	%g5
	subc	%o1,	0x19D8,	%g7
	orncc	%i7,	0x0E16,	%l2
	array32	%o0,	%i6,	%o7
	move	%icc,	%l5,	%i2
	movgu	%xcc,	%i5,	%g6
	fcmpes	%fcc2,	%f14,	%f3
	srlx	%l3,	0x1B,	%g3
	array16	%l6,	%l0,	%l4
	fands	%f27,	%f22,	%f14
	array16	%i4,	%o6,	%g4
	movre	%g1,	0x0A9,	%o2
	movle	%xcc,	%i1,	%i0
	sub	%i3,	0x00E4,	%o4
	popc	%o5,	%l1
	fone	%f12
	xnorcc	%o3,	0x0294,	%g5
	save %o1, 0x0C4E, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%g2,	%i7
	movrne	%l2,	0x3C1,	%i6
	subc	%o7,	%o0,	%l5
	sllx	%i5,	%i2,	%l3
	smulcc	%g6,	0x06DB,	%g3
	fmovsgu	%xcc,	%f5,	%f5
	fands	%f15,	%f18,	%f9
	or	%l6,	0x0814,	%l0
	ldd	[%l7 + 0x20],	%l4
	umul	%o6,	0x062B,	%i4
	addc	%g1,	%o2,	%g4
	sir	0x167D
	stb	%i1,	[%l7 + 0x2D]
	fnand	%f22,	%f28,	%f18
	array8	%i0,	%i3,	%o4
	andncc	%o5,	%o3,	%g5
	fmovd	%f28,	%f24
	fmovsgu	%xcc,	%f30,	%f26
	movrne	%l1,	0x198,	%o1
	stb	%g2,	[%l7 + 0x24]
	movle	%xcc,	%i7,	%g7
	movne	%xcc,	%l2,	%o7
	popc	%i6,	%l5
	for	%f22,	%f12,	%f26
	mulscc	%i5,	0x1D52,	%o0
	movpos	%xcc,	%i2,	%l3
	movn	%xcc,	%g6,	%g3
	srl	%l6,	%l0,	%l4
	movrlez	%i4,	0x14E,	%g1
	pdist	%f6,	%f2,	%f8
	movle	%xcc,	%o2,	%g4
	fcmpes	%fcc1,	%f1,	%f30
	lduw	[%l7 + 0x10],	%i1
	xor	%o6,	0x10A4,	%i0
	ldx	[%l7 + 0x58],	%o4
	srl	%o5,	0x0A,	%o3
	movrlez	%g5,	%i3,	%l1
	sllx	%o1,	%g2,	%g7
	movgu	%xcc,	%l2,	%i7
	fmul8x16	%f6,	%f0,	%f2
	udiv	%i6,	0x0653,	%o7
	edge16n	%i5,	%o0,	%l5
	udivx	%i2,	0x08C5,	%g6
	array32	%l3,	%g3,	%l6
	movrlz	%l0,	0x066,	%i4
	movcc	%icc,	%l4,	%o2
	fmovscc	%icc,	%f29,	%f24
	fmovdl	%icc,	%f11,	%f1
	andncc	%g4,	%g1,	%o6
	umulcc	%i0,	0x19A7,	%o4
	st	%f30,	[%l7 + 0x5C]
	andcc	%o5,	0x09E3,	%i1
	fsrc2	%f22,	%f28
	movg	%xcc,	%g5,	%i3
	for	%f10,	%f10,	%f18
	ldub	[%l7 + 0x4C],	%l1
	fmovrsne	%o3,	%f8,	%f25
	st	%f1,	[%l7 + 0x74]
	sdivx	%o1,	0x0A8E,	%g7
	sllx	%g2,	0x06,	%l2
	ldsb	[%l7 + 0x1B],	%i6
	alignaddr	%i7,	%o7,	%i5
	orcc	%o0,	0x14AD,	%i2
	move	%xcc,	%l5,	%g6
	or	%g3,	0x0BF9,	%l3
	edge32ln	%l0,	%i4,	%l6
	stx	%o2,	[%l7 + 0x78]
	add	%g4,	%l4,	%g1
	udivcc	%i0,	0x1352,	%o6
	fnot1	%f6,	%f22
	edge8l	%o4,	%i1,	%g5
	udivcc	%i3,	0x0AF1,	%l1
	movrlez	%o5,	0x2EF,	%o1
	array16	%g7,	%o3,	%g2
	mulscc	%i6,	%l2,	%i7
	xorcc	%i5,	%o0,	%o7
	ldsb	[%l7 + 0x56],	%l5
	ldub	[%l7 + 0x25],	%g6
	edge8n	%i2,	%l3,	%g3
	siam	0x0
	xnor	%l0,	0x1B44,	%l6
	restore %i4, %g4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x0D],	%g1
	movpos	%xcc,	%o2,	%o6
	edge32ln	%i0,	%o4,	%i1
	fmovrde	%g5,	%f28,	%f4
	edge16ln	%l1,	%o5,	%o1
	sll	%i3,	0x19,	%o3
	umul	%g2,	0x0A6D,	%i6
	popc	0x1817,	%g7
	nop
	set	0x7F, %o2
	stb	%i7,	[%l7 + %o2]
	movrgez	%l2,	%i5,	%o0
	movg	%icc,	%l5,	%o7
	sra	%i2,	%l3,	%g3
	movcs	%icc,	%g6,	%l6
	sub	%i4,	0x0E4B,	%g4
	xnor	%l0,	%l4,	%o2
	edge32ln	%g1,	%i0,	%o4
	edge8ln	%i1,	%g5,	%o6
	fcmpgt32	%f4,	%f12,	%o5
	andncc	%l1,	%i3,	%o3
	ldsh	[%l7 + 0x6E],	%o1
	fmovrdne	%i6,	%f6,	%f2
	addc	%g2,	%g7,	%l2
	ldd	[%l7 + 0x08],	%i4
	edge8	%o0,	%i7,	%l5
	fsrc1s	%f23,	%f19
	mulx	%o7,	%i2,	%l3
	addccc	%g6,	0x0535,	%g3
	smul	%i4,	0x152E,	%l6
	and	%l0,	0x0F84,	%l4
	fmovdpos	%xcc,	%f18,	%f8
	fpack32	%f12,	%f20,	%f2
	udiv	%o2,	0x0BC2,	%g4
	fnegs	%f10,	%f1
	ldsb	[%l7 + 0x61],	%i0
	xorcc	%g1,	%o4,	%g5
	orcc	%o6,	%o5,	%i1
	fmovsneg	%icc,	%f0,	%f24
	lduw	[%l7 + 0x10],	%l1
	fornot1	%f20,	%f12,	%f2
	movrgz	%o3,	%i3,	%i6
	stb	%o1,	[%l7 + 0x42]
	ldsw	[%l7 + 0x74],	%g2
	mulscc	%g7,	%i5,	%o0
	edge32l	%l2,	%i7,	%o7
	fmovrdlz	%l5,	%f12,	%f8
	sdiv	%l3,	0x187A,	%i2
	mova	%xcc,	%g6,	%g3
	edge16	%l6,	%l0,	%i4
	sethi	0x01FA,	%l4
	edge8	%g4,	%i0,	%g1
	array8	%o4,	%o2,	%o6
	fmovdpos	%icc,	%f9,	%f25
	fxnor	%f24,	%f10,	%f24
	sll	%o5,	0x0D,	%g5
	movle	%xcc,	%l1,	%i1
	movg	%xcc,	%o3,	%i6
	fmuld8ulx16	%f5,	%f12,	%f24
	edge32ln	%i3,	%g2,	%g7
	smulcc	%i5,	0x0A23,	%o1
	fmovrdgz	%l2,	%f6,	%f14
	edge8l	%i7,	%o7,	%l5
	edge8ln	%o0,	%l3,	%g6
	fmovdleu	%xcc,	%f18,	%f6
	ldsh	[%l7 + 0x7E],	%i2
	movne	%icc,	%l6,	%g3
	move	%xcc,	%i4,	%l4
	sllx	%g4,	%i0,	%g1
	sdivx	%l0,	0x0050,	%o2
	movrgz	%o4,	0x33B,	%o5
	movrne	%o6,	%g5,	%i1
	fmovsleu	%icc,	%f23,	%f20
	orn	%o3,	0x08FD,	%i6
	edge16	%i3,	%g2,	%l1
	edge8	%i5,	%o1,	%l2
	sdivcc	%i7,	0x09D0,	%o7
	sdiv	%g7,	0x1FFC,	%l5
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	andcc	%i2,	%g6,	%g3
	fmul8x16	%f2,	%f14,	%f30
	lduh	[%l7 + 0x76],	%i4
	array16	%l6,	%g4,	%i0
	umulcc	%g1,	0x109F,	%l4
	save %l0, 0x1B94, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f16,	%f26,	%f0
	addc	%o5,	0x15B0,	%o6
	fmovspos	%icc,	%f19,	%f9
	sub	%g5,	%o4,	%i1
	sllx	%o3,	%i6,	%g2
	fcmpne32	%f12,	%f22,	%l1
	array32	%i5,	%o1,	%i3
	umul	%l2,	0x154B,	%o7
	addccc	%i7,	0x04CB,	%l5
	mulx	%g7,	0x0BFE,	%o0
	fmovdvs	%icc,	%f24,	%f9
	edge8ln	%i2,	%l3,	%g6
	sra	%i4,	0x18,	%g3
	movl	%xcc,	%g4,	%l6
	orn	%g1,	0x0EF0,	%l4
	ldd	[%l7 + 0x60],	%f2
	fxnor	%f10,	%f28,	%f30
	add	%l0,	%i0,	%o5
	sdivcc	%o6,	0x119F,	%g5
	movg	%xcc,	%o4,	%i1
	edge16l	%o2,	%o3,	%i6
	fcmpeq16	%f22,	%f22,	%g2
	edge8l	%i5,	%o1,	%i3
	movg	%xcc,	%l2,	%o7
	udivx	%l1,	0x0A7B,	%i7
	fmovdl	%xcc,	%f3,	%f17
	ldsb	[%l7 + 0x2A],	%l5
	stb	%o0,	[%l7 + 0x63]
	fones	%f7
	movn	%xcc,	%i2,	%l3
	and	%g7,	0x0AAB,	%i4
	ldsh	[%l7 + 0x72],	%g3
	edge16l	%g6,	%l6,	%g1
	fnot2	%f28,	%f30
	popc	%l4,	%l0
	subcc	%i0,	%o5,	%o6
	sdiv	%g4,	0x024A,	%o4
	or	%g5,	0x19EB,	%o2
	sth	%i1,	[%l7 + 0x10]
	edge16n	%i6,	%g2,	%o3
	edge32l	%i5,	%i3,	%l2
	edge32l	%o1,	%o7,	%i7
	fmovde	%icc,	%f4,	%f11
	fmovsle	%icc,	%f17,	%f26
	movleu	%xcc,	%l1,	%l5
	orcc	%o0,	%i2,	%g7
	stw	%i4,	[%l7 + 0x7C]
	movrgz	%l3,	0x095,	%g3
	fabss	%f21,	%f17
	andn	%g6,	%g1,	%l4
	edge16	%l6,	%l0,	%o5
	fcmps	%fcc3,	%f31,	%f19
	edge8n	%o6,	%i0,	%o4
	edge16n	%g4,	%o2,	%i1
	nop
	set	0x63, %o5
	ldub	[%l7 + %o5],	%g5
	fzero	%f0
	movvc	%xcc,	%i6,	%g2
	fornot1	%f4,	%f2,	%f2
	stw	%o3,	[%l7 + 0x40]
	mova	%icc,	%i5,	%l2
	umul	%i3,	%o1,	%i7
	alignaddr	%l1,	%l5,	%o0
	addccc	%i2,	0x0861,	%o7
	and	%i4,	%g7,	%l3
	andncc	%g3,	%g1,	%l4
	movcc	%icc,	%l6,	%l0
	sir	0x065E
	umul	%o5,	%o6,	%g6
	xor	%o4,	0x1E74,	%i0
	fcmpeq16	%f4,	%f12,	%o2
	andcc	%i1,	%g5,	%g4
	fmuld8ulx16	%f2,	%f25,	%f10
	ldsw	[%l7 + 0x20],	%i6
	fpadd32	%f20,	%f24,	%f28
	ldub	[%l7 + 0x11],	%o3
	sdiv	%i5,	0x142F,	%g2
	stb	%l2,	[%l7 + 0x7C]
	subcc	%o1,	%i7,	%l1
	lduh	[%l7 + 0x2E],	%l5
	srl	%o0,	0x1F,	%i3
	movle	%icc,	%i2,	%o7
	fmovse	%icc,	%f13,	%f14
	sdivcc	%i4,	0x1E93,	%g7
	fmovrse	%l3,	%f31,	%f25
	umulcc	%g1,	%g3,	%l6
	ldsh	[%l7 + 0x0A],	%l0
	movneg	%icc,	%l4,	%o5
	andn	%o6,	%g6,	%i0
	array32	%o4,	%i1,	%g5
	udiv	%o2,	0x0EF4,	%i6
	orn	%g4,	0x17E8,	%o3
	fnegd	%f10,	%f30
	array16	%g2,	%l2,	%i5
	movle	%icc,	%o1,	%i7
	sdivcc	%l5,	0x0B76,	%o0
	movleu	%xcc,	%i3,	%i2
	fones	%f10
	fnors	%f15,	%f21,	%f27
	ldd	[%l7 + 0x18],	%o6
	restore %i4, 0x1880, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x0C, %o0
	ldsh	[%l7 + %o0],	%l3
	alignaddrl	%g7,	%g1,	%l6
	fmovrde	%g3,	%f14,	%f22
	srlx	%l0,	0x1F,	%o5
	sra	%l4,	0x19,	%g6
	srax	%i0,	0x1F,	%o6
	andcc	%o4,	0x16AC,	%g5
	alignaddr	%i1,	%i6,	%o2
	mulscc	%g4,	0x1E2D,	%g2
	fsrc1	%f28,	%f8
	ld	[%l7 + 0x74],	%f5
	movrlz	%o3,	%l2,	%o1
	udivx	%i7,	0x0AD3,	%l5
	fpmerge	%f0,	%f30,	%f20
	fnand	%f16,	%f20,	%f20
	edge16ln	%i5,	%o0,	%i3
	save %i2, %o7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l3,	%g7
	ldd	[%l7 + 0x10],	%l0
	smulcc	%g1,	%g3,	%l0
	ldd	[%l7 + 0x50],	%f18
	andn	%o5,	0x1A1A,	%l4
	edge16	%l6,	%i0,	%o6
	xnor	%o4,	%g5,	%i1
	ldd	[%l7 + 0x70],	%g6
	addcc	%i6,	0x04A9,	%g4
	edge32n	%o2,	%g2,	%o3
	xorcc	%o1,	0x1984,	%i7
	mova	%xcc,	%l5,	%l2
	lduh	[%l7 + 0x78],	%o0
	edge16n	%i5,	%i3,	%i2
	fmovdle	%xcc,	%f5,	%f26
	edge8l	%o7,	%l3,	%i4
	mova	%icc,	%l1,	%g7
	fpack32	%f8,	%f30,	%f28
	xorcc	%g1,	0x0B6D,	%g3
	popc	%l0,	%o5
	lduw	[%l7 + 0x54],	%l6
	alignaddr	%l4,	%i0,	%o6
	udivcc	%o4,	0x0C94,	%g5
	fcmpne16	%f28,	%f24,	%i1
	srlx	%g6,	0x04,	%i6
	sub	%o2,	0x1B0F,	%g2
	movcs	%icc,	%g4,	%o3
	edge16	%i7,	%l5,	%l2
	orncc	%o0,	%i5,	%o1
	array32	%i3,	%i2,	%o7
	xorcc	%i4,	%l1,	%g7
	array16	%g1,	%l3,	%g3
	fmovrsne	%l0,	%f31,	%f29
	movre	%o5,	0x2E2,	%l6
	std	%f14,	[%l7 + 0x78]
	save %l4, %o6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g5,	%i1,	%g6
	movrgz	%i6,	%o2,	%g2
	st	%f19,	[%l7 + 0x5C]
	lduw	[%l7 + 0x1C],	%g4
	edge8n	%o4,	%i7,	%o3
	xorcc	%l5,	%o0,	%l2
	edge16l	%i5,	%i3,	%o1
	andn	%i2,	0x099B,	%i4
	for	%f20,	%f12,	%f14
	edge8n	%l1,	%o7,	%g1
	movge	%icc,	%l3,	%g3
	ldd	[%l7 + 0x28],	%g6
	fmuld8sux16	%f2,	%f5,	%f2
	lduh	[%l7 + 0x18],	%o5
	movre	%l0,	%l4,	%l6
	udiv	%i0,	0x1EDE,	%g5
	subccc	%i1,	0x09D4,	%g6
	movn	%icc,	%i6,	%o2
	sdivx	%g2,	0x1432,	%o6
	movcs	%xcc,	%o4,	%i7
	sdivcc	%o3,	0x1BA9,	%l5
	ldx	[%l7 + 0x78],	%o0
	movg	%icc,	%g4,	%l2
	fornot2	%f18,	%f20,	%f0
	array16	%i5,	%i3,	%o1
	udiv	%i2,	0x1983,	%i4
	umulcc	%l1,	%g1,	%l3
	st	%f2,	[%l7 + 0x08]
	udivcc	%o7,	0x02D3,	%g3
	fmovscc	%xcc,	%f4,	%f29
	movcs	%icc,	%g7,	%o5
	fmovdleu	%icc,	%f31,	%f25
	srl	%l4,	0x10,	%l6
	umul	%l0,	%i0,	%g5
	alignaddrl	%g6,	%i6,	%o2
	andncc	%i1,	%g2,	%o4
	srlx	%i7,	%o3,	%l5
	movg	%icc,	%o6,	%o0
	fpsub32	%f10,	%f22,	%f12
	fsrc2s	%f9,	%f14
	xor	%l2,	%g4,	%i5
	stx	%o1,	[%l7 + 0x20]
	stb	%i2,	[%l7 + 0x13]
	fmovsne	%xcc,	%f7,	%f25
	fandnot1	%f0,	%f30,	%f0
	nop
	set	0x1C, %l5
	stw	%i3,	[%l7 + %l5]
	fmovsgu	%xcc,	%f26,	%f27
	srl	%l1,	%g1,	%l3
	fpsub32s	%f17,	%f6,	%f11
	movcs	%icc,	%i4,	%o7
	addcc	%g7,	0x1F04,	%o5
	fpsub16	%f24,	%f26,	%f2
	fornot2	%f12,	%f24,	%f2
	fnegs	%f14,	%f2
	movrlz	%g3,	0x20B,	%l4
	movrgez	%l0,	%i0,	%g5
	xorcc	%g6,	0x1D5B,	%l6
	orn	%i6,	0x01F7,	%i1
	add	%o2,	%g2,	%o4
	stb	%o3,	[%l7 + 0x50]
	smul	%i7,	%l5,	%o6
	ldub	[%l7 + 0x4A],	%l2
	mova	%xcc,	%o0,	%g4
	smulcc	%o1,	%i2,	%i5
	fornot1s	%f30,	%f31,	%f3
	mova	%xcc,	%l1,	%g1
	fmovsneg	%xcc,	%f2,	%f22
	fmovdgu	%xcc,	%f9,	%f10
	orn	%l3,	%i3,	%i4
	std	%f8,	[%l7 + 0x58]
	ldsw	[%l7 + 0x08],	%g7
	stb	%o5,	[%l7 + 0x70]
	sra	%g3,	0x16,	%l4
	sra	%l0,	0x12,	%o7
	edge32	%g5,	%g6,	%i0
	fmovsvc	%xcc,	%f3,	%f15
	ld	[%l7 + 0x08],	%f10
	movrne	%i6,	%i1,	%l6
	sllx	%g2,	0x0C,	%o2
	ld	[%l7 + 0x18],	%f28
	xnorcc	%o3,	%i7,	%l5
	xor	%o4,	%o6,	%l2
	umulcc	%o0,	0x176C,	%o1
	fcmpes	%fcc3,	%f31,	%f22
	movn	%xcc,	%i2,	%i5
	bshuffle	%f30,	%f20,	%f20
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%l0
	movrne	%g4,	0x38C,	%l3
	movleu	%xcc,	%g1,	%i4
	ldsb	[%l7 + 0x35],	%g7
	sth	%i3,	[%l7 + 0x16]
	movcc	%xcc,	%g3,	%o5
	lduh	[%l7 + 0x4C],	%l4
	fmul8x16al	%f2,	%f10,	%f6
	addc	%o7,	0x1CDB,	%g5
	array8	%g6,	%l0,	%i6
	andncc	%i1,	%l6,	%g2
	array16	%i0,	%o3,	%i7
	fmul8x16al	%f3,	%f21,	%f0
	edge32l	%o2,	%o4,	%o6
	array8	%l5,	%o0,	%l2
	movne	%xcc,	%o1,	%i5
	umul	%i2,	%g4,	%l1
	edge16l	%g1,	%l3,	%i4
	ldsh	[%l7 + 0x2A],	%g7
	srlx	%g3,	0x0B,	%o5
	movvs	%xcc,	%l4,	%o7
	sub	%i3,	%g5,	%l0
	ldsh	[%l7 + 0x3A],	%i6
	edge32n	%i1,	%g6,	%g2
	fmovdpos	%icc,	%f20,	%f0
	fornot2	%f14,	%f4,	%f18
	stb	%i0,	[%l7 + 0x5D]
	popc	%o3,	%l6
	edge16	%i7,	%o4,	%o2
	stw	%o6,	[%l7 + 0x18]
	stw	%l5,	[%l7 + 0x78]
	fmovdneg	%icc,	%f20,	%f17
	movvc	%xcc,	%o0,	%l2
	sth	%i5,	[%l7 + 0x74]
	edge8n	%o1,	%i2,	%l1
	fcmpeq32	%f28,	%f6,	%g4
	fnegs	%f18,	%f5
	movgu	%icc,	%g1,	%l3
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	movrne	%l4,	0x3E8,	%o7
	ldx	[%l7 + 0x38],	%i3
	st	%f1,	[%l7 + 0x6C]
	movcs	%xcc,	%g5,	%l0
	udivcc	%i6,	0x185A,	%i1
	mulx	%o5,	0x0DDE,	%g6
	for	%f14,	%f30,	%f18
	orcc	%g2,	%o3,	%l6
	addc	%i7,	0x1556,	%o4
	umul	%i0,	%o6,	%o2
	movrgz	%o0,	%l5,	%i5
	orncc	%l2,	%i2,	%l1
	movrgz	%o1,	%g4,	%g1
	xorcc	%i4,	%l3,	%g7
	addccc	%l4,	%o7,	%i3
	popc	0x014A,	%g5
	subcc	%g3,	0x1FCA,	%l0
	fmovs	%f0,	%f10
	fandnot2s	%f20,	%f8,	%f7
	edge8	%i1,	%i6,	%o5
	ldub	[%l7 + 0x64],	%g2
	movge	%icc,	%o3,	%g6
	ldx	[%l7 + 0x70],	%i7
	srlx	%l6,	0x19,	%i0
	fcmpeq16	%f22,	%f10,	%o6
	orncc	%o2,	0x0039,	%o4
	array8	%l5,	%i5,	%l2
	fmovsvs	%icc,	%f28,	%f11
	xorcc	%o0,	0x0724,	%l1
	array32	%i2,	%o1,	%g4
	alignaddr	%g1,	%l3,	%i4
	movrlez	%g7,	0x271,	%o7
	movg	%xcc,	%l4,	%i3
	stx	%g5,	[%l7 + 0x28]
	fmovde	%xcc,	%f26,	%f7
	stb	%g3,	[%l7 + 0x77]
	addc	%i1,	%i6,	%o5
	edge16	%g2,	%l0,	%g6
	srlx	%o3,	0x1A,	%i7
	fmovrslez	%l6,	%f22,	%f5
	umulcc	%o6,	%o2,	%i0
	movvs	%icc,	%o4,	%l5
	edge32l	%i5,	%o0,	%l1
	xorcc	%i2,	%l2,	%o1
	movne	%xcc,	%g1,	%g4
	ldsh	[%l7 + 0x5C],	%l3
	fors	%f23,	%f21,	%f4
	movl	%xcc,	%g7,	%i4
	subcc	%l4,	0x0D07,	%i3
	addccc	%g5,	0x0D8E,	%o7
	sdivx	%i1,	0x1D14,	%g3
	andncc	%o5,	%g2,	%l0
	fcmpgt32	%f0,	%f18,	%g6
	sdiv	%i6,	0x1780,	%i7
	fmovrdlz	%o3,	%f4,	%f18
	smul	%o6,	%l6,	%o2
	array32	%o4,	%l5,	%i5
	and	%o0,	0x19ED,	%l1
	fmovdgu	%icc,	%f27,	%f4
	movle	%xcc,	%i0,	%i2
	fzero	%f24
	movrlez	%o1,	%g1,	%g4
	array32	%l2,	%g7,	%i4
	alignaddrl	%l3,	%i3,	%l4
	alignaddr	%g5,	%i1,	%o7
	sth	%g3,	[%l7 + 0x5A]
	movvs	%icc,	%o5,	%l0
	fmovsa	%xcc,	%f19,	%f20
	umul	%g6,	0x0E3A,	%i6
	edge8l	%g2,	%i7,	%o6
	mova	%xcc,	%l6,	%o3
	andcc	%o2,	%o4,	%l5
	pdist	%f24,	%f18,	%f0
	ldd	[%l7 + 0x30],	%o0
	movrgz	%l1,	%i5,	%i2
	edge32l	%o1,	%i0,	%g4
	orcc	%l2,	%g7,	%g1
	subcc	%i4,	%l3,	%i3
	movneg	%xcc,	%g5,	%l4
	edge8n	%o7,	%g3,	%o5
	sdivx	%i1,	0x0F5D,	%l0
	sdiv	%g6,	0x193C,	%i6
	fmuld8ulx16	%f25,	%f22,	%f22
	edge8	%i7,	%o6,	%g2
	andncc	%l6,	%o2,	%o3
	st	%f16,	[%l7 + 0x3C]
	fsrc1	%f4,	%f22
	udivcc	%l5,	0x0F11,	%o4
	alignaddrl	%l1,	%i5,	%i2
	mova	%icc,	%o1,	%o0
	sra	%g4,	0x11,	%l2
	addccc	%i0,	0x04D9,	%g7
	movn	%icc,	%i4,	%g1
	movcs	%icc,	%l3,	%g5
	movrgez	%i3,	%o7,	%l4
	sdiv	%o5,	0x0AFF,	%g3
	andncc	%i1,	%l0,	%i6
	mova	%icc,	%i7,	%g6
	fsrc1	%f22,	%f10
	srlx	%o6,	%g2,	%l6
	xor	%o3,	0x1967,	%o2
	st	%f1,	[%l7 + 0x14]
	movn	%icc,	%l5,	%l1
	xnorcc	%i5,	0x0962,	%o4
	fmovdle	%xcc,	%f14,	%f19
	movpos	%icc,	%i2,	%o1
	stw	%o0,	[%l7 + 0x28]
	fxors	%f25,	%f30,	%f18
	mulscc	%l2,	%g4,	%i0
	mulscc	%i4,	%g1,	%g7
	fmul8sux16	%f8,	%f28,	%f0
	movvc	%xcc,	%l3,	%g5
	sra	%o7,	0x0D,	%i3
	fxnor	%f4,	%f28,	%f14
	stw	%l4,	[%l7 + 0x30]
	fmovdne	%icc,	%f28,	%f24
	fxors	%f16,	%f0,	%f19
	bshuffle	%f4,	%f24,	%f2
	fnegd	%f6,	%f12
	siam	0x0
	lduh	[%l7 + 0x30],	%o5
	movrlz	%g3,	%l0,	%i1
	subcc	%i6,	%i7,	%g6
	st	%f23,	[%l7 + 0x20]
	st	%f22,	[%l7 + 0x60]
	add	%o6,	0x0A33,	%l6
	movrgz	%g2,	0x04F,	%o2
	movrlz	%o3,	0x2F6,	%l5
	subccc	%i5,	%o4,	%l1
	edge32ln	%i2,	%o1,	%o0
	or	%g4,	0x0008,	%l2
	sdivcc	%i0,	0x049A,	%g1
	sdiv	%i4,	0x0CAE,	%l3
	xnor	%g5,	%g7,	%o7
	fmovrdgz	%i3,	%f0,	%f28
	fandnot1	%f12,	%f22,	%f20
	movvs	%icc,	%l4,	%o5
	stb	%l0,	[%l7 + 0x63]
	edge32n	%i1,	%g3,	%i6
	sethi	0x1561,	%g6
	and	%i7,	%o6,	%l6
	edge16l	%o2,	%g2,	%o3
	fmovdvs	%icc,	%f2,	%f20
	ldsh	[%l7 + 0x6C],	%i5
	movrgez	%l5,	0x36C,	%l1
	umul	%o4,	%o1,	%o0
	stx	%i2,	[%l7 + 0x50]
	fors	%f12,	%f21,	%f26
	sdivcc	%g4,	0x03F9,	%l2
	movrlez	%i0,	0x0BA,	%i4
	andncc	%g1,	%l3,	%g7
	fmovrse	%g5,	%f5,	%f25
	sra	%i3,	%o7,	%o5
	stw	%l4,	[%l7 + 0x6C]
	movrgz	%l0,	0x062,	%g3
	fmovsn	%icc,	%f23,	%f2
	fmovscc	%icc,	%f23,	%f13
	xnorcc	%i1,	%g6,	%i6
	fmovrdlz	%o6,	%f26,	%f20
	mulscc	%l6,	%i7,	%o2
	movrgez	%o3,	0x1CA,	%g2
	for	%f2,	%f6,	%f6
	movgu	%xcc,	%i5,	%l1
	smul	%o4,	0x150B,	%l5
	fmovdcc	%xcc,	%f1,	%f16
	movrgez	%o0,	%i2,	%g4
	fxor	%f20,	%f6,	%f22
	ldsw	[%l7 + 0x30],	%o1
	st	%f27,	[%l7 + 0x78]
	movrne	%i0,	%l2,	%i4
	movge	%xcc,	%l3,	%g1
	alignaddrl	%g7,	%g5,	%o7
	fcmpes	%fcc2,	%f1,	%f28
	add	%o5,	%i3,	%l4
	addccc	%g3,	0x17A1,	%i1
	fnor	%f22,	%f16,	%f2
	srlx	%l0,	%i6,	%g6
	ldub	[%l7 + 0x55],	%l6
	fmovdle	%icc,	%f5,	%f20
	sub	%i7,	0x1224,	%o2
	fmul8ulx16	%f2,	%f8,	%f0
	array32	%o3,	%o6,	%i5
	alignaddrl	%g2,	%l1,	%l5
	fmovsne	%icc,	%f18,	%f15
	alignaddrl	%o4,	%i2,	%o0
	sub	%o1,	0x1590,	%g4
	xorcc	%l2,	0x1F54,	%i0
	andcc	%l3,	%g1,	%g7
	std	%f8,	[%l7 + 0x40]
	smulcc	%g5,	0x0E6F,	%o7
	fmovdcc	%icc,	%f13,	%f17
	movvc	%xcc,	%o5,	%i3
	fmovsa	%icc,	%f26,	%f18
	fmovdg	%icc,	%f18,	%f19
	movle	%xcc,	%i4,	%l4
	edge32n	%g3,	%i1,	%i6
	fmovrdne	%l0,	%f4,	%f24
	fmovrdgez	%l6,	%f4,	%f2
	movrlez	%g6,	%o2,	%i7
	sir	0x1202
	sll	%o3,	0x06,	%i5
	fornot2s	%f4,	%f2,	%f9
	movrlz	%g2,	0x0A7,	%l1
	xnorcc	%o6,	%l5,	%o4
	edge8ln	%i2,	%o1,	%g4
	array16	%o0,	%i0,	%l2
	fmovrslz	%l3,	%f25,	%f8
	addcc	%g1,	%g7,	%o7
	sethi	0x1186,	%o5
	umulcc	%g5,	%i4,	%i3
	subccc	%l4,	%i1,	%i6
	movcc	%xcc,	%g3,	%l6
	smul	%g6,	%o2,	%i7
	orncc	%o3,	0x0261,	%l0
	andncc	%i5,	%l1,	%g2
	edge16n	%o6,	%l5,	%o4
	edge32	%i2,	%g4,	%o0
	xnorcc	%i0,	%l2,	%o1
	andcc	%g1,	%l3,	%g7
	fexpand	%f6,	%f12
	fmovdgu	%icc,	%f18,	%f0
	fnot1s	%f9,	%f12
	array16	%o5,	%g5,	%o7
	save %i3, %i4, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f13,	%f8
	fnor	%f0,	%f30,	%f10
	xnorcc	%i6,	0x1A3E,	%l4
	edge32l	%l6,	%g6,	%g3
	udivcc	%i7,	0x1A81,	%o2
	restore %l0, %i5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l1,	%g2,	%o6
	fnands	%f15,	%f8,	%f20
	sub	%o4,	0x0069,	%i2
	umulcc	%l5,	0x03D3,	%o0
	fmovdne	%icc,	%f4,	%f20
	movleu	%icc,	%g4,	%l2
	mulscc	%i0,	0x1EC4,	%g1
	movpos	%icc,	%l3,	%g7
	xorcc	%o5,	0x034F,	%o1
	edge32ln	%o7,	%g5,	%i3
	fcmpd	%fcc2,	%f2,	%f6
	sir	0x10C2
	movcc	%xcc,	%i4,	%i1
	fmovdpos	%xcc,	%f17,	%f28
	mulscc	%i6,	%l6,	%l4
	addc	%g3,	%g6,	%o2
	subc	%i7,	0x042B,	%l0
	umulcc	%i5,	0x1B55,	%o3
	fmovrslz	%g2,	%f26,	%f4
	ldd	[%l7 + 0x28],	%o6
	edge16	%l1,	%o4,	%l5
	fpack16	%f28,	%f27
	fmovrsgez	%o0,	%f5,	%f10
	nop
	set	0x78, %l4
	stb	%i2,	[%l7 + %l4]
	fmovsge	%xcc,	%f29,	%f3
	fmovsneg	%xcc,	%f26,	%f25
	fnot2	%f14,	%f20
	orn	%g4,	0x1D63,	%l2
	orn	%i0,	0x0934,	%l3
	mova	%icc,	%g1,	%g7
	srl	%o1,	%o7,	%g5
	fpsub16	%f18,	%f20,	%f24
	lduh	[%l7 + 0x08],	%i3
	movrgez	%i4,	0x100,	%o5
	fmovrslez	%i6,	%f18,	%f2
	alignaddrl	%i1,	%l6,	%l4
	fxnors	%f29,	%f2,	%f11
	edge32	%g3,	%o2,	%i7
	array32	%g6,	%i5,	%l0
	movcs	%xcc,	%g2,	%o3
	edge16l	%o6,	%o4,	%l1
	movrgez	%o0,	%i2,	%l5
	edge32l	%l2,	%g4,	%l3
	stx	%g1,	[%l7 + 0x40]
	mova	%xcc,	%g7,	%i0
	edge16	%o1,	%g5,	%i3
	or	%i4,	0x00C2,	%o7
	srl	%o5,	%i6,	%l6
	ldsw	[%l7 + 0x60],	%l4
	edge16n	%i1,	%g3,	%o2
	movrgz	%i7,	0x080,	%i5
	array16	%g6,	%l0,	%o3
	fandnot2s	%f3,	%f15,	%f31
	fmuld8sux16	%f18,	%f8,	%f24
	xnorcc	%o6,	0x12DD,	%g2
	addcc	%o4,	0x0F1B,	%o0
	udivcc	%i2,	0x115D,	%l5
	mova	%icc,	%l1,	%g4
	std	%f28,	[%l7 + 0x18]
	subccc	%l3,	%g1,	%l2
	popc	%i0,	%o1
	fmovrdlez	%g5,	%f24,	%f8
	sdiv	%g7,	0x0031,	%i3
	movneg	%xcc,	%i4,	%o7
	xnorcc	%o5,	%l6,	%l4
	fmovdn	%xcc,	%f30,	%f22
	smulcc	%i6,	%g3,	%o2
	xorcc	%i7,	0x0684,	%i1
	fmovsvs	%icc,	%f16,	%f18
	fmovsle	%icc,	%f22,	%f4
	move	%icc,	%g6,	%l0
	movrgz	%o3,	%o6,	%g2
	edge8l	%o4,	%i5,	%o0
	subc	%l5,	0x16D6,	%l1
	movn	%xcc,	%g4,	%i2
	fpack16	%f28,	%f10
	movne	%icc,	%g1,	%l2
	or	%i0,	%l3,	%g5
	fpsub16s	%f17,	%f21,	%f15
	lduh	[%l7 + 0x44],	%o1
	xnor	%i3,	%i4,	%o7
	sub	%o5,	0x018A,	%l6
	alignaddrl	%g7,	%l4,	%g3
	or	%i6,	0x0949,	%i7
	movl	%icc,	%i1,	%o2
	andn	%g6,	0x12C1,	%o3
	sth	%o6,	[%l7 + 0x70]
	movrgez	%l0,	%o4,	%i5
	sdiv	%o0,	0x1F58,	%l5
	edge16ln	%g2,	%g4,	%l1
	srlx	%i2,	0x10,	%l2
	smulcc	%i0,	0x1DCF,	%l3
	sra	%g1,	%g5,	%o1
	fnot2s	%f17,	%f2
	fornot1s	%f12,	%f0,	%f3
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	xnor	%o5,	%o7,	%g7
	edge32l	%l6,	%l4,	%g3
	stx	%i7,	[%l7 + 0x28]
	array8	%i6,	%i1,	%g6
	mulx	%o2,	0x031D,	%o3
	andn	%l0,	0x00E5,	%o4
	udivx	%o6,	0x0047,	%o0
	mova	%icc,	%i5,	%l5
	fcmple16	%f24,	%f10,	%g2
	udivcc	%l1,	0x0EFE,	%g4
	andcc	%l2,	%i0,	%l3
	sllx	%g1,	%g5,	%o1
	movgu	%xcc,	%i2,	%i4
	addccc	%o5,	%o7,	%g7
	fpadd16	%f14,	%f2,	%f2
	ld	[%l7 + 0x08],	%f26
	andncc	%l6,	%i3,	%l4
	nop
	set	0x21, %i4
	ldub	[%l7 + %i4],	%i7
	movle	%xcc,	%g3,	%i1
	fmovdneg	%icc,	%f3,	%f11
	fabss	%f27,	%f14
	movrlez	%g6,	%i6,	%o2
	stw	%o3,	[%l7 + 0x3C]
	movvs	%icc,	%l0,	%o6
	fcmpgt16	%f14,	%f6,	%o0
	ldx	[%l7 + 0x30],	%i5
	movn	%xcc,	%l5,	%o4
	addccc	%l1,	%g4,	%g2
	udivx	%i0,	0x1175,	%l3
	fmovsleu	%xcc,	%f30,	%f20
	or	%g1,	%l2,	%o1
	smulcc	%i2,	0x130B,	%g5
	stb	%o5,	[%l7 + 0x27]
	sethi	0x14AC,	%o7
	sdiv	%i4,	0x1CA9,	%g7
	fmovsge	%icc,	%f0,	%f0
	lduh	[%l7 + 0x48],	%i3
	udivcc	%l4,	0x0776,	%l6
	siam	0x4
	array16	%i7,	%g3,	%i1
	edge32	%i6,	%g6,	%o2
	addccc	%l0,	%o3,	%o0
	and	%o6,	%i5,	%l5
	movvc	%icc,	%o4,	%l1
	edge8l	%g2,	%i0,	%g4
	fcmpgt16	%f22,	%f8,	%l3
	andcc	%l2,	%o1,	%i2
	array8	%g5,	%g1,	%o7
	mova	%xcc,	%o5,	%g7
	subccc	%i4,	%l4,	%i3
	sethi	0x1BF4,	%l6
	fcmpd	%fcc1,	%f28,	%f30
	alignaddrl	%g3,	%i7,	%i6
	orncc	%g6,	0x0111,	%o2
	ldd	[%l7 + 0x08],	%f6
	fpsub32s	%f9,	%f13,	%f24
	edge32l	%i1,	%l0,	%o0
	alignaddr	%o3,	%i5,	%l5
	movl	%icc,	%o6,	%l1
	ldsh	[%l7 + 0x12],	%o4
	sdivcc	%g2,	0x0A09,	%i0
	ld	[%l7 + 0x18],	%f14
	fmovdne	%xcc,	%f27,	%f24
	sir	0x0541
	sdiv	%l3,	0x167B,	%l2
	stx	%g4,	[%l7 + 0x68]
	fmovse	%xcc,	%f17,	%f14
	subccc	%i2,	%g5,	%g1
	fmovdne	%icc,	%f6,	%f24
	udivcc	%o7,	0x18CA,	%o1
	fmul8sux16	%f6,	%f30,	%f4
	movneg	%xcc,	%o5,	%i4
	srlx	%g7,	%i3,	%l6
	udiv	%l4,	0x08C3,	%i7
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%g2
	ldd	[%l7 + 0x30],	%f2
	andcc	%i6,	%g6,	%o2
	srl	%l0,	%i1,	%o0
	fpackfix	%f0,	%f17
	siam	0x0
	mulx	%o3,	0x0B87,	%i5
	stb	%l5,	[%l7 + 0x7A]
	subc	%o6,	0x19C9,	%o4
	fnegs	%f15,	%f27
	sub	%g2,	%i0,	%l3
	mova	%icc,	%l1,	%g4
	umulcc	%l2,	0x1260,	%i2
	ldd	[%l7 + 0x68],	%g4
	movvs	%xcc,	%g1,	%o7
	mulscc	%o1,	0x03C3,	%i4
	alignaddrl	%g7,	%i3,	%l6
	array8	%o5,	%i7,	%l4
	addcc	%i6,	%g3,	%g6
	fors	%f27,	%f23,	%f18
	xnor	%o2,	0x0156,	%l0
	movrne	%o0,	%i1,	%o3
	andncc	%l5,	%o6,	%i5
	fmul8x16al	%f2,	%f30,	%f0
	udivcc	%g2,	0x098E,	%i0
	edge16ln	%o4,	%l1,	%g4
	srlx	%l2,	0x02,	%i2
	andncc	%l3,	%g5,	%o7
	udiv	%g1,	0x18DA,	%o1
	stx	%g7,	[%l7 + 0x38]
	fzeros	%f19
	fmovrslez	%i4,	%f1,	%f0
	subccc	%l6,	%i3,	%i7
	ld	[%l7 + 0x64],	%f23
	alignaddr	%o5,	%i6,	%l4
	sdivcc	%g6,	0x0DFB,	%o2
	fcmple32	%f20,	%f22,	%l0
	xnor	%g3,	0x0332,	%o0
	popc	%o3,	%l5
	movleu	%icc,	%i1,	%i5
	fcmpgt16	%f18,	%f2,	%g2
	edge16n	%i0,	%o4,	%o6
	xorcc	%g4,	0x0782,	%l2
	fnands	%f20,	%f0,	%f7
	ldd	[%l7 + 0x60],	%i2
	xnorcc	%l3,	0x0EE6,	%g5
	movne	%xcc,	%l1,	%g1
	fexpand	%f8,	%f18
	udivcc	%o7,	0x0383,	%g7
	fmuld8sux16	%f31,	%f18,	%f10
	save %o1, 0x1D86, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i3,	%i4,	%o5
	edge32n	%i6,	%l4,	%g6
	smul	%i7,	0x0C60,	%o2
	fmovscc	%icc,	%f22,	%f14
	movvs	%xcc,	%g3,	%o0
	addccc	%o3,	%l5,	%i1
	fmovsvs	%xcc,	%f0,	%f7
	fpadd16	%f0,	%f30,	%f14
	edge16n	%l0,	%g2,	%i5
	movre	%i0,	%o4,	%o6
	movg	%icc,	%g4,	%i2
	fpadd32s	%f1,	%f30,	%f22
	fcmple16	%f4,	%f2,	%l2
	edge32l	%g5,	%l1,	%g1
	and	%o7,	0x1B0B,	%g7
	orncc	%o1,	0x03DD,	%l6
	subc	%i3,	%l3,	%i4
	movgu	%icc,	%i6,	%o5
	fsrc2	%f30,	%f24
	subc	%l4,	0x05BB,	%i7
	smulcc	%o2,	0x0E63,	%g3
	xorcc	%g6,	%o3,	%o0
	sdiv	%l5,	0x13EB,	%l0
	ld	[%l7 + 0x30],	%f8
	movl	%xcc,	%i1,	%g2
	xnorcc	%i5,	%o4,	%o6
	ld	[%l7 + 0x30],	%f26
	sra	%g4,	%i0,	%l2
	edge32ln	%i2,	%l1,	%g1
	movvs	%icc,	%o7,	%g5
	std	%f24,	[%l7 + 0x38]
	edge32	%o1,	%l6,	%i3
	edge16n	%g7,	%i4,	%i6
	fxnors	%f25,	%f8,	%f13
	movleu	%xcc,	%l3,	%o5
	orncc	%i7,	%o2,	%l4
	or	%g3,	0x0D6C,	%o3
	edge16n	%o0,	%l5,	%l0
	orncc	%i1,	0x0DA2,	%g2
	add	%g6,	0x0DE0,	%o4
	alignaddr	%o6,	%g4,	%i0
	udiv	%i5,	0x14AF,	%i2
	movrlz	%l1,	%g1,	%l2
	popc	%g5,	%o1
	fmul8ulx16	%f28,	%f14,	%f18
	fmovsne	%xcc,	%f31,	%f5
	sll	%l6,	%i3,	%o7
	sdivx	%i4,	0x10B2,	%i6
	alignaddr	%l3,	%g7,	%i7
	pdist	%f2,	%f6,	%f30
	move	%icc,	%o5,	%o2
	subcc	%l4,	%g3,	%o0
	sub	%o3,	%l5,	%i1
	array16	%g2,	%l0,	%o4
	sdiv	%o6,	0x1927,	%g6
	sdivcc	%i0,	0x0893,	%i5
	ldsh	[%l7 + 0x24],	%i2
	movcs	%icc,	%g4,	%g1
	fpmerge	%f27,	%f22,	%f12
	umul	%l1,	0x009A,	%g5
	sdiv	%o1,	0x006B,	%l6
	alignaddrl	%i3,	%l2,	%o7
	xor	%i4,	%l3,	%g7
	fmovrsne	%i7,	%f20,	%f7
	fzeros	%f31
	fmovsgu	%icc,	%f12,	%f11
	smul	%i6,	0x0017,	%o2
	restore %l4, 0x0992, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f18,	%f2
	ldd	[%l7 + 0x08],	%f26
	movrgez	%o0,	0x34A,	%o5
	movrne	%l5,	%o3,	%g2
	andcc	%i1,	0x1E66,	%l0
	edge16l	%o4,	%g6,	%i0
	fpackfix	%f24,	%f1
	ldsh	[%l7 + 0x7C],	%i5
	fnegd	%f18,	%f18
	st	%f8,	[%l7 + 0x60]
	ldd	[%l7 + 0x70],	%i2
	stb	%g4,	[%l7 + 0x22]
	movpos	%icc,	%g1,	%l1
	fmovda	%xcc,	%f31,	%f5
	fmovsle	%icc,	%f22,	%f23
	sll	%o6,	0x0D,	%o1
	movrlz	%l6,	%i3,	%l2
	umul	%g5,	0x0363,	%i4
	edge8n	%o7,	%l3,	%g7
	stw	%i7,	[%l7 + 0x40]
	or	%o2,	%l4,	%i6
	addccc	%o0,	%o5,	%l5
	fmovsvs	%icc,	%f21,	%f31
	stw	%g3,	[%l7 + 0x28]
	sth	%o3,	[%l7 + 0x3E]
	movleu	%xcc,	%g2,	%l0
	ldx	[%l7 + 0x28],	%o4
	edge32	%g6,	%i0,	%i1
	fnegd	%f24,	%f20
	fmovdl	%xcc,	%f17,	%f31
	movg	%icc,	%i5,	%g4
	udivcc	%g1,	0x1F9A,	%i2
	sth	%l1,	[%l7 + 0x68]
	sub	%o6,	%o1,	%i3
	lduw	[%l7 + 0x50],	%l2
	andcc	%l6,	%g5,	%i4
	fmovsne	%xcc,	%f14,	%f6
	subcc	%o7,	%g7,	%i7
	fmovdle	%xcc,	%f10,	%f2
	fnors	%f31,	%f7,	%f8
	ldd	[%l7 + 0x28],	%f28
	subc	%o2,	%l3,	%l4
	fmovdg	%icc,	%f9,	%f29
	movre	%o0,	0x222,	%o5
	movpos	%xcc,	%i6,	%l5
	ldd	[%l7 + 0x70],	%f0
	fpsub16	%f4,	%f14,	%f14
	edge32l	%o3,	%g3,	%g2
	save %o4, %l0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x44],	%f7
	lduw	[%l7 + 0x0C],	%i1
	ld	[%l7 + 0x38],	%f16
	array32	%i0,	%i5,	%g4
	fmovrsgez	%i2,	%f27,	%f8
	edge32ln	%l1,	%o6,	%g1
	move	%icc,	%i3,	%l2
	umul	%o1,	%g5,	%i4
	xorcc	%o7,	%l6,	%i7
	movrne	%o2,	0x353,	%g7
	xnor	%l4,	0x0F70,	%o0
	xorcc	%o5,	0x00C5,	%i6
	sth	%l5,	[%l7 + 0x34]
	edge16l	%o3,	%g3,	%l3
	array8	%g2,	%o4,	%l0
	andncc	%i1,	%g6,	%i0
	sdiv	%g4,	0x0BBF,	%i2
	ldsh	[%l7 + 0x62],	%i5
	movpos	%xcc,	%o6,	%g1
	srl	%i3,	0x15,	%l1
	fmovscs	%icc,	%f26,	%f25
	edge8ln	%o1,	%g5,	%l2
	movrgez	%o7,	%i4,	%l6
	save %i7, 0x05BF, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o2,	%l4,	%o5
	xor	%i6,	%l5,	%o0
	fmovscs	%xcc,	%f31,	%f28
	ldx	[%l7 + 0x28],	%o3
	edge16n	%g3,	%l3,	%g2
	fnegd	%f6,	%f30
	movrlez	%o4,	%i1,	%l0
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	fpadd32	%f2,	%f24,	%f6
	movrgez	%i2,	%i5,	%g4
	udiv	%g1,	0x07F6,	%i3
	ldsb	[%l7 + 0x0E],	%o6
	fmovdge	%icc,	%f4,	%f24
	ld	[%l7 + 0x38],	%f3
	ld	[%l7 + 0x30],	%f25
	fsrc1	%f30,	%f0
	ldsb	[%l7 + 0x6E],	%l1
	ldsw	[%l7 + 0x3C],	%g5
	add	%o1,	%o7,	%l2
	restore %l6, %i7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x7A],	%g7
	edge32l	%o2,	%o5,	%l4
	movpos	%icc,	%i6,	%o0
	fmovdg	%xcc,	%f14,	%f28
	addc	%o3,	0x1987,	%l5
	ldd	[%l7 + 0x10],	%g2
	smul	%l3,	0x1D42,	%g2
	stx	%o4,	[%l7 + 0x10]
	movvs	%xcc,	%l0,	%i0
	movneg	%icc,	%i1,	%g6
	movrlez	%i5,	0x1C4,	%i2
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	fmovrsgez	%l1,	%f12,	%f8
	fcmpeq16	%f10,	%f0,	%g5
	andncc	%i3,	%o1,	%l2
	stb	%l6,	[%l7 + 0x3B]
	fmovsg	%xcc,	%f24,	%f13
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3590
!	Type f   	: 5369
!	Type i   	: 16041
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xBDE73972
.word 0xB5AFEA38
.word 0x80D8FF43
.word 0x8F96C293
.word 0x8500CC79
.word 0x61DD273E
.word 0xEF346772
.word 0xFD825BA3
.word 0x5DEDC34C
.word 0xD63AC127
.word 0x0C796A1B
.word 0x9D81A50A
.word 0x0A49244B
.word 0x7D27E565
.word 0xC04E3BF9
.word 0xB8116E7B
.word 0xD59F2252
.word 0xC113DDC0
.word 0x80EB4F47
.word 0x6732B2A5
.word 0xA1FD61FA
.word 0x739E289C
.word 0x4681CFD4
.word 0x62F074A1
.word 0xBD40B8C5
.word 0xFDECB666
.word 0x5F12FD06
.word 0x796215AB
.word 0xD75B8CB2
.word 0xBA2012CE
.word 0xD218723C
.word 0x84425424
.word 0x9C0D9ADD
.word 0xA16DCE34
.word 0x9D933D15
.word 0x45FD0722
.word 0xECCCDEBE
.word 0x2CABED02
.word 0xE17FF473
.word 0xC2851590
.word 0x3AA256C8
.word 0xD8429127
.word 0xFA319C06
.word 0x8C846558
.word 0x81755274
.word 0x167C9192
.word 0x60C60E67
.word 0xD2D107D0
.word 0x57483E49
.word 0xAE70CCB7
.word 0xD306DB8B
.word 0x3C4DF9F6
.word 0x10450F71
.word 0x11373A45
.word 0x0351456A
.word 0x5D94D0F2
.word 0x4C1FA0BD
.word 0x3B270F93
.word 0xC6566575
.word 0xA489C8C2
.word 0x415BBFB3
.word 0x5C56A1DF
.word 0x19EA0057
.word 0x5E634059
.end
