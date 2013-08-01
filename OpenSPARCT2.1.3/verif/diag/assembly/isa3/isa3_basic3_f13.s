/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f13.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f13.s,v 1.1 2007/05/11 17:22:21 drp Exp $"
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
	setx	0xA2C12BC3104D5E02,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x3,	%g1
	set	0xF,	%g2
	set	0xF,	%g3
	set	0x7,	%g4
	set	0x5,	%g5
	set	0x7,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0xE,	%i1
	set	-0x0,	%i2
	set	-0x7,	%i3
	set	-0x9,	%i4
	set	-0x7,	%i5
	set	-0xF,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x02A0746F,	%l0
	set	0x3446F50C,	%l1
	set	0x6FDF0724,	%l2
	set	0x69984080,	%l3
	set	0x08FD6BA4,	%l4
	set	0x30CBE808,	%l5
	set	0x59737CBF,	%l6
	!# Output registers
	set	-0x07B5,	%o0
	set	0x164B,	%o1
	set	0x073D,	%o2
	set	0x1501,	%o3
	set	0x106B,	%o4
	set	0x15FA,	%o5
	set	0x0926,	%o6
	set	0x1C39,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x90BD83212B2DCADA)
	INIT_TH_FP_REG(%l7,%f2,0xBFAB114EDB0C6608)
	INIT_TH_FP_REG(%l7,%f4,0x74380F4BE2654117)
	INIT_TH_FP_REG(%l7,%f6,0xEACABA69F80D4D5E)
	INIT_TH_FP_REG(%l7,%f8,0x9DFF56AD4833D49F)
	INIT_TH_FP_REG(%l7,%f10,0x68A6B29F2267BBAC)
	INIT_TH_FP_REG(%l7,%f12,0x0C5DC811213DC909)
	INIT_TH_FP_REG(%l7,%f14,0xC039B827E197B0E9)
	INIT_TH_FP_REG(%l7,%f16,0xCF5EB72484F00F4A)
	INIT_TH_FP_REG(%l7,%f18,0x401D7C464B86718A)
	INIT_TH_FP_REG(%l7,%f20,0x6FA79019A8C3CE18)
	INIT_TH_FP_REG(%l7,%f22,0xB7BA18C116AE7843)
	INIT_TH_FP_REG(%l7,%f24,0x8BFD658A122F4ADB)
	INIT_TH_FP_REG(%l7,%f26,0x25237A98BFD8AEC0)
	INIT_TH_FP_REG(%l7,%f28,0x9DCBAF9D26246D3C)
	INIT_TH_FP_REG(%l7,%f30,0x6E5431EC21B8F044)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4CF, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fmovsa	%icc,	%f22,	%f29
	edge32ln	%o5,	%o2,	%g4
	fmovdcs	%icc,	%f23,	%f6
	pdist	%f2,	%f10,	%f2
	fblg,a	%fcc1,	loop_1
	smul	%l2,	0x0771,	%g7
	addccc	%l6,	0x0A3D,	%o3
	edge16l	%g1,	%o6,	%o1
loop_1:
	taddcc	%i2,	%i1,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x68] %asi,	%g6
	fcmped	%fcc2,	%f22,	%f28
	fmovsg	%xcc,	%f5,	%f2
	fsrc2	%f8,	%f18
	umul	%l4,	0x0202,	%i3
	movgu	%xcc,	%i0,	%o7
	ldstub	[%l7 + 0x0E],	%g3
	mova	%xcc,	%i4,	%l5
	movgu	%icc,	%o4,	%i5
	sub	%l1,	%l3,	%o0
	mulscc	%g2,	%i7,	%l0
	tge	%xcc,	0x5
	sdivx	%i6,	0x1C06,	%o2
	sethi	0x064B,	%g4
	srax	%l2,	%g7,	%l6
	edge8l	%o5,	%g1,	%o3
	movpos	%xcc,	%o6,	%i2
	umul	%i1,	%g5,	%o1
	smulcc	%l4,	0x0FED,	%g6
	fmul8ulx16	%f26,	%f26,	%f16
	movle	%icc,	%i0,	%i3
	te	%icc,	0x3
	movre	%o7,	0x1F6,	%g3
	movle	%xcc,	%l5,	%o4
	udivcc	%i5,	0x1190,	%l1
	edge8l	%l3,	%i4,	%o0
	xnor	%g2,	%i7,	%i6
	tsubcctv	%l0,	0x0A60,	%o2
	subcc	%g4,	0x031A,	%l2
	set	0x1E, %l6
	ldsba	[%l7 + %l6] 0x89,	%l6
	fpsub32	%f6,	%f28,	%f26
	tle	%icc,	0x5
	move	%xcc,	%o5,	%g1
	fbul,a	%fcc1,	loop_2
	fmovrdgz	%o3,	%f28,	%f10
	movl	%xcc,	%o6,	%i2
	tle	%xcc,	0x4
loop_2:
	fpsub32	%f18,	%f10,	%f12
	movne	%xcc,	%g7,	%i1
	bcs,a	loop_3
	popc	%o1,	%l4
	move	%icc,	%g5,	%g6
	fbg	%fcc0,	loop_4
loop_3:
	udivx	%i0,	0x0A33,	%i3
	bn,pt	%xcc,	loop_5
	movvc	%icc,	%o7,	%g3
loop_4:
	lduw	[%l7 + 0x54],	%l5
	or	%i5,	0x1654,	%o4
loop_5:
	fbne,a	%fcc0,	loop_6
	be,a	loop_7
	move	%xcc,	%l1,	%i4
	bvc,pn	%xcc,	loop_8
loop_6:
	sethi	0x1D4E,	%o0
loop_7:
	fcmple16	%f28,	%f26,	%l3
	fpsub32s	%f24,	%f5,	%f29
loop_8:
	fzeros	%f4
	edge16ln	%g2,	%i6,	%i7
	tneg	%xcc,	0x5
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x72] %asi,	%l0
	fbuge	%fcc1,	loop_9
	ba	loop_10
	bg,a	loop_11
	fmovsleu	%icc,	%f7,	%f6
loop_9:
	fbl,a	%fcc1,	loop_12
loop_10:
	movrne	%g4,	%l2,	%o2
loop_11:
	ldd	[%l7 + 0x48],	%o4
	movg	%xcc,	%g1,	%o3
loop_12:
	xor	%l6,	0x1A75,	%i2
	fmovsl	%xcc,	%f26,	%f8
	edge8n	%o6,	%g7,	%i1
	popc	0x1D80,	%o1
	popc	0x0CD8,	%l4
	edge32l	%g6,	%g5,	%i3
	fba,a	%fcc1,	loop_13
	fornot1s	%f2,	%f7,	%f30
	tleu	%xcc,	0x5
	addcc	%o7,	%i0,	%g3
loop_13:
	fbn,a	%fcc1,	loop_14
	srlx	%l5,	%i5,	%l1
	xorcc	%i4,	0x16B5,	%o4
	edge32n	%l3,	%g2,	%o0
loop_14:
	fpadd16	%f28,	%f22,	%f18
	edge32ln	%i7,	%l0,	%i6
	udivx	%l2,	0x1280,	%o2
	udivx	%o5,	0x1BCE,	%g4
	bpos	%xcc,	loop_15
	te	%xcc,	0x4
	tle	%icc,	0x1
	fxor	%f2,	%f18,	%f14
loop_15:
	tge	%icc,	0x4
	sll	%g1,	%o3,	%i2
	fmovrsgez	%l6,	%f7,	%f29
	bneg	loop_16
	edge32l	%o6,	%i1,	%g7
	xnor	%o1,	0x009D,	%l4
	fcmpgt32	%f8,	%f28,	%g5
loop_16:
	for	%f0,	%f24,	%f0
	movre	%g6,	%i3,	%i0
	fcmple16	%f12,	%f22,	%o7
	edge8n	%g3,	%i5,	%l1
	nop
	set	0x70, %o6
	lduw	[%l7 + %o6],	%i4
	tne	%icc,	0x7
	fsrc2s	%f13,	%f0
	tpos	%icc,	0x1
	edge8l	%o4,	%l3,	%l5
	fmovsne	%icc,	%f28,	%f18
	bshuffle	%f24,	%f28,	%f10
	tsubcc	%o0,	0x1FAE,	%i7
	tsubcctv	%g2,	%i6,	%l0
	fmovdvc	%icc,	%f27,	%f28
	set	0x10, %o3
	stxa	%o2,	[%l7 + %o3] 0x22
	membar	#Sync
	edge32	%o5,	%l2,	%g4
	set	0x48, %g1
	stda	%o2,	[%l7 + %g1] 0x04
	udiv	%g1,	0x0287,	%i2
	sub	%l6,	0x18AC,	%o6
	stb	%g7,	[%l7 + 0x5E]
	movvc	%icc,	%i1,	%l4
	or	%o1,	0x17E5,	%g5
	te	%xcc,	0x2
	tn	%icc,	0x0
	edge32	%g6,	%i0,	%i3
	tvs	%icc,	0x4
	andcc	%o7,	0x09A6,	%i5
	ta	%xcc,	0x6
	sra	%g3,	0x14,	%i4
	mova	%xcc,	%o4,	%l1
	tpos	%icc,	0x6
	edge8l	%l3,	%o0,	%i7
	fxor	%f14,	%f22,	%f12
	tleu	%icc,	0x3
	mulx	%g2,	0x0CC1,	%i6
	andn	%l0,	0x0EA9,	%o2
	siam	0x4
	tvs	%xcc,	0x0
	fcmps	%fcc2,	%f4,	%f31
	fpsub16	%f26,	%f6,	%f24
	fands	%f23,	%f0,	%f2
	taddcctv	%l5,	0x1812,	%o5
	lduw	[%l7 + 0x5C],	%g4
	array32	%o3,	%g1,	%i2
	fmovrde	%l2,	%f20,	%f4
	ldsw	[%l7 + 0x54],	%o6
	tsubcc	%l6,	%g7,	%l4
	movvs	%xcc,	%i1,	%g5
	movrne	%o1,	%g6,	%i3
	fmovdl	%icc,	%f27,	%f15
	edge32ln	%o7,	%i0,	%g3
	tl	%xcc,	0x7
	brlz	%i4,	loop_17
	fmovde	%icc,	%f8,	%f23
	fbo,a	%fcc3,	loop_18
	tge	%icc,	0x0
loop_17:
	alignaddrl	%i5,	%l1,	%o4
	smul	%o0,	0x16B1,	%i7
loop_18:
	tvs	%xcc,	0x5
	movg	%xcc,	%l3,	%i6
	tpos	%icc,	0x7
	ldsb	[%l7 + 0x27],	%l0
	edge16ln	%g2,	%l5,	%o2
	movcs	%xcc,	%o5,	%g4
	movl	%icc,	%g1,	%o3
	tle	%icc,	0x2
	udivx	%i2,	0x03FE,	%o6
	tge	%icc,	0x3
	fmovrse	%l2,	%f2,	%f13
	fpadd32s	%f11,	%f25,	%f16
	tle	%xcc,	0x4
	edge8l	%g7,	%l4,	%l6
	xor	%g5,	0x0CED,	%o1
	srax	%g6,	%i3,	%i1
	fblg,a	%fcc1,	loop_19
	fmovsvs	%xcc,	%f19,	%f22
	bleu,a	%xcc,	loop_20
	taddcc	%o7,	%g3,	%i0
loop_19:
	stx	%i5,	[%l7 + 0x50]
	umulcc	%l1,	%o4,	%o0
loop_20:
	or	%i7,	%i4,	%i6
	sub	%l0,	%l3,	%l5
	fnor	%f30,	%f12,	%f14
	edge32n	%g2,	%o5,	%o2
	set	0x4C, %l2
	swapa	[%l7 + %l2] 0x80,	%g1
	fmovrsgez	%g4,	%f27,	%f22
	smulcc	%o3,	%i2,	%o6
	fnot1	%f6,	%f4
	movrlz	%l2,	0x3E1,	%l4
	fornot2	%f2,	%f10,	%f20
	srlx	%g7,	%g5,	%l6
	movrne	%g6,	%i3,	%o1
	movleu	%icc,	%o7,	%g3
	popc	%i0,	%i5
	mulscc	%l1,	%i1,	%o4
	fnands	%f6,	%f28,	%f20
	tcc	%xcc,	0x2
	set	0x5C, %o7
	sta	%f12,	[%l7 + %o7] 0x15
	fzero	%f10
	brz,a	%i7,	loop_21
	sub	%o0,	0x145A,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f6,	%f2,	%i6
loop_21:
	movleu	%xcc,	%l3,	%l0
	fmovscc	%xcc,	%f28,	%f25
	subccc	%l5,	%o5,	%o2
	ldub	[%l7 + 0x47],	%g2
	fba	%fcc0,	loop_22
	tleu	%icc,	0x1
	fmovscc	%xcc,	%f4,	%f0
	xnorcc	%g1,	%o3,	%g4
loop_22:
	sdiv	%i2,	0x1C54,	%l2
	udivx	%o6,	0x1CC2,	%g7
	andn	%l4,	%l6,	%g5
	ba,pn	%xcc,	loop_23
	fbu,a	%fcc1,	loop_24
	ldsw	[%l7 + 0x5C],	%i3
	subcc	%g6,	0x0379,	%o7
loop_23:
	subc	%o1,	%g3,	%i0
loop_24:
	fornot2s	%f7,	%f31,	%f25
	set	0x68, %i4
	stda	%i4,	[%l7 + %i4] 0x2b
	membar	#Sync
	movrgez	%l1,	0x077,	%i1
	tne	%icc,	0x5
	fsrc1s	%f29,	%f17
	fbg,a	%fcc0,	loop_25
	sra	%o4,	%i7,	%o0
	tpos	%icc,	0x7
	move	%icc,	%i6,	%i4
loop_25:
	tsubcc	%l3,	%l5,	%o5
	bg,pn	%icc,	loop_26
	te	%icc,	0x3
	fblg	%fcc3,	loop_27
	bneg,a	loop_28
loop_26:
	fsrc2s	%f23,	%f11
	fzeros	%f19
loop_27:
	membar	0x03
loop_28:
	addccc	%l0,	0x1410,	%g2
	ta	%xcc,	0x0
	edge16	%g1,	%o2,	%o3
	fandnot1	%f22,	%f20,	%f20
	stbar
	brlez	%i2,	loop_29
	movleu	%xcc,	%l2,	%o6
	movleu	%icc,	%g7,	%l4
	movne	%icc,	%l6,	%g5
loop_29:
	movneg	%xcc,	%g4,	%i3
	bvs,pt	%icc,	loop_30
	tleu	%icc,	0x0
	udivx	%o7,	0x0AA6,	%o1
	bneg,a	loop_31
loop_30:
	smulcc	%g3,	0x1D12,	%g6
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x17,	%f0
loop_31:
	nop
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%l1
	fmul8x16	%f30,	%f22,	%f22
	udivcc	%i1,	0x1B7B,	%o4
	tge	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f3,	%f11,	%f12
	stb	%i7,	[%l7 + 0x4D]
	tcs	%xcc,	0x6
	tvs	%icc,	0x0
	umul	%i5,	%i6,	%i4
	fmovrdgez	%l3,	%f8,	%f30
	mulscc	%o0,	0x1E5B,	%o5
	tvc	%xcc,	0x1
	bvs,a	loop_32
	fmul8ulx16	%f26,	%f10,	%f2
	edge16l	%l0,	%l5,	%g1
	edge32ln	%g2,	%o2,	%i2
loop_32:
	alignaddrl	%o3,	%l2,	%g7
	fsrc1s	%f25,	%f12
	fmovse	%icc,	%f27,	%f3
	bne,a	%xcc,	loop_33
	bgu,a,pn	%xcc,	loop_34
	orncc	%l4,	0x0FC3,	%l6
	brlz	%g5,	loop_35
loop_33:
	fmovdpos	%icc,	%f30,	%f26
loop_34:
	stbar
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x10] %asi,	%o6
loop_35:
	nop
	set	0x60, %o4
	stxa	%i3,	[%l7 + %o4] 0x23
	membar	#Sync
	fbne	%fcc3,	loop_36
	movne	%xcc,	%o7,	%o1
	fmovrslz	%g4,	%f5,	%f4
	sll	%g6,	0x17,	%i0
loop_36:
	fpadd32	%f26,	%f30,	%f18
	wr	%g0,	0x04,	%asi
	stha	%g3,	[%l7 + 0x42] %asi
	move	%icc,	%i1,	%l1
	fbue,a	%fcc2,	loop_37
	umul	%o4,	0x10C2,	%i5
	edge16	%i7,	%i4,	%i6
	ta	%xcc,	0x3
loop_37:
	fxnor	%f8,	%f8,	%f28
	tcc	%xcc,	0x6
	fzero	%f28
	sdivcc	%o0,	0x0A84,	%o5
	array32	%l3,	%l0,	%g1
	fbuge,a	%fcc1,	loop_38
	movneg	%xcc,	%l5,	%g2
	orcc	%i2,	0x1E2B,	%o3
	fbne	%fcc3,	loop_39
loop_38:
	alignaddr	%l2,	%g7,	%o2
	fzero	%f2
	te	%icc,	0x6
loop_39:
	nop
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%l6
	addcc	%l4,	%g5,	%i3
	movn	%xcc,	%o6,	%o1
	edge32ln	%g4,	%g6,	%i0
	fmovdvc	%icc,	%f16,	%f5
	xorcc	%o7,	0x04FE,	%g3
	tsubcc	%l1,	%i1,	%o4
	fmovdcs	%icc,	%f29,	%f4
	movrgez	%i7,	0x250,	%i4
	pdist	%f8,	%f22,	%f4
	ldsb	[%l7 + 0x54],	%i6
	andcc	%i5,	0x122D,	%o5
	lduh	[%l7 + 0x22],	%l3
	bpos	loop_40
	movrlez	%o0,	0x126,	%g1
	movcc	%icc,	%l0,	%g2
	fbge,a	%fcc1,	loop_41
loop_40:
	movg	%icc,	%l5,	%o3
	set	0x7C, %l5
	sta	%f11,	[%l7 + %l5] 0x18
loop_41:
	fpadd16s	%f15,	%f27,	%f9
	movl	%xcc,	%i2,	%g7
	fabsd	%f0,	%f2
	fmuld8sux16	%f30,	%f18,	%f22
	udivcc	%l2,	0x036B,	%o2
	array8	%l6,	%g5,	%i3
	srlx	%l4,	0x16,	%o6
	stbar
	tg	%xcc,	0x4
	srlx	%o1,	0x1E,	%g6
	fmovsl	%icc,	%f7,	%f9
	st	%f27,	[%l7 + 0x7C]
	fxor	%f8,	%f22,	%f6
	sdiv	%g4,	0x0503,	%i0
	array32	%g3,	%o7,	%i1
	ta	%xcc,	0x4
	orcc	%l1,	0x12E4,	%i7
	fpadd32	%f4,	%f2,	%f8
	orn	%o4,	0x0E36,	%i4
	tsubcc	%i6,	%o5,	%i5
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x48] %asi,	%f16
	udivcc	%l3,	0x02AB,	%o0
	orcc	%l0,	%g1,	%l5
	alignaddrl	%g2,	%i2,	%g7
	tle	%icc,	0x6
	fandnot2s	%f31,	%f24,	%f11
	mova	%xcc,	%o3,	%l2
	ta	%icc,	0x1
	fsrc2s	%f7,	%f8
	udiv	%l6,	0x0B65,	%o2
	taddcctv	%g5,	0x0836,	%l4
	movrne	%i3,	%o1,	%g6
	te	%xcc,	0x0
	umulcc	%o6,	%i0,	%g3
	movcs	%icc,	%g4,	%o7
	move	%icc,	%i1,	%i7
	fmovse	%icc,	%f2,	%f3
	movg	%icc,	%o4,	%i4
	tne	%xcc,	0x5
	nop
	set	0x5A, %i2
	ldsh	[%l7 + %i2],	%i6
	array16	%l1,	%i5,	%l3
	te	%icc,	0x6
	fornot1	%f28,	%f8,	%f6
	alignaddr	%o5,	%o0,	%g1
	tge	%icc,	0x2
	move	%icc,	%l0,	%l5
	fornot2s	%f9,	%f21,	%f10
	sra	%g2,	0x11,	%g7
	smulcc	%o3,	%l2,	%l6
	smul	%o2,	0x0340,	%i2
	call	loop_42
	srax	%g5,	0x00,	%i3
	fmovdn	%icc,	%f24,	%f2
	brgez,a	%o1,	loop_43
loop_42:
	fbne,a	%fcc2,	loop_44
	edge8n	%g6,	%o6,	%i0
	bvc,pt	%icc,	loop_45
loop_43:
	sdiv	%l4,	0x0B16,	%g3
loop_44:
	movvs	%icc,	%g4,	%i1
	movg	%icc,	%o7,	%o4
loop_45:
	movcs	%xcc,	%i4,	%i6
	xnorcc	%l1,	0x0E75,	%i5
	fmovde	%xcc,	%f17,	%f11
	fxnor	%f0,	%f16,	%f8
	xorcc	%l3,	%i7,	%o5
	fandnot2	%f12,	%f14,	%f26
	fblg	%fcc3,	loop_46
	fcmpne16	%f0,	%f2,	%g1
	edge16ln	%l0,	%l5,	%o0
	movcc	%icc,	%g7,	%g2
loop_46:
	xnor	%o3,	0x05D3,	%l6
	call	loop_47
	bneg,pn	%xcc,	loop_48
	sth	%l2,	[%l7 + 0x1A]
	fornot2	%f28,	%f16,	%f2
loop_47:
	movleu	%xcc,	%i2,	%o2
loop_48:
	nop
	set	0x6C, %g4
	stha	%i3,	[%l7 + %g4] 0x0c
	fbule,a	%fcc0,	loop_49
	srlx	%o1,	%g6,	%g5
	orn	%i0,	%l4,	%o6
	fnot2	%f24,	%f24
loop_49:
	andncc	%g4,	%g3,	%o7
	ldub	[%l7 + 0x6B],	%i1
	fnegd	%f28,	%f10
	taddcctv	%i4,	0x13D7,	%i6
	movre	%o4,	0x0ED,	%i5
	movn	%icc,	%l3,	%i7
	fmovrsgez	%l1,	%f3,	%f17
	tsubcctv	%g1,	0x1131,	%l0
	fnot1s	%f0,	%f13
	tge	%xcc,	0x6
	array8	%l5,	%o5,	%o0
	fcmpne32	%f30,	%f16,	%g7
	fmovrsgez	%g2,	%f17,	%f0
	andn	%l6,	%o3,	%l2
	movn	%icc,	%i2,	%o2
	movrgz	%i3,	%g6,	%o1
	edge8	%i0,	%g5,	%o6
	edge8ln	%l4,	%g3,	%g4
	smul	%o7,	%i4,	%i1
	fmovdne	%xcc,	%f13,	%f12
	udivx	%o4,	0x0660,	%i6
	fnot1s	%f12,	%f8
	movrlz	%l3,	0x224,	%i7
	call	loop_50
	lduh	[%l7 + 0x20],	%l1
	tpos	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50:
	fsrc2	%f16,	%f28
	stbar
	srlx	%i5,	%g1,	%l0
	fpsub16s	%f30,	%f9,	%f23
	movne	%xcc,	%o5,	%o0
	movg	%icc,	%l5,	%g2
	fmovsgu	%xcc,	%f29,	%f18
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x20] %asi,	%g6
	set	0x60, %l4
	ldxa	[%l7 + %l4] 0x18,	%o3
	mulx	%l6,	0x197F,	%i2
	tgu	%icc,	0x0
	fbug,a	%fcc1,	loop_51
	umulcc	%l2,	%o2,	%g6
	tne	%xcc,	0x0
	membar	0x6F
loop_51:
	tvc	%xcc,	0x5
	edge32n	%i3,	%i0,	%o1
	orcc	%o6,	%l4,	%g5
	bge,a,pt	%xcc,	loop_52
	tcs	%icc,	0x2
	edge16n	%g4,	%g3,	%i4
	fmovsleu	%icc,	%f8,	%f4
loop_52:
	sra	%o7,	%i1,	%o4
	srax	%l3,	%i6,	%i7
	bl,pt	%icc,	loop_53
	tne	%xcc,	0x6
	movne	%icc,	%l1,	%g1
	lduw	[%l7 + 0x58],	%l0
loop_53:
	ta	%icc,	0x3
	fornot1	%f2,	%f24,	%f30
	fbue	%fcc1,	loop_54
	bgu,a	%xcc,	loop_55
	tleu	%xcc,	0x0
	fbule,a	%fcc0,	loop_56
loop_54:
	srlx	%o5,	0x0A,	%i5
loop_55:
	bg	loop_57
	smul	%l5,	0x1A87,	%g2
loop_56:
	fcmpeq32	%f24,	%f28,	%o0
	tcs	%icc,	0x6
loop_57:
	smul	%o3,	0x0E09,	%l6
	fmovsleu	%xcc,	%f13,	%f29
	edge16l	%g7,	%i2,	%l2
	nop
	set	0x24, %i6
	ldsw	[%l7 + %i6],	%o2
	fmovse	%xcc,	%f25,	%f24
	umulcc	%i3,	%g6,	%o1
	pdist	%f30,	%f28,	%f18
	tne	%xcc,	0x3
	tsubcctv	%i0,	%o6,	%g5
	smul	%l4,	0x196A,	%g4
	sub	%i4,	0x1E99,	%g3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	brnz,a	%o7,	loop_58
	array16	%o4,	%i1,	%l3
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x10] %asi,	%i6
loop_58:
	fornot2s	%f9,	%f29,	%f8
	brlez,a	%i7,	loop_59
	movre	%g1,	0x117,	%l0
	udivcc	%l1,	0x1844,	%i5
	addc	%l5,	%o5,	%o0
loop_59:
	nop
	set	0x0C, %g7
	ldsba	[%l7 + %g7] 0x80,	%o3
	wr	%g0,	0x2b,	%asi
	stba	%l6,	[%l7 + 0x7B] %asi
	membar	#Sync
	nop
	set	0x60, %l0
	std	%g2,	[%l7 + %l0]
	fcmpeq32	%f12,	%f24,	%g7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l2,	%o2
	andncc	%i2,	%i3,	%o1
	movl	%xcc,	%g6,	%o6
	lduh	[%l7 + 0x6E],	%i0
	bpos	%xcc,	loop_60
	mulscc	%g5,	0x03CD,	%l4
	stb	%i4,	[%l7 + 0x5B]
	movrne	%g4,	0x3A2,	%g3
loop_60:
	xor	%o7,	0x10CD,	%i1
	sllx	%o4,	%i6,	%i7
	tsubcc	%l3,	%g1,	%l0
	ld	[%l7 + 0x58],	%f5
	movrlez	%l1,	0x013,	%l5
	fpack32	%f16,	%f28,	%f14
	fmul8x16al	%f1,	%f19,	%f0
	mulx	%o5,	0x13D8,	%i5
	addccc	%o0,	0x06D7,	%o3
	membar	0x3D
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x42] %asi,	%l6
	srl	%g7,	0x04,	%l2
	movrgez	%o2,	%g2,	%i2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x65] %asi,	%o1
	array8	%i3,	%o6,	%i0
	fmovd	%f24,	%f8
	tge	%icc,	0x2
	udivx	%g6,	0x16EC,	%g5
	move	%xcc,	%i4,	%l4
	sub	%g3,	%o7,	%g4
	ldsh	[%l7 + 0x7C],	%o4
	alignaddrl	%i6,	%i1,	%l3
	edge32ln	%i7,	%g1,	%l1
	xnorcc	%l0,	0x04E8,	%l5
	edge32l	%o5,	%o0,	%i5
	ldx	[%l7 + 0x10],	%o3
	ldd	[%l7 + 0x18],	%f4
	taddcc	%g7,	0x0575,	%l2
	tn	%xcc,	0x3
	subc	%l6,	%g2,	%o2
	edge16	%o1,	%i2,	%o6
	stw	%i3,	[%l7 + 0x38]
	movrne	%g6,	%g5,	%i4
	fmovscc	%xcc,	%f20,	%f7
	smulcc	%l4,	%g3,	%o7
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x40] %asi,	%g4
	te	%xcc,	0x7
	tsubcctv	%i0,	0x121A,	%o4
	brz	%i6,	loop_61
	fmovrdlz	%i1,	%f30,	%f4
	nop
	setx	loop_62,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bcc,a	loop_63
loop_61:
	udivx	%l3,	0x1243,	%g1
	fmovsa	%xcc,	%f22,	%f24
loop_62:
	srl	%l1,	0x00,	%l0
loop_63:
	membar	0x3B
	taddcc	%l5,	%i7,	%o0
	subc	%o5,	%i5,	%o3
	sll	%g7,	%l2,	%g2
	fcmpeq16	%f16,	%f28,	%o2
	movrlz	%l6,	0x197,	%i2
	tneg	%xcc,	0x2
	fmovsl	%xcc,	%f13,	%f27
	movrlz	%o1,	0x34C,	%o6
	movne	%xcc,	%i3,	%g5
	set	0x50, %o0
	prefetcha	[%l7 + %o0] 0x10,	 0x0
	mulx	%l4,	0x0880,	%g3
	nop
	setx	loop_64,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivx	%g6,	0x0B69,	%g4
	fmovdgu	%icc,	%f31,	%f10
	bvs,a	loop_65
loop_64:
	fpackfix	%f0,	%f15
	fornot2s	%f2,	%f6,	%f5
	nop
	setx loop_66, %l0, %l1
	jmpl %l1, %o7
loop_65:
	ldsh	[%l7 + 0x72],	%i0
	array16	%i6,	%o4,	%l3
	fmovdgu	%xcc,	%f20,	%f19
loop_66:
	fbg	%fcc3,	loop_67
	fbug	%fcc0,	loop_68
	flush	%l7 + 0x58
	ldsh	[%l7 + 0x10],	%g1
loop_67:
	fnot1	%f4,	%f6
loop_68:
	nop
	setx	loop_69,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgez,a	%l1,	loop_70
	movle	%xcc,	%i1,	%l0
	fmovsleu	%xcc,	%f24,	%f21
loop_69:
	fmuld8sux16	%f16,	%f10,	%f30
loop_70:
	taddcctv	%i7,	%l5,	%o0
	fpmerge	%f1,	%f6,	%f28
	addc	%o5,	0x1B49,	%o3
	fexpand	%f7,	%f24
	movge	%xcc,	%i5,	%l2
	edge32n	%g2,	%o2,	%l6
	smul	%i2,	%g7,	%o1
	edge8l	%o6,	%i3,	%g5
	movcc	%icc,	%l4,	%i4
	edge32n	%g6,	%g4,	%o7
	subccc	%g3,	%i6,	%o4
	fbuge	%fcc1,	loop_71
	alignaddrl	%i0,	%l3,	%l1
	fnegd	%f20,	%f28
	fble	%fcc0,	loop_72
loop_71:
	fbue	%fcc0,	loop_73
	fmul8x16	%f2,	%f4,	%f24
	edge16	%i1,	%g1,	%i7
loop_72:
	fornot1s	%f11,	%f30,	%f6
loop_73:
	fbo,a	%fcc3,	loop_74
	smul	%l0,	%l5,	%o0
	sdiv	%o5,	0x0956,	%o3
	addcc	%i5,	%g2,	%l2
loop_74:
	fnands	%f26,	%f24,	%f17
	orcc	%l6,	0x0850,	%o2
	umulcc	%i2,	%g7,	%o1
	tcs	%icc,	0x7
	bg,a,pn	%xcc,	loop_75
	addc	%o6,	0x03E3,	%i3
	xorcc	%l4,	%g5,	%i4
	tneg	%icc,	0x7
loop_75:
	nop
	set	0x3C, %g6
	ldsh	[%l7 + %g6],	%g4
	nop
	set	0x66, %o1
	sth	%o7,	[%l7 + %o1]
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fornot2	%f16,	%f18,	%f14
	bcs	loop_76
	tneg	%icc,	0x6
	fbl,a	%fcc1,	loop_77
	fbul	%fcc1,	loop_78
loop_76:
	tl	%xcc,	0x3
	sdiv	%g6,	0x10DA,	%i6
loop_77:
	edge8l	%o4,	%i0,	%g3
loop_78:
	sllx	%l3,	%l1,	%g1
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%i7
	sra	%l0,	%i1,	%o0
	flush	%l7 + 0x5C
	move	%icc,	%o5,	%o3
	wr	%g0,	0x11,	%asi
	sta	%f10,	[%l7 + 0x48] %asi
	be,a	loop_79
	srlx	%l5,	%g2,	%l2
	xnorcc	%i5,	%l6,	%o2
	tsubcc	%i2,	%g7,	%o1
loop_79:
	stw	%i3,	[%l7 + 0x60]
	stb	%l4,	[%l7 + 0x41]
	movg	%xcc,	%g5,	%o6
	pdist	%f20,	%f16,	%f0
	and	%g4,	%o7,	%g6
	or	%i4,	%o4,	%i0
	addccc	%i6,	%g3,	%l3
	movleu	%icc,	%g1,	%l1
	mulx	%i7,	%i1,	%l0
	addccc	%o5,	0x1FD7,	%o0
	be,a,pn	%icc,	loop_80
	brgez	%l5,	loop_81
	movcc	%xcc,	%o3,	%l2
	lduh	[%l7 + 0x4C],	%i5
loop_80:
	xnorcc	%g2,	%l6,	%i2
loop_81:
	nop
	set	0x59, %i1
	ldsba	[%l7 + %i1] 0x81,	%g7
	wr	%g0,	0x0c,	%asi
	stxa	%o1,	[%l7 + 0x20] %asi
	fbue,a	%fcc2,	loop_82
	std	%f22,	[%l7 + 0x50]
	subcc	%o2,	%l4,	%i3
	movvs	%icc,	%o6,	%g4
loop_82:
	tge	%xcc,	0x5
	fmovdcs	%xcc,	%f30,	%f23
	sll	%o7,	0x0F,	%g6
	subc	%i4,	0x1B7F,	%g5
	fpsub16	%f26,	%f30,	%f12
	fbg	%fcc3,	loop_83
	fnot1	%f22,	%f24
	bne,pt	%icc,	loop_84
	movre	%o4,	0x368,	%i6
loop_83:
	movrgez	%i0,	%g3,	%g1
	xorcc	%l1,	0x1A4F,	%l3
loop_84:
	edge32n	%i7,	%l0,	%i1
	tleu	%xcc,	0x5
	te	%xcc,	0x7
	fones	%f7
	movg	%icc,	%o0,	%l5
	bgu,pn	%icc,	loop_85
	subccc	%o5,	%l2,	%o3
	mulx	%i5,	%g2,	%l6
	stb	%g7,	[%l7 + 0x6B]
loop_85:
	bcc,a	%icc,	loop_86
	movrgz	%i2,	0x010,	%o1
	swap	[%l7 + 0x18],	%l4
	fbl	%fcc1,	loop_87
loop_86:
	movl	%icc,	%o2,	%i3
	xorcc	%o6,	0x17D4,	%g4
	sub	%g6,	0x00F1,	%o7
loop_87:
	fnor	%f30,	%f16,	%f28
	fands	%f18,	%f30,	%f25
	tne	%xcc,	0x2
	movleu	%xcc,	%i4,	%o4
	and	%i6,	%g5,	%i0
	tvs	%icc,	0x5
	movneg	%xcc,	%g3,	%g1
	xnor	%l3,	0x1E79,	%l1
	fors	%f29,	%f15,	%f8
	array16	%l0,	%i7,	%i1
	set	0x1D, %o2
	lduba	[%l7 + %o2] 0x10,	%l5
	fpsub16	%f14,	%f8,	%f14
	fmovdneg	%icc,	%f12,	%f23
	movrgz	%o5,	%o0,	%o3
	edge16ln	%i5,	%l2,	%g2
	fmovsne	%xcc,	%f31,	%f31
	move	%icc,	%g7,	%i2
	edge16ln	%o1,	%l6,	%l4
	edge32n	%i3,	%o6,	%o2
	call	loop_88
	edge8n	%g4,	%g6,	%o7
	tvs	%xcc,	0x0
	fmovs	%f22,	%f13
loop_88:
	edge16ln	%i4,	%o4,	%i6
	xorcc	%i0,	%g5,	%g3
	std	%g0,	[%l7 + 0x40]
	subcc	%l3,	0x0D37,	%l0
	fmovspos	%icc,	%f31,	%f18
	wr	%g0,	0x89,	%asi
	stda	%l0,	[%l7 + 0x10] %asi
	addccc	%i7,	%l5,	%i1
	umul	%o0,	%o5,	%o3
	fmovsa	%icc,	%f30,	%f11
	umul	%l2,	0x15B2,	%g2
	smul	%g7,	%i5,	%i2
	ldsb	[%l7 + 0x75],	%o1
	call	loop_89
	swap	[%l7 + 0x70],	%l4
	fble	%fcc0,	loop_90
	alignaddr	%i3,	%l6,	%o6
loop_89:
	tn	%xcc,	0x7
	xorcc	%o2,	%g4,	%g6
loop_90:
	fbe,a	%fcc0,	loop_91
	sethi	0x1B70,	%i4
	array32	%o4,	%o7,	%i0
	edge16	%g5,	%i6,	%g3
loop_91:
	fxnors	%f23,	%f24,	%f17
	movrgez	%l3,	0x2B6,	%l0
	fmovdn	%icc,	%f28,	%f24
	tne	%icc,	0x2
	movn	%icc,	%g1,	%l1
	movneg	%icc,	%l5,	%i7
	movrgz	%i1,	%o5,	%o0
	fmovspos	%icc,	%f13,	%f2
	fba	%fcc2,	loop_92
	edge8ln	%l2,	%g2,	%g7
	xor	%i5,	0x0571,	%o3
	fbge,a	%fcc2,	loop_93
loop_92:
	fsrc1	%f22,	%f24
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%l4
loop_93:
	tge	%xcc,	0x5
	fmovrdgz	%i3,	%f28,	%f8
	fpack16	%f24,	%f16
	bl,pn	%xcc,	loop_94
	orn	%l6,	0x0C0F,	%i2
	tsubcctv	%o6,	%o2,	%g6
	fandnot2s	%f3,	%f4,	%f30
loop_94:
	edge8	%i4,	%o4,	%o7
	fmovsleu	%icc,	%f27,	%f11
	sdivx	%i0,	0x1362,	%g5
	bneg,a	loop_95
	movrgz	%g4,	0x181,	%i6
	xnorcc	%l3,	0x1706,	%g3
	fmovsne	%icc,	%f23,	%f22
loop_95:
	fbug,a	%fcc0,	loop_96
	tge	%xcc,	0x3
	xnor	%g1,	%l1,	%l5
	fmovdgu	%icc,	%f12,	%f6
loop_96:
	orncc	%l0,	0x1C79,	%i7
	fbl	%fcc0,	loop_97
	subc	%i1,	%o0,	%l2
	tneg	%icc,	0x6
	set	0x120, %o5
	ldxa	[%g0 + %o5] 0x52,	%g2
loop_97:
	taddcc	%g7,	0x02AF,	%o5
	movl	%icc,	%o3,	%o1
	taddcctv	%l4,	%i3,	%i5
	edge32	%i2,	%l6,	%o2
	ble,a,pn	%icc,	loop_98
	fmovrslz	%o6,	%f12,	%f27
	srl	%i4,	%o4,	%g6
	fbl	%fcc0,	loop_99
loop_98:
	or	%i0,	%o7,	%g4
	movvs	%icc,	%g5,	%i6
	fcmped	%fcc2,	%f26,	%f18
loop_99:
	fmovrdlez	%l3,	%f6,	%f22
	sdivcc	%g1,	0x1646,	%g3
	set	0x30, %i7
	ldswa	[%l7 + %i7] 0x89,	%l1
	wr	%g0,	0x80,	%asi
	stwa	%l0,	[%l7 + 0x10] %asi
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%i7,	%l5
	move	%icc,	%i1,	%l2
	array8	%o0,	%g2,	%o5
	fmovsn	%icc,	%f21,	%f21
	tpos	%xcc,	0x4
	sll	%g7,	0x18,	%o3
	tcs	%xcc,	0x2
	fmovrde	%o1,	%f28,	%f26
	bcs	loop_100
	fbo,a	%fcc3,	loop_101
	srl	%l4,	%i3,	%i5
	fpadd32s	%f16,	%f29,	%f8
loop_100:
	tgu	%xcc,	0x4
loop_101:
	fnor	%f6,	%f18,	%f4
	tg	%xcc,	0x1
	tpos	%xcc,	0x1
	orn	%l6,	0x0255,	%o2
	tvc	%icc,	0x5
	or	%o6,	0x1B03,	%i2
	tgu	%xcc,	0x2
	fbule,a	%fcc0,	loop_102
	sll	%o4,	0x0C,	%i4
	edge16	%i0,	%o7,	%g4
	edge8	%g6,	%i6,	%l3
loop_102:
	sdivcc	%g1,	0x164A,	%g3
	addccc	%g5,	0x1B49,	%l1
	and	%l0,	0x1EA1,	%l5
	fmovsgu	%xcc,	%f23,	%f22
	fmovsl	%xcc,	%f26,	%f25
	ldd	[%l7 + 0x38],	%f28
	addccc	%i7,	0x0B11,	%i1
	movrgz	%l2,	%g2,	%o0
	sdivx	%g7,	0x1B39,	%o5
	tvs	%icc,	0x2
	fcmped	%fcc2,	%f0,	%f0
	addcc	%o1,	%l4,	%i3
	udivcc	%o3,	0x17B6,	%i5
	fsrc1s	%f23,	%f16
	fbul,a	%fcc2,	loop_103
	fcmps	%fcc0,	%f24,	%f20
	movn	%icc,	%l6,	%o2
	movrgez	%o6,	0x3CA,	%i2
loop_103:
	brz,a	%o4,	loop_104
	array8	%i4,	%i0,	%o7
	alignaddr	%g6,	%i6,	%g4
	edge32ln	%g1,	%g3,	%g5
loop_104:
	fmuld8ulx16	%f18,	%f28,	%f0
	fnot2	%f20,	%f10
	fmovs	%f23,	%f14
	te	%icc,	0x7
	tl	%icc,	0x6
	or	%l3,	0x1960,	%l0
	fcmpgt32	%f2,	%f30,	%l1
	sethi	0x11C9,	%i7
	fnot2	%f24,	%f2
	st	%f17,	[%l7 + 0x10]
	set	0x50, %g2
	stda	%l4,	[%l7 + %g2] 0x23
	membar	#Sync
	be,a	%icc,	loop_105
	fblg,a	%fcc0,	loop_106
	fmul8x16	%f3,	%f0,	%f26
	fone	%f14
loop_105:
	fmovda	%xcc,	%f7,	%f3
loop_106:
	andcc	%l2,	0x1D56,	%g2
	movrgz	%i1,	0x2EC,	%o0
	edge32ln	%g7,	%o1,	%l4
	brgz,a	%i3,	loop_107
	fbo,a	%fcc2,	loop_108
	edge8l	%o5,	%o3,	%l6
	movrlez	%i5,	%o6,	%i2
loop_107:
	array16	%o4,	%i4,	%o2
loop_108:
	edge16	%i0,	%o7,	%g6
	orcc	%g4,	%i6,	%g1
	movrgez	%g3,	%g5,	%l3
	fornot2	%f6,	%f12,	%f6
	orn	%l1,	0x071D,	%l0
	orn	%i7,	0x09DC,	%l2
	fbul	%fcc1,	loop_109
	edge16	%g2,	%i1,	%o0
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l5
loop_109:
	movl	%xcc,	%g7,	%l4
	std	%f26,	[%l7 + 0x50]
	fbe,a	%fcc1,	loop_110
	srax	%i3,	0x1C,	%o1
	fmul8x16	%f31,	%f6,	%f18
	addc	%o3,	0x1659,	%l6
loop_110:
	nop
	set	0x1C, %i3
	swapa	[%l7 + %i3] 0x80,	%i5
	fcmpgt32	%f8,	%f12,	%o6
	swap	[%l7 + 0x2C],	%o5
	movpos	%icc,	%i2,	%i4
	smul	%o4,	0x0EE9,	%o2
	ldd	[%l7 + 0x70],	%o6
	fmovsl	%icc,	%f16,	%f20
	edge16n	%g6,	%g4,	%i6
	tsubcctv	%g1,	0x02E5,	%i0
	movle	%icc,	%g5,	%l3
	fmovdn	%icc,	%f18,	%f6
	smulcc	%g3,	0x1B9F,	%l1
	alignaddrl	%l0,	%l2,	%g2
	set	0x63, %i5
	stba	%i1,	[%l7 + %i5] 0x81
	srl	%i7,	%o0,	%g7
	popc	%l5,	%i3
	bvs,a,pn	%xcc,	loop_111
	or	%l4,	0x0B32,	%o3
	tvc	%icc,	0x6
	set	0x68, %g3
	ldxa	[%l7 + %g3] 0x04,	%l6
loop_111:
	fmovrsne	%o1,	%f3,	%f31
	bvc,pn	%xcc,	loop_112
	edge8ln	%i5,	%o5,	%o6
	fxor	%f20,	%f16,	%f26
	mova	%icc,	%i4,	%i2
loop_112:
	nop
	wr	%g0,	0x89,	%asi
	stba	%o4,	[%l7 + 0x31] %asi
	ta	%xcc,	0x2
	movvs	%icc,	%o2,	%o7
	movrgez	%g6,	%i6,	%g4
	orcc	%i0,	0x0F25,	%g5
	mulx	%l3,	%g1,	%l1
	bne,pt	%xcc,	loop_113
	movle	%xcc,	%g3,	%l0
	fble,a	%fcc1,	loop_114
	fnot2	%f2,	%f0
loop_113:
	subccc	%l2,	0x0357,	%i1
	sethi	0x1504,	%i7
loop_114:
	edge16n	%g2,	%g7,	%o0
	brnz	%l5,	loop_115
	addccc	%i3,	%o3,	%l6
	movleu	%icc,	%o1,	%l4
	movrlez	%i5,	0x2B9,	%o6
loop_115:
	movrlez	%i4,	%i2,	%o5
	set	0x08, %g5
	stha	%o2,	[%l7 + %g5] 0x14
	ldsw	[%l7 + 0x68],	%o4
	array8	%o7,	%i6,	%g6
	movg	%xcc,	%g4,	%i0
	std	%f26,	[%l7 + 0x20]
	fmovd	%f8,	%f28
	fbo,a	%fcc3,	loop_116
	taddcctv	%l3,	0x02E4,	%g1
	stx	%l1,	[%l7 + 0x28]
	sllx	%g3,	0x02,	%l0
loop_116:
	std	%g4,	[%l7 + 0x50]
	fmovrsgez	%l2,	%f15,	%f22
	add	%i1,	%i7,	%g7
	ldsb	[%l7 + 0x3D],	%g2
	bneg,a	loop_117
	mulscc	%o0,	0x1497,	%l5
	array16	%o3,	%l6,	%i3
	tsubcctv	%o1,	0x06BA,	%l4
loop_117:
	tn	%icc,	0x5
	movneg	%icc,	%i5,	%i4
	ldsh	[%l7 + 0x50],	%o6
	tne	%xcc,	0x3
	swap	[%l7 + 0x24],	%o5
	bvs,pt	%icc,	loop_118
	taddcc	%i2,	%o2,	%o4
	tl	%xcc,	0x4
	sra	%o7,	%i6,	%g4
loop_118:
	fsrc1s	%f2,	%f12
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x44] %asi,	%i0
	fmovrsgez	%l3,	%f30,	%f7
	edge32ln	%g6,	%g1,	%g3
	xorcc	%l0,	%l1,	%g5
	movge	%xcc,	%l2,	%i7
	taddcctv	%g7,	%g2,	%i1
	set	0x2E, %l3
	ldstuba	[%l7 + %l3] 0x18,	%l5
	tgu	%xcc,	0x3
	be	%icc,	loop_119
	taddcctv	%o3,	0x03BC,	%l6
	fmovdn	%icc,	%f21,	%f29
	brgz,a	%i3,	loop_120
loop_119:
	ba,a,pt	%xcc,	loop_121
	tneg	%icc,	0x3
	orncc	%o1,	0x0FC5,	%o0
loop_120:
	ld	[%l7 + 0x08],	%f2
loop_121:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i5,	%i4
	udiv	%o6,	0x05A5,	%o5
	movneg	%xcc,	%l4,	%i2
	fpsub16s	%f8,	%f9,	%f0
	tle	%xcc,	0x1
	movl	%icc,	%o4,	%o7
	subccc	%i6,	0x071A,	%g4
	movgu	%icc,	%i0,	%l3
	bcs,a	%icc,	loop_122
	movrgz	%o2,	%g6,	%g3
	edge32n	%g1,	%l1,	%l0
	fble,a	%fcc2,	loop_123
loop_122:
	fmovrdne	%g5,	%f16,	%f28
	tvs	%icc,	0x7
	sethi	0x0E70,	%i7
loop_123:
	andcc	%g7,	0x09FB,	%g2
	fmovde	%icc,	%f25,	%f11
	fandnot1	%f28,	%f4,	%f6
	fbug	%fcc3,	loop_124
	std	%f22,	[%l7 + 0x28]
	srax	%l2,	%i1,	%l5
	tn	%xcc,	0x7
loop_124:
	edge16n	%l6,	%o3,	%i3
	taddcc	%o0,	0x18E3,	%o1
	tgu	%xcc,	0x6
	fnands	%f6,	%f29,	%f28
	ldstub	[%l7 + 0x1E],	%i5
	orncc	%o6,	%i4,	%l4
	fmovdcs	%icc,	%f28,	%f3
	mulscc	%o5,	0x089C,	%o4
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x81,	%i2
	membar	0x78
	fmovrdlz	%i6,	%f24,	%f6
	tl	%xcc,	0x3
	sethi	0x0BEA,	%g4
	orn	%i0,	0x0B2C,	%o7
	xor	%o2,	%g6,	%l3
	fcmple32	%f22,	%f24,	%g3
	tgu	%icc,	0x1
	movrgz	%l1,	0x242,	%l0
	mova	%xcc,	%g5,	%i7
	tn	%icc,	0x2
	tl	%xcc,	0x0
	fbe,a	%fcc0,	loop_125
	pdist	%f28,	%f28,	%f30
	movg	%icc,	%g1,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_125:
	nop
	setx	loop_126,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tne	%xcc,	0x0
	or	%l2,	%g2,	%i1
	sll	%l5,	0x14,	%l6
loop_126:
	umulcc	%o3,	0x03CD,	%o0
	array8	%o1,	%i3,	%i5
	fpadd16s	%f4,	%f17,	%f10
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	ldx	[%l7 + 0x28],	%l4
	movg	%xcc,	%i4,	%o4
	movcc	%xcc,	%o5,	%i6
	movneg	%xcc,	%g4,	%i2
	movne	%icc,	%i0,	%o7
	andncc	%o2,	%g6,	%g3
	flush	%l7 + 0x78
	movre	%l1,	%l3,	%g5
	ldub	[%l7 + 0x1E],	%l0
	fbg,a	%fcc1,	loop_127
	bcc,a	loop_128
	movcs	%xcc,	%g1,	%i7
	fmovsvs	%xcc,	%f28,	%f19
loop_127:
	movg	%icc,	%l2,	%g7
loop_128:
	nop
	set	0x5E, %o6
	ldub	[%l7 + %o6],	%g2
	st	%f2,	[%l7 + 0x78]
	array8	%i1,	%l6,	%l5
	sdivcc	%o3,	0x1202,	%o0
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x10] %asi,	%i3
	fmovdvc	%icc,	%f3,	%f12
	fmovrdlz	%o1,	%f26,	%f20
	fpack32	%f6,	%f16,	%f22
	tl	%xcc,	0x1
	array8	%o6,	%i5,	%i4
	sdivcc	%o4,	0x1A43,	%o5
	brlz	%i6,	loop_129
	subc	%g4,	0x0F53,	%l4
	fone	%f22
	movcs	%icc,	%i0,	%i2
loop_129:
	fbne,a	%fcc1,	loop_130
	edge16	%o2,	%o7,	%g6
	sethi	0x057F,	%l1
	movneg	%xcc,	%l3,	%g5
loop_130:
	udivcc	%l0,	0x0648,	%g3
	fmovde	%xcc,	%f2,	%f16
	smul	%i7,	%g1,	%l2
	fmul8sux16	%f0,	%f14,	%f8
	smul	%g2,	0x009E,	%g7
	movrgez	%l6,	%i1,	%l5
	fmovdcc	%xcc,	%f17,	%f12
	movrgz	%o0,	%o3,	%o1
	edge8ln	%i3,	%o6,	%i4
	nop
	setx	loop_131,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	siam	0x1
	array32	%o4,	%o5,	%i5
	or	%g4,	%i6,	%i0
loop_131:
	edge32l	%i2,	%l4,	%o7
	tg	%icc,	0x0
	tsubcctv	%g6,	0x1818,	%o2
	taddcctv	%l1,	0x0CB5,	%l3
	fbge,a	%fcc1,	loop_132
	fmovdpos	%xcc,	%f25,	%f25
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
loop_132:
	edge16l	%g3,	%l0,	%g1
	ldstub	[%l7 + 0x3F],	%l2
	movl	%icc,	%i7,	%g2
	movleu	%xcc,	%l6,	%i1
	movcs	%xcc,	%l5,	%o0
	movrgez	%o3,	0x296,	%o1
	fmovrsgz	%i3,	%f15,	%f22
	te	%xcc,	0x3
	srlx	%o6,	0x0E,	%g7
	orncc	%o4,	0x075B,	%o5
	umul	%i4,	0x1B84,	%g4
	fmovdneg	%icc,	%f6,	%f1
	edge32n	%i5,	%i6,	%i0
	edge32l	%l4,	%o7,	%g6
	fble,a	%fcc0,	loop_133
	brz	%i2,	loop_134
	tl	%icc,	0x3
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l1,	%o2
loop_133:
	or	%l3,	%g5,	%l0
loop_134:
	fpsub16s	%f22,	%f1,	%f13
	movpos	%xcc,	%g1,	%l2
	membar	0x64
	edge16l	%g3,	%i7,	%l6
	movcc	%xcc,	%g2,	%i1
	fmovrslz	%l5,	%f14,	%f27
	ld	[%l7 + 0x24],	%f6
	or	%o0,	%o3,	%o1
	popc	%o6,	%g7
	fnot1s	%f17,	%f27
	fmovrde	%i3,	%f14,	%f22
	fmovsgu	%xcc,	%f1,	%f16
	fcmpne16	%f14,	%f28,	%o4
	set	0x5E, %o3
	stha	%i4,	[%l7 + %o3] 0xea
	membar	#Sync
	brgez,a	%o5,	loop_135
	orncc	%i5,	%g4,	%i0
	te	%xcc,	0x7
	addccc	%i6,	%l4,	%o7
loop_135:
	tneg	%icc,	0x7
	tn	%icc,	0x5
	alignaddr	%i2,	%g6,	%o2
	udivcc	%l3,	0x1F26,	%l1
	edge16n	%g5,	%l0,	%l2
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x18] %asi,	%g1
	edge16n	%g3,	%l6,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i1,	%g2,	%o0
	bg,a,pt	%xcc,	loop_136
	srax	%o3,	0x1D,	%o1
	fmovsg	%icc,	%f8,	%f28
	ldsw	[%l7 + 0x58],	%l5
loop_136:
	nop
	wr	%g0,	0x18,	%asi
	stha	%o6,	[%l7 + 0x22] %asi
	nop
	set	0x58, %g1
	prefetch	[%l7 + %g1],	 0x3
	tsubcctv	%i3,	%g7,	%i4
	popc	%o5,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%i0
	tsubcc	%i6,	0x0CDA,	%i5
	fzero	%f22
	smulcc	%l4,	%i2,	%o7
	movle	%xcc,	%o2,	%l3
	fcmpeq16	%f30,	%f6,	%g6
	ld	[%l7 + 0x38],	%f10
	tvs	%xcc,	0x0
	mulscc	%l1,	0x091E,	%l0
	fmovdge	%icc,	%f16,	%f16
	fbn,a	%fcc3,	loop_137
	udivcc	%l2,	0x1EFE,	%g1
	fsrc2	%f22,	%f10
	fones	%f24
loop_137:
	srax	%g3,	0x1C,	%l6
	nop
	setx	loop_138,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmped	%fcc1,	%f16,	%f10
	movl	%icc,	%g5,	%i1
	tcs	%xcc,	0x5
loop_138:
	nop
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i7
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fandnot2	%f8,	%f4,	%f16
	array8	%g2,	%o0,	%o1
	udivcc	%l5,	0x0504,	%o3
	sdivcc	%o6,	0x04D3,	%g7
	tcc	%icc,	0x7
	nop
	set	0x6E, %l1
	lduh	[%l7 + %l1],	%i3
	fsrc2s	%f14,	%f4
	sir	0x167B
	brlez,a	%i4,	loop_139
	edge32ln	%o4,	%o5,	%g4
	fmovdge	%xcc,	%f5,	%f21
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%i6
loop_139:
	xnor	%i0,	%l4,	%i2
	movpos	%xcc,	%i5,	%o2
	swap	[%l7 + 0x48],	%o7
	edge32n	%g6,	%l1,	%l0
	array16	%l3,	%l2,	%g3
	and	%l6,	0x028C,	%g1
	smul	%g5,	%i7,	%g2
	edge32ln	%i1,	%o0,	%l5
	move	%icc,	%o1,	%o3
	tl	%xcc,	0x5
	fmovrdne	%o6,	%f10,	%f0
	fnot1	%f22,	%f24
	xor	%g7,	%i3,	%i4
	edge8ln	%o5,	%o4,	%g4
	xor	%i6,	0x1AAC,	%l4
	fmovdge	%icc,	%f5,	%f14
	sdivx	%i0,	0x1D8E,	%i5
	alignaddr	%i2,	%o2,	%g6
	sdiv	%l1,	0x15D9,	%l0
	te	%icc,	0x3
	fzero	%f22
	tg	%xcc,	0x4
	tle	%icc,	0x4
	add	%l3,	0x0C7C,	%o7
	fbg	%fcc3,	loop_140
	stbar
	fones	%f21
	movrne	%g3,	0x23B,	%l6
loop_140:
	movcc	%xcc,	%l2,	%g5
	fmovdne	%icc,	%f18,	%f29
	fmul8x16au	%f18,	%f26,	%f8
	brgez	%i7,	loop_141
	edge16l	%g2,	%i1,	%g1
	bgu,pn	%xcc,	loop_142
	bgu,a,pn	%icc,	loop_143
loop_141:
	fbo	%fcc0,	loop_144
	edge32ln	%o0,	%o1,	%l5
loop_142:
	flush	%l7 + 0x34
loop_143:
	bvc,pt	%xcc,	loop_145
loop_144:
	tneg	%xcc,	0x3
	fmovdgu	%xcc,	%f18,	%f21
	tl	%xcc,	0x0
loop_145:
	movrlez	%o6,	0x28F,	%o3
	array32	%g7,	%i4,	%i3
	movne	%xcc,	%o4,	%o5
	fcmpne32	%f28,	%f20,	%i6
	andncc	%g4,	%l4,	%i5
	tne	%xcc,	0x3
	sll	%i2,	0x10,	%o2
	add	%g6,	0x1BEE,	%l1
	srax	%i0,	%l0,	%o7
	ble	%xcc,	loop_146
	srl	%g3,	%l6,	%l2
	add	%l3,	0x0E9B,	%g5
	set	0x22, %l2
	lduba	[%l7 + %l2] 0x10,	%i7
loop_146:
	fnor	%f18,	%f8,	%f18
	fmovdvs	%xcc,	%f29,	%f21
	smul	%i1,	0x12D8,	%g1
	tcs	%xcc,	0x2
	fnand	%f20,	%f10,	%f28
	srax	%g2,	%o0,	%l5
	movgu	%icc,	%o1,	%o3
	and	%g7,	0x1E05,	%i4
	mulscc	%i3,	%o6,	%o4
	ldsh	[%l7 + 0x44],	%o5
	movcc	%icc,	%g4,	%l4
	faligndata	%f8,	%f14,	%f22
	brgz,a	%i5,	loop_147
	edge8ln	%i6,	%i2,	%g6
	stx	%o2,	[%l7 + 0x08]
	udiv	%i0,	0x18DE,	%l0
loop_147:
	tsubcc	%l1,	%o7,	%l6
	popc	0x1C63,	%l2
	set	0x34, %i4
	ldsba	[%l7 + %i4] 0x11,	%l3
	edge16n	%g3,	%i7,	%g5
	fbul	%fcc3,	loop_148
	fbo	%fcc3,	loop_149
	tcc	%icc,	0x3
	movl	%icc,	%g1,	%i1
loop_148:
	edge16n	%g2,	%l5,	%o1
loop_149:
	smulcc	%o0,	%g7,	%o3
	movrne	%i4,	%i3,	%o6
	move	%xcc,	%o4,	%g4
	fabss	%f21,	%f28
	tgu	%icc,	0x6
	brnz,a	%o5,	loop_150
	edge16n	%l4,	%i6,	%i5
	subcc	%i2,	%g6,	%i0
	fmovrse	%o2,	%f24,	%f25
loop_150:
	subc	%l0,	0x1CD1,	%o7
	fxors	%f28,	%f31,	%f28
	brlz	%l6,	loop_151
	std	%f12,	[%l7 + 0x40]
	movneg	%icc,	%l2,	%l1
	movrgz	%l3,	%i7,	%g5
loop_151:
	fbu	%fcc0,	loop_152
	movne	%xcc,	%g1,	%g3
	taddcc	%i1,	%l5,	%g2
	fxnors	%f24,	%f22,	%f12
loop_152:
	fpadd32s	%f24,	%f22,	%f17
	or	%o1,	%o0,	%o3
	fbug,a	%fcc0,	loop_153
	addccc	%i4,	0x0A69,	%g7
	sll	%o6,	0x02,	%i3
	fxnors	%f8,	%f25,	%f30
loop_153:
	andcc	%o4,	%o5,	%l4
	edge8l	%g4,	%i5,	%i6
	movrgez	%i2,	%g6,	%o2
	set	0x32, %i0
	ldsba	[%l7 + %i0] 0x14,	%i0
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%o7
	movpos	%icc,	%l6,	%l1
	fbe,a	%fcc3,	loop_154
	fmovdge	%icc,	%f6,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f18,	%f14,	%f9
loop_154:
	movneg	%xcc,	%l2,	%i7
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x36] %asi,	%l3
	subccc	%g1,	%g3,	%i1
	std	%g4,	[%l7 + 0x20]
	edge32ln	%l5,	%o1,	%o0
	fbn	%fcc1,	loop_155
	fbge	%fcc3,	loop_156
	fmovsg	%icc,	%f25,	%f10
	edge32ln	%g2,	%i4,	%g7
loop_155:
	fornot1	%f28,	%f2,	%f26
loop_156:
	movcs	%icc,	%o3,	%i3
	fmovdgu	%icc,	%f3,	%f0
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f0
	movcs	%icc,	%o4,	%o5
	movge	%icc,	%o6,	%g4
	movpos	%xcc,	%l4,	%i5
	edge16l	%i6,	%g6,	%i2
	std	%f12,	[%l7 + 0x58]
	fmul8ulx16	%f12,	%f28,	%f30
	array16	%i0,	%l0,	%o2
	wr	%g0,	0x81,	%asi
	stda	%o6,	[%l7 + 0x60] %asi
	tsubcctv	%l6,	0x18D6,	%l1
	edge8ln	%l2,	%i7,	%g1
	addccc	%g3,	%i1,	%l3
	alignaddrl	%l5,	%o1,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g5,	0x341,	%g2
	edge8ln	%g7,	%i4,	%i3
	array8	%o4,	%o3,	%o6
	tneg	%icc,	0x0
	tleu	%xcc,	0x5
	and	%o5,	0x1F91,	%l4
	subcc	%i5,	0x0F9D,	%i6
	fandnot2	%f22,	%f16,	%f12
	tcc	%xcc,	0x3
	fandnot2	%f10,	%f8,	%f18
	srl	%g4,	0x0C,	%g6
	edge8n	%i0,	%l0,	%i2
	edge16ln	%o7,	%l6,	%l1
	movge	%icc,	%o2,	%i7
	bg	%xcc,	loop_157
	tneg	%icc,	0x1
	movrne	%l2,	0x055,	%g3
	subccc	%g1,	0x191B,	%i1
loop_157:
	tpos	%xcc,	0x6
	tge	%xcc,	0x4
	nop
	setx	loop_158,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdcs	%icc,	%f18,	%f6
	add	%l5,	0x1002,	%o1
	mulscc	%l3,	0x05C4,	%g5
loop_158:
	movrlz	%g2,	0x212,	%o0
	fmovd	%f20,	%f12
	fmovdvs	%xcc,	%f23,	%f18
	movg	%xcc,	%g7,	%i3
	fmuld8sux16	%f19,	%f19,	%f22
	tl	%xcc,	0x4
	tneg	%xcc,	0x0
	ble,a,pn	%xcc,	loop_159
	taddcctv	%o4,	%i4,	%o3
	alignaddrl	%o6,	%l4,	%o5
	andcc	%i5,	%g4,	%g6
loop_159:
	edge8l	%i6,	%l0,	%i2
	movg	%xcc,	%o7,	%i0
	movne	%xcc,	%l6,	%o2
	tle	%xcc,	0x3
	ta	%icc,	0x4
	mulscc	%l1,	0x16CE,	%i7
	move	%icc,	%g3,	%l2
	fsrc2s	%f11,	%f23
	movn	%xcc,	%i1,	%g1
	wr	%g0,	0x04,	%asi
	stwa	%o1,	[%l7 + 0x30] %asi
	std	%f2,	[%l7 + 0x08]
	array32	%l3,	%g5,	%l5
	orn	%g2,	0x070C,	%o0
	alignaddrl	%i3,	%o4,	%i4
	fbg,a	%fcc1,	loop_160
	fmovrdlz	%g7,	%f30,	%f16
	nop
	setx	loop_161,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	set	0x08, %o4
	ldsw	[%l7 + %o4],	%o6
loop_160:
	and	%l4,	%o3,	%o5
	fblg	%fcc0,	loop_162
loop_161:
	fmovdg	%icc,	%f29,	%f0
	movrgz	%i5,	%g6,	%i6
	ldd	[%l7 + 0x18],	%g4
loop_162:
	edge8	%i2,	%o7,	%l0
	tge	%icc,	0x3
	set	0x30, %l5
	lduha	[%l7 + %l5] 0x19,	%l6
	movneg	%icc,	%i0,	%l1
	srax	%o2,	0x16,	%g3
	fmovrdgez	%l2,	%f20,	%f24
	movvs	%xcc,	%i7,	%g1
	array32	%i1,	%o1,	%g5
	xor	%l3,	%g2,	%l5
	prefetch	[%l7 + 0x30],	 0x3
	movge	%xcc,	%o0,	%i3
	fmovdvs	%xcc,	%f0,	%f11
	popc	0x094D,	%i4
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x4B] %asi,	%g7
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%o6
	edge32	%o4,	%o3,	%o5
	movrgz	%i5,	0x2BE,	%l4
	addcc	%g6,	%i6,	%g4
	array16	%i2,	%l0,	%l6
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x18
	movrgez	%o7,	0x3A4,	%i0
	and	%o2,	0x17E3,	%g3
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovsne	%icc,	%f19,	%f12
	smul	%l1,	%l2,	%i7
	fbg,a	%fcc0,	loop_163
	bge,a,pn	%xcc,	loop_164
	edge8ln	%g1,	%i1,	%g5
	fbue	%fcc0,	loop_165
loop_163:
	ta	%icc,	0x1
loop_164:
	sub	%o1,	0x146F,	%g2
	te	%icc,	0x1
loop_165:
	tvs	%icc,	0x3
	addcc	%l5,	%l3,	%i3
	fors	%f16,	%f17,	%f10
	array32	%o0,	%g7,	%o6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x80,	%i4,	%o4
	movrgez	%o5,	%i5,	%o3
	stb	%l4,	[%l7 + 0x4D]
	fbug,a	%fcc2,	loop_166
	fmovrde	%g6,	%f6,	%f0
	sdiv	%g4,	0x04B1,	%i6
	edge8n	%i2,	%l6,	%o7
loop_166:
	movrne	%l0,	%i0,	%o2
	movvs	%icc,	%g3,	%l1
	umulcc	%i7,	0x0146,	%l2
	array16	%i1,	%g5,	%o1
	fnor	%f22,	%f8,	%f20
	std	%f30,	[%l7 + 0x58]
	fornot2	%f2,	%f8,	%f12
	xnorcc	%g1,	0x07A0,	%l5
	sll	%l3,	%g2,	%o0
	fmovse	%xcc,	%f8,	%f29
	nop
	set	0x18, %g4
	std	%i2,	[%l7 + %g4]
	sra	%o6,	%g7,	%i4
	sir	0x06BD
	edge16	%o5,	%o4,	%i5
	addcc	%l4,	0x127D,	%g6
	fmovdvs	%xcc,	%f6,	%f25
	array8	%g4,	%i6,	%o3
	tvs	%icc,	0x7
	sub	%i2,	0x16D2,	%o7
	edge8ln	%l0,	%i0,	%l6
	edge16n	%g3,	%o2,	%i7
	edge8ln	%l1,	%l2,	%i1
	fmovsg	%xcc,	%f27,	%f4
	fsrc1s	%f23,	%f27
	mulx	%o1,	%g5,	%g1
	subcc	%l5,	%g2,	%o0
	fmul8x16	%f19,	%f30,	%f14
	fcmpne32	%f0,	%f22,	%i3
	tcc	%xcc,	0x0
	fabss	%f14,	%f0
	bpos,pn	%xcc,	loop_167
	edge16n	%l3,	%o6,	%i4
	taddcctv	%g7,	0x0615,	%o5
	fcmpd	%fcc2,	%f12,	%f26
loop_167:
	fmovdcs	%xcc,	%f26,	%f22
	edge32ln	%i5,	%l4,	%o4
	fbul,a	%fcc2,	loop_168
	membar	0x2F
	taddcc	%g4,	%g6,	%o3
	array32	%i2,	%o7,	%i6
loop_168:
	fcmped	%fcc2,	%f24,	%f26
	fmovsne	%xcc,	%f6,	%f10
	sethi	0x0D69,	%l0
	sub	%i0,	%l6,	%g3
	fsrc2s	%f12,	%f28
	sdiv	%o2,	0x1AEC,	%i7
	tne	%xcc,	0x4
	fxnors	%f24,	%f24,	%f17
	and	%l1,	0x0F7C,	%l2
	te	%xcc,	0x3
	sra	%o1,	%g5,	%i1
	movleu	%xcc,	%g1,	%l5
	taddcc	%o0,	0x1A4E,	%g2
	bvs	loop_169
	fpsub16	%f20,	%f30,	%f4
	movcs	%icc,	%i3,	%l3
	edge16ln	%i4,	%g7,	%o5
loop_169:
	fexpand	%f13,	%f0
	fnot2s	%f11,	%f3
	movne	%icc,	%i5,	%o6
	movrlz	%l4,	%o4,	%g6
	fnot1s	%f16,	%f22
	udiv	%o3,	0x1654,	%g4
	orncc	%o7,	0x0EBD,	%i2
	fbule,a	%fcc3,	loop_170
	stb	%l0,	[%l7 + 0x3A]
	tne	%icc,	0x7
	srlx	%i0,	%l6,	%g3
loop_170:
	fbul,a	%fcc3,	loop_171
	popc	%i6,	%o2
	movrne	%l1,	%l2,	%i7
	fcmpne16	%f10,	%f14,	%o1
loop_171:
	fmuld8sux16	%f7,	%f22,	%f20
	bne,a	%xcc,	loop_172
	srax	%i1,	%g5,	%l5
	bneg,a	%icc,	loop_173
	tvs	%icc,	0x7
loop_172:
	alignaddr	%g1,	%o0,	%i3
	array32	%g2,	%l3,	%g7
loop_173:
	te	%xcc,	0x6
	movl	%xcc,	%i4,	%i5
	bleu,pn	%icc,	loop_174
	subc	%o5,	0x020B,	%l4
	fba,a	%fcc0,	loop_175
	ble,pt	%icc,	loop_176
loop_174:
	srlx	%o6,	0x1B,	%o4
	fmovdl	%xcc,	%f8,	%f20
loop_175:
	nop
	set	0x28, %i6
	lduwa	[%l7 + %i6] 0x04,	%o3
loop_176:
	alignaddr	%g4,	%g6,	%o7
	andncc	%i2,	%l0,	%l6
	edge8	%i0,	%i6,	%o2
	sir	0x0F38
	fmovdge	%xcc,	%f3,	%f18
	movn	%icc,	%g3,	%l1
	set	0x70, %g7
	stwa	%l2,	[%l7 + %g7] 0x04
	set	0x57, %l0
	ldsba	[%l7 + %l0] 0x0c,	%i7
	sllx	%i1,	%g5,	%o1
	fandnot2s	%f20,	%f11,	%f24
	for	%f20,	%f2,	%f22
	taddcctv	%g1,	0x1457,	%o0
	edge16l	%i3,	%l5,	%l3
	fcmpd	%fcc3,	%f6,	%f28
	movleu	%icc,	%g2,	%i4
	tleu	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x2C] %asi,	%g7
	sir	0x1E0D
	set	0x3E, %l4
	ldsha	[%l7 + %l4] 0x15,	%o5
	fmovsleu	%icc,	%f1,	%f8
	edge16	%i5,	%o6,	%o4
	edge16l	%l4,	%o3,	%g6
	taddcctv	%o7,	0x06EF,	%g4
	movge	%icc,	%i2,	%l0
	fmul8sux16	%f0,	%f22,	%f10
	tg	%xcc,	0x0
	stbar
	movl	%icc,	%l6,	%i6
	udiv	%i0,	0x1AA1,	%o2
	subc	%g3,	0x13B4,	%l2
	movpos	%xcc,	%l1,	%i1
	be,a	%xcc,	loop_177
	fnot2s	%f19,	%f11
	edge16l	%i7,	%g5,	%g1
	fsrc1s	%f6,	%f12
loop_177:
	srlx	%o1,	%o0,	%i3
	edge16l	%l3,	%g2,	%l5
	wr	%g0,	0x88,	%asi
	stwa	%g7,	[%l7 + 0x6C] %asi
	mulscc	%o5,	0x11B5,	%i5
	orcc	%o6,	%i4,	%l4
	movleu	%xcc,	%o3,	%g6
	mulscc	%o7,	%g4,	%o4
	udivx	%l0,	0x1265,	%i2
	tle	%xcc,	0x5
	fbne,a	%fcc2,	loop_178
	sll	%i6,	0x08,	%l6
	fcmpgt16	%f6,	%f12,	%i0
	smulcc	%o2,	%g3,	%l2
loop_178:
	add	%l1,	0x1F02,	%i7
	alignaddr	%i1,	%g1,	%o1
	fnot2	%f18,	%f22
	fbn,a	%fcc2,	loop_179
	edge16l	%o0,	%g5,	%i3
	alignaddr	%l3,	%l5,	%g7
	sub	%o5,	%i5,	%o6
loop_179:
	sub	%g2,	0x1B22,	%i4
	edge16n	%l4,	%g6,	%o3
	fmovdleu	%icc,	%f14,	%f24
	movcc	%icc,	%g4,	%o4
	alignaddrl	%o7,	%l0,	%i6
	sdivx	%i2,	0x0664,	%i0
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x39] %asi,	%o2
	movne	%xcc,	%g3,	%l6
	xnorcc	%l2,	%l1,	%i7
	brgz,a	%g1,	loop_180
	fbul,a	%fcc1,	loop_181
	tneg	%icc,	0x0
	addcc	%i1,	%o0,	%g5
loop_180:
	orcc	%o1,	0x1A66,	%i3
loop_181:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x4f,	%asi
	stxa	%l3,	[%g0 + 0x8] %asi
	tge	%icc,	0x4
	set	0x34, %g6
	lduwa	[%l7 + %g6] 0x04,	%g7
	fnot2	%f6,	%f26
	tcc	%icc,	0x0
	subcc	%o5,	%l5,	%i5
	tn	%icc,	0x1
	move	%icc,	%g2,	%o6
	xorcc	%l4,	%i4,	%g6
	movrne	%g4,	0x200,	%o4
	bl	loop_182
	smulcc	%o7,	0x1E7B,	%o3
	ble,pt	%icc,	loop_183
	tl	%icc,	0x7
loop_182:
	nop
	set	0x10, %o0
	stxa	%l0,	[%l7 + %o0] 0x22
	membar	#Sync
loop_183:
	ldx	[%l7 + 0x70],	%i2
	nop
	setx	loop_184,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	loop_185,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fblg,a	%fcc2,	loop_186
	movl	%xcc,	%i0,	%i6
loop_184:
	fnors	%f20,	%f22,	%f29
loop_185:
	tle	%icc,	0x3
loop_186:
	fmul8x16	%f21,	%f28,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a,pt	%icc,	loop_187
	movl	%xcc,	%g3,	%o2
	nop
	set	0x43, %o1
	ldsb	[%l7 + %o1],	%l2
	orncc	%l1,	%l6,	%i7
loop_187:
	tge	%icc,	0x7
	smulcc	%i1,	%o0,	%g1
	xnor	%g5,	%o1,	%l3
	fmovde	%xcc,	%f27,	%f25
	xnor	%g7,	%o5,	%l5
	addcc	%i3,	0x170D,	%g2
	fcmple16	%f14,	%f22,	%o6
	or	%l4,	0x06F9,	%i5
	bcs	%icc,	loop_188
	edge16ln	%i4,	%g4,	%g6
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%o7
loop_188:
	fble	%fcc3,	loop_189
	bl,a,pn	%xcc,	loop_190
	ldub	[%l7 + 0x58],	%o3
	brgez,a	%o4,	loop_191
loop_189:
	udivx	%l0,	0x1F0D,	%i2
loop_190:
	bn,a	%icc,	loop_192
	sdivcc	%i0,	0x0F7D,	%g3
loop_191:
	tle	%icc,	0x1
	fmovrsgz	%o2,	%f5,	%f25
loop_192:
	andn	%i6,	%l1,	%l2
	fbo,a	%fcc2,	loop_193
	fmovdne	%icc,	%f3,	%f27
	fornot1	%f20,	%f6,	%f14
	fmovdneg	%xcc,	%f13,	%f19
loop_193:
	fornot2	%f10,	%f30,	%f4
	nop
	setx	loop_194,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%icc,	0x0
	fbe	%fcc2,	loop_195
	fmovsg	%icc,	%f3,	%f7
loop_194:
	tgu	%icc,	0x1
	be	loop_196
loop_195:
	ldd	[%l7 + 0x18],	%f22
	or	%i7,	%l6,	%o0
	ldd	[%l7 + 0x50],	%f14
loop_196:
	alignaddrl	%i1,	%g1,	%g5
	call	loop_197
	fbge	%fcc3,	loop_198
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%icc,	%f17,	%f11
loop_197:
	ldsb	[%l7 + 0x0B],	%o1
loop_198:
	movrgz	%g7,	0x1B8,	%l3
	movpos	%icc,	%o5,	%l5
	edge16l	%g2,	%o6,	%i3
	fxnor	%f14,	%f6,	%f14
	movrgez	%l4,	%i5,	%g4
	umulcc	%i4,	%o7,	%o3
	fble,a	%fcc3,	loop_199
	flush	%l7 + 0x4C
	fcmple32	%f26,	%f4,	%g6
	movrgz	%l0,	0x28D,	%i2
loop_199:
	ta	%icc,	0x7
	tle	%icc,	0x3
	srlx	%i0,	0x1C,	%g3
	fnand	%f2,	%f14,	%f0
	fbuge	%fcc3,	loop_200
	fbne	%fcc3,	loop_201
	edge32n	%o4,	%o2,	%l1
	sethi	0x03AA,	%i6
loop_200:
	mova	%xcc,	%l2,	%i7
loop_201:
	fcmpgt32	%f6,	%f26,	%l6
	movvc	%xcc,	%i1,	%g1
	edge32n	%o0,	%o1,	%g5
	movrgez	%l3,	0x31D,	%g7
	movre	%o5,	%l5,	%g2
	udiv	%i3,	0x183F,	%o6
	movge	%icc,	%l4,	%i5
	ldx	[%l7 + 0x18],	%g4
	fmul8x16al	%f25,	%f15,	%f2
	subc	%i4,	0x06E3,	%o7
	fmovrse	%g6,	%f16,	%f15
	srlx	%l0,	0x0C,	%o3
	fxnors	%f0,	%f27,	%f3
	tpos	%icc,	0x4
	array32	%i2,	%g3,	%o4
	sdivx	%i0,	0x1792,	%l1
	edge8	%i6,	%o2,	%l2
	array16	%i7,	%l6,	%g1
	fmovsvc	%icc,	%f26,	%f15
	sdiv	%i1,	0x0D90,	%o1
	sethi	0x1B13,	%o0
	fnot2s	%f12,	%f0
	fand	%f2,	%f4,	%f10
	move	%xcc,	%l3,	%g5
	tvc	%xcc,	0x3
	ldsw	[%l7 + 0x58],	%o5
	udivx	%l5,	0x0C39,	%g7
	fmovsge	%icc,	%f13,	%f15
	membar	0x6D
	bcc,pt	%icc,	loop_202
	lduw	[%l7 + 0x24],	%g2
	edge32n	%o6,	%i3,	%i5
	xorcc	%g4,	0x04B9,	%l4
loop_202:
	tle	%icc,	0x1
	fxnors	%f23,	%f17,	%f21
	udivcc	%o7,	0x0D0E,	%i4
	srax	%l0,	0x12,	%o3
	addcc	%i2,	0x1D39,	%g3
	set	0x5C, %o2
	lduha	[%l7 + %o2] 0x0c,	%g6
	ldsb	[%l7 + 0x5A],	%o4
	fpsub16s	%f24,	%f21,	%f15
	stx	%l1,	[%l7 + 0x18]
	tcs	%xcc,	0x6
	xnor	%i0,	0x167D,	%o2
	popc	%l2,	%i6
	fmovde	%xcc,	%f4,	%f1
	sth	%l6,	[%l7 + 0x76]
	move	%icc,	%i7,	%g1
	movgu	%icc,	%i1,	%o0
	udivx	%l3,	0x134A,	%o1
	orncc	%g5,	0x14BA,	%l5
	orn	%o5,	0x1447,	%g7
	fsrc2	%f10,	%f6
	orn	%o6,	0x04A5,	%i3
	movneg	%icc,	%g2,	%i5
	fandnot1s	%f20,	%f23,	%f10
	fmovspos	%icc,	%f18,	%f7
	st	%f2,	[%l7 + 0x0C]
	movl	%icc,	%g4,	%o7
	ta	%xcc,	0x2
	tcs	%xcc,	0x2
	tle	%xcc,	0x3
	fmovdg	%icc,	%f17,	%f7
	movcs	%icc,	%i4,	%l0
	tsubcctv	%o3,	%i2,	%l4
	movvc	%xcc,	%g3,	%g6
	srax	%o4,	0x06,	%l1
	movvc	%xcc,	%o2,	%i0
	brnz	%i6,	loop_203
	stbar
	edge8ln	%l6,	%l2,	%g1
	prefetch	[%l7 + 0x30],	 0x2
loop_203:
	tl	%icc,	0x5
	mova	%icc,	%i1,	%i7
	or	%o0,	0x01CE,	%l3
	move	%xcc,	%g5,	%o1
	orcc	%l5,	%o5,	%o6
	edge32ln	%i3,	%g7,	%g2
	tleu	%xcc,	0x1
	sub	%i5,	0x04C8,	%g4
	tsubcctv	%i4,	0x1D65,	%l0
	umul	%o7,	%i2,	%l4
	tcs	%xcc,	0x5
	umul	%g3,	0x1B3A,	%o3
	sub	%o4,	%g6,	%o2
	movrgez	%l1,	0x387,	%i6
	bn	%xcc,	loop_204
	movrlz	%l6,	0x10C,	%i0
	brgez	%l2,	loop_205
	movgu	%xcc,	%g1,	%i7
loop_204:
	tvc	%icc,	0x6
	addcc	%i1,	%l3,	%g5
loop_205:
	umul	%o0,	0x12C9,	%l5
	ta	%icc,	0x5
	fmovrslez	%o5,	%f30,	%f13
	fnot1s	%f27,	%f4
	fbg	%fcc3,	loop_206
	add	%o6,	0x1F51,	%o1
	sra	%i3,	%g7,	%g2
	taddcc	%g4,	%i5,	%l0
loop_206:
	fmovrdgez	%i4,	%f4,	%f10
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%i2
	srlx	%o7,	%l4,	%g3
	edge32	%o3,	%g6,	%o2
	fcmpgt16	%f2,	%f14,	%l1
	movge	%icc,	%o4,	%i6
	tcc	%icc,	0x4
	subc	%l6,	%l2,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i7,	0x0CA1,	%i1
	fmovscc	%icc,	%f12,	%f30
	bpos	loop_207
	fcmpes	%fcc0,	%f21,	%f14
	flush	%l7 + 0x20
	fones	%f21
loop_207:
	udivx	%i0,	0x17A1,	%g5
	fmovrslz	%l3,	%f17,	%f10
	tcs	%xcc,	0x2
	fmovsneg	%icc,	%f26,	%f26
	xnorcc	%l5,	0x19D0,	%o0
	sir	0x1898
	xnorcc	%o6,	%o5,	%i3
	stx	%g7,	[%l7 + 0x70]
	sllx	%o1,	0x0C,	%g4
	fbul,a	%fcc2,	loop_208
	edge16l	%i5,	%l0,	%g2
	xnorcc	%i4,	%i2,	%o7
	umul	%g3,	%o3,	%g6
loop_208:
	array16	%o2,	%l4,	%o4
	movvc	%xcc,	%i6,	%l1
	fmovdvs	%icc,	%f20,	%f4
	orncc	%l2,	0x12C4,	%l6
	fnegs	%f0,	%f19
	and	%g1,	%i7,	%i1
	and	%g5,	0x029B,	%l3
	lduw	[%l7 + 0x38],	%l5
	alignaddr	%o0,	%i0,	%o6
	edge16	%o5,	%i3,	%o1
	sdiv	%g4,	0x0550,	%i5
	edge8	%l0,	%g2,	%g7
	fmovsgu	%icc,	%f0,	%f26
	edge16l	%i4,	%o7,	%g3
	move	%xcc,	%i2,	%g6
	sub	%o2,	%l4,	%o4
	fmovs	%f13,	%f8
	movle	%icc,	%o3,	%i6
	or	%l2,	0x0722,	%l1
	tg	%xcc,	0x4
	nop
	setx loop_209, %l0, %l1
	jmpl %l1, %g1
	movg	%xcc,	%i7,	%l6
	mulx	%i1,	%l3,	%l5
	te	%xcc,	0x3
loop_209:
	fbu,a	%fcc3,	loop_210
	xor	%g5,	0x1318,	%o0
	movl	%xcc,	%i0,	%o5
	fnegd	%f8,	%f20
loop_210:
	addccc	%o6,	0x1217,	%i3
	fbne	%fcc2,	loop_211
	movgu	%xcc,	%o1,	%i5
	call	loop_212
	tn	%xcc,	0x5
loop_211:
	movrlz	%g4,	%g2,	%g7
	tg	%icc,	0x5
loop_212:
	movg	%icc,	%l0,	%i4
	set	0x44, %o5
	ldswa	[%l7 + %o5] 0x15,	%g3
	fxor	%f28,	%f30,	%f2
	fandnot2s	%f8,	%f26,	%f9
	ldsb	[%l7 + 0x45],	%i2
	movle	%icc,	%g6,	%o2
	fand	%f14,	%f28,	%f10
	umul	%l4,	0x1D1F,	%o7
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
	taddcc	%o4,	0x0FE5,	%i6
	fpsub32	%f18,	%f4,	%f4
	addccc	%l1,	0x09A0,	%g1
	sra	%i7,	0x0E,	%l2
	fmovrdlez	%i1,	%f10,	%f24
	bvc,pt	%icc,	loop_213
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l6,	%l3,	%l5
	brlez,a	%o0,	loop_214
loop_213:
	udiv	%g5,	0x1116,	%i0
	srax	%o6,	%o5,	%o1
	fandnot1	%f8,	%f28,	%f10
loop_214:
	fmovdcc	%xcc,	%f5,	%f23
	stb	%i3,	[%l7 + 0x48]
	fmovsvs	%xcc,	%f1,	%f20
	fpack16	%f24,	%f24
	sdivcc	%g4,	0x1432,	%i5
	movn	%icc,	%g7,	%g2
	movrne	%l0,	0x386,	%i4
	tleu	%xcc,	0x0
	fmovdpos	%xcc,	%f12,	%f25
	fba	%fcc3,	loop_215
	umulcc	%g3,	0x0E0A,	%g6
	siam	0x2
	fbo,a	%fcc1,	loop_216
loop_215:
	bge	loop_217
	fbu,a	%fcc2,	loop_218
	sub	%i2,	0x1642,	%l4
loop_216:
	sir	0x02DD
loop_217:
	fbn	%fcc1,	loop_219
loop_218:
	orn	%o2,	%o7,	%o3
	edge8ln	%i6,	%o4,	%l1
	taddcc	%g1,	%i7,	%i1
loop_219:
	te	%icc,	0x6
	ldx	[%l7 + 0x78],	%l2
	fands	%f9,	%f18,	%f28
	edge8	%l6,	%l3,	%o0
	edge32l	%l5,	%g5,	%o6
	sdivcc	%i0,	0x0D69,	%o5
	srl	%o1,	0x08,	%g4
	sdivx	%i3,	0x146E,	%i5
	edge16ln	%g2,	%l0,	%i4
	te	%icc,	0x4
	tgu	%icc,	0x1
	brlez	%g3,	loop_220
	fblg,a	%fcc0,	loop_221
	tn	%icc,	0x5
	orn	%g7,	0x0BB2,	%g6
loop_220:
	bcs	%xcc,	loop_222
loop_221:
	movcc	%xcc,	%i2,	%l4
	xnor	%o7,	0x0460,	%o2
	sra	%o3,	0x04,	%o4
loop_222:
	ble,pn	%xcc,	loop_223
	fmul8x16al	%f23,	%f18,	%f26
	movcc	%xcc,	%i6,	%g1
	movle	%icc,	%i7,	%i1
loop_223:
	sllx	%l1,	0x13,	%l2
	fmovdneg	%icc,	%f17,	%f21
	sdivcc	%l6,	0x1169,	%o0
	subc	%l5,	0x1F58,	%l3
	fmuld8sux16	%f2,	%f10,	%f26
	fmovdn	%icc,	%f2,	%f13
	array8	%g5,	%o6,	%o5
	addcc	%i0,	%g4,	%o1
	sethi	0x02EA,	%i5
	sdivx	%g2,	0x1E63,	%l0
	addc	%i4,	%g3,	%g7
	orncc	%i3,	0x07DD,	%i2
	tne	%icc,	0x2
	brgez,a	%g6,	loop_224
	prefetch	[%l7 + 0x74],	 0x2
	udiv	%o7,	0x083D,	%l4
	fpackfix	%f30,	%f23
loop_224:
	movrlz	%o2,	%o4,	%i6
	andncc	%o3,	%i7,	%i1
	ta	%xcc,	0x0
	srl	%g1,	0x1B,	%l2
	fmovrsgz	%l6,	%f10,	%f2
	movleu	%icc,	%o0,	%l1
	sub	%l5,	0x0584,	%g5
	edge8	%o6,	%o5,	%l3
	srax	%g4,	%o1,	%i0
	set	0x0D, %i1
	stba	%i5,	[%l7 + %i1] 0x80
	fandnot2	%f24,	%f20,	%f10
	set	0x08, %i7
	lduwa	[%l7 + %i7] 0x88,	%g2
	bcc,a	loop_225
	fbl	%fcc2,	loop_226
	alignaddrl	%l0,	%i4,	%g3
	fmovsgu	%xcc,	%f29,	%f25
loop_225:
	orn	%i3,	%i2,	%g7
loop_226:
	fornot1s	%f19,	%f15,	%f8
	fcmped	%fcc0,	%f12,	%f2
	movrne	%g6,	%o7,	%l4
	andn	%o2,	0x1730,	%i6
	tl	%icc,	0x7
	edge8	%o3,	%i7,	%i1
	fsrc1s	%f29,	%f17
	mova	%icc,	%o4,	%g1
	movn	%icc,	%l2,	%o0
	fsrc2	%f8,	%f30
	tcc	%xcc,	0x1
	movne	%icc,	%l6,	%l1
	subc	%g5,	%o6,	%o5
	tvc	%xcc,	0x6
	movrlz	%l5,	%l3,	%o1
	or	%g4,	0x1B83,	%i0
	alignaddrl	%i5,	%g2,	%l0
	fmovdn	%icc,	%f28,	%f7
	and	%i4,	0x14A4,	%i3
	set	0x72, %g2
	ldstuba	[%l7 + %g2] 0x18,	%g3
	tcs	%icc,	0x4
	sethi	0x1D79,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f25,	%f6,	%f4
	stbar
	stb	%g6,	[%l7 + 0x6F]
	tle	%icc,	0x2
	wr	%g0,	0x19,	%asi
	stba	%i2,	[%l7 + 0x60] %asi
	fmovsg	%icc,	%f15,	%f16
	xor	%o7,	%l4,	%i6
	movcs	%xcc,	%o2,	%o3
	membar	0x46
	edge8ln	%i7,	%i1,	%g1
	fbe	%fcc2,	loop_227
	tg	%xcc,	0x0
	fornot2	%f24,	%f22,	%f16
	mulscc	%l2,	0x1244,	%o4
loop_227:
	nop
	wr	%g0,	0x81,	%asi
	stda	%i6,	[%l7 + 0x40] %asi
	fblg,a	%fcc2,	loop_228
	fornot2	%f0,	%f24,	%f16
	set	0x68, %i3
	stda	%l0,	[%l7 + %i3] 0x11
loop_228:
	ld	[%l7 + 0x30],	%f22
	sub	%g5,	%o6,	%o0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o5
	bshuffle	%f4,	%f8,	%f24
	movle	%xcc,	%l5,	%l3
	smulcc	%o1,	%g4,	%i0
	fmovdcs	%icc,	%f18,	%f9
	bg,a,pn	%xcc,	loop_229
	fmovse	%xcc,	%f10,	%f19
	fnegd	%f12,	%f18
	tleu	%icc,	0x4
loop_229:
	movvc	%xcc,	%i5,	%g2
	fmovdvc	%xcc,	%f17,	%f25
	siam	0x2
	smul	%i4,	0x07F7,	%l0
	movg	%xcc,	%g3,	%g7
	bl	loop_230
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x2
	fcmpgt16	%f4,	%f26,	%g6
loop_230:
	edge8l	%i2,	%o7,	%i3
	tge	%xcc,	0x4
	fmovsne	%icc,	%f19,	%f9
	fmovsle	%icc,	%f0,	%f22
	ble,a	%icc,	loop_231
	brz	%i6,	loop_232
	tl	%xcc,	0x4
	set	0x5E, %i5
	lduba	[%l7 + %i5] 0x19,	%o2
loop_231:
	ldsh	[%l7 + 0x54],	%l4
loop_232:
	edge16n	%i7,	%i1,	%o3
	brlz,a	%l2,	loop_233
	lduw	[%l7 + 0x50],	%g1
	xnorcc	%o4,	0x0878,	%l1
	tle	%icc,	0x3
loop_233:
	fmovsge	%xcc,	%f1,	%f28
	nop
	setx	loop_234,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andcc	%g5,	0x0A7E,	%o6
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
loop_234:
	movleu	%xcc,	%o0,	%l5
	subccc	%o5,	%o1,	%g4
	andcc	%l3,	0x13F8,	%i0
	fbul	%fcc1,	loop_235
	movgu	%xcc,	%g2,	%i5
	movleu	%xcc,	%i4,	%l0
	movgu	%icc,	%g3,	%g6
loop_235:
	fble	%fcc3,	loop_236
	edge8ln	%g7,	%o7,	%i3
	set	0x6E, %g5
	ldsha	[%l7 + %g5] 0x10,	%i2
loop_236:
	xorcc	%o2,	0x1D17,	%l4
	orn	%i7,	%i6,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o3,	0x01ED,	%l2
	fmovsvs	%xcc,	%f4,	%f17
	sllx	%g1,	0x1B,	%l1
	array32	%g5,	%o4,	%o6
	ta	%xcc,	0x2
	fcmpeq16	%f10,	%f4,	%l6
	fmovdgu	%xcc,	%f24,	%f14
	fmovsn	%icc,	%f24,	%f19
	xnor	%o0,	0x1970,	%o5
	fpmerge	%f7,	%f27,	%f20
	sdivx	%o1,	0x1C3D,	%l5
	orcc	%g4,	%l3,	%i0
	fandnot1s	%f16,	%f24,	%f18
	sra	%i5,	0x1B,	%i4
	tle	%xcc,	0x0
	mulx	%g2,	0x1C11,	%g3
	sll	%g6,	%l0,	%o7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x19] %asi,	%g7
	array32	%i2,	%i3,	%o2
	sllx	%l4,	0x06,	%i6
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tgu	%xcc,	0x6
	subc	%i7,	%i1,	%o3
	tg	%xcc,	0x1
	subccc	%g1,	0x173B,	%l1
	fbg,a	%fcc1,	loop_237
	edge16l	%l2,	%o4,	%o6
	fnot2	%f8,	%f24
	mulscc	%l6,	0x151C,	%g5
loop_237:
	sll	%o0,	%o5,	%o1
	brgez	%g4,	loop_238
	bcs,a,pn	%icc,	loop_239
	stx	%l3,	[%l7 + 0x70]
	fcmpne16	%f6,	%f28,	%i0
loop_238:
	sll	%i5,	%i4,	%l5
loop_239:
	ldsb	[%l7 + 0x1E],	%g2
	nop
	set	0x58, %g3
	ldsh	[%l7 + %g3],	%g3
	fxors	%f3,	%f8,	%f3
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x24] %asi,	%l0
	movl	%icc,	%g6,	%o7
	wr	%g0,	0xe3,	%asi
	stda	%g6,	[%l7 + 0x50] %asi
	membar	#Sync
	set	0x20, %l6
	stda	%i2,	[%l7 + %l6] 0x14
	xnor	%i2,	%o2,	%i6
	fxnor	%f30,	%f0,	%f4
	edge32l	%i7,	%i1,	%l4
	sllx	%o3,	%l1,	%l2
	sub	%g1,	0x0B8A,	%o6
	fcmple16	%f30,	%f8,	%o4
	fba	%fcc0,	loop_240
	array8	%l6,	%g5,	%o0
	tsubcctv	%o5,	0x1F11,	%g4
	stw	%o1,	[%l7 + 0x38]
loop_240:
	fandnot1s	%f6,	%f25,	%f30
	and	%l3,	%i5,	%i4
	edge16l	%i0,	%l5,	%g3
	wr	%g0,	0x2b,	%asi
	stxa	%g2,	[%l7 + 0x38] %asi
	membar	#Sync
	stb	%l0,	[%l7 + 0x58]
	std	%o6,	[%l7 + 0x20]
	andn	%g6,	0x014D,	%i3
	fcmped	%fcc0,	%f26,	%f10
	edge8	%g7,	%i2,	%o2
	fands	%f0,	%f21,	%f29
	fmul8x16	%f21,	%f14,	%f8
	udiv	%i7,	0x0145,	%i1
	fnands	%f8,	%f26,	%f14
	fors	%f20,	%f7,	%f22
	fexpand	%f21,	%f28
	fabsd	%f2,	%f26
	edge8n	%i6,	%o3,	%l4
	wr	%g0,	0x0c,	%asi
	stba	%l2,	[%l7 + 0x2F] %asi
	orn	%g1,	0x14F8,	%l1
	umulcc	%o4,	%o6,	%g5
	std	%o0,	[%l7 + 0x10]
	fcmpes	%fcc2,	%f2,	%f10
	fbu,a	%fcc0,	loop_241
	fcmpes	%fcc3,	%f17,	%f21
	fnot1	%f20,	%f8
	fornot2s	%f22,	%f26,	%f25
loop_241:
	tpos	%xcc,	0x1
	fcmpgt32	%f10,	%f8,	%l6
	sllx	%g4,	0x13,	%o5
	fnegs	%f31,	%f18
	set	0x3D, %l3
	ldstuba	[%l7 + %l3] 0x81,	%l3
	tge	%icc,	0x1
	mulx	%i5,	%i4,	%i0
	fmovsge	%xcc,	%f25,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f13,	%f6,	%f4
	movl	%xcc,	%o1,	%g3
	bgu,a	%xcc,	loop_242
	edge16n	%g2,	%l0,	%o7
	array8	%l5,	%g6,	%i3
	fmovsvs	%xcc,	%f19,	%f2
loop_242:
	smul	%g7,	0x1BC9,	%i2
	tl	%icc,	0x0
	fmovdpos	%icc,	%f23,	%f6
	fornot2s	%f14,	%f28,	%f29
	fmovda	%xcc,	%f2,	%f21
	fcmpeq16	%f16,	%f12,	%i7
	udivcc	%o2,	0x1DD9,	%i6
	addcc	%i1,	%o3,	%l2
	or	%g1,	%l1,	%o4
	fmovrse	%l4,	%f13,	%f16
	edge8ln	%o6,	%g5,	%o0
	fmovdl	%icc,	%f21,	%f26
	udivx	%l6,	0x13D6,	%o5
	edge16ln	%g4,	%i5,	%l3
	fbn	%fcc0,	loop_243
	tsubcc	%i4,	%o1,	%g3
	movle	%icc,	%i0,	%l0
	fmovsl	%xcc,	%f1,	%f26
loop_243:
	te	%icc,	0x1
	set	0x1C, %o3
	ldswa	[%l7 + %o3] 0x80,	%g2
	tl	%icc,	0x6
	fnands	%f0,	%f15,	%f10
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o7
	edge16n	%l5,	%i3,	%g7
	fmovdleu	%xcc,	%f21,	%f10
	lduw	[%l7 + 0x3C],	%g6
	fcmpgt32	%f2,	%f12,	%i7
	array16	%i2,	%o2,	%i6
	tgu	%icc,	0x1
	ldd	[%l7 + 0x50],	%i0
	std	%f30,	[%l7 + 0x50]
	fbu	%fcc1,	loop_244
	lduh	[%l7 + 0x3C],	%l2
	tgu	%xcc,	0x7
	edge8l	%g1,	%l1,	%o3
loop_244:
	nop
	set	0x24, %g1
	swapa	[%l7 + %g1] 0x11,	%o4
	fmovrdgz	%l4,	%f2,	%f10
	fbne,a	%fcc1,	loop_245
	te	%xcc,	0x2
	movvs	%icc,	%g5,	%o0
	fandnot2s	%f9,	%f29,	%f16
loop_245:
	movrne	%o6,	%l6,	%o5
	tcc	%xcc,	0x7
	brgez	%g4,	loop_246
	movrgez	%i5,	0x1D9,	%i4
	edge8l	%l3,	%g3,	%i0
	fbuge,a	%fcc1,	loop_247
loop_246:
	fmul8x16al	%f5,	%f1,	%f20
	ldd	[%l7 + 0x60],	%o0
	edge8ln	%g2,	%l0,	%o7
loop_247:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x63] %asi,	%i3
	taddcctv	%g7,	0x00C0,	%g6
	edge8ln	%i7,	%i2,	%o2
	edge32ln	%i6,	%i1,	%l5
	membar	0x22
	udiv	%g1,	0x154B,	%l2
	movneg	%xcc,	%l1,	%o3
	std	%l4,	[%l7 + 0x78]
	ta	%icc,	0x7
	tne	%xcc,	0x2
	fmovsgu	%icc,	%f11,	%f20
	mulx	%g5,	0x126F,	%o0
	ldsh	[%l7 + 0x34],	%o4
	fand	%f24,	%f16,	%f22
	ldsb	[%l7 + 0x67],	%o6
	edge8n	%o5,	%g4,	%i5
	movcc	%icc,	%i4,	%l3
	mulscc	%g3,	0x0E46,	%l6
	movn	%icc,	%i0,	%g2
	smulcc	%l0,	%o1,	%o7
	edge16	%i3,	%g6,	%i7
	fmuld8sux16	%f20,	%f16,	%f28
	tg	%icc,	0x4
	tn	%xcc,	0x4
	edge16n	%i2,	%o2,	%i6
	orcc	%g7,	%i1,	%l5
	tn	%xcc,	0x6
	srax	%l2,	0x05,	%g1
	xor	%l1,	0x1361,	%o3
	fbge	%fcc1,	loop_248
	movrne	%g5,	%o0,	%l4
	or	%o4,	0x0C93,	%o5
	ldd	[%l7 + 0x10],	%f6
loop_248:
	fzero	%f6
	tvc	%icc,	0x6
	orcc	%o6,	0x111D,	%i5
	brlez,a	%g4,	loop_249
	fmovdl	%icc,	%f5,	%f16
	tvs	%xcc,	0x0
	andcc	%i4,	0x1762,	%l3
loop_249:
	fabsd	%f2,	%f22
	st	%f14,	[%l7 + 0x3C]
	fxnor	%f30,	%f28,	%f4
	fbuge,a	%fcc3,	loop_250
	popc	%g3,	%i0
	tpos	%xcc,	0x1
	addc	%g2,	0x11FA,	%l0
loop_250:
	nop
	set	0x10, %o6
	lda	[%l7 + %o6] 0x10,	%f24
	fmovsvc	%icc,	%f20,	%f10
	swap	[%l7 + 0x0C],	%o1
	wr	%g0,	0xea,	%asi
	stda	%o6,	[%l7 + 0x40] %asi
	membar	#Sync
	array8	%l6,	%g6,	%i7
	be,a	loop_251
	movre	%i2,	%i3,	%i6
	movvs	%icc,	%o2,	%g7
	srax	%l5,	0x1F,	%i1
loop_251:
	addccc	%l2,	0x1D9E,	%l1
	fandnot2	%f24,	%f28,	%f16
	tn	%icc,	0x0
	ba,a	loop_252
	tsubcctv	%o3,	%g1,	%g5
	fbl,a	%fcc2,	loop_253
	tgu	%xcc,	0x6
loop_252:
	nop
	set	0x10, %l2
	ldswa	[%l7 + %l2] 0x89,	%o0
loop_253:
	orcc	%o4,	0x1153,	%l4
	fbe	%fcc0,	loop_254
	movpos	%xcc,	%o6,	%o5
	tleu	%xcc,	0x5
	add	%i5,	%g4,	%i4
loop_254:
	edge32l	%l3,	%i0,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_255, %l0, %l1
	jmpl %l1, %g2
	fpackfix	%f26,	%f10
	tvs	%xcc,	0x7
	movre	%o1,	%l0,	%l6
loop_255:
	bneg,pt	%icc,	loop_256
	mulx	%g6,	0x18B6,	%o7
	fpack32	%f12,	%f16,	%f4
	wr	%g0,	0x27,	%asi
	stba	%i2,	[%l7 + 0x0B] %asi
	membar	#Sync
loop_256:
	fones	%f29
	fzeros	%f27
	brz,a	%i3,	loop_257
	bgu,a,pn	%xcc,	loop_258
	movrgz	%i6,	0x087,	%o2
	edge16ln	%i7,	%l5,	%i1
loop_257:
	brgz	%g7,	loop_259
loop_258:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f26,	%f7,	%f27
	movg	%icc,	%l1,	%o3
loop_259:
	array8	%l2,	%g1,	%o0
	fmul8x16al	%f15,	%f23,	%f30
	bneg	%xcc,	loop_260
	xnorcc	%g5,	%o4,	%o6
	sethi	0x09F6,	%o5
	te	%xcc,	0x2
loop_260:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%i5
	tgu	%xcc,	0x7
	movle	%icc,	%g4,	%l3
	nop
	set	0x24, %i4
	lduh	[%l7 + %i4],	%i0
	tle	%xcc,	0x6
	addcc	%g3,	%i4,	%g2
	wr	%g0,	0x5f,	%asi
	stxa	%o1,	[%g0 + 0x0] %asi
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x68] %asi,	%l0
	edge32n	%l6,	%o7,	%i2
	fnor	%f28,	%f18,	%f26
	brlz	%i3,	loop_261
	mulscc	%i6,	%g6,	%o2
	fbg,a	%fcc3,	loop_262
	tsubcc	%i7,	%l5,	%i1
loop_261:
	movpos	%xcc,	%l1,	%o3
	orcc	%g7,	%l2,	%o0
loop_262:
	bleu	%icc,	loop_263
	movle	%xcc,	%g5,	%g1
	fmovsleu	%xcc,	%f21,	%f26
	fmovsge	%xcc,	%f8,	%f14
loop_263:
	call	loop_264
	tge	%xcc,	0x3
	udivcc	%o4,	0x1486,	%o5
	fsrc2	%f8,	%f8
loop_264:
	fmovdcs	%icc,	%f5,	%f0
	fmovrdgz	%o6,	%f16,	%f22
	bcs	loop_265
	fmovsn	%icc,	%f15,	%f0
	edge8ln	%l4,	%g4,	%l3
	smulcc	%i0,	0x0298,	%i5
loop_265:
	fbo,a	%fcc3,	loop_266
	fpack16	%f0,	%f7
	tsubcc	%g3,	0x1D15,	%i4
	edge8ln	%g2,	%l0,	%o1
loop_266:
	be,a,pn	%xcc,	loop_267
	array8	%o7,	%i2,	%l6
	fmovdge	%icc,	%f23,	%f0
	fmovrdne	%i6,	%f24,	%f16
loop_267:
	fbl	%fcc2,	loop_268
	movrlz	%i3,	0x1CD,	%o2
	tge	%xcc,	0x5
	fmovscc	%icc,	%f27,	%f14
loop_268:
	fblg	%fcc1,	loop_269
	ldstub	[%l7 + 0x1D],	%g6
	addcc	%i7,	0x0233,	%i1
	fmul8x16	%f19,	%f24,	%f24
loop_269:
	movcc	%xcc,	%l1,	%l5
	alignaddrl	%o3,	%l2,	%g7
	ld	[%l7 + 0x68],	%f26
	set	0x6C, %l1
	ldswa	[%l7 + %l1] 0x11,	%o0
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	tg	%icc,	0x7
	nop
	setx loop_270, %l0, %l1
	jmpl %l1, %o4
	alignaddr	%g1,	%o6,	%l4
	movcs	%icc,	%o5,	%l3
	orn	%i0,	0x1AA3,	%g4
loop_270:
	stw	%i5,	[%l7 + 0x10]
	edge16ln	%g3,	%i4,	%g2
	ldub	[%l7 + 0x09],	%l0
	brz	%o1,	loop_271
	tn	%icc,	0x3
	edge32	%i2,	%o7,	%l6
	fmovscc	%icc,	%f10,	%f9
loop_271:
	nop
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	xnorcc	%i3,	%i6,	%o2
	sra	%i7,	0x15,	%i1
	bne,a,pn	%icc,	loop_272
	tl	%icc,	0x4
	movle	%xcc,	%g6,	%l5
	brgz	%l1,	loop_273
loop_272:
	movpos	%xcc,	%l2,	%o3
	edge8l	%o0,	%g5,	%g7
	sdiv	%o4,	0x1FBE,	%g1
loop_273:
	bcc,a,pn	%xcc,	loop_274
	tsubcctv	%l4,	%o5,	%l3
	ldd	[%l7 + 0x20],	%f28
	stw	%i0,	[%l7 + 0x68]
loop_274:
	orn	%g4,	0x1633,	%o6
	fmovs	%f6,	%f9
	bn,pn	%xcc,	loop_275
	fors	%f20,	%f1,	%f12
	and	%i5,	%g3,	%g2
	faligndata	%f6,	%f20,	%f0
loop_275:
	ldsb	[%l7 + 0x6A],	%i4
	ldsw	[%l7 + 0x74],	%l0
	ble	%icc,	loop_276
	andn	%i2,	0x1F30,	%o7
	movrgz	%l6,	%o1,	%i6
	subc	%i3,	0x116C,	%o2
loop_276:
	tg	%icc,	0x5
	tpos	%icc,	0x3
	movl	%xcc,	%i7,	%i1
	move	%xcc,	%g6,	%l5
	movleu	%icc,	%l1,	%o3
	fcmple16	%f24,	%f24,	%l2
	fornot2s	%f17,	%f11,	%f12
	wr	%g0,	0xe2,	%asi
	stda	%o0,	[%l7 + 0x10] %asi
	membar	#Sync
	sllx	%g5,	%g7,	%o4
	set	0x44, %o7
	ldswa	[%l7 + %o7] 0x14,	%g1
	mova	%xcc,	%l4,	%o5
	edge8ln	%l3,	%i0,	%g4
	fmuld8sux16	%f20,	%f7,	%f8
	brlz,a	%o6,	loop_277
	edge16l	%i5,	%g3,	%g2
	fpsub32s	%f16,	%f27,	%f6
	smul	%i4,	0x1ED3,	%l0
loop_277:
	movcc	%icc,	%o7,	%i2
	tpos	%xcc,	0x2
	mulx	%l6,	%i6,	%i3
	sra	%o1,	0x02,	%o2
	tg	%xcc,	0x2
	edge32	%i1,	%i7,	%l5
	edge16	%l1,	%o3,	%g6
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%o0
	membar	0x5C
	movn	%xcc,	%l2,	%g7
	srlx	%o4,	0x0E,	%g1
	ta	%xcc,	0x6
	membar	0x17
	edge16n	%l4,	%g5,	%o5
	fbge,a	%fcc1,	loop_278
	alignaddr	%i0,	%l3,	%g4
	fornot1s	%f7,	%f4,	%f16
	movgu	%xcc,	%o6,	%i5
loop_278:
	tgu	%icc,	0x4
	tle	%icc,	0x3
	bcs,a,pt	%xcc,	loop_279
	popc	%g2,	%g3
	edge8ln	%l0,	%o7,	%i2
	brgz,a	%i4,	loop_280
loop_279:
	tsubcc	%l6,	0x0FC1,	%i3
	xnor	%i6,	%o1,	%o2
	edge32	%i1,	%i7,	%l5
loop_280:
	movcc	%xcc,	%o3,	%l1
	mova	%xcc,	%o0,	%l2
	movneg	%icc,	%g7,	%o4
	fmovdge	%icc,	%f9,	%f27
	movleu	%xcc,	%g6,	%l4
	umulcc	%g5,	%g1,	%i0
	tl	%xcc,	0x4
	subcc	%o5,	0x0953,	%g4
	srax	%l3,	0x07,	%i5
	fbe,a	%fcc2,	loop_281
	sdiv	%g2,	0x0B86,	%o6
	array8	%g3,	%l0,	%i2
	movvc	%icc,	%i4,	%o7
loop_281:
	edge32	%l6,	%i6,	%o1
	ldstub	[%l7 + 0x29],	%o2
	tle	%xcc,	0x1
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x5C] %asi,	%f7
	taddcctv	%i1,	%i3,	%l5
	tcc	%xcc,	0x6
	movrlez	%o3,	%i7,	%o0
	andn	%l1,	%l2,	%o4
	bvs,pn	%xcc,	loop_282
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f22,	%f0,	%f14
	fone	%f14
loop_282:
	tn	%icc,	0x3
	ta	%xcc,	0x2
	sub	%g6,	0x1CAD,	%g7
	mulscc	%l4,	0x1176,	%g1
	sll	%i0,	%o5,	%g4
	fmovsl	%xcc,	%f0,	%f24
	brnz	%l3,	loop_283
	fornot2	%f28,	%f6,	%f6
	fmovscc	%xcc,	%f4,	%f25
	edge16l	%i5,	%g2,	%g5
loop_283:
	fmovrde	%g3,	%f0,	%f14
	fmovrsne	%l0,	%f1,	%f21
	tleu	%xcc,	0x0
	fmul8sux16	%f30,	%f16,	%f16
	andn	%o6,	%i4,	%o7
	st	%f7,	[%l7 + 0x48]
	membar	0x6D
	edge8n	%i2,	%l6,	%i6
	fpsub16s	%f30,	%f15,	%f17
	sdiv	%o2,	0x0AA6,	%i1
	mulscc	%o1,	%i3,	%l5
	umulcc	%o3,	%o0,	%i7
	fmovdneg	%icc,	%f12,	%f25
	wr	%g0,	0x89,	%asi
	stha	%l1,	[%l7 + 0x4A] %asi
	tgu	%xcc,	0x3
	movre	%l2,	%g6,	%o4
	subcc	%l4,	0x0AA2,	%g1
	tneg	%icc,	0x6
	set	0x51, %o4
	lduba	[%l7 + %o4] 0x11,	%i0
	sra	%g7,	0x07,	%o5
	fands	%f0,	%f0,	%f12
	edge8ln	%g4,	%i5,	%g2
	tpos	%xcc,	0x6
	swap	[%l7 + 0x34],	%g5
	smul	%l3,	0x1B6C,	%g3
	andn	%o6,	0x10DE,	%i4
	tgu	%xcc,	0x4
	edge16	%o7,	%l0,	%l6
	or	%i2,	%o2,	%i6
	fmovrdne	%o1,	%f30,	%f10
	fors	%f4,	%f2,	%f9
	movg	%xcc,	%i1,	%i3
	sir	0x0C98
	sethi	0x0364,	%o3
	fmovd	%f12,	%f30
	fpsub32	%f26,	%f2,	%f8
	orcc	%l5,	0x0CE2,	%o0
	set	0x28, %l5
	lduwa	[%l7 + %l5] 0x11,	%i7
	andcc	%l1,	0x14B6,	%l2
	movn	%icc,	%g6,	%o4
	sdivx	%l4,	0x1B10,	%g1
	fzeros	%f12
	fbu,a	%fcc2,	loop_284
	udivx	%g7,	0x0B59,	%i0
	bneg	%xcc,	loop_285
	nop
	setx	loop_286,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_284:
	fmovdvs	%xcc,	%f9,	%f1
	fmovsge	%icc,	%f13,	%f12
loop_285:
	array16	%g4,	%o5,	%g2
loop_286:
	membar	0x01
	sll	%g5,	0x13,	%i5
	fmovdneg	%icc,	%f18,	%f19
	subcc	%g3,	%l3,	%o6
	fbo	%fcc0,	loop_287
	call	loop_288
	nop
	setx	loop_289,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%o7,	%l0,	%i4
loop_287:
	movpos	%icc,	%i2,	%o2
loop_288:
	srl	%i6,	0x03,	%o1
loop_289:
	bcs	loop_290
	prefetch	[%l7 + 0x30],	 0x0
	fmovda	%icc,	%f4,	%f17
	edge8n	%i1,	%l6,	%o3
loop_290:
	array16	%i3,	%l5,	%o0
	movcc	%xcc,	%l1,	%l2
	sra	%g6,	%i7,	%o4
	nop
	setx	loop_291,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmps	%fcc2,	%f19,	%f24
	smulcc	%g1,	%g7,	%i0
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x56] %asi,	%l4
loop_291:
	udivx	%o5,	0x1072,	%g2
	xnorcc	%g5,	0x15B0,	%g4
	tne	%icc,	0x1
	movle	%xcc,	%i5,	%g3
	edge8	%o6,	%o7,	%l0
	subcc	%i4,	%i2,	%l3
	membar	0x46
	taddcc	%o2,	0x1BCB,	%i6
	umulcc	%i1,	%o1,	%l6
	xnorcc	%o3,	0x0B60,	%l5
	movrlz	%o0,	0x13B,	%l1
	fba,a	%fcc0,	loop_292
	fmovsge	%xcc,	%f16,	%f30
	bneg,pt	%icc,	loop_293
	stx	%i3,	[%l7 + 0x20]
loop_292:
	std	%f22,	[%l7 + 0x10]
	udivcc	%l2,	0x0AF7,	%i7
loop_293:
	movcs	%icc,	%o4,	%g1
	sdiv	%g7,	0x09E7,	%i0
	fmovsg	%xcc,	%f12,	%f9
	edge32l	%l4,	%o5,	%g6
	sllx	%g5,	0x18,	%g2
	fsrc1s	%f27,	%f15
	bn,pn	%icc,	loop_294
	fmovdne	%icc,	%f21,	%f6
	edge16n	%i5,	%g3,	%g4
	andncc	%o6,	%l0,	%i4
loop_294:
	bl,a	loop_295
	movl	%xcc,	%i2,	%o7
	lduh	[%l7 + 0x24],	%o2
	tpos	%xcc,	0x5
loop_295:
	addccc	%i6,	0x0E20,	%i1
	mova	%icc,	%o1,	%l6
	edge16	%o3,	%l5,	%l3
	bvc,pt	%icc,	loop_296
	subc	%l1,	0x112C,	%o0
	sethi	0x0F06,	%i3
	wr	%g0,	0x11,	%asi
	stwa	%i7,	[%l7 + 0x54] %asi
loop_296:
	smulcc	%l2,	%o4,	%g7
	fpsub32	%f28,	%f6,	%f16
	fmul8sux16	%f6,	%f16,	%f26
	fbge,a	%fcc1,	loop_297
	alignaddr	%i0,	%l4,	%g1
	for	%f4,	%f28,	%f8
	bvs,a,pt	%icc,	loop_298
loop_297:
	mulx	%o5,	%g6,	%g5
	movle	%xcc,	%i5,	%g3
	nop
	setx	loop_299,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_298:
	edge16n	%g2,	%o6,	%g4
	mulscc	%i4,	%l0,	%i2
	fcmpeq32	%f18,	%f20,	%o7
loop_299:
	nop
	wr	%g0,	0xe3,	%asi
	stha	%i6,	[%l7 + 0x56] %asi
	membar	#Sync
	std	%i0,	[%l7 + 0x08]
	bvs,a	%icc,	loop_300
	edge32	%o2,	%o1,	%l6
	bge	loop_301
	fmovdpos	%icc,	%f13,	%f18
loop_300:
	ldsw	[%l7 + 0x48],	%o3
	mova	%xcc,	%l3,	%l5
loop_301:
	fexpand	%f30,	%f14
	move	%icc,	%l1,	%o0
	xnorcc	%i7,	%i3,	%l2
	addccc	%o4,	%i0,	%g7
	fmovrde	%l4,	%f26,	%f20
	umulcc	%g1,	%o5,	%g6
	fmovdneg	%icc,	%f28,	%f24
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x50] %asi,	%g4
	srl	%i5,	%g3,	%o6
	edge16n	%g4,	%i4,	%l0
	edge8n	%i2,	%g2,	%i6
	nop
	setx loop_302, %l0, %l1
	jmpl %l1, %i1
	fxor	%f18,	%f4,	%f22
	tcc	%xcc,	0x4
	set	0x3C, %i2
	sta	%f22,	[%l7 + %i2] 0x15
loop_302:
	edge32	%o2,	%o7,	%o1
	addcc	%o3,	%l6,	%l5
	fpack16	%f16,	%f27
	nop
	set	0x0C, %g4
	stw	%l1,	[%l7 + %g4]
	fones	%f7
	taddcctv	%o0,	0x0A07,	%l3
	tcs	%icc,	0x2
	sir	0x05EB
	xor	%i3,	0x16D7,	%l2
	fbule,a	%fcc3,	loop_303
	bge,a,pn	%icc,	loop_304
	brlez	%i7,	loop_305
	edge16n	%i0,	%g7,	%l4
loop_303:
	tn	%icc,	0x2
loop_304:
	movge	%xcc,	%o4,	%o5
loop_305:
	tsubcc	%g1,	%g5,	%g6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x3
	fnegd	%f22,	%f18
	ba	loop_306
	movpos	%xcc,	%g3,	%o6
	edge32	%i4,	%g4,	%i2
	and	%l0,	0x1E29,	%g2
loop_306:
	fble,a	%fcc1,	loop_307
	addc	%i6,	%i1,	%o2
	sethi	0x0CE2,	%o7
	subc	%o1,	%o3,	%l6
loop_307:
	array32	%l5,	%l1,	%l3
	add	%o0,	%l2,	%i7
	movrlez	%i0,	0x16A,	%g7
	movrgez	%l4,	0x212,	%i3
	fmovdle	%xcc,	%f20,	%f14
	set	0x74, %i0
	lda	[%l7 + %i0] 0x89,	%f15
	bcs,a,pn	%xcc,	loop_308
	ldub	[%l7 + 0x70],	%o5
	fmovrsne	%o4,	%f25,	%f7
	taddcctv	%g5,	0x0997,	%g1
loop_308:
	edge32	%g6,	%i5,	%o6
	orcc	%g3,	%g4,	%i4
	fzero	%f8
	mova	%icc,	%i2,	%l0
	sll	%g2,	%i1,	%i6
	udivcc	%o2,	0x185B,	%o7
	fmovdg	%icc,	%f31,	%f19
	std	%f16,	[%l7 + 0x78]
	fmovrsgz	%o3,	%f16,	%f9
	alignaddrl	%l6,	%o1,	%l1
	fmovdg	%icc,	%f22,	%f6
	edge16l	%l5,	%l3,	%l2
	movle	%icc,	%o0,	%i0
	edge16l	%i7,	%g7,	%l4
	set	0x7E, %g7
	stha	%i3,	[%l7 + %g7] 0x18
	edge16ln	%o4,	%o5,	%g1
	bneg,pn	%icc,	loop_309
	movrlz	%g6,	%g5,	%o6
	std	%i4,	[%l7 + 0x60]
	tle	%icc,	0x4
loop_309:
	fpack16	%f6,	%f7
	bgu,a	loop_310
	alignaddr	%g3,	%g4,	%i4
	move	%icc,	%i2,	%g2
	fnands	%f16,	%f18,	%f2
loop_310:
	bvc,a,pt	%icc,	loop_311
	umul	%l0,	%i6,	%o2
	fxnors	%f0,	%f11,	%f15
	tge	%icc,	0x3
loop_311:
	bvc,a,pt	%xcc,	loop_312
	sth	%i1,	[%l7 + 0x7C]
	mulscc	%o3,	0x1DC6,	%o7
	fnors	%f27,	%f11,	%f2
loop_312:
	xnorcc	%o1,	0x14BD,	%l6
	movcc	%xcc,	%l1,	%l5
	tpos	%icc,	0x5
	fabss	%f8,	%f31
	fmovspos	%icc,	%f15,	%f15
	popc	0x0B6C,	%l2
	fmovsvc	%icc,	%f11,	%f23
	movrne	%o0,	%l3,	%i0
	fxnors	%f13,	%f30,	%f16
	mova	%xcc,	%i7,	%g7
	addccc	%i3,	0x1254,	%l4
	fnor	%f10,	%f26,	%f22
	movrlz	%o4,	%g1,	%o5
	stx	%g5,	[%l7 + 0x40]
	tleu	%xcc,	0x7
	subc	%o6,	0x0351,	%i5
	fmovse	%icc,	%f7,	%f7
	fcmple16	%f20,	%f20,	%g6
	tleu	%icc,	0x0
	fmovsvc	%xcc,	%f19,	%f28
	fexpand	%f6,	%f0
	bvc,a	loop_313
	taddcctv	%g3,	0x1A20,	%i4
	fornot2	%f28,	%f22,	%f12
	fpadd32	%f2,	%f20,	%f0
loop_313:
	tleu	%xcc,	0x4
	edge16l	%g4,	%g2,	%i2
	fornot1	%f0,	%f16,	%f30
	alignaddrl	%l0,	%i6,	%o2
	fpadd32s	%f16,	%f2,	%f9
	fmovsge	%xcc,	%f7,	%f14
	addccc	%i1,	0x0C08,	%o3
	ldx	[%l7 + 0x50],	%o1
	udivx	%l6,	0x0C8E,	%l1
	fbu	%fcc2,	loop_314
	edge32	%l5,	%l2,	%o0
	fmul8ulx16	%f18,	%f12,	%f30
	mulscc	%o7,	0x03B1,	%l3
loop_314:
	bg,pn	%icc,	loop_315
	movleu	%icc,	%i0,	%g7
	edge16l	%i3,	%l4,	%i7
	fands	%f25,	%f19,	%f5
loop_315:
	sir	0x1F0B
	edge32l	%g1,	%o4,	%g5
	edge8ln	%o6,	%o5,	%g6
	bg	loop_316
	fnands	%f26,	%f19,	%f26
	tcs	%xcc,	0x6
	mulscc	%i5,	%g3,	%i4
loop_316:
	tne	%icc,	0x2
	set	0x20, %l0
	ldsha	[%l7 + %l0] 0x15,	%g2
	ldub	[%l7 + 0x57],	%g4
	orn	%l0,	%i6,	%o2
	tg	%xcc,	0x5
	stbar
	xnor	%i1,	%i2,	%o3
	subccc	%o1,	%l6,	%l1
	fmovrsgez	%l2,	%f23,	%f2
	fand	%f12,	%f2,	%f2
	fbn	%fcc2,	loop_317
	orcc	%l5,	0x1EC5,	%o0
	subcc	%o7,	0x0B98,	%i0
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%g7
loop_317:
	fone	%f24
	siam	0x0
	fmuld8ulx16	%f11,	%f30,	%f20
	sethi	0x1663,	%i3
	orcc	%l3,	0x040E,	%i7
	fcmple16	%f16,	%f4,	%g1
	tne	%icc,	0x2
	ble,a,pt	%icc,	loop_318
	movcs	%xcc,	%l4,	%o4
	fpmerge	%f14,	%f31,	%f16
	fmul8ulx16	%f26,	%f28,	%f12
loop_318:
	sub	%o6,	%o5,	%g6
	tvs	%xcc,	0x5
	move	%icc,	%i5,	%g5
	tle	%xcc,	0x5
	fmovdle	%icc,	%f28,	%f10
	set	0x18, %l4
	lduha	[%l7 + %l4] 0x18,	%i4
	fcmpeq32	%f6,	%f28,	%g3
	movl	%icc,	%g2,	%l0
	ldsw	[%l7 + 0x24],	%i6
	movrne	%o2,	0x071,	%i1
	bne,a	loop_319
	popc	%g4,	%o3
	taddcc	%o1,	%l6,	%i2
	edge8l	%l2,	%l1,	%o0
loop_319:
	edge8l	%l5,	%i0,	%o7
	set	0x08, %i6
	ldswa	[%l7 + %i6] 0x18,	%i3
	addc	%l3,	0x0382,	%g7
	fzero	%f8
	fmuld8ulx16	%f7,	%f3,	%f14
	edge16n	%i7,	%g1,	%l4
	nop
	setx loop_320, %l0, %l1
	jmpl %l1, %o4
	movpos	%icc,	%o5,	%o6
	array8	%i5,	%g5,	%g6
	brlz,a	%g3,	loop_321
loop_320:
	fpack16	%f20,	%f29
	ba	%icc,	loop_322
	fbue,a	%fcc3,	loop_323
loop_321:
	brlez,a	%g2,	loop_324
	edge32l	%i4,	%i6,	%o2
loop_322:
	tvc	%icc,	0x1
loop_323:
	edge32l	%i1,	%g4,	%o3
loop_324:
	tg	%icc,	0x0
	fcmps	%fcc1,	%f30,	%f20
	bleu,a,pt	%icc,	loop_325
	bcs,a,pt	%xcc,	loop_326
	tcc	%icc,	0x0
	tn	%xcc,	0x6
loop_325:
	tne	%xcc,	0x1
loop_326:
	srax	%o1,	0x10,	%l0
	udivx	%i2,	0x1EA5,	%l6
	bgu,a,pn	%xcc,	loop_327
	add	%l1,	0x0DAA,	%o0
	brnz	%l2,	loop_328
	st	%f18,	[%l7 + 0x5C]
loop_327:
	bgu,a,pn	%icc,	loop_329
	mulscc	%i0,	0x0DF6,	%o7
loop_328:
	movg	%icc,	%i3,	%l3
	tg	%xcc,	0x1
loop_329:
	subcc	%g7,	0x15B0,	%l5
	andn	%g1,	%l4,	%i7
	sll	%o4,	0x19,	%o5
	edge8l	%i5,	%o6,	%g6
	alignaddrl	%g5,	%g2,	%i4
	sth	%i6,	[%l7 + 0x62]
	xorcc	%g3,	%i1,	%g4
	bgu	%icc,	loop_330
	movle	%xcc,	%o3,	%o2
	lduw	[%l7 + 0x3C],	%o1
	edge32l	%l0,	%i2,	%l6
loop_330:
	subccc	%o0,	0x022B,	%l1
	sdivx	%i0,	0x085D,	%l2
	fcmpgt16	%f26,	%f26,	%o7
	alignaddr	%l3,	%i3,	%g7
	xor	%l5,	%l4,	%g1
	taddcc	%o4,	%i7,	%i5
	fbu	%fcc1,	loop_331
	bne,a	%xcc,	loop_332
	xnor	%o6,	%o5,	%g6
	fbule,a	%fcc2,	loop_333
loop_331:
	tn	%xcc,	0x0
loop_332:
	array16	%g5,	%i4,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_333:
	move	%icc,	%g3,	%i1
	bpos,pt	%xcc,	loop_334
	udivcc	%i6,	0x1786,	%o3
	bn	loop_335
	fbl	%fcc3,	loop_336
loop_334:
	andcc	%o2,	%o1,	%g4
	bneg	%xcc,	loop_337
loop_335:
	ba,pt	%icc,	loop_338
loop_336:
	edge8l	%l0,	%i2,	%o0
	brgz	%l1,	loop_339
loop_337:
	fnegs	%f1,	%f23
loop_338:
	tvs	%icc,	0x2
	fmovdgu	%icc,	%f23,	%f26
loop_339:
	fxors	%f3,	%f19,	%f29
	movrne	%l6,	0x3C6,	%l2
	edge16n	%i0,	%o7,	%i3
	movcc	%icc,	%l3,	%l5
	tvs	%icc,	0x0
	movpos	%icc,	%l4,	%g1
	edge16	%g7,	%i7,	%i5
	nop
	setx	loop_340,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8ln	%o6,	%o5,	%o4
	fmovsvs	%icc,	%f15,	%f29
	call	loop_341
loop_340:
	movneg	%icc,	%g5,	%g6
	fnor	%f26,	%f0,	%f18
	prefetch	[%l7 + 0x7C],	 0x2
loop_341:
	movcs	%xcc,	%i4,	%g3
	subcc	%i1,	0x1A57,	%i6
	nop
	setx loop_342, %l0, %l1
	jmpl %l1, %o3
	movrlz	%g2,	%o1,	%o2
	lduh	[%l7 + 0x1E],	%l0
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x23] %asi,	%i2
loop_342:
	nop
	set	0x0, %g6
	stxa	%o0,	[%g0 + %g6] 0x5f
	ldsw	[%l7 + 0x78],	%g4
	tsubcctv	%l1,	0x033E,	%l6
	add	%i0,	%l2,	%i3
	or	%o7,	0x0974,	%l5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x78] %asi,	%l4
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x53] %asi,	%g1
	movrgz	%l3,	0x2EC,	%g7
	tsubcc	%i7,	0x0254,	%o6
	movle	%icc,	%i5,	%o4
	xnorcc	%o5,	%g6,	%g5
	tne	%xcc,	0x0
	tg	%icc,	0x4
	fmul8x16au	%f3,	%f20,	%f4
	bgu,pn	%xcc,	loop_343
	fpsub32	%f14,	%f20,	%f26
	tn	%icc,	0x5
	edge16	%g3,	%i4,	%i1
loop_343:
	edge8n	%o3,	%g2,	%i6
	fpadd32s	%f3,	%f4,	%f23
	tgu	%icc,	0x5
	srl	%o1,	0x00,	%l0
	fsrc1	%f30,	%f20
	subc	%i2,	0x1A2B,	%o0
	sub	%o2,	0x1292,	%g4
	edge8ln	%l6,	%l1,	%i0
	xnor	%i3,	0x0C4F,	%o7
	fmovdgu	%xcc,	%f14,	%f31
	movrgz	%l2,	%l5,	%g1
	fmovsneg	%xcc,	%f12,	%f19
	movne	%xcc,	%l4,	%l3
	smul	%i7,	%g7,	%o6
	umulcc	%i5,	%o5,	%g6
	ba,pt	%icc,	loop_344
	edge16l	%g5,	%o4,	%g3
	taddcc	%i4,	%i1,	%o3
	fbn	%fcc3,	loop_345
loop_344:
	add	%i6,	%g2,	%o1
	mova	%icc,	%l0,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_345:
	tle	%xcc,	0x6
	movn	%icc,	%o0,	%g4
	addc	%o2,	0x0568,	%l1
	fmovsvc	%icc,	%f22,	%f24
	movrgz	%l6,	0x22F,	%i0
	swap	[%l7 + 0x38],	%o7
	taddcctv	%l2,	%l5,	%g1
	edge16ln	%i3,	%l3,	%l4
	fandnot1	%f18,	%f10,	%f14
	lduh	[%l7 + 0x6C],	%i7
	edge16	%o6,	%i5,	%o5
	fones	%f21
	edge16	%g7,	%g5,	%o4
	fbo	%fcc3,	loop_346
	andcc	%g6,	%g3,	%i4
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x68] %asi,	%i1
loop_346:
	xorcc	%i6,	%o3,	%o1
	fbul	%fcc2,	loop_347
	srlx	%g2,	0x0F,	%i2
	udivcc	%l0,	0x1860,	%g4
	tg	%xcc,	0x1
loop_347:
	fands	%f5,	%f21,	%f25
	sth	%o2,	[%l7 + 0x70]
	mulx	%o0,	0x06A9,	%l1
	tneg	%xcc,	0x0
	andncc	%l6,	%i0,	%o7
	movrgz	%l2,	%g1,	%i3
	movle	%xcc,	%l3,	%l4
	fmul8x16al	%f29,	%f21,	%f28
	mulx	%l5,	%i7,	%i5
	movcc	%xcc,	%o6,	%g7
	nop
	setx	loop_348,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%o5,	0x3DF,	%o4
	edge8n	%g6,	%g5,	%i4
	nop
	setx loop_349, %l0, %l1
	jmpl %l1, %i1
loop_348:
	ble,a,pt	%xcc,	loop_350
	movpos	%icc,	%g3,	%i6
	movrne	%o1,	0x22C,	%g2
loop_349:
	udiv	%o3,	0x0DFF,	%i2
loop_350:
	subc	%g4,	0x01C6,	%o2
	xnor	%l0,	%o0,	%l1
	movcs	%icc,	%i0,	%o7
	edge32l	%l2,	%l6,	%g1
	taddcc	%i3,	%l4,	%l3
	fcmpeq32	%f8,	%f30,	%i7
	set	0x120, %o0
	nop 	! 	nop 	! 	ldxa	[%g0 + %o0] 0x40,	%l5 ripped by fixASI40.pl ripped by fixASI40.pl
	sdiv	%i5,	0x1A8F,	%g7
	nop
	set	0x25, %o1
	stb	%o5,	[%l7 + %o1]
	sub	%o4,	%o6,	%g5
	tg	%xcc,	0x1
	tgu	%xcc,	0x0
	tsubcc	%g6,	0x1981,	%i4
	subccc	%i1,	%g3,	%o1
	movvc	%icc,	%g2,	%i6
	edge16n	%i2,	%o3,	%o2
	tleu	%icc,	0x2
	srlx	%g4,	%o0,	%l1
	fbge,a	%fcc0,	loop_351
	sethi	0x12D4,	%l0
	edge8ln	%o7,	%i0,	%l2
	brgz	%l6,	loop_352
loop_351:
	xorcc	%g1,	0x0770,	%l4
	taddcc	%l3,	0x1BD9,	%i3
	movle	%icc,	%l5,	%i5
loop_352:
	fandnot1s	%f5,	%f1,	%f1
	smul	%g7,	%o5,	%i7
	alignaddr	%o6,	%o4,	%g6
	fbuge,a	%fcc3,	loop_353
	sdiv	%i4,	0x169F,	%g5
	fnands	%f31,	%f30,	%f29
	udivx	%g3,	0x1887,	%o1
loop_353:
	tsubcc	%g2,	0x0611,	%i6
	move	%icc,	%i1,	%o3
	edge8ln	%i2,	%g4,	%o2
	edge32ln	%o0,	%l1,	%l0
	fpsub32s	%f25,	%f17,	%f29
	set	0x46, %o2
	ldstuba	[%l7 + %o2] 0x80,	%o7
	srl	%l2,	0x10,	%i0
	sethi	0x0CC0,	%l6
	movle	%xcc,	%g1,	%l4
	fbue	%fcc3,	loop_354
	addccc	%i3,	0x140E,	%l3
	ble,a,pt	%icc,	loop_355
	smul	%l5,	%i5,	%g7
loop_354:
	addcc	%i7,	%o6,	%o5
	bl,a,pn	%icc,	loop_356
loop_355:
	movpos	%xcc,	%g6,	%o4
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x24] %asi,	%i4
loop_356:
	movgu	%xcc,	%g5,	%o1
	fsrc1s	%f21,	%f5
	movrgz	%g3,	%i6,	%i1
	stbar
	movne	%xcc,	%o3,	%g2
	wr	%g0,	0x11,	%asi
	stba	%g4,	[%l7 + 0x56] %asi
	bvc,pn	%icc,	loop_357
	swap	[%l7 + 0x50],	%o2
	flush	%l7 + 0x14
	xorcc	%i2,	0x12C9,	%o0
loop_357:
	fmul8x16	%f22,	%f24,	%f16
	movrgz	%l1,	0x23D,	%l0
	fcmped	%fcc0,	%f6,	%f28
	fmuld8sux16	%f11,	%f23,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f18,	%f10,	%f22
	movpos	%icc,	%o7,	%l2
	movrlz	%l6,	%g1,	%i0
	tgu	%icc,	0x1
	array8	%i3,	%l4,	%l3
	edge32n	%i5,	%g7,	%l5
	fmovdg	%icc,	%f16,	%f30
	tsubcctv	%o6,	0x072D,	%o5
	movgu	%xcc,	%i7,	%o4
	stw	%i4,	[%l7 + 0x6C]
	fcmpeq32	%f18,	%f30,	%g5
	sllx	%g6,	0x1B,	%g3
	movvc	%icc,	%i6,	%i1
	fcmpgt32	%f26,	%f8,	%o3
	fbu	%fcc0,	loop_358
	bvs,a,pt	%icc,	loop_359
	srax	%g2,	0x16,	%g4
	sra	%o2,	%i2,	%o0
loop_358:
	fxnors	%f4,	%f17,	%f27
loop_359:
	sdiv	%o1,	0x1C01,	%l0
	sdivx	%l1,	0x1086,	%o7
	fmovrdne	%l2,	%f14,	%f6
	bne,pn	%xcc,	loop_360
	flush	%l7 + 0x1C
	fmovdpos	%icc,	%f14,	%f24
	subc	%g1,	%i0,	%i3
loop_360:
	subccc	%l4,	%l3,	%i5
	movneg	%icc,	%g7,	%l5
	bvc,pt	%icc,	loop_361
	fmovdn	%icc,	%f17,	%f28
	fmovspos	%xcc,	%f11,	%f10
	xor	%l6,	0x1CCA,	%o6
loop_361:
	sllx	%i7,	%o4,	%i4
	edge8l	%o5,	%g6,	%g3
	andcc	%i6,	%g5,	%o3
	fmul8x16	%f23,	%f2,	%f14
	movrgz	%i1,	0x086,	%g2
	movneg	%xcc,	%g4,	%i2
	edge32l	%o2,	%o0,	%l0
	fmovsn	%icc,	%f14,	%f3
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x0] %asi,	%l1
	movneg	%icc,	%o7,	%l2
	movrlz	%g1,	%i0,	%i3
	subccc	%l4,	%o1,	%l3
	subc	%g7,	0x0CCA,	%l5
	ldd	[%l7 + 0x38],	%f8
	set	0x5F, %o5
	ldstuba	[%l7 + %o5] 0x89,	%i5
	movpos	%icc,	%o6,	%l6
	sll	%o4,	%i4,	%o5
	tneg	%icc,	0x3
	array8	%g6,	%i7,	%i6
	edge32	%g5,	%g3,	%o3
	sdiv	%g2,	0x1C9C,	%g4
	taddcctv	%i1,	%o2,	%i2
	tcc	%icc,	0x1
	fmovrslez	%o0,	%f18,	%f18
	popc	0x1C89,	%l1
	fmovdcs	%xcc,	%f30,	%f14
	movn	%xcc,	%l0,	%l2
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g1
	edge32ln	%o7,	%i0,	%l4
	call	loop_362
	fmovsgu	%xcc,	%f11,	%f29
	movn	%xcc,	%i3,	%o1
	tneg	%xcc,	0x7
loop_362:
	andncc	%g7,	%l5,	%l3
	fpsub16	%f16,	%f20,	%f20
	edge8l	%o6,	%i5,	%o4
	tleu	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l6,	%i4,	%g6
	mulscc	%o5,	%i7,	%g5
	ld	[%l7 + 0x1C],	%f9
	movrgez	%i6,	0x2C8,	%o3
	edge16	%g3,	%g2,	%i1
	movgu	%xcc,	%g4,	%o2
	brlez	%o0,	loop_363
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%l1,	%l0
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%f22
loop_363:
	fblg	%fcc3,	loop_364
	movgu	%icc,	%l2,	%i2
	fmovsge	%icc,	%f9,	%f6
	fnand	%f6,	%f20,	%f26
loop_364:
	tcs	%xcc,	0x4
	taddcctv	%g1,	%o7,	%l4
	edge32ln	%i3,	%o1,	%i0
	tvs	%xcc,	0x3
	edge8	%l5,	%l3,	%o6
	orncc	%i5,	0x1E6E,	%o4
	movge	%icc,	%g7,	%l6
	movn	%icc,	%g6,	%i4
	fmuld8ulx16	%f2,	%f4,	%f8
	fandnot1s	%f26,	%f4,	%f12
	tl	%xcc,	0x3
	fmovscc	%xcc,	%f31,	%f31
	ldd	[%l7 + 0x60],	%f28
	fmovs	%f3,	%f18
	sdivcc	%o5,	0x0DC2,	%i7
	ldsw	[%l7 + 0x4C],	%i6
	fmovdle	%xcc,	%f21,	%f21
	array16	%g5,	%g3,	%g2
	xnorcc	%o3,	0x0DE3,	%i1
	te	%icc,	0x7
	orncc	%o2,	%o0,	%l1
	fxnor	%f0,	%f24,	%f0
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x0C] %asi,	%f20
	andn	%g4,	0x0B10,	%l2
	tn	%icc,	0x4
	sir	0x0E55
	sdivx	%i2,	0x1F47,	%l0
	swap	[%l7 + 0x58],	%g1
	alignaddrl	%l4,	%i3,	%o7
	mova	%icc,	%o1,	%i0
	fmovsne	%xcc,	%f11,	%f16
	mova	%xcc,	%l5,	%o6
	wr	%g0,	0x80,	%asi
	stxa	%i5,	[%l7 + 0x38] %asi
	tsubcctv	%l3,	%g7,	%o4
	edge32n	%l6,	%i4,	%g6
	fsrc2s	%f3,	%f5
	ld	[%l7 + 0x34],	%f29
	be	%icc,	loop_365
	movge	%xcc,	%o5,	%i7
	array8	%i6,	%g5,	%g2
	sub	%g3,	0x0C0D,	%o3
loop_365:
	ta	%icc,	0x5
	movre	%o2,	0x343,	%o0
	tcs	%xcc,	0x7
	alignaddr	%l1,	%i1,	%g4
	fmovsn	%icc,	%f20,	%f14
	fmovdcs	%xcc,	%f15,	%f13
	orncc	%l2,	%l0,	%g1
	stw	%l4,	[%l7 + 0x4C]
	fcmpes	%fcc2,	%f20,	%f18
	tvs	%xcc,	0x3
	addccc	%i2,	0x1185,	%o7
	or	%i3,	%i0,	%o1
	te	%icc,	0x0
	fmovdleu	%icc,	%f16,	%f19
	movpos	%xcc,	%l5,	%o6
	fbge,a	%fcc3,	loop_366
	movleu	%xcc,	%i5,	%l3
	nop
	setx loop_367, %l0, %l1
	jmpl %l1, %g7
	tne	%icc,	0x3
loop_366:
	movle	%icc,	%o4,	%l6
	fmul8x16al	%f16,	%f1,	%f16
loop_367:
	tcc	%icc,	0x5
	swap	[%l7 + 0x2C],	%i4
	te	%xcc,	0x2
	movrgz	%o5,	%g6,	%i7
	tle	%icc,	0x7
	edge32	%g5,	%i6,	%g3
	bg,a,pt	%icc,	loop_368
	movrlz	%g2,	0x209,	%o3
	movrlz	%o2,	%l1,	%i1
	xnorcc	%g4,	%l2,	%o0
loop_368:
	stw	%g1,	[%l7 + 0x58]
	edge32l	%l4,	%i2,	%l0
	sdivcc	%o7,	0x19CE,	%i3
	bg,a,pt	%xcc,	loop_369
	brlez	%o1,	loop_370
	te	%icc,	0x6
	be,a,pt	%xcc,	loop_371
loop_369:
	ldstub	[%l7 + 0x45],	%i0
loop_370:
	movgu	%xcc,	%l5,	%i5
	te	%icc,	0x5
loop_371:
	subc	%l3,	%o6,	%g7
	edge8n	%l6,	%o4,	%o5
	umulcc	%g6,	%i7,	%i4
	tne	%xcc,	0x5
	nop
	setx	loop_372,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srax	%i6,	0x01,	%g3
	tle	%xcc,	0x3
	orcc	%g2,	0x0B17,	%g5
loop_372:
	fandnot1s	%f21,	%f11,	%f22
	fmovrdlz	%o2,	%f22,	%f28
	andncc	%o3,	%l1,	%g4
	set	0x3C, %g2
	stwa	%l2,	[%l7 + %g2] 0x27
	membar	#Sync
	edge8n	%i1,	%o0,	%g1
	tne	%xcc,	0x7
	udivx	%i2,	0x119D,	%l0
	fornot1	%f8,	%f20,	%f30
	bne,a	loop_373
	edge16l	%l4,	%i3,	%o7
	fmovse	%xcc,	%f29,	%f31
	add	%o1,	%l5,	%i0
loop_373:
	fmul8x16au	%f27,	%f12,	%f20
	movcs	%xcc,	%i5,	%l3
	xor	%o6,	0x10A6,	%l6
	fmul8x16au	%f7,	%f11,	%f6
	movrlez	%o4,	%o5,	%g6
	umulcc	%g7,	%i7,	%i4
	edge32	%i6,	%g2,	%g3
	bcc,pt	%xcc,	loop_374
	and	%g5,	%o3,	%l1
	bpos,a,pt	%xcc,	loop_375
	nop
	setx loop_376, %l0, %l1
	jmpl %l1, %o2
loop_374:
	fmovsleu	%xcc,	%f26,	%f5
	bg,pt	%icc,	loop_377
loop_375:
	fpadd32s	%f25,	%f17,	%f7
loop_376:
	umulcc	%l2,	%i1,	%g4
	nop
	set	0x56, %i1
	sth	%o0,	[%l7 + %i1]
loop_377:
	swap	[%l7 + 0x74],	%i2
	orn	%l0,	0x1284,	%l4
	edge32ln	%g1,	%i3,	%o1
	bn	loop_378
	brgz,a	%l5,	loop_379
	andcc	%i0,	0x08C8,	%i5
	movvs	%icc,	%o7,	%l3
loop_378:
	nop
	set	0x56, %i5
	lduba	[%l7 + %i5] 0x14,	%l6
loop_379:
	fmovsvs	%xcc,	%f31,	%f9
	add	%o4,	0x0123,	%o6
	edge16ln	%g6,	%g7,	%i7
	fpackfix	%f2,	%f7
	srax	%i4,	0x01,	%o5
	fmovsa	%icc,	%f30,	%f29
	fmovsvc	%xcc,	%f22,	%f18
	edge32l	%g2,	%g3,	%i6
	fornot1s	%f31,	%f29,	%f31
	sub	%g5,	0x059C,	%o3
	set	0x24, %i3
	swapa	[%l7 + %i3] 0x19,	%l1
	tpos	%icc,	0x0
	fmovdgu	%icc,	%f10,	%f31
	bcc,pt	%icc,	loop_380
	umulcc	%l2,	%o2,	%g4
	edge32ln	%i1,	%o0,	%i2
	edge8	%l4,	%g1,	%i3
loop_380:
	tn	%icc,	0x2
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	andncc	%o1,	%l5,	%i0
	addc	%l0,	0x0F20,	%i5
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%l3
	fbe	%fcc0,	loop_381
	edge8	%l6,	%o4,	%o6
	sllx	%g6,	%o7,	%i7
	sub	%g7,	%i4,	%g2
loop_381:
	fmovdg	%icc,	%f12,	%f13
	fmovse	%icc,	%f19,	%f24
	mulscc	%o5,	%g3,	%g5
	set	0x30, %g3
	lda	[%l7 + %g3] 0x88,	%f17
	bcc,a	%xcc,	loop_382
	sir	0x1B8C
	set	0x4C, %l6
	stba	%i6,	[%l7 + %l6] 0x15
loop_382:
	fpadd32s	%f2,	%f31,	%f8
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x68] %asi,	%l1
	addccc	%l2,	0x1A50,	%o3
	fmovrse	%g4,	%f2,	%f30
	ldsh	[%l7 + 0x0A],	%o2
	nop
	setx loop_383, %l0, %l1
	jmpl %l1, %i1
	edge8n	%o0,	%i2,	%l4
	movneg	%icc,	%i3,	%g1
	edge32n	%l5,	%i0,	%o1
loop_383:
	nop
	set	0x58, %g5
	std	%l0,	[%l7 + %g5]
	ld	[%l7 + 0x1C],	%f19
	sdiv	%l3,	0x19F4,	%i5
	edge32l	%l6,	%o6,	%o4
	wr	%g0,	0xe2,	%asi
	stha	%g6,	[%l7 + 0x38] %asi
	membar	#Sync
	movneg	%xcc,	%o7,	%g7
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x70] %asi,	%i4
	subccc	%i7,	0x0656,	%g2
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%o5
	edge32l	%g5,	%i6,	%l1
	sdiv	%g3,	0x0C87,	%o3
	movl	%icc,	%l2,	%g4
	nop
	setx	loop_384,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bneg,a,pn	%xcc,	loop_385
	bvc	%icc,	loop_386
	fmovrsne	%i1,	%f23,	%f27
loop_384:
	subcc	%o0,	0x0257,	%o2
loop_385:
	edge16ln	%i2,	%l4,	%g1
loop_386:
	fcmpgt32	%f0,	%f6,	%i3
	fbo	%fcc2,	loop_387
	tsubcctv	%i0,	0x028A,	%l5
	tgu	%icc,	0x6
	sdivcc	%o1,	0x1DA3,	%l0
loop_387:
	fsrc2s	%f19,	%f30
	popc	%i5,	%l6
	brlz	%l3,	loop_388
	fcmpd	%fcc2,	%f22,	%f2
	swap	[%l7 + 0x38],	%o6
	or	%o4,	%g6,	%g7
loop_388:
	mova	%icc,	%o7,	%i4
	tvc	%xcc,	0x4
	fnand	%f8,	%f6,	%f6
	popc	0x0824,	%i7
	tcs	%icc,	0x2
	fmovde	%icc,	%f19,	%f27
	fbg,a	%fcc0,	loop_389
	movgu	%icc,	%g2,	%o5
	fbg,a	%fcc1,	loop_390
	brlez,a	%g5,	loop_391
loop_389:
	sethi	0x0859,	%l1
	fabsd	%f14,	%f4
loop_390:
	fmovsl	%xcc,	%f14,	%f27
loop_391:
	orncc	%i6,	%o3,	%l2
	sub	%g4,	0x1022,	%g3
	fmovdneg	%xcc,	%f29,	%f21
	xor	%o0,	0x117A,	%i1
	movg	%xcc,	%i2,	%o2
	sdivx	%l4,	0x0203,	%i3
	fbug	%fcc1,	loop_392
	srlx	%i0,	0x1C,	%l5
	array8	%o1,	%g1,	%i5
	fmovdne	%xcc,	%f0,	%f7
loop_392:
	lduh	[%l7 + 0x1A],	%l6
	set	0x12, %o3
	lduba	[%l7 + %o3] 0x81,	%l3
	taddcc	%o6,	%l0,	%g6
	edge8ln	%g7,	%o7,	%o4
	subc	%i7,	0x0AC4,	%i4
	andcc	%o5,	%g5,	%l1
	movcc	%xcc,	%i6,	%g2
	tleu	%xcc,	0x0
	andn	%o3,	0x0744,	%g4
	smulcc	%g3,	0x05CC,	%l2
	nop
	setx loop_393, %l0, %l1
	jmpl %l1, %o0
	fcmple16	%f16,	%f26,	%i2
	andncc	%o2,	%i1,	%i3
	movpos	%icc,	%i0,	%l5
loop_393:
	andn	%o1,	0x045D,	%g1
	xorcc	%l4,	%l6,	%l3
	fmovs	%f16,	%f5
	edge8	%o6,	%i5,	%g6
	fnor	%f18,	%f22,	%f2
	fnor	%f22,	%f6,	%f16
	tg	%icc,	0x7
	orn	%g7,	0x1E97,	%o7
	set	0x21, %l3
	stba	%o4,	[%l7 + %l3] 0xeb
	membar	#Sync
	tvs	%xcc,	0x2
	fmovdl	%icc,	%f9,	%f12
	set	0x56, %o6
	stha	%l0,	[%l7 + %o6] 0xe3
	membar	#Sync
	fbue	%fcc3,	loop_394
	movrne	%i4,	0x223,	%o5
	bcs,a	%icc,	loop_395
	fmovrslez	%g5,	%f3,	%f19
loop_394:
	fmul8x16au	%f10,	%f18,	%f14
	fcmple16	%f30,	%f24,	%l1
loop_395:
	tcc	%xcc,	0x2
	brgz	%i6,	loop_396
	fpadd32s	%f2,	%f7,	%f7
	movneg	%xcc,	%g2,	%i7
	tne	%icc,	0x6
loop_396:
	xnorcc	%g4,	%g3,	%l2
	tl	%xcc,	0x2
	fnegd	%f24,	%f16
	array16	%o3,	%i2,	%o0
	ldsh	[%l7 + 0x5E],	%i1
	addccc	%o2,	%i0,	%i3
	orncc	%o1,	0x13E4,	%g1
	tneg	%icc,	0x0
	fba,a	%fcc0,	loop_397
	array16	%l5,	%l6,	%l3
	tne	%xcc,	0x4
	smul	%l4,	0x1659,	%i5
loop_397:
	tne	%xcc,	0x5
	fabss	%f13,	%f15
	sll	%g6,	0x00,	%o6
	brnz,a	%o7,	loop_398
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g7,	%o4,	%i4
	fmovrsgez	%o5,	%f12,	%f29
loop_398:
	edge16	%g5,	%l1,	%l0
	fmovdleu	%icc,	%f11,	%f4
	xnorcc	%g2,	%i7,	%g4
	tpos	%icc,	0x0
	array32	%g3,	%l2,	%i6
	sub	%o3,	%o0,	%i1
	set	0x58, %g1
	ldsha	[%l7 + %g1] 0x04,	%i2
	edge8ln	%o2,	%i3,	%i0
	sdivcc	%g1,	0x1F85,	%l5
	pdist	%f16,	%f26,	%f24
	movge	%xcc,	%l6,	%o1
	taddcctv	%l4,	%i5,	%l3
	brlz	%g6,	loop_399
	movn	%icc,	%o6,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg,a	%fcc2,	loop_400
loop_399:
	xor	%o7,	0x195A,	%o4
	lduh	[%l7 + 0x24],	%i4
	fbule	%fcc0,	loop_401
loop_400:
	add	%o5,	%l1,	%l0
	fbg	%fcc1,	loop_402
	fbue	%fcc2,	loop_403
loop_401:
	edge8	%g5,	%i7,	%g4
	lduw	[%l7 + 0x54],	%g2
loop_402:
	alignaddr	%l2,	%i6,	%o3
loop_403:
	movrne	%o0,	0x2F9,	%i1
	xorcc	%i2,	0x1EB6,	%g3
	movne	%xcc,	%i3,	%i0
	ldsw	[%l7 + 0x4C],	%g1
	edge32n	%l5,	%l6,	%o1
	fabss	%f23,	%f14
	fmovde	%xcc,	%f6,	%f10
	srax	%o2,	%i5,	%l3
	orn	%l4,	%g6,	%o6
	udivcc	%o7,	0x0958,	%g7
	fsrc2	%f30,	%f14
	fcmple16	%f8,	%f22,	%i4
	sir	0x025F
	fpack32	%f14,	%f14,	%f24
	mulscc	%o5,	0x10F9,	%o4
	te	%icc,	0x1
	membar	0x7B
	bgu,pt	%icc,	loop_404
	tcc	%icc,	0x6
	fandnot2	%f4,	%f14,	%f8
	udivx	%l0,	0x02D9,	%g5
loop_404:
	fandnot2	%f12,	%f12,	%f28
	tle	%icc,	0x7
	stw	%l1,	[%l7 + 0x68]
	edge16ln	%i7,	%g2,	%l2
	tleu	%icc,	0x7
	tge	%icc,	0x4
	bneg,a	loop_405
	fbug,a	%fcc2,	loop_406
	for	%f22,	%f4,	%f20
	membar	0x1E
loop_405:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_406:
	smulcc	%i6,	%o3,	%o0
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x34] %asi,	%g4
	movrgz	%i1,	%i2,	%g3
	edge32ln	%i0,	%g1,	%i3
	fmovsge	%icc,	%f16,	%f9
	fmovsn	%icc,	%f22,	%f2
	edge32	%l6,	%l5,	%o2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%l3
	tle	%xcc,	0x6
	fandnot2s	%f31,	%f18,	%f26
	fxnor	%f16,	%f18,	%f2
	sllx	%l4,	%o1,	%g6
	ta	%icc,	0x1
	subcc	%o7,	%o6,	%i4
	subcc	%g7,	%o5,	%l0
	nop
	setx	loop_407,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	for	%f16,	%f0,	%f22
	bcc,a,pt	%icc,	loop_408
	movrlez	%g5,	0x0E8,	%o4
loop_407:
	fmovsa	%xcc,	%f6,	%f8
	nop
	set	0x66, %i4
	stb	%l1,	[%l7 + %i4]
loop_408:
	edge16l	%i7,	%l2,	%g2
	xnor	%o3,	%i6,	%g4
	tl	%icc,	0x4
	fmovrse	%o0,	%f5,	%f4
	sdivcc	%i2,	0x0788,	%g3
	wr	%g0,	0x2a,	%asi
	stwa	%i1,	[%l7 + 0x24] %asi
	membar	#Sync
	fmovspos	%icc,	%f3,	%f13
	taddcc	%g1,	0x0828,	%i0
	orn	%i3,	%l6,	%l5
	fmovdpos	%xcc,	%f6,	%f11
	addc	%i5,	%o2,	%l3
	tg	%icc,	0x2
	sra	%o1,	0x15,	%g6
	movcs	%xcc,	%o7,	%o6
	movre	%i4,	%l4,	%o5
	array8	%g7,	%g5,	%l0
	movcc	%icc,	%l1,	%o4
	andn	%i7,	0x1C56,	%l2
	taddcc	%g2,	0x1790,	%o3
	or	%g4,	0x1B0A,	%o0
	tpos	%icc,	0x0
	addccc	%i6,	0x1221,	%g3
	andncc	%i1,	%g1,	%i0
	alignaddrl	%i3,	%l6,	%l5
	fsrc1s	%f5,	%f19
	tneg	%xcc,	0x3
	edge32	%i5,	%o2,	%i2
	orncc	%o1,	0x08DF,	%g6
	fmovda	%xcc,	%f31,	%f12
	edge32	%l3,	%o7,	%o6
	smulcc	%i4,	0x1E9A,	%l4
	fbn	%fcc1,	loop_409
	ble,a	loop_410
	fmovs	%f6,	%f10
	fnegd	%f24,	%f12
loop_409:
	fpsub32s	%f24,	%f18,	%f20
loop_410:
	fcmpne16	%f14,	%f14,	%o5
	edge16ln	%g5,	%g7,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o4,	%i7,	%l1
	sir	0x15A2
	membar	0x56
	set	0x10, %l2
	ldxa	[%g0 + %l2] 0x20,	%g2
	addcc	%o3,	%g4,	%l2
	xnorcc	%o0,	%i6,	%i1
	fmovdne	%xcc,	%f27,	%f15
	movrgez	%g3,	%g1,	%i3
	stb	%i0,	[%l7 + 0x20]
	mulx	%l5,	0x195C,	%i5
	sll	%l6,	0x1A,	%o2
	taddcctv	%i2,	%o1,	%g6
	orcc	%o7,	0x02C4,	%l3
	fbu,a	%fcc0,	loop_411
	fmovsge	%xcc,	%f14,	%f4
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x20] %asi,	%i4
loop_411:
	sdiv	%l4,	0x1775,	%o6
	subcc	%o5,	%g7,	%g5
	ldub	[%l7 + 0x16],	%l0
	smulcc	%o4,	0x1CD8,	%i7
	movrgz	%g2,	0x3B2,	%o3
	movne	%xcc,	%g4,	%l2
	fnot1	%f30,	%f10
	fnors	%f19,	%f13,	%f26
	umul	%o0,	0x0266,	%l1
	edge32n	%i6,	%i1,	%g1
	edge8n	%i3,	%g3,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%l5,	%l6
	srax	%i5,	0x1A,	%o2
	umulcc	%i2,	%g6,	%o1
	srlx	%o7,	%i4,	%l3
	fmovrsgz	%l4,	%f20,	%f17
	ldd	[%l7 + 0x70],	%f28
	tn	%icc,	0x0
	fbl	%fcc3,	loop_412
	movrlz	%o5,	%g7,	%g5
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%o6
loop_412:
	fble	%fcc0,	loop_413
	xor	%o4,	%l0,	%g2
	tne	%icc,	0x4
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_413:
	tpos	%icc,	0x1
	umul	%o3,	0x10EC,	%i7
	orcc	%g4,	0x1C9C,	%l2
	fbg	%fcc3,	loop_414
	movne	%icc,	%o0,	%i6
	fmovrdlz	%i1,	%f18,	%f4
	fmovdle	%xcc,	%f3,	%f30
loop_414:
	andn	%l1,	0x0BEB,	%g1
	udivx	%i3,	0x1411,	%i0
	edge32	%l5,	%l6,	%i5
	ld	[%l7 + 0x44],	%f7
	edge8l	%o2,	%i2,	%g3
	movvs	%icc,	%o1,	%g6
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
	fpsub32	%f6,	%f14,	%f22
	fmovrsne	%o7,	%f13,	%f7
	array16	%l3,	%l4,	%i4
loop_415:
	orn	%g7,	%o5,	%g5
	ldsw	[%l7 + 0x24],	%o6
	edge32	%l0,	%g2,	%o4
	fmovscc	%icc,	%f27,	%f6
	sdivx	%o3,	0x00BF,	%i7
	tn	%icc,	0x3
	sth	%g4,	[%l7 + 0x34]
	ta	%xcc,	0x1
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	xorcc	%o0,	0x0CFE,	%l2
	movrlez	%i1,	%l1,	%i6
	edge16n	%g1,	%i3,	%i0
	nop
	setx loop_416, %l0, %l1
	jmpl %l1, %l5
	fmovrsgez	%i5,	%f31,	%f31
	set	0x0C, %l1
	ldsba	[%l7 + %l1] 0x89,	%l6
loop_416:
	fcmpes	%fcc3,	%f10,	%f15
	brnz,a	%o2,	loop_417
	subcc	%g3,	%o1,	%g6
	fcmpne16	%f20,	%f30,	%o7
	ba	loop_418
loop_417:
	move	%xcc,	%i2,	%l3
	for	%f20,	%f2,	%f22
	nop
	setx loop_419, %l0, %l1
	jmpl %l1, %i4
loop_418:
	edge32l	%g7,	%l4,	%g5
	tge	%xcc,	0x7
	tl	%xcc,	0x3
loop_419:
	sra	%o6,	%l0,	%o5
	tneg	%xcc,	0x1
	edge16l	%g2,	%o3,	%i7
	mova	%xcc,	%g4,	%o4
	fbne	%fcc0,	loop_420
	fmul8x16	%f23,	%f0,	%f30
	movn	%icc,	%o0,	%i1
	fmovse	%icc,	%f26,	%f17
loop_420:
	subc	%l2,	%l1,	%i6
	andn	%i3,	0x10E6,	%i0
	fxors	%f10,	%f12,	%f8
	alignaddrl	%l5,	%g1,	%l6
	tvs	%icc,	0x5
	prefetch	[%l7 + 0x5C],	 0x2
	fnot2	%f0,	%f30
	alignaddr	%o2,	%g3,	%o1
	xor	%g6,	%o7,	%i2
	bcc,a	loop_421
	movg	%icc,	%l3,	%i4
	fornot2s	%f14,	%f24,	%f3
	srlx	%i5,	0x1C,	%g7
loop_421:
	fpmerge	%f16,	%f22,	%f26
	set	0x35, %o4
	stba	%g5,	[%l7 + %o4] 0xe2
	membar	#Sync
	ble,a,pn	%icc,	loop_422
	fble	%fcc1,	loop_423
	fpsub16s	%f16,	%f21,	%f26
	movge	%xcc,	%l4,	%o6
loop_422:
	stx	%l0,	[%l7 + 0x50]
loop_423:
	siam	0x3
	umulcc	%o5,	%g2,	%i7
	fmovrsne	%g4,	%f26,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%o4,	%o3
	fmovrdgz	%o0,	%f16,	%f16
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x25] %asi,	%l2
	edge8n	%l1,	%i6,	%i3
	tgu	%xcc,	0x4
	tle	%icc,	0x7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%l5
	ble,a,pt	%xcc,	loop_424
	fcmpd	%fcc2,	%f28,	%f20
	brz,a	%i0,	loop_425
	tvc	%xcc,	0x4
loop_424:
	tcs	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x78] %asi,	%g1
loop_425:
	taddcc	%o2,	%g3,	%l6
	sllx	%g6,	%o1,	%i2
	movle	%xcc,	%o7,	%l3
	tpos	%icc,	0x1
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x38] %asi,	%i4
	edge16ln	%i5,	%g5,	%g7
	fmovscs	%xcc,	%f7,	%f29
	subccc	%o6,	0x0FA3,	%l4
	tleu	%icc,	0x7
	sdiv	%o5,	0x1200,	%l0
	bge,pn	%icc,	loop_426
	umulcc	%i7,	%g2,	%o4
	fmovrdgez	%o3,	%f2,	%f30
	edge8ln	%o0,	%l2,	%g4
loop_426:
	fnors	%f29,	%f10,	%f3
	ldsh	[%l7 + 0x6C],	%i6
	set	0x0C, %o7
	ldswa	[%l7 + %o7] 0x15,	%l1
	tleu	%icc,	0x3
	subcc	%i3,	0x1767,	%l5
	tn	%xcc,	0x3
	popc	0x149F,	%i0
	edge16	%g1,	%i1,	%o2
	addcc	%g3,	0x0D33,	%g6
	udivx	%l6,	0x1685,	%o1
	fbe	%fcc2,	loop_427
	fmovdg	%icc,	%f9,	%f17
	alignaddr	%i2,	%l3,	%i4
	movvs	%xcc,	%o7,	%i5
loop_427:
	movrlz	%g5,	%o6,	%l4
	tsubcc	%g7,	0x148C,	%o5
	xor	%i7,	%l0,	%o4
	movg	%icc,	%o3,	%g2
	sdivx	%o0,	0x1E83,	%g4
	smulcc	%l2,	%i6,	%i3
	add	%l1,	%l5,	%i0
	brlez	%i1,	loop_428
	for	%f30,	%f0,	%f12
	tcs	%icc,	0x2
	bvs	%icc,	loop_429
loop_428:
	popc	%o2,	%g3
	fblg	%fcc0,	loop_430
	sra	%g6,	%g1,	%o1
loop_429:
	sir	0x0D3B
	movleu	%icc,	%i2,	%l3
loop_430:
	tle	%xcc,	0x7
	xnorcc	%i4,	0x0295,	%o7
	nop
	set	0x6C, %l5
	stw	%l6,	[%l7 + %l5]
	edge8n	%i5,	%o6,	%g5
	fand	%f0,	%f10,	%f30
	fble	%fcc3,	loop_431
	edge8ln	%l4,	%o5,	%i7
	fornot1s	%f21,	%f26,	%f9
	fnot2s	%f0,	%f18
loop_431:
	fmovdgu	%icc,	%f31,	%f10
	edge32l	%g7,	%o4,	%l0
	ldx	[%l7 + 0x18],	%o3
	movre	%g2,	0x3D9,	%g4
	stb	%l2,	[%l7 + 0x10]
	fabsd	%f28,	%f2
	andcc	%i6,	%o0,	%l1
	sethi	0x0246,	%i3
	movge	%icc,	%i0,	%l5
	brnz,a	%i1,	loop_432
	movge	%icc,	%g3,	%o2
	smulcc	%g6,	%g1,	%i2
	subccc	%l3,	0x069E,	%i4
loop_432:
	sll	%o1,	0x04,	%o7
	xor	%l6,	0x14D9,	%o6
	edge32n	%g5,	%l4,	%o5
	movvc	%icc,	%i7,	%i5
	movrne	%o4,	%g7,	%l0
	tgu	%icc,	0x4
	fabss	%f8,	%f17
	movcc	%xcc,	%g2,	%o3
	tpos	%icc,	0x6
	taddcctv	%g4,	%l2,	%o0
	movvs	%icc,	%l1,	%i3
	set	0x48, %g4
	ldxa	[%l7 + %g4] 0x04,	%i6
	fandnot1	%f26,	%f2,	%f16
	subccc	%l5,	0x1914,	%i1
	swap	[%l7 + 0x60],	%g3
	sub	%i0,	%o2,	%g6
	sdivcc	%i2,	0x0558,	%l3
	fpadd32s	%f8,	%f14,	%f26
	taddcc	%i4,	%o1,	%o7
	taddcctv	%g1,	%o6,	%g5
	movneg	%xcc,	%l4,	%l6
	movcs	%icc,	%i7,	%o5
	wr	%g0,	0x2f,	%asi
	stha	%i5,	[%l7 + 0x1A] %asi
	membar	#Sync
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	subcc	%o4,	0x1547,	%g7
	fbne,a	%fcc2,	loop_433
	movleu	%xcc,	%l0,	%g2
	smul	%g4,	0x063F,	%o3
	fnands	%f9,	%f13,	%f18
loop_433:
	fbul,a	%fcc3,	loop_434
	movn	%xcc,	%o0,	%l1
	tcs	%xcc,	0x0
	tle	%xcc,	0x1
loop_434:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	fbn	%fcc2,	loop_435
	edge8ln	%i6,	%l2,	%i1
	bgu	%xcc,	loop_436
	edge32n	%l5,	%i0,	%g3
loop_435:
	tn	%xcc,	0x1
	fandnot1	%f18,	%f28,	%f28
loop_436:
	fmovdn	%xcc,	%f21,	%f6
	fmovsge	%xcc,	%f18,	%f6
	edge16n	%o2,	%i2,	%l3
	tl	%xcc,	0x7
	movrgz	%g6,	%i4,	%o1
	tleu	%xcc,	0x2
	or	%g1,	0x1674,	%o7
	udivcc	%o6,	0x1D55,	%g5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	srl	%l4,	0x14,	%o5
	smul	%i7,	0x1BF5,	%o4
	bl,pt	%icc,	loop_437
	fmovsle	%icc,	%f30,	%f30
	movrgez	%g7,	%l0,	%g2
	std	%f2,	[%l7 + 0x60]
loop_437:
	sir	0x16F1
	fbu	%fcc3,	loop_438
	tne	%xcc,	0x5
	fxors	%f20,	%f19,	%f0
	taddcctv	%i5,	%o3,	%g4
loop_438:
	addc	%o0,	0x1026,	%l1
	fmovsgu	%icc,	%f26,	%f18
	fmovsneg	%xcc,	%f25,	%f10
	prefetch	[%l7 + 0x60],	 0x1
	fmovsg	%icc,	%f1,	%f3
	movrne	%i6,	%l2,	%i1
	movrlez	%i3,	0x087,	%i0
	taddcc	%l5,	%g3,	%i2
	fpack32	%f6,	%f8,	%f22
	taddcc	%o2,	%l3,	%g6
	ta	%xcc,	0x7
	edge8l	%o1,	%g1,	%i4
	xorcc	%o6,	0x1DDE,	%o7
	fmovdge	%icc,	%f18,	%f23
	sdivx	%l6,	0x106E,	%l4
	edge16ln	%o5,	%g5,	%i7
	move	%xcc,	%g7,	%l0
	fmovrslz	%g2,	%f25,	%f21
	edge16ln	%o4,	%o3,	%g4
	movl	%icc,	%o0,	%i5
	fnand	%f20,	%f30,	%f28
	movl	%icc,	%i6,	%l1
	edge8l	%i1,	%i3,	%l2
	fbue	%fcc2,	loop_439
	fbu,a	%fcc0,	loop_440
	taddcctv	%i0,	0x0ECD,	%l5
	fmovrdlez	%g3,	%f30,	%f26
loop_439:
	fpadd32	%f30,	%f28,	%f18
loop_440:
	nop
	wr	%g0,	0x2f,	%asi
	stba	%o2,	[%l7 + 0x4B] %asi
	membar	#Sync
	set	0x208, %i2
	ldxa	[%g0 + %i2] 0x52,	%i2
	subccc	%l3,	%g6,	%o1
	fble	%fcc1,	loop_441
	addcc	%i4,	%g1,	%o6
	tleu	%icc,	0x5
	ldsw	[%l7 + 0x0C],	%l6
loop_441:
	fsrc1s	%f21,	%f15
	tgu	%icc,	0x5
	fmuld8sux16	%f29,	%f1,	%f28
	umulcc	%o7,	0x0A58,	%o5
	fpack16	%f10,	%f24
	tpos	%xcc,	0x3
	tne	%icc,	0x5
	movcc	%icc,	%g5,	%l4
	ba,pn	%xcc,	loop_442
	movrgz	%g7,	%i7,	%g2
	fmuld8ulx16	%f16,	%f17,	%f26
	addc	%o4,	0x1866,	%l0
loop_442:
	movrgz	%g4,	%o3,	%o0
	bleu,a	loop_443
	edge32l	%i5,	%l1,	%i6
	sdiv	%i3,	0x0D44,	%i1
	andncc	%l2,	%l5,	%i0
loop_443:
	movrgez	%o2,	%i2,	%g3
	xorcc	%g6,	0x1187,	%l3
	fmovd	%f8,	%f6
	and	%o1,	0x15DF,	%g1
	bcs	%xcc,	loop_444
	edge8n	%i4,	%o6,	%o7
	xorcc	%o5,	0x0D95,	%g5
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x62] %asi,	%l4
loop_444:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%g7
	bg,a	loop_445
	movn	%icc,	%l6,	%g2
	and	%o4,	%i7,	%g4
	fands	%f24,	%f9,	%f29
loop_445:
	fmovsle	%icc,	%f7,	%f18
	movge	%xcc,	%o3,	%l0
	taddcc	%i5,	%o0,	%i6
	xnorcc	%i3,	0x1EA0,	%l1
	tgu	%xcc,	0x0
	fpsub16	%f8,	%f16,	%f26
	tvc	%xcc,	0x4
	orcc	%i1,	%l5,	%l2
	set	0x77, %g7
	stba	%i0,	[%l7 + %g7] 0x11
	bne,a,pn	%icc,	loop_446
	be	%icc,	loop_447
	popc	%i2,	%g3
	movre	%o2,	%g6,	%o1
loop_446:
	edge32	%l3,	%i4,	%o6
loop_447:
	edge16ln	%o7,	%g1,	%g5
	xor	%l4,	%o5,	%l6
	tvc	%xcc,	0x3
	popc	%g7,	%g2
	fmovsn	%icc,	%f15,	%f9
	tvc	%xcc,	0x7
	tn	%xcc,	0x7
	sub	%o4,	%g4,	%i7
	movrgz	%l0,	0x3DB,	%i5
	fmovrdne	%o3,	%f24,	%f4
	fmovdle	%icc,	%f3,	%f19
	movg	%icc,	%i6,	%i3
	tvc	%xcc,	0x1
	array8	%l1,	%o0,	%i1
	fbl,a	%fcc3,	loop_448
	smul	%l2,	%l5,	%i0
	movrlez	%g3,	%i2,	%g6
	movpos	%icc,	%o1,	%o2
loop_448:
	nop
	set	0x65, %i0
	lduba	[%l7 + %i0] 0x11,	%l3
	set	0x44, %l0
	lda	[%l7 + %l0] 0x19,	%f13
	fbul,a	%fcc2,	loop_449
	tgu	%icc,	0x6
	alignaddrl	%i4,	%o7,	%g1
	edge32ln	%o6,	%g5,	%o5
loop_449:
	swap	[%l7 + 0x50],	%l6
	movg	%xcc,	%l4,	%g2
	fcmpne16	%f30,	%f18,	%o4
	tgu	%icc,	0x2
	fcmps	%fcc1,	%f9,	%f29
	movne	%icc,	%g4,	%g7
	movvc	%icc,	%l0,	%i5
	tvs	%xcc,	0x1
	bgu	loop_450
	fexpand	%f8,	%f24
	add	%o3,	0x13F5,	%i6
	membar	0x4E
loop_450:
	addccc	%i7,	%l1,	%o0
	orncc	%i1,	0x1AD3,	%l2
	umul	%i3,	%i0,	%g3
	fpackfix	%f12,	%f18
	fbul,a	%fcc0,	loop_451
	tn	%xcc,	0x0
	movrlz	%l5,	0x364,	%g6
	bleu	%xcc,	loop_452
loop_451:
	fbe,a	%fcc1,	loop_453
	fmovrdlz	%i2,	%f2,	%f24
	fmul8x16al	%f8,	%f25,	%f4
loop_452:
	fmovsa	%xcc,	%f28,	%f12
loop_453:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o2,	%o1
	fmovda	%icc,	%f1,	%f25
	tpos	%xcc,	0x1
	ldd	[%l7 + 0x58],	%f18
	subcc	%l3,	%i4,	%g1
	mulx	%o6,	%o7,	%o5
	bge,a	loop_454
	sdivcc	%l6,	0x0696,	%g5
	set	0x12, %l4
	ldstuba	[%l7 + %l4] 0x18,	%g2
loop_454:
	umulcc	%l4,	0x00A6,	%o4
	popc	%g7,	%l0
	tcc	%xcc,	0x2
	fxor	%f26,	%f10,	%f24
	nop
	setx	loop_455,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpadd32	%f18,	%f24,	%f30
	ble	loop_456
	bgu,a,pn	%xcc,	loop_457
loop_455:
	tsubcctv	%g4,	%i5,	%i6
	nop
	set	0x60, %g6
	ldsh	[%l7 + %g6],	%o3
loop_456:
	tgu	%xcc,	0x4
loop_457:
	fmovrdne	%l1,	%f2,	%f12
	andn	%i7,	0x12B8,	%i1
	array32	%l2,	%o0,	%i0
	bvc,pt	%xcc,	loop_458
	bg	loop_459
	sdiv	%i3,	0x0A54,	%g3
	udivcc	%g6,	0x0DF3,	%i2
loop_458:
	sra	%o2,	0x17,	%o1
loop_459:
	edge8n	%l3,	%i4,	%g1
	sir	0x1522
	movrne	%o6,	0x148,	%l5
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x63] %asi,	%o5
	fpack16	%f22,	%f6
	sub	%o7,	0x087F,	%l6
	movleu	%xcc,	%g2,	%g5
	te	%xcc,	0x5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%g7
	fandnot1s	%f17,	%f20,	%f18
	fones	%f11
	array16	%l4,	%l0,	%i5
	mulscc	%g4,	0x1772,	%o3
	movrne	%i6,	%i7,	%l1
	tneg	%xcc,	0x5
	tne	%icc,	0x2
	srax	%i1,	0x16,	%l2
	fbu	%fcc0,	loop_460
	edge8	%i0,	%i3,	%o0
	edge32ln	%g3,	%g6,	%o2
	edge8n	%o1,	%l3,	%i2
loop_460:
	fornot2s	%f12,	%f11,	%f5
	edge16l	%i4,	%g1,	%l5
	fmovdl	%xcc,	%f30,	%f23
	fmovdcc	%xcc,	%f21,	%f9
	tl	%xcc,	0x7
	sdivx	%o5,	0x0C44,	%o6
	tge	%xcc,	0x6
	tgu	%icc,	0x2
	bcc	loop_461
	te	%xcc,	0x7
	tle	%icc,	0x7
	movleu	%icc,	%l6,	%o7
loop_461:
	movleu	%icc,	%g5,	%g2
	fmovdpos	%xcc,	%f8,	%f15
	edge8ln	%g7,	%o4,	%l4
	orn	%i5,	%g4,	%o3
	movrgz	%i6,	%i7,	%l1
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x0F] %asi,	%l0
	taddcctv	%l2,	0x1703,	%i1
	fmovde	%xcc,	%f2,	%f17
	add	%i0,	%o0,	%i3
	set	0x53, %i6
	lduba	[%l7 + %i6] 0x88,	%g6
	movn	%icc,	%o2,	%g3
	subcc	%o1,	%i2,	%i4
	array8	%g1,	%l5,	%l3
	fnands	%f28,	%f23,	%f7
	edge8l	%o5,	%o6,	%l6
	fexpand	%f1,	%f0
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x3C] %asi,	%g5
	sra	%o7,	0x02,	%g7
	stb	%g2,	[%l7 + 0x2A]
	nop
	setx	loop_462,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tl	%icc,	0x3
	edge16n	%l4,	%o4,	%i5
	te	%icc,	0x4
loop_462:
	fcmpne16	%f26,	%f28,	%g4
	bn,a	loop_463
	sra	%i6,	%i7,	%l1
	movrgez	%o3,	%l0,	%l2
	wr	%g0,	0x88,	%asi
	sta	%f29,	[%l7 + 0x7C] %asi
loop_463:
	fmovrslz	%i1,	%f16,	%f7
	tn	%xcc,	0x5
	mulscc	%o0,	%i0,	%i3
	movne	%xcc,	%g6,	%g3
	edge8n	%o2,	%i2,	%o1
	srl	%i4,	%g1,	%l3
	tneg	%icc,	0x7
	smulcc	%l5,	%o6,	%l6
	movrne	%g5,	0x19A,	%o5
	fandnot2	%f28,	%f4,	%f20
	ldd	[%l7 + 0x08],	%o6
	bgu,pn	%icc,	loop_464
	fmovsgu	%icc,	%f4,	%f20
	edge32	%g7,	%l4,	%g2
	sdivx	%o4,	0x06AE,	%g4
loop_464:
	udivx	%i6,	0x146A,	%i7
	orncc	%i5,	%l1,	%o3
	fpadd16s	%f7,	%f4,	%f6
	move	%xcc,	%l0,	%l2
	fbe,a	%fcc1,	loop_465
	taddcctv	%i1,	%i0,	%i3
	stx	%g6,	[%l7 + 0x28]
	tsubcc	%g3,	%o0,	%o2
loop_465:
	fmovrsne	%o1,	%f29,	%f20
	nop
	set	0x7F, %o0
	ldub	[%l7 + %o0],	%i2
	fbue	%fcc1,	loop_466
	call	loop_467
	edge16ln	%g1,	%l3,	%l5
	edge8l	%o6,	%i4,	%l6
loop_466:
	udivcc	%g5,	0x0850,	%o5
loop_467:
	fmovrdlz	%g7,	%f22,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f20,	%f20,	%f10
	flush	%l7 + 0x54
	addccc	%l4,	0x0192,	%o7
	brlez,a	%g2,	loop_468
	fxnor	%f8,	%f18,	%f16
	fmovde	%xcc,	%f28,	%f14
	wr	%g0,	0x0c,	%asi
	stwa	%g4,	[%l7 + 0x40] %asi
loop_468:
	sdiv	%i6,	0x00E7,	%i7
	for	%f16,	%f6,	%f2
	tg	%xcc,	0x6
	bvc,a,pt	%icc,	loop_469
	std	%o4,	[%l7 + 0x68]
	set	0x18, %o2
	stxa	%l1,	[%l7 + %o2] 0x11
loop_469:
	edge16ln	%i5,	%l0,	%o3
	sllx	%i1,	%l2,	%i0
	nop
	set	0x48, %o5
	stx	%i3,	[%l7 + %o5]
	fmovsl	%xcc,	%f0,	%f12
	orn	%g3,	%g6,	%o0
	fnot1s	%f19,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f11,	%f16,	%f2
	array32	%o1,	%i2,	%g1
	udivcc	%o2,	0x1DCC,	%l3
	movre	%o6,	%l5,	%i4
	tle	%xcc,	0x5
	xnorcc	%g5,	0x1F9E,	%o5
	fmul8x16al	%f26,	%f11,	%f12
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x10] %asi,	%i6
	fbn,a	%fcc1,	loop_470
	subcc	%l4,	0x0288,	%o7
	fnot2s	%f7,	%f16
	movcc	%xcc,	%g2,	%g7
loop_470:
	mulscc	%i6,	0x15D1,	%g4
	tsubcctv	%i7,	%l1,	%i5
	fblg	%fcc0,	loop_471
	edge32n	%l0,	%o3,	%i1
	mulscc	%o4,	0x095C,	%l2
	smul	%i3,	%i0,	%g6
loop_471:
	bn,a,pn	%xcc,	loop_472
	fornot2	%f18,	%f18,	%f20
	tvs	%xcc,	0x6
	fmovdcc	%xcc,	%f3,	%f24
loop_472:
	tgu	%icc,	0x3
	bne,a	loop_473
	movleu	%icc,	%o0,	%g3
	edge16ln	%i2,	%o1,	%o2
	edge16	%g1,	%l3,	%l5
loop_473:
	srlx	%o6,	0x1F,	%i4
	fcmpeq32	%f12,	%f8,	%g5
	ldsh	[%l7 + 0x2E],	%l6
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x16,	%f0
	edge8ln	%o5,	%l4,	%o7
	movre	%g2,	0x2D8,	%i6
	tneg	%xcc,	0x6
	andcc	%g7,	0x1F57,	%g4
	edge16ln	%l1,	%i7,	%l0
	fmovdg	%xcc,	%f23,	%f15
	subc	%o3,	%i5,	%o4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%i1
	movre	%i0,	%g6,	%i3
	fbn,a	%fcc0,	loop_474
	add	%o0,	%i2,	%g3
	fmovsne	%xcc,	%f30,	%f6
	edge8n	%o2,	%g1,	%l3
loop_474:
	tleu	%icc,	0x5
	fandnot1	%f14,	%f16,	%f4
	umul	%l5,	%o6,	%o1
	movneg	%icc,	%i4,	%g5
	fmovdleu	%xcc,	%f16,	%f5
	fpsub32	%f6,	%f14,	%f2
	fbul	%fcc1,	loop_475
	edge32ln	%o5,	%l4,	%o7
	smul	%l6,	%g2,	%i6
	tvs	%icc,	0x2
loop_475:
	srl	%g7,	%l1,	%g4
	movgu	%icc,	%l0,	%o3
	fmovdcc	%xcc,	%f6,	%f19
	xor	%i5,	%o4,	%i7
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x14,	 0x2
	or	%i0,	0x0BF7,	%g6
	movgu	%xcc,	%i3,	%i1
	bleu	loop_476
	xor	%i2,	%g3,	%o2
	sdivcc	%g1,	0x0076,	%l3
	movne	%xcc,	%l5,	%o0
loop_476:
	andcc	%o1,	0x10BA,	%o6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%o5
	array32	%l4,	%i4,	%o7
	bge,pt	%icc,	loop_477
	subccc	%g2,	%i6,	%l6
	fmovse	%icc,	%f16,	%f11
	mulx	%l1,	%g7,	%l0
loop_477:
	sdivx	%g4,	0x15AB,	%i5
	udiv	%o3,	0x0D65,	%i7
	fsrc1s	%f25,	%f9
	ldub	[%l7 + 0x2B],	%l2
	fone	%f10
	edge32n	%o4,	%g6,	%i3
	swap	[%l7 + 0x40],	%i0
	brlz	%i1,	loop_478
	movge	%xcc,	%g3,	%i2
	fandnot1s	%f14,	%f23,	%f20
	edge16l	%g1,	%o2,	%l5
loop_478:
	fornot2	%f28,	%f20,	%f30
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xe2,	%l2
	orcc	%o1,	0x1901,	%o0
	addcc	%g5,	0x0A28,	%o5
	tsubcc	%o6,	0x1B96,	%i4
	movcs	%icc,	%l4,	%o7
	movrlez	%g2,	0x2C8,	%i6
	sir	0x08FA
	tvc	%xcc,	0x7
	stx	%l1,	[%l7 + 0x68]
	bn,a,pn	%xcc,	loop_479
	fbul	%fcc1,	loop_480
	srlx	%l6,	%g7,	%g4
	set	0x18, %i5
	stxa	%i5,	[%l7 + %i5] 0x23
	membar	#Sync
loop_479:
	ta	%xcc,	0x0
loop_480:
	tsubcc	%l0,	0x0DA9,	%i7
	andcc	%l2,	0x1CB8,	%o3
	alignaddrl	%o4,	%g6,	%i3
	tvc	%xcc,	0x7
	umulcc	%i0,	%g3,	%i1
	fbe	%fcc0,	loop_481
	ldd	[%l7 + 0x08],	%g0
	movgu	%icc,	%o2,	%i2
	fbue	%fcc2,	loop_482
loop_481:
	movne	%icc,	%l5,	%l3
	mulscc	%o0,	%o1,	%g5
	movrne	%o6,	0x22B,	%i4
loop_482:
	fmovrdgz	%o5,	%f26,	%f0
	xorcc	%o7,	0x10FD,	%g2
	movvs	%xcc,	%l4,	%l1
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x40] %asi,	%i6
	nop
	setx	loop_483,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addcc	%l6,	%g7,	%i5
	add	%l0,	0x16BA,	%g4
	st	%f13,	[%l7 + 0x68]
loop_483:
	nop
	set	0x68, %i1
	ldsha	[%l7 + %i1] 0x0c,	%l2
	fmovrsne	%o3,	%f7,	%f10
	fpack16	%f22,	%f22
	fbule	%fcc3,	loop_484
	fmovrsne	%i7,	%f31,	%f17
	bvs,pn	%icc,	loop_485
	fbl,a	%fcc0,	loop_486
loop_484:
	movge	%xcc,	%o4,	%i3
	fmovsl	%xcc,	%f29,	%f14
loop_485:
	xnorcc	%g6,	0x0539,	%g3
loop_486:
	fblg,a	%fcc2,	loop_487
	call	loop_488
	nop
	set	0x19, %g3
	ldsb	[%l7 + %g3],	%i0
	te	%xcc,	0x4
loop_487:
	movl	%xcc,	%i1,	%o2
loop_488:
	array8	%g1,	%l5,	%l3
	srax	%o0,	0x03,	%i2
	srax	%o1,	0x16,	%g5
	tn	%xcc,	0x1
	mulx	%o6,	%i4,	%o7
	movrgez	%o5,	%g2,	%l1
	taddcc	%l4,	%i6,	%l6
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%i5
	stb	%g7,	[%l7 + 0x42]
	fcmple16	%f12,	%f0,	%g4
	edge8ln	%l2,	%o3,	%i7
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x70] %asi,	%o4
	tg	%icc,	0x3
	add	%l0,	0x1A02,	%g6
	set	0x1A, %i3
	stha	%i3,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x40, %l6
	swapa	[%l7 + %l6] 0x04,	%i0
	andcc	%i1,	0x15CA,	%o2
	udivx	%g1,	0x1064,	%l5
	fcmple32	%f20,	%f24,	%l3
	tsubcctv	%o0,	%g3,	%o1
	prefetch	[%l7 + 0x70],	 0x0
	tge	%xcc,	0x0
	sdivx	%i2,	0x06CA,	%o6
	edge32n	%g5,	%i4,	%o5
	mulscc	%o7,	%g2,	%l1
	sethi	0x1145,	%i6
	set	0x6C, %g5
	stwa	%l4,	[%l7 + %g5] 0x15
	fnegd	%f0,	%f18
	sethi	0x0682,	%l6
	fmul8x16	%f8,	%f24,	%f6
	fmovdvs	%icc,	%f19,	%f1
	udiv	%g7,	0x1177,	%i5
	tvc	%icc,	0x7
	fmovdle	%icc,	%f23,	%f12
	movneg	%xcc,	%g4,	%o3
	fmovrslez	%l2,	%f25,	%f13
	ld	[%l7 + 0x10],	%f22
	bl,a	%icc,	loop_489
	movne	%xcc,	%i7,	%o4
	edge16l	%g6,	%i3,	%l0
	movn	%icc,	%i1,	%o2
loop_489:
	fbl,a	%fcc3,	loop_490
	movpos	%xcc,	%g1,	%i0
	bg,pn	%icc,	loop_491
	edge8l	%l3,	%l5,	%o0
loop_490:
	edge8	%o1,	%g3,	%o6
	edge16	%g5,	%i4,	%o5
loop_491:
	edge16n	%o7,	%g2,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x7
	wr	%g0,	0x19,	%asi
	sta	%f31,	[%l7 + 0x5C] %asi
	bn,a,pt	%xcc,	loop_492
	tgu	%xcc,	0x6
	xnorcc	%i6,	0x065E,	%l4
	edge16	%l6,	%g7,	%l1
loop_492:
	fbue	%fcc3,	loop_493
	tl	%xcc,	0x4
	or	%g4,	%o3,	%l2
	subccc	%i7,	%o4,	%g6
loop_493:
	addccc	%i3,	%i5,	%i1
	wr	%g0,	0x11,	%asi
	stda	%o2,	[%l7 + 0x50] %asi
	ba,pn	%icc,	loop_494
	fbul	%fcc1,	loop_495
	movge	%xcc,	%g1,	%i0
	fcmpd	%fcc3,	%f0,	%f22
loop_494:
	addc	%l3,	0x02BB,	%l5
loop_495:
	fmovdvc	%xcc,	%f28,	%f4
	movcs	%xcc,	%o0,	%o1
	udivx	%l0,	0x1CED,	%g3
	brgez,a	%g5,	loop_496
	fbge	%fcc1,	loop_497
	edge8n	%o6,	%o5,	%i4
	movge	%icc,	%g2,	%i2
loop_496:
	bvs,pt	%xcc,	loop_498
loop_497:
	movge	%icc,	%o7,	%l4
	taddcctv	%l6,	0x1D7C,	%g7
	fbu	%fcc2,	loop_499
loop_498:
	fmul8x16au	%f15,	%f28,	%f16
	alignaddr	%l1,	%i6,	%o3
	movvs	%xcc,	%g4,	%i7
loop_499:
	fors	%f21,	%f28,	%f15
	umulcc	%o4,	0x0E33,	%g6
	smul	%l2,	0x0AAC,	%i5
	movcc	%icc,	%i1,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o2,	%i0,	%g1
	bcs	%xcc,	loop_500
	fnor	%f26,	%f18,	%f18
	fmul8x16	%f16,	%f24,	%f26
	call	loop_501
loop_500:
	ba,pn	%xcc,	loop_502
	fmul8sux16	%f0,	%f14,	%f18
	fmovscc	%xcc,	%f4,	%f12
loop_501:
	movl	%icc,	%l3,	%l5
loop_502:
	fmovdneg	%icc,	%f0,	%f12
	fmovdgu	%icc,	%f5,	%f18
	sdiv	%o1,	0x0140,	%o0
	fmovscs	%xcc,	%f13,	%f11
	sir	0x13EA
	movneg	%icc,	%g3,	%l0
	tpos	%xcc,	0x1
	fpackfix	%f26,	%f25
	tvs	%xcc,	0x1
	movrne	%o6,	0x086,	%o5
	te	%xcc,	0x0
	andn	%g5,	%g2,	%i2
	edge16	%i4,	%o7,	%l6
	fmovrde	%l4,	%f24,	%f30
	fmovsvs	%xcc,	%f3,	%f19
	addccc	%g7,	0x1A7C,	%l1
	edge32l	%i6,	%g4,	%o3
	fmovsg	%xcc,	%f29,	%f2
	movrlz	%i7,	0x170,	%o4
	xnorcc	%l2,	0x1399,	%g6
	tle	%icc,	0x1
	movge	%xcc,	%i5,	%i3
	fnor	%f14,	%f0,	%f0
	fxor	%f2,	%f18,	%f14
	movre	%o2,	0x003,	%i1
	bg,a	%xcc,	loop_503
	siam	0x4
	srlx	%g1,	0x14,	%i0
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2E] %asi,	%l5
loop_503:
	nop
	set	0x29, %o3
	ldsba	[%l7 + %o3] 0x15,	%o1
	fmovdcc	%icc,	%f27,	%f6
	fmul8sux16	%f18,	%f4,	%f28
	array32	%o0,	%l3,	%g3
	swap	[%l7 + 0x1C],	%o6
	fmovsg	%icc,	%f18,	%f31
	fsrc1	%f14,	%f12
	edge16ln	%l0,	%o5,	%g2
	tsubcctv	%i2,	%i4,	%o7
	edge32ln	%g5,	%l6,	%g7
	st	%f15,	[%l7 + 0x54]
	xnorcc	%l1,	0x1BB2,	%i6
	xor	%g4,	0x0F84,	%l4
	tl	%icc,	0x2
	mova	%icc,	%i7,	%o4
	movleu	%xcc,	%o3,	%g6
	movl	%xcc,	%i5,	%l2
	addcc	%o2,	0x037C,	%i3
	fbl,a	%fcc3,	loop_504
	movge	%icc,	%i1,	%g1
	bneg,a,pt	%xcc,	loop_505
	udivx	%l5,	0x0B8B,	%o1
loop_504:
	fmovdvs	%icc,	%f29,	%f15
	sll	%i0,	0x10,	%l3
loop_505:
	edge16n	%g3,	%o0,	%o6
	nop
	setx	loop_506,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvs	%xcc,	0x2
	bgu	loop_507
	fmovrslez	%l0,	%f6,	%f8
loop_506:
	fornot2	%f12,	%f22,	%f30
	subc	%g2,	0x09AA,	%o5
loop_507:
	orn	%i2,	0x1D09,	%o7
	movvs	%icc,	%i4,	%l6
	edge16	%g5,	%g7,	%l1
	alignaddr	%g4,	%l4,	%i7
	orncc	%i6,	%o4,	%o3
	sdiv	%i5,	0x0414,	%l2
	fcmpeq32	%f16,	%f20,	%o2
	srl	%g6,	0x18,	%i1
	set	0x65, %l3
	ldstuba	[%l7 + %l3] 0x0c,	%i3
	fsrc1	%f4,	%f28
	edge32ln	%l5,	%g1,	%i0
	addc	%o1,	0x1D4A,	%l3
	udivcc	%g3,	0x037A,	%o0
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x74] %asi,	%l0
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x81,	%o6
	addc	%g2,	%o5,	%o7
	flush	%l7 + 0x30
	orcc	%i2,	%i4,	%g5
	srl	%l6,	0x1B,	%g7
	movre	%l1,	%l4,	%i7
	taddcc	%g4,	%o4,	%o3
	edge16l	%i6,	%i5,	%o2
	sdiv	%l2,	0x0AB2,	%g6
	fcmpeq32	%f28,	%f2,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc1,	loop_508
	fble	%fcc3,	loop_509
	stb	%l5,	[%l7 + 0x7C]
	nop
	setx loop_510, %l0, %l1
	jmpl %l1, %i3
loop_508:
	fsrc1	%f2,	%f28
loop_509:
	movcc	%icc,	%g1,	%i0
	movrlz	%l3,	0x2EB,	%g3
loop_510:
	nop
	setx	loop_511,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16	%o1,	%o0,	%o6
	movrgez	%g2,	0x3F6,	%o5
	bshuffle	%f0,	%f22,	%f2
loop_511:
	lduh	[%l7 + 0x40],	%o7
	tpos	%xcc,	0x4
	bvs	%icc,	loop_512
	bg,pn	%xcc,	loop_513
	fmul8x16al	%f13,	%f18,	%f18
	tpos	%icc,	0x7
loop_512:
	fbg	%fcc3,	loop_514
loop_513:
	edge16n	%l0,	%i4,	%g5
	movrgz	%i2,	0x021,	%g7
	sra	%l1,	0x05,	%l4
loop_514:
	movl	%icc,	%l6,	%g4
	fcmpgt32	%f10,	%f30,	%o4
	tgu	%icc,	0x6
	fbule,a	%fcc1,	loop_515
	xor	%o3,	0x1AA2,	%i6
	movrlz	%i5,	%o2,	%i7
	bn,a	%xcc,	loop_516
loop_515:
	ble,a	%xcc,	loop_517
	membar	0x46
	fbe,a	%fcc0,	loop_518
loop_516:
	popc	0x0B0D,	%l2
loop_517:
	fpadd32	%f26,	%f26,	%f16
	srlx	%i1,	0x19,	%g6
loop_518:
	sdivcc	%l5,	0x045C,	%g1
	fcmped	%fcc1,	%f8,	%f0
	fcmpeq16	%f14,	%f20,	%i3
	bge,pt	%xcc,	loop_519
	fbug,a	%fcc3,	loop_520
	smul	%i0,	%g3,	%o1
	set	0x40, %o6
	ldsba	[%l7 + %o6] 0x18,	%l3
loop_519:
	fpsub16	%f12,	%f16,	%f28
loop_520:
	fzero	%f0
	ldd	[%l7 + 0x30],	%o6
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f2
	orncc	%o0,	0x1F4C,	%o5
	edge8n	%g2,	%o7,	%i4
	tvc	%icc,	0x0
	srlx	%l0,	0x0B,	%g5
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
	array8	%l1,	%l4,	%g7
	tcs	%icc,	0x6
	set	0x60, %l2
	stwa	%l6,	[%l7 + %l2] 0x2f
	membar	#Sync
	and	%o4,	%o3,	%i6
	movre	%g4,	%o2,	%i7
	fbne,a	%fcc3,	loop_521
	fabsd	%f26,	%f0
	fbug	%fcc0,	loop_522
	edge8n	%i5,	%l2,	%i1
loop_521:
	nop
	wr	%g0,	0x22,	%asi
	stxa	%l5,	[%l7 + 0x10] %asi
	membar	#Sync
loop_522:
	nop
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x38] %asi,	%g1
	srlx	%g6,	0x07,	%i0
	set	0x4B, %o4
	stba	%i3,	[%l7 + %o4] 0x15
	std	%f26,	[%l7 + 0x38]
	tsubcc	%g3,	%l3,	%o6
	fmul8sux16	%f18,	%f10,	%f10
	movl	%icc,	%o0,	%o5
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o1
	andn	%o7,	0x0BCB,	%i4
	movge	%icc,	%l0,	%g2
	membar	0x61
	sub	%g5,	%i2,	%l1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l4,	%g7
	fexpand	%f4,	%f14
	edge32	%l6,	%o4,	%o3
	umul	%g4,	0x10DF,	%o2
	and	%i7,	0x1FAD,	%i5
	fpadd32s	%f31,	%f8,	%f16
	wr	%g0,	0x80,	%asi
	sta	%f17,	[%l7 + 0x28] %asi
	sth	%i6,	[%l7 + 0x0E]
	stbar
	fnegd	%f4,	%f12
	fandnot2s	%f26,	%f9,	%f9
	fcmpne16	%f20,	%f20,	%l2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x3C] %asi,	%l5
	nop
	setx	loop_523,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%i1,	%g1
	movcs	%xcc,	%i0,	%g6
	tg	%xcc,	0x4
loop_523:
	nop
	set	0x08, %l1
	std	%f0,	[%l7 + %l1]
	movrlez	%i3,	%l3,	%o6
	addcc	%o0,	0x0B53,	%g3
	movrlz	%o1,	%o7,	%o5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x14] %asi,	%l0
	tvs	%icc,	0x5
	fmuld8sux16	%f1,	%f10,	%f20
	smul	%g2,	0x1C8D,	%i4
	srax	%i2,	0x1C,	%g5
	fpadd16s	%f25,	%f25,	%f19
	fandnot2	%f24,	%f2,	%f18
	movrgz	%l4,	0x32A,	%l1
	bn,a	%xcc,	loop_524
	addcc	%g7,	0x1FEC,	%o4
	tcc	%xcc,	0x0
	set	0x65, %l5
	stba	%o3,	[%l7 + %l5] 0x22
	membar	#Sync
loop_524:
	fcmple16	%f6,	%f0,	%l6
	brgez,a	%g4,	loop_525
	srlx	%o2,	%i5,	%i6
	bvs,a,pn	%icc,	loop_526
	movn	%icc,	%i7,	%l2
loop_525:
	nop
	setx	loop_527,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlz,a	%i1,	loop_528
loop_526:
	movrlez	%g1,	%l5,	%i0
	movrgez	%g6,	0x2C1,	%l3
loop_527:
	nop
	set	0x28, %g4
	prefetcha	[%l7 + %g4] 0x14,	 0x3
loop_528:
	movge	%icc,	%o0,	%g3
	brlz,a	%o6,	loop_529
	xorcc	%o7,	0x0233,	%o5
	tleu	%xcc,	0x2
	fabss	%f28,	%f6
loop_529:
	srax	%o1,	0x08,	%g2
	movvc	%xcc,	%i4,	%l0
	tneg	%xcc,	0x4
	fabss	%f30,	%f0
	movl	%icc,	%g5,	%l4
	xnor	%i2,	%l1,	%g7
	tneg	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x3A],	%o3
	fbue,a	%fcc0,	loop_530
	taddcctv	%l6,	0x16BA,	%o4
	xorcc	%o2,	0x0DD2,	%g4
	fcmpeq16	%f26,	%f22,	%i5
loop_530:
	movrne	%i7,	0x280,	%i6
	fnot2s	%f17,	%f19
	fxor	%f6,	%f4,	%f20
	tleu	%icc,	0x5
	tsubcctv	%i1,	%g1,	%l2
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x5A] %asi,	%i0
	xnorcc	%l5,	%g6,	%i3
	umulcc	%o0,	0x1E3A,	%l3
	tcs	%xcc,	0x4
	fbe	%fcc0,	loop_531
	movre	%g3,	%o7,	%o6
	andcc	%o5,	0x0814,	%o1
	srlx	%i4,	0x08,	%g2
loop_531:
	sll	%l0,	%g5,	%l4
	movneg	%icc,	%i2,	%l1
	popc	0x0C23,	%o3
	movge	%xcc,	%g7,	%l6
	fcmple16	%f30,	%f22,	%o2
	srax	%g4,	0x09,	%i5
	fabss	%f12,	%f27
	movgu	%icc,	%i7,	%i6
	movrgz	%o4,	%i1,	%g1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i0,	%l2
	add	%l5,	0x07AE,	%i3
	movre	%g6,	%o0,	%g3
	fmovda	%xcc,	%f26,	%f31
	fcmpne16	%f0,	%f10,	%o7
	tn	%icc,	0x7
	ldsb	[%l7 + 0x3E],	%l3
	fbe	%fcc3,	loop_532
	srlx	%o5,	0x15,	%o1
	brgz	%i4,	loop_533
	umulcc	%o6,	%l0,	%g2
loop_532:
	edge8ln	%g5,	%i2,	%l1
	tvs	%icc,	0x0
loop_533:
	fzeros	%f12
	movn	%icc,	%o3,	%l4
	movvs	%xcc,	%g7,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,pt	%icc,	loop_534
	st	%f6,	[%l7 + 0x2C]
	movg	%icc,	%g4,	%i5
	wr	%g0,	0x11,	%asi
	stha	%i7,	[%l7 + 0x08] %asi
loop_534:
	srlx	%i6,	%o4,	%i1
	sdivcc	%g1,	0x17C7,	%i0
	fxor	%f10,	%f2,	%f12
	movvs	%icc,	%l6,	%l5
	edge32ln	%i3,	%l2,	%o0
	st	%f28,	[%l7 + 0x28]
	fexpand	%f8,	%f12
	movvc	%icc,	%g6,	%g3
	edge16n	%l3,	%o5,	%o1
	tvs	%xcc,	0x3
	smul	%i4,	%o7,	%o6
	fone	%f14
	nop
	setx	loop_535,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orcc	%l0,	0x1FB4,	%g2
	tvs	%xcc,	0x0
	fnot2s	%f24,	%f31
loop_535:
	fmovdg	%icc,	%f31,	%f0
	umul	%i2,	%g5,	%o3
	fmovdvs	%icc,	%f24,	%f8
	or	%l1,	%l4,	%g7
	sll	%g4,	0x04,	%o2
	swap	[%l7 + 0x78],	%i5
	smul	%i7,	0x1E55,	%i6
	fblg	%fcc2,	loop_536
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,a,pt	%xcc,	loop_537
	fcmpne16	%f26,	%f24,	%o4
loop_536:
	tn	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_537:
	and	%g1,	0x0521,	%i0
	sir	0x1B1B
	xorcc	%l6,	%l5,	%i3
	xnor	%i1,	%o0,	%l2
	movvs	%icc,	%g6,	%l3
	fbule	%fcc0,	loop_538
	bg	%xcc,	loop_539
	srl	%g3,	%o5,	%i4
	fpadd32s	%f4,	%f12,	%f6
loop_538:
	mulx	%o1,	0x05FF,	%o6
loop_539:
	andcc	%o7,	0x1B1D,	%l0
	fnot2	%f28,	%f24
	movpos	%icc,	%i2,	%g5
	fmovrde	%o3,	%f18,	%f2
	addcc	%g2,	%l4,	%g7
	set	0x08, %o7
	stxa	%l1,	[%l7 + %o7] 0x0c
	movcc	%icc,	%o2,	%g4
	fmovdn	%icc,	%f12,	%f18
	fnot1s	%f29,	%f6
	sra	%i7,	%i5,	%o4
	fmovsg	%icc,	%f25,	%f11
	tl	%xcc,	0x7
	subccc	%i6,	0x0D6E,	%i0
	ldsw	[%l7 + 0x74],	%l6
	fnegd	%f30,	%f20
	movre	%g1,	0x022,	%i3
	ldub	[%l7 + 0x44],	%l5
	wr	%g0,	0x81,	%asi
	stwa	%i1,	[%l7 + 0x70] %asi
	fbu	%fcc1,	loop_540
	fbne	%fcc3,	loop_541
	nop
	set	0x74, %i2
	prefetch	[%l7 + %i2],	 0x1
	subc	%l2,	0x13D8,	%g6
loop_540:
	fcmps	%fcc0,	%f3,	%f16
loop_541:
	bcs,a	%xcc,	loop_542
	umul	%l3,	%g3,	%o0
	taddcc	%o5,	%o1,	%i4
	bvc,a,pn	%xcc,	loop_543
loop_542:
	fmul8x16	%f24,	%f0,	%f12
	or	%o7,	%l0,	%o6
	fmovrse	%i2,	%f16,	%f0
loop_543:
	tsubcctv	%g5,	0x09E9,	%o3
	nop
	setx	loop_544,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bgu	%icc,	loop_545
	bne,a	loop_546
	movgu	%icc,	%l4,	%g7
loop_544:
	fmovsl	%xcc,	%f6,	%f15
loop_545:
	andcc	%l1,	0x064C,	%o2
loop_546:
	popc	%g4,	%g2
	sethi	0x0BC4,	%i7
	addc	%o4,	%i5,	%i0
	tleu	%icc,	0x6
	smulcc	%i6,	0x08BE,	%l6
	edge32n	%i3,	%g1,	%l5
	smul	%l2,	%i1,	%l3
	fpadd16	%f12,	%f16,	%f28
	tsubcc	%g3,	%o0,	%g6
	be,a,pn	%xcc,	loop_547
	udivcc	%o1,	0x1963,	%i4
	for	%f8,	%f6,	%f28
	mova	%icc,	%o5,	%l0
loop_547:
	umul	%o6,	0x048F,	%o7
	fpsub16s	%f11,	%f0,	%f17
	bn,a,pn	%xcc,	loop_548
	sra	%g5,	0x12,	%i2
	mova	%xcc,	%l4,	%o3
	array32	%l1,	%o2,	%g7
loop_548:
	xorcc	%g2,	0x184A,	%g4
	andncc	%i7,	%i5,	%o4
	srlx	%i0,	%l6,	%i6
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x35] %asi,	%i3
	set	0x44, %i0
	lda	[%l7 + %i0] 0x89,	%f30
	edge16n	%g1,	%l2,	%i1
	sir	0x1792
	tn	%icc,	0x5
	udivcc	%l5,	0x042E,	%l3
	xorcc	%o0,	0x11FC,	%g3
	stbar
	ldstub	[%l7 + 0x18],	%o1
	set	0x20, %l0
	ldsha	[%l7 + %l0] 0x15,	%g6
	fbo	%fcc3,	loop_549
	srlx	%o5,	0x08,	%l0
	fmovsle	%xcc,	%f7,	%f14
	movn	%xcc,	%i4,	%o6
loop_549:
	tl	%icc,	0x3
	fmovde	%xcc,	%f10,	%f21
	movrgez	%g5,	%i2,	%o7
	fmovdne	%xcc,	%f22,	%f9
	fbe	%fcc2,	loop_550
	andn	%l4,	0x17FF,	%l1
	orcc	%o2,	%o3,	%g2
	set	0x78, %l4
	stha	%g7,	[%l7 + %l4] 0x27
	membar	#Sync
loop_550:
	tvc	%icc,	0x6
	bcc	%xcc,	loop_551
	tne	%icc,	0x3
	smul	%g4,	%i7,	%o4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x2E] %asi,	%i0
loop_551:
	siam	0x4
	fble,a	%fcc1,	loop_552
	fcmpeq32	%f24,	%f8,	%i5
	set	0x20, %g7
	ldswa	[%l7 + %g7] 0x81,	%i6
loop_552:
	fmovsvs	%icc,	%f29,	%f15
	movvs	%icc,	%l6,	%i3
	tvc	%xcc,	0x0
	orcc	%g1,	0x001E,	%l2
	fandnot1s	%f8,	%f16,	%f9
	stx	%i1,	[%l7 + 0x28]
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x64] %asi,	%l3
	fmovdleu	%xcc,	%f3,	%f30
	tgu	%xcc,	0x6
	mova	%icc,	%l5,	%g3
	sir	0x1748
	tvs	%xcc,	0x0
	subcc	%o1,	0x1028,	%o0
	movrlz	%o5,	0x0EF,	%g6
	ldstub	[%l7 + 0x3A],	%i4
	movle	%icc,	%o6,	%l0
	movrgz	%g5,	0x277,	%o7
	movg	%icc,	%l4,	%i2
	andcc	%o2,	%l1,	%o3
	movg	%icc,	%g2,	%g7
	nop
	setx loop_553, %l0, %l1
	jmpl %l1, %g4
	fornot2	%f10,	%f30,	%f24
	movcs	%xcc,	%i7,	%o4
	fmovdvs	%icc,	%f20,	%f24
loop_553:
	nop
	set	0x0C, %g6
	sta	%f16,	[%l7 + %g6] 0x0c
	brz	%i5,	loop_554
	fnors	%f17,	%f9,	%f30
	sethi	0x08B6,	%i0
	prefetch	[%l7 + 0x20],	 0x3
loop_554:
	fmovrsgez	%i6,	%f22,	%f21
	set	0x60, %i6
	ldsha	[%l7 + %i6] 0x11,	%i3
	edge32	%l6,	%g1,	%i1
	edge8l	%l3,	%l2,	%g3
	bg	loop_555
	fble,a	%fcc3,	loop_556
	sdivx	%l5,	0x16AA,	%o1
	edge32	%o5,	%o0,	%g6
loop_555:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_556:
	siam	0x5
	prefetch	[%l7 + 0x3C],	 0x1
	edge8n	%i4,	%o6,	%l0
	ta	%icc,	0x4
	fmovspos	%xcc,	%f15,	%f18
	addc	%g5,	%o7,	%l4
	movneg	%icc,	%i2,	%l1
	fmovrdlez	%o3,	%f20,	%f22
	for	%f2,	%f0,	%f22
	flush	%l7 + 0x20
	fmul8x16au	%f21,	%f11,	%f6
	fmovdle	%xcc,	%f29,	%f24
	fzeros	%f30
	edge16l	%o2,	%g7,	%g4
	movvs	%xcc,	%i7,	%o4
	tle	%xcc,	0x6
	movrlz	%i5,	%i0,	%g2
	fmovsg	%xcc,	%f13,	%f0
	srax	%i6,	0x1D,	%i3
	sir	0x0FCB
	sll	%l6,	0x1D,	%g1
	andncc	%l3,	%i1,	%l2
	std	%f22,	[%l7 + 0x48]
	nop
	set	0x20, %o2
	stw	%g3,	[%l7 + %o2]
	edge16	%o1,	%o5,	%l5
	fsrc2s	%f23,	%f24
	edge8n	%o0,	%i4,	%g6
	edge16n	%l0,	%g5,	%o7
	movg	%icc,	%l4,	%o6
	bneg	%icc,	loop_557
	tgu	%xcc,	0x2
	fbge	%fcc1,	loop_558
	fbug,a	%fcc3,	loop_559
loop_557:
	tpos	%xcc,	0x0
	fmovdne	%xcc,	%f7,	%f6
loop_558:
	bleu,a,pt	%xcc,	loop_560
loop_559:
	smul	%l1,	0x1FD3,	%o3
	fsrc2s	%f25,	%f18
	addccc	%o2,	0x0622,	%g7
loop_560:
	movg	%icc,	%i2,	%g4
	sth	%i7,	[%l7 + 0x30]
	fnands	%f14,	%f15,	%f10
	orncc	%o4,	%i0,	%i5
	fbe	%fcc1,	loop_561
	ldsb	[%l7 + 0x77],	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a	loop_562
loop_561:
	fmovrdgez	%i3,	%f16,	%f18
	fbne,a	%fcc2,	loop_563
	udiv	%l6,	0x0A52,	%i6
loop_562:
	nop
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x2f,	%l2
loop_563:
	nop
	set	0x58, %o1
	sta	%f10,	[%l7 + %o1] 0x88
	and	%g1,	0x0F1A,	%i1
	array8	%l2,	%g3,	%o5
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x0C] %asi,	%l5
	st	%f21,	[%l7 + 0x4C]
	edge32n	%o1,	%o0,	%i4
	ble,a,pn	%icc,	loop_564
	tl	%xcc,	0x6
	sth	%l0,	[%l7 + 0x26]
	brnz,a	%g6,	loop_565
loop_564:
	fbl,a	%fcc1,	loop_566
	fmovdn	%xcc,	%f10,	%f19
	movvc	%xcc,	%g5,	%o7
loop_565:
	bvc,a	%icc,	loop_567
loop_566:
	sll	%o6,	%l4,	%o3
	tl	%xcc,	0x4
	membar	0x28
loop_567:
	fmovsleu	%icc,	%f19,	%f5
	fnegs	%f1,	%f2
	xnorcc	%o2,	0x1ADE,	%g7
	subcc	%i2,	%l1,	%i7
	movl	%xcc,	%g4,	%o4
	fmovsle	%xcc,	%f12,	%f28
	mova	%icc,	%i5,	%i0
	andncc	%i3,	%g2,	%l6
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x0E] %asi,	%i6
	lduh	[%l7 + 0x5A],	%g1
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x64] %asi,	%f26
	fmovdle	%icc,	%f29,	%f22
	ldx	[%l7 + 0x08],	%l3
	edge32l	%l2,	%i1,	%g3
	brlz,a	%l5,	loop_568
	umul	%o5,	%o0,	%i4
	fcmpne16	%f16,	%f6,	%o1
	fmovrdgez	%g6,	%f22,	%f8
loop_568:
	movcc	%icc,	%l0,	%g5
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x50] %asi,	%o6
	movcs	%icc,	%o7,	%l4
	fbuge	%fcc3,	loop_569
	movneg	%icc,	%o2,	%g7
	mulscc	%o3,	%i2,	%i7
	tg	%icc,	0x0
loop_569:
	orcc	%g4,	%o4,	%l1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x3C] %asi,	%f3
	udivcc	%i0,	0x0642,	%i3
	fcmpgt16	%f30,	%f12,	%i5
	subcc	%g2,	%l6,	%g1
	subcc	%i6,	0x1D88,	%l2
	tleu	%xcc,	0x4
	fmovse	%icc,	%f23,	%f9
	te	%xcc,	0x7
	movrne	%l3,	0x026,	%g3
	movl	%icc,	%i1,	%l5
	tl	%xcc,	0x6
	bge,pn	%icc,	loop_570
	movneg	%xcc,	%o0,	%i4
	edge32n	%o1,	%g6,	%o5
	edge32	%l0,	%g5,	%o7
loop_570:
	fmul8x16au	%f22,	%f7,	%f24
	tvs	%icc,	0x7
	add	%o6,	0x1DA6,	%l4
	xorcc	%g7,	0x063C,	%o3
	subcc	%o2,	%i2,	%g4
	fnegd	%f10,	%f14
	fbu,a	%fcc1,	loop_571
	be,pn	%icc,	loop_572
	sll	%i7,	%l1,	%o4
	bgu	loop_573
loop_571:
	fmovdg	%icc,	%f26,	%f12
loop_572:
	ta	%xcc,	0x3
	array8	%i0,	%i3,	%g2
loop_573:
	sdivx	%i5,	0x0EF3,	%l6
	tsubcctv	%g1,	%l2,	%l3
	ldstub	[%l7 + 0x75],	%g3
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	array8	%i6,	%l5,	%i1
	xnorcc	%o0,	%i4,	%o1
	fmovrde	%o5,	%f10,	%f26
	edge16n	%g6,	%l0,	%o7
	fbne,a	%fcc3,	loop_574
	edge32l	%o6,	%l4,	%g7
	orncc	%g5,	%o3,	%o2
	membar	0x08
loop_574:
	tvs	%xcc,	0x1
	xor	%i2,	%i7,	%l1
	sra	%o4,	%i0,	%i3
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x18] %asi,	%g4
	tneg	%xcc,	0x7
	fbge,a	%fcc1,	loop_575
	fbue,a	%fcc0,	loop_576
	sdivx	%g2,	0x0E13,	%l6
	movge	%icc,	%i5,	%l2
loop_575:
	brgz	%l3,	loop_577
loop_576:
	udiv	%g3,	0x1A6A,	%i6
	edge16ln	%l5,	%i1,	%g1
	fmovrsgz	%o0,	%f2,	%f20
loop_577:
	te	%xcc,	0x2
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x17
	membar	#Sync
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	smul	%o1,	%o5,	%i4
	tsubcctv	%l0,	0x0FC2,	%o7
	addccc	%g6,	%l4,	%g7
	sdivx	%g5,	0x1560,	%o3
	taddcc	%o2,	%o6,	%i7
	mova	%xcc,	%l1,	%o4
	fbo,a	%fcc1,	loop_578
	fmovdge	%icc,	%f8,	%f26
	brgz,a	%i0,	loop_579
	array16	%i2,	%i3,	%g2
loop_578:
	tcs	%icc,	0x5
	tvc	%xcc,	0x3
loop_579:
	te	%icc,	0x2
	fpadd16s	%f25,	%f22,	%f4
	fmovde	%xcc,	%f21,	%f26
	tsubcctv	%l6,	%i5,	%g4
	bleu	%icc,	loop_580
	sra	%l3,	0x1B,	%l2
	nop
	setx	loop_581,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addccc	%i6,	%g3,	%l5
loop_580:
	fnand	%f26,	%f10,	%f26
	fbl,a	%fcc1,	loop_582
loop_581:
	array8	%i1,	%g1,	%o1
	smul	%o5,	%o0,	%i4
	nop
	set	0x32, %g2
	ldsh	[%l7 + %g2],	%l0
loop_582:
	fcmple32	%f30,	%f18,	%g6
	taddcctv	%o7,	%g7,	%g5
	sdivx	%o3,	0x01B3,	%o2
	tleu	%icc,	0x7
	addcc	%o6,	0x068E,	%l4
	fnot1s	%f25,	%f30
	andn	%l1,	%o4,	%i0
	subccc	%i2,	0x09AB,	%i7
	fbu	%fcc1,	loop_583
	fbul,a	%fcc1,	loop_584
	movre	%i3,	%g2,	%l6
	fbuge,a	%fcc0,	loop_585
loop_583:
	movvc	%icc,	%g4,	%l3
loop_584:
	movpos	%xcc,	%i5,	%l2
	fand	%f26,	%f10,	%f12
loop_585:
	fmul8ulx16	%f16,	%f0,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i6,	%l5,	%i1
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x7F] %asi,	%g1
	umulcc	%o1,	%o5,	%o0
	addccc	%g3,	%l0,	%i4
	ldsw	[%l7 + 0x5C],	%o7
	edge16	%g7,	%g5,	%g6
	ld	[%l7 + 0x5C],	%f20
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%o2
	fcmpeq16	%f16,	%f8,	%o3
	edge8	%o6,	%l1,	%l4
	alignaddr	%o4,	%i2,	%i0
	edge16l	%i3,	%g2,	%l6
	add	%g4,	%i7,	%l3
	flush	%l7 + 0x6C
	movg	%icc,	%l2,	%i5
	fmovsvc	%icc,	%f1,	%f25
	tne	%xcc,	0x5
	fmovsge	%icc,	%f17,	%f28
	movcs	%xcc,	%i6,	%l5
	tg	%xcc,	0x2
	udivcc	%i1,	0x003E,	%o1
	fmovsl	%xcc,	%f12,	%f30
	sir	0x1412
	tgu	%icc,	0x7
	srlx	%g1,	%o5,	%g3
	sir	0x1AEF
	srax	%l0,	%i4,	%o0
	movre	%g7,	0x16D,	%o7
	alignaddr	%g6,	%g5,	%o3
	addccc	%o6,	0x04F6,	%o2
	subc	%l1,	0x12C5,	%o4
	edge16n	%l4,	%i0,	%i2
	bl,a,pt	%xcc,	loop_586
	umul	%i3,	0x1ECD,	%l6
	fpack16	%f16,	%f28
	taddcc	%g2,	%i7,	%g4
loop_586:
	edge8n	%l2,	%i5,	%l3
	fpsub16s	%f31,	%f10,	%f28
	taddcc	%l5,	0x0008,	%i6
	xnorcc	%i1,	%o1,	%g1
	umulcc	%o5,	0x18CD,	%l0
	andn	%i4,	0x00C5,	%g3
	tsubcc	%o0,	%o7,	%g7
	srlx	%g6,	0x1E,	%o3
	tn	%xcc,	0x2
	stbar
	membar	0x76
	taddcctv	%o6,	%g5,	%o2
	fmovspos	%xcc,	%f26,	%f4
	fpadd16	%f24,	%f24,	%f14
	fbn,a	%fcc1,	loop_587
	tpos	%xcc,	0x1
	lduh	[%l7 + 0x34],	%l1
	tvs	%xcc,	0x6
loop_587:
	udivcc	%l4,	0x14D2,	%o4
	ldd	[%l7 + 0x28],	%i2
	be	%icc,	loop_588
	fpadd16	%f30,	%f28,	%f24
	set	0x31, %i5
	stba	%i3,	[%l7 + %i5] 0xeb
	membar	#Sync
loop_588:
	tvs	%icc,	0x7
	set	0x78, %i1
	stda	%i0,	[%l7 + %i1] 0x10
	wr	%g0,	0x89,	%asi
	sta	%f30,	[%l7 + 0x6C] %asi
	add	%l6,	0x04C7,	%i7
	umulcc	%g2,	0x002B,	%l2
	std	%f12,	[%l7 + 0x18]
	pdist	%f14,	%f12,	%f24
	movrlz	%g4,	0x07B,	%i5
	move	%icc,	%l3,	%l5
	fabss	%f7,	%f3
	bshuffle	%f6,	%f28,	%f14
	set	0x5C, %g3
	lduba	[%l7 + %g3] 0x15,	%i6
	ldub	[%l7 + 0x5D],	%o1
	xnorcc	%g1,	0x19ED,	%o5
	fzero	%f6
	smul	%l0,	%i4,	%g3
	udivx	%i1,	0x08D4,	%o7
	ld	[%l7 + 0x74],	%f16
	andncc	%g7,	%g6,	%o3
	movrlz	%o0,	%o6,	%o2
	edge8ln	%l1,	%l4,	%g5
	or	%i2,	0x0512,	%o4
	fcmpd	%fcc0,	%f0,	%f0
	std	%i0,	[%l7 + 0x70]
	fmovrdlz	%i3,	%f12,	%f8
	ldd	[%l7 + 0x18],	%i6
	edge16l	%l6,	%l2,	%g2
	fbne,a	%fcc1,	loop_589
	movne	%xcc,	%i5,	%g4
	ldstub	[%l7 + 0x7C],	%l5
	fzero	%f6
loop_589:
	subcc	%i6,	0x0F1E,	%l3
	fmovdgu	%xcc,	%f26,	%f14
	fbu,a	%fcc1,	loop_590
	movn	%xcc,	%g1,	%o1
	membar	0x7F
	movvc	%xcc,	%l0,	%i4
loop_590:
	brgz,a	%o5,	loop_591
	edge16l	%g3,	%o7,	%i1
	tge	%xcc,	0x3
	movre	%g7,	0x033,	%o3
loop_591:
	movvc	%icc,	%g6,	%o0
	edge8	%o2,	%l1,	%l4
	flush	%l7 + 0x68
	smulcc	%o6,	%g5,	%i2
	edge8	%o4,	%i3,	%i7
	movpos	%xcc,	%l6,	%l2
	fmovda	%xcc,	%f31,	%f21
	fabss	%f11,	%f26
	mulscc	%g2,	0x0BD1,	%i0
	wr	%g0,	0x11,	%asi
	sta	%f21,	[%l7 + 0x44] %asi
	movn	%xcc,	%i5,	%l5
	edge32n	%i6,	%g4,	%g1
	subccc	%l3,	%l0,	%i4
	wr	%g0,	0x10,	%asi
	stxa	%o1,	[%l7 + 0x50] %asi
	xorcc	%g3,	%o5,	%i1
	edge8ln	%g7,	%o3,	%o7
	add	%g6,	0x1936,	%o2
	movg	%icc,	%o0,	%l4
	alignaddr	%o6,	%l1,	%g5
	edge8l	%o4,	%i2,	%i7
	and	%l6,	%l2,	%g2
	orcc	%i3,	%i0,	%l5
	alignaddrl	%i6,	%g4,	%g1
	tleu	%xcc,	0x6
	subccc	%l3,	%l0,	%i4
	fpack16	%f26,	%f3
	movleu	%xcc,	%o1,	%i5
	tl	%icc,	0x2
	tcc	%icc,	0x4
	tsubcctv	%o5,	0x1658,	%i1
	fbul,a	%fcc3,	loop_592
	movge	%xcc,	%g7,	%g3
	sub	%o3,	%g6,	%o2
	tcc	%icc,	0x5
loop_592:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x19,	%o7,	%o0
	movn	%icc,	%l4,	%o6
	fnegd	%f10,	%f26
	movvs	%icc,	%g5,	%o4
	edge8ln	%l1,	%i7,	%i2
	movneg	%xcc,	%l2,	%l6
	or	%i3,	0x0FC4,	%g2
	add	%i0,	0x1FBF,	%l5
	tvs	%xcc,	0x0
	fcmps	%fcc0,	%f24,	%f16
	movcs	%icc,	%g4,	%g1
	popc	%l3,	%l0
	fabsd	%f26,	%f24
	fmovrse	%i6,	%f11,	%f24
	array16	%i4,	%i5,	%o5
	fmovsl	%icc,	%f8,	%f31
	smulcc	%i1,	0x1D42,	%o1
	tvc	%icc,	0x4
	bleu,a,pt	%icc,	loop_593
	tpos	%xcc,	0x0
	tl	%icc,	0x2
	tcs	%icc,	0x7
loop_593:
	fbo	%fcc0,	loop_594
	brnz	%g7,	loop_595
	edge32l	%o3,	%g6,	%g3
	alignaddr	%o7,	%o2,	%l4
loop_594:
	nop
	set	0x6B, %i7
	lduba	[%l7 + %i7] 0x88,	%o0
loop_595:
	tvc	%xcc,	0x6
	movcc	%icc,	%o6,	%g5
	sdivcc	%o4,	0x1469,	%i7
	movl	%icc,	%i2,	%l1
	mova	%icc,	%l2,	%i3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x15] %asi,	%g2
	tgu	%icc,	0x0
	tgu	%icc,	0x7
	tsubcctv	%i0,	%l5,	%l6
	fpadd16	%f28,	%f10,	%f8
	fbe,a	%fcc0,	loop_596
	be	%icc,	loop_597
	ldd	[%l7 + 0x58],	%f8
	sethi	0x1EAB,	%g4
loop_596:
	fmovdne	%icc,	%f24,	%f20
loop_597:
	fbn	%fcc3,	loop_598
	fbn	%fcc0,	loop_599
	edge16	%g1,	%l0,	%i6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%i5
loop_598:
	nop
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x15,	%f0
loop_599:
	ldd	[%l7 + 0x50],	%f18
	fmovrdne	%i4,	%f6,	%f8
	edge16	%i1,	%o1,	%g7
	fzeros	%f23
	edge8l	%o3,	%g6,	%o5
	umul	%g3,	0x0964,	%o2
	brnz	%l4,	loop_600
	tvc	%xcc,	0x7
	fmovsle	%xcc,	%f2,	%f18
	tne	%xcc,	0x1
loop_600:
	fbul	%fcc1,	loop_601
	udivcc	%o7,	0x0FC9,	%o6
	edge8l	%o0,	%o4,	%g5
	add	%i2,	%i7,	%l2
loop_601:
	fnot1s	%f23,	%f28
	sethi	0x1F84,	%i3
	movcc	%icc,	%g2,	%i0
	set	0x3A, %g5
	ldsha	[%l7 + %g5] 0x88,	%l5
	tvs	%xcc,	0x6
	edge16ln	%l1,	%g4,	%g1
	edge32ln	%l6,	%l0,	%i6
	array32	%l3,	%i5,	%i1
	addcc	%i4,	%g7,	%o3
	fpsub16	%f20,	%f16,	%f4
	xor	%g6,	0x1142,	%o5
	edge8ln	%g3,	%o2,	%l4
	brz,a	%o7,	loop_602
	ld	[%l7 + 0x70],	%f3
	movrne	%o1,	0x26A,	%o6
	tneg	%icc,	0x5
loop_602:
	alignaddr	%o4,	%g5,	%i2
	movle	%xcc,	%o0,	%i7
	stb	%i3,	[%l7 + 0x5E]
	alignaddr	%l2,	%g2,	%l5
	siam	0x6
	srax	%i0,	%g4,	%g1
	tsubcc	%l6,	0x0CBA,	%l1
	alignaddrl	%l0,	%l3,	%i6
	tcs	%xcc,	0x4
	bpos,a	loop_603
	sra	%i1,	0x11,	%i4
	sllx	%g7,	%o3,	%g6
	edge32	%i5,	%g3,	%o5
loop_603:
	fabsd	%f26,	%f4
	stbar
	te	%xcc,	0x3
	sllx	%l4,	%o2,	%o1
	tge	%icc,	0x7
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%o6
	prefetch	[%l7 + 0x40],	 0x2
	fabsd	%f24,	%f12
	brlez,a	%g5,	loop_604
	fmovrde	%o4,	%f0,	%f0
	movne	%icc,	%o0,	%i2
	array8	%i7,	%i3,	%l2
loop_604:
	fbu	%fcc3,	loop_605
	array32	%g2,	%i0,	%l5
	movle	%xcc,	%g1,	%l6
	sdiv	%g4,	0x0BF5,	%l0
loop_605:
	movl	%xcc,	%l1,	%i6
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x40] %asi,	%i1
	tpos	%icc,	0x6
	subcc	%i4,	%l3,	%o3
	sdivcc	%g7,	0x06D1,	%i5
	mulscc	%g6,	0x1EE8,	%o5
	tcs	%icc,	0x6
	fmovd	%f20,	%f4
	faligndata	%f4,	%f2,	%f4
	fmovsg	%icc,	%f13,	%f2
	bg,a,pt	%xcc,	loop_606
	alignaddrl	%g3,	%o2,	%l4
	set	0x2C, %o3
	sta	%f8,	[%l7 + %o3] 0x18
loop_606:
	nop
	wr	%g0,	0x18,	%asi
	stxa	%o7,	[%l7 + 0x50] %asi
	fbu,a	%fcc3,	loop_607
	ldsh	[%l7 + 0x62],	%o1
	umul	%g5,	%o4,	%o6
	fmovdgu	%icc,	%f15,	%f24
loop_607:
	edge8ln	%o0,	%i7,	%i3
	set	0x54, %l3
	sta	%f15,	[%l7 + %l3] 0x04
	tne	%xcc,	0x4
	fmovdn	%icc,	%f14,	%f3
	movleu	%xcc,	%l2,	%g2
	movre	%i0,	%l5,	%i2
	fmovrslez	%g1,	%f15,	%f17
	udivx	%l6,	0x1582,	%l0
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x15
	fmul8ulx16	%f2,	%f6,	%f18
	subccc	%l1,	%i6,	%i1
	addcc	%i4,	%l3,	%g4
	nop
	set	0x26, %l6
	ldsb	[%l7 + %l6],	%g7
	edge8ln	%i5,	%o3,	%o5
	movvc	%xcc,	%g3,	%o2
	array8	%l4,	%o7,	%g6
	fmovsneg	%icc,	%f10,	%f29
	edge32n	%o1,	%o4,	%o6
	tn	%xcc,	0x5
	edge32	%o0,	%g5,	%i7
	tgu	%xcc,	0x6
	movgu	%icc,	%l2,	%i3
	edge16	%i0,	%l5,	%i2
	tle	%xcc,	0x3
	andcc	%g2,	0x09D8,	%g1
	orn	%l6,	%l0,	%l1
	alignaddrl	%i6,	%i1,	%l3
	bcs,a,pn	%icc,	loop_608
	edge16	%g4,	%i4,	%g7
	movre	%i5,	0x26A,	%o5
	fpsub16s	%f1,	%f10,	%f5
loop_608:
	ble	loop_609
	mulscc	%o3,	%o2,	%g3
	edge16l	%o7,	%g6,	%l4
	movrlz	%o1,	0x124,	%o6
loop_609:
	std	%o4,	[%l7 + 0x60]
	fpmerge	%f6,	%f10,	%f0
	movrgez	%g5,	0x368,	%i7
	array16	%o0,	%i3,	%l2
	wr	%g0,	0xe2,	%asi
	stda	%i0,	[%l7 + 0x60] %asi
	membar	#Sync
	subccc	%i2,	0x04EE,	%l5
	fmovrdne	%g1,	%f28,	%f28
	tle	%xcc,	0x5
	faligndata	%f18,	%f0,	%f26
	addc	%g2,	%l0,	%l6
	srlx	%i6,	0x02,	%i1
	bl,a,pn	%icc,	loop_610
	nop
	set	0x30, %i4
	prefetch	[%l7 + %i4],	 0x3
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x30] %asi,	%l1
loop_610:
	fbe,a	%fcc2,	loop_611
	movg	%xcc,	%l3,	%g4
	fmul8ulx16	%f20,	%f14,	%f14
	ldsw	[%l7 + 0x2C],	%g7
loop_611:
	flush	%l7 + 0x10
	set	0x30, %l2
	ldxa	[%g0 + %l2] 0x58,	%i4
	edge32n	%i5,	%o3,	%o5
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x20] %asi,	%g3
	tg	%icc,	0x3
	fcmpgt16	%f28,	%f6,	%o2
	xnorcc	%o7,	0x018E,	%g6
	be	loop_612
	fcmple16	%f14,	%f18,	%o1
	add	%l4,	0x0FC6,	%o4
	edge16	%o6,	%g5,	%i7
loop_612:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc3,	%f16,	%f16
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x24] %asi,	%f16
	wr	%g0,	0xea,	%asi
	stha	%o0,	[%l7 + 0x18] %asi
	membar	#Sync
	fmovrse	%l2,	%f8,	%f5
	fcmpne32	%f24,	%f30,	%i0
	edge32	%i3,	%l5,	%g1
	fmovrsne	%i2,	%f13,	%f13
	fbue	%fcc0,	loop_613
	fcmpeq16	%f10,	%f8,	%l0
	fbg,a	%fcc2,	loop_614
	tcs	%xcc,	0x1
loop_613:
	sra	%g2,	%l6,	%i6
	fmovda	%xcc,	%f25,	%f19
loop_614:
	bpos,pn	%icc,	loop_615
	fxnor	%f30,	%f16,	%f30
	fmovsle	%xcc,	%f30,	%f28
	movre	%l1,	%l3,	%i1
loop_615:
	or	%g7,	0x0F4F,	%i4
	ldsb	[%l7 + 0x32],	%g4
	movrgz	%i5,	0x14D,	%o5
	movvc	%xcc,	%g3,	%o3
	movrlz	%o7,	%o2,	%o1
	sethi	0x077D,	%g6
	fmovsgu	%icc,	%f3,	%f26
	orn	%o4,	0x1415,	%l4
	tvc	%xcc,	0x2
	fcmpd	%fcc2,	%f8,	%f2
	sdivcc	%o6,	0x196A,	%g5
	movrlz	%o0,	0x147,	%i7
	fmovsg	%xcc,	%f6,	%f24
	array8	%l2,	%i3,	%l5
	subcc	%g1,	0x037C,	%i0
	siam	0x6
	stb	%l0,	[%l7 + 0x3D]
	sethi	0x1E29,	%i2
	movrlez	%l6,	0x3DD,	%g2
	wr	%g0,	0x27,	%asi
	stha	%i6,	[%l7 + 0x78] %asi
	membar	#Sync
	subc	%l3,	%i1,	%l1
	ta	%icc,	0x1
	fpsub32	%f20,	%f20,	%f4
	xnorcc	%i4,	%g4,	%g7
	sll	%i5,	0x16,	%o5
	ldd	[%l7 + 0x08],	%f8
	sra	%g3,	%o7,	%o3
	bne	loop_616
	bl	loop_617
	be,a,pt	%icc,	loop_618
	subccc	%o2,	%g6,	%o4
loop_616:
	fnot1s	%f26,	%f27
loop_617:
	fpsub16	%f14,	%f20,	%f2
loop_618:
	umul	%l4,	%o6,	%o1
	addcc	%o0,	0x1C2A,	%i7
	fmovsleu	%icc,	%f20,	%f8
	fcmpgt16	%f16,	%f26,	%g5
	andn	%i3,	%l5,	%l2
	bn,a,pn	%xcc,	loop_619
	ldsh	[%l7 + 0x36],	%g1
	bgu	loop_620
	movrne	%i0,	0x026,	%l0
loop_619:
	umulcc	%l6,	0x0B30,	%g2
	xnorcc	%i2,	%i6,	%l3
loop_620:
	fmovdvs	%xcc,	%f19,	%f0
	alignaddr	%i1,	%l1,	%g4
	fmuld8ulx16	%f0,	%f10,	%f22
	call	loop_621
	tneg	%xcc,	0x4
	xorcc	%i4,	%g7,	%i5
	nop
	setx	loop_622,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_621:
	call	loop_623
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%o4
	popc	0x0F14,	%g3
loop_622:
	nop
	wr	%g0,	0x23,	%asi
	stwa	%o7,	[%l7 + 0x0C] %asi
	membar	#Sync
loop_623:
	edge16l	%o2,	%o3,	%o4
	mova	%xcc,	%l4,	%g6
	tl	%icc,	0x0
	ld	[%l7 + 0x44],	%f20
	umul	%o1,	0x00E5,	%o6
	tsubcc	%i7,	%g5,	%o0
	move	%icc,	%l5,	%i3
	nop
	set	0x67, %l1
	ldub	[%l7 + %l1],	%l2
	fnot2	%f18,	%f10
	fones	%f19
	fmovdpos	%xcc,	%f24,	%f24
	movrne	%g1,	%l0,	%i0
	orncc	%l6,	%g2,	%i6
	fxor	%f12,	%f4,	%f16
	xorcc	%l3,	%i2,	%l1
	tn	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%g4,	%i4
	xnorcc	%i1,	0x0921,	%i5
	tvs	%icc,	0x7
	fmul8sux16	%f8,	%f30,	%f24
	orncc	%o5,	0x159F,	%g3
	fone	%f12
	movvc	%xcc,	%g7,	%o2
	set	0x58, %o6
	swapa	[%l7 + %o6] 0x81,	%o3
	movle	%xcc,	%o7,	%l4
	fcmpgt16	%f6,	%f18,	%o4
	set	0x1C, %l5
	stha	%o1,	[%l7 + %l5] 0xeb
	membar	#Sync
	movrgez	%g6,	0x09C,	%i7
	alignaddr	%g5,	%o0,	%l5
	umulcc	%i3,	%o6,	%g1
	fbul	%fcc3,	loop_624
	fcmpne16	%f14,	%f14,	%l0
	set	0x6C, %o7
	ldsha	[%l7 + %o7] 0x19,	%l2
loop_624:
	fmovsleu	%xcc,	%f15,	%f20
	nop
	set	0x48, %i2
	lduh	[%l7 + %i2],	%i0
	bneg,a,pn	%xcc,	loop_625
	movcs	%icc,	%g2,	%i6
	xnor	%l6,	0x1EFF,	%l3
	fba,a	%fcc1,	loop_626
loop_625:
	alignaddr	%i2,	%g4,	%i4
	alignaddrl	%l1,	%i1,	%o5
	edge16l	%g3,	%g7,	%o2
loop_626:
	te	%icc,	0x1
	tge	%icc,	0x0
	tneg	%icc,	0x5
	orncc	%o3,	0x1B71,	%o7
	xorcc	%l4,	0x0655,	%o4
	sethi	0x0A2E,	%i5
	bvs,a	loop_627
	fmovdvs	%xcc,	%f9,	%f24
	fmul8x16au	%f22,	%f21,	%f12
	edge32l	%g6,	%i7,	%g5
loop_627:
	tpos	%xcc,	0x5
	edge16l	%o0,	%l5,	%i3
	fsrc2s	%f30,	%f19
	fmul8x16al	%f0,	%f23,	%f14
	ldstub	[%l7 + 0x1B],	%o6
	fmovdvs	%icc,	%f6,	%f26
	edge32ln	%g1,	%l0,	%l2
	movn	%xcc,	%i0,	%o1
	tneg	%icc,	0x2
	sdivx	%i6,	0x00A4,	%l6
	sll	%l3,	%g2,	%i2
	add	%i4,	0x1EFC,	%g4
	fmovrslez	%i1,	%f8,	%f10
	tl	%xcc,	0x3
	movre	%o5,	%g3,	%g7
	udiv	%o2,	0x0F34,	%l1
	sra	%o3,	0x0F,	%l4
	fmovdcs	%icc,	%f7,	%f19
	fba	%fcc1,	loop_628
	fbue	%fcc3,	loop_629
	fcmpne32	%f16,	%f26,	%o4
	bcs,a,pt	%icc,	loop_630
loop_628:
	edge32	%i5,	%g6,	%i7
loop_629:
	movneg	%xcc,	%o7,	%g5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x18] %asi,	%l5
loop_630:
	srl	%o0,	0x18,	%o6
	movgu	%icc,	%i3,	%g1
	fbne,a	%fcc0,	loop_631
	bne,pn	%icc,	loop_632
	movrgz	%l2,	0x1FF,	%l0
	fmul8x16	%f8,	%f2,	%f8
loop_631:
	move	%icc,	%i0,	%i6
loop_632:
	fcmpes	%fcc1,	%f17,	%f13
	tsubcc	%o1,	0x106B,	%l6
	tneg	%icc,	0x5
	edge16ln	%l3,	%i2,	%g2
	set	0x14, %g4
	lda	[%l7 + %g4] 0x04,	%f7
	movrgz	%g4,	%i1,	%o5
	smulcc	%i4,	%g7,	%o2
	edge32n	%l1,	%o3,	%l4
	edge16ln	%o4,	%i5,	%g6
	subccc	%g3,	%i7,	%g5
	brgez	%l5,	loop_633
	fpadd16s	%f22,	%f2,	%f22
	fnors	%f16,	%f8,	%f23
	udivx	%o0,	0x06CB,	%o7
loop_633:
	edge32ln	%i3,	%o6,	%l2
	movrgez	%l0,	%g1,	%i6
	ld	[%l7 + 0x68],	%f11
	orn	%o1,	0x1CB9,	%i0
	movleu	%xcc,	%l3,	%l6
	srlx	%i2,	%g4,	%i1
	fornot1	%f12,	%f4,	%f4
	or	%o5,	%i4,	%g2
	fmovrse	%g7,	%f0,	%f29
	alignaddr	%o2,	%o3,	%l1
	edge16ln	%o4,	%l4,	%g6
	tpos	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x2
	move	%icc,	%g3,	%i7
	stw	%i5,	[%l7 + 0x24]
	sethi	0x0477,	%g5
	movne	%icc,	%l5,	%o0
	udivx	%i3,	0x099A,	%o6
	edge8ln	%l2,	%l0,	%g1
	addccc	%o7,	%o1,	%i6
	fbne,a	%fcc0,	loop_634
	fbn,a	%fcc3,	loop_635
	bcs,pt	%icc,	loop_636
	movvc	%icc,	%l3,	%i0
loop_634:
	brlez,a	%i2,	loop_637
loop_635:
	ldsb	[%l7 + 0x7F],	%l6
loop_636:
	sdivx	%g4,	0x1868,	%i1
	edge8ln	%o5,	%g2,	%i4
loop_637:
	bvs,pn	%xcc,	loop_638
	lduw	[%l7 + 0x1C],	%o2
	movleu	%icc,	%g7,	%l1
	array8	%o3,	%o4,	%g6
loop_638:
	nop
	set	0x8, %l0
	stxa	%l4,	[%g0 + %l0] 0x20
	fbug,a	%fcc3,	loop_639
	tcc	%xcc,	0x3
	xor	%g3,	%i5,	%i7
	set	0x40, %i0
	swapa	[%l7 + %i0] 0x80,	%l5
loop_639:
	call	loop_640
	fexpand	%f21,	%f6
	fmovrsne	%g5,	%f14,	%f23
	alignaddrl	%i3,	%o0,	%o6
loop_640:
	orn	%l2,	%g1,	%o7
	bcc,a,pn	%icc,	loop_641
	orncc	%o1,	%i6,	%l3
	fpadd16s	%f26,	%f12,	%f16
	membar	0x64
loop_641:
	edge8ln	%l0,	%i0,	%i2
	fcmpd	%fcc1,	%f12,	%f24
	tcs	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l6,	%i1,	%g4
	tg	%xcc,	0x1
	fpackfix	%f10,	%f28
	bshuffle	%f20,	%f4,	%f20
	alignaddr	%o5,	%i4,	%o2
	brgz,a	%g2,	loop_642
	edge16n	%l1,	%o3,	%g7
	edge8l	%g6,	%l4,	%g3
	fmovdn	%icc,	%f30,	%f4
loop_642:
	fmovdvs	%xcc,	%f0,	%f19
	edge32n	%i5,	%i7,	%o4
	fmovdgu	%xcc,	%f18,	%f4
	fmovdg	%icc,	%f13,	%f31
	ldub	[%l7 + 0x33],	%l5
	brgez	%g5,	loop_643
	addccc	%i3,	%o0,	%o6
	wr	%g0,	0x88,	%asi
	sta	%f29,	[%l7 + 0x5C] %asi
loop_643:
	fpackfix	%f6,	%f21
	edge8ln	%l2,	%o7,	%g1
	smulcc	%i6,	0x0B5D,	%o1
	andncc	%l3,	%i0,	%i2
	bn,a	%xcc,	loop_644
	alignaddr	%l0,	%l6,	%i1
	movcc	%icc,	%g4,	%i4
	mova	%xcc,	%o2,	%g2
loop_644:
	brlez,a	%o5,	loop_645
	tle	%xcc,	0x3
	tne	%xcc,	0x0
	bg,a,pn	%xcc,	loop_646
loop_645:
	fandnot2	%f26,	%f0,	%f24
	edge8l	%o3,	%l1,	%g7
	fnot1	%f24,	%f20
loop_646:
	fmovsleu	%xcc,	%f25,	%f21
	fbge,a	%fcc3,	loop_647
	xnorcc	%l4,	0x1947,	%g6
	fxnor	%f26,	%f20,	%f20
	movg	%xcc,	%i5,	%g3
loop_647:
	fmovrslez	%o4,	%f31,	%f30
	fmovdle	%xcc,	%f27,	%f24
	edge8l	%l5,	%i7,	%g5
	fbul,a	%fcc3,	loop_648
	or	%o0,	0x0442,	%i3
	popc	0x0A61,	%o6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%o7
loop_648:
	taddcctv	%g1,	%l2,	%o1
	movpos	%xcc,	%l3,	%i6
	movcc	%xcc,	%i2,	%l0
	bpos,a,pt	%icc,	loop_649
	srax	%i0,	0x08,	%l6
	add	%i1,	0x0245,	%g4
	fmovrdgz	%i4,	%f4,	%f18
loop_649:
	sth	%o2,	[%l7 + 0x16]
	edge32	%o5,	%o3,	%g2
	subccc	%g7,	%l4,	%l1
	set	0x78, %l4
	ldsba	[%l7 + %l4] 0x04,	%g6
	popc	%i5,	%g3
	fmovdle	%icc,	%f22,	%f4
	fmovrslz	%l5,	%f23,	%f29
	movneg	%icc,	%o4,	%g5
	subcc	%o0,	%i7,	%i3
	or	%o7,	0x0B15,	%g1
	tcc	%icc,	0x6
	udiv	%l2,	0x1A6B,	%o6
	edge16n	%l3,	%o1,	%i6
	fcmple16	%f22,	%f20,	%l0
	fbo,a	%fcc2,	loop_650
	tle	%icc,	0x6
	edge16ln	%i2,	%l6,	%i1
	fpsub16s	%f26,	%f13,	%f17
loop_650:
	fmovdne	%icc,	%f0,	%f15
	fsrc2s	%f11,	%f26
	fble	%fcc3,	loop_651
	sll	%g4,	0x12,	%i0
	tcs	%xcc,	0x4
	fpadd16	%f12,	%f30,	%f6
loop_651:
	tvs	%xcc,	0x4
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%o2
	sir	0x1AA7
	bshuffle	%f8,	%f28,	%f14
	flush	%l7 + 0x44
	edge32n	%i4,	%o5,	%o3
	sir	0x1175
	tn	%icc,	0x4
	bge	loop_652
	movrgez	%g7,	%l4,	%l1
	membar	0x29
	ldstub	[%l7 + 0x08],	%g2
loop_652:
	nop
	set	0x28, %g6
	lda	[%l7 + %g6] 0x80,	%f0
	tle	%xcc,	0x7
	movrgez	%g6,	%i5,	%l5
	fbge	%fcc1,	loop_653
	tvc	%icc,	0x7
	edge32l	%g3,	%g5,	%o4
	tl	%xcc,	0x6
loop_653:
	movre	%i7,	0x225,	%o0
	fbl,a	%fcc1,	loop_654
	tcs	%icc,	0x0
	alignaddr	%o7,	%i3,	%l2
	sethi	0x10FB,	%o6
loop_654:
	xorcc	%l3,	%g1,	%o1
	tvc	%icc,	0x1
	stx	%i6,	[%l7 + 0x48]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l0,	%i2,	%l6
	movge	%icc,	%g4,	%i1
	fnegs	%f7,	%f13
	tsubcctv	%o2,	0x0DCE,	%i0
	sethi	0x1880,	%o5
	tvc	%icc,	0x4
	tvc	%icc,	0x7
	edge8	%o3,	%g7,	%l4
	fmovsle	%xcc,	%f0,	%f30
	andn	%l1,	0x0B03,	%g2
	lduw	[%l7 + 0x68],	%g6
	ldsh	[%l7 + 0x40],	%i5
	fmovsvc	%icc,	%f0,	%f15
	movne	%icc,	%i4,	%g3
	umul	%g5,	0x013C,	%o4
	movleu	%icc,	%i7,	%l5
	movcc	%xcc,	%o0,	%i3
	fornot2s	%f12,	%f8,	%f7
	call	loop_655
	movre	%o7,	%l2,	%l3
	mova	%xcc,	%o6,	%o1
	srlx	%i6,	0x01,	%l0
loop_655:
	fmovscc	%icc,	%f20,	%f26
	and	%i2,	0x1CA1,	%g1
	edge16	%l6,	%g4,	%i1
	move	%xcc,	%i0,	%o5
	pdist	%f30,	%f2,	%f12
	movn	%xcc,	%o2,	%o3
	udivx	%l4,	0x0CD5,	%l1
	sub	%g2,	%g7,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%i4,	%g3
	movvc	%icc,	%g5,	%o4
	fmovdl	%icc,	%f15,	%f11
	udivcc	%i7,	0x1F7E,	%l5
	ta	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o0,	%i3,	%o7
	xorcc	%g6,	0x0D2D,	%l2
	fmovspos	%xcc,	%f16,	%f22
	stbar
	fmovdvs	%icc,	%f9,	%f22
	movrgez	%o6,	%o1,	%i6
	umulcc	%l0,	%i2,	%l3
	and	%l6,	%g1,	%i1
	and	%i0,	%g4,	%o2
	movl	%xcc,	%o5,	%l4
	fmovsneg	%xcc,	%f26,	%f13
	set	0x08, %g7
	sta	%f1,	[%l7 + %g7] 0x14
	fmovscs	%xcc,	%f17,	%f6
	fmovdne	%xcc,	%f28,	%f21
	srlx	%l1,	%g2,	%g7
	fmovrslz	%o3,	%f3,	%f27
	bl,a,pn	%xcc,	loop_656
	edge32l	%i5,	%i4,	%g5
	fornot1s	%f28,	%f9,	%f6
	edge16l	%o4,	%g3,	%i7
loop_656:
	movg	%icc,	%o0,	%l5
	subcc	%o7,	0x050D,	%g6
	movneg	%xcc,	%i3,	%o6
	edge16ln	%o1,	%l2,	%l0
	tl	%xcc,	0x5
	fnand	%f4,	%f20,	%f28
	fcmps	%fcc1,	%f11,	%f30
	fcmpgt32	%f10,	%f16,	%i2
	xorcc	%i6,	0x017E,	%l3
	movn	%icc,	%l6,	%i1
	fbul,a	%fcc1,	loop_657
	xor	%i0,	%g4,	%g1
	st	%f12,	[%l7 + 0x58]
	movg	%icc,	%o2,	%o5
loop_657:
	srl	%l1,	0x05,	%g2
	set	0x33, %i6
	lduba	[%l7 + %i6] 0x04,	%l4
	edge16ln	%o3,	%i5,	%g7
	addcc	%i4,	%o4,	%g3
	fbl	%fcc3,	loop_658
	fmovsgu	%xcc,	%f10,	%f9
	nop
	set	0x78, %o2
	ldsb	[%l7 + %o2],	%i7
	udivcc	%g5,	0x0B5E,	%o0
loop_658:
	fmovdcc	%icc,	%f13,	%f5
	sra	%l5,	%g6,	%o7
	movge	%xcc,	%o6,	%o1
	xor	%i3,	%l0,	%l2
	fbuge	%fcc0,	loop_659
	alignaddr	%i6,	%l3,	%l6
	andn	%i2,	0x167D,	%i0
	movvs	%xcc,	%g4,	%i1
loop_659:
	fba,a	%fcc2,	loop_660
	movneg	%icc,	%g1,	%o2
	umulcc	%o5,	0x19E0,	%l1
	fbo,a	%fcc0,	loop_661
loop_660:
	bgu	%icc,	loop_662
	fbg,a	%fcc0,	loop_663
	edge32ln	%g2,	%o3,	%i5
loop_661:
	taddcc	%g7,	0x008F,	%i4
loop_662:
	tneg	%icc,	0x0
loop_663:
	tn	%xcc,	0x6
	edge16n	%o4,	%l4,	%g3
	sdivx	%i7,	0x18D5,	%o0
	movre	%l5,	0x1FC,	%g6
	fcmped	%fcc1,	%f18,	%f2
	fcmpne16	%f30,	%f8,	%o7
	ldd	[%l7 + 0x10],	%o6
	fcmpgt16	%f22,	%f28,	%o1
	tsubcc	%i3,	%g5,	%l2
	mova	%xcc,	%i6,	%l0
	nop
	setx	loop_664,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%l6,	0x1144,	%i2
	fmovrdlez	%i0,	%f16,	%f22
	fnand	%f22,	%f12,	%f24
loop_664:
	fbge,a	%fcc1,	loop_665
	fbule,a	%fcc1,	loop_666
	taddcctv	%l3,	0x1FF2,	%g4
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x28] %asi,	%g1
loop_665:
	nop
	set	0x40, %o1
	stxa	%o2,	[%l7 + %o1] 0x27
	membar	#Sync
loop_666:
	movg	%icc,	%o5,	%l1
	sdivcc	%g2,	0x1CCA,	%o3
	movle	%icc,	%i1,	%i5
	fbge,a	%fcc0,	loop_667
	array8	%i4,	%o4,	%l4
	movpos	%icc,	%g3,	%i7
	set	0x10, %o5
	lda	[%l7 + %o5] 0x88,	%f3
loop_667:
	fba,a	%fcc3,	loop_668
	brgz,a	%o0,	loop_669
	fbuge,a	%fcc0,	loop_670
	fabsd	%f10,	%f2
loop_668:
	andcc	%l5,	%g7,	%g6
loop_669:
	movrlez	%o6,	0x2C5,	%o1
loop_670:
	fmovs	%f20,	%f21
	fpack32	%f4,	%f28,	%f30
	ld	[%l7 + 0x6C],	%f31
	sub	%o7,	0x0199,	%g5
	fmovrse	%l2,	%f29,	%f14
	edge32l	%i6,	%i3,	%l6
	alignaddr	%i2,	%l0,	%l3
	smul	%g4,	0x1DB5,	%i0
	fors	%f7,	%f26,	%f16
	umulcc	%o2,	0x1CAA,	%g1
	te	%icc,	0x5
	sll	%o5,	0x17,	%l1
	set	0x18, %o0
	stxa	%g2,	[%l7 + %o0] 0xea
	membar	#Sync
	movgu	%xcc,	%i1,	%o3
	fbn,a	%fcc2,	loop_671
	st	%f18,	[%l7 + 0x40]
	andcc	%i4,	%i5,	%o4
	smul	%l4,	0x18C2,	%i7
loop_671:
	edge32l	%g3,	%o0,	%l5
	srax	%g6,	0x01,	%o6
	set	0x6C, %g2
	swapa	[%l7 + %g2] 0x88,	%g7
	bn,a,pt	%icc,	loop_672
	andcc	%o1,	%g5,	%l2
	call	loop_673
	ldd	[%l7 + 0x50],	%o6
loop_672:
	alignaddrl	%i6,	%l6,	%i2
	fbe,a	%fcc2,	loop_674
loop_673:
	nop
	setx loop_675, %l0, %l1
	jmpl %l1, %l0
	movcs	%xcc,	%i3,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_674:
	edge32n	%g4,	%i0,	%g1
loop_675:
	add	%o2,	%o5,	%l1
	tgu	%icc,	0x2
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x60] %asi,	%g2
	subc	%i1,	%o3,	%i5
	fbo,a	%fcc3,	loop_676
	fandnot2	%f24,	%f16,	%f18
	popc	0x05C3,	%o4
	fmovrdlez	%l4,	%f28,	%f14
loop_676:
	fandnot2s	%f24,	%f28,	%f13
	andn	%i7,	%g3,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%o0,	loop_677
	bne,a,pt	%xcc,	loop_678
	fornot2s	%f5,	%f23,	%f16
	be,a,pn	%icc,	loop_679
loop_677:
	ldstub	[%l7 + 0x4D],	%g6
loop_678:
	ldd	[%l7 + 0x50],	%o6
	edge16	%g7,	%l5,	%g5
loop_679:
	fmovdge	%icc,	%f31,	%f12
	andncc	%o1,	%o7,	%i6
	andcc	%l6,	%i2,	%l0
	edge32l	%i3,	%l3,	%l2
	fmovdcc	%xcc,	%f17,	%f11
	taddcctv	%g4,	%i0,	%g1
	tge	%icc,	0x1
	or	%o2,	%l1,	%g2
	and	%o5,	%i1,	%o3
	edge16	%o4,	%i5,	%i7
	subcc	%g3,	0x19D2,	%i4
	nop
	setx	loop_680,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx loop_681, %l0, %l1
	jmpl %l1, %l4
	brgz,a	%g6,	loop_682
	bcc,a	%xcc,	loop_683
loop_680:
	fandnot2s	%f6,	%f22,	%f4
loop_681:
	nop
	set	0x5C, %i5
	stwa	%o6,	[%l7 + %i5] 0x18
loop_682:
	tge	%icc,	0x6
loop_683:
	fmovsg	%xcc,	%f22,	%f3
	fmovdle	%icc,	%f7,	%f20
	addcc	%g7,	%o0,	%l5
	add	%o1,	%g5,	%i6
	alignaddrl	%o7,	%i2,	%l6
	fpadd16	%f2,	%f6,	%f0
	mova	%xcc,	%i3,	%l3
	fcmps	%fcc0,	%f16,	%f9
	ldd	[%l7 + 0x38],	%l0
	fexpand	%f20,	%f2
	udivx	%g4,	0x19B8,	%l2
	fbuge	%fcc3,	loop_684
	tle	%xcc,	0x2
	xnorcc	%g1,	%i0,	%o2
	array16	%l1,	%o5,	%i1
loop_684:
	andncc	%g2,	%o3,	%i5
	smulcc	%i7,	0x041D,	%g3
	fblg,a	%fcc1,	loop_685
	smul	%i4,	0x0764,	%o4
	udivx	%g6,	0x14F5,	%l4
	fmovdle	%xcc,	%f21,	%f28
loop_685:
	tsubcctv	%g7,	%o6,	%l5
	bvs	%icc,	loop_686
	brlz	%o0,	loop_687
	faligndata	%f6,	%f16,	%f6
	tge	%icc,	0x2
loop_686:
	fbu,a	%fcc0,	loop_688
loop_687:
	alignaddr	%o1,	%i6,	%o7
	fand	%f2,	%f16,	%f0
	movrgez	%i2,	%g5,	%i3
loop_688:
	nop
	setx loop_689, %l0, %l1
	jmpl %l1, %l6
	fzero	%f30
	taddcctv	%l3,	%l0,	%l2
	sdivx	%g1,	0x1D32,	%i0
loop_689:
	edge8n	%o2,	%l1,	%o5
	st	%f17,	[%l7 + 0x38]
	tvs	%xcc,	0x2
	prefetch	[%l7 + 0x7C],	 0x0
	array32	%g4,	%g2,	%i1
	set	0x1A, %i1
	stha	%i5,	[%l7 + %i1] 0x2b
	membar	#Sync
	bne,a,pn	%icc,	loop_690
	fpadd32s	%f11,	%f15,	%f5
	movrne	%i7,	0x1DE,	%o3
	orn	%g3,	%o4,	%i4
loop_690:
	fbu	%fcc0,	loop_691
	move	%icc,	%l4,	%g6
	bpos,a,pt	%icc,	loop_692
	std	%f28,	[%l7 + 0x38]
loop_691:
	movg	%xcc,	%o6,	%l5
	or	%o0,	0x1877,	%g7
loop_692:
	fexpand	%f27,	%f22
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%o7
	xnorcc	%o1,	%i2,	%g5
	edge16	%l6,	%l3,	%i3
	for	%f20,	%f10,	%f30
	fands	%f29,	%f24,	%f27
	fcmpd	%fcc3,	%f28,	%f10
	movrgz	%l0,	0x1D9,	%g1
	std	%l2,	[%l7 + 0x78]
	andcc	%i0,	0x016B,	%o2
	sdiv	%o5,	0x19A2,	%l1
	taddcc	%g4,	0x1E65,	%i1
	fpsub16s	%f16,	%f4,	%f15
	fpadd32	%f10,	%f4,	%f22
	array8	%g2,	%i5,	%i7
	xnor	%g3,	0x0475,	%o3
	ta	%xcc,	0x1
	fmovdcc	%xcc,	%f20,	%f27
	fnot1	%f4,	%f30
	andcc	%o4,	0x19E5,	%l4
	fbuge	%fcc1,	loop_693
	fmovd	%f18,	%f10
	movrlz	%g6,	%i4,	%l5
	sll	%o0,	%o6,	%g7
loop_693:
	mulx	%i6,	%o1,	%i2
	sethi	0x0DCA,	%o7
	fbe,a	%fcc0,	loop_694
	umulcc	%l6,	%l3,	%g5
	fnand	%f8,	%f28,	%f18
	faligndata	%f22,	%f26,	%f14
loop_694:
	fmul8x16al	%f29,	%f14,	%f4
	fpsub16	%f12,	%f24,	%f28
	and	%l0,	%g1,	%i3
	taddcctv	%l2,	0x012B,	%o2
	fmovdcc	%xcc,	%f12,	%f25
	tcs	%xcc,	0x1
	edge16n	%i0,	%l1,	%g4
	array16	%o5,	%i1,	%g2
	movvs	%icc,	%i5,	%i7
	ta	%icc,	0x3
	sllx	%g3,	%o4,	%l4
	fmovdvc	%icc,	%f25,	%f8
	subcc	%o3,	%i4,	%g6
	srax	%l5,	0x11,	%o0
	udivx	%o6,	0x0AE8,	%g7
	brgz,a	%i6,	loop_695
	subcc	%o1,	%o7,	%i2
	srax	%l6,	0x02,	%g5
	srl	%l0,	0x14,	%l3
loop_695:
	movvs	%icc,	%g1,	%i3
	tne	%xcc,	0x2
	fbne,a	%fcc0,	loop_696
	alignaddrl	%l2,	%o2,	%l1
	movrlz	%i0,	%o5,	%g4
	edge16	%i1,	%g2,	%i7
loop_696:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x76] %asi,	%i5
	fornot2	%f24,	%f16,	%f12
	tcs	%xcc,	0x1
	taddcc	%g3,	0x0561,	%l4
	tleu	%xcc,	0x4
	tsubcc	%o4,	0x13F5,	%i4
	bne,a	%xcc,	loop_697
	fnand	%f14,	%f6,	%f28
	tl	%xcc,	0x3
	fxor	%f4,	%f12,	%f4
loop_697:
	mulx	%g6,	0x0901,	%l5
	orcc	%o3,	0x15CF,	%o0
	ldsh	[%l7 + 0x44],	%o6
	fcmple16	%f22,	%f20,	%g7
	fbge	%fcc0,	loop_698
	fbge	%fcc3,	loop_699
	bvc,pt	%xcc,	loop_700
	bge	%icc,	loop_701
loop_698:
	tl	%icc,	0x5
loop_699:
	tgu	%icc,	0x7
loop_700:
	movl	%icc,	%o1,	%i6
loop_701:
	orn	%o7,	%l6,	%i2
	movg	%xcc,	%l0,	%g5
	udivx	%g1,	0x19A0,	%i3
	movre	%l2,	%o2,	%l1
	fmovdn	%xcc,	%f10,	%f23
	movge	%xcc,	%l3,	%i0
	bg	%xcc,	loop_702
	srax	%o5,	0x0A,	%g4
	fmovsg	%xcc,	%f31,	%f9
	bvc,a	%xcc,	loop_703
loop_702:
	fmovd	%f28,	%f20
	edge32ln	%g2,	%i1,	%i7
	udivcc	%g3,	0x13C5,	%i5
loop_703:
	mova	%xcc,	%l4,	%i4
	movne	%icc,	%o4,	%g6
	fxors	%f15,	%f24,	%f29
	fmul8x16al	%f2,	%f1,	%f26
	andn	%l5,	0x1FA9,	%o3
	fors	%f6,	%f25,	%f24
	edge8l	%o0,	%o6,	%o1
	fble	%fcc1,	loop_704
	brnz,a	%g7,	loop_705
	ldstub	[%l7 + 0x7F],	%i6
	fpadd32	%f26,	%f8,	%f30
loop_704:
	sllx	%o7,	%l6,	%i2
loop_705:
	std	%g4,	[%l7 + 0x48]
	taddcc	%g1,	0x105E,	%l0
	sub	%l2,	0x09FA,	%o2
	edge32ln	%i3,	%l3,	%i0
	sub	%l1,	%o5,	%g2
	fnot2s	%f24,	%f14
	movvs	%xcc,	%i1,	%g4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%i7
	movvc	%xcc,	%g3,	%l4
	movrlz	%i4,	0x3A8,	%o4
	set	0x26, %g3
	stha	%i5,	[%l7 + %g3] 0x14
	tcs	%xcc,	0x3
	tpos	%icc,	0x6
	move	%icc,	%l5,	%o3
	sdivcc	%g6,	0x13AC,	%o0
	movrlz	%o6,	0x3E6,	%o1
	ldx	[%l7 + 0x70],	%g7
	fcmpd	%fcc1,	%f6,	%f18
	movrne	%i6,	%l6,	%i2
	fbuge	%fcc1,	loop_706
	addccc	%g5,	%o7,	%l0
	call	loop_707
	fmovdvs	%icc,	%f27,	%f0
loop_706:
	movgu	%xcc,	%g1,	%l2
	fbu	%fcc3,	loop_708
loop_707:
	sir	0x0511
	edge32l	%o2,	%l3,	%i3
	nop
	setx	loop_709,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_708:
	fmul8sux16	%f28,	%f4,	%f24
	xnor	%l1,	%o5,	%i0
	ta	%icc,	0x4
loop_709:
	stb	%g2,	[%l7 + 0x32]
	movrgez	%g4,	0x1F9,	%i7
	tvc	%xcc,	0x6
	srl	%i1,	%l4,	%g3
	stb	%o4,	[%l7 + 0x5C]
	udivx	%i5,	0x15ED,	%l5
	ble,a	%xcc,	loop_710
	stx	%i4,	[%l7 + 0x60]
	membar	0x44
	set	0x48, %i3
	stxa	%o3,	[%l7 + %i3] 0xe2
	membar	#Sync
loop_710:
	fpackfix	%f30,	%f10
	fbn,a	%fcc0,	loop_711
	tcs	%xcc,	0x4
	fbule	%fcc3,	loop_712
	xnor	%g6,	%o0,	%o6
loop_711:
	tsubcc	%g7,	0x10F5,	%i6
	fnot1	%f6,	%f6
loop_712:
	sdivcc	%o1,	0x19CE,	%l6
	array8	%g5,	%o7,	%i2
	nop
	set	0x10, %g5
	ldd	[%l7 + %g5],	%f20
	fmovrdgez	%l0,	%f18,	%f30
	wr	%g0,	0x2a,	%asi
	stxa	%g1,	[%l7 + 0x28] %asi
	membar	#Sync
	fandnot2	%f18,	%f10,	%f18
	bne,a,pn	%xcc,	loop_713
	fmovdcc	%xcc,	%f9,	%f17
	std	%f2,	[%l7 + 0x28]
	sethi	0x081E,	%o2
loop_713:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f0,	%f22,	%f22
	sdivx	%l3,	0x047A,	%l2
	set	0x20, %o3
	ldda	[%l7 + %o3] 0x19,	%l0
	umul	%o5,	%i3,	%i0
	tcc	%icc,	0x6
	fbe,a	%fcc1,	loop_714
	edge32ln	%g2,	%g4,	%i7
	edge16	%i1,	%l4,	%g3
	edge16ln	%o4,	%l5,	%i5
loop_714:
	fmovde	%xcc,	%f6,	%f16
	umulcc	%o3,	%i4,	%g6
	tgu	%xcc,	0x7
	edge16n	%o6,	%g7,	%o0
	bleu,pt	%icc,	loop_715
	membar	0x27
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x4A] %asi,	%o1
loop_715:
	edge8	%l6,	%i6,	%o7
	movn	%icc,	%i2,	%l0
	andn	%g5,	%g1,	%o2
	andn	%l3,	%l1,	%o5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x30] %asi,	%i2
	andn	%l2,	0x0280,	%i0
	fnot1s	%f28,	%f4
	xorcc	%g2,	%g4,	%i1
	movrgez	%l4,	%i7,	%g3
	addcc	%o4,	0x0BAB,	%l5
	movrgz	%i5,	0x31E,	%o3
	array16	%i4,	%o6,	%g7
	xnorcc	%g6,	%o1,	%l6
	fmovd	%f4,	%f30
	st	%f11,	[%l7 + 0x4C]
	nop
	setx	loop_716,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrslz	%i6,	%f14,	%f13
	fpack32	%f12,	%f4,	%f22
	fpack32	%f4,	%f12,	%f2
loop_716:
	fmovdne	%icc,	%f4,	%f17
	fandnot1	%f14,	%f2,	%f20
	fnot2s	%f7,	%f24
	tsubcc	%o7,	%o0,	%l0
	fone	%f20
	stb	%g5,	[%l7 + 0x2D]
	ldx	[%l7 + 0x68],	%i2
	edge8	%g1,	%o2,	%l1
	subcc	%l3,	%o5,	%l2
	edge8n	%i0,	%g2,	%g4
	tl	%icc,	0x7
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x13] %asi,	%i3
	xorcc	%i1,	0x0236,	%l4
	xor	%i7,	%g3,	%o4
	tsubcc	%l5,	%i5,	%o3
	movrgez	%i4,	0x1E4,	%o6
	bshuffle	%f26,	%f24,	%f14
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%g6,	%o1
	fmovrdgez	%g7,	%f0,	%f22
	set	0x188, %l3
	nop 	! 	nop 	! 	ldxa	[%g0 + %l3] 0x40,	%l6 ripped by fixASI40.pl ripped by fixASI40.pl
	orn	%o7,	%i6,	%o0
	fcmpeq16	%f10,	%f10,	%g5
	mova	%icc,	%i2,	%g1
	std	%l0,	[%l7 + 0x28]
	srl	%o2,	0x0B,	%l3
	fnands	%f13,	%f29,	%f15
	fmovsvs	%icc,	%f18,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x28, %g1
	stxa	%o5,	[%l7 + %g1] 0x81
	srax	%l1,	0x06,	%i0
	movcc	%icc,	%l2,	%g4
	srax	%i3,	%g2,	%l4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i1,	%g3
	fone	%f18
	fmul8ulx16	%f2,	%f26,	%f20
	edge8ln	%o4,	%i7,	%i5
	movn	%xcc,	%l5,	%o3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fexpand	%f2,	%f20
	lduh	[%l7 + 0x62],	%o6
	fzero	%f6
	movne	%icc,	%i4,	%g6
	fzeros	%f30
	movl	%icc,	%g7,	%l6
	fmovrdlz	%o7,	%f0,	%f12
	add	%i6,	%o1,	%g5
	fbule	%fcc3,	loop_717
	fxors	%f25,	%f21,	%f15
	edge32n	%i2,	%g1,	%l0
	fnot2s	%f27,	%f19
loop_717:
	fnot1	%f20,	%f16
	bl,a	loop_718
	tpos	%xcc,	0x0
	movrne	%o0,	0x00E,	%l3
	fmovrsne	%o2,	%f24,	%f7
loop_718:
	fmovdg	%xcc,	%f21,	%f29
	nop
	setx loop_719, %l0, %l1
	jmpl %l1, %l1
	srlx	%i0,	0x17,	%o5
	movcs	%xcc,	%l2,	%i3
	fnot2	%f28,	%f12
loop_719:
	mulx	%g2,	%g4,	%l4
	set	0x6C, %i7
	stwa	%g3,	[%l7 + %i7] 0x11
	srax	%i1,	0x10,	%o4
	fbue,a	%fcc3,	loop_720
	fbuge,a	%fcc3,	loop_721
	fmovsl	%icc,	%f12,	%f18
	tneg	%icc,	0x4
loop_720:
	alignaddr	%i7,	%i5,	%l5
loop_721:
	fblg,a	%fcc1,	loop_722
	taddcc	%o3,	0x181D,	%i4
	tleu	%xcc,	0x6
	fcmps	%fcc0,	%f14,	%f19
loop_722:
	brlz,a	%o6,	loop_723
	bleu,a	%icc,	loop_724
	fmovsgu	%xcc,	%f25,	%f8
	orn	%g6,	%l6,	%o7
loop_723:
	tsubcctv	%i6,	0x1A70,	%g7
loop_724:
	edge8	%g5,	%o1,	%i2
	andcc	%g1,	0x09C3,	%o0
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x14] %asi,	%l3
	subc	%o2,	%l1,	%i0
	tsubcc	%o5,	%l2,	%l0
	set	0x34, %l6
	lda	[%l7 + %l6] 0x11,	%f26
	set	0x62, %i4
	ldsba	[%l7 + %i4] 0x0c,	%i3
	ldsb	[%l7 + 0x72],	%g4
	orcc	%g2,	0x1B8A,	%l4
	srlx	%i1,	%g3,	%i7
	fmovrslz	%o4,	%f9,	%f27
	movneg	%icc,	%i5,	%o3
	fxor	%f10,	%f24,	%f16
	fnand	%f20,	%f2,	%f28
	movrlez	%l5,	0x2F1,	%o6
	movgu	%icc,	%i4,	%l6
	fnands	%f13,	%f9,	%f17
	fblg,a	%fcc3,	loop_725
	tleu	%xcc,	0x7
	xorcc	%o7,	%g6,	%g7
	movn	%xcc,	%i6,	%o1
loop_725:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fcmpeq32	%f6,	%f24,	%g5
	andn	%g1,	%o0,	%l3
	movne	%xcc,	%i2,	%o2
	movrgez	%i0,	0x27A,	%l1
	addc	%o5,	%l2,	%l0
	fcmple32	%f20,	%f14,	%g4
	edge8ln	%i3,	%l4,	%i1
	call	loop_726
	sdiv	%g3,	0x0E2A,	%i7
	xnor	%o4,	0x0576,	%i5
	alignaddr	%g2,	%o3,	%l5
loop_726:
	edge8ln	%o6,	%i4,	%o7
	edge8l	%l6,	%g6,	%g7
	movcc	%icc,	%o1,	%i6
	movleu	%xcc,	%g1,	%o0
	tsubcc	%l3,	0x0E29,	%i2
	srlx	%g5,	0x0D,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a,pn	%icc,	loop_727
	bneg,a	loop_728
	movrlz	%o2,	%o5,	%l1
	for	%f26,	%f6,	%f22
loop_727:
	movn	%xcc,	%l0,	%l2
loop_728:
	stw	%i3,	[%l7 + 0x64]
	bcs,a	loop_729
	edge8ln	%g4,	%i1,	%l4
	fmovdpos	%icc,	%f4,	%f15
	popc	%g3,	%i7
loop_729:
	movvs	%icc,	%i5,	%g2
	flush	%l7 + 0x64
	fexpand	%f19,	%f4
	stx	%o3,	[%l7 + 0x68]
	fbg,a	%fcc2,	loop_730
	nop
	setx loop_731, %l0, %l1
	jmpl %l1, %l5
	alignaddr	%o4,	%i4,	%o7
	set	0x48, %l2
	ldswa	[%l7 + %l2] 0x19,	%o6
loop_730:
	brlez	%g6,	loop_732
loop_731:
	te	%icc,	0x4
	brgez	%l6,	loop_733
	orcc	%o1,	%g7,	%i6
loop_732:
	movleu	%xcc,	%o0,	%l3
	xnor	%g1,	%i2,	%g5
loop_733:
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i0
	edge16ln	%o2,	%l1,	%o5
	nop
	set	0x50, %o4
	std	%l2,	[%l7 + %o4]
	fpadd32s	%f24,	%f10,	%f7
	array16	%i3,	%g4,	%i1
	sir	0x1AEA
	fmul8x16au	%f19,	%f17,	%f2
	fmovde	%xcc,	%f7,	%f5
	ldx	[%l7 + 0x50],	%l4
	fmovdneg	%icc,	%f2,	%f6
	smulcc	%l0,	0x19FA,	%i7
	call	loop_734
	fcmple16	%f24,	%f26,	%i5
	fblg,a	%fcc0,	loop_735
	te	%xcc,	0x4
loop_734:
	edge32ln	%g2,	%g3,	%o3
	movn	%xcc,	%l5,	%i4
loop_735:
	fones	%f15
	fbge	%fcc0,	loop_736
	edge32l	%o4,	%o6,	%g6
	fpsub32	%f24,	%f24,	%f28
	xor	%l6,	0x0BAB,	%o7
loop_736:
	fandnot1	%f26,	%f6,	%f2
	fcmpeq32	%f16,	%f24,	%o1
	bpos	%icc,	loop_737
	lduh	[%l7 + 0x54],	%g7
	udivcc	%o0,	0x033B,	%l3
	fbl	%fcc1,	loop_738
loop_737:
	tg	%icc,	0x6
	fmovsa	%icc,	%f7,	%f23
	movrgz	%g1,	%i6,	%g5
loop_738:
	popc	0x1A62,	%i0
	set	0x50, %l1
	stwa	%o2,	[%l7 + %l1] 0x81
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x18] %asi,	%l1
	udivcc	%o5,	0x169D,	%i2
	andn	%l2,	%g4,	%i1
	set	0x50, %o6
	ldda	[%l7 + %o6] 0x04,	%i2
	edge8ln	%l4,	%i7,	%l0
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x74] %asi,	%g2
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x46] %asi,	%i5
	xnorcc	%o3,	%l5,	%i4
	edge16n	%o4,	%g3,	%g6
	fand	%f28,	%f28,	%f18
	fbl	%fcc1,	loop_739
	fmovsl	%icc,	%f25,	%f12
	fmovrde	%o6,	%f10,	%f20
	fzero	%f20
loop_739:
	nop
	set	0x3C, %o7
	sta	%f18,	[%l7 + %o7] 0x88
	movvs	%xcc,	%l6,	%o1
	taddcctv	%o7,	%g7,	%l3
	call	loop_740
	st	%f9,	[%l7 + 0x78]
	movneg	%icc,	%g1,	%o0
	tvc	%xcc,	0x6
loop_740:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%i6,	0x0C94,	%i0
	tcs	%xcc,	0x6
	fmovscc	%xcc,	%f2,	%f0
	or	%g5,	0x175C,	%o2
	fbn,a	%fcc1,	loop_741
	tvs	%xcc,	0x2
	edge32l	%o5,	%l1,	%l2
	movleu	%icc,	%i2,	%i1
loop_741:
	srl	%g4,	%l4,	%i3
	wr	%g0,	0x0c,	%asi
	stwa	%l0,	[%l7 + 0x1C] %asi
	stx	%i7,	[%l7 + 0x30]
	umul	%i5,	%g2,	%l5
	fbuge,a	%fcc2,	loop_742
	movg	%icc,	%i4,	%o4
	movpos	%xcc,	%o3,	%g6
	edge8n	%g3,	%o6,	%l6
loop_742:
	fcmpgt16	%f6,	%f2,	%o1
	fmovscs	%icc,	%f10,	%f28
	movpos	%xcc,	%o7,	%l3
	fornot1s	%f16,	%f15,	%f18
	fnot2	%f20,	%f18
	edge16l	%g7,	%o0,	%i6
	bshuffle	%f14,	%f8,	%f4
	movgu	%icc,	%i0,	%g1
	tleu	%xcc,	0x1
	tle	%xcc,	0x4
	sdivcc	%o2,	0x17A6,	%o5
	movrgz	%l1,	%g5,	%i2
	sethi	0x09A1,	%i1
	movrlez	%l2,	%l4,	%g4
	edge32l	%i3,	%l0,	%i5
	ldsh	[%l7 + 0x10],	%g2
	smul	%l5,	%i7,	%i4
	fbu	%fcc3,	loop_743
	fnot1s	%f20,	%f23
	bl,a,pt	%icc,	loop_744
	movl	%icc,	%o3,	%o4
loop_743:
	movrgz	%g6,	0x255,	%g3
	fornot1	%f12,	%f12,	%f26
loop_744:
	xor	%l6,	0x19C9,	%o1
	sdiv	%o7,	0x1DCE,	%l3
	te	%xcc,	0x4
	prefetch	[%l7 + 0x14],	 0x3
	mova	%icc,	%o6,	%g7
	movneg	%xcc,	%i6,	%o0
	bpos,a,pn	%xcc,	loop_745
	ldd	[%l7 + 0x38],	%i0
	tvc	%xcc,	0x1
	brgez	%o2,	loop_746
loop_745:
	edge8ln	%o5,	%g1,	%g5
	umul	%l1,	0x0809,	%i2
	or	%i1,	0x0215,	%l4
loop_746:
	ba,a,pn	%xcc,	loop_747
	sub	%g4,	%l2,	%l0
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x58] %asi,	%f28
loop_747:
	tcc	%xcc,	0x2
	fmovdge	%xcc,	%f2,	%f15
	tvc	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i3
	fmovrdlz	%i5,	%f18,	%f12
	movcs	%icc,	%g2,	%l5
	fmovsle	%xcc,	%f21,	%f15
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%o3
	srlx	%o4,	%g6,	%i4
	fnor	%f28,	%f8,	%f4
	edge8n	%g3,	%o1,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc1,	loop_748
	srl	%o7,	%o6,	%g7
	sdivcc	%l3,	0x16C3,	%i6
	movvc	%icc,	%o0,	%i0
loop_748:
	array8	%o2,	%g1,	%g5
	fnegs	%f15,	%f24
	orn	%o5,	0x0DF1,	%l1
	bvc,pn	%xcc,	loop_749
	fpsub16	%f28,	%f8,	%f20
	umul	%i2,	0x1FA0,	%i1
	tvc	%xcc,	0x6
loop_749:
	ba	%icc,	loop_750
	add	%l4,	0x05EA,	%g4
	set	0x38, %l5
	stxa	%l0,	[%l7 + %l5] 0x88
loop_750:
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%i5
	lduw	[%l7 + 0x24],	%g2
	fmovdn	%icc,	%f31,	%f7
	sdivcc	%l5,	0x1725,	%i7
	brnz	%i3,	loop_751
	fmovdleu	%xcc,	%f5,	%f29
	array16	%o4,	%g6,	%i4
	move	%icc,	%o3,	%o1
loop_751:
	tvc	%icc,	0x3
	sir	0x1FB8
	or	%g3,	%l6,	%o6
	add	%g7,	0x0CFA,	%l3
	movle	%xcc,	%o7,	%i6
	fnor	%f10,	%f28,	%f8
	fmovde	%icc,	%f11,	%f9
	tle	%icc,	0x7
	edge32	%i0,	%o2,	%o0
	sdivx	%g1,	0x1316,	%g5
	edge16l	%o5,	%l1,	%i1
	tgu	%xcc,	0x6
	movneg	%icc,	%l4,	%g4
	mova	%icc,	%i2,	%l2
	fbul,a	%fcc0,	loop_752
	alignaddr	%l0,	%i5,	%g2
	movne	%xcc,	%i7,	%i3
	fmovrslez	%o4,	%f14,	%f24
loop_752:
	edge16l	%l5,	%i4,	%o3
	fmovrsgz	%g6,	%f9,	%f27
	movg	%xcc,	%o1,	%g3
	edge8	%o6,	%g7,	%l3
	brlez	%o7,	loop_753
	movne	%xcc,	%i6,	%i0
	stb	%o2,	[%l7 + 0x4B]
	fbl	%fcc0,	loop_754
loop_753:
	tl	%xcc,	0x6
	tneg	%icc,	0x2
	bcc	%icc,	loop_755
loop_754:
	fpackfix	%f14,	%f26
	movl	%xcc,	%l6,	%o0
	stbar
loop_755:
	movrlez	%g5,	%g1,	%o5
	swap	[%l7 + 0x38],	%l1
	tge	%xcc,	0x6
	edge16	%l4,	%i1,	%i2
	edge8l	%g4,	%l2,	%i5
	sir	0x144F
	std	%l0,	[%l7 + 0x38]
	fcmpd	%fcc0,	%f10,	%f14
	add	%g2,	0x15C4,	%i3
	umul	%o4,	%i7,	%l5
	nop
	set	0x39, %g4
	ldstub	[%l7 + %g4],	%o3
	brlez,a	%i4,	loop_756
	alignaddrl	%o1,	%g3,	%g6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x34] %asi,	%f16
loop_756:
	movrlez	%o6,	0x0BA,	%g7
	fmovsne	%icc,	%f10,	%f10
	movrlz	%o7,	0x3CB,	%l3
	fmul8x16	%f28,	%f8,	%f10
	movg	%xcc,	%i0,	%i6
	bpos,pt	%xcc,	loop_757
	lduw	[%l7 + 0x24],	%l6
	be,a	loop_758
	be,pn	%xcc,	loop_759
loop_757:
	sdivcc	%o2,	0x175F,	%g5
	xor	%o0,	0x1E21,	%o5
loop_758:
	nop
	set	0x68, %l0
	lduw	[%l7 + %l0],	%l1
loop_759:
	fbue	%fcc2,	loop_760
	alignaddr	%l4,	%i1,	%g1
	sdivcc	%i2,	0x0DC3,	%g4
	edge32ln	%l2,	%l0,	%i5
loop_760:
	movpos	%icc,	%i3,	%o4
	nop
	set	0x48, %i2
	stx	%i7,	[%l7 + %i2]
	movg	%icc,	%l5,	%o3
	bvs,a	%icc,	loop_761
	add	%i4,	0x13AE,	%o1
	smulcc	%g2,	0x12FA,	%g3
	taddcc	%g6,	0x189E,	%o6
loop_761:
	srax	%g7,	%l3,	%i0
	bvs,a,pn	%icc,	loop_762
	edge16ln	%i6,	%o7,	%l6
	membar	0x4E
	fzeros	%f16
loop_762:
	brnz,a	%o2,	loop_763
	array16	%o0,	%g5,	%o5
	fbg	%fcc3,	loop_764
	edge32n	%l1,	%i1,	%l4
loop_763:
	movvs	%xcc,	%g1,	%i2
	be	%xcc,	loop_765
loop_764:
	tcc	%xcc,	0x4
	movle	%xcc,	%l2,	%g4
	tcc	%xcc,	0x4
loop_765:
	stx	%i5,	[%l7 + 0x48]
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x40] %asi,	%l0
	fmovrdne	%o4,	%f24,	%f4
	movvs	%icc,	%i7,	%i3
	movn	%xcc,	%l5,	%o3
	fands	%f7,	%f24,	%f21
	andn	%o1,	0x1787,	%g2
	subc	%i4,	0x0172,	%g3
	bgu	%icc,	loop_766
	bpos,pt	%xcc,	loop_767
	fbule,a	%fcc3,	loop_768
	orncc	%g6,	%o6,	%g7
loop_766:
	nop
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x3C] %asi,	%l3
loop_767:
	tl	%icc,	0x6
loop_768:
	fnand	%f28,	%f14,	%f4
	mova	%xcc,	%i6,	%o7
	andcc	%i0,	%o2,	%o0
	fmovdvc	%icc,	%f0,	%f27
	brnz	%l6,	loop_769
	faligndata	%f24,	%f10,	%f4
	udivx	%o5,	0x0A84,	%g5
	movcc	%icc,	%l1,	%i1
loop_769:
	xnor	%l4,	0x170E,	%i2
	edge32ln	%l2,	%g1,	%g4
	fmul8sux16	%f8,	%f14,	%f2
	edge16n	%i5,	%l0,	%o4
	movrlez	%i3,	%l5,	%i7
	tvc	%icc,	0x4
	fbg	%fcc0,	loop_770
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%o3,	loop_771
	fbn,a	%fcc0,	loop_772
loop_770:
	edge8ln	%o1,	%g2,	%i4
	fpadd16s	%f6,	%f2,	%f6
loop_771:
	edge16	%g3,	%g6,	%o6
loop_772:
	srax	%l3,	%i6,	%o7
	array32	%g7,	%o2,	%i0
	sllx	%l6,	0x11,	%o0
	xnorcc	%o5,	%l1,	%g5
	fmul8x16	%f6,	%f22,	%f6
	fones	%f15
	srax	%l4,	0x0A,	%i2
	edge32ln	%l2,	%i1,	%g4
	fpadd16s	%f28,	%f15,	%f30
	fnands	%f5,	%f21,	%f29
	stw	%i5,	[%l7 + 0x08]
	fandnot2s	%f19,	%f12,	%f28
	ldsh	[%l7 + 0x7E],	%l0
	ldstub	[%l7 + 0x2F],	%g1
	smul	%i3,	0x1A09,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,a	%icc,	loop_773
	xorcc	%o4,	0x0CF0,	%i7
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%o1
loop_773:
	tsubcctv	%o3,	0x0F0F,	%i4
	fcmpeq32	%f12,	%f22,	%g2
	tgu	%xcc,	0x3
	fornot2s	%f2,	%f2,	%f29
	fmovrse	%g3,	%f6,	%f28
	fmovsn	%icc,	%f8,	%f30
	mova	%icc,	%o6,	%g6
	array16	%i6,	%o7,	%g7
	tne	%icc,	0x1
	udiv	%l3,	0x0AAE,	%o2
	umul	%l6,	%i0,	%o0
	movrlez	%l1,	%o5,	%g5
	add	%i2,	0x1565,	%l4
	nop
	setx	loop_774,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%xcc,	%l2,	%g4
	fpsub16	%f28,	%f26,	%f4
	udiv	%i5,	0x0204,	%l0
loop_774:
	fpadd32s	%f27,	%f10,	%f4
	tge	%xcc,	0x4
	srax	%g1,	0x02,	%i1
	fmovdvs	%xcc,	%f13,	%f2
	fmovdg	%xcc,	%f0,	%f13
	edge16ln	%l5,	%i3,	%o4
	tcc	%icc,	0x2
	fpmerge	%f25,	%f17,	%f22
	ba,pt	%xcc,	loop_775
	fmovrdgez	%o1,	%f30,	%f28
	fblg,a	%fcc3,	loop_776
	movrgez	%o3,	0x019,	%i7
loop_775:
	fmovdvc	%xcc,	%f24,	%f8
	movrgez	%i4,	0x2EA,	%g3
loop_776:
	std	%f12,	[%l7 + 0x40]
	orncc	%o6,	0x14F3,	%g2
	movcc	%xcc,	%g6,	%o7
	nop
	setx	loop_777,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsl	%xcc,	%f21,	%f7
	ldd	[%l7 + 0x38],	%f12
	call	loop_778
loop_777:
	fpadd32	%f24,	%f8,	%f20
	wr	%g0,	0x22,	%asi
	stwa	%i6,	[%l7 + 0x20] %asi
	membar	#Sync
loop_778:
	edge8	%l3,	%g7,	%l6
	tgu	%xcc,	0x4
	fmovsgu	%xcc,	%f1,	%f27
	sll	%o2,	0x01,	%i0
	call	loop_779
	movvc	%icc,	%o0,	%o5
	be,pt	%icc,	loop_780
	movvs	%icc,	%g5,	%i2
loop_779:
	andn	%l4,	0x1FB3,	%l2
	taddcc	%l1,	0x1CED,	%g4
loop_780:
	nop
	setx	loop_781,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpack32	%f2,	%f16,	%f18
	srlx	%i5,	%l0,	%g1
	udiv	%l5,	0x1932,	%i3
loop_781:
	fzero	%f0
	sllx	%o4,	0x0E,	%i1
	orncc	%o1,	0x136C,	%i7
	udivcc	%i4,	0x0442,	%o3
	movrlez	%o6,	%g2,	%g3
	set	0x58, %l4
	ldxa	[%l7 + %l4] 0x04,	%g6
	fnot2s	%f12,	%f17
	movvs	%xcc,	%i6,	%l3
	movleu	%icc,	%g7,	%l6
	orncc	%o7,	0x0145,	%o2
	fbne	%fcc3,	loop_782
	nop
	setx	loop_783,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	swap	[%l7 + 0x58],	%i0
	umul	%o5,	0x1C57,	%g5
loop_782:
	movle	%icc,	%o0,	%i2
loop_783:
	sdivcc	%l4,	0x1B5D,	%l1
	andcc	%l2,	0x1828,	%i5
	tg	%xcc,	0x7
	stx	%l0,	[%l7 + 0x40]
	xnorcc	%g1,	0x0904,	%g4
	fmovdg	%xcc,	%f26,	%f12
	edge32	%l5,	%i3,	%i1
	fbule,a	%fcc2,	loop_784
	udivx	%o4,	0x1436,	%o1
	ldx	[%l7 + 0x78],	%i7
	movneg	%xcc,	%i4,	%o6
loop_784:
	movneg	%xcc,	%o3,	%g2
	bpos,pt	%icc,	loop_785
	fmovsneg	%xcc,	%f3,	%f16
	tne	%xcc,	0x4
	andncc	%g3,	%g6,	%l3
loop_785:
	bl,a,pn	%xcc,	loop_786
	mulx	%i6,	%g7,	%l6
	fba	%fcc3,	loop_787
	fbn	%fcc3,	loop_788
loop_786:
	fmovse	%icc,	%f13,	%f8
	subccc	%o7,	0x071E,	%i0
loop_787:
	fcmple32	%f12,	%f0,	%o5
loop_788:
	fmovdl	%icc,	%f10,	%f0
	movgu	%icc,	%o2,	%o0
	fsrc1s	%f17,	%f17
	movge	%xcc,	%i2,	%g5
	srlx	%l1,	%l2,	%l4
	fbg,a	%fcc0,	loop_789
	subcc	%i5,	%l0,	%g1
	orn	%l5,	%i3,	%i1
	tg	%icc,	0x3
loop_789:
	array32	%g4,	%o4,	%o1
	movrgez	%i4,	0x282,	%o6
	tcc	%xcc,	0x4
	edge32l	%i7,	%o3,	%g3
	movge	%xcc,	%g2,	%l3
	fones	%f15
	fmovdl	%xcc,	%f16,	%f13
	fmovde	%icc,	%f27,	%f19
	ldd	[%l7 + 0x48],	%i6
	edge16l	%g7,	%g6,	%l6
	membar	0x6F
	edge16	%i0,	%o7,	%o5
	tne	%xcc,	0x7
	fmovrdlez	%o0,	%f4,	%f20
	set	0x30, %g6
	sta	%f12,	[%l7 + %g6] 0x15
	fmovsge	%xcc,	%f10,	%f0
	fmovrdne	%o2,	%f0,	%f12
	edge8ln	%i2,	%l1,	%l2
	alignaddrl	%g5,	%i5,	%l0
	movle	%xcc,	%g1,	%l5
	movrne	%i3,	0x122,	%l4
	tcs	%xcc,	0x0
	fbule,a	%fcc0,	loop_790
	array16	%g4,	%o4,	%o1
	movre	%i1,	%o6,	%i7
	tl	%icc,	0x5
loop_790:
	ldx	[%l7 + 0x30],	%o3
	srlx	%i4,	0x10,	%g2
	udiv	%l3,	0x1519,	%i6
	smulcc	%g3,	%g6,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i0,	%o7,	%l6
	fmovdgu	%icc,	%f22,	%f20
	fnegs	%f1,	%f6
	set	0x60, %g7
	swapa	[%l7 + %g7] 0x89,	%o0
	bpos	loop_791
	mulx	%o5,	0x1B3E,	%i2
	array8	%o2,	%l2,	%g5
	tsubcc	%i5,	%l1,	%g1
loop_791:
	movleu	%xcc,	%l5,	%i3
	smulcc	%l4,	%l0,	%o4
	movl	%xcc,	%o1,	%i1
	bn,a,pt	%xcc,	loop_792
	fmovscs	%icc,	%f25,	%f12
	alignaddr	%g4,	%i7,	%o3
	wr	%g0,	0x19,	%asi
	sta	%f15,	[%l7 + 0x34] %asi
loop_792:
	andn	%i4,	0x05A8,	%o6
	fcmpne32	%f4,	%f12,	%l3
	or	%i6,	0x1ECD,	%g2
	fcmpne16	%f8,	%f0,	%g3
	fandnot2	%f30,	%f0,	%f0
	mova	%xcc,	%g6,	%i0
	fnot1s	%f21,	%f27
	mulscc	%o7,	0x02F3,	%l6
	fbge	%fcc2,	loop_793
	fmul8ulx16	%f26,	%f4,	%f4
	sll	%o0,	0x02,	%o5
	tg	%icc,	0x2
loop_793:
	ldsb	[%l7 + 0x2B],	%i2
	srlx	%o2,	0x0E,	%g7
	bg,a,pn	%icc,	loop_794
	fmovrdgz	%l2,	%f16,	%f28
	bn,pn	%icc,	loop_795
	or	%g5,	%i5,	%l1
loop_794:
	andn	%l5,	%i3,	%l4
	movgu	%icc,	%g1,	%l0
loop_795:
	movvc	%xcc,	%o1,	%i1
	fand	%f8,	%f24,	%f24
	tvc	%xcc,	0x0
	st	%f8,	[%l7 + 0x10]
	fsrc1s	%f29,	%f16
	fpack32	%f4,	%f26,	%f30
	tsubcctv	%o4,	%i7,	%g4
	xorcc	%i4,	%o3,	%l3
	ldsb	[%l7 + 0x33],	%o6
	fpadd32s	%f1,	%f8,	%f0
	ldsw	[%l7 + 0x50],	%g2
	fbuge,a	%fcc0,	loop_796
	bg,a,pt	%xcc,	loop_797
	bcs,pn	%xcc,	loop_798
	tl	%xcc,	0x4
loop_796:
	edge8ln	%i6,	%g6,	%i0
loop_797:
	xnorcc	%g3,	0x08FC,	%o7
loop_798:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%o0,	[%l7 + 0x18] %asi
	udivx	%o5,	0x06CA,	%i2
	stw	%o2,	[%l7 + 0x28]
	orncc	%g7,	0x12CA,	%l6
	fcmpes	%fcc2,	%f19,	%f27
	stx	%g5,	[%l7 + 0x60]
	set	0x4B, %i6
	ldsba	[%l7 + %i6] 0x11,	%l2
	fble	%fcc1,	loop_799
	bvc,a	loop_800
	fblg	%fcc3,	loop_801
	for	%f28,	%f30,	%f12
loop_799:
	edge32ln	%i5,	%l1,	%i3
loop_800:
	umulcc	%l4,	0x0004,	%g1
loop_801:
	tsubcctv	%l5,	0x0013,	%o1
	tcs	%icc,	0x3
	movleu	%icc,	%l0,	%i1
	fmul8x16au	%f31,	%f24,	%f26
	taddcctv	%o4,	0x1587,	%i7
	be,pn	%icc,	loop_802
	fble,a	%fcc3,	loop_803
	fnot2s	%f14,	%f4
	set	0x26, %o2
	lduba	[%l7 + %o2] 0x04,	%i4
loop_802:
	nop
	set	0x0F, %o1
	stba	%o3,	[%l7 + %o1] 0xeb
	membar	#Sync
loop_803:
	subcc	%g4,	0x03B6,	%o6
	fmovsgu	%xcc,	%f31,	%f11
	brlez	%g2,	loop_804
	movl	%xcc,	%l3,	%i6
	be,a	loop_805
	movcc	%icc,	%i0,	%g3
loop_804:
	std	%f20,	[%l7 + 0x30]
	tle	%xcc,	0x6
loop_805:
	bl	%xcc,	loop_806
	movn	%xcc,	%g6,	%o7
	stbar
	set	0x70, %o5
	lda	[%l7 + %o5] 0x15,	%f24
loop_806:
	add	%o0,	%i2,	%o5
	tne	%xcc,	0x3
	srl	%o2,	%g7,	%l6
	tvs	%xcc,	0x7
	movgu	%icc,	%l2,	%g5
	stbar
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x2
	set	0x40, %o0
	swapa	[%l7 + %o0] 0x18,	%i5
	movvc	%xcc,	%l1,	%l4
	alignaddr	%g1,	%l5,	%o1
	xnor	%l0,	0x017E,	%i3
	xor	%o4,	%i1,	%i7
	ldsh	[%l7 + 0x5C],	%o3
	tcs	%icc,	0x0
	movge	%xcc,	%g4,	%o6
	movge	%icc,	%g2,	%i4
	fbo,a	%fcc2,	loop_807
	fxor	%f10,	%f28,	%f14
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%i6
loop_807:
	ld	[%l7 + 0x34],	%f20
	stb	%l3,	[%l7 + 0x70]
	edge8	%i0,	%g3,	%g6
	movcs	%icc,	%o7,	%i2
	fmul8sux16	%f22,	%f18,	%f20
	fones	%f20
	movvs	%icc,	%o0,	%o5
	movle	%icc,	%o2,	%g7
	fbg,a	%fcc2,	loop_808
	movleu	%icc,	%l2,	%g5
	tgu	%icc,	0x6
	fnand	%f22,	%f28,	%f0
loop_808:
	tpos	%icc,	0x3
	ta	%xcc,	0x0
	tneg	%icc,	0x6
	fzeros	%f31
	sth	%l6,	[%l7 + 0x62]
	addcc	%i5,	0x1F2D,	%l1
	set	0x30, %i0
	stda	%l4,	[%l7 + %i0] 0x19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l5,	%g1,	%l0
	fmovdleu	%icc,	%f1,	%f26
	tg	%icc,	0x1
	set	0x45, %g2
	ldsba	[%l7 + %g2] 0x88,	%o1
	bl,a	%xcc,	loop_809
	stx	%i3,	[%l7 + 0x40]
	fands	%f9,	%f17,	%f3
	stx	%i1,	[%l7 + 0x30]
loop_809:
	subc	%i7,	%o4,	%g4
	sub	%o6,	%o3,	%g2
	subccc	%i6,	0x0FAA,	%i4
	bpos,pn	%xcc,	loop_810
	std	%f4,	[%l7 + 0x30]
	tcs	%icc,	0x5
	faligndata	%f30,	%f14,	%f12
loop_810:
	stx	%l3,	[%l7 + 0x78]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x10, %i1
	lduw	[%l7 + %i1],	%i0
	fmovsg	%xcc,	%f6,	%f21
	fsrc2	%f24,	%f22
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%g6
	or	%g3,	0x04C6,	%i2
	be,pn	%icc,	loop_811
	edge16n	%o7,	%o5,	%o2
	fmovrsgz	%o0,	%f19,	%f6
	movrlez	%g7,	%g5,	%l2
loop_811:
	movvs	%icc,	%l6,	%l1
	bleu,pt	%xcc,	loop_812
	movl	%icc,	%i5,	%l4
	tle	%icc,	0x4
	bg	loop_813
loop_812:
	ble,a	%xcc,	loop_814
	andcc	%l5,	%l0,	%o1
	set	0x0C, %i5
	lduha	[%l7 + %i5] 0x0c,	%i3
loop_813:
	brgez	%g1,	loop_815
loop_814:
	mulx	%i1,	0x04B2,	%o4
	set	0x3C, %g3
	lduwa	[%l7 + %g3] 0x80,	%g4
loop_815:
	edge16	%i7,	%o6,	%o3
	fmovspos	%xcc,	%f3,	%f24
	set	0x7E, %g5
	stha	%g2,	[%l7 + %g5] 0x2f
	membar	#Sync
	fnor	%f0,	%f20,	%f26
	fpsub16	%f4,	%f0,	%f8
	sir	0x09BB
	orncc	%i6,	%i4,	%i0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l3,	%g6
	subccc	%i2,	%g3,	%o5
	tsubcctv	%o7,	0x015F,	%o2
	add	%o0,	%g7,	%l2
	bvs,a	%icc,	loop_816
	edge16	%l6,	%l1,	%g5
	tne	%xcc,	0x0
	edge16ln	%i5,	%l5,	%l4
loop_816:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x64] %asi,	%l0
	tle	%xcc,	0x0
	tneg	%icc,	0x4
	fbg	%fcc1,	loop_817
	movpos	%xcc,	%o1,	%i3
	movrgez	%i1,	%o4,	%g4
	fxor	%f0,	%f28,	%f4
loop_817:
	edge16n	%i7,	%g1,	%o3
	fornot1s	%f27,	%f11,	%f2
	subc	%g2,	%i6,	%o6
	fandnot1	%f26,	%f8,	%f26
	movleu	%xcc,	%i4,	%l3
	array8	%g6,	%i0,	%i2
	or	%g3,	0x0E99,	%o7
	umul	%o2,	0x1009,	%o0
	faligndata	%f20,	%f24,	%f22
	movvs	%icc,	%o5,	%g7
	movle	%icc,	%l6,	%l2
	fpsub32	%f22,	%f6,	%f12
	fbe,a	%fcc0,	loop_818
	fmovs	%f10,	%f5
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
loop_818:
	movvs	%xcc,	%l1,	%l5
	fmul8x16au	%f6,	%f8,	%f12
	popc	%i5,	%l0
	bcc	loop_819
	membar	0x6C
	fmul8x16au	%f3,	%f23,	%f14
	brz	%o1,	loop_820
loop_819:
	std	%l4,	[%l7 + 0x68]
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x52] %asi,	%i1
loop_820:
	fsrc1s	%f27,	%f4
	edge32	%i3,	%o4,	%g4
	movcc	%icc,	%i7,	%o3
	fbul,a	%fcc3,	loop_821
	fandnot1	%f30,	%f0,	%f12
	set	0x73, %i3
	stba	%g1,	[%l7 + %i3] 0x0c
loop_821:
	mulscc	%i6,	0x0B24,	%o6
	fandnot2s	%f17,	%f2,	%f29
	fmovscs	%xcc,	%f14,	%f24
	fand	%f30,	%f16,	%f16
	tvs	%icc,	0x0
	stw	%i4,	[%l7 + 0x74]
	fmovrsgz	%l3,	%f16,	%f8
	sub	%g2,	0x1CA7,	%i0
	alignaddrl	%g6,	%i2,	%g3
	bshuffle	%f22,	%f30,	%f18
	fmovdpos	%xcc,	%f26,	%f25
	array8	%o2,	%o0,	%o7
	fcmpes	%fcc1,	%f25,	%f6
	movrgz	%o5,	%g7,	%l2
	fpadd16	%f28,	%f10,	%f16
	addc	%g5,	%l6,	%l1
	fandnot2s	%f19,	%f22,	%f3
	membar	0x5D
	fornot2	%f22,	%f18,	%f2
	tvc	%xcc,	0x6
	fsrc2s	%f7,	%f19
	ldx	[%l7 + 0x38],	%l5
	be,a	loop_822
	fmovscs	%xcc,	%f22,	%f9
	srax	%l0,	%o1,	%i5
	or	%l4,	0x0B57,	%i3
loop_822:
	move	%xcc,	%i1,	%o4
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x19
	movrgz	%i7,	0x0F3,	%o3
	umulcc	%g4,	%g1,	%o6
	subcc	%i6,	%l3,	%g2
	movcs	%icc,	%i0,	%g6
	tn	%xcc,	0x4
	bge,a,pn	%xcc,	loop_823
	taddcc	%i2,	%i4,	%o2
	fmovde	%xcc,	%f31,	%f29
	movg	%xcc,	%o0,	%g3
loop_823:
	bneg,pt	%xcc,	loop_824
	orncc	%o7,	%g7,	%o5
	tcs	%xcc,	0x5
	srax	%l2,	%g5,	%l6
loop_824:
	move	%icc,	%l1,	%l5
	fornot2	%f6,	%f8,	%f12
	fabss	%f2,	%f12
	fcmpgt32	%f0,	%f4,	%l0
	udivx	%o1,	0x0525,	%l4
	fbge,a	%fcc2,	loop_825
	movg	%xcc,	%i3,	%i1
	movpos	%icc,	%i5,	%i7
	movvs	%xcc,	%o3,	%g4
loop_825:
	ldd	[%l7 + 0x30],	%o4
	ta	%xcc,	0x7
	ta	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%g1,	%o6
	tne	%xcc,	0x3
	ble	%icc,	loop_826
	array32	%i6,	%l3,	%g2
	fble,a	%fcc0,	loop_827
	xor	%i0,	%i2,	%i4
loop_826:
	fmovdl	%xcc,	%f22,	%f17
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x0F] %asi,	%g6
loop_827:
	edge32n	%o2,	%g3,	%o0
	set	0x55, %o3
	lduba	[%l7 + %o3] 0x04,	%o7
	fcmpeq16	%f2,	%f4,	%g7
	fnot1	%f10,	%f30
	mova	%xcc,	%l2,	%g5
	movle	%xcc,	%l6,	%l1
	tvc	%xcc,	0x5
	fand	%f26,	%f18,	%f16
	xorcc	%o5,	0x1506,	%l0
	sdivcc	%l5,	0x1D09,	%l4
	membar	0x1B
	array32	%i3,	%i1,	%i5
	tsubcctv	%o1,	0x0153,	%i7
	tle	%icc,	0x4
	xorcc	%g4,	0x15E9,	%o4
	bl,pn	%xcc,	loop_828
	srlx	%g1,	0x08,	%o3
	taddcc	%o6,	0x1D87,	%i6
	xnor	%g2,	%l3,	%i0
loop_828:
	bcc,a	loop_829
	orn	%i2,	%i4,	%g6
	fnand	%f30,	%f12,	%f18
	tvs	%xcc,	0x7
loop_829:
	fmovsvs	%xcc,	%f28,	%f30
	ba,pt	%xcc,	loop_830
	umul	%o2,	%o0,	%o7
	fmovsleu	%xcc,	%f27,	%f14
	movcc	%icc,	%g3,	%g7
loop_830:
	fmovsg	%icc,	%f13,	%f15
	tsubcctv	%l2,	0x13E5,	%g5
	tcc	%icc,	0x3
	andcc	%l6,	0x0FC5,	%o5
	fnors	%f25,	%f20,	%f1
	tpos	%icc,	0x3
	tvs	%xcc,	0x0
	srlx	%l0,	%l1,	%l5
	fbule	%fcc2,	loop_831
	fmovsleu	%icc,	%f3,	%f0
	wr	%g0,	0xe2,	%asi
	stha	%i3,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_831:
	movcc	%xcc,	%i1,	%i5
	fmuld8sux16	%f22,	%f25,	%f22
	call	loop_832
	fmovdgu	%xcc,	%f3,	%f6
	wr	%g0,	0x89,	%asi
	stba	%o1,	[%l7 + 0x44] %asi
loop_832:
	lduw	[%l7 + 0x0C],	%i7
	faligndata	%f20,	%f14,	%f28
	tleu	%xcc,	0x2
	fsrc1s	%f6,	%f7
	srl	%l4,	0x18,	%o4
	mova	%xcc,	%g4,	%g1
	fsrc2	%f18,	%f4
	fmovrslez	%o6,	%f13,	%f27
	ldd	[%l7 + 0x08],	%i6
	fmovrse	%o3,	%f6,	%f13
	fnors	%f2,	%f12,	%f31
	fsrc1	%f30,	%f22
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x2E] %asi,	%l3
	bn,a	loop_833
	movge	%icc,	%g2,	%i2
	addcc	%i4,	%i0,	%o2
	fmovrsgez	%g6,	%f14,	%f15
loop_833:
	movrgez	%o0,	0x262,	%o7
	movgu	%icc,	%g7,	%g3
	brlz,a	%l2,	loop_834
	addc	%g5,	0x173C,	%o5
	fmovd	%f22,	%f24
	udivx	%l0,	0x10F4,	%l6
loop_834:
	add	%l5,	%l1,	%i1
	edge32l	%i5,	%o1,	%i3
	flush	%l7 + 0x44
	movleu	%xcc,	%i7,	%l4
	call	loop_835
	tg	%xcc,	0x7
	edge32ln	%g4,	%o4,	%o6
	bne,a	%icc,	loop_836
loop_835:
	fpsub16s	%f16,	%f6,	%f15
	stx	%i6,	[%l7 + 0x18]
	fones	%f14
loop_836:
	fmovdleu	%icc,	%f11,	%f7
	fmovdg	%icc,	%f24,	%f23
	te	%xcc,	0x5
	ble,a,pn	%icc,	loop_837
	bgu,a	%xcc,	loop_838
	st	%f28,	[%l7 + 0x0C]
	udiv	%o3,	0x0683,	%g1
loop_837:
	udiv	%l3,	0x1239,	%i2
loop_838:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i4,	0x126B,	%g2
	fpsub32	%f14,	%f30,	%f12
	bne,a	loop_839
	edge32l	%i0,	%o2,	%o0
	fxnor	%f16,	%f10,	%f28
	ldsb	[%l7 + 0x11],	%o7
loop_839:
	fpadd32	%f24,	%f30,	%f16
	fabsd	%f18,	%f14
	fmovse	%icc,	%f8,	%f15
	fors	%f0,	%f20,	%f22
	fpadd32s	%f8,	%f7,	%f14
	ta	%icc,	0x1
	fmul8x16al	%f1,	%f20,	%f24
	tvc	%icc,	0x6
	ldd	[%l7 + 0x78],	%g6
	taddcc	%g6,	0x04AB,	%l2
	fmovdgu	%icc,	%f10,	%f27
	bgu,pn	%icc,	loop_840
	tn	%xcc,	0x7
	sub	%g3,	0x18D6,	%o5
	edge32l	%g5,	%l0,	%l5
loop_840:
	membar	0x0B
	fmul8ulx16	%f8,	%f18,	%f4
	tsubcc	%l6,	0x0D94,	%l1
	fcmpne16	%f18,	%f2,	%i1
	te	%xcc,	0x4
	movrne	%o1,	0x080,	%i3
	srl	%i5,	0x11,	%l4
	fcmpgt32	%f26,	%f22,	%i7
	orcc	%o4,	0x1024,	%o6
	fbg,a	%fcc3,	loop_841
	array16	%g4,	%o3,	%i6
	brgez,a	%g1,	loop_842
	mulx	%i2,	0x0B1D,	%l3
loop_841:
	fand	%f10,	%f18,	%f22
	ldd	[%l7 + 0x28],	%f2
loop_842:
	fmovrdgez	%i4,	%f22,	%f26
	addc	%i0,	0x08EB,	%o2
	fmovda	%icc,	%f24,	%f4
	brz	%o0,	loop_843
	fmovscs	%xcc,	%f0,	%f23
	tn	%icc,	0x2
	tl	%xcc,	0x7
loop_843:
	tvs	%xcc,	0x5
	array32	%g2,	%o7,	%g7
	edge8l	%l2,	%g6,	%g3
	movl	%icc,	%o5,	%g5
	fpadd16s	%f2,	%f18,	%f13
	fpadd16	%f2,	%f18,	%f8
	edge16l	%l0,	%l5,	%l1
	alignaddrl	%i1,	%l6,	%i3
	fmovdn	%icc,	%f1,	%f25
	fble,a	%fcc2,	loop_844
	lduw	[%l7 + 0x48],	%o1
	fpack16	%f22,	%f8
	movre	%i5,	0x205,	%i7
loop_844:
	fbl	%fcc3,	loop_845
	fmovsvs	%xcc,	%f18,	%f7
	addc	%l4,	0x14E5,	%o4
	fblg,a	%fcc2,	loop_846
loop_845:
	ta	%xcc,	0x6
	fmovrslez	%o6,	%f3,	%f31
	fbn	%fcc1,	loop_847
loop_846:
	movneg	%xcc,	%o3,	%i6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x4B] %asi,	%g1
loop_847:
	fexpand	%f24,	%f24
	fornot2s	%f26,	%f15,	%f0
	srl	%i2,	%g4,	%i4
	std	%f28,	[%l7 + 0x48]
	bcs	%icc,	loop_848
	mulx	%i0,	%o2,	%o0
	fmovdpos	%xcc,	%f15,	%f19
	fmovrsne	%l3,	%f30,	%f19
loop_848:
	fbu,a	%fcc1,	loop_849
	fcmpeq32	%f14,	%f0,	%g2
	nop
	setx	loop_850,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnands	%f22,	%f27,	%f15
loop_849:
	tvc	%icc,	0x7
	fmovsneg	%xcc,	%f7,	%f5
loop_850:
	lduh	[%l7 + 0x6C],	%o7
	fcmpeq32	%f12,	%f20,	%g7
	movleu	%xcc,	%g6,	%g3
	addcc	%l2,	0x112E,	%g5
	ldd	[%l7 + 0x58],	%l0
	fnot1s	%f13,	%f26
	ldd	[%l7 + 0x30],	%f24
	movre	%l5,	0x398,	%l1
	tle	%xcc,	0x0
	and	%i1,	0x1536,	%l6
	xnorcc	%o5,	%o1,	%i5
	movpos	%icc,	%i3,	%l4
	fmovdvc	%icc,	%f25,	%f10
	xor	%i7,	0x1318,	%o4
	tcc	%xcc,	0x1
	fmul8x16au	%f24,	%f1,	%f6
	fcmpne32	%f24,	%f18,	%o3
	fbe,a	%fcc0,	loop_851
	nop
	setx	loop_852,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	call	loop_853
	edge32	%i6,	%o6,	%i2
loop_851:
	bleu,a	loop_854
loop_852:
	fxors	%f10,	%f26,	%f20
loop_853:
	fones	%f15
	fba	%fcc3,	loop_855
loop_854:
	move	%xcc,	%g4,	%g1
	bcs,a,pt	%icc,	loop_856
	fmovsn	%xcc,	%f9,	%f2
loop_855:
	ldsh	[%l7 + 0x6E],	%i0
	bne,pt	%icc,	loop_857
loop_856:
	fmovde	%icc,	%f22,	%f23
	sll	%i4,	%o2,	%l3
	sdivcc	%g2,	0x0199,	%o0
loop_857:
	fnot2	%f24,	%f2
	smul	%g7,	%g6,	%o7
	ld	[%l7 + 0x70],	%f6
	srax	%g3,	%l2,	%g5
	fmul8sux16	%f24,	%f16,	%f30
	brlz	%l0,	loop_858
	fzeros	%f8
	tg	%icc,	0x0
	subccc	%l1,	%l5,	%l6
loop_858:
	subccc	%o5,	0x15A9,	%i1
	tvc	%icc,	0x1
	fba,a	%fcc2,	loop_859
	brnz	%i5,	loop_860
	add	%o1,	%i3,	%i7
	fmovda	%xcc,	%f12,	%f29
loop_859:
	fbg	%fcc3,	loop_861
loop_860:
	movneg	%xcc,	%l4,	%o4
	array32	%o3,	%o6,	%i6
	srax	%i2,	%g1,	%i0
loop_861:
	fmovsleu	%icc,	%f15,	%f26
	udiv	%g4,	0x0A48,	%o2
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l3,	%i4
	subc	%g2,	%o0,	%g6
	sllx	%g7,	0x05,	%g3
	fmovsvs	%xcc,	%f16,	%f0
	fpadd16s	%f18,	%f10,	%f11
	fcmple16	%f2,	%f8,	%o7
	bn,pt	%xcc,	loop_862
	fandnot2	%f8,	%f14,	%f10
	sll	%g5,	%l0,	%l2
	edge8ln	%l1,	%l6,	%l5
loop_862:
	movl	%icc,	%i1,	%i5
	xnor	%o5,	%o1,	%i3
	andncc	%i7,	%l4,	%o3
	udiv	%o4,	0x131C,	%i6
	add	%o6,	0x0D88,	%i2
	fmul8x16	%f18,	%f16,	%f12
	ldsh	[%l7 + 0x74],	%g1
	mulscc	%i0,	0x08DD,	%g4
	fandnot1s	%f2,	%f8,	%f5
	movrne	%l3,	%o2,	%g2
	bge	loop_863
	smulcc	%o0,	%g6,	%i4
	movg	%xcc,	%g7,	%o7
	fpadd32	%f30,	%f30,	%f18
loop_863:
	fbu	%fcc0,	loop_864
	ba	%xcc,	loop_865
	fbn,a	%fcc3,	loop_866
	fnands	%f21,	%f19,	%f4
loop_864:
	fnot1	%f0,	%f22
loop_865:
	fbl,a	%fcc3,	loop_867
loop_866:
	fandnot1	%f18,	%f28,	%f8
	ldd	[%l7 + 0x48],	%g4
	brlez	%g3,	loop_868
loop_867:
	tge	%icc,	0x0
	brgez	%l0,	loop_869
	fmovrdlz	%l1,	%f0,	%f16
loop_868:
	fmovde	%xcc,	%f24,	%f12
	umul	%l2,	0x1049,	%l6
loop_869:
	umulcc	%i1,	0x129E,	%i5
	call	loop_870
	smul	%o5,	0x01DE,	%l5
	fcmple16	%f22,	%f24,	%i3
	sethi	0x0139,	%o1
loop_870:
	subcc	%i7,	%o3,	%o4
	edge32	%l4,	%o6,	%i6
	movvc	%xcc,	%g1,	%i2
	sir	0x1C1F
	tne	%icc,	0x5
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x0C] %asi,	%f13
	te	%icc,	0x2
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x74] %asi,	%g4
	fbne	%fcc2,	loop_871
	fbug	%fcc0,	loop_872
	sethi	0x0211,	%l3
	tleu	%icc,	0x4
loop_871:
	fsrc1	%f22,	%f20
loop_872:
	fones	%f4
	array8	%o2,	%i0,	%o0
	fmovdleu	%icc,	%f31,	%f3
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x18] %asi,	%g2
	edge32	%g6,	%i4,	%g7
	sdiv	%o7,	0x0A92,	%g3
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x1C] %asi,	%g5
	fnor	%f4,	%f4,	%f28
	movre	%l0,	0x0C9,	%l2
	ba,a,pt	%xcc,	loop_873
	fnot2	%f0,	%f4
	brnz	%l6,	loop_874
	siam	0x0
loop_873:
	udiv	%i1,	0x14D5,	%i5
	popc	%o5,	%l5
loop_874:
	fpack32	%f6,	%f28,	%f20
	tgu	%icc,	0x3
	brgez	%l1,	loop_875
	fmovsle	%icc,	%f23,	%f7
	fpadd16s	%f19,	%f27,	%f10
	tcs	%icc,	0x3
loop_875:
	fmovdgu	%xcc,	%f9,	%f6
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x15,	%f0
	fexpand	%f12,	%f16
	edge16	%o1,	%i7,	%i3
	fabss	%f14,	%f12
	fble	%fcc0,	loop_876
	movrlez	%o3,	%o4,	%o6
	fornot1	%f4,	%f26,	%f14
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i6,	%g1
loop_876:
	fbg,a	%fcc2,	loop_877
	tpos	%xcc,	0x3
	fmovsvs	%icc,	%f30,	%f25
	edge8	%i2,	%g4,	%l4
loop_877:
	sethi	0x12BC,	%l3
	brz	%o2,	loop_878
	sdiv	%o0,	0x1A9B,	%i0
	ldd	[%l7 + 0x30],	%g6
	fpsub32s	%f14,	%f12,	%f21
loop_878:
	sub	%g2,	%g7,	%o7
	addc	%i4,	0x0DC9,	%g5
	ldd	[%l7 + 0x68],	%f14
	te	%xcc,	0x0
	fnand	%f20,	%f4,	%f24
	membar	0x3C
	srlx	%g3,	0x15,	%l0
	popc	%l6,	%i1
	edge32l	%l2,	%i5,	%o5
	fbl,a	%fcc3,	loop_879
	udivcc	%l1,	0x02D0,	%o1
	ldstub	[%l7 + 0x6C],	%l5
	movle	%icc,	%i7,	%i3
loop_879:
	movrlz	%o3,	%o4,	%o6
	tleu	%icc,	0x4
	edge32	%g1,	%i6,	%g4
	ldsb	[%l7 + 0x6B],	%l4
	fbug	%fcc1,	loop_880
	te	%icc,	0x2
	fbo	%fcc2,	loop_881
	tpos	%icc,	0x6
loop_880:
	edge16n	%l3,	%o2,	%o0
	sub	%i0,	%i2,	%g2
loop_881:
	bgu,a	%icc,	loop_882
	tle	%icc,	0x6
	edge16n	%g6,	%o7,	%g7
	movre	%g5,	0x253,	%i4
loop_882:
	subccc	%l0,	%g3,	%i1
	tvs	%icc,	0x6
	and	%l2,	%i5,	%l6
	add	%l1,	0x1165,	%o1
	edge8l	%o5,	%i7,	%l5
	fbue	%fcc2,	loop_883
	fbule	%fcc1,	loop_884
	nop
	set	0x5F, %l6
	ldstub	[%l7 + %l6],	%i3
	fblg,a	%fcc0,	loop_885
loop_883:
	movg	%icc,	%o3,	%o6
loop_884:
	array8	%g1,	%o4,	%g4
	fand	%f16,	%f4,	%f26
loop_885:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%xcc,	%f8,	%f17
	tge	%icc,	0x2
	fmovdl	%xcc,	%f16,	%f24
	alignaddrl	%i6,	%l3,	%l4
	alignaddrl	%o2,	%i0,	%o0
	sethi	0x06C9,	%g2
	te	%icc,	0x4
	movvc	%xcc,	%i2,	%o7
	edge8l	%g7,	%g6,	%g5
	set	0x08, %i4
	stda	%i4,	[%l7 + %i4] 0x27
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg	loop_886
	ldsh	[%l7 + 0x38],	%l0
	taddcc	%g3,	%i1,	%l2
	sra	%l6,	0x03,	%i5
loop_886:
	bl,pn	%xcc,	loop_887
	fsrc2	%f14,	%f0
	fpadd32	%f12,	%f6,	%f4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%o5
loop_887:
	movn	%icc,	%i7,	%l1
	bgu,a	loop_888
	movleu	%icc,	%i3,	%o3
	movn	%xcc,	%o6,	%g1
	fbue	%fcc2,	loop_889
loop_888:
	fandnot2s	%f22,	%f30,	%f31
	movg	%xcc,	%l5,	%g4
	fsrc2s	%f4,	%f31
loop_889:
	bvs,pt	%icc,	loop_890
	movrgz	%i6,	0x261,	%l3
	fsrc1	%f28,	%f8
	bne	loop_891
loop_890:
	or	%o4,	%o2,	%l4
	ldsb	[%l7 + 0x65],	%i0
	fmovsvc	%icc,	%f17,	%f0
loop_891:
	umul	%o0,	%g2,	%o7
	nop
	set	0x68, %l2
	std	%i2,	[%l7 + %l2]
	ldx	[%l7 + 0x68],	%g6
	fbl,a	%fcc0,	loop_892
	edge8	%g5,	%i4,	%g7
	membar	0x20
	bgu,a	%xcc,	loop_893
loop_892:
	movneg	%xcc,	%l0,	%g3
	set	0x76, %o4
	lduha	[%l7 + %o4] 0x0c,	%i1
loop_893:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x30] %asi,	%l6
	movge	%xcc,	%l2,	%i5
	tleu	%xcc,	0x5
	fmovrslez	%o5,	%f26,	%f5
	tpos	%icc,	0x2
	fmovdl	%icc,	%f3,	%f11
	movl	%xcc,	%i7,	%o1
	mulscc	%l1,	%i3,	%o6
	sir	0x11B9
	fbge,a	%fcc3,	loop_894
	fpadd32	%f14,	%f4,	%f0
	fnegs	%f2,	%f13
	fmovdne	%icc,	%f11,	%f1
loop_894:
	fmovdcs	%icc,	%f22,	%f30
	tne	%icc,	0x3
	fandnot1	%f20,	%f24,	%f24
	movpos	%xcc,	%o3,	%g1
	tne	%xcc,	0x7
	nop
	setx	loop_895,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%g4,	%i6,	%l5
	fmovsvs	%icc,	%f10,	%f4
	orcc	%l3,	%o2,	%o4
loop_895:
	fnot1	%f6,	%f20
	movrlez	%i0,	%o0,	%l4
	udiv	%o7,	0x1E7B,	%g2
	tne	%xcc,	0x2
	movn	%xcc,	%i2,	%g5
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x88
	xnor	%g6,	0x1CCA,	%i4
	add	%l0,	0x1A8C,	%g3
	sdiv	%g7,	0x1D44,	%i1
	fmovrsgz	%l6,	%f17,	%f5
	fexpand	%f10,	%f20
	fmovsgu	%xcc,	%f7,	%f5
	fexpand	%f0,	%f14
	sll	%l2,	%o5,	%i5
	tn	%xcc,	0x7
	andncc	%i7,	%l1,	%o1
	edge16ln	%o6,	%i3,	%g1
	umulcc	%g4,	%o3,	%i6
	ta	%xcc,	0x4
	tleu	%icc,	0x6
	tl	%icc,	0x0
	movrlez	%l5,	0x0A4,	%l3
	ldd	[%l7 + 0x30],	%o4
	stw	%i0,	[%l7 + 0x64]
	ldsw	[%l7 + 0x24],	%o2
	sub	%o0,	%l4,	%g2
	fands	%f11,	%f11,	%f11
	fcmpeq32	%f16,	%f18,	%o7
	bne,a,pn	%xcc,	loop_896
	bvc,pt	%icc,	loop_897
	addccc	%g5,	0x14E9,	%g6
	umulcc	%i4,	0x08B5,	%i2
loop_896:
	nop
	setx	loop_898,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_897:
	edge16n	%g3,	%g7,	%l0
	edge8	%l6,	%l2,	%i1
	fone	%f24
loop_898:
	umulcc	%i5,	%i7,	%o5
	bcs,a,pn	%icc,	loop_899
	orcc	%l1,	%o1,	%o6
	set	0x5C, %o6
	lduwa	[%l7 + %o6] 0x80,	%i3
loop_899:
	membar	0x4A
	sub	%g1,	%o3,	%i6
	fabss	%f23,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f12,	%f19,	%f24
	fabss	%f14,	%f17
	edge32n	%l5,	%l3,	%o4
	addc	%g4,	%o2,	%o0
	array8	%i0,	%g2,	%l4
	bpos	loop_900
	bpos,pn	%icc,	loop_901
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x23] %asi,	%g5
loop_900:
	fbule	%fcc0,	loop_902
loop_901:
	edge8ln	%g6,	%o7,	%i2
	movrlz	%g3,	%i4,	%g7
	brgz	%l6,	loop_903
loop_902:
	orcc	%l0,	0x1DD5,	%l2
	addc	%i1,	0x111B,	%i5
	siam	0x0
loop_903:
	addcc	%i7,	%o5,	%o1
	fbl,a	%fcc1,	loop_904
	te	%icc,	0x5
	fmuld8sux16	%f4,	%f20,	%f8
	fbug	%fcc0,	loop_905
loop_904:
	movrgz	%o6,	0x3D2,	%i3
	bvs,a,pn	%icc,	loop_906
	fbge,a	%fcc1,	loop_907
loop_905:
	tgu	%icc,	0x3
	movleu	%icc,	%g1,	%l1
loop_906:
	fornot1	%f0,	%f16,	%f0
loop_907:
	tvc	%icc,	0x3
	prefetch	[%l7 + 0x50],	 0x3
	movrgz	%o3,	%l5,	%i6
	fmovsg	%icc,	%f22,	%f22
	tg	%xcc,	0x3
	set	0x20, %l1
	swapa	[%l7 + %l1] 0x89,	%o4
	swap	[%l7 + 0x38],	%l3
	edge8	%o2,	%o0,	%i0
	sll	%g4,	0x05,	%g2
	srl	%g5,	%g6,	%o7
	fcmpne32	%f24,	%f18,	%l4
	fpack32	%f16,	%f16,	%f12
	taddcc	%g3,	0x1404,	%i2
	tleu	%xcc,	0x1
	udiv	%g7,	0x1DD6,	%i4
	fand	%f6,	%f12,	%f24
	movvs	%xcc,	%l6,	%l0
	set	0x73, %l5
	ldstuba	[%l7 + %l5] 0x88,	%l2
	srl	%i5,	%i1,	%o5
	movcs	%xcc,	%i7,	%o6
	tg	%xcc,	0x1
	orcc	%i3,	0x1419,	%o1
	tcc	%xcc,	0x7
	tvs	%icc,	0x3
	movneg	%icc,	%l1,	%g1
	fxnors	%f28,	%f26,	%f22
	ldd	[%l7 + 0x38],	%l4
	fmul8x16au	%f15,	%f9,	%f14
	addc	%i6,	0x1ABD,	%o4
	andcc	%l3,	0x154B,	%o3
	fnot1	%f28,	%f0
	movge	%icc,	%o0,	%i0
	movneg	%xcc,	%o2,	%g4
	fornot2	%f18,	%f8,	%f8
	tcs	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
	addcc	%g6,	%o7,	%g2
	subccc	%g3,	0x0ECD,	%i2
	movne	%xcc,	%g7,	%i4
	stbar
	ldd	[%l7 + 0x08],	%l4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%l0
	fones	%f9
	orn	%i5,	0x0A56,	%i1
	stb	%l2,	[%l7 + 0x6E]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o5,	%o6,	%i3
	pdist	%f20,	%f10,	%f4
	ble,a,pn	%icc,	loop_908
	orn	%i7,	%l1,	%g1
	edge32ln	%l5,	%i6,	%o4
	fmovrsne	%o1,	%f12,	%f3
loop_908:
	stw	%l3,	[%l7 + 0x2C]
	nop
	setx	loop_909,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tg	%icc,	0x0
	te	%xcc,	0x3
	tsubcc	%o0,	%o3,	%i0
loop_909:
	xnor	%g4,	0x1706,	%o2
	fbug	%fcc2,	loop_910
	array32	%g6,	%g5,	%g2
	tsubcc	%o7,	0x092D,	%g3
	fpack16	%f18,	%f23
loop_910:
	orn	%i2,	%g7,	%i4
	fmovrsgez	%l6,	%f9,	%f22
	siam	0x3
	brgez,a	%l0,	loop_911
	fmovsn	%icc,	%f16,	%f11
	faligndata	%f10,	%f14,	%f24
	fbe,a	%fcc1,	loop_912
loop_911:
	std	%i4,	[%l7 + 0x10]
	sethi	0x0EB6,	%i1
	edge16n	%l2,	%l4,	%o5
loop_912:
	fmovdl	%icc,	%f0,	%f29
	and	%o6,	0x1C79,	%i3
	nop
	setx	loop_913,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%icc,	0x4
	add	%l1,	0x1AC7,	%g1
	siam	0x6
loop_913:
	fble,a	%fcc3,	loop_914
	tge	%icc,	0x6
	and	%i7,	0x07D4,	%i6
	tn	%icc,	0x5
loop_914:
	fmul8x16al	%f0,	%f19,	%f26
	edge32ln	%l5,	%o1,	%o4
	fpsub16	%f28,	%f10,	%f30
	bgu,pn	%xcc,	loop_915
	xnor	%l3,	0x0DD2,	%o0
	addcc	%i0,	0x0F9F,	%g4
	tsubcctv	%o3,	0x0347,	%o2
loop_915:
	array16	%g6,	%g5,	%g2
	tcc	%icc,	0x0
	fbn,a	%fcc3,	loop_916
	fnegs	%f26,	%f2
	srl	%o7,	%g3,	%i2
	movne	%xcc,	%g7,	%l6
loop_916:
	sllx	%l0,	%i4,	%i5
	edge8ln	%l2,	%l4,	%i1
	umulcc	%o6,	%o5,	%l1
	sdivcc	%i3,	0x00DC,	%i7
	udivcc	%i6,	0x19AA,	%l5
	sllx	%o1,	%g1,	%o4
	bge,a,pt	%xcc,	loop_917
	subc	%l3,	%o0,	%g4
	subcc	%i0,	0x0A0B,	%o2
	srl	%o3,	0x10,	%g6
loop_917:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x40] %asi,	%g5
	popc	0x1315,	%g2
	fpadd32	%f4,	%f4,	%f10
	fmuld8ulx16	%f3,	%f21,	%f26
	tn	%icc,	0x7
	smul	%g3,	0x0AD0,	%o7
	sdivcc	%g7,	0x0751,	%i2
	srax	%l0,	%l6,	%i5
	movle	%icc,	%i4,	%l2
	fbul,a	%fcc1,	loop_918
	for	%f20,	%f12,	%f10
	fmovsvs	%xcc,	%f25,	%f7
	fbne	%fcc2,	loop_919
loop_918:
	alignaddrl	%i1,	%o6,	%o5
	edge16ln	%l4,	%l1,	%i7
	xor	%i6,	%i3,	%l5
loop_919:
	sdivx	%o1,	0x0D32,	%g1
	ldx	[%l7 + 0x38],	%o4
	fmovsn	%icc,	%f10,	%f8
	tsubcc	%l3,	%g4,	%o0
	sdiv	%i0,	0x1C8A,	%o3
	movle	%icc,	%o2,	%g5
	edge8ln	%g6,	%g3,	%g2
	sll	%g7,	%i2,	%l0
	edge16	%o7,	%i5,	%l6
	membar	0x2D
	fnor	%f2,	%f24,	%f28
	smul	%i4,	0x0BDE,	%i1
	sir	0x02C3
	movne	%icc,	%l2,	%o5
	tpos	%icc,	0x3
	srlx	%o6,	%l4,	%l1
	brlez,a	%i7,	loop_920
	or	%i6,	%l5,	%i3
	flush	%l7 + 0x48
	tcs	%xcc,	0x0
loop_920:
	fpadd16	%f10,	%f16,	%f14
	tcc	%icc,	0x5
	taddcc	%g1,	0x1F16,	%o4
	fbuge	%fcc0,	loop_921
	fbul	%fcc1,	loop_922
	fbn	%fcc3,	loop_923
	tgu	%icc,	0x4
loop_921:
	fmovsvs	%xcc,	%f18,	%f3
loop_922:
	movcs	%icc,	%l3,	%o1
loop_923:
	movrlz	%g4,	0x158,	%o0
	sllx	%o3,	%o2,	%i0
	bg	loop_924
	array16	%g5,	%g3,	%g6
	umulcc	%g7,	0x15C3,	%g2
	fba	%fcc0,	loop_925
loop_924:
	subc	%l0,	0x0549,	%i2
	fmovde	%xcc,	%f21,	%f10
	umul	%o7,	%l6,	%i5
loop_925:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x25] %asi,	%i4
	lduw	[%l7 + 0x4C],	%i1
	movcc	%icc,	%o5,	%o6
	udiv	%l2,	0x0E4F,	%l1
	and	%l4,	0x0FB5,	%i6
	pdist	%f14,	%f16,	%f10
	tvc	%xcc,	0x1
	sdivcc	%l5,	0x0150,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g1,	%i7,	%o4
	bge,a,pn	%xcc,	loop_926
	fbn,a	%fcc3,	loop_927
	edge8	%o1,	%l3,	%o0
	alignaddrl	%o3,	%g4,	%o2
loop_926:
	tle	%icc,	0x0
loop_927:
	bcc,a	loop_928
	bgu	loop_929
	subccc	%i0,	%g3,	%g6
	set	0x26, %o7
	lduba	[%l7 + %o7] 0x80,	%g5
loop_928:
	sra	%g7,	%g2,	%i2
loop_929:
	fcmpeq32	%f0,	%f20,	%o7
	movge	%icc,	%l6,	%i5
	move	%icc,	%i4,	%i1
	movpos	%icc,	%l0,	%o5
	fxnors	%f23,	%f4,	%f29
	ldsb	[%l7 + 0x59],	%o6
	fmovdgu	%xcc,	%f20,	%f18
	movneg	%xcc,	%l2,	%l4
	fmovrdlez	%i6,	%f22,	%f22
	edge16ln	%l1,	%i3,	%l5
	orncc	%i7,	0x020B,	%g1
	fpadd16s	%f19,	%f12,	%f12
	fbg,a	%fcc3,	loop_930
	fmovsl	%xcc,	%f11,	%f17
	tge	%icc,	0x0
	fmovrslz	%o1,	%f18,	%f13
loop_930:
	ldsb	[%l7 + 0x73],	%l3
	fpmerge	%f9,	%f3,	%f28
	fpadd16	%f4,	%f30,	%f8
	bl,a,pt	%xcc,	loop_931
	mova	%icc,	%o4,	%o3
	te	%xcc,	0x3
	edge32n	%g4,	%o0,	%i0
loop_931:
	edge32	%o2,	%g3,	%g6
	udiv	%g5,	0x0139,	%g7
	fmovrdgz	%i2,	%f28,	%f30
	fcmpne32	%f26,	%f0,	%o7
	fbul,a	%fcc3,	loop_932
	fandnot1	%f4,	%f10,	%f22
	edge32	%g2,	%l6,	%i5
	set	0x50, %g4
	stwa	%i1,	[%l7 + %g4] 0x15
loop_932:
	bcs,a	%icc,	loop_933
	fnand	%f26,	%f10,	%f18
	array8	%l0,	%o5,	%i4
	bvs,a,pn	%icc,	loop_934
loop_933:
	movvc	%icc,	%o6,	%l4
	tvc	%icc,	0x0
	mulscc	%l2,	%l1,	%i6
loop_934:
	fmovrsne	%l5,	%f23,	%f21
	or	%i3,	%g1,	%o1
	mulx	%l3,	%i7,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g4,	%o4,	%i0
	fxors	%f31,	%f25,	%f30
	fabsd	%f14,	%f10
	tpos	%xcc,	0x0
	set	0x1F, %i2
	lduba	[%l7 + %i2] 0x11,	%o0
	stbar
	edge32n	%o2,	%g3,	%g5
	bn,a,pt	%icc,	loop_935
	movne	%xcc,	%g6,	%g7
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%i2
loop_935:
	tne	%icc,	0x3
	edge8	%o7,	%l6,	%i5
	taddcctv	%g2,	%i1,	%o5
	bge,pn	%icc,	loop_936
	edge16n	%l0,	%o6,	%i4
	stb	%l4,	[%l7 + 0x18]
	sra	%l2,	0x0E,	%l1
loop_936:
	fnegd	%f0,	%f28
	tvs	%xcc,	0x2
	array16	%i6,	%l5,	%i3
	st	%f24,	[%l7 + 0x24]
	movcc	%xcc,	%g1,	%o1
	brgz,a	%l3,	loop_937
	edge16n	%o3,	%g4,	%i7
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o4
loop_937:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f18,	%f17
	set	0x70, %l4
	ldxa	[%l7 + %l4] 0x14,	%i0
	srlx	%o0,	%g3,	%g5
	fbug	%fcc2,	loop_938
	tvs	%xcc,	0x7
	bvs,pn	%xcc,	loop_939
	movgu	%icc,	%g6,	%g7
loop_938:
	nop
	set	0x5C, %g6
	swapa	[%l7 + %g6] 0x89,	%o2
loop_939:
	fxnors	%f17,	%f18,	%f28
	fornot1	%f6,	%f22,	%f8
	set	0x18, %g7
	lda	[%l7 + %g7] 0x04,	%f1
	srax	%i2,	0x1B,	%o7
	addccc	%l6,	0x08E3,	%i5
	movneg	%xcc,	%i1,	%o5
	fbne,a	%fcc1,	loop_940
	brnz,a	%l0,	loop_941
	movrlz	%o6,	0x30B,	%i4
	te	%icc,	0x3
loop_940:
	fandnot1s	%f26,	%f5,	%f31
loop_941:
	fsrc2	%f30,	%f0
	set	0x50, %l0
	lduha	[%l7 + %l0] 0x04,	%l4
	andncc	%g2,	%l1,	%i6
	udivcc	%l5,	0x1365,	%l2
	subccc	%i3,	0x1049,	%g1
	set	0x6C, %i6
	lda	[%l7 + %i6] 0x10,	%f28
	subccc	%o1,	%l3,	%g4
	fmovdg	%xcc,	%f13,	%f17
	subc	%i7,	%o4,	%i0
	faligndata	%f2,	%f12,	%f16
	fmovsg	%icc,	%f24,	%f24
	xnor	%o0,	%g3,	%g5
	tcs	%xcc,	0x0
	mulscc	%g6,	%g7,	%o3
	fbul,a	%fcc1,	loop_942
	add	%i2,	%o2,	%l6
	edge32	%o7,	%i5,	%o5
	sll	%l0,	0x1A,	%o6
loop_942:
	fbuge	%fcc0,	loop_943
	movge	%icc,	%i4,	%l4
	tvs	%xcc,	0x5
	subc	%i1,	0x0B7A,	%l1
loop_943:
	tsubcc	%g2,	%l5,	%i6
	fbl	%fcc3,	loop_944
	fbule	%fcc3,	loop_945
	array16	%i3,	%l2,	%o1
	fpadd16	%f2,	%f6,	%f0
loop_944:
	fmovrdgz	%g1,	%f14,	%f8
loop_945:
	fcmpeq16	%f2,	%f8,	%l3
	movl	%xcc,	%g4,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu	%icc,	loop_946
	fexpand	%f10,	%f4
	udiv	%i0,	0x036C,	%o0
	udivcc	%i7,	0x105C,	%g3
loop_946:
	edge32	%g6,	%g5,	%g7
	tcc	%icc,	0x7
	fnot1	%f16,	%f18
	tleu	%xcc,	0x4
	tl	%icc,	0x5
	bcs,a	loop_947
	edge16l	%o3,	%i2,	%o2
	set	0x12, %o2
	ldstuba	[%l7 + %o2] 0x0c,	%o7
loop_947:
	nop
	set	0x4C, %o1
	lda	[%l7 + %o1] 0x0c,	%f3
	movrlez	%i5,	0x270,	%l6
	call	loop_948
	xnor	%l0,	0x14CC,	%o6
	sra	%i4,	%l4,	%i1
	mulscc	%o5,	0x06E1,	%g2
loop_948:
	sdiv	%l1,	0x124A,	%i6
	edge32ln	%i3,	%l2,	%o1
	ldsw	[%l7 + 0x40],	%l5
	add	%g1,	0x1AB3,	%g4
	tgu	%icc,	0x2
	popc	%o4,	%i0
	umulcc	%o0,	0x131F,	%i7
	fnor	%f16,	%f8,	%f22
	xnorcc	%g3,	%l3,	%g5
	set	0x60, %o5
	ldswa	[%l7 + %o5] 0x80,	%g7
	srax	%g6,	%o3,	%i2
	movrlez	%o2,	%o7,	%i5
	subcc	%l0,	%o6,	%i4
	taddcc	%l6,	0x1964,	%i1
	edge8n	%o5,	%l4,	%g2
	fbg,a	%fcc3,	loop_949
	fmovsa	%icc,	%f17,	%f4
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x20] %asi,	%l0
loop_949:
	xnor	%i6,	%i3,	%l2
	nop
	setx	loop_950,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddrl	%o1,	%g1,	%l5
	subc	%o4,	0x0C56,	%i0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x66] %asi,	%o0
loop_950:
	tneg	%icc,	0x4
	be,a,pt	%xcc,	loop_951
	movrlz	%g4,	0x0BE,	%g3
	fbe	%fcc3,	loop_952
	umul	%i7,	0x0534,	%l3
loop_951:
	movrne	%g5,	0x3C3,	%g7
	ta	%xcc,	0x5
loop_952:
	fbg,a	%fcc2,	loop_953
	move	%xcc,	%g6,	%o3
	edge16ln	%o2,	%i2,	%o7
	edge16n	%i5,	%o6,	%i4
loop_953:
	fcmpgt16	%f20,	%f2,	%l0
	fmovsgu	%xcc,	%f10,	%f25
	fnors	%f20,	%f25,	%f18
	fmovde	%icc,	%f6,	%f27
	fbuge	%fcc1,	loop_954
	sll	%l6,	0x1F,	%i1
	edge32ln	%o5,	%l4,	%l1
	sll	%i6,	%g2,	%l2
loop_954:
	array32	%o1,	%g1,	%l5
	fmovdvs	%xcc,	%f16,	%f1
	st	%f12,	[%l7 + 0x50]
	tn	%xcc,	0x1
	movne	%icc,	%o4,	%i3
	andncc	%o0,	%i0,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i7,	[%l7 + 0x2F]
	ble,a,pn	%icc,	loop_955
	fnot1	%f22,	%f2
	sth	%g4,	[%l7 + 0x4C]
	fbne	%fcc1,	loop_956
loop_955:
	prefetch	[%l7 + 0x28],	 0x0
	fbule,a	%fcc2,	loop_957
	addcc	%l3,	%g7,	%g5
loop_956:
	fmovdcs	%icc,	%f24,	%f22
	srax	%g6,	%o3,	%i2
loop_957:
	siam	0x3
	prefetch	[%l7 + 0x4C],	 0x3
	umulcc	%o2,	%i5,	%o6
	movleu	%xcc,	%o7,	%l0
	move	%xcc,	%i4,	%l6
	fmovdne	%xcc,	%f9,	%f27
	movvc	%xcc,	%o5,	%i1
	fmovrslez	%l1,	%f27,	%f26
	fmovdvc	%icc,	%f21,	%f5
	fpsub32	%f0,	%f10,	%f24
	edge16l	%i6,	%l4,	%g2
	udiv	%l2,	0x1909,	%g1
	fmovrsgz	%l5,	%f29,	%f14
	fpackfix	%f10,	%f31
	taddcc	%o1,	%o4,	%i3
	sra	%i0,	%g3,	%o0
	fnor	%f2,	%f6,	%f18
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%l3
	edge32l	%g7,	%g4,	%g6
	fpadd16	%f18,	%f24,	%f24
	mulscc	%o3,	%g5,	%i2
	edge16	%i5,	%o6,	%o2
	fpsub16s	%f30,	%f14,	%f30
	or	%l0,	%o7,	%i4
	set	0x34, %i0
	lda	[%l7 + %i0] 0x0c,	%f10
	brlez	%l6,	loop_958
	alignaddr	%i1,	%l1,	%o5
	set	0x70, %o0
	prefetcha	[%l7 + %o0] 0x11,	 0x0
loop_958:
	movrlz	%l4,	%g2,	%l2
	fors	%f31,	%f1,	%f16
	tle	%xcc,	0x7
	edge16n	%l5,	%o1,	%g1
	sub	%o4,	%i0,	%g3
	umulcc	%i3,	%i7,	%l3
	fpsub16	%f2,	%f6,	%f10
	sllx	%o0,	0x0C,	%g7
	fmovrslz	%g6,	%f19,	%f2
	udivx	%g4,	0x0A0C,	%o3
	orcc	%g5,	%i2,	%i5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x52] %asi,	%o2
	tn	%xcc,	0x0
	xnor	%o6,	0x1145,	%o7
	srax	%i4,	%l6,	%l0
	ba,a,pt	%xcc,	loop_959
	or	%i1,	0x0457,	%o5
	fmovrdlz	%l1,	%f2,	%f16
	movne	%xcc,	%i6,	%g2
loop_959:
	call	loop_960
	tne	%icc,	0x7
	fabsd	%f16,	%f28
	movgu	%xcc,	%l2,	%l4
loop_960:
	brlz,a	%l5,	loop_961
	edge16	%g1,	%o1,	%i0
	tl	%icc,	0x1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x19,	%o4,	%g3
loop_961:
	mulscc	%i3,	%l3,	%i7
	ldub	[%l7 + 0x54],	%o0
	subcc	%g6,	0x025B,	%g4
	add	%o3,	0x0ED5,	%g5
	fands	%f2,	%f9,	%f8
	udivx	%i2,	0x1BC0,	%i5
	fbg,a	%fcc0,	loop_962
	umul	%g7,	%o2,	%o7
	sub	%i4,	%l6,	%l0
	tsubcctv	%o6,	0x0117,	%i1
loop_962:
	srax	%o5,	%l1,	%i6
	fmovsgu	%icc,	%f16,	%f17
	edge16ln	%l2,	%l4,	%l5
	add	%g2,	%o1,	%g1
	or	%i0,	%o4,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn	%fcc1,	loop_963
	sdivx	%l3,	0x1792,	%g3
	fmovda	%xcc,	%f9,	%f30
	brlz	%i7,	loop_964
loop_963:
	fmovdn	%icc,	%f18,	%f23
	fmovscc	%icc,	%f21,	%f22
	orncc	%o0,	0x00E3,	%g4
loop_964:
	nop
	set	0x28, %g2
	prefetcha	[%l7 + %g2] 0x88,	 0x0
	popc	0x1629,	%g6
	orn	%g5,	%i2,	%g7
	movrlz	%o2,	%i5,	%i4
	set	0x3A, %i1
	ldsha	[%l7 + %i1] 0x19,	%o7
	sll	%l0,	0x1A,	%o6
	fmovrdgez	%l6,	%f6,	%f18
	ldx	[%l7 + 0x08],	%i1
	fpsub32s	%f27,	%f0,	%f9
	subcc	%l1,	%o5,	%l2
	smul	%l4,	0x1AA5,	%i6
	fsrc2	%f2,	%f10
	fornot1s	%f4,	%f21,	%f1
	bneg,pn	%xcc,	loop_965
	fpsub16s	%f20,	%f16,	%f9
	tne	%xcc,	0x0
	movrgez	%g2,	%o1,	%g1
loop_965:
	edge8n	%i0,	%l5,	%o4
	brlz	%l3,	loop_966
	fnot2s	%f8,	%f11
	edge32n	%g3,	%i7,	%i3
	fmuld8sux16	%f13,	%f12,	%f14
loop_966:
	taddcc	%g4,	%o3,	%o0
	brnz,a	%g5,	loop_967
	or	%i2,	%g6,	%o2
	fone	%f8
	tsubcctv	%g7,	0x1025,	%i5
loop_967:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x18,	%i4,	%l0
	array16	%o7,	%l6,	%i1
	tl	%icc,	0x2
	addc	%l1,	%o6,	%o5
	fmovdn	%xcc,	%f4,	%f13
	wr	%g0,	0x89,	%asi
	stha	%l4,	[%l7 + 0x64] %asi
	movle	%icc,	%i6,	%l2
	edge8	%g2,	%o1,	%i0
	bne,a	loop_968
	sub	%l5,	%o4,	%g1
	lduw	[%l7 + 0x60],	%l3
	fcmped	%fcc2,	%f0,	%f22
loop_968:
	subc	%i7,	0x0F9E,	%i3
	umul	%g4,	%g3,	%o0
	fpack32	%f16,	%f14,	%f12
	bleu,a,pt	%icc,	loop_969
	xorcc	%g5,	%o3,	%i2
	udiv	%o2,	0x094C,	%g6
	fcmpne32	%f26,	%f8,	%i5
loop_969:
	tcs	%xcc,	0x2
	fnot2s	%f11,	%f15
	fmovde	%icc,	%f12,	%f15
	movn	%icc,	%g7,	%l0
	andn	%i4,	%o7,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l1,	0x169C,	%i1
	sll	%o5,	%l4,	%o6
	edge8l	%i6,	%l2,	%g2
	sdivcc	%o1,	0x1815,	%l5
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x24] %asi,	%i0
	fcmpne16	%f6,	%f12,	%o4
	tg	%icc,	0x6
	udivx	%l3,	0x18A3,	%g1
	tsubcc	%i7,	0x1A34,	%i3
	tge	%xcc,	0x4
	be,pn	%icc,	loop_970
	taddcctv	%g3,	0x041C,	%g4
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x1f,	%f16
loop_970:
	tleu	%icc,	0x0
	fmovrslz	%o0,	%f18,	%f18
	fbge,a	%fcc2,	loop_971
	edge16	%g5,	%o3,	%o2
	movl	%icc,	%i2,	%i5
	flush	%l7 + 0x40
loop_971:
	tleu	%icc,	0x4
	edge8	%g7,	%l0,	%i4
	udivcc	%g6,	0x08C8,	%l6
	movpos	%icc,	%l1,	%i1
	edge8n	%o7,	%l4,	%o6
	taddcctv	%i6,	0x0094,	%l2
	fmul8x16	%f29,	%f20,	%f4
	smul	%g2,	%o5,	%o1
	movle	%icc,	%i0,	%o4
	movl	%icc,	%l3,	%l5
	fnand	%f12,	%f4,	%f8
	stb	%g1,	[%l7 + 0x42]
	alignaddr	%i7,	%g3,	%g4
	bleu,a,pn	%xcc,	loop_972
	xnorcc	%i3,	0x0DFB,	%o0
	fandnot1s	%f11,	%f6,	%f31
	alignaddr	%g5,	%o3,	%o2
loop_972:
	fexpand	%f23,	%f24
	edge16	%i2,	%i5,	%g7
	edge16l	%l0,	%g6,	%i4
	fcmpeq16	%f24,	%f14,	%l1
	mova	%xcc,	%l6,	%o7
	andcc	%l4,	%i1,	%o6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x10] %asi,	%l2
	fmovrdlz	%i6,	%f26,	%f22
	addcc	%o5,	0x0484,	%g2
	edge32	%i0,	%o4,	%l3
	fblg,a	%fcc2,	loop_973
	tg	%xcc,	0x3
	udivx	%o1,	0x1BEB,	%g1
	movge	%icc,	%l5,	%i7
loop_973:
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%g3
	tl	%xcc,	0x1
	fmuld8ulx16	%f12,	%f25,	%f22
	edge16	%o0,	%g5,	%o3
	fmovrdlz	%o2,	%f0,	%f16
	movrgez	%i2,	0x22F,	%i3
	udivx	%i5,	0x014F,	%g7
	bvs	%icc,	loop_974
	brgez,a	%g6,	loop_975
	fpadd16	%f4,	%f14,	%f20
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x78] %asi,	%f17
loop_974:
	movg	%xcc,	%l0,	%i4
loop_975:
	ta	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l6,	0x0C,	%l1
	movl	%xcc,	%l4,	%o7
	edge32n	%o6,	%l2,	%i6
	array32	%o5,	%g2,	%i0
	fbug,a	%fcc0,	loop_976
	alignaddr	%i1,	%o4,	%o1
	addccc	%l3,	%l5,	%g1
	xorcc	%i7,	%g3,	%o0
loop_976:
	movvs	%xcc,	%g5,	%o3
	tvs	%icc,	0x7
	umul	%o2,	0x050F,	%i2
	array16	%i3,	%i5,	%g7
	movrne	%g6,	%g4,	%l0
	bne	loop_977
	edge16n	%l6,	%i4,	%l1
	set	0x54, %i5
	lda	[%l7 + %i5] 0x19,	%f3
loop_977:
	subcc	%l4,	0x1774,	%o7
	tcc	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_978,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stw	%l2,	[%l7 + 0x74]
	edge8	%i6,	%o6,	%o5
	movleu	%icc,	%i0,	%g2
loop_978:
	sra	%i1,	0x04,	%o1
	ba	loop_979
	tne	%xcc,	0x1
	movcs	%icc,	%l3,	%o4
	fbue	%fcc2,	loop_980
loop_979:
	fmovdvc	%xcc,	%f15,	%f6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%l5
loop_980:
	addccc	%g3,	%i7,	%o0
	srax	%g5,	0x0A,	%o2
	bvc,a,pn	%xcc,	loop_981
	edge16n	%o3,	%i2,	%i5
	umul	%g7,	0x02E4,	%i3
	bne,pt	%xcc,	loop_982
loop_981:
	movrgz	%g6,	%g4,	%l0
	edge32n	%i4,	%l6,	%l4
	fmovdvc	%xcc,	%f0,	%f9
loop_982:
	bge,a	%xcc,	loop_983
	umul	%l1,	%l2,	%i6
	smul	%o6,	0x0D2B,	%o7
	fandnot1s	%f16,	%f1,	%f15
loop_983:
	and	%o5,	0x01BE,	%i0
	call	loop_984
	movcs	%icc,	%g2,	%o1
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x60] %asi,	%l2
loop_984:
	fmovdge	%icc,	%f17,	%f20
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%f16
	fnor	%f18,	%f6,	%f10
	mulscc	%o4,	%i1,	%g1
	or	%g3,	0x0E8D,	%l5
	std	%o0,	[%l7 + 0x50]
	set	0x26, %l3
	lduha	[%l7 + %l3] 0x04,	%i7
	fbul	%fcc2,	loop_985
	mulx	%g5,	0x1557,	%o3
	fmovdleu	%icc,	%f10,	%f1
	edge16l	%o2,	%i5,	%g7
loop_985:
	orn	%i3,	%g6,	%i2
	edge16ln	%l0,	%i4,	%g4
	be	%xcc,	loop_986
	subc	%l4,	%l6,	%l2
	fmovsvs	%xcc,	%f20,	%f12
	fmovsne	%icc,	%f24,	%f28
loop_986:
	ba,a,pn	%icc,	loop_987
	xorcc	%l1,	%o6,	%i6
	fornot2s	%f11,	%f16,	%f13
	umulcc	%o5,	0x0C17,	%o7
loop_987:
	edge8	%i0,	%g2,	%l3
	fcmple32	%f24,	%f6,	%o1
	edge32ln	%o4,	%g1,	%i1
	and	%g3,	0x063B,	%l5
	ld	[%l7 + 0x14],	%f19
	srl	%o0,	0x0B,	%i7
	set	0x40, %o3
	stxa	%g5,	[%l7 + %o3] 0x19
	edge8	%o2,	%i5,	%o3
	fornot1	%f12,	%f4,	%f0
	alignaddr	%i3,	%g7,	%g6
	fmovdleu	%xcc,	%f21,	%f26
	faligndata	%f22,	%f28,	%f16
	and	%i2,	%i4,	%l0
	udiv	%g4,	0x06ED,	%l6
	taddcc	%l4,	%l2,	%l1
	ldub	[%l7 + 0x22],	%o6
	wr	%g0,	0x0c,	%asi
	sta	%f17,	[%l7 + 0x28] %asi
	movleu	%xcc,	%i6,	%o5
	edge32l	%i0,	%o7,	%l3
	bcc,a	loop_988
	movcs	%icc,	%o1,	%o4
	sll	%g2,	%i1,	%g1
	movl	%xcc,	%g3,	%l5
loop_988:
	fmovdn	%xcc,	%f20,	%f31
	fcmpeq32	%f12,	%f22,	%i7
	bgu,pn	%icc,	loop_989
	mulx	%g5,	%o2,	%i5
	fmovsne	%xcc,	%f27,	%f8
	tle	%xcc,	0x0
loop_989:
	orn	%o0,	%i3,	%o3
	srl	%g7,	0x00,	%g6
	array8	%i4,	%i2,	%g4
	fba,a	%fcc3,	loop_990
	fble,a	%fcc0,	loop_991
	sethi	0x08E7,	%l6
	edge32n	%l0,	%l4,	%l1
loop_990:
	fands	%f27,	%f2,	%f1
loop_991:
	ba	loop_992
	tsubcctv	%o6,	0x1452,	%i6
	udivx	%o5,	0x02D8,	%i0
	fors	%f30,	%f16,	%f28
loop_992:
	movn	%xcc,	%o7,	%l3
	fone	%f6
	bge,pn	%icc,	loop_993
	movpos	%icc,	%l2,	%o1
	orn	%o4,	0x0BAA,	%g2
	fmovsgu	%icc,	%f1,	%f26
loop_993:
	bvs	%xcc,	loop_994
	tge	%icc,	0x6
	mulscc	%g1,	0x04A3,	%i1
	fpsub16	%f30,	%f22,	%f26
loop_994:
	nop
	setx	loop_995,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%g3,	%i7,	%l5
	fbul	%fcc3,	loop_996
	fcmpes	%fcc3,	%f1,	%f9
loop_995:
	fbl	%fcc0,	loop_997
	movrne	%o2,	0x3FF,	%i5
loop_996:
	orncc	%o0,	%g5,	%i3
	fmovsleu	%xcc,	%f20,	%f21
loop_997:
	add	%g7,	%g6,	%o3
	sra	%i2,	0x08,	%g4
	fmovdcc	%xcc,	%f19,	%f27
	te	%icc,	0x0
	edge8n	%i4,	%l6,	%l4
	fmovdle	%icc,	%f24,	%f7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l0,	%o6,	%i6
	fnors	%f15,	%f6,	%f16
	array32	%l1,	%i0,	%o5
	tg	%xcc,	0x1
	orn	%l3,	%l2,	%o7
	fpack32	%f8,	%f20,	%f8
	fcmpd	%fcc0,	%f28,	%f8
	movrlez	%o1,	%o4,	%g2
	orncc	%g1,	0x0979,	%i1
	movg	%xcc,	%g3,	%i7
	bcc	%xcc,	loop_998
	fnegd	%f22,	%f20
	sth	%o2,	[%l7 + 0x14]
	tl	%icc,	0x1
loop_998:
	subcc	%l5,	%i5,	%g5
	fors	%f27,	%f15,	%f20
	stbar
	movvc	%xcc,	%i3,	%o0
	edge32l	%g6,	%o3,	%i2
	nop
	setx	loop_999,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bn,a	loop_1000
	tcs	%icc,	0x6
	fexpand	%f26,	%f22
loop_999:
	fmovsle	%xcc,	%f8,	%f25
loop_1000:
	sra	%g4,	0x18,	%i4
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x16,	%f16
	ld	[%l7 + 0x30],	%f11
	tsubcctv	%g7,	0x05BF,	%l6
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x11
	ldub	[%l7 + 0x64],	%l0
	nop
	setx	loop_1001,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8ln	%l4,	%i6,	%l1
	fandnot2s	%f16,	%f6,	%f3
	addcc	%i0,	0x1D5F,	%o6
loop_1001:
	edge32n	%l3,	%o5,	%o7
	fone	%f0
	sdivx	%o1,	0x19E8,	%o4
	bvs,a	%icc,	loop_1002
	fcmpeq16	%f28,	%f22,	%g2
	ld	[%l7 + 0x4C],	%f0
	tcc	%icc,	0x1
loop_1002:
	nop
	set	0x60, %i4
	lduwa	[%l7 + %i4] 0x81,	%l2
	sdivcc	%g1,	0x02D9,	%g3
	fmovd	%f14,	%f0
	siam	0x6
	bne	loop_1003
	edge8ln	%i7,	%i1,	%l5
	bcc	loop_1004
	udivx	%i5,	0x0A05,	%o2
loop_1003:
	tsubcc	%i3,	0x0E40,	%g5
	movvc	%xcc,	%o0,	%o3
loop_1004:
	popc	0x1D3C,	%i2
	tn	%icc,	0x0
	membar	0x17
	brgz,a	%g4,	loop_1005
	tge	%xcc,	0x5
	movl	%icc,	%i4,	%g6
	ldstub	[%l7 + 0x25],	%g7
loop_1005:
	movvc	%icc,	%l0,	%l6
	te	%xcc,	0x1
	brlz,a	%l4,	loop_1006
	bl,a,pn	%icc,	loop_1007
	ldub	[%l7 + 0x78],	%i6
	bn,pt	%xcc,	loop_1008
loop_1006:
	ble,pn	%xcc,	loop_1009
loop_1007:
	st	%f3,	[%l7 + 0x18]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i0,	%l1
loop_1008:
	edge16l	%l3,	%o6,	%o7
loop_1009:
	fmovsgu	%xcc,	%f27,	%f24
	fbul	%fcc0,	loop_1010
	fpadd32s	%f4,	%f14,	%f28
	ldsh	[%l7 + 0x40],	%o1
	ta	%icc,	0x0
loop_1010:
	array32	%o5,	%g2,	%o4
	fbul,a	%fcc0,	loop_1011
	fsrc2	%f26,	%f30
	movleu	%icc,	%g1,	%g3
	edge8n	%l2,	%i1,	%i7
loop_1011:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x40, %g5
	std	%f18,	[%l7 + %g5]
	fbg,a	%fcc0,	loop_1012
	movneg	%xcc,	%l5,	%o2
	mulscc	%i3,	%g5,	%o0
	srax	%o3,	0x0D,	%i2
loop_1012:
	fors	%f25,	%f29,	%f28
	popc	%i5,	%g4
	fandnot1	%f22,	%f26,	%f26
	movrlez	%i4,	%g7,	%l0
	tleu	%icc,	0x2
	fbug	%fcc3,	loop_1013
	movrgz	%l6,	0x345,	%l4
	movpos	%icc,	%g6,	%i6
	taddcc	%i0,	%l1,	%l3
loop_1013:
	sdiv	%o6,	0x08CE,	%o7
	set	0x68, %o4
	lda	[%l7 + %o4] 0x0c,	%f11
	fbue	%fcc0,	loop_1014
	xorcc	%o1,	0x1716,	%o5
	udivx	%o4,	0x1CA9,	%g1
	alignaddr	%g2,	%g3,	%l2
loop_1014:
	xor	%i7,	%l5,	%o2
	fbul	%fcc3,	loop_1015
	smulcc	%i3,	%i1,	%o0
	fabss	%f17,	%f16
	fmovdg	%xcc,	%f15,	%f25
loop_1015:
	tg	%xcc,	0x5
	fbue,a	%fcc1,	loop_1016
	xorcc	%g5,	0x1594,	%o3
	movpos	%icc,	%i2,	%g4
	array32	%i4,	%i5,	%l0
loop_1016:
	stb	%l6,	[%l7 + 0x16]
	fandnot2	%f20,	%f2,	%f18
	fpsub32	%f24,	%f28,	%f18
	ldstub	[%l7 + 0x6C],	%l4
	fble	%fcc3,	loop_1017
	alignaddrl	%g7,	%i6,	%i0
	srlx	%g6,	%l3,	%o6
	fmovdl	%icc,	%f17,	%f31
loop_1017:
	xnorcc	%l1,	0x11D2,	%o7
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fabss	%f1,	%f10
	mova	%icc,	%o5,	%o4
	and	%o1,	0x1AF7,	%g2
	brgz	%g1,	loop_1018
	ldsw	[%l7 + 0x34],	%l2
	movrne	%g3,	%i7,	%l5
	ldd	[%l7 + 0x38],	%f28
loop_1018:
	fmovde	%icc,	%f24,	%f7
	movn	%xcc,	%o2,	%i1
	fmovdvs	%xcc,	%f27,	%f17
	mulx	%i3,	0x1F9D,	%o0
	edge8n	%o3,	%g5,	%g4
	edge16	%i4,	%i2,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x3
	fmovrde	%l0,	%f28,	%f4
	bg,pn	%xcc,	loop_1019
	edge8n	%l6,	%l4,	%i6
	tvc	%xcc,	0x2
	tneg	%xcc,	0x0
loop_1019:
	tleu	%icc,	0x0
	taddcc	%g7,	0x008E,	%g6
	nop
	setx loop_1020, %l0, %l1
	jmpl %l1, %l3
	sub	%o6,	%l1,	%i0
	faligndata	%f8,	%f18,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1020:
	tsubcctv	%o7,	%o4,	%o1
	movrlz	%g2,	0x273,	%o5
	movge	%xcc,	%g1,	%l2
	tl	%icc,	0x5
	edge8n	%g3,	%l5,	%o2
	fmovrdgez	%i1,	%f16,	%f10
	tle	%xcc,	0x6
	fmul8x16	%f11,	%f24,	%f28
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%i7
	fbuge	%fcc2,	loop_1021
	fmovdgu	%icc,	%f7,	%f7
	bvs,a,pt	%xcc,	loop_1022
	nop
	set	0x18, %g1
	lduw	[%l7 + %g1],	%i3
loop_1021:
	te	%icc,	0x7
	set	0x7A, %l2
	ldsha	[%l7 + %l2] 0x04,	%o3
loop_1022:
	fmovrse	%g5,	%f12,	%f31
	fble	%fcc0,	loop_1023
	fnors	%f3,	%f24,	%f3
	srax	%o0,	0x0E,	%i4
	sdivx	%g4,	0x1A07,	%i2
loop_1023:
	nop
	setx loop_1024, %l0, %l1
	jmpl %l1, %l0
	tvs	%icc,	0x2
	sir	0x0E4A
	movre	%i5,	%l6,	%l4
loop_1024:
	movge	%icc,	%g7,	%i6
	subccc	%l3,	0x1DE5,	%o6
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x19,	%l0
	movneg	%icc,	%g6,	%o7
	tne	%xcc,	0x6
	mulx	%o4,	%i0,	%g2
	fandnot2s	%f18,	%f3,	%f12
	array16	%o1,	%o5,	%l2
	set	0x70, %l5
	prefetcha	[%l7 + %l5] 0x10,	 0x1
	or	%l5,	0x07B9,	%g1
	array16	%o2,	%i7,	%i3
	edge8l	%o3,	%i1,	%g5
	set	0x78, %o6
	prefetcha	[%l7 + %o6] 0x80,	 0x1
	array16	%g4,	%i2,	%o0
	movvc	%xcc,	%i5,	%l6
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	bne,a,pn	%xcc,	loop_1025
	nop
	set	0x18, %g4
	ldx	[%l7 + %g4],	%l0
	fmovsleu	%icc,	%f5,	%f11
	movpos	%icc,	%g7,	%l4
loop_1025:
	edge16	%l3,	%o6,	%l1
	sdiv	%g6,	0x15AB,	%i6
	movcs	%xcc,	%o7,	%o4
	array8	%i0,	%g2,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a,pn	%xcc,	loop_1026
	edge8	%o1,	%l2,	%l5
	bvc	loop_1027
	std	%f26,	[%l7 + 0x40]
loop_1026:
	lduw	[%l7 + 0x0C],	%g1
	fmul8x16al	%f28,	%f10,	%f26
loop_1027:
	fbge,a	%fcc1,	loop_1028
	swap	[%l7 + 0x08],	%g3
	xnor	%o2,	0x1EB0,	%i7
	array32	%i3,	%o3,	%i1
loop_1028:
	nop
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x15
	movrne	%i4,	0x1B1,	%g5
	fandnot1s	%f2,	%f28,	%f21
	stw	%i2,	[%l7 + 0x58]
	bneg,a,pt	%xcc,	loop_1029
	fnors	%f29,	%f28,	%f11
	bleu	loop_1030
	srax	%o0,	%g4,	%l6
loop_1029:
	sethi	0x166F,	%l0
	te	%icc,	0x6
loop_1030:
	sllx	%g7,	%l4,	%l3
	movle	%xcc,	%o6,	%i5
	tsubcc	%l1,	%i6,	%g6
	edge16	%o7,	%i0,	%g2
	tsubcctv	%o5,	0x0106,	%o1
	tsubcc	%l2,	%l5,	%o4
	srl	%g1,	0x08,	%g3
	movrlz	%o2,	%i7,	%i3
	set	0x48, %l4
	stda	%i0,	[%l7 + %l4] 0x89
	edge32ln	%o3,	%i4,	%i2
	bcs	%xcc,	loop_1031
	bneg,a,pn	%xcc,	loop_1032
	xor	%o0,	%g5,	%l6
	udivx	%g4,	0x0329,	%g7
loop_1031:
	fxnors	%f24,	%f17,	%f8
loop_1032:
	udivx	%l0,	0x1344,	%l4
	fcmpgt16	%f10,	%f30,	%o6
	orcc	%l3,	0x1CC4,	%l1
	mulx	%i6,	0x1C2B,	%g6
	brgez	%o7,	loop_1033
	movrgz	%i0,	%i5,	%o5
	movn	%xcc,	%g2,	%o1
	sdiv	%l2,	0x116D,	%l5
loop_1033:
	andcc	%o4,	%g1,	%g3
	bg,a	loop_1034
	srlx	%i7,	%i3,	%o2
	tcc	%icc,	0x4
	sethi	0x0E98,	%i1
loop_1034:
	tn	%icc,	0x2
	array8	%i4,	%o3,	%o0
	umul	%g5,	%l6,	%i2
	udiv	%g4,	0x1357,	%l0
	set	0x0D, %o7
	ldstuba	[%l7 + %o7] 0x80,	%g7
	orcc	%o6,	%l4,	%l1
	fpackfix	%f28,	%f8
	tgu	%icc,	0x1
	tcs	%xcc,	0x6
	movvc	%icc,	%i6,	%l3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%g6
	tne	%icc,	0x1
	fnot2	%f4,	%f10
	fsrc2s	%f14,	%f0
	srlx	%i0,	%o7,	%i5
	stb	%g2,	[%l7 + 0x3F]
	wr	%g0,	0x19,	%asi
	stxa	%o5,	[%l7 + 0x38] %asi
	orcc	%l2,	0x156B,	%l5
	movcs	%xcc,	%o4,	%o1
	movg	%icc,	%g3,	%g1
	sir	0x1DF4
	movneg	%icc,	%i7,	%i3
	fpsub16s	%f29,	%f30,	%f7
	and	%i1,	%i4,	%o3
	fmovrslez	%o0,	%f9,	%f7
	smul	%g5,	%o2,	%l6
	movcc	%xcc,	%g4,	%l0
	xnor	%g7,	0x1F6E,	%o6
	set	0x20, %g7
	stda	%l4,	[%l7 + %g7] 0x15
	xnorcc	%i2,	0x0AD1,	%l1
	bneg	loop_1035
	edge16l	%i6,	%g6,	%l3
	orn	%i0,	%i5,	%g2
	sdiv	%o7,	0x142A,	%o5
loop_1035:
	fxnor	%f4,	%f20,	%f18
	bshuffle	%f22,	%f10,	%f20
	xor	%l2,	0x08C4,	%l5
	tcc	%xcc,	0x1
	fmovda	%icc,	%f6,	%f28
	edge8ln	%o1,	%g3,	%o4
	movrlez	%i7,	0x1D8,	%g1
	movneg	%xcc,	%i1,	%i3
	edge8	%o3,	%i4,	%o0
	tcs	%icc,	0x3
	set	0x68, %g6
	ldswa	[%l7 + %g6] 0x10,	%o2
	edge32ln	%l6,	%g4,	%g5
	ld	[%l7 + 0x20],	%f17
	umul	%l0,	%g7,	%o6
	bcc,a	loop_1036
	nop
	set	0x75, %l0
	stb	%l4,	[%l7 + %l0]
	sdiv	%i2,	0x12C3,	%l1
	fmovdg	%xcc,	%f5,	%f26
loop_1036:
	movcs	%xcc,	%i6,	%g6
	bneg,a	loop_1037
	fmovrdlz	%l3,	%f2,	%f30
	fabsd	%f16,	%f0
	fpadd32s	%f11,	%f26,	%f22
loop_1037:
	sir	0x03D1
	bl,a,pn	%xcc,	loop_1038
	fbl,a	%fcc0,	loop_1039
	sdiv	%i0,	0x16E8,	%i5
	fsrc2s	%f5,	%f23
loop_1038:
	fors	%f16,	%f23,	%f30
loop_1039:
	xor	%g2,	0x195A,	%o7
	fbue	%fcc3,	loop_1040
	te	%icc,	0x7
	fmovdvc	%xcc,	%f24,	%f24
	andncc	%o5,	%l5,	%l2
loop_1040:
	fmovdge	%icc,	%f12,	%f12
	tleu	%xcc,	0x4
	sub	%g3,	0x0B96,	%o1
	andcc	%o4,	0x083D,	%i7
	popc	%g1,	%i3
	add	%o3,	0x0A21,	%i4
	subcc	%o0,	0x0BFA,	%o2
	umul	%i1,	0x0DE8,	%l6
	movle	%icc,	%g4,	%g5
	tcs	%xcc,	0x5
	set	0x28, %i6
	ldxa	[%l7 + %i6] 0x89,	%g7
	bneg	loop_1041
	fbl	%fcc1,	loop_1042
	movpos	%icc,	%o6,	%l4
	movrlez	%i2,	%l0,	%l1
loop_1041:
	ble,pn	%xcc,	loop_1043
loop_1042:
	st	%f8,	[%l7 + 0x44]
	movleu	%xcc,	%g6,	%l3
	xnorcc	%i6,	%i5,	%g2
loop_1043:
	fabss	%f9,	%f6
	fpadd32s	%f7,	%f4,	%f7
	fmovsl	%icc,	%f31,	%f2
	fand	%f20,	%f20,	%f2
	edge32l	%o7,	%o5,	%l5
	orcc	%l2,	%i0,	%g3
	subcc	%o1,	0x17CB,	%i7
	add	%g1,	%o4,	%o3
	fbn	%fcc2,	loop_1044
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i4,	0x0A9,	%i3
	fone	%f24
loop_1044:
	sethi	0x0DCD,	%o2
	movrne	%o0,	%l6,	%g4
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x3D] %asi,	%g5
	movn	%xcc,	%i1,	%o6
	movcc	%xcc,	%g7,	%l4
	edge32n	%l0,	%i2,	%l1
	tpos	%icc,	0x3
	sir	0x0E4C
	fands	%f10,	%f3,	%f28
	orn	%g6,	0x1F09,	%i6
	movl	%xcc,	%l3,	%g2
	alignaddr	%i5,	%o7,	%o5
	nop
	setx	loop_1045,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivcc	%l5,	0x1F01,	%l2
	prefetch	[%l7 + 0x14],	 0x1
	flush	%l7 + 0x64
loop_1045:
	nop
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x78] %asi,	%i0
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
	tcc	%icc,	0x6
	tg	%xcc,	0x1
	st	%f30,	[%l7 + 0x24]
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x15,	%g3
	srlx	%g1,	%i7,	%o4
	fmuld8ulx16	%f22,	%f19,	%f26
	call	loop_1046
	edge32ln	%i4,	%i3,	%o3
	nop
	setx	loop_1047,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%icc,	%o0,	%o2
loop_1046:
	bleu,a	%icc,	loop_1048
	edge8n	%g4,	%g5,	%l6
loop_1047:
	tvs	%xcc,	0x6
	tvs	%xcc,	0x6
loop_1048:
	edge32	%i1,	%o6,	%l4
	or	%l0,	%g7,	%i2
	fxor	%f24,	%f4,	%f16
	tle	%icc,	0x5
	fmovsle	%icc,	%f7,	%f8
	nop
	setx	loop_1049,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbge	%fcc1,	loop_1050
	edge16ln	%g6,	%i6,	%l1
	fbne	%fcc0,	loop_1051
loop_1049:
	movne	%icc,	%l3,	%g2
loop_1050:
	nop
	set	0x78, %o1
	prefetcha	[%l7 + %o1] 0x18,	 0x1
loop_1051:
	sub	%i5,	%l5,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a	%xcc,	loop_1052
	fbule	%fcc0,	loop_1053
	movrgz	%i0,	0x2F6,	%o5
	tcc	%xcc,	0x1
loop_1052:
	movpos	%xcc,	%g3,	%g1
loop_1053:
	edge8n	%i7,	%o1,	%o4
	xnorcc	%i3,	0x137A,	%i4
	fcmpes	%fcc2,	%f15,	%f19
	sir	0x1AD7
	fmovs	%f14,	%f8
	srax	%o0,	%o2,	%o3
	fble	%fcc0,	loop_1054
	tleu	%xcc,	0x4
	fabsd	%f8,	%f14
	bn	%xcc,	loop_1055
loop_1054:
	movcs	%icc,	%g5,	%g4
	alignaddrl	%l6,	%i1,	%l4
	fmovrse	%l0,	%f4,	%f25
loop_1055:
	fmovsa	%xcc,	%f25,	%f24
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%o6
	fmovrsgez	%g7,	%f21,	%f21
	fmovdvc	%xcc,	%f13,	%f3
	fcmpeq32	%f24,	%f2,	%i2
	movrlez	%i6,	0x3A2,	%g6
	set	0x50, %o0
	lduha	[%l7 + %o0] 0x19,	%l3
	edge16ln	%l1,	%g2,	%o7
	bshuffle	%f22,	%f2,	%f4
	brz,a	%l5,	loop_1056
	lduw	[%l7 + 0x14],	%i5
	array8	%i0,	%l2,	%o5
	sdiv	%g3,	0x085F,	%i7
loop_1056:
	udiv	%o1,	0x14B5,	%g1
	bshuffle	%f24,	%f30,	%f26
	fbne	%fcc0,	loop_1057
	std	%o4,	[%l7 + 0x20]
	xorcc	%i3,	%i4,	%o0
	andn	%o3,	%g5,	%o2
loop_1057:
	movne	%xcc,	%g4,	%i1
	set	0x10, %o5
	stda	%i6,	[%l7 + %o5] 0x2a
	membar	#Sync
	fbule	%fcc0,	loop_1058
	addc	%l4,	%o6,	%g7
	ldx	[%l7 + 0x10],	%l0
	taddcctv	%i6,	0x0449,	%g6
loop_1058:
	edge16ln	%l3,	%l1,	%g2
	bleu	%xcc,	loop_1059
	fbne,a	%fcc3,	loop_1060
	andn	%o7,	0x1CFC,	%i2
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x4D] %asi,	%i5
loop_1059:
	edge8n	%l5,	%l2,	%o5
loop_1060:
	fmuld8ulx16	%f4,	%f14,	%f4
	tvc	%xcc,	0x0
	edge16n	%g3,	%i7,	%i0
	movrgz	%o1,	0x1E7,	%g1
	fbul,a	%fcc2,	loop_1061
	fmovsne	%icc,	%f22,	%f20
	xor	%o4,	%i4,	%i3
	addc	%o0,	0x146E,	%g5
loop_1061:
	mova	%icc,	%o3,	%g4
	set	0x48, %i1
	stxa	%o2,	[%l7 + %i1] 0x10
	nop
	set	0x45, %g3
	ldsb	[%l7 + %g3],	%i1
	st	%f17,	[%l7 + 0x44]
	tleu	%icc,	0x2
	ldsw	[%l7 + 0x7C],	%l6
	mulx	%l4,	0x0E7B,	%g7
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x40] %asi,	%l0
	umul	%i6,	%o6,	%l3
	brgz,a	%g6,	loop_1062
	sdivcc	%g2,	0x05EC,	%l1
	or	%o7,	%i2,	%l5
	array8	%i5,	%o5,	%g3
loop_1062:
	andn	%l2,	%i7,	%i0
	move	%icc,	%g1,	%o1
	movl	%xcc,	%i4,	%o4
	fmovdvs	%icc,	%f14,	%f11
	smul	%o0,	%g5,	%i3
	srl	%o3,	0x03,	%o2
	wr	%g0,	0x19,	%asi
	stxa	%i1,	[%l7 + 0x40] %asi
	xnor	%g4,	0x11CA,	%l6
	ld	[%l7 + 0x34],	%f5
	fands	%f27,	%f16,	%f12
	movn	%icc,	%g7,	%l0
	addcc	%i6,	%o6,	%l4
	fandnot1s	%f23,	%f2,	%f22
	mulscc	%g6,	%l3,	%g2
	tge	%icc,	0x0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x10,	%f0
	sllx	%l1,	%o7,	%i2
	movcc	%icc,	%i5,	%o5
	fmovrslz	%g3,	%f27,	%f17
	fbe,a	%fcc1,	loop_1063
	popc	%l5,	%i7
	edge16l	%i0,	%g1,	%o1
	movle	%xcc,	%i4,	%o4
loop_1063:
	fmovscc	%icc,	%f25,	%f0
	edge8n	%l2,	%g5,	%o0
	tgu	%icc,	0x5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x54] %asi,	%i3
	stw	%o2,	[%l7 + 0x4C]
	tcc	%icc,	0x0
	taddcc	%o3,	0x13BB,	%i1
	fmovdl	%xcc,	%f22,	%f12
	xnor	%g4,	0x0ACB,	%l6
	sub	%l0,	%g7,	%i6
	fpmerge	%f0,	%f2,	%f4
	fcmple16	%f0,	%f12,	%o6
	fpmerge	%f10,	%f4,	%f0
	ble,pn	%xcc,	loop_1064
	tge	%xcc,	0x0
	movg	%xcc,	%g6,	%l4
	sllx	%g2,	%l3,	%l1
loop_1064:
	fbe	%fcc2,	loop_1065
	bleu	loop_1066
	std	%i2,	[%l7 + 0x38]
	fmovscs	%xcc,	%f23,	%f12
loop_1065:
	fzeros	%f19
loop_1066:
	sir	0x177F
	set	0x48, %g2
	lda	[%l7 + %g2] 0x80,	%f1
	fexpand	%f11,	%f20
	sub	%i5,	%o5,	%o7
	movrgz	%l5,	0x01F,	%g3
	fabsd	%f30,	%f6
	fone	%f26
	movne	%xcc,	%i7,	%g1
	bg,a	%icc,	loop_1067
	fmovrse	%o1,	%f21,	%f0
	sdiv	%i4,	0x141C,	%i0
	fnot1s	%f22,	%f28
loop_1067:
	array8	%o4,	%l2,	%o0
	tneg	%icc,	0x6
	fmovrdlz	%i3,	%f12,	%f26
	tleu	%xcc,	0x6
	alignaddrl	%o2,	%g5,	%i1
	udivcc	%o3,	0x1C99,	%l6
	umulcc	%l0,	%g7,	%i6
	fmovdl	%icc,	%f8,	%f22
	array8	%o6,	%g4,	%g6
	movrgz	%l4,	0x019,	%l3
	brnz	%l1,	loop_1068
	movrlz	%i2,	%g2,	%i5
	fnors	%f31,	%f10,	%f4
	fmovsge	%xcc,	%f27,	%f20
loop_1068:
	brgez	%o5,	loop_1069
	fnors	%f8,	%f1,	%f6
	tsubcctv	%l5,	0x104E,	%o7
	array8	%g3,	%g1,	%o1
loop_1069:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i7,	%i0,	%o4
	movge	%xcc,	%l2,	%i4
	taddcctv	%o0,	%o2,	%g5
	alignaddrl	%i3,	%o3,	%i1
	srlx	%l0,	%l6,	%i6
	ble	loop_1070
	nop
	set	0x18, %l3
	std	%f12,	[%l7 + %l3]
	stx	%o6,	[%l7 + 0x10]
	fbne,a	%fcc1,	loop_1071
loop_1070:
	fmovdl	%icc,	%f12,	%f7
	srlx	%g4,	0x1D,	%g6
	bl,a,pt	%icc,	loop_1072
loop_1071:
	movpos	%icc,	%l4,	%g7
	movgu	%xcc,	%l1,	%l3
	nop
	setx loop_1073, %l0, %l1
	jmpl %l1, %g2
loop_1072:
	bne,a	loop_1074
	movn	%xcc,	%i2,	%i5
	ldsw	[%l7 + 0x58],	%l5
loop_1073:
	udivcc	%o5,	0x163E,	%g3
loop_1074:
	movrlez	%o7,	%g1,	%i7
	mulscc	%i0,	0x1F16,	%o4
	be,pt	%icc,	loop_1075
	tle	%xcc,	0x1
	movvc	%icc,	%o1,	%i4
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
loop_1075:
	tvc	%icc,	0x6
	set	0x30, %i3
	ldxa	[%g0 + %i3] 0x50,	%o2
	movrne	%g5,	0x347,	%i3
	fmovscc	%xcc,	%f19,	%f7
	udivcc	%o3,	0x19DE,	%o0
	edge8l	%l0,	%l6,	%i6
	sllx	%i1,	%o6,	%g6
	edge32ln	%l4,	%g4,	%l1
	fpadd16s	%f7,	%f24,	%f2
	andn	%g7,	%g2,	%i2
	set	0x34, %o3
	stwa	%l3,	[%l7 + %o3] 0x80
	fnors	%f22,	%f9,	%f5
	udiv	%i5,	0x1431,	%l5
	udivcc	%o5,	0x1DA6,	%o7
	wr	%g0,	0xe3,	%asi
	stba	%g1,	[%l7 + 0x7D] %asi
	membar	#Sync
	brlez,a	%g3,	loop_1076
	umulcc	%i0,	%i7,	%o1
	edge8n	%i4,	%o4,	%l2
	set	0x5C, %l6
	sta	%f18,	[%l7 + %l6] 0x80
loop_1076:
	edge32n	%g5,	%i3,	%o2
	set	0x74, %i7
	lduba	[%l7 + %i7] 0x88,	%o3
	edge16n	%o0,	%l0,	%l6
	addc	%i6,	0x17E5,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc2,	loop_1077
	ldsb	[%l7 + 0x0C],	%g6
	fnegs	%f19,	%f18
	fsrc2	%f28,	%f12
loop_1077:
	nop
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x18,	%f0
	movg	%icc,	%o6,	%l4
	xor	%l1,	0x13FB,	%g4
	movge	%xcc,	%g7,	%i2
	set	0x78, %i4
	sta	%f26,	[%l7 + %i4] 0x81
	taddcc	%l3,	%g2,	%i5
	fbug	%fcc1,	loop_1078
	nop
	set	0x10, %g1
	std	%l4,	[%l7 + %g1]
	xnorcc	%o7,	%o5,	%g3
	tne	%icc,	0x2
loop_1078:
	tge	%icc,	0x4
	srlx	%g1,	0x09,	%i0
	orcc	%o1,	0x15E0,	%i4
	fmovdpos	%xcc,	%f5,	%f26
	swap	[%l7 + 0x78],	%i7
	srax	%o4,	%l2,	%g5
	brz	%i3,	loop_1079
	tcc	%icc,	0x1
	fbe	%fcc1,	loop_1080
	edge32n	%o2,	%o3,	%l0
loop_1079:
	edge32	%l6,	%i6,	%o0
	lduh	[%l7 + 0x4C],	%i1
loop_1080:
	nop
	setx loop_1081, %l0, %l1
	jmpl %l1, %o6
	ld	[%l7 + 0x10],	%f11
	fpsub32	%f8,	%f6,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1081:
	fmovrslz	%l4,	%f30,	%f13
	fmul8x16au	%f7,	%f5,	%f2
	sethi	0x0ACA,	%l1
	tleu	%icc,	0x0
	sllx	%g6,	%g4,	%i2
	movrne	%l3,	0x20B,	%g7
	ldsh	[%l7 + 0x1C],	%i5
	edge8n	%g2,	%o7,	%o5
	edge16n	%g3,	%l5,	%g1
	alignaddrl	%i0,	%o1,	%i7
	prefetch	[%l7 + 0x38],	 0x1
	mova	%xcc,	%o4,	%l2
	call	loop_1082
	edge8n	%i4,	%i3,	%g5
	te	%xcc,	0x0
	ldd	[%l7 + 0x78],	%f8
loop_1082:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o3,	0x1AF2,	%o2
	fmovspos	%icc,	%f27,	%f10
	fxors	%f5,	%f10,	%f3
	addc	%l0,	0x0D7B,	%i6
	tn	%icc,	0x4
	fabsd	%f22,	%f10
	fmovspos	%xcc,	%f23,	%f4
	smulcc	%o0,	%l6,	%i1
	fnegd	%f18,	%f8
	movrgez	%o6,	%l1,	%l4
	movle	%icc,	%g4,	%i2
	tvc	%xcc,	0x0
	alignaddrl	%l3,	%g7,	%g6
	taddcctv	%i5,	0x0DF7,	%g2
	fbge,a	%fcc0,	loop_1083
	mulscc	%o5,	0x0EBF,	%g3
	ldstub	[%l7 + 0x60],	%o7
	andn	%g1,	%i0,	%l5
loop_1083:
	fandnot1s	%f11,	%f6,	%f0
	fbule	%fcc0,	loop_1084
	sdiv	%i7,	0x1AB0,	%o1
	movn	%xcc,	%l2,	%i4
	fbge,a	%fcc1,	loop_1085
loop_1084:
	movle	%xcc,	%o4,	%g5
	fnegs	%f23,	%f6
	movrgez	%i3,	%o2,	%l0
loop_1085:
	bn,pt	%xcc,	loop_1086
	array16	%i6,	%o0,	%o3
	bleu,a	loop_1087
	addc	%i1,	0x09B2,	%o6
loop_1086:
	bgu	loop_1088
	subc	%l1,	0x1079,	%l6
loop_1087:
	fmovspos	%icc,	%f18,	%f18
	fpadd32s	%f20,	%f0,	%f29
loop_1088:
	membar	0x05
	smulcc	%g4,	0x188B,	%i2
	edge32ln	%l4,	%g7,	%l3
	sdiv	%i5,	0x03F9,	%g6
	movrlz	%g2,	0x302,	%o5
	sdiv	%o7,	0x1025,	%g1
	stbar
	brz	%g3,	loop_1089
	mulscc	%l5,	%i0,	%o1
	xnor	%l2,	0x1C52,	%i4
	fmovrslez	%o4,	%f31,	%f27
loop_1089:
	nop
	set	0x18, %l2
	stda	%g4,	[%l7 + %l2] 0x2f
	membar	#Sync
	movrgez	%i7,	0x064,	%i3
	umulcc	%l0,	%o2,	%i6
	bge,a,pn	%xcc,	loop_1090
	edge32l	%o0,	%o3,	%o6
	movge	%icc,	%l1,	%i1
	movne	%xcc,	%l6,	%i2
loop_1090:
	alignaddrl	%l4,	%g4,	%g7
	movrgz	%l3,	0x1A4,	%i5
	movneg	%xcc,	%g2,	%g6
	tvc	%xcc,	0x5
	fmovdvs	%xcc,	%f11,	%f4
	tge	%icc,	0x4
	fmovdgu	%icc,	%f17,	%f7
	tsubcctv	%o5,	%o7,	%g1
	fbuge	%fcc2,	loop_1091
	fabsd	%f16,	%f2
	edge8ln	%g3,	%i0,	%o1
	add	%l5,	%l2,	%o4
loop_1091:
	sub	%i4,	%g5,	%i7
	edge16l	%i3,	%o2,	%l0
	fpadd16	%f2,	%f24,	%f18
	bvs,pt	%xcc,	loop_1092
	fexpand	%f17,	%f28
	stb	%o0,	[%l7 + 0x17]
	tvs	%xcc,	0x3
loop_1092:
	fmovdcs	%icc,	%f10,	%f26
	fcmpne32	%f0,	%f6,	%o3
	fcmple16	%f28,	%f18,	%o6
	fzeros	%f10
	andcc	%i6,	%l1,	%i1
	fornot1s	%f25,	%f25,	%f23
	subccc	%l6,	0x1243,	%i2
	fbn,a	%fcc1,	loop_1093
	orncc	%g4,	0x02B0,	%g7
	te	%xcc,	0x3
	sir	0x0384
loop_1093:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x1
	bg	%icc,	loop_1094
	umul	%l4,	0x179E,	%l3
	fornot2s	%f20,	%f2,	%f5
	udivcc	%i5,	0x13FB,	%g2
loop_1094:
	nop
	set	0x78, %l1
	sta	%f21,	[%l7 + %l1] 0x19
	tneg	%icc,	0x3
	taddcctv	%o5,	0x0653,	%g6
	umul	%g1,	%g3,	%i0
	udivx	%o7,	0x124F,	%l5
	movrgz	%o1,	0x1E8,	%o4
	fsrc2s	%f10,	%f30
	sllx	%i4,	0x19,	%l2
	flush	%l7 + 0x48
	movgu	%xcc,	%i7,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g5,	%l0,	%o2
	edge8	%o0,	%o6,	%i6
	sra	%o3,	%l1,	%i1
	fbule	%fcc3,	loop_1095
	fbule	%fcc3,	loop_1096
	taddcc	%i2,	%l6,	%g4
	fand	%f6,	%f8,	%f30
loop_1095:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x10] %asi,	%g7
loop_1096:
	fcmple32	%f26,	%f16,	%l3
	sdiv	%i5,	0x1064,	%g2
	addccc	%l4,	0x0FDA,	%g6
	set	0x42, %o4
	stha	%g1,	[%l7 + %o4] 0x10
	movge	%xcc,	%g3,	%o5
	umulcc	%i0,	%o7,	%o1
	fpackfix	%f2,	%f8
	bn,a	%xcc,	loop_1097
	orncc	%o4,	0x04A4,	%i4
	edge32l	%l2,	%i7,	%l5
	stw	%g5,	[%l7 + 0x4C]
loop_1097:
	andn	%l0,	%o2,	%i3
	nop
	setx	loop_1098,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orcc	%o6,	%o0,	%i6
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1098:
	nop
	set	0x1E, %o6
	ldsb	[%l7 + %o6],	%o3
	fble,a	%fcc0,	loop_1099
	sdivcc	%l1,	0x0E46,	%i2
	array32	%l6,	%i1,	%g4
	fmovsneg	%icc,	%f31,	%f2
loop_1099:
	movcc	%xcc,	%g7,	%l3
	mulx	%i5,	%l4,	%g6
	edge16l	%g2,	%g1,	%g3
	srlx	%i0,	%o5,	%o1
	addccc	%o7,	0x1428,	%i4
	tge	%icc,	0x4
	fbule,a	%fcc1,	loop_1100
	fmovrsgz	%o4,	%f12,	%f12
	fmovdg	%xcc,	%f21,	%f9
	fbg	%fcc2,	loop_1101
loop_1100:
	fbg	%fcc0,	loop_1102
	sethi	0x0FFE,	%i7
	alignaddr	%l5,	%g5,	%l2
loop_1101:
	srlx	%l0,	%i3,	%o6
loop_1102:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x30] %asi,	%o2
	movn	%icc,	%i6,	%o3
	sllx	%o0,	%i2,	%l6
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	smul	%l1,	%g7,	%g4
	movne	%icc,	%i5,	%l4
	srax	%g6,	%g2,	%l3
	addcc	%g1,	%g3,	%o5
	bvs,pn	%xcc,	loop_1103
	xorcc	%o1,	%o7,	%i0
	te	%xcc,	0x0
	fnegd	%f8,	%f0
loop_1103:
	fmovsa	%xcc,	%f19,	%f3
	tleu	%xcc,	0x3
	fmovdvs	%xcc,	%f25,	%f10
	movvs	%xcc,	%o4,	%i4
	tvc	%icc,	0x5
	fmovrdgez	%l5,	%f12,	%f12
	array8	%g5,	%i7,	%l0
	tn	%xcc,	0x4
	xnor	%i3,	%o6,	%l2
	stx	%o2,	[%l7 + 0x28]
	fcmpeq16	%f0,	%f26,	%o3
	movre	%i6,	0x249,	%o0
	fmovrdlz	%l6,	%f8,	%f2
	sir	0x18D3
	fbug,a	%fcc3,	loop_1104
	subc	%i1,	%i2,	%g7
	taddcctv	%g4,	0x0324,	%i5
	add	%l1,	0x0B14,	%l4
loop_1104:
	movrgez	%g2,	0x30C,	%l3
	sethi	0x0F8D,	%g1
	te	%icc,	0x2
	fnot2	%f2,	%f8
	udiv	%g3,	0x017C,	%o5
	membar	0x2D
	tvs	%xcc,	0x5
	mulx	%g6,	0x0184,	%o1
	wr	%g0,	0xe3,	%asi
	stda	%i0,	[%l7 + 0x08] %asi
	membar	#Sync
	udivcc	%o7,	0x157D,	%o4
	srax	%i4,	%l5,	%i7
	srl	%l0,	0x1E,	%i3
	bvc,a,pn	%icc,	loop_1105
	movpos	%icc,	%g5,	%l2
	ba,a,pt	%xcc,	loop_1106
	umulcc	%o2,	%o6,	%o3
loop_1105:
	fbu,a	%fcc3,	loop_1107
	fnegs	%f5,	%f12
loop_1106:
	nop
	setx loop_1108, %l0, %l1
	jmpl %l1, %o0
	movge	%xcc,	%l6,	%i1
loop_1107:
	fmovspos	%xcc,	%f6,	%f23
	sra	%i2,	0x03,	%i6
loop_1108:
	fcmpgt16	%f22,	%f16,	%g7
	movne	%icc,	%i5,	%l1
	brnz	%l4,	loop_1109
	movn	%xcc,	%g4,	%g2
	fnot2s	%f31,	%f0
	fornot1	%f4,	%f18,	%f18
loop_1109:
	tvc	%xcc,	0x6
	sdivcc	%l3,	0x0B21,	%g1
	movle	%xcc,	%o5,	%g3
	tne	%icc,	0x7
	ldd	[%l7 + 0x38],	%f18
	prefetch	[%l7 + 0x50],	 0x0
	te	%icc,	0x5
	edge32ln	%o1,	%g6,	%o7
	move	%icc,	%o4,	%i0
	fandnot1s	%f15,	%f2,	%f31
	fzero	%f14
	edge32ln	%l5,	%i7,	%l0
	stx	%i3,	[%l7 + 0x08]
	ldsw	[%l7 + 0x68],	%g5
	mulscc	%l2,	%o2,	%o6
	faligndata	%f18,	%f0,	%f6
	umulcc	%o3,	0x1515,	%i4
	orcc	%o0,	0x0C17,	%l6
	fpsub16s	%f15,	%f0,	%f13
	array8	%i2,	%i6,	%i1
	be,pn	%xcc,	loop_1110
	fcmpne16	%f24,	%f24,	%i5
	mulscc	%l1,	0x0530,	%g7
	movrlz	%g4,	%l4,	%l3
loop_1110:
	tcs	%xcc,	0x0
	fmul8ulx16	%f2,	%f26,	%f4
	movleu	%xcc,	%g2,	%o5
	std	%f30,	[%l7 + 0x50]
	move	%xcc,	%g1,	%g3
	add	%g6,	%o1,	%o7
	tge	%xcc,	0x0
	bcc,a,pn	%icc,	loop_1111
	tsubcc	%o4,	%l5,	%i0
	movge	%xcc,	%l0,	%i3
	edge32l	%g5,	%i7,	%o2
loop_1111:
	tn	%icc,	0x1
	fpack32	%f14,	%f6,	%f10
	set	0x2A, %l5
	stha	%l2,	[%l7 + %l5] 0x23
	membar	#Sync
	fcmpgt32	%f6,	%f0,	%o3
	tpos	%icc,	0x2
	ld	[%l7 + 0x7C],	%f12
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movrgez	%i4,	%o6,	%l6
	and	%o0,	0x1565,	%i2
	edge32	%i1,	%i6,	%l1
	xorcc	%g7,	%g4,	%i5
	fba,a	%fcc0,	loop_1112
	fsrc1	%f4,	%f18
	set	0x70, %i2
	stda	%l4,	[%l7 + %i2] 0x04
loop_1112:
	tne	%xcc,	0x4
	set	0x70, %l4
	swapa	[%l7 + %l4] 0x89,	%l3
	fcmpgt32	%f28,	%f6,	%g2
	set	0x26, %o7
	ldsha	[%l7 + %o7] 0x04,	%o5
	fnors	%f14,	%f14,	%f18
	fnegs	%f25,	%f20
	or	%g3,	0x1E59,	%g6
	andcc	%o1,	0x02EE,	%g1
	edge32l	%o7,	%l5,	%i0
	sir	0x190F
	fandnot1	%f10,	%f6,	%f22
	mulx	%l0,	%o4,	%i3
	bvs,pn	%icc,	loop_1113
	fnot2s	%f10,	%f15
	fbn,a	%fcc2,	loop_1114
	edge8	%g5,	%o2,	%l2
loop_1113:
	fbg	%fcc1,	loop_1115
	orcc	%o3,	%i4,	%o6
loop_1114:
	taddcc	%i7,	%l6,	%o0
	bcc	%icc,	loop_1116
loop_1115:
	edge16l	%i1,	%i6,	%l1
	edge16n	%i2,	%g7,	%i5
	edge8n	%l4,	%l3,	%g2
loop_1116:
	movrgez	%g4,	%o5,	%g3
	bvs	%xcc,	loop_1117
	movrne	%g6,	%g1,	%o1
	movvc	%xcc,	%l5,	%i0
	sub	%o7,	0x1B53,	%o4
loop_1117:
	fnot1	%f22,	%f8
	fsrc2	%f8,	%f30
	edge8	%i3,	%g5,	%l0
	fbge,a	%fcc0,	loop_1118
	tl	%icc,	0x4
	mova	%xcc,	%l2,	%o2
	bpos,a,pn	%icc,	loop_1119
loop_1118:
	fmovrdne	%o3,	%f2,	%f4
	subccc	%o6,	0x13FB,	%i4
	array8	%l6,	%i7,	%o0
loop_1119:
	nop
	set	0x7C, %g7
	ldswa	[%l7 + %g7] 0x0c,	%i1
	subcc	%l1,	%i2,	%i6
	tg	%xcc,	0x5
	tg	%icc,	0x5
	sra	%g7,	0x15,	%l4
	movvs	%xcc,	%l3,	%i5
	set	0x58, %g4
	stda	%g4,	[%l7 + %g4] 0x04
	movvc	%icc,	%o5,	%g2
	xnor	%g6,	%g3,	%o1
	std	%l4,	[%l7 + 0x38]
	nop
	setx	loop_1120,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlez	%g1,	loop_1121
	ldub	[%l7 + 0x10],	%i0
	movl	%xcc,	%o7,	%i3
loop_1120:
	and	%o4,	%l0,	%l2
loop_1121:
	edge16ln	%g5,	%o2,	%o6
	andncc	%i4,	%o3,	%l6
	xorcc	%o0,	0x1495,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f29,	%f16
	tcs	%xcc,	0x0
	udiv	%l1,	0x1322,	%i2
	srl	%i7,	%i6,	%g7
	alignaddrl	%l4,	%i5,	%g4
	orn	%l3,	0x0CE6,	%g2
	fmovdne	%xcc,	%f7,	%f20
	xnorcc	%g6,	%g3,	%o5
	brz,a	%o1,	loop_1122
	bvs,pt	%icc,	loop_1123
	edge16l	%g1,	%l5,	%i0
	xor	%o7,	0x098C,	%o4
loop_1122:
	movre	%i3,	%l2,	%g5
loop_1123:
	sdiv	%l0,	0x1A31,	%o2
	brgz	%o6,	loop_1124
	movvs	%icc,	%i4,	%l6
	edge8ln	%o0,	%i1,	%o3
	move	%xcc,	%i2,	%i7
loop_1124:
	ldub	[%l7 + 0x79],	%i6
	xorcc	%l1,	%l4,	%g7
	andncc	%i5,	%l3,	%g2
	tge	%icc,	0x4
	movle	%xcc,	%g4,	%g6
	call	loop_1125
	tneg	%xcc,	0x3
	bgu,pn	%icc,	loop_1126
	tpos	%icc,	0x6
loop_1125:
	nop
	set	0x58, %l0
	ldsha	[%l7 + %l0] 0x15,	%g3
loop_1126:
	movg	%icc,	%o1,	%g1
	set	0x6C, %i6
	ldstuba	[%l7 + %i6] 0x18,	%l5
	xorcc	%o5,	0x08C9,	%i0
	fpadd32	%f20,	%f4,	%f24
	alignaddrl	%o7,	%i3,	%l2
	fandnot1s	%f17,	%f7,	%f24
	xnor	%o4,	%g5,	%l0
	stx	%o6,	[%l7 + 0x58]
	sub	%o2,	%i4,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l6,	%o3,	%i1
	udivx	%i7,	0x0CFB,	%i6
	subccc	%l1,	0x0333,	%l4
	bcc,a,pn	%xcc,	loop_1127
	fmovdcs	%icc,	%f30,	%f14
	taddcc	%g7,	%i5,	%l3
	fpsub16s	%f18,	%f19,	%f31
loop_1127:
	edge32	%i2,	%g4,	%g2
	sethi	0x1277,	%g6
	tn	%icc,	0x1
	ldsh	[%l7 + 0x4A],	%g3
	fnot1s	%f17,	%f1
	movne	%icc,	%g1,	%l5
	swap	[%l7 + 0x7C],	%o5
	fba	%fcc3,	loop_1128
	nop
	set	0x6C, %o2
	ldsw	[%l7 + %o2],	%o1
	edge8ln	%o7,	%i0,	%i3
	ble	loop_1129
loop_1128:
	fmovsne	%icc,	%f25,	%f29
	addcc	%o4,	%l2,	%g5
	movrne	%l0,	%o2,	%o6
loop_1129:
	fmovdcs	%xcc,	%f5,	%f15
	xnor	%i4,	%l6,	%o3
	tvs	%xcc,	0x0
	umul	%i1,	0x125D,	%o0
	sth	%i7,	[%l7 + 0x24]
	movvc	%xcc,	%i6,	%l1
	fmovdleu	%icc,	%f26,	%f13
	movre	%g7,	0x2A3,	%l4
	movneg	%xcc,	%i5,	%l3
	addc	%i2,	0x0E64,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f10
	popc	0x0804,	%g6
	fmovdvs	%xcc,	%f5,	%f10
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	mulx	%g2,	%g1,	%o5
	sll	%l5,	%o7,	%o1
	sll	%i3,	%o4,	%i0
	movn	%xcc,	%g5,	%l0
	be,a	%xcc,	loop_1130
	ba,a	%xcc,	loop_1131
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a	loop_1132
loop_1130:
	tvs	%xcc,	0x5
loop_1131:
	orncc	%o2,	%o6,	%i4
	mulscc	%l2,	%o3,	%i1
loop_1132:
	array8	%l6,	%o0,	%i6
	set	0x74, %g6
	sta	%f23,	[%l7 + %g6] 0x89
	udivcc	%i7,	0x033B,	%l1
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x78] %asi,	%g7
	fpsub32	%f0,	%f16,	%f18
	set	0x10, %i0
	lduha	[%l7 + %i0] 0x19,	%l4
	sdivx	%i5,	0x1AB7,	%l3
	fmul8x16	%f11,	%f0,	%f28
	movne	%icc,	%g4,	%i2
	edge16l	%g3,	%g2,	%g6
	udivcc	%g1,	0x1E11,	%l5
	addcc	%o5,	%o1,	%i3
	fsrc2s	%f19,	%f17
	mulx	%o4,	0x1256,	%o7
	saved
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
	fornot2s	%f22,	%f27,	%f28
	subcc	%i0,	0x01A7,	%g5
	bvs,pn	%xcc,	loop_1133
	movneg	%xcc,	%o2,	%l0
	be,a,pt	%xcc,	loop_1134
	brnz,a	%o6,	loop_1135
loop_1133:
	umul	%l2,	%i4,	%i1
	tge	%icc,	0x1
loop_1134:
	sllx	%o3,	0x0E,	%o0
loop_1135:
	andcc	%i6,	%i7,	%l1
	addcc	%g7,	0x1F9D,	%l4
	bne,a	loop_1136
	fpadd32s	%f10,	%f3,	%f29
	movrgz	%l6,	%l3,	%g4
	array16	%i2,	%i5,	%g3
loop_1136:
	brz	%g6,	loop_1137
	brgez	%g2,	loop_1138
	tne	%icc,	0x2
	for	%f22,	%f30,	%f16
loop_1137:
	fmovrdlez	%l5,	%f30,	%f14
loop_1138:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f10,	%f18,	%f4
	stw	%g1,	[%l7 + 0x4C]
	mova	%xcc,	%o1,	%o5
	fmovsle	%xcc,	%f4,	%f28
	fmovsn	%icc,	%f8,	%f8
	smul	%i3,	%o7,	%o4
	fbule,a	%fcc0,	loop_1139
	edge16	%i0,	%o2,	%l0
	fxor	%f10,	%f30,	%f20
	array16	%o6,	%g5,	%i4
loop_1139:
	movvs	%xcc,	%l2,	%o3
	umul	%i1,	%i6,	%i7
	xorcc	%o0,	%g7,	%l1
	fnors	%f17,	%f8,	%f19
	add	%l4,	0x05C2,	%l6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%l3
	stbar
	set	0x5A, %o0
	stha	%i5,	[%l7 + %o0] 0xe3
	membar	#Sync
	fnegs	%f28,	%f16
	andncc	%g3,	%i2,	%g2
	srax	%g6,	0x0B,	%l5
	set	0x18, %o5
	ldsha	[%l7 + %o5] 0x14,	%g1
	fmovrdlz	%o5,	%f2,	%f12
	subc	%i3,	0x10CD,	%o1
	fpmerge	%f25,	%f7,	%f30
	subc	%o7,	0x0DDB,	%i0
	tge	%icc,	0x4
	orncc	%o2,	0x1F07,	%l0
	sethi	0x053C,	%o4
	subcc	%g5,	0x07A3,	%i4
	udivcc	%o6,	0x1ED0,	%o3
	movre	%l2,	0x24C,	%i1
	fcmpeq16	%f12,	%f14,	%i6
	set	0x6C, %o1
	ldswa	[%l7 + %o1] 0x10,	%i7
	tvc	%icc,	0x4
	fpadd32	%f18,	%f20,	%f2
	nop
	setx	loop_1140,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot1s	%f15,	%f10,	%f9
	call	loop_1141
	xor	%g7,	%l1,	%l4
loop_1140:
	ba,pn	%xcc,	loop_1142
	array8	%l6,	%g4,	%l3
loop_1141:
	bge,pn	%icc,	loop_1143
	tne	%xcc,	0x3
loop_1142:
	srax	%o0,	%g3,	%i5
	lduw	[%l7 + 0x2C],	%g2
loop_1143:
	tneg	%icc,	0x4
	mulx	%g6,	%l5,	%g1
	movvc	%icc,	%i2,	%o5
	fones	%f14
	subcc	%i3,	%o1,	%o7
	tvs	%icc,	0x1
	udiv	%o2,	0x1F3E,	%i0
	tl	%icc,	0x4
	orcc	%l0,	%o4,	%i4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
	fmovrslez	%o6,	%f14,	%f26
	fxor	%f6,	%f12,	%f20
	ldsw	[%l7 + 0x2C],	%l2
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x27,	%o2
	bcs,a	loop_1144
	sdivx	%i6,	0x1745,	%i1
	tl	%xcc,	0x6
	fornot2	%f20,	%f18,	%f30
loop_1144:
	edge16l	%i7,	%l1,	%l4
	fcmpgt32	%f18,	%f26,	%l6
	fmovsgu	%xcc,	%f4,	%f20
	fblg,a	%fcc1,	loop_1145
	movpos	%xcc,	%g4,	%g7
	array32	%l3,	%g3,	%o0
	nop
	setx loop_1146, %l0, %l1
	jmpl %l1, %i5
loop_1145:
	sth	%g6,	[%l7 + 0x24]
	bshuffle	%f2,	%f6,	%f4
	prefetch	[%l7 + 0x34],	 0x1
loop_1146:
	fpsub32	%f26,	%f8,	%f22
	set	0x20, %i1
	ldsha	[%l7 + %i1] 0x0c,	%g2
	tn	%icc,	0x3
	popc	0x1976,	%l5
	sdiv	%i2,	0x0408,	%o5
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%g1
	movne	%xcc,	%i3,	%o1
	fpack32	%f12,	%f20,	%f30
	tn	%icc,	0x2
	stx	%o7,	[%l7 + 0x40]
	fsrc1s	%f22,	%f15
	fmovrsgz	%i0,	%f3,	%f5
	te	%icc,	0x0
	bvs,a,pn	%xcc,	loop_1147
	tleu	%xcc,	0x6
	fcmpeq16	%f20,	%f24,	%l0
	or	%o4,	%i4,	%o2
loop_1147:
	array8	%o6,	%g5,	%o3
	fmovscc	%icc,	%f9,	%f19
	fmuld8sux16	%f12,	%f31,	%f12
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	tle	%icc,	0x6
	fmovrdlz	%l2,	%f10,	%f26
	srax	%i1,	0x0A,	%l1
	fba	%fcc1,	loop_1148
	tge	%icc,	0x2
	mulscc	%l4,	%i7,	%l6
	lduw	[%l7 + 0x58],	%g7
loop_1148:
	fmovsa	%icc,	%f10,	%f29
	umul	%g4,	%l3,	%g3
	fbge,a	%fcc3,	loop_1149
	movrlez	%i5,	0x3C0,	%g6
	fmovsvs	%xcc,	%f0,	%f30
	and	%g2,	0x1872,	%o0
loop_1149:
	sllx	%i2,	0x10,	%l5
	sdiv	%g1,	0x1DDD,	%o5
	udivx	%i3,	0x1F2A,	%o1
	fandnot2	%f6,	%f8,	%f12
	mulscc	%o7,	0x036E,	%l0
	pdist	%f2,	%f18,	%f24
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x34] %asi,	%o4
	fbuge,a	%fcc0,	loop_1150
	bvc	%xcc,	loop_1151
	orn	%i4,	0x1B38,	%i0
	fmovscc	%icc,	%f17,	%f12
loop_1150:
	movle	%icc,	%o2,	%g5
loop_1151:
	udivx	%o6,	0x17C9,	%o3
	tgu	%icc,	0x1
	ta	%xcc,	0x5
	std	%f10,	[%l7 + 0x10]
	set	0x78, %i5
	prefetcha	[%l7 + %i5] 0x88,	 0x0
	movleu	%xcc,	%l2,	%l1
	tn	%xcc,	0x3
	fbue	%fcc1,	loop_1152
	tcs	%xcc,	0x4
	ldub	[%l7 + 0x18],	%i1
	ldsh	[%l7 + 0x5C],	%i7
loop_1152:
	bpos,a,pn	%xcc,	loop_1153
	fnot1s	%f16,	%f2
	sir	0x0ACB
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x7C] %asi,	%f10
loop_1153:
	movvc	%icc,	%l6,	%l4
	subc	%g4,	%g7,	%g3
	fexpand	%f24,	%f4
	fmovdpos	%icc,	%f0,	%f10
	be,pt	%icc,	loop_1154
	tne	%xcc,	0x3
	movge	%xcc,	%l3,	%g6
	movcs	%xcc,	%i5,	%g2
loop_1154:
	fcmpne32	%f20,	%f12,	%i2
	tcs	%icc,	0x7
	edge32ln	%l5,	%o0,	%o5
	set	0x1A, %g2
	stha	%i3,	[%l7 + %g2] 0x23
	membar	#Sync
	movre	%o1,	%g1,	%l0
	fbue	%fcc0,	loop_1155
	udivx	%o7,	0x0934,	%i4
	fbe	%fcc1,	loop_1156
	movrlez	%i0,	%o4,	%o2
loop_1155:
	srl	%g5,	0x1E,	%o6
	lduw	[%l7 + 0x3C],	%o3
loop_1156:
	fors	%f5,	%f6,	%f7
	edge16	%i6,	%l2,	%i1
	mova	%icc,	%l1,	%i7
	addccc	%l6,	%l4,	%g7
	xorcc	%g3,	%g4,	%g6
	sra	%i5,	%l3,	%g2
	movrlz	%i2,	%l5,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%i3,	%f28,	%f20
	fands	%f8,	%f2,	%f4
	xnor	%o0,	0x1C4D,	%o1
	subc	%g1,	%l0,	%o7
	add	%i0,	%i4,	%o4
	tcs	%icc,	0x1
	orcc	%o2,	0x051B,	%o6
	movrgz	%g5,	%i6,	%o3
	fnors	%f14,	%f12,	%f31
	fmovse	%icc,	%f27,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l2,	0x0FBB,	%i1
	fmovdvs	%xcc,	%f11,	%f20
	ldsh	[%l7 + 0x56],	%i7
	fbe,a	%fcc3,	loop_1157
	ba,a	loop_1158
	movcc	%xcc,	%l6,	%l4
	popc	%l1,	%g3
loop_1157:
	movrlz	%g4,	0x303,	%g6
loop_1158:
	fbe,a	%fcc0,	loop_1159
	movrne	%i5,	%l3,	%g7
	fornot2s	%f16,	%f24,	%f27
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1159:
	brlez	%g2,	loop_1160
	mulx	%i2,	0x123A,	%l5
	fornot2s	%f26,	%f8,	%f9
	nop
	setx loop_1161, %l0, %l1
	jmpl %l1, %i3
loop_1160:
	and	%o5,	0x1629,	%o1
	nop
	set	0x37, %i3
	stb	%o0,	[%l7 + %i3]
	fbne,a	%fcc2,	loop_1162
loop_1161:
	xnorcc	%l0,	0x0B99,	%g1
	te	%xcc,	0x6
	movgu	%xcc,	%o7,	%i0
loop_1162:
	xorcc	%i4,	0x0F7B,	%o2
	movg	%icc,	%o4,	%g5
	stb	%i6,	[%l7 + 0x13]
	ldd	[%l7 + 0x40],	%o2
	pdist	%f10,	%f10,	%f28
	alignaddr	%o6,	%l2,	%i1
	tvs	%xcc,	0x4
	sra	%l6,	0x02,	%i7
	movpos	%icc,	%l1,	%g3
	movvc	%xcc,	%l4,	%g4
	fbug,a	%fcc2,	loop_1163
	fmul8x16au	%f25,	%f24,	%f6
	mulx	%i5,	0x12D7,	%g6
	orncc	%g7,	0x0DBA,	%g2
loop_1163:
	subc	%i2,	%l3,	%l5
	xnorcc	%i3,	0x1531,	%o5
	movle	%xcc,	%o1,	%l0
	tleu	%icc,	0x6
	fsrc2	%f30,	%f28
	ldsh	[%l7 + 0x5C],	%o0
	fnot2	%f28,	%f26
	sllx	%o7,	%g1,	%i4
	movpos	%icc,	%o2,	%i0
	fornot2s	%f5,	%f10,	%f24
	bl,pt	%xcc,	loop_1164
	mova	%icc,	%g5,	%i6
	fbge	%fcc2,	loop_1165
	movrne	%o4,	0x3E7,	%o6
loop_1164:
	tcc	%icc,	0x4
	mova	%icc,	%o3,	%l2
loop_1165:
	orn	%l6,	0x029A,	%i1
	bshuffle	%f20,	%f30,	%f26
	fmovse	%xcc,	%f24,	%f25
	bne,pn	%icc,	loop_1166
	te	%icc,	0x4
	addc	%i7,	0x13CD,	%l1
	tcs	%icc,	0x5
loop_1166:
	fpsub32	%f0,	%f22,	%f18
	te	%icc,	0x1
	bleu	loop_1167
	movrlz	%g3,	0x25B,	%g4
	ldub	[%l7 + 0x3D],	%i5
	ldd	[%l7 + 0x28],	%g6
loop_1167:
	fzeros	%f18
	sllx	%l4,	%g7,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovrsgez	%l3,	%f4,	%f16
	fbul,a	%fcc3,	loop_1168
	orn	%i2,	%l5,	%o5
	tle	%xcc,	0x1
	movvc	%icc,	%o1,	%i3
loop_1168:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l0,	0x15DF,	%o7
	stx	%g1,	[%l7 + 0x08]
	sdivcc	%i4,	0x1F73,	%o2
	popc	0x170A,	%o0
	and	%g5,	%i0,	%i6
	stbar
	ldd	[%l7 + 0x10],	%f22
	udiv	%o4,	0x03E7,	%o6
	st	%f9,	[%l7 + 0x44]
	fbu	%fcc2,	loop_1169
	tsubcctv	%l2,	%o3,	%l6
	flush	%l7 + 0x2C
	stbar
loop_1169:
	nop
	set	0x28, %o3
	swapa	[%l7 + %o3] 0x0c,	%i1
	fmovdvc	%icc,	%f26,	%f22
	bpos,a	loop_1170
	membar	0x22
	andcc	%i7,	0x09DA,	%l1
	stbar
loop_1170:
	ta	%icc,	0x3
	srlx	%g3,	0x1D,	%g4
	fnegs	%f22,	%f26
	fbne	%fcc3,	loop_1171
	edge8	%g6,	%l4,	%g7
	fpadd32s	%f2,	%f3,	%f16
	tvs	%icc,	0x1
loop_1171:
	stx	%g2,	[%l7 + 0x58]
	fbge,a	%fcc3,	loop_1172
	and	%l3,	0x1791,	%i2
	edge16l	%i5,	%o5,	%o1
	subcc	%l5,	%i3,	%l0
loop_1172:
	fbu,a	%fcc0,	loop_1173
	brz,a	%o7,	loop_1174
	taddcc	%i4,	%g1,	%o0
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1173:
	fnot1s	%f2,	%f10
loop_1174:
	array16	%o2,	%i0,	%i6
	umul	%g5,	%o4,	%o6
	sll	%l2,	%l6,	%o3
	fmovsle	%icc,	%f31,	%f21
	set	0x30, %l6
	stba	%i7,	[%l7 + %l6] 0x88
	sllx	%l1,	0x1A,	%g3
	srlx	%g4,	%g6,	%l4
	fbuge,a	%fcc1,	loop_1175
	movvc	%icc,	%i1,	%g7
	mulx	%g2,	%l3,	%i5
	edge32	%i2,	%o5,	%l5
loop_1175:
	alignaddrl	%o1,	%l0,	%i3
	movcs	%icc,	%i4,	%g1
	tgu	%icc,	0x0
	fmul8sux16	%f4,	%f10,	%f14
	bleu	%xcc,	loop_1176
	fnot1s	%f23,	%f21
	addc	%o0,	0x040A,	%o7
	fmul8sux16	%f16,	%f16,	%f14
loop_1176:
	movrgez	%i0,	0x2E7,	%i6
	bpos	loop_1177
	sdiv	%g5,	0x0B8F,	%o4
	movneg	%icc,	%o2,	%o6
	movre	%l2,	0x09B,	%l6
loop_1177:
	ld	[%l7 + 0x78],	%f13
	fabss	%f8,	%f11
	edge32l	%i7,	%l1,	%o3
	umul	%g3,	0x0C3B,	%g4
	fmovrdlez	%l4,	%f12,	%f10
	fmovrdlz	%g6,	%f30,	%f0
	fbg	%fcc2,	loop_1178
	and	%g7,	%i1,	%g2
	taddcctv	%l3,	%i5,	%i2
	andcc	%l5,	0x1507,	%o5
loop_1178:
	sdiv	%o1,	0x0EE9,	%i3
	addccc	%i4,	%g1,	%l0
	fmovrslez	%o7,	%f26,	%f7
	fmovdne	%icc,	%f9,	%f25
	fble	%fcc1,	loop_1179
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1180,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovse	%xcc,	%f26,	%f31
loop_1179:
	nop
	set	0x08, %l3
	stha	%i0,	[%l7 + %l3] 0x80
loop_1180:
	fmovdg	%icc,	%f26,	%f13
	smulcc	%i6,	0x1BA8,	%g5
	fmovs	%f14,	%f20
	fcmpne32	%f4,	%f30,	%o4
	udivx	%o2,	0x1056,	%o0
	movcc	%icc,	%l2,	%o6
	wr	%g0,	0x2a,	%asi
	stda	%i6,	[%l7 + 0x70] %asi
	membar	#Sync
	bshuffle	%f24,	%f10,	%f4
	smulcc	%l1,	0x0AE4,	%o3
	fmovsneg	%xcc,	%f18,	%f17
	tvc	%xcc,	0x3
	tsubcc	%i7,	0x122E,	%g3
	edge32n	%g4,	%g6,	%l4
	xor	%i1,	%g7,	%l3
	movl	%xcc,	%g2,	%i5
	addcc	%i2,	0x10C6,	%l5
	tcc	%icc,	0x6
	andn	%o1,	0x1469,	%o5
	tne	%xcc,	0x1
	fcmple16	%f26,	%f24,	%i3
	movl	%icc,	%g1,	%l0
	set	0x24, %g5
	lduwa	[%l7 + %g5] 0x11,	%i4
	tvs	%icc,	0x6
	add	%o7,	0x1833,	%i6
	sdiv	%i0,	0x007C,	%o4
	tneg	%icc,	0x4
	srlx	%g5,	0x11,	%o2
	set	0x74, %i7
	lduwa	[%l7 + %i7] 0x15,	%l2
	fmovrsne	%o6,	%f18,	%f27
	fmovrdlz	%l6,	%f24,	%f20
	fmul8ulx16	%f24,	%f22,	%f14
	fmovsg	%xcc,	%f6,	%f28
	srl	%o0,	0x09,	%o3
	brgez,a	%l1,	loop_1181
	movvc	%icc,	%i7,	%g3
	fmovrse	%g6,	%f2,	%f8
	alignaddr	%l4,	%i1,	%g4
loop_1181:
	xnorcc	%g7,	%g2,	%i5
	array32	%l3,	%l5,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o1,	%i3,	%g1
	subcc	%o5,	0x0E27,	%i4
	edge16l	%o7,	%i6,	%l0
	sethi	0x06A0,	%i0
	edge32n	%o4,	%g5,	%l2
	fbue	%fcc2,	loop_1182
	ba,a	%xcc,	loop_1183
	tgu	%icc,	0x2
	fpadd16	%f6,	%f14,	%f8
loop_1182:
	edge16l	%o6,	%o2,	%o0
loop_1183:
	movge	%xcc,	%o3,	%l6
	fnors	%f27,	%f24,	%f26
	brlez,a	%l1,	loop_1184
	nop
	setx	loop_1185,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivcc	%i7,	0x01EA,	%g3
	subcc	%g6,	0x1739,	%l4
loop_1184:
	xnorcc	%g4,	%g7,	%g2
loop_1185:
	sub	%i1,	0x0105,	%i5
	addc	%l5,	0x0D7A,	%i2
	brgz,a	%l3,	loop_1186
	movg	%xcc,	%o1,	%i3
	nop
	setx loop_1187, %l0, %l1
	jmpl %l1, %o5
	movcc	%xcc,	%g1,	%i4
loop_1186:
	tsubcctv	%o7,	0x08EA,	%l0
	movrlz	%i0,	%i6,	%g5
loop_1187:
	tge	%icc,	0x3
	srl	%o4,	%o6,	%o2
	edge16	%l2,	%o3,	%l6
	edge8ln	%l1,	%i7,	%o0
	fpsub16	%f2,	%f28,	%f6
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x18,	%f0
	udiv	%g6,	0x1A3B,	%g3
	fnors	%f18,	%f1,	%f7
	movvs	%icc,	%g4,	%l4
	edge8n	%g2,	%i1,	%g7
	movrlz	%l5,	%i5,	%l3
	ldsw	[%l7 + 0x08],	%o1
	fmovrde	%i2,	%f12,	%f2
	set	0x34, %l2
	ldswa	[%l7 + %l2] 0x80,	%i3
	bcs,a,pn	%icc,	loop_1188
	mulscc	%g1,	%o5,	%o7
	tle	%icc,	0x6
	popc	0x1337,	%i4
loop_1188:
	array32	%l0,	%i0,	%i6
	tg	%xcc,	0x3
	lduw	[%l7 + 0x14],	%g5
	fbuge,a	%fcc2,	loop_1189
	orncc	%o6,	0x1E98,	%o2
	edge32n	%l2,	%o4,	%l6
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x68] %asi,	%l1
loop_1189:
	bpos	%icc,	loop_1190
	fnand	%f20,	%f24,	%f26
	array32	%i7,	%o0,	%g6
	pdist	%f22,	%f14,	%f22
loop_1190:
	move	%icc,	%g3,	%g4
	call	loop_1191
	fblg,a	%fcc1,	loop_1192
	tsubcctv	%l4,	%g2,	%i1
	sdiv	%o3,	0x1EB2,	%g7
loop_1191:
	fbe	%fcc0,	loop_1193
loop_1192:
	fmovdvc	%xcc,	%f5,	%f31
	wr	%g0,	0xea,	%asi
	stha	%i5,	[%l7 + 0x58] %asi
	membar	#Sync
loop_1193:
	umulcc	%l3,	%l5,	%i2
	fones	%f15
	or	%o1,	0x11AE,	%i3
	fors	%f9,	%f5,	%f14
	sra	%g1,	%o7,	%i4
	fmovrdlz	%l0,	%f28,	%f0
	fsrc2	%f6,	%f4
	stbar
	udiv	%o5,	0x0539,	%i0
	srlx	%g5,	0x00,	%i6
	fnand	%f20,	%f2,	%f28
	set	0x4C, %g1
	sta	%f18,	[%l7 + %g1] 0x11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o2,	%l2
	ldd	[%l7 + 0x08],	%f8
	movvc	%xcc,	%o6,	%o4
	set	0x50, %l1
	stxa	%l1,	[%l7 + %l1] 0x2a
	membar	#Sync
	fmuld8sux16	%f5,	%f30,	%f24
	fbo,a	%fcc2,	loop_1194
	array32	%i7,	%l6,	%g6
	tgu	%icc,	0x7
	alignaddr	%g3,	%g4,	%o0
loop_1194:
	movrgz	%g2,	%l4,	%o3
	bcs,pn	%xcc,	loop_1195
	fmovsle	%icc,	%f0,	%f11
	bne	loop_1196
	sdiv	%i1,	0x1B07,	%g7
loop_1195:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%l3,	%i5
loop_1196:
	fnands	%f20,	%f3,	%f12
	edge16	%i2,	%l5,	%i3
	fmovsl	%icc,	%f6,	%f3
	bshuffle	%f18,	%f4,	%f0
	sdivcc	%o1,	0x1AE2,	%o7
	fmovd	%f0,	%f26
	ble,a	loop_1197
	fmovdn	%icc,	%f20,	%f18
	mova	%xcc,	%i4,	%g1
	ldsb	[%l7 + 0x13],	%o5
loop_1197:
	addcc	%i0,	%g5,	%l0
	sdivcc	%i6,	0x1E5F,	%o2
	fcmps	%fcc2,	%f7,	%f6
	sdivcc	%o6,	0x027E,	%o4
	bg,a	%icc,	loop_1198
	addc	%l2,	0x004E,	%i7
	tvs	%xcc,	0x2
	edge16l	%l6,	%g6,	%g3
loop_1198:
	orncc	%g4,	%o0,	%l1
	mova	%icc,	%g2,	%o3
	st	%f30,	[%l7 + 0x08]
	srlx	%l4,	%i1,	%g7
	add	%l3,	%i5,	%l5
	fmovscc	%icc,	%f8,	%f4
	fnegd	%f6,	%f30
	ld	[%l7 + 0x2C],	%f0
	bgu,pn	%icc,	loop_1199
	tge	%icc,	0x5
	udivx	%i3,	0x1A91,	%i2
	andcc	%o7,	0x1FE5,	%i4
loop_1199:
	and	%g1,	0x13C4,	%o1
	tg	%icc,	0x4
	taddcc	%o5,	%g5,	%l0
	fand	%f30,	%f12,	%f24
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%i0
	brlez,a	%i6,	loop_1200
	mova	%xcc,	%o2,	%o6
	edge16l	%o4,	%i7,	%l2
	edge32	%g6,	%l6,	%g4
loop_1200:
	brgz	%g3,	loop_1201
	tcs	%xcc,	0x7
	set	0x68, %o4
	stxa	%o0,	[%l7 + %o4] 0x10
loop_1201:
	fones	%f5
	edge32l	%l1,	%o3,	%g2
	bvc,pt	%icc,	loop_1202
	sub	%i1,	0x014F,	%l4
	srax	%l3,	0x0C,	%i5
	edge8	%g7,	%i3,	%i2
loop_1202:
	sth	%o7,	[%l7 + 0x2A]
	set	0x220, %o6
	stxa	%i4,	[%g0 + %o6] 0x52
	tcs	%xcc,	0x3
	movge	%xcc,	%l5,	%o1
	fmovrdgez	%o5,	%f20,	%f28
	orcc	%g5,	%l0,	%i0
	addcc	%i6,	%o2,	%o6
	faligndata	%f24,	%f26,	%f8
	fcmple16	%f4,	%f20,	%g1
	movrne	%o4,	0x10D,	%i7
	sethi	0x0649,	%l2
	smul	%g6,	%l6,	%g3
	tle	%xcc,	0x0
	set	0x14, %i2
	ldsha	[%l7 + %i2] 0x19,	%o0
	xnorcc	%g4,	0x1B34,	%o3
	fmovse	%xcc,	%f19,	%f10
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x24] %asi,	%i1
	bl,a,pn	%icc,	loop_1203
	fbg,a	%fcc3,	loop_1204
	stbar
	xnorcc	%l4,	0x138A,	%l1
loop_1203:
	srl	%l3,	%g7,	%i5
loop_1204:
	movleu	%xcc,	%i2,	%o7
	movge	%xcc,	%i3,	%i4
	movle	%icc,	%l5,	%o5
	movpos	%icc,	%g5,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x30],	%i0
	edge32	%i6,	%o1,	%o2
	fmovdge	%icc,	%f4,	%f24
	tle	%xcc,	0x7
	tgu	%xcc,	0x4
	set	0x30, %l5
	stda	%g0,	[%l7 + %l5] 0x88
	and	%o6,	%o4,	%i7
	movrlz	%g6,	%l2,	%g3
	fpack32	%f18,	%f30,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc0,	loop_1205
	ta	%xcc,	0x4
	tl	%icc,	0x4
	lduw	[%l7 + 0x20],	%l6
loop_1205:
	movne	%xcc,	%o0,	%g4
	brgz	%o3,	loop_1206
	popc	0x1750,	%i1
	fbuge	%fcc0,	loop_1207
	addccc	%g2,	0x19A4,	%l1
loop_1206:
	sub	%l3,	%l4,	%i5
	fbo,a	%fcc0,	loop_1208
loop_1207:
	movge	%icc,	%i2,	%o7
	fbl	%fcc1,	loop_1209
	fmovsa	%icc,	%f14,	%f21
loop_1208:
	array16	%g7,	%i3,	%l5
	fandnot1s	%f26,	%f21,	%f10
loop_1209:
	std	%i4,	[%l7 + 0x28]
	array8	%o5,	%l0,	%g5
	fnegd	%f28,	%f24
	fbul,a	%fcc0,	loop_1210
	ba,a	loop_1211
	fmul8ulx16	%f6,	%f22,	%f6
	fble,a	%fcc3,	loop_1212
loop_1210:
	bleu,a	%xcc,	loop_1213
loop_1211:
	fbue,a	%fcc3,	loop_1214
	movre	%i0,	0x0B4,	%o1
loop_1212:
	tsubcctv	%i6,	%o2,	%o6
loop_1213:
	smul	%g1,	%o4,	%g6
loop_1214:
	orn	%i7,	0x1A83,	%l2
	fzeros	%f11
	fpadd32	%f22,	%f30,	%f28
	xnorcc	%g3,	0x15D2,	%o0
	orncc	%l6,	0x1889,	%o3
	sdivcc	%i1,	0x0CF9,	%g4
	call	loop_1215
	movcs	%xcc,	%l1,	%g2
	array32	%l3,	%i5,	%i2
	movvs	%xcc,	%l4,	%o7
loop_1215:
	fpadd16	%f2,	%f10,	%f30
	movcc	%icc,	%i3,	%g7
	or	%l5,	0x0AA8,	%i4
	brgez	%l0,	loop_1216
	subccc	%g5,	%o5,	%i0
	fcmple32	%f0,	%f12,	%i6
	nop
	setx	loop_1217,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1216:
	subccc	%o2,	%o1,	%o6
	ld	[%l7 + 0x60],	%f14
	ta	%icc,	0x4
loop_1217:
	fandnot2	%f18,	%f24,	%f0
	fmul8ulx16	%f18,	%f12,	%f24
	movrgez	%g1,	0x15F,	%o4
	sra	%g6,	%l2,	%i7
	movre	%o0,	0x3AD,	%g3
	edge32l	%o3,	%i1,	%l6
	taddcc	%g4,	%g2,	%l3
	ldsh	[%l7 + 0x10],	%i5
	fmovdneg	%xcc,	%f12,	%f6
	tn	%xcc,	0x6
	ld	[%l7 + 0x1C],	%f1
	xor	%l1,	0x1E3D,	%i2
	smulcc	%o7,	%l4,	%i3
	taddcc	%l5,	0x11FC,	%i4
	fornot2	%f16,	%f16,	%f0
	xnorcc	%g7,	0x1771,	%l0
	fbn	%fcc2,	loop_1218
	movrne	%g5,	0x0C6,	%i0
	movcc	%xcc,	%o5,	%o2
	movrgez	%i6,	%o1,	%g1
loop_1218:
	bne,a	%icc,	loop_1219
	fmovdge	%icc,	%f30,	%f11
	edge16	%o6,	%o4,	%g6
	flush	%l7 + 0x6C
loop_1219:
	fmovsvc	%icc,	%f7,	%f31
	fmovsge	%icc,	%f7,	%f14
	srlx	%l2,	%o0,	%i7
	fmuld8ulx16	%f6,	%f31,	%f22
	fornot1s	%f14,	%f27,	%f3
	tne	%icc,	0x4
	fbu	%fcc2,	loop_1220
	umul	%o3,	0x128F,	%i1
	fmovdneg	%icc,	%f21,	%f16
	fnor	%f2,	%f2,	%f10
loop_1220:
	tvs	%icc,	0x4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%l6
	fnors	%f19,	%f9,	%f4
	set	0x16, %l4
	lduba	[%l7 + %l4] 0x18,	%g2
	orcc	%g4,	0x10C5,	%l3
	tcc	%icc,	0x0
	movcs	%icc,	%i5,	%l1
	fmovdne	%xcc,	%f14,	%f28
	bvs,pn	%xcc,	loop_1221
	tvc	%icc,	0x4
	fcmpgt16	%f20,	%f2,	%o7
	smul	%l4,	%i3,	%l5
loop_1221:
	bshuffle	%f8,	%f30,	%f4
	movrgz	%i4,	0x0D5,	%g7
	or	%l0,	0x1AA1,	%g5
	sdivcc	%i0,	0x1163,	%o5
	bpos,pt	%icc,	loop_1222
	movl	%icc,	%o2,	%i6
	fornot1s	%f5,	%f7,	%f18
	edge16n	%o1,	%i2,	%o6
loop_1222:
	array16	%g1,	%g6,	%l2
	movrgz	%o0,	%o4,	%o3
	fblg	%fcc2,	loop_1223
	and	%i1,	0x14ED,	%i7
	array8	%l6,	%g3,	%g4
	movleu	%icc,	%l3,	%g2
loop_1223:
	tsubcctv	%i5,	%o7,	%l1
	movne	%xcc,	%l4,	%i3
	fmovdneg	%xcc,	%f13,	%f29
	sub	%l5,	0x15B2,	%i4
	edge8	%l0,	%g7,	%i0
	edge32n	%o5,	%g5,	%o2
	set	0x7C, %o7
	swapa	[%l7 + %o7] 0x10,	%i6
	nop
	set	0x40, %g7
	std	%i2,	[%l7 + %g7]
	set	0x1D, %g4
	lduba	[%l7 + %g4] 0x18,	%o6
	fmovsneg	%xcc,	%f7,	%f6
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f16
	edge8	%o1,	%g6,	%g1
	for	%f2,	%f12,	%f12
	orn	%o0,	%l2,	%o3
	subc	%o4,	%i7,	%i1
	smulcc	%l6,	0x033B,	%g3
	movge	%xcc,	%l3,	%g4
	tge	%icc,	0x5
	sll	%i5,	0x13,	%o7
	movrlez	%g2,	%l4,	%i3
	sdivcc	%l5,	0x141B,	%i4
	movrlz	%l1,	0x364,	%l0
	sdiv	%i0,	0x136D,	%g7
	movcs	%icc,	%o5,	%g5
	srl	%o2,	0x1B,	%i6
	movcc	%xcc,	%o6,	%o1
	movg	%icc,	%i2,	%g6
	fsrc1s	%f22,	%f8
	movl	%xcc,	%g1,	%o0
	fcmple16	%f4,	%f20,	%l2
	edge32n	%o3,	%i7,	%i1
	fmovrde	%o4,	%f12,	%f10
	bvs	loop_1224
	mulx	%g3,	0x061C,	%l3
	edge16	%g4,	%l6,	%o7
	movg	%xcc,	%g2,	%l4
loop_1224:
	fcmpgt32	%f0,	%f4,	%i3
	movleu	%icc,	%i5,	%l5
	popc	0x104D,	%l1
	fornot2s	%f21,	%f8,	%f7
	sir	0x0277
	fblg,a	%fcc2,	loop_1225
	movvc	%xcc,	%l0,	%i0
	alignaddrl	%g7,	%o5,	%i4
	array8	%g5,	%i6,	%o6
loop_1225:
	bleu,a,pn	%xcc,	loop_1226
	edge8l	%o1,	%o2,	%i2
	umulcc	%g1,	%g6,	%o0
	subcc	%l2,	%o3,	%i7
loop_1226:
	stb	%i1,	[%l7 + 0x65]
	ldd	[%l7 + 0x60],	%g2
	movrgz	%o4,	0x2AB,	%l3
	movleu	%xcc,	%g4,	%l6
	stx	%g2,	[%l7 + 0x38]
	fabss	%f22,	%f15
	fcmple16	%f4,	%f12,	%o7
	movvs	%xcc,	%i3,	%l4
	fpadd32s	%f4,	%f13,	%f6
	tle	%icc,	0x5
	movn	%icc,	%l5,	%l1
	movrne	%i5,	%l0,	%i0
	srlx	%g7,	0x10,	%o5
	fornot2	%f26,	%f24,	%f18
	movre	%g5,	%i4,	%i6
	ldd	[%l7 + 0x58],	%f16
	edge8ln	%o6,	%o2,	%i2
	movrlz	%o1,	0x344,	%g1
	ta	%icc,	0x3
	or	%g6,	0x0F1C,	%l2
	movcc	%xcc,	%o3,	%o0
	or	%i1,	%g3,	%i7
	fbl,a	%fcc2,	loop_1227
	mulx	%o4,	0x0DBE,	%l3
	pdist	%f14,	%f8,	%f28
	tsubcc	%g4,	%l6,	%o7
loop_1227:
	movpos	%xcc,	%i3,	%l4
	fornot2	%f18,	%f26,	%f2
	tcc	%xcc,	0x3
	set	0x60, %i6
	swapa	[%l7 + %i6] 0x11,	%l5
	edge8n	%l1,	%g2,	%l0
	subcc	%i0,	0x1CE7,	%g7
	fbo	%fcc2,	loop_1228
	sdivcc	%o5,	0x07D3,	%i5
	fpmerge	%f25,	%f8,	%f20
	tpos	%icc,	0x3
loop_1228:
	edge16ln	%i4,	%i6,	%g5
	fbug,a	%fcc0,	loop_1229
	movpos	%icc,	%o6,	%o2
	sdiv	%i2,	0x0DA6,	%g1
	tvs	%xcc,	0x0
loop_1229:
	movn	%icc,	%o1,	%g6
	movle	%icc,	%o3,	%l2
	movgu	%icc,	%i1,	%o0
	brgez	%g3,	loop_1230
	ta	%icc,	0x5
	fabss	%f25,	%f7
	brlz	%i7,	loop_1231
loop_1230:
	fmovsneg	%icc,	%f19,	%f30
	fmovrsgez	%o4,	%f0,	%f19
	set	0x20, %g6
	stxa	%g4,	[%l7 + %g6] 0x81
loop_1231:
	taddcc	%l3,	0x0611,	%l6
	fcmpne16	%f6,	%f16,	%o7
	udivcc	%l4,	0x1562,	%i3
	fmovrse	%l1,	%f1,	%f13
	bneg,a	%icc,	loop_1232
	udivx	%g2,	0x0126,	%l0
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1232:
	array32	%i0,	%g7,	%o5
	fmovrslez	%i5,	%f26,	%f17
	movne	%icc,	%l5,	%i4
	fmovdgu	%icc,	%f0,	%f17
	tn	%icc,	0x0
	fmuld8ulx16	%f6,	%f5,	%f14
	fcmpeq32	%f10,	%f30,	%g5
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x04,	%f16
	edge32	%o6,	%i6,	%o2
	bvc,a	loop_1233
	xor	%g1,	0x02EA,	%o1
	edge32	%i2,	%o3,	%l2
	bcc,pt	%icc,	loop_1234
loop_1233:
	fmul8sux16	%f26,	%f28,	%f16
	orncc	%i1,	%g6,	%o0
	fcmps	%fcc0,	%f13,	%f4
loop_1234:
	fpadd32s	%f18,	%f31,	%f8
	ld	[%l7 + 0x6C],	%f29
	movcc	%xcc,	%g3,	%o4
	xnorcc	%i7,	%g4,	%l6
	taddcc	%o7,	%l4,	%i3
	array32	%l3,	%l1,	%g2
	brgz,a	%l0,	loop_1235
	edge32	%g7,	%o5,	%i5
	edge8l	%l5,	%i4,	%g5
	movn	%xcc,	%o6,	%i0
loop_1235:
	tvc	%icc,	0x0
	andncc	%i6,	%g1,	%o1
	fbe,a	%fcc0,	loop_1236
	fnot1s	%f21,	%f17
	fmovrdgz	%o2,	%f0,	%f16
	edge16ln	%o3,	%l2,	%i2
loop_1236:
	ldub	[%l7 + 0x44],	%g6
	fcmpne32	%f30,	%f0,	%o0
	movge	%icc,	%g3,	%i1
	fmovsneg	%icc,	%f18,	%f2
	brnz,a	%i7,	loop_1237
	fcmple32	%f18,	%f2,	%g4
	array32	%l6,	%o4,	%l4
	sethi	0x0A8C,	%i3
loop_1237:
	edge8ln	%o7,	%l3,	%l1
	popc	0x0D20,	%l0
	tsubcc	%g7,	%o5,	%i5
	andn	%l5,	%g2,	%i4
	tsubcctv	%o6,	%i0,	%i6
	bn,a,pt	%icc,	loop_1238
	movcs	%icc,	%g1,	%o1
	movre	%o2,	%g5,	%l2
	fbuge,a	%fcc0,	loop_1239
loop_1238:
	movcc	%icc,	%i2,	%g6
	sll	%o3,	%o0,	%g3
	movleu	%xcc,	%i7,	%g4
loop_1239:
	move	%icc,	%i1,	%l6
	edge16ln	%o4,	%l4,	%i3
	fbe	%fcc2,	loop_1240
	umulcc	%l3,	0x1100,	%o7
	fmovse	%icc,	%f31,	%f9
	tvc	%xcc,	0x2
loop_1240:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,pn	%xcc,	loop_1241
	bg,a,pt	%xcc,	loop_1242
	fbge	%fcc0,	loop_1243
	fmovrdlz	%l1,	%f14,	%f2
loop_1241:
	fmovdleu	%icc,	%f25,	%f10
loop_1242:
	fble	%fcc1,	loop_1244
loop_1243:
	fba	%fcc2,	loop_1245
	edge16ln	%g7,	%o5,	%l0
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1244:
	ldd	[%l7 + 0x58],	%f30
loop_1245:
	fba	%fcc3,	loop_1246
	sdivx	%i5,	0x0BC8,	%g2
	edge32n	%l5,	%o6,	%i4
	set	0x3C, %o2
	stwa	%i0,	[%l7 + %o2] 0x81
loop_1246:
	nop
	set	0x38, %o0
	ldsha	[%l7 + %o0] 0x11,	%i6
	xnor	%g1,	%o2,	%g5
	fsrc2s	%f27,	%f20
	srlx	%l2,	%i2,	%g6
	movn	%xcc,	%o1,	%o0
	fnot1s	%f23,	%f16
	faligndata	%f0,	%f20,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g3,	0x046F,	%i7
	te	%xcc,	0x5
	edge8n	%g4,	%i1,	%o3
	sdivx	%o4,	0x1C4F,	%l4
	array16	%l6,	%i3,	%l3
	addc	%o7,	0x0C32,	%g7
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x57] %asi,	%o5
	bvc	loop_1247
	fbe,a	%fcc1,	loop_1248
	bl,a	loop_1249
	bshuffle	%f0,	%f28,	%f18
loop_1247:
	fmovrse	%l0,	%f5,	%f3
loop_1248:
	tcc	%icc,	0x1
loop_1249:
	nop
	setx	loop_1250,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bge	loop_1251
	andn	%l1,	0x0D0E,	%i5
	fmovrdne	%g2,	%f22,	%f2
loop_1250:
	ldub	[%l7 + 0x71],	%l5
loop_1251:
	movgu	%icc,	%o6,	%i0
	bleu,a,pt	%icc,	loop_1252
	tl	%icc,	0x4
	fabsd	%f22,	%f16
	movrlez	%i4,	0x2C6,	%g1
loop_1252:
	xor	%i6,	%g5,	%o2
	fpadd16s	%f14,	%f23,	%f5
	set	0x20, %o5
	stda	%i2,	[%l7 + %o5] 0x11
	tg	%xcc,	0x7
	sllx	%g6,	0x19,	%o1
	siam	0x6
	tsubcctv	%o0,	%l2,	%g3
	movre	%i7,	%g4,	%i1
	fcmps	%fcc0,	%f8,	%f29
	movpos	%icc,	%o4,	%l4
	set	0x54, %o1
	lduwa	[%l7 + %o1] 0x18,	%o3
	ba,a	loop_1253
	fbul,a	%fcc1,	loop_1254
	fmovsleu	%icc,	%f3,	%f29
	movge	%icc,	%i3,	%l3
loop_1253:
	mulx	%o7,	%l6,	%o5
loop_1254:
	ba,a	%icc,	loop_1255
	alignaddr	%l0,	%g7,	%l1
	prefetch	[%l7 + 0x54],	 0x0
	fmovrslz	%i5,	%f14,	%f17
loop_1255:
	movge	%icc,	%g2,	%l5
	orn	%o6,	0x1340,	%i4
	taddcctv	%i0,	0x181F,	%g1
	fmovd	%f4,	%f20
	srlx	%g5,	%o2,	%i6
	udivcc	%g6,	0x03C9,	%o1
	movneg	%icc,	%i2,	%o0
	stb	%l2,	[%l7 + 0x3F]
	edge32n	%g3,	%g4,	%i1
	be,a	loop_1256
	fmovsne	%xcc,	%f0,	%f22
	tne	%xcc,	0x1
	fmovspos	%icc,	%f17,	%f18
loop_1256:
	orn	%o4,	%l4,	%i7
	stx	%i3,	[%l7 + 0x10]
	sdivcc	%l3,	0x0ED5,	%o3
	sdivcc	%l6,	0x1A5D,	%o7
	fmovsne	%icc,	%f4,	%f12
	orcc	%l0,	0x0E14,	%o5
	add	%l1,	0x081E,	%i5
	fmovrsgz	%g2,	%f1,	%f29
	tg	%icc,	0x7
	movle	%xcc,	%l5,	%o6
	orn	%g7,	0x11FF,	%i0
	sllx	%i4,	0x04,	%g1
	udiv	%g5,	0x1A42,	%o2
	stbar
	sra	%g6,	%i6,	%o1
	fxor	%f22,	%f20,	%f20
	movrlz	%i2,	0x01C,	%o0
	array32	%g3,	%l2,	%g4
	fcmple16	%f28,	%f16,	%o4
	array32	%i1,	%l4,	%i7
	tge	%xcc,	0x2
	wr	%g0,	0x27,	%asi
	stda	%l2,	[%l7 + 0x08] %asi
	membar	#Sync
	fnot2	%f24,	%f2
	udivcc	%i3,	0x112E,	%l6
	tgu	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%o3
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x54] %asi,	%o5
	andncc	%l1,	%i5,	%g2
	mova	%xcc,	%l0,	%l5
	tne	%xcc,	0x6
	fmovdcc	%icc,	%f20,	%f14
	andncc	%g7,	%o6,	%i4
	lduw	[%l7 + 0x60],	%i0
	mova	%icc,	%g1,	%g5
	edge16l	%g6,	%o2,	%o1
	fpadd32	%f22,	%f0,	%f30
	movleu	%icc,	%i6,	%o0
	bleu,a	loop_1257
	sdivx	%g3,	0x11DD,	%l2
	srlx	%i2,	%g4,	%o4
	movre	%l4,	0x277,	%i7
loop_1257:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l3,	%i1,	%l6
	fpack32	%f10,	%f2,	%f2
	fsrc1	%f20,	%f18
	movrlz	%o7,	%i3,	%o3
	edge16n	%o5,	%l1,	%g2
	and	%i5,	%l5,	%l0
	tl	%icc,	0x0
	fpmerge	%f2,	%f24,	%f20
	stw	%g7,	[%l7 + 0x20]
	sra	%o6,	%i0,	%g1
	alignaddrl	%i4,	%g6,	%g5
	sdiv	%o2,	0x0A86,	%o1
	fmovdleu	%xcc,	%f25,	%f17
	set	0x38, %g3
	stda	%i6,	[%l7 + %g3] 0x89
	ldub	[%l7 + 0x1F],	%g3
	tle	%xcc,	0x1
	set	0x18, %i5
	prefetcha	[%l7 + %i5] 0x81,	 0x2
	taddcc	%i2,	%l2,	%o4
	udivx	%l4,	0x1A98,	%i7
	fmovsa	%xcc,	%f17,	%f30
	movrgz	%l3,	%g4,	%l6
	edge32ln	%i1,	%i3,	%o3
	mulscc	%o5,	%o7,	%g2
	movvc	%icc,	%l1,	%i5
	addc	%l5,	0x0C55,	%l0
	fcmpeq32	%f24,	%f16,	%g7
	movge	%icc,	%i0,	%o6
	fsrc1s	%f16,	%f28
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x10] %asi,	%i4
	membar	0x4F
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%f0
	movleu	%xcc,	%g1,	%g6
	taddcctv	%o2,	0x0912,	%g5
	addc	%i6,	0x0AE5,	%g3
	udivx	%o1,	0x1ABD,	%o0
	edge32l	%i2,	%o4,	%l2
	fmovsge	%icc,	%f0,	%f13
	edge8	%i7,	%l4,	%g4
	movvc	%xcc,	%l6,	%i1
	xnor	%i3,	%o3,	%l3
	fcmpeq16	%f10,	%f22,	%o7
	edge8n	%o5,	%g2,	%l1
	fblg,a	%fcc2,	loop_1258
	fxnors	%f27,	%f8,	%f15
	sdivcc	%i5,	0x1630,	%l0
	fble	%fcc0,	loop_1259
loop_1258:
	orcc	%g7,	0x0D64,	%l5
	fpadd32	%f26,	%f4,	%f0
	bne	loop_1260
loop_1259:
	tge	%xcc,	0x0
	andncc	%i0,	%o6,	%g1
	set	0x54, %i3
	stwa	%i4,	[%l7 + %i3] 0x14
loop_1260:
	fcmpgt16	%f20,	%f2,	%g6
	movrne	%o2,	0x2DA,	%i6
	movrgez	%g3,	%g5,	%o1
	movre	%i2,	0x043,	%o4
	fmovsa	%icc,	%f7,	%f0
	sra	%l2,	%o0,	%l4
	sdivcc	%i7,	0x0E18,	%l6
	set	0x28, %g2
	stda	%i0,	[%l7 + %g2] 0x2f
	membar	#Sync
	set	0x24, %l6
	ldsha	[%l7 + %l6] 0x89,	%g4
	movge	%xcc,	%o3,	%l3
	movge	%xcc,	%i3,	%o7
	movgu	%xcc,	%g2,	%l1
	movne	%xcc,	%o5,	%l0
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x1E] %asi,	%i5
	addcc	%g7,	%i0,	%o6
	popc	0x0D7A,	%g1
	tn	%icc,	0x6
	sethi	0x0FB9,	%l5
	andcc	%g6,	%i4,	%o2
	movg	%xcc,	%i6,	%g5
	wr	%g0,	0x11,	%asi
	stwa	%o1,	[%l7 + 0x38] %asi
	umulcc	%g3,	0x1F42,	%o4
	array16	%i2,	%l2,	%l4
	movg	%xcc,	%o0,	%l6
	tgu	%xcc,	0x0
	ta	%xcc,	0x1
	udiv	%i1,	0x0B30,	%g4
	subcc	%i7,	0x0297,	%o3
	movpos	%xcc,	%i3,	%o7
	smulcc	%l3,	0x1DAD,	%g2
	tsubcctv	%l1,	%o5,	%l0
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge16ln	%g7,	%i5,	%o6
	movvs	%icc,	%g1,	%i0
	st	%f16,	[%l7 + 0x64]
	xnor	%l5,	0x06CA,	%i4
	alignaddrl	%o2,	%i6,	%g6
	edge32l	%o1,	%g5,	%o4
	bvs	loop_1261
	brnz,a	%g3,	loop_1262
	fcmpne16	%f8,	%f24,	%l2
	stb	%l4,	[%l7 + 0x46]
loop_1261:
	be	loop_1263
loop_1262:
	fmovrdgz	%i2,	%f14,	%f12
	ldstub	[%l7 + 0x50],	%l6
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x2c,	%o0
loop_1263:
	alignaddr	%i1,	%i7,	%o3
	fandnot1	%f10,	%f0,	%f6
	mova	%icc,	%i3,	%o7
	movl	%icc,	%g4,	%g2
	movg	%xcc,	%l1,	%o5
	tvc	%xcc,	0x3
	brgez,a	%l0,	loop_1264
	lduw	[%l7 + 0x08],	%l3
	movrlz	%i5,	%g7,	%g1
	fmovdg	%xcc,	%f26,	%f22
loop_1264:
	andcc	%o6,	0x1476,	%l5
	fxors	%f29,	%f31,	%f19
	ldub	[%l7 + 0x1B],	%i4
	fone	%f16
	fand	%f14,	%f2,	%f6
	fabss	%f18,	%f17
	movrne	%o2,	0x1B9,	%i0
	bvs,pt	%xcc,	loop_1265
	tge	%icc,	0x6
	ldd	[%l7 + 0x48],	%f8
	ta	%icc,	0x5
loop_1265:
	sdivx	%i6,	0x0495,	%o1
	fsrc2	%f18,	%f12
	tsubcc	%g6,	0x1D64,	%o4
	fmovsneg	%icc,	%f11,	%f5
	fandnot1	%f0,	%f6,	%f16
	set	0x3C, %g5
	ldswa	[%l7 + %g5] 0x04,	%g5
	movn	%icc,	%g3,	%l2
	fmovrsgez	%l4,	%f14,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i2,	%l6,	%i1
	movvc	%xcc,	%i7,	%o3
	tg	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%xcc,	0x0
	udiv	%o0,	0x02C9,	%i3
	andcc	%g4,	0x00C3,	%o7
	fnand	%f18,	%f0,	%f16
	sdiv	%l1,	0x0DAF,	%o5
	umulcc	%l0,	0x0B27,	%g2
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x378] %asi,	%i5 ripped by fixASI40.pl ripped by fixASI40.pl
	fmovscc	%icc,	%f14,	%f16
	ldsw	[%l7 + 0x1C],	%g7
	fbug,a	%fcc0,	loop_1266
	fcmpne32	%f28,	%f18,	%l3
	movg	%xcc,	%o6,	%g1
	alignaddrl	%l5,	%o2,	%i4
loop_1266:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x48] %asi,	%i6
	tpos	%xcc,	0x3
	ta	%icc,	0x7
	std	%o0,	[%l7 + 0x30]
	fmovrsgz	%i0,	%f25,	%f18
	edge32n	%g6,	%g5,	%g3
	fmovsn	%xcc,	%f9,	%f11
	nop
	setx	loop_1267,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%icc,	0x0
	set	0x10, %o3
	swapa	[%l7 + %o3] 0x80,	%o4
loop_1267:
	add	%l2,	0x0F24,	%i2
	fmovse	%xcc,	%f0,	%f1
	subcc	%l6,	0x0E68,	%l4
	fmovrslez	%i7,	%f11,	%f19
	wr	%g0,	0x88,	%asi
	stxa	%o3,	[%l7 + 0x68] %asi
	fnor	%f4,	%f12,	%f18
	tg	%icc,	0x3
	set	0x38, %i4
	ldswa	[%l7 + %i4] 0x14,	%i1
	set	0x54, %i7
	swapa	[%l7 + %i7] 0x04,	%i3
	orcc	%g4,	0x01B7,	%o0
	xnor	%l1,	0x1DE0,	%o5
	tpos	%xcc,	0x6
	movleu	%icc,	%o7,	%g2
	fmovdne	%icc,	%f13,	%f27
	tcs	%xcc,	0x1
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x1f,	%f0
	tleu	%xcc,	0x3
	taddcc	%i5,	0x0EB9,	%l0
	sdivx	%l3,	0x1E29,	%g7
	fnor	%f20,	%f26,	%f16
	fmovs	%f17,	%f13
	add	%o6,	0x1A2D,	%g1
	edge16n	%l5,	%i4,	%o2
	move	%xcc,	%o1,	%i6
	fcmpeq32	%f12,	%f22,	%g6
	movgu	%xcc,	%g5,	%i0
	tcs	%icc,	0x2
	fpadd32s	%f29,	%f4,	%f18
	movleu	%xcc,	%g3,	%o4
	edge8n	%l2,	%i2,	%l4
	brgz,a	%i7,	loop_1268
	movpos	%icc,	%l6,	%o3
	fxor	%f6,	%f10,	%f0
	fbul	%fcc3,	loop_1269
loop_1268:
	xorcc	%i3,	0x0CF1,	%i1
	smul	%o0,	0x1382,	%g4
	fpadd32	%f30,	%f12,	%f26
loop_1269:
	udivcc	%l1,	0x178F,	%o7
	movcc	%xcc,	%o5,	%g2
	stbar
	fornot1s	%f8,	%f7,	%f30
	fmovrslez	%l0,	%f10,	%f17
	edge16	%l3,	%g7,	%i5
	stx	%o6,	[%l7 + 0x60]
	fble	%fcc0,	loop_1270
	sdivcc	%g1,	0x10CD,	%i4
	st	%f10,	[%l7 + 0x7C]
	srl	%o2,	%o1,	%l5
loop_1270:
	array8	%g6,	%g5,	%i0
	fornot2	%f24,	%f28,	%f6
	ldub	[%l7 + 0x22],	%g3
	bneg,a	%xcc,	loop_1271
	tne	%icc,	0x2
	fbug	%fcc1,	loop_1272
	call	loop_1273
loop_1271:
	tle	%xcc,	0x1
	te	%xcc,	0x3
loop_1272:
	tl	%icc,	0x1
loop_1273:
	fba	%fcc0,	loop_1274
	edge8n	%o4,	%i6,	%l2
	membar	0x4C
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x08] %asi,	%l4
loop_1274:
	tl	%icc,	0x4
	orncc	%i7,	0x0087,	%l6
	fandnot2	%f0,	%f12,	%f18
	tcc	%icc,	0x2
	fbug	%fcc0,	loop_1275
	fpack16	%f10,	%f1
	brlz	%i2,	loop_1276
	movvc	%icc,	%o3,	%i1
loop_1275:
	taddcctv	%i3,	%o0,	%g4
	fbl,a	%fcc0,	loop_1277
loop_1276:
	fmovdleu	%icc,	%f21,	%f8
	be,a,pt	%xcc,	loop_1278
	flush	%l7 + 0x44
loop_1277:
	fmul8sux16	%f12,	%f20,	%f2
	bvc	loop_1279
loop_1278:
	fmovda	%xcc,	%f27,	%f28
	movcc	%xcc,	%o7,	%o5
	tneg	%xcc,	0x5
loop_1279:
	nop
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%l1
	tvs	%icc,	0x2
	tg	%xcc,	0x7
	fcmped	%fcc2,	%f10,	%f2
	movcc	%icc,	%g2,	%l3
	brgez	%l0,	loop_1280
	bvs,a,pn	%xcc,	loop_1281
	bvc,pt	%xcc,	loop_1282
	bvc,a,pt	%icc,	loop_1283
loop_1280:
	tne	%xcc,	0x5
loop_1281:
	mulx	%g7,	%i5,	%g1
loop_1282:
	tvc	%xcc,	0x7
loop_1283:
	stbar
	fbu,a	%fcc0,	loop_1284
	umulcc	%i4,	%o2,	%o6
	xor	%o1,	%g6,	%g5
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x70] %asi,	%i0
loop_1284:
	bvc,a,pn	%icc,	loop_1285
	fandnot1	%f20,	%f0,	%f16
	addc	%l5,	%g3,	%o4
	fornot1	%f0,	%f8,	%f8
loop_1285:
	bl,a,pn	%xcc,	loop_1286
	edge16	%i6,	%l2,	%i7
	set	0x60, %g1
	prefetcha	[%l7 + %g1] 0x11,	 0x2
loop_1286:
	tn	%xcc,	0x5
	xorcc	%i2,	0x13D4,	%o3
	edge8l	%l6,	%i1,	%o0
	bne,a,pn	%xcc,	loop_1287
	edge16n	%g4,	%i3,	%o5
	fandnot2	%f12,	%f4,	%f28
	fbue	%fcc1,	loop_1288
loop_1287:
	andn	%o7,	%g2,	%l1
	wr	%g0,	0x04,	%asi
	stba	%l0,	[%l7 + 0x27] %asi
loop_1288:
	movrlez	%l3,	%g7,	%i5
	fpadd16s	%f2,	%f8,	%f29
	fsrc2	%f28,	%f14
	alignaddr	%g1,	%i4,	%o6
	tne	%icc,	0x6
	membar	0x76
	srl	%o2,	%o1,	%g6
	fands	%f28,	%f26,	%f15
	udivx	%g5,	0x1FD6,	%i0
	fcmpeq16	%f2,	%f8,	%g3
	fble	%fcc2,	loop_1289
	be,pt	%icc,	loop_1290
	ldub	[%l7 + 0x27],	%o4
	andcc	%i6,	%l2,	%l5
loop_1289:
	movneg	%icc,	%i7,	%i2
loop_1290:
	move	%xcc,	%l4,	%o3
	array32	%l6,	%i1,	%o0
	fnands	%f17,	%f7,	%f23
	fmovdn	%xcc,	%f10,	%f28
	fmovd	%f26,	%f28
	srl	%g4,	0x13,	%o5
	tneg	%xcc,	0x1
	movvc	%icc,	%i3,	%o7
	movvs	%icc,	%l1,	%l0
	sdivx	%g2,	0x0494,	%g7
	popc	%l3,	%g1
	edge32n	%i5,	%o6,	%i4
	set	0x60, %l1
	sta	%f13,	[%l7 + %l1] 0x80
	subccc	%o1,	%g6,	%o2
	xnorcc	%i0,	0x06E9,	%g3
	taddcctv	%o4,	%g5,	%l2
	set	0x3E, %o4
	stha	%l5,	[%l7 + %o4] 0x15
	xnor	%i6,	0x1979,	%i2
	tgu	%xcc,	0x5
	mulscc	%i7,	%l4,	%o3
	fmovsneg	%xcc,	%f1,	%f14
	fornot1s	%f14,	%f5,	%f18
	movrlez	%i1,	0x38F,	%o0
	edge16l	%l6,	%o5,	%g4
	fands	%f9,	%f7,	%f19
	movcs	%icc,	%o7,	%i3
	movrlz	%l1,	0x257,	%g2
	mulx	%l0,	%l3,	%g7
	bcc	%icc,	loop_1291
	movre	%i5,	0x0B5,	%o6
	srl	%i4,	%g1,	%o1
	fble,a	%fcc3,	loop_1292
loop_1291:
	udivx	%o2,	0x0F53,	%g6
	tg	%xcc,	0x6
	edge16l	%g3,	%o4,	%i0
loop_1292:
	nop
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	set	0x54, %i2
	stwa	%g5,	[%l7 + %i2] 0x27
	membar	#Sync
	te	%xcc,	0x3
	fnegd	%f24,	%f2
	bshuffle	%f18,	%f30,	%f0
	std	%f10,	[%l7 + 0x18]
	tsubcctv	%l5,	0x1C15,	%l2
	fmovsge	%xcc,	%f22,	%f23
	array8	%i6,	%i7,	%l4
	stbar
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x10] %asi,	%f6
	edge32l	%i2,	%i1,	%o0
	popc	0x1F96,	%o3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
	fble,a	%fcc2,	loop_1293
	edge8l	%l6,	%o7,	%i3
	xorcc	%l1,	%g2,	%l0
	bvc,a,pt	%icc,	loop_1294
loop_1293:
	smulcc	%l3,	%g7,	%i5
	set	0x10, %l5
	prefetcha	[%l7 + %l5] 0x14,	 0x3
loop_1294:
	smul	%g4,	%i4,	%g1
	fble	%fcc3,	loop_1295
	edge16l	%o1,	%o2,	%g3
	lduw	[%l7 + 0x6C],	%g6
	umul	%i0,	%o4,	%g5
loop_1295:
	nop
	set	0x378, %l4
	nop 	! 	stxa	%l2,	[%g0 + %l4] 0x40 ripped by fixASI40.pl
	lduh	[%l7 + 0x6E],	%l5
	smulcc	%i7,	%l4,	%i6
	orcc	%i1,	%i2,	%o3
	edge8l	%o0,	%o5,	%l6
	tcc	%xcc,	0x3
	fmovrdgez	%o7,	%f8,	%f26
	fmovdcc	%icc,	%f1,	%f5
	movcs	%xcc,	%i3,	%l1
	orncc	%l0,	%l3,	%g7
	fba,a	%fcc2,	loop_1296
	fmovrdlz	%i5,	%f10,	%f24
	movrgz	%o6,	0x37F,	%g4
	fcmped	%fcc1,	%f2,	%f28
loop_1296:
	bn	loop_1297
	fbg	%fcc2,	loop_1298
	movvs	%icc,	%i4,	%g2
	andn	%g1,	%o2,	%o1
loop_1297:
	std	%g6,	[%l7 + 0x48]
loop_1298:
	movrlz	%i0,	0x343,	%o4
	fbu	%fcc1,	loop_1299
	movgu	%icc,	%g5,	%l2
	fbul	%fcc3,	loop_1300
	ld	[%l7 + 0x1C],	%f22
loop_1299:
	nop
	set	0x60, %o7
	stwa	%l5,	[%l7 + %o7] 0x88
loop_1300:
	orn	%g3,	0x0695,	%l4
	movrgez	%i6,	0x1A2,	%i1
	edge8n	%i7,	%i2,	%o0
	sdivx	%o3,	0x10AF,	%o5
	tneg	%xcc,	0x4
	edge16ln	%o7,	%i3,	%l1
	movl	%icc,	%l0,	%l6
	orn	%l3,	%i5,	%g7
	tne	%icc,	0x1
	movn	%icc,	%g4,	%i4
	srlx	%o6,	0x19,	%g1
	fcmped	%fcc0,	%f24,	%f12
	brnz,a	%g2,	loop_1301
	movcs	%xcc,	%o2,	%o1
	fmovdneg	%icc,	%f13,	%f25
	orn	%i0,	0x1E5A,	%g6
loop_1301:
	fornot1	%f0,	%f8,	%f2
	xor	%o4,	0x0EEC,	%l2
	array32	%g5,	%g3,	%l4
	fexpand	%f7,	%f18
	movrgez	%l5,	%i6,	%i7
	fsrc2	%f4,	%f26
	alignaddr	%i1,	%i2,	%o3
	bn,a,pt	%xcc,	loop_1302
	bvs,pt	%icc,	loop_1303
	bn,a	loop_1304
	fand	%f0,	%f26,	%f4
loop_1302:
	subcc	%o0,	0x08B1,	%o5
loop_1303:
	orncc	%o7,	0x15A6,	%l1
loop_1304:
	ba,a	loop_1305
	ba	loop_1306
	fmovdn	%xcc,	%f0,	%f15
	fnegd	%f28,	%f22
loop_1305:
	tl	%icc,	0x2
loop_1306:
	tsubcctv	%i3,	%l0,	%l3
	te	%icc,	0x5
	tpos	%icc,	0x4
	ta	%xcc,	0x6
	wr	%g0,	0xea,	%asi
	stwa	%i5,	[%l7 + 0x38] %asi
	membar	#Sync
	saved
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
	edge8	%g7,	%g4,	%i4
	alignaddrl	%l6,	%g1,	%g2
	ldd	[%l7 + 0x50],	%f22
	tg	%icc,	0x7
	sdivx	%o6,	0x0B80,	%o1
	edge16ln	%i0,	%g6,	%o2
	fpsub16	%f12,	%f2,	%f20
	xorcc	%l2,	0x19E8,	%o4
	udivx	%g3,	0x1BAB,	%g5
	fandnot2	%f0,	%f2,	%f24
	tne	%icc,	0x3
	mulscc	%l5,	0x0B65,	%i6
	fsrc2s	%f26,	%f21
	movre	%i7,	%l4,	%i2
	xnor	%o3,	0x085B,	%o0
	sdiv	%o5,	0x179F,	%o7
	brlz	%l1,	loop_1307
	tvs	%icc,	0x3
	tge	%icc,	0x5
	bge,pn	%icc,	loop_1308
loop_1307:
	movleu	%icc,	%i1,	%i3
	fandnot2	%f10,	%f8,	%f24
	fbg,a	%fcc0,	loop_1309
loop_1308:
	fmul8sux16	%f30,	%f2,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f10,	%f4
loop_1309:
	movl	%xcc,	%l3,	%l0
	brgez	%g7,	loop_1310
	fpadd16	%f28,	%f26,	%f22
	xnor	%g4,	%i4,	%i5
	movleu	%xcc,	%l6,	%g2
loop_1310:
	tcs	%icc,	0x7
	bvc	loop_1311
	fbo,a	%fcc2,	loop_1312
	andn	%o6,	0x122C,	%g1
	fcmple32	%f12,	%f14,	%i0
loop_1311:
	and	%o1,	0x1BBD,	%o2
loop_1312:
	srlx	%l2,	%g6,	%g3
	wr	%g0,	0x88,	%asi
	stba	%o4,	[%l7 + 0x4D] %asi
	movgu	%icc,	%g5,	%l5
	fzeros	%f20
	popc	%i7,	%i6
	fpackfix	%f6,	%f16
	addc	%l4,	%o3,	%o0
	mova	%icc,	%i2,	%o7
	tpos	%xcc,	0x6
	movl	%icc,	%o5,	%i1
	movrgez	%l1,	0x3E9,	%l3
	ble,a,pt	%xcc,	loop_1313
	taddcc	%l0,	0x1D79,	%g7
	alignaddr	%g4,	%i3,	%i4
	sub	%i5,	%g2,	%l6
loop_1313:
	alignaddr	%g1,	%o6,	%o1
	tcc	%xcc,	0x7
	sllx	%o2,	%l2,	%g6
	tleu	%icc,	0x6
	andn	%i0,	%o4,	%g3
	xor	%g5,	%i7,	%i6
	wr	%g0,	0xeb,	%asi
	stba	%l5,	[%l7 + 0x47] %asi
	membar	#Sync
	tge	%xcc,	0x2
	edge16n	%l4,	%o3,	%i2
	ldsh	[%l7 + 0x30],	%o7
	subcc	%o5,	%o0,	%i1
	umulcc	%l3,	%l1,	%l0
	tl	%xcc,	0x6
	orn	%g4,	0x11C0,	%g7
	and	%i4,	%i3,	%i5
	tg	%icc,	0x1
	edge8l	%l6,	%g2,	%o6
	te	%icc,	0x5
	or	%g1,	%o1,	%o2
	bshuffle	%f30,	%f20,	%f16
	bge,a	loop_1314
	prefetch	[%l7 + 0x1C],	 0x3
	orncc	%g6,	0x0468,	%l2
	fmovdcs	%icc,	%f15,	%f4
loop_1314:
	nop
	wr	%g0,	0x2a,	%asi
	stda	%o4,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32ln	%g3,	%i0,	%i7
	movvc	%xcc,	%g5,	%i6
	ldub	[%l7 + 0x77],	%l4
	fcmpeq16	%f30,	%f20,	%o3
	udiv	%l5,	0x05CC,	%i2
	edge32l	%o7,	%o5,	%o0
	fmul8x16	%f0,	%f12,	%f30
	sdivx	%l3,	0x165C,	%i1
	fcmpne32	%f26,	%f6,	%l1
	xor	%g4,	0x05D3,	%l0
	fmovsl	%xcc,	%f19,	%f7
	fpadd32	%f30,	%f12,	%f24
	movne	%xcc,	%i4,	%g7
	edge16	%i3,	%l6,	%i5
	orcc	%o6,	%g1,	%o1
	fbl	%fcc1,	loop_1315
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f31,	%f22,	%f12
	mulx	%o2,	%g2,	%l2
loop_1315:
	movrgz	%o4,	%g3,	%i0
	ldsw	[%l7 + 0x78],	%g6
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x0c
	stx	%i7,	[%l7 + 0x50]
	xorcc	%i6,	%l4,	%o3
	array32	%g5,	%l5,	%i2
	addcc	%o7,	%o0,	%l3
	bleu	%xcc,	loop_1316
	sll	%i1,	%l1,	%o5
	fmovsge	%icc,	%f23,	%f5
	andcc	%g4,	0x0972,	%l0
loop_1316:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x18,	%i4,	%g7
	subc	%l6,	%i5,	%i3
	fpsub32s	%f31,	%f20,	%f13
	sdiv	%o6,	0x00C7,	%o1
	fpadd32s	%f13,	%f12,	%f5
	fcmped	%fcc0,	%f24,	%f18
	movn	%icc,	%g1,	%g2
	subc	%o2,	%l2,	%o4
	subccc	%i0,	%g3,	%g6
	udiv	%i7,	0x03E1,	%i6
	fmovdg	%xcc,	%f16,	%f23
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x6A] %asi,	%o3
	addccc	%l4,	0x11C5,	%l5
	be,a,pt	%icc,	loop_1317
	udivx	%g5,	0x1E37,	%o7
	brz	%i2,	loop_1318
	ble,a	%xcc,	loop_1319
loop_1317:
	tne	%xcc,	0x7
	movrlz	%l3,	0x08C,	%o0
loop_1318:
	edge16n	%l1,	%i1,	%g4
loop_1319:
	bpos,a,pn	%xcc,	loop_1320
	fbu	%fcc3,	loop_1321
	ta	%icc,	0x5
	stx	%l0,	[%l7 + 0x70]
loop_1320:
	fbug,a	%fcc2,	loop_1322
loop_1321:
	fnor	%f12,	%f24,	%f4
	tvs	%icc,	0x0
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x118] %asi,	%i4
loop_1322:
	nop
	set	0x26, %g7
	stha	%g7,	[%l7 + %g7] 0x22
	membar	#Sync
	set	0x25, %g4
	lduba	[%l7 + %g4] 0x89,	%o5
	fnegd	%f24,	%f30
	fcmps	%fcc0,	%f27,	%f17
	bgu	loop_1323
	bg,a,pt	%icc,	loop_1324
	movneg	%icc,	%i5,	%i3
	fmovscc	%xcc,	%f19,	%f28
loop_1323:
	fandnot1	%f22,	%f26,	%f20
loop_1324:
	movrlz	%l6,	0x32F,	%o6
	ld	[%l7 + 0x20],	%f28
	movrgez	%o1,	0x1BB,	%g2
	fbe	%fcc3,	loop_1325
	movneg	%icc,	%g1,	%l2
	udivcc	%o4,	0x19AC,	%i0
	brlz,a	%o2,	loop_1326
loop_1325:
	fsrc1s	%f1,	%f19
	fmul8x16au	%f21,	%f19,	%f0
	prefetch	[%l7 + 0x70],	 0x1
loop_1326:
	srlx	%g6,	%i7,	%i6
	fmul8ulx16	%f6,	%f14,	%f18
	set	0x4C, %i6
	lda	[%l7 + %i6] 0x81,	%f1
	movvc	%xcc,	%g3,	%l4
	edge8ln	%l5,	%g5,	%o7
	movg	%icc,	%i2,	%l3
	movre	%o0,	%o3,	%i1
	nop
	setx	loop_1327,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%g4,	0x0B8D,	%l0
	tleu	%icc,	0x1
	orcc	%i4,	%l1,	%g7
loop_1327:
	tle	%icc,	0x4
	udivcc	%i5,	0x0C6B,	%o5
	sdiv	%l6,	0x1714,	%o6
	subc	%i3,	0x03FB,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o1,	0x24A,	%g1
	tcc	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o4,	%i0,	%l2
	sll	%o2,	%i7,	%g6
	tsubcctv	%g3,	0x052D,	%l4
	addc	%l5,	0x1534,	%i6
	sdiv	%o7,	0x1D15,	%i2
	movgu	%xcc,	%g5,	%o0
	movpos	%xcc,	%l3,	%o3
	movpos	%icc,	%i1,	%l0
	mulscc	%i4,	%l1,	%g7
	fandnot1	%f12,	%f12,	%f10
	bne	loop_1328
	tsubcc	%i5,	%o5,	%g4
	fmovrslz	%o6,	%f13,	%f13
	orcc	%i3,	0x16E8,	%g2
loop_1328:
	subccc	%l6,	%o1,	%o4
	edge32ln	%g1,	%l2,	%i0
	tsubcc	%o2,	0x12C3,	%i7
	subccc	%g6,	0x17D6,	%l4
	srlx	%l5,	%i6,	%g3
	subc	%i2,	0x118E,	%o7
	movrgz	%g5,	0x377,	%l3
	fmul8sux16	%f28,	%f26,	%f12
	movpos	%icc,	%o3,	%o0
	tgu	%icc,	0x6
	movleu	%icc,	%i1,	%l0
	movle	%icc,	%l1,	%g7
	array16	%i4,	%i5,	%o5
	fbge,a	%fcc1,	loop_1329
	edge32l	%g4,	%i3,	%o6
	add	%l6,	%g2,	%o4
	movn	%icc,	%g1,	%l2
loop_1329:
	fabss	%f14,	%f21
	srlx	%o1,	0x19,	%i0
	sra	%o2,	0x10,	%g6
	sllx	%l4,	0x1C,	%l5
	movcs	%icc,	%i7,	%g3
	movvc	%xcc,	%i6,	%o7
	fbo,a	%fcc1,	loop_1330
	ldsh	[%l7 + 0x4C],	%g5
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x60] %asi,	%l3
loop_1330:
	mulx	%o3,	0x1040,	%o0
	bg	loop_1331
	std	%f26,	[%l7 + 0x10]
	ba,a,pt	%icc,	loop_1332
	movle	%xcc,	%i2,	%i1
loop_1331:
	te	%icc,	0x5
	wr	%g0,	0x2a,	%asi
	stwa	%l1,	[%l7 + 0x68] %asi
	membar	#Sync
loop_1332:
	fxor	%f12,	%f2,	%f14
	fmovdvc	%icc,	%f29,	%f22
	edge16n	%l0,	%g7,	%i4
	fmovdleu	%xcc,	%f6,	%f12
	movrgz	%i5,	%g4,	%i3
	movn	%icc,	%o6,	%l6
	tn	%icc,	0x0
	bneg,pt	%xcc,	loop_1333
	tpos	%xcc,	0x3
	brz	%g2,	loop_1334
	movleu	%xcc,	%o4,	%g1
loop_1333:
	nop
	setx	loop_1335,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%xcc,	%o5,	%l2
loop_1334:
	sdivcc	%o1,	0x0CA3,	%o2
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x7C] %asi,	%g6
loop_1335:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x54] %asi,	%f3
	movrgez	%l4,	0x243,	%l5
	fmovrslez	%i7,	%f22,	%f7
	bcs	loop_1336
	fmul8sux16	%f24,	%f12,	%f22
	sth	%g3,	[%l7 + 0x08]
	sllx	%i6,	0x10,	%o7
loop_1336:
	fcmpeq32	%f30,	%f0,	%g5
	fbne	%fcc2,	loop_1337
	subc	%i0,	%o3,	%o0
	fornot1s	%f25,	%f12,	%f30
	addcc	%i2,	0x05C3,	%i1
loop_1337:
	fnand	%f18,	%f28,	%f18
	bne,a	%xcc,	loop_1338
	orn	%l3,	%l0,	%l1
	edge8l	%g7,	%i4,	%g4
	andncc	%i3,	%o6,	%i5
loop_1338:
	edge32l	%l6,	%g2,	%o4
	movg	%xcc,	%g1,	%o5
	edge16l	%o1,	%l2,	%o2
	sll	%l4,	%l5,	%i7
	movrgz	%g3,	%i6,	%g6
	fxnors	%f1,	%f15,	%f25
	bgu,a	loop_1339
	ldx	[%l7 + 0x48],	%g5
	popc	%o7,	%i0
	fzeros	%f20
loop_1339:
	movn	%xcc,	%o3,	%o0
	tge	%xcc,	0x5
	sub	%i1,	0x1193,	%l3
	bl,pn	%xcc,	loop_1340
	fmovsle	%icc,	%f12,	%f25
	xor	%i2,	%l1,	%l0
	edge32l	%g7,	%g4,	%i4
loop_1340:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%icc,	%f5,	%f27
	edge8ln	%i3,	%o6,	%l6
	fnegd	%f22,	%f8
	movre	%i5,	%o4,	%g2
	tneg	%xcc,	0x1
	fpadd32	%f26,	%f2,	%f4
	lduw	[%l7 + 0x24],	%o5
	fcmpeq16	%f30,	%f20,	%g1
	bgu,a	loop_1341
	udiv	%l2,	0x1DA4,	%o2
	fxnors	%f16,	%f17,	%f29
	udiv	%o1,	0x028D,	%l4
loop_1341:
	stb	%l5,	[%l7 + 0x2A]
	movvc	%xcc,	%i7,	%g3
	fandnot1s	%f16,	%f14,	%f14
	fors	%f30,	%f16,	%f4
	addc	%i6,	%g5,	%g6
	fmovrse	%i0,	%f6,	%f1
	fbug	%fcc0,	loop_1342
	movpos	%icc,	%o7,	%o0
	andcc	%i1,	0x0C8E,	%o3
	bshuffle	%f4,	%f14,	%f16
loop_1342:
	ldstub	[%l7 + 0x3A],	%i2
	wr	%g0,	0x0c,	%asi
	stxa	%l1,	[%l7 + 0x70] %asi
	fbo,a	%fcc1,	loop_1343
	brlz,a	%l0,	loop_1344
	fpackfix	%f2,	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1343:
	add	%l3,	0x12A1,	%g7
loop_1344:
	fmovsneg	%xcc,	%f6,	%f0
	addcc	%g4,	%i4,	%i3
	srax	%o6,	%i5,	%o4
	fands	%f3,	%f2,	%f30
	smulcc	%l6,	0x0D42,	%o5
	addc	%g1,	0x0C91,	%l2
	bvs	%xcc,	loop_1345
	xorcc	%o2,	%g2,	%o1
	ld	[%l7 + 0x18],	%f10
	set	0x10, %g6
	ldda	[%l7 + %g6] 0x14,	%l4
loop_1345:
	movleu	%icc,	%l4,	%i7
	edge32	%i6,	%g5,	%g6
	move	%icc,	%i0,	%g3
	udiv	%o0,	0x0FB5,	%o7
	fmul8x16al	%f3,	%f1,	%f26
	movl	%icc,	%i1,	%i2
	sll	%l1,	0x08,	%o3
	fmovdvc	%icc,	%f27,	%f5
	fmovsvc	%xcc,	%f14,	%f27
	edge16ln	%l3,	%l0,	%g4
	alignaddr	%g7,	%i3,	%o6
	tvs	%icc,	0x3
	tgu	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i4,	0x238,	%i5
	fcmpd	%fcc1,	%f8,	%f26
	fornot1	%f2,	%f4,	%f18
	movle	%icc,	%o4,	%o5
	nop
	setx	loop_1346,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16n	%g1,	%l6,	%l2
	fmovd	%f30,	%f28
	te	%xcc,	0x2
loop_1346:
	alignaddr	%o2,	%o1,	%g2
	edge32ln	%l5,	%l4,	%i7
	andncc	%i6,	%g6,	%g5
	tcs	%xcc,	0x4
	set	0x36, %l0
	stba	%i0,	[%l7 + %l0] 0x0c
	fbge	%fcc1,	loop_1347
	nop
	setx loop_1348, %l0, %l1
	jmpl %l1, %o0
	tl	%xcc,	0x3
	prefetch	[%l7 + 0x58],	 0x2
loop_1347:
	fmovdgu	%icc,	%f7,	%f7
loop_1348:
	te	%xcc,	0x6
	srlx	%o7,	0x13,	%g3
	movrlz	%i1,	0x2D3,	%i2
	movcc	%xcc,	%o3,	%l3
	bcc	%icc,	loop_1349
	fbne,a	%fcc2,	loop_1350
	be,a	loop_1351
	edge16n	%l0,	%g4,	%l1
loop_1349:
	edge8	%i3,	%g7,	%o6
loop_1350:
	subccc	%i5,	0x0DA0,	%i4
loop_1351:
	edge8ln	%o5,	%o4,	%g1
	fmul8x16au	%f18,	%f30,	%f30
	fmovrdlez	%l2,	%f26,	%f2
	andn	%o2,	0x163E,	%l6
	fpackfix	%f4,	%f1
	udivcc	%o1,	0x15FF,	%l5
	and	%g2,	%l4,	%i7
	be,pt	%icc,	loop_1352
	tl	%xcc,	0x0
	sethi	0x0F26,	%i6
	fors	%f31,	%f14,	%f26
loop_1352:
	stbar
	mulx	%g5,	0x1DAB,	%g6
	nop
	setx loop_1353, %l0, %l1
	jmpl %l1, %i0
	sllx	%o7,	%g3,	%i1
	wr	%g0,	0xe3,	%asi
	stha	%o0,	[%l7 + 0x6A] %asi
	membar	#Sync
loop_1353:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x38] %asi,	%i2
	edge32	%l3,	%o3,	%l0
	movle	%xcc,	%g4,	%i3
	fmovrdne	%g7,	%f8,	%f16
	sethi	0x184B,	%l1
	movleu	%icc,	%o6,	%i4
	ldstub	[%l7 + 0x6E],	%i5
	tgu	%icc,	0x3
	orcc	%o5,	%g1,	%l2
	fornot2	%f30,	%f12,	%f12
	sethi	0x1134,	%o2
	umul	%l6,	%o4,	%l5
	mulx	%g2,	0x0CFB,	%l4
	movrgez	%i7,	0x272,	%o1
	edge8n	%i6,	%g6,	%i0
	bpos	loop_1354
	fmovsvc	%icc,	%f28,	%f14
	srax	%o7,	0x1A,	%g5
	fornot1	%f26,	%f2,	%f26
loop_1354:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos	%xcc,	loop_1355
	fbge	%fcc2,	loop_1356
	movpos	%xcc,	%g3,	%o0
	smul	%i1,	0x11B0,	%i2
loop_1355:
	fcmple16	%f22,	%f14,	%l3
loop_1356:
	fmuld8ulx16	%f25,	%f31,	%f6
	set	0x46, %o2
	stha	%o3,	[%l7 + %o2] 0x2a
	membar	#Sync
	xnorcc	%l0,	0x139A,	%g4
	edge8n	%i3,	%l1,	%o6
	fbug,a	%fcc3,	loop_1357
	umul	%g7,	0x06EC,	%i4
	te	%icc,	0x1
	mulx	%i5,	%o5,	%l2
loop_1357:
	sth	%g1,	[%l7 + 0x0A]
	sdivx	%o2,	0x0F06,	%o4
	movcc	%xcc,	%l6,	%l5
	fmovrde	%g2,	%f4,	%f10
	tle	%icc,	0x4
	orn	%i7,	%l4,	%o1
	fbn,a	%fcc2,	loop_1358
	movneg	%icc,	%g6,	%i0
	fsrc2s	%f15,	%f31
	fmul8x16au	%f25,	%f17,	%f10
loop_1358:
	xnorcc	%i6,	0x14EC,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne,a	%fcc3,	loop_1359
	sdiv	%g3,	0x1E6D,	%o7
	subccc	%i1,	0x0361,	%i2
	edge16ln	%l3,	%o0,	%o3
loop_1359:
	nop
	set	0x18, %o0
	ldsba	[%l7 + %o0] 0x04,	%g4
	xnor	%l0,	0x1985,	%i3
	xorcc	%l1,	0x1AC4,	%o6
	tle	%icc,	0x4
	ldsh	[%l7 + 0x6C],	%i4
	fmovsl	%icc,	%f23,	%f10
	fmovrdgez	%g7,	%f30,	%f18
	smul	%o5,	0x15CC,	%l2
	movrlz	%g1,	0x32E,	%i5
	fbne	%fcc0,	loop_1360
	fmovdge	%xcc,	%f21,	%f30
	fornot1	%f28,	%f26,	%f0
	brgez	%o4,	loop_1361
loop_1360:
	edge8l	%o2,	%l6,	%l5
	edge8l	%i7,	%g2,	%l4
	movn	%xcc,	%o1,	%i0
loop_1361:
	tgu	%xcc,	0x1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%g5
	umulcc	%g6,	%g3,	%i1
	fxnor	%f2,	%f4,	%f12
	fbl,a	%fcc1,	loop_1362
	fand	%f10,	%f4,	%f26
	smul	%i2,	%l3,	%o7
	sra	%o3,	0x00,	%o0
loop_1362:
	fmovrde	%g4,	%f26,	%f8
	bneg,a	%icc,	loop_1363
	fmul8sux16	%f26,	%f18,	%f20
	subcc	%l0,	%i3,	%o6
	orn	%l1,	%g7,	%o5
loop_1363:
	edge16ln	%i4,	%l2,	%g1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x04,	%o4,	%o2
	tn	%xcc,	0x2
	bcc,a,pt	%xcc,	loop_1364
	sra	%l6,	0x08,	%i5
	ldsw	[%l7 + 0x48],	%i7
	udivx	%g2,	0x05F5,	%l4
loop_1364:
	nop
	set	0x4C, %i0
	lda	[%l7 + %i0] 0x80,	%f13
	mulscc	%o1,	%l5,	%i6
	tcc	%icc,	0x5
	set	0x58, %o5
	ldsha	[%l7 + %o5] 0x14,	%g5
	edge16	%i0,	%g6,	%i1
	te	%xcc,	0x5
	smul	%i2,	0x1DC1,	%g3
	edge32	%l3,	%o3,	%o0
	edge16n	%o7,	%g4,	%i3
	edge8	%l0,	%l1,	%o6
	fbge	%fcc1,	loop_1365
	tneg	%xcc,	0x1
	edge8l	%o5,	%i4,	%g7
	sdivcc	%g1,	0x1887,	%l2
loop_1365:
	sth	%o2,	[%l7 + 0x14]
	movneg	%xcc,	%o4,	%i5
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x38] %asi,	%f19
	movvs	%xcc,	%i7,	%g2
	edge16n	%l4,	%l6,	%l5
	fpsub32	%f14,	%f6,	%f10
	popc	0x0BA6,	%i6
	movcc	%icc,	%g5,	%o1
	mova	%icc,	%g6,	%i1
	fornot1	%f0,	%f12,	%f12
	move	%xcc,	%i0,	%g3
	fcmpgt32	%f30,	%f30,	%i2
	movg	%icc,	%o3,	%l3
	membar	0x66
	tvc	%icc,	0x4
	fmovdvs	%icc,	%f6,	%f26
	movle	%xcc,	%o0,	%o7
	fmovdcs	%icc,	%f17,	%f0
	set	0x0C, %g3
	lda	[%l7 + %g3] 0x81,	%f15
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x1E] %asi,	%g4
	tn	%xcc,	0x7
	fbule	%fcc0,	loop_1366
	tsubcctv	%i3,	%l1,	%o6
	edge8ln	%l0,	%i4,	%o5
	movpos	%icc,	%g7,	%l2
loop_1366:
	xnor	%o2,	%g1,	%o4
	movrne	%i5,	%g2,	%i7
	tcc	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f4,	[%l7 + 0x48]
	srl	%l4,	0x09,	%l6
	fornot1	%f6,	%f6,	%f18
	tsubcc	%l5,	0x0400,	%g5
	udivx	%i6,	0x0AD1,	%o1
	bl	%icc,	loop_1367
	te	%xcc,	0x3
	movn	%xcc,	%i1,	%i0
	sir	0x171B
loop_1367:
	sra	%g6,	%g3,	%o3
	te	%icc,	0x2
	nop
	setx	loop_1368,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tn	%xcc,	0x6
	mova	%icc,	%l3,	%i2
	ba,pn	%xcc,	loop_1369
loop_1368:
	tne	%icc,	0x1
	fmovrsne	%o7,	%f28,	%f18
	fbl,a	%fcc2,	loop_1370
loop_1369:
	move	%icc,	%o0,	%i3
	fbg,a	%fcc3,	loop_1371
	bne	%icc,	loop_1372
loop_1370:
	fmovsvs	%icc,	%f3,	%f31
	tsubcctv	%g4,	%l1,	%l0
loop_1371:
	fabss	%f19,	%f29
loop_1372:
	bcs,a,pt	%icc,	loop_1373
	nop
	setx loop_1374, %l0, %l1
	jmpl %l1, %o6
	andn	%i4,	0x0AFA,	%g7
	smulcc	%o5,	0x13B0,	%l2
loop_1373:
	fmovdcc	%xcc,	%f25,	%f28
loop_1374:
	fbul,a	%fcc0,	loop_1375
	add	%o2,	0x0A05,	%o4
	edge16	%g1,	%i5,	%i7
	fble	%fcc2,	loop_1376
loop_1375:
	bcc	loop_1377
	tleu	%xcc,	0x2
	add	%l4,	0x1FEC,	%l6
loop_1376:
	be	%xcc,	loop_1378
loop_1377:
	movge	%icc,	%g2,	%g5
	tleu	%icc,	0x3
	bvs,a,pn	%xcc,	loop_1379
loop_1378:
	tne	%xcc,	0x4
	array16	%i6,	%o1,	%l5
	bne,pt	%icc,	loop_1380
loop_1379:
	edge16	%i0,	%g6,	%g3
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
loop_1380:
	ldstub	[%l7 + 0x3A],	%l3
	fmuld8ulx16	%f11,	%f20,	%f2
	array8	%i1,	%i2,	%o7
	array8	%o0,	%i3,	%l1
	fmovdpos	%xcc,	%f20,	%f5
	fabss	%f10,	%f25
	movg	%xcc,	%l0,	%o6
	edge16n	%i4,	%g4,	%o5
	stx	%g7,	[%l7 + 0x40]
	xnor	%o2,	%o4,	%g1
	membar	0x0B
	tgu	%icc,	0x0
	udiv	%i5,	0x1AD5,	%l2
	andn	%l4,	%l6,	%g2
	membar	0x17
	fpack32	%f24,	%f8,	%f16
	xnor	%i7,	0x0639,	%g5
	fmovrdlez	%i6,	%f16,	%f12
	bcs	%xcc,	loop_1381
	fmovrde	%l5,	%f8,	%f20
	array32	%o1,	%i0,	%g3
	fmovdpos	%icc,	%f19,	%f8
loop_1381:
	fzero	%f10
	st	%f19,	[%l7 + 0x7C]
	fmovrde	%o3,	%f6,	%f4
	move	%xcc,	%l3,	%g6
	edge8l	%i2,	%i1,	%o7
	edge8ln	%i3,	%o0,	%l0
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x15
	edge8n	%l1,	%o6,	%i4
	udiv	%o5,	0x19B7,	%g4
	movl	%icc,	%g7,	%o2
	fmovspos	%icc,	%f17,	%f26
	movrgz	%o4,	%i5,	%g1
	sub	%l4,	0x02CD,	%l6
	fbuge,a	%fcc1,	loop_1382
	movcs	%icc,	%g2,	%i7
	sra	%g5,	%i6,	%l5
	tpos	%xcc,	0x2
loop_1382:
	nop
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%l2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o1,	%i0
	movre	%g3,	0x23B,	%l3
	fpadd32	%f0,	%f24,	%f20
	edge16ln	%g6,	%i2,	%i1
	fsrc1	%f16,	%f6
	array16	%o3,	%i3,	%o0
	andn	%o7,	0x1333,	%l0
	sdiv	%o6,	0x0A16,	%l1
	tgu	%xcc,	0x3
	orcc	%o5,	0x1294,	%g4
	fcmpeq16	%f24,	%f30,	%g7
	fbule,a	%fcc0,	loop_1383
	edge8ln	%o2,	%i4,	%i5
	edge32l	%o4,	%g1,	%l4
	movcs	%icc,	%g2,	%i7
loop_1383:
	orcc	%l6,	%g5,	%l5
	movl	%xcc,	%i6,	%l2
	movrlz	%o1,	0x217,	%g3
	brgez	%l3,	loop_1384
	xor	%i0,	0x02AC,	%g6
	bvc,a,pn	%xcc,	loop_1385
	tge	%xcc,	0x2
loop_1384:
	tcc	%icc,	0x0
	edge32ln	%i1,	%i2,	%o3
loop_1385:
	sdivcc	%o0,	0x12FB,	%o7
	fpadd16	%f14,	%f6,	%f8
	mulx	%l0,	0x0219,	%o6
	fmovsneg	%xcc,	%f31,	%f30
	fmovsvs	%xcc,	%f21,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg	loop_1386
	stw	%l1,	[%l7 + 0x14]
	xnor	%i3,	%o5,	%g7
	movre	%o2,	%i4,	%i5
loop_1386:
	tg	%icc,	0x0
	set	0x4A, %i1
	lduha	[%l7 + %i1] 0x10,	%o4
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x23,	%g4
	edge16ln	%g1,	%l4,	%i7
	edge32l	%l6,	%g5,	%g2
	sdivcc	%l5,	0x0D9D,	%i6
	movvc	%icc,	%o1,	%l2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x28] %asi,	%l3
	fmovdl	%icc,	%f5,	%f31
	fmovse	%xcc,	%f27,	%f25
	sdiv	%i0,	0x0137,	%g3
	movgu	%icc,	%g6,	%i1
	fmul8x16au	%f17,	%f30,	%f8
	tsubcc	%i2,	%o0,	%o7
	fmuld8ulx16	%f20,	%f8,	%f14
	tvc	%xcc,	0x4
	std	%f16,	[%l7 + 0x78]
	tn	%icc,	0x1
	movvc	%xcc,	%o3,	%l0
	udivcc	%o6,	0x12B7,	%i3
	subc	%o5,	0x0314,	%l1
	movne	%icc,	%g7,	%o2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x0c,	%i4,	%o4
	umulcc	%g4,	0x1FC0,	%i5
	fnot1	%f24,	%f28
	fcmpne16	%f18,	%f2,	%l4
	wr	%g0,	0x2a,	%asi
	stwa	%i7,	[%l7 + 0x44] %asi
	membar	#Sync
	brlez,a	%l6,	loop_1387
	bcs,a,pt	%xcc,	loop_1388
	stw	%g5,	[%l7 + 0x10]
	movg	%icc,	%g1,	%g2
loop_1387:
	fbue	%fcc0,	loop_1389
loop_1388:
	bge,a,pn	%xcc,	loop_1390
	fpadd32s	%f8,	%f22,	%f21
	mulx	%l5,	0x1C65,	%o1
loop_1389:
	bcs,a	%icc,	loop_1391
loop_1390:
	lduw	[%l7 + 0x54],	%i6
	movn	%xcc,	%l2,	%l3
	stb	%i0,	[%l7 + 0x3B]
loop_1391:
	movpos	%icc,	%g6,	%g3
	flush	%l7 + 0x70
	tneg	%xcc,	0x1
	tsubcctv	%i2,	%i1,	%o0
	fba,a	%fcc0,	loop_1392
	subcc	%o7,	0x059A,	%l0
	bne,a,pt	%xcc,	loop_1393
	addccc	%o6,	0x03F4,	%i3
loop_1392:
	umulcc	%o3,	0x1F49,	%o5
	fmovrdgez	%l1,	%f24,	%f2
loop_1393:
	fcmps	%fcc3,	%f8,	%f20
	edge16n	%g7,	%i4,	%o2
	fexpand	%f12,	%f10
	movre	%o4,	%g4,	%i5
	sdivcc	%i7,	0x0596,	%l4
	tpos	%xcc,	0x4
	sllx	%l6,	%g5,	%g2
	fmovsne	%xcc,	%f22,	%f10
	ba,a	loop_1394
	tg	%xcc,	0x2
	or	%g1,	%l5,	%i6
	move	%icc,	%l2,	%o1
loop_1394:
	popc	%l3,	%g6
	edge16n	%g3,	%i2,	%i1
	membar	0x46
	ldd	[%l7 + 0x38],	%o0
	nop
	set	0x78, %g2
	lduh	[%l7 + %g2],	%i0
	andn	%o7,	0x00D6,	%o6
	tn	%xcc,	0x0
	subc	%l0,	0x1DB2,	%o3
	nop
	setx loop_1395, %l0, %l1
	jmpl %l1, %o5
	sethi	0x156B,	%l1
	brlz,a	%g7,	loop_1396
	ta	%icc,	0x2
loop_1395:
	fbug,a	%fcc2,	loop_1397
	fbu	%fcc3,	loop_1398
loop_1396:
	fnot2	%f8,	%f10
	for	%f28,	%f26,	%f20
loop_1397:
	movg	%xcc,	%i4,	%i3
loop_1398:
	fble	%fcc0,	loop_1399
	xor	%o2,	0x03F8,	%o4
	fnor	%f16,	%f10,	%f28
	edge32	%g4,	%i5,	%l4
loop_1399:
	edge32ln	%i7,	%g5,	%g2
	tne	%xcc,	0x4
	subc	%l6,	%l5,	%g1
	set	0x10, %l6
	ldxa	[%l7 + %l6] 0x89,	%i6
	alignaddr	%o1,	%l2,	%l3
	orncc	%g3,	%i2,	%i1
	brlez	%o0,	loop_1400
	taddcctv	%g6,	%o7,	%i0
	tne	%xcc,	0x2
	ldsb	[%l7 + 0x58],	%o6
loop_1400:
	sub	%o3,	0x0DDE,	%o5
	tsubcc	%l1,	%g7,	%i4
	tn	%xcc,	0x1
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x08] %asi,	%i3
	nop
	setx	loop_1401,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpack16	%f2,	%f12
	xor	%o2,	%o4,	%g4
	fmul8x16al	%f31,	%f27,	%f20
loop_1401:
	fbg	%fcc2,	loop_1402
	faligndata	%f12,	%f2,	%f4
	tle	%icc,	0x1
	movgu	%xcc,	%i5,	%l4
loop_1402:
	udivx	%i7,	0x0D3F,	%l0
	srlx	%g5,	%g2,	%l5
	sra	%l6,	0x0B,	%i6
	ba,a,pt	%icc,	loop_1403
	edge32n	%o1,	%l2,	%l3
	edge16n	%g3,	%g1,	%i1
	flush	%l7 + 0x3C
loop_1403:
	bgu	loop_1404
	mulscc	%i2,	0x0FC0,	%o0
	sll	%o7,	0x07,	%g6
	orncc	%o6,	0x14C1,	%i0
loop_1404:
	fnand	%f6,	%f6,	%f20
	siam	0x6
	tl	%icc,	0x0
	srl	%o3,	%l1,	%o5
	fbu	%fcc2,	loop_1405
	fsrc1	%f18,	%f4
	udiv	%g7,	0x1068,	%i4
	fbu,a	%fcc0,	loop_1406
loop_1405:
	edge32	%i3,	%o4,	%g4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2A] %asi,	%o2
loop_1406:
	movpos	%icc,	%l4,	%i7
	fandnot2s	%f27,	%f19,	%f15
	stb	%l0,	[%l7 + 0x1D]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%g5,	%g2
	faligndata	%f6,	%f24,	%f16
	array16	%i5,	%l6,	%l5
	tg	%xcc,	0x0
	taddcctv	%o1,	0x0F00,	%i6
	fmovrdlz	%l2,	%f30,	%f30
	fsrc1s	%f3,	%f12
	sll	%l3,	0x03,	%g1
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movle	%xcc,	%g3,	%i1
	tn	%icc,	0x7
	tneg	%xcc,	0x7
	stx	%i2,	[%l7 + 0x50]
	fmovrdlz	%o7,	%f16,	%f8
	movcc	%xcc,	%o0,	%o6
	set	0x68, %l3
	lduwa	[%l7 + %l3] 0x88,	%g6
	wr	%g0,	0x23,	%asi
	stha	%o3,	[%l7 + 0x50] %asi
	membar	#Sync
	srlx	%l1,	%o5,	%i0
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x26] %asi,	%g7
	edge16ln	%i3,	%o4,	%i4
	srl	%g4,	%l4,	%i7
	sdivx	%l0,	0x0475,	%o2
	ld	[%l7 + 0x4C],	%f16
	srax	%g2,	0x07,	%i5
	bvs,a	loop_1407
	ldd	[%l7 + 0x48],	%f20
	be	loop_1408
	tsubcc	%g5,	%l5,	%l6
loop_1407:
	alignaddrl	%o1,	%i6,	%l2
	edge16	%g1,	%g3,	%i1
loop_1408:
	bvs,pn	%xcc,	loop_1409
	fsrc2s	%f9,	%f28
	fcmpes	%fcc1,	%f20,	%f14
	wr	%g0,	0xea,	%asi
	stda	%i2,	[%l7 + 0x10] %asi
	membar	#Sync
loop_1409:
	tcc	%xcc,	0x0
	nop
	setx	loop_1410,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnand	%f4,	%f28,	%f0
	fornot2s	%f25,	%f18,	%f23
	edge16ln	%o7,	%l3,	%o0
loop_1410:
	sethi	0x0C35,	%g6
	stb	%o3,	[%l7 + 0x67]
	tleu	%icc,	0x6
	tg	%icc,	0x1
	fcmpes	%fcc1,	%f3,	%f31
	movneg	%icc,	%o6,	%l1
	edge8ln	%o5,	%g7,	%i3
	set	0x38, %i3
	ldsha	[%l7 + %i3] 0x80,	%i0
	tgu	%icc,	0x5
	fnegd	%f8,	%f10
	te	%xcc,	0x1
	movrne	%o4,	0x3E4,	%g4
	xorcc	%i4,	0x161B,	%i7
	move	%xcc,	%l4,	%o2
	orcc	%g2,	%l0,	%i5
	sra	%l5,	%g5,	%o1
	subcc	%l6,	0x03F3,	%i6
	fmuld8ulx16	%f15,	%f17,	%f10
	tvc	%xcc,	0x4
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x17,	%f16
	fmovde	%icc,	%f5,	%f5
	sll	%l2,	0x0B,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i1,	0x1A,	%i2
	orncc	%o7,	%l3,	%g1
	fmovde	%icc,	%f19,	%f5
	fmovsvs	%xcc,	%f18,	%f22
	movg	%icc,	%o0,	%o3
	tsubcctv	%g6,	0x13EE,	%l1
	umulcc	%o6,	%o5,	%i3
	edge32	%g7,	%o4,	%g4
	addcc	%i4,	0x1D82,	%i0
	set	0x08, %g5
	lduha	[%l7 + %g5] 0x89,	%i7
	array16	%o2,	%g2,	%l0
	tle	%xcc,	0x1
	andcc	%i5,	0x1482,	%l4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x21] %asi,	%g5
	fmovdn	%icc,	%f5,	%f11
	bge,a,pn	%icc,	loop_1411
	brlz,a	%o1,	loop_1412
	tneg	%xcc,	0x1
	ldsw	[%l7 + 0x1C],	%l5
loop_1411:
	brgez	%l6,	loop_1413
loop_1412:
	fmovsn	%icc,	%f14,	%f3
	movrgez	%i6,	0x373,	%l2
	fpack32	%f26,	%f10,	%f12
loop_1413:
	movrgz	%i1,	0x172,	%i2
	udiv	%o7,	0x1E21,	%l3
	movn	%icc,	%g3,	%g1
	array8	%o0,	%g6,	%l1
	fbl,a	%fcc1,	loop_1414
	mulscc	%o3,	0x0CAB,	%o6
	ldub	[%l7 + 0x61],	%i3
	bcc,pt	%xcc,	loop_1415
loop_1414:
	addccc	%o5,	0x0894,	%o4
	alignaddrl	%g7,	%i4,	%i0
	movneg	%icc,	%g4,	%o2
loop_1415:
	fzeros	%f21
	addccc	%g2,	%i7,	%l0
	fmovdge	%xcc,	%f11,	%f29
	orcc	%i5,	0x0EFF,	%g5
	alignaddr	%o1,	%l4,	%l6
	brz	%l5,	loop_1416
	xnorcc	%l2,	0x1B84,	%i6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
loop_1416:
	fbue	%fcc2,	loop_1417
	prefetch	[%l7 + 0x38],	 0x1
	movrgez	%i1,	0x289,	%o7
	fands	%f19,	%f16,	%f22
loop_1417:
	ldub	[%l7 + 0x3C],	%g3
	movrgz	%g1,	%l3,	%g6
	movleu	%xcc,	%l1,	%o3
	fnot1s	%f22,	%f5
	lduh	[%l7 + 0x6A],	%o6
	pdist	%f22,	%f20,	%f8
	fmul8ulx16	%f26,	%f28,	%f26
	orncc	%i3,	0x0D9D,	%o0
	edge16l	%o5,	%g7,	%o4
	fxor	%f28,	%f12,	%f12
	edge8	%i4,	%g4,	%o2
	tgu	%xcc,	0x5
	fnand	%f20,	%f2,	%f22
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x5C] %asi,	%f10
	ta	%icc,	0x3
	xnor	%i0,	%i7,	%l0
	movcs	%xcc,	%i5,	%g5
	tvc	%xcc,	0x3
	taddcc	%g2,	%o1,	%l4
	fsrc1	%f24,	%f0
	fmovda	%icc,	%f18,	%f3
	fbue	%fcc3,	loop_1418
	fmovdne	%icc,	%f29,	%f10
	array8	%l6,	%l2,	%l5
	edge16	%i2,	%i6,	%o7
loop_1418:
	udivx	%i1,	0x0D62,	%g3
	sdivcc	%l3,	0x05E0,	%g6
	tsubcctv	%l1,	%o3,	%g1
	andncc	%o6,	%o0,	%i3
	ldd	[%l7 + 0x10],	%o4
	fmovrdlez	%o4,	%f0,	%f14
	fmovrsgz	%g7,	%f9,	%f1
	movneg	%xcc,	%i4,	%o2
	fnegs	%f12,	%f17
	flush	%l7 + 0x40
	nop
	set	0x30, %i4
	std	%g4,	[%l7 + %i4]
	fxors	%f12,	%f4,	%f23
	andn	%i7,	%l0,	%i5
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x2C] %asi,	%f30
	ta	%xcc,	0x5
	taddcc	%g5,	0x0851,	%i0
	subc	%g2,	0x10A7,	%o1
	fble,a	%fcc0,	loop_1419
	ldub	[%l7 + 0x55],	%l4
	fandnot1	%f8,	%f18,	%f28
	movrgez	%l6,	0x303,	%l5
loop_1419:
	smulcc	%i2,	%i6,	%o7
	addccc	%i1,	0x0199,	%g3
	sdivx	%l2,	0x08D8,	%g6
	tge	%icc,	0x4
	fpack32	%f16,	%f2,	%f12
	fnors	%f14,	%f2,	%f30
	fone	%f24
	bneg	%xcc,	loop_1420
	subc	%l1,	%o3,	%g1
	movrlz	%o6,	0x182,	%l3
	edge8ln	%o0,	%o5,	%i3
loop_1420:
	array8	%g7,	%o4,	%o2
	tneg	%icc,	0x6
	orncc	%i4,	%i7,	%l0
	fcmpeq16	%f26,	%f16,	%i5
	fabss	%f8,	%f0
	add	%g5,	%g4,	%g2
	udivx	%o1,	0x1452,	%i0
	fble,a	%fcc3,	loop_1421
	call	loop_1422
	edge16	%l4,	%l5,	%i2
	tpos	%xcc,	0x6
loop_1421:
	nop
	set	0x2C, %i7
	ldswa	[%l7 + %i7] 0x10,	%i6
loop_1422:
	nop
	set	0x28, %g1
	stba	%o7,	[%l7 + %g1] 0x15
	set	0x44, %l1
	lduha	[%l7 + %l1] 0x10,	%i1
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
	alignaddrl	%l6,	%g6,	%l1
	sdivx	%l2,	0x177F,	%o3
	fnot2	%f10,	%f16
	andncc	%o6,	%g1,	%o0
	fandnot1s	%f0,	%f10,	%f1
	set	0x350, %l2
	nop 	! 	nop 	! 	ldxa	[%g0 + %l2] 0x40,	%o5 ripped by fixASI40.pl ripped by fixASI40.pl
	fcmpd	%fcc3,	%f18,	%f2
	fone	%f18
	movrlz	%l3,	0x1BF,	%g7
	fmovd	%f26,	%f16
	edge8	%o4,	%o2,	%i3
	taddcc	%i4,	0x115A,	%i7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%i5,	%g5
	sub	%g4,	0x1312,	%g2
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x66] %asi,	%o1
	tleu	%xcc,	0x6
	fmovda	%icc,	%f19,	%f21
	fcmpeq16	%f0,	%f24,	%l0
	orncc	%l4,	0x1215,	%i0
	ba	loop_1423
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x2b,	%asi
	stxa	%i2,	[%l7 + 0x38] %asi
	membar	#Sync
loop_1423:
	fxnor	%f14,	%f0,	%f22
	fmovrsgez	%l5,	%f23,	%f3
	sdiv	%o7,	0x040A,	%i6
	tpos	%icc,	0x5
	fzero	%f16
	orn	%i1,	0x1A44,	%l6
	sll	%g6,	0x09,	%l1
	addccc	%l2,	0x028C,	%g3
	flush	%l7 + 0x1C
	mulx	%o3,	0x0EB4,	%o6
	movrlez	%o0,	%g1,	%l3
	fmul8x16al	%f10,	%f17,	%f30
	tvc	%xcc,	0x7
	alignaddrl	%g7,	%o5,	%o4
	array32	%i3,	%i4,	%o2
	sdiv	%i7,	0x0539,	%i5
	tcs	%xcc,	0x1
	mova	%icc,	%g5,	%g4
	bleu,a	loop_1424
	movgu	%icc,	%o1,	%g2
	fbu,a	%fcc2,	loop_1425
	movrne	%l0,	0x1D5,	%i0
loop_1424:
	fmovsa	%icc,	%f13,	%f28
	fmovsg	%icc,	%f30,	%f12
loop_1425:
	sub	%l4,	%i2,	%o7
	edge16n	%l5,	%i6,	%l6
	sdiv	%g6,	0x0171,	%l1
	fbo,a	%fcc3,	loop_1426
	tg	%xcc,	0x7
	fmovrse	%i1,	%f25,	%f11
	set	0x2C, %i2
	lduwa	[%l7 + %i2] 0x0c,	%l2
loop_1426:
	fmovdpos	%xcc,	%f10,	%f4
	and	%o3,	%o6,	%g3
	edge16	%g1,	%o0,	%l3
	tg	%xcc,	0x7
	fmovsvc	%icc,	%f27,	%f22
	fbg,a	%fcc3,	loop_1427
	edge16l	%o5,	%g7,	%o4
	fornot2	%f8,	%f0,	%f12
	wr	%g0,	0x89,	%asi
	stwa	%i3,	[%l7 + 0x6C] %asi
loop_1427:
	udiv	%o2,	0x0DF5,	%i7
	movrne	%i4,	%g5,	%i5
	stx	%o1,	[%l7 + 0x40]
	edge8	%g2,	%l0,	%i0
	or	%l4,	0x053E,	%i2
	movl	%icc,	%o7,	%g4
	set	0x5C, %o4
	stwa	%l5,	[%l7 + %o4] 0x2f
	membar	#Sync
	brz	%i6,	loop_1428
	std	%f12,	[%l7 + 0x08]
	mulx	%l6,	0x03C3,	%g6
	addc	%i1,	0x02F7,	%l2
loop_1428:
	fba	%fcc0,	loop_1429
	addcc	%o3,	%o6,	%g3
	udivx	%l1,	0x19B5,	%o0
	wr	%g0,	0x80,	%asi
	stba	%l3,	[%l7 + 0x60] %asi
loop_1429:
	nop
	setx loop_1430, %l0, %l1
	jmpl %l1, %g1
	andncc	%o5,	%o4,	%g7
	movneg	%xcc,	%i3,	%o2
	array16	%i4,	%i7,	%i5
loop_1430:
	edge16	%o1,	%g5,	%g2
	sdivcc	%l0,	0x01B9,	%l4
	xnor	%i0,	%i2,	%g4
	nop
	setx	loop_1431,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	for	%f30,	%f12,	%f24
	fmuld8ulx16	%f28,	%f14,	%f24
	fmovdl	%icc,	%f31,	%f5
loop_1431:
	fmovdn	%icc,	%f31,	%f5
	ta	%icc,	0x4
	tn	%xcc,	0x0
	sra	%l5,	%i6,	%l6
	andcc	%o7,	%g6,	%i1
	set	0x7C, %l4
	swapa	[%l7 + %l4] 0x89,	%o3
	fbule	%fcc1,	loop_1432
	tg	%icc,	0x6
	siam	0x5
	fmovrsgz	%l2,	%f17,	%f6
loop_1432:
	movpos	%icc,	%o6,	%l1
	movn	%xcc,	%g3,	%o0
	tsubcctv	%l3,	0x1829,	%g1
	addccc	%o5,	%o4,	%i3
	bg,a	loop_1433
	sdivcc	%o2,	0x1729,	%i4
	movle	%xcc,	%g7,	%i7
	srlx	%o1,	0x12,	%i5
loop_1433:
	nop
	set	0x20, %o7
	prefetcha	[%l7 + %o7] 0x0c,	 0x1
	edge8n	%g2,	%l0,	%i0
	ta	%xcc,	0x4
	edge16ln	%l4,	%g4,	%i2
	fone	%f14
	fpsub32s	%f16,	%f19,	%f16
	fmul8x16	%f19,	%f14,	%f28
	brgz,a	%l5,	loop_1434
	andn	%i6,	0x13C9,	%l6
	sdivcc	%g6,	0x148A,	%i1
	edge16l	%o3,	%o7,	%o6
loop_1434:
	fmovspos	%icc,	%f11,	%f27
	movge	%icc,	%l1,	%l2
	movre	%g3,	0x36D,	%l3
	tge	%icc,	0x0
	movrne	%g1,	%o5,	%o4
	movrgz	%i3,	0x11F,	%o2
	movleu	%xcc,	%i4,	%g7
	fmovsle	%xcc,	%f30,	%f18
	orn	%i7,	%o0,	%o1
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x5C] %asi,	%g5
	fabss	%f7,	%f28
	fbug	%fcc3,	loop_1435
	brz	%i5,	loop_1436
	srlx	%g2,	%i0,	%l0
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1435:
	addcc	%g4,	%l4,	%i2
loop_1436:
	fnands	%f11,	%f24,	%f18
	nop
	setx loop_1437, %l0, %l1
	jmpl %l1, %i6
	fcmped	%fcc3,	%f14,	%f12
	fmovrsgz	%l6,	%f23,	%f13
	edge8	%l5,	%g6,	%i1
loop_1437:
	smulcc	%o3,	0x0D49,	%o7
	set	0x56, %l5
	ldsha	[%l7 + %l5] 0x18,	%l1
	fmuld8ulx16	%f22,	%f30,	%f0
	array32	%l2,	%o6,	%g3
	tcc	%icc,	0x2
	move	%icc,	%g1,	%o5
	ld	[%l7 + 0x60],	%f4
	call	loop_1438
	edge8	%l3,	%i3,	%o2
	sir	0x12F2
	move	%icc,	%i4,	%g7
loop_1438:
	xor	%o4,	0x0211,	%o0
	movrgez	%o1,	%g5,	%i5
	fandnot2	%f30,	%f0,	%f2
	bvc,a	loop_1439
	umul	%i7,	0x1AE3,	%g2
	movleu	%icc,	%i0,	%g4
	tleu	%xcc,	0x6
loop_1439:
	ldd	[%l7 + 0x38],	%l0
	andncc	%l4,	%i2,	%l6
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%i6
	tne	%xcc,	0x7
	bleu,a	loop_1440
	fbn,a	%fcc2,	loop_1441
	smul	%g6,	%l5,	%i1
	fbule	%fcc3,	loop_1442
loop_1440:
	movcc	%xcc,	%o3,	%o7
loop_1441:
	tne	%xcc,	0x3
	edge16n	%l1,	%o6,	%g3
loop_1442:
	tg	%icc,	0x1
	fpsub32	%f10,	%f14,	%f6
	std	%g0,	[%l7 + 0x58]
	movne	%xcc,	%o5,	%l3
	fpsub16	%f4,	%f16,	%f26
	fmovdvs	%icc,	%f26,	%f22
	fbuge	%fcc0,	loop_1443
	sdivcc	%l2,	0x05E9,	%i3
	sll	%i4,	0x07,	%g7
	ldd	[%l7 + 0x60],	%o4
loop_1443:
	bvc,pt	%icc,	loop_1444
	movneg	%icc,	%o0,	%o2
	udiv	%g5,	0x197A,	%o1
	array8	%i5,	%g2,	%i0
loop_1444:
	edge16l	%g4,	%l0,	%i7
	fpackfix	%f24,	%f20
	fmul8ulx16	%f18,	%f26,	%f28
	tsubcc	%i2,	0x08C3,	%l4
	movle	%xcc,	%i6,	%l6
	fbul,a	%fcc0,	loop_1445
	flush	%l7 + 0x1C
	movg	%icc,	%g6,	%l5
	std	%i0,	[%l7 + 0x20]
loop_1445:
	move	%xcc,	%o3,	%l1
	ld	[%l7 + 0x34],	%f18
	tgu	%icc,	0x7
	array32	%o6,	%o7,	%g3
	edge8ln	%o5,	%l3,	%l2
	fmovrdlez	%i3,	%f30,	%f22
	edge16ln	%i4,	%g1,	%g7
	bge	loop_1446
	stbar
	ldsh	[%l7 + 0x7E],	%o0
	movre	%o4,	%g5,	%o1
loop_1446:
	fandnot2	%f8,	%f4,	%f6
	nop
	setx	loop_1447,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%i5,	0x16DA,	%o2
	subcc	%g2,	0x1AF1,	%g4
	edge32l	%i0,	%i7,	%i2
loop_1447:
	sub	%l0,	%i6,	%l4
	orn	%g6,	%l5,	%l6
	ba,a,pt	%xcc,	loop_1448
	swap	[%l7 + 0x6C],	%o3
	fandnot2s	%f29,	%f26,	%f17
	array32	%l1,	%i1,	%o7
loop_1448:
	be,a,pn	%icc,	loop_1449
	fmovrde	%o6,	%f16,	%f6
	ldsw	[%l7 + 0x2C],	%o5
	fabss	%f23,	%f7
loop_1449:
	xnorcc	%l3,	0x11E7,	%g3
	andcc	%i3,	%i4,	%g1
	ldsw	[%l7 + 0x3C],	%l2
	sir	0x0B14
	edge32	%g7,	%o4,	%o0
	movleu	%icc,	%g5,	%i5
	fxor	%f8,	%f18,	%f0
	fandnot2	%f26,	%f20,	%f20
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%o2
	fmovscc	%icc,	%f14,	%f6
	fmul8ulx16	%f0,	%f0,	%f10
	addc	%g4,	%i0,	%i7
	fmovrslez	%i2,	%f5,	%f16
	fxnor	%f20,	%f4,	%f26
	movg	%xcc,	%l0,	%i6
	movvs	%xcc,	%l4,	%g6
	fbge	%fcc3,	loop_1450
	tgu	%icc,	0x0
	smulcc	%l5,	%g2,	%o3
	fblg	%fcc3,	loop_1451
loop_1450:
	umulcc	%l1,	0x132C,	%l6
	mulx	%o7,	0x0363,	%i1
	sdiv	%o5,	0x008B,	%o6
loop_1451:
	fxor	%f8,	%f10,	%f24
	udivcc	%g3,	0x05DF,	%l3
	xorcc	%i3,	%i4,	%g1
	fmovdn	%icc,	%f12,	%f9
	edge32l	%g7,	%o4,	%o0
	movne	%icc,	%l2,	%g5
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x34] %asi,	%o1
	fmovs	%f17,	%f12
	edge8	%o2,	%g4,	%i0
	xnorcc	%i7,	0x13E2,	%i5
	fbuge	%fcc0,	loop_1452
	fmul8x16	%f9,	%f16,	%f16
	subcc	%l0,	%i6,	%l4
	std	%f24,	[%l7 + 0x30]
loop_1452:
	fcmpeq32	%f10,	%f14,	%g6
	set	0x7C, %o6
	swapa	[%l7 + %o6] 0x89,	%l5
	taddcctv	%g2,	0x053C,	%i2
	movrlez	%l1,	0x35F,	%o3
	fands	%f31,	%f22,	%f4
	sir	0x0013
	ldsw	[%l7 + 0x10],	%o7
	tcc	%icc,	0x5
	fmul8x16au	%f28,	%f26,	%f12
	subcc	%l6,	0x1724,	%i1
	tvc	%icc,	0x5
	sllx	%o5,	%o6,	%l3
	bneg,a,pt	%xcc,	loop_1453
	edge16	%i3,	%i4,	%g3
	movleu	%icc,	%g7,	%g1
	andcc	%o4,	%o0,	%l2
loop_1453:
	swap	[%l7 + 0x18],	%o1
	popc	%o2,	%g5
	edge16l	%i0,	%g4,	%i7
	fbuge	%fcc1,	loop_1454
	fone	%f30
	tsubcc	%i5,	%l0,	%i6
	fmovdleu	%xcc,	%f25,	%f15
loop_1454:
	fmovdle	%icc,	%f18,	%f9
	nop
	set	0x28, %g7
	ldd	[%l7 + %g7],	%f12
	sll	%l4,	%g6,	%g2
	taddcctv	%l5,	0x1559,	%l1
	brgz,a	%o3,	loop_1455
	fnot1	%f24,	%f12
	tg	%icc,	0x5
	orn	%o7,	%i2,	%i1
loop_1455:
	nop
	set	0x70, %i6
	stw	%o5,	[%l7 + %i6]
	movne	%xcc,	%o6,	%l3
	fmovdvc	%xcc,	%f20,	%f22
	edge32n	%i3,	%i4,	%g3
	subc	%l6,	%g1,	%o4
	movrlz	%o0,	0x069,	%g7
	fmovdg	%xcc,	%f25,	%f1
	fbue	%fcc0,	loop_1456
	siam	0x2
	xorcc	%l2,	%o1,	%o2
	membar	0x5A
loop_1456:
	fcmpeq32	%f22,	%f20,	%i0
	tcc	%icc,	0x2
	edge32ln	%g5,	%g4,	%i5
	srlx	%l0,	0x1E,	%i6
	addcc	%i7,	%l4,	%g2
	orn	%g6,	%l5,	%l1
	movn	%icc,	%o3,	%i2
	movneg	%icc,	%i1,	%o5
	xor	%o6,	0x0514,	%o7
	tle	%icc,	0x4
	addccc	%l3,	%i3,	%i4
	bne	loop_1457
	udivcc	%l6,	0x03C0,	%g1
	fmovsvc	%xcc,	%f27,	%f12
	fbo,a	%fcc0,	loop_1458
loop_1457:
	umul	%o4,	0x1513,	%o0
	fpadd16	%f16,	%f2,	%f22
	movleu	%xcc,	%g7,	%l2
loop_1458:
	bshuffle	%f6,	%f18,	%f18
	movneg	%icc,	%g3,	%o2
	nop
	setx	loop_1459,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%i0,	%o1
	brnz,a	%g5,	loop_1460
	edge16n	%g4,	%i5,	%l0
loop_1459:
	sdivx	%i6,	0x0F8A,	%l4
	movrne	%g2,	%i7,	%l5
loop_1460:
	xorcc	%l1,	%o3,	%i2
	xnorcc	%g6,	0x0661,	%o5
	and	%i1,	%o7,	%o6
	orncc	%i3,	%i4,	%l6
	tn	%xcc,	0x5
	edge16	%g1,	%l3,	%o0
	movre	%o4,	%l2,	%g3
	lduh	[%l7 + 0x3C],	%g7
	orn	%i0,	0x129A,	%o2
	array8	%o1,	%g5,	%g4
	wr	%g0,	0x19,	%asi
	sta	%f0,	[%l7 + 0x18] %asi
	fcmpeq16	%f30,	%f0,	%i5
	movrlz	%i6,	0x3EC,	%l0
	xor	%l4,	0x1861,	%g2
	sub	%l5,	%i7,	%o3
	fmul8x16	%f18,	%f28,	%f30
	movn	%xcc,	%l1,	%g6
	bpos	%icc,	loop_1461
	fnands	%f26,	%f3,	%f5
	addc	%i2,	0x0A89,	%i1
	stw	%o7,	[%l7 + 0x10]
loop_1461:
	for	%f0,	%f0,	%f22
	andn	%o6,	%o5,	%i4
	orncc	%l6,	%i3,	%l3
	flush	%l7 + 0x10
	movrlz	%g1,	0x01F,	%o4
	fabsd	%f2,	%f16
	nop
	setx	loop_1462,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xorcc	%l2,	0x181C,	%g3
	andcc	%g7,	%i0,	%o2
	smul	%o1,	0x0D14,	%g5
loop_1462:
	movcc	%xcc,	%g4,	%o0
	tg	%xcc,	0x2
	tneg	%xcc,	0x0
	movvc	%icc,	%i6,	%l0
	tcs	%icc,	0x0
	srax	%l4,	%i5,	%g2
	popc	0x0599,	%l5
	bn,pt	%icc,	loop_1463
	ldsw	[%l7 + 0x60],	%o3
	fbuge	%fcc0,	loop_1464
	sdivcc	%i7,	0x1CDB,	%l1
loop_1463:
	fnand	%f22,	%f16,	%f14
	srax	%g6,	%i2,	%o7
loop_1464:
	movl	%xcc,	%o6,	%i1
	fnegs	%f22,	%f19
	bvs,a,pn	%icc,	loop_1465
	and	%o5,	%l6,	%i4
	ldsb	[%l7 + 0x16],	%l3
	fbug,a	%fcc2,	loop_1466
loop_1465:
	be,a,pn	%icc,	loop_1467
	tne	%icc,	0x5
	srax	%i3,	0x1F,	%o4
loop_1466:
	andcc	%g1,	0x185E,	%l2
loop_1467:
	umul	%g3,	0x0122,	%g7
	srl	%o2,	0x12,	%o1
	nop
	setx	loop_1468,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	pdist	%f6,	%f30,	%f8
	tvs	%xcc,	0x0
	fmovdpos	%icc,	%f15,	%f9
loop_1468:
	movrlz	%i0,	0x294,	%g4
	edge32	%o0,	%g5,	%l0
	movrlez	%l4,	%i6,	%g2
	fmovrsne	%i5,	%f15,	%f3
	smulcc	%l5,	0x07BE,	%o3
	ta	%xcc,	0x7
	fpsub32	%f22,	%f16,	%f4
	edge32n	%i7,	%l1,	%i2
	ld	[%l7 + 0x7C],	%f5
	sub	%g6,	0x0BC4,	%o7
	andcc	%i1,	%o6,	%l6
	stbar
	ta	%icc,	0x7
	xnor	%i4,	%o5,	%l3
	bge,a,pn	%xcc,	loop_1469
	fbne,a	%fcc1,	loop_1470
	bcs,a,pn	%icc,	loop_1471
	array8	%o4,	%i3,	%g1
loop_1469:
	tsubcctv	%g3,	%g7,	%o2
loop_1470:
	smulcc	%l2,	%o1,	%i0
loop_1471:
	array16	%g4,	%o0,	%l0
	mova	%xcc,	%g5,	%i6
	set	0x70, %g4
	ldsha	[%l7 + %g4] 0x11,	%l4
	fmovdcs	%xcc,	%f11,	%f3
	std	%f18,	[%l7 + 0x40]
	fmovscs	%xcc,	%f6,	%f16
	fpsub16s	%f11,	%f19,	%f20
	fornot2s	%f20,	%f25,	%f1
	edge32l	%g2,	%i5,	%l5
	fnegd	%f14,	%f8
	tne	%xcc,	0x3
	siam	0x5
	fcmpgt32	%f2,	%f18,	%o3
	set	0x48, %l0
	lda	[%l7 + %l0] 0x19,	%f0
	set	0x20, %o2
	stxa	%l1,	[%l7 + %o2] 0x15
	sth	%i2,	[%l7 + 0x12]
	fmovrsgz	%i7,	%f23,	%f23
	alignaddrl	%g6,	%o7,	%o6
	te	%xcc,	0x5
	edge8l	%i1,	%l6,	%i4
	brgz,a	%o5,	loop_1472
	movleu	%icc,	%o4,	%l3
	movle	%xcc,	%i3,	%g1
	set	0x40, %g6
	sta	%f13,	[%l7 + %g6] 0x88
loop_1472:
	fmovdn	%xcc,	%f1,	%f9
	tvc	%icc,	0x6
	subcc	%g3,	0x03C6,	%o2
	movge	%icc,	%l2,	%g7
	edge32n	%o1,	%g4,	%o0
	fmul8x16	%f30,	%f8,	%f2
	tsubcctv	%i0,	0x1D22,	%l0
	move	%xcc,	%i6,	%l4
	tvs	%xcc,	0x5
	ld	[%l7 + 0x6C],	%f29
	umulcc	%g2,	0x055F,	%g5
	bvs,a	loop_1473
	movne	%xcc,	%i5,	%o3
	udiv	%l5,	0x1366,	%l1
	fpadd32	%f4,	%f10,	%f22
loop_1473:
	fpsub32s	%f22,	%f1,	%f15
	tgu	%xcc,	0x2
	fabss	%f16,	%f4
	smulcc	%i7,	%i2,	%o7
	andcc	%g6,	%i1,	%o6
	movn	%xcc,	%i4,	%l6
	udivcc	%o5,	0x1BBE,	%o4
	fornot1s	%f26,	%f15,	%f22
	movvs	%xcc,	%i3,	%g1
	smul	%l3,	%g3,	%o2
	movrgz	%l2,	0x157,	%g7
	srl	%o1,	%o0,	%g4
	orn	%l0,	0x1D1C,	%i6
	fbg	%fcc3,	loop_1474
	tleu	%icc,	0x4
	fnors	%f10,	%f4,	%f27
	set	0x2A, %o0
	ldsha	[%l7 + %o0] 0x89,	%i0
loop_1474:
	tvs	%icc,	0x5
	bvs,pn	%xcc,	loop_1475
	brz,a	%l4,	loop_1476
	mulscc	%g5,	%i5,	%g2
	fmovd	%f6,	%f10
loop_1475:
	tne	%icc,	0x1
loop_1476:
	ble,pt	%xcc,	loop_1477
	movpos	%icc,	%l5,	%l1
	subc	%o3,	%i7,	%o7
	bcs,pn	%xcc,	loop_1478
loop_1477:
	tgu	%icc,	0x4
	tcs	%icc,	0x0
	movvc	%icc,	%g6,	%i1
loop_1478:
	ble	loop_1479
	smulcc	%i2,	%i4,	%o6
	popc	%o5,	%l6
	sth	%o4,	[%l7 + 0x4E]
loop_1479:
	nop
	wr	%g0,	0x11,	%asi
	sta	%f5,	[%l7 + 0x3C] %asi
	andn	%g1,	%l3,	%g3
	te	%icc,	0x3
	edge32	%i3,	%l2,	%o2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x51] %asi,	%g7
	fandnot1	%f6,	%f16,	%f20
	edge8n	%o1,	%g4,	%l0
	edge8ln	%o0,	%i6,	%i0
	fba,a	%fcc2,	loop_1480
	tcs	%xcc,	0x4
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
	fmovsa	%xcc,	%f4,	%f30
loop_1480:
	udivcc	%l4,	0x0B17,	%i5
	nop
	set	0x40, %i0
	std	%g2,	[%l7 + %i0]
loop_1481:
	edge16	%l5,	%g5,	%o3
	fcmps	%fcc1,	%f2,	%f25
	tvc	%xcc,	0x7
	ba,a,pn	%icc,	loop_1482
	fba	%fcc3,	loop_1483
	sdivcc	%i7,	0x0455,	%l1
	fmovsneg	%icc,	%f15,	%f11
loop_1482:
	or	%g6,	%i1,	%i2
loop_1483:
	bg,a	loop_1484
	tl	%icc,	0x2
	movvs	%icc,	%o7,	%o6
	movrne	%o5,	0x14D,	%l6
loop_1484:
	movne	%xcc,	%i4,	%o4
	stb	%l3,	[%l7 + 0x4F]
	fmovsgu	%icc,	%f4,	%f30
	nop
	set	0x6C, %o5
	lduw	[%l7 + %o5],	%g3
	lduh	[%l7 + 0x48],	%i3
	tsubcctv	%l2,	0x0482,	%o2
	movl	%icc,	%g7,	%o1
	stbar
	edge32l	%g4,	%g1,	%l0
	fmovdcs	%icc,	%f29,	%f25
	sdivcc	%o0,	0x0506,	%i0
	movpos	%xcc,	%l4,	%i5
	fornot1s	%f31,	%f23,	%f20
	std	%i6,	[%l7 + 0x20]
	fpackfix	%f12,	%f30
	movgu	%xcc,	%l5,	%g2
	fones	%f22
	nop
	setx	loop_1485,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%o3,	0x1A59,	%i7
	ldub	[%l7 + 0x33],	%g5
	st	%f5,	[%l7 + 0x30]
loop_1485:
	srlx	%l1,	0x0B,	%i1
	fmovdne	%xcc,	%f3,	%f7
	subcc	%i2,	%o7,	%o6
	edge16n	%o5,	%l6,	%i4
	fcmple32	%f22,	%f20,	%g6
	set	0x20, %o1
	prefetcha	[%l7 + %o1] 0x18,	 0x1
	addcc	%o4,	%g3,	%l2
	fsrc2s	%f10,	%f19
	andncc	%i3,	%o2,	%o1
	movn	%xcc,	%g7,	%g1
	fmovscc	%icc,	%f2,	%f13
	edge16n	%g4,	%o0,	%l0
	alignaddr	%i0,	%i5,	%l4
	sra	%i6,	%g2,	%o3
	edge8ln	%l5,	%i7,	%l1
	wr	%g0,	0x2b,	%asi
	stba	%i1,	[%l7 + 0x0B] %asi
	membar	#Sync
	movrlez	%i2,	%o7,	%g5
	bneg,pt	%xcc,	loop_1486
	movg	%xcc,	%o5,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1487,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1486:
	fbl,a	%fcc1,	loop_1488
	ta	%xcc,	0x2
	subc	%o6,	%i4,	%g6
loop_1487:
	movvs	%icc,	%l3,	%o4
loop_1488:
	tvs	%icc,	0x6
	bpos,a	loop_1489
	tcc	%xcc,	0x3
	set	0x5A, %i1
	stha	%g3,	[%l7 + %i1] 0xe2
	membar	#Sync
loop_1489:
	movne	%xcc,	%l2,	%i3
	edge8ln	%o1,	%o2,	%g1
	std	%g4,	[%l7 + 0x60]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x70] %asi,	%o0
	fpadd32	%f28,	%f18,	%f30
	umulcc	%l0,	0x133B,	%g7
	tneg	%icc,	0x0
	srax	%i5,	0x15,	%l4
	movrgz	%i0,	%g2,	%o3
	set	0x22, %g3
	lduha	[%l7 + %g3] 0x18,	%l5
	tl	%xcc,	0x3
	array32	%i7,	%l1,	%i6
	fbg,a	%fcc2,	loop_1490
	fcmpne32	%f10,	%f26,	%i2
	swap	[%l7 + 0x60],	%o7
	te	%icc,	0x2
loop_1490:
	umul	%i1,	%o5,	%l6
	fandnot2	%f20,	%f18,	%f22
	be,a,pt	%xcc,	loop_1491
	array16	%o6,	%g5,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a,pt	%xcc,	loop_1492
loop_1491:
	bleu	loop_1493
	movrgez	%l3,	%i4,	%o4
	lduh	[%l7 + 0x0E],	%l2
loop_1492:
	edge32n	%g3,	%o1,	%o2
loop_1493:
	fand	%f30,	%f0,	%f4
	edge8l	%g1,	%i3,	%o0
	fsrc2	%f24,	%f2
	fbl	%fcc0,	loop_1494
	edge8l	%l0,	%g7,	%g4
	fbo	%fcc3,	loop_1495
	nop
	setx loop_1496, %l0, %l1
	jmpl %l1, %i5
loop_1494:
	tle	%xcc,	0x6
	subccc	%l4,	%i0,	%g2
loop_1495:
	fbu	%fcc0,	loop_1497
loop_1496:
	tpos	%xcc,	0x5
	fnot2s	%f5,	%f4
	edge8l	%l5,	%i7,	%o3
loop_1497:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	stba	%l1,	[%l7 + 0x16] %asi
	edge32l	%i2,	%i6,	%o7
	fmul8ulx16	%f28,	%f26,	%f2
	sllx	%i1,	%o5,	%l6
	umul	%g5,	0x0689,	%g6
	xor	%o6,	0x035A,	%l3
	tgu	%icc,	0x3
	edge8	%i4,	%l2,	%g3
	xor	%o4,	0x1B1D,	%o1
	movcc	%xcc,	%o2,	%i3
	fornot2	%f14,	%f18,	%f16
	bvs	%icc,	loop_1498
	call	loop_1499
	fblg	%fcc1,	loop_1500
	edge16	%g1,	%o0,	%g7
loop_1498:
	fmovsvc	%xcc,	%f3,	%f7
loop_1499:
	fbule,a	%fcc0,	loop_1501
loop_1500:
	edge8	%g4,	%i5,	%l0
	movneg	%icc,	%l4,	%g2
	andcc	%l5,	%i7,	%o3
loop_1501:
	sllx	%l1,	%i2,	%i6
	set	0x20, %i5
	swapa	[%l7 + %i5] 0x11,	%i0
	fbule	%fcc0,	loop_1502
	add	%o7,	0x1EA3,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i1,	%l6,	%g5
loop_1502:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x78] %asi,	%g6
	set	0x70, %l6
	swapa	[%l7 + %l6] 0x80,	%o6
	udivx	%l3,	0x015C,	%l2
	fcmped	%fcc3,	%f28,	%f28
	fmovrdne	%i4,	%f6,	%f24
	stx	%g3,	[%l7 + 0x78]
	fnot2s	%f4,	%f1
	brnz,a	%o1,	loop_1503
	brgz,a	%o2,	loop_1504
	movl	%icc,	%o4,	%i3
	umul	%g1,	%g7,	%g4
loop_1503:
	srax	%i5,	%o0,	%l4
loop_1504:
	mulscc	%g2,	0x04DA,	%l5
	set	0x70, %g2
	stxa	%i7,	[%l7 + %g2] 0x14
	edge16	%o3,	%l0,	%l1
	ta	%icc,	0x7
	tn	%xcc,	0x7
	xnor	%i6,	0x0616,	%i2
	umul	%i0,	0x17A5,	%o7
	fnand	%f28,	%f12,	%f4
	tn	%xcc,	0x6
	mulx	%i1,	0x0657,	%l6
	addc	%o5,	0x1408,	%g6
	fbug	%fcc3,	loop_1505
	fbne,a	%fcc1,	loop_1506
	fbge,a	%fcc0,	loop_1507
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1505:
	fand	%f24,	%f2,	%f16
loop_1506:
	fnot1	%f18,	%f4
loop_1507:
	edge8l	%g5,	%o6,	%l2
	bn,a	%xcc,	loop_1508
	nop
	setx	loop_1509,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcs	%xcc,	0x5
	or	%l3,	0x07EC,	%g3
loop_1508:
	movre	%o1,	%o2,	%o4
loop_1509:
	fnor	%f2,	%f24,	%f18
	addccc	%i4,	%g1,	%i3
	tvs	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x5D] %asi,	%g7
	set	0x68, %l3
	stda	%g4,	[%l7 + %l3] 0x11
	alignaddr	%o0,	%l4,	%i5
	tsubcc	%l5,	%g2,	%o3
	sdivcc	%i7,	0x1B00,	%l0
	fand	%f26,	%f30,	%f20
	xnor	%l1,	0x0C5B,	%i6
	fornot1	%f12,	%f22,	%f16
	edge8	%i2,	%i0,	%i1
	bneg,pn	%xcc,	loop_1510
	addcc	%l6,	%o7,	%o5
	sdivx	%g5,	0x1F6C,	%o6
	edge8l	%g6,	%l2,	%g3
loop_1510:
	edge16ln	%o1,	%o2,	%o4
	set	0x28, %i3
	ldxa	[%l7 + %i3] 0x80,	%l3
	srax	%i4,	%g1,	%g7
	edge8l	%g4,	%i3,	%l4
	fxnors	%f9,	%f6,	%f4
	bne	loop_1511
	fmovdge	%xcc,	%f6,	%f31
	tgu	%icc,	0x3
	fpackfix	%f16,	%f26
loop_1511:
	andcc	%i5,	0x0200,	%o0
	set	0x4B, %o3
	stba	%l5,	[%l7 + %o3] 0xe2
	membar	#Sync
	tsubcctv	%o3,	%i7,	%g2
	movleu	%xcc,	%l1,	%i6
	fmovdge	%xcc,	%f25,	%f31
	fcmpgt16	%f2,	%f18,	%l0
	sir	0x0A5D
	movl	%icc,	%i2,	%i0
	movcs	%xcc,	%i1,	%l6
	edge32n	%o7,	%g5,	%o6
	fbu	%fcc3,	loop_1512
	movneg	%xcc,	%o5,	%l2
	ldd	[%l7 + 0x18],	%f22
	orncc	%g3,	0x1184,	%g6
loop_1512:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x7
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%o1
	udivcc	%o2,	0x0D1A,	%l3
	fmovrdne	%o4,	%f30,	%f18
	fbne,a	%fcc3,	loop_1513
	fmovrslz	%g1,	%f25,	%f18
	set	0x4C, %g5
	sta	%f26,	[%l7 + %g5] 0x10
loop_1513:
	fmovspos	%icc,	%f31,	%f29
	edge8l	%g7,	%i4,	%i3
	xor	%l4,	%i5,	%g4
	fbug,a	%fcc0,	loop_1514
	edge8ln	%l5,	%o3,	%i7
	and	%g2,	%l1,	%o0
	movcc	%icc,	%l0,	%i6
loop_1514:
	movg	%icc,	%i2,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f8
	fbg	%fcc2,	loop_1515
	movne	%xcc,	%l6,	%o7
	taddcctv	%g5,	0x199D,	%o6
	taddcc	%o5,	%l2,	%i1
loop_1515:
	nop
	set	0x20, %i7
	ldstuba	[%l7 + %i7] 0x19,	%g6
	sdivx	%o1,	0x0DD5,	%o2
	tne	%icc,	0x4
	lduh	[%l7 + 0x26],	%g3
	movvc	%xcc,	%l3,	%o4
	orn	%g1,	%i4,	%i3
	ldsh	[%l7 + 0x3A],	%g7
	addccc	%l4,	0x0525,	%i5
	addc	%g4,	0x1C20,	%l5
	be	%xcc,	loop_1516
	fmovrde	%o3,	%f20,	%f0
	ldstub	[%l7 + 0x62],	%g2
	membar	0x5F
loop_1516:
	fba	%fcc3,	loop_1517
	movpos	%xcc,	%i7,	%l1
	sdiv	%l0,	0x1EEB,	%o0
	fblg	%fcc2,	loop_1518
loop_1517:
	orncc	%i6,	0x0C16,	%i2
	addcc	%l6,	0x034E,	%o7
	fmovsa	%xcc,	%f2,	%f19
loop_1518:
	tge	%icc,	0x3
	ta	%icc,	0x4
	subc	%i0,	%g5,	%o6
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x2E] %asi,	%l2
	be,a	loop_1519
	movrlz	%i1,	%g6,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o2
loop_1519:
	movvc	%icc,	%o5,	%l3
	array16	%g3,	%g1,	%i4
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	andn	%g7,	0x06E4,	%l4
	xnor	%i5,	%g4,	%o4
	edge8ln	%o3,	%g2,	%l5
	ta	%icc,	0x1
	andncc	%l1,	%i7,	%o0
	orcc	%l0,	%i6,	%l6
	sethi	0x16CE,	%i2
	andcc	%o7,	%g5,	%i0
	xnor	%l2,	%o6,	%i1
	fmovrdlz	%g6,	%f22,	%f14
	edge8n	%o1,	%o5,	%l3
	fsrc1s	%f17,	%f27
	bvs,a,pn	%xcc,	loop_1520
	edge16l	%g3,	%g1,	%i4
	fmovrdlez	%i3,	%f6,	%f2
	fsrc1	%f6,	%f28
loop_1520:
	andn	%g7,	0x1631,	%l4
	tne	%xcc,	0x6
	tgu	%icc,	0x4
	tpos	%icc,	0x1
	movn	%xcc,	%o2,	%g4
	edge16	%o4,	%i5,	%g2
	fmovdl	%xcc,	%f29,	%f8
	fbuge,a	%fcc0,	loop_1521
	fcmpgt16	%f18,	%f12,	%l5
	nop
	setx loop_1522, %l0, %l1
	jmpl %l1, %o3
	fxors	%f19,	%f16,	%f6
loop_1521:
	fnegd	%f24,	%f30
	nop
	set	0x64, %i4
	lduw	[%l7 + %i4],	%i7
loop_1522:
	udivcc	%o0,	0x1A26,	%l0
	edge16n	%l1,	%i6,	%i2
	set	0x58, %g1
	lduba	[%l7 + %g1] 0x0c,	%o7
	brlz	%g5,	loop_1523
	bne,pt	%xcc,	loop_1524
	array16	%i0,	%l6,	%l2
	movrne	%i1,	0x247,	%g6
loop_1523:
	nop
	set	0x26, %l2
	lduba	[%l7 + %l2] 0x88,	%o6
loop_1524:
	umulcc	%o5,	0x0277,	%o1
	bcc,a,pt	%xcc,	loop_1525
	subcc	%l3,	0x1BBE,	%g1
	edge32n	%i4,	%g3,	%g7
	fmovse	%xcc,	%f5,	%f11
loop_1525:
	edge16ln	%i3,	%o2,	%l4
	fbug	%fcc1,	loop_1526
	fbul	%fcc0,	loop_1527
	fmovdgu	%icc,	%f28,	%f7
	movre	%g4,	%o4,	%g2
loop_1526:
	fcmpne32	%f28,	%f6,	%i5
loop_1527:
	sra	%o3,	0x11,	%l5
	movge	%icc,	%i7,	%l0
	fcmpne16	%f10,	%f18,	%o0
	fmovsn	%icc,	%f9,	%f18
	fmovrsgz	%i6,	%f22,	%f3
	brnz,a	%i2,	loop_1528
	movn	%xcc,	%l1,	%o7
	sdivx	%i0,	0x0AC1,	%g5
	edge32	%l6,	%l2,	%g6
loop_1528:
	fble,a	%fcc0,	loop_1529
	fbn	%fcc1,	loop_1530
	andncc	%i1,	%o6,	%o5
	fabsd	%f12,	%f10
loop_1529:
	nop
	set	0x40, %l1
	prefetcha	[%l7 + %l1] 0x19,	 0x2
loop_1530:
	nop
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%g1
	xnor	%l3,	%i4,	%g7
	smulcc	%i3,	%o2,	%l4
	movrne	%g4,	%g3,	%g2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x68] %asi,	%f21
	movrgz	%o4,	0x08C,	%o3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l5
	edge8l	%i5,	%l0,	%i7
	ldstub	[%l7 + 0x2F],	%o0
	set	0x08, %o4
	lda	[%l7 + %o4] 0x14,	%f5
	tn	%xcc,	0x0
	fmovdn	%xcc,	%f17,	%f13
	tvs	%xcc,	0x7
	andn	%i2,	%i6,	%o7
	tge	%xcc,	0x3
	movcs	%icc,	%i0,	%l1
	fpack32	%f24,	%f0,	%f24
	fbo,a	%fcc0,	loop_1531
	sub	%l6,	0x0BCE,	%l2
	ble,pn	%icc,	loop_1532
	ldx	[%l7 + 0x40],	%g6
loop_1531:
	and	%g5,	%o6,	%i1
	orn	%o5,	0x0807,	%g1
loop_1532:
	edge32	%l3,	%i4,	%o1
	edge32ln	%g7,	%i3,	%l4
	tne	%icc,	0x0
	ld	[%l7 + 0x08],	%f2
	set	0x44, %l4
	swapa	[%l7 + %l4] 0x19,	%o2
	fmovde	%xcc,	%f6,	%f26
	fandnot1	%f8,	%f16,	%f2
	fors	%f31,	%f23,	%f14
	sllx	%g4,	%g3,	%g2
	and	%o4,	0x05DB,	%l5
	alignaddrl	%i5,	%l0,	%i7
	edge16ln	%o0,	%i2,	%i6
	bl,a,pn	%xcc,	loop_1533
	fsrc1s	%f18,	%f8
	andn	%o3,	0x0310,	%o7
	ldub	[%l7 + 0x65],	%l1
loop_1533:
	nop
	setx	loop_1534,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32l	%i0,	%l2,	%g6
	nop
	setx loop_1535, %l0, %l1
	jmpl %l1, %l6
	fnegs	%f15,	%f25
loop_1534:
	tsubcctv	%g5,	0x151A,	%o6
	orncc	%i1,	0x0725,	%g1
loop_1535:
	edge16	%o5,	%i4,	%o1
	ta	%icc,	0x3
	fmovdcc	%xcc,	%f17,	%f2
	udivx	%l3,	0x02C6,	%i3
	edge8ln	%g7,	%l4,	%g4
	movrlz	%g3,	0x144,	%o2
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x70] %asi,	%g2
	sethi	0x188C,	%o4
	movl	%icc,	%l5,	%i5
	set	0x70, %o7
	ldda	[%l7 + %o7] 0x24,	%i6
	membar	0x35
	subc	%l0,	%i2,	%i6
	mova	%xcc,	%o3,	%o7
	movrlez	%l1,	%o0,	%i0
	bvc	%xcc,	loop_1536
	tleu	%xcc,	0x0
	edge8ln	%g6,	%l2,	%g5
	tcs	%icc,	0x6
loop_1536:
	srl	%l6,	0x08,	%o6
	fbn	%fcc0,	loop_1537
	movrne	%i1,	0x31D,	%g1
	add	%i4,	0x0B1C,	%o5
	movcc	%icc,	%o1,	%l3
loop_1537:
	orcc	%g7,	%i3,	%g4
	movvc	%xcc,	%g3,	%o2
	edge16l	%l4,	%g2,	%o4
	fbl,a	%fcc0,	loop_1538
	fxnors	%f30,	%f16,	%f15
	set	0x70, %l5
	stxa	%i5,	[%l7 + %l5] 0x04
loop_1538:
	movcc	%icc,	%i7,	%l0
	srl	%l5,	0x1A,	%i6
	fmovrdgez	%o3,	%f30,	%f0
	ta	%xcc,	0x3
	umulcc	%o7,	%i2,	%l1
	brgez	%o0,	loop_1539
	bvc,pt	%icc,	loop_1540
	fnegs	%f16,	%f16
	fmul8sux16	%f28,	%f14,	%f2
loop_1539:
	nop
	wr	%g0,	0x22,	%asi
	stda	%i0,	[%l7 + 0x08] %asi
	membar	#Sync
loop_1540:
	subccc	%g6,	0x084B,	%l2
	udivx	%g5,	0x0FB4,	%o6
	fbn,a	%fcc0,	loop_1541
	fmovsleu	%icc,	%f8,	%f4
	movrne	%i1,	%g1,	%i4
	fmovdcs	%xcc,	%f12,	%f8
loop_1541:
	edge16	%o5,	%l6,	%o1
	fnands	%f23,	%f16,	%f29
	fcmpne32	%f18,	%f18,	%l3
	fbule	%fcc3,	loop_1542
	tneg	%xcc,	0x7
	nop
	set	0x60, %o6
	stx	%i3,	[%l7 + %o6]
	smulcc	%g4,	%g7,	%o2
loop_1542:
	fmul8ulx16	%f8,	%f10,	%f14
	fba	%fcc1,	loop_1543
	edge16	%g3,	%l4,	%o4
	xorcc	%i5,	0x1084,	%g2
	call	loop_1544
loop_1543:
	tcs	%xcc,	0x7
	movrne	%i7,	0x26D,	%l0
	srax	%i6,	0x06,	%o3
loop_1544:
	fmovsge	%icc,	%f6,	%f0
	fblg,a	%fcc0,	loop_1545
	tge	%icc,	0x2
	addc	%o7,	0x0351,	%l5
	wr	%g0,	0x10,	%asi
	stha	%l1,	[%l7 + 0x52] %asi
loop_1545:
	popc	%o0,	%i2
	st	%f19,	[%l7 + 0x5C]
	fmovrsne	%i0,	%f7,	%f31
	fmovsle	%icc,	%f19,	%f26
	fbuge,a	%fcc0,	loop_1546
	ta	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x56] %asi,	%g6
loop_1546:
	fcmpgt16	%f16,	%f10,	%g5
	fxors	%f16,	%f25,	%f22
	bshuffle	%f28,	%f28,	%f24
	fmovdl	%icc,	%f6,	%f27
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%o6,	0x12,	%l2
	sdivx	%i1,	0x163B,	%g1
	sdivx	%o5,	0x0CE8,	%i4
	movpos	%xcc,	%o1,	%l6
	move	%xcc,	%l3,	%g4
	tge	%icc,	0x4
	fpack16	%f20,	%f9
	prefetch	[%l7 + 0x18],	 0x2
	for	%f26,	%f24,	%f8
	fmovdn	%icc,	%f24,	%f22
	addc	%g7,	%i3,	%o2
	nop
	set	0x28, %g7
	stx	%l4,	[%l7 + %g7]
	movcc	%xcc,	%o4,	%g3
	fmovrslez	%i5,	%f10,	%f28
	ble	%xcc,	loop_1547
	fcmpeq32	%f12,	%f2,	%g2
	fsrc2	%f18,	%f6
	movrlz	%i7,	%i6,	%o3
loop_1547:
	fnegs	%f4,	%f14
	fmovsvc	%xcc,	%f2,	%f5
	fsrc2	%f6,	%f8
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x18] %asi,	%l0
	sub	%o7,	%l5,	%l1
	tsubcctv	%o0,	0x1B24,	%i0
	array8	%g6,	%i2,	%o6
	andn	%l2,	%i1,	%g1
	andn	%o5,	0x1876,	%i4
	fcmpne16	%f10,	%f18,	%o1
	fpmerge	%f5,	%f25,	%f24
	fmovdneg	%xcc,	%f17,	%f18
	edge8	%g5,	%l6,	%l3
	ble,a	loop_1548
	fmovrse	%g4,	%f1,	%f5
	mulscc	%g7,	%i3,	%l4
	fpsub32s	%f22,	%f21,	%f31
loop_1548:
	fmovrsgez	%o4,	%f1,	%f19
	set	0x43, %i6
	lduba	[%l7 + %i6] 0x18,	%g3
	movrgez	%i5,	%g2,	%i7
	fmovrslez	%o2,	%f2,	%f1
	srax	%o3,	%i6,	%l0
	tle	%icc,	0x2
	sir	0x1925
	fmovsn	%xcc,	%f31,	%f15
	fornot1	%f30,	%f18,	%f24
	addccc	%l5,	%l1,	%o7
	tne	%xcc,	0x5
	tneg	%xcc,	0x2
	movneg	%xcc,	%i0,	%o0
	set	0x3A, %i2
	ldstuba	[%l7 + %i2] 0x89,	%i2
	udivcc	%g6,	0x06FE,	%l2
	bcc,a	loop_1549
	bge,pn	%icc,	loop_1550
	ta	%icc,	0x2
	movge	%icc,	%o6,	%i1
loop_1549:
	fbg	%fcc1,	loop_1551
loop_1550:
	membar	0x62
	fmovs	%f2,	%f5
	subc	%g1,	%o5,	%o1
loop_1551:
	srlx	%g5,	%l6,	%i4
	and	%g4,	%l3,	%g7
	lduh	[%l7 + 0x30],	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	stba	%l4,	[%l7 + 0x72] %asi
	flush	%l7 + 0x5C
	fmul8x16	%f14,	%f10,	%f2
	orcc	%o4,	%g3,	%i5
	tn	%icc,	0x7
	tge	%icc,	0x1
	sllx	%g2,	0x17,	%i7
	popc	%o3,	%i6
	tcs	%icc,	0x2
	addccc	%o2,	%l5,	%l0
	movg	%xcc,	%o7,	%i0
	taddcc	%o0,	0x0557,	%i2
	fandnot2s	%f7,	%f5,	%f17
	bcs,a,pn	%icc,	loop_1552
	membar	0x34
	movcc	%xcc,	%l1,	%g6
	sir	0x060B
loop_1552:
	movle	%xcc,	%l2,	%o6
	movrlez	%g1,	%i1,	%o5
	bvs,a,pn	%icc,	loop_1553
	edge8	%o1,	%l6,	%i4
	udivx	%g4,	0x0467,	%g5
	movge	%xcc,	%g7,	%l3
loop_1553:
	mulscc	%l4,	0x1C01,	%o4
	sdiv	%i3,	0x0959,	%g3
	edge16l	%i5,	%i7,	%g2
	movre	%o3,	0x182,	%o2
	udivcc	%l5,	0x14DF,	%i6
	popc	%l0,	%i0
	move	%icc,	%o0,	%o7
	ba,pn	%icc,	loop_1554
	fornot2	%f18,	%f10,	%f2
	array16	%i2,	%g6,	%l2
	ld	[%l7 + 0x08],	%f7
loop_1554:
	tvc	%xcc,	0x6
	sll	%l1,	%g1,	%i1
	fmovsle	%icc,	%f24,	%f24
	fornot1	%f22,	%f22,	%f16
	fmul8sux16	%f30,	%f8,	%f6
	edge16ln	%o5,	%o6,	%l6
	sdiv	%i4,	0x15C3,	%o1
	edge16	%g5,	%g7,	%g4
	srl	%l3,	0x05,	%l4
	add	%i3,	0x0ECF,	%o4
	std	%f22,	[%l7 + 0x68]
	swap	[%l7 + 0x38],	%i5
	and	%i7,	%g2,	%o3
	fmovsne	%icc,	%f21,	%f4
	udiv	%g3,	0x0DC2,	%o2
	movpos	%icc,	%l5,	%i6
	bcc,a	%xcc,	loop_1555
	addcc	%l0,	0x016A,	%o0
	tl	%icc,	0x3
	ldd	[%l7 + 0x20],	%i0
loop_1555:
	tneg	%icc,	0x2
	movneg	%icc,	%i2,	%g6
	alignaddrl	%o7,	%l2,	%l1
	brgez	%g1,	loop_1556
	xor	%o5,	%i1,	%l6
	popc	%o6,	%o1
	brnz,a	%g5,	loop_1557
loop_1556:
	subc	%g7,	0x03C4,	%i4
	umul	%l3,	0x1DEF,	%l4
	or	%i3,	0x00D6,	%o4
loop_1557:
	xorcc	%i5,	%g4,	%g2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o3,	%i7
	edge32	%g3,	%o2,	%l5
	add	%l0,	0x0F99,	%i6
	prefetch	[%l7 + 0x24],	 0x0
	smulcc	%o0,	0x147D,	%i2
	fmovrdgez	%i0,	%f14,	%f18
	edge32l	%o7,	%l2,	%l1
	fpack16	%f4,	%f16
	tcc	%icc,	0x0
	fmovd	%f18,	%f16
	membar	0x0A
	srl	%g6,	0x1A,	%o5
	sdivcc	%i1,	0x1B64,	%g1
	fbe,a	%fcc0,	loop_1558
	fors	%f11,	%f3,	%f14
	array8	%l6,	%o1,	%g5
	movg	%icc,	%g7,	%o6
loop_1558:
	fbul,a	%fcc2,	loop_1559
	bn,a	loop_1560
	fcmpes	%fcc1,	%f14,	%f14
	bgu	%icc,	loop_1561
loop_1559:
	bgu,pn	%icc,	loop_1562
loop_1560:
	tle	%xcc,	0x2
	subcc	%i4,	%l4,	%l3
loop_1561:
	umul	%i3,	0x1FCF,	%o4
loop_1562:
	tl	%xcc,	0x5
	nop
	setx loop_1563, %l0, %l1
	jmpl %l1, %g4
	fandnot2s	%f23,	%f21,	%f16
	tgu	%xcc,	0x5
	andcc	%i5,	0x17E5,	%o3
loop_1563:
	brgez,a	%i7,	loop_1564
	mulscc	%g2,	%g3,	%l5
	bl	%xcc,	loop_1565
	and	%o2,	%i6,	%o0
loop_1564:
	movvs	%icc,	%l0,	%i0
	movrne	%o7,	0x244,	%l2
loop_1565:
	fands	%f27,	%f12,	%f23
	movcc	%icc,	%l1,	%g6
	fba	%fcc3,	loop_1566
	srl	%o5,	0x06,	%i1
	set	0x2C, %l0
	ldsha	[%l7 + %l0] 0x15,	%g1
loop_1566:
	edge16l	%i2,	%o1,	%g5
	nop
	set	0x30, %g4
	ldx	[%l7 + %g4],	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l6,	%o6
	movvc	%xcc,	%i4,	%l3
	sll	%l4,	0x07,	%o4
	movne	%icc,	%i3,	%g4
	swap	[%l7 + 0x08],	%i5
	add	%i7,	0x1485,	%g2
	set	0x62, %g6
	ldstuba	[%l7 + %g6] 0x19,	%o3
	array32	%g3,	%l5,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x78
	edge16	%o2,	%l0,	%i0
	srax	%o0,	%l2,	%o7
	stw	%g6,	[%l7 + 0x5C]
	edge32l	%l1,	%o5,	%i1
	fmovsneg	%icc,	%f16,	%f5
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x68] %asi,	%i2
	set	0x75, %o0
	lduba	[%l7 + %o0] 0x0c,	%g1
	andcc	%o1,	0x07D2,	%g7
	movrgez	%l6,	0x2B0,	%g5
	subccc	%o6,	%l3,	%i4
	movre	%l4,	0x014,	%i3
	tleu	%icc,	0x0
	alignaddrl	%g4,	%i5,	%i7
	edge16n	%o4,	%o3,	%g3
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x40] %asi,	%g2
	set	0x48, %o2
	ldstuba	[%l7 + %o2] 0x80,	%l5
	sethi	0x10FC,	%o2
	sdivcc	%l0,	0x12E3,	%i0
	brlez	%o0,	loop_1567
	nop
	set	0x0A, %i0
	ldsb	[%l7 + %i0],	%l2
	xnor	%i6,	%g6,	%o7
	fbuge	%fcc3,	loop_1568
loop_1567:
	smulcc	%l1,	%i1,	%o5
	fornot1s	%f28,	%f1,	%f7
	ldx	[%l7 + 0x18],	%i2
loop_1568:
	fmovdne	%icc,	%f11,	%f10
	fbl	%fcc0,	loop_1569
	tcs	%xcc,	0x1
	mulscc	%o1,	%g7,	%g1
	subcc	%g5,	0x0B18,	%l6
loop_1569:
	fbul,a	%fcc0,	loop_1570
	ta	%icc,	0x5
	membar	0x61
	stx	%o6,	[%l7 + 0x70]
loop_1570:
	tge	%icc,	0x2
	be,a,pn	%xcc,	loop_1571
	xor	%l3,	%i4,	%i3
	set	0x72, %o5
	ldsha	[%l7 + %o5] 0x0c,	%g4
loop_1571:
	xnorcc	%l4,	%i7,	%i5
	sdivx	%o3,	0x14EA,	%o4
	fxnors	%f23,	%f19,	%f7
	tsubcctv	%g2,	0x0AE7,	%g3
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%l5
	fmovscs	%xcc,	%f0,	%f23
	fblg	%fcc1,	loop_1572
	fbuge	%fcc3,	loop_1573
	tn	%xcc,	0x3
	tgu	%icc,	0x7
loop_1572:
	fmovrslz	%l0,	%f26,	%f15
loop_1573:
	sdivcc	%i0,	0x15E6,	%o0
	smulcc	%i6,	0x0F99,	%g6
	srlx	%o7,	0x05,	%l2
	edge8	%i1,	%l1,	%i2
	movneg	%xcc,	%o1,	%g7
	smulcc	%g1,	0x1E1F,	%g5
	fornot2s	%f13,	%f21,	%f23
	tvc	%xcc,	0x5
	array8	%l6,	%o5,	%o6
	set	0x5E, %i1
	ldsba	[%l7 + %i1] 0x11,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%icc,	0x3
	membar	0x16
	or	%i4,	%i3,	%l4
	udivx	%g4,	0x0AF1,	%i7
	sub	%o3,	%o4,	%i5
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
	add	%o2,	0x0CA9,	%g3
	fmovrdgez	%l5,	%f16,	%f8
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x35] %asi,	%l0
	fble	%fcc2,	loop_1574
	fbuge,a	%fcc2,	loop_1575
	xor	%i0,	%i6,	%g6
	brz,a	%o0,	loop_1576
loop_1574:
	stb	%l2,	[%l7 + 0x48]
loop_1575:
	edge16ln	%o7,	%i1,	%i2
	fmovdne	%xcc,	%f12,	%f11
loop_1576:
	fmovrsgez	%l1,	%f27,	%f22
	sll	%o1,	0x01,	%g1
	tn	%icc,	0x0
	mulscc	%g7,	%g5,	%l6
	fbuge,a	%fcc1,	loop_1577
	fmovsneg	%icc,	%f29,	%f12
	fxors	%f7,	%f30,	%f30
	umulcc	%o5,	0x110A,	%l3
loop_1577:
	udiv	%i4,	0x1B35,	%o6
	bn,a,pt	%icc,	loop_1578
	tpos	%icc,	0x3
	set	0x20, %o1
	stha	%i3,	[%l7 + %o1] 0x27
	membar	#Sync
loop_1578:
	fpadd32	%f20,	%f12,	%f2
	movrgz	%g4,	%l4,	%o3
	bpos,pt	%xcc,	loop_1579
	bge,a,pn	%xcc,	loop_1580
	fbue,a	%fcc0,	loop_1581
	fmovdpos	%xcc,	%f8,	%f12
loop_1579:
	fmovscc	%icc,	%f7,	%f16
loop_1580:
	fnot2s	%f24,	%f5
loop_1581:
	tcc	%xcc,	0x3
	swap	[%l7 + 0x60],	%i7
	movrgz	%i5,	0x0D6,	%o4
	tleu	%xcc,	0x3
	movvs	%icc,	%g2,	%o2
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x78] %asi,	%l5
	fsrc1s	%f5,	%f3
	fmovsn	%icc,	%f7,	%f3
	set	0x4C, %g3
	ldsba	[%l7 + %g3] 0x80,	%l0
	tvc	%icc,	0x6
	fpadd16s	%f20,	%f13,	%f16
	fsrc2s	%f27,	%f22
	tvc	%icc,	0x5
	movn	%xcc,	%g3,	%i6
	array16	%g6,	%o0,	%i0
	fmovdvc	%xcc,	%f11,	%f31
	movle	%icc,	%l2,	%i1
	ba,a,pn	%xcc,	loop_1582
	fba,a	%fcc1,	loop_1583
	subcc	%o7,	0x0C7C,	%i2
	movrlez	%o1,	%g1,	%l1
loop_1582:
	call	loop_1584
loop_1583:
	taddcctv	%g5,	%l6,	%o5
	fnot1	%f16,	%f6
	movrlz	%g7,	%i4,	%l3
loop_1584:
	fbule,a	%fcc0,	loop_1585
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o6,	0x1F60,	%i3
	fcmpgt16	%f28,	%f12,	%g4
loop_1585:
	movrlz	%l4,	%o3,	%i7
	edge8ln	%o4,	%i5,	%g2
	movcs	%xcc,	%o2,	%l5
	xnorcc	%g3,	%i6,	%g6
	sra	%o0,	0x1E,	%i0
	brlez,a	%l2,	loop_1586
	bl,a	%xcc,	loop_1587
	srax	%i1,	%o7,	%i2
	stbar
loop_1586:
	movvs	%xcc,	%o1,	%g1
loop_1587:
	movcs	%xcc,	%l1,	%l0
	array8	%g5,	%l6,	%g7
	addcc	%o5,	0x0127,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x0
	sdivx	%o6,	0x1164,	%i3
	fbg,a	%fcc1,	loop_1588
	andcc	%i4,	%g4,	%o3
	nop
	setx loop_1589, %l0, %l1
	jmpl %l1, %i7
	stx	%o4,	[%l7 + 0x68]
loop_1588:
	movrlez	%l4,	%i5,	%o2
	mova	%icc,	%l5,	%g2
loop_1589:
	bleu	loop_1590
	sdivcc	%i6,	0x1EF0,	%g6
	tg	%xcc,	0x3
	for	%f4,	%f0,	%f28
loop_1590:
	movneg	%icc,	%g3,	%o0
	fbge,a	%fcc3,	loop_1591
	ba,pt	%icc,	loop_1592
	stb	%l2,	[%l7 + 0x31]
	fbn,a	%fcc3,	loop_1593
loop_1591:
	fmovdleu	%icc,	%f7,	%f15
loop_1592:
	fbl	%fcc1,	loop_1594
	sllx	%i1,	0x11,	%i0
loop_1593:
	bneg,a,pn	%icc,	loop_1595
	fmovdn	%xcc,	%f17,	%f11
loop_1594:
	te	%xcc,	0x4
	movleu	%icc,	%o7,	%o1
loop_1595:
	tneg	%icc,	0x7
	fble	%fcc0,	loop_1596
	sdiv	%g1,	0x191C,	%l1
	stx	%l0,	[%l7 + 0x10]
	fxnors	%f2,	%f5,	%f0
loop_1596:
	fpadd16	%f18,	%f10,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i2,	0x06D,	%l6
	edge32l	%g5,	%g7,	%l3
	bleu,pn	%icc,	loop_1597
	srl	%o5,	%i3,	%o6
	udiv	%i4,	0x0194,	%g4
	tge	%icc,	0x3
loop_1597:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f0,	[%l7 + 0x34] %asi
	fbne	%fcc3,	loop_1598
	bvc	%xcc,	loop_1599
	taddcctv	%o3,	%o4,	%i7
	bvc,pn	%icc,	loop_1600
loop_1598:
	fzeros	%f10
loop_1599:
	bshuffle	%f14,	%f30,	%f22
	movrlez	%i5,	%l4,	%o2
loop_1600:
	movrlz	%g2,	0x3AB,	%l5
	fmovdne	%icc,	%f11,	%f10
	bcc,a,pt	%icc,	loop_1601
	tvc	%xcc,	0x3
	srax	%i6,	0x07,	%g3
	taddcctv	%o0,	%l2,	%i1
loop_1601:
	edge8n	%i0,	%o7,	%o1
	smul	%g6,	%l1,	%l0
	brlez,a	%g1,	loop_1602
	fsrc2s	%f2,	%f29
	ldstub	[%l7 + 0x77],	%i2
	edge8l	%g5,	%g7,	%l3
loop_1602:
	movvc	%xcc,	%l6,	%i3
	fnot2s	%f4,	%f29
	fcmped	%fcc1,	%f16,	%f6
	xor	%o6,	0x13AB,	%i4
	movrgz	%o5,	0x2EF,	%o3
	movrlz	%g4,	%o4,	%i5
	mova	%xcc,	%i7,	%l4
	tpos	%icc,	0x5
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x64] %asi,	%o2
	fbn,a	%fcc0,	loop_1603
	add	%l5,	%i6,	%g3
	subc	%g2,	0x0726,	%l2
	fnands	%f7,	%f6,	%f23
loop_1603:
	movrgez	%o0,	%i1,	%i0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%g6
	movre	%o7,	0x154,	%l0
	movrgz	%g1,	%l1,	%g5
	membar	0x49
	fxor	%f28,	%f26,	%f0
	sir	0x0514
	tl	%icc,	0x5
	bpos,a	loop_1604
	fcmpes	%fcc2,	%f20,	%f22
	movge	%icc,	%i2,	%g7
	sll	%l6,	%l3,	%o6
loop_1604:
	fmovsg	%xcc,	%f17,	%f5
	tge	%icc,	0x0
	bpos,a	loop_1605
	tvc	%xcc,	0x5
	fpack16	%f26,	%f2
	xorcc	%i3,	%o5,	%i4
loop_1605:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x62] %asi,	%g4
	udivx	%o4,	0x08FF,	%o3
	fblg	%fcc0,	loop_1606
	fandnot2	%f24,	%f30,	%f26
	fnot2s	%f31,	%f9
	sir	0x0B9A
loop_1606:
	addc	%i5,	0x051F,	%i7
	fbl	%fcc1,	loop_1607
	smul	%o2,	%l4,	%l5
	sir	0x0336
	set	0x24, %l6
	ldsha	[%l7 + %l6] 0x11,	%g3
loop_1607:
	edge16	%i6,	%g2,	%l2
	stx	%o0,	[%l7 + 0x60]
	srl	%i0,	%o1,	%i1
	array8	%o7,	%g6,	%l0
	bg,pt	%xcc,	loop_1608
	ble,a,pn	%icc,	loop_1609
	tvc	%icc,	0x2
	xor	%l1,	%g1,	%g5
loop_1608:
	fmovrdlz	%i2,	%f6,	%f12
loop_1609:
	fnot2	%f12,	%f24
	umul	%l6,	0x0DEA,	%l3
	and	%o6,	%i3,	%g7
	tl	%icc,	0x5
	fmovdvc	%icc,	%f20,	%f16
	tl	%icc,	0x0
	sra	%o5,	%g4,	%o4
	addccc	%i4,	0x1ED1,	%o3
	addcc	%i7,	0x0282,	%o2
	sethi	0x1F86,	%l4
	addccc	%l5,	0x1AD3,	%i5
	fcmpne16	%f6,	%f8,	%g3
	xnorcc	%g2,	0x0809,	%i6
	set	0x5C, %g2
	lda	[%l7 + %g2] 0x15,	%f24
	fmul8sux16	%f30,	%f4,	%f10
	movn	%icc,	%l2,	%o0
	fmovrdne	%o1,	%f10,	%f6
	and	%i1,	%o7,	%g6
	xorcc	%l0,	0x15E2,	%l1
	bcc,a,pt	%xcc,	loop_1610
	tg	%xcc,	0x0
	tg	%xcc,	0x7
	fbug	%fcc1,	loop_1611
loop_1610:
	bleu,pn	%icc,	loop_1612
	fbug,a	%fcc1,	loop_1613
	bleu,a	loop_1614
loop_1611:
	bcc,a	loop_1615
loop_1612:
	movcc	%xcc,	%g1,	%g5
loop_1613:
	fble,a	%fcc3,	loop_1616
loop_1614:
	subcc	%i2,	%l6,	%l3
loop_1615:
	mulscc	%o6,	%i0,	%g7
	ldstub	[%l7 + 0x3E],	%i3
loop_1616:
	addc	%o5,	0x0696,	%o4
	ta	%icc,	0x7
	sth	%i4,	[%l7 + 0x66]
	fcmple32	%f4,	%f28,	%g4
	tneg	%icc,	0x5
	fands	%f6,	%f4,	%f12
	udiv	%o3,	0x00DA,	%o2
	set	0x50, %l3
	ldsha	[%l7 + %l3] 0x14,	%i7
	sdivx	%l4,	0x19A3,	%i5
	array16	%l5,	%g2,	%g3
	movle	%icc,	%i6,	%o0
	tge	%xcc,	0x4
	fxor	%f18,	%f24,	%f2
	fors	%f28,	%f4,	%f14
	umulcc	%o1,	0x1C55,	%l2
	fpmerge	%f12,	%f13,	%f4
	fpsub16s	%f1,	%f2,	%f23
	tneg	%icc,	0x7
	bg,a,pn	%xcc,	loop_1617
	edge32l	%o7,	%g6,	%i1
	tl	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1617:
	fbug,a	%fcc0,	loop_1618
	alignaddrl	%l1,	%g1,	%g5
	fcmple32	%f8,	%f16,	%i2
	wr	%g0,	0x27,	%asi
	stxa	%l0,	[%l7 + 0x38] %asi
	membar	#Sync
loop_1618:
	andcc	%l3,	0x0506,	%o6
	fmovrsgez	%i0,	%f12,	%f6
	movrgez	%l6,	0x13A,	%g7
	sethi	0x07CB,	%o5
	smul	%i3,	%i4,	%o4
	sdivcc	%o3,	0x1F22,	%o2
	udivcc	%g4,	0x0108,	%l4
	mulscc	%i5,	%i7,	%g2
	sra	%l5,	0x18,	%i6
	set	0x44, %i3
	ldswa	[%l7 + %i3] 0x14,	%g3
	subccc	%o0,	0x1CA2,	%o1
	xorcc	%l2,	%g6,	%o7
	membar	0x45
	sub	%i1,	0x0F50,	%g1
	fbue,a	%fcc2,	loop_1619
	andn	%l1,	0x1CB4,	%g5
	movrlez	%l0,	0x15F,	%l3
	ba,a,pn	%icc,	loop_1620
loop_1619:
	edge32l	%o6,	%i0,	%l6
	alignaddrl	%g7,	%o5,	%i2
	fmovdcs	%xcc,	%f25,	%f8
loop_1620:
	movvc	%xcc,	%i3,	%i4
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fxor	%f30,	%f28,	%f14
	alignaddrl	%o3,	%o4,	%g4
	move	%icc,	%l4,	%o2
	umul	%i5,	%i7,	%l5
	or	%g2,	%i6,	%g3
	fmovrdgz	%o1,	%f12,	%f18
	udiv	%l2,	0x0E78,	%g6
	array16	%o0,	%i1,	%o7
	set	0x70, %o3
	ldda	[%l7 + %o3] 0x2c,	%l0
	umulcc	%g1,	0x0B56,	%g5
	edge32n	%l3,	%o6,	%i0
	nop
	setx	loop_1621,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivcc	%l0,	0x1E9E,	%g7
	array16	%o5,	%i2,	%l6
	fsrc2	%f24,	%f28
loop_1621:
	brz,a	%i3,	loop_1622
	tvc	%icc,	0x4
	ldstub	[%l7 + 0x2A],	%i4
	tge	%xcc,	0x5
loop_1622:
	andn	%o4,	%o3,	%g4
	mulx	%l4,	%o2,	%i5
	srlx	%l5,	%g2,	%i7
	brgz,a	%g3,	loop_1623
	edge8n	%o1,	%i6,	%l2
	movn	%xcc,	%o0,	%i1
	set	0x34, %g5
	sta	%f19,	[%l7 + %g5] 0x81
loop_1623:
	subccc	%o7,	0x0A65,	%g6
	bleu,a	%xcc,	loop_1624
	srlx	%l1,	%g1,	%g5
	mulscc	%l3,	%i0,	%l0
	movl	%icc,	%o6,	%g7
loop_1624:
	orcc	%i2,	%l6,	%i3
	sdivcc	%o5,	0x0E75,	%o4
	fandnot1s	%f18,	%f22,	%f6
	addcc	%i4,	0x0D7F,	%o3
	subccc	%g4,	%o2,	%l4
	fpadd32s	%f31,	%f8,	%f11
	fmovda	%icc,	%f10,	%f15
	fmovdleu	%icc,	%f26,	%f26
	fxor	%f22,	%f16,	%f24
	bpos,pn	%xcc,	loop_1625
	movge	%xcc,	%i5,	%l5
	edge16n	%i7,	%g3,	%o1
	udivx	%g2,	0x1E18,	%i6
loop_1625:
	tsubcctv	%l2,	%o0,	%o7
	edge32l	%g6,	%i1,	%l1
	fbul	%fcc2,	loop_1626
	fmovdneg	%xcc,	%f16,	%f31
	nop
	set	0x28, %i7
	std	%f4,	[%l7 + %i7]
	fsrc2	%f6,	%f4
loop_1626:
	nop
	set	0x43, %i5
	ldstub	[%l7 + %i5],	%g1
	fmuld8sux16	%f5,	%f4,	%f4
	tne	%icc,	0x7
	bcs,pt	%icc,	loop_1627
	sdivx	%g5,	0x1078,	%l3
	tsubcctv	%i0,	%o6,	%g7
	popc	%l0,	%l6
loop_1627:
	movle	%icc,	%i3,	%i2
	fmovdle	%xcc,	%f14,	%f11
	fmovdvs	%icc,	%f12,	%f23
	set	0x28, %i4
	stxa	%o5,	[%l7 + %i4] 0xe3
	membar	#Sync
	fmovdleu	%xcc,	%f28,	%f20
	xor	%i4,	%o3,	%o4
	fmovsle	%icc,	%f1,	%f1
	movcs	%xcc,	%o2,	%l4
	or	%i5,	%l5,	%g4
	move	%icc,	%i7,	%g3
	fmovde	%icc,	%f15,	%f29
	popc	%g2,	%i6
	fbug,a	%fcc0,	loop_1628
	fmovsl	%xcc,	%f19,	%f4
	sdivx	%o1,	0x1A4C,	%o0
	addcc	%l2,	0x0EDB,	%g6
loop_1628:
	sra	%o7,	%l1,	%g1
	ta	%xcc,	0x2
	andcc	%i1,	0x1E01,	%g5
	fbn,a	%fcc1,	loop_1629
	fmul8x16	%f19,	%f4,	%f16
	movleu	%xcc,	%l3,	%i0
	mulscc	%o6,	%g7,	%l0
loop_1629:
	nop
	set	0x50, %g1
	lda	[%l7 + %g1] 0x0c,	%f3
	subcc	%i3,	0x0925,	%i2
	udiv	%o5,	0x1F59,	%i4
	tcc	%xcc,	0x3
	edge32ln	%l6,	%o3,	%o2
	bvs,a	loop_1630
	alignaddrl	%l4,	%o4,	%l5
	xnor	%g4,	%i7,	%g3
	wr	%g0,	0x80,	%asi
	sta	%f4,	[%l7 + 0x44] %asi
loop_1630:
	tcc	%icc,	0x4
	edge32n	%i5,	%i6,	%o1
	fmovdn	%icc,	%f13,	%f16
	movre	%g2,	%o0,	%l2
	tne	%xcc,	0x3
	umul	%o7,	%g6,	%g1
	tl	%xcc,	0x0
	tcc	%icc,	0x5
	smul	%i1,	%l1,	%g5
	tge	%xcc,	0x1
	sdivx	%i0,	0x18DA,	%l3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x14] %asi,	%f1
	udivx	%g7,	0x0E3B,	%l0
	movgu	%icc,	%i3,	%i2
	set	0x70, %l2
	stwa	%o6,	[%l7 + %l2] 0xea
	membar	#Sync
	fmovdl	%icc,	%f17,	%f13
	fbule,a	%fcc1,	loop_1631
	udivx	%o5,	0x096D,	%l6
	orn	%i4,	0x0FFC,	%o3
	movcs	%xcc,	%o2,	%o4
loop_1631:
	xorcc	%l4,	%l5,	%i7
	and	%g4,	0x0F80,	%g3
	bge	%icc,	loop_1632
	fpsub32s	%f28,	%f31,	%f11
	ba,a,pt	%icc,	loop_1633
	fandnot2s	%f15,	%f18,	%f10
loop_1632:
	nop
	wr	%g0,	0x18,	%asi
	sta	%f8,	[%l7 + 0x68] %asi
loop_1633:
	orcc	%i6,	0x123A,	%o1
	fmul8x16al	%f0,	%f29,	%f10
	sdivcc	%g2,	0x061A,	%o0
	tneg	%icc,	0x6
	set	0x20, %o4
	lduha	[%l7 + %o4] 0x80,	%i5
	nop
	set	0x0C, %l4
	sth	%l2,	[%l7 + %l4]
	and	%g6,	0x1034,	%o7
	fnot1	%f4,	%f30
	edge16n	%g1,	%l1,	%g5
	fbn,a	%fcc3,	loop_1634
	edge16ln	%i0,	%l3,	%g7
	bvs,a,pn	%icc,	loop_1635
	sdivx	%l0,	0x146C,	%i1
loop_1634:
	and	%i2,	0x1FC1,	%o6
	sll	%o5,	0x1C,	%i3
loop_1635:
	tsubcc	%i4,	%l6,	%o3
	movne	%icc,	%o4,	%l4
	add	%o2,	0x0E4D,	%l5
	movvc	%xcc,	%i7,	%g3
	movpos	%icc,	%i6,	%o1
	movrne	%g4,	%g2,	%i5
	srl	%o0,	%l2,	%g6
	movpos	%xcc,	%g1,	%o7
	alignaddrl	%g5,	%i0,	%l3
	fxnor	%f22,	%f18,	%f6
	edge8ln	%g7,	%l0,	%l1
	mulscc	%i1,	%i2,	%o6
	set	0x1C, %l1
	lduba	[%l7 + %l1] 0x11,	%o5
	bneg,pt	%xcc,	loop_1636
	edge32ln	%i3,	%l6,	%o3
	tvs	%xcc,	0x3
	udivx	%o4,	0x0759,	%l4
loop_1636:
	movg	%xcc,	%i4,	%o2
	brgz	%i7,	loop_1637
	xnorcc	%l5,	0x18F9,	%g3
	popc	%o1,	%g4
	andn	%g2,	%i6,	%i5
loop_1637:
	andcc	%o0,	0x1E6E,	%l2
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x30] %asi,	%g6
	srl	%o7,	%g5,	%i0
	tgu	%xcc,	0x0
	movge	%icc,	%g1,	%g7
	fcmpd	%fcc2,	%f8,	%f2
	srlx	%l0,	0x1A,	%l3
	and	%l1,	0x1B98,	%i2
	lduh	[%l7 + 0x52],	%o6
	or	%i1,	%i3,	%l6
	fmovsa	%icc,	%f30,	%f1
	fors	%f10,	%f19,	%f27
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o5,	%o3
	movrgez	%o4,	0x01F,	%i4
	alignaddrl	%o2,	%l4,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l5,	%g3,	%g4
	fnegs	%f31,	%f7
	tn	%xcc,	0x7
	xnor	%o1,	0x1F84,	%g2
	subcc	%i5,	0x0028,	%i6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o0,	%l2
	fandnot1s	%f15,	%f29,	%f12
	set	0x20, %o7
	stxa	%o7,	[%l7 + %o7] 0xea
	membar	#Sync
	fpadd32	%f18,	%f10,	%f10
	set	0x70, %o6
	stda	%g6,	[%l7 + %o6] 0x80
	call	loop_1638
	movneg	%xcc,	%i0,	%g1
	edge8l	%g7,	%g5,	%l3
	movrgz	%l1,	%i2,	%o6
loop_1638:
	udivcc	%l0,	0x0BBB,	%i1
	edge8ln	%l6,	%o5,	%o3
	fmul8sux16	%f0,	%f6,	%f26
	or	%o4,	%i4,	%i3
	edge32	%o2,	%i7,	%l4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%l5,	%g4
	orncc	%g3,	%g2,	%i5
	tl	%xcc,	0x4
	subccc	%i6,	%o1,	%l2
	fmovda	%xcc,	%f8,	%f15
	edge16n	%o0,	%g6,	%i0
	tl	%xcc,	0x1
	bvs,pt	%xcc,	loop_1639
	movleu	%xcc,	%g1,	%g7
	fpadd16	%f10,	%f4,	%f12
	fcmpgt16	%f4,	%f14,	%g5
loop_1639:
	ldd	[%l7 + 0x08],	%f26
	udivcc	%o7,	0x1715,	%l3
	andn	%l1,	0x03AB,	%i2
	brlz	%o6,	loop_1640
	movgu	%icc,	%i1,	%l6
	sdivx	%o5,	0x11F9,	%o3
	udiv	%l0,	0x15BD,	%o4
loop_1640:
	tn	%icc,	0x1
	ld	[%l7 + 0x40],	%f5
	edge8n	%i3,	%o2,	%i7
	tleu	%icc,	0x6
	alignaddrl	%l4,	%l5,	%i4
	fbug	%fcc3,	loop_1641
	movcs	%icc,	%g4,	%g3
	tsubcc	%g2,	%i5,	%i6
	tneg	%xcc,	0x1
loop_1641:
	edge16	%o1,	%l2,	%o0
	fcmpes	%fcc3,	%f22,	%f1
	movn	%xcc,	%i0,	%g6
	movrgez	%g1,	%g7,	%g5
	move	%xcc,	%o7,	%l1
	edge32l	%i2,	%l3,	%i1
	fmovrdne	%o6,	%f26,	%f16
	edge8l	%o5,	%l6,	%o3
	edge8	%l0,	%i3,	%o4
	movgu	%xcc,	%o2,	%l4
	mulscc	%l5,	%i7,	%i4
	ba,pt	%icc,	loop_1642
	edge16ln	%g3,	%g4,	%g2
	tsubcc	%i6,	0x0EB3,	%i5
	tg	%icc,	0x6
loop_1642:
	edge32ln	%l2,	%o1,	%o0
	bvs	%xcc,	loop_1643
	fnot2	%f26,	%f2
	andn	%g6,	%g1,	%g7
	edge8n	%g5,	%i0,	%o7
loop_1643:
	subccc	%i2,	0x0A90,	%l3
	fsrc2s	%f2,	%f30
	fmovsne	%xcc,	%f6,	%f25
	ta	%icc,	0x3
	fsrc1	%f12,	%f6
	tne	%icc,	0x3
	udivx	%i1,	0x15A5,	%o6
	sethi	0x18E7,	%o5
	fmul8x16al	%f24,	%f6,	%f4
	sdivx	%l1,	0x038D,	%o3
	fcmps	%fcc2,	%f17,	%f31
	tcs	%xcc,	0x4
	movrgz	%l0,	%i3,	%o4
	xnor	%o2,	0x1269,	%l4
	ba,a,pt	%xcc,	loop_1644
	movvs	%icc,	%l5,	%l6
	be,pt	%xcc,	loop_1645
	movl	%xcc,	%i7,	%i4
loop_1644:
	array16	%g3,	%g2,	%i6
	movcc	%xcc,	%g4,	%l2
loop_1645:
	fbn,a	%fcc0,	loop_1646
	tgu	%xcc,	0x1
	edge16	%o1,	%i5,	%g6
	movcc	%icc,	%o0,	%g7
loop_1646:
	udivx	%g1,	0x1116,	%i0
	sra	%o7,	%g5,	%i2
	movleu	%icc,	%l3,	%o6
	xor	%i1,	0x0AB3,	%l1
	bn	loop_1647
	ld	[%l7 + 0x54],	%f23
	ba,a,pn	%icc,	loop_1648
	membar	0x39
loop_1647:
	edge16n	%o5,	%l0,	%i3
	fmovdge	%icc,	%f11,	%f16
loop_1648:
	edge32	%o4,	%o3,	%l4
	sdiv	%l5,	0x1903,	%l6
	sdivx	%i7,	0x042E,	%i4
	edge32n	%o2,	%g2,	%g3
	addccc	%i6,	0x0DB4,	%l2
	udiv	%o1,	0x01CE,	%i5
	movrlz	%g6,	0x325,	%g4
	brgz,a	%g7,	loop_1649
	fpadd32s	%f31,	%f24,	%f22
	movre	%o0,	%g1,	%i0
	taddcc	%g5,	%i2,	%o7
loop_1649:
	bvc,pn	%xcc,	loop_1650
	edge16n	%l3,	%o6,	%i1
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf9
	membar	#Sync
loop_1650:
	fornot2	%f26,	%f0,	%f2
	tge	%xcc,	0x1
	fcmpeq16	%f6,	%f14,	%o5
	edge8ln	%l0,	%i3,	%o4
	tne	%xcc,	0x0
	for	%f14,	%f28,	%f14
	smulcc	%l1,	%o3,	%l4
	fbe	%fcc0,	loop_1651
	fmovdl	%icc,	%f19,	%f4
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf9
	membar	#Sync
loop_1651:
	addccc	%l6,	%l5,	%i4
	edge32n	%i7,	%o2,	%g2
	edge16l	%i6,	%g3,	%o1
	bcs	%icc,	loop_1652
	fbu,a	%fcc2,	loop_1653
	subc	%i5,	0x1EDF,	%l2
	fblg,a	%fcc1,	loop_1654
loop_1652:
	fmovdcs	%xcc,	%f9,	%f4
loop_1653:
	stb	%g6,	[%l7 + 0x79]
	xorcc	%g7,	0x19E2,	%g4
loop_1654:
	movrlez	%o0,	%g1,	%i0
	move	%xcc,	%i2,	%o7
	popc	%l3,	%o6
	sdiv	%g5,	0x05BB,	%o5
	fbue	%fcc0,	loop_1655
	bge	loop_1656
	fbue,a	%fcc0,	loop_1657
	move	%icc,	%l0,	%i3
loop_1655:
	movrlz	%o4,	%i1,	%o3
loop_1656:
	fxor	%f20,	%f30,	%f24
loop_1657:
	fba	%fcc1,	loop_1658
	tcc	%icc,	0x3
	prefetch	[%l7 + 0x08],	 0x3
	array16	%l1,	%l4,	%l6
loop_1658:
	orcc	%l5,	%i4,	%o2
	fmovrdgz	%i7,	%f20,	%f26
	addc	%i6,	0x16DB,	%g3
	edge16l	%o1,	%g2,	%l2
	movvc	%icc,	%i5,	%g6
	movge	%icc,	%g4,	%o0
	tsubcc	%g7,	%g1,	%i2
	srl	%o7,	0x0E,	%l3
	subcc	%i0,	0x14CC,	%g5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	fmovdcc	%icc,	%f10,	%f16
	fbe	%fcc0,	loop_1659
	fnand	%f4,	%f20,	%f12
	fpsub16	%f14,	%f10,	%f26
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1659:
	xnorcc	%o5,	%i3,	%l0
	fmovspos	%icc,	%f11,	%f18
	set	0x64, %i2
	swapa	[%l7 + %i2] 0x80,	%i1
	fmovdneg	%icc,	%f31,	%f12
	fbo	%fcc0,	loop_1660
	smulcc	%o3,	%o4,	%l1
	fcmpd	%fcc2,	%f0,	%f2
	xnorcc	%l4,	%l6,	%i4
loop_1660:
	nop
	set	0x50, %l0
	ldda	[%l7 + %l0] 0x2a,	%l4
	xor	%o2,	0x0689,	%i7
	fmovrdgz	%i6,	%f16,	%f16
	faligndata	%f10,	%f6,	%f4
	sdivx	%o1,	0x0D16,	%g3
	mulscc	%g2,	%l2,	%i5
	fbge	%fcc3,	loop_1661
	edge32	%g4,	%o0,	%g7
	tcs	%icc,	0x6
	edge32n	%g6,	%g1,	%o7
loop_1661:
	fbue,a	%fcc0,	loop_1662
	movne	%icc,	%l3,	%i0
	fble,a	%fcc3,	loop_1663
	fmovdg	%xcc,	%f2,	%f6
loop_1662:
	array8	%g5,	%o6,	%i2
	umul	%i3,	0x1EC6,	%l0
loop_1663:
	sethi	0x1671,	%i1
	movneg	%icc,	%o5,	%o3
	ta	%xcc,	0x5
	std	%f14,	[%l7 + 0x10]
	movrgez	%o4,	%l4,	%l6
	fmovs	%f19,	%f11
	tvc	%icc,	0x4
	movrlez	%l1,	0x197,	%l5
	fcmpeq16	%f20,	%f2,	%i4
	sth	%o2,	[%l7 + 0x50]
	orcc	%i7,	0x1E5C,	%i6
	movn	%xcc,	%g3,	%g2
	brlz,a	%o1,	loop_1664
	xnor	%i5,	0x0B9A,	%l2
	fbul	%fcc1,	loop_1665
	or	%g4,	%g7,	%o0
loop_1664:
	edge32n	%g6,	%g1,	%l3
	and	%i0,	%o7,	%o6
loop_1665:
	ta	%xcc,	0x1
	fpadd32	%f14,	%f18,	%f12
	srlx	%g5,	0x12,	%i2
	fxor	%f18,	%f4,	%f24
	fcmpeq32	%f30,	%f14,	%i3
	fcmpes	%fcc0,	%f10,	%f14
	subccc	%i1,	0x1360,	%o5
	srax	%l0,	%o4,	%l4
	edge16n	%o3,	%l6,	%l1
	movcs	%icc,	%i4,	%o2
	call	loop_1666
	prefetch	[%l7 + 0x7C],	 0x3
	fmovdpos	%icc,	%f16,	%f18
	tle	%xcc,	0x7
loop_1666:
	movrgz	%i7,	0x0BA,	%i6
	srax	%l5,	%g3,	%g2
	edge8ln	%o1,	%i5,	%g4
	fmovrde	%l2,	%f6,	%f12
	ble,pt	%xcc,	loop_1667
	bpos,pn	%xcc,	loop_1668
	fandnot2s	%f22,	%f1,	%f12
	alignaddr	%g7,	%o0,	%g6
loop_1667:
	nop
	set	0x08, %g4
	lda	[%l7 + %g4] 0x0c,	%f15
loop_1668:
	nop
	wr	%g0,	0x23,	%asi
	stxa	%g1,	[%l7 + 0x40] %asi
	membar	#Sync
	xnor	%l3,	0x103E,	%i0
	fmovs	%f13,	%f20
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	array32	%o6,	%g5,	%o7
	bl,pn	%icc,	loop_1669
	popc	%i2,	%i3
	fpmerge	%f20,	%f31,	%f12
	stw	%o5,	[%l7 + 0x68]
loop_1669:
	faligndata	%f18,	%f8,	%f22
	udivcc	%i1,	0x0C78,	%o4
	orn	%l0,	%o3,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l1,	%i4,	%o2
	movrlz	%l4,	0x292,	%i6
	bge	loop_1670
	array32	%i7,	%l5,	%g3
	addcc	%g2,	%i5,	%o1
	fnegd	%f18,	%f28
loop_1670:
	udiv	%g4,	0x0D02,	%l2
	fmovdn	%xcc,	%f29,	%f19
	taddcc	%g7,	0x1BCE,	%g6
	stb	%g1,	[%l7 + 0x1F]
	call	loop_1671
	move	%xcc,	%l3,	%i0
	subcc	%o6,	%o0,	%o7
	fmovsge	%icc,	%f5,	%f28
loop_1671:
	umulcc	%g5,	%i2,	%i3
	bvc,a	%xcc,	loop_1672
	subcc	%i1,	0x0758,	%o5
	movneg	%icc,	%l0,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1672:
	edge32n	%l6,	%l1,	%o3
	fmovrse	%i4,	%f10,	%f25
	mulx	%l4,	%i6,	%i7
	tpos	%xcc,	0x6
	movre	%l5,	%o2,	%g3
	movgu	%icc,	%g2,	%i5
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x4D] %asi,	%g4
	set	0x28, %g6
	stda	%o0,	[%l7 + %g6] 0x2b
	membar	#Sync
	movrlez	%g7,	%l2,	%g6
	array32	%g1,	%i0,	%l3
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	umulcc	%o0,	0x14E5,	%o6
	udivx	%g5,	0x022C,	%o7
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%i3
	movge	%icc,	%i1,	%o5
	tcc	%icc,	0x6
	srax	%i2,	%l0,	%l6
	fnot1	%f12,	%f10
	edge32n	%o4,	%o3,	%i4
	array8	%l1,	%i6,	%i7
	sdivx	%l4,	0x0CC4,	%o2
	edge32	%g3,	%g2,	%i5
	bneg,pn	%icc,	loop_1673
	sll	%g4,	%l5,	%g7
	edge32n	%l2,	%g6,	%o1
	fpsub16	%f28,	%f30,	%f14
loop_1673:
	movneg	%xcc,	%i0,	%g1
	popc	%l3,	%o6
	tg	%icc,	0x1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g5,	%o7
	array8	%o0,	%i1,	%i3
	xor	%o5,	%i2,	%l6
	set	0x0C, %l5
	lduha	[%l7 + %l5] 0x19,	%l0
	movrgz	%o3,	0x2E8,	%o4
	array16	%i4,	%l1,	%i7
	tg	%icc,	0x7
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x60] %asi,	%i6
	ldd	[%l7 + 0x30],	%f10
	bl	%icc,	loop_1674
	sethi	0x0C45,	%o2
	movvc	%icc,	%g3,	%l4
	bgu	loop_1675
loop_1674:
	subccc	%i5,	0x1B3F,	%g4
	bvc,a	loop_1676
	tg	%icc,	0x4
loop_1675:
	fornot2s	%f17,	%f1,	%f5
	be,a,pn	%xcc,	loop_1677
loop_1676:
	tl	%xcc,	0x1
	subccc	%l5,	%g7,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1677:
	edge8ln	%g2,	%o1,	%g6
	movne	%icc,	%i0,	%g1
	tpos	%icc,	0x1
	nop
	setx	loop_1678,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%l3,	0x09BE,	%o6
	add	%g5,	0x08CD,	%o7
	fmovdleu	%xcc,	%f17,	%f18
loop_1678:
	brgz,a	%o0,	loop_1679
	fmovrse	%i1,	%f26,	%f8
	fbuge,a	%fcc1,	loop_1680
	movvc	%icc,	%i3,	%o5
loop_1679:
	tleu	%icc,	0x0
	movpos	%xcc,	%i2,	%l0
loop_1680:
	udivx	%o3,	0x0AA6,	%l6
	mova	%icc,	%i4,	%l1
	movle	%icc,	%o4,	%i6
	movrne	%i7,	0x398,	%o2
	set	0x20, %o0
	lda	[%l7 + %o0] 0x18,	%f11
	bge,a,pt	%xcc,	loop_1681
	ba,a	%xcc,	loop_1682
	fmovdcc	%xcc,	%f17,	%f30
	be,a,pn	%icc,	loop_1683
loop_1681:
	tgu	%icc,	0x7
loop_1682:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,pn	%xcc,	loop_1684
loop_1683:
	sth	%g3,	[%l7 + 0x4E]
	edge32	%i5,	%g4,	%l4
	mova	%icc,	%l5,	%l2
loop_1684:
	movrlz	%g7,	%g2,	%g6
	sth	%o1,	[%l7 + 0x46]
	brz,a	%g1,	loop_1685
	sdivx	%i0,	0x0400,	%l3
	tle	%xcc,	0x6
	edge16l	%g5,	%o6,	%o7
loop_1685:
	ta	%icc,	0x6
	fbue,a	%fcc2,	loop_1686
	ldd	[%l7 + 0x60],	%f28
	addccc	%i1,	%o0,	%i3
	brnz	%o5,	loop_1687
loop_1686:
	edge32l	%i2,	%o3,	%l6
	andcc	%i4,	0x0F89,	%l1
	set	0x40, %o2
	stba	%l0,	[%l7 + %o2] 0x19
loop_1687:
	fbue,a	%fcc1,	loop_1688
	std	%f12,	[%l7 + 0x28]
	alignaddr	%i6,	%i7,	%o2
	fmovdle	%icc,	%f12,	%f1
loop_1688:
	tsubcctv	%g3,	0x0B31,	%o4
	andn	%g4,	0x03D4,	%i5
	array16	%l4,	%l5,	%l2
	fbu	%fcc1,	loop_1689
	edge32	%g7,	%g2,	%g6
	movneg	%icc,	%g1,	%o1
	fsrc2	%f30,	%f16
loop_1689:
	xnor	%i0,	0x0C4C,	%l3
	tvs	%icc,	0x6
	std	%g4,	[%l7 + 0x30]
	edge32n	%o6,	%o7,	%i1
	edge8	%i3,	%o5,	%o0
	movrne	%i2,	%l6,	%o3
	tpos	%xcc,	0x5
	fpadd32s	%f17,	%f6,	%f9
	movrlz	%i4,	0x167,	%l1
	movvs	%xcc,	%i6,	%l0
	edge8n	%i7,	%o2,	%g3
	tl	%xcc,	0x2
	umul	%o4,	0x020E,	%g4
	fbg,a	%fcc3,	loop_1690
	fmovrsgz	%l4,	%f21,	%f22
	udiv	%i5,	0x1EB7,	%l2
	movrlz	%g7,	%l5,	%g6
loop_1690:
	bne,a,pn	%icc,	loop_1691
	subcc	%g2,	0x0550,	%g1
	fmovspos	%xcc,	%f25,	%f15
	fmovd	%f14,	%f16
loop_1691:
	nop
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fbuge,a	%fcc0,	loop_1692
	movvs	%icc,	%o1,	%i0
	sir	0x1695
	andncc	%l3,	%g5,	%o7
loop_1692:
	edge16l	%i1,	%i3,	%o6
	ta	%icc,	0x2
	fmovdvc	%xcc,	%f14,	%f7
	edge32n	%o0,	%i2,	%o5
	alignaddr	%l6,	%o3,	%i4
	subccc	%i6,	0x15AD,	%l1
	srl	%l0,	%o2,	%i7
	fmovdpos	%icc,	%f10,	%f15
	movne	%icc,	%g3,	%o4
	fcmped	%fcc1,	%f16,	%f10
	alignaddrl	%g4,	%i5,	%l2
	ba	loop_1693
	fmovse	%icc,	%f31,	%f15
	movle	%icc,	%g7,	%l4
	fbuge	%fcc3,	loop_1694
loop_1693:
	fmovsle	%xcc,	%f20,	%f10
	stw	%g6,	[%l7 + 0x74]
	srlx	%g2,	%g1,	%l5
loop_1694:
	fnot2s	%f27,	%f5
	orcc	%i0,	%l3,	%o1
	movg	%icc,	%g5,	%i1
	xorcc	%o7,	%o6,	%o0
	fones	%f3
	tneg	%icc,	0x0
	mova	%icc,	%i3,	%o5
	fnot1	%f8,	%f22
	add	%i2,	0x1C5A,	%l6
	fmovdl	%xcc,	%f29,	%f1
	movl	%icc,	%o3,	%i4
	movcc	%xcc,	%l1,	%i6
	bvs,pn	%icc,	loop_1695
	addccc	%l0,	%i7,	%o2
	ldsw	[%l7 + 0x10],	%g3
	sll	%o4,	%g4,	%l2
loop_1695:
	srax	%g7,	%i5,	%g6
	stbar
	tvs	%xcc,	0x7
	movle	%icc,	%g2,	%l4
	movl	%xcc,	%g1,	%i0
	stbar
	sir	0x0C68
	fcmpgt16	%f16,	%f30,	%l3
	movvc	%xcc,	%l5,	%g5
	xnorcc	%o1,	0x1071,	%o7
	xorcc	%o6,	%i1,	%i3
	andcc	%o0,	0x1D26,	%i2
	set	0x74, %o5
	ldswa	[%l7 + %o5] 0x0c,	%o5
	edge8n	%l6,	%o3,	%l1
	taddcctv	%i6,	0x141A,	%i4
	fbe,a	%fcc1,	loop_1696
	movge	%xcc,	%i7,	%o2
	movg	%icc,	%g3,	%l0
	fnot1	%f4,	%f14
loop_1696:
	te	%icc,	0x4
	popc	0x1A90,	%o4
	mova	%xcc,	%g4,	%g7
	fmovs	%f24,	%f0
	addccc	%l2,	%g6,	%i5
	subcc	%l4,	%g2,	%g1
	tsubcc	%l3,	%l5,	%g5
	taddcc	%i0,	0x1E77,	%o7
	bvs,a	loop_1697
	movrlz	%o1,	0x20F,	%i1
	subccc	%o6,	%i3,	%i2
	fbg,a	%fcc2,	loop_1698
loop_1697:
	smulcc	%o5,	0x0DE1,	%l6
	edge16	%o0,	%l1,	%o3
	taddcctv	%i6,	0x0CE1,	%i7
loop_1698:
	fnot1	%f6,	%f26
	fands	%f28,	%f12,	%f8
	sdivx	%o2,	0x0F17,	%g3
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x63] %asi,	%l0
	ldd	[%l7 + 0x48],	%i4
	umulcc	%g4,	%g7,	%l2
	edge32l	%g6,	%o4,	%i5
	ba,a,pn	%icc,	loop_1699
	fmovrdlz	%l4,	%f24,	%f18
	brz	%g1,	loop_1700
	fabss	%f24,	%f16
loop_1699:
	movle	%xcc,	%g2,	%l5
	fcmpgt32	%f12,	%f24,	%l3
loop_1700:
	movneg	%icc,	%g5,	%i0
	sra	%o1,	0x18,	%i1
	bge,a	loop_1701
	brz,a	%o6,	loop_1702
	fmuld8sux16	%f19,	%f24,	%f30
	set	0x46, %i0
	lduha	[%l7 + %i0] 0x15,	%o7
loop_1701:
	fmovsvc	%icc,	%f9,	%f4
loop_1702:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%i3
	prefetch	[%l7 + 0x54],	 0x1
	taddcctv	%i2,	0x0255,	%o5
	popc	0x1F44,	%o0
	udivcc	%l1,	0x1006,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i6
	fxnor	%f18,	%f24,	%f16
	call	loop_1703
	fcmpeq32	%f22,	%f8,	%o3
	tge	%icc,	0x5
	movle	%icc,	%i7,	%g3
loop_1703:
	udivx	%l0,	0x0452,	%i4
	sth	%o2,	[%l7 + 0x22]
	smulcc	%g4,	0x1FB8,	%l2
	edge8n	%g7,	%g6,	%i5
	fmovrslz	%o4,	%f2,	%f28
	wr	%g0,	0x10,	%asi
	stba	%g1,	[%l7 + 0x67] %asi
	fmovdle	%icc,	%f8,	%f29
	edge8l	%l4,	%l5,	%g2
	addc	%l3,	%i0,	%o1
	faligndata	%f8,	%f6,	%f0
	set	0x78, %o1
	stda	%g4,	[%l7 + %o1] 0x10
	movge	%icc,	%o6,	%o7
	fbue	%fcc1,	loop_1704
	taddcc	%i3,	0x1167,	%i2
	fbe	%fcc2,	loop_1705
	fbue	%fcc1,	loop_1706
loop_1704:
	sdivx	%i1,	0x13B2,	%o0
	tvs	%icc,	0x6
loop_1705:
	fba,a	%fcc2,	loop_1707
loop_1706:
	fmuld8ulx16	%f31,	%f26,	%f0
	move	%xcc,	%o5,	%l1
	sub	%i6,	%o3,	%l6
loop_1707:
	fba	%fcc1,	loop_1708
	addc	%g3,	0x142B,	%l0
	set	0x1A, %g3
	stba	%i4,	[%l7 + %g3] 0xe3
	membar	#Sync
loop_1708:
	edge16	%i7,	%g4,	%o2
	tsubcc	%l2,	0x052D,	%g7
	srl	%i5,	0x1E,	%g6
	fmul8ulx16	%f0,	%f18,	%f0
	and	%o4,	%l4,	%g1
	fmul8ulx16	%f10,	%f22,	%f26
	edge32l	%g2,	%l3,	%l5
	edge8	%o1,	%i0,	%g5
	tne	%icc,	0x1
	orcc	%o7,	%i3,	%o6
	fmovdleu	%icc,	%f12,	%f15
	mulscc	%i1,	0x0954,	%o0
	fornot1	%f0,	%f30,	%f22
	udiv	%i2,	0x1DCB,	%o5
	fmovdg	%xcc,	%f23,	%f26
	edge16	%i6,	%o3,	%l6
	std	%g2,	[%l7 + 0x28]
	bvc,a	loop_1709
	edge32ln	%l1,	%l0,	%i7
	stw	%g4,	[%l7 + 0x18]
	fbge	%fcc1,	loop_1710
loop_1709:
	fabss	%f13,	%f28
	tn	%icc,	0x4
	ldstub	[%l7 + 0x63],	%o2
loop_1710:
	tne	%icc,	0x1
	fble,a	%fcc3,	loop_1711
	fpackfix	%f4,	%f11
	te	%icc,	0x0
	subccc	%i4,	%g7,	%l2
loop_1711:
	fmovsneg	%icc,	%f29,	%f0
	wr	%g0,	0x89,	%asi
	sta	%f28,	[%l7 + 0x54] %asi
	movrlez	%i5,	%g6,	%l4
	fpackfix	%f22,	%f12
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x0c,	%o4,	%g2
	for	%f12,	%f4,	%f12
	fnot1	%f14,	%f30
	srax	%g1,	%l5,	%o1
	array32	%l3,	%g5,	%o7
	edge16ln	%i0,	%i3,	%i1
	lduh	[%l7 + 0x2E],	%o6
	fmovdn	%xcc,	%f20,	%f19
	fbl	%fcc0,	loop_1712
	nop
	setx loop_1713, %l0, %l1
	jmpl %l1, %i2
	fmovdge	%icc,	%f30,	%f0
	brgez	%o5,	loop_1714
loop_1712:
	fnegs	%f1,	%f9
loop_1713:
	tcs	%icc,	0x4
	edge8n	%o0,	%o3,	%l6
loop_1714:
	stx	%i6,	[%l7 + 0x48]
	sdiv	%g3,	0x0396,	%l0
	edge32	%i7,	%g4,	%o2
	movg	%icc,	%i4,	%g7
	fblg,a	%fcc3,	loop_1715
	fmul8x16	%f9,	%f0,	%f2
	udivcc	%l2,	0x1505,	%i5
	pdist	%f18,	%f0,	%f4
loop_1715:
	fmovrde	%l1,	%f22,	%f14
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l4
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x4E] %asi,	%g6
	fmovspos	%icc,	%f26,	%f30
	movcc	%icc,	%o4,	%g1
	fmovrdgez	%g2,	%f12,	%f4
	edge16l	%o1,	%l5,	%l3
	srax	%o7,	%g5,	%i3
	tl	%xcc,	0x2
	edge32ln	%i1,	%i0,	%o6
	fnot2s	%f11,	%f22
	tvc	%icc,	0x0
	bg,pt	%icc,	loop_1716
	subcc	%i2,	%o5,	%o0
	fpack16	%f16,	%f1
	movpos	%icc,	%l6,	%o3
loop_1716:
	udiv	%i6,	0x1B90,	%l0
	fsrc2s	%f21,	%f24
	be,a,pn	%xcc,	loop_1717
	fcmple16	%f6,	%f6,	%i7
	fbge,a	%fcc1,	loop_1718
	stw	%g3,	[%l7 + 0x18]
loop_1717:
	movcc	%icc,	%o2,	%i4
	tvc	%icc,	0x7
loop_1718:
	sdivx	%g4,	0x0ADD,	%g7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x10,	%i5,	%l2
	addccc	%l1,	%l4,	%g6
	nop
	setx	loop_1719,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umul	%o4,	0x18AB,	%g1
	movcc	%icc,	%g2,	%l5
	movre	%o1,	%o7,	%l3
loop_1719:
	ta	%xcc,	0x5
	bpos	loop_1720
	edge8ln	%g5,	%i3,	%i1
	andcc	%i0,	%i2,	%o5
	ldsw	[%l7 + 0x2C],	%o6
loop_1720:
	fbg,a	%fcc3,	loop_1721
	ldsh	[%l7 + 0x4E],	%l6
	fnand	%f30,	%f10,	%f28
	movl	%icc,	%o3,	%i6
loop_1721:
	movgu	%icc,	%l0,	%i7
	fcmpgt32	%f24,	%f28,	%o0
	tcs	%icc,	0x3
	movne	%xcc,	%g3,	%i4
	xorcc	%o2,	%g4,	%i5
	fxors	%f28,	%f15,	%f20
	alignaddr	%g7,	%l1,	%l4
	fnot2	%f12,	%f24
	fmovdn	%icc,	%f13,	%f11
	bn,pt	%icc,	loop_1722
	movge	%xcc,	%g6,	%o4
	movle	%icc,	%g1,	%g2
	edge8l	%l5,	%l2,	%o1
loop_1722:
	fmovdgu	%xcc,	%f2,	%f0
	udivx	%o7,	0x18F1,	%g5
	membar	0x0C
	tleu	%xcc,	0x5
	bge	%xcc,	loop_1723
	addccc	%i3,	0x00AD,	%i1
	ble	%icc,	loop_1724
	ba,a,pt	%icc,	loop_1725
loop_1723:
	fmovscs	%xcc,	%f21,	%f4
	fmovde	%icc,	%f21,	%f13
loop_1724:
	edge8n	%l3,	%i2,	%i0
loop_1725:
	fbne	%fcc0,	loop_1726
	fabss	%f24,	%f1
	tcc	%icc,	0x6
	move	%icc,	%o5,	%l6
loop_1726:
	edge8n	%o6,	%i6,	%l0
	fones	%f28
	fmovs	%f5,	%f16
	ldd	[%l7 + 0x40],	%i6
	edge8l	%o3,	%o0,	%g3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x58] %asi,	%i4
	fnot1	%f4,	%f30
	fnot2s	%f4,	%f17
	addccc	%o2,	%g4,	%g7
	edge16	%l1,	%i5,	%l4
	set	0x34, %i1
	ldswa	[%l7 + %i1] 0x89,	%o4
	ta	%xcc,	0x5
	ldub	[%l7 + 0x3B],	%g6
	subccc	%g2,	0x0B4E,	%g1
	movneg	%xcc,	%l5,	%o1
	faligndata	%f30,	%f10,	%f18
	bshuffle	%f18,	%f16,	%f26
	fpsub32	%f2,	%f14,	%f30
	bcc,a,pt	%icc,	loop_1727
	ble,pt	%xcc,	loop_1728
	tvc	%icc,	0x4
	tsubcc	%l2,	0x0A4B,	%g5
loop_1727:
	edge32l	%o7,	%i1,	%l3
loop_1728:
	bvc,pt	%icc,	loop_1729
	tg	%xcc,	0x7
	set	0x14, %l6
	sta	%f9,	[%l7 + %l6] 0x14
loop_1729:
	fmovse	%icc,	%f16,	%f18
	movrne	%i2,	%i3,	%i0
	movgu	%icc,	%o5,	%l6
	tle	%icc,	0x0
	movge	%xcc,	%o6,	%l0
	movne	%icc,	%i7,	%o3
	fnegs	%f1,	%f16
	movrgz	%i6,	0x0EA,	%o0
	sll	%g3,	%o2,	%i4
	xor	%g7,	%g4,	%l1
	movle	%xcc,	%i5,	%l4
	sethi	0x09E1,	%g6
	fmovse	%xcc,	%f9,	%f12
	movrgez	%g2,	%g1,	%l5
	bpos,pt	%icc,	loop_1730
	edge16	%o1,	%o4,	%g5
	subcc	%l2,	%i1,	%o7
	fmovrdgez	%i2,	%f4,	%f24
loop_1730:
	tvc	%icc,	0x3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x5D] %asi,	%i3
	orcc	%l3,	0x07F0,	%o5
	ldd	[%l7 + 0x20],	%f0
	srax	%i0,	0x0D,	%o6
	bg,a,pn	%xcc,	loop_1731
	sdivx	%l0,	0x1C10,	%i7
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x14] %asi,	%l6
loop_1731:
	edge32n	%o3,	%i6,	%o0
	fors	%f14,	%f31,	%f31
	tne	%xcc,	0x4
	edge16ln	%o2,	%g3,	%i4
	orncc	%g4,	%l1,	%i5
	sra	%g7,	0x08,	%l4
	tcc	%icc,	0x5
	addcc	%g2,	%g1,	%l5
	edge8n	%g6,	%o4,	%g5
	lduw	[%l7 + 0x4C],	%l2
	sir	0x1024
	fbne,a	%fcc3,	loop_1732
	orcc	%i1,	0x1E61,	%o1
	movge	%xcc,	%i2,	%i3
	wr	%g0,	0x2b,	%asi
	stba	%l3,	[%l7 + 0x72] %asi
	membar	#Sync
loop_1732:
	brlz,a	%o5,	loop_1733
	tneg	%xcc,	0x3
	andncc	%i0,	%o7,	%l0
	fblg	%fcc1,	loop_1734
loop_1733:
	edge16ln	%i7,	%o6,	%l6
	fmul8x16au	%f4,	%f8,	%f20
	fbul,a	%fcc1,	loop_1735
loop_1734:
	brlez,a	%i6,	loop_1736
	addccc	%o3,	%o0,	%g3
	bge,pt	%icc,	loop_1737
loop_1735:
	or	%o2,	0x190C,	%g4
loop_1736:
	move	%icc,	%l1,	%i5
	sllx	%g7,	0x03,	%l4
loop_1737:
	bshuffle	%f26,	%f10,	%f0
	brz	%g2,	loop_1738
	brz,a	%g1,	loop_1739
	fnegs	%f14,	%f12
	bn,a,pn	%icc,	loop_1740
loop_1738:
	tg	%icc,	0x4
loop_1739:
	fmovd	%f6,	%f16
	edge16l	%l5,	%i4,	%g6
loop_1740:
	sth	%g5,	[%l7 + 0x38]
	movrgz	%l2,	%o4,	%o1
	fbule	%fcc3,	loop_1741
	bn	loop_1742
	bne,pn	%icc,	loop_1743
	fmovrsne	%i1,	%f11,	%f19
loop_1741:
	fmovsne	%xcc,	%f27,	%f26
loop_1742:
	movg	%xcc,	%i3,	%i2
loop_1743:
	movle	%xcc,	%o5,	%i0
	edge16l	%o7,	%l0,	%l3
	tsubcctv	%i7,	%l6,	%i6
	fcmpeq16	%f12,	%f30,	%o3
	brnz,a	%o0,	loop_1744
	edge32	%o6,	%o2,	%g3
	edge16l	%g4,	%i5,	%l1
	sth	%l4,	[%l7 + 0x66]
loop_1744:
	addcc	%g2,	0x0BB4,	%g7
	movrlz	%l5,	0x3F3,	%g1
	fmovrsgez	%i4,	%f20,	%f5
	ta	%icc,	0x0
	set	0x74, %l3
	lda	[%l7 + %l3] 0x19,	%f17
	movrlz	%g6,	0x2AA,	%g5
	movrlez	%l2,	0x3CC,	%o1
	orcc	%i1,	%o4,	%i3
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x12] %asi,	%i2
	fbl	%fcc3,	loop_1745
	movrlez	%o5,	%i0,	%l0
	fmovscc	%icc,	%f14,	%f28
	movvc	%icc,	%l3,	%i7
loop_1745:
	brnz	%l6,	loop_1746
	xorcc	%o7,	%i6,	%o0
	fmuld8ulx16	%f6,	%f30,	%f20
	xor	%o6,	0x158F,	%o2
loop_1746:
	movrgz	%o3,	%g3,	%i5
	edge32ln	%l1,	%l4,	%g2
	movpos	%xcc,	%g7,	%l5
	movre	%g1,	%i4,	%g6
	ldstub	[%l7 + 0x52],	%g5
	fmovsl	%xcc,	%f28,	%f25
	fmul8x16au	%f14,	%f12,	%f6
	popc	%g4,	%o1
	fmovsn	%xcc,	%f1,	%f28
	popc	%l2,	%o4
	fzeros	%f22
	fmovsg	%icc,	%f19,	%f14
	movpos	%icc,	%i1,	%i3
	movneg	%icc,	%i2,	%o5
	lduw	[%l7 + 0x28],	%l0
	fbul	%fcc2,	loop_1747
	tgu	%icc,	0x3
	sethi	0x19EC,	%l3
	movne	%icc,	%i0,	%i7
loop_1747:
	fnot1	%f18,	%f4
	fmul8x16au	%f30,	%f17,	%f30
	bge,a,pt	%xcc,	loop_1748
	sra	%l6,	0x14,	%i6
	lduh	[%l7 + 0x40],	%o0
	fba,a	%fcc3,	loop_1749
loop_1748:
	movg	%icc,	%o6,	%o7
	membar	0x6C
	ldstub	[%l7 + 0x51],	%o3
loop_1749:
	edge16l	%o2,	%g3,	%i5
	stw	%l1,	[%l7 + 0x28]
	movrlez	%l4,	%g2,	%l5
	fmovsvc	%icc,	%f26,	%f5
	movrgz	%g1,	%g7,	%g6
	prefetch	[%l7 + 0x78],	 0x2
	fmovsvc	%xcc,	%f0,	%f2
	movrgz	%i4,	0x39E,	%g4
	nop
	setx	loop_1750,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%o1,	%l2,	%o4
	fmovrse	%i1,	%f6,	%f27
	fmovrdlez	%g5,	%f10,	%f14
loop_1750:
	sdivcc	%i3,	0x17A8,	%o5
	st	%f10,	[%l7 + 0x4C]
	fxors	%f0,	%f10,	%f7
	set	0x0E, %g2
	ldsha	[%l7 + %g2] 0x81,	%l0
	tpos	%icc,	0x4
	fmovdvs	%icc,	%f3,	%f16
	tcc	%icc,	0x6
	bleu,a,pn	%xcc,	loop_1751
	fmovrsne	%l3,	%f27,	%f21
	fnot2	%f28,	%f24
	umul	%i0,	0x1C4C,	%i7
loop_1751:
	mulscc	%i2,	%i6,	%o0
	edge8ln	%o6,	%l6,	%o7
	addccc	%o2,	0x10BA,	%o3
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x89
	movg	%xcc,	%g3,	%l1
	fmovrde	%i5,	%f18,	%f8
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x40] %asi,	%g2
	udiv	%l4,	0x0D35,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g7,	%g6,	%g1
	sir	0x14E6
	fmovde	%xcc,	%f20,	%f22
	fnegs	%f22,	%f18
	umul	%g4,	%i4,	%l2
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x120] %asi,	%o4
	edge32ln	%i1,	%g5,	%i3
	xorcc	%o1,	%o5,	%l0
	fmovsgu	%icc,	%f20,	%f11
	sdivcc	%l3,	0x163B,	%i7
	fmovrsne	%i0,	%f3,	%f23
	udivx	%i6,	0x1C59,	%o0
	fbug	%fcc2,	loop_1752
	sra	%o6,	0x15,	%l6
	or	%o7,	%i2,	%o3
	faligndata	%f8,	%f18,	%f26
loop_1752:
	tne	%xcc,	0x5
	stw	%g3,	[%l7 + 0x6C]
	mova	%xcc,	%o2,	%l1
	tpos	%icc,	0x5
	tle	%icc,	0x6
	fmovsneg	%icc,	%f8,	%f1
	fmovrdgez	%i5,	%f28,	%f16
	fnor	%f26,	%f30,	%f8
	edge32ln	%g2,	%l4,	%l5
	xor	%g7,	0x0BF8,	%g1
	fbule,a	%fcc2,	loop_1753
	ldsb	[%l7 + 0x43],	%g6
	sdivcc	%g4,	0x1283,	%i4
	movne	%xcc,	%o4,	%i1
loop_1753:
	tge	%xcc,	0x7
	mova	%icc,	%l2,	%g5
	movvs	%xcc,	%i3,	%o1
	smul	%o5,	0x127C,	%l3
	wr	%g0,	0x52,	%asi
	stxa	%l0,	[%g0 + 0x120] %asi
	andncc	%i7,	%i0,	%o0
	fmovde	%xcc,	%f14,	%f26
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%o6
	smul	%l6,	%i2,	%o7
	movge	%xcc,	%g3,	%o2
	xor	%o3,	0x185A,	%i5
	fmovrdgz	%l1,	%f30,	%f4
	umul	%l4,	0x1CCE,	%l5
	tcc	%icc,	0x6
	sub	%g2,	%g7,	%g1
	membar	0x46
	fxnors	%f21,	%f4,	%f28
	or	%g6,	%i4,	%g4
	set	0x79, %g5
	ldsba	[%l7 + %g5] 0x04,	%i1
	ldub	[%l7 + 0x1A],	%o4
	fbul	%fcc2,	loop_1754
	fpack16	%f2,	%f1
	fsrc2s	%f4,	%f12
	movrlz	%l2,	%i3,	%g5
loop_1754:
	xorcc	%o5,	%l3,	%l0
	sdivcc	%o1,	0x01B5,	%i0
	tl	%xcc,	0x4
	orncc	%o0,	0x018B,	%i7
	stw	%i6,	[%l7 + 0x50]
	umulcc	%l6,	%o6,	%o7
	bpos	loop_1755
	edge32	%i2,	%o2,	%g3
	fbge,a	%fcc1,	loop_1756
	edge32ln	%i5,	%o3,	%l1
loop_1755:
	andncc	%l4,	%l5,	%g7
	be	%icc,	loop_1757
loop_1756:
	movl	%icc,	%g1,	%g6
	smulcc	%i4,	%g2,	%g4
	fmovdge	%xcc,	%f18,	%f25
loop_1757:
	tvc	%icc,	0x5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i1,	%l2
	mulx	%o4,	%g5,	%i3
	nop
	setx	loop_1758,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brlez	%o5,	loop_1759
	udivx	%l3,	0x12F5,	%l0
	sdivx	%o1,	0x043E,	%i0
loop_1758:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1759:
	tneg	%xcc,	0x2
	bge,a	loop_1760
	sllx	%o0,	%i7,	%l6
	fpadd32	%f30,	%f4,	%f12
	tl	%xcc,	0x0
loop_1760:
	movrgz	%i6,	%o7,	%o6
	nop
	setx	loop_1761,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fsrc2s	%f31,	%f2
	movn	%xcc,	%i2,	%o2
	tsubcctv	%i5,	%g3,	%o3
loop_1761:
	fbn	%fcc3,	loop_1762
	add	%l1,	0x1D04,	%l4
	fmovdneg	%xcc,	%f9,	%f10
	subcc	%g7,	0x0AAD,	%g1
loop_1762:
	movcs	%xcc,	%g6,	%l5
	edge32ln	%g2,	%i4,	%g4
	fcmpne32	%f24,	%f24,	%l2
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fcmpeq16	%f30,	%f2,	%o4
	edge8	%g5,	%i3,	%i1
	tn	%icc,	0x5
	sir	0x172C
	fmovrde	%o5,	%f24,	%f30
	bgu,a	loop_1763
	fsrc1	%f28,	%f26
	brlez,a	%l3,	loop_1764
	fmuld8sux16	%f16,	%f25,	%f4
loop_1763:
	edge32l	%o1,	%i0,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1764:
	brlez,a	%o0,	loop_1765
	array16	%l6,	%i6,	%o7
	brgz	%o6,	loop_1766
	tgu	%icc,	0x7
loop_1765:
	fmovsvc	%icc,	%f22,	%f23
	lduw	[%l7 + 0x38],	%i7
loop_1766:
	tne	%icc,	0x1
	sra	%i2,	%i5,	%o2
	sra	%o3,	0x19,	%l1
	sth	%g3,	[%l7 + 0x62]
	andncc	%l4,	%g1,	%g7
	fcmple16	%f14,	%f2,	%l5
	stbar
	subccc	%g2,	%i4,	%g6
	fcmps	%fcc1,	%f15,	%f22
	ldsh	[%l7 + 0x7E],	%g4
	sllx	%o4,	0x04,	%l2
	brgz	%i3,	loop_1767
	bge,a	%icc,	loop_1768
	fmovdge	%icc,	%f1,	%f25
	xnorcc	%g5,	0x0954,	%o5
loop_1767:
	fors	%f17,	%f27,	%f7
loop_1768:
	fba	%fcc2,	loop_1769
	movn	%xcc,	%l3,	%i1
	udivx	%i0,	0x1CB8,	%l0
	edge32n	%o0,	%o1,	%l6
loop_1769:
	movne	%icc,	%o7,	%o6
	fmovdne	%icc,	%f27,	%f8
	taddcc	%i7,	0x1332,	%i2
	bvs,a	loop_1770
	fbule	%fcc1,	loop_1771
	srax	%i5,	0x0B,	%o2
	fabsd	%f2,	%f0
loop_1770:
	edge32l	%i6,	%o3,	%g3
loop_1771:
	sllx	%l1,	%l4,	%g7
	brlz,a	%l5,	loop_1772
	brlez,a	%g1,	loop_1773
	tle	%xcc,	0x4
	ldd	[%l7 + 0x60],	%f22
loop_1772:
	andn	%g2,	0x1BFD,	%g6
loop_1773:
	movrne	%i4,	0x03D,	%o4
	sllx	%l2,	0x0E,	%g4
	smul	%g5,	0x1E58,	%i3
	sdivcc	%o5,	0x0214,	%i1
	movpos	%icc,	%l3,	%i0
	orncc	%l0,	0x1637,	%o0
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x0c,	%f16
	orn	%l6,	0x1210,	%o1
	set	0x5C, %i7
	lduba	[%l7 + %i7] 0x0c,	%o6
	std	%f14,	[%l7 + 0x48]
	fbe	%fcc0,	loop_1774
	fxnor	%f28,	%f18,	%f22
	mulx	%o7,	0x171A,	%i7
	sllx	%i5,	0x1B,	%i2
loop_1774:
	fbul,a	%fcc0,	loop_1775
	sub	%i6,	%o2,	%g3
	set	0x70, %i5
	swapa	[%l7 + %i5] 0x04,	%l1
loop_1775:
	tsubcc	%o3,	0x0A20,	%g7
	fpsub32	%f16,	%f20,	%f14
	fbge,a	%fcc2,	loop_1776
	tvc	%xcc,	0x4
	ldsh	[%l7 + 0x5A],	%l5
	fxors	%f1,	%f31,	%f29
loop_1776:
	tn	%xcc,	0x7
	tneg	%icc,	0x2
	set	0x10, %g1
	stwa	%l4,	[%l7 + %g1] 0x14
	fones	%f1
	std	%f14,	[%l7 + 0x18]
	lduw	[%l7 + 0x34],	%g1
	andcc	%g6,	0x0EAA,	%g2
	sth	%i4,	[%l7 + 0x3A]
	sethi	0x1106,	%o4
	fmovrdlz	%g4,	%f10,	%f24
	xor	%l2,	0x151F,	%g5
	brlz,a	%i3,	loop_1777
	sth	%o5,	[%l7 + 0x0A]
	fands	%f11,	%f10,	%f25
	orcc	%l3,	0x0973,	%i1
loop_1777:
	nop
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x04
	fpadd32s	%f1,	%f17,	%f22
	addccc	%l0,	%i0,	%l6
	addcc	%o1,	0x169E,	%o0
	sll	%o7,	0x19,	%o6
	edge8	%i7,	%i5,	%i2
	sdiv	%i6,	0x1B94,	%g3
	fnegs	%f20,	%f5
	stbar
	srax	%o2,	0x0A,	%l1
	edge8	%o3,	%l5,	%g7
	udivx	%l4,	0x037E,	%g1
	siam	0x0
	edge16ln	%g2,	%g6,	%o4
	tvc	%icc,	0x0
	fones	%f16
	and	%i4,	0x19EC,	%l2
	xnor	%g5,	%g4,	%i3
	fands	%f17,	%f20,	%f17
	movrne	%o5,	%l3,	%l0
	fandnot2	%f26,	%f0,	%f10
	movcc	%xcc,	%i1,	%l6
	fmovse	%icc,	%f30,	%f5
	andncc	%o1,	%o0,	%i0
	fmovdneg	%xcc,	%f7,	%f2
	fmovdcs	%icc,	%f28,	%f18
	edge32n	%o7,	%i7,	%o6
	bneg,pn	%icc,	loop_1778
	fbu,a	%fcc3,	loop_1779
	udivcc	%i2,	0x07B4,	%i6
	movleu	%xcc,	%i5,	%o2
loop_1778:
	orcc	%l1,	0x156F,	%g3
loop_1779:
	fmovsa	%xcc,	%f6,	%f21
	bg,a,pt	%xcc,	loop_1780
	fbul,a	%fcc1,	loop_1781
	fand	%f30,	%f18,	%f12
	movpos	%xcc,	%o3,	%g7
loop_1780:
	nop
	set	0x2A, %o4
	stha	%l5,	[%l7 + %o4] 0x23
	membar	#Sync
loop_1781:
	fbo,a	%fcc2,	loop_1782
	fpmerge	%f1,	%f3,	%f8
	edge8ln	%l4,	%g1,	%g6
	fandnot1s	%f25,	%f0,	%f20
loop_1782:
	alignaddrl	%o4,	%g2,	%i4
	umulcc	%g5,	0x07A5,	%g4
	membar	0x26
	tl	%icc,	0x0
	add	%l2,	%o5,	%i3
	sir	0x0800
	sllx	%l0,	0x0B,	%l3
	stbar
	fxnors	%f21,	%f1,	%f31
	mulscc	%i1,	%o1,	%o0
	ble,a,pt	%icc,	loop_1783
	orcc	%l6,	%o7,	%i7
	fmovsg	%xcc,	%f6,	%f8
	sdivcc	%i0,	0x0E56,	%o6
loop_1783:
	mulscc	%i2,	%i5,	%i6
	xnor	%l1,	0x00D7,	%g3
	tsubcc	%o3,	0x1B77,	%o2
	fmovda	%xcc,	%f30,	%f2
	movre	%l5,	%l4,	%g7
	subccc	%g1,	0x0C35,	%o4
	sethi	0x1DE6,	%g2
	sub	%g6,	%g5,	%i4
	or	%g4,	0x18E9,	%l2
	movrgez	%o5,	0x17D,	%l0
	fmul8ulx16	%f14,	%f8,	%f0
	ta	%xcc,	0x1
	edge16ln	%i3,	%i1,	%l3
	brgez	%o0,	loop_1784
	sub	%o1,	%l6,	%o7
	udivcc	%i0,	0x08DA,	%i7
	bge,a	loop_1785
loop_1784:
	fmovsg	%icc,	%f4,	%f14
	fmovrdlz	%o6,	%f0,	%f14
	tcc	%icc,	0x7
loop_1785:
	srl	%i2,	0x07,	%i6
	movne	%icc,	%l1,	%g3
	edge8l	%i5,	%o3,	%l5
	movneg	%xcc,	%l4,	%o2
	fmovsneg	%xcc,	%f26,	%f9
	movvs	%icc,	%g1,	%o4
	fzeros	%f21
	movne	%icc,	%g7,	%g6
	movge	%icc,	%g2,	%i4
	bcc,a,pt	%icc,	loop_1786
	fblg	%fcc2,	loop_1787
	fmovdneg	%xcc,	%f28,	%f1
	movneg	%icc,	%g4,	%g5
loop_1786:
	movge	%xcc,	%o5,	%l0
loop_1787:
	taddcctv	%i3,	0x0FFF,	%l2
	fbug,a	%fcc0,	loop_1788
	taddcctv	%l3,	0x1320,	%o0
	fmovrse	%i1,	%f19,	%f17
	udivcc	%o1,	0x1DD3,	%l6
loop_1788:
	ba,a	loop_1789
	fmovsvc	%xcc,	%f6,	%f18
	tleu	%icc,	0x4
	ldd	[%l7 + 0x30],	%f6
loop_1789:
	edge8l	%i0,	%o7,	%o6
	smulcc	%i2,	0x131A,	%i7
	fbul,a	%fcc3,	loop_1790
	bcs	%icc,	loop_1791
	edge16l	%l1,	%g3,	%i6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x30] %asi,	%i5
loop_1790:
	fabss	%f24,	%f28
loop_1791:
	brlez,a	%l5,	loop_1792
	tcs	%icc,	0x0
	tl	%icc,	0x0
	fxnor	%f4,	%f28,	%f26
loop_1792:
	edge8ln	%o3,	%o2,	%g1
	movge	%xcc,	%l4,	%g7
	movge	%xcc,	%o4,	%g6
	udivx	%i4,	0x15FD,	%g4
	ta	%icc,	0x2
	fandnot2	%f0,	%f4,	%f14
	fmovde	%xcc,	%f17,	%f8
	addc	%g5,	0x0E2C,	%g2
	fmul8x16al	%f26,	%f13,	%f4
	tvs	%icc,	0x3
	movrne	%l0,	%o5,	%i3
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x37] %asi,	%l3
	srax	%l2,	0x06,	%o0
	movle	%icc,	%o1,	%l6
	movl	%icc,	%i0,	%i1
	movpos	%xcc,	%o7,	%i2
	brgz,a	%i7,	loop_1793
	alignaddr	%l1,	%g3,	%o6
	edge16	%i6,	%i5,	%o3
	fbu,a	%fcc2,	loop_1794
loop_1793:
	fabss	%f13,	%f5
	fmovrdlez	%l5,	%f6,	%f28
	sll	%o2,	%g1,	%l4
loop_1794:
	sllx	%o4,	0x06,	%g7
	popc	%i4,	%g4
	movcc	%icc,	%g6,	%g5
	fcmple32	%f30,	%f12,	%g2
	movleu	%xcc,	%l0,	%i3
	tle	%icc,	0x5
	movrgz	%l3,	%l2,	%o0
	fbge	%fcc3,	loop_1795
	movrgez	%o5,	0x063,	%l6
	mulscc	%i0,	%o1,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1795:
	edge16l	%i1,	%i7,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g3,	0x1829,	%i2
	move	%icc,	%o6,	%i5
	fmovrdne	%o3,	%f10,	%f0
	sdiv	%i6,	0x0192,	%o2
	edge16ln	%g1,	%l5,	%o4
	movvs	%xcc,	%l4,	%i4
	fmovd	%f22,	%f0
	edge16l	%g7,	%g4,	%g6
	fbul,a	%fcc1,	loop_1796
	be,a,pt	%icc,	loop_1797
	subc	%g2,	0x0166,	%l0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x56] %asi,	%i3
loop_1796:
	nop
	setx	loop_1798,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1797:
	tge	%xcc,	0x5
	sra	%g5,	0x14,	%l3
	te	%icc,	0x7
loop_1798:
	tl	%icc,	0x3
	bvc,pt	%icc,	loop_1799
	fabss	%f18,	%f19
	bcs,a,pt	%xcc,	loop_1800
	fmovsa	%icc,	%f22,	%f16
loop_1799:
	movrgez	%o0,	%l2,	%o5
	fpadd32	%f20,	%f20,	%f16
loop_1800:
	addc	%i0,	%l6,	%o7
	fbu,a	%fcc0,	loop_1801
	orn	%o1,	0x0D1F,	%i1
	edge8ln	%i7,	%l1,	%i2
	call	loop_1802
loop_1801:
	or	%o6,	%g3,	%o3
	edge8n	%i5,	%i6,	%g1
	tsubcc	%o2,	%o4,	%l5
loop_1802:
	edge32ln	%l4,	%i4,	%g7
	ldub	[%l7 + 0x3C],	%g6
	array16	%g2,	%l0,	%g4
	movg	%icc,	%i3,	%g5
	umul	%l3,	0x06B6,	%o0
	fnands	%f6,	%f10,	%f25
	xnorcc	%l2,	0x02D7,	%i0
	stw	%l6,	[%l7 + 0x10]
	alignaddr	%o5,	%o7,	%o1
	fmovspos	%icc,	%f12,	%f23
	fmul8x16au	%f16,	%f11,	%f0
	edge16n	%i1,	%i7,	%l1
	stw	%i2,	[%l7 + 0x5C]
	fbul,a	%fcc2,	loop_1803
	orncc	%g3,	0x01B7,	%o3
	nop
	setx loop_1804, %l0, %l1
	jmpl %l1, %i5
	fpack16	%f6,	%f26
loop_1803:
	ldsb	[%l7 + 0x15],	%o6
	flush	%l7 + 0x74
loop_1804:
	prefetch	[%l7 + 0x7C],	 0x2
	movrlez	%i6,	0x1E6,	%g1
	fcmps	%fcc2,	%f0,	%f30
	bneg,a,pn	%icc,	loop_1805
	array8	%o4,	%l5,	%o2
	tcc	%icc,	0x1
	mova	%icc,	%l4,	%i4
loop_1805:
	fxor	%f18,	%f22,	%f0
	fble,a	%fcc1,	loop_1806
	bleu,a,pn	%xcc,	loop_1807
	lduh	[%l7 + 0x26],	%g7
	edge16	%g6,	%l0,	%g2
loop_1806:
	edge8ln	%i3,	%g5,	%l3
loop_1807:
	subcc	%g4,	%o0,	%i0
	edge32l	%l6,	%l2,	%o7
	movne	%icc,	%o1,	%i1
	flush	%l7 + 0x68
	fmovsne	%xcc,	%f17,	%f10
	bl,a,pn	%xcc,	loop_1808
	movrgez	%i7,	0x36E,	%l1
	edge32	%o5,	%i2,	%g3
	fmovdcc	%icc,	%f29,	%f6
loop_1808:
	fbo	%fcc1,	loop_1809
	ldd	[%l7 + 0x08],	%i4
	sdiv	%o3,	0x1B09,	%o6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%i6
loop_1809:
	andn	%g1,	0x0D88,	%o4
	taddcctv	%o2,	0x01B7,	%l5
	movpos	%icc,	%i4,	%g7
	movrlz	%g6,	0x288,	%l4
	srax	%l0,	0x02,	%i3
	tg	%xcc,	0x0
	edge32l	%g2,	%g5,	%g4
	alignaddrl	%o0,	%i0,	%l6
	subc	%l3,	0x1B12,	%l2
	sth	%o1,	[%l7 + 0x7A]
	bgu,pn	%xcc,	loop_1810
	movrgez	%i1,	0x3A2,	%i7
	movge	%icc,	%o7,	%o5
	nop
	setx loop_1811, %l0, %l1
	jmpl %l1, %i2
loop_1810:
	fmovdge	%icc,	%f7,	%f29
	fnot2s	%f7,	%f21
	movgu	%xcc,	%g3,	%l1
loop_1811:
	sdiv	%o3,	0x14A6,	%o6
	fbg	%fcc1,	loop_1812
	edge8	%i5,	%g1,	%o4
	edge8n	%o2,	%l5,	%i4
	andncc	%i6,	%g6,	%g7
loop_1812:
	fbule	%fcc3,	loop_1813
	movrlez	%l0,	0x0CF,	%l4
	be,pt	%icc,	loop_1814
	membar	0x2D
loop_1813:
	mulx	%g2,	%i3,	%g5
	tleu	%icc,	0x2
loop_1814:
	fcmpgt32	%f8,	%f14,	%o0
	bcc	%xcc,	loop_1815
	mova	%icc,	%g4,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x3
loop_1815:
	ldsw	[%l7 + 0x2C],	%i0
	umul	%l3,	0x1407,	%o1
	movrlez	%i1,	%l2,	%o7
	fmul8x16au	%f31,	%f22,	%f4
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x6D] %asi,	%i7
	edge32l	%i2,	%g3,	%o5
	movne	%icc,	%o3,	%o6
	taddcc	%l1,	%g1,	%o4
	orn	%o2,	0x00B4,	%i5
	srlx	%i4,	%i6,	%l5
	stx	%g7,	[%l7 + 0x10]
	edge32ln	%g6,	%l4,	%l0
	bshuffle	%f18,	%f24,	%f28
	and	%g2,	%i3,	%o0
	alignaddrl	%g5,	%l6,	%g4
	umul	%i0,	0x17F2,	%l3
	tsubcctv	%i1,	0x1099,	%l2
	addc	%o7,	%o1,	%i7
	fcmpeq32	%f2,	%f26,	%g3
	ta	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc1,	loop_1816
	faligndata	%f30,	%f18,	%f2
	fmovrdlz	%o5,	%f20,	%f30
	tsubcctv	%i2,	%o6,	%l1
loop_1816:
	edge16n	%g1,	%o3,	%o4
	tn	%icc,	0x7
	tvc	%xcc,	0x5
	array32	%o2,	%i4,	%i6
	fpsub32	%f2,	%f18,	%f18
	orcc	%l5,	0x15EA,	%i5
	fmovdneg	%icc,	%f20,	%f11
	tcc	%icc,	0x0
	mulscc	%g7,	0x14D6,	%g6
	bshuffle	%f24,	%f12,	%f28
	fmovrdne	%l0,	%f8,	%f30
	bvc	%icc,	loop_1817
	ldd	[%l7 + 0x28],	%f30
	fcmple32	%f0,	%f8,	%l4
	array32	%g2,	%i3,	%o0
loop_1817:
	prefetch	[%l7 + 0x24],	 0x1
	fpackfix	%f24,	%f19
	edge8l	%g5,	%g4,	%i0
	udiv	%l6,	0x04C3,	%l3
	ta	%xcc,	0x1
	smulcc	%i1,	%o7,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%icc,	%f31,	%f2
	fmovsleu	%xcc,	%f9,	%f17
	bn	%xcc,	loop_1818
	fmovdcs	%xcc,	%f25,	%f14
	movvc	%icc,	%i7,	%o1
	xor	%o5,	0x02DC,	%g3
loop_1818:
	fmul8ulx16	%f22,	%f30,	%f0
	subc	%i2,	%l1,	%o6
	array32	%o3,	%g1,	%o4
	fnegd	%f20,	%f2
	std	%f16,	[%l7 + 0x08]
	membar	0x6B
	tg	%xcc,	0x4
	edge8	%o2,	%i6,	%i4
	movrgez	%l5,	%g7,	%i5
	edge16n	%g6,	%l0,	%g2
	set	0x44, %i4
	lda	[%l7 + %i4] 0x04,	%f15
	taddcctv	%i3,	%o0,	%l4
	fbul	%fcc1,	loop_1819
	subc	%g5,	%g4,	%l6
	smulcc	%i0,	%l3,	%o7
	fmovrslez	%i1,	%f9,	%f26
loop_1819:
	fmul8sux16	%f30,	%f6,	%f22
	be,a	%icc,	loop_1820
	tn	%xcc,	0x3
	membar	0x65
	fmovdvs	%xcc,	%f29,	%f17
loop_1820:
	ldsh	[%l7 + 0x2A],	%l2
	tn	%xcc,	0x3
	smul	%i7,	%o5,	%g3
	tcc	%xcc,	0x6
	srlx	%o1,	0x0A,	%i2
	movcs	%icc,	%l1,	%o6
	fble,a	%fcc3,	loop_1821
	sll	%o3,	%o4,	%g1
	mova	%xcc,	%i6,	%i4
	udivx	%o2,	0x1B29,	%g7
loop_1821:
	fabsd	%f28,	%f0
	alignaddr	%i5,	%g6,	%l0
	xnorcc	%l5,	0x0641,	%i3
	nop
	set	0x71, %l4
	stb	%o0,	[%l7 + %l4]
	movrgz	%g2,	%g5,	%l4
	edge16ln	%g4,	%l6,	%i0
	movl	%xcc,	%o7,	%l3
	subccc	%l2,	%i7,	%i1
	std	%g2,	[%l7 + 0x08]
	wr	%g0,	0x4f,	%asi
	stxa	%o5,	[%g0 + 0x0] %asi
	srax	%i2,	0x03,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o1,	%o3,	%o6
	mova	%xcc,	%g1,	%o4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x74] %asi,	%i6
	fmovrslez	%o2,	%f9,	%f18
	fcmpne32	%f0,	%f22,	%i4
	ldd	[%l7 + 0x08],	%f28
	fbn	%fcc0,	loop_1822
	tneg	%xcc,	0x0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%g6
loop_1822:
	udiv	%g7,	0x0D74,	%l0
	nop
	setx	loop_1823,	%l0,	%l1
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
	fandnot2	%f14,	%f16,	%f24
	subc	%i3,	%o0,	%l5
loop_1823:
	fsrc2	%f10,	%f8
	fpsub32s	%f14,	%f28,	%f1
	fnot2s	%f27,	%f30
	array16	%g2,	%g5,	%g4
	fandnot2s	%f26,	%f10,	%f23
	srlx	%l4,	%l6,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o7,	0x1F7B,	%l2
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x50] %asi,	%l3
	fbue,a	%fcc3,	loop_1824
	movvc	%icc,	%i1,	%i7
	udivcc	%g3,	0x0DD6,	%o5
	fsrc1s	%f6,	%f30
loop_1824:
	andn	%i2,	%l1,	%o3
	nop
	set	0x30, %o7
	ldd	[%l7 + %o7],	%f0
	umulcc	%o6,	%g1,	%o4
	fba,a	%fcc2,	loop_1825
	bne,pn	%icc,	loop_1826
	movleu	%xcc,	%o1,	%i6
	tcc	%xcc,	0x0
loop_1825:
	subccc	%i4,	%i5,	%g6
loop_1826:
	alignaddr	%g7,	%o2,	%i3
	tl	%icc,	0x5
	movle	%icc,	%l0,	%o0
	orcc	%l5,	%g5,	%g4
	set	0x0C, %l1
	ldstuba	[%l7 + %l1] 0x81,	%g2
	edge16ln	%l4,	%l6,	%i0
	edge8l	%o7,	%l3,	%i1
	fmovdle	%icc,	%f13,	%f15
	movneg	%xcc,	%i7,	%g3
	fmovsvc	%xcc,	%f17,	%f0
	bneg,a,pn	%xcc,	loop_1827
	fblg	%fcc1,	loop_1828
	fmovsl	%icc,	%f13,	%f3
	movrne	%l2,	%o5,	%l1
loop_1827:
	movn	%icc,	%i2,	%o6
loop_1828:
	tne	%xcc,	0x4
	array32	%g1,	%o4,	%o1
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o3
	stw	%i4,	[%l7 + 0x50]
	fmul8x16al	%f19,	%f28,	%f10
	stw	%i5,	[%l7 + 0x54]
	fblg,a	%fcc0,	loop_1829
	addc	%g6,	0x0182,	%i6
	or	%o2,	%i3,	%g7
	fexpand	%f28,	%f18
loop_1829:
	movne	%xcc,	%o0,	%l5
	ble,pn	%icc,	loop_1830
	fba,a	%fcc3,	loop_1831
	ldub	[%l7 + 0x33],	%g5
	movrlz	%g4,	0x0FE,	%l0
loop_1830:
	taddcctv	%g2,	%l4,	%i0
loop_1831:
	movcs	%icc,	%l6,	%l3
	fmovrse	%i1,	%f15,	%f10
	brlz	%o7,	loop_1832
	edge8ln	%g3,	%l2,	%o5
	edge8n	%l1,	%i7,	%o6
	movn	%icc,	%g1,	%i2
loop_1832:
	movrlez	%o4,	%o3,	%o1
	set	0x38, %o6
	stwa	%i5,	[%l7 + %o6] 0x27
	membar	#Sync
	edge16	%i4,	%g6,	%o2
	swap	[%l7 + 0x44],	%i6
	edge8n	%g7,	%i3,	%o0
	umul	%l5,	0x0CC1,	%g5
	te	%xcc,	0x4
	tsubcc	%l0,	0x01E7,	%g4
	nop
	setx loop_1833, %l0, %l1
	jmpl %l1, %l4
	fpsub32	%f12,	%f30,	%f4
	edge16l	%g2,	%l6,	%i0
	fmovdl	%xcc,	%f10,	%f12
loop_1833:
	nop
	set	0x74, %g7
	lduw	[%l7 + %g7],	%i1
	fmovscc	%xcc,	%f9,	%f18
	tge	%xcc,	0x7
	fmovdneg	%xcc,	%f9,	%f0
	fornot1s	%f16,	%f5,	%f29
	mova	%icc,	%l3,	%g3
	edge8	%l2,	%o7,	%o5
	ta	%icc,	0x4
	movl	%icc,	%l1,	%o6
	fmovrdlez	%g1,	%f8,	%f0
	edge16ln	%i2,	%o4,	%o3
	tge	%icc,	0x7
	lduw	[%l7 + 0x24],	%i7
	brnz	%o1,	loop_1834
	ldsw	[%l7 + 0x18],	%i4
	subccc	%i5,	0x0947,	%g6
	fpadd32s	%f21,	%f12,	%f2
loop_1834:
	alignaddr	%o2,	%g7,	%i6
	popc	%i3,	%o0
	tpos	%icc,	0x5
	fbul,a	%fcc3,	loop_1835
	brlz	%l5,	loop_1836
	xor	%l0,	0x1EA7,	%g4
	wr	%g0,	0x52,	%asi
	stxa	%l4,	[%g0 + 0x210] %asi
loop_1835:
	fsrc1s	%f15,	%f18
loop_1836:
	fcmpgt32	%f0,	%f10,	%g5
	movvc	%icc,	%g2,	%l6
	tge	%icc,	0x5
	tn	%icc,	0x6
	srl	%i0,	0x10,	%i1
	sdivcc	%g3,	0x041A,	%l2
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x60] %asi,	%o6
	nop
	set	0x34, %i2
	sth	%o5,	[%l7 + %i2]
	edge32ln	%l1,	%l3,	%o6
	fmovsn	%icc,	%f15,	%f10
	fmul8sux16	%f18,	%f14,	%f10
	edge16	%i2,	%o4,	%o3
	fbu	%fcc0,	loop_1837
	tpos	%icc,	0x1
	edge32	%i7,	%g1,	%i4
	bgu,pt	%xcc,	loop_1838
loop_1837:
	sdiv	%o1,	0x16BE,	%i5
	udivx	%o2,	0x1B23,	%g6
	fbule	%fcc3,	loop_1839
loop_1838:
	edge16n	%g7,	%i3,	%o0
	bg,a	loop_1840
	fmovdne	%icc,	%f7,	%f7
loop_1839:
	fmovrdgez	%l5,	%f16,	%f16
	edge32l	%l0,	%g4,	%i6
loop_1840:
	xnorcc	%g5,	%g2,	%l4
	tl	%xcc,	0x2
	fbn	%fcc1,	loop_1841
	stbar
	tl	%icc,	0x0
	sethi	0x1D4E,	%l6
loop_1841:
	edge8	%i0,	%g3,	%i1
	srax	%o7,	%o5,	%l1
	tleu	%xcc,	0x2
	sethi	0x004E,	%l3
	edge32n	%o6,	%l2,	%i2
	tcc	%icc,	0x2
	movrgez	%o4,	%i7,	%g1
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x10,	%f16
	fmovsleu	%icc,	%f11,	%f3
	fbul	%fcc2,	loop_1842
	fsrc2s	%f9,	%f29
	brz,a	%i4,	loop_1843
	fbg,a	%fcc0,	loop_1844
loop_1842:
	movvs	%xcc,	%o3,	%o1
	tle	%xcc,	0x0
loop_1843:
	bshuffle	%f16,	%f24,	%f14
loop_1844:
	fones	%f9
	edge32n	%o2,	%i5,	%g6
	membar	0x62
	taddcc	%g7,	%o0,	%l5
	tpos	%icc,	0x4
	fbug	%fcc0,	loop_1845
	movcs	%xcc,	%l0,	%g4
	brgz,a	%i3,	loop_1846
	umulcc	%g5,	%g2,	%l4
loop_1845:
	fpadd16s	%f15,	%f23,	%f29
	bcc	%xcc,	loop_1847
loop_1846:
	fmovrdne	%i6,	%f14,	%f6
	sdiv	%l6,	0x1820,	%g3
	movn	%xcc,	%i1,	%i0
loop_1847:
	movge	%xcc,	%o7,	%l1
	tne	%icc,	0x2
	sdiv	%o5,	0x1279,	%o6
	movrne	%l3,	%i2,	%o4
	fpackfix	%f4,	%f10
	movre	%l2,	0x08C,	%i7
	fmul8sux16	%f24,	%f14,	%f12
	movne	%xcc,	%g1,	%o3
	addccc	%i4,	%o1,	%o2
	umulcc	%g6,	%g7,	%o0
	srlx	%l5,	0x18,	%i5
	movpos	%icc,	%l0,	%i3
	fba,a	%fcc0,	loop_1848
	fmovdvc	%icc,	%f11,	%f15
	taddcc	%g4,	%g5,	%g2
	movgu	%xcc,	%i6,	%l6
loop_1848:
	subccc	%g3,	%l4,	%i0
	edge8l	%o7,	%i1,	%l1
	fcmpne32	%f14,	%f12,	%o5
	edge8	%o6,	%i2,	%o4
	ba,a,pt	%xcc,	loop_1849
	ldsb	[%l7 + 0x66],	%l3
	fpadd32	%f18,	%f26,	%f24
	flush	%l7 + 0x5C
loop_1849:
	ldub	[%l7 + 0x1A],	%l2
	fpadd16	%f12,	%f26,	%f24
	edge16ln	%g1,	%i7,	%i4
	taddcctv	%o3,	0x08A1,	%o1
	ldub	[%l7 + 0x65],	%g6
	set	0x08, %g4
	prefetcha	[%l7 + %g4] 0x81,	 0x2
	xor	%o2,	%o0,	%i5
	bneg,a,pt	%xcc,	loop_1850
	fmovdleu	%xcc,	%f9,	%f24
	membar	0x7D
	andcc	%l5,	0x1C00,	%l0
loop_1850:
	fbule,a	%fcc3,	loop_1851
	sll	%g4,	0x15,	%g5
	fmovdcc	%xcc,	%f15,	%f22
	fcmpne32	%f16,	%f14,	%i3
loop_1851:
	fmovsvc	%xcc,	%f21,	%f16
	bge,a,pn	%icc,	loop_1852
	edge16ln	%i6,	%g2,	%g3
	bvc,a,pt	%xcc,	loop_1853
	movne	%xcc,	%l6,	%i0
loop_1852:
	edge16	%o7,	%i1,	%l1
	fmovspos	%icc,	%f11,	%f17
loop_1853:
	lduw	[%l7 + 0x34],	%o5
	tsubcc	%o6,	0x02C6,	%i2
	tge	%icc,	0x1
	fmul8ulx16	%f14,	%f0,	%f18
	movn	%xcc,	%l4,	%l3
	fmovsgu	%icc,	%f23,	%f16
	orn	%o4,	0x0D49,	%g1
	edge8n	%i7,	%i4,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o1,	%g6,	%g7
	fcmpeq16	%f22,	%f14,	%o2
	or	%o0,	%o3,	%i5
	prefetch	[%l7 + 0x10],	 0x1
	tg	%icc,	0x6
	array32	%l0,	%g4,	%g5
	tcc	%icc,	0x6
	edge16n	%i3,	%l5,	%g2
	nop
	setx	loop_1854,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdgu	%xcc,	%f26,	%f9
	brgez	%i6,	loop_1855
	fmovdn	%xcc,	%f3,	%f27
loop_1854:
	tcs	%icc,	0x3
	tleu	%xcc,	0x2
loop_1855:
	bl,a,pn	%xcc,	loop_1856
	movleu	%icc,	%g3,	%i0
	movrlz	%l6,	%i1,	%o7
	umul	%l1,	0x18E2,	%o5
loop_1856:
	fmovscs	%icc,	%f8,	%f28
	fbue,a	%fcc3,	loop_1857
	subcc	%o6,	%l4,	%i2
	mulscc	%l3,	%g1,	%o4
	brgez	%i7,	loop_1858
loop_1857:
	mulx	%l2,	0x020C,	%o1
	fcmpeq16	%f2,	%f2,	%i4
	orncc	%g6,	0x1120,	%g7
loop_1858:
	fba	%fcc2,	loop_1859
	sub	%o2,	%o0,	%i5
	taddcctv	%l0,	0x046E,	%g4
	movre	%g5,	0x26A,	%o3
loop_1859:
	orcc	%l5,	%g2,	%i6
	swap	[%l7 + 0x74],	%i3
	tsubcc	%i0,	0x070F,	%l6
	subccc	%i1,	%g3,	%o7
	fmovdvs	%xcc,	%f4,	%f17
	fandnot1	%f24,	%f6,	%f12
	be	loop_1860
	orncc	%o5,	%o6,	%l1
	flush	%l7 + 0x5C
	movrgez	%i2,	0x3F0,	%l4
loop_1860:
	andncc	%l3,	%o4,	%g1
	udiv	%i7,	0x115B,	%l2
	edge8	%i4,	%o1,	%g6
	udivcc	%g7,	0x1AA9,	%o2
	xnorcc	%i5,	%o0,	%l0
	smul	%g5,	0x0A5F,	%o3
	smul	%g4,	0x005A,	%l5
	movre	%i6,	%g2,	%i0
	subccc	%i3,	0x09F3,	%i1
	addc	%g3,	0x0D42,	%o7
	movrlz	%l6,	0x36E,	%o6
	movleu	%xcc,	%o5,	%l1
	tpos	%xcc,	0x4
	sth	%i2,	[%l7 + 0x72]
	fbne,a	%fcc3,	loop_1861
	or	%l3,	0x0AB2,	%l4
	ldsh	[%l7 + 0x2A],	%o4
	fmovrsgez	%i7,	%f18,	%f0
loop_1861:
	ta	%xcc,	0x0
	tgu	%xcc,	0x5
	edge16n	%g1,	%i4,	%o1
	xorcc	%g6,	%g7,	%o2
	tle	%icc,	0x2
	fcmpgt16	%f2,	%f20,	%i5
	bgu,pt	%icc,	loop_1862
	fcmpeq16	%f10,	%f26,	%l2
	set	0x14, %g6
	stba	%l0,	[%l7 + %g6] 0x80
loop_1862:
	tl	%xcc,	0x3
	taddcc	%g5,	0x01F2,	%o3
	fmovdpos	%xcc,	%f14,	%f7
	tpos	%xcc,	0x0
	movge	%xcc,	%o0,	%l5
	fnors	%f27,	%f9,	%f7
	edge16ln	%i6,	%g4,	%i0
	ldx	[%l7 + 0x68],	%i3
	array32	%i1,	%g3,	%o7
	umulcc	%g2,	0x003D,	%o6
	movn	%xcc,	%l6,	%o5
	bg,a,pn	%icc,	loop_1863
	fmovsn	%xcc,	%f13,	%f3
	bcs	loop_1864
	fsrc2	%f10,	%f22
loop_1863:
	fmovde	%xcc,	%f31,	%f11
	array8	%i2,	%l1,	%l4
loop_1864:
	edge16ln	%o4,	%l3,	%i7
	movre	%i4,	%o1,	%g1
	bn,pt	%xcc,	loop_1865
	edge32ln	%g6,	%o2,	%i5
	bvs,pn	%xcc,	loop_1866
	movcs	%icc,	%g7,	%l2
loop_1865:
	orn	%l0,	%o3,	%o0
	sllx	%g5,	0x04,	%l5
loop_1866:
	sethi	0x0047,	%i6
	mova	%icc,	%i0,	%g4
	andn	%i1,	0x0C7C,	%g3
	movg	%icc,	%i3,	%o7
	addc	%g2,	%o6,	%l6
	brnz,a	%o5,	loop_1867
	brnz,a	%l1,	loop_1868
	subccc	%l4,	0x13B0,	%i2
	alignaddrl	%o4,	%i7,	%l3
loop_1867:
	fnor	%f30,	%f30,	%f4
loop_1868:
	tl	%icc,	0x2
	xnor	%i4,	0x1DBB,	%o1
	fmovsleu	%xcc,	%f9,	%f17
	edge16l	%g1,	%o2,	%i5
	bleu,pt	%xcc,	loop_1869
	addcc	%g6,	0x1423,	%g7
	sdivx	%l2,	0x1436,	%l0
	edge32	%o0,	%o3,	%l5
loop_1869:
	nop
	wr	%g0,	0xe2,	%asi
	stba	%g5,	[%l7 + 0x71] %asi
	membar	#Sync
	set	0x60, %l5
	ldda	[%l7 + %l5] 0x19,	%i0
	subccc	%i6,	%g4,	%i1
	wr	%g0,	0x88,	%asi
	sta	%f10,	[%l7 + 0x74] %asi
	be	%xcc,	loop_1870
	smulcc	%g3,	0x0470,	%i3
	edge32	%o7,	%g2,	%o6
	movneg	%xcc,	%o5,	%l6
loop_1870:
	sethi	0x136E,	%l4
	tn	%icc,	0x0
	alignaddrl	%i2,	%l1,	%o4
	fabss	%f31,	%f31
	udivx	%i7,	0x1AC1,	%l3
	fnegs	%f26,	%f28
	stbar
	tcc	%xcc,	0x4
	tpos	%xcc,	0x7
	movrgz	%i4,	%g1,	%o2
	fmovrdgez	%o1,	%f22,	%f6
	addcc	%i5,	0x14B4,	%g6
	bcs,a,pn	%icc,	loop_1871
	fmovsne	%icc,	%f30,	%f10
	fbg	%fcc3,	loop_1872
	edge32l	%l2,	%l0,	%o0
loop_1871:
	sth	%g7,	[%l7 + 0x66]
	fbn,a	%fcc2,	loop_1873
loop_1872:
	fmul8x16au	%f26,	%f24,	%f24
	sethi	0x09B4,	%o3
	fbge,a	%fcc0,	loop_1874
loop_1873:
	brgz	%g5,	loop_1875
	movn	%xcc,	%i0,	%i6
	mulscc	%l5,	%i1,	%g4
loop_1874:
	fmul8x16al	%f9,	%f23,	%f12
loop_1875:
	edge16l	%i3,	%g3,	%o7
	edge32	%g2,	%o6,	%o5
	fandnot2	%f22,	%f8,	%f28
	fmovscs	%xcc,	%f10,	%f24
	udiv	%l4,	0x0932,	%l6
	umul	%l1,	%o4,	%i7
	andncc	%l3,	%i4,	%i2
	alignaddrl	%o2,	%g1,	%o1
	std	%f8,	[%l7 + 0x08]
	bvs,a	loop_1876
	movl	%icc,	%i5,	%l2
	fmovsl	%xcc,	%f10,	%f27
	fxor	%f22,	%f4,	%f12
loop_1876:
	addc	%l0,	0x0A5F,	%g6
	movg	%xcc,	%o0,	%o3
	fmovsl	%icc,	%f12,	%f12
	xnorcc	%g7,	0x1EA7,	%i0
	popc	%i6,	%g5
	alignaddr	%l5,	%i1,	%g4
	udiv	%g3,	0x0F69,	%o7
	fmovrdne	%i3,	%f2,	%f2
	subccc	%o6,	%g2,	%l4
	addccc	%l6,	0x12C6,	%o5
	lduh	[%l7 + 0x16],	%l1
	andncc	%o4,	%l3,	%i7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%i2
	fmovdn	%xcc,	%f3,	%f27
	mulscc	%o2,	0x0D06,	%g1
	tvs	%xcc,	0x1
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x11
	fnands	%f25,	%f4,	%f23
	tvc	%icc,	0x1
	srlx	%i5,	%o1,	%l2
	addc	%l0,	0x01E3,	%o0
	edge8n	%g6,	%g7,	%i0
	movleu	%xcc,	%o3,	%i6
	ta	%icc,	0x0
	fcmpeq32	%f8,	%f4,	%g5
	tgu	%icc,	0x3
	set	0x1C, %o2
	stha	%i1,	[%l7 + %o2] 0x18
	add	%g4,	%g3,	%l5
	fnands	%f3,	%f27,	%f15
	bpos	loop_1877
	movg	%icc,	%i3,	%o7
	set	0x50, %o5
	ldda	[%l7 + %o5] 0x89,	%g2
loop_1877:
	flush	%l7 + 0x3C
	tpos	%icc,	0x0
	bn,a	loop_1878
	std	%l4,	[%l7 + 0x20]
	set	0x20, %i0
	ldxa	[%g0 + %i0] 0x58,	%o6
loop_1878:
	fbu	%fcc3,	loop_1879
	bl	loop_1880
	tleu	%xcc,	0x6
	fmovsn	%xcc,	%f30,	%f27
loop_1879:
	udiv	%l6,	0x11C0,	%o5
loop_1880:
	pdist	%f8,	%f22,	%f16
	array32	%o4,	%l3,	%l1
	xnor	%i7,	%i2,	%o2
	umulcc	%i4,	0x0BA4,	%g1
	brnz	%i5,	loop_1881
	prefetch	[%l7 + 0x58],	 0x1
	fmovse	%xcc,	%f4,	%f5
	tcc	%icc,	0x7
loop_1881:
	fmovrdlz	%o1,	%f30,	%f22
	tcs	%icc,	0x4
	and	%l2,	%l0,	%g6
	fmovdneg	%icc,	%f8,	%f14
	mulx	%g7,	%o0,	%i0
	te	%icc,	0x3
	bg,pt	%icc,	loop_1882
	movleu	%xcc,	%o3,	%g5
	edge8	%i6,	%i1,	%g3
	tcc	%icc,	0x0
loop_1882:
	siam	0x0
	xnor	%l5,	0x1DEB,	%g4
	movrgez	%i3,	0x207,	%g2
	tcs	%icc,	0x1
	set	0x31, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o7
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x60] %asi,	%l4
	flush	%l7 + 0x38
	srax	%l6,	%o6,	%o4
	sllx	%o5,	%l3,	%l1
	std	%f24,	[%l7 + 0x68]
	fnot1s	%f5,	%f4
	fornot1s	%f12,	%f19,	%f19
	movrgz	%i7,	%i2,	%i4
	tg	%xcc,	0x7
	movneg	%icc,	%g1,	%o2
	ta	%icc,	0x1
	fbe	%fcc0,	loop_1883
	swap	[%l7 + 0x20],	%o1
	tsubcctv	%i5,	%l2,	%g6
	tn	%xcc,	0x1
loop_1883:
	bpos,pt	%xcc,	loop_1884
	bcc,a	loop_1885
	tcs	%xcc,	0x2
	fcmps	%fcc0,	%f12,	%f31
loop_1884:
	fpsub32	%f0,	%f14,	%f14
loop_1885:
	orcc	%g7,	0x15CF,	%l0
	orncc	%o0,	%i0,	%g5
	edge32ln	%i6,	%i1,	%o3
	fmovdn	%icc,	%f3,	%f10
	edge32	%l5,	%g3,	%i3
	movn	%icc,	%g2,	%g4
	smul	%l4,	%o7,	%l6
	edge16	%o6,	%o5,	%l3
	and	%l1,	%i7,	%o4
	brnz	%i2,	loop_1886
	edge32n	%i4,	%g1,	%o2
	fpackfix	%f4,	%f12
	st	%f24,	[%l7 + 0x48]
loop_1886:
	sir	0x08FE
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x39] %asi,	%i5
	subc	%l2,	%g6,	%g7
	or	%o1,	%o0,	%l0
	umul	%g5,	%i6,	%i0
	set	0x11, %o1
	stba	%o3,	[%l7 + %o1] 0x0c
	fcmpgt16	%f12,	%f22,	%i1
	edge16n	%l5,	%i3,	%g3
	alignaddrl	%g4,	%g2,	%o7
	mulscc	%l6,	0x0457,	%l4
	movvs	%xcc,	%o6,	%o5
	tcs	%icc,	0x3
	fcmpd	%fcc3,	%f30,	%f22
	andncc	%l1,	%l3,	%i7
	umulcc	%i2,	0x029D,	%i4
	movre	%g1,	%o2,	%o4
	fbue	%fcc2,	loop_1887
	tleu	%xcc,	0x4
	edge16n	%l2,	%i5,	%g7
	flush	%l7 + 0x74
loop_1887:
	std	%f26,	[%l7 + 0x50]
	fmovdgu	%icc,	%f0,	%f29
	movle	%xcc,	%o1,	%g6
	tcs	%xcc,	0x3
	xnor	%l0,	%g5,	%o0
	sdiv	%i0,	0x0A56,	%i6
	tle	%xcc,	0x0
	orn	%o3,	%i1,	%l5
	std	%f16,	[%l7 + 0x40]
	subccc	%i3,	0x0728,	%g3
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	bcs,pt	%xcc,	loop_1888
	edge32ln	%o7,	%l6,	%l4
	fmovrsgez	%o6,	%f0,	%f12
	tcc	%icc,	0x7
loop_1888:
	orncc	%g4,	0x172E,	%l1
	movrlz	%o5,	0x30B,	%l3
	or	%i7,	0x1313,	%i2
	edge8ln	%i4,	%g1,	%o4
	fnegs	%f15,	%f19
	edge32ln	%l2,	%i5,	%o2
	fmovda	%xcc,	%f15,	%f29
	movrlez	%o1,	%g7,	%g6
	movvc	%xcc,	%l0,	%g5
	tne	%xcc,	0x6
	mulx	%o0,	0x1D0E,	%i0
	membar	0x05
	fzero	%f12
	ldub	[%l7 + 0x28],	%o3
	fmovsgu	%xcc,	%f24,	%f11
	wr	%g0,	0x89,	%asi
	stxa	%i6,	[%l7 + 0x60] %asi
	udivx	%l5,	0x10D9,	%i3
	tneg	%icc,	0x1
	umul	%i1,	%g2,	%o7
	mova	%xcc,	%l6,	%g3
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o6
	sdivcc	%g4,	0x0D8C,	%l1
	fmovrsgez	%o5,	%f25,	%f28
	array8	%l3,	%i7,	%i2
	be	%xcc,	loop_1889
	array16	%i4,	%g1,	%l4
	movcc	%icc,	%o4,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1889:
	fcmps	%fcc3,	%f29,	%f26
	nop
	setx loop_1890, %l0, %l1
	jmpl %l1, %o2
	fnand	%f28,	%f18,	%f26
	te	%xcc,	0x1
	array16	%i5,	%o1,	%g7
loop_1890:
	fone	%f0
	sub	%g6,	%l0,	%g5
	edge8	%i0,	%o0,	%i6
	bneg,a,pn	%icc,	loop_1891
	tle	%xcc,	0x7
	edge8	%l5,	%i3,	%o3
	membar	0x76
loop_1891:
	brgz,a	%g2,	loop_1892
	ld	[%l7 + 0x7C],	%f21
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o7
loop_1892:
	ba,a	%xcc,	loop_1893
	be,a	%icc,	loop_1894
	movrlez	%l6,	0x196,	%g3
	tgu	%xcc,	0x7
loop_1893:
	alignaddr	%i1,	%g4,	%l1
loop_1894:
	movvc	%xcc,	%o5,	%l3
	edge32n	%i7,	%i2,	%o6
	alignaddrl	%g1,	%l4,	%i4
	brgez,a	%l2,	loop_1895
	tcs	%icc,	0x2
	movrgz	%o4,	0x12C,	%o2
	fsrc2s	%f22,	%f16
loop_1895:
	fsrc2	%f20,	%f14
	fmovrde	%o1,	%f2,	%f14
	fmul8x16	%f2,	%f0,	%f24
	alignaddrl	%g7,	%g6,	%i5
	move	%xcc,	%l0,	%g5
	movvs	%icc,	%o0,	%i6
	ldd	[%l7 + 0x38],	%i0
	std	%i2,	[%l7 + 0x10]
	fabsd	%f30,	%f26
	ldstub	[%l7 + 0x4E],	%l5
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
	std	%g2,	[%l7 + 0x70]
	srax	%o7,	0x0F,	%l6
	bn	loop_1896
	or	%g3,	0x0DA2,	%i1
	movneg	%xcc,	%g4,	%l1
	srax	%l3,	%i7,	%o5
loop_1896:
	fbge	%fcc3,	loop_1897
	sth	%o6,	[%l7 + 0x5A]
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x16] %asi,	%i2
loop_1897:
	bvc,a,pn	%xcc,	loop_1898
	tpos	%icc,	0x1
	movg	%xcc,	%l4,	%i4
	set	0x68, %g3
	stda	%l2,	[%l7 + %g3] 0xe2
	membar	#Sync
loop_1898:
	fbul	%fcc2,	loop_1899
	fones	%f24
	fmovrdgez	%g1,	%f0,	%f18
	tg	%icc,	0x5
loop_1899:
	smulcc	%o4,	%o2,	%g7
	edge8l	%g6,	%o1,	%i5
	fzero	%f28
	bn	loop_1900
	mulscc	%l0,	%g5,	%o0
	fbule,a	%fcc1,	loop_1901
	fbug,a	%fcc0,	loop_1902
loop_1900:
	fmovsne	%xcc,	%f1,	%f5
	ta	%xcc,	0x5
loop_1901:
	tsubcc	%i6,	0x079C,	%i0
loop_1902:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l5,	%i3
	subccc	%o3,	0x0AB7,	%g2
	mulscc	%o7,	0x1484,	%l6
	brz	%g3,	loop_1903
	fble	%fcc0,	loop_1904
	bcc,a,pn	%xcc,	loop_1905
	fandnot2	%f2,	%f28,	%f18
loop_1903:
	movrne	%g4,	0x365,	%i1
loop_1904:
	nop
	set	0x0C, %l6
	stwa	%l1,	[%l7 + %l6] 0xe2
	membar	#Sync
loop_1905:
	fmovsgu	%icc,	%f17,	%f20
	array32	%i7,	%l3,	%o5
	movg	%icc,	%i2,	%o6
	nop
	setx	loop_1906,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdvs	%xcc,	%f20,	%f29
	fnegd	%f22,	%f22
	taddcctv	%i4,	%l4,	%l2
loop_1906:
	fnand	%f26,	%f30,	%f22
	tleu	%xcc,	0x0
	fnands	%f21,	%f23,	%f21
	srax	%o4,	%o2,	%g1
	mulscc	%g6,	0x0C40,	%o1
	ldub	[%l7 + 0x2F],	%g7
	fpadd32	%f20,	%f20,	%f2
	edge8	%l0,	%i5,	%g5
	array16	%i6,	%i0,	%l5
	sra	%i3,	0x00,	%o3
	orcc	%o0,	%g2,	%l6
	edge8ln	%o7,	%g4,	%g3
	fmovdgu	%xcc,	%f10,	%f1
	sll	%l1,	%i1,	%l3
	udivx	%i7,	0x09BF,	%i2
	fmovda	%icc,	%f9,	%f8
	mulscc	%o5,	%o6,	%i4
	alignaddr	%l4,	%l2,	%o4
	fbl,a	%fcc0,	loop_1907
	fbo	%fcc0,	loop_1908
	orncc	%g1,	%o2,	%g6
	tpos	%icc,	0x4
loop_1907:
	sra	%o1,	0x1D,	%l0
loop_1908:
	tcs	%icc,	0x2
	udivx	%g7,	0x00B8,	%i5
	alignaddr	%i6,	%i0,	%l5
	mulx	%i3,	0x1D0D,	%o3
	subcc	%g5,	%o0,	%l6
	fmovdne	%xcc,	%f7,	%f31
	set	0x70, %l3
	lda	[%l7 + %l3] 0x18,	%f12
	fbg	%fcc0,	loop_1909
	movrlz	%g2,	%o7,	%g4
	sdiv	%g3,	0x0F68,	%l1
	tvc	%icc,	0x2
loop_1909:
	ld	[%l7 + 0x1C],	%f13
	bneg	%xcc,	loop_1910
	taddcctv	%l3,	0x10E0,	%i1
	te	%icc,	0x3
	tne	%icc,	0x5
loop_1910:
	addc	%i7,	0x0980,	%i2
	fmovsge	%icc,	%f25,	%f21
	subcc	%o5,	0x0860,	%i4
	array32	%l4,	%o6,	%l2
	ta	%xcc,	0x6
	fmovsgu	%xcc,	%f29,	%f15
	mova	%xcc,	%o4,	%g1
	array32	%o2,	%o1,	%l0
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x70] %asi,	%g7
	set	0x3C, %g2
	ldswa	[%l7 + %g2] 0x11,	%i5
	array32	%g6,	%i0,	%l5
	edge8ln	%i3,	%i6,	%g5
	movne	%icc,	%o0,	%l6
	xorcc	%g2,	%o3,	%g4
	movpos	%xcc,	%g3,	%l1
	srax	%o7,	%l3,	%i7
	sethi	0x1965,	%i2
	tvc	%icc,	0x5
	sdivx	%i1,	0x07E3,	%i4
	fbu	%fcc1,	loop_1911
	edge32l	%o5,	%o6,	%l4
	movcs	%xcc,	%o4,	%g1
	set	0x10, %i3
	ldxa	[%l7 + %i3] 0x0c,	%l2
loop_1911:
	fnot1s	%f9,	%f27
	subc	%o1,	%l0,	%o2
	tsubcc	%g7,	0x156D,	%g6
	ldd	[%l7 + 0x18],	%f18
	tle	%icc,	0x0
	set	0x1C, %g5
	lduwa	[%l7 + %g5] 0x11,	%i0
	be,pt	%icc,	loop_1912
	fpadd32	%f20,	%f4,	%f24
	movrgez	%l5,	0x2A8,	%i3
	fmovrdne	%i5,	%f26,	%f10
loop_1912:
	fand	%f22,	%f0,	%f26
	tl	%icc,	0x1
	set	0x62, %i1
	stba	%g5,	[%l7 + %i1] 0xeb
	membar	#Sync
	subc	%i6,	%o0,	%g2
	fble	%fcc2,	loop_1913
	sllx	%o3,	0x0D,	%l6
	fone	%f22
	tvc	%xcc,	0x6
loop_1913:
	nop
	wr	%g0,	0x11,	%asi
	stda	%g2,	[%l7 + 0x28] %asi
	mulscc	%g4,	0x091B,	%l1
	tsubcc	%l3,	%o7,	%i2
	srlx	%i7,	0x0C,	%i1
	xnorcc	%o5,	%i4,	%l4
	alignaddr	%o4,	%g1,	%l2
	fmovdgu	%icc,	%f6,	%f2
	fbne	%fcc2,	loop_1914
	fbne,a	%fcc2,	loop_1915
	movgu	%icc,	%o1,	%o6
	alignaddr	%l0,	%o2,	%g6
loop_1914:
	tpos	%xcc,	0x2
loop_1915:
	smul	%i0,	%g7,	%i3
	fsrc1s	%f14,	%f19
	edge8ln	%i5,	%l5,	%i6
	fnot1	%f22,	%f4
	orcc	%o0,	0x0DBC,	%g5
	udiv	%o3,	0x17AB,	%l6
	subcc	%g2,	%g4,	%l1
	alignaddr	%l3,	%g3,	%i2
	alignaddr	%i7,	%o7,	%o5
	tpos	%xcc,	0x1
	mulscc	%i4,	%l4,	%o4
	sth	%g1,	[%l7 + 0x6A]
	fcmpes	%fcc0,	%f29,	%f23
	fpackfix	%f4,	%f24
	xorcc	%l2,	%i1,	%o6
	fcmpne16	%f12,	%f22,	%o1
	edge32	%l0,	%o2,	%g6
	taddcc	%i0,	0x1D71,	%i3
	umulcc	%i5,	%g7,	%i6
	movcc	%xcc,	%l5,	%g5
	taddcc	%o3,	0x13BC,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x58] %asi,	%f27
	fmovrsne	%o0,	%f23,	%f30
	srl	%g2,	0x02,	%l1
	srlx	%l3,	%g3,	%i2
	andcc	%g4,	%o7,	%o5
	movvs	%xcc,	%i4,	%i7
	set	0x47, %i7
	lduba	[%l7 + %i7] 0x89,	%l4
	fbuge,a	%fcc1,	loop_1916
	fand	%f12,	%f4,	%f20
	fmuld8sux16	%f22,	%f15,	%f22
	array8	%o4,	%g1,	%l2
loop_1916:
	taddcctv	%o6,	%o1,	%l0
	movl	%icc,	%o2,	%g6
	nop
	setx loop_1917, %l0, %l1
	jmpl %l1, %i1
	fbg,a	%fcc3,	loop_1918
	movn	%icc,	%i3,	%i5
	fmovsne	%xcc,	%f4,	%f24
loop_1917:
	fmovsg	%icc,	%f15,	%f13
loop_1918:
	movrlz	%i0,	0x206,	%i6
	mova	%xcc,	%g7,	%l5
	udivx	%g5,	0x083A,	%o3
	bshuffle	%f12,	%f12,	%f16
	fcmpgt16	%f18,	%f8,	%o0
	fcmpne16	%f14,	%f22,	%l6
	brlz	%l1,	loop_1919
	fbue	%fcc1,	loop_1920
	or	%l3,	%g3,	%i2
	brgez,a	%g4,	loop_1921
loop_1919:
	fbu	%fcc3,	loop_1922
loop_1920:
	sra	%g2,	%o5,	%o7
	tcs	%xcc,	0x3
loop_1921:
	lduw	[%l7 + 0x58],	%i4
loop_1922:
	edge32	%l4,	%o4,	%g1
	stx	%i7,	[%l7 + 0x78]
	tleu	%xcc,	0x1
	mova	%icc,	%o6,	%l2
	nop
	set	0x42, %o3
	sth	%l0,	[%l7 + %o3]
	popc	%o1,	%g6
	sra	%i1,	%o2,	%i5
	fandnot1	%f4,	%f14,	%f30
	fmovdle	%xcc,	%f21,	%f5
	popc	0x12D4,	%i3
	brnz	%i0,	loop_1923
	fmovsl	%icc,	%f12,	%f10
	movcc	%icc,	%g7,	%i6
	tgu	%xcc,	0x7
loop_1923:
	fmovdn	%xcc,	%f28,	%f13
	movneg	%icc,	%l5,	%o3
	tgu	%xcc,	0x4
	move	%xcc,	%g5,	%o0
	ldx	[%l7 + 0x18],	%l1
	movrgez	%l3,	%g3,	%i2
	addccc	%l6,	0x0002,	%g2
	movn	%icc,	%g4,	%o5
	fbe,a	%fcc2,	loop_1924
	ble	%xcc,	loop_1925
	srax	%o7,	0x1D,	%i4
	membar	0x7F
loop_1924:
	tg	%xcc,	0x5
loop_1925:
	tge	%icc,	0x3
	tcs	%icc,	0x5
	subcc	%l4,	%g1,	%o4
	movneg	%xcc,	%o6,	%l2
	and	%l0,	0x06D9,	%i7
	fbge	%fcc0,	loop_1926
	movgu	%xcc,	%g6,	%i1
	addc	%o2,	0x1373,	%i5
	bneg	%icc,	loop_1927
loop_1926:
	stbar
	bvc,pt	%icc,	loop_1928
	popc	%o1,	%i3
loop_1927:
	fmovdgu	%xcc,	%f4,	%f0
	tg	%xcc,	0x4
loop_1928:
	addcc	%g7,	%i0,	%l5
	mulscc	%i6,	%o3,	%g5
	te	%xcc,	0x4
	movvs	%xcc,	%l1,	%l3
	xnorcc	%o0,	%i2,	%l6
	ldd	[%l7 + 0x38],	%g2
	std	%f10,	[%l7 + 0x28]
	umul	%g3,	%o5,	%g4
	tg	%icc,	0x5
	movleu	%icc,	%o7,	%l4
	movcs	%xcc,	%i4,	%o4
	umul	%o6,	0x191E,	%l2
	bneg,a,pn	%xcc,	loop_1929
	fnor	%f12,	%f28,	%f8
	movre	%g1,	0x12A,	%i7
	stw	%g6,	[%l7 + 0x2C]
loop_1929:
	bneg,a	loop_1930
	ba	loop_1931
	smulcc	%l0,	%o2,	%i1
	tcs	%xcc,	0x1
loop_1930:
	edge16n	%i5,	%i3,	%o1
loop_1931:
	umul	%i0,	0x17D2,	%l5
	fmovsge	%xcc,	%f27,	%f29
	set	0x30, %g1
	stha	%i6,	[%l7 + %g1] 0x22
	membar	#Sync
	set	0x28, %l2
	ldsha	[%l7 + %l2] 0x18,	%g7
	ble	%icc,	loop_1932
	xorcc	%o3,	0x1CFB,	%g5
	taddcctv	%l1,	%o0,	%i2
	set	0x5A, %o4
	ldsba	[%l7 + %o4] 0x10,	%l3
loop_1932:
	orn	%g2,	0x16DB,	%l6
	edge8ln	%g3,	%g4,	%o7
	fbe,a	%fcc0,	loop_1933
	fbo,a	%fcc0,	loop_1934
	fcmpeq32	%f14,	%f12,	%o5
	udivx	%i4,	0x0815,	%o4
loop_1933:
	mulscc	%l4,	%l2,	%o6
loop_1934:
	udiv	%g1,	0x1A1F,	%g6
	fxors	%f16,	%f13,	%f11
	fcmpgt16	%f2,	%f8,	%l0
	array32	%o2,	%i1,	%i5
	edge32l	%i3,	%o1,	%i0
	ldx	[%l7 + 0x40],	%i7
	fxors	%f10,	%f15,	%f3
	fmovscc	%icc,	%f5,	%f28
	stw	%l5,	[%l7 + 0x48]
	movg	%icc,	%g7,	%o3
	fblg	%fcc0,	loop_1935
	fpadd16s	%f29,	%f5,	%f3
	st	%f5,	[%l7 + 0x0C]
	or	%i6,	0x09AA,	%g5
loop_1935:
	fbul,a	%fcc2,	loop_1936
	edge8	%o0,	%i2,	%l3
	tg	%xcc,	0x4
	tg	%icc,	0x6
loop_1936:
	movre	%g2,	%l6,	%l1
	bn	loop_1937
	xnorcc	%g3,	%g4,	%o5
	brlez,a	%i4,	loop_1938
	fcmpd	%fcc1,	%f6,	%f26
loop_1937:
	fmovsge	%xcc,	%f28,	%f1
	fxnors	%f27,	%f16,	%f11
loop_1938:
	bl,pt	%icc,	loop_1939
	tneg	%xcc,	0x3
	bcc,pt	%xcc,	loop_1940
	andncc	%o4,	%l4,	%l2
loop_1939:
	fmovdg	%icc,	%f3,	%f7
	fmovdpos	%xcc,	%f20,	%f14
loop_1940:
	movl	%xcc,	%o7,	%o6
	tcc	%icc,	0x5
	fornot1	%f0,	%f16,	%f26
	ble,a,pt	%icc,	loop_1941
	edge8ln	%g6,	%g1,	%l0
	fmovdvc	%xcc,	%f23,	%f0
	movrlz	%i1,	0x2D6,	%i5
loop_1941:
	sllx	%o2,	%i3,	%i0
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x13] %asi,	%o1
	tleu	%xcc,	0x0
	bneg,a,pt	%xcc,	loop_1942
	fcmped	%fcc1,	%f26,	%f8
	brz	%l5,	loop_1943
	fpsub32s	%f2,	%f21,	%f7
loop_1942:
	subcc	%i7,	%g7,	%o3
	tcc	%icc,	0x3
loop_1943:
	movl	%xcc,	%i6,	%o0
	ble,a	%xcc,	loop_1944
	edge16ln	%g5,	%i2,	%l3
	ldsw	[%l7 + 0x1C],	%l6
	fpadd16s	%f13,	%f11,	%f10
loop_1944:
	lduh	[%l7 + 0x66],	%l1
	srl	%g3,	0x10,	%g2
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x19,	%o4
	edge16	%i4,	%o4,	%g4
	fabss	%f19,	%f18
	move	%icc,	%l4,	%o7
	fnors	%f0,	%f21,	%f8
	fmovrsgz	%l2,	%f23,	%f27
	fmul8sux16	%f4,	%f18,	%f26
	set	0x48, %l4
	stha	%o6,	[%l7 + %l4] 0x27
	membar	#Sync
	addccc	%g1,	0x19B2,	%l0
	tne	%xcc,	0x6
	be,pn	%xcc,	loop_1945
	movcc	%xcc,	%g6,	%i5
	bcs,a	%icc,	loop_1946
	fcmpne32	%f4,	%f22,	%o2
loop_1945:
	fors	%f1,	%f24,	%f31
	movrne	%i1,	%i3,	%o1
loop_1946:
	nop
	set	0x31, %i5
	ldsba	[%l7 + %i5] 0x15,	%l5
	andncc	%i0,	%i7,	%o3
	set	0x58, %o7
	lduha	[%l7 + %o7] 0x18,	%i6
	movrgz	%o0,	%g5,	%i2
	xorcc	%g7,	0x1080,	%l6
	ldstub	[%l7 + 0x72],	%l3
	membar	0x49
	fmovrdlez	%l1,	%f2,	%f18
	fbug,a	%fcc2,	loop_1947
	fmovrsne	%g3,	%f6,	%f25
	fmovdg	%xcc,	%f7,	%f31
	srlx	%g2,	0x1B,	%i4
loop_1947:
	edge8l	%o4,	%g4,	%o5
	tne	%icc,	0x7
	fornot2	%f10,	%f8,	%f0
	fsrc1	%f16,	%f28
	tleu	%icc,	0x6
	movrgz	%o7,	%l2,	%l4
	edge16	%g1,	%o6,	%g6
	swap	[%l7 + 0x44],	%l0
	edge8l	%o2,	%i1,	%i3
	fmovrsgz	%i5,	%f10,	%f29
	std	%l4,	[%l7 + 0x20]
	wr	%g0,	0xe2,	%asi
	stwa	%o1,	[%l7 + 0x70] %asi
	membar	#Sync
	mulx	%i7,	%o3,	%i6
	flush	%l7 + 0x7C
	popc	0x04A1,	%o0
	brnz,a	%i0,	loop_1948
	ldsb	[%l7 + 0x5D],	%i2
	bl,pn	%icc,	loop_1949
	edge32n	%g5,	%g7,	%l6
loop_1948:
	mova	%xcc,	%l3,	%g3
	fpadd16	%f0,	%f14,	%f12
loop_1949:
	tge	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%l1,	[%l7 + 0x18]
	nop
	setx loop_1950, %l0, %l1
	jmpl %l1, %i4
	bleu,a	%icc,	loop_1951
	fmovdvc	%xcc,	%f22,	%f1
	tsubcc	%g2,	%o4,	%g4
loop_1950:
	tge	%icc,	0x7
loop_1951:
	taddcc	%o5,	0x1D32,	%l2
	tsubcc	%l4,	%o7,	%g1
	fxnor	%f30,	%f0,	%f12
	ble,a,pt	%icc,	loop_1952
	orn	%g6,	0x027B,	%l0
	bne,pn	%xcc,	loop_1953
	edge32n	%o2,	%o6,	%i3
loop_1952:
	movgu	%xcc,	%i1,	%l5
	edge8n	%i5,	%i7,	%o3
loop_1953:
	movgu	%icc,	%o1,	%o0
	sdiv	%i0,	0x05F7,	%i2
	fbue	%fcc3,	loop_1954
	fble	%fcc1,	loop_1955
	movrgz	%g5,	0x164,	%i6
	fbule,a	%fcc0,	loop_1956
loop_1954:
	orcc	%g7,	0x0558,	%l3
loop_1955:
	fbo	%fcc3,	loop_1957
	movle	%icc,	%l6,	%g3
loop_1956:
	fpadd32s	%f12,	%f8,	%f15
	bpos,a,pt	%icc,	loop_1958
loop_1957:
	fmovdneg	%xcc,	%f25,	%f10
	popc	%i4,	%g2
	tleu	%xcc,	0x5
loop_1958:
	membar	0x2E
	set	0x44, %o6
	lda	[%l7 + %o6] 0x15,	%f0
	sethi	0x0925,	%o4
	edge32n	%g4,	%l1,	%l2
	fbule,a	%fcc0,	loop_1959
	xnor	%o5,	%l4,	%o7
	ldsh	[%l7 + 0x78],	%g1
	movne	%icc,	%g6,	%o2
loop_1959:
	bneg,pt	%icc,	loop_1960
	tleu	%icc,	0x5
	tl	%xcc,	0x7
	fmovd	%f16,	%f30
loop_1960:
	st	%f1,	[%l7 + 0x64]
	srl	%l0,	%o6,	%i3
	sllx	%l5,	%i1,	%i7
	fpadd32s	%f16,	%f19,	%f30
	movcc	%xcc,	%o3,	%o1
	orcc	%o0,	%i0,	%i2
	udivcc	%i5,	0x119B,	%g5
	fmovdge	%icc,	%f0,	%f19
	sdivcc	%g7,	0x1FE2,	%i6
	xor	%l3,	%l6,	%i4
	umulcc	%g3,	0x101A,	%o4
	sdivcc	%g4,	0x1077,	%l1
	movn	%icc,	%l2,	%g2
	fmovscs	%xcc,	%f16,	%f4
	fmovsvc	%icc,	%f15,	%f24
	fones	%f0
	fmovrde	%l4,	%f14,	%f22
	sllx	%o7,	0x0F,	%o5
	movne	%icc,	%g1,	%o2
	fpsub16s	%f18,	%f0,	%f14
	tle	%xcc,	0x7
	fbul	%fcc2,	loop_1961
	orn	%l0,	0x0E46,	%o6
	xor	%g6,	0x08EF,	%l5
	orncc	%i3,	%i1,	%o3
loop_1961:
	lduw	[%l7 + 0x64],	%i7
	fnegd	%f2,	%f0
	fand	%f0,	%f28,	%f20
	set	0x2F, %g7
	ldstuba	[%l7 + %g7] 0x88,	%o0
	fandnot1	%f18,	%f30,	%f6
	umulcc	%o1,	0x1839,	%i0
	bpos,a,pn	%xcc,	loop_1962
	fsrc1	%f6,	%f24
	andn	%i2,	0x0F08,	%i5
	alignaddrl	%g7,	%g5,	%l3
loop_1962:
	subccc	%l6,	%i6,	%g3
	movrne	%i4,	0x3D2,	%o4
	tleu	%icc,	0x3
	bn,a,pn	%icc,	loop_1963
	ta	%xcc,	0x1
	smul	%l1,	0x171D,	%l2
	edge32l	%g2,	%l4,	%o7
loop_1963:
	smulcc	%g4,	%o5,	%o2
	tgu	%icc,	0x4
	add	%g1,	%l0,	%o6
	bvs,a,pt	%xcc,	loop_1964
	fmovrse	%g6,	%f27,	%f16
	fmovde	%xcc,	%f7,	%f23
	fbg	%fcc3,	loop_1965
loop_1964:
	srax	%i3,	%i1,	%l5
	or	%i7,	0x0D68,	%o0
	movrlz	%o1,	0x3DC,	%i0
loop_1965:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o3,	0x0797,	%i2
	fpadd16	%f2,	%f20,	%f24
	movneg	%icc,	%i5,	%g7
	lduh	[%l7 + 0x7A],	%g5
	sllx	%l3,	%i6,	%l6
	sethi	0x0486,	%g3
	orn	%i4,	%o4,	%l2
	fsrc1	%f22,	%f4
	stx	%g2,	[%l7 + 0x50]
	andn	%l1,	%o7,	%g4
	fmovdcs	%xcc,	%f17,	%f0
	fmuld8ulx16	%f10,	%f22,	%f12
	bvs,a	%xcc,	loop_1966
	bcc	loop_1967
	mulx	%o5,	0x15B2,	%o2
	st	%f28,	[%l7 + 0x3C]
loop_1966:
	prefetch	[%l7 + 0x70],	 0x0
loop_1967:
	umul	%g1,	0x0642,	%l4
	bvc	%xcc,	loop_1968
	andcc	%o6,	%g6,	%i3
	fpadd32s	%f26,	%f17,	%f9
	wr	%g0,	0x19,	%asi
	stha	%l0,	[%l7 + 0x72] %asi
loop_1968:
	bl,a	%icc,	loop_1969
	tgu	%icc,	0x5
	tsubcc	%l5,	%i1,	%o0
	edge8ln	%i7,	%i0,	%o1
loop_1969:
	nop
	wr	%g0,	0x80,	%asi
	stha	%o3,	[%l7 + 0x5E] %asi
	srlx	%i5,	%i2,	%g7
	movn	%icc,	%g5,	%l3
	pdist	%f10,	%f14,	%f16
	array8	%i6,	%l6,	%i4
	edge16n	%o4,	%l2,	%g3
	tg	%xcc,	0x2
	xorcc	%l1,	0x1CEB,	%g2
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x210] %asi,	%g4
	smulcc	%o5,	%o2,	%o7
	tcs	%xcc,	0x0
	fbg,a	%fcc2,	loop_1970
	sra	%g1,	%l4,	%g6
	stx	%i3,	[%l7 + 0x78]
	tn	%xcc,	0x2
loop_1970:
	nop
	set	0x00, %l1
	ldxa	[%g0 + %l1] 0x50,	%l0
	movleu	%xcc,	%o6,	%i1
	movrgz	%l5,	0x105,	%i7
	ldsw	[%l7 + 0x74],	%o0
	mulscc	%o1,	%o3,	%i0
	mulscc	%i5,	%i2,	%g7
	andcc	%g5,	0x0677,	%i6
	nop
	setx	loop_1971,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbue,a	%fcc3,	loop_1972
	umulcc	%l6,	0x0F83,	%i4
	ldsw	[%l7 + 0x2C],	%l3
loop_1971:
	or	%l2,	%g3,	%o4
loop_1972:
	fnegs	%f24,	%f21
	smul	%l1,	%g2,	%o5
	sethi	0x1A15,	%o2
	ldd	[%l7 + 0x60],	%f8
	fcmpeq32	%f22,	%f28,	%o7
	sir	0x0DD0
	fnand	%f22,	%f20,	%f26
	array8	%g4,	%g1,	%g6
	fmovdne	%xcc,	%f10,	%f20
	st	%f21,	[%l7 + 0x78]
	fpmerge	%f11,	%f22,	%f4
	brnz,a	%i3,	loop_1973
	tneg	%icc,	0x6
	ldx	[%l7 + 0x30],	%l0
	fmovrdgez	%o6,	%f14,	%f8
loop_1973:
	ta	%xcc,	0x5
	brgz,a	%i1,	loop_1974
	mova	%icc,	%l4,	%i7
	fnot1s	%f27,	%f15
	xnor	%o0,	0x0E59,	%o1
loop_1974:
	sll	%l5,	%o3,	%i5
	set	0x60, %i2
	prefetcha	[%l7 + %i2] 0x18,	 0x0
	nop
	set	0x18, %g4
	ldsw	[%l7 + %g4],	%g7
	sllx	%i2,	%i6,	%g5
	prefetch	[%l7 + 0x68],	 0x2
	fzero	%f22
	edge8n	%i4,	%l6,	%l2
	alignaddrl	%g3,	%l3,	%l1
	movrlz	%g2,	0x043,	%o4
	st	%f2,	[%l7 + 0x58]
	movge	%icc,	%o2,	%o5
	tgu	%xcc,	0x0
	tg	%icc,	0x3
	te	%icc,	0x6
	ldub	[%l7 + 0x1E],	%o7
	sethi	0x102D,	%g1
	brgez,a	%g6,	loop_1975
	fmovsne	%xcc,	%f6,	%f27
	fmovdleu	%icc,	%f1,	%f26
	movrne	%i3,	0x2F4,	%g4
loop_1975:
	edge8	%l0,	%o6,	%l4
	srl	%i7,	0x0D,	%o0
	std	%f0,	[%l7 + 0x68]
	fabsd	%f0,	%f18
	movrlz	%o1,	%i1,	%l5
	fornot2s	%f0,	%f21,	%f22
	te	%xcc,	0x0
	ldd	[%l7 + 0x68],	%i4
	fornot2	%f16,	%f20,	%f4
	fnot2s	%f22,	%f15
	tge	%icc,	0x1
	andncc	%i0,	%o3,	%g7
	fbe,a	%fcc2,	loop_1976
	array32	%i2,	%g5,	%i4
	te	%icc,	0x1
	fandnot2	%f8,	%f12,	%f4
loop_1976:
	lduw	[%l7 + 0x3C],	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l2,	0x07,	%g3
	fpack32	%f18,	%f16,	%f16
	fmovsneg	%xcc,	%f4,	%f15
	fones	%f23
	alignaddr	%i6,	%l3,	%l1
	sth	%o4,	[%l7 + 0x10]
	fbug,a	%fcc2,	loop_1977
	move	%icc,	%g2,	%o5
	set	0x1C, %g6
	ldswa	[%l7 + %g6] 0x11,	%o2
loop_1977:
	edge16n	%o7,	%g1,	%g6
	movpos	%icc,	%i3,	%l0
	fmovsvs	%xcc,	%f30,	%f14
	fmovsle	%icc,	%f21,	%f18
	udivx	%g4,	0x0C7E,	%o6
	st	%f7,	[%l7 + 0x4C]
	addc	%l4,	%i7,	%o1
	bcc,pt	%xcc,	loop_1978
	addc	%o0,	0x0FE5,	%i1
	tgu	%xcc,	0x0
	bn,a,pt	%icc,	loop_1979
loop_1978:
	bge,pn	%xcc,	loop_1980
	edge32n	%l5,	%i0,	%o3
	sdiv	%g7,	0x0135,	%i2
loop_1979:
	brgez,a	%g5,	loop_1981
loop_1980:
	tneg	%icc,	0x6
	bge	loop_1982
	fmovdleu	%icc,	%f22,	%f10
loop_1981:
	fones	%f27
	sethi	0x1A8F,	%i4
loop_1982:
	edge8	%i5,	%l6,	%g3
	edge16	%i6,	%l3,	%l2
	tsubcc	%l1,	0x07CC,	%g2
	alignaddr	%o5,	%o4,	%o7
	fbuge,a	%fcc2,	loop_1983
	fmovsvs	%icc,	%f8,	%f25
	fcmps	%fcc3,	%f9,	%f20
	fabsd	%f8,	%f2
loop_1983:
	movne	%xcc,	%o2,	%g1
	smul	%g6,	0x1792,	%i3
	orncc	%g4,	0x19EF,	%o6
	fmovrdne	%l0,	%f10,	%f30
	fnor	%f8,	%f16,	%f6
	tneg	%xcc,	0x4
	bl,a	%xcc,	loop_1984
	movcs	%icc,	%i7,	%o1
	fpsub16	%f6,	%f24,	%f10
	fmovsge	%icc,	%f2,	%f0
loop_1984:
	ble,a,pn	%icc,	loop_1985
	edge32	%o0,	%l4,	%l5
	orn	%i1,	0x1718,	%i0
	edge32ln	%o3,	%g7,	%i2
loop_1985:
	lduh	[%l7 + 0x72],	%g5
	add	%i4,	0x0E1B,	%l6
	fxnors	%f10,	%f13,	%f1
	tvs	%xcc,	0x2
	mulscc	%i5,	0x0014,	%g3
	and	%l3,	0x1139,	%l2
	taddcctv	%l1,	%i6,	%o5
	movcs	%icc,	%g2,	%o4
	sra	%o2,	%o7,	%g6
	edge8	%i3,	%g1,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g4,	%l0
	andn	%o1,	0x1086,	%o0
	movleu	%xcc,	%i7,	%l5
	fcmple16	%f28,	%f14,	%i1
	fmovsl	%xcc,	%f18,	%f13
	fmovsg	%icc,	%f11,	%f16
	udivx	%l4,	0x0755,	%o3
	or	%i0,	0x1B39,	%i2
	fmovrslez	%g5,	%f7,	%f6
	array8	%g7,	%i4,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i5,	0x124D,	%g3
	popc	%l2,	%l1
	fmovsleu	%xcc,	%f24,	%f18
	nop
	setx	loop_1986,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlez	%l3,	loop_1987
	tge	%icc,	0x7
	fpmerge	%f17,	%f29,	%f8
loop_1986:
	orn	%o5,	0x1276,	%g2
loop_1987:
	movpos	%icc,	%i6,	%o4
	brnz	%o7,	loop_1988
	movle	%icc,	%g6,	%i3
	sll	%g1,	0x1A,	%o6
	alignaddrl	%o2,	%g4,	%o1
loop_1988:
	fble,a	%fcc1,	loop_1989
	fbn,a	%fcc1,	loop_1990
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%o0,	0x004C,	%l0
loop_1989:
	add	%i7,	%i1,	%l5
loop_1990:
	edge16ln	%o3,	%i0,	%i2
	or	%g5,	%g7,	%l4
	subcc	%l6,	0x1DC4,	%i4
	fcmple16	%f10,	%f22,	%g3
	srax	%i5,	0x12,	%l1
	taddcc	%l2,	%l3,	%o5
	xnorcc	%i6,	0x059B,	%g2
	movrne	%o4,	0x3EE,	%g6
	edge8ln	%i3,	%o7,	%o6
	set	0x34, %l5
	lda	[%l7 + %l5] 0x18,	%f14
	add	%g1,	%o2,	%g4
	movvc	%xcc,	%o0,	%l0
	movcs	%xcc,	%o1,	%i7
	movrne	%i1,	%l5,	%i0
	movrlez	%o3,	%i2,	%g7
	fors	%f30,	%f7,	%f24
	fnor	%f8,	%f22,	%f24
	edge16l	%g5,	%l6,	%i4
	fbug	%fcc3,	loop_1991
	prefetch	[%l7 + 0x38],	 0x2
	subccc	%l4,	0x153E,	%g3
	srlx	%i5,	%l1,	%l3
loop_1991:
	movl	%icc,	%l2,	%o5
	ldx	[%l7 + 0x38],	%i6
	std	%o4,	[%l7 + 0x78]
	tl	%icc,	0x2
	addcc	%g2,	%g6,	%o7
	ta	%icc,	0x3
	fnand	%f26,	%f26,	%f0
	stx	%i3,	[%l7 + 0x78]
	addc	%o6,	0x16E5,	%g1
	tg	%xcc,	0x7
	sllx	%g4,	0x08,	%o0
	popc	%o2,	%o1
	mova	%icc,	%i7,	%i1
	subcc	%l0,	0x1DDE,	%l5
	movg	%xcc,	%i0,	%o3
	tl	%icc,	0x3
	xnor	%g7,	%g5,	%i2
	tcc	%icc,	0x5
	std	%f12,	[%l7 + 0x28]
	edge32ln	%i4,	%l4,	%g3
	ldsb	[%l7 + 0x7D],	%i5
	tl	%xcc,	0x5
	fbl	%fcc1,	loop_1992
	brnz	%l6,	loop_1993
	srax	%l3,	0x10,	%l1
	movcc	%icc,	%l2,	%i6
loop_1992:
	fbge,a	%fcc0,	loop_1994
loop_1993:
	andcc	%o4,	0x0D45,	%g2
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x20] %asi,	%o5
loop_1994:
	movcc	%icc,	%g6,	%i3
	sdivx	%o6,	0x1918,	%o7
	fmovrdlez	%g1,	%f30,	%f24
	fbug	%fcc3,	loop_1995
	tne	%icc,	0x7
	fbge,a	%fcc2,	loop_1996
	movvc	%icc,	%g4,	%o0
loop_1995:
	fmovsn	%xcc,	%f4,	%f16
	st	%f26,	[%l7 + 0x24]
loop_1996:
	movleu	%xcc,	%o1,	%i7
	ldstub	[%l7 + 0x6C],	%i1
	fmovrslz	%l0,	%f1,	%f30
	bg,a,pt	%icc,	loop_1997
	edge8l	%o2,	%i0,	%l5
	movge	%icc,	%g7,	%g5
	array32	%o3,	%i4,	%i2
loop_1997:
	fmovrsgez	%g3,	%f15,	%f11
	addcc	%l4,	0x1901,	%i5
	set	0x60, %i6
	stda	%i6,	[%l7 + %i6] 0x88
	subccc	%l1,	0x168C,	%l2
	te	%xcc,	0x4
	fors	%f29,	%f13,	%f12
	movne	%icc,	%l3,	%i6
	movne	%xcc,	%o4,	%o5
	sllx	%g2,	0x0B,	%i3
	lduw	[%l7 + 0x14],	%o6
	fexpand	%f0,	%f28
	movvs	%icc,	%o7,	%g1
	brnz,a	%g4,	loop_1998
	edge16ln	%g6,	%o1,	%o0
	fmul8sux16	%f8,	%f18,	%f0
	nop
	setx loop_1999, %l0, %l1
	jmpl %l1, %i1
loop_1998:
	fmovdl	%xcc,	%f24,	%f15
	movrgez	%i7,	%o2,	%i0
	subccc	%l5,	0x14F9,	%g7
loop_1999:
	fmovdcc	%icc,	%f17,	%f23
	ld	[%l7 + 0x58],	%f5
	tge	%xcc,	0x4
	edge8	%l0,	%o3,	%g5
	fornot2	%f10,	%f12,	%f16
	nop
	setx	loop_2000,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpne32	%f4,	%f6,	%i2
	brnz,a	%g3,	loop_2001
	and	%i4,	0x04F6,	%i5
loop_2000:
	swap	[%l7 + 0x68],	%l4
	fnegs	%f21,	%f17
loop_2001:
	edge16l	%l1,	%l2,	%l6
	edge16l	%i6,	%l3,	%o5
	array32	%o4,	%g2,	%i3
	tvs	%icc,	0x4
	ta	%icc,	0x2
	movge	%icc,	%o6,	%o7
	addccc	%g1,	0x0B89,	%g6
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x14
	ldstub	[%l7 + 0x33],	%o1
	alignaddr	%g4,	%o0,	%i7
	ldsw	[%l7 + 0x30],	%o2
	tle	%icc,	0x5
	movrlz	%i0,	0x03A,	%l5
	fornot2s	%f5,	%f19,	%f0
	udiv	%i1,	0x1167,	%g7
	fbu,a	%fcc2,	loop_2002
	fcmpeq16	%f16,	%f16,	%l0
	udivx	%o3,	0x0280,	%g5
	fpsub16s	%f21,	%f9,	%f16
loop_2002:
	fmovdneg	%icc,	%f29,	%f10
	fnand	%f12,	%f20,	%f18
	swap	[%l7 + 0x34],	%i2
	tneg	%icc,	0x1
	movvc	%icc,	%g3,	%i5
	fmovdn	%icc,	%f11,	%f19
	sll	%l4,	%l1,	%i4
	movrgez	%l2,	0x01B,	%l6
	bn	%icc,	loop_2003
	fcmpeq32	%f0,	%f24,	%l3
	nop
	setx	loop_2004,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movn	%xcc,	%o5,	%i6
loop_2003:
	subccc	%o4,	0x1ECC,	%g2
	edge32n	%i3,	%o6,	%g1
loop_2004:
	alignaddrl	%o7,	%g6,	%g4
	set	0x6A, %o2
	stba	%o1,	[%l7 + %o2] 0xeb
	membar	#Sync
	movneg	%icc,	%i7,	%o0
	fbu	%fcc1,	loop_2005
	fmovsne	%xcc,	%f4,	%f31
	sir	0x0818
	fmovdge	%xcc,	%f31,	%f11
loop_2005:
	movneg	%xcc,	%o2,	%i0
	alignaddr	%i1,	%l5,	%l0
	mulx	%g7,	%o3,	%g5
	fbg	%fcc0,	loop_2006
	orncc	%g3,	0x1589,	%i5
	tpos	%xcc,	0x7
	udivx	%l4,	0x1169,	%i2
loop_2006:
	fbug,a	%fcc3,	loop_2007
	tpos	%icc,	0x7
	fmovsle	%icc,	%f11,	%f4
	tsubcctv	%i4,	%l2,	%l1
loop_2007:
	tvc	%icc,	0x6
	stw	%l6,	[%l7 + 0x40]
	nop
	setx loop_2008, %l0, %l1
	jmpl %l1, %l3
	fmovsle	%icc,	%f0,	%f27
	fxnor	%f28,	%f2,	%f2
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x1e,	%f16
loop_2008:
	movcc	%xcc,	%i6,	%o5
	fmul8x16al	%f20,	%f15,	%f18
	fone	%f0
	array16	%g2,	%o4,	%i3
	movg	%xcc,	%g1,	%o7
	bpos,pn	%icc,	loop_2009
	nop
	setx	loop_2010,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%o6,	%g6,	%o1
	edge8	%i7,	%o0,	%o2
loop_2009:
	srlx	%g4,	0x0C,	%i1
loop_2010:
	orn	%i0,	0x057B,	%l0
	smul	%g7,	0x12B9,	%o3
	ba,a,pt	%xcc,	loop_2011
	fmovrsgz	%l5,	%f31,	%f2
	fcmpd	%fcc2,	%f20,	%f14
	fornot1	%f22,	%f6,	%f10
loop_2011:
	tl	%icc,	0x6
	tgu	%xcc,	0x0
	brgz,a	%g3,	loop_2012
	movrne	%i5,	0x39B,	%l4
	fmovsne	%icc,	%f21,	%f9
	fmovsn	%xcc,	%f22,	%f2
loop_2012:
	subc	%g5,	%i2,	%i4
	move	%icc,	%l2,	%l6
	movrlz	%l3,	%l1,	%o5
	tge	%xcc,	0x5
	movne	%icc,	%i6,	%g2
	edge32ln	%i3,	%o4,	%g1
	movrne	%o7,	0x36A,	%g6
	sra	%o1,	%o6,	%o0
	srl	%o2,	%i7,	%i1
	fbule,a	%fcc2,	loop_2013
	movgu	%icc,	%i0,	%g4
	mulscc	%l0,	%g7,	%o3
	fnand	%f10,	%f30,	%f6
loop_2013:
	sethi	0x1D00,	%l5
	fpadd16	%f26,	%f4,	%f24
	taddcc	%g3,	%l4,	%g5
	fmovdcs	%icc,	%f27,	%f26
	ta	%icc,	0x2
	movgu	%icc,	%i5,	%i4
	fbule	%fcc1,	loop_2014
	udivx	%l2,	0x0EC1,	%i2
	tpos	%xcc,	0x2
	fmovrslez	%l6,	%f13,	%f21
loop_2014:
	andn	%l3,	0x0881,	%o5
	sub	%i6,	%g2,	%l1
	be,pn	%icc,	loop_2015
	andn	%i3,	%o4,	%o7
	addcc	%g6,	%o1,	%g1
	fmovdcs	%xcc,	%f31,	%f18
loop_2015:
	fandnot1s	%f3,	%f12,	%f31
	sub	%o6,	0x0ECD,	%o0
	fmovde	%xcc,	%f28,	%f23
	umul	%o2,	%i7,	%i1
	smulcc	%g4,	%i0,	%g7
	ta	%xcc,	0x3
	tge	%xcc,	0x3
	xnorcc	%o3,	0x0883,	%l5
	tcs	%icc,	0x6
	set	0x38, %o0
	lduwa	[%l7 + %o0] 0x11,	%g3
	bcc,pn	%icc,	loop_2016
	edge32l	%l4,	%g5,	%i5
	taddcctv	%l0,	0x0D7A,	%i4
	andcc	%l2,	0x10CF,	%l6
loop_2016:
	fmovdn	%icc,	%f1,	%f25
	movrlez	%l3,	0x13A,	%o5
	movcs	%icc,	%i6,	%i2
	sethi	0x0ED6,	%g2
	tge	%icc,	0x4
	fpadd16s	%f11,	%f0,	%f13
	bn,a,pn	%icc,	loop_2017
	brlz	%i3,	loop_2018
	movleu	%icc,	%o4,	%o7
	fmovsvc	%icc,	%f28,	%f20
loop_2017:
	movrgz	%l1,	%g6,	%g1
loop_2018:
	fxnors	%f12,	%f24,	%f31
	fble,a	%fcc3,	loop_2019
	fsrc2s	%f8,	%f6
	xnor	%o1,	%o0,	%o2
	movrgez	%i7,	%o6,	%i1
loop_2019:
	fsrc2	%f12,	%f22
	popc	%g4,	%i0
	set	0x5D, %o1
	ldstuba	[%l7 + %o1] 0x89,	%o3
	fpack16	%f6,	%f30
	fmovd	%f18,	%f26
	umulcc	%l5,	%g3,	%g7
	sra	%l4,	0x0A,	%i5
	fbn,a	%fcc1,	loop_2020
	movne	%xcc,	%l0,	%i4
	sll	%g5,	0x11,	%l6
	bvs,a,pt	%icc,	loop_2021
loop_2020:
	popc	%l3,	%o5
	edge32n	%l2,	%i6,	%g2
	bneg,pn	%icc,	loop_2022
loop_2021:
	movrgez	%i3,	0x2BB,	%i2
	fmul8sux16	%f10,	%f10,	%f22
	te	%xcc,	0x7
loop_2022:
	membar	0x75
	edge16	%o4,	%o7,	%l1
	fcmps	%fcc3,	%f21,	%f0
	umul	%g6,	%o1,	%o0
	edge16ln	%g1,	%i7,	%o2
	fcmpne32	%f6,	%f26,	%i1
	ble	loop_2023
	fpack16	%f4,	%f30
	movleu	%icc,	%o6,	%g4
	tne	%xcc,	0x0
loop_2023:
	edge8l	%o3,	%i0,	%l5
	fmovrdlez	%g3,	%f4,	%f22
	tvc	%icc,	0x7
	umulcc	%g7,	0x14D3,	%l4
	fmovrdgz	%l0,	%f18,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a	loop_2024
	bge,a	%xcc,	loop_2025
	fcmpes	%fcc0,	%f1,	%f14
	move	%xcc,	%i5,	%g5
loop_2024:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x60] %asi,	%l6
loop_2025:
	tgu	%xcc,	0x1
	fabss	%f5,	%f31
	edge16l	%i4,	%l3,	%o5
	fmovsgu	%icc,	%f21,	%f25
	stx	%i6,	[%l7 + 0x68]
	orcc	%g2,	%l2,	%i2
	array32	%o4,	%o7,	%l1
	tg	%xcc,	0x4
	edge8l	%g6,	%i3,	%o0
	movge	%xcc,	%o1,	%g1
	sir	0x1523
	movg	%icc,	%o2,	%i1
	andncc	%o6,	%i7,	%o3
	xnorcc	%i0,	0x0DC3,	%l5
	set	0x76, %g3
	stha	%g4,	[%l7 + %g3] 0xe3
	membar	#Sync
	movneg	%icc,	%g7,	%g3
	nop
	setx	loop_2026,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%xcc,	%l4,	%i5
	mova	%xcc,	%g5,	%l0
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
loop_2026:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i4,	0x0459,	%o5
	fsrc1	%f16,	%f16
	movgu	%xcc,	%l3,	%i6
	taddcctv	%g2,	0x1580,	%i2
	edge8l	%o4,	%o7,	%l1
	edge8	%g6,	%l2,	%o0
	array8	%i3,	%g1,	%o2
	ldd	[%l7 + 0x78],	%f12
	tg	%icc,	0x7
	movrgz	%o1,	0x31A,	%o6
	xnor	%i1,	0x070B,	%o3
	addc	%i0,	0x0823,	%i7
	popc	%g4,	%g7
	edge16n	%l5,	%l4,	%g3
	tvs	%xcc,	0x4
	fmul8x16au	%f20,	%f7,	%f6
	fornot2s	%f26,	%f4,	%f22
	fsrc2	%f18,	%f8
	popc	%i5,	%l0
	fsrc1s	%f15,	%f23
	tcc	%xcc,	0x4
	fxnor	%f10,	%f14,	%f6
	fsrc1s	%f2,	%f17
	tcs	%icc,	0x5
	edge16n	%g5,	%i4,	%o5
	edge8n	%l3,	%i6,	%g2
	stbar
	nop
	set	0x40, %l6
	prefetch	[%l7 + %l6],	 0x2
	bcs,a,pt	%xcc,	loop_2027
	tpos	%xcc,	0x0
	umulcc	%i2,	%o4,	%o7
	fsrc1s	%f6,	%f25
loop_2027:
	fmovsvs	%xcc,	%f25,	%f2
	fmovsa	%icc,	%f0,	%f22
	tcc	%icc,	0x2
	bcs,a,pn	%icc,	loop_2028
	fmovsn	%xcc,	%f15,	%f9
	umulcc	%l1,	0x0F26,	%g6
	ldsh	[%l7 + 0x5A],	%l2
loop_2028:
	brlez	%l6,	loop_2029
	edge16ln	%o0,	%g1,	%i3
	bn,pt	%icc,	loop_2030
	fbge	%fcc1,	loop_2031
loop_2029:
	tn	%icc,	0x6
	faligndata	%f16,	%f10,	%f18
loop_2030:
	fmovrslz	%o2,	%f7,	%f24
loop_2031:
	sub	%o1,	%i1,	%o6
	edge16l	%i0,	%i7,	%o3
	popc	0x0259,	%g7
	tsubcctv	%g4,	0x1A29,	%l4
	fbe	%fcc3,	loop_2032
	te	%icc,	0x6
	edge32l	%g3,	%i5,	%l5
	taddcc	%g5,	%i4,	%l0
loop_2032:
	mulx	%l3,	0x107E,	%i6
	smulcc	%g2,	%o5,	%i2
	fbue	%fcc3,	loop_2033
	tge	%icc,	0x2
	smulcc	%o7,	0x05EE,	%l1
	bleu,pn	%icc,	loop_2034
loop_2033:
	edge8n	%o4,	%l2,	%l6
	prefetch	[%l7 + 0x10],	 0x1
	tcs	%icc,	0x3
loop_2034:
	bleu,a,pt	%icc,	loop_2035
	movrlez	%g6,	%g1,	%i3
	edge32n	%o2,	%o0,	%o1
	smulcc	%o6,	%i1,	%i7
loop_2035:
	popc	0x1A29,	%i0
	tg	%xcc,	0x7
	srl	%o3,	%g4,	%g7
	nop
	set	0x09, %l3
	stb	%g3,	[%l7 + %l3]
	bne,pt	%icc,	loop_2036
	fmovsge	%xcc,	%f2,	%f11
	fcmpeq16	%f24,	%f30,	%l4
	array8	%i5,	%g5,	%i4
loop_2036:
	smulcc	%l0,	%l3,	%i6
	ble,pt	%xcc,	loop_2037
	fsrc1s	%f3,	%f27
	sub	%g2,	0x106F,	%o5
	fpadd32	%f4,	%f20,	%f16
loop_2037:
	subccc	%i2,	0x0FFE,	%l5
	faligndata	%f18,	%f4,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%l1,	loop_2038
	fmovd	%f10,	%f30
	umul	%o7,	%o4,	%l6
	fbule	%fcc0,	loop_2039
loop_2038:
	ba	loop_2040
	fbuge	%fcc0,	loop_2041
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2039:
	fmovsn	%xcc,	%f16,	%f8
loop_2040:
	fbug,a	%fcc2,	loop_2042
loop_2041:
	nop
	setx	loop_2043,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnegd	%f30,	%f2
	fnot2s	%f24,	%f20
loop_2042:
	tn	%icc,	0x0
loop_2043:
	fabss	%f1,	%f3
	bg,a,pt	%xcc,	loop_2044
	fmovrdgez	%g6,	%f10,	%f30
	fcmpeq16	%f26,	%f10,	%l2
	alignaddr	%g1,	%i3,	%o2
loop_2044:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x56] %asi,	%o0
	tle	%icc,	0x7
	movcc	%xcc,	%o1,	%o6
	fornot2s	%f17,	%f19,	%f14
	brgz	%i1,	loop_2045
	alignaddrl	%i7,	%i0,	%o3
	or	%g7,	%g3,	%g4
	sdiv	%i5,	0x1B31,	%g5
loop_2045:
	add	%l4,	0x10D1,	%l0
	sdivcc	%l3,	0x0B1B,	%i6
	fnot1s	%f0,	%f25
	edge16n	%g2,	%i4,	%i2
	umul	%l5,	%l1,	%o7
	subc	%o5,	0x11B5,	%o4
	fcmpne16	%f6,	%f10,	%l6
	tvs	%icc,	0x1
	fmovdn	%icc,	%f1,	%f29
	sdiv	%g6,	0x0E78,	%l2
	mova	%xcc,	%i3,	%g1
	fbu,a	%fcc3,	loop_2046
	fnors	%f27,	%f14,	%f11
	fors	%f20,	%f29,	%f21
	fcmps	%fcc2,	%f15,	%f2
loop_2046:
	fandnot2s	%f14,	%f1,	%f10
	fexpand	%f1,	%f22
	movleu	%icc,	%o2,	%o0
	srl	%o6,	0x0B,	%i1
	bl,a	loop_2047
	tcs	%icc,	0x2
	fmovrdne	%i7,	%f2,	%f18
	bneg,a,pt	%icc,	loop_2048
loop_2047:
	mulx	%i0,	0x02B7,	%o3
	fmovspos	%xcc,	%f25,	%f23
	fbue,a	%fcc1,	loop_2049
loop_2048:
	movcc	%icc,	%o1,	%g7
	andncc	%g4,	%i5,	%g3
	set	0x0C, %g2
	stwa	%l4,	[%l7 + %g2] 0x19
loop_2049:
	nop
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x34] %asi,	%g5
	umulcc	%l3,	0x0264,	%l0
	fors	%f28,	%f5,	%f30
	fmovscs	%icc,	%f22,	%f2
	fpadd32	%f2,	%f22,	%f0
	udivcc	%i6,	0x0AB2,	%g2
	fmovrdlz	%i2,	%f10,	%f4
	sethi	0x0F84,	%i4
	taddcc	%l1,	%o7,	%o5
	fcmple32	%f6,	%f30,	%l5
	movcs	%xcc,	%o4,	%g6
	edge16	%l2,	%l6,	%g1
	fmovdcs	%icc,	%f13,	%f20
	sll	%o2,	0x01,	%i3
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x57] %asi,	%o0
	sethi	0x13E2,	%o6
	movleu	%icc,	%i1,	%i7
	sdivcc	%i0,	0x0123,	%o1
	be,a,pn	%xcc,	loop_2050
	movrlez	%o3,	0x019,	%g7
	movcs	%xcc,	%g4,	%i5
	subccc	%l4,	0x155B,	%g5
loop_2050:
	fbu,a	%fcc0,	loop_2051
	alignaddrl	%l3,	%g3,	%l0
	fnot2s	%f1,	%f12
	membar	0x0A
loop_2051:
	tne	%icc,	0x5
	sllx	%i6,	0x03,	%g2
	for	%f30,	%f30,	%f24
	bge	loop_2052
	mova	%icc,	%i2,	%i4
	tvs	%icc,	0x4
	mulscc	%o7,	%l1,	%l5
loop_2052:
	fbne	%fcc2,	loop_2053
	fmovsl	%icc,	%f14,	%f9
	edge16ln	%o4,	%g6,	%o5
	umul	%l2,	%g1,	%l6
loop_2053:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x44] %asi,	%i3
	set	0x28, %i3
	lda	[%l7 + %i3] 0x19,	%f11
	fcmpne32	%f22,	%f20,	%o0
	addcc	%o6,	0x1493,	%o2
	fmovdvs	%xcc,	%f6,	%f5
	edge8	%i7,	%i0,	%i1
	edge8l	%o3,	%g7,	%o1
	tleu	%xcc,	0x4
	stx	%i5,	[%l7 + 0x30]
	smul	%l4,	%g5,	%g4
	taddcctv	%g3,	0x0E98,	%l0
	fmovsl	%xcc,	%f7,	%f28
	subcc	%l3,	%g2,	%i6
	edge16	%i2,	%o7,	%i4
	pdist	%f26,	%f12,	%f30
	taddcc	%l5,	0x0BC3,	%o4
	tgu	%icc,	0x4
	movne	%xcc,	%l1,	%o5
	bvc	%xcc,	loop_2054
	orn	%l2,	0x047A,	%g6
	edge32n	%g1,	%i3,	%o0
	udivx	%o6,	0x18DC,	%o2
loop_2054:
	addc	%l6,	0x1875,	%i0
	movrne	%i7,	0x19D,	%o3
	tge	%xcc,	0x3
	sethi	0x1817,	%g7
	movre	%o1,	%i1,	%l4
	and	%g5,	0x0557,	%i5
	movrgz	%g4,	%l0,	%l3
	fmovsge	%xcc,	%f11,	%f6
	fbo,a	%fcc3,	loop_2055
	xorcc	%g3,	%g2,	%i2
	umul	%i6,	0x1B0E,	%o7
	movrlz	%l5,	%o4,	%i4
loop_2055:
	nop
	wr	%g0,	0xe2,	%asi
	stha	%l1,	[%l7 + 0x18] %asi
	membar	#Sync
	edge8ln	%l2,	%g6,	%g1
	subc	%o5,	%o0,	%i3
	fmovde	%icc,	%f10,	%f27
	edge16	%o6,	%o2,	%i0
	movgu	%xcc,	%l6,	%i7
	pdist	%f2,	%f10,	%f26
	addccc	%g7,	%o3,	%i1
	st	%f5,	[%l7 + 0x40]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o1,	%g5,	%l4
	set	0x64, %g5
	lda	[%l7 + %g5] 0x04,	%f5
	subcc	%i5,	%l0,	%g4
	wr	%g0,	0xe3,	%asi
	stda	%g2,	[%l7 + 0x78] %asi
	membar	#Sync
	fmovdvs	%icc,	%f12,	%f26
	set	0x55, %i0
	ldsba	[%l7 + %i0] 0x80,	%g2
	subcc	%l3,	0x00BA,	%i2
	fmovsl	%icc,	%f15,	%f21
	tsubcc	%o7,	0x087E,	%i6
	movg	%icc,	%o4,	%l5
	taddcctv	%i4,	0x0664,	%l2
	edge16ln	%g6,	%g1,	%l1
	st	%f22,	[%l7 + 0x1C]
	set	0x3D, %i7
	stba	%o5,	[%l7 + %i7] 0x0c
	fpack16	%f8,	%f7
	fmovsvc	%icc,	%f0,	%f3
	add	%i3,	%o6,	%o0
	taddcctv	%o2,	0x0511,	%l6
	movge	%icc,	%i0,	%i7
	movgu	%icc,	%o3,	%i1
	movrlz	%g7,	%o1,	%g5
	fblg,a	%fcc0,	loop_2056
	xnorcc	%l4,	%i5,	%l0
	tge	%icc,	0x0
	fabss	%f7,	%f15
loop_2056:
	ba	%icc,	loop_2057
	bcs,a	%xcc,	loop_2058
	brlz,a	%g3,	loop_2059
	fmovsvc	%xcc,	%f18,	%f6
loop_2057:
	fmovsvc	%icc,	%f9,	%f17
loop_2058:
	subc	%g4,	%l3,	%i2
loop_2059:
	andcc	%o7,	%i6,	%g2
	srax	%l5,	%o4,	%l2
	sub	%i4,	%g1,	%g6
	bgu	loop_2060
	bn,a,pn	%icc,	loop_2061
	fmovdleu	%xcc,	%f21,	%f7
	tn	%xcc,	0x6
loop_2060:
	sethi	0x0AEB,	%o5
loop_2061:
	edge32n	%l1,	%o6,	%o0
	addc	%i3,	%o2,	%l6
	std	%f12,	[%l7 + 0x78]
	subcc	%i0,	0x0D20,	%i7
	edge32ln	%o3,	%g7,	%o1
	set	0x7F, %o3
	stba	%g5,	[%l7 + %o3] 0x27
	membar	#Sync
	taddcctv	%i1,	0x03AF,	%i5
	udivcc	%l4,	0x111A,	%g3
	ble,pn	%icc,	loop_2062
	fbg,a	%fcc0,	loop_2063
	mova	%icc,	%g4,	%l3
	sub	%l0,	%i2,	%i6
loop_2062:
	movrne	%g2,	0x0DD,	%l5
loop_2063:
	alignaddr	%o4,	%l2,	%i4
	fcmpeq16	%f4,	%f10,	%g1
	fxors	%f13,	%f5,	%f14
	fones	%f8
	add	%g6,	0x0813,	%o5
	xnor	%l1,	0x0096,	%o6
	fpadd16	%f26,	%f12,	%f4
	fbul,a	%fcc2,	loop_2064
	xnor	%o7,	0x18CC,	%o0
	fmovde	%icc,	%f17,	%f14
	subc	%o2,	%i3,	%l6
loop_2064:
	sdivcc	%i7,	0x109A,	%o3
	fpadd16	%f14,	%f26,	%f22
	fmovdneg	%xcc,	%f13,	%f31
	udivcc	%i0,	0x1F99,	%g7
	movpos	%icc,	%o1,	%i1
	srlx	%i5,	0x0A,	%g5
	umul	%l4,	%g4,	%l3
	addccc	%g3,	0x00AB,	%l0
	movrlez	%i6,	0x18F,	%g2
	movrgez	%l5,	%o4,	%i2
	fbne	%fcc3,	loop_2065
	bn	loop_2066
	fbul,a	%fcc0,	loop_2067
	siam	0x4
loop_2065:
	tcc	%xcc,	0x5
loop_2066:
	orn	%l2,	%g1,	%g6
loop_2067:
	nop
	setx	loop_2068,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movne	%icc,	%i4,	%o5
	orn	%o6,	%o7,	%o0
	fbule	%fcc3,	loop_2069
loop_2068:
	fmovde	%xcc,	%f10,	%f4
	movvc	%xcc,	%l1,	%i3
	tcc	%xcc,	0x3
loop_2069:
	move	%xcc,	%o2,	%l6
	movneg	%icc,	%o3,	%i0
	fsrc1	%f18,	%f26
	fmovrsgz	%i7,	%f20,	%f25
	sllx	%o1,	0x1B,	%g7
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x40] %asi,	%i1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x19,	%i5,	%l4
	fbuge	%fcc2,	loop_2070
	fand	%f18,	%f16,	%f26
	movne	%icc,	%g5,	%l3
	movrlz	%g3,	%g4,	%i6
loop_2070:
	fpadd16	%f14,	%f30,	%f22
	siam	0x2
	movleu	%icc,	%g2,	%l0
	subcc	%o4,	0x1BD4,	%i2
	wr	%g0,	0x80,	%asi
	stwa	%l5,	[%l7 + 0x1C] %asi
	fmovrdlz	%g1,	%f6,	%f16
	umulcc	%g6,	0x1C48,	%l2
	tge	%xcc,	0x6
	set	0x2C, %i1
	swapa	[%l7 + %i1] 0x18,	%o5
	bg,a	%icc,	loop_2071
	tn	%xcc,	0x4
	add	%i4,	%o7,	%o6
	fmovdle	%xcc,	%f15,	%f28
loop_2071:
	udivcc	%o0,	0x0495,	%l1
	fbo	%fcc0,	loop_2072
	xnor	%o2,	%l6,	%i3
	alignaddrl	%o3,	%i0,	%o1
	andncc	%g7,	%i1,	%i7
loop_2072:
	movleu	%icc,	%i5,	%l4
	movl	%xcc,	%l3,	%g3
	bge,a	%xcc,	loop_2073
	movvs	%xcc,	%g4,	%i6
	ldsh	[%l7 + 0x6E],	%g2
	movl	%xcc,	%g5,	%o4
loop_2073:
	movrlz	%l0,	%i2,	%g1
	fbug,a	%fcc3,	loop_2074
	fmovdg	%icc,	%f6,	%f11
	udiv	%g6,	0x1392,	%l2
	xnor	%l5,	0x148D,	%o5
loop_2074:
	fmovrdne	%i4,	%f20,	%f6
	or	%o7,	%o0,	%l1
	bn	loop_2075
	fmovdne	%icc,	%f29,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o6,	0x1B8D,	%l6
loop_2075:
	alignaddrl	%i3,	%o2,	%o3
	movrlez	%o1,	0x0EF,	%i0
	set	0x7C, %g1
	lda	[%l7 + %g1] 0x18,	%f17
	edge16ln	%i1,	%i7,	%i5
	bneg,a,pn	%xcc,	loop_2076
	sth	%l4,	[%l7 + 0x54]
	bneg	%icc,	loop_2077
	fmovsl	%xcc,	%f1,	%f28
loop_2076:
	xor	%l3,	0x03A2,	%g7
	nop
	setx	loop_2078,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2077:
	srlx	%g4,	0x1F,	%i6
	move	%icc,	%g3,	%g2
	fmovrsgz	%o4,	%f13,	%f30
loop_2078:
	edge8l	%g5,	%l0,	%g1
	fxnors	%f25,	%f31,	%f16
	tneg	%icc,	0x0
	addcc	%i2,	%g6,	%l2
	srax	%l5,	0x00,	%i4
	nop
	setx	loop_2079,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srlx	%o7,	0x11,	%o0
	set	0x78, %o4
	lda	[%l7 + %o4] 0x89,	%f14
loop_2079:
	fcmped	%fcc0,	%f30,	%f28
	ba,a	%icc,	loop_2080
	sdivx	%l1,	0x157E,	%o5
	fmovdvs	%xcc,	%f20,	%f19
	orcc	%o6,	%l6,	%o2
loop_2080:
	array8	%o3,	%o1,	%i3
	sub	%i1,	0x0F78,	%i0
	bpos,a,pt	%icc,	loop_2081
	edge32n	%i7,	%i5,	%l4
	array32	%l3,	%g4,	%g7
	movpos	%icc,	%i6,	%g3
loop_2081:
	fmovrdlez	%g2,	%f12,	%f26
	movrgz	%g5,	%l0,	%o4
	movrgz	%g1,	0x307,	%i2
	ta	%xcc,	0x1
	fcmpeq32	%f8,	%f14,	%l2
	tcc	%icc,	0x2
	tpos	%icc,	0x6
	fcmpgt16	%f22,	%f16,	%g6
	ta	%icc,	0x2
	edge8n	%i4,	%o7,	%l5
	fmovdcs	%icc,	%f0,	%f6
	fmovdl	%xcc,	%f4,	%f14
	movl	%icc,	%o0,	%o5
	fmovsg	%icc,	%f16,	%f3
	set	0x50, %l2
	ldda	[%l7 + %l2] 0x22,	%o6
	tcc	%icc,	0x5
	membar	0x6D
	move	%xcc,	%l6,	%o2
	udivcc	%l1,	0x0C66,	%o1
	andncc	%i3,	%o3,	%i0
	fmul8x16au	%f23,	%f13,	%f16
	ld	[%l7 + 0x34],	%f22
	fmovdneg	%xcc,	%f25,	%f7
	fbn	%fcc2,	loop_2082
	fnegd	%f0,	%f30
	movleu	%xcc,	%i1,	%i7
	fpsub32s	%f19,	%f26,	%f31
loop_2082:
	sdiv	%l4,	0x12D7,	%l3
	movne	%xcc,	%i5,	%g7
	xnorcc	%i6,	%g4,	%g2
	fnegs	%f26,	%f17
	srl	%g3,	%g5,	%l0
	set	0x52, %l4
	stha	%g1,	[%l7 + %l4] 0x0c
	tgu	%xcc,	0x0
	bvc,a	loop_2083
	movcs	%xcc,	%i2,	%o4
	mova	%icc,	%l2,	%g6
	sethi	0x01C2,	%o7
loop_2083:
	movg	%xcc,	%i4,	%l5
	membar	0x48
	movcc	%icc,	%o5,	%o0
	tsubcc	%l6,	%o6,	%l1
	mulscc	%o2,	%i3,	%o3
	edge8n	%i0,	%o1,	%i7
	fabss	%f27,	%f16
	tvc	%xcc,	0x7
	tgu	%icc,	0x0
	movrgz	%l4,	0x1C6,	%i1
	sdivx	%i5,	0x1308,	%g7
	set	0x10, %i4
	sta	%f10,	[%l7 + %i4] 0x88
	movcs	%xcc,	%l3,	%i6
	srax	%g4,	0x15,	%g3
	umul	%g5,	%l0,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x48, %i5
	stxa	%i2,	[%l7 + %i5] 0x27
	membar	#Sync
	fmovsvs	%xcc,	%f14,	%f17
	tn	%xcc,	0x4
	movgu	%xcc,	%o4,	%l2
	orncc	%g6,	%g2,	%i4
	movvc	%icc,	%o7,	%o5
	andncc	%o0,	%l6,	%l5
	movcc	%icc,	%o6,	%l1
	movcc	%xcc,	%i3,	%o3
	fbg,a	%fcc1,	loop_2084
	edge8l	%o2,	%i0,	%i7
	udiv	%o1,	0x1C2E,	%l4
	fandnot1	%f6,	%f10,	%f20
loop_2084:
	fmovrdgez	%i1,	%f0,	%f6
	movrlz	%g7,	0x297,	%l3
	movrlez	%i6,	0x3A6,	%i5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%g4,	%g3
	sub	%g5,	%l0,	%i2
	popc	0x1D50,	%g1
	be,pt	%xcc,	loop_2085
	swap	[%l7 + 0x68],	%o4
	stx	%l2,	[%l7 + 0x38]
	brlz	%g2,	loop_2086
loop_2085:
	taddcctv	%g6,	%o7,	%o5
	fmovscs	%xcc,	%f6,	%f7
	fmovsg	%icc,	%f25,	%f23
loop_2086:
	smul	%o0,	%i4,	%l5
	movne	%xcc,	%o6,	%l6
	set	0x2C, %o7
	stwa	%i3,	[%l7 + %o7] 0x04
	fblg	%fcc2,	loop_2087
	bgu,a,pn	%icc,	loop_2088
	fornot2s	%f0,	%f28,	%f0
	fbu,a	%fcc1,	loop_2089
loop_2087:
	umul	%l1,	%o2,	%i0
loop_2088:
	fandnot2s	%f12,	%f2,	%f15
	movpos	%icc,	%o3,	%i7
loop_2089:
	mova	%xcc,	%o1,	%i1
	edge16	%l4,	%g7,	%i6
	bne,a,pt	%xcc,	loop_2090
	srlx	%l3,	%i5,	%g3
	movge	%xcc,	%g4,	%g5
	nop
	setx loop_2091, %l0, %l1
	jmpl %l1, %l0
loop_2090:
	flush	%l7 + 0x3C
	bcc	%icc,	loop_2092
	fmovsne	%icc,	%f19,	%f29
loop_2091:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x04,	%g1,	%i2
loop_2092:
	lduh	[%l7 + 0x1C],	%o4
	fmovrse	%g2,	%f18,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g6,	%l2,	%o7
	addcc	%o5,	%i4,	%l5
	taddcc	%o6,	%o0,	%l6
	movrlez	%l1,	0x228,	%i3
	tvc	%xcc,	0x2
	fornot1	%f18,	%f10,	%f0
	movrlez	%i0,	%o3,	%o2
	move	%icc,	%o1,	%i7
	movneg	%icc,	%i1,	%l4
	fbug	%fcc0,	loop_2093
	orncc	%i6,	%l3,	%g7
	edge8ln	%i5,	%g3,	%g5
	mulscc	%l0,	0x123F,	%g1
loop_2093:
	fmul8x16	%f9,	%f10,	%f8
	sdiv	%g4,	0x0E72,	%o4
	set	0x18, %g7
	ldxa	[%l7 + %g7] 0x81,	%g2
	fcmpgt16	%f14,	%f14,	%i2
	addccc	%g6,	0x016C,	%l2
	or	%o5,	%i4,	%l5
	tleu	%xcc,	0x2
	fmovsvs	%xcc,	%f25,	%f1
	subc	%o7,	%o6,	%l6
	brnz	%l1,	loop_2094
	stb	%i3,	[%l7 + 0x74]
	andncc	%i0,	%o3,	%o2
	and	%o1,	0x1EBF,	%o0
loop_2094:
	movge	%xcc,	%i7,	%l4
	fbg,a	%fcc2,	loop_2095
	array32	%i1,	%i6,	%g7
	umulcc	%l3,	%g3,	%g5
	addccc	%i5,	%l0,	%g1
loop_2095:
	move	%xcc,	%g4,	%g2
	tcs	%xcc,	0x5
	fmovscs	%icc,	%f13,	%f10
	srax	%i2,	0x1C,	%g6
	udivcc	%o4,	0x0E1A,	%l2
	fmuld8ulx16	%f1,	%f2,	%f28
	fxnor	%f28,	%f10,	%f4
	fmovrdlez	%o5,	%f6,	%f16
	fmovrslz	%i4,	%f15,	%f28
	movneg	%icc,	%l5,	%o7
	fmovdne	%icc,	%f5,	%f11
	mulx	%o6,	%l1,	%l6
	fsrc2s	%f18,	%f11
	fsrc1	%f16,	%f8
	fmovrsgez	%i3,	%f17,	%f4
	fxnors	%f21,	%f9,	%f30
	movvs	%xcc,	%o3,	%i0
	tn	%xcc,	0x1
	add	%o1,	0x1F2D,	%o0
	set	0x60, %o6
	ldda	[%l7 + %o6] 0xeb,	%o2
	tcc	%xcc,	0x3
	fnand	%f8,	%f16,	%f30
	edge16	%l4,	%i7,	%i1
	alignaddr	%i6,	%l3,	%g3
	fors	%f11,	%f7,	%f13
	subcc	%g7,	%i5,	%l0
	bleu	loop_2096
	fmul8x16al	%f0,	%f11,	%f6
	fexpand	%f27,	%f16
	sll	%g1,	0x06,	%g5
loop_2096:
	bne	%xcc,	loop_2097
	fpsub16s	%f15,	%f9,	%f6
	movrlez	%g4,	0x20E,	%g2
	sra	%g6,	%i2,	%l2
loop_2097:
	subccc	%o5,	0x0E76,	%o4
	edge32ln	%i4,	%l5,	%o6
	brz	%o7,	loop_2098
	st	%f5,	[%l7 + 0x34]
	movrlez	%l1,	0x1D1,	%l6
	tn	%icc,	0x6
loop_2098:
	movre	%o3,	%i3,	%o1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x7C] %asi,	%f31
	movleu	%icc,	%o0,	%o2
	membar	0x77
	udivcc	%i0,	0x15CC,	%i7
	mova	%icc,	%i1,	%i6
	fandnot2s	%f3,	%f20,	%f17
	movneg	%icc,	%l3,	%g3
	fpackfix	%f2,	%f15
	tpos	%xcc,	0x3
	alignaddr	%g7,	%i5,	%l0
	fornot1s	%f24,	%f1,	%f23
	add	%g1,	0x1C66,	%l4
	set	0x46, %i2
	stba	%g4,	[%l7 + %i2] 0x11
	fpadd16	%f12,	%f28,	%f12
	sub	%g5,	0x1B20,	%g6
	or	%i2,	0x177B,	%l2
	fbe	%fcc3,	loop_2099
	fmovdn	%icc,	%f15,	%f6
	bcc,a	loop_2100
	tvs	%xcc,	0x0
loop_2099:
	ba,a	%xcc,	loop_2101
	fmovdvc	%xcc,	%f25,	%f15
loop_2100:
	nop
	set	0x23, %g4
	stba	%g2,	[%l7 + %g4] 0xe3
	membar	#Sync
loop_2101:
	srax	%o4,	%i4,	%o5
	movrne	%l5,	0x195,	%o6
	tsubcc	%o7,	%l1,	%l6
	umul	%o3,	%i3,	%o0
	set	0x78, %g6
	lduwa	[%l7 + %g6] 0x11,	%o2
	edge32n	%i0,	%i7,	%o1
	fmovrdgz	%i1,	%f30,	%f18
	srax	%l3,	%g3,	%i6
	nop
	set	0x20, %l5
	stx	%g7,	[%l7 + %l5]
	siam	0x5
	fbn	%fcc2,	loop_2102
	fxor	%f22,	%f12,	%f24
	siam	0x2
	brlz	%l0,	loop_2103
loop_2102:
	fmovscc	%icc,	%f27,	%f28
	edge32	%i5,	%l4,	%g4
	umul	%g5,	%g1,	%i2
loop_2103:
	ta	%icc,	0x0
	bshuffle	%f6,	%f0,	%f4
	lduh	[%l7 + 0x18],	%l2
	srax	%g6,	0x0F,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o4,	%i4,	%o5
	orn	%o6,	%o7,	%l1
	andncc	%l6,	%l5,	%o3
	fmovrdgz	%o0,	%f16,	%f18
	popc	0x07D6,	%o2
	tvc	%xcc,	0x2
	edge8l	%i3,	%i0,	%i7
	edge8ln	%i1,	%l3,	%o1
	set	0x3B, %l1
	ldsba	[%l7 + %l1] 0x81,	%g3
	fmovrdlz	%i6,	%f8,	%f8
	alignaddrl	%l0,	%i5,	%l4
	fmovdn	%xcc,	%f21,	%f23
	edge8ln	%g7,	%g4,	%g1
	fbl	%fcc0,	loop_2104
	movcs	%icc,	%g5,	%l2
	tvc	%icc,	0x0
	or	%g6,	%g2,	%i2
loop_2104:
	fxors	%f22,	%f6,	%f26
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%o5
	xnor	%o4,	%o7,	%l1
	set	0x58, %l0
	prefetcha	[%l7 + %l0] 0x14,	 0x1
	fmovrsgz	%l5,	%f10,	%f9
	fmovsg	%icc,	%f15,	%f25
	addc	%o3,	0x0094,	%o0
	movrlz	%o2,	%o6,	%i0
	fnot2	%f12,	%f18
	tsubcctv	%i7,	0x1C59,	%i1
	fpadd32s	%f14,	%f10,	%f29
	tl	%xcc,	0x2
	fmovdle	%icc,	%f28,	%f9
	bcc	loop_2105
	movvc	%xcc,	%i3,	%o1
	tg	%xcc,	0x7
	edge8	%g3,	%l3,	%l0
loop_2105:
	fxnor	%f22,	%f18,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc1,	loop_2106
	udivx	%i6,	0x106F,	%l4
	fbul	%fcc3,	loop_2107
	pdist	%f12,	%f6,	%f12
loop_2106:
	fzeros	%f24
	xnorcc	%i5,	%g7,	%g4
loop_2107:
	alignaddr	%g5,	%g1,	%l2
	umul	%g6,	%g2,	%i4
	movvs	%xcc,	%i2,	%o4
	fmovrdgez	%o5,	%f2,	%f22
	tsubcc	%l1,	%l6,	%l5
	fcmpne32	%f14,	%f22,	%o3
	movn	%xcc,	%o0,	%o2
	fsrc2	%f28,	%f16
	movpos	%xcc,	%o6,	%i0
	fmovsge	%xcc,	%f6,	%f25
	ldd	[%l7 + 0x50],	%o6
	fone	%f30
	ldsw	[%l7 + 0x34],	%i7
	array32	%i3,	%i1,	%o1
	xor	%g3,	0x0B19,	%l3
	movrne	%i6,	%l0,	%l4
	sdivcc	%i5,	0x10CE,	%g4
	fcmpgt16	%f8,	%f20,	%g7
	tgu	%icc,	0x5
	tleu	%xcc,	0x5
	fmovsvc	%icc,	%f19,	%f18
	tcc	%xcc,	0x2
	tgu	%xcc,	0x6
	tgu	%icc,	0x5
	movneg	%icc,	%g5,	%l2
	xorcc	%g6,	%g2,	%i4
	ldub	[%l7 + 0x77],	%i2
	brgez,a	%o4,	loop_2108
	tcc	%xcc,	0x5
	edge8l	%g1,	%l1,	%o5
	udivcc	%l6,	0x1964,	%o3
loop_2108:
	nop
	wr	%g0,	0x10,	%asi
	stba	%o0,	[%l7 + 0x60] %asi
	ld	[%l7 + 0x68],	%f18
	srl	%o2,	%o6,	%l5
	subcc	%o7,	0x198D,	%i0
	flush	%l7 + 0x64
	fbo,a	%fcc2,	loop_2109
	move	%xcc,	%i7,	%i1
	sth	%o1,	[%l7 + 0x24]
	orcc	%i3,	%l3,	%i6
loop_2109:
	fmovsge	%icc,	%f5,	%f15
	movrgz	%g3,	0x2E1,	%l4
	bcs,a,pt	%xcc,	loop_2110
	fcmple32	%f14,	%f20,	%l0
	orn	%g4,	%i5,	%g7
	brnz,a	%l2,	loop_2111
loop_2110:
	fmovs	%f23,	%f26
	addcc	%g5,	0x0CA0,	%g2
	movcc	%icc,	%i4,	%i2
loop_2111:
	fcmpne32	%f12,	%f20,	%o4
	srlx	%g1,	0x0F,	%l1
	andn	%g6,	%l6,	%o5
	fmovsl	%icc,	%f1,	%f31
	brnz,a	%o3,	loop_2112
	brnz	%o0,	loop_2113
	movrne	%o6,	0x219,	%l5
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x62] %asi,	%o7
loop_2112:
	swap	[%l7 + 0x54],	%i0
loop_2113:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i7,	%o2
	udivcc	%o1,	0x1E0B,	%i1
	tcc	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f29,	%f1
	brlz,a	%l3,	loop_2114
	movrne	%i3,	%g3,	%i6
	movpos	%xcc,	%l0,	%g4
	movvs	%icc,	%l4,	%g7
loop_2114:
	array16	%l2,	%i5,	%g2
	brnz,a	%g5,	loop_2115
	lduw	[%l7 + 0x5C],	%i4
	xnorcc	%o4,	%i2,	%g1
	movrlez	%l1,	0x211,	%g6
loop_2115:
	edge8n	%l6,	%o3,	%o0
	set	0x6C, %o2
	lda	[%l7 + %o2] 0x88,	%f30
	fmovsl	%xcc,	%f30,	%f26
	edge16n	%o5,	%o6,	%l5
	nop
	setx loop_2116, %l0, %l1
	jmpl %l1, %i0
	fmovsa	%xcc,	%f6,	%f5
	fandnot1	%f16,	%f16,	%f30
	tgu	%xcc,	0x1
loop_2116:
	movn	%xcc,	%o7,	%i7
	xor	%o1,	0x04F0,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l3,	%i1,	%g3
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x32] %asi,	%i6
	movcc	%xcc,	%l0,	%g4
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%i2
	edge8	%l4,	%l2,	%i5
	fbul	%fcc3,	loop_2117
	movl	%xcc,	%g7,	%g2
	fmovd	%f12,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2117:
	smul	%g5,	%i4,	%o4
	fxors	%f8,	%f5,	%f6
	subccc	%i2,	0x1E9A,	%l1
	tle	%icc,	0x1
	alignaddr	%g1,	%g6,	%l6
	brlez,a	%o3,	loop_2118
	fmovd	%f26,	%f10
	fnands	%f2,	%f28,	%f29
	fand	%f26,	%f10,	%f2
loop_2118:
	sdivcc	%o5,	0x1BC9,	%o6
	tleu	%icc,	0x5
	tne	%icc,	0x5
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	setx loop_2119, %l0, %l1
	jmpl %l1, %l5
	edge32l	%o0,	%o7,	%i7
	subccc	%o1,	%o2,	%i0
	set	0x20, %o0
	ldxa	[%l7 + %o0] 0x15,	%l3
loop_2119:
	fzero	%f28
	tcc	%xcc,	0x1
	ta	%xcc,	0x1
	tcc	%icc,	0x6
	fmovda	%xcc,	%f23,	%f26
	alignaddr	%g3,	%i1,	%i6
	fmovsneg	%xcc,	%f7,	%f15
	andn	%l0,	0x17F7,	%i3
	tleu	%icc,	0x5
	udiv	%g4,	0x1D8A,	%l4
	fcmpgt32	%f4,	%f24,	%i5
	fbule,a	%fcc1,	loop_2120
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l2,	%g2,	%g7
	sdiv	%g5,	0x0480,	%i4
loop_2120:
	fcmps	%fcc0,	%f26,	%f23
	movge	%icc,	%i2,	%o4
	subcc	%g1,	0x0392,	%g6
	udiv	%l1,	0x04F0,	%l6
	taddcc	%o3,	0x160D,	%o5
	prefetch	[%l7 + 0x70],	 0x2
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	nop
	set	0x40, %o1
	std	%f28,	[%l7 + %o1]
	popc	%o0,	%o6
	subccc	%i7,	0x0585,	%o7
	fcmpeq16	%f6,	%f28,	%o2
	movrlez	%o1,	0x094,	%i0
	fcmpgt32	%f20,	%f24,	%l3
	faligndata	%f14,	%f26,	%f20
	nop
	setx	loop_2121,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	pdist	%f22,	%f6,	%f6
	fbn	%fcc3,	loop_2122
	movge	%xcc,	%i1,	%g3
loop_2121:
	sdivcc	%i6,	0x17CE,	%i3
	bleu	loop_2123
loop_2122:
	movg	%icc,	%l0,	%g4
	udiv	%i5,	0x176F,	%l2
	fmovscs	%xcc,	%f8,	%f12
loop_2123:
	mulscc	%g2,	%g7,	%l4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x65] %asi,	%g5
	fcmpd	%fcc0,	%f28,	%f18
	movpos	%icc,	%i4,	%o4
	xnorcc	%g1,	0x1642,	%g6
	ta	%xcc,	0x5
	or	%i2,	%l1,	%o3
	te	%xcc,	0x5
	tl	%icc,	0x6
	subccc	%o5,	%l6,	%l5
	alignaddr	%o6,	%i7,	%o7
	brlz	%o0,	loop_2124
	smul	%o2,	%i0,	%l3
	mulscc	%i1,	0x0DC9,	%g3
	orn	%i6,	0x19DC,	%o1
loop_2124:
	fornot2	%f30,	%f4,	%f4
	movg	%icc,	%i3,	%l0
	smul	%i5,	%g4,	%l2
	tleu	%xcc,	0x4
	edge32ln	%g7,	%l4,	%g5
	fmovrdgez	%i4,	%f20,	%f24
	nop
	setx	loop_2125,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx loop_2126, %l0, %l1
	jmpl %l1, %o4
	tsubcctv	%g2,	0x12A1,	%g6
	tcc	%xcc,	0x1
loop_2125:
	taddcc	%i2,	0x0F10,	%g1
loop_2126:
	tneg	%icc,	0x3
	fcmpes	%fcc1,	%f3,	%f9
	movrgez	%l1,	0x342,	%o5
	fornot1s	%f18,	%f27,	%f0
	orcc	%l6,	0x12B2,	%l5
	movcs	%icc,	%o3,	%i7
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x6D] %asi,	%o6
	alignaddr	%o7,	%o0,	%o2
	mulscc	%l3,	0x03CD,	%i0
	fmuld8ulx16	%f22,	%f13,	%f18
	tle	%xcc,	0x0
	movvs	%xcc,	%g3,	%i1
	movrlez	%i6,	0x15E,	%i3
	edge32ln	%o1,	%l0,	%i5
	fmovdgu	%icc,	%f27,	%f26
	fand	%f4,	%f12,	%f28
	membar	0x53
	fpmerge	%f4,	%f9,	%f12
	ldsh	[%l7 + 0x2A],	%l2
	udivcc	%g4,	0x008F,	%l4
	sdivx	%g5,	0x11FA,	%i4
	ldsw	[%l7 + 0x0C],	%o4
	edge8ln	%g2,	%g7,	%i2
	edge16	%g6,	%g1,	%l1
	movcc	%icc,	%o5,	%l6
	smul	%l5,	0x1DAA,	%i7
	subcc	%o6,	%o3,	%o7
	fnot1	%f18,	%f8
	movre	%o2,	0x2A8,	%l3
	popc	%i0,	%o0
	bcc	loop_2127
	edge8ln	%g3,	%i1,	%i3
	subcc	%o1,	%l0,	%i5
	and	%l2,	%i6,	%g4
loop_2127:
	xnor	%l4,	0x16E2,	%g5
	fornot2	%f14,	%f26,	%f16
	srax	%i4,	0x01,	%o4
	taddcc	%g7,	0x0163,	%i2
	fexpand	%f4,	%f0
	fandnot2s	%f20,	%f5,	%f15
	set	0x1C, %o5
	sta	%f1,	[%l7 + %o5] 0x19
	nop
	setx	loop_2128,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivcc	%g6,	0x1FE3,	%g2
	edge8n	%g1,	%o5,	%l1
	addccc	%l6,	%l5,	%i7
loop_2128:
	fbul,a	%fcc0,	loop_2129
	fpadd32	%f28,	%f0,	%f22
	movgu	%xcc,	%o3,	%o6
	movgu	%icc,	%o7,	%o2
loop_2129:
	bleu,pn	%xcc,	loop_2130
	edge16l	%i0,	%o0,	%g3
	edge8	%l3,	%i3,	%o1
	sdivcc	%i1,	0x1E9D,	%l0
loop_2130:
	xnor	%i5,	%l2,	%g4
	and	%l4,	%i6,	%i4
	movleu	%icc,	%o4,	%g7
	brlz,a	%i2,	loop_2131
	bneg,a,pn	%icc,	loop_2132
	ldub	[%l7 + 0x4D],	%g6
	movcs	%xcc,	%g5,	%g2
loop_2131:
	ldd	[%l7 + 0x78],	%o4
loop_2132:
	bn,a,pn	%xcc,	loop_2133
	tg	%xcc,	0x5
	tsubcc	%g1,	%l1,	%l6
	ble,a,pn	%icc,	loop_2134
loop_2133:
	edge16	%l5,	%i7,	%o3
	fcmple32	%f14,	%f28,	%o7
	fbg	%fcc3,	loop_2135
loop_2134:
	subcc	%o2,	%o6,	%i0
	fnegs	%f30,	%f17
	and	%o0,	%g3,	%i3
loop_2135:
	movvs	%icc,	%o1,	%l3
	sub	%l0,	0x1636,	%i5
	fmovdcs	%icc,	%f27,	%f27
	popc	0x1760,	%i1
	edge16n	%l2,	%g4,	%l4
	nop
	set	0x28, %g3
	stw	%i6,	[%l7 + %g3]
	udivcc	%i4,	0x1670,	%o4
	edge32	%g7,	%g6,	%i2
	bvc	%xcc,	loop_2136
	edge16ln	%g5,	%o5,	%g2
	movn	%xcc,	%g1,	%l6
	bl,a,pt	%xcc,	loop_2137
loop_2136:
	xnor	%l5,	%l1,	%i7
	lduh	[%l7 + 0x50],	%o3
	bg	loop_2138
loop_2137:
	fxnors	%f7,	%f14,	%f13
	and	%o2,	0x0FC9,	%o7
	udiv	%o6,	0x02B3,	%o0
loop_2138:
	nop
	set	0x68, %l3
	ldswa	[%l7 + %l3] 0x0c,	%g3
	tn	%xcc,	0x6
	tvs	%xcc,	0x7
	fbug,a	%fcc1,	loop_2139
	tcc	%xcc,	0x4
	tne	%xcc,	0x0
	fmovrsne	%i3,	%f24,	%f29
loop_2139:
	nop
	wr	%g0,	0x27,	%asi
	stda	%o0,	[%l7 + 0x38] %asi
	membar	#Sync
	xor	%l3,	0x157E,	%i0
	movcs	%icc,	%l0,	%i5
	movvs	%xcc,	%i1,	%g4
	andn	%l2,	%l4,	%i6
	mulx	%o4,	%i4,	%g7
	edge16ln	%i2,	%g5,	%o5
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	umul	%g6,	%g1,	%l6
	tn	%xcc,	0x6
	movge	%xcc,	%l1,	%l5
	fmovde	%icc,	%f6,	%f7
	movle	%xcc,	%i7,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%o7,	loop_2140
	edge32	%o6,	%o0,	%g3
	edge16ln	%o2,	%o1,	%i3
	set	0x40, %l6
	lda	[%l7 + %l6] 0x0c,	%f27
loop_2140:
	fmovrsne	%l3,	%f22,	%f23
	movre	%l0,	0x3D8,	%i5
	edge8n	%i1,	%g4,	%i0
	fmovscs	%xcc,	%f0,	%f27
	fmovdpos	%xcc,	%f17,	%f27
	set	0x28, %i3
	lduwa	[%l7 + %i3] 0x11,	%l2
	tcs	%xcc,	0x6
	set	0x15, %g2
	ldsba	[%l7 + %g2] 0x19,	%l4
	fzeros	%f19
	orncc	%i6,	%o4,	%i4
	edge8	%g7,	%g5,	%i2
	membar	0x40
	movge	%icc,	%o5,	%g2
	addcc	%g1,	%g6,	%l1
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	udiv	%l6,	0x028D,	%i7
	xor	%o3,	%l5,	%o7
	movne	%xcc,	%o0,	%o6
	fpadd32	%f22,	%f10,	%f16
	sdivx	%o2,	0x0FB0,	%o1
	subc	%i3,	%g3,	%l0
	movrlz	%i5,	%i1,	%l3
	edge16	%i0,	%l2,	%l4
	addccc	%i6,	0x1CBB,	%g4
	mova	%xcc,	%i4,	%g7
	tvc	%icc,	0x4
	tne	%xcc,	0x1
	move	%icc,	%o4,	%i2
	fandnot2	%f8,	%f12,	%f12
	movne	%icc,	%g5,	%o5
	alignaddr	%g2,	%g1,	%l1
	fmovrslz	%g6,	%f7,	%f12
	xor	%l6,	0x1979,	%o3
	movrlz	%l5,	%o7,	%o0
	orn	%o6,	%i7,	%o2
	fmovdvs	%icc,	%f3,	%f3
	tpos	%xcc,	0x3
	array32	%i3,	%g3,	%o1
	siam	0x2
	array32	%i5,	%l0,	%l3
	udivcc	%i0,	0x08CD,	%l2
	tn	%icc,	0x2
	movre	%l4,	0x206,	%i1
	orn	%i6,	0x01DE,	%i4
	movg	%icc,	%g7,	%g4
	fandnot1s	%f24,	%f11,	%f9
	fones	%f5
	set	0x58, %i0
	ldxa	[%l7 + %i0] 0x81,	%i2
	xorcc	%o4,	0x05AA,	%g5
	fpack32	%f12,	%f8,	%f2
	orcc	%g2,	0x14E9,	%g1
	fmovrdlez	%l1,	%f4,	%f4
	movrgz	%o5,	0x121,	%g6
	fmuld8ulx16	%f0,	%f10,	%f6
	swap	[%l7 + 0x20],	%l6
	alignaddrl	%o3,	%l5,	%o7
	edge16n	%o0,	%o6,	%o2
	fmovsg	%icc,	%f7,	%f29
	movvs	%icc,	%i7,	%g3
	edge32l	%o1,	%i3,	%l0
	udivcc	%i5,	0x1061,	%i0
	fmovrdlez	%l3,	%f24,	%f14
	edge32n	%l4,	%i1,	%i6
	fandnot1s	%f6,	%f6,	%f19
	tleu	%icc,	0x2
	fpadd16	%f24,	%f22,	%f6
	addcc	%i4,	0x0931,	%g7
	tgu	%icc,	0x1
	edge16l	%l2,	%i2,	%o4
	umul	%g4,	0x1730,	%g5
	fcmpeq16	%f16,	%f18,	%g2
	orcc	%g1,	%o5,	%l1
	smul	%l6,	0x0501,	%g6
	movre	%o3,	0x275,	%l5
	membar	0x48
	set	0x58, %i7
	lduwa	[%l7 + %i7] 0x19,	%o7
	array16	%o0,	%o6,	%i7
	sth	%o2,	[%l7 + 0x14]
	bgu,pn	%icc,	loop_2141
	ta	%icc,	0x5
	fpsub32	%f16,	%f6,	%f6
	fornot2	%f22,	%f18,	%f4
loop_2141:
	edge32ln	%g3,	%i3,	%o1
	srl	%i5,	%l0,	%i0
	taddcctv	%l3,	0x14E8,	%l4
	udivx	%i6,	0x1246,	%i4
	prefetch	[%l7 + 0x40],	 0x0
	tgu	%icc,	0x1
	edge8n	%i1,	%l2,	%i2
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x30] %asi,	%g7
	ldd	[%l7 + 0x60],	%f2
	fpsub32	%f18,	%f6,	%f30
	movg	%icc,	%g4,	%o4
	movneg	%xcc,	%g2,	%g1
	fmovrdgez	%o5,	%f20,	%f30
	fmovdn	%icc,	%f23,	%f9
	move	%icc,	%g5,	%l6
	movn	%icc,	%l1,	%g6
	sethi	0x1B09,	%o3
	tl	%icc,	0x2
	fmovde	%icc,	%f0,	%f22
	ldsb	[%l7 + 0x57],	%l5
	array32	%o0,	%o6,	%o7
	edge16ln	%i7,	%o2,	%g3
	tl	%icc,	0x5
	addccc	%o1,	0x1900,	%i5
	tneg	%xcc,	0x4
	taddcctv	%l0,	0x14B4,	%i0
	nop
	setx	loop_2142,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movleu	%xcc,	%i3,	%l3
	fmul8sux16	%f14,	%f14,	%f0
	edge8l	%i6,	%l4,	%i4
loop_2142:
	mulx	%l2,	0x1BAC,	%i2
	st	%f29,	[%l7 + 0x40]
	set	0x10, %g5
	lda	[%l7 + %g5] 0x14,	%f12
	set	0x49, %o3
	ldstuba	[%l7 + %o3] 0x04,	%i1
	array8	%g4,	%g7,	%g2
	fmovsa	%xcc,	%f26,	%f2
	umul	%g1,	0x0483,	%o5
	fmovrsgz	%g5,	%f16,	%f27
	be	loop_2143
	fnors	%f0,	%f17,	%f31
	fbuge,a	%fcc2,	loop_2144
	fmovs	%f6,	%f2
loop_2143:
	addcc	%l6,	%o4,	%g6
	tgu	%icc,	0x0
loop_2144:
	andncc	%o3,	%l1,	%l5
	sllx	%o6,	%o0,	%i7
	fmovrsgz	%o7,	%f17,	%f26
	taddcctv	%o2,	0x0618,	%g3
	umulcc	%i5,	0x0EC4,	%o1
	sdivcc	%i0,	0x0AEF,	%i3
	ba	loop_2145
	fandnot1	%f18,	%f14,	%f18
	taddcc	%l3,	%l0,	%l4
	edge32l	%i4,	%i6,	%l2
loop_2145:
	tsubcc	%i1,	0x0B95,	%i2
	swap	[%l7 + 0x60],	%g4
	flush	%l7 + 0x3C
	st	%f2,	[%l7 + 0x1C]
	sdiv	%g2,	0x0651,	%g1
	fmuld8sux16	%f31,	%f11,	%f4
	fmuld8sux16	%f29,	%f7,	%f12
	bn,a,pn	%xcc,	loop_2146
	fand	%f16,	%f10,	%f26
	movg	%icc,	%g7,	%g5
	movcc	%icc,	%l6,	%o4
loop_2146:
	fba,a	%fcc2,	loop_2147
	fmovdgu	%xcc,	%f2,	%f14
	set	0x78, %i1
	sta	%f5,	[%l7 + %i1] 0x10
loop_2147:
	fcmped	%fcc1,	%f4,	%f22
	edge32	%g6,	%o3,	%l1
	mulscc	%o5,	%o6,	%o0
	set	0x40, %o4
	stxa	%l5,	[%l7 + %o4] 0xe2
	membar	#Sync
	movn	%icc,	%i7,	%o7
	subccc	%g3,	%i5,	%o1
	addc	%o2,	%i3,	%i0
	movneg	%xcc,	%l0,	%l3
	be,a	%icc,	loop_2148
	srl	%l4,	0x0D,	%i6
	fbl	%fcc1,	loop_2149
	fmovde	%icc,	%f10,	%f29
loop_2148:
	edge8ln	%l2,	%i4,	%i2
	tgu	%icc,	0x4
loop_2149:
	tn	%xcc,	0x1
	tvs	%icc,	0x4
	srl	%i1,	%g4,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%g2,	%g7
	membar	0x29
	fornot2s	%f29,	%f2,	%f27
	sethi	0x173C,	%g5
	fands	%f10,	%f25,	%f20
	fsrc1	%f20,	%f28
	xorcc	%l6,	%o4,	%o3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x58] %asi,	%g6
	bg,a	loop_2150
	edge32n	%o5,	%o6,	%l1
	fpadd16	%f20,	%f22,	%f24
	fmovrslz	%o0,	%f19,	%f18
loop_2150:
	fmovdne	%xcc,	%f24,	%f22
	fpsub16s	%f24,	%f28,	%f18
	fnor	%f6,	%f22,	%f0
	edge16ln	%l5,	%o7,	%g3
	fmul8x16au	%f6,	%f19,	%f10
	tne	%xcc,	0x5
	addccc	%i5,	%o1,	%i7
	array16	%o2,	%i3,	%i0
	ldub	[%l7 + 0x36],	%l0
	nop
	setx loop_2151, %l0, %l1
	jmpl %l1, %l4
	movrne	%l3,	%l2,	%i4
	fcmpd	%fcc2,	%f10,	%f4
	fbu	%fcc0,	loop_2152
loop_2151:
	fmovdleu	%xcc,	%f25,	%f3
	bneg,a,pt	%xcc,	loop_2153
	udivcc	%i2,	0x0A29,	%i6
loop_2152:
	movrgz	%i1,	%g1,	%g4
	movneg	%xcc,	%g2,	%g7
loop_2153:
	fmovdne	%icc,	%f22,	%f1
	fmovd	%f30,	%f22
	add	%g5,	%o4,	%l6
	mulx	%g6,	%o5,	%o3
	membar	0x53
	udivx	%o6,	0x172E,	%l1
	tvs	%icc,	0x3
	fmul8ulx16	%f14,	%f14,	%f12
	andcc	%l5,	%o7,	%g3
	mova	%xcc,	%o0,	%i5
	and	%i7,	0x150E,	%o1
	subc	%i3,	%o2,	%i0
	fmovrdlez	%l4,	%f22,	%f26
	orn	%l3,	%l2,	%l0
	ldsh	[%l7 + 0x3C],	%i2
	fbo,a	%fcc1,	loop_2154
	sra	%i6,	%i4,	%i1
	subc	%g4,	0x1911,	%g1
	fsrc1	%f18,	%f10
loop_2154:
	fbug	%fcc0,	loop_2155
	movneg	%xcc,	%g7,	%g5
	fmovrde	%g2,	%f4,	%f18
	bpos	loop_2156
loop_2155:
	fcmpes	%fcc0,	%f30,	%f11
	fmuld8ulx16	%f8,	%f28,	%f18
	orn	%o4,	0x0DD2,	%l6
loop_2156:
	nop
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%o5,	%o3
	movrgez	%o6,	0x217,	%l1
	andcc	%l5,	%g6,	%g3
	addc	%o0,	0x0FA5,	%o7
	xnorcc	%i5,	0x131B,	%o1
	fblg,a	%fcc2,	loop_2157
	ba,pt	%icc,	loop_2158
	flush	%l7 + 0x6C
	edge8	%i3,	%i7,	%i0
loop_2157:
	edge16	%l4,	%l3,	%l2
loop_2158:
	tsubcc	%o2,	0x1BA1,	%i2
	movvs	%icc,	%i6,	%i4
	set	0x10, %l2
	ldda	[%l7 + %l2] 0x23,	%l0
	edge8l	%i1,	%g4,	%g1
	tn	%icc,	0x2
	array8	%g7,	%g5,	%g2
	tsubcc	%o4,	%o5,	%l6
	fnegs	%f21,	%f26
	tpos	%icc,	0x6
	edge32l	%o3,	%l1,	%o6
	movcs	%icc,	%l5,	%g6
	fpadd16	%f10,	%f16,	%f18
	fnegs	%f11,	%f1
	fmovsa	%icc,	%f2,	%f0
	udivcc	%g3,	0x07D5,	%o7
	te	%icc,	0x4
	set	0x24, %g1
	lda	[%l7 + %g1] 0x10,	%f11
	fnot2	%f24,	%f18
	orncc	%i5,	%o1,	%i3
	movge	%icc,	%i7,	%i0
	tle	%xcc,	0x2
	fnegs	%f12,	%f17
	brgz,a	%o0,	loop_2159
	fors	%f29,	%f5,	%f1
	subccc	%l4,	%l2,	%o2
	andncc	%l3,	%i2,	%i4
loop_2159:
	nop
	set	0x52, %l4
	sth	%i6,	[%l7 + %l4]
	array8	%i1,	%l0,	%g1
	movrlz	%g4,	0x24D,	%g5
	fxnor	%f12,	%f20,	%f16
	sir	0x1F8C
	ble,pn	%xcc,	loop_2160
	ble	loop_2161
	brnz	%g2,	loop_2162
	stb	%o4,	[%l7 + 0x45]
loop_2160:
	movne	%xcc,	%o5,	%g7
loop_2161:
	movneg	%icc,	%o3,	%l6
loop_2162:
	fmovdge	%icc,	%f17,	%f3
	fmovdpos	%icc,	%f7,	%f29
	set	0x30, %i5
	stxa	%o6,	[%l7 + %i5] 0xeb
	membar	#Sync
	movn	%xcc,	%l1,	%g6
	nop
	set	0x58, %o7
	prefetch	[%l7 + %o7],	 0x2
	xnorcc	%g3,	0x018B,	%o7
	fxor	%f10,	%f0,	%f20
	sir	0x176E
	tleu	%xcc,	0x4
	tle	%xcc,	0x5
	fmovdneg	%icc,	%f4,	%f13
	fbe	%fcc2,	loop_2163
	nop
	setx	loop_2164,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%xcc,	0x3
	mulscc	%l5,	0x1290,	%i5
loop_2163:
	nop
	set	0x70, %i4
	sth	%o1,	[%l7 + %i4]
loop_2164:
	edge8l	%i3,	%i7,	%i0
	edge16	%o0,	%l4,	%l2
	movrlez	%l3,	0x089,	%o2
	fmovrsgz	%i2,	%f15,	%f8
	fbue,a	%fcc0,	loop_2165
	edge32n	%i4,	%i1,	%l0
	movne	%xcc,	%g1,	%g4
	ldsh	[%l7 + 0x58],	%i6
loop_2165:
	fmovsvc	%icc,	%f16,	%f23
	orncc	%g2,	0x00DD,	%o4
	tvc	%icc,	0x0
	andn	%g5,	0x0897,	%g7
	sir	0x1862
	movvs	%xcc,	%o5,	%o3
	edge32	%l6,	%l1,	%g6
	fbu,a	%fcc1,	loop_2166
	edge8	%o6,	%g3,	%o7
	tsubcctv	%l5,	%o1,	%i5
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x5A] %asi,	%i3
loop_2166:
	fbue	%fcc0,	loop_2167
	edge16ln	%i0,	%i7,	%o0
	fmuld8ulx16	%f5,	%f10,	%f24
	fmovsa	%icc,	%f1,	%f26
loop_2167:
	movleu	%xcc,	%l2,	%l4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x0D] %asi,	%l3
	tl	%xcc,	0x0
	xor	%i2,	%i4,	%o2
	srl	%i1,	0x09,	%l0
	movn	%icc,	%g4,	%g1
	ldstub	[%l7 + 0x3A],	%g2
	sdiv	%i6,	0x172B,	%o4
	srl	%g7,	0x1F,	%g5
	fornot2s	%f2,	%f19,	%f20
	wr	%g0,	0x57,	%asi
	stxa	%o3,	[%g0 + 0x0] %asi
	sdivx	%o5,	0x1193,	%l1
	tneg	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x3
	std	%f28,	[%l7 + 0x18]
	movl	%xcc,	%g6,	%l6
	movcs	%icc,	%g3,	%o6
	nop
	set	0x38, %g7
	ldd	[%l7 + %g7],	%o6
	mova	%icc,	%o1,	%i5
	sir	0x064A
	fornot1s	%f22,	%f22,	%f31
	array16	%i3,	%i0,	%i7
	movre	%l5,	0x174,	%o0
	tsubcctv	%l2,	%l4,	%i2
	nop
	set	0x0C, %o6
	prefetch	[%l7 + %o6],	 0x0
	fmovd	%f12,	%f10
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x38] %asi,	%l3
	smul	%o2,	%i1,	%i4
	nop
	set	0x50, %i2
	stb	%g4,	[%l7 + %i2]
	set	0x30, %g6
	stda	%l0,	[%l7 + %g6] 0x23
	membar	#Sync
	brz,a	%g1,	loop_2168
	tgu	%xcc,	0x3
	ldd	[%l7 + 0x50],	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2168:
	edge16l	%i6,	%o4,	%g7
	mulscc	%o3,	%g5,	%l1
	srlx	%g6,	%l6,	%g3
	edge8n	%o5,	%o6,	%o1
	edge16n	%i5,	%o7,	%i3
	fbg,a	%fcc0,	loop_2169
	srl	%i0,	0x02,	%i7
	bne,pt	%icc,	loop_2170
	movne	%icc,	%l5,	%l2
loop_2169:
	fble	%fcc1,	loop_2171
	movvs	%icc,	%o0,	%l4
loop_2170:
	membar	0x14
	move	%xcc,	%l3,	%i2
loop_2171:
	movle	%xcc,	%o2,	%i4
	fcmps	%fcc3,	%f5,	%f16
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x31] %asi,	%g4
	movne	%xcc,	%l0,	%g1
	fmovdn	%xcc,	%f2,	%f8
	nop
	set	0x74, %g4
	stw	%g2,	[%l7 + %g4]
	fnegs	%f31,	%f22
	fand	%f4,	%f24,	%f12
	sub	%i1,	0x1A04,	%i6
	fcmps	%fcc0,	%f8,	%f20
	fmul8x16au	%f25,	%f16,	%f24
	fmovrdlz	%g7,	%f14,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f8,	%f8,	%f8
	addc	%o4,	%g5,	%o3
	movle	%icc,	%g6,	%l1
	movcc	%icc,	%g3,	%l6
	fba	%fcc3,	loop_2172
	sdivx	%o6,	0x1500,	%o5
	srlx	%i5,	%o7,	%o1
	fxnors	%f24,	%f11,	%f9
loop_2172:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%i3
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x24] %asi,	%f22
	sdivcc	%l5,	0x1161,	%l2
	fmovrsgz	%o0,	%f5,	%f10
	fbuge	%fcc2,	loop_2173
	tvs	%icc,	0x5
	fmovsl	%icc,	%f29,	%f4
	st	%f12,	[%l7 + 0x70]
loop_2173:
	udivx	%l4,	0x144C,	%l3
	brlz	%i7,	loop_2174
	sdivcc	%o2,	0x1254,	%i4
	movneg	%icc,	%i2,	%l0
	bvc	loop_2175
loop_2174:
	tgu	%xcc,	0x2
	sir	0x0842
	addcc	%g1,	0x0646,	%g4
loop_2175:
	sllx	%g2,	%i1,	%g7
	fmovsne	%xcc,	%f23,	%f28
	wr	%g0,	0x21,	%asi
	stxa	%i6,	[%g0 + 0x110] %asi
	tcs	%xcc,	0x0
	ldstub	[%l7 + 0x54],	%g5
	fmovdgu	%xcc,	%f29,	%f27
	fcmpne32	%f0,	%f20,	%o4
	orn	%o3,	%l1,	%g6
	bneg	%icc,	loop_2176
	movn	%icc,	%l6,	%o6
	ldsw	[%l7 + 0x3C],	%g3
	fmovrslez	%o5,	%f16,	%f15
loop_2176:
	fmovrslez	%o7,	%f17,	%f17
	fblg	%fcc1,	loop_2177
	fands	%f12,	%f9,	%f12
	fcmpne16	%f24,	%f0,	%i5
	movrlz	%i0,	%o1,	%l5
loop_2177:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f15,	[%l7 + 0x4C] %asi
	sth	%l2,	[%l7 + 0x34]
	fxnors	%f31,	%f1,	%f19
	srl	%o0,	0x10,	%i3
	tcc	%xcc,	0x0
	movn	%xcc,	%l4,	%i7
	brgz	%l3,	loop_2178
	ld	[%l7 + 0x08],	%f0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%i4
loop_2178:
	tl	%xcc,	0x5
	mulx	%i2,	0x103C,	%l0
	brgz	%g1,	loop_2179
	tsubcctv	%o2,	%g4,	%g2
	tpos	%icc,	0x6
	movrlez	%g7,	0x3EA,	%i6
loop_2179:
	nop
	wr	%g0,	0x18,	%asi
	stwa	%i1,	[%l7 + 0x54] %asi
	array16	%g5,	%o3,	%l1
	siam	0x4
	taddcc	%o4,	%g6,	%o6
	srax	%l6,	%g3,	%o5
	fpadd32	%f0,	%f8,	%f20
	subcc	%o7,	0x1B1D,	%i0
	nop
	set	0x60, %l1
	ldsb	[%l7 + %l1],	%o1
	addccc	%i5,	0x0945,	%l5
	tne	%icc,	0x7
	tl	%icc,	0x5
	sll	%l2,	0x06,	%o0
	brz,a	%i3,	loop_2180
	sdivx	%l4,	0x1D57,	%i7
	fnegs	%f2,	%f25
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x04
loop_2180:
	array8	%i4,	%l3,	%i2
	fxor	%f28,	%f14,	%f4
	movle	%xcc,	%l0,	%g1
	movg	%xcc,	%o2,	%g4
	movge	%icc,	%g7,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f27,	%f31
	brgz,a	%i6,	loop_2181
	fbe,a	%fcc3,	loop_2182
	addc	%i1,	%g5,	%o3
	sdiv	%o4,	0x002C,	%g6
loop_2181:
	fpmerge	%f2,	%f4,	%f30
loop_2182:
	edge32	%o6,	%l6,	%l1
	movleu	%icc,	%g3,	%o5
	popc	%i0,	%o1
	movne	%xcc,	%i5,	%l5
	fcmps	%fcc2,	%f10,	%f23
	tgu	%icc,	0x6
	fmul8ulx16	%f18,	%f22,	%f26
	set	0x7E, %l0
	stba	%l2,	[%l7 + %l0] 0x11
	movne	%icc,	%o7,	%o0
	smul	%i3,	0x0014,	%i7
	tge	%icc,	0x5
	edge32l	%i4,	%l3,	%l4
	srlx	%l0,	0x16,	%i2
	fsrc1	%f12,	%f4
	fmovrdgez	%o2,	%f10,	%f24
	membar	0x7B
	edge8l	%g4,	%g1,	%g2
	fpack16	%f30,	%f16
	umulcc	%g7,	0x1EA0,	%i1
	for	%f6,	%f28,	%f12
	edge32n	%i6,	%g5,	%o3
	andncc	%g6,	%o4,	%o6
	fnand	%f28,	%f28,	%f6
	ld	[%l7 + 0x7C],	%f5
	movg	%xcc,	%l1,	%l6
	mova	%icc,	%g3,	%o5
	brz	%o1,	loop_2183
	smulcc	%i0,	%l5,	%i5
	fsrc1	%f2,	%f30
	movl	%icc,	%l2,	%o7
loop_2183:
	movrlz	%o0,	%i7,	%i3
	edge8n	%i4,	%l4,	%l3
	ldd	[%l7 + 0x70],	%f26
	membar	0x60
	fbug,a	%fcc2,	loop_2184
	movneg	%icc,	%l0,	%i2
	edge8n	%o2,	%g1,	%g4
	edge32l	%g7,	%i1,	%i6
loop_2184:
	move	%xcc,	%g2,	%g5
	udiv	%o3,	0x0370,	%o4
	umul	%o6,	%g6,	%l1
	or	%g3,	%o5,	%l6
	xnorcc	%o1,	0x17C2,	%l5
	tsubcctv	%i0,	0x10EA,	%i5
	bcs,a	%icc,	loop_2185
	movneg	%xcc,	%o7,	%o0
	fbul,a	%fcc0,	loop_2186
	andn	%i7,	%i3,	%i4
loop_2185:
	fmuld8ulx16	%f17,	%f0,	%f0
	tne	%xcc,	0x7
loop_2186:
	bne	%icc,	loop_2187
	or	%l4,	%l2,	%l0
	addccc	%i2,	%l3,	%o2
	fmovsneg	%icc,	%f11,	%f19
loop_2187:
	movcc	%icc,	%g4,	%g1
	addc	%i1,	%g7,	%g2
	fmovrsgz	%i6,	%f1,	%f28
	fmovsa	%xcc,	%f16,	%f14
	fbne,a	%fcc2,	loop_2188
	st	%f0,	[%l7 + 0x58]
	tvc	%icc,	0x6
	movvc	%icc,	%o3,	%o4
loop_2188:
	edge32n	%o6,	%g5,	%g6
	fbe	%fcc1,	loop_2189
	movl	%icc,	%l1,	%g3
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x18
loop_2189:
	fbuge,a	%fcc2,	loop_2190
	edge32l	%l6,	%o1,	%l5
	orncc	%o5,	%i5,	%o7
	movrlz	%o0,	0x2A5,	%i7
loop_2190:
	stx	%i3,	[%l7 + 0x08]
	movrlz	%i0,	0x247,	%l4
	fpadd32	%f8,	%f4,	%f16
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%f0
	andn	%i4,	0x1C8E,	%l0
	nop
	setx	loop_2191,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgez	%i2,	loop_2192
	mulx	%l2,	%l3,	%o2
	taddcc	%g4,	0x0CB1,	%g1
loop_2191:
	fpadd32	%f12,	%f18,	%f10
loop_2192:
	alignaddr	%i1,	%g2,	%g7
	edge8n	%i6,	%o3,	%o6
	call	loop_2193
	ldsb	[%l7 + 0x15],	%g5
	tvs	%xcc,	0x0
	fmovdge	%icc,	%f30,	%f21
loop_2193:
	fcmped	%fcc2,	%f8,	%f16
	movl	%icc,	%o4,	%l1
	movrgez	%g3,	0x08B,	%l6
	sdivx	%o1,	0x1E71,	%l5
	st	%f19,	[%l7 + 0x50]
	fcmpes	%fcc2,	%f30,	%f22
	set	0x3E, %i6
	lduha	[%l7 + %i6] 0x11,	%g6
	fpsub32s	%f27,	%f30,	%f6
	fblg	%fcc3,	loop_2194
	edge32l	%i5,	%o5,	%o0
	movvs	%xcc,	%o7,	%i7
	addc	%i0,	%i3,	%l4
loop_2194:
	orcc	%l0,	0x09B1,	%i2
	swap	[%l7 + 0x7C],	%i4
	nop
	setx	loop_2195,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdpos	%icc,	%f31,	%f10
	tpos	%icc,	0x2
	edge32n	%l2,	%l3,	%g4
loop_2195:
	bge	%icc,	loop_2196
	umulcc	%o2,	%g1,	%i1
	edge16n	%g7,	%i6,	%g2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x48] %asi,	%o3
loop_2196:
	nop
	set	0x50, %o1
	std	%f24,	[%l7 + %o1]
	xnor	%o6,	%g5,	%o4
	faligndata	%f10,	%f10,	%f28
	sub	%l1,	0x1679,	%l6
	fcmpes	%fcc1,	%f18,	%f30
	fbug,a	%fcc2,	loop_2197
	array16	%g3,	%o1,	%l5
	bn,a	loop_2198
	movgu	%icc,	%g6,	%o5
loop_2197:
	sdivcc	%o0,	0x0CAA,	%o7
	bn,a,pn	%icc,	loop_2199
loop_2198:
	fbg,a	%fcc1,	loop_2200
	fands	%f7,	%f8,	%f9
	faligndata	%f26,	%f2,	%f8
loop_2199:
	fcmped	%fcc1,	%f16,	%f10
loop_2200:
	fmuld8ulx16	%f27,	%f7,	%f24
	fbule	%fcc1,	loop_2201
	xor	%i7,	0x1F78,	%i5
	movvs	%xcc,	%i3,	%l4
	fpack16	%f30,	%f5
loop_2201:
	ble,a	%xcc,	loop_2202
	move	%xcc,	%l0,	%i0
	brnz	%i4,	loop_2203
	fbu,a	%fcc2,	loop_2204
loop_2202:
	taddcctv	%l2,	%i2,	%l3
	be	loop_2205
loop_2203:
	edge8l	%g4,	%o2,	%g1
loop_2204:
	brgz,a	%i1,	loop_2206
	umul	%i6,	%g2,	%g7
loop_2205:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%o6,	0x11F7,	%o3
loop_2206:
	ldx	[%l7 + 0x70],	%g5
	bneg,a,pt	%xcc,	loop_2207
	bne	%xcc,	loop_2208
	fnegd	%f4,	%f26
	movcc	%xcc,	%o4,	%l6
loop_2207:
	movrgz	%g3,	%l1,	%l5
loop_2208:
	addc	%g6,	%o5,	%o0
	fmul8x16au	%f20,	%f16,	%f24
	fbul	%fcc1,	loop_2209
	edge16	%o1,	%i7,	%i5
	std	%i2,	[%l7 + 0x48]
	tl	%icc,	0x0
loop_2209:
	tge	%icc,	0x5
	fnor	%f14,	%f22,	%f26
	bcs,a	loop_2210
	ldx	[%l7 + 0x60],	%o7
	tn	%icc,	0x7
	te	%xcc,	0x6
loop_2210:
	tsubcctv	%l4,	%i0,	%i4
	tvs	%icc,	0x5
	set	0x5C, %o5
	stba	%l2,	[%l7 + %o5] 0x18
	ba,pn	%icc,	loop_2211
	fbul	%fcc1,	loop_2212
	fand	%f10,	%f26,	%f6
	movrlez	%l0,	0x18D,	%i2
loop_2211:
	umul	%g4,	%o2,	%g1
loop_2212:
	srl	%i1,	0x05,	%l3
	set	0x1C, %g3
	lda	[%l7 + %g3] 0x15,	%f26
	tgu	%xcc,	0x6
	movvs	%xcc,	%i6,	%g2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%g7,	%o3
	ld	[%l7 + 0x78],	%f25
	fmovdvc	%xcc,	%f13,	%f21
	alignaddr	%o6,	%o4,	%l6
	addc	%g5,	0x10C6,	%g3
	bge,pt	%xcc,	loop_2213
	fornot1s	%f5,	%f20,	%f6
	movcc	%icc,	%l5,	%l1
	sra	%g6,	%o0,	%o5
loop_2213:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x64] %asi,	%o1
	mova	%xcc,	%i7,	%i5
	array8	%i3,	%l4,	%i0
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	addcc	%i4,	0x073B,	%o7
	tleu	%icc,	0x2
	movvs	%icc,	%l2,	%i2
	movcc	%icc,	%l0,	%g4
	fbule,a	%fcc1,	loop_2214
	fand	%f18,	%f20,	%f0
	alignaddr	%o2,	%i1,	%g1
	movvs	%xcc,	%i6,	%g2
loop_2214:
	edge32l	%l3,	%o3,	%g7
	fsrc1s	%f21,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f30,	%f12,	%o4
	movpos	%xcc,	%l6,	%g5
	tvc	%icc,	0x1
	edge8n	%g3,	%o6,	%l1
	fabsd	%f2,	%f0
	fbul	%fcc1,	loop_2215
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l5,	%o0,	%o5
	umul	%o1,	%g6,	%i5
loop_2215:
	ta	%icc,	0x1
	fmovsg	%xcc,	%f13,	%f7
	xor	%i3,	%l4,	%i7
	and	%i4,	%o7,	%i0
	set	0x0B, %l3
	stba	%i2,	[%l7 + %l3] 0xeb
	membar	#Sync
	add	%l2,	0x118A,	%g4
	umul	%o2,	0x0E64,	%i1
	fmovsn	%xcc,	%f17,	%f24
	subccc	%g1,	0x15C7,	%i6
	set	0x3E, %i3
	lduba	[%l7 + %i3] 0x89,	%g2
	umul	%l0,	0x1E1B,	%o3
	subc	%g7,	%o4,	%l6
	fmovsleu	%xcc,	%f11,	%f20
	set	0x58, %g2
	stxa	%l3,	[%l7 + %g2] 0x10
	mova	%icc,	%g3,	%g5
	movrgz	%o6,	0x3A5,	%l5
	std	%f2,	[%l7 + 0x38]
	bvs,a,pt	%icc,	loop_2216
	fandnot2s	%f18,	%f22,	%f5
	srlx	%o0,	%l1,	%o1
	fxnor	%f30,	%f6,	%f8
loop_2216:
	movvc	%xcc,	%o5,	%g6
	fmovdcc	%icc,	%f20,	%f5
	flush	%l7 + 0x18
	movrlz	%i5,	0x11F,	%i3
	fbe	%fcc1,	loop_2217
	sll	%l4,	0x0A,	%i7
	tvc	%icc,	0x1
	fmovda	%icc,	%f5,	%f11
loop_2217:
	andcc	%o7,	%i0,	%i4
	fmovrdgz	%i2,	%f8,	%f26
	nop
	set	0x0C, %i0
	ldsw	[%l7 + %i0],	%l2
	fbl	%fcc2,	loop_2218
	brgez,a	%o2,	loop_2219
	alignaddrl	%i1,	%g1,	%i6
	nop
	set	0x48, %l6
	ldd	[%l7 + %l6],	%g4
loop_2218:
	addc	%l0,	0x16CE,	%g2
loop_2219:
	subcc	%g7,	%o3,	%o4
	fands	%f19,	%f2,	%f7
	udiv	%l3,	0x0BDA,	%g3
	fpackfix	%f22,	%f3
	subcc	%l6,	%g5,	%o6
	andn	%l5,	0x1E86,	%o0
	tsubcc	%l1,	0x164F,	%o1
	movn	%icc,	%o5,	%i5
	srl	%i3,	0x02,	%l4
	fmovrdlz	%i7,	%f18,	%f22
	fcmple32	%f0,	%f14,	%g6
	fbul	%fcc0,	loop_2220
	tgu	%xcc,	0x0
	tsubcctv	%o7,	%i4,	%i0
	sir	0x0E57
loop_2220:
	bn,a,pt	%icc,	loop_2221
	ta	%xcc,	0x2
	sub	%l2,	%o2,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2221:
	fandnot1	%f22,	%f28,	%f30
	movge	%xcc,	%g1,	%i2
	fbl,a	%fcc3,	loop_2222
	ld	[%l7 + 0x5C],	%f12
	xorcc	%g4,	%l0,	%i6
	fmovsneg	%icc,	%f8,	%f26
loop_2222:
	edge8n	%g7,	%g2,	%o4
	fpack16	%f24,	%f11
	or	%l3,	0x115E,	%g3
	movvs	%xcc,	%o3,	%l6
	mova	%xcc,	%o6,	%g5
	tpos	%xcc,	0x5
	st	%f30,	[%l7 + 0x0C]
	tl	%icc,	0x4
	andncc	%o0,	%l1,	%l5
	membar	0x05
	fmovdvs	%icc,	%f14,	%f13
	fxor	%f22,	%f4,	%f22
	edge16ln	%o5,	%o1,	%i3
	andn	%i5,	0x197B,	%i7
	wr	%g0,	0x19,	%asi
	stha	%g6,	[%l7 + 0x26] %asi
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%o7
	fmovscc	%xcc,	%f7,	%f1
	movl	%xcc,	%i0,	%i4
	addccc	%o2,	0x0EF9,	%l2
	movrne	%g1,	0x39F,	%i1
	taddcc	%i2,	%l0,	%i6
	andncc	%g7,	%g4,	%g2
	add	%l3,	0x0B20,	%g3
	sdivx	%o3,	0x0CC0,	%o4
	movrgz	%o6,	%g5,	%o0
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	andcc	%l1,	%l6,	%l5
	tge	%icc,	0x2
	fmovsle	%icc,	%f30,	%f14
	ta	%xcc,	0x5
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x81,	 0x0
	movvs	%icc,	%i3,	%i5
	set	0x18, %o3
	stda	%o0,	[%l7 + %o3] 0x2f
	membar	#Sync
	fmovdvc	%xcc,	%f27,	%f23
	and	%g6,	%i7,	%o7
	tsubcc	%i0,	%i4,	%o2
	tle	%xcc,	0x2
	move	%icc,	%l2,	%g1
	tn	%xcc,	0x6
	wr	%g0,	0x2b,	%asi
	stda	%i0,	[%l7 + 0x20] %asi
	membar	#Sync
	fbo,a	%fcc3,	loop_2223
	fbu,a	%fcc1,	loop_2224
	fmovrde	%l4,	%f18,	%f0
	edge16l	%i2,	%i6,	%l0
loop_2223:
	fcmped	%fcc0,	%f2,	%f26
loop_2224:
	fmovdge	%icc,	%f16,	%f27
	call	loop_2225
	fmovrsgez	%g7,	%f1,	%f18
	smul	%g4,	%l3,	%g3
	umul	%g2,	0x0FFB,	%o3
loop_2225:
	andcc	%o6,	0x109A,	%o4
	fmovd	%f0,	%f0
	edge32ln	%g5,	%l1,	%l6
	tpos	%icc,	0x0
	movrgez	%l5,	0x0DF,	%o0
	taddcctv	%o5,	%i3,	%i5
	fsrc2s	%f23,	%f6
	xnor	%g6,	0x0176,	%i7
	orn	%o1,	%i0,	%i4
	fmovs	%f16,	%f3
	flush	%l7 + 0x7C
	fmovrsgz	%o2,	%f27,	%f2
	tpos	%icc,	0x3
	alignaddrl	%o7,	%l2,	%i1
	movn	%xcc,	%g1,	%i2
	brnz	%i6,	loop_2226
	movrgz	%l0,	0x2B6,	%g7
	alignaddrl	%l4,	%l3,	%g4
	fpack16	%f10,	%f13
loop_2226:
	movrgz	%g2,	%o3,	%o6
	udiv	%o4,	0x0DFE,	%g5
	edge16l	%l1,	%g3,	%l5
	fxnor	%f30,	%f20,	%f22
	tsubcctv	%o0,	0x019E,	%l6
	fmovrslez	%o5,	%f5,	%f1
	lduw	[%l7 + 0x58],	%i5
	move	%icc,	%g6,	%i3
	bge	%icc,	loop_2227
	movne	%xcc,	%i7,	%o1
	andcc	%i4,	%i0,	%o7
	set	0x1B, %i1
	ldsba	[%l7 + %i1] 0x0c,	%o2
loop_2227:
	bshuffle	%f0,	%f10,	%f0
	fmovrsgz	%l2,	%f25,	%f13
	srlx	%g1,	%i2,	%i1
	stb	%i6,	[%l7 + 0x20]
	fmovrdne	%l0,	%f6,	%f18
	te	%xcc,	0x3
	smul	%g7,	0x11CD,	%l3
	orncc	%g4,	%g2,	%o3
	bvs	%xcc,	loop_2228
	movvs	%icc,	%l4,	%o4
	fcmple32	%f6,	%f10,	%o6
	movrgz	%g5,	0x259,	%g3
loop_2228:
	pdist	%f2,	%f30,	%f26
	movg	%icc,	%l1,	%o0
	tvc	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l5,	0x176E,	%l6
	movle	%icc,	%o5,	%g6
	alignaddr	%i5,	%i7,	%o1
	movre	%i3,	0x377,	%i4
	bpos,a,pt	%icc,	loop_2229
	sdivcc	%i0,	0x150A,	%o2
	fmovse	%xcc,	%f28,	%f21
	tgu	%icc,	0x5
loop_2229:
	ldsw	[%l7 + 0x30],	%o7
	movrgez	%g1,	0x2DB,	%i2
	fmovscs	%xcc,	%f11,	%f6
	tsubcc	%l2,	%i1,	%l0
	tgu	%xcc,	0x3
	fmovrse	%i6,	%f24,	%f12
	smulcc	%g7,	%l3,	%g4
	set	0x10, %i7
	ldswa	[%l7 + %i7] 0x15,	%o3
	bcs	%icc,	loop_2230
	ta	%xcc,	0x0
	edge16n	%g2,	%o4,	%o6
	nop
	setx loop_2231, %l0, %l1
	jmpl %l1, %l4
loop_2230:
	ldd	[%l7 + 0x08],	%f8
	ta	%icc,	0x0
	fmovsne	%xcc,	%f14,	%f1
loop_2231:
	fbue,a	%fcc0,	loop_2232
	tneg	%icc,	0x7
	sub	%g5,	0x0F88,	%g3
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2232:
	mulx	%o0,	0x075C,	%l5
	sdivx	%l6,	0x19A8,	%o5
	fcmple32	%f16,	%f14,	%g6
	smulcc	%l1,	%i5,	%o1
	ble,pn	%icc,	loop_2233
	edge8ln	%i3,	%i7,	%i4
	movpos	%xcc,	%i0,	%o7
	set	0x5C, %o4
	sta	%f27,	[%l7 + %o4] 0x88
loop_2233:
	tvc	%icc,	0x7
	movne	%icc,	%g1,	%i2
	srlx	%l2,	0x14,	%i1
	tle	%icc,	0x4
	edge16ln	%o2,	%i6,	%g7
	tne	%xcc,	0x3
	bneg	%icc,	loop_2234
	fpsub32s	%f10,	%f20,	%f31
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x4
loop_2234:
	fmovsn	%icc,	%f28,	%f18
	addc	%l0,	0x0D62,	%l3
	brlz	%g4,	loop_2235
	ld	[%l7 + 0x44],	%f1
	movrlez	%g2,	%o4,	%o3
	udivcc	%l4,	0x0E5D,	%g5
loop_2235:
	ldsb	[%l7 + 0x5F],	%o6
	fmovrslz	%g3,	%f19,	%f8
	smulcc	%o0,	0x1B14,	%l5
	orcc	%l6,	0x1E56,	%g6
	movg	%xcc,	%o5,	%l1
	array32	%o1,	%i3,	%i5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%i0
	mova	%xcc,	%i7,	%o7
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x34] %asi,	%i2
	edge32	%g1,	%l2,	%o2
	mova	%xcc,	%i6,	%i1
	fmovsn	%icc,	%f20,	%f5
	bleu,pt	%xcc,	loop_2236
	taddcctv	%g7,	0x029F,	%l3
	fnot1	%f18,	%f8
	srax	%l0,	%g2,	%o4
loop_2236:
	xorcc	%o3,	%l4,	%g4
	nop
	set	0x70, %g1
	ldx	[%l7 + %g1],	%g5
	udivcc	%o6,	0x136B,	%g3
	edge8n	%o0,	%l6,	%g6
	tcs	%xcc,	0x3
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x50] %asi,	%o4
	tge	%xcc,	0x2
	membar	0x66
	movleu	%xcc,	%l5,	%o1
	array8	%l1,	%i5,	%i3
	nop
	setx	loop_2237,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stb	%i0,	[%l7 + 0x2A]
	tcc	%xcc,	0x3
	fpadd16s	%f28,	%f28,	%f29
loop_2237:
	orcc	%i4,	%o7,	%i7
	fors	%f5,	%f8,	%f16
	movgu	%xcc,	%g1,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o2,	%i6,	%i2
	fmovdpos	%icc,	%f29,	%f19
	fcmpes	%fcc0,	%f18,	%f18
	ldsh	[%l7 + 0x52],	%i1
	array8	%l3,	%l0,	%g7
	array8	%g2,	%o3,	%l4
	movne	%icc,	%g4,	%o4
	tne	%xcc,	0x5
	tl	%icc,	0x0
	edge32n	%o6,	%g3,	%g5
	ble,a,pt	%icc,	loop_2238
	movrne	%l6,	0x38A,	%g6
	fbul	%fcc1,	loop_2239
	tcc	%xcc,	0x1
loop_2238:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x11] %asi,	%o0
loop_2239:
	addccc	%o5,	%l5,	%l1
	edge32n	%i5,	%i3,	%o1
	fornot2	%f18,	%f12,	%f18
	fbule,a	%fcc0,	loop_2240
	movrlez	%i4,	0x0F3,	%o7
	stb	%i7,	[%l7 + 0x60]
	sdiv	%i0,	0x1D01,	%g1
loop_2240:
	tsubcctv	%l2,	%o2,	%i2
	fmul8x16au	%f4,	%f2,	%f26
	ba,a,pt	%xcc,	loop_2241
	fcmpgt16	%f4,	%f26,	%i6
	sllx	%l3,	%i1,	%l0
	movre	%g7,	%o3,	%g2
loop_2241:
	fpsub32	%f8,	%f20,	%f2
	subc	%l4,	0x16C1,	%o4
	nop
	setx	loop_2242,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%g4,	%o6,	%g3
	lduw	[%l7 + 0x58],	%l6
	mova	%icc,	%g5,	%o0
loop_2242:
	nop
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x60] %asi,	%o5
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x1f
	membar	#Sync
	movcc	%xcc,	%l5,	%l1
	movcc	%xcc,	%g6,	%i5
	fbo	%fcc3,	loop_2243
	tsubcc	%i3,	%o1,	%o7
	set	0x51, %l2
	ldsba	[%l7 + %l2] 0x19,	%i4
loop_2243:
	edge16n	%i0,	%i7,	%g1
	fpsub16	%f2,	%f16,	%f4
	addc	%l2,	%o2,	%i6
	call	loop_2244
	tsubcctv	%l3,	%i2,	%l0
	movne	%xcc,	%i1,	%o3
	set	0x14, %i5
	stwa	%g7,	[%l7 + %i5] 0x19
loop_2244:
	nop
	setx	loop_2245,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%icc,	0x0
	taddcc	%l4,	%o4,	%g2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
loop_2245:
	prefetch	[%l7 + 0x14],	 0x2
	fmovrdlz	%g3,	%f12,	%f0
	mulscc	%g4,	%l6,	%g5
	addcc	%o5,	0x04BB,	%o0
	fmovdne	%icc,	%f30,	%f12
	mova	%icc,	%l1,	%l5
	fmovde	%icc,	%f10,	%f29
	fmovsvc	%icc,	%f14,	%f16
	andn	%g6,	0x1FE5,	%i3
	fnot1s	%f18,	%f27
	std	%f4,	[%l7 + 0x30]
	nop
	setx	loop_2246,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcc	%o1,	%o7,	%i5
	fbne	%fcc2,	loop_2247
	udivcc	%i0,	0x093D,	%i7
loop_2246:
	ldub	[%l7 + 0x53],	%g1
	movvs	%xcc,	%i4,	%l2
loop_2247:
	tcs	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%o2,	%i6
	fmovse	%icc,	%f12,	%f17
	set	0x58, %o7
	stxa	%i2,	[%l7 + %o7] 0x15
	udiv	%l3,	0x17A2,	%i1
	addccc	%o3,	%g7,	%l4
	mulx	%l0,	0x02B6,	%g2
	fmovdl	%icc,	%f16,	%f16
	or	%o6,	%o4,	%g3
	fmovsneg	%xcc,	%f27,	%f19
	membar	0x07
	movleu	%xcc,	%g4,	%l6
	nop
	set	0x55, %i4
	ldub	[%l7 + %i4],	%o5
	xorcc	%o0,	%g5,	%l1
	movvs	%xcc,	%g6,	%l5
	fone	%f0
	ldsb	[%l7 + 0x22],	%i3
	udivx	%o1,	0x02D1,	%i5
	fbn	%fcc0,	loop_2248
	xnor	%o7,	0x1CEF,	%i0
	tneg	%xcc,	0x1
	fmovdvc	%xcc,	%f17,	%f8
loop_2248:
	subc	%g1,	%i4,	%i7
	bne,a	%xcc,	loop_2249
	orcc	%o2,	%l2,	%i6
	set	0x6C, %g7
	sta	%f13,	[%l7 + %g7] 0x88
loop_2249:
	smul	%i2,	%i1,	%l3
	movrgz	%o3,	0x046,	%g7
	movgu	%icc,	%l0,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g2,	0x357,	%o4
	fmovrde	%o6,	%f2,	%f24
	ta	%icc,	0x5
	fcmpne32	%f28,	%f12,	%g4
	tcc	%icc,	0x2
	ldsw	[%l7 + 0x78],	%g3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o5,	%o0
	membar	0x79
	smul	%l6,	0x066A,	%g5
	sir	0x03AA
	stb	%l1,	[%l7 + 0x3C]
	array32	%l5,	%g6,	%o1
	tge	%xcc,	0x5
	brgez	%i3,	loop_2250
	fnands	%f19,	%f22,	%f7
	andncc	%i5,	%o7,	%g1
	fornot2	%f10,	%f8,	%f8
loop_2250:
	bgu,pt	%icc,	loop_2251
	movgu	%xcc,	%i0,	%i7
	xnorcc	%o2,	%i4,	%l2
	tge	%xcc,	0x7
loop_2251:
	alignaddr	%i2,	%i6,	%l3
	fbg,a	%fcc0,	loop_2252
	fabss	%f28,	%f25
	sra	%o3,	%i1,	%l0
	xorcc	%g7,	0x10D3,	%l4
loop_2252:
	orncc	%g2,	0x0A82,	%o6
	fmovrdlz	%o4,	%f10,	%f30
	sdivcc	%g4,	0x16DF,	%o5
	bvs	%xcc,	loop_2253
	fnors	%f10,	%f24,	%f27
	bneg,pt	%icc,	loop_2254
	fsrc2s	%f29,	%f13
loop_2253:
	umul	%g3,	%o0,	%l6
	addccc	%g5,	%l1,	%g6
loop_2254:
	flush	%l7 + 0x70
	fbue,a	%fcc1,	loop_2255
	sdivcc	%l5,	0x08D0,	%i3
	fand	%f14,	%f14,	%f24
	fands	%f6,	%f12,	%f11
loop_2255:
	movrgez	%o1,	%i5,	%o7
	umulcc	%g1,	0x1E2E,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x70, %i2
	ldda	[%l7 + %i2] 0x2a,	%i6
	fmovs	%f11,	%f14
	orcc	%o2,	0x0810,	%i4
	fbue,a	%fcc1,	loop_2256
	fxnors	%f9,	%f30,	%f14
	alignaddr	%l2,	%i6,	%i2
	tl	%xcc,	0x3
loop_2256:
	sdivx	%l3,	0x0E17,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l0,	%i1,	%l4
	bl,a	%icc,	loop_2257
	fmovrde	%g2,	%f26,	%f2
	fmovdvs	%icc,	%f11,	%f21
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x54] %asi,	%g7
loop_2257:
	tgu	%icc,	0x3
	fandnot1	%f14,	%f28,	%f28
	fbo,a	%fcc3,	loop_2258
	te	%xcc,	0x2
	call	loop_2259
	or	%o6,	%g4,	%o5
loop_2258:
	movleu	%xcc,	%o4,	%g3
	fmul8x16	%f29,	%f0,	%f6
loop_2259:
	bg,a	%icc,	loop_2260
	tgu	%icc,	0x2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x50] %asi,	%o0
loop_2260:
	nop
	set	0x46, %o6
	ldstuba	[%l7 + %o6] 0x18,	%l6
	smulcc	%g5,	0x12C6,	%g6
	movgu	%icc,	%l5,	%l1
	tpos	%xcc,	0x2
	or	%o1,	%i3,	%i5
	nop
	setx loop_2261, %l0, %l1
	jmpl %l1, %o7
	fmovrdlez	%g1,	%f10,	%f20
	sub	%i7,	0x17B2,	%o2
	movrgez	%i4,	%i0,	%l2
loop_2261:
	nop
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x19,	%f0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x18,	%i6,	%i2
	tgu	%xcc,	0x5
	fbule	%fcc3,	loop_2262
	fmovrdgez	%l3,	%f26,	%f30
	taddcc	%l0,	%i1,	%l4
	te	%xcc,	0x6
loop_2262:
	smul	%o3,	%g7,	%g2
	movrgez	%g4,	%o5,	%o4
	fnot1	%f18,	%f10
	addc	%o6,	%g3,	%l6
	bl,a,pn	%xcc,	loop_2263
	sethi	0x006B,	%o0
	sdivx	%g5,	0x1DDF,	%l5
	fnors	%f9,	%f5,	%f30
loop_2263:
	udivx	%g6,	0x0BBC,	%o1
	fnegd	%f20,	%f20
	orcc	%l1,	0x136C,	%i5
	fmovrdgez	%o7,	%f26,	%f16
	fmovrdlez	%i3,	%f24,	%f18
	wr	%g0,	0x80,	%asi
	stxa	%i7,	[%l7 + 0x18] %asi
	fmul8x16	%f24,	%f22,	%f8
	bn,a,pt	%xcc,	loop_2264
	fmovsge	%xcc,	%f12,	%f8
	alignaddrl	%g1,	%o2,	%i0
	movl	%icc,	%l2,	%i4
loop_2264:
	nop
	set	0x30, %l1
	lduba	[%l7 + %l1] 0x10,	%i6
	fmovrsne	%i2,	%f29,	%f22
	tvs	%icc,	0x0
	fnegs	%f20,	%f14
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x2E] %asi,	%l3
	fors	%f21,	%f3,	%f17
	movcc	%xcc,	%i1,	%l4
	movpos	%icc,	%o3,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g2,	%l0,	%g4
	sll	%o4,	0x09,	%o6
	edge16	%g3,	%o5,	%o0
	tneg	%icc,	0x3
	brgz	%g5,	loop_2265
	movvc	%icc,	%l6,	%l5
	movle	%icc,	%o1,	%l1
	wr	%g0,	0x52,	%asi
	stxa	%g6,	[%g0 + 0x108] %asi
loop_2265:
	fbe,a	%fcc2,	loop_2266
	add	%i5,	0x0638,	%i3
	sub	%i7,	0x053D,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2266:
	bg,pt	%icc,	loop_2267
	array16	%o7,	%o2,	%l2
	andncc	%i0,	%i6,	%i2
	movleu	%icc,	%i4,	%l3
loop_2267:
	fbge,a	%fcc3,	loop_2268
	fmovsvc	%xcc,	%f26,	%f19
	te	%xcc,	0x5
	sdivx	%i1,	0x1873,	%o3
loop_2268:
	bcs,a,pn	%xcc,	loop_2269
	xorcc	%l4,	0x0AD7,	%g2
	andcc	%l0,	0x1340,	%g7
	sdivx	%o4,	0x1EFC,	%g4
loop_2269:
	call	loop_2270
	fmul8ulx16	%f2,	%f6,	%f14
	brlez	%o6,	loop_2271
	udivcc	%g3,	0x1BD6,	%o0
loop_2270:
	nop
	set	0x6A, %l5
	stha	%o5,	[%l7 + %l5] 0x15
loop_2271:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l6,	0x1F,	%l5
	movrne	%o1,	0x229,	%l1
	set	0x2C, %l0
	lduwa	[%l7 + %l0] 0x80,	%g6
	srlx	%g5,	%i5,	%i3
	tneg	%icc,	0x2
	call	loop_2272
	movgu	%xcc,	%i7,	%g1
	sub	%o2,	%o7,	%l2
	udivcc	%i0,	0x0837,	%i2
loop_2272:
	and	%i4,	0x0612,	%l3
	tsubcc	%i1,	%o3,	%l4
	fpsub16s	%f6,	%f7,	%f12
	movrlez	%g2,	0x020,	%i6
	tsubcc	%l0,	0x19F9,	%o4
	tl	%icc,	0x1
	tne	%xcc,	0x2
	nop
	setx	loop_2273,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smul	%g4,	%o6,	%g3
	bneg	%icc,	loop_2274
	srl	%o0,	%g7,	%o5
loop_2273:
	fcmpes	%fcc2,	%f19,	%f23
	set	0x74, %o2
	lduba	[%l7 + %o2] 0x15,	%l5
loop_2274:
	alignaddrl	%o1,	%l6,	%g6
	alignaddrl	%l1,	%g5,	%i5
	bg,a,pn	%icc,	loop_2275
	srax	%i3,	0x09,	%i7
	swap	[%l7 + 0x40],	%o2
	fnot2s	%f2,	%f21
loop_2275:
	stw	%g1,	[%l7 + 0x58]
	fmovrde	%o7,	%f2,	%f6
	fnot2s	%f29,	%f29
	call	loop_2276
	brz,a	%l2,	loop_2277
	fmovsge	%icc,	%f25,	%f7
	movcc	%icc,	%i0,	%i2
loop_2276:
	sdivx	%i4,	0x1F0D,	%l3
loop_2277:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x3F] %asi,	%o3
	edge32n	%l4,	%i1,	%i6
	movl	%icc,	%l0,	%o4
	edge16ln	%g4,	%o6,	%g3
	sll	%o0,	0x09,	%g2
	brz	%g7,	loop_2278
	fmovsgu	%xcc,	%f2,	%f4
	popc	0x1501,	%l5
	ldsb	[%l7 + 0x4E],	%o1
loop_2278:
	ldd	[%l7 + 0x28],	%i6
	ldstub	[%l7 + 0x08],	%g6
	tpos	%xcc,	0x4
	fbg	%fcc2,	loop_2279
	fbul	%fcc2,	loop_2280
	edge16n	%l1,	%g5,	%o5
	tpos	%xcc,	0x6
loop_2279:
	movrlz	%i3,	%i7,	%o2
loop_2280:
	fbne,a	%fcc1,	loop_2281
	taddcc	%i5,	%g1,	%l2
	smulcc	%o7,	0x1C4E,	%i0
	tcs	%xcc,	0x0
loop_2281:
	mova	%xcc,	%i4,	%l3
	xorcc	%i2,	0x04D1,	%o3
	movcs	%xcc,	%i1,	%i6
	fnot2s	%f1,	%f13
	array32	%l4,	%l0,	%o4
	array32	%g4,	%g3,	%o0
	set	0x4C, %g6
	sta	%f31,	[%l7 + %g6] 0x81
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x30] %asi,	%o6
	fmovrslz	%g7,	%f12,	%f16
	smulcc	%g2,	0x1C4E,	%o1
	swap	[%l7 + 0x34],	%l5
	edge8	%l6,	%l1,	%g5
	xnor	%g6,	0x1F44,	%i3
	movpos	%icc,	%o5,	%o2
	fone	%f14
	ble,a	%icc,	loop_2282
	edge8n	%i5,	%g1,	%l2
	fcmps	%fcc3,	%f18,	%f0
	movn	%xcc,	%i7,	%i0
loop_2282:
	move	%icc,	%o7,	%l3
	fmovdge	%icc,	%f30,	%f28
	st	%f16,	[%l7 + 0x60]
	membar	0x12
	brlz,a	%i2,	loop_2283
	sdivx	%o3,	0x1AD6,	%i1
	udiv	%i6,	0x0EAA,	%l4
	fpsub16	%f0,	%f4,	%f14
loop_2283:
	movl	%xcc,	%i4,	%l0
	fmovrde	%o4,	%f26,	%f4
	fbg,a	%fcc1,	loop_2284
	andcc	%g3,	%o0,	%g4
	movl	%xcc,	%o6,	%g2
	bcs	%xcc,	loop_2285
loop_2284:
	edge8n	%o1,	%l5,	%g7
	fornot1	%f8,	%f4,	%f26
	set	0x3F, %i6
	lduba	[%l7 + %i6] 0x81,	%l6
loop_2285:
	fmovrsne	%g5,	%f5,	%f15
	fmovsn	%xcc,	%f29,	%f22
	tg	%xcc,	0x0
	tneg	%xcc,	0x4
	ta	%xcc,	0x5
	ba,a	%icc,	loop_2286
	fmovsn	%xcc,	%f1,	%f13
	movn	%xcc,	%l1,	%i3
	edge8l	%o5,	%g6,	%o2
loop_2286:
	brlez,a	%i5,	loop_2287
	udiv	%l2,	0x184A,	%g1
	sra	%i0,	0x12,	%i7
	smulcc	%o7,	0x1249,	%l3
loop_2287:
	fbule,a	%fcc0,	loop_2288
	edge32	%o3,	%i1,	%i2
	array32	%i6,	%i4,	%l0
	tpos	%icc,	0x2
loop_2288:
	tleu	%xcc,	0x3
	movpos	%icc,	%l4,	%g3
	fornot2	%f28,	%f22,	%f28
	tpos	%icc,	0x7
	edge32ln	%o4,	%o0,	%o6
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x1C] %asi,	%f13
	set	0x7E, %o1
	ldsha	[%l7 + %o1] 0x04,	%g2
	tg	%icc,	0x3
	sra	%o1,	%l5,	%g4
	set	0x28, %o5
	lduwa	[%l7 + %o5] 0x0c,	%l6
	membar	0x1F
	movle	%icc,	%g7,	%l1
	fbuge	%fcc2,	loop_2289
	edge16l	%g5,	%o5,	%i3
	andcc	%g6,	%o2,	%i5
	fandnot1	%f4,	%f28,	%f14
loop_2289:
	fsrc2s	%f10,	%f12
	tvc	%xcc,	0x2
	set	0x0F, %o0
	ldstuba	[%l7 + %o0] 0x18,	%g1
	set	0x108, %l3
	ldxa	[%g0 + %l3] 0x21,	%i0
	sdivx	%i7,	0x094C,	%o7
	fones	%f18
	wr	%g0,	0x2a,	%asi
	stda	%l2,	[%l7 + 0x50] %asi
	membar	#Sync
	bgu,pt	%icc,	loop_2290
	xnor	%o3,	%i1,	%i2
	udivcc	%i6,	0x06D3,	%l2
	tcc	%xcc,	0x7
loop_2290:
	edge32	%i4,	%l4,	%g3
	tne	%icc,	0x3
	mulx	%o4,	0x1A14,	%o0
	smulcc	%l0,	0x0A63,	%o6
	fmovdge	%xcc,	%f6,	%f16
	fbo,a	%fcc3,	loop_2291
	fmovrdgz	%g2,	%f0,	%f10
	movgu	%xcc,	%o1,	%g4
	andcc	%l6,	%g7,	%l1
loop_2291:
	nop
	set	0x4C, %g3
	ldswa	[%l7 + %g3] 0x89,	%l5
	subc	%g5,	%o5,	%i3
	set	0x4A, %g2
	stha	%o2,	[%l7 + %g2] 0x15
	fmovda	%icc,	%f10,	%f28
	srax	%i5,	%g1,	%i0
	bcs,pn	%xcc,	loop_2292
	sra	%i7,	0x1E,	%o7
	movn	%xcc,	%g6,	%o3
	fmovsvs	%xcc,	%f18,	%f8
loop_2292:
	movvs	%icc,	%i1,	%l3
	edge32n	%i6,	%l2,	%i4
	or	%i2,	0x0241,	%l4
	fones	%f25
	orcc	%g3,	0x1D7C,	%o0
	sll	%l0,	0x1D,	%o6
	tsubcctv	%o4,	0x027B,	%o1
	movleu	%xcc,	%g2,	%l6
	movrgez	%g4,	%l1,	%g7
	ldsw	[%l7 + 0x3C],	%l5
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x74] %asi,	%o5
	stw	%g5,	[%l7 + 0x50]
	movle	%xcc,	%o2,	%i5
	tneg	%icc,	0x5
	bneg,a,pt	%xcc,	loop_2293
	fmovd	%f30,	%f28
	brlz,a	%i3,	loop_2294
	fmovda	%icc,	%f24,	%f17
loop_2293:
	movpos	%icc,	%g1,	%i7
	xnor	%o7,	%g6,	%o3
loop_2294:
	ldub	[%l7 + 0x72],	%i1
	mova	%xcc,	%l3,	%i0
	subc	%i6,	0x170B,	%i4
	and	%i2,	%l4,	%l2
	fpack16	%f10,	%f22
	bcc	loop_2295
	sethi	0x0748,	%g3
	fmovsgu	%icc,	%f19,	%f27
	fmovd	%f10,	%f20
loop_2295:
	nop
	wr	%g0,	0x18,	%asi
	sta	%f18,	[%l7 + 0x3C] %asi
	movg	%icc,	%l0,	%o6
	orn	%o4,	%o1,	%g2
	bl	loop_2296
	fandnot1s	%f0,	%f31,	%f13
	set	0x00, %i3
	ldxa	[%g0 + %i3] 0x50,	%l6
loop_2296:
	udiv	%g4,	0x19CE,	%o0
	fpadd16s	%f7,	%f2,	%f7
	edge32l	%g7,	%l5,	%o5
	tle	%xcc,	0x4
	prefetch	[%l7 + 0x18],	 0x2
	fpsub32	%f10,	%f24,	%f28
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x0c,	%f0
	be	loop_2297
	movcs	%icc,	%l1,	%g5
	fmovsvc	%icc,	%f27,	%f15
	taddcctv	%i5,	%i3,	%g1
loop_2297:
	alignaddrl	%o2,	%i7,	%o7
	sllx	%o3,	0x05,	%i1
	edge8ln	%g6,	%i0,	%l3
	taddcctv	%i4,	0x1C90,	%i6
	fxors	%f16,	%f21,	%f19
	fpsub16	%f0,	%f16,	%f30
	tvs	%xcc,	0x7
	tneg	%xcc,	0x0
	edge16n	%i2,	%l2,	%l4
	movneg	%xcc,	%l0,	%o6
	fbo,a	%fcc1,	loop_2298
	fmovsn	%xcc,	%f16,	%f23
	fmovs	%f3,	%f8
	fcmped	%fcc1,	%f10,	%f30
loop_2298:
	sir	0x09D5
	alignaddrl	%g3,	%o4,	%g2
	fmul8x16al	%f25,	%f5,	%f2
	fbul	%fcc1,	loop_2299
	fandnot2s	%f10,	%f6,	%f8
	edge8l	%l6,	%g4,	%o0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%l5
loop_2299:
	stbar
	fmul8x16au	%f21,	%f28,	%f8
	stw	%o5,	[%l7 + 0x64]
	std	%f8,	[%l7 + 0x30]
	st	%f23,	[%l7 + 0x0C]
	fmovde	%xcc,	%f7,	%f6
	tleu	%icc,	0x5
	edge32n	%l1,	%g5,	%g7
	fpack32	%f12,	%f16,	%f16
	swap	[%l7 + 0x54],	%i3
	fba	%fcc3,	loop_2300
	fmovrse	%i5,	%f11,	%f23
	fmovdvc	%xcc,	%f28,	%f13
	set	0x48, %l6
	lduwa	[%l7 + %l6] 0x81,	%g1
loop_2300:
	ta	%xcc,	0x2
	tle	%xcc,	0x3
	bg	%icc,	loop_2301
	array16	%i7,	%o7,	%o3
	bcs	loop_2302
	or	%i1,	%o2,	%i0
loop_2301:
	or	%l3,	%i4,	%g6
	addc	%i2,	%i6,	%l4
loop_2302:
	fcmpes	%fcc3,	%f9,	%f26
	array32	%l2,	%o6,	%l0
	brnz,a	%o4,	loop_2303
	fbe	%fcc3,	loop_2304
	addccc	%g3,	%g2,	%g4
	addccc	%l6,	0x063A,	%o1
loop_2303:
	fpackfix	%f24,	%f20
loop_2304:
	edge8n	%l5,	%o0,	%l1
	brnz	%o5,	loop_2305
	fandnot2	%f16,	%f26,	%f26
	movge	%icc,	%g5,	%g7
	srl	%i3,	%g1,	%i7
loop_2305:
	movge	%xcc,	%o7,	%i5
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x40] %asi,	%o3
	fexpand	%f4,	%f22
	fmovrslez	%i1,	%f23,	%f17
	bleu	%icc,	loop_2306
	edge32n	%o2,	%i0,	%i4
	tle	%xcc,	0x6
	edge32l	%g6,	%i2,	%i6
loop_2306:
	fbge,a	%fcc3,	loop_2307
	fbn	%fcc2,	loop_2308
	fcmple16	%f0,	%f30,	%l3
	xnorcc	%l4,	%l2,	%l0
loop_2307:
	tg	%icc,	0x1
loop_2308:
	fbg,a	%fcc1,	loop_2309
	ldub	[%l7 + 0x1D],	%o6
	tvc	%xcc,	0x3
	movleu	%icc,	%o4,	%g2
loop_2309:
	edge32ln	%g4,	%g3,	%l6
	fmovdn	%icc,	%f26,	%f3
	fcmpes	%fcc1,	%f14,	%f22
	set	0x65, %o3
	stba	%l5,	[%l7 + %o3] 0xe3
	membar	#Sync
	fble	%fcc0,	loop_2310
	edge16l	%o1,	%o0,	%l1
	nop
	setx	loop_2311,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnegs	%f2,	%f0
loop_2310:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x26] %asi,	%g5
loop_2311:
	std	%f12,	[%l7 + 0x48]
	smulcc	%g7,	%i3,	%o5
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf0
	membar	#Sync
	mova	%xcc,	%i7,	%o7
	smul	%g1,	%o3,	%i5
	movrlz	%o2,	0x12A,	%i0
	sllx	%i4,	%g6,	%i2
	std	%f12,	[%l7 + 0x08]
	movrne	%i1,	0x0EB,	%i6
	ldd	[%l7 + 0x20],	%f18
	movrgez	%l4,	%l3,	%l0
	xnor	%l2,	%o4,	%o6
	bneg	loop_2312
	nop
	setx	loop_2313,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srax	%g2,	%g3,	%g4
	ld	[%l7 + 0x7C],	%f13
loop_2312:
	std	%l4,	[%l7 + 0x38]
loop_2313:
	fornot1s	%f23,	%f28,	%f30
	subc	%o1,	%o0,	%l6
	andncc	%g5,	%g7,	%l1
	be,a,pt	%xcc,	loop_2314
	sll	%i3,	%o5,	%o7
	udivcc	%g1,	0x0D12,	%i7
	sub	%i5,	%o3,	%o2
loop_2314:
	alignaddrl	%i0,	%i4,	%i2
	srl	%i1,	%g6,	%l4
	fmuld8ulx16	%f20,	%f23,	%f10
	srl	%i6,	0x0A,	%l3
	movrlez	%l2,	%o4,	%o6
	flush	%l7 + 0x48
	fbu,a	%fcc3,	loop_2315
	movgu	%xcc,	%g2,	%g3
	fxors	%f1,	%f13,	%f15
	bne,a,pn	%xcc,	loop_2316
loop_2315:
	bneg,a,pn	%xcc,	loop_2317
	fmovda	%icc,	%f29,	%f0
	fnands	%f16,	%f19,	%f27
loop_2316:
	sdivcc	%g4,	0x15F0,	%l5
loop_2317:
	fmovrde	%o1,	%f8,	%f4
	fmovrslz	%l0,	%f5,	%f0
	orn	%o0,	%l6,	%g7
	bge,a,pt	%icc,	loop_2318
	tsubcc	%l1,	0x0D79,	%g5
	fcmpne16	%f10,	%f24,	%o5
	tcc	%icc,	0x3
loop_2318:
	add	%i3,	0x000D,	%o7
	fpadd32	%f22,	%f2,	%f30
	edge8n	%g1,	%i5,	%i7
	fcmps	%fcc0,	%f1,	%f10
	for	%f12,	%f22,	%f28
	fmul8ulx16	%f28,	%f10,	%f10
	fbo,a	%fcc3,	loop_2319
	bn,a	%icc,	loop_2320
	tvc	%xcc,	0x4
	bg,a	loop_2321
loop_2319:
	xnorcc	%o2,	0x052B,	%i0
loop_2320:
	fmovdcs	%icc,	%f30,	%f3
	andncc	%o3,	%i2,	%i4
loop_2321:
	sethi	0x0190,	%g6
	movpos	%xcc,	%l4,	%i1
	orcc	%l3,	%i6,	%o4
	fnors	%f16,	%f30,	%f22
	fmovrslz	%l2,	%f14,	%f26
	movle	%icc,	%g2,	%g3
	fbul,a	%fcc2,	loop_2322
	fmul8sux16	%f12,	%f6,	%f12
	tne	%icc,	0x0
	fzeros	%f23
loop_2322:
	tpos	%xcc,	0x1
	bshuffle	%f30,	%f28,	%f6
	mova	%xcc,	%g4,	%l5
	mova	%xcc,	%o1,	%o6
	movleu	%icc,	%o0,	%l6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%l0
	fmovdl	%icc,	%f4,	%f21
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%l0
	tvs	%icc,	0x0
	set	0x50, %i7
	stda	%g4,	[%l7 + %i7] 0x89
	wr	%g0,	0xea,	%asi
	stba	%o5,	[%l7 + 0x08] %asi
	membar	#Sync
	brgz,a	%i3,	loop_2323
	fnor	%f28,	%f14,	%f18
	bcc,a,pt	%xcc,	loop_2324
	taddcc	%g1,	0x174B,	%i5
loop_2323:
	swap	[%l7 + 0x28],	%o7
	stb	%i7,	[%l7 + 0x2C]
loop_2324:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x19,	%o2,	%o3
	smulcc	%i2,	0x18AC,	%i0
	sllx	%i4,	0x0C,	%g6
	fblg	%fcc2,	loop_2325
	stb	%l4,	[%l7 + 0x69]
	bpos,a	%icc,	loop_2326
	edge8l	%l3,	%i1,	%i6
loop_2325:
	add	%l2,	0x1E82,	%o4
	edge32l	%g2,	%g3,	%g4
loop_2326:
	srl	%o1,	0x19,	%o6
	taddcctv	%l5,	%o0,	%g7
	fbue	%fcc1,	loop_2327
	fpadd32s	%f14,	%f26,	%f31
	edge16n	%l6,	%l0,	%l1
	ta	%icc,	0x5
loop_2327:
	brgz	%g5,	loop_2328
	movrgz	%i3,	%g1,	%i5
	fpsub32	%f20,	%f8,	%f10
	edge16n	%o7,	%o5,	%o2
loop_2328:
	udivx	%i7,	0x1B3A,	%i2
	tsubcctv	%i0,	0x1697,	%o3
	fnors	%f31,	%f13,	%f22
	edge32n	%g6,	%l4,	%i4
	tg	%icc,	0x4
	te	%xcc,	0x3
	fbule,a	%fcc0,	loop_2329
	tvs	%xcc,	0x5
	fcmpgt32	%f30,	%f22,	%i1
	movne	%icc,	%l3,	%l2
loop_2329:
	array8	%o4,	%i6,	%g3
	srax	%g2,	%g4,	%o6
	taddcc	%o1,	0x1A94,	%o0
	fmovdneg	%icc,	%f13,	%f10
	fble	%fcc2,	loop_2330
	array16	%g7,	%l6,	%l5
	tg	%icc,	0x6
	fpadd32	%f28,	%f6,	%f10
loop_2330:
	edge32l	%l0,	%g5,	%l1
	alignaddr	%i3,	%g1,	%i5
	bge,a,pn	%icc,	loop_2331
	mulx	%o5,	0x19C2,	%o2
	nop
	setx	loop_2332,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stbar
loop_2331:
	sdivcc	%o7,	0x0B10,	%i7
	sllx	%i2,	0x1C,	%i0
loop_2332:
	edge32ln	%g6,	%o3,	%l4
	movre	%i4,	%l3,	%l2
	movge	%xcc,	%i1,	%i6
	fcmple16	%f16,	%f20,	%o4
	alignaddr	%g2,	%g4,	%g3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x70] %asi,	%f29
	tn	%icc,	0x2
	array16	%o6,	%o0,	%g7
	udivcc	%l6,	0x1F29,	%l5
	fmovdgu	%xcc,	%f20,	%f9
	or	%o1,	%g5,	%l0
	fmovd	%f18,	%f16
	addc	%i3,	0x053D,	%l1
	alignaddr	%g1,	%i5,	%o2
	nop
	set	0x75, %g1
	stb	%o7,	[%l7 + %g1]
	fand	%f20,	%f2,	%f2
	sub	%i7,	0x1759,	%o5
	fmovrdlz	%i0,	%f30,	%f26
	movcc	%icc,	%i2,	%g6
	edge32	%l4,	%o3,	%l3
	set	0x34, %l4
	stwa	%i4,	[%l7 + %l4] 0x2b
	membar	#Sync
	and	%l2,	%i6,	%o4
	membar	0x1A
	edge8n	%g2,	%i1,	%g4
	tcc	%xcc,	0x5
	fnot2	%f18,	%f4
	bpos,a,pn	%xcc,	loop_2333
	nop
	setx	loop_2334,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andncc	%g3,	%o0,	%g7
	fbne	%fcc1,	loop_2335
loop_2333:
	fcmpne16	%f24,	%f10,	%l6
loop_2334:
	addcc	%l5,	0x0081,	%o6
	mulx	%o1,	%g5,	%l0
loop_2335:
	tg	%xcc,	0x7
	edge8ln	%i3,	%g1,	%i5
	sdivcc	%o2,	0x04F4,	%l1
	edge16ln	%o7,	%i7,	%i0
	addcc	%o5,	0x02E3,	%g6
	movrgz	%i2,	0x247,	%o3
	fmovdne	%icc,	%f1,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l3,	%l4,	%l2
	fmovdge	%icc,	%f29,	%f16
	or	%i6,	0x1EA9,	%i4
	tvs	%xcc,	0x5
	and	%o4,	%g2,	%i1
	tsubcc	%g4,	0x162D,	%o0
	fmovdl	%xcc,	%f17,	%f28
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x7F] %asi,	%g7
	movrlz	%g3,	%l5,	%o6
	ldx	[%l7 + 0x10],	%o1
	set	0x4C, %o4
	ldsba	[%l7 + %o4] 0x15,	%l6
	tsubcc	%l0,	%i3,	%g1
	movpos	%xcc,	%i5,	%o2
	edge8	%l1,	%g5,	%i7
	or	%o7,	%o5,	%i0
	fmovd	%f22,	%f14
	xorcc	%i2,	0x1198,	%g6
	movcs	%xcc,	%l3,	%o3
	movge	%icc,	%l2,	%i6
	nop
	set	0x18, %l2
	std	%f10,	[%l7 + %l2]
	udivcc	%i4,	0x19BB,	%l4
	for	%f8,	%f16,	%f6
	fpackfix	%f4,	%f12
	srlx	%g2,	%i1,	%g4
	edge32	%o4,	%o0,	%g7
	wr	%g0,	0x81,	%asi
	stba	%g3,	[%l7 + 0x62] %asi
	fmovsn	%icc,	%f27,	%f6
	xnor	%l5,	0x1D70,	%o1
	fpsub16s	%f0,	%f29,	%f1
	siam	0x6
	tneg	%xcc,	0x5
	tneg	%xcc,	0x6
	fmovsleu	%xcc,	%f17,	%f28
	fmovsneg	%icc,	%f0,	%f5
	mulx	%o6,	0x1E35,	%l0
	movleu	%xcc,	%i3,	%l6
	srax	%g1,	%i5,	%l1
	tge	%icc,	0x5
	fpack32	%f12,	%f24,	%f20
	orncc	%o2,	%g5,	%i7
	edge32	%o5,	%o7,	%i2
	movneg	%icc,	%i0,	%l3
	udiv	%g6,	0x0093,	%l2
	movle	%icc,	%i6,	%i4
	fmovsvc	%xcc,	%f16,	%f28
	fmovrsne	%o3,	%f9,	%f7
	tleu	%icc,	0x6
	fcmpne16	%f4,	%f0,	%g2
	bvc,a	%icc,	loop_2336
	sdivcc	%i1,	0x1565,	%l4
	wr	%g0,	0x80,	%asi
	stxa	%g4,	[%l7 + 0x38] %asi
loop_2336:
	flush	%l7 + 0x5C
	tgu	%xcc,	0x4
	fsrc1	%f0,	%f0
	movrne	%o0,	0x11B,	%g7
	fmovdgu	%xcc,	%f10,	%f8
	fors	%f13,	%f27,	%f11
	bne	loop_2337
	fxnor	%f22,	%f0,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc1,	loop_2338
loop_2337:
	brz	%o4,	loop_2339
	or	%g3,	0x15D3,	%o1
	fmuld8sux16	%f20,	%f25,	%f0
loop_2338:
	bneg,pn	%xcc,	loop_2340
loop_2339:
	movre	%o6,	0x110,	%l5
	sdivx	%l0,	0x12D9,	%i3
	tg	%icc,	0x0
loop_2340:
	fxors	%f30,	%f15,	%f30
	fmovrslz	%g1,	%f9,	%f5
	brnz	%l6,	loop_2341
	addcc	%i5,	%l1,	%o2
	fmovdpos	%xcc,	%f23,	%f14
	fnot1s	%f29,	%f24
loop_2341:
	edge8n	%g5,	%i7,	%o7
	fandnot1	%f24,	%f16,	%f18
	movrgz	%o5,	%i0,	%i2
	brz,a	%l3,	loop_2342
	andn	%g6,	0x191E,	%l2
	sdiv	%i6,	0x0D4D,	%o3
	edge32ln	%i4,	%i1,	%g2
loop_2342:
	bvc,a,pn	%icc,	loop_2343
	nop
	setx	loop_2344,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbn,a	%fcc0,	loop_2345
	fbu,a	%fcc1,	loop_2346
loop_2343:
	movg	%icc,	%l4,	%g4
loop_2344:
	movrlz	%o0,	%g7,	%g3
loop_2345:
	fxors	%f14,	%f29,	%f0
loop_2346:
	nop
	set	0x57, %i5
	ldstuba	[%l7 + %i5] 0x10,	%o4
	xor	%o1,	%l5,	%o6
	orn	%i3,	%g1,	%l6
	sllx	%l0,	0x07,	%i5
	fmovrsgz	%o2,	%f19,	%f3
	array32	%l1,	%i7,	%o7
	std	%o4,	[%l7 + 0x60]
	fxnors	%f9,	%f24,	%f26
	fmovdcs	%icc,	%f12,	%f5
	fmul8x16al	%f30,	%f26,	%f10
	sllx	%i0,	%g5,	%i2
	fmovscc	%xcc,	%f26,	%f12
	alignaddrl	%g6,	%l3,	%i6
	movrgz	%o3,	%i4,	%l2
	fba	%fcc1,	loop_2347
	sdivx	%g2,	0x0095,	%l4
	movrgez	%g4,	0x0A7,	%o0
	movcs	%icc,	%i1,	%g3
loop_2347:
	fmovrdlez	%o4,	%f20,	%f26
	tne	%xcc,	0x3
	set	0x1C, %i4
	sta	%f31,	[%l7 + %i4] 0x14
	fxnors	%f24,	%f9,	%f1
	tl	%xcc,	0x4
	movn	%icc,	%g7,	%o1
	ba,a,pn	%xcc,	loop_2348
	tge	%icc,	0x7
	fmovdcs	%xcc,	%f17,	%f19
	tl	%icc,	0x7
loop_2348:
	fmovrde	%l5,	%f4,	%f0
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x70] %asi,	%i3
	array8	%o6,	%l6,	%l0
	xnor	%g1,	0x1AA1,	%i5
	umul	%l1,	%i7,	%o2
	prefetch	[%l7 + 0x28],	 0x3
	fandnot2	%f28,	%f6,	%f24
	move	%xcc,	%o5,	%o7
	mulx	%g5,	0x19D6,	%i0
	movcs	%icc,	%g6,	%l3
	sub	%i6,	0x15F5,	%i2
	set	0x10, %g7
	lduwa	[%l7 + %g7] 0x15,	%o3
	fbg	%fcc3,	loop_2349
	fpsub16	%f24,	%f10,	%f18
	stx	%l2,	[%l7 + 0x50]
	taddcctv	%i4,	0x11A2,	%l4
loop_2349:
	lduw	[%l7 + 0x1C],	%g2
	fbuge,a	%fcc3,	loop_2350
	tvs	%xcc,	0x3
	fxnors	%f23,	%f1,	%f4
	fmovdl	%icc,	%f29,	%f25
loop_2350:
	fnand	%f8,	%f22,	%f14
	movg	%xcc,	%o0,	%i1
	fpadd32s	%f5,	%f28,	%f31
	edge32n	%g3,	%o4,	%g4
	flush	%l7 + 0x08
	movrgz	%o1,	0x2A1,	%g7
	movle	%icc,	%l5,	%i3
	fpackfix	%f20,	%f5
	movg	%icc,	%o6,	%l6
	set	0x4A, %i2
	ldsha	[%l7 + %i2] 0x19,	%l0
	edge32	%i5,	%l1,	%g1
	stx	%i7,	[%l7 + 0x48]
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o2
	orn	%o5,	%o7,	%i0
	addccc	%g5,	0x1CAD,	%g6
	fbo,a	%fcc1,	loop_2351
	tcc	%xcc,	0x1
	edge8n	%i6,	%i2,	%l3
	movg	%icc,	%o3,	%i4
loop_2351:
	fbge	%fcc0,	loop_2352
	array32	%l2,	%l4,	%o0
	bcs	loop_2353
	fnot1	%f12,	%f24
loop_2352:
	nop
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i1,	%g2
loop_2353:
	movg	%icc,	%o4,	%g3
	movrgz	%g4,	%g7,	%l5
	brlez,a	%i3,	loop_2354
	edge16l	%o6,	%o1,	%l6
	ba	%icc,	loop_2355
	edge8l	%i5,	%l1,	%l0
loop_2354:
	xnor	%i7,	%o2,	%g1
	nop
	setx loop_2356, %l0, %l1
	jmpl %l1, %o7
loop_2355:
	sll	%i0,	0x10,	%o5
	std	%g4,	[%l7 + 0x28]
	fzeros	%f22
loop_2356:
	alignaddrl	%g6,	%i6,	%l3
	edge32n	%o3,	%i4,	%l2
	fpmerge	%f4,	%f26,	%f4
	fmovs	%f26,	%f26
	popc	0x1C28,	%i2
	array32	%l4,	%i1,	%g2
	orncc	%o0,	%o4,	%g3
	movcs	%xcc,	%g4,	%l5
	taddcctv	%i3,	0x0E88,	%o6
	array32	%g7,	%o1,	%i5
	sllx	%l1,	0x07,	%l6
	alignaddr	%l0,	%o2,	%i7
	movneg	%xcc,	%o7,	%g1
	wr	%g0,	0x11,	%asi
	sta	%f5,	[%l7 + 0x44] %asi
	orcc	%o5,	0x0A82,	%i0
	movleu	%xcc,	%g6,	%g5
	srlx	%l3,	%i6,	%i4
	fbge	%fcc2,	loop_2357
	umulcc	%o3,	%i2,	%l4
	membar	0x31
	fxnors	%f10,	%f10,	%f9
loop_2357:
	fmovrslez	%i1,	%f5,	%f28
	fbn,a	%fcc0,	loop_2358
	sllx	%l2,	0x04,	%o0
	fbe	%fcc0,	loop_2359
	movcs	%xcc,	%o4,	%g3
loop_2358:
	fmovdl	%icc,	%f2,	%f0
	andn	%g4,	0x1F03,	%l5
loop_2359:
	xor	%g2,	0x0DC7,	%o6
	andncc	%i3,	%o1,	%g7
	smul	%l1,	%l6,	%l0
	udiv	%i5,	0x156D,	%i7
	movre	%o2,	%o7,	%o5
	sll	%i0,	0x0B,	%g6
	ba,a	%icc,	loop_2360
	edge8n	%g1,	%l3,	%i6
	move	%icc,	%i4,	%o3
	sub	%i2,	%l4,	%g5
loop_2360:
	fnot2s	%f30,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i1,	%l2
	tle	%xcc,	0x2
	ldd	[%l7 + 0x08],	%o4
	addcc	%o0,	0x1468,	%g3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%g4,	%g2
	mulscc	%l5,	%o6,	%o1
	fsrc2	%f16,	%f6
	movre	%i3,	%l1,	%l6
	fmovsn	%xcc,	%f11,	%f12
	smul	%l0,	%g7,	%i5
	brgz,a	%i7,	loop_2361
	sll	%o2,	0x10,	%o7
	andcc	%i0,	0x08A5,	%o5
	edge32l	%g1,	%g6,	%i6
loop_2361:
	tne	%xcc,	0x6
	flush	%l7 + 0x70
	fmovscc	%icc,	%f15,	%f13
	edge16	%l3,	%i4,	%i2
	andn	%l4,	0x17DF,	%g5
	set	0x40, %o6
	ldsba	[%l7 + %o6] 0x80,	%i1
	lduh	[%l7 + 0x3E],	%l2
	fmovdl	%icc,	%f16,	%f19
	edge16n	%o4,	%o3,	%g3
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x15
	set	0x70, %l1
	stda	%o0,	[%l7 + %l1] 0xea
	membar	#Sync
	fxnors	%f3,	%f14,	%f23
	fmovsgu	%icc,	%f25,	%f16
	sir	0x19AC
	tg	%xcc,	0x7
	set	0x49, %l5
	ldstuba	[%l7 + %l5] 0x19,	%g2
	wr	%g0,	0xe3,	%asi
	stba	%l5,	[%l7 + 0x4C] %asi
	membar	#Sync
	ld	[%l7 + 0x78],	%f4
	tsubcctv	%g4,	0x0118,	%o1
	tn	%icc,	0x6
	fcmple32	%f10,	%f4,	%o6
	edge8	%i3,	%l1,	%l6
	mova	%icc,	%g7,	%l0
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x44] %asi,	%i5
	ble,a,pn	%icc,	loop_2362
	fsrc1s	%f11,	%f25
	orncc	%i7,	0x1F27,	%o7
	fcmpgt16	%f30,	%f8,	%i0
loop_2362:
	tge	%xcc,	0x0
	sth	%o5,	[%l7 + 0x4C]
	orncc	%o2,	0x1A5A,	%g1
	fnand	%f10,	%f2,	%f18
	taddcctv	%g6,	%i6,	%i4
	movge	%icc,	%l3,	%i2
	set	0x52, %l0
	stba	%g5,	[%l7 + %l0] 0x14
	fmovsneg	%icc,	%f31,	%f5
	brlz,a	%i1,	loop_2363
	fmovsvc	%xcc,	%f24,	%f21
	ta	%icc,	0x1
	tvs	%icc,	0x6
loop_2363:
	fmovrde	%l4,	%f28,	%f2
	tge	%icc,	0x2
	fmovd	%f22,	%f26
	movleu	%xcc,	%o4,	%o3
	and	%g3,	%o0,	%l2
	subccc	%g2,	0x1CC7,	%g4
	fmovde	%icc,	%f7,	%f28
	movvs	%icc,	%l5,	%o1
	subcc	%o6,	%i3,	%l1
	fcmpes	%fcc1,	%f11,	%f29
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l6,	%g7
	edge16l	%i5,	%i7,	%o7
	tg	%icc,	0x7
	movcc	%xcc,	%i0,	%l0
	nop
	set	0x18, %o7
	sth	%o2,	[%l7 + %o7]
	fcmpne16	%f16,	%f20,	%g1
	srl	%o5,	0x0A,	%i6
	sdivx	%i4,	0x1D2A,	%g6
	stw	%i2,	[%l7 + 0x2C]
	sll	%l3,	0x15,	%i1
	set	0x09, %g6
	lduba	[%l7 + %g6] 0x0c,	%l4
	ldstub	[%l7 + 0x3F],	%o4
	xnorcc	%o3,	0x194D,	%g5
	sethi	0x1F07,	%g3
	movl	%icc,	%o0,	%g2
	siam	0x4
	tsubcctv	%g4,	%l2,	%o1
	orn	%l5,	0x1F97,	%i3
	fble,a	%fcc2,	loop_2364
	std	%l0,	[%l7 + 0x40]
	fmovrdgz	%l6,	%f24,	%f2
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2364:
	movgu	%xcc,	%o6,	%i5
	brlz	%g7,	loop_2365
	movcs	%xcc,	%i7,	%i0
	fsrc2s	%f14,	%f17
	addccc	%o7,	0x1A5C,	%o2
loop_2365:
	taddcctv	%g1,	0x08E3,	%o5
	fone	%f24
	brlz,a	%l0,	loop_2366
	addcc	%i6,	%i4,	%g6
	movn	%xcc,	%l3,	%i2
	tsubcctv	%i1,	0x089F,	%o4
loop_2366:
	array32	%o3,	%l4,	%g3
	fmovdge	%icc,	%f1,	%f14
	addc	%g5,	0x1C67,	%g2
	edge16	%o0,	%l2,	%o1
	be	%icc,	loop_2367
	smulcc	%l5,	0x1E7B,	%g4
	mulx	%l1,	%l6,	%i3
	fcmpeq16	%f20,	%f24,	%o6
loop_2367:
	srax	%g7,	0x02,	%i7
	ldx	[%l7 + 0x68],	%i0
	ldsb	[%l7 + 0x6C],	%o7
	fmovdvc	%icc,	%f14,	%f23
	movrlez	%o2,	0x0BB,	%g1
	fmovspos	%xcc,	%f8,	%f31
	xnorcc	%i5,	0x1C37,	%o5
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	bcs,a	loop_2368
	srlx	%l0,	%g6,	%l3
	tl	%xcc,	0x3
	fmovsneg	%xcc,	%f24,	%f28
loop_2368:
	fornot1s	%f0,	%f1,	%f0
	set	0x54, %o2
	lduwa	[%l7 + %o2] 0x15,	%i4
	movvs	%icc,	%i1,	%o4
	sdivcc	%i2,	0x006B,	%o3
	tgu	%icc,	0x7
	fpsub16s	%f29,	%f16,	%f10
	ble,pt	%icc,	loop_2369
	orncc	%l4,	0x0F82,	%g3
	bge	%xcc,	loop_2370
	xor	%g5,	0x1F2C,	%g2
loop_2369:
	umul	%l2,	0x1284,	%o0
	stx	%l5,	[%l7 + 0x08]
loop_2370:
	fmovde	%xcc,	%f12,	%f9
	movrgz	%o1,	%l1,	%l6
	edge16ln	%i3,	%o6,	%g7
	subccc	%i7,	0x01AC,	%g4
	fand	%f24,	%f18,	%f2
	set	0x58, %i6
	prefetcha	[%l7 + %i6] 0x15,	 0x1
	movre	%o7,	0x034,	%o2
	tcs	%icc,	0x2
	flush	%l7 + 0x38
	sdiv	%g1,	0x1E8C,	%i5
	wr	%g0,	0x04,	%asi
	stha	%o5,	[%l7 + 0x28] %asi
	fzeros	%f27
	move	%xcc,	%i6,	%l0
	tn	%xcc,	0x3
	edge32	%g6,	%l3,	%i1
	movcs	%icc,	%i4,	%o4
	alignaddr	%o3,	%i2,	%l4
	array32	%g5,	%g2,	%l2
	ldstub	[%l7 + 0x43],	%o0
	fcmpne32	%f12,	%f26,	%g3
	tn	%xcc,	0x3
	fbuge,a	%fcc0,	loop_2371
	te	%icc,	0x5
	alignaddr	%l5,	%l1,	%o1
	sdiv	%i3,	0x0881,	%l6
loop_2371:
	sra	%g7,	0x09,	%o6
	tvs	%icc,	0x2
	array8	%i7,	%g4,	%o7
	movne	%icc,	%i0,	%o2
	move	%icc,	%i5,	%g1
	ldx	[%l7 + 0x20],	%o5
	fcmpd	%fcc0,	%f18,	%f26
	or	%l0,	0x1811,	%g6
	fcmpne32	%f4,	%f10,	%i6
	fcmpeq16	%f22,	%f12,	%l3
	fbne	%fcc2,	loop_2372
	tvs	%icc,	0x4
	fbuge	%fcc0,	loop_2373
	smul	%i4,	%i1,	%o4
loop_2372:
	edge8l	%o3,	%i2,	%g5
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x18] %asi,	%g2
loop_2373:
	tcc	%xcc,	0x3
	bshuffle	%f26,	%f26,	%f10
	subcc	%l4,	0x1FEB,	%l2
	xorcc	%g3,	%o0,	%l5
	movpos	%icc,	%l1,	%o1
	nop
	set	0x58, %o5
	ldub	[%l7 + %o5],	%l6
	ta	%xcc,	0x5
	bg,a,pn	%xcc,	loop_2374
	fornot2	%f16,	%f14,	%f28
	sub	%g7,	%o6,	%i7
	fmovsleu	%icc,	%f23,	%f18
loop_2374:
	stb	%i3,	[%l7 + 0x4C]
	fcmpgt16	%f10,	%f28,	%o7
	std	%i0,	[%l7 + 0x48]
	fmovdgu	%icc,	%f30,	%f1
	fmovrse	%g4,	%f9,	%f11
	tne	%xcc,	0x2
	edge32n	%i5,	%o2,	%g1
	umul	%l0,	0x16F5,	%g6
	movcc	%xcc,	%o5,	%i6
	bge,pn	%icc,	loop_2375
	fmovsneg	%xcc,	%f24,	%f7
	sdivcc	%l3,	0x1B6B,	%i1
	tsubcctv	%o4,	0x132F,	%o3
loop_2375:
	movrlz	%i2,	%i4,	%g5
	sub	%g2,	%l2,	%g3
	movrne	%o0,	%l5,	%l4
	tcs	%xcc,	0x4
	tle	%icc,	0x5
	edge8l	%l1,	%o1,	%g7
	tl	%xcc,	0x0
	set	0x7B, %o1
	ldstuba	[%l7 + %o1] 0x89,	%l6
	ldub	[%l7 + 0x0F],	%o6
	set	0x20, %l3
	swapa	[%l7 + %l3] 0x80,	%i3
	nop
	setx	loop_2376,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%xcc,	%i7,	%o7
	brlez,a	%i0,	loop_2377
	lduh	[%l7 + 0x30],	%i5
loop_2376:
	movrlez	%g4,	%o2,	%l0
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%f16
loop_2377:
	taddcctv	%g6,	0x0770,	%o5
	std	%f8,	[%l7 + 0x60]
	movle	%icc,	%g1,	%i6
	fmovrde	%i1,	%f14,	%f0
	array16	%l3,	%o3,	%i2
	st	%f1,	[%l7 + 0x1C]
	fpack32	%f14,	%f16,	%f24
	edge32ln	%o4,	%g5,	%g2
	tvs	%icc,	0x7
	edge8l	%l2,	%i4,	%o0
	fpsub16	%f0,	%f12,	%f8
	fbul,a	%fcc1,	loop_2378
	fnot2	%f24,	%f20
	bcs	%xcc,	loop_2379
	movn	%icc,	%l5,	%g3
loop_2378:
	movrlez	%l4,	%l1,	%o1
	te	%icc,	0x6
loop_2379:
	fmuld8sux16	%f9,	%f4,	%f22
	ble,pn	%xcc,	loop_2380
	edge16	%g7,	%o6,	%l6
	set	0x60, %o0
	ldda	[%l7 + %o0] 0x2f,	%i2
loop_2380:
	subcc	%i7,	%i0,	%o7
	mova	%icc,	%g4,	%i5
	brlz	%l0,	loop_2381
	umul	%o2,	0x101D,	%o5
	tgu	%icc,	0x5
	fbo	%fcc3,	loop_2382
loop_2381:
	fbe	%fcc3,	loop_2383
	ldub	[%l7 + 0x67],	%g1
	sllx	%i6,	%g6,	%i1
loop_2382:
	movrgez	%l3,	%o3,	%o4
loop_2383:
	xor	%i2,	%g2,	%g5
	xnorcc	%l2,	%o0,	%i4
	taddcctv	%l5,	%g3,	%l4
	nop
	set	0x21, %i3
	ldsb	[%l7 + %i3],	%o1
	mulx	%g7,	0x04E8,	%o6
	array8	%l6,	%i3,	%i7
	xor	%i0,	%l1,	%o7
	tleu	%icc,	0x6
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x1B] %asi,	%g4
	movg	%xcc,	%l0,	%i5
	fornot2s	%f30,	%f3,	%f18
	tle	%xcc,	0x4
	addc	%o2,	%o5,	%g1
	fmovrdlez	%i6,	%f30,	%f22
	ldd	[%l7 + 0x38],	%i0
	move	%xcc,	%g6,	%o3
	subcc	%o4,	0x1582,	%l3
	fcmped	%fcc2,	%f14,	%f28
	movrgz	%g2,	0x0B6,	%i2
	orcc	%g5,	0x0F35,	%o0
	add	%l2,	%l5,	%g3
	alignaddr	%l4,	%i4,	%o1
	umulcc	%g7,	%o6,	%i3
	edge8n	%l6,	%i7,	%l1
	tcs	%xcc,	0x6
	tn	%icc,	0x6
	fmovscc	%icc,	%f27,	%f20
	bgu,a	loop_2384
	sra	%i0,	%g4,	%o7
	edge8l	%l0,	%o2,	%i5
	addcc	%g1,	0x0F78,	%o5
loop_2384:
	tne	%icc,	0x5
	ldd	[%l7 + 0x30],	%i6
	srax	%i1,	%g6,	%o3
	set	0x34, %g2
	swapa	[%l7 + %g2] 0x89,	%o4
	andn	%g2,	0x1B82,	%i2
	siam	0x6
	fzero	%f2
	tcc	%icc,	0x0
	orncc	%l3,	0x19E1,	%o0
	popc	%g5,	%l5
	fabss	%f24,	%f12
	udiv	%l2,	0x09B9,	%l4
	mova	%xcc,	%g3,	%o1
	bcc,pn	%xcc,	loop_2385
	brlz	%i4,	loop_2386
	stb	%g7,	[%l7 + 0x54]
	array32	%o6,	%i3,	%i7
loop_2385:
	taddcctv	%l1,	0x06B3,	%l6
loop_2386:
	fcmpgt16	%f2,	%f22,	%g4
	fmovdl	%xcc,	%f13,	%f20
	lduw	[%l7 + 0x20],	%i0
	edge32n	%l0,	%o2,	%i5
	udivx	%o7,	0x098C,	%o5
	bpos,pn	%xcc,	loop_2387
	tgu	%xcc,	0x5
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x17,	%f0
loop_2387:
	tvc	%icc,	0x4
	fbul	%fcc2,	loop_2388
	xorcc	%g1,	0x1D1F,	%i6
	subccc	%g6,	0x08D6,	%o3
	bl,a,pt	%icc,	loop_2389
loop_2388:
	fmovdgu	%xcc,	%f7,	%f27
	fnegd	%f8,	%f0
	ldub	[%l7 + 0x7D],	%o4
loop_2389:
	movle	%icc,	%i1,	%g2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i2,	%o0
	ldstub	[%l7 + 0x67],	%g5
	array16	%l5,	%l3,	%l2
	addccc	%l4,	%o1,	%g3
	tvs	%xcc,	0x7
	fmovdvs	%icc,	%f6,	%f1
	bgu	loop_2390
	umul	%i4,	%g7,	%o6
	movn	%xcc,	%i3,	%i7
	srl	%l6,	0x09,	%l1
loop_2390:
	fmovrse	%i0,	%f23,	%f12
	move	%xcc,	%l0,	%g4
	tvc	%xcc,	0x6
	udivx	%o2,	0x0E7E,	%o7
	edge8ln	%i5,	%o5,	%g1
	movvs	%xcc,	%i6,	%o3
	fornot2	%f26,	%f2,	%f2
	fbne	%fcc0,	loop_2391
	tle	%xcc,	0x2
	movn	%xcc,	%o4,	%i1
	sdivcc	%g6,	0x1921,	%g2
loop_2391:
	nop
	setx	loop_2392,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgez	%o0,	0x1AD,	%i2
	fmovscc	%xcc,	%f23,	%f10
	fbule	%fcc0,	loop_2393
loop_2392:
	brlz,a	%l5,	loop_2394
	sdivcc	%l3,	0x0E4D,	%g5
	addcc	%l4,	%o1,	%l2
loop_2393:
	srl	%i4,	%g3,	%o6
loop_2394:
	sth	%g7,	[%l7 + 0x50]
	tg	%icc,	0x5
	udivcc	%i3,	0x0499,	%l6
	movle	%icc,	%i7,	%i0
	nop
	setx	loop_2395,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%icc,	%l0,	%g4
	tvc	%icc,	0x5
	sub	%l1,	0x04C5,	%o7
loop_2395:
	tgu	%xcc,	0x3
	fpsub16	%f26,	%f16,	%f6
	fmovscc	%xcc,	%f18,	%f0
	orn	%i5,	%o5,	%g1
	brgz,a	%o2,	loop_2396
	fmovse	%icc,	%f17,	%f18
	addccc	%i6,	%o4,	%o3
	wr	%g0,	0xe3,	%asi
	stwa	%g6,	[%l7 + 0x6C] %asi
	membar	#Sync
loop_2396:
	umulcc	%g2,	%o0,	%i1
	movn	%xcc,	%i2,	%l3
	tvc	%icc,	0x7
	taddcc	%g5,	0x15F4,	%l4
	fcmpeq32	%f24,	%f20,	%l5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%o1
	taddcc	%i4,	0x0439,	%o6
	ba,a	loop_2397
	sdivx	%g3,	0x12FE,	%g7
	ldsb	[%l7 + 0x23],	%l6
	fbule	%fcc3,	loop_2398
loop_2397:
	edge32n	%i3,	%i0,	%l0
	bneg,pn	%icc,	loop_2399
	srl	%i7,	%l1,	%g4
loop_2398:
	nop
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x10] %asi,	%i5
loop_2399:
	addccc	%o7,	0x0A76,	%g1
	edge8	%o2,	%o5,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x3
	prefetch	[%l7 + 0x20],	 0x1
	edge8l	%i6,	%g6,	%o3
	movcs	%icc,	%g2,	%i1
	edge16	%i2,	%l3,	%g5
	movg	%icc,	%o0,	%l5
	std	%f22,	[%l7 + 0x68]
	edge32	%l4,	%o1,	%l2
	movl	%icc,	%i4,	%o6
	sllx	%g3,	0x14,	%l6
	fmovsa	%xcc,	%f0,	%f3
	fbul,a	%fcc0,	loop_2400
	ldd	[%l7 + 0x08],	%f18
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%g7,	%i3
loop_2400:
	stx	%l0,	[%l7 + 0x48]
	tl	%xcc,	0x2
	andncc	%i0,	%i7,	%l1
	mulscc	%g4,	0x0F31,	%o7
	fbo,a	%fcc1,	loop_2401
	siam	0x2
	movn	%icc,	%i5,	%o2
	movne	%icc,	%g1,	%o5
loop_2401:
	movneg	%xcc,	%o4,	%g6
	stx	%i6,	[%l7 + 0x78]
	movcc	%xcc,	%o3,	%i1
	prefetch	[%l7 + 0x50],	 0x1
	sdiv	%i2,	0x114A,	%g2
	movneg	%xcc,	%g5,	%l3
	fnot2s	%f21,	%f12
	fmovdgu	%icc,	%f4,	%f5
	fnot1s	%f21,	%f0
	subc	%o0,	%l4,	%l5
	fbug	%fcc1,	loop_2402
	umul	%o1,	0x02FB,	%l2
	smul	%i4,	%o6,	%g3
	edge8ln	%g7,	%i3,	%l6
loop_2402:
	fsrc2s	%f7,	%f22
	andncc	%i0,	%i7,	%l1
	fbuge,a	%fcc3,	loop_2403
	movvs	%icc,	%g4,	%l0
	st	%f4,	[%l7 + 0x70]
	fbl	%fcc1,	loop_2404
loop_2403:
	fmovdpos	%xcc,	%f13,	%f11
	brlez	%i5,	loop_2405
	andn	%o7,	%o2,	%g1
loop_2404:
	tpos	%xcc,	0x0
	andncc	%o5,	%o4,	%g6
loop_2405:
	tl	%icc,	0x7
	sub	%o3,	0x093D,	%i1
	fmovs	%f7,	%f4
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x54] %asi,	%i6
	ldd	[%l7 + 0x58],	%f2
	add	%g2,	0x014A,	%i2
	umul	%g5,	%l3,	%o0
	stbar
	fmovdle	%icc,	%f27,	%f15
	set	0x50, %l6
	sta	%f19,	[%l7 + %l6] 0x15
	xnor	%l5,	%o1,	%l4
	fmovsge	%icc,	%f3,	%f25
	fcmpeq16	%f10,	%f24,	%l2
	sir	0x1339
	edge32ln	%o6,	%i4,	%g7
	lduh	[%l7 + 0x08],	%i3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
	bvs	%icc,	loop_2406
	fnot2s	%f11,	%f9
	ldub	[%l7 + 0x41],	%g3
	andcc	%i7,	0x1F1C,	%i0
loop_2406:
	add	%l1,	0x1981,	%l0
	edge16l	%g4,	%o7,	%o2
	fxnor	%f12,	%f18,	%f12
	edge16n	%g1,	%o5,	%o4
	andn	%g6,	%i5,	%i1
	fmovdvc	%xcc,	%f31,	%f6
	mulx	%o3,	%i6,	%i2
	fnor	%f20,	%f12,	%f26
	wr	%g0,	0xe2,	%asi
	stha	%g5,	[%l7 + 0x72] %asi
	membar	#Sync
	fcmpgt32	%f22,	%f0,	%g2
	tvc	%xcc,	0x4
	brgz,a	%o0,	loop_2407
	movg	%icc,	%l3,	%o1
	fsrc1	%f12,	%f20
	sdiv	%l4,	0x12AD,	%l5
loop_2407:
	fcmpd	%fcc1,	%f12,	%f26
	srl	%o6,	0x0E,	%i4
	fmovdleu	%icc,	%f27,	%f30
	mova	%icc,	%l2,	%i3
	xorcc	%l6,	%g7,	%i7
	lduw	[%l7 + 0x48],	%g3
	array32	%l1,	%i0,	%g4
	sllx	%l0,	0x04,	%o2
	edge8l	%g1,	%o7,	%o4
	tvc	%icc,	0x0
	fmovrdgez	%o5,	%f2,	%f12
	fmovrslz	%g6,	%f21,	%f11
	fmovdcc	%icc,	%f1,	%f23
	fmovdvc	%xcc,	%f28,	%f5
	taddcc	%i5,	%o3,	%i1
	movpos	%icc,	%i2,	%g5
	brlez	%g2,	loop_2408
	tg	%icc,	0x1
	taddcc	%i6,	0x0532,	%o0
	fbne	%fcc2,	loop_2409
loop_2408:
	fmovsl	%icc,	%f7,	%f31
	fbul	%fcc2,	loop_2410
	sll	%l3,	0x1F,	%o1
loop_2409:
	movrgez	%l4,	0x222,	%l5
	movcc	%icc,	%o6,	%l2
loop_2410:
	movpos	%xcc,	%i3,	%l6
	fble	%fcc3,	loop_2411
	subccc	%i4,	0x0A73,	%g7
	swap	[%l7 + 0x7C],	%i7
	tpos	%icc,	0x4
loop_2411:
	taddcctv	%g3,	%l1,	%g4
	smul	%l0,	0x0CF3,	%o2
	fmovdle	%icc,	%f12,	%f24
	and	%g1,	%o7,	%o4
	alignaddr	%i0,	%o5,	%i5
	fbge	%fcc3,	loop_2412
	andn	%g6,	0x1FE7,	%i1
	movre	%i2,	0x269,	%o3
	brgez,a	%g5,	loop_2413
loop_2412:
	swap	[%l7 + 0x48],	%i6
	umul	%o0,	0x071D,	%l3
	wr	%g0,	0x18,	%asi
	sta	%f4,	[%l7 + 0x60] %asi
loop_2413:
	ldx	[%l7 + 0x58],	%o1
	add	%l4,	%g2,	%o6
	udiv	%l2,	0x1F80,	%i3
	tn	%icc,	0x2
	xnor	%l5,	%i4,	%g7
	add	%i7,	%l6,	%g3
	set	0x20, %o3
	ldxa	[%l7 + %o3] 0x14,	%g4
	sir	0x0250
	movrne	%l0,	%o2,	%l1
	sethi	0x08A3,	%o7
	orncc	%o4,	%g1,	%i0
	movgu	%icc,	%i5,	%o5
	umul	%g6,	0x1B0A,	%i2
	mova	%xcc,	%i1,	%g5
	nop
	set	0x08, %i1
	std	%f20,	[%l7 + %i1]
	movgu	%icc,	%o3,	%i6
	nop
	setx loop_2414, %l0, %l1
	jmpl %l1, %o0
	fbge	%fcc1,	loop_2415
	fbu	%fcc1,	loop_2416
	add	%l3,	0x086E,	%o1
loop_2414:
	fxor	%f26,	%f14,	%f26
loop_2415:
	ldx	[%l7 + 0x40],	%l4
loop_2416:
	subccc	%o6,	0x0EF6,	%g2
	tleu	%xcc,	0x2
	alignaddr	%l2,	%l5,	%i4
	ble,pn	%xcc,	loop_2417
	sdiv	%i3,	0x1B7E,	%g7
	alignaddr	%i7,	%g3,	%l6
	fbn,a	%fcc3,	loop_2418
loop_2417:
	stx	%g4,	[%l7 + 0x58]
	stbar
	fmovspos	%icc,	%f8,	%f26
loop_2418:
	ldsw	[%l7 + 0x1C],	%o2
	tpos	%xcc,	0x3
	movrgz	%l1,	%l0,	%o4
	bg	loop_2419
	sdivx	%g1,	0x0391,	%i0
	taddcc	%o7,	0x0868,	%i5
	fbne	%fcc0,	loop_2420
loop_2419:
	sll	%o5,	%g6,	%i2
	edge8ln	%i1,	%o3,	%g5
	movvc	%icc,	%o0,	%l3
loop_2420:
	fbue,a	%fcc2,	loop_2421
	add	%i6,	%o1,	%o6
	bl,a	loop_2422
	fpsub32s	%f22,	%f19,	%f19
loop_2421:
	addcc	%g2,	0x0048,	%l4
	fcmpeq16	%f28,	%f10,	%l5
loop_2422:
	stx	%i4,	[%l7 + 0x60]
	tleu	%icc,	0x7
	fcmpgt16	%f0,	%f16,	%l2
	tl	%icc,	0x1
	edge8ln	%i3,	%g7,	%g3
	movcc	%icc,	%l6,	%g4
	tvc	%icc,	0x7
	tsubcc	%i7,	0x1D7B,	%l1
	bleu,pn	%xcc,	loop_2423
	add	%l0,	0x175E,	%o2
	tle	%xcc,	0x4
	brgz,a	%g1,	loop_2424
loop_2423:
	fmovsvc	%icc,	%f30,	%f22
	tne	%xcc,	0x1
	edge16n	%o4,	%i0,	%i5
loop_2424:
	faligndata	%f0,	%f28,	%f24
	fandnot2s	%f22,	%f17,	%f20
	brgez	%o5,	loop_2425
	umul	%g6,	%i2,	%i1
	srlx	%o3,	%g5,	%o0
	movrlez	%o7,	%i6,	%o1
loop_2425:
	sdiv	%o6,	0x1980,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l4,	%l5,	%i4
	movrne	%l2,	%l3,	%g7
	tcc	%xcc,	0x7
	sra	%i3,	%g3,	%l6
	andncc	%g4,	%i7,	%l1
	fandnot2	%f4,	%f22,	%f30
	taddcc	%o2,	0x197D,	%l0
	edge8ln	%g1,	%i0,	%o4
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x0c,	%o5
	fsrc2	%f10,	%f20
	brlz	%i5,	loop_2426
	movl	%icc,	%g6,	%i1
	tg	%xcc,	0x5
	taddcctv	%o3,	%i2,	%g5
loop_2426:
	siam	0x7
	ble,a	loop_2427
	nop
	setx	loop_2428,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%o7,	%o0,	%o1
	sra	%o6,	%i6,	%l4
loop_2427:
	fcmps	%fcc1,	%f19,	%f2
loop_2428:
	move	%icc,	%l5,	%i4
	nop
	set	0x64, %g5
	stw	%g2,	[%l7 + %g5]
	movle	%xcc,	%l2,	%g7
	fpsub16	%f10,	%f4,	%f6
	tpos	%icc,	0x2
	stbar
	or	%i3,	0x1DF5,	%l3
	fnot1s	%f1,	%f24
	orncc	%l6,	0x1BE0,	%g4
	andncc	%i7,	%l1,	%g3
	alignaddrl	%o2,	%l0,	%g1
	udivcc	%i0,	0x1873,	%o4
	udivx	%i5,	0x16A5,	%g6
	stb	%o5,	[%l7 + 0x6B]
	movcc	%xcc,	%i1,	%i2
	fbule,a	%fcc0,	loop_2429
	srl	%o3,	%o7,	%o0
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x15,	 0x2
loop_2429:
	edge16l	%g5,	%o6,	%i6
	edge8n	%l5,	%l4,	%i4
	fornot1s	%f29,	%f27,	%f21
	tle	%xcc,	0x6
	subc	%g2,	0x185B,	%l2
	srax	%i3,	%l3,	%l6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%g7
	smul	%g4,	%i7,	%l1
	fabss	%f0,	%f11
	sra	%g3,	%o2,	%g1
	ldx	[%l7 + 0x28],	%l0
	fbug,a	%fcc0,	loop_2430
	fnot1	%f10,	%f6
	fbo	%fcc2,	loop_2431
	nop
	setx	loop_2432,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2430:
	fsrc2s	%f13,	%f8
	bgu,a	loop_2433
loop_2431:
	movne	%xcc,	%i0,	%i5
loop_2432:
	bn,pt	%icc,	loop_2434
	move	%xcc,	%g6,	%o4
loop_2433:
	sdivx	%o5,	0x1EC6,	%i2
	sdivx	%o3,	0x19F9,	%i1
loop_2434:
	nop
	set	0x38, %o4
	stda	%o0,	[%l7 + %o4] 0x19
	te	%xcc,	0x3
	edge16	%o7,	%o1,	%o6
	movne	%icc,	%g5,	%l5
	fbg,a	%fcc2,	loop_2435
	edge32l	%i6,	%i4,	%l4
	edge16l	%l2,	%i3,	%l3
	srlx	%l6,	%g2,	%g7
loop_2435:
	tcc	%icc,	0x3
	edge16ln	%i7,	%l1,	%g3
	fcmpne16	%f4,	%f8,	%o2
	movne	%xcc,	%g4,	%l0
	andn	%i0,	0x038E,	%g1
	sra	%i5,	0x0E,	%o4
	wr	%g0,	0x89,	%asi
	sta	%f18,	[%l7 + 0x70] %asi
	udiv	%g6,	0x062B,	%o5
	movvs	%icc,	%i2,	%i1
	popc	0x0585,	%o0
	wr	%g0,	0x80,	%asi
	stda	%o6,	[%l7 + 0x08] %asi
	te	%icc,	0x6
	sub	%o3,	0x0265,	%o1
	edge8ln	%g5,	%o6,	%i6
	ble,pt	%icc,	loop_2436
	brz	%i4,	loop_2437
	edge32n	%l5,	%l2,	%l4
	fcmpd	%fcc2,	%f28,	%f4
loop_2436:
	alignaddr	%l3,	%i3,	%l6
loop_2437:
	fble	%fcc3,	loop_2438
	fnot1	%f6,	%f4
	andncc	%g2,	%i7,	%g7
	ldd	[%l7 + 0x18],	%f4
loop_2438:
	bl,a,pn	%xcc,	loop_2439
	movcc	%xcc,	%g3,	%o2
	fexpand	%f26,	%f24
	call	loop_2440
loop_2439:
	nop
	setx	loop_2441,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnand	%f28,	%f6,	%f8
	ldd	[%l7 + 0x38],	%g4
loop_2440:
	fornot2s	%f22,	%f20,	%f16
loop_2441:
	subccc	%l1,	0x15E1,	%i0
	umulcc	%l0,	0x0E23,	%g1
	fpadd16s	%f9,	%f13,	%f20
	bne,a,pt	%xcc,	loop_2442
	tvs	%xcc,	0x1
	fand	%f8,	%f18,	%f24
	addc	%o4,	%g6,	%o5
loop_2442:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%i1
	fpadd32s	%f17,	%f17,	%f5
	tl	%icc,	0x0
	andncc	%i2,	%o0,	%o3
	stb	%o7,	[%l7 + 0x6F]
	sllx	%o1,	%o6,	%i6
	and	%g5,	0x1609,	%i4
	fcmpgt16	%f16,	%f18,	%l5
	fands	%f6,	%f31,	%f16
	srl	%l2,	%l4,	%l3
	sll	%l6,	%i3,	%i7
	alignaddrl	%g2,	%g3,	%g7
	movle	%xcc,	%o2,	%g4
	add	%l1,	%i0,	%g1
	udivcc	%o4,	0x0A28,	%g6
	fmovdpos	%xcc,	%f5,	%f31
	bvs,pn	%xcc,	loop_2443
	sll	%l0,	%o5,	%i5
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i1
loop_2443:
	tn	%xcc,	0x3
	edge16	%o0,	%o3,	%i2
	srlx	%o1,	0x1A,	%o7
	bge	loop_2444
	andncc	%o6,	%i6,	%i4
	fbue	%fcc1,	loop_2445
	array16	%l5,	%g5,	%l2
loop_2444:
	fmovdleu	%xcc,	%f16,	%f18
	edge8ln	%l4,	%l6,	%i3
loop_2445:
	tcc	%icc,	0x3
	fmovrdlez	%i7,	%f20,	%f2
	array32	%g2,	%l3,	%g7
	tle	%icc,	0x6
	srax	%o2,	0x09,	%g4
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l1
	membar	0x35
	movvc	%xcc,	%i0,	%g3
	bne,pt	%icc,	loop_2446
	umulcc	%g1,	0x1C87,	%g6
	popc	0x0838,	%l0
	fmovsa	%xcc,	%f9,	%f23
loop_2446:
	ta	%xcc,	0x5
	tsubcctv	%o4,	0x043C,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i1,	0x19FB,	%i5
	be,pt	%xcc,	loop_2447
	ldsb	[%l7 + 0x4F],	%o0
	fpsub16	%f24,	%f28,	%f30
	fble,a	%fcc2,	loop_2448
loop_2447:
	smulcc	%i2,	0x1EB6,	%o1
	fcmple32	%f16,	%f24,	%o3
	fsrc1s	%f3,	%f8
loop_2448:
	mulscc	%o7,	%i6,	%i4
	fmovsne	%xcc,	%f3,	%f27
	fbo,a	%fcc1,	loop_2449
	movleu	%xcc,	%o6,	%l5
	umulcc	%g5,	%l4,	%l2
	bcc,a,pt	%xcc,	loop_2450
loop_2449:
	fpsub32s	%f23,	%f31,	%f7
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf1
	membar	#Sync
loop_2450:
	lduh	[%l7 + 0x10],	%l6
	edge16ln	%i7,	%g2,	%i3
	ldx	[%l7 + 0x70],	%g7
	ldd	[%l7 + 0x50],	%l2
	movrgz	%o2,	%g4,	%l1
	bcc,pt	%icc,	loop_2451
	orncc	%g3,	%g1,	%i0
	sllx	%g6,	0x13,	%o4
	movre	%o5,	0x2DA,	%i1
loop_2451:
	movcs	%xcc,	%i5,	%o0
	brgz,a	%i2,	loop_2452
	movn	%xcc,	%o1,	%o3
	mova	%xcc,	%l0,	%o7
	movrgz	%i6,	0x1D3,	%i4
loop_2452:
	tvc	%icc,	0x4
	fbule	%fcc2,	loop_2453
	edge8ln	%l5,	%g5,	%l4
	edge32ln	%o6,	%l2,	%i7
	fmovrse	%g2,	%f11,	%f3
loop_2453:
	tn	%icc,	0x3
	movn	%icc,	%l6,	%i3
	brnz,a	%l3,	loop_2454
	sllx	%o2,	0x02,	%g7
	bvs,pn	%xcc,	loop_2455
	ldx	[%l7 + 0x08],	%l1
loop_2454:
	ba,a	loop_2456
	fandnot2s	%f0,	%f15,	%f1
loop_2455:
	st	%f26,	[%l7 + 0x14]
	array16	%g4,	%g3,	%i0
loop_2456:
	tpos	%icc,	0x1
	smul	%g1,	%g6,	%o4
	edge8n	%o5,	%i5,	%o0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%o1
	brlez,a	%i1,	loop_2457
	tgu	%icc,	0x1
	fbuge	%fcc2,	loop_2458
	bg,pt	%xcc,	loop_2459
loop_2457:
	and	%l0,	%o7,	%o3
	be,a	loop_2460
loop_2458:
	brlez,a	%i6,	loop_2461
loop_2459:
	te	%icc,	0x2
	udivx	%l5,	0x14A6,	%g5
loop_2460:
	fmovrslz	%i4,	%f8,	%f13
loop_2461:
	te	%xcc,	0x7
	tneg	%xcc,	0x7
	tl	%xcc,	0x5
	and	%l4,	%o6,	%i7
	andn	%g2,	0x0368,	%l6
	tsubcc	%i3,	0x1DB5,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l2,	0x1137,	%o2
	fpsub32	%f26,	%f30,	%f8
	movg	%xcc,	%l1,	%g4
	nop
	set	0x58, %l4
	prefetch	[%l7 + %l4],	 0x1
	fcmpgt16	%f8,	%f24,	%g3
	edge32l	%g7,	%g1,	%g6
	movvs	%xcc,	%o4,	%i0
	tsubcc	%i5,	%o0,	%o5
	fmovrdlz	%i2,	%f10,	%f12
	membar	0x03
	tcs	%xcc,	0x6
	tvc	%xcc,	0x1
	set	0x6B, %i4
	stba	%o1,	[%l7 + %i4] 0xea
	membar	#Sync
	smulcc	%l0,	%i1,	%o7
	bpos,pn	%xcc,	loop_2462
	movge	%xcc,	%i6,	%o3
	bcc	loop_2463
	array32	%l5,	%i4,	%l4
loop_2462:
	fzeros	%f12
	ldstub	[%l7 + 0x62],	%o6
loop_2463:
	umulcc	%g5,	%g2,	%l6
	xnor	%i3,	%l3,	%l2
	fcmpgt16	%f22,	%f28,	%o2
	ldx	[%l7 + 0x10],	%i7
	fbn	%fcc3,	loop_2464
	fbo,a	%fcc3,	loop_2465
	bleu,a	loop_2466
	tn	%icc,	0x1
loop_2464:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%g3
loop_2465:
	edge32ln	%g7,	%g1,	%l1
loop_2466:
	sub	%g6,	%o4,	%i0
	fmovdle	%icc,	%f7,	%f31
	tvc	%xcc,	0x7
	subccc	%o0,	%o5,	%i5
	nop
	set	0x7C, %g7
	lduw	[%l7 + %g7],	%o1
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f0
	udiv	%l0,	0x156C,	%i1
	stb	%i2,	[%l7 + 0x4D]
	edge16n	%o7,	%o3,	%i6
	fornot1	%f28,	%f30,	%f6
	and	%l5,	0x05B7,	%i4
	bleu,a,pn	%xcc,	loop_2467
	ldd	[%l7 + 0x28],	%o6
	fpadd16s	%f27,	%f9,	%f5
	bg,a,pt	%icc,	loop_2468
loop_2467:
	fsrc2	%f22,	%f2
	fcmpeq32	%f4,	%f8,	%l4
	ba,pn	%icc,	loop_2469
loop_2468:
	alignaddr	%g5,	%l6,	%g2
	tne	%icc,	0x1
	fbu	%fcc1,	loop_2470
loop_2469:
	tpos	%xcc,	0x1
	movrlez	%l3,	0x10A,	%l2
	fmul8x16au	%f9,	%f30,	%f20
loop_2470:
	nop
	setx	loop_2471,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32	%o2,	%i7,	%g4
	fpsub32	%f12,	%f14,	%f2
	fnor	%f18,	%f12,	%f24
loop_2471:
	movrne	%i3,	0x3D3,	%g7
	fones	%f3
	tle	%icc,	0x6
	edge8	%g1,	%g3,	%g6
	taddcctv	%l1,	%i0,	%o0
	ldx	[%l7 + 0x40],	%o4
	fblg	%fcc2,	loop_2472
	sir	0x0457
	fbg,a	%fcc1,	loop_2473
	fcmpne32	%f14,	%f28,	%o5
loop_2472:
	movl	%icc,	%i5,	%l0
	ldub	[%l7 + 0x6B],	%o1
loop_2473:
	sub	%i1,	0x10DF,	%o7
	fbn	%fcc3,	loop_2474
	edge8ln	%i2,	%o3,	%l5
	edge16n	%i4,	%i6,	%o6
	fblg,a	%fcc1,	loop_2475
loop_2474:
	mulx	%g5,	0x1A4F,	%l4
	and	%l6,	0x0372,	%l3
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x48] %asi,	%g2
loop_2475:
	mulscc	%o2,	0x1617,	%l2
	tn	%icc,	0x4
	subc	%g4,	0x12C6,	%i3
	umulcc	%g7,	%i7,	%g1
	fmovdgu	%icc,	%f22,	%f1
	xorcc	%g6,	0x00C4,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%i0,	%g3
	udivx	%o0,	0x0806,	%o4
	ldsw	[%l7 + 0x0C],	%o5
	set	0x4C, %o6
	stba	%l0,	[%l7 + %o6] 0x2b
	membar	#Sync
	popc	%o1,	%i1
	udiv	%i5,	0x0082,	%o7
	movrlz	%i2,	%o3,	%i4
	fmovrsgez	%i6,	%f5,	%f28
	siam	0x2
	edge32l	%o6,	%l5,	%l4
	fcmpeq32	%f10,	%f18,	%l6
	taddcc	%l3,	%g5,	%g2
	brgez,a	%l2,	loop_2476
	addc	%g4,	0x07D3,	%i3
	alignaddr	%o2,	%g7,	%g1
	andncc	%i7,	%l1,	%g6
loop_2476:
	ldsb	[%l7 + 0x15],	%g3
	move	%xcc,	%o0,	%i0
	movge	%icc,	%o5,	%l0
	umulcc	%o4,	%o1,	%i5
	edge8l	%o7,	%i2,	%o3
	edge16l	%i1,	%i6,	%i4
	and	%l5,	%l4,	%o6
	edge16n	%l6,	%l3,	%g5
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x58] %asi,	%l2
	umul	%g2,	%g4,	%i3
	tsubcctv	%g7,	%g1,	%o2
	bcs,pt	%xcc,	loop_2477
	tn	%xcc,	0x3
	fmovdvs	%xcc,	%f25,	%f3
	fbug	%fcc0,	loop_2478
loop_2477:
	fbul	%fcc1,	loop_2479
	udivx	%i7,	0x1DEB,	%g6
	add	%l1,	0x12AD,	%o0
loop_2478:
	sethi	0x1E72,	%g3
loop_2479:
	bcc	%xcc,	loop_2480
	addc	%o5,	0x1798,	%i0
	ld	[%l7 + 0x7C],	%f19
	addccc	%l0,	0x0E2C,	%o4
loop_2480:
	sdivcc	%i5,	0x19EC,	%o7
	fmovd	%f18,	%f0
	sdiv	%i2,	0x1B35,	%o3
	edge8	%o1,	%i6,	%i1
	fxnors	%f4,	%f15,	%f20
	fmuld8ulx16	%f28,	%f4,	%f28
	array8	%i4,	%l4,	%l5
	umulcc	%o6,	%l3,	%g5
	movvs	%icc,	%l2,	%l6
	fbule,a	%fcc0,	loop_2481
	mulx	%g2,	0x1F48,	%g4
	movrlz	%i3,	0x11D,	%g7
	taddcctv	%g1,	%i7,	%o2
loop_2481:
	tsubcc	%g6,	0x062D,	%l1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%o0,	%g3
	tgu	%xcc,	0x2
	sethi	0x1FA9,	%o5
	tcc	%icc,	0x4
	set	0x5C, %g4
	stha	%i0,	[%l7 + %g4] 0xea
	membar	#Sync
	lduh	[%l7 + 0x32],	%o4
	or	%l0,	%i5,	%i2
	ble,a	%icc,	loop_2482
	movcs	%xcc,	%o3,	%o7
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
loop_2482:
	movgu	%icc,	%i6,	%i1
	wr	%g0,	0x88,	%asi
	stxa	%l4,	[%l7 + 0x48] %asi
	srax	%i4,	%l5,	%o6
	sethi	0x0303,	%g5
	tl	%icc,	0x1
	tcc	%icc,	0x3
	xor	%l2,	%l6,	%g2
	sllx	%g4,	%l3,	%i3
	set	0x24, %i5
	lduha	[%l7 + %i5] 0x0c,	%g1
	stx	%g7,	[%l7 + 0x60]
	fmovdge	%xcc,	%f14,	%f19
	ldsw	[%l7 + 0x5C],	%i7
	set	0x75, %l1
	lduba	[%l7 + %l1] 0x0c,	%g6
	bleu	%xcc,	loop_2483
	srl	%o2,	0x0E,	%o0
	fsrc1s	%f16,	%f2
	fbue	%fcc0,	loop_2484
loop_2483:
	umulcc	%g3,	%l1,	%o5
	sdiv	%i0,	0x0A7C,	%o4
	fpadd32s	%f23,	%f3,	%f22
loop_2484:
	tneg	%icc,	0x1
	st	%f24,	[%l7 + 0x30]
	array16	%i5,	%l0,	%o3
	array8	%i2,	%o1,	%i6
	tvs	%xcc,	0x2
	flush	%l7 + 0x60
	subcc	%i1,	0x1589,	%o7
	edge16n	%i4,	%l4,	%l5
	set	0x60, %l0
	prefetcha	[%l7 + %l0] 0x80,	 0x2
	xnor	%g5,	0x0351,	%l6
	fnegs	%f1,	%f9
	tge	%icc,	0x4
	edge32l	%g2,	%l2,	%l3
	edge16l	%i3,	%g1,	%g4
	bpos,a	%xcc,	loop_2485
	ldx	[%l7 + 0x58],	%g7
	orn	%g6,	%o2,	%o0
	addcc	%g3,	%i7,	%l1
loop_2485:
	array8	%i0,	%o5,	%o4
	fmovsvc	%xcc,	%f24,	%f14
	array8	%i5,	%o3,	%i2
	ba	%xcc,	loop_2486
	fsrc2	%f12,	%f20
	brz,a	%o1,	loop_2487
	siam	0x7
loop_2486:
	popc	%l0,	%i1
	movne	%icc,	%o7,	%i6
loop_2487:
	sub	%l4,	0x1E80,	%l5
	udivx	%i4,	0x094D,	%o6
	fpsub16	%f28,	%f14,	%f10
	addccc	%l6,	%g5,	%l2
	taddcctv	%l3,	0x03FA,	%g2
	bne,a	loop_2488
	bn,pn	%xcc,	loop_2489
	fmovsge	%icc,	%f27,	%f8
	ba,a,pn	%icc,	loop_2490
loop_2488:
	tvs	%icc,	0x7
loop_2489:
	movre	%g1,	0x32B,	%i3
	fmul8ulx16	%f6,	%f16,	%f4
loop_2490:
	movge	%icc,	%g4,	%g7
	edge16n	%o2,	%g6,	%g3
	alignaddr	%i7,	%o0,	%i0
	fmovdle	%icc,	%f9,	%f15
	sllx	%o5,	%o4,	%i5
	sub	%o3,	0x1930,	%l1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%l0
	movrgez	%i1,	0x1D1,	%o7
	movpos	%xcc,	%i6,	%i2
	fpmerge	%f1,	%f13,	%f26
	fnot2	%f12,	%f8
	fandnot2	%f16,	%f6,	%f8
	movge	%xcc,	%l5,	%l4
	udivx	%o6,	0x0C6F,	%i4
	fnegd	%f20,	%f4
	fmovsleu	%xcc,	%f31,	%f24
	movcc	%xcc,	%g5,	%l6
	movneg	%xcc,	%l2,	%g2
	fbo,a	%fcc2,	loop_2491
	sethi	0x1440,	%l3
	srl	%i3,	%g1,	%g4
	ldsw	[%l7 + 0x08],	%g7
loop_2491:
	fnot2	%f28,	%f14
	fbge	%fcc2,	loop_2492
	sir	0x1FE9
	fcmpne16	%f8,	%f8,	%o2
	andcc	%g3,	%g6,	%o0
loop_2492:
	fmuld8ulx16	%f24,	%f29,	%f2
	umul	%i0,	0x005A,	%i7
	edge16ln	%o4,	%i5,	%o3
	edge32	%l1,	%o1,	%l0
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	xnorcc	%i1,	0x1090,	%i6
	array32	%i2,	%l5,	%l4
	fornot2s	%f30,	%f14,	%f17
	ldsh	[%l7 + 0x0E],	%o7
	fpsub32s	%f12,	%f11,	%f25
	udivx	%o6,	0x1260,	%i4
	movre	%l6,	%g5,	%g2
	fpsub32s	%f2,	%f6,	%f20
	add	%l3,	0x1089,	%i3
	set	0x68, %l5
	ldswa	[%l7 + %l5] 0x14,	%l2
	set	0x12, %o7
	stha	%g1,	[%l7 + %o7] 0x19
	sdivx	%g7,	0x1C8C,	%g4
	fmovrdgz	%o2,	%f10,	%f4
	umulcc	%g3,	%o0,	%i0
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x50] %asi,	%i7
	smulcc	%o4,	0x0E13,	%g6
	smul	%o3,	%l1,	%i5
	set	0x30, %o2
	prefetcha	[%l7 + %o2] 0x19,	 0x3
	stw	%o5,	[%l7 + 0x64]
	fba,a	%fcc1,	loop_2493
	movle	%xcc,	%o1,	%i1
	movcc	%icc,	%i6,	%i2
	tcc	%xcc,	0x3
loop_2493:
	nop
	set	0x38, %g6
	lda	[%l7 + %g6] 0x04,	%f24
	taddcctv	%l5,	%o7,	%o6
	fmul8x16	%f14,	%f18,	%f0
	fmovscc	%icc,	%f31,	%f5
	bneg	%xcc,	loop_2494
	fands	%f16,	%f9,	%f5
	call	loop_2495
	movge	%xcc,	%i4,	%l6
loop_2494:
	sll	%g5,	0x10,	%g2
	movge	%xcc,	%l4,	%l3
loop_2495:
	movrne	%i3,	0x3F6,	%l2
	udivcc	%g7,	0x0B77,	%g1
	fnegs	%f25,	%f29
	ta	%icc,	0x3
	array32	%g4,	%g3,	%o0
	movneg	%icc,	%i0,	%i7
	array8	%o2,	%g6,	%o4
	array16	%l1,	%i5,	%l0
	movn	%xcc,	%o3,	%o5
	fpsub32	%f30,	%f28,	%f24
	ta	%xcc,	0x7
	ldub	[%l7 + 0x32],	%i1
	srax	%o1,	%i6,	%i2
	movl	%icc,	%o7,	%o6
	andncc	%l5,	%i4,	%l6
	subccc	%g2,	%g5,	%l3
	movrlz	%l4,	%i3,	%g7
	fandnot2s	%f15,	%f14,	%f3
	tvc	%icc,	0x5
	fbe	%fcc1,	loop_2496
	udivx	%g1,	0x17EF,	%l2
	movne	%xcc,	%g4,	%g3
	movvc	%xcc,	%i0,	%i7
loop_2496:
	andncc	%o0,	%g6,	%o2
	prefetch	[%l7 + 0x1C],	 0x1
	edge32	%o4,	%l1,	%i5
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x70] %asi,	%l0
	edge16	%o5,	%o3,	%o1
	mova	%xcc,	%i6,	%i1
	fbu,a	%fcc0,	loop_2497
	st	%f2,	[%l7 + 0x4C]
	andn	%i2,	0x1927,	%o6
	fblg,a	%fcc1,	loop_2498
loop_2497:
	lduh	[%l7 + 0x4E],	%o7
	ble,a,pn	%icc,	loop_2499
	umul	%i4,	%l6,	%g2
loop_2498:
	tsubcctv	%l5,	%l3,	%g5
	sllx	%i3,	0x1A,	%g7
loop_2499:
	movl	%xcc,	%g1,	%l2
	fcmpgt16	%f12,	%f12,	%g4
	movne	%xcc,	%g3,	%l4
	tneg	%icc,	0x0
	umulcc	%i7,	0x075A,	%i0
	set	0x56, %i6
	lduha	[%l7 + %i6] 0x89,	%o0
	te	%xcc,	0x7
	tsubcctv	%o2,	%g6,	%o4
	umulcc	%l1,	0x1A40,	%i5
	edge16ln	%l0,	%o5,	%o3
	tne	%icc,	0x7
	fpsub32s	%f7,	%f9,	%f11
	fornot1s	%f17,	%f30,	%f17
	fbe	%fcc3,	loop_2500
	membar	0x1F
	fba,a	%fcc1,	loop_2501
	mulscc	%i6,	0x1586,	%i1
loop_2500:
	tn	%xcc,	0x0
	ldsb	[%l7 + 0x1A],	%i2
loop_2501:
	fcmped	%fcc3,	%f16,	%f6
	fxnor	%f30,	%f14,	%f22
	fmovd	%f6,	%f12
	fcmpeq32	%f2,	%f30,	%o6
	fmovsvs	%icc,	%f22,	%f21
	movvs	%icc,	%o7,	%o1
	edge8ln	%l6,	%i4,	%l5
	srax	%g2,	%l3,	%i3
	fmovd	%f26,	%f12
	alignaddrl	%g5,	%g1,	%l2
	bgu,a	%xcc,	loop_2502
	mova	%icc,	%g4,	%g7
	brgz,a	%g3,	loop_2503
	andncc	%i7,	%i0,	%l4
loop_2502:
	fblg,a	%fcc1,	loop_2504
	bl	%icc,	loop_2505
loop_2503:
	tg	%xcc,	0x1
	sir	0x0833
loop_2504:
	fornot2s	%f19,	%f19,	%f12
loop_2505:
	umul	%o0,	0x0896,	%g6
	movge	%icc,	%o4,	%l1
	fnegd	%f28,	%f2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x60] %asi,	%o2
	array32	%l0,	%o5,	%o3
	addccc	%i6,	%i5,	%i2
	movrgz	%i1,	%o6,	%o1
	fbne,a	%fcc3,	loop_2506
	fmul8ulx16	%f22,	%f18,	%f4
	brgz	%l6,	loop_2507
	array32	%i4,	%o7,	%l5
loop_2506:
	edge8ln	%g2,	%i3,	%g5
	orcc	%l3,	%g1,	%g4
loop_2507:
	ldx	[%l7 + 0x58],	%l2
	sethi	0x0D69,	%g7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g3,	%i0
	xnor	%l4,	0x0E31,	%i7
	nop
	set	0x0C, %o1
	ldsw	[%l7 + %o1],	%o0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%g6
	fxors	%f5,	%f26,	%f31
	movleu	%xcc,	%l1,	%o2
	tvs	%icc,	0x0
	fblg,a	%fcc2,	loop_2508
	ba,a	loop_2509
	edge8l	%o5,	%o3,	%l0
	addcc	%i6,	%i5,	%i1
loop_2508:
	fmovsvs	%icc,	%f20,	%f5
loop_2509:
	tcc	%xcc,	0x5
	array16	%o6,	%i2,	%l6
	tvc	%xcc,	0x1
	udivcc	%o1,	0x1D01,	%i4
	fmovrsgz	%o7,	%f10,	%f18
	subcc	%g2,	%l5,	%i3
	fbe,a	%fcc1,	loop_2510
	bleu	%xcc,	loop_2511
	tpos	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2510:
	pdist	%f22,	%f10,	%f16
loop_2511:
	tcc	%xcc,	0x1
	edge16l	%l3,	%g5,	%g1
	mulx	%g4,	0x080A,	%g7
	edge16n	%l2,	%i0,	%g3
	edge16n	%i7,	%o0,	%o4
	fmovdgu	%icc,	%f23,	%f26
	ldsh	[%l7 + 0x0C],	%g6
	fnot2s	%f16,	%f15
	fnands	%f6,	%f7,	%f12
	set	0x37, %l3
	stba	%l4,	[%l7 + %l3] 0x18
	movrlz	%o2,	%o5,	%o3
	fbue	%fcc1,	loop_2512
	brlez,a	%l1,	loop_2513
	tneg	%xcc,	0x3
	fcmpd	%fcc3,	%f4,	%f30
loop_2512:
	sdivcc	%l0,	0x0C90,	%i5
loop_2513:
	smul	%i6,	%i1,	%o6
	taddcc	%l6,	%o1,	%i2
	tle	%xcc,	0x3
	subc	%i4,	%g2,	%l5
	nop
	set	0x64, %o5
	prefetch	[%l7 + %o5],	 0x1
	fpsub16	%f8,	%f30,	%f12
	fnot1	%f14,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i3,	%l3,	%g5
	tn	%xcc,	0x6
	tleu	%icc,	0x0
	tg	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	stxa	%o7,	[%l7 + 0x78] %asi
	tvc	%xcc,	0x0
	bn,pn	%xcc,	loop_2514
	sir	0x0C60
	fmul8sux16	%f4,	%f16,	%f20
	bge	%xcc,	loop_2515
loop_2514:
	alignaddrl	%g1,	%g4,	%l2
	fcmpne32	%f10,	%f4,	%g7
	te	%xcc,	0x3
loop_2515:
	xnorcc	%i0,	0x18DE,	%i7
	popc	%o0,	%g3
	mulscc	%o4,	%l4,	%o2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x64] %asi,	%f7
	fsrc1s	%f15,	%f29
	movcc	%xcc,	%g6,	%o3
	fbl,a	%fcc1,	loop_2516
	sethi	0x1ADF,	%l1
	movn	%xcc,	%l0,	%i5
	fbu	%fcc0,	loop_2517
loop_2516:
	flush	%l7 + 0x10
	alignaddr	%i6,	%i1,	%o5
	alignaddrl	%l6,	%o6,	%o1
loop_2517:
	tneg	%xcc,	0x6
	tpos	%icc,	0x4
	swap	[%l7 + 0x14],	%i2
	tg	%xcc,	0x6
	wr	%g0,	0xe2,	%asi
	stba	%g2,	[%l7 + 0x3D] %asi
	membar	#Sync
	sdiv	%l5,	0x119F,	%i3
	stbar
	movvc	%icc,	%l3,	%i4
	mulscc	%g5,	%g1,	%o7
	bcc,a,pt	%icc,	loop_2518
	fbne,a	%fcc3,	loop_2519
	bn,pn	%icc,	loop_2520
	tvs	%icc,	0x3
loop_2518:
	fmovdneg	%xcc,	%f12,	%f10
loop_2519:
	nop
	setx	loop_2521,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2520:
	fzeros	%f4
	addccc	%l2,	%g7,	%i0
	nop
	setx loop_2522, %l0, %l1
	jmpl %l1, %g4
loop_2521:
	addc	%o0,	0x1539,	%g3
	be,a,pn	%xcc,	loop_2523
	fxor	%f12,	%f4,	%f8
loop_2522:
	movle	%icc,	%o4,	%i7
	tleu	%icc,	0x6
loop_2523:
	movn	%icc,	%o2,	%g6
	tcs	%icc,	0x7
	movn	%icc,	%l4,	%o3
	bl,pt	%icc,	loop_2524
	fmul8ulx16	%f26,	%f30,	%f18
	fsrc2s	%f2,	%f25
	fmovs	%f9,	%f0
loop_2524:
	srax	%l1,	0x02,	%l0
	fbuge	%fcc3,	loop_2525
	mova	%xcc,	%i5,	%i6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%l6
loop_2525:
	edge16	%i1,	%o1,	%o6
	tcs	%xcc,	0x1
	movpos	%icc,	%g2,	%l5
	fmul8ulx16	%f26,	%f6,	%f2
	edge16n	%i2,	%l3,	%i3
	brlez	%i4,	loop_2526
	edge16	%g1,	%g5,	%l2
	fpadd16s	%f18,	%f30,	%f7
	sdiv	%o7,	0x1AEB,	%g7
loop_2526:
	bgu,a	%icc,	loop_2527
	tpos	%icc,	0x4
	tsubcctv	%g4,	%o0,	%g3
	movn	%icc,	%i0,	%o4
loop_2527:
	flush	%l7 + 0x0C
	sub	%o2,	%g6,	%i7
	fbne,a	%fcc1,	loop_2528
	tle	%xcc,	0x0
	tl	%xcc,	0x4
	subccc	%l4,	0x0976,	%l1
loop_2528:
	sir	0x14DD
	wr	%g0,	0x81,	%asi
	sta	%f17,	[%l7 + 0x78] %asi
	edge8n	%o3,	%i5,	%l0
	fba	%fcc0,	loop_2529
	fpadd16	%f8,	%f22,	%f24
	bcc,pn	%xcc,	loop_2530
	sra	%o5,	%i6,	%i1
loop_2529:
	tvs	%xcc,	0x2
	movl	%xcc,	%l6,	%o6
loop_2530:
	brgz,a	%g2,	loop_2531
	sth	%l5,	[%l7 + 0x30]
	tgu	%icc,	0x6
	bcs	loop_2532
loop_2531:
	te	%xcc,	0x2
	udivcc	%o1,	0x0804,	%l3
	bpos	loop_2533
loop_2532:
	mulx	%i2,	%i4,	%i3
	movrne	%g1,	%g5,	%o7
	edge32ln	%g7,	%g4,	%l2
loop_2533:
	brnz,a	%g3,	loop_2534
	nop
	setx	loop_2535,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%o0,	0x0519,	%i0
	xnorcc	%o4,	0x0AA5,	%g6
loop_2534:
	fmovrdgz	%o2,	%f12,	%f16
loop_2535:
	fxor	%f10,	%f30,	%f12
	ldsh	[%l7 + 0x12],	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f16,	%f12,	%f22
	movrgez	%l1,	%o3,	%i5
	bneg,pn	%icc,	loop_2536
	tcs	%xcc,	0x3
	xnor	%l0,	0x0FB2,	%o5
	movrgez	%i6,	0x3EF,	%i1
loop_2536:
	fmovsvs	%xcc,	%f12,	%f12
	sra	%l4,	%o6,	%g2
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bpos,a	loop_2537
	or	%l6,	%o1,	%l5
	sra	%i2,	%l3,	%i4
	fnors	%f13,	%f8,	%f22
loop_2537:
	brgz,a	%g1,	loop_2538
	movgu	%icc,	%i3,	%o7
	edge32ln	%g7,	%g4,	%l2
	andcc	%g3,	0x0F19,	%g5
loop_2538:
	bcc,a	%icc,	loop_2539
	tcs	%icc,	0x0
	sdivcc	%i0,	0x1264,	%o4
	set	0x70, %o0
	ldda	[%l7 + %o0] 0x2e,	%g6
loop_2539:
	tvs	%icc,	0x1
	fbne	%fcc1,	loop_2540
	smul	%o0,	%o2,	%l1
	andcc	%i7,	0x0083,	%o3
	sdivcc	%l0,	0x1B29,	%i5
loop_2540:
	andcc	%o5,	0x1340,	%i1
	fbo,a	%fcc2,	loop_2541
	tne	%xcc,	0x4
	tgu	%icc,	0x3
	movrgez	%l4,	%o6,	%g2
loop_2541:
	fmovrslz	%i6,	%f22,	%f3
	tsubcc	%o1,	0x1EEC,	%l6
	edge8ln	%l5,	%l3,	%i2
	taddcctv	%g1,	0x11A7,	%i3
	bgu,a,pn	%xcc,	loop_2542
	fmuld8sux16	%f19,	%f16,	%f30
	fmovsneg	%xcc,	%f5,	%f19
	fmovdcc	%xcc,	%f18,	%f26
loop_2542:
	bvc,pn	%xcc,	loop_2543
	udivcc	%o7,	0x1C4F,	%i4
	fmovsleu	%xcc,	%f11,	%f14
	fbu,a	%fcc2,	loop_2544
loop_2543:
	edge16n	%g7,	%l2,	%g4
	fbne,a	%fcc3,	loop_2545
	sethi	0x1A93,	%g3
loop_2544:
	sdivcc	%i0,	0x07E0,	%g5
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x4C] %asi,	%f21
loop_2545:
	move	%xcc,	%o4,	%o0
	udivx	%o2,	0x059C,	%l1
	fnegs	%f16,	%f22
	fbl	%fcc1,	loop_2546
	sllx	%i7,	0x14,	%o3
	xnorcc	%l0,	0x0DE5,	%i5
	fmovdcc	%icc,	%f5,	%f9
loop_2546:
	nop
	set	0x5C, %i3
	lduwa	[%l7 + %i3] 0x19,	%g6
	addc	%i1,	0x0F2C,	%l4
	fmovrsne	%o6,	%f3,	%f10
	tvc	%icc,	0x7
	edge32n	%o5,	%i6,	%g2
	subcc	%o1,	%l6,	%l3
	ldstub	[%l7 + 0x18],	%i2
	edge8ln	%g1,	%i3,	%l5
	andn	%o7,	0x0081,	%g7
	te	%xcc,	0x7
	fmovsleu	%icc,	%f2,	%f31
	fbge,a	%fcc1,	loop_2547
	bge,a	%icc,	loop_2548
	fnot2s	%f24,	%f17
	srax	%i4,	0x1F,	%g4
loop_2547:
	be	loop_2549
loop_2548:
	tvs	%xcc,	0x4
	movrlz	%g3,	%i0,	%g5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%l2
loop_2549:
	xnor	%o2,	0x0F9E,	%o0
	st	%f29,	[%l7 + 0x20]
	fornot1s	%f29,	%f30,	%f29
	orcc	%l1,	%o3,	%l0
	fbe,a	%fcc0,	loop_2550
	fmul8ulx16	%f4,	%f2,	%f4
	edge32l	%i5,	%g6,	%i7
	fmovscs	%icc,	%f12,	%f2
loop_2550:
	membar	0x5D
	fbn	%fcc3,	loop_2551
	fones	%f7
	edge16l	%l4,	%o6,	%o5
	fmovscs	%icc,	%f13,	%f17
loop_2551:
	nop
	set	0x14, %g3
	ldsha	[%l7 + %g3] 0x15,	%i1
	st	%f16,	[%l7 + 0x6C]
	fpsub32s	%f0,	%f17,	%f19
	popc	0x0C06,	%i6
	brgez	%g2,	loop_2552
	mulscc	%o1,	0x156B,	%l3
	sir	0x1CC0
	fblg,a	%fcc0,	loop_2553
loop_2552:
	swap	[%l7 + 0x24],	%l6
	movvc	%xcc,	%i2,	%g1
	tn	%xcc,	0x7
loop_2553:
	move	%icc,	%i3,	%l5
	fmovsa	%xcc,	%f5,	%f5
	movpos	%xcc,	%g7,	%i4
	udivx	%g4,	0x11E8,	%g3
	fabsd	%f30,	%f6
	movcc	%xcc,	%o7,	%g5
	bge,a,pt	%icc,	loop_2554
	movre	%o4,	%l2,	%o2
	ta	%xcc,	0x6
	brlz,a	%i0,	loop_2555
loop_2554:
	movrgz	%l1,	0x1B5,	%o0
	movrgz	%l0,	0x1E5,	%o3
	alignaddr	%i5,	%i7,	%l4
loop_2555:
	edge32n	%g6,	%o6,	%i1
	ldx	[%l7 + 0x18],	%o5
	movl	%icc,	%g2,	%o1
	movvc	%xcc,	%i6,	%l6
	movcc	%xcc,	%l3,	%g1
	subccc	%i3,	%l5,	%g7
	edge16ln	%i2,	%i4,	%g4
	tcc	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%icc,	%f19,	%f12
	tvc	%icc,	0x0
	movl	%icc,	%g3,	%o7
	and	%g5,	%o4,	%l2
	nop
	setx	loop_2556,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tg	%icc,	0x5
	edge16l	%i0,	%l1,	%o2
	taddcctv	%l0,	0x0EC4,	%o0
loop_2556:
	array16	%o3,	%i5,	%l4
	tcc	%icc,	0x4
	tsubcc	%g6,	%o6,	%i7
	edge8ln	%i1,	%o5,	%o1
	fcmpgt32	%f0,	%f22,	%g2
	smulcc	%i6,	0x1C0E,	%l3
	alignaddrl	%l6,	%g1,	%i3
	ldsw	[%l7 + 0x40],	%g7
	smul	%l5,	0x1B85,	%i4
	sdivcc	%i2,	0x19F0,	%g4
	umul	%o7,	0x1B03,	%g5
	bpos	%xcc,	loop_2557
	be,pt	%icc,	loop_2558
	nop
	setx	loop_2559,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fornot2s	%f6,	%f11,	%f27
loop_2557:
	ldsw	[%l7 + 0x58],	%g3
loop_2558:
	flush	%l7 + 0x7C
loop_2559:
	fmovdne	%icc,	%f21,	%f27
	sdivcc	%o4,	0x01DF,	%l2
	orn	%i0,	0x1ED6,	%l1
	fbge,a	%fcc1,	loop_2560
	fbo	%fcc2,	loop_2561
	subc	%l0,	0x0F0E,	%o0
	movcc	%xcc,	%o3,	%o2
loop_2560:
	fmovd	%f26,	%f10
loop_2561:
	nop
	set	0x56, %g2
	lduha	[%l7 + %g2] 0x0c,	%l4
	alignaddr	%g6,	%o6,	%i7
	fcmpd	%fcc0,	%f10,	%f0
	movcs	%xcc,	%i1,	%o5
	fxors	%f15,	%f28,	%f7
	fxnor	%f12,	%f14,	%f14
	membar	0x47
	fmovdg	%xcc,	%f23,	%f28
	nop
	set	0x32, %l6
	sth	%i5,	[%l7 + %l6]
	ldstub	[%l7 + 0x4A],	%g2
	umulcc	%i6,	%l3,	%o1
	fcmple32	%f16,	%f10,	%l6
	movn	%xcc,	%g1,	%g7
	fmul8x16al	%f21,	%f31,	%f26
	ld	[%l7 + 0x3C],	%f27
	fbo	%fcc0,	loop_2562
	tneg	%xcc,	0x6
	fpadd32s	%f3,	%f7,	%f7
	fmovspos	%icc,	%f1,	%f19
loop_2562:
	brgz,a	%l5,	loop_2563
	xnor	%i4,	%i2,	%i3
	ble	loop_2564
	swap	[%l7 + 0x78],	%g4
loop_2563:
	fmovdne	%icc,	%f12,	%f19
	tcc	%xcc,	0x2
loop_2564:
	movge	%xcc,	%o7,	%g5
	edge8	%g3,	%l2,	%i0
	tpos	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	xnor	%l1,	%o4,	%o0
	fpack16	%f12,	%f26
	for	%f8,	%f0,	%f10
	sir	0x0FE8
	edge32	%o3,	%o2,	%l0
	sllx	%g6,	%o6,	%i7
	be,a,pt	%xcc,	loop_2565
	edge32	%l4,	%i1,	%o5
	udivx	%g2,	0x19D3,	%i6
	fblg,a	%fcc3,	loop_2566
loop_2565:
	and	%i5,	0x0CB8,	%l3
	edge8	%o1,	%l6,	%g1
	fpsub16s	%f1,	%f14,	%f0
loop_2566:
	addc	%l5,	0x088C,	%i4
	fmovdneg	%xcc,	%f3,	%f23
	fbule,a	%fcc3,	loop_2567
	fmovsge	%icc,	%f7,	%f10
	wr	%g0,	0x19,	%asi
	stda	%i2,	[%l7 + 0x68] %asi
loop_2567:
	fmovscs	%xcc,	%f9,	%f19
	fmovdl	%xcc,	%f10,	%f20
	fba	%fcc3,	loop_2568
	tneg	%xcc,	0x4
	popc	%i3,	%g7
	movn	%icc,	%g4,	%o7
loop_2568:
	fcmpeq16	%f28,	%f24,	%g5
	brz	%l2,	loop_2569
	edge32	%i0,	%l1,	%g3
	fcmple16	%f20,	%f10,	%o0
	alignaddr	%o4,	%o3,	%o2
loop_2569:
	nop
	set	0x2C, %o3
	sta	%f19,	[%l7 + %o3] 0x89
	set	0x71, %i1
	stba	%g6,	[%l7 + %i1] 0x11
	fone	%f4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x46] %asi,	%l0
	set	0x10, %i0
	ldswa	[%l7 + %i0] 0x80,	%i7
	fmovde	%icc,	%f14,	%f20
	udivcc	%o6,	0x1154,	%l4
	or	%o5,	%i1,	%g2
	edge16l	%i6,	%i5,	%l3
	fandnot1	%f12,	%f12,	%f20
	ta	%xcc,	0x3
	fpsub16	%f20,	%f14,	%f4
	smul	%l6,	%o1,	%g1
	movcs	%icc,	%i4,	%l5
	fmovrdgez	%i3,	%f12,	%f14
	smul	%g7,	%i2,	%g4
	bne,pt	%icc,	loop_2570
	udivx	%o7,	0x17CA,	%g5
	bneg	%xcc,	loop_2571
	udiv	%l2,	0x16FB,	%i0
loop_2570:
	mulx	%l1,	%g3,	%o4
	set	0x6C, %i7
	stwa	%o0,	[%l7 + %i7] 0x14
loop_2571:
	movrlz	%o2,	0x399,	%g6
	edge32	%l0,	%i7,	%o6
	be	loop_2572
	fbl,a	%fcc3,	loop_2573
	and	%o3,	%o5,	%l4
	fmovsge	%icc,	%f4,	%f31
loop_2572:
	nop
	set	0x70, %g5
	stxa	%g2,	[%l7 + %g5] 0x2a
	membar	#Sync
loop_2573:
	te	%icc,	0x0
	movrlez	%i6,	0x04C,	%i5
	bge,a	%xcc,	loop_2574
	array8	%l3,	%l6,	%o1
	fcmple32	%f22,	%f8,	%i1
	tl	%icc,	0x5
loop_2574:
	movn	%icc,	%i4,	%g1
	edge8	%i3,	%g7,	%l5
	set	0x1C, %o4
	stha	%i2,	[%l7 + %o4] 0x2b
	membar	#Sync
	fba,a	%fcc2,	loop_2575
	mulx	%o7,	0x13F1,	%g5
	fmovrde	%l2,	%f30,	%f24
	mova	%icc,	%i0,	%g4
loop_2575:
	brgz,a	%l1,	loop_2576
	smulcc	%o4,	%o0,	%g3
	xorcc	%o2,	%l0,	%g6
	mulscc	%i7,	0x1223,	%o6
loop_2576:
	add	%o5,	0x0131,	%o3
	movrlez	%g2,	0x373,	%i6
	tneg	%xcc,	0x1
	addcc	%l4,	%l3,	%l6
	membar	0x66
	ldub	[%l7 + 0x73],	%i5
	be	loop_2577
	sdivcc	%o1,	0x0FFC,	%i1
	fbl,a	%fcc2,	loop_2578
	udivx	%g1,	0x16D8,	%i4
loop_2577:
	sethi	0x1445,	%i3
	movpos	%xcc,	%l5,	%g7
loop_2578:
	addcc	%i2,	0x045E,	%o7
	bne,a	loop_2579
	smulcc	%g5,	%l2,	%g4
	fba	%fcc2,	loop_2580
	srlx	%i0,	%o4,	%l1
loop_2579:
	tl	%xcc,	0x5
	set	0x3A, %g1
	ldstuba	[%l7 + %g1] 0x80,	%g3
loop_2580:
	mulscc	%o0,	0x0DD2,	%o2
	srl	%l0,	%g6,	%o6
	ldsb	[%l7 + 0x67],	%i7
	fbule	%fcc1,	loop_2581
	bpos	%xcc,	loop_2582
	movg	%xcc,	%o5,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2581:
	xnorcc	%g2,	%l4,	%i6
loop_2582:
	srax	%l3,	0x05,	%l6
	movl	%icc,	%o1,	%i5
	fbuge	%fcc1,	loop_2583
	fand	%f30,	%f18,	%f6
	movg	%icc,	%g1,	%i4
	tsubcctv	%i3,	%i1,	%l5
loop_2583:
	nop
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%i2
	fandnot1	%f22,	%f4,	%f26
	movrgez	%g7,	%o7,	%l2
	stb	%g5,	[%l7 + 0x59]
	fcmpd	%fcc3,	%f2,	%f16
	tsubcc	%g4,	%i0,	%l1
	edge8	%g3,	%o4,	%o0
	fmovsleu	%xcc,	%f31,	%f12
	bpos,a	loop_2584
	orncc	%o2,	%l0,	%o6
	fcmps	%fcc1,	%f1,	%f22
	fbue,a	%fcc2,	loop_2585
loop_2584:
	alignaddr	%i7,	%o5,	%g6
	fnot2	%f4,	%f10
	tvs	%icc,	0x1
loop_2585:
	tsubcc	%g2,	0x0CD9,	%l4
	addcc	%i6,	0x0B22,	%o3
	orncc	%l6,	%o1,	%i5
	movge	%xcc,	%l3,	%g1
	flush	%l7 + 0x28
	alignaddr	%i4,	%i1,	%l5
	movl	%icc,	%i2,	%g7
	tge	%xcc,	0x7
	tvc	%icc,	0x0
	edge16l	%o7,	%i3,	%g5
	nop
	setx	loop_2586,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsg	%xcc,	%f4,	%f8
	sllx	%g4,	%i0,	%l1
	fornot1s	%f27,	%f2,	%f0
loop_2586:
	sub	%g3,	0x008F,	%o4
	nop
	setx loop_2587, %l0, %l1
	jmpl %l1, %l2
	bl,pt	%icc,	loop_2588
	bcs,a,pt	%icc,	loop_2589
	fbge	%fcc1,	loop_2590
loop_2587:
	fbge,a	%fcc1,	loop_2591
loop_2588:
	brz,a	%o2,	loop_2592
loop_2589:
	fpadd32	%f24,	%f22,	%f18
loop_2590:
	tvc	%xcc,	0x0
loop_2591:
	movrgz	%l0,	%o6,	%o0
loop_2592:
	tle	%xcc,	0x5
	srlx	%i7,	%o5,	%g2
	andncc	%l4,	%g6,	%i6
	st	%f26,	[%l7 + 0x24]
	movvs	%xcc,	%l6,	%o1
	movn	%icc,	%o3,	%l3
	or	%g1,	0x099F,	%i4
	edge16ln	%i1,	%l5,	%i2
	set	0x48, %l4
	ldxa	[%l7 + %l4] 0x18,	%i5
	edge16n	%o7,	%i3,	%g7
	alignaddr	%g4,	%i0,	%l1
	alignaddr	%g3,	%g5,	%l2
	set	0x10, %i4
	ldda	[%l7 + %i4] 0x15,	%o2
	bg	loop_2593
	movvs	%xcc,	%l0,	%o6
	udiv	%o4,	0x0986,	%i7
	fmovsleu	%xcc,	%f30,	%f26
loop_2593:
	fmovrse	%o5,	%f8,	%f21
	tneg	%xcc,	0x7
	mulscc	%o0,	0x1375,	%l4
	srax	%g2,	0x06,	%i6
	addccc	%l6,	%o1,	%g6
	fandnot2s	%f20,	%f21,	%f6
	tsubcctv	%l3,	%o3,	%g1
	brlz	%i1,	loop_2594
	addcc	%l5,	%i4,	%i5
	tn	%xcc,	0x5
	fbge	%fcc0,	loop_2595
loop_2594:
	umul	%o7,	%i2,	%i3
	fmovs	%f18,	%f28
	fmovspos	%xcc,	%f3,	%f24
loop_2595:
	fmovd	%f8,	%f10
	ldsb	[%l7 + 0x6F],	%g7
	edge8l	%g4,	%i0,	%g3
	movcs	%xcc,	%l1,	%g5
	edge8ln	%l2,	%l0,	%o6
	tg	%xcc,	0x6
	andncc	%o2,	%o4,	%o5
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x24] %asi,	%o0
	movn	%xcc,	%l4,	%g2
	fcmpeq16	%f18,	%f28,	%i6
	bg,a,pt	%icc,	loop_2596
	bshuffle	%f8,	%f18,	%f0
	movne	%icc,	%i7,	%l6
	tvc	%icc,	0x7
loop_2596:
	fmovdcs	%icc,	%f19,	%f30
	orn	%g6,	%o1,	%o3
	fcmpes	%fcc2,	%f1,	%f16
	fbne,a	%fcc3,	loop_2597
	tneg	%xcc,	0x2
	sir	0x178C
	set	0x300, %g7
	nop 	! 	nop 	! 	ldxa	[%g0 + %g7] 0x40,	%g1 ripped by fixASI40.pl ripped by fixASI40.pl
loop_2597:
	fble,a	%fcc2,	loop_2598
	sethi	0x011F,	%l3
	fmovde	%icc,	%f30,	%f23
	edge16ln	%i1,	%l5,	%i4
loop_2598:
	edge8	%i5,	%o7,	%i2
	te	%icc,	0x2
	set	0x40, %l2
	stxa	%i3,	[%l7 + %l2] 0x27
	membar	#Sync
	mova	%xcc,	%g4,	%g7
	set	0x50, %o6
	sta	%f14,	[%l7 + %o6] 0x80
	or	%g3,	0x19E4,	%l1
	edge16l	%i0,	%g5,	%l2
	sra	%l0,	0x06,	%o6
	movg	%icc,	%o4,	%o5
	sra	%o0,	0x11,	%o2
	fmuld8ulx16	%f1,	%f1,	%f2
	brnz,a	%g2,	loop_2599
	movgu	%xcc,	%i6,	%i7
	fpadd32s	%f28,	%f24,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2599:
	mulx	%l4,	0x0275,	%g6
	movrlez	%l6,	%o1,	%g1
	bge,a,pn	%xcc,	loop_2600
	fmovdne	%xcc,	%f7,	%f16
	set	0x15, %g4
	ldstuba	[%l7 + %g4] 0x19,	%o3
loop_2600:
	movvc	%xcc,	%i1,	%l5
	andn	%l3,	%i5,	%i4
	edge32ln	%o7,	%i2,	%g4
	fbue	%fcc0,	loop_2601
	ldd	[%l7 + 0x40],	%f14
	bvc,a,pn	%icc,	loop_2602
	movle	%icc,	%i3,	%g3
loop_2601:
	movgu	%icc,	%g7,	%l1
	andncc	%g5,	%i0,	%l0
loop_2602:
	alignaddrl	%o6,	%l2,	%o4
	umulcc	%o0,	0x07AC,	%o2
	fbg	%fcc0,	loop_2603
	sll	%g2,	0x09,	%o5
	andcc	%i7,	0x1DFC,	%l4
	set	0x60, %i5
	ldda	[%l7 + %i5] 0x81,	%g6
loop_2603:
	edge32n	%i6,	%l6,	%o1
	fpadd32s	%f24,	%f3,	%f13
	fnot2s	%f21,	%f31
	movrlez	%o3,	%i1,	%l5
	fmovdn	%icc,	%f25,	%f10
	udivx	%g1,	0x1FED,	%i5
	fzero	%f2
	edge32	%l3,	%o7,	%i4
	ldstub	[%l7 + 0x0B],	%g4
	fmovsvs	%xcc,	%f21,	%f15
	movl	%icc,	%i3,	%i2
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmuld8sux16	%f27,	%f14,	%f22
	movleu	%xcc,	%g3,	%l1
	fpmerge	%f22,	%f20,	%f14
	bgu	%icc,	loop_2604
	tcs	%icc,	0x1
	tge	%icc,	0x3
	smulcc	%g5,	0x119D,	%g7
loop_2604:
	nop
	set	0x65, %i2
	ldstuba	[%l7 + %i2] 0x89,	%i0
	fornot2	%f8,	%f14,	%f4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x11,	%o6,	%l2
	smulcc	%o4,	0x0A0A,	%l0
	for	%f12,	%f26,	%f20
	st	%f8,	[%l7 + 0x6C]
	tl	%icc,	0x7
	movgu	%xcc,	%o0,	%o2
	movrne	%o5,	0x26F,	%i7
	udiv	%g2,	0x134A,	%l4
	andncc	%g6,	%i6,	%o1
	tsubcc	%l6,	%i1,	%l5
	srl	%g1,	0x03,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f0,	%f23
	fbul	%fcc1,	loop_2605
	smul	%o3,	0x1759,	%l3
	edge16ln	%i4,	%g4,	%i3
	brlez	%i2,	loop_2606
loop_2605:
	fmovsle	%xcc,	%f29,	%f21
	fpadd32s	%f15,	%f18,	%f6
	xnorcc	%o7,	0x1C18,	%l1
loop_2606:
	siam	0x6
	movre	%g3,	%g5,	%i0
	fpadd32	%f18,	%f26,	%f30
	fexpand	%f21,	%f0
	add	%o6,	%g7,	%l2
	movre	%o4,	0x356,	%l0
	movne	%xcc,	%o2,	%o5
	fcmped	%fcc0,	%f16,	%f16
	tne	%xcc,	0x7
	orn	%o0,	0x0F49,	%i7
	ldsw	[%l7 + 0x6C],	%g2
	fbu	%fcc0,	loop_2607
	fpackfix	%f8,	%f19
	smul	%l4,	0x0980,	%g6
	fbg	%fcc3,	loop_2608
loop_2607:
	fpadd16s	%f21,	%f30,	%f19
	add	%i6,	0x03F9,	%l6
	sll	%i1,	0x16,	%o1
loop_2608:
	te	%icc,	0x0
	movle	%icc,	%g1,	%i5
	edge8l	%l5,	%o3,	%l3
	addccc	%i4,	0x10A9,	%g4
	fba	%fcc1,	loop_2609
	xorcc	%i3,	0x124F,	%i2
	edge32l	%l1,	%o7,	%g5
	array16	%g3,	%o6,	%i0
loop_2609:
	nop
	setx	loop_2610,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%xcc,	0x5
	ta	%icc,	0x1
	sdiv	%g7,	0x182F,	%l2
loop_2610:
	fpadd16	%f8,	%f28,	%f0
	faligndata	%f6,	%f18,	%f24
	movne	%icc,	%o4,	%o2
	fbg	%fcc2,	loop_2611
	tg	%xcc,	0x4
	fnot2s	%f4,	%f9
	bgu,a	loop_2612
loop_2611:
	and	%o5,	0x0E65,	%l0
	fbu	%fcc2,	loop_2613
	move	%xcc,	%i7,	%g2
loop_2612:
	tge	%icc,	0x1
	brgez	%o0,	loop_2614
loop_2613:
	fsrc2s	%f13,	%f14
	movne	%xcc,	%g6,	%l4
	array8	%i6,	%l6,	%o1
loop_2614:
	nop
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ba,pn	%icc,	loop_2615
	sllx	%g1,	%i5,	%l5
	fmuld8ulx16	%f26,	%f8,	%f20
	movrne	%i1,	0x25D,	%l3
loop_2615:
	xnor	%o3,	0x0775,	%g4
	tpos	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%i4,	%i3
	std	%f10,	[%l7 + 0x68]
	orncc	%l1,	%i2,	%o7
	tle	%xcc,	0x3
	fbuge	%fcc3,	loop_2616
	movgu	%xcc,	%g3,	%g5
	tg	%icc,	0x2
	fmovda	%xcc,	%f23,	%f14
loop_2616:
	fmul8x16	%f3,	%f28,	%f2
	fmovspos	%icc,	%f28,	%f11
	fone	%f24
	bn,a	loop_2617
	or	%i0,	0x1CC3,	%g7
	movpos	%xcc,	%l2,	%o6
	mulscc	%o4,	%o5,	%o2
loop_2617:
	fcmpne16	%f22,	%f12,	%i7
	udivcc	%g2,	0x1C3E,	%o0
	sll	%g6,	%l4,	%l0
	fmovrsgez	%i6,	%f3,	%f11
	fpmerge	%f23,	%f24,	%f16
	fzero	%f12
	tne	%xcc,	0x3
	bn,a	loop_2618
	bgu,a	loop_2619
	subc	%o1,	0x05DA,	%g1
	array16	%l6,	%i5,	%i1
loop_2618:
	srlx	%l3,	0x1B,	%o3
loop_2619:
	swap	[%l7 + 0x70],	%l5
	edge16l	%g4,	%i3,	%l1
	sdivcc	%i4,	0x1886,	%o7
	siam	0x4
	fcmpne32	%f14,	%f14,	%g3
	brgez	%i2,	loop_2620
	movn	%icc,	%g5,	%i0
	tne	%xcc,	0x4
	udivcc	%l2,	0x11B5,	%o6
loop_2620:
	fmovsa	%xcc,	%f11,	%f0
	movg	%xcc,	%g7,	%o4
	ldx	[%l7 + 0x68],	%o2
	movvc	%xcc,	%i7,	%g2
	ldsh	[%l7 + 0x28],	%o0
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x24] %asi,	%g6
	tcc	%icc,	0x3
	xnorcc	%o5,	%l4,	%i6
	umul	%o1,	0x1C9A,	%l0
	te	%icc,	0x1
	alignaddr	%g1,	%l6,	%i1
	and	%i5,	%l3,	%o3
	fandnot2s	%f31,	%f10,	%f15
	fbge,a	%fcc1,	loop_2621
	orn	%g4,	%l5,	%l1
	andncc	%i4,	%i3,	%g3
	taddcctv	%o7,	0x0707,	%i2
loop_2621:
	tneg	%xcc,	0x1
	movcc	%xcc,	%i0,	%g5
	srlx	%o6,	%l2,	%g7
	fmovs	%f26,	%f3
	smulcc	%o2,	%i7,	%g2
	stx	%o0,	[%l7 + 0x40]
	set	0x08, %l0
	ldxa	[%l7 + %l0] 0x80,	%g6
	brlz	%o4,	loop_2622
	sdivx	%l4,	0x0599,	%o5
	subccc	%i6,	0x11BC,	%l0
	fandnot1s	%f31,	%f23,	%f12
loop_2622:
	tgu	%icc,	0x6
	tneg	%xcc,	0x5
	fnegd	%f14,	%f2
	fmovdcs	%xcc,	%f22,	%f17
	nop
	setx	loop_2623,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8n	%o1,	%l6,	%g1
	alignaddrl	%i1,	%i5,	%o3
	movre	%g4,	0x30E,	%l3
loop_2623:
	nop
	set	0x38, %l5
	stda	%l0,	[%l7 + %l5] 0x0c
	fmovde	%xcc,	%f5,	%f19
	movneg	%icc,	%i4,	%i3
	set	0x2F, %l1
	lduba	[%l7 + %l1] 0x04,	%l5
	tcc	%xcc,	0x2
	fpsub16s	%f28,	%f18,	%f24
	movneg	%xcc,	%g3,	%i2
	fnot2	%f18,	%f4
	popc	%o7,	%i0
	bpos	loop_2624
	mulx	%o6,	0x1CB1,	%l2
	fandnot2s	%f31,	%f27,	%f15
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x15
loop_2624:
	movrlez	%g5,	%g7,	%o2
	fpadd16s	%f19,	%f28,	%f10
	fba,a	%fcc0,	loop_2625
	fbg,a	%fcc1,	loop_2626
	bn,a,pt	%xcc,	loop_2627
	movpos	%xcc,	%i7,	%g2
loop_2625:
	edge16l	%o0,	%g6,	%o4
loop_2626:
	fornot1s	%f0,	%f12,	%f25
loop_2627:
	mulscc	%l4,	%i6,	%l0
	edge32ln	%o5,	%l6,	%g1
	tsubcc	%i1,	%i5,	%o3
	tleu	%icc,	0x7
	fbu	%fcc0,	loop_2628
	sub	%o1,	0x029A,	%l3
	andn	%g4,	0x0113,	%i4
	tsubcc	%i3,	%l5,	%g3
loop_2628:
	smulcc	%l1,	0x0B33,	%i2
	add	%i0,	%o6,	%l2
	bn,pn	%xcc,	loop_2629
	xnor	%g5,	%o7,	%g7
	fmovdge	%icc,	%f16,	%f17
	sdiv	%i7,	0x09E1,	%o2
loop_2629:
	tsubcc	%o0,	%g2,	%g6
	fmul8sux16	%f6,	%f26,	%f6
	brlz,a	%l4,	loop_2630
	bvc,a,pt	%icc,	loop_2631
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o4,	0x17,	%i6
loop_2630:
	bshuffle	%f24,	%f18,	%f26
loop_2631:
	tsubcctv	%l0,	0x14F5,	%l6
	addccc	%o5,	%i1,	%g1
	te	%xcc,	0x5
	subccc	%o3,	0x1CD9,	%i5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%o1,	%l3
	srax	%g4,	0x1F,	%i3
	prefetch	[%l7 + 0x30],	 0x1
	fmovdg	%xcc,	%f20,	%f28
	mova	%icc,	%l5,	%i4
	edge8	%l1,	%i2,	%g3
	fmul8ulx16	%f20,	%f6,	%f30
	tvs	%xcc,	0x5
	bshuffle	%f12,	%f20,	%f26
	xnorcc	%i0,	%l2,	%g5
	fmovde	%icc,	%f26,	%f21
	ba,a,pn	%icc,	loop_2632
	fnot2	%f26,	%f6
	movle	%xcc,	%o7,	%o6
	fmovdleu	%icc,	%f22,	%f6
loop_2632:
	edge16n	%g7,	%o2,	%o0
	nop
	set	0x30, %o7
	std	%f12,	[%l7 + %o7]
	edge8n	%i7,	%g6,	%g2
	addcc	%o4,	0x17FD,	%l4
	smulcc	%l0,	%l6,	%o5
	tn	%icc,	0x0
	fmuld8sux16	%f13,	%f8,	%f16
	umulcc	%i6,	%g1,	%o3
	fmovsleu	%xcc,	%f22,	%f0
	smul	%i1,	0x1E44,	%i5
	fmovrsne	%l3,	%f28,	%f15
	xorcc	%g4,	%o1,	%l5
	brnz,a	%i3,	loop_2633
	movge	%xcc,	%l1,	%i4
	sll	%g3,	0x00,	%i2
	fmovrdgz	%l2,	%f6,	%f4
loop_2633:
	movn	%xcc,	%g5,	%o7
	fabsd	%f16,	%f26
	movle	%icc,	%o6,	%g7
	fxnors	%f25,	%f25,	%f1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o2,	%o0
	tvc	%icc,	0x4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%i7
	smul	%g2,	0x1A4A,	%o4
	fmovs	%f30,	%f15
	fxors	%f10,	%f17,	%f31
	edge32l	%g6,	%l4,	%l0
	andncc	%o5,	%l6,	%i6
	tsubcctv	%g1,	0x1EBC,	%i1
	array32	%i5,	%o3,	%g4
	movrgz	%o1,	%l3,	%i3
	faligndata	%f26,	%f0,	%f8
	edge32l	%l1,	%l5,	%i4
	alignaddrl	%g3,	%l2,	%i2
	movl	%icc,	%g5,	%o7
	fbue,a	%fcc1,	loop_2634
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a,pt	%xcc,	loop_2635
	ldx	[%l7 + 0x10],	%g7
loop_2634:
	movne	%icc,	%o6,	%o0
	fmovsvs	%xcc,	%f17,	%f29
loop_2635:
	movn	%xcc,	%o2,	%i0
	fors	%f6,	%f8,	%f9
	fpsub32s	%f15,	%f0,	%f26
	movl	%xcc,	%g2,	%i7
	brgz	%g6,	loop_2636
	add	%o4,	0x1AB8,	%l0
	movrgz	%l4,	0x1C4,	%l6
	fbule,a	%fcc0,	loop_2637
loop_2636:
	stx	%o5,	[%l7 + 0x50]
	fmul8x16al	%f24,	%f7,	%f20
	movre	%i6,	%i1,	%i5
loop_2637:
	movle	%xcc,	%g1,	%g4
	tge	%icc,	0x4
	xor	%o1,	0x0A09,	%l3
	fmovsgu	%xcc,	%f12,	%f14
	fandnot1	%f30,	%f14,	%f2
	movrgz	%i3,	%l1,	%l5
	srlx	%o3,	%g3,	%l2
	fpack32	%f16,	%f6,	%f12
	move	%xcc,	%i2,	%i4
	fmovdcc	%xcc,	%f20,	%f16
	fpsub32s	%f1,	%f14,	%f14
	edge32	%g5,	%o7,	%g7
	edge16ln	%o6,	%o2,	%o0
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x46] %asi,	%g2
	fmovscc	%icc,	%f31,	%f23
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x44] %asi,	%i0
	smulcc	%i7,	%o4,	%g6
	fmovdcc	%xcc,	%f27,	%f21
	fmovdne	%xcc,	%f15,	%f20
	udivx	%l0,	0x0D62,	%l4
	fandnot2	%f6,	%f8,	%f4
	fba	%fcc1,	loop_2638
	edge16n	%l6,	%i6,	%i1
	fmovde	%xcc,	%f17,	%f8
	sub	%i5,	%g1,	%g4
loop_2638:
	movrgez	%o1,	0x393,	%o5
	fba	%fcc1,	loop_2639
	lduw	[%l7 + 0x20],	%l3
	tge	%xcc,	0x3
	srl	%l1,	%i3,	%l5
loop_2639:
	tvs	%xcc,	0x1
	edge8l	%o3,	%l2,	%i2
	orncc	%g3,	%i4,	%g5
	andncc	%o7,	%o6,	%g7
	movne	%icc,	%o0,	%o2
	udiv	%g2,	0x0E63,	%i7
	bne,a,pn	%icc,	loop_2640
	fmuld8sux16	%f0,	%f18,	%f28
	andn	%i0,	%g6,	%l0
	and	%o4,	%l4,	%l6
loop_2640:
	tneg	%icc,	0x2
	addccc	%i1,	%i6,	%g1
	mulscc	%g4,	0x10A6,	%i5
	tpos	%icc,	0x1
	tne	%xcc,	0x5
	array16	%o1,	%l3,	%l1
	srlx	%i3,	0x0B,	%o5
	fmovrde	%l5,	%f0,	%f24
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
	sth	%i2,	[%l7 + 0x5C]
	ld	[%l7 + 0x7C],	%f25
	udivx	%o3,	0x001F,	%g3
	edge8	%i4,	%g5,	%o6
	membar	0x3A
	fbug,a	%fcc1,	loop_2641
	movge	%icc,	%o7,	%g7
	srl	%o2,	0x19,	%g2
	popc	%i7,	%i0
loop_2641:
	movcc	%xcc,	%g6,	%l0
	tgu	%xcc,	0x1
	mulx	%o4,	0x02A2,	%o0
	edge32	%l6,	%l4,	%i1
	udivcc	%g1,	0x19F4,	%g4
	fsrc2	%f16,	%f18
	tne	%icc,	0x0
	edge8	%i6,	%o1,	%i5
	stw	%l3,	[%l7 + 0x38]
	fmovs	%f3,	%f2
	subc	%l1,	0x15D4,	%o5
	movg	%xcc,	%l5,	%i3
	fmovdleu	%icc,	%f0,	%f19
	wr	%g0,	0x89,	%asi
	stba	%i2,	[%l7 + 0x72] %asi
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x04
	flush	%l7 + 0x6C
	tsubcctv	%o3,	0x129E,	%l2
	wr	%g0,	0xe3,	%asi
	stwa	%i4,	[%l7 + 0x1C] %asi
	membar	#Sync
	fpmerge	%f30,	%f4,	%f8
	fcmpes	%fcc0,	%f21,	%f19
	subccc	%g5,	0x1F86,	%g3
	fbn	%fcc1,	loop_2642
	sllx	%o6,	%g7,	%o2
	umul	%g2,	%o7,	%i0
	stx	%g6,	[%l7 + 0x28]
loop_2642:
	nop
	set	0x6E, %i6
	ldsha	[%l7 + %i6] 0x11,	%i7
	xor	%o4,	%l0,	%l6
	add	%o0,	0x00F0,	%i1
	sdiv	%g1,	0x1FD1,	%g4
	fones	%f7
	movneg	%xcc,	%i6,	%l4
	tsubcctv	%o1,	0x182D,	%l3
	sub	%i5,	%l1,	%o5
	array16	%i3,	%l5,	%i2
	movge	%icc,	%l2,	%o3
	movrgez	%i4,	0x2A4,	%g5
	udiv	%g3,	0x0D44,	%o6
	siam	0x6
	tgu	%xcc,	0x0
	udivx	%g7,	0x13A3,	%g2
	movvc	%xcc,	%o2,	%o7
	ta	%xcc,	0x1
	fcmpes	%fcc1,	%f8,	%f6
	wr	%g0,	0x2a,	%asi
	stxa	%i0,	[%l7 + 0x78] %asi
	membar	#Sync
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%i7
	call	loop_2643
	sllx	%o4,	%g6,	%l0
	subccc	%l6,	0x10AB,	%o0
	tle	%xcc,	0x6
loop_2643:
	tgu	%icc,	0x7
	addccc	%g1,	%g4,	%i1
	fbo,a	%fcc3,	loop_2644
	bgu,a,pt	%xcc,	loop_2645
	tvc	%xcc,	0x6
	xnor	%i6,	%l4,	%o1
loop_2644:
	movrgez	%i5,	0x2E0,	%l3
loop_2645:
	nop
	set	0x24, %o1
	lduwa	[%l7 + %o1] 0x11,	%l1
	or	%i3,	0x0D7A,	%o5
	edge16n	%i2,	%l2,	%l5
	fmovspos	%xcc,	%f24,	%f21
	set	0x60, %l3
	lda	[%l7 + %l3] 0x19,	%f9
	fpmerge	%f0,	%f7,	%f30
	tsubcctv	%i4,	%g5,	%o3
	ldsw	[%l7 + 0x3C],	%o6
	sllx	%g3,	0x15,	%g2
	sdivcc	%o2,	0x05E7,	%g7
	and	%o7,	%i7,	%i0
	addc	%o4,	0x03FF,	%g6
	xor	%l6,	%o0,	%l0
	fmovsl	%icc,	%f0,	%f7
	sll	%g4,	%i1,	%i6
	wr	%g0,	0xe3,	%asi
	stba	%g1,	[%l7 + 0x09] %asi
	membar	#Sync
	fbu	%fcc0,	loop_2646
	xnor	%l4,	0x1949,	%i5
	movn	%icc,	%l3,	%o1
	fbule	%fcc3,	loop_2647
loop_2646:
	fbule	%fcc0,	loop_2648
	bne,a	%icc,	loop_2649
	fmovrdne	%l1,	%f10,	%f4
loop_2647:
	subccc	%o5,	%i3,	%i2
loop_2648:
	edge16ln	%l2,	%i4,	%g5
loop_2649:
	srax	%l5,	0x10,	%o3
	fmovdcs	%icc,	%f24,	%f30
	fmovdcs	%icc,	%f0,	%f25
	tg	%xcc,	0x4
	set	0x70, %o0
	ldda	[%l7 + %o0] 0x15,	%g2
	fmovscc	%xcc,	%f20,	%f29
	array8	%o6,	%g2,	%g7
	tpos	%icc,	0x1
	array32	%o2,	%o7,	%i7
	brnz	%i0,	loop_2650
	tpos	%icc,	0x6
	brz	%o4,	loop_2651
	fba	%fcc2,	loop_2652
loop_2650:
	orn	%g6,	0x0771,	%o0
	movvs	%icc,	%l6,	%g4
loop_2651:
	srl	%i1,	0x1F,	%i6
loop_2652:
	fsrc1s	%f24,	%f10
	movvs	%icc,	%g1,	%l0
	sll	%i5,	0x1A,	%l3
	andn	%l4,	0x0223,	%o1
	tne	%xcc,	0x0
	movrne	%o5,	0x2EF,	%l1
	andncc	%i3,	%l2,	%i4
	fsrc2s	%f20,	%f21
	fbu,a	%fcc1,	loop_2653
	sth	%g5,	[%l7 + 0x6E]
	ldsb	[%l7 + 0x72],	%l5
	stb	%i2,	[%l7 + 0x11]
loop_2653:
	tge	%xcc,	0x1
	alignaddrl	%g3,	%o6,	%o3
	movle	%icc,	%g7,	%g2
	std	%o2,	[%l7 + 0x38]
	fcmpd	%fcc0,	%f16,	%f4
	taddcc	%o7,	%i7,	%i0
	fmovrsne	%o4,	%f9,	%f10
	movn	%icc,	%o0,	%g6
	subccc	%g4,	%l6,	%i1
	fmuld8ulx16	%f15,	%f2,	%f30
	fnot2s	%f11,	%f30
	tsubcc	%g1,	0x0572,	%i6
	edge16n	%l0,	%i5,	%l4
	fcmpgt16	%f22,	%f0,	%l3
	fnors	%f15,	%f0,	%f19
	nop
	setx	loop_2654,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sethi	0x0D33,	%o5
	fbe	%fcc0,	loop_2655
	movvc	%icc,	%l1,	%i3
loop_2654:
	array16	%o1,	%l2,	%g5
	movrgz	%l5,	0x1A3,	%i2
loop_2655:
	bcs,a	%xcc,	loop_2656
	brz	%i4,	loop_2657
	fbl,a	%fcc3,	loop_2658
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2656:
	fxor	%f18,	%f16,	%f4
loop_2657:
	array16	%g3,	%o6,	%g7
loop_2658:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%o3
	fzero	%f14
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x20] %asi,	%g2
	fbue	%fcc0,	loop_2659
	andn	%o2,	0x13A6,	%o7
	fmul8ulx16	%f20,	%f18,	%f20
	srl	%i0,	0x09,	%o4
loop_2659:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne	%fcc1,	loop_2660
	fmovdle	%icc,	%f13,	%f23
	addcc	%i7,	0x1886,	%g6
	stb	%o0,	[%l7 + 0x5E]
loop_2660:
	fsrc2	%f28,	%f16
	umul	%l6,	0x0EB8,	%i1
	xor	%g4,	0x0569,	%i6
	tgu	%xcc,	0x4
	mulscc	%g1,	0x16A4,	%i5
	fxnor	%f28,	%f20,	%f12
	wr	%g0,	0x88,	%asi
	stba	%l0,	[%l7 + 0x37] %asi
	mulscc	%l3,	%o5,	%l4
	tcc	%icc,	0x7
	fcmpeq16	%f6,	%f18,	%l1
	fmovsneg	%icc,	%f11,	%f3
	movrgez	%o1,	0x30B,	%l2
	tg	%icc,	0x4
	tvc	%xcc,	0x7
	udiv	%g5,	0x1266,	%i3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%l5
	brgez	%i2,	loop_2661
	fmovrslez	%g3,	%f26,	%f26
	fba	%fcc3,	loop_2662
	fmovscc	%xcc,	%f19,	%f9
loop_2661:
	movge	%xcc,	%i4,	%g7
	subccc	%o3,	0x0C78,	%g2
loop_2662:
	edge16n	%o6,	%o7,	%i0
	fmovrdgez	%o2,	%f8,	%f4
	call	loop_2663
	bleu,a	loop_2664
	sub	%i7,	0x0317,	%g6
	fbu	%fcc1,	loop_2665
loop_2663:
	mulscc	%o0,	%o4,	%i1
loop_2664:
	ldstub	[%l7 + 0x75],	%g4
	fmovsg	%xcc,	%f19,	%f6
loop_2665:
	add	%l6,	%i6,	%g1
	edge16l	%l0,	%i5,	%o5
	movrgez	%l3,	0x0D2,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l4,	%o1
	set	0x60, %i3
	stwa	%g5,	[%l7 + %i3] 0x2b
	membar	#Sync
	membar	0x1A
	fblg,a	%fcc2,	loop_2666
	xnorcc	%i3,	%l2,	%i2
	orncc	%l5,	%i4,	%g3
	stx	%g7,	[%l7 + 0x10]
loop_2666:
	movrgez	%g2,	0x03C,	%o6
	set	0x08, %o5
	lduba	[%l7 + %o5] 0x0c,	%o7
	wr	%g0,	0x88,	%asi
	stba	%o3,	[%l7 + 0x35] %asi
	sra	%i0,	0x17,	%o2
	umul	%i7,	%g6,	%o0
	ble,a	%xcc,	loop_2667
	fmovrsgez	%o4,	%f22,	%f15
	edge8ln	%i1,	%g4,	%i6
	movleu	%xcc,	%g1,	%l0
loop_2667:
	nop
	set	0x10, %g2
	ldsba	[%l7 + %g2] 0x19,	%l6
	addccc	%o5,	%i5,	%l3
	wr	%g0,	0x0c,	%asi
	stda	%l4,	[%l7 + 0x18] %asi
	andncc	%o1,	%l1,	%i3
	fmovsvs	%icc,	%f26,	%f22
	fnot2	%f12,	%f28
	fabss	%f14,	%f3
	fmul8x16	%f2,	%f20,	%f2
	movleu	%icc,	%g5,	%l2
	fmovsvs	%xcc,	%f8,	%f15
	fbn,a	%fcc1,	loop_2668
	alignaddr	%l5,	%i2,	%g3
	bl,pt	%icc,	loop_2669
	addc	%i4,	%g7,	%g2
loop_2668:
	xor	%o6,	%o3,	%o7
	fcmpd	%fcc2,	%f16,	%f18
loop_2669:
	fmovsle	%icc,	%f22,	%f30
	tn	%xcc,	0x1
	movgu	%xcc,	%o2,	%i7
	sdivcc	%i0,	0x1100,	%g6
	movcs	%icc,	%o0,	%o4
	sdivx	%g4,	0x0F57,	%i6
	sdivcc	%g1,	0x0338,	%i1
	edge16ln	%l0,	%l6,	%o5
	orcc	%i5,	0x17F7,	%l4
	bvs,pn	%xcc,	loop_2670
	fone	%f14
	set	0x28, %g3
	lduwa	[%l7 + %g3] 0x10,	%o1
loop_2670:
	bne,a,pn	%icc,	loop_2671
	popc	%l1,	%l3
	srlx	%g5,	%i3,	%l2
	movleu	%xcc,	%l5,	%g3
loop_2671:
	nop
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x11,	%f16
	andcc	%i2,	%g7,	%i4
	bcc,a,pn	%xcc,	loop_2672
	fmovsn	%icc,	%f17,	%f12
	fbge	%fcc2,	loop_2673
	addcc	%g2,	%o3,	%o7
loop_2672:
	nop
	wr	%g0,	0x19,	%asi
	stba	%o2,	[%l7 + 0x68] %asi
loop_2673:
	xor	%i7,	0x1FBF,	%o6
	stw	%i0,	[%l7 + 0x70]
	add	%g6,	%o0,	%g4
	bg,a	loop_2674
	edge32	%i6,	%o4,	%g1
	movg	%xcc,	%i1,	%l0
	sllx	%o5,	0x0D,	%l6
loop_2674:
	fbuge	%fcc1,	loop_2675
	orcc	%i5,	0x0EFF,	%o1
	orcc	%l4,	%l1,	%l3
	brz	%i3,	loop_2676
loop_2675:
	fbue	%fcc3,	loop_2677
	fmovsne	%xcc,	%f8,	%f21
	fblg	%fcc3,	loop_2678
loop_2676:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2677:
	membar	0x68
	movrlez	%g5,	0x20B,	%l5
loop_2678:
	tvc	%xcc,	0x1
	edge16l	%g3,	%l2,	%g7
	fbug	%fcc0,	loop_2679
	edge16ln	%i4,	%i2,	%g2
	fmovscc	%icc,	%f4,	%f3
	fabss	%f13,	%f7
loop_2679:
	movrlz	%o3,	0x08A,	%o2
	nop
	setx	loop_2680,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%xcc,	%o7,	%o6
	edge16	%i0,	%i7,	%g6
	siam	0x0
loop_2680:
	ldub	[%l7 + 0x52],	%g4
	popc	%i6,	%o4
	fcmpeq16	%f8,	%f18,	%g1
	array16	%i1,	%l0,	%o0
	ldd	[%l7 + 0x20],	%o4
	taddcc	%l6,	0x03B9,	%o1
	tle	%xcc,	0x2
	orcc	%l4,	%i5,	%l3
	sethi	0x11F5,	%i3
	subcc	%g5,	0x1ED5,	%l1
	fandnot1	%f12,	%f10,	%f16
	tcs	%icc,	0x7
	tle	%xcc,	0x1
	xor	%l5,	0x026F,	%l2
	subc	%g3,	0x0561,	%i4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x18,	%g7,	%g2
	tleu	%xcc,	0x0
	mulscc	%i2,	0x0C29,	%o3
	fbl	%fcc0,	loop_2681
	fpadd32s	%f7,	%f22,	%f24
	sdivcc	%o7,	0x113D,	%o6
	set	0x4A, %o3
	stha	%o2,	[%l7 + %o3] 0xeb
	membar	#Sync
loop_2681:
	mulscc	%i0,	%g6,	%i7
	srl	%g4,	%o4,	%g1
	fcmpeq16	%f4,	%f20,	%i6
	ble	loop_2682
	fpsub32s	%f0,	%f30,	%f11
	fmovsne	%xcc,	%f27,	%f29
	popc	0x0C59,	%l0
loop_2682:
	fmovsle	%icc,	%f28,	%f3
	nop
	set	0x40, %i1
	std	%f16,	[%l7 + %i1]
	fmovsgu	%icc,	%f21,	%f0
	edge8n	%i1,	%o5,	%l6
	tle	%icc,	0x3
	edge32l	%o0,	%l4,	%o1
	ta	%xcc,	0x1
	fpack32	%f2,	%f6,	%f4
	popc	0x0FD6,	%l3
	mulx	%i3,	0x0F59,	%g5
	fmovdvc	%xcc,	%f2,	%f2
	orcc	%l1,	%i5,	%l2
	fmovda	%xcc,	%f4,	%f23
	umulcc	%g3,	0x014B,	%l5
	fba,a	%fcc2,	loop_2683
	fmovsn	%xcc,	%f20,	%f10
	array16	%i4,	%g2,	%i2
	and	%o3,	%g7,	%o6
loop_2683:
	move	%xcc,	%o2,	%o7
	siam	0x6
	set	0x54, %i0
	ldsha	[%l7 + %i0] 0x15,	%i0
	bshuffle	%f26,	%f24,	%f4
	movcc	%icc,	%i7,	%g4
	edge32	%g6,	%o4,	%g1
	movge	%xcc,	%i6,	%l0
	fmul8x16au	%f24,	%f23,	%f18
	sdivx	%i1,	0x031B,	%o5
	edge16n	%l6,	%o0,	%l4
	fmuld8sux16	%f24,	%f25,	%f6
	srax	%o1,	0x11,	%i3
	set	0x2D, %g5
	ldsba	[%l7 + %g5] 0x18,	%l3
	fmovsvc	%icc,	%f4,	%f17
	and	%l1,	%i5,	%g5
	fabsd	%f30,	%f12
	movvs	%xcc,	%l2,	%l5
	udiv	%i4,	0x1D0C,	%g3
	ldd	[%l7 + 0x18],	%f28
	smulcc	%i2,	0x1FE4,	%g2
	movn	%xcc,	%o3,	%g7
	edge8ln	%o2,	%o6,	%i0
	fones	%f12
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movvc	%icc,	%o7,	%g4
	fpadd32s	%f2,	%f23,	%f24
	be	%xcc,	loop_2684
	alignaddrl	%i7,	%g6,	%g1
	fmovsge	%icc,	%f11,	%f11
	movre	%o4,	%i6,	%i1
loop_2684:
	fmovsn	%icc,	%f11,	%f17
	andcc	%o5,	0x0E0B,	%l0
	move	%xcc,	%l6,	%l4
	edge32	%o1,	%i3,	%l3
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x7C] %asi,	%o0
	mulscc	%i5,	0x06B6,	%l1
	tcs	%icc,	0x3
	edge32n	%l2,	%l5,	%i4
	tvs	%icc,	0x4
	edge32ln	%g5,	%i2,	%g2
	andn	%g3,	0x1AE4,	%g7
	fbe	%fcc0,	loop_2685
	movrlez	%o3,	0x207,	%o2
	movrlz	%o6,	%i0,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2685:
	nop
	setx	loop_2686,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%g4,	%g6,	%g1
	tcs	%icc,	0x2
	move	%icc,	%o4,	%i6
loop_2686:
	umulcc	%i1,	%o5,	%i7
	sethi	0x1A75,	%l0
	fmovdcc	%xcc,	%f15,	%f15
	tleu	%xcc,	0x2
	set	0x32, %i7
	ldsha	[%l7 + %i7] 0x81,	%l6
	bshuffle	%f28,	%f28,	%f28
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x2B] %asi,	%l4
	fcmpgt32	%f0,	%f26,	%i3
	be,pn	%xcc,	loop_2687
	fbuge,a	%fcc0,	loop_2688
	edge32	%o1,	%l3,	%i5
	movre	%l1,	0x195,	%o0
loop_2687:
	fcmpd	%fcc2,	%f20,	%f22
loop_2688:
	fones	%f13
	andcc	%l5,	%l2,	%g5
	mulx	%i2,	0x1411,	%i4
	tneg	%xcc,	0x2
	srax	%g2,	%g7,	%g3
	tne	%xcc,	0x2
	srlx	%o2,	%o3,	%i0
	mova	%icc,	%o7,	%g4
	array8	%g6,	%g1,	%o4
	ldx	[%l7 + 0x48],	%i6
	fbne,a	%fcc3,	loop_2689
	tle	%xcc,	0x6
	fmuld8ulx16	%f13,	%f26,	%f14
	ble,pn	%icc,	loop_2690
loop_2689:
	call	loop_2691
	edge32	%i1,	%o6,	%o5
	fnegs	%f4,	%f8
loop_2690:
	fbe,a	%fcc0,	loop_2692
loop_2691:
	fsrc2s	%f11,	%f19
	addccc	%l0,	%l6,	%i7
	taddcctv	%l4,	0x0669,	%o1
loop_2692:
	fmovsn	%xcc,	%f20,	%f29
	set	0x58, %g1
	swapa	[%l7 + %g1] 0x81,	%i3
	smul	%l3,	%i5,	%l1
	sub	%l5,	%l2,	%g5
	or	%o0,	%i4,	%g2
	fpadd16s	%f22,	%f17,	%f21
	fmul8ulx16	%f2,	%f8,	%f4
	ldd	[%l7 + 0x40],	%f8
	tl	%xcc,	0x7
	std	%i2,	[%l7 + 0x40]
	fble,a	%fcc2,	loop_2693
	fbne,a	%fcc2,	loop_2694
	fmovsleu	%xcc,	%f31,	%f21
	fbule,a	%fcc3,	loop_2695
loop_2693:
	edge16l	%g3,	%g7,	%o3
loop_2694:
	tsubcc	%o2,	%i0,	%o7
	fmovdl	%xcc,	%f0,	%f16
loop_2695:
	fmovs	%f28,	%f28
	set	0x10, %l4
	stda	%g6,	[%l7 + %l4] 0x10
	fmovsgu	%xcc,	%f25,	%f14
	fmovsa	%xcc,	%f27,	%f28
	fmovsge	%xcc,	%f9,	%f2
	bge	loop_2696
	sir	0x15E1
	brgz,a	%g1,	loop_2697
	edge32l	%g4,	%i6,	%i1
loop_2696:
	fcmpeq16	%f10,	%f4,	%o6
	xor	%o4,	0x046D,	%l0
loop_2697:
	fmovrsgz	%l6,	%f9,	%f3
	fbul,a	%fcc1,	loop_2698
	bge	%icc,	loop_2699
	fpackfix	%f22,	%f27
	ldsw	[%l7 + 0x44],	%o5
loop_2698:
	movrne	%i7,	0x048,	%l4
loop_2699:
	bvc,a	loop_2700
	faligndata	%f6,	%f30,	%f18
	fcmps	%fcc2,	%f17,	%f14
	sdivx	%o1,	0x1907,	%i3
loop_2700:
	fmuld8ulx16	%f18,	%f15,	%f14
	alignaddrl	%i5,	%l1,	%l5
	bl,a	%xcc,	loop_2701
	fmovda	%icc,	%f16,	%f28
	call	loop_2702
	tneg	%icc,	0x5
loop_2701:
	fbn,a	%fcc2,	loop_2703
	tpos	%xcc,	0x5
loop_2702:
	movcs	%icc,	%l2,	%g5
	edge8	%o0,	%l3,	%i4
loop_2703:
	fbug	%fcc2,	loop_2704
	sub	%g2,	0x1D75,	%g3
	tg	%icc,	0x5
	and	%i2,	%g7,	%o3
loop_2704:
	nop
	wr	%g0,	0x81,	%asi
	sta	%f28,	[%l7 + 0x3C] %asi
	fnot2s	%f19,	%f15
	edge16l	%i0,	%o2,	%g6
	fsrc1s	%f15,	%f27
	set	0x0C, %o4
	sta	%f30,	[%l7 + %o4] 0x80
	brgz	%o7,	loop_2705
	fmovrsne	%g1,	%f8,	%f3
	fmovrslz	%i6,	%f4,	%f14
	orncc	%g4,	%o6,	%i1
loop_2705:
	srax	%l0,	0x03,	%l6
	fpack32	%f16,	%f20,	%f30
	fornot2s	%f24,	%f6,	%f17
	fsrc2s	%f22,	%f29
	set	0x68, %g7
	lduwa	[%l7 + %g7] 0x10,	%o4
	edge8n	%o5,	%l4,	%o1
	addcc	%i7,	%i3,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f26,	%f22,	%f16
	movrne	%i5,	0x023,	%l5
	edge16n	%l2,	%o0,	%l3
	tgu	%xcc,	0x0
	udivcc	%g5,	0x1F89,	%g2
	alignaddr	%g3,	%i2,	%i4
	orn	%g7,	%i0,	%o2
	array32	%o3,	%g6,	%g1
	sub	%o7,	0x034D,	%g4
	xnor	%i6,	0x1852,	%i1
	ldsb	[%l7 + 0x67],	%l0
	movvs	%icc,	%l6,	%o4
	sir	0x0AF1
	movcc	%xcc,	%o5,	%l4
	brlez	%o6,	loop_2706
	fbl,a	%fcc3,	loop_2707
	stw	%i7,	[%l7 + 0x10]
	movre	%i3,	%o1,	%l1
loop_2706:
	tleu	%icc,	0x6
loop_2707:
	fmovrsgez	%i5,	%f8,	%f0
	sdiv	%l5,	0x03AA,	%o0
	tvc	%xcc,	0x2
	fmovdcc	%icc,	%f16,	%f17
	bcs,a,pn	%icc,	loop_2708
	fble,a	%fcc3,	loop_2709
	edge32l	%l3,	%g5,	%l2
	and	%g2,	%i2,	%g3
loop_2708:
	tcc	%icc,	0x3
loop_2709:
	bg,a	loop_2710
	ba	loop_2711
	sra	%i4,	0x1F,	%i0
	movl	%icc,	%g7,	%o2
loop_2710:
	nop
	set	0x18, %l2
	lduw	[%l7 + %l2],	%g6
loop_2711:
	edge32l	%g1,	%o7,	%o3
	fmul8sux16	%f30,	%f14,	%f18
	movvc	%xcc,	%i6,	%g4
	bvs,a,pn	%icc,	loop_2712
	fmovrslez	%l0,	%f22,	%f9
	tvs	%xcc,	0x2
	fblg	%fcc3,	loop_2713
loop_2712:
	fnor	%f6,	%f16,	%f2
	fcmpne16	%f10,	%f6,	%i1
	fmovda	%icc,	%f28,	%f31
loop_2713:
	edge16n	%o4,	%l6,	%l4
	movrne	%o5,	0x227,	%i7
	addcc	%o6,	%o1,	%l1
	movg	%icc,	%i3,	%l5
	fmul8x16al	%f6,	%f2,	%f12
	movpos	%icc,	%o0,	%i5
	stbar
	te	%icc,	0x4
	tvs	%icc,	0x7
	subcc	%l3,	0x130E,	%l2
	mulscc	%g5,	%i2,	%g3
	ble	%xcc,	loop_2714
	tge	%icc,	0x7
	tleu	%icc,	0x1
	set	0x50, %o6
	prefetcha	[%l7 + %o6] 0x89,	 0x3
loop_2714:
	movrlez	%i0,	0x01B,	%g7
	fba	%fcc3,	loop_2715
	fbule,a	%fcc3,	loop_2716
	edge8l	%g2,	%g6,	%o2
	fabsd	%f0,	%f0
loop_2715:
	subc	%g1,	%o7,	%o3
loop_2716:
	movre	%i6,	0x302,	%l0
	edge16l	%g4,	%o4,	%l6
	ta	%xcc,	0x2
	brlz	%l4,	loop_2717
	movl	%xcc,	%o5,	%i1
	fcmpes	%fcc0,	%f4,	%f26
	fmovsl	%xcc,	%f18,	%f25
loop_2717:
	fbg	%fcc0,	loop_2718
	std	%f18,	[%l7 + 0x10]
	membar	0x4B
	orn	%o6,	%i7,	%l1
loop_2718:
	flush	%l7 + 0x4C
	bge,pn	%icc,	loop_2719
	fmovscs	%icc,	%f1,	%f30
	fmovscc	%icc,	%f2,	%f13
	movre	%i3,	%o1,	%l5
loop_2719:
	taddcc	%i5,	%l3,	%l2
	tpos	%icc,	0x0
	tpos	%xcc,	0x4
	fbo	%fcc3,	loop_2720
	umulcc	%o0,	0x1926,	%i2
	bcs,pn	%icc,	loop_2721
	fmovdpos	%xcc,	%f3,	%f0
loop_2720:
	nop
	set	0x08, %g4
	stxa	%g5,	[%l7 + %g4] 0x89
loop_2721:
	move	%xcc,	%g3,	%i0
	movvs	%xcc,	%i4,	%g2
	edge16l	%g7,	%o2,	%g6
	fmovdcs	%icc,	%f14,	%f18
	sub	%o7,	%g1,	%o3
	fmul8sux16	%f28,	%f0,	%f20
	udivcc	%i6,	0x0FD8,	%g4
	fsrc2	%f16,	%f24
	fmovsl	%xcc,	%f5,	%f8
	fpack16	%f14,	%f27
	movpos	%icc,	%o4,	%l0
	array32	%l4,	%o5,	%l6
	movleu	%icc,	%i1,	%i7
	ldd	[%l7 + 0x50],	%f0
	movleu	%icc,	%o6,	%l1
	fmovspos	%xcc,	%f23,	%f15
	edge32l	%i3,	%o1,	%i5
	fmovdcc	%xcc,	%f14,	%f31
	fxnor	%f20,	%f28,	%f26
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x15,	 0x1
	tn	%icc,	0x5
	movre	%l2,	0x13E,	%l5
	sethi	0x0E32,	%i2
	nop
	set	0x65, %i2
	ldstub	[%l7 + %i2],	%g5
	brlz,a	%g3,	loop_2722
	fcmped	%fcc3,	%f14,	%f6
	std	%f22,	[%l7 + 0x20]
	tne	%xcc,	0x0
loop_2722:
	ldx	[%l7 + 0x20],	%i0
	alignaddrl	%o0,	%g2,	%i4
	bne,pt	%xcc,	loop_2723
	fbug,a	%fcc3,	loop_2724
	addccc	%o2,	%g7,	%g6
	edge16l	%g1,	%o7,	%o3
loop_2723:
	srax	%g4,	0x12,	%i6
loop_2724:
	edge32n	%l0,	%o4,	%l4
	addc	%o5,	0x18D6,	%l6
	edge16l	%i1,	%i7,	%l1
	fpsub16	%f12,	%f2,	%f18
	fmovrdgz	%o6,	%f12,	%f22
	edge32n	%o1,	%i5,	%l3
	brlz	%i3,	loop_2725
	array16	%l5,	%i2,	%l2
	bl	%icc,	loop_2726
	edge8n	%g3,	%i0,	%o0
loop_2725:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%g2
loop_2726:
	fcmple32	%f8,	%f12,	%g5
	stbar
	set	0x66, %i5
	stha	%i4,	[%l7 + %i5] 0x2b
	membar	#Sync
	movne	%xcc,	%o2,	%g6
	movleu	%xcc,	%g7,	%o7
	fpmerge	%f2,	%f0,	%f22
	xnor	%g1,	%g4,	%o3
	stw	%l0,	[%l7 + 0x08]
	orn	%i6,	%l4,	%o5
	subccc	%o4,	%i1,	%i7
	xnorcc	%l6,	0x0E45,	%l1
	wr	%g0,	0x04,	%asi
	sta	%f28,	[%l7 + 0x58] %asi
	fpadd16s	%f9,	%f23,	%f31
	set	0x18, %l5
	prefetcha	[%l7 + %l5] 0x15,	 0x2
	nop
	setx	loop_2727,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbge	%fcc1,	loop_2728
	xnor	%o1,	0x06E1,	%l3
	edge8ln	%i3,	%i5,	%l5
loop_2727:
	bn,a,pt	%icc,	loop_2729
loop_2728:
	siam	0x4
	bg,pn	%xcc,	loop_2730
	mulx	%l2,	%g3,	%i2
loop_2729:
	movle	%xcc,	%i0,	%g2
	fnors	%f3,	%f3,	%f7
loop_2730:
	stx	%o0,	[%l7 + 0x28]
	or	%i4,	%o2,	%g6
	move	%xcc,	%g7,	%g5
	ta	%xcc,	0x5
	umulcc	%o7,	%g4,	%o3
	brgz,a	%g1,	loop_2731
	bl,a	loop_2732
	ldx	[%l7 + 0x18],	%i6
	fnot2s	%f0,	%f16
loop_2731:
	sdivcc	%l0,	0x00C3,	%o5
loop_2732:
	taddcc	%l4,	%i1,	%i7
	nop
	setx	loop_2733,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%icc,	0x0
	alignaddr	%o4,	%l1,	%o6
	nop
	setx loop_2734, %l0, %l1
	jmpl %l1, %o1
loop_2733:
	membar	0x53
	smulcc	%l6,	0x08E6,	%i3
	fmovrslez	%l3,	%f11,	%f9
loop_2734:
	orncc	%i5,	0x1D41,	%l5
	movleu	%xcc,	%g3,	%i2
	fmovrdgez	%i0,	%f8,	%f6
	edge32l	%l2,	%o0,	%g2
	movg	%xcc,	%o2,	%g6
	fpadd32s	%f12,	%f24,	%f16
	fpsub16	%f22,	%f12,	%f0
	move	%xcc,	%i4,	%g5
	tcs	%icc,	0x0
	sdivx	%g7,	0x060C,	%o7
	edge8ln	%g4,	%o3,	%i6
	tneg	%icc,	0x2
	edge16n	%g1,	%l0,	%l4
	and	%o5,	0x159E,	%i1
	edge8	%o4,	%i7,	%o6
	tleu	%icc,	0x2
	fors	%f27,	%f23,	%f0
	tle	%xcc,	0x6
	xor	%l1,	0x016E,	%l6
	edge32	%o1,	%i3,	%l3
	sllx	%l5,	0x03,	%i5
	addcc	%i2,	0x1921,	%g3
	mova	%icc,	%l2,	%i0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%g2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o2,	%i4
	fmovdle	%xcc,	%f17,	%f4
	taddcctv	%g5,	%g6,	%g7
	tge	%icc,	0x7
	sll	%o7,	%o3,	%g4
	sdiv	%i6,	0x0EEA,	%l0
	umul	%g1,	%o5,	%i1
	call	loop_2735
	fmovrdgez	%o4,	%f12,	%f18
	std	%i6,	[%l7 + 0x60]
	tleu	%icc,	0x5
loop_2735:
	tsubcctv	%o6,	0x1DE9,	%l4
	fmovspos	%xcc,	%f10,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%l1,	%f18,	%f11
	fmovspos	%xcc,	%f23,	%f23
	tg	%icc,	0x7
	movl	%icc,	%l6,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%icc,	%f25,	%f25
	fbge	%fcc0,	loop_2736
	orcc	%l3,	%l5,	%i5
	tle	%xcc,	0x6
	srlx	%o1,	0x0D,	%i2
loop_2736:
	ldd	[%l7 + 0x28],	%l2
	fbule,a	%fcc3,	loop_2737
	fcmpgt16	%f30,	%f22,	%i0
	fpmerge	%f1,	%f15,	%f22
	edge16ln	%g3,	%o0,	%g2
loop_2737:
	fandnot2s	%f7,	%f18,	%f29
	udivx	%o2,	0x1621,	%g5
	ble,pn	%icc,	loop_2738
	orcc	%g6,	0x1874,	%i4
	fmovspos	%xcc,	%f6,	%f9
	fmovdvs	%xcc,	%f7,	%f26
loop_2738:
	addc	%g7,	0x008B,	%o7
	edge16l	%o3,	%g4,	%l0
	andn	%g1,	0x042A,	%i6
	sll	%i1,	0x18,	%o4
	fmovrdgz	%o5,	%f28,	%f24
	fpadd32	%f14,	%f12,	%f16
	movle	%icc,	%i7,	%l4
	wr	%g0,	0x19,	%asi
	stha	%l1,	[%l7 + 0x0A] %asi
	sdivcc	%l6,	0x1719,	%o6
	tpos	%icc,	0x6
	fmovsa	%xcc,	%f4,	%f2
	bleu,a,pt	%icc,	loop_2739
	movrgz	%i3,	%l3,	%l5
	nop
	setx	loop_2740,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlz	%i5,	0x10F,	%i2
loop_2739:
	movge	%icc,	%l2,	%i0
	bg,a,pt	%xcc,	loop_2741
loop_2740:
	tleu	%xcc,	0x3
	movneg	%xcc,	%g3,	%o1
	udivcc	%o0,	0x1164,	%g2
loop_2741:
	tne	%xcc,	0x4
	fcmps	%fcc1,	%f30,	%f16
	nop
	setx	loop_2742,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdg	%icc,	%f8,	%f30
	tcc	%xcc,	0x5
	alignaddr	%g5,	%o2,	%i4
loop_2742:
	edge8l	%g7,	%o7,	%g6
	umul	%o3,	%g4,	%g1
	movcc	%icc,	%i6,	%l0
	ba,a,pn	%xcc,	loop_2743
	movrgz	%i1,	%o4,	%o5
	sllx	%l4,	0x1D,	%l1
	addcc	%l6,	0x1CD2,	%i7
loop_2743:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x64] %asi,	%o6
	tvc	%xcc,	0x3
	srl	%i3,	0x08,	%l3
	tcs	%icc,	0x4
	set	0x3A, %l1
	ldstuba	[%l7 + %l1] 0x04,	%i5
	movre	%l5,	%l2,	%i2
	sll	%g3,	%o1,	%o0
	fxor	%f2,	%f4,	%f4
	andcc	%g2,	0x1553,	%i0
	fba	%fcc0,	loop_2744
	andncc	%o2,	%i4,	%g7
	fbn	%fcc0,	loop_2745
	udivcc	%o7,	0x15F1,	%g5
loop_2744:
	orn	%g6,	%o3,	%g4
	fxors	%f6,	%f8,	%f0
loop_2745:
	udivcc	%i6,	0x1D49,	%g1
	sub	%l0,	%i1,	%o4
	std	%f18,	[%l7 + 0x78]
	andcc	%o5,	0x0C87,	%l4
	fpsub32	%f24,	%f6,	%f8
	bn,a	loop_2746
	addccc	%l1,	0x1E1A,	%l6
	andn	%o6,	0x0133,	%i7
	fnands	%f19,	%f8,	%f12
loop_2746:
	array16	%l3,	%i3,	%l5
	alignaddr	%i5,	%i2,	%g3
	movpos	%icc,	%o1,	%o0
	tl	%icc,	0x6
	fmuld8sux16	%f31,	%f10,	%f28
	movvs	%icc,	%l2,	%g2
	fcmple16	%f0,	%f0,	%i0
	bge,a	%icc,	loop_2747
	fone	%f16
	fmovde	%xcc,	%f11,	%f14
	fmovdvc	%icc,	%f29,	%f10
loop_2747:
	nop
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o2
	tgu	%icc,	0x6
	array32	%g7,	%i4,	%o7
	fpsub32	%f4,	%f30,	%f4
	popc	%g5,	%g6
	fmovsleu	%xcc,	%f24,	%f20
	tvs	%icc,	0x0
	swap	[%l7 + 0x7C],	%o3
	movvs	%icc,	%g4,	%i6
	tcs	%xcc,	0x4
	udivx	%g1,	0x0C24,	%l0
	set	0x38, %o2
	stba	%i1,	[%l7 + %o2] 0x10
	edge32	%o5,	%l4,	%l1
	fsrc1	%f18,	%f16
	sethi	0x17A4,	%o4
	tvc	%xcc,	0x2
	edge8ln	%l6,	%i7,	%l3
	fnot2s	%f27,	%f4
	umul	%o6,	%i3,	%l5
	sdivcc	%i5,	0x054D,	%i2
	fmul8x16al	%f1,	%f10,	%f22
	fpadd16s	%f20,	%f28,	%f27
	fmul8x16	%f5,	%f6,	%f4
	edge8ln	%g3,	%o0,	%l2
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tn	%icc,	0x0
	for	%f22,	%f20,	%f4
	fexpand	%f31,	%f12
	fcmpeq16	%f26,	%f24,	%g2
	smulcc	%i0,	0x072A,	%o1
	bcs	loop_2748
	add	%o2,	0x08E1,	%g7
	fmovrslz	%i4,	%f13,	%f9
	pdist	%f30,	%f2,	%f8
loop_2748:
	fnot1	%f4,	%f14
	fxors	%f21,	%f20,	%f17
	xor	%o7,	%g5,	%o3
	brnz,a	%g6,	loop_2749
	array32	%g4,	%g1,	%i6
	srl	%i1,	0x1D,	%l0
	movrne	%l4,	%l1,	%o4
loop_2749:
	bgu,pn	%xcc,	loop_2750
	ldd	[%l7 + 0x60],	%o4
	fand	%f26,	%f28,	%f22
	edge16l	%l6,	%l3,	%i7
loop_2750:
	movg	%xcc,	%i3,	%l5
	fcmpeq32	%f2,	%f12,	%i5
	sllx	%o6,	%g3,	%o0
	sdivcc	%l2,	0x017E,	%i2
	umulcc	%g2,	0x1094,	%i0
	addc	%o2,	%o1,	%g7
	orn	%i4,	0x18C9,	%o7
	stbar
	movge	%xcc,	%g5,	%g6
	mulx	%g4,	%o3,	%i6
	wr	%g0,	0x88,	%asi
	stxa	%g1,	[%l7 + 0x58] %asi
	fsrc1	%f18,	%f6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%l0,	%i1
	bpos,pn	%icc,	loop_2751
	movne	%xcc,	%l4,	%l1
	fsrc2	%f20,	%f30
	fbug,a	%fcc1,	loop_2752
loop_2751:
	movrne	%o5,	%l6,	%l3
	bneg,a,pt	%icc,	loop_2753
	fmovdleu	%xcc,	%f10,	%f0
loop_2752:
	xorcc	%o4,	%i7,	%i3
	movpos	%xcc,	%i5,	%l5
loop_2753:
	orn	%o6,	0x0A85,	%g3
	bvs	%icc,	loop_2754
	bne	%xcc,	loop_2755
	fands	%f31,	%f3,	%f10
	ldsw	[%l7 + 0x64],	%o0
loop_2754:
	xorcc	%i2,	0x16CC,	%g2
loop_2755:
	movg	%xcc,	%l2,	%i0
	edge16l	%o2,	%o1,	%g7
	fxors	%f25,	%f4,	%f25
	ldd	[%l7 + 0x28],	%f18
	membar	0x68
	fnot2s	%f0,	%f31
	fornot1	%f0,	%f18,	%f16
	xnor	%i4,	%o7,	%g5
	fmovse	%icc,	%f15,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba	%xcc,	loop_2756
	fzeros	%f23
	tsubcctv	%g4,	%g6,	%o3
	brgez,a	%g1,	loop_2757
loop_2756:
	srax	%l0,	%i6,	%l4
	movrgz	%i1,	%l1,	%l6
	set	0x18, %l0
	prefetcha	[%l7 + %l0] 0x10,	 0x3
loop_2757:
	tgu	%xcc,	0x5
	fmovda	%xcc,	%f1,	%f31
	movre	%o4,	%i7,	%i3
	addc	%o5,	0x128A,	%l5
	tneg	%icc,	0x5
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf9,	%f0
	bvc,a,pt	%xcc,	loop_2758
	xnor	%i5,	%g3,	%o6
	movgu	%xcc,	%o0,	%g2
	ld	[%l7 + 0x38],	%f29
loop_2758:
	fmovrslz	%i2,	%f26,	%f5
	fpadd16	%f14,	%f0,	%f20
	sethi	0x125C,	%i0
	movcs	%xcc,	%o2,	%l2
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x60] %asi,	%g7
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i4,	%o7
	movrlz	%g5,	%o1,	%g6
	bpos,a,pt	%icc,	loop_2759
	st	%f20,	[%l7 + 0x18]
	edge8n	%g4,	%o3,	%g1
	movge	%icc,	%l0,	%i6
loop_2759:
	tgu	%icc,	0x2
	brlz,a	%i1,	loop_2760
	alignaddrl	%l4,	%l6,	%l1
	fbl	%fcc0,	loop_2761
	edge16n	%l3,	%i7,	%i3
loop_2760:
	orcc	%o5,	%l5,	%i5
	alignaddrl	%g3,	%o6,	%o0
loop_2761:
	fmovrdne	%o4,	%f24,	%f30
	taddcctv	%g2,	0x18A1,	%i2
	mulscc	%o2,	%l2,	%g7
	taddcctv	%i4,	0x1C03,	%i0
	fmovrsgez	%o7,	%f3,	%f29
	fba	%fcc1,	loop_2762
	fbuge	%fcc1,	loop_2763
	tge	%icc,	0x6
	edge8l	%g5,	%g6,	%o1
loop_2762:
	movgu	%icc,	%g4,	%g1
loop_2763:
	movvs	%icc,	%o3,	%i6
	fone	%f4
	movrlez	%i1,	0x014,	%l4
	movge	%xcc,	%l6,	%l1
	fbn,a	%fcc3,	loop_2764
	brgz	%l0,	loop_2765
	edge32n	%l3,	%i7,	%i3
	edge8n	%o5,	%i5,	%g3
loop_2764:
	membar	0x52
loop_2765:
	bg,a	%icc,	loop_2766
	andncc	%o6,	%l5,	%o0
	taddcc	%g2,	%i2,	%o4
	mulscc	%o2,	%g7,	%l2
loop_2766:
	movrlez	%i0,	0x3D6,	%i4
	movrlez	%g5,	%o7,	%g6
	edge8n	%g4,	%o1,	%g1
	alignaddrl	%i6,	%o3,	%l4
	fmovsg	%icc,	%f29,	%f23
	fcmpd	%fcc3,	%f14,	%f20
	movn	%icc,	%i1,	%l1
	mova	%icc,	%l0,	%l6
	fornot1s	%f8,	%f10,	%f28
	fcmple16	%f6,	%f2,	%l3
	movre	%i3,	0x364,	%o5
	edge16l	%i5,	%g3,	%o6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x04,	%l5,	%i7
	movpos	%icc,	%g2,	%o0
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x32] %asi,	%o4
	edge32n	%i2,	%o2,	%g7
	bne,a,pt	%xcc,	loop_2767
	fxnor	%f8,	%f8,	%f12
	movleu	%xcc,	%l2,	%i0
	fxor	%f8,	%f6,	%f10
loop_2767:
	subc	%i4,	0x012F,	%o7
	movrgez	%g6,	0x3EE,	%g4
	movleu	%icc,	%o1,	%g1
	fmuld8sux16	%f24,	%f17,	%f6
	fxnors	%f1,	%f18,	%f27
	fmovsne	%xcc,	%f13,	%f16
	add	%g5,	%i6,	%l4
	subc	%i1,	0x0C52,	%l1
	bg	loop_2768
	fble	%fcc0,	loop_2769
	movre	%l0,	%o3,	%l6
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x38] %asi,	%i3
loop_2768:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x57] %asi,	%l3
loop_2769:
	fmovdcs	%icc,	%f26,	%f28
	wr	%g0,	0x10,	%asi
	sta	%f25,	[%l7 + 0x68] %asi
	taddcctv	%o5,	%i5,	%g3
	brgz	%o6,	loop_2770
	fornot1	%f12,	%f12,	%f4
	fbu,a	%fcc3,	loop_2771
	movrgz	%i7,	%l5,	%o0
loop_2770:
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%f20
	for	%f24,	%f12,	%f22
loop_2771:
	nop
	set	0x78, %o1
	stda	%g2,	[%l7 + %o1] 0x14
	set	0x5C, %l3
	swapa	[%l7 + %l3] 0x80,	%i2
	nop
	setx	loop_2772,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddrl	%o4,	%o2,	%l2
	movneg	%icc,	%g7,	%i4
	set	0x70, %g6
	stda	%o6,	[%l7 + %g6] 0x23
	membar	#Sync
loop_2772:
	fmovsa	%icc,	%f15,	%f27
	fble,a	%fcc0,	loop_2773
	movleu	%xcc,	%i0,	%g6
	bne,a,pt	%xcc,	loop_2774
	tne	%xcc,	0x4
loop_2773:
	std	%g4,	[%l7 + 0x78]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%o1,	%g5
loop_2774:
	fmovrde	%g1,	%f20,	%f10
	array8	%i6,	%l4,	%i1
	taddcc	%l0,	%l1,	%o3
	fbl	%fcc3,	loop_2775
	edge32	%i3,	%l3,	%o5
	edge16l	%i5,	%l6,	%o6
	fblg,a	%fcc1,	loop_2776
loop_2775:
	tsubcctv	%g3,	0x1E98,	%i7
	xnorcc	%o0,	0x132F,	%g2
	movrlez	%i2,	%l5,	%o2
loop_2776:
	orncc	%o4,	%l2,	%i4
	sdiv	%o7,	0x1A6A,	%g7
	movge	%icc,	%i0,	%g4
	fmovsvc	%icc,	%f9,	%f31
	stbar
	andn	%g6,	0x0B4A,	%o1
	subc	%g5,	0x0E41,	%g1
	fxnor	%f16,	%f26,	%f20
	smul	%i6,	%i1,	%l4
	brlez,a	%l1,	loop_2777
	sllx	%o3,	0x19,	%l0
	movcs	%xcc,	%l3,	%o5
	movrne	%i3,	0x3DA,	%i5
loop_2777:
	nop
	set	0x28, %o0
	stda	%o6,	[%l7 + %o0] 0xe2
	membar	#Sync
	brnz,a	%l6,	loop_2778
	tne	%xcc,	0x2
	movn	%xcc,	%i7,	%o0
	edge8l	%g3,	%g2,	%i2
loop_2778:
	ld	[%l7 + 0x40],	%f26
	fble,a	%fcc1,	loop_2779
	sll	%o2,	0x0C,	%o4
	fmovrslez	%l5,	%f27,	%f10
	set	0x67, %o5
	lduba	[%l7 + %o5] 0x80,	%l2
loop_2779:
	nop
	setx	loop_2780,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%i4,	%o7,	%g7
	fpmerge	%f25,	%f14,	%f2
	orcc	%g4,	%g6,	%i0
loop_2780:
	edge32ln	%g5,	%g1,	%i6
	movrne	%o1,	0x164,	%l4
	edge8ln	%l1,	%i1,	%o3
	edge32l	%l3,	%o5,	%i3
	xorcc	%i5,	%o6,	%l6
	set	0x30, %g2
	ldda	[%l7 + %g2] 0x88,	%l0
	for	%f8,	%f26,	%f16
	xorcc	%o0,	%i7,	%g3
	fcmpne32	%f28,	%f16,	%g2
	tsubcctv	%i2,	0x0E61,	%o2
	array8	%o4,	%l5,	%l2
	edge16	%o7,	%i4,	%g4
	tsubcc	%g6,	0x0E10,	%i0
	fornot2s	%f9,	%f30,	%f31
	fbl,a	%fcc2,	loop_2781
	fsrc2	%f18,	%f14
	movvc	%xcc,	%g5,	%g1
	movleu	%icc,	%g7,	%i6
loop_2781:
	array8	%o1,	%l1,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l4,	0x164,	%o3
	udivcc	%o5,	0x0510,	%l3
	fone	%f16
	tge	%icc,	0x6
	movrgez	%i5,	0x177,	%o6
	sll	%l6,	0x07,	%i3
	ldd	[%l7 + 0x40],	%o0
	edge16n	%l0,	%g3,	%i7
	bn,a,pn	%xcc,	loop_2782
	tl	%icc,	0x1
	fcmple16	%f2,	%f28,	%i2
	sll	%o2,	%g2,	%o4
loop_2782:
	bl,a	loop_2783
	tleu	%xcc,	0x2
	stbar
	sra	%l5,	%l2,	%o7
loop_2783:
	move	%xcc,	%g4,	%i4
	fone	%f28
	andn	%g6,	0x1BFD,	%g5
	tl	%xcc,	0x6
	edge16	%g1,	%i0,	%g7
	fmovda	%icc,	%f0,	%f25
	movgu	%icc,	%i6,	%l1
	fnegs	%f21,	%f16
	fbe	%fcc2,	loop_2784
	fsrc1	%f14,	%f2
	movrgz	%o1,	%i1,	%o3
	fmul8sux16	%f0,	%f14,	%f24
loop_2784:
	stb	%l4,	[%l7 + 0x15]
	orcc	%o5,	%l3,	%i5
	fmovdn	%xcc,	%f9,	%f25
	fmul8x16au	%f2,	%f0,	%f2
	fmovsle	%xcc,	%f27,	%f19
	set	0x44, %i3
	swapa	[%l7 + %i3] 0x81,	%l6
	membar	0x29
	fornot2	%f0,	%f16,	%f18
	fcmple16	%f30,	%f26,	%o6
	faligndata	%f24,	%f8,	%f26
	tneg	%icc,	0x5
	fones	%f17
	brlz,a	%i3,	loop_2785
	fors	%f25,	%f27,	%f26
	edge32ln	%o0,	%l0,	%i7
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2785:
	subc	%g3,	%o2,	%g2
	fmovsa	%xcc,	%f29,	%f6
	subcc	%i2,	0x015A,	%l5
	movrlz	%l2,	%o4,	%g4
	andncc	%o7,	%i4,	%g5
	movg	%icc,	%g6,	%i0
	nop
	set	0x36, %g3
	sth	%g1,	[%l7 + %g3]
	movrgez	%g7,	0x269,	%i6
	movrlz	%o1,	%l1,	%i1
	mulscc	%l4,	%o3,	%o5
	tvs	%icc,	0x3
	xor	%i5,	0x0B0A,	%l3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x55] %asi,	%o6
	te	%xcc,	0x3
	xorcc	%i3,	0x172A,	%l6
	edge16l	%o0,	%i7,	%l0
	array8	%o2,	%g3,	%g2
	membar	0x39
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x4C, %o3
	stba	%l5,	[%l7 + %o3] 0x22
	membar	#Sync
	fba,a	%fcc1,	loop_2786
	subcc	%l2,	0x1230,	%i2
	fpackfix	%f22,	%f20
	movcs	%icc,	%o4,	%g4
loop_2786:
	fbu	%fcc3,	loop_2787
	fpadd16	%f14,	%f12,	%f4
	fpadd16	%f2,	%f16,	%f30
	edge16	%o7,	%i4,	%g6
loop_2787:
	edge16n	%g5,	%g1,	%i0
	fmovdle	%icc,	%f13,	%f5
	fble,a	%fcc3,	loop_2788
	andncc	%i6,	%o1,	%l1
	xnorcc	%g7,	0x18B6,	%l4
	and	%i1,	%o3,	%i5
loop_2788:
	srl	%l3,	0x14,	%o5
	fmovsle	%xcc,	%f27,	%f9
	popc	0x0D01,	%o6
	movrne	%i3,	%o0,	%l6
	fxors	%f14,	%f10,	%f23
	te	%xcc,	0x3
	fabss	%f7,	%f28
	sethi	0x0FB5,	%i7
	movleu	%xcc,	%o2,	%l0
	alignaddr	%g3,	%g2,	%l5
	sub	%l2,	%i2,	%g4
	fmovdcs	%xcc,	%f18,	%f1
	fxnors	%f28,	%f7,	%f19
	sll	%o4,	0x1B,	%o7
	ld	[%l7 + 0x48],	%f21
	fpackfix	%f26,	%f26
	fbul	%fcc3,	loop_2789
	edge8	%g6,	%g5,	%i4
	movvc	%icc,	%g1,	%i6
	ta	%xcc,	0x4
loop_2789:
	fnegs	%f30,	%f23
	prefetch	[%l7 + 0x48],	 0x0
	fbe,a	%fcc3,	loop_2790
	fmovse	%icc,	%f12,	%f11
	ld	[%l7 + 0x24],	%f23
	swap	[%l7 + 0x68],	%i0
loop_2790:
	tcs	%xcc,	0x3
	udivcc	%l1,	0x0944,	%g7
	tge	%xcc,	0x1
	wr	%g0,	0x0c,	%asi
	sta	%f0,	[%l7 + 0x3C] %asi
	taddcctv	%o1,	0x0781,	%l4
	tgu	%icc,	0x5
	for	%f22,	%f16,	%f0
	andncc	%o3,	%i5,	%l3
	sdivx	%i1,	0x15DA,	%o6
	tcs	%icc,	0x0
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x30] %asi,	%i3
	movleu	%icc,	%o0,	%l6
	tcc	%icc,	0x6
	alignaddr	%o5,	%o2,	%i7
	fbuge,a	%fcc1,	loop_2791
	sdivcc	%g3,	0x105E,	%l0
	movgu	%icc,	%l5,	%g2
	tpos	%xcc,	0x2
loop_2791:
	ldx	[%l7 + 0x68],	%i2
	edge8l	%l2,	%o4,	%o7
	fmovsvs	%xcc,	%f20,	%f20
	udivcc	%g4,	0x1265,	%g5
	srl	%i4,	%g1,	%g6
	edge32	%i0,	%i6,	%g7
	subcc	%o1,	%l4,	%o3
	alignaddr	%i5,	%l1,	%l3
	fandnot2s	%f28,	%f0,	%f17
	addc	%i1,	%i3,	%o0
	bge	%icc,	loop_2792
	udivcc	%l6,	0x0E8E,	%o6
	taddcc	%o5,	%o2,	%i7
	ldx	[%l7 + 0x28],	%l0
loop_2792:
	membar	0x78
	andncc	%g3,	%l5,	%i2
	fmovdvs	%icc,	%f23,	%f26
	smul	%l2,	%g2,	%o7
	movpos	%icc,	%g4,	%o4
	addc	%i4,	%g1,	%g5
	movrgez	%g6,	%i0,	%g7
	fxnor	%f4,	%f10,	%f18
	set	0x7C, %i1
	lduha	[%l7 + %i1] 0x89,	%i6
	fpsub16	%f16,	%f14,	%f18
	fabss	%f27,	%f21
	popc	%l4,	%o1
	fpadd32	%f14,	%f20,	%f16
	fmovd	%f30,	%f24
	edge32	%i5,	%l1,	%o3
	fornot1	%f0,	%f12,	%f28
	tneg	%icc,	0x4
	edge8n	%i1,	%i3,	%o0
	edge32n	%l6,	%o6,	%o5
	movneg	%xcc,	%l3,	%o2
	fble	%fcc1,	loop_2793
	edge32ln	%i7,	%g3,	%l5
	movleu	%xcc,	%i2,	%l2
	fandnot2s	%f20,	%f21,	%f12
loop_2793:
	fornot2s	%f24,	%f27,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe,a	%fcc0,	loop_2794
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f26,	%f26,	%f6
	fmovrdlez	%l0,	%f28,	%f8
loop_2794:
	fmul8sux16	%f16,	%f28,	%f8
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x64] %asi,	%f17
	alignaddrl	%o7,	%g2,	%g4
	tge	%icc,	0x0
	edge16n	%o4,	%i4,	%g5
	ta	%icc,	0x4
	edge8n	%g6,	%g1,	%g7
	set	0x28, %i0
	swapa	[%l7 + %i0] 0x89,	%i0
	set	0x7B, %g5
	stba	%l4,	[%l7 + %g5] 0x2a
	membar	#Sync
	bcs,a,pn	%xcc,	loop_2795
	fbue	%fcc3,	loop_2796
	fmovsl	%xcc,	%f18,	%f13
	fmovdge	%xcc,	%f30,	%f31
loop_2795:
	stbar
loop_2796:
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 0x1
	sdivcc	%i6,	0x0D09,	%o1
	tl	%icc,	0x0
	addcc	%i5,	0x15A2,	%o3
	edge16	%l1,	%i3,	%o0
	std	%i0,	[%l7 + 0x10]
	sethi	0x082E,	%l6
	and	%o6,	%l3,	%o5
	edge16ln	%i7,	%g3,	%o2
	fexpand	%f20,	%f28
	movle	%xcc,	%l5,	%i2
	movle	%icc,	%l0,	%l2
	edge32l	%o7,	%g4,	%g2
	movn	%xcc,	%o4,	%i4
	or	%g6,	0x1D8C,	%g5
	fmovse	%icc,	%f21,	%f12
	fandnot2s	%f19,	%f4,	%f3
	ldsh	[%l7 + 0x0C],	%g7
	xnor	%g1,	0x1899,	%i0
	mova	%icc,	%l4,	%o1
	ta	%xcc,	0x1
	or	%i6,	0x01D7,	%o3
	fblg	%fcc2,	loop_2797
	fblg,a	%fcc1,	loop_2798
	fabsd	%f22,	%f14
	addcc	%i5,	0x0A53,	%l1
loop_2797:
	edge32ln	%i3,	%i1,	%l6
loop_2798:
	edge16n	%o6,	%l3,	%o5
	fblg	%fcc2,	loop_2799
	fpadd32	%f12,	%f12,	%f10
	sllx	%o0,	%g3,	%o2
	mova	%xcc,	%i7,	%i2
loop_2799:
	tg	%xcc,	0x0
	movrgz	%l0,	%l2,	%l5
	set	0x48, %g1
	stda	%o6,	[%l7 + %g1] 0x14
	fmovsgu	%icc,	%f1,	%f27
	te	%icc,	0x7
	edge8ln	%g2,	%g4,	%o4
	fblg	%fcc1,	loop_2800
	alignaddr	%g6,	%i4,	%g7
	nop
	set	0x0A, %l6
	ldsb	[%l7 + %l6],	%g1
	fmovsne	%xcc,	%f22,	%f4
loop_2800:
	edge16ln	%i0,	%g5,	%o1
	fxors	%f4,	%f10,	%f29
	pdist	%f12,	%f18,	%f18
	xorcc	%l4,	0x108E,	%i6
	fmul8sux16	%f10,	%f20,	%f6
	sub	%i5,	%l1,	%i3
	bg,a,pn	%icc,	loop_2801
	srax	%o3,	0x17,	%l6
	edge32n	%i1,	%o6,	%o5
	call	loop_2802
loop_2801:
	tle	%icc,	0x0
	movne	%xcc,	%o0,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2802:
	nop
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	flush	%l7 + 0x20
	xnor	%o2,	%l3,	%i7
	be,a	loop_2803
	bn,a	%icc,	loop_2804
	fcmpgt32	%f2,	%f2,	%i2
	bge,a,pn	%icc,	loop_2805
loop_2803:
	movne	%xcc,	%l2,	%l5
loop_2804:
	bneg,pn	%icc,	loop_2806
	movvc	%icc,	%l0,	%o7
loop_2805:
	sll	%g4,	0x1B,	%o4
	tl	%xcc,	0x6
loop_2806:
	movvc	%icc,	%g2,	%g6
	fbue,a	%fcc3,	loop_2807
	sdiv	%g7,	0x19C7,	%i4
	array32	%g1,	%g5,	%o1
	udiv	%i0,	0x0BB3,	%l4
loop_2807:
	edge8ln	%i6,	%i5,	%i3
	movvs	%icc,	%l1,	%l6
	orn	%o3,	0x1689,	%i1
	subc	%o5,	0x1038,	%o6
	andncc	%o0,	%g3,	%l3
	movpos	%icc,	%i7,	%i2
	movleu	%xcc,	%l2,	%o2
	addc	%l5,	%o7,	%l0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%o4
	movn	%icc,	%g6,	%g2
	fbne	%fcc2,	loop_2808
	fmovdl	%icc,	%f12,	%f1
	edge16n	%i4,	%g7,	%g1
	movle	%xcc,	%o1,	%i0
loop_2808:
	membar	0x7E
	sub	%g5,	0x1640,	%i6
	orn	%l4,	0x102A,	%i3
	sdiv	%l1,	0x0840,	%i5
	taddcc	%o3,	0x1EC5,	%i1
	mulscc	%l6,	0x06DF,	%o5
	pdist	%f26,	%f0,	%f14
	ldx	[%l7 + 0x68],	%o0
	sdiv	%g3,	0x0FB8,	%l3
	movrgez	%i7,	%o6,	%l2
	fmovrslz	%i2,	%f22,	%f29
	flush	%l7 + 0x74
	edge16	%o2,	%l5,	%o7
	movne	%xcc,	%g4,	%l0
	stx	%o4,	[%l7 + 0x38]
	movrlez	%g2,	0x3AA,	%i4
	movcc	%icc,	%g7,	%g6
	movcs	%icc,	%o1,	%i0
	movvs	%icc,	%g5,	%g1
	tsubcctv	%l4,	0x1A96,	%i3
	brlez	%i6,	loop_2809
	sdivx	%i5,	0x02F7,	%l1
	tleu	%xcc,	0x6
	fxors	%f5,	%f16,	%f17
loop_2809:
	tcs	%xcc,	0x5
	be,a,pn	%xcc,	loop_2810
	and	%i1,	0x1A8F,	%o3
	fnot2	%f22,	%f16
	srax	%l6,	0x0C,	%o0
loop_2810:
	movg	%xcc,	%o5,	%g3
	or	%l3,	%i7,	%l2
	sdivx	%i2,	0x00F3,	%o6
	srlx	%l5,	0x19,	%o2
	array32	%g4,	%o7,	%l0
	fpsub16s	%f11,	%f25,	%f7
	fxnor	%f24,	%f22,	%f2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%o4,	%i4
	sdivx	%g7,	0x193A,	%g2
	edge8n	%o1,	%g6,	%g5
	mulx	%g1,	%i0,	%l4
	fxnors	%f29,	%f26,	%f31
	set	0x50, %o4
	ldxa	[%l7 + %o4] 0x19,	%i3
	fmovs	%f4,	%f6
	xor	%i6,	0x0E42,	%l1
	sll	%i5,	%i1,	%o3
	wr	%g0,	0x27,	%asi
	stha	%l6,	[%l7 + 0x18] %asi
	membar	#Sync
	sdivcc	%o5,	0x0B06,	%g3
	orncc	%l3,	%i7,	%l2
	fmovdpos	%xcc,	%f26,	%f13
	bshuffle	%f2,	%f20,	%f30
	fbne,a	%fcc3,	loop_2811
	add	%i2,	%o0,	%o6
	sir	0x1CE4
	fcmpeq32	%f16,	%f20,	%l5
loop_2811:
	xorcc	%g4,	%o2,	%o7
	edge16n	%o4,	%i4,	%l0
	movgu	%xcc,	%g2,	%g7
	ld	[%l7 + 0x1C],	%f16
	tle	%icc,	0x5
	set	0x18, %g7
	ldxa	[%g0 + %g7] 0x20,	%g6
	movgu	%icc,	%o1,	%g1
	set	0x40, %l4
	lda	[%l7 + %l4] 0x10,	%f16
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x23] %asi,	%g5
	fpack16	%f14,	%f14
	tge	%xcc,	0x7
	movre	%i0,	0x183,	%i3
	movrlz	%l4,	0x26D,	%i6
	xnor	%i5,	%i1,	%l1
	fbl	%fcc3,	loop_2812
	xorcc	%l6,	%o3,	%g3
	edge16n	%l3,	%i7,	%o5
	edge8	%i2,	%l2,	%o6
loop_2812:
	mulx	%o0,	0x083A,	%l5
	movrgez	%g4,	0x2B2,	%o7
	set	0x68, %o6
	stxa	%o2,	[%l7 + %o6] 0x81
	mulx	%o4,	0x0814,	%l0
	addccc	%g2,	%g7,	%i4
	edge16	%o1,	%g1,	%g6
	tge	%xcc,	0x4
	addcc	%g5,	0x04D0,	%i3
	and	%l4,	%i0,	%i5
	edge8	%i1,	%i6,	%l1
	umulcc	%o3,	%l6,	%g3
	ba,a	%xcc,	loop_2813
	taddcc	%l3,	%o5,	%i2
	movpos	%xcc,	%i7,	%o6
	subc	%l2,	%l5,	%o0
loop_2813:
	fnor	%f12,	%f2,	%f4
	addcc	%o7,	0x09A3,	%o2
	subc	%g4,	%o4,	%l0
	edge32ln	%g7,	%g2,	%o1
	subc	%i4,	%g1,	%g6
	subcc	%g5,	%i3,	%l4
	addcc	%i5,	0x1C9F,	%i0
	fcmps	%fcc3,	%f12,	%f0
	movrne	%i1,	0x2DC,	%i6
	xor	%o3,	%l6,	%l1
	bleu	loop_2814
	movl	%xcc,	%l3,	%o5
	fornot1	%f30,	%f22,	%f22
	sdivx	%i2,	0x0C8F,	%i7
loop_2814:
	subcc	%g3,	%l2,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o0,	0x0750,	%o7
	fmovdgu	%icc,	%f1,	%f13
	std	%f26,	[%l7 + 0x10]
	move	%xcc,	%l5,	%o2
	ldx	[%l7 + 0x18],	%o4
	stbar
	mulx	%l0,	0x0FA2,	%g7
	for	%f8,	%f6,	%f18
	mova	%xcc,	%g2,	%g4
	sdivx	%i4,	0x0931,	%o1
	movvs	%icc,	%g6,	%g5
	ble	loop_2815
	fbge,a	%fcc2,	loop_2816
	ldx	[%l7 + 0x18],	%g1
	movrne	%l4,	%i5,	%i3
loop_2815:
	brgz,a	%i0,	loop_2817
loop_2816:
	fxors	%f18,	%f24,	%f6
	fmovsg	%icc,	%f0,	%f29
	xnorcc	%i1,	%o3,	%l6
loop_2817:
	xor	%i6,	0x07B1,	%l3
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%f12
	xor	%o5,	%i2,	%i7
	membar	0x3D
	movre	%g3,	0x0A1,	%l1
	movg	%xcc,	%l2,	%o6
	fmovscc	%xcc,	%f30,	%f19
	srax	%o0,	0x12,	%l5
	orncc	%o2,	0x09C8,	%o4
	movvs	%icc,	%o7,	%g7
	move	%xcc,	%l0,	%g4
	add	%g2,	%i4,	%g6
	bn	loop_2818
	edge32ln	%o1,	%g1,	%g5
	fbuge	%fcc1,	loop_2819
	fpadd16	%f8,	%f0,	%f10
loop_2818:
	sllx	%l4,	0x02,	%i5
	srax	%i0,	%i1,	%i3
loop_2819:
	movcc	%icc,	%o3,	%l6
	edge16ln	%i6,	%l3,	%i2
	movcs	%xcc,	%i7,	%o5
	umulcc	%g3,	%l2,	%o6
	fbule,a	%fcc2,	loop_2820
	srlx	%l1,	0x1E,	%o0
	udivcc	%o2,	0x190B,	%l5
	sllx	%o7,	%g7,	%o4
loop_2820:
	sdivx	%l0,	0x18E1,	%g2
	fbge,a	%fcc2,	loop_2821
	fmovs	%f20,	%f1
	fmovsleu	%icc,	%f0,	%f2
	fbule,a	%fcc2,	loop_2822
loop_2821:
	tvs	%icc,	0x3
	fmovs	%f5,	%f30
	fcmps	%fcc2,	%f13,	%f6
loop_2822:
	movne	%xcc,	%i4,	%g6
	fmovsvs	%icc,	%f17,	%f3
	movleu	%icc,	%o1,	%g1
	movre	%g4,	0x202,	%g5
	tcs	%icc,	0x7
	movrgz	%l4,	0x165,	%i5
	ldsb	[%l7 + 0x5E],	%i0
	edge32l	%i3,	%i1,	%o3
	brz,a	%i6,	loop_2823
	edge8	%l6,	%l3,	%i2
	brz,a	%o5,	loop_2824
	fbule	%fcc2,	loop_2825
loop_2823:
	ldstub	[%l7 + 0x77],	%g3
	orn	%l2,	%o6,	%i7
loop_2824:
	subc	%l1,	0x0231,	%o0
loop_2825:
	xor	%o2,	%o7,	%g7
	fmuld8ulx16	%f10,	%f1,	%f24
	bge,a,pt	%xcc,	loop_2826
	fbge,a	%fcc3,	loop_2827
	edge16n	%o4,	%l5,	%g2
	movvs	%icc,	%l0,	%i4
loop_2826:
	ta	%icc,	0x7
loop_2827:
	sll	%o1,	0x08,	%g6
	fnands	%f18,	%f0,	%f14
	sir	0x1598
	fmul8ulx16	%f18,	%f18,	%f18
	orn	%g1,	0x02DA,	%g4
	tsubcc	%g5,	%l4,	%i0
	udiv	%i3,	0x159E,	%i1
	udiv	%i5,	0x08C0,	%i6
	movneg	%xcc,	%o3,	%l6
	array8	%i2,	%o5,	%l3
	fors	%f9,	%f22,	%f16
	movvc	%xcc,	%l2,	%g3
	brlez,a	%o6,	loop_2828
	fnot1s	%f29,	%f0
	alignaddrl	%i7,	%o0,	%o2
	bvc,pn	%icc,	loop_2829
loop_2828:
	tn	%xcc,	0x5
	fmovrse	%l1,	%f6,	%f17
	add	%g7,	0x09AC,	%o7
loop_2829:
	movvc	%xcc,	%l5,	%o4
	set	0x54, %i4
	lda	[%l7 + %i4] 0x11,	%f5
	subcc	%l0,	0x007B,	%i4
	siam	0x0
	fblg,a	%fcc1,	loop_2830
	sll	%o1,	%g6,	%g2
	tsubcctv	%g4,	%g1,	%l4
	addccc	%g5,	0x1A6C,	%i3
loop_2830:
	flush	%l7 + 0x70
	set	0x10, %i2
	ldda	[%l7 + %i2] 0x88,	%i0
	nop
	set	0x24, %i5
	stw	%i5,	[%l7 + %i5]
	fbug	%fcc3,	loop_2831
	tge	%icc,	0x6
	set	0x44, %l5
	ldsba	[%l7 + %l5] 0x10,	%i0
loop_2831:
	orn	%o3,	%l6,	%i6
	ldsw	[%l7 + 0x24],	%o5
	stw	%l3,	[%l7 + 0x7C]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l2,	0x0276,	%i2
	ldx	[%l7 + 0x48],	%o6
	fandnot1s	%f22,	%f4,	%f13
	edge16l	%g3,	%i7,	%o0
	fbo,a	%fcc3,	loop_2832
	addccc	%l1,	0x0178,	%g7
	fcmpne16	%f0,	%f6,	%o7
	brlez,a	%l5,	loop_2833
loop_2832:
	edge16ln	%o4,	%l0,	%o2
	subc	%i4,	0x0A3F,	%g6
	swap	[%l7 + 0x18],	%g2
loop_2833:
	fmul8sux16	%f28,	%f24,	%f0
	tne	%xcc,	0x1
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%g4
	edge8l	%o1,	%l4,	%g5
	sdivcc	%g1,	0x02CB,	%i1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tcc	%xcc,	0x1
	fnot2s	%f10,	%f7
	bpos,a	loop_2834
	fblg	%fcc1,	loop_2835
	te	%xcc,	0x1
	fbge	%fcc1,	loop_2836
loop_2834:
	sdivcc	%i5,	0x1583,	%i0
loop_2835:
	tcc	%icc,	0x6
	fmovrdlez	%i3,	%f14,	%f0
loop_2836:
	edge32n	%l6,	%o3,	%i6
	popc	0x18C4,	%o5
	tsubcctv	%l2,	%l3,	%o6
	mova	%icc,	%g3,	%i7
	smul	%o0,	0x0BDE,	%i2
	tge	%icc,	0x0
	addcc	%g7,	0x02C7,	%l1
	add	%l5,	0x1B5F,	%o4
	tge	%xcc,	0x6
	fnot2s	%f30,	%f25
	array16	%l0,	%o7,	%o2
	bleu,pn	%xcc,	loop_2837
	fmovd	%f14,	%f10
	srlx	%i4,	%g6,	%g4
	fbo	%fcc2,	loop_2838
loop_2837:
	edge16n	%o1,	%g2,	%g5
	fnand	%f4,	%f30,	%f10
	array16	%g1,	%i1,	%l4
loop_2838:
	movl	%xcc,	%i5,	%i3
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x81
	smulcc	%i0,	%l6,	%i6
	sethi	0x0809,	%o5
	srax	%l2,	0x0C,	%l3
	orcc	%o3,	0x1003,	%o6
	orncc	%g3,	0x101A,	%i7
	edge8	%i2,	%g7,	%l1
	fbn	%fcc3,	loop_2839
	and	%l5,	%o4,	%l0
	st	%f24,	[%l7 + 0x28]
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x38] %asi,	%o7
loop_2839:
	movre	%o2,	%i4,	%g6
	stbar
	fnot2s	%f16,	%f19
	fbge,a	%fcc0,	loop_2840
	add	%o0,	%o1,	%g4
	mova	%icc,	%g2,	%g1
	ba,a	loop_2841
loop_2840:
	std	%f16,	[%l7 + 0x60]
	tne	%icc,	0x3
	xnor	%g5,	%l4,	%i5
loop_2841:
	sethi	0x0586,	%i3
	prefetch	[%l7 + 0x4C],	 0x3
	ldub	[%l7 + 0x1F],	%i1
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x09] %asi,	%i0
	alignaddrl	%i6,	%l6,	%o5
	fbo	%fcc0,	loop_2842
	nop
	setx	loop_2843,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovspos	%icc,	%f10,	%f25
	fble	%fcc2,	loop_2844
loop_2842:
	fbul	%fcc3,	loop_2845
loop_2843:
	edge16	%l2,	%l3,	%o3
	or	%o6,	0x0255,	%i7
loop_2844:
	tl	%xcc,	0x5
loop_2845:
	smul	%g3,	%g7,	%l1
	or	%i2,	%l5,	%l0
	srax	%o7,	0x07,	%o2
	movrlz	%o4,	0x208,	%g6
	fbul	%fcc3,	loop_2846
	ta	%icc,	0x1
	ld	[%l7 + 0x10],	%f26
	fandnot1	%f30,	%f2,	%f26
loop_2846:
	fmovsge	%icc,	%f9,	%f14
	movne	%xcc,	%o0,	%o1
	andcc	%i4,	%g2,	%g1
	tle	%icc,	0x4
	fnor	%f0,	%f24,	%f16
	fmul8x16al	%f23,	%f10,	%f8
	fmovrdgz	%g5,	%f26,	%f20
	bgu,a,pt	%xcc,	loop_2847
	fmovda	%xcc,	%f27,	%f16
	edge16n	%g4,	%l4,	%i5
	ta	%xcc,	0x3
loop_2847:
	edge32l	%i1,	%i0,	%i6
	addcc	%i3,	%l6,	%l2
	movrlz	%l3,	0x2C7,	%o5
	array32	%o6,	%i7,	%o3
	sra	%g3,	%l1,	%g7
	fzero	%f18
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x20] %asi,	%i2
	fmovrslez	%l5,	%f4,	%f27
	fba	%fcc0,	loop_2848
	stbar
	tge	%xcc,	0x6
	addcc	%l0,	%o2,	%o4
loop_2848:
	fcmpd	%fcc0,	%f22,	%f10
	taddcc	%o7,	0x1A29,	%g6
	brlez	%o1,	loop_2849
	orcc	%o0,	%i4,	%g2
	set	0x7C, %o2
	sta	%f29,	[%l7 + %o2] 0x15
loop_2849:
	bl,a	loop_2850
	and	%g1,	0x00A2,	%g4
	orncc	%l4,	0x12E7,	%i5
	alignaddrl	%g5,	%i1,	%i6
loop_2850:
	sllx	%i3,	%i0,	%l2
	fbo,a	%fcc1,	loop_2851
	fmul8sux16	%f14,	%f28,	%f24
	umul	%l3,	0x1906,	%o5
	fnor	%f2,	%f18,	%f16
loop_2851:
	fmovrdlez	%l6,	%f0,	%f24
	edge8	%i7,	%o6,	%o3
	nop
	setx	loop_2852,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnor	%g3,	0x18E3,	%g7
	fbug,a	%fcc1,	loop_2853
	ld	[%l7 + 0x2C],	%f8
loop_2852:
	fxnor	%f18,	%f8,	%f18
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x50] %asi,	%i2
loop_2853:
	array16	%l5,	%l0,	%o2
	tcs	%icc,	0x1
	udivx	%o4,	0x1060,	%o7
	fnegs	%f24,	%f25
	fbue	%fcc2,	loop_2854
	andn	%g6,	%o1,	%o0
	fpadd32	%f4,	%f0,	%f30
	taddcctv	%l1,	%g2,	%g1
loop_2854:
	movge	%icc,	%g4,	%i4
	fmovdge	%xcc,	%f16,	%f22
	fmul8x16al	%f30,	%f22,	%f28
	tcs	%xcc,	0x4
	nop
	setx loop_2855, %l0, %l1
	jmpl %l1, %l4
	fcmpeq32	%f0,	%f24,	%i5
	fpack16	%f24,	%f28
	fmovs	%f15,	%f25
loop_2855:
	fnand	%f10,	%f2,	%f6
	fbe	%fcc2,	loop_2856
	fpmerge	%f14,	%f26,	%f4
	ldsh	[%l7 + 0x18],	%g5
	andncc	%i6,	%i1,	%i3
loop_2856:
	bgu	loop_2857
	srax	%l2,	0x01,	%l3
	tvs	%icc,	0x5
	fandnot1	%f4,	%f12,	%f2
loop_2857:
	bg,a	%xcc,	loop_2858
	fpadd32	%f22,	%f26,	%f24
	fnors	%f20,	%f18,	%f13
	fexpand	%f11,	%f2
loop_2858:
	subcc	%o5,	0x0E66,	%i0
	sra	%l6,	%o6,	%i7
	bn	loop_2859
	tcc	%icc,	0x4
	sra	%g3,	%g7,	%i2
	brgz	%o3,	loop_2860
loop_2859:
	fmovdleu	%xcc,	%f24,	%f12
	bge,a,pn	%xcc,	loop_2861
	nop
	set	0x58, %g4
	std	%f6,	[%l7 + %g4]
loop_2860:
	movcc	%xcc,	%l5,	%l0
	brgz	%o4,	loop_2862
loop_2861:
	fmovscs	%icc,	%f17,	%f30
	fmovdleu	%xcc,	%f12,	%f27
	taddcctv	%o2,	%o7,	%g6
loop_2862:
	stbar
	srlx	%o0,	%l1,	%o1
	movneg	%xcc,	%g2,	%g1
	addccc	%i4,	0x177E,	%g4
	mulscc	%i5,	%l4,	%g5
	fbe,a	%fcc0,	loop_2863
	bcc,a,pn	%xcc,	loop_2864
	sra	%i1,	0x10,	%i6
	be,pn	%icc,	loop_2865
loop_2863:
	mulscc	%l2,	0x0252,	%i3
loop_2864:
	fbne,a	%fcc2,	loop_2866
	movgu	%icc,	%l3,	%o5
loop_2865:
	brlez	%l6,	loop_2867
	xorcc	%o6,	%i0,	%i7
loop_2866:
	movrgez	%g7,	%i2,	%g3
	brz	%l5,	loop_2868
loop_2867:
	sllx	%o3,	0x1F,	%o4
	fba,a	%fcc1,	loop_2869
	tvs	%icc,	0x6
loop_2868:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%l0
loop_2869:
	fmovscs	%icc,	%f29,	%f15
	fbul	%fcc2,	loop_2870
	udiv	%o7,	0x1057,	%o0
	array8	%g6,	%l1,	%o1
	movpos	%xcc,	%g2,	%g1
loop_2870:
	movrgz	%g4,	%i5,	%i4
	movle	%icc,	%l4,	%g5
	udiv	%i1,	0x1E2D,	%i6
	ldd	[%l7 + 0x50],	%l2
	fmovsvc	%icc,	%f13,	%f31
	xnorcc	%i3,	0x02A4,	%o5
	tg	%icc,	0x3
	fbue	%fcc0,	loop_2871
	fmovdcc	%xcc,	%f17,	%f31
	fpsub32	%f4,	%f8,	%f0
	tgu	%xcc,	0x6
loop_2871:
	brz	%l6,	loop_2872
	mova	%xcc,	%o6,	%i0
	fmovsne	%icc,	%f24,	%f1
	edge8	%l3,	%i7,	%i2
loop_2872:
	swap	[%l7 + 0x4C],	%g3
	tcc	%xcc,	0x3
	fcmpne16	%f14,	%f24,	%l5
	fmuld8sux16	%f15,	%f16,	%f28
	stx	%o3,	[%l7 + 0x18]
	set	0x09, %o7
	lduba	[%l7 + %o7] 0x0c,	%o4
	fpadd32	%f0,	%f6,	%f16
	array32	%o2,	%g7,	%o7
	fba,a	%fcc1,	loop_2873
	movcs	%xcc,	%l0,	%o0
	movcs	%icc,	%g6,	%o1
	tvs	%icc,	0x7
loop_2873:
	andn	%g2,	%l1,	%g4
	tpos	%xcc,	0x7
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x16
	membar	#Sync
	movrgez	%g1,	0x1C5,	%i4
	fornot1s	%f11,	%f17,	%f15
	tsubcctv	%i5,	%l4,	%i1
	brgez	%g5,	loop_2874
	xorcc	%l2,	0x0F2B,	%i3
	fnand	%f18,	%f24,	%f18
	fbe,a	%fcc1,	loop_2875
loop_2874:
	prefetch	[%l7 + 0x7C],	 0x2
	fpsub32	%f8,	%f24,	%f6
	udivcc	%i6,	0x07E0,	%o5
loop_2875:
	movleu	%xcc,	%l6,	%o6
	movrlez	%i0,	%l3,	%i7
	udivx	%i2,	0x0C4A,	%g3
	lduw	[%l7 + 0x20],	%o3
	fbge,a	%fcc2,	loop_2876
	sll	%o4,	0x03,	%l5
	tvs	%icc,	0x2
	bvs,a	%xcc,	loop_2877
loop_2876:
	fba,a	%fcc3,	loop_2878
	fmovsa	%xcc,	%f1,	%f16
	edge16	%o2,	%g7,	%l0
loop_2877:
	sdivcc	%o7,	0x1B39,	%o0
loop_2878:
	movg	%xcc,	%o1,	%g6
	fmovs	%f26,	%f14
	movne	%icc,	%g2,	%g4
	call	loop_2879
	edge32l	%g1,	%i4,	%l1
	fba	%fcc0,	loop_2880
	movneg	%icc,	%i5,	%i1
loop_2879:
	movg	%icc,	%g5,	%l2
	tne	%xcc,	0x6
loop_2880:
	xorcc	%i3,	%i6,	%o5
	andcc	%l6,	%o6,	%l4
	edge8l	%l3,	%i0,	%i7
	bn,pt	%icc,	loop_2881
	fbul,a	%fcc1,	loop_2882
	fxor	%f28,	%f10,	%f30
	fmovdn	%icc,	%f15,	%f16
loop_2881:
	movgu	%xcc,	%g3,	%i2
loop_2882:
	udiv	%o3,	0x0288,	%l5
	brgz,a	%o2,	loop_2883
	movre	%g7,	0x173,	%o4
	fzeros	%f15
	smul	%l0,	%o0,	%o1
loop_2883:
	orncc	%g6,	%g2,	%o7
	brnz	%g4,	loop_2884
	edge16	%g1,	%l1,	%i5
	edge8ln	%i4,	%g5,	%i1
	fabss	%f4,	%f11
loop_2884:
	edge16	%i3,	%i6,	%o5
	addccc	%l2,	0x050D,	%l6
	xorcc	%o6,	%l4,	%i0
	set	0x2C, %o1
	ldsha	[%l7 + %o1] 0x14,	%l3
	edge8ln	%g3,	%i2,	%o3
	fpack32	%f10,	%f2,	%f22
	fpsub16	%f12,	%f26,	%f14
	tvc	%icc,	0x6
	fxnor	%f24,	%f30,	%f2
	xnor	%i7,	0x07AF,	%l5
	fmovsgu	%icc,	%f17,	%f16
	fpack32	%f0,	%f2,	%f12
	taddcc	%o2,	0x0909,	%o4
	alignaddr	%g7,	%o0,	%o1
	srlx	%g6,	0x0A,	%l0
	stx	%o7,	[%l7 + 0x10]
	fnot1s	%f9,	%f14
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%g4
	edge16n	%g2,	%l1,	%g1
	edge32	%i5,	%i4,	%g5
	sub	%i1,	%i3,	%i6
	movleu	%xcc,	%l2,	%l6
	sdivx	%o6,	0x09B5,	%o5
	movge	%icc,	%l4,	%i0
	fnot2s	%f17,	%f25
	edge16ln	%g3,	%i2,	%l3
	movpos	%xcc,	%o3,	%i7
	srlx	%l5,	0x04,	%o4
	addcc	%g7,	0x11BF,	%o0
	membar	0x0E
	smulcc	%o2,	%g6,	%o1
	sdiv	%o7,	0x12CE,	%l0
	fbge,a	%fcc0,	loop_2885
	alignaddrl	%g4,	%g2,	%g1
	popc	%l1,	%i5
	fmul8x16	%f6,	%f2,	%f4
loop_2885:
	brgez,a	%g5,	loop_2886
	taddcc	%i4,	0x1027,	%i3
	ldd	[%l7 + 0x18],	%i0
	umul	%i6,	%l6,	%l2
loop_2886:
	brnz	%o6,	loop_2887
	fornot1s	%f18,	%f1,	%f12
	fpack16	%f30,	%f10
	fandnot1	%f4,	%f24,	%f18
loop_2887:
	edge8ln	%o5,	%l4,	%i0
	fsrc1	%f24,	%f22
	tcc	%xcc,	0x1
	nop
	setx loop_2888, %l0, %l1
	jmpl %l1, %i2
	fmovdl	%xcc,	%f0,	%f25
	fmovscs	%icc,	%f14,	%f29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2888:
	tne	%icc,	0x0
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge16ln	%l3,	%g3,	%i7
	set	0x58, %i6
	ldswa	[%l7 + %i6] 0x15,	%o3
	mulx	%l5,	%o4,	%g7
	movcc	%xcc,	%o2,	%g6
	fmovrdne	%o1,	%f16,	%f24
	brgez,a	%o0,	loop_2889
	or	%o7,	%l0,	%g4
	movge	%xcc,	%g1,	%g2
	fbg	%fcc3,	loop_2890
loop_2889:
	bneg,a	loop_2891
	fandnot1	%f30,	%f22,	%f0
	tpos	%xcc,	0x7
loop_2890:
	fcmpgt16	%f20,	%f18,	%i5
loop_2891:
	edge16l	%g5,	%l1,	%i3
	add	%i4,	0x0EB0,	%i6
	edge16	%l6,	%i1,	%l2
	edge32ln	%o6,	%l4,	%i0
	bshuffle	%f14,	%f6,	%f22
	tvc	%icc,	0x1
	fmovsvc	%icc,	%f9,	%f28
	edge32l	%o5,	%l3,	%g3
	fmul8x16al	%f20,	%f8,	%f2
	andn	%i2,	%o3,	%i7
	edge8	%l5,	%g7,	%o4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x60] %asi,	%g6
	ldub	[%l7 + 0x37],	%o2
	edge32ln	%o0,	%o7,	%o1
	sir	0x0731
	edge8l	%l0,	%g1,	%g2
	fmovrsne	%i5,	%f31,	%f19
	tpos	%xcc,	0x7
	nop
	setx	loop_2892,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x0B56,	%g5
	fxor	%f8,	%f8,	%f14
	edge32ln	%g4,	%l1,	%i3
loop_2892:
	taddcc	%i4,	0x1D86,	%l6
	fcmple16	%f24,	%f8,	%i6
	popc	%i1,	%o6
	tge	%icc,	0x6
	tvc	%icc,	0x5
	sdiv	%l4,	0x013D,	%i0
	movvs	%icc,	%l2,	%l3
	fcmpes	%fcc0,	%f9,	%f24
	umul	%g3,	0x013B,	%i2
	srlx	%o5,	%o3,	%i7
	fpsub16	%f12,	%f20,	%f14
	fmovrslz	%g7,	%f5,	%f2
	stx	%o4,	[%l7 + 0x78]
	sth	%l5,	[%l7 + 0x1A]
	fmovs	%f16,	%f5
	umul	%o2,	0x0782,	%o0
	tge	%icc,	0x1
	xnor	%o7,	%o1,	%g6
	movrgz	%l0,	0x01C,	%g1
	edge8n	%g2,	%g5,	%i5
	tpos	%icc,	0x5
	andcc	%l1,	%i3,	%g4
	fmovsge	%icc,	%f9,	%f21
	fpsub32s	%f24,	%f9,	%f3
	movrne	%l6,	%i6,	%i1
	fmul8x16al	%f24,	%f11,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f0,	%f12,	%f4
	wr	%g0,	0x89,	%asi
	stda	%o6,	[%l7 + 0x60] %asi
	array16	%l4,	%i0,	%i4
	movre	%l3,	0x2C8,	%l2
	movrne	%g3,	%i2,	%o3
	fbg,a	%fcc3,	loop_2893
	tne	%icc,	0x2
	fbue	%fcc3,	loop_2894
	edge32l	%o5,	%g7,	%i7
loop_2893:
	nop
	set	0x5C, %l3
	stba	%l5,	[%l7 + %l3] 0x10
loop_2894:
	edge16	%o2,	%o0,	%o7
	tl	%xcc,	0x4
	taddcctv	%o4,	%o1,	%l0
	movleu	%xcc,	%g6,	%g1
	tgu	%xcc,	0x1
	ldub	[%l7 + 0x7B],	%g5
	ldd	[%l7 + 0x60],	%f30
	tge	%xcc,	0x0
	fmovsne	%icc,	%f24,	%f23
	fmovrslez	%g2,	%f25,	%f14
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0x21,	%asi
	stxa	%i5,	[%g0 + 0x108] %asi
	nop
	set	0x48, %o0
	ldsh	[%l7 + %o0],	%l1
	ta	%xcc,	0x2
	edge32ln	%g4,	%l6,	%i6
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x58] %asi,	%i1
	set	0x40, %o5
	stda	%o6,	[%l7 + %o5] 0xeb
	membar	#Sync
	fbu	%fcc3,	loop_2895
	nop
	setx	loop_2896,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tle	%icc,	0x1
	set	0x50, %g6
	ldxa	[%l7 + %g6] 0x18,	%l4
loop_2895:
	fbug	%fcc2,	loop_2897
loop_2896:
	xorcc	%i0,	0x12F9,	%i3
	sth	%i4,	[%l7 + 0x44]
	edge16n	%l2,	%g3,	%l3
loop_2897:
	fexpand	%f27,	%f6
	fpsub32s	%f29,	%f26,	%f4
	bn,a,pn	%icc,	loop_2898
	fcmpne32	%f24,	%f6,	%i2
	array16	%o3,	%o5,	%g7
	sra	%l5,	%o2,	%i7
loop_2898:
	udiv	%o7,	0x1ADA,	%o4
	xnor	%o1,	0x05F9,	%o0
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fbn,a	%fcc2,	loop_2899
	fmul8x16	%f30,	%f24,	%f26
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%g6
loop_2899:
	fmovda	%xcc,	%f26,	%f25
	tgu	%xcc,	0x4
	ldub	[%l7 + 0x14],	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g5,	%g2
	nop
	set	0x60, %g2
	std	%f4,	[%l7 + %g2]
	movn	%icc,	%l0,	%i5
	fblg,a	%fcc3,	loop_2900
	edge32ln	%g4,	%l1,	%l6
	tge	%icc,	0x3
	mulscc	%i1,	%o6,	%i6
loop_2900:
	fbg,a	%fcc2,	loop_2901
	ldx	[%l7 + 0x50],	%l4
	movrgez	%i3,	0x29F,	%i0
	srax	%i4,	%g3,	%l3
loop_2901:
	call	loop_2902
	subc	%l2,	%i2,	%o3
	tsubcc	%g7,	%o5,	%l5
	tcs	%xcc,	0x1
loop_2902:
	ldx	[%l7 + 0x38],	%i7
	fmul8x16al	%f6,	%f18,	%f22
	fbg	%fcc1,	loop_2903
	tn	%xcc,	0x7
	edge8	%o2,	%o7,	%o4
	fmovrsgez	%o0,	%f12,	%f19
loop_2903:
	nop
	wr	%g0,	0xeb,	%asi
	stha	%g6,	[%l7 + 0x48] %asi
	membar	#Sync
	fbule	%fcc2,	loop_2904
	nop
	setx	loop_2905,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movne	%xcc,	%g1,	%g5
	movre	%g2,	0x33E,	%l0
loop_2904:
	fmuld8sux16	%f20,	%f24,	%f6
loop_2905:
	movl	%xcc,	%o1,	%i5
	smulcc	%l1,	0x16AB,	%l6
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x20] %asi,	%g4
	bneg	%xcc,	loop_2906
	fandnot2s	%f12,	%f31,	%f7
	fmovsl	%xcc,	%f21,	%f28
	movgu	%xcc,	%o6,	%i6
loop_2906:
	movgu	%icc,	%i1,	%l4
	srlx	%i3,	%i0,	%g3
	taddcc	%i4,	%l2,	%l3
	fnot1s	%f12,	%f18
	movne	%icc,	%o3,	%i2
	tg	%icc,	0x4
	orncc	%o5,	0x0EB7,	%g7
	wr	%g0,	0x89,	%asi
	sta	%f0,	[%l7 + 0x44] %asi
	tle	%xcc,	0x6
	subc	%i7,	%o2,	%o7
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l5,	%o0
	tsubcc	%g6,	0x124D,	%o4
	tge	%xcc,	0x2
	edge8l	%g1,	%g5,	%l0
	fmovdgu	%xcc,	%f24,	%f26
	fsrc1	%f4,	%f20
	fbl,a	%fcc3,	loop_2907
	bleu	%xcc,	loop_2908
	edge32ln	%g2,	%o1,	%l1
	stbar
loop_2907:
	sllx	%i5,	0x0A,	%g4
loop_2908:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	ldsh	[%l7 + 0x42],	%l6
	fmuld8sux16	%f11,	%f27,	%f14
	movpos	%xcc,	%o6,	%i1
	fsrc2	%f8,	%f28
	bge,a	loop_2909
	popc	%l4,	%i6
	mulx	%i0,	%i3,	%g3
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x70] %asi,	%i4
loop_2909:
	tgu	%xcc,	0x6
	fpack32	%f26,	%f8,	%f6
	sethi	0x051C,	%l2
	movrgz	%o3,	%i2,	%o5
	tcc	%icc,	0x6
	brlez	%g7,	loop_2910
	sub	%l3,	%o2,	%i7
	addc	%l5,	%o7,	%g6
	movne	%icc,	%o0,	%g1
loop_2910:
	edge8n	%g5,	%o4,	%l0
	wr	%g0,	0x11,	%asi
	sta	%f14,	[%l7 + 0x70] %asi
	edge32l	%o1,	%g2,	%i5
	te	%icc,	0x3
	tcs	%xcc,	0x5
	bvs,pt	%xcc,	loop_2911
	fcmps	%fcc1,	%f17,	%f24
	tl	%xcc,	0x2
	umulcc	%l1,	%l6,	%o6
loop_2911:
	fblg,a	%fcc3,	loop_2912
	fxnors	%f29,	%f28,	%f26
	sub	%g4,	0x0282,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2912:
	bleu,a	loop_2913
	movpos	%xcc,	%i6,	%i0
	bpos,a	%xcc,	loop_2914
	movvs	%xcc,	%i1,	%g3
loop_2913:
	ldd	[%l7 + 0x48],	%f12
	tge	%xcc,	0x6
loop_2914:
	addc	%i4,	%i3,	%o3
	tn	%xcc,	0x5
	fcmpne32	%f12,	%f0,	%l2
	fmovde	%icc,	%f31,	%f12
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge16n	%i2,	%g7,	%o5
	movvs	%icc,	%o2,	%i7
	xor	%l3,	%l5,	%o7
	array32	%g6,	%g1,	%g5
	srl	%o0,	0x02,	%o4
	edge8l	%l0,	%g2,	%i5
	tleu	%icc,	0x3
	fnor	%f30,	%f12,	%f20
	fnors	%f13,	%f8,	%f2
	andncc	%o1,	%l1,	%o6
	edge16l	%g4,	%l4,	%i6
	xnor	%l6,	0x1F0A,	%i0
	array32	%g3,	%i4,	%i3
	fmovse	%xcc,	%f9,	%f4
	movcs	%icc,	%o3,	%l2
	bcs,a,pt	%icc,	loop_2915
	movrne	%i1,	0x2DA,	%i2
	fbul,a	%fcc0,	loop_2916
	edge16ln	%g7,	%o2,	%i7
loop_2915:
	orn	%l3,	%l5,	%o7
	movgu	%icc,	%g6,	%o5
loop_2916:
	fbg	%fcc2,	loop_2917
	sir	0x1E3C
	edge16n	%g5,	%o0,	%g1
	fcmped	%fcc0,	%f22,	%f22
loop_2917:
	sdivx	%l0,	0x0012,	%o4
	brgez,a	%i5,	loop_2918
	fcmps	%fcc0,	%f0,	%f4
	fmovrdgz	%o1,	%f0,	%f16
	ldd	[%l7 + 0x20],	%g2
loop_2918:
	movrne	%l1,	0x0EA,	%o6
	bleu,a	%icc,	loop_2919
	fbe,a	%fcc2,	loop_2920
	edge8	%l4,	%g4,	%i6
	brgz	%i0,	loop_2921
loop_2919:
	flush	%l7 + 0x44
loop_2920:
	fmovse	%xcc,	%f21,	%f18
	tge	%xcc,	0x3
loop_2921:
	membar	0x33
	tsubcctv	%l6,	%g3,	%i4
	xorcc	%i3,	0x05D5,	%l2
	wr	%g0,	0xe3,	%asi
	stda	%o2,	[%l7 + 0x08] %asi
	membar	#Sync
	edge8	%i2,	%g7,	%o2
	sll	%i7,	%l3,	%i1
	movne	%xcc,	%o7,	%g6
	or	%l5,	0x0420,	%o5
	membar	0x33
	membar	0x09
	movl	%icc,	%g5,	%o0
	udiv	%l0,	0x16C4,	%g1
	and	%i5,	%o1,	%o4
	fmovscc	%icc,	%f2,	%f17
	tgu	%icc,	0x7
	sir	0x122B
	tvc	%icc,	0x0
	fxnors	%f1,	%f1,	%f8
	addcc	%g2,	%l1,	%o6
	sdivx	%l4,	0x0045,	%i6
	fbg,a	%fcc2,	loop_2922
	fnor	%f16,	%f8,	%f16
	udiv	%g4,	0x13C3,	%l6
	tne	%xcc,	0x0
loop_2922:
	umul	%i0,	%g3,	%i3
	tcs	%xcc,	0x3
	tpos	%icc,	0x4
	subc	%l2,	0x1DBD,	%i4
	array8	%o3,	%i2,	%o2
	subccc	%g7,	0x0D5B,	%i7
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x68] %asi,	%l3
	movg	%icc,	%i1,	%o7
	fmovdleu	%icc,	%f31,	%f8
	srl	%l5,	0x16,	%g6
	edge8ln	%g5,	%o5,	%l0
	add	%g1,	%o0,	%i5
	fnands	%f18,	%f28,	%f8
	movge	%xcc,	%o1,	%g2
	fpackfix	%f4,	%f29
	subccc	%o4,	0x17C7,	%l1
	fmovdl	%icc,	%f3,	%f2
	add	%o6,	0x0DFA,	%l4
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x24] %asi,	%i6
	edge8l	%l6,	%i0,	%g3
	movrgez	%g4,	%l2,	%i4
	array8	%o3,	%i3,	%o2
	movleu	%xcc,	%g7,	%i2
	fandnot1	%f16,	%f12,	%f12
	ldd	[%l7 + 0x70],	%l2
	stbar
	fmovrde	%i7,	%f26,	%f2
	addccc	%i1,	%l5,	%g6
	fcmpne32	%f10,	%f12,	%o7
	subccc	%o5,	%l0,	%g1
	mulx	%o0,	%g5,	%i5
	bne,pn	%xcc,	loop_2923
	taddcc	%g2,	%o1,	%l1
	fnors	%f13,	%f19,	%f28
	mulx	%o4,	0x12B7,	%l4
loop_2923:
	lduw	[%l7 + 0x34],	%i6
	array8	%o6,	%i0,	%l6
	fxnor	%f0,	%f6,	%f8
	movgu	%xcc,	%g4,	%l2
	brlez,a	%i4,	loop_2924
	tne	%xcc,	0x6
	subccc	%o3,	0x1A53,	%g3
	tleu	%xcc,	0x1
loop_2924:
	xor	%o2,	0x0759,	%i3
	xnorcc	%i2,	0x0CD4,	%g7
	nop
	set	0x68, %g3
	stb	%i7,	[%l7 + %g3]
	udivcc	%l3,	0x1E41,	%i1
	te	%xcc,	0x0
	mulscc	%l5,	%o7,	%g6
	ldsb	[%l7 + 0x27],	%o5
	mulscc	%l0,	%o0,	%g5
	bneg,a	loop_2925
	movre	%i5,	%g1,	%g2
	or	%o1,	0x0BB2,	%l1
	for	%f16,	%f14,	%f30
loop_2925:
	addcc	%o4,	%i6,	%o6
	tl	%icc,	0x5
	taddcc	%i0,	%l4,	%l6
	andn	%g4,	0x1857,	%i4
	or	%o3,	%g3,	%l2
	fble,a	%fcc3,	loop_2926
	fmovrsgz	%i3,	%f9,	%f19
	flush	%l7 + 0x40
	brgez	%i2,	loop_2927
loop_2926:
	fbne	%fcc0,	loop_2928
	brgz,a	%o2,	loop_2929
	fmovde	%xcc,	%f29,	%f30
loop_2927:
	tge	%icc,	0x4
loop_2928:
	fmovsl	%icc,	%f4,	%f15
loop_2929:
	tsubcc	%g7,	0x1346,	%i7
	tleu	%icc,	0x3
	andncc	%l3,	%l5,	%i1
	tne	%icc,	0x4
	fmovsgu	%xcc,	%f4,	%f9
	taddcctv	%o7,	%g6,	%o5
	fbul,a	%fcc3,	loop_2930
	udivx	%o0,	0x0809,	%l0
	pdist	%f28,	%f22,	%f4
	and	%i5,	0x0338,	%g5
loop_2930:
	tgu	%icc,	0x5
	movne	%xcc,	%g1,	%g2
	movne	%xcc,	%o1,	%o4
	tcc	%icc,	0x6
	st	%f11,	[%l7 + 0x3C]
	fpadd16s	%f15,	%f2,	%f25
	fpmerge	%f24,	%f11,	%f24
	srlx	%i6,	%o6,	%l1
	stbar
	prefetch	[%l7 + 0x14],	 0x0
	edge16n	%i0,	%l6,	%g4
	movrne	%i4,	0x324,	%o3
	mova	%icc,	%g3,	%l4
	bn	loop_2931
	mova	%xcc,	%i3,	%l2
	fba,a	%fcc2,	loop_2932
	movvs	%xcc,	%i2,	%g7
loop_2931:
	movrlz	%o2,	%l3,	%i7
	udivx	%i1,	0x085F,	%o7
loop_2932:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%g6,	%l5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%o5
	sllx	%i5,	%l0,	%g5
	movge	%xcc,	%g2,	%o1
	edge8	%g1,	%i6,	%o6
	orcc	%l1,	0x0B6C,	%i0
	ldstub	[%l7 + 0x3D],	%o4
	ble,pt	%icc,	loop_2933
	tg	%icc,	0x5
	set	0x24, %i3
	lda	[%l7 + %i3] 0x14,	%f13
loop_2933:
	array32	%g4,	%i4,	%o3
	fcmpeq32	%f16,	%f28,	%g3
	prefetch	[%l7 + 0x3C],	 0x0
	xnor	%l6,	0x1EB7,	%i3
	tle	%xcc,	0x4
	tg	%xcc,	0x3
	movn	%icc,	%l2,	%l4
	fnegd	%f6,	%f14
	fcmps	%fcc3,	%f1,	%f19
	edge16ln	%g7,	%o2,	%i2
	nop
	setx loop_2934, %l0, %l1
	jmpl %l1, %l3
	movrlz	%i7,	0x3F4,	%i1
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x0c,	 0x0
loop_2934:
	nop
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
	prefetch	[%l7 + 0x40],	 0x1
	movrgz	%o0,	0x025,	%o5
	bleu,a,pn	%icc,	loop_2935
	subc	%i5,	%o7,	%g5
	ldsb	[%l7 + 0x3A],	%g2
	bshuffle	%f2,	%f2,	%f18
loop_2935:
	mova	%icc,	%o1,	%l0
	movneg	%xcc,	%g1,	%o6
	movne	%xcc,	%l1,	%i6
	movgu	%xcc,	%i0,	%o4
	sir	0x19D2
	movgu	%xcc,	%i4,	%o3
	brgez,a	%g3,	loop_2936
	movge	%xcc,	%l6,	%i3
	movvs	%xcc,	%l2,	%l4
	movgu	%xcc,	%g7,	%o2
loop_2936:
	fble,a	%fcc2,	loop_2937
	fpadd16	%f20,	%f16,	%f16
	fmovsa	%icc,	%f26,	%f6
	add	%g4,	%l3,	%i7
loop_2937:
	fnands	%f31,	%f2,	%f5
	mulscc	%i1,	%i2,	%l5
	xnor	%o0,	0x0BE7,	%g6
	edge16n	%i5,	%o5,	%g5
	sdivcc	%o7,	0x182C,	%o1
	membar	0x22
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x78] %asi,	%g2
	srax	%g1,	%o6,	%l0
	tg	%icc,	0x6
	nop
	setx	loop_2938,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fba,a	%fcc3,	loop_2939
	ldub	[%l7 + 0x39],	%l1
	xnor	%i0,	0x155E,	%o4
loop_2938:
	bge,pt	%xcc,	loop_2940
loop_2939:
	bgu	%icc,	loop_2941
	movrgez	%i6,	%i4,	%g3
	fcmpeq16	%f24,	%f16,	%l6
loop_2940:
	movneg	%icc,	%i3,	%l2
loop_2941:
	ldsh	[%l7 + 0x18],	%l4
	array16	%o3,	%g7,	%g4
	andcc	%o2,	%l3,	%i1
	nop
	setx loop_2942, %l0, %l1
	jmpl %l1, %i2
	and	%l5,	0x1FF5,	%i7
	fandnot1s	%f19,	%f24,	%f6
	movn	%icc,	%o0,	%g6
loop_2942:
	edge32n	%o5,	%g5,	%i5
	fpsub32	%f10,	%f20,	%f24
	set	0x78, %i0
	ldxa	[%l7 + %i0] 0x80,	%o1
	fmovrde	%o7,	%f14,	%f6
	bn,pt	%xcc,	loop_2943
	fmul8sux16	%f6,	%f8,	%f18
	stbar
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x18,	%g2,	%g1
loop_2943:
	addccc	%l0,	0x1241,	%o6
	edge8l	%l1,	%i0,	%o4
	or	%i4,	0x1241,	%i6
	fba,a	%fcc3,	loop_2944
	movg	%xcc,	%l6,	%i3
	array16	%l2,	%g3,	%l4
	fmovdl	%xcc,	%f22,	%f13
loop_2944:
	nop
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x04
	movge	%xcc,	%g7,	%g4
	popc	0x1D62,	%o3
	xorcc	%o2,	%i1,	%i2
	membar	0x76
	fmovdgu	%xcc,	%f16,	%f3
	membar	0x0C
	tcc	%icc,	0x4
	sethi	0x1299,	%l3
	be,a	loop_2945
	movvc	%xcc,	%l5,	%i7
	wr	%g0,	0xeb,	%asi
	stba	%g6,	[%l7 + 0x3E] %asi
	membar	#Sync
loop_2945:
	srlx	%o5,	0x12,	%o0
	popc	%i5,	%o1
	fmuld8ulx16	%f7,	%f19,	%f4
	movvc	%icc,	%g5,	%g2
	be,a	loop_2946
	fmovdg	%icc,	%f16,	%f28
	fmovrsgz	%o7,	%f0,	%f14
	fbne	%fcc1,	loop_2947
loop_2946:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%g1,	%l0,	%l1
	ldub	[%l7 + 0x4C],	%i0
loop_2947:
	siam	0x4
	bne,a	%icc,	loop_2948
	movneg	%xcc,	%o6,	%o4
	sdivx	%i6,	0x050F,	%l6
	udivcc	%i4,	0x028B,	%l2
loop_2948:
	fxor	%f16,	%f6,	%f28
	addccc	%g3,	%l4,	%i3
	addc	%g7,	0x1835,	%o3
	edge8n	%g4,	%i1,	%i2
	tle	%xcc,	0x1
	movrgz	%l3,	0x343,	%l5
	srlx	%o2,	0x00,	%i7
	xnor	%o5,	%g6,	%i5
	movne	%xcc,	%o0,	%o1
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x20] %asi,	%g2
	fone	%f20
	tge	%icc,	0x2
	fornot2s	%f21,	%f4,	%f24
	udivcc	%o7,	0x07F9,	%g1
	ldsb	[%l7 + 0x4F],	%g5
	tn	%xcc,	0x2
	subcc	%l1,	%i0,	%l0
	srax	%o4,	%o6,	%i6
	edge16ln	%i4,	%l6,	%l2
	movn	%icc,	%g3,	%l4
	udiv	%g7,	0x108A,	%i3
	movle	%xcc,	%o3,	%g4
	sethi	0x1E0D,	%i1
	nop
	setx	loop_2949,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcs	%icc,	%i2,	%l3
	tcs	%icc,	0x2
	swap	[%l7 + 0x08],	%o2
loop_2949:
	fexpand	%f2,	%f0
	fba,a	%fcc3,	loop_2950
	nop
	set	0x5C, %i7
	prefetch	[%l7 + %i7],	 0x1
	fba	%fcc0,	loop_2951
	fones	%f28
loop_2950:
	bl,a	%icc,	loop_2952
	smulcc	%i7,	%o5,	%g6
loop_2951:
	tsubcc	%l5,	%o0,	%o1
	movl	%xcc,	%g2,	%i5
loop_2952:
	prefetch	[%l7 + 0x18],	 0x3
	sethi	0x1181,	%g1
	mulx	%o7,	%g5,	%l1
	sdiv	%i0,	0x0E08,	%o4
	udivx	%l0,	0x11C7,	%o6
	bcc	%xcc,	loop_2953
	andncc	%i6,	%i4,	%l2
	addccc	%g3,	0x0ECC,	%l6
	fsrc2s	%f18,	%f23
loop_2953:
	tne	%xcc,	0x1
	sra	%l4,	0x1F,	%g7
	or	%o3,	0x0385,	%g4
	fmovscs	%xcc,	%f6,	%f23
	movgu	%icc,	%i1,	%i3
	fbl,a	%fcc3,	loop_2954
	movrne	%i2,	%l3,	%o2
	umul	%o5,	%g6,	%i7
	tpos	%icc,	0x3
loop_2954:
	tn	%xcc,	0x1
	stx	%l5,	[%l7 + 0x50]
	fmovdn	%xcc,	%f22,	%f7
	srlx	%o0,	%o1,	%g2
	movle	%icc,	%i5,	%o7
	fmuld8ulx16	%f30,	%f6,	%f8
	sllx	%g1,	0x13,	%g5
	movn	%xcc,	%i0,	%l1
	flush	%l7 + 0x1C
	umulcc	%o4,	0x1698,	%l0
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x56] %asi,	%i6
	srl	%o6,	%l2,	%i4
	mova	%icc,	%l6,	%l4
	movpos	%xcc,	%g7,	%o3
	alignaddr	%g3,	%g4,	%i1
	movvc	%icc,	%i3,	%i2
	set	0x56, %g1
	stha	%l3,	[%l7 + %g1] 0x2f
	membar	#Sync
	movgu	%icc,	%o5,	%o2
	brgz,a	%g6,	loop_2955
	fors	%f6,	%f4,	%f14
	set	0x2C, %l6
	swapa	[%l7 + %l6] 0x0c,	%l5
loop_2955:
	subccc	%i7,	0x1B80,	%o1
	sethi	0x199F,	%g2
	fmovdne	%icc,	%f28,	%f0
	movpos	%xcc,	%o0,	%o7
	bpos	loop_2956
	movpos	%xcc,	%g1,	%g5
	movn	%xcc,	%i5,	%l1
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%i0
loop_2956:
	nop
	setx	loop_2957,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16	%l0,	%i6,	%o4
	fbg	%fcc2,	loop_2958
	bvs	loop_2959
loop_2957:
	fmovrdlz	%l2,	%f2,	%f0
	andn	%o6,	0x0A92,	%l6
loop_2958:
	fandnot1	%f18,	%f14,	%f4
loop_2959:
	fcmple32	%f8,	%f4,	%l4
	tneg	%icc,	0x1
	sra	%g7,	%o3,	%g3
	udiv	%g4,	0x0484,	%i4
	alignaddrl	%i1,	%i2,	%l3
	tsubcc	%i3,	0x18F6,	%o2
	fandnot2s	%f10,	%f27,	%f24
	fnands	%f1,	%f0,	%f13
	ldsb	[%l7 + 0x0E],	%g6
	fxor	%f4,	%f30,	%f30
	fble	%fcc1,	loop_2960
	ta	%xcc,	0x4
	lduw	[%l7 + 0x74],	%o5
	brgz	%i7,	loop_2961
loop_2960:
	subccc	%o1,	0x1AC1,	%g2
	sdiv	%l5,	0x16F1,	%o0
	xnorcc	%o7,	0x0093,	%g5
loop_2961:
	orn	%g1,	0x0CDA,	%i5
	array8	%l1,	%l0,	%i0
	fnot1	%f14,	%f2
	te	%xcc,	0x2
	bvc,a	%icc,	loop_2962
	andcc	%o4,	%i6,	%o6
	tcc	%icc,	0x7
	sth	%l2,	[%l7 + 0x1C]
loop_2962:
	fmovdpos	%icc,	%f22,	%f17
	edge8l	%l4,	%l6,	%o3
	tsubcctv	%g7,	%g3,	%i4
	fpadd32s	%f9,	%f4,	%f16
	movcs	%icc,	%i1,	%i2
	fabss	%f2,	%f21
	fsrc2s	%f22,	%f28
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x50] %asi,	%l3
	smulcc	%i3,	0x0FD9,	%g4
	be,a	%icc,	loop_2963
	stw	%g6,	[%l7 + 0x70]
	movge	%icc,	%o2,	%o5
	fcmple16	%f8,	%f20,	%i7
loop_2963:
	faligndata	%f0,	%f20,	%f10
	srlx	%o1,	0x1E,	%l5
	ldsw	[%l7 + 0x34],	%g2
	tne	%icc,	0x4
	edge16	%o0,	%o7,	%g1
	or	%g5,	0x0756,	%i5
	movrlz	%l0,	%l1,	%o4
	edge16	%i0,	%i6,	%o6
	udivx	%l2,	0x1281,	%l6
	edge8	%l4,	%g7,	%o3
	umul	%i4,	0x183F,	%g3
	fmovsgu	%icc,	%f25,	%f2
	mulscc	%i1,	%i2,	%l3
	fsrc2s	%f16,	%f14
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x68] %asi,	%g4
	udiv	%i3,	0x1517,	%o2
	nop
	set	0x7D, %g7
	ldstub	[%l7 + %g7],	%o5
	sdivcc	%g6,	0x1B8F,	%o1
	tpos	%xcc,	0x3
	fmovrdgz	%l5,	%f20,	%f4
	fsrc2s	%f18,	%f16
	fbu,a	%fcc2,	loop_2964
	lduh	[%l7 + 0x56],	%g2
	tvs	%icc,	0x4
	mulscc	%i7,	0x0F73,	%o0
loop_2964:
	edge16l	%o7,	%g5,	%g1
	edge16n	%i5,	%l0,	%l1
	movvs	%icc,	%o4,	%i0
	tsubcc	%o6,	%l2,	%l6
	movge	%xcc,	%i6,	%l4
	fmul8x16	%f11,	%f30,	%f28
	edge8l	%g7,	%i4,	%o3
	fbue	%fcc0,	loop_2965
	fble,a	%fcc0,	loop_2966
	tsubcc	%g3,	%i2,	%i1
	fba	%fcc2,	loop_2967
loop_2965:
	movvc	%xcc,	%l3,	%i3
loop_2966:
	udivcc	%o2,	0x0CFC,	%g4
	fbue	%fcc2,	loop_2968
loop_2967:
	umulcc	%g6,	%o5,	%l5
	fornot2	%f30,	%f0,	%f20
	movleu	%xcc,	%g2,	%o1
loop_2968:
	andcc	%o0,	%o7,	%g5
	fbo	%fcc0,	loop_2969
	edge32ln	%i7,	%i5,	%l0
	movgu	%icc,	%l1,	%o4
	movl	%icc,	%g1,	%o6
loop_2969:
	popc	0x1771,	%i0
	tsubcc	%l6,	0x0AD3,	%i6
	call	loop_2970
	taddcctv	%l4,	0x0F96,	%l2
	set	0x78, %g5
	swapa	[%l7 + %g5] 0x89,	%g7
loop_2970:
	movrlz	%o3,	%g3,	%i2
	andcc	%i4,	%i1,	%l3
	bge,a	loop_2971
	fand	%f22,	%f14,	%f6
	andcc	%i3,	0x1C63,	%g4
	ta	%xcc,	0x5
loop_2971:
	fmovsleu	%icc,	%f20,	%f26
	andncc	%o2,	%g6,	%l5
	tg	%icc,	0x6
	tgu	%icc,	0x0
	fnand	%f26,	%f26,	%f6
	fbe	%fcc2,	loop_2972
	xorcc	%o5,	0x0968,	%g2
	fpsub16s	%f27,	%f23,	%f20
	movg	%xcc,	%o1,	%o7
loop_2972:
	nop
	set	0x40, %l4
	ldxa	[%l7 + %l4] 0x18,	%g5
	srl	%o0,	0x17,	%i5
	fcmped	%fcc3,	%f22,	%f26
	edge16	%l0,	%l1,	%i7
	movrne	%g1,	%o4,	%i0
	edge32l	%l6,	%o6,	%i6
	tg	%icc,	0x4
	fcmple32	%f6,	%f4,	%l2
	bg,pn	%icc,	loop_2973
	fbge,a	%fcc0,	loop_2974
	sll	%g7,	0x1D,	%l4
	fsrc1	%f24,	%f24
loop_2973:
	fmovrdgz	%g3,	%f18,	%f0
loop_2974:
	movcs	%icc,	%i2,	%i4
	set	0x10, %o6
	ldxa	[%l7 + %o6] 0x18,	%o3
	fbug,a	%fcc0,	loop_2975
	and	%i1,	%l3,	%i3
	edge8	%o2,	%g4,	%l5
	move	%icc,	%g6,	%o5
loop_2975:
	subcc	%g2,	0x1236,	%o1
	fmovdcs	%icc,	%f12,	%f7
	alignaddr	%o7,	%o0,	%g5
	bvs,a,pt	%xcc,	loop_2976
	array16	%i5,	%l0,	%i7
	set	0x57, %i4
	ldsba	[%l7 + %i4] 0x14,	%l1
loop_2976:
	stx	%g1,	[%l7 + 0x18]
	te	%icc,	0x3
	fabsd	%f6,	%f2
	fxnor	%f26,	%f6,	%f24
	srl	%o4,	%i0,	%o6
	mulscc	%l6,	0x0E6E,	%l2
	stw	%g7,	[%l7 + 0x3C]
	brlz,a	%i6,	loop_2977
	movle	%xcc,	%g3,	%i2
	udivx	%i4,	0x1413,	%l4
	movgu	%xcc,	%o3,	%l3
loop_2977:
	edge8	%i3,	%o2,	%i1
	sdiv	%l5,	0x0AD3,	%g6
	fmovsle	%icc,	%f7,	%f10
	movgu	%icc,	%o5,	%g4
	movrlez	%g2,	0x27C,	%o1
	fmovda	%xcc,	%f5,	%f22
	orncc	%o0,	%o7,	%i5
	bl,a,pt	%icc,	loop_2978
	sdiv	%g5,	0x19FB,	%l0
	fpsub32	%f0,	%f12,	%f4
	edge16ln	%l1,	%i7,	%g1
loop_2978:
	movpos	%xcc,	%i0,	%o6
	fmuld8sux16	%f22,	%f7,	%f28
	fcmped	%fcc3,	%f24,	%f28
	tneg	%xcc,	0x2
	andncc	%o4,	%l6,	%g7
	tpos	%icc,	0x7
	edge32	%l2,	%g3,	%i2
	te	%icc,	0x5
	edge16l	%i4,	%i6,	%o3
	tvs	%xcc,	0x4
	tcs	%icc,	0x7
	bge,pt	%icc,	loop_2979
	te	%icc,	0x3
	fxor	%f22,	%f22,	%f12
	fsrc2	%f6,	%f2
loop_2979:
	smulcc	%l4,	%l3,	%o2
	smulcc	%i3,	0x1621,	%l5
	fcmpd	%fcc3,	%f12,	%f20
	fmovrdlez	%g6,	%f2,	%f12
	udivcc	%i1,	0x1B3B,	%o5
	movrgez	%g2,	0x34C,	%g4
	fmovrslz	%o0,	%f27,	%f22
	fmovspos	%icc,	%f29,	%f22
	bpos,a	loop_2980
	be,a,pt	%xcc,	loop_2981
	tne	%icc,	0x0
	fmovdleu	%xcc,	%f8,	%f29
loop_2980:
	fmovd	%f6,	%f12
loop_2981:
	nop
	wr	%g0,	0xe3,	%asi
	stba	%o1,	[%l7 + 0x6D] %asi
	membar	#Sync
	sdiv	%i5,	0x016D,	%g5
	movle	%xcc,	%o7,	%l0
	fbuge	%fcc3,	loop_2982
	brlz	%i7,	loop_2983
	tle	%icc,	0x0
	fmovrdlez	%l1,	%f4,	%f20
loop_2982:
	movrlz	%g1,	%o6,	%o4
loop_2983:
	udiv	%i0,	0x020E,	%l6
	bgu,a	%xcc,	loop_2984
	edge32ln	%l2,	%g3,	%i2
	movge	%icc,	%g7,	%i4
	tvc	%xcc,	0x6
loop_2984:
	array32	%o3,	%l4,	%l3
	umulcc	%i6,	%i3,	%l5
	and	%o2,	%i1,	%o5
	andcc	%g2,	%g4,	%g6
	movge	%xcc,	%o0,	%o1
	array32	%i5,	%o7,	%l0
	fnot2s	%f3,	%f27
	taddcc	%g5,	0x0650,	%i7
	srlx	%g1,	0x14,	%l1
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x28] %asi,	%o6
	or	%o4,	0x1BE9,	%i0
	xor	%l2,	0x0244,	%g3
	edge32	%i2,	%l6,	%i4
	movne	%xcc,	%o3,	%g7
	fnand	%f6,	%f14,	%f20
	fmovdneg	%xcc,	%f4,	%f22
	fmovd	%f24,	%f2
	tne	%icc,	0x3
	fmovrdlez	%l4,	%f14,	%f22
	udivx	%l3,	0x0693,	%i6
	tgu	%icc,	0x3
	tg	%icc,	0x6
	tleu	%icc,	0x4
	movvs	%icc,	%l5,	%o2
	xor	%i3,	0x1650,	%i1
	fors	%f29,	%f14,	%f17
	sethi	0x0E7C,	%g2
	fornot1	%f0,	%f18,	%f0
	move	%icc,	%o5,	%g4
	be,pt	%xcc,	loop_2985
	tg	%xcc,	0x6
	fbo,a	%fcc0,	loop_2986
	fmovdvs	%icc,	%f24,	%f4
loop_2985:
	fcmpne32	%f12,	%f8,	%o0
	tleu	%xcc,	0x4
loop_2986:
	nop
	wr	%g0,	0x27,	%asi
	stda	%g6,	[%l7 + 0x68] %asi
	membar	#Sync
	tpos	%icc,	0x1
	ldsb	[%l7 + 0x3F],	%i5
	subc	%o7,	0x11A8,	%o1
	taddcc	%g5,	%l0,	%i7
	fmovdcc	%xcc,	%f31,	%f25
	sdivcc	%l1,	0x189F,	%g1
	fmovsl	%xcc,	%f20,	%f26
	subcc	%o6,	0x0FD0,	%o4
	fmovrse	%i0,	%f23,	%f11
	xnorcc	%g3,	0x105E,	%l2
	fmul8ulx16	%f4,	%f10,	%f8
	tl	%xcc,	0x5
	brlez	%i2,	loop_2987
	tneg	%xcc,	0x1
	movleu	%icc,	%l6,	%o3
	movrgez	%i4,	0x192,	%g7
loop_2987:
	addcc	%l3,	%l4,	%i6
	taddcctv	%o2,	0x1E62,	%l5
	fbue,a	%fcc3,	loop_2988
	fbe,a	%fcc1,	loop_2989
	ldsw	[%l7 + 0x7C],	%i3
	set	0x10, %l2
	lduha	[%l7 + %l2] 0x19,	%i1
loop_2988:
	fcmple16	%f24,	%f26,	%g2
loop_2989:
	edge16n	%o5,	%g4,	%o0
	ta	%icc,	0x6
	set	0x50, %i2
	ldda	[%l7 + %i2] 0x89,	%i4
	membar	0x4B
	tsubcc	%g6,	0x1ECB,	%o1
	bg,a	%icc,	loop_2990
	popc	0x0DD6,	%o7
	orcc	%l0,	%i7,	%g5
	tsubcc	%g1,	%o6,	%o4
loop_2990:
	edge16n	%l1,	%g3,	%i0
	tvc	%icc,	0x5
	fexpand	%f1,	%f28
	mulx	%i2,	0x1BF2,	%l6
	mulscc	%o3,	%i4,	%l2
	orcc	%l3,	0x0297,	%l4
	udivx	%i6,	0x1D04,	%g7
	movgu	%icc,	%l5,	%i3
	bge	loop_2991
	movn	%xcc,	%o2,	%i1
	movneg	%xcc,	%g2,	%o5
	movrlz	%g4,	%i5,	%o0
loop_2991:
	mulscc	%o1,	0x00E3,	%o7
	set	0x0C, %i5
	lda	[%l7 + %i5] 0x80,	%f15
	movleu	%icc,	%g6,	%l0
	smulcc	%i7,	0x00B8,	%g1
	tcc	%icc,	0x2
	brz	%o6,	loop_2992
	movrne	%o4,	%l1,	%g3
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x18] %asi,	%f10
loop_2992:
	movcs	%xcc,	%g5,	%i0
	tleu	%xcc,	0x1
	nop
	set	0x5C, %l1
	prefetch	[%l7 + %l1],	 0x2
	movcc	%xcc,	%l6,	%i2
	brlez,a	%i4,	loop_2993
	orn	%o3,	%l2,	%l4
	fmovde	%xcc,	%f21,	%f28
	movvc	%icc,	%l3,	%i6
loop_2993:
	fbul	%fcc3,	loop_2994
	stx	%l5,	[%l7 + 0x28]
	edge16	%g7,	%o2,	%i1
	fcmpgt16	%f8,	%f2,	%g2
loop_2994:
	edge8n	%i3,	%o5,	%g4
	fbue,a	%fcc0,	loop_2995
	movrgez	%o0,	0x28B,	%o1
	fnands	%f3,	%f1,	%f9
	fmovrse	%i5,	%f19,	%f15
loop_2995:
	movvs	%icc,	%o7,	%g6
	fpsub16s	%f7,	%f25,	%f13
	sethi	0x1B6C,	%i7
	brgz	%l0,	loop_2996
	fmovdgu	%xcc,	%f10,	%f4
	membar	0x2D
	ldd	[%l7 + 0x38],	%f30
loop_2996:
	umul	%g1,	0x02E1,	%o6
	fors	%f21,	%f13,	%f19
	ba,a	%xcc,	loop_2997
	fpadd16	%f24,	%f6,	%f2
	fbuge	%fcc3,	loop_2998
	movre	%l1,	%g3,	%o4
loop_2997:
	add	%i0,	0x08B9,	%l6
	subcc	%i2,	0x1885,	%g5
loop_2998:
	ld	[%l7 + 0x40],	%f2
	brlz,a	%o3,	loop_2999
	mulscc	%l2,	%l4,	%i4
	taddcc	%l3,	%l5,	%i6
	movvs	%icc,	%o2,	%g7
loop_2999:
	stbar
	tgu	%xcc,	0x3
	fbge	%fcc0,	loop_3000
	orn	%g2,	%i1,	%o5
	lduw	[%l7 + 0x58],	%i3
	sdivx	%g4,	0x089F,	%o1
loop_3000:
	add	%o0,	0x0076,	%o7
	move	%xcc,	%g6,	%i5
	stbar
	bgu,pn	%xcc,	loop_3001
	fmovrsgz	%l0,	%f1,	%f13
	set	0x69, %l5
	lduba	[%l7 + %l5] 0x04,	%i7
loop_3001:
	mulx	%g1,	%l1,	%g3
	movrlz	%o6,	%i0,	%o4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x64] %asi,	%l6
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%g5
	movneg	%icc,	%o3,	%i2
	movl	%xcc,	%l4,	%l2
	bg,pt	%xcc,	loop_3002
	fmovdvc	%xcc,	%f15,	%f29
	wr	%g0,	0x22,	%asi
	stwa	%l3,	[%l7 + 0x4C] %asi
	membar	#Sync
loop_3002:
	alignaddrl	%i4,	%i6,	%l5
	tl	%icc,	0x3
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	wr	%g0,	0x11,	%asi
	stwa	%o2,	[%l7 + 0x2C] %asi
	subc	%i1,	%o5,	%i3
	array32	%g4,	%g2,	%o0
	subcc	%o1,	%g6,	%i5
	bvc,a	loop_3003
	call	loop_3004
	movrgz	%l0,	%o7,	%g1
	edge32	%i7,	%l1,	%g3
loop_3003:
	nop
	set	0x48, %g4
	stxa	%i0,	[%l7 + %g4] 0x15
loop_3004:
	mulx	%o4,	%l6,	%o6
	stw	%g5,	[%l7 + 0x54]
	movle	%xcc,	%i2,	%o3
	fmovsgu	%xcc,	%f22,	%f28
	xnor	%l2,	0x10C7,	%l4
	fmul8x16au	%f8,	%f25,	%f16
	fzeros	%f4
	xnor	%i4,	%i6,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g7,	0x1CCF,	%l3
	stbar
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x19,	%f0
	alignaddr	%o2,	%i1,	%o5
	edge8	%g4,	%g2,	%o0
	fpsub32s	%f25,	%f9,	%f12
	edge16	%i3,	%g6,	%i5
	orcc	%l0,	0x113D,	%o1
	srax	%g1,	%i7,	%o7
	edge16ln	%l1,	%g3,	%i0
	array32	%o4,	%l6,	%g5
	fmovdcs	%icc,	%f11,	%f4
	tcc	%icc,	0x2
	stbar
	movcc	%xcc,	%o6,	%o3
	fpmerge	%f16,	%f28,	%f10
	bvc,a,pn	%xcc,	loop_3005
	ble,a	%icc,	loop_3006
	movcs	%icc,	%l2,	%i2
	movge	%xcc,	%l4,	%i6
loop_3005:
	fmovsge	%icc,	%f20,	%f16
loop_3006:
	movgu	%icc,	%l5,	%i4
	array8	%l3,	%g7,	%o2
	nop
	setx	loop_3007,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xor	%i1,	0x0C0A,	%g4
	ldd	[%l7 + 0x68],	%g2
	udivx	%o0,	0x0F98,	%o5
loop_3007:
	tcc	%icc,	0x3
	set	0x34, %o7
	stwa	%i3,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	setx loop_3008, %l0, %l1
	jmpl %l1, %i5
	array32	%g6,	%l0,	%g1
	xorcc	%o1,	0x1DBD,	%i7
	edge32l	%l1,	%o7,	%g3
loop_3008:
	nop
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movre	%i0,	0x294,	%l6
	fmovsl	%xcc,	%f18,	%f13
	alignaddrl	%g5,	%o4,	%o3
	pdist	%f4,	%f16,	%f18
	st	%f15,	[%l7 + 0x70]
	movg	%icc,	%o6,	%l2
	movge	%icc,	%i2,	%i6
	fbn,a	%fcc2,	loop_3009
	srlx	%l4,	%i4,	%l5
	fpadd16	%f20,	%f12,	%f2
	prefetch	[%l7 + 0x68],	 0x2
loop_3009:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%g7,	%o2
	srax	%l3,	%g4,	%i1
	fabss	%f23,	%f12
	edge16	%o0,	%o5,	%g2
	xnor	%i3,	0x000D,	%g6
	tpos	%xcc,	0x5
	tle	%icc,	0x2
	fmuld8ulx16	%f24,	%f5,	%f8
	andcc	%i5,	0x0FA8,	%g1
	stb	%l0,	[%l7 + 0x50]
	fmovdne	%icc,	%f10,	%f8
	fmovs	%f18,	%f25
	edge32l	%i7,	%l1,	%o1
	fble,a	%fcc3,	loop_3010
	mova	%icc,	%g3,	%o7
	array16	%i0,	%l6,	%g5
	movge	%icc,	%o4,	%o6
loop_3010:
	mova	%icc,	%o3,	%i2
	xnorcc	%i6,	0x01E7,	%l2
	brnz	%i4,	loop_3011
	fcmpd	%fcc0,	%f16,	%f2
	tne	%xcc,	0x4
	array16	%l5,	%g7,	%l4
loop_3011:
	tge	%icc,	0x7
	bvc	loop_3012
	movge	%xcc,	%o2,	%l3
	fmovde	%icc,	%f11,	%f18
	fpsub32	%f18,	%f14,	%f30
loop_3012:
	srl	%g4,	%i1,	%o0
	movleu	%icc,	%o5,	%g2
	wr	%g0,	0x89,	%asi
	stxa	%g6,	[%l7 + 0x40] %asi
	brnz	%i3,	loop_3013
	fmovdvc	%xcc,	%f4,	%f11
	fmovrdgez	%i5,	%f8,	%f4
	orncc	%l0,	%g1,	%l1
loop_3013:
	fone	%f12
	bge,pn	%xcc,	loop_3014
	fpmerge	%f27,	%f2,	%f6
	edge16	%o1,	%i7,	%o7
	brz	%g3,	loop_3015
loop_3014:
	fmovsvs	%xcc,	%f13,	%f25
	ldub	[%l7 + 0x6D],	%l6
	sdivcc	%i0,	0x0FC6,	%o4
loop_3015:
	brnz	%g5,	loop_3016
	andn	%o3,	%o6,	%i6
	call	loop_3017
	fcmpeq16	%f8,	%f18,	%i2
loop_3016:
	fbe	%fcc3,	loop_3018
	bvc,a	loop_3019
loop_3017:
	fandnot1	%f18,	%f10,	%f4
	fcmple16	%f8,	%f14,	%l2
loop_3018:
	mulscc	%l5,	%i4,	%l4
loop_3019:
	fors	%f13,	%f13,	%f12
	tl	%xcc,	0x4
	tl	%xcc,	0x4
	umulcc	%g7,	%o2,	%g4
	umulcc	%i1,	0x03C4,	%l3
	movvc	%icc,	%o0,	%o5
	move	%icc,	%g2,	%i3
	edge8ln	%g6,	%l0,	%g1
	fpsub16s	%f28,	%f23,	%f7
	tcs	%xcc,	0x7
	umul	%l1,	0x1CDE,	%i5
	addccc	%i7,	0x00B4,	%o1
	sdivx	%o7,	0x134F,	%g3
	movvs	%icc,	%l6,	%o4
	ldx	[%l7 + 0x18],	%g5
	set	0x2A, %o1
	stha	%o3,	[%l7 + %o1] 0x04
	fbge	%fcc3,	loop_3020
	bleu,a,pt	%icc,	loop_3021
	fand	%f8,	%f18,	%f0
	fsrc1	%f26,	%f8
loop_3020:
	alignaddrl	%o6,	%i0,	%i2
loop_3021:
	fmovdvc	%xcc,	%f16,	%f5
	add	%l2,	0x0B46,	%i6
	fpadd32s	%f9,	%f4,	%f19
	fmovrdlz	%l5,	%f30,	%f2
	movrgz	%l4,	0x125,	%i4
	stb	%o2,	[%l7 + 0x21]
	xnor	%g4,	%g7,	%l3
	orn	%o0,	0x10DA,	%o5
	fmovd	%f26,	%f6
	edge8ln	%i1,	%g2,	%i3
	bpos,a,pn	%xcc,	loop_3022
	sllx	%l0,	%g6,	%g1
	set	0x20, %i6
	lduha	[%l7 + %i6] 0x10,	%i5
loop_3022:
	umul	%i7,	0x046B,	%o1
	fsrc1	%f18,	%f30
	fmovda	%icc,	%f27,	%f8
	prefetch	[%l7 + 0x4C],	 0x1
	fbule	%fcc3,	loop_3023
	movpos	%xcc,	%l1,	%o7
	tsubcc	%l6,	%g3,	%g5
	bgu,a	loop_3024
loop_3023:
	addcc	%o3,	0x0B38,	%o6
	fsrc1s	%f10,	%f22
	tle	%xcc,	0x0
loop_3024:
	bvc,a	%icc,	loop_3025
	alignaddr	%i0,	%i2,	%l2
	umul	%i6,	%l5,	%l4
	tl	%icc,	0x5
loop_3025:
	mulx	%i4,	%o4,	%g4
	ldsh	[%l7 + 0x7C],	%g7
	set	0x74, %l3
	lduwa	[%l7 + %l3] 0x11,	%l3
	movcc	%icc,	%o2,	%o5
	orcc	%i1,	0x1942,	%g2
	movre	%i3,	%l0,	%o0
	orncc	%g1,	%g6,	%i7
	sdiv	%o1,	0x1E7E,	%l1
	fbe	%fcc3,	loop_3026
	edge32	%o7,	%l6,	%i5
	edge16l	%g5,	%o3,	%o6
	movn	%icc,	%g3,	%i0
loop_3026:
	tge	%icc,	0x4
	fornot1	%f4,	%f8,	%f20
	movcc	%xcc,	%i2,	%i6
	srax	%l2,	%l4,	%l5
	tsubcctv	%i4,	0x1DCD,	%o4
	movrlez	%g7,	%l3,	%g4
	siam	0x0
	fexpand	%f17,	%f4
	bgu	%icc,	loop_3027
	fmovsne	%xcc,	%f29,	%f20
	xorcc	%o2,	%i1,	%g2
	te	%icc,	0x1
loop_3027:
	ld	[%l7 + 0x74],	%f18
	movrne	%o5,	0x155,	%l0
	add	%o0,	0x0C15,	%g1
	udivx	%g6,	0x030D,	%i7
	taddcctv	%o1,	%l1,	%i3
	sllx	%l6,	%i5,	%o7
	edge8	%g5,	%o3,	%g3
	srl	%i0,	%o6,	%i6
	add	%l2,	%l4,	%i2
	bleu	loop_3028
	array32	%i4,	%o4,	%g7
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x74] %asi,	%l3
loop_3028:
	tle	%xcc,	0x6
	set	0x2A, %o0
	ldstuba	[%l7 + %o0] 0x80,	%l5
	tg	%xcc,	0x5
	srlx	%g4,	%o2,	%g2
	brlz,a	%i1,	loop_3029
	bgu,pt	%xcc,	loop_3030
	be	%xcc,	loop_3031
	alignaddr	%l0,	%o0,	%o5
loop_3029:
	nop
	wr	%g0,	0x19,	%asi
	stda	%g6,	[%l7 + 0x70] %asi
loop_3030:
	fone	%f0
loop_3031:
	fbl,a	%fcc0,	loop_3032
	fpadd32	%f0,	%f14,	%f18
	tpos	%icc,	0x1
	movvc	%xcc,	%i7,	%o1
loop_3032:
	movleu	%xcc,	%l1,	%i3
	addcc	%g1,	%i5,	%l6
	add	%g5,	%o3,	%g3
	brgz	%i0,	loop_3033
	bvs	loop_3034
	membar	0x59
	ldd	[%l7 + 0x50],	%o6
loop_3033:
	fnot1s	%f17,	%f7
loop_3034:
	edge8n	%i6,	%l2,	%o7
	fcmple32	%f2,	%f16,	%i2
	movrlez	%i4,	%o4,	%g7
	fmovd	%f12,	%f14
	sir	0x1B0B
	bg,a,pn	%icc,	loop_3035
	lduw	[%l7 + 0x28],	%l4
	subccc	%l5,	%l3,	%g4
	xnor	%o2,	%g2,	%l0
loop_3035:
	tleu	%xcc,	0x7
	movg	%xcc,	%o0,	%o5
	fabss	%f31,	%f3
	ld	[%l7 + 0x74],	%f21
	fbl,a	%fcc1,	loop_3036
	sdivx	%g6,	0x0382,	%i1
	array32	%o1,	%i7,	%i3
	stbar
loop_3036:
	fpadd16	%f22,	%f26,	%f12
	tg	%xcc,	0x5
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%l0
	movpos	%icc,	%i5,	%g1
	edge16n	%l6,	%o3,	%g3
	movrne	%g5,	0x2AF,	%i0
	set	0x50, %l0
	prefetcha	[%l7 + %l0] 0x10,	 0x2
	fmul8x16au	%f20,	%f2,	%f30
	popc	0x1461,	%l2
	fsrc2	%f26,	%f8
	fbe,a	%fcc0,	loop_3037
	fmovscc	%xcc,	%f6,	%f9
	smulcc	%i6,	%o7,	%i2
	bl	%icc,	loop_3038
loop_3037:
	tg	%xcc,	0x6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x18,	%o4,	%i4
loop_3038:
	tsubcc	%l4,	%l5,	%g7
	and	%g4,	0x18A4,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul	%fcc2,	loop_3039
	tle	%icc,	0x0
	ldstub	[%l7 + 0x42],	%g2
	movl	%xcc,	%l0,	%o0
loop_3039:
	tne	%xcc,	0x7
	set	0x70, %g6
	ldxa	[%l7 + %g6] 0x88,	%l3
	movpos	%icc,	%o5,	%g6
	fmovspos	%icc,	%f18,	%f16
	addcc	%o1,	0x0A96,	%i7
	orn	%i1,	%i3,	%i5
	tleu	%icc,	0x3
	tvc	%xcc,	0x6
	array8	%l1,	%g1,	%l6
	edge16	%o3,	%g3,	%g5
	fbo,a	%fcc0,	loop_3040
	for	%f10,	%f8,	%f12
	xnorcc	%o6,	0x14BA,	%l2
	tneg	%icc,	0x3
loop_3040:
	fmovsn	%xcc,	%f26,	%f28
	movrlz	%i0,	%o7,	%i2
	tle	%xcc,	0x5
	sllx	%o4,	0x1E,	%i4
	movrlz	%i6,	%l5,	%l4
	array32	%g4,	%g7,	%g2
	fbge	%fcc1,	loop_3041
	orcc	%o2,	0x0DC6,	%l0
	ta	%xcc,	0x5
	movrne	%o0,	0x1ED,	%l3
loop_3041:
	fzero	%f6
	fmovdvs	%icc,	%f17,	%f24
	sdivx	%g6,	0x1F8F,	%o5
	alignaddrl	%o1,	%i7,	%i1
	xnor	%i3,	0x0B7B,	%i5
	edge8	%l1,	%l6,	%g1
	sll	%g3,	%g5,	%o3
	alignaddrl	%l2,	%i0,	%o6
	andncc	%o7,	%o4,	%i2
	brlz	%i4,	loop_3042
	fsrc1	%f14,	%f30
	sub	%i6,	%l5,	%l4
	movle	%xcc,	%g7,	%g4
loop_3042:
	sir	0x1330
	edge8n	%o2,	%l0,	%o0
	fcmpgt16	%f26,	%f22,	%l3
	movrgez	%g2,	0x2A7,	%g6
	fpadd32	%f0,	%f4,	%f12
	fbne	%fcc3,	loop_3043
	movvs	%xcc,	%o1,	%o5
	or	%i1,	0x09BA,	%i3
	or	%i5,	0x0ED9,	%i7
loop_3043:
	addc	%l1,	0x1144,	%g1
	tleu	%icc,	0x0
	xnor	%g3,	%g5,	%l6
	fzeros	%f14
	tgu	%icc,	0x0
	brlz,a	%o3,	loop_3044
	andcc	%i0,	%o6,	%o7
	udivcc	%l2,	0x0609,	%o4
	edge8ln	%i4,	%i2,	%l5
loop_3044:
	tneg	%icc,	0x3
	edge32ln	%i6,	%g7,	%g4
	wr	%g0,	0x89,	%asi
	stwa	%l4,	[%l7 + 0x20] %asi
	andn	%o2,	0x18D5,	%o0
	fornot2	%f4,	%f22,	%f6
	tvc	%xcc,	0x7
	fnand	%f20,	%f14,	%f0
	ta	%icc,	0x5
	udivcc	%l0,	0x11A1,	%l3
	fnegs	%f0,	%f29
	stx	%g6,	[%l7 + 0x50]
	tvs	%icc,	0x7
	edge16	%g2,	%o1,	%i1
	xorcc	%o5,	%i5,	%i7
	fnot2	%f2,	%f24
	fmovscc	%xcc,	%f12,	%f14
	fcmpgt16	%f2,	%f24,	%i3
	smul	%l1,	0x0455,	%g3
	movle	%xcc,	%g1,	%g5
	edge16l	%o3,	%l6,	%o6
	alignaddr	%o7,	%i0,	%l2
	brnz	%i4,	loop_3045
	xorcc	%o4,	0x0DF6,	%i2
	array16	%l5,	%g7,	%g4
	sir	0x1A99
loop_3045:
	movg	%xcc,	%i6,	%l4
	fmovs	%f23,	%f27
	fsrc2s	%f21,	%f19
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	xor	%o2,	%l0,	%o0
	flush	%l7 + 0x58
	bshuffle	%f26,	%f16,	%f14
	movpos	%icc,	%g6,	%g2
	sll	%o1,	%i1,	%l3
	fpadd32s	%f26,	%f29,	%f8
	set	0x34, %o5
	stba	%o5,	[%l7 + %o5] 0xeb
	membar	#Sync
	te	%xcc,	0x4
	subc	%i7,	%i3,	%i5
	sub	%g3,	0x0538,	%l1
	tcs	%icc,	0x0
	fmovrsgz	%g5,	%f21,	%f31
	tsubcctv	%g1,	0x039C,	%l6
	movl	%xcc,	%o6,	%o3
	subccc	%o7,	0x06F9,	%l2
	addccc	%i4,	%i0,	%i2
	fxor	%f22,	%f6,	%f20
	fba,a	%fcc2,	loop_3046
	andn	%o4,	0x190E,	%l5
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x12] %asi,	%g7
loop_3046:
	fmuld8sux16	%f15,	%f27,	%f4
	movne	%icc,	%g4,	%l4
	fcmped	%fcc2,	%f22,	%f14
	fsrc2	%f8,	%f4
	fandnot2s	%f10,	%f20,	%f19
	xnorcc	%i6,	%o2,	%l0
	bl,pn	%icc,	loop_3047
	fors	%f0,	%f6,	%f21
	movre	%o0,	%g6,	%o1
	fsrc2	%f12,	%f16
loop_3047:
	fbe	%fcc3,	loop_3048
	addcc	%i1,	0x00DE,	%g2
	fcmped	%fcc1,	%f30,	%f10
	fbu	%fcc1,	loop_3049
loop_3048:
	edge32ln	%o5,	%i7,	%i3
	movcc	%xcc,	%i5,	%l3
	fxnors	%f22,	%f29,	%f3
loop_3049:
	fabss	%f17,	%f10
	ba,a	%xcc,	loop_3050
	popc	0x0F67,	%g3
	fbule,a	%fcc1,	loop_3051
	movgu	%icc,	%g5,	%l1
loop_3050:
	fmul8ulx16	%f26,	%f18,	%f26
	bge,a,pt	%xcc,	loop_3052
loop_3051:
	fpadd16s	%f13,	%f13,	%f6
	ldd	[%l7 + 0x10],	%f16
	tvc	%icc,	0x4
loop_3052:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2739
!	Type x   	: 1345
!	Type cti   	: 3052
!	Type f   	: 4588
!	Type i   	: 13276
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x4F5069CA
.word 0x84E49447
.word 0x78821982
.word 0xF70F5AE9
.word 0x56F866D6
.word 0x455120FC
.word 0x4D11A4CE
.word 0xB42DCEED
.word 0x886493E7
.word 0x26DB48EE
.word 0xB3449283
.word 0x84A753EF
.word 0x66CD7C89
.word 0xD5B6CE8E
.word 0x5D8E9E79
.word 0x401D5ED3
.word 0xCC8FEC93
.word 0xA5164D25
.word 0xD785E2C6
.word 0xA0C1F270
.word 0xCE233530
.word 0xF611B108
.word 0xED74608A
.word 0xE76E699C
.word 0x5380DF95
.word 0x1AE5EE01
.word 0x945206D6
.word 0x1A4A6ABE
.word 0x4E9C32D1
.word 0xC86EAA02
.word 0xB3D8AFBF
.word 0x3B15A4B0
.word 0x140960AD
.word 0x98263CAE
.word 0xD8AC775F
.word 0x7EDA83BD
.word 0x077183A0
.word 0x15F50EA1
.word 0xF7430E45
.word 0xE6F65279
.word 0xE4156A49
.word 0x8E80D136
.word 0x83A3547C
.word 0x08D3F3D3
.word 0x1299BD00
.word 0x42FE0E5C
.word 0x9CFFB6F3
.word 0xA392A2EB
.word 0xED30DA94
.word 0xBEFBA2E0
.word 0x77C0FF2A
.word 0x3F06DACA
.word 0x89C30D2B
.word 0xF9595A3C
.word 0x8C5E0997
.word 0x395DF3B2
.word 0xABA3E080
.word 0x54343D92
.word 0x064122A7
.word 0xC08546E0
.word 0x33679511
.word 0xDD7D6C3B
.word 0x13A89001
.word 0x742D34BB
.end
