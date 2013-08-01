/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f10.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f10.s,v 1.1 2007/05/11 17:22:25 drp Exp $"
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
	setx	0x27540201A05796C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xC,	%g1
	set	0xA,	%g2
	set	0x6,	%g3
	set	0x5,	%g4
	set	0xF,	%g5
	set	0x0,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x9,	%i1
	set	-0xE,	%i2
	set	-0xE,	%i3
	set	-0x8,	%i4
	set	-0xE,	%i5
	set	-0x3,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x6ABE9382,	%l0
	set	0x4D6E3F57,	%l1
	set	0x6E319180,	%l2
	set	0x1D3D7F5B,	%l3
	set	0x001D4BAD,	%l4
	set	0x4206C6B0,	%l5
	set	0x0A4F0638,	%l6
	!# Output registers
	set	0x1639,	%o0
	set	0x0CF0,	%o1
	set	0x1D72,	%o2
	set	0x1E72,	%o3
	set	-0x0CD4,	%o4
	set	0x0040,	%o5
	set	0x07BA,	%o6
	set	0x1F88,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x2C7AD05F91D05F78)
	INIT_TH_FP_REG(%l7,%f2,0xDBD8E89F99768754)
	INIT_TH_FP_REG(%l7,%f4,0x8CF6745C26D01261)
	INIT_TH_FP_REG(%l7,%f6,0xCB4E3BE3E96A267E)
	INIT_TH_FP_REG(%l7,%f8,0xFC462345355BFF9A)
	INIT_TH_FP_REG(%l7,%f10,0x325024CF884C4813)
	INIT_TH_FP_REG(%l7,%f12,0x28EBD0D33348A5F1)
	INIT_TH_FP_REG(%l7,%f14,0xD286FFA4094BD8B6)
	INIT_TH_FP_REG(%l7,%f16,0x7C45F2350E2BD95A)
	INIT_TH_FP_REG(%l7,%f18,0xC9C04E10ED2DAFD1)
	INIT_TH_FP_REG(%l7,%f20,0x715D5C8FC6C56D36)
	INIT_TH_FP_REG(%l7,%f22,0x9276268CCB3E8023)
	INIT_TH_FP_REG(%l7,%f24,0xCFEBA485A6F6B915)
	INIT_TH_FP_REG(%l7,%f26,0x5719DAACEED8371E)
	INIT_TH_FP_REG(%l7,%f28,0x7EB748EDC0B37572)
	INIT_TH_FP_REG(%l7,%f30,0x1E5C9B9B7FB2C6CD)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x874, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	srax	%o7,	%o6,	%g2
	udivx	%o4,	0x0C1D,	%i0
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x0E] %asi,	%o3
	ba,a	%xcc,	loop_1
	lduw	[%l7 + 0x54],	%g6
	subc	%l3,	0x14C7,	%g5
	sllx	%g1,	%g7,	%l6
loop_1:
	movneg	%xcc,	%o1,	%i6
	membar	0x28
	sdivcc	%o0,	0x189D,	%l0
	fornot1	%f16,	%f16,	%f26
	tle	%xcc,	0x0
	movrlz	%i5,	0x305,	%l4
	fmovdgu	%icc,	%f12,	%f19
	movneg	%icc,	%o5,	%i1
	nop
	fitod	%f2,	%f0
	fdtos	%f0,	%f1
	ldsb	[%l7 + 0x37],	%i2
	fmovdge	%xcc,	%f24,	%f8
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge8ln	%l1,	%g3,	%i4
	fmovrslz	%o2,	%f26,	%f5
	edge8l	%l2,	%g4,	%i3
	sdivx	%i7,	0x193A,	%l5
	movpos	%icc,	%o7,	%o6
	fmovrdne	%o4,	%f12,	%f0
	prefetch	[%l7 + 0x30],	 0x3
	fmovrsne	%g2,	%f19,	%f29
	fmovse	%xcc,	%f30,	%f16
	nop
	set	0x64, %o4
	lduw	[%l7 + %o4],	%i0
	fmovsne	%icc,	%f25,	%f30
	nop
	fitos	%f3,	%f18
	fstox	%f18,	%f18
	srax	%o3,	0x01,	%l3
	sllx	%g6,	%g5,	%g7
	array8	%g1,	%l6,	%i6
	subccc	%o1,	0x0AC4,	%l0
	xorcc	%i5,	%l4,	%o5
	xnorcc	%i1,	%o0,	%l1
	mova	%icc,	%i2,	%g3
	movrlz	%i4,	0x13C,	%o2
	edge32ln	%l2,	%i3,	%g4
	movn	%xcc,	%l5,	%o7
	fmovrdlez	%o6,	%f28,	%f10
	bne	loop_2
	add	%i7,	%o4,	%g2
	addccc	%i0,	%l3,	%o3
	mulx	%g6,	%g7,	%g1
loop_2:
	std	%f8,	[%l7 + 0x70]
	ba,a	%icc,	loop_3
	umul	%g5,	%i6,	%l6
	add	%o1,	%i5,	%l4
	xor	%l0,	%i1,	%o5
loop_3:
	movvs	%icc,	%l1,	%o0
	andcc	%g3,	0x184F,	%i2
	faligndata	%f12,	%f26,	%f28
	fandnot1s	%f18,	%f6,	%f14
	tvc	%xcc,	0x3
	set	0x60, %i0
	lda	[%l7 + %i0] 0x80,	%f26
	wr	%g0,	0x89,	%asi
	sta	%f30,	[%l7 + 0x14] %asi
	andcc	%o2,	%i4,	%i3
	taddcctv	%g4,	0x0849,	%l2
	te	%icc,	0x4
	taddcc	%l5,	0x1A38,	%o7
	brnz	%o6,	loop_4
	nop
	setx	0x6F7E750B756469B1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x8BD5102CD2735382,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f0,	%f20
	taddcctv	%o4,	%i7,	%i0
	tge	%icc,	0x5
loop_4:
	move	%icc,	%l3,	%o3
	array16	%g2,	%g6,	%g7
	brlez	%g5,	loop_5
	tleu	%xcc,	0x7
	bvs,pn	%icc,	loop_6
	tleu	%icc,	0x5
loop_5:
	tg	%xcc,	0x6
	fexpand	%f18,	%f18
loop_6:
	tcs	%icc,	0x7
	srlx	%g1,	%l6,	%i6
	tcs	%icc,	0x5
	orncc	%i5,	%l4,	%l0
	tsubcctv	%o1,	%i1,	%o5
	sir	0x1DC3
	sdiv	%l1,	0x0C25,	%g3
	nop
	fitos	%f13,	%f11
	fstoi	%f11,	%f13
	udivcc	%o0,	0x0909,	%o2
	sub	%i4,	%i3,	%i2
	bcs,a	%icc,	loop_7
	fpsub16s	%f28,	%f28,	%f28
	fpsub16	%f20,	%f26,	%f16
	fabsd	%f8,	%f2
loop_7:
	bne	loop_8
	addc	%l2,	%l5,	%o7
	nop
	setx	0xB36033DF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x3CDD74F8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f16,	%f17
	xor	%g4,	%o4,	%o6
loop_8:
	udivcc	%i7,	0x0E11,	%i0
	nop
	setx	0xF079D962,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	movgu	%icc,	%l3,	%g2
	te	%icc,	0x7
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x4C] %asi,	%g6
	fbug	%fcc1,	loop_9
	edge16	%g7,	%g5,	%g1
	nop
	setx	loop_10,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fone	%f10
loop_9:
	bpos	loop_11
	umul	%l6,	0x0DAB,	%i6
loop_10:
	fandnot2s	%f17,	%f8,	%f30
	movle	%icc,	%i5,	%o3
loop_11:
	movcs	%xcc,	%l4,	%l0
	for	%f4,	%f2,	%f8
	wr	%g0,	0x2b,	%asi
	stba	%i1,	[%l7 + 0x68] %asi
	membar	#Sync
	tle	%icc,	0x7
	fmovrsgez	%o1,	%f24,	%f4
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	bl,pn	%icc,	loop_12
	sethi	0x1526,	%o5
	fbne,a	%fcc3,	loop_13
	edge16n	%g3,	%o0,	%l1
loop_12:
	movn	%icc,	%i4,	%o2
	array8	%i2,	%i3,	%l5
loop_13:
	mulx	%o7,	%g4,	%l2
	pdist	%f2,	%f28,	%f18
	stbar
	tcc	%xcc,	0x5
	edge32l	%o4,	%o6,	%i0
	tcc	%xcc,	0x2
	movgu	%icc,	%i7,	%l3
	movvc	%xcc,	%g2,	%g6
	subc	%g5,	0x108A,	%g7
	movneg	%icc,	%g1,	%i6
	xor	%l6,	0x0FA9,	%o3
	edge16l	%l4,	%l0,	%i5
	edge16n	%o1,	%i1,	%g3
	edge8l	%o0,	%l1,	%i4
	fandnot2s	%f29,	%f27,	%f29
	alignaddr	%o5,	%i2,	%o2
	movrlez	%l5,	%i3,	%o7
	fmovrse	%l2,	%f10,	%f5
	edge16l	%g4,	%o6,	%o4
	edge16	%i7,	%l3,	%g2
	te	%xcc,	0x3
	tcs	%icc,	0x5
	movcs	%icc,	%g6,	%i0
	tgu	%xcc,	0x4
	tvs	%xcc,	0x7
	or	%g7,	0x0622,	%g1
	movrlez	%i6,	%l6,	%o3
	udivx	%l4,	0x0BEE,	%l0
	edge32ln	%g5,	%o1,	%i1
	tl	%icc,	0x4
	call	loop_14
	ta	%icc,	0x3
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f12
	nop
	setx	0x696B7764607E3313,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_14:
	fnot2	%f8,	%f18
	fmovsg	%xcc,	%f16,	%f7
	fmovsge	%xcc,	%f17,	%f7
	tg	%xcc,	0x2
	addcc	%i5,	0x1143,	%g3
	ldstub	[%l7 + 0x17],	%l1
	smulcc	%o0,	0x1565,	%i4
	nop
	setx	0xA0AB2E51,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x8FA1CEAF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f27,	%f21
	udivx	%o5,	0x1CCE,	%i2
	bgu	loop_15
	movneg	%xcc,	%l5,	%o2
	fpmerge	%f29,	%f4,	%f10
	nop
	setx loop_16, %l0, %l1
	jmpl %l1, %i3
loop_15:
	move	%icc,	%l2,	%g4
	bcs,pt	%icc,	loop_17
	umulcc	%o6,	0x0205,	%o7
loop_16:
	udivx	%o4,	0x0A05,	%i7
	set	0x66, %l3
	lduha	[%l7 + %l3] 0x81,	%l3
loop_17:
	taddcc	%g6,	0x06BC,	%g2
	fzero	%f14
	fmovrsne	%i0,	%f3,	%f14
	sdivx	%g7,	0x19A3,	%g1
	taddcctv	%i6,	%l6,	%o3
	fnors	%f16,	%f6,	%f25
	tgu	%icc,	0x1
	call	loop_18
	tgu	%icc,	0x3
	st	%f20,	[%l7 + 0x0C]
	sir	0x1536
loop_18:
	fmovrdne	%l0,	%f30,	%f14
	bn,pn	%icc,	loop_19
	orcc	%g5,	%l4,	%i1
	edge8l	%i5,	%o1,	%g3
	fblg,a	%fcc3,	loop_20
loop_19:
	mulscc	%l1,	%o0,	%i4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_20:
	edge16	%i2,	%o5,	%o2
	tgu	%xcc,	0x3
	addc	%i3,	%l2,	%g4
	array8	%o6,	%l5,	%o7
	array16	%o4,	%i7,	%l3
	movvs	%icc,	%g2,	%i0
	brz,a	%g6,	loop_21
	sir	0x1A0C
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x1C] %asi,	%g1
loop_21:
	sdivcc	%i6,	0x0E23,	%l6
	movrne	%o3,	0x0AB,	%l0
	edge16ln	%g5,	%l4,	%g7
	movge	%icc,	%i5,	%o1
	bvc,a	loop_22
	ba,pn	%xcc,	loop_23
	brz,a	%g3,	loop_24
	te	%icc,	0x0
loop_22:
	movne	%xcc,	%l1,	%i1
loop_23:
	xorcc	%o0,	0x0E85,	%i2
loop_24:
	udivx	%i4,	0x1BCD,	%o2
	taddcc	%o5,	%i3,	%g4
	fandnot2	%f20,	%f12,	%f26
	set	0x20, %g7
	ldda	[%l7 + %g7] 0x2b,	%l2
	subcc	%l5,	0x0B7B,	%o7
	edge8	%o6,	%o4,	%i7
	set	0x1C, %l5
	ldsha	[%l7 + %l5] 0x80,	%g2
	bge,pt	%xcc,	loop_25
	movrne	%i0,	%l3,	%g1
	udiv	%g6,	0x1AD3,	%i6
	movg	%icc,	%l6,	%o3
loop_25:
	fbne	%fcc2,	loop_26
	fnot1s	%f21,	%f13
	movneg	%xcc,	%l0,	%l4
	array32	%g5,	%i5,	%o1
loop_26:
	movleu	%icc,	%g3,	%g7
	movrlez	%l1,	%i1,	%i2
	fbuge	%fcc1,	loop_27
	fandnot2s	%f26,	%f23,	%f16
	fmovsleu	%xcc,	%f8,	%f19
	movgu	%xcc,	%i4,	%o0
loop_27:
	fbo	%fcc0,	loop_28
	sub	%o5,	0x13F1,	%i3
	wr	%g0,	0x22,	%asi
	stba	%g4,	[%l7 + 0x09] %asi
	membar	#Sync
loop_28:
	andn	%l2,	0x0BDC,	%l5
	sdivx	%o7,	0x0AB8,	%o2
	fblg,a	%fcc2,	loop_29
	edge16l	%o4,	%i7,	%o6
	movrlz	%g2,	0x338,	%i0
	fmuld8ulx16	%f10,	%f8,	%f6
loop_29:
	tsubcc	%g1,	0x1375,	%g6
	srax	%l3,	0x13,	%l6
	stbar
	fmovrde	%i6,	%f4,	%f28
	tl	%icc,	0x2
	sll	%o3,	0x02,	%l0
	movneg	%icc,	%g5,	%l4
	fbl	%fcc2,	loop_30
	fornot1	%f28,	%f28,	%f10
	fmovsne	%icc,	%f29,	%f31
	edge16n	%o1,	%g3,	%g7
loop_30:
	nop
	setx	0x2F5DC650507E6136,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%i5,	%i1
	fmul8sux16	%f6,	%f22,	%f30
	fmovdg	%icc,	%f14,	%f3
	tg	%icc,	0x5
	fmovdle	%xcc,	%f30,	%f20
	fmovdpos	%xcc,	%f8,	%f3
	edge16n	%l1,	%i4,	%i2
	add	%o5,	0x1E6D,	%o0
	fmovdvc	%icc,	%f30,	%f27
	fandnot2	%f24,	%f24,	%f16
	sra	%g4,	%l2,	%i3
	movrlz	%o7,	0x2A1,	%o2
	movrgez	%o4,	0x3A3,	%i7
	movneg	%icc,	%o6,	%g2
	edge8	%l5,	%i0,	%g6
	fmovdne	%icc,	%f13,	%f14
	alignaddr	%g1,	%l6,	%i6
	membar	0x27
	ldsb	[%l7 + 0x59],	%o3
	nop
	setx	0x9FC12824,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f1
	movle	%icc,	%l0,	%l3
	fpmerge	%f26,	%f3,	%f10
	addccc	%g5,	0x19B3,	%l4
	tge	%icc,	0x0
	fmovscc	%icc,	%f28,	%f4
	fmovsvc	%xcc,	%f1,	%f1
	bn,pn	%xcc,	loop_31
	movcs	%xcc,	%o1,	%g7
	movrlez	%i5,	%g3,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31:
	bg,a	loop_32
	tneg	%xcc,	0x4
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x5F] %asi,	%i4
loop_32:
	fbe	%fcc2,	loop_33
	fbule	%fcc2,	loop_34
	lduw	[%l7 + 0x44],	%i2
	tcc	%icc,	0x2
loop_33:
	movg	%xcc,	%i1,	%o0
loop_34:
	udivx	%o5,	0x162F,	%g4
	taddcctv	%l2,	0x1780,	%o7
	array16	%o2,	%o4,	%i7
	popc	%o6,	%g2
	movrne	%i3,	0x0E4,	%l5
	tneg	%icc,	0x4
	umulcc	%g6,	%g1,	%l6
	xorcc	%i6,	0x1CFE,	%o3
	taddcc	%l0,	0x01BE,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l3,	0x1864,	%l4
	fandnot1	%f8,	%f28,	%f20
	brlz	%g5,	loop_35
	pdist	%f20,	%f10,	%f22
	umulcc	%g7,	0x1B24,	%o1
	orn	%i5,	0x039D,	%g3
loop_35:
	subcc	%l1,	%i2,	%i4
	sdiv	%o0,	0x1999,	%o5
	array8	%g4,	%i1,	%o7
	fmovsgu	%xcc,	%f22,	%f14
	wr	%g0,	0x19,	%asi
	stba	%o2,	[%l7 + 0x68] %asi
	stx	%o4,	[%l7 + 0x40]
	taddcc	%l2,	0x0686,	%i7
	fpsub32s	%f12,	%f1,	%f22
	fmuld8ulx16	%f17,	%f21,	%f8
	fmovsle	%xcc,	%f7,	%f30
	fzeros	%f9
	orncc	%g2,	0x0EEC,	%i3
	tsubcc	%l5,	%o6,	%g6
	udiv	%l6,	0x19A8,	%i6
	edge32ln	%o3,	%l0,	%g1
	fmovdcs	%xcc,	%f24,	%f21
	fbg	%fcc0,	loop_36
	addc	%l3,	%l4,	%i0
	movrgez	%g7,	%g5,	%i5
	tcs	%icc,	0x4
loop_36:
	ta	%xcc,	0x0
	fmovda	%xcc,	%f0,	%f26
	fmovrsgez	%g3,	%f22,	%f26
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	edge16l	%o1,	%i2,	%i4
	fxor	%f2,	%f14,	%f16
	movvc	%icc,	%l1,	%o5
	bleu	loop_37
	movge	%xcc,	%g4,	%i1
	set	0x54, %o0
	swapa	[%l7 + %o0] 0x04,	%o0
loop_37:
	mulx	%o7,	0x06BA,	%o4
	fsrc1	%f22,	%f28
	fbne	%fcc3,	loop_38
	movl	%xcc,	%o2,	%i7
	movne	%xcc,	%l2,	%i3
	fornot1	%f28,	%f6,	%f30
loop_38:
	fmovrsne	%g2,	%f18,	%f16
	ta	%xcc,	0x4
	edge8	%o6,	%g6,	%l6
	nop
	setx	loop_39,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8ulx16	%f4,	%f26,	%f28
	fcmpeq16	%f0,	%f4,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39:
	array16	%o3,	%l5,	%l0
	orncc	%g1,	%l4,	%i0
	fmul8x16al	%f25,	%f5,	%f30
	tle	%xcc,	0x7
	fbug,a	%fcc1,	loop_40
	movgu	%xcc,	%g7,	%g5
	stw	%l3,	[%l7 + 0x14]
	fmul8x16	%f22,	%f20,	%f22
loop_40:
	bgu,a	%icc,	loop_41
	tsubcc	%g3,	0x1ED9,	%i5
	lduw	[%l7 + 0x4C],	%o1
	fbne,a	%fcc3,	loop_42
loop_41:
	subcc	%i2,	0x14A0,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_43,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_42:
	prefetch	[%l7 + 0x50],	 0x0
	sdivx	%o5,	0x15A0,	%l1
	edge8n	%i1,	%g4,	%o0
loop_43:
	alignaddrl	%o7,	%o4,	%o2
	movvc	%icc,	%i7,	%l2
	movge	%xcc,	%g2,	%o6
	bvc,a	loop_44
	fsrc2	%f16,	%f16
	srax	%i3,	0x0B,	%l6
	call	loop_45
loop_44:
	fbne	%fcc2,	loop_46
	movcc	%icc,	%g6,	%o3
	movle	%icc,	%i6,	%l0
loop_45:
	fbu	%fcc2,	loop_47
loop_46:
	st	%f27,	[%l7 + 0x10]
	fbl,a	%fcc1,	loop_48
	movrgz	%l5,	0x0B3,	%l4
loop_47:
	movle	%icc,	%g1,	%i0
	fzero	%f16
loop_48:
	ta	%icc,	0x6
	tcc	%xcc,	0x3
	fnegs	%f22,	%f26
	pdist	%f28,	%f16,	%f8
	fcmpne32	%f22,	%f8,	%g5
	fcmpeq32	%f4,	%f2,	%g7
	sdiv	%g3,	0x0461,	%l3
	fcmpgt32	%f24,	%f28,	%o1
	array8	%i2,	%i5,	%i4
	bpos,pt	%icc,	loop_49
	addccc	%l1,	%i1,	%o5
	movn	%icc,	%o0,	%o7
	edge8ln	%g4,	%o2,	%i7
loop_49:
	orncc	%l2,	0x019F,	%g2
	sub	%o4,	%o6,	%l6
	nop
	setx	0xDA8A91B2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f7
	taddcctv	%i3,	0x166C,	%o3
	edge32ln	%i6,	%g6,	%l5
	fandnot2s	%f26,	%f16,	%f20
	bvc,a,pt	%xcc,	loop_50
	fmovsleu	%icc,	%f7,	%f4
	set	0x10, %l0
	lduwa	[%l7 + %l0] 0x10,	%l4
loop_50:
	fbn,a	%fcc1,	loop_51
	fandnot1	%f10,	%f30,	%f14
	sdivcc	%l0,	0x0FDD,	%i0
	tvs	%xcc,	0x0
loop_51:
	fxnors	%f25,	%f30,	%f6
	tge	%xcc,	0x1
	edge32	%g1,	%g7,	%g3
	nop
	setx	loop_52,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srl	%l3,	0x0F,	%o1
	tge	%icc,	0x4
	set	0x6E, %i6
	stha	%i2,	[%l7 + %i6] 0x88
loop_52:
	fandnot1	%f10,	%f26,	%f24
	fmovdneg	%icc,	%f18,	%f1
	movre	%i5,	%g5,	%l1
	movge	%icc,	%i4,	%i1
	movvc	%icc,	%o0,	%o7
	edge16	%g4,	%o2,	%i7
	edge32ln	%o5,	%l2,	%g2
	alignaddr	%o4,	%l6,	%o6
	fbe	%fcc3,	loop_53
	ba,a,pn	%xcc,	loop_54
	fornot1s	%f26,	%f13,	%f1
	alignaddrl	%i3,	%i6,	%g6
loop_53:
	subcc	%l5,	0x0563,	%l4
loop_54:
	nop
	fitod	%f8,	%f14
	fdtoi	%f14,	%f26
	ldd	[%l7 + 0x48],	%l0
	set	0x7C, %o5
	lda	[%l7 + %o5] 0x19,	%f24
	mova	%icc,	%o3,	%i0
	fmovrsgez	%g7,	%f1,	%f9
	set	0x24, %i5
	swapa	[%l7 + %i5] 0x19,	%g1
	orn	%l3,	%g3,	%i2
	fornot2	%f20,	%f4,	%f30
	bgu,pt	%icc,	loop_55
	sdivcc	%o1,	0x032D,	%i5
	stx	%l1,	[%l7 + 0x40]
	sra	%g5,	%i4,	%i1
loop_55:
	tcs	%icc,	0x3
	edge32n	%o7,	%g4,	%o2
	mova	%icc,	%i7,	%o5
	fmovdneg	%xcc,	%f16,	%f5
	nop
	setx	0xB799AAFE8079CB3A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	movle	%icc,	%l2,	%o0
	bg,a,pn	%xcc,	loop_56
	fmovda	%icc,	%f4,	%f29
	xor	%o4,	0x18C9,	%g2
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x3B] %asi,	%o6
loop_56:
	tvs	%xcc,	0x3
	movrgz	%l6,	%i3,	%g6
	sllx	%i6,	0x05,	%l5
	sub	%l4,	0x096D,	%l0
	fandnot2	%f12,	%f22,	%f6
	edge16l	%o3,	%g7,	%g1
	ldstub	[%l7 + 0x7B],	%l3
	brgez,a	%i0,	loop_57
	flush	%l7 + 0x18
	movneg	%xcc,	%g3,	%i2
	nop
	setx	0xB05EE1CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
loop_57:
	ldd	[%l7 + 0x78],	%f4
	fnegd	%f12,	%f24
	sll	%o1,	0x02,	%l1
	movrlz	%i5,	0x109,	%i4
	tge	%icc,	0x4
	fnegs	%f16,	%f6
	fornot2s	%f31,	%f22,	%f12
	addcc	%g5,	%o7,	%i1
	tneg	%xcc,	0x4
	udivx	%o2,	0x05B6,	%i7
	tneg	%xcc,	0x4
	udivx	%g4,	0x0A96,	%o5
	fpsub16s	%f0,	%f11,	%f26
	fmul8x16au	%f22,	%f19,	%f22
	fmovsg	%xcc,	%f13,	%f17
	movle	%xcc,	%o0,	%o4
	edge8ln	%l2,	%o6,	%g2
	stx	%i3,	[%l7 + 0x30]
	bneg,pt	%xcc,	loop_58
	smulcc	%l6,	%g6,	%i6
	movneg	%xcc,	%l5,	%l0
	tcc	%icc,	0x4
loop_58:
	edge32	%l4,	%g7,	%o3
	fmovde	%icc,	%f29,	%f20
	fzero	%f16
	addccc	%g1,	%i0,	%g3
	tge	%icc,	0x1
	mulx	%l3,	%i2,	%l1
	movg	%icc,	%i5,	%i4
	nop
	setx	0x2F19A7CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f7
	nop
	setx	0x418B01480A14EBB3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x81251A6CC4211C0E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f30,	%f6
	subc	%o1,	0x18C8,	%o7
	addccc	%i1,	0x1CD9,	%g5
	tle	%icc,	0x7
	umulcc	%o2,	0x1F6A,	%i7
	smul	%g4,	%o5,	%o4
	fmul8ulx16	%f12,	%f2,	%f8
	flush	%l7 + 0x5C
	mulscc	%l2,	%o6,	%o0
	fmovdg	%xcc,	%f0,	%f30
	movle	%icc,	%i3,	%l6
	bneg	%icc,	loop_59
	ld	[%l7 + 0x08],	%f3
	fmuld8ulx16	%f23,	%f3,	%f10
	nop
	setx	0x1422304D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xAA8B8A86,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f7,	%f30
loop_59:
	tvc	%xcc,	0x3
	wr	%g0,	0x04,	%asi
	stxa	%g6,	[%l7 + 0x38] %asi
	nop
	fitos	%f0,	%f5
	fstox	%f5,	%f10
	fxtos	%f10,	%f22
	movrgz	%g2,	0x125,	%l5
	sethi	0x0D15,	%i6
	or	%l4,	%l0,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f16,	%f13,	%f7
	fmovdvc	%icc,	%f28,	%f16
	subccc	%g1,	0x035A,	%g7
	fmovsa	%xcc,	%f9,	%f5
	fmovsl	%icc,	%f18,	%f13
	lduh	[%l7 + 0x18],	%i0
	set	0x25, %l4
	lduba	[%l7 + %l4] 0x18,	%l3
	alignaddrl	%g3,	%i2,	%l1
	sdivx	%i4,	0x1FF1,	%o1
	alignaddr	%i5,	%i1,	%o7
	tvs	%xcc,	0x6
	taddcctv	%g5,	%o2,	%g4
	fmovde	%icc,	%f0,	%f30
	ldstub	[%l7 + 0x2F],	%i7
	lduh	[%l7 + 0x1E],	%o4
	array16	%l2,	%o5,	%o0
	set	0x0C, %g2
	sta	%f5,	[%l7 + %g2] 0x0c
	tne	%xcc,	0x4
	edge16n	%o6,	%i3,	%g6
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x39] %asi,	%l6
	edge8ln	%l5,	%i6,	%l4
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x50] %asi,	%f22
	edge8n	%g2,	%l0,	%g1
	set	0x40, %g5
	stwa	%g7,	[%l7 + %g5] 0x18
	fbu	%fcc1,	loop_60
	mulscc	%o3,	%i0,	%l3
	fandnot1s	%f19,	%f19,	%f18
	bpos,a	%xcc,	loop_61
loop_60:
	andcc	%i2,	0x0272,	%l1
	fmovrdgz	%i4,	%f18,	%f16
	movn	%xcc,	%o1,	%g3
loop_61:
	popc	0x0B97,	%i1
	sdivcc	%i5,	0x1B58,	%g5
	edge16n	%o2,	%o7,	%i7
	sra	%g4,	0x10,	%l2
	fmovse	%xcc,	%f15,	%f22
	movgu	%xcc,	%o5,	%o0
	fnegd	%f14,	%f22
	tn	%xcc,	0x3
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	brgez,a	%o4,	loop_62
	ldub	[%l7 + 0x32],	%i3
	ldx	[%l7 + 0x60],	%o6
	array32	%l6,	%l5,	%g6
loop_62:
	tl	%xcc,	0x2
	xnor	%l4,	%g2,	%l0
	fmovscs	%xcc,	%f29,	%f10
	fsrc2s	%f6,	%f23
	orcc	%i6,	0x1F7A,	%g7
	fpackfix	%f2,	%f27
	udivx	%g1,	0x0733,	%o3
	fble	%fcc0,	loop_63
	edge32ln	%l3,	%i0,	%l1
	fmovda	%icc,	%f7,	%f13
	orncc	%i4,	%o1,	%g3
loop_63:
	tg	%xcc,	0x4
	orn	%i2,	0x1A71,	%i5
	brlez	%i1,	loop_64
	nop
	fitos	%f12,	%f15
	fstod	%f15,	%f30
	edge32n	%g5,	%o7,	%i7
	array32	%g4,	%l2,	%o2
loop_64:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%o4
	bneg,pn	%icc,	loop_65
	taddcc	%i3,	%o0,	%l6
	tcc	%icc,	0x3
	movrlez	%l5,	0x3B9,	%g6
loop_65:
	xorcc	%o6,	0x1FBF,	%l4
	xorcc	%l0,	0x0FBA,	%i6
	set	0x33, %o1
	ldstuba	[%l7 + %o1] 0x88,	%g2
	movl	%icc,	%g7,	%o3
	fmovd	%f6,	%f0
	brlez,a	%g1,	loop_66
	sethi	0x0118,	%i0
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x28] %asi,	%l1
loop_66:
	nop
	setx	loop_67,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%l3,	%o1,	%i4
	set	0x7C, %o3
	swapa	[%l7 + %o3] 0x88,	%g3
loop_67:
	taddcc	%i5,	%i1,	%i2
	orn	%o7,	0x140D,	%i7
	fsrc1s	%f14,	%f30
	sdiv	%g4,	0x0151,	%l2
	membar	0x69
	udivx	%o2,	0x0053,	%g5
	sdivcc	%o5,	0x1DAF,	%i3
	addcc	%o4,	%l6,	%o0
	fmovdvs	%icc,	%f16,	%f2
	ldsb	[%l7 + 0x44],	%l5
	fmovs	%f11,	%f0
	smulcc	%g6,	%l4,	%o6
	nop
	fitod	%f13,	%f28
	brlz	%l0,	loop_68
	nop
	setx	0x2C3EB750A34DADB8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x0D9BFA90BAA29878,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f10,	%f22
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x44] %asi,	%g2
loop_68:
	sdivx	%g7,	0x0B3B,	%i6
	edge8ln	%g1,	%o3,	%i0
	fmovsn	%xcc,	%f1,	%f15
	fmovdgu	%xcc,	%f26,	%f30
	tle	%icc,	0x0
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x5A] %asi,	%l3
	smulcc	%l1,	%o1,	%g3
	tg	%xcc,	0x3
	sth	%i5,	[%l7 + 0x0A]
	fmuld8ulx16	%f1,	%f5,	%f6
	array8	%i4,	%i1,	%o7
	bcc	loop_69
	xnor	%i7,	%g4,	%i2
	fbne	%fcc0,	loop_70
	fmovrdgez	%o2,	%f2,	%f0
loop_69:
	popc	%g5,	%l2
	smul	%i3,	%o5,	%l6
loop_70:
	fmul8ulx16	%f12,	%f14,	%f14
	movleu	%icc,	%o4,	%o0
	orcc	%g6,	0x127E,	%l5
	fbge,a	%fcc3,	loop_71
	stx	%l4,	[%l7 + 0x28]
	tpos	%xcc,	0x7
	mova	%xcc,	%o6,	%g2
loop_71:
	xnor	%l0,	%g7,	%i6
	orncc	%o3,	%g1,	%i0
	set	0x38, %o6
	stwa	%l1,	[%l7 + %o6] 0x2b
	membar	#Sync
	sll	%l3,	0x1A,	%g3
	brgz	%o1,	loop_72
	tle	%xcc,	0x5
	udiv	%i4,	0x0232,	%i1
	movleu	%xcc,	%i5,	%i7
loop_72:
	fnot2	%f30,	%f4
	movre	%o7,	0x3D8,	%i2
	prefetch	[%l7 + 0x34],	 0x1
	fpadd32	%f2,	%f20,	%f16
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%g4
	ldsw	[%l7 + 0x74],	%o2
	movg	%xcc,	%l2,	%i3
	orncc	%g5,	%l6,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x60, %i3
	ldda	[%l7 + %i3] 0x10,	%o0
	tg	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	sta	%f16,	[%l7 + 0x08] %asi
	tleu	%xcc,	0x2
	orn	%o4,	0x1881,	%g6
	nop
	fitod	%f12,	%f14
	fdtoi	%f14,	%f7
	fbug	%fcc1,	loop_73
	addcc	%l4,	%o6,	%l5
	movrlez	%l0,	%g2,	%g7
	tleu	%icc,	0x5
loop_73:
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x08] %asi,	%o3
	bge	loop_74
	andn	%g1,	%i0,	%l1
	set	0x27, %l1
	lduba	[%l7 + %l1] 0x89,	%i6
loop_74:
	taddcctv	%l3,	%g3,	%o1
	ldsh	[%l7 + 0x76],	%i1
	sra	%i5,	%i7,	%i4
	tne	%icc,	0x3
	alignaddr	%i2,	%o7,	%o2
	tge	%icc,	0x5
	fbuge	%fcc1,	loop_75
	srlx	%g4,	0x10,	%i3
	nop
	setx	0x08795EA0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f7
	xnorcc	%g5,	%l2,	%l6
loop_75:
	movcc	%icc,	%o5,	%o4
	fmovd	%f4,	%f2
	lduw	[%l7 + 0x40],	%o0
	movge	%xcc,	%g6,	%o6
	udivx	%l5,	0x10CA,	%l4
	fnand	%f14,	%f6,	%f24
	fbne	%fcc3,	loop_76
	movpos	%icc,	%g2,	%l0
	sub	%o3,	0x08DF,	%g7
	nop
	setx	0x34B49A3E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x7CD06133,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f31,	%f21
loop_76:
	fmovdl	%icc,	%f1,	%f20
	nop
	fitod	%f8,	%f24
	fdtos	%f24,	%f22
	fpsub32	%f10,	%f2,	%f26
	orn	%i0,	%l1,	%g1
	brgez,a	%i6,	loop_77
	fbu	%fcc1,	loop_78
	nop
	set	0x2E, %l6
	lduh	[%l7 + %l6],	%l3
	edge32n	%o1,	%i1,	%i5
loop_77:
	tle	%icc,	0x2
loop_78:
	movrlz	%i7,	0x254,	%i4
	set	0x6A, %i7
	ldsha	[%l7 + %i7] 0x04,	%g3
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x14,	%f16
	xnor	%o7,	0x1DAF,	%o2
	edge16n	%i2,	%i3,	%g5
	sll	%g4,	%l6,	%o5
	sll	%l2,	%o4,	%g6
	fpadd16s	%f10,	%f15,	%f27
	fbe	%fcc2,	loop_79
	udivx	%o6,	0x1948,	%l5
	mova	%xcc,	%o0,	%g2
	tge	%icc,	0x5
loop_79:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f20,	%f20,	%f25
	fmovsl	%icc,	%f19,	%f8
	edge16l	%l0,	%o3,	%l4
	smul	%g7,	0x0FA2,	%l1
	ldd	[%l7 + 0x08],	%f16
	bn,a	loop_80
	alignaddrl	%i0,	%g1,	%i6
	sdivcc	%l3,	0x17B8,	%i1
	xnorcc	%i5,	0x0A3D,	%i7
loop_80:
	fands	%f1,	%f24,	%f4
	movvs	%xcc,	%i4,	%g3
	addc	%o7,	%o2,	%o1
	tpos	%icc,	0x7
	sdivx	%i3,	0x0ADF,	%g5
	tsubcc	%i2,	%l6,	%g4
	edge8n	%l2,	%o5,	%o4
	bgu,pn	%xcc,	loop_81
	xor	%o6,	0x080F,	%l5
	umulcc	%g6,	%o0,	%l0
	fpackfix	%f14,	%f31
loop_81:
	lduw	[%l7 + 0x38],	%g2
	fmovsvs	%icc,	%f6,	%f19
	andncc	%o3,	%g7,	%l1
	taddcc	%l4,	%i0,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g1,	%l3,	%i5
	mulx	%i1,	0x168B,	%i7
	brgez,a	%g3,	loop_82
	movl	%icc,	%o7,	%i4
	movge	%icc,	%o2,	%i3
	movne	%xcc,	%g5,	%o1
loop_82:
	tcs	%xcc,	0x0
	fpsub16	%f28,	%f10,	%f10
	or	%i2,	0x18F7,	%l6
	edge16l	%l2,	%g4,	%o4
	array8	%o5,	%l5,	%o6
	tge	%icc,	0x0
	subcc	%o0,	0x0EBF,	%l0
	edge16l	%g6,	%g2,	%o3
	movne	%icc,	%g7,	%l1
	or	%l4,	0x02C1,	%i0
	orcc	%i6,	0x1828,	%l3
	tsubcc	%g1,	0x194F,	%i5
	tne	%icc,	0x3
	fcmpne16	%f30,	%f28,	%i1
	edge8n	%g3,	%i7,	%i4
	movvs	%xcc,	%o7,	%o2
	tle	%xcc,	0x1
	nop
	set	0x37, %i1
	ldsb	[%l7 + %i1],	%i3
	xnorcc	%o1,	%g5,	%i2
	fmul8sux16	%f22,	%f26,	%f16
	movcc	%icc,	%l2,	%g4
	tle	%xcc,	0x6
	swap	[%l7 + 0x48],	%o4
	array32	%l6,	%o5,	%l5
	orncc	%o6,	%o0,	%g6
	sllx	%g2,	%o3,	%l0
	movrlz	%l1,	0x1DC,	%g7
	movge	%xcc,	%i0,	%i6
	edge16n	%l4,	%l3,	%i5
	edge16n	%i1,	%g1,	%g3
	xorcc	%i7,	0x0A9C,	%i4
	set	0x54, %i2
	stwa	%o2,	[%l7 + %i2] 0x15
	nop
	setx	loop_83,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlez	%o7,	%o1,	%g5
	tg	%xcc,	0x3
	membar	0x5B
loop_83:
	mulscc	%i2,	%i3,	%l2
	andn	%o4,	0x0BBC,	%g4
	orn	%l6,	0x08D0,	%o5
	edge16	%o6,	%o0,	%l5
	nop
	fitos	%f4,	%f11
	fstoi	%f11,	%f4
	movgu	%icc,	%g6,	%g2
	bn	loop_84
	fbg,a	%fcc0,	loop_85
	nop
	setx	0xCE006A81D6B24D5D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f20
	wr	%g0,	0x80,	%asi
	stwa	%l0,	[%l7 + 0x60] %asi
loop_84:
	movre	%l1,	%g7,	%o3
loop_85:
	fbue	%fcc0,	loop_86
	movre	%i0,	0x2F9,	%i6
	fbn	%fcc1,	loop_87
	fmovsvc	%xcc,	%f14,	%f6
loop_86:
	brlz,a	%l3,	loop_88
	movvc	%icc,	%i5,	%i1
loop_87:
	edge8	%l4,	%g1,	%i7
	alignaddr	%g3,	%o2,	%i4
loop_88:
	udiv	%o7,	0x11B0,	%o1
	ta	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc0,	loop_89
	subcc	%g5,	0x026E,	%i3
	movrne	%i2,	%l2,	%o4
	tle	%xcc,	0x7
loop_89:
	edge32n	%g4,	%o5,	%o6
	fmovda	%icc,	%f8,	%f21
	movvs	%xcc,	%l6,	%l5
	fba,a	%fcc3,	loop_90
	edge16n	%g6,	%g2,	%o0
	xnor	%l0,	0x0D53,	%l1
	sll	%g7,	0x15,	%o3
loop_90:
	sll	%i0,	%l3,	%i5
	mova	%icc,	%i1,	%l4
	std	%f30,	[%l7 + 0x18]
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x26] %asi,	%i6
	wr	%g0,	0x23,	%asi
	stba	%g1,	[%l7 + 0x17] %asi
	membar	#Sync
	brgz	%g3,	loop_91
	tneg	%icc,	0x6
	mulx	%o2,	0x1691,	%i4
	mulscc	%o7,	0x1A6E,	%o1
loop_91:
	tg	%icc,	0x7
	edge8n	%g5,	%i3,	%i7
	edge32ln	%l2,	%i2,	%g4
	fble,a	%fcc0,	loop_92
	orncc	%o4,	0x0881,	%o5
	movneg	%icc,	%l6,	%l5
	sth	%o6,	[%l7 + 0x34]
loop_92:
	addcc	%g2,	%g6,	%o0
	nop
	setx	0x6B9A14D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x1A96B754,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f10,	%f0
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x58] %asi,	%l0
	sll	%g7,	0x0A,	%o3
	alignaddrl	%l1,	%l3,	%i0
	sdivx	%i1,	0x0FBC,	%i5
	smulcc	%i6,	%g1,	%l4
	udivcc	%o2,	0x04CA,	%g3
	bvc,a,pt	%xcc,	loop_93
	fnegs	%f28,	%f5
	edge32l	%i4,	%o1,	%g5
	add	%o7,	0x0AB4,	%i7
loop_93:
	edge32l	%i3,	%i2,	%l2
	array8	%g4,	%o5,	%o4
	set	0x3C, %o7
	swapa	[%l7 + %o7] 0x18,	%l5
	tn	%icc,	0x1
	brgez,a	%o6,	loop_94
	udivcc	%l6,	0x09CE,	%g6
	edge16	%g2,	%l0,	%o0
	movg	%icc,	%g7,	%l1
loop_94:
	nop
	fitos	%f1,	%f19
	fstox	%f19,	%f12
	fxtos	%f12,	%f9
	tl	%icc,	0x1
	fandnot1s	%f8,	%f31,	%f1
	andncc	%l3,	%o3,	%i0
	nop
	fitos	%f13,	%f12
	fstod	%f12,	%f14
	tgu	%xcc,	0x4
	and	%i5,	0x0B38,	%i1
	ta	%xcc,	0x3
	alignaddrl	%g1,	%l4,	%o2
	sethi	0x1EE4,	%i6
	set	0x58, %g4
	lda	[%l7 + %g4] 0x89,	%f27
	te	%icc,	0x6
	tne	%icc,	0x5
	movcs	%icc,	%i4,	%g3
	nop
	setx	loop_95,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brnz,a	%g5,	loop_96
	addcc	%o7,	0x05F5,	%o1
	srl	%i3,	%i7,	%i2
loop_95:
	movre	%g4,	%o5,	%l2
loop_96:
	subc	%l5,	%o6,	%o4
	tneg	%xcc,	0x5
	membar	0x1C
	fnands	%f14,	%f29,	%f8
	srl	%g6,	0x12,	%g2
	brlez,a	%l0,	loop_97
	edge16n	%o0,	%g7,	%l6
	bvs,pn	%xcc,	loop_98
	membar	0x24
loop_97:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f12,	%f18
loop_98:
	ldsw	[%l7 + 0x6C],	%l1
	fmovrdgz	%l3,	%f2,	%f18
	fandnot1s	%f30,	%f29,	%f17
	fmovse	%icc,	%f7,	%f18
	fmovsvs	%icc,	%f27,	%f14
	xor	%i0,	0x1E9F,	%i5
	movre	%i1,	0x3D8,	%o3
	brnz	%l4,	loop_99
	orcc	%o2,	%g1,	%i6
	subc	%i4,	%g5,	%g3
	fmovrslez	%o1,	%f29,	%f23
loop_99:
	bne,pt	%icc,	loop_100
	fblg,a	%fcc0,	loop_101
	addcc	%i3,	0x12B9,	%o7
	popc	%i2,	%g4
loop_100:
	fnot1	%f28,	%f14
loop_101:
	nop
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf0
	membar	#Sync
	movn	%xcc,	%i7,	%l2
	edge8ln	%o5,	%o6,	%o4
	move	%xcc,	%l5,	%g6
	fmovsg	%xcc,	%f20,	%f12
	ble,a,pt	%icc,	loop_102
	fbuge,a	%fcc1,	loop_103
	fpadd32s	%f22,	%f20,	%f23
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f0
	fxtod	%f0,	%f18
loop_102:
	sdivcc	%g2,	0x14C4,	%l0
loop_103:
	subccc	%o0,	%g7,	%l6
	sra	%l1,	%l3,	%i0
	sir	0x0484
	movcc	%xcc,	%i1,	%o3
	movl	%xcc,	%l4,	%i5
	movrlez	%o2,	0x1A2,	%i6
	orcc	%g1,	0x010F,	%i4
	edge8	%g5,	%g3,	%i3
	fmovsne	%xcc,	%f8,	%f26
	or	%o1,	0x0BD9,	%i2
	fzero	%f6
	mulscc	%o7,	0x1483,	%g4
	bcs,a	%icc,	loop_104
	fmovsge	%icc,	%f25,	%f31
	fmovd	%f4,	%f28
	fmovdpos	%xcc,	%f22,	%f19
loop_104:
	nop
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x78] %asi,	%l2
	or	%o5,	%i7,	%o6
	fmovdleu	%xcc,	%f21,	%f24
	fmovdge	%xcc,	%f6,	%f4
	move	%xcc,	%l5,	%g6
	fnand	%f6,	%f20,	%f2
	bneg	loop_105
	fmul8sux16	%f0,	%f20,	%f12
	ldd	[%l7 + 0x78],	%f24
	movl	%icc,	%g2,	%o4
loop_105:
	stbar
	edge16ln	%l0,	%o0,	%l6
	fmovsvs	%xcc,	%f28,	%f9
	fnegs	%f19,	%f10
	fmovsle	%xcc,	%f12,	%f10
	sethi	0x09B1,	%g7
	bvs	%icc,	loop_106
	xorcc	%l3,	0x130B,	%i0
	fmovdcs	%icc,	%f2,	%f14
	movrlez	%i1,	%o3,	%l4
loop_106:
	fnands	%f25,	%f13,	%f4
	movre	%i5,	0x158,	%o2
	fmovdge	%xcc,	%f11,	%f4
	tvs	%icc,	0x2
	brz,a	%i6,	loop_107
	fmovdn	%xcc,	%f2,	%f10
	sra	%g1,	0x0E,	%l1
	movleu	%icc,	%i4,	%g3
loop_107:
	tn	%xcc,	0x4
	fmovdn	%icc,	%f17,	%f24
	movpos	%xcc,	%i3,	%g5
	alignaddrl	%o1,	%o7,	%i2
	array8	%l2,	%g4,	%i7
	nop
	setx	loop_108,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movleu	%xcc,	%o5,	%l5
	andcc	%g6,	%o6,	%o4
	stx	%l0,	[%l7 + 0x08]
loop_108:
	movvs	%icc,	%o0,	%l6
	fsrc1s	%f11,	%f8
	movrlez	%g2,	%g7,	%l3
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x29] %asi,	%i1
	nop
	set	0x18, %g1
	ldsh	[%l7 + %g1],	%o3
	stbar
	tgu	%icc,	0x7
	sdiv	%i0,	0x0487,	%l4
	tneg	%xcc,	0x2
	fbne	%fcc1,	loop_109
	tn	%xcc,	0x0
	andcc	%o2,	%i6,	%g1
	edge16n	%l1,	%i5,	%g3
loop_109:
	sdivx	%i3,	0x16A5,	%g5
	tle	%xcc,	0x4
	sub	%o1,	%o7,	%i4
	fmovsl	%icc,	%f14,	%f18
	tsubcctv	%l2,	%g4,	%i2
	mulx	%i7,	0x1C02,	%o5
	nop
	setx	loop_110,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpadd16	%f10,	%f18,	%f8
	edge16	%l5,	%g6,	%o4
	tl	%xcc,	0x4
loop_110:
	bcs	loop_111
	brgez	%l0,	loop_112
	sll	%o6,	%o0,	%g2
	sth	%g7,	[%l7 + 0x20]
loop_111:
	swap	[%l7 + 0x58],	%l6
loop_112:
	edge32n	%l3,	%o3,	%i0
	fbge	%fcc0,	loop_113
	for	%f22,	%f6,	%f0
	sdivcc	%i1,	0x1AF7,	%o2
	te	%xcc,	0x4
loop_113:
	movn	%icc,	%i6,	%g1
	brlez	%l4,	loop_114
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f0
	std	%f14,	[%l7 + 0x58]
loop_114:
	bshuffle	%f12,	%f22,	%f4
	fmovdn	%icc,	%f24,	%f16
	tg	%icc,	0x0
	sllx	%l1,	0x0C,	%i5
	brgz	%g3,	loop_115
	tne	%xcc,	0x6
	sub	%i3,	%o1,	%g5
	stbar
loop_115:
	movne	%icc,	%o7,	%l2
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x44] %asi,	%g4
	xor	%i2,	%i4,	%i7
	orcc	%l5,	%g6,	%o5
	nop
	setx	0x23E5045A806878C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	nop
	setx	0x49E8CA91805650BF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fnegs	%f6,	%f26
	edge8l	%l0,	%o4,	%o6
	fmovscc	%icc,	%f3,	%f1
	andcc	%o0,	%g7,	%l6
	fcmpgt32	%f14,	%f24,	%l3
	brlez	%g2,	loop_116
	bneg,a	loop_117
	nop
	setx	0xB9E41B02448DE9F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f10
	xnor	%o3,	0x1E77,	%i0
loop_116:
	movn	%icc,	%o2,	%i6
loop_117:
	movne	%icc,	%g1,	%l4
	nop
	set	0x2E, %i4
	lduh	[%l7 + %i4],	%l1
	edge16n	%i1,	%g3,	%i3
	fble	%fcc0,	loop_118
	tn	%icc,	0x2
	umulcc	%i5,	0x0F15,	%g5
	fmovsleu	%icc,	%f22,	%f21
loop_118:
	smulcc	%o1,	0x1BC3,	%l2
	edge8l	%g4,	%o7,	%i4
	tpos	%icc,	0x3
	andn	%i7,	0x0E77,	%i2
	umul	%l5,	0x0ACF,	%o5
	andcc	%g6,	0x0176,	%o4
	edge8n	%l0,	%o0,	%g7
	movrlz	%o6,	%l3,	%g2
	fbg,a	%fcc2,	loop_119
	fmovdle	%icc,	%f29,	%f29
	udivx	%o3,	0x036B,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_119:
	andcc	%o2,	%l6,	%g1
	movvc	%xcc,	%l4,	%i6
	tsubcctv	%i1,	0x085B,	%g3
	edge16l	%l1,	%i3,	%i5
	subcc	%o1,	0x1CC2,	%l2
	sdivx	%g5,	0x0059,	%o7
	edge16ln	%i4,	%i7,	%i2
	movge	%icc,	%l5,	%g4
	bvc	%icc,	loop_120
	brlez,a	%o5,	loop_121
	tl	%xcc,	0x4
	tsubcctv	%o4,	%g6,	%l0
loop_120:
	bn,a,pt	%icc,	loop_122
loop_121:
	tsubcc	%o0,	0x1747,	%g7
	ldstub	[%l7 + 0x51],	%l3
	movneg	%icc,	%o6,	%g2
loop_122:
	udiv	%i0,	0x138C,	%o3
	sllx	%l6,	%o2,	%l4
	ta	%xcc,	0x3
	bg	%icc,	loop_123
	nop
	fitos	%f12,	%f7
	fstod	%f7,	%f0
	bgu	%xcc,	loop_124
	sdiv	%i6,	0x1935,	%i1
loop_123:
	xorcc	%g1,	0x0C13,	%l1
	fexpand	%f1,	%f2
loop_124:
	sll	%g3,	0x0A,	%i5
	fpadd16s	%f19,	%f17,	%f8
	call	loop_125
	lduh	[%l7 + 0x78],	%i3
	array32	%o1,	%g5,	%o7
	tle	%xcc,	0x4
loop_125:
	brgez,a	%i4,	loop_126
	orncc	%l2,	%i7,	%i2
	umulcc	%g4,	%l5,	%o4
	fbg,a	%fcc1,	loop_127
loop_126:
	smul	%g6,	0x13B7,	%o5
	movg	%xcc,	%o0,	%l0
	fands	%f13,	%f17,	%f24
loop_127:
	fbu,a	%fcc1,	loop_128
	tcc	%xcc,	0x7
	sub	%g7,	0x1CEC,	%l3
	alignaddrl	%o6,	%i0,	%g2
loop_128:
	bgu,pn	%xcc,	loop_129
	tn	%xcc,	0x2
	fbge	%fcc1,	loop_130
	tvs	%xcc,	0x5
loop_129:
	movrne	%o3,	%l6,	%l4
	wr	%g0,	0xea,	%asi
	stxa	%i6,	[%l7 + 0x48] %asi
	membar	#Sync
loop_130:
	nop
	fitod	%f12,	%f22
	fdtos	%f22,	%f9
	tvc	%xcc,	0x1
	mova	%icc,	%o2,	%i1
	fmovsleu	%icc,	%f22,	%f10
	umulcc	%l1,	0x0B44,	%g1
	st	%f13,	[%l7 + 0x7C]
	edge16ln	%i5,	%g3,	%o1
	sdivx	%i3,	0x1EBD,	%o7
	tpos	%icc,	0x4
	set	0x108, %o2
	ldxa	[%g0 + %o2] 0x21,	%g5
	nop
	setx loop_131, %l0, %l1
	jmpl %l1, %i4
	fandnot1s	%f25,	%f17,	%f4
	addccc	%l2,	0x0291,	%i7
	tsubcctv	%i2,	0x0C8E,	%l5
loop_131:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f11,	[%l7 + 0x24] %asi
	array32	%g4,	%o4,	%g6
	srl	%o0,	%o5,	%l0
	set	0x10, %g3
	ldxa	[%l7 + %g3] 0x04,	%g7
	fmovsneg	%xcc,	%f9,	%f23
	xor	%l3,	%i0,	%o6
	movrlz	%o3,	%l6,	%g2
	fmovdleu	%xcc,	%f14,	%f19
	tcc	%icc,	0x6
	bvc	%xcc,	loop_132
	lduh	[%l7 + 0x16],	%l4
	tn	%xcc,	0x6
	edge32l	%o2,	%i1,	%i6
loop_132:
	for	%f4,	%f4,	%f12
	ldstub	[%l7 + 0x4C],	%l1
	srl	%g1,	0x1B,	%g3
	xnor	%i5,	%i3,	%o7
	nop
	set	0x30, %i0
	ldsh	[%l7 + %i0],	%o1
	movg	%icc,	%i4,	%l2
	fpadd32	%f6,	%f20,	%f30
	edge16l	%i7,	%i2,	%g5
	tn	%xcc,	0x3
	fbge	%fcc2,	loop_133
	movg	%xcc,	%l5,	%o4
	fmovdcc	%icc,	%f19,	%f23
	edge8ln	%g6,	%g4,	%o5
loop_133:
	edge16ln	%o0,	%g7,	%l3
	fnors	%f13,	%f9,	%f15
	fmul8x16au	%f19,	%f1,	%f6
	addc	%i0,	0x0DE9,	%o6
	movcc	%xcc,	%l0,	%l6
	fmovsge	%icc,	%f7,	%f15
	wr	%g0,	0x22,	%asi
	stha	%g2,	[%l7 + 0x6C] %asi
	membar	#Sync
	lduh	[%l7 + 0x4A],	%o3
	fornot2	%f30,	%f4,	%f28
	edge8	%l4,	%o2,	%i6
	move	%xcc,	%i1,	%g1
	flush	%l7 + 0x48
	sdivcc	%g3,	0x04D5,	%l1
	subcc	%i5,	%i3,	%o1
	movrgz	%i4,	0x1F1,	%l2
	fmovsvs	%xcc,	%f12,	%f28
	movpos	%xcc,	%o7,	%i2
	membar	0x7A
	fmovdg	%icc,	%f5,	%f10
	edge8n	%g5,	%l5,	%o4
	movpos	%icc,	%g6,	%g4
	andcc	%o5,	0x1510,	%i7
	smulcc	%g7,	%o0,	%i0
	fpsub16	%f0,	%f2,	%f26
	tle	%icc,	0x4
	movn	%icc,	%o6,	%l3
	movle	%icc,	%l6,	%g2
	movpos	%icc,	%o3,	%l0
	fones	%f9
	tsubcc	%o2,	%i6,	%l4
	edge16ln	%i1,	%g3,	%l1
	movleu	%xcc,	%g1,	%i3
	fsrc2	%f18,	%f2
	subcc	%i5,	0x0A88,	%o1
	fbue	%fcc3,	loop_134
	nop
	setx	loop_135,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrne	%l2,	%o7,	%i2
	movrgz	%g5,	0x02C,	%i4
loop_134:
	movgu	%xcc,	%o4,	%g6
loop_135:
	tpos	%xcc,	0x7
	te	%icc,	0x7
	srl	%l5,	%g4,	%i7
	xnor	%o5,	0x1677,	%g7
	fbn	%fcc3,	loop_136
	edge16n	%o0,	%o6,	%i0
	andncc	%l6,	%l3,	%g2
	edge32ln	%o3,	%l0,	%o2
loop_136:
	fbne	%fcc3,	loop_137
	movn	%icc,	%l4,	%i6
	edge32ln	%i1,	%l1,	%g3
	subccc	%g1,	0x0109,	%i3
loop_137:
	fmovrsne	%i5,	%f31,	%f8
	wr	%g0,	0xea,	%asi
	stxa	%l2,	[%l7 + 0x10] %asi
	membar	#Sync
	tn	%icc,	0x1
	bgu	loop_138
	movneg	%icc,	%o1,	%o7
	set	0x24, %l3
	lduwa	[%l7 + %l3] 0x19,	%i2
loop_138:
	ld	[%l7 + 0x70],	%f0
	tcs	%xcc,	0x3
	nop
	setx	0x8981CAA4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f19
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x1D] %asi,	%g5
	te	%xcc,	0x4
	movvc	%icc,	%o4,	%g6
	alignaddrl	%l5,	%i4,	%g4
	nop
	setx	0x6AFF4C044161691A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x26F5287269ABEAE4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f8,	%f16
	tleu	%xcc,	0x1
	tge	%xcc,	0x5
	tge	%icc,	0x5
	tsubcc	%o5,	%g7,	%o0
	fpack16	%f20,	%f2
	call	loop_139
	movvc	%icc,	%i7,	%o6
	fpsub32s	%f6,	%f29,	%f5
	membar	0x55
loop_139:
	ta	%xcc,	0x5
	lduh	[%l7 + 0x32],	%l6
	fpack16	%f16,	%f2
	andn	%i0,	%g2,	%l3
	fbne	%fcc3,	loop_140
	movcs	%icc,	%l0,	%o3
	be,pn	%xcc,	loop_141
	tleu	%xcc,	0x2
loop_140:
	smulcc	%l4,	%i6,	%o2
	fzero	%f10
loop_141:
	fmovrslez	%l1,	%f9,	%f19
	movrne	%i1,	%g3,	%i3
	edge32l	%i5,	%g1,	%o1
	tsubcc	%l2,	%i2,	%g5
	andncc	%o4,	%o7,	%l5
	ldsw	[%l7 + 0x64],	%g6
	fblg,a	%fcc1,	loop_142
	edge8n	%g4,	%i4,	%o5
	std	%f8,	[%l7 + 0x48]
	set	0x7C, %o4
	ldswa	[%l7 + %o4] 0x88,	%g7
loop_142:
	movleu	%icc,	%i7,	%o0
	orcc	%o6,	%i0,	%l6
	nop
	setx	0x18BD6EE4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x12514397,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f9,	%f14
	fblg,a	%fcc0,	loop_143
	call	loop_144
	movneg	%icc,	%l3,	%l0
	add	%l7,	0x34,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%l4
loop_143:
	movcs	%icc,	%i6,	%o2
loop_144:
	fors	%f1,	%f6,	%f23
	edge16	%o3,	%l1,	%g3
	fmovdleu	%icc,	%f12,	%f11
	subc	%i1,	%i3,	%i5
	srl	%g1,	0x13,	%l2
	move	%icc,	%i2,	%g5
	movle	%xcc,	%o1,	%o4
	nop
	fitos	%f5,	%f1
	fstod	%f1,	%f10
	fandnot2	%f8,	%f6,	%f30
	wr	%g0,	0x22,	%asi
	stba	%l5,	[%l7 + 0x52] %asi
	membar	#Sync
	membar	0x62
	tl	%icc,	0x5
	set	0x3b0, %g7
	nop 	! 	stxa	%o7,	[%g0 + %g7] 0x40 ripped by fixASI40.pl
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%g4,	%i4
	mova	%xcc,	%g6,	%o5
	stbar
	fsrc2s	%f0,	%f3
	fcmpne32	%f18,	%f24,	%g7
	mulx	%o0,	0x1D05,	%o6
	fandnot2	%f16,	%f2,	%f14
	brz,a	%i7,	loop_145
	array8	%i0,	%l6,	%l3
	mulscc	%l0,	0x0E9B,	%g2
	bleu,pt	%xcc,	loop_146
loop_145:
	movrne	%i6,	0x1C6,	%o2
	fmovdne	%icc,	%f17,	%f24
	fmovsneg	%xcc,	%f25,	%f23
loop_146:
	subc	%l4,	0x1CAD,	%o3
	fxors	%f21,	%f18,	%f29
	tvs	%icc,	0x5
	addcc	%l1,	%g3,	%i1
	tge	%xcc,	0x4
	movge	%xcc,	%i5,	%g1
	tge	%xcc,	0x5
	srax	%l2,	%i2,	%g5
	flush	%l7 + 0x08
	orncc	%i3,	%o1,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l5,	0x11E3,	%g4
	andn	%i4,	0x1077,	%o7
	ldstub	[%l7 + 0x28],	%g6
	mulx	%o5,	%o0,	%g7
	umulcc	%i7,	0x148A,	%o6
	sdivcc	%l6,	0x1068,	%i0
	ta	%xcc,	0x1
	edge8	%l3,	%g2,	%i6
	subc	%l0,	0x0453,	%o2
	fmovrde	%l4,	%f22,	%f6
	movl	%icc,	%l1,	%o3
	mulx	%g3,	%i1,	%g1
	sdiv	%i5,	0x16FF,	%l2
	tl	%xcc,	0x6
	nop
	set	0x20, %l5
	std	%f18,	[%l7 + %l5]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%i3
	brgez,a	%g5,	loop_147
	sra	%o4,	%o1,	%l5
	fmovdleu	%icc,	%f27,	%f0
	fmovrde	%g4,	%f12,	%f30
loop_147:
	sir	0x0A1D
	ldstub	[%l7 + 0x34],	%i4
	andcc	%o7,	%o5,	%o0
	fpsub16	%f12,	%f4,	%f20
	and	%g6,	%i7,	%g7
	movre	%o6,	%l6,	%i0
	tpos	%xcc,	0x3
	fandnot2	%f16,	%f12,	%f24
	fnot1s	%f30,	%f25
	fmul8ulx16	%f26,	%f28,	%f0
	bneg,a	%icc,	loop_148
	alignaddr	%l3,	%g2,	%i6
	fands	%f18,	%f27,	%f20
	movl	%icc,	%o2,	%l4
loop_148:
	fmovsge	%icc,	%f13,	%f24
	fbule	%fcc2,	loop_149
	fmuld8sux16	%f13,	%f8,	%f22
	taddcctv	%l1,	%o3,	%g3
	nop
	setx	0xA3048D83898ACAF7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x681D962C8EEA24B1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f22,	%f16
loop_149:
	subc	%l0,	0x1D4B,	%g1
	movcc	%xcc,	%i5,	%l2
	stbar
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x3C] %asi,	%i2
	edge32l	%i3,	%i1,	%g5
	and	%o1,	%l5,	%o4
	and	%g4,	%o7,	%o5
	movvs	%xcc,	%o0,	%i4
	nop
	fitos	%f6,	%f20
	fstoi	%f20,	%f11
	udivcc	%g6,	0x1D4A,	%i7
	st	%f5,	[%l7 + 0x24]
	nop
	setx loop_150, %l0, %l1
	jmpl %l1, %g7
	mulx	%l6,	0x1CFB,	%i0
	sra	%l3,	0x0D,	%g2
	nop
	setx	0xA5E6BDB4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xAFC0DACF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f22,	%f8
loop_150:
	subc	%o6,	%o2,	%i6
	tgu	%icc,	0x7
	movre	%l4,	%o3,	%g3
	fsrc1s	%f2,	%f12
	andncc	%l1,	%g1,	%i5
	xnor	%l0,	0x082D,	%i2
	nop
	setx	loop_151,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array32	%l2,	%i3,	%i1
	array32	%g5,	%l5,	%o4
	be,a,pt	%xcc,	loop_152
loop_151:
	nop
	set	0x15, %o0
	ldstub	[%l7 + %o0],	%g4
	fblg,a	%fcc1,	loop_153
	xor	%o1,	%o5,	%o0
loop_152:
	tcc	%icc,	0x5
	xnor	%i4,	%o7,	%g6
loop_153:
	subccc	%g7,	0x0EAF,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i7,	0x0D4,	%i0
	addc	%l3,	0x1CB9,	%g2
	sdiv	%o2,	0x0E20,	%o6
	sra	%l4,	%o3,	%i6
	fnegd	%f20,	%f6
	movrgz	%g3,	0x074,	%l1
	fmovdcs	%icc,	%f22,	%f27
	sir	0x074F
	taddcctv	%g1,	0x1400,	%l0
	bshuffle	%f12,	%f8,	%f30
	fbue	%fcc3,	loop_154
	umul	%i2,	0x1C1E,	%i5
	udiv	%l2,	0x1848,	%i3
	alignaddrl	%i1,	%l5,	%o4
loop_154:
	ldsb	[%l7 + 0x37],	%g4
	sdiv	%o1,	0x1A07,	%o5
	fpadd32	%f26,	%f10,	%f18
	brnz,a	%o0,	loop_155
	tl	%icc,	0x4
	be,pn	%icc,	loop_156
	sir	0x0082
loop_155:
	srax	%i4,	%g5,	%g6
	addc	%g7,	%l6,	%o7
loop_156:
	movre	%i7,	0x1E1,	%i0
	fmovsn	%xcc,	%f0,	%f10
	nop
	set	0x68, %l0
	stw	%g2,	[%l7 + %l0]
	fpsub32	%f0,	%f8,	%f22
	sdivcc	%l3,	0x03A0,	%o6
	fmovrse	%l4,	%f1,	%f22
	movrgez	%o2,	%o3,	%i6
	bn,pn	%icc,	loop_157
	for	%f26,	%f6,	%f12
	udivx	%g3,	0x1C02,	%g1
	movge	%icc,	%l1,	%i2
loop_157:
	fmovdneg	%icc,	%f15,	%f15
	movgu	%icc,	%i5,	%l2
	tcc	%icc,	0x4
	bleu,a	loop_158
	tn	%icc,	0x1
	tvc	%xcc,	0x5
	array8	%l0,	%i3,	%i1
loop_158:
	nop
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x18,	%f0
	sdiv	%o4,	0x1CA7,	%l5
	fmovdvs	%icc,	%f7,	%f16
	fandnot2s	%f6,	%f24,	%f8
	edge8	%o1,	%g4,	%o0
	andcc	%o5,	0x1720,	%g5
	tne	%xcc,	0x6
	bvs,a	loop_159
	fpadd16s	%f7,	%f9,	%f4
	set	0x60, %o5
	ldda	[%l7 + %o5] 0x14,	%i4
loop_159:
	edge16n	%g7,	%g6,	%l6
	addcc	%i7,	0x05F8,	%o7
	fbl,a	%fcc1,	loop_160
	ldx	[%l7 + 0x58],	%g2
	and	%l3,	0x042E,	%o6
	bgu,a,pn	%icc,	loop_161
loop_160:
	edge16l	%i0,	%l4,	%o2
	addcc	%o3,	%i6,	%g3
	andncc	%l1,	%i2,	%g1
loop_161:
	mova	%icc,	%l2,	%i5
	taddcc	%i3,	0x06DD,	%i1
	membar	0x5C
	membar	0x38
	movle	%xcc,	%l0,	%l5
	edge16ln	%o1,	%g4,	%o0
	movleu	%icc,	%o5,	%o4
	movgu	%xcc,	%i4,	%g5
	xorcc	%g6,	%g7,	%l6
	edge32	%i7,	%o7,	%g2
	brnz,a	%l3,	loop_162
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a,pn	%icc,	loop_163
	fmovdgu	%icc,	%f25,	%f12
loop_162:
	edge16l	%o6,	%i0,	%l4
	sir	0x1D08
loop_163:
	movl	%icc,	%o2,	%i6
	brgez,a	%g3,	loop_164
	smul	%l1,	0x1157,	%o3
	st	%f7,	[%l7 + 0x3C]
	std	%f30,	[%l7 + 0x50]
loop_164:
	xor	%g1,	%i2,	%i5
	movrne	%l2,	0x388,	%i1
	brlz,a	%i3,	loop_165
	fbe	%fcc3,	loop_166
	addcc	%l5,	0x0DDE,	%o1
	bne	loop_167
loop_165:
	addccc	%g4,	%o0,	%l0
loop_166:
	bneg,pn	%xcc,	loop_168
	movge	%xcc,	%o5,	%i4
loop_167:
	edge16	%g5,	%o4,	%g7
	ldsw	[%l7 + 0x28],	%g6
loop_168:
	fmovdneg	%icc,	%f17,	%f2
	tneg	%icc,	0x4
	fmovdcc	%icc,	%f20,	%f13
	tn	%xcc,	0x6
	fbo,a	%fcc1,	loop_169
	tle	%xcc,	0x1
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%i7
loop_169:
	prefetch	[%l7 + 0x68],	 0x0
	edge32ln	%o7,	%l6,	%l3
	brnz	%o6,	loop_170
	fone	%f4
	nop
	setx	loop_171,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbue,a	%fcc1,	loop_172
loop_170:
	tvs	%icc,	0x3
	udivx	%g2,	0x1452,	%i0
loop_171:
	fornot1s	%f25,	%f11,	%f15
loop_172:
	movcc	%icc,	%l4,	%o2
	tn	%xcc,	0x7
	edge8n	%g3,	%i6,	%o3
	sllx	%l1,	0x04,	%g1
	move	%xcc,	%i2,	%l2
	udivcc	%i1,	0x120B,	%i5
	fbuge	%fcc3,	loop_173
	stb	%l5,	[%l7 + 0x5B]
	fandnot2s	%f7,	%f24,	%f10
	movgu	%xcc,	%i3,	%o1
loop_173:
	movvs	%xcc,	%g4,	%o0
	or	%o5,	%l0,	%g5
	fbul,a	%fcc2,	loop_174
	addccc	%o4,	%i4,	%g7
	smul	%g6,	%i7,	%o7
	fnands	%f18,	%f17,	%f7
loop_174:
	tge	%icc,	0x2
	edge8ln	%l6,	%o6,	%l3
	fmul8ulx16	%f2,	%f18,	%f20
	edge32n	%i0,	%g2,	%o2
	ldd	[%l7 + 0x48],	%f2
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%g3
	edge8ln	%i6,	%o3,	%l4
	movle	%xcc,	%g1,	%l1
	andncc	%i2,	%i1,	%i5
	movleu	%icc,	%l2,	%l5
	fors	%f6,	%f15,	%f10
	movrlz	%i3,	%g4,	%o1
	tsubcctv	%o0,	%l0,	%o5
	edge8l	%o4,	%g5,	%i4
	movvc	%icc,	%g6,	%i7
	srax	%o7,	0x15,	%l6
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	stbar
	set	0x60, %l4
	lduwa	[%l7 + %l4] 0x04,	%o6
	fmul8sux16	%f8,	%f12,	%f14
	xor	%g7,	0x15E4,	%i0
	orncc	%g2,	%l3,	%g3
	tsubcctv	%i6,	%o3,	%l4
	nop
	setx	0x93704BEB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x4753E8CA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f25,	%f6
	bcc	loop_175
	movneg	%icc,	%g1,	%o2
	edge16ln	%l1,	%i2,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_175:
	addcc	%i5,	%l2,	%l5
	tsubcc	%i3,	%o1,	%g4
	mulscc	%l0,	%o0,	%o4
	fbul,a	%fcc1,	loop_176
	bshuffle	%f12,	%f30,	%f14
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x3C] %asi,	%g5
loop_176:
	fmovsa	%icc,	%f4,	%f22
	movrgez	%o5,	%g6,	%i4
	udivx	%o7,	0x0D18,	%i7
	stw	%l6,	[%l7 + 0x30]
	fba	%fcc1,	loop_177
	fpack32	%f28,	%f8,	%f10
	fnands	%f23,	%f28,	%f10
	xnorcc	%o6,	%i0,	%g7
loop_177:
	srlx	%l3,	%g2,	%g3
	fbg,a	%fcc1,	loop_178
	tvs	%xcc,	0x5
	ld	[%l7 + 0x74],	%f8
	fmovdcc	%icc,	%f31,	%f27
loop_178:
	fbl	%fcc1,	loop_179
	taddcc	%i6,	0x12F1,	%o3
	sllx	%g1,	%l4,	%l1
	movcs	%xcc,	%o2,	%i1
loop_179:
	tvs	%icc,	0x1
	xnor	%i5,	0x086F,	%i2
	movg	%icc,	%l2,	%l5
	sdivx	%i3,	0x1957,	%g4
	addccc	%l0,	%o0,	%o4
	sub	%g5,	0x1D0A,	%o1
	tle	%xcc,	0x4
	nop
	setx	0x789A84C219CAACE4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x0689D17A289C9245,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f12,	%f0
	fpack16	%f2,	%f0
	andncc	%g6,	%o5,	%i4
	tn	%icc,	0x5
	movcc	%xcc,	%o7,	%i7
	movvs	%icc,	%l6,	%i0
	bneg,a	loop_180
	movrlz	%g7,	%l3,	%g2
	ble,pt	%icc,	loop_181
	srax	%o6,	0x12,	%i6
loop_180:
	nop
	set	0x38, %i5
	swapa	[%l7 + %i5] 0x10,	%o3
loop_181:
	umul	%g3,	0x0721,	%l4
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x0C] %asi,	%l1
	sllx	%o2,	0x0D,	%g1
	tle	%xcc,	0x3
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x20] %asi,	%i4
	set	0x42, %g2
	stha	%i1,	[%l7 + %g2] 0x2f
	membar	#Sync
	fones	%f26
	nop
	setx	0xEF9C37810A0428CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x72424B1FEDDA6935,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f22,	%f28
	ba,a	%xcc,	loop_182
	edge32l	%l2,	%i2,	%i3
	movpos	%xcc,	%g4,	%l5
	fmovdgu	%xcc,	%f8,	%f17
loop_182:
	nop
	set	0x30, %o1
	std	%f28,	[%l7 + %o1]
	xnor	%o0,	0x1C58,	%l0
	movn	%icc,	%g5,	%o4
	addccc	%g6,	%o1,	%i4
	edge16	%o7,	%o5,	%l6
	tvc	%icc,	0x5
	addcc	%i0,	0x0F3A,	%g7
	udiv	%l3,	0x074B,	%i7
	fand	%f24,	%f10,	%f18
	orcc	%g2,	%i6,	%o6
	or	%o3,	0x07F8,	%l4
	tgu	%icc,	0x4
	nop
	set	0x40, %o3
	ldx	[%l7 + %o3],	%g3
	fpack32	%f6,	%f12,	%f28
	sra	%o2,	0x19,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i5,	%g1,	%i1
	sra	%l2,	%i3,	%i2
	movl	%xcc,	%l5,	%g4
	sra	%o0,	0x0E,	%g5
	movg	%icc,	%l0,	%g6
	nop
	set	0x70, %g5
	stx	%o4,	[%l7 + %g5]
	edge8n	%i4,	%o1,	%o5
	bleu,pn	%xcc,	loop_183
	umulcc	%o7,	0x1EB1,	%i0
	fmovrdne	%l6,	%f10,	%f12
	tne	%icc,	0x7
loop_183:
	stbar
	fmovrdgez	%g7,	%f20,	%f20
	tleu	%icc,	0x6
	sdiv	%i7,	0x0A88,	%g2
	fbg,a	%fcc2,	loop_184
	nop
	fitod	%f8,	%f24
	fdtox	%f24,	%f28
	fbge	%fcc0,	loop_185
	fnegd	%f28,	%f16
loop_184:
	bvs,a	loop_186
	fmovdpos	%icc,	%f15,	%f20
loop_185:
	nop
	setx	loop_187,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%icc,	0x0
loop_186:
	orcc	%i6,	0x192B,	%o6
	sethi	0x1A24,	%l3
loop_187:
	brgz	%o3,	loop_188
	movrlz	%l4,	%o2,	%l1
	fnot2s	%f17,	%f5
	edge16n	%g3,	%g1,	%i1
loop_188:
	subc	%i5,	0x1017,	%i3
	edge8ln	%i2,	%l5,	%l2
	fpadd32s	%f19,	%f5,	%f24
	edge8n	%g4,	%o0,	%l0
	fble	%fcc0,	loop_189
	taddcc	%g5,	0x01C6,	%g6
	movle	%icc,	%o4,	%i4
	movleu	%xcc,	%o1,	%o7
loop_189:
	te	%xcc,	0x0
	orcc	%i0,	%l6,	%g7
	movn	%icc,	%o5,	%i7
	nop
	fitos	%f11,	%f7
	wr	%g0,	0x80,	%asi
	stba	%i6,	[%l7 + 0x5C] %asi
	addccc	%o6,	0x1825,	%l3
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l4,	0x10,	%g2
	bl,pn	%xcc,	loop_190
	fmovd	%f22,	%f6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x88,	%o2,	%l1
loop_190:
	fbo,a	%fcc1,	loop_191
	sll	%g1,	0x13,	%g3
	sra	%i5,	0x10,	%i3
	ta	%xcc,	0x3
loop_191:
	alignaddr	%i2,	%i1,	%l5
	fpsub16	%f30,	%f22,	%f6
	nop
	setx	0xFF36469D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f20
	movvc	%xcc,	%g4,	%l2
	sra	%o0,	0x07,	%l0
	fmul8x16	%f15,	%f10,	%f0
	subcc	%g5,	0x1BF4,	%o4
	fmovdvc	%xcc,	%f11,	%f5
	srax	%i4,	0x19,	%g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%o7
	movge	%icc,	%i0,	%g7
	edge16ln	%l6,	%o5,	%i7
	set	0x5C, %o6
	stba	%o6,	[%l7 + %o6] 0x11
	set	0x2E, %i3
	ldsba	[%l7 + %i3] 0x04,	%i6
	movre	%l3,	0x329,	%l4
	xor	%o3,	0x1BA3,	%g2
	fmovrde	%l1,	%f8,	%f14
	sdivcc	%o2,	0x17D1,	%g3
	sdivcc	%g1,	0x189F,	%i3
	tneg	%xcc,	0x5
	tvs	%xcc,	0x2
	nop
	fitod	%f6,	%f30
	fdtoi	%f30,	%f5
	tgu	%xcc,	0x5
	nop
	setx	0xC26B03D62078B509,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	srlx	%i2,	%i1,	%l5
	movvc	%icc,	%i5,	%g4
	sll	%o0,	0x15,	%l2
	bpos,a,pn	%xcc,	loop_192
	bge	loop_193
	tsubcctv	%g5,	0x0071,	%o4
	tl	%xcc,	0x3
loop_192:
	srax	%l0,	0x11,	%g6
loop_193:
	bl	%xcc,	loop_194
	fmul8ulx16	%f2,	%f18,	%f4
	add	%o1,	%i4,	%i0
	set	0x7A, %l1
	ldstuba	[%l7 + %l1] 0x19,	%g7
loop_194:
	srax	%l6,	%o7,	%o5
	sdivcc	%i7,	0x0721,	%i6
	movn	%xcc,	%o6,	%l4
	nop
	fitod	%f7,	%f12
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x0c
	movcs	%xcc,	%l3,	%o3
	andn	%g2,	%o2,	%g3
	fba,a	%fcc1,	loop_195
	lduh	[%l7 + 0x16],	%g1
	nop
	setx	0x1E378811,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x2CFFC3AF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f21,	%f10
	tle	%icc,	0x1
loop_195:
	ld	[%l7 + 0x38],	%f4
	movcc	%icc,	%i3,	%i2
	fbule,a	%fcc1,	loop_196
	nop
	setx	0x0819933F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f2
	xor	%l1,	0x0B84,	%l5
	set	0x76, %i7
	ldsha	[%l7 + %i7] 0x81,	%i1
loop_196:
	subccc	%i5,	%o0,	%l2
	fmovdpos	%xcc,	%f4,	%f15
	tge	%xcc,	0x7
	fba	%fcc1,	loop_197
	fone	%f20
	tvc	%icc,	0x7
	movgu	%icc,	%g5,	%g4
loop_197:
	tleu	%xcc,	0x5
	movrgz	%l0,	0x13A,	%g6
	ld	[%l7 + 0x54],	%f30
	umulcc	%o4,	0x13B0,	%o1
	movn	%xcc,	%i0,	%i4
	movvs	%xcc,	%g7,	%l6
	edge16ln	%o5,	%i7,	%i6
	stbar
	or	%o6,	0x1C52,	%o7
	mulscc	%l4,	0x1220,	%o3
	sra	%g2,	0x01,	%o2
	mulscc	%g3,	%l3,	%g1
	nop
	setx	0xBB7B0AB699729811,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x4A73DB3080BE6293,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f20,	%f4
	movg	%xcc,	%i2,	%l1
	fmovdle	%xcc,	%f5,	%f9
	subcc	%i3,	%l5,	%i1
	movcs	%icc,	%i5,	%l2
	movgu	%xcc,	%g5,	%o0
	fmovsn	%xcc,	%f28,	%f10
	tvc	%icc,	0x5
	ldx	[%l7 + 0x28],	%l0
	tg	%icc,	0x3
	sir	0x117B
	alignaddr	%g6,	%g4,	%o4
	fblg,a	%fcc0,	loop_198
	fxor	%f30,	%f20,	%f24
	and	%i0,	0x1E27,	%o1
	fpack32	%f8,	%f24,	%f12
loop_198:
	movl	%icc,	%g7,	%l6
	array8	%i4,	%o5,	%i7
	movcc	%icc,	%i6,	%o7
	fmovdn	%xcc,	%f16,	%f11
	fxnors	%f16,	%f0,	%f21
	subc	%o6,	%o3,	%l4
	andcc	%o2,	0x0CA5,	%g3
	nop
	setx	0xA07C7F8E,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	edge8n	%g2,	%g1,	%i2
	edge32n	%l1,	%i3,	%l3
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%i1
	set	0x50, %g6
	ldsba	[%l7 + %g6] 0x14,	%i5
	nop
	setx	loop_199,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldstub	[%l7 + 0x57],	%l2
	xorcc	%g5,	0x0548,	%o0
	movcs	%icc,	%l0,	%l5
loop_199:
	movrne	%g4,	0x166,	%g6
	bcs,a,pn	%icc,	loop_200
	alignaddrl	%i0,	%o4,	%g7
	bneg,a	%xcc,	loop_201
	edge16	%o1,	%i4,	%o5
loop_200:
	bcc,a	%icc,	loop_202
	smulcc	%l6,	%i6,	%i7
loop_201:
	taddcc	%o6,	%o7,	%o3
	edge16	%o2,	%g3,	%g2
loop_202:
	brgz	%l4,	loop_203
	movcc	%icc,	%g1,	%i2
	fones	%f3
	fpsub32s	%f27,	%f30,	%f16
loop_203:
	brgz,a	%l1,	loop_204
	fsrc1s	%f14,	%f10
	ba	loop_205
	fandnot2	%f16,	%f6,	%f2
loop_204:
	move	%xcc,	%l3,	%i1
	srlx	%i3,	0x10,	%i5
loop_205:
	stb	%g5,	[%l7 + 0x44]
	ld	[%l7 + 0x10],	%f11
	fmovrdlez	%l2,	%f16,	%f12
	fbue	%fcc0,	loop_206
	ldstub	[%l7 + 0x15],	%o0
	movrne	%l5,	%l0,	%g4
	udivx	%g6,	0x0EDE,	%i0
loop_206:
	sllx	%o4,	0x16,	%g7
	fmuld8ulx16	%f16,	%f8,	%f8
	add	%o1,	%i4,	%l6
	edge32ln	%o5,	%i7,	%o6
	orcc	%i6,	0x1C5D,	%o3
	alignaddr	%o2,	%o7,	%g3
	xor	%g2,	%g1,	%i2
	movrlez	%l1,	%l4,	%i1
	andn	%l3,	0x1818,	%i5
	fbuge,a	%fcc1,	loop_207
	sdivcc	%g5,	0x1B74,	%l2
	edge32l	%o0,	%i3,	%l0
	fmovrsgz	%g4,	%f14,	%f2
loop_207:
	fcmpne32	%f14,	%f0,	%l5
	sdiv	%i0,	0x0E64,	%g6
	fbule,a	%fcc0,	loop_208
	sth	%g7,	[%l7 + 0x26]
	te	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%o4
loop_208:
	sll	%i4,	0x19,	%o1
	bneg	%icc,	loop_209
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f14,	%f4,	%l6
	bcs,a,pt	%icc,	loop_210
loop_209:
	membar	0x1C
	fcmpne32	%f18,	%f18,	%i7
	fcmpne32	%f26,	%f0,	%o5
loop_210:
	tleu	%xcc,	0x3
	nop
	fitos	%f13,	%f7
	fstoi	%f7,	%f4
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x38] %asi,	%o6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	brgz	%o3,	loop_211
	udiv	%i6,	0x0C39,	%o2
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
loop_211:
	fmuld8ulx16	%f10,	%f29,	%f16
	fpsub32	%f4,	%f14,	%f20
	tl	%icc,	0x2
	sdivcc	%g2,	0x1097,	%g3
	srl	%g1,	0x1E,	%l1
	xorcc	%i2,	0x06F6,	%l4
	srlx	%i1,	0x00,	%l3
	movrgez	%i5,	%g5,	%l2
	xnor	%o0,	%i3,	%l0
	xnorcc	%l5,	0x1DD8,	%i0
	set	0x3A, %i2
	lduha	[%l7 + %i2] 0x19,	%g4
	fmul8x16au	%f4,	%f14,	%f24
	movcc	%xcc,	%g6,	%g7
	movrgez	%o4,	0x255,	%o1
	alignaddrl	%i4,	%l6,	%o5
	sdivcc	%i7,	0x0245,	%o3
	movne	%icc,	%i6,	%o2
	edge32l	%o6,	%o7,	%g2
	tleu	%icc,	0x3
	umulcc	%g3,	%l1,	%i2
	sll	%g1,	%l4,	%i1
	nop
	setx	0x596E2F7651FCB217,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xC5A15F5C2126285E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f12,	%f18
	fbug,a	%fcc2,	loop_212
	taddcctv	%l3,	0x08F2,	%i5
	fmovdgu	%icc,	%f19,	%f11
	set	0x37, %i1
	ldsba	[%l7 + %i1] 0x04,	%l2
loop_212:
	tvc	%xcc,	0x0
	sethi	0x0628,	%g5
	nop
	fitos	%f11,	%f24
	fstoi	%f24,	%f23
	ba,pn	%icc,	loop_213
	add	%o0,	0x16F6,	%i3
	xorcc	%l0,	0x0EAE,	%l5
	srlx	%i0,	0x0E,	%g4
loop_213:
	or	%g7,	0x1378,	%g6
	tle	%icc,	0x0
	bvs	loop_214
	te	%xcc,	0x7
	fble,a	%fcc2,	loop_215
	tle	%icc,	0x5
loop_214:
	array16	%o1,	%i4,	%o4
	fbn,a	%fcc1,	loop_216
loop_215:
	movrgez	%o5,	0x315,	%l6
	movn	%xcc,	%i7,	%o3
	fmovrdgez	%i6,	%f20,	%f26
loop_216:
	taddcc	%o6,	%o2,	%g2
	fsrc2s	%f25,	%f9
	tg	%icc,	0x1
	mulx	%g3,	%l1,	%o7
	tpos	%xcc,	0x5
	tl	%xcc,	0x7
	orncc	%i2,	%l4,	%i1
	fmovdvc	%icc,	%f18,	%f9
	movrgz	%l3,	0x0C7,	%i5
	bpos,a	loop_217
	stx	%g1,	[%l7 + 0x58]
	fnot1	%f2,	%f24
	movrgez	%g5,	%o0,	%i3
loop_217:
	edge16l	%l2,	%l0,	%i0
	tn	%xcc,	0x0
	xnorcc	%l5,	%g7,	%g4
	move	%icc,	%g6,	%i4
	te	%xcc,	0x1
	umulcc	%o4,	%o1,	%l6
	umul	%i7,	%o3,	%i6
	umulcc	%o5,	0x1C93,	%o6
	bvc	loop_218
	fmovsneg	%icc,	%f6,	%f8
	popc	%g2,	%g3
	movle	%xcc,	%l1,	%o2
loop_218:
	xnor	%i2,	0x011E,	%o7
	orcc	%l4,	%l3,	%i5
	nop
	fitos	%f2,	%f1
	fmovdvs	%xcc,	%f25,	%f0
	fbu	%fcc0,	loop_219
	bleu,a	loop_220
	mova	%xcc,	%g1,	%g5
	movleu	%xcc,	%i1,	%o0
loop_219:
	fpadd32s	%f10,	%f30,	%f9
loop_220:
	fsrc2	%f28,	%f8
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf8
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x27,	%asi
	stwa	%l2,	[%l7 + 0x14] %asi
	membar	#Sync
	fnegs	%f28,	%f19
	fbge,a	%fcc3,	loop_221
	fpsub16	%f14,	%f12,	%f14
	movvs	%xcc,	%i3,	%l0
	fmovs	%f3,	%f3
loop_221:
	mulx	%l5,	%g7,	%i0
	fnor	%f20,	%f0,	%f18
	edge32ln	%g4,	%i4,	%g6
	tsubcc	%o4,	%l6,	%o1
	fmovdneg	%icc,	%f20,	%f8
	umul	%i7,	%o3,	%i6
	srlx	%o6,	%g2,	%o5
	fba	%fcc0,	loop_222
	orn	%g3,	%l1,	%o2
	andncc	%o7,	%l4,	%l3
	movgu	%xcc,	%i5,	%g1
loop_222:
	movneg	%icc,	%g5,	%i1
	alignaddrl	%i2,	%o0,	%i3
	tvc	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l2,	0x1922,	%l0
	tl	%icc,	0x6
	tgu	%xcc,	0x0
	tcc	%xcc,	0x7
	swap	[%l7 + 0x6C],	%l5
	sra	%g7,	%i0,	%i4
	movvs	%xcc,	%g4,	%o4
	tgu	%xcc,	0x1
	fbe,a	%fcc1,	loop_223
	srlx	%l6,	%g6,	%o1
	brlez,a	%i7,	loop_224
	tpos	%icc,	0x1
loop_223:
	tsubcc	%i6,	0x1437,	%o3
	edge8ln	%o6,	%o5,	%g2
loop_224:
	udivcc	%l1,	0x1FCD,	%g3
	fbn	%fcc3,	loop_225
	movpos	%icc,	%o2,	%o7
	fands	%f3,	%f11,	%f13
	set	0x5C, %g4
	swapa	[%l7 + %g4] 0x81,	%l4
loop_225:
	fones	%f2
	fmovsvc	%xcc,	%f27,	%f9
	sll	%l3,	0x08,	%g1
	movl	%icc,	%i5,	%g5
	orncc	%i1,	0x1F78,	%o0
	fbug	%fcc0,	loop_226
	edge32l	%i2,	%i3,	%l0
	edge8n	%l2,	%g7,	%i0
	tvs	%xcc,	0x6
loop_226:
	fornot1	%f14,	%f18,	%f22
	fsrc1	%f12,	%f6
	fbu,a	%fcc0,	loop_227
	ldub	[%l7 + 0x51],	%i4
	fmovdpos	%xcc,	%f29,	%f3
	array8	%l5,	%g4,	%o4
loop_227:
	movn	%icc,	%l6,	%o1
	fors	%f28,	%f28,	%f30
	fmovrsne	%g6,	%f23,	%f10
	edge8n	%i7,	%o3,	%i6
	udivx	%o5,	0x191B,	%g2
	addccc	%l1,	0x0A04,	%o6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x74] %asi,	%o2
	tcs	%icc,	0x4
	umul	%o7,	%g3,	%l4
	mulscc	%g1,	%l3,	%g5
	andcc	%i5,	0x0897,	%i1
	fmovdg	%icc,	%f30,	%f28
	fbug,a	%fcc0,	loop_228
	srl	%i2,	%i3,	%o0
	fmovse	%icc,	%f20,	%f12
	tleu	%icc,	0x1
loop_228:
	bcs	%xcc,	loop_229
	tle	%xcc,	0x7
	movge	%xcc,	%l0,	%l2
	fcmpne16	%f10,	%f8,	%i0
loop_229:
	mulx	%g7,	%l5,	%g4
	udivx	%o4,	0x1BD4,	%i4
	fcmpgt32	%f28,	%f12,	%l6
	fbe	%fcc1,	loop_230
	fba	%fcc0,	loop_231
	fcmple16	%f10,	%f22,	%g6
	xorcc	%o1,	%i7,	%o3
loop_230:
	fand	%f4,	%f24,	%f6
loop_231:
	array16	%i6,	%o5,	%g2
	edge8n	%o6,	%o2,	%o7
	udivx	%l1,	0x1EE2,	%l4
	fbug,a	%fcc0,	loop_232
	andncc	%g1,	%g3,	%l3
	fbn,a	%fcc3,	loop_233
	lduh	[%l7 + 0x3E],	%g5
loop_232:
	nop
	setx	0x4B976679,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xB32F2C5C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f19,	%f21
	fmovsneg	%xcc,	%f16,	%f28
loop_233:
	movne	%icc,	%i1,	%i5
	sdivx	%i3,	0x17C5,	%o0
	fxnors	%f10,	%f10,	%f20
	or	%l0,	%l2,	%i0
	brgez	%g7,	loop_234
	edge16n	%i2,	%g4,	%o4
	sir	0x1526
	flush	%l7 + 0x3C
loop_234:
	array16	%i4,	%l6,	%l5
	orn	%o1,	%g6,	%o3
	tg	%xcc,	0x6
	tvs	%xcc,	0x4
	srax	%i6,	0x19,	%i7
	smulcc	%o5,	0x08E8,	%o6
	movcc	%icc,	%g2,	%o2
	orcc	%o7,	0x0ED0,	%l1
	ba,a	loop_235
	movge	%icc,	%l4,	%g1
	tgu	%icc,	0x3
	srl	%l3,	0x19,	%g5
loop_235:
	nop
	set	0x60, %l2
	lduha	[%l7 + %l2] 0x0c,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%i1,	%i5
	xorcc	%o0,	0x19C6,	%i3
	edge32l	%l2,	%l0,	%g7
	sll	%i2,	0x04,	%g4
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x14] %asi,	%i0
	fmovsa	%xcc,	%f14,	%f26
	subcc	%o4,	0x05E1,	%l6
	fnot1	%f20,	%f2
	edge16n	%i4,	%o1,	%l5
	edge8l	%g6,	%o3,	%i7
	fmovde	%icc,	%f1,	%f5
	move	%xcc,	%o5,	%i6
	set	0x5C, %i4
	sta	%f0,	[%l7 + %i4] 0x10
	sra	%o6,	%o2,	%o7
	srlx	%l1,	0x0B,	%l4
	taddcctv	%g1,	0x145B,	%l3
	xnorcc	%g5,	%g3,	%g2
	srlx	%i1,	0x05,	%i5
	fmovsa	%icc,	%f25,	%f1
	fcmple16	%f4,	%f8,	%o0
	movrne	%l2,	0x2BC,	%i3
	udivcc	%l0,	0x00A4,	%g7
	srax	%g4,	%i0,	%i2
	movrne	%l6,	%i4,	%o4
	fbug,a	%fcc1,	loop_236
	addccc	%o1,	0x0DF7,	%g6
	edge16l	%l5,	%o3,	%o5
	popc	0x05A7,	%i6
loop_236:
	movle	%icc,	%o6,	%i7
	bcs,a	loop_237
	movrlz	%o7,	%l1,	%o2
	sll	%g1,	0x1A,	%l3
	tpos	%xcc,	0x6
loop_237:
	addc	%l4,	0x17BD,	%g5
	fones	%f12
	set	0x44, %g1
	swapa	[%l7 + %g1] 0x89,	%g3
	smulcc	%i1,	0x044F,	%i5
	tg	%icc,	0x0
	movge	%xcc,	%g2,	%l2
	popc	0x0387,	%o0
	tne	%xcc,	0x1
	edge16n	%l0,	%i3,	%g4
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x11
	bcs,pn	%xcc,	loop_238
	movvc	%xcc,	%g7,	%i2
	sdivx	%l6,	0x00BC,	%i0
	fcmple32	%f6,	%f6,	%o4
loop_238:
	movne	%icc,	%i4,	%g6
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x14,	%f16
	movrlz	%o1,	0x132,	%l5
	movge	%xcc,	%o5,	%o3
	tvc	%xcc,	0x4
	tcs	%xcc,	0x7
	umul	%i6,	0x05C2,	%o6
	pdist	%f18,	%f22,	%f16
	srlx	%i7,	0x15,	%l1
	subcc	%o2,	0x0CDF,	%g1
	subccc	%o7,	%l4,	%g5
	ldsb	[%l7 + 0x4E],	%l3
	fbge,a	%fcc0,	loop_239
	ldd	[%l7 + 0x40],	%f18
	movl	%icc,	%g3,	%i5
	te	%xcc,	0x2
loop_239:
	or	%g2,	0x19BC,	%l2
	movcs	%icc,	%o0,	%l0
	alignaddrl	%i1,	%g4,	%g7
	fmovsn	%icc,	%f24,	%f19
	array32	%i2,	%i3,	%l6
	taddcc	%i0,	%i4,	%g6
	fandnot2s	%f31,	%f26,	%f15
	tpos	%icc,	0x0
	addccc	%o1,	%o4,	%o5
	addcc	%l5,	%i6,	%o6
	and	%i7,	0x1592,	%l1
	tsubcctv	%o2,	%g1,	%o3
	fmuld8ulx16	%f31,	%f23,	%f16
	fba,a	%fcc3,	loop_240
	sdivcc	%l4,	0x1D10,	%o7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x0c,	%g5,	%l3
loop_240:
	edge16l	%i5,	%g2,	%l2
	fxors	%f24,	%f0,	%f1
	xorcc	%o0,	0x0B53,	%g3
	taddcc	%i1,	%l0,	%g4
	movne	%icc,	%i2,	%i3
	edge32	%g7,	%l6,	%i4
	pdist	%f24,	%f18,	%f18
	nop
	fitos	%f13,	%f26
	fstox	%f26,	%f12
	edge32	%g6,	%i0,	%o4
	xor	%o1,	0x1DC9,	%o5
	bne,pn	%icc,	loop_241
	sdivx	%l5,	0x0219,	%i6
	brlez	%o6,	loop_242
	subcc	%l1,	0x1CBA,	%o2
loop_241:
	array32	%i7,	%o3,	%g1
	movl	%xcc,	%o7,	%g5
loop_242:
	nop
	set	0x2C, %g3
	lduwa	[%l7 + %g3] 0x10,	%l4
	edge32	%l3,	%g2,	%l2
	movcc	%xcc,	%i5,	%g3
	movrlez	%o0,	0x0DB,	%l0
	stw	%i1,	[%l7 + 0x60]
	call	loop_243
	array32	%i2,	%i3,	%g4
	edge16l	%l6,	%i4,	%g7
	tn	%xcc,	0x1
loop_243:
	fornot1s	%f9,	%f21,	%f14
	addc	%i0,	0x02BC,	%o4
	tleu	%xcc,	0x6
	tleu	%xcc,	0x5
	udivcc	%o1,	0x0CE8,	%o5
	bge	loop_244
	taddcctv	%l5,	0x1006,	%g6
	fmuld8ulx16	%f16,	%f26,	%f30
	fpack32	%f22,	%f6,	%f14
loop_244:
	fpsub16	%f18,	%f10,	%f4
	fmovrsgz	%i6,	%f12,	%f12
	fbg	%fcc2,	loop_245
	sir	0x0592
	andncc	%l1,	%o2,	%i7
	edge32ln	%o3,	%g1,	%o7
loop_245:
	sllx	%o6,	0x0F,	%l4
	umulcc	%g5,	%g2,	%l3
	fnegd	%f20,	%f2
	fba,a	%fcc0,	loop_246
	bg,a	%xcc,	loop_247
	fmovsle	%xcc,	%f11,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_246:
	ldx	[%l7 + 0x60],	%l2
loop_247:
	nop
	setx	loop_248,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fors	%f28,	%f20,	%f29
	array8	%g3,	%o0,	%l0
	mova	%icc,	%i1,	%i2
loop_248:
	tneg	%xcc,	0x5
	addcc	%i3,	0x0CF8,	%i5
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x73] %asi,	%g4
	umulcc	%i4,	0x1C03,	%g7
	movvc	%xcc,	%l6,	%i0
	tge	%xcc,	0x5
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x10
	srlx	%o1,	%o5,	%o4
	tl	%icc,	0x6
	udivcc	%l5,	0x1C48,	%g6
	fsrc2s	%f29,	%f4
	fpack32	%f10,	%f2,	%f6
	movpos	%xcc,	%i6,	%o2
	fble	%fcc0,	loop_249
	fxor	%f24,	%f12,	%f6
	srlx	%l1,	%i7,	%g1
	sethi	0x0507,	%o3
loop_249:
	array32	%o6,	%l4,	%g5
	fnot2	%f20,	%f2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x3A] %asi,	%g2
	array16	%l3,	%o7,	%g3
	fabsd	%f14,	%f22
	prefetch	[%l7 + 0x08],	 0x2
	andcc	%l2,	0x0ED9,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%l0,	%f18,	%f18
	edge16n	%i1,	%i2,	%i3
	subccc	%i5,	0x1CD3,	%i4
	orn	%g7,	%g4,	%i0
	sir	0x1B74
	tcc	%icc,	0x1
	fbug,a	%fcc1,	loop_250
	alignaddrl	%o1,	%l6,	%o5
	fzeros	%f22
	sub	%o4,	0x1FAD,	%l5
loop_250:
	fmovde	%xcc,	%f1,	%f14
	fcmpgt16	%f18,	%f2,	%g6
	move	%icc,	%i6,	%o2
	fbule	%fcc2,	loop_251
	move	%icc,	%l1,	%i7
	move	%xcc,	%o3,	%o6
	prefetch	[%l7 + 0x48],	 0x1
loop_251:
	fnot2s	%f23,	%f16
	xor	%g1,	%l4,	%g5
	tvs	%icc,	0x4
	tgu	%xcc,	0x5
	brlez	%l3,	loop_252
	edge8ln	%g2,	%g3,	%o7
	movneg	%xcc,	%l2,	%l0
	movvs	%icc,	%o0,	%i1
loop_252:
	movpos	%xcc,	%i2,	%i3
	fmuld8sux16	%f6,	%f10,	%f12
	movrne	%i5,	%i4,	%g7
	fxnor	%f18,	%f8,	%f6
	edge16n	%g4,	%i0,	%l6
	array16	%o1,	%o5,	%l5
	bl,a,pn	%xcc,	loop_253
	tne	%xcc,	0x3
	movneg	%xcc,	%o4,	%g6
	fcmpgt16	%f8,	%f26,	%o2
loop_253:
	nop
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	set	0x24, %g7
	lduha	[%l7 + %g7] 0x80,	%l1
	te	%icc,	0x5
	udivcc	%i6,	0x0F4B,	%o3
	nop
	setx	0x603904D3A065B698,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fmovsl	%xcc,	%f16,	%f21
	brlez,a	%i7,	loop_254
	tleu	%icc,	0x0
	fabss	%f14,	%f1
	taddcctv	%g1,	%l4,	%g5
loop_254:
	array32	%o6,	%g2,	%g3
	taddcc	%o7,	0x0C63,	%l2
	tsubcc	%l3,	0x1AEA,	%l0
	tcc	%icc,	0x0
	subc	%o0,	0x1A89,	%i2
	tpos	%xcc,	0x1
	movrne	%i3,	%i1,	%i5
	sir	0x1F63
	fbug	%fcc2,	loop_255
	edge8ln	%i4,	%g7,	%g4
	movrgz	%i0,	0x1A2,	%l6
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x08] %asi,	%o1
loop_255:
	nop
	setx	loop_256,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbue	%fcc2,	loop_257
	movl	%xcc,	%l5,	%o5
	fpadd16s	%f26,	%f24,	%f26
loop_256:
	movpos	%xcc,	%g6,	%o4
loop_257:
	edge8ln	%o2,	%l1,	%o3
	fbge	%fcc1,	loop_258
	fxnor	%f14,	%f8,	%f0
	sir	0x0055
	edge16n	%i6,	%i7,	%g1
loop_258:
	edge32ln	%l4,	%o6,	%g5
	fpsub16	%f12,	%f6,	%f20
	srlx	%g3,	0x10,	%o7
	movrlez	%l2,	0x33D,	%l3
	subcc	%l0,	%g2,	%o0
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i2
	fpadd32	%f22,	%f28,	%f4
	bne,a,pn	%xcc,	loop_259
	smul	%i1,	0x0B4E,	%i3
	ba,pt	%icc,	loop_260
	movrgz	%i4,	%g7,	%g4
loop_259:
	subc	%i5,	%l6,	%o1
	edge8	%l5,	%o5,	%g6
loop_260:
	sub	%o4,	0x1A77,	%i0
	xor	%o2,	0x00F1,	%o3
	movn	%icc,	%l1,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g1,	%i7,	%l4
	edge8ln	%g5,	%o6,	%g3
	movvs	%xcc,	%o7,	%l3
	ta	%icc,	0x1
	udivcc	%l2,	0x17CC,	%g2
	mulx	%o0,	0x02A6,	%l0
	sdivcc	%i1,	0x1245,	%i2
	te	%xcc,	0x1
	edge32l	%i3,	%i4,	%g7
	subccc	%i5,	0x0368,	%l6
	movleu	%xcc,	%g4,	%o1
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o5
	srl	%g6,	0x0A,	%o4
	tle	%xcc,	0x5
	andn	%i0,	0x06F9,	%o2
	movl	%xcc,	%o3,	%l1
	bcs,a	%icc,	loop_261
	tl	%xcc,	0x2
	tsubcc	%i6,	%l5,	%i7
	ldsb	[%l7 + 0x3F],	%g1
loop_261:
	ble	%icc,	loop_262
	movrgez	%g5,	%o6,	%l4
	subccc	%g3,	%o7,	%l2
	fbug	%fcc1,	loop_263
loop_262:
	alignaddr	%l3,	%g2,	%l0
	xorcc	%o0,	0x1841,	%i1
	tn	%xcc,	0x3
loop_263:
	brlz	%i2,	loop_264
	fxors	%f23,	%f18,	%f27
	fmovdge	%icc,	%f27,	%f25
	edge32	%i4,	%g7,	%i5
loop_264:
	edge32ln	%i3,	%l6,	%o1
	bn,a	loop_265
	call	loop_266
	sub	%g4,	0x1D79,	%o5
	fbul,a	%fcc3,	loop_267
loop_265:
	taddcctv	%o4,	%i0,	%o2
loop_266:
	tsubcc	%g6,	%o3,	%l1
	movvc	%icc,	%l5,	%i7
loop_267:
	nop
	setx	0xD05F88F8,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	sllx	%i6,	0x14,	%g5
	array16	%o6,	%l4,	%g1
	umulcc	%o7,	%g3,	%l2
	andcc	%l3,	%g2,	%l0
	wr	%g0,	0x2f,	%asi
	stwa	%i1,	[%l7 + 0x28] %asi
	membar	#Sync
	umulcc	%i2,	%o0,	%i4
	nop
	fitos	%f13,	%f28
	fstoi	%f28,	%f27
	movneg	%icc,	%g7,	%i3
	array32	%l6,	%i5,	%g4
	sll	%o1,	0x16,	%o5
	wr	%g0,	0x0c,	%asi
	stha	%o4,	[%l7 + 0x5C] %asi
	andn	%o2,	%g6,	%o3
	tne	%xcc,	0x1
	tcc	%xcc,	0x7
	tle	%xcc,	0x7
	srl	%l1,	0x1B,	%l5
	edge32l	%i0,	%i7,	%i6
	fbule	%fcc1,	loop_268
	bg,pt	%icc,	loop_269
	fbu	%fcc1,	loop_270
	srl	%o6,	%l4,	%g1
loop_268:
	nop
	setx	loop_271,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_269:
	fmovdvc	%xcc,	%f11,	%f28
loop_270:
	smulcc	%g5,	%o7,	%g3
	smulcc	%l2,	%l3,	%l0
loop_271:
	movleu	%icc,	%g2,	%i2
	movre	%i1,	%o0,	%i4
	andcc	%i3,	0x1B28,	%l6
	mulx	%i5,	%g7,	%o1
	movrlez	%g4,	0x2F8,	%o5
	movn	%icc,	%o4,	%g6
	fmovda	%icc,	%f7,	%f15
	movrlz	%o3,	%l1,	%l5
	fbuge,a	%fcc1,	loop_272
	xorcc	%o2,	0x1868,	%i7
	movgu	%icc,	%i6,	%i0
	fnegd	%f28,	%f18
loop_272:
	movcs	%xcc,	%l4,	%g1
	ba,a,pn	%xcc,	loop_273
	stb	%o6,	[%l7 + 0x46]
	movvc	%icc,	%o7,	%g5
	sub	%g3,	0x1EB2,	%l2
loop_273:
	edge16l	%l3,	%l0,	%i2
	addccc	%g2,	0x0AF1,	%i1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x11,	%i4,	%i3
	set	0x52, %l5
	stba	%o0,	[%l7 + %l5] 0x11
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f14
	fmovsgu	%xcc,	%f3,	%f27
	lduh	[%l7 + 0x58],	%i5
	movpos	%icc,	%l6,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a,pt	%icc,	loop_274
	tvc	%icc,	0x2
	nop
	setx loop_275, %l0, %l1
	jmpl %l1, %g4
	stx	%o1,	[%l7 + 0x58]
loop_274:
	movrgez	%o4,	0x2BD,	%o5
	tcs	%icc,	0x3
loop_275:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%g6,	%l1
	movrgz	%o3,	%o2,	%l5
	tleu	%xcc,	0x3
	bcs,a	loop_276
	tle	%xcc,	0x5
	movrne	%i7,	%i0,	%i6
	tgu	%icc,	0x5
loop_276:
	fandnot2	%f24,	%f28,	%f16
	wr	%g0,	0x81,	%asi
	stha	%l4,	[%l7 + 0x3C] %asi
	fnegd	%f12,	%f30
	nop
	fitod	%f23,	%f16
	bne,a,pt	%icc,	loop_277
	fmovdleu	%xcc,	%f15,	%f7
	movpos	%icc,	%g1,	%o7
	xorcc	%g5,	%g3,	%l2
loop_277:
	movneg	%icc,	%o6,	%l0
	or	%i2,	0x1ECB,	%l3
	sethi	0x1B5D,	%i1
	fmuld8ulx16	%f27,	%f22,	%f20
	fbg,a	%fcc3,	loop_278
	tn	%xcc,	0x6
	fmovs	%f12,	%f27
	movn	%xcc,	%i4,	%g2
loop_278:
	array32	%i3,	%o0,	%l6
	fandnot1	%f24,	%f26,	%f16
	edge32n	%i5,	%g7,	%o1
	alignaddrl	%o4,	%g4,	%g6
	nop
	setx loop_279, %l0, %l1
	jmpl %l1, %l1
	smulcc	%o3,	0x1AEA,	%o5
	udiv	%o2,	0x0524,	%i7
	bleu,a	%icc,	loop_280
loop_279:
	movre	%l5,	%i6,	%l4
	fnot2	%f6,	%f14
	ldd	[%l7 + 0x10],	%f26
loop_280:
	fpack32	%f14,	%f18,	%f10
	tcs	%icc,	0x5
	fnot1	%f12,	%f10
	brz	%i0,	loop_281
	subccc	%g1,	%o7,	%g5
	tleu	%icc,	0x3
	edge32	%l2,	%g3,	%o6
loop_281:
	nop
	setx	0x0EFBDFA2C733B9BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x73DAA0A33604C772,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f12,	%f22
	subccc	%l0,	0x01ED,	%i2
	taddcctv	%l3,	%i4,	%i1
	fbg,a	%fcc3,	loop_282
	te	%xcc,	0x3
	mulscc	%i3,	%o0,	%l6
	fand	%f2,	%f2,	%f22
loop_282:
	fbo,a	%fcc2,	loop_283
	movcs	%xcc,	%i5,	%g2
	bneg,pn	%icc,	loop_284
	sub	%o1,	%o4,	%g7
loop_283:
	te	%xcc,	0x5
	orn	%g4,	0x1346,	%g6
loop_284:
	xor	%o3,	0x05BB,	%l1
	movrgz	%o2,	0x164,	%o5
	fba,a	%fcc0,	loop_285
	std	%f16,	[%l7 + 0x30]
	tleu	%xcc,	0x1
	fbul,a	%fcc0,	loop_286
loop_285:
	nop
	setx	0x8C06C8AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x89F98B2B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f22,	%f23
	popc	%l5,	%i6
	umulcc	%l4,	%i7,	%g1
loop_286:
	movrne	%i0,	0x3A3,	%o7
	edge8ln	%l2,	%g5,	%o6
	fbule	%fcc1,	loop_287
	bcc,a	loop_288
	srax	%g3,	%i2,	%l0
	set	0x08, %o0
	lduha	[%l7 + %o0] 0x15,	%l3
loop_287:
	fpsub16s	%f27,	%f14,	%f5
loop_288:
	subcc	%i4,	%i1,	%i3
	subc	%o0,	0x13D2,	%i5
	and	%l6,	0x0FFF,	%g2
	nop
	setx	loop_289,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%o1,	%o4,	%g7
	udivx	%g6,	0x19A2,	%o3
	fmovsleu	%xcc,	%f23,	%f6
loop_289:
	tvs	%icc,	0x3
	mova	%xcc,	%g4,	%l1
	sdivcc	%o5,	0x00FD,	%l5
	bvs,a,pt	%xcc,	loop_290
	tleu	%icc,	0x3
	edge16l	%o2,	%l4,	%i7
	tleu	%xcc,	0x2
loop_290:
	fcmpgt16	%f26,	%f8,	%g1
	tl	%icc,	0x5
	udivcc	%i0,	0x0EA2,	%i6
	tn	%xcc,	0x0
	tleu	%icc,	0x7
	fnor	%f18,	%f26,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f23,	%f15
	nop
	set	0x3C, %l0
	prefetch	[%l7 + %l0],	 0x0
	addc	%o7,	%g5,	%o6
	fble	%fcc3,	loop_291
	sllx	%l2,	%g3,	%l0
	fandnot2s	%f2,	%f28,	%f30
	orn	%i2,	%l3,	%i4
loop_291:
	tg	%icc,	0x6
	smulcc	%i1,	%o0,	%i5
	fmovdcs	%xcc,	%f6,	%f10
	edge32n	%l6,	%i3,	%g2
	fmovdcs	%xcc,	%f18,	%f21
	fsrc1	%f6,	%f24
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%o1
	edge16ln	%g7,	%g6,	%o3
	sllx	%g4,	0x00,	%l1
	nop
	setx	0xB06F0F28,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	lduh	[%l7 + 0x44],	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o5,	0x1692,	%o2
	membar	0x0B
	add	%l4,	%l5,	%i7
	fpsub32	%f26,	%f6,	%f30
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf0
	membar	#Sync
	taddcc	%g1,	0x1EEF,	%i6
	fbn	%fcc1,	loop_292
	fbule,a	%fcc2,	loop_293
	sethi	0x16CC,	%o7
	std	%f18,	[%l7 + 0x58]
loop_292:
	edge8l	%i0,	%o6,	%l2
loop_293:
	tgu	%xcc,	0x0
	addcc	%g3,	0x1DF8,	%g5
	edge32ln	%l0,	%l3,	%i4
	fbne	%fcc2,	loop_294
	srax	%i2,	0x18,	%i1
	andncc	%i5,	%l6,	%i3
	fpsub16s	%f0,	%f30,	%f9
loop_294:
	fcmpgt16	%f22,	%f18,	%g2
	tvc	%xcc,	0x0
	movpos	%icc,	%o0,	%g7
	fmovsa	%icc,	%f20,	%f25
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x10,	%f16
	tne	%xcc,	0x4
	alignaddr	%o1,	%g6,	%o3
	ldd	[%l7 + 0x78],	%l0
	move	%icc,	%o4,	%g4
	fpadd32s	%f16,	%f0,	%f5
	addccc	%o5,	%l4,	%l5
	fbne	%fcc2,	loop_295
	ldsw	[%l7 + 0x7C],	%i7
	movrgz	%o2,	0x0FD,	%i6
	tvc	%icc,	0x0
loop_295:
	ta	%icc,	0x0
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x78] %asi,	%o7
	set	0x5C, %l4
	lduwa	[%l7 + %l4] 0x89,	%g1
	nop
	fitos	%f21,	%f10
	addcc	%o6,	%i0,	%l2
	edge16	%g3,	%g5,	%l3
	ldsh	[%l7 + 0x22],	%i4
	fcmpne16	%f0,	%f20,	%l0
	ld	[%l7 + 0x40],	%f7
	sethi	0x1335,	%i1
	fors	%f27,	%f13,	%f12
	fblg	%fcc2,	loop_296
	sra	%i5,	0x0F,	%l6
	tsubcctv	%i3,	0x16D4,	%g2
	ba	%xcc,	loop_297
loop_296:
	andncc	%i2,	%g7,	%o1
	movvs	%icc,	%g6,	%o0
	fmovrdgez	%o3,	%f12,	%f10
loop_297:
	tle	%icc,	0x3
	andcc	%o4,	%l1,	%g4
	sdiv	%o5,	0x1144,	%l4
	fnors	%f31,	%f11,	%f26
	bn,pt	%icc,	loop_298
	tvs	%xcc,	0x2
	andncc	%i7,	%l5,	%o2
	stb	%o7,	[%l7 + 0x4B]
loop_298:
	edge16n	%i6,	%g1,	%o6
	umulcc	%l2,	%i0,	%g5
	addcc	%l3,	%i4,	%g3
	fcmple16	%f16,	%f16,	%l0
	brgz,a	%i5,	loop_299
	bneg,pt	%xcc,	loop_300
	fbl	%fcc0,	loop_301
	and	%l6,	%i3,	%g2
loop_299:
	edge8n	%i2,	%g7,	%i1
loop_300:
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f2
	fxtod	%f2,	%f6
loop_301:
	fbn	%fcc0,	loop_302
	bcs,a,pt	%icc,	loop_303
	brlz	%o1,	loop_304
	subccc	%g6,	0x1324,	%o3
loop_302:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_303:
	fsrc2	%f2,	%f20
loop_304:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x5
	fabss	%f13,	%f0
	lduw	[%l7 + 0x28],	%o4
	edge16n	%l1,	%g4,	%o0
	edge8n	%o5,	%l4,	%i7
	bvs,a,pt	%xcc,	loop_305
	orncc	%o2,	%l5,	%o7
	and	%i6,	%g1,	%o6
	umul	%l2,	%g5,	%i0
loop_305:
	orncc	%l3,	%i4,	%l0
	tle	%icc,	0x6
	sethi	0x1D69,	%g3
	addcc	%i5,	0x1499,	%l6
	tvs	%icc,	0x0
	fmovs	%f29,	%f14
	sllx	%g2,	%i2,	%g7
	tl	%icc,	0x6
	st	%f2,	[%l7 + 0x58]
	tleu	%icc,	0x3
	bge,a,pt	%icc,	loop_306
	tvc	%icc,	0x5
	fmovdl	%xcc,	%f31,	%f9
	fornot1	%f4,	%f8,	%f10
loop_306:
	nop
	set	0x31, %i6
	ldstuba	[%l7 + %i6] 0x18,	%i1
	andncc	%i3,	%g6,	%o1
	tgu	%icc,	0x0
	udiv	%o3,	0x0819,	%o4
	edge32ln	%g4,	%l1,	%o0
	mulscc	%l4,	0x1934,	%i7
	movne	%icc,	%o2,	%o5
	fbule	%fcc1,	loop_307
	smul	%l5,	%i6,	%g1
	fpackfix	%f2,	%f26
	smul	%o6,	0x1DAE,	%o7
loop_307:
	xnor	%l2,	0x0975,	%g5
	mova	%icc,	%i0,	%i4
	fbge,a	%fcc3,	loop_308
	sub	%l0,	%l3,	%g3
	fmovda	%xcc,	%f27,	%f25
	ldsh	[%l7 + 0x2C],	%l6
loop_308:
	udivcc	%g2,	0x0D25,	%i2
	tn	%icc,	0x1
	fcmpgt32	%f22,	%f2,	%g7
	array16	%i1,	%i3,	%g6
	sdivx	%i5,	0x0FBF,	%o1
	fmovrde	%o4,	%f16,	%f4
	subc	%o3,	0x1182,	%l1
	orn	%o0,	%g4,	%i7
	stbar
	fcmpeq32	%f0,	%f12,	%o2
	fbg,a	%fcc2,	loop_309
	mulx	%l4,	%o5,	%l5
	fbg,a	%fcc3,	loop_310
	fbl	%fcc3,	loop_311
loop_309:
	tl	%xcc,	0x3
	fxors	%f3,	%f18,	%f2
loop_310:
	lduh	[%l7 + 0x54],	%i6
loop_311:
	stw	%g1,	[%l7 + 0x48]
	fbo,a	%fcc0,	loop_312
	nop
	set	0x62, %i5
	ldub	[%l7 + %i5],	%o7
	nop
	set	0x78, %g2
	stx	%o6,	[%l7 + %g2]
	fabsd	%f16,	%f2
loop_312:
	nop
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x1e
	membar	#Sync
	addccc	%l2,	%i0,	%g5
	sllx	%l0,	%i4,	%g3
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movleu	%icc,	%l6,	%l3
	xnor	%g2,	0x1A09,	%g7
	mova	%icc,	%i2,	%i3
	sdiv	%g6,	0x111D,	%i5
	brlz,a	%o1,	loop_313
	ba,a	%icc,	loop_314
	te	%xcc,	0x1
	sth	%i1,	[%l7 + 0x32]
loop_313:
	add	%o4,	0x144C,	%l1
loop_314:
	movrlz	%o3,	0x341,	%g4
	fmovsleu	%xcc,	%f0,	%f17
	alignaddr	%i7,	%o0,	%l4
	umulcc	%o5,	0x16A6,	%l5
	movl	%icc,	%i6,	%g1
	mulx	%o2,	%o6,	%o7
	subc	%i0,	%g5,	%l0
	mulscc	%l2,	0x050E,	%g3
	udivx	%l6,	0x016E,	%i4
	movg	%icc,	%g2,	%l3
	array32	%g7,	%i2,	%i3
	tle	%xcc,	0x0
	edge8	%g6,	%i5,	%i1
	fmovsne	%icc,	%f21,	%f14
	edge32ln	%o4,	%l1,	%o1
	fnor	%f4,	%f28,	%f12
	ba,pt	%xcc,	loop_315
	fsrc1s	%f0,	%f2
	udivx	%o3,	0x1331,	%g4
	andn	%i7,	%o0,	%o5
loop_315:
	fmovdneg	%xcc,	%f13,	%f26
	fbue,a	%fcc3,	loop_316
	alignaddr	%l5,	%l4,	%g1
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x70] %asi,	%o2
loop_316:
	nop
	fitos	%f11,	%f4
	fstoi	%f4,	%f19
	fmovdge	%xcc,	%f19,	%f23
	stx	%i6,	[%l7 + 0x68]
	fmovdvs	%xcc,	%f8,	%f11
	fnot2	%f22,	%f18
	array16	%o7,	%i0,	%o6
	fsrc1s	%f21,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%l0,	%g5
	orn	%g3,	0x0978,	%l6
	movn	%icc,	%i4,	%l2
	ldsb	[%l7 + 0x1E],	%l3
	taddcctv	%g2,	%i2,	%g7
	fmovrsne	%i3,	%f25,	%f25
	wr	%g0,	0x81,	%asi
	sta	%f11,	[%l7 + 0x28] %asi
	andncc	%i5,	%g6,	%i1
	array8	%o4,	%l1,	%o1
	or	%g4,	0x096F,	%i7
	edge16n	%o0,	%o5,	%l5
	membar	0x3F
	sll	%l4,	%g1,	%o2
	movvc	%xcc,	%o3,	%i6
	bvc,a,pt	%xcc,	loop_317
	movle	%xcc,	%o7,	%i0
	edge8	%o6,	%g5,	%g3
	bpos,a	loop_318
loop_317:
	tle	%xcc,	0x6
	fbe	%fcc2,	loop_319
	nop
	setx	0x7DE393E82C7083F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xCA14541FDA538CCE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f22,	%f0
loop_318:
	fmul8x16au	%f17,	%f27,	%f8
	movne	%xcc,	%l0,	%l6
loop_319:
	nop
	set	0x63, %g5
	ldsba	[%l7 + %g5] 0x11,	%l2
	srlx	%i4,	0x0F,	%l3
	fmovsle	%icc,	%f4,	%f14
	sdivcc	%g2,	0x0483,	%i2
	te	%icc,	0x2
	fbu	%fcc3,	loop_320
	sdivx	%i3,	0x1C68,	%g7
	and	%g6,	0x03B9,	%i5
	movl	%icc,	%o4,	%l1
loop_320:
	membar	0x64
	edge8n	%o1,	%g4,	%i7
	orncc	%i1,	%o0,	%o5
	fbl	%fcc3,	loop_321
	udivx	%l5,	0x0CD9,	%g1
	nop
	fitos	%f7,	%f5
	fstod	%f5,	%f6
	movrgez	%o2,	0x0C6,	%o3
loop_321:
	fbge	%fcc2,	loop_322
	call	loop_323
	tleu	%xcc,	0x1
	sra	%i6,	0x1B,	%o7
loop_322:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%l4
loop_323:
	movrlez	%g5,	0x24B,	%g3
	movcc	%xcc,	%o6,	%l0
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x18,	 0x0
	tgu	%xcc,	0x2
	sethi	0x10B1,	%l2
	fbn,a	%fcc2,	loop_324
	movrlz	%i4,	%l3,	%g2
	te	%icc,	0x7
	tvc	%xcc,	0x6
loop_324:
	ldsh	[%l7 + 0x5E],	%i3
	movcs	%icc,	%i2,	%g7
	movcc	%icc,	%g6,	%i5
	bvs,a,pn	%icc,	loop_325
	umulcc	%l1,	0x183F,	%o1
	tg	%xcc,	0x3
	fmovsl	%xcc,	%f16,	%f14
loop_325:
	mulscc	%o4,	%i7,	%g4
	movn	%icc,	%o0,	%o5
	orcc	%l5,	%g1,	%o2
	fmovdne	%icc,	%f25,	%f30
	mulx	%o3,	0x00F1,	%i1
	movrgez	%o7,	%i6,	%i0
	fmovdne	%icc,	%f16,	%f13
	fbn,a	%fcc0,	loop_326
	popc	0x01D3,	%l4
	edge8	%g3,	%g5,	%l0
	fble,a	%fcc1,	loop_327
loop_326:
	smul	%o6,	%l6,	%l2
	te	%icc,	0x6
	lduh	[%l7 + 0x5C],	%l3
loop_327:
	movvc	%icc,	%i4,	%i3
	xorcc	%i2,	%g7,	%g2
	movpos	%xcc,	%g6,	%i5
	edge32l	%o1,	%o4,	%i7
	bleu,a	%icc,	loop_328
	smulcc	%l1,	%o0,	%o5
	fmovrdlez	%l5,	%f14,	%f28
	fxnors	%f9,	%f24,	%f29
loop_328:
	sdiv	%g4,	0x049D,	%g1
	fbge,a	%fcc0,	loop_329
	movgu	%xcc,	%o2,	%o3
	tg	%xcc,	0x4
	ldub	[%l7 + 0x54],	%o7
loop_329:
	fbule	%fcc3,	loop_330
	fpadd16s	%f19,	%f16,	%f14
	edge16ln	%i1,	%i0,	%i6
	udivx	%g3,	0x02E4,	%g5
loop_330:
	movle	%icc,	%l0,	%l4
	fone	%f22
	edge16	%l6,	%o6,	%l3
	bge,a,pt	%xcc,	loop_331
	edge32	%i4,	%i3,	%l2
	brnz,a	%g7,	loop_332
	udivcc	%i2,	0x0D4A,	%g6
loop_331:
	edge8l	%g2,	%i5,	%o1
	movrlez	%o4,	0x108,	%l1
loop_332:
	bvc,pn	%xcc,	loop_333
	movgu	%icc,	%o0,	%o5
	udivcc	%l5,	0x13BD,	%g4
	taddcctv	%g1,	%i7,	%o3
loop_333:
	umul	%o7,	%o2,	%i0
	tsubcc	%i1,	0x0269,	%i6
	brlz	%g5,	loop_334
	fmovdn	%xcc,	%f17,	%f23
	fors	%f9,	%f26,	%f12
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x66] %asi,	%l0
loop_334:
	movrlz	%l4,	0x13C,	%g3
	fbg	%fcc0,	loop_335
	fand	%f22,	%f16,	%f24
	orcc	%o6,	%l6,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_335:
	ldx	[%l7 + 0x28],	%i4
	movre	%l2,	0x18F,	%g7
	andn	%i3,	%i2,	%g6
	sdiv	%g2,	0x076A,	%o1
	fcmpeq16	%f6,	%f16,	%o4
	movpos	%xcc,	%l1,	%i5
	nop
	setx	loop_336,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%o5,	%l5,	%g4
	st	%f29,	[%l7 + 0x08]
	bshuffle	%f26,	%f12,	%f8
loop_336:
	fmovsa	%icc,	%f22,	%f16
	popc	0x05AD,	%g1
	mova	%icc,	%o0,	%i7
	fbug	%fcc0,	loop_337
	lduw	[%l7 + 0x64],	%o7
	ldd	[%l7 + 0x40],	%f2
	mulx	%o2,	0x0FF8,	%i0
loop_337:
	add	%i1,	0x18B4,	%o3
	sub	%g5,	%l0,	%i6
	fmovsgu	%xcc,	%f27,	%f20
	fone	%f0
	fmovde	%icc,	%f3,	%f28
	fnors	%f14,	%f26,	%f20
	move	%xcc,	%g3,	%o6
	xnor	%l4,	0x197C,	%l6
	fnegd	%f28,	%f12
	fnot2s	%f20,	%f5
	sir	0x0CC9
	movl	%icc,	%i4,	%l2
	orn	%g7,	%i3,	%i2
	fble	%fcc1,	loop_338
	srl	%l3,	%g6,	%o1
	ta	%icc,	0x1
	andcc	%o4,	%l1,	%i5
loop_338:
	umul	%o5,	%l5,	%g4
	swap	[%l7 + 0x48],	%g2
	tpos	%icc,	0x1
	fbl,a	%fcc2,	loop_339
	movrlez	%o0,	%i7,	%o7
	tvs	%icc,	0x3
	sllx	%o2,	%g1,	%i0
loop_339:
	tl	%icc,	0x5
	ble,a,pn	%xcc,	loop_340
	nop
	set	0x70, %i3
	stx	%i1,	[%l7 + %i3]
	be,a,pt	%icc,	loop_341
	tneg	%xcc,	0x3
loop_340:
	fbn,a	%fcc0,	loop_342
	bpos,pt	%xcc,	loop_343
loop_341:
	ldstub	[%l7 + 0x1E],	%o3
	add	%l0,	0x06C7,	%i6
loop_342:
	alignaddr	%g3,	%g5,	%o6
loop_343:
	fmovrslez	%l6,	%f15,	%f23
	fands	%f28,	%f6,	%f9
	bl,a	loop_344
	movpos	%xcc,	%i4,	%l4
	fmovsgu	%xcc,	%f24,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_344:
	movne	%icc,	%g7,	%l2
	edge8l	%i2,	%i3,	%g6
	bg	loop_345
	bneg,a	loop_346
	brlez	%l3,	loop_347
	bneg	loop_348
loop_345:
	sub	%o4,	%l1,	%o1
loop_346:
	fmovdl	%xcc,	%f10,	%f27
loop_347:
	fexpand	%f1,	%f6
loop_348:
	nop
	set	0x38, %o6
	lduha	[%l7 + %o6] 0x19,	%o5
	xnorcc	%l5,	0x19F7,	%i5
	bne,pt	%icc,	loop_349
	srl	%g4,	0x06,	%g2
	nop
	fitos	%f14,	%f17
	fstoi	%f17,	%f16
	array8	%i7,	%o7,	%o0
loop_349:
	movgu	%icc,	%g1,	%o2
	edge16l	%i1,	%i0,	%l0
	bl,pt	%xcc,	loop_350
	movn	%xcc,	%i6,	%g3
	movrlz	%o3,	0x2B0,	%o6
	bne,a	%icc,	loop_351
loop_350:
	move	%icc,	%g5,	%i4
	edge8ln	%l6,	%l4,	%l2
	fbge,a	%fcc1,	loop_352
loop_351:
	movl	%icc,	%g7,	%i2
	xnor	%g6,	%l3,	%i3
	srax	%l1,	%o4,	%o1
loop_352:
	subccc	%l5,	0x13D5,	%i5
	movrlez	%o5,	%g2,	%i7
	udivcc	%g4,	0x1CCC,	%o7
	or	%g1,	0x162D,	%o0
	fcmple16	%f14,	%f12,	%o2
	and	%i1,	0x0062,	%l0
	tvc	%xcc,	0x6
	ldsb	[%l7 + 0x33],	%i6
	fbuge,a	%fcc1,	loop_353
	edge32n	%i0,	%g3,	%o3
	taddcc	%g5,	%o6,	%i4
	movrgz	%l4,	0x3C7,	%l2
loop_353:
	subc	%g7,	0x1742,	%i2
	edge16n	%g6,	%l6,	%i3
	array32	%l1,	%l3,	%o1
	fmul8x16al	%f16,	%f2,	%f10
	fmovsg	%icc,	%f11,	%f21
	srlx	%l5,	0x16,	%i5
	te	%icc,	0x6
	bneg,pt	%xcc,	loop_354
	sra	%o5,	0x0A,	%g2
	subcc	%i7,	%g4,	%o4
	brnz,a	%g1,	loop_355
loop_354:
	fcmpgt16	%f4,	%f0,	%o7
	fpmerge	%f26,	%f27,	%f10
	or	%o2,	%i1,	%o0
loop_355:
	fbge,a	%fcc1,	loop_356
	udivcc	%i6,	0x0A79,	%i0
	fnot2	%f6,	%f20
	and	%g3,	0x0E14,	%o3
loop_356:
	smul	%g5,	0x092E,	%o6
	fmovrse	%i4,	%f22,	%f11
	fmovrse	%l4,	%f29,	%f28
	orncc	%l0,	%l2,	%g7
	alignaddr	%i2,	%l6,	%i3
	brlz,a	%g6,	loop_357
	edge8l	%l1,	%l3,	%l5
	stb	%i5,	[%l7 + 0x60]
	xor	%o1,	0x0B06,	%o5
loop_357:
	ld	[%l7 + 0x6C],	%f8
	subc	%i7,	%g2,	%g4
	movcc	%icc,	%g1,	%o4
	fxnor	%f24,	%f8,	%f24
	tleu	%icc,	0x5
	mova	%icc,	%o2,	%o7
	smulcc	%i1,	%o0,	%i0
	brnz,a	%i6,	loop_358
	fmovrse	%o3,	%f21,	%f5
	fxnor	%f4,	%f10,	%f6
	stbar
loop_358:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g3,	%o6,	%i4
	fmovrsne	%g5,	%f14,	%f7
	movrne	%l0,	0x152,	%l2
	movl	%xcc,	%g7,	%i2
	addcc	%l4,	0x1532,	%l6
	udivcc	%g6,	0x1752,	%i3
	fcmpne16	%f10,	%f6,	%l1
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x15
	edge16n	%l5,	%i5,	%o1
	array16	%o5,	%l3,	%g2
	sub	%g4,	0x0C3A,	%g1
	movvc	%icc,	%i7,	%o2
	set	0x50, %l6
	lduwa	[%l7 + %l6] 0x15,	%o7
	mova	%icc,	%i1,	%o0
	umul	%o4,	0x07C4,	%i6
	fmovdne	%xcc,	%f16,	%f11
	ldsb	[%l7 + 0x08],	%o3
	sra	%i0,	%o6,	%i4
	set	0x70, %i7
	ldstuba	[%l7 + %i7] 0x18,	%g5
	fcmpeq16	%f26,	%f28,	%g3
	movcc	%xcc,	%l2,	%l0
	alignaddr	%i2,	%g7,	%l4
	fpadd16	%f18,	%f2,	%f0
	be	%icc,	loop_359
	movl	%icc,	%g6,	%l6
	brz	%l1,	loop_360
	tleu	%icc,	0x5
loop_359:
	fbule,a	%fcc0,	loop_361
	fcmpne16	%f28,	%f4,	%i3
loop_360:
	andncc	%l5,	%i5,	%o5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l3,	%o1
loop_361:
	udiv	%g2,	0x1E0A,	%g4
	set	0x40, %g6
	lduha	[%l7 + %g6] 0x15,	%i7
	tvc	%xcc,	0x2
	bvc	%icc,	loop_362
	nop
	setx	0x7066A9EA10783ED7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	udivx	%g1,	0x0621,	%o2
	tle	%xcc,	0x0
loop_362:
	edge32	%o7,	%o0,	%o4
	fmovsleu	%icc,	%f27,	%f7
	movleu	%xcc,	%i6,	%o3
	edge16n	%i1,	%o6,	%i0
	fmovdneg	%icc,	%f26,	%f7
	alignaddrl	%g5,	%i4,	%g3
	addcc	%l2,	0x101D,	%l0
	for	%f22,	%f28,	%f24
	fcmpne16	%f4,	%f24,	%i2
	movneg	%icc,	%g7,	%l4
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
	edge16n	%g6,	%i3,	%l1
	bleu,a,pt	%xcc,	loop_363
	edge32l	%i5,	%o5,	%l5
	fandnot2	%f24,	%f28,	%f8
	flush	%l7 + 0x0C
loop_363:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x08] %asi,	%l3
	edge16	%o1,	%g2,	%i7
	brlez,a	%g4,	loop_364
	ldsb	[%l7 + 0x19],	%g1
	fbue,a	%fcc3,	loop_365
	sth	%o2,	[%l7 + 0x12]
loop_364:
	alignaddr	%o0,	%o7,	%i6
	alignaddr	%o3,	%o4,	%o6
loop_365:
	and	%i0,	0x0995,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%i1,	%i4
	tle	%xcc,	0x1
	fmovsleu	%xcc,	%f2,	%f3
	movcs	%xcc,	%g3,	%l2
	brlez	%l0,	loop_366
	fpadd16s	%f13,	%f30,	%f31
	fornot2s	%f30,	%f1,	%f22
	smulcc	%g7,	%i2,	%l4
loop_366:
	tle	%xcc,	0x7
	add	%l6,	0x1136,	%g6
	fmovrsgz	%i3,	%f27,	%f16
	ldd	[%l7 + 0x18],	%f30
	tge	%xcc,	0x4
	edge16l	%l1,	%o5,	%i5
	add	%l5,	0x1909,	%o1
	taddcc	%l3,	0x1B5F,	%g2
	or	%i7,	0x1021,	%g1
	fpsub16s	%f0,	%f1,	%f13
	ldx	[%l7 + 0x60],	%o2
	fpack16	%f22,	%f2
	tvc	%icc,	0x5
	fcmple32	%f24,	%f6,	%g4
	ta	%icc,	0x3
	fmovsle	%xcc,	%f1,	%f8
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x54] %asi,	%o0
	xnorcc	%i6,	0x1812,	%o7
	edge16n	%o4,	%o6,	%o3
	fnors	%f23,	%f25,	%f16
	mulx	%g5,	%i0,	%i1
	movge	%xcc,	%g3,	%i4
	fblg,a	%fcc2,	loop_367
	ldstub	[%l7 + 0x55],	%l0
	edge8ln	%l2,	%g7,	%i2
	tneg	%xcc,	0x1
loop_367:
	fmovrsgez	%l6,	%f28,	%f22
	ldsh	[%l7 + 0x6A],	%g6
	nop
	set	0x79, %i2
	ldsb	[%l7 + %i2],	%l4
	movcc	%xcc,	%l1,	%o5
	sub	%i3,	0x062C,	%l5
	sub	%o1,	%i5,	%g2
	edge32n	%i7,	%g1,	%o2
	movrne	%g4,	%l3,	%o0
	brlz	%i6,	loop_368
	xorcc	%o7,	%o6,	%o3
	tpos	%xcc,	0x2
	brlz	%g5,	loop_369
loop_368:
	fornot1s	%f16,	%f17,	%f17
	tl	%xcc,	0x0
	tg	%xcc,	0x4
loop_369:
	tle	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o4,	0x1AE7,	%i1
	bneg,a,pn	%icc,	loop_370
	andcc	%i0,	%g3,	%i4
	sth	%l0,	[%l7 + 0x10]
	ldsw	[%l7 + 0x0C],	%g7
loop_370:
	andncc	%l2,	%i2,	%l6
	fmovsvs	%xcc,	%f25,	%f18
	tvc	%xcc,	0x0
	udivx	%l4,	0x09F2,	%l1
	fmovdleu	%icc,	%f11,	%f10
	edge32ln	%o5,	%i3,	%l5
	fmovsvs	%icc,	%f3,	%f17
	edge8	%o1,	%i5,	%g2
	fbne,a	%fcc3,	loop_371
	subccc	%g6,	0x1353,	%i7
	te	%xcc,	0x4
	umulcc	%o2,	%g1,	%g4
loop_371:
	orcc	%l3,	%o0,	%i6
	movpos	%icc,	%o7,	%o3
	sdivx	%o6,	0x096E,	%o4
	srax	%g5,	%i1,	%g3
	movgu	%icc,	%i4,	%i0
	xor	%l0,	0x01EF,	%g7
	smul	%i2,	0x0928,	%l6
	andcc	%l4,	0x1531,	%l1
	movgu	%icc,	%l2,	%i3
	alignaddrl	%o5,	%o1,	%l5
	bvc,a,pt	%xcc,	loop_372
	fmovrdgez	%i5,	%f6,	%f12
	fpsub16	%f2,	%f18,	%f30
	bpos,a,pn	%xcc,	loop_373
loop_372:
	movgu	%icc,	%g2,	%g6
	tsubcctv	%i7,	0x0EA6,	%g1
	set	0x77, %i1
	ldsba	[%l7 + %i1] 0x19,	%g4
loop_373:
	fnot1	%f24,	%f6
	movrgz	%o2,	0x112,	%o0
	fmovsa	%icc,	%f12,	%f18
	tl	%xcc,	0x0
	bl,a	%xcc,	loop_374
	fbo	%fcc3,	loop_375
	tge	%xcc,	0x5
	fmovd	%f14,	%f20
loop_374:
	fors	%f23,	%f19,	%f4
loop_375:
	prefetch	[%l7 + 0x14],	 0x1
	brlez	%i6,	loop_376
	tsubcctv	%l3,	0x0668,	%o7
	addccc	%o6,	%o4,	%o3
	sub	%i1,	%g3,	%g5
loop_376:
	edge8ln	%i4,	%l0,	%i0
	tn	%icc,	0x2
	nop
	setx	0x60CD5E9E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x5610DC71,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f22,	%f12
	set	0x29, %g4
	ldstuba	[%l7 + %g4] 0x89,	%g7
	fpack32	%f24,	%f8,	%f2
	add	%i2,	0x0C87,	%l6
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%l1
	sub	%l2,	0x1226,	%i3
	nop
	setx	loop_377,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8ln	%o5,	%l4,	%l5
	fmul8x16	%f2,	%f24,	%f22
	fornot2	%f4,	%f0,	%f8
loop_377:
	movneg	%xcc,	%i5,	%g2
	st	%f21,	[%l7 + 0x40]
	wr	%g0,	0x5f,	%asi
	stxa	%o1,	[%g0 + 0x0] %asi
	subcc	%i7,	%g1,	%g4
	edge8	%g6,	%o0,	%o2
	movne	%xcc,	%l3,	%o7
	fmovdvs	%xcc,	%f26,	%f10
	sethi	0x0767,	%i6
	fandnot1s	%f2,	%f20,	%f17
	ldsw	[%l7 + 0x1C],	%o6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x66] %asi,	%o4
	movrgz	%i1,	0x0FA,	%g3
	nop
	set	0x1E, %o7
	ldstub	[%l7 + %o7],	%g5
	sub	%i4,	%o3,	%i0
	alignaddrl	%g7,	%i2,	%l6
	nop
	setx	loop_378,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmple16	%f0,	%f24,	%l1
	sdivcc	%l2,	0x1542,	%i3
	bge,a	loop_379
loop_378:
	fmovdn	%icc,	%f24,	%f18
	movcs	%icc,	%o5,	%l4
	sllx	%l5,	%i5,	%g2
loop_379:
	fmul8x16al	%f3,	%f0,	%f30
	tvc	%icc,	0x5
	tn	%xcc,	0x4
	nop
	setx	0xA0D0579D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xF9547845,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f30,	%f0
	nop
	setx	0xB69E4D13,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f4
	fpadd16	%f10,	%f0,	%f12
	fmovsvc	%xcc,	%f31,	%f21
	movvc	%xcc,	%o1,	%i7
	smul	%g1,	%l0,	%g6
	tpos	%xcc,	0x2
	addcc	%g4,	%o0,	%o2
	sdivcc	%o7,	0x110D,	%i6
	bneg,pn	%xcc,	loop_380
	fcmple32	%f12,	%f4,	%o6
	sir	0x0BF6
	fornot1s	%f9,	%f11,	%f21
loop_380:
	call	loop_381
	addccc	%l3,	0x0C1E,	%i1
	fnegs	%f8,	%f15
	ldd	[%l7 + 0x50],	%f2
loop_381:
	nop
	setx	loop_382,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fors	%f25,	%f21,	%f2
	brz	%o4,	loop_383
	te	%icc,	0x5
loop_382:
	fnegs	%f18,	%f3
	fmovsneg	%icc,	%f24,	%f26
loop_383:
	addc	%g3,	%i4,	%o3
	stbar
	tneg	%xcc,	0x0
	tpos	%icc,	0x0
	fcmpgt16	%f26,	%f4,	%g5
	subcc	%g7,	%i2,	%i0
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x38] %asi,	%l1
	nop
	fitos	%f1,	%f21
	movle	%xcc,	%l2,	%l6
	fnot1	%f22,	%f10
	movne	%icc,	%o5,	%i3
	nop
	fitos	%f3,	%f14
	fstod	%f14,	%f24
	fbe,a	%fcc3,	loop_384
	fpsub32	%f0,	%f28,	%f8
	fmovsl	%xcc,	%f13,	%f28
	andcc	%l5,	0x0059,	%l4
loop_384:
	sdivcc	%i5,	0x07EB,	%o1
	wr	%g0,	0x19,	%asi
	sta	%f6,	[%l7 + 0x18] %asi
	fbue	%fcc3,	loop_385
	stw	%g2,	[%l7 + 0x5C]
	set	0x26, %i4
	lduha	[%l7 + %i4] 0x80,	%g1
loop_385:
	fmovsgu	%icc,	%f3,	%f18
	ldsh	[%l7 + 0x26],	%i7
	fxors	%f15,	%f24,	%f19
	fmovrslez	%l0,	%f23,	%f16
	ble,a,pn	%icc,	loop_386
	fbne,a	%fcc1,	loop_387
	add	%g6,	0x0C02,	%g4
	fbl	%fcc2,	loop_388
loop_386:
	subc	%o0,	%o7,	%i6
loop_387:
	popc	%o6,	%l3
	tg	%icc,	0x0
loop_388:
	tcs	%icc,	0x2
	tsubcc	%o2,	%o4,	%i1
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	set	0x30, %l2
	prefetcha	[%l7 + %l2] 0x81,	 0x3
	fcmpne32	%f18,	%f20,	%i4
	array32	%g5,	%g7,	%i2
	tpos	%xcc,	0x2
	fmul8ulx16	%f12,	%f0,	%f18
	ldsh	[%l7 + 0x1E],	%i0
	fbul	%fcc0,	loop_389
	edge8l	%o3,	%l1,	%l2
	fmovdg	%xcc,	%f9,	%f6
	movle	%icc,	%o5,	%l6
loop_389:
	edge16l	%l5,	%i3,	%l4
	fandnot2	%f12,	%f18,	%f16
	fbule,a	%fcc2,	loop_390
	st	%f23,	[%l7 + 0x2C]
	ldsw	[%l7 + 0x20],	%o1
	mova	%xcc,	%g2,	%g1
loop_390:
	movge	%icc,	%i7,	%i5
	subcc	%l0,	0x1754,	%g6
	movcs	%xcc,	%o0,	%g4
	xnor	%i6,	0x0173,	%o6
	fmuld8ulx16	%f18,	%f8,	%f22
	srax	%l3,	%o7,	%o4
	wr	%g0,	0x10,	%asi
	sta	%f12,	[%l7 + 0x50] %asi
	umulcc	%i1,	0x0B17,	%o2
	mulscc	%g3,	0x0033,	%g5
	brgez,a	%g7,	loop_391
	mulscc	%i2,	%i0,	%o3
	tsubcctv	%l1,	0x0497,	%i4
	tvs	%xcc,	0x6
loop_391:
	nop
	setx	loop_392,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andncc	%l2,	%o5,	%l5
	fmovrdgz	%i3,	%f26,	%f18
	swap	[%l7 + 0x50],	%l6
loop_392:
	movpos	%icc,	%l4,	%g2
	add	%o1,	%i7,	%i5
	fcmpeq16	%f24,	%f12,	%l0
	ld	[%l7 + 0x44],	%f13
	edge8n	%g6,	%o0,	%g4
	sdiv	%g1,	0x0CF9,	%o6
	bcc	loop_393
	fmovsgu	%icc,	%f4,	%f14
	nop
	fitod	%f8,	%f30
	fdtox	%f30,	%f10
	addccc	%i6,	%o7,	%o4
loop_393:
	tcs	%icc,	0x0
	swap	[%l7 + 0x78],	%l3
	mulscc	%i1,	%g3,	%g5
	edge8l	%g7,	%o2,	%i0
	subc	%i2,	%l1,	%i4
	fmovrslz	%o3,	%f1,	%f18
	bleu,pn	%icc,	loop_394
	xnorcc	%l2,	%l5,	%o5
	subcc	%i3,	0x0170,	%l4
	edge16l	%g2,	%l6,	%o1
loop_394:
	movleu	%icc,	%i5,	%i7
	udivx	%l0,	0x0978,	%g6
	movcs	%xcc,	%g4,	%o0
	tcc	%xcc,	0x3
	tg	%xcc,	0x1
	movg	%icc,	%o6,	%i6
	ldsw	[%l7 + 0x6C],	%o7
	edge16n	%g1,	%l3,	%i1
	fbug,a	%fcc1,	loop_395
	addc	%g3,	%g5,	%o4
	array8	%g7,	%o2,	%i0
	sdiv	%l1,	0x0CBE,	%i2
loop_395:
	fpadd16s	%f4,	%f3,	%f17
	fbne	%fcc3,	loop_396
	stbar
	fbul	%fcc2,	loop_397
	lduw	[%l7 + 0x28],	%i4
loop_396:
	fsrc1s	%f26,	%f19
	fexpand	%f10,	%f0
loop_397:
	andcc	%l2,	%l5,	%o3
	add	%i3,	0x10B1,	%o5
	fxors	%f13,	%f14,	%f8
	nop
	setx	0x8B9B79E46ED9E79A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xFEAE0A515B568803,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f4,	%f4
	edge32	%l4,	%g2,	%o1
	nop
	fitod	%f13,	%f24
	orcc	%i5,	%i7,	%l0
	set	0x26, %o2
	ldsba	[%l7 + %o2] 0x19,	%g6
	fmovdg	%xcc,	%f25,	%f6
	fnors	%f14,	%f12,	%f2
	movcs	%icc,	%g4,	%l6
	tgu	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o6,	0x1E8B,	%o0
	fbuge	%fcc2,	loop_398
	xor	%o7,	0x096E,	%i6
	addcc	%g1,	0x121B,	%i1
	movcs	%xcc,	%l3,	%g5
loop_398:
	movle	%xcc,	%o4,	%g3
	movcs	%icc,	%g7,	%o2
	bpos,a,pn	%icc,	loop_399
	fmovrslz	%i0,	%f30,	%f7
	movvc	%icc,	%l1,	%i4
	st	%f31,	[%l7 + 0x2C]
loop_399:
	mulscc	%l2,	0x160A,	%i2
	nop
	setx	0xD395D17A8C5B00F3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xD08AD8F657757932,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f30,	%f30
	sll	%o3,	0x14,	%l5
	mova	%icc,	%i3,	%o5
	fpadd32	%f18,	%f20,	%f2
	tneg	%icc,	0x7
	addccc	%l4,	%o1,	%g2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%l0
	bleu,a,pt	%icc,	loop_400
	pdist	%f16,	%f6,	%f0
	ble,a	%icc,	loop_401
	fpadd16	%f8,	%f8,	%f16
loop_400:
	fors	%f21,	%f15,	%f3
	mulx	%g6,	%g4,	%i5
loop_401:
	movrgez	%l6,	%o0,	%o7
	tvc	%icc,	0x5
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x46] %asi,	%o6
	tleu	%icc,	0x7
	bpos,a	loop_402
	sdivcc	%i6,	0x0703,	%i1
	movge	%icc,	%l3,	%g5
	movne	%xcc,	%o4,	%g1
loop_402:
	fmovdvs	%icc,	%f8,	%f27
	edge16n	%g7,	%g3,	%i0
	fmovdg	%xcc,	%f6,	%f3
	movrlz	%l1,	0x368,	%i4
	umul	%o2,	0x07D6,	%i2
	fbo,a	%fcc1,	loop_403
	orn	%o3,	0x0921,	%l2
	sllx	%l5,	%o5,	%i3
	sll	%l4,	0x03,	%g2
loop_403:
	ldub	[%l7 + 0x17],	%o1
	fmovs	%f23,	%f25
	nop
	setx	0x6CE919E7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f5
	swap	[%l7 + 0x1C],	%i7
	fcmple16	%f30,	%f30,	%l0
	nop
	fitod	%f8,	%f16
	fdtos	%f16,	%f15
	orcc	%g6,	0x050D,	%g4
	set	0x37, %i0
	lduba	[%l7 + %i0] 0x80,	%i5
	tcc	%xcc,	0x5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l6,	%o7
	fba	%fcc0,	loop_404
	nop
	set	0x60, %g3
	stx	%o6,	[%l7 + %g3]
	fnot1	%f14,	%f30
	fsrc2	%f6,	%f2
loop_404:
	edge8	%o0,	%i1,	%l3
	tsubcctv	%g5,	%o4,	%i6
	tne	%xcc,	0x3
	and	%g7,	%g1,	%g3
	bpos	loop_405
	brlz,a	%l1,	loop_406
	movcc	%icc,	%i4,	%i0
	stw	%i2,	[%l7 + 0x7C]
loop_405:
	movl	%xcc,	%o2,	%o3
loop_406:
	tsubcctv	%l5,	0x1B87,	%o5
	fmul8sux16	%f18,	%f22,	%f28
	orncc	%i3,	0x1C02,	%l4
	fnot1	%f28,	%f8
	nop
	setx	0xEE90C923A0725264,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fmovdgu	%icc,	%f23,	%f25
	ld	[%l7 + 0x40],	%f15
	edge8ln	%l2,	%o1,	%i7
	taddcc	%g2,	0x0EC9,	%l0
	tle	%xcc,	0x4
	fmovspos	%icc,	%f23,	%f17
	subc	%g4,	0x124A,	%g6
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x4C] %asi,	%i5
	movpos	%icc,	%o7,	%l6
	subc	%o0,	%o6,	%l3
	fpack32	%f18,	%f26,	%f12
	wr	%g0,	0xeb,	%asi
	stxa	%i1,	[%l7 + 0x50] %asi
	membar	#Sync
	nop
	setx	0xEE4015787064D077,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	sir	0x182B
	tvc	%xcc,	0x2
	edge16	%o4,	%g5,	%g7
	tcc	%xcc,	0x5
	movrlz	%g1,	%g3,	%l1
	movrlez	%i6,	0x0D0,	%i4
	fblg	%fcc2,	loop_407
	fmovsge	%xcc,	%f12,	%f10
	fcmpne16	%f16,	%f6,	%i0
	addccc	%o2,	%i2,	%l5
loop_407:
	sra	%o5,	%o3,	%i3
	flush	%l7 + 0x28
	ld	[%l7 + 0x64],	%f28
	nop
	setx	loop_408,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%l2,	0x02,	%o1
	stx	%i7,	[%l7 + 0x38]
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x40] %asi,	%l4
loop_408:
	movneg	%icc,	%g2,	%l0
	fmovdle	%icc,	%f10,	%f16
	movl	%xcc,	%g6,	%g4
	nop
	set	0x18, %l3
	std	%f6,	[%l7 + %l3]
	xnor	%i5,	0x1053,	%l6
	wr	%g0,	0x27,	%asi
	stba	%o0,	[%l7 + 0x1A] %asi
	membar	#Sync
	edge32n	%o7,	%o6,	%l3
	movge	%icc,	%i1,	%g5
	sdivcc	%g7,	0x0ED9,	%g1
	popc	0x10D7,	%o4
	movcs	%xcc,	%g3,	%l1
	fmovde	%icc,	%f11,	%f16
	tsubcc	%i6,	0x151D,	%i0
	sdivx	%o2,	0x1248,	%i4
	movcc	%xcc,	%l5,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%i2,	%f0,	%f12
	mulx	%i3,	0x0B3C,	%o3
	wr	%g0,	0x19,	%asi
	stxa	%o1,	[%l7 + 0x10] %asi
	fmovrdlez	%l2,	%f22,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i7,	0x080A,	%l4
	and	%g2,	0x118A,	%g6
	bleu,a,pt	%xcc,	loop_409
	taddcctv	%l0,	%i5,	%g4
	mulx	%o0,	%o7,	%o6
	sdiv	%l6,	0x0027,	%l3
loop_409:
	tle	%icc,	0x4
	tvc	%icc,	0x5
	addcc	%g5,	%g7,	%i1
	fmovrdlez	%o4,	%f6,	%f20
	edge16ln	%g3,	%g1,	%l1
	bl	loop_410
	movvs	%icc,	%i0,	%o2
	fbule,a	%fcc1,	loop_411
	std	%f0,	[%l7 + 0x08]
loop_410:
	fbl	%fcc3,	loop_412
	taddcc	%i4,	0x0262,	%i6
loop_411:
	brlz	%o5,	loop_413
	sll	%i2,	%i3,	%l5
loop_412:
	edge16l	%o1,	%l2,	%i7
	sllx	%o3,	0x0E,	%g2
loop_413:
	subc	%g6,	0x0E54,	%l4
	umulcc	%i5,	0x0C44,	%l0
	xorcc	%o0,	0x190D,	%g4
	udivx	%o6,	0x1727,	%l6
	fnegs	%f21,	%f26
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x40] %asi,	%f7
	movcs	%xcc,	%l3,	%g5
	fble	%fcc2,	loop_414
	srlx	%g7,	%o7,	%i1
	fzeros	%f12
	movge	%icc,	%o4,	%g3
loop_414:
	nop
	setx	0x62C7E097EFCBE370,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xA16A09CFFB61A412,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f6,	%f20
	movvs	%xcc,	%g1,	%i0
	nop
	setx	loop_415,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8ln	%o2,	%i4,	%l1
	fors	%f22,	%f13,	%f13
	subccc	%o5,	0x0CAC,	%i2
loop_415:
	fmovspos	%icc,	%f17,	%f15
	array32	%i6,	%l5,	%o1
	fcmpgt16	%f0,	%f12,	%i3
	ba,a,pt	%icc,	loop_416
	tge	%xcc,	0x3
	tg	%xcc,	0x6
	fcmpne32	%f4,	%f14,	%i7
loop_416:
	brgz,a	%o3,	loop_417
	brz,a	%g2,	loop_418
	tn	%icc,	0x4
	wr	%g0,	0x20,	%asi
	stxa	%g6,	[%g0 + 0x8] %asi
loop_417:
	edge8	%l2,	%i5,	%l4
loop_418:
	nop
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x18,	 0x1
	smul	%g4,	%o0,	%o6
	movrgz	%l3,	%g5,	%l6
	movneg	%xcc,	%o7,	%g7
	subcc	%o4,	0x1AFE,	%i1
	nop
	set	0x3E, %g1
	ldsb	[%l7 + %g1],	%g1
	sdivx	%g3,	0x0E39,	%o2
	fmovda	%xcc,	%f31,	%f9
	fmovrse	%i4,	%f9,	%f11
	xnorcc	%i0,	0x0669,	%o5
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x3E] %asi,	%l1
	edge16l	%i2,	%l5,	%i6
	nop
	fitos	%f7,	%f30
	fstoi	%f30,	%f12
	fxnors	%f4,	%f0,	%f22
	sdivcc	%o1,	0x01AD,	%i7
	fmovdcc	%xcc,	%f1,	%f30
	fpack32	%f12,	%f30,	%f12
	sdivx	%o3,	0x0A69,	%g2
	movvc	%xcc,	%g6,	%i3
	fble,a	%fcc2,	loop_419
	fnors	%f2,	%f10,	%f17
	tsubcctv	%i5,	%l2,	%l4
	fpackfix	%f20,	%f20
loop_419:
	fmovdcc	%xcc,	%f30,	%f13
	fpsub32s	%f0,	%f8,	%f28
	srl	%l0,	0x11,	%o0
	fmovsle	%icc,	%f11,	%f15
	edge8	%g4,	%o6,	%g5
	fmovdvc	%icc,	%f29,	%f28
	lduw	[%l7 + 0x2C],	%l6
	subcc	%l3,	%g7,	%o7
	fmovdpos	%icc,	%f24,	%f20
	nop
	setx	0xF168EC3E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xFAE8ED4E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f8,	%f28
	fmovdne	%icc,	%f9,	%f21
	srl	%i1,	0x19,	%o4
	fabsd	%f12,	%f16
	xnorcc	%g1,	%g3,	%o2
	fsrc2s	%f12,	%f28
	addccc	%i4,	0x03C9,	%o5
	movcs	%xcc,	%l1,	%i0
	mulscc	%i2,	%i6,	%o1
	edge16	%i7,	%l5,	%g2
	sra	%o3,	0x1B,	%i3
	wr	%g0,	0x11,	%asi
	stxa	%g6,	[%l7 + 0x10] %asi
	fpackfix	%f24,	%f28
	srax	%i5,	%l2,	%l4
	array32	%l0,	%o0,	%g4
	addc	%g5,	0x1DEC,	%o6
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%l6
	fmovsn	%icc,	%f10,	%f5
	udivcc	%g7,	0x0B09,	%l3
	movne	%icc,	%o7,	%i1
	edge8	%o4,	%g1,	%o2
	tcs	%icc,	0x6
	ldub	[%l7 + 0x5D],	%g3
	wr	%g0,	0x23,	%asi
	stba	%i4,	[%l7 + 0x7C] %asi
	membar	#Sync
	sdiv	%o5,	0x1458,	%l1
	srl	%i2,	%i0,	%o1
	sdivx	%i7,	0x1DEF,	%i6
	andn	%g2,	0x1400,	%o3
	umul	%l5,	0x078F,	%g6
	brgz,a	%i5,	loop_420
	fnot1	%f12,	%f22
	ble,a,pn	%xcc,	loop_421
	fblg,a	%fcc1,	loop_422
loop_420:
	xnor	%l2,	0x1C4F,	%i3
	movle	%icc,	%l4,	%l0
loop_421:
	tvc	%icc,	0x5
loop_422:
	brlez,a	%g4,	loop_423
	be,a	loop_424
	fmovsneg	%icc,	%f15,	%f18
	tvc	%xcc,	0x7
loop_423:
	sir	0x1AA4
loop_424:
	fabss	%f13,	%f31
	edge16l	%o0,	%g5,	%l6
	tne	%icc,	0x5
	alignaddrl	%g7,	%o6,	%o7
	tne	%xcc,	0x2
	fblg	%fcc1,	loop_425
	membar	0x2D
	xnor	%l3,	0x0C38,	%i1
	tl	%icc,	0x0
loop_425:
	movrgz	%g1,	0x29E,	%o2
	orcc	%o4,	0x0A05,	%i4
	bvc,a,pn	%xcc,	loop_426
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x14DA
	tgu	%xcc,	0x7
loop_426:
	swap	[%l7 + 0x7C],	%g3
	fsrc2	%f2,	%f4
	set	0x56, %o0
	lduha	[%l7 + %o0] 0x0c,	%l1
	flush	%l7 + 0x58
	fors	%f8,	%f19,	%f5
	and	%i2,	0x0FF5,	%o5
	mova	%xcc,	%i0,	%i7
	te	%xcc,	0x3
	udivcc	%i6,	0x087A,	%o1
	movleu	%icc,	%o3,	%g2
	edge16n	%l5,	%g6,	%i5
	nop
	setx	0xFFA783F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x69793548,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f31,	%f0
	movrlez	%i3,	0x3A8,	%l4
	fbug	%fcc2,	loop_427
	addc	%l0,	%g4,	%l2
	ldd	[%l7 + 0x30],	%f30
	edge16l	%o0,	%g5,	%l6
loop_427:
	tvs	%xcc,	0x2
	movge	%icc,	%g7,	%o6
	tsubcctv	%o7,	0x1559,	%i1
	tvs	%xcc,	0x6
	tne	%xcc,	0x6
	nop
	fitos	%f28,	%f7
	andcc	%l3,	%o2,	%o4
	sir	0x1EF7
	addcc	%g1,	%g3,	%l1
	edge32ln	%i2,	%i4,	%i0
	ld	[%l7 + 0x10],	%f3
	set	0x7E, %l0
	stba	%i7,	[%l7 + %l0] 0x14
	subcc	%i6,	0x0228,	%o1
	alignaddr	%o5,	%g2,	%l5
	sdivx	%g6,	0x0B0B,	%i5
	udivcc	%i3,	0x11B2,	%l4
	fxor	%f0,	%f14,	%f10
	tgu	%xcc,	0x4
	alignaddr	%o3,	%l0,	%g4
	xorcc	%l2,	%o0,	%l6
	movneg	%icc,	%g5,	%o6
	fmul8x16au	%f22,	%f28,	%f18
	edge8	%g7,	%o7,	%l3
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x32] %asi,	%o2
	fornot1	%f12,	%f12,	%f22
	subc	%o4,	0x16E7,	%i1
	fmovscs	%icc,	%f29,	%f9
	bn,a,pn	%icc,	loop_428
	sdivcc	%g3,	0x17D8,	%g1
	edge8ln	%i2,	%l1,	%i4
	umul	%i7,	0x1BC1,	%i6
loop_428:
	fnot1	%f0,	%f8
	ldsb	[%l7 + 0x3D],	%i0
	fmovdcc	%xcc,	%f2,	%f8
	umul	%o5,	%o1,	%l5
	fmovsl	%xcc,	%f26,	%f24
	brz	%g6,	loop_429
	movvs	%xcc,	%g2,	%i5
	movleu	%icc,	%l4,	%o3
	movge	%xcc,	%i3,	%l0
loop_429:
	tge	%icc,	0x5
	ldsb	[%l7 + 0x16],	%g4
	nop
	fitos	%f0,	%f8
	fstod	%f8,	%f30
	set	0x25, %o4
	ldstuba	[%l7 + %o4] 0x04,	%o0
	edge8l	%l2,	%g5,	%l6
	umulcc	%g7,	0x1343,	%o7
	fbue,a	%fcc3,	loop_430
	tgu	%xcc,	0x7
	fmovrdne	%l3,	%f10,	%f24
	fzeros	%f7
loop_430:
	mulscc	%o6,	%o4,	%i1
	fsrc1	%f10,	%f28
	tleu	%xcc,	0x0
	movcs	%xcc,	%o2,	%g3
	nop
	setx	0x71C989E1804C7483,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%g1,	%f3,	%f12
	fmovsvs	%xcc,	%f28,	%f16
	movn	%xcc,	%l1,	%i4
	ldd	[%l7 + 0x38],	%f26
	tle	%icc,	0x7
	edge32n	%i7,	%i2,	%i6
	bge,pt	%icc,	loop_431
	nop
	setx	0xD5E34E6A52A7C6C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f16
	ba,a	%xcc,	loop_432
	fmovscc	%xcc,	%f10,	%f7
loop_431:
	stw	%o5,	[%l7 + 0x40]
	fandnot2	%f2,	%f22,	%f24
loop_432:
	sth	%o1,	[%l7 + 0x36]
	set	0x4C, %l5
	lda	[%l7 + %l5] 0x88,	%f16
	tvs	%icc,	0x4
	smulcc	%i0,	0x18F7,	%l5
	sll	%g2,	%g6,	%i5
	brlz,a	%l4,	loop_433
	ldsb	[%l7 + 0x3F],	%i3
	tvs	%icc,	0x2
	movrgz	%o3,	%g4,	%o0
loop_433:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f28,	%f16
	andcc	%l0,	0x14A7,	%g5
	fble,a	%fcc0,	loop_434
	addc	%l6,	%l2,	%g7
	srl	%o7,	0x11,	%o6
	bne,a,pt	%xcc,	loop_435
loop_434:
	movneg	%icc,	%l3,	%i1
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%f18
	swap	[%l7 + 0x3C],	%o2
loop_435:
	brlz	%g3,	loop_436
	smul	%o4,	0x133C,	%l1
	umulcc	%i4,	0x1E96,	%g1
	fpsub32s	%f0,	%f23,	%f30
loop_436:
	movn	%xcc,	%i7,	%i6
	movrgez	%i2,	%o5,	%o1
	set	0x4A, %i6
	lduha	[%l7 + %i6] 0x80,	%l5
	set	0x28, %o5
	ldxa	[%l7 + %o5] 0x04,	%i0
	tpos	%xcc,	0x1
	movrlz	%g2,	%g6,	%l4
	tvs	%icc,	0x2
	fcmple16	%f18,	%f0,	%i3
	tleu	%icc,	0x5
	sdiv	%o3,	0x0480,	%i5
	fands	%f23,	%f28,	%f27
	taddcctv	%o0,	%g4,	%g5
	edge16n	%l0,	%l6,	%l2
	subccc	%o7,	%g7,	%l3
	nop
	setx	0xF9E6F26E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x1B34F0F9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f19,	%f26
	tsubcc	%o6,	%o2,	%g3
	sra	%o4,	0x13,	%l1
	andncc	%i1,	%g1,	%i7
	fmovrslez	%i4,	%f28,	%f16
	fand	%f0,	%f4,	%f0
	fbug,a	%fcc3,	loop_437
	fone	%f10
	subc	%i6,	%o5,	%i2
	edge32ln	%l5,	%o1,	%i0
loop_437:
	bgu,a	%xcc,	loop_438
	nop
	fitos	%f14,	%f9
	fstod	%f9,	%f20
	ldsw	[%l7 + 0x68],	%g6
	bvc	loop_439
loop_438:
	movn	%xcc,	%g2,	%l4
	fnot2s	%f8,	%f10
	fmovrsne	%i3,	%f8,	%f11
loop_439:
	movvc	%xcc,	%i5,	%o3
	sub	%o0,	%g5,	%g4
	bcs	%icc,	loop_440
	fmovsle	%xcc,	%f29,	%f2
	fandnot2s	%f29,	%f17,	%f20
	bneg,a	loop_441
loop_440:
	ld	[%l7 + 0x3C],	%f15
	fmovdleu	%icc,	%f27,	%f15
	bshuffle	%f6,	%f2,	%f2
loop_441:
	fmovdg	%xcc,	%f23,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x2C3A3861D9EF1C71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x529F0E939A8F1BBB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f22,	%f16
	fbule	%fcc3,	loop_442
	tge	%xcc,	0x6
	fba,a	%fcc3,	loop_443
	edge8	%l6,	%l0,	%l2
loop_442:
	bg	loop_444
	addc	%g7,	0x0EC4,	%l3
loop_443:
	tcs	%xcc,	0x6
	tsubcctv	%o6,	0x1C16,	%o7
loop_444:
	tvs	%xcc,	0x1
	tl	%icc,	0x5
	movg	%xcc,	%o2,	%g3
	fmovspos	%xcc,	%f19,	%f25
	taddcc	%o4,	0x1B59,	%l1
	addcc	%g1,	0x1CD8,	%i1
	fbule	%fcc0,	loop_445
	edge8ln	%i7,	%i6,	%i4
	edge8l	%o5,	%i2,	%l5
	nop
	fitod	%f0,	%f24
	fdtoi	%f24,	%f21
loop_445:
	fones	%f3
	bg,pt	%icc,	loop_446
	tvs	%icc,	0x6
	nop
	fitod	%f6,	%f20
	fdtox	%f20,	%f18
	ta	%xcc,	0x1
loop_446:
	fmovrsne	%i0,	%f20,	%f6
	taddcctv	%o1,	%g2,	%g6
	edge16	%l4,	%i5,	%o3
	nop
	setx	loop_447,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0xF8AA03F2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xBCE13D19,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f28,	%f8
	st	%f10,	[%l7 + 0x7C]
	taddcctv	%i3,	%g5,	%g4
loop_447:
	ble,pt	%xcc,	loop_448
	edge32	%o0,	%l6,	%l2
	add	%l0,	0x163E,	%l3
	sll	%o6,	0x17,	%o7
loop_448:
	fmovdn	%xcc,	%f2,	%f26
	edge8l	%g7,	%g3,	%o2
	move	%icc,	%o4,	%g1
	wr	%g0,	0x2b,	%asi
	stba	%i1,	[%l7 + 0x57] %asi
	membar	#Sync
	add	%i7,	%l1,	%i6
	udivcc	%i4,	0x12BB,	%i2
	andncc	%o5,	%i0,	%o1
	set	0x70, %i5
	swapa	[%l7 + %i5] 0x88,	%l5
	tl	%icc,	0x5
	umulcc	%g6,	%l4,	%i5
	or	%o3,	0x0BCA,	%i3
	orn	%g2,	%g5,	%g4
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	fbo	%fcc1,	loop_449
	and	%l6,	0x1039,	%l0
	nop
	setx	0x9F454D27,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x52BFE790,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f16,	%f27
	fbl,a	%fcc0,	loop_450
loop_449:
	movrgz	%l2,	0x056,	%l3
	ld	[%l7 + 0x54],	%f16
	bvc	loop_451
loop_450:
	nop
	fitod	%f0,	%f4
	fdtos	%f4,	%f13
	edge16	%o6,	%g7,	%g3
	edge8n	%o2,	%o4,	%o7
loop_451:
	subc	%g1,	%i7,	%i1
	orncc	%i6,	%l1,	%i2
	edge32	%i4,	%o5,	%i0
	movne	%xcc,	%l5,	%g6
	sethi	0x0FBC,	%l4
	xorcc	%i5,	%o3,	%o1
	tle	%icc,	0x4
	sub	%g2,	0x124C,	%i3
	ta	%xcc,	0x2
	set	0x108, %g2
	stxa	%g4,	[%g0 + %g2] 0x52
	subccc	%g5,	%l6,	%o0
	fmovsn	%icc,	%f8,	%f31
	brlz	%l0,	loop_452
	fmovrde	%l3,	%f18,	%f30
	sdivcc	%o6,	0x19A9,	%l2
	subccc	%g3,	%o2,	%o4
loop_452:
	tpos	%icc,	0x5
	bg,a,pt	%icc,	loop_453
	membar	0x75
	tleu	%icc,	0x1
	tn	%icc,	0x3
loop_453:
	fmovdcc	%xcc,	%f8,	%f1
	brlez	%g7,	loop_454
	movg	%xcc,	%o7,	%i7
	fpsub32	%f22,	%f20,	%f8
	smul	%g1,	%i1,	%i6
loop_454:
	sub	%i2,	%l1,	%i4
	set	0x14, %o3
	stwa	%i0,	[%l7 + %o3] 0x80
	movne	%xcc,	%l5,	%g6
	fpadd16s	%f20,	%f5,	%f14
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x50] %asi,	%f2
	tge	%icc,	0x5
	fabsd	%f2,	%f22
	subccc	%l4,	0x125C,	%o5
	nop
	fitod	%f2,	%f4
	fdtos	%f4,	%f14
	or	%i5,	0x0E10,	%o3
	bg,a	loop_455
	udivcc	%o1,	0x00E1,	%i3
	fbge	%fcc0,	loop_456
	movle	%xcc,	%g4,	%g5
loop_455:
	movrlez	%l6,	%g2,	%l0
	movcs	%xcc,	%l3,	%o6
loop_456:
	xorcc	%o0,	0x19B8,	%l2
	subc	%g3,	0x1487,	%o2
	membar	0x2C
	fsrc1s	%f29,	%f21
	fbule	%fcc3,	loop_457
	fbo	%fcc0,	loop_458
	tvc	%xcc,	0x3
	bvc,a	loop_459
loop_457:
	edge8ln	%g7,	%o4,	%o7
loop_458:
	smul	%i7,	0x066B,	%i1
	tle	%icc,	0x5
loop_459:
	andcc	%i6,	%i2,	%g1
	tn	%icc,	0x1
	fpadd32s	%f11,	%f17,	%f22
	bg,pt	%xcc,	loop_460
	edge16ln	%i4,	%l1,	%i0
	xor	%l5,	%g6,	%l4
	sethi	0x1AE6,	%o5
loop_460:
	fmovsneg	%xcc,	%f13,	%f18
	fornot2	%f8,	%f12,	%f0
	fzeros	%f5
	fmovdleu	%icc,	%f9,	%f4
	fmovdl	%icc,	%f17,	%f30
	fba,a	%fcc3,	loop_461
	movgu	%xcc,	%o3,	%i5
	wr	%g0,	0x89,	%asi
	sta	%f16,	[%l7 + 0x08] %asi
loop_461:
	fmovrsgz	%i3,	%f9,	%f28
	set	0x36, %g5
	lduba	[%l7 + %g5] 0x11,	%g4
	mulx	%g5,	%o1,	%g2
	te	%icc,	0x3
	andncc	%l0,	%l3,	%o6
	bcs,pt	%icc,	loop_462
	movge	%icc,	%o0,	%l6
	movrgez	%g3,	0x2ED,	%o2
	tn	%xcc,	0x0
loop_462:
	sth	%l2,	[%l7 + 0x66]
	edge32	%o4,	%g7,	%o7
	movle	%xcc,	%i7,	%i6
	movvc	%xcc,	%i1,	%g1
	sll	%i4,	%l1,	%i0
	sth	%l5,	[%l7 + 0x18]
	array8	%g6,	%i2,	%l4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x40] %asi,	%o5
	mulx	%o3,	0x02B1,	%i5
	fcmpgt16	%f30,	%f4,	%g4
	movrgez	%i3,	%g5,	%o1
	swap	[%l7 + 0x54],	%g2
	fpadd16s	%f22,	%f29,	%f29
	fmul8ulx16	%f10,	%f10,	%f26
	edge8ln	%l3,	%o6,	%l0
	movvc	%icc,	%l6,	%g3
	fcmpne32	%f22,	%f20,	%o2
	bcc,a,pt	%icc,	loop_463
	st	%f31,	[%l7 + 0x78]
	edge32l	%l2,	%o4,	%o0
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f0
loop_463:
	flush	%l7 + 0x4C
	bcc,a	%icc,	loop_464
	call	loop_465
	std	%f0,	[%l7 + 0x70]
	movneg	%xcc,	%g7,	%o7
loop_464:
	edge32	%i7,	%i1,	%i6
loop_465:
	movne	%icc,	%i4,	%g1
	srl	%l1,	%l5,	%i0
	xorcc	%i2,	%g6,	%l4
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x60] %asi,	%o5
	sra	%o3,	%i5,	%i3
	bn,a	loop_466
	tcs	%xcc,	0x4
	edge8ln	%g5,	%g4,	%o1
	fbue,a	%fcc0,	loop_467
loop_466:
	ldsw	[%l7 + 0x28],	%g2
	stb	%l3,	[%l7 + 0x2F]
	movpos	%icc,	%l0,	%o6
loop_467:
	ldstub	[%l7 + 0x1E],	%l6
	movleu	%icc,	%g3,	%l2
	tpos	%icc,	0x4
	flush	%l7 + 0x78
	smulcc	%o4,	0x1728,	%o2
	fmovrsne	%g7,	%f1,	%f3
	or	%o7,	%o0,	%i1
	fba	%fcc2,	loop_468
	fmuld8ulx16	%f11,	%f14,	%f14
	fbule	%fcc2,	loop_469
	fble,a	%fcc3,	loop_470
loop_468:
	add	%i7,	%i4,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_469:
	bcs,a	%icc,	loop_471
loop_470:
	alignaddr	%l1,	%g1,	%l5
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i0
loop_471:
	fzeros	%f1
	tge	%icc,	0x2
	srax	%i2,	%g6,	%l4
	srl	%o5,	0x1F,	%i5
	mulscc	%i3,	0x1391,	%o3
	fmovdleu	%icc,	%f9,	%f26
	sllx	%g5,	0x01,	%g4
	fabsd	%f18,	%f28
	udiv	%o1,	0x134F,	%g2
	ta	%icc,	0x7
	tn	%icc,	0x7
	set	0x1C, %i3
	stwa	%l0,	[%l7 + %i3] 0x88
	addccc	%o6,	%l6,	%g3
	movgu	%icc,	%l2,	%o4
	brz	%l3,	loop_472
	movcs	%xcc,	%g7,	%o7
	tvs	%xcc,	0x4
	umulcc	%o2,	0x12FD,	%i1
loop_472:
	udivx	%i7,	0x16B6,	%o0
	nop
	setx	0x83E1CA4F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x3F1EB85C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f9,	%f20
	std	%f20,	[%l7 + 0x38]
	fblg	%fcc2,	loop_473
	movrgez	%i6,	%i4,	%g1
	movrlez	%l5,	0x3B7,	%l1
	fmovs	%f23,	%f30
loop_473:
	tvs	%icc,	0x1
	be,pn	%xcc,	loop_474
	fpsub32	%f26,	%f8,	%f24
	addccc	%i2,	0x0397,	%g6
	nop
	fitos	%f7,	%f30
	fstod	%f30,	%f8
loop_474:
	movrlez	%l4,	0x34D,	%o5
	fxnor	%f26,	%f4,	%f30
	fabsd	%f20,	%f2
	fble,a	%fcc3,	loop_475
	fpsub32s	%f9,	%f29,	%f22
	bn	loop_476
	ldstub	[%l7 + 0x1A],	%i0
loop_475:
	movrgz	%i5,	0x0CE,	%o3
	mova	%icc,	%g5,	%g4
loop_476:
	edge8l	%o1,	%g2,	%i3
	flush	%l7 + 0x24
	edge16ln	%l0,	%l6,	%g3
	stx	%l2,	[%l7 + 0x48]
	movrgez	%o4,	%l3,	%o6
	fone	%f2
	movl	%xcc,	%g7,	%o2
	srlx	%i1,	0x10,	%i7
	fbe	%fcc2,	loop_477
	tn	%xcc,	0x4
	fmul8x16au	%f5,	%f6,	%f8
	fbge,a	%fcc3,	loop_478
loop_477:
	fbn	%fcc0,	loop_479
	fmovsvc	%icc,	%f11,	%f10
	tcs	%xcc,	0x1
loop_478:
	array32	%o7,	%o0,	%i6
loop_479:
	nop
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x2b,	%g0
	orcc	%i4,	0x0A86,	%l1
	nop
	fitos	%f1,	%f15
	fstox	%f15,	%f30
	fxtos	%f30,	%f2
	sllx	%i2,	%g6,	%l5
	umul	%l4,	0x0969,	%o5
	nop
	setx	0x7450E829,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x6A7428CC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f7,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i0,	0x0848,	%o3
	fandnot1s	%f13,	%f27,	%f10
	fblg	%fcc2,	loop_480
	fba,a	%fcc2,	loop_481
	udiv	%i5,	0x06FA,	%g5
	orcc	%g4,	%g2,	%o1
loop_480:
	fmovda	%icc,	%f22,	%f27
loop_481:
	fbuge,a	%fcc1,	loop_482
	sir	0x0743
	smul	%l0,	0x12D2,	%l6
	taddcc	%i3,	0x0B10,	%l2
loop_482:
	mulx	%g3,	%l3,	%o4
	ba,a	loop_483
	fmovdne	%icc,	%f27,	%f17
	fmovrdlz	%o6,	%f28,	%f8
	fmuld8ulx16	%f30,	%f31,	%f26
loop_483:
	movre	%o2,	%i1,	%g7
	umul	%i7,	0x1EDD,	%o0
	subccc	%o7,	0x09DD,	%g1
	brgez	%i4,	loop_484
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i6,	%l1,	%i2
	movrlez	%g6,	%l5,	%l4
loop_484:
	fbule	%fcc0,	loop_485
	fbug	%fcc0,	loop_486
	movge	%icc,	%i0,	%o3
	srax	%o5,	%g5,	%i5
loop_485:
	tle	%icc,	0x7
loop_486:
	add	%g2,	%g4,	%l0
	set	0x49, %l1
	stba	%l6,	[%l7 + %l1] 0xea
	membar	#Sync
	or	%i3,	0x1408,	%o1
	movn	%icc,	%g3,	%l3
	bvs,pn	%xcc,	loop_487
	ld	[%l7 + 0x5C],	%f23
	tne	%xcc,	0x0
	tne	%xcc,	0x7
loop_487:
	prefetch	[%l7 + 0x14],	 0x3
	movne	%icc,	%o4,	%o6
	edge32n	%l2,	%o2,	%g7
	edge16	%i1,	%i7,	%o0
	tneg	%icc,	0x3
	fpadd16	%f18,	%f30,	%f6
	bne	loop_488
	stbar
	bvs,pt	%icc,	loop_489
	subccc	%o7,	0x1CA4,	%g1
loop_488:
	brnz,a	%i4,	loop_490
	bcc,a	loop_491
loop_489:
	edge32	%l1,	%i6,	%g6
	nop
	setx	loop_492,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_490:
	udivcc	%l5,	0x08A3,	%i2
loop_491:
	sir	0x1441
	umulcc	%i0,	%o3,	%l4
loop_492:
	ldd	[%l7 + 0x68],	%o4
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x70] %asi,	%g4
	fmovdleu	%icc,	%f14,	%f11
	fnot2	%f26,	%f2
	wr	%g0,	0xeb,	%asi
	stxa	%g2,	[%l7 + 0x60] %asi
	membar	#Sync
	bn	%icc,	loop_493
	fpadd32	%f18,	%f30,	%f16
	fones	%f0
	fnegd	%f16,	%f22
loop_493:
	fmovdvs	%xcc,	%f20,	%f3
	ldstub	[%l7 + 0x70],	%i5
	srl	%l0,	%g4,	%i3
	tl	%xcc,	0x4
	nop
	setx	0xB59DC16D2078E9BF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	bshuffle	%f12,	%f30,	%f30
	bn,a	%icc,	loop_494
	fmovse	%icc,	%f6,	%f27
	fone	%f18
	movrne	%l6,	%g3,	%o1
loop_494:
	fands	%f0,	%f26,	%f28
	brlez	%l3,	loop_495
	smulcc	%o6,	0x0420,	%l2
	orcc	%o2,	%g7,	%o4
	array16	%i1,	%o0,	%o7
loop_495:
	fba	%fcc1,	loop_496
	movge	%xcc,	%i7,	%i4
	fornot1s	%f6,	%f20,	%f5
	movrgez	%g1,	0x02A,	%i6
loop_496:
	movleu	%icc,	%l1,	%l5
	sub	%g6,	%i0,	%o3
	stbar
	fmovsle	%xcc,	%f1,	%f4
	and	%i2,	0x0585,	%o5
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x0D] %asi,	%g5
	sth	%g2,	[%l7 + 0x2A]
	mova	%icc,	%i5,	%l4
	fpsub16s	%f6,	%f5,	%f29
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%g4
	bl	loop_497
	movle	%icc,	%l6,	%i3
	sllx	%g3,	0x08,	%l3
	tl	%icc,	0x3
loop_497:
	edge32l	%o6,	%l2,	%o1
	movgu	%icc,	%o2,	%g7
	xnorcc	%o4,	%i1,	%o7
	movg	%icc,	%i7,	%i4
	fbl,a	%fcc3,	loop_498
	brgez,a	%g1,	loop_499
	ldsh	[%l7 + 0x28],	%o0
	pdist	%f26,	%f16,	%f14
loop_498:
	movvs	%icc,	%i6,	%l5
loop_499:
	srax	%l1,	0x02,	%i0
	lduh	[%l7 + 0x58],	%g6
	move	%xcc,	%o3,	%i2
	std	%f30,	[%l7 + 0x78]
	tg	%xcc,	0x5
	fmovdg	%icc,	%f21,	%f30
	sub	%o5,	0x0B56,	%g5
	tn	%icc,	0x4
	andn	%i5,	0x00C6,	%g2
	tsubcc	%l0,	%g4,	%l4
	edge16l	%l6,	%i3,	%l3
	orncc	%o6,	%l2,	%g3
	array32	%o1,	%g7,	%o4
	lduw	[%l7 + 0x2C],	%i1
	sdivcc	%o7,	0x1CAD,	%o2
	movge	%xcc,	%i7,	%g1
	udivcc	%o0,	0x1C40,	%i6
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x0] %asi,	%i4
	fmovsge	%icc,	%f16,	%f19
	movge	%icc,	%l1,	%l5
	movrne	%g6,	0x384,	%i0
	mulx	%o3,	%o5,	%i2
	fbule	%fcc1,	loop_500
	prefetch	[%l7 + 0x68],	 0x1
	set	0x66, %o6
	lduha	[%l7 + %o6] 0x88,	%i5
loop_500:
	add	%g5,	%g2,	%l0
	movneg	%icc,	%l4,	%g4
	andn	%i3,	%l3,	%l6
	fmovdpos	%xcc,	%f15,	%f4
	tcs	%xcc,	0x4
	movrne	%l2,	%g3,	%o1
	movrgz	%o6,	%g7,	%o4
	subc	%o7,	0x1D6D,	%i1
	edge32n	%o2,	%i7,	%o0
	array8	%g1,	%i4,	%i6
	array8	%l5,	%g6,	%i0
	addccc	%o3,	%l1,	%i2
	array32	%i5,	%g5,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%g2,	%l0
	taddcctv	%g4,	0x11AF,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x22],	%l3
	stw	%l6,	[%l7 + 0x24]
	taddcctv	%l2,	0x078E,	%g3
	or	%o1,	0x0A20,	%l4
	orn	%g7,	0x12B0,	%o6
	fnegs	%f24,	%f18
	ldub	[%l7 + 0x3B],	%o7
	addcc	%o4,	0x1D22,	%o2
	umul	%i1,	0x0653,	%i7
	fmovda	%xcc,	%f10,	%f11
	addcc	%g1,	0x1528,	%o0
	sir	0x136F
	fmovrse	%i4,	%f2,	%f24
	alignaddrl	%l5,	%i6,	%i0
	nop
	setx loop_501, %l0, %l1
	jmpl %l1, %o3
	add	%l1,	%i2,	%g6
	tcs	%icc,	0x0
	fmovdcc	%icc,	%f16,	%f12
loop_501:
	fmuld8sux16	%f25,	%f23,	%f30
	sdivx	%i5,	0x0CBB,	%g5
	movre	%o5,	%l0,	%g4
	bcs,pn	%xcc,	loop_502
	fmovdgu	%xcc,	%f11,	%f6
	prefetch	[%l7 + 0x3C],	 0x0
	movg	%icc,	%i3,	%l3
loop_502:
	andncc	%g2,	%l6,	%g3
	fmuld8ulx16	%f24,	%f0,	%f24
	fmovsge	%xcc,	%f24,	%f7
	edge32ln	%o1,	%l4,	%l2
	srax	%g7,	%o7,	%o4
	fmuld8ulx16	%f18,	%f1,	%f26
	popc	%o2,	%o6
	fbo	%fcc2,	loop_503
	bgu,a	%icc,	loop_504
	fmul8ulx16	%f28,	%f2,	%f14
	array32	%i1,	%g1,	%i7
loop_503:
	nop
	fitod	%f20,	%f4
loop_504:
	sdivcc	%o0,	0x0DC5,	%l5
	edge16n	%i6,	%i4,	%i0
	fnot2s	%f22,	%f23
	movle	%icc,	%o3,	%l1
	sdivx	%i2,	0x0709,	%g6
	movre	%g5,	%i5,	%l0
	fxnors	%f25,	%f10,	%f30
	brz,a	%o5,	loop_505
	stbar
	umul	%g4,	%l3,	%i3
	fbl,a	%fcc3,	loop_506
loop_505:
	fmovdvc	%xcc,	%f10,	%f10
	movn	%icc,	%g2,	%l6
	bleu,a	loop_507
loop_506:
	movrlez	%o1,	%g3,	%l2
	tcc	%xcc,	0x2
	movrlez	%g7,	0x0A2,	%o7
loop_507:
	xorcc	%o4,	0x087C,	%o2
	fbn	%fcc2,	loop_508
	nop
	setx	0xD2FD88C0483346CE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x9D33B52DD092A4BC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f8,	%f0
	swap	[%l7 + 0x24],	%l4
	fpack16	%f28,	%f31
loop_508:
	movvs	%xcc,	%o6,	%g1
	ta	%xcc,	0x5
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x44] %asi,	%f21
	taddcc	%i7,	%o0,	%i1
	udivx	%l5,	0x041E,	%i6
	ldstub	[%l7 + 0x4E],	%i0
	fmul8x16au	%f8,	%f8,	%f30
	fcmpne16	%f26,	%f0,	%i4
	bvc,a,pt	%xcc,	loop_509
	fmovrsgez	%o3,	%f2,	%f24
	tsubcctv	%l1,	0x05CE,	%g6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_509:
	nop
	fitos	%f5,	%f22
	orcc	%g5,	0x0783,	%i2
	mulscc	%l0,	0x1EA9,	%o5
	nop
	set	0x3C, %l6
	stw	%g4,	[%l7 + %l6]
	edge16n	%i5,	%i3,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x60, %g6
	stx	%l3,	[%l7 + %g6]
	tsubcc	%o1,	0x18C6,	%l6
	xorcc	%g3,	0x16D6,	%g7
	movrlz	%o7,	%l2,	%o2
	te	%icc,	0x5
	andcc	%o4,	0x1A3D,	%l4
	mova	%xcc,	%g1,	%o6
	tpos	%icc,	0x7
	std	%f18,	[%l7 + 0x08]
	tsubcctv	%i7,	%i1,	%l5
	ldstub	[%l7 + 0x58],	%o0
	fpack16	%f16,	%f8
	membar	0x2A
	umul	%i0,	0x1AF5,	%i4
	ta	%xcc,	0x3
	movvc	%icc,	%o3,	%l1
	bcc,pt	%xcc,	loop_510
	taddcc	%i6,	%g6,	%i2
	fmovdgu	%icc,	%f1,	%f19
	movrlz	%l0,	0x354,	%g5
loop_510:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%i5
	set	0x52, %i2
	ldsba	[%l7 + %i2] 0x0c,	%i3
	fornot2s	%f24,	%f28,	%f19
	fmovrdlez	%o5,	%f0,	%f20
	xnor	%l3,	%o1,	%l6
	fba	%fcc1,	loop_511
	fbo,a	%fcc1,	loop_512
	movg	%xcc,	%g3,	%g2
	ldx	[%l7 + 0x70],	%o7
loop_511:
	andncc	%g7,	%l2,	%o2
loop_512:
	subc	%o4,	%l4,	%o6
	fbul	%fcc2,	loop_513
	nop
	set	0x78, %i7
	ldx	[%l7 + %i7],	%g1
	fbo,a	%fcc0,	loop_514
	tleu	%xcc,	0x4
loop_513:
	edge32n	%i1,	%l5,	%i7
	andn	%i0,	%o0,	%i4
loop_514:
	movleu	%icc,	%o3,	%l1
	array8	%g6,	%i6,	%i2
	tsubcc	%l0,	%g4,	%g5
	movrgz	%i3,	0x0BC,	%i5
	movn	%xcc,	%o5,	%l3
	movle	%icc,	%l6,	%g3
	sdivcc	%o1,	0x1CDC,	%o7
	brgz	%g2,	loop_515
	edge8ln	%l2,	%g7,	%o4
	edge8l	%o2,	%l4,	%o6
	bge,a,pn	%xcc,	loop_516
loop_515:
	movpos	%icc,	%i1,	%g1
	fmovdneg	%icc,	%f5,	%f30
	array8	%l5,	%i0,	%i7
loop_516:
	movvs	%xcc,	%i4,	%o3
	tpos	%icc,	0x0
	sir	0x1AA7
	udivx	%o0,	0x1297,	%l1
	fblg,a	%fcc3,	loop_517
	fornot1s	%f1,	%f11,	%f27
	ld	[%l7 + 0x38],	%f13
	sdivcc	%g6,	0x0EF2,	%i2
loop_517:
	movn	%xcc,	%i6,	%g4
	andn	%l0,	%i3,	%i5
	taddcc	%o5,	0x132B,	%g5
	fmovrde	%l3,	%f22,	%f20
	ldx	[%l7 + 0x58],	%l6
	set	0x42, %i1
	lduba	[%l7 + %i1] 0x14,	%g3
	wr	%g0,	0x27,	%asi
	stha	%o7,	[%l7 + 0x6A] %asi
	membar	#Sync
	fpsub16	%f2,	%f4,	%f30
	movneg	%xcc,	%o1,	%l2
	brgez,a	%g7,	loop_518
	fnor	%f2,	%f2,	%f20
	tleu	%icc,	0x1
	fpmerge	%f25,	%f6,	%f2
loop_518:
	nop
	setx loop_519, %l0, %l1
	jmpl %l1, %o4
	ldd	[%l7 + 0x40],	%f18
	std	%f8,	[%l7 + 0x70]
	xorcc	%g2,	%o2,	%l4
loop_519:
	fmul8ulx16	%f6,	%f22,	%f6
	movvs	%icc,	%i1,	%g1
	fxnor	%f14,	%f24,	%f0
	te	%icc,	0x0
	lduh	[%l7 + 0x6E],	%o6
	edge8	%i0,	%i7,	%i4
	edge32n	%o3,	%l5,	%l1
	set	0x7D, %g4
	ldstuba	[%l7 + %g4] 0x19,	%o0
	movrlz	%g6,	%i2,	%i6
	andncc	%g4,	%i3,	%i5
	subccc	%o5,	0x0CB5,	%g5
	move	%icc,	%l3,	%l6
	sir	0x14AC
	edge32	%l0,	%o7,	%o1
	fcmpne32	%f8,	%f14,	%g3
	fmovscs	%icc,	%f18,	%f31
	nop
	setx	loop_520,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	te	%xcc,	0x4
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
loop_520:
	nop
	set	0x24, %o7
	ldub	[%l7 + %o7],	%g7
	fpsub16s	%f3,	%f28,	%f8
	fmovde	%xcc,	%f13,	%f0
	movl	%icc,	%g2,	%o4
	fxnor	%f30,	%f28,	%f28
	mova	%xcc,	%o2,	%l4
	tgu	%icc,	0x5
	fmovsleu	%icc,	%f6,	%f18
	fblg	%fcc3,	loop_521
	edge8ln	%i1,	%g1,	%o6
	fpack32	%f30,	%f2,	%f6
	movcc	%xcc,	%i7,	%i4
loop_521:
	fbug,a	%fcc0,	loop_522
	stb	%i0,	[%l7 + 0x54]
	movn	%xcc,	%o3,	%l1
	tleu	%icc,	0x5
loop_522:
	popc	%o0,	%g6
	fornot1	%f0,	%f24,	%f0
	prefetch	[%l7 + 0x14],	 0x3
	mova	%xcc,	%l5,	%i2
	st	%f22,	[%l7 + 0x20]
	tg	%icc,	0x1
	udiv	%i6,	0x12FC,	%i3
	sllx	%i5,	%o5,	%g5
	movg	%icc,	%g4,	%l3
	set	0x50, %l2
	stxa	%l6,	[%l7 + %l2] 0x19
	fmovrde	%o7,	%f8,	%f30
	udivcc	%l0,	0x031D,	%g3
	andcc	%l2,	0x15FA,	%g7
	movvs	%icc,	%g2,	%o1
	fbug	%fcc0,	loop_523
	fbue	%fcc0,	loop_524
	fcmpgt16	%f30,	%f22,	%o4
	ldub	[%l7 + 0x1C],	%l4
loop_523:
	ta	%xcc,	0x7
loop_524:
	nop
	setx	0x520DAD80,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x359C9D5D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f24,	%f1
	ldd	[%l7 + 0x10],	%f10
	ta	%icc,	0x7
	udivx	%o2,	0x07A7,	%i1
	movneg	%xcc,	%g1,	%o6
	movcc	%icc,	%i7,	%i0
	umulcc	%o3,	%i4,	%o0
	mova	%xcc,	%l1,	%g6
	move	%icc,	%i2,	%i6
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x50] %asi,	%f29
	std	%f22,	[%l7 + 0x70]
	subcc	%i3,	0x172C,	%i5
	mova	%xcc,	%o5,	%l5
	edge32l	%g4,	%g5,	%l3
	udivx	%o7,	0x0553,	%l0
	add	%l6,	%g3,	%g7
	or	%g2,	0x03C7,	%o1
	nop
	setx	loop_525,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%o4,	%l4,	%l2
	alignaddr	%o2,	%g1,	%i1
	std	%f30,	[%l7 + 0x08]
loop_525:
	or	%i7,	0x02C1,	%i0
	orn	%o6,	%o3,	%i4
	tne	%xcc,	0x2
	sll	%o0,	%l1,	%i2
	fandnot2	%f12,	%f18,	%f6
	xor	%i6,	0x0848,	%i3
	udivcc	%i5,	0x0CEE,	%o5
	tne	%icc,	0x5
	fexpand	%f20,	%f20
	nop
	setx	loop_526,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbu	%fcc1,	loop_527
	movvs	%xcc,	%g6,	%g4
	sll	%g5,	%l3,	%o7
loop_526:
	flush	%l7 + 0x44
loop_527:
	tsubcc	%l0,	%l5,	%g3
	movcs	%icc,	%g7,	%l6
	nop
	setx	0x5070DC40,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	set	0x61, %i4
	stba	%o1,	[%l7 + %i4] 0x10
	set	0x78, %i0
	ldxa	[%l7 + %i0] 0x19,	%g2
	fmul8x16	%f22,	%f28,	%f22
	move	%xcc,	%l4,	%l2
	movneg	%icc,	%o2,	%o4
	wr	%g0,	0x19,	%asi
	stha	%g1,	[%l7 + 0x2E] %asi
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x26] %asi,	%i1
	edge16l	%i0,	%o6,	%o3
	fmovrslz	%i7,	%f3,	%f31
	movrlez	%o0,	0x381,	%i4
	fzero	%f28
	tge	%icc,	0x2
	fone	%f30
	movn	%xcc,	%l1,	%i6
	fxors	%f14,	%f3,	%f3
	tg	%icc,	0x6
	edge8	%i2,	%i5,	%o5
	edge8n	%i3,	%g4,	%g5
	nop
	setx	0xD76876E46ADB4A72,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f0
	edge8n	%l3,	%o7,	%g6
	fbn,a	%fcc3,	loop_528
	sll	%l5,	0x03,	%l0
	fbl	%fcc3,	loop_529
	swap	[%l7 + 0x44],	%g7
loop_528:
	fmovscc	%xcc,	%f1,	%f0
	fmovdvs	%icc,	%f18,	%f18
loop_529:
	sir	0x0ADE
	ldsw	[%l7 + 0x10],	%l6
	set	0x66, %o2
	lduba	[%l7 + %o2] 0x10,	%g3
	movn	%xcc,	%o1,	%l4
	swap	[%l7 + 0x60],	%l2
	bge	%xcc,	loop_530
	sra	%g2,	0x10,	%o4
	edge16l	%o2,	%i1,	%g1
	fmovrse	%i0,	%f10,	%f17
loop_530:
	brgz	%o3,	loop_531
	tl	%icc,	0x4
	tg	%xcc,	0x4
	tcc	%icc,	0x7
loop_531:
	tneg	%xcc,	0x1
	tcs	%xcc,	0x3
	movpos	%icc,	%i7,	%o6
	fcmple32	%f0,	%f18,	%o0
	tpos	%xcc,	0x2
	xnor	%l1,	0x0245,	%i6
	lduh	[%l7 + 0x36],	%i4
	movrne	%i2,	%o5,	%i5
	set	0x2F, %g3
	ldsba	[%l7 + %g3] 0x19,	%g4
	andn	%i3,	0x0971,	%l3
	edge16	%o7,	%g5,	%l5
	fpsub32s	%f31,	%f4,	%f8
	fmovda	%icc,	%f3,	%f11
	movleu	%xcc,	%l0,	%g7
	fba	%fcc1,	loop_532
	brnz	%l6,	loop_533
	fmovsne	%xcc,	%f22,	%f4
	movrgez	%g3,	0x38B,	%g6
loop_532:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_533:
	nop
	fitod	%f0,	%f10
	fdtos	%f10,	%f22
	array32	%o1,	%l2,	%g2
	fexpand	%f25,	%f24
	or	%o4,	%l4,	%o2
	fmovsvc	%xcc,	%f4,	%f17
	ba,pn	%icc,	loop_534
	movneg	%icc,	%i1,	%i0
	prefetch	[%l7 + 0x14],	 0x3
	addccc	%g1,	0x1C99,	%o3
loop_534:
	array8	%i7,	%o0,	%l1
	nop
	set	0x18, %l3
	std	%f14,	[%l7 + %l3]
	bvc	loop_535
	udivx	%o6,	0x0150,	%i4
	srlx	%i6,	0x06,	%o5
	ldsb	[%l7 + 0x6E],	%i2
loop_535:
	fmovsa	%xcc,	%f19,	%f16
	udiv	%i5,	0x0941,	%g4
	subcc	%l3,	0x0520,	%o7
	taddcc	%g5,	0x07A0,	%l5
	movrne	%l0,	0x334,	%i3
	movrgz	%l6,	0x3B6,	%g7
	fmovdn	%icc,	%f27,	%f20
	movre	%g3,	%g6,	%o1
	fpsub16s	%f17,	%f11,	%f1
	movle	%icc,	%g2,	%l2
	alignaddr	%o4,	%o2,	%i1
	set	0x70, %g7
	ldda	[%l7 + %g7] 0x04,	%l4
	fmul8x16	%f26,	%f28,	%f26
	addcc	%i0,	0x15AE,	%g1
	edge8n	%o3,	%o0,	%l1
	fmul8x16	%f12,	%f4,	%f18
	fpadd32	%f0,	%f4,	%f10
	andncc	%i7,	%i4,	%o6
	andcc	%i6,	%o5,	%i5
	tneg	%xcc,	0x5
	and	%i2,	0x1A11,	%g4
	addccc	%o7,	%g5,	%l3
	edge8l	%l5,	%l0,	%l6
	edge16ln	%g7,	%g3,	%i3
	fmovrslez	%g6,	%f5,	%f20
	fzeros	%f21
	fbl	%fcc0,	loop_536
	subcc	%o1,	0x14C0,	%g2
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x1
loop_536:
	stbar
	tvc	%icc,	0x7
	fmovsvs	%xcc,	%f22,	%f4
	fmovdn	%icc,	%f23,	%f14
	brnz	%l2,	loop_537
	tvc	%xcc,	0x4
	move	%icc,	%o2,	%i1
	te	%icc,	0x6
loop_537:
	popc	0x0D92,	%l4
	fmovrsgz	%i0,	%f15,	%f24
	nop
	fitod	%f12,	%f12
	fdtoi	%f12,	%f17
	stx	%o3,	[%l7 + 0x60]
	bleu,a	%xcc,	loop_538
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x3A
	tcs	%xcc,	0x4
loop_538:
	srlx	%g1,	0x01,	%l1
	nop
	fitod	%f8,	%f14
	fdtos	%f14,	%f23
	movrlez	%o0,	0x260,	%i4
	smul	%i7,	%o6,	%i6
	fmovd	%f26,	%f14
	nop
	setx	0xE1471586,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x0F77E677,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f31,	%f11
	movneg	%icc,	%i5,	%o5
	fmul8ulx16	%f6,	%f8,	%f0
	srlx	%i2,	%o7,	%g4
	xnor	%l3,	0x044E,	%l5
	addcc	%g5,	%l6,	%l0
	fbul	%fcc3,	loop_539
	array16	%g3,	%i3,	%g6
	nop
	fitos	%f5,	%f13
	fstoi	%f13,	%f14
	movge	%xcc,	%g7,	%o1
loop_539:
	addccc	%o4,	%g2,	%o2
	ldd	[%l7 + 0x48],	%l2
	fmovsneg	%xcc,	%f30,	%f5
	tvs	%icc,	0x7
	subc	%l4,	0x1A9E,	%i0
	sdivcc	%o3,	0x17A9,	%g1
	smul	%l1,	0x0AAA,	%o0
	set	0x5D, %g1
	ldstuba	[%l7 + %g1] 0x19,	%i4
	set	0x08, %l0
	stxa	%i7,	[%l7 + %l0] 0x2f
	membar	#Sync
	ldd	[%l7 + 0x60],	%i0
	array8	%i6,	%o6,	%o5
	addcc	%i5,	0x0217,	%i2
	andn	%o7,	%l3,	%g4
	movne	%icc,	%l5,	%l6
	bvc,a	loop_540
	smulcc	%g5,	0x1EB2,	%g3
	umulcc	%l0,	%i3,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_540:
	edge8n	%o1,	%o4,	%g6
	tg	%xcc,	0x5
	array32	%o2,	%g2,	%l2
	fands	%f8,	%f21,	%f3
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x70] %asi,	%f12
	taddcctv	%l4,	%i0,	%o3
	tgu	%xcc,	0x0
	fmovsge	%xcc,	%f0,	%f4
	smul	%l1,	%o0,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i7,	0x1631,	%g1
	movg	%xcc,	%i6,	%i1
	tne	%icc,	0x6
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movleu	%xcc,	%o5,	%o6
	edge16l	%i2,	%i5,	%o7
	fbl,a	%fcc1,	loop_541
	movn	%xcc,	%l3,	%g4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%l6,	%g5
loop_541:
	fmovscc	%icc,	%f22,	%f12
	tgu	%icc,	0x4
	fmul8x16au	%f27,	%f23,	%f4
	movpos	%xcc,	%g3,	%l5
	edge32ln	%l0,	%g7,	%o1
	taddcctv	%i3,	0x1311,	%g6
	set	0x08, %o4
	lduwa	[%l7 + %o4] 0x04,	%o2
	stbar
	taddcctv	%g2,	%l2,	%o4
	sdivcc	%l4,	0x1652,	%i0
	tneg	%icc,	0x3
	movn	%icc,	%o3,	%o0
	edge32n	%i4,	%l1,	%g1
	nop
	setx loop_542, %l0, %l1
	jmpl %l1, %i7
	bvs	%icc,	loop_543
	fsrc2s	%f13,	%f1
	fandnot1s	%f9,	%f11,	%f2
loop_542:
	brlz	%i6,	loop_544
loop_543:
	taddcctv	%i1,	%o5,	%i2
	tne	%xcc,	0x7
	fmovrdgez	%o6,	%f16,	%f12
loop_544:
	fblg,a	%fcc0,	loop_545
	or	%o7,	0x00AC,	%i5
	edge16ln	%g4,	%l6,	%l3
	andncc	%g5,	%l5,	%g3
loop_545:
	edge16	%l0,	%o1,	%g7
	fbuge,a	%fcc2,	loop_546
	edge16ln	%i3,	%g6,	%g2
	tneg	%icc,	0x7
	te	%icc,	0x4
loop_546:
	movgu	%icc,	%o2,	%l2
	srax	%o4,	%l4,	%i0
	subc	%o3,	%o0,	%l1
	sdivx	%i4,	0x0CEA,	%g1
	fbge,a	%fcc1,	loop_547
	fpadd32s	%f31,	%f7,	%f7
	nop
	setx	loop_548,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	or	%i6,	%i1,	%i7
loop_547:
	lduw	[%l7 + 0x20],	%o5
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x65] %asi,	%o6
loop_548:
	fpack16	%f14,	%f2
	set	0x62, %l5
	ldsba	[%l7 + %l5] 0x88,	%i2
	alignaddrl	%i5,	%o7,	%l6
	movn	%xcc,	%l3,	%g5
	fmovsge	%icc,	%f16,	%f4
	tgu	%xcc,	0x7
	movrlez	%l5,	%g3,	%g4
	stbar
	fmovrse	%l0,	%f7,	%f29
	fornot2s	%f11,	%f19,	%f15
	udivx	%o1,	0x122B,	%i3
	orn	%g6,	%g7,	%o2
	fcmple16	%f14,	%f18,	%g2
	fabsd	%f0,	%f6
	brgz,a	%l2,	loop_549
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l4,	0x1DD8,	%i0
	addccc	%o3,	0x1FA0,	%o4
loop_549:
	fmovdg	%xcc,	%f8,	%f26
	movg	%icc,	%l1,	%i4
	fabsd	%f10,	%f26
	tvs	%icc,	0x6
	fmovrdgez	%g1,	%f22,	%f2
	addccc	%o0,	%i1,	%i7
	tl	%icc,	0x1
	subcc	%i6,	%o6,	%o5
	edge8	%i5,	%i2,	%o7
	tne	%xcc,	0x7
	subcc	%l3,	0x1CD4,	%l6
	srax	%g5,	%g3,	%g4
	bg	loop_550
	umulcc	%l5,	%o1,	%i3
	fzeros	%f8
	movn	%xcc,	%l0,	%g7
loop_550:
	fmovspos	%icc,	%f30,	%f2
	tne	%icc,	0x6
	fabss	%f31,	%f3
	set	0x40, %l4
	stxa	%g6,	[%l7 + %l4] 0x2f
	membar	#Sync
	umulcc	%g2,	0x06B9,	%l2
	taddcctv	%o2,	0x0FAC,	%i0
	umul	%o3,	0x11D9,	%o4
	fmovse	%xcc,	%f12,	%f0
	sll	%l4,	0x05,	%l1
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x2E] %asi,	%i4
	tl	%icc,	0x3
	tvc	%xcc,	0x7
	sethi	0x0092,	%g1
	tsubcc	%o0,	%i7,	%i1
	fmovsne	%icc,	%f30,	%f25
	fmovdvs	%icc,	%f7,	%f11
	tvs	%xcc,	0x0
	movne	%icc,	%o6,	%o5
	set	0x300, %i6
	nop 	! 	stxa	%i6,	[%g0 + %i6] 0x40 ripped by fixASI40.pl
	srlx	%i5,	%i2,	%l3
	movne	%icc,	%l6,	%o7
	bneg,pt	%icc,	loop_551
	tsubcctv	%g5,	%g4,	%g3
	flush	%l7 + 0x10
	subccc	%l5,	%o1,	%l0
loop_551:
	srax	%g7,	%i3,	%g2
	movvc	%icc,	%l2,	%g6
	tvs	%xcc,	0x3
	nop
	setx	0xE33F0BCA306DB30B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x96B8B28D9A27944C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f18,	%f16
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%o2
	movpos	%xcc,	%o3,	%i0
	andcc	%l4,	0x0B80,	%l1
	nop
	fitos	%f1,	%f4
	fstoi	%f4,	%f1
	fmovdn	%icc,	%f7,	%f19
	membar	0x30
	bl,a	%icc,	loop_552
	fbe	%fcc3,	loop_553
	ta	%icc,	0x1
	nop
	fitos	%f2,	%f20
	fstox	%f20,	%f12
loop_552:
	nop
	setx	0x1079236C,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
loop_553:
	fmovsgu	%icc,	%f11,	%f31
	te	%icc,	0x2
	fpsub32s	%f22,	%f14,	%f24
	movleu	%xcc,	%o4,	%i4
	call	loop_554
	andn	%g1,	0x01FB,	%o0
	mulx	%i1,	%i7,	%o6
	add	%i6,	0x19F9,	%o5
loop_554:
	nop
	setx	0xE4B41626,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xC77431FF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f1,	%f22
	set	0x1F, %o0
	lduba	[%l7 + %o0] 0x80,	%i2
	orn	%i5,	0x07EB,	%l3
	array16	%o7,	%l6,	%g5
	tsubcctv	%g3,	0x048D,	%l5
	sub	%o1,	0x0D7B,	%l0
	movg	%xcc,	%g4,	%g7
	fbo,a	%fcc0,	loop_555
	lduh	[%l7 + 0x08],	%i3
	fbl	%fcc3,	loop_556
	subccc	%g2,	%g6,	%l2
loop_555:
	andncc	%o2,	%i0,	%l4
	and	%o3,	%o4,	%i4
loop_556:
	subc	%l1,	%g1,	%o0
	bpos,pn	%icc,	loop_557
	srlx	%i7,	%o6,	%i1
	fpmerge	%f3,	%f0,	%f14
	fbule	%fcc0,	loop_558
loop_557:
	movn	%xcc,	%i6,	%i2
	tvc	%xcc,	0x3
	fbu	%fcc2,	loop_559
loop_558:
	nop
	fitos	%f24,	%f17
	bvs,a	%xcc,	loop_560
	tg	%xcc,	0x4
loop_559:
	membar	0x06
	mulscc	%o5,	%i5,	%l3
loop_560:
	membar	0x7C
	fpackfix	%f30,	%f15
	edge16	%o7,	%l6,	%g5
	nop
	setx	0x6A332208D04C5CA1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
	array16	%g3,	%o1,	%g4
	ba,a	loop_561
	movrgez	%l0,	%g7,	%i3
	movge	%icc,	%g6,	%l2
	addccc	%g2,	%o2,	%i0
loop_561:
	add	%l4,	%o4,	%o3
	fmovsgu	%icc,	%f15,	%f18
	smulcc	%i4,	0x161C,	%g1
	membar	0x07
	faligndata	%f20,	%f2,	%f6
	fmovda	%xcc,	%f22,	%f17
	fandnot2	%f30,	%f2,	%f12
	fbne,a	%fcc3,	loop_562
	fbue,a	%fcc1,	loop_563
	edge32	%l1,	%o0,	%o6
	umulcc	%i7,	0x13D5,	%i6
loop_562:
	edge32l	%i2,	%o5,	%i1
loop_563:
	sir	0x0672
	ba	loop_564
	array32	%l3,	%o7,	%i5
	set	0x54, %i5
	lduwa	[%l7 + %i5] 0x04,	%l6
loop_564:
	fbuge,a	%fcc3,	loop_565
	fnands	%f8,	%f15,	%f10
	fmovdneg	%xcc,	%f30,	%f27
	bgu	loop_566
loop_565:
	fone	%f12
	umul	%g5,	%g3,	%l5
	tsubcc	%o1,	%l0,	%g7
loop_566:
	fcmpeq16	%f22,	%f22,	%i3
	fmovdgu	%xcc,	%f3,	%f20
	tsubcctv	%g4,	0x0228,	%l2
	edge32n	%g2,	%g6,	%i0
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x76] %asi,	%l4
	tleu	%xcc,	0x1
	stbar
	fmovdge	%xcc,	%f0,	%f8
	fabss	%f0,	%f16
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x0c,	%o4
	bvs,pt	%icc,	loop_567
	alignaddr	%o2,	%o3,	%i4
	tn	%icc,	0x0
	udivcc	%g1,	0x1ACA,	%l1
loop_567:
	nop
	set	0x51, %o3
	ldub	[%l7 + %o3],	%o6
	fabss	%f16,	%f19
	fmovdn	%icc,	%f7,	%f10
	bcc	%xcc,	loop_568
	andcc	%o0,	%i6,	%i7
	movcs	%icc,	%o5,	%i1
	tl	%icc,	0x4
loop_568:
	edge8l	%i2,	%l3,	%i5
	tn	%icc,	0x6
	membar	0x7F
	xnorcc	%o7,	%g5,	%l6
	movl	%icc,	%g3,	%l5
	bvs	loop_569
	tl	%icc,	0x3
	movvs	%xcc,	%o1,	%g7
	bne,a,pn	%xcc,	loop_570
loop_569:
	fbg	%fcc3,	loop_571
	tsubcctv	%i3,	%g4,	%l2
	edge16n	%g2,	%g6,	%l0
loop_570:
	add	%l4,	0x0BEC,	%o4
loop_571:
	brlz	%o2,	loop_572
	bl,a	%xcc,	loop_573
	movneg	%xcc,	%o3,	%i4
	fbule	%fcc0,	loop_574
loop_572:
	fandnot2	%f20,	%f2,	%f28
loop_573:
	andncc	%g1,	%l1,	%i0
	tpos	%xcc,	0x6
loop_574:
	fmovde	%xcc,	%f1,	%f28
	bleu	%icc,	loop_575
	tne	%icc,	0x0
	fbn	%fcc3,	loop_576
	fmovdleu	%icc,	%f21,	%f0
loop_575:
	movpos	%icc,	%o0,	%i6
	ba	loop_577
loop_576:
	fpack32	%f20,	%f28,	%f30
	sub	%i7,	0x191B,	%o5
	movneg	%xcc,	%i1,	%o6
loop_577:
	nop
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	stb	%l3,	[%l7 + 0x3A]
	udivcc	%i5,	0x033E,	%o7
	edge32n	%g5,	%l6,	%i2
	tgu	%xcc,	0x3
	edge8ln	%g3,	%o1,	%l5
	popc	%g7,	%i3
	edge16ln	%l2,	%g4,	%g6
	fcmple32	%f12,	%f26,	%g2
	umul	%l0,	%l4,	%o4
	udivx	%o3,	0x1772,	%o2
	fmovsle	%xcc,	%f19,	%f4
	movre	%g1,	%l1,	%i0
	fornot2	%f10,	%f12,	%f2
	tl	%xcc,	0x2
	sdivcc	%i4,	0x145C,	%i6
	fnand	%f2,	%f26,	%f8
	edge16	%i7,	%o0,	%o5
	srl	%o6,	%i1,	%i5
	sethi	0x1065,	%l3
	prefetch	[%l7 + 0x44],	 0x1
	xorcc	%o7,	0x1F4C,	%g5
	edge32	%i2,	%l6,	%g3
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x34] %asi,	%f21
	ta	%xcc,	0x1
	fpack16	%f26,	%f7
	tcs	%icc,	0x1
	fcmple16	%f22,	%f4,	%l5
	bshuffle	%f12,	%f12,	%f30
	fmovdn	%xcc,	%f12,	%f26
	udiv	%g7,	0x03D0,	%i3
	movrlez	%o1,	%l2,	%g6
	movrlez	%g2,	0x270,	%l0
	bn	%xcc,	loop_578
	tge	%icc,	0x3
	umul	%g4,	0x00D7,	%l4
	mulx	%o4,	%o3,	%o2
loop_578:
	sra	%g1,	%l1,	%i0
	fandnot1	%f4,	%f8,	%f24
	fbe,a	%fcc3,	loop_579
	edge8ln	%i6,	%i4,	%o0
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x18] %asi,	%i7
loop_579:
	brgz,a	%o6,	loop_580
	movvc	%xcc,	%i1,	%i5
	fmovdge	%icc,	%f25,	%f25
	fcmpeq32	%f16,	%f8,	%o5
loop_580:
	bcs,a	%xcc,	loop_581
	ble	loop_582
	movcc	%xcc,	%o7,	%l3
	tsubcc	%g5,	0x0E20,	%l6
loop_581:
	mulscc	%i2,	0x0CDE,	%g3
loop_582:
	sth	%g7,	[%l7 + 0x34]
	movrne	%l5,	%i3,	%o1
	st	%f25,	[%l7 + 0x40]
	alignaddr	%l2,	%g2,	%g6
	wr	%g0,	0x88,	%asi
	sta	%f1,	[%l7 + 0x44] %asi
	movge	%icc,	%g4,	%l4
	tleu	%xcc,	0x4
	fmovsvs	%icc,	%f14,	%f11
	nop
	fitos	%f11,	%f10
	fstod	%f10,	%f8
	movcc	%icc,	%o4,	%o3
	sra	%o2,	0x15,	%l0
	alignaddr	%l1,	%i0,	%i6
	tne	%icc,	0x3
	fbug	%fcc1,	loop_583
	movn	%icc,	%i4,	%o0
	bcc,a,pn	%xcc,	loop_584
	movvs	%xcc,	%i7,	%g1
loop_583:
	andn	%o6,	%i5,	%i1
	movgu	%xcc,	%o7,	%o5
loop_584:
	fmovrse	%l3,	%f19,	%f4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x6F] %asi,	%l6
	stb	%g5,	[%l7 + 0x57]
	tpos	%xcc,	0x6
	movpos	%icc,	%i2,	%g3
	movre	%g7,	0x37D,	%l5
	addcc	%o1,	0x1AB5,	%i3
	bvc,pt	%xcc,	loop_585
	xnorcc	%g2,	%l2,	%g4
	tl	%xcc,	0x6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%g6
loop_585:
	brgez,a	%o3,	loop_586
	fmovde	%icc,	%f2,	%f30
	wr	%g0,	0x04,	%asi
	stwa	%o4,	[%l7 + 0x74] %asi
loop_586:
	te	%xcc,	0x7
	addccc	%o2,	%l1,	%l0
	movcs	%icc,	%i6,	%i4
	edge16n	%i0,	%o0,	%g1
	fsrc1	%f0,	%f6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x28] %asi,	%f8
	edge32	%o6,	%i5,	%i1
	edge8	%o7,	%i7,	%o5
	movle	%icc,	%l6,	%g5
	movleu	%xcc,	%l3,	%g3
	bgu,pn	%icc,	loop_587
	fones	%f11
	fmuld8sux16	%f3,	%f3,	%f20
	edge32l	%g7,	%l5,	%i2
loop_587:
	nop
	fitos	%f26,	%f21
	orn	%i3,	0x15AD,	%g2
	addccc	%o1,	0x0C6D,	%g4
	smulcc	%l2,	%g6,	%l4
	nop
	setx	loop_588,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0xA052F80C,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	fcmple32	%f20,	%f16,	%o4
	fpsub16s	%f10,	%f27,	%f18
loop_588:
	movvc	%xcc,	%o3,	%o2
	bgu,a,pt	%xcc,	loop_589
	fones	%f27
	tcs	%icc,	0x4
	nop
	fitos	%f12,	%f13
	fstoi	%f13,	%f27
loop_589:
	movpos	%icc,	%l0,	%l1
	tne	%xcc,	0x7
	bleu,a	%xcc,	loop_590
	fsrc1s	%f20,	%f22
	tgu	%icc,	0x0
	fbule	%fcc3,	loop_591
loop_590:
	fble	%fcc2,	loop_592
	tvc	%xcc,	0x4
	addcc	%i6,	%i4,	%i0
loop_591:
	ba,pn	%icc,	loop_593
loop_592:
	edge8l	%o0,	%g1,	%i5
	movrlz	%i1,	%o7,	%o6
	edge32ln	%i7,	%o5,	%l6
loop_593:
	nop
	set	0x34, %g2
	stha	%g5,	[%l7 + %g2] 0xea
	membar	#Sync
	edge16	%g3,	%l3,	%l5
	sdivx	%i2,	0x1526,	%g7
	call	loop_594
	call	loop_595
	addcc	%i3,	0x03A5,	%o1
	fcmpgt16	%f18,	%f2,	%g2
loop_594:
	nop
	setx	0x55A0A98D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x0CE1831E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f3,	%f15
loop_595:
	taddcc	%g4,	%l2,	%l4
	fcmpne32	%f14,	%f6,	%g6
	orcc	%o3,	0x08DC,	%o2
	fmuld8ulx16	%f19,	%f21,	%f14
	wr	%g0,	0x88,	%asi
	stwa	%l0,	[%l7 + 0x64] %asi
	movcc	%xcc,	%l1,	%i6
	fnors	%f31,	%f6,	%f23
	fmovrslz	%i4,	%f22,	%f28
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x17
	membar	#Sync
	flush	%l7 + 0x38
	sllx	%i0,	0x16,	%o4
	xor	%g1,	%o0,	%i5
	xorcc	%o7,	%o6,	%i7
	edge8n	%o5,	%l6,	%i1
	array16	%g5,	%g3,	%l3
	edge8	%l5,	%i2,	%i3
	movneg	%icc,	%g7,	%o1
	fmovsn	%xcc,	%f8,	%f16
	fcmple16	%f6,	%f2,	%g2
	membar	0x1D
	movrgz	%l2,	%g4,	%g6
	srl	%l4,	0x19,	%o3
	movgu	%icc,	%l0,	%l1
	bge,a	%icc,	loop_596
	fnot2	%f28,	%f2
	fbge	%fcc2,	loop_597
	edge8	%o2,	%i6,	%i0
loop_596:
	ba,pt	%xcc,	loop_598
	movrgez	%i4,	%o4,	%g1
loop_597:
	fbg	%fcc1,	loop_599
	nop
	fitos	%f5,	%f30
loop_598:
	fmovrsgez	%o0,	%f26,	%f2
	tpos	%xcc,	0x1
loop_599:
	fmovrslez	%i5,	%f27,	%f2
	movge	%xcc,	%o7,	%o6
	edge8ln	%o5,	%l6,	%i7
	sllx	%g5,	%g3,	%i1
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x23] %asi,	%l5
	subccc	%l3,	%i2,	%g7
	udiv	%o1,	0x0C95,	%i3
	andcc	%g2,	%g4,	%l2
	orcc	%l4,	0x0757,	%o3
	mova	%xcc,	%l0,	%l1
	movle	%xcc,	%g6,	%o2
	bpos,pn	%icc,	loop_600
	edge16	%i0,	%i6,	%o4
	subc	%g1,	%i4,	%i5
	umulcc	%o7,	%o0,	%o6
loop_600:
	fxor	%f12,	%f12,	%f8
	wr	%g0,	0x18,	%asi
	sta	%f21,	[%l7 + 0x2C] %asi
	edge16n	%o5,	%i7,	%g5
	nop
	setx	loop_601,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	fitos	%f9,	%f16
	fstoi	%f16,	%f19
	fmul8x16	%f31,	%f16,	%f0
	movrgz	%g3,	0x3C9,	%i1
loop_601:
	nop
	fitos	%f14,	%f17
	fstox	%f17,	%f16
	array32	%l6,	%l3,	%l5
	prefetch	[%l7 + 0x08],	 0x3
	taddcc	%i2,	0x1241,	%o1
	smul	%g7,	%g2,	%g4
	alignaddr	%l2,	%i3,	%l4
	movn	%icc,	%o3,	%l1
	or	%g6,	%o2,	%i0
	udivcc	%i6,	0x1180,	%l0
	edge8l	%o4,	%g1,	%i5
	fcmpgt16	%f30,	%f28,	%i4
	movneg	%xcc,	%o0,	%o6
	movpos	%xcc,	%o5,	%o7
	brgez	%g5,	loop_602
	movcs	%icc,	%i7,	%g3
	tge	%icc,	0x3
	udivx	%i1,	0x0FD9,	%l6
loop_602:
	edge32	%l5,	%l3,	%i2
	fbu,a	%fcc3,	loop_603
	fnot1	%f12,	%f4
	nop
	setx	0x48DE5F2FD0414160,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	and	%g7,	0x0B55,	%o1
loop_603:
	fornot2	%f18,	%f10,	%f30
	movle	%icc,	%g2,	%g4
	fmuld8ulx16	%f3,	%f27,	%f12
	bpos	%icc,	loop_604
	edge16l	%l2,	%i3,	%l4
	tg	%xcc,	0x4
	tgu	%xcc,	0x2
loop_604:
	umul	%l1,	0x0F79,	%g6
	mulscc	%o3,	0x0926,	%o2
	bleu,a,pt	%xcc,	loop_605
	fmovsvs	%icc,	%f18,	%f3
	movcs	%xcc,	%i0,	%l0
	sllx	%i6,	%o4,	%g1
loop_605:
	nop
	set	0x6B, %o1
	ldstuba	[%l7 + %o1] 0x88,	%i4
	taddcctv	%i5,	%o6,	%o5
	edge16ln	%o7,	%g5,	%i7
	addcc	%o0,	0x1217,	%i1
	tge	%xcc,	0x6
	tg	%xcc,	0x3
	tle	%xcc,	0x1
	nop
	setx	0x2C4052E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x623CED54,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f10,	%f29
	movle	%xcc,	%g3,	%l5
	udiv	%l6,	0x0388,	%l3
	array32	%g7,	%i2,	%o1
	wr	%g0,	0xe2,	%asi
	stwa	%g2,	[%l7 + 0x74] %asi
	membar	#Sync
	andcc	%g4,	%l2,	%i3
	edge32n	%l4,	%l1,	%o3
	edge8ln	%g6,	%i0,	%l0
	fones	%f0
	tvc	%icc,	0x3
	fblg	%fcc1,	loop_606
	sra	%i6,	%o2,	%g1
	fmuld8ulx16	%f19,	%f17,	%f0
	srax	%o4,	0x19,	%i4
loop_606:
	edge32n	%o6,	%i5,	%o5
	nop
	fitos	%f12,	%f25
	fstoi	%f25,	%f19
	fpack32	%f6,	%f16,	%f10
	edge8n	%g5,	%i7,	%o7
	movpos	%icc,	%i1,	%o0
	movcs	%icc,	%g3,	%l6
	fba	%fcc0,	loop_607
	edge8n	%l5,	%g7,	%i2
	te	%xcc,	0x5
	udivcc	%l3,	0x1435,	%o1
loop_607:
	movn	%icc,	%g4,	%g2
	addcc	%i3,	0x0DC5,	%l4
	fmovdleu	%icc,	%f11,	%f12
	bleu,pt	%xcc,	loop_608
	movpos	%xcc,	%l2,	%l1
	stbar
	mulscc	%o3,	%i0,	%g6
loop_608:
	ldsw	[%l7 + 0x40],	%i6
	sdivx	%l0,	0x1BB5,	%o2
	xnorcc	%g1,	0x0F0B,	%i4
	be,a,pn	%icc,	loop_609
	tn	%icc,	0x1
	alignaddr	%o4,	%o6,	%o5
	lduw	[%l7 + 0x10],	%g5
loop_609:
	nop
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x31] %asi,	%i7
	orncc	%o7,	0x05DD,	%i1
	tle	%xcc,	0x7
	subcc	%o0,	0x1302,	%i5
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f14
	fxtod	%f14,	%f18
	edge16n	%l6,	%l5,	%g3
	fmovsge	%xcc,	%f4,	%f21
	movg	%xcc,	%g7,	%l3
	alignaddr	%i2,	%o1,	%g2
	udivx	%g4,	0x075D,	%l4
	subc	%i3,	0x0FA4,	%l2
	fpsub32	%f26,	%f30,	%f24
	sllx	%o3,	0x14,	%l1
	fones	%f5
	fone	%f20
	tne	%xcc,	0x3
	smul	%i0,	0x0C7A,	%i6
	bneg,pn	%icc,	loop_610
	fmovsgu	%icc,	%f25,	%f16
	sllx	%g6,	%l0,	%o2
	tneg	%icc,	0x0
loop_610:
	lduh	[%l7 + 0x6C],	%i4
	te	%xcc,	0x2
	and	%o4,	0x08C4,	%o6
	te	%icc,	0x4
	udiv	%g1,	0x08BF,	%o5
	movne	%xcc,	%i7,	%g5
	xor	%o7,	0x12DB,	%o0
	udiv	%i5,	0x1EEC,	%i1
	movrgez	%l6,	0x2B0,	%l5
	movrlez	%g3,	0x1E6,	%l3
	ldx	[%l7 + 0x48],	%g7
	fmovdgu	%icc,	%f21,	%f17
	movrlz	%o1,	0x07C,	%i2
	andncc	%g2,	%l4,	%i3
	sdiv	%l2,	0x087D,	%g4
	set	0x66, %l1
	stba	%o3,	[%l7 + %l1] 0x23
	membar	#Sync
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%l0
	tl	%icc,	0x3
	flush	%l7 + 0x7C
	sir	0x164B
	wr	%g0,	0x22,	%asi
	stba	%i6,	[%l7 + 0x0B] %asi
	membar	#Sync
	fone	%f8
	fbn	%fcc1,	loop_611
	nop
	setx	loop_612,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	swap	[%l7 + 0x20],	%g6
	fmovrdlz	%i0,	%f8,	%f20
loop_611:
	ld	[%l7 + 0x60],	%f2
loop_612:
	movneg	%icc,	%o2,	%l0
	edge32ln	%o4,	%i4,	%g1
	movcs	%xcc,	%o5,	%o6
	tvc	%icc,	0x3
	and	%g5,	0x17F8,	%o7
	fands	%f8,	%f4,	%f7
	tl	%icc,	0x2
	udivx	%o0,	0x197A,	%i5
	movcs	%xcc,	%i7,	%l6
	edge16l	%l5,	%g3,	%i1
	set	0x63, %i3
	stba	%g7,	[%l7 + %i3] 0x27
	membar	#Sync
	nop
	setx	0xCB48EAFFB6CB0D89,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f6
	fmovsl	%icc,	%f3,	%f2
	fmul8x16al	%f26,	%f11,	%f0
	fbul	%fcc1,	loop_613
	fmovdleu	%icc,	%f9,	%f21
	udiv	%l3,	0x1EEA,	%i2
	edge16ln	%o1,	%l4,	%i3
loop_613:
	fmovsle	%icc,	%f7,	%f8
	movl	%icc,	%g2,	%l2
	ldsw	[%l7 + 0x6C],	%g4
	bvc,a,pn	%xcc,	loop_614
	fmovsl	%xcc,	%f11,	%f7
	udiv	%l1,	0x0AFD,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_614:
	fbg	%fcc1,	loop_615
	lduw	[%l7 + 0x14],	%i6
	tn	%icc,	0x7
	fmovsne	%icc,	%f1,	%f15
loop_615:
	andncc	%i0,	%o2,	%l0
	popc	0x04BC,	%g6
	brz,a	%i4,	loop_616
	tl	%icc,	0x5
	movle	%xcc,	%o4,	%o5
	brgez,a	%o6,	loop_617
loop_616:
	fexpand	%f20,	%f10
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x70] %asi,	%f28
loop_617:
	movne	%xcc,	%g5,	%g1
	tleu	%xcc,	0x3
	alignaddrl	%o0,	%o7,	%i5
	movgu	%xcc,	%i7,	%l6
	call	loop_618
	edge32n	%g3,	%i1,	%l5
	bn,a	loop_619
	fbue	%fcc3,	loop_620
loop_618:
	te	%xcc,	0x0
	movne	%icc,	%g7,	%l3
loop_619:
	sub	%i2,	0x1CD8,	%o1
loop_620:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x2
	bgu,a,pn	%icc,	loop_621
	fornot2	%f28,	%f2,	%f28
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%l4,	%g2
loop_621:
	swap	[%l7 + 0x40],	%l2
	addcc	%g4,	%l1,	%i3
	fbuge,a	%fcc0,	loop_622
	subcc	%i6,	%i0,	%o2
	mulscc	%o3,	0x0BCE,	%g6
	edge16n	%i4,	%o4,	%o5
loop_622:
	bgu,a,pt	%icc,	loop_623
	tle	%icc,	0x6
	sub	%o6,	%l0,	%g5
	movneg	%icc,	%o0,	%o7
loop_623:
	udivcc	%g1,	0x1B0C,	%i7
	nop
	setx	0x3F1CB1778498522A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x76C355C1F5D9F458,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f4,	%f24
	nop
	setx	0x32E6AF19EB218401,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x27887DD7B7BE7032,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f6,	%f18
	edge8l	%l6,	%g3,	%i5
	bge,a,pn	%xcc,	loop_624
	mova	%xcc,	%l5,	%g7
	movrgz	%i1,	0x237,	%l3
	fmovsneg	%icc,	%f20,	%f16
loop_624:
	bvc,a,pt	%icc,	loop_625
	movneg	%icc,	%i2,	%l4
	fbl	%fcc0,	loop_626
	nop
	setx	0x368F7768707E0B9F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_625:
	tgu	%icc,	0x1
	movrlez	%o1,	%g2,	%g4
loop_626:
	fmovdcs	%xcc,	%f19,	%f27
	bne	loop_627
	movl	%xcc,	%l1,	%l2
	addccc	%i3,	0x1A48,	%i0
	udivcc	%i6,	0x1A97,	%o3
loop_627:
	movg	%xcc,	%g6,	%i4
	brlz,a	%o4,	loop_628
	fmovrdgz	%o5,	%f30,	%f2
	sll	%o2,	0x15,	%o6
	ldsb	[%l7 + 0x45],	%g5
loop_628:
	bcs,a	%icc,	loop_629
	edge32n	%o0,	%o7,	%g1
	movrgez	%i7,	%l0,	%g3
	sdiv	%l6,	0x0BCB,	%l5
loop_629:
	nop
	set	0x70, %l6
	lduba	[%l7 + %l6] 0x14,	%i5
	addccc	%g7,	0x0E56,	%l3
	fbue,a	%fcc1,	loop_630
	fmovdcs	%icc,	%f5,	%f24
	fpsub16s	%f23,	%f6,	%f17
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_630:
	nop
	setx	loop_631,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fxnor	%f4,	%f16,	%f22
	tneg	%xcc,	0x7
	fornot2s	%f21,	%f15,	%f20
loop_631:
	tle	%icc,	0x1
	fxnors	%f20,	%f11,	%f11
	movleu	%icc,	%i2,	%l4
	fmovdg	%xcc,	%f17,	%f27
	brz,a	%o1,	loop_632
	popc	0x0FE3,	%g2
	array32	%i1,	%g4,	%l2
	fmovdge	%icc,	%f28,	%f30
loop_632:
	nop
	fitod	%f12,	%f26
	fdtos	%f26,	%f1
	movge	%icc,	%l1,	%i0
	movne	%icc,	%i3,	%i6
	fmovdl	%icc,	%f12,	%f10
	nop
	setx	0x81473169,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x9764374B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f20,	%f18
	fbl,a	%fcc1,	loop_633
	fcmple32	%f14,	%f26,	%g6
	fmovsneg	%xcc,	%f29,	%f6
	sllx	%o3,	%o4,	%i4
loop_633:
	fmovsneg	%icc,	%f26,	%f9
	tsubcc	%o2,	%o6,	%g5
	subcc	%o0,	0x1288,	%o5
	brnz,a	%g1,	loop_634
	bneg	loop_635
	nop
	fitod	%f1,	%f24
	bshuffle	%f20,	%f22,	%f10
loop_634:
	movg	%xcc,	%i7,	%l0
loop_635:
	movrne	%o7,	0x004,	%l6
	fmul8x16	%f24,	%f22,	%f20
	and	%l5,	%g3,	%i5
	edge16l	%l3,	%i2,	%g7
	subccc	%l4,	%o1,	%i1
	fmovs	%f21,	%f16
	bn,a,pt	%icc,	loop_636
	edge32n	%g4,	%l2,	%l1
	ldsh	[%l7 + 0x72],	%i0
	orn	%i3,	%i6,	%g6
loop_636:
	movvc	%icc,	%g2,	%o3
	taddcctv	%i4,	%o4,	%o6
	move	%xcc,	%o2,	%g5
	udivcc	%o5,	0x079A,	%g1
	fandnot1s	%f19,	%f20,	%f23
	edge8n	%i7,	%l0,	%o0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l6,	%o7
	edge8l	%g3,	%l5,	%l3
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sdivcc	%i5,	0x1AFE,	%g7
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x04
	movneg	%xcc,	%i2,	%l4
	nop
	setx	0x46F31A3E1C92957D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xD7011ADAA8F060E1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f20,	%f2
	umul	%i1,	0x1311,	%o1
	set	0x6E, %o6
	stha	%g4,	[%l7 + %o6] 0x88
	ble,a	loop_637
	fbge	%fcc3,	loop_638
	stb	%l2,	[%l7 + 0x7A]
	alignaddrl	%l1,	%i3,	%i0
loop_637:
	bcc,a	%icc,	loop_639
loop_638:
	stb	%i6,	[%l7 + 0x14]
	ldstub	[%l7 + 0x54],	%g2
	movl	%icc,	%g6,	%i4
loop_639:
	brgz,a	%o3,	loop_640
	st	%f24,	[%l7 + 0x0C]
	set	0x40, %i7
	prefetcha	[%l7 + %i7] 0x88,	 0x3
loop_640:
	bne,a	loop_641
	movl	%icc,	%o4,	%g5
	fbg	%fcc1,	loop_642
	fmovrsgez	%o5,	%f19,	%f21
loop_641:
	umulcc	%g1,	0x02FB,	%i7
	ta	%icc,	0x3
loop_642:
	ldstub	[%l7 + 0x1C],	%l0
	movrne	%o2,	%o0,	%o7
	taddcc	%g3,	%l6,	%l5
	mulx	%l3,	%i5,	%g7
	wr	%g0,	0x2f,	%asi
	stba	%l4,	[%l7 + 0x6A] %asi
	membar	#Sync
	srax	%i2,	0x04,	%o1
	taddcctv	%i1,	%g4,	%l2
	nop
	setx	0x22A31935DE39374F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x8BC176D8783E51B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f2,	%f22
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x34] %asi,	%f18
	edge16	%l1,	%i0,	%i6
	fmul8x16al	%f20,	%f14,	%f0
	brgz	%g2,	loop_643
	fmovscc	%icc,	%f21,	%f23
	fmovdl	%xcc,	%f0,	%f21
	tvc	%icc,	0x7
loop_643:
	tsubcc	%g6,	0x047A,	%i4
	movvc	%icc,	%i3,	%o3
	bcc	%xcc,	loop_644
	movcs	%icc,	%o4,	%g5
	bvc,a,pn	%icc,	loop_645
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f24
	fxtod	%f24,	%f4
loop_644:
	tpos	%icc,	0x6
	fcmple32	%f2,	%f2,	%o5
loop_645:
	nop
	fitos	%f9,	%f22
	fstod	%f22,	%f22
	andcc	%o6,	%g1,	%l0
	mulx	%o2,	0x0660,	%i7
	tge	%xcc,	0x4
	fcmpne32	%f6,	%f8,	%o7
	andn	%o0,	%l6,	%g3
	wr	%g0,	0x11,	%asi
	stba	%l5,	[%l7 + 0x3D] %asi
	movge	%xcc,	%i5,	%l3
	fblg	%fcc2,	loop_646
	movrlez	%g7,	%l4,	%i2
	edge16n	%i1,	%g4,	%o1
	fbug	%fcc1,	loop_647
loop_646:
	tcs	%xcc,	0x4
	movpos	%icc,	%l1,	%i0
	bgu,pt	%icc,	loop_648
loop_647:
	fba	%fcc1,	loop_649
	std	%f6,	[%l7 + 0x50]
	tcc	%xcc,	0x6
loop_648:
	smulcc	%i6,	0x0A5C,	%g2
loop_649:
	taddcc	%g6,	0x1D5C,	%i4
	xor	%l2,	0x1A36,	%i3
	movrgz	%o4,	%o3,	%o5
	fcmpne32	%f18,	%f28,	%g5
	bpos	loop_650
	movcc	%icc,	%g1,	%o6
	ldsb	[%l7 + 0x1B],	%o2
	fcmpeq32	%f18,	%f24,	%i7
loop_650:
	movvs	%icc,	%o7,	%o0
	for	%f26,	%f6,	%f18
	edge32	%l6,	%g3,	%l5
	fmovrdgez	%l0,	%f26,	%f22
	nop
	setx loop_651, %l0, %l1
	jmpl %l1, %i5
	nop
	fitos	%f5,	%f25
	fstox	%f25,	%f8
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x0B] %asi,	%l3
loop_651:
	edge16l	%g7,	%l4,	%i1
	orncc	%i2,	0x177A,	%g4
	edge8l	%o1,	%l1,	%i6
	taddcc	%g2,	0x1F6F,	%i0
	tsubcctv	%i4,	0x19AC,	%l2
	fpsub16	%f20,	%f10,	%f30
	bvc,a	loop_652
	fpack32	%f6,	%f18,	%f12
	umulcc	%i3,	0x1E6B,	%o4
	umulcc	%o3,	0x041A,	%o5
loop_652:
	movrgz	%g6,	%g5,	%o6
	tg	%icc,	0x7
	tn	%xcc,	0x4
	movneg	%icc,	%g1,	%i7
	xor	%o7,	0x1491,	%o2
	movne	%xcc,	%o0,	%g3
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f26
	fsrc2	%f8,	%f6
	movg	%icc,	%l6,	%l5
	edge16n	%i5,	%l0,	%g7
	fmovsneg	%xcc,	%f11,	%f2
	tge	%xcc,	0x1
	tl	%xcc,	0x0
	fmovdvs	%icc,	%f16,	%f16
	edge32l	%l4,	%l3,	%i2
	xor	%g4,	0x0D30,	%i1
	srlx	%o1,	0x18,	%l1
	edge8n	%i6,	%g2,	%i4
	fcmple16	%f16,	%f24,	%i0
	movle	%xcc,	%l2,	%i3
	subcc	%o3,	%o5,	%g6
	wr	%g0,	0x10,	%asi
	stxa	%g5,	[%l7 + 0x70] %asi
	movre	%o4,	0x28E,	%g1
	brlez,a	%o6,	loop_653
	movrne	%o7,	%o2,	%o0
	call	loop_654
	srl	%g3,	%i7,	%l5
loop_653:
	fandnot2s	%f14,	%f11,	%f5
	fbe	%fcc3,	loop_655
loop_654:
	sub	%l6,	0x1D12,	%l0
	fbug	%fcc2,	loop_656
	subccc	%i5,	%l4,	%g7
loop_655:
	tneg	%icc,	0x3
	fpadd32s	%f6,	%f15,	%f0
loop_656:
	fsrc1s	%f5,	%f6
	nop
	setx	0xC98E6770,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xB58ED578,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f15,	%f9
	wr	%g0,	0x2f,	%asi
	stba	%l3,	[%l7 + 0x7A] %asi
	membar	#Sync
	fmovsa	%icc,	%f25,	%f18
	orn	%g4,	%i1,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x28],	%o1
	movre	%l1,	%i6,	%i4
	subc	%i0,	0x0575,	%g2
	taddcc	%i3,	%l2,	%o3
	tl	%icc,	0x5
	nop
	setx	0x5673685E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x4B501256,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f26,	%f8
	edge16n	%o5,	%g6,	%g5
	fnors	%f3,	%f6,	%f2
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x48] %asi,	%g1
	srl	%o4,	0x07,	%o6
	fmovsge	%xcc,	%f2,	%f27
	movneg	%xcc,	%o7,	%o0
	fpadd32s	%f30,	%f1,	%f8
	bvs	loop_657
	edge8ln	%g3,	%o2,	%l5
	tg	%icc,	0x4
	mulx	%l6,	0x100A,	%l0
loop_657:
	and	%i7,	%i5,	%l4
	fxors	%f16,	%f5,	%f20
	swap	[%l7 + 0x58],	%l3
	stw	%g7,	[%l7 + 0x18]
	movrne	%g4,	0x0F2,	%i1
	bpos,a,pn	%xcc,	loop_658
	sdiv	%o1,	0x13F9,	%l1
	fxors	%f18,	%f25,	%f3
	popc	%i6,	%i4
loop_658:
	fmovsle	%icc,	%f20,	%f3
	tl	%icc,	0x4
	fbne	%fcc1,	loop_659
	fmovdge	%icc,	%f2,	%f23
	srax	%i2,	0x0D,	%g2
	stx	%i0,	[%l7 + 0x40]
loop_659:
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%i3
	nop
	fitos	%f12,	%f28
	fstox	%f28,	%f26
	fmovse	%icc,	%f28,	%f24
	srlx	%o3,	0x1E,	%o5
	fbue	%fcc0,	loop_660
	movrlez	%g6,	%l2,	%g5
	movneg	%xcc,	%o4,	%g1
	srax	%o7,	0x1C,	%o0
loop_660:
	fornot2s	%f9,	%f11,	%f10
	sir	0x0A5C
	tgu	%icc,	0x0
	popc	%o6,	%o2
	flush	%l7 + 0x7C
	alignaddr	%g3,	%l5,	%l0
	bneg,a	%icc,	loop_661
	edge8n	%i7,	%l6,	%i5
	sdivcc	%l3,	0x19B1,	%g7
	add	%g4,	%l4,	%o1
loop_661:
	movne	%xcc,	%i1,	%i6
	ld	[%l7 + 0x2C],	%f18
	sethi	0x1F74,	%l1
	bn,a	loop_662
	bn	loop_663
	popc	0x0004,	%i2
	wr	%g0,	0xe2,	%asi
	stwa	%i4,	[%l7 + 0x1C] %asi
	membar	#Sync
loop_662:
	edge16ln	%i0,	%g2,	%i3
loop_663:
	srax	%o5,	0x1A,	%g6
	alignaddr	%l2,	%o3,	%g5
	edge32n	%o4,	%g1,	%o0
	edge8n	%o7,	%o2,	%g3
	fmovscc	%xcc,	%f3,	%f9
	tneg	%icc,	0x0
	fandnot1	%f30,	%f24,	%f6
	movrgez	%l5,	0x269,	%o6
	tvc	%icc,	0x4
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%i6
	tgu	%icc,	0x6
	edge8l	%l0,	%l6,	%i5
	ta	%xcc,	0x3
	sth	%l3,	[%l7 + 0x2C]
	xnor	%g7,	0x0D4B,	%l4
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%g4
	nop
	fitos	%f11,	%f5
	fstox	%f5,	%f14
	fxtos	%f14,	%f11
	fmovrsne	%i1,	%f13,	%f9
	mulx	%o1,	0x0BFC,	%i6
	alignaddrl	%l1,	%i2,	%i4
	call	loop_664
	move	%xcc,	%i0,	%g2
	fmovde	%icc,	%f28,	%f17
	edge16n	%i3,	%o5,	%g6
loop_664:
	fnot1	%f12,	%f0
	sll	%o3,	0x1E,	%g5
	movvc	%icc,	%o4,	%g1
	orn	%l2,	%o0,	%o7
	alignaddr	%g3,	%o2,	%o6
	nop
	setx	0x477C846E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x099244BC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f7,	%f26
	nop
	setx loop_665, %l0, %l1
	jmpl %l1, %l5
	fmovscs	%icc,	%f17,	%f13
	fbul,a	%fcc1,	loop_666
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_665:
	tne	%icc,	0x7
	tpos	%icc,	0x1
loop_666:
	sth	%i7,	[%l7 + 0x12]
	edge16	%l6,	%i5,	%l0
	orcc	%g7,	%l3,	%l4
	movrne	%i1,	%g4,	%i6
	tcs	%xcc,	0x5
	sdiv	%o1,	0x0DA1,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%i4,	%l1
	fsrc1s	%f7,	%f18
	fbe	%fcc1,	loop_667
	movg	%xcc,	%i0,	%i3
	fands	%f24,	%f12,	%f23
	tsubcc	%g2,	%g6,	%o5
loop_667:
	xorcc	%o3,	0x1D2D,	%o4
	nop
	fitos	%f15,	%f14
	ta	%icc,	0x4
	tvs	%icc,	0x6
	and	%g1,	%l2,	%o0
	sllx	%o7,	0x08,	%g3
	andn	%g5,	0x1F11,	%o6
	bpos,a,pn	%icc,	loop_668
	srlx	%l5,	%o2,	%i7
	tvc	%xcc,	0x3
	addccc	%l6,	%i5,	%l0
loop_668:
	brgz	%l3,	loop_669
	fmovspos	%xcc,	%f8,	%f28
	fnors	%f3,	%f20,	%f19
	edge32l	%g7,	%l4,	%i1
loop_669:
	taddcc	%i6,	0x1F57,	%o1
	edge32l	%g4,	%i4,	%i2
	fpadd32s	%f27,	%f14,	%f10
	movvc	%xcc,	%i0,	%l1
	fmovde	%xcc,	%f1,	%f27
	edge8l	%i3,	%g6,	%g2
	tneg	%icc,	0x0
	fnot2	%f16,	%f16
	ba,a	%xcc,	loop_670
	fbn,a	%fcc2,	loop_671
	nop
	setx	loop_672,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_670:
	fandnot2s	%f18,	%f24,	%f19
loop_671:
	tcc	%icc,	0x2
loop_672:
	tn	%icc,	0x3
	prefetch	[%l7 + 0x70],	 0x0
	xnorcc	%o5,	%o3,	%o4
	tcc	%xcc,	0x2
	stb	%g1,	[%l7 + 0x5F]
	membar	0x2F
	srl	%o0,	0x03,	%l2
	nop
	fitos	%f1,	%f6
	fstox	%f6,	%f6
	fbge	%fcc1,	loop_673
	orncc	%o7,	%g3,	%o6
	ldsw	[%l7 + 0x58],	%g5
	tleu	%xcc,	0x3
loop_673:
	movle	%xcc,	%l5,	%i7
	andncc	%l6,	%o2,	%l0
	orncc	%i5,	%l3,	%l4
	fmovsgu	%xcc,	%f14,	%f27
	ld	[%l7 + 0x24],	%f12
	fmovdge	%xcc,	%f24,	%f1
	sdivcc	%g7,	0x11B3,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%i6,	%g4
	fabsd	%f30,	%f6
	bcc,a	%xcc,	loop_674
	movleu	%icc,	%i4,	%i2
	umul	%o1,	%l1,	%i3
	te	%icc,	0x4
loop_674:
	srlx	%g6,	0x1A,	%g2
	brnz	%i0,	loop_675
	smul	%o3,	0x17C8,	%o5
	addc	%o4,	%o0,	%l2
	edge32	%g1,	%o7,	%o6
loop_675:
	taddcc	%g5,	%l5,	%i7
	tcs	%icc,	0x4
	tge	%xcc,	0x6
	fmovdvs	%icc,	%f26,	%f14
	set	0x64, %o7
	swapa	[%l7 + %o7] 0x88,	%g3
	movrlez	%l6,	%l0,	%i5
	nop
	setx	loop_676,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivcc	%o2,	0x0767,	%l3
	fmovdcc	%icc,	%f15,	%f0
	nop
	setx	0xF7E31563C048D77B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
loop_676:
	nop
	set	0x10, %l2
	stxa	%l4,	[%l7 + %l2] 0xe2
	membar	#Sync
	edge16n	%i1,	%i6,	%g4
	bpos	%icc,	loop_677
	sllx	%i4,	%g7,	%o1
	edge8	%l1,	%i2,	%i3
	xnorcc	%g2,	0x1D0D,	%i0
loop_677:
	fbul,a	%fcc3,	loop_678
	alignaddrl	%o3,	%g6,	%o4
	array8	%o0,	%o5,	%l2
	array32	%o7,	%o6,	%g5
loop_678:
	movneg	%xcc,	%g1,	%i7
	edge16n	%l5,	%g3,	%l6
	fmovda	%icc,	%f16,	%f23
	fmovsa	%xcc,	%f7,	%f19
	taddcctv	%i5,	0x116B,	%o2
	fmovrslz	%l3,	%f20,	%f11
	nop
	setx	0xC6304831,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x2D0BD58E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f0,	%f29
	sllx	%l0,	0x15,	%i1
	popc	%l4,	%i6
	be,pn	%icc,	loop_679
	array32	%i4,	%g7,	%g4
	array32	%l1,	%o1,	%i2
	nop
	setx	0x4E1E6232,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x3479620B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f2,	%f23
loop_679:
	movrlez	%i3,	%i0,	%g2
	sethi	0x0514,	%o3
	subc	%g6,	%o4,	%o5
	srlx	%l2,	0x03,	%o7
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f30
	fxtod	%f30,	%f20
	alignaddrl	%o6,	%o0,	%g5
	stw	%g1,	[%l7 + 0x38]
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x44] %asi,	%i7
	fba	%fcc3,	loop_680
	bshuffle	%f6,	%f0,	%f8
	fxnor	%f4,	%f8,	%f16
	move	%icc,	%l5,	%l6
loop_680:
	movvc	%xcc,	%g3,	%i5
	fmovdneg	%icc,	%f5,	%f24
	movcs	%xcc,	%o2,	%l3
	movn	%xcc,	%i1,	%l4
	edge32ln	%i6,	%l0,	%i4
	umul	%g7,	0x0421,	%g4
	be,pn	%icc,	loop_681
	sll	%l1,	%o1,	%i3
	edge16ln	%i2,	%g2,	%o3
	fbue	%fcc1,	loop_682
loop_681:
	fmovdl	%icc,	%f18,	%f1
	xnor	%i0,	%o4,	%g6
	movge	%xcc,	%l2,	%o7
loop_682:
	swap	[%l7 + 0x14],	%o6
	array32	%o0,	%g5,	%g1
	ldd	[%l7 + 0x38],	%i6
	brnz	%l5,	loop_683
	array16	%o5,	%g3,	%i5
	fmovsleu	%icc,	%f14,	%f28
	movrgez	%o2,	%l6,	%i1
loop_683:
	fmovdvs	%icc,	%f6,	%f5
	tgu	%xcc,	0x4
	sdivcc	%l4,	0x1904,	%i6
	fpsub32s	%f20,	%f24,	%f18
	xorcc	%l0,	%l3,	%i4
	movne	%icc,	%g4,	%g7
	tle	%icc,	0x7
	edge16l	%o1,	%l1,	%i2
	movre	%g2,	%o3,	%i3
	brgz	%o4,	loop_684
	bneg,pn	%icc,	loop_685
	nop
	setx	loop_686,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%i0,	0x0E88,	%g6
loop_684:
	fpadd16s	%f30,	%f4,	%f5
loop_685:
	udivcc	%o7,	0x1B61,	%o6
loop_686:
	nop
	set	0x6B, %i4
	ldstuba	[%l7 + %i4] 0x0c,	%o0
	xor	%g5,	0x1536,	%l2
	sdiv	%g1,	0x19E1,	%l5
	tl	%icc,	0x2
	orncc	%o5,	0x137C,	%g3
	ldd	[%l7 + 0x10],	%i4
	wr	%g0,	0x89,	%asi
	stwa	%i7,	[%l7 + 0x64] %asi
	movcs	%icc,	%o2,	%l6
	bcc	loop_687
	sir	0x0C0E
	taddcc	%l4,	%i6,	%i1
	movge	%icc,	%l3,	%l0
loop_687:
	fzero	%f4
	fmovrdgz	%i4,	%f8,	%f14
	brz	%g4,	loop_688
	fmovd	%f30,	%f28
	set	0x60, %g4
	swapa	[%l7 + %g4] 0x10,	%g7
loop_688:
	or	%l1,	0x07B5,	%o1
	nop
	setx loop_689, %l0, %l1
	jmpl %l1, %g2
	sra	%o3,	%i2,	%i3
	bpos,pt	%xcc,	loop_690
	edge8n	%o4,	%g6,	%o7
loop_689:
	nop
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x40] %asi,	%o6
loop_690:
	tg	%xcc,	0x2
	fmovdne	%icc,	%f24,	%f6
	nop
	setx	0xBD0FCE39,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x43F63F87,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f16,	%f5
	tle	%icc,	0x3
	ble,a,pt	%xcc,	loop_691
	movl	%xcc,	%i0,	%g5
	edge32l	%o0,	%l2,	%l5
	udivcc	%g1,	0x155E,	%g3
loop_691:
	edge32n	%o5,	%i5,	%i7
	tge	%xcc,	0x7
	fpmerge	%f15,	%f7,	%f24
	lduh	[%l7 + 0x16],	%o2
	movleu	%xcc,	%l6,	%i6
	tne	%xcc,	0x5
	tsubcc	%l4,	0x187F,	%i1
	ta	%icc,	0x3
	edge32	%l0,	%i4,	%g4
	orncc	%g7,	0x0F28,	%l1
	fone	%f2
	tpos	%icc,	0x5
	movneg	%icc,	%l3,	%o1
	orn	%o3,	%i2,	%i3
	fmovsle	%icc,	%f19,	%f10
	fmovsgu	%icc,	%f31,	%f3
	fbug	%fcc1,	loop_692
	mulx	%o4,	%g6,	%g2
	xnorcc	%o7,	%i0,	%g5
	fpmerge	%f1,	%f5,	%f28
loop_692:
	edge32ln	%o0,	%l2,	%o6
	fmovsn	%xcc,	%f0,	%f15
	tge	%xcc,	0x2
	ble,a	%xcc,	loop_693
	ldsh	[%l7 + 0x1E],	%g1
	edge8n	%l5,	%g3,	%i5
	srlx	%i7,	0x1A,	%o5
loop_693:
	nop
	setx	0x99F3306762E64CEF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x7C87CE816F064573,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f14,	%f28
	alignaddr	%o2,	%i6,	%l4
	andn	%l6,	0x0F78,	%i1
	sdivcc	%l0,	0x1B15,	%g4
	alignaddr	%i4,	%g7,	%l3
	fbn	%fcc0,	loop_694
	bgu,pt	%icc,	loop_695
	tle	%icc,	0x5
	subcc	%o1,	0x1712,	%l1
loop_694:
	edge32ln	%o3,	%i2,	%i3
loop_695:
	popc	%o4,	%g6
	ba,a	loop_696
	or	%o7,	%g2,	%i0
	edge16l	%o0,	%l2,	%g5
	srax	%o6,	0x0B,	%l5
loop_696:
	sdivx	%g3,	0x14DC,	%g1
	orncc	%i5,	%o5,	%i7
	srl	%i6,	%l4,	%o2
	fcmpgt32	%f22,	%f22,	%l6
	fmovdleu	%xcc,	%f16,	%f25
	tcc	%xcc,	0x0
	tvs	%xcc,	0x0
	bge,pn	%xcc,	loop_697
	mova	%xcc,	%l0,	%g4
	std	%f22,	[%l7 + 0x20]
	movneg	%xcc,	%i4,	%i1
loop_697:
	taddcc	%l3,	0x114E,	%g7
	subcc	%l1,	0x0A3F,	%o1
	brgez	%o3,	loop_698
	xnor	%i2,	%i3,	%o4
	prefetch	[%l7 + 0x1C],	 0x3
	movrlez	%g6,	%o7,	%g2
loop_698:
	movcs	%icc,	%i0,	%o0
	tsubcctv	%g5,	0x02B4,	%o6
	fmuld8ulx16	%f25,	%f2,	%f6
	nop
	set	0x30, %o2
	stx	%l5,	[%l7 + %o2]
	udivx	%g3,	0x1407,	%g1
	bg,a	%xcc,	loop_699
	movl	%icc,	%l2,	%i5
	membar	0x1E
	movrgz	%i7,	%o5,	%l4
loop_699:
	fmovrdlz	%i6,	%f16,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l6,	%o2,	%g4
	fbe	%fcc3,	loop_700
	edge32n	%i4,	%i1,	%l3
	add	%l0,	%g7,	%l1
	srlx	%o1,	%i2,	%o3
loop_700:
	fbg,a	%fcc1,	loop_701
	sdivcc	%i3,	0x1A65,	%o4
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%g6
	nop
	set	0x68, %i0
	lduw	[%l7 + %i0],	%g2
loop_701:
	movleu	%icc,	%i0,	%o0
	tne	%xcc,	0x7
	swap	[%l7 + 0x78],	%g5
	bgu,pn	%xcc,	loop_702
	subc	%o6,	0x1E98,	%o7
	fmovrdlz	%l5,	%f8,	%f10
	movcc	%xcc,	%g1,	%l2
loop_702:
	fmovrse	%g3,	%f17,	%f3
	edge16n	%i7,	%i5,	%l4
	fnors	%f7,	%f3,	%f18
	for	%f28,	%f10,	%f14
	sllx	%o5,	%i6,	%l6
	edge16ln	%o2,	%i4,	%i1
	bl,a	loop_703
	movrgz	%l3,	0x204,	%g4
	fnegd	%f10,	%f28
	brgez	%g7,	loop_704
loop_703:
	movrgz	%l1,	0x2DB,	%o1
	umulcc	%i2,	0x1832,	%o3
	fcmple16	%f20,	%f8,	%l0
loop_704:
	subcc	%i3,	%o4,	%g6
	tneg	%icc,	0x2
	bg	%xcc,	loop_705
	movre	%i0,	%g2,	%o0
	nop
	setx	0xA92E8410606EAD10,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	sll	%g5,	0x16,	%o7
loop_705:
	fmovrdlz	%o6,	%f14,	%f28
	fbg,a	%fcc2,	loop_706
	edge32l	%g1,	%l5,	%l2
	fands	%f7,	%f4,	%f25
	alignaddrl	%i7,	%i5,	%g3
loop_706:
	tsubcc	%o5,	%i6,	%l6
	tsubcc	%o2,	%l4,	%i4
	taddcctv	%l3,	0x0CC3,	%i1
	fbule	%fcc3,	loop_707
	sir	0x0459
	sethi	0x117A,	%g4
	subcc	%g7,	0x0E38,	%o1
loop_707:
	andncc	%l1,	%o3,	%l0
	movle	%xcc,	%i2,	%o4
	srl	%g6,	%i0,	%i3
	edge8n	%g2,	%o0,	%g5
	lduh	[%l7 + 0x54],	%o7
	te	%xcc,	0x7
	fcmpne32	%f14,	%f8,	%o6
	sllx	%l5,	%l2,	%i7
	std	%f22,	[%l7 + 0x58]
	ldd	[%l7 + 0x38],	%f8
	movneg	%icc,	%i5,	%g3
	brlz	%g1,	loop_708
	edge8n	%i6,	%o5,	%o2
	edge16ln	%l6,	%l4,	%l3
	alignaddrl	%i4,	%g4,	%g7
loop_708:
	fmovsa	%xcc,	%f7,	%f0
	tle	%xcc,	0x0
	sra	%i1,	0x1D,	%o1
	tge	%xcc,	0x1
	fsrc2	%f10,	%f12
	fba,a	%fcc3,	loop_709
	umul	%l1,	0x01E2,	%o3
	fnors	%f31,	%f25,	%f26
	popc	%i2,	%l0
loop_709:
	movrgez	%g6,	%o4,	%i3
	fpmerge	%f23,	%f6,	%f26
	sdiv	%i0,	0x1D3D,	%o0
	stbar
	bvs,a,pt	%icc,	loop_710
	sra	%g5,	%g2,	%o7
	tsubcctv	%l5,	%o6,	%i7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%g3
loop_710:
	tge	%icc,	0x3
	sethi	0x010F,	%l2
	tn	%xcc,	0x1
	mova	%xcc,	%i6,	%g1
	fpmerge	%f28,	%f15,	%f10
	edge8ln	%o5,	%o2,	%l6
	fzeros	%f18
	std	%f0,	[%l7 + 0x40]
	fmovrdne	%l3,	%f30,	%f24
	alignaddr	%l4,	%g4,	%i4
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x15,	%f16
	tl	%xcc,	0x6
	nop
	setx	0x599DAE65705665D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	array32	%i1,	%g7,	%l1
	fbuge,a	%fcc1,	loop_711
	move	%xcc,	%o3,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l0,	0x1C8A,	%g6
loop_711:
	fmul8x16al	%f26,	%f12,	%f4
	edge32ln	%o4,	%o1,	%i0
	fbo,a	%fcc0,	loop_712
	taddcctv	%o0,	%g5,	%g2
	movn	%icc,	%o7,	%l5
	bshuffle	%f10,	%f18,	%f28
loop_712:
	bvc	%icc,	loop_713
	te	%icc,	0x4
	fbug	%fcc0,	loop_714
	movrne	%o6,	0x16E,	%i3
loop_713:
	orcc	%i7,	%i5,	%g3
	fmovdvs	%xcc,	%f12,	%f7
loop_714:
	fmovsn	%icc,	%f15,	%f26
	fmul8x16al	%f16,	%f28,	%f18
	tleu	%icc,	0x3
	bge,pt	%xcc,	loop_715
	tg	%xcc,	0x2
	nop
	fitos	%f0,	%f30
	fstod	%f30,	%f4
	sdiv	%i6,	0x0025,	%l2
loop_715:
	fmovsgu	%icc,	%f29,	%f0
	fnands	%f1,	%f20,	%f27
	movneg	%icc,	%g1,	%o2
	nop
	setx	0xFED9C5635059B10C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	tle	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%o5,	%l3
	tleu	%xcc,	0x1
	movvs	%icc,	%l6,	%g4
	bne,pt	%icc,	loop_716
	udiv	%l4,	0x073B,	%i4
	srl	%i1,	0x0A,	%g7
	edge16	%o3,	%l1,	%l0
loop_716:
	movrlez	%g6,	0x044,	%o4
	movl	%icc,	%i2,	%i0
	movpos	%icc,	%o0,	%o1
	orcc	%g5,	0x1785,	%o7
	sethi	0x0AD0,	%l5
	movge	%icc,	%g2,	%i3
	andcc	%o6,	0x1B87,	%i7
	srl	%g3,	0x16,	%i5
	srax	%l2,	%i6,	%g1
	ldx	[%l7 + 0x20],	%o5
	fble	%fcc0,	loop_717
	addcc	%l3,	%l6,	%g4
	movrlz	%o2,	%i4,	%l4
	sllx	%g7,	0x0F,	%o3
loop_717:
	andncc	%l1,	%i1,	%l0
	membar	0x39
	be,pn	%xcc,	loop_718
	call	loop_719
	fpmerge	%f9,	%f14,	%f12
	edge16n	%g6,	%o4,	%i0
loop_718:
	movleu	%xcc,	%o0,	%o1
loop_719:
	fnor	%f8,	%f12,	%f6
	stw	%i2,	[%l7 + 0x6C]
	tn	%xcc,	0x5
	edge8n	%o7,	%g5,	%l5
	fbu	%fcc0,	loop_720
	orcc	%g2,	0x16D3,	%i3
	edge16n	%i7,	%o6,	%g3
	tvs	%xcc,	0x0
loop_720:
	edge16	%i5,	%i6,	%l2
	brnz,a	%g1,	loop_721
	udivx	%l3,	0x00AB,	%o5
	te	%xcc,	0x7
	udiv	%l6,	0x04F9,	%o2
loop_721:
	fble,a	%fcc3,	loop_722
	addccc	%i4,	%l4,	%g4
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x5C] %asi,	%f16
loop_722:
	sub	%o3,	0x083D,	%g7
	fnors	%f9,	%f18,	%f22
	alignaddrl	%l1,	%l0,	%g6
	fble	%fcc3,	loop_723
	udivx	%i1,	0x032C,	%o4
	mulx	%o0,	0x19E4,	%i0
	move	%icc,	%i2,	%o7
loop_723:
	srl	%o1,	0x1C,	%g5
	sir	0x160B
	nop
	setx	0x5F2F2756,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x03B30C09,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f1,	%f3
	swap	[%l7 + 0x30],	%l5
	lduw	[%l7 + 0x58],	%g2
	nop
	fitod	%f2,	%f4
	fdtoi	%f4,	%f7
	tne	%xcc,	0x4
	bne	loop_724
	sdivcc	%i7,	0x0BFB,	%i3
	ldub	[%l7 + 0x29],	%g3
	brgez	%i5,	loop_725
loop_724:
	xor	%o6,	%l2,	%i6
	move	%icc,	%g1,	%o5
	fmovsvs	%xcc,	%f29,	%f22
loop_725:
	fornot1s	%f14,	%f22,	%f3
	movcc	%icc,	%l3,	%l6
	fnands	%f13,	%f1,	%f28
	edge8	%o2,	%l4,	%g4
	addcc	%i4,	%g7,	%l1
	movneg	%xcc,	%o3,	%g6
	addc	%l0,	0x1EB4,	%o4
	subc	%i1,	0x07C0,	%i0
	sth	%i2,	[%l7 + 0x70]
	fmovdcs	%icc,	%f14,	%f31
	smulcc	%o0,	0x0924,	%o1
	move	%icc,	%o7,	%l5
	edge16n	%g2,	%g5,	%i3
	andcc	%i7,	0x1C51,	%g3
	fpadd16s	%f20,	%f14,	%f0
	edge32l	%i5,	%o6,	%i6
	umul	%l2,	0x1FC2,	%g1
	tvs	%icc,	0x4
	orncc	%o5,	%l6,	%l3
	movrgz	%o2,	0x1A4,	%l4
	orcc	%g4,	0x12DD,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l1,	%o3,	%g6
	bgu,a,pt	%icc,	loop_726
	std	%f0,	[%l7 + 0x18]
	ld	[%l7 + 0x3C],	%f30
	pdist	%f2,	%f12,	%f20
loop_726:
	fbe	%fcc1,	loop_727
	alignaddrl	%g7,	%o4,	%i1
	mova	%icc,	%i0,	%l0
	sth	%i2,	[%l7 + 0x38]
loop_727:
	movrlz	%o1,	0x356,	%o0
	array8	%l5,	%o7,	%g2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	orcc	%i3,	%g5,	%i7
	fmul8sux16	%f22,	%f8,	%f4
	fmovdcs	%xcc,	%f7,	%f6
	tsubcc	%i5,	0x06B1,	%g3
	sethi	0x034C,	%i6
	nop
	setx	0xF06B215D,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	stx	%l2,	[%l7 + 0x48]
	edge16n	%o6,	%g1,	%l6
	brnz,a	%o5,	loop_728
	ldx	[%l7 + 0x30],	%l3
	orncc	%l4,	%o2,	%i4
	set	0x60, %g7
	ldxa	[%l7 + %g7] 0x80,	%l1
loop_728:
	fble,a	%fcc2,	loop_729
	nop
	setx	0x05757306183D04B1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xBE191E877D67F563,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f12,	%f26
	sdiv	%g4,	0x15FF,	%o3
	lduh	[%l7 + 0x1C],	%g6
loop_729:
	move	%icc,	%g7,	%i1
	tge	%xcc,	0x4
	brz	%i0,	loop_730
	udiv	%o4,	0x090C,	%l0
	fnot1	%f6,	%f4
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x04,	%f0
loop_730:
	umulcc	%o1,	%o0,	%l5
	movrlez	%o7,	0x00B,	%i2
	fornot1	%f22,	%f20,	%f0
	movg	%xcc,	%g2,	%i3
	nop
	setx	loop_731,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andn	%g5,	0x0405,	%i7
	movne	%xcc,	%i5,	%i6
	nop
	set	0x08, %l0
	std	%f14,	[%l7 + %l0]
loop_731:
	fmovs	%f19,	%f15
	movgu	%icc,	%l2,	%o6
	set	0x5D, %l5
	ldsba	[%l7 + %l5] 0x11,	%g3
	addc	%l6,	0x1921,	%o5
	tneg	%icc,	0x3
	movne	%xcc,	%g1,	%l4
	edge8l	%o2,	%l3,	%i4
	smul	%g4,	%l1,	%g6
	tvc	%xcc,	0x6
	set	0x11, %o4
	stba	%o3,	[%l7 + %o4] 0x23
	membar	#Sync
	tsubcctv	%g7,	%i0,	%o4
	set	0x38, %i6
	ldstuba	[%l7 + %i6] 0x89,	%l0
	taddcctv	%o1,	0x192B,	%i1
	movrne	%l5,	%o7,	%i2
	udivcc	%g2,	0x1879,	%o0
	fbne	%fcc2,	loop_732
	membar	0x1E
	alignaddr	%g5,	%i3,	%i5
	stw	%i6,	[%l7 + 0x1C]
loop_732:
	edge8ln	%l2,	%i7,	%g3
	fmovdge	%xcc,	%f1,	%f24
	tcc	%xcc,	0x0
	and	%l6,	%o5,	%o6
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x22,	%l4
	tg	%xcc,	0x4
	tcs	%icc,	0x5
	movg	%icc,	%g1,	%l3
	alignaddr	%i4,	%o2,	%l1
	mulscc	%g4,	%g6,	%o3
	edge16	%i0,	%g7,	%o4
	fmovdge	%xcc,	%f13,	%f16
	subccc	%l0,	0x0151,	%o1
	fpsub16s	%f0,	%f14,	%f16
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x88
	bpos,pt	%icc,	loop_733
	bvc	%xcc,	loop_734
	taddcc	%l5,	0x1FEF,	%o7
	tgu	%xcc,	0x1
loop_733:
	fbg	%fcc2,	loop_735
loop_734:
	xorcc	%i1,	0x0C6D,	%g2
	andcc	%o0,	%i2,	%i3
	brlez,a	%i5,	loop_736
loop_735:
	movneg	%xcc,	%g5,	%l2
	nop
	setx	0xEF36C0BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x7E1E9B31,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f25,	%f5
	tcs	%xcc,	0x7
loop_736:
	tcs	%icc,	0x5
	tl	%xcc,	0x1
	fmovrsne	%i6,	%f22,	%f27
	mova	%xcc,	%g3,	%l6
	fmovdvc	%xcc,	%f18,	%f15
	fmovdvc	%xcc,	%f23,	%f24
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%f18
	edge16	%i7,	%o6,	%o5
	edge16l	%l4,	%g1,	%i4
	tsubcctv	%o2,	0x11EA,	%l1
	brnz	%g4,	loop_737
	tl	%icc,	0x6
	movg	%xcc,	%l3,	%o3
	swap	[%l7 + 0x24],	%i0
loop_737:
	sdiv	%g6,	0x16F5,	%o4
	tg	%icc,	0x2
	tvc	%xcc,	0x1
	subccc	%l0,	%g7,	%l5
	movgu	%icc,	%o1,	%i1
	popc	%o7,	%o0
	movcc	%xcc,	%i2,	%i3
	udiv	%g2,	0x004A,	%g5
	membar	0x47
	fpsub16s	%f27,	%f0,	%f29
	sethi	0x0E78,	%i5
	umulcc	%i6,	0x03B2,	%l2
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x74] %asi,	%l6
	orcc	%g3,	%o6,	%i7
	udiv	%l4,	0x00F0,	%o5
	fmovsn	%xcc,	%f7,	%f12
	bleu,pt	%xcc,	loop_738
	smulcc	%g1,	%o2,	%i4
	popc	%l1,	%l3
	nop
	setx	0x4ABDEBBF90478B35,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
loop_738:
	srax	%o3,	0x05,	%g4
	tsubcc	%g6,	0x1B64,	%i0
	set	0x60, %i5
	sta	%f21,	[%l7 + %i5] 0x19
	addc	%o4,	0x1F87,	%l0
	fnors	%f0,	%f7,	%f15
	fnegs	%f0,	%f21
	movre	%g7,	0x297,	%o1
	andncc	%l5,	%o7,	%i1
	taddcc	%o0,	%i2,	%i3
	smulcc	%g5,	%g2,	%i5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%i6
	popc	%l2,	%g3
	fmovdn	%xcc,	%f5,	%f26
	tsubcc	%l6,	%o6,	%i7
	and	%o5,	0x16DE,	%l4
	sll	%o2,	%i4,	%g1
	movleu	%icc,	%l3,	%o3
	taddcc	%l1,	0x13BE,	%g4
	bge	%icc,	loop_739
	movpos	%xcc,	%g6,	%o4
	bcc,pn	%icc,	loop_740
	movrgez	%i0,	0x378,	%l0
loop_739:
	tn	%icc,	0x0
	tn	%xcc,	0x3
loop_740:
	nop
	setx	0x0F12FBDA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f7
	fbule	%fcc0,	loop_741
	sra	%o1,	%g7,	%o7
	nop
	setx	0x72133CDB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xC1B40EC2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f7,	%f10
	nop
	setx	0x79D3B0D5B98EA150,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x9EDD52AC4E99BCB2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f6,	%f24
loop_741:
	movvc	%icc,	%l5,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i2,	%i1,	%g5
	movge	%xcc,	%i3,	%i5
	bge	loop_742
	edge32n	%g2,	%i6,	%l2
	tn	%icc,	0x6
	wr	%g0,	0x2b,	%asi
	stba	%l6,	[%l7 + 0x59] %asi
	membar	#Sync
loop_742:
	movvs	%icc,	%o6,	%g3
	ldd	[%l7 + 0x08],	%f30
	fmul8x16al	%f26,	%f1,	%f6
	popc	%i7,	%l4
	sdivx	%o2,	0x1D4D,	%o5
	tgu	%xcc,	0x7
	movrgez	%i4,	0x09C,	%l3
	faligndata	%f6,	%f6,	%f6
	tn	%xcc,	0x4
	edge8	%o3,	%g1,	%g4
	ld	[%l7 + 0x78],	%f13
	edge8l	%l1,	%o4,	%g6
	edge32n	%i0,	%o1,	%g7
	movl	%icc,	%l0,	%l5
	udiv	%o0,	0x03A6,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i1,	%i2,	%g5
	ldstub	[%l7 + 0x60],	%i5
	tcs	%xcc,	0x3
	tcs	%xcc,	0x3
	bleu,pt	%xcc,	loop_743
	fmovsl	%icc,	%f3,	%f12
	or	%g2,	0x19CD,	%i6
	fbn,a	%fcc0,	loop_744
loop_743:
	alignaddr	%l2,	%i3,	%o6
	movgu	%xcc,	%g3,	%l6
	array32	%i7,	%o2,	%o5
loop_744:
	nop
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x50] %asi,	%l4
	taddcctv	%i4,	%o3,	%l3
	nop
	set	0x11, %g2
	ldstub	[%l7 + %g2],	%g1
	move	%xcc,	%g4,	%o4
	tl	%xcc,	0x5
	movge	%xcc,	%l1,	%i0
	tg	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x0
	fbne,a	%fcc1,	loop_745
	edge16	%o1,	%g7,	%l0
	nop
	setx	0x8F07996B70007E31,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x493536CD1A009536,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f22,	%f30
	addc	%l5,	%g6,	%o7
loop_745:
	stb	%i1,	[%l7 + 0x3F]
	fmovde	%icc,	%f31,	%f24
	wr	%g0,	0xea,	%asi
	stha	%i2,	[%l7 + 0x0E] %asi
	membar	#Sync
	fbo,a	%fcc3,	loop_746
	movg	%xcc,	%g5,	%i5
	edge16n	%g2,	%o0,	%l2
	stbar
loop_746:
	tpos	%icc,	0x5
	tge	%icc,	0x5
	alignaddr	%i3,	%o6,	%g3
	array8	%l6,	%i6,	%i7
	nop
	setx	0x4650BA1EF04C843A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f8
	fxtod	%f8,	%f22
	movge	%xcc,	%o5,	%l4
	ta	%xcc,	0x7
	fornot1	%f4,	%f28,	%f2
	bneg,a	loop_747
	tcs	%xcc,	0x7
	fnands	%f23,	%f8,	%f10
	tvs	%xcc,	0x7
loop_747:
	orncc	%o2,	0x0595,	%o3
	fbe	%fcc1,	loop_748
	bpos,pn	%xcc,	loop_749
	fblg	%fcc3,	loop_750
	addc	%i4,	%l3,	%g4
loop_748:
	brgez,a	%o4,	loop_751
loop_749:
	smulcc	%g1,	0x0966,	%l1
loop_750:
	tvc	%icc,	0x2
	fbul,a	%fcc0,	loop_752
loop_751:
	fnot2s	%f20,	%f20
	taddcc	%i0,	0x0EA0,	%o1
	nop
	setx	0x1913E738,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xEE213D67,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f29,	%f24
loop_752:
	alignaddr	%g7,	%l5,	%l0
	movge	%xcc,	%o7,	%i1
	movl	%icc,	%g6,	%i2
	fbue,a	%fcc0,	loop_753
	movpos	%xcc,	%g5,	%g2
	fpmerge	%f13,	%f25,	%f6
	sub	%i5,	0x1F4D,	%l2
loop_753:
	subccc	%i3,	0x19BE,	%o0
	srl	%o6,	%g3,	%i6
	edge16ln	%l6,	%i7,	%o5
	nop
	setx	0xAB208FE8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xE213637A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f3,	%f17
	fone	%f24
	fcmpne32	%f4,	%f6,	%l4
	movne	%icc,	%o3,	%i4
	bne	%xcc,	loop_754
	movcs	%xcc,	%l3,	%g4
	tcs	%xcc,	0x6
	edge16	%o4,	%o2,	%g1
loop_754:
	bcc	loop_755
	fmovscs	%icc,	%f4,	%f16
	nop
	setx	0xD9AC386C96A76CDA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xF002FF405C1F807B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f12,	%f30
	nop
	setx	0x33E9E982,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f21
loop_755:
	edge8	%i0,	%o1,	%l1
	or	%g7,	0x1E96,	%l5
	fmovsleu	%icc,	%f17,	%f3
	fmovsge	%xcc,	%f2,	%f17
	xor	%l0,	%i1,	%o7
	edge16l	%i2,	%g5,	%g2
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x44] %asi,	%i5
	fmovda	%icc,	%f19,	%f28
	movre	%l2,	%g6,	%i3
	movrlz	%o6,	%g3,	%o0
	smulcc	%i6,	0x121B,	%l6
	brlz,a	%o5,	loop_756
	be,a,pt	%icc,	loop_757
	prefetch	[%l7 + 0x64],	 0x2
	movcs	%icc,	%l4,	%i7
loop_756:
	fbu,a	%fcc2,	loop_758
loop_757:
	xnorcc	%i4,	0x03C5,	%o3
	movre	%g4,	%l3,	%o4
	edge16l	%o2,	%i0,	%o1
loop_758:
	st	%f1,	[%l7 + 0x7C]
	movl	%icc,	%g1,	%g7
	array32	%l1,	%l0,	%i1
	tg	%xcc,	0x4
	xnor	%l5,	%i2,	%g5
	bcs	loop_759
	xnor	%o7,	0x1F5E,	%g2
	sir	0x17BA
	tneg	%xcc,	0x4
loop_759:
	xor	%i5,	%g6,	%l2
	movge	%xcc,	%i3,	%g3
	set	0x42, %g5
	lduba	[%l7 + %g5] 0x81,	%o0
	set	0x10, %o3
	stwa	%i6,	[%l7 + %o3] 0x19
	tcs	%icc,	0x4
	edge8ln	%l6,	%o5,	%o6
	srlx	%l4,	0x12,	%i7
	subc	%o3,	0x0C9C,	%g4
	fmovrdlz	%i4,	%f12,	%f20
	popc	0x0D8B,	%l3
	fblg	%fcc0,	loop_760
	ta	%icc,	0x7
	tgu	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	stwa	%o4,	[%l7 + 0x38] %asi
loop_760:
	movg	%xcc,	%i0,	%o1
	smul	%g1,	0x1F7C,	%g7
	fmuld8ulx16	%f30,	%f20,	%f26
	fmul8ulx16	%f22,	%f28,	%f10
	ldd	[%l7 + 0x58],	%l0
	subc	%o2,	0x0E83,	%l0
	ld	[%l7 + 0x24],	%f25
	sdivx	%i1,	0x16B0,	%i2
	edge32ln	%l5,	%o7,	%g5
	tsubcctv	%g2,	0x103E,	%i5
	tl	%icc,	0x6
	udiv	%l2,	0x1763,	%i3
	array32	%g6,	%o0,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%i6,	%o5
	array16	%o6,	%l6,	%l4
	fmovdl	%xcc,	%f24,	%f19
	fmovdvc	%icc,	%f4,	%f3
	mulscc	%i7,	%o3,	%i4
	udivx	%g4,	0x0493,	%o4
	srl	%i0,	%o1,	%g1
	sth	%l3,	[%l7 + 0x2A]
	lduh	[%l7 + 0x36],	%l1
	nop
	setx	loop_761,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvs	%xcc,	0x6
	tsubcctv	%o2,	%l0,	%g7
	nop
	fitos	%f30,	%f0
loop_761:
	movn	%icc,	%i1,	%l5
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
	movge	%xcc,	%i2,	%g5
	bl,pn	%icc,	loop_762
	tsubcctv	%i5,	%l2,	%g2
	brgez,a	%i3,	loop_763
	udivx	%g6,	0x0010,	%g3
loop_762:
	movcc	%xcc,	%i6,	%o5
	udivcc	%o0,	0x00EA,	%o6
loop_763:
	ldsb	[%l7 + 0x2A],	%l4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%l6,	%i7
	set	0x58, %o1
	ldxa	[%l7 + %o1] 0x10,	%o3
	ldstub	[%l7 + 0x39],	%g4
	fmovdgu	%icc,	%f8,	%f17
	add	%o4,	0x1ED7,	%i0
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	udivx	%o1,	0x0302,	%i4
	fornot2s	%f1,	%f26,	%f16
	and	%g1,	%l1,	%o2
	addcc	%l3,	%g7,	%l0
	fcmpne32	%f16,	%f8,	%l5
	movpos	%icc,	%i1,	%i2
	and	%o7,	%i5,	%l2
	fmovdl	%xcc,	%f16,	%f22
	fmovdl	%xcc,	%f11,	%f4
	fbul,a	%fcc1,	loop_764
	addcc	%g2,	%g5,	%g6
	srax	%g3,	%i3,	%i6
	bn,a,pn	%icc,	loop_765
loop_764:
	sdivcc	%o0,	0x1321,	%o5
	fbge,a	%fcc0,	loop_766
	edge8n	%l4,	%o6,	%l6
loop_765:
	ldsh	[%l7 + 0x18],	%i7
	fmovrdne	%o3,	%f2,	%f16
loop_766:
	mova	%xcc,	%o4,	%g4
	nop
	setx	0x70408538,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	be	loop_767
	fble,a	%fcc0,	loop_768
	bg,a	%xcc,	loop_769
	fmovdpos	%xcc,	%f12,	%f25
loop_767:
	tge	%icc,	0x0
loop_768:
	subccc	%o1,	0x16D6,	%i4
loop_769:
	fpackfix	%f10,	%f20
	set	0x4C, %i3
	stha	%g1,	[%l7 + %i3] 0x15
	movneg	%xcc,	%i0,	%o2
	sdivx	%l3,	0x03A6,	%l1
	fmovscs	%icc,	%f29,	%f22
	fbge,a	%fcc3,	loop_770
	brnz	%g7,	loop_771
	stbar
	fnot1s	%f10,	%f13
loop_770:
	be,a,pt	%xcc,	loop_772
loop_771:
	or	%l0,	%i1,	%i2
	smul	%o7,	%l5,	%i5
	srlx	%l2,	%g5,	%g6
loop_772:
	srl	%g3,	0x09,	%i3
	brgez	%i6,	loop_773
	sra	%g2,	%o5,	%l4
	fsrc2s	%f23,	%f6
	srax	%o6,	%o0,	%l6
loop_773:
	fbul	%fcc3,	loop_774
	bcs,a,pn	%icc,	loop_775
	movrne	%o3,	%o4,	%g4
	udivx	%o1,	0x0057,	%i4
loop_774:
	edge8	%i7,	%g1,	%i0
loop_775:
	fand	%f14,	%f0,	%f8
	edge16l	%o2,	%l3,	%g7
	sdiv	%l0,	0x0921,	%i1
	fcmple16	%f4,	%f18,	%i2
	movge	%xcc,	%o7,	%l5
	movrlez	%l1,	0x24C,	%l2
	fbul	%fcc3,	loop_776
	movrgez	%g5,	0x0DA,	%i5
	tsubcc	%g3,	%g6,	%i3
	bl	%icc,	loop_777
loop_776:
	fbe	%fcc1,	loop_778
	edge8l	%g2,	%o5,	%l4
	fbo	%fcc1,	loop_779
loop_777:
	bn,a	%icc,	loop_780
loop_778:
	edge16ln	%o6,	%o0,	%i6
	tcc	%xcc,	0x5
loop_779:
	edge8ln	%o3,	%l6,	%g4
loop_780:
	fexpand	%f28,	%f10
	addc	%o4,	0x12A5,	%i4
	bge,pn	%xcc,	loop_781
	orncc	%i7,	%o1,	%g1
	edge32	%o2,	%i0,	%l3
	fcmpne16	%f0,	%f10,	%l0
loop_781:
	edge32n	%i1,	%g7,	%o7
	tpos	%xcc,	0x0
	fxor	%f6,	%f28,	%f30
	addcc	%l5,	%i2,	%l1
	fpack32	%f30,	%f28,	%f10
	movl	%xcc,	%g5,	%l2
	smul	%g3,	0x0C17,	%i5
	srl	%i3,	0x10,	%g2
	be,pn	%xcc,	loop_782
	smul	%o5,	0x18FA,	%l4
	orncc	%o6,	0x08E2,	%o0
	wr	%g0,	0x22,	%asi
	stba	%i6,	[%l7 + 0x78] %asi
	membar	#Sync
loop_782:
	addccc	%g6,	0x0D0C,	%o3
	popc	%l6,	%g4
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x70] %asi,	%o4
	mulscc	%i7,	0x1BFD,	%i4
	fbuge	%fcc0,	loop_783
	udiv	%o1,	0x0D36,	%o2
	edge8	%i0,	%l3,	%g1
	andn	%i1,	0x079F,	%g7
loop_783:
	movle	%xcc,	%l0,	%o7
	movrne	%i2,	%l5,	%g5
	tgu	%xcc,	0x3
	fabss	%f21,	%f1
	srax	%l1,	%g3,	%l2
	flush	%l7 + 0x34
	nop
	set	0x2E, %l6
	ldsb	[%l7 + %l6],	%i5
	movne	%icc,	%i3,	%o5
	andcc	%g2,	%o6,	%o0
	edge32n	%i6,	%l4,	%g6
	movle	%xcc,	%o3,	%l6
	fmovdleu	%icc,	%f16,	%f20
	tsubcc	%g4,	%i7,	%i4
	sra	%o4,	%o2,	%o1
	fmovspos	%xcc,	%f21,	%f6
	array8	%i0,	%l3,	%g1
	subc	%g7,	%i1,	%o7
	movcc	%xcc,	%l0,	%i2
	tg	%xcc,	0x7
	fexpand	%f29,	%f14
	orn	%l5,	%l1,	%g3
	fnot1s	%f27,	%f16
	wr	%g0,	0xe2,	%asi
	stha	%l2,	[%l7 + 0x0E] %asi
	membar	#Sync
	tg	%xcc,	0x3
	nop
	setx	0xA07AC8C3,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	edge16l	%i5,	%g5,	%i3
	movrlez	%g2,	%o6,	%o0
	bne,a,pn	%icc,	loop_784
	edge16n	%i6,	%l4,	%o5
	edge32	%o3,	%g6,	%l6
	nop
	fitod	%f12,	%f10
	fdtoi	%f10,	%f7
loop_784:
	movn	%xcc,	%i7,	%g4
	movrlez	%o4,	%i4,	%o2
	edge32n	%o1,	%i0,	%g1
	set	0x28, %l1
	stwa	%g7,	[%l7 + %l1] 0x23
	membar	#Sync
	alignaddrl	%i1,	%l3,	%o7
	movre	%l0,	0x34B,	%i2
	movcc	%xcc,	%l1,	%g3
	fble	%fcc0,	loop_785
	tgu	%xcc,	0x7
	tsubcctv	%l5,	0x10F5,	%l2
	call	loop_786
loop_785:
	fbue	%fcc0,	loop_787
	xnor	%g5,	0x12AD,	%i5
	fmovdvs	%icc,	%f18,	%f31
loop_786:
	std	%f20,	[%l7 + 0x38]
loop_787:
	popc	0x1EDE,	%i3
	subcc	%o6,	0x1B16,	%g2
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o0
	fnors	%f7,	%f8,	%f31
	fornot2s	%f1,	%f23,	%f13
	fmovsn	%xcc,	%f9,	%f13
	stx	%l4,	[%l7 + 0x38]
	alignaddr	%o5,	%o3,	%g6
	smulcc	%i6,	0x1AA5,	%l6
	sra	%g4,	0x10,	%i7
	movn	%xcc,	%i4,	%o2
	ldd	[%l7 + 0x48],	%f28
	fbg,a	%fcc2,	loop_788
	array8	%o1,	%i0,	%o4
	edge32l	%g7,	%i1,	%l3
	fbge	%fcc3,	loop_789
loop_788:
	ble,pt	%icc,	loop_790
	tcs	%icc,	0x4
	subc	%o7,	0x1891,	%g1
loop_789:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l0,	%l1
loop_790:
	fmovsa	%icc,	%f16,	%f12
	set	0x47, %g6
	lduba	[%l7 + %g6] 0x80,	%i2
	fnot2	%f30,	%f20
	fabsd	%f22,	%f16
	nop
	setx	0x7D9E2D8F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x812EA5B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f15,	%f2
	orncc	%l5,	0x18C0,	%g3
	tsubcc	%l2,	0x0EE6,	%g5
	fmovsl	%xcc,	%f1,	%f9
	fba	%fcc2,	loop_791
	edge32ln	%i3,	%o6,	%g2
	fble,a	%fcc3,	loop_792
	fbn,a	%fcc1,	loop_793
loop_791:
	orn	%i5,	0x0763,	%l4
	mulscc	%o5,	0x1FB7,	%o3
loop_792:
	movrlez	%g6,	0x2C8,	%o0
loop_793:
	membar	0x66
	fornot2s	%f22,	%f3,	%f14
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%l6,	%i6
	fpsub32	%f18,	%f20,	%f18
	movg	%icc,	%i7,	%i4
	sdiv	%o2,	0x11B7,	%o1
	fxors	%f8,	%f17,	%f11
	movgu	%icc,	%i0,	%g4
	tle	%icc,	0x6
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x63] %asi,	%g7
	addc	%i1,	0x004A,	%l3
	wr	%g0,	0x04,	%asi
	stba	%o7,	[%l7 + 0x6A] %asi
	add	%g1,	0x0A6B,	%l0
	nop
	fitos	%f1,	%f17
	fstox	%f17,	%f30
	fxtos	%f30,	%f31
	orn	%o4,	0x1DCA,	%i2
	srl	%l1,	%g3,	%l2
	srl	%g5,	0x16,	%i3
	fcmpgt32	%f14,	%f14,	%o6
	subc	%g2,	0x14DE,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f8,	%f10
	fxnor	%f8,	%f0,	%f24
	movrlz	%l4,	0x22E,	%l5
	tvs	%icc,	0x7
	addccc	%o3,	%g6,	%o5
	fmovrdlez	%l6,	%f6,	%f2
	sdiv	%i6,	0x1CD9,	%i7
	movre	%o0,	0x0A0,	%i4
	mulx	%o2,	%i0,	%g4
	edge8ln	%g7,	%i1,	%o1
	xorcc	%l3,	%g1,	%o7
	movvc	%xcc,	%l0,	%o4
	orn	%l1,	0x1E8D,	%g3
	movrgez	%i2,	0x08C,	%l2
	nop
	setx	0x8044D5CB,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	fmovspos	%xcc,	%f15,	%f7
	bvs,pn	%icc,	loop_794
	fzeros	%f1
	sir	0x1554
	xnor	%i3,	0x1477,	%o6
loop_794:
	tle	%xcc,	0x2
	nop
	fitos	%f8,	%f7
	fstoi	%f7,	%f28
	fbl,a	%fcc0,	loop_795
	bleu,a	loop_796
	sra	%g5,	%g2,	%i5
	and	%l4,	0x140A,	%l5
loop_795:
	bg	%xcc,	loop_797
loop_796:
	tn	%xcc,	0x1
	andn	%g6,	0x048A,	%o3
	fmuld8ulx16	%f26,	%f14,	%f28
loop_797:
	brgez,a	%l6,	loop_798
	brlz	%o5,	loop_799
	movrgez	%i7,	%i6,	%o0
	fmovdg	%xcc,	%f5,	%f3
loop_798:
	tvc	%icc,	0x4
loop_799:
	edge16ln	%o2,	%i0,	%i4
	fmovrdlz	%g7,	%f26,	%f16
	set	0x2A, %o6
	stba	%i1,	[%l7 + %o6] 0x22
	membar	#Sync
	movre	%o1,	0x0D6,	%g4
	and	%g1,	%l3,	%l0
	movle	%xcc,	%o4,	%l1
	addc	%o7,	%g3,	%i2
	set	0x40, %i7
	stwa	%i3,	[%l7 + %i7] 0x10
	fmovdle	%xcc,	%f6,	%f8
	tn	%icc,	0x1
	srax	%l2,	0x00,	%g5
	fmovsvc	%xcc,	%f27,	%f31
	fbge	%fcc2,	loop_800
	fmovsvc	%icc,	%f15,	%f1
	tcs	%xcc,	0x5
	fexpand	%f24,	%f2
loop_800:
	fmovrse	%o6,	%f0,	%f9
	nop
	setx	0x7A9DE8F31BC1FFC2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x6B3B13B710BE08C2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f6,	%f6
	fmovdg	%xcc,	%f22,	%f8
	fcmpne32	%f20,	%f4,	%g2
	tleu	%xcc,	0x5
	taddcctv	%l4,	%l5,	%i5
	tneg	%icc,	0x7
	andn	%o3,	0x0490,	%g6
	movne	%icc,	%o5,	%l6
	xnorcc	%i7,	0x1EED,	%i6
	bcs	%xcc,	loop_801
	fmovrdgez	%o0,	%f2,	%f8
	edge16ln	%o2,	%i4,	%i0
	tn	%icc,	0x4
loop_801:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i1
	tvc	%icc,	0x2
	sll	%o1,	%g7,	%g4
	fandnot1	%f20,	%f26,	%f12
	udiv	%l3,	0x0F0A,	%l0
	fmovrslez	%g1,	%f3,	%f13
	add	%l7,	0x54,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%l1
	and	%o7,	%g3,	%i3
	array8	%l2,	%g5,	%o6
	array16	%g2,	%i2,	%l5
	sir	0x0594
	fbl,a	%fcc1,	loop_802
	ldd	[%l7 + 0x30],	%l4
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o3
loop_802:
	mulx	%g6,	0x0D3A,	%i5
	xnor	%o5,	%i7,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o0,	[%l7 + 0x43]
	wr	%g0,	0x23,	%asi
	stha	%i6,	[%l7 + 0x68] %asi
	membar	#Sync
	movle	%xcc,	%o2,	%i4
	umul	%i0,	%o1,	%i1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%g7,	%g4
	bneg	loop_803
	sra	%l3,	0x02,	%g1
	tvc	%icc,	0x0
	fpadd32	%f26,	%f18,	%f8
loop_803:
	mulscc	%l0,	0x0438,	%l1
	mulscc	%o4,	0x0469,	%o7
	set	0x6C, %i1
	ldsha	[%l7 + %i1] 0x11,	%g3
	movne	%icc,	%i3,	%l2
	nop
	setx	loop_804,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_805
	taddcctv	%o6,	0x019F,	%g5
	lduw	[%l7 + 0x60],	%g2
loop_804:
	edge32l	%l5,	%l4,	%o3
loop_805:
	bpos,a	%xcc,	loop_806
	fexpand	%f21,	%f18
	fmovsne	%xcc,	%f22,	%f2
	fzero	%f28
loop_806:
	lduh	[%l7 + 0x4A],	%g6
	and	%i2,	0x1FBC,	%o5
	edge32l	%i7,	%i5,	%l6
	movrgz	%i6,	0x34B,	%o0
	fble	%fcc1,	loop_807
	smulcc	%i4,	%o2,	%o1
	fnegs	%f22,	%f18
	andncc	%i1,	%g7,	%i0
loop_807:
	nop
	set	0x54, %o7
	swapa	[%l7 + %o7] 0x89,	%l3
	movleu	%icc,	%g4,	%l0
	set	0x54, %l2
	ldswa	[%l7 + %l2] 0x81,	%l1
	fmovrdne	%g1,	%f24,	%f26
	set	0x59, %i4
	stba	%o4,	[%l7 + %i4] 0x0c
	brnz	%o7,	loop_808
	alignaddrl	%i3,	%l2,	%g3
	orncc	%g5,	0x1484,	%g2
	bneg	%xcc,	loop_809
loop_808:
	movre	%l5,	0x19F,	%l4
	edge32n	%o6,	%o3,	%i2
	srax	%g6,	0x0F,	%i7
loop_809:
	srax	%i5,	0x00,	%o5
	ldsh	[%l7 + 0x28],	%i6
	nop
	setx	0x1B7C88FC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x373293D8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f23,	%f25
	udiv	%l6,	0x1CA6,	%o0
	fxnor	%f10,	%f22,	%f8
	membar	0x39
	fmovd	%f4,	%f20
	fpmerge	%f29,	%f5,	%f20
	lduw	[%l7 + 0x5C],	%o2
	sllx	%o1,	0x1E,	%i4
	fmovsl	%icc,	%f0,	%f16
	ldd	[%l7 + 0x30],	%f24
	alignaddrl	%g7,	%i1,	%l3
	bge,a,pt	%xcc,	loop_810
	fornot2s	%f25,	%f5,	%f27
	ld	[%l7 + 0x08],	%f3
	ta	%xcc,	0x4
loop_810:
	move	%icc,	%g4,	%l0
	umul	%i0,	0x149D,	%l1
	alignaddrl	%o4,	%g1,	%i3
	fmovsvs	%xcc,	%f22,	%f1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%g3
	andcc	%g5,	%g2,	%o7
	sra	%l4,	%l5,	%o3
	alignaddrl	%i2,	%o6,	%i7
	and	%i5,	%g6,	%o5
	fbue,a	%fcc2,	loop_811
	fble,a	%fcc3,	loop_812
	bcs	%xcc,	loop_813
	stb	%i6,	[%l7 + 0x5C]
loop_811:
	edge16l	%l6,	%o0,	%o2
loop_812:
	bshuffle	%f4,	%f16,	%f20
loop_813:
	prefetch	[%l7 + 0x20],	 0x2
	tge	%xcc,	0x7
	move	%xcc,	%o1,	%g7
	edge32ln	%i1,	%i4,	%l3
	tl	%xcc,	0x7
	udiv	%g4,	0x1D8C,	%i0
	and	%l0,	0x1370,	%o4
	sdiv	%l1,	0x04D8,	%i3
	fbne	%fcc2,	loop_814
	movn	%xcc,	%g1,	%l2
	for	%f18,	%f8,	%f8
	brz	%g5,	loop_815
loop_814:
	swap	[%l7 + 0x40],	%g2
	smulcc	%g3,	%o7,	%l5
	tsubcctv	%o3,	%l4,	%o6
loop_815:
	nop
	set	0x64, %i2
	stba	%i7,	[%l7 + %i2] 0x15
	membar	0x7E
	ldsw	[%l7 + 0x58],	%i5
	tne	%xcc,	0x3
	addc	%i2,	%o5,	%g6
	fmul8ulx16	%f18,	%f12,	%f4
	fmovde	%icc,	%f18,	%f4
	fbul,a	%fcc3,	loop_816
	or	%l6,	%i6,	%o0
	smul	%o2,	%o1,	%g7
	sethi	0x1ADC,	%i4
loop_816:
	tcs	%xcc,	0x0
	sth	%l3,	[%l7 + 0x2C]
	movne	%xcc,	%g4,	%i0
	movrlz	%l0,	%o4,	%l1
	fone	%f12
	fbl	%fcc3,	loop_817
	fbu,a	%fcc0,	loop_818
	tvs	%icc,	0x6
	xnorcc	%i3,	0x006C,	%i1
loop_817:
	udivx	%l2,	0x08F3,	%g5
loop_818:
	ldsh	[%l7 + 0x28],	%g2
	sll	%g3,	0x11,	%o7
	nop
	fitos	%f22,	%f22
	move	%xcc,	%g1,	%l5
	faligndata	%f10,	%f12,	%f2
	tcs	%icc,	0x3
	fnegd	%f26,	%f6
	fmovdgu	%xcc,	%f19,	%f25
	fxors	%f28,	%f0,	%f9
	fmovdvc	%xcc,	%f8,	%f7
	bcs,a,pt	%icc,	loop_819
	nop
	setx	0x45A34328,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x230AB53E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f4,	%f14
	addc	%l4,	%o6,	%o3
	tn	%xcc,	0x3
loop_819:
	andn	%i5,	0x008D,	%i2
	nop
	setx loop_820, %l0, %l1
	jmpl %l1, %i7
	fnegd	%f6,	%f8
	fmovdge	%xcc,	%f31,	%f3
	nop
	setx	0xD07AEFD8,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
loop_820:
	nop
	fitos	%f12,	%f5
	fstoi	%f5,	%f16
	edge32n	%o5,	%g6,	%l6
	nop
	setx	0xB57D4C5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f14
	add	%i6,	%o2,	%o0
	fsrc1s	%f12,	%f31
	bn,pn	%icc,	loop_821
	movrne	%o1,	%g7,	%l3
	set	0x65, %o2
	ldstuba	[%l7 + %o2] 0x11,	%i4
loop_821:
	addc	%i0,	0x05CC,	%l0
	movn	%xcc,	%o4,	%l1
	edge16l	%i3,	%i1,	%g4
	movcc	%xcc,	%l2,	%g2
	faligndata	%f28,	%f24,	%f4
	mulscc	%g5,	0x0200,	%g3
	umul	%g1,	0x0867,	%o7
	fmovd	%f28,	%f6
	umulcc	%l5,	%l4,	%o6
	addc	%o3,	0x0A00,	%i2
	mova	%xcc,	%i5,	%o5
	swap	[%l7 + 0x38],	%g6
	addccc	%l6,	%i6,	%i7
	bvs	loop_822
	sra	%o2,	%o1,	%o0
	smul	%g7,	0x1BA2,	%l3
	bneg,a	%icc,	loop_823
loop_822:
	mova	%xcc,	%i4,	%l0
	edge32	%i0,	%o4,	%i3
	bcs,a,pt	%xcc,	loop_824
loop_823:
	edge16ln	%l1,	%g4,	%l2
	lduh	[%l7 + 0x2E],	%i1
	ld	[%l7 + 0x68],	%f9
loop_824:
	fbge,a	%fcc2,	loop_825
	umulcc	%g2,	0x1AE1,	%g5
	prefetch	[%l7 + 0x34],	 0x1
	brnz	%g3,	loop_826
loop_825:
	sdivx	%g1,	0x1918,	%o7
	taddcctv	%l4,	0x1BDC,	%o6
	srax	%l5,	0x19,	%i2
loop_826:
	nop
	setx	0xFEBBCA74004B8BBA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	sir	0x0BF1
	srl	%o3,	%o5,	%g6
	tpos	%xcc,	0x4
	movcs	%icc,	%i5,	%l6
	tneg	%xcc,	0x2
	movvc	%xcc,	%i6,	%o2
	edge16ln	%o1,	%i7,	%g7
	tle	%icc,	0x4
	fmovdn	%xcc,	%f18,	%f0
	srlx	%o0,	%i4,	%l3
	edge16ln	%i0,	%l0,	%o4
	nop
	fitos	%f13,	%f17
	fstox	%f17,	%f28
	ldsw	[%l7 + 0x7C],	%i3
	smul	%g4,	0x1981,	%l2
	movvs	%icc,	%i1,	%g2
	bcs,pt	%icc,	loop_827
	fandnot1s	%f13,	%f11,	%f15
	edge16l	%g5,	%g3,	%l1
	andcc	%o7,	%l4,	%g1
loop_827:
	ldsb	[%l7 + 0x47],	%o6
	bgu,a	loop_828
	sra	%i2,	%l5,	%o3
	fmovdn	%icc,	%f19,	%f25
	std	%f22,	[%l7 + 0x38]
loop_828:
	movrlz	%o5,	0x2EA,	%g6
	array16	%l6,	%i6,	%i5
	nop
	setx	0x60B25C7B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f30
	brgez	%o1,	loop_829
	tle	%icc,	0x0
	fnegd	%f8,	%f0
	movneg	%icc,	%i7,	%g7
loop_829:
	orcc	%o0,	%o2,	%i4
	fandnot2s	%f4,	%f24,	%f26
	orn	%i0,	%l3,	%l0
	array8	%o4,	%i3,	%l2
	tgu	%icc,	0x6
	movleu	%icc,	%i1,	%g2
	orncc	%g5,	0x0803,	%g4
	bshuffle	%f20,	%f24,	%f24
	alignaddr	%l1,	%o7,	%l4
	fmovdgu	%icc,	%f10,	%f17
	ldx	[%l7 + 0x48],	%g3
	movle	%xcc,	%o6,	%i2
	fpack16	%f8,	%f7
	stx	%g1,	[%l7 + 0x10]
	tne	%xcc,	0x6
	movrlez	%l5,	0x0BA,	%o5
	edge32l	%o3,	%g6,	%i6
	movleu	%xcc,	%l6,	%o1
	set	0x28, %g4
	lda	[%l7 + %g4] 0x19,	%f19
	ldsw	[%l7 + 0x40],	%i5
	movleu	%icc,	%g7,	%i7
	fmovdleu	%xcc,	%f1,	%f13
	movle	%icc,	%o2,	%o0
	ldsw	[%l7 + 0x38],	%i4
	movg	%xcc,	%l3,	%i0
	fmul8sux16	%f28,	%f0,	%f28
	edge16	%o4,	%i3,	%l0
	movre	%l2,	%i1,	%g2
	fsrc1s	%f22,	%f16
	movrgez	%g4,	0x3E8,	%g5
	wr	%g0,	0xe2,	%asi
	stwa	%l1,	[%l7 + 0x50] %asi
	membar	#Sync
	fpack32	%f16,	%f28,	%f28
	srax	%l4,	0x09,	%o7
	ba	loop_830
	fzeros	%f21
	orncc	%o6,	0x0B6A,	%g3
	edge8ln	%g1,	%l5,	%o5
loop_830:
	nop
	set	0x14, %g3
	stwa	%i2,	[%l7 + %g3] 0x27
	membar	#Sync
	xnorcc	%o3,	0x1F31,	%i6
	fmovrdgez	%g6,	%f0,	%f30
	fbl	%fcc2,	loop_831
	fbn,a	%fcc3,	loop_832
	andncc	%o1,	%i5,	%g7
	sdiv	%l6,	0x125C,	%o2
loop_831:
	lduh	[%l7 + 0x74],	%i7
loop_832:
	nop
	set	0x60, %i0
	ldsha	[%l7 + %i0] 0x81,	%i4
	nop
	setx	0xDEE9A347F721ABFF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xB64A42A635C5E2C4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f6,	%f0
	fnands	%f29,	%f25,	%f1
	nop
	setx	0x64CFE5F3140EA60B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f2
	tsubcctv	%l3,	%i0,	%o0
	fba,a	%fcc1,	loop_833
	add	%i3,	%l0,	%o4
	bcc,a,pt	%xcc,	loop_834
	fbe,a	%fcc2,	loop_835
loop_833:
	tge	%icc,	0x2
	popc	%i1,	%g2
loop_834:
	xor	%l2,	%g4,	%l1
loop_835:
	orcc	%l4,	0x12F7,	%o7
	movpos	%xcc,	%g5,	%o6
	fcmpeq32	%f30,	%f16,	%g1
	edge16	%l5,	%g3,	%o5
	xnorcc	%i2,	0x192C,	%o3
	sub	%g6,	%i6,	%o1
	movneg	%icc,	%i5,	%g7
	edge16	%o2,	%i7,	%i4
	ta	%icc,	0x1
	wr	%g0,	0x20,	%asi
	stxa	%l6,	[%g0 + 0x8] %asi
	sll	%l3,	0x11,	%o0
	or	%i3,	%i0,	%o4
	prefetch	[%l7 + 0x34],	 0x0
	tgu	%icc,	0x4
	fornot2	%f12,	%f10,	%f26
	fornot1	%f6,	%f24,	%f22
	brgez	%l0,	loop_836
	fmovrsgz	%g2,	%f1,	%f7
	sllx	%l2,	0x05,	%g4
	fblg,a	%fcc3,	loop_837
loop_836:
	nop
	fitos	%f3,	%f2
	fstod	%f2,	%f24
	fabsd	%f4,	%f28
	nop
	fitos	%f13,	%f19
	fstox	%f19,	%f12
loop_837:
	brgz,a	%i1,	loop_838
	udiv	%l1,	0x07FF,	%o7
	movvc	%icc,	%l4,	%o6
	tneg	%xcc,	0x6
loop_838:
	fandnot1	%f30,	%f12,	%f2
	fmovsneg	%icc,	%f26,	%f23
	set	0x2F, %g7
	ldstuba	[%l7 + %g7] 0x89,	%g5
	fmuld8ulx16	%f6,	%f10,	%f22
	umul	%g1,	%l5,	%o5
	fmovscc	%xcc,	%f7,	%f4
	fcmpgt32	%f18,	%f16,	%g3
	fmovdneg	%xcc,	%f29,	%f9
	pdist	%f4,	%f20,	%f24
	sdivcc	%o3,	0x1047,	%g6
	orcc	%i6,	0x04E9,	%i2
	ld	[%l7 + 0x4C],	%f30
	fmovdleu	%xcc,	%f1,	%f1
	fzeros	%f2
	addc	%o1,	0x0BF4,	%g7
	nop
	fitod	%f23,	%f10
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f4
	fxtod	%f4,	%f8
	fblg	%fcc1,	loop_839
	tge	%icc,	0x0
	addc	%o2,	%i5,	%i7
	and	%l6,	0x01D8,	%l3
loop_839:
	bg	loop_840
	fbule	%fcc0,	loop_841
	orn	%o0,	%i3,	%i4
	movcc	%icc,	%o4,	%i0
loop_840:
	edge16	%g2,	%l2,	%l0
loop_841:
	te	%icc,	0x4
	edge16n	%g4,	%i1,	%o7
	movne	%icc,	%l4,	%o6
	fmovdvc	%xcc,	%f31,	%f2
	fpack32	%f18,	%f6,	%f24
	bge,a	%icc,	loop_842
	fmovrsgz	%l1,	%f9,	%f5
	fpackfix	%f20,	%f27
	brz,a	%g5,	loop_843
loop_842:
	te	%xcc,	0x4
	srl	%g1,	0x1D,	%o5
	movl	%xcc,	%g3,	%o3
loop_843:
	bcs,a,pn	%xcc,	loop_844
	fbo	%fcc2,	loop_845
	andn	%l5,	0x1ECF,	%i6
	ba	%xcc,	loop_846
loop_844:
	fone	%f26
loop_845:
	sllx	%i2,	%g6,	%o1
	xorcc	%o2,	%i5,	%g7
loop_846:
	mulx	%l6,	%i7,	%o0
	ldx	[%l7 + 0x50],	%l3
	or	%i3,	0x0C94,	%o4
	brgez	%i0,	loop_847
	bvc,a,pt	%icc,	loop_848
	orn	%i4,	%l2,	%l0
	fmovsne	%xcc,	%f27,	%f30
loop_847:
	fmovdgu	%xcc,	%f29,	%f17
loop_848:
	nop
	set	0x4C, %l3
	ldsw	[%l7 + %l3],	%g4
	mova	%xcc,	%i1,	%g2
	sdivcc	%l4,	0x04B2,	%o7
	edge16l	%l1,	%g5,	%o6
	subccc	%g1,	%o5,	%o3
	subcc	%l5,	0x093C,	%g3
	nop
	setx	0x8A94F8C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x1083776A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f5,	%f8
	orcc	%i2,	0x16EF,	%g6
	udivx	%o1,	0x0094,	%i6
	fbl,a	%fcc2,	loop_849
	tne	%xcc,	0x2
	movvs	%icc,	%i5,	%o2
	sll	%l6,	%g7,	%i7
loop_849:
	mulx	%o0,	%i3,	%o4
	bl,a	loop_850
	fpadd32s	%f14,	%f1,	%f10
	addc	%l3,	0x0A31,	%i0
	subc	%i4,	0x1B48,	%l2
loop_850:
	xnor	%l0,	0x090C,	%i1
	array8	%g2,	%g4,	%o7
	andncc	%l4,	%g5,	%o6
	sdivcc	%l1,	0x1C57,	%g1
	addcc	%o5,	%l5,	%g3
	sir	0x1FC6
	fbo	%fcc3,	loop_851
	move	%icc,	%o3,	%i2
	nop
	fitod	%f2,	%f16
	fdtoi	%f16,	%f8
	tn	%icc,	0x7
loop_851:
	bne,a	loop_852
	sth	%o1,	[%l7 + 0x1C]
	tcs	%icc,	0x1
	mulscc	%i6,	%g6,	%o2
loop_852:
	alignaddr	%i5,	%g7,	%i7
	bcc	loop_853
	nop
	fitos	%f2,	%f26
	fstoi	%f26,	%f30
	umul	%o0,	%l6,	%i3
	fand	%f8,	%f2,	%f26
loop_853:
	fbo,a	%fcc2,	loop_854
	umulcc	%l3,	0x0B34,	%o4
	set	0x6C, %l0
	lduwa	[%l7 + %l0] 0x0c,	%i4
loop_854:
	srl	%l2,	%l0,	%i0
	fandnot1	%f24,	%f8,	%f0
	nop
	setx	0xA1E0A632,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x2D26F17F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f12,	%f30
	tne	%icc,	0x5
	movvc	%xcc,	%i1,	%g2
	array16	%o7,	%l4,	%g4
	tge	%xcc,	0x4
	movl	%icc,	%o6,	%l1
	fmovrslz	%g5,	%f25,	%f2
	bpos,pt	%icc,	loop_855
	movpos	%xcc,	%g1,	%l5
	edge16ln	%g3,	%o3,	%i2
	bg,a	loop_856
loop_855:
	movgu	%icc,	%o1,	%i6
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x5A] %asi,	%g6
loop_856:
	nop
	set	0x14, %l5
	lduwa	[%l7 + %l5] 0x89,	%o5
	mulx	%i5,	%o2,	%i7
	fbge	%fcc0,	loop_857
	mulscc	%g7,	0x0C36,	%l6
	fpadd16	%f26,	%f0,	%f24
	tcc	%xcc,	0x0
loop_857:
	fbo	%fcc3,	loop_858
	tvs	%icc,	0x7
	and	%i3,	%o0,	%l3
	ta	%icc,	0x2
loop_858:
	movn	%icc,	%o4,	%i4
	tcs	%xcc,	0x7
	orncc	%l2,	0x17DB,	%i0
	sra	%i1,	0x11,	%g2
	and	%l0,	%l4,	%g4
	sdivx	%o6,	0x08DD,	%o7
	tne	%xcc,	0x3
	movcc	%xcc,	%l1,	%g1
	smul	%l5,	%g5,	%g3
	edge32n	%o3,	%o1,	%i2
	fmovdn	%xcc,	%f29,	%f26
	st	%f26,	[%l7 + 0x1C]
	wr	%g0,	0x22,	%asi
	stha	%i6,	[%l7 + 0x5E] %asi
	membar	#Sync
	edge32ln	%o5,	%i5,	%g6
	sra	%i7,	0x17,	%g7
	movrgez	%l6,	0x176,	%o2
	ldd	[%l7 + 0x28],	%i2
	bn	loop_859
	tcc	%xcc,	0x1
	edge8	%l3,	%o4,	%o0
	movge	%icc,	%l2,	%i0
loop_859:
	flush	%l7 + 0x18
	set	0x0E, %o4
	ldsha	[%l7 + %o4] 0x81,	%i1
	taddcc	%i4,	0x1F46,	%g2
	tvc	%icc,	0x2
	fmovrdne	%l4,	%f14,	%f26
	fblg	%fcc3,	loop_860
	fmovdl	%xcc,	%f29,	%f16
	bne	loop_861
	fbne,a	%fcc1,	loop_862
loop_860:
	movleu	%xcc,	%g4,	%o6
	edge32ln	%l0,	%l1,	%g1
loop_861:
	fors	%f20,	%f14,	%f20
loop_862:
	movvc	%icc,	%l5,	%g5
	edge16ln	%g3,	%o7,	%o1
	xorcc	%o3,	0x06D1,	%i6
	move	%icc,	%o5,	%i5
	fmovrslez	%g6,	%f1,	%f20
	fmovrdlz	%i2,	%f8,	%f20
	edge32l	%i7,	%l6,	%o2
	movvc	%xcc,	%i3,	%l3
	add	%g7,	%o4,	%l2
	be,a,pn	%xcc,	loop_863
	movn	%icc,	%o0,	%i1
	set	0x3C, %g1
	sta	%f3,	[%l7 + %g1] 0x11
loop_863:
	nop
	wr	%g0,	0x80,	%asi
	stha	%i4,	[%l7 + 0x38] %asi
	movcc	%icc,	%g2,	%l4
	bvc	loop_864
	fmovdvs	%xcc,	%f14,	%f14
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%g4,	%o6
loop_864:
	movvc	%xcc,	%l0,	%l1
	tg	%xcc,	0x4
	edge16n	%g1,	%l5,	%i0
	udiv	%g5,	0x1337,	%g3
	fble	%fcc3,	loop_865
	nop
	setx	0xA0CCE4E6306BADD2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	movpos	%xcc,	%o7,	%o3
	fpsub32	%f2,	%f22,	%f28
loop_865:
	fmovdgu	%xcc,	%f6,	%f13
	udiv	%o1,	0x1745,	%i6
	fones	%f29
	tneg	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	sta	%f4,	[%l7 + 0x34] %asi
	edge16n	%o5,	%g6,	%i5
	tn	%xcc,	0x2
	fcmple16	%f30,	%f6,	%i2
	andn	%i7,	0x1367,	%o2
	wr	%g0,	0x0c,	%asi
	stwa	%l6,	[%l7 + 0x60] %asi
	or	%l3,	%g7,	%i3
	tne	%icc,	0x7
	fmovdge	%icc,	%f6,	%f2
	andncc	%o4,	%o0,	%l2
	fsrc2	%f14,	%f18
	fmovs	%f10,	%f17
	fble	%fcc0,	loop_866
	alignaddr	%i4,	%i1,	%g2
	sdivx	%l4,	0x0BD4,	%g4
	fbge,a	%fcc0,	loop_867
loop_866:
	movrne	%l0,	%l1,	%g1
	xorcc	%o6,	%l5,	%g5
	mulscc	%i0,	0x0530,	%g3
loop_867:
	movpos	%icc,	%o3,	%o1
	sub	%i6,	%o7,	%g6
	mova	%icc,	%i5,	%o5
	mulx	%i2,	0x0181,	%o2
	move	%xcc,	%l6,	%i7
	bcs,a	%icc,	loop_868
	ldd	[%l7 + 0x48],	%f18
	ta	%icc,	0x6
	ta	%icc,	0x2
loop_868:
	movcc	%icc,	%g7,	%l3
	tvc	%icc,	0x3
	nop
	setx	0x560447691670646C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x7A6E403EDA7433D1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f10,	%f10
	udiv	%o4,	0x06BA,	%i3
	orcc	%o0,	%i4,	%l2
	sdiv	%g2,	0x18B8,	%i1
	lduw	[%l7 + 0x78],	%l4
	andncc	%l0,	%g4,	%g1
	fmovse	%xcc,	%f17,	%f7
	membar	0x4C
	ba,a,pt	%xcc,	loop_869
	nop
	setx	loop_870,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array32	%o6,	%l5,	%l1
	alignaddr	%i0,	%g3,	%g5
loop_869:
	nop
	set	0x4C, %l4
	swapa	[%l7 + %l4] 0x10,	%o1
loop_870:
	fmovdcs	%xcc,	%f11,	%f21
	array8	%o3,	%i6,	%o7
	bn,pn	%icc,	loop_871
	fornot2s	%f12,	%f23,	%f25
	flush	%l7 + 0x14
	fpadd32	%f30,	%f24,	%f8
loop_871:
	xnor	%g6,	%o5,	%i2
	edge8	%i5,	%l6,	%o2
	nop
	fitod	%f12,	%f28
	fdtos	%f28,	%f11
	movvc	%xcc,	%i7,	%l3
	tl	%icc,	0x6
	fmovdvs	%icc,	%f23,	%f24
	move	%icc,	%g7,	%o4
	movre	%o0,	%i3,	%l2
	xnorcc	%g2,	0x1F22,	%i1
	fexpand	%f24,	%f4
	sra	%l4,	%i4,	%l0
	fmovspos	%icc,	%f15,	%f0
	tl	%icc,	0x6
	movl	%icc,	%g4,	%g1
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f0
	sub	%o6,	0x1CE3,	%l1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x34] %asi,	%i0
	nop
	setx	loop_872,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bpos	loop_873
	xnorcc	%g3,	0x18E1,	%g5
	te	%icc,	0x5
loop_872:
	srlx	%o1,	0x10,	%l5
loop_873:
	movre	%i6,	0x278,	%o7
	smul	%o3,	0x1747,	%o5
	array32	%i2,	%i5,	%g6
	tle	%icc,	0x0
	movpos	%icc,	%l6,	%o2
	tleu	%icc,	0x0
	edge8ln	%l3,	%i7,	%o4
	fnegs	%f27,	%f15
	nop
	setx	0x63670005207ACFC4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	brgz,a	%o0,	loop_874
	brlz	%i3,	loop_875
	nop
	setx	0x47FB6681AF882972,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x01C9D61857609940,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f4,	%f22
	bneg,a	loop_876
loop_874:
	fmul8x16al	%f22,	%f20,	%f24
loop_875:
	bshuffle	%f12,	%f22,	%f22
	bpos,pn	%icc,	loop_877
loop_876:
	brz,a	%l2,	loop_878
	edge16	%g7,	%g2,	%l4
	tsubcc	%i4,	%l0,	%g4
loop_877:
	tsubcc	%g1,	%o6,	%i1
loop_878:
	mova	%icc,	%l1,	%g3
	subccc	%i0,	%o1,	%l5
	andn	%g5,	%i6,	%o3
	move	%icc,	%o5,	%i2
	fnor	%f0,	%f6,	%f2
	fbl	%fcc2,	loop_879
	lduw	[%l7 + 0x38],	%o7
	movre	%i5,	0x29A,	%l6
	movrgz	%o2,	0x317,	%l3
loop_879:
	subccc	%g6,	%i7,	%o0
	tvc	%icc,	0x5
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x17,	%f16
	mova	%icc,	%i3,	%l2
	fmovdn	%xcc,	%f6,	%f29
	add	%o4,	0x138E,	%g2
	movne	%icc,	%l4,	%i4
	add	%l0,	0x1D20,	%g7
	fbne	%fcc2,	loop_880
	sra	%g4,	0x1D,	%g1
	tleu	%xcc,	0x1
	movn	%xcc,	%i1,	%o6
loop_880:
	movrlez	%g3,	%l1,	%i0
	tgu	%icc,	0x6
	edge8	%l5,	%g5,	%o1
	fpadd32	%f20,	%f16,	%f4
	nop
	setx	0x4068BE1F,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	fcmpne16	%f8,	%f10,	%i6
	srl	%o5,	0x0A,	%o3
	array8	%o7,	%i2,	%i5
	fnot1s	%f24,	%f15
	sdiv	%o2,	0x0CE2,	%l6
	movre	%l3,	%g6,	%o0
	fnor	%f0,	%f4,	%f10
	ldd	[%l7 + 0x68],	%i6
	fnegs	%f26,	%f4
	xnor	%l2,	%o4,	%g2
	sub	%l4,	%i4,	%i3
	wr	%g0,	0x57,	%asi
	stxa	%l0,	[%g0 + 0x0] %asi
	bvc,pn	%xcc,	loop_881
	tsubcc	%g7,	%g4,	%i1
	pdist	%f2,	%f12,	%f14
	movvc	%xcc,	%o6,	%g1
loop_881:
	movrlez	%l1,	%i0,	%l5
	tgu	%icc,	0x0
	tsubcctv	%g3,	0x0655,	%g5
	fzero	%f8
	lduh	[%l7 + 0x68],	%o1
	tn	%icc,	0x3
	alignaddrl	%o5,	%o3,	%o7
	xnor	%i2,	%i5,	%o2
	fmovdleu	%icc,	%f2,	%f5
	mulx	%i6,	%l3,	%g6
	pdist	%f2,	%f30,	%f28
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f2
	fxtod	%f2,	%f18
	nop
	setx	0x6047F562,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	tsubcc	%o0,	%i7,	%l6
	fmul8x16al	%f24,	%f17,	%f20
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	nop
	fitos	%f7,	%f25
	movrgz	%o4,	0x1BC,	%g2
	umul	%i4,	%i3,	%l0
	be,a	loop_882
	movrlez	%l4,	0x04C,	%g7
	movrne	%g4,	0x259,	%i1
	std	%f20,	[%l7 + 0x20]
loop_882:
	umul	%o6,	0x0911,	%l1
	taddcc	%i0,	0x035E,	%l5
	movcs	%xcc,	%g1,	%g5
	sdivcc	%o1,	0x1E68,	%g3
	movle	%xcc,	%o5,	%o3
	fmul8ulx16	%f16,	%f28,	%f18
	lduh	[%l7 + 0x38],	%i2
	tge	%xcc,	0x1
	udivcc	%i5,	0x0812,	%o7
	xnorcc	%i6,	%o2,	%l3
	tcc	%icc,	0x3
	fnot1	%f8,	%f14
	nop
	fitos	%f5,	%f27
	fstoi	%f27,	%f27
	udivx	%g6,	0x1400,	%o0
	orcc	%l6,	0x1E8A,	%i7
	tl	%xcc,	0x4
	bl,a	loop_883
	tcs	%icc,	0x7
	smulcc	%o4,	0x09D5,	%l2
	stw	%i4,	[%l7 + 0x64]
loop_883:
	fmovdneg	%icc,	%f25,	%f27
	fcmpne16	%f0,	%f22,	%i3
	sdiv	%g2,	0x01E4,	%l0
	tpos	%icc,	0x5
	andcc	%g7,	0x1353,	%l4
	nop
	fitos	%f5,	%f16
	fstod	%f16,	%f26
	bshuffle	%f10,	%f22,	%f20
	srl	%g4,	0x16,	%i1
	tsubcctv	%o6,	0x11E0,	%l1
	srax	%l5,	%i0,	%g5
	xor	%g1,	0x1A30,	%g3
	movg	%xcc,	%o1,	%o5
	movge	%xcc,	%i2,	%i5
	fsrc1s	%f20,	%f27
	smulcc	%o3,	0x1614,	%o7
	srl	%i6,	%l3,	%g6
	fpack16	%f12,	%f6
	fmovsleu	%xcc,	%f27,	%f16
	srax	%o0,	0x1F,	%o2
	tsubcctv	%i7,	0x0218,	%o4
	fmovsg	%xcc,	%f4,	%f31
	srl	%l6,	0x13,	%l2
	sir	0x0ACE
	fpadd32s	%f29,	%f30,	%f28
	movcc	%xcc,	%i3,	%i4
	xor	%g2,	0x1AF6,	%g7
	alignaddrl	%l4,	%l0,	%g4
	mulscc	%o6,	%i1,	%l5
	nop
	fitod	%f12,	%f24
	fdtox	%f24,	%f30
	movcs	%icc,	%i0,	%g5
	bne	loop_884
	sth	%g1,	[%l7 + 0x18]
	fcmpeq16	%f22,	%f6,	%g3
	xorcc	%l1,	0x112C,	%o5
loop_884:
	sir	0x0E1E
	sll	%o1,	0x12,	%i5
	brlz	%i2,	loop_885
	fpsub16s	%f15,	%f6,	%f31
	movvc	%icc,	%o3,	%i6
	tvc	%icc,	0x2
loop_885:
	sra	%l3,	0x0D,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x0
	tsubcctv	%o0,	0x1357,	%o7
	udivcc	%o2,	0x0435,	%i7
	movge	%xcc,	%l6,	%l2
	nop
	setx loop_886, %l0, %l1
	jmpl %l1, %i3
	and	%i4,	%g2,	%g7
	bcs,pt	%xcc,	loop_887
	tcc	%icc,	0x1
loop_886:
	srl	%l4,	0x1A,	%o4
	fmovrslz	%l0,	%f22,	%f8
loop_887:
	tcc	%xcc,	0x1
	fpsub32s	%f18,	%f1,	%f3
	sllx	%g4,	0x1C,	%o6
	sub	%l5,	%i1,	%g5
	movne	%icc,	%i0,	%g1
	fmovsgu	%icc,	%f10,	%f19
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x16
	membar	#Sync
	edge16ln	%l1,	%o5,	%o1
	mulscc	%g3,	%i2,	%o3
	sllx	%i5,	%i6,	%g6
	array8	%l3,	%o0,	%o2
	alignaddrl	%i7,	%o7,	%l6
	nop
	fitos	%f0,	%f11
	fstox	%f11,	%f24
	fxtos	%f24,	%f2
	srlx	%i3,	%i4,	%l2
	bcc,a,pn	%icc,	loop_888
	mulx	%g7,	%l4,	%g2
	udivcc	%o4,	0x0B8B,	%g4
	fble	%fcc1,	loop_889
loop_888:
	fble	%fcc1,	loop_890
	subcc	%o6,	%l5,	%l0
	ba,a,pt	%icc,	loop_891
loop_889:
	movgu	%icc,	%i1,	%i0
loop_890:
	fbule	%fcc1,	loop_892
	fmovdcc	%xcc,	%f22,	%f7
loop_891:
	fmovdg	%xcc,	%f24,	%f21
	be,pt	%icc,	loop_893
loop_892:
	add	%g1,	0x1867,	%g5
	addcc	%l1,	%o1,	%g3
	tle	%icc,	0x3
loop_893:
	nop
	set	0x70, %i5
	swapa	[%l7 + %i5] 0x81,	%o5
	bvs,pt	%icc,	loop_894
	nop
	fitod	%f12,	%f24
	fdtoi	%f24,	%f5
	movre	%o3,	%i2,	%i5
	movrne	%g6,	%i6,	%l3
loop_894:
	subcc	%o2,	%o0,	%o7
	bneg,a	loop_895
	edge32l	%i7,	%l6,	%i4
	tn	%icc,	0x7
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x04,	%l2
loop_895:
	fornot1	%f20,	%f2,	%f0
	fmovrdlez	%i3,	%f10,	%f10
	prefetch	[%l7 + 0x0C],	 0x2
	tn	%xcc,	0x3
	andncc	%l4,	%g2,	%g7
	sth	%g4,	[%l7 + 0x08]
	swap	[%l7 + 0x58],	%o6
	fmovdle	%icc,	%f22,	%f2
	tn	%icc,	0x5
	fnot2	%f22,	%f24
	srax	%l5,	%l0,	%i1
	nop
	setx	0x957D0000,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i0,	0x0A,	%g1
	bpos,pn	%xcc,	loop_896
	fmovdpos	%icc,	%f14,	%f24
	tcs	%icc,	0x0
	sdivx	%g5,	0x1886,	%l1
loop_896:
	fsrc1s	%f25,	%f8
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o1,	%o4
	edge32	%o5,	%o3,	%i2
	ldsw	[%l7 + 0x54],	%i5
	ba,a,pn	%icc,	loop_897
	move	%icc,	%g3,	%g6
	fmovsgu	%xcc,	%f0,	%f23
	ldstub	[%l7 + 0x7C],	%i6
loop_897:
	fcmpne32	%f6,	%f14,	%o2
	mulscc	%o0,	0x0FAB,	%l3
	sir	0x1C60
	pdist	%f26,	%f28,	%f4
	stx	%i7,	[%l7 + 0x70]
	fmovrdgz	%o7,	%f0,	%f24
	udivcc	%i4,	0x14B7,	%l6
	brgz	%i3,	loop_898
	movrgez	%l2,	%g2,	%l4
	tleu	%icc,	0x4
	tcs	%xcc,	0x0
loop_898:
	xnor	%g4,	0x08E1,	%g7
	edge8ln	%l5,	%o6,	%i1
	pdist	%f4,	%f6,	%f28
	bn	%xcc,	loop_899
	orncc	%l0,	%g1,	%i0
	pdist	%f14,	%f2,	%f14
	fpackfix	%f26,	%f5
loop_899:
	bleu,a,pt	%xcc,	loop_900
	ldsb	[%l7 + 0x70],	%g5
	orn	%o1,	%l1,	%o4
	srlx	%o5,	0x07,	%i2
loop_900:
	edge16ln	%o3,	%i5,	%g6
	edge16	%g3,	%i6,	%o0
	edge32	%l3,	%o2,	%o7
	sllx	%i7,	0x15,	%l6
	call	loop_901
	be,a,pt	%xcc,	loop_902
	prefetch	[%l7 + 0x18],	 0x1
	fcmple16	%f14,	%f4,	%i4
loop_901:
	edge16n	%l2,	%i3,	%g2
loop_902:
	add	%l4,	0x0EEA,	%g4
	array32	%g7,	%o6,	%l5
	fbe	%fcc0,	loop_903
	sllx	%l0,	0x1B,	%g1
	alignaddrl	%i1,	%g5,	%o1
	edge8ln	%l1,	%i0,	%o4
loop_903:
	edge32	%i2,	%o3,	%o5
	sllx	%i5,	%g3,	%g6
	fbne,a	%fcc3,	loop_904
	orncc	%o0,	%i6,	%l3
	bvc,pt	%icc,	loop_905
	udivcc	%o7,	0x145F,	%i7
loop_904:
	ldsb	[%l7 + 0x32],	%o2
	tvs	%xcc,	0x6
loop_905:
	subc	%l6,	%l2,	%i4
	fbn,a	%fcc0,	loop_906
	fmul8sux16	%f16,	%f28,	%f12
	movn	%icc,	%i3,	%l4
	fble	%fcc2,	loop_907
loop_906:
	for	%f30,	%f26,	%f24
	bshuffle	%f0,	%f10,	%f16
	addccc	%g2,	0x11D6,	%g4
loop_907:
	nop
	set	0x70, %o5
	stwa	%g7,	[%l7 + %o5] 0xe2
	membar	#Sync
	fba,a	%fcc1,	loop_908
	movne	%xcc,	%l5,	%o6
	subccc	%g1,	0x1E29,	%l0
	fbne,a	%fcc3,	loop_909
loop_908:
	tn	%xcc,	0x3
	fxnor	%f12,	%f10,	%f28
	fmovdpos	%xcc,	%f7,	%f17
loop_909:
	edge8n	%i1,	%o1,	%g5
	nop
	set	0x34, %g5
	sth	%i0,	[%l7 + %g5]
	set	0x38, %o3
	swapa	[%l7 + %o3] 0x10,	%o4
	edge8l	%i2,	%o3,	%l1
	fbuge,a	%fcc2,	loop_910
	bge	loop_911
	movcs	%icc,	%o5,	%g3
	bvs,a	%xcc,	loop_912
loop_910:
	fxors	%f12,	%f23,	%f23
loop_911:
	fmuld8sux16	%f23,	%f20,	%f16
	smulcc	%i5,	%g6,	%i6
loop_912:
	addc	%o0,	%l3,	%i7
	bgu,pn	%xcc,	loop_913
	srlx	%o2,	%o7,	%l6
	taddcc	%i4,	0x06ED,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_913:
	nop
	setx	loop_914,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sra	%l4,	0x06,	%l2
	tg	%xcc,	0x4
	movvc	%xcc,	%g2,	%g7
loop_914:
	nop
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x7C] %asi,	%g4
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x0] %asi,	%l5
	nop
	set	0x0C, %i3
	ldsb	[%l7 + %i3],	%o6
	mova	%xcc,	%l0,	%g1
	edge32ln	%o1,	%g5,	%i0
	andn	%o4,	%i2,	%o3
	nop
	fitos	%f2,	%f11
	fstod	%f11,	%f20
	fornot2s	%f31,	%f27,	%f30
	movre	%i1,	0x117,	%o5
	brlz,a	%g3,	loop_915
	movrlez	%l1,	0x0E8,	%i5
	fnor	%f10,	%f14,	%f14
	movrgz	%i6,	%o0,	%l3
loop_915:
	fbe	%fcc1,	loop_916
	membar	0x61
	set	0x08, %l6
	ldxa	[%l7 + %l6] 0x14,	%i7
loop_916:
	fones	%f18
	movre	%g6,	%o2,	%l6
	tsubcc	%o7,	0x07FD,	%i4
	orn	%l4,	%i3,	%g2
	pdist	%f10,	%f30,	%f6
	addcc	%l2,	%g4,	%g7
	fmovdvs	%xcc,	%f5,	%f0
	ldstub	[%l7 + 0x15],	%o6
	edge8ln	%l5,	%g1,	%o1
	fmovrdgz	%g5,	%f12,	%f14
	movre	%i0,	0x1D4,	%l0
	fcmple16	%f22,	%f18,	%o4
	fxors	%f3,	%f24,	%f7
	xor	%o3,	0x0D3D,	%i2
	edge32n	%o5,	%i1,	%l1
	tneg	%icc,	0x1
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x58] %asi,	%g3
	tcc	%xcc,	0x0
	fandnot1	%f4,	%f12,	%f0
	brlez,a	%i6,	loop_917
	sdivx	%i5,	0x11D6,	%o0
	fmovdge	%icc,	%f25,	%f6
	ld	[%l7 + 0x08],	%f22
loop_917:
	addcc	%l3,	0x1A64,	%i7
	std	%f0,	[%l7 + 0x48]
	movre	%o2,	%l6,	%g6
	sethi	0x058E,	%o7
	swap	[%l7 + 0x54],	%l4
	subccc	%i3,	0x0469,	%g2
	bg,a	loop_918
	movrgz	%i4,	0x14E,	%l2
	tleu	%xcc,	0x0
	be	loop_919
loop_918:
	movre	%g7,	%o6,	%l5
	orn	%g4,	0x0FC3,	%g1
	fones	%f19
loop_919:
	fmovrsgez	%g5,	%f23,	%f17
	mova	%icc,	%i0,	%l0
	fbge,a	%fcc1,	loop_920
	movrgz	%o1,	0x2C3,	%o3
	movrlz	%i2,	0x308,	%o5
	stx	%o4,	[%l7 + 0x30]
loop_920:
	movgu	%icc,	%l1,	%i1
	fmovda	%icc,	%f9,	%f8
	fpack32	%f20,	%f6,	%f0
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x1C] %asi,	%g3
	ldsh	[%l7 + 0x5C],	%i5
	sth	%o0,	[%l7 + 0x20]
	ldstub	[%l7 + 0x70],	%l3
	fmovdgu	%xcc,	%f1,	%f14
	bg	%xcc,	loop_921
	fbg	%fcc1,	loop_922
	stb	%i7,	[%l7 + 0x41]
	nop
	setx	0xE524C76C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f31
loop_921:
	tvs	%xcc,	0x4
loop_922:
	sll	%o2,	%l6,	%g6
	andncc	%i6,	%l4,	%i3
	array8	%o7,	%g2,	%i4
	srlx	%l2,	%o6,	%g7
	fornot2	%f20,	%f6,	%f28
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x14] %asi,	%f7
	sdiv	%g4,	0x03D0,	%g1
	tleu	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xA07ACCCC,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	bge	%icc,	loop_923
	bgu,a	%icc,	loop_924
	nop
	setx	loop_925,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%l5,	%i0,	%g5
loop_923:
	movpos	%icc,	%o1,	%l0
loop_924:
	movrlez	%o3,	%o5,	%i2
loop_925:
	edge32ln	%l1,	%i1,	%g3
	movrlez	%i5,	%o4,	%o0
	andncc	%i7,	%o2,	%l6
	array8	%l3,	%i6,	%l4
	taddcctv	%i3,	0x1F1F,	%g6
	orn	%g2,	%o7,	%l2
	andcc	%o6,	0x18E7,	%i4
	fmovrsgez	%g7,	%f15,	%f30
	edge32	%g4,	%g1,	%l5
	tcs	%xcc,	0x1
	set	0x14, %l1
	stwa	%g5,	[%l7 + %l1] 0x81
	fmovrdgz	%o1,	%f28,	%f4
	wr	%g0,	0x81,	%asi
	stxa	%l0,	[%l7 + 0x60] %asi
	bn,a	%icc,	loop_926
	be,a,pn	%xcc,	loop_927
	fpackfix	%f14,	%f24
	tne	%xcc,	0x6
loop_926:
	ldsw	[%l7 + 0x24],	%i0
loop_927:
	udivx	%o5,	0x0F64,	%i2
	tvs	%icc,	0x7
	edge8n	%l1,	%o3,	%g3
	brlz,a	%i5,	loop_928
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f30
	orn	%i1,	0x0999,	%o4
	fbuge	%fcc0,	loop_929
loop_928:
	fsrc1s	%f14,	%f28
	edge16	%i7,	%o2,	%o0
	movrgz	%l6,	%l3,	%i6
loop_929:
	nop
	setx loop_930, %l0, %l1
	jmpl %l1, %i3
	fbne	%fcc1,	loop_931
	srax	%g6,	0x11,	%g2
	tgu	%xcc,	0x5
loop_930:
	sdivx	%l4,	0x1BB9,	%l2
loop_931:
	fmovse	%xcc,	%f0,	%f28
	bg,a,pn	%icc,	loop_932
	orcc	%o6,	%i4,	%g7
	fxnors	%f18,	%f13,	%f23
	edge32	%g4,	%g1,	%l5
loop_932:
	and	%g5,	%o1,	%o7
	sra	%l0,	%o5,	%i2
	tne	%icc,	0x2
	edge8n	%i0,	%l1,	%g3
	tle	%xcc,	0x2
	movrne	%o3,	%i5,	%o4
	sdiv	%i7,	0x1329,	%i1
	bvs,pt	%icc,	loop_933
	andcc	%o2,	0x1DB8,	%o0
	tl	%xcc,	0x6
	addc	%l3,	0x011F,	%i6
loop_933:
	fba,a	%fcc3,	loop_934
	ldsw	[%l7 + 0x30],	%i3
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x04
loop_934:
	tvc	%icc,	0x0
	tvs	%icc,	0x0
	fmovdvs	%icc,	%f5,	%f12
	sra	%l6,	0x11,	%g6
	sdivcc	%g2,	0x132B,	%l2
	taddcctv	%l4,	0x19AA,	%i4
	fmovrsne	%g7,	%f18,	%f4
	addc	%o6,	%g4,	%g1
	fmovdvs	%icc,	%f1,	%f2
	sdivx	%l5,	0x0F4F,	%g5
	orncc	%o1,	0x0415,	%o7
	or	%o5,	%l0,	%i2
	tleu	%xcc,	0x2
	stw	%i0,	[%l7 + 0x2C]
	fxor	%f24,	%f0,	%f24
	swap	[%l7 + 0x48],	%g3
	alignaddr	%o3,	%l1,	%i5
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x74] %asi,	%i7
	smulcc	%i1,	0x1B53,	%o2
	smul	%o4,	0x04BD,	%l3
	bg,a	%icc,	loop_935
	srax	%o0,	0x1F,	%i3
	fnand	%f22,	%f30,	%f10
	edge16	%l6,	%i6,	%g6
loop_935:
	xnorcc	%g2,	%l4,	%l2
	movrlez	%i4,	%g7,	%o6
	fbl	%fcc0,	loop_936
	fandnot2s	%f31,	%f28,	%f30
	movpos	%icc,	%g4,	%l5
	stw	%g5,	[%l7 + 0x2C]
loop_936:
	fmovrslez	%g1,	%f17,	%f16
	te	%icc,	0x3
	andncc	%o1,	%o7,	%l0
	stbar
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movneg	%icc,	%i2,	%o5
	edge8n	%i0,	%g3,	%l1
	fbuge	%fcc1,	loop_937
	fornot1s	%f8,	%f16,	%f23
	nop
	fitos	%f12,	%f4
	fstox	%f4,	%f18
	nop
	set	0x60, %i7
	std	%f14,	[%l7 + %i7]
loop_937:
	sll	%i5,	0x05,	%i7
	nop
	fitos	%f21,	%f28
	smulcc	%o3,	%i1,	%o4
	udivx	%o2,	0x0A0F,	%l3
	brlez,a	%o0,	loop_938
	addcc	%l6,	0x1041,	%i6
	bcs,a,pt	%xcc,	loop_939
	edge16n	%i3,	%g2,	%l4
loop_938:
	fbul,a	%fcc3,	loop_940
	movge	%icc,	%g6,	%i4
loop_939:
	movne	%xcc,	%g7,	%o6
	lduh	[%l7 + 0x34],	%l2
loop_940:
	udivx	%l5,	0x0B17,	%g4
	fornot2s	%f2,	%f31,	%f17
	alignaddrl	%g1,	%g5,	%o1
	fandnot1	%f18,	%f28,	%f2
	fmovsl	%icc,	%f26,	%f17
	nop
	setx	0x5C601FD7F5D42900,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x3D3BB4F08A713356,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f4,	%f2
	edge16l	%o7,	%i2,	%l0
	srl	%o5,	%g3,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x48, %o6
	ldswa	[%l7 + %o6] 0x11,	%i5
	fmovsvc	%xcc,	%f22,	%f12
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x2C] %asi,	%i7
	wr	%g0,	0x89,	%asi
	stha	%o3,	[%l7 + 0x64] %asi
	tpos	%xcc,	0x1
	alignaddr	%l1,	%o4,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne	%xcc,	loop_941
	movrgz	%l3,	%o2,	%o0
	fmovrdlz	%i6,	%f8,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_941:
	edge32ln	%l6,	%i3,	%g2
	fmovs	%f1,	%f17
	array16	%l4,	%g6,	%i4
	sir	0x1319
	fbo,a	%fcc3,	loop_942
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xeb,	%asi
	stwa	%g7,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_942:
	edge8ln	%o6,	%l2,	%g4
	mulx	%g1,	0x04A7,	%g5
	srl	%o1,	0x07,	%l5
	movre	%o7,	0x239,	%l0
	movvc	%icc,	%i2,	%g3
	prefetch	[%l7 + 0x4C],	 0x0
	movge	%icc,	%o5,	%i0
	movpos	%xcc,	%i7,	%i5
	bn,a	%xcc,	loop_943
	tge	%icc,	0x6
	fmovscc	%icc,	%f26,	%f25
	or	%l1,	%o4,	%o3
loop_943:
	movne	%xcc,	%l3,	%i1
	fnot2	%f6,	%f18
	std	%f16,	[%l7 + 0x60]
	bge,pn	%xcc,	loop_944
	popc	0x16A6,	%o0
	edge8ln	%o2,	%i6,	%i3
	tsubcc	%g2,	%l4,	%g6
loop_944:
	stx	%l6,	[%l7 + 0x20]
	add	%i4,	%g7,	%l2
	bvc,pn	%xcc,	loop_945
	fpadd32	%f12,	%f4,	%f26
	movn	%xcc,	%g4,	%o6
	xnorcc	%g1,	0x094A,	%g5
loop_945:
	fmuld8sux16	%f2,	%f23,	%f20
	movvc	%xcc,	%o1,	%o7
	ble,a	%icc,	loop_946
	nop
	setx	0x66447F7D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x0B7D4168,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f22,	%f2
	alignaddr	%l0,	%i2,	%g3
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x30] %asi,	%o4
loop_946:
	fmovrslz	%i0,	%f14,	%f18
	nop
	setx	0x16721E24,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x67C1587A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f20,	%f29
	mulx	%i7,	0x1F8F,	%i5
	fmovrdlez	%l5,	%f22,	%f16
	movcs	%icc,	%l1,	%o4
	fmovrdne	%l3,	%f18,	%f26
	sll	%i1,	0x1B,	%o0
	brgez	%o3,	loop_947
	fexpand	%f21,	%f6
	fmovdpos	%xcc,	%f3,	%f2
	tgu	%icc,	0x3
loop_947:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%i3
	fbu	%fcc2,	loop_948
	nop
	setx	loop_949,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8	%g2,	%i6,	%l4
	edge16l	%g6,	%i4,	%g7
loop_948:
	nop
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%l6
loop_949:
	tne	%icc,	0x0
	edge16ln	%g4,	%o6,	%l2
	tvs	%xcc,	0x3
	for	%f28,	%f22,	%f22
	stw	%g5,	[%l7 + 0x18]
	edge32	%g1,	%o7,	%l0
	bleu,a	%xcc,	loop_950
	tcs	%xcc,	0x0
	mulscc	%o1,	%g3,	%i2
	tpos	%icc,	0x4
loop_950:
	tleu	%xcc,	0x6
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x70] %asi,	%f17
	fbu	%fcc3,	loop_951
	tcs	%icc,	0x7
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x0c,	 0x0
loop_951:
	taddcc	%i7,	%i5,	%o5
	movg	%icc,	%l5,	%o4
	fmovdcc	%xcc,	%f12,	%f8
	edge16ln	%l1,	%i1,	%o0
	fsrc1	%f16,	%f16
	edge8n	%o3,	%o2,	%l3
	fble	%fcc3,	loop_952
	xor	%i3,	0x1DAC,	%i6
	subc	%g2,	0x1D40,	%g6
	edge8ln	%i4,	%g7,	%l4
loop_952:
	tge	%xcc,	0x6
	orncc	%l6,	%g4,	%l2
	edge8n	%g5,	%g1,	%o6
	addcc	%l0,	0x0E6B,	%o1
	fpsub32	%f20,	%f12,	%f28
	ldx	[%l7 + 0x78],	%g3
	andcc	%i2,	%o7,	%i7
	orcc	%i5,	0x095E,	%o5
	fpadd16	%f8,	%f10,	%f24
	alignaddrl	%l5,	%o4,	%l1
	fsrc1s	%f18,	%f5
	srax	%i0,	%i1,	%o0
	bshuffle	%f28,	%f20,	%f0
	tsubcc	%o2,	%o3,	%l3
	sethi	0x1592,	%i3
	tcc	%xcc,	0x1
	andcc	%g2,	0x0017,	%g6
	tneg	%icc,	0x4
	andcc	%i6,	%i4,	%g7
	fmovrde	%l6,	%f12,	%f30
	edge16l	%g4,	%l4,	%g5
	movrgz	%g1,	%o6,	%l2
	bpos,a,pn	%xcc,	loop_953
	sra	%l0,	0x0D,	%o1
	tn	%icc,	0x2
	fmovdg	%xcc,	%f7,	%f3
loop_953:
	bge,a,pt	%icc,	loop_954
	edge16l	%i2,	%o7,	%g3
	sllx	%i7,	%o5,	%l5
	fbue	%fcc2,	loop_955
loop_954:
	fbuge,a	%fcc0,	loop_956
	bg,pn	%xcc,	loop_957
	movgu	%xcc,	%i5,	%l1
loop_955:
	ldsb	[%l7 + 0x4E],	%o4
loop_956:
	edge8l	%i1,	%o0,	%i0
loop_957:
	membar	0x41
	add	%o2,	%l3,	%o3
	sethi	0x1069,	%i3
	tsubcctv	%g6,	%g2,	%i4
	smulcc	%g7,	0x08BF,	%l6
	edge16ln	%g4,	%l4,	%i6
	set	0x14, %l2
	sta	%f0,	[%l7 + %l2] 0x04
	set	0x78, %i1
	swapa	[%l7 + %i1] 0x11,	%g1
	movvc	%xcc,	%o6,	%l2
	tn	%xcc,	0x2
	fcmpgt16	%f10,	%f22,	%g5
	set	0x10, %i2
	stxa	%l0,	[%g0 + %i2] 0x20
	fmovdvs	%xcc,	%f21,	%f28
	fnor	%f0,	%f4,	%f20
	mova	%icc,	%i2,	%o7
	fsrc2	%f22,	%f24
	fpmerge	%f24,	%f27,	%f20
	tge	%xcc,	0x6
	sllx	%g3,	0x1C,	%o1
	fpmerge	%f9,	%f19,	%f8
	nop
	setx	0x45E69CBA21B0D4B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x4F86EE5E23922ED3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f6,	%f4
	smulcc	%o5,	%l5,	%i7
	sll	%l1,	%o4,	%i5
	bvs,pn	%xcc,	loop_958
	addcc	%i1,	%o0,	%i0
	mulx	%l3,	%o3,	%o2
	movcs	%xcc,	%g6,	%g2
loop_958:
	orcc	%i3,	%g7,	%l6
	brlz,a	%g4,	loop_959
	udiv	%l4,	0x193D,	%i4
	tg	%xcc,	0x3
	prefetch	[%l7 + 0x3C],	 0x0
loop_959:
	sra	%i6,	0x11,	%o6
	bgu,pt	%icc,	loop_960
	nop
	setx	0xE78C1732AA037ED5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x8F976AD96CC4B616,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f10,	%f28
	fbul	%fcc1,	loop_961
	subc	%l2,	%g1,	%l0
loop_960:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x74] %asi,	%i2
loop_961:
	fxor	%f8,	%f30,	%f24
	brlz	%o7,	loop_962
	ldsb	[%l7 + 0x51],	%g5
	fmovrsne	%o1,	%f30,	%f14
	tne	%icc,	0x0
loop_962:
	edge8	%o5,	%l5,	%i7
	stb	%l1,	[%l7 + 0x4F]
	ldd	[%l7 + 0x58],	%o4
	movrne	%g3,	%i1,	%o0
	movneg	%xcc,	%i0,	%i5
	tge	%xcc,	0x1
	tpos	%xcc,	0x1
	movcs	%xcc,	%l3,	%o2
	edge32n	%g6,	%o3,	%g2
	addc	%i3,	0x1EA9,	%g7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%g4,	%l6
	mulscc	%i4,	0x0BBA,	%i6
	taddcc	%o6,	%l2,	%g1
	movcs	%xcc,	%l0,	%l4
	edge32	%o7,	%i2,	%g5
	swap	[%l7 + 0x24],	%o1
	tne	%xcc,	0x5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o5,	%i7
	fmovrdlez	%l5,	%f22,	%f8
	fandnot2	%f26,	%f0,	%f28
	nop
	fitod	%f7,	%f0
	mulx	%o4,	%l1,	%i1
	fnot2s	%f31,	%f4
	add	%o0,	%g3,	%i0
	andcc	%l3,	%i5,	%g6
	udivcc	%o3,	0x1CF2,	%o2
	movrgez	%i3,	0x207,	%g7
	smul	%g4,	0x0C1E,	%g2
	nop
	set	0x7C, %i4
	ldsw	[%l7 + %i4],	%l6
	fcmpeq32	%f16,	%f20,	%i4
	fpsub16	%f2,	%f30,	%f12
	edge8n	%i6,	%o6,	%g1
	fmovrdgez	%l2,	%f30,	%f24
	movrlez	%l4,	%l0,	%i2
	srl	%g5,	%o1,	%o5
	umul	%i7,	0x03DA,	%l5
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x08] %asi,	%o7
	fmuld8sux16	%f12,	%f22,	%f28
	fmovscs	%icc,	%f3,	%f13
	mulscc	%l1,	0x145B,	%i1
	fmovsa	%xcc,	%f4,	%f6
	ldstub	[%l7 + 0x65],	%o0
	movcs	%xcc,	%o4,	%i0
	or	%l3,	0x0CC7,	%g3
	sdiv	%g6,	0x1AD5,	%o3
	subccc	%o2,	%i5,	%g7
	fmovrde	%g4,	%f10,	%f4
	orcc	%g2,	%l6,	%i4
	tg	%icc,	0x7
	udivcc	%i6,	0x1494,	%o6
	tne	%xcc,	0x7
	fxors	%f11,	%f27,	%f31
	udivcc	%g1,	0x06E4,	%i3
	fmovd	%f20,	%f4
	set	0x08, %o2
	ldstuba	[%l7 + %o2] 0x19,	%l4
	sra	%l0,	%i2,	%g5
	fbg,a	%fcc1,	loop_963
	lduw	[%l7 + 0x08],	%o1
	set	0x66, %g4
	lduba	[%l7 + %g4] 0x18,	%l2
loop_963:
	tneg	%icc,	0x1
	fandnot1	%f18,	%f14,	%f16
	udivcc	%i7,	0x1331,	%o5
	subcc	%l5,	0x0578,	%l1
	fexpand	%f2,	%f18
	fmovrde	%o7,	%f2,	%f24
	fzeros	%f3
	fmul8x16au	%f20,	%f6,	%f26
	ldsb	[%l7 + 0x08],	%o0
	bneg,a	%icc,	loop_964
	te	%xcc,	0x6
	tle	%icc,	0x7
	mova	%icc,	%i1,	%o4
loop_964:
	fmovrde	%l3,	%f16,	%f18
	tsubcc	%i0,	%g3,	%g6
	xnor	%o3,	0x1716,	%o2
	move	%xcc,	%i5,	%g4
	fmovdneg	%xcc,	%f28,	%f20
	bcs,pt	%xcc,	loop_965
	tleu	%xcc,	0x2
	stx	%g7,	[%l7 + 0x78]
	xnorcc	%l6,	%g2,	%i6
loop_965:
	tl	%xcc,	0x1
	fzeros	%f11
	membar	0x77
	movvc	%xcc,	%o6,	%g1
	set	0x4B, %g3
	ldsba	[%l7 + %g3] 0x89,	%i4
	subccc	%i3,	0x1C55,	%l4
	prefetch	[%l7 + 0x48],	 0x3
	movrgz	%l0,	0x2EB,	%i2
	fpack32	%f20,	%f16,	%f22
	fmovrdlez	%o1,	%f10,	%f8
	bvs,pn	%icc,	loop_966
	ldstub	[%l7 + 0x35],	%g5
	bpos	loop_967
	mulscc	%i7,	0x0E91,	%o5
loop_966:
	nop
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x70] %asi,	%l4
loop_967:
	fbuge,a	%fcc3,	loop_968
	edge32n	%l1,	%l2,	%o7
	stw	%i1,	[%l7 + 0x44]
	edge32ln	%o4,	%o0,	%i0
loop_968:
	nop
	setx	0x70604C70,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	fnors	%f19,	%f0,	%f11
	fba,a	%fcc0,	loop_969
	movrgez	%l3,	%g6,	%g3
	addc	%o2,	%o3,	%i5
	ldub	[%l7 + 0x0D],	%g7
loop_969:
	nop
	fitos	%f8,	%f9
	fstox	%f9,	%f8
	fxtos	%f8,	%f3
	set	0x2C, %g7
	lda	[%l7 + %g7] 0x10,	%f1
	tvc	%xcc,	0x7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%g4,	%g2
	tsubcc	%i6,	%l6,	%o6
	subcc	%g1,	0x1F8E,	%i3
	movrgz	%i4,	0x082,	%l4
	move	%icc,	%i2,	%o1
	ldstub	[%l7 + 0x21],	%g5
	sra	%i7,	0x1A,	%o5
	edge32	%l0,	%l5,	%l1
	tsubcctv	%o7,	0x075C,	%i1
	set	0x70, %l3
	lduwa	[%l7 + %l3] 0x19,	%o4
	fbn	%fcc2,	loop_970
	movl	%icc,	%l2,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o0,	0x1D7D,	%g6
loop_970:
	fmuld8sux16	%f5,	%f28,	%f6
	edge32	%l3,	%g3,	%o2
	smul	%i5,	%o3,	%g4
	addccc	%g2,	0x0CB7,	%i6
	flush	%l7 + 0x14
	edge8n	%l6,	%o6,	%g7
	xor	%g1,	0x1BB9,	%i3
	or	%i4,	0x0655,	%i2
	nop
	setx	0x207EFEB5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	stb	%o1,	[%l7 + 0x4A]
	tg	%xcc,	0x7
	tcs	%icc,	0x4
	tge	%xcc,	0x3
	popc	%l4,	%i7
	edge16l	%o5,	%l0,	%g5
	addcc	%l1,	0x06B4,	%l5
	subc	%i1,	%o7,	%o4
	edge16l	%l2,	%o0,	%i0
	addcc	%g6,	0x07CA,	%g3
	tcs	%icc,	0x4
	brlz,a	%o2,	loop_971
	fmovrdne	%i5,	%f26,	%f26
	addc	%o3,	%l3,	%g2
	movrlz	%g4,	0x213,	%l6
loop_971:
	pdist	%f28,	%f10,	%f2
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x19,	%f0
	bneg	%xcc,	loop_972
	edge32ln	%i6,	%g7,	%o6
	fbl	%fcc3,	loop_973
	fsrc1	%f14,	%f8
loop_972:
	sdivcc	%g1,	0x0A3F,	%i3
	movcs	%xcc,	%i4,	%i2
loop_973:
	movneg	%xcc,	%o1,	%i7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l4,	%o5
	fbge,a	%fcc1,	loop_974
	movrne	%l0,	%l1,	%l5
	smulcc	%i1,	0x06F0,	%g5
	udiv	%o7,	0x12EF,	%o4
loop_974:
	bpos	loop_975
	movle	%xcc,	%o0,	%i0
	bge,a	loop_976
	movrgez	%l2,	0x1BC,	%g3
loop_975:
	tgu	%xcc,	0x7
	addcc	%g6,	%i5,	%o3
loop_976:
	tsubcctv	%o2,	%g2,	%g4
	edge16	%l3,	%i6,	%g7
	movne	%xcc,	%l6,	%g1
	tneg	%xcc,	0x3
	nop
	set	0x25, %l0
	ldstub	[%l7 + %l0],	%i3
	orcc	%i4,	0x0BDD,	%o6
	fblg,a	%fcc3,	loop_977
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o1,	0x1476,	%i7
	addc	%i2,	%l4,	%l0
loop_977:
	prefetch	[%l7 + 0x70],	 0x2
	fbn	%fcc3,	loop_978
	lduw	[%l7 + 0x44],	%l1
	andcc	%o5,	0x0F02,	%l5
	fbo	%fcc3,	loop_979
loop_978:
	nop
	setx	loop_980,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udiv	%i1,	0x0B24,	%g5
	movne	%icc,	%o4,	%o7
loop_979:
	sllx	%i0,	%l2,	%o0
loop_980:
	sllx	%g6,	0x1A,	%i5
	sub	%o3,	%o2,	%g2
	sdivcc	%g4,	0x011A,	%g3
	movvc	%icc,	%i6,	%g7
	nop
	setx	0x0DC5675E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xCDCBB49D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f5,	%f8
	edge16ln	%l6,	%g1,	%l3
	sdiv	%i3,	0x1DF3,	%i4
	nop
	setx	0xF339A7A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xE2F558D6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f27,	%f19
	fbo,a	%fcc3,	loop_981
	nop
	setx	0xE0551E48,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	fble,a	%fcc2,	loop_982
	sll	%o1,	0x1D,	%i7
loop_981:
	xorcc	%o6,	0x003A,	%l4
	ldsw	[%l7 + 0x2C],	%l0
loop_982:
	tgu	%icc,	0x1
	fmovdcc	%icc,	%f29,	%f6
	fmovde	%icc,	%f7,	%f3
	edge8l	%i2,	%o5,	%l1
	movge	%icc,	%i1,	%l5
	edge8ln	%o4,	%o7,	%g5
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sdiv	%l2,	0x1809,	%i0
	tne	%icc,	0x6
	movvc	%xcc,	%g6,	%i5
	fbug,a	%fcc3,	loop_983
	umul	%o0,	%o2,	%o3
	udivcc	%g4,	0x0555,	%g2
	ldd	[%l7 + 0x20],	%i6
loop_983:
	tvc	%xcc,	0x3
	andncc	%g3,	%l6,	%g1
	for	%f6,	%f10,	%f16
	fpsub16	%f24,	%f0,	%f2
	fandnot2	%f16,	%f20,	%f8
	fxors	%f18,	%f23,	%f7
	nop
	set	0x52, %l5
	ldstub	[%l7 + %l5],	%g7
	array8	%l3,	%i3,	%o1
	fmovdgu	%icc,	%f3,	%f18
	ba,a,pn	%xcc,	loop_984
	fmovda	%icc,	%f28,	%f31
	fxnors	%f12,	%f23,	%f10
	fba,a	%fcc3,	loop_985
loop_984:
	brgez,a	%i7,	loop_986
	membar	0x06
	nop
	fitos	%f13,	%f14
	fstox	%f14,	%f22
loop_985:
	sllx	%o6,	0x11,	%i4
loop_986:
	taddcctv	%l4,	%l0,	%i2
	mulx	%o5,	0x17CA,	%l1
	fcmple16	%f0,	%f6,	%l5
	set	0x3C, %g1
	lduwa	[%l7 + %g1] 0x15,	%o4
	movcs	%icc,	%o7,	%g5
	nop
	setx	loop_987,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgz	%l2,	%i0,	%i1
	fpmerge	%f31,	%f0,	%f14
	movn	%icc,	%i5,	%g6
loop_987:
	fxor	%f24,	%f24,	%f10
	srl	%o2,	0x14,	%o3
	fbl,a	%fcc2,	loop_988
	bcc,a,pn	%xcc,	loop_989
	alignaddrl	%o0,	%g4,	%g2
	bleu,a	loop_990
loop_988:
	fmovrsgez	%g3,	%f21,	%f4
loop_989:
	fands	%f18,	%f14,	%f31
	udivx	%l6,	0x0A6A,	%g1
loop_990:
	tneg	%xcc,	0x5
	fbul	%fcc3,	loop_991
	tsubcctv	%g7,	0x1221,	%i6
	sethi	0x003A,	%l3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%i7
loop_991:
	fmovsn	%xcc,	%f26,	%f9
	fmovsleu	%icc,	%f6,	%f9
	subcc	%o6,	%o1,	%l4
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x80,	%f16
	xnorcc	%l0,	0x1255,	%i4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x18] %asi,	%o5
	mulscc	%l1,	%i2,	%o4
	edge8n	%o7,	%l5,	%l2
	te	%icc,	0x3
	subc	%g5,	0x179B,	%i1
	ld	[%l7 + 0x48],	%f18
	tle	%xcc,	0x0
	udivcc	%i5,	0x03C4,	%i0
	movpos	%icc,	%g6,	%o3
	srlx	%o0,	0x09,	%o2
	swap	[%l7 + 0x6C],	%g2
	nop
	setx	0xA7ED9A8E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x51A00AAC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f28,	%f24
	srl	%g3,	0x11,	%g4
	fcmpeq16	%f20,	%f22,	%g1
	andn	%g7,	0x15C2,	%l6
	fand	%f16,	%f28,	%f16
	nop
	set	0x40, %o0
	stx	%l3,	[%l7 + %o0]
	fandnot2	%f8,	%f24,	%f26
	ldsb	[%l7 + 0x2E],	%i6
	movn	%xcc,	%i3,	%i7
	ldsb	[%l7 + 0x18],	%o6
	fmovrdgz	%l4,	%f0,	%f16
	movcc	%icc,	%o1,	%i4
	fmovrslz	%l0,	%f20,	%f29
	ldsb	[%l7 + 0x7B],	%o5
	addc	%i2,	%o4,	%o7
	edge16l	%l5,	%l2,	%g5
	set	0x30, %o4
	stxa	%l1,	[%l7 + %o4] 0xeb
	membar	#Sync
	stbar
	bgu,a,pt	%icc,	loop_992
	movrgz	%i5,	%i0,	%i1
	movleu	%xcc,	%o3,	%g6
	fmovrdgz	%o0,	%f10,	%f2
loop_992:
	fba,a	%fcc0,	loop_993
	fcmpgt16	%f30,	%f30,	%g2
	subc	%o2,	0x0B02,	%g3
	sdivx	%g1,	0x0067,	%g4
loop_993:
	swap	[%l7 + 0x5C],	%l6
	bneg,pn	%xcc,	loop_994
	array16	%l3,	%g7,	%i6
	edge8	%i3,	%o6,	%i7
	fbge,a	%fcc2,	loop_995
loop_994:
	tneg	%icc,	0x0
	addcc	%l4,	0x1CDF,	%i4
	mova	%xcc,	%o1,	%l0
loop_995:
	sra	%i2,	%o5,	%o7
	ldd	[%l7 + 0x28],	%o4
	udivcc	%l2,	0x1FED,	%g5
	nop
	setx	0xFCC97CC5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f5
	or	%l5,	%i5,	%i0
	fmovdg	%icc,	%f10,	%f31
	brlz,a	%i1,	loop_996
	nop
	fitos	%f3,	%f24
	fnand	%f16,	%f22,	%f4
	movcc	%icc,	%l1,	%o3
loop_996:
	add	%o0,	0x1661,	%g2
	fmovdn	%icc,	%f6,	%f10
	fmul8x16	%f3,	%f14,	%f14
	nop
	setx	0x8AFF407E4073BE8F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	ldx	[%l7 + 0x38],	%g6
	brgz	%o2,	loop_997
	fcmple32	%f18,	%f16,	%g1
	fmovrslz	%g3,	%f18,	%f4
	xnorcc	%g4,	%l3,	%l6
loop_997:
	movrlz	%g7,	0x2A2,	%i3
	smul	%i6,	%o6,	%l4
	sll	%i7,	0x0D,	%i4
	bl	loop_998
	addccc	%o1,	0x0589,	%l0
	movrlez	%o5,	0x09A,	%o7
	sub	%i2,	0x0346,	%l2
loop_998:
	udivx	%o4,	0x0DBF,	%g5
	tneg	%icc,	0x2
	fnegd	%f0,	%f10
	fbge,a	%fcc1,	loop_999
	fmovsvc	%xcc,	%f5,	%f12
	subc	%i5,	0x0536,	%l5
	bl,a,pt	%icc,	loop_1000
loop_999:
	fcmple16	%f16,	%f10,	%i0
	sethi	0x0A2F,	%i1
	fmovdne	%icc,	%f2,	%f21
loop_1000:
	tsubcc	%o3,	%l1,	%g2
	edge16l	%o0,	%o2,	%g6
	sethi	0x174D,	%g1
	lduh	[%l7 + 0x0E],	%g4
	fzeros	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l3,	0x0573,	%g3
	move	%xcc,	%g7,	%l6
	xor	%i3,	0x00BE,	%o6
	bn	%icc,	loop_1001
	bvc,a,pn	%xcc,	loop_1002
	array8	%l4,	%i6,	%i4
	sir	0x1E33
loop_1001:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x04,	%i7,	%l0
loop_1002:
	udivcc	%o1,	0x17E1,	%o7
	fornot1	%f10,	%f10,	%f20
	tcc	%icc,	0x2
	st	%f15,	[%l7 + 0x40]
	sub	%i2,	0x1CBB,	%o5
	andcc	%l2,	0x14C6,	%o4
	nop
	setx	0xC187878B061641A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xD7EA1631F477D3DA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f28,	%f22
	fcmpne32	%f20,	%f28,	%i5
	bcs,a,pn	%xcc,	loop_1003
	ldd	[%l7 + 0x58],	%f4
	st	%f29,	[%l7 + 0x2C]
	xnorcc	%l5,	0x0275,	%i0
loop_1003:
	fpadd16	%f28,	%f0,	%f18
	tcs	%xcc,	0x3
	edge16	%i1,	%o3,	%g5
	ldub	[%l7 + 0x34],	%g2
	srax	%l1,	0x0E,	%o2
	srax	%g6,	0x0A,	%o0
	fmovdvs	%icc,	%f6,	%f4
	fbue	%fcc2,	loop_1004
	mulscc	%g4,	0x12E6,	%l3
	subcc	%g1,	0x0576,	%g3
	bpos,a,pn	%xcc,	loop_1005
loop_1004:
	tle	%xcc,	0x5
	brnz	%g7,	loop_1006
	srax	%i3,	0x03,	%l6
loop_1005:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x54] %asi,	%o6
loop_1006:
	sub	%l4,	%i4,	%i6
	nop
	setx	loop_1007,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array32	%l0,	%i7,	%o7
	sdivx	%i2,	0x1388,	%o5
	fpsub32s	%f25,	%f10,	%f15
loop_1007:
	fmovdne	%icc,	%f8,	%f1
	fmovsne	%icc,	%f12,	%f8
	array16	%o1,	%l2,	%o4
	array8	%i5,	%l5,	%i1
	ldx	[%l7 + 0x50],	%i0
	array8	%g5,	%g2,	%o3
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x24] %asi,	%o2
	tcs	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x1
	sdivx	%g6,	0x0A0E,	%o0
	tleu	%icc,	0x2
	set	0x3A, %i6
	ldstuba	[%l7 + %i6] 0x89,	%g4
	srlx	%l1,	0x14,	%g1
	fbule	%fcc3,	loop_1008
	membar	0x5F
	nop
	setx	0x0078D323,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xD58CC1B6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f10,	%f22
	taddcc	%g3,	0x121F,	%l3
loop_1008:
	fble	%fcc1,	loop_1009
	alignaddr	%i3,	%g7,	%o6
	brnz	%l6,	loop_1010
	nop
	fitos	%f2,	%f22
loop_1009:
	fbul	%fcc3,	loop_1011
	fbne,a	%fcc3,	loop_1012
loop_1010:
	srax	%l4,	0x11,	%i6
	nop
	setx	0x7530AAEDE497D45E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x4A3CA48F18DFAFB1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f18,	%f0
loop_1011:
	nop
	set	0x4C, %g2
	stb	%i4,	[%l7 + %g2]
loop_1012:
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f8
	sllx	%l0,	%i7,	%i2
	fexpand	%f1,	%f18
	set	0x30, %o5
	swapa	[%l7 + %o5] 0x80,	%o5
	sir	0x128A
	te	%icc,	0x2
	pdist	%f26,	%f30,	%f8
	andn	%o1,	%l2,	%o7
	fbl	%fcc0,	loop_1013
	andn	%i5,	0x0160,	%l5
	movrlz	%i1,	%o4,	%g5
	te	%xcc,	0x7
loop_1013:
	sll	%g2,	0x1F,	%i0
	ldd	[%l7 + 0x70],	%o2
	sdiv	%o3,	0x0CA4,	%o0
	be	%xcc,	loop_1014
	nop
	setx	loop_1015,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%xcc,	%g6,	%l1
	mova	%icc,	%g4,	%g1
loop_1014:
	xnorcc	%g3,	0x02D4,	%i3
loop_1015:
	movrlz	%g7,	%l3,	%l6
	array8	%l4,	%i6,	%o6
	fmovsne	%xcc,	%f26,	%f22
	nop
	setx	0xDFC1F6F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xD49F34F9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f18,	%f22
	move	%xcc,	%l0,	%i7
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%i4
	srlx	%o5,	%o1,	%l2
	movvs	%xcc,	%i2,	%i5
	ba,a,pt	%xcc,	loop_1016
	nop
	setx	0x6F9227CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xD6A20F5F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f25,	%f9
	fbe,a	%fcc1,	loop_1017
	te	%xcc,	0x4
loop_1016:
	nop
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x19,	%f0
loop_1017:
	udivcc	%l5,	0x17B0,	%o7
	tn	%xcc,	0x3
	array16	%i1,	%o4,	%g5
	fnot2s	%f30,	%f27
	fbul	%fcc2,	loop_1018
	nop
	setx	0xA21C3367752601E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x2B66426B4F0BF168,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f6,	%f20
	edge16	%g2,	%i0,	%o2
	andn	%o0,	%o3,	%g6
loop_1018:
	movrlz	%g4,	0x319,	%g1
	tcs	%icc,	0x0
	set	0x30, %i5
	prefetcha	[%l7 + %i5] 0x89,	 0x1
	set	0x3C, %o3
	lduha	[%l7 + %o3] 0x14,	%i3
	tsubcc	%l1,	%g7,	%l6
	sethi	0x13EF,	%l3
	tleu	%xcc,	0x7
	fbe,a	%fcc3,	loop_1019
	ldd	[%l7 + 0x48],	%l4
	edge16n	%i6,	%l0,	%i7
	stbar
loop_1019:
	ldsw	[%l7 + 0x30],	%o6
	fornot1	%f4,	%f26,	%f2
	srlx	%i4,	0x00,	%o1
	edge8n	%l2,	%o5,	%i2
	movvs	%xcc,	%l5,	%o7
	edge8l	%i1,	%i5,	%g5
	tcs	%icc,	0x1
	tpos	%icc,	0x7
	fmovsne	%xcc,	%f23,	%f29
	xnor	%o4,	%g2,	%o2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x60] %asi,	%i0
	movcc	%xcc,	%o3,	%g6
	sub	%o0,	%g1,	%g4
	movrlez	%g3,	0x05C,	%i3
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x5C] %asi,	%g7
	set	0x08, %i3
	lduha	[%l7 + %i3] 0x80,	%l1
	movn	%xcc,	%l6,	%l3
	fmovdg	%xcc,	%f2,	%f5
	udivcc	%i6,	0x08E6,	%l4
	ld	[%l7 + 0x14],	%f7
	tg	%xcc,	0x1
	srlx	%l0,	%o6,	%i4
	edge32	%i7,	%l2,	%o1
	fbul	%fcc3,	loop_1020
	brlz,a	%i2,	loop_1021
	nop
	fitos	%f14,	%f29
	fstox	%f29,	%f4
	ldsb	[%l7 + 0x65],	%o5
loop_1020:
	nop
	fitos	%f5,	%f1
	fstox	%f1,	%f18
	fxtos	%f18,	%f2
loop_1021:
	tcc	%xcc,	0x5
	sdivcc	%o7,	0x145F,	%l5
	sub	%i5,	0x1552,	%i1
	set	0x38, %l6
	ldswa	[%l7 + %l6] 0x81,	%o4
	orcc	%g2,	0x16E0,	%g5
	edge32	%o2,	%o3,	%g6
	fbug,a	%fcc3,	loop_1022
	smulcc	%i0,	0x0A19,	%o0
	st	%f14,	[%l7 + 0x60]
	be,pn	%icc,	loop_1023
loop_1022:
	nop
	setx	0x5175FCC4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x868C147A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f16,	%f18
	addcc	%g4,	0x12C9,	%g3
	sllx	%g1,	%i3,	%l1
loop_1023:
	sir	0x1ADB
	movgu	%icc,	%l6,	%l3
	udivcc	%i6,	0x12C2,	%g7
	array16	%l0,	%l4,	%o6
	brz	%i7,	loop_1024
	ble,a	%xcc,	loop_1025
	xor	%l2,	0x0FD9,	%o1
	tvs	%xcc,	0x6
loop_1024:
	nop
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
loop_1025:
	movrgz	%o5,	%i4,	%l5
	edge16	%o7,	%i5,	%o4
	fble	%fcc1,	loop_1026
	fmovsa	%xcc,	%f0,	%f7
	fbul,a	%fcc1,	loop_1027
	flush	%l7 + 0x18
loop_1026:
	movne	%icc,	%g2,	%g5
	tl	%icc,	0x3
loop_1027:
	fbge	%fcc2,	loop_1028
	and	%i1,	%o3,	%o2
	addccc	%g6,	%i0,	%g4
	srlx	%g3,	0x0C,	%g1
loop_1028:
	tcs	%xcc,	0x0
	edge32ln	%o0,	%l1,	%i3
	fnegs	%f25,	%f30
	bl,a	%icc,	loop_1029
	ld	[%l7 + 0x7C],	%f2
	sth	%l6,	[%l7 + 0x0C]
	fbug	%fcc0,	loop_1030
loop_1029:
	edge32n	%l3,	%i6,	%g7
	tvs	%icc,	0x7
	array16	%l4,	%o6,	%l0
loop_1030:
	sra	%i7,	0x1B,	%o1
	membar	0x01
	fmul8x16au	%f5,	%f16,	%f8
	fcmpgt32	%f22,	%f6,	%l2
	set	0x20, %o1
	ldda	[%l7 + %o1] 0x27,	%o4
	fmovrsgz	%i2,	%f6,	%f30
	fmovrse	%i4,	%f11,	%f23
	tsubcctv	%o7,	%l5,	%o4
	orncc	%g2,	0x0B46,	%i5
	sll	%i1,	%g5,	%o2
	xnor	%g6,	%o3,	%g4
	fbu,a	%fcc2,	loop_1031
	mulscc	%g3,	%i0,	%o0
	fpadd32	%f20,	%f10,	%f12
	prefetch	[%l7 + 0x6C],	 0x2
loop_1031:
	movne	%xcc,	%g1,	%i3
	fmovrdgz	%l6,	%f26,	%f10
	tn	%xcc,	0x3
	tgu	%icc,	0x7
	xnorcc	%l3,	0x0FED,	%i6
	fpack16	%f18,	%f10
	movrgz	%g7,	%l1,	%o6
	sdivx	%l4,	0x10A8,	%i7
	fpsub32s	%f18,	%f14,	%f10
	subcc	%l0,	%l2,	%o5
	sethi	0x1202,	%i2
	sdivcc	%o1,	0x15C4,	%o7
	set	0x4B, %l1
	ldsba	[%l7 + %l1] 0x11,	%l5
	fmovdcc	%xcc,	%f28,	%f0
	nop
	setx	0xC82B65AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xAE9418D1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f16,	%f0
	movrne	%o4,	0x34C,	%g2
	mova	%xcc,	%i4,	%i5
	taddcctv	%g5,	0x0CBC,	%i1
	umulcc	%o2,	%g6,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g3,	0x16,	%o3
	brnz,a	%o0,	loop_1032
	subc	%i0,	0x16F1,	%i3
	edge16ln	%l6,	%g1,	%l3
	movle	%icc,	%g7,	%i6
loop_1032:
	tg	%xcc,	0x7
	st	%f8,	[%l7 + 0x78]
	nop
	setx loop_1033, %l0, %l1
	jmpl %l1, %o6
	fbne	%fcc1,	loop_1034
	tl	%xcc,	0x7
	membar	0x2B
loop_1033:
	fbl	%fcc2,	loop_1035
loop_1034:
	movcs	%xcc,	%l4,	%i7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l0,	%l1
loop_1035:
	nop
	wr	%g0,	0x11,	%asi
	stba	%o5,	[%l7 + 0x27] %asi
	subccc	%l2,	0x1B2C,	%o1
	orcc	%o7,	0x1466,	%i2
	bleu,pn	%icc,	loop_1036
	movg	%icc,	%o4,	%l5
	fsrc2s	%f5,	%f25
	umul	%g2,	0x06E9,	%i5
loop_1036:
	andcc	%i4,	%g5,	%o2
	add	%i1,	%g6,	%g4
	array16	%g3,	%o3,	%o0
	umulcc	%i3,	%i0,	%l6
	set	0x40, %i7
	lduwa	[%l7 + %i7] 0x19,	%l3
	fmovdpos	%xcc,	%f6,	%f25
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x60] %asi,	%g7
	movrgz	%i6,	0x2AA,	%g1
	edge8ln	%o6,	%i7,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f10,	%f20,	%f30
	tl	%icc,	0x6
	movn	%xcc,	%l1,	%l0
	movrne	%l2,	0x16D,	%o1
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f16
	tcs	%icc,	0x7
	edge8ln	%o5,	%i2,	%o4
	movle	%xcc,	%o7,	%g2
	bvs,a	loop_1037
	movn	%xcc,	%l5,	%i4
	te	%icc,	0x4
	udiv	%i5,	0x0C63,	%o2
loop_1037:
	fpadd32s	%f11,	%f20,	%f31
	bn,pn	%icc,	loop_1038
	tn	%xcc,	0x4
	srax	%g5,	%g6,	%g4
	xnorcc	%i1,	%g3,	%o0
loop_1038:
	umul	%i3,	0x0BA8,	%i0
	array16	%o3,	%l3,	%g7
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f16
	sra	%l6,	0x07,	%i6
	edge16l	%g1,	%i7,	%o6
	nop
	setx	loop_1039,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsa	%icc,	%f5,	%f21
	edge32ln	%l4,	%l0,	%l2
	nop
	fitos	%f25,	%f3
loop_1039:
	movne	%icc,	%o1,	%o5
	sth	%l1,	[%l7 + 0x5A]
	movvc	%icc,	%i2,	%o7
	bl,a,pn	%xcc,	loop_1040
	movrgz	%o4,	0x2CF,	%g2
	edge8n	%l5,	%i4,	%i5
	ldd	[%l7 + 0x48],	%f20
loop_1040:
	fmovsneg	%xcc,	%f5,	%f24
	edge32	%g5,	%g6,	%g4
	popc	%i1,	%o2
	orcc	%o0,	%i3,	%g3
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x24,	%i0
	umul	%l3,	%o3,	%l6
	edge32n	%i6,	%g7,	%g1
	fxor	%f2,	%f30,	%f28
	mulscc	%i7,	0x07F6,	%o6
	ta	%xcc,	0x3
	fpadd16	%f26,	%f10,	%f10
	bgu	loop_1041
	fsrc1	%f20,	%f12
	edge32l	%l0,	%l4,	%o1
	set	0x70, %o7
	stxa	%l2,	[%l7 + %o7] 0x18
loop_1041:
	bge,pn	%icc,	loop_1042
	movn	%xcc,	%l1,	%i2
	nop
	fitos	%f24,	%f6
	udivcc	%o7,	0x038B,	%o4
loop_1042:
	edge8ln	%o5,	%g2,	%l5
	sdivx	%i4,	0x1DD7,	%i5
	movle	%xcc,	%g5,	%g6
	fmovdleu	%icc,	%f26,	%f24
	and	%i1,	%o2,	%o0
	movre	%i3,	%g4,	%g3
	movn	%icc,	%l3,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l6,	0x196,	%i6
	bge,pn	%xcc,	loop_1043
	sra	%g7,	%o3,	%i7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
loop_1043:
	fmovrslz	%l0,	%f29,	%f18
	xorcc	%l4,	0x0C2D,	%o1
	movge	%icc,	%l2,	%l1
	movge	%xcc,	%i2,	%o7
	edge8	%o4,	%o5,	%g2
	move	%xcc,	%l5,	%g1
	flush	%l7 + 0x6C
	movleu	%icc,	%i5,	%g5
	fmuld8sux16	%f16,	%f17,	%f24
	pdist	%f24,	%f22,	%f16
	sdivcc	%g6,	0x15B4,	%i4
	addccc	%o2,	0x06C4,	%i1
	fble	%fcc1,	loop_1044
	movle	%icc,	%i3,	%g4
	add	%g3,	0x007A,	%o0
	bvc	loop_1045
loop_1044:
	tsubcc	%l3,	%l6,	%i6
	udivx	%g7,	0x0147,	%o3
	fmovsvs	%xcc,	%f14,	%f16
loop_1045:
	flush	%l7 + 0x10
	bcc,a,pn	%icc,	loop_1046
	fnors	%f0,	%f30,	%f29
	fcmple32	%f2,	%f28,	%i0
	tne	%icc,	0x0
loop_1046:
	subc	%o6,	%i7,	%l0
	smulcc	%l4,	%l2,	%o1
	brgz	%l1,	loop_1047
	sra	%i2,	%o4,	%o5
	tsubcctv	%g2,	0x1148,	%o7
	andncc	%g1,	%l5,	%i5
loop_1047:
	tleu	%icc,	0x6
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x1B] %asi,	%g5
	nop
	setx	0x3059C596,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	fmovdneg	%xcc,	%f10,	%f21
	orn	%g6,	%o2,	%i1
	sllx	%i4,	0x0B,	%g4
	fmovsa	%xcc,	%f8,	%f24
	edge32ln	%i3,	%o0,	%g3
	lduh	[%l7 + 0x60],	%l6
	call	loop_1048
	tpos	%icc,	0x0
	tn	%icc,	0x0
	for	%f14,	%f24,	%f0
loop_1048:
	stbar
	array8	%i6,	%g7,	%l3
	tcc	%icc,	0x2
	movre	%i0,	%o3,	%o6
	set	0x2C, %l2
	stwa	%l0,	[%l7 + %l2] 0x19
	fmovsneg	%xcc,	%f2,	%f6
	movrlz	%l4,	%i7,	%o1
	array16	%l2,	%i2,	%l1
	fbe,a	%fcc3,	loop_1049
	fnors	%f24,	%f0,	%f20
	call	loop_1050
	tcc	%icc,	0x1
loop_1049:
	edge16n	%o5,	%o4,	%o7
	taddcctv	%g1,	0x0E1A,	%g2
loop_1050:
	array16	%l5,	%g5,	%i5
	edge16ln	%o2,	%g6,	%i1
	ta	%icc,	0x5
	srax	%i4,	%i3,	%o0
	fbge	%fcc3,	loop_1051
	addcc	%g3,	%l6,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f27,	%f11,	%f25
loop_1051:
	sll	%i6,	0x0F,	%g7
	tvc	%xcc,	0x2
	add	%l3,	0x1E57,	%o3
	movcs	%xcc,	%o6,	%i0
	fmovsa	%xcc,	%f25,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%l4,	%l0
	subccc	%i7,	%l2,	%o1
	movge	%xcc,	%i2,	%l1
	fmovdg	%icc,	%f1,	%f10
	sth	%o4,	[%l7 + 0x16]
	edge16n	%o5,	%g1,	%o7
	fmovs	%f18,	%f4
	fbe	%fcc1,	loop_1052
	tsubcctv	%g2,	%l5,	%g5
	movle	%xcc,	%i5,	%o2
	fba	%fcc3,	loop_1053
loop_1052:
	subccc	%i1,	0x0EE6,	%g6
	tleu	%icc,	0x2
	edge32n	%i3,	%o0,	%g3
loop_1053:
	movrgz	%i4,	0x07F,	%l6
	fornot1s	%f24,	%f25,	%f21
	andcc	%i6,	0x1CB1,	%g7
	edge8	%l3,	%g4,	%o3
	st	%f20,	[%l7 + 0x40]
	move	%xcc,	%i0,	%l4
	sir	0x0F0D
	addcc	%o6,	0x004F,	%i7
	srlx	%l0,	0x1A,	%l2
	movrlez	%o1,	0x112,	%i2
	sdiv	%o4,	0x0AFF,	%l1
	ba,pn	%xcc,	loop_1054
	edge32ln	%g1,	%o5,	%o7
	nop
	setx	0x604205A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x5ED81B81,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f14,	%f14
	movrne	%g2,	%g5,	%i5
loop_1054:
	movle	%icc,	%l5,	%i1
	fexpand	%f23,	%f8
	ldsh	[%l7 + 0x54],	%o2
	movcs	%icc,	%i3,	%o0
	subcc	%g3,	%g6,	%l6
	bneg,a	loop_1055
	smul	%i6,	0x1931,	%g7
	edge16ln	%i4,	%g4,	%o3
	umul	%i0,	0x0C83,	%l4
loop_1055:
	movge	%icc,	%l3,	%o6
	movle	%xcc,	%l0,	%i7
	mova	%icc,	%o1,	%i2
	and	%o4,	0x00A7,	%l1
	tleu	%icc,	0x1
	nop
	setx	0xCCA5C0D1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x60D75CD0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f20,	%f3
	fmovdgu	%xcc,	%f16,	%f17
	nop
	setx	0x60503AC7,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	or	%g1,	%l2,	%o5
	brnz	%g2,	loop_1056
	udivx	%g5,	0x03E7,	%i5
	mulscc	%l5,	%o7,	%i1
	tg	%icc,	0x0
loop_1056:
	edge8l	%i3,	%o0,	%o2
	movl	%icc,	%g6,	%l6
	bcc,pt	%icc,	loop_1057
	fand	%f4,	%f22,	%f20
	xorcc	%i6,	0x16EF,	%g3
	nop
	fitod	%f5,	%f28
loop_1057:
	fmuld8ulx16	%f22,	%f16,	%f10
	fmovscs	%xcc,	%f16,	%f14
	andncc	%i4,	%g7,	%o3
	tge	%xcc,	0x5
	te	%icc,	0x6
	fmovdgu	%icc,	%f0,	%f1
	fxnors	%f10,	%f23,	%f3
	edge16l	%g4,	%i0,	%l4
	udivx	%o6,	0x117A,	%l0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%l3
	ldd	[%l7 + 0x60],	%f28
	xnor	%o1,	0x0A91,	%o4
	fnands	%f26,	%f15,	%f21
	fmovsgu	%xcc,	%f18,	%f12
	movge	%icc,	%l1,	%g1
	ld	[%l7 + 0x14],	%f15
	fmovs	%f2,	%f19
	st	%f24,	[%l7 + 0x78]
	fxnor	%f18,	%f18,	%f4
	edge32l	%i2,	%o5,	%l2
	fmovrdlez	%g2,	%f12,	%f10
	orn	%g5,	0x0436,	%i5
	tne	%xcc,	0x1
	addc	%l5,	%o7,	%i3
	movgu	%icc,	%i1,	%o2
	popc	%g6,	%o0
	taddcc	%i6,	0x02E4,	%g3
	umul	%l6,	%i4,	%g7
	srlx	%o3,	0x01,	%g4
	fbg	%fcc3,	loop_1058
	add	%l4,	%i0,	%l0
	fmovdcc	%xcc,	%f29,	%f15
	movrlz	%i7,	0x1B8,	%o6
loop_1058:
	membar	0x28
	edge8l	%o1,	%l3,	%o4
	ta	%xcc,	0x6
	tvc	%icc,	0x1
	sir	0x0250
	edge32ln	%g1,	%l1,	%i2
	fbe	%fcc0,	loop_1059
	addcc	%o5,	0x10EE,	%g2
	umul	%g5,	%l2,	%l5
	brlz	%i5,	loop_1060
loop_1059:
	nop
	set	0x34, %i1
	prefetch	[%l7 + %i1],	 0x1
	edge32l	%o7,	%i3,	%o2
	smul	%i1,	%g6,	%i6
loop_1060:
	tpos	%icc,	0x7
	ta	%icc,	0x0
	fornot1	%f10,	%f18,	%f10
	sethi	0x0CB9,	%o0
	tsubcctv	%l6,	0x06BA,	%i4
	fmovdneg	%xcc,	%f29,	%f18
	edge8n	%g7,	%g3,	%g4
	be,a	loop_1061
	for	%f0,	%f24,	%f18
	fblg	%fcc2,	loop_1062
	fmovdleu	%icc,	%f25,	%f19
loop_1061:
	andcc	%o3,	%l4,	%i0
	set	0x0, %i4
	stxa	%l0,	[%g0 + %i4] 0x5f
loop_1062:
	fbne	%fcc3,	loop_1063
	fmovs	%f28,	%f0
	fornot1s	%f25,	%f24,	%f15
	edge16ln	%o6,	%o1,	%l3
loop_1063:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%o4,	[%l7 + 0x74] %asi
	orn	%g1,	%i7,	%i2
	edge32ln	%l1,	%g2,	%o5
	fmovdleu	%xcc,	%f15,	%f15
	ldd	[%l7 + 0x68],	%f0
	edge32ln	%g5,	%l2,	%l5
	fmovdg	%icc,	%f10,	%f24
	tge	%xcc,	0x2
	movrne	%i5,	0x155,	%i3
	ldsb	[%l7 + 0x69],	%o2
	fone	%f10
	stbar
	ldsh	[%l7 + 0x2E],	%o7
	membar	0x20
	movge	%icc,	%g6,	%i1
	sub	%o0,	0x1FB7,	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l6,	%g7
	mova	%icc,	%i4,	%g4
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%o2
	xor	%l4,	%g3,	%i0
	udiv	%o6,	0x1C94,	%l0
	tsubcctv	%l3,	0x0ECE,	%o4
	bg,a	loop_1064
	srlx	%g1,	%i7,	%o1
	addcc	%l1,	0x19D0,	%i2
	umul	%g2,	0x1477,	%o5
loop_1064:
	edge16n	%g5,	%l5,	%l2
	fpsub32s	%f19,	%f9,	%f17
	smul	%i5,	%i3,	%o2
	fmovscs	%icc,	%f23,	%f7
	and	%o7,	%i1,	%o0
	xorcc	%i6,	0x065E,	%l6
	smul	%g7,	%i4,	%g6
	nop
	setx	0x30761244C1CA4A24,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x4BA21E7110418599,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f26,	%f4
	fmovsleu	%icc,	%f3,	%f27
	tl	%xcc,	0x3
	fmovsge	%icc,	%f30,	%f1
	std	%f8,	[%l7 + 0x68]
	fmovdgu	%icc,	%f29,	%f26
	edge16	%g4,	%o3,	%g3
	fbue	%fcc3,	loop_1065
	mulscc	%l4,	0x1A0B,	%o6
	nop
	fitos	%f4,	%f19
	fstoi	%f19,	%f30
	fbule,a	%fcc3,	loop_1066
loop_1065:
	sub	%l0,	0x060F,	%i0
	fmovdpos	%icc,	%f31,	%f31
	movrlez	%l3,	0x3B6,	%g1
loop_1066:
	ldsh	[%l7 + 0x1E],	%i7
	taddcc	%o1,	0x1C19,	%l1
	sll	%o4,	0x1E,	%i2
	srl	%g2,	%o5,	%g5
	wr	%g0,	0x80,	%asi
	stxa	%l5,	[%l7 + 0x10] %asi
	fpadd32	%f10,	%f20,	%f26
	movre	%i5,	%l2,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f17,	%f10
	subcc	%o7,	0x10F2,	%i1
	fmul8ulx16	%f12,	%f16,	%f22
	fsrc2	%f10,	%f30
	smul	%o0,	0x0935,	%i6
	fnegd	%f6,	%f14
	tleu	%icc,	0x6
	nop
	set	0x3E, %g4
	stb	%l6,	[%l7 + %g4]
	movrlez	%g7,	%i4,	%o2
	taddcc	%g6,	0x15BD,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%g3,	%o3,	%l4
	xor	%l0,	0x0102,	%o6
	and	%i0,	0x09B0,	%l3
	brgz,a	%i7,	loop_1067
	fmovsvs	%xcc,	%f15,	%f11
	movg	%icc,	%o1,	%g1
	tne	%xcc,	0x7
loop_1067:
	lduh	[%l7 + 0x40],	%o4
	fmovspos	%xcc,	%f2,	%f3
	brlez	%l1,	loop_1068
	fmovscc	%xcc,	%f27,	%f23
	fands	%f2,	%f12,	%f17
	fnot2s	%f8,	%f14
loop_1068:
	fpsub32s	%f9,	%f27,	%f16
	set	0x20, %i2
	ldxa	[%g0 + %i2] 0x20,	%i2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%g5
	fmovrsgez	%l5,	%f1,	%f19
	ldx	[%l7 + 0x28],	%i5
	smulcc	%l2,	%o5,	%o7
	nop
	setx	0xC86BFF735CB091F3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xDABC9691382FCF2A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f30,	%f2
	movneg	%icc,	%i3,	%o0
	movl	%xcc,	%i1,	%l6
	movre	%i6,	%i4,	%g7
	fandnot2	%f2,	%f24,	%f22
	bcc	%icc,	loop_1069
	fxnors	%f31,	%f27,	%f7
	fornot2	%f6,	%f2,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1069:
	nop
	setx	loop_1070,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orn	%g6,	%g4,	%o2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%l4
loop_1070:
	fmovdvs	%icc,	%f1,	%f15
	fmovsvc	%xcc,	%f30,	%f10
	edge32n	%g3,	%o6,	%l0
	wr	%g0,	0xe2,	%asi
	stha	%l3,	[%l7 + 0x46] %asi
	membar	#Sync
	sllx	%i0,	%o1,	%g1
	fmul8sux16	%f4,	%f24,	%f28
	sub	%i7,	%o4,	%i2
	tsubcctv	%l1,	%g5,	%l5
	addccc	%i5,	%g2,	%l2
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%i3
	mulx	%o7,	0x162B,	%i1
	orn	%o0,	0x1101,	%l6
	fbuge,a	%fcc1,	loop_1071
	umulcc	%i4,	%g7,	%g6
	fmovdvs	%xcc,	%f29,	%f10
	ldstub	[%l7 + 0x15],	%g4
loop_1071:
	srax	%o2,	0x1D,	%o3
	fbn	%fcc2,	loop_1072
	umul	%i6,	0x07D2,	%l4
	fmovrdne	%o6,	%f24,	%f28
	te	%icc,	0x0
loop_1072:
	fbne	%fcc3,	loop_1073
	srl	%l0,	0x17,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
loop_1073:
	alignaddr	%i0,	%l3,	%o1
	nop
	setx	0x20421209,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x22D474EA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f26,	%f9
	fmul8ulx16	%f14,	%f2,	%f2
	fzero	%f26
	bvs	%xcc,	loop_1074
	alignaddrl	%i7,	%g1,	%i2
	move	%icc,	%l1,	%g5
	move	%icc,	%o4,	%i5
loop_1074:
	sllx	%g2,	%l2,	%l5
	umul	%o5,	0x1A65,	%o7
	fmovspos	%xcc,	%f9,	%f20
	tle	%xcc,	0x5
	movrgz	%i3,	%o0,	%l6
	fpack32	%f12,	%f12,	%f0
	bne,a,pn	%xcc,	loop_1075
	movgu	%xcc,	%i1,	%i4
	ldd	[%l7 + 0x28],	%f18
	fble	%fcc3,	loop_1076
loop_1075:
	brgez,a	%g6,	loop_1077
	mova	%xcc,	%g7,	%g4
	fmul8x16al	%f29,	%f12,	%f24
loop_1076:
	fbl,a	%fcc2,	loop_1078
loop_1077:
	tg	%icc,	0x5
	orcc	%o2,	0x0692,	%i6
	edge32ln	%l4,	%o6,	%o3
loop_1078:
	fbue,a	%fcc1,	loop_1079
	fcmpne16	%f6,	%f0,	%g3
	sdiv	%l0,	0x05F9,	%l3
	edge32	%o1,	%i7,	%i0
loop_1079:
	be,a	loop_1080
	edge32l	%g1,	%i2,	%l1
	movrlz	%o4,	0x1FD,	%g5
	tg	%icc,	0x5
loop_1080:
	movn	%xcc,	%g2,	%i5
	sir	0x05A9
	movrne	%l5,	0x3DD,	%l2
	tleu	%xcc,	0x2
	fbule,a	%fcc1,	loop_1081
	addcc	%o5,	0x16E1,	%o7
	tvc	%icc,	0x1
	tne	%icc,	0x0
loop_1081:
	fmovrdgez	%i3,	%f4,	%f18
	brlez	%o0,	loop_1082
	edge16n	%l6,	%i1,	%i4
	movcc	%xcc,	%g7,	%g4
	movg	%icc,	%g6,	%o2
loop_1082:
	nop
	set	0x50, %g7
	ldda	[%l7 + %g7] 0xea,	%l4
	movpos	%xcc,	%o6,	%o3
	fmovdvs	%icc,	%f24,	%f12
	xnor	%g3,	0x0B74,	%i6
	movn	%icc,	%l0,	%l3
	tgu	%xcc,	0x4
	nop
	fitod	%f10,	%f20
	fdtoi	%f20,	%f14
	move	%icc,	%o1,	%i7
	andn	%g1,	0x1CB3,	%i2
	xnorcc	%i0,	%o4,	%g5
	tvs	%xcc,	0x2
	movvc	%icc,	%g2,	%l1
	set	0x36, %g3
	ldsba	[%l7 + %g3] 0x0c,	%l5
	smulcc	%l2,	%o5,	%o7
	ldsh	[%l7 + 0x4E],	%i5
	tcs	%icc,	0x6
	fmovsn	%icc,	%f26,	%f24
	alignaddr	%i3,	%l6,	%o0
	movrlez	%i1,	%i4,	%g4
	fmovrsgz	%g7,	%f12,	%f11
	edge8ln	%o2,	%g6,	%o6
	orcc	%l4,	%o3,	%i6
	movcc	%xcc,	%l0,	%l3
	move	%xcc,	%o1,	%g3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%g1,	%i7
	set	0x50, %i0
	ldxa	[%l7 + %i0] 0x0c,	%i0
	taddcctv	%o4,	0x0C09,	%g5
	nop
	setx loop_1083, %l0, %l1
	jmpl %l1, %i2
	subccc	%g2,	%l1,	%l2
	fmovsvc	%icc,	%f8,	%f8
	smul	%l5,	%o5,	%o7
loop_1083:
	ldsw	[%l7 + 0x20],	%i5
	tne	%icc,	0x7
	subc	%l6,	0x1376,	%i3
	lduw	[%l7 + 0x08],	%o0
	movrgez	%i4,	%g4,	%g7
	be,a,pn	%xcc,	loop_1084
	fmovdn	%icc,	%f23,	%f19
	fbo	%fcc3,	loop_1085
	fmovdn	%xcc,	%f11,	%f23
loop_1084:
	tcs	%icc,	0x7
	edge16ln	%o2,	%g6,	%o6
loop_1085:
	nop
	wr	%g0,	0x0c,	%asi
	stwa	%l4,	[%l7 + 0x60] %asi
	nop
	setx	0x606C7866,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	movleu	%icc,	%i1,	%i6
	sdiv	%l0,	0x0E6D,	%o3
	fbug	%fcc1,	loop_1086
	fbn	%fcc2,	loop_1087
	bpos,a	%xcc,	loop_1088
	array16	%l3,	%o1,	%g3
loop_1086:
	movl	%xcc,	%g1,	%i7
loop_1087:
	nop
	fitos	%f7,	%f9
	fstox	%f9,	%f6
	fxtos	%f6,	%f12
loop_1088:
	movgu	%xcc,	%i0,	%g5
	fble	%fcc3,	loop_1089
	bleu,a,pn	%xcc,	loop_1090
	movl	%icc,	%i2,	%g2
	movle	%xcc,	%o4,	%l2
loop_1089:
	fmovsa	%xcc,	%f28,	%f2
loop_1090:
	edge8l	%l1,	%o5,	%o7
	addccc	%l5,	%i5,	%l6
	fbne,a	%fcc1,	loop_1091
	edge16ln	%i3,	%i4,	%o0
	movcs	%icc,	%g7,	%o2
	bcc,a,pn	%xcc,	loop_1092
loop_1091:
	sllx	%g6,	0x09,	%o6
	taddcc	%g4,	%l4,	%i6
	fnot1	%f14,	%f22
loop_1092:
	movvs	%icc,	%l0,	%o3
	fornot1	%f12,	%f8,	%f18
	edge32n	%i1,	%l3,	%o1
	movrne	%g3,	%i7,	%g1
	brlez,a	%g5,	loop_1093
	nop
	setx	0x3F8DE57D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f30
	movne	%icc,	%i0,	%i2
	nop
	setx	loop_1094,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1093:
	sllx	%o4,	0x0B,	%l2
	sll	%l1,	0x19,	%o5
	tsubcctv	%g2,	%o7,	%l5
loop_1094:
	nop
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x40] %asi,	%i4
	edge8ln	%i3,	%i4,	%o0
	movleu	%icc,	%g7,	%l6
	nop
	setx	0xD0690650,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	bn,pt	%icc,	loop_1095
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x7
	edge8	%g6,	%o2,	%g4
loop_1095:
	bneg,a	%xcc,	loop_1096
	fbue	%fcc3,	loop_1097
	tg	%xcc,	0x2
	srlx	%l4,	0x01,	%o6
loop_1096:
	movleu	%icc,	%l0,	%o3
loop_1097:
	nop
	setx	0x691FA293E3619A18,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x7AEE61271A3068D2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f30,	%f18
	fbo	%fcc0,	loop_1098
	srlx	%i1,	0x18,	%i6
	subc	%o1,	0x00EC,	%g3
	edge32	%i7,	%l3,	%g5
loop_1098:
	fmovda	%xcc,	%f12,	%f18
	sdiv	%g1,	0x04BF,	%i0
	movn	%xcc,	%i2,	%o4
	fmovsn	%xcc,	%f2,	%f10
	fmovdvs	%icc,	%f7,	%f16
	edge32	%l2,	%o5,	%g2
	wr	%g0,	0x2f,	%asi
	stwa	%l1,	[%l7 + 0x48] %asi
	membar	#Sync
	xnor	%o7,	%i5,	%l5
	brz,a	%i3,	loop_1099
	faligndata	%f0,	%f14,	%f24
	taddcc	%o0,	0x1FD2,	%i4
	fmovdl	%icc,	%f24,	%f17
loop_1099:
	umulcc	%g7,	%g6,	%o2
	add	%g4,	0x0F3E,	%l6
	bn,a,pt	%xcc,	loop_1100
	movge	%icc,	%o6,	%l4
	ldd	[%l7 + 0x40],	%f20
	fpack16	%f16,	%f11
loop_1100:
	fpsub32	%f0,	%f26,	%f8
	mulscc	%o3,	0x15E2,	%i1
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x08] %asi,	%i6
	xor	%o1,	%l0,	%g3
	movpos	%xcc,	%i7,	%g5
	nop
	setx	0x815431304073204E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	mulx	%l3,	%i0,	%i2
	movne	%xcc,	%g1,	%o4
	tle	%icc,	0x0
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f16
	fxtod	%f16,	%f8
	fble	%fcc2,	loop_1101
	fmovse	%icc,	%f0,	%f31
	sdivcc	%l2,	0x0DA7,	%g2
	movg	%xcc,	%o5,	%o7
loop_1101:
	ble,a,pt	%xcc,	loop_1102
	edge32n	%i5,	%l5,	%i3
	fxnors	%f8,	%f30,	%f3
	fmovsa	%xcc,	%f1,	%f26
loop_1102:
	tcs	%icc,	0x7
	movvc	%xcc,	%l1,	%o0
	ldsw	[%l7 + 0x54],	%g7
	sdivx	%i4,	0x05D4,	%o2
	bne	%xcc,	loop_1103
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g4,	%g6,	%o6
	set	0x48, %l0
	stwa	%l6,	[%l7 + %l0] 0x15
loop_1103:
	tvs	%icc,	0x5
	alignaddrl	%l4,	%i1,	%o3
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x88
	fmovse	%icc,	%f20,	%f18
	array32	%i6,	%o1,	%g3
	movne	%xcc,	%i7,	%g5
	movleu	%xcc,	%l0,	%i0
	movgu	%xcc,	%l3,	%i2
	fbo,a	%fcc0,	loop_1104
	xnor	%o4,	0x0A59,	%g1
	edge32l	%l2,	%o5,	%o7
	andcc	%g2,	0x0243,	%l5
loop_1104:
	movpos	%xcc,	%i5,	%l1
	fmovdge	%icc,	%f29,	%f16
	movrlez	%o0,	0x181,	%g7
	movrlez	%i3,	0x0F3,	%o2
	movre	%i4,	%g6,	%g4
	orcc	%o6,	0x1B7E,	%l6
	fmovdge	%icc,	%f0,	%f19
	sll	%i1,	%o3,	%i6
	ba	loop_1105
	srl	%l4,	0x1D,	%o1
	edge32	%g3,	%g5,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1105:
	fsrc2s	%f21,	%f9
	fmovdl	%xcc,	%f15,	%f26
	tpos	%xcc,	0x1
	orncc	%l0,	0x1B8A,	%l3
	fcmpeq16	%f14,	%f8,	%i2
	tl	%icc,	0x3
	fbg	%fcc0,	loop_1106
	bvs	%icc,	loop_1107
	fornot1s	%f21,	%f29,	%f21
	move	%icc,	%i0,	%g1
loop_1106:
	nop
	setx	0xC1476F7A492E0871,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xD1E062D2D1C034D5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f14,	%f28
loop_1107:
	orncc	%o4,	0x0C24,	%o5
	movn	%xcc,	%o7,	%g2
	sllx	%l2,	0x19,	%i5
	bne,a	%xcc,	loop_1108
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l1,	%o0,	%l5
	tg	%xcc,	0x6
loop_1108:
	tne	%icc,	0x1
	movle	%xcc,	%g7,	%o2
	tn	%xcc,	0x3
	bn,a	loop_1109
	bpos,a	loop_1110
	array16	%i3,	%i4,	%g6
	fmovdn	%icc,	%f20,	%f28
loop_1109:
	edge32n	%o6,	%g4,	%l6
loop_1110:
	sdivcc	%i1,	0x08A5,	%i6
	fbue	%fcc0,	loop_1111
	stbar
	fmovdcs	%xcc,	%f3,	%f18
	ldstub	[%l7 + 0x56],	%l4
loop_1111:
	fmul8ulx16	%f4,	%f10,	%f4
	tl	%icc,	0x5
	array16	%o1,	%g3,	%g5
	edge32n	%i7,	%o3,	%l0
	fsrc1	%f4,	%f4
	movvc	%xcc,	%l3,	%i0
	sth	%i2,	[%l7 + 0x62]
	array16	%o4,	%g1,	%o5
	fandnot1	%f18,	%f22,	%f8
	xnor	%g2,	0x0EA4,	%o7
	brlez,a	%l2,	loop_1112
	srax	%i5,	0x02,	%l1
	wr	%g0,	0x0c,	%asi
	stba	%l5,	[%l7 + 0x41] %asi
loop_1112:
	taddcc	%o0,	0x160C,	%o2
	fmovdl	%xcc,	%f24,	%f7
	lduw	[%l7 + 0x50],	%i3
	bl	%icc,	loop_1113
	fandnot2	%f10,	%f16,	%f4
	edge32n	%g7,	%i4,	%g6
	srax	%o6,	0x1F,	%g4
loop_1113:
	taddcc	%l6,	0x17C7,	%i1
	umul	%i6,	0x1BFD,	%l4
	fmovscs	%xcc,	%f16,	%f19
	orn	%g3,	%g5,	%o1
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	popc	0x140E,	%o3
	st	%f4,	[%l7 + 0x68]
	and	%i7,	%l3,	%i0
	edge16l	%i2,	%l0,	%g1
	fsrc1s	%f20,	%f8
	tl	%xcc,	0x2
	bneg	%xcc,	loop_1114
	and	%o5,	%g2,	%o7
	sdivcc	%o4,	0x1D54,	%i5
	fpsub16	%f28,	%f12,	%f6
loop_1114:
	tne	%xcc,	0x6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%l1,	%l5
	ldd	[%l7 + 0x58],	%f30
	fbe	%fcc3,	loop_1115
	addc	%l2,	0x0BB6,	%o0
	tsubcctv	%i3,	%o2,	%i4
	nop
	setx	0xA169926A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f30
loop_1115:
	edge32n	%g6,	%g7,	%o6
	xnorcc	%g4,	%i1,	%l6
	udivx	%l4,	0x1A15,	%g3
	umulcc	%i6,	0x079F,	%o1
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x09] %asi,	%g5
	move	%xcc,	%i7,	%o3
	wr	%g0,	0x04,	%asi
	stxa	%l3,	[%l7 + 0x08] %asi
	fmovscc	%xcc,	%f0,	%f27
	fpadd32s	%f15,	%f20,	%f25
	edge8n	%i2,	%l0,	%g1
	std	%f8,	[%l7 + 0x38]
	popc	0x0A6A,	%o5
	orn	%g2,	0x0710,	%i0
	fnor	%f28,	%f16,	%f18
	alignaddr	%o7,	%o4,	%l1
	fmovdleu	%icc,	%f29,	%f24
	fmovsle	%icc,	%f31,	%f7
	fnor	%f28,	%f4,	%f28
	fbne,a	%fcc2,	loop_1116
	stx	%i5,	[%l7 + 0x48]
	ldsb	[%l7 + 0x2A],	%l2
	tvs	%icc,	0x3
loop_1116:
	nop
	setx	0x3D0B19CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xC4642715,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f9,	%f5
	fmovrsne	%o0,	%f5,	%f4
	ldsb	[%l7 + 0x10],	%i3
	stx	%l5,	[%l7 + 0x50]
	movrlez	%i4,	0x0A3,	%g6
	tsubcctv	%g7,	0x134F,	%o2
	fbn,a	%fcc2,	loop_1117
	tne	%icc,	0x6
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x40] %asi,	%g4
loop_1117:
	and	%i1,	%o6,	%l4
	orn	%l6,	0x0CB5,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x3
	tn	%icc,	0x2
	smul	%g3,	0x04D6,	%o1
	tcc	%xcc,	0x0
	fzeros	%f20
	sdivx	%i7,	0x14F1,	%g5
	orcc	%o3,	0x0F9E,	%l3
	brgez	%i2,	loop_1118
	tneg	%xcc,	0x2
	tn	%icc,	0x5
	edge16ln	%g1,	%l0,	%o5
loop_1118:
	nop
	setx loop_1119, %l0, %l1
	jmpl %l1, %g2
	tcs	%xcc,	0x7
	brgez,a	%o7,	loop_1120
	bn,a,pt	%xcc,	loop_1121
loop_1119:
	mova	%icc,	%i0,	%l1
	set	0x52, %l3
	ldsba	[%l7 + %l3] 0x89,	%i5
loop_1120:
	edge8n	%l2,	%o4,	%i3
loop_1121:
	fabsd	%f26,	%f2
	ta	%xcc,	0x2
	fbue	%fcc2,	loop_1122
	movre	%l5,	0x3DA,	%i4
	bvs	%xcc,	loop_1123
	tl	%xcc,	0x0
loop_1122:
	brlez	%o0,	loop_1124
	orn	%g6,	%o2,	%g7
loop_1123:
	tgu	%xcc,	0x0
	fmul8x16al	%f17,	%f19,	%f20
loop_1124:
	movneg	%icc,	%g4,	%i1
	set	0x2C, %g1
	sta	%f26,	[%l7 + %g1] 0x04
	fxnor	%f12,	%f22,	%f2
	fbule,a	%fcc3,	loop_1125
	umul	%l4,	0x09AF,	%o6
	xorcc	%l6,	%i6,	%g3
	fmovdleu	%icc,	%f4,	%f8
loop_1125:
	fandnot2	%f26,	%f8,	%f0
	fmovdle	%xcc,	%f23,	%f9
	bl,a,pn	%xcc,	loop_1126
	array32	%i7,	%g5,	%o3
	set	0x8, %l4
	ldxa	[%g0 + %l4] 0x20,	%o1
loop_1126:
	tleu	%xcc,	0x6
	smul	%l3,	0x1FF7,	%g1
	bn,pt	%xcc,	loop_1127
	stx	%i2,	[%l7 + 0x78]
	nop
	setx	0x4042F4DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	subcc	%l0,	%g2,	%o7
loop_1127:
	fones	%f30
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x28] %asi,	%i0
	fpadd16	%f30,	%f24,	%f30
	sllx	%l1,	0x18,	%i5
	bleu	loop_1128
	bcc	loop_1129
	fmovrdne	%o5,	%f26,	%f8
	sir	0x1C23
loop_1128:
	xnorcc	%l2,	0x118A,	%o4
loop_1129:
	tge	%xcc,	0x6
	tle	%icc,	0x0
	xnor	%i3,	%i4,	%o0
	orncc	%l5,	%g6,	%o2
	fbge	%fcc0,	loop_1130
	brlz,a	%g7,	loop_1131
	ba,pn	%xcc,	loop_1132
	subccc	%g4,	0x1078,	%l4
loop_1130:
	edge8l	%o6,	%i1,	%i6
loop_1131:
	nop
	set	0x43, %o4
	lduba	[%l7 + %o4] 0x19,	%g3
loop_1132:
	or	%i7,	%g5,	%l6
	ldsw	[%l7 + 0x70],	%o3
	brlez,a	%l3,	loop_1133
	fbg	%fcc0,	loop_1134
	fmovrslz	%g1,	%f11,	%f7
	bg	%icc,	loop_1135
loop_1133:
	fmul8x16	%f29,	%f0,	%f0
loop_1134:
	movl	%xcc,	%i2,	%l0
	subcc	%g2,	%o7,	%i0
loop_1135:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs	loop_1136
	mulx	%l1,	%o1,	%o5
	fbe,a	%fcc1,	loop_1137
	movne	%icc,	%l2,	%o4
loop_1136:
	brlez,a	%i5,	loop_1138
	fpsub16	%f0,	%f24,	%f30
loop_1137:
	tle	%icc,	0x2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x04,	%i3,	%i4
loop_1138:
	udivx	%l5,	0x1874,	%o0
	tpos	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f4,	%f0
	fdtos	%f0,	%f21
	movrgz	%o2,	0x27B,	%g7
	lduh	[%l7 + 0x5E],	%g4
	set	0x60, %i6
	swapa	[%l7 + %i6] 0x19,	%l4
	fbge,a	%fcc1,	loop_1139
	fmovdne	%icc,	%f17,	%f3
	fble,a	%fcc0,	loop_1140
	stbar
loop_1139:
	nop
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x14
loop_1140:
	tl	%xcc,	0x0
	fsrc2s	%f2,	%f18
	tneg	%icc,	0x7
	sth	%g6,	[%l7 + 0x1E]
	sdiv	%i1,	0x0085,	%o6
	xnor	%g3,	%i7,	%g5
	array8	%l6,	%o3,	%l3
	subcc	%i6,	%i2,	%l0
	edge8l	%g2,	%g1,	%i0
	mulx	%o7,	0x0727,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a,pn	%xcc,	loop_1141
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xBF7B0708,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f24
	stx	%o1,	[%l7 + 0x48]
loop_1141:
	andcc	%l2,	%o5,	%o4
	fpadd32	%f22,	%f18,	%f14
	sdivcc	%i5,	0x1CA3,	%i3
	sll	%l5,	%i4,	%o2
	tle	%xcc,	0x1
	edge16n	%g7,	%o0,	%l4
	movrgz	%g4,	%i1,	%o6
	fmovsge	%icc,	%f15,	%f20
	tn	%xcc,	0x2
	fmovrsgez	%g3,	%f4,	%f23
	edge16	%g6,	%i7,	%g5
	nop
	setx	0xB9E4B053,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x76C49BF4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f17,	%f3
	subccc	%l6,	%l3,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%i2,	%l0
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x24] %asi,	%g2
	fmovspos	%xcc,	%f27,	%f22
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x0C] %asi,	%f24
	ble	loop_1142
	fnegd	%f26,	%f26
	fbl	%fcc2,	loop_1143
	tpos	%icc,	0x1
loop_1142:
	stw	%g1,	[%l7 + 0x38]
	tl	%icc,	0x0
loop_1143:
	movrgez	%i6,	0x1C9,	%i0
	fnor	%f20,	%f8,	%f10
	fbu	%fcc3,	loop_1144
	smul	%o7,	0x1C26,	%l1
	movleu	%xcc,	%l2,	%o5
	lduh	[%l7 + 0x40],	%o4
loop_1144:
	edge8	%i5,	%i3,	%o1
	st	%f0,	[%l7 + 0x30]
	fzeros	%f7
	nop
	setx loop_1145, %l0, %l1
	jmpl %l1, %i4
	fmovd	%f0,	%f0
	smul	%l5,	0x151A,	%g7
	bcc	%xcc,	loop_1146
loop_1145:
	tg	%icc,	0x7
	ldstub	[%l7 + 0x09],	%o0
	ldd	[%l7 + 0x40],	%f30
loop_1146:
	fbue,a	%fcc1,	loop_1147
	xnorcc	%o2,	%g4,	%l4
	array32	%o6,	%i1,	%g6
	for	%f2,	%f18,	%f30
loop_1147:
	st	%f2,	[%l7 + 0x5C]
	fxors	%f8,	%f23,	%f29
	fmul8sux16	%f4,	%f14,	%f20
	te	%xcc,	0x7
	sdiv	%i7,	0x06EC,	%g5
	sir	0x0848
	edge32ln	%g3,	%l6,	%l3
	movleu	%xcc,	%o3,	%i2
	tcc	%icc,	0x1
	fmul8x16al	%f14,	%f31,	%f6
	fmovdneg	%xcc,	%f30,	%f1
	fsrc1s	%f14,	%f18
	sir	0x13A2
	add	%l0,	%g1,	%i6
	set	0x14, %o5
	ldswa	[%l7 + %o5] 0x80,	%g2
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f20
	array8	%o7,	%l1,	%i0
	edge16ln	%o5,	%o4,	%l2
	wr	%g0,	0xea,	%asi
	stba	%i3,	[%l7 + 0x4C] %asi
	membar	#Sync
	nop
	setx	0xC68ECE8C6F8C2F93,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x47DFFE7BAC0102C3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f24,	%f26
	array32	%o1,	%i4,	%i5
	srl	%l5,	0x0C,	%g7
	membar	0x65
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x2
	fbule,a	%fcc3,	loop_1148
	std	%f24,	[%l7 + 0x30]
	array32	%o0,	%g4,	%l4
	fbl	%fcc1,	loop_1149
loop_1148:
	brgez	%o6,	loop_1150
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f20
	orcc	%g6,	%i1,	%g5
loop_1149:
	nop
	setx	loop_1151,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1150:
	fpack16	%f6,	%f8
	fbg,a	%fcc1,	loop_1152
	fmovdleu	%xcc,	%f15,	%f31
loop_1151:
	movg	%icc,	%i7,	%g3
	sir	0x0EFD
loop_1152:
	stx	%l6,	[%l7 + 0x70]
	wr	%g0,	0x2f,	%asi
	stwa	%o3,	[%l7 + 0x20] %asi
	membar	#Sync
	movn	%xcc,	%i2,	%l0
	fmovs	%f5,	%f14
	array16	%g1,	%l3,	%i6
	andcc	%o7,	%g2,	%l1
	edge8l	%o5,	%i0,	%l2
	edge16l	%o4,	%o1,	%i3
	ldub	[%l7 + 0x33],	%i5
	nop
	fitod	%f12,	%f14
	fdtoi	%f14,	%f18
	xor	%i4,	%l5,	%g7
	fbne	%fcc1,	loop_1153
	tcs	%icc,	0x3
	for	%f8,	%f4,	%f8
	tleu	%xcc,	0x3
loop_1153:
	fmovsle	%icc,	%f24,	%f13
	sdiv	%o2,	0x108A,	%g4
	fpmerge	%f25,	%f17,	%f22
	mulx	%o0,	%o6,	%l4
	sdivcc	%g6,	0x175C,	%g5
	brnz,a	%i7,	loop_1154
	sra	%g3,	%l6,	%o3
	tle	%icc,	0x3
	fbue	%fcc1,	loop_1155
loop_1154:
	sra	%i2,	%i1,	%l0
	swap	[%l7 + 0x2C],	%g1
	fmovrdgez	%l3,	%f4,	%f18
loop_1155:
	fmul8sux16	%f26,	%f14,	%f10
	nop
	setx	0x22021D5403CDA0D7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x11C27C0F2E8EE76B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f20,	%f20
	movrgz	%i6,	%g2,	%l1
	move	%icc,	%o5,	%i0
	membar	0x0B
	andn	%l2,	%o7,	%o1
	bne,pn	%xcc,	loop_1156
	edge8ln	%o4,	%i5,	%i4
	fmovsg	%xcc,	%f4,	%f13
	ble,a,pn	%xcc,	loop_1157
loop_1156:
	fmul8ulx16	%f12,	%f14,	%f4
	tcs	%xcc,	0x6
	nop
	setx	0xF8C79293ECAF355F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f8
loop_1157:
	subcc	%l5,	0x0049,	%i3
	umulcc	%g7,	%o2,	%o0
	fcmpne32	%f16,	%f18,	%g4
	fmovdneg	%icc,	%f20,	%f12
	movpos	%xcc,	%o6,	%l4
	edge32l	%g5,	%g6,	%g3
	addccc	%l6,	0x1780,	%i7
	andncc	%o3,	%i2,	%i1
	fbue,a	%fcc2,	loop_1158
	orcc	%l0,	0x1BCA,	%l3
	std	%f18,	[%l7 + 0x58]
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x5B] %asi,	%i6
loop_1158:
	fmovde	%icc,	%f17,	%f4
	sir	0x01BA
	sll	%g1,	0x1B,	%l1
	membar	0x12
	bleu,a,pt	%icc,	loop_1159
	edge16l	%g2,	%o5,	%l2
	std	%f2,	[%l7 + 0x30]
	stx	%i0,	[%l7 + 0x08]
loop_1159:
	fpadd32	%f26,	%f16,	%f16
	fbue	%fcc1,	loop_1160
	andn	%o1,	0x00C5,	%o4
	brgez,a	%o7,	loop_1161
	movrgz	%i4,	0x317,	%l5
loop_1160:
	movg	%xcc,	%i3,	%i5
	movl	%xcc,	%o2,	%g7
loop_1161:
	addccc	%g4,	%o6,	%l4
	xnorcc	%o0,	0x0CB9,	%g6
	subcc	%g3,	%g5,	%l6
	popc	0x05F8,	%i7
	sethi	0x08C3,	%o3
	call	loop_1162
	movrgz	%i2,	0x134,	%i1
	fmovsle	%xcc,	%f4,	%f23
	lduw	[%l7 + 0x0C],	%l0
loop_1162:
	nop
	fitos	%f1,	%f29
	fstod	%f29,	%f20
	edge8ln	%i6,	%l3,	%l1
	stx	%g2,	[%l7 + 0x68]
	edge32	%g1,	%l2,	%o5
	alignaddrl	%i0,	%o1,	%o7
	fmovscs	%icc,	%f0,	%f13
	nop
	set	0x40, %g5
	ldstub	[%l7 + %g5],	%o4
	lduw	[%l7 + 0x10],	%i4
	faligndata	%f8,	%f30,	%f2
	flush	%l7 + 0x2C
	tneg	%xcc,	0x3
	std	%f28,	[%l7 + 0x10]
	edge16l	%i3,	%i5,	%o2
	nop
	setx	0xFAA62F77FAEC6788,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f0
	fmovrdne	%g7,	%f28,	%f16
	fmovsg	%icc,	%f14,	%f28
	taddcctv	%l5,	0x0D42,	%o6
	set	0x2C, %i5
	lda	[%l7 + %i5] 0x80,	%f21
	tle	%icc,	0x2
	popc	%g4,	%o0
	bgu,a,pt	%xcc,	loop_1163
	fmuld8sux16	%f19,	%f1,	%f14
	xnorcc	%l4,	0x16BF,	%g6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x18] %asi,	%g3
loop_1163:
	udivx	%l6,	0x0023,	%i7
	subcc	%g5,	%o3,	%i2
	nop
	fitos	%f14,	%f11
	fstox	%f11,	%f28
	fbue,a	%fcc2,	loop_1164
	ldub	[%l7 + 0x54],	%i1
	fble,a	%fcc3,	loop_1165
	movpos	%xcc,	%l0,	%l3
loop_1164:
	fbne	%fcc1,	loop_1166
	edge32n	%i6,	%g2,	%g1
loop_1165:
	tsubcc	%l1,	%o5,	%i0
	ldstub	[%l7 + 0x27],	%o1
loop_1166:
	sllx	%l2,	0x04,	%o4
	tl	%xcc,	0x4
	fbne,a	%fcc2,	loop_1167
	edge8	%i4,	%o7,	%i5
	orcc	%i3,	%g7,	%o2
	lduh	[%l7 + 0x26],	%o6
loop_1167:
	array8	%g4,	%l5,	%o0
	fcmpeq32	%f28,	%f18,	%g6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x68] %asi,	%g3
	edge16l	%l6,	%l4,	%g5
	sub	%o3,	0x068A,	%i7
	smul	%i2,	%l0,	%i1
	brlez,a	%l3,	loop_1168
	tvs	%xcc,	0x3
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
loop_1168:
	fmovdvc	%xcc,	%f22,	%f5
	fornot1	%f6,	%f2,	%f26
	tsubcctv	%i6,	%g1,	%l1
	fmovd	%f0,	%f2
	fmovdg	%icc,	%f5,	%f26
	sethi	0x10BA,	%i0
	andn	%o1,	%o5,	%o4
	subcc	%l2,	%i4,	%i5
	move	%xcc,	%o7,	%i3
	sdiv	%g7,	0x0E59,	%o6
	fmul8sux16	%f30,	%f2,	%f2
	bcc,pn	%icc,	loop_1169
	and	%g4,	%o2,	%l5
	andncc	%g6,	%o0,	%l6
	movrlz	%l4,	0x1D4,	%g3
loop_1169:
	bcc,a,pn	%icc,	loop_1170
	umulcc	%o3,	0x0B0F,	%g5
	fcmpgt32	%f20,	%f12,	%i2
	nop
	setx	0x144AD6F9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f19
loop_1170:
	edge16	%i7,	%i1,	%l3
	bne,a	loop_1171
	ba,a,pt	%icc,	loop_1172
	ta	%icc,	0x6
	bne	loop_1173
loop_1171:
	ta	%icc,	0x4
loop_1172:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x1A] %asi,	%g2
loop_1173:
	fornot2	%f6,	%f28,	%f28
	set	0x42, %o3
	stha	%i6,	[%l7 + %o3] 0x2a
	membar	#Sync
	sub	%g1,	0x13E1,	%l0
	edge16	%l1,	%i0,	%o5
	tl	%xcc,	0x3
	movn	%xcc,	%o4,	%l2
	fbg,a	%fcc0,	loop_1174
	edge8	%i4,	%o1,	%i5
	ld	[%l7 + 0x3C],	%f0
	fmul8x16al	%f16,	%f17,	%f2
loop_1174:
	ta	%xcc,	0x4
	bgu,pn	%xcc,	loop_1175
	array32	%i3,	%g7,	%o7
	smul	%g4,	0x0043,	%o2
	movne	%xcc,	%o6,	%g6
loop_1175:
	addc	%l5,	0x14FF,	%l6
	nop
	fitos	%f18,	%f18
	set	0x24, %o0
	sta	%f18,	[%l7 + %o0] 0x80
	movrne	%o0,	%l4,	%o3
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf8
	membar	#Sync
	tneg	%xcc,	0x3
	bne,pt	%xcc,	loop_1176
	nop
	setx loop_1177, %l0, %l1
	jmpl %l1, %g5
	fba,a	%fcc1,	loop_1178
	xor	%i2,	%g3,	%i1
loop_1176:
	or	%i7,	%l3,	%g2
loop_1177:
	popc	0x1807,	%g1
loop_1178:
	fzero	%f12
	fbule,a	%fcc1,	loop_1179
	array8	%i6,	%l0,	%l1
	edge8ln	%i0,	%o5,	%l2
	movne	%xcc,	%i4,	%o1
loop_1179:
	bcs,pn	%icc,	loop_1180
	fabsd	%f18,	%f4
	taddcctv	%o4,	%i3,	%g7
	udivx	%i5,	0x152C,	%g4
loop_1180:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o2,	%o6
	andn	%g6,	%l5,	%o7
	nop
	setx	loop_1181,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bcs,pt	%icc,	loop_1182
	movl	%xcc,	%o0,	%l4
	addccc	%o3,	0x15DD,	%g5
loop_1181:
	fabss	%f19,	%f27
loop_1182:
	ldsb	[%l7 + 0x18],	%l6
	tne	%xcc,	0x5
	move	%icc,	%g3,	%i2
	tpos	%xcc,	0x3
	bg,pn	%icc,	loop_1183
	tsubcctv	%i7,	0x1DEF,	%i1
	movpos	%xcc,	%g2,	%l3
	ba,a	%icc,	loop_1184
loop_1183:
	bneg,a	loop_1185
	array8	%g1,	%l0,	%l1
	brz,a	%i0,	loop_1186
loop_1184:
	nop
	fitos	%f3,	%f26
	fstod	%f26,	%f18
loop_1185:
	nop
	set	0x21, %i3
	ldsba	[%l7 + %i3] 0x11,	%i6
loop_1186:
	edge8	%o5,	%i4,	%o1
	pdist	%f12,	%f28,	%f6
	fbl	%fcc0,	loop_1187
	subcc	%l2,	%i3,	%o4
	movcs	%icc,	%i5,	%g7
	movl	%icc,	%g4,	%o6
loop_1187:
	fpack16	%f16,	%f31
	movcs	%xcc,	%o2,	%l5
	udivcc	%o7,	0x0B6C,	%o0
	fbule	%fcc3,	loop_1188
	tneg	%icc,	0x0
	fbule	%fcc2,	loop_1189
	sir	0x1580
loop_1188:
	movg	%xcc,	%l4,	%g6
	nop
	setx	loop_1190,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1189:
	xnor	%g5,	0x0D05,	%o3
	bne,a	loop_1191
	edge32ln	%l6,	%g3,	%i7
loop_1190:
	nop
	setx	loop_1192,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%i2,	0x1B,	%i1
loop_1191:
	movrlez	%g2,	0x3BA,	%l3
	fmovscs	%icc,	%f10,	%f11
loop_1192:
	fnors	%f31,	%f17,	%f3
	ldd	[%l7 + 0x18],	%g0
	fmovrsne	%l1,	%f19,	%f29
	nop
	setx	0x47E11C71EA51B8B3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x4984A3521EAC53EE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f24,	%f30
	array16	%i0,	%i6,	%l0
	nop
	fitos	%f2,	%f18
	fstoi	%f18,	%f17
	popc	%o5,	%o1
	movleu	%icc,	%i4,	%i3
	tvs	%xcc,	0x1
	orcc	%l2,	0x07F4,	%o4
	umul	%i5,	0x1586,	%g7
	nop
	setx	loop_1193,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fabsd	%f12,	%f30
	fxors	%f22,	%f14,	%f8
	set	0x14, %o1
	sta	%f2,	[%l7 + %o1] 0x19
loop_1193:
	fmovsa	%icc,	%f7,	%f11
	or	%g4,	0x0A7D,	%o6
	fmovdgu	%icc,	%f16,	%f5
	edge32ln	%o2,	%l5,	%o0
	andn	%l4,	0x08E1,	%o7
	movrgez	%g6,	%g5,	%o3
	movneg	%icc,	%g3,	%i7
	array16	%i2,	%i1,	%l6
	fcmpne32	%f16,	%f10,	%l3
	umul	%g2,	0x1096,	%g1
	movl	%icc,	%l1,	%i6
	ldstub	[%l7 + 0x3B],	%l0
	fmovdle	%xcc,	%f21,	%f9
	and	%o5,	0x1AF4,	%o1
	nop
	setx	0xC02B4D23404527D7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	xnorcc	%i4,	%i0,	%i3
	set	0x10, %l1
	lda	[%l7 + %l1] 0x18,	%f19
	fbo	%fcc3,	loop_1194
	xor	%l2,	0x12B7,	%i5
	membar	0x37
	movvs	%xcc,	%g7,	%g4
loop_1194:
	fands	%f7,	%f21,	%f25
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x20] %asi,	%o6
	edge32l	%o2,	%o4,	%l5
	movvs	%xcc,	%l4,	%o0
	fpsub32	%f12,	%f18,	%f14
	sllx	%o7,	%g6,	%o3
	smul	%g5,	0x15D1,	%i7
	movn	%icc,	%i2,	%i1
	tsubcc	%g3,	%l6,	%l3
	subcc	%g1,	0x0538,	%l1
	fnot2s	%f23,	%f24
	nop
	fitod	%f6,	%f0
	fdtox	%f0,	%f16
	orcc	%i6,	%l0,	%g2
	fcmpeq32	%f10,	%f12,	%o5
	taddcctv	%i4,	0x0C5F,	%i0
	fnegs	%f8,	%f10
	andncc	%o1,	%i3,	%l2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%g4
	edge32n	%o6,	%g7,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%l5,	%l4
	membar	0x21
	alignaddrl	%o0,	%o7,	%g6
	fones	%f15
	fsrc2	%f16,	%f14
	array16	%o2,	%o3,	%i7
	fnot2	%f12,	%f28
	sll	%g5,	0x13,	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x0c,	%i1,	%l6
	movcs	%xcc,	%g3,	%l3
	bpos,a	loop_1195
	tl	%xcc,	0x7
	fbe,a	%fcc1,	loop_1196
	tvc	%icc,	0x2
loop_1195:
	xnor	%g1,	%l1,	%l0
	fbne,a	%fcc2,	loop_1197
loop_1196:
	mulx	%g2,	%i6,	%o5
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x5B] %asi,	%i4
loop_1197:
	edge32	%i0,	%o1,	%l2
	fbuge,a	%fcc0,	loop_1198
	sllx	%i3,	%g4,	%o6
	nop
	setx loop_1199, %l0, %l1
	jmpl %l1, %g7
	fbuge	%fcc3,	loop_1200
loop_1198:
	bne,a,pt	%icc,	loop_1201
	tn	%icc,	0x2
loop_1199:
	fmovrsne	%i5,	%f27,	%f6
loop_1200:
	fmovdneg	%icc,	%f23,	%f29
loop_1201:
	fcmpne32	%f10,	%f18,	%o4
	fbe	%fcc2,	loop_1202
	tle	%icc,	0x6
	movl	%icc,	%l4,	%o0
	sll	%l5,	0x14,	%o7
loop_1202:
	umulcc	%o2,	%o3,	%g6
	fmovsle	%xcc,	%f18,	%f28
	sub	%g5,	%i2,	%i7
	membar	0x47
	edge8n	%l6,	%g3,	%i1
	ldstub	[%l7 + 0x0F],	%l3
	movl	%xcc,	%g1,	%l1
	fpack32	%f22,	%f22,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l0,	%i6
	array8	%g2,	%o5,	%i0
	set	0x60, %g6
	lda	[%l7 + %g6] 0x04,	%f14
	orcc	%i4,	0x0FE0,	%l2
	fbne,a	%fcc2,	loop_1203
	subcc	%o1,	%g4,	%i3
	xor	%g7,	0x08BC,	%i5
	orcc	%o4,	0x18FF,	%l4
loop_1203:
	mulx	%o0,	0x0F83,	%l5
	sllx	%o6,	0x0C,	%o7
	movneg	%xcc,	%o3,	%o2
	edge8n	%g6,	%g5,	%i2
	fxnor	%f24,	%f16,	%f20
	edge8	%l6,	%g3,	%i7
	movne	%xcc,	%i1,	%l3
	movrlez	%l1,	0x0EE,	%l0
	tge	%xcc,	0x2
	movrne	%i6,	%g1,	%g2
	fmovrsgez	%o5,	%f22,	%f7
	be	loop_1204
	alignaddrl	%i4,	%i0,	%o1
	nop
	setx	0x5A6AF726807F7C0A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	movcs	%icc,	%g4,	%l2
loop_1204:
	fmovsgu	%xcc,	%f25,	%f18
	brgz,a	%g7,	loop_1205
	te	%xcc,	0x7
	fmovsne	%xcc,	%f7,	%f15
	alignaddr	%i3,	%o4,	%i5
loop_1205:
	popc	0x0AE8,	%l4
	umulcc	%l5,	%o0,	%o6
	array16	%o7,	%o3,	%g6
	xnor	%o2,	0x0006,	%g5
	sdivx	%i2,	0x1F40,	%l6
	sdivx	%i7,	0x12D3,	%i1
	smulcc	%l3,	%g3,	%l0
	edge8l	%l1,	%g1,	%i6
	popc	%g2,	%i4
	bneg,a,pn	%xcc,	loop_1206
	fmovsleu	%xcc,	%f4,	%f30
	tn	%icc,	0x3
	sub	%i0,	%o1,	%g4
loop_1206:
	bneg	%icc,	loop_1207
	xnorcc	%o5,	0x0980,	%l2
	lduh	[%l7 + 0x4C],	%i3
	tle	%icc,	0x4
loop_1207:
	fbule	%fcc2,	loop_1208
	edge16l	%o4,	%g7,	%l4
	sdiv	%i5,	0x0209,	%o0
	fbug	%fcc3,	loop_1209
loop_1208:
	edge32ln	%l5,	%o7,	%o3
	orn	%g6,	0x068E,	%o6
	ta	%xcc,	0x2
loop_1209:
	sll	%g5,	0x0F,	%o2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l6,	%i2
	ldd	[%l7 + 0x58],	%i6
	edge8	%i1,	%g3,	%l3
	addccc	%l0,	0x0EA4,	%l1
	tsubcctv	%g1,	0x1EEA,	%i6
	subc	%i4,	0x14A7,	%g2
	stw	%o1,	[%l7 + 0x54]
	alignaddrl	%g4,	%i0,	%l2
	fcmpne16	%f28,	%f0,	%o5
	array8	%o4,	%g7,	%i3
	fmovsvs	%xcc,	%f16,	%f20
	brgz	%l4,	loop_1210
	udivx	%o0,	0x1996,	%i5
	movneg	%icc,	%l5,	%o3
	mulscc	%o7,	%g6,	%o6
loop_1210:
	edge8	%g5,	%l6,	%o2
	edge8n	%i7,	%i2,	%g3
	bcc	loop_1211
	movn	%icc,	%i1,	%l3
	andcc	%l1,	%l0,	%g1
	set	0x14, %o6
	ldswa	[%l7 + %o6] 0x14,	%i4
loop_1211:
	fbl	%fcc1,	loop_1212
	movcc	%xcc,	%i6,	%g2
	sethi	0x18C4,	%o1
	movn	%xcc,	%g4,	%l2
loop_1212:
	nop
	setx	0x5CF454A7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x68EA595D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f29,	%f4
	tn	%xcc,	0x1
	fandnot2	%f26,	%f4,	%f10
	fsrc2	%f12,	%f0
	mulscc	%i0,	%o4,	%g7
	andncc	%i3,	%o5,	%l4
	smulcc	%i5,	%o0,	%o3
	pdist	%f30,	%f6,	%f8
	umul	%l5,	0x0AE7,	%o7
	orcc	%g6,	0x1CEA,	%g5
	bge,pt	%xcc,	loop_1213
	bvs,a,pn	%icc,	loop_1214
	fbul,a	%fcc3,	loop_1215
	tcc	%icc,	0x6
loop_1213:
	fpadd32s	%f24,	%f10,	%f18
loop_1214:
	sdivx	%o6,	0x1B35,	%o2
loop_1215:
	tgu	%icc,	0x7
	fmuld8sux16	%f26,	%f19,	%f26
	movrne	%i7,	0x3BE,	%l6
	tpos	%xcc,	0x5
	fmovsl	%icc,	%f17,	%f21
	sdiv	%g3,	0x0779,	%i1
	tcc	%icc,	0x7
	fmovrdne	%i2,	%f12,	%f26
	swap	[%l7 + 0x4C],	%l1
	edge32ln	%l0,	%l3,	%i4
	edge32ln	%g1,	%i6,	%o1
	fmovsl	%xcc,	%f29,	%f0
	srax	%g4,	%g2,	%i0
	set	0x4C, %i7
	swapa	[%l7 + %i7] 0x04,	%l2
	orcc	%o4,	0x18A3,	%g7
	tne	%xcc,	0x2
	movrlz	%i3,	0x09E,	%l4
	edge16n	%i5,	%o0,	%o5
	movvs	%xcc,	%o3,	%l5
	movrgez	%o7,	0x0D7,	%g6
	subccc	%g5,	0x1949,	%o6
	edge32ln	%i7,	%l6,	%o2
	add	%i1,	0x10B9,	%g3
	edge16	%i2,	%l0,	%l1
	set	0x28, %l2
	lduha	[%l7 + %l2] 0x04,	%i4
	fmovrsgez	%l3,	%f30,	%f24
	bg,a,pn	%xcc,	loop_1216
	udiv	%g1,	0x1DEA,	%o1
	movne	%icc,	%i6,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1216:
	fmovrsne	%g2,	%f17,	%f20
	fcmpne32	%f22,	%f26,	%l2
	xorcc	%o4,	%i0,	%g7
	fbul	%fcc1,	loop_1217
	movn	%xcc,	%l4,	%i3
	bneg,a,pt	%xcc,	loop_1218
	fmovdvs	%icc,	%f11,	%f10
loop_1217:
	fmovdl	%icc,	%f14,	%f10
	fmovrsgz	%i5,	%f11,	%f17
loop_1218:
	ldstub	[%l7 + 0x0F],	%o0
	faligndata	%f6,	%f14,	%f0
	bn,a	loop_1219
	stw	%o3,	[%l7 + 0x6C]
	fmovdg	%icc,	%f11,	%f23
	addc	%o5,	0x0E58,	%l5
loop_1219:
	fbo,a	%fcc2,	loop_1220
	fnegs	%f31,	%f20
	movcs	%icc,	%g6,	%o7
	fcmpeq16	%f16,	%f2,	%o6
loop_1220:
	nop
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x36] %asi,	%g5
	sdivx	%i7,	0x08BA,	%o2
	movle	%xcc,	%i1,	%l6
	fbo,a	%fcc0,	loop_1221
	fmovrslez	%i2,	%f14,	%f11
	fmovscs	%icc,	%f22,	%f27
	srlx	%l0,	0x09,	%l1
loop_1221:
	array16	%g3,	%i4,	%g1
	fmovdneg	%xcc,	%f31,	%f28
	umul	%o1,	0x10C0,	%l3
	addc	%g4,	0x1EE4,	%i6
	fornot1	%f2,	%f10,	%f2
	fmovdgu	%icc,	%f19,	%f31
	nop
	fitos	%f8,	%f4
	fstox	%f4,	%f26
	ldstub	[%l7 + 0x75],	%g2
	bge	loop_1222
	sll	%o4,	%l2,	%g7
	fmovdg	%xcc,	%f30,	%f0
	bvc,pn	%xcc,	loop_1223
loop_1222:
	movgu	%xcc,	%i0,	%l4
	fmovsvs	%xcc,	%f9,	%f24
	fbne	%fcc2,	loop_1224
loop_1223:
	ba,pn	%icc,	loop_1225
	edge8ln	%i3,	%o0,	%o3
	st	%f11,	[%l7 + 0x7C]
loop_1224:
	tle	%xcc,	0x6
loop_1225:
	mulx	%o5,	%l5,	%g6
	edge8ln	%o7,	%i5,	%g5
	movneg	%icc,	%o6,	%i7
	tcs	%xcc,	0x0
	orn	%i1,	%o2,	%i2
	movrlz	%l6,	%l0,	%g3
	fcmpeq32	%f12,	%f20,	%i4
	stbar
	array8	%l1,	%o1,	%l3
	edge32ln	%g4,	%i6,	%g1
	tcc	%xcc,	0x4
	fmuld8sux16	%f6,	%f17,	%f30
	brgez,a	%g2,	loop_1226
	sllx	%o4,	%l2,	%g7
	fsrc2s	%f11,	%f4
	xnor	%i0,	0x014D,	%i3
loop_1226:
	ldsh	[%l7 + 0x48],	%l4
	or	%o0,	%o5,	%l5
	popc	%g6,	%o7
	fmovdle	%xcc,	%f21,	%f0
	wr	%g0,	0x2b,	%asi
	stxa	%o3,	[%l7 + 0x40] %asi
	membar	#Sync
	alignaddr	%i5,	%g5,	%o6
	andncc	%i1,	%o2,	%i2
	movvc	%icc,	%l6,	%i7
	edge32n	%g3,	%l0,	%l1
	edge16	%o1,	%i4,	%g4
	fpsub16s	%f17,	%f20,	%f24
	fbne,a	%fcc3,	loop_1227
	fbo	%fcc3,	loop_1228
	ba,a	loop_1229
	movg	%icc,	%l3,	%g1
loop_1227:
	xnor	%i6,	%g2,	%l2
loop_1228:
	fone	%f4
loop_1229:
	movrne	%o4,	%g7,	%i3
	fcmple16	%f12,	%f26,	%l4
	sir	0x04CB
	brnz,a	%i0,	loop_1230
	fzero	%f24
	set	0x2C, %o7
	lda	[%l7 + %o7] 0x04,	%f6
loop_1230:
	fmovs	%f24,	%f2
	tsubcctv	%o0,	%l5,	%o5
	subccc	%o7,	0x03C2,	%o3
	movgu	%icc,	%g6,	%g5
	call	loop_1231
	tl	%xcc,	0x7
	fnegd	%f26,	%f8
	movn	%icc,	%i5,	%i1
loop_1231:
	fmovd	%f24,	%f2
	edge32l	%o6,	%i2,	%l6
	edge16	%i7,	%g3,	%o2
	sllx	%l1,	%l0,	%i4
	fbue	%fcc2,	loop_1232
	bne,a,pt	%icc,	loop_1233
	tvc	%icc,	0x1
	andncc	%o1,	%g4,	%l3
loop_1232:
	andncc	%i6,	%g2,	%l2
loop_1233:
	xor	%o4,	0x1F12,	%g7
	movcs	%icc,	%g1,	%l4
	sdivcc	%i3,	0x016A,	%i0
	fbo	%fcc0,	loop_1234
	stb	%o0,	[%l7 + 0x2D]
	call	loop_1235
	sdivx	%l5,	0x1F8D,	%o5
loop_1234:
	edge16l	%o3,	%o7,	%g6
	bleu	loop_1236
loop_1235:
	edge8ln	%i5,	%i1,	%o6
	movcs	%icc,	%g5,	%i2
	bn,pn	%xcc,	loop_1237
loop_1236:
	nop
	set	0x64, %i4
	lduw	[%l7 + %i4],	%i7
	fmul8x16au	%f15,	%f11,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1237:
	nop
	setx loop_1238, %l0, %l1
	jmpl %l1, %g3
	edge16ln	%o2,	%l6,	%l1
	sub	%l0,	%i4,	%g4
	ble,a,pt	%icc,	loop_1239
loop_1238:
	orn	%l3,	0x143D,	%o1
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1239:
	fmovrslez	%i6,	%f19,	%f24
	fpsub32s	%f30,	%f14,	%f30
	movcc	%icc,	%l2,	%o4
	array16	%g2,	%g7,	%g1
	xnorcc	%l4,	%i3,	%o0
	sir	0x1EFA
	tge	%icc,	0x5
	fpsub16	%f22,	%f10,	%f22
	fcmpne16	%f12,	%f16,	%l5
	tn	%icc,	0x2
	edge16ln	%o5,	%o3,	%o7
	xor	%i0,	0x0817,	%g6
	te	%xcc,	0x5
	movvs	%xcc,	%i1,	%i5
	call	loop_1240
	orn	%g5,	%i2,	%i7
	bneg	loop_1241
	fbne	%fcc3,	loop_1242
loop_1240:
	tg	%icc,	0x1
	fmul8x16al	%f11,	%f24,	%f0
loop_1241:
	nop
	set	0x74, %o2
	ldsh	[%l7 + %o2],	%g3
loop_1242:
	subcc	%o6,	0x1F60,	%o2
	tn	%xcc,	0x6
	tneg	%xcc,	0x7
	fbn	%fcc0,	loop_1243
	addcc	%l1,	%l6,	%l0
	fpadd16s	%f22,	%f20,	%f17
	popc	0x0B77,	%g4
loop_1243:
	tsubcctv	%i4,	%o1,	%l3
	ldd	[%l7 + 0x30],	%l2
	tne	%xcc,	0x4
	fmovdneg	%icc,	%f21,	%f7
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%o4
	tgu	%xcc,	0x7
	brgz	%i6,	loop_1244
	fcmpgt16	%f26,	%f22,	%g2
	movrgez	%g1,	0x27D,	%g7
	tvs	%xcc,	0x5
loop_1244:
	alignaddr	%l4,	%i3,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l5,	0x0F,	%o3
	subc	%o5,	0x101F,	%i0
	edge32	%g6,	%o7,	%i1
	nop
	set	0x58, %g4
	std	%f14,	[%l7 + %g4]
	tcs	%xcc,	0x3
	fmovdpos	%icc,	%f30,	%f20
	brlz	%g5,	loop_1245
	orncc	%i5,	%i2,	%i7
	wr	%g0,	0x88,	%asi
	stba	%o6,	[%l7 + 0x3B] %asi
loop_1245:
	ldsw	[%l7 + 0x60],	%o2
	tvs	%icc,	0x2
	movrne	%g3,	0x2C2,	%l1
	movvc	%icc,	%l6,	%g4
	tle	%icc,	0x3
	umulcc	%i4,	%o1,	%l3
	tvc	%xcc,	0x5
	nop
	setx	0x6396B86F530893FF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x47922CD364028E57,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f26,	%f22
	andn	%l2,	%l0,	%i6
	array32	%g2,	%o4,	%g7
	tge	%xcc,	0x0
	fpadd32	%f2,	%f16,	%f2
	orcc	%g1,	0x0067,	%l4
	nop
	fitos	%f6,	%f21
	fstox	%f21,	%f6
	fxtos	%f6,	%f26
	fornot1s	%f11,	%f19,	%f24
	fbe	%fcc2,	loop_1246
	umul	%i3,	0x182C,	%l5
	subcc	%o3,	0x07C2,	%o5
	array8	%i0,	%o0,	%o7
loop_1246:
	fandnot1	%f16,	%f10,	%f26
	fnegd	%f22,	%f12
	subccc	%g6,	%g5,	%i1
	orncc	%i5,	%i7,	%i2
	or	%o6,	0x17C9,	%o2
	ldd	[%l7 + 0x50],	%f26
	edge32l	%g3,	%l1,	%l6
	edge16	%i4,	%g4,	%l3
	movre	%l2,	0x0C4,	%l0
	ba,a	loop_1247
	taddcc	%o1,	0x0B62,	%i6
	swap	[%l7 + 0x54],	%o4
	set	0x5C, %i1
	sta	%f20,	[%l7 + %i1] 0x80
loop_1247:
	mova	%xcc,	%g7,	%g2
	addcc	%g1,	%i3,	%l5
	array16	%l4,	%o5,	%i0
	bvs,a	loop_1248
	tge	%icc,	0x6
	udiv	%o3,	0x126B,	%o7
	udiv	%o0,	0x1696,	%g6
loop_1248:
	bpos,a	loop_1249
	tgu	%xcc,	0x7
	tl	%xcc,	0x5
	flush	%l7 + 0x34
loop_1249:
	sllx	%g5,	0x13,	%i1
	tn	%icc,	0x4
	bn	%xcc,	loop_1250
	fmovdleu	%icc,	%f3,	%f3
	movle	%icc,	%i5,	%i7
	fmovsa	%xcc,	%f15,	%f2
loop_1250:
	array32	%o6,	%i2,	%o2
	bneg	loop_1251
	fmul8x16al	%f27,	%f22,	%f2
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%l1
loop_1251:
	andncc	%g3,	%i4,	%l6
	sllx	%g4,	%l2,	%l0
	movre	%o1,	%i6,	%o4
	sdivx	%l3,	0x0CD2,	%g2
	sdivx	%g1,	0x1A2A,	%g7
	edge32l	%l5,	%l4,	%i3
	sub	%o5,	0x0FA2,	%i0
	array32	%o3,	%o7,	%o0
	ld	[%l7 + 0x60],	%f22
	tgu	%icc,	0x1
	orncc	%g6,	%g5,	%i1
	movne	%icc,	%i5,	%o6
	movneg	%xcc,	%i7,	%i2
	edge32	%l1,	%o2,	%i4
	tcc	%xcc,	0x1
	sll	%g3,	%l6,	%g4
	tcs	%icc,	0x7
	tl	%icc,	0x1
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x34] %asi,	%l2
	umulcc	%l0,	%o1,	%o4
	movre	%l3,	0x25E,	%i6
	add	%g2,	0x04D1,	%g1
	edge32n	%g7,	%l4,	%i3
	brlz	%o5,	loop_1252
	edge8	%i0,	%o3,	%o7
	ta	%xcc,	0x6
	fble,a	%fcc1,	loop_1253
loop_1252:
	fbn,a	%fcc3,	loop_1254
	nop
	setx	0x6C395DC9C4196BF1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f18
	ta	%xcc,	0x1
loop_1253:
	fmovrse	%o0,	%f28,	%f14
loop_1254:
	fble,a	%fcc1,	loop_1255
	andncc	%g6,	%l5,	%i1
	edge16	%i5,	%o6,	%i7
	fxnor	%f14,	%f18,	%f12
loop_1255:
	movg	%xcc,	%i2,	%g5
	subccc	%o2,	%l1,	%g3
	bne,a,pt	%xcc,	loop_1256
	fble	%fcc0,	loop_1257
	orcc	%l6,	0x0C9E,	%g4
	subccc	%i4,	%l2,	%l0
loop_1256:
	fmovdn	%xcc,	%f10,	%f5
loop_1257:
	bge,a,pn	%icc,	loop_1258
	movre	%o1,	%l3,	%i6
	movcc	%xcc,	%g2,	%o4
	fmovdge	%xcc,	%f2,	%f5
loop_1258:
	ldd	[%l7 + 0x28],	%g6
	array32	%l4,	%g1,	%o5
	move	%xcc,	%i3,	%o3
	ble,a,pn	%xcc,	loop_1259
	movn	%xcc,	%i0,	%o7
	tleu	%icc,	0x6
	fmovsle	%icc,	%f9,	%f19
loop_1259:
	addccc	%g6,	0x0F2A,	%o0
	ta	%xcc,	0x3
	fmovdvc	%xcc,	%f19,	%f18
	subcc	%l5,	0x18EB,	%i1
	nop
	setx	0x5C88D8F469154D7E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x76F4771DF4876F53,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f6,	%f30
	edge16	%o6,	%i7,	%i5
	smul	%g5,	0x1DF1,	%o2
	tg	%xcc,	0x0
	tvc	%xcc,	0x3
	tsubcctv	%l1,	0x0148,	%i2
	edge8n	%l6,	%g3,	%i4
	edge32	%l2,	%g4,	%l0
	prefetch	[%l7 + 0x78],	 0x1
	fmul8x16	%f19,	%f20,	%f24
	array16	%l3,	%o1,	%i6
	bcs,a,pt	%xcc,	loop_1260
	movgu	%icc,	%o4,	%g7
	brz,a	%l4,	loop_1261
	umul	%g1,	0x0D97,	%o5
loop_1260:
	fornot1s	%f14,	%f24,	%f4
	movneg	%xcc,	%g2,	%o3
loop_1261:
	array8	%i0,	%i3,	%o7
	edge32n	%g6,	%l5,	%o0
	bl	%icc,	loop_1262
	sra	%o6,	0x11,	%i1
	sdivcc	%i5,	0x1D10,	%i7
	movrne	%o2,	%l1,	%g5
loop_1262:
	andcc	%i2,	%l6,	%g3
	fmovsgu	%icc,	%f14,	%f23
	fcmple32	%f16,	%f20,	%l2
	tleu	%xcc,	0x0
	movleu	%icc,	%g4,	%i4
	xnor	%l0,	%l3,	%i6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%o1
	sdiv	%l4,	0x040C,	%g7
	movne	%icc,	%o5,	%g2
	te	%xcc,	0x7
	edge8	%o3,	%i0,	%i3
	fpadd16s	%f1,	%f2,	%f9
	tcs	%icc,	0x3
	fbg	%fcc0,	loop_1263
	popc	0x053F,	%o7
	alignaddr	%g1,	%l5,	%o0
	move	%xcc,	%o6,	%g6
loop_1263:
	mulx	%i5,	0x1DF2,	%i7
	mova	%icc,	%o2,	%l1
	fmovsne	%xcc,	%f29,	%f0
	tne	%icc,	0x5
	tn	%icc,	0x3
	mulx	%g5,	0x1CF3,	%i1
	fbue	%fcc3,	loop_1264
	array32	%l6,	%i2,	%g3
	fnor	%f20,	%f2,	%f14
	subc	%g4,	%i4,	%l0
loop_1264:
	tvc	%xcc,	0x4
	subccc	%l3,	0x02A9,	%l2
	edge8ln	%o4,	%i6,	%o1
	udivx	%g7,	0x1315,	%l4
	fbug,a	%fcc3,	loop_1265
	sdivx	%g2,	0x07C7,	%o5
	movvc	%icc,	%o3,	%i3
	orncc	%o7,	%i0,	%l5
loop_1265:
	udiv	%o0,	0x0177,	%o6
	udiv	%g6,	0x1451,	%i5
	addccc	%g1,	%i7,	%o2
	fmovrdlez	%g5,	%f2,	%f6
	stbar
	edge16ln	%i1,	%l1,	%l6
	udivcc	%i2,	0x0EC6,	%g4
	movle	%xcc,	%i4,	%l0
	fbul,a	%fcc0,	loop_1266
	tn	%xcc,	0x5
	fmovs	%f27,	%f19
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1266:
	fmul8sux16	%f24,	%f12,	%f20
	fpackfix	%f28,	%f13
	movrgz	%l3,	0x124,	%l2
	move	%xcc,	%g3,	%o4
	fbne	%fcc0,	loop_1267
	move	%icc,	%i6,	%g7
	movrgz	%o1,	%g2,	%l4
	lduh	[%l7 + 0x3E],	%o3
loop_1267:
	srlx	%i3,	0x1E,	%o5
	edge16	%i0,	%l5,	%o7
	sethi	0x1FF4,	%o6
	xor	%g6,	%o0,	%i5
	fmul8x16	%f5,	%f14,	%f26
	stw	%i7,	[%l7 + 0x2C]
	te	%xcc,	0x1
	movre	%g1,	%g5,	%o2
	orcc	%i1,	0x14DD,	%l6
	alignaddr	%i2,	%l1,	%i4
	fpsub32s	%f15,	%f23,	%f26
	fmovrde	%g4,	%f0,	%f16
	tgu	%xcc,	0x3
	alignaddr	%l0,	%l3,	%g3
	tsubcc	%o4,	0x1B18,	%l2
	fmovspos	%icc,	%f17,	%f10
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%g7
	edge32n	%i6,	%g2,	%o1
	nop
	fitos	%f8,	%f1
	fstox	%f1,	%f2
	fxtos	%f2,	%f21
	orcc	%l4,	0x10AA,	%i3
	edge8l	%o5,	%i0,	%o3
	edge16ln	%l5,	%o6,	%o7
	ld	[%l7 + 0x74],	%f21
	tvs	%icc,	0x4
	fmovsl	%icc,	%f17,	%f9
	movcs	%xcc,	%o0,	%g6
	addc	%i7,	%i5,	%g5
	sdivx	%g1,	0x000B,	%i1
	fsrc2	%f24,	%f4
	taddcctv	%l6,	%o2,	%i2
	tvc	%xcc,	0x2
	mulscc	%i4,	%l1,	%g4
	movneg	%icc,	%l3,	%g3
	nop
	setx	0xD7F055EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xBB6691EB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f24,	%f12
	movrgez	%l0,	%l2,	%o4
	nop
	fitod	%f25,	%f2
	ldsh	[%l7 + 0x5E],	%g7
	udivx	%i6,	0x197B,	%g2
	srax	%l4,	%i3,	%o5
	swap	[%l7 + 0x1C],	%i0
	fbg	%fcc1,	loop_1268
	xnor	%o3,	%l5,	%o1
	mulx	%o6,	0x143D,	%o0
	add	%g6,	%o7,	%i5
loop_1268:
	fmovdcc	%icc,	%f25,	%f11
	fxnors	%f20,	%f7,	%f4
	sll	%g5,	0x08,	%i7
	tn	%xcc,	0x7
	fones	%f19
	movpos	%xcc,	%i1,	%g1
	subc	%o2,	%i2,	%i4
	smulcc	%l1,	0x15E1,	%l6
	movne	%xcc,	%g4,	%l3
	array8	%l0,	%g3,	%o4
	fmuld8ulx16	%f21,	%f19,	%f26
	edge16n	%g7,	%l2,	%g2
	tneg	%xcc,	0x0
	sra	%i6,	%i3,	%o5
	udivx	%l4,	0x124A,	%o3
	set	0x20, %g7
	ldda	[%l7 + %g7] 0x04,	%l4
	nop
	fitod	%f2,	%f24
	fdtoi	%f24,	%f6
	faligndata	%f26,	%f16,	%f20
	movn	%icc,	%i0,	%o6
	fmul8sux16	%f30,	%f10,	%f22
	bvs,a	%icc,	loop_1269
	tpos	%xcc,	0x0
	tsubcctv	%o0,	0x1346,	%o1
	movle	%xcc,	%g6,	%o7
loop_1269:
	stw	%g5,	[%l7 + 0x14]
	bn,a	loop_1270
	andncc	%i7,	%i1,	%g1
	mova	%xcc,	%i5,	%o2
	orncc	%i2,	0x1857,	%l1
loop_1270:
	movrgez	%l6,	0x0CB,	%i4
	fmovdgu	%icc,	%f29,	%f28
	taddcc	%l3,	%l0,	%g3
	mulx	%g4,	0x0CDF,	%o4
	set	0x39, %i2
	ldsba	[%l7 + %i2] 0x10,	%g7
	sethi	0x06A9,	%g2
	edge8l	%i6,	%l2,	%o5
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x15,	%f0
	tcc	%xcc,	0x1
	array16	%i3,	%o3,	%l4
	tpos	%xcc,	0x2
	movn	%xcc,	%i0,	%o6
	bleu,a	loop_1271
	fmovrdgez	%l5,	%f18,	%f12
	set	0x7C, %l0
	ldswa	[%l7 + %l0] 0x11,	%o0
loop_1271:
	move	%xcc,	%g6,	%o1
	fba,a	%fcc3,	loop_1272
	fbue,a	%fcc0,	loop_1273
	fmovsge	%xcc,	%f20,	%f31
	alignaddr	%g5,	%o7,	%i7
loop_1272:
	fbl	%fcc2,	loop_1274
loop_1273:
	movrne	%g1,	0x0BF,	%i1
	ldd	[%l7 + 0x48],	%i4
	sllx	%i2,	%o2,	%l1
loop_1274:
	xor	%l6,	0x1087,	%l3
	srax	%l0,	0x09,	%g3
	popc	0x0838,	%i4
	fmovsn	%icc,	%f14,	%f21
	nop
	setx	0xC77D613D320F2A38,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f24
	fnot1s	%f12,	%f27
	movgu	%icc,	%o4,	%g7
	fmovse	%icc,	%f17,	%f15
	fnors	%f14,	%f22,	%f23
	movre	%g4,	%g2,	%i6
	fands	%f30,	%f3,	%f26
	fmul8x16al	%f26,	%f27,	%f18
	fbul	%fcc3,	loop_1275
	swap	[%l7 + 0x44],	%l2
	tneg	%icc,	0x7
	srax	%i3,	0x12,	%o3
loop_1275:
	lduw	[%l7 + 0x64],	%l4
	movle	%icc,	%i0,	%o6
	movre	%l5,	%o0,	%g6
	wr	%g0,	0xea,	%asi
	stxa	%o1,	[%l7 + 0x38] %asi
	membar	#Sync
	andn	%o5,	%g5,	%o7
	movleu	%xcc,	%i7,	%i1
	tge	%xcc,	0x3
	srax	%g1,	0x0E,	%i5
	fmovde	%xcc,	%f1,	%f27
	mulx	%o2,	0x1DBC,	%i2
	movn	%xcc,	%l1,	%l6
	fbe,a	%fcc3,	loop_1276
	array32	%l0,	%g3,	%i4
	movleu	%xcc,	%l3,	%o4
	bvc	%icc,	loop_1277
loop_1276:
	sdivcc	%g7,	0x1DBC,	%g2
	tleu	%xcc,	0x3
	taddcctv	%i6,	%g4,	%i3
loop_1277:
	nop
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%l2
	edge32	%l4,	%o3,	%o6
	fbn	%fcc2,	loop_1278
	xnorcc	%l5,	0x0183,	%i0
	nop
	fitos	%f1,	%f17
	fstox	%f17,	%f20
	fxtos	%f20,	%f29
	wr	%g0,	0x19,	%asi
	stba	%g6,	[%l7 + 0x71] %asi
loop_1278:
	fbu,a	%fcc2,	loop_1279
	bg	%xcc,	loop_1280
	taddcctv	%o0,	0x00A1,	%o1
	andncc	%g5,	%o5,	%i7
loop_1279:
	edge16	%i1,	%o7,	%i5
loop_1280:
	fmul8sux16	%f10,	%f4,	%f20
	nop
	setx	0x8B32A77A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xA53753F4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f12,	%f5
	edge8ln	%g1,	%i2,	%o2
	edge32	%l1,	%l6,	%g3
	sth	%l0,	[%l7 + 0x46]
	fmovscc	%icc,	%f17,	%f11
	umulcc	%i4,	0x1DC1,	%l3
	sethi	0x10FD,	%g7
	edge32n	%g2,	%o4,	%g4
	addcc	%i6,	0x048D,	%l2
	udivcc	%i3,	0x0784,	%l4
	be	%xcc,	loop_1281
	nop
	set	0x09, %l5
	ldsb	[%l7 + %l5],	%o3
	sllx	%o6,	%i0,	%g6
	xnor	%l5,	%o0,	%g5
loop_1281:
	subc	%o5,	0x1DDF,	%i7
	orn	%o1,	%i1,	%o7
	fbu	%fcc1,	loop_1282
	lduh	[%l7 + 0x54],	%g1
	subccc	%i2,	%o2,	%i5
	movg	%xcc,	%l6,	%l1
loop_1282:
	and	%g3,	%i4,	%l0
	membar	0x2F
	fpack16	%f26,	%f11
	set	0x60, %l3
	stxa	%l3,	[%l7 + %l3] 0x10
	fxors	%f31,	%f28,	%f31
	tsubcctv	%g7,	%o4,	%g2
	movre	%g4,	0x0B7,	%i6
	popc	0x1973,	%l2
	taddcc	%i3,	%l4,	%o3
	tvs	%icc,	0x6
	bgu,a	%xcc,	loop_1283
	xorcc	%i0,	%g6,	%o6
	fbo	%fcc3,	loop_1284
	orcc	%l5,	%o0,	%g5
loop_1283:
	xnorcc	%i7,	0x1F18,	%o5
	bvc,pn	%xcc,	loop_1285
loop_1284:
	edge32n	%i1,	%o1,	%o7
	ldx	[%l7 + 0x10],	%g1
	movle	%xcc,	%o2,	%i5
loop_1285:
	ble,pt	%xcc,	loop_1286
	fmovrdlz	%i2,	%f8,	%f22
	udivx	%l1,	0x1B27,	%g3
	alignaddrl	%l6,	%l0,	%i4
loop_1286:
	te	%xcc,	0x5
	fands	%f8,	%f10,	%f30
	wr	%g0,	0x10,	%asi
	sta	%f4,	[%l7 + 0x38] %asi
	nop
	setx	0x95D07C15,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x8BB7E485,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f19,	%f11
	tcc	%xcc,	0x0
	addcc	%g7,	%l3,	%o4
	tgu	%xcc,	0x7
	nop
	setx	0x00635610,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	smul	%g4,	0x0ED7,	%g2
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x75] %asi,	%i6
	fbul	%fcc3,	loop_1287
	fbuge	%fcc1,	loop_1288
	fmovdcs	%icc,	%f0,	%f17
	move	%icc,	%i3,	%l4
loop_1287:
	bgu,a	loop_1289
loop_1288:
	array16	%o3,	%i0,	%g6
	nop
	setx	0x95FDC8891066B6F8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	tneg	%icc,	0x5
loop_1289:
	nop
	setx	0x806EB113,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	nop
	setx	0x06F3E3C9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f31
	movrgz	%o6,	%l5,	%l2
	edge16ln	%g5,	%i7,	%o0
	bshuffle	%f20,	%f18,	%f12
	fmovsl	%icc,	%f15,	%f16
	movleu	%icc,	%o5,	%o1
	fmovdl	%icc,	%f25,	%f20
	lduh	[%l7 + 0x74],	%o7
	mulscc	%g1,	0x064C,	%o2
	swap	[%l7 + 0x2C],	%i5
	fmovsl	%icc,	%f28,	%f24
	mulscc	%i1,	%l1,	%i2
	movleu	%icc,	%g3,	%l0
	fsrc1	%f26,	%f12
	nop
	setx	loop_1290,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16n	%l6,	%g7,	%l3
	sdivx	%i4,	0x1103,	%o4
	popc	0x1FE1,	%g2
loop_1290:
	nop
	setx	0xA48991914A68D787,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x19AA92269848283C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f0,	%f2
	tneg	%icc,	0x0
	tsubcc	%g4,	%i3,	%l4
	set	0x39, %g1
	stba	%o3,	[%l7 + %g1] 0xe2
	membar	#Sync
	sdivcc	%i6,	0x1C3A,	%g6
	srax	%o6,	%l5,	%i0
	be,a,pt	%xcc,	loop_1291
	tsubcctv	%l2,	%i7,	%g5
	fxors	%f27,	%f23,	%f3
	ldx	[%l7 + 0x18],	%o5
loop_1291:
	sub	%o0,	%o7,	%g1
	bpos,a	%icc,	loop_1292
	fnegd	%f2,	%f18
	edge32ln	%o1,	%o2,	%i1
	nop
	setx	0x2E018B608BFCF96E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x781D5C54E33E6B43,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f12,	%f26
loop_1292:
	alignaddr	%l1,	%i5,	%i2
	tcs	%icc,	0x5
	fmovd	%f4,	%f12
	flush	%l7 + 0x70
	orn	%g3,	0x1E67,	%l6
	faligndata	%f2,	%f26,	%f22
	movcs	%icc,	%l0,	%g7
	movg	%xcc,	%i4,	%o4
	stw	%g2,	[%l7 + 0x3C]
	brlz,a	%g4,	loop_1293
	tcc	%icc,	0x4
	stb	%i3,	[%l7 + 0x68]
	movgu	%xcc,	%l4,	%o3
loop_1293:
	fpadd16	%f8,	%f22,	%f18
	tle	%xcc,	0x4
	bpos,pt	%xcc,	loop_1294
	movrne	%i6,	0x293,	%g6
	fcmpeq32	%f18,	%f20,	%l3
	movgu	%xcc,	%l5,	%i0
loop_1294:
	st	%f6,	[%l7 + 0x6C]
	membar	0x6C
	fnand	%f22,	%f12,	%f0
	for	%f12,	%f22,	%f12
	bneg,a,pn	%icc,	loop_1295
	nop
	setx	0x1BC268A3B6F620D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f26
	nop
	fitos	%f2,	%f6
	fstox	%f6,	%f8
	andcc	%l2,	0x10EC,	%o6
loop_1295:
	tpos	%xcc,	0x0
	fbug	%fcc2,	loop_1296
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,pn	%icc,	loop_1297
	srl	%g5,	%i7,	%o5
loop_1296:
	nop
	setx	0x68B33970,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f7
	movrne	%o0,	0x072,	%g1
loop_1297:
	nop
	set	0x4C, %l4
	lda	[%l7 + %l4] 0x10,	%f19
	bg	%icc,	loop_1298
	fmovrdlz	%o1,	%f26,	%f18
	xnor	%o7,	%i1,	%l1
	lduw	[%l7 + 0x60],	%i5
loop_1298:
	fba,a	%fcc3,	loop_1299
	xnorcc	%o2,	%g3,	%l6
	movne	%icc,	%l0,	%g7
	set	0x54, %o4
	ldsha	[%l7 + %o4] 0x18,	%i4
loop_1299:
	fmul8x16	%f30,	%f18,	%f24
	sth	%i2,	[%l7 + 0x60]
	tge	%icc,	0x7
	taddcctv	%o4,	%g2,	%i3
	lduh	[%l7 + 0x36],	%l4
	movvs	%icc,	%o3,	%i6
	ldsh	[%l7 + 0x76],	%g6
	fmovde	%xcc,	%f20,	%f27
	nop
	fitod	%f0,	%f26
	fdtos	%f26,	%f0
	fmul8x16	%f10,	%f26,	%f26
	std	%f12,	[%l7 + 0x58]
	fmovdvc	%xcc,	%f4,	%f14
	movre	%g4,	%l5,	%l3
	fnands	%f28,	%f0,	%f19
	fmovsleu	%icc,	%f14,	%f23
	bpos,pt	%xcc,	loop_1300
	umul	%i0,	%o6,	%g5
	addcc	%i7,	%l2,	%o5
	movn	%xcc,	%o0,	%o1
loop_1300:
	fbu,a	%fcc3,	loop_1301
	movcc	%xcc,	%o7,	%i1
	fmovs	%f3,	%f16
	udiv	%g1,	0x1013,	%i5
loop_1301:
	fpsub16s	%f28,	%f20,	%f31
	sdivcc	%o2,	0x1119,	%g3
	edge32l	%l6,	%l1,	%l0
	edge8n	%i4,	%i2,	%g7
	addc	%g2,	%i3,	%l4
	xorcc	%o3,	0x0D63,	%o4
	tleu	%icc,	0x0
	ldstub	[%l7 + 0x17],	%i6
	nop
	setx	0x35CD2D694050F39A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	mulscc	%g4,	0x1363,	%g6
	fmul8x16al	%f24,	%f24,	%f0
	edge16ln	%l3,	%l5,	%i0
	fmul8sux16	%f26,	%f26,	%f0
	popc	0x0039,	%o6
	fandnot1	%f20,	%f12,	%f16
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%i7
	taddcctv	%l2,	%g5,	%o0
	orn	%o1,	%o5,	%o7
	fmovscc	%icc,	%f29,	%f20
	smul	%g1,	%i5,	%o2
	fmovdcs	%icc,	%f29,	%f16
	bcc,pt	%icc,	loop_1302
	sir	0x1E29
	bvs,pt	%xcc,	loop_1303
	add	%g3,	%i1,	%l1
loop_1302:
	alignaddr	%l6,	%i4,	%i2
	wr	%g0,	0x23,	%asi
	stwa	%l0,	[%l7 + 0x70] %asi
	membar	#Sync
loop_1303:
	orn	%g2,	%g7,	%i3
	fandnot1s	%f9,	%f27,	%f27
	nop
	fitod	%f8,	%f2
	fdtox	%f2,	%f30
	orncc	%o3,	%l4,	%o4
	nop
	setx	loop_1304,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32l	%i6,	%g6,	%l3
	wr	%g0,	0x0c,	%asi
	sta	%f0,	[%l7 + 0x1C] %asi
loop_1304:
	edge32l	%l5,	%g4,	%o6
	subcc	%i0,	%i7,	%g5
	movge	%icc,	%l2,	%o0
	edge16ln	%o5,	%o7,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o1,	%i5
	taddcctv	%g3,	%o2,	%l1
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l6
	sllx	%i1,	%i4,	%l0
	fmul8x16al	%f1,	%f28,	%f26
	and	%i2,	%g7,	%i3
	orcc	%g2,	0x134F,	%o3
	movl	%icc,	%l4,	%i6
	bge,a	%icc,	loop_1305
	movl	%icc,	%g6,	%l3
	fpsub16s	%f31,	%f31,	%f20
	xor	%l5,	0x0CB0,	%o4
loop_1305:
	fmovse	%icc,	%f10,	%f1
	mulscc	%g4,	%i0,	%o6
	umul	%g5,	0x0DA6,	%l2
	stb	%o0,	[%l7 + 0x7B]
	movrlez	%i7,	%o5,	%o7
	movrgz	%o1,	%g1,	%g3
	movre	%i5,	%l1,	%o2
	edge8l	%i1,	%l6,	%l0
	andncc	%i4,	%g7,	%i3
	movle	%xcc,	%g2,	%i2
	stb	%l4,	[%l7 + 0x11]
	array8	%i6,	%g6,	%o3
	fpsub16s	%f4,	%f17,	%f31
	addccc	%l5,	0x15B5,	%l3
	ldsb	[%l7 + 0x79],	%o4
	fmovdpos	%icc,	%f13,	%f1
	or	%g4,	0x061D,	%o6
	nop
	setx loop_1306, %l0, %l1
	jmpl %l1, %g5
	movcs	%icc,	%i0,	%l2
	fxnors	%f2,	%f21,	%f24
	tsubcctv	%i7,	0x18E9,	%o5
loop_1306:
	tl	%xcc,	0x2
	fbu	%fcc2,	loop_1307
	array32	%o7,	%o1,	%o0
	movvs	%icc,	%g1,	%g3
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x40] %asi,	%i5
loop_1307:
	tl	%xcc,	0x3
	movl	%xcc,	%l1,	%o2
	subcc	%i1,	0x0D62,	%l6
	fnegd	%f2,	%f18
	sdivcc	%i4,	0x003E,	%l0
	nop
	setx	0xCC8ACD06D237683C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xB18E72D508CB6C4D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f20,	%f8
	ba	loop_1308
	fsrc2	%f10,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%g7,	%i3,	%g2
loop_1308:
	fone	%f4
	udiv	%l4,	0x1055,	%i6
	movl	%xcc,	%i2,	%g6
	ld	[%l7 + 0x74],	%f10
	edge8	%l5,	%l3,	%o4
	nop
	setx	0x315B0796,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x49955342,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f21,	%f22
	sdivx	%g4,	0x1EA7,	%o6
	fmovse	%icc,	%f6,	%f25
	fbne	%fcc1,	loop_1309
	orcc	%g5,	%i0,	%o3
	subc	%i7,	0x1622,	%l2
	popc	0x042E,	%o5
loop_1309:
	fbule	%fcc1,	loop_1310
	edge32n	%o1,	%o0,	%o7
	fcmpne16	%f0,	%f2,	%g1
	movrlz	%i5,	%l1,	%o2
loop_1310:
	nop
	setx loop_1311, %l0, %l1
	jmpl %l1, %g3
	movrlz	%i1,	0x2A4,	%i4
	flush	%l7 + 0x54
	movl	%xcc,	%l6,	%g7
loop_1311:
	addc	%i3,	%g2,	%l0
	movl	%icc,	%i6,	%i2
	orcc	%l4,	%l5,	%l3
	prefetch	[%l7 + 0x20],	 0x3
	bcc,a	loop_1312
	bshuffle	%f10,	%f12,	%f0
	andcc	%g6,	0x147B,	%o4
	movpos	%xcc,	%g4,	%o6
loop_1312:
	mova	%icc,	%i0,	%o3
	fbue	%fcc1,	loop_1313
	smulcc	%g5,	0x1935,	%l2
	fandnot2s	%f3,	%f17,	%f24
	brlez,a	%o5,	loop_1314
loop_1313:
	tsubcctv	%o1,	0x1729,	%i7
	brz	%o7,	loop_1315
	alignaddr	%g1,	%o0,	%l1
loop_1314:
	fbge,a	%fcc1,	loop_1316
	sir	0x1F17
loop_1315:
	movrlez	%o2,	0x2CA,	%g3
	add	%i5,	%i1,	%l6
loop_1316:
	edge32n	%g7,	%i4,	%i3
	bn	loop_1317
	edge16	%g2,	%i6,	%i2
	fble,a	%fcc0,	loop_1318
	fbn	%fcc3,	loop_1319
loop_1317:
	sdiv	%l4,	0x1D7D,	%l0
	tgu	%xcc,	0x5
loop_1318:
	addc	%l5,	%g6,	%l3
loop_1319:
	ldd	[%l7 + 0x78],	%f6
	ba,a,pn	%icc,	loop_1320
	srax	%o4,	0x10,	%g4
	add	%o6,	%o3,	%i0
	sdivcc	%g5,	0x0F3F,	%l2
loop_1320:
	fones	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o5,	0x0D27,	%o1
	edge32ln	%i7,	%g1,	%o0
	movcc	%xcc,	%o7,	%o2
	fmul8sux16	%f22,	%f6,	%f6
	sdivx	%l1,	0x0617,	%i5
	tleu	%icc,	0x1
	edge8	%g3,	%i1,	%l6
	membar	0x31
	addc	%i4,	0x1E63,	%i3
	xnor	%g2,	%g7,	%i2
	fmovdn	%icc,	%f31,	%f7
	move	%xcc,	%l4,	%l0
	set	0x50, %i6
	stwa	%i6,	[%l7 + %i6] 0x89
	tneg	%xcc,	0x4
	bg	%icc,	loop_1321
	te	%icc,	0x7
	bvc,a,pt	%icc,	loop_1322
	andncc	%g6,	%l3,	%o4
loop_1321:
	movrlz	%g4,	%o6,	%l5
	nop
	setx	0x30695EF0,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
loop_1322:
	move	%xcc,	%o3,	%g5
	andcc	%i0,	0x198B,	%l2
	addc	%o5,	0x079A,	%o1
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x0c
	bvs,a	loop_1323
	edge16	%g1,	%i7,	%o7
	mova	%xcc,	%o2,	%l1
	stw	%i5,	[%l7 + 0x10]
loop_1323:
	fpmerge	%f23,	%f29,	%f6
	movrgez	%g3,	%i1,	%l6
	brnz,a	%i4,	loop_1324
	tsubcc	%o0,	%i3,	%g7
	movn	%xcc,	%g2,	%i2
	mulscc	%l0,	0x0BB7,	%l4
loop_1324:
	fcmpne32	%f2,	%f22,	%g6
	fbe	%fcc3,	loop_1325
	udivcc	%l3,	0x1661,	%i6
	nop
	fitos	%f1,	%f21
	fstox	%f21,	%f28
	fxtos	%f28,	%f15
	tsubcc	%g4,	%o4,	%o6
loop_1325:
	fcmpeq16	%f12,	%f12,	%l5
	addccc	%g5,	%i0,	%l2
	xorcc	%o3,	0x0D30,	%o5
	umul	%g1,	0x053E,	%o1
	te	%icc,	0x3
	fmovsgu	%xcc,	%f15,	%f8
	orcc	%o7,	%o2,	%l1
	movvc	%icc,	%i5,	%i7
	movrgez	%g3,	0x05A,	%l6
	fpsub32	%f26,	%f12,	%f8
	umulcc	%i4,	%i1,	%o0
	fornot2	%f8,	%f20,	%f30
	movne	%xcc,	%i3,	%g2
	movleu	%xcc,	%g7,	%i2
	sub	%l4,	%g6,	%l0
	set	0x30, %i0
	ldswa	[%l7 + %i0] 0x10,	%l3
	andncc	%g4,	%o4,	%i6
	bneg,a	loop_1326
	xnor	%o6,	%g5,	%i0
	movgu	%xcc,	%l5,	%l2
	edge8	%o3,	%o5,	%o1
loop_1326:
	sllx	%g1,	0x0E,	%o7
	lduw	[%l7 + 0x10],	%l1
	fmovrdgz	%i5,	%f24,	%f22
	taddcctv	%o2,	%i7,	%l6
	te	%xcc,	0x1
	array32	%g3,	%i4,	%i1
	fmovsg	%xcc,	%f30,	%f24
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge8ln	%o0,	%g2,	%i3
	brgz,a	%g7,	loop_1327
	fnegs	%f1,	%f7
	smulcc	%i2,	0x015F,	%g6
	bvs,pn	%xcc,	loop_1328
loop_1327:
	bne,pn	%xcc,	loop_1329
	fmovrsne	%l4,	%f1,	%f3
	fornot2s	%f13,	%f21,	%f7
loop_1328:
	movre	%l3,	0x25F,	%l0
loop_1329:
	xnorcc	%o4,	0x1B8B,	%i6
	movn	%xcc,	%g4,	%g5
	fbue	%fcc2,	loop_1330
	mulx	%i0,	%l5,	%l2
	tsubcctv	%o3,	0x1E0A,	%o6
	srax	%o1,	0x0E,	%o5
loop_1330:
	tne	%xcc,	0x0
	movg	%xcc,	%o7,	%g1
	srax	%i5,	%l1,	%o2
	mulscc	%i7,	%l6,	%i4
	array16	%i1,	%g3,	%g2
	tneg	%icc,	0x3
	bne,a	loop_1331
	or	%o0,	%i3,	%i2
	alignaddrl	%g6,	%g7,	%l3
	fmul8ulx16	%f14,	%f30,	%f28
loop_1331:
	edge16	%l0,	%l4,	%i6
	fble,a	%fcc2,	loop_1332
	bgu,a	%icc,	loop_1333
	addc	%g4,	%g5,	%i0
	fnegs	%f13,	%f31
loop_1332:
	fcmpeq16	%f10,	%f24,	%l5
loop_1333:
	taddcc	%o4,	0x18A6,	%o3
	movrne	%o6,	0x0FE,	%o1
	array32	%l2,	%o7,	%o5
	fmovrde	%g1,	%f0,	%f8
	fmovdge	%icc,	%f8,	%f0
	udivcc	%l1,	0x101D,	%i5
	array16	%o2,	%l6,	%i7
	tl	%icc,	0x1
	fcmpeq16	%f14,	%f24,	%i1
	fpadd32s	%f7,	%f12,	%f31
	stbar
	fpadd16	%f18,	%f10,	%f8
	nop
	setx	loop_1334,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%g3,	%g2,	%o0
	andn	%i4,	0x0039,	%i2
	fmovrslez	%g6,	%f30,	%f7
loop_1334:
	bne,a,pn	%xcc,	loop_1335
	sllx	%i3,	%g7,	%l3
	tcs	%icc,	0x1
	taddcctv	%l0,	0x1A58,	%i6
loop_1335:
	srax	%g4,	0x0A,	%g5
	movre	%l4,	0x269,	%i0
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x4C] %asi,	%f26
	fbge	%fcc1,	loop_1336
	fmovrse	%o4,	%f13,	%f4
	subccc	%l5,	%o6,	%o3
	fbug,a	%fcc2,	loop_1337
loop_1336:
	orn	%o1,	0x1C5F,	%l2
	nop
	setx	0x5C19DDAC93AFA643,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xF72EDAE93320C774,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f12,	%f26
	fmuld8sux16	%f9,	%f31,	%f24
loop_1337:
	movneg	%xcc,	%o5,	%o7
	brlez	%g1,	loop_1338
	smulcc	%i5,	0x02DA,	%l1
	xnor	%l6,	%o2,	%i7
	fornot1	%f14,	%f4,	%f26
loop_1338:
	udivx	%i1,	0x1472,	%g3
	ble,pn	%xcc,	loop_1339
	addc	%g2,	0x1F82,	%i4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i2,	%o0
loop_1339:
	movre	%i3,	0x2A5,	%g6
	addc	%g7,	0x1878,	%l0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x1
	movneg	%icc,	%i6,	%g4
	andn	%l4,	%i0,	%o4
	fmovsn	%icc,	%f5,	%f6
	st	%f18,	[%l7 + 0x7C]
	sub	%l5,	%o6,	%g5
	movvc	%icc,	%o3,	%o1
	alignaddr	%l2,	%o5,	%o7
	bcs,a,pt	%xcc,	loop_1340
	tgu	%xcc,	0x6
	tcc	%xcc,	0x1
	mova	%icc,	%i5,	%l1
loop_1340:
	nop
	fitod	%f12,	%f28
	fdtos	%f28,	%f9
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%l6
	andn	%g1,	0x0AE2,	%o2
	tle	%icc,	0x7
	subccc	%i1,	0x1560,	%g3
	mulx	%g2,	0x063F,	%i7
	sra	%i4,	0x1F,	%i2
	movrlz	%o0,	%g6,	%i3
	orncc	%g7,	0x0BAC,	%l3
	fsrc2	%f28,	%f20
	mova	%xcc,	%l0,	%i6
	movrlez	%g4,	0x3F7,	%i0
	movleu	%icc,	%l4,	%l5
	fbue,a	%fcc0,	loop_1341
	xor	%o4,	0x0216,	%o6
	fbl,a	%fcc0,	loop_1342
	edge8n	%g5,	%o1,	%o3
loop_1341:
	tleu	%xcc,	0x1
	set	0x218, %o5
	stxa	%o5,	[%g0 + %o5] 0x52
loop_1342:
	nop
	fitod	%f0,	%f0
	fdtos	%f0,	%f30
	fmovde	%xcc,	%f24,	%f15
	fzero	%f22
	fsrc1	%f2,	%f18
	wr	%g0,	0x89,	%asi
	sta	%f10,	[%l7 + 0x5C] %asi
	umulcc	%o7,	%l2,	%l1
	udivx	%i5,	0x130C,	%g1
	brlez	%o2,	loop_1343
	andn	%l6,	0x189D,	%i1
	fmovdneg	%xcc,	%f24,	%f13
	fmul8x16	%f8,	%f18,	%f14
loop_1343:
	fba,a	%fcc0,	loop_1344
	sll	%g2,	0x12,	%g3
	bne,pn	%xcc,	loop_1345
	sll	%i7,	0x0D,	%i2
loop_1344:
	movcc	%icc,	%o0,	%i4
	ldd	[%l7 + 0x58],	%i2
loop_1345:
	umulcc	%g6,	%l3,	%l0
	popc	0x14DC,	%g7
	edge8n	%g4,	%i0,	%i6
	fcmpeq32	%f6,	%f30,	%l5
	set	0x74, %g5
	ldsba	[%l7 + %g5] 0x88,	%o4
	movg	%icc,	%o6,	%l4
	movcs	%icc,	%g5,	%o1
	tn	%icc,	0x6
	popc	0x1989,	%o3
	andn	%o5,	%o7,	%l2
	mulx	%l1,	%i5,	%o2
	udivx	%g1,	0x0EE6,	%i1
	udiv	%g2,	0x19FE,	%g3
	edge16	%l6,	%i7,	%o0
	movcs	%xcc,	%i4,	%i3
	sdiv	%i2,	0x048F,	%g6
	fbl,a	%fcc0,	loop_1346
	andncc	%l3,	%g7,	%g4
	movrne	%i0,	%i6,	%l0
	fmovrsgz	%l5,	%f28,	%f11
loop_1346:
	mulscc	%o4,	%o6,	%g5
	tvc	%icc,	0x0
	array8	%o1,	%l4,	%o3
	array16	%o7,	%l2,	%o5
	tne	%xcc,	0x7
	fpackfix	%f10,	%f10
	set	0x2C, %o3
	swapa	[%l7 + %o3] 0x0c,	%l1
	bpos	loop_1347
	movvc	%xcc,	%i5,	%o2
	orn	%g1,	0x05F8,	%i1
	fble,a	%fcc0,	loop_1348
loop_1347:
	bge,pt	%xcc,	loop_1349
	smul	%g2,	%g3,	%i7
	movcc	%icc,	%o0,	%i4
loop_1348:
	fmovdleu	%xcc,	%f3,	%f0
loop_1349:
	andcc	%l6,	%i3,	%i2
	fpack16	%f4,	%f28
	ldsb	[%l7 + 0x74],	%g6
	sethi	0x096B,	%g7
	tpos	%icc,	0x4
	orcc	%g4,	0x1AC5,	%l3
	sethi	0x17FF,	%i6
	brlez	%l0,	loop_1350
	fbue	%fcc2,	loop_1351
	alignaddrl	%i0,	%l5,	%o6
	fnot1	%f8,	%f2
loop_1350:
	xnor	%o4,	%g5,	%l4
loop_1351:
	edge32l	%o3,	%o7,	%o1
	set	0x32, %i5
	ldsba	[%l7 + %i5] 0x15,	%o5
	tn	%icc,	0x7
	movpos	%icc,	%l1,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x48],	%o2
	sll	%l2,	0x06,	%i1
	add	%g2,	0x0679,	%g3
	fmovda	%xcc,	%f1,	%f0
	fxor	%f22,	%f16,	%f0
	movleu	%xcc,	%g1,	%o0
	orn	%i7,	%i4,	%i3
	addcc	%i2,	%l6,	%g6
	set	0x24, %l6
	lduwa	[%l7 + %l6] 0x88,	%g4
	edge16l	%g7,	%l3,	%i6
	nop
	setx	0xC1C126DFFFD3BE16,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x719386C6E9E215CD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f14,	%f14
	fpmerge	%f21,	%f24,	%f4
	edge32l	%i0,	%l0,	%o6
	fmovspos	%icc,	%f2,	%f4
	taddcc	%l5,	%g5,	%l4
	fcmpgt32	%f0,	%f0,	%o3
	xnorcc	%o4,	0x1433,	%o1
	smul	%o7,	%o5,	%i5
	movrne	%l1,	0x0C5,	%l2
	array8	%o2,	%g2,	%g3
	orn	%g1,	0x084B,	%i1
	fpsub16	%f26,	%f28,	%f10
	faligndata	%f28,	%f14,	%f28
	popc	0x154E,	%i7
	set	0x58, %i3
	lda	[%l7 + %i3] 0x14,	%f23
	tle	%xcc,	0x6
	fands	%f10,	%f18,	%f1
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x74] %asi,	%o0
	be,pn	%icc,	loop_1352
	fmovse	%icc,	%f6,	%f13
	nop
	setx	0xD3EC8C99,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x3AAA3D6D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f17,	%f16
	tsubcc	%i4,	%i2,	%i3
loop_1352:
	orn	%g6,	0x0C3B,	%l6
	movrgz	%g7,	%g4,	%i6
	tsubcc	%i0,	%l0,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x37],	%o6
	tcs	%xcc,	0x4
	brgz	%g5,	loop_1353
	bg,a	%xcc,	loop_1354
	fmovdleu	%xcc,	%f12,	%f0
	fsrc2s	%f25,	%f2
loop_1353:
	or	%l4,	%l5,	%o3
loop_1354:
	movle	%xcc,	%o4,	%o1
	fbe	%fcc0,	loop_1355
	mova	%xcc,	%o7,	%i5
	fandnot1	%f20,	%f6,	%f16
	sdivx	%o5,	0x041A,	%l2
loop_1355:
	fbg,a	%fcc0,	loop_1356
	smulcc	%l1,	0x014B,	%o2
	flush	%l7 + 0x4C
	mulscc	%g2,	%g3,	%g1
loop_1356:
	fbn	%fcc2,	loop_1357
	brlz,a	%i1,	loop_1358
	sir	0x0AAC
	xnorcc	%i7,	%o0,	%i4
loop_1357:
	fandnot2s	%f7,	%f10,	%f16
loop_1358:
	movvc	%icc,	%i2,	%g6
	addccc	%i3,	%g7,	%l6
	fmovrse	%g4,	%f13,	%f26
	ldd	[%l7 + 0x08],	%f30
	brz	%i0,	loop_1359
	ba,a,pt	%xcc,	loop_1360
	edge16l	%i6,	%l0,	%o6
	movge	%icc,	%g5,	%l3
loop_1359:
	fnand	%f16,	%f8,	%f24
loop_1360:
	movrlz	%l5,	0x1C1,	%o3
	edge32	%l4,	%o4,	%o1
	edge32n	%i5,	%o5,	%l2
	fxnors	%f28,	%f8,	%f0
	movge	%xcc,	%o7,	%o2
	fmovsne	%icc,	%f8,	%f9
	mulx	%g2,	0x1075,	%g3
	ba,a	%xcc,	loop_1361
	fmovrsne	%g1,	%f11,	%f3
	movvc	%xcc,	%l1,	%i7
	movle	%icc,	%i1,	%o0
loop_1361:
	sub	%i4,	0x1F53,	%i2
	bleu,a	loop_1362
	tl	%icc,	0x3
	sll	%i3,	%g6,	%l6
	fnor	%f22,	%f16,	%f6
loop_1362:
	tsubcctv	%g4,	%i0,	%g7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%o6
	tpos	%icc,	0x4
	set	0x26, %o1
	ldsha	[%l7 + %o1] 0x0c,	%l0
	move	%xcc,	%l3,	%l5
	nop
	fitos	%f14,	%f29
	fstox	%f29,	%f14
	fxtos	%f14,	%f0
	fcmpgt32	%f30,	%f20,	%o3
	nop
	setx	0xB07F329F,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	smulcc	%g5,	0x1A7F,	%l4
	fxor	%f0,	%f14,	%f0
	movvs	%icc,	%o4,	%o1
	addccc	%o5,	0x1C91,	%i5
	sethi	0x0138,	%o7
	sethi	0x03A0,	%l2
	fcmpne32	%f14,	%f4,	%o2
	ld	[%l7 + 0x10],	%f21
	sdivx	%g2,	0x1521,	%g3
	fpsub32s	%f10,	%f25,	%f20
	movrgz	%g1,	%i7,	%i1
	bg,a	loop_1363
	fblg	%fcc1,	loop_1364
	orn	%o0,	0x1944,	%l1
	popc	%i4,	%i2
loop_1363:
	movcc	%icc,	%g6,	%i3
loop_1364:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x60] %asi,	%g4
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f16
	fxtod	%f16,	%f20
	smulcc	%i0,	0x1BF0,	%g7
	ldd	[%l7 + 0x30],	%f30
	tsubcctv	%i6,	0x0E6F,	%l6
	wr	%g0,	0xe3,	%asi
	stba	%l0,	[%l7 + 0x3B] %asi
	membar	#Sync
	tcs	%xcc,	0x3
	move	%icc,	%o6,	%l3
	add	%o3,	%g5,	%l5
	nop
	setx	0x5A1DA860,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f1
	subc	%o4,	%o1,	%o5
	mulscc	%l4,	0x03E3,	%i5
	udiv	%o7,	0x0342,	%o2
	tle	%xcc,	0x1
	xorcc	%g2,	%l2,	%g1
	orn	%g3,	%i7,	%o0
	ldd	[%l7 + 0x30],	%l0
	fblg,a	%fcc0,	loop_1365
	edge16l	%i1,	%i2,	%i4
	prefetch	[%l7 + 0x74],	 0x2
	fpadd32s	%f22,	%f1,	%f18
loop_1365:
	or	%g6,	%i3,	%g4
	xnor	%i0,	%g7,	%i6
	set	0x10, %o0
	ldda	[%l7 + %o0] 0xe2,	%l0
	tgu	%xcc,	0x6
	smulcc	%l6,	%l3,	%o3
	andn	%g5,	%l5,	%o4
	edge32ln	%o6,	%o1,	%l4
	sir	0x1902
	xorcc	%i5,	%o5,	%o2
	xnorcc	%g2,	%l2,	%g1
	edge8n	%o7,	%i7,	%g3
	popc	%l1,	%o0
	tn	%xcc,	0x5
	edge16	%i1,	%i4,	%g6
	umulcc	%i2,	%g4,	%i3
	sethi	0x13DF,	%g7
	fmovrsgz	%i0,	%f4,	%f11
	sra	%l0,	0x19,	%l6
	subc	%l3,	%i6,	%o3
	nop
	setx	loop_1366,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%l5,	0x0B9E,	%o4
	fble	%fcc3,	loop_1367
	movrlez	%g5,	0x2BE,	%o1
loop_1366:
	subc	%o6,	%i5,	%l4
	movn	%xcc,	%o2,	%g2
loop_1367:
	edge32n	%l2,	%o5,	%o7
	ldd	[%l7 + 0x58],	%f10
	xnor	%g1,	%g3,	%l1
	srl	%i7,	%o0,	%i1
	bneg,a,pn	%icc,	loop_1368
	fxor	%f28,	%f2,	%f2
	edge8n	%i4,	%g6,	%g4
	smulcc	%i3,	0x0F4C,	%i2
loop_1368:
	movrlz	%i0,	%l0,	%l6
	fmovdgu	%icc,	%f9,	%f11
	tsubcctv	%l3,	0x068C,	%g7
	nop
	set	0x5E, %g6
	ldstub	[%l7 + %g6],	%o3
	popc	%i6,	%o4
	brlez,a	%g5,	loop_1369
	bcc,a,pt	%icc,	loop_1370
	brlez	%l5,	loop_1371
	fcmpne32	%f6,	%f0,	%o6
loop_1369:
	fbul	%fcc0,	loop_1372
loop_1370:
	taddcctv	%i5,	%l4,	%o1
loop_1371:
	movrlez	%o2,	0x081,	%l2
	tge	%xcc,	0x1
loop_1372:
	edge32ln	%o5,	%g2,	%o7
	andcc	%g3,	%g1,	%i7
	movrlez	%l1,	%i1,	%o0
	edge8l	%g6,	%i4,	%i3
	movre	%g4,	0x3DC,	%i2
	stw	%l0,	[%l7 + 0x28]
	edge16	%l6,	%l3,	%g7
	fornot2	%f4,	%f10,	%f2
	fmovdcc	%icc,	%f13,	%f12
	movpos	%icc,	%o3,	%i6
	mova	%xcc,	%o4,	%g5
	udivx	%l5,	0x1228,	%o6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%i5
	srlx	%l4,	%o1,	%o2
	st	%f14,	[%l7 + 0x2C]
	brlz	%o5,	loop_1373
	nop
	setx	0xF3A0B199,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xEDCC7688,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f20,	%f21
	and	%l2,	0x087F,	%g2
	movn	%icc,	%o7,	%g3
loop_1373:
	movneg	%icc,	%g1,	%i7
	movrlez	%l1,	%i1,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn,a	%fcc1,	loop_1374
	array8	%g6,	%i4,	%i3
	edge16ln	%g4,	%l0,	%l6
	te	%xcc,	0x1
loop_1374:
	xnor	%l3,	%i2,	%g7
	edge32n	%i6,	%o3,	%o4
	popc	%g5,	%l5
	tvs	%xcc,	0x7
	nop
	setx	0xC0374F5A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xCAC9A909,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f4,	%f18
	fnot2	%f20,	%f2
	movleu	%xcc,	%o6,	%i0
	stbar
	sethi	0x1F21,	%l4
	tg	%icc,	0x4
	nop
	setx	loop_1375,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%i5,	0x0867,	%o1
	fmovsle	%xcc,	%f8,	%f18
	fmovsne	%icc,	%f0,	%f31
loop_1375:
	xnorcc	%o5,	%l2,	%g2
	orncc	%o7,	%g3,	%g1
	edge16ln	%i7,	%o2,	%l1
	pdist	%f28,	%f10,	%f4
	xor	%i1,	0x0274,	%g6
	fcmpeq32	%f8,	%f26,	%o0
	set	0x6E, %l1
	stha	%i4,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	setx	0x4BC37414,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xB4AF9B24,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f13,	%f19
	pdist	%f20,	%f26,	%f8
	edge32	%g4,	%i3,	%l6
	alignaddr	%l0,	%l3,	%g7
	ldx	[%l7 + 0x20],	%i6
	movge	%icc,	%o3,	%i2
	movrgz	%o4,	0x38E,	%l5
	edge32ln	%o6,	%g5,	%l4
	fmovdle	%icc,	%f29,	%f17
	nop
	setx	loop_1376,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%icc,	%i5,	%i0
	alignaddrl	%o5,	%l2,	%g2
	array32	%o1,	%o7,	%g1
loop_1376:
	subccc	%g3,	%i7,	%o2
	tcs	%icc,	0x3
	edge16n	%l1,	%g6,	%i1
	taddcc	%o0,	0x13C9,	%g4
	orcc	%i3,	0x0CB3,	%l6
	fpsub32s	%f19,	%f2,	%f14
	fbule,a	%fcc0,	loop_1377
	bn,pt	%xcc,	loop_1378
	nop
	setx	0xF06AC56D,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	addc	%l0,	0x15B7,	%i4
loop_1377:
	subcc	%g7,	%l3,	%o3
loop_1378:
	brgez	%i2,	loop_1379
	movrgz	%i6,	%l5,	%o4
	fmovdne	%icc,	%f30,	%f27
	tg	%icc,	0x1
loop_1379:
	nop
	set	0x64, %o6
	swapa	[%l7 + %o6] 0x88,	%g5
	fbo	%fcc1,	loop_1380
	add	%o6,	0x0210,	%i5
	tcs	%icc,	0x5
	fmovsle	%xcc,	%f30,	%f23
loop_1380:
	edge32	%i0,	%o5,	%l4
	fmovsn	%icc,	%f19,	%f3
	srlx	%l2,	%g2,	%o7
	tvs	%icc,	0x5
	subccc	%g1,	%g3,	%i7
	sethi	0x1F23,	%o1
	movge	%icc,	%o2,	%g6
	faligndata	%f6,	%f30,	%f0
	brnz	%l1,	loop_1381
	tvc	%xcc,	0x1
	sllx	%o0,	%i1,	%g4
	stw	%l6,	[%l7 + 0x1C]
loop_1381:
	fmovsneg	%xcc,	%f16,	%f26
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i3,	%i4
	stbar
	fmovsneg	%icc,	%f12,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l0,	%g7,	%l3
	brgez,a	%o3,	loop_1382
	mulscc	%i6,	%i2,	%l5
	ta	%icc,	0x7
	fmovsgu	%xcc,	%f3,	%f3
loop_1382:
	alignaddr	%o4,	%g5,	%i5
	wr	%g0,	0x81,	%asi
	stwa	%o6,	[%l7 + 0x0C] %asi
	edge8n	%i0,	%l4,	%l2
	subcc	%o5,	%o7,	%g2
	tvc	%icc,	0x1
	ble,a,pn	%icc,	loop_1383
	fmul8x16	%f12,	%f28,	%f22
	fbul	%fcc0,	loop_1384
	be,a	%xcc,	loop_1385
loop_1383:
	tne	%xcc,	0x4
	movcc	%icc,	%g1,	%i7
loop_1384:
	edge8l	%o1,	%o2,	%g3
loop_1385:
	movn	%xcc,	%l1,	%g6
	edge32n	%o0,	%g4,	%l6
	fmovrdgz	%i3,	%f22,	%f28
	fnot2s	%f17,	%f15
	fmuld8ulx16	%f30,	%f16,	%f2
	sllx	%i1,	%i4,	%l0
	wr	%g0,	0x89,	%asi
	stba	%g7,	[%l7 + 0x12] %asi
	fmovsg	%icc,	%f14,	%f26
	swap	[%l7 + 0x2C],	%o3
	edge16ln	%i6,	%i2,	%l3
	fandnot1s	%f24,	%f3,	%f20
	edge32n	%o4,	%g5,	%l5
	fands	%f21,	%f2,	%f1
	subc	%o6,	%i0,	%l4
	set	0x10, %i7
	ldxa	[%l7 + %i7] 0x89,	%i5
	fbl	%fcc2,	loop_1386
	tle	%xcc,	0x6
	sdivcc	%o5,	0x0982,	%l2
	fmovsleu	%xcc,	%f29,	%f8
loop_1386:
	fbul,a	%fcc2,	loop_1387
	sdivcc	%o7,	0x1FA1,	%g1
	fpackfix	%f2,	%f30
	add	%g2,	%o1,	%i7
loop_1387:
	orncc	%o2,	%l1,	%g3
	taddcc	%g6,	%g4,	%l6
	swap	[%l7 + 0x44],	%o0
	umul	%i3,	0x0447,	%i1
	popc	%l0,	%g7
	bg	%icc,	loop_1388
	fmovdne	%xcc,	%f21,	%f24
	bpos,pn	%xcc,	loop_1389
	xnor	%o3,	0x022C,	%i6
loop_1388:
	fblg,a	%fcc2,	loop_1390
	orn	%i4,	%i2,	%o4
loop_1389:
	nop
	setx	0x7078C314,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	tne	%icc,	0x1
loop_1390:
	te	%icc,	0x1
	edge8n	%g5,	%l3,	%l5
	fbug	%fcc3,	loop_1391
	ba,a	loop_1392
	bleu,pt	%icc,	loop_1393
	addc	%o6,	%l4,	%i0
loop_1391:
	movrgez	%i5,	%l2,	%o5
loop_1392:
	te	%icc,	0x0
loop_1393:
	fmovdcc	%xcc,	%f25,	%f20
	edge8	%o7,	%g1,	%o1
	smul	%g2,	0x1927,	%o2
	movrgez	%i7,	0x081,	%l1
	nop
	setx	0x9055D136,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	edge16	%g6,	%g4,	%g3
	nop
	fitod	%f4,	%f4
	fdtoi	%f4,	%f24
	nop
	setx	0x730ADDC8F5C91EDB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f28
	edge32	%o0,	%i3,	%l6
	ta	%xcc,	0x4
	fmovrdlz	%l0,	%f0,	%f24
	fbe	%fcc2,	loop_1394
	fcmpgt32	%f18,	%f20,	%g7
	popc	0x1057,	%i1
	movn	%icc,	%i6,	%o3
loop_1394:
	movcs	%icc,	%i2,	%i4
	ldsh	[%l7 + 0x0E],	%o4
	umulcc	%l3,	%g5,	%l5
	nop
	fitos	%f10,	%f15
	fstox	%f15,	%f30
	fxtos	%f30,	%f31
	brnz,a	%o6,	loop_1395
	edge32ln	%i0,	%l4,	%i5
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x04
loop_1395:
	fmovdgu	%icc,	%f30,	%f16
	sll	%l2,	%o5,	%g1
	ldd	[%l7 + 0x18],	%o6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%g2
	mulx	%o1,	%i7,	%o2
	set	0x7A, %l2
	stha	%l1,	[%l7 + %l2] 0x81
	lduw	[%l7 + 0x78],	%g6
	ldsw	[%l7 + 0x30],	%g4
	fnors	%f15,	%f28,	%f27
	fbul,a	%fcc3,	loop_1396
	subccc	%g3,	0x11C6,	%o0
	array8	%l6,	%i3,	%g7
	bn,a	%xcc,	loop_1397
loop_1396:
	nop
	setx	0xFAC487CF2041FDF8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	alignaddrl	%l0,	%i1,	%o3
	movne	%icc,	%i2,	%i4
loop_1397:
	xnor	%i6,	0x1313,	%l3
	movvs	%xcc,	%g5,	%l5
	fbo	%fcc3,	loop_1398
	subcc	%o4,	%o6,	%l4
	fbo	%fcc2,	loop_1399
	taddcc	%i5,	0x03F3,	%l2
loop_1398:
	ldsh	[%l7 + 0x44],	%i0
	alignaddr	%g1,	%o5,	%o7
loop_1399:
	xor	%o1,	%i7,	%o2
	or	%l1,	%g6,	%g2
	array16	%g4,	%o0,	%g3
	fbul	%fcc2,	loop_1400
	fblg,a	%fcc2,	loop_1401
	tleu	%xcc,	0x5
	popc	0x13BF,	%i3
loop_1400:
	fmul8sux16	%f28,	%f12,	%f24
loop_1401:
	movneg	%xcc,	%l6,	%l0
	ldx	[%l7 + 0x30],	%i1
	set	0x78, %i4
	ldswa	[%l7 + %i4] 0x88,	%o3
	edge32n	%g7,	%i2,	%i4
	movg	%xcc,	%l3,	%g5
	ldsb	[%l7 + 0x41],	%i6
	fmovrslz	%o4,	%f21,	%f16
	tge	%icc,	0x4
	tpos	%icc,	0x5
	srlx	%o6,	0x0A,	%l4
	smul	%i5,	0x0B69,	%l2
	sub	%l5,	0x140D,	%i0
	tge	%xcc,	0x7
	array8	%g1,	%o5,	%o7
	andncc	%i7,	%o2,	%o1
	srlx	%g6,	0x19,	%g2
	fbo	%fcc2,	loop_1402
	fbge	%fcc2,	loop_1403
	movgu	%xcc,	%g4,	%l1
	movrgez	%o0,	0x2CA,	%i3
loop_1402:
	alignaddrl	%g3,	%l0,	%i1
loop_1403:
	sth	%l6,	[%l7 + 0x10]
	mulscc	%g7,	0x08AC,	%i2
	movrlz	%o3,	0x0A5,	%i4
	fmovdcc	%icc,	%f10,	%f24
	tleu	%icc,	0x0
	movvs	%icc,	%l3,	%g5
	brlz	%i6,	loop_1404
	movcc	%xcc,	%o4,	%o6
	fmovrdlz	%i5,	%f2,	%f12
	fmovscs	%icc,	%f19,	%f4
loop_1404:
	nop
	setx loop_1405, %l0, %l1
	jmpl %l1, %l4
	xnor	%l2,	0x1981,	%l5
	bcc	%icc,	loop_1406
	fpackfix	%f4,	%f17
loop_1405:
	alignaddr	%g1,	%o5,	%i0
	bvc,pt	%xcc,	loop_1407
loop_1406:
	movrlz	%i7,	%o2,	%o7
	fba,a	%fcc0,	loop_1408
	nop
	setx	loop_1409,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1407:
	array16	%g6,	%o1,	%g2
	srax	%l1,	%g4,	%o0
loop_1408:
	array16	%i3,	%l0,	%i1
loop_1409:
	ldsw	[%l7 + 0x48],	%g3
	bcs	%icc,	loop_1410
	nop
	setx loop_1411, %l0, %l1
	jmpl %l1, %l6
	orcc	%i2,	0x0391,	%o3
	edge32ln	%g7,	%i4,	%g5
loop_1410:
	edge8ln	%l3,	%o4,	%o6
loop_1411:
	fone	%f20
	tvc	%icc,	0x4
	alignaddrl	%i5,	%i6,	%l2
	fone	%f26
	fnands	%f13,	%f12,	%f2
	tge	%xcc,	0x7
	fmovdcs	%xcc,	%f13,	%f28
	lduh	[%l7 + 0x18],	%l4
	movgu	%xcc,	%g1,	%o5
	tge	%icc,	0x1
	udivx	%i0,	0x14B4,	%l5
	popc	0x0FED,	%o2
	or	%i7,	%g6,	%o1
	edge8	%o7,	%g2,	%l1
	mulx	%g4,	0x1CDC,	%i3
	udivcc	%o0,	0x01C3,	%i1
	bcs,a	loop_1412
	mulscc	%l0,	%l6,	%g3
	fblg	%fcc0,	loop_1413
	bgu,pt	%xcc,	loop_1414
loop_1412:
	fbg	%fcc0,	loop_1415
	movcs	%xcc,	%o3,	%g7
loop_1413:
	bvc,pn	%xcc,	loop_1416
loop_1414:
	udiv	%i4,	0x1477,	%g5
loop_1415:
	tcc	%icc,	0x6
	ldd	[%l7 + 0x08],	%f8
loop_1416:
	tsubcc	%i2,	%l3,	%o4
	fornot2s	%f30,	%f9,	%f25
	edge8n	%o6,	%i5,	%i6
	brz,a	%l2,	loop_1417
	tcs	%xcc,	0x4
	edge8	%g1,	%l4,	%o5
	xnorcc	%l5,	%o2,	%i0
loop_1417:
	edge16ln	%i7,	%g6,	%o7
	tcs	%xcc,	0x3
	ldsb	[%l7 + 0x26],	%o1
	tcs	%xcc,	0x0
	udivcc	%g2,	0x147D,	%l1
	fmovdcc	%icc,	%f30,	%f14
	andncc	%g4,	%o0,	%i3
	sdivcc	%i1,	0x19FB,	%l6
	tgu	%xcc,	0x4
	edge32n	%g3,	%o3,	%g7
	brlez	%i4,	loop_1418
	bcc,pn	%icc,	loop_1419
	movgu	%icc,	%g5,	%l0
	fcmpgt16	%f20,	%f6,	%i2
loop_1418:
	fmul8x16	%f6,	%f20,	%f24
loop_1419:
	tg	%xcc,	0x3
	nop
	setx	0x66EFB0A80CD37D6A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xD68128B0086B7B1A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f24,	%f8
	fornot2s	%f17,	%f2,	%f20
	fmovsgu	%xcc,	%f20,	%f9
	srl	%o4,	0x00,	%o6
	tneg	%icc,	0x5
	fmovrdne	%l3,	%f0,	%f14
	taddcc	%i6,	%l2,	%g1
	udivx	%i5,	0x13BF,	%l4
	addc	%l5,	0x18FC,	%o2
	andncc	%o5,	%i7,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%f30
	fba,a	%fcc2,	loop_1420
	fmovda	%xcc,	%f10,	%f25
	brlz,a	%i0,	loop_1421
	bcc,a	loop_1422
loop_1420:
	array8	%o1,	%g2,	%l1
	nop
	setx	0xE08F6F257131B0F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x9051B0A6C8A3A8BE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f0,	%f26
loop_1421:
	edge8n	%g4,	%o0,	%o7
loop_1422:
	edge8	%i3,	%l6,	%i1
	std	%f30,	[%l7 + 0x28]
	udiv	%g3,	0x13A9,	%g7
	orn	%i4,	%o3,	%g5
	fzeros	%f0
	tg	%icc,	0x6
	edge8	%l0,	%o4,	%o6
	movneg	%xcc,	%l3,	%i6
	fsrc1	%f6,	%f10
	fbug,a	%fcc1,	loop_1423
	call	loop_1424
	sdivx	%l2,	0x08BB,	%i2
	tn	%xcc,	0x6
loop_1423:
	nop
	set	0x108, %g4
	stxa	%i5,	[%g0 + %g4] 0x52
loop_1424:
	subcc	%g1,	0x136C,	%l4
	set	0x7E, %o2
	stha	%o2,	[%l7 + %o2] 0x14
	subcc	%o5,	0x1A84,	%i7
	srlx	%l5,	0x0F,	%g6
	stx	%o1,	[%l7 + 0x28]
	andn	%i0,	%l1,	%g4
	fmovrslz	%o0,	%f30,	%f31
	edge8l	%g2,	%o7,	%l6
	ldub	[%l7 + 0x1C],	%i1
	sth	%g3,	[%l7 + 0x32]
	movneg	%icc,	%g7,	%i4
	tsubcctv	%o3,	%g5,	%i3
	fblg,a	%fcc3,	loop_1425
	fbne,a	%fcc2,	loop_1426
	udiv	%o4,	0x0F3D,	%o6
	fmovde	%icc,	%f6,	%f21
loop_1425:
	xor	%l0,	0x099E,	%i6
loop_1426:
	movgu	%xcc,	%l2,	%l3
	movcc	%icc,	%i2,	%g1
	fnors	%f10,	%f13,	%f11
	tpos	%icc,	0x5
	fcmpgt16	%f4,	%f14,	%l4
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x67, %g7
	stba	%i5,	[%l7 + %g7] 0x19
	umul	%o5,	%i7,	%o2
	bcc	%xcc,	loop_1427
	fmovsgu	%icc,	%f30,	%f21
	movpos	%icc,	%l5,	%o1
	fmovsleu	%icc,	%f27,	%f12
loop_1427:
	add	%i0,	0x0D7E,	%g6
	tleu	%icc,	0x0
	or	%g4,	0x02B1,	%o0
	mulx	%l1,	0x11FF,	%o7
	tne	%xcc,	0x4
	orncc	%g2,	0x1C24,	%l6
	tne	%xcc,	0x1
	udivx	%g3,	0x19AF,	%i1
	fnot1	%f26,	%f10
	fornot1	%f30,	%f22,	%f4
	fmul8sux16	%f6,	%f24,	%f10
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%i4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x55] %asi,	%o3
	tleu	%xcc,	0x1
	add	%g5,	%i3,	%o6
	tsubcctv	%o4,	%l0,	%i6
	fxors	%f22,	%f24,	%f31
	andn	%l2,	0x118C,	%l3
	andncc	%g1,	%i2,	%i5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%l4,	%o5
	fba	%fcc2,	loop_1428
	alignaddr	%o2,	%l5,	%o1
	fbo	%fcc2,	loop_1429
	fmovrdgz	%i7,	%f20,	%f20
loop_1428:
	nop
	setx	loop_1430,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fblg	%fcc3,	loop_1431
loop_1429:
	movl	%icc,	%g6,	%g4
	movl	%icc,	%i0,	%o0
loop_1430:
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o7
loop_1431:
	prefetch	[%l7 + 0x44],	 0x3
	edge8	%g2,	%l6,	%g3
	fmovdpos	%xcc,	%f12,	%f27
	lduh	[%l7 + 0x1A],	%i1
	set	0x1C, %i1
	sta	%f14,	[%l7 + %i1] 0x15
	srl	%l1,	0x01,	%g7
	andncc	%o3,	%i4,	%g5
	fmul8sux16	%f26,	%f28,	%f14
	sllx	%i3,	0x04,	%o6
	array8	%o4,	%i6,	%l2
	fmovd	%f0,	%f6
	andncc	%l3,	%g1,	%i2
	movpos	%xcc,	%i5,	%l4
	mulscc	%o5,	%o2,	%l0
	addc	%o1,	%i7,	%g6
	wr	%g0,	0x23,	%asi
	stwa	%l5,	[%l7 + 0x24] %asi
	membar	#Sync
	xorcc	%g4,	0x09F1,	%o0
	sub	%i0,	%o7,	%l6
	sdiv	%g2,	0x09C9,	%g3
	edge16	%i1,	%l1,	%o3
	bg,a	loop_1432
	fpadd32s	%f22,	%f26,	%f14
	fmul8ulx16	%f24,	%f6,	%f28
	movrlez	%i4,	%g5,	%i3
loop_1432:
	lduh	[%l7 + 0x4A],	%o6
	tl	%xcc,	0x0
	ta	%icc,	0x2
	te	%icc,	0x1
	xnor	%g7,	0x0D33,	%o4
	sdiv	%l2,	0x0E4C,	%i6
	bpos,a	loop_1433
	lduw	[%l7 + 0x50],	%g1
	smulcc	%i2,	0x1DBF,	%l3
	fmovdn	%xcc,	%f18,	%f2
loop_1433:
	nop
	setx	0x32D45233,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x54D499DC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f19,	%f3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1F] %asi,	%i5
	movvs	%icc,	%l4,	%o2
	wr	%g0,	0x18,	%asi
	stba	%l0,	[%l7 + 0x41] %asi
	tpos	%icc,	0x6
	smul	%o5,	%o1,	%i7
	fmovrslez	%g6,	%f20,	%f18
	fmovdle	%icc,	%f4,	%f20
	nop
	setx	loop_1434,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8sux16	%f10,	%f4,	%f2
	orcc	%l5,	%g4,	%o0
	bgu,a,pn	%icc,	loop_1435
loop_1434:
	xor	%o7,	%l6,	%g2
	fands	%f11,	%f1,	%f31
	mulx	%i0,	%g3,	%i1
loop_1435:
	andcc	%l1,	%i4,	%o3
	wr	%g0,	0x89,	%asi
	stha	%i3,	[%l7 + 0x08] %asi
	tpos	%icc,	0x4
	brlz	%o6,	loop_1436
	array8	%g7,	%g5,	%l2
	nop
	setx loop_1437, %l0, %l1
	jmpl %l1, %i6
	fones	%f16
loop_1436:
	nop
	setx	0x3DA2462EC787162C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x44B693467FC0B005,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f22,	%f30
	movle	%xcc,	%o4,	%g1
loop_1437:
	fcmple16	%f6,	%f0,	%l3
	sdiv	%i5,	0x113D,	%i2
	fpsub32s	%f10,	%f3,	%f15
	xnor	%l4,	0x12E8,	%l0
	movrlez	%o2,	0x08E,	%o5
	fmovsn	%icc,	%f2,	%f22
	subc	%o1,	%i7,	%g6
	stx	%l5,	[%l7 + 0x20]
	andcc	%g4,	0x040C,	%o7
	movrgz	%l6,	%o0,	%i0
	array32	%g3,	%i1,	%g2
	tpos	%xcc,	0x7
	flush	%l7 + 0x34
	addcc	%i4,	0x02AE,	%o3
	taddcctv	%i3,	%l1,	%o6
	brgz,a	%g5,	loop_1438
	taddcctv	%l2,	%g7,	%o4
	movleu	%xcc,	%i6,	%l3
	sdiv	%g1,	0x15D3,	%i2
loop_1438:
	array32	%i5,	%l0,	%l4
	movleu	%xcc,	%o5,	%o2
	smul	%o1,	0x087F,	%g6
	fand	%f30,	%f16,	%f26
	nop
	setx	0xFD59D86D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xB1EDD13C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f18,	%f30
	orncc	%l5,	0x0033,	%g4
	nop
	setx	0xB07B7A29,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	movrlez	%i7,	%o7,	%o0
	fpack32	%f20,	%f22,	%f30
	popc	%i0,	%g3
	ble	loop_1439
	edge32ln	%l6,	%i1,	%g2
	fba,a	%fcc0,	loop_1440
	movge	%xcc,	%o3,	%i4
loop_1439:
	te	%icc,	0x1
	subc	%i3,	%l1,	%g5
loop_1440:
	andncc	%l2,	%o6,	%o4
	sub	%i6,	%g7,	%g1
	wr	%g0,	0x5f,	%asi
	stxa	%i2,	[%g0 + 0x0] %asi
	te	%xcc,	0x2
	subcc	%i5,	%l0,	%l3
	membar	0x19
	fones	%f29
	udivcc	%l4,	0x0D83,	%o5
	movgu	%xcc,	%o2,	%o1
	fandnot2s	%f31,	%f30,	%f12
	bcc,a,pt	%icc,	loop_1441
	alignaddr	%g6,	%g4,	%l5
	fbul,a	%fcc1,	loop_1442
	fmovdne	%icc,	%f15,	%f2
loop_1441:
	movrgz	%i7,	%o7,	%o0
	udiv	%g3,	0x1319,	%i0
loop_1442:
	xor	%i1,	0x1E05,	%l6
	nop
	fitos	%f8,	%f15
	fstox	%f15,	%f8
	fxtos	%f8,	%f0
	tgu	%xcc,	0x2
	set	0x7F, %g3
	lduba	[%l7 + %g3] 0x15,	%o3
	brlz	%i4,	loop_1443
	umulcc	%i3,	0x1672,	%g2
	array16	%l1,	%l2,	%g5
	sdivcc	%o4,	0x179F,	%i6
loop_1443:
	sethi	0x0B0D,	%g7
	edge32l	%g1,	%o6,	%i5
	ta	%icc,	0x1
	fmovse	%xcc,	%f10,	%f19
	call	loop_1444
	movl	%icc,	%l0,	%l3
	nop
	setx	0xADC94874B0605181,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	edge32n	%i2,	%o5,	%l4
loop_1444:
	fbne,a	%fcc2,	loop_1445
	movleu	%icc,	%o1,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g4,	0x20E,	%l5
loop_1445:
	nop
	set	0x48, %l0
	lda	[%l7 + %l0] 0x89,	%f8
	array8	%o2,	%o7,	%o0
	srlx	%i7,	0x1D,	%i0
	xnor	%g3,	0x16EA,	%l6
	movle	%icc,	%o3,	%i1
	sll	%i4,	%g2,	%i3
	srl	%l1,	%l2,	%o4
	fbl	%fcc2,	loop_1446
	movrne	%g5,	0x393,	%g7
	pdist	%f18,	%f24,	%f18
	tge	%icc,	0x2
loop_1446:
	mulscc	%i6,	%o6,	%g1
	bg	loop_1447
	fmovdne	%xcc,	%f22,	%f19
	movneg	%icc,	%l0,	%i5
	fmovdgu	%xcc,	%f18,	%f24
loop_1447:
	nop
	setx	0x30764532,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	tcc	%xcc,	0x1
	brgez,a	%i2,	loop_1448
	addcc	%o5,	%l3,	%o1
	stbar
	std	%f12,	[%l7 + 0x78]
loop_1448:
	umul	%g6,	%g4,	%l4
	tcc	%xcc,	0x3
	edge8l	%l5,	%o2,	%o7
	tgu	%icc,	0x3
	taddcc	%o0,	%i7,	%i0
	movg	%xcc,	%l6,	%o3
	orncc	%g3,	%i4,	%i1
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge8ln	%g2,	%l1,	%i3
	fmovdleu	%xcc,	%f3,	%f4
	brlez,a	%o4,	loop_1449
	movvs	%icc,	%l2,	%g5
	fnot2	%f0,	%f8
	fmovdle	%icc,	%f7,	%f28
loop_1449:
	tcc	%icc,	0x6
	fmovde	%xcc,	%f30,	%f2
	mova	%icc,	%i6,	%o6
	umulcc	%g1,	0x0B2D,	%l0
	fbul	%fcc3,	loop_1450
	udiv	%g7,	0x1BDC,	%i5
	bgu,pn	%xcc,	loop_1451
	array8	%o5,	%l3,	%i2
loop_1450:
	fxnor	%f16,	%f0,	%f0
	addc	%o1,	0x041D,	%g6
loop_1451:
	fbne,a	%fcc0,	loop_1452
	movne	%icc,	%g4,	%l4
	andcc	%l5,	0x1981,	%o7
	fble,a	%fcc0,	loop_1453
loop_1452:
	ldstub	[%l7 + 0x11],	%o0
	wr	%g0,	0x88,	%asi
	stwa	%o2,	[%l7 + 0x70] %asi
loop_1453:
	sdivcc	%i7,	0x11F6,	%i0
	fone	%f14
	tcc	%icc,	0x4
	edge16n	%o3,	%l6,	%i4
	nop
	setx	0x62709D043328294D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xBBADB50423141264,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f2,	%f0
	tn	%icc,	0x2
	movvc	%xcc,	%i1,	%g3
	membar	0x59
	movne	%xcc,	%g2,	%l1
	fabss	%f15,	%f20
	xorcc	%o4,	0x02B0,	%i3
	alignaddr	%g5,	%i6,	%l2
	fmovspos	%icc,	%f26,	%f27
	fbule,a	%fcc3,	loop_1454
	array32	%o6,	%l0,	%g7
	fandnot1s	%f2,	%f16,	%f7
	nop
	setx	0xDEC5640F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xFA5BAEBD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f23,	%f1
loop_1454:
	bvc	%icc,	loop_1455
	orcc	%i5,	%o5,	%g1
	tleu	%xcc,	0x1
	tvs	%icc,	0x0
loop_1455:
	fmovsa	%xcc,	%f25,	%f25
	array8	%l3,	%i2,	%o1
	fnot2s	%f24,	%f27
	movvs	%icc,	%g4,	%g6
	sethi	0x16C5,	%l5
	tsubcctv	%l4,	0x0837,	%o0
	nop
	setx	loop_1456,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovda	%icc,	%f28,	%f11
	bcc,a	%xcc,	loop_1457
	edge8	%o7,	%i7,	%o2
loop_1456:
	fbuge,a	%fcc1,	loop_1458
	taddcc	%i0,	0x12E4,	%o3
loop_1457:
	fmovrsgez	%i4,	%f10,	%f25
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1458:
	fmovrdlez	%l6,	%f24,	%f12
	tle	%xcc,	0x1
	ba,a	loop_1459
	sdiv	%g3,	0x10A0,	%i1
	popc	%g2,	%l1
	nop
	setx	0xC0551F23,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
loop_1459:
	edge32l	%o4,	%i3,	%g5
	nop
	setx loop_1460, %l0, %l1
	jmpl %l1, %l2
	addc	%i6,	%o6,	%g7
	movge	%xcc,	%l0,	%i5
	fpsub32s	%f2,	%f11,	%f28
loop_1460:
	nop
	set	0x50, %i2
	stwa	%g1,	[%l7 + %i2] 0x2f
	membar	#Sync
	fbn,a	%fcc0,	loop_1461
	alignaddr	%l3,	%o5,	%i2
	sub	%g4,	%g6,	%o1
	fbug,a	%fcc1,	loop_1462
loop_1461:
	fmovrslez	%l4,	%f28,	%f1
	addccc	%l5,	%o7,	%o0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x14,	%f0
loop_1462:
	nop
	fitod	%f19,	%f0
	movvc	%icc,	%i7,	%o2
	stx	%i0,	[%l7 + 0x68]
	fsrc1	%f12,	%f26
	sethi	0x04E9,	%i4
	edge32l	%l6,	%o3,	%g3
	movrlez	%g2,	0x1BE,	%l1
	set	0x38, %l3
	swapa	[%l7 + %l3] 0x81,	%o4
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x78] %asi,	%i3
	fornot1	%f4,	%f0,	%f12
	set	0x68, %g1
	prefetcha	[%l7 + %g1] 0x80,	 0x2
	sub	%l2,	%i1,	%o6
	addcc	%i6,	0x05E4,	%g7
	fbul	%fcc1,	loop_1463
	subccc	%i5,	%l0,	%g1
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x38] %asi,	%o5
loop_1463:
	movrlz	%l3,	0x27C,	%g4
	swap	[%l7 + 0x28],	%i2
	tn	%icc,	0x7
	movrne	%o1,	%g6,	%l5
	fpack32	%f18,	%f12,	%f4
	fmuld8sux16	%f15,	%f8,	%f20
	movl	%xcc,	%l4,	%o0
	smul	%o7,	0x053F,	%o2
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x81
	popc	0x1E57,	%i0
	srax	%i4,	0x03,	%i7
	udivcc	%l6,	0x15A2,	%o3
	tgu	%icc,	0x5
	sethi	0x1864,	%g2
	ldstub	[%l7 + 0x36],	%l1
	xnor	%g3,	0x07D5,	%o4
	fnand	%f8,	%f20,	%f12
	prefetch	[%l7 + 0x7C],	 0x3
	fmovdgu	%xcc,	%f28,	%f12
	set	0x54, %o4
	ldstuba	[%l7 + %o4] 0x11,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l2,	0x1F15,	%g5
	fbge	%fcc2,	loop_1464
	orn	%i1,	%o6,	%i6
	tgu	%xcc,	0x4
	taddcc	%g7,	%i5,	%l0
loop_1464:
	fmovdgu	%icc,	%f4,	%f28
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%o5
	umul	%g1,	%l3,	%g4
	orn	%o1,	0x132D,	%i2
	tvs	%icc,	0x0
	fpackfix	%f20,	%f10
	nop
	setx loop_1465, %l0, %l1
	jmpl %l1, %g6
	tneg	%icc,	0x2
	addccc	%l5,	0x1D2F,	%o0
	addcc	%o7,	%o2,	%i0
loop_1465:
	tle	%icc,	0x7
	edge8n	%i4,	%i7,	%l6
	movcc	%icc,	%l4,	%g2
	tcc	%xcc,	0x5
	fnot2s	%f19,	%f1
	srlx	%l1,	%o3,	%g3
	prefetch	[%l7 + 0x54],	 0x1
	nop
	fitos	%f6,	%f13
	fstox	%f13,	%f0
	edge16n	%i3,	%o4,	%g5
	movpos	%icc,	%i1,	%o6
	addcc	%i6,	%l2,	%i5
	fmovsne	%xcc,	%f24,	%f15
	tpos	%xcc,	0x0
	fbu,a	%fcc3,	loop_1466
	ldub	[%l7 + 0x48],	%g7
	edge16l	%l0,	%g1,	%o5
	xorcc	%g4,	0x035D,	%o1
loop_1466:
	bneg,pt	%xcc,	loop_1467
	fnegs	%f4,	%f26
	andncc	%l3,	%i2,	%g6
	fcmpgt32	%f10,	%f0,	%o0
loop_1467:
	orn	%l5,	0x0016,	%o7
	fornot2	%f0,	%f4,	%f2
	orn	%i0,	%o2,	%i4
	membar	0x78
	umulcc	%l6,	0x0FBD,	%i7
	edge16n	%l4,	%g2,	%o3
	bl	%xcc,	loop_1468
	fbuge,a	%fcc0,	loop_1469
	nop
	fitos	%f2,	%f8
	fstod	%f8,	%f28
	fbug,a	%fcc3,	loop_1470
loop_1468:
	fba	%fcc1,	loop_1471
loop_1469:
	movneg	%xcc,	%g3,	%i3
	fmovrdlz	%l1,	%f18,	%f24
loop_1470:
	movge	%icc,	%o4,	%g5
loop_1471:
	nop
	setx loop_1472, %l0, %l1
	jmpl %l1, %i1
	nop
	setx	0x56E0DD7F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f0
	fmovscc	%xcc,	%f10,	%f5
	smul	%o6,	%l2,	%i5
loop_1472:
	stbar
	fmovsgu	%icc,	%f12,	%f14
	nop
	setx	0x7E236511305DFB43,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	set	0x78, %g2
	ldstuba	[%l7 + %g2] 0x80,	%g7
	andncc	%i6,	%g1,	%o5
	xnor	%g4,	%l0,	%o1
	orncc	%i2,	%l3,	%g6
	taddcc	%l5,	0x11D6,	%o7
	alignaddr	%o0,	%o2,	%i0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%i4,	%l6
	movcs	%icc,	%i7,	%g2
	nop
	setx	0xB17B0945676EB38D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x5F23D6C26F53F202,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f0,	%f26
	array8	%o3,	%g3,	%l4
	ba	loop_1473
	ble	loop_1474
	xor	%l1,	%i3,	%o4
	and	%i1,	%g5,	%l2
loop_1473:
	flush	%l7 + 0x08
loop_1474:
	movvs	%xcc,	%o6,	%i5
	add	%i6,	0x0AF8,	%g7
	fsrc2	%f26,	%f22
	edge16l	%o5,	%g4,	%g1
	andncc	%l0,	%i2,	%o1
	tcc	%xcc,	0x3
	movre	%g6,	%l3,	%l5
	fbue,a	%fcc1,	loop_1475
	edge32n	%o0,	%o2,	%i0
	wr	%g0,	0xea,	%asi
	stha	%o7,	[%l7 + 0x20] %asi
	membar	#Sync
loop_1475:
	movge	%xcc,	%l6,	%i4
	fmovdleu	%icc,	%f15,	%f14
	fbn,a	%fcc2,	loop_1476
	stw	%i7,	[%l7 + 0x0C]
	movvc	%xcc,	%o3,	%g2
	fmovdvc	%icc,	%f11,	%f14
loop_1476:
	fcmpne32	%f22,	%f16,	%l4
	mulscc	%l1,	0x1FFA,	%g3
	tsubcc	%i3,	%i1,	%o4
	taddcctv	%l2,	%g5,	%o6
	subccc	%i6,	%i5,	%o5
	bneg	%icc,	loop_1477
	movpos	%icc,	%g7,	%g1
	fors	%f23,	%f21,	%f12
	tle	%xcc,	0x2
loop_1477:
	tl	%xcc,	0x3
	fmovrdgez	%l0,	%f10,	%f14
	ld	[%l7 + 0x70],	%f31
	addc	%g4,	%o1,	%i2
	fbe	%fcc3,	loop_1478
	tne	%icc,	0x3
	addc	%g6,	0x0CFB,	%l3
	and	%o0,	%l5,	%i0
loop_1478:
	array8	%o2,	%o7,	%i4
	fble,a	%fcc0,	loop_1479
	fnand	%f0,	%f24,	%f0
	ldub	[%l7 + 0x20],	%l6
	movrlez	%o3,	%i7,	%l4
loop_1479:
	tle	%icc,	0x2
	fands	%f22,	%f1,	%f11
	wr	%g0,	0x0c,	%asi
	stha	%l1,	[%l7 + 0x48] %asi
	movvs	%xcc,	%g2,	%g3
	te	%icc,	0x0
	sra	%i1,	%i3,	%l2
	edge16n	%g5,	%o6,	%i6
	fmovrsne	%o4,	%f1,	%f7
	bneg,pt	%xcc,	loop_1480
	fmul8sux16	%f26,	%f24,	%f28
	move	%icc,	%i5,	%o5
	smul	%g1,	0x0F85,	%g7
loop_1480:
	edge32n	%l0,	%g4,	%i2
	movvs	%icc,	%o1,	%l3
	fors	%f26,	%f16,	%f29
	for	%f12,	%f0,	%f28
	tvs	%icc,	0x6
	umulcc	%o0,	%l5,	%g6
	te	%icc,	0x4
	fexpand	%f13,	%f30
	tcc	%xcc,	0x5
	sra	%o2,	%o7,	%i4
	tneg	%icc,	0x4
	fornot1	%f8,	%f30,	%f2
	nop
	set	0x32, %i6
	stb	%i0,	[%l7 + %i6]
	sdiv	%l6,	0x1CAB,	%i7
	stbar
	nop
	setx	loop_1481,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	fitos	%f19,	%f0
	subc	%l4,	0x1B84,	%l1
	srax	%g2,	%o3,	%i1
loop_1481:
	te	%icc,	0x7
	orn	%i3,	0x0ECE,	%l2
	srl	%g5,	0x1A,	%g3
	brz	%o6,	loop_1482
	movgu	%xcc,	%o4,	%i6
	fbul	%fcc0,	loop_1483
	tcs	%xcc,	0x0
loop_1482:
	smulcc	%i5,	%o5,	%g1
	nop
	setx	0x9882EFC6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f3
loop_1483:
	sll	%g7,	%g4,	%l0
	ta	%icc,	0x6
	tsubcc	%i2,	0x1D1C,	%o1
	xorcc	%l3,	%l5,	%o0
	addccc	%o2,	0x1D6E,	%o7
	movg	%icc,	%g6,	%i0
	ta	%xcc,	0x2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%l6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x50] %asi,	%l4
	edge32	%i7,	%g2,	%o3
	set	0x0C, %o5
	sta	%f5,	[%l7 + %o5] 0x11
	udivx	%l1,	0x0C32,	%i1
	subc	%i3,	0x0011,	%g5
	edge8n	%l2,	%g3,	%o4
	lduh	[%l7 + 0x42],	%i6
	sethi	0x077D,	%i5
	fabss	%f4,	%f22
	tge	%icc,	0x2
	ldsb	[%l7 + 0x6F],	%o6
	fxnor	%f22,	%f2,	%f0
	brgez	%o5,	loop_1484
	xnor	%g7,	%g1,	%g4
	sub	%l0,	%o1,	%i2
	tvs	%icc,	0x5
loop_1484:
	sub	%l5,	0x0D9D,	%l3
	tcs	%xcc,	0x3
	edge8ln	%o0,	%o2,	%g6
	orncc	%i0,	%o7,	%i4
	sllx	%l4,	%i7,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f16,	%f12
	movg	%xcc,	%o3,	%l1
	swap	[%l7 + 0x58],	%g2
	bvs,a,pt	%icc,	loop_1485
	sir	0x1B11
	smulcc	%i3,	%i1,	%g5
	edge32l	%l2,	%g3,	%i6
loop_1485:
	xor	%i5,	0x06EB,	%o6
	fmul8x16	%f1,	%f14,	%f10
	add	%o5,	%g7,	%g1
	sll	%o4,	0x04,	%l0
	fmovsne	%icc,	%f6,	%f15
	edge16l	%o1,	%g4,	%l5
	mulx	%l3,	0x04C7,	%i2
	movl	%xcc,	%o2,	%o0
	sdiv	%i0,	0x0AF2,	%g6
	fexpand	%f5,	%f16
	movcs	%xcc,	%i4,	%o7
	edge32ln	%l4,	%i7,	%l6
	alignaddrl	%o3,	%l1,	%i3
	addccc	%i1,	0x1238,	%g2
	movrne	%g5,	0x3C8,	%l2
	bneg,a,pt	%icc,	loop_1486
	fnegs	%f7,	%f5
	array16	%g3,	%i5,	%o6
	smul	%i6,	%o5,	%g1
loop_1486:
	orcc	%o4,	0x0695,	%l0
	movcc	%xcc,	%o1,	%g7
	udiv	%l5,	0x19A7,	%l3
	tl	%icc,	0x7
	ldsb	[%l7 + 0x5F],	%i2
	addcc	%o2,	%o0,	%g4
	ldsb	[%l7 + 0x0C],	%i0
	nop
	fitod	%f4,	%f14
	fmovdcs	%xcc,	%f4,	%f20
	srlx	%i4,	0x17,	%g6
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f26
	fxtod	%f26,	%f22
	fcmple16	%f30,	%f20,	%o7
	ldx	[%l7 + 0x58],	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%xcc,	%f7,	%f27
	andncc	%i7,	%l6,	%o3
	ldsw	[%l7 + 0x2C],	%l1
	fmovsvs	%icc,	%f0,	%f9
	edge32l	%i3,	%i1,	%g2
	edge8ln	%l2,	%g5,	%i5
	nop
	setx	0x68477104,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f0
	udivcc	%g3,	0x1BF6,	%i6
	te	%xcc,	0x1
	fpackfix	%f4,	%f3
	andn	%o5,	%o6,	%o4
	fbug,a	%fcc2,	loop_1487
	fexpand	%f11,	%f26
	lduh	[%l7 + 0x28],	%l0
	tsubcc	%g1,	%g7,	%l5
loop_1487:
	mova	%xcc,	%o1,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i2,	%o0,	%g4
	and	%o2,	0x0518,	%i4
	sub	%i0,	%g6,	%o7
	xor	%l4,	%i7,	%o3
	movcc	%icc,	%l6,	%i3
	movrlez	%l1,	0x0D9,	%i1
	nop
	setx loop_1488, %l0, %l1
	jmpl %l1, %l2
	ldsb	[%l7 + 0x4B],	%g2
	call	loop_1489
	nop
	fitos	%f13,	%f7
	fstox	%f7,	%f28
	fxtos	%f28,	%f22
loop_1488:
	array32	%g5,	%i5,	%g3
	sdiv	%i6,	0x0051,	%o5
loop_1489:
	nop
	set	0x35, %g5
	ldstuba	[%l7 + %g5] 0x88,	%o4
	subc	%l0,	%o6,	%g7
	fsrc1s	%f10,	%f28
	tcc	%icc,	0x0
	edge16ln	%g1,	%o1,	%l3
	fmovscs	%icc,	%f27,	%f30
	sra	%i2,	%o0,	%g4
	orcc	%l5,	%o2,	%i0
	tcc	%xcc,	0x5
	fnands	%f4,	%f28,	%f19
	fpsub32	%f4,	%f16,	%f28
	sllx	%g6,	0x11,	%o7
	fzero	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i4,	%l4,	%o3
	sethi	0x03BD,	%l6
	fsrc1s	%f14,	%f13
	sethi	0x1496,	%i7
	alignaddr	%i3,	%l1,	%i1
	tg	%xcc,	0x7
	fcmpgt32	%f30,	%f30,	%g2
	orn	%l2,	0x0D8E,	%g5
	edge16n	%i5,	%i6,	%o5
	bshuffle	%f24,	%f12,	%f22
	sdivx	%g3,	0x06CF,	%l0
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%o4,	%o6
	fmovrdlez	%g1,	%f16,	%f10
	fbo	%fcc1,	loop_1490
	alignaddr	%g7,	%o1,	%i2
	fmovdge	%icc,	%f20,	%f7
	movpos	%icc,	%o0,	%l3
loop_1490:
	sra	%l5,	%g4,	%o2
	and	%i0,	%o7,	%i4
	tsubcctv	%g6,	0x04FE,	%o3
	tneg	%xcc,	0x2
	taddcc	%l6,	%l4,	%i7
	tle	%xcc,	0x1
	fand	%f0,	%f24,	%f4
	mulx	%l1,	%i1,	%g2
	nop
	setx	0x5B6E4D46,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x47DD549E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f15,	%f25
	tne	%icc,	0x5
	fbge	%fcc3,	loop_1491
	sdivx	%i3,	0x0442,	%g5
	bcs	%xcc,	loop_1492
	movl	%icc,	%i5,	%i6
loop_1491:
	array32	%o5,	%g3,	%l0
	movrlz	%l2,	%o6,	%o4
loop_1492:
	bn,pt	%xcc,	loop_1493
	fsrc2s	%f1,	%f29
	move	%xcc,	%g7,	%o1
	swap	[%l7 + 0x0C],	%i2
loop_1493:
	nop
	setx loop_1494, %l0, %l1
	jmpl %l1, %o0
	prefetch	[%l7 + 0x3C],	 0x3
	bcs,a	%icc,	loop_1495
	ta	%xcc,	0x3
loop_1494:
	fpmerge	%f17,	%f13,	%f0
	movcs	%icc,	%l3,	%l5
loop_1495:
	tvs	%icc,	0x5
	tneg	%xcc,	0x2
	fmovrde	%g1,	%f20,	%f14
	edge16	%g4,	%i0,	%o2
	tsubcctv	%o7,	%i4,	%o3
	set	0x2F, %o3
	lduba	[%l7 + %o3] 0x14,	%l6
	fpsub16s	%f7,	%f4,	%f11
	tle	%xcc,	0x7
	bcc	loop_1496
	fbuge,a	%fcc0,	loop_1497
	addcc	%g6,	0x1A41,	%l4
	fabsd	%f30,	%f30
loop_1496:
	movcs	%xcc,	%l1,	%i1
loop_1497:
	orn	%g2,	%i7,	%g5
	set	0x75, %i0
	lduba	[%l7 + %i0] 0x04,	%i5
	fmovrdne	%i3,	%f0,	%f12
	xorcc	%o5,	%g3,	%l0
	orncc	%i6,	0x188E,	%l2
	for	%f16,	%f18,	%f30
	bne	%xcc,	loop_1498
	fpsub16s	%f29,	%f6,	%f27
	subccc	%o4,	%o6,	%o1
	fbul	%fcc2,	loop_1499
loop_1498:
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f4
	srax	%i2,	%o0,	%l3
	nop
	fitos	%f10,	%f13
	fstox	%f13,	%f26
	fxtos	%f26,	%f6
loop_1499:
	nop
	setx	0x47D0975808AD0A51,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f12
	fble,a	%fcc1,	loop_1500
	udivx	%g7,	0x0EBE,	%g1
	fcmpne32	%f12,	%f14,	%g4
	movpos	%icc,	%i0,	%l5
loop_1500:
	movgu	%icc,	%o2,	%i4
	tg	%xcc,	0x6
	fbul	%fcc1,	loop_1501
	fmovrdlz	%o3,	%f8,	%f6
	te	%icc,	0x5
	movcc	%xcc,	%l6,	%g6
loop_1501:
	fsrc2	%f10,	%f30
	sdivcc	%o7,	0x0A75,	%l1
	brlz,a	%l4,	loop_1502
	fornot1s	%f17,	%f19,	%f31
	edge16n	%g2,	%i1,	%i7
	bg,a,pt	%xcc,	loop_1503
loop_1502:
	tcs	%icc,	0x2
	mova	%xcc,	%g5,	%i5
	xnor	%o5,	0x0C0A,	%i3
loop_1503:
	movrlz	%l0,	%g3,	%i6
	nop
	set	0x53, %i5
	ldub	[%l7 + %i5],	%o4
	mulscc	%l2,	0x0A75,	%o6
	edge32ln	%o1,	%i2,	%l3
	lduh	[%l7 + 0x2C],	%g7
	nop
	setx	0xDA7E4CE6A0B00A32,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD141F3AA2B9794A5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f0,	%f10
	fpsub32	%f0,	%f18,	%f16
	tle	%icc,	0x3
	umul	%g1,	%g4,	%i0
	sub	%o0,	0x0D6A,	%o2
	or	%l5,	0x0C1D,	%i4
	tcc	%icc,	0x6
	fmovd	%f2,	%f0
	tle	%xcc,	0x4
	movre	%l6,	%o3,	%o7
	movne	%xcc,	%g6,	%l1
	popc	%g2,	%i1
	ta	%icc,	0x2
	udivcc	%l4,	0x17CB,	%g5
	tpos	%xcc,	0x4
	tneg	%icc,	0x7
	movle	%xcc,	%i7,	%o5
	fnors	%f11,	%f6,	%f2
	smulcc	%i3,	%l0,	%g3
	set	0x1C, %l6
	swapa	[%l7 + %l6] 0x89,	%i6
	nop
	fitod	%f10,	%f4
	fdtox	%f4,	%f10
	movl	%xcc,	%i5,	%l2
	movvc	%xcc,	%o4,	%o1
	bleu,pn	%icc,	loop_1504
	addcc	%i2,	%o6,	%g7
	brgz,a	%l3,	loop_1505
	fcmpeq32	%f2,	%f26,	%g4
loop_1504:
	umul	%g1,	%i0,	%o2
	alignaddr	%o0,	%i4,	%l5
loop_1505:
	or	%o3,	%l6,	%o7
	addcc	%g6,	%l1,	%i1
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x24] %asi,	%g2
	fmovdcs	%icc,	%f31,	%f8
	nop
	setx	loop_1506,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnorcc	%l4,	%i7,	%o5
	nop
	setx	0x101AAC2A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x78C7FA71,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f27,	%f16
	xnor	%g5,	%l0,	%i3
loop_1506:
	udivcc	%i6,	0x0CDD,	%g3
	mulscc	%i5,	0x0807,	%o4
	fmul8x16	%f2,	%f14,	%f4
	movvs	%xcc,	%l2,	%o1
	movvc	%xcc,	%i2,	%g7
	fandnot1	%f20,	%f20,	%f2
	subc	%o6,	%l3,	%g1
	bcc	%icc,	loop_1507
	movvc	%icc,	%g4,	%i0
	edge8	%o0,	%o2,	%l5
	sdivx	%o3,	0x1C52,	%l6
loop_1507:
	bn,a,pn	%icc,	loop_1508
	andcc	%o7,	0x1A5A,	%g6
	fbe,a	%fcc2,	loop_1509
	bvc,a	%icc,	loop_1510
loop_1508:
	te	%xcc,	0x5
	xnor	%i4,	%i1,	%g2
loop_1509:
	edge16n	%l1,	%l4,	%i7
loop_1510:
	xnorcc	%g5,	0x1B71,	%o5
	ba,a,pt	%xcc,	loop_1511
	fbue,a	%fcc0,	loop_1512
	andncc	%l0,	%i3,	%g3
	movge	%xcc,	%i6,	%o4
loop_1511:
	nop
	set	0x56, %i3
	lduh	[%l7 + %i3],	%l2
loop_1512:
	fornot2	%f28,	%f12,	%f26
	bcs	%icc,	loop_1513
	fbge,a	%fcc1,	loop_1514
	edge32ln	%o1,	%i5,	%g7
	bcs,a	%icc,	loop_1515
loop_1513:
	fmovdpos	%xcc,	%f8,	%f23
loop_1514:
	brlez	%o6,	loop_1516
	umul	%i2,	%l3,	%g1
loop_1515:
	nop
	set	0x4F, %o0
	stba	%i0,	[%l7 + %o0] 0x2f
	membar	#Sync
loop_1516:
	tg	%xcc,	0x6
	nop
	setx	0x8A9453E4184F1411,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xF4548B5A4A2EE6CA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f8,	%f28
	add	%l7,	0x54,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%g4,	%o0
	movrlez	%o2,	%o3,	%l6
	edge8	%o7,	%l5,	%i4
	bvc,a,pt	%xcc,	loop_1517
	movcs	%icc,	%g6,	%g2
	ldx	[%l7 + 0x10],	%l1
	mova	%xcc,	%i1,	%i7
loop_1517:
	fnot1	%f24,	%f26
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%g5
	fandnot1s	%f14,	%f5,	%f27
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l4
	nop
	setx	0xC04D6F48,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x6933BEE9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f11,	%f30
	bcc	loop_1518
	st	%f1,	[%l7 + 0x60]
	be,a	%icc,	loop_1519
	sll	%l0,	%o5,	%i3
loop_1518:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x3C] %asi,	%g3
loop_1519:
	fbuge	%fcc1,	loop_1520
	ldub	[%l7 + 0x30],	%i6
	tleu	%xcc,	0x1
	ldsw	[%l7 + 0x10],	%o4
loop_1520:
	fmuld8ulx16	%f29,	%f28,	%f28
	movneg	%icc,	%l2,	%o1
	umul	%g7,	0x1518,	%i5
	array8	%i2,	%l3,	%g1
	udiv	%i0,	0x0487,	%o6
	tn	%xcc,	0x5
	bvs,pn	%icc,	loop_1521
	fabsd	%f20,	%f16
	faligndata	%f18,	%f20,	%f30
	wr	%g0,	0x80,	%asi
	sta	%f23,	[%l7 + 0x0C] %asi
loop_1521:
	mulx	%o0,	0x11A8,	%o2
	tge	%icc,	0x5
	srl	%o3,	0x18,	%g4
	taddcc	%l6,	%l5,	%i4
	fandnot2s	%f17,	%f31,	%f28
	st	%f30,	[%l7 + 0x1C]
	fnands	%f1,	%f30,	%f30
	edge16l	%o7,	%g6,	%l1
	nop
	setx	0x553FEB07,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f25
	smul	%i1,	0x0763,	%i7
	movge	%xcc,	%g2,	%l4
	bn,pn	%icc,	loop_1522
	xor	%g5,	%l0,	%o5
	fabsd	%f14,	%f28
	umulcc	%i3,	0x018E,	%g3
loop_1522:
	bn,a,pt	%xcc,	loop_1523
	popc	%o4,	%i6
	movvs	%xcc,	%l2,	%g7
	fzeros	%f10
loop_1523:
	tn	%xcc,	0x3
	srlx	%i5,	%i2,	%o1
	lduw	[%l7 + 0x08],	%l3
	bcs,a,pn	%xcc,	loop_1524
	nop
	setx	0xAA92D6C568611922,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f28
	movcs	%xcc,	%g1,	%o6
	set	0x70, %o1
	stha	%o0,	[%l7 + %o1] 0x88
loop_1524:
	srl	%i0,	0x1B,	%o3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x72] %asi,	%g4
	edge32	%l6,	%l5,	%o2
	tpos	%icc,	0x5
	brgez,a	%o7,	loop_1525
	stw	%g6,	[%l7 + 0x28]
	fmovsle	%xcc,	%f9,	%f10
	nop
	fitos	%f5,	%f3
	fstox	%f3,	%f26
	fxtos	%f26,	%f15
loop_1525:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu	loop_1526
	orcc	%l1,	0x1AF9,	%i1
	bleu	loop_1527
	movl	%icc,	%i7,	%i4
loop_1526:
	sub	%l4,	0x0B1D,	%g5
	fbue	%fcc2,	loop_1528
loop_1527:
	sllx	%l0,	%o5,	%i3
	tvs	%icc,	0x0
	xnorcc	%g3,	0x1FC1,	%o4
loop_1528:
	movre	%g2,	%l2,	%i6
	tle	%icc,	0x2
	fcmpgt16	%f30,	%f4,	%g7
	edge8l	%i2,	%o1,	%l3
	edge16n	%i5,	%o6,	%g1
	umulcc	%i0,	%o0,	%o3
	tsubcctv	%l6,	%l5,	%g4
	edge8	%o2,	%o7,	%l1
	subccc	%i1,	%g6,	%i4
	fmovsne	%icc,	%f8,	%f7
	sub	%i7,	0x091E,	%g5
	fmovsne	%xcc,	%f7,	%f27
	nop
	fitod	%f3,	%f2
	movneg	%icc,	%l0,	%o5
	sth	%l4,	[%l7 + 0x32]
	movn	%xcc,	%g3,	%i3
	fpsub32s	%f7,	%f29,	%f11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,pn	%xcc,	loop_1529
	fcmple16	%f12,	%f30,	%g2
	umul	%l2,	%i6,	%g7
	subc	%o4,	0x1AA4,	%i2
loop_1529:
	srlx	%l3,	0x1F,	%o1
	tge	%xcc,	0x1
	tg	%icc,	0x1
	fnot1	%f12,	%f22
	set	0x50, %l1
	ldxa	[%l7 + %l1] 0x18,	%i5
	fbe	%fcc3,	loop_1530
	ldsb	[%l7 + 0x5C],	%g1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%o6,	%i0
loop_1530:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f8,	%f0,	%f10
	taddcctv	%o0,	%l6,	%o3
	fmovrdlz	%l5,	%f30,	%f2
	fmovdleu	%xcc,	%f15,	%f31
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o2
	tsubcctv	%o7,	%g4,	%i1
	movrgez	%g6,	0x0AE,	%i4
	tvc	%xcc,	0x0
	fnot2s	%f1,	%f7
	subccc	%l1,	%i7,	%l0
	udivx	%o5,	0x0BB4,	%l4
	srl	%g3,	%g5,	%g2
	call	loop_1531
	tcs	%icc,	0x4
	for	%f4,	%f18,	%f16
	sir	0x0E72
loop_1531:
	fpadd32s	%f7,	%f15,	%f22
	fmovdg	%xcc,	%f10,	%f22
	tge	%icc,	0x1
	wr	%g0,	0x81,	%asi
	stxa	%i3,	[%l7 + 0x08] %asi
	and	%l2,	0x0418,	%i6
	tpos	%xcc,	0x1
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x4E] %asi,	%o4
	fmovsge	%icc,	%f13,	%f19
	tge	%xcc,	0x0
	mova	%xcc,	%i2,	%g7
	sethi	0x0233,	%o1
	tg	%icc,	0x7
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f14
	fxtod	%f14,	%f8
	nop
	fitos	%f6,	%f5
	fstoi	%f5,	%f1
	movcc	%xcc,	%l3,	%g1
	bleu,pt	%xcc,	loop_1532
	nop
	setx	0xC9EA34ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xB55C01B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f15,	%f17
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%i0
loop_1532:
	popc	0x0FDB,	%o0
	edge16n	%l6,	%o6,	%o3
	edge16	%o2,	%o7,	%g4
	tvs	%icc,	0x7
	srl	%i1,	0x13,	%l5
	movge	%xcc,	%i4,	%g6
	fand	%f24,	%f8,	%f16
	edge8l	%i7,	%l0,	%l1
	popc	0x0C62,	%o5
	bpos,pn	%xcc,	loop_1533
	edge16l	%g3,	%g5,	%g2
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1533:
	movne	%xcc,	%l4,	%i3
	fmul8x16au	%f10,	%f25,	%f18
	movpos	%icc,	%l2,	%o4
	fbuge	%fcc1,	loop_1534
	fbe	%fcc0,	loop_1535
	subccc	%i2,	0x02B9,	%i6
	be,pn	%xcc,	loop_1536
loop_1534:
	movre	%o1,	%l3,	%g7
loop_1535:
	edge16l	%g1,	%i0,	%o0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x19,	%i5,	%l6
loop_1536:
	xorcc	%o6,	%o3,	%o7
	tle	%xcc,	0x1
	movneg	%icc,	%o2,	%i1
	edge16l	%l5,	%g4,	%i4
	bneg	loop_1537
	tgu	%icc,	0x4
	mova	%icc,	%g6,	%l0
	edge16l	%l1,	%i7,	%g3
loop_1537:
	bneg,pt	%xcc,	loop_1538
	tne	%xcc,	0x1
	fcmpeq16	%f26,	%f28,	%o5
	edge16ln	%g2,	%g5,	%i3
loop_1538:
	tn	%xcc,	0x5
	edge32	%l4,	%o4,	%l2
	udivx	%i2,	0x0F01,	%i6
	fmovse	%icc,	%f1,	%f31
	nop
	set	0x4F, %g6
	ldsb	[%l7 + %g6],	%l3
	fbu,a	%fcc0,	loop_1539
	udiv	%g7,	0x07E4,	%o1
	fbu	%fcc1,	loop_1540
	fmul8x16al	%f22,	%f11,	%f30
loop_1539:
	or	%i0,	%g1,	%o0
	movn	%icc,	%i5,	%l6
loop_1540:
	nop
	setx	0xCB1E03FF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x9E3172B7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f7,	%f31
	fmovspos	%xcc,	%f21,	%f28
	tl	%xcc,	0x3
	udivcc	%o6,	0x0408,	%o7
	ldstub	[%l7 + 0x39],	%o3
	addccc	%i1,	0x19B6,	%o2
	sethi	0x0656,	%g4
	fmul8x16	%f16,	%f28,	%f26
	orcc	%l5,	%i4,	%g6
	movcs	%icc,	%l1,	%l0
	bne,pt	%icc,	loop_1541
	tleu	%xcc,	0x2
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x5A] %asi,	%g3
loop_1541:
	movrgz	%i7,	0x1E3,	%g2
	fones	%f30
	edge8	%o5,	%g5,	%l4
	xnorcc	%o4,	0x13DE,	%i3
	tcc	%xcc,	0x6
	edge32l	%l2,	%i2,	%l3
	fbu,a	%fcc1,	loop_1542
	sllx	%i6,	0x03,	%o1
	sdivx	%i0,	0x011C,	%g1
	st	%f31,	[%l7 + 0x54]
loop_1542:
	nop
	setx	0x9071942B,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	bgu,a	loop_1543
	sub	%o0,	0x0CF9,	%i5
	brlez,a	%l6,	loop_1544
	fnors	%f15,	%f26,	%f22
loop_1543:
	orncc	%o6,	%o7,	%g7
	nop
	fitos	%f9,	%f13
	fstod	%f13,	%f14
loop_1544:
	edge32ln	%i1,	%o3,	%o2
	fmovdge	%xcc,	%f12,	%f23
	tpos	%xcc,	0x1
	tl	%icc,	0x7
	te	%icc,	0x7
	set	0x2C, %i7
	lduha	[%l7 + %i7] 0x80,	%l5
	tleu	%icc,	0x5
	nop
	fitos	%f0,	%f13
	fstod	%f13,	%f0
	sdiv	%g4,	0x06CF,	%g6
	srl	%i4,	0x1F,	%l1
	fbne	%fcc3,	loop_1545
	fpsub16	%f8,	%f14,	%f2
	ldub	[%l7 + 0x5A],	%l0
	fbo,a	%fcc2,	loop_1546
loop_1545:
	fexpand	%f10,	%f10
	addcc	%g3,	0x0CB4,	%g2
	tcs	%icc,	0x4
loop_1546:
	tle	%xcc,	0x4
	ldsw	[%l7 + 0x10],	%i7
	xorcc	%g5,	%o5,	%o4
	nop
	setx	0x7AB9A0C9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xE4C14D89,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f6,	%f24
	tneg	%icc,	0x2
	umul	%l4,	%l2,	%i2
	addccc	%l3,	0x092B,	%i3
	fxor	%f4,	%f16,	%f6
	brz,a	%i6,	loop_1547
	tsubcctv	%o1,	%i0,	%g1
	fba	%fcc1,	loop_1548
	fbg	%fcc0,	loop_1549
loop_1547:
	sdivx	%o0,	0x1E07,	%l6
	andn	%i5,	%o7,	%g7
loop_1548:
	sdivx	%i1,	0x0284,	%o6
loop_1549:
	fornot2	%f2,	%f12,	%f8
	fcmple32	%f12,	%f22,	%o2
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movleu	%xcc,	%l5,	%o3
	wr	%g0,	0x27,	%asi
	stha	%g4,	[%l7 + 0x52] %asi
	membar	#Sync
	set	0x0C, %o7
	ldswa	[%l7 + %o7] 0x88,	%g6
	flush	%l7 + 0x7C
	tl	%xcc,	0x6
	bvs	%icc,	loop_1550
	fbe,a	%fcc2,	loop_1551
	fmovdge	%icc,	%f14,	%f19
	udiv	%i4,	0x072A,	%l1
loop_1550:
	movgu	%xcc,	%l0,	%g2
loop_1551:
	movpos	%xcc,	%i7,	%g3
	stb	%o5,	[%l7 + 0x4C]
	tg	%xcc,	0x1
	mulx	%g5,	%o4,	%l4
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f22
	fmovs	%f25,	%f1
	fbl,a	%fcc0,	loop_1552
	fble	%fcc2,	loop_1553
	fabsd	%f6,	%f20
	brlez,a	%i2,	loop_1554
loop_1552:
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f4
loop_1553:
	fnegs	%f17,	%f7
	movvc	%icc,	%l2,	%l3
loop_1554:
	tpos	%icc,	0x0
	fmovde	%xcc,	%f4,	%f16
	tcs	%icc,	0x6
	fbuge,a	%fcc3,	loop_1555
	tvc	%icc,	0x7
	edge32l	%i3,	%o1,	%i0
	edge32l	%g1,	%i6,	%o0
loop_1555:
	sub	%l6,	%i5,	%o7
	movre	%i1,	%g7,	%o2
	nop
	setx loop_1556, %l0, %l1
	jmpl %l1, %o6
	sethi	0x0190,	%l5
	movre	%g4,	%g6,	%i4
	movl	%icc,	%l1,	%o3
loop_1556:
	sdiv	%l0,	0x02B5,	%i7
	fmovrsgz	%g2,	%f30,	%f9
	movrlz	%g3,	0x36A,	%g5
	tsubcc	%o4,	%l4,	%i2
	fbug	%fcc2,	loop_1557
	sdiv	%l2,	0x1B4B,	%l3
	tgu	%icc,	0x5
	sdiv	%o5,	0x199B,	%o1
loop_1557:
	fmovdge	%icc,	%f18,	%f4
	subc	%i3,	%i0,	%i6
	bpos,a	loop_1558
	array16	%o0,	%l6,	%i5
	nop
	setx	0x8441BF33287F3E19,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x7B4D7DCDFE63C311,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f8,	%f0
	movcc	%icc,	%o7,	%g1
loop_1558:
	nop
	fitod	%f0,	%f0
	fdtox	%f0,	%f8
	fbne	%fcc3,	loop_1559
	fcmple32	%f20,	%f10,	%i1
	taddcctv	%o2,	%o6,	%g7
	xnor	%l5,	%g6,	%g4
loop_1559:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x54] %asi,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i4,	0x0022,	%o3
	brz,a	%i7,	loop_1560
	fmovd	%f0,	%f2
	bvs	%xcc,	loop_1561
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1560:
	fmovsle	%xcc,	%f13,	%f6
	tl	%icc,	0x7
loop_1561:
	fmovdcc	%icc,	%f26,	%f18
	pdist	%f12,	%f18,	%f24
	bvc	loop_1562
	bgu,a,pn	%icc,	loop_1563
	edge8l	%g2,	%g3,	%l0
	sdivcc	%o4,	0x1446,	%g5
loop_1562:
	edge32n	%l4,	%l2,	%l3
loop_1563:
	ba,a	loop_1564
	sir	0x1EC1
	edge8	%o5,	%o1,	%i3
	bneg,a	loop_1565
loop_1564:
	orncc	%i0,	%i2,	%i6
	nop
	fitod	%f10,	%f20
	fdtoi	%f20,	%f7
	subc	%o0,	0x013D,	%l6
loop_1565:
	sdivcc	%o7,	0x103E,	%g1
	tge	%xcc,	0x1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%o2
	wr	%g0,	0x57,	%asi
	stxa	%i1,	[%g0 + 0x0] %asi
	tvc	%xcc,	0x7
	fmul8x16	%f4,	%f10,	%f16
	sth	%o6,	[%l7 + 0x2C]
	edge16n	%g7,	%l5,	%g6
	fbo	%fcc3,	loop_1566
	orncc	%g4,	%l1,	%i4
	fblg	%fcc0,	loop_1567
	call	loop_1568
loop_1566:
	ldub	[%l7 + 0x18],	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1567:
	movvc	%icc,	%g2,	%o3
loop_1568:
	nop
	set	0x50, %l2
	lduba	[%l7 + %l2] 0x89,	%g3
	movleu	%xcc,	%l0,	%o4
	addc	%g5,	%l2,	%l3
	edge32n	%l4,	%o1,	%i3
	tleu	%icc,	0x0
	fmovsvc	%icc,	%f26,	%f7
	fornot2s	%f5,	%f25,	%f4
	movcc	%icc,	%i0,	%i2
	fcmple16	%f6,	%f20,	%o5
	srax	%i6,	%o0,	%o7
	ldx	[%l7 + 0x60],	%g1
	bl,pn	%xcc,	loop_1569
	edge8	%l6,	%i5,	%o2
	nop
	setx	loop_1570,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tn	%xcc,	0x2
loop_1569:
	orn	%o6,	0x1E95,	%i1
	movrlz	%l5,	%g6,	%g7
loop_1570:
	udivx	%g4,	0x06BF,	%i4
	addcc	%i7,	%l1,	%g2
	udivcc	%o3,	0x10AF,	%l0
	tgu	%xcc,	0x4
	fbu	%fcc3,	loop_1571
	tpos	%xcc,	0x4
	ldsh	[%l7 + 0x78],	%g3
	xnorcc	%o4,	%g5,	%l2
loop_1571:
	subc	%l3,	0x1474,	%l4
	edge16l	%o1,	%i0,	%i2
	sethi	0x1262,	%i3
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x18,	%f16
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x2C] %asi,	%o5
	edge16	%i6,	%o7,	%g1
	movpos	%xcc,	%l6,	%o0
	mulx	%i5,	0x1CA2,	%o6
	fbge	%fcc1,	loop_1572
	add	%i1,	%o2,	%g6
	sethi	0x0590,	%l5
	xorcc	%g7,	0x050B,	%g4
loop_1572:
	tvc	%xcc,	0x7
	addcc	%i7,	0x06D0,	%i4
	brgez,a	%g2,	loop_1573
	brgez,a	%o3,	loop_1574
	fcmpgt32	%f10,	%f8,	%l1
	fbue	%fcc1,	loop_1575
loop_1573:
	mova	%xcc,	%g3,	%o4
loop_1574:
	lduh	[%l7 + 0x7E],	%g5
	movneg	%xcc,	%l0,	%l3
loop_1575:
	ta	%icc,	0x2
	nop
	fitos	%f10,	%f14
	fstod	%f14,	%f18
	srlx	%l2,	0x1C,	%o1
	nop
	setx loop_1576, %l0, %l1
	jmpl %l1, %i0
	movleu	%xcc,	%l4,	%i2
	subcc	%o5,	%i6,	%o7
	fmovdge	%xcc,	%f10,	%f22
loop_1576:
	and	%g1,	0x0CCC,	%l6
	fnands	%f27,	%f5,	%f18
	udivcc	%o0,	0x1404,	%i3
	fxnors	%f22,	%f25,	%f16
	sub	%i5,	0x0EA6,	%i1
	fands	%f20,	%f28,	%f17
	fbe,a	%fcc3,	loop_1577
	lduh	[%l7 + 0x3A],	%o2
	fmovrdlez	%o6,	%f8,	%f26
	wr	%g0,	0x80,	%asi
	sta	%f4,	[%l7 + 0x30] %asi
loop_1577:
	tl	%xcc,	0x5
	fbe,a	%fcc1,	loop_1578
	movrne	%g6,	%l5,	%g7
	fmovs	%f12,	%f5
	fxnors	%f24,	%f21,	%f3
loop_1578:
	edge8l	%i7,	%g4,	%i4
	array32	%o3,	%l1,	%g2
	fpmerge	%f5,	%f6,	%f4
	fbl	%fcc3,	loop_1579
	nop
	fitos	%f3,	%f19
	fstox	%f19,	%f12
	fxtos	%f12,	%f8
	brgez,a	%g3,	loop_1580
	stx	%o4,	[%l7 + 0x28]
loop_1579:
	fmovrdgz	%l0,	%f30,	%f0
	orn	%g5,	%l2,	%o1
loop_1580:
	tn	%icc,	0x5
	set	0x34, %i4
	lduba	[%l7 + %i4] 0x19,	%l3
	movrgz	%i0,	%l4,	%i2
	nop
	setx	0xDFC630DF74354BF3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xA0B84CF83F129F13,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f0,	%f24
	fmovsa	%icc,	%f6,	%f10
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x0D] %asi,	%i6
	edge8ln	%o5,	%g1,	%l6
	fbge,a	%fcc3,	loop_1581
	fmovdcc	%xcc,	%f26,	%f25
	mova	%xcc,	%o0,	%o7
	sllx	%i3,	%i5,	%i1
loop_1581:
	popc	0x0962,	%o2
	tvc	%icc,	0x6
	fbn	%fcc2,	loop_1582
	edge16n	%g6,	%l5,	%o6
	fxor	%f0,	%f0,	%f20
	fornot1	%f14,	%f0,	%f26
loop_1582:
	fbule	%fcc1,	loop_1583
	tge	%icc,	0x4
	brlz,a	%g7,	loop_1584
	tneg	%icc,	0x4
loop_1583:
	nop
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x43] %asi,	%g4
loop_1584:
	tleu	%icc,	0x6
	alignaddr	%i4,	%o3,	%i7
	flush	%l7 + 0x44
	taddcctv	%g2,	0x1930,	%g3
	smul	%l1,	0x1CC2,	%l0
	nop
	set	0x22, %g4
	lduh	[%l7 + %g4],	%g5
	set	0x58, %g7
	ldswa	[%l7 + %g7] 0x14,	%l2
	movle	%xcc,	%o4,	%l3
	movcc	%xcc,	%i0,	%o1
	set	0x08, %i1
	prefetcha	[%l7 + %i1] 0x19,	 0x0
	sdivx	%l4,	0x10FC,	%o5
	edge16	%i6,	%g1,	%o0
	edge16n	%o7,	%l6,	%i3
	te	%icc,	0x4
	umulcc	%i5,	0x1610,	%i1
	fnand	%f6,	%f2,	%f2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o2
	tl	%icc,	0x4
	movge	%icc,	%l5,	%g6
	brz	%g7,	loop_1585
	fxor	%f10,	%f8,	%f24
	tsubcc	%o6,	%i4,	%o3
	wr	%g0,	0x2a,	%asi
	stha	%g4,	[%l7 + 0x4A] %asi
	membar	#Sync
loop_1585:
	array16	%i7,	%g3,	%l1
	edge8	%l0,	%g2,	%g5
	edge8n	%l2,	%o4,	%i0
	bne	%icc,	loop_1586
	umulcc	%l3,	%i2,	%o1
	umul	%l4,	%i6,	%g1
	movrlez	%o0,	%o7,	%l6
loop_1586:
	brlez	%i3,	loop_1587
	subc	%i5,	%o5,	%i1
	movn	%icc,	%o2,	%g6
	fmovrsgz	%g7,	%f17,	%f18
loop_1587:
	nop
	fitos	%f7,	%f9
	fstox	%f9,	%f24
	mulscc	%l5,	%o6,	%o3
	fandnot2s	%f11,	%f10,	%f15
	fmul8x16au	%f16,	%f1,	%f4
	orn	%g4,	0x0A5B,	%i7
	andncc	%i4,	%l1,	%g3
	tgu	%icc,	0x3
	movge	%xcc,	%l0,	%g5
	sllx	%l2,	%g2,	%i0
	edge32	%l3,	%i2,	%o1
	tsubcctv	%l4,	%i6,	%g1
	array8	%o4,	%o0,	%o7
	move	%xcc,	%l6,	%i3
	fornot2s	%f26,	%f12,	%f12
	sll	%o5,	%i1,	%o2
	fsrc1s	%f19,	%f30
	ldsb	[%l7 + 0x10],	%g6
	taddcctv	%g7,	0x024F,	%l5
	fmovdge	%xcc,	%f26,	%f6
	sll	%i5,	0x11,	%o3
	sdivx	%g4,	0x0CDF,	%o6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%i7
	flush	%l7 + 0x54
	alignaddr	%g3,	%l0,	%g5
	tcs	%xcc,	0x4
	alignaddr	%l1,	%l2,	%g2
	orcc	%l3,	0x15F0,	%i0
	fmovd	%f4,	%f20
	mova	%icc,	%i2,	%l4
	edge16	%o1,	%g1,	%i6
	fcmple32	%f0,	%f22,	%o4
	set	0x4D, %g3
	ldsba	[%l7 + %g3] 0x89,	%o0
	move	%xcc,	%l6,	%o7
	fmul8x16al	%f14,	%f13,	%f8
	udiv	%o5,	0x15FB,	%i1
	udiv	%o2,	0x06A8,	%g6
	bcc	loop_1588
	nop
	setx	loop_1589,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movne	%icc,	%g7,	%l5
	edge8ln	%i5,	%o3,	%i3
loop_1588:
	nop
	setx	0xB0703F66,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
loop_1589:
	array16	%o6,	%g4,	%i4
	subc	%i7,	%l0,	%g3
	std	%f22,	[%l7 + 0x20]
	edge8ln	%l1,	%l2,	%g2
	udivcc	%g5,	0x119A,	%l3
	ldx	[%l7 + 0x78],	%i0
	bleu,a,pt	%icc,	loop_1590
	edge16l	%l4,	%o1,	%g1
	fbul,a	%fcc3,	loop_1591
	movne	%icc,	%i6,	%o4
loop_1590:
	fcmpne32	%f14,	%f26,	%o0
	udivcc	%l6,	0x0633,	%o7
loop_1591:
	fcmple32	%f12,	%f10,	%o5
	tsubcc	%i2,	0x1664,	%i1
	fmovrslz	%o2,	%f2,	%f18
	fpadd16s	%f10,	%f13,	%f16
	fmovrdgz	%g6,	%f8,	%f20
	fmovsgu	%xcc,	%f24,	%f0
	sra	%g7,	0x12,	%l5
	fbl	%fcc0,	loop_1592
	addccc	%o3,	0x1278,	%i3
	tg	%xcc,	0x4
	bl,pn	%icc,	loop_1593
loop_1592:
	subcc	%o6,	0x0140,	%g4
	edge16	%i5,	%i7,	%i4
	bl,pn	%icc,	loop_1594
loop_1593:
	sll	%l0,	%l1,	%l2
	movcc	%icc,	%g3,	%g5
	fbn,a	%fcc1,	loop_1595
loop_1594:
	bleu,pn	%icc,	loop_1596
	ba	%xcc,	loop_1597
	movvs	%icc,	%l3,	%i0
loop_1595:
	nop
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x40] %asi,	%l4
loop_1596:
	bl	loop_1598
loop_1597:
	stbar
	movl	%icc,	%o1,	%g1
	sdivcc	%g2,	0x0625,	%i6
loop_1598:
	ldsw	[%l7 + 0x28],	%o4
	fmovrdne	%o0,	%f18,	%f16
	fmul8sux16	%f18,	%f16,	%f30
	movvs	%icc,	%l6,	%o5
	brlez,a	%i2,	loop_1599
	addccc	%i1,	0x0DA9,	%o7
	call	loop_1600
	fmovrsne	%o2,	%f0,	%f12
loop_1599:
	edge8n	%g7,	%g6,	%o3
	tle	%icc,	0x2
loop_1600:
	fcmpgt32	%f24,	%f28,	%l5
	tcs	%icc,	0x1
	nop
	setx	0xD146FFA2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f17
	tcs	%icc,	0x0
	srl	%i3,	0x14,	%o6
	mulscc	%g4,	0x1CFA,	%i7
	add	%i4,	0x0BAF,	%i5
	membar	0x56
	movn	%icc,	%l1,	%l2
	fzeros	%f11
	edge32ln	%l0,	%g3,	%g5
	bl,a,pn	%icc,	loop_1601
	movvs	%xcc,	%l3,	%i0
	nop
	setx	loop_1602,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx loop_1603, %l0, %l1
	jmpl %l1, %l4
loop_1601:
	fmovdn	%xcc,	%f10,	%f24
	fpack16	%f24,	%f27
loop_1602:
	tne	%icc,	0x2
loop_1603:
	fbn	%fcc1,	loop_1604
	membar	0x79
	movgu	%icc,	%g1,	%o1
	smul	%g2,	0x12C7,	%i6
loop_1604:
	ldx	[%l7 + 0x60],	%o0
	ta	%xcc,	0x7
	fmovdpos	%xcc,	%f8,	%f7
	stbar
	movcc	%xcc,	%o4,	%o5
	movcc	%xcc,	%l6,	%i2
	edge32l	%o7,	%o2,	%g7
	bvc,a	loop_1605
	tpos	%icc,	0x4
	sllx	%i1,	%g6,	%o3
	edge32ln	%i3,	%o6,	%g4
loop_1605:
	lduw	[%l7 + 0x64],	%i7
	fbu,a	%fcc3,	loop_1606
	alignaddr	%l5,	%i5,	%l1
	te	%icc,	0x5
	fandnot2s	%f31,	%f15,	%f23
loop_1606:
	umul	%l2,	%l0,	%i4
	movg	%xcc,	%g5,	%l3
	sdiv	%g3,	0x05A7,	%l4
	tne	%xcc,	0x6
	set	0x68, %o2
	ldxa	[%l7 + %o2] 0x10,	%g1
	smul	%i0,	0x0B7F,	%g2
	nop
	set	0x29, %l0
	ldsb	[%l7 + %l0],	%i6
	bpos,pt	%xcc,	loop_1607
	edge16l	%o0,	%o1,	%o5
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x7E] %asi,	%l6
loop_1607:
	edge32	%o4,	%i2,	%o2
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x80] %asi,	%o7
	move	%xcc,	%g7,	%i1
	add	%o3,	0x05DE,	%g6
	fmovse	%xcc,	%f18,	%f26
	alignaddr	%o6,	%i3,	%i7
	membar	0x79
	edge32n	%g4,	%l5,	%i5
	te	%icc,	0x1
	bne,a,pt	%icc,	loop_1608
	sdiv	%l2,	0x1CEC,	%l1
	edge32	%l0,	%g5,	%l3
	fpsub32	%f0,	%f12,	%f2
loop_1608:
	nop
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x50] %asi,	%g3
	membar	0x78
	sdiv	%l4,	0x1EA7,	%i4
	tgu	%xcc,	0x4
	fmovdcc	%icc,	%f14,	%f9
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x52] %asi,	%g1
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f6
	fxtod	%f6,	%f10
	flush	%l7 + 0x28
	bl,a	loop_1609
	sir	0x11A6
	edge16n	%i0,	%i6,	%g2
	movne	%xcc,	%o1,	%o5
loop_1609:
	bvs	%xcc,	loop_1610
	srl	%l6,	%o0,	%o4
	movvs	%icc,	%i2,	%o2
	fmovse	%xcc,	%f2,	%f10
loop_1610:
	ba,a	loop_1611
	movrgez	%o7,	0x11D,	%g7
	sllx	%o3,	%i1,	%g6
	fbo,a	%fcc0,	loop_1612
loop_1611:
	movcs	%xcc,	%o6,	%i7
	sir	0x1347
	udiv	%i3,	0x08D3,	%l5
loop_1612:
	tg	%xcc,	0x5
	move	%icc,	%i5,	%l2
	fsrc2s	%f9,	%f18
	udiv	%g4,	0x1F9E,	%l0
	movcs	%icc,	%l1,	%l3
	nop
	setx loop_1613, %l0, %l1
	jmpl %l1, %g5
	xnorcc	%g3,	0x0F8A,	%i4
	movn	%xcc,	%g1,	%l4
	udivx	%i0,	0x1C08,	%g2
loop_1613:
	sdiv	%o1,	0x18E4,	%i6
	tleu	%xcc,	0x7
	andn	%l6,	%o0,	%o5
	mulx	%i2,	%o4,	%o2
	xnorcc	%g7,	%o7,	%o3
	nop
	fitod	%f11,	%f28
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge8n	%g6,	%o6,	%i7
	array16	%i3,	%l5,	%i1
	tsubcc	%i5,	%l2,	%l0
	subccc	%l1,	%l3,	%g5
	andcc	%g4,	%i4,	%g1
	ble,a,pt	%icc,	loop_1614
	fxors	%f8,	%f30,	%f31
	tle	%icc,	0x7
	xorcc	%g3,	0x03A4,	%i0
loop_1614:
	array32	%l4,	%g2,	%i6
	brz,a	%l6,	loop_1615
	fbule	%fcc3,	loop_1616
	fornot1s	%f16,	%f18,	%f13
	movg	%icc,	%o0,	%o1
loop_1615:
	fmul8x16al	%f11,	%f24,	%f8
loop_1616:
	movgu	%xcc,	%i2,	%o4
	fbug	%fcc0,	loop_1617
	ldstub	[%l7 + 0x17],	%o2
	te	%icc,	0x0
	movleu	%icc,	%g7,	%o5
loop_1617:
	tne	%icc,	0x6
	edge32	%o7,	%o3,	%o6
	xor	%i7,	0x0A15,	%g6
	movleu	%xcc,	%i3,	%i1
	sll	%i5,	%l5,	%l2
	be	%icc,	loop_1618
	mulscc	%l1,	%l0,	%g5
	fmovsgu	%icc,	%f13,	%f15
	sdivx	%l3,	0x084B,	%i4
loop_1618:
	fmovdleu	%icc,	%f6,	%f19
	udivcc	%g1,	0x1FF8,	%g3
	bne,pt	%icc,	loop_1619
	te	%icc,	0x6
	udivcc	%g4,	0x1D4A,	%l4
	xnorcc	%i0,	%g2,	%l6
loop_1619:
	xorcc	%o0,	%o1,	%i2
	movg	%xcc,	%o4,	%i6
	fbl	%fcc0,	loop_1620
	fmul8x16	%f25,	%f12,	%f16
	umulcc	%g7,	%o2,	%o7
	smul	%o3,	0x08AD,	%o5
loop_1620:
	tn	%xcc,	0x3
	tcs	%xcc,	0x4
	xor	%i7,	0x09A0,	%g6
	movle	%xcc,	%o6,	%i3
	edge16l	%i1,	%i5,	%l2
	bne,a,pn	%icc,	loop_1621
	addc	%l1,	%l0,	%l5
	fmovsg	%icc,	%f1,	%f26
	xor	%l3,	%g5,	%i4
loop_1621:
	nop
	setx	0x1CE87D7BA0327591,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xC7BC6462D6BD39AC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f26,	%f4
	stb	%g3,	[%l7 + 0x5E]
	ldx	[%l7 + 0x28],	%g4
	set	0x65, %l5
	stba	%g1,	[%l7 + %l5] 0x2a
	membar	#Sync
	brz	%l4,	loop_1622
	edge8n	%i0,	%l6,	%o0
	stw	%o1,	[%l7 + 0x24]
	xorcc	%i2,	%o4,	%i6
loop_1622:
	fbul	%fcc3,	loop_1623
	call	loop_1624
	fmovdgu	%icc,	%f17,	%f11
	srax	%g2,	0x18,	%g7
loop_1623:
	addc	%o7,	%o3,	%o5
loop_1624:
	edge8	%i7,	%g6,	%o2
	movrne	%o6,	%i3,	%i1
	xor	%i5,	%l1,	%l2
	fzero	%f20
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%l5
	orn	%l3,	%g5,	%i4
	ldd	[%l7 + 0x18],	%g4
	fmovdgu	%icc,	%f3,	%f24
	edge32	%g1,	%g3,	%l4
	sdivx	%l6,	0x0738,	%i0
	edge32	%o0,	%i2,	%o1
	ldd	[%l7 + 0x78],	%f10
	fble	%fcc2,	loop_1625
	ldub	[%l7 + 0x75],	%o4
	movrlez	%i6,	%g7,	%o7
	or	%o3,	0x1B69,	%g2
loop_1625:
	nop
	set	0x1E, %i2
	stha	%o5,	[%l7 + %i2] 0x18
	membar	0x4D
	taddcctv	%g6,	0x1746,	%i7
	fnors	%f4,	%f1,	%f5
	set	0x20, %g1
	sta	%f29,	[%l7 + %g1] 0x11
	ldsh	[%l7 + 0x16],	%o2
	orncc	%i3,	0x1338,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%i5,	%f14,	%f28
	fmovd	%f20,	%f12
	nop
	setx loop_1626, %l0, %l1
	jmpl %l1, %l1
	movneg	%icc,	%l2,	%l0
	fxors	%f18,	%f8,	%f10
	set	0x50, %l4
	ldsba	[%l7 + %l4] 0x81,	%l5
loop_1626:
	tsubcc	%l3,	0x1290,	%g5
	srax	%i4,	0x1F,	%i1
	xorcc	%g4,	%g3,	%l4
	srl	%l6,	0x15,	%g1
	fmuld8ulx16	%f25,	%f6,	%f20
	fmovrdne	%o0,	%f12,	%f4
	tcs	%xcc,	0x0
	fnot2s	%f0,	%f10
	sethi	0x1AE0,	%i0
	fnot1	%f12,	%f30
	add	%i2,	0x1874,	%o1
	sub	%o4,	%i6,	%o7
	movl	%xcc,	%g7,	%g2
	edge16l	%o5,	%g6,	%o3
	tne	%xcc,	0x2
	edge32	%o2,	%i3,	%o6
	smulcc	%i5,	%i7,	%l2
	sub	%l0,	0x0819,	%l1
	sllx	%l5,	%g5,	%i4
	movg	%xcc,	%l3,	%g4
	movrgz	%g3,	0x2E7,	%l4
	nop
	fitos	%f14,	%f0
	fstox	%f0,	%f26
	edge8l	%i1,	%l6,	%o0
	membar	0x0E
	sllx	%i0,	%g1,	%o1
	orcc	%i2,	0x15A4,	%i6
	set	0x08, %o4
	swapa	[%l7 + %o4] 0x04,	%o7
	ldsh	[%l7 + 0x3A],	%g7
	swap	[%l7 + 0x78],	%o4
	movrlez	%g2,	0x0E3,	%o5
	edge8n	%g6,	%o3,	%o2
	edge16ln	%i3,	%o6,	%i5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i7,	%l0
	movpos	%icc,	%l1,	%l5
	fmovsvc	%icc,	%f17,	%f24
	lduh	[%l7 + 0x50],	%g5
	array16	%i4,	%l3,	%l2
	fmovdneg	%icc,	%f14,	%f19
	orncc	%g3,	%l4,	%g4
	fnot2	%f24,	%f28
	st	%f0,	[%l7 + 0x78]
	subc	%l6,	0x0C7C,	%i1
	xnorcc	%o0,	%i0,	%o1
	fnot1	%f30,	%f26
	smulcc	%g1,	0x189D,	%i6
	addccc	%o7,	0x0320,	%i2
	srlx	%g7,	0x0D,	%o4
	tn	%xcc,	0x7
	edge32	%o5,	%g6,	%o3
	fornot2s	%f15,	%f13,	%f24
	umul	%g2,	0x04AD,	%i3
	addc	%o2,	0x10E5,	%i5
	tgu	%icc,	0x4
	sub	%o6,	0x1092,	%l0
	movleu	%icc,	%l1,	%i7
	movrgz	%g5,	0x168,	%i4
	andn	%l5,	0x1B14,	%l3
	ldstub	[%l7 + 0x4E],	%g3
	andcc	%l4,	%g4,	%l2
	movpos	%icc,	%l6,	%o0
	udivcc	%i1,	0x00D5,	%o1
	sdivx	%i0,	0x0456,	%g1
	bl,a	loop_1627
	movgu	%xcc,	%o7,	%i2
	fnot1	%f0,	%f2
	fmovdcs	%icc,	%f5,	%f30
loop_1627:
	call	loop_1628
	edge16n	%i6,	%o4,	%g7
	tsubcc	%g6,	%o3,	%g2
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f22
	fxtod	%f22,	%f14
loop_1628:
	fblg,a	%fcc2,	loop_1629
	addc	%i3,	0x1E59,	%o2
	orn	%o5,	%o6,	%l0
	sll	%i5,	%l1,	%i7
loop_1629:
	fcmple32	%f0,	%f16,	%g5
	srl	%i4,	0x0F,	%l5
	edge32	%g3,	%l4,	%l3
	edge16ln	%l2,	%g4,	%l6
	stx	%o0,	[%l7 + 0x08]
	set	0x5C, %l3
	lduba	[%l7 + %l3] 0x0c,	%i1
	ldd	[%l7 + 0x48],	%f12
	movcc	%icc,	%i0,	%g1
	udiv	%o7,	0x0589,	%o1
	ldsb	[%l7 + 0x20],	%i6
	fmovscs	%xcc,	%f22,	%f12
	fmovrsgz	%i2,	%f19,	%f7
	brlz	%o4,	loop_1630
	sdiv	%g6,	0x0123,	%g7
	fmovrdlez	%g2,	%f28,	%f14
	swap	[%l7 + 0x60],	%i3
loop_1630:
	movvc	%xcc,	%o3,	%o5
	fexpand	%f20,	%f24
	fmul8sux16	%f2,	%f24,	%f4
	nop
	fitod	%f8,	%f20
	fdtos	%f20,	%f5
	xnorcc	%o6,	%l0,	%o2
	fornot2	%f14,	%f10,	%f12
	taddcc	%i5,	%i7,	%g5
	tg	%icc,	0x2
	fexpand	%f8,	%f30
	fmovsleu	%icc,	%f10,	%f3
	addcc	%l1,	%l5,	%g3
	srlx	%l4,	%i4,	%l3
	nop
	setx	loop_1631,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32	%l2,	%g4,	%o0
	nop
	fitos	%f7,	%f13
	fstox	%f13,	%f20
	lduw	[%l7 + 0x58],	%l6
loop_1631:
	fand	%f8,	%f18,	%f12
	xor	%i1,	0x0BFB,	%i0
	lduh	[%l7 + 0x08],	%o7
	set	0x50, %i6
	ldda	[%l7 + %i6] 0xe2,	%o0
	taddcctv	%g1,	%i6,	%o4
	sethi	0x185B,	%i2
	andncc	%g7,	%g2,	%i3
	fpsub16s	%f19,	%f23,	%f15
	bge	loop_1632
	fmovspos	%icc,	%f0,	%f5
	tsubcctv	%g6,	0x1A00,	%o3
	fmovrde	%o6,	%f4,	%f28
loop_1632:
	brgz	%o5,	loop_1633
	fbul	%fcc3,	loop_1634
	fbuge	%fcc2,	loop_1635
	fcmpne32	%f6,	%f26,	%l0
loop_1633:
	bpos,a,pt	%xcc,	loop_1636
loop_1634:
	fba	%fcc3,	loop_1637
loop_1635:
	fbu	%fcc3,	loop_1638
	fmovrslez	%o2,	%f19,	%f10
loop_1636:
	movl	%xcc,	%i7,	%g5
loop_1637:
	nop
	fitos	%f10,	%f4
	fstod	%f4,	%f10
loop_1638:
	andcc	%l1,	0x062D,	%i5
	brnz	%l5,	loop_1639
	fmovdvc	%icc,	%f18,	%f13
	popc	%g3,	%l4
	xor	%i4,	%l2,	%g4
loop_1639:
	edge32l	%l3,	%l6,	%i1
	edge16ln	%i0,	%o7,	%o0
	sethi	0x1C96,	%o1
	smul	%i6,	%g1,	%i2
	movpos	%xcc,	%g7,	%o4
	movrgz	%g2,	0x13F,	%g6
	tsubcc	%i3,	%o6,	%o3
	movgu	%xcc,	%o5,	%l0
	bcs,a,pt	%xcc,	loop_1640
	movn	%icc,	%i7,	%g5
	membar	0x6C
	bne	loop_1641
loop_1640:
	andn	%l1,	%i5,	%l5
	ble,a,pt	%icc,	loop_1642
	subccc	%o2,	%g3,	%i4
loop_1641:
	tcc	%xcc,	0x0
	movgu	%xcc,	%l4,	%l2
loop_1642:
	fcmpne16	%f22,	%f8,	%g4
	mulscc	%l3,	%i1,	%i0
	fbul,a	%fcc1,	loop_1643
	subc	%l6,	%o0,	%o7
	alignaddrl	%i6,	%o1,	%i2
	nop
	setx loop_1644, %l0, %l1
	jmpl %l1, %g1
loop_1643:
	ta	%icc,	0x4
	movvs	%xcc,	%g7,	%g2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g6,	%o4
loop_1644:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%o3
	fmovsvc	%xcc,	%f3,	%f7
	nop
	setx loop_1645, %l0, %l1
	jmpl %l1, %o5
	movn	%xcc,	%o6,	%l0
	movne	%icc,	%g5,	%l1
	array16	%i5,	%i7,	%l5
loop_1645:
	nop
	set	0x32, %o5
	stha	%g3,	[%l7 + %o5] 0x04
	andncc	%o2,	%i4,	%l2
	sdivcc	%g4,	0x1A6D,	%l4
	alignaddrl	%l3,	%i0,	%l6
	nop
	fitos	%f2,	%f26
	fstoi	%f26,	%f17
	mulx	%o0,	%i1,	%o7
	fmovdn	%xcc,	%f7,	%f20
	mova	%icc,	%i6,	%o1
	orcc	%g1,	0x0D82,	%g7
	nop
	setx	0x1C4318BB1059995A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	movrgez	%g2,	%g6,	%i2
	mulscc	%i3,	%o4,	%o5
	tgu	%icc,	0x2
	fornot1	%f22,	%f26,	%f14
	set	0x36, %g5
	lduha	[%l7 + %g5] 0x0c,	%o6
	fnegd	%f6,	%f28
	movcc	%xcc,	%o3,	%l0
	tn	%xcc,	0x3
	fnot2s	%f10,	%f5
	nop
	setx	0xCF8240411EF78FE3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f26
	sra	%g5,	0x04,	%i5
	nop
	setx loop_1646, %l0, %l1
	jmpl %l1, %i7
	std	%f14,	[%l7 + 0x10]
	edge8ln	%l5,	%g3,	%l1
	movrgz	%o2,	0x085,	%i4
loop_1646:
	edge32l	%l2,	%g4,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l3,	0x06,	%i0
	fbl	%fcc3,	loop_1647
	sir	0x0774
	bvc	loop_1648
	tge	%icc,	0x6
loop_1647:
	tl	%icc,	0x1
	std	%f30,	[%l7 + 0x50]
loop_1648:
	sir	0x0D05
	movl	%xcc,	%l6,	%o0
	taddcc	%i1,	%o7,	%i6
	movcs	%xcc,	%o1,	%g1
	ta	%xcc,	0x3
	movrgez	%g2,	%g7,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i3,	%o4,	%g6
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o5
	sdivcc	%o3,	0x1633,	%o6
	movn	%icc,	%l0,	%i5
	fbl,a	%fcc3,	loop_1649
	movrlz	%g5,	%i7,	%l5
	bpos,a	%xcc,	loop_1650
	tne	%xcc,	0x4
loop_1649:
	sub	%l1,	0x0A00,	%o2
	addcc	%g3,	0x18E1,	%l2
loop_1650:
	xor	%i4,	%g4,	%l4
	tcs	%xcc,	0x7
	bgu,a,pt	%xcc,	loop_1651
	lduh	[%l7 + 0x1A],	%l3
	edge16n	%l6,	%o0,	%i1
	andncc	%o7,	%i6,	%i0
loop_1651:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%g1
	fmovscc	%xcc,	%f23,	%f29
	taddcc	%g7,	%g2,	%i3
	fmovrse	%i2,	%f0,	%f15
	edge16l	%o4,	%g6,	%o3
	fmovsge	%icc,	%f15,	%f9
	addccc	%o5,	0x1EF0,	%l0
	mulscc	%i5,	%g5,	%i7
	fnegd	%f0,	%f2
	fmovdcs	%icc,	%f26,	%f18
	tneg	%icc,	0x0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x54] %asi,	%l5
	andncc	%l1,	%o2,	%o6
	edge16	%l2,	%i4,	%g3
	nop
	fitod	%f3,	%f28
	fmovsvc	%icc,	%f15,	%f27
	nop
	fitos	%f6,	%f9
	fstod	%f9,	%f4
	movleu	%xcc,	%l4,	%l3
	stx	%g4,	[%l7 + 0x68]
	fmovsvs	%icc,	%f8,	%f22
	fandnot1	%f0,	%f18,	%f26
	bvc,a	%xcc,	loop_1652
	swap	[%l7 + 0x50],	%o0
	brgz,a	%i1,	loop_1653
	movgu	%icc,	%o7,	%i6
loop_1652:
	udivx	%i0,	0x042A,	%l6
	movge	%xcc,	%g1,	%g7
loop_1653:
	fmovdg	%xcc,	%f31,	%f22
	subccc	%o1,	%g2,	%i3
	tgu	%icc,	0x4
	bn,a,pt	%icc,	loop_1654
	edge8n	%o4,	%g6,	%o3
	nop
	setx	0xCCBE4EA9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f23
	tsubcctv	%o5,	0x0543,	%l0
loop_1654:
	nop
	wr	%g0,	0x80,	%asi
	stba	%i2,	[%l7 + 0x33] %asi
	sub	%g5,	0x0A8C,	%i7
	nop
	setx	0x029464CD14982203,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x78A3C72E5C0B4BAC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f20,	%f0
	fmovrdlz	%i5,	%f2,	%f30
	set	0x5B, %o3
	lduba	[%l7 + %o3] 0x0c,	%l5
	movleu	%xcc,	%l1,	%o6
	fbn	%fcc0,	loop_1655
	movvc	%icc,	%o2,	%i4
	bleu,pt	%xcc,	loop_1656
	fmul8ulx16	%f26,	%f12,	%f16
loop_1655:
	fxnor	%f18,	%f22,	%f30
	edge8	%g3,	%l2,	%l3
loop_1656:
	bvc,pn	%icc,	loop_1657
	nop
	setx	loop_1658,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8ln	%l4,	%g4,	%o0
	edge32n	%i1,	%o7,	%i6
loop_1657:
	tg	%icc,	0x0
loop_1658:
	fmovdg	%icc,	%f22,	%f0
	movl	%icc,	%i0,	%g1
	movneg	%icc,	%g7,	%l6
	membar	0x01
	andcc	%g2,	%i3,	%o4
	movvc	%xcc,	%g6,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o3,	%o5
	movle	%icc,	%l0,	%g5
	or	%i2,	%i5,	%i7
	xnor	%l5,	%l1,	%o2
	movpos	%icc,	%i4,	%g3
	movrgez	%o6,	0x20C,	%l3
	brnz,a	%l2,	loop_1659
	fmovrslez	%l4,	%f8,	%f18
	te	%icc,	0x4
	bcc,a,pn	%xcc,	loop_1660
loop_1659:
	nop
	setx	0x00CB92315754A58D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x0B983A7A9216B932,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f6,	%f8
	movvs	%xcc,	%g4,	%i1
	bne	%icc,	loop_1661
loop_1660:
	fpack16	%f20,	%f15
	fmovs	%f8,	%f29
	ta	%xcc,	0x1
loop_1661:
	array32	%o0,	%o7,	%i0
	subccc	%i6,	0x08C7,	%g1
	tn	%icc,	0x4
	fmovsne	%icc,	%f28,	%f13
	bvc,a,pt	%xcc,	loop_1662
	tpos	%icc,	0x5
	xorcc	%l6,	%g2,	%g7
	flush	%l7 + 0x58
loop_1662:
	edge16ln	%i3,	%o4,	%o1
	edge32	%g6,	%o3,	%o5
	tg	%icc,	0x6
	move	%icc,	%g5,	%l0
	fmul8ulx16	%f28,	%f12,	%f4
	tvc	%icc,	0x6
	array16	%i2,	%i5,	%i7
	lduw	[%l7 + 0x10],	%l5
	tgu	%xcc,	0x1
	lduh	[%l7 + 0x54],	%o2
	wr	%g0,	0x80,	%asi
	stxa	%l1,	[%l7 + 0x70] %asi
	taddcctv	%i4,	%o6,	%g3
	srlx	%l3,	0x15,	%l2
	movn	%xcc,	%l4,	%g4
	movn	%icc,	%i1,	%o0
	array16	%i0,	%o7,	%i6
	nop
	setx	0xEDB0D9B42075FC6D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fmovsneg	%icc,	%f3,	%f16
	tl	%icc,	0x3
	fbl	%fcc1,	loop_1663
	nop
	setx	loop_1664,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brlez,a	%l6,	loop_1665
	st	%f13,	[%l7 + 0x14]
loop_1663:
	ldstub	[%l7 + 0x45],	%g1
loop_1664:
	addcc	%g2,	%g7,	%o4
loop_1665:
	movvs	%xcc,	%i3,	%g6
	fzero	%f14
	edge8n	%o1,	%o5,	%o3
	add	%g5,	0x1FBB,	%i2
	fmovdcc	%icc,	%f23,	%f9
	nop
	setx	0xB52C3A12A07C7245,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	bleu,a	loop_1666
	fbue,a	%fcc3,	loop_1667
	nop
	setx loop_1668, %l0, %l1
	jmpl %l1, %i5
	tpos	%icc,	0x7
loop_1666:
	tgu	%xcc,	0x1
loop_1667:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1668:
	nop
	fitos	%f29,	%f6
	movrlz	%l0,	%i7,	%l5
	subc	%l1,	%i4,	%o2
	nop
	setx	0x27A52825,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x8675E8DE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f20,	%f4
	movpos	%icc,	%g3,	%o6
	bne	%icc,	loop_1669
	fmovscc	%xcc,	%f3,	%f11
	edge32l	%l2,	%l3,	%l4
	tl	%xcc,	0x1
loop_1669:
	fmul8x16	%f10,	%f18,	%f16
	tn	%icc,	0x5
	fmovsn	%icc,	%f18,	%f6
	fcmpeq32	%f26,	%f2,	%i1
	lduh	[%l7 + 0x74],	%g4
	sra	%o0,	0x03,	%i0
	nop
	set	0x7E, %i0
	lduh	[%l7 + %i0],	%o7
	movrgez	%i6,	%g1,	%g2
	movrgz	%g7,	0x38A,	%l6
	wr	%g0,	0x81,	%asi
	stha	%i3,	[%l7 + 0x48] %asi
	fsrc2	%f0,	%f30
	set	0x71, %i5
	ldsba	[%l7 + %i5] 0x19,	%g6
	movrgz	%o1,	%o4,	%o3
	edge16ln	%g5,	%o5,	%i2
	sdiv	%l0,	0x0409,	%i7
	bn,pn	%icc,	loop_1670
	fmovrdlez	%l5,	%f6,	%f20
	fmovse	%xcc,	%f26,	%f12
	tcs	%xcc,	0x6
loop_1670:
	alignaddr	%l1,	%i5,	%i4
	tn	%xcc,	0x3
	udivx	%g3,	0x1744,	%o6
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%o2
	orn	%l3,	%l2,	%i1
	fbl	%fcc3,	loop_1671
	edge8ln	%g4,	%l4,	%o0
	sdivcc	%i0,	0x1D53,	%i6
	nop
	setx	0x0877CD9E98C53C34,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f10
loop_1671:
	flush	%l7 + 0x54
	fabss	%f21,	%f21
	movvs	%xcc,	%o7,	%g2
	fbn,a	%fcc0,	loop_1672
	tsubcctv	%g7,	0x1FD0,	%l6
	xnor	%g1,	0x098A,	%g6
	subccc	%o1,	0x13C8,	%i3
loop_1672:
	fornot2	%f6,	%f18,	%f26
	fbuge,a	%fcc1,	loop_1673
	edge8l	%o4,	%o3,	%g5
	fbl	%fcc3,	loop_1674
	andncc	%o5,	%i2,	%l0
loop_1673:
	te	%icc,	0x2
	membar	0x25
loop_1674:
	move	%xcc,	%l5,	%l1
	sll	%i7,	0x08,	%i5
	fbue	%fcc1,	loop_1675
	fxnor	%f10,	%f30,	%f26
	fnegs	%f7,	%f18
	nop
	setx	loop_1676,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1675:
	tg	%icc,	0x0
	sra	%i4,	%o6,	%o2
	movrgz	%l3,	%l2,	%i1
loop_1676:
	move	%icc,	%g4,	%g3
	ble,a	%xcc,	loop_1677
	edge8ln	%l4,	%o0,	%i0
	mova	%icc,	%i6,	%g2
	bneg	%xcc,	loop_1678
loop_1677:
	movcs	%xcc,	%o7,	%g7
	edge16n	%l6,	%g1,	%o1
	orcc	%i3,	%g6,	%o4
loop_1678:
	move	%icc,	%o3,	%g5
	sllx	%i2,	0x16,	%l0
	tn	%icc,	0x7
	edge8n	%o5,	%l5,	%i7
	fbuge,a	%fcc3,	loop_1679
	nop
	fitod	%f4,	%f22
	fdtoi	%f22,	%f28
	fandnot2s	%f24,	%f3,	%f11
	movrlez	%l1,	0x099,	%i4
loop_1679:
	movrlz	%o6,	%i5,	%l3
	lduh	[%l7 + 0x36],	%l2
	fbule,a	%fcc3,	loop_1680
	subcc	%i1,	0x19CC,	%o2
	bne,pn	%xcc,	loop_1681
	membar	0x51
loop_1680:
	fbu,a	%fcc1,	loop_1682
	movpos	%xcc,	%g3,	%g4
loop_1681:
	movrlez	%l4,	0x169,	%i0
	srax	%i6,	0x0C,	%g2
loop_1682:
	fbu	%fcc0,	loop_1683
	srax	%o7,	%o0,	%l6
	sub	%g1,	0x128E,	%o1
	umul	%g7,	0x1392,	%g6
loop_1683:
	andncc	%o4,	%o3,	%g5
	ldub	[%l7 + 0x43],	%i3
	fpsub32s	%f24,	%f21,	%f14
	swap	[%l7 + 0x24],	%l0
	brnz,a	%i2,	loop_1684
	tcs	%xcc,	0x4
	sdivcc	%o5,	0x07ED,	%l5
	bvs,a,pt	%icc,	loop_1685
loop_1684:
	edge16ln	%i7,	%i4,	%l1
	tvc	%icc,	0x5
	tsubcctv	%i5,	%o6,	%l3
loop_1685:
	and	%i1,	%o2,	%l2
	array16	%g4,	%l4,	%g3
	fmovrse	%i6,	%f17,	%f23
	bvs,a	loop_1686
	xor	%g2,	%i0,	%o7
	ldub	[%l7 + 0x25],	%o0
	orn	%l6,	%g1,	%o1
loop_1686:
	smul	%g6,	0x0573,	%o4
	array8	%o3,	%g7,	%i3
	sir	0x104C
	fnor	%f16,	%f6,	%f24
	fmovdleu	%icc,	%f16,	%f11
	sdivx	%l0,	0x07F3,	%g5
	ldx	[%l7 + 0x30],	%o5
	fnot2	%f18,	%f18
	add	%l5,	0x04AA,	%i7
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x28] %asi,	%i4
	wr	%g0,	0xea,	%asi
	stxa	%i2,	[%l7 + 0x68] %asi
	membar	#Sync
	wr	%g0,	0x89,	%asi
	stwa	%i5,	[%l7 + 0x14] %asi
	fmovdcs	%icc,	%f0,	%f3
	sethi	0x000E,	%l1
	ldsb	[%l7 + 0x0F],	%o6
	tg	%xcc,	0x4
	umul	%l3,	%o2,	%l2
	taddcctv	%g4,	0x1EC3,	%l4
	nop
	fitos	%f7,	%f12
	fstod	%f12,	%f10
	udivcc	%i1,	0x0FF2,	%g3
	nop
	setx	0xB06E828C,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	fmovd	%f12,	%f10
	fbug	%fcc1,	loop_1687
	fmovda	%icc,	%f15,	%f28
	fmul8x16au	%f8,	%f12,	%f30
	andncc	%i6,	%g2,	%o7
loop_1687:
	srax	%i0,	%o0,	%l6
	tcc	%icc,	0x1
	add	%l7,	0x74,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%g1
	movvs	%xcc,	%g6,	%o4
	fbug	%fcc3,	loop_1688
	tvs	%xcc,	0x1
	st	%f28,	[%l7 + 0x3C]
	set	0x64, %l6
	stha	%g7,	[%l7 + %l6] 0x27
	membar	#Sync
loop_1688:
	nop
	wr	%g0,	0x27,	%asi
	stha	%o3,	[%l7 + 0x74] %asi
	membar	#Sync
	movge	%xcc,	%l0,	%g5
	fone	%f14
	st	%f5,	[%l7 + 0x74]
	fbul,a	%fcc1,	loop_1689
	tge	%xcc,	0x2
	movg	%xcc,	%o5,	%l5
	movle	%xcc,	%i7,	%i3
loop_1689:
	st	%f13,	[%l7 + 0x30]
	xor	%i4,	%i2,	%i5
	fpackfix	%f14,	%f4
	brz	%l1,	loop_1690
	smulcc	%o6,	0x12EF,	%l3
	ble,pn	%icc,	loop_1691
	add	%o2,	0x1CA7,	%g4
loop_1690:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x69] %asi,	%l2
loop_1691:
	nop
	setx	0x62E4A42F4F5FD65D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xA3846026202A6DD4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f20,	%f20
	sub	%i1,	%l4,	%g3
	edge8	%i6,	%g2,	%i0
	ba,pn	%xcc,	loop_1692
	nop
	setx	loop_1693,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%icc,	0x7
	tleu	%xcc,	0x1
loop_1692:
	movcc	%icc,	%o7,	%o0
loop_1693:
	lduh	[%l7 + 0x64],	%l6
	sll	%g1,	%o1,	%o4
	tvs	%icc,	0x5
	nop
	setx loop_1694, %l0, %l1
	jmpl %l1, %g7
	tg	%icc,	0x0
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
loop_1694:
	sethi	0x15EA,	%l0
	movpos	%xcc,	%g6,	%o5
	movre	%g5,	%i7,	%l5
	alignaddr	%i4,	%i3,	%i2
	bleu	loop_1695
	movn	%xcc,	%l1,	%o6
	ldstub	[%l7 + 0x0E],	%i5
	nop
	setx	0x7E2B825ABAEE3143,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x6A95FFEBBCD3BA6C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f8,	%f28
loop_1695:
	srl	%o2,	0x10,	%g4
	fpadd16	%f0,	%f2,	%f22
	fsrc1s	%f4,	%f9
	addccc	%l3,	%i1,	%l2
	ldd	[%l7 + 0x10],	%l4
	ta	%xcc,	0x3
	nop
	set	0x3C, %i3
	sth	%i6,	[%l7 + %i3]
	sll	%g2,	%i0,	%g3
	mulx	%o0,	%l6,	%g1
	subccc	%o7,	0x08AD,	%o4
	tn	%icc,	0x0
	fmovrsne	%o1,	%f27,	%f30
	edge32	%o3,	%l0,	%g6
	fcmpeq32	%f16,	%f20,	%g7
	edge32n	%o5,	%g5,	%i7
	edge32ln	%l5,	%i3,	%i4
	fmovdcs	%icc,	%f18,	%f18
	set	0x0B, %g2
	lduba	[%l7 + %g2] 0x0c,	%i2
	nop
	setx	0x50643B53,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	fors	%f15,	%f4,	%f9
	edge8l	%o6,	%l1,	%i5
	andcc	%o2,	%l3,	%i1
	fbn,a	%fcc1,	loop_1696
	fnands	%f28,	%f13,	%f14
	movneg	%icc,	%g4,	%l2
	alignaddr	%i6,	%g2,	%l4
loop_1696:
	ldd	[%l7 + 0x70],	%f22
	edge8ln	%i0,	%g3,	%l6
	fbl,a	%fcc0,	loop_1697
	movgu	%icc,	%o0,	%g1
	edge16n	%o4,	%o1,	%o7
	tleu	%icc,	0x4
loop_1697:
	fabss	%f10,	%f23
	sdivx	%l0,	0x1997,	%g6
	movleu	%icc,	%g7,	%o3
	taddcctv	%g5,	0x001A,	%o5
	edge16ln	%l5,	%i7,	%i4
	sir	0x0B2E
	membar	0x3B
	edge32l	%i2,	%i3,	%l1
	bshuffle	%f8,	%f0,	%f2
	bvs,pn	%xcc,	loop_1698
	fnot1s	%f13,	%f14
	xor	%o6,	%o2,	%i5
	wr	%g0,	0x04,	%asi
	stxa	%l3,	[%l7 + 0x40] %asi
loop_1698:
	te	%icc,	0x1
	movvc	%icc,	%g4,	%l2
	set	0x64, %o1
	lduwa	[%l7 + %o1] 0x04,	%i6
	subcc	%g2,	0x11EC,	%l4
	fmovdl	%xcc,	%f25,	%f18
	orcc	%i0,	0x05BE,	%i1
	movleu	%xcc,	%l6,	%o0
	fmovdl	%xcc,	%f1,	%f29
	xnorcc	%g1,	%o4,	%o1
	sir	0x0ECD
	movl	%icc,	%g3,	%o7
	subc	%l0,	0x137B,	%g7
	mulscc	%g6,	%g5,	%o5
	nop
	setx	0xD5573078,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x862411DE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f22,	%f22
	tle	%xcc,	0x3
	nop
	setx	loop_1699,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%l5,	0x2D6,	%i7
	edge8n	%i4,	%o3,	%i3
	fcmpeq16	%f2,	%f4,	%i2
loop_1699:
	fmovda	%xcc,	%f11,	%f0
	fors	%f20,	%f25,	%f17
	fone	%f2
	movleu	%xcc,	%o6,	%l1
	fmovrdgez	%i5,	%f10,	%f0
	edge16ln	%o2,	%g4,	%l2
	sdivcc	%i6,	0x0BC1,	%l3
	fxnors	%f11,	%f23,	%f25
	movvs	%xcc,	%g2,	%l4
	fmovscs	%icc,	%f1,	%f27
	sethi	0x15B7,	%i0
	taddcc	%l6,	%o0,	%g1
	movvs	%xcc,	%i1,	%o4
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x89,	%g3
	orn	%o7,	%l0,	%g7
	fpackfix	%f28,	%f27
	brgz	%o1,	loop_1700
	bcs,a	%icc,	loop_1701
	mulx	%g5,	0x1768,	%o5
	udivx	%g6,	0x072F,	%i7
loop_1700:
	sdiv	%i4,	0x0663,	%l5
loop_1701:
	nop
	wr	%g0,	0xe2,	%asi
	stwa	%i3,	[%l7 + 0x20] %asi
	membar	#Sync
	array32	%i2,	%o3,	%l1
	tsubcc	%o6,	%o2,	%i5
	fcmple32	%f18,	%f0,	%l2
	fnands	%f12,	%f14,	%f18
	tvs	%xcc,	0x2
	edge32n	%i6,	%l3,	%g4
	fnot2	%f16,	%f30
	fnors	%f2,	%f20,	%f24
	stb	%g2,	[%l7 + 0x23]
	movgu	%icc,	%i0,	%l4
	mova	%xcc,	%l6,	%g1
	movn	%xcc,	%i1,	%o4
	fmul8sux16	%f18,	%f20,	%f26
	orncc	%g3,	%o7,	%l0
	tneg	%xcc,	0x5
	movre	%g7,	0x2C8,	%o0
	srl	%o1,	0x0C,	%g5
	movrgz	%g6,	%o5,	%i7
	edge16	%l5,	%i3,	%i2
	andn	%o3,	%l1,	%i4
	brnz	%o2,	loop_1702
	addccc	%o6,	%i5,	%l2
	tg	%xcc,	0x5
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
loop_1702:
	andn	%g4,	%g2,	%i6
	fcmple32	%f8,	%f6,	%l4
	swap	[%l7 + 0x48],	%i0
	fba	%fcc0,	loop_1703
	tvc	%xcc,	0x2
	te	%icc,	0x1
	edge8n	%g1,	%i1,	%o4
loop_1703:
	addcc	%g3,	0x1BE3,	%l6
	sdiv	%l0,	0x1DA2,	%g7
	fbl,a	%fcc0,	loop_1704
	fcmpne32	%f22,	%f26,	%o7
	tgu	%xcc,	0x7
	membar	0x2D
loop_1704:
	ldd	[%l7 + 0x68],	%o0
	edge16ln	%o0,	%g5,	%o5
	srl	%g6,	0x06,	%l5
	nop
	set	0x6A, %l1
	sth	%i7,	[%l7 + %l1]
	edge16n	%i3,	%o3,	%i2
	bge	%icc,	loop_1705
	movvs	%icc,	%l1,	%i4
	movrne	%o6,	0x032,	%o2
	sra	%i5,	%l3,	%g4
loop_1705:
	tge	%icc,	0x4
	tgu	%icc,	0x4
	for	%f28,	%f2,	%f18
	subc	%l2,	0x1592,	%i6
	st	%f24,	[%l7 + 0x50]
	xnor	%g2,	%i0,	%l4
	bcc,pt	%xcc,	loop_1706
	tpos	%icc,	0x1
	array8	%i1,	%g1,	%g3
	sdivcc	%l6,	0x108B,	%l0
loop_1706:
	ldd	[%l7 + 0x30],	%f20
	fble	%fcc2,	loop_1707
	smul	%o4,	%o7,	%g7
	tn	%xcc,	0x1
	edge32	%o0,	%g5,	%o5
loop_1707:
	movrgz	%g6,	0x200,	%l5
	movne	%icc,	%o1,	%i7
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x26] %asi,	%i3
	sdivx	%i2,	0x1FCC,	%l1
	fmovrdgez	%i4,	%f24,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x5A] %asi,	%o3
	srax	%o2,	0x17,	%i5
	subc	%l3,	0x010A,	%o6
	sub	%l2,	0x0F2C,	%i6
	nop
	setx	0x3DBDE1B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x49B8C602,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f4,	%f7
	st	%f2,	[%l7 + 0x24]
	udiv	%g4,	0x12F1,	%i0
	tn	%xcc,	0x4
	xnorcc	%l4,	0x0C29,	%i1
	fbuge,a	%fcc2,	loop_1708
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%icc,	%f27,	%f11
	fmovrsne	%g2,	%f29,	%f9
loop_1708:
	srlx	%g3,	%g1,	%l6
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf1
	membar	#Sync
	edge8l	%l0,	%o7,	%g7
	mulscc	%o0,	%g5,	%o4
	movn	%icc,	%o5,	%l5
	brnz	%o1,	loop_1709
	fbn,a	%fcc0,	loop_1710
	ld	[%l7 + 0x44],	%f27
	fsrc2	%f16,	%f22
loop_1709:
	movrgz	%g6,	0x170,	%i3
loop_1710:
	ldub	[%l7 + 0x5F],	%i7
	nop
	setx	0x48FD7BA4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xC052DC45,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f7,	%f5
	orncc	%l1,	0x0EDB,	%i4
	fmul8x16au	%f0,	%f19,	%f18
	udiv	%i2,	0x1DDA,	%o2
	movrne	%i5,	0x1A4,	%o3
	addcc	%o6,	%l2,	%i6
	fmovsgu	%xcc,	%f23,	%f22
	edge8ln	%g4,	%l3,	%l4
	ldsh	[%l7 + 0x38],	%i0
	edge16ln	%g2,	%g3,	%i1
	tcc	%xcc,	0x1
	fmovspos	%icc,	%f19,	%f25
	fbuge,a	%fcc0,	loop_1711
	movrlz	%g1,	0x36A,	%l0
	fmul8x16au	%f26,	%f26,	%f22
	fmovsge	%icc,	%f24,	%f2
loop_1711:
	tge	%xcc,	0x4
	edge16n	%l6,	%g7,	%o7
	fmul8x16au	%f9,	%f9,	%f20
	nop
	setx loop_1712, %l0, %l1
	jmpl %l1, %g5
	ldsw	[%l7 + 0x74],	%o0
	array32	%o4,	%o5,	%o1
	edge8n	%l5,	%g6,	%i3
loop_1712:
	fexpand	%f28,	%f30
	movvc	%icc,	%l1,	%i7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x19,	%i4,	%o2
	udivx	%i5,	0x0F83,	%o3
	stb	%o6,	[%l7 + 0x13]
	ldd	[%l7 + 0x38],	%i2
	fmovrsgz	%i6,	%f15,	%f12
	ldd	[%l7 + 0x38],	%f30
	smul	%g4,	0x1418,	%l3
	edge8	%l4,	%i0,	%l2
	udivcc	%g3,	0x11E0,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g1,	[%l7 + 0x28]
	stx	%i1,	[%l7 + 0x30]
	sdiv	%l6,	0x0EF1,	%g7
	set	0x38, %i7
	lduwa	[%l7 + %i7] 0x15,	%l0
	flush	%l7 + 0x34
	alignaddrl	%o7,	%o0,	%o4
	subcc	%o5,	0x18A9,	%o1
	ble,a	loop_1713
	lduw	[%l7 + 0x60],	%l5
	movcs	%xcc,	%g5,	%i3
	fmovrdne	%l1,	%f20,	%f10
loop_1713:
	fors	%f10,	%f2,	%f2
	fornot2s	%f21,	%f17,	%f14
	tge	%icc,	0x7
	be,a,pt	%xcc,	loop_1714
	fba	%fcc1,	loop_1715
	xor	%g6,	%i7,	%o2
	movge	%icc,	%i5,	%i4
loop_1714:
	bl,a	%xcc,	loop_1716
loop_1715:
	movle	%xcc,	%o3,	%i2
	brlez,a	%o6,	loop_1717
	ta	%xcc,	0x6
loop_1716:
	addccc	%g4,	%l3,	%i6
	movn	%xcc,	%i0,	%l2
loop_1717:
	xorcc	%l4,	0x1B03,	%g3
	nop
	setx	0xC22A26DA104916E1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	set	0x4E, %l2
	ldsba	[%l7 + %l2] 0x14,	%g2
	fbg	%fcc2,	loop_1718
	movle	%xcc,	%i1,	%g1
	ld	[%l7 + 0x78],	%f14
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%g7
loop_1718:
	and	%o7,	%o0,	%l0
	bcc,a	loop_1719
	fnegs	%f23,	%f12
	xor	%o4,	0x0174,	%o1
	fmovrsgez	%o5,	%f29,	%f13
loop_1719:
	addc	%g5,	%i3,	%l1
	bgu,pt	%xcc,	loop_1720
	alignaddr	%g6,	%l5,	%o2
	movneg	%xcc,	%i7,	%i5
	movrlz	%o3,	%i2,	%o6
loop_1720:
	fzero	%f22
	orncc	%i4,	0x0515,	%g4
	movn	%xcc,	%l3,	%i0
	mulscc	%l2,	%i6,	%l4
	movcc	%icc,	%g2,	%g3
	addc	%i1,	0x0C71,	%l6
	fnot2	%f30,	%f4
	and	%g1,	0x0578,	%g7
	edge16l	%o0,	%o7,	%l0
	edge16l	%o4,	%o1,	%o5
	prefetch	[%l7 + 0x28],	 0x3
	movvc	%icc,	%g5,	%l1
	movcs	%xcc,	%i3,	%g6
	tl	%icc,	0x1
	movg	%xcc,	%o2,	%l5
	bne,a,pt	%xcc,	loop_1721
	fbne,a	%fcc0,	loop_1722
	array16	%i7,	%i5,	%o3
	smulcc	%i2,	%o6,	%g4
loop_1721:
	nop
	setx	0xEB57DBB6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x4030F108,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f26,	%f21
loop_1722:
	sll	%i4,	%i0,	%l3
	tle	%xcc,	0x4
	bneg,a	%xcc,	loop_1723
	udivcc	%i6,	0x1E70,	%l2
	udiv	%g2,	0x157C,	%g3
	addc	%i1,	%l4,	%l6
loop_1723:
	tcc	%xcc,	0x6
	fmovdge	%icc,	%f17,	%f29
	bgu,a,pn	%icc,	loop_1724
	std	%f12,	[%l7 + 0x60]
	nop
	setx	0x4E073769,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x797A6973,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f25,	%f3
	array8	%g1,	%g7,	%o0
loop_1724:
	edge8ln	%o7,	%l0,	%o4
	flush	%l7 + 0x68
	edge32n	%o1,	%g5,	%l1
	sdivcc	%o5,	0x1274,	%i3
	taddcc	%g6,	%o2,	%i7
	umul	%i5,	%o3,	%l5
	fpadd32	%f12,	%f22,	%f0
	set	0x71, %o7
	lduba	[%l7 + %o7] 0x0c,	%i2
	srl	%g4,	%o6,	%i4
	fands	%f15,	%f30,	%f18
	movrgz	%l3,	0x383,	%i0
	brz,a	%l2,	loop_1725
	sth	%i6,	[%l7 + 0x08]
	ldsh	[%l7 + 0x32],	%g3
	smul	%g2,	%l4,	%l6
loop_1725:
	movge	%icc,	%i1,	%g7
	fbg	%fcc3,	loop_1726
	sdivx	%o0,	0x0611,	%g1
	movre	%l0,	%o7,	%o4
	fpsub32	%f18,	%f0,	%f10
loop_1726:
	sdivcc	%g5,	0x073E,	%o1
	tl	%xcc,	0x7
	tvs	%xcc,	0x3
	nop
	fitos	%f10,	%f1
	fstox	%f1,	%f26
	bcs	%xcc,	loop_1727
	and	%l1,	%o5,	%g6
	set	0x2C, %i4
	ldsha	[%l7 + %i4] 0x81,	%i3
loop_1727:
	tl	%xcc,	0x5
	movneg	%xcc,	%o2,	%i5
	bneg,a	loop_1728
	addccc	%i7,	%o3,	%i2
	tle	%xcc,	0x7
	edge32l	%l5,	%o6,	%g4
loop_1728:
	nop
	fitos	%f30,	%f30
	orncc	%l3,	0x1179,	%i4
	bvc,a	%xcc,	loop_1729
	movre	%i0,	0x2A6,	%l2
	movrne	%g3,	0x2BC,	%g2
	nop
	set	0x18, %g4
	ldsw	[%l7 + %g4],	%i6
loop_1729:
	mova	%icc,	%l4,	%l6
	fmovrdgz	%g7,	%f16,	%f20
	xnorcc	%i1,	%o0,	%l0
	fexpand	%f29,	%f20
	ta	%icc,	0x5
	fmovdvc	%icc,	%f9,	%f6
	movrlz	%g1,	%o4,	%g5
	fbu	%fcc1,	loop_1730
	andcc	%o7,	%l1,	%o5
	tne	%xcc,	0x2
	popc	%o1,	%i3
loop_1730:
	fornot2	%f12,	%f14,	%f22
	brlz	%g6,	loop_1731
	sdivx	%i5,	0x08CB,	%o2
	fpackfix	%f16,	%f4
	fble	%fcc1,	loop_1732
loop_1731:
	edge16l	%i7,	%o3,	%l5
	fmovscs	%xcc,	%f18,	%f16
	fmovsvs	%xcc,	%f8,	%f11
loop_1732:
	andn	%o6,	0x10E7,	%i2
	fmovrdgez	%g4,	%f22,	%f12
	bne,pn	%xcc,	loop_1733
	movvs	%icc,	%i4,	%l3
	fmovsn	%xcc,	%f3,	%f26
	xor	%l2,	0x1F5A,	%g3
loop_1733:
	fmovscs	%xcc,	%f29,	%f16
	edge32l	%g2,	%i6,	%i0
	edge32n	%l6,	%l4,	%g7
	mova	%icc,	%i1,	%l0
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x27] %asi,	%o0
	tg	%icc,	0x5
	sdivx	%g1,	0x1366,	%o4
	fpsub32	%f14,	%f0,	%f6
	fmovdneg	%icc,	%f26,	%f17
	smul	%o7,	0x1095,	%l1
	bne	%xcc,	loop_1734
	andncc	%g5,	%o1,	%o5
	xnorcc	%g6,	%i3,	%o2
	ldsb	[%l7 + 0x1C],	%i7
loop_1734:
	smulcc	%i5,	%o3,	%o6
	movne	%xcc,	%i2,	%g4
	edge16	%i4,	%l5,	%l3
	movrlez	%l2,	0x1CB,	%g3
	movrne	%g2,	%i6,	%i0
	tn	%xcc,	0x3
	array16	%l6,	%g7,	%i1
	edge16ln	%l0,	%l4,	%g1
	movrne	%o4,	%o7,	%l1
	popc	%o0,	%o1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%g6
	nop
	setx	0x79A54C3D278C0ABA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xFD890E572570D6B5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f28,	%f12
	fba	%fcc1,	loop_1735
	bneg,a,pt	%xcc,	loop_1736
	fmul8x16al	%f30,	%f18,	%f4
	fbn,a	%fcc2,	loop_1737
loop_1735:
	brlez	%i3,	loop_1738
loop_1736:
	udiv	%o2,	0x1C72,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1737:
	movcs	%xcc,	%g5,	%i5
loop_1738:
	orn	%o6,	%i2,	%g4
	nop
	setx	0xD94602520A412B90,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x6C68E56B7130FA99,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f20,	%f24
	ldsw	[%l7 + 0x08],	%o3
	movvc	%icc,	%i4,	%l3
	movn	%icc,	%l5,	%l2
	fbn	%fcc0,	loop_1739
	sll	%g2,	%g3,	%i0
	orn	%i6,	%g7,	%i1
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l0
loop_1739:
	xnor	%l4,	%l6,	%o4
	fornot2s	%f14,	%f29,	%f28
	fmovrslez	%g1,	%f5,	%f11
	fmovsvc	%xcc,	%f30,	%f23
	fpackfix	%f20,	%f26
	edge32l	%l1,	%o7,	%o1
	nop
	setx	0x0AA8F9586A8E1DEC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x68FAA2B091EE827C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f2,	%f2
	movn	%icc,	%o5,	%o0
	nop
	setx	0x8DB272E0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x76EDCBA7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f26,	%f9
	fxors	%f1,	%f19,	%f27
	set	0x40, %g7
	lduwa	[%l7 + %g7] 0x0c,	%g6
	fxor	%f12,	%f20,	%f30
	ldsh	[%l7 + 0x08],	%i3
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovdgu	%xcc,	%f7,	%f20
	array8	%i7,	%o2,	%i5
	movneg	%xcc,	%g5,	%i2
	swap	[%l7 + 0x54],	%o6
	orncc	%g4,	0x1AFB,	%o3
	fxnors	%f18,	%f7,	%f30
	fornot2s	%f27,	%f25,	%f28
	sra	%i4,	0x17,	%l3
	ldd	[%l7 + 0x58],	%l2
	stbar
	tge	%icc,	0x1
	set	0x78, %i1
	sta	%f14,	[%l7 + %i1] 0x88
	taddcc	%g2,	0x194B,	%l5
	tleu	%icc,	0x1
	ta	%xcc,	0x4
	movrgez	%i0,	0x2C0,	%g3
	prefetch	[%l7 + 0x20],	 0x2
	edge32	%i6,	%i1,	%l0
	fmovrslez	%g7,	%f27,	%f11
	andncc	%l6,	%o4,	%g1
	ldsh	[%l7 + 0x60],	%l4
	xor	%l1,	0x1E10,	%o7
	tsubcc	%o1,	%o5,	%g6
	tl	%xcc,	0x2
	addccc	%o0,	%i7,	%o2
	movgu	%icc,	%i5,	%g5
	movrlz	%i2,	%i3,	%o6
	fand	%f14,	%f28,	%f26
	fabsd	%f22,	%f0
	stw	%g4,	[%l7 + 0x14]
	sra	%o3,	0x10,	%l3
	move	%xcc,	%l2,	%g2
	orncc	%l5,	0x0050,	%i0
	stx	%g3,	[%l7 + 0x28]
	orcc	%i6,	%i4,	%l0
	sll	%i1,	0x07,	%l6
	bn,pn	%xcc,	loop_1740
	xnorcc	%g7,	%g1,	%l4
	fblg,a	%fcc0,	loop_1741
	umul	%l1,	0x0297,	%o7
loop_1740:
	edge32l	%o1,	%o5,	%g6
	sdivcc	%o0,	0x0C6D,	%o4
loop_1741:
	ta	%icc,	0x4
	brgz	%o2,	loop_1742
	ba,a,pn	%icc,	loop_1743
	movl	%xcc,	%i7,	%g5
	fpsub32s	%f18,	%f22,	%f6
loop_1742:
	sllx	%i2,	%i5,	%o6
loop_1743:
	array16	%g4,	%o3,	%i3
	sllx	%l2,	0x1B,	%g2
	srl	%l3,	%i0,	%l5
	fmovrdlez	%g3,	%f20,	%f12
	udivcc	%i6,	0x1E89,	%i4
	andcc	%i1,	%l0,	%l6
	movl	%xcc,	%g7,	%g1
	edge8l	%l1,	%o7,	%o1
	tleu	%icc,	0x5
	fbne	%fcc3,	loop_1744
	andn	%o5,	%l4,	%o0
	membar	0x7D
	array16	%o4,	%g6,	%o2
loop_1744:
	movne	%icc,	%g5,	%i2
	addccc	%i5,	%o6,	%i7
	fmovdge	%xcc,	%f31,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xC04C3DFB,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	sllx	%g4,	%i3,	%l2
	nop
	fitos	%f10,	%f7
	fstox	%f7,	%f4
	fxtos	%f4,	%f2
	fmovsg	%xcc,	%f27,	%f2
	nop
	setx	0x574A61D2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xF5AAA637,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f15,	%f30
	addccc	%g2,	%o3,	%i0
	movge	%icc,	%l3,	%g3
	mova	%icc,	%i6,	%i4
	fandnot1s	%f11,	%f9,	%f6
	fbge	%fcc3,	loop_1745
	add	%l5,	0x0050,	%i1
	mulscc	%l0,	%g7,	%g1
	ta	%icc,	0x5
loop_1745:
	srax	%l1,	%l6,	%o1
	nop
	setx loop_1746, %l0, %l1
	jmpl %l1, %o5
	ldsb	[%l7 + 0x0C],	%l4
	edge16n	%o0,	%o4,	%g6
	srax	%o7,	0x18,	%o2
loop_1746:
	prefetch	[%l7 + 0x08],	 0x0
	subcc	%i2,	%g5,	%o6
	xnorcc	%i7,	%i5,	%i3
	alignaddrl	%l2,	%g4,	%g2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%l3
	tge	%xcc,	0x7
	fbn	%fcc3,	loop_1747
	tpos	%xcc,	0x5
	stx	%g3,	[%l7 + 0x58]
	array8	%i0,	%i4,	%l5
loop_1747:
	te	%xcc,	0x5
	fmovdcc	%icc,	%f13,	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x44, %g3
	lduha	[%l7 + %g3] 0x15,	%i1
	nop
	setx	0x80155888,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x4E716271,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f16,	%f6
	faligndata	%f6,	%f30,	%f6
	fmovspos	%xcc,	%f8,	%f18
	udivcc	%l0,	0x025A,	%i6
	swap	[%l7 + 0x48],	%g1
	fpack32	%f22,	%f16,	%f6
	mulx	%g7,	%l6,	%o1
	subcc	%o5,	%l4,	%o0
	subccc	%l1,	%o4,	%g6
	bl,a,pn	%xcc,	loop_1748
	std	%f12,	[%l7 + 0x78]
	taddcctv	%o2,	0x0E5B,	%o7
	movrne	%g5,	%i2,	%i7
loop_1748:
	sll	%i5,	0x10,	%o6
	tn	%icc,	0x5
	fblg	%fcc0,	loop_1749
	fpsub32s	%f0,	%f12,	%f15
	te	%icc,	0x3
	movg	%icc,	%l2,	%i3
loop_1749:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0B9F
	xnor	%g4,	0x12FA,	%g2
	edge16n	%l3,	%g3,	%i0
	addc	%i4,	0x13F3,	%o3
	fbo	%fcc1,	loop_1750
	udivx	%i1,	0x08F6,	%l0
	fandnot2	%f8,	%f4,	%f10
	nop
	fitod	%f6,	%f16
	fdtoi	%f16,	%f19
loop_1750:
	srl	%i6,	0x0B,	%g1
	be	%xcc,	loop_1751
	or	%g7,	%l6,	%o1
	udiv	%l5,	0x0BA3,	%o5
	stb	%l4,	[%l7 + 0x58]
loop_1751:
	movrne	%l1,	%o0,	%o4
	movrgez	%o2,	%g6,	%o7
	andcc	%g5,	0x06D1,	%i7
	membar	0x2C
	sllx	%i5,	0x19,	%o6
	movpos	%icc,	%i2,	%l2
	sir	0x0E9D
	fmovd	%f30,	%f2
	mulx	%i3,	0x0CA3,	%g2
	xorcc	%l3,	%g4,	%g3
	movcc	%xcc,	%i4,	%o3
	nop
	setx	0x88E60E2B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x97622411,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f17,	%f6
	movrgez	%i0,	0x3EA,	%l0
	fcmple16	%f14,	%f14,	%i1
	ld	[%l7 + 0x64],	%f17
	array8	%g1,	%g7,	%i6
	ldub	[%l7 + 0x24],	%l6
	movg	%icc,	%l5,	%o5
	nop
	setx	0x67FBDD0B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x33F687F2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f12,	%f30
	alignaddr	%l4,	%l1,	%o0
	orn	%o4,	0x0047,	%o1
	fmovde	%xcc,	%f19,	%f17
	membar	0x7E
	fmovrdgz	%g6,	%f10,	%f2
	subccc	%o7,	0x1F6B,	%g5
	fbuge,a	%fcc1,	loop_1752
	nop
	setx	0xA95FAC4FA33840ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB47FE9554BFFA519,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f30,	%f12
	xorcc	%o2,	%i7,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1752:
	call	loop_1753
	sethi	0x0016,	%i2
	movrgz	%l2,	0x12B,	%i3
	movrlez	%i5,	0x174,	%g2
loop_1753:
	fmovdle	%icc,	%f9,	%f21
	stx	%g4,	[%l7 + 0x30]
	sra	%l3,	%g3,	%i4
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x2A] %asi,	%i0
	fornot2	%f10,	%f20,	%f30
	edge8l	%l0,	%o3,	%i1
	tvc	%icc,	0x0
	ldd	[%l7 + 0x20],	%g6
	movrlez	%g1,	%l6,	%i6
	xor	%l5,	0x1702,	%o5
	subccc	%l1,	0x1A55,	%o0
	wr	%g0,	0x04,	%asi
	stha	%l4,	[%l7 + 0x2A] %asi
	membar	0x6A
	edge16ln	%o1,	%o4,	%g6
	orncc	%g5,	0x1580,	%o2
	xnor	%o7,	0x19B0,	%o6
	tleu	%xcc,	0x5
	ldd	[%l7 + 0x70],	%f30
	movn	%xcc,	%i7,	%l2
	andn	%i2,	0x12C5,	%i5
	sub	%g2,	0x130F,	%i3
	brlz,a	%l3,	loop_1754
	fmovsne	%xcc,	%f10,	%f29
	fmul8x16au	%f0,	%f30,	%f6
	tl	%icc,	0x3
loop_1754:
	pdist	%f12,	%f6,	%f10
	movcs	%xcc,	%g3,	%g4
	edge8ln	%i4,	%i0,	%o3
	ba	loop_1755
	movne	%xcc,	%l0,	%i1
	movl	%icc,	%g1,	%l6
	array16	%i6,	%g7,	%o5
loop_1755:
	mova	%icc,	%l5,	%o0
	ta	%icc,	0x1
	fands	%f31,	%f13,	%f21
	nop
	setx	loop_1756,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array8	%l1,	%l4,	%o1
	set	0x5C, %o2
	stwa	%o4,	[%l7 + %o2] 0x81
loop_1756:
	sll	%g5,	%o2,	%g6
	nop
	fitod	%f2,	%f18
	fdtos	%f18,	%f6
	stx	%o6,	[%l7 + 0x10]
	ba,a,pn	%icc,	loop_1757
	fmovdl	%xcc,	%f25,	%f16
	srlx	%o7,	%i7,	%l2
	orcc	%i5,	%i2,	%i3
loop_1757:
	movne	%icc,	%g2,	%l3
	movleu	%xcc,	%g3,	%i4
	bge,a,pn	%icc,	loop_1758
	fmovs	%f23,	%f26
	stw	%g4,	[%l7 + 0x30]
	tneg	%icc,	0x2
loop_1758:
	addcc	%o3,	0x124B,	%l0
	orn	%i1,	%g1,	%i0
	fpsub32s	%f14,	%f30,	%f5
	movre	%l6,	0x095,	%i6
	sdivcc	%g7,	0x1160,	%o5
	edge32ln	%l5,	%o0,	%l1
	bcc,a,pt	%xcc,	loop_1759
	brz	%o1,	loop_1760
	movn	%icc,	%l4,	%o4
	mulx	%g5,	%g6,	%o2
loop_1759:
	fmovrde	%o7,	%f8,	%f24
loop_1760:
	ldd	[%l7 + 0x30],	%f16
	brlz,a	%i7,	loop_1761
	array16	%o6,	%l2,	%i5
	nop
	setx	0xF00DD42AE9363152,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x9781B110B9960047,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f22,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1761:
	fmovrsgez	%i3,	%f8,	%f0
	ldsh	[%l7 + 0x44],	%g2
	bcs,a,pt	%xcc,	loop_1762
	tpos	%xcc,	0x7
	fmovsl	%icc,	%f26,	%f22
	bn,pn	%xcc,	loop_1763
loop_1762:
	andn	%l3,	%i2,	%i4
	mulscc	%g4,	%g3,	%l0
	bne	%xcc,	loop_1764
loop_1763:
	movcs	%xcc,	%i1,	%g1
	popc	%o3,	%l6
	fbg,a	%fcc3,	loop_1765
loop_1764:
	fcmple16	%f18,	%f30,	%i6
	edge8ln	%i0,	%g7,	%o5
	movrlz	%l5,	0x084,	%l1
loop_1765:
	edge16ln	%o0,	%l4,	%o4
	orncc	%g5,	%g6,	%o1
	call	loop_1766
	fbule	%fcc1,	loop_1767
	ldd	[%l7 + 0x78],	%o2
	movle	%icc,	%i7,	%o6
loop_1766:
	move	%xcc,	%o7,	%l2
loop_1767:
	orn	%i3,	0x1DC1,	%i5
	array8	%l3,	%i2,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f30,	%f30
	udivx	%g2,	0x01EF,	%g3
	te	%xcc,	0x3
	nop
	set	0x7C, %l0
	sth	%g4,	[%l7 + %l0]
	tg	%icc,	0x5
	subccc	%i1,	0x0C16,	%g1
	umul	%o3,	%l0,	%l6
	nop
	setx	loop_1768,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%i6,	%g7,	%o5
	faligndata	%f18,	%f20,	%f18
	fxors	%f28,	%f12,	%f27
loop_1768:
	subc	%l5,	%i0,	%o0
	sethi	0x0ED2,	%l4
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	ldsb	[%l7 + 0x77],	%l1
	fmovs	%f16,	%f3
	bpos,a	%icc,	loop_1769
	tvs	%xcc,	0x0
	movg	%icc,	%o4,	%g5
	andcc	%o1,	0x1796,	%g6
loop_1769:
	addcc	%o2,	0x0D72,	%i7
	membar	0x52
	movneg	%icc,	%o6,	%o7
	movre	%i3,	0x2F5,	%l2
	edge8n	%l3,	%i2,	%i5
	bgu,a,pt	%icc,	loop_1770
	xorcc	%i4,	%g3,	%g4
	srax	%g2,	0x01,	%i1
	and	%g1,	%l0,	%l6
loop_1770:
	nop
	setx	loop_1771,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdneg	%icc,	%f20,	%f13
	tvc	%icc,	0x2
	mulx	%i6,	0x0EC1,	%o3
loop_1771:
	fmovdpos	%xcc,	%f18,	%f12
	prefetch	[%l7 + 0x0C],	 0x2
	fmovdne	%icc,	%f23,	%f10
	ldd	[%l7 + 0x78],	%f22
	addc	%g7,	0x09C6,	%o5
	nop
	fitod	%f6,	%f22
	fdtoi	%f22,	%f12
	nop
	setx loop_1772, %l0, %l1
	jmpl %l1, %l5
	udiv	%o0,	0x0559,	%i0
	te	%xcc,	0x0
	movrlez	%l1,	%o4,	%g5
loop_1772:
	fmovrsgez	%l4,	%f2,	%f30
	andcc	%o1,	%g6,	%i7
	movne	%xcc,	%o6,	%o7
	fbo,a	%fcc0,	loop_1773
	movpos	%icc,	%i3,	%l2
	edge16l	%o2,	%l3,	%i2
	fbu	%fcc0,	loop_1774
loop_1773:
	subccc	%i4,	%i5,	%g4
	xor	%g2,	0x0202,	%g3
	fnands	%f9,	%f29,	%f11
loop_1774:
	sir	0x1787
	xor	%i1,	%g1,	%l6
	array8	%i6,	%o3,	%l0
	umul	%g7,	0x1E3C,	%l5
	fnot1s	%f10,	%f24
	movvs	%xcc,	%o5,	%o0
	tsubcc	%i0,	0x067E,	%l1
	edge8ln	%g5,	%o4,	%l4
	xorcc	%g6,	%i7,	%o6
	fmovdn	%xcc,	%f30,	%f24
	bne	loop_1775
	movcc	%icc,	%o1,	%i3
	ldub	[%l7 + 0x6B],	%l2
	fble,a	%fcc3,	loop_1776
loop_1775:
	movvc	%icc,	%o7,	%l3
	fmovse	%icc,	%f9,	%f15
	fcmple16	%f18,	%f8,	%o2
loop_1776:
	edge16	%i4,	%i2,	%i5
	movn	%xcc,	%g4,	%g2
	fble,a	%fcc1,	loop_1777
	fmovsa	%icc,	%f5,	%f1
	umulcc	%g3,	%g1,	%i1
	tvc	%icc,	0x7
loop_1777:
	movrgz	%i6,	0x3FE,	%o3
	fmovdge	%xcc,	%f2,	%f23
	fmovsge	%xcc,	%f1,	%f7
	sra	%l0,	0x1A,	%l6
	udiv	%l5,	0x1D1C,	%o5
	tvc	%xcc,	0x1
	sllx	%g7,	0x04,	%o0
	ldstub	[%l7 + 0x60],	%i0
	fands	%f17,	%f12,	%f27
	edge16	%l1,	%o4,	%l4
	fpsub16	%f18,	%f6,	%f20
	movle	%xcc,	%g6,	%g5
	fmovsne	%xcc,	%f18,	%f6
	fornot2s	%f10,	%f5,	%f24
	bpos,pt	%xcc,	loop_1778
	tg	%xcc,	0x4
	add	%o6,	%i7,	%i3
	edge8ln	%o1,	%l2,	%o7
loop_1778:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x7
	mulscc	%l3,	0x0623,	%o2
	tcc	%icc,	0x7
	nop
	setx	0xB17BC7C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f1
	bshuffle	%f0,	%f30,	%f10
	fsrc1s	%f27,	%f18
	nop
	setx	0x636357D5E0C02DD0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x8C91E6F1DF76B1C7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f6,	%f6
	ta	%xcc,	0x2
	fblg,a	%fcc1,	loop_1779
	move	%xcc,	%i2,	%i5
	fmovsneg	%icc,	%f16,	%f22
	movrne	%g4,	0x010,	%i4
loop_1779:
	alignaddr	%g2,	%g3,	%g1
	nop
	setx	0xC506A83C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f27
	fpackfix	%f26,	%f2
	xorcc	%i1,	%i6,	%l0
	fmovrslez	%o3,	%f20,	%f31
	tge	%icc,	0x1
	movleu	%icc,	%l5,	%l6
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x0c,	%f16
	nop
	setx	0x2FE8C1B9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xAC5AABD1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f17,	%f16
	fbule	%fcc0,	loop_1780
	andncc	%o5,	%g7,	%o0
	tpos	%icc,	0x3
	xnorcc	%i0,	%o4,	%l4
loop_1780:
	sub	%l1,	%g6,	%o6
	edge16	%i7,	%g5,	%i3
	ta	%icc,	0x1
	edge16ln	%l2,	%o7,	%o1
	ldsb	[%l7 + 0x23],	%o2
	fornot1s	%f1,	%f26,	%f8
	movvs	%icc,	%i2,	%l3
	set	0x34, %l5
	stba	%i5,	[%l7 + %l5] 0x19
	fmovsne	%xcc,	%f1,	%f13
	fcmpgt16	%f24,	%f4,	%i4
	fmovdne	%icc,	%f12,	%f11
	bl	%xcc,	loop_1781
	fbuge,a	%fcc2,	loop_1782
	movcs	%icc,	%g2,	%g3
	edge16n	%g4,	%g1,	%i6
loop_1781:
	fmovrse	%l0,	%f4,	%f14
loop_1782:
	xorcc	%i1,	%o3,	%l5
	alignaddr	%o5,	%l6,	%g7
	srlx	%i0,	%o0,	%l4
	sllx	%o4,	%g6,	%l1
	tcc	%icc,	0x2
	andncc	%i7,	%o6,	%i3
	movn	%icc,	%l2,	%g5
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x14
	fnot1s	%f4,	%f28
	umulcc	%o1,	%o7,	%o2
	set	0x5F, %l4
	ldstuba	[%l7 + %l4] 0x18,	%l3
	fnegs	%f2,	%f13
	udivcc	%i5,	0x1059,	%i4
	fmovsne	%icc,	%f15,	%f16
	tcc	%icc,	0x7
	xnor	%i2,	0x1590,	%g2
	fbl	%fcc3,	loop_1783
	nop
	fitos	%f9,	%f27
	fstox	%f27,	%f24
	fxtos	%f24,	%f12
	movre	%g4,	0x30D,	%g3
	tvc	%icc,	0x7
loop_1783:
	nop
	setx	0x9FCFE9D1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f20
	tl	%xcc,	0x0
	srlx	%g1,	%l0,	%i1
	fmovsg	%xcc,	%f31,	%f3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%l5
	nop
	setx	loop_1784,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_1785
	edge16	%o5,	%l6,	%g7
	umulcc	%i6,	0x13D9,	%o0
loop_1784:
	tg	%icc,	0x5
loop_1785:
	movge	%xcc,	%i0,	%l4
	edge16ln	%o4,	%g6,	%i7
	edge16l	%l1,	%o6,	%l2
	fbuge,a	%fcc0,	loop_1786
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%i3,	%o1
	sub	%g5,	0x01C6,	%o2
loop_1786:
	subccc	%l3,	%i5,	%i4
	andcc	%i2,	0x1934,	%o7
	membar	0x5C
	ldx	[%l7 + 0x50],	%g2
	ldsb	[%l7 + 0x49],	%g4
	fnot1	%f8,	%f28
	fbe,a	%fcc3,	loop_1787
	ble	%icc,	loop_1788
	fnegs	%f2,	%f30
	fmovdvs	%xcc,	%f28,	%f26
loop_1787:
	movne	%icc,	%g1,	%l0
loop_1788:
	fmovdn	%xcc,	%f3,	%f12
	movn	%icc,	%i1,	%o3
	tneg	%xcc,	0x1
	fand	%f0,	%f12,	%f22
	popc	%l5,	%g3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%g7
	sll	%i6,	0x02,	%o0
	fmovrdgz	%i0,	%f4,	%f8
	sra	%l6,	%l4,	%o4
	tvc	%icc,	0x0
	edge32l	%g6,	%i7,	%o6
	addcc	%l2,	%i3,	%o1
	fmul8x16al	%f21,	%f19,	%f10
	fornot1s	%f12,	%f22,	%f25
	fandnot2	%f30,	%f26,	%f22
	taddcctv	%g5,	%o2,	%l3
	tleu	%xcc,	0x5
	movrgz	%i5,	0x088,	%i4
	sir	0x1792
	andn	%l1,	0x0AB6,	%i2
	movcs	%icc,	%g2,	%g4
	membar	0x37
	nop
	setx	0x2050E39E,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	andncc	%o7,	%l0,	%i1
	fmovsleu	%xcc,	%f11,	%f19
	bcc,a	loop_1789
	fmovsg	%xcc,	%f30,	%f13
	movrlez	%g1,	%l5,	%g3
	array8	%o3,	%o5,	%i6
loop_1789:
	fxors	%f0,	%f25,	%f8
	orn	%g7,	0x1FEB,	%o0
	sethi	0x0719,	%l6
	fbug,a	%fcc3,	loop_1790
	movl	%icc,	%l4,	%o4
	alignaddr	%g6,	%i0,	%i7
	xorcc	%o6,	%i3,	%l2
loop_1790:
	movn	%icc,	%o1,	%o2
	movl	%xcc,	%g5,	%i5
	add	%i4,	0x1F3F,	%l3
	sdivx	%i2,	0x197D,	%g2
	call	loop_1791
	alignaddrl	%l1,	%o7,	%l0
	tle	%icc,	0x2
	mova	%icc,	%g4,	%i1
loop_1791:
	tle	%icc,	0x7
	mulx	%g1,	%l5,	%g3
	sethi	0x064D,	%o3
	nop
	setx	loop_1792,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovspos	%xcc,	%f26,	%f6
	addc	%i6,	0x0DCC,	%g7
	bg,a	%icc,	loop_1793
loop_1792:
	fpsub32s	%f8,	%f26,	%f13
	tleu	%icc,	0x0
	subcc	%o0,	0x1C45,	%o5
loop_1793:
	tvc	%icc,	0x1
	sra	%l6,	0x06,	%o4
	fblg,a	%fcc0,	loop_1794
	nop
	setx	0xFBEA9650,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x36CDAA3A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f3,	%f23
	set	0x46, %i2
	ldstuba	[%l7 + %i2] 0x88,	%l4
loop_1794:
	popc	0x1FDC,	%i0
	fmovrdlz	%i7,	%f16,	%f18
	fmovrsgz	%g6,	%f7,	%f16
	fmul8x16al	%f30,	%f16,	%f28
	fbul	%fcc2,	loop_1795
	fmovrslz	%o6,	%f13,	%f26
	tgu	%icc,	0x0
	std	%f10,	[%l7 + 0x38]
loop_1795:
	sethi	0x0B75,	%i3
	movgu	%xcc,	%o1,	%l2
	movrlez	%g5,	0x1BD,	%o2
	array8	%i5,	%i4,	%i2
	srax	%g2,	0x11,	%l1
	fbug,a	%fcc1,	loop_1796
	tsubcctv	%l3,	%l0,	%g4
	movn	%icc,	%i1,	%g1
	srlx	%o7,	%l5,	%g3
loop_1796:
	movpos	%icc,	%i6,	%g7
	movne	%xcc,	%o0,	%o5
	pdist	%f28,	%f16,	%f14
	xnorcc	%l6,	0x0118,	%o4
	subcc	%o3,	%l4,	%i7
	edge8ln	%i0,	%o6,	%g6
	tvc	%icc,	0x3
	sra	%i3,	0x19,	%o1
	fpadd32s	%f12,	%f7,	%f3
	array8	%l2,	%o2,	%i5
	movpos	%icc,	%i4,	%i2
	movcs	%xcc,	%g5,	%l1
	umul	%l3,	%l0,	%g2
	subccc	%i1,	%g1,	%g4
	movpos	%icc,	%l5,	%o7
	fnot2s	%f9,	%f29
	bvc,a,pn	%xcc,	loop_1797
	bcc,pt	%xcc,	loop_1798
	taddcc	%i6,	0x1869,	%g3
	nop
	setx	0x804B057A,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
loop_1797:
	addc	%g7,	0x1C58,	%o0
loop_1798:
	edge8l	%l6,	%o4,	%o5
	tvc	%icc,	0x4
	sdiv	%l4,	0x070F,	%o3
	fnot2	%f18,	%f6
	fmovrsne	%i0,	%f30,	%f27
	ldd	[%l7 + 0x60],	%f0
	array32	%o6,	%g6,	%i7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%i3
	movrgz	%l2,	0x275,	%i5
	add	%o2,	%i2,	%g5
	fornot2	%f2,	%f12,	%f14
	edge8n	%i4,	%l1,	%l0
	edge8ln	%g2,	%i1,	%g1
	addccc	%g4,	0x1DD1,	%l3
	ta	%xcc,	0x3
	fmovsneg	%xcc,	%f5,	%f20
	xnorcc	%l5,	0x1B12,	%i6
	fsrc1	%f2,	%f6
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x11,	%f16
	edge32n	%g3,	%g7,	%o7
	addccc	%l6,	0x0F95,	%o4
	stb	%o0,	[%l7 + 0x25]
	alignaddr	%l4,	%o3,	%o5
	bvs	%xcc,	loop_1799
	movge	%icc,	%i0,	%g6
	bvc,a	%xcc,	loop_1800
	move	%xcc,	%i7,	%o6
loop_1799:
	tneg	%icc,	0x6
	nop
	setx	0x437B1601,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x8F8852EC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f30,	%f2
loop_1800:
	ldd	[%l7 + 0x40],	%f30
	nop
	setx	0x76A51C04,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x0E1817C2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f5,	%f5
	fbug	%fcc3,	loop_1801
	sir	0x0C2A
	sdiv	%i3,	0x1E1E,	%l2
	fmovsg	%xcc,	%f28,	%f18
loop_1801:
	nop
	fitos	%f9,	%f22
	fstod	%f22,	%f16
	popc	0x1EB7,	%i5
	for	%f16,	%f0,	%f2
	mulx	%o2,	%i2,	%o1
	fmovrdne	%i4,	%f14,	%f16
	brgz,a	%g5,	loop_1802
	ld	[%l7 + 0x08],	%f10
	fbne,a	%fcc0,	loop_1803
	orn	%l0,	%g2,	%l1
loop_1802:
	movvc	%xcc,	%g1,	%i1
	fone	%f26
loop_1803:
	nop
	set	0x30, %i6
	stxa	%g4,	[%l7 + %i6] 0x2b
	membar	#Sync
	udivcc	%l3,	0x0B05,	%i6
	movg	%icc,	%g3,	%g7
	srlx	%o7,	%l6,	%o4
	nop
	setx	loop_1804,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%o0,	%l5,	%l4
	bvc,a	loop_1805
	taddcctv	%o5,	%o3,	%g6
loop_1804:
	sdivcc	%i0,	0x0E48,	%i7
	fmovd	%f10,	%f10
loop_1805:
	sra	%o6,	0x05,	%i3
	fnors	%f26,	%f15,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i5,	0x37C,	%l2
	set	0x68, %o5
	swapa	[%l7 + %o5] 0x11,	%o2
	movrlz	%o1,	0x0DA,	%i2
	udivcc	%g5,	0x0F5E,	%i4
	edge32l	%g2,	%l0,	%g1
	sir	0x17DA
	xnor	%l1,	0x0D14,	%i1
	fmovsleu	%xcc,	%f21,	%f9
	subccc	%l3,	0x0AFF,	%i6
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%g4
	fxor	%f26,	%f30,	%f20
	brlez,a	%g7,	loop_1806
	movg	%icc,	%o7,	%l6
	fones	%f19
	fpadd16	%f24,	%f12,	%f8
loop_1806:
	fnot2	%f8,	%f30
	movvs	%xcc,	%g3,	%o0
	flush	%l7 + 0x5C
	fmovd	%f22,	%f12
	brlz,a	%l5,	loop_1807
	movrgz	%o4,	%o5,	%l4
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g6
loop_1807:
	addccc	%o3,	%i0,	%i7
	fnot2	%f4,	%f14
	fmovs	%f15,	%f14
	fmovs	%f18,	%f10
	tge	%icc,	0x5
	fmovrdlez	%i3,	%f26,	%f8
	fmovrdlez	%o6,	%f18,	%f8
	fzeros	%f26
	lduh	[%l7 + 0x1A],	%i5
	stx	%o2,	[%l7 + 0x60]
	udivcc	%o1,	0x1885,	%l2
	fors	%f18,	%f6,	%f14
	fbg	%fcc3,	loop_1808
	nop
	setx	0x216528AF8045400C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	ta	%icc,	0x5
	orn	%g5,	%i2,	%g2
loop_1808:
	fmovrdgez	%i4,	%f12,	%f4
	srlx	%g1,	%l1,	%l0
	sth	%i1,	[%l7 + 0x56]
	edge32n	%l3,	%i6,	%g7
	addcc	%g4,	0x036A,	%o7
	movleu	%xcc,	%l6,	%o0
	popc	0x0476,	%l5
	brlz	%g3,	loop_1809
	mulx	%o5,	0x1D04,	%o4
	sra	%l4,	0x13,	%g6
	andn	%o3,	0x101B,	%i7
loop_1809:
	fbne,a	%fcc0,	loop_1810
	fcmpne32	%f20,	%f6,	%i0
	and	%o6,	%i3,	%o2
	ldstub	[%l7 + 0x3C],	%o1
loop_1810:
	movrlz	%l2,	0x0F3,	%i5
	fbl	%fcc0,	loop_1811
	tleu	%icc,	0x4
	subccc	%g5,	%i2,	%i4
	swap	[%l7 + 0x24],	%g1
loop_1811:
	fmovdle	%icc,	%f3,	%f9
	nop
	fitos	%f0,	%f8
	fstod	%f8,	%f28
	orcc	%g2,	%l1,	%l0
	edge32	%l3,	%i1,	%g7
	smulcc	%g4,	%i6,	%l6
	sllx	%o7,	0x10,	%l5
	smulcc	%g3,	0x06AD,	%o5
	set	0x2C, %g5
	lduba	[%l7 + %g5] 0x04,	%o0
	lduw	[%l7 + 0x0C],	%l4
	edge32	%g6,	%o3,	%o4
	srl	%i0,	0x04,	%o6
	srl	%i7,	0x11,	%i3
	set	0x58, %o3
	ldsba	[%l7 + %o3] 0x19,	%o1
	orn	%l2,	%i5,	%g5
	bl,a	%icc,	loop_1812
	bcc,a,pt	%icc,	loop_1813
	tgu	%xcc,	0x6
	edge16ln	%o2,	%i2,	%i4
loop_1812:
	subccc	%g1,	%l1,	%g2
loop_1813:
	movle	%xcc,	%l0,	%i1
	xor	%l3,	%g7,	%g4
	movgu	%icc,	%i6,	%o7
	taddcc	%l5,	%g3,	%o5
	tneg	%icc,	0x6
	smul	%o0,	0x0032,	%l4
	nop
	fitos	%f7,	%f23
	fstod	%f23,	%f16
	fmuld8sux16	%f10,	%f4,	%f20
	popc	0x0123,	%l6
	array8	%o3,	%o4,	%g6
	or	%o6,	%i0,	%i3
	popc	0x0794,	%o1
	xor	%i7,	0x0907,	%l2
	nop
	fitos	%f10,	%f4
	fstox	%f4,	%f22
	bl,a	%icc,	loop_1814
	sdiv	%i5,	0x1AF5,	%g5
	edge8n	%i2,	%i4,	%o2
	nop
	setx	0x82D6EAC8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x8AB6981D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f7,	%f9
loop_1814:
	add	%l1,	0x121B,	%g1
	tne	%icc,	0x5
	nop
	fitod	%f0,	%f4
	fdtos	%f4,	%f31
	fpadd16	%f30,	%f20,	%f30
	movcc	%xcc,	%g2,	%i1
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x16] %asi,	%l3
	movre	%l0,	0x241,	%g7
	nop
	setx	loop_1815,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addc	%g4,	%i6,	%l5
	movcc	%xcc,	%g3,	%o7
	bneg,a	loop_1816
loop_1815:
	xnorcc	%o5,	0x0E87,	%o0
	movl	%xcc,	%l6,	%l4
	tcs	%xcc,	0x2
loop_1816:
	srl	%o3,	%g6,	%o4
	fmovrsgez	%o6,	%f2,	%f1
	sir	0x1D6A
	edge32n	%i0,	%i3,	%i7
	fone	%f22
	edge32ln	%l2,	%i5,	%o1
	fpsub16s	%f31,	%f5,	%f23
	movneg	%xcc,	%g5,	%i4
	tvc	%icc,	0x6
	fmovrde	%o2,	%f30,	%f30
	movcs	%xcc,	%i2,	%g1
	array16	%l1,	%g2,	%i1
	array32	%l0,	%g7,	%g4
	mova	%xcc,	%i6,	%l5
	stw	%g3,	[%l7 + 0x24]
	fbn	%fcc3,	loop_1817
	tle	%xcc,	0x6
	andn	%l3,	0x0E5D,	%o7
	movrne	%o0,	%o5,	%l4
loop_1817:
	edge32	%l6,	%g6,	%o4
	stb	%o6,	[%l7 + 0x53]
	movgu	%icc,	%o3,	%i3
	subc	%i0,	0x0E9F,	%l2
	fbe,a	%fcc3,	loop_1818
	movne	%icc,	%i7,	%o1
	orncc	%g5,	0x1E08,	%i5
	fmovsvc	%xcc,	%f19,	%f13
loop_1818:
	ta	%icc,	0x6
	bshuffle	%f26,	%f22,	%f22
	tsubcc	%i4,	0x05D0,	%o2
	array8	%g1,	%i2,	%g2
	bvc,pn	%xcc,	loop_1819
	fmovsl	%xcc,	%f5,	%f23
	ble,a,pt	%icc,	loop_1820
	movneg	%xcc,	%i1,	%l1
loop_1819:
	nop
	setx	0x43774B9210577032,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	tvs	%icc,	0x0
loop_1820:
	nop
	fitod	%f26,	%f20
	set	0x6C, %o4
	ldsba	[%l7 + %o4] 0x18,	%l0
	alignaddr	%g4,	%g7,	%i6
	std	%f14,	[%l7 + 0x70]
	xnorcc	%g3,	%l3,	%o7
	brlz	%l5,	loop_1821
	fone	%f24
	fmovrdlez	%o5,	%f2,	%f4
	fcmpeq16	%f14,	%f16,	%o0
loop_1821:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x54] %asi,	%l6
	fbe	%fcc1,	loop_1822
	orn	%g6,	0x0FC2,	%l4
	movcc	%xcc,	%o4,	%o3
	tgu	%xcc,	0x5
loop_1822:
	be,a	loop_1823
	fblg	%fcc3,	loop_1824
	movvs	%icc,	%i3,	%o6
	udiv	%l2,	0x0BCD,	%i0
loop_1823:
	fmovrdgez	%o1,	%f6,	%f24
loop_1824:
	tge	%icc,	0x3
	fand	%f24,	%f26,	%f18
	brlez	%g5,	loop_1825
	sth	%i5,	[%l7 + 0x7C]
	brlez,a	%i7,	loop_1826
	fmovsgu	%xcc,	%f19,	%f8
loop_1825:
	movgu	%icc,	%o2,	%i4
	set	0x68, %i0
	swapa	[%l7 + %i0] 0x80,	%i2
loop_1826:
	udivcc	%g2,	0x1046,	%g1
	umul	%l1,	0x15F3,	%i1
	fmovdcs	%icc,	%f21,	%f29
	fbne	%fcc3,	loop_1827
	tsubcc	%l0,	0x09B5,	%g4
	add	%i6,	0x1617,	%g3
	fcmpeq16	%f22,	%f8,	%g7
loop_1827:
	edge32	%l3,	%l5,	%o7
	and	%o5,	0x0C29,	%o0
	nop
	setx	0xDBB7F9C0A0408892,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	te	%icc,	0x1
	srl	%g6,	0x19,	%l6
	fcmpne32	%f16,	%f10,	%l4
	smulcc	%o4,	%o3,	%o6
	edge16	%i3,	%i0,	%o1
	orncc	%g5,	%l2,	%i7
	tgu	%icc,	0x1
	array8	%o2,	%i4,	%i5
	movpos	%xcc,	%g2,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i2,	%i1,	%l1
	popc	0x1E71,	%l0
	orcc	%g4,	%i6,	%g7
	fbl	%fcc2,	loop_1828
	movre	%l3,	0x18C,	%g3
	fandnot2	%f24,	%f26,	%f16
	or	%l5,	0x15F0,	%o7
loop_1828:
	prefetch	[%l7 + 0x54],	 0x0
	fmovsne	%xcc,	%f2,	%f18
	xnor	%o5,	%o0,	%g6
	edge16n	%l4,	%l6,	%o3
	tne	%icc,	0x5
	nop
	setx	0x8D629DCD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x57655346,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f17,	%f27
	movleu	%xcc,	%o6,	%o4
	movcs	%icc,	%i3,	%o1
	orcc	%i0,	0x02FF,	%g5
	std	%f22,	[%l7 + 0x28]
	ldsh	[%l7 + 0x72],	%l2
	movvs	%xcc,	%i7,	%i4
	tsubcctv	%i5,	%o2,	%g1
	and	%g2,	%i2,	%i1
	edge16l	%l1,	%g4,	%i6
	set	0x18, %i5
	ldxa	[%g0 + %i5] 0x58,	%g7
	taddcctv	%l3,	0x1020,	%g3
	prefetch	[%l7 + 0x64],	 0x1
	bleu,a,pn	%icc,	loop_1829
	movl	%icc,	%l5,	%l0
	fmovdcc	%icc,	%f8,	%f23
	edge32l	%o5,	%o0,	%o7
loop_1829:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x24] %asi,	%g6
	orn	%l4,	%o3,	%o6
	fbul	%fcc0,	loop_1830
	addc	%o4,	0x0B0A,	%l6
	mulscc	%i3,	%i0,	%g5
	srl	%o1,	%l2,	%i4
loop_1830:
	tn	%xcc,	0x0
	stx	%i7,	[%l7 + 0x50]
	tvs	%xcc,	0x5
	fbul,a	%fcc3,	loop_1831
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f18
	fxtod	%f18,	%f4
	edge8l	%i5,	%g1,	%g2
	fnot1	%f4,	%f0
loop_1831:
	tge	%xcc,	0x1
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x2C] %asi,	%i2
	edge8n	%o2,	%l1,	%i1
	tsubcc	%i6,	0x189C,	%g7
	tpos	%xcc,	0x7
	edge32ln	%l3,	%g3,	%l5
	tle	%icc,	0x1
	fmovsl	%icc,	%f2,	%f18
	nop
	setx	0xF04FEF65,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x19,	%l0,	%o5
	umul	%o0,	0x1159,	%o7
	sir	0x045C
	xnor	%g4,	0x042D,	%g6
	bgu,a,pn	%xcc,	loop_1832
	tl	%xcc,	0x4
	movpos	%xcc,	%o3,	%l4
	sdivx	%o6,	0x11E0,	%l6
loop_1832:
	edge16ln	%i3,	%o4,	%g5
	tgu	%icc,	0x7
	fmovdgu	%xcc,	%f11,	%f17
	movrne	%i0,	0x24B,	%o1
	brz,a	%l2,	loop_1833
	move	%icc,	%i7,	%i5
	membar	0x45
	fmovrdgez	%g1,	%f4,	%f24
loop_1833:
	edge32n	%i4,	%i2,	%g2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l1,	%i1
	movne	%xcc,	%o2,	%g7
	srl	%l3,	0x0C,	%g3
	set	0x2C, %i3
	stba	%i6,	[%l7 + %i3] 0x11
	edge16	%l0,	%l5,	%o5
	fxnors	%f7,	%f28,	%f19
	fmovdl	%xcc,	%f31,	%f18
	movrgez	%o0,	0x2E3,	%g4
	tl	%icc,	0x1
	array16	%g6,	%o3,	%o7
	movvs	%xcc,	%o6,	%l4
	xorcc	%i3,	%l6,	%o4
	andcc	%g5,	%i0,	%l2
	sethi	0x011E,	%i7
	set	0x10, %l6
	stxa	%i5,	[%l7 + %l6] 0x04
	tleu	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,a	loop_1834
	nop
	setx	0x2E5E340675C4855F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x670D3F2FDFFEEC53,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f2,	%f16
	movcs	%icc,	%o1,	%i4
	orcc	%i2,	0x1308,	%g1
loop_1834:
	sdiv	%g2,	0x1389,	%l1
	andcc	%o2,	%g7,	%i1
	edge8ln	%l3,	%g3,	%l0
	fbg,a	%fcc3,	loop_1835
	movpos	%icc,	%i6,	%o5
	fmovrslez	%l5,	%f26,	%f5
	std	%f26,	[%l7 + 0x08]
loop_1835:
	movge	%icc,	%g4,	%o0
	fmovdn	%xcc,	%f17,	%f28
	ta	%icc,	0x0
	fnot2	%f28,	%f8
	movrgez	%g6,	%o3,	%o7
	taddcc	%o6,	0x0288,	%i3
	movgu	%icc,	%l4,	%o4
	fnot1s	%f0,	%f31
	brgez	%l6,	loop_1836
	tneg	%icc,	0x7
	srl	%g5,	0x10,	%l2
	movrlez	%i7,	%i5,	%o1
loop_1836:
	membar	0x23
	fmovrdlez	%i4,	%f30,	%f8
	edge32	%i0,	%g1,	%i2
	fsrc2	%f30,	%f28
	bg	%icc,	loop_1837
	te	%xcc,	0x1
	sdivcc	%l1,	0x1AB7,	%o2
	orncc	%g2,	0x0526,	%g7
loop_1837:
	udivcc	%l3,	0x088A,	%i1
	set	0x68, %o1
	ldswa	[%l7 + %o1] 0x88,	%l0
	fbn,a	%fcc2,	loop_1838
	smulcc	%g3,	0x10FE,	%i6
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x0C] %asi,	%l5
loop_1838:
	sdiv	%o5,	0x1891,	%g4
	st	%f20,	[%l7 + 0x18]
	fmovdn	%icc,	%f6,	%f22
	popc	0x18E3,	%o0
	array16	%o3,	%g6,	%o6
	stx	%o7,	[%l7 + 0x20]
	stb	%i3,	[%l7 + 0x3F]
	fbl	%fcc1,	loop_1839
	xnor	%l4,	0x1458,	%o4
	sdivx	%g5,	0x0186,	%l6
	xorcc	%i7,	0x1AFF,	%l2
loop_1839:
	fpsub32s	%f10,	%f6,	%f8
	fcmpeq32	%f4,	%f4,	%i5
	sdiv	%o1,	0x1C6A,	%i4
	udiv	%i0,	0x0EEC,	%g1
	stw	%l1,	[%l7 + 0x44]
	array32	%o2,	%i2,	%g7
	tne	%xcc,	0x2
	ldstub	[%l7 + 0x48],	%l3
	std	%f2,	[%l7 + 0x18]
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%g2
	movn	%icc,	%l0,	%g3
	fmovsle	%xcc,	%f23,	%f3
	fornot2	%f2,	%f14,	%f28
	sethi	0x19BE,	%i6
	edge16	%i1,	%l5,	%g4
	edge8n	%o0,	%o5,	%o3
	subcc	%o6,	%o7,	%i3
	bpos	loop_1840
	add	%l4,	0x055F,	%g6
	addc	%g5,	0x08B1,	%o4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x0D] %asi,	%i7
loop_1840:
	movcs	%xcc,	%l6,	%i5
	brz	%o1,	loop_1841
	nop
	setx	loop_1842,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbl,a	%fcc2,	loop_1843
	tsubcc	%i4,	%i0,	%l2
loop_1841:
	movleu	%icc,	%l1,	%o2
loop_1842:
	mulscc	%i2,	0x066E,	%g1
loop_1843:
	fornot2s	%f4,	%f3,	%f2
	set	0x31, %o0
	ldsba	[%l7 + %o0] 0x88,	%l3
	sll	%g2,	0x1B,	%l0
	fmovsgu	%xcc,	%f13,	%f9
	bcs,a	%icc,	loop_1844
	bl	loop_1845
	alignaddrl	%g3,	%i6,	%i1
	xnor	%g7,	%l5,	%o0
loop_1844:
	fmovrse	%o5,	%f15,	%f26
loop_1845:
	ldd	[%l7 + 0x08],	%f28
	movrlez	%o3,	0x2C8,	%o6
	udiv	%o7,	0x0AB1,	%i3
	fbug,a	%fcc3,	loop_1846
	edge32ln	%g4,	%g6,	%l4
	orcc	%o4,	%g5,	%l6
	movne	%icc,	%i5,	%o1
loop_1846:
	edge32l	%i4,	%i0,	%l2
	nop
	setx loop_1847, %l0, %l1
	jmpl %l1, %i7
	mova	%icc,	%l1,	%o2
	array16	%i2,	%l3,	%g1
	tpos	%icc,	0x5
loop_1847:
	alignaddr	%g2,	%l0,	%i6
	ldx	[%l7 + 0x08],	%i1
	srlx	%g7,	%l5,	%g3
	fornot1s	%f3,	%f8,	%f15
	tgu	%icc,	0x3
	bcc,a,pn	%icc,	loop_1848
	tleu	%xcc,	0x0
	array16	%o0,	%o3,	%o6
	edge32l	%o5,	%o7,	%i3
loop_1848:
	tsubcctv	%g6,	0x06FB,	%g4
	edge8ln	%o4,	%l4,	%l6
	bvc	loop_1849
	fmul8ulx16	%f10,	%f20,	%f28
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x20] %asi,	%i5
loop_1849:
	bvc,pn	%icc,	loop_1850
	bcc,a,pt	%icc,	loop_1851
	nop
	setx loop_1852, %l0, %l1
	jmpl %l1, %g5
	sir	0x180E
loop_1850:
	bvc,a,pt	%xcc,	loop_1853
loop_1851:
	bneg,pn	%xcc,	loop_1854
loop_1852:
	tvc	%icc,	0x4
	faligndata	%f16,	%f22,	%f10
loop_1853:
	edge8n	%i4,	%o1,	%l2
loop_1854:
	bvc,a,pn	%xcc,	loop_1855
	edge16n	%i0,	%l1,	%o2
	sllx	%i7,	%i2,	%g1
	tle	%icc,	0x1
loop_1855:
	membar	0x15
	and	%g2,	0x1291,	%l3
	wr	%g0,	0x89,	%asi
	stwa	%i6,	[%l7 + 0x28] %asi
	flush	%l7 + 0x18
	edge32l	%i1,	%g7,	%l0
	nop
	setx	0x38FEB88D166EB056,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x5C3BE5A417D9311A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f14,	%f14
	ba,pt	%xcc,	loop_1856
	tn	%xcc,	0x1
	movg	%xcc,	%g3,	%l5
	movrgz	%o3,	%o6,	%o0
loop_1856:
	bge,pt	%xcc,	loop_1857
	nop
	fitod	%f10,	%f20
	fdtos	%f20,	%f12
	smulcc	%o5,	%i3,	%o7
	edge8n	%g6,	%o4,	%g4
loop_1857:
	mova	%icc,	%l6,	%i5
	orcc	%l4,	%g5,	%o1
	membar	0x10
	tsubcctv	%i4,	%l2,	%l1
	subc	%i0,	%o2,	%i2
	fpadd32s	%f26,	%f0,	%f21
	srlx	%i7,	0x1F,	%g2
	smulcc	%g1,	0x11D6,	%i6
	mova	%icc,	%i1,	%g7
	movvc	%xcc,	%l3,	%g3
	andcc	%l0,	0x110B,	%l5
	edge32ln	%o3,	%o6,	%o5
	brgz	%o0,	loop_1858
	fnot2s	%f8,	%f10
	nop
	setx	0xCA78BC7BC000A4E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x92E3FCC7CEDF9AC7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f2,	%f28
	tgu	%xcc,	0x0
loop_1858:
	taddcc	%i3,	%g6,	%o7
	edge16	%o4,	%l6,	%g4
	bne,a,pt	%icc,	loop_1859
	fpsub16	%f20,	%f0,	%f30
	movrlz	%l4,	0x33F,	%g5
	edge32ln	%i5,	%i4,	%l2
loop_1859:
	fmovdneg	%xcc,	%f10,	%f13
	ldsb	[%l7 + 0x52],	%l1
	fbe	%fcc2,	loop_1860
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x52] %asi,	%i0
loop_1860:
	nop
	fitos	%f9,	%f24
	fstod	%f24,	%f18
	fnegs	%f9,	%f20
	bvs	%icc,	loop_1861
	edge16ln	%o1,	%o2,	%i2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x0c,	%i7,	%g2
loop_1861:
	stbar
	fmovrdlz	%g1,	%f14,	%f26
	fmovs	%f28,	%f27
	wr	%g0,	0x0c,	%asi
	stwa	%i6,	[%l7 + 0x1C] %asi
	fbug	%fcc3,	loop_1862
	subc	%i1,	0x048A,	%l3
	movleu	%icc,	%g3,	%l0
	ta	%icc,	0x3
loop_1862:
	fpsub16	%f30,	%f30,	%f24
	fmovdvc	%xcc,	%f8,	%f14
	fbu	%fcc1,	loop_1863
	fmovscs	%xcc,	%f19,	%f10
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l5
loop_1863:
	edge32n	%g7,	%o6,	%o3
	call	loop_1864
	sdivx	%o5,	0x0D3B,	%i3
	array32	%o0,	%o7,	%o4
	mova	%xcc,	%g6,	%l6
loop_1864:
	sdivx	%l4,	0x0DC7,	%g4
	smul	%g5,	%i4,	%l2
	movcs	%icc,	%i5,	%l1
	faligndata	%f20,	%f4,	%f30
	fmuld8ulx16	%f18,	%f24,	%f16
	fand	%f2,	%f20,	%f6
	subcc	%i0,	0x0523,	%o1
	edge8ln	%i2,	%o2,	%g2
	tl	%icc,	0x4
	fmovrslez	%i7,	%f11,	%f4
	movrne	%i6,	%i1,	%g1
	movpos	%xcc,	%g3,	%l3
	movcs	%icc,	%l5,	%g7
	addc	%l0,	0x169D,	%o6
	fornot1s	%f11,	%f17,	%f1
	sub	%o5,	%o3,	%o0
	nop
	setx	0x7499A330,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x82D5BC17,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f30,	%f10
	movcc	%xcc,	%i3,	%o4
	xnorcc	%g6,	0x04F4,	%o7
	andn	%l4,	0x0C88,	%g4
	tvc	%xcc,	0x0
	edge8	%l6,	%i4,	%l2
	sra	%g5,	0x1B,	%l1
	bpos,pn	%xcc,	loop_1865
	edge8	%i0,	%o1,	%i2
	tsubcctv	%i5,	%o2,	%g2
	tn	%icc,	0x3
loop_1865:
	taddcc	%i7,	%i6,	%g1
	tcs	%xcc,	0x3
	swap	[%l7 + 0x10],	%g3
	fmovdn	%icc,	%f3,	%f29
	movvs	%icc,	%l3,	%l5
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x30] %asi,	%i1
	fmovrsgz	%l0,	%f11,	%f15
	edge8	%o6,	%g7,	%o5
	udivcc	%o3,	0x0769,	%i3
	tn	%icc,	0x4
	edge8	%o4,	%g6,	%o0
	edge16l	%l4,	%g4,	%l6
	bvs	loop_1866
	ldsw	[%l7 + 0x40],	%o7
	ldsw	[%l7 + 0x20],	%i4
	brlz	%l2,	loop_1867
loop_1866:
	bvc	loop_1868
	bne,a	loop_1869
	alignaddrl	%g5,	%l1,	%i0
loop_1867:
	addcc	%o1,	%i2,	%i5
loop_1868:
	nop
	wr	%g0,	0x23,	%asi
	stba	%o2,	[%l7 + 0x26] %asi
	membar	#Sync
loop_1869:
	sir	0x1400
	bneg	%icc,	loop_1870
	mulscc	%i7,	0x0D09,	%g2
	tneg	%xcc,	0x0
	brlez	%i6,	loop_1871
loop_1870:
	ba	%xcc,	loop_1872
	edge8	%g3,	%l3,	%g1
	st	%f26,	[%l7 + 0x2C]
loop_1871:
	xnor	%l5,	0x05D8,	%i1
loop_1872:
	edge32l	%o6,	%g7,	%o5
	move	%xcc,	%l0,	%o3
	fba	%fcc1,	loop_1873
	tge	%icc,	0x1
	fmovsneg	%xcc,	%f5,	%f25
	mulscc	%o4,	%i3,	%o0
loop_1873:
	brgez,a	%g6,	loop_1874
	edge8n	%g4,	%l4,	%o7
	edge8n	%l6,	%l2,	%g5
	taddcctv	%i4,	0x1F59,	%l1
loop_1874:
	nop
	setx	0xD64379EBF0ACFD0B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xFB3666DBEFC9A4DB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f22,	%f12
	nop
	setx	0x8FB90A46FE67BC71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x7E3173158E0B3C4B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f4,	%f6
	fabss	%f21,	%f10
	nop
	setx	0xCF0D7D9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x65B4A84B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f25,	%f6
	fxors	%f29,	%f23,	%f26
	sll	%i0,	0x0F,	%i2
	fnot1	%f14,	%f28
	fxors	%f18,	%f11,	%f31
	addccc	%o1,	%i5,	%i7
	stb	%o2,	[%l7 + 0x7D]
	brnz,a	%g2,	loop_1875
	subccc	%g3,	0x0D62,	%i6
	fmovrsne	%l3,	%f8,	%f25
	tvc	%icc,	0x1
loop_1875:
	fpsub32	%f0,	%f4,	%f30
	mulscc	%g1,	0x16F5,	%l5
	fsrc1s	%f0,	%f27
	taddcctv	%i1,	0x1282,	%g7
	movpos	%icc,	%o5,	%o6
	bneg,a	loop_1876
	movpos	%xcc,	%o3,	%o4
	nop
	setx	0x9082777F404D2671,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	umul	%i3,	0x096E,	%o0
loop_1876:
	fmul8x16al	%f0,	%f7,	%f14
	brz	%l0,	loop_1877
	ldub	[%l7 + 0x0C],	%g4
	movcs	%icc,	%l4,	%o7
	ldsh	[%l7 + 0x52],	%g6
loop_1877:
	tsubcctv	%l6,	0x12C3,	%l2
	movg	%xcc,	%i4,	%l1
	flush	%l7 + 0x58
	mulx	%g5,	0x0ACC,	%i2
	bpos,a,pt	%icc,	loop_1878
	and	%o1,	%i0,	%i7
	umulcc	%i5,	%o2,	%g3
	tpos	%icc,	0x5
loop_1878:
	stw	%i6,	[%l7 + 0x7C]
	edge8n	%g2,	%g1,	%l5
	ble	loop_1879
	fbuge	%fcc2,	loop_1880
	nop
	setx	0x0DE32ABEF040D94C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	nop
	setx	loop_1881,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1879:
	tne	%icc,	0x5
loop_1880:
	tle	%icc,	0x3
	and	%i1,	0x1145,	%g7
loop_1881:
	prefetch	[%l7 + 0x70],	 0x2
	subc	%l3,	%o6,	%o5
	edge16	%o4,	%i3,	%o0
	fornot2	%f0,	%f18,	%f18
	fpack32	%f4,	%f16,	%f8
	alignaddrl	%l0,	%o3,	%g4
	sdivcc	%l4,	0x09B0,	%o7
	fble,a	%fcc1,	loop_1882
	nop
	setx	0x5FCCF074D055F20F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	tl	%icc,	0x1
	mulx	%g6,	%l6,	%i4
loop_1882:
	addccc	%l2,	0x192E,	%l1
	fcmpeq16	%f30,	%f10,	%i2
	edge8n	%g5,	%i0,	%o1
	edge8n	%i5,	%i7,	%g3
	taddcctv	%i6,	0x0444,	%o2
	bvs	loop_1883
	tn	%icc,	0x7
	tvc	%icc,	0x2
	subc	%g1,	%g2,	%i1
loop_1883:
	taddcctv	%g7,	%l3,	%o6
	array32	%l5,	%o5,	%i3
	udiv	%o4,	0x0313,	%o0
	st	%f14,	[%l7 + 0x38]
	nop
	setx	0x08A52E247BF59A5B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xBBB75468E49CB632,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f2,	%f16
	sdivcc	%o3,	0x1D81,	%g4
	movcs	%xcc,	%l0,	%o7
	edge32l	%l4,	%g6,	%i4
	movre	%l6,	0x2FE,	%l2
	bl,a,pn	%icc,	loop_1884
	orn	%i2,	%g5,	%i0
	fpadd16	%f22,	%f30,	%f12
	fnegs	%f2,	%f8
loop_1884:
	ble,a	%icc,	loop_1885
	andcc	%l1,	%o1,	%i7
	addc	%i5,	%i6,	%o2
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g3,	%g1
loop_1885:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i1,	0x014E,	%g7
	ldd	[%l7 + 0x20],	%f16
	fmovdneg	%icc,	%f27,	%f15
	movvs	%xcc,	%l3,	%o6
	tne	%xcc,	0x7
	fpmerge	%f28,	%f20,	%f4
	edge32n	%l5,	%o5,	%g2
	fmovse	%xcc,	%f23,	%f12
	edge16	%o4,	%o0,	%i3
	fexpand	%f22,	%f26
	fbu	%fcc1,	loop_1886
	edge32n	%o3,	%g4,	%o7
	tn	%xcc,	0x0
	fexpand	%f3,	%f20
loop_1886:
	nop
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	xnorcc	%l0,	%l4,	%i4
	edge8	%l6,	%g6,	%l2
	fmovdneg	%icc,	%f4,	%f10
	fsrc2s	%f27,	%f7
	brgez,a	%g5,	loop_1887
	movrne	%i0,	%i2,	%l1
	edge32n	%o1,	%i5,	%i7
	sth	%o2,	[%l7 + 0x5E]
loop_1887:
	ldx	[%l7 + 0x10],	%g3
	fmovdge	%xcc,	%f23,	%f25
	edge16	%g1,	%i6,	%g7
	fornot1s	%f25,	%f30,	%f2
	fxnors	%f11,	%f18,	%f26
	tn	%icc,	0x2
	bn,pt	%xcc,	loop_1888
	and	%l3,	%o6,	%l5
	nop
	setx	0xA975BE330B8E4490,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xD5F0B479E7752A88,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f14,	%f8
	movrgez	%i1,	0x2EC,	%g2
loop_1888:
	tcs	%icc,	0x7
	fmovdcc	%xcc,	%f10,	%f8
	membar	0x57
	nop
	setx	loop_1889,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sllx	%o4,	0x15,	%o0
	srl	%i3,	%o3,	%o5
	movvc	%icc,	%o7,	%l0
loop_1889:
	nop
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%g4
	fpmerge	%f21,	%f6,	%f30
	tneg	%xcc,	0x0
	movl	%icc,	%i4,	%l6
	brlz	%g6,	loop_1890
	fba	%fcc1,	loop_1891
	movrgez	%l2,	%g5,	%i0
	tleu	%xcc,	0x7
loop_1890:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x7D] %asi,	%i2
loop_1891:
	fbl	%fcc2,	loop_1892
	movcc	%xcc,	%l4,	%o1
	fzero	%f14
	movcc	%xcc,	%i5,	%l1
loop_1892:
	fbge	%fcc2,	loop_1893
	movrgz	%o2,	0x27C,	%i7
	tvc	%icc,	0x7
	tsubcctv	%g3,	0x009F,	%i6
loop_1893:
	addcc	%g1,	0x1627,	%g7
	move	%xcc,	%l3,	%l5
	umulcc	%i1,	0x01E3,	%g2
	fble	%fcc3,	loop_1894
	subc	%o4,	0x0A7D,	%o6
	movpos	%xcc,	%o0,	%i3
	bgu,pn	%icc,	loop_1895
loop_1894:
	fmovrdlez	%o3,	%f28,	%f4
	fandnot1	%f14,	%f6,	%f18
	edge32n	%o7,	%l0,	%o5
loop_1895:
	fcmpeq32	%f28,	%f10,	%i4
	fbule,a	%fcc2,	loop_1896
	addccc	%l6,	0x112F,	%g4
	fpackfix	%f10,	%f1
	tvc	%xcc,	0x3
loop_1896:
	stbar
	andncc	%l2,	%g5,	%g6
	bcs,a	%xcc,	loop_1897
	fandnot2s	%f30,	%f7,	%f19
	sll	%i0,	%i2,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1897:
	tsubcc	%i5,	%l1,	%l4
	sub	%o2,	0x1A9C,	%g3
	fmovse	%icc,	%f31,	%f20
	edge16n	%i7,	%i6,	%g7
	andcc	%l3,	0x0586,	%l5
	movleu	%icc,	%i1,	%g2
	fmovsg	%icc,	%f16,	%f22
	sir	0x12DD
	alignaddrl	%g1,	%o6,	%o0
	edge32n	%i3,	%o4,	%o7
	set	0x30, %l1
	prefetcha	[%l7 + %l1] 0x0c,	 0x3
	bg,a	loop_1898
	fornot1	%f0,	%f0,	%f28
	fbge	%fcc0,	loop_1899
	smul	%o5,	%i4,	%l0
loop_1898:
	srax	%l6,	0x0C,	%g4
	orcc	%g5,	0x1374,	%l2
loop_1899:
	nop
	set	0x51, %g2
	stba	%i0,	[%l7 + %g2] 0x2f
	membar	#Sync
	smul	%i2,	%g6,	%o1
	xorcc	%l1,	%i5,	%o2
	fbo	%fcc3,	loop_1900
	nop
	setx	loop_1901,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movre	%g3,	0x3AD,	%l4
	fmovdleu	%xcc,	%f3,	%f21
loop_1900:
	brlz	%i7,	loop_1902
loop_1901:
	alignaddrl	%i6,	%g7,	%l3
	movge	%icc,	%i1,	%g2
	fmovde	%xcc,	%f18,	%f6
loop_1902:
	fmovdvc	%icc,	%f1,	%f0
	bleu,pn	%icc,	loop_1903
	subccc	%g1,	0x1574,	%l5
	fmovrsgez	%o0,	%f21,	%f7
	array16	%i3,	%o6,	%o7
loop_1903:
	popc	0x0A9E,	%o3
	nop
	setx	0x30C7E85D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x215DA1C0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f6,	%f13
	ldd	[%l7 + 0x50],	%o4
	subccc	%i4,	0x1150,	%o4
	fandnot2	%f0,	%f20,	%f20
	ldstub	[%l7 + 0x38],	%l0
	ta	%icc,	0x4
	fbue	%fcc3,	loop_1904
	orn	%g4,	0x1D52,	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%i0
loop_1904:
	umul	%i2,	%l2,	%o1
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x2
	taddcc	%g6,	%o2,	%g3
	movre	%l4,	0x302,	%i7
	set	0x210, %g6
	stxa	%i5,	[%g0 + %g6] 0x52
	sll	%i6,	%l3,	%i1
	tvs	%icc,	0x5
	xorcc	%g7,	%g1,	%l5
	fmovdneg	%icc,	%f18,	%f3
	edge32ln	%o0,	%i3,	%g2
	movcs	%icc,	%o6,	%o7
	edge8	%o5,	%o3,	%o4
	sll	%i4,	%g4,	%l6
	move	%icc,	%g5,	%l0
	brgz	%i2,	loop_1905
	edge32l	%l2,	%o1,	%i0
	tleu	%icc,	0x0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%o2
loop_1905:
	fbul	%fcc3,	loop_1906
	be,a,pn	%xcc,	loop_1907
	nop
	setx	0x0685EE2685BDB2D7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x5E797178B3C58FE0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f8,	%f18
	umul	%g3,	%l4,	%i7
loop_1906:
	call	loop_1908
loop_1907:
	fandnot1s	%f11,	%f16,	%f10
	tneg	%xcc,	0x6
	fnors	%f31,	%f6,	%f0
loop_1908:
	fmovdl	%xcc,	%f9,	%f19
	prefetch	[%l7 + 0x10],	 0x1
	ble,pn	%icc,	loop_1909
	lduh	[%l7 + 0x44],	%i5
	addc	%l1,	0x04C3,	%i6
	fsrc1s	%f19,	%f9
loop_1909:
	lduw	[%l7 + 0x08],	%l3
	bneg,pn	%xcc,	loop_1910
	addccc	%g7,	%i1,	%l5
	tcc	%xcc,	0x4
	bneg,pt	%xcc,	loop_1911
loop_1910:
	tsubcc	%o0,	%i3,	%g1
	movgu	%xcc,	%o6,	%o7
	subccc	%g2,	0x1BF7,	%o5
loop_1911:
	ldd	[%l7 + 0x68],	%f28
	movrlz	%o4,	0x296,	%i4
	fba	%fcc1,	loop_1912
	movl	%xcc,	%g4,	%o3
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x50] %asi,	%g4
loop_1912:
	nop
	set	0x20, %l2
	ldda	[%l7 + %l2] 0x24,	%l0
	ldub	[%l7 + 0x7D],	%i2
	fpack32	%f18,	%f12,	%f24
	movle	%xcc,	%l2,	%o1
	array16	%l6,	%g6,	%i0
	tl	%icc,	0x5
	nop
	fitos	%f8,	%f19
	fstox	%f19,	%f16
	fxtos	%f16,	%f4
	movcc	%icc,	%o2,	%l4
	subcc	%g3,	0x0597,	%i5
	sub	%l1,	0x1AF7,	%i6
	bg	loop_1913
	nop
	setx	0xC178A66E6A6EACEA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x121D3B3DFA4E2FC1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f16,	%f16
	fmovsne	%xcc,	%f2,	%f12
	tcs	%xcc,	0x6
loop_1913:
	bvs,a,pt	%xcc,	loop_1914
	array8	%i7,	%l3,	%i1
	movcs	%icc,	%g7,	%o0
	nop
	set	0x60, %o7
	lduh	[%l7 + %o7],	%l5
loop_1914:
	array32	%g1,	%o6,	%o7
	alignaddrl	%g2,	%i3,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a,pt	%icc,	loop_1915
	nop
	set	0x40, %i7
	lduw	[%l7 + %i7],	%o4
	xnor	%g4,	%i4,	%g5
	move	%icc,	%o3,	%i2
loop_1915:
	tvs	%xcc,	0x4
	addcc	%l2,	0x0155,	%l0
	ld	[%l7 + 0x2C],	%f17
	fabss	%f24,	%f30
	edge32n	%o1,	%g6,	%l6
	ba,pt	%icc,	loop_1916
	sethi	0x16BB,	%o2
	edge8	%i0,	%l4,	%i5
	sllx	%l1,	%g3,	%i7
loop_1916:
	udivcc	%l3,	0x0510,	%i6
	movrlez	%i1,	0x31A,	%o0
	movcc	%icc,	%l5,	%g1
	movgu	%xcc,	%g7,	%o6
	movcc	%xcc,	%g2,	%i3
	lduh	[%l7 + 0x56],	%o7
	array32	%o4,	%o5,	%i4
	brlz,a	%g4,	loop_1917
	alignaddr	%g5,	%i2,	%o3
	fbue	%fcc3,	loop_1918
	movrlez	%l2,	%l0,	%o1
loop_1917:
	edge16n	%g6,	%o2,	%l6
	set	0x40, %g4
	lda	[%l7 + %g4] 0x81,	%f20
loop_1918:
	fmovdge	%icc,	%f12,	%f6
	fmovscc	%icc,	%f9,	%f10
	stbar
	or	%i0,	%l4,	%i5
	popc	0x1DFE,	%l1
	brz	%g3,	loop_1919
	ble,a	loop_1920
	tcc	%xcc,	0x5
	tcs	%xcc,	0x5
loop_1919:
	mulx	%i7,	%i6,	%i1
loop_1920:
	fornot2	%f30,	%f4,	%f14
	movgu	%icc,	%o0,	%l3
	for	%f12,	%f2,	%f28
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	alignaddrl	%l5,	%g1,	%o6
	brgz	%g2,	loop_1921
	fblg	%fcc0,	loop_1922
	nop
	setx	loop_1923,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%xcc,	0x2
loop_1921:
	fmovsn	%xcc,	%f0,	%f21
loop_1922:
	fexpand	%f19,	%f26
loop_1923:
	brgez,a	%g7,	loop_1924
	nop
	fitos	%f9,	%f13
	fstoi	%f13,	%f15
	ld	[%l7 + 0x74],	%f5
	movneg	%xcc,	%o7,	%o4
loop_1924:
	andcc	%i3,	%o5,	%g4
	subcc	%g5,	0x15FA,	%i2
	movg	%icc,	%o3,	%i4
	movrlz	%l0,	%l2,	%o1
	mulx	%o2,	0x1035,	%l6
	bneg,pt	%xcc,	loop_1925
	addcc	%g6,	0x1DC7,	%i0
	edge32ln	%i5,	%l1,	%g3
	array32	%l4,	%i7,	%i6
loop_1925:
	array16	%i1,	%l3,	%o0
	srlx	%g1,	%l5,	%o6
	edge32ln	%g7,	%o7,	%g2
	fexpand	%f7,	%f8
	tl	%xcc,	0x1
	wr	%g0,	0x2a,	%asi
	stwa	%i3,	[%l7 + 0x64] %asi
	membar	#Sync
	fors	%f16,	%f2,	%f12
	tsubcc	%o4,	%g4,	%g5
	fmovs	%f29,	%f30
	fmovrslz	%o5,	%f13,	%f21
	movleu	%xcc,	%o3,	%i2
	tl	%icc,	0x5
	subcc	%l0,	0x076D,	%l2
	alignaddrl	%i4,	%o2,	%o1
	or	%l6,	%i0,	%i5
	fmovsl	%xcc,	%f30,	%f5
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x56] %asi,	%l1
	bge,a	%xcc,	loop_1926
	or	%g6,	0x044B,	%l4
	popc	%i7,	%i6
	movpos	%icc,	%g3,	%l3
loop_1926:
	movgu	%xcc,	%i1,	%o0
	edge32n	%l5,	%o6,	%g1
	movvs	%icc,	%g7,	%o7
	sub	%i3,	%o4,	%g2
	tvs	%icc,	0x0
	taddcc	%g4,	%g5,	%o3
	fone	%f24
	udivcc	%o5,	0x1FF8,	%l0
	tleu	%icc,	0x1
	umulcc	%i2,	%i4,	%l2
	nop
	setx	0x46435AC9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x40E0BE90,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f24,	%f14
	bleu,a	loop_1927
	fnand	%f10,	%f12,	%f10
	movrgez	%o2,	0x0A0,	%o1
	stbar
loop_1927:
	ba,a,pt	%icc,	loop_1928
	movrgez	%l6,	0x112,	%i0
	tsubcc	%i5,	%l1,	%g6
	mulx	%i7,	0x09FD,	%i6
loop_1928:
	edge32l	%g3,	%l3,	%l4
	membar	0x25
	fblg	%fcc1,	loop_1929
	fbu	%fcc3,	loop_1930
	addccc	%o0,	%l5,	%i1
	tgu	%xcc,	0x1
loop_1929:
	fbu	%fcc0,	loop_1931
loop_1930:
	fsrc2	%f12,	%f22
	fxors	%f12,	%f23,	%f29
	array8	%o6,	%g7,	%g1
loop_1931:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc2,	loop_1932
	fbue	%fcc0,	loop_1933
	movge	%icc,	%i3,	%o4
	fmovscc	%xcc,	%f18,	%f3
loop_1932:
	tsubcc	%o7,	0x194F,	%g4
loop_1933:
	tge	%icc,	0x2
	fmovsgu	%xcc,	%f19,	%f20
	bshuffle	%f28,	%f30,	%f26
	tne	%icc,	0x2
	movvs	%icc,	%g2,	%g5
	ldsb	[%l7 + 0x4E],	%o5
	call	loop_1934
	nop
	setx	0xC049538D,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	movrlz	%l0,	%o3,	%i2
	edge8	%l2,	%i4,	%o1
loop_1934:
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f24
	fxtod	%f24,	%f20
	edge32	%o2,	%i0,	%l6
	brlz	%l1,	loop_1935
	xorcc	%g6,	%i5,	%i6
	and	%i7,	0x1ADE,	%l3
	set	0x0, %i4
	stxa	%l4,	[%g0 + %i4] 0x57
loop_1935:
	movrne	%o0,	%g3,	%i1
	set	0x17, %i1
	ldstuba	[%l7 + %i1] 0x81,	%l5
	addccc	%o6,	0x0711,	%g1
	fpadd32s	%f20,	%f14,	%f10
	edge8	%g7,	%i3,	%o4
	srlx	%o7,	%g2,	%g4
	fcmpne16	%f30,	%f0,	%g5
	fmovdneg	%xcc,	%f12,	%f11
	fnot1	%f0,	%f26
	movrlz	%l0,	0x3C8,	%o3
	set	0x10, %g7
	swapa	[%l7 + %g7] 0x80,	%o5
	fxor	%f2,	%f12,	%f0
	nop
	setx	0x939FEB5DC8D16B77,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xF1F638F4F6148315,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f16,	%f12
	movrne	%l2,	%i2,	%o1
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x18] %asi,	%o2
	sdivcc	%i4,	0x01BE,	%i0
	movvc	%xcc,	%l6,	%l1
	move	%icc,	%g6,	%i6
	udivcc	%i5,	0x00ED,	%i7
	fbug	%fcc2,	loop_1936
	fmul8sux16	%f18,	%f24,	%f22
	sdiv	%l3,	0x13FF,	%l4
	tleu	%xcc,	0x4
loop_1936:
	nop
	setx loop_1937, %l0, %l1
	jmpl %l1, %o0
	fmovse	%xcc,	%f25,	%f19
	set	0x1C, %o2
	swapa	[%l7 + %o2] 0x0c,	%i1
loop_1937:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x4B] %asi,	%l5
	xnorcc	%o6,	%g3,	%g1
	edge32	%g7,	%o4,	%o7
	tsubcctv	%i3,	%g2,	%g5
	orcc	%g4,	%l0,	%o5
	edge32l	%o3,	%i2,	%l2
	movn	%icc,	%o2,	%i4
	orn	%o1,	0x03C6,	%l6
	set	0x5C, %l0
	stha	%l1,	[%l7 + %l0] 0x11
	tneg	%xcc,	0x1
	fmuld8sux16	%f2,	%f9,	%f6
	andn	%i0,	0x0081,	%g6
	srlx	%i6,	%i5,	%i7
	fzero	%f16
	sir	0x1B42
	ta	%icc,	0x1
	edge32l	%l4,	%l3,	%i1
	bge,a	loop_1938
	bgu,a,pt	%xcc,	loop_1939
	fpsub16	%f26,	%f10,	%f26
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l5,	%o6
loop_1938:
	ld	[%l7 + 0x68],	%f30
loop_1939:
	srlx	%o0,	%g3,	%g1
	ta	%icc,	0x6
	fmovdleu	%icc,	%f17,	%f28
	udivcc	%g7,	0x17B0,	%o7
	nop
	fitod	%f8,	%f18
	fdtos	%f18,	%f0
	set	0x70, %o6
	prefetcha	[%l7 + %o6] 0x19,	 0x2
	mulx	%g2,	%g5,	%g4
	movcs	%icc,	%i3,	%l0
	fabsd	%f26,	%f12
	sethi	0x0B1D,	%o3
	nop
	setx	0x8041F8BB,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	fbne	%fcc1,	loop_1940
	sdiv	%o5,	0x1FC3,	%l2
	alignaddrl	%i2,	%i4,	%o2
	fornot2	%f6,	%f26,	%f26
loop_1940:
	tcs	%xcc,	0x5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l6,	%o1
	set	0x3E, %g3
	ldsba	[%l7 + %g3] 0x88,	%l1
	fbg	%fcc3,	loop_1941
	array8	%i0,	%g6,	%i6
	te	%icc,	0x5
	std	%f2,	[%l7 + 0x58]
loop_1941:
	or	%i7,	0x0A0F,	%l4
	mulx	%i5,	0x0944,	%i1
	wr	%g0,	0x19,	%asi
	stha	%l5,	[%l7 + 0x6A] %asi
	pdist	%f16,	%f26,	%f6
	movpos	%icc,	%l3,	%o0
	movvc	%xcc,	%o6,	%g3
	fmovdcc	%xcc,	%f13,	%f3
	nop
	setx loop_1942, %l0, %l1
	jmpl %l1, %g1
	udivcc	%g7,	0x1A80,	%o7
	tgu	%icc,	0x6
	tcc	%icc,	0x5
loop_1942:
	orncc	%g2,	0x1AF6,	%o4
	andncc	%g4,	%i3,	%l0
	andncc	%o3,	%g5,	%l2
	edge16l	%i2,	%o5,	%i4
	nop
	setx	0x2BA4EDA39BE1AAAE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xC834F8DC6472E63D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f0,	%f0
	fcmpeq16	%f12,	%f14,	%o2
	movge	%icc,	%l6,	%l1
	edge32ln	%i0,	%o1,	%g6
	fmovdpos	%xcc,	%f21,	%f26
	tge	%icc,	0x5
	fnands	%f3,	%f15,	%f31
	sdiv	%i7,	0x102A,	%l4
	taddcctv	%i5,	0x0A59,	%i6
	movl	%icc,	%i1,	%l5
	membar	0x23
	taddcctv	%l3,	0x1B2B,	%o0
	tge	%xcc,	0x6
	movpos	%icc,	%o6,	%g1
	nop
	setx	0xB69327A5853FC826,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xF755253660BD9E40,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f8,	%f22
	movcc	%icc,	%g7,	%o7
	fcmpeq32	%f0,	%f4,	%g2
	fpadd32	%f0,	%f28,	%f2
	edge16	%o4,	%g4,	%g3
	movpos	%icc,	%l0,	%o3
	nop
	setx	0x8FC029EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f4
	nop
	setx loop_1943, %l0, %l1
	jmpl %l1, %g5
	bn,a	%icc,	loop_1944
	movrlez	%l2,	%i3,	%i2
	smul	%o5,	%o2,	%l6
loop_1943:
	ta	%xcc,	0x6
loop_1944:
	edge16ln	%l1,	%i0,	%i4
	fzeros	%f17
	and	%o1,	0x037B,	%g6
	tgu	%xcc,	0x6
	movcs	%xcc,	%l4,	%i5
	fbge,a	%fcc1,	loop_1945
	fmovsl	%icc,	%f27,	%f8
	fbule,a	%fcc1,	loop_1946
	subcc	%i6,	%i7,	%l5
loop_1945:
	nop
	setx	0x004F791C,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	xnorcc	%i1,	%o0,	%o6
loop_1946:
	nop
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movleu	%icc,	%l3,	%g1
	brlez,a	%g7,	loop_1947
	ldub	[%l7 + 0x1E],	%g2
	xorcc	%o7,	%o4,	%g4
	popc	0x0271,	%g3
loop_1947:
	udivx	%l0,	0x1D39,	%g5
	tn	%icc,	0x5
	tg	%icc,	0x5
	nop
	setx	loop_1948,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsw	[%l7 + 0x1C],	%o3
	fbe	%fcc1,	loop_1949
	nop
	fitos	%f20,	%f2
loop_1948:
	bne	%icc,	loop_1950
	alignaddrl	%i3,	%i2,	%l2
loop_1949:
	nop
	setx	0x1073DEFA,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	xor	%o2,	0x1697,	%l6
loop_1950:
	edge32	%o5,	%i0,	%i4
	fpack32	%f4,	%f20,	%f0
	edge8l	%o1,	%l1,	%g6
	smulcc	%l4,	%i6,	%i7
	fbe,a	%fcc1,	loop_1951
	bne,a	%xcc,	loop_1952
	pdist	%f30,	%f14,	%f12
	smul	%l5,	%i1,	%i5
loop_1951:
	fbu,a	%fcc1,	loop_1953
loop_1952:
	edge32ln	%o6,	%l3,	%o0
	movrne	%g7,	0x187,	%g1
	nop
	setx	0x9644773FDC8CDD05,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f2
loop_1953:
	mova	%xcc,	%o7,	%g2
	or	%g4,	0x142F,	%g3
	sdivcc	%o4,	0x1567,	%l0
	mulscc	%o3,	0x00D8,	%i3
	move	%icc,	%i2,	%l2
	array32	%o2,	%g5,	%o5
	umulcc	%l6,	%i0,	%o1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%i4
	fmovs	%f26,	%f3
	tn	%xcc,	0x4
	subc	%g6,	0x057A,	%l4
	fbn,a	%fcc3,	loop_1954
	fbl,a	%fcc0,	loop_1955
	brlez,a	%i7,	loop_1956
	fnot2s	%f29,	%f11
loop_1954:
	membar	0x58
loop_1955:
	orcc	%l5,	0x009B,	%i1
loop_1956:
	alignaddr	%i5,	%o6,	%i6
	smul	%l3,	0x12BD,	%g7
	fmovdvc	%xcc,	%f21,	%f7
	fbg,a	%fcc2,	loop_1957
	nop
	setx	0x914341280EE6AD18,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f0
	stbar
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x68] %asi,	%f6
loop_1957:
	mova	%icc,	%o0,	%o7
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x64] %asi,	%f20
	fmovrdgz	%g1,	%f4,	%f30
	sir	0x1805
	sll	%g2,	0x0C,	%g3
	movvc	%icc,	%g4,	%o4
	nop
	setx	0x8B9B0F4E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x46D53076,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f4,	%f28
	srl	%o3,	0x0C,	%i3
	taddcc	%l0,	%i2,	%l2
	fpsub32s	%f9,	%f26,	%f9
	tvs	%icc,	0x4
	orn	%o2,	0x1FCE,	%g5
	tcc	%icc,	0x7
	fmovsge	%icc,	%f7,	%f30
	nop
	setx	0x2F3DAB4F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x3A475E23,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f29,	%f31
	tle	%icc,	0x0
	bg,a	%xcc,	loop_1958
	fmul8sux16	%f30,	%f16,	%f0
	nop
	setx	0x782AC6B7306BBB50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fxors	%f25,	%f10,	%f8
loop_1958:
	addc	%l6,	0x1197,	%i0
	sdivcc	%o5,	0x0445,	%o1
	popc	%i4,	%g6
	std	%f14,	[%l7 + 0x20]
	edge8l	%l1,	%l4,	%l5
	set	0x18, %l5
	ldstuba	[%l7 + %l5] 0x19,	%i1
	fmovrdne	%i7,	%f8,	%f22
	xnor	%o6,	%i5,	%i6
	edge32	%g7,	%l3,	%o7
	umul	%o0,	%g2,	%g3
	set	0x44, %l4
	ldswa	[%l7 + %l4] 0x19,	%g4
	nop
	setx	0x11CD8FD33623A975,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xEF7C0A7647C6D9E3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f14,	%f0
	tvc	%xcc,	0x2
	edge16n	%o4,	%o3,	%g1
	fabsd	%f12,	%f8
	popc	%i3,	%l0
	tne	%icc,	0x2
	alignaddr	%l2,	%i2,	%g5
	ldd	[%l7 + 0x50],	%f14
	bn,a,pt	%icc,	loop_1959
	sra	%o2,	%i0,	%l6
	andn	%o1,	0x1364,	%i4
	movleu	%icc,	%o5,	%g6
loop_1959:
	alignaddrl	%l4,	%l1,	%i1
	pdist	%f12,	%f6,	%f28
	nop
	setx	0x984DFC3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x6C8829D1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f9,	%f22
	call	loop_1960
	sth	%l5,	[%l7 + 0x6C]
	ldd	[%l7 + 0x60],	%f26
	mova	%icc,	%o6,	%i7
loop_1960:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x14] %asi,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x07BD3A4E936E0716,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x76CB506CB0633491,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f12,	%f6
	nop
	setx	0x90DB80B5AC9D4FBD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x0EE1C07773312791,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f24,	%f20
	array32	%g7,	%l3,	%o7
	fmovdpos	%xcc,	%f16,	%f8
	edge16ln	%o0,	%i6,	%g2
	wr	%g0,	0x2f,	%asi
	stwa	%g4,	[%l7 + 0x14] %asi
	membar	#Sync
	fmul8ulx16	%f22,	%f28,	%f22
	fmul8x16	%f30,	%f22,	%f12
	ldsb	[%l7 + 0x0D],	%g3
	fmovrdgz	%o3,	%f22,	%f16
	orncc	%o4,	%g1,	%l0
	tge	%icc,	0x1
	fbu,a	%fcc3,	loop_1961
	fmuld8sux16	%f19,	%f17,	%f28
	sra	%l2,	%i3,	%i2
	mulscc	%o2,	0x0623,	%g5
loop_1961:
	subccc	%i0,	0x042F,	%o1
	tn	%xcc,	0x4
	mulscc	%l6,	0x1B35,	%i4
	array16	%g6,	%o5,	%l1
	fmul8x16al	%f29,	%f16,	%f0
	array16	%l4,	%i1,	%l5
	addcc	%o6,	%i7,	%i5
	tn	%icc,	0x2
	sllx	%l3,	0x0B,	%g7
	fxnor	%f12,	%f4,	%f20
	nop
	set	0x6D, %i2
	stb	%o7,	[%l7 + %i2]
	addcc	%i6,	%o0,	%g2
	movn	%xcc,	%g3,	%g4
	movrgez	%o3,	0x05E,	%o4
	xnorcc	%l0,	%l2,	%g1
	fmovde	%icc,	%f16,	%f27
	movvs	%xcc,	%i2,	%o2
	xnorcc	%i3,	%g5,	%i0
	fble,a	%fcc3,	loop_1962
	alignaddrl	%l6,	%i4,	%g6
	tleu	%icc,	0x3
	movpos	%xcc,	%o1,	%l1
loop_1962:
	edge32n	%l4,	%i1,	%l5
	popc	0x0F8B,	%o6
	fxnor	%f14,	%f2,	%f30
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x37] %asi,	%i7
	sll	%o5,	0x11,	%l3
	xnor	%i5,	0x1335,	%o7
	fpadd16s	%f8,	%f0,	%f21
	tcs	%xcc,	0x5
	movvs	%icc,	%g7,	%o0
	fbg	%fcc3,	loop_1963
	fmovsa	%xcc,	%f20,	%f17
	movre	%g2,	%i6,	%g3
	sra	%o3,	%g4,	%l0
loop_1963:
	nop
	setx loop_1964, %l0, %l1
	jmpl %l1, %o4
	fbu	%fcc0,	loop_1965
	xorcc	%l2,	%g1,	%o2
	nop
	setx	0xA52D4BE0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x1094571F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f1,	%f16
loop_1964:
	ld	[%l7 + 0x3C],	%f20
loop_1965:
	edge16n	%i2,	%i3,	%i0
	fmovsvc	%icc,	%f13,	%f6
	tne	%xcc,	0x4
	fbug,a	%fcc3,	loop_1966
	edge32	%g5,	%l6,	%i4
	movrlez	%o1,	%g6,	%l1
	sra	%i1,	%l5,	%l4
loop_1966:
	tcs	%icc,	0x2
	edge16n	%o6,	%i7,	%o5
	movrne	%l3,	%o7,	%i5
	fmovdneg	%xcc,	%f28,	%f23
	ta	%xcc,	0x3
	ldd	[%l7 + 0x68],	%g6
	tneg	%icc,	0x0
	alignaddrl	%g2,	%i6,	%g3
	fmovdcs	%icc,	%f21,	%f30
	taddcc	%o3,	0x0936,	%g4
	tle	%icc,	0x1
	fmovrsne	%o0,	%f7,	%f20
	sir	0x0DAE
	tl	%icc,	0x3
	ldd	[%l7 + 0x20],	%o4
	brgez,a	%l0,	loop_1967
	edge8	%g1,	%l2,	%o2
	fmovd	%f24,	%f20
	edge16l	%i2,	%i3,	%i0
loop_1967:
	smul	%g5,	%l6,	%i4
	and	%o1,	0x06D9,	%l1
	subcc	%g6,	0x0D2A,	%l5
	fbn,a	%fcc2,	loop_1968
	tgu	%icc,	0x6
	taddcc	%l4,	0x06E9,	%i1
	fcmpgt16	%f22,	%f20,	%i7
loop_1968:
	andncc	%o5,	%l3,	%o6
	fzeros	%f23
	movge	%icc,	%i5,	%o7
	fnot2s	%f23,	%f23
	movleu	%xcc,	%g7,	%g2
	movge	%xcc,	%g3,	%i6
	orncc	%g4,	%o0,	%o4
	tl	%xcc,	0x1
	movgu	%icc,	%l0,	%g1
	movneg	%icc,	%o3,	%o2
	ldub	[%l7 + 0x72],	%i2
	srax	%i3,	%i0,	%l2
	movcs	%xcc,	%l6,	%g5
	addccc	%i4,	0x10C2,	%l1
	stbar
	bn,a,pt	%xcc,	loop_1969
	nop
	set	0x5E, %g1
	sth	%o1,	[%l7 + %g1]
	movre	%l5,	0x228,	%l4
	alignaddrl	%i1,	%g6,	%o5
loop_1969:
	movn	%xcc,	%i7,	%l3
	xnor	%o6,	0x0543,	%o7
	fble	%fcc0,	loop_1970
	brlz,a	%g7,	loop_1971
	umulcc	%g2,	%i5,	%i6
	xor	%g3,	%o0,	%g4
loop_1970:
	fors	%f31,	%f7,	%f18
loop_1971:
	bcs,pn	%xcc,	loop_1972
	popc	%l0,	%o4
	sethi	0x163A,	%o3
	set	0x2F, %i6
	stba	%g1,	[%l7 + %i6] 0x11
loop_1972:
	fmovsn	%icc,	%f11,	%f15
	edge16ln	%i2,	%i3,	%i0
	nop
	setx	0xF57AC325,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x5B32164D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f3,	%f7
	sir	0x0D6C
	fmovdvs	%xcc,	%f15,	%f14
	fmovrse	%l2,	%f30,	%f15
	movleu	%xcc,	%o2,	%l6
	fnands	%f30,	%f25,	%f11
	fmovrsgez	%g5,	%f8,	%f9
	bvc,pn	%xcc,	loop_1973
	srl	%l1,	%i4,	%o1
	smulcc	%l5,	0x06B9,	%i1
	srl	%l4,	0x19,	%g6
loop_1973:
	fbe,a	%fcc0,	loop_1974
	edge16	%o5,	%i7,	%o6
	fandnot2s	%f19,	%f25,	%f31
	sra	%l3,	0x18,	%g7
loop_1974:
	fmovrsgez	%o7,	%f8,	%f7
	sllx	%g2,	0x17,	%i5
	sethi	0x18BE,	%g3
	set	0x08, %l3
	lda	[%l7 + %l3] 0x80,	%f18
	addc	%o0,	0x1859,	%g4
	fbe	%fcc1,	loop_1975
	fbo,a	%fcc2,	loop_1976
	fbe,a	%fcc1,	loop_1977
	and	%l0,	%o4,	%i6
loop_1975:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%i2
loop_1976:
	xor	%i3,	%g1,	%i0
loop_1977:
	subc	%o2,	%l2,	%l6
	smul	%g5,	0x0600,	%l1
	tl	%xcc,	0x3
	brgez	%o1,	loop_1978
	tvs	%icc,	0x2
	andcc	%l5,	%i4,	%i1
	fmovsg	%xcc,	%f3,	%f6
loop_1978:
	array16	%g6,	%l4,	%i7
	sdivcc	%o6,	0x0265,	%o5
	nop
	setx loop_1979, %l0, %l1
	jmpl %l1, %g7
	fmovdleu	%xcc,	%f20,	%f11
	fpack16	%f30,	%f16
	movrgez	%o7,	0x092,	%l3
loop_1979:
	movne	%xcc,	%g2,	%g3
	fmovrse	%o0,	%f26,	%f9
	ldd	[%l7 + 0x08],	%f26
	nop
	fitos	%f29,	%f27
	tcs	%icc,	0x4
	brlz	%i5,	loop_1980
	fble	%fcc0,	loop_1981
	array8	%g4,	%l0,	%o4
	edge8	%i6,	%o3,	%i2
loop_1980:
	nop
	wr	%g0,	0x0c,	%asi
	stba	%i3,	[%l7 + 0x6C] %asi
loop_1981:
	fnot1s	%f13,	%f24
	udiv	%g1,	0x1677,	%i0
	and	%l2,	0x10DE,	%o2
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x6D] %asi,	%l6
	taddcctv	%l1,	%g5,	%l5
	fmul8x16	%f0,	%f30,	%f26
	alignaddr	%i4,	%o1,	%g6
	fmovdcs	%icc,	%f3,	%f17
	bcs,a	%xcc,	loop_1982
	edge16l	%l4,	%i1,	%i7
	movle	%icc,	%o6,	%o5
	movcc	%icc,	%g7,	%l3
loop_1982:
	andncc	%g2,	%g3,	%o0
	fpack16	%f22,	%f21
	orn	%o7,	0x0536,	%g4
	fandnot2	%f22,	%f12,	%f22
	brnz,a	%i5,	loop_1983
	bcs,pn	%icc,	loop_1984
	movrlez	%o4,	%l0,	%i6
	andncc	%o3,	%i2,	%g1
loop_1983:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1984:
	st	%f27,	[%l7 + 0x6C]
	fpsub32s	%f24,	%f21,	%f30
	movvs	%icc,	%i3,	%l2
	fandnot1s	%f9,	%f31,	%f30
	or	%o2,	0x1278,	%l6
	edge16ln	%i0,	%g5,	%l5
	fbul,a	%fcc3,	loop_1985
	stw	%i4,	[%l7 + 0x5C]
	addcc	%o1,	0x1AE1,	%l1
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l4
loop_1985:
	tge	%icc,	0x3
	andncc	%g6,	%i7,	%o6
	edge16l	%i1,	%g7,	%o5
	edge32	%l3,	%g2,	%o0
	smul	%o7,	0x119C,	%g4
	movre	%i5,	%g3,	%o4
	edge8ln	%l0,	%i6,	%o3
	movrne	%i2,	0x041,	%g1
	fbn,a	%fcc2,	loop_1986
	tsubcc	%l2,	%i3,	%o2
	andncc	%i0,	%g5,	%l6
	movrlz	%l5,	%i4,	%l1
loop_1986:
	andncc	%o1,	%g6,	%i7
	tn	%icc,	0x7
	nop
	setx	loop_1987,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnands	%f7,	%f30,	%f18
	bge	loop_1988
	andncc	%o6,	%l4,	%i1
loop_1987:
	sir	0x07B4
	fbuge,a	%fcc0,	loop_1989
loop_1988:
	tneg	%xcc,	0x5
	ta	%xcc,	0x1
	sllx	%g7,	0x05,	%o5
loop_1989:
	tvs	%xcc,	0x7
	fbule	%fcc3,	loop_1990
	fmovdcs	%xcc,	%f22,	%f20
	smul	%g2,	0x1533,	%o0
	sethi	0x1AD0,	%o7
loop_1990:
	orncc	%l3,	%g4,	%g3
	fbg	%fcc3,	loop_1991
	alignaddrl	%i5,	%l0,	%i6
	te	%icc,	0x4
	tvs	%icc,	0x7
loop_1991:
	fbug	%fcc3,	loop_1992
	tneg	%xcc,	0x0
	andn	%o4,	0x1DB0,	%o3
	tsubcc	%g1,	0x0D0F,	%l2
loop_1992:
	fbule,a	%fcc1,	loop_1993
	orncc	%i3,	%i2,	%o2
	fandnot2	%f6,	%f6,	%f16
	fcmpgt32	%f22,	%f16,	%g5
loop_1993:
	tneg	%xcc,	0x2
	sdivx	%i0,	0x1EF8,	%l6
	bpos,a,pt	%icc,	loop_1994
	mulscc	%l5,	0x1015,	%i4
	srax	%l1,	%o1,	%i7
	tneg	%xcc,	0x5
loop_1994:
	move	%icc,	%o6,	%l4
	edge16	%g6,	%i1,	%g7
	sll	%g2,	0x17,	%o5
	nop
	setx	loop_1995,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%o0,	%o7,	%l3
	fmovsg	%icc,	%f29,	%f19
	andcc	%g3,	0x0708,	%i5
loop_1995:
	addcc	%l0,	0x0A39,	%g4
	alignaddr	%i6,	%o3,	%g1
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovrdgez	%l2,	%f22,	%f26
	ta	%icc,	0x0
	srlx	%o4,	0x1D,	%i3
	movn	%icc,	%o2,	%i2
	fbg,a	%fcc0,	loop_1996
	umulcc	%g5,	%l6,	%l5
	tge	%icc,	0x1
	addcc	%i0,	0x0B50,	%l1
loop_1996:
	nop
	setx	0xB0937128,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x1FC60975,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f13,	%f23
	fsrc2s	%f16,	%f7
	set	0x40, %g5
	stxa	%i4,	[%l7 + %g5] 0x80
	edge32	%i7,	%o1,	%l4
	fpsub16	%f14,	%f2,	%f30
	fxnors	%f4,	%f6,	%f6
	movpos	%xcc,	%g6,	%i1
	bneg,pn	%xcc,	loop_1997
	tl	%xcc,	0x2
	movcs	%xcc,	%g7,	%g2
	stbar
loop_1997:
	orncc	%o6,	%o0,	%o5
	tvs	%icc,	0x3
	movvc	%icc,	%o7,	%l3
	bleu,pt	%xcc,	loop_1998
	nop
	setx	0x88AF5D3F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x093441BB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f19,	%f24
	sub	%i5,	%g3,	%l0
	fandnot2s	%f15,	%f11,	%f16
loop_1998:
	movleu	%xcc,	%i6,	%g4
	movrlez	%g1,	%o3,	%o4
	smulcc	%i3,	0x0D3A,	%l2
	edge16ln	%i2,	%g5,	%o2
	edge8n	%l5,	%i0,	%l1
	st	%f13,	[%l7 + 0x44]
	sub	%i4,	%l6,	%o1
	fand	%f6,	%f10,	%f12
	srlx	%l4,	0x11,	%i7
	bleu	loop_1999
	fmovdcs	%xcc,	%f10,	%f12
	brgez	%i1,	loop_2000
	tpos	%icc,	0x6
loop_1999:
	fmovrsgz	%g6,	%f11,	%f18
	set	0x5C, %o3
	ldswa	[%l7 + %o3] 0x0c,	%g2
loop_2000:
	smul	%o6,	0x1230,	%o0
	smul	%g7,	0x1DE8,	%o5
	fmuld8sux16	%f7,	%f7,	%f22
	movrne	%o7,	%l3,	%i5
	array32	%l0,	%i6,	%g4
	stx	%g1,	[%l7 + 0x58]
	umul	%o3,	%o4,	%i3
	array8	%l2,	%i2,	%g3
	movcs	%icc,	%g5,	%l5
	tn	%icc,	0x3
	movrgez	%o2,	%i0,	%l1
	move	%icc,	%l6,	%o1
	sll	%i4,	0x10,	%l4
	xorcc	%i1,	0x0226,	%g6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x34] %asi,	%i7
	bneg,a	loop_2001
	lduw	[%l7 + 0x70],	%g2
	edge8ln	%o0,	%o6,	%g7
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x68] %asi,	%o7
loop_2001:
	ldd	[%l7 + 0x70],	%f8
	xorcc	%l3,	%o5,	%l0
	fnegs	%f22,	%f26
	sdivcc	%i6,	0x1B0E,	%g4
	alignaddrl	%g1,	%o3,	%i5
	set	0x26, %o5
	ldsha	[%l7 + %o5] 0x88,	%i3
	fands	%f29,	%f23,	%f1
	edge32	%l2,	%o4,	%i2
	taddcc	%g3,	0x0C40,	%g5
	nop
	set	0x6C, %o4
	prefetch	[%l7 + %o4],	 0x1
	fmovrde	%o2,	%f12,	%f24
	bgu,pn	%xcc,	loop_2002
	udiv	%i0,	0x162A,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l1,	%l6,	%o1
loop_2002:
	orncc	%i4,	0x03FC,	%i1
	fmovdcc	%icc,	%f29,	%f31
	andncc	%g6,	%i7,	%g2
	ta	%icc,	0x1
	fabsd	%f8,	%f14
	tpos	%icc,	0x6
	fmovsleu	%icc,	%f22,	%f7
	edge32l	%l4,	%o0,	%g7
	movre	%o7,	%o6,	%o5
	xnorcc	%l3,	0x18EE,	%l0
	smul	%g4,	0x1EE0,	%i6
	fmovdne	%xcc,	%f2,	%f0
	sth	%o3,	[%l7 + 0x12]
	umul	%i5,	0x1F7D,	%i3
	fxor	%f14,	%f0,	%f14
	nop
	setx	0xE075B425,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	add	%g1,	0x1909,	%o4
	movneg	%xcc,	%i2,	%g3
	nop
	setx	loop_2003,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmuld8sux16	%f10,	%f30,	%f28
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
loop_2003:
	brz	%o2,	loop_2004
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i0,	%l5,	%l2
	mulx	%l1,	%l6,	%o1
loop_2004:
	sdiv	%i4,	0x0642,	%g6
	movcs	%icc,	%i1,	%g2
	fpsub16	%f2,	%f18,	%f8
	fblg	%fcc1,	loop_2005
	fone	%f24
	tgu	%icc,	0x0
	bpos	%icc,	loop_2006
loop_2005:
	srax	%i7,	%o0,	%l4
	membar	0x11
	orcc	%o7,	%g7,	%o6
loop_2006:
	ldd	[%l7 + 0x60],	%f16
	fzeros	%f31
	sethi	0x1EB5,	%l3
	fbl,a	%fcc0,	loop_2007
	edge16l	%o5,	%l0,	%g4
	fmovsg	%xcc,	%f12,	%f11
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%i6
loop_2007:
	and	%o3,	%i3,	%i5
	sdiv	%g1,	0x18EB,	%o4
	fmovrdne	%g3,	%f30,	%f6
	subcc	%g5,	0x0D1B,	%i2
	lduw	[%l7 + 0x5C],	%o2
	fbl	%fcc3,	loop_2008
	fmovdneg	%icc,	%f6,	%f31
	alignaddrl	%l5,	%l2,	%i0
	movn	%xcc,	%l1,	%o1
loop_2008:
	nop
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	sllx	%l6,	0x08,	%g6
	mulx	%i4,	0x044B,	%i1
	bl,pt	%xcc,	loop_2009
	fmovsne	%icc,	%f16,	%f29
	popc	0x1891,	%i7
	xnorcc	%o0,	%g2,	%l4
loop_2009:
	nop
	fitod	%f20,	%f12
	fbg,a	%fcc0,	loop_2010
	bcc	%xcc,	loop_2011
	nop
	setx	0xA1DDD49C351DE0E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x942EDEDF94AFF3B6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f18,	%f24
	nop
	setx loop_2012, %l0, %l1
	jmpl %l1, %g7
loop_2010:
	fones	%f15
loop_2011:
	nop
	setx	0xD7E8F2F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xBB95937A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f23,	%f5
	fpsub32	%f10,	%f28,	%f10
loop_2012:
	xorcc	%o7,	%l3,	%o6
	fzeros	%f4
	tleu	%xcc,	0x7
	subcc	%o5,	%l0,	%i6
	fzeros	%f26
	fcmpeq16	%f12,	%f30,	%o3
	bcc,pn	%xcc,	loop_2013
	addccc	%i3,	%i5,	%g1
	nop
	setx	loop_2014,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdcs	%xcc,	%f9,	%f15
loop_2013:
	nop
	wr	%g0,	0x2a,	%asi
	stxa	%o4,	[%l7 + 0x30] %asi
	membar	#Sync
loop_2014:
	andncc	%g3,	%g4,	%g5
	smul	%o2,	0x1DE2,	%l5
	set	0x3C, %i0
	lduwa	[%l7 + %i0] 0x15,	%l2
	fmovsgu	%xcc,	%f11,	%f4
	fmovrsne	%i0,	%f22,	%f27
	fmovrslez	%i2,	%f28,	%f5
	movrlz	%o1,	%l1,	%l6
	ldsb	[%l7 + 0x56],	%i4
	fmovscs	%xcc,	%f8,	%f19
	fblg	%fcc3,	loop_2015
	fbug,a	%fcc0,	loop_2016
	movre	%g6,	%i7,	%o0
	udivcc	%g2,	0x1021,	%i1
loop_2015:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x58] %asi,	%l4
loop_2016:
	addc	%o7,	%g7,	%o6
	fmovrdgz	%o5,	%f20,	%f28
	udivcc	%l0,	0x06F7,	%l3
	nop
	setx	loop_2017,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32	%i6,	%o3,	%i3
	nop
	fitod	%f13,	%f8
	fmovse	%icc,	%f0,	%f23
loop_2017:
	nop
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x50] %asi,	%g0
	umul	%o4,	%g3,	%g4
	fmovdl	%icc,	%f31,	%f11
	fmovrsgz	%g5,	%f29,	%f0
	movl	%icc,	%i5,	%l5
	movle	%xcc,	%l2,	%i0
	std	%f6,	[%l7 + 0x18]
	set	0x45, %i3
	ldstuba	[%l7 + %i3] 0x89,	%o2
	fcmpgt32	%f4,	%f10,	%i2
	movvs	%icc,	%o1,	%l6
	udiv	%i4,	0x0DD9,	%l1
	udivx	%g6,	0x02AF,	%o0
	sdivcc	%g2,	0x1BDF,	%i7
	tl	%icc,	0x4
	ldd	[%l7 + 0x50],	%f16
	std	%f26,	[%l7 + 0x38]
	tcc	%xcc,	0x6
	sll	%l4,	%i1,	%g7
	fmovscc	%xcc,	%f15,	%f31
	nop
	fitos	%f18,	%f11
	orn	%o7,	0x1584,	%o6
	sth	%l0,	[%l7 + 0x48]
	taddcctv	%o5,	%i6,	%o3
	fabsd	%f18,	%f26
	fmovdvs	%icc,	%f18,	%f5
	movrgz	%i3,	%l3,	%g1
	tleu	%icc,	0x0
	sllx	%o4,	0x10,	%g4
	movne	%xcc,	%g3,	%i5
	sra	%g5,	0x1F,	%l5
	movneg	%xcc,	%i0,	%o2
	fmovda	%xcc,	%f17,	%f18
	fbg,a	%fcc3,	loop_2018
	nop
	setx	0x5810F85686845FAA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f24
	te	%xcc,	0x7
	taddcctv	%i2,	0x0CFF,	%l2
loop_2018:
	movne	%xcc,	%o1,	%l6
	edge8ln	%l1,	%g6,	%i4
	mova	%xcc,	%o0,	%i7
	fblg	%fcc3,	loop_2019
	bleu,a,pt	%xcc,	loop_2020
	addccc	%l4,	%g2,	%g7
	movneg	%xcc,	%i1,	%o6
loop_2019:
	fmovd	%f6,	%f12
loop_2020:
	edge16l	%o7,	%l0,	%o5
	fors	%f30,	%f30,	%f4
	fmovrsgz	%i6,	%f16,	%f7
	sll	%o3,	0x11,	%i3
	and	%g1,	%l3,	%o4
	alignaddr	%g3,	%g4,	%i5
	srl	%g5,	0x08,	%l5
	tcs	%icc,	0x7
	addc	%i0,	0x1138,	%i2
	set	0x72, %i5
	stba	%o2,	[%l7 + %i5] 0x23
	membar	#Sync
	fmovrslz	%o1,	%f25,	%f17
	fbuge,a	%fcc1,	loop_2021
	mova	%icc,	%l6,	%l1
	nop
	fitos	%f14,	%f17
	orncc	%l2,	0x1A20,	%g6
loop_2021:
	array16	%i4,	%o0,	%l4
	movneg	%icc,	%i7,	%g2
	sll	%g7,	%i1,	%o7
	movcs	%xcc,	%l0,	%o6
	nop
	fitos	%f19,	%f19
	movleu	%icc,	%i6,	%o5
	ldsw	[%l7 + 0x68],	%i3
	ldx	[%l7 + 0x38],	%o3
	fpadd16	%f10,	%f6,	%f28
	edge8	%g1,	%l3,	%g3
	wr	%g0,	0x88,	%asi
	stba	%g4,	[%l7 + 0x7E] %asi
	ble,a,pt	%icc,	loop_2022
	movcc	%xcc,	%o4,	%i5
	brgz,a	%l5,	loop_2023
	sra	%g5,	0x07,	%i2
loop_2022:
	alignaddrl	%o2,	%i0,	%l6
	fcmpgt16	%f28,	%f22,	%l1
loop_2023:
	array32	%o1,	%g6,	%l2
	stx	%i4,	[%l7 + 0x40]
	nop
	setx	0x7C78133DF5E19C3F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x49C3FFA842A29090,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f28,	%f16
	st	%f5,	[%l7 + 0x44]
	ldsb	[%l7 + 0x57],	%o0
	move	%icc,	%l4,	%g2
	fmovdn	%icc,	%f14,	%f1
	edge16n	%i7,	%g7,	%o7
	edge8ln	%i1,	%l0,	%o6
	set	0x30, %o1
	swapa	[%l7 + %o1] 0x80,	%o5
	te	%xcc,	0x0
	subccc	%i6,	0x06C7,	%i3
	sdivcc	%g1,	0x1413,	%o3
	movpos	%icc,	%l3,	%g3
	edge16ln	%o4,	%g4,	%i5
	brz	%l5,	loop_2024
	movrgez	%g5,	0x0E3,	%o2
	set	0x60, %l6
	swapa	[%l7 + %l6] 0x11,	%i0
loop_2024:
	edge16ln	%l6,	%i2,	%l1
	bcs	loop_2025
	brlez	%g6,	loop_2026
	fornot1s	%f22,	%f11,	%f3
	tcc	%icc,	0x1
loop_2025:
	fbu	%fcc0,	loop_2027
loop_2026:
	movre	%o1,	%i4,	%l2
	tge	%icc,	0x3
	addcc	%o0,	0x070E,	%l4
loop_2027:
	nop
	setx	0x62E16EB7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x19BB0999,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f8,	%f29
	ldsw	[%l7 + 0x74],	%g2
	movn	%xcc,	%i7,	%o7
	fcmple16	%f0,	%f18,	%i1
	fnands	%f8,	%f13,	%f18
	subcc	%l0,	%g7,	%o5
	orn	%o6,	%i3,	%i6
	fbule	%fcc3,	loop_2028
	fbul,a	%fcc0,	loop_2029
	nop
	setx	0x5B41499AD70D4C76,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x1CA893841B47BE63,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f26,	%f22
	tneg	%icc,	0x5
loop_2028:
	fmovdcs	%xcc,	%f0,	%f21
loop_2029:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x1
	movvs	%icc,	%g1,	%l3
	edge16	%o3,	%g3,	%o4
	brgez	%g4,	loop_2030
	brgez	%l5,	loop_2031
	edge16	%i5,	%g5,	%o2
	fbg	%fcc1,	loop_2032
loop_2030:
	movrlez	%i0,	0x2C6,	%i2
loop_2031:
	nop
	fitod	%f0,	%f26
	fdtos	%f26,	%f19
	edge8n	%l6,	%l1,	%o1
loop_2032:
	movrlz	%i4,	0x2B4,	%g6
	fcmpgt32	%f4,	%f18,	%l2
	array8	%o0,	%g2,	%l4
	fmovdvc	%icc,	%f11,	%f4
	fbn	%fcc0,	loop_2033
	sir	0x0790
	edge8	%o7,	%i1,	%i7
	popc	%g7,	%o5
loop_2033:
	tle	%icc,	0x4
	move	%icc,	%o6,	%i3
	movleu	%icc,	%i6,	%l0
	tne	%icc,	0x5
	movgu	%icc,	%l3,	%o3
	edge16n	%g1,	%o4,	%g4
	fbne,a	%fcc0,	loop_2034
	bcs,a,pt	%xcc,	loop_2035
	andncc	%g3,	%i5,	%l5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o2,	%g5
loop_2034:
	fbl,a	%fcc3,	loop_2036
loop_2035:
	fbo	%fcc3,	loop_2037
	brnz	%i0,	loop_2038
	umul	%i2,	0x0967,	%l6
loop_2036:
	bvc	loop_2039
loop_2037:
	be,a,pt	%xcc,	loop_2040
loop_2038:
	membar	0x14
	tge	%xcc,	0x1
loop_2039:
	fcmpne16	%f10,	%f14,	%l1
loop_2040:
	smulcc	%i4,	0x1AE7,	%o1
	edge16l	%g6,	%o0,	%g2
	subc	%l4,	0x1C3E,	%o7
	move	%icc,	%i1,	%i7
	tcs	%icc,	0x5
	fxor	%f4,	%f2,	%f20
	fmovdpos	%xcc,	%f12,	%f21
	srl	%g7,	0x01,	%o5
	fone	%f14
	fnot1s	%f25,	%f29
	bne	loop_2041
	fmovrdlz	%o6,	%f2,	%f18
	udivcc	%i3,	0x0FC9,	%l2
	fble	%fcc1,	loop_2042
loop_2041:
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%f12
	movrlez	%i6,	0x301,	%l0
	edge8n	%o3,	%l3,	%g1
loop_2042:
	movrgz	%g4,	%g3,	%o4
	ldub	[%l7 + 0x0E],	%i5
	fmovsne	%xcc,	%f23,	%f28
	stx	%o2,	[%l7 + 0x08]
	fnand	%f10,	%f14,	%f6
	sir	0x15BD
	fmul8x16au	%f6,	%f30,	%f10
	tcs	%icc,	0x4
	bge	loop_2043
	fsrc1s	%f4,	%f16
	mulx	%g5,	0x18EF,	%i0
	andcc	%l5,	0x1A05,	%i2
loop_2043:
	fmovrdlez	%l6,	%f10,	%f28
	sub	%i4,	0x04B1,	%l1
	fmovsa	%icc,	%f11,	%f0
	sir	0x1F33
	udiv	%g6,	0x1A41,	%o1
	sdivx	%g2,	0x0873,	%l4
	tgu	%icc,	0x0
	stb	%o0,	[%l7 + 0x3E]
	xnor	%o7,	0x16A8,	%i1
	fbu,a	%fcc1,	loop_2044
	bne	%xcc,	loop_2045
	fmovrdlz	%i7,	%f12,	%f10
	xnorcc	%o5,	%g7,	%o6
loop_2044:
	sdivx	%l2,	0x13BD,	%i6
loop_2045:
	tneg	%xcc,	0x0
	bge,a,pn	%icc,	loop_2046
	or	%l0,	0x1FD8,	%i3
	edge8	%l3,	%o3,	%g1
	movrlz	%g4,	%g3,	%o4
loop_2046:
	udivx	%i5,	0x0912,	%o2
	fnot2s	%f10,	%f29
	fpackfix	%f12,	%f22
	tgu	%xcc,	0x7
	move	%icc,	%g5,	%l5
	movre	%i2,	0x047,	%l6
	movvs	%xcc,	%i4,	%i0
	fmovdcc	%xcc,	%f27,	%f16
	fandnot1	%f20,	%f4,	%f0
	sethi	0x1222,	%l1
	st	%f24,	[%l7 + 0x58]
	edge32n	%o1,	%g2,	%l4
	array16	%o0,	%o7,	%g6
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	movcs	%icc,	%i7,	%o5
	ldsb	[%l7 + 0x34],	%g7
	umulcc	%o6,	%l2,	%l0
	tg	%icc,	0x5
	fmovrdlz	%i6,	%f20,	%f30
	brgez,a	%i3,	loop_2047
	tpos	%icc,	0x6
	bvs,pt	%icc,	loop_2048
	udivx	%o3,	0x0FA8,	%l3
loop_2047:
	te	%xcc,	0x0
	movg	%icc,	%g1,	%g3
loop_2048:
	fbl,a	%fcc1,	loop_2049
	sth	%o4,	[%l7 + 0x1A]
	bpos	%xcc,	loop_2050
	fsrc2	%f4,	%f0
loop_2049:
	udiv	%g4,	0x1FDB,	%i5
	bvs	loop_2051
loop_2050:
	tvs	%icc,	0x1
	edge16ln	%o2,	%l5,	%i2
	alignaddr	%g5,	%i4,	%l6
loop_2051:
	taddcc	%l1,	%i0,	%o1
	edge16ln	%l4,	%o0,	%o7
	smul	%g6,	%g2,	%i7
	tleu	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f3,	%f2,	%f20
	add	%i1,	%g7,	%o5
	array32	%l2,	%o6,	%i6
	tneg	%icc,	0x2
	edge8ln	%l0,	%i3,	%l3
	sdivx	%o3,	0x0156,	%g3
	fba,a	%fcc1,	loop_2052
	bshuffle	%f30,	%f4,	%f24
	sir	0x0558
	sub	%g1,	0x1638,	%g4
loop_2052:
	sllx	%i5,	0x1D,	%o2
	add	%o4,	%i2,	%g5
	addcc	%i4,	0x01B5,	%l5
	faligndata	%f6,	%f0,	%f20
	ldsb	[%l7 + 0x12],	%l6
	tle	%icc,	0x6
	movvc	%icc,	%i0,	%o1
	srlx	%l1,	0x17,	%l4
	movl	%xcc,	%o7,	%o0
	edge16	%g2,	%g6,	%i7
	movleu	%icc,	%i1,	%o5
	move	%xcc,	%l2,	%g7
	nop
	setx	0x8162659A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x41AA5E2A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f28,	%f13
	tl	%xcc,	0x6
	bl	%icc,	loop_2053
	tg	%icc,	0x4
	fones	%f12
	call	loop_2054
loop_2053:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o6,	0x04EA,	%i6
	edge32l	%l0,	%i3,	%l3
loop_2054:
	xor	%g3,	0x1ACC,	%g1
	sdivcc	%g4,	0x0F18,	%i5
	ldub	[%l7 + 0x45],	%o2
	fble	%fcc1,	loop_2055
	fnegs	%f31,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o3,	0x1443,	%i2
loop_2055:
	nop
	set	0x64, %g2
	ldswa	[%l7 + %g2] 0x89,	%o4
	sdivcc	%i4,	0x1F95,	%l5
	tvc	%xcc,	0x1
	fmovrde	%l6,	%f22,	%f28
	bpos,a,pn	%xcc,	loop_2056
	movpos	%icc,	%g5,	%o1
	movrgz	%l1,	%i0,	%o7
	tcs	%xcc,	0x1
loop_2056:
	fbuge	%fcc0,	loop_2057
	edge16n	%o0,	%l4,	%g6
	movge	%icc,	%g2,	%i7
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i1
loop_2057:
	fmovsl	%icc,	%f24,	%f22
	move	%xcc,	%l2,	%g7
	fbn	%fcc2,	loop_2058
	udiv	%o6,	0x0F68,	%i6
	tcs	%xcc,	0x2
	tne	%xcc,	0x5
loop_2058:
	mova	%icc,	%l0,	%i3
	fbul	%fcc1,	loop_2059
	sra	%l3,	0x1C,	%o5
	nop
	setx	0xD710490C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x82142F12,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f12,	%f15
	set	0x09, %g6
	lduba	[%l7 + %g6] 0x10,	%g1
loop_2059:
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%f28
	edge16	%g4,	%g3,	%i5
	brz,a	%o3,	loop_2060
	movcc	%xcc,	%i2,	%o4
	fmovde	%icc,	%f0,	%f13
	taddcc	%o2,	%i4,	%l6
loop_2060:
	tne	%icc,	0x0
	edge32n	%g5,	%l5,	%o1
	tg	%icc,	0x7
	brz,a	%l1,	loop_2061
	nop
	setx	loop_2062,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulscc	%i0,	0x0B0E,	%o0
	mova	%xcc,	%l4,	%o7
loop_2061:
	flush	%l7 + 0x74
loop_2062:
	orn	%g2,	%i7,	%g6
	array8	%i1,	%l2,	%o6
	edge8n	%g7,	%i6,	%l0
	taddcc	%i3,	%o5,	%l3
	movcs	%xcc,	%g4,	%g3
	orn	%g1,	%i5,	%o3
	tneg	%icc,	0x5
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf0,	%f16
	ld	[%l7 + 0x78],	%f2
	fbe,a	%fcc2,	loop_2063
	flush	%l7 + 0x30
	fmovdne	%xcc,	%f17,	%f15
	movre	%i2,	0x29B,	%o4
loop_2063:
	nop
	set	0x60, %i7
	lda	[%l7 + %i7] 0x88,	%f7
	sdivx	%o2,	0x1D19,	%i4
	fmovrdne	%g5,	%f0,	%f28
	movl	%xcc,	%l6,	%o1
	fpadd16s	%f8,	%f31,	%f6
	nop
	setx	loop_2064,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddrl	%l1,	%i0,	%l5
	ta	%xcc,	0x6
	tle	%xcc,	0x3
loop_2064:
	edge8l	%o0,	%o7,	%g2
	edge8	%l4,	%i7,	%g6
	fmovdcc	%xcc,	%f26,	%f5
	sra	%i1,	%l2,	%o6
	wr	%g0,	0x89,	%asi
	stba	%g7,	[%l7 + 0x6D] %asi
	membar	0x1A
	nop
	setx	0xE6117135E948FD62,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f16
	tvc	%icc,	0x6
	tl	%xcc,	0x1
	edge16ln	%l0,	%i3,	%i6
	tvc	%icc,	0x6
	fba,a	%fcc1,	loop_2065
	fmovdcc	%icc,	%f20,	%f0
	orncc	%o5,	0x07C9,	%l3
	fpadd16s	%f14,	%f19,	%f28
loop_2065:
	movre	%g4,	%g3,	%i5
	edge16ln	%g1,	%i2,	%o4
	array32	%o2,	%i4,	%o3
	tneg	%icc,	0x0
	set	0x6C, %g4
	swapa	[%l7 + %g4] 0x80,	%l6
	bn,pn	%icc,	loop_2066
	brgez,a	%o1,	loop_2067
	edge16ln	%l1,	%i0,	%l5
	edge16	%g5,	%o0,	%o7
loop_2066:
	nop
	fitos	%f2,	%f8
	fstox	%f8,	%f6
loop_2067:
	nop
	set	0x70, %i4
	ldda	[%l7 + %i4] 0x2e,	%g2
	set	0x2E, %i1
	stha	%i7,	[%l7 + %i1] 0x0c
	call	loop_2068
	xnorcc	%g6,	%l4,	%l2
	fnot2	%f0,	%f26
	xor	%o6,	0x1718,	%i1
loop_2068:
	xorcc	%l0,	0x0CBC,	%g7
	nop
	setx	0xC9F07BBD5248D6CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x99AB4293B8517914,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f2,	%f4
	brlz,a	%i3,	loop_2069
	edge8	%i6,	%o5,	%l3
	sdivx	%g4,	0x132B,	%g3
	fmovde	%xcc,	%f16,	%f2
loop_2069:
	sllx	%g1,	%i5,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba	%fcc0,	loop_2070
	array32	%o2,	%o4,	%i4
	udiv	%o3,	0x0F55,	%l6
	andn	%l1,	0x19BA,	%i0
loop_2070:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc1,	loop_2071
	mulx	%o1,	%g5,	%o0
	tcs	%xcc,	0x7
	edge32	%o7,	%g2,	%i7
loop_2071:
	nop
	set	0x66, %o7
	stha	%l5,	[%l7 + %o7] 0x27
	membar	#Sync
	smul	%g6,	0x168A,	%l2
	fnor	%f18,	%f18,	%f28
	fbe,a	%fcc2,	loop_2072
	stx	%o6,	[%l7 + 0x18]
	set	0x4F, %o2
	ldstuba	[%l7 + %o2] 0x89,	%l4
loop_2072:
	tl	%icc,	0x4
	tpos	%icc,	0x5
	fbug,a	%fcc0,	loop_2073
	sir	0x1CDA
	brlz	%l0,	loop_2074
	srlx	%i1,	%i3,	%g7
loop_2073:
	tsubcctv	%i6,	%l3,	%o5
	tcs	%xcc,	0x5
loop_2074:
	movpos	%icc,	%g4,	%g1
	taddcctv	%i5,	0x1C53,	%g3
	tgu	%icc,	0x3
	nop
	fitod	%f8,	%f0
	fdtox	%f0,	%f10
	fmovspos	%icc,	%f14,	%f6
	movrne	%i2,	0x334,	%o4
	fmovsneg	%icc,	%f8,	%f11
	sdiv	%o2,	0x12E9,	%o3
	edge32ln	%l6,	%i4,	%i0
	bleu,a,pt	%xcc,	loop_2075
	fbg	%fcc2,	loop_2076
	nop
	setx	0x62CF9D3581447094,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x288FCA63967CB3F1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f28,	%f22
	fba	%fcc0,	loop_2077
loop_2075:
	bge	loop_2078
loop_2076:
	edge32	%l1,	%o1,	%g5
	subccc	%o7,	%o0,	%i7
loop_2077:
	sll	%l5,	%g2,	%g6
loop_2078:
	umul	%o6,	%l2,	%l4
	fsrc2	%f8,	%f14
	sth	%l0,	[%l7 + 0x6A]
	fcmple16	%f20,	%f26,	%i3
	array8	%g7,	%i6,	%i1
	be,a	loop_2079
	fbo	%fcc2,	loop_2080
	fbuge,a	%fcc3,	loop_2081
	stb	%o5,	[%l7 + 0x61]
loop_2079:
	nop
	wr	%g0,	0x11,	%asi
	sta	%f31,	[%l7 + 0x5C] %asi
loop_2080:
	tneg	%icc,	0x3
loop_2081:
	fba	%fcc1,	loop_2082
	movg	%icc,	%g4,	%g1
	alignaddr	%i5,	%l3,	%i2
	movvc	%icc,	%o4,	%o2
loop_2082:
	array8	%o3,	%g3,	%l6
	udivx	%i4,	0x0D4E,	%l1
	taddcc	%i0,	%g5,	%o7
	ldsh	[%l7 + 0x74],	%o1
	array16	%i7,	%l5,	%o0
	sll	%g6,	0x1B,	%o6
	movcc	%icc,	%g2,	%l4
	xnorcc	%l0,	0x0659,	%i3
	movrlez	%l2,	%i6,	%i1
	movpos	%icc,	%o5,	%g7
	srax	%g4,	%g1,	%i5
	movneg	%icc,	%i2,	%o4
	movge	%xcc,	%o2,	%l3
	xnor	%g3,	%l6,	%i4
	udivcc	%l1,	0x133B,	%i0
	array16	%o3,	%g5,	%o1
	fbne,a	%fcc1,	loop_2083
	ldd	[%l7 + 0x70],	%o6
	edge16	%l5,	%i7,	%g6
	brlz,a	%o6,	loop_2084
loop_2083:
	sethi	0x0F0B,	%g2
	fandnot2	%f28,	%f28,	%f6
	tvs	%xcc,	0x3
loop_2084:
	fnegs	%f26,	%f9
	bvs,a	%icc,	loop_2085
	srax	%o0,	0x08,	%l4
	move	%icc,	%i3,	%l2
	sll	%l0,	%i6,	%i1
loop_2085:
	fpsub32s	%f4,	%f28,	%f30
	set	0x10, %l0
	ldxa	[%l7 + %l0] 0x81,	%g7
	fbg,a	%fcc2,	loop_2086
	fmovrslz	%g4,	%f22,	%f23
	edge8	%o5,	%i5,	%g1
	edge16l	%i2,	%o4,	%l3
loop_2086:
	fmovsvs	%xcc,	%f25,	%f31
	st	%f13,	[%l7 + 0x4C]
	sra	%o2,	0x0F,	%l6
	movvc	%xcc,	%g3,	%l1
	fpsub16	%f12,	%f2,	%f2
	ta	%xcc,	0x7
	array8	%i0,	%o3,	%i4
	bge,a,pn	%xcc,	loop_2087
	fnot2s	%f18,	%f14
	fcmpeq16	%f16,	%f8,	%o1
	movneg	%xcc,	%g5,	%o7
loop_2087:
	edge8n	%i7,	%g6,	%l5
	tge	%icc,	0x1
	move	%xcc,	%o6,	%o0
	srax	%l4,	%g2,	%i3
	mova	%xcc,	%l2,	%l0
	tvs	%icc,	0x2
	mova	%xcc,	%i1,	%g7
	std	%f18,	[%l7 + 0x48]
	fzero	%f4
	xor	%i6,	0x16E6,	%o5
	srl	%g4,	0x02,	%i5
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x58] %asi,	%g1
	ldstub	[%l7 + 0x6F],	%i2
	bshuffle	%f0,	%f6,	%f4
	fpsub16	%f4,	%f30,	%f10
	flush	%l7 + 0x60
	call	loop_2088
	sllx	%l3,	%o4,	%o2
	alignaddr	%l6,	%g3,	%i0
	ble	%icc,	loop_2089
loop_2088:
	fcmpgt16	%f24,	%f26,	%o3
	bcc,a	loop_2090
	fpadd32s	%f25,	%f19,	%f1
loop_2089:
	fmovrsgez	%l1,	%f19,	%f24
	ldub	[%l7 + 0x17],	%i4
loop_2090:
	brgez	%o1,	loop_2091
	taddcc	%g5,	%i7,	%g6
	tge	%icc,	0x3
	edge8n	%l5,	%o7,	%o6
loop_2091:
	subccc	%o0,	0x1F0E,	%l4
	fandnot1	%f26,	%f20,	%f28
	movg	%icc,	%i3,	%l2
	sra	%g2,	0x17,	%i1
	srl	%l0,	0x11,	%i6
	fbg	%fcc3,	loop_2092
	nop
	setx	loop_2093,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%o5,	%g4,	%i5
	and	%g1,	0x0D67,	%i2
loop_2092:
	pdist	%f18,	%f18,	%f16
loop_2093:
	sir	0x1E7F
	sth	%l3,	[%l7 + 0x58]
	nop
	fitod	%f5,	%f4
	orcc	%o4,	0x0506,	%g7
	alignaddrl	%o2,	%g3,	%l6
	nop
	set	0x74, %o6
	ldsw	[%l7 + %o6],	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,pt	%xcc,	loop_2094
	fpack16	%f0,	%f1
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x16
	membar	#Sync
loop_2094:
	membar	0x05
	nop
	setx loop_2095, %l0, %l1
	jmpl %l1, %l1
	fxors	%f8,	%f21,	%f25
	subcc	%o3,	%i4,	%g5
	movgu	%xcc,	%i7,	%g6
loop_2095:
	nop
	fitod	%f1,	%f22
	udiv	%o1,	0x1DE1,	%o7
	andcc	%l5,	%o0,	%l4
	fmovdneg	%xcc,	%f22,	%f19
	fmovde	%icc,	%f10,	%f19
	fmovrdlz	%o6,	%f0,	%f26
	brz,a	%i3,	loop_2096
	edge8n	%l2,	%g2,	%l0
	smul	%i1,	0x0FD8,	%i6
	edge8	%g4,	%i5,	%o5
loop_2096:
	fornot1s	%f0,	%f24,	%f27
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x45] %asi,	%g1
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x64] %asi,	%l3
	tvc	%xcc,	0x7
	tpos	%xcc,	0x6
	swap	[%l7 + 0x40],	%i2
	sub	%o4,	0x0032,	%o2
	udivx	%g7,	0x17CD,	%l6
	movre	%i0,	%g3,	%l1
	edge8ln	%i4,	%g5,	%o3
	mova	%icc,	%g6,	%o1
	bcc	loop_2097
	umul	%i7,	0x0AE1,	%l5
	bvs,a	loop_2098
	orncc	%o7,	0x1F9C,	%l4
loop_2097:
	ldub	[%l7 + 0x73],	%o6
	addccc	%i3,	0x1C66,	%l2
loop_2098:
	xorcc	%g2,	%o0,	%l0
	movge	%icc,	%i1,	%i6
	smulcc	%g4,	%o5,	%i5
	bge,pt	%xcc,	loop_2099
	bshuffle	%f26,	%f24,	%f18
	ba,pn	%icc,	loop_2100
	addccc	%g1,	%i2,	%o4
loop_2099:
	nop
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x14] %asi,	%f16
loop_2100:
	fmovdvs	%xcc,	%f18,	%f16
	movpos	%icc,	%l3,	%o2
	set	0x37, %g3
	ldstuba	[%l7 + %g3] 0x80,	%l6
	movg	%icc,	%i0,	%g7
	fnot2s	%f0,	%f5
	addccc	%l1,	%g3,	%i4
	std	%f6,	[%l7 + 0x20]
	popc	%g5,	%g6
	nop
	setx	0xA4457FF3207B6E63,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	edge16l	%o1,	%i7,	%o3
	ldx	[%l7 + 0x38],	%o7
	sir	0x08BA
	movcs	%xcc,	%l5,	%l4
	tcc	%icc,	0x0
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%o6
	mulx	%l2,	%o0,	%l0
	bne	%xcc,	loop_2101
	movge	%xcc,	%g2,	%i6
	tneg	%xcc,	0x0
	sir	0x1027
loop_2101:
	xor	%i1,	0x1C27,	%g4
	fands	%f14,	%f0,	%f5
	movcc	%xcc,	%o5,	%i5
	mulscc	%g1,	%i2,	%o4
	movn	%icc,	%o2,	%l6
	fpmerge	%f26,	%f19,	%f26
	fbge,a	%fcc1,	loop_2102
	mulx	%l3,	0x1E86,	%i0
	fsrc1	%f4,	%f6
	edge8n	%l1,	%g7,	%i4
loop_2102:
	stb	%g3,	[%l7 + 0x3C]
	tl	%icc,	0x7
	tpos	%xcc,	0x5
	set	0x20, %l4
	prefetcha	[%l7 + %l4] 0x15,	 0x3
	array16	%g6,	%i7,	%o1
	smul	%o3,	%l5,	%o7
	fmovdvc	%icc,	%f22,	%f0
	fba,a	%fcc0,	loop_2103
	taddcctv	%i3,	%o6,	%l2
	array16	%o0,	%l0,	%g2
	sir	0x0A8B
loop_2103:
	tgu	%xcc,	0x5
	brz	%i6,	loop_2104
	movrne	%i1,	0x1F6,	%g4
	fbg,a	%fcc3,	loop_2105
	movg	%xcc,	%o5,	%i5
loop_2104:
	prefetch	[%l7 + 0x20],	 0x1
	edge8ln	%g1,	%i2,	%o4
loop_2105:
	mova	%icc,	%o2,	%l6
	xor	%l3,	%i0,	%l1
	orncc	%l4,	%g7,	%g3
	nop
	setx	0xE05B5327,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	ldx	[%l7 + 0x38],	%g5
	wr	%g0,	0x89,	%asi
	stha	%g6,	[%l7 + 0x2C] %asi
	movneg	%xcc,	%i4,	%i7
	fba,a	%fcc0,	loop_2106
	fmovrdne	%o1,	%f2,	%f8
	array32	%l5,	%o3,	%i3
	fmovrsgz	%o6,	%f11,	%f10
loop_2106:
	fblg,a	%fcc2,	loop_2107
	fmovrslz	%o7,	%f29,	%f9
	wr	%g0,	0x04,	%asi
	stha	%o0,	[%l7 + 0x2A] %asi
loop_2107:
	orcc	%l0,	0x03E2,	%g2
	fbug,a	%fcc1,	loop_2108
	fbo	%fcc3,	loop_2109
	edge8ln	%i6,	%i1,	%g4
	tcc	%icc,	0x7
loop_2108:
	bne,a	loop_2110
loop_2109:
	orncc	%l2,	%i5,	%o5
	stb	%g1,	[%l7 + 0x5D]
	tleu	%icc,	0x0
loop_2110:
	and	%o4,	%o2,	%i2
	sub	%l6,	%l3,	%l1
	movrgz	%l4,	%g7,	%i0
	udivcc	%g3,	0x0830,	%g6
	tg	%icc,	0x2
	set	0x10, %l5
	lduwa	[%l7 + %l5] 0x0c,	%i4
	fmovdn	%xcc,	%f9,	%f25
	fandnot1	%f12,	%f6,	%f26
	nop
	set	0x60, %g1
	lduh	[%l7 + %g1],	%g5
	array8	%i7,	%l5,	%o1
	ta	%xcc,	0x4
	fmovsg	%icc,	%f28,	%f3
	fblg	%fcc0,	loop_2111
	fmovda	%icc,	%f25,	%f27
	fba,a	%fcc2,	loop_2112
	fbne	%fcc0,	loop_2113
loop_2111:
	brgez,a	%i3,	loop_2114
	taddcctv	%o3,	0x0395,	%o6
loop_2112:
	sllx	%o7,	%o0,	%l0
loop_2113:
	bl,a	loop_2115
loop_2114:
	tvs	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i6,	0x109B,	%g2
loop_2115:
	alignaddr	%i1,	%g4,	%l2
	array8	%o5,	%i5,	%o4
	tge	%xcc,	0x1
	std	%f4,	[%l7 + 0x38]
	alignaddr	%o2,	%i2,	%g1
	smul	%l3,	%l6,	%l4
	brlz,a	%l1,	loop_2116
	sir	0x0437
	tleu	%icc,	0x4
	fmovdcs	%icc,	%f1,	%f20
loop_2116:
	nop
	setx	0x83986F5B50417A38,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	edge32ln	%i0,	%g7,	%g3
	orcc	%i4,	%g5,	%g6
	edge32ln	%i7,	%l5,	%o1
	ldd	[%l7 + 0x60],	%f14
	fbuge,a	%fcc0,	loop_2117
	fmovs	%f23,	%f21
	set	0x60, %i6
	ldxa	[%l7 + %i6] 0x18,	%o3
loop_2117:
	fbo	%fcc3,	loop_2118
	sra	%i3,	0x01,	%o6
	tcs	%icc,	0x2
	bshuffle	%f14,	%f2,	%f26
loop_2118:
	edge16	%o7,	%o0,	%i6
	xnorcc	%g2,	0x1402,	%i1
	tg	%icc,	0x2
	fmovde	%icc,	%f18,	%f23
	tcs	%xcc,	0x2
	pdist	%f16,	%f26,	%f30
	array16	%g4,	%l0,	%l2
	nop
	setx	loop_2119,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movg	%icc,	%i5,	%o5
	wr	%g0,	0x89,	%asi
	sta	%f29,	[%l7 + 0x7C] %asi
loop_2119:
	fmovrdgez	%o2,	%f6,	%f8
	xnor	%o4,	%g1,	%i2
	orncc	%l6,	%l3,	%l4
	movrgez	%l1,	%g7,	%i0
	andn	%g3,	0x176E,	%g5
	fcmpgt16	%f20,	%f22,	%i4
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i7
	nop
	setx	0xF13E44EA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x3E4D397E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f15,	%f0
	wr	%g0,	0x04,	%asi
	sta	%f8,	[%l7 + 0x10] %asi
	tvc	%icc,	0x1
	fbne	%fcc3,	loop_2120
	fmovsge	%icc,	%f24,	%f13
	prefetch	[%l7 + 0x40],	 0x0
	mulscc	%l5,	0x17F4,	%g6
loop_2120:
	stbar
	add	%o1,	0x0A6A,	%i3
	tg	%xcc,	0x0
	tle	%icc,	0x1
	brnz	%o6,	loop_2121
	ble,pn	%icc,	loop_2122
	andncc	%o7,	%o0,	%i6
	nop
	setx	0x6906A7BFF048A379,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_2121:
	mulscc	%o3,	%i1,	%g2
loop_2122:
	addccc	%g4,	0x04EB,	%l0
	call	loop_2123
	movneg	%xcc,	%i5,	%l2
	fble	%fcc0,	loop_2124
	movcc	%xcc,	%o5,	%o4
loop_2123:
	udivcc	%g1,	0x0969,	%o2
	bcc	loop_2125
loop_2124:
	movpos	%xcc,	%i2,	%l6
	fnot1s	%f1,	%f25
	ta	%xcc,	0x6
loop_2125:
	or	%l4,	%l3,	%g7
	bpos,a	loop_2126
	fpadd32	%f10,	%f10,	%f10
	subccc	%i0,	%g3,	%g5
	edge16ln	%l1,	%i7,	%l5
loop_2126:
	pdist	%f14,	%f30,	%f0
	edge32ln	%g6,	%o1,	%i3
	wr	%g0,	0x0c,	%asi
	stba	%i4,	[%l7 + 0x1B] %asi
	bcc	loop_2127
	movne	%xcc,	%o6,	%o0
	nop
	setx	0x7E9AC2E2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x6CCB8B59,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f19,	%f2
	movrgez	%i6,	0x3DD,	%o7
loop_2127:
	tcs	%icc,	0x6
	fpack16	%f10,	%f5
	orcc	%i1,	%o3,	%g4
	movgu	%xcc,	%l0,	%g2
	udiv	%l2,	0x05BA,	%i5
	fba,a	%fcc1,	loop_2128
	bleu,pt	%icc,	loop_2129
	movrgez	%o4,	%o5,	%o2
	move	%xcc,	%g1,	%i2
loop_2128:
	tvs	%xcc,	0x7
loop_2129:
	move	%icc,	%l6,	%l3
	movrlez	%l4,	0x14F,	%g7
	fandnot2	%f24,	%f10,	%f30
	fbne,a	%fcc1,	loop_2130
	movcc	%icc,	%i0,	%g5
	fcmpeq32	%f6,	%f2,	%l1
	array16	%i7,	%g3,	%g6
loop_2130:
	fmovdneg	%icc,	%f5,	%f3
	sub	%l5,	0x13C8,	%i3
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	sllx	%i4,	%o6,	%o0
	tcs	%icc,	0x0
	andn	%o1,	0x1302,	%i6
	fmovrslz	%i1,	%f6,	%f15
	tl	%icc,	0x0
	tl	%xcc,	0x2
	pdist	%f22,	%f16,	%f0
	sdivcc	%o3,	0x06B0,	%g4
	fzero	%f2
	fnors	%f21,	%f23,	%f6
	fbg,a	%fcc0,	loop_2131
	nop
	fitod	%f6,	%f18
	fdtoi	%f18,	%f5
	nop
	setx	0xB892D28CC06E800E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	set	0x70, %l3
	swapa	[%l7 + %l3] 0x18,	%o7
loop_2131:
	movg	%icc,	%l0,	%g2
	sdivcc	%l2,	0x105B,	%o4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i5,	%o5
	movcs	%icc,	%o2,	%g1
	sub	%l6,	0x0015,	%i2
	tge	%icc,	0x3
	edge8n	%l4,	%l3,	%i0
	andncc	%g5,	%l1,	%i7
	fbg	%fcc1,	loop_2132
	movgu	%xcc,	%g7,	%g6
	brnz,a	%l5,	loop_2133
	udivx	%i3,	0x0C8B,	%i4
loop_2132:
	fnand	%f28,	%f30,	%f20
	tgu	%icc,	0x4
loop_2133:
	smul	%g3,	%o6,	%o1
	sdiv	%o0,	0x0A98,	%i1
	edge16	%o3,	%g4,	%o7
	fcmpeq16	%f22,	%f12,	%i6
	tle	%xcc,	0x4
	fmovrdlez	%l0,	%f12,	%f2
	lduh	[%l7 + 0x2C],	%g2
	nop
	set	0x68, %g5
	ldx	[%l7 + %g5],	%l2
	tge	%icc,	0x6
	movrgez	%o4,	%o5,	%o2
	ldstub	[%l7 + 0x17],	%g1
	fmovsvc	%xcc,	%f21,	%f29
	edge8l	%i5,	%l6,	%i2
	edge8l	%l3,	%i0,	%l4
	movrgz	%l1,	0x10B,	%i7
	fmovscc	%xcc,	%f6,	%f7
	wr	%g0,	0x11,	%asi
	stxa	%g5,	[%l7 + 0x28] %asi
	lduw	[%l7 + 0x70],	%g7
	taddcctv	%g6,	0x021A,	%i3
	subcc	%l5,	0x1468,	%g3
	tleu	%xcc,	0x2
	alignaddrl	%o6,	%i4,	%o1
	fbl	%fcc0,	loop_2134
	alignaddr	%i1,	%o3,	%g4
	alignaddrl	%o0,	%o7,	%i6
	andn	%l0,	%l2,	%o4
loop_2134:
	fmovsl	%icc,	%f0,	%f14
	fmovsvc	%icc,	%f3,	%f21
	subc	%o5,	0x0988,	%o2
	addcc	%g1,	%i5,	%l6
	orncc	%g2,	0x0616,	%l3
	nop
	setx	0x126C2D5A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x19BE5E41,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f14,	%f22
	movrgz	%i0,	0x291,	%i2
	tn	%xcc,	0x4
	tcc	%icc,	0x1
	movgu	%xcc,	%l1,	%i7
	ldub	[%l7 + 0x25],	%g5
	ldsw	[%l7 + 0x68],	%g7
	movg	%xcc,	%l4,	%g6
	nop
	fitos	%f11,	%f17
	fstox	%f17,	%f18
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x36] %asi,	%l5
	subc	%g3,	0x1B29,	%i3
	fbe	%fcc3,	loop_2135
	stw	%o6,	[%l7 + 0x58]
	brlez	%i4,	loop_2136
	srl	%o1,	0x16,	%o3
loop_2135:
	movne	%xcc,	%g4,	%o0
	fnot1	%f2,	%f8
loop_2136:
	movre	%o7,	0x39D,	%i1
	fcmpne16	%f0,	%f20,	%i6
	andn	%l2,	0x0273,	%l0
	prefetch	[%l7 + 0x08],	 0x1
	mova	%xcc,	%o4,	%o2
	fandnot2	%f26,	%f4,	%f30
	tle	%xcc,	0x1
	wr	%g0,	0xe3,	%asi
	stha	%o5,	[%l7 + 0x20] %asi
	membar	#Sync
	udivx	%i5,	0x10B0,	%l6
	edge16l	%g1,	%g2,	%i0
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x180] %asi,	%i2 ripped by fixASI40.pl ripped by fixASI40.pl
	fmovsleu	%xcc,	%f17,	%f2
	sra	%l1,	%l3,	%g5
	fble,a	%fcc2,	loop_2137
	movge	%icc,	%i7,	%l4
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x70] %asi,	%g6
loop_2137:
	fmovsn	%xcc,	%f17,	%f12
	fsrc2s	%f8,	%f0
	tleu	%icc,	0x4
	move	%icc,	%g7,	%g3
	sra	%l5,	%o6,	%i3
	fmovsleu	%xcc,	%f20,	%f3
	array8	%i4,	%o3,	%g4
	srax	%o0,	%o1,	%i1
	add	%i6,	0x0B00,	%l2
	fzeros	%f27
	set	0x78, %o3
	sta	%f19,	[%l7 + %o3] 0x10
	fnegs	%f11,	%f26
	mulx	%l0,	0x1C83,	%o4
	ldsb	[%l7 + 0x64],	%o7
	movrgz	%o5,	%o2,	%l6
	fbg	%fcc2,	loop_2138
	nop
	fitod	%f2,	%f0
	xor	%i5,	0x15D0,	%g1
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f22
	fxtod	%f22,	%f12
loop_2138:
	fpack32	%f20,	%f14,	%f30
	subcc	%g2,	%i0,	%i2
	tn	%xcc,	0x5
	andcc	%l3,	0x0CC1,	%l1
	tsubcc	%i7,	0x13FA,	%l4
	bne,a	%xcc,	loop_2139
	movneg	%icc,	%g5,	%g7
	fmovdleu	%icc,	%f23,	%f30
	stb	%g6,	[%l7 + 0x63]
loop_2139:
	tpos	%icc,	0x7
	bgu,pn	%icc,	loop_2140
	movvs	%icc,	%g3,	%o6
	nop
	setx	0x3049436B,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	sdivx	%i3,	0x088D,	%l5
loop_2140:
	sll	%i4,	%o3,	%g4
	alignaddrl	%o1,	%o0,	%i6
	subc	%i1,	%l0,	%o4
	edge8ln	%l2,	%o7,	%o5
	fsrc1s	%f8,	%f21
	movvs	%xcc,	%o2,	%i5
	ldsh	[%l7 + 0x62],	%g1
	bl,a	%icc,	loop_2141
	tvc	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x22] %asi,	%g2
loop_2141:
	edge32n	%i0,	%l6,	%i2
	xor	%l1,	0x1AE2,	%i7
	umulcc	%l4,	0x0D85,	%l3
	tsubcctv	%g5,	%g7,	%g3
	subc	%g6,	%o6,	%l5
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i4
	bcs,pn	%icc,	loop_2142
	subcc	%o3,	0x0798,	%g4
	movg	%icc,	%o1,	%o0
	nop
	setx	loop_2143,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2142:
	be,a,pn	%icc,	loop_2144
	nop
	fitos	%f5,	%f0
	fstoi	%f0,	%f13
	movgu	%xcc,	%i3,	%i6
loop_2143:
	nop
	setx	0x40954C4260531BDB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_2144:
	sllx	%l0,	0x04,	%i1
	subccc	%l2,	%o7,	%o4
	alignaddr	%o5,	%o2,	%g1
	move	%icc,	%g2,	%i5
	tle	%xcc,	0x1
	sra	%l6,	0x08,	%i2
	ta	%xcc,	0x6
	fxnor	%f4,	%f28,	%f12
	fmovdgu	%icc,	%f6,	%f20
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x6B] %asi,	%l1
	add	%i7,	%i0,	%l4
	movre	%l3,	%g5,	%g3
	movrne	%g6,	0x040,	%g7
	fbl,a	%fcc3,	loop_2145
	nop
	setx	0x9F8B64D722264F23,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f28
	andcc	%l5,	%i4,	%o3
	and	%o6,	0x0A09,	%o1
loop_2145:
	sdivcc	%o0,	0x0AB4,	%i3
	sdiv	%g4,	0x0519,	%i6
	fands	%f29,	%f8,	%f10
	fmovsl	%icc,	%f7,	%f26
	set	0x380, %o5
	nop 	! 	nop 	! 	ldxa	[%g0 + %o5] 0x40,	%l0 ripped by fixASI40.pl ripped by fixASI40.pl
	movg	%xcc,	%l2,	%i1
	fbne,a	%fcc0,	loop_2146
	bcc,pn	%xcc,	loop_2147
	tneg	%icc,	0x3
	alignaddr	%o7,	%o4,	%o5
loop_2146:
	be,pn	%xcc,	loop_2148
loop_2147:
	fbul	%fcc1,	loop_2149
	tsubcc	%o2,	%g2,	%i5
	fbule	%fcc1,	loop_2150
loop_2148:
	membar	0x7B
loop_2149:
	tcs	%icc,	0x6
	alignaddrl	%g1,	%l6,	%i2
loop_2150:
	nop
	set	0x5C, %o4
	ldsh	[%l7 + %o4],	%l1
	ldsw	[%l7 + 0x7C],	%i7
	tneg	%icc,	0x3
	edge16n	%l4,	%i0,	%g5
	flush	%l7 + 0x34
	edge32ln	%g3,	%g6,	%l3
	smul	%l5,	%i4,	%g7
	fmovsg	%xcc,	%f3,	%f10
	smulcc	%o6,	0x1D02,	%o3
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x1E] %asi,	%o1
	movcs	%icc,	%i3,	%o0
	fmovdle	%xcc,	%f18,	%f12
	movrgez	%g4,	0x304,	%i6
	movle	%xcc,	%l2,	%i1
	xor	%o7,	%l0,	%o4
	movge	%xcc,	%o5,	%g2
	fmovscs	%icc,	%f13,	%f18
	bpos,pt	%xcc,	loop_2151
	movg	%icc,	%o2,	%g1
	tcs	%xcc,	0x0
	movrlez	%i5,	0x032,	%l6
loop_2151:
	addcc	%l1,	%i2,	%l4
	sth	%i0,	[%l7 + 0x12]
	fbul	%fcc3,	loop_2152
	te	%icc,	0x2
	fmovsle	%icc,	%f28,	%f13
	set	0x20, %i0
	stwa	%g5,	[%l7 + %i0] 0x19
loop_2152:
	orcc	%i7,	0x1ABE,	%g6
	mova	%xcc,	%g3,	%l5
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x10,	%i4
	tsubcc	%l3,	%o6,	%o3
	bn,pt	%xcc,	loop_2153
	fandnot1	%f8,	%f26,	%f14
	ldd	[%l7 + 0x18],	%g6
	array32	%o1,	%i3,	%o0
loop_2153:
	fnegd	%f14,	%f24
	movle	%icc,	%i6,	%g4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x48] %asi,	%i1
	set	0x23, %i5
	ldsba	[%l7 + %i5] 0x15,	%l2
	andncc	%o7,	%l0,	%o5
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fblg,a	%fcc3,	loop_2154
	srlx	%g2,	%o4,	%g1
	tvc	%xcc,	0x4
	bleu,pt	%icc,	loop_2155
loop_2154:
	fxors	%f13,	%f22,	%f4
	tsubcc	%o2,	0x0924,	%i5
	movrgez	%l6,	0x3A9,	%l1
loop_2155:
	tneg	%icc,	0x4
	tsubcc	%i2,	%l4,	%g5
	fmul8sux16	%f26,	%f22,	%f26
	nop
	setx	loop_2156,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgez,a	%i7,	loop_2157
	smulcc	%i0,	0x1CAC,	%g3
	orcc	%l5,	%g6,	%l3
loop_2156:
	sra	%o6,	%i4,	%g7
loop_2157:
	edge16ln	%o1,	%o3,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc2,	loop_2158
	brlz,a	%i6,	loop_2159
	fbug,a	%fcc2,	loop_2160
	fpack32	%f14,	%f10,	%f16
loop_2158:
	stx	%g4,	[%l7 + 0x28]
loop_2159:
	bg,pn	%xcc,	loop_2161
loop_2160:
	xnorcc	%o0,	%i1,	%l2
	sub	%l0,	0x0112,	%o5
	ldx	[%l7 + 0x48],	%o7
loop_2161:
	flush	%l7 + 0x18
	stb	%g2,	[%l7 + 0x18]
	addccc	%o4,	%g1,	%i5
	xorcc	%o2,	%l6,	%l1
	array16	%i2,	%g5,	%l4
	xnor	%i7,	%g3,	%l5
	movg	%icc,	%g6,	%i0
	stb	%o6,	[%l7 + 0x61]
	orn	%i4,	0x0482,	%g7
	edge8l	%l3,	%o3,	%i3
	addccc	%i6,	%o1,	%o0
	sdivcc	%i1,	0x07CE,	%l2
	edge32	%g4,	%o5,	%l0
	bcs,a,pn	%icc,	loop_2162
	movvc	%xcc,	%g2,	%o4
	edge32	%o7,	%i5,	%o2
	nop
	setx	0xEBD3D13F3B93385A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f24
loop_2162:
	andn	%g1,	0x1B32,	%l6
	edge32ln	%i2,	%l1,	%g5
	fandnot1	%f16,	%f26,	%f8
	fmovdne	%icc,	%f24,	%f28
	wr	%g0,	0x89,	%asi
	sta	%f31,	[%l7 + 0x28] %asi
	tne	%xcc,	0x1
	fble,a	%fcc0,	loop_2163
	move	%icc,	%i7,	%l4
	fzero	%f10
	tcc	%icc,	0x4
loop_2163:
	edge8ln	%l5,	%g6,	%g3
	taddcctv	%o6,	%i4,	%i0
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%f0
	tg	%xcc,	0x2
	fnot1s	%f21,	%f11
	mulx	%l3,	%o3,	%g7
	addcc	%i3,	0x136D,	%i6
	tneg	%xcc,	0x1
	movrgez	%o0,	%i1,	%o1
	tsubcc	%g4,	%l2,	%l0
	fbge,a	%fcc0,	loop_2164
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o5,	%o4,	%g2
	udivcc	%o7,	0x07CD,	%o2
loop_2164:
	fmovdcs	%icc,	%f4,	%f24
	movrlez	%i5,	0x3B5,	%g1
	fmovdle	%xcc,	%f22,	%f6
	fxors	%f3,	%f18,	%f23
	tl	%icc,	0x0
	or	%i2,	0x0943,	%l6
	taddcc	%l1,	0x19CB,	%i7
	nop
	setx	0xB2EA0512,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f11
	ldd	[%l7 + 0x48],	%f2
	fpackfix	%f10,	%f27
	set	0x180, %i2
	nop 	! 	nop 	! 	ldxa	[%g0 + %i2] 0x40,	%g5 ripped by fixASI40.pl ripped by fixASI40.pl
	taddcctv	%l5,	%g6,	%g3
	orn	%l4,	%i4,	%i0
	smulcc	%o6,	0x1E70,	%l3
	fmovsa	%icc,	%f3,	%f11
	movleu	%xcc,	%o3,	%i3
	alignaddr	%i6,	%o0,	%i1
	tpos	%icc,	0x0
	fbne	%fcc2,	loop_2165
	ldsw	[%l7 + 0x50],	%g7
	ldd	[%l7 + 0x58],	%f10
	fbl	%fcc1,	loop_2166
loop_2165:
	nop
	setx	0xD0794C57,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	movpos	%icc,	%g4,	%l2
	fmovrsgz	%o1,	%f22,	%f18
loop_2166:
	tcc	%xcc,	0x0
	bne,a,pn	%xcc,	loop_2167
	tle	%xcc,	0x4
	fxnors	%f23,	%f7,	%f0
	fmovdleu	%xcc,	%f12,	%f23
loop_2167:
	nop
	set	0x8, %l6
	stxa	%o5,	[%g0 + %l6] 0x21
	fble	%fcc1,	loop_2168
	movcc	%icc,	%l0,	%g2
	fbge,a	%fcc3,	loop_2169
	ta	%icc,	0x4
loop_2168:
	bneg,pt	%xcc,	loop_2170
	fmovdpos	%xcc,	%f29,	%f23
loop_2169:
	tleu	%icc,	0x2
	edge16l	%o7,	%o2,	%o4
loop_2170:
	addc	%i5,	%i2,	%l6
	wr	%g0,	0xea,	%asi
	stwa	%l1,	[%l7 + 0x38] %asi
	membar	#Sync
	tg	%xcc,	0x6
	udiv	%i7,	0x1131,	%g5
	faligndata	%f14,	%f22,	%f0
	fbu	%fcc1,	loop_2171
	movcc	%icc,	%g1,	%g6
	stb	%l5,	[%l7 + 0x70]
	brlz,a	%g3,	loop_2172
loop_2171:
	bg	%icc,	loop_2173
	movrne	%i4,	%i0,	%l4
	edge8	%o6,	%l3,	%o3
loop_2172:
	fmovdleu	%xcc,	%f19,	%f21
loop_2173:
	and	%i6,	%i3,	%o0
	edge16	%i1,	%g7,	%g4
	alignaddr	%o1,	%l2,	%o5
	xnorcc	%l0,	%g2,	%o2
	array32	%o4,	%i5,	%i2
	array8	%o7,	%l1,	%l6
	ta	%icc,	0x7
	fmovsleu	%xcc,	%f6,	%f8
	te	%xcc,	0x5
	sllx	%i7,	0x1A,	%g1
	sra	%g6,	%g5,	%l5
	lduw	[%l7 + 0x24],	%i4
	mulscc	%g3,	0x05D4,	%i0
	taddcctv	%o6,	0x0332,	%l4
	ldd	[%l7 + 0x70],	%l2
	sub	%i6,	%i3,	%o0
	brgz	%i1,	loop_2174
	sdiv	%g7,	0x1F0A,	%g4
	flush	%l7 + 0x18
	fmovse	%xcc,	%f23,	%f9
loop_2174:
	umul	%o1,	%o3,	%l2
	fone	%f2
	array32	%o5,	%l0,	%o2
	orn	%g2,	0x1DA8,	%o4
	prefetch	[%l7 + 0x08],	 0x0
	ld	[%l7 + 0x5C],	%f10
	fbn	%fcc1,	loop_2175
	umulcc	%i5,	%i2,	%l1
	movvs	%icc,	%o7,	%i7
	udivx	%g1,	0x1BAF,	%g6
loop_2175:
	movleu	%xcc,	%g5,	%l6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x10] %asi,	%i4
	movn	%xcc,	%g3,	%i0
	movcs	%icc,	%o6,	%l4
	movl	%xcc,	%l5,	%l3
	movvc	%xcc,	%i6,	%o0
	sdivcc	%i3,	0x162C,	%g7
	umul	%i1,	0x1095,	%g4
	fmovrslez	%o1,	%f25,	%f6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x48] %asi,	%l2
	sra	%o5,	0x19,	%o3
	movrne	%l0,	%g2,	%o4
	mulscc	%i5,	%o2,	%l1
	orncc	%i2,	0x13F8,	%i7
	sir	0x03E6
	fmovde	%icc,	%f21,	%f1
	ldd	[%l7 + 0x20],	%f28
	bgu,a	%xcc,	loop_2176
	fmovdl	%xcc,	%f14,	%f10
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%g6
loop_2176:
	edge32ln	%g5,	%l6,	%i4
	fmovscc	%icc,	%f4,	%f1
	tgu	%xcc,	0x7
	nop
	setx	0xEFF25C96,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x529E0A98,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f18,	%f25
	movcc	%xcc,	%g3,	%g1
	popc	%i0,	%o6
	nop
	setx	0x2AE920A9CE44A8C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x796E55EA5742025C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f22,	%f22
	fand	%f0,	%f8,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f30,	%f4,	%f26
	edge32n	%l4,	%l3,	%l5
	wr	%g0,	0xea,	%asi
	stha	%o0,	[%l7 + 0x36] %asi
	membar	#Sync
	sdivx	%i3,	0x0483,	%g7
	tg	%icc,	0x5
	set	0x218, %g2
	stxa	%i6,	[%g0 + %g2] 0x52
	fand	%f24,	%f28,	%f4
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fbule	%fcc3,	loop_2177
	st	%f6,	[%l7 + 0x34]
	movre	%g4,	%i1,	%o1
	srl	%l2,	%o3,	%o5
loop_2177:
	taddcctv	%l0,	0x0330,	%o4
	fandnot2s	%f29,	%f11,	%f23
	tcs	%icc,	0x6
	fbug,a	%fcc0,	loop_2178
	srl	%i5,	%o2,	%l1
	sdiv	%g2,	0x1B0A,	%i2
	fmovsleu	%icc,	%f19,	%f6
loop_2178:
	movcc	%xcc,	%i7,	%g6
	lduw	[%l7 + 0x44],	%g5
	fmovrdgz	%l6,	%f26,	%f24
	edge16ln	%o7,	%g3,	%i4
	tpos	%icc,	0x0
	ble,a	%icc,	loop_2179
	edge32	%i0,	%g1,	%o6
	nop
	setx	0x9FDD1CD9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x7E534FF6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f11,	%f18
	addc	%l3,	%l5,	%l4
loop_2179:
	array32	%o0,	%g7,	%i6
	add	%g4,	%i1,	%i3
	orncc	%l2,	%o1,	%o3
	set	0x1C, %g6
	ldsba	[%l7 + %g6] 0x88,	%l0
	tvs	%icc,	0x7
	srl	%o4,	%o5,	%i5
	fbn,a	%fcc3,	loop_2180
	fnands	%f30,	%f1,	%f28
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l1,	%o2
loop_2180:
	srax	%g2,	%i2,	%i7
	sra	%g6,	%l6,	%g5
	fnor	%f28,	%f28,	%f22
	flush	%l7 + 0x4C
	fcmpne32	%f6,	%f6,	%o7
	movcs	%xcc,	%i4,	%i0
	ld	[%l7 + 0x44],	%f4
	ldsb	[%l7 + 0x2B],	%g3
	movrgz	%o6,	0x215,	%l3
	fba,a	%fcc1,	loop_2181
	alignaddrl	%l5,	%l4,	%g1
	fmovscs	%xcc,	%f17,	%f0
	movneg	%xcc,	%g7,	%i6
loop_2181:
	nop
	setx	0x0AC7F42A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x82EE6ED7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f10,	%f22
	movge	%xcc,	%o0,	%i1
	xor	%g4,	%l2,	%i3
	tneg	%xcc,	0x2
	movneg	%icc,	%o1,	%o3
	srl	%l0,	0x1F,	%o4
	movle	%icc,	%o5,	%i5
	ld	[%l7 + 0x7C],	%f7
	subcc	%o2,	%g2,	%l1
	and	%i7,	0x0F6F,	%i2
	andncc	%g6,	%l6,	%o7
	sra	%i4,	0x11,	%g5
	add	%l7,	0x24,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%g3,	%i0
	fsrc1	%f26,	%f14
	bne,a,pn	%xcc,	loop_2182
	fmovse	%xcc,	%f1,	%f1
	flush	%l7 + 0x74
	movpos	%xcc,	%o6,	%l5
loop_2182:
	tsubcctv	%l4,	%g1,	%l3
	fpadd32s	%f3,	%f5,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba	%xcc,	loop_2183
	ble,pt	%xcc,	loop_2184
	movleu	%xcc,	%g7,	%i6
	bcc,a,pt	%xcc,	loop_2185
loop_2183:
	mulx	%i1,	0x06DC,	%g4
loop_2184:
	tn	%xcc,	0x7
	movge	%xcc,	%o0,	%i3
loop_2185:
	edge32	%o1,	%l2,	%o3
	movcs	%icc,	%o4,	%o5
	movn	%icc,	%l0,	%o2
	fmovdcc	%xcc,	%f11,	%f20
	ta	%xcc,	0x0
	fmovde	%xcc,	%f19,	%f5
	fandnot1	%f16,	%f14,	%f24
	fblg	%fcc3,	loop_2186
	andcc	%i5,	0x1D93,	%l1
	movleu	%xcc,	%g2,	%i2
	nop
	setx	0x41B6B7C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xA0CBA7C9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f2,	%f6
loop_2186:
	ldsw	[%l7 + 0x08],	%g6
	brlez,a	%i7,	loop_2187
	edge32ln	%o7,	%l6,	%i4
	edge32	%g3,	%g5,	%o6
	smulcc	%i0,	%l5,	%g1
loop_2187:
	movl	%icc,	%l3,	%g7
	movg	%xcc,	%i6,	%l4
	bleu,a	loop_2188
	tl	%xcc,	0x6
	movgu	%icc,	%g4,	%o0
	tvc	%xcc,	0x4
loop_2188:
	nop
	setx	0x44A41906BD54B130,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x0611BA8C5C3DF2A5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f16,	%f10
	movrlz	%i1,	0x1FC,	%i3
	smul	%o1,	%o3,	%o4
	udivcc	%o5,	0x0349,	%l0
	movleu	%icc,	%l2,	%i5
	movvs	%icc,	%o2,	%l1
	fba	%fcc3,	loop_2189
	fsrc1s	%f10,	%f11
	andncc	%g2,	%i2,	%i7
	fmovs	%f17,	%f24
loop_2189:
	tvs	%xcc,	0x7
	fbue,a	%fcc2,	loop_2190
	fmovsgu	%xcc,	%f15,	%f11
	tpos	%icc,	0x4
	prefetch	[%l7 + 0x70],	 0x3
loop_2190:
	orn	%g6,	%l6,	%i4
	sdivx	%o7,	0x0CDF,	%g3
	tvs	%icc,	0x7
	movrlz	%o6,	0x3F5,	%g5
	sllx	%i0,	0x07,	%l5
	sll	%g1,	0x06,	%l3
	bne,a,pn	%icc,	loop_2191
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1BE3,	%i6
	set	0x12, %l2
	stba	%l4,	[%l7 + %l2] 0x15
loop_2191:
	movgu	%icc,	%g7,	%g4
	membar	0x67
	sra	%o0,	%i3,	%i1
	fbug	%fcc3,	loop_2192
	tneg	%icc,	0x7
	fbue,a	%fcc2,	loop_2193
	fpsub16s	%f25,	%f2,	%f29
loop_2192:
	movrlez	%o1,	0x283,	%o4
	stbar
loop_2193:
	movre	%o3,	%l0,	%l2
	fmovdge	%icc,	%f11,	%f1
	subc	%i5,	%o5,	%o2
	array8	%l1,	%g2,	%i7
	wr	%g0,	0x10,	%asi
	stba	%i2,	[%l7 + 0x55] %asi
	srax	%l6,	%g6,	%o7
	bpos,a	%xcc,	loop_2194
	tgu	%xcc,	0x7
	movrgz	%i4,	0x122,	%o6
	srl	%g3,	0x0D,	%g5
loop_2194:
	edge16	%i0,	%l5,	%l3
	taddcctv	%i6,	%l4,	%g1
	udivx	%g4,	0x0192,	%g7
	be,pn	%xcc,	loop_2195
	nop
	setx	0x6412F892,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x9DDE13D2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f27,	%f28
	lduw	[%l7 + 0x64],	%i3
	sethi	0x0D01,	%o0
loop_2195:
	bcc,a	%icc,	loop_2196
	nop
	setx	0x1BACE4C1FF0221C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x7A261D94870AF615,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f16,	%f22
	fpack16	%f14,	%f9
	fpadd32s	%f13,	%f0,	%f10
loop_2196:
	edge32l	%i1,	%o4,	%o1
	wr	%g0,	0x18,	%asi
	stwa	%l0,	[%l7 + 0x50] %asi
	movne	%xcc,	%o3,	%i5
	fnot2	%f8,	%f16
	movre	%o5,	0x214,	%o2
	movvs	%xcc,	%l1,	%l2
	std	%f24,	[%l7 + 0x50]
	fbue,a	%fcc2,	loop_2197
	fmovdgu	%xcc,	%f30,	%f15
	sub	%i7,	0x03FE,	%i2
	add	%l6,	0x09FA,	%g6
loop_2197:
	bge,a,pn	%icc,	loop_2198
	subcc	%g2,	%i4,	%o6
	edge8	%o7,	%g5,	%i0
	nop
	setx	0x1CC2DFC632B68C3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xEA4F4D9E36269BFC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f8,	%f8
loop_2198:
	array8	%g3,	%l5,	%l3
	umul	%l4,	%i6,	%g4
	xorcc	%g7,	0x1ADD,	%g1
	subcc	%o0,	%i1,	%o4
	set	0x34, %l1
	stha	%o1,	[%l7 + %l1] 0x0c
	movpos	%xcc,	%l0,	%o3
	smul	%i3,	%i5,	%o5
	orncc	%o2,	0x05FE,	%l1
	alignaddr	%i7,	%l2,	%i2
	edge16ln	%g6,	%g2,	%i4
	tg	%xcc,	0x0
	edge16ln	%o6,	%o7,	%g5
	sdiv	%l6,	0x15EC,	%i0
	movgu	%icc,	%l5,	%l3
	tne	%xcc,	0x7
	sllx	%l4,	%i6,	%g4
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x1D] %asi,	%g7
	movrlez	%g1,	0x115,	%g3
	nop
	setx	0xA7EB3935EAC94DB0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x44E445AD298578D6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f22,	%f26
	tle	%icc,	0x7
	tsubcctv	%o0,	%i1,	%o1
	fandnot1	%f10,	%f6,	%f8
	fxor	%f4,	%f4,	%f20
	fcmple32	%f16,	%f2,	%l0
	fornot1	%f10,	%f22,	%f28
	srlx	%o4,	%i3,	%o3
	fmovrdlz	%o5,	%f0,	%f10
	tpos	%icc,	0x6
	edge8	%i5,	%l1,	%i7
	fpadd32s	%f14,	%f4,	%f11
	fmovsle	%xcc,	%f28,	%f3
	tcs	%xcc,	0x1
	movcs	%icc,	%l2,	%o2
	bcc	%icc,	loop_2199
	mova	%xcc,	%g6,	%i2
	sub	%i4,	%g2,	%o6
	subccc	%g5,	0x1A7B,	%l6
loop_2199:
	fcmpne16	%f6,	%f8,	%i0
	udiv	%o7,	0x0F46,	%l3
	tl	%xcc,	0x3
	array32	%l5,	%i6,	%g4
	bn	%icc,	loop_2200
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g7,	0x1FBE,	%l4
	nop
	setx	0xB7771875,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f20
loop_2200:
	prefetch	[%l7 + 0x38],	 0x2
	movpos	%icc,	%g3,	%g1
	fbn,a	%fcc0,	loop_2201
	movvs	%xcc,	%o0,	%o1
	tcc	%xcc,	0x5
	set	0x18, %o0
	ldswa	[%l7 + %o0] 0x0c,	%i1
loop_2201:
	and	%o4,	0x0D15,	%i3
	tneg	%xcc,	0x7
	fpadd32s	%f14,	%f17,	%f30
	add	%l0,	0x0CB2,	%o3
	array16	%o5,	%i5,	%l1
	ldsb	[%l7 + 0x5A],	%l2
	movre	%i7,	%o2,	%i2
	movrgez	%g6,	0x127,	%g2
	orn	%o6,	%g5,	%i4
	bshuffle	%f18,	%f6,	%f26
	movle	%xcc,	%l6,	%i0
	fpack32	%f26,	%f6,	%f28
	set	0x18, %g4
	sta	%f23,	[%l7 + %g4] 0x0c
	udivx	%l3,	0x0FD8,	%o7
	add	%i6,	0x1ED7,	%g4
	fmuld8ulx16	%f1,	%f25,	%f26
	sub	%l5,	%g7,	%g3
	movge	%xcc,	%l4,	%g1
	add	%o0,	%o1,	%i1
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x7E] %asi,	%i3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%l0,	%o4
	andncc	%o5,	%i5,	%o3
	brnz	%l2,	loop_2202
	movrgez	%l1,	%o2,	%i2
	alignaddrl	%i7,	%g6,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2202:
	movre	%o6,	0x31A,	%g5
	fmovrdgz	%l6,	%f22,	%f30
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x70] %asi,	%i0
	bgu	%xcc,	loop_2203
	movre	%l3,	%i4,	%o7
	array16	%g4,	%i6,	%l5
	fmul8x16al	%f25,	%f2,	%f30
loop_2203:
	fcmpeq32	%f12,	%f14,	%g7
	nop
	setx	0xDF13481BD0468B36,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	bn	loop_2204
	orcc	%l4,	%g3,	%o0
	tge	%icc,	0x2
	add	%o1,	%g1,	%i1
loop_2204:
	te	%xcc,	0x7
	movvc	%icc,	%i3,	%o4
	srax	%l0,	%i5,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0B2D,	%l2
	fmovsleu	%xcc,	%f9,	%f12
	addccc	%o5,	%o2,	%i2
	fcmpgt16	%f16,	%f22,	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x18,	%g6,	%i7
	fnands	%f15,	%f5,	%f18
	fmul8x16	%f27,	%f0,	%f24
	edge16l	%g2,	%g5,	%o6
	array8	%i0,	%l6,	%i4
	mulx	%l3,	0x0793,	%o7
	bcs	%xcc,	loop_2205
	movvc	%icc,	%i6,	%l5
	fzeros	%f31
	tvc	%xcc,	0x3
loop_2205:
	and	%g4,	%g7,	%g3
	fpsub32s	%f21,	%f5,	%f23
	array32	%l4,	%o0,	%g1
	bl,a,pn	%icc,	loop_2206
	tvs	%icc,	0x1
	tleu	%xcc,	0x5
	ble,pt	%xcc,	loop_2207
loop_2206:
	edge32l	%i1,	%o1,	%o4
	bpos,a	%icc,	loop_2208
	sth	%i3,	[%l7 + 0x48]
loop_2207:
	nop
	setx	0x8B74BD46C492825F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x4F52EFE81863FF54,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f2,	%f6
	fnegd	%f16,	%f24
loop_2208:
	movne	%xcc,	%l0,	%o3
	fnot2	%f14,	%f0
	fpadd16s	%f1,	%f8,	%f29
	set	0x5C, %i7
	lduba	[%l7 + %i7] 0x80,	%i5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x18,	%o5,	%l2
	fbuge,a	%fcc3,	loop_2209
	tn	%xcc,	0x3
	fmovrdlez	%i2,	%f14,	%f30
	fbne,a	%fcc2,	loop_2210
loop_2209:
	nop
	setx	0x907C6E8F,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	wr	%g0,	0x11,	%asi
	sta	%f8,	[%l7 + 0x18] %asi
loop_2210:
	edge32n	%o2,	%l1,	%g6
	bshuffle	%f18,	%f10,	%f0
	tcc	%icc,	0x2
	movpos	%xcc,	%i7,	%g5
	addc	%g2,	0x111C,	%o6
	tne	%xcc,	0x3
	andcc	%l6,	%i4,	%l3
	tge	%icc,	0x4
	nop
	setx	0xE3277F3F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xC1B86AB8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f25,	%f10
	movpos	%xcc,	%i0,	%o7
	orn	%l5,	0x0B04,	%g4
	fpadd32	%f6,	%f18,	%f16
	smulcc	%i6,	0x064D,	%g3
	movgu	%xcc,	%l4,	%o0
	addccc	%g7,	0x0E18,	%g1
	nop
	setx	0x004F1617,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x3DBBF753,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f28,	%f24
	fbg	%fcc0,	loop_2211
	xnor	%i1,	%o4,	%o1
	nop
	setx	0x74713489,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f28
	tsubcc	%i3,	0x1AF0,	%o3
loop_2211:
	nop
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x78] %asi,	%f10
	movpos	%xcc,	%i5,	%l0
	orcc	%l2,	0x14C0,	%o5
	bge	loop_2212
	orncc	%i2,	%l1,	%o2
	fmul8ulx16	%f24,	%f16,	%f8
	array8	%i7,	%g6,	%g2
loop_2212:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x38] %asi,	%f10
	orncc	%g5,	0x12E3,	%l6
	movvc	%icc,	%i4,	%l3
	xorcc	%i0,	0x00EE,	%o6
	edge16l	%l5,	%o7,	%i6
	wr	%g0,	0x89,	%asi
	sta	%f7,	[%l7 + 0x78] %asi
	movcs	%xcc,	%g3,	%l4
	fpadd32s	%f18,	%f3,	%f5
	nop
	setx	0xD040B6C7,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	mulscc	%o0,	0x0AC1,	%g4
	movl	%xcc,	%g1,	%g7
	tgu	%xcc,	0x0
	ldub	[%l7 + 0x67],	%o4
	tvs	%icc,	0x4
	alignaddrl	%o1,	%i1,	%i3
	addcc	%i5,	%l0,	%o3
	umul	%l2,	0x03DB,	%i2
	mova	%icc,	%l1,	%o5
	mulscc	%i7,	%g6,	%o2
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	nop
	setx	0xB128EC5A2F44EAC0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xE8CECBD297EA7B02,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f22,	%f30
	movcc	%xcc,	%l6,	%i4
	fmovrslz	%l3,	%f19,	%f19
	movleu	%xcc,	%g2,	%i0
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x18] %asi,	%o6
	movleu	%icc,	%l5,	%o7
	addccc	%g3,	0x07EF,	%l4
	mulx	%i6,	0x12EB,	%o0
	srl	%g1,	%g4,	%g7
	taddcctv	%o4,	0x046D,	%o1
	fmovda	%icc,	%f3,	%f24
	tneg	%icc,	0x1
	udiv	%i1,	0x0DDD,	%i3
	bl,a	loop_2213
	sllx	%l0,	0x08,	%i5
	fandnot2	%f4,	%f2,	%f2
	fone	%f10
loop_2213:
	addccc	%o3,	0x1805,	%i2
	stw	%l1,	[%l7 + 0x58]
	smulcc	%l2,	%o5,	%i7
	te	%icc,	0x5
	fmovdvc	%xcc,	%f30,	%f14
	set	0x34, %i1
	ldsha	[%l7 + %i1] 0x19,	%o2
	fbuge	%fcc2,	loop_2214
	bvc,a	%xcc,	loop_2215
	andncc	%g6,	%g5,	%l6
	andn	%l3,	%g2,	%i4
loop_2214:
	ldstub	[%l7 + 0x36],	%i0
loop_2215:
	sra	%o6,	0x16,	%l5
	fandnot2s	%f24,	%f14,	%f19
	edge8l	%o7,	%g3,	%i6
	umul	%l4,	0x1D8C,	%o0
	fands	%f27,	%f4,	%f31
	edge16	%g4,	%g7,	%o4
	edge16ln	%g1,	%o1,	%i1
	stw	%l0,	[%l7 + 0x6C]
	subccc	%i5,	0x0E2E,	%i3
	edge8n	%o3,	%i2,	%l2
	te	%xcc,	0x7
	fabss	%f22,	%f30
	sub	%l1,	%o5,	%o2
	stw	%i7,	[%l7 + 0x30]
	movgu	%icc,	%g6,	%l6
	bg,a	%icc,	loop_2216
	movrlz	%l3,	0x1E6,	%g2
	fmovsle	%xcc,	%f15,	%f29
	movrgez	%i4,	%i0,	%o6
loop_2216:
	umulcc	%l5,	0x0632,	%o7
	tgu	%icc,	0x1
	edge16n	%g5,	%g3,	%l4
	movle	%icc,	%o0,	%g4
	call	loop_2217
	stx	%i6,	[%l7 + 0x28]
	sub	%g7,	0x17D5,	%o4
	fmovdne	%icc,	%f28,	%f14
loop_2217:
	movg	%icc,	%o1,	%i1
	ldstub	[%l7 + 0x12],	%l0
	movleu	%xcc,	%i5,	%g1
	edge32l	%o3,	%i3,	%i2
	andn	%l1,	0x1F3C,	%o5
	edge8n	%o2,	%i7,	%l2
	fnegd	%f22,	%f0
	movg	%xcc,	%g6,	%l3
	popc	0x0119,	%g2
	sra	%l6,	%i0,	%i4
	sir	0x0D98
	fnegs	%f23,	%f7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x54] %asi,	%l5
	fbo,a	%fcc2,	loop_2218
	fbo,a	%fcc3,	loop_2219
	tsubcctv	%o7,	%o6,	%g3
	taddcctv	%g5,	0x052D,	%o0
loop_2218:
	umulcc	%g4,	0x03D7,	%i6
loop_2219:
	tne	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g7,	%l4,	%o1
	alignaddrl	%o4,	%i1,	%i5
	udivcc	%l0,	0x1AC7,	%o3
	bvc	%xcc,	loop_2220
	edge8n	%i3,	%i2,	%l1
	nop
	setx	loop_2221,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bn,pt	%xcc,	loop_2222
loop_2220:
	movrgez	%g1,	%o5,	%o2
	edge16	%l2,	%i7,	%g6
loop_2221:
	fbne,a	%fcc0,	loop_2223
loop_2222:
	tg	%icc,	0x4
	bne,pt	%icc,	loop_2224
	fmovrsne	%l3,	%f16,	%f4
loop_2223:
	smulcc	%l6,	%g2,	%i4
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f12
	fxtod	%f12,	%f12
loop_2224:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x60] %asi,	%l4
	fcmpne16	%f30,	%f4,	%i0
	fbul,a	%fcc0,	loop_2225
	fbo	%fcc2,	loop_2226
	edge16l	%o6,	%o7,	%g5
	nop
	fitos	%f1,	%f20
loop_2225:
	fzero	%f2
loop_2226:
	fmovdneg	%xcc,	%f11,	%f21
	nop
	set	0x25, %i4
	ldsb	[%l7 + %i4],	%o0
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x5D] %asi,	%g4
	movcs	%icc,	%i6,	%g3
	sub	%g7,	%o1,	%o4
	andn	%i1,	0x0712,	%i5
	subccc	%l4,	0x03ED,	%l0
	tne	%icc,	0x5
	fmuld8sux16	%f24,	%f0,	%f30
	fcmpgt32	%f22,	%f2,	%o3
	fbuge	%fcc3,	loop_2227
	stbar
	movcc	%xcc,	%i3,	%i2
	te	%icc,	0x4
loop_2227:
	or	%g1,	0x09E0,	%l1
	movpos	%icc,	%o2,	%l2
	movvc	%xcc,	%o5,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg	loop_2228
	fmovrdne	%l3,	%f26,	%f22
	fmovrslz	%g6,	%f8,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2228:
	bvs	%icc,	loop_2229
	edge8n	%l6,	%g2,	%l5
	edge8n	%i0,	%o6,	%o7
	movre	%i4,	%o0,	%g5
loop_2229:
	prefetch	[%l7 + 0x3C],	 0x0
	fandnot2s	%f0,	%f0,	%f23
	wr	%g0,	0x89,	%asi
	stwa	%i6,	[%l7 + 0x30] %asi
	fba	%fcc1,	loop_2230
	edge32l	%g3,	%g4,	%o1
	fbge,a	%fcc1,	loop_2231
	tne	%icc,	0x3
loop_2230:
	alignaddrl	%g7,	%o4,	%i1
	edge16n	%i5,	%l0,	%l4
loop_2231:
	te	%icc,	0x0
	nop
	setx	0x23B9149420254701,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f2
	set	0x12, %o7
	stha	%i3,	[%l7 + %o7] 0x22
	membar	#Sync
	fmovsge	%xcc,	%f17,	%f22
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%o2
	fmovrdne	%g1,	%f22,	%f18
	tge	%icc,	0x3
	sra	%l1,	%i2,	%o2
	edge8ln	%o5,	%l2,	%l3
	array8	%g6,	%l6,	%g2
	andcc	%i7,	%i0,	%o6
	add	%o7,	%l5,	%i4
	nop
	set	0x08, %o6
	sth	%o0,	[%l7 + %o6]
	srlx	%i6,	%g3,	%g4
	movcc	%icc,	%o1,	%g5
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x14,	 0x1
	movleu	%icc,	%i1,	%i5
	edge16l	%l0,	%g7,	%l4
	alignaddrl	%i3,	%o3,	%l1
	movpos	%xcc,	%i2,	%o2
	fmovdcc	%icc,	%f21,	%f5
	popc	0x0590,	%g1
	fnor	%f10,	%f30,	%f22
	sethi	0x199A,	%l2
	array32	%o5,	%l3,	%g6
	tcs	%xcc,	0x7
	taddcc	%g2,	0x0A56,	%i7
	bleu,a,pt	%icc,	loop_2232
	andcc	%l6,	0x1BA0,	%o6
	movvs	%xcc,	%o7,	%i0
	std	%f0,	[%l7 + 0x08]
loop_2232:
	membar	0x40
	udiv	%i4,	0x0E6E,	%o0
	fblg,a	%fcc0,	loop_2233
	bpos,pn	%icc,	loop_2234
	tge	%xcc,	0x5
	addc	%l5,	0x0E92,	%g3
loop_2233:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2234:
	srax	%i6,	0x03,	%o1
	smulcc	%g5,	0x11DC,	%o4
	fmovrdlez	%i1,	%f28,	%f6
	movle	%icc,	%g4,	%l0
	smulcc	%i5,	%g7,	%i3
	tsubcc	%l4,	0x0DDB,	%o3
	nop
	setx	loop_2235,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrne	%l1,	%o2,	%g1
	nop
	setx	loop_2236,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fsrc2s	%f13,	%f28
loop_2235:
	srlx	%l2,	0x0F,	%o5
	xnor	%l3,	%i2,	%g2
loop_2236:
	fnegs	%f13,	%f17
	wr	%g0,	0x80,	%asi
	sta	%f14,	[%l7 + 0x14] %asi
	fmul8x16	%f2,	%f12,	%f20
	fexpand	%f3,	%f10
	movpos	%icc,	%i7,	%l6
	set	0x72, %g7
	stha	%o6,	[%l7 + %g7] 0x04
	smul	%g6,	%o7,	%i4
	movre	%i0,	0x264,	%o0
	fbu,a	%fcc3,	loop_2237
	brz,a	%l5,	loop_2238
	fmovsvc	%icc,	%f18,	%f8
	movle	%xcc,	%i6,	%g3
loop_2237:
	xnorcc	%o1,	%g5,	%i1
loop_2238:
	fcmple16	%f20,	%f14,	%o4
	nop
	set	0x10, %g3
	ldstub	[%l7 + %g3],	%g4
	set	0x6A, %l4
	ldstuba	[%l7 + %l4] 0x80,	%l0
	ldstub	[%l7 + 0x4F],	%g7
	fsrc2	%f8,	%f18
	movneg	%icc,	%i3,	%l4
	tne	%icc,	0x3
	tg	%icc,	0x6
	sth	%o3,	[%l7 + 0x2C]
	fmuld8sux16	%f10,	%f24,	%f6
	fnands	%f22,	%f9,	%f22
	movleu	%xcc,	%l1,	%i5
	fxor	%f2,	%f28,	%f20
	popc	0x0917,	%o2
	tcc	%icc,	0x5
	nop
	fitod	%f6,	%f16
	fdtoi	%f16,	%f18
	fmovdle	%xcc,	%f17,	%f5
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x79] %asi,	%l2
	andn	%o5,	%l3,	%g1
	fpadd32	%f0,	%f30,	%f30
	fornot2s	%f1,	%f15,	%f28
	movvc	%xcc,	%i2,	%g2
	fpackfix	%f30,	%f24
	edge8	%i7,	%o6,	%g6
	fmovsvc	%xcc,	%f8,	%f9
	nop
	set	0x28, %g1
	ldsw	[%l7 + %g1],	%l6
	movvc	%icc,	%i4,	%o7
	popc	%o0,	%i0
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%f4
	fmovsgu	%xcc,	%f15,	%f25
	faligndata	%f24,	%f8,	%f6
	set	0x1A, %l3
	lduba	[%l7 + %l3] 0x81,	%i6
	andncc	%l5,	%g3,	%g5
	set	0x37, %g5
	ldstuba	[%l7 + %g5] 0x18,	%i1
	xnorcc	%o1,	%o4,	%l0
	addccc	%g4,	0x0F67,	%i3
	srlx	%l4,	0x1E,	%g7
	for	%f18,	%f26,	%f24
	fmul8x16	%f16,	%f26,	%f26
	xnorcc	%l1,	%i5,	%o3
	andncc	%o2,	%o5,	%l3
	tcs	%xcc,	0x2
	movrne	%g1,	%l2,	%g2
	fmovdvc	%icc,	%f29,	%f9
	movl	%icc,	%i2,	%o6
	taddcc	%g6,	%i7,	%i4
	xnorcc	%o7,	0x1200,	%o0
	fandnot1	%f2,	%f22,	%f12
	srl	%i0,	0x1F,	%i6
	fbo	%fcc2,	loop_2239
	subccc	%l6,	0x1E85,	%g3
	fxors	%f12,	%f0,	%f27
	array32	%g5,	%i1,	%o1
loop_2239:
	udiv	%o4,	0x148C,	%l0
	brz,a	%g4,	loop_2240
	addccc	%l5,	%l4,	%g7
	edge8l	%l1,	%i5,	%o3
	tvs	%icc,	0x7
loop_2240:
	xnor	%o2,	%o5,	%i3
	alignaddrl	%g1,	%l3,	%g2
	udivx	%i2,	0x0FBA,	%o6
	orn	%l2,	%i7,	%i4
	tne	%xcc,	0x4
	edge32ln	%g6,	%o7,	%o0
	fbn,a	%fcc0,	loop_2241
	fmovsle	%icc,	%f1,	%f6
	edge32	%i0,	%l6,	%g3
	subccc	%i6,	%g5,	%i1
loop_2241:
	nop
	fitos	%f4,	%f13
	fstoi	%f13,	%f22
	mulscc	%o1,	%o4,	%l0
	orn	%l5,	0x1E5B,	%g4
	array16	%l4,	%g7,	%l1
	nop
	setx	0x70417BFE,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	sethi	0x1987,	%o3
	tsubcctv	%i5,	0x147E,	%o5
	addcc	%i3,	0x0654,	%g1
	smul	%l3,	0x1724,	%g2
	nop
	fitod	%f31,	%f0
	fmovdvc	%xcc,	%f4,	%f30
	array16	%o2,	%o6,	%l2
	ldub	[%l7 + 0x2F],	%i7
	fmovrslez	%i2,	%f28,	%f8
	tcs	%xcc,	0x4
	prefetch	[%l7 + 0x24],	 0x1
	movg	%xcc,	%g6,	%i4
	andn	%o0,	0x167F,	%i0
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x1f,	%f0
	fpadd16s	%f15,	%f4,	%f28
	fnors	%f13,	%f6,	%f1
	nop
	fitos	%f13,	%f28
	fstoi	%f28,	%f12
	edge32l	%l6,	%g3,	%o7
	sethi	0x0340,	%i6
	edge32n	%g5,	%i1,	%o4
	edge16n	%o1,	%l5,	%g4
	movvc	%xcc,	%l0,	%l4
	udivx	%g7,	0x1E4B,	%l1
	addccc	%i5,	%o3,	%i3
	tg	%icc,	0x5
	array8	%g1,	%l3,	%g2
	alignaddrl	%o2,	%o6,	%o5
	edge32	%l2,	%i7,	%i2
	fxnor	%f10,	%f4,	%f0
	andn	%i4,	%g6,	%o0
	udivcc	%i0,	0x0A4E,	%g3
	edge16n	%l6,	%i6,	%g5
	edge32n	%i1,	%o7,	%o4
	lduw	[%l7 + 0x60],	%o1
	set	0x0A, %o5
	ldsha	[%l7 + %o5] 0x11,	%l5
	udiv	%g4,	0x1E65,	%l0
	addccc	%g7,	%l1,	%l4
	nop
	setx	loop_2242,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%xcc,	0x6
	smulcc	%i5,	0x0EEF,	%o3
	fpsub32	%f14,	%f20,	%f10
loop_2242:
	membar	0x50
	fbug	%fcc0,	loop_2243
	movgu	%xcc,	%g1,	%l3
	nop
	setx	0xA222B3CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f2
	udivcc	%g2,	0x11EE,	%i3
loop_2243:
	fblg	%fcc1,	loop_2244
	smulcc	%o2,	%o6,	%o5
	edge16l	%i7,	%i2,	%l2
	brz,a	%g6,	loop_2245
loop_2244:
	fbuge,a	%fcc3,	loop_2246
	fmovsgu	%xcc,	%f20,	%f0
	fbge,a	%fcc0,	loop_2247
loop_2245:
	xnorcc	%o0,	%i4,	%i0
loop_2246:
	brz	%l6,	loop_2248
	sra	%g3,	0x05,	%g5
loop_2247:
	fblg	%fcc2,	loop_2249
	bne	%xcc,	loop_2250
loop_2248:
	bleu,a	%xcc,	loop_2251
	nop
	setx	0x0C6C0D08,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f14
loop_2249:
	tcs	%xcc,	0x4
loop_2250:
	array16	%i1,	%o7,	%i6
loop_2251:
	addc	%o1,	0x1D3A,	%l5
	fmovdpos	%xcc,	%f28,	%f31
	fmovdvc	%icc,	%f0,	%f13
	set	0x2C, %o4
	lduha	[%l7 + %o4] 0x18,	%g4
	edge16	%o4,	%l0,	%l1
	alignaddrl	%l4,	%g7,	%i5
	edge32n	%g1,	%l3,	%o3
	fbe	%fcc3,	loop_2252
	subccc	%g2,	0x07EE,	%i3
	subc	%o2,	%o6,	%i7
	movg	%xcc,	%o5,	%l2
loop_2252:
	edge16n	%g6,	%o0,	%i4
	alignaddr	%i0,	%i2,	%l6
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf9,	%f16
	nop
	setx	0xD495E465,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xFFD1C4E4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f23,	%f4
	smulcc	%g3,	0x0E01,	%i1
	movle	%xcc,	%g5,	%i6
	fmul8x16	%f0,	%f14,	%f26
	mulscc	%o1,	%o7,	%g4
	membar	0x2C
	fbo	%fcc3,	loop_2253
	orn	%o4,	%l5,	%l0
	fbe,a	%fcc1,	loop_2254
	brz	%l1,	loop_2255
loop_2253:
	edge32n	%l4,	%i5,	%g7
	fmul8x16al	%f6,	%f19,	%f20
loop_2254:
	edge16ln	%l3,	%g1,	%o3
loop_2255:
	taddcc	%g2,	0x1C3F,	%o2
	tsubcc	%o6,	%i7,	%i3
	movgu	%icc,	%o5,	%g6
	fpsub16s	%f19,	%f20,	%f3
	brlz	%o0,	loop_2256
	addcc	%i4,	0x1200,	%i0
	movne	%icc,	%l2,	%i2
	fpsub32	%f0,	%f6,	%f30
loop_2256:
	movn	%xcc,	%l6,	%i1
	andcc	%g3,	%g5,	%i6
	brgz	%o7,	loop_2257
	brgz	%o1,	loop_2258
	fmul8x16al	%f5,	%f2,	%f4
	ba,a,pn	%xcc,	loop_2259
loop_2257:
	subccc	%o4,	%g4,	%l0
loop_2258:
	fornot2s	%f27,	%f4,	%f23
	fpmerge	%f8,	%f25,	%f28
loop_2259:
	movrgz	%l1,	0x211,	%l5
	movg	%xcc,	%l4,	%g7
	ta	%xcc,	0x4
	sir	0x0C67
	sll	%l3,	0x1B,	%i5
	nop
	fitos	%f3,	%f20
	fstod	%f20,	%f6
	subc	%g1,	%o3,	%g2
	andncc	%o2,	%i7,	%o6
	fmovda	%xcc,	%f18,	%f5
	subc	%i3,	0x17E0,	%g6
	array8	%o5,	%o0,	%i0
	bne	loop_2260
	movrgz	%l2,	0x25D,	%i4
	movle	%xcc,	%i2,	%i1
	ldstub	[%l7 + 0x12],	%l6
loop_2260:
	tvs	%icc,	0x1
	call	loop_2261
	movle	%xcc,	%g3,	%g5
	fmovrsgez	%o7,	%f23,	%f26
	fornot2s	%f16,	%f23,	%f13
loop_2261:
	fblg	%fcc3,	loop_2262
	fpsub32	%f2,	%f14,	%f24
	tvc	%icc,	0x4
	bg,pt	%icc,	loop_2263
loop_2262:
	sdivcc	%o1,	0x15EB,	%i6
	tge	%icc,	0x5
	fbne,a	%fcc1,	loop_2264
loop_2263:
	fmovrde	%g4,	%f16,	%f12
	fbuge,a	%fcc3,	loop_2265
	tsubcc	%l0,	%o4,	%l5
loop_2264:
	tpos	%icc,	0x6
	udivcc	%l4,	0x18B6,	%l1
loop_2265:
	nop
	setx	0x3040E8BD,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	udiv	%g7,	0x139C,	%l3
	tgu	%xcc,	0x6
	set	0x18, %i0
	ldxa	[%g0 + %i0] 0x50,	%i5
	fpack16	%f20,	%f24
	smul	%o3,	%g1,	%o2
	fandnot2	%f8,	%f10,	%f28
	fpack32	%f26,	%f10,	%f10
	fble,a	%fcc2,	loop_2266
	ba,a,pt	%xcc,	loop_2267
	andncc	%i7,	%o6,	%g2
	movl	%xcc,	%i3,	%o5
loop_2266:
	te	%icc,	0x5
loop_2267:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	be	%xcc,	loop_2268
	fmovda	%icc,	%f1,	%f21
	movrlz	%g6,	0x1A3,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2268:
	call	loop_2269
	tleu	%icc,	0x4
	alignaddr	%o0,	%i4,	%i2
	movre	%i1,	0x367,	%l2
loop_2269:
	srax	%l6,	%g5,	%o7
	subc	%g3,	%i6,	%o1
	fbuge,a	%fcc1,	loop_2270
	movneg	%icc,	%l0,	%g4
	fblg	%fcc2,	loop_2271
	ldsh	[%l7 + 0x44],	%o4
loop_2270:
	ldsh	[%l7 + 0x18],	%l5
	fxors	%f30,	%f24,	%f2
loop_2271:
	fble,a	%fcc1,	loop_2272
	movvs	%xcc,	%l4,	%g7
	fpadd16	%f4,	%f28,	%f10
	fmovrdlez	%l3,	%f6,	%f0
loop_2272:
	be,a,pn	%icc,	loop_2273
	udivcc	%i5,	0x0C9B,	%l1
	fmovdpos	%icc,	%f10,	%f5
	movgu	%xcc,	%o3,	%o2
loop_2273:
	fbule	%fcc3,	loop_2274
	movle	%xcc,	%g1,	%o6
	taddcc	%i7,	0x1C61,	%g2
	move	%icc,	%i3,	%g6
loop_2274:
	fnegd	%f22,	%f22
	movrne	%i0,	0x3E8,	%o0
	nop
	setx	0x391E30A0FE6FA85A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x2A1254F159AABEDF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f22,	%f10
	brgez,a	%i4,	loop_2275
	tneg	%icc,	0x5
	movvc	%xcc,	%o5,	%i2
	ldx	[%l7 + 0x18],	%l2
loop_2275:
	srl	%i1,	0x03,	%l6
	ldsw	[%l7 + 0x7C],	%o7
	movge	%icc,	%g3,	%i6
	edge8	%g5,	%o1,	%l0
	fbule,a	%fcc1,	loop_2276
	taddcctv	%o4,	0x193B,	%l5
	alignaddrl	%g4,	%l4,	%l3
	tsubcc	%i5,	%g7,	%o3
loop_2276:
	movrlez	%l1,	%o2,	%o6
	stb	%g1,	[%l7 + 0x32]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i7,	0x1059,	%i3
	subcc	%g2,	0x1A8B,	%g6
	movcs	%icc,	%o0,	%i4
	fbuge,a	%fcc3,	loop_2277
	ld	[%l7 + 0x3C],	%f18
	bneg,pt	%xcc,	loop_2278
	fmovdge	%icc,	%f13,	%f12
loop_2277:
	movcc	%xcc,	%o5,	%i0
	taddcctv	%i2,	%i1,	%l2
loop_2278:
	move	%icc,	%o7,	%g3
	set	0x210, %i3
	ldxa	[%g0 + %i3] 0x52,	%i6
	bcc,a	loop_2279
	fmovsneg	%icc,	%f29,	%f12
	tgu	%icc,	0x3
	nop
	fitos	%f14,	%f5
loop_2279:
	sdiv	%g5,	0x1B10,	%o1
	fnot2s	%f13,	%f16
	andn	%l0,	0x0B9B,	%l6
	fxors	%f0,	%f7,	%f24
	fnot2	%f6,	%f22
	fpadd32	%f10,	%f10,	%f10
	brgz	%o4,	loop_2280
	fbu,a	%fcc2,	loop_2281
	xorcc	%g4,	%l4,	%l5
	smulcc	%i5,	%g7,	%l3
loop_2280:
	sethi	0x1125,	%l1
loop_2281:
	movpos	%xcc,	%o3,	%o6
	edge16	%o2,	%i7,	%g1
	edge32ln	%i3,	%g2,	%g6
	sra	%o0,	0x10,	%o5
	andcc	%i0,	%i4,	%i2
	move	%icc,	%i1,	%o7
	sll	%l2,	%i6,	%g5
	edge32	%o1,	%g3,	%l0
	alignaddrl	%o4,	%l6,	%l4
	fpackfix	%f16,	%f13
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5A] %asi,	%l5
	edge32l	%i5,	%g7,	%g4
	ba,pt	%xcc,	loop_2282
	tvs	%xcc,	0x7
	movge	%icc,	%l1,	%l3
	ldsh	[%l7 + 0x68],	%o6
loop_2282:
	prefetch	[%l7 + 0x18],	 0x2
	edge8	%o2,	%o3,	%i7
	movle	%xcc,	%i3,	%g1
	bvs,a,pt	%xcc,	loop_2283
	popc	0x1F39,	%g6
	movl	%xcc,	%g2,	%o5
	st	%f22,	[%l7 + 0x70]
loop_2283:
	fexpand	%f19,	%f20
	fble	%fcc1,	loop_2284
	fbn,a	%fcc3,	loop_2285
	movpos	%xcc,	%i0,	%i4
	flush	%l7 + 0x14
loop_2284:
	sll	%o0,	0x1D,	%i1
loop_2285:
	movrlez	%o7,	%l2,	%i2
	movrgz	%g5,	%i6,	%o1
	nop
	setx	0x251E7856C0464416,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	movrgez	%l0,	%g3,	%l6
	tsubcc	%l4,	%o4,	%l5
	tcc	%xcc,	0x0
	and	%g7,	0x106C,	%g4
	brgz,a	%i5,	loop_2286
	nop
	setx	0x0A327978,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x5F4DEB0B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f13,	%f29
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x40] %asi,	%l2
loop_2286:
	fnegs	%f6,	%f0
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x108] %asi,	%o6
	udivcc	%o2,	0x194C,	%o3
	movg	%icc,	%l1,	%i3
	fandnot2	%f24,	%f26,	%f26
	edge8l	%i7,	%g1,	%g6
	fbue	%fcc3,	loop_2287
	andcc	%o5,	0x0C63,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f2,	%f10,	%f4
loop_2287:
	popc	0x07DB,	%i0
	sllx	%i4,	%i1,	%o7
	subccc	%l2,	%o0,	%i2
	orncc	%i6,	%o1,	%g5
	movleu	%icc,	%l0,	%g3
	addc	%l6,	%o4,	%l5
	tgu	%xcc,	0x2
	fnegd	%f22,	%f0
	smulcc	%g7,	%l4,	%i5
	move	%xcc,	%l3,	%o6
	set	0x0C, %o1
	ldsha	[%l7 + %o1] 0x15,	%g4
	edge32	%o3,	%o2,	%i3
	movneg	%icc,	%l1,	%i7
	bg,pn	%icc,	loop_2288
	edge16	%g1,	%g6,	%g2
	xorcc	%o5,	0x1100,	%i4
	nop
	setx	loop_2289,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2288:
	mulscc	%i0,	%i1,	%o7
	xorcc	%l2,	%i2,	%i6
	fmovde	%xcc,	%f26,	%f15
loop_2289:
	fcmpeq16	%f30,	%f16,	%o0
	membar	0x2A
	tn	%xcc,	0x3
	set	0x18, %i5
	sta	%f29,	[%l7 + %i5] 0x81
	stx	%o1,	[%l7 + 0x40]
	fmovdgu	%xcc,	%f16,	%f20
	srax	%l0,	0x1C,	%g3
	set	0x68, %l6
	stwa	%g5,	[%l7 + %l6] 0xeb
	membar	#Sync
	fabsd	%f10,	%f30
	sub	%o4,	0x19C7,	%l6
	fzero	%f26
	fabss	%f18,	%f10
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x1f
	membar	#Sync
	nop
	setx loop_2290, %l0, %l1
	jmpl %l1, %g7
	nop
	setx	0xCD8E8D50,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f5
	sdivcc	%l4,	0x1B53,	%l5
	addc	%l3,	0x0658,	%i5
loop_2290:
	smul	%o6,	0x119D,	%g4
	smul	%o3,	0x187F,	%o2
	movrlez	%l1,	0x3BC,	%i7
	bneg,pt	%xcc,	loop_2291
	fors	%f27,	%f29,	%f20
	sdivcc	%g1,	0x01B8,	%g6
	addcc	%i3,	%o5,	%i4
loop_2291:
	edge16ln	%i0,	%g2,	%i1
	bleu,a	loop_2292
	movg	%xcc,	%o7,	%i2
	tpos	%icc,	0x3
	srlx	%i6,	%o0,	%o1
loop_2292:
	fsrc2	%f10,	%f24
	flush	%l7 + 0x64
	ldd	[%l7 + 0x70],	%f10
	tn	%icc,	0x1
	ldsb	[%l7 + 0x17],	%l0
	fbug,a	%fcc3,	loop_2293
	fmovrslz	%g3,	%f27,	%f1
	mova	%icc,	%g5,	%l2
	fnor	%f8,	%f12,	%f2
loop_2293:
	edge32ln	%o4,	%g7,	%l4
	mova	%xcc,	%l5,	%l3
	nop
	setx	0xE0441D40,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	stbar
	tne	%icc,	0x5
	tpos	%xcc,	0x0
	movre	%i5,	%l6,	%o6
	movg	%icc,	%o3,	%g4
	xor	%l1,	0x12CE,	%i7
	nop
	setx	loop_2294,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0xFEEDEFCDA36B9130,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xE8DB9A601FD57547,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f20,	%f0
	popc	0x0322,	%g1
	udivx	%o2,	0x0042,	%i3
loop_2294:
	tsubcc	%o5,	%g6,	%i4
	sdiv	%i0,	0x011F,	%i1
	edge8n	%o7,	%i2,	%g2
	sdiv	%o0,	0x18C2,	%o1
	fmovsgu	%icc,	%f3,	%f8
	edge8ln	%i6,	%g3,	%g5
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x25] %asi,	%l0
	tg	%xcc,	0x4
	mulx	%o4,	%l2,	%l4
	set	0x68, %g6
	ldxa	[%l7 + %g6] 0x11,	%g7
	mulscc	%l5,	%l3,	%i5
	fmul8x16	%f9,	%f28,	%f10
	sll	%l6,	0x1B,	%o3
	tn	%xcc,	0x7
	brnz,a	%g4,	loop_2295
	tne	%xcc,	0x1
	movrlez	%o6,	0x2E6,	%i7
	fmul8sux16	%f12,	%f28,	%f18
loop_2295:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f10,	[%l7 + 0x68] %asi
	be,pt	%icc,	loop_2296
	bne,a	loop_2297
	prefetch	[%l7 + 0x44],	 0x1
	sll	%g1,	0x0D,	%l1
loop_2296:
	nop
	set	0x24, %l2
	lda	[%l7 + %l2] 0x04,	%f17
loop_2297:
	bvs	%xcc,	loop_2298
	edge32	%i3,	%o2,	%o5
	edge32	%g6,	%i4,	%i1
	array32	%o7,	%i2,	%g2
loop_2298:
	edge16l	%o0,	%o1,	%i0
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf1
	membar	#Sync
	sll	%i6,	%g3,	%l0
	sdivx	%g5,	0x15B8,	%l2
	xor	%o4,	0x1F13,	%l4
	and	%g7,	%l3,	%l5
	bleu	loop_2299
	membar	0x37
	tne	%icc,	0x0
	srax	%i5,	%l6,	%g4
loop_2299:
	tge	%xcc,	0x3
	sth	%o3,	[%l7 + 0x08]
	std	%f22,	[%l7 + 0x20]
	fmovrde	%o6,	%f26,	%f30
	tl	%xcc,	0x6
	stb	%i7,	[%l7 + 0x27]
	fmovdne	%xcc,	%f25,	%f14
	fpadd16s	%f6,	%f7,	%f15
	fbne,a	%fcc1,	loop_2300
	bge	loop_2301
	fmovdpos	%xcc,	%f19,	%f7
	tcc	%xcc,	0x7
loop_2300:
	nop
	set	0x1C, %o0
	stha	%g1,	[%l7 + %o0] 0x2a
	membar	#Sync
loop_2301:
	movneg	%icc,	%l1,	%o2
	fbg,a	%fcc1,	loop_2302
	sllx	%i3,	%o5,	%g6
	fmovdvs	%xcc,	%f14,	%f23
	bgu,pn	%xcc,	loop_2303
loop_2302:
	edge16	%i1,	%i4,	%i2
	edge16	%o7,	%g2,	%o0
	fnand	%f24,	%f24,	%f4
loop_2303:
	movg	%icc,	%i0,	%o1
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x54] %asi,	%f22
	swap	[%l7 + 0x14],	%i6
	orncc	%g3,	0x023E,	%l0
	wr	%g0,	0xe3,	%asi
	stha	%l2,	[%l7 + 0x08] %asi
	membar	#Sync
	set	0x3C, %g4
	stba	%g5,	[%l7 + %g4] 0x19
	umulcc	%l4,	%o4,	%g7
	nop
	fitod	%f8,	%f12
	fdtoi	%f12,	%f10
	edge32n	%l5,	%i5,	%l6
	flush	%l7 + 0x10
	sllx	%l3,	0x1E,	%o3
	taddcc	%o6,	0x134F,	%g4
	udivcc	%g1,	0x11DF,	%l1
	edge16l	%o2,	%i7,	%i3
	fmovdvs	%icc,	%f3,	%f4
	umulcc	%g6,	%o5,	%i4
	umul	%i2,	0x0AED,	%i1
	tvc	%xcc,	0x2
	fcmple32	%f24,	%f4,	%o7
	movvc	%icc,	%g2,	%i0
	ba,a,pt	%icc,	loop_2304
	fsrc2s	%f5,	%f0
	tvs	%xcc,	0x3
	fbge,a	%fcc2,	loop_2305
loop_2304:
	swap	[%l7 + 0x64],	%o0
	sll	%o1,	0x04,	%i6
	set	0x40, %l1
	lda	[%l7 + %l1] 0x88,	%f31
loop_2305:
	pdist	%f10,	%f30,	%f4
	fmovdle	%xcc,	%f20,	%f0
	fpmerge	%f5,	%f9,	%f30
	tsubcctv	%g3,	0x1800,	%l2
	set	0x0C, %i7
	ldswa	[%l7 + %i7] 0x89,	%l0
	lduh	[%l7 + 0x70],	%l4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g5,	%o4
	nop
	setx	0x37ECE471,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x8F1A258B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f0,	%f23
	umulcc	%l5,	0x15FC,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x44] %asi,	%l6
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l3,	%i5
	movleu	%xcc,	%o6,	%g4
	array32	%o3,	%g1,	%l1
	srax	%o2,	%i7,	%i3
	srax	%g6,	%o5,	%i4
	sub	%i2,	%i1,	%o7
	fmovsge	%icc,	%f21,	%f25
	nop
	setx	loop_2306,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcc	%i0,	%o0,	%g2
	fxors	%f12,	%f9,	%f6
	tneg	%xcc,	0x3
loop_2306:
	popc	0x1D5A,	%i6
	fone	%f28
	nop
	setx	0xC7C9E078,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x0D415116,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f31,	%f0
	sub	%g3,	0x165A,	%o1
	andcc	%l2,	%l0,	%l4
	be,a,pt	%xcc,	loop_2307
	addc	%o4,	0x17B1,	%g5
	tn	%xcc,	0x4
	wr	%g0,	0x89,	%asi
	stha	%l5,	[%l7 + 0x1E] %asi
loop_2307:
	movvs	%icc,	%g7,	%l3
	xorcc	%i5,	%o6,	%l6
	fbue,a	%fcc3,	loop_2308
	edge8n	%o3,	%g4,	%g1
	fmovrde	%o2,	%f6,	%f14
	tsubcc	%i7,	%l1,	%i3
loop_2308:
	fbe	%fcc2,	loop_2309
	te	%xcc,	0x2
	subcc	%g6,	0x0ECF,	%o5
	move	%xcc,	%i4,	%i2
loop_2309:
	nop
	set	0x0C, %i4
	lduwa	[%l7 + %i4] 0x04,	%i1
	sethi	0x0579,	%i0
	nop
	setx loop_2310, %l0, %l1
	jmpl %l1, %o7
	nop
	setx	0x80602F8E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	and	%g2,	%i6,	%g3
	andncc	%o1,	%l2,	%l0
loop_2310:
	nop
	set	0x0A, %i1
	stha	%l4,	[%l7 + %i1] 0x14
	edge8n	%o0,	%g5,	%l5
	edge8	%o4,	%g7,	%l3
	fba,a	%fcc2,	loop_2311
	xnorcc	%i5,	%o6,	%o3
	movrlez	%g4,	0x04C,	%g1
	movge	%icc,	%l6,	%o2
loop_2311:
	stbar
	move	%icc,	%l1,	%i7
	edge32ln	%i3,	%o5,	%g6
	fmovdpos	%xcc,	%f23,	%f4
	movne	%xcc,	%i4,	%i2
	movg	%icc,	%i1,	%i0
	fzero	%f12
	movvc	%icc,	%g2,	%o7
	movrgez	%i6,	%o1,	%l2
	udivcc	%l0,	0x0F56,	%g3
	ldub	[%l7 + 0x46],	%l4
	prefetch	[%l7 + 0x78],	 0x2
	andncc	%o0,	%l5,	%o4
	movg	%xcc,	%g7,	%g5
	taddcc	%l3,	0x0927,	%i5
	sethi	0x1F53,	%o3
	fxors	%f29,	%f1,	%f22
	fxnor	%f12,	%f6,	%f24
	xnorcc	%o6,	%g1,	%g4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%o2
	move	%icc,	%l6,	%i7
	fmovrdlez	%l1,	%f2,	%f12
	movg	%icc,	%o5,	%g6
	ldd	[%l7 + 0x38],	%f28
	fbge,a	%fcc2,	loop_2312
	for	%f12,	%f24,	%f12
	movre	%i3,	0x090,	%i4
	set	0x16, %o7
	ldsha	[%l7 + %o7] 0x10,	%i2
loop_2312:
	alignaddr	%i1,	%g2,	%o7
	tsubcc	%i0,	%i6,	%l2
	sllx	%l0,	0x0D,	%o1
	fandnot2	%f12,	%f16,	%f8
	fmovrse	%l4,	%f6,	%f14
	fcmpgt16	%f4,	%f0,	%g3
	set	0x18, %o6
	prefetcha	[%l7 + %o6] 0x14,	 0x0
	and	%l5,	0x08DF,	%o4
	edge32ln	%g7,	%l3,	%i5
	udiv	%o3,	0x1052,	%g5
	fmovs	%f14,	%f2
	alignaddr	%g1,	%g4,	%o2
	sub	%o6,	%i7,	%l1
	sdivcc	%o5,	0x09AC,	%g6
	movpos	%xcc,	%i3,	%i4
	edge8	%l6,	%i2,	%i1
	wr	%g0,	0xeb,	%asi
	stxa	%g2,	[%l7 + 0x08] %asi
	membar	#Sync
	array8	%i0,	%o7,	%l2
	udivcc	%l0,	0x1ED4,	%o1
	ldd	[%l7 + 0x48],	%i6
	taddcctv	%g3,	%l4,	%l5
	fmovs	%f4,	%f0
	fcmpeq16	%f28,	%f6,	%o4
	fmovse	%xcc,	%f5,	%f16
	addcc	%o0,	%l3,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f7,	%f18
	fstox	%f18,	%f0
	mulscc	%o3,	%g7,	%g1
	movrlez	%g5,	%o2,	%g4
	membar	0x07
	lduh	[%l7 + 0x44],	%i7
	movrne	%l1,	0x241,	%o6
	mulx	%o5,	0x06A0,	%g6
	set	0x0E, %l0
	lduha	[%l7 + %l0] 0x0c,	%i4
	and	%i3,	0x033B,	%i2
	set	0x20, %o2
	lduha	[%l7 + %o2] 0x81,	%i1
	tleu	%icc,	0x0
	movpos	%icc,	%l6,	%i0
	prefetch	[%l7 + 0x54],	 0x2
	edge16l	%g2,	%l2,	%o7
	udivx	%l0,	0x18B2,	%o1
	umulcc	%g3,	%l4,	%l5
	ble,a	%icc,	loop_2313
	tge	%xcc,	0x3
	movge	%xcc,	%o4,	%i6
	lduw	[%l7 + 0x4C],	%l3
loop_2313:
	srl	%i5,	%o0,	%g7
	andn	%g1,	0x13A7,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%o2,	%g5,	%g4
	bneg,a,pn	%xcc,	loop_2314
	tcc	%icc,	0x2
	andncc	%i7,	%o6,	%l1
	sdiv	%g6,	0x1126,	%o5
loop_2314:
	addc	%i4,	%i2,	%i3
	xorcc	%l6,	%i1,	%g2
	xor	%l2,	0x1CC9,	%o7
	udivcc	%l0,	0x0F3A,	%i0
	movleu	%xcc,	%g3,	%l4
	tcc	%xcc,	0x5
	ta	%icc,	0x2
	udivx	%l5,	0x142A,	%o1
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	srax	%i6,	%l3,	%i5
	andncc	%o0,	%o4,	%g1
	nop
	fitod	%f6,	%f30
	fdtoi	%f30,	%f13
	edge16ln	%o3,	%g7,	%o2
	fmuld8sux16	%f27,	%f14,	%f14
	sdiv	%g5,	0x0ACB,	%i7
	tg	%icc,	0x0
	edge8	%o6,	%g4,	%l1
	fmovdge	%xcc,	%f10,	%f28
	nop
	setx	loop_2315,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitod	%f1,	%f20
	subccc	%g6,	0x0C69,	%o5
	umul	%i4,	%i3,	%l6
loop_2315:
	tl	%xcc,	0x5
	alignaddr	%i1,	%i2,	%g2
	set	0x53, %g3
	ldsba	[%l7 + %g3] 0x0c,	%o7
	fnot1s	%f25,	%f18
	fmovdne	%xcc,	%f10,	%f16
	taddcctv	%l2,	0x036A,	%l0
	fcmple16	%f2,	%f0,	%i0
	nop
	setx	loop_2316,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%xcc,	%l4,	%l5
	brlez,a	%g3,	loop_2317
	movvs	%xcc,	%o1,	%i6
loop_2316:
	xnor	%l3,	0x0A1D,	%i5
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x18] %asi,	%o4
loop_2317:
	nop
	wr	%g0,	0x11,	%asi
	stxa	%o0,	[%l7 + 0x28] %asi
	brlz,a	%g1,	loop_2318
	andn	%g7,	%o2,	%o3
	fmovdge	%xcc,	%f16,	%f18
	sllx	%g5,	0x17,	%o6
loop_2318:
	movneg	%xcc,	%g4,	%i7
	fpadd16s	%f9,	%f15,	%f17
	tcc	%icc,	0x2
	nop
	setx loop_2319, %l0, %l1
	jmpl %l1, %g6
	movgu	%icc,	%o5,	%l1
	bcs,a,pt	%icc,	loop_2320
	movcc	%xcc,	%i3,	%i4
loop_2319:
	mulx	%l6,	0x1F61,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2320:
	xorcc	%i1,	0x0F20,	%g2
	fabss	%f0,	%f6
	ldsh	[%l7 + 0x16],	%l2
	tsubcc	%o7,	0x0C2E,	%l0
	edge8	%l4,	%i0,	%g3
	fbu	%fcc2,	loop_2321
	sdiv	%l5,	0x04EE,	%i6
	movrlz	%l3,	%o1,	%o4
	fxnors	%f30,	%f2,	%f6
loop_2321:
	fornot2s	%f15,	%f25,	%f25
	brlz	%o0,	loop_2322
	array8	%g1,	%i5,	%g7
	movre	%o3,	0x29B,	%g5
	nop
	fitod	%f0,	%f14
	fdtos	%f14,	%f11
loop_2322:
	movpos	%xcc,	%o6,	%o2
	addcc	%g4,	%i7,	%g6
	fbge	%fcc0,	loop_2323
	mova	%icc,	%o5,	%i3
	nop
	set	0x4E, %g7
	ldstub	[%l7 + %g7],	%l1
	smul	%l6,	0x1ACF,	%i4
loop_2323:
	fornot2	%f2,	%f6,	%f22
	fsrc2	%f16,	%f16
	ldsh	[%l7 + 0x64],	%i1
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f22
	fxtod	%f22,	%f10
	sethi	0x17A6,	%i2
	mulx	%g2,	0x0650,	%l2
	subccc	%l0,	%o7,	%i0
	nop
	setx	0x29D6655D9C3C8065,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x93E8723D635A3673,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f4,	%f18
	sth	%g3,	[%l7 + 0x34]
	tgu	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f20,	%f5,	%f0
	fpsub32s	%f14,	%f27,	%f27
	fmovse	%icc,	%f2,	%f1
	tne	%icc,	0x0
	array16	%l4,	%i6,	%l3
	fmovdcs	%xcc,	%f28,	%f9
	edge8n	%l5,	%o1,	%o4
	xnorcc	%g1,	%o0,	%g7
	tvc	%xcc,	0x3
	andcc	%o3,	0x0CE7,	%g5
	set	0x30, %l4
	ldda	[%l7 + %l4] 0xeb,	%i4
	sir	0x0AC0
	orn	%o6,	%g4,	%i7
	edge32ln	%o2,	%o5,	%i3
	movvs	%icc,	%l1,	%g6
	bshuffle	%f6,	%f20,	%f16
	movrlz	%l6,	0x045,	%i4
	sllx	%i2,	%i1,	%l2
	set	0x74, %i6
	lda	[%l7 + %i6] 0x15,	%f20
	add	%l0,	0x1DF7,	%o7
	bshuffle	%f18,	%f20,	%f26
	array32	%i0,	%g3,	%g2
	fornot2s	%f4,	%f18,	%f19
	ta	%xcc,	0x2
	bcs,pn	%xcc,	loop_2324
	movn	%icc,	%i6,	%l4
	fornot1	%f26,	%f0,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2324:
	taddcctv	%l5,	%l3,	%o4
	te	%icc,	0x5
	movrlz	%g1,	0x1D9,	%o1
	edge16ln	%g7,	%o0,	%o3
	bne,a	%icc,	loop_2325
	or	%i5,	0x0974,	%g5
	faligndata	%f6,	%f22,	%f10
	movleu	%xcc,	%g4,	%i7
loop_2325:
	tle	%icc,	0x1
	edge32n	%o2,	%o6,	%o5
	fnand	%f28,	%f24,	%f18
	fpack16	%f0,	%f0
	ble,a	%icc,	loop_2326
	fcmple32	%f0,	%f12,	%l1
	bvc,pn	%icc,	loop_2327
	sdiv	%g6,	0x1BAB,	%l6
loop_2326:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%i4,	[%l7 + 0x38] %asi
loop_2327:
	fmovdl	%icc,	%f29,	%f1
	sub	%i3,	%i1,	%l2
	brnz,a	%i2,	loop_2328
	mulscc	%o7,	%i0,	%g3
	orncc	%g2,	0x1447,	%i6
	set	0x24, %l3
	stwa	%l4,	[%l7 + %l3] 0x11
loop_2328:
	nop
	setx loop_2329, %l0, %l1
	jmpl %l1, %l0
	ldstub	[%l7 + 0x62],	%l3
	sdiv	%l5,	0x0CD7,	%o4
	wr	%g0,	0x22,	%asi
	stha	%o1,	[%l7 + 0x64] %asi
	membar	#Sync
loop_2329:
	tl	%icc,	0x3
	std	%f2,	[%l7 + 0x38]
	array8	%g7,	%g1,	%o3
	movne	%xcc,	%o0,	%g5
	bvc,pn	%xcc,	loop_2330
	movvs	%xcc,	%g4,	%i5
	bne,a	%xcc,	loop_2331
	taddcctv	%o2,	%o6,	%i7
loop_2330:
	popc	0x078E,	%l1
	brz,a	%g6,	loop_2332
loop_2331:
	nop
	setx	0x9E80F4346B6E8511,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xF876A9C8FF37562D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f4,	%f16
	smulcc	%o5,	%l6,	%i3
	sra	%i4,	0x05,	%i1
loop_2332:
	udivx	%i2,	0x15E4,	%o7
	fpsub16s	%f5,	%f28,	%f6
	fmovrdlez	%l2,	%f6,	%f0
	tleu	%xcc,	0x5
	subcc	%g3,	0x0AB8,	%i0
	mulx	%g2,	0x14AD,	%i6
	orcc	%l4,	%l3,	%l5
	nop
	fitos	%f7,	%f15
	fstox	%f15,	%f16
	fxtos	%f16,	%f20
	fmovdle	%icc,	%f31,	%f1
	movge	%icc,	%o4,	%l0
	tl	%icc,	0x4
	fmovsl	%icc,	%f2,	%f30
	nop
	setx	0x606D8E76,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	sub	%g7,	%g1,	%o3
	movle	%xcc,	%o0,	%o1
	ldd	[%l7 + 0x30],	%g4
	fmovdg	%xcc,	%f13,	%f10
	edge8n	%i5,	%g4,	%o2
	addcc	%o6,	%i7,	%g6
	set	0x30, %g5
	prefetcha	[%l7 + %g5] 0x19,	 0x3
	fble	%fcc0,	loop_2333
	bleu,a,pt	%icc,	loop_2334
	sth	%o5,	[%l7 + 0x7A]
	nop
	setx	0xBC0F09FC79798036,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xC61EECD48C802109,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f0,	%f8
loop_2333:
	fmovdg	%icc,	%f19,	%f16
loop_2334:
	fsrc2	%f14,	%f30
	orn	%l6,	0x113F,	%i3
	ldsw	[%l7 + 0x5C],	%i4
	movneg	%icc,	%i2,	%i1
	movcc	%icc,	%o7,	%l2
	movleu	%xcc,	%g3,	%i0
	sub	%i6,	0x0C3F,	%g2
	brgz,a	%l4,	loop_2335
	tcc	%xcc,	0x2
	call	loop_2336
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2335:
	addc	%l3,	%l5,	%l0
	tpos	%icc,	0x2
loop_2336:
	fcmpgt16	%f0,	%f14,	%o4
	set	0x76, %l5
	ldstuba	[%l7 + %l5] 0x81,	%g1
	edge8l	%o3,	%o0,	%g7
	fpsub16	%f8,	%f24,	%f10
	edge16ln	%g5,	%i5,	%g4
	fsrc1	%f4,	%f4
	tcc	%xcc,	0x7
	smul	%o1,	%o6,	%o2
	movrgz	%g6,	%i7,	%o5
	alignaddrl	%l1,	%i3,	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%i4
	brgez,a	%o7,	loop_2337
	fmovrdlz	%l2,	%f10,	%f8
	tg	%icc,	0x1
	mulx	%i1,	0x0F39,	%i0
loop_2337:
	nop
	wr	%g0,	0x19,	%asi
	stwa	%g3,	[%l7 + 0x38] %asi
	set	0x28, %g1
	prefetcha	[%l7 + %g1] 0x18,	 0x1
	edge16n	%l4,	%l3,	%l5
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x1D] %asi,	%l0
	orncc	%i6,	%g1,	%o3
	edge32	%o4,	%o0,	%g7
	orncc	%i5,	0x035F,	%g4
	ble,pn	%xcc,	loop_2338
	tle	%xcc,	0x3
	ldsb	[%l7 + 0x19],	%o1
	tg	%xcc,	0x2
loop_2338:
	nop
	setx	loop_2339,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%xcc,	%g5,	%o6
	ld	[%l7 + 0x58],	%f9
	set	0x38, %o5
	ldxa	[%l7 + %o5] 0x89,	%g6
loop_2339:
	te	%icc,	0x0
	bvc,pn	%xcc,	loop_2340
	fbg	%fcc1,	loop_2341
	brgez,a	%i7,	loop_2342
	xorcc	%o5,	0x0879,	%l1
loop_2340:
	nop
	setx loop_2343, %l0, %l1
	jmpl %l1, %o2
loop_2341:
	edge16l	%i3,	%l6,	%i2
loop_2342:
	add	%i4,	0x0C6F,	%l2
	fmovsne	%icc,	%f18,	%f26
loop_2343:
	array8	%o7,	%i1,	%g3
	movrne	%i0,	%l4,	%l3
	fornot1	%f30,	%f20,	%f26
	fzero	%f0
	stbar
	edge32	%g2,	%l5,	%l0
	mulx	%i6,	%g1,	%o3
	edge32l	%o4,	%g7,	%o0
	set	0x32, %o3
	ldstuba	[%l7 + %o3] 0x04,	%g4
	fnot2s	%f4,	%f0
	edge32ln	%o1,	%g5,	%i5
	fornot2s	%f22,	%f7,	%f10
	fands	%f7,	%f7,	%f17
	movvs	%xcc,	%o6,	%i7
	tl	%xcc,	0x7
	tsubcc	%o5,	0x04DB,	%l1
	movgu	%icc,	%o2,	%g6
	edge16ln	%l6,	%i3,	%i2
	sub	%l2,	0x1C56,	%i4
	tn	%icc,	0x3
	fmovrdne	%o7,	%f12,	%f22
	mulscc	%i1,	0x0543,	%g3
	addccc	%l4,	0x1DCF,	%i0
	bcc,a	loop_2344
	fbn,a	%fcc1,	loop_2345
	swap	[%l7 + 0x50],	%g2
	ldd	[%l7 + 0x50],	%f10
loop_2344:
	add	%l3,	%l5,	%l0
loop_2345:
	nop
	fitos	%f12,	%f19
	fstox	%f19,	%f4
	fxtos	%f4,	%f12
	fmovrdgez	%i6,	%f14,	%f28
	tn	%xcc,	0x2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g1,	%o4
	fbne,a	%fcc2,	loop_2346
	movrlez	%o3,	0x1E3,	%o0
	tleu	%xcc,	0x7
	movleu	%icc,	%g4,	%g7
loop_2346:
	fmul8x16au	%f23,	%f15,	%f0
	ldub	[%l7 + 0x6C],	%o1
	fblg,a	%fcc1,	loop_2347
	movne	%xcc,	%i5,	%g5
	fcmpne32	%f12,	%f26,	%i7
	edge32	%o5,	%o6,	%o2
loop_2347:
	tge	%xcc,	0x4
	movrlz	%g6,	0x1BF,	%l1
	movrgz	%i3,	0x156,	%i2
	sdivcc	%l6,	0x09C7,	%l2
	ldsb	[%l7 + 0x29],	%o7
	sll	%i4,	%g3,	%i1
	bvc,pn	%icc,	loop_2348
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f16
	fxtod	%f16,	%f4
	fornot1s	%f17,	%f0,	%f27
	movneg	%xcc,	%i0,	%l4
loop_2348:
	fble,a	%fcc3,	loop_2349
	fbe	%fcc0,	loop_2350
	tvc	%icc,	0x7
	add	%g2,	%l3,	%l0
loop_2349:
	nop
	set	0x18, %i0
	prefetcha	[%l7 + %i0] 0x15,	 0x3
loop_2350:
	edge8l	%l5,	%g1,	%o4
	fpsub16s	%f17,	%f16,	%f6
	fsrc1s	%f25,	%f6
	andcc	%o3,	%o0,	%g7
	mulx	%g4,	0x1545,	%i5
	fpackfix	%f4,	%f26
	ba,a	loop_2351
	fone	%f4
	fbl,a	%fcc3,	loop_2352
	nop
	fitos	%f21,	%f17
loop_2351:
	edge32	%o1,	%i7,	%o5
	tg	%icc,	0x2
loop_2352:
	nop
	setx	loop_2353,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tleu	%icc,	0x3
	and	%g5,	%o6,	%g6
	bl,pt	%icc,	loop_2354
loop_2353:
	addcc	%o2,	0x199F,	%i3
	flush	%l7 + 0x48
	tsubcctv	%i2,	%l1,	%l2
loop_2354:
	sllx	%l6,	%i4,	%g3
	tleu	%icc,	0x3
	fones	%f15
	fbo	%fcc2,	loop_2355
	fble,a	%fcc2,	loop_2356
	tvc	%xcc,	0x4
	mova	%xcc,	%i1,	%o7
loop_2355:
	tneg	%xcc,	0x5
loop_2356:
	fpsub32s	%f11,	%f27,	%f12
	bleu,a,pt	%icc,	loop_2357
	movrlz	%l4,	%i0,	%l3
	nop
	setx loop_2358, %l0, %l1
	jmpl %l1, %g2
	edge8	%l0,	%l5,	%i6
loop_2357:
	bg	loop_2359
	ta	%xcc,	0x2
loop_2358:
	fnegs	%f3,	%f9
	addcc	%g1,	0x1D5C,	%o3
loop_2359:
	nop
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x14
	wr	%g0,	0x89,	%asi
	stha	%o0,	[%l7 + 0x50] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,pt	%xcc,	loop_2360
	ta	%xcc,	0x0
	movgu	%xcc,	%o4,	%g7
	movle	%icc,	%g4,	%i5
loop_2360:
	srlx	%o1,	%o5,	%i7
	nop
	fitod	%f4,	%f22
	fdtox	%f22,	%f0
	fblg,a	%fcc2,	loop_2361
	tne	%icc,	0x3
	membar	0x7B
	tvs	%icc,	0x3
loop_2361:
	fcmpeq16	%f2,	%f4,	%o6
	bne,a,pt	%xcc,	loop_2362
	udivx	%g6,	0x1011,	%o2
	fxors	%f29,	%f30,	%f13
	array8	%g5,	%i2,	%i3
loop_2362:
	fandnot2	%f10,	%f20,	%f24
	smul	%l2,	%l6,	%l1
	fexpand	%f6,	%f22
	fbug	%fcc0,	loop_2363
	edge32	%g3,	%i1,	%o7
	fbuge,a	%fcc3,	loop_2364
	edge32n	%l4,	%i4,	%i0
loop_2363:
	srax	%l3,	%l0,	%g2
	edge8	%i6,	%l5,	%g1
loop_2364:
	fmovdpos	%xcc,	%f12,	%f8
	fmovdge	%xcc,	%f26,	%f21
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%o4
	tsubcc	%o3,	%g4,	%g7
	nop
	fitod	%f8,	%f16
	fdtos	%f16,	%f4
	edge8n	%o1,	%i5,	%o5
	add	%o6,	%g6,	%o2
	fmovsgu	%xcc,	%f4,	%f20
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	bvs,a	%icc,	loop_2365
	tneg	%icc,	0x6
	ba	loop_2366
	tcs	%xcc,	0x3
loop_2365:
	nop
	setx	0x6055FF4F,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	brlz	%i2,	loop_2367
loop_2366:
	movge	%icc,	%i3,	%l2
	edge16n	%l6,	%l1,	%g3
	srlx	%i1,	0x08,	%o7
loop_2367:
	movcs	%xcc,	%l4,	%i4
	fmul8x16	%f8,	%f16,	%f16
	xnorcc	%i0,	%i7,	%l3
	set	0x10, %o1
	stxa	%g2,	[%l7 + %o1] 0x23
	membar	#Sync
	subccc	%l0,	%i6,	%l5
	be	loop_2368
	fbo	%fcc2,	loop_2369
	fmovsleu	%icc,	%f28,	%f23
	fzero	%f8
loop_2368:
	edge8l	%g1,	%o4,	%o0
loop_2369:
	edge32l	%g4,	%g7,	%o3
	edge16	%o1,	%i5,	%o5
	swap	[%l7 + 0x48],	%o6
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tleu	%xcc,	0x2
	movl	%icc,	%o2,	%g5
	nop
	setx	0x667299B5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x5F238990,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f8,	%f23
	movleu	%icc,	%g6,	%i2
	movrlz	%i3,	%l6,	%l2
	smul	%l1,	0x0B70,	%g3
	fbn	%fcc0,	loop_2370
	fmovscs	%xcc,	%f25,	%f16
	smulcc	%i1,	0x1132,	%o7
	fbug	%fcc3,	loop_2371
loop_2370:
	smul	%l4,	%i4,	%i0
	fmovspos	%xcc,	%f7,	%f24
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%i6
loop_2371:
	bl	loop_2372
	fbule	%fcc0,	loop_2373
	fnegd	%f30,	%f24
	ldx	[%l7 + 0x10],	%l3
loop_2372:
	umulcc	%g2,	%l0,	%i6
loop_2373:
	fmovrde	%l5,	%f18,	%f24
	sth	%o4,	[%l7 + 0x3A]
	array8	%g1,	%g4,	%g7
	edge32n	%o3,	%o0,	%o1
	edge8ln	%o5,	%o6,	%i5
	smul	%o2,	0x13CB,	%g5
	subccc	%i2,	%i3,	%l6
	ldd	[%l7 + 0x18],	%f4
	srlx	%g6,	0x0B,	%l1
	umulcc	%g3,	0x0E75,	%l2
	fbge,a	%fcc2,	loop_2374
	edge8	%o7,	%l4,	%i1
	udivcc	%i0,	0x0663,	%i7
	brgez,a	%i4,	loop_2375
loop_2374:
	xor	%l3,	%g2,	%i6
	fbe,a	%fcc2,	loop_2376
	bgu,a,pt	%xcc,	loop_2377
loop_2375:
	fmovrde	%l5,	%f6,	%f6
	tvc	%icc,	0x4
loop_2376:
	alignaddr	%o4,	%g1,	%l0
loop_2377:
	addcc	%g4,	0x07A3,	%o3
	edge32	%o0,	%o1,	%g7
	fbn,a	%fcc0,	loop_2378
	movneg	%xcc,	%o5,	%i5
	ldstub	[%l7 + 0x44],	%o6
	bg,a,pn	%icc,	loop_2379
loop_2378:
	edge32n	%g5,	%i2,	%o2
	fmovsle	%xcc,	%f24,	%f22
	udiv	%l6,	0x01CF,	%g6
loop_2379:
	fmovrdgez	%i3,	%f28,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g3,	%l1,	%l2
	fxnor	%f30,	%f20,	%f20
	sdivcc	%o7,	0x1F24,	%l4
	andncc	%i0,	%i1,	%i7
	bge,a	%icc,	loop_2380
	tne	%xcc,	0x7
	movvc	%icc,	%l3,	%i4
	xnor	%g2,	%i6,	%l5
loop_2380:
	nop
	set	0x55, %l6
	ldstuba	[%l7 + %l6] 0x19,	%o4
	tleu	%xcc,	0x7
	bl,a	%xcc,	loop_2381
	fcmpgt32	%f24,	%f16,	%l0
	tne	%icc,	0x1
	mova	%icc,	%g4,	%g1
loop_2381:
	swap	[%l7 + 0x70],	%o0
	movcs	%icc,	%o1,	%g7
	move	%icc,	%o3,	%o5
	sethi	0x159B,	%o6
	tgu	%icc,	0x0
	fnand	%f18,	%f20,	%f16
	fornot1s	%f24,	%f25,	%f21
	nop
	setx	0x158F64CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x6E460558,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f1,	%f10
	array8	%g5,	%i5,	%o2
	edge32l	%i2,	%l6,	%g6
	tleu	%icc,	0x2
	fmovsne	%xcc,	%f21,	%f26
	fnegd	%f12,	%f6
	ldsh	[%l7 + 0x64],	%i3
	orncc	%l1,	0x1447,	%g3
	tl	%icc,	0x0
	movg	%xcc,	%o7,	%l2
	srl	%l4,	%i0,	%i1
	fbu	%fcc0,	loop_2382
	ta	%icc,	0x7
	fornot1s	%f13,	%f0,	%f28
	umul	%i7,	0x074D,	%l3
loop_2382:
	nop
	set	0x44, %i2
	ldswa	[%l7 + %i2] 0x15,	%g2
	orn	%i4,	%l5,	%i6
	fpsub16	%f16,	%f24,	%f30
	subc	%o4,	%l0,	%g1
	fandnot2s	%f7,	%f22,	%f8
	xnorcc	%o0,	0x116B,	%g4
	tvc	%xcc,	0x0
	fmovdne	%icc,	%f31,	%f19
	ldx	[%l7 + 0x28],	%g7
	stw	%o1,	[%l7 + 0x0C]
	set	0x28, %g6
	lduha	[%l7 + %g6] 0x89,	%o3
	movcc	%xcc,	%o5,	%g5
	membar	0x43
	movle	%xcc,	%i5,	%o6
	sra	%o2,	%i2,	%l6
	fmovse	%icc,	%f11,	%f18
	fabsd	%f0,	%f2
	xnor	%g6,	0x18B5,	%i3
	fpsub16s	%f9,	%f5,	%f3
	flush	%l7 + 0x28
	bg,a,pt	%xcc,	loop_2383
	movne	%xcc,	%l1,	%o7
	fmovsgu	%xcc,	%f27,	%f0
	fba,a	%fcc0,	loop_2384
loop_2383:
	xnor	%l2,	%l4,	%i0
	sllx	%g3,	0x05,	%i1
	tsubcctv	%i7,	0x1E0E,	%l3
loop_2384:
	sethi	0x15FA,	%i4
	popc	0x0D1F,	%l5
	fcmpeq32	%f4,	%f28,	%g2
	call	loop_2385
	edge16	%i6,	%o4,	%l0
	subc	%o0,	0x0731,	%g1
	set	0x7C, %o4
	stba	%g4,	[%l7 + %o4] 0x2a
	membar	#Sync
loop_2385:
	movg	%xcc,	%o1,	%g7
	tg	%xcc,	0x3
	umul	%o3,	0x0BC0,	%g5
	set	0x60, %l2
	lduwa	[%l7 + %l2] 0x80,	%i5
	tleu	%xcc,	0x2
	brz,a	%o6,	loop_2386
	movn	%icc,	%o5,	%i2
	orn	%o2,	%l6,	%g6
	fandnot2s	%f29,	%f26,	%f26
loop_2386:
	fbn,a	%fcc3,	loop_2387
	or	%i3,	%l1,	%o7
	movleu	%icc,	%l2,	%l4
	fpadd16	%f0,	%f14,	%f22
loop_2387:
	edge16n	%i0,	%g3,	%i1
	sra	%l3,	%i7,	%l5
	bleu,a,pt	%icc,	loop_2388
	sir	0x0761
	nop
	set	0x24, %o0
	lduw	[%l7 + %o0],	%g2
	fmovsne	%icc,	%f31,	%f29
loop_2388:
	fmovdcs	%icc,	%f24,	%f10
	movneg	%xcc,	%i4,	%o4
	edge32ln	%i6,	%o0,	%g1
	addcc	%l0,	%o1,	%g7
	tcs	%xcc,	0x4
	edge8n	%g4,	%g5,	%i5
	fmovrde	%o3,	%f0,	%f28
	fmovsne	%xcc,	%f18,	%f14
	movgu	%icc,	%o6,	%o5
	tgu	%xcc,	0x7
	add	%i2,	%l6,	%g6
	sra	%o2,	%i3,	%o7
	tneg	%icc,	0x5
	tpos	%xcc,	0x3
	addc	%l2,	%l1,	%i0
	fbg,a	%fcc1,	loop_2389
	edge16n	%l4,	%g3,	%i1
	edge16ln	%i7,	%l5,	%l3
	movg	%xcc,	%g2,	%o4
loop_2389:
	sub	%i6,	0x1183,	%o0
	fmovrsgz	%g1,	%f19,	%f30
	udivcc	%i4,	0x0104,	%o1
	bge	%icc,	loop_2390
	nop
	setx	0x05ACC1D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xFEC84A1B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f2,	%f29
	edge16ln	%l0,	%g4,	%g5
	nop
	setx	loop_2391,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2390:
	edge8l	%i5,	%o3,	%g7
	nop
	set	0x0A, %g4
	ldsb	[%l7 + %g4],	%o5
	tl	%xcc,	0x3
loop_2391:
	bne,a,pt	%xcc,	loop_2392
	edge32n	%o6,	%l6,	%g6
	edge16l	%o2,	%i2,	%o7
	srl	%i3,	%l1,	%l2
loop_2392:
	nop
	setx	loop_2393,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%l4,	%i0,	%i1
	movrlz	%g3,	0x20B,	%l5
	movcc	%xcc,	%i7,	%l3
loop_2393:
	movrgez	%g2,	0x03D,	%i6
	fnot2s	%f23,	%f28
	subc	%o4,	0x10EA,	%g1
	edge8ln	%i4,	%o1,	%l0
	sethi	0x1B97,	%o0
	or	%g5,	%g4,	%i5
	flush	%l7 + 0x14
	movgu	%icc,	%o3,	%g7
	sub	%o5,	0x129E,	%o6
	subcc	%g6,	0x175B,	%o2
	edge8l	%l6,	%i2,	%o7
	fornot2	%f30,	%f0,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc2,	loop_2394
	xor	%i3,	0x0A82,	%l2
	udiv	%l1,	0x0AF6,	%l4
	fcmple16	%f14,	%f6,	%i1
loop_2394:
	stx	%i0,	[%l7 + 0x50]
	stw	%g3,	[%l7 + 0x64]
	fmul8ulx16	%f28,	%f30,	%f2
	sllx	%l5,	0x18,	%l3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x47] %asi,	%g2
	fsrc1s	%f17,	%f23
	and	%i6,	%i7,	%o4
	nop
	setx	loop_2395,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	loop_2396,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addc	%i4,	%o1,	%g1
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x14] %asi,	%l0
loop_2395:
	fbne	%fcc2,	loop_2397
loop_2396:
	orcc	%g5,	0x17CB,	%g4
	mulscc	%o0,	%i5,	%g7
	fmovrdne	%o3,	%f6,	%f30
loop_2397:
	fmovrsgez	%o5,	%f8,	%f12
	fmovdcc	%xcc,	%f11,	%f12
	sdivcc	%g6,	0x0BE7,	%o6
	taddcc	%l6,	%i2,	%o7
	brz,a	%i3,	loop_2398
	mulx	%l2,	0x0BBE,	%o2
	tcs	%xcc,	0x7
	movle	%icc,	%l1,	%i1
loop_2398:
	prefetch	[%l7 + 0x14],	 0x3
	tne	%icc,	0x4
	move	%xcc,	%i0,	%g3
	nop
	setx	0x57BDBA5488F6F786,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xA67EF49AC558C404,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f20,	%f16
	edge8	%l4,	%l3,	%g2
	fornot2	%f20,	%f22,	%f8
	ldstub	[%l7 + 0x31],	%i6
	brnz,a	%i7,	loop_2399
	movre	%o4,	%l5,	%i4
	bpos,a	loop_2400
	tne	%xcc,	0x2
loop_2399:
	fands	%f31,	%f31,	%f23
	sra	%o1,	%l0,	%g5
loop_2400:
	subccc	%g1,	%o0,	%g4
	tg	%xcc,	0x7
	fmovrde	%i5,	%f20,	%f20
	array8	%g7,	%o5,	%g6
	tvs	%xcc,	0x7
	movle	%xcc,	%o3,	%o6
	addccc	%l6,	%o7,	%i3
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	andncc	%l2,	%o2,	%i2
	prefetch	[%l7 + 0x08],	 0x1
	fmovrslez	%l1,	%f30,	%f2
	movre	%i1,	0x397,	%i0
	edge32ln	%g3,	%l3,	%g2
	fbue,a	%fcc2,	loop_2401
	tsubcctv	%i6,	%i7,	%o4
	fmovrdlz	%l4,	%f6,	%f16
	sub	%l5,	%i4,	%l0
loop_2401:
	alignaddrl	%o1,	%g1,	%g5
	membar	0x1F
	add	%o0,	%g4,	%g7
	edge8l	%o5,	%g6,	%o3
	orncc	%i5,	0x139B,	%l6
	movvc	%xcc,	%o7,	%i3
	sdivx	%o6,	0x0E64,	%o2
	edge8n	%i2,	%l1,	%l2
	bleu,a,pt	%xcc,	loop_2402
	brnz	%i1,	loop_2403
	edge16	%i0,	%l3,	%g3
	ldx	[%l7 + 0x48],	%i6
loop_2402:
	brlez	%g2,	loop_2404
loop_2403:
	mulscc	%i7,	0x1901,	%o4
	fone	%f10
	array32	%l4,	%l5,	%i4
loop_2404:
	smul	%l0,	%o1,	%g1
	ba,a	%xcc,	loop_2405
	fmovspos	%xcc,	%f11,	%f26
	fble	%fcc0,	loop_2406
	umulcc	%o0,	0x0833,	%g4
loop_2405:
	movrgez	%g7,	0x345,	%o5
	movleu	%xcc,	%g5,	%o3
loop_2406:
	ld	[%l7 + 0x30],	%f4
	ldstub	[%l7 + 0x3C],	%g6
	sdivx	%i5,	0x067A,	%o7
	fbge	%fcc0,	loop_2407
	brgz,a	%l6,	loop_2408
	tcs	%xcc,	0x7
	fbule,a	%fcc1,	loop_2409
loop_2407:
	bpos,pn	%xcc,	loop_2410
loop_2408:
	edge16n	%i3,	%o2,	%i2
	sdiv	%l1,	0x1707,	%o6
loop_2409:
	movn	%xcc,	%l2,	%i1
loop_2410:
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%f14
	alignaddrl	%i0,	%l3,	%g3
	bleu,a	%xcc,	loop_2411
	srl	%g2,	%i6,	%i7
	bpos,pn	%xcc,	loop_2412
	nop
	setx	0x90AA2B763855F122,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x3086EB10C95CA665,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f16,	%f0
loop_2411:
	sub	%o4,	0x0233,	%l4
	tsubcctv	%i4,	0x18DD,	%l5
loop_2412:
	stb	%o1,	[%l7 + 0x35]
	mulscc	%l0,	%o0,	%g1
	orcc	%g4,	0x0111,	%o5
	srax	%g7,	0x14,	%o3
	fandnot1s	%f23,	%f14,	%f9
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x44] %asi,	%g6
	nop
	setx	0x104CD947,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	sub	%g5,	0x1173,	%o7
	subccc	%i5,	0x0E84,	%l6
	udiv	%o2,	0x1875,	%i2
	set	0x3C, %i7
	stha	%i3,	[%l7 + %i7] 0x22
	membar	#Sync
	and	%o6,	0x0C00,	%l1
	fbo,a	%fcc3,	loop_2413
	tvs	%xcc,	0x2
	bvs	loop_2414
	tsubcc	%i1,	0x187B,	%i0
loop_2413:
	brgz,a	%l2,	loop_2415
	movge	%icc,	%l3,	%g2
loop_2414:
	addccc	%i6,	0x1203,	%g3
	fmovrdlz	%o4,	%f10,	%f28
loop_2415:
	fandnot1	%f28,	%f12,	%f24
	tcc	%icc,	0x4
	bge,a,pn	%xcc,	loop_2416
	tsubcc	%i7,	0x107E,	%l4
	movre	%l5,	%i4,	%o1
	tneg	%icc,	0x4
loop_2416:
	movrne	%o0,	0x2D4,	%l0
	fbne,a	%fcc2,	loop_2417
	edge32ln	%g4,	%g1,	%g7
	move	%icc,	%o3,	%g6
	edge32n	%g5,	%o5,	%o7
loop_2417:
	array8	%i5,	%o2,	%l6
	set	0x6A, %i4
	stha	%i2,	[%l7 + %i4] 0x04
	set	0x0E, %g2
	ldsha	[%l7 + %g2] 0x80,	%o6
	set	0x58, %o7
	stxa	%i3,	[%l7 + %o7] 0x2b
	membar	#Sync
	tn	%xcc,	0x1
	udivcc	%l1,	0x17FF,	%i1
	movneg	%xcc,	%l2,	%l3
	tne	%xcc,	0x0
	fands	%f9,	%f22,	%f7
	fornot2	%f24,	%f4,	%f16
	smul	%i0,	0x1165,	%i6
	fmovsg	%xcc,	%f27,	%f3
	nop
	set	0x30, %i1
	stx	%g2,	[%l7 + %i1]
	udiv	%o4,	0x088A,	%i7
	fmovrdne	%l4,	%f6,	%f14
	umul	%g3,	%i4,	%l5
	ta	%icc,	0x6
	bl,a,pt	%icc,	loop_2418
	fnot2s	%f18,	%f15
	fba	%fcc3,	loop_2419
	tgu	%icc,	0x5
loop_2418:
	brgez	%o0,	loop_2420
	bpos,pn	%icc,	loop_2421
loop_2419:
	srl	%o1,	0x19,	%g4
	tle	%xcc,	0x3
loop_2420:
	fpsub16	%f0,	%f20,	%f2
loop_2421:
	move	%xcc,	%g1,	%l0
	sll	%g7,	%o3,	%g5
	fmovrslez	%g6,	%f23,	%f15
	tleu	%xcc,	0x2
	andncc	%o5,	%i5,	%o7
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x1F] %asi,	%o2
	tge	%xcc,	0x0
	ta	%xcc,	0x4
	fpsub16	%f2,	%f26,	%f2
	fsrc2s	%f23,	%f26
	fabss	%f23,	%f1
	edge8	%l6,	%i2,	%o6
	tl	%icc,	0x0
	fxnors	%f27,	%f3,	%f15
	tcc	%icc,	0x0
	orncc	%l1,	%i1,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f22,	%f8,	%f10
	tsubcctv	%l2,	%i0,	%l3
	ta	%icc,	0x4
	fpsub32s	%f5,	%f18,	%f6
	movrlez	%g2,	0x2FD,	%i6
	mova	%icc,	%o4,	%l4
	ta	%icc,	0x4
	set	0x68, %o6
	ldxa	[%l7 + %o6] 0x15,	%i7
	tle	%xcc,	0x4
	addc	%g3,	0x1C0F,	%i4
	edge32n	%o0,	%l5,	%o1
	fbue	%fcc1,	loop_2422
	fmovsa	%xcc,	%f3,	%f20
	set	0x28, %l0
	stxa	%g4,	[%g0 + %l0] 0x20
loop_2422:
	fbo	%fcc1,	loop_2423
	nop
	fitos	%f2,	%f28
	andn	%g1,	0x0665,	%g7
	add	%l0,	0x1F86,	%g5
loop_2423:
	ldub	[%l7 + 0x74],	%g6
	edge8ln	%o3,	%o5,	%i5
	fmovdneg	%xcc,	%f9,	%f20
	tle	%xcc,	0x1
	alignaddrl	%o7,	%l6,	%i2
	tne	%icc,	0x1
	tleu	%icc,	0x4
	fbu	%fcc0,	loop_2424
	fxnors	%f13,	%f11,	%f30
	tgu	%icc,	0x0
	edge8	%o2,	%l1,	%i1
loop_2424:
	fmovdcc	%xcc,	%f5,	%f12
	addccc	%i3,	0x18D0,	%l2
	mova	%xcc,	%o6,	%i0
	bn,pn	%icc,	loop_2425
	movvs	%icc,	%l3,	%g2
	movrgz	%i6,	%l4,	%i7
	umulcc	%g3,	%i4,	%o4
loop_2425:
	addcc	%l5,	%o0,	%g4
	nop
	fitod	%f0,	%f8
	tsubcc	%o1,	0x0B17,	%g1
	bl	%icc,	loop_2426
	edge16n	%g7,	%g5,	%g6
	mova	%icc,	%l0,	%o5
	nop
	setx	0xC18CE673,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x80725064,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f17,	%f0
loop_2426:
	movrlz	%o3,	%o7,	%l6
	movg	%xcc,	%i2,	%i5
	nop
	set	0x38, %o2
	std	%f18,	[%l7 + %o2]
	sllx	%o2,	%i1,	%l1
	tvs	%icc,	0x5
	fcmple32	%f14,	%f2,	%i3
	fbue,a	%fcc2,	loop_2427
	array8	%o6,	%i0,	%l3
	array32	%l2,	%g2,	%l4
	movrgz	%i6,	0x354,	%g3
loop_2427:
	movgu	%xcc,	%i4,	%o4
	edge32l	%l5,	%i7,	%g4
	fmovde	%icc,	%f27,	%f19
	stw	%o1,	[%l7 + 0x10]
	edge8l	%o0,	%g1,	%g5
	orn	%g7,	0x124E,	%l0
	set	0x2A, %g7
	lduha	[%l7 + %g7] 0x81,	%g6
	umul	%o5,	%o3,	%l6
	fmovdcc	%xcc,	%f12,	%f21
	bgu,a,pn	%icc,	loop_2428
	movrne	%i2,	%i5,	%o7
	tpos	%icc,	0x4
	fbu,a	%fcc2,	loop_2429
loop_2428:
	fmovsge	%icc,	%f8,	%f8
	fmovrdgez	%o2,	%f16,	%f8
	fmovrdgz	%i1,	%f22,	%f0
loop_2429:
	and	%i3,	0x1556,	%l1
	movvc	%icc,	%i0,	%o6
	umulcc	%l3,	0x0D66,	%l2
	fcmpne16	%f26,	%f10,	%g2
	bcc,pn	%icc,	loop_2430
	movl	%xcc,	%l4,	%g3
	movleu	%xcc,	%i6,	%o4
	pdist	%f6,	%f14,	%f28
loop_2430:
	ble,a	loop_2431
	move	%icc,	%l5,	%i4
	fcmpgt32	%f26,	%f8,	%g4
	srlx	%o1,	%i7,	%o0
loop_2431:
	sub	%g5,	%g1,	%g7
	fzeros	%f15
	fmovda	%xcc,	%f31,	%f26
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g6,	%o5
	ldsw	[%l7 + 0x64],	%l0
	fnands	%f4,	%f10,	%f14
	movvs	%xcc,	%o3,	%l6
	tg	%xcc,	0x7
	edge8n	%i2,	%i5,	%o2
	tleu	%xcc,	0x1
	wr	%g0,	0xe2,	%asi
	stba	%i1,	[%l7 + 0x10] %asi
	membar	#Sync
	mulx	%o7,	0x1D26,	%l1
	umul	%i3,	0x122A,	%o6
	srax	%i0,	%l2,	%l3
	bneg	%icc,	loop_2432
	popc	0x157B,	%l4
	orcc	%g3,	0x10A6,	%i6
	movle	%xcc,	%g2,	%o4
loop_2432:
	sdiv	%l5,	0x1EF9,	%g4
	stbar
	tgu	%icc,	0x2
	fbue	%fcc2,	loop_2433
	tcc	%xcc,	0x0
	fmovdne	%xcc,	%f24,	%f0
	edge8ln	%o1,	%i7,	%o0
loop_2433:
	fornot2	%f30,	%f12,	%f20
	xnor	%g5,	%g1,	%i4
	sdivcc	%g6,	0x1E12,	%g7
	ldd	[%l7 + 0x30],	%o4
	faligndata	%f12,	%f18,	%f14
	movg	%icc,	%o3,	%l0
	fblg	%fcc2,	loop_2434
	taddcc	%i2,	0x1352,	%i5
	movcc	%icc,	%l6,	%o2
	orncc	%i1,	0x0608,	%l1
loop_2434:
	fornot1	%f24,	%f6,	%f18
	movrlz	%o7,	0x0F5,	%o6
	tvc	%xcc,	0x5
	lduw	[%l7 + 0x2C],	%i0
	array16	%l2,	%i3,	%l3
	umulcc	%l4,	%i6,	%g2
	tg	%icc,	0x2
	mova	%icc,	%o4,	%l5
	brlz	%g3,	loop_2435
	fnegs	%f25,	%f2
	flush	%l7 + 0x14
	fsrc2	%f8,	%f30
loop_2435:
	edge32ln	%o1,	%g4,	%o0
	srlx	%i7,	0x03,	%g5
	movgu	%icc,	%i4,	%g6
	popc	0x0E5B,	%g7
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x4C] %asi,	%f8
	fpsub16s	%f12,	%f2,	%f27
	fzero	%f0
	fmovscc	%xcc,	%f27,	%f18
	umul	%o5,	%o3,	%g1
	tpos	%icc,	0x3
	tn	%xcc,	0x0
	edge32n	%l0,	%i5,	%l6
	xnor	%o2,	%i2,	%l1
	movrlz	%i1,	0x26D,	%o7
	tneg	%icc,	0x1
	movneg	%icc,	%o6,	%l2
	edge8l	%i0,	%i3,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x34],	%f7
	nop
	set	0x58, %g3
	stx	%i6,	[%l7 + %g3]
	nop
	setx	0x8544E9ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x8B08912A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f14,	%f27
	movne	%icc,	%l3,	%o4
	set	0x6C, %l4
	ldswa	[%l7 + %l4] 0x89,	%l5
	mulx	%g3,	0x0825,	%o1
	fba,a	%fcc0,	loop_2436
	bcs	%xcc,	loop_2437
	fble	%fcc2,	loop_2438
	bge,a,pn	%xcc,	loop_2439
loop_2436:
	membar	0x79
loop_2437:
	sdivx	%g4,	0x02D2,	%g2
loop_2438:
	bpos,a,pt	%icc,	loop_2440
loop_2439:
	tvs	%icc,	0x1
	fmovdneg	%xcc,	%f9,	%f6
	fba,a	%fcc1,	loop_2441
loop_2440:
	tne	%icc,	0x0
	nop
	fitos	%f10,	%f30
	fstox	%f30,	%f20
	fones	%f12
loop_2441:
	sra	%i7,	%g5,	%o0
	fbn,a	%fcc0,	loop_2442
	fmovd	%f12,	%f24
	umulcc	%g6,	%g7,	%o5
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x64] %asi,	%i4
loop_2442:
	movvc	%xcc,	%o3,	%g1
	movl	%icc,	%i5,	%l0
	edge16ln	%o2,	%l6,	%l1
	ldsb	[%l7 + 0x0B],	%i2
	bvs	loop_2443
	movrgz	%o7,	%o6,	%i1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%l2
loop_2443:
	smulcc	%i0,	%l4,	%i3
	wr	%g0,	0x80,	%asi
	stba	%l3,	[%l7 + 0x1F] %asi
	orncc	%o4,	%l5,	%i6
	add	%g3,	0x089D,	%g4
	tleu	%xcc,	0x4
	movrne	%g2,	%i7,	%o1
	nop
	fitos	%f9,	%f17
	fstox	%f17,	%f8
	fxtos	%f8,	%f13
	fornot1	%f4,	%f30,	%f14
	tpos	%icc,	0x7
	movge	%icc,	%o0,	%g6
	set	0x68, %i6
	stba	%g7,	[%l7 + %i6] 0x18
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xe2,	%o4
	sub	%i4,	0x022D,	%g5
	fandnot1s	%f13,	%f13,	%f16
	fnot2s	%f27,	%f14
	te	%xcc,	0x3
	nop
	setx	loop_2444,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umul	%g1,	0x1A78,	%o3
	andcc	%i5,	%l0,	%l6
	edge32	%l1,	%o2,	%o7
loop_2444:
	andn	%o6,	0x0959,	%i2
	tcc	%xcc,	0x5
	brgez	%l2,	loop_2445
	sir	0x0FC1
	edge32n	%i0,	%l4,	%i3
	movn	%icc,	%i1,	%o4
loop_2445:
	movn	%xcc,	%l3,	%i6
	sra	%g3,	%l5,	%g4
	xnorcc	%g2,	%o1,	%i7
	udiv	%g6,	0x1776,	%o0
	array32	%g7,	%i4,	%g5
	pdist	%f22,	%f6,	%f30
	fble	%fcc2,	loop_2446
	bl,pt	%xcc,	loop_2447
	alignaddrl	%g1,	%o5,	%i5
	fnors	%f23,	%f28,	%f5
loop_2446:
	mulx	%o3,	%l6,	%l0
loop_2447:
	fmuld8ulx16	%f12,	%f14,	%f18
	std	%f20,	[%l7 + 0x20]
	xor	%o2,	0x194E,	%o7
	set	0x0C, %l3
	lduha	[%l7 + %l3] 0x89,	%o6
	fandnot1s	%f0,	%f18,	%f26
	movge	%icc,	%i2,	%l2
	srax	%l1,	%i0,	%l4
	fmovda	%xcc,	%f9,	%f15
	ldub	[%l7 + 0x78],	%i1
	fbue	%fcc0,	loop_2448
	movgu	%icc,	%i3,	%o4
	udiv	%i6,	0x1489,	%l3
	srl	%l5,	%g3,	%g2
loop_2448:
	edge8	%o1,	%i7,	%g4
	tleu	%icc,	0x3
	srlx	%o0,	%g6,	%g7
	set	0x08, %g1
	ldswa	[%l7 + %g1] 0x11,	%i4
	brnz,a	%g1,	loop_2449
	bpos,a,pn	%xcc,	loop_2450
	orcc	%o5,	0x1BC0,	%i5
	taddcctv	%g5,	0x1738,	%l6
loop_2449:
	fbge	%fcc1,	loop_2451
loop_2450:
	fbn,a	%fcc2,	loop_2452
	stx	%l0,	[%l7 + 0x40]
	udiv	%o3,	0x0288,	%o7
loop_2451:
	nop
	set	0x6C, %l5
	stwa	%o2,	[%l7 + %l5] 0xe3
	membar	#Sync
loop_2452:
	fmovde	%xcc,	%f8,	%f21
	fmovse	%icc,	%f5,	%f1
	fmovs	%f20,	%f15
	fmovdneg	%icc,	%f9,	%f15
	tl	%icc,	0x5
	bcs	loop_2453
	edge32n	%i2,	%l2,	%o6
	fbul	%fcc3,	loop_2454
	stx	%l1,	[%l7 + 0x30]
loop_2453:
	fmul8x16au	%f14,	%f29,	%f24
	smul	%i0,	%l4,	%i1
loop_2454:
	call	loop_2455
	umul	%o4,	0x0E02,	%i3
	fmovsvc	%icc,	%f8,	%f27
	udivcc	%i6,	0x1D4F,	%l3
loop_2455:
	edge32	%l5,	%g2,	%o1
	addcc	%i7,	%g3,	%g4
	andncc	%g6,	%o0,	%i4
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f14
	fxtod	%f14,	%f30
	array8	%g1,	%o5,	%i5
	nop
	fitos	%f13,	%f6
	fstoi	%f6,	%f21
	addcc	%g7,	0x129A,	%l6
	udiv	%g5,	0x1138,	%o3
	fzeros	%f4
	movrne	%o7,	%o2,	%l0
	ldd	[%l7 + 0x38],	%i2
	movleu	%icc,	%o6,	%l1
	movgu	%xcc,	%i0,	%l4
	andcc	%l2,	%i1,	%o4
	fbule,a	%fcc3,	loop_2456
	nop
	fitos	%f8,	%f7
	fstoi	%f7,	%f13
	add	%i6,	%l3,	%i3
	tgu	%icc,	0x5
loop_2456:
	be	%xcc,	loop_2457
	tneg	%xcc,	0x6
	sethi	0x1081,	%g2
	nop
	fitod	%f12,	%f8
	fdtoi	%f8,	%f11
loop_2457:
	fmovdcc	%icc,	%f29,	%f20
	fnand	%f12,	%f12,	%f10
	wr	%g0,	0x10,	%asi
	sta	%f9,	[%l7 + 0x7C] %asi
	flush	%l7 + 0x58
	movrlz	%o1,	0x2AD,	%i7
	prefetch	[%l7 + 0x64],	 0x1
	fble	%fcc1,	loop_2458
	fmovsl	%icc,	%f10,	%f2
	edge8n	%g3,	%l5,	%g6
	and	%o0,	%i4,	%g1
loop_2458:
	movcs	%xcc,	%g4,	%i5
	fmovsvs	%xcc,	%f9,	%f26
	fmul8ulx16	%f4,	%f14,	%f22
	tg	%xcc,	0x1
	alignaddrl	%o5,	%g7,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o3
	wr	%g0,	0xeb,	%asi
	stba	%g5,	[%l7 + 0x24] %asi
	membar	#Sync
	fzero	%f6
	alignaddrl	%o2,	%o7,	%i2
	fmovd	%f10,	%f24
	movn	%xcc,	%o6,	%l0
	move	%icc,	%l1,	%i0
	edge16l	%l2,	%l4,	%i1
	move	%xcc,	%o4,	%l3
	xor	%i3,	%i6,	%g2
	edge8n	%o1,	%i7,	%g3
	fmovsl	%xcc,	%f24,	%f28
	bn,a,pn	%icc,	loop_2459
	tle	%xcc,	0x7
	smul	%l5,	0x08B3,	%o0
	movrgz	%i4,	%g6,	%g1
loop_2459:
	bcc,pt	%icc,	loop_2460
	fmovrdgz	%i5,	%f16,	%f30
	bshuffle	%f0,	%f26,	%f20
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x08] %asi,	%g4
loop_2460:
	nop
	set	0x24, %o5
	ldsha	[%l7 + %o5] 0x88,	%g7
	ta	%xcc,	0x1
	smulcc	%o5,	0x0314,	%o3
	subcc	%g5,	%l6,	%o2
	nop
	setx	loop_2461,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	membar	0x30
	movvc	%xcc,	%o7,	%i2
	edge32ln	%o6,	%l0,	%l1
loop_2461:
	call	loop_2462
	fbn	%fcc1,	loop_2463
	array16	%i0,	%l4,	%i1
	movgu	%icc,	%o4,	%l2
loop_2462:
	edge16l	%l3,	%i3,	%i6
loop_2463:
	udiv	%o1,	0x1865,	%g2
	udivx	%i7,	0x1F0E,	%g3
	movrne	%o0,	%i4,	%l5
	fble,a	%fcc0,	loop_2464
	bvc,a	%xcc,	loop_2465
	movn	%xcc,	%g6,	%g1
	orn	%g4,	0x1D03,	%g7
loop_2464:
	sub	%i5,	%o3,	%g5
loop_2465:
	xnor	%l6,	%o5,	%o7
	tl	%icc,	0x7
	fmovsgu	%icc,	%f30,	%f24
	bshuffle	%f4,	%f30,	%f8
	fmovda	%xcc,	%f30,	%f0
	wr	%g0,	0x22,	%asi
	stha	%i2,	[%l7 + 0x46] %asi
	membar	#Sync
	prefetch	[%l7 + 0x0C],	 0x1
	tg	%xcc,	0x5
	mulscc	%o2,	%l0,	%l1
	mova	%icc,	%i0,	%o6
	mova	%xcc,	%i1,	%o4
	movcs	%icc,	%l2,	%l4
	mulscc	%l3,	%i6,	%o1
	tne	%icc,	0x5
	fmovsneg	%icc,	%f25,	%f27
	set	0x24, %o3
	sta	%f8,	[%l7 + %o3] 0x04
	movn	%icc,	%i3,	%i7
	fcmple32	%f22,	%f4,	%g2
	fbo,a	%fcc0,	loop_2466
	fbne	%fcc3,	loop_2467
	subc	%g3,	0x11ED,	%o0
	fzero	%f14
loop_2466:
	edge32l	%l5,	%i4,	%g6
loop_2467:
	sdivcc	%g1,	0x00CA,	%g7
	subcc	%i5,	0x192B,	%g4
	movgu	%icc,	%o3,	%l6
	xnor	%g5,	0x10D5,	%o5
	tvs	%icc,	0x2
	tg	%xcc,	0x6
	nop
	setx	0x22BD52C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x157AA5F5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f21,	%f25
	ldsb	[%l7 + 0x1E],	%i2
	fone	%f18
	edge32l	%o2,	%l0,	%o7
	srlx	%i0,	0x0D,	%l1
	fornot2	%f26,	%f4,	%f4
	movrne	%o6,	0x02D,	%i1
	ldub	[%l7 + 0x79],	%o4
	bpos,a,pt	%xcc,	loop_2468
	ba,a,pn	%icc,	loop_2469
	movrgez	%l4,	%l3,	%i6
	movgu	%icc,	%l2,	%i3
loop_2468:
	fbn,a	%fcc0,	loop_2470
loop_2469:
	sll	%i7,	%g2,	%o1
	nop
	setx	0xE8E654FF0ED225DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f6
	bcc,a,pn	%xcc,	loop_2471
loop_2470:
	bn,pn	%icc,	loop_2472
	edge16l	%g3,	%l5,	%i4
	movcs	%icc,	%o0,	%g1
loop_2471:
	movn	%xcc,	%g7,	%g6
loop_2472:
	lduh	[%l7 + 0x30],	%i5
	fmovdge	%icc,	%f3,	%f5
	be	%icc,	loop_2473
	tl	%icc,	0x3
	taddcctv	%o3,	0x162D,	%l6
	tpos	%xcc,	0x3
loop_2473:
	edge16n	%g5,	%g4,	%i2
	srlx	%o2,	%l0,	%o7
	fmovscc	%xcc,	%f31,	%f23
	nop
	fitos	%f10,	%f8
	fstox	%f8,	%f14
	movn	%xcc,	%o5,	%i0
	tge	%xcc,	0x5
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x7C] %asi,	%o6
	andncc	%l1,	%o4,	%l4
	movpos	%xcc,	%i1,	%i6
	edge32ln	%l3,	%i3,	%l2
	edge16	%i7,	%g2,	%g3
	ldx	[%l7 + 0x70],	%o1
	srl	%l5,	%o0,	%g1
	movleu	%icc,	%g7,	%g6
	andncc	%i4,	%o3,	%l6
	fmovrsne	%i5,	%f3,	%f5
	fmovrsgez	%g4,	%f11,	%f28
	bn,pt	%xcc,	loop_2474
	fpadd32	%f16,	%f14,	%f24
	fcmpeq32	%f16,	%f26,	%g5
	umulcc	%o2,	0x0BA8,	%i2
loop_2474:
	bvc,a,pn	%icc,	loop_2475
	tvc	%xcc,	0x6
	sra	%o7,	0x1A,	%o5
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x04,	%f0
loop_2475:
	movle	%xcc,	%i0,	%l0
	addc	%l1,	%o6,	%o4
	nop
	setx	0x63B9BB11,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xDA2B13BE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f27,	%f31
	umul	%l4,	%i1,	%i6
	edge16ln	%i3,	%l3,	%l2
	fmovdn	%xcc,	%f30,	%f26
	tvc	%xcc,	0x3
	move	%xcc,	%g2,	%g3
	add	%o1,	%i7,	%l5
	smulcc	%o0,	%g1,	%g6
	tg	%icc,	0x7
	edge8n	%g7,	%i4,	%l6
	tpos	%xcc,	0x0
	fmovdcs	%xcc,	%f24,	%f22
	fbul,a	%fcc1,	loop_2476
	fnor	%f10,	%f6,	%f8
	fandnot1s	%f8,	%f2,	%f7
	andncc	%i5,	%o3,	%g5
loop_2476:
	nop
	set	0x58, %i0
	prefetcha	[%l7 + %i0] 0x88,	 0x1
	srl	%g4,	0x18,	%o7
	fpsub32s	%f8,	%f12,	%f10
	fmovrsne	%i2,	%f22,	%f17
	membar	0x26
	sllx	%i0,	0x15,	%o5
	fand	%f12,	%f20,	%f28
	move	%xcc,	%l0,	%l1
	mulx	%o4,	%o6,	%l4
	ld	[%l7 + 0x40],	%f16
	nop
	set	0x10, %i5
	std	%f28,	[%l7 + %i5]
	movre	%i6,	%i3,	%l3
	ble,a,pt	%xcc,	loop_2477
	fmovsa	%icc,	%f17,	%f13
	fblg,a	%fcc3,	loop_2478
	ta	%xcc,	0x7
loop_2477:
	subcc	%l2,	%i1,	%g2
	ldsw	[%l7 + 0x10],	%o1
loop_2478:
	nop
	set	0x44, %l6
	lda	[%l7 + %l6] 0x0c,	%f15
	fone	%f6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%g3
	tleu	%icc,	0x6
	tgu	%icc,	0x1
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x34] %asi,	%i7
	bcc,a,pn	%icc,	loop_2479
	xorcc	%l5,	0x00C5,	%g1
	movrne	%o0,	%g6,	%g7
	edge16l	%i4,	%l6,	%i5
loop_2479:
	ldstub	[%l7 + 0x10],	%o3
	xnorcc	%o2,	%g4,	%o7
	srl	%i2,	0x04,	%g5
	fmovrslz	%i0,	%f28,	%f14
	tvs	%icc,	0x0
	edge8n	%l0,	%l1,	%o5
	udivx	%o6,	0x1292,	%o4
	movre	%l4,	0x304,	%i6
	ba,a,pt	%xcc,	loop_2480
	bgu	loop_2481
	fbo	%fcc0,	loop_2482
	fands	%f11,	%f12,	%f28
loop_2480:
	smul	%l3,	%l2,	%i3
loop_2481:
	mulx	%i1,	%g2,	%o1
loop_2482:
	fands	%f22,	%f29,	%f9
	edge32ln	%g3,	%i7,	%l5
	fcmpne16	%f12,	%f14,	%g1
	alignaddrl	%g6,	%o0,	%i4
	fcmpne16	%f12,	%f2,	%g7
	edge16ln	%l6,	%o3,	%o2
	edge8n	%g4,	%i5,	%o7
	mova	%xcc,	%g5,	%i0
	edge32ln	%i2,	%l1,	%l0
	fbu,a	%fcc3,	loop_2483
	fbule	%fcc0,	loop_2484
	tvs	%icc,	0x3
	fbue,a	%fcc2,	loop_2485
loop_2483:
	bvc	%icc,	loop_2486
loop_2484:
	fba	%fcc3,	loop_2487
	smulcc	%o5,	%o4,	%o6
loop_2485:
	movcs	%icc,	%l4,	%i6
loop_2486:
	srl	%l2,	%l3,	%i3
loop_2487:
	std	%f24,	[%l7 + 0x38]
	fpadd16	%f18,	%f28,	%f14
	edge16l	%i1,	%o1,	%g3
	call	loop_2488
	fcmple32	%f14,	%f10,	%g2
	xor	%l5,	%i7,	%g1
	movvs	%xcc,	%g6,	%o0
loop_2488:
	fone	%f10
	brz,a	%g7,	loop_2489
	ta	%xcc,	0x4
	sdivcc	%l6,	0x158C,	%i4
	tl	%xcc,	0x7
loop_2489:
	fexpand	%f1,	%f6
	edge32	%o3,	%o2,	%i5
	bpos,a,pn	%xcc,	loop_2490
	umulcc	%g4,	0x1C37,	%g5
	andn	%o7,	%i2,	%l1
	srlx	%i0,	0x02,	%o5
loop_2490:
	nop
	fitos	%f5,	%f23
	fstox	%f23,	%f18
	fxtos	%f18,	%f24
	orcc	%l0,	0x134E,	%o4
	ld	[%l7 + 0x24],	%f30
	fmovdcs	%xcc,	%f23,	%f27
	popc	%o6,	%i6
	fnor	%f14,	%f24,	%f30
	sdiv	%l4,	0x0F44,	%l3
	movrlz	%l2,	0x238,	%i1
	edge32ln	%o1,	%g3,	%i3
	tsubcc	%g2,	%l5,	%i7
	umul	%g6,	%g1,	%o0
	udivx	%g7,	0x1A12,	%l6
	brnz,a	%o3,	loop_2491
	ldd	[%l7 + 0x78],	%f24
	fmovsl	%icc,	%f11,	%f4
	movvs	%icc,	%o2,	%i5
loop_2491:
	be	%xcc,	loop_2492
	andn	%g4,	%i4,	%g5
	fnot2	%f2,	%f4
	addc	%i2,	0x1D67,	%o7
loop_2492:
	bgu	loop_2493
	movgu	%xcc,	%l1,	%o5
	fpadd32s	%f12,	%f15,	%f3
	sll	%i0,	%l0,	%o4
loop_2493:
	nop
	set	0x32, %i2
	ldstuba	[%l7 + %i2] 0x81,	%i6
	smul	%l4,	%l3,	%o6
	movle	%xcc,	%i1,	%o1
	fmovrse	%g3,	%f18,	%f22
	fmovrdgez	%i3,	%f22,	%f30
	nop
	setx	0x33EDDAAF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x7F16F89B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f16,	%f18
	lduw	[%l7 + 0x78],	%g2
	fcmpne16	%f6,	%f24,	%l2
	sdivcc	%i7,	0x0EC1,	%g6
	fxor	%f2,	%f18,	%f18
	xorcc	%g1,	%o0,	%l5
	movl	%icc,	%l6,	%g7
	sir	0x1524
	sdivcc	%o2,	0x1ED2,	%i5
	sll	%o3,	0x14,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g5,	%i2,	%g4
	fpsub32	%f8,	%f24,	%f14
	sdivcc	%o7,	0x0513,	%l1
	srlx	%o5,	%i0,	%o4
	xnorcc	%i6,	%l4,	%l3
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x4F] %asi,	%o6
	subcc	%l0,	0x05D2,	%i1
	bleu,a	%icc,	loop_2494
	srl	%o1,	0x1A,	%g3
	tcc	%xcc,	0x0
	nop
	setx	0x35BD2426F2C84FF4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xF5112A99EF0BBEEE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f10,	%f6
loop_2494:
	fmovda	%xcc,	%f14,	%f20
	for	%f26,	%f22,	%f12
	set	0x28, %g6
	ldsba	[%l7 + %g6] 0x81,	%i3
	bl,a	loop_2495
	fble	%fcc3,	loop_2496
	ta	%xcc,	0x5
	ldstub	[%l7 + 0x10],	%g2
loop_2495:
	fandnot1	%f10,	%f4,	%f4
loop_2496:
	srl	%i7,	%g6,	%g1
	nop
	setx	0xA4660D3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x6D1F1443,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f28,	%f4
	fmovsge	%icc,	%f12,	%f25
	xnor	%o0,	%l5,	%l2
	set	0x18, %o1
	ldswa	[%l7 + %o1] 0x81,	%g7
	alignaddr	%o2,	%i5,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x54],	%i4
	bl,a	%xcc,	loop_2497
	movrlez	%o3,	%g5,	%g4
	nop
	setx	0xAE0FBFFE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x57556EFF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f27,	%f4
	edge16l	%i2,	%o7,	%l1
loop_2497:
	fcmple32	%f0,	%f24,	%i0
	nop
	set	0x3C, %l2
	prefetch	[%l7 + %l2],	 0x0
	fands	%f7,	%f19,	%f18
	edge16ln	%o4,	%i6,	%o5
	prefetch	[%l7 + 0x68],	 0x1
	fbue	%fcc3,	loop_2498
	nop
	setx	0xA3F9446D0A11C521,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x4364D7CE28F25A75,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f12,	%f0
	addccc	%l3,	%o6,	%l4
	set	0x5A, %o4
	lduha	[%l7 + %o4] 0x04,	%l0
loop_2498:
	sra	%i1,	%o1,	%i3
	edge8ln	%g3,	%i7,	%g2
	orn	%g6,	%o0,	%l5
	edge8	%l2,	%g1,	%o2
	movgu	%xcc,	%g7,	%l6
	fmovscc	%icc,	%f11,	%f14
	umul	%i4,	%i5,	%g5
	edge32	%g4,	%o3,	%i2
	edge8	%o7,	%l1,	%i0
	ldd	[%l7 + 0x18],	%f2
	taddcc	%o4,	0x1DF7,	%i6
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x4E] %asi,	%l3
	fble,a	%fcc1,	loop_2499
	fbo,a	%fcc3,	loop_2500
	sll	%o5,	%o6,	%l0
	edge8n	%l4,	%o1,	%i3
loop_2499:
	add	%g3,	%i1,	%i7
loop_2500:
	nop
	fitos	%f4,	%f13
	fstox	%f13,	%f14
	smulcc	%g2,	%o0,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc0,	loop_2501
	sllx	%l2,	0x0D,	%l5
	fmovrsgez	%o2,	%f29,	%f1
	ble,pt	%icc,	loop_2502
loop_2501:
	bg,pn	%icc,	loop_2503
	edge16ln	%g7,	%g1,	%i4
	andncc	%i5,	%g5,	%l6
loop_2502:
	sll	%g4,	0x10,	%i2
loop_2503:
	nop
	setx	loop_2504,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	prefetch	[%l7 + 0x64],	 0x0
	movcs	%icc,	%o3,	%l1
	fbule,a	%fcc0,	loop_2505
loop_2504:
	te	%icc,	0x2
	sub	%o7,	%o4,	%i0
	popc	0x0219,	%l3
loop_2505:
	fandnot2s	%f9,	%f22,	%f1
	fnor	%f14,	%f24,	%f6
	addc	%o5,	%o6,	%i6
	ta	%icc,	0x2
	nop
	fitos	%f8,	%f13
	fstox	%f13,	%f30
	fxtos	%f30,	%f21
	fmul8x16au	%f12,	%f7,	%f0
	xor	%l0,	%o1,	%l4
	tvs	%xcc,	0x3
	fabss	%f10,	%f4
	set	0x220, %o0
	ldxa	[%g0 + %o0] 0x52,	%g3
	faligndata	%f14,	%f10,	%f22
	mulx	%i1,	0x0857,	%i7
	stw	%i3,	[%l7 + 0x48]
	alignaddrl	%o0,	%g2,	%g6
	nop
	setx loop_2506, %l0, %l1
	jmpl %l1, %l2
	fmovdcc	%xcc,	%f25,	%f8
	bge,a	loop_2507
	movg	%icc,	%l5,	%o2
loop_2506:
	tvc	%xcc,	0x3
	popc	0x0B11,	%g7
loop_2507:
	xnor	%g1,	0x19D5,	%i4
	umulcc	%g5,	0x1EBD,	%l6
	fpsub32	%f22,	%f6,	%f14
	tvs	%icc,	0x5
	mova	%xcc,	%g4,	%i5
	sir	0x0CFC
	andcc	%i2,	0x1045,	%l1
	fmovrdgez	%o3,	%f2,	%f16
	fbul,a	%fcc0,	loop_2508
	ta	%xcc,	0x3
	nop
	setx	0x52553C33A69A77ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x119B3DBA66467262,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f28,	%f12
	fands	%f25,	%f23,	%f4
loop_2508:
	udivcc	%o4,	0x17D2,	%i0
	srlx	%l3,	0x09,	%o7
	array8	%o5,	%i6,	%o6
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x60] %asi,	%l0
	tg	%icc,	0x6
	edge32l	%o1,	%l4,	%i1
	add	%i7,	%i3,	%g3
	ldstub	[%l7 + 0x2D],	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f4,	%f28,	%f12
	ldstub	[%l7 + 0x7E],	%o0
	set	0x0A, %g4
	stha	%l2,	[%l7 + %g4] 0xe2
	membar	#Sync
	movle	%xcc,	%l5,	%o2
	fmul8x16au	%f19,	%f25,	%f6
	udiv	%g7,	0x1EE2,	%g1
	fmovscs	%xcc,	%f31,	%f24
	nop
	setx	0x2707250888942775,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x5DFF695739D58361,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f16,	%f10
	brnz,a	%g6,	loop_2509
	array8	%i4,	%g5,	%l6
	nop
	setx	0x5DF474B7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x609FBB30,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f1,	%f19
	nop
	fitos	%f31,	%f31
loop_2509:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x70] %asi,	%i5
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x48] %asi,	%i2
	nop
	setx	0x84363ACD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x5362AB31,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f27,	%f0
	edge16n	%l1,	%g4,	%o4
	fbge,a	%fcc3,	loop_2510
	xor	%i0,	0x0A66,	%o3
	alignaddrl	%o7,	%o5,	%i6
	tg	%icc,	0x1
loop_2510:
	sdivcc	%o6,	0x1CF1,	%l3
	tle	%icc,	0x4
	fpmerge	%f18,	%f0,	%f28
	movleu	%icc,	%l0,	%l4
	fmul8sux16	%f18,	%f20,	%f8
	ba,a	loop_2511
	stbar
	set	0x18, %i7
	ldsha	[%l7 + %i7] 0x18,	%i1
loop_2511:
	fpsub32s	%f22,	%f18,	%f15
	bge	%icc,	loop_2512
	sdiv	%o1,	0x03B2,	%i7
	sdivx	%g3,	0x0293,	%i3
	fsrc2	%f24,	%f26
loop_2512:
	subcc	%g2,	%o0,	%l5
	xnor	%o2,	0x0D99,	%g7
	movcs	%xcc,	%l2,	%g6
	bne,pn	%icc,	loop_2513
	taddcc	%i4,	%g5,	%l6
	umul	%i5,	0x0B63,	%i2
	tl	%icc,	0x2
loop_2513:
	bvs,a,pt	%icc,	loop_2514
	movle	%xcc,	%g1,	%g4
	brz	%l1,	loop_2515
	sub	%o4,	0x0FB1,	%i0
loop_2514:
	subc	%o3,	0x1AC7,	%o7
	srax	%i6,	%o6,	%o5
loop_2515:
	brlz,a	%l3,	loop_2516
	movvc	%icc,	%l4,	%l0
	udivcc	%o1,	0x1329,	%i1
	edge16n	%i7,	%g3,	%i3
loop_2516:
	nop
	setx	0x705D2485,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	movneg	%xcc,	%o0,	%l5
	bvs	%xcc,	loop_2517
	tle	%xcc,	0x3
	movg	%icc,	%o2,	%g2
	movrne	%g7,	0x1ED,	%l2
loop_2517:
	movrlz	%i4,	%g5,	%l6
	be,a	%icc,	loop_2518
	addc	%i5,	%g6,	%g1
	brlz,a	%g4,	loop_2519
	tneg	%icc,	0x1
loop_2518:
	fbul,a	%fcc3,	loop_2520
	sir	0x04E1
loop_2519:
	srl	%i2,	0x15,	%l1
	fxnors	%f28,	%f27,	%f25
loop_2520:
	sub	%o4,	%i0,	%o3
	edge16l	%i6,	%o6,	%o7
	tvs	%icc,	0x5
	fornot2	%f18,	%f26,	%f2
	tn	%icc,	0x2
	movvc	%icc,	%o5,	%l3
	set	0x54, %i4
	ldswa	[%l7 + %i4] 0x19,	%l4
	movleu	%icc,	%o1,	%l0
	movl	%xcc,	%i7,	%i1
	te	%icc,	0x3
	set	0x6A, %l1
	ldsba	[%l7 + %l1] 0x80,	%g3
	mulscc	%o0,	0x1C65,	%l5
	fors	%f29,	%f7,	%f18
	brgz,a	%i3,	loop_2521
	xorcc	%o2,	%g7,	%g2
	fnegd	%f22,	%f0
	edge32	%l2,	%i4,	%g5
loop_2521:
	nop
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%g6
	fmul8sux16	%f4,	%f8,	%f28
	movrgez	%l6,	%g4,	%i2
	movne	%icc,	%g1,	%o4
	set	0x60, %o7
	prefetcha	[%l7 + %o7] 0x88,	 0x0
	subccc	%i0,	%i6,	%o3
	fmovsl	%xcc,	%f24,	%f28
	udivx	%o6,	0x17DE,	%o5
	set	0x4E, %g2
	ldsha	[%l7 + %g2] 0x15,	%o7
	mulscc	%l4,	0x04B7,	%l3
	edge8ln	%l0,	%i7,	%o1
	fmovsn	%xcc,	%f22,	%f25
	fbule	%fcc1,	loop_2522
	sllx	%i1,	0x15,	%o0
	sllx	%g3,	%l5,	%o2
	wr	%g0,	0x0c,	%asi
	stha	%g7,	[%l7 + 0x14] %asi
loop_2522:
	fbo	%fcc3,	loop_2523
	umul	%i3,	%l2,	%i4
	set	0x28, %i1
	ldxa	[%l7 + %i1] 0x88,	%g2
loop_2523:
	flush	%l7 + 0x20
	tne	%xcc,	0x1
	srax	%i5,	0x0B,	%g6
	edge32n	%g5,	%g4,	%i2
	sdiv	%l6,	0x1A15,	%o4
	tl	%icc,	0x2
	fbo,a	%fcc0,	loop_2524
	add	%g1,	0x0978,	%i0
	brlez,a	%i6,	loop_2525
	srax	%o3,	0x19,	%o6
loop_2524:
	tcc	%icc,	0x0
	fmovrdlz	%l1,	%f14,	%f6
loop_2525:
	lduw	[%l7 + 0x4C],	%o5
	movrgez	%o7,	0x0E9,	%l3
	bleu,a,pt	%xcc,	loop_2526
	nop
	setx	0x2B9F4600F3960FEE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xE38F3789A745A2C6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f0,	%f20
	edge32l	%l0,	%l4,	%o1
	popc	0x0E7B,	%i7
loop_2526:
	fbne,a	%fcc1,	loop_2527
	fmovrslz	%o0,	%f5,	%f18
	ldsw	[%l7 + 0x60],	%i1
	and	%g3,	0x06FF,	%o2
loop_2527:
	movpos	%icc,	%g7,	%l5
	udiv	%l2,	0x0A60,	%i3
	edge8n	%i4,	%i5,	%g6
	ldd	[%l7 + 0x38],	%f0
	sllx	%g2,	%g4,	%g5
	tneg	%xcc,	0x3
	fmovsl	%icc,	%f4,	%f7
	movvs	%icc,	%i2,	%o4
	movleu	%icc,	%l6,	%g1
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%i0
	edge16l	%i6,	%o3,	%o6
	srlx	%l1,	0x12,	%o7
	smul	%o5,	%l0,	%l3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x14] %asi,	%o1
	ldsb	[%l7 + 0x60],	%i7
	sdivcc	%o0,	0x0F9E,	%l4
	umulcc	%g3,	0x0C03,	%o2
	movre	%i1,	%g7,	%l5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x63] %asi,	%l2
	tle	%xcc,	0x6
	srax	%i4,	%i5,	%i3
	movgu	%xcc,	%g2,	%g4
	set	0x2C, %o6
	sta	%f20,	[%l7 + %o6] 0x81
	addc	%g5,	0x02AB,	%i2
	xorcc	%o4,	%g6,	%l6
	fbo,a	%fcc0,	loop_2528
	tvc	%icc,	0x6
	fornot1	%f20,	%f14,	%f16
	tleu	%icc,	0x4
loop_2528:
	andcc	%g1,	0x1D1E,	%i6
	tvc	%xcc,	0x3
	movcs	%icc,	%o3,	%o6
	movre	%i0,	0x2E5,	%o7
	fmovda	%xcc,	%f1,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul,a	%fcc3,	loop_2529
	bl	loop_2530
	fmovrse	%l1,	%f14,	%f17
	ld	[%l7 + 0x2C],	%f30
loop_2529:
	bcc	%xcc,	loop_2531
loop_2530:
	fbuge	%fcc0,	loop_2532
	add	%l0,	0x1C96,	%o5
	fmovdleu	%icc,	%f8,	%f25
loop_2531:
	orn	%o1,	0x013D,	%l3
loop_2532:
	umulcc	%o0,	%i7,	%l4
	andn	%o2,	0x0905,	%i1
	movn	%xcc,	%g3,	%l5
	tsubcctv	%g7,	%l2,	%i4
	movrgz	%i5,	0x098,	%i3
	sll	%g2,	0x0B,	%g4
	xor	%i2,	%o4,	%g6
	xor	%g5,	%l6,	%i6
	bcc	%icc,	loop_2533
	tvs	%icc,	0x3
	smul	%g1,	%o6,	%i0
	sll	%o7,	0x1E,	%o3
loop_2533:
	edge8n	%l1,	%o5,	%l0
	fmovdg	%xcc,	%f18,	%f6
	fandnot2s	%f9,	%f30,	%f4
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x10
	movleu	%xcc,	%o1,	%l3
	fmul8x16al	%f24,	%f13,	%f8
	ldsh	[%l7 + 0x58],	%o0
	ba,a	loop_2534
	sdivx	%i7,	0x0C5D,	%l4
	nop
	fitod	%f1,	%f4
	movvc	%xcc,	%i1,	%g3
loop_2534:
	addcc	%l5,	0x1C40,	%o2
	movcc	%xcc,	%g7,	%i4
	movneg	%icc,	%l2,	%i5
	fmul8x16	%f18,	%f18,	%f0
	addc	%g2,	0x1DD4,	%i3
	addc	%i2,	0x17A0,	%g4
	addcc	%g6,	0x0F99,	%o4
	fandnot1	%f16,	%f4,	%f16
	tvs	%icc,	0x2
	fmovdleu	%icc,	%f15,	%f7
	fblg,a	%fcc1,	loop_2535
	smulcc	%g5,	%l6,	%g1
	andn	%i6,	0x119C,	%i0
	movvc	%icc,	%o7,	%o6
loop_2535:
	fnegs	%f13,	%f18
	popc	0x0F42,	%o3
	alignaddr	%o5,	%l0,	%l1
	fbge	%fcc0,	loop_2536
	tcs	%icc,	0x2
	orncc	%o1,	%l3,	%i7
	fabsd	%f28,	%f18
loop_2536:
	ldsb	[%l7 + 0x2C],	%l4
	fmovdn	%xcc,	%f5,	%f0
	ble,a	%xcc,	loop_2537
	mulx	%o0,	0x1024,	%i1
	movrlz	%l5,	%o2,	%g7
	movcc	%xcc,	%i4,	%l2
loop_2537:
	fone	%f14
	ldd	[%l7 + 0x20],	%f24
	fmovdvc	%xcc,	%f17,	%f19
	te	%icc,	0x4
	movn	%icc,	%g3,	%i5
	nop
	setx	0xE8D890BA7133AF6C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xB0B345640245BDF5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f22,	%f16
	tleu	%icc,	0x1
	sll	%g2,	0x14,	%i2
	and	%i3,	0x1928,	%g4
	subc	%g6,	%o4,	%g5
	movrlz	%g1,	%l6,	%i6
	taddcctv	%i0,	0x12B5,	%o6
	fmovdg	%icc,	%f11,	%f31
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x12] %asi,	%o7
	bcs,a,pt	%icc,	loop_2538
	movrne	%o5,	%l0,	%o3
	ldsh	[%l7 + 0x6C],	%o1
	fands	%f0,	%f22,	%f8
loop_2538:
	faligndata	%f22,	%f28,	%f0
	orcc	%l1,	%l3,	%i7
	brlz,a	%o0,	loop_2539
	nop
	setx	0xC30B491B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f15
	subccc	%i1,	%l4,	%l5
	bge,pn	%xcc,	loop_2540
loop_2539:
	fands	%f4,	%f5,	%f6
	fpadd16s	%f19,	%f3,	%f24
	fandnot2	%f2,	%f4,	%f22
loop_2540:
	tvs	%xcc,	0x3
	fbn	%fcc3,	loop_2541
	fmul8sux16	%f18,	%f6,	%f30
	nop
	set	0x0E, %g7
	ldub	[%l7 + %g7],	%o2
	movrgz	%g7,	%l2,	%i4
loop_2541:
	nop
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x10
	alignaddr	%g3,	%g2,	%i2
	fmovscs	%xcc,	%f22,	%f23
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x140] %asi,	%i5 ripped by fixASI40.pl ripped by fixASI40.pl
	nop
	fitos	%f10,	%f12
	fstox	%f12,	%f22
	sethi	0x0893,	%i3
	movge	%icc,	%g6,	%o4
	tcc	%icc,	0x0
	mova	%xcc,	%g4,	%g5
	ldub	[%l7 + 0x38],	%l6
	umul	%i6,	%i0,	%g1
	fbug	%fcc1,	loop_2542
	fors	%f16,	%f13,	%f28
	smulcc	%o7,	0x00B1,	%o5
	nop
	setx	0xE34AB126,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f17
loop_2542:
	andcc	%o6,	%l0,	%o3
	xnorcc	%l1,	0x0734,	%o1
	fornot2	%f24,	%f14,	%f0
	movn	%icc,	%i7,	%o0
	set	0x48, %l4
	prefetcha	[%l7 + %l4] 0x15,	 0x2
	subccc	%i1,	0x16F6,	%l4
	edge32	%l5,	%o2,	%g7
	fornot2	%f22,	%f18,	%f24
	array8	%i4,	%l2,	%g2
	edge8ln	%g3,	%i5,	%i2
	fabsd	%f14,	%f6
	movgu	%xcc,	%i3,	%g6
	sub	%o4,	0x0A17,	%g4
	sra	%l6,	0x0F,	%i6
	orncc	%i0,	0x0342,	%g1
	sethi	0x1D03,	%g5
	movl	%icc,	%o5,	%o6
	edge32ln	%o7,	%o3,	%l0
	fzeros	%f30
	addccc	%o1,	%l1,	%i7
	edge32n	%l3,	%o0,	%l4
	fmovdcc	%icc,	%f30,	%f2
	movgu	%xcc,	%i1,	%o2
	fpadd16s	%f16,	%f18,	%f21
	sll	%l5,	%i4,	%g7
	bcs,a,pn	%xcc,	loop_2543
	xnor	%l2,	0x01E1,	%g2
	tg	%xcc,	0x4
	fmovda	%xcc,	%f20,	%f26
loop_2543:
	orn	%g3,	0x0F4D,	%i2
	or	%i3,	%i5,	%g6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x19,	%o4,	%l6
	ta	%icc,	0x6
	ldx	[%l7 + 0x30],	%i6
	fbn,a	%fcc0,	loop_2544
	sdivx	%g4,	0x0974,	%i0
	fbu	%fcc3,	loop_2545
	movrlz	%g5,	0x35F,	%o5
loop_2544:
	movl	%xcc,	%g1,	%o6
	edge16	%o3,	%l0,	%o1
loop_2545:
	fbul,a	%fcc1,	loop_2546
	movpos	%icc,	%l1,	%i7
	bne,pn	%icc,	loop_2547
	array8	%o7,	%o0,	%l3
loop_2546:
	movvc	%xcc,	%l4,	%i1
	sdiv	%o2,	0x02C1,	%l5
loop_2547:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x26] %asi,	%g7
	fmovrdlez	%i4,	%f8,	%f24
	te	%icc,	0x7
	srlx	%g2,	0x01,	%g3
	edge16	%i2,	%i3,	%i5
	movne	%xcc,	%g6,	%l2
	fxors	%f18,	%f29,	%f24
	nop
	setx	0x2CEEAE1C07DAB472,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f26
	movneg	%icc,	%o4,	%l6
	edge32n	%g4,	%i6,	%g5
	fors	%f20,	%f2,	%f9
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x5F] %asi,	%i0
	ldd	[%l7 + 0x78],	%f26
	umul	%g1,	%o5,	%o3
	fmovsge	%icc,	%f13,	%f1
	stw	%l0,	[%l7 + 0x70]
	taddcctv	%o1,	%l1,	%i7
	fcmpgt32	%f28,	%f14,	%o7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] %asi,	%o0,	%l3
	xnor	%o6,	%i1,	%l4
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f28
	fxtod	%f28,	%f10
	fmuld8ulx16	%f7,	%f31,	%f8
	and	%o2,	%l5,	%i4
	fbul,a	%fcc2,	loop_2548
	movrgz	%g7,	%g3,	%g2
	taddcc	%i3,	0x1C6B,	%i5
	prefetch	[%l7 + 0x7C],	 0x1
loop_2548:
	fbe	%fcc0,	loop_2549
	srlx	%i2,	%g6,	%o4
	mulx	%l6,	%g4,	%l2
	movrgez	%g5,	0x3D8,	%i0
loop_2549:
	tl	%icc,	0x3
	sdivx	%g1,	0x1057,	%o5
	fbule	%fcc3,	loop_2550
	ble,a,pn	%icc,	loop_2551
	tneg	%xcc,	0x6
	flush	%l7 + 0x10
loop_2550:
	sdivx	%o3,	0x03C5,	%l0
loop_2551:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x0C] %asi,	%o1
	fcmple32	%f6,	%f12,	%l1
	xor	%i7,	%i6,	%o0
	ldsw	[%l7 + 0x64],	%l3
	fcmpgt32	%f28,	%f10,	%o7
	nop
	setx	0xE90DCAF0639ED04B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x18FBEAC402E5B1A7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f30,	%f20
	set	0x40, %g3
	ldstuba	[%l7 + %g3] 0x88,	%i1
	movrne	%l4,	0x3CA,	%o2
	tsubcc	%l5,	%i4,	%o6
	fpack32	%f12,	%f2,	%f28
	movge	%xcc,	%g7,	%g2
	movre	%g3,	%i5,	%i2
	edge16l	%i3,	%o4,	%l6
	fbn,a	%fcc1,	loop_2552
	addcc	%g6,	%g4,	%g5
	ta	%icc,	0x5
	mulscc	%l2,	%g1,	%i0
loop_2552:
	fnegd	%f8,	%f26
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x1B] %asi,	%o3
	call	loop_2553
	movrgz	%l0,	%o5,	%l1
	tvc	%xcc,	0x5
	andcc	%o1,	%i6,	%o0
loop_2553:
	ldsb	[%l7 + 0x3D],	%i7
	fbn,a	%fcc0,	loop_2554
	orn	%o7,	0x13F1,	%l3
	subccc	%l4,	0x0070,	%i1
	udivx	%o2,	0x0508,	%l5
loop_2554:
	movneg	%xcc,	%o6,	%i4
	fbug,a	%fcc3,	loop_2555
	xor	%g7,	%g2,	%i5
	add	%i2,	0x0F82,	%g3
	udiv	%o4,	0x007C,	%l6
loop_2555:
	tg	%xcc,	0x3
	srl	%g6,	%g4,	%i3
	edge32n	%g5,	%g1,	%i0
	tvs	%icc,	0x2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%l0
	array16	%o5,	%l1,	%o3
	tle	%xcc,	0x1
	fpadd32	%f28,	%f2,	%f28
	fmovsa	%xcc,	%f20,	%f3
	mova	%xcc,	%o1,	%i6
	tleu	%xcc,	0x0
	stb	%i7,	[%l7 + 0x16]
	mulscc	%o0,	%l3,	%o7
	edge8n	%i1,	%l4,	%o2
	fbge	%fcc3,	loop_2556
	array16	%l5,	%i4,	%g7
	fmovde	%xcc,	%f24,	%f16
	ld	[%l7 + 0x08],	%f6
loop_2556:
	fzero	%f30
	edge8ln	%g2,	%i5,	%o6
	bg,a,pt	%icc,	loop_2557
	prefetch	[%l7 + 0x20],	 0x1
	lduh	[%l7 + 0x36],	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2557:
	edge16	%g3,	%l6,	%g6
	edge8ln	%o4,	%i3,	%g5
	set	0x1C, %i6
	ldsha	[%l7 + %i6] 0x15,	%g4
	movrlz	%g1,	0x3CC,	%l2
	tsubcc	%i0,	0x19DC,	%l0
	fpsub32	%f0,	%f0,	%f2
	movvc	%icc,	%o5,	%l1
	udiv	%o1,	0x116E,	%o3
	fbne,a	%fcc0,	loop_2558
	stb	%i6,	[%l7 + 0x40]
	fmovrdlz	%o0,	%f14,	%f14
	srl	%l3,	%o7,	%i7
loop_2558:
	bcs,pt	%xcc,	loop_2559
	addccc	%i1,	0x0441,	%o2
	tn	%icc,	0x5
	srl	%l5,	%l4,	%i4
loop_2559:
	tle	%icc,	0x0
	edge8ln	%g7,	%i5,	%o6
	set	0x18, %g5
	ldswa	[%l7 + %g5] 0x14,	%i2
	umul	%g2,	%g3,	%l6
	sra	%g6,	%i3,	%o4
	movvc	%xcc,	%g4,	%g5
	fmuld8sux16	%f30,	%f7,	%f18
	nop
	setx loop_2560, %l0, %l1
	jmpl %l1, %g1
	sethi	0x1EB7,	%l2
	movneg	%icc,	%i0,	%l0
	subccc	%o5,	0x1804,	%o1
loop_2560:
	fbuge,a	%fcc2,	loop_2561
	tcc	%icc,	0x4
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f4
	fxtod	%f4,	%f30
	fmovsge	%xcc,	%f29,	%f22
loop_2561:
	addcc	%l1,	%o3,	%o0
	sir	0x03BC
	addc	%i6,	0x0607,	%o7
	prefetch	[%l7 + 0x1C],	 0x2
	faligndata	%f20,	%f22,	%f28
	fcmpgt32	%f0,	%f18,	%l3
	fmovsn	%icc,	%f1,	%f13
	ldsh	[%l7 + 0x60],	%i1
	mulscc	%o2,	0x07C2,	%l5
	srlx	%l4,	%i7,	%g7
	movl	%icc,	%i4,	%o6
	andncc	%i5,	%i2,	%g2
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x2E] %asi,	%g3
	lduw	[%l7 + 0x70],	%l6
	fornot1	%f12,	%f22,	%f6
	tcs	%icc,	0x4
	xnorcc	%i3,	%o4,	%g6
	fandnot2s	%f18,	%f31,	%f5
	brgez,a	%g4,	loop_2562
	udivcc	%g1,	0x0CDB,	%g5
	edge32l	%l2,	%i0,	%l0
	edge32	%o5,	%l1,	%o3
loop_2562:
	fmovd	%f12,	%f16
	fba	%fcc2,	loop_2563
	addcc	%o1,	%i6,	%o0
	sub	%o7,	0x14EA,	%i1
	fbug,a	%fcc2,	loop_2564
loop_2563:
	brz	%l3,	loop_2565
	xorcc	%l5,	%o2,	%l4
	or	%g7,	%i7,	%i4
loop_2564:
	mova	%icc,	%o6,	%i2
loop_2565:
	movleu	%xcc,	%i5,	%g2
	edge32l	%l6,	%i3,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f8,	%f16,	%f8
	movgu	%icc,	%g6,	%g4
	mulx	%o4,	0x1CC8,	%g1
	movle	%icc,	%g5,	%i0
	xnorcc	%l0,	0x1264,	%o5
	brgz	%l2,	loop_2566
	fcmple32	%f24,	%f6,	%o3
	nop
	setx loop_2567, %l0, %l1
	jmpl %l1, %o1
	taddcc	%i6,	0x07A5,	%l1
loop_2566:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%o0
loop_2567:
	movre	%l3,	%i1,	%l5
	tne	%icc,	0x6
	bvc,pt	%icc,	loop_2568
	subc	%o2,	0x1407,	%g7
	nop
	setx	loop_2569,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8ln	%i7,	%i4,	%o6
loop_2568:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i2,	%l4
loop_2569:
	srl	%i5,	%g2,	%i3
	st	%f11,	[%l7 + 0x30]
	or	%g3,	%l6,	%g6
	edge8ln	%g4,	%g1,	%o4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%g5,	%l0
	edge8ln	%o5,	%l2,	%i0
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x5C] %asi,	%o1
	movne	%xcc,	%i6,	%l1
	edge16	%o7,	%o3,	%l3
	sll	%i1,	%l5,	%o2
	nop
	setx	0xB9F9F2A0C22BB274,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xA5A41D79BB7E1665,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f22,	%f14
	lduw	[%l7 + 0x14],	%o0
	sra	%i7,	%i4,	%o6
	fmovse	%xcc,	%f29,	%f18
	fbo	%fcc0,	loop_2570
	movcs	%xcc,	%i2,	%l4
	tg	%icc,	0x5
	stb	%g7,	[%l7 + 0x79]
loop_2570:
	tn	%icc,	0x5
	bvs,a	loop_2571
	fxor	%f4,	%f28,	%f4
	fcmpgt32	%f16,	%f10,	%i5
	fmovrdne	%g2,	%f8,	%f16
loop_2571:
	bleu,pn	%xcc,	loop_2572
	fpadd16s	%f17,	%f11,	%f25
	addccc	%g3,	0x1AA3,	%i3
	bge,a	%xcc,	loop_2573
loop_2572:
	movre	%g6,	0x307,	%l6
	bn,a	%icc,	loop_2574
	xnor	%g4,	0x1B33,	%g1
loop_2573:
	sub	%o4,	0x174F,	%l0
	fmovdcs	%icc,	%f14,	%f25
loop_2574:
	edge16l	%g5,	%o5,	%i0
	brlz	%o1,	loop_2575
	movn	%xcc,	%l2,	%l1
	mova	%xcc,	%i6,	%o7
	sethi	0x0C7E,	%l3
loop_2575:
	orncc	%i1,	%o3,	%o2
	sub	%l5,	%i7,	%i4
	edge32	%o6,	%i2,	%o0
	nop
	setx loop_2576, %l0, %l1
	jmpl %l1, %l4
	stbar
	movrlez	%i5,	%g2,	%g3
	tcc	%icc,	0x5
loop_2576:
	movl	%xcc,	%g7,	%i3
	ldsw	[%l7 + 0x6C],	%l6
	tg	%xcc,	0x1
	nop
	fitod	%f6,	%f18
	fdtoi	%f18,	%f21
	membar	0x4A
	fmul8ulx16	%f4,	%f0,	%f2
	bne,pt	%icc,	loop_2577
	sll	%g4,	0x0B,	%g1
	stx	%g6,	[%l7 + 0x38]
	umul	%o4,	0x0014,	%g5
loop_2577:
	sdiv	%o5,	0x0DD3,	%l0
	fand	%f8,	%f20,	%f30
	st	%f23,	[%l7 + 0x64]
	umulcc	%i0,	0x1A96,	%o1
	xnorcc	%l1,	%l2,	%i6
	sdiv	%o7,	0x080F,	%l3
	fmovrdlz	%i1,	%f18,	%f10
	sethi	0x1B5E,	%o2
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%o3
	movge	%icc,	%i7,	%l5
	fmovsle	%xcc,	%f14,	%f12
	movcc	%xcc,	%i4,	%i2
	set	0x74, %l3
	lda	[%l7 + %l3] 0x18,	%f21
	bgu	%xcc,	loop_2578
	popc	%o6,	%o0
	bge,a,pt	%icc,	loop_2579
	call	loop_2580
loop_2578:
	umulcc	%l4,	0x09BE,	%i5
	ldsw	[%l7 + 0x24],	%g2
loop_2579:
	udivcc	%g7,	0x12FE,	%i3
loop_2580:
	edge8n	%l6,	%g3,	%g4
	andn	%g6,	%g1,	%g5
	orcc	%o5,	%l0,	%o4
	fbe	%fcc3,	loop_2581
	array16	%i0,	%l1,	%o1
	fxors	%f18,	%f12,	%f22
	fba,a	%fcc3,	loop_2582
loop_2581:
	movle	%xcc,	%i6,	%l2
	fbe,a	%fcc2,	loop_2583
	edge16l	%l3,	%o7,	%i1
loop_2582:
	brlz	%o2,	loop_2584
	movre	%o3,	0x32B,	%i7
loop_2583:
	sll	%i4,	%i2,	%l5
	udivcc	%o0,	0x07E1,	%o6
loop_2584:
	movge	%icc,	%i5,	%l4
	lduw	[%l7 + 0x20],	%g7
	ble,pt	%xcc,	loop_2585
	taddcc	%g2,	%i3,	%g3
	or	%l6,	0x130B,	%g4
	add	%g6,	%g5,	%g1
loop_2585:
	fble	%fcc0,	loop_2586
	subccc	%o5,	%o4,	%i0
	bg,a	%icc,	loop_2587
	ldsh	[%l7 + 0x6C],	%l0
loop_2586:
	nop
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x10,	 0x0
loop_2587:
	mulscc	%l1,	%i6,	%l3
	andn	%l2,	%i1,	%o2
	te	%xcc,	0x0
	sll	%o3,	0x0C,	%o7
	movvs	%xcc,	%i4,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%xcc,	%f31,	%f5
	fsrc2	%f16,	%f0
	nop
	setx	loop_2588,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvs,a,pn	%xcc,	loop_2589
	sra	%l5,	%o0,	%o6
	brgez	%i2,	loop_2590
loop_2588:
	bne,a	loop_2591
loop_2589:
	nop
	setx	loop_2592,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f0
	fxtod	%f0,	%f26
loop_2590:
	edge16n	%l4,	%g7,	%g2
loop_2591:
	addc	%i5,	%g3,	%i3
loop_2592:
	sdiv	%l6,	0x110A,	%g4
	nop
	setx	loop_2593,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbuge	%fcc2,	loop_2594
	fandnot2	%f28,	%f16,	%f22
	edge32ln	%g6,	%g5,	%o5
loop_2593:
	orcc	%g1,	%o4,	%l0
loop_2594:
	fmovscc	%xcc,	%f30,	%f9
	sdivcc	%o1,	0x0BDB,	%l1
	fmovscs	%xcc,	%f1,	%f15
	ldx	[%l7 + 0x58],	%i0
	andcc	%l3,	0x0C2C,	%l2
	fcmpne32	%f14,	%f6,	%i6
	tsubcc	%o2,	0x19B7,	%i1
	movle	%icc,	%o7,	%o3
	or	%i7,	%i4,	%l5
	fmovdge	%icc,	%f18,	%f17
	movle	%icc,	%o0,	%o6
	brz,a	%i2,	loop_2595
	fble,a	%fcc3,	loop_2596
	udivx	%l4,	0x1E4F,	%g7
	or	%i5,	0x0A26,	%g3
loop_2595:
	fpsub32	%f24,	%f8,	%f14
loop_2596:
	edge32	%g2,	%i3,	%l6
	fmovscs	%xcc,	%f29,	%f26
	umul	%g6,	%g5,	%o5
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x18,	%f0
	subccc	%g4,	%g1,	%l0
	fmovsvs	%icc,	%f3,	%f3
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o4
	tvc	%icc,	0x0
	fbg	%fcc1,	loop_2597
	brz,a	%o1,	loop_2598
	tsubcctv	%l1,	%i0,	%l2
	sll	%i6,	%l3,	%i1
loop_2597:
	sllx	%o7,	0x0F,	%o2
loop_2598:
	membar	0x77
	set	0x58, %l5
	sta	%f21,	[%l7 + %l5] 0x0c
	edge16	%i7,	%o3,	%i4
	fnegd	%f4,	%f16
	sethi	0x0156,	%l5
	movre	%o6,	%i2,	%o0
	fnands	%f22,	%f7,	%f5
	fsrc2s	%f26,	%f14
	nop
	setx	0x0068C370,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	sra	%g7,	%l4,	%i5
	move	%icc,	%g2,	%g3
	addccc	%i3,	0x190C,	%l6
	fnot2s	%f21,	%f26
	fbn,a	%fcc0,	loop_2599
	udivx	%g5,	0x0C64,	%g6
	fmovrse	%o5,	%f19,	%f7
	udivx	%g1,	0x1B9B,	%l0
loop_2599:
	brnz,a	%g4,	loop_2600
	bvc	loop_2601
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o4,	%l1,	%o1
loop_2600:
	umulcc	%i0,	0x19AC,	%l2
loop_2601:
	tleu	%icc,	0x5
	umul	%i6,	0x035E,	%l3
	orncc	%o7,	%i1,	%o2
	tge	%xcc,	0x6
	nop
	setx	0x404CEEFE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f5
	sll	%i7,	0x08,	%i4
	udiv	%l5,	0x1BCB,	%o3
	brgz	%i2,	loop_2602
	fpsub16	%f16,	%f22,	%f14
	movle	%icc,	%o0,	%g7
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x19,	 0x3
loop_2602:
	fmovsl	%icc,	%f27,	%f28
	subc	%l4,	%g2,	%i5
	fpackfix	%f2,	%f10
	set	0x2C, %i3
	stba	%i3,	[%l7 + %i3] 0x22
	membar	#Sync
	mova	%xcc,	%l6,	%g5
	set	0x70, %i0
	ldda	[%l7 + %i0] 0x15,	%g2
	movcs	%xcc,	%o5,	%g6
	nop
	setx	0x87107996118E1BC6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xDA35F1153F3BEC95,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f10,	%f16
	fpackfix	%f10,	%f17
	movrlez	%g1,	%l0,	%g4
	fbge,a	%fcc2,	loop_2603
	brgz,a	%l1,	loop_2604
	brgez	%o1,	loop_2605
	srax	%o4,	%l2,	%i0
loop_2603:
	tpos	%icc,	0x3
loop_2604:
	lduw	[%l7 + 0x10],	%i6
loop_2605:
	fmovrsgz	%l3,	%f20,	%f27
	movg	%xcc,	%o7,	%o2
	tl	%icc,	0x4
	fmovscs	%xcc,	%f7,	%f7
	tle	%xcc,	0x1
	fbo	%fcc3,	loop_2606
	nop
	setx	loop_2607,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot1	%f28,	%f12,	%f24
	or	%i7,	0x1A4D,	%i1
loop_2606:
	nop
	fitos	%f19,	%f30
loop_2607:
	sth	%l5,	[%l7 + 0x4C]
	fpadd32	%f26,	%f14,	%f10
	orcc	%i4,	0x0357,	%i2
	fpsub16	%f16,	%f18,	%f20
	andncc	%o0,	%o3,	%g7
	srl	%o6,	0x1B,	%g2
	fpadd32s	%f13,	%f3,	%f7
	ldsh	[%l7 + 0x16],	%i5
	movrlez	%l4,	%i3,	%l6
	edge16n	%g3,	%g5,	%o5
	fcmple16	%f22,	%f30,	%g6
	set	0x64, %l6
	swapa	[%l7 + %l6] 0x18,	%g1
	movcc	%icc,	%g4,	%l0
	membar	0x3C
	bgu,a,pt	%icc,	loop_2608
	umulcc	%o1,	0x1B51,	%o4
	xorcc	%l2,	0x1247,	%i0
	orncc	%l1,	%l3,	%o7
loop_2608:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	fmovsa	%icc,	%f12,	%f20
	te	%xcc,	0x2
	orncc	%o2,	0x0FC8,	%i7
	taddcc	%i1,	0x171E,	%i4
	tvc	%xcc,	0x0
	movge	%icc,	%l5,	%o0
	andn	%i2,	0x1706,	%o3
	sdivx	%g7,	0x088D,	%o6
	edge16n	%i5,	%g2,	%i3
	sra	%l4,	0x06,	%l6
	fmovsgu	%icc,	%f28,	%f25
	fors	%f23,	%f0,	%f0
	xorcc	%g3,	%o5,	%g6
	fbul	%fcc1,	loop_2609
	fornot1	%f22,	%f2,	%f0
	stw	%g1,	[%l7 + 0x78]
	udivx	%g5,	0x025A,	%g4
loop_2609:
	array16	%o1,	%l0,	%o4
	tg	%icc,	0x7
	set	0x68, %i2
	lduha	[%l7 + %i2] 0x10,	%l2
	movvs	%xcc,	%i0,	%l1
	nop
	setx	0xF36802D153A3ADAE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xFCD9B9659E4A2AAA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f20,	%f26
	fmovdge	%xcc,	%f25,	%f1
	mulscc	%o7,	%l3,	%o2
	sdivcc	%i7,	0x0102,	%i6
	and	%i4,	%i1,	%o0
	andcc	%i2,	%l5,	%o3
	tvs	%icc,	0x4
	movrne	%g7,	0x324,	%i5
	ldstub	[%l7 + 0x1F],	%g2
	te	%icc,	0x5
	udiv	%i3,	0x04C8,	%l4
	array8	%o6,	%l6,	%o5
	movgu	%icc,	%g3,	%g6
	fpadd32s	%f15,	%f23,	%f26
	movrlez	%g1,	%g4,	%o1
	movvs	%xcc,	%g5,	%o4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x78] %asi,	%f8
	movleu	%icc,	%l2,	%l0
	bneg,pt	%xcc,	loop_2610
	tg	%icc,	0x0
	tg	%icc,	0x6
	movle	%xcc,	%i0,	%o7
loop_2610:
	fmovsgu	%xcc,	%f11,	%f5
	srlx	%l1,	0x1E,	%l3
	fandnot1s	%f18,	%f15,	%f8
	fmovdcs	%xcc,	%f16,	%f25
	sdivx	%i7,	0x18C2,	%i6
	wr	%g0,	0x81,	%asi
	stba	%o2,	[%l7 + 0x71] %asi
	edge32	%i1,	%o0,	%i4
	movgu	%xcc,	%i2,	%o3
	fmovsa	%icc,	%f30,	%f0
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g7
	tn	%icc,	0x1
	nop
	setx	loop_2611,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srax	%i5,	0x08,	%l5
	edge8n	%i3,	%g2,	%l4
	fbg,a	%fcc1,	loop_2612
loop_2611:
	tleu	%xcc,	0x4
	andn	%o6,	%l6,	%g3
	tcc	%icc,	0x1
loop_2612:
	fmovrdlz	%o5,	%f20,	%f20
	set	0x18, %g6
	stba	%g1,	[%l7 + %g6] 0x04
	movvc	%xcc,	%g4,	%o1
	fcmpgt16	%f8,	%f4,	%g6
	addcc	%o4,	%l2,	%l0
	srlx	%g5,	0x06,	%o7
	umulcc	%l1,	%i0,	%l3
	xnor	%i7,	0x099E,	%i6
	tvc	%icc,	0x3
	movleu	%xcc,	%i1,	%o2
	movl	%icc,	%o0,	%i2
	sub	%i4,	%g7,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l5,	%i5,	%i3
	tle	%xcc,	0x2
	sethi	0x1A88,	%l4
	brlz,a	%g2,	loop_2613
	alignaddr	%l6,	%o6,	%g3
	xor	%g1,	%o5,	%g4
	bvc,pn	%xcc,	loop_2614
loop_2613:
	fbul,a	%fcc1,	loop_2615
	sir	0x0026
	array16	%g6,	%o1,	%l2
loop_2614:
	udivx	%o4,	0x1A3E,	%l0
loop_2615:
	movg	%xcc,	%o7,	%l1
	ldsb	[%l7 + 0x1C],	%g5
	addcc	%l3,	%i0,	%i6
	movneg	%xcc,	%i7,	%o2
	fcmpgt32	%f20,	%f16,	%o0
	edge32	%i1,	%i4,	%i2
	tge	%icc,	0x6
	edge16	%g7,	%l5,	%o3
	movn	%xcc,	%i5,	%i3
	movneg	%xcc,	%g2,	%l4
	fmovdneg	%xcc,	%f27,	%f10
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x6C] %asi,	%l6
	tleu	%xcc,	0x0
	movle	%xcc,	%g3,	%o6
	fmovrdlz	%g1,	%f0,	%f6
	fmovspos	%xcc,	%f24,	%f10
	tl	%xcc,	0x3
	fnot1s	%f13,	%f9
	brgz,a	%g4,	loop_2616
	brgz	%o5,	loop_2617
	alignaddrl	%g6,	%o1,	%o4
	tl	%xcc,	0x3
loop_2616:
	xorcc	%l2,	%l0,	%l1
loop_2617:
	andcc	%o7,	%l3,	%g5
	fpsub32	%f24,	%f26,	%f2
	subccc	%i6,	%i0,	%i7
	set	0x25, %i5
	ldstuba	[%l7 + %i5] 0x19,	%o2
	bneg	loop_2618
	edge32l	%i1,	%o0,	%i4
	te	%xcc,	0x3
	fxors	%f3,	%f25,	%f1
loop_2618:
	fbue,a	%fcc3,	loop_2619
	mulx	%i2,	%g7,	%l5
	pdist	%f4,	%f12,	%f0
	xnorcc	%o3,	%i5,	%g2
loop_2619:
	tg	%xcc,	0x1
	movrgez	%i3,	0x23D,	%l6
	fba	%fcc0,	loop_2620
	bn,pt	%xcc,	loop_2621
	sethi	0x0856,	%l4
	nop
	fitos	%f5,	%f4
	fstox	%f4,	%f10
loop_2620:
	movleu	%icc,	%o6,	%g1
loop_2621:
	fmovsl	%icc,	%f14,	%f30
	alignaddr	%g4,	%o5,	%g3
	srl	%g6,	0x19,	%o1
	edge8l	%o4,	%l2,	%l1
	ta	%xcc,	0x3
	fmovsleu	%xcc,	%f20,	%f25
	ldd	[%l7 + 0x60],	%l0
	fmovrdne	%l3,	%f0,	%f28
	srax	%g5,	%i6,	%i0
	tvs	%xcc,	0x6
	movrne	%i7,	0x32B,	%o7
	brz	%o2,	loop_2622
	ldx	[%l7 + 0x20],	%o0
	movg	%xcc,	%i1,	%i4
	fmovse	%icc,	%f16,	%f7
loop_2622:
	fmovde	%xcc,	%f20,	%f13
	edge8n	%g7,	%l5,	%i2
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x60] %asi,	%o3
	brlez,a	%g2,	loop_2623
	sra	%i5,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	sta	%f10,	[%l7 + 0x20] %asi
loop_2623:
	sllx	%i3,	0x08,	%o6
	sll	%l4,	%g1,	%o5
	bcs,pt	%icc,	loop_2624
	nop
	setx	loop_2625,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andncc	%g4,	%g6,	%o1
	fornot1s	%f1,	%f14,	%f5
loop_2624:
	umulcc	%g3,	%l2,	%o4
loop_2625:
	smulcc	%l0,	0x0332,	%l3
	ld	[%l7 + 0x10],	%f12
	ldx	[%l7 + 0x68],	%g5
	addc	%i6,	0x1724,	%l1
	movne	%xcc,	%i0,	%i7
	array32	%o7,	%o2,	%i1
	movcs	%xcc,	%o0,	%g7
	flush	%l7 + 0x0C
	fnor	%f16,	%f24,	%f4
	mulx	%l5,	0x1C2B,	%i2
	fmovsleu	%xcc,	%f19,	%f13
	smulcc	%o3,	%i4,	%i5
	udiv	%g2,	0x16B2,	%l6
	fcmpgt32	%f6,	%f12,	%o6
	fmovscs	%icc,	%f12,	%f28
	edge8n	%l4,	%g1,	%i3
	edge8	%o5,	%g6,	%o1
	fbug,a	%fcc1,	loop_2626
	edge16	%g3,	%g4,	%l2
	fmovsg	%icc,	%f5,	%f14
	sdiv	%l0,	0x053E,	%o4
loop_2626:
	bne,a	%xcc,	loop_2627
	xorcc	%g5,	0x119C,	%l3
	fble	%fcc3,	loop_2628
	sethi	0x0603,	%l1
loop_2627:
	movvc	%icc,	%i6,	%i0
	addc	%i7,	%o2,	%i1
loop_2628:
	udivx	%o0,	0x0A94,	%o7
	fmovsg	%icc,	%f27,	%f9
	movge	%xcc,	%g7,	%i2
	tpos	%xcc,	0x4
	ldsw	[%l7 + 0x38],	%l5
	swap	[%l7 + 0x68],	%o3
	fbule,a	%fcc0,	loop_2629
	mova	%icc,	%i4,	%i5
	fmuld8ulx16	%f4,	%f14,	%f26
	bg,a	loop_2630
loop_2629:
	edge32	%g2,	%l6,	%o6
	tsubcc	%g1,	0x1DC0,	%l4
	alignaddrl	%o5,	%i3,	%o1
loop_2630:
	movle	%xcc,	%g3,	%g6
	andn	%l2,	0x09A3,	%l0
	srax	%g4,	%g5,	%l3
	movcc	%xcc,	%l1,	%i6
	tcs	%icc,	0x2
	srl	%o4,	%i7,	%o2
	fmovsle	%xcc,	%f5,	%f24
	te	%xcc,	0x2
	brlz	%i0,	loop_2631
	smul	%o0,	0x1EE7,	%i1
	fpadd32	%f20,	%f24,	%f12
	fbge,a	%fcc0,	loop_2632
loop_2631:
	tneg	%xcc,	0x3
	nop
	fitos	%f11,	%f10
	fstod	%f10,	%f10
	nop
	set	0x54, %o1
	ldsh	[%l7 + %o1],	%g7
loop_2632:
	fbg	%fcc0,	loop_2633
	sdivx	%i2,	0x1E2E,	%o7
	tvc	%xcc,	0x1
	ba,a,pn	%xcc,	loop_2634
loop_2633:
	fors	%f7,	%f2,	%f21
	array8	%l5,	%o3,	%i5
	sdivcc	%i4,	0x151B,	%l6
loop_2634:
	nop
	setx	0xEDCCBB24D7629FA0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f0
	orncc	%o6,	%g1,	%l4
	nop
	fitod	%f8,	%f8
	fdtos	%f8,	%f6
	sdivcc	%g2,	0x083F,	%i3
	set	0x0A, %l2
	ldsha	[%l7 + %l2] 0x10,	%o1
	mulscc	%g3,	0x0121,	%o5
	fpsub32	%f28,	%f16,	%f8
	fpsub32s	%f23,	%f14,	%f5
	wr	%g0,	0x88,	%asi
	sta	%f0,	[%l7 + 0x14] %asi
	edge32n	%l2,	%l0,	%g6
	addc	%g5,	0x0EC3,	%l3
	stbar
	fpadd16	%f24,	%f6,	%f10
	bge,a,pn	%icc,	loop_2635
	movrlz	%g4,	%i6,	%o4
	ld	[%l7 + 0x38],	%f16
	wr	%g0,	0x27,	%asi
	stwa	%i7,	[%l7 + 0x34] %asi
	membar	#Sync
loop_2635:
	fbge	%fcc1,	loop_2636
	edge8n	%l1,	%o2,	%o0
	sll	%i1,	0x15,	%g7
	fmovrsne	%i0,	%f21,	%f31
loop_2636:
	subccc	%i2,	%l5,	%o3
	edge16n	%i5,	%o7,	%i4
	fnot2	%f10,	%f14
	movre	%o6,	0x087,	%g1
	sethi	0x190A,	%l4
	lduw	[%l7 + 0x60],	%l6
	fpack16	%f18,	%f2
	bvs,a,pt	%xcc,	loop_2637
	movvc	%icc,	%g2,	%o1
	nop
	fitod	%f0,	%f6
	fdtoi	%f6,	%f7
	tvc	%xcc,	0x7
loop_2637:
	movre	%i3,	%o5,	%g3
	ldd	[%l7 + 0x78],	%l2
	edge8	%l0,	%g5,	%l3
	sth	%g4,	[%l7 + 0x72]
	edge32ln	%i6,	%o4,	%g6
	tvc	%icc,	0x6
	nop
	fitos	%f13,	%f12
	fstod	%f12,	%f6
	tsubcc	%i7,	0x0F0A,	%l1
	movne	%icc,	%o2,	%i1
	orcc	%g7,	%o0,	%i2
	fmovsne	%xcc,	%f24,	%f28
	ta	%xcc,	0x6
	mova	%icc,	%l5,	%o3
	nop
	fitod	%f2,	%f28
	fdtox	%f28,	%f14
	movcc	%icc,	%i0,	%o7
	movg	%xcc,	%i4,	%o6
	stw	%i5,	[%l7 + 0x60]
	nop
	set	0x6C, %o4
	prefetch	[%l7 + %o4],	 0x3
	sdivx	%l4,	0x1A3E,	%g1
	popc	%l6,	%g2
	array8	%i3,	%o5,	%o1
	fmovspos	%icc,	%f8,	%f17
	fpsub16s	%f31,	%f3,	%f11
	set	0x08, %o0
	lduwa	[%l7 + %o0] 0x88,	%g3
	fpmerge	%f13,	%f27,	%f26
	udivcc	%l0,	0x1BD2,	%l2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x18,	%l3,	%g5
	ble	%icc,	loop_2638
	fblg	%fcc3,	loop_2639
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g4,	%o4,	%i6
loop_2638:
	nop
	set	0x66, %g4
	ldsha	[%l7 + %g4] 0x88,	%i7
loop_2639:
	movvs	%xcc,	%g6,	%l1
	fmovdvc	%icc,	%f30,	%f10
	fmovrsne	%o2,	%f0,	%f10
	ldsh	[%l7 + 0x3C],	%g7
	array16	%o0,	%i2,	%l5
	fmovscs	%xcc,	%f16,	%f23
	fmovrdlez	%o3,	%f14,	%f16
	subcc	%i0,	%o7,	%i1
	fbg,a	%fcc1,	loop_2640
	sra	%i4,	%i5,	%o6
	fbul,a	%fcc0,	loop_2641
	bleu,pt	%icc,	loop_2642
loop_2640:
	movrne	%l4,	%g1,	%g2
	brnz,a	%i3,	loop_2643
loop_2641:
	std	%f16,	[%l7 + 0x78]
loop_2642:
	movl	%icc,	%o5,	%l6
	udivx	%o1,	0x175E,	%g3
loop_2643:
	tvc	%icc,	0x2
	alignaddr	%l0,	%l3,	%g5
	sub	%l2,	0x0EDB,	%o4
	tcs	%icc,	0x3
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x09] %asi,	%i6
	xor	%g4,	0x070E,	%g6
	movre	%i7,	%l1,	%o2
	xnor	%o0,	%i2,	%l5
	subccc	%o3,	0x148F,	%g7
	popc	%i0,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i4,	%i1
	srlx	%i5,	0x1E,	%o6
	srlx	%g1,	%g2,	%l4
	edge16l	%i3,	%o5,	%o1
	fpadd32	%f12,	%f0,	%f2
	sdiv	%g3,	0x04BF,	%l0
	mulscc	%l3,	%g5,	%l6
	nop
	set	0x30, %i4
	ldsw	[%l7 + %i4],	%o4
	edge16ln	%l2,	%g4,	%i6
	set	0x60, %i7
	ldswa	[%l7 + %i7] 0x18,	%g6
	wr	%g0,	0x2b,	%asi
	stwa	%i7,	[%l7 + 0x34] %asi
	membar	#Sync
	edge8	%l1,	%o0,	%i2
	alignaddrl	%o2,	%l5,	%o3
	fpack32	%f24,	%f6,	%f4
	taddcc	%g7,	%i0,	%i4
	brz,a	%o7,	loop_2644
	fmovsvc	%icc,	%f4,	%f4
	movrne	%i5,	0x1C1,	%i1
	bvc,a	%xcc,	loop_2645
loop_2644:
	subc	%g1,	0x1A79,	%o6
	ta	%xcc,	0x2
	orcc	%l4,	0x0406,	%g2
loop_2645:
	edge8n	%o5,	%i3,	%o1
	flush	%l7 + 0x48
	std	%f22,	[%l7 + 0x10]
	addcc	%g3,	0x00FE,	%l0
	fone	%f12
	wr	%g0,	0x19,	%asi
	stxa	%g5,	[%l7 + 0x08] %asi
	fcmpeq16	%f12,	%f20,	%l6
	edge32	%l3,	%o4,	%g4
	fnot2	%f24,	%f28
	tvs	%xcc,	0x2
	umulcc	%i6,	0x14E1,	%g6
	movrne	%l2,	0x0DB,	%l1
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x1f
	membar	#Sync
	sdiv	%i7,	0x08C0,	%i2
	fcmpne16	%f12,	%f16,	%o0
	tleu	%xcc,	0x4
	fmovsvc	%icc,	%f0,	%f16
	stb	%o2,	[%l7 + 0x44]
	movcc	%xcc,	%o3,	%l5
	tge	%xcc,	0x5
	fxnor	%f16,	%f10,	%f16
	te	%xcc,	0x7
	fcmpne16	%f22,	%f0,	%g7
	orcc	%i4,	0x0ECC,	%i0
	move	%icc,	%o7,	%i5
	array8	%i1,	%g1,	%o6
	movpos	%xcc,	%l4,	%o5
	ldsh	[%l7 + 0x26],	%g2
	bvc,a	%icc,	loop_2646
	edge8ln	%i3,	%g3,	%o1
	movl	%icc,	%g5,	%l6
	orcc	%l0,	%l3,	%o4
loop_2646:
	srax	%i6,	0x13,	%g4
	fxnor	%f20,	%f8,	%f6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g6,	%l1
	tcc	%xcc,	0x4
	movneg	%icc,	%l2,	%i2
	mova	%xcc,	%o0,	%o2
	fnot1s	%f18,	%f20
	ld	[%l7 + 0x60],	%f0
	brz	%o3,	loop_2647
	fsrc1s	%f21,	%f2
	bpos,pn	%icc,	loop_2648
	fandnot2	%f28,	%f18,	%f10
loop_2647:
	tge	%xcc,	0x4
	tcc	%xcc,	0x6
loop_2648:
	fmovs	%f17,	%f16
	edge32	%l5,	%i7,	%g7
	fbn,a	%fcc3,	loop_2649
	subcc	%i4,	%o7,	%i5
	edge32n	%i1,	%i0,	%o6
	fpadd32	%f0,	%f30,	%f4
loop_2649:
	tsubcc	%l4,	%o5,	%g2
	fmul8x16al	%f25,	%f12,	%f6
	fmovrde	%i3,	%f30,	%f20
	fornot1	%f28,	%f20,	%f14
	andn	%g1,	%g3,	%g5
	edge32l	%o1,	%l0,	%l6
	fbn	%fcc0,	loop_2650
	orncc	%o4,	%i6,	%l3
	movgu	%icc,	%g4,	%l1
	smul	%g6,	%i2,	%o0
loop_2650:
	tg	%xcc,	0x0
	fmul8ulx16	%f24,	%f30,	%f12
	add	%o2,	0x0A7F,	%l2
	tle	%xcc,	0x6
	tneg	%icc,	0x3
	edge32n	%o3,	%l5,	%i7
	set	0x50, %o7
	ldsha	[%l7 + %o7] 0x18,	%i4
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x10] %asi,	%g7
	move	%icc,	%i5,	%i1
	alignaddrl	%o7,	%i0,	%o6
	fmul8x16au	%f17,	%f15,	%f20
	tl	%icc,	0x0
	fnot2	%f12,	%f30
	tneg	%icc,	0x3
	nop
	fitod	%f10,	%f8
	fdtoi	%f8,	%f17
	fmovdvc	%icc,	%f28,	%f7
	srl	%o5,	0x15,	%l4
	prefetch	[%l7 + 0x60],	 0x3
	set	0x3A, %g2
	lduha	[%l7 + %g2] 0x04,	%g2
	edge32l	%g1,	%g3,	%i3
	bg,pn	%xcc,	loop_2651
	add	%o1,	0x0706,	%l0
	andn	%g5,	0x0146,	%o4
	fmovsge	%icc,	%f7,	%f2
loop_2651:
	edge16ln	%i6,	%l6,	%l3
	bvc	loop_2652
	brlz,a	%l1,	loop_2653
	tpos	%icc,	0x0
	movleu	%icc,	%g6,	%i2
loop_2652:
	fsrc2s	%f7,	%f27
loop_2653:
	movleu	%icc,	%o0,	%g4
	stw	%l2,	[%l7 + 0x08]
	set	0x3A, %o6
	stha	%o2,	[%l7 + %o6] 0x15
	bne,pt	%xcc,	loop_2654
	nop
	setx loop_2655, %l0, %l1
	jmpl %l1, %o3
	edge16ln	%i7,	%i4,	%g7
	move	%xcc,	%l5,	%i1
loop_2654:
	srl	%o7,	%i5,	%i0
loop_2655:
	st	%f5,	[%l7 + 0x6C]
	nop
	setx	loop_2656,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%o6,	%o5,	%l4
	xnor	%g2,	0x152D,	%g1
	edge8	%g3,	%o1,	%i3
loop_2656:
	lduh	[%l7 + 0x3A],	%l0
	movcc	%xcc,	%g5,	%i6
	fnands	%f9,	%f7,	%f29
	fmovrsgez	%l6,	%f19,	%f24
	smul	%o4,	%l1,	%g6
	brlz,a	%l3,	loop_2657
	edge16l	%o0,	%i2,	%g4
	fbu,a	%fcc1,	loop_2658
	edge16l	%l2,	%o3,	%i7
loop_2657:
	fbne	%fcc2,	loop_2659
	tvc	%xcc,	0x3
loop_2658:
	bne,a,pn	%icc,	loop_2660
	movrlez	%i4,	%g7,	%o2
loop_2659:
	tleu	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2660:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l5,	%o7,	%i5
	orncc	%i1,	0x0B50,	%o6
	sir	0x06B7
	fblg,a	%fcc3,	loop_2661
	ldsb	[%l7 + 0x3B],	%i0
	edge32	%l4,	%o5,	%g2
	array16	%g3,	%g1,	%o1
loop_2661:
	fcmpne32	%f10,	%f14,	%i3
	fnot1	%f4,	%f4
	sll	%l0,	0x1C,	%i6
	srax	%g5,	0x1C,	%l6
	fmovsgu	%xcc,	%f8,	%f10
	edge32	%l1,	%g6,	%l3
	fmovsa	%icc,	%f19,	%f26
	xor	%o0,	%o4,	%i2
	edge32n	%g4,	%l2,	%o3
	fbn,a	%fcc3,	loop_2662
	ldsb	[%l7 + 0x1A],	%i4
	movcs	%icc,	%i7,	%o2
	mulscc	%g7,	%l5,	%i5
loop_2662:
	brz,a	%o7,	loop_2663
	fble,a	%fcc2,	loop_2664
	fbe	%fcc0,	loop_2665
	fmovdcc	%xcc,	%f25,	%f19
loop_2663:
	movgu	%xcc,	%o6,	%i1
loop_2664:
	edge8l	%i0,	%o5,	%l4
loop_2665:
	nop
	set	0x2C, %o2
	ldswa	[%l7 + %o2] 0x88,	%g2
	fba,a	%fcc0,	loop_2666
	edge8ln	%g3,	%g1,	%i3
	ld	[%l7 + 0x7C],	%f25
	add	%o1,	0x105E,	%l0
loop_2666:
	movcc	%icc,	%g5,	%i6
	fmovdpos	%xcc,	%f26,	%f26
	swap	[%l7 + 0x44],	%l1
	fornot1s	%f19,	%f16,	%f20
	addc	%l6,	0x0425,	%g6
	subcc	%l3,	%o4,	%o0
	taddcc	%g4,	%i2,	%l2
	tleu	%xcc,	0x6
	brgz,a	%o3,	loop_2667
	fnot1	%f12,	%f2
	fors	%f11,	%f11,	%f24
	sllx	%i4,	%o2,	%i7
loop_2667:
	nop
	setx	loop_2668,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x5
	ba,a,pt	%xcc,	loop_2669
loop_2668:
	mulx	%g7,	0x0744,	%l5
	tneg	%icc,	0x3
	or	%o7,	0x1AFD,	%o6
loop_2669:
	movcs	%icc,	%i5,	%i1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x24] %asi,	%o5
	andncc	%l4,	%g2,	%i0
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x30] %asi,	%g1
	movneg	%xcc,	%g3,	%i3
	fbe,a	%fcc3,	loop_2670
	udivcc	%l0,	0x0A20,	%g5
	fpsub16s	%f25,	%f1,	%f29
	stx	%o1,	[%l7 + 0x70]
loop_2670:
	addc	%i6,	0x1A84,	%l1
	fbo	%fcc3,	loop_2671
	edge16n	%g6,	%l3,	%o4
	fmovsn	%icc,	%f29,	%f1
	tle	%icc,	0x2
loop_2671:
	bvs,a,pn	%icc,	loop_2672
	taddcctv	%l6,	%o0,	%i2
	orcc	%l2,	%o3,	%g4
	xor	%i4,	0x0BED,	%o2
loop_2672:
	nop
	setx	0xEA2EB3B4F709961C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x82BE1D398845A342,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f18,	%f6
	sra	%i7,	0x19,	%l5
	brlez,a	%g7,	loop_2673
	fbn	%fcc1,	loop_2674
	brgz,a	%o7,	loop_2675
	fxors	%f26,	%f14,	%f26
loop_2673:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x25] %asi,	%i5
loop_2674:
	tsubcctv	%i1,	%o5,	%l4
loop_2675:
	sdivx	%o6,	0x16F2,	%i0
	tg	%xcc,	0x7
	movle	%xcc,	%g1,	%g3
	srlx	%i3,	%g2,	%g5
	sethi	0x010E,	%o1
	add	%l0,	0x1987,	%l1
	tneg	%icc,	0x3
	fmovdcs	%xcc,	%f26,	%f7
	tsubcc	%i6,	0x1E4F,	%g6
	brgz	%l3,	loop_2676
	fabss	%f8,	%f11
	set	0x70, %g7
	ldda	[%l7 + %g7] 0xea,	%o4
loop_2676:
	fcmpgt16	%f6,	%f14,	%l6
	subcc	%o0,	0x07CD,	%i2
	subccc	%o3,	0x1A68,	%l2
	srlx	%i4,	0x13,	%g4
	tcs	%xcc,	0x5
	fornot1s	%f30,	%f28,	%f10
	fmul8x16	%f9,	%f14,	%f30
	fmovrsne	%i7,	%f25,	%f26
	fbule,a	%fcc1,	loop_2677
	popc	0x090D,	%o2
	edge32n	%l5,	%g7,	%i5
	udiv	%i1,	0x1D83,	%o5
loop_2677:
	tl	%xcc,	0x3
	fornot1	%f16,	%f28,	%f0
	sdivcc	%o7,	0x1C1F,	%l4
	nop
	fitos	%f7,	%f0
	fstoi	%f0,	%f14
	movle	%icc,	%o6,	%g1
	andncc	%g3,	%i3,	%g2
	te	%icc,	0x3
	fmul8ulx16	%f20,	%f2,	%f24
	add	%g5,	0x1368,	%i0
	tl	%icc,	0x6
	fbl,a	%fcc2,	loop_2678
	movrgez	%l0,	0x10B,	%l1
	alignaddrl	%o1,	%g6,	%i6
	fornot1s	%f14,	%f0,	%f10
loop_2678:
	subccc	%o4,	%l6,	%o0
	tvc	%icc,	0x4
	call	loop_2679
	sir	0x0DC2
	fmovsn	%xcc,	%f2,	%f9
	stbar
loop_2679:
	fnot2	%f4,	%f2
	movpos	%xcc,	%i2,	%l3
	ldd	[%l7 + 0x78],	%l2
	edge8l	%o3,	%g4,	%i7
	movl	%xcc,	%i4,	%l5
	array32	%g7,	%i5,	%i1
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x64] %asi,	%f8
	movvc	%icc,	%o5,	%o7
	udivcc	%o2,	0x03C8,	%l4
	tneg	%xcc,	0x3
	udivx	%o6,	0x16ED,	%g1
	fmovspos	%icc,	%f25,	%f15
	brlz,a	%g3,	loop_2680
	movl	%xcc,	%g2,	%g5
	array16	%i3,	%i0,	%l0
	subccc	%o1,	%g6,	%l1
loop_2680:
	addc	%o4,	0x173C,	%i6
	edge16l	%l6,	%o0,	%l3
	std	%f24,	[%l7 + 0x18]
	fmul8x16	%f29,	%f10,	%f8
	nop
	fitos	%f1,	%f13
	fstox	%f13,	%f24
	fbo	%fcc1,	loop_2681
	sll	%i2,	%o3,	%l2
	fornot2s	%f9,	%f13,	%f27
	array16	%g4,	%i4,	%l5
loop_2681:
	array8	%g7,	%i7,	%i1
	fmovdcc	%icc,	%f3,	%f22
	tge	%xcc,	0x1
	or	%o5,	%i5,	%o7
	nop
	setx	0x1E1D5521,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x356F6D88,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f3,	%f12
	nop
	setx	0x5C2A8021,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f23
	brgz,a	%o2,	loop_2682
	subccc	%o6,	0x1C8A,	%l4
	sub	%g1,	0x1A16,	%g2
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f12
	fxtod	%f12,	%f6
loop_2682:
	edge16n	%g5,	%g3,	%i3
	array16	%i0,	%o1,	%g6
	tcs	%icc,	0x1
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x0c
	fexpand	%f7,	%f30
	brlz,a	%l0,	loop_2683
	alignaddr	%o4,	%i6,	%l1
	nop
	setx	0x8A105E1B022D4DB4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f30
	sdiv	%l6,	0x0B64,	%o0
loop_2683:
	srax	%i2,	0x08,	%o3
	fmovsa	%icc,	%f7,	%f14
	array8	%l2,	%g4,	%i4
	movge	%xcc,	%l5,	%g7
	andcc	%i7,	0x09B4,	%l3
	array16	%o5,	%i5,	%i1
	set	0x41, %i1
	ldsba	[%l7 + %i1] 0x81,	%o7
	fbn	%fcc1,	loop_2684
	move	%icc,	%o6,	%l4
	movleu	%xcc,	%g1,	%g2
	movrgez	%o2,	0x135,	%g3
loop_2684:
	fbl	%fcc3,	loop_2685
	umul	%i3,	0x059F,	%i0
	sdivcc	%o1,	0x0485,	%g6
	set	0x08, %g3
	sta	%f24,	[%l7 + %g3] 0x19
loop_2685:
	edge8l	%l0,	%g5,	%i6
	fands	%f0,	%f24,	%f6
	mova	%icc,	%o4,	%l6
	tneg	%xcc,	0x7
	fnors	%f31,	%f25,	%f7
	sir	0x0979
	bg	%xcc,	loop_2686
	fmovrse	%l1,	%f3,	%f23
	tl	%xcc,	0x3
	fnand	%f14,	%f8,	%f24
loop_2686:
	movvs	%xcc,	%i2,	%o0
	tgu	%icc,	0x5
	fmovscc	%icc,	%f8,	%f6
	xnorcc	%l2,	0x125A,	%g4
	sllx	%o3,	0x0E,	%l5
	sllx	%g7,	%i4,	%i7
	tvs	%icc,	0x5
	movne	%icc,	%l3,	%o5
	set	0x70, %i6
	sta	%f7,	[%l7 + %i6] 0x19
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x41] %asi,	%i1
	tg	%xcc,	0x6
	fandnot1s	%f0,	%f14,	%f1
	edge32l	%o7,	%o6,	%i5
	subc	%g1,	0x1167,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o2,	%g3
	fbug	%fcc3,	loop_2687
	edge16l	%g2,	%i0,	%i3
	tl	%xcc,	0x7
	movne	%xcc,	%g6,	%o1
loop_2687:
	array16	%l0,	%g5,	%i6
	fmovscs	%icc,	%f8,	%f20
	movpos	%xcc,	%l6,	%o4
	subc	%l1,	0x03C7,	%o0
	xor	%l2,	0x1BC4,	%g4
	movneg	%xcc,	%o3,	%l5
	umulcc	%i2,	%g7,	%i4
	tvs	%icc,	0x1
	ld	[%l7 + 0x10],	%f21
	fbue	%fcc1,	loop_2688
	tvs	%icc,	0x0
	fnegs	%f24,	%f7
	xorcc	%l3,	0x1F72,	%o5
loop_2688:
	movcc	%xcc,	%i1,	%i7
	fbe,a	%fcc3,	loop_2689
	edge32n	%o7,	%o6,	%g1
	for	%f14,	%f6,	%f28
	movcc	%icc,	%i5,	%l4
loop_2689:
	fmovdleu	%xcc,	%f6,	%f1
	smul	%g3,	0x0E87,	%g2
	array16	%i0,	%o2,	%g6
	array8	%o1,	%i3,	%g5
	movrne	%l0,	0x0BB,	%l6
	movleu	%icc,	%i6,	%o4
	fpsub16s	%f4,	%f11,	%f28
	taddcc	%l1,	%o0,	%l2
	orn	%o3,	0x0EDF,	%g4
	bgu,a,pt	%xcc,	loop_2690
	tpos	%icc,	0x3
	tge	%icc,	0x3
	udiv	%l5,	0x0CF1,	%g7
loop_2690:
	movrgz	%i2,	%l3,	%o5
	movrgez	%i4,	%i1,	%o7
	edge32ln	%i7,	%g1,	%i5
	nop
	set	0x1B, %l4
	ldsb	[%l7 + %l4],	%l4
	edge8n	%g3,	%g2,	%o6
	nop
	setx	0x3B4661DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x803D2DBB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f17,	%f27
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x3F] %asi,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%g6,	%o1
	bneg,a	loop_2691
	tge	%icc,	0x2
	nop
	fitos	%f12,	%f16
	fstoi	%f16,	%f25
	bl,pt	%xcc,	loop_2692
loop_2691:
	nop
	setx	0xB64E5575305AE874,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	nop
	set	0x70, %l3
	ldx	[%l7 + %l3],	%i3
	orn	%o2,	0x0F4F,	%g5
loop_2692:
	fbu	%fcc3,	loop_2693
	fmovda	%icc,	%f4,	%f30
	tgu	%xcc,	0x3
	sethi	0x154E,	%l6
loop_2693:
	brlz	%i6,	loop_2694
	srl	%l0,	0x05,	%l1
	orn	%o4,	0x0853,	%l2
	edge32n	%o0,	%o3,	%l5
loop_2694:
	tle	%icc,	0x7
	fmovrdgez	%g4,	%f16,	%f16
	srl	%i2,	%l3,	%g7
	fnot1s	%f17,	%f8
	udivx	%i4,	0x1CFD,	%i1
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x60] %asi,	%f28
	fmovrdgz	%o5,	%f26,	%f16
	movrne	%i7,	%o7,	%i5
	taddcc	%g1,	%g3,	%l4
	fblg	%fcc1,	loop_2695
	fpsub32	%f6,	%f18,	%f0
	mulscc	%o6,	0x190D,	%i0
	tle	%xcc,	0x5
loop_2695:
	nop
	set	0x60, %g5
	lda	[%l7 + %g5] 0x11,	%f10
	nop
	setx	0x7C569886,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x2D0B798A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f11,	%f21
	ldd	[%l7 + 0x40],	%g6
	movvc	%xcc,	%g2,	%i3
	edge32	%o1,	%g5,	%o2
	st	%f22,	[%l7 + 0x1C]
	movvc	%icc,	%i6,	%l0
	movrlez	%l1,	%o4,	%l2
	tg	%xcc,	0x1
	fbge	%fcc3,	loop_2696
	ldx	[%l7 + 0x08],	%l6
	tne	%icc,	0x0
	tl	%icc,	0x7
loop_2696:
	bg,pn	%xcc,	loop_2697
	edge16ln	%o3,	%o0,	%g4
	call	loop_2698
	edge16n	%i2,	%l3,	%l5
loop_2697:
	bvs,pt	%icc,	loop_2699
	edge32n	%g7,	%i4,	%i1
loop_2698:
	andncc	%o5,	%i7,	%o7
	edge8ln	%g1,	%i5,	%l4
loop_2699:
	edge16n	%o6,	%i0,	%g3
	movne	%xcc,	%g6,	%g2
	sra	%i3,	0x1D,	%o1
	movgu	%icc,	%g5,	%o2
	fpack16	%f14,	%f10
	fxor	%f6,	%f26,	%f22
	movrne	%i6,	0x389,	%l0
	nop
	setx	0x9B656594B52EE0FB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x6FF8D3EF0C1D1854,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f20,	%f4
	orncc	%l1,	%o4,	%l6
	edge8	%o3,	%l2,	%o0
	nop
	fitod	%f12,	%f18
	fdtoi	%f18,	%f1
	ta	%icc,	0x1
	ldd	[%l7 + 0x28],	%i2
	fcmpne32	%f24,	%f6,	%g4
	fones	%f10
	edge32	%l3,	%g7,	%l5
	movn	%xcc,	%i1,	%o5
	subcc	%i7,	%o7,	%g1
	nop
	setx	loop_2700,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%i5,	%l4,	%o6
	nop
	setx loop_2701, %l0, %l1
	jmpl %l1, %i0
	orn	%i4,	0x0C1D,	%g6
loop_2700:
	te	%xcc,	0x1
	tne	%icc,	0x6
loop_2701:
	bl	loop_2702
	edge16	%g2,	%g3,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne,a	%fcc3,	loop_2703
loop_2702:
	movvc	%xcc,	%o1,	%g5
	fmovdn	%xcc,	%f21,	%f18
	ldsb	[%l7 + 0x25],	%i6
loop_2703:
	mova	%icc,	%o2,	%l0
	and	%o4,	%l1,	%o3
	nop
	set	0x6E, %o5
	ldsh	[%l7 + %o5],	%l6
	srax	%o0,	0x10,	%i2
	tne	%icc,	0x7
	fmovse	%icc,	%f5,	%f12
	sdivx	%g4,	0x14C8,	%l3
	movg	%icc,	%g7,	%l5
	udiv	%l2,	0x1953,	%i1
	movg	%icc,	%i7,	%o5
	bge	loop_2704
	tsubcc	%g1,	%i5,	%l4
	fcmpgt16	%f30,	%f6,	%o6
	srlx	%o7,	0x06,	%i4
loop_2704:
	brnz,a	%i0,	loop_2705
	bcs,pn	%icc,	loop_2706
	fzeros	%f16
	lduh	[%l7 + 0x16],	%g2
loop_2705:
	smul	%g6,	%i3,	%g3
loop_2706:
	fpsub32	%f12,	%f4,	%f16
	fpmerge	%f18,	%f7,	%f26
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x11] %asi,	%g5
	brnz	%o1,	loop_2707
	fblg,a	%fcc2,	loop_2708
	sth	%o2,	[%l7 + 0x50]
	tne	%xcc,	0x6
loop_2707:
	movrne	%i6,	%o4,	%l0
loop_2708:
	brlez	%o3,	loop_2709
	nop
	set	0x5C, %g1
	lduw	[%l7 + %g1],	%l6
	nop
	setx	0x7EE950785D35BF44,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x53290CA5D811EE79,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f26,	%f8
	subccc	%l1,	0x1D1C,	%o0
loop_2709:
	fandnot1	%f8,	%f24,	%f0
	ba,a,pt	%icc,	loop_2710
	tcc	%xcc,	0x6
	taddcctv	%i2,	0x0A3A,	%l3
	movn	%icc,	%g7,	%g4
loop_2710:
	bgu	loop_2711
	ble,a,pn	%icc,	loop_2712
	tcc	%xcc,	0x6
	sdiv	%l5,	0x17C2,	%i1
loop_2711:
	fone	%f0
loop_2712:
	movne	%xcc,	%i7,	%l2
	movre	%o5,	0x025,	%i5
	array8	%g1,	%l4,	%o7
	flush	%l7 + 0x0C
	set	0x10, %o3
	stwa	%i4,	[%l7 + %o3] 0xe3
	membar	#Sync
	edge8	%o6,	%i0,	%g2
	mova	%icc,	%g6,	%g3
	ldsb	[%l7 + 0x72],	%i3
	set	0x11, %l5
	lduba	[%l7 + %l5] 0x15,	%o1
	tg	%xcc,	0x1
	srax	%o2,	0x0B,	%i6
	sub	%g5,	0x064A,	%l0
	fbu	%fcc2,	loop_2713
	fmul8x16	%f10,	%f20,	%f6
	add	%o3,	0x0BB4,	%l6
	taddcc	%l1,	%o0,	%i2
loop_2713:
	srax	%o4,	0x0D,	%l3
	movcc	%xcc,	%g4,	%l5
	tge	%xcc,	0x1
	nop
	setx	0x4F6D660F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x0FE72EC1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f25,	%f9
	movrne	%g7,	%i7,	%i1
	edge32n	%l2,	%i5,	%g1
	array16	%l4,	%o7,	%o5
	sth	%o6,	[%l7 + 0x3C]
	ta	%xcc,	0x2
	sethi	0x0AB9,	%i4
	alignaddrl	%g2,	%i0,	%g3
	sethi	0x1C19,	%i3
	orncc	%g6,	0x0556,	%o1
	tne	%xcc,	0x0
	tvc	%icc,	0x6
	fbge	%fcc3,	loop_2714
	fbe	%fcc1,	loop_2715
	fnands	%f11,	%f25,	%f1
	brz	%i6,	loop_2716
loop_2714:
	tpos	%icc,	0x2
loop_2715:
	fandnot1s	%f24,	%f18,	%f29
	movle	%icc,	%o2,	%g5
loop_2716:
	bshuffle	%f4,	%f6,	%f6
	fmovrdne	%l0,	%f2,	%f16
	fbu	%fcc3,	loop_2717
	array32	%l6,	%o3,	%o0
	movcc	%xcc,	%i2,	%l1
	edge8n	%o4,	%g4,	%l3
loop_2717:
	tleu	%icc,	0x0
	smulcc	%l5,	%i7,	%i1
	tle	%xcc,	0x7
	fpadd16	%f12,	%f14,	%f24
	membar	0x79
	sdivx	%l2,	0x0109,	%g7
	mova	%icc,	%i5,	%g1
	tleu	%xcc,	0x3
	sub	%l4,	0x1C9C,	%o5
	fbo	%fcc3,	loop_2718
	or	%o7,	0x13F1,	%o6
	movne	%icc,	%g2,	%i4
	sdivcc	%i0,	0x0A48,	%i3
loop_2718:
	fmovrdlez	%g6,	%f8,	%f6
	fbg,a	%fcc0,	loop_2719
	movrgez	%o1,	%g3,	%o2
	fpadd16s	%f2,	%f15,	%f10
	movvs	%icc,	%i6,	%g5
loop_2719:
	fpadd32	%f18,	%f0,	%f26
	sdivcc	%l0,	0x14D3,	%o3
	fnand	%f24,	%f30,	%f18
	set	0x30, %i0
	lduba	[%l7 + %i0] 0x11,	%l6
	sra	%i2,	0x0C,	%l1
	edge8l	%o4,	%g4,	%o0
	sdivx	%l3,	0x098C,	%i7
	tneg	%xcc,	0x6
	alignaddr	%i1,	%l5,	%g7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l2,	%g1
	umulcc	%i5,	%l4,	%o7
	umul	%o6,	0x0B0D,	%g2
	tvc	%icc,	0x2
	edge8n	%i4,	%o5,	%i0
	smul	%g6,	%o1,	%i3
	srax	%o2,	0x10,	%i6
	fmuld8sux16	%f29,	%f15,	%f12
	edge16n	%g5,	%l0,	%g3
	fmovrslez	%l6,	%f11,	%f26
	subc	%o3,	0x14C7,	%l1
	edge32ln	%i2,	%o4,	%g4
	orncc	%o0,	%i7,	%i1
	alignaddrl	%l5,	%g7,	%l2
	ldd	[%l7 + 0x78],	%g0
	add	%i5,	%l4,	%l3
	movg	%icc,	%o7,	%g2
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x1e
	membar	#Sync
	udiv	%o6,	0x1542,	%i4
	set	0x44, %i2
	swapa	[%l7 + %i2] 0x88,	%i0
	movvs	%icc,	%g6,	%o1
	movge	%icc,	%i3,	%o2
	stw	%o5,	[%l7 + 0x6C]
	fbne,a	%fcc1,	loop_2720
	edge32l	%g5,	%i6,	%l0
	fmul8ulx16	%f2,	%f28,	%f16
	edge16ln	%g3,	%o3,	%l6
loop_2720:
	umul	%i2,	0x1C24,	%l1
	fxors	%f30,	%f19,	%f0
	fabss	%f9,	%f10
	sub	%g4,	%o0,	%i7
	bge,a	%icc,	loop_2721
	movrgez	%i1,	%o4,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc1,	loop_2722
loop_2721:
	bcs,a	loop_2723
	fand	%f26,	%f6,	%f14
	set	0x70, %g6
	stxa	%l5,	[%l7 + %g6] 0x18
loop_2722:
	fpack32	%f28,	%f26,	%f26
loop_2723:
	edge8n	%l2,	%g1,	%i5
	fmovdvs	%icc,	%f25,	%f15
	bpos,a	loop_2724
	ta	%icc,	0x2
	sir	0x0495
	bn,pn	%xcc,	loop_2725
loop_2724:
	movge	%xcc,	%l3,	%l4
	movcs	%icc,	%o7,	%g2
	fmul8x16al	%f21,	%f5,	%f4
loop_2725:
	movre	%o6,	0x1F6,	%i0
	movvs	%icc,	%g6,	%i4
	nop
	setx	0x542E7900D3C11B97,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xEEDD55ED9C9B4104,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f0,	%f10
	addc	%i3,	0x01EE,	%o1
	fcmple16	%f2,	%f12,	%o2
	fmovsle	%xcc,	%f9,	%f3
	fmul8ulx16	%f22,	%f20,	%f8
	srlx	%g5,	0x1F,	%o5
	umul	%l0,	%g3,	%i6
	edge16n	%o3,	%l6,	%l1
	edge16l	%i2,	%g4,	%i7
	nop
	setx	0x16E8EDC4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x9C6AEA62,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f10,	%f18
	movn	%xcc,	%i1,	%o4
	umulcc	%g7,	0x00B8,	%l5
	move	%icc,	%o0,	%l2
	fmovscs	%icc,	%f22,	%f10
	orn	%g1,	0x1511,	%i5
	ldstub	[%l7 + 0x48],	%l3
	umulcc	%o7,	0x12A2,	%l4
	xor	%g2,	%o6,	%g6
	udivx	%i4,	0x1C60,	%i0
	nop
	setx	0xD7456A04,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x13138547,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f2,	%f29
	movvs	%icc,	%i3,	%o2
	orcc	%o1,	0x16D4,	%g5
	fbul	%fcc2,	loop_2726
	umulcc	%o5,	0x1755,	%l0
	bl,a,pn	%icc,	loop_2727
	addccc	%i6,	%g3,	%l6
loop_2726:
	xor	%l1,	%o3,	%g4
	movcc	%xcc,	%i7,	%i2
loop_2727:
	subc	%i1,	%o4,	%l5
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o0
	array32	%g7,	%g1,	%i5
	sra	%l2,	0x08,	%l3
	xnorcc	%l4,	%g2,	%o7
	lduw	[%l7 + 0x44],	%o6
	fmovrdne	%g6,	%f10,	%f18
	fmovsvs	%xcc,	%f0,	%f12
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f30
	te	%xcc,	0x0
	edge16	%i0,	%i4,	%o2
	bpos	loop_2728
	fmovdcc	%icc,	%f17,	%f13
	fbn	%fcc0,	loop_2729
	ld	[%l7 + 0x0C],	%f16
loop_2728:
	movvs	%icc,	%i3,	%o1
	alignaddr	%g5,	%l0,	%i6
loop_2729:
	fxnors	%f6,	%f31,	%f8
	mulx	%g3,	0x0BFF,	%o5
	mulscc	%l6,	%l1,	%o3
	subcc	%i7,	0x04A9,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g4,	%i1,	%o4
	tle	%xcc,	0x2
	movvs	%xcc,	%o0,	%l5
	lduh	[%l7 + 0x2E],	%g1
	nop
	setx loop_2730, %l0, %l1
	jmpl %l1, %g7
	tl	%xcc,	0x0
	fmul8ulx16	%f2,	%f18,	%f8
	tsubcctv	%i5,	%l2,	%l3
loop_2730:
	ba,pt	%xcc,	loop_2731
	tcs	%xcc,	0x1
	stx	%l4,	[%l7 + 0x38]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2731:
	fmovrsgz	%o7,	%f7,	%f28
	addcc	%g2,	%g6,	%i0
	tsubcctv	%i4,	0x1C9F,	%o2
	fmovspos	%xcc,	%f7,	%f27
	fpsub32	%f8,	%f26,	%f18
	addccc	%o6,	%o1,	%g5
	fpack32	%f10,	%f26,	%f16
	tvc	%icc,	0x5
	andncc	%i3,	%l0,	%i6
	tneg	%xcc,	0x4
	fpadd16	%f22,	%f10,	%f4
	sdivcc	%o5,	0x101E,	%g3
	fmovdneg	%xcc,	%f18,	%f21
	fbg	%fcc0,	loop_2732
	brgez	%l1,	loop_2733
	fblg	%fcc3,	loop_2734
	fones	%f19
loop_2732:
	tn	%xcc,	0x5
loop_2733:
	nop
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x11,	%f16
loop_2734:
	fabss	%f25,	%f22
	movrgez	%o3,	0x092,	%l6
	sllx	%i2,	%i7,	%i1
	tsubcc	%o4,	%g4,	%l5
	movne	%xcc,	%g1,	%o0
	movrgz	%i5,	%l2,	%l3
	brnz	%l4,	loop_2735
	ta	%xcc,	0x0
	brgz	%g7,	loop_2736
	bl,pn	%xcc,	loop_2737
loop_2735:
	edge32ln	%g2,	%g6,	%o7
	std	%f22,	[%l7 + 0x78]
loop_2736:
	srl	%i0,	%o2,	%o6
loop_2737:
	fmovrdlez	%i4,	%f30,	%f16
	fmovde	%xcc,	%f17,	%f13
	brnz	%g5,	loop_2738
	fmovrse	%i3,	%f19,	%f31
	edge8	%l0,	%o1,	%i6
	sll	%g3,	%o5,	%l1
loop_2738:
	edge32n	%o3,	%l6,	%i7
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x58] %asi,	%f8
	movvc	%xcc,	%i1,	%o4
	te	%xcc,	0x4
	fmovsneg	%icc,	%f2,	%f24
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	array16	%g4,	%i2,	%g1
	fmovrdgz	%o0,	%f28,	%f0
	edge32	%i5,	%l2,	%l3
	fbl,a	%fcc0,	loop_2739
	fpack16	%f2,	%f11
	tl	%xcc,	0x2
	fpsub32s	%f23,	%f30,	%f3
loop_2739:
	fcmple32	%f12,	%f2,	%l4
	taddcc	%l5,	0x1E86,	%g2
	movle	%xcc,	%g7,	%o7
	fmovdgu	%xcc,	%f12,	%f13
	array32	%g6,	%i0,	%o6
	edge32ln	%o2,	%i4,	%i3
	movrlz	%l0,	%o1,	%i6
	movvs	%xcc,	%g3,	%o5
	fnot1s	%f17,	%f14
	or	%l1,	%o3,	%l6
	fpadd32s	%f9,	%f17,	%f20
	tg	%icc,	0x7
	edge16n	%g5,	%i7,	%o4
	mova	%icc,	%g4,	%i1
	movneg	%icc,	%g1,	%i2
	orncc	%o0,	0x0F63,	%l2
	nop
	set	0x4C, %i3
	sth	%l3,	[%l7 + %i3]
	udivx	%i5,	0x16DA,	%l5
	xnorcc	%g2,	0x08AA,	%l4
	fsrc2	%f18,	%f20
	movgu	%icc,	%o7,	%g7
	movg	%xcc,	%i0,	%o6
	movpos	%xcc,	%o2,	%g6
	fbge,a	%fcc2,	loop_2740
	tvs	%icc,	0x1
	nop
	setx	0x779A98990D56CB1B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x50E6987CF67CDBD1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f18,	%f2
	srl	%i4,	0x08,	%l0
loop_2740:
	taddcctv	%i3,	%i6,	%o1
	fmovrdlz	%g3,	%f0,	%f20
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movrlz	%o5,	0x1D7,	%o3
	edge16	%l6,	%g5,	%i7
	umul	%o4,	0x1F06,	%l1
	andncc	%i1,	%g4,	%g1
	movrne	%o0,	%l2,	%i2
	movvc	%xcc,	%l3,	%i5
	udiv	%l5,	0x074A,	%l4
	add	%g2,	0x11A1,	%o7
	brgz	%g7,	loop_2741
	sub	%o6,	%o2,	%g6
	move	%xcc,	%i0,	%i4
	ble	%xcc,	loop_2742
loop_2741:
	te	%xcc,	0x0
	fmovsvc	%icc,	%f1,	%f11
	taddcctv	%i3,	0x13EF,	%i6
loop_2742:
	edge8ln	%o1,	%g3,	%l0
	prefetch	[%l7 + 0x20],	 0x1
	movrlz	%o3,	0x147,	%l6
	edge32l	%g5,	%o5,	%i7
	nop
	set	0x3D, %o1
	ldstub	[%l7 + %o1],	%o4
	sdiv	%l1,	0x1220,	%g4
	udiv	%i1,	0x1ED7,	%g1
	ldd	[%l7 + 0x78],	%f28
	tcc	%xcc,	0x6
	membar	0x0B
	edge8l	%l2,	%i2,	%o0
	ba	%xcc,	loop_2743
	ta	%xcc,	0x2
	tne	%xcc,	0x2
	fsrc2	%f14,	%f28
loop_2743:
	movleu	%icc,	%l3,	%i5
	tvc	%xcc,	0x7
	nop
	fitos	%f7,	%f20
	set	0x72, %l2
	stha	%l5,	[%l7 + %l2] 0x0c
	sethi	0x1643,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x04,	%asi
	stha	%o7,	[%l7 + 0x2C] %asi
	movrgz	%g7,	0x2EC,	%g2
	nop
	setx	0x8BED8F1E36B3541C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f14
	mova	%icc,	%o2,	%o6
	stb	%i0,	[%l7 + 0x36]
	set	0x46, %o4
	lduha	[%l7 + %o4] 0x0c,	%g6
	subcc	%i4,	%i6,	%o1
	fba,a	%fcc3,	loop_2744
	tleu	%xcc,	0x6
	movrgez	%i3,	0x04F,	%l0
	tleu	%icc,	0x0
loop_2744:
	sdivcc	%o3,	0x0019,	%l6
	edge16	%g3,	%g5,	%i7
	fmul8sux16	%f0,	%f2,	%f24
	nop
	setx	0x212F7213,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xAC8E5CE2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f28,	%f20
	stx	%o4,	[%l7 + 0x68]
	tvc	%icc,	0x3
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x70] %asi,	%l0
	nop
	fitos	%f14,	%f21
	fstox	%f21,	%f30
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x80,	 0x0
	fmovs	%f5,	%f17
	udivx	%i1,	0x16D3,	%g1
	orcc	%g4,	%l2,	%o0
	nop
	fitod	%f4,	%f2
	fdtos	%f2,	%f31
	movrlez	%l3,	%i2,	%l5
	be,pn	%icc,	loop_2745
	tcc	%icc,	0x2
	set	0x10, %i4
	ldxa	[%g0 + %i4] 0x21,	%l4
loop_2745:
	bge,a,pn	%icc,	loop_2746
	fmovrdne	%o7,	%f8,	%f22
	edge16	%i5,	%g7,	%g2
	tleu	%icc,	0x1
loop_2746:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o6,	%o2,	%i0
	taddcc	%g6,	0x016E,	%i6
	tne	%xcc,	0x4
	mova	%xcc,	%o1,	%i3
	ble,a	%icc,	loop_2747
	subccc	%i4,	%l0,	%l6
	addcc	%o3,	%g5,	%g3
	te	%xcc,	0x5
loop_2747:
	tne	%icc,	0x1
	bvc,a	%xcc,	loop_2748
	brgz,a	%i7,	loop_2749
	nop
	setx	loop_2750,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sir	0x11F0
loop_2748:
	fnot1s	%f0,	%f11
loop_2749:
	nop
	fitos	%f12,	%f4
	fstoi	%f4,	%f5
loop_2750:
	fpackfix	%f10,	%f5
	orncc	%o4,	0x0CC5,	%o5
	movrgz	%i1,	%g1,	%l1
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x15,	%g4
	move	%xcc,	%o0,	%l3
	movrlz	%i2,	%l5,	%l4
	edge32ln	%o7,	%i5,	%g7
	fnot1s	%f19,	%f22
	movcc	%xcc,	%g2,	%l2
	call	loop_2751
	lduh	[%l7 + 0x5A],	%o2
	movrlez	%i0,	0x2CF,	%g6
	movleu	%xcc,	%o6,	%i6
loop_2751:
	fmovdle	%icc,	%f4,	%f19
	movre	%o1,	0x278,	%i4
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x42] %asi,	%i3
	fba	%fcc2,	loop_2752
	tsubcctv	%l6,	0x040D,	%l0
	fba,a	%fcc3,	loop_2753
	fmovscc	%icc,	%f13,	%f19
loop_2752:
	nop
	set	0x33, %o0
	ldstuba	[%l7 + %o0] 0x10,	%g5
loop_2753:
	movg	%xcc,	%g3,	%o3
	orncc	%i7,	%o5,	%i1
	fbg	%fcc0,	loop_2754
	membar	0x2C
	tn	%icc,	0x1
	set	0x5C, %l1
	ldswa	[%l7 + %l1] 0x80,	%g1
loop_2754:
	fabss	%f2,	%f30
	tsubcctv	%l1,	%o4,	%g4
	or	%o0,	%i2,	%l3
	sub	%l5,	%l4,	%i5
	fmul8x16au	%f18,	%f19,	%f0
	movrne	%o7,	%g7,	%l2
	edge16l	%g2,	%o2,	%i0
	edge32ln	%o6,	%i6,	%o1
	addc	%i4,	0x080C,	%i3
	tge	%icc,	0x6
	movrgz	%g6,	0x2E1,	%l0
	fmovdvs	%xcc,	%f26,	%f17
	nop
	set	0x31, %o7
	ldsb	[%l7 + %o7],	%g5
	sdiv	%l6,	0x02D3,	%g3
	movrgez	%o3,	0x239,	%i7
	movrne	%o5,	%g1,	%i1
	bcc	%xcc,	loop_2755
	xor	%o4,	0x1A7B,	%g4
	edge32ln	%o0,	%l1,	%i2
	andncc	%l3,	%l5,	%i5
loop_2755:
	umulcc	%o7,	%g7,	%l4
	bcc,pt	%xcc,	loop_2756
	fmovrde	%g2,	%f22,	%f14
	ldstub	[%l7 + 0x4E],	%o2
	sdivcc	%l2,	0x16BD,	%i0
loop_2756:
	fmovspos	%xcc,	%f31,	%f6
	xor	%i6,	0x1096,	%o1
	udivx	%i4,	0x1D75,	%o6
	array32	%i3,	%l0,	%g6
	tcc	%xcc,	0x1
	fpadd32	%f14,	%f6,	%f16
	membar	0x6F
	fzeros	%f6
	edge8n	%g5,	%g3,	%o3
	tcc	%icc,	0x6
	fcmpne32	%f12,	%f6,	%l6
	edge8n	%o5,	%i7,	%i1
	edge8n	%o4,	%g4,	%o0
	tcs	%xcc,	0x6
	fbule,a	%fcc0,	loop_2757
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f10,	%f24
	tcc	%icc,	0x4
loop_2757:
	or	%l1,	0x0ED9,	%i2
	fzero	%f28
	popc	0x0790,	%l3
	nop
	fitod	%f9,	%f2
	tl	%xcc,	0x0
	xor	%l5,	0x183B,	%g1
	fmovda	%xcc,	%f28,	%f2
	wr	%g0,	0xea,	%asi
	stxa	%i5,	[%l7 + 0x50] %asi
	membar	#Sync
	movcs	%icc,	%g7,	%o7
	xnor	%l4,	%g2,	%o2
	set	0x54, %g2
	swapa	[%l7 + %g2] 0x10,	%l2
	fpmerge	%f29,	%f4,	%f22
	fmovrse	%i0,	%f25,	%f30
	ldub	[%l7 + 0x6D],	%i6
	subc	%i4,	%o1,	%i3
	addccc	%o6,	%l0,	%g5
	fcmpgt16	%f30,	%f28,	%g6
	fmovsleu	%xcc,	%f24,	%f29
	brz,a	%g3,	loop_2758
	movle	%icc,	%l6,	%o5
	fpadd32	%f8,	%f28,	%f2
	taddcctv	%i7,	%i1,	%o4
loop_2758:
	mulscc	%g4,	0x18E9,	%o0
	tg	%icc,	0x7
	fmovsa	%xcc,	%f16,	%f18
	fbn,a	%fcc0,	loop_2759
	tcc	%icc,	0x2
	be,pt	%icc,	loop_2760
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2759:
	udivcc	%o3,	0x1E48,	%i2
	bvc,a	loop_2761
loop_2760:
	subc	%l1,	%l3,	%g1
	alignaddrl	%l5,	%i5,	%g7
	fbne	%fcc3,	loop_2762
loop_2761:
	tle	%xcc,	0x1
	fbo,a	%fcc3,	loop_2763
	tg	%xcc,	0x1
loop_2762:
	fbg,a	%fcc0,	loop_2764
	srlx	%l4,	0x07,	%o7
loop_2763:
	edge8ln	%g2,	%l2,	%i0
	popc	%i6,	%i4
loop_2764:
	fbo,a	%fcc0,	loop_2765
	umul	%o2,	0x1BE5,	%i3
	tle	%xcc,	0x5
	fbge	%fcc2,	loop_2766
loop_2765:
	tn	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn	%fcc3,	loop_2767
loop_2766:
	mulx	%o1,	%l0,	%g5
	fmovsn	%xcc,	%f19,	%f14
	movne	%icc,	%o6,	%g6
loop_2767:
	nop
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	or	%g3,	0x145A,	%o5
	tcc	%icc,	0x7
	umul	%i7,	%l6,	%i1
	movgu	%icc,	%o4,	%o0
	bl,a	loop_2768
	edge8ln	%g4,	%i2,	%o3
	move	%icc,	%l3,	%l1
	fmovrsgz	%l5,	%f21,	%f17
loop_2768:
	movn	%xcc,	%i5,	%g7
	andcc	%l4,	%o7,	%g1
	xorcc	%l2,	%g2,	%i0
	xorcc	%i6,	0x0E91,	%i4
	or	%i3,	%o1,	%o2
	udivx	%l0,	0x1E2A,	%g5
	xnor	%o6,	%g3,	%o5
	fmovsneg	%icc,	%f3,	%f1
	brlz,a	%i7,	loop_2769
	addccc	%g6,	0x1D1B,	%l6
	andncc	%o4,	%o0,	%i1
	tcs	%icc,	0x0
loop_2769:
	movrlez	%g4,	0x28D,	%i2
	xor	%l3,	0x1570,	%o3
	tcc	%xcc,	0x7
	fabss	%f17,	%f31
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x40] %asi,	%l1
	fnot1	%f22,	%f6
	movvs	%xcc,	%i5,	%g7
	sll	%l5,	%l4,	%g1
	tsubcctv	%l2,	0x0A2C,	%o7
	move	%xcc,	%i0,	%i6
	mulx	%g2,	0x119C,	%i3
	movcc	%icc,	%o1,	%o2
	fbuge,a	%fcc1,	loop_2770
	nop
	fitos	%f2,	%f5
	fstoi	%f5,	%f20
	fzeros	%f17
	fmovsl	%xcc,	%f17,	%f1
loop_2770:
	fbne	%fcc1,	loop_2771
	udiv	%i4,	0x0674,	%l0
	sethi	0x0F44,	%g5
	tneg	%xcc,	0x6
loop_2771:
	tcc	%xcc,	0x0
	movgu	%icc,	%g3,	%o6
	movge	%xcc,	%o5,	%i7
	fornot2	%f30,	%f4,	%f18
	ldstub	[%l7 + 0x71],	%g6
	and	%o4,	0x03B4,	%o0
	set	0x18, %o6
	stxa	%i1,	[%l7 + %o6] 0x89
	edge16ln	%l6,	%g4,	%i2
	tsubcc	%o3,	%l1,	%i5
	fmovsvc	%xcc,	%f1,	%f4
	swap	[%l7 + 0x4C],	%l3
	fmovdpos	%xcc,	%f9,	%f0
	tvc	%xcc,	0x1
	ba,a,pt	%xcc,	loop_2772
	nop
	setx	loop_2773,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%l5,	0x0B79,	%l4
	tg	%icc,	0x3
loop_2772:
	popc	%g1,	%l2
loop_2773:
	addccc	%g7,	%i0,	%o7
	addc	%i6,	0x142B,	%g2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%i3
	nop
	setx loop_2774, %l0, %l1
	jmpl %l1, %o1
	fandnot2s	%f30,	%f28,	%f10
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x38] %asi,	%f25
loop_2774:
	subcc	%i4,	%o2,	%l0
	fpadd16	%f8,	%f18,	%f4
	mulscc	%g5,	%o6,	%o5
	stw	%i7,	[%l7 + 0x18]
	edge8n	%g3,	%g6,	%o0
	sdivx	%o4,	0x13DE,	%l6
	udivx	%g4,	0x024B,	%i1
	movle	%xcc,	%i2,	%l1
	fmuld8sux16	%f10,	%f6,	%f4
	edge8n	%o3,	%l3,	%i5
	orncc	%l5,	%l4,	%l2
	fcmpne16	%f14,	%f20,	%g1
	bcc,a	loop_2775
	tge	%xcc,	0x3
	movg	%xcc,	%g7,	%i0
	ldsw	[%l7 + 0x20],	%i6
loop_2775:
	fpadd16	%f10,	%f20,	%f30
	ldd	[%l7 + 0x30],	%f4
	fmovrdgz	%g2,	%f14,	%f2
	tsubcc	%i3,	%o1,	%o7
	xorcc	%o2,	%i4,	%g5
	edge8l	%o6,	%o5,	%i7
	orn	%g3,	%l0,	%g6
	fabss	%f26,	%f24
	std	%f10,	[%l7 + 0x60]
	ldub	[%l7 + 0x48],	%o0
	nop
	set	0x38, %o2
	std	%f22,	[%l7 + %o2]
	add	%o4,	0x06C7,	%l6
	smul	%i1,	0x068E,	%i2
	edge8	%l1,	%g4,	%l3
	array8	%o3,	%l5,	%i5
	stx	%l2,	[%l7 + 0x38]
	orn	%g1,	0x028D,	%l4
	udivcc	%i0,	0x0493,	%i6
	tpos	%xcc,	0x6
	move	%icc,	%g2,	%i3
	fandnot1s	%f29,	%f24,	%f5
	movcc	%icc,	%o1,	%g7
	or	%o2,	%o7,	%g5
	brgz	%o6,	loop_2776
	bpos,pt	%icc,	loop_2777
	nop
	setx	0xD07B4B9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	movl	%xcc,	%o5,	%i7
loop_2776:
	mova	%icc,	%i4,	%g3
loop_2777:
	umul	%l0,	0x1696,	%o0
	tsubcctv	%g6,	%l6,	%i1
	ldstub	[%l7 + 0x76],	%i2
	movvc	%icc,	%o4,	%l1
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x0D] %asi,	%l3
	xnorcc	%g4,	%l5,	%o3
	fbug	%fcc1,	loop_2778
	tvc	%xcc,	0x4
	or	%l2,	0x12FB,	%g1
	bgu,a,pt	%icc,	loop_2779
loop_2778:
	or	%i5,	%l4,	%i0
	nop
	setx loop_2780, %l0, %l1
	jmpl %l1, %i6
	movneg	%xcc,	%i3,	%o1
loop_2779:
	udivcc	%g7,	0x111B,	%o2
	edge32	%g2,	%g5,	%o7
loop_2780:
	tcc	%xcc,	0x2
	srl	%o6,	%i7,	%o5
	movrgz	%i4,	0x38A,	%l0
	be,a	%icc,	loop_2781
	fcmpgt16	%f30,	%f28,	%o0
	sra	%g3,	0x00,	%g6
	fmovdle	%xcc,	%f10,	%f22
loop_2781:
	bneg,a	loop_2782
	fbul	%fcc0,	loop_2783
	orncc	%l6,	%i1,	%i2
	taddcc	%o4,	0x15E2,	%l1
loop_2782:
	addc	%g4,	%l5,	%o3
loop_2783:
	subcc	%l2,	0x011B,	%l3
	fbne,a	%fcc1,	loop_2784
	xnor	%g1,	%l4,	%i0
	smul	%i5,	0x17F9,	%i6
	fmovdn	%icc,	%f15,	%f1
loop_2784:
	sll	%i3,	%g7,	%o2
	addccc	%g2,	0x0708,	%g5
	fcmple32	%f30,	%f16,	%o1
	fbg,a	%fcc2,	loop_2785
	fbuge	%fcc2,	loop_2786
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f30
	movrlz	%o6,	0x1B4,	%o7
loop_2785:
	tn	%icc,	0x2
loop_2786:
	tneg	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i7,	%i4,	%o5
	movle	%icc,	%o0,	%l0
	edge16l	%g3,	%g6,	%l6
	movl	%xcc,	%i2,	%o4
	movn	%icc,	%l1,	%i1
	wr	%g0,	0x81,	%asi
	stha	%g4,	[%l7 + 0x68] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%o3,	%l2
	tleu	%icc,	0x5
	bleu,a,pt	%xcc,	loop_2787
	tne	%xcc,	0x3
	mova	%icc,	%l5,	%g1
	mulscc	%l3,	%l4,	%i5
loop_2787:
	or	%i0,	%i3,	%g7
	fmovrsgez	%i6,	%f25,	%f14
	fbu	%fcc3,	loop_2788
	alignaddrl	%o2,	%g2,	%o1
	edge32	%g5,	%o7,	%i7
	fmovdneg	%icc,	%f17,	%f17
loop_2788:
	fmul8x16al	%f16,	%f27,	%f10
	taddcctv	%o6,	%i4,	%o5
	bneg,a	loop_2789
	smulcc	%o0,	0x1BF1,	%g3
	udivx	%l0,	0x1BF0,	%g6
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2789:
	fmovdne	%xcc,	%f3,	%f21
	xorcc	%i2,	%o4,	%l1
	orcc	%l6,	0x1D7F,	%i1
	nop
	setx	0x1FAA099E5944A51B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x904012F348E197DE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f16,	%f12
	movvs	%icc,	%g4,	%l2
	fmovrse	%l5,	%f27,	%f6
	edge16l	%o3,	%l3,	%g1
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%l4
	fmovrsgez	%i5,	%f22,	%f20
	sdivcc	%i3,	0x1352,	%g7
	fbe	%fcc1,	loop_2790
	stb	%i0,	[%l7 + 0x54]
	movrgz	%o2,	%i6,	%g2
	popc	%o1,	%o7
loop_2790:
	array8	%g5,	%i7,	%o6
	sllx	%i4,	0x07,	%o0
	fmovdleu	%icc,	%f2,	%f2
	movle	%icc,	%o5,	%l0
	sdivx	%g6,	0x0991,	%g3
	tsubcc	%o4,	%i2,	%l6
	pdist	%f20,	%f26,	%f18
	alignaddrl	%l1,	%g4,	%l2
	bneg,pn	%xcc,	loop_2791
	mulx	%l5,	%o3,	%l3
	fmovsl	%icc,	%f14,	%f31
	edge8ln	%g1,	%i1,	%i5
loop_2791:
	subccc	%l4,	%i3,	%i0
	tg	%xcc,	0x4
	edge8n	%g7,	%o2,	%i6
	ble	loop_2792
	movcc	%xcc,	%o1,	%g2
	sir	0x0403
	fmovdvs	%icc,	%f21,	%f15
loop_2792:
	nop
	fitos	%f12,	%f17
	fstod	%f17,	%f4
	tleu	%icc,	0x7
	xnorcc	%o7,	0x0975,	%i7
	movrlz	%o6,	%i4,	%g5
	nop
	setx	0x7182D24C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x0DE5E547,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f6,	%f14
	nop
	fitod	%f8,	%f18
	fdtos	%f18,	%f9
	lduw	[%l7 + 0x78],	%o0
	movrgez	%l0,	%o5,	%g3
	movgu	%xcc,	%g6,	%o4
	orcc	%l6,	%i2,	%g4
	subcc	%l2,	%l1,	%l5
	srlx	%o3,	%g1,	%i1
	tge	%xcc,	0x3
	stb	%l3,	[%l7 + 0x1F]
	taddcc	%l4,	%i3,	%i0
	taddcctv	%i5,	%g7,	%i6
	sra	%o1,	0x11,	%o2
	movvc	%xcc,	%o7,	%i7
	fmovdg	%xcc,	%f7,	%f4
	tcs	%icc,	0x7
	fbule	%fcc2,	loop_2793
	smulcc	%g2,	0x0078,	%o6
	xnor	%i4,	%g5,	%l0
	tge	%icc,	0x0
loop_2793:
	sub	%o0,	%g3,	%g6
	fmovscc	%xcc,	%f6,	%f25
	andncc	%o5,	%o4,	%l6
	set	0x2C, %g7
	lduwa	[%l7 + %g7] 0x88,	%i2
	fmovrdgz	%g4,	%f4,	%f4
	edge16n	%l2,	%l5,	%o3
	fble,a	%fcc0,	loop_2794
	addc	%g1,	%l1,	%i1
	edge8ln	%l4,	%i3,	%i0
	subccc	%l3,	0x1AF5,	%i5
loop_2794:
	movre	%g7,	%o1,	%i6
	xnorcc	%o7,	%i7,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%o6,	%i4
	udivx	%g5,	0x1E3B,	%l0
	tg	%xcc,	0x6
	tle	%icc,	0x7
	movrlez	%o0,	%o2,	%g3
	fmovrslez	%o5,	%f22,	%f2
	edge32n	%o4,	%g6,	%i2
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%l2
	bcc,pn	%xcc,	loop_2795
	fsrc1s	%f21,	%f5
	edge16	%l5,	%l6,	%g1
	fmovrse	%o3,	%f9,	%f29
loop_2795:
	movle	%icc,	%i1,	%l1
	set	0x0C, %g3
	stwa	%i3,	[%l7 + %g3] 0x2a
	membar	#Sync
	ldd	[%l7 + 0x40],	%i0
	nop
	setx loop_2796, %l0, %l1
	jmpl %l1, %l3
	stx	%l4,	[%l7 + 0x58]
	taddcc	%g7,	%i5,	%o1
	fmovrsgez	%o7,	%f27,	%f29
loop_2796:
	te	%icc,	0x2
	fbue	%fcc0,	loop_2797
	fmovrslz	%i6,	%f15,	%f2
	bge,pt	%icc,	loop_2798
	sra	%i7,	0x1C,	%g2
loop_2797:
	movre	%i4,	%o6,	%l0
	taddcctv	%g5,	%o0,	%o2
loop_2798:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x24],	 0x0
	movle	%icc,	%o5,	%o4
	tne	%icc,	0x5
	bshuffle	%f22,	%f26,	%f4
	edge32ln	%g3,	%i2,	%g6
	alignaddrl	%g4,	%l2,	%l5
	tneg	%icc,	0x3
	fandnot1s	%f8,	%f3,	%f18
	fornot1	%f16,	%f4,	%f28
	fble,a	%fcc2,	loop_2799
	fandnot2	%f24,	%f20,	%f2
	tcc	%icc,	0x5
	array32	%l6,	%o3,	%g1
loop_2799:
	andn	%l1,	%i3,	%i0
	sethi	0x0901,	%l3
	fnors	%f10,	%f16,	%f30
	edge16	%l4,	%g7,	%i1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%i5,	%o7
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tg	%icc,	0x5
	fornot2	%f30,	%f6,	%f26
	fbug,a	%fcc2,	loop_2800
	fmovdpos	%icc,	%f30,	%f19
	brz,a	%o1,	loop_2801
	fands	%f15,	%f11,	%f26
loop_2800:
	nop
	set	0x6C, %i1
	prefetch	[%l7 + %i1],	 0x1
	movn	%icc,	%i7,	%g2
loop_2801:
	fones	%f1
	fmovsvs	%xcc,	%f9,	%f9
	membar	0x21
	alignaddrl	%i6,	%o6,	%i4
	fbuge,a	%fcc1,	loop_2802
	nop
	setx	0x38BA2992006C9D36,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	bn	loop_2803
	nop
	set	0x5F, %l4
	ldsb	[%l7 + %l4],	%g5
loop_2802:
	edge16ln	%l0,	%o0,	%o5
	fcmpne16	%f0,	%f4,	%o4
loop_2803:
	movgu	%xcc,	%o2,	%i2
	udivx	%g3,	0x1802,	%g4
	array8	%l2,	%g6,	%l6
	edge16	%l5,	%g1,	%l1
	fsrc2s	%f30,	%f2
	ld	[%l7 + 0x74],	%f2
	fnor	%f12,	%f4,	%f26
	ldsb	[%l7 + 0x58],	%o3
	bneg	%icc,	loop_2804
	orncc	%i3,	%l3,	%l4
	srax	%i0,	%i1,	%g7
	sir	0x07C5
loop_2804:
	addcc	%o7,	0x1115,	%i5
	edge16	%i7,	%g2,	%i6
	array8	%o1,	%i4,	%o6
	addcc	%l0,	%o0,	%o5
	movleu	%xcc,	%o4,	%o2
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x81,	 0x2
	movrlez	%g3,	%g4,	%l2
	tne	%icc,	0x4
	sllx	%g6,	0x1D,	%l6
	tvc	%xcc,	0x2
	xor	%i2,	%l5,	%g1
	fmovsne	%icc,	%f18,	%f10
	fbn,a	%fcc0,	loop_2805
	udiv	%l1,	0x0587,	%o3
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x15,	%i3
loop_2805:
	tn	%xcc,	0x6
	orncc	%l3,	%i0,	%i1
	movleu	%icc,	%g7,	%o7
	fsrc2s	%f13,	%f24
	fmovd	%f26,	%f24
	movcs	%xcc,	%l4,	%i5
	subccc	%g2,	0x05EA,	%i6
	nop
	fitos	%f3,	%f27
	edge8	%o1,	%i4,	%i7
	sra	%l0,	0x00,	%o0
	fbuge	%fcc0,	loop_2806
	addcc	%o6,	0x13FC,	%o5
	movpos	%icc,	%o2,	%g5
	tleu	%icc,	0x4
loop_2806:
	edge8n	%g3,	%o4,	%g4
	sra	%g6,	%l6,	%i2
	edge8ln	%l2,	%g1,	%l1
	fandnot1s	%f23,	%f16,	%f22
	set	0x43, %g5
	ldstuba	[%l7 + %g5] 0x19,	%l5
	set	0x62, %o5
	ldsba	[%l7 + %o5] 0x19,	%i3
	ble,a,pn	%icc,	loop_2807
	smulcc	%o3,	0x14AF,	%i0
	sll	%l3,	0x1A,	%i1
	mova	%xcc,	%o7,	%l4
loop_2807:
	bleu,pt	%xcc,	loop_2808
	tcc	%icc,	0x4
	sra	%i5,	%g7,	%g2
	movrlez	%o1,	0x132,	%i6
loop_2808:
	andncc	%i7,	%l0,	%o0
	move	%xcc,	%o6,	%i4
	sdivcc	%o2,	0x11AC,	%o5
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x3C] %asi,	%g3
	fmovsne	%icc,	%f4,	%f14
	fmul8x16au	%f11,	%f18,	%f30
	sdivcc	%o4,	0x03A8,	%g4
	nop
	fitos	%f24,	%f1
	alignaddr	%g5,	%l6,	%g6
	ldsw	[%l7 + 0x78],	%l2
	fsrc1	%f4,	%f28
	andn	%i2,	%g1,	%l1
	fcmpeq16	%f30,	%f16,	%i3
	xorcc	%l5,	0x081F,	%i0
	and	%o3,	0x12A6,	%i1
	fornot1	%f26,	%f30,	%f14
	fbu,a	%fcc3,	loop_2809
	srax	%o7,	%l4,	%l3
	fmovrslz	%g7,	%f6,	%f24
	sdivcc	%i5,	0x1F4C,	%o1
loop_2809:
	mulx	%g2,	%i7,	%l0
	stw	%o0,	[%l7 + 0x38]
	udivx	%i6,	0x027F,	%i4
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f20
	fxtod	%f20,	%f14
	edge16ln	%o6,	%o2,	%o5
	bvs	%icc,	loop_2810
	tne	%xcc,	0x5
	edge8l	%g3,	%o4,	%g4
	sdivcc	%l6,	0x0154,	%g6
loop_2810:
	movcc	%xcc,	%g5,	%i2
	movcc	%xcc,	%g1,	%l1
	addccc	%l2,	0x0458,	%l5
	fpadd32	%f0,	%f4,	%f10
	tn	%xcc,	0x3
	movgu	%icc,	%i0,	%i3
	xorcc	%i1,	%o7,	%o3
	fmovrdgz	%l4,	%f8,	%f16
	andcc	%l3,	%i5,	%g7
	addccc	%g2,	0x053C,	%o1
	fcmpne32	%f8,	%f8,	%i7
	set	0x4C, %g1
	ldswa	[%l7 + %g1] 0x15,	%l0
	ldsw	[%l7 + 0x5C],	%o0
	movne	%icc,	%i6,	%i4
	ble	loop_2811
	fbg	%fcc0,	loop_2812
	fmovdvs	%icc,	%f31,	%f11
	tvs	%xcc,	0x0
loop_2811:
	umul	%o2,	%o5,	%g3
loop_2812:
	nop
	fitod	%f6,	%f20
	fdtoi	%f20,	%f26
	xnorcc	%o4,	0x1B61,	%g4
	srax	%l6,	%o6,	%g6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%g1
	fxnor	%f28,	%f0,	%f26
	fabss	%f21,	%f18
	ba	loop_2813
	movvs	%icc,	%g5,	%l2
	andn	%l5,	%l1,	%i0
	movrne	%i3,	%i1,	%o3
loop_2813:
	fmovsg	%icc,	%f28,	%f1
	orcc	%l4,	0x1A96,	%l3
	movge	%xcc,	%o7,	%i5
	xnor	%g7,	0x0B63,	%o1
	srl	%g2,	0x02,	%i7
	fcmpgt32	%f18,	%f8,	%l0
	xorcc	%i6,	0x1B3E,	%o0
	fbn,a	%fcc3,	loop_2814
	fpsub32s	%f7,	%f24,	%f20
	sllx	%o2,	%i4,	%o5
	edge16	%o4,	%g4,	%g3
loop_2814:
	nop
	set	0x60, %l5
	prefetcha	[%l7 + %l5] 0x19,	 0x2
	ba,pt	%icc,	loop_2815
	fpsub16	%f18,	%f10,	%f16
	edge8l	%g6,	%i2,	%g1
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f22
	fxtod	%f22,	%f28
loop_2815:
	fmul8sux16	%f12,	%f18,	%f14
	orncc	%o6,	%l2,	%g5
	ble,a	loop_2816
	movcs	%icc,	%l1,	%i0
	set	0x20, %i0
	lduwa	[%l7 + %i0] 0x18,	%l5
loop_2816:
	fbule,a	%fcc0,	loop_2817
	bneg	loop_2818
	xorcc	%i3,	0x08C3,	%o3
	edge16n	%i1,	%l4,	%l3
loop_2817:
	fbug,a	%fcc0,	loop_2819
loop_2818:
	fmovsgu	%xcc,	%f25,	%f4
	nop
	setx	loop_2820,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x38],	%f20
loop_2819:
	tpos	%xcc,	0x2
	fcmpgt16	%f6,	%f22,	%i5
loop_2820:
	udivcc	%g7,	0x0418,	%o7
	fnands	%f15,	%f19,	%f2
	fnand	%f20,	%f14,	%f26
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x30] %asi,	%g2
	mulx	%o1,	0x0C50,	%i7
	edge16	%i6,	%l0,	%o0
	nop
	fitod	%f12,	%f24
	fdtos	%f24,	%f31
	fble	%fcc3,	loop_2821
	array8	%i4,	%o2,	%o4
	fbn,a	%fcc2,	loop_2822
	fbug	%fcc0,	loop_2823
loop_2821:
	fbu,a	%fcc2,	loop_2824
	movrgez	%g4,	0x003,	%g3
loop_2822:
	bcs,a,pn	%icc,	loop_2825
loop_2823:
	edge8l	%o5,	%l6,	%i2
loop_2824:
	fpack32	%f20,	%f10,	%f8
	movleu	%icc,	%g1,	%o6
loop_2825:
	nop
	setx	loop_2826,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%l2,	%g5,	%l1
	sth	%i0,	[%l7 + 0x66]
	fbg	%fcc2,	loop_2827
loop_2826:
	bne,a	%icc,	loop_2828
	fbe	%fcc0,	loop_2829
	tneg	%icc,	0x5
loop_2827:
	fbu	%fcc3,	loop_2830
loop_2828:
	tvs	%icc,	0x0
loop_2829:
	fmovdcc	%xcc,	%f9,	%f25
	stw	%l5,	[%l7 + 0x3C]
loop_2830:
	stb	%g6,	[%l7 + 0x73]
	fones	%f9
	tne	%xcc,	0x3
	popc	0x1B35,	%o3
	brlez	%i3,	loop_2831
	taddcc	%i1,	%l3,	%i5
	taddcctv	%l4,	%g7,	%o7
	movrlz	%o1,	0x330,	%i7
loop_2831:
	nop
	set	0x5D, %o3
	lduba	[%l7 + %o3] 0x0c,	%i6
	subcc	%g2,	0x0A0A,	%l0
	nop
	set	0x28, %i2
	std	%f12,	[%l7 + %i2]
	fmovs	%f2,	%f6
	xnor	%i4,	0x04CC,	%o0
	fbg	%fcc3,	loop_2832
	fbue	%fcc0,	loop_2833
	nop
	setx	loop_2834,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%o4,	0x06,	%o2
loop_2832:
	nop
	fitos	%f11,	%f22
	fstod	%f22,	%f18
loop_2833:
	ldsw	[%l7 + 0x48],	%g4
loop_2834:
	array16	%g3,	%l6,	%i2
	or	%o5,	%o6,	%g1
	tcs	%xcc,	0x1
	umul	%g5,	0x1E3D,	%l2
	set	0x65, %g6
	stba	%l1,	[%l7 + %g6] 0x0c
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bg,a	%icc,	loop_2835
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%l5,	%i0
	andcc	%g6,	%i3,	%o3
loop_2835:
	ldstub	[%l7 + 0x5B],	%i1
	movleu	%icc,	%i5,	%l4
	lduw	[%l7 + 0x2C],	%l3
	tvs	%xcc,	0x4
	mova	%icc,	%o7,	%g7
	xor	%o1,	%i7,	%i6
	ldsw	[%l7 + 0x2C],	%g2
	movvc	%xcc,	%i4,	%l0
	be,a,pt	%xcc,	loop_2836
	sra	%o4,	%o0,	%o2
	ba,pn	%xcc,	loop_2837
	tl	%icc,	0x0
loop_2836:
	movre	%g3,	0x02E,	%l6
	sra	%g4,	0x1A,	%i2
loop_2837:
	sethi	0x0BC0,	%o6
	movl	%icc,	%o5,	%g1
	tg	%icc,	0x5
	fcmple32	%f18,	%f28,	%l2
	edge16l	%g5,	%l1,	%l5
	bcc	loop_2838
	srlx	%g6,	%i3,	%i0
	fbge,a	%fcc1,	loop_2839
	xor	%o3,	0x00FA,	%i1
loop_2838:
	movvc	%xcc,	%i5,	%l3
	fbe,a	%fcc1,	loop_2840
loop_2839:
	movrne	%o7,	%l4,	%g7
	sir	0x1E3F
	nop
	fitos	%f6,	%f26
	fstoi	%f26,	%f28
loop_2840:
	bvs,pt	%icc,	loop_2841
	popc	0x1053,	%i7
	fnor	%f10,	%f14,	%f24
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%f16
loop_2841:
	membar	0x7B
	add	%o1,	%i6,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l0,	%i4
	tleu	%icc,	0x6
	prefetch	[%l7 + 0x2C],	 0x1
	xor	%o4,	%o0,	%o2
	fbge	%fcc3,	loop_2842
	movvc	%icc,	%g3,	%g4
	fmovsne	%xcc,	%f16,	%f29
	fbue,a	%fcc0,	loop_2843
loop_2842:
	te	%xcc,	0x3
	movle	%icc,	%l6,	%i2
	edge8l	%o6,	%o5,	%l2
loop_2843:
	movcc	%icc,	%g5,	%g1
	udivx	%l1,	0x1C15,	%g6
	edge16ln	%l5,	%i0,	%o3
	edge16n	%i1,	%i5,	%l3
	sllx	%o7,	%i3,	%g7
	move	%icc,	%l4,	%o1
	subcc	%i6,	0x1FD2,	%g2
	fandnot1s	%f18,	%f4,	%f3
	fbo	%fcc0,	loop_2844
	tne	%xcc,	0x3
	fbl,a	%fcc3,	loop_2845
	sra	%i7,	0x16,	%l0
loop_2844:
	brgez,a	%o4,	loop_2846
	bshuffle	%f28,	%f8,	%f22
loop_2845:
	addc	%i4,	0x07C0,	%o2
	tpos	%xcc,	0x0
loop_2846:
	andncc	%g3,	%g4,	%o0
	sdiv	%l6,	0x0508,	%o6
	edge8n	%i2,	%o5,	%g5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x76] %asi,	%l2
	nop
	setx	0x8110A9FB207EA1DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tge	%icc,	0x4
	fbg,a	%fcc1,	loop_2847
	movrgz	%g1,	%g6,	%l5
	addc	%i0,	%l1,	%o3
	fbg,a	%fcc3,	loop_2848
loop_2847:
	xorcc	%i1,	%l3,	%i5
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2848:
	movrne	%i3,	0x1E7,	%g7
	movg	%xcc,	%o7,	%o1
	fcmpne32	%f30,	%f10,	%l4
	edge32ln	%g2,	%i6,	%l0
	subc	%o4,	%i7,	%o2
	andn	%i4,	%g4,	%o0
	sir	0x1996
	ld	[%l7 + 0x24],	%f19
	sll	%g3,	0x1B,	%l6
	sir	0x1BC9
	fabss	%f11,	%f5
	sdivcc	%o6,	0x1B39,	%i2
	tgu	%xcc,	0x6
	addccc	%g5,	%o5,	%g1
	fmovsn	%icc,	%f9,	%f6
	movleu	%icc,	%l2,	%g6
	andn	%i0,	0x05AE,	%l1
	fbuge	%fcc1,	loop_2849
	bge,pn	%xcc,	loop_2850
	bpos,pt	%icc,	loop_2851
	movvs	%xcc,	%l5,	%o3
loop_2849:
	sir	0x19D2
loop_2850:
	tl	%xcc,	0x2
loop_2851:
	movrlz	%i1,	%i5,	%l3
	xnor	%g7,	0x1716,	%o7
	movrgz	%o1,	0x1B7,	%i3
	brgez,a	%g2,	loop_2852
	xor	%l4,	0x0AD7,	%l0
	nop
	setx	0x404670E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	bvc,pt	%icc,	loop_2853
loop_2852:
	andn	%i6,	0x1535,	%o4
	udivx	%o2,	0x14AA,	%i7
	movle	%icc,	%i4,	%g4
loop_2853:
	fsrc1s	%f22,	%f18
	edge16	%o0,	%l6,	%o6
	brz	%g3,	loop_2854
	movge	%icc,	%g5,	%i2
	movrlez	%o5,	%g1,	%l2
	stb	%g6,	[%l7 + 0x64]
loop_2854:
	andncc	%l1,	%l5,	%o3
	nop
	setx	loop_2855,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xor	%i1,	%i5,	%i0
	edge32	%l3,	%o7,	%g7
	bvc,a,pt	%icc,	loop_2856
loop_2855:
	brgez	%o1,	loop_2857
	popc	%g2,	%i3
	swap	[%l7 + 0x40],	%l4
loop_2856:
	fmovrslz	%l0,	%f12,	%f13
loop_2857:
	mulscc	%o4,	0x0190,	%o2
	edge32l	%i7,	%i4,	%g4
	te	%xcc,	0x3
	bcs	%icc,	loop_2858
	edge16	%o0,	%l6,	%i6
	udivcc	%o6,	0x14A7,	%g5
	nop
	fitos	%f2,	%f31
	fstoi	%f31,	%f11
loop_2858:
	faligndata	%f10,	%f0,	%f8
	bvc,a,pn	%xcc,	loop_2859
	movl	%icc,	%i2,	%g3
	smul	%g1,	0x0A8A,	%o5
	tn	%xcc,	0x7
loop_2859:
	udivx	%l2,	0x104E,	%l1
	ldsb	[%l7 + 0x41],	%l5
	fmul8x16al	%f12,	%f2,	%f16
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x6C] %asi,	%o3
	movre	%i1,	%i5,	%i0
	fmovda	%xcc,	%f1,	%f13
	nop
	fitos	%f7,	%f15
	fstox	%f15,	%f8
	fxtos	%f8,	%f29
	movrgz	%g6,	%l3,	%o7
	xnor	%g7,	0x11D8,	%g2
	bge,a,pn	%xcc,	loop_2860
	movge	%icc,	%i3,	%o1
	movcs	%xcc,	%l4,	%l0
	flush	%l7 + 0x48
loop_2860:
	edge32n	%o4,	%o2,	%i7
	tgu	%icc,	0x0
	be,a,pt	%xcc,	loop_2861
	faligndata	%f24,	%f0,	%f16
	nop
	setx	0x27AE77AA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f11
	ldub	[%l7 + 0x29],	%g4
loop_2861:
	stb	%o0,	[%l7 + 0x65]
	nop
	set	0x54, %l6
	ldsw	[%l7 + %l6],	%i4
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f14
	fxtod	%f14,	%f22
	movgu	%icc,	%l6,	%o6
	orncc	%g5,	%i6,	%i2
	umul	%g1,	%o5,	%g3
	ldsb	[%l7 + 0x24],	%l2
	tne	%icc,	0x7
	alignaddr	%l1,	%l5,	%o3
	umul	%i1,	0x18F6,	%i5
	fbule	%fcc2,	loop_2862
	edge8ln	%g6,	%l3,	%i0
	edge16l	%g7,	%o7,	%g2
	fand	%f18,	%f28,	%f22
loop_2862:
	movpos	%icc,	%o1,	%l4
	bleu	%icc,	loop_2863
	tgu	%icc,	0x6
	prefetch	[%l7 + 0x14],	 0x3
	nop
	setx	0xC6C5F4DCED7D7DFD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f30
loop_2863:
	srax	%l0,	0x15,	%o4
	edge32l	%i3,	%i7,	%g4
	sll	%o2,	%o0,	%i4
	movre	%l6,	0x25D,	%g5
	tpos	%xcc,	0x3
	edge32ln	%o6,	%i2,	%i6
	fmuld8sux16	%f28,	%f11,	%f20
	stbar
	stx	%g1,	[%l7 + 0x08]
	tvc	%xcc,	0x4
	fxnor	%f30,	%f16,	%f10
	smulcc	%g3,	%o5,	%l1
	edge8n	%l2,	%o3,	%l5
	fornot2s	%f10,	%f10,	%f6
	fmovsleu	%icc,	%f15,	%f14
	subc	%i5,	0x1153,	%i1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x78] %asi,	%l3
	edge32ln	%g6,	%i0,	%o7
	wr	%g0,	0x18,	%asi
	stxa	%g2,	[%l7 + 0x48] %asi
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%o1,	%g7
	fbue	%fcc1,	loop_2864
	fcmpne32	%f28,	%f20,	%l0
	nop
	setx	0x3A7EADE5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f2
	xorcc	%l4,	%o4,	%i3
loop_2864:
	edge16l	%i7,	%g4,	%o2
	movvs	%xcc,	%i4,	%l6
	set	0x20, %o1
	ldxa	[%l7 + %o1] 0x80,	%g5
	umul	%o0,	%o6,	%i2
	subccc	%g1,	%g3,	%i6
	set	0x78, %i3
	stha	%l1,	[%l7 + %i3] 0x2a
	membar	#Sync
	orcc	%o5,	0x1795,	%o3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l5,	%l2
	sethi	0x0C9C,	%i1
	fcmple32	%f12,	%f20,	%l3
	edge8l	%g6,	%i5,	%o7
	membar	0x78
	be,a	%xcc,	loop_2865
	fmovs	%f15,	%f9
	popc	0x1851,	%g2
	edge32l	%o1,	%g7,	%l0
loop_2865:
	orncc	%i0,	0x1D29,	%o4
	fmovdpos	%xcc,	%f8,	%f11
	movrlz	%l4,	0x08B,	%i3
	fnors	%f4,	%f10,	%f23
	edge16n	%g4,	%o2,	%i7
	movcs	%icc,	%i4,	%l6
	movcc	%xcc,	%o0,	%g5
	edge32l	%o6,	%g1,	%i2
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x22,	%g2
	movpos	%xcc,	%i6,	%l1
	orn	%o5,	0x063E,	%l5
	movl	%icc,	%o3,	%l2
	wr	%g0,	0x0c,	%asi
	stwa	%l3,	[%l7 + 0x64] %asi
	fcmple32	%f22,	%f26,	%g6
	mova	%xcc,	%i5,	%o7
	sdivcc	%g2,	0x03A5,	%i1
	fmovsvs	%xcc,	%f18,	%f9
	array16	%o1,	%l0,	%g7
	mulscc	%i0,	%o4,	%l4
	addccc	%i3,	0x173E,	%g4
	addccc	%o2,	%i4,	%l6
	tl	%icc,	0x7
	udivx	%i7,	0x19D3,	%o0
	nop
	setx	0x000F3A667FED4F91,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xF06B42205E236F25,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f8,	%f8
	brlez,a	%g5,	loop_2866
	sra	%o6,	%i2,	%g1
	ba	%icc,	loop_2867
	sdiv	%i6,	0x1CBB,	%g3
loop_2866:
	nop
	setx	0x98277574,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xFC2FF20B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f8,	%f2
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f22
loop_2867:
	nop
	setx loop_2868, %l0, %l1
	jmpl %l1, %l1
	xnor	%o5,	%o3,	%l5
	fmovrslez	%l3,	%f16,	%f20
	nop
	setx	0x95749F40D80EE3E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xF093632E8957ADCC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f8,	%f30
loop_2868:
	fsrc1s	%f7,	%f28
	add	%g6,	%l2,	%o7
	edge8n	%i5,	%i1,	%o1
	mova	%icc,	%g2,	%l0
	tl	%xcc,	0x6
	bleu,a	loop_2869
	fbg,a	%fcc2,	loop_2870
	smul	%i0,	0x1ACE,	%o4
	movgu	%icc,	%l4,	%i3
loop_2869:
	fexpand	%f27,	%f8
loop_2870:
	xorcc	%g4,	0x0A29,	%o2
	fcmpeq32	%f10,	%f0,	%i4
	edge8	%g7,	%l6,	%i7
	flush	%l7 + 0x30
	fnand	%f4,	%f24,	%f18
	sdivcc	%g5,	0x0BE9,	%o6
	tge	%xcc,	0x1
	mulscc	%i2,	0x1FD6,	%g1
	fsrc2	%f16,	%f24
	array32	%i6,	%o0,	%l1
	tpos	%xcc,	0x4
	andn	%g3,	%o3,	%o5
	tcs	%xcc,	0x7
	sdiv	%l3,	0x0A67,	%g6
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f16
	movrgez	%l5,	0x339,	%l2
	bcs	%xcc,	loop_2871
	fmovse	%icc,	%f15,	%f24
	umulcc	%o7,	0x1BAC,	%i5
	sllx	%i1,	0x10,	%g2
loop_2871:
	bpos,a	loop_2872
	fmovscc	%xcc,	%f27,	%f1
	addcc	%o1,	0x19E0,	%l0
	stb	%i0,	[%l7 + 0x78]
loop_2872:
	nop
	setx	0xFA91A48D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x55CDA1CD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f12,	%f24
	edge32l	%l4,	%i3,	%o4
	sdiv	%o2,	0x0878,	%i4
	tne	%icc,	0x4
	smul	%g7,	%l6,	%g4
	fpackfix	%f14,	%f18
	movne	%xcc,	%g5,	%i7
	brlz	%o6,	loop_2873
	movrgz	%g1,	0x3C5,	%i6
	umulcc	%o0,	0x134B,	%i2
	edge16l	%l1,	%o3,	%g3
loop_2873:
	movre	%l3,	%o5,	%g6
	ldsw	[%l7 + 0x44],	%l2
	bgu,a,pt	%icc,	loop_2874
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f20,	%f28,	%f30
	nop
	setx	0xA165D39AC91BA20C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xC6588F8230177224,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f10,	%f4
loop_2874:
	tleu	%xcc,	0x2
	subcc	%o7,	%i5,	%i1
	fones	%f11
	fbne,a	%fcc3,	loop_2875
	edge32	%l5,	%o1,	%l0
	fblg,a	%fcc1,	loop_2876
	tpos	%icc,	0x2
loop_2875:
	movcs	%xcc,	%g2,	%l4
	stw	%i3,	[%l7 + 0x10]
loop_2876:
	tvs	%icc,	0x7
	fxnors	%f20,	%f16,	%f14
	membar	0x1C
	alignaddrl	%o4,	%i0,	%i4
	edge8ln	%o2,	%l6,	%g7
	set	0x30, %l2
	prefetcha	[%l7 + %l2] 0x14,	 0x0
	fcmpeq16	%f18,	%f8,	%i7
	fmovsn	%xcc,	%f30,	%f4
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x11
	edge32	%o6,	%g5,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o0,	%i2,	%g1
	tgu	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f25,	%f21
	nop
	fitos	%f29,	%f12
	movgu	%xcc,	%o3,	%l1
	bg,a	loop_2877
	fbn,a	%fcc2,	loop_2878
	bneg,a	loop_2879
	tvs	%xcc,	0x0
loop_2877:
	nop
	set	0x74, %i7
	ldswa	[%l7 + %i7] 0x11,	%g3
loop_2878:
	andn	%l3,	0x057F,	%g6
loop_2879:
	prefetch	[%l7 + 0x44],	 0x0
	movg	%xcc,	%o5,	%l2
	edge8	%i5,	%i1,	%l5
	xorcc	%o7,	%o1,	%l0
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%g2
	fmovrdgez	%l4,	%f0,	%f2
	ldx	[%l7 + 0x28],	%o4
	movle	%icc,	%i0,	%i3
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%i4
	srax	%l6,	0x02,	%o2
	xnorcc	%g7,	0x1D1B,	%i7
	movcc	%icc,	%o6,	%g4
	bcc,a	%xcc,	loop_2880
	addccc	%i6,	0x0D62,	%g5
	set	0x54, %o0
	lda	[%l7 + %o0] 0x04,	%f26
loop_2880:
	tg	%icc,	0x2
	sra	%i2,	%g1,	%o3
	te	%icc,	0x6
	xnorcc	%l1,	%o0,	%g3
	addccc	%g6,	0x1B86,	%l3
	nop
	fitod	%f1,	%f8
	array8	%l2,	%i5,	%o5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l5,	%i1
	udiv	%o1,	0x0A32,	%l0
	ld	[%l7 + 0x14],	%f24
	fble,a	%fcc1,	loop_2881
	srlx	%o7,	%g2,	%l4
	ldd	[%l7 + 0x30],	%i0
	brlz	%o4,	loop_2882
loop_2881:
	nop
	fitod	%f10,	%f6
	fdtox	%f6,	%f26
	fxtod	%f26,	%f6
	tvs	%icc,	0x1
	fpackfix	%f10,	%f29
loop_2882:
	edge8n	%i4,	%l6,	%o2
	fcmple32	%f24,	%f16,	%i3
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x34] %asi,	%g7
	movleu	%icc,	%o6,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%i6,	%f6,	%f22
	ldub	[%l7 + 0x0E],	%g4
	fbul	%fcc0,	loop_2883
	smul	%g5,	%g1,	%o3
	fnor	%f30,	%f12,	%f0
	mulx	%i2,	0x0536,	%o0
loop_2883:
	tge	%icc,	0x6
	movn	%xcc,	%g3,	%g6
	set	0x31, %l1
	ldsba	[%l7 + %l1] 0x18,	%l3
	fmovsvc	%xcc,	%f3,	%f19
	fandnot2s	%f2,	%f16,	%f7
	edge32n	%l2,	%i5,	%o5
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f28
	bgu,a,pt	%xcc,	loop_2884
	movrlez	%l1,	%i1,	%l5
	set	0x10, %g4
	lda	[%l7 + %g4] 0x19,	%f24
loop_2884:
	fmovsa	%icc,	%f31,	%f7
	set	0x64, %o7
	sta	%f1,	[%l7 + %o7] 0x80
	wr	%g0,	0x2b,	%asi
	stha	%l0,	[%l7 + 0x66] %asi
	membar	#Sync
	sdiv	%o7,	0x1ED8,	%g2
	movcs	%icc,	%o1,	%i0
	bleu,pt	%xcc,	loop_2885
	fsrc2	%f10,	%f14
	fmovsneg	%xcc,	%f25,	%f10
	fxnor	%f0,	%f28,	%f16
loop_2885:
	tge	%xcc,	0x3
	stx	%l4,	[%l7 + 0x68]
	udivx	%i4,	0x0C1D,	%o4
	brlez	%o2,	loop_2886
	popc	%l6,	%i3
	movrne	%g7,	0x103,	%i7
	fxnor	%f14,	%f26,	%f18
loop_2886:
	mulscc	%o6,	%g4,	%i6
	fbe	%fcc2,	loop_2887
	nop
	setx	0x421EEC97,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f16
	tcs	%icc,	0x7
	ldd	[%l7 + 0x20],	%g4
loop_2887:
	tne	%xcc,	0x7
	movg	%xcc,	%g1,	%i2
	bge	%xcc,	loop_2888
	movge	%icc,	%o3,	%g3
	tneg	%icc,	0x4
	add	%g6,	%l3,	%l2
loop_2888:
	sdivx	%i5,	0x1B94,	%o0
	tle	%xcc,	0x1
	tgu	%icc,	0x1
	mulscc	%o5,	%l1,	%i1
	smulcc	%l0,	0x0FE4,	%l5
	tvs	%xcc,	0x2
	tleu	%icc,	0x5
	array32	%o7,	%o1,	%i0
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x14] %asi,	%g2
	movrlz	%i4,	0x242,	%l4
	mulx	%o2,	0x09EE,	%o4
	fmul8x16al	%f5,	%f8,	%f2
	movcs	%icc,	%i3,	%g7
	fmovsne	%xcc,	%f9,	%f7
	subccc	%i7,	0x0181,	%l6
	movrgez	%o6,	%i6,	%g5
	tl	%xcc,	0x5
	fmovrdne	%g4,	%f30,	%f2
	fnegs	%f18,	%f9
	tleu	%xcc,	0x0
	tn	%xcc,	0x7
	movvc	%xcc,	%i2,	%g1
	movneg	%xcc,	%g3,	%g6
	xorcc	%l3,	0x15AD,	%o3
	movcs	%icc,	%l2,	%i5
	sir	0x1D1A
	fmovrdlez	%o5,	%f26,	%f28
	nop
	setx	0xC459B2FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x1C22DD92,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f9,	%f20
	addc	%o0,	%i1,	%l0
	umul	%l5,	%l1,	%o1
	fnot1s	%f7,	%f30
	srlx	%o7,	%i0,	%g2
	fpsub16s	%f20,	%f6,	%f22
	movvs	%icc,	%i4,	%l4
	edge32l	%o4,	%i3,	%o2
	array32	%g7,	%l6,	%o6
	tvc	%xcc,	0x1
	set	0x40, %g2
	lda	[%l7 + %g2] 0x81,	%f5
	array16	%i6,	%i7,	%g4
	fmul8x16al	%f16,	%f19,	%f2
	movne	%icc,	%i2,	%g1
	movrgz	%g5,	%g3,	%g6
	udivx	%o3,	0x0A92,	%l3
	orncc	%i5,	0x1D10,	%o5
	udiv	%o0,	0x0176,	%l2
	movpos	%icc,	%l0,	%l5
	stb	%l1,	[%l7 + 0x15]
	set	0x76, %o6
	lduha	[%l7 + %o6] 0x04,	%o1
	tvc	%xcc,	0x2
	fmul8x16	%f23,	%f4,	%f12
	tpos	%icc,	0x1
	udivx	%i1,	0x0F8C,	%o7
	andcc	%g2,	0x0B62,	%i4
	tvs	%xcc,	0x6
	brz,a	%i0,	loop_2889
	addccc	%o4,	0x0B39,	%i3
	set	0x58, %o2
	stxa	%l4,	[%l7 + %o2] 0x10
loop_2889:
	nop
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g7
	udiv	%l6,	0x15EF,	%o2
	sth	%i6,	[%l7 + 0x58]
	tcc	%xcc,	0x7
	fmovdl	%xcc,	%f2,	%f4
	fmovs	%f30,	%f28
	fmovrsgz	%i7,	%f30,	%f14
	srlx	%g4,	0x0A,	%o6
	andn	%g1,	0x0DEB,	%i2
	set	0x60, %g7
	swapa	[%l7 + %g7] 0x89,	%g3
	sllx	%g6,	%o3,	%l3
	nop
	set	0x48, %g3
	sth	%i5,	[%l7 + %g3]
	movpos	%xcc,	%o5,	%o0
	array8	%g5,	%l0,	%l2
	sethi	0x07FD,	%l1
	alignaddr	%o1,	%l5,	%i1
	movcc	%icc,	%o7,	%i4
	orcc	%g2,	%o4,	%i3
	sir	0x1A92
	tpos	%icc,	0x1
	te	%xcc,	0x6
	bleu,pt	%xcc,	loop_2890
	tvs	%xcc,	0x7
	tg	%xcc,	0x7
	lduw	[%l7 + 0x40],	%i0
loop_2890:
	movrlz	%l4,	%g7,	%o2
	swap	[%l7 + 0x18],	%i6
	tsubcc	%i7,	%l6,	%o6
	membar	0x54
	sdiv	%g1,	0x0AA5,	%g4
	movrgz	%i2,	%g3,	%g6
	udiv	%l3,	0x02AB,	%o3
	fxnors	%f2,	%f10,	%f26
	movrgz	%o5,	0x257,	%o0
	bg,a	%xcc,	loop_2891
	movvc	%icc,	%g5,	%i5
	array16	%l2,	%l0,	%l1
	fones	%f28
loop_2891:
	fzero	%f0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
	subcc	%i1,	0x1113,	%o7
	edge32l	%i4,	%o1,	%g2
	fmovsge	%xcc,	%f28,	%f11
	tl	%xcc,	0x1
	sth	%i3,	[%l7 + 0x6E]
	fmovscc	%icc,	%f29,	%f9
	movcs	%icc,	%o4,	%l4
	andn	%g7,	0x05E9,	%i0
	sub	%i6,	0x02C2,	%i7
	umul	%l6,	0x1D47,	%o6
	tneg	%xcc,	0x5
	nop
	setx	0x6799DE6C8A287ADD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f24
	fpsub16s	%f17,	%f4,	%f24
	movgu	%icc,	%g1,	%o2
	sdivx	%g4,	0x13AE,	%i2
	andncc	%g3,	%l3,	%o3
	edge16ln	%g6,	%o0,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i5,	0x0C60,	%g5
	umulcc	%l0,	%l2,	%l1
	movge	%icc,	%l5,	%o7
	st	%f27,	[%l7 + 0x38]
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sethi	0x0749,	%i4
	fbl	%fcc0,	loop_2892
	sdivcc	%i1,	0x0668,	%g2
	movge	%icc,	%i3,	%o1
	taddcc	%o4,	%l4,	%i0
loop_2892:
	tleu	%xcc,	0x0
	movrlz	%i6,	%i7,	%g7
	movgu	%icc,	%o6,	%g1
	fnegs	%f31,	%f25
	ldub	[%l7 + 0x5C],	%l6
	nop
	setx	loop_2893,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ba,a	%icc,	loop_2894
	fmovsge	%xcc,	%f10,	%f12
	fmovdcs	%xcc,	%f13,	%f26
loop_2893:
	udivcc	%o2,	0x047F,	%g4
loop_2894:
	array32	%i2,	%g3,	%o3
	sdiv	%l3,	0x0D8F,	%o0
	taddcc	%g6,	0x03F7,	%i5
	ldstub	[%l7 + 0x6F],	%g5
	addcc	%o5,	%l2,	%l0
	tge	%icc,	0x4
	set	0x70, %l0
	stxa	%l1,	[%l7 + %l0] 0xe2
	membar	#Sync
	fcmple16	%f20,	%f14,	%l5
	set	0x10, %i1
	lda	[%l7 + %i1] 0x89,	%f25
	subc	%o7,	0x1FDF,	%i1
	fmovrde	%g2,	%f30,	%f2
	sub	%i3,	%o1,	%o4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x0c,	%l4,	%i0
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x7E] %asi,	%i4
	set	0x69, %i6
	ldsba	[%l7 + %i6] 0x04,	%i7
	mova	%icc,	%g7,	%i6
	tge	%icc,	0x3
	brgez	%g1,	loop_2895
	brnz,a	%l6,	loop_2896
	fcmpeq32	%f4,	%f12,	%o6
	xnorcc	%o2,	0x1671,	%i2
loop_2895:
	nop
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x88
loop_2896:
	movge	%xcc,	%g4,	%o3
	andn	%l3,	0x0EE6,	%g3
	fbule	%fcc0,	loop_2897
	fxnor	%f8,	%f14,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f0,	%f6,	%f8
loop_2897:
	fxnor	%f28,	%f14,	%f22
	wr	%g0,	0x89,	%asi
	stwa	%g6,	[%l7 + 0x34] %asi
	add	%i5,	0x0AF6,	%g5
	fnot1	%f22,	%f22
	nop
	fitod	%f26,	%f24
	tle	%xcc,	0x1
	tleu	%icc,	0x4
	ba,a,pn	%xcc,	loop_2898
	movvc	%icc,	%o5,	%l2
	set	0x0C, %l3
	lduwa	[%l7 + %l3] 0x81,	%l0
loop_2898:
	movvc	%xcc,	%l1,	%l5
	edge8ln	%o0,	%o7,	%g2
	fbug,a	%fcc3,	loop_2899
	edge8n	%i3,	%i1,	%o1
	bg	%icc,	loop_2900
	sdivcc	%o4,	0x1A36,	%i0
loop_2899:
	edge16l	%i4,	%l4,	%i7
	edge16l	%i6,	%g1,	%l6
loop_2900:
	ldstub	[%l7 + 0x6B],	%o6
	tsubcctv	%o2,	0x114C,	%g7
	add	%i2,	%g4,	%l3
	sra	%o3,	%g6,	%g3
	fbl,a	%fcc0,	loop_2901
	xor	%i5,	0x1264,	%o5
	fexpand	%f11,	%f22
	fzero	%f14
loop_2901:
	fmovrslz	%l2,	%f18,	%f17
	edge8l	%g5,	%l0,	%l1
	nop
	setx	0x8422BAB847ECC8B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xBCB8F406FA640467,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f4,	%f2
	nop
	setx	0x952D4CF851DF126E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xC3F3ABB7F24AC51F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f0,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f26,	%f0,	%f8
	srax	%l5,	0x03,	%o7
	sdivcc	%g2,	0x115D,	%i3
	sir	0x1D3D
	fble	%fcc3,	loop_2902
	brgez	%i1,	loop_2903
	bgu,a,pt	%icc,	loop_2904
	fmovdvc	%icc,	%f10,	%f24
loop_2902:
	fands	%f30,	%f30,	%f0
loop_2903:
	tcc	%xcc,	0x1
loop_2904:
	movre	%o0,	%o1,	%o4
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x210] %asi,	%i4
	edge32ln	%l4,	%i0,	%i6
	bne,pn	%xcc,	loop_2905
	edge8ln	%i7,	%g1,	%o6
	taddcctv	%o2,	0x031E,	%g7
	edge8ln	%i2,	%g4,	%l6
loop_2905:
	tg	%icc,	0x3
	tneg	%icc,	0x3
	movg	%xcc,	%o3,	%g6
	movge	%xcc,	%l3,	%i5
	bgu,pt	%xcc,	loop_2906
	sethi	0x1269,	%g3
	addcc	%o5,	%l2,	%l0
	fmovdn	%icc,	%f2,	%f27
loop_2906:
	sll	%l1,	0x0A,	%l5
	sllx	%o7,	0x05,	%g5
	set	0x64, %o5
	lduha	[%l7 + %o5] 0x19,	%i3
	fbne,a	%fcc0,	loop_2907
	tpos	%xcc,	0x4
	popc	%i1,	%g2
	addc	%o1,	0x1ACA,	%o0
loop_2907:
	bge,a	%xcc,	loop_2908
	fbule	%fcc2,	loop_2909
	fmovdvs	%xcc,	%f5,	%f11
	lduw	[%l7 + 0x1C],	%i4
loop_2908:
	sra	%o4,	%i0,	%i6
loop_2909:
	edge16	%i7,	%g1,	%l4
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x49] %asi,	%o6
	swap	[%l7 + 0x64],	%o2
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge16l	%i2,	%g4,	%l6
	tl	%xcc,	0x1
	movvs	%xcc,	%g7,	%o3
	popc	%g6,	%i5
	fmovda	%xcc,	%f30,	%f12
	set	0x68, %g5
	sta	%f4,	[%l7 + %g5] 0x0c
	flush	%l7 + 0x0C
	fbn,a	%fcc2,	loop_2910
	sll	%g3,	%o5,	%l2
	addccc	%l3,	0x1014,	%l1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%o7
loop_2910:
	ta	%icc,	0x6
	call	loop_2911
	andcc	%g5,	%l5,	%i3
	sth	%i1,	[%l7 + 0x60]
	membar	0x04
loop_2911:
	bne,pn	%xcc,	loop_2912
	fpsub32s	%f6,	%f24,	%f19
	sdivcc	%o1,	0x17F9,	%g2
	udivx	%o0,	0x02D9,	%i4
loop_2912:
	bg	%icc,	loop_2913
	movneg	%icc,	%o4,	%i6
	wr	%g0,	0x10,	%asi
	stba	%i7,	[%l7 + 0x4F] %asi
loop_2913:
	smul	%i0,	0x04E5,	%l4
	movcs	%icc,	%o6,	%o2
	add	%g1,	%i2,	%g4
	tg	%icc,	0x4
	edge32l	%l6,	%g7,	%g6
	bn,pn	%icc,	loop_2914
	fmovrsgz	%o3,	%f28,	%f15
	edge32	%g3,	%o5,	%i5
	xorcc	%l3,	%l1,	%l0
loop_2914:
	nop
	setx	0x85B53788,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x07DA7A3A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f3,	%f14
	srl	%o7,	0x1C,	%g5
	xor	%l5,	0x1971,	%i3
	movn	%icc,	%l2,	%o1
	movpos	%icc,	%g2,	%i1
	fmovrdlez	%o0,	%f16,	%f18
	fcmpgt32	%f24,	%f16,	%i4
	umul	%i6,	%i7,	%i0
	edge16l	%o4,	%l4,	%o6
	nop
	setx	0x704E0FEA,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	fmovsleu	%icc,	%f16,	%f25
	taddcc	%g1,	0x175D,	%o2
	nop
	fitod	%f10,	%f4
	ldsw	[%l7 + 0x1C],	%i2
	popc	%g4,	%l6
	fmovdvs	%icc,	%f19,	%f7
	set	0x1F, %l5
	ldsba	[%l7 + %l5] 0x04,	%g6
	brgz,a	%o3,	loop_2915
	or	%g3,	%o5,	%i5
	movneg	%icc,	%g7,	%l1
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x55] %asi,	%l0
loop_2915:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%o7
	edge32l	%g5,	%l5,	%l3
	movrlz	%i3,	0x109,	%l2
	movneg	%icc,	%g2,	%o1
	tvs	%icc,	0x0
	fands	%f4,	%f4,	%f1
	fsrc1s	%f1,	%f1
	subccc	%o0,	0x14B5,	%i1
	sll	%i4,	%i7,	%i0
	tsubcc	%i6,	0x1B04,	%l4
	nop
	setx	0x27C5E90F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x7BDCD7AD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f17,	%f31
	sll	%o6,	0x1B,	%o4
	fbug	%fcc0,	loop_2916
	movl	%xcc,	%g1,	%i2
	mova	%icc,	%g4,	%l6
	set	0x50, %i0
	stwa	%g6,	[%l7 + %i0] 0x11
loop_2916:
	array16	%o3,	%o2,	%g3
	membar	0x75
	bgu,a,pn	%xcc,	loop_2917
	tn	%xcc,	0x7
	alignaddr	%o5,	%i5,	%l1
	sth	%l0,	[%l7 + 0x18]
loop_2917:
	movrlez	%o7,	%g7,	%g5
	tcc	%icc,	0x5
	mova	%xcc,	%l5,	%l3
	fbge,a	%fcc1,	loop_2918
	ta	%xcc,	0x6
	nop
	setx	0x1511B466940727D3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xCCF82418FF6BA1A5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f0,	%f20
	mova	%icc,	%i3,	%l2
loop_2918:
	fsrc1s	%f28,	%f0
	fbne,a	%fcc3,	loop_2919
	movrlez	%g2,	0x197,	%o0
	udiv	%o1,	0x1A92,	%i4
	edge8l	%i7,	%i1,	%i0
loop_2919:
	orn	%i6,	%l4,	%o6
	brgez	%o4,	loop_2920
	brgz	%g1,	loop_2921
	umulcc	%g4,	%i2,	%l6
	fcmpgt32	%f2,	%f30,	%g6
loop_2920:
	sra	%o2,	0x0A,	%o3
loop_2921:
	movn	%icc,	%g3,	%o5
	stbar
	edge16l	%l1,	%i5,	%l0
	xnor	%o7,	%g5,	%l5
	nop
	setx	0x3855749B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x4A29F443,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f23,	%f4
	fnand	%f20,	%f26,	%f18
	fmovdne	%xcc,	%f20,	%f14
	ldsb	[%l7 + 0x6E],	%g7
	alignaddr	%i3,	%l3,	%l2
	nop
	setx	0xB59CDE0A2053299A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	brgez	%g2,	loop_2922
	brz,a	%o0,	loop_2923
	tne	%icc,	0x2
	xorcc	%i4,	0x159D,	%o1
loop_2922:
	edge32ln	%i1,	%i7,	%i6
loop_2923:
	fbe,a	%fcc1,	loop_2924
	tn	%xcc,	0x5
	edge16	%l4,	%o6,	%i0
	srl	%o4,	%g1,	%i2
loop_2924:
	subcc	%l6,	0x1F55,	%g6
	fnegs	%f2,	%f17
	nop
	setx	loop_2925,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	swap	[%l7 + 0x64],	%o2
	fmovrdgz	%o3,	%f22,	%f12
	fsrc1	%f18,	%f4
loop_2925:
	and	%g4,	%g3,	%o5
	edge32n	%i5,	%l1,	%l0
	andncc	%g5,	%o7,	%l5
	set	0x20, %g1
	stwa	%g7,	[%l7 + %g1] 0x14
	brnz	%l3,	loop_2926
	nop
	setx loop_2927, %l0, %l1
	jmpl %l1, %l2
	prefetch	[%l7 + 0x3C],	 0x0
	ba,pn	%xcc,	loop_2928
loop_2926:
	fmovsg	%icc,	%f3,	%f25
loop_2927:
	fbge	%fcc2,	loop_2929
	or	%g2,	%o0,	%i3
loop_2928:
	stb	%o1,	[%l7 + 0x6C]
	edge32l	%i1,	%i4,	%i7
loop_2929:
	edge8l	%l4,	%o6,	%i0
	movrgz	%o4,	%g1,	%i6
	movrlz	%l6,	%i2,	%o2
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x38] %asi,	%g6
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%g4
	fones	%f11
	edge32l	%o3,	%o5,	%g3
	fnors	%f29,	%f15,	%f10
	fnot2s	%f24,	%f19
	edge16	%i5,	%l0,	%l1
	movpos	%icc,	%g5,	%o7
	andncc	%l5,	%g7,	%l2
	fmul8x16au	%f16,	%f9,	%f2
	edge16ln	%l3,	%g2,	%i3
	sir	0x06C6
	movrlz	%o0,	0x15B,	%o1
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x15,	%i1
	fnors	%f11,	%f23,	%f5
	movrlez	%i7,	%i4,	%l4
	fcmple32	%f18,	%f6,	%i0
	subccc	%o6,	%o4,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f0,	%f28
	fdtox	%f28,	%f22
	sllx	%i6,	0x0C,	%l6
	xorcc	%i2,	%g6,	%g4
	xorcc	%o2,	0x11E2,	%o3
	movcc	%xcc,	%o5,	%g3
	fblg,a	%fcc2,	loop_2930
	ldstub	[%l7 + 0x3C],	%l0
	movleu	%icc,	%i5,	%l1
	bpos	%icc,	loop_2931
loop_2930:
	fsrc2	%f6,	%f6
	fbg,a	%fcc0,	loop_2932
	brgez,a	%o7,	loop_2933
loop_2931:
	edge8	%l5,	%g7,	%g5
	fmovdl	%icc,	%f7,	%f26
loop_2932:
	nop
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%f16
loop_2933:
	nop
	setx	loop_2934,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%icc,	%l2,	%g2
	tpos	%icc,	0x3
	andcc	%l3,	%o0,	%i3
loop_2934:
	alignaddr	%o1,	%i7,	%i1
	call	loop_2935
	subccc	%i4,	0x1C09,	%i0
	alignaddr	%l4,	%o6,	%g1
	brlez,a	%o4,	loop_2936
loop_2935:
	movvs	%xcc,	%i6,	%l6
	brnz	%i2,	loop_2937
	edge32n	%g4,	%g6,	%o2
loop_2936:
	fnot1	%f22,	%f8
	fpadd32	%f30,	%f18,	%f2
loop_2937:
	movvs	%icc,	%o3,	%g3
	ldsb	[%l7 + 0x4D],	%o5
	fpackfix	%f4,	%f24
	fmovsne	%icc,	%f7,	%f16
	fxnor	%f30,	%f8,	%f14
	edge16l	%i5,	%l1,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l5,	0x1071,	%l0
	addcc	%g7,	0x0DC6,	%l2
	fmovscs	%icc,	%f31,	%f16
	tcs	%xcc,	0x3
	call	loop_2938
	sll	%g5,	0x0C,	%g2
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2938:
	fbue	%fcc2,	loop_2939
	sdivcc	%l3,	0x1CD7,	%o0
	movg	%icc,	%i3,	%i7
	ta	%xcc,	0x2
loop_2939:
	nop
	set	0x16, %l6
	ldub	[%l7 + %l6],	%i1
	sdiv	%o1,	0x1C79,	%i4
	srl	%i0,	0x0F,	%o6
	fmovrsgz	%g1,	%f19,	%f26
	set	0x60, %i5
	ldda	[%l7 + %i5] 0x81,	%l4
	fmovdpos	%xcc,	%f9,	%f10
	fbl	%fcc3,	loop_2940
	array8	%o4,	%l6,	%i6
	fands	%f9,	%f22,	%f6
	tsubcctv	%g4,	0x0731,	%g6
loop_2940:
	addcc	%o2,	0x0FFD,	%o3
	fcmpgt16	%f28,	%f28,	%i2
	ta	%icc,	0x3
	and	%g3,	0x069E,	%i5
	movre	%o5,	0x271,	%l1
	subccc	%l5,	%l0,	%o7
	movcs	%icc,	%l2,	%g5
	fmovdvc	%xcc,	%f30,	%f31
	set	0x19, %o1
	ldstuba	[%l7 + %o1] 0x80,	%g7
	te	%xcc,	0x0
	bcs	%icc,	loop_2941
	sllx	%l3,	%g2,	%o0
	nop
	setx	loop_2942,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovspos	%xcc,	%f31,	%f20
loop_2941:
	nop
	set	0x44, %o4
	lduwa	[%l7 + %o4] 0x80,	%i7
loop_2942:
	fnot2	%f20,	%f20
	bleu	%xcc,	loop_2943
	movrne	%i3,	0x1D6,	%i1
	fzeros	%f13
	fmovsa	%icc,	%f8,	%f5
loop_2943:
	edge32n	%i4,	%i0,	%o1
	taddcctv	%o6,	%l4,	%o4
	andn	%g1,	%l6,	%g4
	tne	%icc,	0x4
	tpos	%xcc,	0x6
	swap	[%l7 + 0x5C],	%i6
	movleu	%xcc,	%g6,	%o3
	fmovrslz	%o2,	%f25,	%f11
	be	%xcc,	loop_2944
	ldd	[%l7 + 0x28],	%f2
	tn	%xcc,	0x4
	movneg	%icc,	%g3,	%i2
loop_2944:
	smulcc	%i5,	0x1B81,	%o5
	add	%l5,	0x1A72,	%l1
	movn	%xcc,	%l0,	%l2
	edge16n	%g5,	%o7,	%l3
	fandnot1s	%f22,	%f16,	%f23
	mova	%icc,	%g2,	%g7
	brgz	%o0,	loop_2945
	sdivx	%i3,	0x14A8,	%i1
	movl	%xcc,	%i7,	%i0
	orn	%i4,	%o1,	%l4
loop_2945:
	edge32l	%o6,	%o4,	%g1
	add	%g4,	%l6,	%i6
	xorcc	%g6,	%o3,	%g3
	nop
	setx	0xF4DB3EDFA06E2884,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	ldsh	[%l7 + 0x30],	%o2
	edge16n	%i2,	%i5,	%l5
	sub	%o5,	0x1147,	%l0
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x14,	%f0
	fpadd16	%f20,	%f12,	%f30
	fmovdn	%xcc,	%f14,	%f21
	fmovrsne	%l1,	%f9,	%f2
	wr	%g0,	0x0c,	%asi
	sta	%f31,	[%l7 + 0x5C] %asi
	sethi	0x091B,	%g5
	tcc	%icc,	0x0
	fmovrdne	%l2,	%f18,	%f2
	brz,a	%o7,	loop_2946
	alignaddrl	%l3,	%g2,	%g7
	nop
	fitod	%f12,	%f28
	fdtoi	%f28,	%f12
	smul	%o0,	0x1240,	%i3
loop_2946:
	movrlez	%i7,	0x0CA,	%i1
	stb	%i4,	[%l7 + 0x37]
	udiv	%o1,	0x1620,	%l4
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	addccc	%i0,	%o4,	%o6
	edge8	%g4,	%l6,	%i6
	andcc	%g6,	%g1,	%o3
	fcmple16	%f22,	%f8,	%g3
	call	loop_2947
	sdiv	%i2,	0x0E6A,	%i5
	tge	%xcc,	0x2
	brz,a	%o2,	loop_2948
loop_2947:
	addccc	%l5,	%o5,	%l0
	fornot2s	%f19,	%f5,	%f20
	fmovdneg	%icc,	%f16,	%f4
loop_2948:
	tsubcctv	%g5,	%l1,	%l2
	taddcctv	%l3,	0x1FF5,	%o7
	fmovsvs	%icc,	%f5,	%f11
	brlez,a	%g7,	loop_2949
	movvc	%icc,	%g2,	%i3
	te	%icc,	0x3
	tleu	%xcc,	0x7
loop_2949:
	movg	%icc,	%o0,	%i7
	sir	0x151A
	bn	%xcc,	loop_2950
	bleu,a,pt	%xcc,	loop_2951
	tne	%xcc,	0x4
	fbn,a	%fcc2,	loop_2952
loop_2950:
	pdist	%f18,	%f26,	%f4
loop_2951:
	edge8n	%i4,	%i1,	%l4
	tle	%icc,	0x0
loop_2952:
	srl	%o1,	0x16,	%i0
	fpadd16	%f24,	%f30,	%f22
	smulcc	%o4,	0x0C94,	%o6
	fsrc1	%f10,	%f26
	std	%f14,	[%l7 + 0x40]
	tsubcc	%l6,	0x05A3,	%g4
	tsubcc	%g6,	%i6,	%o3
	fornot2s	%f18,	%f30,	%f14
	add	%g3,	0x16AB,	%g1
	movn	%icc,	%i2,	%i5
	fornot2s	%f24,	%f17,	%f30
	smulcc	%o2,	%l5,	%o5
	fzeros	%f1
	nop
	setx	0xC04D46A8,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	set	0x1E, %i4
	stba	%l0,	[%l7 + %i4] 0x18
	array8	%l1,	%l2,	%g5
	andncc	%o7,	%g7,	%g2
	movleu	%xcc,	%l3,	%i3
	move	%xcc,	%i7,	%i4
	edge16	%o0,	%i1,	%l4
	nop
	setx	0x22CB9E20,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xFE131B2E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f24,	%f24
	movcc	%xcc,	%o1,	%i0
	fmovrdlz	%o6,	%f26,	%f30
	tge	%xcc,	0x3
	stx	%l6,	[%l7 + 0x60]
	bl,a	loop_2953
	pdist	%f10,	%f16,	%f22
	fbe	%fcc2,	loop_2954
	edge16ln	%o4,	%g6,	%i6
loop_2953:
	nop
	setx	0x99252C3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x231AB2F9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f1,	%f26
	st	%f12,	[%l7 + 0x70]
loop_2954:
	subc	%o3,	0x144A,	%g4
	edge32	%g3,	%i2,	%g1
	edge16	%o2,	%i5,	%l5
	edge32l	%l0,	%o5,	%l2
	movl	%icc,	%g5,	%l1
	nop
	set	0x58, %i7
	ldx	[%l7 + %i7],	%o7
	lduw	[%l7 + 0x78],	%g7
	movrlez	%g2,	0x1F4,	%i3
	nop
	setx	loop_2955,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpgt32	%f14,	%f14,	%i7
	umulcc	%i4,	%o0,	%i1
	fcmple16	%f16,	%f28,	%l4
loop_2955:
	alignaddrl	%o1,	%i0,	%o6
	stb	%l6,	[%l7 + 0x29]
	array16	%l3,	%g6,	%i6
	nop
	setx	0x3DEC606E5DB5A119,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x88E3D24193ABE8D4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f22,	%f28
	xnor	%o3,	0x1A3E,	%o4
	array16	%g4,	%g3,	%g1
	mulscc	%i2,	0x002E,	%o2
	movrlez	%i5,	%l5,	%o5
	fzero	%f30
	movpos	%xcc,	%l2,	%g5
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x3
	smul	%o7,	%l1,	%g7
	ldx	[%l7 + 0x48],	%i3
	movl	%icc,	%g2,	%i4
	movre	%o0,	%i7,	%i1
	tge	%xcc,	0x3
	mulx	%l4,	%o1,	%o6
	tpos	%icc,	0x6
	edge8l	%i0,	%l3,	%g6
	tl	%xcc,	0x1
	membar	0x75
	bgu,a,pn	%xcc,	loop_2956
	taddcc	%i6,	0x122F,	%l6
	set	0x1A, %o0
	ldsha	[%l7 + %o0] 0x15,	%o3
loop_2956:
	umul	%o4,	%g3,	%g4
	fbue,a	%fcc2,	loop_2957
	udivcc	%i2,	0x1F10,	%g1
	mova	%xcc,	%o2,	%l5
	flush	%l7 + 0x74
loop_2957:
	movl	%icc,	%o5,	%l2
	tl	%icc,	0x5
	udivx	%g5,	0x1F01,	%l0
	move	%icc,	%o7,	%i5
	fbo,a	%fcc3,	loop_2958
	sra	%l1,	%g7,	%i3
	set	0x74, %i3
	stha	%i4,	[%l7 + %i3] 0x2f
	membar	#Sync
loop_2958:
	fpadd16	%f16,	%f28,	%f24
	umulcc	%g2,	%i7,	%i1
	sir	0x1C26
	andcc	%l4,	0x17BE,	%o1
	sdivcc	%o0,	0x03F2,	%i0
	fpsub32	%f22,	%f22,	%f20
	orncc	%o6,	0x1A47,	%l3
	brlz,a	%i6,	loop_2959
	brlez	%g6,	loop_2960
	bneg	loop_2961
	xnorcc	%l6,	0x18B8,	%o4
loop_2959:
	fmovsn	%icc,	%f29,	%f13
loop_2960:
	tle	%icc,	0x7
loop_2961:
	fmovrdgz	%g3,	%f8,	%f18
	orncc	%o3,	0x10E7,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x62, %l1
	ldsha	[%l7 + %l1] 0x0c,	%g1
	fnot2	%f22,	%f14
	umul	%o2,	%l5,	%o5
	tvs	%icc,	0x1
	fmovsle	%xcc,	%f17,	%f26
	set	0x60, %g4
	lduwa	[%l7 + %g4] 0x15,	%l2
	srax	%i2,	0x18,	%g5
	sdivcc	%l0,	0x0998,	%i5
	taddcctv	%o7,	0x1EEE,	%g7
	addcc	%i3,	%i4,	%g2
	faligndata	%f24,	%f8,	%f4
	ble,a,pn	%xcc,	loop_2962
	movre	%l1,	%i7,	%i1
	sra	%o1,	0x0C,	%o0
	te	%icc,	0x6
loop_2962:
	nop
	setx	0x301F021B106C7F42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	fpack32	%f14,	%f30,	%f24
	fmovsg	%xcc,	%f2,	%f31
	sub	%l4,	0x1E97,	%o6
	set	0x30, %o7
	ldxa	[%g0 + %o7] 0x50,	%l3
	array8	%i0,	%g6,	%l6
	nop
	fitos	%f6,	%f0
	fstoi	%f0,	%f25
	fands	%f30,	%f6,	%f18
	tleu	%icc,	0x3
	fabss	%f22,	%f8
	bgu	loop_2963
	fcmpeq16	%f14,	%f30,	%o4
	bne	loop_2964
	umulcc	%i6,	0x0B37,	%g3
loop_2963:
	movre	%o3,	0x263,	%g4
	movre	%g1,	%l5,	%o5
loop_2964:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x4
	fmovsl	%icc,	%f24,	%f3
	tneg	%xcc,	0x0
	membar	0x6F
	fcmpgt16	%f28,	%f26,	%l2
	tcc	%xcc,	0x5
	edge32n	%i2,	%o2,	%g5
	fmovdvs	%xcc,	%f22,	%f15
	fcmple32	%f18,	%f20,	%l0
	tleu	%xcc,	0x0
	movgu	%icc,	%o7,	%g7
	popc	%i5,	%i4
	movpos	%xcc,	%i3,	%l1
	ldub	[%l7 + 0x77],	%g2
	tge	%icc,	0x6
	ldd	[%l7 + 0x18],	%f12
	fxor	%f24,	%f16,	%f4
	andcc	%i1,	0x17EF,	%i7
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x78] %asi,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x4
	or	%o1,	0x02F5,	%o0
	brlez	%l4,	loop_2965
	fmuld8sux16	%f30,	%f26,	%f2
	tleu	%xcc,	0x7
	movg	%xcc,	%o6,	%i0
loop_2965:
	tle	%icc,	0x7
	fornot2	%f20,	%f22,	%f16
	brz,a	%l3,	loop_2966
	tneg	%icc,	0x1
	stb	%l6,	[%l7 + 0x43]
	be,a	%xcc,	loop_2967
loop_2966:
	nop
	fitod	%f0,	%f14
	fdtos	%f14,	%f31
	edge8ln	%g6,	%i6,	%o4
	nop
	setx	loop_2968,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2967:
	movcs	%xcc,	%g3,	%o3
	andn	%g1,	%g4,	%o5
	addcc	%l2,	%i2,	%l5
loop_2968:
	mulx	%g5,	%o2,	%o7
	andcc	%l0,	0x1345,	%i5
	andcc	%i4,	%g7,	%i3
	array32	%l1,	%g2,	%i1
	sir	0x08DE
	set	0x64, %o6
	swapa	[%l7 + %o6] 0x04,	%i7
	fcmpgt32	%f26,	%f0,	%o0
	movcc	%xcc,	%o1,	%l4
	set	0x61, %o2
	ldstuba	[%l7 + %o2] 0x89,	%o6
	tcc	%icc,	0x3
	call	loop_2969
	tcs	%icc,	0x2
	bgu,pt	%icc,	loop_2970
	andncc	%i0,	%l3,	%l6
loop_2969:
	te	%icc,	0x0
	bne,a	loop_2971
loop_2970:
	udivcc	%g6,	0x1445,	%o4
	fba	%fcc1,	loop_2972
	te	%icc,	0x4
loop_2971:
	umulcc	%g3,	%i6,	%o3
	xnor	%g1,	%o5,	%l2
loop_2972:
	fone	%f20
	sdivcc	%i2,	0x199A,	%l5
	edge16n	%g5,	%g4,	%o2
	movge	%icc,	%o7,	%l0
	movcc	%icc,	%i4,	%i5
	sdiv	%g7,	0x02F4,	%i3
	edge16n	%l1,	%g2,	%i1
	mulx	%o0,	0x172D,	%i7
	sethi	0x125F,	%l4
	tvc	%xcc,	0x6
	tsubcc	%o1,	%i0,	%l3
	sir	0x0CF6
	fnor	%f12,	%f18,	%f0
	movgu	%xcc,	%o6,	%l6
	faligndata	%f24,	%f22,	%f16
	movleu	%icc,	%o4,	%g6
	edge32n	%g3,	%i6,	%o3
	udiv	%g1,	0x00EF,	%l2
	fbue,a	%fcc2,	loop_2973
	fandnot1	%f28,	%f28,	%f6
	smulcc	%o5,	0x00C7,	%l5
	and	%g5,	%i2,	%g4
loop_2973:
	ldsh	[%l7 + 0x46],	%o2
	sdiv	%o7,	0x0394,	%l0
	tsubcctv	%i4,	%g7,	%i3
	fbul,a	%fcc2,	loop_2974
	sethi	0x05F2,	%l1
	ldstub	[%l7 + 0x47],	%g2
	movl	%xcc,	%i5,	%i1
loop_2974:
	call	loop_2975
	fxnors	%f24,	%f10,	%f13
	fmovsn	%xcc,	%f16,	%f17
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x78] %asi,	%o0
loop_2975:
	movrlz	%i7,	0x085,	%o1
	fmovdl	%icc,	%f5,	%f27
	tsubcctv	%i0,	0x1C1E,	%l4
	fands	%f28,	%f8,	%f0
	sdivx	%l3,	0x1E12,	%l6
	add	%o4,	%g6,	%o6
	tleu	%xcc,	0x0
	array16	%g3,	%i6,	%g1
	umul	%o3,	0x04BB,	%o5
	brz,a	%l2,	loop_2976
	fmovsge	%icc,	%f11,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l5,	%i2,	%g4
loop_2976:
	movne	%xcc,	%o2,	%o7
	tvs	%icc,	0x7
	fnot2s	%f19,	%f9
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%l0,	loop_2977
	be,pt	%icc,	loop_2978
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f16
	andn	%g5,	%g7,	%i3
loop_2977:
	xorcc	%l1,	%i4,	%i5
loop_2978:
	tne	%xcc,	0x2
	alignaddr	%g2,	%i1,	%o0
	sdiv	%i7,	0x0430,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%l4,	loop_2979
	fbue	%fcc3,	loop_2980
	sdiv	%l3,	0x0613,	%l6
	brgez	%o4,	loop_2981
loop_2979:
	sdivcc	%i0,	0x0CDF,	%g6
loop_2980:
	tneg	%xcc,	0x4
	membar	0x7D
loop_2981:
	xnor	%o6,	%g3,	%g1
	membar	0x6B
	fblg,a	%fcc0,	loop_2982
	subcc	%i6,	0x1753,	%o3
	udiv	%o5,	0x10CC,	%l2
	fandnot1	%f20,	%f6,	%f26
loop_2982:
	bvs,a	loop_2983
	tg	%icc,	0x1
	fcmpne32	%f24,	%f18,	%i2
	set	0x50, %g7
	lduwa	[%l7 + %g7] 0x88,	%l5
loop_2983:
	sll	%o2,	%g4,	%o7
	edge32ln	%g5,	%l0,	%g7
	movn	%icc,	%l1,	%i3
	fcmpgt32	%f14,	%f2,	%i4
	add	%g2,	0x1E0B,	%i5
	tneg	%icc,	0x5
	add	%o0,	0x02A0,	%i7
	fmovsleu	%xcc,	%f23,	%f13
	nop
	setx	0x2DF326A098C06B17,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xA1BC804E0263FA8F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f16,	%f14
	umul	%i1,	0x1C2C,	%o1
	movvs	%xcc,	%l4,	%l3
	tge	%icc,	0x1
	movcc	%xcc,	%l6,	%o4
	set	0x37, %g3
	ldstuba	[%l7 + %g3] 0x80,	%g6
	ldstub	[%l7 + 0x31],	%o6
	tpos	%xcc,	0x1
	movrne	%i0,	0x17B,	%g3
	udivx	%g1,	0x0E93,	%i6
	fmul8sux16	%f26,	%f18,	%f8
	fbul,a	%fcc3,	loop_2984
	mulx	%o5,	0x0C48,	%o3
	movcs	%icc,	%l2,	%i2
	nop
	setx	0x10B2331B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xDBAAE262,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f16,	%f3
loop_2984:
	fmovdl	%xcc,	%f10,	%f25
	fcmple32	%f26,	%f10,	%o2
	array32	%g4,	%l5,	%o7
	sra	%l0,	0x14,	%g5
	mulscc	%g7,	%l1,	%i3
	edge32ln	%g2,	%i4,	%o0
	umulcc	%i5,	%i1,	%i7
	movvs	%xcc,	%l4,	%l3
	xor	%o1,	%l6,	%g6
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x57] %asi,	%o6
	movrgz	%o4,	0x3DB,	%g3
	set	0x4E, %l0
	lduba	[%l7 + %l0] 0x04,	%i0
	ble	%xcc,	loop_2985
	movre	%i6,	%g1,	%o3
	st	%f26,	[%l7 + 0x74]
	be	loop_2986
loop_2985:
	te	%xcc,	0x6
	taddcctv	%o5,	%i2,	%o2
	movn	%icc,	%g4,	%l5
loop_2986:
	movrgez	%l2,	%o7,	%l0
	movpos	%icc,	%g7,	%l1
	ldsw	[%l7 + 0x74],	%g5
	addccc	%i3,	0x0AA6,	%g2
	set	0x49, %i1
	ldstuba	[%l7 + %i1] 0x19,	%i4
	tcc	%xcc,	0x3
	fmovsle	%icc,	%f3,	%f14
	prefetch	[%l7 + 0x78],	 0x2
	orn	%o0,	0x021D,	%i5
	ba,pn	%xcc,	loop_2987
	edge16l	%i1,	%l4,	%l3
	sdiv	%i7,	0x0A5C,	%l6
	tsubcc	%o1,	%o6,	%o4
loop_2987:
	srax	%g3,	0x13,	%i0
	addc	%g6,	0x193C,	%g1
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x15
	mova	%icc,	%o3,	%i6
	tle	%icc,	0x3
	tcs	%xcc,	0x3
	fone	%f20
	tsubcc	%i2,	%o5,	%o2
	movn	%xcc,	%g4,	%l2
	edge32ln	%l5,	%o7,	%g7
	fmul8ulx16	%f2,	%f2,	%f30
	nop
	setx	loop_2988,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpadd32s	%f22,	%f8,	%f11
	nop
	fitos	%f8,	%f6
	fstod	%f6,	%f22
	fmovrsgz	%l1,	%f17,	%f28
loop_2988:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x20] %asi,	%l0
	tsubcctv	%g5,	%g2,	%i4
	fcmpne16	%f6,	%f14,	%o0
	subcc	%i5,	0x040B,	%i3
	movg	%xcc,	%i1,	%l4
	movrgez	%l3,	0x3F0,	%l6
	movn	%icc,	%i7,	%o1
	fmovdle	%icc,	%f19,	%f7
	brlez,a	%o6,	loop_2989
	brgz	%g3,	loop_2990
	xor	%o4,	0x03E9,	%i0
	edge16ln	%g1,	%g6,	%i6
loop_2989:
	array8	%i2,	%o3,	%o5
loop_2990:
	xorcc	%o2,	%l2,	%g4
	edge8l	%l5,	%o7,	%l1
	mulx	%l0,	%g5,	%g2
	fmovrsne	%i4,	%f5,	%f2
	sllx	%o0,	0x14,	%i5
	ldsh	[%l7 + 0x7E],	%i3
	xor	%g7,	%i1,	%l4
	fmovsge	%xcc,	%f30,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l3,	%i7,	%o1
	ldsw	[%l7 + 0x18],	%o6
	faligndata	%f8,	%f10,	%f18
	fnegs	%f2,	%f31
	bge,pn	%icc,	loop_2991
	sdiv	%l6,	0x1514,	%o4
	bl,pt	%xcc,	loop_2992
	st	%f21,	[%l7 + 0x4C]
loop_2991:
	nop
	fitod	%f18,	%f2
	nop
	setx	0x0FB5BB110B5E6230,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x1E57B3B150F382B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f16,	%f2
loop_2992:
	tleu	%icc,	0x1
	fandnot1s	%f24,	%f21,	%f14
	srlx	%g3,	%g1,	%i0
	set	0x6A, %i6
	lduba	[%l7 + %i6] 0x80,	%i6
	edge16ln	%g6,	%o3,	%i2
	srl	%o5,	%l2,	%g4
	tsubcctv	%l5,	%o7,	%o2
	bgu,a,pn	%icc,	loop_2993
	srl	%l1,	0x19,	%l0
	wr	%g0,	0x88,	%asi
	sta	%f30,	[%l7 + 0x60] %asi
loop_2993:
	sll	%g2,	%g5,	%o0
	ba,a,pt	%icc,	loop_2994
	subc	%i5,	%i3,	%g7
	ldub	[%l7 + 0x45],	%i4
	movge	%xcc,	%i1,	%l4
loop_2994:
	andn	%i7,	%o1,	%o6
	fmovsl	%xcc,	%f27,	%f17
	move	%xcc,	%l6,	%l3
	fmul8x16al	%f6,	%f4,	%f26
	te	%xcc,	0x4
	bvc,a,pn	%icc,	loop_2995
	nop
	setx	0xABF1A58E8070B0C6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	taddcctv	%o4,	0x1C08,	%g3
	mulx	%g1,	%i6,	%g6
loop_2995:
	tn	%icc,	0x7
	call	loop_2996
	udivx	%i0,	0x010C,	%i2
	tcs	%icc,	0x7
	movre	%o5,	0x3CB,	%l2
loop_2996:
	fmovdleu	%icc,	%f24,	%f7
	fnot2s	%f30,	%f10
	edge16l	%g4,	%l5,	%o7
	movvc	%icc,	%o3,	%l1
	fpackfix	%f8,	%f28
	fbn	%fcc1,	loop_2997
	movvs	%xcc,	%l0,	%g2
	bg	loop_2998
	array8	%o2,	%o0,	%i5
loop_2997:
	array16	%i3,	%g5,	%g7
	movleu	%xcc,	%i1,	%i4
loop_2998:
	orn	%i7,	%o1,	%l4
	set	0x76, %l4
	ldstuba	[%l7 + %l4] 0x04,	%l6
	movre	%o6,	0x079,	%l3
	movl	%xcc,	%o4,	%g3
	sub	%g1,	%g6,	%i6
	sir	0x0671
	addcc	%i2,	%i0,	%l2
	tsubcc	%g4,	0x1240,	%l5
	movg	%xcc,	%o7,	%o3
	sub	%o5,	%l0,	%g2
	edge8	%o2,	%o0,	%i5
	fpsub32	%f6,	%f4,	%f8
	brlez,a	%l1,	loop_2999
	fmovdvc	%icc,	%f17,	%f16
	ta	%icc,	0x7
	fmovde	%xcc,	%f9,	%f16
loop_2999:
	sdivcc	%i3,	0x0E82,	%g7
	nop
	set	0x70, %l3
	sth	%i1,	[%l7 + %l3]
	nop
	fitos	%f10,	%f27
	fstoi	%f27,	%f20
	edge16ln	%g5,	%i7,	%o1
	tpos	%icc,	0x5
	nop
	setx loop_3000, %l0, %l1
	jmpl %l1, %l4
	bvc,pn	%xcc,	loop_3001
	fcmpeq32	%f8,	%f10,	%l6
	udivcc	%o6,	0x1F7E,	%i4
loop_3000:
	fnot1	%f4,	%f22
loop_3001:
	smul	%o4,	%l3,	%g1
	tpos	%xcc,	0x7
	fsrc2	%f12,	%f28
	fmovdcc	%xcc,	%f20,	%f3
	srlx	%g6,	0x11,	%i6
	subccc	%i2,	0x060F,	%g3
	xnor	%l2,	0x1A05,	%g4
	set	0x34, %g5
	sta	%f31,	[%l7 + %g5] 0x80
	movrgz	%i0,	0x0BE,	%o7
	fand	%f0,	%f10,	%f24
	srl	%l5,	0x0E,	%o5
	tleu	%xcc,	0x2
	tpos	%icc,	0x2
	tpos	%icc,	0x0
	fcmple16	%f10,	%f10,	%o3
	udiv	%l0,	0x1E65,	%o2
	smul	%o0,	%g2,	%l1
	edge8n	%i5,	%g7,	%i3
	ldd	[%l7 + 0x38],	%g4
	sdivx	%i1,	0x167C,	%i7
	tpos	%xcc,	0x2
	fmovsge	%xcc,	%f25,	%f29
	edge16l	%o1,	%l6,	%o6
	be,pn	%xcc,	loop_3002
	array32	%i4,	%l4,	%o4
	movne	%icc,	%g1,	%l3
	ldd	[%l7 + 0x38],	%i6
loop_3002:
	nop
	setx loop_3003, %l0, %l1
	jmpl %l1, %g6
	sdivx	%g3,	0x06F7,	%i2
	set	0x2A, %o5
	stha	%l2,	[%l7 + %o5] 0x15
loop_3003:
	movre	%g4,	0x22F,	%o7
	swap	[%l7 + 0x54],	%i0
	subcc	%l5,	%o5,	%l0
	faligndata	%f4,	%f12,	%f22
	ldsh	[%l7 + 0x48],	%o3
	membar	0x55
	fmovrde	%o2,	%f26,	%f22
	nop
	setx	0x4BCA7755,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x0A6019D4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f14,	%f23
	nop
	setx	0x88322F18A8D743D7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xB1AF4BF8D902E503,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f10,	%f14
	movvs	%icc,	%o0,	%g2
	nop
	fitod	%f6,	%f18
	fdtoi	%f18,	%f11
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x2e,	%i4
	tvs	%xcc,	0x4
	alignaddrl	%l1,	%g7,	%i3
	set	0x08, %g1
	swapa	[%l7 + %g1] 0x11,	%i1
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x70] %asi,	%g4
	mulscc	%i7,	%o1,	%l6
	sdivx	%i4,	0x1002,	%o6
	fors	%f29,	%f16,	%f24
	nop
	setx	0x2CCCA85BA05C1E5D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	nop
	fitod	%f2,	%f18
	fdtos	%f18,	%f15
	fpadd32	%f22,	%f24,	%f26
	set	0x2F, %i0
	ldstuba	[%l7 + %i0] 0x89,	%o4
	movgu	%icc,	%l4,	%l3
	bne	loop_3004
	tsubcctv	%g1,	%g6,	%g3
	fpsub32s	%f8,	%f20,	%f7
	edge32n	%i6,	%i2,	%g4
loop_3004:
	fone	%f12
	movrgz	%o7,	%i0,	%l2
	andcc	%l5,	0x1150,	%o5
	xor	%o3,	%o2,	%o0
	brlez	%g2,	loop_3005
	sdivcc	%i5,	0x1AC3,	%l0
	fmovd	%f14,	%f16
	andcc	%g7,	%l1,	%i1
loop_3005:
	sir	0x1F71
	tn	%icc,	0x4
	fmovdvc	%xcc,	%f8,	%f5
	fble,a	%fcc1,	loop_3006
	xnorcc	%i3,	%g5,	%o1
	nop
	fitod	%f27,	%f16
	bne	%icc,	loop_3007
loop_3006:
	movrlez	%l6,	0x0E3,	%i7
	movrne	%i4,	%o6,	%o4
	tsubcc	%l3,	0x17CD,	%l4
loop_3007:
	umulcc	%g6,	%g1,	%g3
	fmovspos	%xcc,	%f6,	%f26
	movrgez	%i2,	%g4,	%i6
	movge	%xcc,	%o7,	%i0
	udiv	%l5,	0x06BB,	%l2
	bg,a	%icc,	loop_3008
	fmovdle	%xcc,	%f7,	%f23
	brlez	%o3,	loop_3009
	fnands	%f31,	%f11,	%f16
loop_3008:
	umulcc	%o2,	%o0,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3009:
	brlez	%i5,	loop_3010
	alignaddrl	%g2,	%l0,	%g7
	nop
	setx	0xE9DD1E37CC7BC340,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xC9829C8AFF804588,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f24,	%f0
	edge8	%l1,	%i3,	%g5
loop_3010:
	fmovdvc	%icc,	%f26,	%f3
	addccc	%i1,	0x0253,	%l6
	bvc,a	%xcc,	loop_3011
	ba	%icc,	loop_3012
	sdivx	%o1,	0x098B,	%i4
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x1e,	%f16
loop_3011:
	array16	%o6,	%i7,	%o4
loop_3012:
	udivx	%l3,	0x015E,	%g6
	movrgez	%g1,	0x248,	%g3
	taddcc	%i2,	0x10C6,	%l4
	sdivx	%i6,	0x134E,	%o7
	taddcctv	%i0,	0x1A82,	%g4
	edge8n	%l2,	%o3,	%o2
	fornot2s	%f5,	%f9,	%f20
	edge16l	%o0,	%o5,	%i5
	nop
	fitod	%f12,	%f20
	fdtos	%f20,	%f17
	tg	%xcc,	0x3
	movrne	%l5,	0x041,	%g2
	set	0x64, %o3
	lda	[%l7 + %o3] 0x11,	%f12
	fand	%f20,	%f20,	%f20
	edge16ln	%g7,	%l0,	%l1
	xnorcc	%i3,	0x0148,	%i1
	xor	%g5,	0x10A9,	%o1
	udiv	%l6,	0x10F1,	%o6
	tl	%icc,	0x1
	sra	%i7,	0x0E,	%i4
	orncc	%o4,	%g6,	%l3
	movre	%g1,	0x046,	%i2
	alignaddrl	%l4,	%i6,	%o7
	flush	%l7 + 0x08
	fmovrdlz	%g3,	%f22,	%f26
	fsrc1s	%f20,	%f5
	fble,a	%fcc1,	loop_3013
	fmovdne	%icc,	%f0,	%f2
	edge16	%g4,	%l2,	%i0
	bg	loop_3014
loop_3013:
	movrlz	%o2,	%o0,	%o5
	sdivx	%o3,	0x1495,	%i5
	or	%g2,	0x0195,	%l5
loop_3014:
	tcs	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g7,	%l1,	%i3
	movn	%xcc,	%i1,	%l0
	movrlz	%o1,	%g5,	%o6
	array32	%l6,	%i4,	%o4
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovdle	%icc,	%f15,	%f21
	fmovrslez	%g6,	%f11,	%f17
	sub	%i7,	0x163B,	%l3
	bgu,pn	%icc,	loop_3015
	lduw	[%l7 + 0x10],	%i2
	and	%l4,	0x05AC,	%g1
	movvs	%xcc,	%o7,	%g3
loop_3015:
	fbug	%fcc3,	loop_3016
	sll	%g4,	%l2,	%i0
	movrgez	%o2,	%o0,	%i6
	edge8n	%o5,	%i5,	%g2
loop_3016:
	edge8l	%l5,	%g7,	%o3
	edge16l	%i3,	%i1,	%l0
	movrgz	%o1,	0x085,	%g5
	fba	%fcc0,	loop_3017
	fmovscs	%xcc,	%f23,	%f18
	stbar
	membar	0x04
loop_3017:
	movvs	%icc,	%o6,	%l1
	edge16ln	%i4,	%o4,	%l6
	tcc	%icc,	0x6
	edge8l	%g6,	%i7,	%i2
	fbge	%fcc1,	loop_3018
	movleu	%xcc,	%l3,	%g1
	ba,pt	%icc,	loop_3019
	fcmple32	%f10,	%f10,	%o7
loop_3018:
	fmovrdlz	%g3,	%f4,	%f18
	swap	[%l7 + 0x1C],	%g4
loop_3019:
	and	%l2,	%i0,	%o2
	be,a	%xcc,	loop_3020
	bpos,a	%xcc,	loop_3021
	movre	%o0,	%l4,	%i6
	bcs,pn	%icc,	loop_3022
loop_3020:
	bvc	%xcc,	loop_3023
loop_3021:
	nop
	setx	loop_3024,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array32	%o5,	%g2,	%i5
loop_3022:
	nop
	set	0x20, %i2
	ldx	[%l7 + %i2],	%g7
loop_3023:
	xor	%l5,	0x0AED,	%o3
loop_3024:
	st	%f30,	[%l7 + 0x20]
	subc	%i3,	0x0E3A,	%l0
	nop
	fitos	%f7,	%f14
	fstoi	%f14,	%f29
	fsrc2	%f16,	%f6
	movge	%icc,	%o1,	%i1
	fmovscc	%icc,	%f31,	%f4
	edge8ln	%o6,	%g5,	%l1
	fbe,a	%fcc2,	loop_3025
	xnorcc	%o4,	0x1C77,	%l6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i4,	%g6
loop_3025:
	fmovdgu	%icc,	%f25,	%f29
	array8	%i7,	%i2,	%g1
	smul	%o7,	0x038B,	%l3
	taddcctv	%g4,	0x1CBE,	%g3
	movg	%xcc,	%i0,	%o2
	fors	%f5,	%f0,	%f19
	fmovda	%xcc,	%f5,	%f15
	tne	%xcc,	0x7
	stb	%l2,	[%l7 + 0x57]
	tvc	%xcc,	0x7
	ble,a,pt	%xcc,	loop_3026
	subccc	%o0,	%l4,	%o5
	fandnot2	%f0,	%f4,	%f12
	brlez,a	%i6,	loop_3027
loop_3026:
	bneg,a	%icc,	loop_3028
	tvs	%icc,	0x5
	xor	%i5,	0x1FC2,	%g7
loop_3027:
	sdivcc	%l5,	0x0D2A,	%g2
loop_3028:
	edge8l	%o3,	%i3,	%o1
	fmovscc	%xcc,	%f26,	%f3
	edge32ln	%l0,	%i1,	%g5
	sll	%l1,	0x08,	%o6
	nop
	setx	0xDABEDFFF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xC5AF952F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f24,	%f21
	fand	%f20,	%f8,	%f6
	subcc	%o4,	0x084B,	%i4
	sdivcc	%g6,	0x02D8,	%i7
	movl	%xcc,	%l6,	%i2
	tg	%icc,	0x4
	nop
	fitos	%f12,	%f29
	fbo,a	%fcc1,	loop_3029
	prefetch	[%l7 + 0x7C],	 0x3
	xorcc	%g1,	0x1638,	%l3
	orncc	%o7,	0x00FB,	%g4
loop_3029:
	sra	%i0,	0x11,	%o2
	movrgz	%g3,	%l2,	%o0
	ldsb	[%l7 + 0x28],	%o5
	ta	%xcc,	0x5
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x11
	lduw	[%l7 + 0x60],	%i6
	fmovscc	%icc,	%f14,	%f6
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x1e
	membar	#Sync
	tle	%xcc,	0x1
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x60] %asi,	%i5
	nop
	setx	0x48420ABE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x4E79B705,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f25,	%f19
	movvs	%xcc,	%g7,	%l5
	movrlz	%g2,	0x375,	%l4
	tcc	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x16] %asi,	%i3
	addcc	%o3,	0x0E90,	%l0
	smul	%i1,	%o1,	%g5
	umulcc	%o6,	0x1F20,	%o4
	sdivcc	%l1,	0x1FD7,	%g6
	fzeros	%f18
	brgez	%i7,	loop_3030
	fandnot2	%f2,	%f6,	%f18
	stw	%i4,	[%l7 + 0x34]
	array16	%i2,	%l6,	%g1
loop_3030:
	nop
	setx	0x3F394FF3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x112C5673,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f7,	%f25
	tvc	%xcc,	0x5
	and	%o7,	%g4,	%i0
	fmovsleu	%icc,	%f12,	%f27
	array16	%o2,	%g3,	%l2
	nop
	fitod	%f0,	%f12
	fdtos	%f12,	%f11
	fornot1	%f18,	%f0,	%f0
	fmovscc	%icc,	%f9,	%f8
	fmovs	%f29,	%f19
	andncc	%l3,	%o0,	%i6
	fpmerge	%f5,	%f22,	%f16
	subcc	%i5,	%o5,	%g7
	tcc	%xcc,	0x0
	brgz,a	%l5,	loop_3031
	bvs,a	loop_3032
	tcc	%icc,	0x1
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x20] %asi,	%g2
loop_3031:
	movcs	%xcc,	%l4,	%o3
loop_3032:
	ldd	[%l7 + 0x50],	%f26
	srax	%l0,	%i1,	%o1
	edge16l	%g5,	%o6,	%i3
	brz	%l1,	loop_3033
	st	%f26,	[%l7 + 0x7C]
	fmovse	%xcc,	%f16,	%f22
	mulscc	%g6,	%o4,	%i7
loop_3033:
	mova	%icc,	%i4,	%l6
	nop
	fitod	%f10,	%f20
	fdtoi	%f20,	%f23
	tcc	%xcc,	0x5
	fbn,a	%fcc1,	loop_3034
	movrne	%i2,	0x1C0,	%o7
	movcs	%xcc,	%g4,	%g1
	edge32ln	%o2,	%g3,	%l2
loop_3034:
	mulscc	%l3,	%i0,	%o0
	lduh	[%l7 + 0x18],	%i6
	orncc	%i5,	%g7,	%l5
	ldd	[%l7 + 0x20],	%f2
	set	0x6C, %o4
	stwa	%o5,	[%l7 + %o4] 0x2f
	membar	#Sync
	tsubcc	%l4,	%o3,	%l0
	nop
	setx	0x1054EE5C,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	alignaddr	%g2,	%i1,	%g5
	bpos,a	%xcc,	loop_3035
	srlx	%o1,	0x13,	%i3
	udiv	%o6,	0x14D7,	%g6
	fpsub16	%f30,	%f10,	%f2
loop_3035:
	fmovdleu	%xcc,	%f1,	%f30
	edge32	%l1,	%i7,	%i4
	edge8	%o4,	%l6,	%i2
	tgu	%icc,	0x3
	udiv	%o7,	0x09F9,	%g4
	fmovdg	%icc,	%f23,	%f18
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x23] %asi,	%g1
	srlx	%g3,	0x18,	%l2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l3,	%o2
	bcc,pt	%xcc,	loop_3036
	srax	%i0,	0x1F,	%i6
	sdiv	%i5,	0x07C6,	%g7
	movrlez	%o0,	0x1A9,	%l5
loop_3036:
	nop
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x14,	%f16
	alignaddrl	%o5,	%l4,	%l0
	addccc	%g2,	%o3,	%g5
	set	0x15, %i4
	ldstuba	[%l7 + %i4] 0x18,	%o1
	fmul8x16	%f19,	%f24,	%f8
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x48] %asi,	%i3
	fpadd16	%f30,	%f6,	%f20
	fone	%f8
	fmovdvs	%xcc,	%f2,	%f20
	set	0x08, %l2
	ldswa	[%l7 + %l2] 0x15,	%o6
	movcc	%icc,	%i1,	%l1
	bvs,a	%icc,	loop_3037
	fmovrdgez	%i7,	%f6,	%f4
	movcc	%icc,	%g6,	%i4
	nop
	setx	loop_3038,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_3037:
	movcc	%icc,	%l6,	%i2
	orcc	%o7,	%g4,	%o4
	ldd	[%l7 + 0x48],	%f16
loop_3038:
	movn	%icc,	%g1,	%l2
	addccc	%g3,	%o2,	%l3
	xorcc	%i6,	0x075A,	%i0
	fpadd16	%f6,	%f26,	%f0
	bge,pn	%xcc,	loop_3039
	movn	%xcc,	%g7,	%i5
	nop
	setx	loop_3040,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%xcc,	%l5,	%o0
loop_3039:
	edge32	%l4,	%l0,	%o5
	fmovrde	%o3,	%f24,	%f4
loop_3040:
	subcc	%g2,	0x17A9,	%o1
	umulcc	%g5,	%o6,	%i1
	sethi	0x1312,	%l1
	fxors	%f27,	%f11,	%f10
	fnand	%f28,	%f26,	%f20
	fnands	%f13,	%f6,	%f29
	fmovdn	%xcc,	%f5,	%f25
	srax	%i3,	0x00,	%i7
	fmovdge	%icc,	%f27,	%f30
	ldd	[%l7 + 0x60],	%f8
	movleu	%icc,	%g6,	%l6
	movn	%xcc,	%i2,	%o7
	add	%g4,	0x13B0,	%i4
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f24
	fxtod	%f24,	%f14
	tpos	%xcc,	0x2
	edge8ln	%g1,	%l2,	%o4
	bg,a,pn	%xcc,	loop_3041
	fcmple16	%f18,	%f20,	%o2
	fmovdg	%icc,	%f10,	%f29
	edge16n	%g3,	%i6,	%i0
loop_3041:
	tgu	%xcc,	0x4
	fbue,a	%fcc0,	loop_3042
	edge16l	%l3,	%g7,	%i5
	andn	%l5,	0x0571,	%o0
	fbg,a	%fcc0,	loop_3043
loop_3042:
	fone	%f18
	subc	%l0,	%o5,	%l4
	movgu	%icc,	%g2,	%o1
loop_3043:
	fors	%f15,	%f16,	%f7
	set	0x48, %i7
	stwa	%g5,	[%l7 + %i7] 0x23
	membar	#Sync
	movrlz	%o6,	0x008,	%o3
	movcs	%icc,	%i1,	%i3
	srax	%l1,	%g6,	%l6
	addc	%i7,	%i2,	%o7
	tleu	%xcc,	0x3
	movgu	%icc,	%g4,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%i4,	%f19,	%f6
	fandnot2s	%f5,	%f12,	%f14
	taddcctv	%l2,	0x1860,	%o2
	subc	%g3,	0x1EC0,	%i6
	mulx	%o4,	0x0831,	%i0
	tvs	%icc,	0x7
	umul	%l3,	0x1D42,	%g7
	edge32l	%l5,	%o0,	%l0
	tleu	%xcc,	0x6
	xorcc	%o5,	%i5,	%l4
	smulcc	%g2,	0x1C97,	%o1
	edge32n	%g5,	%o6,	%o3
	orncc	%i3,	0x0BD1,	%l1
	movpos	%icc,	%i1,	%l6
	srl	%i7,	%g6,	%i2
	fxnor	%f30,	%f20,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f2,	%f15
	movre	%g4,	0x384,	%o7
	move	%xcc,	%i4,	%l2
	edge32ln	%g1,	%o2,	%g3
	tle	%xcc,	0x2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2787
!	Type cti   	: 3043
!	Type x   	: 1242
!	Type f   	: 4501
!	Type i   	: 13427
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x491F3899
.word 0x7FAA9D2F
.word 0x4678510F
.word 0xA6431FBD
.word 0x1007E141
.word 0xE1AF3904
.word 0x9089C31D
.word 0xDF17C42D
.word 0xC270782B
.word 0xFA901D55
.word 0xBA2DD996
.word 0x610352B8
.word 0x9A8CFD18
.word 0x16B4E2ED
.word 0x30755A51
.word 0x8E4D8FD9
.word 0xC25A0101
.word 0xE7BB7E90
.word 0xFDB98151
.word 0x00130BAC
.word 0x77442C4C
.word 0x7339F443
.word 0x82D83BDD
.word 0xD59DE369
.word 0x8358D717
.word 0x82853676
.word 0x555EDCF6
.word 0x0C9F4E72
.word 0x24D6AD8F
.word 0xF6AB0C5C
.word 0x59DD06E9
.word 0x383C7353
.word 0x5A0E357D
.word 0x4DB95A66
.word 0x27FF4091
.word 0xF269BF82
.word 0xC0320030
.word 0x98241327
.word 0x9C0A6155
.word 0x108C951A
.word 0xA8923814
.word 0x5943D6D4
.word 0x07F8FA1F
.word 0x29EFA71C
.word 0xD704F1E2
.word 0x02633E1D
.word 0xEEFCC643
.word 0x978D21C7
.word 0x1E13B861
.word 0x3F8FD579
.word 0x6A257C56
.word 0x4B39C39B
.word 0x1820C6D1
.word 0x6D78BB9E
.word 0xED4CDE55
.word 0xC2699682
.word 0xE0C181BD
.word 0xBBD5F063
.word 0xE94C5922
.word 0xD075FBBE
.word 0x7C5741C0
.word 0x94C0EEE6
.word 0xDDCDDF92
.word 0xF11567BE
.end
