/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f1.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f1.s,v 1.1 2007/05/11 17:22:20 drp Exp $"
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
	setx	0x277BA1302041217E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x0,	%g1
	set	0x3,	%g2
	set	0x7,	%g3
	set	0x8,	%g4
	set	0x5,	%g5
	set	0xE,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0xD,	%i1
	set	-0x0,	%i2
	set	-0x3,	%i3
	set	-0x6,	%i4
	set	-0x2,	%i5
	set	-0x0,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x6B41B05B,	%l0
	set	0x6B5445B1,	%l1
	set	0x737849EB,	%l2
	set	0x48EA6215,	%l3
	set	0x6DE5D890,	%l4
	set	0x26A69E81,	%l5
	set	0x5279EBAA,	%l6
	!# Output registers
	set	-0x1D11,	%o0
	set	0x1A68,	%o1
	set	0x0377,	%o2
	set	-0x1BC6,	%o3
	set	0x1682,	%o4
	set	-0x10E3,	%o5
	set	-0x1D35,	%o6
	set	0x02BD,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x3B066A26D891519A)
	INIT_TH_FP_REG(%l7,%f2,0xF58C772501260B95)
	INIT_TH_FP_REG(%l7,%f4,0xE240B8C48CFD1717)
	INIT_TH_FP_REG(%l7,%f6,0x2672191F9D420A29)
	INIT_TH_FP_REG(%l7,%f8,0xAF18F5BE5DBFDF44)
	INIT_TH_FP_REG(%l7,%f10,0x7DF4E95D00C93E42)
	INIT_TH_FP_REG(%l7,%f12,0xA614F5273C968E4D)
	INIT_TH_FP_REG(%l7,%f14,0x66B95CFF1442283D)
	INIT_TH_FP_REG(%l7,%f16,0xDF34ED537CD9DF31)
	INIT_TH_FP_REG(%l7,%f18,0xBC9433E8D5237D5A)
	INIT_TH_FP_REG(%l7,%f20,0x92259735A32C2693)
	INIT_TH_FP_REG(%l7,%f22,0xEBB6637472EFDD0C)
	INIT_TH_FP_REG(%l7,%f24,0xFFDDA8D12EA3A29D)
	INIT_TH_FP_REG(%l7,%f26,0xC02DD7E486E8C1E5)
	INIT_TH_FP_REG(%l7,%f28,0x3FFC3C416ABE04F3)
	INIT_TH_FP_REG(%l7,%f30,0x3AAD48687C756322)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE5D, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fnor	%f2,	%f8,	%f26
	sdivx	%i2,	0x0127,	%g3
	movrne	%g5,	0x106,	%i4
	ld	[%l7 + 0x70],	%f0
	set	0x1A, %o2
	stha	%l5,	[%l7 + %o2] 0x27
	membar	#Sync
	fones	%f22
	bl,a,pn	%icc,	loop_1
	bvs,a	%xcc,	loop_2
	orn	%o5,	%g6,	%l3
	sethi	0x0CFF,	%o0
loop_1:
	movleu	%icc,	%g1,	%g4
loop_2:
	bne,a	loop_3
	srlx	%l4,	%i7,	%l2
	edge16	%i6,	%o6,	%o4
	st	%f18,	[%l7 + 0x28]
loop_3:
	fones	%f25
	udiv	%o7,	0x0A2F,	%l1
	fnor	%f30,	%f18,	%f4
	andn	%o1,	0x16A7,	%i0
	stbar
	mova	%xcc,	%g7,	%i1
	and	%g2,	0x1D71,	%o2
	tpos	%xcc,	0x1
	fmovdne	%icc,	%f28,	%f22
	fmovrslz	%i5,	%f18,	%f2
	array32	%l0,	%o3,	%i3
	sra	%i2,	0x0C,	%l6
	fmovdl	%xcc,	%f13,	%f24
	fmovdcc	%xcc,	%f2,	%f24
	edge32l	%g3,	%g5,	%i4
	taddcc	%o5,	%l5,	%g6
	fmovsg	%xcc,	%f4,	%f6
	tne	%xcc,	0x2
	ldd	[%l7 + 0x08],	%o0
	taddcc	%g1,	%g4,	%l3
	movneg	%xcc,	%l4,	%l2
	bgu,pn	%xcc,	loop_4
	stx	%i6,	[%l7 + 0x40]
	bge,a	%xcc,	loop_5
	edge16n	%o6,	%i7,	%o7
loop_4:
	movrgez	%o4,	%o1,	%i0
	sth	%l1,	[%l7 + 0x70]
loop_5:
	te	%icc,	0x0
	edge8	%g7,	%i1,	%g2
	subcc	%o2,	0x1FC9,	%l0
	sllx	%i5,	0x12,	%o3
	mulscc	%i2,	%i3,	%g3
	tvs	%icc,	0x0
	smulcc	%l6,	%i4,	%o5
	edge32ln	%g5,	%l5,	%o0
	fmuld8ulx16	%f17,	%f26,	%f6
	edge32l	%g1,	%g4,	%l3
	taddcctv	%l4,	%l2,	%i6
	movn	%icc,	%g6,	%o6
	movcs	%icc,	%o7,	%i7
	tcs	%icc,	0x4
	fmovdcs	%xcc,	%f3,	%f14
	subcc	%o1,	0x15D4,	%i0
	fmovrslez	%o4,	%f18,	%f13
	array32	%g7,	%l1,	%g2
	fmovrslez	%o2,	%f16,	%f10
	movle	%icc,	%i1,	%i5
	prefetch	[%l7 + 0x38],	 0x0
	movneg	%xcc,	%l0,	%i2
	fpackfix	%f16,	%f25
	umul	%o3,	0x08D1,	%i3
	andncc	%l6,	%g3,	%o5
	fand	%f14,	%f6,	%f22
	tvs	%icc,	0x5
	mulscc	%g5,	0x1F9D,	%l5
	movrne	%i4,	0x083,	%g1
	sra	%o0,	0x09,	%l3
	brz	%g4,	loop_6
	movleu	%xcc,	%l4,	%l2
	ldd	[%l7 + 0x18],	%g6
	movg	%xcc,	%i6,	%o6
loop_6:
	fmovdleu	%xcc,	%f10,	%f6
	bn	loop_7
	fmovrsne	%i7,	%f17,	%f22
	tge	%icc,	0x6
	sth	%o7,	[%l7 + 0x44]
loop_7:
	or	%i0,	0x0213,	%o4
	fmovdneg	%xcc,	%f2,	%f25
	udiv	%o1,	0x06BD,	%g7
	edge16n	%g2,	%l1,	%i1
	set	0x6C, %o4
	stwa	%o2,	[%l7 + %o4] 0x2a
	membar	#Sync
	tcc	%icc,	0x5
	fmovda	%icc,	%f30,	%f1
	edge16ln	%i5,	%i2,	%o3
	fmul8x16al	%f17,	%f10,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i3,	%l6,	%l0
	sethi	0x1C43,	%g3
	set	0x3C, %i1
	sta	%f22,	[%l7 + %i1] 0x11
	set	0x20, %o3
	prefetcha	[%l7 + %o3] 0x14,	 0x2
	smul	%o5,	%i4,	%l5
	tvc	%icc,	0x1
	movcs	%icc,	%o0,	%g1
	tne	%xcc,	0x4
	tcs	%icc,	0x5
	bcs,pt	%icc,	loop_8
	tvs	%xcc,	0x7
	xor	%g4,	0x189A,	%l3
	fmovsne	%icc,	%f8,	%f9
loop_8:
	movre	%l4,	%g6,	%i6
	array16	%l2,	%i7,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f22,	%f8,	%f4
	movvs	%icc,	%o7,	%o4
	umul	%i0,	%g7,	%g2
	fmovse	%icc,	%f20,	%f25
	bcc,a,pn	%xcc,	loop_9
	orncc	%l1,	%o1,	%o2
	andn	%i5,	0x0EE2,	%i1
	movrlz	%o3,	0x2D5,	%i3
loop_9:
	movrlez	%i2,	%l6,	%l0
	set	0x64, %l1
	lda	[%l7 + %l1] 0x15,	%f1
	fmovsge	%xcc,	%f4,	%f8
	array32	%g5,	%g3,	%i4
	movrne	%o5,	0x201,	%o0
	and	%g1,	%g4,	%l3
	orncc	%l4,	0x18AA,	%l5
	tl	%xcc,	0x3
	orcc	%i6,	%g6,	%l2
	andn	%o6,	0x1498,	%o7
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x20] %asi,	%i7
	subccc	%o4,	%g7,	%g2
	alignaddrl	%l1,	%i0,	%o2
	mulscc	%o1,	%i1,	%i5
	set	0x60, %o5
	stda	%o2,	[%l7 + %o5] 0x22
	membar	#Sync
	movge	%xcc,	%i2,	%l6
	bne,a,pn	%icc,	loop_10
	movre	%i3,	%l0,	%g5
	tl	%xcc,	0x0
	fmovspos	%xcc,	%f30,	%f16
loop_10:
	addcc	%g3,	0x0240,	%i4
	ta	%icc,	0x5
	taddcc	%o0,	0x11EE,	%g1
	stw	%o5,	[%l7 + 0x48]
	fmovdcc	%xcc,	%f10,	%f10
	fmovdgu	%icc,	%f14,	%f10
	srlx	%l3,	%l4,	%l5
	array16	%i6,	%g6,	%l2
	fmul8x16	%f30,	%f6,	%f18
	nop
	set	0x10, %o7
	stx	%g4,	[%l7 + %o7]
	fmovsg	%icc,	%f3,	%f14
	ta	%xcc,	0x0
	fpackfix	%f14,	%f17
	movvc	%xcc,	%o6,	%i7
	sllx	%o4,	0x13,	%g7
	fmovsg	%xcc,	%f20,	%f5
	fba	%fcc2,	loop_11
	fmul8sux16	%f2,	%f12,	%f16
	sth	%g2,	[%l7 + 0x3C]
	fbl	%fcc1,	loop_12
loop_11:
	tleu	%icc,	0x4
	bg,pt	%icc,	loop_13
	nop
	setx	loop_14,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_12:
	xor	%l1,	%i0,	%o2
	edge16l	%o7,	%o1,	%i1
loop_13:
	edge16	%i5,	%o3,	%i2
loop_14:
	movne	%icc,	%i3,	%l0
	ld	[%l7 + 0x50],	%f17
	edge8ln	%l6,	%g3,	%i4
	tl	%xcc,	0x4
	bvc,a	%xcc,	loop_15
	mova	%icc,	%g5,	%g1
	sra	%o5,	0x11,	%o0
	edge8	%l3,	%l4,	%l5
loop_15:
	addcc	%i6,	0x1370,	%l2
	fba,a	%fcc3,	loop_16
	subccc	%g4,	%o6,	%i7
	fmuld8ulx16	%f14,	%f20,	%f8
	fmovscs	%xcc,	%f2,	%f28
loop_16:
	tcs	%xcc,	0x4
	fbne	%fcc3,	loop_17
	tpos	%icc,	0x2
	xnor	%o4,	0x140D,	%g6
	xnor	%g2,	%l1,	%g7
loop_17:
	andn	%i0,	0x15F5,	%o2
	movrne	%o1,	0x21B,	%i1
	movneg	%icc,	%i5,	%o3
	movne	%icc,	%i2,	%o7
	fmovsgu	%icc,	%f16,	%f12
	set	0x4C, %o1
	ldswa	[%l7 + %o1] 0x04,	%l0
	bg,a	loop_18
	edge8n	%l6,	%g3,	%i3
	sllx	%i4,	0x12,	%g5
	tg	%xcc,	0x3
loop_18:
	movcs	%icc,	%g1,	%o0
	movle	%icc,	%l3,	%o5
	set	0x0F, %i0
	lduba	[%l7 + %i0] 0x11,	%l4
	array16	%l5,	%i6,	%l2
	addccc	%g4,	0x1103,	%o6
	fmovdvc	%xcc,	%f14,	%f31
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	sub	%i7,	%o4,	%g2
	fbug,a	%fcc1,	loop_19
	srax	%l1,	0x0F,	%g7
	fbu	%fcc0,	loop_20
	fmovrdgz	%i0,	%f30,	%f30
loop_19:
	fmovdg	%xcc,	%f24,	%f5
	srax	%o2,	%o1,	%i1
loop_20:
	fabsd	%f22,	%f8
	addccc	%i5,	%o3,	%g6
	fmovdneg	%icc,	%f15,	%f3
	sethi	0x05DF,	%o7
	tge	%icc,	0x3
	addccc	%i2,	0x16F7,	%l6
	ta	%icc,	0x0
	tpos	%xcc,	0x1
	te	%icc,	0x4
	xorcc	%l0,	0x1132,	%i3
	smulcc	%i4,	%g5,	%g1
	nop
	set	0x30, %g7
	stw	%g3,	[%l7 + %g7]
	set	0x23, %l0
	ldstuba	[%l7 + %l0] 0x89,	%o0
	movrne	%l3,	%o5,	%l5
	movvc	%xcc,	%i6,	%l2
	fandnot1	%f4,	%f30,	%f20
	be,a	loop_21
	fbo,a	%fcc2,	loop_22
	nop
	set	0x34, %i7
	lduh	[%l7 + %i7],	%l4
	movne	%icc,	%o6,	%g4
loop_21:
	nop
	set	0x34, %o0
	stwa	%o4,	[%l7 + %o0] 0x04
loop_22:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x7
	wr	%g0,	0x18,	%asi
	stha	%i7,	[%l7 + 0x62] %asi
	tle	%icc,	0x1
	mova	%icc,	%g2,	%g7
	udiv	%l1,	0x0816,	%o2
	fbl,a	%fcc1,	loop_23
	sth	%o1,	[%l7 + 0x28]
	movcc	%icc,	%i1,	%i5
	fnor	%f18,	%f12,	%f22
loop_23:
	andn	%o3,	0x0DD9,	%g6
	te	%icc,	0x1
	fpsub32	%f24,	%f22,	%f4
	addc	%o7,	0x01B6,	%i0
	sdiv	%l6,	0x0874,	%i2
	movcc	%icc,	%i3,	%l0
	movrne	%g5,	0x005,	%i4
	movrgz	%g1,	%o0,	%l3
	ldd	[%l7 + 0x10],	%f30
	xor	%g3,	%l5,	%i6
	fpadd16s	%f27,	%f7,	%f0
	fcmpne32	%f18,	%f28,	%o5
	sdivx	%l4,	0x10C3,	%o6
	tgu	%xcc,	0x3
	tle	%xcc,	0x7
	addccc	%g4,	0x1B83,	%l2
	subc	%o4,	%g2,	%i7
	edge16n	%g7,	%o2,	%l1
	lduh	[%l7 + 0x52],	%i1
	bneg,a	%icc,	loop_24
	mova	%xcc,	%o1,	%o3
	fmovrsne	%i5,	%f10,	%f18
	sra	%o7,	0x12,	%i0
loop_24:
	array16	%g6,	%i2,	%l6
	smulcc	%l0,	%i3,	%g5
	array8	%i4,	%g1,	%o0
	fbo,a	%fcc2,	loop_25
	fpadd32s	%f26,	%f14,	%f13
	mulscc	%g3,	0x069C,	%l3
	sub	%l5,	0x01E2,	%o5
loop_25:
	sllx	%i6,	%l4,	%o6
	popc	%g4,	%o4
	tneg	%xcc,	0x1
	movcc	%xcc,	%g2,	%l2
	umul	%i7,	%g7,	%o2
	fmovdge	%icc,	%f27,	%f4
	fbo	%fcc3,	loop_26
	faligndata	%f10,	%f16,	%f0
	sll	%l1,	0x1F,	%i1
	movl	%icc,	%o1,	%i5
loop_26:
	movl	%xcc,	%o7,	%i0
	fpsub32	%f24,	%f30,	%f12
	wr	%g0,	0x88,	%asi
	stda	%g6,	[%l7 + 0x08] %asi
	xor	%o3,	0x1EC2,	%l6
	edge16ln	%i2,	%l0,	%g5
	fand	%f26,	%f10,	%f2
	move	%icc,	%i3,	%g1
	tcs	%xcc,	0x5
	wr	%g0,	0x81,	%asi
	sta	%f9,	[%l7 + 0x20] %asi
	tl	%xcc,	0x6
	tne	%icc,	0x3
	tn	%xcc,	0x7
	bn,a	loop_27
	subccc	%i4,	%g3,	%o0
	mova	%icc,	%l3,	%o5
	tsubcctv	%l5,	%i6,	%l4
loop_27:
	popc	%o6,	%g4
	sir	0x0BF5
	bgu	loop_28
	fmovrsne	%g2,	%f13,	%f26
	movrgz	%l2,	0x1D3,	%i7
	fmul8x16al	%f10,	%f5,	%f10
loop_28:
	edge32l	%g7,	%o2,	%o4
	udivcc	%l1,	0x1642,	%i1
	fbug	%fcc3,	loop_29
	fabsd	%f12,	%f24
	set	0x76, %l4
	stha	%o1,	[%l7 + %l4] 0x2a
	membar	#Sync
loop_29:
	tsubcctv	%o7,	%i0,	%i5
	edge8	%g6,	%o3,	%l6
	tne	%icc,	0x5
	and	%i2,	0x0D3C,	%g5
	fmovdgu	%xcc,	%f28,	%f11
	fxnors	%f22,	%f29,	%f25
	umul	%i3,	%g1,	%i4
	movrgez	%l0,	0x02D,	%o0
	membar	0x0E
	edge32ln	%l3,	%g3,	%o5
	fmovrde	%i6,	%f8,	%f26
	std	%l4,	[%l7 + 0x50]
	bneg,a	loop_30
	be,a,pt	%icc,	loop_31
	edge32l	%l4,	%o6,	%g4
	srlx	%l2,	0x16,	%i7
loop_30:
	and	%g7,	%o2,	%o4
loop_31:
	nop
	setx	loop_32,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot1	%f30,	%f16,	%f2
	tl	%xcc,	0x4
	sll	%g2,	%i1,	%o1
loop_32:
	std	%l0,	[%l7 + 0x28]
	movrne	%i0,	%i5,	%g6
	andcc	%o7,	0x183A,	%o3
	array16	%i2,	%g5,	%l6
	edge8	%g1,	%i4,	%i3
	edge8n	%l0,	%o0,	%g3
	stbar
	sll	%o5,	%i6,	%l5
	fmovrdgz	%l3,	%f0,	%f4
	brlez	%o6,	loop_33
	tle	%icc,	0x5
	movcc	%xcc,	%l4,	%g4
	fnot2	%f20,	%f0
loop_33:
	udiv	%l2,	0x1149,	%g7
	fmovrsne	%o2,	%f10,	%f5
	movgu	%icc,	%o4,	%g2
	orncc	%i7,	0x0BD8,	%o1
	fbn,a	%fcc3,	loop_34
	movcs	%icc,	%i1,	%l1
	tgu	%xcc,	0x4
	subcc	%i0,	0x02BD,	%g6
loop_34:
	fabsd	%f24,	%f26
	edge8	%o7,	%i5,	%i2
	tcc	%icc,	0x5
	andncc	%g5,	%l6,	%g1
	fbul	%fcc2,	loop_35
	fornot2s	%f7,	%f3,	%f1
	fcmpeq32	%f20,	%f12,	%o3
	movcc	%xcc,	%i4,	%l0
loop_35:
	tle	%icc,	0x6
	movvc	%icc,	%o0,	%g3
	bne,pt	%xcc,	loop_36
	movg	%xcc,	%o5,	%i3
	fpsub32s	%f17,	%f11,	%f31
	fmovrslez	%l5,	%f4,	%f18
loop_36:
	sdiv	%i6,	0x1359,	%l3
	fcmpne16	%f8,	%f2,	%o6
	fpsub16s	%f16,	%f8,	%f18
	tl	%icc,	0x0
	movl	%icc,	%g4,	%l2
	bcs,a	loop_37
	movg	%icc,	%l4,	%g7
	tsubcctv	%o2,	%g2,	%o4
	move	%icc,	%i7,	%o1
loop_37:
	edge16l	%l1,	%i0,	%g6
	addcc	%i1,	0x0C80,	%i5
	siam	0x7
	orn	%i2,	0x0C42,	%o7
	movle	%xcc,	%l6,	%g1
	tn	%xcc,	0x3
	std	%f20,	[%l7 + 0x70]
	fbu,a	%fcc1,	loop_38
	fmovrdlz	%g5,	%f24,	%f2
	umul	%o3,	0x0C83,	%l0
	sir	0x0178
loop_38:
	udiv	%i4,	0x1E07,	%g3
	udiv	%o0,	0x1EE0,	%o5
	array16	%l5,	%i3,	%i6
	set	0x20, %g5
	stda	%l2,	[%l7 + %g5] 0x80
	fpadd16	%f8,	%f30,	%f12
	array8	%o6,	%g4,	%l4
	pdist	%f20,	%f6,	%f2
	tvc	%icc,	0x0
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	fmovrslz	%o2,	%f3,	%f2
	fnot1s	%f31,	%f20
	edge32ln	%l2,	%o4,	%g2
	wr	%g0,	0x19,	%asi
	sta	%f15,	[%l7 + 0x40] %asi
	move	%xcc,	%i7,	%l1
	edge32ln	%i0,	%o1,	%g6
	mova	%icc,	%i1,	%i2
	orcc	%o7,	%l6,	%i5
	edge16ln	%g1,	%o3,	%l0
	bg,pt	%xcc,	loop_39
	fmovspos	%xcc,	%f7,	%f17
	andcc	%i4,	%g3,	%g5
	xor	%o5,	0x05E8,	%l5
loop_39:
	ldsw	[%l7 + 0x14],	%i3
	edge32	%i6,	%l3,	%o0
	tvs	%icc,	0x6
	edge8n	%g4,	%l4,	%g7
	movre	%o6,	%o2,	%l2
	movleu	%xcc,	%g2,	%o4
	fcmpeq32	%f14,	%f28,	%i7
	or	%l1,	%o1,	%g6
	umulcc	%i1,	%i2,	%i0
	te	%icc,	0x1
	fmovdvc	%xcc,	%f11,	%f11
	std	%o6,	[%l7 + 0x20]
	movrgz	%i5,	%g1,	%l6
	ta	%icc,	0x6
	nop
	setx loop_40, %l0, %l1
	jmpl %l1, %l0
	fcmpne16	%f18,	%f4,	%i4
	movre	%g3,	0x052,	%g5
	bne,a	loop_41
loop_40:
	edge16ln	%o5,	%l5,	%i3
	andn	%o3,	%i6,	%l3
	fcmpd	%fcc3,	%f24,	%f2
loop_41:
	fbu,a	%fcc1,	loop_42
	edge16	%o0,	%g4,	%l4
	fcmps	%fcc1,	%f9,	%f18
	add	%o6,	0x1325,	%o2
loop_42:
	fmovdcs	%icc,	%f31,	%f25
	xnor	%g7,	0x05A6,	%g2
	siam	0x6
	set	0x68, %g4
	ldxa	[%l7 + %g4] 0x0c,	%o4
	array32	%l2,	%i7,	%o1
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x15,	%l0
	ba,a,pn	%icc,	loop_43
	and	%i1,	%g6,	%i0
	fzeros	%f27
	nop
	set	0x1C, %l6
	ldsw	[%l7 + %l6],	%i2
loop_43:
	fandnot2s	%f10,	%f29,	%f13
	fsrc2s	%f30,	%f23
	subccc	%i5,	%o7,	%l6
	fmul8x16al	%f23,	%f23,	%f20
	stb	%g1,	[%l7 + 0x65]
	alignaddrl	%i4,	%l0,	%g5
	movvc	%icc,	%g3,	%o5
	fmovdgu	%icc,	%f5,	%f6
	or	%l5,	%o3,	%i6
	udivx	%i3,	0x0836,	%o0
	movne	%icc,	%l3,	%g4
	andcc	%l4,	0x16FE,	%o6
	movg	%xcc,	%g7,	%o2
	bl	loop_44
	fabsd	%f14,	%f16
	fmovsgu	%icc,	%f29,	%f29
	bpos,a,pt	%icc,	loop_45
loop_44:
	fpack32	%f10,	%f2,	%f24
	ta	%xcc,	0x3
	fmovrsgez	%g2,	%f12,	%f29
loop_45:
	bn,a	%icc,	loop_46
	movrlez	%l2,	%o4,	%o1
	orncc	%l1,	0x1C8F,	%i1
	smulcc	%i7,	0x0B04,	%g6
loop_46:
	addcc	%i2,	0x1AA7,	%i0
	fxors	%f24,	%f16,	%f9
	tpos	%icc,	0x2
	sra	%o7,	%l6,	%i5
	udivx	%i4,	0x0ED7,	%l0
	fors	%f0,	%f12,	%f19
	fcmpes	%fcc0,	%f22,	%f11
	bshuffle	%f26,	%f20,	%f22
	fble	%fcc0,	loop_47
	fmovs	%f30,	%f16
	fandnot1s	%f18,	%f0,	%f28
	fnor	%f2,	%f4,	%f22
loop_47:
	bvc,pn	%icc,	loop_48
	udiv	%g1,	0x1FA6,	%g5
	fmovsn	%icc,	%f10,	%f21
	bneg	loop_49
loop_48:
	tpos	%icc,	0x3
	fmovsl	%icc,	%f30,	%f20
	movcc	%xcc,	%g3,	%l5
loop_49:
	tcc	%icc,	0x7
	edge16l	%o3,	%o5,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o0,	%l3,	%g4
	edge16n	%i3,	%o6,	%g7
	smul	%l4,	%o2,	%g2
	edge8ln	%l2,	%o4,	%o1
	brgz	%l1,	loop_50
	fcmps	%fcc2,	%f1,	%f26
	ld	[%l7 + 0x58],	%f19
	taddcctv	%i7,	0x00A7,	%i1
loop_50:
	fmovrsne	%g6,	%f26,	%f12
	xor	%i0,	0x0BAD,	%o7
	sub	%i2,	%l6,	%i4
	ldstub	[%l7 + 0x14],	%i5
	tsubcctv	%g1,	0x1B3E,	%g5
	edge32n	%g3,	%l5,	%o3
	edge16	%l0,	%o5,	%o0
	subccc	%l3,	%g4,	%i6
	fnor	%f28,	%f26,	%f28
	tle	%icc,	0x4
	umulcc	%o6,	0x08E6,	%g7
	movle	%xcc,	%l4,	%i3
	movge	%icc,	%o2,	%g2
	movle	%icc,	%l2,	%o4
	sub	%l1,	0x1FA7,	%i7
	srl	%o1,	%i1,	%i0
	movrgz	%g6,	%o7,	%l6
	tsubcc	%i2,	0x1452,	%i5
	nop
	setx	loop_51,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	popc	0x17C2,	%g1
	bpos,a,pt	%icc,	loop_52
	sdivcc	%i4,	0x027C,	%g5
loop_51:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x19,	%g3,	%l5
loop_52:
	addc	%o3,	0x18FA,	%o5
	fmovdn	%icc,	%f11,	%f5
	sllx	%l0,	0x0F,	%l3
	umulcc	%o0,	0x1EE1,	%g4
	fandnot1s	%f11,	%f21,	%f29
	te	%xcc,	0x2
	umul	%o6,	%i6,	%g7
	call	loop_53
	edge32ln	%l4,	%i3,	%g2
	te	%xcc,	0x7
	udivcc	%l2,	0x105D,	%o2
loop_53:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x70] %asi,	%l1
	edge8ln	%o4,	%o1,	%i7
	fmovse	%icc,	%f18,	%f26
	fornot1s	%f7,	%f12,	%f29
	fmovdcc	%icc,	%f16,	%f9
	alignaddr	%i0,	%g6,	%i1
	xor	%o7,	%i2,	%i5
	fnands	%f18,	%f30,	%f22
	fbul	%fcc2,	loop_54
	ldx	[%l7 + 0x60],	%g1
	bneg,pn	%xcc,	loop_55
	xor	%i4,	0x0C36,	%l6
loop_54:
	fands	%f14,	%f9,	%f19
	pdist	%f2,	%f20,	%f24
loop_55:
	tge	%icc,	0x6
	edge32ln	%g3,	%l5,	%o3
	sir	0x1916
	movre	%g5,	%l0,	%o5
	fpsub16s	%f4,	%f24,	%f2
	ldx	[%l7 + 0x78],	%l3
	brgz	%g4,	loop_56
	movl	%xcc,	%o6,	%o0
	tge	%icc,	0x3
	ta	%xcc,	0x0
loop_56:
	fnands	%f18,	%f16,	%f29
	sir	0x01C7
	alignaddr	%g7,	%l4,	%i6
	movre	%g2,	0x323,	%i3
	fcmpeq16	%f18,	%f24,	%l2
	sdivx	%o2,	0x1B36,	%l1
	and	%o4,	%i7,	%i0
	andn	%o1,	0x1BC4,	%i1
	fmovdneg	%icc,	%f3,	%f19
	edge32	%o7,	%g6,	%i2
	mulx	%i5,	%g1,	%l6
	edge8	%g3,	%l5,	%i4
	movn	%icc,	%g5,	%o3
	tneg	%icc,	0x1
	movle	%xcc,	%o5,	%l0
	fxor	%f16,	%f4,	%f6
	fcmped	%fcc3,	%f26,	%f2
	tvc	%xcc,	0x3
	fble,a	%fcc0,	loop_57
	fnands	%f28,	%f21,	%f9
	sllx	%l3,	%o6,	%o0
	fmovdvc	%xcc,	%f19,	%f27
loop_57:
	tvc	%icc,	0x2
	fpsub32	%f14,	%f24,	%f24
	movle	%icc,	%g7,	%g4
	sdivcc	%i6,	0x1547,	%l4
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x78] %asi,	%g2
	fmul8ulx16	%f12,	%f30,	%f28
	movgu	%icc,	%l2,	%i3
	ldd	[%l7 + 0x58],	%f22
	brlz,a	%l1,	loop_58
	fbug,a	%fcc2,	loop_59
	bvc,a,pn	%xcc,	loop_60
	edge8n	%o2,	%o4,	%i7
loop_58:
	fmovrslz	%i0,	%f6,	%f28
loop_59:
	array16	%o1,	%o7,	%g6
loop_60:
	mova	%xcc,	%i1,	%i2
	addccc	%g1,	0x1930,	%l6
	umul	%i5,	%g3,	%i4
	sll	%l5,	0x14,	%g5
	popc	%o3,	%l0
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x08] %asi,	%l3
	fmovdcc	%icc,	%f27,	%f20
	tl	%icc,	0x7
	membar	0x5A
	fmovdpos	%xcc,	%f13,	%f9
	fmovde	%icc,	%f7,	%f7
	sdiv	%o6,	0x1E3A,	%o5
	fmovdcc	%icc,	%f25,	%f23
	ld	[%l7 + 0x18],	%f14
	mulx	%o0,	%g4,	%g7
	be,a,pt	%icc,	loop_61
	fcmpgt16	%f8,	%f16,	%l4
	bvs,pt	%xcc,	loop_62
	orncc	%i6,	%g2,	%i3
loop_61:
	movg	%icc,	%l1,	%o2
	smul	%o4,	%i7,	%i0
loop_62:
	lduh	[%l7 + 0x0E],	%l2
	mulx	%o1,	0x10E5,	%g6
	sdiv	%i1,	0x056D,	%o7
	orn	%i2,	%l6,	%g1
	edge16	%g3,	%i4,	%l5
	array32	%i5,	%o3,	%g5
	fxors	%f6,	%f22,	%f4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x11,	%l3,	%o6
	subcc	%o5,	0x086E,	%l0
	move	%xcc,	%o0,	%g4
	tgu	%xcc,	0x0
	xorcc	%g7,	0x134D,	%i6
	edge16	%g2,	%l4,	%l1
	smulcc	%i3,	0x1F4B,	%o4
	fmovsn	%xcc,	%f31,	%f15
	umul	%o2,	0x13F2,	%i7
	tge	%xcc,	0x7
	std	%i0,	[%l7 + 0x78]
	srlx	%o1,	%l2,	%i1
	edge8	%g6,	%i2,	%o7
	movle	%xcc,	%l6,	%g1
	edge16ln	%g3,	%l5,	%i5
	andncc	%o3,	%i4,	%g5
	tleu	%icc,	0x6
	ba	loop_63
	fcmpne32	%f26,	%f30,	%l3
	fcmps	%fcc0,	%f26,	%f25
	umulcc	%o5,	0x1109,	%l0
loop_63:
	movg	%icc,	%o6,	%o0
	subccc	%g4,	0x096D,	%g7
	edge32ln	%g2,	%l4,	%i6
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x08] %asi,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o4,	%l1,	%o2
	movleu	%xcc,	%i7,	%i0
	fpsub16	%f28,	%f14,	%f18
	st	%f29,	[%l7 + 0x48]
	tcc	%xcc,	0x3
	add	%l2,	%i1,	%o1
	fmovrdlez	%i2,	%f20,	%f4
	fxor	%f28,	%f8,	%f8
	movvs	%xcc,	%g6,	%o7
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x7E] %asi,	%l6
	tle	%icc,	0x2
	fabsd	%f2,	%f30
	bgu,a,pt	%icc,	loop_64
	orcc	%g3,	0x0B38,	%l5
	fandnot1	%f30,	%f10,	%f16
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x70] %asi,	%g1
loop_64:
	addccc	%i5,	0x01FF,	%i4
	mulx	%g5,	0x1228,	%l3
	popc	0x0F42,	%o5
	tg	%icc,	0x4
	movrne	%o3,	0x1E4,	%o6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%l0
	fbne	%fcc1,	loop_65
	tsubcctv	%g7,	%g2,	%g4
	fzero	%f16
	fnor	%f2,	%f16,	%f20
loop_65:
	bshuffle	%f26,	%f30,	%f26
	set	0x10, %g2
	stxa	%i6,	[%g0 + %g2] 0x21
	nop
	set	0x20, %i4
	prefetch	[%l7 + %i4],	 0x2
	movge	%xcc,	%l4,	%o4
	subcc	%i3,	0x0403,	%l1
	movrgez	%o2,	0x2D7,	%i0
	udivcc	%l2,	0x1817,	%i7
	fnand	%f24,	%f30,	%f10
	stb	%i1,	[%l7 + 0x70]
	movrgz	%i2,	%g6,	%o7
	bcs	%xcc,	loop_66
	movrlz	%l6,	%g3,	%l5
	fmovrde	%g1,	%f2,	%f26
	fbl,a	%fcc2,	loop_67
loop_66:
	array8	%i5,	%i4,	%o1
	fones	%f28
	tcc	%icc,	0x5
loop_67:
	xnor	%g5,	%o5,	%o3
	fmovsneg	%xcc,	%f6,	%f28
	addc	%l3,	0x0D14,	%o0
	movne	%xcc,	%l0,	%g7
	fmul8sux16	%f6,	%f28,	%f12
	fnot1s	%f25,	%f18
	sll	%g2,	0x00,	%g4
	orn	%i6,	0x1D6B,	%o6
	andn	%o4,	0x1B44,	%l4
	ble	loop_68
	tl	%xcc,	0x7
	fmovrsgz	%l1,	%f27,	%f15
	xnorcc	%o2,	%i3,	%i0
loop_68:
	sethi	0x001F,	%i7
	fmovdne	%icc,	%f28,	%f30
	subccc	%l2,	%i2,	%g6
	fands	%f21,	%f25,	%f20
	movcc	%xcc,	%i1,	%l6
	fexpand	%f25,	%f8
	umulcc	%g3,	%o7,	%g1
	fpadd32	%f4,	%f28,	%f10
	sdiv	%l5,	0x1873,	%i5
	addc	%i4,	%o1,	%o5
	fmovde	%icc,	%f7,	%f30
	tl	%icc,	0x3
	movvc	%xcc,	%o3,	%g5
	stbar
	edge32	%o0,	%l3,	%l0
	fmovse	%xcc,	%f10,	%f16
	edge8n	%g2,	%g7,	%g4
	pdist	%f6,	%f28,	%f8
	sdiv	%o6,	0x120A,	%o4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x0A] %asi,	%l4
	fandnot1s	%f3,	%f2,	%f25
	stb	%l1,	[%l7 + 0x29]
	set	0x60, %i5
	stda	%o2,	[%l7 + %i5] 0xe2
	membar	#Sync
	sra	%i3,	0x1C,	%i0
	fmovs	%f17,	%f24
	orcc	%i6,	%i7,	%l2
	edge8n	%i2,	%i1,	%l6
	bg,pn	%icc,	loop_69
	subccc	%g6,	0x12DF,	%g3
	std	%o6,	[%l7 + 0x10]
	subccc	%g1,	0x179F,	%i5
loop_69:
	alignaddr	%i4,	%o1,	%o5
	tvc	%xcc,	0x6
	fmovsle	%xcc,	%f31,	%f16
	fpackfix	%f2,	%f0
	fmovscc	%xcc,	%f15,	%f19
	movpos	%icc,	%o3,	%g5
	movrne	%o0,	%l3,	%l5
	popc	%l0,	%g7
	tl	%xcc,	0x1
	tvs	%icc,	0x6
	movn	%xcc,	%g2,	%o6
	te	%xcc,	0x4
	tsubcc	%o4,	%l4,	%l1
	umulcc	%o2,	%i3,	%i0
	xorcc	%i6,	%i7,	%l2
	fxnors	%f5,	%f15,	%f24
	tn	%icc,	0x3
	fcmped	%fcc2,	%f14,	%f6
	andncc	%g4,	%i2,	%i1
	for	%f24,	%f12,	%f10
	lduh	[%l7 + 0x7A],	%g6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovrsne	%l6,	%f4,	%f10
	andncc	%o7,	%g3,	%g1
	popc	%i5,	%i4
	bcs	%xcc,	loop_70
	sdiv	%o1,	0x121C,	%o3
	fbn	%fcc3,	loop_71
	fmovscc	%xcc,	%f3,	%f17
loop_70:
	movgu	%xcc,	%g5,	%o0
	orcc	%l3,	0x16A1,	%l5
loop_71:
	movrne	%o5,	0x0E9,	%g7
	fmovdcc	%icc,	%f20,	%f5
	fpmerge	%f11,	%f3,	%f18
	popc	%g2,	%l0
	srl	%o6,	%l4,	%o4
	bvs,pt	%xcc,	loop_72
	fnot2s	%f22,	%f11
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf1
	membar	#Sync
loop_72:
	addc	%o2,	%l1,	%i0
	ldd	[%l7 + 0x28],	%f12
	alignaddrl	%i6,	%i7,	%i3
	andn	%l2,	0x16EF,	%i2
	bcs,a	%xcc,	loop_73
	array16	%g4,	%g6,	%l6
	tneg	%xcc,	0x1
	fxors	%f14,	%f23,	%f24
loop_73:
	ldd	[%l7 + 0x78],	%o6
	fnegd	%f20,	%f22
	brlez,a	%i1,	loop_74
	fmovdge	%icc,	%f24,	%f9
	ta	%xcc,	0x5
	fbul	%fcc0,	loop_75
loop_74:
	subccc	%g3,	%i5,	%g1
	movl	%icc,	%o1,	%i4
	call	loop_76
loop_75:
	edge32l	%o3,	%o0,	%l3
	sdivcc	%l5,	0x1055,	%o5
	tleu	%icc,	0x4
loop_76:
	movrne	%g7,	%g2,	%l0
	fzero	%f28
	fpadd32	%f18,	%f8,	%f18
	fbue	%fcc2,	loop_77
	fcmple16	%f8,	%f30,	%g5
	taddcc	%o6,	%l4,	%o2
	fmovrsgez	%o4,	%f30,	%f28
loop_77:
	or	%i0,	0x0112,	%l1
	movneg	%icc,	%i6,	%i7
	set	0x20, %i2
	stxa	%l2,	[%l7 + %i2] 0x15
	smul	%i2,	%i3,	%g4
	fexpand	%f29,	%f14
	fsrc1	%f22,	%f28
	andn	%l6,	0x17F3,	%o7
	tne	%icc,	0x0
	fmovdvs	%icc,	%f1,	%f18
	mova	%icc,	%g6,	%i1
	sdivcc	%g3,	0x10B6,	%i5
	movn	%xcc,	%o1,	%g1
	movn	%xcc,	%i4,	%o3
	tvs	%xcc,	0x0
	smulcc	%o0,	0x1290,	%l5
	movcs	%xcc,	%l3,	%g7
	fba,a	%fcc0,	loop_78
	move	%xcc,	%o5,	%g2
	orn	%l0,	0x1254,	%g5
	bvc,a	%icc,	loop_79
loop_78:
	fbul	%fcc0,	loop_80
	nop
	setx	loop_81,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movne	%icc,	%l4,	%o2
loop_79:
	fblg,a	%fcc0,	loop_82
loop_80:
	smulcc	%o6,	0x1314,	%i0
loop_81:
	alignaddrl	%o4,	%l1,	%i7
	fcmps	%fcc1,	%f14,	%f15
loop_82:
	tle	%xcc,	0x7
	fcmps	%fcc0,	%f9,	%f4
	bge,pn	%xcc,	loop_83
	fmovscc	%xcc,	%f15,	%f30
	array32	%l2,	%i6,	%i3
	orn	%i2,	%l6,	%g4
loop_83:
	fmuld8sux16	%f14,	%f9,	%f28
	movrne	%g6,	0x253,	%o7
	movn	%icc,	%g3,	%i1
	popc	0x12F5,	%i5
	xnor	%o1,	%i4,	%g1
	fmovsn	%icc,	%f8,	%f12
	srax	%o0,	%o3,	%l3
	orn	%g7,	0x0078,	%o5
	tpos	%icc,	0x5
	fnor	%f28,	%f28,	%f30
	srax	%l5,	%g2,	%g5
	fbne	%fcc1,	loop_84
	fbl,a	%fcc1,	loop_85
	fba,a	%fcc1,	loop_86
	tsubcctv	%l4,	0x119D,	%o2
loop_84:
	fmovdvc	%xcc,	%f19,	%f19
loop_85:
	brz	%l0,	loop_87
loop_86:
	fbn	%fcc1,	loop_88
	fcmpgt32	%f10,	%f14,	%o6
	bgu,pn	%icc,	loop_89
loop_87:
	tsubcc	%o4,	%l1,	%i7
loop_88:
	xnorcc	%i0,	0x081B,	%l2
	edge32n	%i3,	%i6,	%i2
loop_89:
	fblg	%fcc2,	loop_90
	brgz,a	%l6,	loop_91
	smulcc	%g6,	0x128C,	%o7
	array16	%g3,	%g4,	%i5
loop_90:
	fmovsl	%icc,	%f29,	%f15
loop_91:
	array16	%i1,	%o1,	%i4
	tvc	%xcc,	0x6
	tl	%xcc,	0x6
	ldsb	[%l7 + 0x5D],	%o0
	fbg	%fcc2,	loop_92
	sdivx	%o3,	0x0BA4,	%g1
	faligndata	%f28,	%f28,	%f30
	andcc	%g7,	0x1CD4,	%o5
loop_92:
	fmovspos	%icc,	%f7,	%f14
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x6B] %asi,	%l5
	fpadd16	%f26,	%f26,	%f16
	fnor	%f0,	%f22,	%f26
	fmovdl	%icc,	%f4,	%f6
	fpadd32s	%f1,	%f22,	%f3
	fandnot2	%f20,	%f18,	%f20
	bleu,a	loop_93
	move	%xcc,	%l3,	%g5
	fnot2s	%f24,	%f11
	movleu	%icc,	%g2,	%o2
loop_93:
	nop
	setx loop_94, %l0, %l1
	jmpl %l1, %l0
	edge8ln	%l4,	%o4,	%o6
	movrlez	%l1,	%i7,	%i0
	fnegd	%f18,	%f16
loop_94:
	movcc	%icc,	%i3,	%i6
	fbg,a	%fcc1,	loop_95
	addccc	%i2,	0x171A,	%l6
	fmovsg	%xcc,	%f11,	%f22
	or	%l2,	%o7,	%g3
loop_95:
	movrgez	%g4,	%i5,	%g6
	popc	0x0425,	%i1
	fpackfix	%f16,	%f18
	fmovrsgz	%i4,	%f20,	%f23
	umulcc	%o0,	0x04BC,	%o1
	taddcc	%o3,	%g7,	%g1
	nop
	setx loop_96, %l0, %l1
	jmpl %l1, %l5
	edge8l	%o5,	%g5,	%g2
	set	0x7A, %l3
	lduba	[%l7 + %l3] 0x18,	%l3
loop_96:
	movl	%xcc,	%l0,	%l4
	fmul8ulx16	%f16,	%f16,	%f6
	fxnors	%f4,	%f20,	%f24
	tge	%icc,	0x7
	movg	%xcc,	%o4,	%o6
	orn	%l1,	%i7,	%o2
	addcc	%i3,	%i6,	%i2
	fbuge	%fcc2,	loop_97
	stw	%l6,	[%l7 + 0x6C]
	movpos	%xcc,	%i0,	%o7
	edge16l	%l2,	%g3,	%g4
loop_97:
	fpsub32s	%f10,	%f24,	%f11
	edge8n	%g6,	%i1,	%i4
	addccc	%i5,	0x01D8,	%o0
	sub	%o3,	%o1,	%g1
	umul	%l5,	0x02D9,	%o5
	fba	%fcc2,	loop_98
	bl,pn	%icc,	loop_99
	movrgez	%g7,	%g5,	%g2
	movgu	%xcc,	%l0,	%l4
loop_98:
	umul	%l3,	%o6,	%o4
loop_99:
	srax	%i7,	%o2,	%l1
	sllx	%i6,	%i3,	%l6
	tneg	%xcc,	0x5
	andncc	%i0,	%i2,	%o7
	xor	%l2,	%g4,	%g3
	orncc	%g6,	%i1,	%i4
	nop
	setx	loop_100,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlz	%i5,	%o0,	%o3
	movpos	%icc,	%g1,	%l5
	set	0x20, %i3
	ldswa	[%l7 + %i3] 0x0c,	%o1
loop_100:
	movpos	%xcc,	%o5,	%g7
	xorcc	%g5,	%l0,	%l4
	fands	%f30,	%f29,	%f1
	subcc	%g2,	0x1454,	%l3
	fpmerge	%f7,	%f28,	%f20
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
	fmovdn	%xcc,	%f5,	%f3
	udivcc	%o6,	0x058F,	%i7
	movg	%xcc,	%o2,	%l1
	ldstub	[%l7 + 0x42],	%i6
	ldx	[%l7 + 0x78],	%i3
	ldsb	[%l7 + 0x7B],	%i0
	ba,a	loop_101
	sra	%l6,	0x1E,	%i2
	ldsh	[%l7 + 0x68],	%l2
	movle	%icc,	%g4,	%g3
loop_101:
	stx	%o7,	[%l7 + 0x50]
	sra	%i1,	%i4,	%g6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x54] %asi,	%o0
	fnegs	%f12,	%f2
	sllx	%i5,	0x16,	%g1
	srl	%o3,	0x13,	%l5
	popc	0x00F2,	%o5
	ldub	[%l7 + 0x56],	%o1
	tleu	%icc,	0x0
	udivx	%g7,	0x0CD9,	%l0
	smulcc	%l4,	0x158C,	%g5
	andncc	%l3,	%o4,	%o6
	bn,pn	%xcc,	loop_102
	fmovdvs	%icc,	%f25,	%f27
	xor	%g2,	%i7,	%l1
	fmovde	%icc,	%f5,	%f21
loop_102:
	fpack16	%f16,	%f30
	edge32	%o2,	%i6,	%i3
	fornot1s	%f1,	%f10,	%f30
	tle	%icc,	0x5
	fmovsvc	%icc,	%f17,	%f30
	xnor	%i0,	0x0B97,	%l6
	fnand	%f6,	%f12,	%f14
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%l2
	or	%i2,	%g3,	%g4
	taddcctv	%i1,	%o7,	%i4
	tvc	%xcc,	0x6
	orncc	%g6,	0x1FAB,	%o0
	stbar
	andncc	%g1,	%o3,	%l5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%i5
	tn	%xcc,	0x0
	orcc	%o1,	0x1179,	%g7
	fpack32	%f18,	%f18,	%f4
	tsubcctv	%l4,	%l0,	%g5
	movre	%o4,	0x0A6,	%o6
	stx	%g2,	[%l7 + 0x70]
	sdiv	%l3,	0x00A8,	%i7
	udivcc	%l1,	0x1262,	%o2
	sdivx	%i6,	0x0E15,	%i0
	fba,a	%fcc0,	loop_103
	or	%i3,	%l6,	%i2
	fmovscs	%xcc,	%f18,	%f23
	sir	0x1201
loop_103:
	sethi	0x18D5,	%g3
	edge32l	%l2,	%g4,	%i1
	alignaddrl	%o7,	%g6,	%o0
	fxnors	%f23,	%f12,	%f20
	brgez,a	%g1,	loop_104
	taddcctv	%o3,	%i4,	%l5
	std	%i4,	[%l7 + 0x58]
	tneg	%xcc,	0x6
loop_104:
	tg	%xcc,	0x3
	fmovsg	%xcc,	%f7,	%f22
	addc	%o5,	0x0D0C,	%g7
	movne	%icc,	%l4,	%l0
	edge16	%g5,	%o4,	%o6
	set	0x4C, %g1
	stwa	%o1,	[%l7 + %g1] 0x18
	fbule	%fcc1,	loop_105
	prefetch	[%l7 + 0x20],	 0x2
	bne	loop_106
	movn	%icc,	%l3,	%g2
loop_105:
	tvs	%xcc,	0x4
	sdiv	%l1,	0x136F,	%i7
loop_106:
	fcmpne32	%f6,	%f2,	%i6
	fmovsvs	%xcc,	%f29,	%f25
	fbuge	%fcc0,	loop_107
	srlx	%o2,	%i0,	%l6
	movne	%icc,	%i3,	%g3
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x19,	%l2
loop_107:
	tcs	%icc,	0x6
	fmovrdne	%g4,	%f26,	%f30
	movvc	%xcc,	%i2,	%o7
	mulscc	%i1,	%o0,	%g1
	edge8n	%g6,	%i4,	%o3
	or	%l5,	0x1CCF,	%o5
	bge,a	loop_108
	bvs,a	%icc,	loop_109
	membar	0x07
	fandnot1s	%f25,	%f29,	%f11
loop_108:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_109:
	fpackfix	%f6,	%f13
	tneg	%xcc,	0x0
	te	%icc,	0x7
	tge	%icc,	0x6
	movl	%icc,	%i5,	%l4
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%g7
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x88,	%f0
	andcc	%l0,	0x15B6,	%o4
	fpsub32	%f2,	%f2,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g5,	%o1,	%o6
	fornot2s	%f24,	%f1,	%f2
	sdiv	%l3,	0x07BE,	%g2
	fmovrslez	%i7,	%f3,	%f14
	xor	%i6,	0x05A0,	%l1
	sra	%o2,	%l6,	%i3
	movpos	%xcc,	%g3,	%l2
	sdivcc	%g4,	0x1DB3,	%i0
	tge	%icc,	0x7
	addcc	%i2,	0x0ACF,	%o7
	tleu	%icc,	0x3
	fmul8sux16	%f2,	%f26,	%f24
	tsubcc	%o0,	0x0D10,	%g1
	fbule,a	%fcc0,	loop_110
	fnot2s	%f9,	%f16
	fornot1	%f6,	%f14,	%f24
	tgu	%icc,	0x4
loop_110:
	orcc	%i1,	%i4,	%g6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l5
	xnorcc	%o5,	%o3,	%i5
	edge32n	%l4,	%l0,	%g7
	nop
	setx	loop_111,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	flush	%l7 + 0x70
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%f28
	ldub	[%l7 + 0x6E],	%o4
loop_111:
	ld	[%l7 + 0x58],	%f12
	subc	%g5,	0x109A,	%o6
	array32	%l3,	%g2,	%i7
	movl	%icc,	%o1,	%i6
	fmul8x16	%f5,	%f12,	%f14
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x60] %asi,	%f5
	xorcc	%l1,	%o2,	%i3
	udivx	%l6,	0x0C1B,	%l2
	fxors	%f19,	%f20,	%f7
	udiv	%g3,	0x1B87,	%g4
	taddcctv	%i2,	0x0812,	%i0
	wr	%g0,	0x89,	%asi
	stda	%o0,	[%l7 + 0x38] %asi
	umulcc	%o7,	%g1,	%i1
	fcmpgt32	%f0,	%f30,	%g6
	lduw	[%l7 + 0x74],	%l5
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x50] %asi,	%o5
	tvs	%icc,	0x4
	bge,pt	%xcc,	loop_112
	stw	%i4,	[%l7 + 0x68]
	stw	%o3,	[%l7 + 0x34]
	xnor	%l4,	%i5,	%g7
loop_112:
	bge,a,pn	%icc,	loop_113
	ta	%xcc,	0x1
	tsubcctv	%l0,	0x1B75,	%o4
	srax	%o6,	%l3,	%g5
loop_113:
	xnorcc	%i7,	0x1457,	%o1
	fbul	%fcc2,	loop_114
	fble,a	%fcc3,	loop_115
	edge16n	%g2,	%l1,	%i6
	movrlez	%o2,	%l6,	%i3
loop_114:
	fmovsleu	%xcc,	%f4,	%f11
loop_115:
	fcmpeq32	%f6,	%f28,	%g3
	fbge,a	%fcc3,	loop_116
	edge8	%g4,	%l2,	%i2
	set	0x76, %o2
	lduba	[%l7 + %o2] 0x0c,	%o0
loop_116:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x20] %asi,	%i0
	movvs	%xcc,	%o7,	%i1
	array32	%g6,	%g1,	%o5
	fbue	%fcc1,	loop_117
	bne,pt	%icc,	loop_118
	sub	%i4,	0x15D1,	%o3
	xnorcc	%l5,	0x1CD5,	%l4
loop_117:
	movcc	%xcc,	%g7,	%i5
loop_118:
	mulscc	%o4,	0x0DDA,	%o6
	fbe,a	%fcc2,	loop_119
	tsubcctv	%l3,	0x19FA,	%g5
	edge16l	%i7,	%l0,	%o1
	ldstub	[%l7 + 0x35],	%g2
loop_119:
	movneg	%xcc,	%i6,	%l1
	umulcc	%l6,	%o2,	%i3
	brlz	%g3,	loop_120
	edge16l	%g4,	%i2,	%l2
	xnorcc	%o0,	%o7,	%i0
	tle	%icc,	0x3
loop_120:
	sdiv	%i1,	0x097F,	%g6
	taddcc	%o5,	0x0B3F,	%i4
	sethi	0x0488,	%g1
	nop
	set	0x79, %o4
	ldstub	[%l7 + %o4],	%l5
	xor	%l4,	%g7,	%i5
	tpos	%xcc,	0x2
	tvs	%icc,	0x7
	array32	%o4,	%o6,	%o3
	fmovse	%xcc,	%f20,	%f14
	srax	%l3,	0x00,	%i7
	tcs	%xcc,	0x2
	addccc	%l0,	0x1A80,	%o1
	movcc	%xcc,	%g5,	%g2
	tn	%icc,	0x6
	te	%xcc,	0x0
	fbug,a	%fcc2,	loop_121
	edge32	%l1,	%l6,	%o2
	fbo,a	%fcc1,	loop_122
	movrgez	%i6,	%i3,	%g4
loop_121:
	subc	%i2,	0x1F0E,	%g3
	fnot2s	%f9,	%f28
loop_122:
	sir	0x177D
	sub	%o0,	%l2,	%o7
	fpadd32	%f24,	%f24,	%f30
	addcc	%i1,	0x1B4D,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne	loop_123
	sub	%i0,	%i4,	%g1
	prefetch	[%l7 + 0x48],	 0x1
	andn	%l5,	0x11D5,	%o5
loop_123:
	movpos	%xcc,	%l4,	%i5
	fmovdcc	%xcc,	%f6,	%f25
	movre	%g7,	0x391,	%o6
	alignaddr	%o4,	%l3,	%i7
	andncc	%o3,	%o1,	%g5
	movge	%icc,	%l0,	%g2
	edge16ln	%l1,	%o2,	%i6
	fxors	%f10,	%f18,	%f4
	popc	%i3,	%l6
	brlz	%g4,	loop_124
	std	%i2,	[%l7 + 0x38]
	movneg	%xcc,	%o0,	%g3
	mova	%xcc,	%l2,	%i1
loop_124:
	alignaddr	%o7,	%i0,	%i4
	tne	%icc,	0x6
	brz,a	%g6,	loop_125
	fbue	%fcc1,	loop_126
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%icc,	0x1
loop_125:
	fmovda	%icc,	%f14,	%f29
loop_126:
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%g0
	xnor	%o5,	%l4,	%l5
	movre	%i5,	%g7,	%o4
	tvc	%icc,	0x6
	sir	0x1909
	tne	%icc,	0x0
	edge8	%o6,	%i7,	%l3
	sth	%o3,	[%l7 + 0x72]
	array32	%g5,	%o1,	%l0
	stb	%g2,	[%l7 + 0x0B]
	fornot2	%f4,	%f30,	%f28
	movre	%o2,	%l1,	%i6
	and	%l6,	%g4,	%i3
	tcs	%icc,	0x3
	movneg	%icc,	%i2,	%o0
	movleu	%xcc,	%g3,	%i1
	prefetch	[%l7 + 0x5C],	 0x1
	fba,a	%fcc3,	loop_127
	orcc	%l2,	%i0,	%o7
	sdiv	%i4,	0x1954,	%g1
	movpos	%icc,	%o5,	%g6
loop_127:
	sdivcc	%l4,	0x0DE3,	%l5
	ta	%xcc,	0x1
	fmul8x16al	%f0,	%f24,	%f26
	fbo,a	%fcc1,	loop_128
	udiv	%g7,	0x1B94,	%i5
	movrlez	%o4,	%i7,	%l3
	andn	%o6,	%o3,	%o1
loop_128:
	movcc	%icc,	%g5,	%l0
	tne	%xcc,	0x0
	std	%f22,	[%l7 + 0x70]
	umulcc	%o2,	%l1,	%g2
	set	0x32, %o3
	lduba	[%l7 + %o3] 0x88,	%l6
	movrne	%g4,	0x06F,	%i3
	fnors	%f1,	%f7,	%f26
	fble,a	%fcc0,	loop_129
	bne,a,pt	%icc,	loop_130
	fpsub32	%f28,	%f4,	%f8
	orncc	%i6,	0x191A,	%o0
loop_129:
	stb	%g3,	[%l7 + 0x77]
loop_130:
	fmovsn	%xcc,	%f10,	%f29
	movvs	%xcc,	%i1,	%l2
	edge8ln	%i2,	%o7,	%i0
	movpos	%xcc,	%g1,	%i4
	nop
	setx loop_131, %l0, %l1
	jmpl %l1, %g6
	orcc	%l4,	%l5,	%o5
	movrne	%g7,	0x142,	%i5
	add	%o4,	0x0E5E,	%i7
loop_131:
	andn	%o6,	%l3,	%o3
	tcc	%icc,	0x3
	sub	%o1,	%l0,	%g5
	sethi	0x0A7F,	%o2
	fpsub16s	%f11,	%f14,	%f21
	bne,a	%xcc,	loop_132
	movne	%xcc,	%g2,	%l1
	fpsub16	%f20,	%f10,	%f10
	fmovspos	%xcc,	%f28,	%f14
loop_132:
	sethi	0x17AE,	%g4
	subccc	%i3,	%l6,	%o0
	ldsw	[%l7 + 0x44],	%g3
	subc	%i6,	%l2,	%i2
	fbl,a	%fcc3,	loop_133
	movle	%icc,	%o7,	%i0
	move	%icc,	%g1,	%i1
	fmovdne	%icc,	%f14,	%f8
loop_133:
	bgu,pt	%xcc,	loop_134
	fnors	%f8,	%f4,	%f19
	fblg,a	%fcc3,	loop_135
	movrgez	%i4,	0x186,	%g6
loop_134:
	bge,a,pn	%xcc,	loop_136
	tcc	%xcc,	0x1
loop_135:
	movre	%l4,	0x3C7,	%o5
	ld	[%l7 + 0x64],	%f26
loop_136:
	stbar
	bneg,pn	%icc,	loop_137
	umulcc	%g7,	%i5,	%o4
	xorcc	%i7,	%o6,	%l3
	subcc	%o3,	%o1,	%l5
loop_137:
	umul	%l0,	%o2,	%g2
	edge16n	%l1,	%g5,	%i3
	tne	%icc,	0x5
	mulx	%g4,	0x1C8B,	%l6
	fbuge	%fcc1,	loop_138
	fnands	%f2,	%f23,	%f22
	brgez	%g3,	loop_139
	edge8n	%o0,	%l2,	%i2
loop_138:
	fmovscs	%icc,	%f7,	%f18
	brlz	%i6,	loop_140
loop_139:
	bcs,a	loop_141
	subcc	%i0,	%o7,	%i1
	movne	%icc,	%i4,	%g6
loop_140:
	addccc	%l4,	%o5,	%g1
loop_141:
	sdiv	%g7,	0x18BA,	%o4
	movleu	%icc,	%i5,	%o6
	umulcc	%i7,	%o3,	%o1
	fbl,a	%fcc0,	loop_142
	movrlz	%l3,	0x1AB,	%l5
	subccc	%o2,	%g2,	%l1
	edge8n	%g5,	%i3,	%l0
loop_142:
	fandnot1s	%f14,	%f17,	%f31
	smulcc	%g4,	0x1412,	%g3
	sub	%l6,	%o0,	%l2
	edge16	%i2,	%i6,	%o7
	nop
	setx	loop_143,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	st	%f4,	[%l7 + 0x44]
	tge	%icc,	0x0
	tcs	%icc,	0x2
loop_143:
	tneg	%icc,	0x0
	xorcc	%i1,	0x06FF,	%i4
	fmovdgu	%xcc,	%f0,	%f8
	nop
	set	0x26, %i1
	sth	%i0,	[%l7 + %i1]
	edge8	%l4,	%o5,	%g6
	fbn,a	%fcc2,	loop_144
	srl	%g1,	0x06,	%g7
	edge16ln	%i5,	%o4,	%i7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%o3,	%o6
loop_144:
	movne	%xcc,	%l3,	%l5
	alignaddrl	%o1,	%o2,	%l1
	stx	%g2,	[%l7 + 0x10]
	subccc	%i3,	%g5,	%g4
	ldsb	[%l7 + 0x60],	%l0
	array16	%g3,	%o0,	%l6
	movrgz	%i2,	%i6,	%o7
	fnor	%f0,	%f2,	%f22
	fmovrdlez	%i1,	%f2,	%f30
	stw	%i4,	[%l7 + 0x40]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x04,	%i0,	%l4
	fcmpd	%fcc1,	%f10,	%f20
	fandnot1s	%f15,	%f20,	%f1
	movge	%xcc,	%l2,	%o5
	tne	%xcc,	0x2
	mova	%icc,	%g1,	%g7
	fbe	%fcc0,	loop_145
	bcs	%icc,	loop_146
	tl	%xcc,	0x4
	movrgez	%g6,	%o4,	%i5
loop_145:
	umulcc	%o3,	0x0C23,	%o6
loop_146:
	ta	%xcc,	0x2
	edge8l	%i7,	%l5,	%o1
	fbne,a	%fcc0,	loop_147
	movrlez	%o2,	%l1,	%g2
	taddcctv	%l3,	%i3,	%g4
	edge32	%g5,	%l0,	%g3
loop_147:
	edge16	%l6,	%i2,	%o0
	sir	0x180C
	srax	%o7,	%i1,	%i4
	movvs	%icc,	%i0,	%i6
	bn,pt	%xcc,	loop_148
	tn	%xcc,	0x6
	tgu	%xcc,	0x0
	taddcc	%l4,	%o5,	%g1
loop_148:
	movcs	%xcc,	%g7,	%l2
	fmovdgu	%icc,	%f21,	%f8
	fcmpeq32	%f8,	%f26,	%g6
	fbge	%fcc0,	loop_149
	mulx	%o4,	0x0B16,	%i5
	fmovrsne	%o6,	%f23,	%f29
	movrgez	%i7,	%o3,	%o1
loop_149:
	movneg	%icc,	%o2,	%l1
	andn	%l5,	%g2,	%i3
	orn	%l3,	%g4,	%l0
	alignaddr	%g3,	%g5,	%i2
	movcc	%xcc,	%l6,	%o0
	andn	%i1,	%i4,	%i0
	movre	%o7,	0x1CC,	%l4
	fmovsn	%icc,	%f19,	%f22
	movvs	%xcc,	%i6,	%o5
	fmovdl	%icc,	%f26,	%f20
	fmovdl	%xcc,	%f20,	%f20
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	brgz,a	%g1,	loop_150
	movle	%xcc,	%l2,	%g7
	fandnot2s	%f23,	%f2,	%f16
	fsrc1	%f24,	%f2
loop_150:
	tge	%xcc,	0x7
	taddcctv	%o4,	%i5,	%o6
	movneg	%icc,	%g6,	%i7
	te	%icc,	0x1
	fmovrde	%o3,	%f28,	%f30
	fnegs	%f24,	%f13
	orncc	%o2,	0x12CB,	%o1
	array8	%l5,	%l1,	%g2
	array32	%i3,	%l3,	%g4
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
	fones	%f24
	orn	%g3,	0x0749,	%l0
	addc	%g5,	%i2,	%l6
loop_151:
	udivx	%i1,	0x1E5F,	%i4
	brnz	%o0,	loop_152
	fnors	%f1,	%f12,	%f18
	stx	%o7,	[%l7 + 0x28]
	fcmpeq16	%f26,	%f16,	%i0
loop_152:
	movrgez	%i6,	%o5,	%l4
	fmovrdne	%l2,	%f14,	%f22
	fblg,a	%fcc2,	loop_153
	edge32	%g7,	%o4,	%i5
	fands	%f19,	%f27,	%f28
	bvc	loop_154
loop_153:
	tg	%icc,	0x6
	array8	%o6,	%g6,	%g1
	movcs	%xcc,	%o3,	%i7
loop_154:
	tgu	%xcc,	0x6
	sub	%o1,	0x0209,	%o2
	bleu,a	loop_155
	bgu,a	%icc,	loop_156
	srlx	%l5,	0x1C,	%g2
	brz,a	%i3,	loop_157
loop_155:
	tl	%xcc,	0x5
loop_156:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc3,	loop_158
loop_157:
	movge	%xcc,	%l1,	%g4
	tge	%icc,	0x4
	fexpand	%f9,	%f16
loop_158:
	fmovsleu	%xcc,	%f18,	%f25
	xorcc	%g3,	0x1DC3,	%l3
	ldd	[%l7 + 0x58],	%l0
	ble,a	loop_159
	subcc	%i2,	%g5,	%l6
	mova	%xcc,	%i4,	%o0
	fbge	%fcc0,	loop_160
loop_159:
	fmovsg	%xcc,	%f10,	%f8
	set	0x20, %l1
	stha	%i1,	[%l7 + %l1] 0x10
loop_160:
	bge	loop_161
	fmovrslz	%i0,	%f28,	%f18
	mulscc	%i6,	%o7,	%o5
	umul	%l4,	0x1FDC,	%g7
loop_161:
	and	%l2,	%i5,	%o6
	movcs	%xcc,	%o4,	%g6
	or	%o3,	%i7,	%o1
	fpsub32	%f12,	%f14,	%f12
	wr	%g0,	0x2f,	%asi
	stba	%g1,	[%l7 + 0x34] %asi
	membar	#Sync
	movcs	%xcc,	%o2,	%g2
	te	%xcc,	0x6
	fandnot2s	%f22,	%f25,	%f20
	alignaddr	%i3,	%l5,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%xcc,	%f16,	%f27
	bneg	%icc,	loop_162
	alignaddrl	%g3,	%l3,	%g4
	move	%icc,	%i2,	%l0
	bn,a	%xcc,	loop_163
loop_162:
	sdiv	%g5,	0x00D3,	%l6
	tne	%icc,	0x6
	move	%icc,	%o0,	%i4
loop_163:
	add	%i1,	0x1D1E,	%i0
	fxnors	%f14,	%f15,	%f8
	udivx	%i6,	0x06F2,	%o7
	bneg,a	loop_164
	fandnot2	%f10,	%f4,	%f24
	srlx	%l4,	0x06,	%o5
	tge	%xcc,	0x7
loop_164:
	bg,a	%xcc,	loop_165
	taddcctv	%l2,	%g7,	%i5
	andcc	%o6,	0x1E7C,	%o4
	tle	%icc,	0x6
loop_165:
	udivcc	%o3,	0x1CA0,	%i7
	addc	%g6,	0x0311,	%o1
	fpadd16s	%f8,	%f6,	%f8
	fcmple16	%f10,	%f28,	%o2
	brz,a	%g2,	loop_166
	movneg	%xcc,	%i3,	%g1
	add	%l5,	%l1,	%g3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x6D] %asi,	%l3
loop_166:
	mulx	%g4,	0x0D51,	%l0
	addcc	%g5,	%l6,	%o0
	ldd	[%l7 + 0x68],	%f12
	edge16ln	%i2,	%i1,	%i0
	tge	%icc,	0x3
	movg	%icc,	%i6,	%i4
	sllx	%l4,	0x10,	%o5
	fmovdne	%xcc,	%f4,	%f6
	addcc	%l2,	0x1E70,	%o7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x1A] %asi,	%i5
	popc	%o6,	%o4
	sth	%g7,	[%l7 + 0x24]
	fblg	%fcc1,	loop_167
	addcc	%o3,	0x12B3,	%i7
	tl	%icc,	0x4
	fnot2s	%f14,	%f21
loop_167:
	stx	%g6,	[%l7 + 0x30]
	alignaddr	%o1,	%o2,	%i3
	fmovdne	%xcc,	%f13,	%f2
	set	0x48, %o5
	stxa	%g1,	[%l7 + %o5] 0x04
	te	%xcc,	0x2
	addc	%l5,	%g2,	%g3
	tle	%xcc,	0x5
	edge32ln	%l3,	%g4,	%l1
	popc	0x09D1,	%g5
	and	%l6,	0x0EF8,	%l0
	orn	%i2,	0x093A,	%o0
	edge16	%i1,	%i6,	%i4
	subccc	%l4,	%i0,	%o5
	movg	%xcc,	%l2,	%i5
	andncc	%o7,	%o4,	%o6
	bl,a	%xcc,	loop_168
	fmovrdne	%o3,	%f4,	%f6
	fmovscc	%xcc,	%f31,	%f28
	smul	%g7,	%i7,	%g6
loop_168:
	bcs,pt	%xcc,	loop_169
	smulcc	%o1,	%i3,	%o2
	andncc	%g1,	%l5,	%g2
	edge32n	%l3,	%g3,	%g4
loop_169:
	movn	%xcc,	%g5,	%l6
	fcmple32	%f20,	%f12,	%l0
	tn	%icc,	0x4
	movre	%i2,	0x067,	%l1
	fornot1	%f30,	%f30,	%f4
	movrgz	%i1,	%o0,	%i4
	stbar
	edge32n	%i6,	%l4,	%i0
	brlez,a	%l2,	loop_170
	tsubcc	%o5,	0x145F,	%o7
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x16,	%f16
loop_170:
	sllx	%i5,	%o4,	%o6
	mulx	%o3,	0x01C0,	%i7
	orncc	%g6,	0x1DA0,	%g7
	edge16n	%o1,	%i3,	%g1
	fmovrslez	%l5,	%f15,	%f5
	edge32ln	%g2,	%l3,	%g3
	fmovse	%icc,	%f14,	%f31
	bneg,pn	%xcc,	loop_171
	fbug	%fcc0,	loop_172
	movrlez	%g4,	0x3D1,	%o2
	std	%f2,	[%l7 + 0x78]
loop_171:
	fpack32	%f14,	%f28,	%f24
loop_172:
	ldx	[%l7 + 0x48],	%g5
	umulcc	%l6,	0x0914,	%l0
	brgez,a	%i2,	loop_173
	movrne	%l1,	%i1,	%o0
	umul	%i6,	%i4,	%i0
	fmovsge	%icc,	%f28,	%f23
loop_173:
	edge32l	%l4,	%l2,	%o7
	mulscc	%o5,	%i5,	%o6
	andcc	%o3,	%o4,	%g6
	edge8l	%g7,	%o1,	%i7
	sth	%i3,	[%l7 + 0x2A]
	bshuffle	%f26,	%f30,	%f4
	array8	%l5,	%g2,	%g1
	tvc	%icc,	0x6
	orn	%l3,	0x014B,	%g4
	mulscc	%g3,	0x14FE,	%g5
	st	%f1,	[%l7 + 0x6C]
	xor	%l6,	%l0,	%i2
	sra	%o2,	%i1,	%l1
	sth	%i6,	[%l7 + 0x24]
	tsubcctv	%o0,	0x166D,	%i4
	srlx	%i0,	0x0E,	%l4
	edge32ln	%l2,	%o5,	%i5
	add	%o7,	0x1486,	%o6
	fnor	%f22,	%f16,	%f24
	fmovsge	%xcc,	%f8,	%f18
	movcs	%icc,	%o4,	%g6
	andcc	%o3,	%g7,	%i7
	orncc	%o1,	%i3,	%g2
	sethi	0x036A,	%g1
	mulscc	%l3,	%l5,	%g3
	fmovda	%icc,	%f28,	%f2
	bge,a,pn	%icc,	loop_174
	tle	%icc,	0x1
	tgu	%icc,	0x5
	movrgez	%g4,	0x2CD,	%g5
loop_174:
	umulcc	%l0,	%l6,	%o2
	andncc	%i2,	%l1,	%i1
	fones	%f23
	bl,pn	%icc,	loop_175
	fcmpgt16	%f18,	%f28,	%i6
	stx	%i4,	[%l7 + 0x30]
	bvc,a	loop_176
loop_175:
	membar	0x68
	fmul8x16al	%f21,	%f20,	%f18
	fxor	%f8,	%f26,	%f6
loop_176:
	ta	%xcc,	0x6
	mova	%icc,	%o0,	%l4
	tne	%icc,	0x4
	set	0x58, %o7
	ldswa	[%l7 + %o7] 0x15,	%i0
	sra	%l2,	%i5,	%o7
	fandnot1s	%f0,	%f21,	%f5
	and	%o5,	%o6,	%o4
	tcc	%icc,	0x4
	bvc,pt	%icc,	loop_177
	nop
	set	0x58, %g7
	ldsb	[%l7 + %g7],	%g6
	fbn	%fcc1,	loop_178
	fors	%f13,	%f3,	%f14
loop_177:
	movl	%icc,	%o3,	%g7
	set	0x40, %l0
	ldsha	[%l7 + %l0] 0x04,	%o1
loop_178:
	stw	%i3,	[%l7 + 0x54]
	wr	%g0,	0x2a,	%asi
	stba	%i7,	[%l7 + 0x61] %asi
	membar	#Sync
	tneg	%icc,	0x6
	sdivx	%g1,	0x1E37,	%l3
	subcc	%g2,	%l5,	%g3
	ldx	[%l7 + 0x10],	%g4
	sllx	%g5,	%l6,	%l0
	orncc	%i2,	%o2,	%i1
	st	%f12,	[%l7 + 0x50]
	addccc	%l1,	%i4,	%i6
	popc	%o0,	%l4
	fmovsvc	%xcc,	%f18,	%f5
	bneg	%xcc,	loop_179
	udivx	%i0,	0x13AE,	%i5
	ldub	[%l7 + 0x39],	%o7
	taddcc	%l2,	%o5,	%o4
loop_179:
	movneg	%icc,	%g6,	%o6
	ldsh	[%l7 + 0x52],	%g7
	fbug,a	%fcc2,	loop_180
	mulscc	%o3,	0x01D7,	%o1
	fblg	%fcc0,	loop_181
	fmovdne	%xcc,	%f21,	%f6
loop_180:
	tn	%xcc,	0x7
	array8	%i3,	%g1,	%i7
loop_181:
	umulcc	%l3,	%g2,	%g3
	movne	%xcc,	%l5,	%g4
	movge	%icc,	%l6,	%l0
	orcc	%i2,	0x085B,	%o2
	edge32n	%g5,	%l1,	%i4
	tne	%xcc,	0x5
	array8	%i1,	%i6,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f26,	%f6
	fmovde	%icc,	%f10,	%f0
	bvc,pn	%xcc,	loop_182
	tl	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o0,	0x0BE8,	%i5
loop_182:
	alignaddr	%o7,	%l2,	%i0
	fmovsneg	%xcc,	%f31,	%f9
	movrgz	%o5,	0x26E,	%g6
	sdiv	%o4,	0x1A0A,	%o6
	movneg	%xcc,	%g7,	%o3
	fcmps	%fcc1,	%f18,	%f14
	std	%f4,	[%l7 + 0x28]
	tne	%icc,	0x0
	sir	0x0E2B
	movpos	%icc,	%o1,	%g1
	alignaddrl	%i3,	%l3,	%i7
	add	%g2,	0x0939,	%l5
	edge32	%g4,	%l6,	%g3
	fbne,a	%fcc0,	loop_183
	orcc	%i2,	0x1E2B,	%o2
	tcc	%icc,	0x2
	fbug,a	%fcc0,	loop_184
loop_183:
	array16	%g5,	%l1,	%l0
	or	%i4,	%i1,	%l4
	lduw	[%l7 + 0x5C],	%i6
loop_184:
	movl	%xcc,	%o0,	%i5
	edge8l	%o7,	%i0,	%l2
	alignaddr	%o5,	%o4,	%g6
	movcs	%icc,	%o6,	%g7
	fmovrsgz	%o3,	%f25,	%f14
	fsrc2s	%f10,	%f11
	alignaddr	%g1,	%o1,	%l3
	fands	%f25,	%f27,	%f1
	bpos,pt	%icc,	loop_185
	alignaddr	%i3,	%g2,	%l5
	edge16l	%g4,	%l6,	%i7
	tcc	%xcc,	0x7
loop_185:
	movle	%icc,	%i2,	%g3
	fmovda	%icc,	%f3,	%f7
	tleu	%icc,	0x2
	fand	%f18,	%f28,	%f14
	nop
	setx	loop_186,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxnors	%f24,	%f25,	%f28
	smul	%o2,	%l1,	%g5
	ldsw	[%l7 + 0x70],	%l0
loop_186:
	sdiv	%i4,	0x06CD,	%l4
	fones	%f10
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x36] %asi,	%i6
	brz,a	%o0,	loop_187
	smulcc	%i1,	0x030D,	%o7
	tvs	%icc,	0x1
	nop
	setx	loop_188,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_187:
	fzeros	%f3
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x24] %asi,	%i0
loop_188:
	nop
	set	0x70, %i0
	stha	%l2,	[%l7 + %i0] 0x18
	membar	0x68
	subc	%o5,	0x19E2,	%o4
	udivx	%i5,	0x1C1B,	%o6
	movrne	%g6,	%o3,	%g7
	fxnors	%f15,	%f16,	%f28
	fnot2s	%f23,	%f8
	bg,a,pt	%icc,	loop_189
	tle	%icc,	0x2
	fmovrdgz	%g1,	%f6,	%f10
	swap	[%l7 + 0x6C],	%l3
loop_189:
	movrlz	%o1,	0x067,	%i3
	mulx	%g2,	0x0462,	%l5
	tl	%xcc,	0x0
	fbue	%fcc3,	loop_190
	fexpand	%f11,	%f4
	fmovdneg	%xcc,	%f19,	%f22
	movrlez	%l6,	0x120,	%g4
loop_190:
	fbug	%fcc2,	loop_191
	movrgz	%i7,	0x27E,	%i2
	fmovsn	%icc,	%f7,	%f8
	edge32l	%g3,	%l1,	%g5
loop_191:
	movrlez	%l0,	0x37A,	%i4
	movrlz	%o2,	%i6,	%o0
	fbg	%fcc0,	loop_192
	movrne	%l4,	0x008,	%i1
	nop
	setx	loop_193,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sll	%o7,	%i0,	%o5
loop_192:
	subccc	%o4,	0x167E,	%i5
	fcmpgt32	%f2,	%f16,	%o6
loop_193:
	tle	%icc,	0x0
	xor	%g6,	0x159B,	%l2
	srl	%o3,	0x08,	%g7
	orcc	%g1,	0x1116,	%o1
	movneg	%icc,	%l3,	%g2
	xor	%l5,	0x1C2A,	%i3
	fbne	%fcc2,	loop_194
	tgu	%xcc,	0x5
	edge16ln	%g4,	%i7,	%i2
	array32	%l6,	%l1,	%g3
loop_194:
	fxors	%f21,	%f17,	%f31
	bcs,a	%xcc,	loop_195
	fbne	%fcc0,	loop_196
	srl	%g5,	0x1C,	%l0
	fmovsvc	%xcc,	%f13,	%f17
loop_195:
	fmovdn	%xcc,	%f12,	%f22
loop_196:
	sethi	0x03B1,	%o2
	srl	%i6,	%i4,	%o0
	fba	%fcc2,	loop_197
	fmovdl	%xcc,	%f3,	%f28
	addcc	%i1,	%l4,	%i0
	fmovdgu	%icc,	%f24,	%f6
loop_197:
	udivx	%o7,	0x0432,	%o5
	movleu	%xcc,	%o4,	%o6
	st	%f30,	[%l7 + 0x40]
	fexpand	%f18,	%f22
	or	%i5,	%l2,	%o3
	sra	%g7,	%g1,	%o1
	brlz,a	%g6,	loop_198
	ta	%icc,	0x0
	add	%l3,	%g2,	%l5
	sdivcc	%g4,	0x1496,	%i3
loop_198:
	sdivx	%i2,	0x0CB5,	%i7
	smulcc	%l1,	0x0598,	%l6
	udivx	%g3,	0x14D4,	%l0
	addc	%g5,	%i6,	%o2
	fblg	%fcc0,	loop_199
	membar	0x3E
	set	0x40, %o0
	ldswa	[%l7 + %o0] 0x80,	%i4
loop_199:
	fmovs	%f18,	%f1
	fcmple16	%f28,	%f6,	%o0
	flush	%l7 + 0x18
	bcc,pt	%xcc,	loop_200
	fmul8x16al	%f26,	%f17,	%f20
	tgu	%icc,	0x6
	tpos	%xcc,	0x0
loop_200:
	movle	%icc,	%i1,	%l4
	movvs	%xcc,	%o7,	%o5
	movgu	%icc,	%o4,	%o6
	tcc	%xcc,	0x4
	andcc	%i0,	%i5,	%o3
	add	%l2,	%g7,	%o1
	fbe	%fcc0,	loop_201
	movrgz	%g1,	%g6,	%g2
	taddcctv	%l3,	%g4,	%i3
	umulcc	%l5,	%i7,	%l1
loop_201:
	xor	%l6,	0x0078,	%i2
	fmovsl	%icc,	%f4,	%f15
	xorcc	%g3,	0x0AF3,	%l0
	xor	%g5,	%o2,	%i4
	edge8l	%o0,	%i1,	%l4
	fabss	%f21,	%f27
	fmovda	%xcc,	%f29,	%f20
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x58] %asi,	%f6
	subc	%o7,	%o5,	%o4
	fcmpne16	%f28,	%f10,	%o6
	fmovdvc	%icc,	%f12,	%f11
	movne	%xcc,	%i6,	%i5
	fnot2	%f6,	%f10
	for	%f20,	%f20,	%f2
	tne	%xcc,	0x7
	array8	%o3,	%l2,	%i0
	addc	%o1,	0x115C,	%g7
	wr	%g0,	0x2f,	%asi
	stda	%g6,	[%l7 + 0x38] %asi
	membar	#Sync
	edge8ln	%g1,	%g2,	%g4
	fbge,a	%fcc3,	loop_202
	movrgez	%i3,	0x102,	%l5
	fbge	%fcc0,	loop_203
	umulcc	%i7,	%l1,	%l6
loop_202:
	fmovrsgez	%i2,	%f21,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_203:
	sdiv	%g3,	0x07B0,	%l0
	popc	%g5,	%l3
	array16	%o2,	%o0,	%i4
	fcmpeq16	%f22,	%f28,	%i1
	fbn,a	%fcc0,	loop_204
	umul	%l4,	0x1E31,	%o5
	fnot1s	%f17,	%f20
	srl	%o7,	0x00,	%o4
loop_204:
	fmovdge	%icc,	%f23,	%f10
	sllx	%o6,	%i6,	%i5
	edge32l	%o3,	%i0,	%o1
	fmovrsgez	%l2,	%f30,	%f15
	xor	%g7,	0x12EB,	%g6
	array16	%g2,	%g4,	%i3
	sllx	%g1,	0x18,	%l5
	edge8n	%i7,	%l1,	%l6
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x04,	%f0
	fmovsgu	%icc,	%f16,	%f18
	lduw	[%l7 + 0x14],	%i2
	fpmerge	%f15,	%f10,	%f10
	subccc	%l0,	0x07EC,	%g3
	stbar
	edge32	%l3,	%g5,	%o2
	prefetch	[%l7 + 0x30],	 0x1
	movpos	%xcc,	%o0,	%i1
	fbne	%fcc0,	loop_205
	and	%l4,	0x089D,	%o5
	xorcc	%i4,	0x1079,	%o7
	fmovdcs	%xcc,	%f16,	%f13
loop_205:
	andn	%o4,	%i6,	%i5
	sll	%o3,	%i0,	%o1
	fbu	%fcc1,	loop_206
	fandnot1s	%f11,	%f12,	%f15
	xnor	%o6,	%g7,	%g6
	subc	%l2,	%g2,	%g4
loop_206:
	ta	%xcc,	0x5
	movre	%i3,	%g1,	%l5
	set	0x54, %g5
	sta	%f22,	[%l7 + %g5] 0x11
	tne	%icc,	0x7
	andn	%i7,	0x00AA,	%l1
	movn	%icc,	%i2,	%l0
	srl	%l6,	%l3,	%g5
	brgez,a	%g3,	loop_207
	fnor	%f4,	%f28,	%f24
	sdiv	%o2,	0x03B3,	%o0
	movrne	%l4,	0x058,	%o5
loop_207:
	movne	%icc,	%i4,	%o7
	movrne	%o4,	0x0C2,	%i1
	stx	%i5,	[%l7 + 0x30]
	fcmps	%fcc0,	%f9,	%f12
	sllx	%o3,	0x1A,	%i6
	umulcc	%o1,	0x056B,	%i0
	smulcc	%o6,	0x0E5B,	%g7
	movrlz	%l2,	0x1CD,	%g6
	udiv	%g4,	0x17A9,	%i3
	fabsd	%f16,	%f14
	movleu	%xcc,	%g2,	%l5
	fmovdcc	%xcc,	%f0,	%f11
	array16	%i7,	%l1,	%i2
	orn	%g1,	%l6,	%l0
	fmovrdlez	%g5,	%f26,	%f0
	fmovdcc	%xcc,	%f22,	%f1
	fmovsleu	%icc,	%f4,	%f22
	set	0x38, %l4
	swapa	[%l7 + %l4] 0x81,	%g3
	edge8l	%o2,	%o0,	%l4
	taddcc	%l3,	0x1DC2,	%o5
	nop
	setx	loop_208,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%i4,	%o4,	%o7
	sir	0x0546
	edge8l	%i5,	%o3,	%i6
loop_208:
	movvc	%icc,	%o1,	%i0
	fnors	%f30,	%f14,	%f4
	udivcc	%i1,	0x0056,	%o6
	pdist	%f20,	%f12,	%f20
	tsubcc	%l2,	0x17EB,	%g6
	fone	%f8
	fmovsa	%icc,	%f14,	%f29
	orn	%g7,	%g4,	%g2
	srlx	%l5,	%i3,	%i7
	tg	%icc,	0x6
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x0A] %asi,	%l1
	bg,a,pt	%xcc,	loop_209
	nop
	setx	loop_210,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fexpand	%f15,	%f18
	movgu	%icc,	%i2,	%l6
loop_209:
	or	%l0,	%g5,	%g3
loop_210:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%o0
	lduw	[%l7 + 0x64],	%l4
	ble,a,pt	%xcc,	loop_211
	mulscc	%l3,	0x0F0C,	%g1
	lduw	[%l7 + 0x24],	%o5
	subcc	%i4,	%o4,	%o7
loop_211:
	tsubcc	%i5,	0x0FBD,	%o3
	fmul8ulx16	%f12,	%f26,	%f14
	edge8n	%i6,	%o1,	%i1
	movre	%o6,	%l2,	%g6
	xorcc	%g7,	%i0,	%g4
	edge32	%g2,	%l5,	%i7
	sdiv	%i3,	0x018C,	%i2
	tcc	%xcc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x1
	tvc	%xcc,	0x7
	wr	%g0,	0xea,	%asi
	stxa	%l6,	[%l7 + 0x20] %asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l0,	0x117B,	%l1
	smul	%g5,	%g3,	%o2
	fands	%f28,	%f6,	%f4
	and	%o0,	%l3,	%l4
	tcs	%icc,	0x7
	bcc	%icc,	loop_212
	tne	%xcc,	0x3
	smulcc	%g1,	0x0B19,	%i4
	xnorcc	%o5,	%o4,	%i5
loop_212:
	edge16ln	%o3,	%o7,	%i6
	sra	%o1,	%o6,	%i1
	edge32	%g6,	%g7,	%i0
	taddcctv	%l2,	%g2,	%l5
	movvc	%icc,	%g4,	%i7
	andn	%i3,	0x16E6,	%l6
	fpack16	%f14,	%f3
	movrlez	%i2,	%l1,	%l0
	fsrc1	%f30,	%f6
	fpackfix	%f14,	%f30
	fmovdne	%xcc,	%f15,	%f28
	std	%f24,	[%l7 + 0x28]
	fmovdcs	%icc,	%f7,	%f3
	fmovrdne	%g5,	%f28,	%f2
	fzero	%f14
	srax	%g3,	0x05,	%o2
	fmovdgu	%xcc,	%f18,	%f20
	sth	%l3,	[%l7 + 0x50]
	wr	%g0,	0x19,	%asi
	sta	%f22,	[%l7 + 0x38] %asi
	sth	%l4,	[%l7 + 0x2E]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g1,	%o0,	%i4
	xnor	%o5,	0x1EA1,	%i5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o3,	%o7
	edge16n	%o4,	%o1,	%i6
	fbe,a	%fcc0,	loop_213
	array16	%o6,	%i1,	%g7
	addccc	%g6,	%l2,	%g2
	bvs	%icc,	loop_214
loop_213:
	umulcc	%i0,	%g4,	%l5
	fbo	%fcc0,	loop_215
	tsubcc	%i3,	%i7,	%i2
loop_214:
	smulcc	%l6,	0x1427,	%l0
	orncc	%g5,	0x1159,	%l1
loop_215:
	bn,a,pn	%icc,	loop_216
	bg,a,pt	%icc,	loop_217
	tsubcc	%o2,	%g3,	%l3
	membar	0x36
loop_216:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x40] %asi,	%g1
loop_217:
	fcmps	%fcc2,	%f21,	%f25
	set	0x27, %l2
	ldsba	[%l7 + %l2] 0x81,	%l4
	fmul8sux16	%f10,	%f14,	%f26
	fmovde	%icc,	%f26,	%f28
	sdivcc	%o0,	0x1D66,	%o5
	movcc	%icc,	%i5,	%i4
	tsubcctv	%o3,	%o4,	%o1
	sdiv	%i6,	0x1841,	%o6
	set	0x5A, %l6
	stba	%i1,	[%l7 + %l6] 0x19
	tcs	%icc,	0x4
	fnot1	%f18,	%f12
	movge	%xcc,	%o7,	%g6
	move	%icc,	%g7,	%g2
	fmul8ulx16	%f10,	%f24,	%f22
	ba,a,pn	%icc,	loop_218
	tleu	%icc,	0x0
	movleu	%xcc,	%l2,	%i0
	movge	%icc,	%l5,	%i3
loop_218:
	movne	%icc,	%g4,	%i2
	brgez,a	%l6,	loop_219
	ta	%xcc,	0x0
	sra	%l0,	0x00,	%g5
	edge16	%l1,	%i7,	%o2
loop_219:
	array8	%l3,	%g1,	%l4
	xorcc	%o0,	0x19AC,	%o5
	fbl,a	%fcc1,	loop_220
	taddcctv	%g3,	%i4,	%o3
	bgu	loop_221
	movvs	%icc,	%o4,	%i5
loop_220:
	and	%o1,	0x09B9,	%i6
	fandnot2s	%f16,	%f10,	%f22
loop_221:
	edge16l	%o6,	%o7,	%g6
	edge32	%i1,	%g2,	%l2
	tneg	%icc,	0x7
	tvc	%icc,	0x0
	smul	%g7,	%l5,	%i0
	movleu	%icc,	%g4,	%i3
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x50] %asi,	%l6
	movpos	%xcc,	%l0,	%i2
	edge16n	%g5,	%l1,	%o2
	bvs,pn	%icc,	loop_222
	tsubcctv	%l3,	0x0328,	%g1
	edge8l	%l4,	%i7,	%o5
	fcmple16	%f10,	%f22,	%o0
loop_222:
	edge8ln	%i4,	%o3,	%o4
	stw	%i5,	[%l7 + 0x78]
	movgu	%xcc,	%o1,	%g3
	mulx	%o6,	%i6,	%g6
	fcmped	%fcc3,	%f30,	%f22
	for	%f16,	%f10,	%f12
	nop
	setx loop_223, %l0, %l1
	jmpl %l1, %i1
	edge8	%g2,	%o7,	%g7
	bn,a	loop_224
	tsubcc	%l2,	0x1773,	%i0
loop_223:
	fornot1s	%f30,	%f28,	%f23
	ta	%xcc,	0x2
loop_224:
	alignaddrl	%l5,	%g4,	%i3
	tvc	%icc,	0x7
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf1,	%f16
	srl	%l0,	0x08,	%l6
	fbul,a	%fcc1,	loop_225
	array32	%i2,	%g5,	%o2
	set	0x28, %g4
	stda	%l2,	[%l7 + %g4] 0x14
loop_225:
	movleu	%icc,	%g1,	%l4
	sdivcc	%i7,	0x05DF,	%l1
	ldd	[%l7 + 0x48],	%o4
	movcc	%icc,	%o0,	%i4
	subcc	%o3,	0x0FD7,	%i5
	or	%o1,	%o4,	%o6
	edge16	%g3,	%g6,	%i1
	alignaddrl	%i6,	%g2,	%g7
	fmovsn	%xcc,	%f8,	%f10
	fpadd32s	%f19,	%f29,	%f23
	tvc	%icc,	0x5
	bn,pn	%icc,	loop_226
	tn	%icc,	0x6
	andncc	%o7,	%l2,	%l5
	smulcc	%i0,	%g4,	%i3
loop_226:
	movvc	%icc,	%l0,	%i2
	movre	%g5,	%o2,	%l6
	brz	%l3,	loop_227
	xnorcc	%g1,	0x1DB8,	%l4
	fbe,a	%fcc1,	loop_228
	tvs	%xcc,	0x7
loop_227:
	tleu	%xcc,	0x7
	movre	%l1,	0x051,	%i7
loop_228:
	tsubcctv	%o5,	%o0,	%i4
	fmovsle	%xcc,	%f25,	%f9
	brz	%i5,	loop_229
	brnz	%o3,	loop_230
	fbe,a	%fcc1,	loop_231
	tvc	%icc,	0x3
loop_229:
	and	%o4,	0x002E,	%o6
loop_230:
	movrgz	%o1,	%g3,	%i1
loop_231:
	movleu	%icc,	%i6,	%g6
	ldsh	[%l7 + 0x38],	%g2
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x11
	taddcc	%o7,	0x1315,	%g7
	srlx	%l5,	0x0D,	%l2
	edge8l	%i0,	%g4,	%l0
	sir	0x0EA2
	fabsd	%f24,	%f18
	ldstub	[%l7 + 0x0B],	%i2
	udivcc	%i3,	0x1C81,	%g5
	movpos	%icc,	%o2,	%l6
	tneg	%icc,	0x5
	mulx	%g1,	%l4,	%l1
	tcc	%xcc,	0x2
	alignaddr	%i7,	%o5,	%o0
	fcmpd	%fcc3,	%f2,	%f26
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x1A] %asi,	%l3
	brz	%i4,	loop_232
	xnorcc	%i5,	%o4,	%o6
	edge16ln	%o1,	%g3,	%o3
	movpos	%xcc,	%i1,	%g6
loop_232:
	for	%f30,	%f12,	%f20
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%g2
	edge32ln	%o7,	%g7,	%i6
	movvc	%icc,	%l2,	%l5
	fbe	%fcc0,	loop_233
	fabss	%f3,	%f0
	move	%icc,	%i0,	%l0
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i2
loop_233:
	sdiv	%g4,	0x07A3,	%i3
	edge16ln	%o2,	%l6,	%g1
	sra	%g5,	%l4,	%i7
	te	%icc,	0x7
	fcmped	%fcc2,	%f16,	%f4
	mulscc	%l1,	%o0,	%l3
	tcc	%icc,	0x2
	edge8ln	%i4,	%o5,	%o4
	taddcctv	%o6,	%i5,	%o1
	udiv	%g3,	0x148C,	%o3
	xorcc	%g6,	%i1,	%o7
	bvs,a	%xcc,	loop_234
	pdist	%f8,	%f28,	%f18
	tge	%icc,	0x6
	set	0x58, %i6
	lduha	[%l7 + %i6] 0x04,	%g7
loop_234:
	tcs	%icc,	0x1
	ta	%icc,	0x4
	tneg	%xcc,	0x7
	sdivx	%g2,	0x1020,	%i6
	fbe,a	%fcc3,	loop_235
	andncc	%l2,	%i0,	%l5
	movneg	%xcc,	%l0,	%i2
	fornot2	%f20,	%f20,	%f18
loop_235:
	tvs	%xcc,	0x5
	tle	%xcc,	0x0
	sdivx	%i3,	0x1878,	%g4
	sdivx	%l6,	0x1125,	%o2
	tne	%xcc,	0x2
	fmovdgu	%xcc,	%f8,	%f19
	fbue	%fcc2,	loop_236
	brz,a	%g5,	loop_237
	fmovsn	%icc,	%f29,	%f14
	bcs,a	loop_238
loop_236:
	tpos	%icc,	0x1
loop_237:
	brnz,a	%g1,	loop_239
	tl	%icc,	0x6
loop_238:
	bn,a,pt	%icc,	loop_240
	smulcc	%i7,	%l1,	%l4
loop_239:
	tleu	%icc,	0x2
	sdivx	%o0,	0x1931,	%i4
loop_240:
	edge8ln	%l3,	%o5,	%o6
	fmovrsne	%o4,	%f4,	%f30
	tg	%icc,	0x2
	fmovdn	%icc,	%f10,	%f19
	sethi	0x10B8,	%i5
	alignaddr	%g3,	%o1,	%o3
	srlx	%i1,	%g6,	%o7
	mulscc	%g2,	%i6,	%g7
	fmovdcc	%xcc,	%f6,	%f11
	fbn	%fcc2,	loop_241
	edge32ln	%l2,	%l5,	%i0
	fxnors	%f4,	%f17,	%f17
	orncc	%i2,	0x1712,	%l0
loop_241:
	edge16ln	%i3,	%g4,	%l6
	fmul8sux16	%f18,	%f12,	%f4
	tne	%xcc,	0x7
	wr	%g0,	0x23,	%asi
	stxa	%o2,	[%l7 + 0x60] %asi
	membar	#Sync
	taddcctv	%g5,	%i7,	%l1
	ld	[%l7 + 0x20],	%f8
	movcs	%xcc,	%l4,	%g1
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x22,	%i4
	movrgz	%o0,	0x207,	%o5
	taddcc	%o6,	%o4,	%l3
	movneg	%xcc,	%g3,	%i5
	move	%xcc,	%o1,	%o3
	xnor	%g6,	%o7,	%g2
	stb	%i6,	[%l7 + 0x1B]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g7,	0x1993,	%i1
	fmovdl	%icc,	%f14,	%f1
	ldub	[%l7 + 0x1F],	%l5
	tl	%icc,	0x6
	fbge,a	%fcc1,	loop_242
	sdiv	%l2,	0x0A7F,	%i0
	addcc	%l0,	%i3,	%g4
	movre	%i2,	0x12F,	%l6
loop_242:
	addc	%g5,	0x1841,	%o2
	movcs	%xcc,	%l1,	%i7
	sra	%g1,	%l4,	%i4
	fbuge	%fcc2,	loop_243
	fnors	%f10,	%f19,	%f1
	prefetch	[%l7 + 0x78],	 0x3
	edge8l	%o5,	%o6,	%o4
loop_243:
	bgu,a	loop_244
	tle	%xcc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x1C],	%o0
loop_244:
	tn	%xcc,	0x5
	tsubcctv	%l3,	%g3,	%o1
	edge32l	%i5,	%o3,	%g6
	andn	%o7,	0x0EBD,	%i6
	edge8ln	%g7,	%g2,	%i1
	ldstub	[%l7 + 0x24],	%l2
	sll	%i0,	0x00,	%l5
	andn	%i3,	0x07AD,	%g4
	edge8l	%l0,	%l6,	%g5
	brgz,a	%o2,	loop_245
	lduh	[%l7 + 0x22],	%l1
	move	%icc,	%i2,	%i7
	mova	%xcc,	%l4,	%i4
loop_245:
	brgz	%o5,	loop_246
	movn	%icc,	%o6,	%g1
	tvc	%xcc,	0x3
	addc	%o0,	%o4,	%l3
loop_246:
	fone	%f6
	bgu	loop_247
	fpsub16	%f16,	%f30,	%f4
	fmovsvs	%xcc,	%f22,	%f22
	fmovsvs	%xcc,	%f11,	%f2
loop_247:
	brlz	%g3,	loop_248
	tg	%icc,	0x7
	add	%i5,	0x183F,	%o3
	membar	0x6C
loop_248:
	fmovdg	%icc,	%f11,	%f1
	or	%g6,	0x09B7,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%i6,	0x1040,	%g7
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
	fpack16	%f12,	%f3
	fbue,a	%fcc2,	loop_249
	fnot2	%f8,	%f2
	fornot1	%f28,	%f4,	%f30
	fmovspos	%icc,	%f6,	%f6
loop_249:
	fmul8sux16	%f6,	%f18,	%f24
	fmovdpos	%xcc,	%f10,	%f17
	ta	%xcc,	0x2
	edge8n	%g2,	%o7,	%l2
	mulx	%i1,	0x0EE5,	%l5
	ble,a	%icc,	loop_250
	tvc	%xcc,	0x5
	sll	%i3,	%i0,	%g4
	tn	%xcc,	0x7
loop_250:
	fbul	%fcc0,	loop_251
	tsubcctv	%l6,	%l0,	%g5
	tgu	%xcc,	0x5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o2,	%i2
loop_251:
	nop
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x1e
	membar	#Sync
	sdivx	%l1,	0x14EC,	%l4
	fmuld8sux16	%f12,	%f13,	%f24
	sdivx	%i4,	0x1B2C,	%o5
	fbge,a	%fcc3,	loop_252
	stb	%i7,	[%l7 + 0x3D]
	fpack16	%f2,	%f22
	lduh	[%l7 + 0x3E],	%g1
loop_252:
	brgz,a	%o6,	loop_253
	sdivx	%o4,	0x0649,	%l3
	fones	%f9
	bl,pn	%icc,	loop_254
loop_253:
	fpmerge	%f7,	%f20,	%f12
	edge8n	%g3,	%o0,	%o3
	edge32l	%i5,	%g6,	%o1
loop_254:
	movcc	%xcc,	%i6,	%g2
	array8	%g7,	%l2,	%i1
	sllx	%l5,	0x01,	%o7
	set	0x44, %l3
	swapa	[%l7 + %l3] 0x10,	%i3
	addc	%i0,	%l6,	%l0
	xorcc	%g5,	%g4,	%i2
	fbe,a	%fcc2,	loop_255
	fmovdle	%xcc,	%f17,	%f0
	sth	%l1,	[%l7 + 0x56]
	fsrc1	%f14,	%f14
loop_255:
	bshuffle	%f10,	%f28,	%f18
	fornot1	%f0,	%f26,	%f24
	fsrc1	%f24,	%f10
	subcc	%l4,	%i4,	%o5
	pdist	%f6,	%f10,	%f22
	orn	%o2,	0x02D3,	%g1
	subcc	%o6,	%i7,	%o4
	sllx	%l3,	0x03,	%o0
	movvc	%xcc,	%g3,	%i5
	fcmped	%fcc2,	%f22,	%f8
	edge16n	%g6,	%o3,	%i6
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x0C] %asi,	%g2
	bge,a	loop_256
	fornot1	%f18,	%f30,	%f6
	be	%xcc,	loop_257
	movrlez	%o1,	0x3E5,	%l2
loop_256:
	xnor	%g7,	%i1,	%l5
	umulcc	%o7,	%i0,	%i3
loop_257:
	movcs	%xcc,	%l0,	%g5
	fbl,a	%fcc3,	loop_258
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f6,	%f30
	fnot2	%f8,	%f22
loop_258:
	fmovs	%f20,	%f17
	tne	%icc,	0x2
	and	%l6,	0x1EC4,	%i2
	and	%l1,	%g4,	%l4
	fmovda	%icc,	%f16,	%f20
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fblg,a	%fcc0,	loop_259
	movrlz	%i4,	0x1E0,	%o5
	wr	%g0,	0x27,	%asi
	stda	%g0,	[%l7 + 0x38] %asi
	membar	#Sync
loop_259:
	ldsh	[%l7 + 0x7A],	%o2
	edge16l	%i7,	%o4,	%l3
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%o6
	fbul,a	%fcc0,	loop_260
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1559,	%o0
	stbar
loop_260:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x20] %asi,	%i5
	movle	%icc,	%g3,	%o3
	for	%f20,	%f12,	%f30
	movl	%icc,	%g6,	%g2
	fmovrsgz	%i6,	%f24,	%f1
	sll	%l2,	%o1,	%i1
	fcmpgt32	%f2,	%f14,	%g7
	udivx	%o7,	0x180E,	%l5
	umul	%i0,	0x10DB,	%i3
	fcmpd	%fcc0,	%f20,	%f28
	tsubcc	%g5,	%l6,	%l0
	orncc	%i2,	0x0F40,	%g4
	addccc	%l4,	0x1937,	%l1
	lduw	[%l7 + 0x64],	%i4
	xor	%g1,	%o2,	%i7
	edge32l	%o4,	%o5,	%l3
	bl	%xcc,	loop_261
	tvs	%icc,	0x5
	sdivcc	%o0,	0x0BF9,	%i5
	srax	%o6,	0x1D,	%o3
loop_261:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x34],	%f23
	move	%xcc,	%g6,	%g3
	movl	%xcc,	%g2,	%l2
	set	0x74, %o6
	stwa	%i6,	[%l7 + %o6] 0x88
	fbn	%fcc2,	loop_262
	addccc	%o1,	%g7,	%i1
	edge8l	%o7,	%i0,	%l5
	sdivcc	%i3,	0x0461,	%g5
loop_262:
	addc	%l6,	%l0,	%g4
	fcmpne32	%f0,	%f16,	%i2
	tl	%icc,	0x7
	tne	%icc,	0x2
	fbul,a	%fcc3,	loop_263
	edge32l	%l4,	%l1,	%g1
	lduw	[%l7 + 0x4C],	%i4
	movl	%xcc,	%o2,	%i7
loop_263:
	movcc	%icc,	%o4,	%o5
	movleu	%xcc,	%o0,	%i5
	xor	%o6,	0x1F3B,	%l3
	movre	%o3,	%g6,	%g3
	subccc	%g2,	%l2,	%o1
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x34] %asi,	%g7
	tgu	%icc,	0x2
	fbe,a	%fcc2,	loop_264
	subc	%i1,	%i6,	%o7
	movrlz	%l5,	0x024,	%i0
	sra	%g5,	0x0A,	%i3
loop_264:
	bne,pn	%xcc,	loop_265
	fbo,a	%fcc3,	loop_266
	lduw	[%l7 + 0x48],	%l0
	srlx	%g4,	0x0D,	%i2
loop_265:
	addccc	%l6,	%l4,	%l1
loop_266:
	tsubcctv	%g1,	%i4,	%i7
	fsrc1	%f28,	%f10
	nop
	set	0x08, %g1
	ldsw	[%l7 + %g1],	%o2
	fmovdl	%xcc,	%f8,	%f28
	fmovs	%f17,	%f19
	fmul8sux16	%f4,	%f14,	%f10
	edge8l	%o4,	%o5,	%o0
	nop
	set	0x0C, %g3
	prefetch	[%l7 + %g3],	 0x2
	ldd	[%l7 + 0x60],	%f8
	tne	%icc,	0x7
	movl	%icc,	%i5,	%l3
	subc	%o6,	0x02CB,	%o3
	lduh	[%l7 + 0x6E],	%g6
	move	%icc,	%g3,	%l2
	fmovsvs	%xcc,	%f1,	%f8
	andncc	%g2,	%o1,	%g7
	fmovspos	%icc,	%f1,	%f31
	fcmped	%fcc2,	%f20,	%f24
	andncc	%i6,	%o7,	%i1
	taddcc	%i0,	%g5,	%l5
	addcc	%l0,	%i3,	%g4
	movvs	%xcc,	%l6,	%l4
	fmovdl	%xcc,	%f22,	%f27
	ldx	[%l7 + 0x48],	%i2
	movge	%xcc,	%g1,	%l1
	fpadd16s	%f17,	%f21,	%f3
	edge8ln	%i4,	%i7,	%o4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%o2,	%o5
	tleu	%xcc,	0x4
	edge16ln	%i5,	%o0,	%l3
	sethi	0x139E,	%o6
	fbn,a	%fcc3,	loop_267
	add	%g6,	0x10CB,	%g3
	edge8ln	%o3,	%l2,	%g2
	brgez,a	%o1,	loop_268
loop_267:
	udivx	%g7,	0x1A49,	%i6
	orncc	%i1,	%i0,	%g5
	tg	%icc,	0x3
loop_268:
	bn	%icc,	loop_269
	fnegs	%f5,	%f2
	fbge	%fcc0,	loop_270
	edge8n	%o7,	%l0,	%l5
loop_269:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x3
loop_270:
	edge16	%g4,	%l4,	%l6
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	fmovdvc	%xcc,	%f10,	%f10
	bleu	loop_271
	tgu	%xcc,	0x2
	alignaddr	%i2,	%i4,	%l1
	edge32ln	%i7,	%o4,	%o5
loop_271:
	or	%i5,	0x0C4A,	%o2
	add	%o0,	0x06AB,	%l3
	bl	loop_272
	fmovscs	%xcc,	%f19,	%f12
	movne	%xcc,	%o6,	%g6
	stx	%o3,	[%l7 + 0x68]
loop_272:
	tsubcc	%l2,	%g2,	%g3
	movvs	%icc,	%o1,	%i6
	addccc	%i1,	0x0434,	%g7
	fandnot2	%f26,	%f30,	%f24
	smul	%i0,	%g5,	%o7
	fandnot2s	%f16,	%f30,	%f2
	movgu	%xcc,	%l5,	%i3
	tle	%icc,	0x4
	fmovsvs	%xcc,	%f16,	%f19
	movvc	%icc,	%g4,	%l4
	edge16l	%l6,	%g1,	%i2
	fnot1	%f0,	%f24
	srax	%i4,	%l0,	%l1
	tsubcctv	%i7,	0x1CF9,	%o5
	addc	%o4,	0x1A16,	%o2
	add	%o0,	%l3,	%i5
	fmovrdlez	%o6,	%f6,	%f16
	prefetch	[%l7 + 0x68],	 0x0
	edge8n	%g6,	%o3,	%l2
	alignaddrl	%g2,	%o1,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f12,	%f28,	%f18
	array32	%i6,	%g7,	%i1
	movleu	%icc,	%i0,	%g5
	fand	%f6,	%f12,	%f24
	taddcc	%l5,	%i3,	%o7
	mova	%xcc,	%l4,	%l6
	fandnot2	%f16,	%f10,	%f8
	ldstub	[%l7 + 0x6B],	%g4
	fpack16	%f20,	%f14
	fsrc2	%f18,	%f18
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x20] %asi,	%i2
	fmovdleu	%xcc,	%f19,	%f12
	fpmerge	%f1,	%f9,	%f18
	fxors	%f12,	%f22,	%f12
	movge	%xcc,	%i4,	%g1
	edge8n	%l0,	%l1,	%o5
	sdivcc	%o4,	0x1DD7,	%o2
	fxnors	%f4,	%f5,	%f1
	fmovs	%f10,	%f18
	fpadd16s	%f24,	%f3,	%f24
	ldstub	[%l7 + 0x67],	%o0
	fmovd	%f24,	%f20
	bl,a	%xcc,	loop_273
	tl	%icc,	0x0
	edge16l	%i7,	%i5,	%l3
	andncc	%g6,	%o6,	%o3
loop_273:
	bcc,pt	%xcc,	loop_274
	udivcc	%l2,	0x0380,	%g2
	edge8l	%o1,	%i6,	%g7
	fmovsvs	%xcc,	%f27,	%f29
loop_274:
	fpsub32	%f14,	%f8,	%f24
	fpadd16	%f24,	%f26,	%f20
	fmovdgu	%icc,	%f4,	%f17
	fmul8x16al	%f31,	%f8,	%f10
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
	umul	%i1,	%g5,	%i0
	set	0x40, %o2
	ldswa	[%l7 + %o2] 0x81,	%l5
	smulcc	%i3,	0x073A,	%o7
	fsrc2s	%f25,	%f1
	movne	%icc,	%l4,	%l6
	ta	%icc,	0x0
	flush	%l7 + 0x20
	fmovdgu	%icc,	%f11,	%f12
	fones	%f5
	flush	%l7 + 0x0C
	addc	%g4,	%i4,	%i2
	srax	%g1,	0x04,	%l0
	movne	%xcc,	%l1,	%o4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o5,	%o0
	movleu	%xcc,	%o2,	%i7
	sdivx	%i5,	0x031C,	%l3
	be,pt	%xcc,	loop_275
	stbar
	fexpand	%f18,	%f14
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x41] %asi,	%g6
loop_275:
	ldd	[%l7 + 0x70],	%f30
	srl	%o3,	0x15,	%l2
	udivcc	%o6,	0x0D66,	%o1
	xorcc	%g2,	%i6,	%g7
	fnot1s	%f25,	%f31
	srlx	%i1,	0x03,	%g3
	sir	0x13C8
	movle	%icc,	%i0,	%g5
	edge8n	%l5,	%o7,	%i3
	sra	%l4,	0x14,	%g4
	xnor	%l6,	0x0601,	%i2
	tsubcctv	%i4,	%l0,	%g1
	xor	%l1,	%o4,	%o5
	mulscc	%o2,	%o0,	%i5
	fmovsgu	%xcc,	%f26,	%f8
	movg	%xcc,	%l3,	%i7
	taddcc	%g6,	%l2,	%o3
	fmovscc	%xcc,	%f3,	%f27
	taddcc	%o6,	%g2,	%i6
	movge	%icc,	%o1,	%i1
	umulcc	%g3,	%g7,	%i0
	fmovdn	%icc,	%f1,	%f10
	fbug	%fcc3,	loop_276
	stb	%l5,	[%l7 + 0x4F]
	brlz	%g5,	loop_277
	movrgz	%i3,	0x2BF,	%l4
loop_276:
	fnands	%f6,	%f10,	%f19
	xnor	%g4,	%l6,	%o7
loop_277:
	fmovrsgz	%i2,	%f8,	%f22
	membar	0x36
	sub	%l0,	%g1,	%i4
	orncc	%o4,	%l1,	%o2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x20] %asi,	%f17
	umul	%o0,	%i5,	%o5
	flush	%l7 + 0x18
	fbue	%fcc2,	loop_278
	fnot2	%f16,	%f22
	movgu	%icc,	%i7,	%l3
	smul	%g6,	0x1F54,	%l2
loop_278:
	bl,a	%icc,	loop_279
	taddcctv	%o6,	0x103C,	%g2
	fmovdvs	%xcc,	%f21,	%f12
	udivx	%i6,	0x0C49,	%o1
loop_279:
	tg	%icc,	0x6
	fcmple16	%f30,	%f16,	%i1
	set	0x7C, %o4
	lda	[%l7 + %o4] 0x80,	%f25
	bvs,a,pn	%icc,	loop_280
	te	%xcc,	0x2
	fmovrdgez	%g3,	%f6,	%f2
	sethi	0x1BFB,	%o3
loop_280:
	sub	%i0,	%g7,	%l5
	srl	%g5,	0x10,	%l4
	subc	%g4,	%l6,	%o7
	tneg	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i3,	%l0,	%g1
	fpsub32	%f2,	%f22,	%f20
	bge,a,pt	%icc,	loop_281
	stx	%i4,	[%l7 + 0x70]
	movge	%icc,	%o4,	%l1
	alignaddr	%i2,	%o0,	%o2
loop_281:
	ldub	[%l7 + 0x3B],	%o5
	andn	%i5,	%i7,	%l3
	sllx	%g6,	0x00,	%l2
	movg	%icc,	%g2,	%i6
	fmovdcc	%icc,	%f12,	%f5
	and	%o1,	%i1,	%o6
	membar	0x77
	fmovs	%f28,	%f2
	membar	0x56
	movneg	%xcc,	%g3,	%i0
	fmovrdgez	%o3,	%f4,	%f10
	tle	%xcc,	0x7
	sethi	0x02D0,	%l5
	be,pn	%icc,	loop_282
	sra	%g7,	%l4,	%g4
	udivcc	%g5,	0x07D4,	%o7
	fmovsvs	%icc,	%f5,	%f11
loop_282:
	nop
	set	0x36, %l5
	stha	%i3,	[%l7 + %l5] 0x0c
	edge32n	%l6,	%g1,	%i4
	fabsd	%f26,	%f22
	subccc	%o4,	0x1E5E,	%l1
	fpadd16	%f14,	%f6,	%f20
	movpos	%xcc,	%l0,	%i2
	prefetch	[%l7 + 0x30],	 0x0
	fmovscc	%xcc,	%f5,	%f21
	fmovrdne	%o0,	%f0,	%f12
	tgu	%icc,	0x4
	fcmpeq32	%f26,	%f20,	%o5
	taddcctv	%i5,	0x0D5D,	%o2
	tcs	%xcc,	0x5
	ble,a,pt	%xcc,	loop_283
	subc	%i7,	0x0AAD,	%g6
	fbul	%fcc1,	loop_284
	fpack32	%f2,	%f0,	%f16
loop_283:
	taddcctv	%l2,	0x0DBC,	%l3
	tvs	%icc,	0x7
loop_284:
	tcs	%xcc,	0x5
	be,a,pn	%icc,	loop_285
	swap	[%l7 + 0x20],	%g2
	orncc	%i6,	0x1059,	%o1
	subc	%o6,	%i1,	%i0
loop_285:
	tge	%xcc,	0x0
	smulcc	%o3,	%l5,	%g7
	fbo,a	%fcc2,	loop_286
	mulscc	%l4,	%g3,	%g5
	fmuld8sux16	%f28,	%f4,	%f24
	brnz,a	%o7,	loop_287
loop_286:
	fmul8x16	%f7,	%f8,	%f22
	brgz,a	%i3,	loop_288
	brz	%l6,	loop_289
loop_287:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%icc,	0x1
loop_288:
	fmovdne	%icc,	%f3,	%f29
loop_289:
	stb	%g4,	[%l7 + 0x6E]
	fmovrdlez	%i4,	%f22,	%f4
	fmuld8ulx16	%f24,	%f13,	%f14
	set	0x1C, %o3
	swapa	[%l7 + %o3] 0x89,	%g1
	ldx	[%l7 + 0x38],	%l1
	andcc	%l0,	0x0350,	%i2
	sdivcc	%o4,	0x1BB0,	%o0
	te	%xcc,	0x0
	tl	%xcc,	0x5
	fmovdne	%xcc,	%f15,	%f1
	fornot2	%f4,	%f24,	%f12
	fbn	%fcc3,	loop_290
	subccc	%o5,	0x0A36,	%o2
	movg	%xcc,	%i5,	%i7
	orncc	%l2,	%l3,	%g6
loop_290:
	udivx	%g2,	0x0823,	%o1
	movrne	%i6,	0x1A5,	%o6
	movvc	%xcc,	%i1,	%i0
	nop
	set	0x58, %i1
	ldx	[%l7 + %i1],	%o3
	fnot1	%f18,	%f20
	sethi	0x1C9C,	%g7
	subccc	%l5,	0x170C,	%l4
	nop
	setx loop_291, %l0, %l1
	jmpl %l1, %g3
	edge8n	%o7,	%i3,	%g5
	sdiv	%l6,	0x1BED,	%g4
	srl	%g1,	0x03,	%i4
loop_291:
	sra	%l0,	%l1,	%o4
	movre	%i2,	%o0,	%o2
	movneg	%icc,	%i5,	%i7
	edge16	%o5,	%l2,	%g6
	xorcc	%g2,	%o1,	%l3
	andn	%i6,	%i1,	%i0
	fbue,a	%fcc3,	loop_292
	movleu	%xcc,	%o3,	%o6
	movle	%xcc,	%l5,	%l4
	fxor	%f20,	%f10,	%f8
loop_292:
	tsubcctv	%g3,	0x0616,	%g7
	movgu	%icc,	%i3,	%g5
	bcs,a,pn	%icc,	loop_293
	fcmped	%fcc2,	%f20,	%f18
	fornot2	%f16,	%f6,	%f30
	lduh	[%l7 + 0x62],	%l6
loop_293:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g4,	0x18,	%g1
	nop
	setx	loop_294,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	move	%icc,	%o7,	%l0
	srax	%i4,	0x0F,	%l1
	lduh	[%l7 + 0x24],	%o4
loop_294:
	nop
	set	0x3A, %l1
	stba	%i2,	[%l7 + %l1] 0x2a
	membar	#Sync
	smulcc	%o2,	%i5,	%o0
	te	%icc,	0x3
	tge	%xcc,	0x4
	udivx	%i7,	0x163D,	%o5
	std	%g6,	[%l7 + 0x50]
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x60] %asi,	%f3
	fone	%f8
	tleu	%icc,	0x3
	fornot1	%f10,	%f28,	%f30
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%g2
	mulx	%l2,	%o1,	%l3
	edge16	%i6,	%i1,	%o3
	be,a	loop_295
	fcmps	%fcc2,	%f29,	%f6
	edge32l	%o6,	%l5,	%i0
	udivx	%g3,	0x0208,	%g7
loop_295:
	nop
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x1A] %asi,	%l4
	srl	%g5,	0x0A,	%l6
	or	%i3,	%g4,	%g1
	movge	%icc,	%o7,	%i4
	xnorcc	%l1,	0x1B28,	%o4
	fmovdgu	%icc,	%f10,	%f3
	edge32l	%i2,	%l0,	%i5
	fmovrslz	%o0,	%f0,	%f30
	sdivx	%o2,	0x0420,	%o5
	xnorcc	%i7,	0x184D,	%g6
	tleu	%xcc,	0x6
	tge	%xcc,	0x4
	mulscc	%l2,	0x1004,	%o1
	fpack32	%f30,	%f28,	%f0
	bge	%xcc,	loop_296
	fpack16	%f26,	%f16
	set	0x2C, %g6
	lduwa	[%l7 + %g6] 0x11,	%l3
loop_296:
	tpos	%icc,	0x5
	mulx	%g2,	0x0C56,	%i6
	movn	%xcc,	%i1,	%o6
	fmovrde	%l5,	%f20,	%f26
	fcmpeq32	%f22,	%f8,	%o3
	fmovdgu	%xcc,	%f22,	%f31
	tleu	%xcc,	0x5
	udivcc	%g3,	0x14DC,	%i0
	ldd	[%l7 + 0x78],	%f20
	sdivx	%l4,	0x0378,	%g5
	ld	[%l7 + 0x1C],	%f6
	fbg	%fcc1,	loop_297
	tleu	%xcc,	0x0
	movvc	%icc,	%l6,	%i3
	orn	%g7,	%g1,	%g4
loop_297:
	fnand	%f0,	%f12,	%f22
	xnor	%i4,	%o7,	%l1
	xorcc	%i2,	0x0289,	%l0
	movg	%icc,	%o4,	%o0
	andn	%o2,	%o5,	%i7
	tne	%xcc,	0x2
	andncc	%i5,	%g6,	%l2
	nop
	setx loop_298, %l0, %l1
	jmpl %l1, %l3
	xor	%o1,	%i6,	%i1
	smulcc	%o6,	0x0BB2,	%g2
	wr	%g0,	0x88,	%asi
	sta	%f31,	[%l7 + 0x30] %asi
loop_298:
	addcc	%o3,	0x09AB,	%g3
	fabsd	%f4,	%f22
	alignaddrl	%i0,	%l4,	%g5
	movgu	%xcc,	%l5,	%l6
	umul	%i3,	0x1F0C,	%g1
	ta	%icc,	0x4
	movcs	%icc,	%g4,	%g7
	andcc	%o7,	%i4,	%l1
	bleu,a	loop_299
	tcc	%xcc,	0x1
	movrgz	%l0,	%o4,	%o0
	sdiv	%i2,	0x1380,	%o5
loop_299:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i7,	0x39A,	%o2
	brlez	%i5,	loop_300
	edge16ln	%l2,	%l3,	%g6
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_300:
	xor	%i6,	0x08CC,	%i1
	fmovd	%f18,	%f8
	be,pn	%icc,	loop_301
	umulcc	%o1,	0x0AFE,	%o6
	fmovspos	%xcc,	%f24,	%f19
	fmul8x16	%f26,	%f12,	%f12
loop_301:
	sir	0x174E
	movleu	%xcc,	%o3,	%g3
	fnand	%f22,	%f26,	%f14
	fblg,a	%fcc0,	loop_302
	membar	0x43
	te	%xcc,	0x6
	membar	0x4C
loop_302:
	movneg	%icc,	%i0,	%g2
	te	%icc,	0x2
	fnors	%f18,	%f9,	%f29
	subccc	%g5,	%l4,	%l6
	stbar
	bg,pn	%xcc,	loop_303
	fcmpeq32	%f6,	%f22,	%l5
	subcc	%i3,	0x02D1,	%g4
	ba,pt	%xcc,	loop_304
loop_303:
	udiv	%g1,	0x06E1,	%o7
	tvs	%icc,	0x0
	ldstub	[%l7 + 0x14],	%i4
loop_304:
	tsubcc	%l1,	0x018F,	%g7
	addcc	%o4,	0x1F21,	%l0
	andncc	%o0,	%o5,	%i2
	edge16n	%o2,	%i7,	%i5
	nop
	setx loop_305, %l0, %l1
	jmpl %l1, %l2
	andncc	%g6,	%i6,	%l3
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x19] %asi,	%i1
loop_305:
	fsrc2	%f4,	%f20
	xorcc	%o1,	%o6,	%g3
	or	%i0,	0x10BB,	%g2
	popc	0x0F24,	%g5
	xnor	%l4,	0x1048,	%l6
	addcc	%o3,	0x02AB,	%l5
	stx	%i3,	[%l7 + 0x10]
	edge32	%g4,	%o7,	%i4
	udiv	%g1,	0x1966,	%g7
	fmovs	%f22,	%f5
	array16	%l1,	%o4,	%l0
	sll	%o5,	0x16,	%i2
	fmovrdne	%o2,	%f18,	%f16
	tg	%icc,	0x4
	ldd	[%l7 + 0x60],	%f26
	andncc	%o0,	%i7,	%l2
	be	loop_306
	orncc	%i5,	0x0618,	%g6
	smul	%l3,	0x17CF,	%i1
	movvc	%xcc,	%i6,	%o1
loop_306:
	taddcctv	%g3,	%o6,	%g2
	tpos	%xcc,	0x4
	brz	%g5,	loop_307
	orcc	%i0,	%l4,	%o3
	bcs	loop_308
	bgu,a,pn	%xcc,	loop_309
loop_307:
	fmovsle	%icc,	%f2,	%f1
	fcmpgt16	%f20,	%f28,	%l6
loop_308:
	edge8	%l5,	%i3,	%g4
loop_309:
	movvc	%icc,	%o7,	%g1
	fsrc2	%f12,	%f14
	wr	%g0,	0x2f,	%asi
	stba	%g7,	[%l7 + 0x09] %asi
	membar	#Sync
	pdist	%f18,	%f2,	%f16
	mulscc	%i4,	0x1434,	%o4
	movn	%icc,	%l0,	%l1
	bge,a,pn	%xcc,	loop_310
	bg,a,pt	%icc,	loop_311
	fmul8x16	%f28,	%f12,	%f6
	fmovrde	%o5,	%f22,	%f26
loop_310:
	udivx	%i2,	0x15C4,	%o2
loop_311:
	tgu	%icc,	0x0
	fmuld8ulx16	%f11,	%f19,	%f0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%i7
	set	0x31, %o5
	stba	%l2,	[%l7 + %o5] 0xe3
	membar	#Sync
	sra	%o0,	0x00,	%i5
	std	%f16,	[%l7 + 0x38]
	fbul	%fcc2,	loop_312
	smul	%g6,	%i1,	%l3
	tpos	%icc,	0x0
	udiv	%i6,	0x0529,	%o1
loop_312:
	array8	%g3,	%g2,	%o6
	fmul8x16	%f7,	%f14,	%f8
	set	0x76, %o7
	stha	%g5,	[%l7 + %o7] 0x18
	smulcc	%l4,	%o3,	%l6
	sll	%i0,	%l5,	%i3
	array8	%g4,	%g1,	%g7
	and	%i4,	0x16BD,	%o7
	smul	%o4,	0x1807,	%l0
	fornot1s	%f7,	%f27,	%f8
	fmul8sux16	%f22,	%f0,	%f30
	tvs	%xcc,	0x7
	call	loop_313
	fpmerge	%f1,	%f25,	%f14
	fmovsleu	%icc,	%f1,	%f13
	fba,a	%fcc3,	loop_314
loop_313:
	andcc	%l1,	%o5,	%o2
	movne	%xcc,	%i2,	%l2
	edge8n	%i7,	%i5,	%o0
loop_314:
	brlz	%g6,	loop_315
	mulx	%l3,	0x1C1C,	%i1
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x70] %asi,	%f27
loop_315:
	mulx	%o1,	0x17E2,	%g3
	movvs	%icc,	%i6,	%g2
	bvs,a	loop_316
	popc	%o6,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f4,	%f14,	%f2
loop_316:
	addcc	%o3,	0x169C,	%l6
	orn	%g5,	0x0B52,	%l5
	fpack16	%f0,	%f11
	xnorcc	%i3,	%g4,	%i0
	mulx	%g1,	%g7,	%o7
	edge8	%i4,	%l0,	%o4
	tsubcctv	%o5,	0x1C40,	%l1
	te	%icc,	0x2
	sllx	%i2,	0x18,	%o2
	fpack16	%f2,	%f2
	fnot2s	%f2,	%f28
	mova	%xcc,	%l2,	%i5
	fnot2s	%f18,	%f31
	orncc	%i7,	0x081B,	%g6
	tsubcc	%l3,	%i1,	%o1
	popc	0x1DBB,	%g3
	ldsw	[%l7 + 0x54],	%i6
	fmovspos	%xcc,	%f9,	%f11
	edge8	%o0,	%o6,	%g2
	fmovscs	%icc,	%f28,	%f26
	tsubcc	%l4,	%o3,	%g5
	ta	%xcc,	0x7
	ba,a,pt	%xcc,	loop_317
	alignaddrl	%l6,	%i3,	%g4
	subc	%i0,	%l5,	%g1
	edge8ln	%g7,	%o7,	%i4
loop_317:
	fnors	%f5,	%f17,	%f3
	fcmps	%fcc1,	%f28,	%f16
	taddcctv	%o4,	0x0407,	%o5
	std	%l0,	[%l7 + 0x20]
	nop
	setx	loop_318,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	lduh	[%l7 + 0x1C],	%i2
	sll	%o2,	0x14,	%l2
	andncc	%i5,	%i7,	%l0
loop_318:
	movpos	%icc,	%l3,	%i1
	edge16ln	%g6,	%o1,	%g3
	fmovscs	%xcc,	%f31,	%f3
	taddcctv	%o0,	%o6,	%i6
	addccc	%g2,	%o3,	%g5
	brgez,a	%l4,	loop_319
	movvs	%icc,	%i3,	%g4
	umulcc	%i0,	0x0463,	%l6
	movvs	%xcc,	%g1,	%l5
loop_319:
	taddcctv	%o7,	0x011D,	%i4
	edge16l	%g7,	%o4,	%o5
	tneg	%icc,	0x6
	tle	%icc,	0x7
	mulscc	%i2,	%o2,	%l2
	fcmple32	%f2,	%f22,	%i5
	srax	%i7,	0x07,	%l0
	fmovdge	%xcc,	%f28,	%f14
	fbug,a	%fcc1,	loop_320
	tl	%icc,	0x5
	stb	%l1,	[%l7 + 0x29]
	tne	%xcc,	0x6
loop_320:
	movneg	%icc,	%l3,	%g6
	movge	%xcc,	%i1,	%o1
	membar	0x12
	fzeros	%f6
	tsubcc	%o0,	0x0615,	%o6
	movge	%icc,	%i6,	%g3
	fnot1	%f6,	%f8
	fblg	%fcc2,	loop_321
	fmovsleu	%icc,	%f11,	%f3
	sethi	0x1486,	%o3
	sra	%g5,	%l4,	%i3
loop_321:
	sdivcc	%g2,	0x017E,	%i0
	fmovrse	%g4,	%f21,	%f31
	edge32n	%l6,	%l5,	%o7
	udiv	%g1,	0x0B6A,	%i4
	fands	%f8,	%f7,	%f25
	tn	%xcc,	0x7
	bcs	%xcc,	loop_322
	fbne	%fcc3,	loop_323
	fmovsge	%xcc,	%f1,	%f20
	movrlez	%o4,	%g7,	%o5
loop_322:
	bcs,a	loop_324
loop_323:
	fmul8x16au	%f21,	%f4,	%f24
	sdivcc	%o2,	0x124B,	%i2
	fmovsle	%icc,	%f7,	%f17
loop_324:
	edge32ln	%l2,	%i7,	%l0
	fbug,a	%fcc3,	loop_325
	xorcc	%i5,	%l3,	%g6
	movrne	%i1,	%l1,	%o1
	tcs	%icc,	0x2
loop_325:
	lduw	[%l7 + 0x60],	%o0
	alignaddrl	%o6,	%g3,	%i6
	edge32l	%g5,	%o3,	%l4
	set	0x50, %g7
	swapa	[%l7 + %g7] 0x04,	%g2
	fmovrse	%i0,	%f15,	%f10
	call	loop_326
	tg	%icc,	0x7
	fmuld8ulx16	%f19,	%f29,	%f4
	tl	%icc,	0x5
loop_326:
	umulcc	%i3,	%g4,	%l6
	taddcc	%l5,	0x0D4F,	%g1
	edge8	%i4,	%o4,	%o7
	sub	%g7,	0x1C7C,	%o5
	bpos,a	%xcc,	loop_327
	fcmps	%fcc3,	%f13,	%f5
	fxnors	%f28,	%f8,	%f14
	subccc	%o2,	0x0B8E,	%l2
loop_327:
	taddcctv	%i7,	0x0BBA,	%l0
	fors	%f11,	%f21,	%f18
	brnz	%i5,	loop_328
	smulcc	%i2,	%l3,	%i1
	mulx	%l1,	0x137F,	%g6
	ldd	[%l7 + 0x40],	%o0
loop_328:
	sdivx	%o6,	0x0ABD,	%g3
	fmovdneg	%xcc,	%f1,	%f30
	taddcctv	%o1,	%g5,	%o3
	movrlz	%i6,	%g2,	%i0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%l4
	tn	%icc,	0x4
	movpos	%xcc,	%l6,	%g4
	array32	%g1,	%l5,	%o4
	fbuge,a	%fcc3,	loop_329
	fbl,a	%fcc2,	loop_330
	fmuld8sux16	%f22,	%f5,	%f28
	bg,pt	%icc,	loop_331
loop_329:
	xor	%o7,	%g7,	%o5
loop_330:
	sub	%o2,	0x07C3,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_331:
	ba,a	loop_332
	bvc	loop_333
	andn	%i4,	%i7,	%l0
	array32	%i5,	%l3,	%i2
loop_332:
	tl	%icc,	0x3
loop_333:
	nop
	wr	%g0,	0xea,	%asi
	stda	%l0,	[%l7 + 0x08] %asi
	membar	#Sync
	edge8n	%i1,	%g6,	%o6
	xorcc	%o0,	%g3,	%o1
	movneg	%xcc,	%o3,	%i6
	addc	%g2,	%i0,	%i3
	fmovrse	%l4,	%f19,	%f4
	udivcc	%l6,	0x08F0,	%g5
	edge16n	%g1,	%g4,	%l5
	fbo,a	%fcc3,	loop_334
	fmovsgu	%icc,	%f20,	%f29
	fnot1	%f12,	%f4
	fmovdl	%icc,	%f20,	%f22
loop_334:
	alignaddr	%o7,	%g7,	%o5
	ldub	[%l7 + 0x3D],	%o4
	mulx	%l2,	0x002F,	%o2
	brlez	%i4,	loop_335
	or	%l0,	0x1F6F,	%i7
	stw	%l3,	[%l7 + 0x7C]
	bg,a	%xcc,	loop_336
loop_335:
	umulcc	%i2,	0x0CFC,	%i5
	edge32ln	%l1,	%i1,	%o6
	andcc	%g6,	0x0D72,	%o0
loop_336:
	srl	%o1,	%g3,	%o3
	brz,a	%i6,	loop_337
	fbl	%fcc1,	loop_338
	membar	0x17
	movle	%icc,	%g2,	%i3
loop_337:
	sll	%l4,	%l6,	%g5
loop_338:
	smul	%g1,	%g4,	%l5
	sdiv	%i0,	0x09EB,	%o7
	brlez,a	%o5,	loop_339
	tsubcc	%o4,	%g7,	%o2
	prefetch	[%l7 + 0x58],	 0x2
	tcc	%icc,	0x0
loop_339:
	mova	%icc,	%l2,	%i4
	srl	%l0,	%l3,	%i7
	tleu	%xcc,	0x6
	fpadd32	%f14,	%f10,	%f4
	smulcc	%i2,	0x1395,	%i5
	bge,a	%xcc,	loop_340
	tle	%xcc,	0x2
	sra	%l1,	%i1,	%g6
	bge	loop_341
loop_340:
	sdiv	%o0,	0x1F3E,	%o6
	fbule,a	%fcc1,	loop_342
	edge16ln	%g3,	%o1,	%o3
loop_341:
	subcc	%g2,	%i6,	%l4
	array32	%i3,	%l6,	%g1
loop_342:
	orcc	%g4,	0x1233,	%g5
	move	%icc,	%i0,	%l5
	array16	%o7,	%o4,	%g7
	sth	%o5,	[%l7 + 0x58]
	add	%o2,	0x082D,	%l2
	orncc	%l0,	0x0901,	%i4
	fpadd16s	%f24,	%f28,	%f10
	brz	%i7,	loop_343
	movgu	%xcc,	%i2,	%i5
	tg	%icc,	0x5
	fmovdpos	%xcc,	%f14,	%f17
loop_343:
	taddcctv	%l1,	0x0B09,	%l3
	fzeros	%f26
	orcc	%i1,	%o0,	%g6
	prefetch	[%l7 + 0x60],	 0x2
	mova	%xcc,	%g3,	%o6
	fbl	%fcc1,	loop_344
	bneg	loop_345
	sethi	0x06FB,	%o3
	fpsub16s	%f28,	%f9,	%f5
loop_344:
	fbo	%fcc0,	loop_346
loop_345:
	swap	[%l7 + 0x54],	%o1
	fnand	%f2,	%f20,	%f2
	movrgz	%g2,	%i6,	%l4
loop_346:
	movrgz	%i3,	%l6,	%g1
	movrgz	%g4,	0x0CC,	%g5
	nop
	setx	loop_347,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbuge,a	%fcc0,	loop_348
	tleu	%icc,	0x5
	movrlz	%i0,	0x077,	%o7
loop_347:
	fmovdle	%xcc,	%f15,	%f25
loop_348:
	edge32n	%o4,	%l5,	%g7
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x63] %asi,	%o5
	fxor	%f22,	%f4,	%f8
	subccc	%l2,	0x1FF5,	%o2
	fmovdn	%icc,	%f13,	%f11
	fnot2s	%f1,	%f24
	edge16l	%l0,	%i7,	%i2
	umul	%i5,	%i4,	%l3
	array32	%i1,	%o0,	%g6
	srl	%g3,	0x16,	%l1
	movgu	%icc,	%o3,	%o6
	set	0x18, %l0
	ldxa	[%l7 + %l0] 0x0c,	%o1
	andcc	%g2,	0x012C,	%l4
	addc	%i6,	%l6,	%g1
	srax	%g4,	0x0C,	%i3
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	srlx	%g5,	%o7,	%i0
	fornot2	%f10,	%f6,	%f22
	fmovscc	%xcc,	%f18,	%f26
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x20] %asi,	%f20
	sdivx	%l5,	0x1E12,	%o4
	edge32l	%g7,	%o5,	%o2
	siam	0x5
	tge	%icc,	0x7
	fmovdn	%icc,	%f31,	%f3
	fmovsleu	%xcc,	%f20,	%f12
	swap	[%l7 + 0x7C],	%l2
	array32	%l0,	%i2,	%i7
	movcs	%icc,	%i5,	%i4
	move	%xcc,	%i1,	%o0
	fbul,a	%fcc3,	loop_349
	fmovdvs	%icc,	%f20,	%f6
	tvc	%icc,	0x7
	fzeros	%f7
loop_349:
	array32	%g6,	%l3,	%l1
	edge16l	%g3,	%o6,	%o1
	te	%xcc,	0x6
	set	0x20, %i0
	stxa	%o3,	[%l7 + %i0] 0x22
	membar	#Sync
	alignaddrl	%g2,	%i6,	%l4
	move	%xcc,	%l6,	%g4
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x70] %asi,	%i3
	fbo,a	%fcc2,	loop_350
	fmovrslz	%g1,	%f7,	%f25
	edge32ln	%g5,	%o7,	%i0
	fcmped	%fcc0,	%f30,	%f22
loop_350:
	fmovrslz	%l5,	%f27,	%f16
	fbu,a	%fcc3,	loop_351
	addccc	%g7,	%o5,	%o4
	fmul8x16au	%f18,	%f7,	%f10
	sllx	%o2,	0x0A,	%l0
loop_351:
	ldd	[%l7 + 0x70],	%f12
	fmovdl	%xcc,	%f22,	%f4
	stw	%l2,	[%l7 + 0x54]
	std	%f28,	[%l7 + 0x70]
	sll	%i2,	%i7,	%i5
	tge	%xcc,	0x0
	fbug	%fcc0,	loop_352
	edge16l	%i4,	%i1,	%g6
	fbul,a	%fcc3,	loop_353
	subccc	%o0,	%l1,	%g3
loop_352:
	fcmped	%fcc3,	%f8,	%f18
	fmovde	%icc,	%f18,	%f29
loop_353:
	umul	%o6,	%l3,	%o3
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x15
	fpsub32	%f24,	%f2,	%f14
	sethi	0x00A0,	%g2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
	fandnot2	%f2,	%f28,	%f30
	subc	%i6,	%l4,	%g4
	fbug,a	%fcc2,	loop_354
	bvs,pt	%icc,	loop_355
	bcc,pn	%xcc,	loop_356
	movn	%icc,	%l6,	%i3
loop_354:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%g1
loop_355:
	fbl	%fcc3,	loop_357
loop_356:
	fmovdne	%icc,	%f6,	%f25
	bn,a	loop_358
	sir	0x17CB
loop_357:
	te	%icc,	0x2
	tle	%icc,	0x0
loop_358:
	tg	%xcc,	0x7
	wr	%g0,	0x81,	%asi
	stba	%i0,	[%l7 + 0x24] %asi
	move	%xcc,	%l5,	%g7
	srl	%o5,	%o7,	%o2
	bvc,a,pn	%xcc,	loop_359
	fmovsa	%xcc,	%f7,	%f10
	alignaddr	%l0,	%l2,	%i2
	fmovrdne	%o4,	%f6,	%f24
loop_359:
	umulcc	%i7,	0x0979,	%i4
	fmovsg	%icc,	%f23,	%f7
	tl	%icc,	0x7
	prefetch	[%l7 + 0x6C],	 0x0
	tg	%icc,	0x7
	edge8ln	%i1,	%g6,	%i5
	tleu	%icc,	0x5
	wr	%g0,	0x88,	%asi
	stha	%l1,	[%l7 + 0x74] %asi
	fnot2	%f0,	%f8
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x50] %asi,	%g3
	fnors	%f11,	%f2,	%f30
	movl	%icc,	%o0,	%o6
	tvs	%icc,	0x4
	te	%icc,	0x1
	fbul	%fcc0,	loop_360
	tge	%icc,	0x4
	wr	%g0,	0xe2,	%asi
	stxa	%o3,	[%l7 + 0x20] %asi
	membar	#Sync
loop_360:
	addc	%l3,	0x0C69,	%g2
	movrlz	%o1,	%i6,	%l4
	te	%xcc,	0x2
	movvs	%xcc,	%g4,	%i3
	movge	%icc,	%l6,	%g1
	orncc	%i0,	%l5,	%g7
	subcc	%g5,	0x1CCE,	%o5
	fmovsvc	%icc,	%f18,	%f4
	movvs	%icc,	%o2,	%l0
	orn	%o7,	%l2,	%o4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x3C] %asi,	%i2
	fmovdneg	%icc,	%f26,	%f11
	movvs	%icc,	%i4,	%i1
	srlx	%g6,	%i5,	%l1
	mulscc	%g3,	0x0D82,	%i7
	brgez	%o0,	loop_361
	bleu,a,pn	%xcc,	loop_362
	tcs	%xcc,	0x2
	tgu	%xcc,	0x2
loop_361:
	edge32n	%o6,	%o3,	%l3
loop_362:
	movl	%xcc,	%o1,	%g2
	add	%i6,	%g4,	%i3
	fmovdn	%icc,	%f1,	%f2
	fmovrsne	%l4,	%f31,	%f30
	fpsub32	%f26,	%f20,	%f22
	tsubcc	%l6,	%i0,	%l5
	fornot2	%f18,	%f16,	%f10
	stw	%g7,	[%l7 + 0x2C]
	st	%f13,	[%l7 + 0x0C]
	smulcc	%g1,	%o5,	%g5
	edge8n	%l0,	%o7,	%o2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x56] %asi,	%o4
	ta	%icc,	0x2
	edge16l	%i2,	%l2,	%i1
	movle	%icc,	%g6,	%i5
	fmul8sux16	%f12,	%f12,	%f12
	fbug,a	%fcc3,	loop_363
	addcc	%l1,	%g3,	%i4
	fxor	%f28,	%f22,	%f8
	fcmple32	%f22,	%f20,	%i7
loop_363:
	fsrc2s	%f9,	%f3
	tgu	%xcc,	0x5
	movre	%o6,	%o3,	%o0
	smul	%l3,	%o1,	%i6
	fmovrsne	%g4,	%f20,	%f27
	sllx	%g2,	0x06,	%i3
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x1e,	%f0
	fmovsgu	%xcc,	%f16,	%f12
	fmovsneg	%icc,	%f22,	%f11
	smulcc	%l4,	%i0,	%l6
	smulcc	%l5,	%g1,	%o5
	membar	0x6B
	edge32	%g7,	%l0,	%o7
	te	%icc,	0x1
	fornot2s	%f26,	%f21,	%f26
	bvs	loop_364
	subc	%g5,	0x0CF5,	%o2
	mulx	%o4,	%l2,	%i2
	ldsw	[%l7 + 0x30],	%i1
loop_364:
	fcmpd	%fcc3,	%f16,	%f16
	sdivcc	%i5,	0x0EBD,	%g6
	sir	0x06D5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%l1
	bge,pn	%xcc,	loop_365
	fbo	%fcc0,	loop_366
	xorcc	%i7,	%i4,	%o3
	subccc	%o0,	0x133C,	%o6
loop_365:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
loop_366:
	fcmple16	%f8,	%f10,	%l3
	alignaddr	%i6,	%g2,	%i3
	array16	%l4,	%g4,	%l6
	fba,a	%fcc1,	loop_367
	orn	%i0,	0x0C67,	%l5
	move	%xcc,	%o5,	%g1
	edge32	%l0,	%g7,	%o7
loop_367:
	orn	%g5,	%o4,	%o2
	smul	%i2,	%l2,	%i1
	tleu	%xcc,	0x6
	tsubcctv	%i5,	0x0DDA,	%g6
	tg	%xcc,	0x5
	fnot1	%f22,	%f14
	tpos	%icc,	0x4
	xnor	%l1,	%i7,	%g3
	movle	%xcc,	%i4,	%o0
	edge32	%o3,	%o1,	%l3
	andn	%o6,	0x0C34,	%i6
	xnorcc	%i3,	%l4,	%g2
	edge8	%l6,	%g4,	%l5
	nop
	setx loop_368, %l0, %l1
	jmpl %l1, %o5
	fpsub32	%f18,	%f4,	%f2
	xnorcc	%i0,	0x1391,	%l0
	movcs	%xcc,	%g1,	%o7
loop_368:
	lduw	[%l7 + 0x70],	%g5
	movpos	%icc,	%g7,	%o4
	andcc	%i2,	0x192C,	%o2
	stw	%i1,	[%l7 + 0x64]
	sethi	0x027A,	%i5
	bvc	%icc,	loop_369
	movl	%icc,	%g6,	%l2
	edge16	%l1,	%g3,	%i4
	set	0x08, %i7
	stha	%o0,	[%l7 + %i7] 0x10
loop_369:
	movre	%i7,	%o3,	%o1
	bcc,pn	%icc,	loop_370
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f29,	%f13,	%f28
	fmovsne	%icc,	%f12,	%f17
loop_370:
	fmovspos	%xcc,	%f15,	%f22
	set	0x0C, %g5
	ldsha	[%l7 + %g5] 0x19,	%l3
	movrne	%i6,	%i3,	%l4
	move	%icc,	%g2,	%o6
	tvs	%xcc,	0x2
	fmovsle	%xcc,	%f7,	%f0
	set	0x44, %l2
	stwa	%l6,	[%l7 + %l2] 0x81
	movrgz	%l5,	0x3A7,	%g4
	fcmpgt16	%f28,	%f0,	%i0
	movn	%xcc,	%o5,	%l0
	fmovrdlz	%o7,	%f8,	%f22
	stw	%g5,	[%l7 + 0x5C]
	smul	%g1,	0x0079,	%o4
	edge32	%i2,	%g7,	%o2
	fmovse	%xcc,	%f9,	%f2
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	fblg,a	%fcc0,	loop_371
	alignaddrl	%i5,	%l2,	%l1
	fornot1s	%f7,	%f23,	%f18
	nop
	set	0x2F, %l6
	ldub	[%l7 + %l6],	%g3
loop_371:
	fmovsn	%xcc,	%f29,	%f4
	bpos	%xcc,	loop_372
	orcc	%g6,	%i4,	%i7
	taddcc	%o0,	%o3,	%o1
	movrgez	%i6,	0x397,	%l3
loop_372:
	sdivcc	%i3,	0x1CEF,	%l4
	smul	%g2,	%l6,	%o6
	movne	%xcc,	%g4,	%i0
	fnand	%f30,	%f10,	%f10
	movpos	%icc,	%l5,	%l0
	fzeros	%f24
	ldstub	[%l7 + 0x64],	%o7
	fones	%f20
	bleu,pn	%xcc,	loop_373
	nop
	setx	loop_374,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpeq16	%f28,	%f26,	%o5
	bvc	loop_375
loop_373:
	bneg	%icc,	loop_376
loop_374:
	tgu	%icc,	0x5
	fba	%fcc0,	loop_377
loop_375:
	fnegs	%f25,	%f5
loop_376:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x54] %asi,	%g5
loop_377:
	ldsw	[%l7 + 0x64],	%o4
	subccc	%i2,	%g1,	%o2
	and	%g7,	0x1BED,	%i1
	movl	%xcc,	%l2,	%i5
	tsubcc	%l1,	%g6,	%g3
	fornot2s	%f19,	%f27,	%f30
	tgu	%icc,	0x5
	fnegd	%f2,	%f4
	fmovspos	%xcc,	%f2,	%f2
	tsubcctv	%i4,	%o0,	%o3
	ldsw	[%l7 + 0x6C],	%o1
	wr	%g0,	0x89,	%asi
	sta	%f19,	[%l7 + 0x10] %asi
	orn	%i7,	%l3,	%i6
	fpsub32	%f18,	%f8,	%f6
	addc	%i3,	%l4,	%l6
	bcc,a	loop_378
	smul	%o6,	%g2,	%g4
	lduw	[%l7 + 0x54],	%i0
	fbul	%fcc3,	loop_379
loop_378:
	fmovrsne	%l0,	%f11,	%f18
	movle	%icc,	%l5,	%o5
	fmovrslez	%o7,	%f23,	%f4
loop_379:
	sdiv	%o4,	0x116C,	%g5
	srl	%g1,	%o2,	%g7
	brlz	%i2,	loop_380
	alignaddrl	%i1,	%l2,	%i5
	ldub	[%l7 + 0x5E],	%l1
	movl	%xcc,	%g6,	%i4
loop_380:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovdcc	%xcc,	%f11,	%f22
	edge16ln	%g3,	%o0,	%o1
	movgu	%icc,	%i7,	%l3
	ldx	[%l7 + 0x38],	%i6
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x30] %asi,	%o3
	ldsh	[%l7 + 0x24],	%l4
	subccc	%i3,	0x0BAA,	%l6
	bge	loop_381
	addccc	%g2,	%g4,	%i0
	movg	%xcc,	%l0,	%o6
	fmovsge	%xcc,	%f28,	%f23
loop_381:
	smul	%o5,	%l5,	%o7
	swap	[%l7 + 0x6C],	%g5
	edge8	%o4,	%g1,	%g7
	stbar
	fbue	%fcc1,	loop_382
	sethi	0x0830,	%o2
	sdivcc	%i2,	0x1826,	%i1
	bn,a,pn	%icc,	loop_383
loop_382:
	udivx	%l2,	0x07B6,	%l1
	movvs	%icc,	%g6,	%i5
	tl	%icc,	0x3
loop_383:
	movrgz	%i4,	%g3,	%o1
	lduw	[%l7 + 0x7C],	%i7
	stx	%l3,	[%l7 + 0x18]
	udiv	%o0,	0x08CC,	%i6
	sllx	%o3,	0x06,	%i3
	fandnot2s	%f30,	%f16,	%f31
	bvc,pn	%icc,	loop_384
	array16	%l4,	%g2,	%l6
	xor	%g4,	%l0,	%o6
	tvs	%xcc,	0x7
loop_384:
	brz,a	%o5,	loop_385
	brlez,a	%l5,	loop_386
	andncc	%o7,	%g5,	%o4
	tsubcc	%i0,	0x0EFF,	%g7
loop_385:
	bleu,pt	%xcc,	loop_387
loop_386:
	tn	%xcc,	0x5
	fandnot1	%f18,	%f16,	%f10
	movvs	%icc,	%g1,	%i2
loop_387:
	nop
	set	0x58, %g2
	prefetcha	[%l7 + %g2] 0x88,	 0x0
	fsrc1	%f12,	%f20
	ldsh	[%l7 + 0x7C],	%i1
	subccc	%l1,	%l2,	%g6
	movle	%xcc,	%i5,	%i4
	fmovrdgez	%g3,	%f20,	%f28
	movvs	%icc,	%o1,	%i7
	andn	%o0,	%i6,	%o3
	wr	%g0,	0x11,	%asi
	sta	%f3,	[%l7 + 0x58] %asi
	xnorcc	%i3,	0x1FD6,	%l4
	bleu	loop_388
	movne	%xcc,	%l3,	%g2
	stw	%l6,	[%l7 + 0x24]
	orn	%g4,	%o6,	%o5
loop_388:
	alignaddr	%l5,	%o7,	%l0
	edge16	%g5,	%o4,	%g7
	sll	%i0,	0x0A,	%g1
	edge32ln	%o2,	%i2,	%l1
	ldsb	[%l7 + 0x45],	%i1
	move	%xcc,	%l2,	%g6
	sll	%i5,	0x1D,	%g3
	tneg	%xcc,	0x6
	movge	%icc,	%o1,	%i4
	movcs	%icc,	%o0,	%i7
	membar	0x1C
	xnorcc	%i6,	0x0775,	%i3
	fexpand	%f18,	%f12
	bpos,pt	%icc,	loop_389
	fblg,a	%fcc2,	loop_390
	lduw	[%l7 + 0x2C],	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_389:
	sth	%o3,	[%l7 + 0x6E]
loop_390:
	sub	%g2,	0x0DED,	%l3
	tne	%icc,	0x0
	edge32n	%l6,	%g4,	%o6
	addc	%l5,	0x0726,	%o7
	fmul8ulx16	%f6,	%f30,	%f28
	fnot1s	%f7,	%f0
	fmovdpos	%icc,	%f10,	%f6
	movneg	%icc,	%l0,	%o5
	fmovdpos	%xcc,	%f27,	%f28
	tle	%icc,	0x6
	tneg	%xcc,	0x4
	movrgez	%g5,	0x329,	%o4
	fmovda	%icc,	%f8,	%f23
	sub	%i0,	0x08DF,	%g7
	edge8	%g1,	%i2,	%o2
	fmovrdlz	%i1,	%f12,	%f0
	nop
	set	0x58, %l4
	ldd	[%l7 + %l4],	%f20
	movrlez	%l1,	0x327,	%l2
	set	0x2C, %g4
	lduwa	[%l7 + %g4] 0x14,	%i5
	tvc	%icc,	0x5
	edge8l	%g3,	%g6,	%o1
	udivx	%i4,	0x16BA,	%o0
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x1e,	%f16
	fandnot2	%f4,	%f28,	%f22
	movg	%xcc,	%i6,	%i7
	fmovdcs	%icc,	%f8,	%f3
	fmovsvc	%xcc,	%f20,	%f19
	sllx	%l4,	0x07,	%o3
	movrgz	%i3,	%g2,	%l3
	taddcctv	%g4,	0x0002,	%l6
	fzeros	%f2
	tle	%xcc,	0x1
	bvs	%icc,	loop_391
	tvc	%xcc,	0x0
	xor	%l5,	%o7,	%l0
	umul	%o6,	%o5,	%g5
loop_391:
	tgu	%icc,	0x2
	fmul8x16	%f14,	%f18,	%f16
	andncc	%o4,	%i0,	%g1
	ld	[%l7 + 0x40],	%f9
	movneg	%icc,	%i2,	%o2
	addcc	%g7,	%i1,	%l1
	tpos	%xcc,	0x6
	add	%l2,	%g3,	%i5
	bvs	loop_392
	tsubcctv	%g6,	0x0D07,	%o1
	tleu	%icc,	0x1
	sra	%o0,	0x01,	%i4
loop_392:
	subccc	%i6,	%l4,	%i7
	fmovrsgez	%o3,	%f3,	%f7
	movrlz	%i3,	0x2AA,	%g2
	fmovsa	%xcc,	%f28,	%f28
	movcc	%icc,	%g4,	%l3
	fmul8x16au	%f24,	%f17,	%f4
	fmovdvc	%xcc,	%f19,	%f22
	fpadd16s	%f24,	%f28,	%f27
	tne	%xcc,	0x3
	fmovscc	%icc,	%f9,	%f29
	sllx	%l6,	0x1B,	%o7
	wr	%g0,	0x18,	%asi
	sta	%f4,	[%l7 + 0x48] %asi
	tleu	%icc,	0x5
	edge8l	%l5,	%l0,	%o5
	array16	%g5,	%o4,	%i0
	movrlez	%g1,	0x266,	%o6
	udiv	%o2,	0x1648,	%g7
	sdiv	%i2,	0x16EF,	%i1
	edge8	%l2,	%l1,	%i5
	fmovspos	%xcc,	%f21,	%f14
	sdivx	%g6,	0x1F70,	%g3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o0
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	fmul8x16al	%f27,	%f9,	%f12
	edge32	%i6,	%i4,	%l4
	movcc	%xcc,	%i7,	%o3
	array8	%g2,	%g4,	%i3
	tn	%xcc,	0x1
	fxnors	%f25,	%f2,	%f28
	ldsh	[%l7 + 0x68],	%l6
	movl	%icc,	%o7,	%l5
	srl	%l0,	0x11,	%o5
	fmovdneg	%icc,	%f6,	%f13
	be	%icc,	loop_393
	fmovscc	%xcc,	%f29,	%f9
	edge16	%g5,	%o4,	%i0
	fmovrslez	%l3,	%f28,	%f16
loop_393:
	fbu,a	%fcc0,	loop_394
	fbe	%fcc1,	loop_395
	bvs,a	loop_396
	sdivcc	%o6,	0x0ED3,	%o2
loop_394:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g1,	%i2
loop_395:
	alignaddr	%g7,	%l2,	%l1
loop_396:
	swap	[%l7 + 0x20],	%i5
	alignaddrl	%i1,	%g3,	%o0
	sdiv	%o1,	0x0809,	%g6
	set	0x30, %i6
	ldda	[%l7 + %i6] 0x14,	%i6
	fble	%fcc3,	loop_397
	tle	%xcc,	0x4
	alignaddrl	%i4,	%i7,	%o3
	fnegd	%f24,	%f26
loop_397:
	alignaddr	%g2,	%g4,	%i3
	movrgez	%l4,	%o7,	%l6
	array16	%l0,	%o5,	%g5
	fmovde	%icc,	%f9,	%f11
	ta	%xcc,	0x6
	fmovde	%icc,	%f27,	%f12
	fands	%f1,	%f30,	%f3
	fnot2	%f8,	%f22
	tpos	%xcc,	0x6
	array32	%l5,	%i0,	%l3
	fnot2s	%f7,	%f0
	andn	%o4,	%o6,	%o2
	tvc	%icc,	0x1
	fandnot2s	%f31,	%f9,	%f15
	and	%i2,	%g7,	%l2
	fcmpes	%fcc3,	%f6,	%f4
	subc	%g1,	0x144A,	%l1
	tvs	%xcc,	0x3
	movpos	%xcc,	%i1,	%i5
	ldsb	[%l7 + 0x7E],	%g3
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x10] %asi,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f18,	%f30,	%o1
	tl	%icc,	0x6
	fzero	%f4
	set	0x29, %i5
	ldstuba	[%l7 + %i5] 0x04,	%i6
	ldstub	[%l7 + 0x51],	%i4
	movge	%xcc,	%g6,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o3,	%g2,	%g4
	bne,a,pn	%icc,	loop_398
	udivcc	%i3,	0x053B,	%o7
	fsrc1s	%f14,	%f12
	movcs	%icc,	%l4,	%l0
loop_398:
	sethi	0x1808,	%l6
	movl	%icc,	%o5,	%g5
	fbug	%fcc1,	loop_399
	fmovsl	%xcc,	%f23,	%f6
	fbg	%fcc0,	loop_400
	fmovdvc	%xcc,	%f15,	%f22
loop_399:
	fcmpeq32	%f22,	%f26,	%l5
	bvc,pn	%xcc,	loop_401
loop_400:
	andcc	%i0,	0x1B86,	%o4
	edge16	%o6,	%l3,	%o2
	tneg	%icc,	0x2
loop_401:
	or	%i2,	0x1194,	%g7
	ldd	[%l7 + 0x68],	%g0
	tsubcctv	%l1,	0x043A,	%i1
	tsubcctv	%l2,	0x1A67,	%i5
	fandnot1s	%f26,	%f31,	%f30
	array32	%g3,	%o1,	%o0
	edge16ln	%i4,	%g6,	%i7
	orncc	%i6,	0x0E55,	%o3
	xnor	%g4,	%g2,	%i3
	movle	%icc,	%l4,	%o7
	subccc	%l0,	0x0710,	%o5
	sllx	%g5,	0x14,	%l5
	tcs	%icc,	0x0
	edge8l	%l6,	%i0,	%o6
	taddcctv	%l3,	%o4,	%o2
	nop
	set	0x1F, %i2
	ldub	[%l7 + %i2],	%i2
	array16	%g7,	%g1,	%l1
	edge16n	%i1,	%i5,	%l2
	fpsub16s	%f11,	%f28,	%f21
	bvc,pt	%icc,	loop_402
	brlz,a	%o1,	loop_403
	bshuffle	%f8,	%f4,	%f14
	udiv	%g3,	0x026E,	%i4
loop_402:
	fpadd32s	%f15,	%f2,	%f19
loop_403:
	udiv	%o0,	0x1187,	%i7
	tsubcctv	%i6,	%o3,	%g4
	array8	%g6,	%g2,	%i3
	addcc	%l4,	0x0C2E,	%o7
	sir	0x0DA0
	movleu	%xcc,	%l0,	%o5
	movg	%icc,	%l5,	%l6
	edge16n	%i0,	%o6,	%g5
	fornot1s	%f23,	%f31,	%f15
	srlx	%o4,	%l3,	%o2
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%g7,	[%g0 + 0x310] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	fblg,a	%fcc3,	loop_404
	fcmple32	%f2,	%f4,	%g1
	sra	%i2,	%i1,	%i5
	edge8	%l1,	%o1,	%l2
loop_404:
	udivx	%g3,	0x0B21,	%o0
	movvs	%xcc,	%i7,	%i4
	tsubcc	%o3,	0x1329,	%i6
	sllx	%g4,	0x1E,	%g6
	tge	%xcc,	0x4
	edge16ln	%g2,	%i3,	%o7
	movcs	%xcc,	%l4,	%o5
	fcmped	%fcc1,	%f16,	%f22
	srl	%l0,	%l6,	%l5
	ta	%icc,	0x6
	fmovsvc	%icc,	%f19,	%f22
	edge16ln	%o6,	%i0,	%g5
	ldsb	[%l7 + 0x67],	%o4
	fmovrslez	%l3,	%f15,	%f5
	fmuld8ulx16	%f3,	%f13,	%f26
	udiv	%o2,	0x0631,	%g7
	move	%xcc,	%i2,	%g1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0A] %asi,	%i1
	bneg,a,pn	%icc,	loop_405
	movrgez	%l1,	0x25C,	%o1
	fbne	%fcc0,	loop_406
	tge	%icc,	0x5
loop_405:
	fbg,a	%fcc0,	loop_407
	sub	%l2,	0x0270,	%g3
loop_406:
	tcc	%xcc,	0x6
	fpack16	%f0,	%f7
loop_407:
	nop
	set	0x49, %i3
	ldstuba	[%l7 + %i3] 0x88,	%o0
	fmovs	%f22,	%f16
	faligndata	%f18,	%f4,	%f22
	tpos	%icc,	0x3
	andncc	%i5,	%i4,	%o3
	fmovsne	%xcc,	%f10,	%f10
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tneg	%icc,	0x3
	fmovdle	%icc,	%f3,	%f25
	fmovrdlz	%i7,	%f12,	%f2
	ldstub	[%l7 + 0x55],	%i6
	fsrc2	%f4,	%f26
	tne	%icc,	0x4
	addcc	%g4,	%g2,	%i3
	tcc	%xcc,	0x5
	xnor	%o7,	%g6,	%o5
	sub	%l0,	%l4,	%l5
	fmovrdlez	%o6,	%f6,	%f2
	set	0x70, %l3
	lduha	[%l7 + %l3] 0x80,	%i0
	fmovse	%icc,	%f12,	%f16
	subc	%g5,	0x1D2A,	%l6
	te	%icc,	0x1
	movpos	%icc,	%o4,	%o2
	tge	%xcc,	0x1
	andncc	%g7,	%l3,	%g1
	fornot1s	%f0,	%f28,	%f22
	alignaddrl	%i1,	%l1,	%o1
	brnz,a	%i2,	loop_408
	bpos,pn	%icc,	loop_409
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l2,	%o0,	%g3
loop_408:
	fbg	%fcc0,	loop_410
loop_409:
	fmovrde	%i4,	%f16,	%f10
	tsubcctv	%o3,	%i5,	%i6
	mulx	%i7,	0x04CC,	%g4
loop_410:
	fmovdvc	%icc,	%f7,	%f11
	prefetch	[%l7 + 0x68],	 0x1
	fbe,a	%fcc2,	loop_411
	edge32l	%g2,	%o7,	%g6
	edge16	%i3,	%l0,	%l4
	fmovdl	%xcc,	%f11,	%f15
loop_411:
	nop
	set	0x54, %g1
	ldsha	[%l7 + %g1] 0x19,	%o5
	fnot1s	%f30,	%f9
	ldd	[%l7 + 0x28],	%o6
	lduw	[%l7 + 0x0C],	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f6,	%f10,	%l5
	tle	%xcc,	0x1
	andcc	%l6,	%g5,	%o4
	tge	%icc,	0x3
	ble	%xcc,	loop_412
	xorcc	%o2,	%g7,	%g1
	udivcc	%i1,	0x04D7,	%l1
	set	0x64, %g3
	lda	[%l7 + %g3] 0x19,	%f25
loop_412:
	bl	%xcc,	loop_413
	tcs	%xcc,	0x3
	fmovdn	%icc,	%f29,	%f24
	subc	%o1,	%i2,	%l2
loop_413:
	bge	loop_414
	alignaddr	%o0,	%l3,	%i4
	fmovrdgez	%o3,	%f24,	%f12
	tcc	%icc,	0x3
loop_414:
	movn	%xcc,	%i5,	%g3
	movpos	%icc,	%i6,	%g4
	fmovscc	%icc,	%f9,	%f23
	sll	%i7,	%o7,	%g2
	umulcc	%g6,	0x1075,	%i3
	fbo,a	%fcc2,	loop_415
	bvs	%xcc,	loop_416
	fmovrde	%l4,	%f0,	%f18
	umul	%l0,	%o6,	%i0
loop_415:
	tleu	%xcc,	0x5
loop_416:
	fexpand	%f20,	%f26
	fnand	%f24,	%f12,	%f26
	movrgz	%o5,	%l6,	%g5
	popc	%o4,	%o2
	xorcc	%g7,	0x1AE4,	%l5
	movcc	%xcc,	%i1,	%l1
	movle	%xcc,	%g1,	%i2
	array32	%l2,	%o1,	%o0
	fnors	%f17,	%f16,	%f19
	fmovrslz	%i4,	%f27,	%f29
	udiv	%l3,	0x16D2,	%i5
	movcs	%xcc,	%o3,	%i6
	nop
	setx	loop_417,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tpos	%xcc,	0x5
	mulscc	%g4,	0x168A,	%i7
	movge	%icc,	%o7,	%g3
loop_417:
	movrgz	%g2,	%g6,	%l4
	sdivx	%l0,	0x0847,	%i3
	movg	%icc,	%i0,	%o5
	udivx	%l6,	0x050F,	%o6
	set	0x2C, %o2
	sta	%f14,	[%l7 + %o2] 0x88
	stb	%o4,	[%l7 + 0x6D]
	srlx	%o2,	%g7,	%l5
	or	%i1,	0x135D,	%g5
	move	%icc,	%l1,	%i2
	ldd	[%l7 + 0x18],	%f6
	set	0x73, %o4
	lduba	[%l7 + %o4] 0x10,	%l2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x4B] %asi,	%o1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	te	%icc,	0x7
	xorcc	%o0,	%g1,	%l3
	sll	%i4,	%o3,	%i6
	array8	%i5,	%i7,	%g4
	addcc	%g3,	%g2,	%g6
	ba,pn	%xcc,	loop_418
	nop
	set	0x28, %l5
	stx	%o7,	[%l7 + %l5]
	fsrc2s	%f25,	%f15
	fmovdcc	%icc,	%f27,	%f9
loop_418:
	fbge	%fcc0,	loop_419
	fbuge	%fcc3,	loop_420
	addccc	%l4,	0x1CED,	%l0
	tn	%icc,	0x2
loop_419:
	stbar
loop_420:
	stb	%i0,	[%l7 + 0x26]
	smulcc	%i3,	%o5,	%o6
	movrgz	%o4,	0x1B9,	%o2
	srl	%g7,	0x15,	%l6
	tgu	%icc,	0x1
	movvs	%xcc,	%l5,	%g5
	tle	%xcc,	0x5
	edge16	%i1,	%i2,	%l1
	tleu	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x18] %asi,	%f6
	st	%f4,	[%l7 + 0x54]
	sra	%o1,	%o0,	%l2
	tge	%xcc,	0x0
	tge	%xcc,	0x0
	umulcc	%g1,	0x0FAF,	%l3
	fnand	%f0,	%f6,	%f26
	movneg	%icc,	%i4,	%o3
	tsubcctv	%i6,	0x0A63,	%i7
	std	%i4,	[%l7 + 0x70]
	edge8n	%g4,	%g2,	%g6
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o7
	brnz,a	%l4,	loop_421
	array32	%l0,	%g3,	%i3
	movrgz	%i0,	0x170,	%o5
	fmovsne	%xcc,	%f3,	%f23
loop_421:
	movrne	%o6,	0x025,	%o4
	add	%g7,	%o2,	%l5
	addccc	%g5,	0x049A,	%i1
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x70] %asi,	%l6
	andn	%i2,	%o1,	%o0
	fnand	%f18,	%f24,	%f12
	taddcc	%l2,	0x0070,	%g1
	ba,pt	%xcc,	loop_422
	sethi	0x06DC,	%l3
	edge16n	%i4,	%o3,	%i6
	andcc	%i7,	%l1,	%i5
loop_422:
	fbu	%fcc1,	loop_423
	fmovrslez	%g4,	%f22,	%f17
	taddcctv	%g6,	0x08C5,	%o7
	fnot2s	%f7,	%f25
loop_423:
	movrgz	%g2,	%l0,	%g3
	edge32l	%l4,	%i3,	%i0
	srl	%o6,	0x1E,	%o4
	movrgz	%g7,	0x2F6,	%o5
	fbge,a	%fcc2,	loop_424
	fcmpd	%fcc1,	%f14,	%f14
	xnorcc	%o2,	0x1A16,	%l5
	taddcc	%g5,	%l6,	%i1
loop_424:
	fpack32	%f24,	%f2,	%f22
	movrgez	%o1,	0x301,	%i2
	tne	%icc,	0x4
	array8	%l2,	%g1,	%o0
	edge32	%l3,	%o3,	%i4
	tge	%icc,	0x1
	tpos	%xcc,	0x4
	call	loop_425
	fandnot2s	%f14,	%f22,	%f27
	tle	%xcc,	0x2
	tn	%xcc,	0x4
loop_425:
	addc	%i7,	0x1C74,	%i6
	set	0x10, %o6
	swapa	[%l7 + %o6] 0x89,	%i5
	fmovsneg	%xcc,	%f6,	%f27
	sub	%g4,	0x1553,	%g6
	movcc	%icc,	%l1,	%g2
	prefetch	[%l7 + 0x48],	 0x3
	fcmpgt16	%f0,	%f4,	%o7
	movre	%l0,	0x0CC,	%g3
	set	0x3C, %i1
	lduba	[%l7 + %i1] 0x89,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i0,	%o6,	%i3
	brnz	%o4,	loop_426
	srl	%o5,	%o2,	%g7
	smul	%l5,	0x1C59,	%l6
	tvs	%icc,	0x2
loop_426:
	subc	%i1,	%o1,	%g5
	prefetch	[%l7 + 0x40],	 0x0
	fcmped	%fcc1,	%f18,	%f14
	srlx	%i2,	%l2,	%o0
	xor	%g1,	0x0635,	%o3
	xorcc	%l3,	%i4,	%i6
	tvs	%xcc,	0x2
	movrgez	%i5,	%g4,	%g6
	fmovsl	%icc,	%f12,	%f14
	or	%l1,	%g2,	%i7
	array32	%o7,	%l0,	%l4
	be,a,pt	%xcc,	loop_427
	add	%g3,	0x1E2D,	%o6
	movneg	%xcc,	%i0,	%o4
	flush	%l7 + 0x78
loop_427:
	movleu	%icc,	%o5,	%i3
	wr	%g0,	0x81,	%asi
	stha	%o2,	[%l7 + 0x60] %asi
	sdivcc	%l5,	0x1DC1,	%g7
	fandnot2s	%f19,	%f26,	%f4
	fbl,a	%fcc0,	loop_428
	subccc	%l6,	%o1,	%g5
	fcmpne32	%f14,	%f4,	%i1
	ldsh	[%l7 + 0x6C],	%i2
loop_428:
	fmovdl	%xcc,	%f29,	%f10
	fmul8ulx16	%f26,	%f24,	%f30
	bne	loop_429
	bcc	%xcc,	loop_430
	fmovrse	%l2,	%f14,	%f26
	bshuffle	%f18,	%f4,	%f18
loop_429:
	array32	%g1,	%o0,	%l3
loop_430:
	fbg	%fcc2,	loop_431
	movleu	%xcc,	%i4,	%i6
	tne	%icc,	0x4
	fmovsvc	%xcc,	%f5,	%f16
loop_431:
	edge16n	%i5,	%o3,	%g6
	flush	%l7 + 0x48
	faligndata	%f2,	%f4,	%f18
	fands	%f10,	%f26,	%f19
	array32	%g4,	%g2,	%l1
	fpmerge	%f18,	%f16,	%f28
	movn	%xcc,	%i7,	%o7
	sdiv	%l0,	0x1872,	%g3
	fabss	%f9,	%f23
	ldsb	[%l7 + 0x44],	%o6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%l4
	tne	%xcc,	0x0
	smul	%o4,	0x1AF4,	%o5
	umulcc	%i0,	%o2,	%l5
	array8	%g7,	%i3,	%o1
	bvs,a	%xcc,	loop_432
	fones	%f23
	edge32ln	%g5,	%l6,	%i1
	edge8n	%i2,	%l2,	%g1
loop_432:
	array8	%o0,	%i4,	%i6
	edge8	%i5,	%o3,	%l3
	addcc	%g4,	0x1710,	%g2
	bg,a,pn	%xcc,	loop_433
	fones	%f9
	edge8n	%g6,	%l1,	%o7
	edge8l	%i7,	%l0,	%o6
loop_433:
	bneg,a,pn	%xcc,	loop_434
	brnz,a	%g3,	loop_435
	xor	%l4,	0x0594,	%o4
	smulcc	%i0,	0x0178,	%o2
loop_434:
	xorcc	%o5,	%l5,	%i3
loop_435:
	fsrc1	%f6,	%f12
	brlz	%g7,	loop_436
	array8	%g5,	%l6,	%o1
	sth	%i2,	[%l7 + 0x66]
	tsubcc	%l2,	0x14B2,	%g1
loop_436:
	fmovsa	%icc,	%f26,	%f12
	fpsub16	%f28,	%f2,	%f6
	stb	%o0,	[%l7 + 0x0F]
	fpsub32	%f22,	%f26,	%f28
	edge32l	%i1,	%i6,	%i5
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x118] %asi,	%o3
	umulcc	%l3,	0x1E1D,	%g4
	fmovs	%f22,	%f9
	brlz	%g2,	loop_437
	bneg	%icc,	loop_438
	st	%f28,	[%l7 + 0x74]
	bcs,pt	%xcc,	loop_439
loop_437:
	fmovrdlz	%i4,	%f22,	%f22
loop_438:
	fnot2s	%f28,	%f20
	edge16	%l1,	%g6,	%o7
loop_439:
	subcc	%l0,	0x079E,	%i7
	fbu,a	%fcc0,	loop_440
	orcc	%o6,	%g3,	%l4
	fnot2s	%f14,	%f23
	srlx	%i0,	%o4,	%o5
loop_440:
	srl	%o2,	%i3,	%l5
	xorcc	%g7,	0x0E05,	%l6
	or	%o1,	%i2,	%l2
	bcc,a	loop_441
	subc	%g5,	0x1675,	%o0
	mova	%icc,	%g1,	%i6
	fmovrse	%i5,	%f17,	%f17
loop_441:
	fxor	%f28,	%f16,	%f6
	movge	%icc,	%i1,	%o3
	edge32n	%g4,	%l3,	%g2
	fmovsvc	%icc,	%f3,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez	%i4,	loop_442
	bcs,a,pn	%xcc,	loop_443
	orncc	%l1,	%o7,	%g6
	udivcc	%i7,	0x0995,	%o6
loop_442:
	edge16ln	%l0,	%l4,	%g3
loop_443:
	taddcctv	%i0,	%o4,	%o2
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x38] %asi,	%i3
	subccc	%l5,	%o5,	%l6
	mulx	%o1,	0x1DB4,	%g7
	addccc	%l2,	%g5,	%i2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%o0,	%g1
	fbul	%fcc2,	loop_444
	xnorcc	%i5,	%i6,	%o3
	fmul8x16au	%f17,	%f1,	%f2
	fpmerge	%f10,	%f23,	%f4
loop_444:
	xnorcc	%g4,	%i1,	%l3
	fmovdcc	%icc,	%f17,	%f25
	fmovsl	%icc,	%f24,	%f23
	bge,a	loop_445
	fornot1s	%f0,	%f7,	%f2
	tneg	%icc,	0x6
	sdivx	%g2,	0x1007,	%i4
loop_445:
	srl	%l1,	0x16,	%g6
	brgez	%o7,	loop_446
	andncc	%i7,	%l0,	%o6
	ldd	[%l7 + 0x70],	%g2
	sdivcc	%i0,	0x09C3,	%l4
loop_446:
	tg	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,a,pn	%xcc,	loop_447
	fpsub32s	%f31,	%f19,	%f25
	tne	%icc,	0x1
	fands	%f15,	%f6,	%f22
loop_447:
	tle	%icc,	0x4
	array8	%o4,	%o2,	%i3
	movn	%icc,	%l5,	%o5
	sir	0x040D
	tcc	%icc,	0x3
	taddcc	%l6,	0x0D13,	%o1
	move	%xcc,	%l2,	%g5
	pdist	%f0,	%f18,	%f28
	edge8ln	%g7,	%o0,	%i2
	smulcc	%g1,	%i6,	%o3
	umulcc	%i5,	%i1,	%g4
	set	0x4C, %o3
	lduwa	[%l7 + %o3] 0x89,	%g2
	tgu	%icc,	0x4
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf1,	%f16
	edge8ln	%i4,	%l1,	%l3
	brgz	%o7,	loop_448
	fmovsl	%icc,	%f27,	%f18
	bg,pn	%xcc,	loop_449
	movvs	%xcc,	%g6,	%i7
loop_448:
	nop
	setx	loop_450,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	or	%l0,	%o6,	%i0
loop_449:
	fornot2	%f4,	%f20,	%f0
	alignaddrl	%l4,	%o4,	%o2
loop_450:
	tl	%xcc,	0x4
	nop
	setx	loop_451,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpackfix	%f4,	%f31
	fmovrsgz	%g3,	%f31,	%f17
	edge32n	%i3,	%o5,	%l6
loop_451:
	udivcc	%l5,	0x14AE,	%l2
	movle	%xcc,	%g5,	%o1
	set	0x18, %o5
	lda	[%l7 + %o5] 0x80,	%f13
	orcc	%o0,	%g7,	%g1
	tg	%xcc,	0x1
	bl	loop_452
	movrlz	%i6,	0x369,	%i2
	set	0x30, %o7
	stxa	%o3,	[%g0 + %o7] 0x20
loop_452:
	nop
	set	0x0C, %g7
	lda	[%l7 + %g7] 0x88,	%f24
	fmovrdgez	%i5,	%f6,	%f2
	subcc	%g4,	0x1BA1,	%i1
	ldsh	[%l7 + 0x4C],	%i4
	nop
	setx	loop_453,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tne	%icc,	0x3
	fbn	%fcc1,	loop_454
	fnor	%f2,	%f18,	%f14
loop_453:
	tn	%xcc,	0x0
	ldstub	[%l7 + 0x5B],	%g2
loop_454:
	tvc	%icc,	0x1
	ldx	[%l7 + 0x48],	%l1
	movcc	%xcc,	%o7,	%g6
	set	0x28, %g6
	stda	%i6,	[%l7 + %g6] 0x15
	fmovscc	%icc,	%f14,	%f26
	fbul,a	%fcc0,	loop_455
	tvs	%xcc,	0x0
	fmovdne	%icc,	%f10,	%f19
	edge16ln	%l0,	%l3,	%o6
loop_455:
	movge	%icc,	%i0,	%o4
	movrgez	%l4,	%o2,	%g3
	fpackfix	%f30,	%f29
	fands	%f0,	%f5,	%f9
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	umul	%i3,	0x1063,	%l6
	and	%l5,	0x17C7,	%l2
	fpsub32s	%f20,	%f30,	%f17
	taddcc	%g5,	0x0417,	%o1
	movneg	%icc,	%o0,	%g7
	sdivcc	%o5,	0x0901,	%g1
	srl	%i6,	%i2,	%i5
	fble	%fcc3,	loop_456
	movrgz	%g4,	%i1,	%o3
	movleu	%icc,	%g2,	%i4
	smulcc	%o7,	0x1EDA,	%g6
loop_456:
	subc	%i7,	0x1960,	%l1
	udivx	%l3,	0x09A0,	%o6
	smul	%i0,	0x12B1,	%l0
	edge16	%l4,	%o4,	%o2
	movl	%icc,	%g3,	%l6
	fpsub32s	%f22,	%f18,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x3
	sll	%l5,	%i3,	%l2
	tneg	%xcc,	0x4
	taddcctv	%g5,	%o0,	%o1
	brlz,a	%g7,	loop_457
	fnot2s	%f26,	%f0
	movl	%icc,	%o5,	%g1
	tle	%icc,	0x2
loop_457:
	popc	%i6,	%i5
	movrlez	%g4,	0x366,	%i2
	tl	%xcc,	0x2
	movn	%icc,	%o3,	%g2
	tleu	%xcc,	0x2
	fble,a	%fcc0,	loop_458
	movn	%icc,	%i4,	%i1
	fblg,a	%fcc0,	loop_459
	subcc	%g6,	%o7,	%i7
loop_458:
	lduw	[%l7 + 0x08],	%l1
	movge	%xcc,	%l3,	%o6
loop_459:
	ldd	[%l7 + 0x10],	%f14
	fpack16	%f18,	%f17
	fand	%f26,	%f28,	%f26
	andn	%l0,	%i0,	%o4
	fmovsa	%icc,	%f6,	%f18
	fsrc1	%f16,	%f4
	bshuffle	%f4,	%f16,	%f16
	flush	%l7 + 0x3C
	addccc	%o2,	0x0FCC,	%l4
	swap	[%l7 + 0x38],	%l6
	te	%xcc,	0x4
	movrne	%l5,	%g3,	%l2
	edge8l	%i3,	%g5,	%o0
	edge8	%g7,	%o5,	%g1
	sllx	%o1,	%i6,	%i5
	taddcc	%i2,	%o3,	%g2
	edge32ln	%i4,	%g4,	%g6
	nop
	set	0x2C, %l0
	stw	%i1,	[%l7 + %l0]
	fnegd	%f10,	%f26
	edge8	%o7,	%i7,	%l3
	edge32l	%l1,	%l0,	%i0
	fandnot1s	%f27,	%f19,	%f1
	call	loop_460
	movpos	%xcc,	%o6,	%o4
	swap	[%l7 + 0x7C],	%o2
	addccc	%l4,	%l5,	%g3
loop_460:
	xnorcc	%l2,	%i3,	%l6
	bleu	loop_461
	fpack16	%f12,	%f19
	fmovrsgz	%g5,	%f2,	%f17
	tsubcctv	%o0,	0x1DBA,	%g7
loop_461:
	tge	%xcc,	0x5
	edge32	%o5,	%o1,	%i6
	fmul8x16al	%f8,	%f14,	%f28
	fcmpgt32	%f26,	%f4,	%i5
	membar	0x27
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%i2
	tcs	%icc,	0x4
	movg	%xcc,	%g1,	%o3
	taddcctv	%g2,	%i4,	%g4
	tgu	%icc,	0x2
	srl	%g6,	0x19,	%o7
	fbe,a	%fcc0,	loop_462
	movrgz	%i1,	0x05A,	%l3
	movleu	%xcc,	%l1,	%l0
	bpos	%xcc,	loop_463
loop_462:
	addccc	%i7,	%i0,	%o4
	fmovrsgez	%o2,	%f19,	%f31
	tg	%icc,	0x2
loop_463:
	fsrc1s	%f4,	%f26
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o6
	srlx	%l4,	0x1C,	%g3
	tle	%icc,	0x7
	movleu	%icc,	%l5,	%l2
	tg	%icc,	0x0
	fbue	%fcc0,	loop_464
	membar	0x6F
	mulscc	%i3,	0x121B,	%l6
	set	0x0C, %i0
	stwa	%g5,	[%l7 + %i0] 0xe2
	membar	#Sync
loop_464:
	movge	%xcc,	%o0,	%g7
	fmovrdne	%o1,	%f20,	%f4
	ldub	[%l7 + 0x2E],	%i6
	movneg	%xcc,	%o5,	%i2
	movrne	%g1,	%o3,	%g2
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x15
	udivx	%i4,	0x1077,	%i5
	te	%xcc,	0x2
	movvc	%icc,	%g4,	%g6
	edge8	%o7,	%i1,	%l3
	fbule,a	%fcc3,	loop_465
	edge8	%l1,	%i7,	%i0
	movre	%o4,	0x306,	%o2
	addc	%o6,	0x18F4,	%l4
loop_465:
	fmovrse	%g3,	%f21,	%f12
	fbg,a	%fcc0,	loop_466
	andcc	%l0,	%l2,	%l5
	bgu,a,pn	%xcc,	loop_467
	array8	%i3,	%l6,	%g5
loop_466:
	xor	%o0,	0x192D,	%o1
	udiv	%g7,	0x14BB,	%o5
loop_467:
	movcs	%xcc,	%i2,	%i6
	movrgz	%o3,	%g2,	%i4
	movne	%xcc,	%g1,	%i5
	fbne	%fcc2,	loop_468
	movneg	%xcc,	%g4,	%o7
	addcc	%i1,	%l3,	%l1
	move	%xcc,	%i7,	%i0
loop_468:
	fnot1s	%f31,	%f19
	fpack16	%f24,	%f17
	tle	%xcc,	0x3
	ldstub	[%l7 + 0x4C],	%g6
	tvc	%icc,	0x0
	udivcc	%o4,	0x05ED,	%o2
	fmovde	%icc,	%f7,	%f8
	movcs	%xcc,	%o6,	%l4
	fornot1	%f10,	%f30,	%f10
	fmovsge	%xcc,	%f19,	%f7
	tneg	%xcc,	0x2
	movcs	%icc,	%l0,	%g3
	tg	%xcc,	0x5
	fabsd	%f16,	%f18
	edge8l	%l5,	%l2,	%i3
	fbg,a	%fcc3,	loop_469
	tg	%icc,	0x4
	movn	%xcc,	%l6,	%g5
	srlx	%o0,	0x16,	%o1
loop_469:
	move	%icc,	%o5,	%g7
	tsubcctv	%i6,	%o3,	%g2
	nop
	setx	loop_470,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsvs	%xcc,	%f21,	%f26
	alignaddr	%i2,	%i4,	%g1
	tgu	%xcc,	0x6
loop_470:
	tn	%xcc,	0x1
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x17] %asi,	%g4
	mova	%xcc,	%i5,	%i1
	fmovrse	%l3,	%f29,	%f25
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x28] %asi,	%l1
	fbge,a	%fcc0,	loop_471
	edge16l	%o7,	%i7,	%g6
	nop
	setx	loop_472,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%i0,	0x0DF4,	%o2
loop_471:
	nop
	setx	loop_473,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpd	%fcc3,	%f6,	%f26
loop_472:
	fpack32	%f16,	%f10,	%f18
	stw	%o4,	[%l7 + 0x10]
loop_473:
	fsrc1	%f30,	%f14
	fble,a	%fcc0,	loop_474
	fsrc2s	%f7,	%f29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%l4,	%o6
loop_474:
	fba,a	%fcc1,	loop_475
	membar	0x71
	fmovde	%xcc,	%f15,	%f13
	tvc	%xcc,	0x7
loop_475:
	fba,a	%fcc2,	loop_476
	fmovrdlez	%l0,	%f20,	%f14
	xorcc	%l5,	%l2,	%i3
	sra	%l6,	%g5,	%g3
loop_476:
	be,a,pt	%icc,	loop_477
	tvs	%xcc,	0x7
	movgu	%icc,	%o0,	%o1
	addc	%o5,	%g7,	%o3
loop_477:
	brlz	%i6,	loop_478
	fmovdneg	%icc,	%f5,	%f20
	wr	%g0,	0xe2,	%asi
	stba	%g2,	[%l7 + 0x77] %asi
	membar	#Sync
loop_478:
	srlx	%i2,	%i4,	%g4
	tg	%icc,	0x6
	te	%icc,	0x1
	fmovdn	%xcc,	%f11,	%f27
	bvc,a	loop_479
	movrne	%i5,	%i1,	%g1
	movgu	%xcc,	%l3,	%l1
	movneg	%xcc,	%o7,	%i7
loop_479:
	siam	0x2
	fcmpes	%fcc1,	%f12,	%f16
	and	%g6,	0x0388,	%i0
	tg	%icc,	0x7
	tcc	%icc,	0x3
	edge32n	%o2,	%o4,	%o6
	tne	%xcc,	0x5
	fnand	%f10,	%f22,	%f20
	stbar
	tpos	%icc,	0x2
	nop
	setx	loop_480,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%xcc,	%l4,	%l0
	movl	%xcc,	%l5,	%i3
	fmovspos	%xcc,	%f19,	%f14
loop_480:
	ta	%xcc,	0x1
	edge32l	%l2,	%l6,	%g5
	tne	%xcc,	0x0
	ble	%icc,	loop_481
	fxor	%f20,	%f26,	%f16
	mulscc	%o0,	0x0FFE,	%g3
	fexpand	%f27,	%f0
loop_481:
	movge	%icc,	%o5,	%o1
	array16	%g7,	%o3,	%i6
	edge16ln	%g2,	%i2,	%i4
	smul	%g4,	0x0A03,	%i1
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
	fcmpes	%fcc0,	%f11,	%f23
	movrgz	%g1,	0x2AE,	%l1
	array16	%o7,	%i7,	%g6
	sdiv	%l3,	0x1DDB,	%o2
	tne	%xcc,	0x4
	fpadd16s	%f22,	%f22,	%f2
	fmovrdne	%i0,	%f20,	%f20
	edge8	%o6,	%o4,	%l4
	fbue,a	%fcc0,	loop_482
	fmul8sux16	%f20,	%f2,	%f4
	movrlz	%l0,	%i3,	%l5
	movle	%icc,	%l2,	%g5
loop_482:
	movl	%xcc,	%o0,	%l6
	fpsub16	%f6,	%f16,	%f8
	movcc	%icc,	%g3,	%o1
	ba,pt	%xcc,	loop_483
	taddcctv	%o5,	0x158C,	%g7
	fcmps	%fcc1,	%f20,	%f18
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x2A] %asi,	%i6
loop_483:
	nop
	setx loop_484, %l0, %l1
	jmpl %l1, %o3
	orcc	%i2,	0x1FC2,	%i4
	sll	%g2,	0x0B,	%g4
	alignaddr	%i5,	%g1,	%i1
loop_484:
	fnand	%f8,	%f10,	%f26
	tge	%xcc,	0x5
	fbl,a	%fcc0,	loop_485
	addc	%l1,	0x0A2F,	%i7
	movrgez	%o7,	0x257,	%g6
	sir	0x1312
loop_485:
	fmovscc	%icc,	%f19,	%f1
	tl	%xcc,	0x2
	tcs	%icc,	0x7
	orn	%o2,	0x0392,	%l3
	fone	%f0
	bshuffle	%f6,	%f4,	%f24
	umulcc	%o6,	%i0,	%o4
	edge8ln	%l4,	%l0,	%i3
	srl	%l2,	%l5,	%g5
	te	%xcc,	0x6
	addc	%o0,	0x02DB,	%l6
	wr	%g0,	0xea,	%asi
	stxa	%g3,	[%l7 + 0x18] %asi
	membar	#Sync
	sllx	%o5,	%o1,	%g7
	fnors	%f24,	%f9,	%f26
	popc	%o3,	%i6
	brz,a	%i2,	loop_486
	movpos	%icc,	%g2,	%g4
	bcs,pt	%icc,	loop_487
	ba,a,pn	%icc,	loop_488
loop_486:
	bleu	%icc,	loop_489
	edge32l	%i4,	%g1,	%i5
loop_487:
	tleu	%xcc,	0x1
loop_488:
	movge	%xcc,	%i1,	%l1
loop_489:
	fzeros	%f28
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x58] %asi,	%i7
	fcmps	%fcc3,	%f16,	%f7
	movvs	%xcc,	%o7,	%g6
	udiv	%o2,	0x035C,	%o6
	set	0x5E, %i7
	ldsba	[%l7 + %i7] 0x88,	%l3
	fandnot1s	%f6,	%f12,	%f11
	move	%icc,	%o4,	%i0
	srl	%l4,	%i3,	%l0
	ldx	[%l7 + 0x60],	%l5
	set	0x6C, %o1
	stwa	%l2,	[%l7 + %o1] 0xe3
	membar	#Sync
	siam	0x0
	fnand	%f4,	%f24,	%f10
	alignaddrl	%g5,	%l6,	%g3
	set	0x18, %l2
	lduwa	[%l7 + %l2] 0x89,	%o5
	lduw	[%l7 + 0x64],	%o1
	fble,a	%fcc1,	loop_490
	sll	%o0,	0x13,	%g7
	edge8l	%o3,	%i2,	%i6
	tne	%icc,	0x7
loop_490:
	movrgez	%g2,	%i4,	%g4
	movpos	%icc,	%i5,	%i1
	bpos	%xcc,	loop_491
	popc	%l1,	%g1
	edge8l	%i7,	%g6,	%o2
	fmovsneg	%icc,	%f6,	%f3
loop_491:
	fnot1	%f26,	%f18
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf1
	membar	#Sync
	fcmpeq32	%f2,	%f14,	%o7
	sub	%l3,	0x0026,	%o6
	edge16l	%i0,	%o4,	%i3
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x20] %asi,	%l4
	alignaddrl	%l0,	%l2,	%l5
	tneg	%xcc,	0x4
	orcc	%l6,	0x08E1,	%g5
	fpsub32s	%f14,	%f1,	%f7
	tvs	%icc,	0x0
	fnegs	%f28,	%f0
	edge32n	%g3,	%o1,	%o0
	andcc	%o5,	0x1908,	%o3
	edge8l	%i2,	%i6,	%g7
	tvs	%icc,	0x1
	fmovs	%f28,	%f1
	subc	%i4,	%g2,	%i5
	movn	%icc,	%g4,	%i1
	tle	%xcc,	0x7
	fmovrdgez	%l1,	%f10,	%f10
	popc	%g1,	%i7
	edge32ln	%o2,	%o7,	%g6
	fmovscs	%icc,	%f19,	%f31
	fnot2	%f10,	%f26
	sra	%l3,	0x13,	%o6
	sir	0x04AD
	edge16l	%o4,	%i0,	%i3
	smulcc	%l0,	%l4,	%l5
	smul	%l6,	%g5,	%l2
	movleu	%xcc,	%o1,	%g3
	subc	%o5,	%o3,	%i2
	alignaddrl	%o0,	%i6,	%g7
	srlx	%i4,	0x1B,	%i5
	fcmpne16	%f2,	%f0,	%g4
	addcc	%i1,	%l1,	%g2
	mulscc	%g1,	%o2,	%o7
	orn	%g6,	%i7,	%l3
	fbo	%fcc2,	loop_492
	fcmpeq32	%f16,	%f8,	%o4
	mulscc	%o6,	0x1E52,	%i3
	edge32	%l0,	%i0,	%l4
loop_492:
	fbl,a	%fcc3,	loop_493
	fmovdpos	%icc,	%f15,	%f15
	edge16	%l5,	%g5,	%l2
	edge8ln	%l6,	%g3,	%o5
loop_493:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o1,	%o3,	%i2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i6,	%g7
	taddcctv	%o0,	%i5,	%i4
	movge	%xcc,	%g4,	%l1
	move	%icc,	%i1,	%g2
	st	%f19,	[%l7 + 0x68]
	bleu,pt	%xcc,	loop_494
	movg	%xcc,	%o2,	%g1
	ldsw	[%l7 + 0x0C],	%o7
	ldd	[%l7 + 0x38],	%i6
loop_494:
	tsubcc	%g6,	%o4,	%o6
	taddcctv	%l3,	0x0157,	%i3
	set	0x28, %g2
	swapa	[%l7 + %g2] 0x10,	%i0
	andncc	%l0,	%l4,	%l5
	subc	%l2,	0x0475,	%l6
	fmovsn	%xcc,	%f18,	%f31
	fcmpd	%fcc0,	%f26,	%f28
	fmovrse	%g3,	%f20,	%f29
	fpadd16	%f0,	%f18,	%f10
	lduh	[%l7 + 0x0C],	%g5
	movgu	%xcc,	%o5,	%o3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x4D] %asi,	%o1
	wr	%g0,	0x80,	%asi
	sta	%f13,	[%l7 + 0x28] %asi
	fxors	%f17,	%f13,	%f4
	andncc	%i2,	%g7,	%o0
	array32	%i6,	%i4,	%g4
	fbne,a	%fcc0,	loop_495
	fmovrslez	%i5,	%f7,	%f14
	tcc	%icc,	0x6
	movn	%xcc,	%i1,	%l1
loop_495:
	array32	%o2,	%g2,	%g1
	fpsub32s	%f26,	%f7,	%f18
	edge8	%o7,	%g6,	%o4
	fnot1s	%f24,	%f31
	be	%xcc,	loop_496
	tsubcc	%i7,	0x1E13,	%o6
	movrgez	%i3,	0x221,	%i0
	wr	%g0,	0x81,	%asi
	sta	%f3,	[%l7 + 0x14] %asi
loop_496:
	brnz,a	%l3,	loop_497
	tcc	%xcc,	0x7
	sir	0x0165
	movvc	%xcc,	%l4,	%l5
loop_497:
	te	%xcc,	0x0
	movvc	%xcc,	%l0,	%l6
	fbn,a	%fcc1,	loop_498
	fnegs	%f26,	%f6
	fmul8x16al	%f6,	%f16,	%f28
	siam	0x7
loop_498:
	fmovde	%xcc,	%f12,	%f20
	sub	%g3,	%g5,	%l2
	fmovrdgz	%o3,	%f16,	%f6
	tn	%icc,	0x5
	fmul8x16au	%f19,	%f8,	%f16
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x04
	xnorcc	%o5,	0x108F,	%i2
	fmovse	%xcc,	%f12,	%f26
	fxors	%f30,	%f28,	%f2
	siam	0x0
	ta	%xcc,	0x6
	mulx	%g7,	%o0,	%o1
	movcs	%icc,	%i6,	%i4
	fcmpgt16	%f20,	%f22,	%i5
	xor	%g4,	0x0C7E,	%i1
	tcc	%xcc,	0x1
	edge8	%l1,	%o2,	%g1
	movrne	%g2,	0x169,	%o7
	smul	%g6,	0x0E73,	%o4
	set	0x41, %g4
	ldstuba	[%l7 + %g4] 0x18,	%i7
	edge8	%o6,	%i3,	%l3
	movn	%xcc,	%l4,	%l5
	brlez	%l0,	loop_499
	movrne	%l6,	0x218,	%g3
	bcs,a	loop_500
	movl	%icc,	%g5,	%i0
loop_499:
	fmovdcc	%xcc,	%f11,	%f15
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l2,	%o3
loop_500:
	xor	%o5,	%i2,	%o0
	sub	%o1,	0x005C,	%g7
	xnor	%i4,	0x0551,	%i5
	movrlez	%i6,	0x28F,	%i1
	movpos	%xcc,	%l1,	%o2
	tsubcctv	%g1,	0x0315,	%g2
	xnorcc	%o7,	0x1A01,	%g4
	ldd	[%l7 + 0x20],	%f6
	movcs	%xcc,	%g6,	%i7
	addcc	%o6,	0x0A24,	%o4
	movge	%icc,	%i3,	%l3
	ta	%icc,	0x1
	fabss	%f8,	%f24
	nop
	setx	loop_501,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addccc	%l5,	%l0,	%l6
	fornot2s	%f0,	%f10,	%f13
	edge8	%l4,	%g5,	%i0
loop_501:
	tle	%icc,	0x7
	edge16l	%l2,	%g3,	%o5
	tleu	%icc,	0x3
	add	%i2,	0x0B80,	%o3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	mulscc	%o1,	%g7,	%o0
	edge32n	%i5,	%i4,	%i6
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x1F] %asi,	%l1
	addcc	%o2,	0x0544,	%i1
	movvc	%xcc,	%g2,	%g1
	edge16	%g4,	%o7,	%i7
	movg	%xcc,	%g6,	%o6
	andcc	%o4,	%l3,	%i3
	fmovdneg	%xcc,	%f6,	%f1
	bg	%icc,	loop_502
	smul	%l0,	0x1F47,	%l6
	fble	%fcc1,	loop_503
	fnegs	%f27,	%f0
loop_502:
	sdiv	%l5,	0x14D6,	%g5
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x70] %asi,	%l4
loop_503:
	and	%l2,	0x0CFC,	%g3
	fmovsg	%xcc,	%f31,	%f22
	fbn	%fcc0,	loop_504
	tne	%xcc,	0x2
	stb	%o5,	[%l7 + 0x7F]
	fnegd	%f28,	%f4
loop_504:
	bpos,pn	%xcc,	loop_505
	brnz	%i0,	loop_506
	fpadd32	%f10,	%f28,	%f28
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x80,	%f16
loop_505:
	smul	%o3,	%o1,	%g7
loop_506:
	fcmpeq32	%f2,	%f16,	%o0
	edge32ln	%i5,	%i2,	%i6
	movre	%i4,	0x120,	%o2
	be	%xcc,	loop_507
	movvc	%xcc,	%l1,	%i1
	array8	%g1,	%g2,	%o7
	sll	%g4,	%i7,	%g6
loop_507:
	movrlez	%o6,	0x054,	%l3
	wr	%g0,	0x10,	%asi
	stha	%i3,	[%l7 + 0x24] %asi
	movneg	%xcc,	%l0,	%o4
	set	0x4C, %i6
	ldswa	[%l7 + %i6] 0x10,	%l5
	edge32l	%l6,	%l4,	%g5
	set	0x34, %i5
	stha	%g3,	[%l7 + %i5] 0x22
	membar	#Sync
	sdivx	%l2,	0x1280,	%i0
	fcmped	%fcc0,	%f12,	%f6
	tneg	%icc,	0x4
	fmul8ulx16	%f6,	%f6,	%f26
	fone	%f8
	membar	0x58
	membar	0x7F
	mulx	%o5,	%o3,	%o1
	fandnot1	%f14,	%f2,	%f4
	addccc	%o0,	0x0C84,	%i5
	tpos	%icc,	0x2
	ta	%icc,	0x0
	fandnot1s	%f16,	%f20,	%f20
	fmovrsgz	%g7,	%f15,	%f2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%i2
	sll	%i4,	0x16,	%o2
	mova	%xcc,	%i1,	%g1
	movrgez	%l1,	0x06C,	%g2
	sllx	%g4,	%i7,	%g6
	tle	%xcc,	0x3
	tvc	%icc,	0x4
	ldstub	[%l7 + 0x59],	%o7
	fmovrsgez	%o6,	%f16,	%f0
	tne	%icc,	0x3
	ldx	[%l7 + 0x38],	%l3
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x30] %asi,	%i3
	array32	%o4,	%l5,	%l6
	stbar
	movn	%icc,	%l4,	%l0
	mulscc	%g5,	0x1737,	%l2
	mova	%xcc,	%g3,	%i0
	fmovrdlez	%o3,	%f28,	%f10
	smulcc	%o5,	%o0,	%o1
	orcc	%i5,	0x125E,	%g7
	fmuld8sux16	%f21,	%f13,	%f10
	tl	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%i2,	%i6
	fbne,a	%fcc0,	loop_508
	movrgz	%i4,	0x3C2,	%i1
	fabsd	%f2,	%f10
	fmovrdlez	%o2,	%f8,	%f14
loop_508:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x38] %asi,	%g1
	fmovda	%icc,	%f9,	%f3
	taddcc	%l1,	0x0608,	%g2
	tn	%xcc,	0x6
	fandnot2	%f4,	%f6,	%f22
	edge32l	%i7,	%g4,	%o7
	fnor	%f22,	%f26,	%f26
	umulcc	%o6,	%l3,	%g6
	move	%icc,	%i3,	%o4
	mulscc	%l6,	0x0809,	%l4
	fbug,a	%fcc3,	loop_509
	fmovsleu	%xcc,	%f13,	%f19
	sub	%l0,	0x13F9,	%g5
	orncc	%l5,	%l2,	%i0
loop_509:
	movcs	%icc,	%o3,	%o5
	tneg	%xcc,	0x1
	tneg	%icc,	0x6
	fbuge	%fcc1,	loop_510
	be,pt	%icc,	loop_511
	fcmpne16	%f4,	%f26,	%o0
	orn	%g3,	0x064E,	%i5
loop_510:
	bvc,a,pt	%xcc,	loop_512
loop_511:
	addcc	%o1,	0x0F31,	%i2
	tcc	%xcc,	0x4
	brgez,a	%i6,	loop_513
loop_512:
	mulx	%i4,	0x04F0,	%i1
	ble,pn	%xcc,	loop_514
	srlx	%g7,	%o2,	%l1
loop_513:
	edge8n	%g2,	%g1,	%g4
	subc	%o7,	%o6,	%l3
loop_514:
	fmovsl	%xcc,	%f24,	%f23
	fmovsa	%xcc,	%f28,	%f13
	fcmpd	%fcc0,	%f24,	%f26
	sethi	0x01FA,	%i7
	fmovsneg	%icc,	%f25,	%f7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x6C] %asi,	%f20
	fmovrslez	%g6,	%f29,	%f7
	andn	%o4,	0x1583,	%i3
	fmovrde	%l4,	%f26,	%f22
	edge32	%l6,	%g5,	%l5
	fbne	%fcc3,	loop_515
	edge16	%l2,	%l0,	%i0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x66] %asi,	%o5
loop_515:
	fcmpne32	%f26,	%f12,	%o3
	edge16l	%o0,	%i5,	%g3
	fcmpne16	%f10,	%f22,	%i2
	andncc	%o1,	%i6,	%i4
	movrlez	%g7,	0x234,	%o2
	movvc	%xcc,	%l1,	%g2
	sll	%i1,	0x0D,	%g4
	edge8l	%g1,	%o7,	%l3
	alignaddrl	%o6,	%i7,	%o4
	tvc	%xcc,	0x0
	be,pt	%xcc,	loop_516
	fandnot2	%f28,	%f18,	%f18
	movg	%xcc,	%g6,	%i3
	sra	%l4,	%l6,	%g5
loop_516:
	ba,pt	%icc,	loop_517
	fpadd32	%f4,	%f4,	%f12
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x54] %asi,	%l2
loop_517:
	sdivx	%l0,	0x085A,	%i0
	fzeros	%f4
	mova	%xcc,	%o5,	%o3
	edge32l	%l5,	%o0,	%g3
	fnot1s	%f16,	%f3
	edge8n	%i2,	%o1,	%i5
	bl	%xcc,	loop_518
	fnor	%f4,	%f4,	%f8
	orcc	%i6,	%g7,	%i4
	fmovrde	%o2,	%f28,	%f18
loop_518:
	stb	%g2,	[%l7 + 0x7D]
	tneg	%xcc,	0x7
	fmovrdne	%i1,	%f0,	%f12
	srlx	%g4,	0x0A,	%l1
	sub	%o7,	0x1BC9,	%g1
	swap	[%l7 + 0x10],	%l3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%o6,	%i7
	brz,a	%o4,	loop_519
	array16	%g6,	%l4,	%i3
	udiv	%l6,	0x132D,	%l2
	fnand	%f24,	%f10,	%f12
loop_519:
	bn	loop_520
	move	%xcc,	%l0,	%g5
	edge32n	%i0,	%o3,	%o5
	or	%o0,	0x0D07,	%g3
loop_520:
	fpsub16	%f18,	%f20,	%f16
	xorcc	%i2,	%l5,	%i5
	subc	%o1,	%i6,	%i4
	edge16ln	%o2,	%g2,	%i1
	move	%xcc,	%g4,	%l1
	fmovsgu	%icc,	%f8,	%f27
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o7
	fzeros	%f19
	tg	%xcc,	0x4
	movrne	%g1,	%g7,	%l3
	fmovdn	%icc,	%f21,	%f2
	alignaddr	%o6,	%o4,	%g6
	orn	%i7,	0x07E2,	%l4
	fmovdg	%xcc,	%f7,	%f23
	udivx	%l6,	0x0AB9,	%i3
	bvs,a,pt	%icc,	loop_521
	fbule	%fcc2,	loop_522
	fbg,a	%fcc3,	loop_523
	fbge	%fcc0,	loop_524
loop_521:
	stw	%l0,	[%l7 + 0x18]
loop_522:
	sub	%l2,	0x0EC9,	%g5
loop_523:
	edge8l	%o3,	%i0,	%o5
loop_524:
	sll	%g3,	0x11,	%i2
	tn	%xcc,	0x5
	mulx	%o0,	0x0D12,	%l5
	sll	%o1,	%i5,	%i6
	fcmpgt32	%f0,	%f4,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g2,	%o2,	%g4
	srlx	%i1,	%l1,	%g1
	fmovscs	%xcc,	%f30,	%f22
	fsrc2s	%f15,	%f21
	fmovsl	%icc,	%f8,	%f18
	tneg	%xcc,	0x5
	edge32l	%g7,	%o7,	%l3
	tne	%icc,	0x2
	for	%f28,	%f28,	%f10
	fmovrdne	%o6,	%f30,	%f28
	fmovrslez	%g6,	%f0,	%f27
	fandnot1s	%f12,	%f11,	%f4
	ldd	[%l7 + 0x20],	%f26
	movvc	%icc,	%i7,	%l4
	fmovsa	%icc,	%f7,	%f18
	xor	%o4,	%l6,	%i3
	srlx	%l2,	%g5,	%o3
	ldsb	[%l7 + 0x78],	%l0
	movne	%xcc,	%i0,	%o5
	fnot1	%f10,	%f10
	fnegs	%f3,	%f23
	bn	loop_525
	movvc	%xcc,	%i2,	%g3
	fmovrsgz	%l5,	%f19,	%f18
	fbe,a	%fcc1,	loop_526
loop_525:
	fmovs	%f23,	%f30
	fabsd	%f0,	%f30
	fexpand	%f13,	%f26
loop_526:
	ldsw	[%l7 + 0x18],	%o0
	movcc	%xcc,	%i5,	%o1
	fmul8x16al	%f28,	%f18,	%f14
	ldsb	[%l7 + 0x23],	%i6
	sir	0x1348
	edge32	%g2,	%i4,	%g4
	edge8	%o2,	%i1,	%l1
	sdivx	%g7,	0x0325,	%g1
	sdiv	%l3,	0x0036,	%o6
	sdiv	%g6,	0x008D,	%o7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x11,	%l4,	%i7
	edge8	%l6,	%o4,	%i3
	movcc	%xcc,	%g5,	%o3
	movn	%icc,	%l0,	%l2
	umul	%o5,	%i0,	%i2
	ta	%xcc,	0x0
	membar	0x01
	faligndata	%f22,	%f26,	%f8
	bge,pn	%xcc,	loop_527
	mova	%icc,	%l5,	%g3
	sra	%i5,	%o1,	%o0
	fmovdvc	%icc,	%f9,	%f2
loop_527:
	tge	%icc,	0x3
	tsubcctv	%g2,	%i6,	%g4
	sdivx	%o2,	0x1FB8,	%i1
	add	%l1,	%g7,	%i4
	fandnot1s	%f19,	%f8,	%f13
	sir	0x1BB9
	tle	%xcc,	0x4
	stbar
	fbg,a	%fcc2,	loop_528
	addcc	%g1,	0x01F0,	%o6
	xnor	%l3,	%g6,	%o7
	fmovrsgz	%i7,	%f31,	%f10
loop_528:
	movvs	%icc,	%l4,	%o4
	srax	%i3,	0x00,	%g5
	ta	%icc,	0x2
	add	%l6,	%l0,	%l2
	fbge,a	%fcc3,	loop_529
	fnand	%f4,	%f26,	%f30
	fmovse	%icc,	%f22,	%f24
	orncc	%o5,	%i0,	%i2
loop_529:
	tvs	%xcc,	0x6
	fbne	%fcc2,	loop_530
	ldx	[%l7 + 0x68],	%o3
	srl	%l5,	0x0C,	%g3
	fmovdvc	%icc,	%f24,	%f29
loop_530:
	udivx	%i5,	0x18AB,	%o0
	tvc	%xcc,	0x6
	tgu	%xcc,	0x5
	fcmple32	%f8,	%f16,	%g2
	brlz	%i6,	loop_531
	bgu	%icc,	loop_532
	tleu	%icc,	0x3
	or	%o1,	%g4,	%o2
loop_531:
	andcc	%i1,	%g7,	%i4
loop_532:
	fmovde	%icc,	%f26,	%f14
	orn	%g1,	0x0D8B,	%o6
	udivx	%l1,	0x025E,	%l3
	tcc	%xcc,	0x0
	andcc	%g6,	0x0CCF,	%i7
	sra	%l4,	%o4,	%o7
	std	%i2,	[%l7 + 0x50]
	smulcc	%g5,	%l0,	%l2
	ldstub	[%l7 + 0x55],	%l6
	tleu	%xcc,	0x4
	add	%o5,	0x126E,	%i2
	edge16n	%o3,	%l5,	%g3
	sllx	%i5,	%o0,	%i0
	umulcc	%g2,	%o1,	%g4
	bshuffle	%f26,	%f0,	%f0
	ldx	[%l7 + 0x70],	%o2
	tvs	%icc,	0x7
	set	0x4E, %g5
	stha	%i1,	[%l7 + %g5] 0xe2
	membar	#Sync
	addccc	%i6,	0x1D19,	%g7
	membar	0x02
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x21] %asi,	%g1
	fnot1	%f0,	%f12
	set	0x60, %i3
	prefetcha	[%l7 + %i3] 0x14,	 0x3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x1C] %asi,	%l1
	fmovrdgz	%l3,	%f24,	%f28
	nop
	setx	loop_533,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16ln	%g6,	%i7,	%l4
	set	0x78, %l3
	ldxa	[%l7 + %l3] 0x89,	%i4
loop_533:
	nop
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f0
	tvc	%xcc,	0x4
	set	0x44, %g3
	sta	%f13,	[%l7 + %g3] 0x11
	srl	%o4,	0x0A,	%o7
	movge	%xcc,	%i3,	%l0
	array16	%g5,	%l2,	%o5
	edge8	%i2,	%o3,	%l5
	lduh	[%l7 + 0x32],	%l6
	fnands	%f5,	%f24,	%f26
	bne,pn	%xcc,	loop_534
	fmovdgu	%xcc,	%f11,	%f29
	alignaddrl	%g3,	%o0,	%i5
	brlz	%g2,	loop_535
loop_534:
	fnot1	%f10,	%f6
	ldsb	[%l7 + 0x23],	%i0
	fmovsgu	%icc,	%f31,	%f20
loop_535:
	and	%o1,	0x14B7,	%o2
	wr	%g0,	0x19,	%asi
	sta	%f8,	[%l7 + 0x48] %asi
	taddcctv	%g4,	%i1,	%g7
	popc	%g1,	%o6
	fands	%f23,	%f7,	%f16
	edge8ln	%l1,	%l3,	%g6
	subcc	%i6,	0x1436,	%l4
	tgu	%icc,	0x3
	fornot1	%f18,	%f20,	%f28
	edge16l	%i4,	%o4,	%o7
	fmovsvs	%xcc,	%f10,	%f6
	tcs	%xcc,	0x0
	and	%i7,	0x1104,	%l0
	fcmped	%fcc3,	%f10,	%f22
	sllx	%i3,	0x03,	%l2
	fmovrsne	%o5,	%f15,	%f16
	fbule	%fcc1,	loop_536
	edge8l	%g5,	%o3,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge	%fcc0,	loop_537
loop_536:
	subc	%l6,	%i2,	%g3
	sdivcc	%o0,	0x1B9A,	%i5
	movcc	%xcc,	%i0,	%o1
loop_537:
	movne	%xcc,	%g2,	%o2
	movne	%icc,	%g4,	%i1
	wr	%g0,	0xea,	%asi
	stxa	%g7,	[%l7 + 0x38] %asi
	membar	#Sync
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%g1
	nop
	setx loop_538, %l0, %l1
	jmpl %l1, %o6
	sllx	%l1,	%l3,	%g6
	alignaddrl	%i6,	%l4,	%o4
	fmovscs	%icc,	%f30,	%f24
loop_538:
	membar	0x7F
	set	0x63, %o2
	lduba	[%l7 + %o2] 0x19,	%o7
	tgu	%icc,	0x1
	tge	%xcc,	0x2
	movrlz	%i4,	%l0,	%i7
	bgu,a,pt	%icc,	loop_539
	fnegd	%f16,	%f26
	tcs	%icc,	0x4
	xorcc	%l2,	%o5,	%i3
loop_539:
	movle	%icc,	%g5,	%l5
	movre	%l6,	0x232,	%i2
	edge16n	%o3,	%o0,	%i5
	ldsw	[%l7 + 0x48],	%i0
	edge32ln	%o1,	%g2,	%g3
	taddcc	%g4,	%o2,	%g7
	movrlez	%g1,	0x14F,	%o6
	fandnot2s	%f0,	%f14,	%f19
	sir	0x0A02
	sdiv	%l1,	0x0686,	%i1
	edge32	%g6,	%l3,	%i6
	lduw	[%l7 + 0x74],	%l4
	set	0x70, %o4
	ldda	[%l7 + %o4] 0xe2,	%o6
	fnegd	%f20,	%f22
	membar	0x06
	tle	%icc,	0x1
	fsrc1s	%f2,	%f30
	ldstub	[%l7 + 0x3E],	%o4
	mulx	%l0,	%i7,	%l2
	fmovrsne	%i4,	%f16,	%f17
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x7C] %asi,	%i3
	fbne	%fcc1,	loop_540
	fnegs	%f28,	%f28
	edge16n	%o5,	%g5,	%l6
	brlz	%l5,	loop_541
loop_540:
	tcc	%xcc,	0x0
	stb	%o3,	[%l7 + 0x27]
	fnegd	%f0,	%f28
loop_541:
	movcs	%xcc,	%i2,	%i5
	bgu,pn	%xcc,	loop_542
	ldstub	[%l7 + 0x24],	%i0
	array8	%o0,	%g2,	%o1
	fxors	%f31,	%f7,	%f28
loop_542:
	fmovdg	%xcc,	%f26,	%f31
	xorcc	%g4,	%g3,	%g7
	tleu	%icc,	0x3
	edge8l	%g1,	%o6,	%l1
	edge8n	%o2,	%g6,	%i1
	fmul8x16au	%f22,	%f28,	%f12
	array16	%i6,	%l4,	%o7
	stw	%l3,	[%l7 + 0x54]
	edge8l	%l0,	%o4,	%l2
	tvs	%xcc,	0x4
	fmovs	%f26,	%f22
	set	0x08, %i2
	ldswa	[%l7 + %i2] 0x19,	%i7
	movcc	%icc,	%i4,	%i3
	udiv	%o5,	0x03E9,	%l6
	edge32	%l5,	%o3,	%g5
	smulcc	%i5,	%i2,	%i0
	movcs	%icc,	%g2,	%o0
	movvs	%xcc,	%o1,	%g4
	xorcc	%g7,	%g1,	%o6
	xnor	%g3,	%l1,	%o2
	taddcc	%g6,	0x078D,	%i1
	tvc	%icc,	0x0
	movcc	%xcc,	%l4,	%i6
	movneg	%icc,	%o7,	%l0
	umul	%o4,	%l3,	%i7
	membar	0x22
	fmovrde	%l2,	%f6,	%f16
	sra	%i3,	%o5,	%l6
	udivx	%i4,	0x01D1,	%o3
	fandnot2	%f16,	%f12,	%f30
	umul	%l5,	%i5,	%i2
	sdiv	%g5,	0x12E3,	%i0
	sll	%g2,	%o1,	%o0
	ldsw	[%l7 + 0x70],	%g7
	edge8	%g4,	%g1,	%g3
	movleu	%xcc,	%l1,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f30,	%f6,	%f10
	ble	loop_543
	nop
	setx	loop_544,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdiv	%g6,	0x162C,	%o6
	umul	%l4,	%i6,	%o7
loop_543:
	bvc,a	%icc,	loop_545
loop_544:
	movvs	%icc,	%l0,	%o4
	movvc	%xcc,	%i1,	%i7
	popc	%l2,	%l3
loop_545:
	xnorcc	%o5,	0x1186,	%i3
	for	%f22,	%f0,	%f4
	fnot2s	%f27,	%f29
	ldd	[%l7 + 0x28],	%f12
	fpmerge	%f22,	%f5,	%f28
	umulcc	%i4,	%l6,	%o3
	edge16ln	%l5,	%i5,	%g5
	fpadd32s	%f31,	%f9,	%f15
	tneg	%icc,	0x3
	fble,a	%fcc2,	loop_546
	fnegd	%f22,	%f12
	addc	%i2,	0x14A3,	%i0
	movrgez	%g2,	%o1,	%g7
loop_546:
	sll	%o0,	%g1,	%g3
	nop
	set	0x26, %o6
	ldsb	[%l7 + %o6],	%l1
	sll	%g4,	0x17,	%g6
	alignaddrl	%o2,	%o6,	%l4
	ld	[%l7 + 0x44],	%f11
	movrne	%o7,	%l0,	%o4
	fmovrsgez	%i1,	%f29,	%f8
	movge	%xcc,	%i7,	%i6
	fmul8ulx16	%f22,	%f14,	%f18
	bne,a	%icc,	loop_547
	edge8l	%l2,	%l3,	%o5
	fmovsne	%icc,	%f20,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_547:
	te	%icc,	0x2
	swap	[%l7 + 0x1C],	%i4
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
	srax	%i3,	0x16,	%o3
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l6
loop_548:
	fmovsa	%xcc,	%f27,	%f3
	set	0x28, %i1
	stha	%l5,	[%l7 + %i1] 0x89
	edge16ln	%i5,	%i2,	%i0
	bl	%xcc,	loop_549
	fcmpd	%fcc3,	%f10,	%f8
	orn	%g5,	%g2,	%o1
	sir	0x1169
loop_549:
	fmovsvs	%xcc,	%f12,	%f25
	tvc	%xcc,	0x2
	movneg	%xcc,	%g7,	%g1
	smulcc	%g3,	%l1,	%o0
	fbne	%fcc2,	loop_550
	taddcc	%g6,	0x13C2,	%g4
	subcc	%o6,	0x1712,	%l4
	edge32l	%o2,	%o7,	%l0
loop_550:
	subcc	%i1,	%i7,	%o4
	fcmple32	%f8,	%f24,	%i6
	xor	%l2,	%l3,	%i4
	set	0x58, %l5
	prefetcha	[%l7 + %l5] 0x14,	 0x2
	fmul8sux16	%f8,	%f30,	%f20
	brnz	%o3,	loop_551
	fcmps	%fcc3,	%f24,	%f3
	fcmpgt16	%f24,	%f30,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_551:
	edge8	%l6,	%i5,	%l5
	fmovda	%icc,	%f7,	%f27
	umul	%i2,	%g5,	%g2
	addccc	%o1,	%g7,	%i0
	fblg,a	%fcc0,	loop_552
	edge32n	%g3,	%l1,	%g1
	xnor	%o0,	0x0271,	%g6
	movn	%xcc,	%g4,	%o6
loop_552:
	fbe	%fcc2,	loop_553
	tn	%xcc,	0x6
	mulscc	%l4,	%o7,	%o2
	ldstub	[%l7 + 0x0A],	%i1
loop_553:
	andcc	%l0,	%i7,	%o4
	ld	[%l7 + 0x18],	%f3
	udiv	%l2,	0x020E,	%l3
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x1A] %asi,	%i6
	array8	%o5,	%o3,	%i4
	fpack16	%f28,	%f27
	bne,a	%icc,	loop_554
	array16	%l6,	%i3,	%l5
	fmovrsne	%i5,	%f12,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_554:
	nop
	set	0x36, %l1
	ldsh	[%l7 + %l1],	%g5
	tsubcctv	%i2,	%o1,	%g7
	fbul,a	%fcc0,	loop_555
	addc	%g2,	0x0989,	%i0
	fmovrslz	%g3,	%f29,	%f1
	movne	%icc,	%l1,	%o0
loop_555:
	stw	%g1,	[%l7 + 0x58]
	sllx	%g6,	0x12,	%o6
	tsubcc	%l4,	%g4,	%o2
	andn	%i1,	%o7,	%i7
	fmul8x16al	%f27,	%f23,	%f10
	addccc	%o4,	%l2,	%l3
	umulcc	%l0,	%o5,	%i6
	movg	%xcc,	%i4,	%o3
	andn	%l6,	0x06C4,	%l5
	orn	%i3,	0x127F,	%g5
	bshuffle	%f20,	%f12,	%f12
	sra	%i2,	0x01,	%i5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%g2
	movvs	%xcc,	%i0,	%g3
	sethi	0x1D22,	%o1
	addcc	%l1,	0x08D4,	%o0
	bvc,pt	%xcc,	loop_556
	stx	%g6,	[%l7 + 0x30]
	bvc,a	%icc,	loop_557
	movrlez	%o6,	0x331,	%g1
loop_556:
	ldsh	[%l7 + 0x66],	%g4
	edge32l	%l4,	%o2,	%o7
loop_557:
	array32	%i7,	%o4,	%l2
	udivcc	%i1,	0x1B33,	%l0
	xnorcc	%o5,	0x13B6,	%i6
	fmovdpos	%icc,	%f4,	%f4
	movn	%xcc,	%l3,	%i4
	movvs	%icc,	%l6,	%o3
	fcmpgt32	%f2,	%f8,	%i3
	set	0x13, %o5
	lduba	[%l7 + %o5] 0x10,	%l5
	srax	%g5,	0x0A,	%i2
	lduw	[%l7 + 0x78],	%g7
	edge32l	%i5,	%g2,	%g3
	udivcc	%o1,	0x0F0D,	%i0
	sdiv	%l1,	0x13E3,	%g6
	movrlez	%o0,	%g1,	%g4
	fmovdpos	%xcc,	%f10,	%f27
	tneg	%xcc,	0x2
	bcs	%icc,	loop_558
	bvc,a,pn	%xcc,	loop_559
	movvc	%icc,	%l4,	%o6
	tne	%icc,	0x5
loop_558:
	array8	%o2,	%i7,	%o7
loop_559:
	tpos	%icc,	0x4
	taddcctv	%l2,	%o4,	%l0
	umul	%i1,	0x157E,	%i6
	fba	%fcc2,	loop_560
	edge8ln	%l3,	%i4,	%o5
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x20] %asi,	%f18
loop_560:
	movneg	%icc,	%l6,	%i3
	fblg,a	%fcc0,	loop_561
	fnor	%f30,	%f4,	%f16
	udivcc	%l5,	0x1BA5,	%g5
	srlx	%o3,	0x1D,	%g7
loop_561:
	fcmpeq16	%f4,	%f30,	%i2
	tleu	%icc,	0x0
	nop
	setx loop_562, %l0, %l1
	jmpl %l1, %g2
	nop
	setx loop_563, %l0, %l1
	jmpl %l1, %i5
	tvc	%icc,	0x5
	sll	%o1,	0x1C,	%g3
loop_562:
	brlz	%l1,	loop_564
loop_563:
	fmovsge	%icc,	%f22,	%f0
	fzeros	%f22
	fandnot1	%f6,	%f22,	%f12
loop_564:
	orn	%g6,	0x1822,	%o0
	fmovdcs	%xcc,	%f31,	%f25
	movrgez	%g1,	0x24D,	%g4
	tcc	%icc,	0x1
	fmovsne	%xcc,	%f23,	%f16
	addccc	%l4,	%o6,	%i0
	fmovdneg	%xcc,	%f9,	%f14
	ldstub	[%l7 + 0x7C],	%o2
	tge	%icc,	0x3
	bneg	loop_565
	brlez,a	%i7,	loop_566
	alignaddrl	%l2,	%o4,	%l0
	ldsw	[%l7 + 0x14],	%i1
loop_565:
	fmovdge	%xcc,	%f23,	%f4
loop_566:
	andcc	%i6,	0x133A,	%l3
	sdivx	%o7,	0x02A9,	%o5
	movge	%icc,	%l6,	%i4
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x58] %asi,	%f3
	bne,pt	%xcc,	loop_567
	fmovse	%icc,	%f7,	%f19
	sethi	0x1B3B,	%i3
	sdivx	%l5,	0x0204,	%o3
loop_567:
	fandnot1s	%f23,	%f4,	%f13
	edge8	%g5,	%i2,	%g7
	fbne,a	%fcc3,	loop_568
	edge32n	%g2,	%o1,	%i5
	tn	%icc,	0x4
	tvs	%icc,	0x7
loop_568:
	nop
	setx	loop_569,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%xcc,	0x5
	tn	%xcc,	0x4
	fabsd	%f6,	%f4
loop_569:
	movcc	%xcc,	%g3,	%g6
	edge32ln	%l1,	%g1,	%g4
	set	0x110, %o7
	ldxa	[%g0 + %o7] 0x52,	%l4
	tne	%xcc,	0x6
	fbg,a	%fcc3,	loop_570
	udivx	%o0,	0x1C6E,	%o6
	te	%icc,	0x2
	tvc	%icc,	0x4
loop_570:
	st	%f28,	[%l7 + 0x34]
	srl	%o2,	%i0,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f10,	%f26,	%l2
	movrgez	%l0,	%i1,	%o4
	edge8l	%i6,	%l3,	%o7
	andn	%o5,	0x0665,	%l6
	fpack32	%f10,	%f20,	%f16
	fnor	%f8,	%f20,	%f10
	tle	%icc,	0x3
	fand	%f20,	%f24,	%f28
	movn	%icc,	%i4,	%l5
	umul	%o3,	%i3,	%i2
	fandnot2	%f30,	%f12,	%f12
	movvs	%icc,	%g7,	%g5
	fors	%f20,	%f26,	%f7
	fbg,a	%fcc0,	loop_571
	taddcctv	%o1,	0x1071,	%i5
	movrlez	%g3,	%g6,	%l1
	movneg	%xcc,	%g1,	%g4
loop_571:
	fbe,a	%fcc2,	loop_572
	movge	%xcc,	%g2,	%o0
	fba,a	%fcc0,	loop_573
	bneg,a	%icc,	loop_574
loop_572:
	fmovrsne	%o6,	%f22,	%f22
	bvs,a	%icc,	loop_575
loop_573:
	fpsub16	%f12,	%f4,	%f20
loop_574:
	srl	%l4,	0x1A,	%i0
	fpackfix	%f12,	%f30
loop_575:
	lduh	[%l7 + 0x76],	%o2
	movne	%icc,	%i7,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%xcc,	%f3,	%f6
	fcmple16	%f12,	%f28,	%l2
	membar	0x39
	fbg	%fcc3,	loop_576
	ldsh	[%l7 + 0x40],	%i1
	fmovse	%xcc,	%f14,	%f2
	movleu	%icc,	%o4,	%i6
loop_576:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x42] %asi,	%o7
	fmovspos	%xcc,	%f24,	%f19
	taddcc	%l3,	0x1650,	%l6
	udivx	%i4,	0x1688,	%l5
	edge32l	%o3,	%o5,	%i2
	fbug	%fcc0,	loop_577
	fpmerge	%f21,	%f14,	%f28
	fmovrdgz	%g7,	%f18,	%f24
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x30] %asi,	%g5
loop_577:
	addccc	%o1,	0x1606,	%i3
	brz	%i5,	loop_578
	tle	%xcc,	0x2
	tvs	%xcc,	0x0
	orn	%g3,	%g6,	%g1
loop_578:
	addcc	%g4,	0x0558,	%g2
	fmovs	%f31,	%f27
	set	0x58, %o3
	stda	%l0,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	setx loop_579, %l0, %l1
	jmpl %l1, %o6
	smul	%l4,	0x15B6,	%o0
	siam	0x1
	fone	%f14
loop_579:
	edge8ln	%o2,	%i7,	%l0
	tvs	%xcc,	0x3
	subc	%i0,	%i1,	%o4
	sra	%i6,	%l2,	%o7
	tge	%icc,	0x3
	fcmps	%fcc1,	%f8,	%f21
	subc	%l6,	%l3,	%i4
	array8	%o3,	%o5,	%i2
	alignaddr	%g7,	%l5,	%g5
	subc	%o1,	%i5,	%g3
	edge16n	%i3,	%g6,	%g4
	movgu	%xcc,	%g2,	%g1
	fsrc2s	%f4,	%f12
	fand	%f20,	%f12,	%f10
	nop
	setx loop_580, %l0, %l1
	jmpl %l1, %o6
	tg	%icc,	0x7
	fbul	%fcc2,	loop_581
	movleu	%icc,	%l4,	%o0
loop_580:
	move	%icc,	%o2,	%i7
	xnorcc	%l1,	0x0353,	%i0
loop_581:
	fnot1s	%f24,	%f8
	fpsub32s	%f0,	%f24,	%f15
	brlz,a	%l0,	loop_582
	movrgz	%o4,	%i6,	%i1
	subccc	%l2,	0x0825,	%l6
	tl	%icc,	0x2
loop_582:
	alignaddrl	%o7,	%l3,	%o3
	orcc	%o5,	0x186E,	%i4
	tn	%icc,	0x0
	xnorcc	%g7,	0x1ACF,	%i2
	umul	%g5,	%l5,	%i5
	subc	%o1,	%g3,	%g6
	be	loop_583
	udivcc	%i3,	0x0DAE,	%g4
	flush	%l7 + 0x78
	nop
	setx	loop_584,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_583:
	tsubcctv	%g1,	0x0E30,	%g2
	fpadd32s	%f14,	%f11,	%f12
	fmovsn	%xcc,	%f8,	%f4
loop_584:
	mova	%icc,	%l4,	%o0
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%o2
	movrgez	%i7,	%o6,	%i0
	tcc	%xcc,	0x2
	alignaddrl	%l1,	%l0,	%i6
	taddcctv	%i1,	%o4,	%l6
	faligndata	%f26,	%f22,	%f16
	add	%o7,	%l2,	%l3
	srl	%o5,	0x00,	%o3
	bge	%icc,	loop_585
	movgu	%xcc,	%i4,	%g7
	fmovrsne	%g5,	%f17,	%f22
	fmovsleu	%xcc,	%f27,	%f13
loop_585:
	array32	%l5,	%i5,	%i2
	udivcc	%o1,	0x06BD,	%g6
	array16	%i3,	%g4,	%g1
	movne	%xcc,	%g2,	%g3
	fmovsvs	%icc,	%f23,	%f4
	sdiv	%l4,	0x0EA6,	%o2
	bvs,a,pn	%xcc,	loop_586
	edge16	%o0,	%o6,	%i7
	edge8	%i0,	%l1,	%i6
	movrgez	%l0,	%o4,	%l6
loop_586:
	sth	%i1,	[%l7 + 0x46]
	tneg	%icc,	0x4
	tne	%icc,	0x5
	movleu	%xcc,	%o7,	%l2
	nop
	setx loop_587, %l0, %l1
	jmpl %l1, %o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x0
	edge32n	%o3,	%i4,	%g7
loop_587:
	movleu	%xcc,	%l3,	%l5
	subc	%i5,	%g5,	%i2
	ldd	[%l7 + 0x08],	%f8
	add	%l7,	0x44,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%o1,	%i3
	xorcc	%g6,	%g1,	%g2
	mulx	%g4,	0x091C,	%l4
	movneg	%xcc,	%g3,	%o0
	sdivcc	%o6,	0x0AD0,	%o2
	udiv	%i0,	0x1DBF,	%i7
	fmovsvs	%icc,	%f26,	%f9
	edge32	%i6,	%l0,	%l1
	lduh	[%l7 + 0x3C],	%l6
	fpsub32	%f4,	%f8,	%f28
	fmul8x16al	%f11,	%f11,	%f14
	fxors	%f17,	%f31,	%f15
	fmovsgu	%xcc,	%f3,	%f14
	fandnot2s	%f2,	%f29,	%f10
	ta	%icc,	0x4
	tle	%xcc,	0x0
	fornot2s	%f1,	%f23,	%f10
	sub	%o4,	0x144E,	%o7
	subcc	%i1,	%l2,	%o5
	tgu	%icc,	0x1
	fmovrsgez	%o3,	%f0,	%f27
	tsubcctv	%g7,	%l3,	%l5
	fmovsneg	%xcc,	%f10,	%f20
	lduw	[%l7 + 0x40],	%i5
	movn	%icc,	%i4,	%i2
	bgu,a,pt	%icc,	loop_588
	ta	%xcc,	0x0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%g5
loop_588:
	popc	%i3,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g2,	0x06E6,	%g6
	fcmpne32	%f4,	%f8,	%l4
	subcc	%g3,	%o0,	%g4
	movcs	%xcc,	%o2,	%i0
	movrgez	%o6,	0x108,	%i6
	fmovs	%f3,	%f30
	fnot1s	%f26,	%f26
	ldub	[%l7 + 0x08],	%i7
	st	%f3,	[%l7 + 0x74]
	movvs	%xcc,	%l0,	%l1
	tleu	%icc,	0x2
	sra	%l6,	0x05,	%o7
	sdivcc	%i1,	0x18AF,	%o4
	brnz	%l2,	loop_589
	fbg	%fcc3,	loop_590
	nop
	setx loop_591, %l0, %l1
	jmpl %l1, %o5
	umul	%g7,	0x0581,	%l3
loop_589:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_590:
	fmovrdlez	%o3,	%f28,	%f20
loop_591:
	xor	%l5,	0x1419,	%i5
	stb	%i2,	[%l7 + 0x58]
	nop
	setx loop_592, %l0, %l1
	jmpl %l1, %i4
	edge32l	%o1,	%i3,	%g5
	fnot1	%f26,	%f6
	movrgz	%g1,	%g2,	%g6
loop_592:
	fcmple32	%f16,	%f22,	%g3
	nop
	setx	loop_593,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bpos,a	%icc,	loop_594
	fcmpne32	%f8,	%f6,	%l4
	nop
	setx	loop_595,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_593:
	fmovrdgez	%g4,	%f0,	%f4
loop_594:
	bcc,a	loop_596
	xnorcc	%o0,	%o2,	%o6
loop_595:
	xor	%i6,	%i0,	%i7
	fsrc1	%f22,	%f26
loop_596:
	fbule	%fcc0,	loop_597
	sll	%l1,	0x01,	%l6
	movneg	%icc,	%l0,	%i1
	set	0x50, %g6
	lduha	[%l7 + %g6] 0x19,	%o7
loop_597:
	movl	%xcc,	%l2,	%o4
	ba,pn	%icc,	loop_598
	bn,a,pn	%xcc,	loop_599
	tvc	%icc,	0x7
	fpmerge	%f31,	%f27,	%f4
loop_598:
	tle	%icc,	0x5
loop_599:
	brnz	%o5,	loop_600
	fbue	%fcc3,	loop_601
	fbne,a	%fcc1,	loop_602
	fmovdpos	%xcc,	%f14,	%f5
loop_600:
	movrne	%l3,	%g7,	%l5
loop_601:
	xor	%i5,	0x1996,	%o3
loop_602:
	sdivx	%i2,	0x0BF8,	%i4
	smulcc	%o1,	%g5,	%g1
	fmovsg	%xcc,	%f30,	%f17
	bne,pn	%icc,	loop_603
	stb	%i3,	[%l7 + 0x0D]
	movl	%xcc,	%g2,	%g6
	xnorcc	%g3,	%l4,	%g4
loop_603:
	andn	%o0,	0x0961,	%o6
	udivcc	%o2,	0x1325,	%i0
	tpos	%icc,	0x6
	movle	%xcc,	%i6,	%i7
	tle	%icc,	0x7
	move	%icc,	%l1,	%l0
	mulscc	%l6,	0x08B5,	%i1
	flush	%l7 + 0x40
	sdivx	%l2,	0x13BD,	%o7
	orcc	%o4,	0x1086,	%l3
	fmovdge	%icc,	%f25,	%f20
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%g7
	fbul,a	%fcc1,	loop_604
	xnor	%l5,	0x1032,	%i5
	te	%xcc,	0x5
	tle	%icc,	0x7
loop_604:
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%f14
	edge32n	%i2,	%i4,	%o3
	array16	%o1,	%g5,	%i3
	edge16l	%g2,	%g6,	%g1
	array8	%l4,	%g4,	%o0
	brnz,a	%g3,	loop_605
	fble,a	%fcc0,	loop_606
	fmovdle	%icc,	%f7,	%f11
	addc	%o6,	0x078A,	%o2
loop_605:
	std	%f6,	[%l7 + 0x20]
loop_606:
	fmovdl	%xcc,	%f16,	%f17
	fcmpne16	%f0,	%f0,	%i6
	movn	%xcc,	%i0,	%l1
	tcs	%xcc,	0x2
	array8	%i7,	%l6,	%i1
	ta	%icc,	0x0
	sllx	%l2,	%o7,	%l0
	movgu	%icc,	%o4,	%l3
	fbne	%fcc2,	loop_607
	or	%g7,	%l5,	%i5
	umulcc	%o5,	%i2,	%i4
	tvc	%icc,	0x0
loop_607:
	sdivcc	%o1,	0x0C43,	%g5
	edge16ln	%i3,	%g2,	%g6
	fmovrsgz	%o3,	%f15,	%f7
	te	%xcc,	0x3
	fcmpeq16	%f14,	%f26,	%g1
	movre	%g4,	%l4,	%g3
	sdivx	%o6,	0x0050,	%o0
	movrne	%o2,	0x025,	%i6
	movle	%xcc,	%l1,	%i0
	tleu	%icc,	0x6
	udivx	%i7,	0x0E3D,	%l6
	stb	%l2,	[%l7 + 0x15]
	edge16n	%o7,	%i1,	%l0
	movcc	%icc,	%l3,	%o4
	set	0x50, %i0
	stda	%l4,	[%l7 + %i0] 0xeb
	membar	#Sync
	call	loop_608
	orncc	%i5,	0x1F6F,	%o5
	sdivcc	%g7,	0x0B49,	%i2
	sethi	0x0C19,	%o1
loop_608:
	fmovdle	%icc,	%f18,	%f25
	subc	%g5,	0x1A75,	%i4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i3
	orn	%g6,	%g2,	%o3
	bcs,a,pt	%icc,	loop_609
	movle	%icc,	%g1,	%g4
	fmovsa	%icc,	%f4,	%f10
	tcc	%xcc,	0x3
loop_609:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x36] %asi,	%g3
	ldd	[%l7 + 0x50],	%f6
	popc	%o6,	%o0
	edge8n	%o2,	%i6,	%l4
	tcc	%xcc,	0x7
	array32	%i0,	%l1,	%l6
	addccc	%l2,	%i7,	%i1
	fcmpeq16	%f22,	%f22,	%l0
	bl,pn	%icc,	loop_610
	tvc	%icc,	0x7
	ldd	[%l7 + 0x30],	%o6
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x16,	%f0
loop_610:
	brgz	%o4,	loop_611
	brnz,a	%l5,	loop_612
	addc	%l3,	0x1391,	%i5
	addc	%o5,	0x1776,	%i2
loop_611:
	taddcctv	%o1,	%g7,	%g5
loop_612:
	tcs	%xcc,	0x6
	tl	%icc,	0x1
	set	0x0C, %i7
	ldswa	[%l7 + %i7] 0x81,	%i4
	movg	%xcc,	%g6,	%g2
	set	0x70, %o1
	swapa	[%l7 + %o1] 0x81,	%i3
	sir	0x05BD
	sub	%g1,	%g4,	%g3
	movneg	%xcc,	%o6,	%o3
	udivcc	%o2,	0x1517,	%o0
	bcs,a,pn	%icc,	loop_613
	bge,a,pn	%xcc,	loop_614
	movcc	%icc,	%i6,	%i0
	fbne,a	%fcc0,	loop_615
loop_613:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_614:
	fbl,a	%fcc2,	loop_616
	fbule	%fcc1,	loop_617
loop_615:
	std	%l4,	[%l7 + 0x70]
	edge32l	%l6,	%l1,	%i7
loop_616:
	tcc	%xcc,	0x6
loop_617:
	sll	%l2,	%i1,	%o7
	udiv	%o4,	0x0637,	%l0
	brlez	%l3,	loop_618
	tne	%icc,	0x7
	sll	%i5,	%o5,	%i2
	sethi	0x076D,	%l5
loop_618:
	orcc	%g7,	0x15F1,	%g5
	fmul8ulx16	%f2,	%f18,	%f2
	fmovsg	%xcc,	%f23,	%f26
	fmovdvc	%xcc,	%f4,	%f26
	tpos	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i4,	%g6,	%g2
	movrlez	%i3,	%g1,	%o1
	movrgz	%g4,	0x0D6,	%g3
	st	%f8,	[%l7 + 0x48]
	movcs	%icc,	%o6,	%o2
	sir	0x1A79
	sir	0x0179
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%i6
	popc	0x143F,	%i0
	fandnot1	%f10,	%f10,	%f14
	movrgez	%l4,	%o3,	%l1
	bg,pn	%xcc,	loop_619
	fbn,a	%fcc3,	loop_620
	tleu	%icc,	0x4
	set	0x68, %l2
	stda	%i6,	[%l7 + %l2] 0x18
loop_619:
	ble,a	loop_621
loop_620:
	ta	%xcc,	0x1
	bneg,a	loop_622
	alignaddrl	%i7,	%l2,	%i1
loop_621:
	fandnot2	%f30,	%f26,	%f6
	srlx	%o4,	%l0,	%l3
loop_622:
	fbn	%fcc1,	loop_623
	edge16l	%i5,	%o7,	%i2
	brlez,a	%l5,	loop_624
	movvs	%icc,	%o5,	%g5
loop_623:
	edge32	%g7,	%i4,	%g6
	ldsh	[%l7 + 0x22],	%i3
loop_624:
	mulscc	%g2,	0x0283,	%g1
	brlez,a	%o1,	loop_625
	fsrc2s	%f23,	%f7
	edge16	%g3,	%o6,	%g4
	taddcctv	%o0,	0x0E0F,	%o2
loop_625:
	movrlz	%i0,	%l4,	%i6
	fnot2s	%f14,	%f30
	sdivcc	%l1,	0x0B75,	%o3
	tle	%icc,	0x5
	fmovsg	%xcc,	%f11,	%f5
	srlx	%i7,	0x16,	%l2
	mulx	%i1,	0x12F1,	%l6
	brnz,a	%o4,	loop_626
	fpsub32s	%f7,	%f21,	%f3
	fmovrslez	%l3,	%f28,	%f15
	bneg,pn	%icc,	loop_627
loop_626:
	fmovdcs	%icc,	%f21,	%f18
	nop
	set	0x56, %l0
	lduh	[%l7 + %l0],	%l0
	tleu	%xcc,	0x7
loop_627:
	nop
	set	0x64, %l6
	ldswa	[%l7 + %l6] 0x14,	%i5
	xnorcc	%o7,	0x1F1A,	%i2
	fornot1s	%f5,	%f20,	%f30
	add	%l5,	%g5,	%o5
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x15
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i4
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovscc	%xcc,	%f31,	%f26
	fmovsvs	%xcc,	%f20,	%f23
	edge32ln	%g7,	%i3,	%g2
	set	0x4C, %g4
	lduwa	[%l7 + %g4] 0x14,	%g6
	edge16l	%g1,	%o1,	%g3
	fpack32	%f4,	%f4,	%f28
	subcc	%g4,	%o0,	%o2
	edge16l	%i0,	%o6,	%l4
	movn	%icc,	%l1,	%o3
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x7F] %asi,	%i7
	edge32l	%i6,	%l2,	%i1
	fmovdvs	%icc,	%f29,	%f8
	sdiv	%o4,	0x119C,	%l3
	membar	0x34
	set	0x08, %g2
	ldswa	[%l7 + %g2] 0x19,	%l6
	tle	%xcc,	0x4
	swap	[%l7 + 0x50],	%i5
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
	brgz	%i2,	loop_628
	nop
	setx loop_629, %l0, %l1
	jmpl %l1, %o7
	fble	%fcc2,	loop_630
	orn	%g5,	0x16C7,	%l5
loop_628:
	orn	%o5,	%g7,	%i4
loop_629:
	fpadd16	%f6,	%f14,	%f10
loop_630:
	fba,a	%fcc1,	loop_631
	taddcctv	%g2,	%g6,	%i3
	flush	%l7 + 0x7C
	fcmps	%fcc3,	%f2,	%f16
loop_631:
	fcmpne16	%f0,	%f10,	%g1
	faligndata	%f4,	%f24,	%f22
	mulx	%g3,	0x1F18,	%g4
	edge8l	%o1,	%o0,	%i0
	umul	%o2,	%o6,	%l4
	movvs	%icc,	%l1,	%i7
	srax	%i6,	0x05,	%l2
	fnegs	%f25,	%f26
	fmovrdlez	%i1,	%f28,	%f22
	wr	%g0,	0x89,	%asi
	stda	%o2,	[%l7 + 0x18] %asi
	swap	[%l7 + 0x7C],	%o4
	edge32n	%l3,	%i5,	%l0
	faligndata	%f24,	%f2,	%f18
	stb	%l6,	[%l7 + 0x49]
	movvs	%icc,	%i2,	%g5
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x20] %asi,	%o7
	edge16n	%l5,	%g7,	%o5
	fbn,a	%fcc1,	loop_632
	fmovdgu	%xcc,	%f27,	%f4
	tsubcc	%g2,	%g6,	%i4
	tsubcctv	%g1,	%g3,	%i3
loop_632:
	std	%f16,	[%l7 + 0x28]
	edge32n	%o1,	%o0,	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%o2
	udiv	%l4,	0x0D6F,	%l1
	fpmerge	%f9,	%f19,	%f30
	mulscc	%o6,	%i7,	%i6
	fbn,a	%fcc1,	loop_633
	srl	%l2,	%o3,	%i1
	add	%o4,	0x1C28,	%l3
	ldsh	[%l7 + 0x70],	%i5
loop_633:
	fpackfix	%f28,	%f5
	bneg,pt	%icc,	loop_634
	movcs	%icc,	%l0,	%i2
	movpos	%xcc,	%l6,	%o7
	wr	%g0,	0x89,	%asi
	stwa	%l5,	[%l7 + 0x34] %asi
loop_634:
	xnorcc	%g7,	%o5,	%g2
	fnegs	%f10,	%f26
	addcc	%g5,	%g6,	%g1
	edge32l	%g3,	%i4,	%i3
	nop
	set	0x10, %i4
	prefetch	[%l7 + %i4],	 0x1
	addc	%o0,	0x054F,	%o1
	tvc	%xcc,	0x1
	fbge,a	%fcc3,	loop_635
	array32	%i0,	%o2,	%l4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%l1
loop_635:
	movgu	%xcc,	%g4,	%o6
	tgu	%xcc,	0x3
	umulcc	%i7,	0x1908,	%i6
	popc	%o3,	%l2
	edge8	%i1,	%l3,	%i5
	xnorcc	%l0,	0x08C4,	%i2
	fpackfix	%f6,	%f12
	movne	%xcc,	%l6,	%o4
	movrgez	%l5,	0x13C,	%o7
	bshuffle	%f0,	%f8,	%f12
	bneg,a	%icc,	loop_636
	fbl	%fcc3,	loop_637
	nop
	setx	loop_638,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdgu	%icc,	%f30,	%f30
loop_636:
	fmuld8ulx16	%f29,	%f0,	%f30
loop_637:
	srax	%o5,	0x04,	%g7
loop_638:
	lduh	[%l7 + 0x50],	%g2
	tsubcctv	%g5,	%g1,	%g6
	subcc	%i4,	0x1603,	%g3
	fmovrdlz	%o0,	%f18,	%f12
	edge32	%o1,	%i0,	%i3
	alignaddrl	%l4,	%l1,	%o2
	fpsub32s	%f1,	%f8,	%f8
	xorcc	%g4,	0x18B2,	%i7
	fornot1	%f22,	%f26,	%f28
	fmovsle	%xcc,	%f20,	%f25
	fmovsa	%xcc,	%f1,	%f31
	bvc,a,pt	%icc,	loop_639
	tsubcctv	%i6,	%o3,	%o6
	fbge,a	%fcc2,	loop_640
	taddcc	%l2,	0x1128,	%i1
loop_639:
	fmovsge	%icc,	%f29,	%f29
	fcmped	%fcc0,	%f26,	%f2
loop_640:
	fabsd	%f30,	%f2
	fpsub32	%f22,	%f30,	%f4
	andn	%l3,	%l0,	%i5
	tsubcctv	%i2,	%l6,	%l5
	set	0x58, %i5
	ldswa	[%l7 + %i5] 0x89,	%o7
	mulx	%o4,	0x0377,	%o5
	fpadd32s	%f8,	%f15,	%f27
	edge8n	%g2,	%g7,	%g5
	movvs	%xcc,	%g6,	%i4
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x58] %asi,	%f29
	mulx	%g3,	%o0,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc1,	loop_641
	tsubcctv	%i0,	0x0655,	%i3
	tsubcc	%o1,	0x00B4,	%l1
	add	%l4,	0x090C,	%o2
loop_641:
	sub	%i7,	%g4,	%o3
	orncc	%o6,	%l2,	%i1
	fnor	%f16,	%f8,	%f6
	ldstub	[%l7 + 0x2E],	%i6
	tneg	%icc,	0x5
	bleu,a	loop_642
	fcmpeq16	%f26,	%f28,	%l3
	taddcc	%l0,	%i5,	%l6
	edge16ln	%i2,	%l5,	%o4
loop_642:
	sllx	%o7,	0x0C,	%g2
	fmovdn	%icc,	%f26,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc2,	loop_643
	fpmerge	%f15,	%f7,	%f24
	fands	%f30,	%f3,	%f1
	sethi	0x07B4,	%g7
loop_643:
	movrne	%o5,	0x0D1,	%g5
	tsubcctv	%g6,	%i4,	%o0
	stw	%g1,	[%l7 + 0x18]
	movge	%icc,	%i0,	%i3
	fexpand	%f9,	%f4
	fmovdge	%xcc,	%f12,	%f7
	xorcc	%o1,	%g3,	%l4
	movvs	%xcc,	%o2,	%l1
	set	0x38, %g5
	stha	%i7,	[%l7 + %g5] 0xea
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x6
	movge	%icc,	%o3,	%o6
	addccc	%g4,	%i1,	%i6
	movrlz	%l2,	%l0,	%l3
	bleu,a	%xcc,	loop_644
	fbe,a	%fcc0,	loop_645
	edge32l	%l6,	%i2,	%l5
	movge	%xcc,	%i5,	%o7
loop_644:
	alignaddrl	%g2,	%g7,	%o5
loop_645:
	movl	%xcc,	%g5,	%o4
	popc	%i4,	%g6
	set	0x14, %i6
	sta	%f28,	[%l7 + %i6] 0x81
	fbn,a	%fcc0,	loop_646
	fbue,a	%fcc2,	loop_647
	fpadd16	%f0,	%f0,	%f8
	fnot2	%f16,	%f28
loop_646:
	fmovdcs	%xcc,	%f7,	%f10
loop_647:
	tge	%icc,	0x5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x7C] %asi,	%f15
	brlz,a	%o0,	loop_648
	sdivcc	%g1,	0x0434,	%i3
	orcc	%o1,	0x006C,	%g3
	sra	%l4,	%i0,	%o2
loop_648:
	ba,a,pt	%xcc,	loop_649
	std	%l0,	[%l7 + 0x60]
	nop
	set	0x34, %i3
	prefetch	[%l7 + %i3],	 0x1
	fxor	%f8,	%f24,	%f6
loop_649:
	movl	%icc,	%i7,	%o6
	subcc	%g4,	%o3,	%i6
	bgu,a,pn	%xcc,	loop_650
	fpack32	%f8,	%f10,	%f12
	fzero	%f20
	set	0x30, %l3
	stwa	%l2,	[%l7 + %l3] 0x2a
	membar	#Sync
loop_650:
	std	%i0,	[%l7 + 0x70]
	add	%l0,	%l3,	%i2
	mova	%xcc,	%l5,	%l6
	ld	[%l7 + 0x44],	%f8
	sdivcc	%o7,	0x1A48,	%i5
	brlz	%g2,	loop_651
	alignaddrl	%o5,	%g7,	%o4
	andn	%i4,	0x1A4D,	%g6
	xor	%g5,	%g1,	%i3
loop_651:
	xor	%o0,	0x1FB0,	%o1
	tcs	%xcc,	0x0
	fpadd32	%f0,	%f2,	%f22
	tneg	%xcc,	0x5
	alignaddrl	%l4,	%i0,	%g3
	membar	0x6C
	smulcc	%l1,	%o2,	%o6
	udivx	%i7,	0x08DB,	%o3
	smul	%i6,	%l2,	%i1
	tcs	%xcc,	0x3
	array16	%l0,	%l3,	%i2
	fands	%f5,	%f3,	%f17
	fnot1	%f6,	%f2
	fmovrdgz	%g4,	%f6,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l5,	0x14BF,	%l6
	bvs,a,pn	%xcc,	loop_652
	smulcc	%o7,	%i5,	%g2
	tleu	%xcc,	0x0
	brnz,a	%g7,	loop_653
loop_652:
	array32	%o5,	%i4,	%g6
	addcc	%o4,	0x115C,	%g5
	umul	%i3,	%o0,	%o1
loop_653:
	fmovde	%icc,	%f15,	%f7
	andn	%g1,	0x08CA,	%l4
	orcc	%g3,	%i0,	%o2
	subc	%o6,	0x0650,	%l1
	fpack32	%f20,	%f0,	%f24
	edge8ln	%i7,	%i6,	%o3
	fsrc1s	%f26,	%f5
	alignaddr	%i1,	%l2,	%l3
	fbn	%fcc1,	loop_654
	tg	%icc,	0x7
	sdivx	%l0,	0x1FE9,	%i2
	alignaddr	%l5,	%l6,	%o7
loop_654:
	movn	%xcc,	%g4,	%g2
	andncc	%g7,	%o5,	%i5
	mulx	%i4,	%o4,	%g5
	edge8l	%g6,	%i3,	%o1
	movgu	%icc,	%g1,	%l4
	andcc	%o0,	%i0,	%o2
	fmovscc	%xcc,	%f27,	%f8
	edge8l	%o6,	%g3,	%i7
	subccc	%i6,	%o3,	%l1
	andncc	%l2,	%l3,	%l0
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%i2
	ba	loop_655
	movrgz	%l5,	%i1,	%o7
	nop
	set	0x10, %g1
	ldub	[%l7 + %g1],	%l6
	std	%f30,	[%l7 + 0x68]
loop_655:
	tcc	%xcc,	0x4
	ldsh	[%l7 + 0x62],	%g4
	taddcc	%g2,	%g7,	%i5
	sir	0x0016
	and	%o5,	%o4,	%g5
	bcc	%icc,	loop_656
	movrne	%i4,	%g6,	%i3
	or	%g1,	0x0661,	%o1
	fmovdvs	%icc,	%f5,	%f0
loop_656:
	fmuld8ulx16	%f20,	%f5,	%f6
	andncc	%o0,	%i0,	%o2
	fmovsleu	%xcc,	%f9,	%f1
	swap	[%l7 + 0x58],	%l4
	movcc	%icc,	%o6,	%g3
	brgez	%i7,	loop_657
	movpos	%icc,	%i6,	%o3
	movgu	%xcc,	%l2,	%l1
	movrlez	%l3,	%l0,	%l5
loop_657:
	fmovrdgz	%i1,	%f28,	%f24
	fexpand	%f8,	%f20
	fornot1s	%f3,	%f17,	%f11
	ldstub	[%l7 + 0x4D],	%o7
	edge16	%i2,	%l6,	%g2
	fpackfix	%f6,	%f0
	tneg	%xcc,	0x5
	movrlez	%g4,	%i5,	%o5
	movne	%xcc,	%o4,	%g7
	srl	%i4,	0x13,	%g6
	subcc	%g5,	%g1,	%i3
	fmovscc	%xcc,	%f28,	%f19
	fmovdcc	%icc,	%f6,	%f20
	fzero	%f28
	lduw	[%l7 + 0x74],	%o1
	orn	%i0,	0x07BD,	%o2
	addcc	%o0,	%l4,	%o6
	wr	%g0,	0x18,	%asi
	stha	%g3,	[%l7 + 0x46] %asi
	popc	%i7,	%o3
	sll	%l2,	%l1,	%l3
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x11,	%f0
	movneg	%icc,	%l0,	%i6
	ldub	[%l7 + 0x35],	%i1
	brgez,a	%o7,	loop_658
	st	%f29,	[%l7 + 0x78]
	bneg,a,pn	%icc,	loop_659
	edge32n	%i2,	%l6,	%l5
loop_658:
	taddcctv	%g4,	0x0290,	%g2
	fmovdpos	%icc,	%f18,	%f28
loop_659:
	and	%i5,	%o5,	%g7
	fmovdcs	%icc,	%f12,	%f14
	fmovdcc	%xcc,	%f29,	%f10
	wr	%g0,	0x80,	%asi
	sta	%f14,	[%l7 + 0x48] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,a	%icc,	loop_660
	fmovsl	%xcc,	%f12,	%f8
	set	0x50, %o2
	prefetcha	[%l7 + %o2] 0x0c,	 0x0
loop_660:
	movneg	%icc,	%g6,	%g5
	flush	%l7 + 0x50
	fbul,a	%fcc3,	loop_661
	fmovrde	%g1,	%f24,	%f18
	fmovrde	%o4,	%f8,	%f30
	bleu,pt	%icc,	loop_662
loop_661:
	tvs	%icc,	0x4
	fpadd16s	%f18,	%f9,	%f2
	sth	%o1,	[%l7 + 0x7A]
loop_662:
	fmovsneg	%icc,	%f8,	%f19
	smulcc	%i0,	%i3,	%o0
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x70] %asi,	%o2
	fornot1s	%f31,	%f7,	%f25
	tge	%icc,	0x4
	te	%xcc,	0x5
	movrgz	%l4,	%o6,	%i7
	tle	%icc,	0x2
	udiv	%g3,	0x1052,	%o3
	nop
	set	0x18, %i2
	ldstub	[%l7 + %i2],	%l1
	bn	loop_663
	array8	%l3,	%l0,	%i6
	fblg	%fcc0,	loop_664
	tne	%icc,	0x1
loop_663:
	bvs,a,pn	%xcc,	loop_665
	movn	%xcc,	%i1,	%o7
loop_664:
	fmovrsgez	%i2,	%f29,	%f28
	fmovde	%icc,	%f8,	%f24
loop_665:
	fmovdneg	%xcc,	%f0,	%f19
	membar	0x2B
	fpsub32s	%f26,	%f2,	%f11
	fmovrdgez	%l2,	%f0,	%f14
	fabsd	%f16,	%f8
	subc	%l5,	%g4,	%l6
	fmul8x16au	%f6,	%f14,	%f22
	movn	%xcc,	%i5,	%o5
	nop
	set	0x14, %o6
	ldsh	[%l7 + %o6],	%g2
	addcc	%g7,	0x0ADF,	%g6
	prefetch	[%l7 + 0x10],	 0x3
	sth	%g5,	[%l7 + 0x4E]
	sir	0x0F64
	ldx	[%l7 + 0x20],	%g1
	fand	%f26,	%f28,	%f6
	and	%i4,	%o1,	%o4
	fmovrsne	%i0,	%f27,	%f4
	addcc	%i3,	0x09D1,	%o2
	ldd	[%l7 + 0x30],	%o0
	andncc	%l4,	%o6,	%i7
	udiv	%g3,	0x1388,	%o3
	move	%xcc,	%l1,	%l0
	ldsw	[%l7 + 0x58],	%i6
	fmovrdlez	%i1,	%f14,	%f28
	movrgz	%o7,	%i2,	%l3
	fmovrde	%l5,	%f30,	%f28
	xnorcc	%l2,	%g4,	%l6
	fbue,a	%fcc0,	loop_666
	tleu	%xcc,	0x4
	brgz,a	%i5,	loop_667
	fmovdcs	%xcc,	%f12,	%f26
loop_666:
	tsubcctv	%g2,	0x19C6,	%g7
	sdivx	%o5,	0x0DCC,	%g6
loop_667:
	movrgez	%g5,	0x30E,	%g1
	fmul8sux16	%f20,	%f24,	%f6
	alignaddrl	%i4,	%o1,	%i0
	edge16	%i3,	%o2,	%o4
	fcmpgt16	%f4,	%f0,	%l4
	tneg	%icc,	0x3
	movrlez	%o0,	0x06B,	%i7
	wr	%g0,	0xe2,	%asi
	stha	%g3,	[%l7 + 0x0E] %asi
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0459,	%o3
	ldstub	[%l7 + 0x31],	%l1
	edge16ln	%l0,	%o6,	%i1
	fmovdgu	%icc,	%f8,	%f28
	set	0x70, %o4
	stxa	%o7,	[%l7 + %o4] 0x19
	fmovsvs	%xcc,	%f10,	%f25
	subc	%i2,	%i6,	%l5
	sir	0x19FB
	mulx	%l2,	%g4,	%l6
	te	%icc,	0x3
	fmovdvc	%icc,	%f7,	%f31
	bshuffle	%f2,	%f0,	%f0
	mova	%icc,	%l3,	%g2
	sdiv	%g7,	0x157C,	%o5
	xnorcc	%g6,	0x01F3,	%i5
	fmovrse	%g5,	%f29,	%f0
	bg,a,pt	%icc,	loop_668
	sra	%g1,	%o1,	%i0
	set	0x4A, %l5
	lduba	[%l7 + %l5] 0x88,	%i3
loop_668:
	tsubcctv	%o2,	%o4,	%i4
	sllx	%o0,	0x00,	%l4
	edge16	%g3,	%o3,	%l1
	brlz	%i7,	loop_669
	membar	0x14
	edge32l	%l0,	%o6,	%i1
	fcmpgt32	%f30,	%f26,	%o7
loop_669:
	edge32n	%i6,	%i2,	%l5
	fpsub16	%f12,	%f28,	%f22
	edge8	%l2,	%l6,	%l3
	bneg,pn	%icc,	loop_670
	alignaddrl	%g2,	%g4,	%o5
	fmovsg	%xcc,	%f5,	%f5
	edge16	%g7,	%g6,	%g5
loop_670:
	fmovrse	%i5,	%f25,	%f6
	edge8l	%g1,	%o1,	%i0
	tsubcctv	%o2,	%i3,	%i4
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	mulx	%o4,	%l4,	%g3
	mulscc	%o0,	0x1569,	%o3
	fble	%fcc3,	loop_671
	tvs	%xcc,	0x6
	xnor	%l1,	%l0,	%i7
	membar	0x71
loop_671:
	umulcc	%i1,	%o7,	%i6
	fpack32	%f16,	%f2,	%f0
	array8	%i2,	%o6,	%l2
	membar	0x6A
	fornot1	%f0,	%f26,	%f24
	te	%xcc,	0x5
	add	%l6,	%l3,	%g2
	fbge	%fcc3,	loop_672
	tvs	%icc,	0x0
	movre	%g4,	%l5,	%o5
	xnorcc	%g6,	0x1179,	%g5
loop_672:
	ldub	[%l7 + 0x29],	%i5
	tsubcctv	%g7,	0x084C,	%o1
	movge	%xcc,	%i0,	%o2
	edge32n	%g1,	%i3,	%i4
	ta	%icc,	0x4
	edge16l	%l4,	%g3,	%o4
	edge16l	%o3,	%o0,	%l1
	movvs	%xcc,	%i7,	%i1
	sdivx	%o7,	0x0C86,	%l0
	ldsw	[%l7 + 0x78],	%i2
	addcc	%i6,	%l2,	%o6
	bvs,a,pt	%icc,	loop_673
	fmovscs	%xcc,	%f0,	%f29
	fmovrsgz	%l3,	%f11,	%f12
	movcs	%icc,	%l6,	%g2
loop_673:
	edge8ln	%l5,	%g4,	%o5
	fmovs	%f29,	%f14
	or	%g5,	%g6,	%g7
	xorcc	%i5,	0x185E,	%i0
	fble	%fcc1,	loop_674
	mulx	%o2,	%g1,	%o1
	udiv	%i4,	0x0843,	%i3
	set	0x7C, %i1
	ldswa	[%l7 + %i1] 0x80,	%l4
loop_674:
	sllx	%g3,	%o3,	%o4
	fcmple16	%f4,	%f8,	%o0
	brnz	%l1,	loop_675
	fmovs	%f18,	%f3
	fbne,a	%fcc0,	loop_676
	move	%icc,	%i1,	%o7
loop_675:
	sdivx	%i7,	0x0D3D,	%l0
	bcc,pt	%icc,	loop_677
loop_676:
	edge32n	%i2,	%l2,	%o6
	ldsh	[%l7 + 0x0C],	%l3
	movne	%icc,	%i6,	%g2
loop_677:
	movg	%icc,	%l6,	%l5
	fcmpeq16	%f10,	%f4,	%o5
	ldsh	[%l7 + 0x7E],	%g4
	set	0x36, %l1
	stha	%g5,	[%l7 + %l1] 0x04
	tl	%icc,	0x7
	fmovdn	%icc,	%f29,	%f10
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x30] %asi,	%g7
	array32	%i5,	%g6,	%o2
	srl	%i0,	%o1,	%g1
	fmovspos	%xcc,	%f12,	%f17
	umul	%i3,	%i4,	%l4
	mulscc	%o3,	%o4,	%g3
	tne	%icc,	0x4
	fble,a	%fcc2,	loop_678
	andn	%l1,	%i1,	%o0
	movg	%icc,	%i7,	%o7
	addc	%l0,	0x1D8F,	%l2
loop_678:
	orn	%i2,	%l3,	%i6
	fandnot2	%f8,	%f14,	%f22
	ldd	[%l7 + 0x18],	%f0
	tn	%xcc,	0x5
	fxor	%f10,	%f26,	%f0
	lduw	[%l7 + 0x2C],	%o6
	fbu	%fcc2,	loop_679
	movrlez	%l6,	0x343,	%l5
	udivcc	%g2,	0x098A,	%g4
	prefetch	[%l7 + 0x4C],	 0x3
loop_679:
	fmovs	%f28,	%f6
	edge16l	%o5,	%g5,	%i5
	tsubcc	%g7,	%g6,	%i0
	movrgz	%o1,	0x285,	%g1
	for	%f12,	%f2,	%f8
	fcmple16	%f14,	%f8,	%o2
	stbar
	mulscc	%i3,	%l4,	%i4
	nop
	setx loop_680, %l0, %l1
	jmpl %l1, %o4
	srlx	%o3,	0x01,	%l1
	fmovdvc	%icc,	%f28,	%f17
	fmovrdgez	%g3,	%f16,	%f28
loop_680:
	flush	%l7 + 0x14
	xnorcc	%o0,	%i1,	%i7
	swap	[%l7 + 0x10],	%l0
	smul	%l2,	0x0DB2,	%o7
	add	%i2,	%i6,	%o6
	mulscc	%l3,	0x043A,	%l6
	edge16	%l5,	%g2,	%o5
	brgez	%g5,	loop_681
	edge32	%g4,	%i5,	%g6
	tleu	%icc,	0x7
	movneg	%xcc,	%g7,	%i0
loop_681:
	membar	0x5C
	bleu,pt	%xcc,	loop_682
	subcc	%g1,	%o2,	%i3
	fcmpne16	%f26,	%f20,	%l4
	sdiv	%o1,	0x12DF,	%i4
loop_682:
	tvc	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug	%fcc1,	loop_683
	movleu	%xcc,	%o4,	%l1
	prefetch	[%l7 + 0x38],	 0x3
	edge32ln	%o3,	%o0,	%i1
loop_683:
	brgz,a	%g3,	loop_684
	edge8n	%i7,	%l0,	%o7
	fmovrde	%l2,	%f18,	%f8
	fmovrdne	%i2,	%f18,	%f2
loop_684:
	movpos	%icc,	%i6,	%l3
	ba	loop_685
	fmul8x16au	%f31,	%f10,	%f20
	edge16	%l6,	%o6,	%g2
	fxor	%f24,	%f12,	%f22
loop_685:
	movgu	%xcc,	%o5,	%g5
	tle	%xcc,	0x7
	brgez,a	%g4,	loop_686
	movcc	%xcc,	%i5,	%g6
	mulscc	%l5,	%g7,	%g1
	brnz,a	%i0,	loop_687
loop_686:
	orncc	%o2,	0x0159,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%xcc,	%f28,	%f16
loop_687:
	ldstub	[%l7 + 0x3A],	%o1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%o4
	bvc,a	loop_688
	fcmpne32	%f28,	%f2,	%i4
	fbn	%fcc1,	loop_689
	taddcc	%l1,	0x016F,	%o0
loop_688:
	fmovrslez	%i1,	%f2,	%f24
	fcmpd	%fcc2,	%f8,	%f22
loop_689:
	ldub	[%l7 + 0x5B],	%o3
	edge8	%i7,	%g3,	%l0
	movrlez	%o7,	0x1DA,	%i2
	fsrc2s	%f8,	%f29
	edge16n	%i6,	%l2,	%l6
	fmovdneg	%xcc,	%f22,	%f4
	fpsub16s	%f21,	%f28,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%l3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x13] %asi,	%g2
	ldsh	[%l7 + 0x24],	%o5
	edge16l	%g5,	%g4,	%i5
	wr	%g0,	0x11,	%asi
	sta	%f27,	[%l7 + 0x54] %asi
	edge32	%l5,	%g7,	%g1
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x6A] %asi,	%i0
	fmovrdlz	%g6,	%f4,	%f30
	fbug	%fcc2,	loop_690
	fnot2s	%f6,	%f19
	movrlz	%o2,	%l4,	%i3
	fmovdl	%icc,	%f26,	%f14
loop_690:
	nop
	setx loop_691, %l0, %l1
	jmpl %l1, %o1
	bvc	loop_692
	umulcc	%i4,	0x0D31,	%l1
	fcmpd	%fcc1,	%f16,	%f8
loop_691:
	fblg	%fcc0,	loop_693
loop_692:
	andncc	%o4,	%i1,	%o3
	move	%icc,	%i7,	%g3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%o0
loop_693:
	subccc	%o7,	0x0598,	%l0
	fmovdcs	%xcc,	%f26,	%f19
	edge8n	%i6,	%l2,	%l6
	sdivcc	%i2,	0x1F81,	%o6
	orn	%g2,	%o5,	%l3
	fmovrdlz	%g4,	%f12,	%f8
	movn	%xcc,	%g5,	%l5
	tgu	%icc,	0x2
	fmovdn	%icc,	%f17,	%f31
	subcc	%g7,	0x0600,	%i5
	stbar
	bne,pn	%icc,	loop_694
	andncc	%i0,	%g6,	%o2
	nop
	setx	loop_695,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot1	%f16,	%f22,	%f24
loop_694:
	fbul,a	%fcc2,	loop_696
	fmovdge	%icc,	%f30,	%f4
loop_695:
	ldub	[%l7 + 0x34],	%g1
	stw	%i3,	[%l7 + 0x6C]
loop_696:
	tpos	%icc,	0x2
	taddcc	%o1,	0x1D0A,	%l4
	xnor	%l1,	%o4,	%i4
	set	0x20, %o5
	lduwa	[%l7 + %o5] 0x15,	%i1
	fmovdneg	%icc,	%f18,	%f15
	movl	%xcc,	%o3,	%g3
	sll	%i7,	%o7,	%o0
	taddcc	%i6,	0x06DF,	%l0
	fmovrdne	%l2,	%f8,	%f8
	srax	%l6,	0x0B,	%o6
	bg,a	%icc,	loop_697
	fzeros	%f5
	movcc	%xcc,	%i2,	%g2
	fcmple32	%f26,	%f2,	%o5
loop_697:
	andcc	%g4,	%g5,	%l5
	fba,a	%fcc3,	loop_698
	membar	0x1C
	andcc	%l3,	%g7,	%i0
	orn	%g6,	%o2,	%i5
loop_698:
	edge32ln	%i3,	%g1,	%l4
	srax	%l1,	%o4,	%o1
	ld	[%l7 + 0x7C],	%f14
	tg	%icc,	0x5
	fabsd	%f24,	%f22
	bge,a	loop_699
	edge16ln	%i4,	%o3,	%i1
	xor	%g3,	%i7,	%o0
	addccc	%o7,	%l0,	%l2
loop_699:
	fxnors	%f23,	%f5,	%f18
	fmovsleu	%xcc,	%f3,	%f11
	sdiv	%i6,	0x170A,	%l6
	xnor	%i2,	0x1CFB,	%g2
	tl	%icc,	0x1
	movrlez	%o5,	0x36A,	%o6
	pdist	%f8,	%f8,	%f6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%g4,	%g5
	udivcc	%l5,	0x076D,	%l3
	bn,a,pt	%icc,	loop_700
	tleu	%xcc,	0x4
	array16	%g7,	%i0,	%g6
	brnz	%i5,	loop_701
loop_700:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o2,	[%l7 + 0x1C]
	srlx	%g1,	0x11,	%i3
loop_701:
	fmovdgu	%icc,	%f2,	%f5
	edge8n	%l4,	%o4,	%l1
	addccc	%o1,	%o3,	%i4
	movrgez	%g3,	0x1DE,	%i1
	array16	%i7,	%o7,	%l0
	for	%f8,	%f8,	%f4
	nop
	set	0x58, %o3
	std	%o0,	[%l7 + %o3]
	movvs	%icc,	%l2,	%i6
	edge32ln	%l6,	%g2,	%o5
	fmovrdlez	%o6,	%f28,	%f12
	movleu	%xcc,	%g4,	%i2
	movvs	%icc,	%l5,	%l3
	tgu	%icc,	0x6
	udivx	%g5,	0x0934,	%i0
	movrne	%g6,	%i5,	%g7
	fbul,a	%fcc0,	loop_702
	tvs	%icc,	0x0
	fcmple32	%f6,	%f10,	%g1
	xnor	%o2,	0x0EEC,	%i3
loop_702:
	tneg	%xcc,	0x7
	movvc	%xcc,	%o4,	%l1
	bn,pn	%xcc,	loop_703
	sra	%l4,	%o1,	%i4
	fmovsvs	%icc,	%f13,	%f27
	brnz	%g3,	loop_704
loop_703:
	fmovsvs	%icc,	%f22,	%f2
	nop
	set	0x30, %o7
	stx	%i1,	[%l7 + %o7]
	fmovd	%f20,	%f4
loop_704:
	ld	[%l7 + 0x38],	%f0
	fbge	%fcc1,	loop_705
	tg	%icc,	0x0
	umulcc	%o3,	0x05DF,	%o7
	fsrc1s	%f31,	%f7
loop_705:
	nop
	wr	%g0,	0x10,	%asi
	stda	%l0,	[%l7 + 0x48] %asi
	sll	%i7,	%o0,	%l2
	tcs	%xcc,	0x3
	fsrc2	%f30,	%f2
	movrgz	%i6,	%g2,	%o5
	movne	%xcc,	%o6,	%g4
	movne	%xcc,	%l6,	%l5
	udivcc	%i2,	0x0A59,	%l3
	stbar
	fabsd	%f20,	%f14
	fbge,a	%fcc2,	loop_706
	addc	%i0,	0x110A,	%g6
	xorcc	%g5,	%g7,	%i5
	fmovsge	%icc,	%f7,	%f9
loop_706:
	andcc	%g1,	0x0211,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o2,	0x13EC,	%l1
	set	0x40, %g6
	prefetcha	[%l7 + %g6] 0x04,	 0x0
	umul	%l4,	0x18C5,	%i4
	tle	%xcc,	0x7
	movvs	%icc,	%o1,	%g3
	movne	%icc,	%o3,	%o7
	fmovdcc	%xcc,	%f8,	%f15
	movrgz	%l0,	%i1,	%o0
	fcmpne16	%f2,	%f16,	%l2
	edge8ln	%i7,	%g2,	%o5
	fmuld8sux16	%f9,	%f19,	%f6
	udivx	%o6,	0x0CC0,	%i6
	fcmpne32	%f6,	%f30,	%g4
	fpack32	%f10,	%f20,	%f4
	subccc	%l6,	%i2,	%l3
	edge8	%i0,	%g6,	%g5
	smulcc	%l5,	0x189A,	%i5
	st	%f15,	[%l7 + 0x54]
	fbne,a	%fcc2,	loop_707
	and	%g7,	0x0238,	%g1
	movrlz	%o2,	%i3,	%o4
	movge	%xcc,	%l1,	%l4
loop_707:
	tge	%xcc,	0x0
	nop
	setx loop_708, %l0, %l1
	jmpl %l1, %i4
	addc	%g3,	%o3,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l0,	%i1,	%o0
loop_708:
	tcs	%xcc,	0x2
	fcmpes	%fcc3,	%f30,	%f7
	fmovdl	%xcc,	%f7,	%f1
	xnor	%o7,	%l2,	%g2
	andn	%i7,	0x1146,	%o5
	orncc	%o6,	%g4,	%l6
	tn	%xcc,	0x3
	tg	%icc,	0x1
	umul	%i2,	0x0681,	%l3
	tsubcctv	%i6,	%g6,	%g5
	edge32ln	%l5,	%i5,	%i0
	bleu,a,pn	%icc,	loop_709
	fcmpne16	%f30,	%f30,	%g1
	bne	%xcc,	loop_710
	movrgez	%g7,	0x1B1,	%o2
loop_709:
	tpos	%xcc,	0x4
	fxors	%f3,	%f12,	%f10
loop_710:
	edge8	%o4,	%i3,	%l1
	taddcctv	%i4,	%g3,	%l4
	sdivcc	%o1,	0x058D,	%o3
	fmovsne	%icc,	%f29,	%f30
	tvs	%xcc,	0x7
	fba,a	%fcc3,	loop_711
	srl	%i1,	%o0,	%o7
	movrgez	%l2,	0x31A,	%l0
	mova	%xcc,	%g2,	%i7
loop_711:
	movleu	%icc,	%o5,	%g4
	fcmpeq16	%f26,	%f20,	%l6
	tle	%icc,	0x3
	tcs	%icc,	0x2
	fmovdvs	%icc,	%f6,	%f0
	movle	%xcc,	%i2,	%o6
	subc	%i6,	%g6,	%g5
	orncc	%l3,	%l5,	%i0
	movrlez	%g1,	%i5,	%o2
	movg	%icc,	%g7,	%i3
	movvc	%xcc,	%o4,	%l1
	tcs	%icc,	0x1
	tg	%xcc,	0x4
	tsubcc	%g3,	%i4,	%o1
	srl	%o3,	%i1,	%l4
	fcmpd	%fcc3,	%f30,	%f4
	fors	%f1,	%f5,	%f10
	fbn,a	%fcc0,	loop_712
	bneg	loop_713
	fandnot2	%f16,	%f2,	%f22
	ta	%xcc,	0x3
loop_712:
	and	%o0,	0x09C8,	%l2
loop_713:
	movrne	%l0,	0x2DC,	%o7
	set	0x78, %i0
	swapa	[%l7 + %i0] 0x80,	%i7
	set	0x30, %g7
	sta	%f15,	[%l7 + %g7] 0x18
	movrne	%g2,	%g4,	%o5
	fbg	%fcc2,	loop_714
	edge16n	%l6,	%i2,	%i6
	tvs	%xcc,	0x3
	sra	%o6,	0x0E,	%g5
loop_714:
	bne	loop_715
	membar	0x6A
	array32	%g6,	%l3,	%i0
	umul	%l5,	%i5,	%o2
loop_715:
	edge16l	%g1,	%g7,	%i3
	swap	[%l7 + 0x34],	%l1
	movvc	%xcc,	%g3,	%i4
	tcs	%icc,	0x4
	movleu	%xcc,	%o4,	%o1
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x14,	%f16
	tg	%icc,	0x4
	fmovdl	%xcc,	%f15,	%f9
	srlx	%i1,	%l4,	%o0
	fcmpgt16	%f18,	%f6,	%o3
	tsubcctv	%l0,	%l2,	%i7
	sllx	%o7,	%g2,	%g4
	edge32ln	%l6,	%o5,	%i2
	fblg,a	%fcc2,	loop_716
	fcmple16	%f0,	%f30,	%o6
	tne	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_716:
	tsubcctv	%i6,	%g5,	%l3
	stb	%i0,	[%l7 + 0x2F]
	movl	%xcc,	%g6,	%i5
	sra	%l5,	%o2,	%g1
	umul	%i3,	%g7,	%g3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x10] %asi,	%i4
	std	%f24,	[%l7 + 0x78]
	tpos	%xcc,	0x3
	popc	%o4,	%o1
	bcc,pn	%icc,	loop_717
	movl	%icc,	%l1,	%l4
	edge32n	%o0,	%o3,	%l0
	fornot1	%f8,	%f6,	%f24
loop_717:
	tvs	%xcc,	0x4
	subcc	%l2,	0x13D1,	%i1
	taddcctv	%o7,	0x0DB8,	%i7
	tle	%icc,	0x2
	fbule,a	%fcc2,	loop_718
	bgu	loop_719
	tgu	%icc,	0x1
	fpadd16s	%f30,	%f5,	%f20
loop_718:
	fbue	%fcc2,	loop_720
loop_719:
	fbge,a	%fcc0,	loop_721
	tleu	%icc,	0x4
	edge16ln	%g4,	%l6,	%g2
loop_720:
	sdivcc	%i2,	0x1396,	%o6
loop_721:
	fmul8sux16	%f10,	%f30,	%f22
	stb	%i6,	[%l7 + 0x59]
	tpos	%icc,	0x3
	array16	%g5,	%l3,	%o5
	fcmpne16	%f0,	%f8,	%i0
	fpsub16	%f26,	%f14,	%f12
	set	0x30, %o1
	ldda	[%l7 + %o1] 0xe3,	%g6
	tn	%xcc,	0x0
	movpos	%xcc,	%l5,	%o2
	std	%f6,	[%l7 + 0x08]
	set	0x3A, %l2
	lduba	[%l7 + %l2] 0x18,	%i5
	xorcc	%g1,	0x191F,	%i3
	membar	0x1A
	fcmped	%fcc3,	%f18,	%f4
	subcc	%g7,	%i4,	%o4
	brgez,a	%o1,	loop_722
	fmul8ulx16	%f30,	%f4,	%f0
	bne,a,pn	%icc,	loop_723
	bn,a,pt	%icc,	loop_724
loop_722:
	fmovdne	%icc,	%f18,	%f30
	array32	%g3,	%l1,	%l4
loop_723:
	ldd	[%l7 + 0x28],	%o2
loop_724:
	nop
	set	0x7C, %o0
	ldswa	[%l7 + %o0] 0x10,	%o0
	add	%l2,	%i1,	%o7
	movne	%xcc,	%i7,	%l0
	tg	%icc,	0x3
	xor	%l6,	0x0E7D,	%g2
	edge8	%i2,	%g4,	%o6
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	bgu,pt	%xcc,	loop_725
	fcmple16	%f10,	%f30,	%l3
	srl	%i6,	%o5,	%g6
	mulscc	%l5,	0x15D3,	%o2
loop_725:
	movg	%xcc,	%i5,	%g1
	bleu	loop_726
	fbn	%fcc0,	loop_727
	and	%i3,	%i0,	%g7
	srax	%i4,	0x0F,	%o4
loop_726:
	ba	%xcc,	loop_728
loop_727:
	xor	%o1,	0x0761,	%l1
	set	0x70, %l6
	stxa	%l4,	[%l7 + %l6] 0xea
	membar	#Sync
loop_728:
	edge8n	%g3,	%o3,	%o0
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x20] %asi,	%i0
	te	%xcc,	0x7
	std	%l2,	[%l7 + 0x50]
	fbue,a	%fcc3,	loop_729
	movrlz	%i7,	%l0,	%l6
	fmovdleu	%icc,	%f19,	%f30
	bleu,pn	%icc,	loop_730
loop_729:
	taddcctv	%o7,	%i2,	%g2
	fbu,a	%fcc0,	loop_731
	fmovscc	%xcc,	%f8,	%f19
loop_730:
	orncc	%g4,	%g5,	%o6
	ldsw	[%l7 + 0x40],	%i6
loop_731:
	fbe	%fcc0,	loop_732
	add	%o5,	%g6,	%l5
	movcc	%icc,	%l3,	%i5
	edge16l	%o2,	%i3,	%g1
loop_732:
	tpos	%xcc,	0x2
	tneg	%xcc,	0x4
	addc	%i0,	0x1BB6,	%g7
	edge32l	%o4,	%i4,	%o1
	smul	%l4,	%l1,	%g3
	tl	%xcc,	0x5
	andncc	%o0,	%o3,	%l2
	movle	%xcc,	%i7,	%l0
	tpos	%icc,	0x6
	udivx	%l6,	0x1244,	%i1
	edge32l	%i2,	%o7,	%g4
	fcmpne32	%f0,	%f12,	%g5
	fpadd16	%f12,	%f10,	%f14
	ble,pt	%xcc,	loop_733
	movrgez	%g2,	0x3DE,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg,a	%fcc2,	loop_734
loop_733:
	movrne	%o5,	0x16C,	%g6
	srl	%l5,	0x10,	%l3
	sll	%i5,	%o6,	%o2
loop_734:
	sll	%g1,	0x1F,	%i0
	smul	%g7,	0x0FE8,	%i3
	udivx	%i4,	0x133A,	%o1
	sir	0x1D9A
	umulcc	%o4,	0x1BD3,	%l1
	sethi	0x0F11,	%g3
	orncc	%o0,	0x012E,	%o3
	movre	%l4,	%l2,	%i7
	sll	%l0,	0x0F,	%i1
	subccc	%l6,	0x1BE0,	%i2
	edge32	%g4,	%o7,	%g2
	ldd	[%l7 + 0x20],	%f16
	pdist	%f18,	%f6,	%f2
	fpackfix	%f22,	%f30
	alignaddr	%i6,	%o5,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g6,	0x0B,	%l3
	movre	%l5,	0x09E,	%i5
	fmovdcs	%xcc,	%f6,	%f13
	flush	%l7 + 0x54
	edge8	%o6,	%o2,	%i0
	edge16l	%g1,	%g7,	%i4
	movrne	%i3,	%o4,	%l1
	or	%g3,	0x1872,	%o0
	movrgz	%o1,	0x3DF,	%o3
	array8	%l2,	%l4,	%l0
	fcmpne32	%f0,	%f30,	%i1
	tle	%xcc,	0x3
	fpsub32	%f14,	%f0,	%f28
	fbo	%fcc0,	loop_735
	fnot1s	%f23,	%f27
	udiv	%l6,	0x1B13,	%i2
	sra	%g4,	%i7,	%g2
loop_735:
	fmovscs	%xcc,	%f3,	%f2
	movpos	%icc,	%o7,	%o5
	orncc	%g5,	0x0921,	%g6
	tneg	%icc,	0x1
	ldsw	[%l7 + 0x54],	%i6
	bl	loop_736
	fpadd16s	%f26,	%f18,	%f28
	fpadd32s	%f23,	%f25,	%f18
	fmovrdlz	%l3,	%f12,	%f4
loop_736:
	brgez	%i5,	loop_737
	fmovrsgz	%o6,	%f1,	%f18
	srl	%l5,	0x05,	%o2
	tpos	%icc,	0x1
loop_737:
	subccc	%i0,	0x1D03,	%g7
	fmovrslz	%i4,	%f5,	%f21
	set	0x48, %l4
	stda	%i2,	[%l7 + %l4] 0x2a
	membar	#Sync
	movn	%icc,	%o4,	%g1
	fsrc1s	%f21,	%f0
	ta	%xcc,	0x2
	array32	%g3,	%l1,	%o0
	fba,a	%fcc3,	loop_738
	sdivcc	%o3,	0x0D40,	%l2
	movvs	%xcc,	%l4,	%l0
	fpadd16	%f14,	%f26,	%f10
loop_738:
	movrgz	%i1,	%l6,	%o1
	fnot1	%f28,	%f10
	fbug	%fcc0,	loop_739
	fsrc2	%f16,	%f12
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_739:
	alignaddr	%g4,	%i2,	%i7
	st	%f7,	[%l7 + 0x78]
	sub	%o7,	0x1CCF,	%g2
	or	%g5,	0x1ADE,	%o5
	andncc	%g6,	%l3,	%i5
	ldsw	[%l7 + 0x68],	%i6
	alignaddr	%l5,	%o6,	%o2
	fbge,a	%fcc2,	loop_740
	mulx	%g7,	%i0,	%i4
	stb	%o4,	[%l7 + 0x5B]
	set	0x38, %l0
	stda	%i2,	[%l7 + %l0] 0x23
	membar	#Sync
loop_740:
	movne	%xcc,	%g1,	%l1
	stbar
	tle	%xcc,	0x0
	tvc	%icc,	0x6
	fmovdcc	%icc,	%f12,	%f16
	set	0x4C, %g2
	sta	%f16,	[%l7 + %g2] 0x15
	array8	%o0,	%o3,	%g3
	xor	%l4,	0x0885,	%l0
	std	%i0,	[%l7 + 0x48]
	sub	%l2,	0x1374,	%l6
	te	%icc,	0x4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%g4
	sdivx	%i2,	0x06ED,	%i7
	andn	%o1,	0x146C,	%g2
	fba,a	%fcc0,	loop_741
	lduh	[%l7 + 0x7E],	%g5
	popc	%o7,	%g6
	set	0x08, %g4
	ldxa	[%l7 + %g4] 0x80,	%o5
loop_741:
	fbue	%fcc1,	loop_742
	movvs	%icc,	%i5,	%i6
	fbl	%fcc1,	loop_743
	tleu	%xcc,	0x5
loop_742:
	ldsb	[%l7 + 0x39],	%l5
	std	%f22,	[%l7 + 0x40]
loop_743:
	addccc	%l3,	%o6,	%o2
	movn	%icc,	%i0,	%i4
	movcs	%icc,	%g7,	%i3
	bcc,a,pt	%xcc,	loop_744
	mulx	%g1,	%o4,	%l1
	sir	0x096F
	movrgz	%o0,	%g3,	%l4
loop_744:
	nop
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	srax	%o3,	%l0,	%i1
	bcs,a,pt	%xcc,	loop_745
	movrgz	%l2,	%l6,	%i2
	movvs	%icc,	%i7,	%o1
	fblg,a	%fcc2,	loop_746
loop_745:
	movge	%xcc,	%g4,	%g5
	movge	%xcc,	%g2,	%g6
	edge32l	%o7,	%i5,	%o5
loop_746:
	fmovrsgez	%i6,	%f19,	%f29
	subccc	%l5,	0x0D5C,	%l3
	sethi	0x12D5,	%o2
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge16l	%o6,	%i4,	%i0
	sdivx	%i3,	0x054F,	%g1
	fsrc1	%f4,	%f30
	movg	%xcc,	%g7,	%o4
	movg	%icc,	%l1,	%g3
	movrgz	%o0,	%o3,	%l4
	sdiv	%l0,	0x08C9,	%l2
	alignaddr	%i1,	%l6,	%i7
	bn	%icc,	loop_747
	srax	%i2,	%g4,	%g5
	tcc	%icc,	0x6
	sub	%o1,	0x17C6,	%g2
loop_747:
	fabsd	%f0,	%f20
	alignaddrl	%g6,	%o7,	%o5
	udivcc	%i6,	0x1D08,	%l5
	bcs,pn	%icc,	loop_748
	andn	%i5,	%o2,	%l3
	te	%icc,	0x0
	set	0x7A, %i5
	stha	%i4,	[%l7 + %i5] 0x81
loop_748:
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%i0
	movg	%icc,	%i3,	%g1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%o4
	andncc	%o6,	%l1,	%o0
	movle	%icc,	%g3,	%o3
	movg	%xcc,	%l0,	%l4
	fpadd16s	%f9,	%f29,	%f19
	edge8l	%i1,	%l6,	%i7
	fnand	%f10,	%f2,	%f20
	fmovrdne	%l2,	%f26,	%f10
	alignaddrl	%i2,	%g4,	%g5
	taddcc	%o1,	%g2,	%o7
	fmovda	%icc,	%f19,	%f19
	edge8n	%g6,	%o5,	%i6
	movn	%icc,	%l5,	%i5
	movne	%xcc,	%l3,	%o2
	bcc	loop_749
	mova	%icc,	%i4,	%i3
	movgu	%icc,	%i0,	%g1
	fmovdpos	%icc,	%f17,	%f26
loop_749:
	orn	%o4,	%o6,	%l1
	fmovs	%f10,	%f29
	edge16n	%g7,	%g3,	%o0
	sethi	0x1B51,	%l0
	xnorcc	%o3,	%i1,	%l6
	ldsw	[%l7 + 0x7C],	%l4
	movrlz	%i7,	0x2D1,	%l2
	tgu	%xcc,	0x3
	bneg	loop_750
	fmovrdne	%i2,	%f2,	%f28
	taddcctv	%g5,	%o1,	%g4
	tneg	%xcc,	0x3
loop_750:
	array32	%o7,	%g6,	%g2
	mova	%xcc,	%i6,	%l5
	tsubcc	%o5,	%i5,	%l3
	sub	%i4,	0x1D44,	%o2
	brnz,a	%i3,	loop_751
	ldx	[%l7 + 0x50],	%g1
	fors	%f22,	%f28,	%f13
	addccc	%o4,	0x116A,	%i0
loop_751:
	for	%f16,	%f24,	%f12
	subccc	%o6,	%l1,	%g7
	bleu	loop_752
	move	%icc,	%g3,	%o0
	subccc	%o3,	%l0,	%l6
	subc	%l4,	0x1D50,	%i1
loop_752:
	nop
	wr	%g0,	0x27,	%asi
	stha	%i7,	[%l7 + 0x46] %asi
	membar	#Sync
	umul	%i2,	%g5,	%o1
	srlx	%l2,	0x0B,	%g4
	movn	%xcc,	%o7,	%g6
	fandnot1	%f22,	%f2,	%f14
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbue	%fcc0,	loop_753
	movcs	%xcc,	%i6,	%l5
	tneg	%icc,	0x0
	set	0x08, %i4
	prefetcha	[%l7 + %i4] 0x14,	 0x2
loop_753:
	stbar
	smulcc	%g2,	0x0F4A,	%l3
	fnand	%f22,	%f22,	%f12
	tge	%xcc,	0x6
	fmovdvc	%xcc,	%f6,	%f31
	edge8	%i5,	%i4,	%o2
	sdivx	%g1,	0x0B48,	%i3
	smulcc	%i0,	0x13C7,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f22,	[%l7 + 0x10]
	movg	%xcc,	%o6,	%g7
	flush	%l7 + 0x70
	subccc	%l1,	0x0B9B,	%o0
	edge8n	%o3,	%l0,	%g3
	orn	%l4,	%i1,	%i7
	edge32	%l6,	%i2,	%o1
	xnor	%l2,	0x102D,	%g5
	addccc	%g4,	0x1ED7,	%g6
	tge	%xcc,	0x4
	movn	%icc,	%i6,	%o7
	srax	%l5,	%g2,	%l3
	movcc	%icc,	%o5,	%i4
	mova	%icc,	%o2,	%i5
	movrne	%i3,	0x12D,	%g1
	set	0x7C, %i3
	swapa	[%l7 + %i3] 0x10,	%o4
	fnegd	%f12,	%f10
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
	set	0x24, %i6
	swapa	[%l7 + %i6] 0x0c,	%i0
	xnor	%g7,	0x12C2,	%o0
	bg,a	%xcc,	loop_754
	swap	[%l7 + 0x34],	%o3
	mulx	%l1,	%g3,	%l0
	movrlz	%i1,	0x2A4,	%l4
loop_754:
	movl	%icc,	%i7,	%l6
	tcc	%xcc,	0x3
	bge,pt	%icc,	loop_755
	tsubcc	%i2,	%l2,	%g5
	fornot2s	%f16,	%f14,	%f3
	addc	%o1,	0x194F,	%g4
loop_755:
	subc	%i6,	%g6,	%l5
	sth	%g2,	[%l7 + 0x5A]
	be,a	%xcc,	loop_756
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x39],	%o7
	fmovdcc	%xcc,	%f17,	%f17
loop_756:
	addcc	%l3,	%o5,	%o2
	taddcc	%i5,	%i4,	%g1
	set	0x7C, %l3
	ldswa	[%l7 + %l3] 0x88,	%i3
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	te	%xcc,	0x2
	subc	%o6,	0x1C22,	%o4
	subcc	%g7,	%i0,	%o3
	be,pt	%icc,	loop_757
	bn	%icc,	loop_758
	fmovscs	%icc,	%f18,	%f28
	subccc	%l1,	%o0,	%l0
loop_757:
	sllx	%g3,	0x08,	%l4
loop_758:
	movvs	%xcc,	%i7,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu	%xcc,	loop_759
	srl	%i2,	%l2,	%i1
	tvs	%xcc,	0x3
	set	0x10, %g3
	lduwa	[%l7 + %g3] 0x04,	%g5
loop_759:
	fabsd	%f26,	%f20
	movcs	%icc,	%g4,	%i6
	tcc	%icc,	0x7
	tle	%xcc,	0x1
	fzero	%f26
	fmovscs	%icc,	%f5,	%f7
	fbn,a	%fcc3,	loop_760
	ldd	[%l7 + 0x70],	%f30
	fbue,a	%fcc0,	loop_761
	fornot2s	%f6,	%f23,	%f19
loop_760:
	add	%g6,	%o1,	%l5
	movleu	%icc,	%o7,	%g2
loop_761:
	fbg,a	%fcc1,	loop_762
	fmovscs	%xcc,	%f5,	%f20
	movcc	%xcc,	%o5,	%o2
	fpsub32s	%f29,	%f3,	%f29
loop_762:
	mulscc	%i5,	%i4,	%l3
	movre	%i3,	%g1,	%o4
	fblg,a	%fcc3,	loop_763
	be,a	loop_764
	subc	%g7,	%o6,	%i0
	fxnor	%f10,	%f28,	%f28
loop_763:
	te	%icc,	0x6
loop_764:
	bge,pt	%xcc,	loop_765
	edge8n	%l1,	%o3,	%o0
	sethi	0x0C94,	%l0
	set	0x48, %o2
	stha	%l4,	[%l7 + %o2] 0x88
loop_765:
	edge32ln	%g3,	%l6,	%i2
	sdivx	%i7,	0x180D,	%i1
	fors	%f5,	%f0,	%f19
	bvc,pn	%icc,	loop_766
	udivcc	%l2,	0x16DD,	%g4
	edge32ln	%i6,	%g5,	%g6
	movcs	%xcc,	%o1,	%l5
loop_766:
	bcc	%xcc,	loop_767
	stb	%g2,	[%l7 + 0x2A]
	set	0x4E, %i2
	lduha	[%l7 + %i2] 0x0c,	%o5
loop_767:
	fmovdcc	%icc,	%f19,	%f28
	pdist	%f30,	%f14,	%f16
	edge8l	%o7,	%o2,	%i4
	tvs	%xcc,	0x7
	andn	%l3,	%i5,	%g1
	array16	%o4,	%g7,	%i3
	sth	%o6,	[%l7 + 0x26]
	orcc	%l1,	%o3,	%o0
	movle	%xcc,	%i0,	%l0
	taddcctv	%g3,	0x1EC3,	%l6
	fandnot1	%f14,	%f8,	%f30
	umul	%l4,	0x082B,	%i2
	sir	0x10F1
	move	%icc,	%i7,	%l2
	fandnot1s	%f26,	%f10,	%f26
	movrne	%i1,	%g4,	%g5
	fmovdl	%icc,	%f15,	%f28
	fcmpeq32	%f18,	%f6,	%g6
	tle	%xcc,	0x4
	fexpand	%f30,	%f24
	tcs	%xcc,	0x3
	addc	%o1,	0x0C6C,	%i6
	fnegs	%f15,	%f22
	movre	%l5,	%o5,	%g2
	fmovda	%icc,	%f13,	%f26
	nop
	set	0x4F, %o6
	ldsb	[%l7 + %o6],	%o2
	movre	%o7,	%l3,	%i4
	fbo	%fcc0,	loop_768
	sra	%i5,	%g1,	%o4
	tpos	%xcc,	0x1
	nop
	set	0x38, %g1
	ldsb	[%l7 + %g1],	%i3
loop_768:
	ld	[%l7 + 0x18],	%f26
	udivx	%g7,	0x1899,	%l1
	ld	[%l7 + 0x50],	%f6
	edge16l	%o3,	%o6,	%i0
	movrgz	%o0,	0x29D,	%l0
	set	0x6D, %o4
	ldsba	[%l7 + %o4] 0x19,	%l6
	bvc,pn	%xcc,	loop_769
	subccc	%g3,	%l4,	%i7
	popc	0x0423,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_769:
	bgu,a	%icc,	loop_770
	srlx	%i1,	0x04,	%g4
	orncc	%g5,	0x0B13,	%g6
	move	%icc,	%o1,	%l2
loop_770:
	fmul8x16al	%f11,	%f16,	%f12
	fmovs	%f21,	%f16
	flush	%l7 + 0x34
	fcmpgt16	%f26,	%f12,	%i6
	ldsh	[%l7 + 0x62],	%o5
	movre	%l5,	%g2,	%o2
	tg	%icc,	0x6
	fcmpgt16	%f12,	%f2,	%l3
	fexpand	%f23,	%f30
	sethi	0x0DB8,	%o7
	fbge	%fcc0,	loop_771
	fmovrdlez	%i4,	%f18,	%f0
	prefetch	[%l7 + 0x18],	 0x2
	edge16n	%i5,	%g1,	%o4
loop_771:
	edge16ln	%g7,	%i3,	%l1
	brgz	%o6,	loop_772
	udivcc	%o3,	0x0BA8,	%o0
	movleu	%icc,	%l0,	%l6
	addc	%i0,	0x0A6A,	%l4
loop_772:
	array32	%i7,	%i2,	%i1
	movneg	%icc,	%g4,	%g3
	brz	%g6,	loop_773
	movn	%icc,	%o1,	%l2
	fsrc1s	%f23,	%f9
	taddcc	%i6,	0x18E9,	%g5
loop_773:
	smul	%o5,	%l5,	%o2
	tcs	%icc,	0x1
	movcc	%icc,	%g2,	%o7
	fbue	%fcc2,	loop_774
	fpadd32s	%f23,	%f6,	%f28
	movl	%icc,	%i4,	%l3
	fmovsl	%icc,	%f12,	%f7
loop_774:
	fmovrslez	%i5,	%f5,	%f3
	bleu,a	%icc,	loop_775
	fmovrdne	%g1,	%f8,	%f10
	nop
	setx	loop_776,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	st	%f0,	[%l7 + 0x2C]
loop_775:
	tneg	%icc,	0x1
	fnot1	%f24,	%f4
loop_776:
	movcs	%xcc,	%o4,	%i3
	for	%f24,	%f24,	%f0
	and	%l1,	%o6,	%g7
	subcc	%o3,	%l0,	%l6
	set	0x44, %i1
	lda	[%l7 + %i1] 0x19,	%f27
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x7
	sll	%o0,	%l4,	%i7
	fcmpgt32	%f18,	%f24,	%i2
	movre	%i0,	%i1,	%g3
	ldsb	[%l7 + 0x21],	%g6
	subccc	%g4,	%l2,	%o1
	nop
	setx loop_777, %l0, %l1
	jmpl %l1, %g5
	nop
	set	0x51, %l1
	stb	%o5,	[%l7 + %l1]
	fmovrsgz	%l5,	%f24,	%f27
	alignaddr	%o2,	%g2,	%i6
loop_777:
	fmovdpos	%xcc,	%f17,	%f1
	srlx	%o7,	%i4,	%l3
	fmovdge	%icc,	%f12,	%f20
	sub	%g1,	%o4,	%i5
	set	0x32, %l5
	lduha	[%l7 + %l5] 0x15,	%l1
	udivcc	%o6,	0x0596,	%g7
	bshuffle	%f20,	%f20,	%f30
	fmovrdgez	%o3,	%f0,	%f4
	ld	[%l7 + 0x28],	%f20
	sdiv	%i3,	0x0748,	%l6
	lduw	[%l7 + 0x60],	%o0
	fmovsneg	%xcc,	%f26,	%f6
	stb	%l0,	[%l7 + 0x77]
	tvs	%xcc,	0x6
	fcmped	%fcc2,	%f0,	%f22
	movrlz	%l4,	%i2,	%i7
	srlx	%i1,	0x06,	%i0
	tn	%xcc,	0x6
	udivx	%g6,	0x1574,	%g3
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l2
	and	%o1,	%g5,	%g4
	movg	%xcc,	%l5,	%o2
	edge16ln	%o5,	%g2,	%o7
	bn,a	%icc,	loop_778
	brgz,a	%i4,	loop_779
	mulx	%i6,	0x1C30,	%g1
	fmul8x16au	%f6,	%f3,	%f16
loop_778:
	xnor	%o4,	0x095D,	%i5
loop_779:
	or	%l3,	%o6,	%g7
	movleu	%xcc,	%o3,	%i3
	edge32ln	%l6,	%o0,	%l1
	lduh	[%l7 + 0x12],	%l0
	sth	%l4,	[%l7 + 0x4E]
	fand	%f4,	%f30,	%f20
	edge32ln	%i7,	%i1,	%i2
	stbar
	taddcc	%i0,	0x13EC,	%g3
	sdivcc	%g6,	0x0887,	%o1
	fpadd32s	%f21,	%f29,	%f21
	array8	%l2,	%g5,	%g4
	movcc	%icc,	%o2,	%o5
	edge32	%l5,	%o7,	%i4
	stw	%g2,	[%l7 + 0x7C]
	fbue	%fcc0,	loop_780
	sdivcc	%g1,	0x0B4E,	%o4
	srax	%i6,	%l3,	%o6
	fzeros	%f7
loop_780:
	sethi	0x05B1,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x44, %o5
	stba	%g7,	[%l7 + %o5] 0x80
	xorcc	%i3,	0x022B,	%o3
	tg	%icc,	0x6
	taddcctv	%l6,	0x1707,	%o0
	sdivx	%l1,	0x1FF7,	%l0
	pdist	%f16,	%f2,	%f4
	smulcc	%l4,	0x1494,	%i1
	movleu	%xcc,	%i2,	%i0
	andcc	%g3,	%g6,	%i7
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%l2
	movpos	%icc,	%g5,	%o1
	andcc	%o2,	%o5,	%l5
	tvs	%xcc,	0x7
	ld	[%l7 + 0x54],	%f12
	fmovrdlz	%g4,	%f28,	%f18
	fbe,a	%fcc2,	loop_781
	pdist	%f8,	%f2,	%f30
	tgu	%icc,	0x0
	fpsub32s	%f20,	%f13,	%f12
loop_781:
	alignaddrl	%i4,	%o7,	%g2
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x2A] %asi,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g1,	0x1F,	%l3
	tsubcctv	%i6,	%i5,	%g7
	bleu,a	%xcc,	loop_782
	addcc	%o6,	%o3,	%i3
	orn	%o0,	%l1,	%l0
	fnot1s	%f30,	%f17
loop_782:
	fmovsge	%icc,	%f24,	%f16
	array32	%l6,	%i1,	%i2
	andcc	%l4,	0x1464,	%g3
	addccc	%g6,	%i0,	%l2
	ld	[%l7 + 0x20],	%f20
	tvs	%xcc,	0x3
	bneg	%xcc,	loop_783
	umul	%i7,	0x193B,	%g5
	or	%o2,	%o5,	%o1
	andn	%l5,	%g4,	%o7
loop_783:
	fmovde	%icc,	%f24,	%f0
	bneg,a,pn	%xcc,	loop_784
	mulscc	%g2,	0x1BE4,	%i4
	edge32l	%g1,	%l3,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_784:
	fmovs	%f22,	%f26
	fmovse	%xcc,	%f30,	%f13
	faligndata	%f14,	%f12,	%f28
	array16	%i5,	%i6,	%o6
	membar	0x1E
	tleu	%icc,	0x6
	bneg,a	loop_785
	andncc	%g7,	%o3,	%o0
	fmul8ulx16	%f26,	%f10,	%f18
	edge32l	%l1,	%i3,	%l0
loop_785:
	tleu	%xcc,	0x4
	udivx	%l6,	0x1F4B,	%i1
	ldub	[%l7 + 0x4E],	%l4
	fmovdg	%xcc,	%f14,	%f4
	fmovrdgz	%i2,	%f22,	%f8
	umulcc	%g3,	%g6,	%i0
	movcs	%xcc,	%l2,	%g5
	movne	%xcc,	%i7,	%o2
	andn	%o5,	%l5,	%o1
	tgu	%xcc,	0x4
	movle	%xcc,	%o7,	%g4
	ldd	[%l7 + 0x60],	%f18
	movrlez	%g2,	0x29B,	%i4
	addcc	%l3,	%g1,	%i5
	edge8ln	%o4,	%o6,	%i6
	fbul	%fcc0,	loop_786
	tne	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x72] %asi,	%g7
loop_786:
	fbul,a	%fcc2,	loop_787
	fornot1	%f0,	%f14,	%f14
	fblg	%fcc3,	loop_788
	tge	%icc,	0x5
loop_787:
	orcc	%o0,	%l1,	%o3
	ld	[%l7 + 0x7C],	%f23
loop_788:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i3,	%l6,	%i1
	tleu	%icc,	0x2
	array8	%l0,	%l4,	%i2
	edge32n	%g3,	%g6,	%l2
	movcc	%icc,	%g5,	%i7
	sdivcc	%o2,	0x1590,	%i0
	fmovrsne	%l5,	%f26,	%f6
	set	0x4E, %o7
	stba	%o1,	[%l7 + %o7] 0x18
	tl	%xcc,	0x2
	array32	%o7,	%o5,	%g2
	movl	%xcc,	%i4,	%l3
	fbo,a	%fcc2,	loop_789
	sdivx	%g4,	0x1644,	%g1
	tcs	%xcc,	0x5
	array16	%o4,	%o6,	%i5
loop_789:
	fand	%f2,	%f0,	%f14
	fmovsa	%icc,	%f5,	%f27
	bl	loop_790
	fba,a	%fcc2,	loop_791
	sdiv	%i6,	0x0AA6,	%o0
	fxors	%f12,	%f22,	%f20
loop_790:
	fmul8x16al	%f20,	%f25,	%f30
loop_791:
	fabsd	%f4,	%f4
	edge16n	%g7,	%o3,	%l1
	movgu	%icc,	%l6,	%i3
	and	%i1,	0x1AD8,	%l0
	srlx	%i2,	%l4,	%g6
	tle	%icc,	0x4
	tpos	%icc,	0x7
	bleu,pt	%xcc,	loop_792
	fbue	%fcc1,	loop_793
	sll	%g3,	0x19,	%l2
	smul	%i7,	0x1677,	%o2
loop_792:
	fxors	%f3,	%f22,	%f21
loop_793:
	nop
	wr	%g0,	0x19,	%asi
	stxa	%i0,	[%l7 + 0x68] %asi
	sllx	%l5,	0x07,	%g5
	fxors	%f31,	%f3,	%f8
	tleu	%xcc,	0x2
	subc	%o1,	0x184C,	%o7
	tle	%icc,	0x3
	sll	%g2,	0x1D,	%o5
	smulcc	%i4,	%g4,	%g1
	st	%f1,	[%l7 + 0x54]
	tl	%xcc,	0x5
	array16	%l3,	%o4,	%o6
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i5
	edge16n	%i6,	%g7,	%o0
	tvs	%xcc,	0x7
	move	%icc,	%o3,	%l1
	fmovsneg	%icc,	%f15,	%f11
	movpos	%xcc,	%l6,	%i3
	taddcc	%l0,	%i1,	%l4
	move	%icc,	%g6,	%i2
	edge8ln	%g3,	%l2,	%o2
	mova	%icc,	%i7,	%l5
	tcs	%xcc,	0x7
	sll	%g5,	0x11,	%i0
	tleu	%icc,	0x7
	ldstub	[%l7 + 0x0F],	%o7
	edge8l	%g2,	%o5,	%o1
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%i4
	tgu	%xcc,	0x4
	sir	0x00D3
	edge32	%g4,	%l3,	%g1
	fsrc2	%f28,	%f26
	movrgz	%o6,	%o4,	%i6
	fmovrsgz	%i5,	%f19,	%f21
	mulscc	%o0,	%o3,	%g7
	udivcc	%l6,	0x003B,	%i3
	smulcc	%l1,	0x0379,	%i1
	fmovrde	%l0,	%f20,	%f22
	mova	%icc,	%g6,	%l4
	fmovde	%xcc,	%f14,	%f13
	mulscc	%i2,	0x039D,	%g3
	add	%o2,	%i7,	%l5
	fnands	%f13,	%f23,	%f30
	tneg	%xcc,	0x4
	movvc	%icc,	%l2,	%i0
	umul	%g5,	%g2,	%o7
	movn	%icc,	%o5,	%o1
	movgu	%xcc,	%i4,	%g4
	tcs	%xcc,	0x6
	movrlez	%g1,	0x21E,	%l3
	fmovsleu	%icc,	%f1,	%f6
	edge16n	%o4,	%i6,	%i5
	ldd	[%l7 + 0x28],	%f24
	array16	%o6,	%o0,	%o3
	andn	%g7,	%l6,	%l1
	be,pt	%xcc,	loop_794
	movneg	%xcc,	%i3,	%i1
	sethi	0x0DB4,	%l0
	edge8l	%g6,	%l4,	%g3
loop_794:
	edge32l	%o2,	%i7,	%i2
	brz	%l5,	loop_795
	fmovrsgz	%i0,	%f25,	%f31
	movn	%icc,	%g5,	%g2
	bne,a	%icc,	loop_796
loop_795:
	fbg	%fcc1,	loop_797
	fcmpgt16	%f2,	%f24,	%l2
	movrgez	%o7,	0x3B7,	%o1
loop_796:
	fmovdg	%xcc,	%f12,	%f30
loop_797:
	array8	%o5,	%i4,	%g1
	edge32	%g4,	%l3,	%o4
	movneg	%icc,	%i6,	%o6
	fcmpes	%fcc1,	%f31,	%f30
	taddcc	%o0,	%o3,	%g7
	nop
	setx	loop_798,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	std	%f14,	[%l7 + 0x30]
	fzeros	%f25
	fmovda	%icc,	%f26,	%f12
loop_798:
	fbuge	%fcc2,	loop_799
	tcs	%icc,	0x6
	udivx	%l6,	0x043C,	%l1
	bne,a	%icc,	loop_800
loop_799:
	movrlez	%i3,	%i1,	%i5
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f0
loop_800:
	subcc	%l0,	0x1224,	%g6
	tg	%icc,	0x1
	umul	%l4,	0x0E7D,	%g3
	set	0x30, %i0
	prefetcha	[%l7 + %i0] 0x0c,	 0x3
	movneg	%xcc,	%i2,	%o2
	tn	%icc,	0x4
	movneg	%icc,	%l5,	%g5
	orn	%g2,	0x00F6,	%l2
	ldub	[%l7 + 0x6F],	%i0
	sra	%o7,	0x00,	%o1
	set	0x78, %g7
	stxa	%o5,	[%l7 + %g7] 0x19
	movrlez	%g1,	%g4,	%l3
	tgu	%xcc,	0x5
	tg	%icc,	0x1
	te	%icc,	0x4
	edge8n	%i4,	%o4,	%i6
	movcc	%xcc,	%o0,	%o6
	andn	%o3,	0x1100,	%g7
	brlez	%l6,	loop_801
	tl	%xcc,	0x5
	fpackfix	%f10,	%f26
	fmovdn	%xcc,	%f20,	%f31
loop_801:
	movgu	%icc,	%i3,	%l1
	ta	%xcc,	0x4
	be,a,pt	%xcc,	loop_802
	bshuffle	%f26,	%f20,	%f12
	fcmpne32	%f12,	%f20,	%i5
	movre	%l0,	0x151,	%i1
loop_802:
	tne	%xcc,	0x7
	te	%xcc,	0x2
	fnot2	%f10,	%f6
	lduw	[%l7 + 0x30],	%g6
	bge	%icc,	loop_803
	taddcc	%g3,	%i7,	%i2
	fmovdvc	%xcc,	%f11,	%f24
	stbar
loop_803:
	tgu	%xcc,	0x6
	sethi	0x063D,	%l4
	movleu	%xcc,	%l5,	%g5
	srax	%g2,	%l2,	%o2
	fzero	%f24
	tcs	%xcc,	0x1
	srl	%i0,	%o7,	%o5
	tsubcctv	%g1,	%g4,	%o1
	orncc	%l3,	0x0BE5,	%o4
	set	0x44, %i7
	lduwa	[%l7 + %i7] 0x0c,	%i6
	movvc	%icc,	%o0,	%o6
	std	%i4,	[%l7 + 0x70]
	edge16ln	%g7,	%o3,	%i3
	fcmple32	%f14,	%f8,	%l1
	mova	%xcc,	%i5,	%l6
	andncc	%i1,	%l0,	%g3
	movg	%icc,	%i7,	%i2
	fnands	%f7,	%f19,	%f16
	movrlez	%l4,	0x0DD,	%g6
	sir	0x0E5A
	fnand	%f18,	%f2,	%f18
	fmovdle	%xcc,	%f26,	%f14
	fcmpne32	%f0,	%f14,	%l5
	tvs	%xcc,	0x6
	fmovspos	%icc,	%f30,	%f10
	movl	%icc,	%g2,	%l2
	bcc,pt	%xcc,	loop_804
	edge32	%o2,	%i0,	%g5
	fble,a	%fcc1,	loop_805
	brgz,a	%o7,	loop_806
loop_804:
	sllx	%o5,	0x05,	%g4
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o1
loop_805:
	edge32	%l3,	%o4,	%i6
loop_806:
	smulcc	%g1,	%o6,	%o0
	fxnor	%f30,	%f2,	%f18
	sir	0x02AE
	lduw	[%l7 + 0x2C],	%g7
	srlx	%i4,	%o3,	%l1
	bvc	%xcc,	loop_807
	udivcc	%i3,	0x01D9,	%i5
	andncc	%i1,	%l6,	%l0
	sdivcc	%i7,	0x0030,	%i2
loop_807:
	addccc	%g3,	0x1193,	%l4
	std	%f24,	[%l7 + 0x48]
	movcs	%icc,	%g6,	%g2
	tvc	%icc,	0x5
	edge16	%l5,	%l2,	%i0
	fblg,a	%fcc0,	loop_808
	orn	%o2,	%g5,	%o7
	orcc	%o5,	0x0B8A,	%o1
	edge16	%g4,	%l3,	%o4
loop_808:
	fpmerge	%f12,	%f5,	%f2
	bpos,a	%icc,	loop_809
	xor	%i6,	0x1C40,	%o6
	tneg	%icc,	0x0
	movrgz	%o0,	%g7,	%g1
loop_809:
	udivx	%i4,	0x0861,	%o3
	bvc,pn	%xcc,	loop_810
	tn	%icc,	0x3
	fmovdvc	%icc,	%f15,	%f4
	lduw	[%l7 + 0x08],	%l1
loop_810:
	membar	0x7E
	fmovrdgez	%i5,	%f20,	%f20
	tge	%icc,	0x6
	fcmps	%fcc1,	%f11,	%f22
	fmovs	%f10,	%f7
	brgez	%i1,	loop_811
	fabsd	%f28,	%f30
	fmovsleu	%xcc,	%f22,	%f3
	umulcc	%l6,	0x0BF0,	%i3
loop_811:
	nop
	setx	loop_812,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsne	%icc,	%f5,	%f28
	andn	%l0,	0x1FD6,	%i7
	bneg	%xcc,	loop_813
loop_812:
	bpos,a	loop_814
	sethi	0x1BD0,	%i2
	fmovse	%xcc,	%f26,	%f25
loop_813:
	udivx	%g3,	0x057E,	%g6
loop_814:
	fbn,a	%fcc2,	loop_815
	edge32ln	%l4,	%l5,	%g2
	fpsub16s	%f27,	%f18,	%f9
	fsrc1s	%f28,	%f12
loop_815:
	fnot2	%f18,	%f8
	sll	%l2,	%o2,	%i0
	tgu	%xcc,	0x4
	udivcc	%g5,	0x10B9,	%o7
	for	%f30,	%f10,	%f20
	st	%f0,	[%l7 + 0x6C]
	mova	%xcc,	%o1,	%g4
	fbule,a	%fcc3,	loop_816
	fnot1	%f18,	%f18
	set	0x30, %o3
	ldxa	[%g0 + %o3] 0x50,	%o5
loop_816:
	sir	0x1EC0
	fmovd	%f16,	%f6
	fmovsneg	%xcc,	%f7,	%f0
	fmul8x16	%f25,	%f16,	%f20
	bcs,a	%xcc,	loop_817
	movvs	%xcc,	%l3,	%i6
	nop
	setx	loop_818,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	set	0x68, %o1
	ldsw	[%l7 + %o1],	%o6
loop_817:
	movrgez	%o0,	%g7,	%o4
	tg	%xcc,	0x3
loop_818:
	orn	%g1,	%i4,	%o3
	sdivx	%l1,	0x0347,	%i5
	sll	%l6,	0x0C,	%i3
	movcs	%icc,	%l0,	%i7
	faligndata	%f10,	%f0,	%f26
	xnor	%i2,	%g3,	%i1
	ldsh	[%l7 + 0x36],	%l4
	alignaddr	%l5,	%g6,	%l2
	smul	%o2,	0x094B,	%i0
	fba	%fcc1,	loop_819
	addcc	%g5,	%o7,	%g2
	movgu	%xcc,	%o1,	%g4
	edge16ln	%o5,	%l3,	%o6
loop_819:
	andcc	%o0,	0x1E5E,	%g7
	fba	%fcc0,	loop_820
	umul	%o4,	0x0C66,	%i6
	membar	0x1D
	fpsub16	%f18,	%f10,	%f8
loop_820:
	be,pn	%icc,	loop_821
	movge	%icc,	%g1,	%o3
	movne	%xcc,	%i4,	%i5
	fcmpes	%fcc0,	%f5,	%f0
loop_821:
	alignaddr	%l1,	%i3,	%l0
	set	0x4F, %o0
	lduba	[%l7 + %o0] 0x10,	%l6
	stbar
	movne	%xcc,	%i2,	%g3
	fble	%fcc0,	loop_822
	tne	%icc,	0x4
	edge32	%i1,	%l4,	%i7
	bn,a,pt	%xcc,	loop_823
loop_822:
	fabss	%f9,	%f14
	fmovsvc	%icc,	%f17,	%f31
	or	%g6,	%l2,	%l5
loop_823:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%o2,	%f15,	%f5
	wr	%g0,	0x10,	%asi
	stda	%g4,	[%l7 + 0x68] %asi
	fornot2s	%f10,	%f9,	%f30
	fmovd	%f14,	%f26
	mova	%xcc,	%i0,	%o7
	fands	%f18,	%f2,	%f20
	fbug	%fcc0,	loop_824
	edge8n	%g2,	%g4,	%o1
	tsubcctv	%l3,	0x08D2,	%o6
	sdivx	%o0,	0x0FB4,	%g7
loop_824:
	fpackfix	%f28,	%f9
	fbue,a	%fcc2,	loop_825
	fblg,a	%fcc1,	loop_826
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f2,	%f30,	%f12
loop_825:
	fnor	%f28,	%f2,	%f8
loop_826:
	smul	%o5,	0x00E0,	%i6
	fmovd	%f10,	%f20
	xor	%g1,	%o4,	%i4
	udivcc	%i5,	0x0985,	%l1
	bn,pt	%xcc,	loop_827
	fpack16	%f16,	%f31
	movge	%xcc,	%i3,	%o3
	movle	%xcc,	%l6,	%i2
loop_827:
	xnor	%l0,	0x03F4,	%g3
	orcc	%l4,	%i1,	%i7
	sll	%l2,	0x0F,	%g6
	fpadd16s	%f7,	%f0,	%f12
	tneg	%xcc,	0x3
	tcc	%xcc,	0x7
	fzero	%f20
	alignaddrl	%l5,	%g5,	%i0
	movge	%xcc,	%o2,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g2,	%g4
	fnand	%f22,	%f20,	%f18
	bgu	loop_828
	smul	%o1,	%l3,	%o6
	edge32n	%o0,	%o5,	%i6
	smulcc	%g7,	%g1,	%i4
loop_828:
	edge16n	%i5,	%l1,	%o4
	fcmpgt16	%f8,	%f4,	%i3
	st	%f7,	[%l7 + 0x54]
	set	0x60, %l2
	ldxa	[%l7 + %l2] 0x14,	%o3
	array32	%l6,	%i2,	%g3
	bn,a,pn	%xcc,	loop_829
	bcc	loop_830
	array8	%l4,	%i1,	%l0
	fmovsl	%xcc,	%f18,	%f29
loop_829:
	tleu	%icc,	0x1
loop_830:
	fbul,a	%fcc2,	loop_831
	movrne	%l2,	0x052,	%i7
	sdivx	%g6,	0x084D,	%l5
	movpos	%xcc,	%g5,	%o2
loop_831:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fexpand	%f8,	%f16
	movneg	%icc,	%i0,	%o7
	edge32ln	%g4,	%o1,	%l3
	sll	%o6,	%o0,	%o5
	ba,pn	%xcc,	loop_832
	tn	%icc,	0x1
	tge	%xcc,	0x7
	tn	%xcc,	0x4
loop_832:
	srlx	%g2,	%i6,	%g1
	srlx	%i4,	0x02,	%i5
	alignaddrl	%l1,	%o4,	%g7
	fnot2	%f22,	%f22
	tvs	%icc,	0x4
	fcmple16	%f18,	%f24,	%i3
	fmovsg	%xcc,	%f21,	%f23
	fbn	%fcc1,	loop_833
	taddcc	%o3,	0x1BCC,	%l6
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x68] %asi,	%g3
loop_833:
	fmovsa	%xcc,	%f13,	%f17
	movl	%icc,	%i2,	%i1
	fsrc2s	%f29,	%f20
	mulx	%l4,	%l2,	%l0
	movg	%icc,	%i7,	%g6
	edge8ln	%g5,	%l5,	%o2
	set	0x78, %l6
	ldsba	[%l7 + %l6] 0x15,	%i0
	fbug,a	%fcc3,	loop_834
	mulx	%g4,	%o7,	%o1
	taddcc	%o6,	%l3,	%o5
	add	%o0,	%g2,	%g1
loop_834:
	sub	%i6,	%i5,	%i4
	fpack16	%f0,	%f16
	fmul8x16al	%f8,	%f11,	%f20
	tpos	%icc,	0x5
	fmovrse	%l1,	%f18,	%f5
	tleu	%icc,	0x1
	edge16l	%o4,	%i3,	%g7
	bvs,a	loop_835
	movne	%xcc,	%l6,	%o3
	fmovsvs	%xcc,	%f4,	%f3
	fxor	%f28,	%f22,	%f16
loop_835:
	subc	%i2,	0x1C1F,	%g3
	bgu,a,pn	%xcc,	loop_836
	fnand	%f8,	%f4,	%f28
	tleu	%xcc,	0x7
	subccc	%l4,	0x0535,	%i1
loop_836:
	sllx	%l0,	0x0F,	%l2
	brlz	%g6,	loop_837
	ldsh	[%l7 + 0x58],	%g5
	fcmpne32	%f20,	%f6,	%i7
	tsubcc	%l5,	%i0,	%o2
loop_837:
	sra	%g4,	%o1,	%o6
	fmovsge	%icc,	%f20,	%f21
	alignaddrl	%l3,	%o5,	%o0
	ldub	[%l7 + 0x1E],	%g2
	ta	%xcc,	0x5
	mulx	%g1,	%o7,	%i5
	tne	%icc,	0x2
	edge8	%i6,	%i4,	%o4
	edge32ln	%l1,	%i3,	%l6
	fpack16	%f20,	%f18
	brgez,a	%g7,	loop_838
	flush	%l7 + 0x28
	bg,a,pn	%xcc,	loop_839
	fbne,a	%fcc0,	loop_840
loop_838:
	fcmped	%fcc1,	%f8,	%f4
	fbuge,a	%fcc0,	loop_841
loop_839:
	movrgez	%o3,	0x360,	%i2
loop_840:
	fmovspos	%xcc,	%f13,	%f9
	stw	%l4,	[%l7 + 0x4C]
loop_841:
	fsrc2s	%f29,	%f19
	fmovdn	%xcc,	%f16,	%f26
	fmovdne	%xcc,	%f2,	%f21
	ld	[%l7 + 0x38],	%f9
	tcc	%icc,	0x2
	fbe,a	%fcc2,	loop_842
	movvc	%icc,	%i1,	%l0
	fmovdcc	%icc,	%f28,	%f17
	fcmpeq32	%f26,	%f24,	%l2
loop_842:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%g3,	%g5
	or	%g6,	%i7,	%i0
	fabsd	%f8,	%f22
	fbu,a	%fcc2,	loop_843
	fnot2	%f4,	%f24
	fnand	%f16,	%f2,	%f22
	tneg	%icc,	0x4
loop_843:
	tne	%icc,	0x3
	nop
	set	0x4A, %l0
	lduh	[%l7 + %l0],	%l5
	fpsub16s	%f20,	%f4,	%f8
	tsubcctv	%g4,	0x184C,	%o2
	fcmpgt16	%f24,	%f18,	%o6
	ldx	[%l7 + 0x48],	%o1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x18,	%l3,	%o5
	fcmple32	%f30,	%f0,	%g2
	brlz	%g1,	loop_844
	brnz,a	%o7,	loop_845
	tsubcctv	%o0,	%i6,	%i4
	movg	%icc,	%o4,	%i5
loop_844:
	ta	%xcc,	0x1
loop_845:
	umul	%l1,	0x059B,	%i3
	wr	%g0,	0xea,	%asi
	stha	%g7,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32n	%o3,	%i2,	%l4
	ble,a	loop_846
	bpos	loop_847
	ldd	[%l7 + 0x40],	%i0
	taddcctv	%l0,	%l2,	%l6
loop_846:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x66] %asi,	%g3
loop_847:
	edge16n	%g6,	%i7,	%g5
	movvc	%icc,	%l5,	%g4
	bgu	loop_848
	bge,pn	%xcc,	loop_849
	fpmerge	%f10,	%f18,	%f12
	fmovrde	%i0,	%f8,	%f26
loop_848:
	fpsub16	%f2,	%f8,	%f14
loop_849:
	subccc	%o6,	0x15D1,	%o2
	sdiv	%o1,	0x1941,	%l3
	fbn	%fcc0,	loop_850
	brz	%g2,	loop_851
	edge32l	%g1,	%o5,	%o0
	movleu	%xcc,	%o7,	%i4
loop_850:
	move	%icc,	%o4,	%i5
loop_851:
	nop
	set	0x14, %l4
	ldstuba	[%l7 + %l4] 0x10,	%i6
	fsrc2s	%f11,	%f10
	membar	0x16
	bcs,pn	%icc,	loop_852
	ldsw	[%l7 + 0x54],	%l1
	fmovsneg	%icc,	%f2,	%f30
	movcs	%icc,	%g7,	%o3
loop_852:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x74] %asi,	%i3
	lduh	[%l7 + 0x34],	%l4
	sll	%i2,	%i1,	%l0
	movrlz	%l6,	0x22A,	%g3
	addcc	%l2,	0x11F5,	%i7
	fzeros	%f27
	fandnot1	%f28,	%f0,	%f26
	nop
	set	0x10, %g4
	stx	%g5,	[%l7 + %g4]
	fbne,a	%fcc0,	loop_853
	stx	%l5,	[%l7 + 0x18]
	mova	%xcc,	%g6,	%g4
	tsubcctv	%o6,	0x1AE0,	%i0
loop_853:
	array16	%o1,	%l3,	%o2
	te	%icc,	0x2
	taddcctv	%g2,	%g1,	%o5
	movn	%icc,	%o0,	%o7
	fpadd16s	%f11,	%f11,	%f19
	bgu	%icc,	loop_854
	sllx	%o4,	%i4,	%i6
	movrlez	%i5,	0x027,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_854:
	umulcc	%o3,	%g7,	%i3
	tsubcc	%i2,	0x144E,	%i1
	fbn	%fcc3,	loop_855
	movrne	%l4,	0x3CF,	%l0
	srl	%l6,	0x0C,	%g3
	fmovrslez	%i7,	%f22,	%f26
loop_855:
	movrgez	%g5,	0x285,	%l2
	edge8n	%l5,	%g6,	%g4
	tgu	%icc,	0x2
	ldsh	[%l7 + 0x6A],	%o6
	brnz,a	%o1,	loop_856
	movge	%xcc,	%i0,	%l3
	sll	%g2,	%g1,	%o2
	sllx	%o0,	%o7,	%o5
loop_856:
	edge16l	%o4,	%i6,	%i5
	edge32ln	%i4,	%o3,	%l1
	udiv	%i3,	0x1661,	%g7
	movgu	%xcc,	%i1,	%l4
	fbuge	%fcc0,	loop_857
	addcc	%i2,	0x0AAB,	%l6
	tge	%icc,	0x0
	smul	%g3,	%l0,	%g5
loop_857:
	bgu	%icc,	loop_858
	tcc	%icc,	0x0
	smulcc	%l2,	0x06B3,	%l5
	alignaddr	%i7,	%g6,	%g4
loop_858:
	fblg	%fcc3,	loop_859
	fbug,a	%fcc3,	loop_860
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o1,	0x0F45,	%i0
loop_859:
	tpos	%xcc,	0x3
loop_860:
	movle	%icc,	%l3,	%g2
	nop
	set	0x38, %i5
	stw	%o6,	[%l7 + %i5]
	edge16n	%g1,	%o2,	%o0
	movl	%icc,	%o5,	%o4
	edge16	%o7,	%i5,	%i6
	tsubcctv	%o3,	0x1999,	%i4
	brz,a	%l1,	loop_861
	movcs	%icc,	%i3,	%i1
	edge16	%l4,	%i2,	%l6
	fcmple32	%f22,	%f18,	%g7
loop_861:
	andncc	%g3,	%l0,	%l2
	mulx	%g5,	%i7,	%l5
	sth	%g6,	[%l7 + 0x18]
	popc	0x1858,	%o1
	tcs	%xcc,	0x5
	bg,a,pn	%xcc,	loop_862
	edge32	%i0,	%l3,	%g4
	movpos	%xcc,	%o6,	%g2
	umulcc	%o2,	0x176B,	%g1
loop_862:
	bcs,a	%icc,	loop_863
	sll	%o5,	%o0,	%o7
	tvs	%icc,	0x6
	nop
	setx	loop_864,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_863:
	membar	0x56
	ldx	[%l7 + 0x50],	%o4
	alignaddr	%i6,	%i5,	%i4
loop_864:
	array32	%l1,	%i3,	%i1
	taddcctv	%l4,	0x0B1E,	%o3
	fcmpne16	%f30,	%f0,	%l6
	mova	%xcc,	%i2,	%g3
	edge32ln	%g7,	%l0,	%g5
	fxor	%f6,	%f26,	%f16
	swap	[%l7 + 0x4C],	%l2
	taddcctv	%i7,	%g6,	%o1
	fmovdgu	%xcc,	%f26,	%f15
	andncc	%i0,	%l5,	%g4
	edge8	%o6,	%l3,	%o2
	udiv	%g1,	0x0707,	%o5
	fmovrdgz	%g2,	%f10,	%f28
	std	%f20,	[%l7 + 0x20]
	taddcc	%o7,	0x15F6,	%o4
	std	%f10,	[%l7 + 0x50]
	fbu,a	%fcc0,	loop_865
	movvs	%icc,	%i6,	%i5
	nop
	setx	loop_866,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fabss	%f23,	%f4
loop_865:
	movrgez	%i4,	0x110,	%o0
	edge16l	%i3,	%i1,	%l1
loop_866:
	tcs	%xcc,	0x2
	te	%icc,	0x6
	tgu	%xcc,	0x1
	orcc	%o3,	0x0B42,	%l4
	nop
	setx	loop_867,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bn,a	%xcc,	loop_868
	ld	[%l7 + 0x40],	%f30
	fmovdleu	%icc,	%f8,	%f7
loop_867:
	edge32l	%l6,	%g3,	%i2
loop_868:
	mulx	%g7,	0x13A9,	%l0
	fmovdge	%icc,	%f7,	%f27
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%g5,	%l2
	tleu	%icc,	0x7
	udiv	%g6,	0x183E,	%o1
	popc	0x1233,	%i7
	popc	%i0,	%g4
	fmul8x16	%f25,	%f12,	%f20
	fmovdpos	%icc,	%f2,	%f11
	movrgez	%l5,	%l3,	%o6
	fmovrsgz	%o2,	%f4,	%f8
	ldsh	[%l7 + 0x1E],	%o5
	set	0x1C, %g5
	lduha	[%l7 + %g5] 0x89,	%g1
	srlx	%o7,	%o4,	%g2
	fbue	%fcc1,	loop_869
	movre	%i6,	%i4,	%i5
	sllx	%o0,	%i3,	%i1
	tsubcc	%l1,	%o3,	%l6
loop_869:
	nop
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x50] %asi,	%g3
	tl	%xcc,	0x2
	ldsh	[%l7 + 0x0C],	%i2
	wr	%g0,	0x57,	%asi
	stxa	%g7,	[%g0 + 0x0] %asi
	sllx	%l0,	0x1E,	%l4
	ba,pt	%icc,	loop_870
	lduh	[%l7 + 0x1A],	%g5
	or	%l2,	0x07AA,	%o1
	movvs	%xcc,	%g6,	%i0
loop_870:
	nop
	wr	%g0,	0x22,	%asi
	stha	%g4,	[%l7 + 0x4C] %asi
	membar	#Sync
	add	%l5,	0x1C4D,	%i7
	wr	%g0,	0x2f,	%asi
	stxa	%l3,	[%l7 + 0x40] %asi
	membar	#Sync
	st	%f14,	[%l7 + 0x24]
	edge8	%o2,	%o5,	%o6
	fmuld8sux16	%f7,	%f28,	%f0
	fbuge,a	%fcc0,	loop_871
	srlx	%g1,	0x16,	%o7
	xnor	%g2,	%i6,	%i4
	sra	%o4,	%o0,	%i5
loop_871:
	fmovsn	%xcc,	%f29,	%f5
	sub	%i3,	0x175E,	%l1
	addcc	%o3,	%l6,	%i1
	nop
	setx loop_872, %l0, %l1
	jmpl %l1, %g3
	fmovdcc	%xcc,	%f17,	%f2
	subcc	%i2,	0x17A9,	%l0
	mova	%xcc,	%g7,	%l4
loop_872:
	alignaddr	%g5,	%l2,	%o1
	fmuld8sux16	%f11,	%f6,	%f16
	sdivx	%i0,	0x04CE,	%g6
	tcs	%icc,	0x0
	fnot1s	%f19,	%f31
	bl,pn	%icc,	loop_873
	edge16n	%l5,	%i7,	%l3
	edge16	%o2,	%g4,	%o5
	sdivx	%o6,	0x0086,	%g1
loop_873:
	fmovscs	%xcc,	%f15,	%f30
	fcmpgt16	%f26,	%f12,	%o7
	fmovsg	%xcc,	%f16,	%f1
	tneg	%xcc,	0x7
	fmovsne	%icc,	%f3,	%f10
	fpackfix	%f12,	%f21
	mulscc	%i6,	0x010F,	%g2
	fpadd16s	%f8,	%f5,	%f24
	tgu	%xcc,	0x1
	movne	%xcc,	%o4,	%i4
	fmovse	%xcc,	%f21,	%f29
	mulx	%i5,	0x1A6A,	%i3
	tleu	%xcc,	0x6
	bvc,a,pt	%xcc,	loop_874
	movrlez	%o0,	%l1,	%l6
	movne	%xcc,	%i1,	%g3
	tle	%icc,	0x5
loop_874:
	bn,a,pn	%icc,	loop_875
	edge8l	%i2,	%o3,	%g7
	movneg	%xcc,	%l4,	%l0
	bge	%icc,	loop_876
loop_875:
	sdivx	%l2,	0x1D7D,	%g5
	xnorcc	%i0,	%g6,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_876:
	srax	%o1,	%i7,	%l3
	umul	%o2,	0x0902,	%g4
	fxors	%f0,	%f3,	%f18
	sdivcc	%o5,	0x0271,	%o6
	edge16ln	%g1,	%o7,	%i6
	tcs	%icc,	0x1
	stbar
	ta	%icc,	0x1
	or	%g2,	0x193F,	%i4
	brgez,a	%i5,	loop_877
	taddcctv	%i3,	0x147C,	%o0
	movvs	%icc,	%l1,	%o4
	movrgez	%l6,	0x2B0,	%g3
loop_877:
	fmovrdlez	%i2,	%f10,	%f8
	mulscc	%i1,	0x041C,	%o3
	movcs	%xcc,	%g7,	%l4
	umul	%l2,	0x1D4E,	%g5
	addc	%l0,	%g6,	%l5
	fornot2s	%f23,	%f15,	%f31
	tneg	%xcc,	0x5
	stx	%i0,	[%l7 + 0x10]
	fpsub16s	%f3,	%f9,	%f5
	movrgz	%o1,	%l3,	%o2
	brgz,a	%i7,	loop_878
	ldsh	[%l7 + 0x1E],	%o5
	prefetch	[%l7 + 0x64],	 0x0
	ldub	[%l7 + 0x6E],	%o6
loop_878:
	fabss	%f14,	%f2
	srax	%g4,	%o7,	%i6
	sub	%g1,	0x1881,	%i4
	andn	%g2,	%i5,	%i3
	brgz,a	%l1,	loop_879
	mulscc	%o4,	%o0,	%l6
	popc	0x14D8,	%i2
	fbul	%fcc1,	loop_880
loop_879:
	std	%g2,	[%l7 + 0x18]
	edge8n	%i1,	%g7,	%l4
	udivx	%o3,	0x1D30,	%l2
loop_880:
	tle	%xcc,	0x4
	stx	%l0,	[%l7 + 0x10]
	movrne	%g6,	0x185,	%g5
	alignaddr	%i0,	%o1,	%l3
	tsubcctv	%o2,	%i7,	%o5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%o6
	array16	%g4,	%i6,	%o7
	membar	0x62
	edge32	%i4,	%g2,	%g1
	sub	%i5,	0x0C33,	%i3
	fmul8ulx16	%f0,	%f16,	%f28
	wr	%g0,	0x11,	%asi
	stha	%l1,	[%l7 + 0x7A] %asi
	swap	[%l7 + 0x44],	%o0
	fmovrse	%o4,	%f25,	%f9
	edge16ln	%l6,	%g3,	%i1
	taddcc	%i2,	%g7,	%o3
	movrgz	%l4,	0x24B,	%l2
	fcmpne16	%f22,	%f12,	%g6
	edge32l	%l0,	%g5,	%i0
	fcmpeq16	%f18,	%f4,	%l3
	fmovse	%xcc,	%f9,	%f24
	movrgez	%o1,	0x189,	%i7
	sll	%o2,	0x07,	%o5
	movpos	%icc,	%o6,	%l5
	udivx	%g4,	0x111A,	%i6
	movl	%icc,	%o7,	%g2
	fexpand	%f11,	%f8
	call	loop_881
	fpadd32	%f24,	%f4,	%f4
	udiv	%i4,	0x1388,	%i5
	fzero	%f20
loop_881:
	sub	%i3,	0x14BB,	%g1
	movrgz	%o0,	%l1,	%l6
	sdiv	%g3,	0x000D,	%i1
	fcmps	%fcc0,	%f2,	%f0
	xorcc	%i2,	0x174F,	%o4
	alignaddrl	%o3,	%l4,	%g7
	movrgez	%g6,	0x0C4,	%l2
	fmovdcs	%icc,	%f15,	%f28
	movpos	%icc,	%g5,	%l0
	andncc	%l3,	%o1,	%i7
	fbu	%fcc0,	loop_882
	tsubcc	%o2,	0x07A9,	%i0
	movcc	%icc,	%o6,	%l5
	orn	%o5,	0x101C,	%i6
loop_882:
	for	%f22,	%f2,	%f4
	tleu	%icc,	0x6
	sll	%g4,	%o7,	%g2
	udivx	%i5,	0x0379,	%i4
	tcc	%icc,	0x3
	bneg,a	loop_883
	andn	%i3,	%g1,	%o0
	movvs	%icc,	%l6,	%l1
	movge	%icc,	%i1,	%i2
loop_883:
	ba,a,pn	%xcc,	loop_884
	movrlz	%g3,	%o3,	%o4
	ldsh	[%l7 + 0x78],	%g7
	array32	%g6,	%l4,	%g5
loop_884:
	orncc	%l2,	0x0D22,	%l0
	movle	%icc,	%l3,	%o1
	movrgez	%o2,	%i7,	%o6
	move	%xcc,	%i0,	%l5
	brlez,a	%o5,	loop_885
	sll	%i6,	%g4,	%g2
	array32	%i5,	%o7,	%i4
	smul	%i3,	%g1,	%l6
loop_885:
	stx	%o0,	[%l7 + 0x20]
	movrlez	%i1,	%i2,	%g3
	sdivx	%o3,	0x00E2,	%o4
	fones	%f21
	tvs	%xcc,	0x3
	fbg	%fcc3,	loop_886
	brgez	%g7,	loop_887
	sra	%l1,	0x05,	%l4
	brz,a	%g6,	loop_888
loop_886:
	movleu	%xcc,	%l2,	%g5
loop_887:
	xor	%l3,	0x138D,	%l0
	fcmple32	%f6,	%f2,	%o1
loop_888:
	move	%icc,	%i7,	%o2
	edge32	%o6,	%i0,	%o5
	tl	%xcc,	0x1
	movre	%l5,	0x21D,	%i6
	move	%icc,	%g2,	%g4
	fnor	%f12,	%f18,	%f6
	bg,a,pn	%icc,	loop_889
	tl	%xcc,	0x7
	fbul	%fcc2,	loop_890
	stx	%o7,	[%l7 + 0x48]
loop_889:
	movcc	%xcc,	%i5,	%i4
	fmovrdlz	%i3,	%f12,	%f18
loop_890:
	movleu	%xcc,	%l6,	%g1
	bvs,a,pn	%xcc,	loop_891
	smulcc	%i1,	%o0,	%i2
	bcs	loop_892
	ldd	[%l7 + 0x60],	%f22
loop_891:
	tsubcctv	%g3,	%o3,	%o4
	fmovsge	%icc,	%f23,	%f7
loop_892:
	edge16	%l1,	%l4,	%g7
	tle	%xcc,	0x0
	tg	%xcc,	0x5
	xor	%l2,	%g5,	%l3
	st	%f7,	[%l7 + 0x38]
	xnor	%l0,	0x0173,	%o1
	movleu	%icc,	%i7,	%g6
	fpadd16	%f18,	%f30,	%f20
	fmovspos	%xcc,	%f15,	%f30
	bcs,a,pn	%xcc,	loop_893
	mova	%icc,	%o2,	%o6
	bge,pt	%xcc,	loop_894
	xor	%i0,	%o5,	%l5
loop_893:
	xnorcc	%g2,	%g4,	%o7
	fmovdcs	%icc,	%f4,	%f20
loop_894:
	nop
	set	0x34, %g2
	lduwa	[%l7 + %g2] 0x81,	%i6
	taddcc	%i5,	0x0E75,	%i3
	movvs	%icc,	%i4,	%g1
	fble	%fcc3,	loop_895
	fmovrsne	%i1,	%f10,	%f20
	movgu	%icc,	%o0,	%i2
	fcmpgt16	%f8,	%f12,	%l6
loop_895:
	lduw	[%l7 + 0x0C],	%g3
	movne	%xcc,	%o4,	%l1
	move	%icc,	%o3,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x0
	orncc	%l4,	0x1527,	%g5
	ble	%xcc,	loop_896
	movvs	%icc,	%l2,	%l0
	tleu	%xcc,	0x3
	bvs	loop_897
loop_896:
	movgu	%xcc,	%l3,	%o1
	udiv	%i7,	0x1D48,	%g6
	fbul	%fcc0,	loop_898
loop_897:
	fzeros	%f13
	fmovdvs	%xcc,	%f12,	%f18
	movcs	%xcc,	%o6,	%o2
loop_898:
	nop
	set	0x24, %i4
	ldsb	[%l7 + %i4],	%o5
	xorcc	%i0,	%g2,	%l5
	movn	%xcc,	%g4,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i5,	0x3F7,	%i3
	tpos	%icc,	0x3
	tge	%xcc,	0x2
	tge	%icc,	0x4
	fmovda	%xcc,	%f5,	%f2
	edge8n	%i4,	%g1,	%o7
	edge8n	%o0,	%i1,	%i2
	orcc	%l6,	0x142A,	%g3
	andn	%o4,	%l1,	%o3
	sth	%g7,	[%l7 + 0x30]
	tl	%icc,	0x5
	fmovdn	%icc,	%f8,	%f0
	std	%f14,	[%l7 + 0x40]
	tne	%xcc,	0x6
	udiv	%l4,	0x1B5F,	%l2
	tsubcctv	%g5,	0x1CCB,	%l0
	movvs	%xcc,	%o1,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f12,	%f2,	%f8
	ldsw	[%l7 + 0x7C],	%i7
	edge8ln	%o6,	%g6,	%o2
	fmovdcc	%xcc,	%f4,	%f18
	nop
	setx	loop_899,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	and	%o5,	%g2,	%i0
	fbg,a	%fcc1,	loop_900
	movge	%icc,	%l5,	%g4
loop_899:
	fmovdg	%icc,	%f27,	%f21
	alignaddr	%i5,	%i3,	%i6
loop_900:
	movpos	%icc,	%i4,	%o7
	fmovsa	%xcc,	%f4,	%f28
	tcs	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o0,	%g1,	%i2
	fandnot2	%f8,	%f6,	%f0
	fcmpgt16	%f24,	%f6,	%l6
	stbar
	fbue	%fcc2,	loop_901
	tvc	%icc,	0x3
	subcc	%g3,	0x12C9,	%i1
	movneg	%xcc,	%o4,	%l1
loop_901:
	fmovscs	%xcc,	%f0,	%f9
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovdge	%icc,	%f17,	%f19
	orncc	%o3,	0x0E51,	%l4
	ldub	[%l7 + 0x71],	%l2
	fbn,a	%fcc3,	loop_902
	edge16l	%g5,	%g7,	%l0
	tvs	%icc,	0x4
	membar	0x62
loop_902:
	fbl,a	%fcc1,	loop_903
	movleu	%xcc,	%l3,	%i7
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%o1
loop_903:
	andncc	%g6,	%o2,	%o5
	fmovsg	%icc,	%f19,	%f5
	brlz,a	%g2,	loop_904
	movre	%i0,	%l5,	%g4
	addc	%i3,	0x0A65,	%i6
	fandnot2s	%f21,	%f18,	%f5
loop_904:
	fbue	%fcc2,	loop_905
	brlez,a	%i4,	loop_906
	movgu	%xcc,	%i5,	%o0
	wr	%g0,	0x19,	%asi
	sta	%f8,	[%l7 + 0x44] %asi
loop_905:
	fnegd	%f18,	%f18
loop_906:
	ldsb	[%l7 + 0x75],	%o7
	movn	%icc,	%i2,	%l6
	udiv	%g3,	0x0F0C,	%g1
	movre	%o4,	%l1,	%o3
	fornot2	%f2,	%f26,	%f8
	movle	%xcc,	%i1,	%l2
	movleu	%xcc,	%l4,	%g5
	set	0x5E, %i6
	ldstuba	[%l7 + %i6] 0x81,	%g7
	fnot1s	%f16,	%f30
	bvc,pn	%xcc,	loop_907
	tcs	%xcc,	0x4
	sethi	0x0FC9,	%l0
	xnorcc	%l3,	%o6,	%o1
loop_907:
	nop
	wr	%g0,	0x89,	%asi
	stba	%g6,	[%l7 + 0x6C] %asi
	movre	%i7,	0x080,	%o5
	tge	%xcc,	0x2
	tl	%icc,	0x1
	set	0x38, %l3
	stwa	%g2,	[%l7 + %l3] 0xea
	membar	#Sync
	stbar
	sub	%i0,	0x1B26,	%l5
	movle	%xcc,	%g4,	%o2
	fmovrde	%i6,	%f28,	%f26
	brnz,a	%i4,	loop_908
	movrgez	%i5,	0x24F,	%i3
	edge8n	%o7,	%o0,	%i2
	bl	loop_909
loop_908:
	movl	%icc,	%l6,	%g3
	fcmpne16	%f2,	%f20,	%o4
	fpackfix	%f20,	%f0
loop_909:
	movpos	%xcc,	%g1,	%o3
	flush	%l7 + 0x78
	edge8ln	%i1,	%l2,	%l1
	fmovspos	%icc,	%f4,	%f15
	movrgez	%l4,	0x37D,	%g5
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0xe2,	%asi
	stba	%g7,	[%l7 + 0x4B] %asi
	membar	#Sync
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x4C] %asi,	%l0
	xor	%o6,	0x06EE,	%o1
	stbar
	tcs	%xcc,	0x3
	edge8ln	%l3,	%g6,	%i7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	fxors	%f14,	%f24,	%f4
	fmovrsgz	%i0,	%f4,	%f2
	set	0x3E, %g3
	ldsha	[%l7 + %g3] 0x04,	%g2
	faligndata	%f12,	%f2,	%f10
	sdiv	%g4,	0x0F0A,	%l5
	addcc	%i6,	%i4,	%i5
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o2,	%i3
	tsubcc	%o0,	0x0B76,	%o7
	movn	%icc,	%l6,	%g3
	fcmpes	%fcc2,	%f17,	%f1
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x42] %asi,	%i2
	movcs	%xcc,	%g1,	%o4
	xnorcc	%i1,	%l2,	%l1
	movneg	%icc,	%l4,	%g5
	taddcc	%o3,	0x1FEE,	%g7
	subccc	%o6,	0x1B73,	%o1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%l3
	tleu	%icc,	0x5
	movge	%xcc,	%g6,	%o5
	andn	%i0,	0x0ED7,	%g2
	andcc	%i7,	%g4,	%l5
	std	%f20,	[%l7 + 0x10]
	bl	%xcc,	loop_910
	or	%i6,	%i5,	%i4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x64] %asi,	%o2
loop_910:
	tleu	%xcc,	0x0
	bgu,pn	%icc,	loop_911
	smul	%i3,	%o0,	%l6
	sir	0x1D03
	edge8l	%o7,	%g3,	%i2
loop_911:
	nop
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x40] %asi,	%o4
	movg	%xcc,	%i1,	%g1
	wr	%g0,	0x81,	%asi
	stxa	%l1,	[%l7 + 0x38] %asi
	ldsw	[%l7 + 0x3C],	%l2
	movrlez	%l4,	0x166,	%g5
	tg	%icc,	0x3
	te	%xcc,	0x6
	set	0x38, %o2
	stwa	%o3,	[%l7 + %o2] 0x2a
	membar	#Sync
	andn	%o6,	0x0D96,	%g7
	movl	%xcc,	%l0,	%o1
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%g6
	sdivx	%o5,	0x0ED9,	%i0
	tn	%icc,	0x2
	tn	%xcc,	0x5
	movrlez	%l3,	0x085,	%i7
	alignaddr	%g2,	%l5,	%i6
	movne	%icc,	%i5,	%i4
	andncc	%g4,	%i3,	%o2
	xnorcc	%o0,	%l6,	%o7
	tn	%icc,	0x2
	tle	%icc,	0x5
	movg	%xcc,	%i2,	%o4
	fpadd32	%f12,	%f28,	%f12
	taddcctv	%g3,	%g1,	%i1
	udiv	%l2,	0x17D5,	%l1
	ldsw	[%l7 + 0x5C],	%l4
	tvc	%xcc,	0x5
	subcc	%o3,	0x0034,	%g5
	addccc	%o6,	%l0,	%o1
	movle	%xcc,	%g7,	%g6
	array8	%o5,	%l3,	%i0
	sra	%i7,	%g2,	%i6
	movvc	%icc,	%i5,	%i4
	fmovdvc	%icc,	%f18,	%f7
	edge32n	%g4,	%i3,	%l5
	prefetch	[%l7 + 0x1C],	 0x0
	sdivcc	%o2,	0x093A,	%l6
	sllx	%o0,	0x11,	%o7
	fmovrdlez	%i2,	%f8,	%f0
	movrgz	%o4,	0x17E,	%g3
	movcs	%xcc,	%i1,	%g1
	sra	%l2,	0x06,	%l4
	taddcc	%l1,	%g5,	%o3
	fmovrse	%l0,	%f30,	%f19
	movgu	%xcc,	%o1,	%o6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%g7
	movrne	%o5,	0x0C6,	%l3
	fmovdpos	%xcc,	%f8,	%f12
	movre	%i7,	0x17D,	%i0
	bneg,a,pn	%icc,	loop_912
	movgu	%xcc,	%g2,	%i5
	std	%i6,	[%l7 + 0x28]
	array32	%g4,	%i4,	%i3
loop_912:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o2,	%l6
	movleu	%icc,	%o0,	%o7
	fmovrslz	%l5,	%f0,	%f13
	tcc	%icc,	0x0
	addcc	%i2,	0x1624,	%o4
	fmovdvc	%xcc,	%f26,	%f0
	ldub	[%l7 + 0x17],	%i1
	brnz,a	%g3,	loop_913
	sethi	0x0355,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_914,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_913:
	mulscc	%g1,	%l1,	%l4
	srlx	%o3,	0x04,	%g5
	xor	%l0,	0x0A4A,	%o6
loop_914:
	ta	%xcc,	0x2
	orn	%g6,	%o1,	%o5
	fnor	%f30,	%f16,	%f26
	bleu,a,pt	%icc,	loop_915
	tsubcctv	%l3,	%i7,	%g7
	mulscc	%i0,	%i5,	%g2
	sdiv	%g4,	0x03EB,	%i4
loop_915:
	movg	%xcc,	%i3,	%o2
	sdivcc	%l6,	0x0B99,	%o0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x34] %asi,	%f5
	ldsh	[%l7 + 0x5A],	%o7
	udivx	%i6,	0x120E,	%l5
	edge8	%i2,	%i1,	%o4
	fbe,a	%fcc3,	loop_916
	edge16l	%g3,	%g1,	%l2
	srax	%l1,	0x1B,	%o3
	movrlez	%g5,	%l0,	%o6
loop_916:
	edge16l	%g6,	%o1,	%l4
	bneg	loop_917
	fcmpd	%fcc1,	%f10,	%f0
	orncc	%o5,	%i7,	%l3
	fmovrdgz	%i0,	%f22,	%f20
loop_917:
	or	%g7,	%i5,	%g4
	edge8l	%g2,	%i4,	%i3
	bleu,pn	%xcc,	loop_918
	movrne	%l6,	%o2,	%o0
	taddcc	%o7,	%i6,	%i2
	orn	%i1,	%l5,	%g3
loop_918:
	addc	%o4,	0x02CB,	%g1
	fmovsneg	%xcc,	%f25,	%f20
	tpos	%icc,	0x3
	smul	%l2,	%l1,	%g5
	xnor	%l0,	0x0447,	%o3
	set	0x48, %i2
	stxa	%g6,	[%l7 + %i2] 0x15
	fmovsn	%icc,	%f26,	%f19
	fmul8x16al	%f0,	%f3,	%f12
	fmovrdlez	%o6,	%f2,	%f28
	fmovda	%xcc,	%f5,	%f10
	movn	%icc,	%o1,	%o5
	set	0x50, %o6
	prefetcha	[%l7 + %o6] 0x14,	 0x3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i7,	%i0
	movn	%xcc,	%l3,	%g7
	edge16	%i5,	%g2,	%g4
	faligndata	%f18,	%f14,	%f10
	fcmpeq16	%f14,	%f2,	%i3
	move	%xcc,	%i4,	%o2
	movle	%icc,	%o0,	%o7
	array16	%i6,	%i2,	%i1
	xnor	%l6,	0x0B77,	%l5
	bneg,a	loop_919
	membar	0x3C
	sdiv	%o4,	0x0719,	%g3
	set	0x28, %i3
	ldswa	[%l7 + %i3] 0x89,	%l2
loop_919:
	fzero	%f26
	set	0x64, %o4
	sta	%f0,	[%l7 + %o4] 0x18
	fmovsle	%icc,	%f16,	%f14
	tneg	%xcc,	0x1
	edge32n	%l1,	%g5,	%l0
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o3
	fmovsgu	%xcc,	%f2,	%f4
	fpmerge	%f23,	%f3,	%f14
	array32	%g1,	%o6,	%o1
	srax	%g6,	0x0D,	%l4
	wr	%g0,	0x80,	%asi
	stba	%i7,	[%l7 + 0x79] %asi
	movrgz	%o5,	0x14F,	%l3
	movrne	%g7,	0x15A,	%i5
	fpackfix	%f14,	%f3
	fbge	%fcc1,	loop_920
	edge16ln	%g2,	%g4,	%i3
	set	0x2C, %i1
	ldsba	[%l7 + %i1] 0x18,	%i4
loop_920:
	alignaddrl	%i0,	%o2,	%o0
	fpadd32s	%f21,	%f23,	%f6
	sir	0x0BB2
	fsrc1s	%f8,	%f22
	sllx	%i6,	0x09,	%i2
	umul	%i1,	%o7,	%l5
	fands	%f16,	%f21,	%f8
	popc	%l6,	%g3
	fnands	%f6,	%f28,	%f28
	tn	%icc,	0x6
	subcc	%o4,	%l1,	%l2
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f4
	sllx	%g5,	%o3,	%g1
	addc	%o6,	%l0,	%g6
	srax	%l4,	0x15,	%i7
	fble,a	%fcc3,	loop_921
	tne	%xcc,	0x6
	stb	%o5,	[%l7 + 0x7B]
	brlez	%l3,	loop_922
loop_921:
	movn	%xcc,	%g7,	%i5
	edge16ln	%g2,	%g4,	%i3
	movleu	%icc,	%i4,	%o1
loop_922:
	move	%icc,	%i0,	%o0
	tcs	%xcc,	0x3
	sir	0x010A
	set	0x0A, %l5
	lduha	[%l7 + %l5] 0x80,	%i6
	movrgez	%o2,	0x3CC,	%i2
	std	%o6,	[%l7 + 0x28]
	srlx	%i1,	%l6,	%l5
	prefetch	[%l7 + 0x68],	 0x3
	sra	%g3,	0x05,	%o4
	movrlz	%l2,	0x134,	%l1
	or	%g5,	%o3,	%g1
	fbuge	%fcc0,	loop_923
	tsubcctv	%o6,	0x13D4,	%l0
	edge8	%g6,	%l4,	%o5
	andn	%l3,	0x1851,	%i7
loop_923:
	ldd	[%l7 + 0x20],	%f28
	andcc	%i5,	0x03E5,	%g2
	bcs,a	loop_924
	ldsb	[%l7 + 0x31],	%g4
	array32	%g7,	%i4,	%o1
	alignaddrl	%i0,	%i3,	%i6
loop_924:
	tcs	%icc,	0x1
	sir	0x0DF0
	orncc	%o2,	%o0,	%i2
	edge32ln	%i1,	%o7,	%l6
	sdivcc	%g3,	0x1CE4,	%l5
	andn	%o4,	0x0092,	%l2
	ldx	[%l7 + 0x18],	%g5
	udivcc	%o3,	0x1B8C,	%l1
	fmovsg	%icc,	%f14,	%f21
	udiv	%o6,	0x150E,	%g1
	movn	%xcc,	%g6,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%xcc,	%f18,	%f30
	set	0x30, %l1
	lduwa	[%l7 + %l1] 0x10,	%l0
	edge16ln	%o5,	%l3,	%i5
	edge32n	%g2,	%g4,	%i7
	fmovrsgez	%i4,	%f25,	%f0
	fpsub16	%f0,	%f24,	%f28
	movcs	%xcc,	%o1,	%g7
	movrgz	%i0,	%i6,	%o2
	edge16l	%i3,	%o0,	%i2
	bpos,a,pt	%icc,	loop_925
	fcmpeq16	%f20,	%f24,	%o7
	andcc	%l6,	0x1CD5,	%g3
	taddcctv	%i1,	0x1359,	%o4
loop_925:
	movgu	%xcc,	%l5,	%g5
	udivx	%l2,	0x0B8E,	%l1
	movcc	%xcc,	%o6,	%o3
	fmovde	%icc,	%f6,	%f15
	xorcc	%g6,	0x099E,	%l4
	edge16	%l0,	%o5,	%l3
	tl	%xcc,	0x1
	ta	%xcc,	0x0
	edge16	%i5,	%g2,	%g4
	fmul8x16	%f14,	%f0,	%f2
	fands	%f19,	%f10,	%f26
	stb	%g1,	[%l7 + 0x3B]
	movrgez	%i7,	0x2C8,	%o1
	array32	%i4,	%i0,	%i6
	bl,pn	%xcc,	loop_926
	bne	loop_927
	movvc	%icc,	%o2,	%g7
	udiv	%o0,	0x1AE4,	%i3
loop_926:
	tvs	%xcc,	0x7
loop_927:
	fmovrdne	%i2,	%f26,	%f14
	ta	%icc,	0x2
	fbule	%fcc2,	loop_928
	andncc	%l6,	%o7,	%g3
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x54] %asi,	%o4
loop_928:
	fbg,a	%fcc1,	loop_929
	or	%l5,	0x1E79,	%i1
	tcc	%xcc,	0x0
	udiv	%l2,	0x08A1,	%l1
loop_929:
	sdivcc	%g5,	0x030E,	%o6
	movne	%icc,	%g6,	%l4
	brgez,a	%o3,	loop_930
	fmovsle	%xcc,	%f14,	%f26
	tcc	%xcc,	0x4
	tleu	%icc,	0x3
loop_930:
	ldsb	[%l7 + 0x3E],	%o5
	fxnor	%f14,	%f30,	%f4
	fpsub32	%f6,	%f8,	%f24
	andn	%l0,	0x1D91,	%l3
	ldstub	[%l7 + 0x14],	%g2
	set	0x5C, %o7
	ldsha	[%l7 + %o7] 0x14,	%g4
	edge8	%i5,	%g1,	%o1
	tne	%icc,	0x7
	xorcc	%i7,	%i0,	%i4
	tvc	%xcc,	0x1
	udivx	%o2,	0x0A6D,	%i6
	fbul	%fcc1,	loop_931
	ldsw	[%l7 + 0x08],	%o0
	sllx	%g7,	%i3,	%l6
	bcs,pn	%icc,	loop_932
loop_931:
	fandnot1	%f10,	%f12,	%f14
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_932:
	fmovd	%f22,	%f8
	stb	%i2,	[%l7 + 0x25]
	sll	%g3,	0x0E,	%o4
	fbg	%fcc1,	loop_933
	edge32l	%o7,	%i1,	%l5
	swap	[%l7 + 0x58],	%l1
	tg	%icc,	0x2
loop_933:
	tn	%xcc,	0x3
	alignaddrl	%g5,	%l2,	%o6
	sllx	%l4,	0x1B,	%g6
	orcc	%o3,	%l0,	%o5
	bg	loop_934
	fxors	%f10,	%f24,	%f30
	fcmpeq32	%f20,	%f18,	%g2
	tsubcc	%l3,	%i5,	%g1
loop_934:
	movge	%xcc,	%o1,	%i7
	movrlz	%i0,	%i4,	%g4
	movrlz	%o2,	%o0,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g7,	%i3,	%l6
	srl	%g3,	%o4,	%o7
	movgu	%icc,	%i2,	%l5
	movcs	%xcc,	%l1,	%g5
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%f16
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	and	%i1,	0x0BA1,	%o6
	movge	%icc,	%l2,	%l4
	fmovsg	%xcc,	%f18,	%f10
	fmovscc	%icc,	%f22,	%f31
	edge16ln	%g6,	%l0,	%o5
	edge8n	%o3,	%g2,	%i5
	fbe	%fcc3,	loop_935
	sllx	%l3,	0x00,	%o1
	fand	%f14,	%f2,	%f18
	movrlz	%i7,	0x00F,	%g1
loop_935:
	fmovrdlez	%i0,	%f4,	%f16
	srlx	%g4,	0x0D,	%i4
	fbe,a	%fcc1,	loop_936
	edge32l	%o2,	%o0,	%g7
	tgu	%xcc,	0x3
	sllx	%i3,	0x17,	%l6
loop_936:
	movl	%xcc,	%g3,	%o4
	edge32n	%i6,	%i2,	%o7
	bl,pn	%icc,	loop_937
	fbne	%fcc1,	loop_938
	bgu	%icc,	loop_939
	fmovrsgz	%l5,	%f19,	%f26
loop_937:
	alignaddr	%g5,	%i1,	%l1
loop_938:
	alignaddrl	%l2,	%l4,	%g6
loop_939:
	movrgz	%l0,	0x04D,	%o6
	tn	%xcc,	0x6
	st	%f7,	[%l7 + 0x58]
	wr	%g0,	0x2f,	%asi
	stba	%o5,	[%l7 + 0x7D] %asi
	membar	#Sync
	tleu	%xcc,	0x7
	fblg,a	%fcc0,	loop_940
	edge32n	%g2,	%i5,	%l3
	ldsh	[%l7 + 0x7A],	%o1
	nop
	set	0x7C, %g6
	stw	%o3,	[%l7 + %g6]
loop_940:
	fandnot2s	%f11,	%f10,	%f18
	srlx	%i7,	%i0,	%g4
	edge16	%g1,	%o2,	%i4
	tcs	%xcc,	0x4
	fsrc2s	%f0,	%f8
	nop
	setx	loop_941,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8n	%g7,	%i3,	%l6
	wr	%g0,	0xea,	%asi
	stwa	%o0,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_941:
	fabsd	%f16,	%f28
	edge16	%o4,	%i6,	%i2
	fmovdvs	%xcc,	%f26,	%f18
	andcc	%g3,	0x0EAC,	%l5
	andncc	%g5,	%i1,	%l1
	fmul8ulx16	%f20,	%f0,	%f8
	umulcc	%o7,	%l4,	%g6
	fmovdgu	%xcc,	%f3,	%f14
	subccc	%l2,	0x0008,	%l0
	smulcc	%o6,	%o5,	%i5
	alignaddr	%l3,	%g2,	%o1
	ta	%icc,	0x6
	fbo	%fcc2,	loop_942
	udiv	%i7,	0x1093,	%i0
	movrlz	%o3,	%g1,	%o2
	fandnot2s	%f6,	%f30,	%f27
loop_942:
	tsubcc	%i4,	%g7,	%i3
	edge8ln	%g4,	%o0,	%l6
	movn	%icc,	%i6,	%o4
	fzeros	%f12
	fmovdle	%xcc,	%f23,	%f24
	edge8n	%i2,	%l5,	%g3
	edge8n	%i1,	%l1,	%o7
	umul	%g5,	%l4,	%l2
	movrne	%l0,	%o6,	%o5
	te	%xcc,	0x1
	prefetch	[%l7 + 0x24],	 0x0
	and	%g6,	%i5,	%l3
	brlz,a	%o1,	loop_943
	te	%icc,	0x3
	bvc,a,pn	%xcc,	loop_944
	fmovsvs	%xcc,	%f15,	%f8
loop_943:
	xorcc	%i7,	0x0EAC,	%g2
	fbuge,a	%fcc2,	loop_945
loop_944:
	edge8n	%i0,	%o3,	%g1
	movvs	%icc,	%o2,	%i4
	srlx	%i3,	0x06,	%g4
loop_945:
	edge8ln	%o0,	%g7,	%i6
	movge	%icc,	%o4,	%l6
	subccc	%l5,	0x1844,	%i2
	fsrc1s	%f11,	%f22
	addccc	%i1,	%l1,	%g3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x41] %asi,	%o7
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%l2
	edge32ln	%l0,	%g5,	%o5
	sra	%o6,	0x05,	%g6
	call	loop_946
	xnorcc	%i5,	0x1B02,	%l3
	movne	%xcc,	%o1,	%i7
	subccc	%i0,	%g2,	%g1
loop_946:
	tge	%icc,	0x0
	sra	%o3,	0x10,	%i4
	mulscc	%o2,	%g4,	%o0
	fnand	%f4,	%f26,	%f26
	sub	%i3,	%i6,	%g7
	umul	%l6,	%l5,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f25,	%f26
	edge8n	%i1,	%i2,	%l1
	movcc	%xcc,	%g3,	%o7
	mulscc	%l4,	%l0,	%l2
	fmovsn	%icc,	%f27,	%f14
	flush	%l7 + 0x60
	taddcc	%o5,	0x1FC4,	%g5
	fbuge,a	%fcc1,	loop_947
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f18,	%f16,	%f4
	fmovdgu	%xcc,	%f0,	%f9
loop_947:
	edge16n	%o6,	%g6,	%i5
	fcmple16	%f10,	%f28,	%l3
	tl	%icc,	0x7
	bcs	loop_948
	bg,pn	%icc,	loop_949
	movrlz	%i7,	%o1,	%g2
	fbge,a	%fcc1,	loop_950
loop_948:
	tn	%icc,	0x6
loop_949:
	faligndata	%f18,	%f8,	%f30
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x10] %asi,	%g0
loop_950:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i0,	0x04D7,	%i4
	set	0x0E, %g7
	lduha	[%l7 + %g7] 0x80,	%o2
	srl	%o3,	0x0E,	%o0
	alignaddr	%i3,	%g4,	%i6
	movrlez	%l6,	%l5,	%g7
	and	%o4,	0x1DD1,	%i1
	taddcctv	%i2,	0x0A60,	%l1
	fmul8x16al	%f5,	%f28,	%f28
	xnorcc	%o7,	0x020F,	%l4
	movrlez	%l0,	0x306,	%g3
	fmovsg	%icc,	%f15,	%f22
	addc	%l2,	0x1F9B,	%o5
	fmovse	%icc,	%f28,	%f23
	call	loop_951
	edge16	%g5,	%o6,	%i5
	bpos,a	loop_952
	mova	%xcc,	%g6,	%i7
loop_951:
	movrgez	%l3,	%o1,	%g1
	fmovdvc	%icc,	%f24,	%f18
loop_952:
	movgu	%icc,	%g2,	%i0
	tsubcc	%i4,	%o2,	%o3
	fnands	%f8,	%f1,	%f8
	movrne	%o0,	%i3,	%g4
	swap	[%l7 + 0x64],	%i6
	mulx	%l5,	0x12C6,	%g7
	sllx	%l6,	%i1,	%i2
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o4
	smul	%o7,	0x0DEC,	%l1
	sdivx	%l4,	0x015D,	%g3
	sra	%l2,	%o5,	%g5
	fmovsne	%xcc,	%f6,	%f4
	movle	%icc,	%l0,	%o6
	std	%i4,	[%l7 + 0x38]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i7,	%g6,	%o1
	smulcc	%g1,	0x0119,	%l3
	fmovrdlz	%i0,	%f4,	%f2
	array16	%g2,	%i4,	%o2
	tcc	%icc,	0x3
	te	%icc,	0x5
	sir	0x0A81
	smulcc	%o3,	%o0,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g4,	%i6,	%l5
	fzeros	%f28
	tvs	%icc,	0x5
	fbg,a	%fcc1,	loop_953
	edge8n	%g7,	%i1,	%i2
	andncc	%l6,	%o4,	%o7
	stbar
loop_953:
	movg	%icc,	%l4,	%l1
	tsubcc	%g3,	0x0D0D,	%o5
	andn	%g5,	%l0,	%l2
	sdivcc	%i5,	0x1D72,	%o6
	set	0x0E, %i0
	stha	%g6,	[%l7 + %i0] 0xeb
	membar	#Sync
	sdivx	%o1,	0x04A2,	%i7
	stb	%l3,	[%l7 + 0x1F]
	movleu	%xcc,	%g1,	%g2
	udivcc	%i0,	0x1C8E,	%i4
	andcc	%o2,	%o3,	%i3
	movleu	%xcc,	%g4,	%o0
	fsrc1s	%f19,	%f31
	wr	%g0,	0x19,	%asi
	stda	%i6,	[%l7 + 0x48] %asi
	bne,pn	%icc,	loop_954
	sethi	0x0A3E,	%l5
	tsubcctv	%i1,	%g7,	%i2
	tcs	%icc,	0x4
loop_954:
	fbu	%fcc3,	loop_955
	tvs	%xcc,	0x2
	fbe	%fcc1,	loop_956
	popc	0x0037,	%l6
loop_955:
	tvc	%xcc,	0x6
	set	0x36, %o3
	lduha	[%l7 + %o3] 0x0c,	%o4
loop_956:
	fbn	%fcc0,	loop_957
	fcmps	%fcc0,	%f21,	%f20
	orncc	%o7,	0x1E5D,	%l1
	srax	%g3,	0x0B,	%o5
loop_957:
	movneg	%icc,	%g5,	%l4
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x68] %asi,	%l0
	popc	0x1000,	%l2
	xnorcc	%i5,	%o6,	%o1
	movre	%i7,	%l3,	%g6
	bneg	loop_958
	sllx	%g1,	0x06,	%g2
	sll	%i4,	%i0,	%o2
	and	%i3,	%o3,	%g4
loop_958:
	tne	%xcc,	0x6
	tle	%xcc,	0x5
	fbo,a	%fcc3,	loop_959
	fpadd16s	%f12,	%f11,	%f4
	sdivx	%i6,	0x00A0,	%l5
	ldd	[%l7 + 0x60],	%i0
loop_959:
	nop
	setx loop_960, %l0, %l1
	jmpl %l1, %g7
	tneg	%xcc,	0x5
	taddcctv	%i2,	%l6,	%o0
	tne	%xcc,	0x0
loop_960:
	or	%o4,	%l1,	%g3
	fandnot2s	%f30,	%f18,	%f4
	add	%o7,	%g5,	%o5
	edge16	%l4,	%l0,	%i5
	movne	%icc,	%l2,	%o6
	fmovdcc	%icc,	%f15,	%f29
	brlz,a	%o1,	loop_961
	tcs	%icc,	0x5
	tge	%xcc,	0x0
	fmovsge	%icc,	%f17,	%f4
loop_961:
	fpsub32	%f30,	%f0,	%f24
	set	0x44, %o1
	stha	%i7,	[%l7 + %o1] 0xe2
	membar	#Sync
	tne	%icc,	0x7
	fmovs	%f2,	%f10
	tleu	%icc,	0x6
	edge16l	%l3,	%g6,	%g2
	sdivx	%i4,	0x1A38,	%g1
	brlz,a	%i0,	loop_962
	movre	%o2,	0x0C7,	%i3
	movrgez	%o3,	%g4,	%i6
	bcc,pt	%icc,	loop_963
loop_962:
	smul	%i1,	0x0752,	%g7
	tn	%icc,	0x1
	fnot2s	%f1,	%f29
loop_963:
	srl	%i2,	0x08,	%l6
	umul	%l5,	%o4,	%l1
	movrgz	%o0,	0x375,	%g3
	sll	%g5,	%o5,	%l4
	tge	%icc,	0x0
	srl	%l0,	0x12,	%i5
	andcc	%o7,	0x0CA0,	%o6
	fba,a	%fcc2,	loop_964
	addccc	%o1,	0x099C,	%l2
	movrgez	%i7,	0x11B,	%g6
	andncc	%l3,	%g2,	%i4
loop_964:
	nop
	set	0x40, %o0
	std	%f4,	[%l7 + %o0]
	tg	%icc,	0x1
	edge32l	%g1,	%o2,	%i3
	edge8l	%o3,	%i0,	%i6
	tsubcctv	%g4,	%i1,	%g7
	fmovrslz	%i2,	%f9,	%f29
	fbue	%fcc1,	loop_965
	brnz	%l5,	loop_966
	edge16ln	%l6,	%l1,	%o4
	std	%f18,	[%l7 + 0x58]
loop_965:
	fmovrsne	%g3,	%f12,	%f17
loop_966:
	addccc	%g5,	%o5,	%o0
	edge8	%l0,	%l4,	%o7
	sir	0x1AFE
	fmovdvc	%xcc,	%f11,	%f24
	subcc	%o6,	%o1,	%l2
	movrlz	%i7,	%g6,	%l3
	fblg	%fcc0,	loop_967
	movcs	%xcc,	%i5,	%i4
	sllx	%g2,	%o2,	%i3
	edge32n	%g1,	%o3,	%i6
loop_967:
	movge	%icc,	%g4,	%i0
	alignaddrl	%g7,	%i1,	%i2
	or	%l6,	0x0B0F,	%l1
	array8	%o4,	%l5,	%g5
	movg	%icc,	%g3,	%o0
	tsubcc	%l0,	%o5,	%l4
	sethi	0x0B51,	%o6
	fand	%f30,	%f0,	%f26
	set	0x3C, %i7
	swapa	[%l7 + %i7] 0x80,	%o1
	fbl,a	%fcc1,	loop_968
	sdivx	%l2,	0x1CB2,	%o7
	popc	%g6,	%l3
	set	0x18, %l2
	stda	%i4,	[%l7 + %l2] 0x27
	membar	#Sync
loop_968:
	taddcctv	%i7,	%g2,	%i4
	fandnot1	%f12,	%f30,	%f2
	wr	%g0,	0x22,	%asi
	stxa	%i3,	[%l7 + 0x10] %asi
	membar	#Sync
	tpos	%xcc,	0x0
	or	%g1,	0x11DE,	%o2
	fmovdvs	%icc,	%f15,	%f12
	udivx	%i6,	0x0484,	%g4
	srlx	%o3,	0x01,	%i0
	tcc	%icc,	0x6
	set	0x28, %l6
	ldswa	[%l7 + %l6] 0x15,	%g7
	xor	%i2,	%i1,	%l1
	set	0x56, %l4
	ldstuba	[%l7 + %l4] 0x88,	%l6
	mulscc	%l5,	0x10B7,	%o4
	std	%g4,	[%l7 + 0x68]
	fnot1s	%f26,	%f21
	movvc	%icc,	%o0,	%g3
	ldsb	[%l7 + 0x1C],	%l0
	or	%l4,	0x0A11,	%o6
	fbule	%fcc3,	loop_969
	tge	%icc,	0x0
	edge32l	%o5,	%o1,	%o7
	edge32l	%l2,	%l3,	%i5
loop_969:
	orcc	%g6,	0x07FD,	%i7
	stb	%i4,	[%l7 + 0x64]
	orcc	%g2,	0x1F43,	%i3
	fbn	%fcc3,	loop_970
	fsrc2s	%f5,	%f5
	edge8	%o2,	%g1,	%g4
	udivx	%o3,	0x0D2C,	%i6
loop_970:
	smulcc	%g7,	0x116C,	%i0
	wr	%g0,	0x89,	%asi
	stda	%i2,	[%l7 + 0x18] %asi
	bcc	%xcc,	loop_971
	fbl,a	%fcc2,	loop_972
	bneg	%icc,	loop_973
	membar	0x5C
loop_971:
	move	%xcc,	%i1,	%l1
loop_972:
	subcc	%l5,	0x19D9,	%o4
loop_973:
	edge16l	%l6,	%o0,	%g3
	movle	%icc,	%g5,	%l4
	move	%icc,	%o6,	%o5
	srl	%o1,	%l0,	%o7
	fpadd16s	%f26,	%f20,	%f0
	udivx	%l2,	0x1F1E,	%l3
	fmovspos	%icc,	%f20,	%f28
	be,pt	%xcc,	loop_974
	movrlz	%g6,	%i7,	%i4
	for	%f2,	%f8,	%f14
	taddcc	%i5,	%i3,	%o2
loop_974:
	array8	%g2,	%g1,	%o3
	movrgez	%i6,	0x218,	%g7
	mova	%icc,	%g4,	%i2
	edge32ln	%i1,	%l1,	%l5
	fbge,a	%fcc3,	loop_975
	move	%icc,	%i0,	%o4
	srlx	%l6,	0x09,	%g3
	brnz	%g5,	loop_976
loop_975:
	movge	%xcc,	%o0,	%l4
	movvs	%icc,	%o5,	%o1
	set	0x35, %g4
	lduba	[%l7 + %g4] 0x81,	%o6
loop_976:
	fbn,a	%fcc2,	loop_977
	movvc	%icc,	%l0,	%l2
	fandnot2	%f16,	%f24,	%f14
	subccc	%o7,	0x0240,	%l3
loop_977:
	fmovdcs	%icc,	%f9,	%f3
	addc	%g6,	%i4,	%i7
	bg,a	loop_978
	xorcc	%i5,	0x11DA,	%i3
	subccc	%o2,	0x1C0A,	%g1
	fsrc2s	%f20,	%f14
loop_978:
	xnorcc	%g2,	0x1B1D,	%o3
	umul	%i6,	0x1A4C,	%g7
	tn	%icc,	0x1
	fmovdne	%icc,	%f31,	%f8
	orncc	%g4,	0x0728,	%i1
	bcs,a	loop_979
	fbule	%fcc3,	loop_980
	movle	%xcc,	%i2,	%l1
	edge16n	%i0,	%l5,	%o4
loop_979:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f0,	[%l7 + 0x10] %asi
loop_980:
	sra	%g3,	%g5,	%o0
	sllx	%l6,	%l4,	%o5
	movvs	%xcc,	%o1,	%o6
	fmovsleu	%icc,	%f6,	%f13
	fbge	%fcc2,	loop_981
	bn,a,pt	%icc,	loop_982
	fpsub32s	%f14,	%f18,	%f16
	add	%l2,	%o7,	%l0
loop_981:
	tpos	%icc,	0x1
loop_982:
	movrne	%l3,	0x22C,	%i4
	membar	0x31
	brnz,a	%g6,	loop_983
	sll	%i7,	%i5,	%o2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%g2
loop_983:
	udiv	%i3,	0x1A07,	%o3
	be,a	loop_984
	fmovdleu	%icc,	%f18,	%f1
	srlx	%g7,	0x1B,	%g4
	te	%xcc,	0x3
loop_984:
	edge32l	%i1,	%i2,	%i6
	movneg	%icc,	%i0,	%l1
	tcs	%xcc,	0x0
	xnorcc	%l5,	0x074B,	%g3
	set	0x7D, %i5
	stba	%o4,	[%l7 + %i5] 0x10
	fmovda	%xcc,	%f6,	%f20
	set	0x42, %g5
	ldsha	[%l7 + %g5] 0x15,	%g5
	movcs	%xcc,	%o0,	%l4
	fblg	%fcc1,	loop_985
	ldstub	[%l7 + 0x55],	%l6
	mulscc	%o1,	%o5,	%l2
	ba,a,pn	%xcc,	loop_986
loop_985:
	fxor	%f22,	%f4,	%f6
	movpos	%icc,	%o7,	%o6
	ble,a,pt	%xcc,	loop_987
loop_986:
	orcc	%l3,	%l0,	%g6
	fbe,a	%fcc0,	loop_988
	fandnot1s	%f8,	%f11,	%f10
loop_987:
	fxnor	%f4,	%f10,	%f2
	fcmpd	%fcc0,	%f28,	%f28
loop_988:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x59] %asi,	%i4
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x14] %asi,	%i5
	brgz	%i7,	loop_989
	fbu,a	%fcc0,	loop_990
	movn	%icc,	%g1,	%o2
	movvc	%icc,	%i3,	%o3
loop_989:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%g7,	%g4
loop_990:
	bshuffle	%f4,	%f26,	%f12
	set	0x30, %l0
	lda	[%l7 + %l0] 0x19,	%f16
	movgu	%icc,	%i1,	%i2
	fmovsvc	%icc,	%f27,	%f20
	movneg	%xcc,	%g2,	%i6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x1
	srlx	%l1,	%g3,	%o4
	edge16n	%g5,	%o0,	%l5
	brz,a	%l4,	loop_991
	brz	%l6,	loop_992
	array16	%o1,	%o5,	%l2
	xor	%o7,	%l3,	%l0
loop_991:
	subccc	%o6,	0x189C,	%g6
loop_992:
	ta	%xcc,	0x1
	sdivx	%i5,	0x0248,	%i4
	taddcc	%i7,	%g1,	%o2
	sdiv	%i3,	0x0C28,	%o3
	stx	%g7,	[%l7 + 0x08]
	bvc,a,pt	%xcc,	loop_993
	fpsub16s	%f2,	%f5,	%f10
	subc	%g4,	0x1279,	%i2
	fmovse	%xcc,	%f31,	%f2
loop_993:
	st	%f12,	[%l7 + 0x74]
	xnorcc	%g2,	0x189F,	%i6
	ba,a	%xcc,	loop_994
	taddcctv	%i0,	%l1,	%g3
	nop
	set	0x2C, %i4
	lduh	[%l7 + %i4],	%i1
	addcc	%g5,	%o4,	%l5
loop_994:
	tl	%icc,	0x1
	fbule,a	%fcc1,	loop_995
	bg,pt	%xcc,	loop_996
	fpadd32s	%f28,	%f0,	%f29
	addcc	%o0,	%l4,	%l6
loop_995:
	edge16n	%o1,	%o5,	%o7
loop_996:
	bg,pt	%icc,	loop_997
	fornot1s	%f10,	%f2,	%f19
	swap	[%l7 + 0x7C],	%l3
	andncc	%l0,	%o6,	%g6
loop_997:
	fxnor	%f30,	%f24,	%f10
	fandnot1s	%f28,	%f9,	%f31
	sub	%i5,	0x1DE5,	%i4
	fmul8x16al	%f15,	%f0,	%f2
	fbge	%fcc3,	loop_998
	fexpand	%f29,	%f18
	sethi	0x0444,	%i7
	movrlz	%g1,	0x102,	%o2
loop_998:
	fone	%f14
	move	%icc,	%l2,	%o3
	sethi	0x05A7,	%g7
	smul	%i3,	%i2,	%g4
	fmovdvc	%xcc,	%f24,	%f28
	xnor	%g2,	0x1822,	%i6
	fmuld8ulx16	%f9,	%f31,	%f18
	sethi	0x14D8,	%i0
	smul	%g3,	0x0942,	%i1
	edge16	%g5,	%l1,	%l5
	sll	%o0,	0x12,	%l4
	and	%o4,	%o1,	%l6
	movl	%icc,	%o7,	%l3
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	taddcctv	%o5,	0x0186,	%o6
	udivx	%l0,	0x0D35,	%i5
	tvc	%icc,	0x7
	movrlz	%i4,	0x163,	%g6
	andncc	%g1,	%o2,	%l2
	bcs,a,pt	%icc,	loop_999
	umul	%i7,	%o3,	%i3
	mova	%xcc,	%i2,	%g4
	fcmpne32	%f28,	%f0,	%g2
loop_999:
	fmovdn	%icc,	%f26,	%f11
	movn	%icc,	%i6,	%i0
	tvs	%xcc,	0x1
	fpsub32s	%f9,	%f18,	%f3
	ba,a,pn	%icc,	loop_1000
	fmovdgu	%icc,	%f28,	%f15
	smul	%g3,	0x0746,	%g7
	popc	%g5,	%l1
loop_1000:
	brgez,a	%l5,	loop_1001
	sra	%o0,	%i1,	%l4
	brlz	%o1,	loop_1002
	or	%o4,	0x13F5,	%l6
loop_1001:
	fpadd16s	%f4,	%f3,	%f27
	movrgez	%l3,	%o5,	%o6
loop_1002:
	bneg,a	loop_1003
	srax	%l0,	%o7,	%i4
	fornot1	%f30,	%f6,	%f14
	sub	%g6,	%g1,	%i5
loop_1003:
	srax	%o2,	%i7,	%o3
	sir	0x162C
	andcc	%l2,	0x0563,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x55],	%g4
	lduh	[%l7 + 0x5A],	%g2
	addc	%i3,	0x18FF,	%i0
	subc	%i6,	0x0664,	%g3
	xor	%g7,	0x1F56,	%l1
	fmovdne	%icc,	%f9,	%f19
	movrgez	%l5,	%g5,	%i1
	fmovdne	%icc,	%f11,	%f8
	tvc	%icc,	0x5
	mulscc	%l4,	0x0469,	%o0
	array16	%o4,	%l6,	%o1
	fnot2	%f0,	%f6
	tge	%icc,	0x5
	popc	%l3,	%o6
	fbul,a	%fcc3,	loop_1004
	tgu	%xcc,	0x2
	movcs	%icc,	%l0,	%o5
	bvs	loop_1005
loop_1004:
	movvs	%xcc,	%o7,	%i4
	ba,a	%xcc,	loop_1006
	movge	%icc,	%g6,	%g1
loop_1005:
	edge32	%i5,	%i7,	%o3
	andcc	%l2,	%i2,	%o2
loop_1006:
	nop
	set	0x50, %i6
	ldstuba	[%l7 + %i6] 0x04,	%g4
	addc	%i3,	%g2,	%i0
	edge32n	%i6,	%g7,	%l1
	tcs	%xcc,	0x6
	fmovdvc	%icc,	%f26,	%f10
	fmovdn	%icc,	%f29,	%f4
	taddcc	%l5,	0x0BFE,	%g5
	andncc	%i1,	%l4,	%o0
	stb	%g3,	[%l7 + 0x0B]
	tleu	%xcc,	0x2
	orncc	%l6,	%o4,	%o1
	movrgez	%l3,	%o6,	%o5
	ldsh	[%l7 + 0x4E],	%l0
	membar	0x1B
	movrne	%o7,	0x366,	%i4
	edge16ln	%g1,	%i5,	%i7
	tneg	%icc,	0x5
	addccc	%g6,	%l2,	%o3
	movrne	%i2,	0x3FA,	%g4
	fornot1s	%f13,	%f8,	%f31
	fmovsne	%icc,	%f15,	%f19
	edge8	%i3,	%g2,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg	loop_1007
	fcmpgt32	%f22,	%f14,	%o2
	movpos	%xcc,	%g7,	%i6
	array32	%l5,	%g5,	%i1
loop_1007:
	udivx	%l1,	0x06D1,	%l4
	fcmple32	%f26,	%f6,	%o0
	movl	%xcc,	%l6,	%g3
	taddcc	%o4,	%o1,	%l3
	bleu,pt	%icc,	loop_1008
	tge	%icc,	0x0
	movrne	%o6,	0x327,	%o5
	edge32l	%o7,	%i4,	%l0
loop_1008:
	orn	%g1,	%i5,	%i7
	brgz,a	%l2,	loop_1009
	tn	%xcc,	0x6
	orn	%g6,	0x0A2E,	%i2
	xnor	%g4,	0x01C1,	%o3
loop_1009:
	movrlez	%g2,	%i3,	%o2
	subc	%i0,	%g7,	%i6
	edge32	%l5,	%i1,	%g5
	fpsub16	%f26,	%f10,	%f18
	sdivcc	%l1,	0x0C85,	%l4
	addccc	%o0,	0x0C8C,	%g3
	edge8n	%l6,	%o1,	%o4
	fornot1s	%f20,	%f28,	%f24
	movpos	%icc,	%l3,	%o5
	andncc	%o6,	%i4,	%l0
	fmovs	%f17,	%f14
	mova	%xcc,	%o7,	%g1
	fmovsgu	%icc,	%f14,	%f24
	edge32ln	%i7,	%i5,	%g6
	edge8ln	%i2,	%l2,	%o3
	be,a,pt	%xcc,	loop_1010
	fzeros	%f28
	fnot2	%f16,	%f0
	lduh	[%l7 + 0x7A],	%g4
loop_1010:
	fnand	%f10,	%f18,	%f16
	srax	%i3,	%g2,	%o2
	sdiv	%i0,	0x118C,	%i6
	te	%icc,	0x1
	nop
	setx loop_1011, %l0, %l1
	jmpl %l1, %g7
	tg	%icc,	0x4
	fnor	%f0,	%f10,	%f10
	sllx	%i1,	%l5,	%g5
loop_1011:
	fbo	%fcc2,	loop_1012
	fmovdg	%icc,	%f0,	%f27
	srl	%l1,	0x01,	%l4
	nop
	setx	loop_1013,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1012:
	siam	0x6
	fnegd	%f30,	%f14
	movrlz	%o0,	%g3,	%o1
loop_1013:
	nop
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x10] %asi,	%o4
	fble	%fcc1,	loop_1014
	bl,a,pt	%icc,	loop_1015
	edge8	%l3,	%o5,	%o6
	bl	%xcc,	loop_1016
loop_1014:
	movcs	%xcc,	%i4,	%l6
loop_1015:
	fmovrdne	%o7,	%f24,	%f24
	tsubcctv	%l0,	0x0BBB,	%i7
loop_1016:
	fabss	%f16,	%f8
	fcmpeq16	%f22,	%f0,	%i5
	fpack16	%f20,	%f3
	movg	%icc,	%g1,	%i2
	fmovs	%f2,	%f28
	tcs	%icc,	0x6
	fxnors	%f9,	%f5,	%f27
	sdivx	%l2,	0x0FFC,	%g6
	tn	%xcc,	0x4
	andcc	%g4,	0x0D2B,	%o3
	wr	%g0,	0x27,	%asi
	stha	%i3,	[%l7 + 0x3A] %asi
	membar	#Sync
	movrgez	%o2,	0x1EF,	%i0
	tpos	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x3D],	%g2
	fbu,a	%fcc3,	loop_1017
	tcc	%icc,	0x7
	fmovrslz	%i6,	%f4,	%f21
	move	%icc,	%i1,	%g7
loop_1017:
	fmovdn	%xcc,	%f12,	%f5
	alignaddrl	%l5,	%l1,	%g5
	fmovrde	%o0,	%f12,	%f10
	fbuge	%fcc1,	loop_1018
	movl	%icc,	%g3,	%l4
	fbl,a	%fcc2,	loop_1019
	fmovrsne	%o1,	%f26,	%f2
loop_1018:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x10],	%o4
loop_1019:
	andncc	%o5,	%o6,	%i4
	tvc	%xcc,	0x2
	edge16l	%l3,	%l6,	%l0
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x10] %asi,	%i6
	sub	%o7,	0x0A7A,	%i5
	addccc	%g1,	%i2,	%l2
	tl	%icc,	0x6
	tsubcctv	%g4,	%o3,	%g6
	subcc	%i3,	%i0,	%g2
	xor	%i6,	%o2,	%g7
	taddcctv	%i1,	0x0A65,	%l1
	edge16	%g5,	%o0,	%g3
	fmovdvc	%xcc,	%f23,	%f17
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x78] %asi,	%l4
	fmovd	%f8,	%f16
	set	0x78, %l3
	stxa	%o1,	[%l7 + %l3] 0x2b
	membar	#Sync
	fornot2s	%f11,	%f22,	%f3
	fbl	%fcc1,	loop_1020
	edge16n	%l5,	%o5,	%o4
	fmovdn	%xcc,	%f2,	%f9
	andcc	%o6,	0x006E,	%i4
loop_1020:
	udiv	%l3,	0x1C1D,	%l6
	fbg	%fcc2,	loop_1021
	fand	%f20,	%f4,	%f2
	fmovsle	%xcc,	%f21,	%f5
	mova	%xcc,	%l0,	%i7
loop_1021:
	tn	%icc,	0x6
	orn	%o7,	%i5,	%g1
	brlz,a	%i2,	loop_1022
	std	%f2,	[%l7 + 0x58]
	fbul	%fcc2,	loop_1023
	smulcc	%g4,	0x03F3,	%l2
loop_1022:
	mulx	%o3,	%i3,	%g6
	or	%g2,	0x12D6,	%i6
loop_1023:
	orcc	%o2,	%g7,	%i1
	xorcc	%l1,	0x080C,	%i0
	fbo,a	%fcc1,	loop_1024
	movre	%o0,	%g5,	%l4
	wr	%g0,	0x18,	%asi
	stda	%g2,	[%l7 + 0x20] %asi
loop_1024:
	fmovsle	%xcc,	%f26,	%f4
	movre	%o1,	%o5,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%o4
	udivcc	%o6,	0x1B78,	%l3
	fmovsa	%icc,	%f0,	%f24
	sir	0x0A5D
	nop
	setx loop_1025, %l0, %l1
	jmpl %l1, %l6
	sub	%i4,	0x0F3A,	%i7
	sir	0x1051
	movrne	%l0,	0x078,	%o7
loop_1025:
	fabss	%f18,	%f30
	movcs	%xcc,	%g1,	%i5
	addc	%i2,	%g4,	%l2
	sdiv	%o3,	0x1A36,	%g6
	set	0x16, %g2
	stha	%i3,	[%l7 + %g2] 0x15
	bl,a	%xcc,	loop_1026
	movcs	%xcc,	%g2,	%i6
	bshuffle	%f14,	%f20,	%f6
	edge32	%g7,	%o2,	%l1
loop_1026:
	brgez,a	%i1,	loop_1027
	te	%icc,	0x6
	brz,a	%i0,	loop_1028
	flush	%l7 + 0x48
loop_1027:
	edge16n	%o0,	%g5,	%g3
	array16	%l4,	%o1,	%l5
loop_1028:
	fnot1s	%f18,	%f1
	ldx	[%l7 + 0x18],	%o5
	move	%icc,	%o4,	%l3
	fones	%f0
	fpack16	%f24,	%f26
	wr	%g0,	0x27,	%asi
	stba	%l6,	[%l7 + 0x14] %asi
	membar	#Sync
	bleu,a,pt	%xcc,	loop_1029
	sethi	0x1D57,	%o6
	fmuld8ulx16	%f27,	%f12,	%f0
	fnot2	%f16,	%f22
loop_1029:
	tcc	%icc,	0x6
	nop
	setx	loop_1030,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%i4,	%l0,	%i7
	srax	%g1,	0x18,	%i5
	fnot2	%f0,	%f24
loop_1030:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x76] %asi,	%o7
	movre	%i2,	0x09F,	%l2
	fmovdgu	%icc,	%f1,	%f13
	sir	0x1FC2
	movrgez	%o3,	0x048,	%g4
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x44] %asi,	%i3
	mulscc	%g2,	%g6,	%g7
	or	%i6,	0x1C75,	%l1
	array16	%i1,	%o2,	%i0
	tsubcctv	%g5,	0x0A52,	%g3
	ta	%xcc,	0x2
	brgz,a	%l4,	loop_1031
	ld	[%l7 + 0x30],	%f7
	and	%o1,	0x1EB9,	%l5
	mulscc	%o0,	0x1B38,	%o5
loop_1031:
	and	%o4,	%l6,	%l3
	mulscc	%o6,	0x04D1,	%i4
	fbne	%fcc3,	loop_1032
	ble,a,pn	%xcc,	loop_1033
	nop
	set	0x78, %o2
	ldsw	[%l7 + %o2],	%l0
	edge32	%g1,	%i5,	%o7
loop_1032:
	movrlez	%i2,	0x10C,	%l2
loop_1033:
	edge32	%o3,	%i7,	%i3
	fmuld8ulx16	%f20,	%f0,	%f14
	bvs,a,pn	%xcc,	loop_1034
	move	%icc,	%g4,	%g2
	std	%g6,	[%l7 + 0x48]
	fcmpne16	%f8,	%f2,	%i6
loop_1034:
	sll	%g6,	%l1,	%i1
	fnand	%f28,	%f26,	%f2
	sir	0x0160
	fnands	%f4,	%f9,	%f24
	movge	%xcc,	%i0,	%o2
	subccc	%g3,	0x0C0B,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%xcc,	0x4
	fbue,a	%fcc0,	loop_1035
	be	loop_1036
	movrlez	%o1,	%l5,	%o0
	fmovdl	%xcc,	%f6,	%f18
loop_1035:
	edge16l	%o5,	%o4,	%l6
loop_1036:
	stw	%l4,	[%l7 + 0x54]
	fcmpd	%fcc0,	%f14,	%f24
	movrlz	%l3,	0x0A8,	%o6
	taddcc	%i4,	0x0C29,	%l0
	edge16	%g1,	%o7,	%i5
	subccc	%i2,	%l2,	%i7
	fmovsne	%icc,	%f15,	%f16
	bleu,a,pt	%icc,	loop_1037
	std	%f20,	[%l7 + 0x30]
	movpos	%icc,	%i3,	%g4
	bl,pn	%xcc,	loop_1038
loop_1037:
	nop
	setx loop_1039, %l0, %l1
	jmpl %l1, %g2
	srl	%o3,	%i6,	%g6
	fbo	%fcc2,	loop_1040
loop_1038:
	addc	%l1,	%i1,	%i0
loop_1039:
	tleu	%icc,	0x6
	array16	%o2,	%g3,	%g5
loop_1040:
	move	%icc,	%o1,	%g7
	tne	%xcc,	0x1
	add	%o0,	0x162E,	%l5
	std	%o4,	[%l7 + 0x50]
	fnands	%f23,	%f21,	%f31
	fmovrslez	%l6,	%f4,	%f26
	nop
	setx	loop_1041,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbne,a	%fcc2,	loop_1042
	tg	%icc,	0x3
	movle	%xcc,	%l4,	%o4
loop_1041:
	andn	%l3,	0x05FD,	%i4
loop_1042:
	sth	%o6,	[%l7 + 0x58]
	orncc	%g1,	%l0,	%o7
	edge16ln	%i2,	%i5,	%i7
	udiv	%i3,	0x079A,	%l2
	tgu	%icc,	0x5
	sdiv	%g4,	0x1C01,	%o3
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g2
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x04
	be	%icc,	loop_1043
	udiv	%g6,	0x06EC,	%i6
	sllx	%i1,	%i0,	%o2
	st	%f17,	[%l7 + 0x0C]
loop_1043:
	fmovde	%icc,	%f30,	%f21
	add	%g3,	%g5,	%l1
	fbne,a	%fcc0,	loop_1044
	fmul8ulx16	%f18,	%f0,	%f30
	udivx	%o1,	0x12CB,	%o0
	movg	%xcc,	%g7,	%l5
loop_1044:
	bpos	%xcc,	loop_1045
	movpos	%xcc,	%l6,	%l4
	umul	%o5,	0x152A,	%l3
	move	%icc,	%o4,	%o6
loop_1045:
	edge16n	%g1,	%l0,	%o7
	bg	loop_1046
	bneg,pn	%xcc,	loop_1047
	ldd	[%l7 + 0x10],	%f20
	tl	%icc,	0x2
loop_1046:
	xnor	%i4,	%i2,	%i5
loop_1047:
	fpsub32s	%f11,	%f22,	%f0
	tn	%xcc,	0x6
	umulcc	%i7,	0x1A16,	%l2
	tvc	%icc,	0x4
	xnor	%g4,	0x1E58,	%o3
	srlx	%g2,	%g6,	%i3
	wr	%g0,	0xeb,	%asi
	stha	%i6,	[%l7 + 0x7E] %asi
	membar	#Sync
	edge16	%i1,	%o2,	%i0
	edge8	%g5,	%l1,	%g3
	fbg,a	%fcc3,	loop_1048
	fmovdge	%xcc,	%f13,	%f0
	subcc	%o0,	%g7,	%o1
	brlez	%l6,	loop_1049
loop_1048:
	stbar
	subcc	%l5,	0x0DB2,	%o5
	sub	%l4,	0x185B,	%o4
loop_1049:
	tsubcctv	%o6,	%g1,	%l0
	movre	%l3,	%o7,	%i4
	movle	%xcc,	%i5,	%i2
	std	%i6,	[%l7 + 0x38]
	tle	%icc,	0x3
	stb	%l2,	[%l7 + 0x78]
	tsubcc	%g4,	0x021C,	%g2
	tsubcc	%o3,	0x0A12,	%g6
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	array8	%i6,	%i1,	%i3
	sdivx	%i0,	0x1603,	%o2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x0c,	%g5,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x1
	andcc	%g3,	%g7,	%o0
	movrlez	%o1,	%l6,	%l5
	fors	%f3,	%f20,	%f25
	umul	%o5,	0x1B1A,	%l4
	sll	%o6,	%g1,	%l0
	edge8ln	%l3,	%o4,	%i4
	movgu	%xcc,	%o7,	%i5
	array8	%i7,	%l2,	%i2
	fpadd32	%f26,	%f26,	%f0
	set	0x68, %o6
	ldstuba	[%l7 + %o6] 0x11,	%g4
	mova	%xcc,	%g2,	%g6
	movrlez	%i6,	0x0EC,	%o3
	fbge	%fcc0,	loop_1050
	subc	%i3,	%i0,	%i1
	set	0x48, %i3
	lduha	[%l7 + %i3] 0x14,	%g5
loop_1050:
	tn	%icc,	0x1
	movvs	%xcc,	%o2,	%l1
	umul	%g7,	0x084B,	%g3
	set	0x4C, %g3
	ldsba	[%l7 + %g3] 0x80,	%o0
	array32	%o1,	%l6,	%o5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%l4,	%o6
	bg,a	%xcc,	loop_1051
	movrlz	%g1,	%l0,	%l5
	movl	%icc,	%o4,	%l3
	tvc	%icc,	0x7
loop_1051:
	sethi	0x0CFD,	%i4
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x1f,	%f0
	edge32l	%o7,	%i7,	%l2
	ldd	[%l7 + 0x08],	%i4
	fmovsvs	%xcc,	%f22,	%f29
	tl	%xcc,	0x5
	swap	[%l7 + 0x1C],	%g4
	orn	%g2,	%i2,	%i6
	set	0x65, %i1
	stba	%g6,	[%l7 + %i1] 0xea
	membar	#Sync
	movgu	%icc,	%o3,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%icc,	%f8,	%f24
	fmuld8sux16	%f31,	%f22,	%f28
	edge8	%i1,	%i0,	%o2
	xorcc	%l1,	%g5,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g3,	%o1,	%l6
	umul	%o0,	0x0BFA,	%o5
	wr	%g0,	0x81,	%asi
	sta	%f24,	[%l7 + 0x50] %asi
	popc	%l4,	%o6
	array8	%g1,	%l5,	%o4
	tl	%icc,	0x0
	movle	%xcc,	%l0,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f0,	%f14
	sllx	%o7,	0x1F,	%i7
	tvc	%icc,	0x5
	smulcc	%l2,	0x0970,	%l3
	fcmps	%fcc3,	%f25,	%f11
	movge	%xcc,	%g4,	%i5
	tge	%xcc,	0x2
	add	%i2,	0x1452,	%g2
	edge16l	%g6,	%i6,	%o3
	movrgz	%i1,	%i3,	%o2
	umul	%i0,	%l1,	%g7
	xorcc	%g5,	0x1162,	%g3
	movle	%xcc,	%l6,	%o0
	wr	%g0,	0x4f,	%asi
	stxa	%o5,	[%g0 + 0x30] %asi
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	movneg	%xcc,	%o1,	%o6
	fmovrdlez	%l5,	%f2,	%f6
	fsrc2	%f12,	%f2
	fmovsgu	%xcc,	%f20,	%f17
	wr	%g0,	0x20,	%asi
	stxa	%o4,	[%g0 + 0x30] %asi
	edge32l	%g1,	%l0,	%o7
	brz,a	%i7,	loop_1052
	movge	%xcc,	%i4,	%l3
	nop
	setx	loop_1053,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdcs	%xcc,	%f21,	%f28
loop_1052:
	subc	%l2,	0x0A3B,	%g4
	fcmple32	%f22,	%f6,	%i5
loop_1053:
	xnor	%g2,	%i2,	%g6
	subcc	%i6,	0x1C6E,	%i1
	fmovdn	%icc,	%f12,	%f13
	xorcc	%o3,	0x18AD,	%o2
	fmovsa	%icc,	%f14,	%f15
	fmovdg	%xcc,	%f5,	%f27
	fpack16	%f28,	%f8
	sir	0x02AD
	udivx	%i0,	0x1BE6,	%l1
	edge8	%g7,	%g5,	%g3
	fpsub32s	%f3,	%f21,	%f29
	orncc	%l6,	0x1F2F,	%i3
	movge	%xcc,	%o0,	%o5
	sdiv	%l4,	0x00AC,	%o6
	movg	%xcc,	%o1,	%o4
	smulcc	%g1,	%l0,	%l5
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
	fbl,a	%fcc2,	loop_1054
	movg	%xcc,	%i7,	%i4
	movpos	%icc,	%l3,	%g4
	bpos,a,pn	%xcc,	loop_1055
loop_1054:
	brlez	%i5,	loop_1056
	sub	%l2,	%i2,	%g2
	tn	%xcc,	0x1
loop_1055:
	xnor	%g6,	0x1B50,	%i6
loop_1056:
	nop
	wr	%g0,	0xeb,	%asi
	stwa	%i1,	[%l7 + 0x50] %asi
	membar	#Sync
	fmovdcc	%icc,	%f22,	%f28
	nop
	setx	loop_1057,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%xcc,	0x6
	sth	%o2,	[%l7 + 0x68]
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f16
loop_1057:
	fornot1	%f20,	%f6,	%f30
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x29] %asi,	%o3
	set	0x1C, %l5
	ldsba	[%l7 + %l5] 0x80,	%l1
	mulx	%i0,	%g5,	%g3
	brnz	%l6,	loop_1058
	brgez	%i3,	loop_1059
	fmuld8sux16	%f18,	%f22,	%f22
	movre	%g7,	%o0,	%o5
loop_1058:
	bge	%icc,	loop_1060
loop_1059:
	bgu,a,pn	%xcc,	loop_1061
	udivx	%o6,	0x0100,	%o1
	udivx	%l4,	0x0762,	%g1
loop_1060:
	pdist	%f10,	%f20,	%f22
loop_1061:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o4,	%l0,	%o7
	st	%f29,	[%l7 + 0x50]
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x2E] %asi,	%i7
	stx	%i4,	[%l7 + 0x68]
	fmovscc	%icc,	%f23,	%f21
	fmovdn	%xcc,	%f14,	%f3
	movle	%icc,	%l3,	%g4
	subcc	%l5,	%l2,	%i5
	brlez,a	%i2,	loop_1062
	fbule,a	%fcc1,	loop_1063
	tne	%icc,	0x1
	andn	%g2,	%i6,	%g6
loop_1062:
	fmovrdlz	%o2,	%f14,	%f12
loop_1063:
	tcs	%xcc,	0x6
	fmovdneg	%icc,	%f21,	%f24
	add	%i1,	0x00F9,	%o3
	array16	%l1,	%i0,	%g3
	prefetch	[%l7 + 0x1C],	 0x2
	fornot1	%f26,	%f12,	%f20
	tvs	%xcc,	0x4
	bpos,a,pn	%xcc,	loop_1064
	movrgez	%g5,	0x30B,	%i3
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x27] %asi,	%l6
loop_1064:
	alignaddr	%o0,	%o5,	%g7
	movleu	%icc,	%o6,	%o1
	edge32l	%g1,	%l4,	%l0
	smulcc	%o4,	%o7,	%i4
	bl	%xcc,	loop_1065
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%i7,	%f1,	%f24
	edge16	%l3,	%g4,	%l5
loop_1065:
	movcc	%icc,	%i5,	%l2
	edge32n	%i2,	%g2,	%i6
	edge32n	%o2,	%g6,	%i1
	fbn	%fcc0,	loop_1066
	tl	%xcc,	0x3
	fcmple16	%f28,	%f24,	%o3
	edge16l	%i0,	%g3,	%g5
loop_1066:
	bg,a	loop_1067
	ldx	[%l7 + 0x30],	%i3
	xnor	%l1,	0x12FC,	%l6
	udiv	%o5,	0x0420,	%g7
loop_1067:
	srlx	%o6,	0x06,	%o0
	ld	[%l7 + 0x28],	%f3
	movrne	%o1,	0x1D9,	%l4
	orn	%g1,	%o4,	%l0
	fmovrslez	%i4,	%f20,	%f28
	srl	%i7,	0x04,	%l3
	movgu	%xcc,	%o7,	%l5
	fblg,a	%fcc2,	loop_1068
	xor	%g4,	0x0356,	%i5
	movge	%icc,	%i2,	%l2
	movneg	%xcc,	%g2,	%o2
loop_1068:
	fpsub32	%f4,	%f0,	%f22
	fmovsg	%icc,	%f26,	%f27
	andn	%g6,	0x1FE0,	%i1
	fexpand	%f8,	%f4
	fble,a	%fcc2,	loop_1069
	movg	%xcc,	%o3,	%i0
	tneg	%icc,	0x2
	fmovrslez	%g3,	%f6,	%f15
loop_1069:
	andn	%i6,	0x19B0,	%i3
	movg	%icc,	%g5,	%l6
	umulcc	%l1,	0x10F2,	%o5
	movpos	%icc,	%g7,	%o6
	fmul8sux16	%f6,	%f0,	%f2
	fpadd32	%f24,	%f30,	%f8
	nop
	setx loop_1070, %l0, %l1
	jmpl %l1, %o1
	ld	[%l7 + 0x78],	%f23
	array32	%o0,	%l4,	%o4
	movrne	%l0,	%i4,	%g1
loop_1070:
	nop
	set	0x40, %l1
	ldswa	[%l7 + %l1] 0x15,	%i7
	edge16n	%o7,	%l5,	%l3
	ld	[%l7 + 0x58],	%f17
	tgu	%icc,	0x1
	fmovrsgz	%i5,	%f12,	%f23
	udivcc	%i2,	0x0C6C,	%g4
	movre	%g2,	0x16F,	%l2
	sir	0x0B82
	sllx	%g6,	%i1,	%o3
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%i0
	tcc	%icc,	0x7
	fmovdpos	%xcc,	%f6,	%f3
	fmovsvc	%xcc,	%f13,	%f27
	wr	%g0,	0x0c,	%asi
	stwa	%o2,	[%l7 + 0x10] %asi
	fsrc1	%f4,	%f16
	brlz	%i6,	loop_1071
	fbe	%fcc0,	loop_1072
	fmovrslez	%g3,	%f26,	%f2
	sub	%g5,	0x1577,	%l6
loop_1071:
	nop
	setx	loop_1073,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1072:
	ld	[%l7 + 0x70],	%f28
	be	%xcc,	loop_1074
	ldd	[%l7 + 0x30],	%f14
loop_1073:
	fble	%fcc0,	loop_1075
	fsrc1s	%f15,	%f30
loop_1074:
	fbuge,a	%fcc1,	loop_1076
	edge8ln	%l1,	%o5,	%i3
loop_1075:
	sllx	%g7,	%o1,	%o0
	fmovdg	%icc,	%f12,	%f21
loop_1076:
	tvc	%xcc,	0x4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%o6
	udivcc	%o4,	0x1C93,	%i4
	fmovde	%xcc,	%f10,	%f20
	movcs	%xcc,	%g1,	%l0
	movrne	%o7,	%l5,	%l3
	fpadd16s	%f19,	%f2,	%f20
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x81,	%i7,	%i2
	tvs	%icc,	0x3
	add	%i5,	%g2,	%g4
	smul	%g6,	%i1,	%o3
	umulcc	%l2,	0x0EFC,	%i0
	fcmpne32	%f22,	%f20,	%o2
	fbe,a	%fcc2,	loop_1077
	fbne,a	%fcc3,	loop_1078
	orn	%i6,	0x0C11,	%g3
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1077:
	alignaddrl	%g5,	%l6,	%l1
loop_1078:
	ta	%icc,	0x0
	movre	%o5,	0x236,	%i3
	fmovsn	%xcc,	%f27,	%f19
	tgu	%xcc,	0x3
	movleu	%icc,	%o1,	%o0
	umulcc	%l4,	%o6,	%g7
	fmovsvc	%icc,	%f12,	%f30
	bvc,pt	%icc,	loop_1079
	subcc	%i4,	%o4,	%g1
	ldub	[%l7 + 0x6A],	%l0
	movvc	%xcc,	%o7,	%l3
loop_1079:
	xorcc	%l5,	%i2,	%i7
	bne,a,pt	%icc,	loop_1080
	srlx	%i5,	0x05,	%g2
	movge	%icc,	%g6,	%g4
	fbule,a	%fcc2,	loop_1081
loop_1080:
	umul	%o3,	%i1,	%l2
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
loop_1081:
	array16	%i6,	%g3,	%g5
	tgu	%icc,	0x0
	add	%i0,	%l6,	%o5
	and	%i3,	%l1,	%o1
	movge	%icc,	%o0,	%l4
	fbe,a	%fcc1,	loop_1082
	fnot1	%f10,	%f6
	movvc	%icc,	%o6,	%i4
	add	%o4,	%g7,	%l0
loop_1082:
	addcc	%g1,	0x0AB7,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x1C],	%l3
	std	%f22,	[%l7 + 0x78]
	udiv	%l5,	0x15F4,	%i7
	fcmpeq16	%f10,	%f0,	%i2
	te	%xcc,	0x0
	fmovdge	%icc,	%f8,	%f30
	tsubcc	%g2,	0x1AA7,	%i5
	sethi	0x1D08,	%g6
	udiv	%o3,	0x0462,	%g4
	or	%l2,	%i1,	%o2
	bcc,a	loop_1083
	call	loop_1084
	movn	%xcc,	%g3,	%i6
	tneg	%icc,	0x5
loop_1083:
	xorcc	%g5,	0x0102,	%i0
loop_1084:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l6,	0x11D8,	%i3
	tpos	%icc,	0x2
	sth	%o5,	[%l7 + 0x36]
	bvs,pt	%icc,	loop_1085
	prefetch	[%l7 + 0x60],	 0x1
	udivcc	%l1,	0x1FDA,	%o0
	fbule,a	%fcc0,	loop_1086
loop_1085:
	fmovsl	%icc,	%f17,	%f28
	alignaddrl	%l4,	%o1,	%i4
	addccc	%o6,	0x0B36,	%g7
loop_1086:
	movneg	%xcc,	%l0,	%o4
	fabsd	%f28,	%f2
	te	%icc,	0x1
	edge16	%o7,	%g1,	%l3
	sdivx	%l5,	0x06B8,	%i7
	fpadd16	%f28,	%f16,	%f20
	array8	%i2,	%g2,	%i5
	edge8n	%o3,	%g4,	%l2
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x4C] %asi,	%f19
	orcc	%i1,	%o2,	%g3
	edge16	%i6,	%g5,	%i0
	edge32n	%l6,	%g6,	%o5
	umulcc	%i3,	0x04D5,	%l1
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%o0
	fcmpeq32	%f18,	%f10,	%o1
	fmovrdgz	%l4,	%f8,	%f28
	fpadd32s	%f18,	%f27,	%f24
	edge32	%i4,	%g7,	%o6
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tgu	%xcc,	0x3
	movvs	%xcc,	%l0,	%o7
	fbl	%fcc1,	loop_1087
	fbe	%fcc0,	loop_1088
	orcc	%o4,	%l3,	%l5
	edge32l	%i7,	%g1,	%g2
loop_1087:
	movcc	%icc,	%i2,	%i5
loop_1088:
	siam	0x7
	tne	%xcc,	0x7
	bgu,a,pt	%icc,	loop_1089
	fsrc2	%f16,	%f14
	edge8ln	%g4,	%l2,	%i1
	lduh	[%l7 + 0x34],	%o2
loop_1089:
	sra	%g3,	%o3,	%i6
	nop
	setx	loop_1090,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fsrc1s	%f16,	%f24
	fmovsvc	%xcc,	%f22,	%f17
	edge32ln	%g5,	%l6,	%g6
loop_1090:
	xnor	%i0,	%i3,	%l1
	tcc	%xcc,	0x2
	stw	%o5,	[%l7 + 0x0C]
	movneg	%icc,	%o1,	%l4
	stw	%o0,	[%l7 + 0x30]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g7,	0x17,	%o6
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x10] %asi,	%i4
	fbo	%fcc2,	loop_1091
	fmovrslz	%l0,	%f29,	%f9
	srlx	%o7,	%l3,	%o4
	brgz,a	%i7,	loop_1092
loop_1091:
	edge8n	%l5,	%g1,	%g2
	sdiv	%i5,	0x1F84,	%i2
	movn	%xcc,	%l2,	%g4
loop_1092:
	tleu	%xcc,	0x6
	fmovrsgez	%o2,	%f26,	%f3
	tn	%icc,	0x4
	fmovdcs	%icc,	%f31,	%f4
	alignaddrl	%i1,	%o3,	%i6
	ldub	[%l7 + 0x36],	%g3
	ldx	[%l7 + 0x20],	%g5
	brgz	%g6,	loop_1093
	movne	%icc,	%i0,	%i3
	movneg	%icc,	%l6,	%o5
	edge32ln	%l1,	%l4,	%o0
loop_1093:
	xor	%g7,	0x1DD5,	%o6
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x10] %asi,	%o0
	tge	%icc,	0x3
	array16	%i4,	%o7,	%l3
	mulx	%o4,	0x1155,	%l0
	call	loop_1094
	movn	%icc,	%l5,	%i7
	movrlz	%g1,	0x379,	%i5
	mulx	%g2,	0x1DF1,	%i2
loop_1094:
	fmovsge	%icc,	%f31,	%f11
	fpsub16	%f8,	%f24,	%f30
	fmovscs	%icc,	%f14,	%f4
	fbn	%fcc3,	loop_1095
	tn	%icc,	0x4
	tge	%xcc,	0x0
	smulcc	%g4,	%o2,	%i1
loop_1095:
	swap	[%l7 + 0x78],	%o3
	alignaddr	%i6,	%g3,	%l2
	fmovsne	%icc,	%f17,	%f2
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x89
	tne	%xcc,	0x3
	edge8n	%g5,	%i0,	%i3
	ba,pt	%icc,	loop_1096
	fandnot2s	%f7,	%f30,	%f22
	fmovsl	%icc,	%f30,	%f3
	edge8ln	%l6,	%g6,	%o5
loop_1096:
	fmovrsgz	%l1,	%f11,	%f19
	fmovsn	%icc,	%f31,	%f31
	addc	%l4,	%g7,	%o0
	edge8ln	%o6,	%o1,	%o7
	alignaddrl	%l3,	%o4,	%l0
	bl,pt	%xcc,	loop_1097
	fnot1s	%f17,	%f11
	brlez,a	%l5,	loop_1098
	movleu	%xcc,	%i4,	%g1
loop_1097:
	bshuffle	%f28,	%f26,	%f18
	movleu	%xcc,	%i7,	%i5
loop_1098:
	sth	%i2,	[%l7 + 0x44]
	fnot2	%f16,	%f8
	edge8	%g2,	%g4,	%i1
	tn	%xcc,	0x1
	movvs	%xcc,	%o2,	%i6
	ldd	[%l7 + 0x60],	%g2
	fpadd16	%f10,	%f20,	%f22
	fmovdneg	%icc,	%f3,	%f30
	sll	%o3,	%l2,	%g5
	xor	%i3,	%i0,	%g6
	edge8	%o5,	%l6,	%l1
	ldd	[%l7 + 0x60],	%g6
	edge8ln	%o0,	%l4,	%o6
	srlx	%o1,	%l3,	%o4
	xnor	%l0,	0x1323,	%l5
	move	%xcc,	%o7,	%g1
	fnot2s	%f20,	%f4
	tne	%xcc,	0x7
	movneg	%icc,	%i7,	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%i2
	array16	%g4,	%g2,	%o2
	tvs	%icc,	0x4
	tcs	%xcc,	0x2
	movl	%xcc,	%i6,	%i1
	movrlz	%o3,	%l2,	%g5
	addcc	%g3,	0x174B,	%i0
	fble,a	%fcc0,	loop_1099
	fble,a	%fcc0,	loop_1100
	fmovdvs	%xcc,	%f26,	%f22
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%o5
loop_1099:
	edge16ln	%g6,	%l6,	%g7
loop_1100:
	ld	[%l7 + 0x30],	%f14
	sra	%l1,	%l4,	%o0
	fcmpd	%fcc0,	%f18,	%f8
	fcmpne16	%f14,	%f0,	%o6
	udiv	%l3,	0x0011,	%o4
	edge32	%l0,	%o1,	%l5
	smul	%g1,	%i7,	%i4
	tgu	%xcc,	0x4
	movl	%icc,	%i5,	%o7
	fabsd	%f16,	%f14
	movge	%icc,	%g4,	%g2
	movvc	%icc,	%o2,	%i6
	tvc	%xcc,	0x1
	tl	%icc,	0x2
	sub	%i1,	%i2,	%l2
	bcs	loop_1101
	add	%o3,	0x0A2F,	%g5
	andn	%g3,	%i0,	%o5
	sllx	%i3,	%g6,	%g7
loop_1101:
	tle	%icc,	0x6
	fone	%f24
	andncc	%l1,	%l4,	%o0
	fpadd16	%f16,	%f4,	%f20
	umul	%o6,	0x1E48,	%l3
	fmovspos	%xcc,	%f10,	%f22
	movvs	%xcc,	%o4,	%l0
	or	%o1,	%l5,	%l6
	array32	%g1,	%i7,	%i4
	edge8ln	%o7,	%i5,	%g4
	tleu	%xcc,	0x5
	xorcc	%o2,	0x1BE6,	%i6
	tvc	%xcc,	0x4
	fmovrslz	%i1,	%f23,	%f4
	xorcc	%g2,	%l2,	%i2
	movrgez	%g5,	0x14A,	%o3
	fmovs	%f16,	%f12
	sllx	%i0,	0x1C,	%g3
	smul	%i3,	0x0BD4,	%o5
	add	%g6,	0x14FD,	%l1
	xnorcc	%l4,	%o0,	%g7
	fmovs	%f11,	%f3
	fmovdvc	%icc,	%f25,	%f18
	mulscc	%l3,	0x149A,	%o6
	brnz,a	%o4,	loop_1102
	bleu,pt	%icc,	loop_1103
	nop
	setx	loop_1104,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%l0,	%o1,	%l5
loop_1102:
	tsubcctv	%l6,	%i7,	%g1
loop_1103:
	udivcc	%o7,	0x1178,	%i5
loop_1104:
	ld	[%l7 + 0x1C],	%f23
	fsrc2	%f18,	%f20
	or	%g4,	0x0D7A,	%o2
	fmovsleu	%xcc,	%f28,	%f26
	movcs	%xcc,	%i6,	%i1
	mulx	%i4,	0x12D2,	%l2
	std	%g2,	[%l7 + 0x28]
	tvs	%icc,	0x2
	fnot2	%f8,	%f28
	tleu	%xcc,	0x1
	bl	loop_1105
	tcc	%icc,	0x0
	udivcc	%i2,	0x186F,	%o3
	sdivx	%g5,	0x16EC,	%i0
loop_1105:
	add	%g3,	%i3,	%o5
	sethi	0x09CE,	%g6
	add	%l1,	0x0E50,	%o0
	fmovdgu	%xcc,	%f29,	%f28
	move	%xcc,	%l4,	%l3
	nop
	setx	loop_1106,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%icc,	0x6
	edge16	%o6,	%g7,	%o4
	andn	%l0,	0x0739,	%l5
loop_1106:
	fmovse	%xcc,	%f11,	%f7
	movcc	%icc,	%l6,	%i7
	fmul8x16al	%f28,	%f25,	%f28
	ta	%icc,	0x5
	ldsw	[%l7 + 0x58],	%g1
	ldsw	[%l7 + 0x14],	%o7
	ldstub	[%l7 + 0x3B],	%o1
	nop
	setx	loop_1107,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrslez	%g4,	%f13,	%f2
	sdivx	%o2,	0x1F34,	%i6
	faligndata	%f0,	%f24,	%f28
loop_1107:
	fcmpeq16	%f16,	%f8,	%i1
	wr	%g0,	0x23,	%asi
	stda	%i4,	[%l7 + 0x48] %asi
	membar	#Sync
	lduh	[%l7 + 0x1A],	%i4
	movrgz	%g2,	0x0B1,	%l2
	faligndata	%f14,	%f8,	%f20
	tge	%xcc,	0x7
	udiv	%i2,	0x161C,	%g5
	srl	%o3,	%i0,	%g3
	movg	%icc,	%o5,	%g6
	fandnot1	%f16,	%f14,	%f28
	fandnot2	%f16,	%f26,	%f4
	tneg	%xcc,	0x7
	fabss	%f20,	%f11
	fnot2	%f4,	%f20
	or	%i3,	%o0,	%l1
	smulcc	%l3,	%o6,	%g7
	fmovrslz	%o4,	%f14,	%f12
	movleu	%xcc,	%l4,	%l5
	array32	%l0,	%l6,	%g1
	orncc	%o7,	0x0EE6,	%i7
	movl	%icc,	%o1,	%o2
	tneg	%xcc,	0x1
	siam	0x0
	fcmpne16	%f2,	%f8,	%i6
	fbug	%fcc3,	loop_1108
	andcc	%i1,	0x0EC5,	%i5
	fmovrsgz	%i4,	%f30,	%f8
	fcmpes	%fcc2,	%f16,	%f10
loop_1108:
	array8	%g4,	%l2,	%g2
	fmovdvc	%xcc,	%f5,	%f30
	tleu	%icc,	0x1
	movrlz	%g5,	%i2,	%i0
	fpackfix	%f28,	%f11
	xorcc	%o3,	%g3,	%g6
	tge	%icc,	0x2
	subc	%o5,	0x1BDC,	%o0
	fbge,a	%fcc2,	loop_1109
	srlx	%l1,	0x1D,	%l3
	fpadd16	%f8,	%f22,	%f0
	set	0x5C, %o5
	lduha	[%l7 + %o5] 0x15,	%o6
loop_1109:
	fpadd16	%f28,	%f22,	%f18
	movcc	%icc,	%i3,	%o4
	taddcc	%g7,	0x0882,	%l5
	movre	%l4,	0x34C,	%l0
	wr	%g0,	0x18,	%asi
	sta	%f15,	[%l7 + 0x64] %asi
	array32	%l6,	%g1,	%o7
	andn	%i7,	%o2,	%i6
	tneg	%icc,	0x5
	movl	%xcc,	%o1,	%i1
	subc	%i4,	0x1182,	%g4
	udivx	%l2,	0x0AE0,	%g2
	sra	%i5,	0x17,	%g5
	movgu	%icc,	%i2,	%i0
	movrgez	%o3,	0x144,	%g6
	tsubcctv	%o5,	%o0,	%l1
	tneg	%icc,	0x4
	fsrc1s	%f11,	%f4
	movrgz	%l3,	%o6,	%g3
	edge16	%i3,	%o4,	%l5
	fbul,a	%fcc1,	loop_1110
	sdiv	%l4,	0x0797,	%g7
	umulcc	%l0,	0x0829,	%l6
	brlz	%o7,	loop_1111
loop_1110:
	movle	%xcc,	%g1,	%o2
	bleu,pn	%icc,	loop_1112
	sth	%i7,	[%l7 + 0x70]
loop_1111:
	edge16	%i6,	%i1,	%i4
	fmovsne	%icc,	%f15,	%f28
loop_1112:
	fcmps	%fcc1,	%f21,	%f27
	movleu	%icc,	%o1,	%g4
	tl	%icc,	0x2
	subccc	%l2,	0x10FE,	%i5
	array16	%g5,	%i2,	%i0
	sir	0x09C2
	movvc	%icc,	%o3,	%g6
	edge32ln	%o5,	%g2,	%l1
	fbl,a	%fcc2,	loop_1113
	fble	%fcc2,	loop_1114
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%l3,	%f22,	%f18
loop_1113:
	sth	%o6,	[%l7 + 0x4E]
loop_1114:
	and	%o0,	%g3,	%o4
	fmovdne	%icc,	%f6,	%f27
	fmul8sux16	%f14,	%f28,	%f0
	fnands	%f20,	%f6,	%f9
	fpadd16	%f8,	%f0,	%f14
	fmovrdgz	%l5,	%f28,	%f6
	fornot2s	%f18,	%f18,	%f13
	movrlez	%l4,	%g7,	%l0
	move	%xcc,	%i3,	%o7
	and	%g1,	0x0902,	%l6
	movl	%icc,	%o2,	%i6
	tsubcc	%i7,	0x123C,	%i1
	movneg	%icc,	%i4,	%g4
	srax	%l2,	%i5,	%o1
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%i2
	edge32	%i0,	%o3,	%g6
	srlx	%g5,	0x0A,	%o5
	srax	%g2,	0x0A,	%l1
	fornot1	%f8,	%f24,	%f8
	fbo	%fcc1,	loop_1115
	addcc	%l3,	%o0,	%g3
	nop
	setx loop_1116, %l0, %l1
	jmpl %l1, %o6
	fmovsleu	%icc,	%f9,	%f2
loop_1115:
	udiv	%l5,	0x0BDF,	%o4
	andncc	%g7,	%l0,	%i3
loop_1116:
	movvs	%icc,	%l4,	%g1
	fmovs	%f31,	%f9
	bvs,a,pt	%xcc,	loop_1117
	addcc	%o7,	0x1A50,	%o2
	movg	%icc,	%l6,	%i6
	siam	0x0
loop_1117:
	orn	%i7,	0x0DCC,	%i1
	xnor	%i4,	0x1972,	%g4
	movne	%icc,	%i5,	%o1
	edge8n	%i2,	%l2,	%i0
	fbue	%fcc1,	loop_1118
	fxor	%f22,	%f30,	%f0
	movl	%xcc,	%g6,	%g5
	call	loop_1119
loop_1118:
	sllx	%o5,	0x0C,	%g2
	movvc	%xcc,	%l1,	%o3
	fbe,a	%fcc0,	loop_1120
loop_1119:
	sra	%o0,	%g3,	%o6
	srlx	%l5,	%l3,	%o4
	andcc	%g7,	0x00CF,	%i3
loop_1120:
	fmul8x16au	%f14,	%f4,	%f2
	edge16	%l4,	%l0,	%o7
	fornot1	%f28,	%f22,	%f16
	swap	[%l7 + 0x44],	%o2
	brgz,a	%g1,	loop_1121
	tle	%icc,	0x7
	call	loop_1122
	edge16n	%i6,	%l6,	%i1
loop_1121:
	sdiv	%i7,	0x11A5,	%i4
	fandnot2	%f14,	%f8,	%f10
loop_1122:
	ba,a,pn	%xcc,	loop_1123
	bl,a	loop_1124
	movneg	%xcc,	%g4,	%o1
	alignaddr	%i5,	%i2,	%i0
loop_1123:
	nop
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x1E] %asi,	%l2
loop_1124:
	nop
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movrlez	%g6,	0x3FC,	%g5
	fmovspos	%xcc,	%f24,	%f0
	prefetch	[%l7 + 0x40],	 0x3
	ldx	[%l7 + 0x60],	%o5
	ldx	[%l7 + 0x78],	%l1
	bpos,pn	%xcc,	loop_1125
	andncc	%o3,	%g2,	%o0
	fxnors	%f4,	%f18,	%f11
	tsubcc	%o6,	%l5,	%g3
loop_1125:
	popc	0x1B16,	%o4
	srlx	%g7,	%i3,	%l4
	movpos	%xcc,	%l3,	%l0
	tvs	%icc,	0x1
	fmovscc	%icc,	%f9,	%f5
	movne	%xcc,	%o2,	%o7
	sethi	0x00E1,	%i6
	movne	%icc,	%l6,	%i1
	te	%xcc,	0x4
	fmovsn	%icc,	%f5,	%f14
	movge	%icc,	%i7,	%g1
	movgu	%icc,	%g4,	%o1
	alignaddrl	%i5,	%i2,	%i4
	edge8	%i0,	%l2,	%g5
	fmovsvs	%xcc,	%f27,	%f10
	bcc,a,pt	%xcc,	loop_1126
	tpos	%xcc,	0x2
	ldsb	[%l7 + 0x36],	%g6
	fble	%fcc3,	loop_1127
loop_1126:
	sethi	0x0498,	%o5
	sllx	%l1,	0x01,	%g2
	set	0x10, %g6
	stxa	%o3,	[%l7 + %g6] 0x04
loop_1127:
	srax	%o0,	0x04,	%o6
	fmovrsgz	%g3,	%f24,	%f4
	movpos	%xcc,	%o4,	%g7
	movn	%xcc,	%l5,	%i3
	movne	%icc,	%l3,	%l0
	edge32n	%l4,	%o7,	%i6
	fmovsle	%icc,	%f22,	%f1
	ldsw	[%l7 + 0x18],	%l6
	sethi	0x1F18,	%o2
	fmul8x16au	%f20,	%f13,	%f2
	fmuld8sux16	%f4,	%f18,	%f14
	movpos	%icc,	%i7,	%g1
	fmovdle	%icc,	%f27,	%f26
	stx	%i1,	[%l7 + 0x58]
	sdivcc	%g4,	0x13FF,	%i5
	fbg	%fcc1,	loop_1128
	fandnot2s	%f3,	%f9,	%f26
	orn	%i2,	%i4,	%i0
	brlez,a	%l2,	loop_1129
loop_1128:
	edge16	%o1,	%g6,	%g5
	array8	%l1,	%o5,	%g2
	fpadd32	%f0,	%f22,	%f26
loop_1129:
	movrlez	%o3,	0x38B,	%o0
	udivx	%g3,	0x04A0,	%o4
	subc	%o6,	0x00DD,	%l5
	fmovrdlez	%g7,	%f20,	%f6
	sdivx	%i3,	0x08B0,	%l3
	udiv	%l0,	0x047A,	%l4
	xor	%o7,	0x11A2,	%l6
	or	%o2,	%i7,	%g1
	bne	%xcc,	loop_1130
	sllx	%i1,	0x18,	%i6
	fmovsle	%xcc,	%f3,	%f20
	alignaddrl	%i5,	%g4,	%i2
loop_1130:
	array32	%i0,	%i4,	%l2
	movrlez	%g6,	0x240,	%o1
	movcs	%xcc,	%g5,	%l1
	fmovs	%f26,	%f23
	movvs	%icc,	%o5,	%o3
	umul	%o0,	0x1AF2,	%g2
	lduw	[%l7 + 0x58],	%g3
	fcmps	%fcc1,	%f19,	%f3
	xor	%o6,	0x1497,	%l5
	movvs	%xcc,	%g7,	%i3
	fbul,a	%fcc2,	loop_1131
	addcc	%l3,	0x10B2,	%l0
	ba,a	%icc,	loop_1132
	ba,pn	%icc,	loop_1133
loop_1131:
	bneg,pn	%xcc,	loop_1134
	ldsw	[%l7 + 0x7C],	%l4
loop_1132:
	udivcc	%o7,	0x00CA,	%o4
loop_1133:
	edge32n	%o2,	%l6,	%i7
loop_1134:
	orn	%i1,	%i6,	%g1
	tvs	%xcc,	0x4
	subc	%g4,	%i2,	%i0
	movneg	%icc,	%i4,	%i5
	andn	%l2,	%g6,	%o1
	addcc	%g5,	0x0A1E,	%l1
	subc	%o5,	%o0,	%g2
	nop
	setx	loop_1135,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bleu	%icc,	loop_1136
	sll	%o3,	%o6,	%l5
	set	0x18, %i0
	lda	[%l7 + %i0] 0x89,	%f21
loop_1135:
	srax	%g7,	0x1D,	%g3
loop_1136:
	bleu,a	%icc,	loop_1137
	ldd	[%l7 + 0x10],	%f14
	brlez,a	%l3,	loop_1138
	array16	%l0,	%i3,	%l4
loop_1137:
	te	%icc,	0x6
	movne	%xcc,	%o7,	%o2
loop_1138:
	fmovscc	%icc,	%f1,	%f20
	edge8	%l6,	%o4,	%i1
	fsrc1	%f2,	%f24
	fabss	%f7,	%f18
	tgu	%xcc,	0x3
	movrlz	%i7,	0x019,	%g1
	xorcc	%i6,	0x0018,	%g4
	subccc	%i0,	%i2,	%i5
	orn	%i4,	0x1E80,	%g6
	set	0x40, %g7
	prefetcha	[%l7 + %g7] 0x88,	 0x2
	stbar
	fandnot2	%f10,	%f12,	%f18
	tl	%xcc,	0x7
	popc	%g5,	%l1
	fxors	%f11,	%f8,	%f25
	sdivx	%o5,	0x1BA6,	%l2
	set	0x30, %o3
	ldda	[%l7 + %o3] 0xe2,	%g2
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%o0
	movvs	%icc,	%o6,	%l5
	addc	%g7,	0x1C1B,	%g3
	fbe	%fcc3,	loop_1139
	ld	[%l7 + 0x08],	%f25
	fpsub32	%f10,	%f30,	%f14
	swap	[%l7 + 0x78],	%o3
loop_1139:
	mulscc	%l3,	%i3,	%l4
	movne	%icc,	%o7,	%l0
	movrgz	%o2,	0x126,	%l6
	edge8n	%o4,	%i7,	%i1
	sdivx	%g1,	0x1255,	%i6
	fbo	%fcc2,	loop_1140
	fnor	%f26,	%f20,	%f14
	udivx	%g4,	0x063F,	%i0
	udivx	%i2,	0x0406,	%i4
loop_1140:
	edge16	%i5,	%o1,	%g6
	movleu	%icc,	%g5,	%l1
	fmovda	%icc,	%f11,	%f11
	taddcc	%o5,	0x1665,	%l2
	fbe,a	%fcc0,	loop_1141
	fpadd32s	%f12,	%f18,	%f27
	bneg,pn	%xcc,	loop_1142
	sdivx	%g2,	0x1ADA,	%o6
loop_1141:
	move	%xcc,	%o0,	%l5
	fand	%f24,	%f6,	%f28
loop_1142:
	fornot2s	%f3,	%f1,	%f9
	edge8n	%g3,	%g7,	%l3
	alignaddr	%o3,	%i3,	%l4
	taddcctv	%l0,	%o2,	%l6
	fpadd16	%f4,	%f24,	%f8
	tn	%icc,	0x0
	movrgz	%o7,	%o4,	%i1
	wr	%g0,	0xe3,	%asi
	stwa	%g1,	[%l7 + 0x10] %asi
	membar	#Sync
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%i7
	sdivx	%i6,	0x0DEC,	%i0
	movrlez	%i2,	%i4,	%g4
	array8	%o1,	%g6,	%g5
	tleu	%icc,	0x3
	bne,a	loop_1143
	fnot2	%f0,	%f18
	fbul,a	%fcc1,	loop_1144
	movre	%l1,	0x054,	%i5
loop_1143:
	fmovsg	%icc,	%f12,	%f7
	taddcctv	%o5,	0x1953,	%l2
loop_1144:
	fmovscc	%xcc,	%f8,	%f1
	udivcc	%g2,	0x0BF6,	%o0
	xnor	%l5,	0x02FA,	%g3
	array16	%g7,	%o6,	%o3
	fbl	%fcc1,	loop_1145
	movne	%xcc,	%l3,	%i3
	fmovrdlz	%l0,	%f20,	%f8
	faligndata	%f30,	%f2,	%f12
loop_1145:
	fmovd	%f10,	%f30
	array32	%o2,	%l4,	%l6
	tsubcc	%o4,	0x0FE4,	%i1
	fmovrsne	%g1,	%f28,	%f3
	fblg,a	%fcc0,	loop_1146
	tneg	%icc,	0x7
	movvs	%xcc,	%i7,	%o7
	fmovdvc	%xcc,	%f21,	%f30
loop_1146:
	fbg,a	%fcc2,	loop_1147
	orncc	%i6,	0x0A68,	%i0
	tvc	%icc,	0x5
	bge,a,pt	%icc,	loop_1148
loop_1147:
	tvc	%xcc,	0x0
	srl	%i4,	0x04,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1148:
	ldsb	[%l7 + 0x09],	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%g6,	%g4
	udivx	%g5,	0x0227,	%l1
	fpackfix	%f18,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f30,	%f28
	fbne,a	%fcc0,	loop_1149
	addc	%o5,	0x08C7,	%i5
	nop
	setx loop_1150, %l0, %l1
	jmpl %l1, %g2
	array16	%l2,	%l5,	%g3
loop_1149:
	fpmerge	%f1,	%f23,	%f22
	fbne	%fcc3,	loop_1151
loop_1150:
	xnorcc	%g7,	0x1B74,	%o6
	fmovscs	%xcc,	%f19,	%f2
	tpos	%xcc,	0x4
loop_1151:
	nop
	set	0x3E, %o0
	ldsha	[%l7 + %o0] 0x10,	%o3
	edge32	%o0,	%i3,	%l0
	andn	%l3,	%o2,	%l4
	addccc	%l6,	%i1,	%o4
	fbue	%fcc0,	loop_1152
	movl	%icc,	%i7,	%o7
	taddcctv	%i6,	0x0CF6,	%i0
	fbne	%fcc0,	loop_1153
loop_1152:
	fmovsneg	%icc,	%f2,	%f5
	tvc	%icc,	0x6
	tsubcctv	%i4,	0x0857,	%g1
loop_1153:
	bcs,pn	%icc,	loop_1154
	stw	%o1,	[%l7 + 0x54]
	edge16ln	%g6,	%i2,	%g4
	popc	0x1263,	%l1
loop_1154:
	bg	loop_1155
	tcs	%icc,	0x7
	fmuld8sux16	%f20,	%f10,	%f2
	fmul8sux16	%f20,	%f26,	%f24
loop_1155:
	edge16ln	%g5,	%i5,	%g2
	edge32	%l2,	%o5,	%g3
	tsubcctv	%l5,	%g7,	%o6
	ldd	[%l7 + 0x48],	%f16
	bcc,a,pn	%xcc,	loop_1156
	orn	%o3,	0x1813,	%o0
	movne	%icc,	%l0,	%l3
	addcc	%i3,	0x1CA0,	%o2
loop_1156:
	fpack16	%f6,	%f23
	ldub	[%l7 + 0x50],	%l4
	mova	%icc,	%i1,	%l6
	bpos,a,pn	%icc,	loop_1157
	sra	%i7,	%o4,	%o7
	orncc	%i6,	0x1651,	%i4
	tsubcc	%g1,	0x1D9F,	%i0
loop_1157:
	call	loop_1158
	edge32n	%o1,	%i2,	%g4
	fmovsgu	%icc,	%f7,	%f16
	smulcc	%g6,	0x18CE,	%g5
loop_1158:
	nop
	set	0x48, %o1
	stx	%l1,	[%l7 + %o1]
	tn	%xcc,	0x5
	ta	%xcc,	0x1
	srax	%i5,	0x13,	%l2
	tle	%xcc,	0x1
	tg	%xcc,	0x1
	fandnot1	%f16,	%f4,	%f4
	bcc	%icc,	loop_1159
	addcc	%g2,	%g3,	%o5
	fmovsl	%icc,	%f9,	%f28
	fmovrsne	%l5,	%f0,	%f26
loop_1159:
	edge16ln	%g7,	%o6,	%o3
	fnot1s	%f5,	%f10
	nop
	setx	loop_1160,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xor	%o0,	%l3,	%i3
	xnorcc	%l0,	%o2,	%i1
	set	0x70, %l2
	ldda	[%l7 + %l2] 0x22,	%l4
loop_1160:
	array32	%l6,	%o4,	%i7
	movrne	%i6,	0x03E,	%i4
	fone	%f12
	pdist	%f30,	%f0,	%f14
	edge32n	%o7,	%i0,	%g1
	bneg	%xcc,	loop_1161
	edge16n	%i2,	%g4,	%g6
	edge16n	%g5,	%o1,	%l1
	fmul8x16	%f31,	%f4,	%f8
loop_1161:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x48] %asi,	%l2
	set	0x14, %l6
	lduwa	[%l7 + %l6] 0x11,	%i5
	umulcc	%g3,	0x0F09,	%g2
	edge16	%l5,	%o5,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g7,	0x1F,	%o3
	array16	%l3,	%o0,	%i3
	wr	%g0,	0x27,	%asi
	stwa	%l0,	[%l7 + 0x60] %asi
	membar	#Sync
	movg	%xcc,	%i1,	%l4
	move	%icc,	%o2,	%l6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%i6
	fbul,a	%fcc1,	loop_1162
	edge16ln	%i4,	%o7,	%i0
	orcc	%g1,	0x1A9F,	%i2
	xorcc	%i7,	0x182C,	%g4
loop_1162:
	fors	%f20,	%f2,	%f13
	faligndata	%f20,	%f24,	%f4
	movneg	%xcc,	%g5,	%g6
	ldd	[%l7 + 0x50],	%f20
	movpos	%xcc,	%l1,	%l2
	smulcc	%i5,	%g3,	%g2
	tvs	%icc,	0x1
	std	%f8,	[%l7 + 0x18]
	orn	%o1,	0x11E3,	%l5
	popc	0x1E8E,	%o6
	fmul8x16au	%f21,	%f19,	%f20
	faligndata	%f20,	%f16,	%f4
	ble,a,pn	%xcc,	loop_1163
	movne	%icc,	%o5,	%o3
	ta	%icc,	0x1
	mova	%icc,	%l3,	%g7
loop_1163:
	brgz	%o0,	loop_1164
	and	%i3,	0x02E3,	%l0
	tgu	%icc,	0x5
	movge	%icc,	%i1,	%o2
loop_1164:
	fmovdvs	%xcc,	%f12,	%f10
	mova	%icc,	%l4,	%l6
	mulscc	%o4,	0x11B3,	%i6
	srax	%o7,	%i4,	%i0
	tl	%xcc,	0x2
	sdivcc	%i2,	0x1BF4,	%g1
	fnot2s	%f10,	%f26
	fpsub32	%f20,	%f12,	%f4
	edge16	%i7,	%g4,	%g6
	srl	%l1,	%g5,	%i5
	edge32l	%g3,	%l2,	%g2
	edge16	%l5,	%o1,	%o5
	movrne	%o6,	%o3,	%g7
	ldd	[%l7 + 0x18],	%o0
	sra	%l3,	0x15,	%l0
	xorcc	%i1,	%o2,	%l4
	ld	[%l7 + 0x3C],	%f10
	and	%l6,	%i3,	%o4
	set	0x64, %i7
	swapa	[%l7 + %i7] 0x88,	%o7
	move	%xcc,	%i6,	%i4
	tcc	%icc,	0x6
	move	%xcc,	%i0,	%i2
	sdivcc	%i7,	0x1348,	%g1
	fbule,a	%fcc2,	loop_1165
	move	%xcc,	%g4,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%g5,	%g6
loop_1165:
	sdivcc	%i5,	0x028C,	%g3
	std	%g2,	[%l7 + 0x18]
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l2
	taddcc	%o1,	0x0739,	%o5
	alignaddr	%o6,	%o3,	%g7
	ldsh	[%l7 + 0x26],	%l5
	movge	%icc,	%l3,	%o0
	udivcc	%i1,	0x076C,	%o2
	addcc	%l4,	%l6,	%i3
	mulscc	%o4,	%l0,	%i6
	fmovsne	%xcc,	%f22,	%f0
	movpos	%xcc,	%o7,	%i4
	srax	%i0,	%i7,	%g1
	movcc	%icc,	%i2,	%l1
	tne	%xcc,	0x7
	tn	%xcc,	0x2
	fcmpeq32	%f20,	%f18,	%g4
	sub	%g5,	0x0AE7,	%i5
	bne,a	loop_1166
	nop
	setx	loop_1167,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	loop_1168,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%icc,	0x4
loop_1166:
	fcmple32	%f6,	%f26,	%g6
loop_1167:
	orcc	%g3,	0x0AD7,	%l2
loop_1168:
	orcc	%g2,	0x09E4,	%o1
	ld	[%l7 + 0x6C],	%f29
	fbn	%fcc2,	loop_1169
	fbg,a	%fcc1,	loop_1170
	fmovspos	%xcc,	%f16,	%f17
	tge	%icc,	0x1
loop_1169:
	ldsh	[%l7 + 0x14],	%o5
loop_1170:
	movrgez	%o6,	0x3F7,	%o3
	fandnot2	%f4,	%f14,	%f22
	fmovrsgez	%g7,	%f12,	%f19
	fmovdpos	%xcc,	%f23,	%f25
	edge8	%l3,	%o0,	%i1
	fmovsne	%icc,	%f12,	%f19
	fpsub32s	%f19,	%f17,	%f15
	xor	%o2,	%l4,	%l6
	fmovda	%xcc,	%f23,	%f9
	fmovsl	%xcc,	%f15,	%f5
	orn	%i3,	0x02A8,	%o4
	fcmpd	%fcc3,	%f22,	%f24
	movg	%icc,	%l5,	%i6
	array16	%l0,	%o7,	%i0
	tvc	%xcc,	0x6
	fcmpd	%fcc1,	%f24,	%f16
	set	0x0C, %l4
	lda	[%l7 + %l4] 0x0c,	%f2
	mulx	%i4,	0x05FD,	%g1
	tleu	%xcc,	0x4
	call	loop_1171
	fbl	%fcc0,	loop_1172
	prefetch	[%l7 + 0x3C],	 0x3
	ldsw	[%l7 + 0x54],	%i2
loop_1171:
	and	%l1,	%g4,	%i7
loop_1172:
	popc	0x0E85,	%g5
	smul	%i5,	0x19C7,	%g3
	lduw	[%l7 + 0x48],	%g6
	alignaddrl	%l2,	%g2,	%o1
	movne	%xcc,	%o5,	%o6
	te	%icc,	0x1
	edge32	%g7,	%l3,	%o3
	wr	%g0,	0x89,	%asi
	stba	%i1,	[%l7 + 0x52] %asi
	fbo	%fcc1,	loop_1173
	sdiv	%o0,	0x1C85,	%o2
	tvc	%icc,	0x6
	andn	%l6,	%i3,	%l4
loop_1173:
	tl	%icc,	0x5
	fnot1	%f22,	%f20
	tgu	%xcc,	0x7
	mova	%xcc,	%l5,	%o4
	fba	%fcc3,	loop_1174
	and	%l0,	%i6,	%i0
	brz,a	%i4,	loop_1175
	stb	%g1,	[%l7 + 0x66]
loop_1174:
	nop
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1175:
	movl	%xcc,	%i2,	%l1
	xorcc	%g4,	0x0C71,	%i7
	udivx	%o7,	0x15F9,	%g5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x46] %asi,	%i5
	mulx	%g6,	%l2,	%g2
	xorcc	%o1,	%o5,	%o6
	tvc	%xcc,	0x0
	bg,a,pn	%icc,	loop_1176
	tpos	%xcc,	0x7
	sdiv	%g7,	0x1519,	%l3
	stb	%o3,	[%l7 + 0x20]
loop_1176:
	movpos	%xcc,	%i1,	%g3
	set	0x20, %g4
	stda	%o2,	[%l7 + %g4] 0x11
	wr	%g0,	0x57,	%asi
	stxa	%l6,	[%g0 + 0x0] %asi
	umulcc	%i3,	%l4,	%o0
	fornot2s	%f18,	%f14,	%f14
	andcc	%l5,	0x11DE,	%l0
	srax	%o4,	0x1A,	%i6
	sll	%i4,	0x0C,	%g1
	xnor	%i2,	0x15D0,	%i0
	srlx	%l1,	%g4,	%o7
	movge	%icc,	%i7,	%g5
	fnegd	%f6,	%f30
	fmovscc	%icc,	%f30,	%f11
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x30] %asi,	%g6
	ble,a	loop_1177
	bg	%icc,	loop_1178
	bleu,a	loop_1179
	tpos	%xcc,	0x2
loop_1177:
	fandnot1	%f14,	%f18,	%f24
loop_1178:
	swap	[%l7 + 0x0C],	%i5
loop_1179:
	udivx	%g2,	0x1BC4,	%o1
	mulx	%l2,	%o5,	%o6
	fnegd	%f12,	%f14
	edge32ln	%g7,	%l3,	%i1
	movne	%xcc,	%g3,	%o2
	alignaddrl	%l6,	%o3,	%l4
	fmovrsne	%i3,	%f21,	%f21
	edge16	%o0,	%l5,	%l0
	sir	0x0E8A
	fbg,a	%fcc0,	loop_1180
	fbu,a	%fcc0,	loop_1181
	bcc,a	loop_1182
	movrne	%i6,	0x249,	%i4
loop_1180:
	sdivcc	%o4,	0x13EA,	%g1
loop_1181:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
loop_1182:
	fmovdneg	%xcc,	%f24,	%f5
	prefetch	[%l7 + 0x6C],	 0x2
	fmovrdlz	%i0,	%f12,	%f0
	or	%g4,	0x04FD,	%l1
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movneg	%xcc,	%o7,	%i7
	fnegd	%f2,	%f6
	edge8ln	%g5,	%i5,	%g2
	fmovspos	%xcc,	%f1,	%f18
	wr	%g0,	0x89,	%asi
	sta	%f10,	[%l7 + 0x10] %asi
	fmovsn	%icc,	%f14,	%f28
	fnot1s	%f14,	%f21
	fsrc2s	%f27,	%f3
	edge8n	%g6,	%o1,	%o5
	sra	%o6,	0x14,	%g7
	orn	%l2,	0x15BF,	%l3
	srl	%g3,	0x19,	%i1
	movneg	%xcc,	%l6,	%o2
	fcmpne16	%f10,	%f28,	%o3
	edge32ln	%l4,	%o0,	%l5
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fbul	%fcc3,	loop_1183
	and	%i3,	0x0DD8,	%i6
	membar	0x11
	fmovsge	%xcc,	%f9,	%f9
loop_1183:
	move	%xcc,	%i4,	%o4
	bne	%icc,	loop_1184
	fcmpne32	%f2,	%f22,	%g1
	edge32	%l0,	%i0,	%i2
	wr	%g0,	0x89,	%asi
	stwa	%g4,	[%l7 + 0x2C] %asi
loop_1184:
	fornot2s	%f14,	%f19,	%f26
	mulx	%l1,	0x18BF,	%o7
	sll	%i7,	0x03,	%g5
	movl	%icc,	%g2,	%i5
	edge8n	%o1,	%g6,	%o5
	fbule,a	%fcc2,	loop_1185
	tn	%icc,	0x7
	andn	%o6,	0x0338,	%g7
	sdiv	%l2,	0x00AA,	%l3
loop_1185:
	srlx	%i1,	0x0D,	%l6
	srax	%g3,	%o3,	%l4
	brgz,a	%o2,	loop_1186
	fmovdcc	%icc,	%f5,	%f9
	xor	%l5,	%i3,	%o0
	edge8n	%i6,	%i4,	%o4
loop_1186:
	tvs	%xcc,	0x0
	set	0x58, %i5
	stda	%l0,	[%l7 + %i5] 0xeb
	membar	#Sync
	movvs	%xcc,	%i0,	%g1
	movn	%icc,	%g4,	%i2
	mova	%icc,	%l1,	%i7
	wr	%g0,	0x89,	%asi
	stha	%o7,	[%l7 + 0x38] %asi
	addc	%g5,	%i5,	%g2
	for	%f22,	%f30,	%f18
	sdivcc	%o1,	0x1EE3,	%g6
	orcc	%o6,	%o5,	%l2
	mova	%icc,	%l3,	%g7
	movrlz	%i1,	%l6,	%o3
	smul	%l4,	0x124E,	%o2
	movrgez	%l5,	%g3,	%o0
	movvc	%icc,	%i6,	%i3
	movne	%xcc,	%o4,	%i4
	fmovsvc	%xcc,	%f27,	%f12
	fcmps	%fcc3,	%f31,	%f1
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x5C] %asi,	%l0
	set	0x33, %g5
	lduba	[%l7 + %g5] 0x89,	%g1
	addc	%i0,	%g4,	%l1
	fnands	%f2,	%f0,	%f4
	mova	%icc,	%i2,	%o7
	popc	%i7,	%i5
	movre	%g5,	0x02E,	%o1
	fmovscs	%icc,	%f2,	%f1
	fble,a	%fcc1,	loop_1187
	movrlez	%g2,	%g6,	%o5
	tgu	%icc,	0x3
	nop
	setx	loop_1188,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1187:
	fbge,a	%fcc3,	loop_1189
	taddcc	%l2,	0x0242,	%l3
	stw	%g7,	[%l7 + 0x48]
loop_1188:
	st	%f27,	[%l7 + 0x40]
loop_1189:
	umul	%o6,	0x05E3,	%l6
	stbar
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
	bvs,a,pn	%icc,	loop_1190
	tne	%icc,	0x5
	fmovrslez	%l4,	%f7,	%f7
	fmovdne	%icc,	%f15,	%f10
loop_1190:
	tcc	%xcc,	0x1
	wr	%g0,	0xe2,	%asi
	stba	%o2,	[%l7 + 0x63] %asi
	membar	#Sync
	prefetch	[%l7 + 0x5C],	 0x1
	membar	0x72
	tsubcctv	%i1,	%l5,	%g3
	umul	%o0,	0x0981,	%i3
	xnorcc	%i6,	0x16BC,	%i4
	movre	%l0,	0x1D7,	%g1
	movvs	%xcc,	%o4,	%i0
	stx	%g4,	[%l7 + 0x78]
	edge16n	%i2,	%o7,	%l1
	wr	%g0,	0x52,	%asi
	stxa	%i5,	[%g0 + 0x108] %asi
	edge8n	%i7,	%o1,	%g5
	andncc	%g6,	%o5,	%l2
	movrne	%l3,	0x2C3,	%g7
	brgz,a	%g2,	loop_1191
	alignaddrl	%l6,	%o6,	%o3
	bvc,a	%icc,	loop_1192
	add	%o2,	%i1,	%l4
loop_1191:
	fmovrslez	%g3,	%f24,	%f9
	wr	%g0,	0x89,	%asi
	stba	%o0,	[%l7 + 0x6A] %asi
loop_1192:
	edge16ln	%i3,	%i6,	%l5
	siam	0x2
	fexpand	%f20,	%f8
	umulcc	%l0,	0x1799,	%g1
	bcc	loop_1193
	fpadd16s	%f25,	%f11,	%f22
	addc	%i4,	0x083D,	%o4
	array16	%i0,	%g4,	%o7
loop_1193:
	fmovdle	%xcc,	%f29,	%f25
	srl	%l1,	%i2,	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%g5
	movleu	%xcc,	%i7,	%o5
	tsubcctv	%l2,	%g6,	%l3
	edge8n	%g7,	%g2,	%o6
	fmovscc	%xcc,	%f30,	%f0
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
	brz	%o3,	loop_1194
	movneg	%icc,	%i1,	%o2
	fbe,a	%fcc2,	loop_1195
	movpos	%icc,	%l4,	%o0
loop_1194:
	xnor	%g3,	%i6,	%i3
	xnorcc	%l5,	0x1959,	%g1
loop_1195:
	siam	0x2
	fmul8x16	%f29,	%f6,	%f16
	membar	0x32
	sdiv	%l0,	0x1782,	%o4
	move	%icc,	%i0,	%i4
	pdist	%f24,	%f10,	%f14
	sdivx	%o7,	0x1E8A,	%g4
	addc	%i2,	0x02C1,	%i5
	fmovrde	%l1,	%f10,	%f28
	sllx	%g5,	0x1F,	%i7
	movrgz	%o5,	0x1E0,	%o1
	sllx	%l2,	0x04,	%l3
	subcc	%g6,	%g2,	%g7
	brlez,a	%l6,	loop_1196
	fmovdge	%xcc,	%f27,	%f23
	fbe	%fcc1,	loop_1197
	movre	%o3,	0x09D,	%i1
loop_1196:
	subccc	%o2,	0x1A4C,	%l4
	smulcc	%o0,	%o6,	%i6
loop_1197:
	ldsb	[%l7 + 0x5F],	%i3
	fbu	%fcc2,	loop_1198
	movrgez	%l5,	0x246,	%g3
	movrgz	%l0,	%o4,	%i0
	sdiv	%i4,	0x17DF,	%g1
loop_1198:
	fmovsa	%xcc,	%f0,	%f0
	tcc	%xcc,	0x3
	fmovdneg	%icc,	%f28,	%f6
	ldub	[%l7 + 0x78],	%o7
	set	0x1C, %l0
	lda	[%l7 + %l0] 0x81,	%f16
	set	0x7C, %i4
	sta	%f14,	[%l7 + %i4] 0x11
	tpos	%xcc,	0x2
	tpos	%xcc,	0x7
	fblg	%fcc0,	loop_1199
	fsrc2	%f0,	%f20
	orn	%i2,	0x0D65,	%i5
	ldsh	[%l7 + 0x46],	%l1
loop_1199:
	and	%g5,	0x0038,	%i7
	tne	%icc,	0x5
	membar	0x7F
	fmovrdgez	%g4,	%f26,	%f26
	lduh	[%l7 + 0x66],	%o1
	fbne	%fcc3,	loop_1200
	tn	%xcc,	0x2
	fmovdpos	%xcc,	%f15,	%f16
	movpos	%xcc,	%o5,	%l2
loop_1200:
	ldsw	[%l7 + 0x20],	%l3
	umulcc	%g2,	%g7,	%g6
	edge16ln	%l6,	%i1,	%o3
	nop
	setx loop_1201, %l0, %l1
	jmpl %l1, %o2
	edge16n	%l4,	%o0,	%i6
	xnorcc	%i3,	0x03EE,	%o6
	array32	%g3,	%l0,	%o4
loop_1201:
	mulx	%i0,	0x0366,	%i4
	andcc	%g1,	%l5,	%i2
	fba,a	%fcc2,	loop_1202
	fmovrdlz	%i5,	%f26,	%f22
	orn	%o7,	%g5,	%i7
	srl	%l1,	%g4,	%o1
loop_1202:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x70] %asi,	%o4
	bvc	loop_1203
	tsubcc	%l3,	0x0F7E,	%l2
	edge16n	%g7,	%g6,	%l6
	be,pn	%icc,	loop_1204
loop_1203:
	movleu	%xcc,	%g2,	%o3
	bpos,pn	%xcc,	loop_1205
	sra	%o2,	0x1C,	%l4
loop_1204:
	and	%o0,	0x0D2B,	%i1
	xnor	%i6,	0x0DA9,	%o6
loop_1205:
	movne	%xcc,	%i3,	%l0
	movpos	%icc,	%g3,	%o4
	andcc	%i4,	%i0,	%g1
	fmovda	%icc,	%f29,	%f8
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	ba,pn	%xcc,	loop_1206
	subcc	%i2,	0x05A1,	%l5
	mulscc	%i5,	0x0FB6,	%o7
	ldsh	[%l7 + 0x64],	%i7
loop_1206:
	umulcc	%l1,	0x1AFC,	%g4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x0c,	%o1,	%o5
	fandnot2	%f2,	%f18,	%f18
	sra	%g5,	%l3,	%l2
	fpsub16s	%f4,	%f21,	%f24
	bg	%icc,	loop_1207
	fba,a	%fcc3,	loop_1208
	fmovrslz	%g7,	%f15,	%f8
	fand	%f16,	%f14,	%f0
loop_1207:
	tn	%icc,	0x4
loop_1208:
	popc	0x123D,	%g6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%l6,	%g2
	movge	%icc,	%o2,	%l4
	movgu	%xcc,	%o3,	%o0
	orncc	%i1,	0x0F1C,	%o6
	bg,a,pt	%icc,	loop_1209
	flush	%l7 + 0x78
	movleu	%icc,	%i3,	%l0
	movl	%icc,	%g3,	%o4
loop_1209:
	alignaddrl	%i6,	%i4,	%i0
	nop
	set	0x3C, %i6
	sth	%i2,	[%l7 + %i6]
	movrgz	%g1,	%l5,	%o7
	fba,a	%fcc0,	loop_1210
	edge16	%i5,	%l1,	%g4
	ld	[%l7 + 0x58],	%f6
	xnor	%o1,	0x14C4,	%i7
loop_1210:
	fmovsne	%xcc,	%f27,	%f19
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge32n	%o5,	%l3,	%l2
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x40] %asi,	%g6
	srl	%g6,	0x06,	%g5
	edge32l	%l6,	%g2,	%o2
	brlez,a	%l4,	loop_1211
	taddcctv	%o3,	%o0,	%i1
	movrne	%o6,	0x3A2,	%l0
	smul	%g3,	%o4,	%i6
loop_1211:
	sdiv	%i4,	0x04FD,	%i3
	ldsh	[%l7 + 0x26],	%i2
	fexpand	%f30,	%f18
	ldsh	[%l7 + 0x5E],	%g1
	addccc	%i0,	%o7,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l5,	0x17F5,	%l1
	sdivcc	%o1,	0x13CB,	%i7
	fmul8x16au	%f27,	%f19,	%f26
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%l3
	movrne	%g4,	0x278,	%l2
	set	0x24, %g2
	stha	%g7,	[%l7 + %g2] 0x23
	membar	#Sync
	addc	%g5,	%l6,	%g2
	ldx	[%l7 + 0x40],	%o2
	brz,a	%g6,	loop_1212
	udivx	%o3,	0x1CEC,	%l4
	taddcctv	%i1,	0x1406,	%o6
	fcmple16	%f24,	%f20,	%o0
loop_1212:
	movrlz	%l0,	0x3F7,	%o4
	array16	%g3,	%i4,	%i3
	mulscc	%i6,	0x034D,	%i2
	move	%xcc,	%i0,	%o7
	set	0x53, %l3
	lduba	[%l7 + %l3] 0x10,	%g1
	lduh	[%l7 + 0x2C],	%l5
	taddcctv	%l1,	0x01FC,	%i5
	bg,a	loop_1213
	stb	%o1,	[%l7 + 0x17]
	movrlz	%o5,	%i7,	%g4
	taddcctv	%l3,	%l2,	%g5
loop_1213:
	brz	%g7,	loop_1214
	fmovrslz	%g2,	%f13,	%f24
	edge32l	%o2,	%l6,	%o3
	sdiv	%g6,	0x1460,	%l4
loop_1214:
	sra	%i1,	%o6,	%o0
	movcs	%xcc,	%l0,	%g3
	fbe,a	%fcc3,	loop_1215
	fblg,a	%fcc1,	loop_1216
	fmovsne	%xcc,	%f12,	%f11
	bcs,pt	%icc,	loop_1217
loop_1215:
	fbge,a	%fcc3,	loop_1218
loop_1216:
	sdivcc	%o4,	0x0442,	%i3
	nop
	setx	loop_1219,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1217:
	fmovsgu	%xcc,	%f0,	%f26
loop_1218:
	sir	0x160D
	fsrc2s	%f6,	%f6
loop_1219:
	movvs	%xcc,	%i4,	%i6
	movcs	%xcc,	%i0,	%i2
	ldx	[%l7 + 0x58],	%o7
	fxors	%f8,	%f2,	%f4
	movleu	%icc,	%g1,	%l1
	movre	%i5,	%o1,	%l5
	ldx	[%l7 + 0x28],	%o5
	fnors	%f8,	%f10,	%f24
	movg	%xcc,	%g4,	%i7
	fsrc2s	%f19,	%f21
	fxnor	%f14,	%f28,	%f0
	fmovdcc	%icc,	%f9,	%f28
	movre	%l3,	0x069,	%g5
	ldd	[%l7 + 0x48],	%f4
	taddcctv	%g7,	0x0DAF,	%g2
	fmovdne	%xcc,	%f23,	%f23
	movleu	%xcc,	%l2,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%l6,	0x19AE,	%g6
	movre	%o3,	%l4,	%o6
	std	%f6,	[%l7 + 0x18]
	edge16ln	%o0,	%l0,	%i1
	fsrc2	%f4,	%f28
	subcc	%o4,	%i3,	%g3
	movgu	%xcc,	%i6,	%i4
	sllx	%i0,	%i2,	%g1
	fcmple32	%f22,	%f24,	%o7
	membar	0x3C
	fcmple32	%f4,	%f4,	%i5
	mulx	%l1,	0x0222,	%l5
	bcs,pn	%icc,	loop_1220
	srlx	%o5,	0x11,	%o1
	movle	%xcc,	%i7,	%l3
	umulcc	%g4,	0x11CF,	%g5
loop_1220:
	tvs	%icc,	0x5
	wr	%g0,	0xe2,	%asi
	stba	%g2,	[%l7 + 0x3F] %asi
	membar	#Sync
	alignaddrl	%g7,	%l2,	%o2
	edge8l	%l6,	%o3,	%l4
	tsubcctv	%o6,	%o0,	%g6
	fbg	%fcc2,	loop_1221
	udivx	%l0,	0x1023,	%i1
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i3,	%g3
loop_1221:
	nop
	set	0x42, %o2
	lduha	[%l7 + %o2] 0x10,	%o4
	sllx	%i6,	0x13,	%i4
	fandnot1	%f6,	%f20,	%f22
	brgez,a	%i0,	loop_1222
	flush	%l7 + 0x24
	addccc	%g1,	%o7,	%i2
	fnegd	%f2,	%f6
loop_1222:
	add	%l1,	0x1EE6,	%l5
	bl	%xcc,	loop_1223
	fmovd	%f14,	%f14
	tgu	%xcc,	0x6
	edge8l	%o5,	%o1,	%i7
loop_1223:
	andn	%i5,	0x0EF6,	%g4
	fbule	%fcc1,	loop_1224
	fandnot2s	%f19,	%f13,	%f1
	fmovdcs	%icc,	%f19,	%f11
	bgu	loop_1225
loop_1224:
	bcc,a	%icc,	loop_1226
	bneg	loop_1227
	brlez,a	%g5,	loop_1228
loop_1225:
	fbl,a	%fcc0,	loop_1229
loop_1226:
	fmovrsgez	%l3,	%f11,	%f5
loop_1227:
	fzeros	%f2
loop_1228:
	movle	%xcc,	%g7,	%g2
loop_1229:
	fmovdge	%xcc,	%f30,	%f18
	fmovsvc	%icc,	%f19,	%f11
	edge8	%o2,	%l2,	%o3
	umulcc	%l4,	0x056A,	%l6
	fandnot2	%f20,	%f16,	%f4
	mova	%icc,	%o0,	%o6
	orncc	%g6,	0x15B7,	%i1
	srlx	%i3,	%g3,	%o4
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x60] %asi,	%l0
	move	%icc,	%i6,	%i4
	sethi	0x0EFE,	%g1
	tg	%icc,	0x1
	set	0x10, %o6
	lda	[%l7 + %o6] 0x88,	%f11
	fmovdpos	%icc,	%f20,	%f6
	fpadd16s	%f30,	%f22,	%f24
	edge8ln	%i0,	%o7,	%i2
	subcc	%l1,	0x0BEA,	%l5
	ld	[%l7 + 0x60],	%f29
	fcmpes	%fcc3,	%f1,	%f13
	fpadd16	%f12,	%f4,	%f18
	alignaddr	%o1,	%i7,	%i5
	fandnot1s	%f6,	%f8,	%f16
	set	0x34, %i3
	lda	[%l7 + %i3] 0x88,	%f10
	fsrc2	%f0,	%f26
	xnor	%g4,	%g5,	%l3
	popc	%o5,	%g2
	ba,a	%xcc,	loop_1230
	array32	%o2,	%l2,	%o3
	fbn,a	%fcc1,	loop_1231
	movcs	%xcc,	%g7,	%l6
loop_1230:
	fmovrsgz	%o0,	%f30,	%f7
	orcc	%l4,	0x1D59,	%o6
loop_1231:
	tneg	%icc,	0x0
	edge8n	%i1,	%g6,	%g3
	andn	%i3,	0x1992,	%o4
	array32	%l0,	%i4,	%i6
	subcc	%g1,	0x1ADD,	%o7
	fbue	%fcc0,	loop_1232
	andncc	%i2,	%l1,	%l5
	fbn	%fcc1,	loop_1233
	array16	%i0,	%i7,	%o1
loop_1232:
	nop
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x28] %asi,	%g4
loop_1233:
	fbue	%fcc1,	loop_1234
	brnz,a	%i5,	loop_1235
	be,pt	%icc,	loop_1236
	edge32	%g5,	%o5,	%g2
loop_1234:
	ldx	[%l7 + 0x58],	%o2
loop_1235:
	sdivcc	%l3,	0x1BAA,	%l2
loop_1236:
	movvs	%icc,	%o3,	%g7
	sir	0x1545
	fpack16	%f16,	%f27
	movneg	%icc,	%l6,	%l4
	bgu,a,pt	%xcc,	loop_1237
	siam	0x4
	popc	0x08F4,	%o0
	subccc	%i1,	0x1093,	%o6
loop_1237:
	edge16n	%g3,	%i3,	%o4
	te	%xcc,	0x6
	fsrc2s	%f23,	%f24
	fornot2s	%f13,	%f21,	%f30
	ble,pn	%xcc,	loop_1238
	tsubcc	%g6,	0x1636,	%l0
	srlx	%i4,	0x0B,	%i6
	sdiv	%o7,	0x08F4,	%i2
loop_1238:
	brgz	%g1,	loop_1239
	fbge,a	%fcc3,	loop_1240
	movleu	%xcc,	%l1,	%l5
	movcs	%xcc,	%i0,	%i7
loop_1239:
	fbl,a	%fcc0,	loop_1241
loop_1240:
	fcmps	%fcc1,	%f16,	%f26
	swap	[%l7 + 0x5C],	%g4
	array16	%i5,	%g5,	%o1
loop_1241:
	tsubcc	%o5,	0x1F2E,	%g2
	bgu,a,pt	%xcc,	loop_1242
	fmul8sux16	%f16,	%f2,	%f4
	fbug	%fcc0,	loop_1243
	addccc	%l3,	0x1647,	%o2
loop_1242:
	ldsb	[%l7 + 0x15],	%o3
	tleu	%icc,	0x3
loop_1243:
	movcs	%xcc,	%g7,	%l2
	fcmple32	%f12,	%f6,	%l6
	mova	%icc,	%l4,	%o0
	taddcctv	%i1,	%o6,	%i3
	tneg	%xcc,	0x0
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x18,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o4,	%g3
	sll	%g6,	%i4,	%l0
	ldx	[%l7 + 0x38],	%o7
	bshuffle	%f14,	%f16,	%f18
	fmovsge	%icc,	%f18,	%f14
	smul	%i2,	0x1A22,	%i6
	fmovda	%icc,	%f10,	%f25
	fcmped	%fcc2,	%f18,	%f6
	movvc	%icc,	%l1,	%l5
	bne,a	%xcc,	loop_1244
	fmovrslez	%i0,	%f0,	%f15
	tg	%xcc,	0x1
	tn	%icc,	0x4
loop_1244:
	subcc	%g1,	%g4,	%i7
	edge32ln	%i5,	%o1,	%o5
	fmovdleu	%xcc,	%f6,	%f14
	fmovdneg	%xcc,	%f27,	%f1
	set	0x64, %o4
	lduwa	[%l7 + %o4] 0x89,	%g2
	fbl,a	%fcc3,	loop_1245
	fcmpd	%fcc0,	%f24,	%f18
	movrlez	%l3,	0x1F9,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1245:
	xorcc	%o3,	0x0498,	%g5
	te	%xcc,	0x0
	tl	%xcc,	0x2
	tpos	%icc,	0x2
	bvs,a	%icc,	loop_1246
	sllx	%g7,	%l2,	%l4
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%l6
loop_1246:
	tneg	%xcc,	0x2
	ble	%xcc,	loop_1247
	srax	%o0,	%o6,	%i1
	sra	%o4,	%i3,	%g6
	prefetch	[%l7 + 0x78],	 0x1
loop_1247:
	nop
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	tcs	%icc,	0x6
	tcc	%xcc,	0x4
	mulscc	%g3,	%l0,	%o7
	sra	%i2,	%i4,	%i6
	fmovdgu	%xcc,	%f25,	%f22
	tneg	%xcc,	0x3
	fnand	%f0,	%f4,	%f14
	bneg,pn	%icc,	loop_1248
	stx	%l1,	[%l7 + 0x58]
	sub	%l5,	%g1,	%i0
	sir	0x13EB
loop_1248:
	array8	%i7,	%g4,	%i5
	fsrc1s	%f28,	%f5
	tn	%icc,	0x6
	fbne,a	%fcc2,	loop_1249
	movcs	%icc,	%o5,	%o1
	movrgz	%l3,	0x0EC,	%g2
	sdivcc	%o2,	0x04D0,	%g5
loop_1249:
	fcmpne16	%f10,	%f0,	%g7
	fmovrsgez	%o3,	%f2,	%f16
	mulx	%l4,	0x0ACF,	%l6
	membar	0x1D
	bpos	loop_1250
	nop
	setx loop_1251, %l0, %l1
	jmpl %l1, %l2
	tg	%xcc,	0x3
	fmovrdgez	%o6,	%f30,	%f6
loop_1250:
	st	%f26,	[%l7 + 0x34]
loop_1251:
	fbug,a	%fcc2,	loop_1252
	xnorcc	%o0,	%o4,	%i3
	and	%g6,	0x1AE5,	%i1
	fnors	%f10,	%f19,	%f10
loop_1252:
	ble	%xcc,	loop_1253
	movre	%l0,	0x112,	%o7
	edge32l	%i2,	%g3,	%i6
	movleu	%icc,	%i4,	%l5
loop_1253:
	movleu	%icc,	%g1,	%l1
	array16	%i0,	%g4,	%i5
	tgu	%icc,	0x7
	fmovsn	%icc,	%f20,	%f14
	fcmpeq32	%f28,	%f8,	%o5
	brgez	%i7,	loop_1254
	taddcctv	%l3,	0x0208,	%o1
	umulcc	%o2,	0x1E04,	%g5
	fpmerge	%f27,	%f4,	%f28
loop_1254:
	fabss	%f23,	%f15
	fcmpne16	%f24,	%f2,	%g7
	array8	%o3,	%g2,	%l6
	movl	%icc,	%l4,	%l2
	movre	%o0,	0x101,	%o4
	tg	%xcc,	0x4
	call	loop_1255
	movn	%xcc,	%i3,	%o6
	ldd	[%l7 + 0x68],	%g6
	brgz,a	%i1,	loop_1256
loop_1255:
	fbo	%fcc2,	loop_1257
	edge8	%l0,	%i2,	%g3
	edge32ln	%i6,	%o7,	%i4
loop_1256:
	movneg	%icc,	%l5,	%g1
loop_1257:
	nop
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x14
	movrgz	%l1,	%i0,	%i5
	srax	%o5,	%g4,	%i7
	fmovdcs	%icc,	%f3,	%f4
	fmovsg	%icc,	%f6,	%f9
	movre	%o1,	0x30C,	%o2
	movcc	%xcc,	%g5,	%g7
	alignaddr	%o3,	%g2,	%l3
	tne	%xcc,	0x2
	ldsh	[%l7 + 0x0E],	%l6
	sllx	%l4,	0x09,	%l2
	bneg,a,pt	%icc,	loop_1258
	array32	%o4,	%o0,	%i3
	swap	[%l7 + 0x1C],	%o6
	xnor	%i1,	0x1BBE,	%g6
loop_1258:
	xnor	%i2,	0x1505,	%g3
	sdivx	%l0,	0x14B2,	%i6
	movl	%icc,	%i4,	%o7
	fmul8x16	%f16,	%f22,	%f30
	fnot1s	%f4,	%f20
	bpos	%icc,	loop_1259
	addc	%g1,	%l5,	%i0
	ba,a,pn	%xcc,	loop_1260
	srax	%l1,	%i5,	%g4
loop_1259:
	bvc,pn	%icc,	loop_1261
	ld	[%l7 + 0x68],	%f5
loop_1260:
	fnands	%f22,	%f19,	%f8
	udivcc	%i7,	0x19FA,	%o1
loop_1261:
	fmovse	%xcc,	%f24,	%f17
	ldub	[%l7 + 0x14],	%o2
	fnot2	%f16,	%f8
	array8	%g5,	%o5,	%g7
	sdiv	%o3,	0x1118,	%g2
	mulscc	%l3,	0x0D7B,	%l4
	fcmpeq16	%f22,	%f14,	%l2
	movvc	%xcc,	%o4,	%l6
	ldsb	[%l7 + 0x1C],	%o0
	mulscc	%o6,	0x1D83,	%i1
	umul	%g6,	0x1C50,	%i3
	bshuffle	%f22,	%f6,	%f0
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x14
	tvs	%icc,	0x5
	st	%f10,	[%l7 + 0x40]
	lduh	[%l7 + 0x1E],	%g3
	subc	%i2,	0x0F4D,	%l0
	edge32l	%i6,	%i4,	%o7
	bvs,pn	%xcc,	loop_1262
	fxors	%f10,	%f12,	%f12
	sll	%g1,	%i0,	%l5
	movrgez	%l1,	0x3D2,	%i5
loop_1262:
	movrgez	%i7,	0x36E,	%g4
	bcs,a	%icc,	loop_1263
	tcs	%icc,	0x3
	sth	%o1,	[%l7 + 0x26]
	fnors	%f27,	%f28,	%f18
loop_1263:
	be	loop_1264
	fnegs	%f5,	%f23
	fmovrsne	%o2,	%f19,	%f2
	fzero	%f12
loop_1264:
	fpackfix	%f20,	%f5
	fbg	%fcc3,	loop_1265
	fnot1	%f12,	%f10
	fandnot1	%f4,	%f12,	%f26
	edge16n	%o5,	%g5,	%g7
loop_1265:
	taddcctv	%g2,	%o3,	%l3
	fcmpeq32	%f4,	%f2,	%l2
	smul	%l4,	0x0F7F,	%l6
	fbne	%fcc1,	loop_1266
	orcc	%o4,	0x1CEB,	%o0
	tvc	%xcc,	0x7
	fbul	%fcc3,	loop_1267
loop_1266:
	brlz,a	%o6,	loop_1268
	fnot2s	%f0,	%f15
	set	0x77, %g1
	ldsba	[%l7 + %g1] 0x14,	%g6
loop_1267:
	brgez,a	%i3,	loop_1269
loop_1268:
	fsrc1s	%f10,	%f12
	nop
	setx	loop_1270,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%i1,	0x034A,	%i2
loop_1269:
	nop
	set	0x3E, %l1
	ldsb	[%l7 + %l1],	%l0
	udivcc	%i6,	0x0693,	%i4
loop_1270:
	mova	%xcc,	%o7,	%g1
	fsrc2	%f8,	%f12
	movle	%xcc,	%g3,	%i0
	fmovrslez	%l1,	%f2,	%f1
	sll	%i5,	0x12,	%i7
	fmovdpos	%xcc,	%f8,	%f31
	fnors	%f28,	%f15,	%f14
	tle	%xcc,	0x1
	fmovrslz	%g4,	%f12,	%f14
	fandnot2s	%f20,	%f13,	%f25
	fble	%fcc1,	loop_1271
	srl	%l5,	%o2,	%o5
	edge8	%g5,	%o1,	%g2
	udivcc	%o3,	0x1914,	%g7
loop_1271:
	array8	%l2,	%l4,	%l3
	taddcc	%l6,	%o0,	%o6
	movcs	%xcc,	%o4,	%i3
	fmovrdlz	%i1,	%f0,	%f16
	alignaddr	%i2,	%g6,	%l0
	srax	%i4,	0x0F,	%o7
	fbug,a	%fcc1,	loop_1272
	tg	%xcc,	0x4
	fpsub16s	%f15,	%f6,	%f19
	umul	%i6,	0x16BE,	%g1
loop_1272:
	taddcctv	%g3,	%i0,	%i5
	fmovrdne	%l1,	%f14,	%f18
	popc	0x1554,	%i7
	fmovrdgz	%g4,	%f12,	%f18
	fmovsge	%xcc,	%f18,	%f13
	ldstub	[%l7 + 0x47],	%l5
	fblg,a	%fcc2,	loop_1273
	movgu	%xcc,	%o5,	%o2
	tpos	%icc,	0x4
	movl	%icc,	%o1,	%g5
loop_1273:
	movrlz	%o3,	%g7,	%g2
	nop
	setx	loop_1274,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%xcc,	%l2,	%l4
	fcmple16	%f18,	%f18,	%l3
	xnor	%o0,	0x0D32,	%o6
loop_1274:
	tcc	%icc,	0x3
	tsubcctv	%o4,	%i3,	%l6
	fbo	%fcc2,	loop_1275
	fpack32	%f28,	%f16,	%f20
	membar	0x18
	edge32	%i1,	%g6,	%i2
loop_1275:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x68] %asi,	%l0
	fbue,a	%fcc1,	loop_1276
	movle	%icc,	%i4,	%o7
	movleu	%xcc,	%i6,	%g3
	edge32l	%i0,	%i5,	%g1
loop_1276:
	ldsh	[%l7 + 0x1A],	%l1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g4,	%i7
	sdiv	%o5,	0x0B81,	%o2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x6C] %asi,	%f5
	fmovsgu	%icc,	%f30,	%f15
	andn	%o1,	0x0318,	%g5
	movvc	%xcc,	%o3,	%g7
	stbar
	fsrc2	%f18,	%f22
	fmovdleu	%icc,	%f5,	%f15
	fmovda	%xcc,	%f14,	%f13
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x4D] %asi,	%l5
	fbuge,a	%fcc0,	loop_1277
	fmovrdlez	%l2,	%f26,	%f4
	tl	%icc,	0x2
	fmovsgu	%xcc,	%f5,	%f11
loop_1277:
	fones	%f14
	orcc	%l4,	0x1651,	%g2
	fcmpes	%fcc0,	%f16,	%f8
	set	0x1C, %o7
	swapa	[%l7 + %o7] 0x81,	%o0
	tsubcc	%o6,	%o4,	%i3
	andcc	%l6,	%l3,	%g6
	mulscc	%i2,	0x07C9,	%l0
	flush	%l7 + 0x74
	fandnot2	%f26,	%f30,	%f4
	edge16	%i1,	%o7,	%i4
	sll	%i6,	%g3,	%i0
	umulcc	%i5,	0x081F,	%l1
	brz	%g1,	loop_1278
	movg	%icc,	%i7,	%o5
	subc	%o2,	0x11FB,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1278:
	fpack32	%f18,	%f6,	%f2
	fnegs	%f9,	%f28
	sra	%g5,	0x03,	%o3
	sir	0x0463
	wr	%g0,	0x22,	%asi
	stwa	%o1,	[%l7 + 0x64] %asi
	membar	#Sync
	fsrc2	%f24,	%f16
	brgez	%l5,	loop_1279
	addccc	%l2,	%g7,	%l4
	tneg	%xcc,	0x7
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x14] %asi,	%g2
loop_1279:
	fpsub16	%f14,	%f8,	%f6
	fandnot1s	%f29,	%f24,	%f26
	movrgz	%o6,	0x280,	%o4
	edge16ln	%o0,	%l6,	%l3
	edge16n	%g6,	%i3,	%l0
	set	0x5C, %o5
	swapa	[%l7 + %o5] 0x04,	%i1
	srl	%o7,	0x17,	%i4
	mulx	%i2,	%g3,	%i6
	fabsd	%f30,	%f8
	addc	%i0,	%i5,	%g1
	umulcc	%i7,	%o5,	%o2
	bleu,a	loop_1280
	tcs	%xcc,	0x0
	fsrc1	%f6,	%f26
	tsubcc	%l1,	0x0B12,	%g4
loop_1280:
	faligndata	%f22,	%f0,	%f20
	movle	%xcc,	%o3,	%o1
	fba,a	%fcc1,	loop_1281
	xorcc	%l5,	0x003A,	%l2
	brgez,a	%g5,	loop_1282
	taddcc	%l4,	0x0134,	%g2
loop_1281:
	ba,pn	%icc,	loop_1283
	movrne	%o6,	0x2D3,	%o4
loop_1282:
	fnors	%f14,	%f7,	%f18
	orcc	%g7,	0x0DF2,	%l6
loop_1283:
	flush	%l7 + 0x7C
	fpack16	%f2,	%f13
	brz,a	%o0,	loop_1284
	tle	%icc,	0x4
	tsubcc	%g6,	%l3,	%l0
	fmovrdlz	%i1,	%f18,	%f14
loop_1284:
	udivcc	%o7,	0x13C9,	%i4
	movrne	%i3,	0x0EB,	%i2
	fbul,a	%fcc3,	loop_1285
	fmovrse	%i6,	%f3,	%f26
	tcs	%icc,	0x0
	addccc	%g3,	0x07DD,	%i5
loop_1285:
	lduh	[%l7 + 0x12],	%i0
	brgz,a	%g1,	loop_1286
	array16	%i7,	%o2,	%l1
	array8	%g4,	%o5,	%o1
	andn	%l5,	%l2,	%g5
loop_1286:
	taddcctv	%o3,	%g2,	%l4
	subcc	%o6,	%g7,	%l6
	ld	[%l7 + 0x70],	%f21
	smul	%o4,	%o0,	%g6
	sllx	%l0,	0x07,	%i1
	tg	%icc,	0x1
	xnor	%o7,	0x1E82,	%i4
	ba,pn	%xcc,	loop_1287
	movrgz	%l3,	0x38A,	%i3
	brlez,a	%i6,	loop_1288
	fmuld8ulx16	%f9,	%f31,	%f8
loop_1287:
	array16	%i2,	%i5,	%i0
	set	0x7E, %g6
	lduha	[%l7 + %g6] 0x88,	%g3
loop_1288:
	tl	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x5E] %asi,	%g1
	stb	%i7,	[%l7 + 0x54]
	edge32n	%o2,	%l1,	%g4
	nop
	set	0x58, %l5
	stb	%o1,	[%l7 + %l5]
	brgez	%l5,	loop_1289
	movge	%icc,	%l2,	%g5
	fmovdn	%xcc,	%f29,	%f16
	taddcctv	%o5,	0x0463,	%o3
loop_1289:
	movvc	%icc,	%g2,	%o6
	tneg	%icc,	0x1
	fcmpne16	%f16,	%f28,	%g7
	set	0x4D, %g7
	ldsba	[%l7 + %g7] 0x14,	%l6
	fpsub16s	%f22,	%f9,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%o4,	[%l7 + 0x10]
	fba	%fcc3,	loop_1290
	edge8l	%l4,	%g6,	%l0
	edge16n	%i1,	%o7,	%i4
	fblg,a	%fcc0,	loop_1291
loop_1290:
	andcc	%l3,	0x1805,	%i3
	fpackfix	%f18,	%f29
	movleu	%xcc,	%o0,	%i2
loop_1291:
	sub	%i6,	0x0319,	%i0
	orncc	%i5,	0x158C,	%g3
	bne,a	loop_1292
	fandnot2	%f20,	%f14,	%f20
	tg	%xcc,	0x5
	fbul	%fcc2,	loop_1293
loop_1292:
	bne,a	loop_1294
	fand	%f12,	%f18,	%f6
	tsubcctv	%g1,	0x0A75,	%i7
loop_1293:
	fornot2	%f14,	%f4,	%f14
loop_1294:
	tneg	%xcc,	0x7
	ldsb	[%l7 + 0x0C],	%l1
	movrlz	%g4,	%o1,	%l5
	te	%xcc,	0x0
	sdivcc	%l2,	0x0F6F,	%o2
	xorcc	%g5,	%o3,	%o5
	fones	%f6
	alignaddrl	%o6,	%g7,	%l6
	fmovrsgez	%o4,	%f21,	%f7
	fmovrdlz	%g2,	%f16,	%f12
	movrne	%g6,	0x3EC,	%l4
	movvs	%xcc,	%i1,	%l0
	movne	%icc,	%i4,	%l3
	movle	%icc,	%i3,	%o7
	edge8l	%i2,	%i6,	%i0
	tle	%icc,	0x7
	fpsub32	%f8,	%f6,	%f4
	bvc,pt	%icc,	loop_1295
	tsubcctv	%i5,	%g3,	%g1
	stw	%i7,	[%l7 + 0x44]
	movne	%icc,	%l1,	%g4
loop_1295:
	fcmpes	%fcc0,	%f4,	%f8
	siam	0x7
	fpsub16	%f22,	%f18,	%f16
	set	0x20, %i0
	stwa	%o0,	[%l7 + %i0] 0x04
	tsubcc	%l5,	0x143D,	%o1
	and	%o2,	0x03B7,	%g5
	movrgez	%l2,	%o3,	%o5
	udiv	%g7,	0x16DB,	%o6
	fpadd32s	%f5,	%f17,	%f28
	addccc	%o4,	0x0EE5,	%l6
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movleu	%icc,	%g6,	%l4
	movg	%icc,	%g2,	%l0
	stx	%i1,	[%l7 + 0x10]
	edge16l	%l3,	%i4,	%o7
	fnors	%f2,	%f16,	%f6
	fbo	%fcc1,	loop_1296
	movgu	%icc,	%i3,	%i2
	smul	%i0,	%i5,	%i6
	umulcc	%g1,	%i7,	%l1
loop_1296:
	edge16	%g4,	%g3,	%o0
	andcc	%l5,	0x17CE,	%o1
	alignaddrl	%o2,	%l2,	%g5
	tl	%xcc,	0x4
	orn	%o3,	%o5,	%o6
	fmuld8sux16	%f15,	%f21,	%f28
	subccc	%o4,	0x1FCE,	%g7
	fxor	%f30,	%f12,	%f14
	nop
	setx loop_1297, %l0, %l1
	jmpl %l1, %l6
	edge16n	%g6,	%l4,	%g2
	movneg	%xcc,	%l0,	%l3
	fmovdpos	%icc,	%f11,	%f23
loop_1297:
	membar	0x44
	fmul8x16al	%f10,	%f26,	%f30
	movrgez	%i1,	0x0CA,	%o7
	movcc	%icc,	%i3,	%i2
	wr	%g0,	0xea,	%asi
	stxa	%i0,	[%l7 + 0x58] %asi
	membar	#Sync
	fbul	%fcc0,	loop_1298
	and	%i4,	%i6,	%g1
	bleu,pt	%icc,	loop_1299
	move	%xcc,	%i7,	%l1
loop_1298:
	stw	%g4,	[%l7 + 0x68]
	fcmpeq32	%f6,	%f26,	%g3
loop_1299:
	be	loop_1300
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o0,	%l5,	%i5
	fornot1s	%f24,	%f8,	%f8
loop_1300:
	fpack32	%f0,	%f0,	%f14
	orncc	%o1,	0x1B09,	%o2
	udiv	%l2,	0x0281,	%o3
	wr	%g0,	0x27,	%asi
	stxa	%o5,	[%l7 + 0x08] %asi
	membar	#Sync
	xnor	%g5,	%o4,	%o6
	smul	%g7,	0x02E0,	%g6
	bvc,a	loop_1301
	fmovsgu	%icc,	%f14,	%f16
	edge16	%l4,	%l6,	%g2
	fpadd32	%f16,	%f8,	%f22
loop_1301:
	smulcc	%l3,	0x1FB9,	%i1
	fpadd16	%f28,	%f14,	%f4
	edge8ln	%o7,	%i3,	%i2
	edge16	%i0,	%l0,	%i6
	tleu	%icc,	0x7
	sir	0x1FCB
	sdivx	%i4,	0x0F57,	%g1
	fsrc1	%f22,	%f8
	fmovscs	%xcc,	%f9,	%f0
	tne	%icc,	0x1
	movl	%icc,	%i7,	%g4
	taddcctv	%g3,	%o0,	%l5
	fmovrdlz	%l1,	%f22,	%f2
	brgez	%i5,	loop_1302
	fpadd32	%f30,	%f22,	%f4
	fcmpgt32	%f30,	%f20,	%o1
	fnegs	%f12,	%f12
loop_1302:
	movge	%xcc,	%o2,	%l2
	fnand	%f8,	%f14,	%f8
	fpack16	%f30,	%f2
	movleu	%icc,	%o3,	%g5
	fbu	%fcc1,	loop_1303
	sub	%o5,	%o6,	%g7
	subccc	%o4,	%g6,	%l6
	srax	%g2,	%l4,	%l3
loop_1303:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x67],	%i1
	movn	%icc,	%o7,	%i3
	fmovsa	%icc,	%f4,	%f1
	fands	%f12,	%f8,	%f13
	fcmple16	%f22,	%f22,	%i2
	fcmps	%fcc2,	%f4,	%f3
	st	%f8,	[%l7 + 0x10]
	movg	%xcc,	%l0,	%i0
	sethi	0x0A60,	%i4
	movre	%g1,	0x0B1,	%i6
	fbug	%fcc3,	loop_1304
	smul	%g4,	0x0D92,	%i7
	sdivcc	%o0,	0x0A17,	%l5
	stb	%l1,	[%l7 + 0x63]
loop_1304:
	tge	%icc,	0x5
	tleu	%icc,	0x0
	array8	%i5,	%o1,	%o2
	fbug	%fcc3,	loop_1305
	fmovdge	%icc,	%f2,	%f18
	tn	%xcc,	0x1
	fmovdleu	%xcc,	%f30,	%f11
loop_1305:
	taddcctv	%l2,	%g3,	%g5
	fmovrdgez	%o5,	%f16,	%f2
	ldx	[%l7 + 0x70],	%o6
	orn	%o3,	0x02FD,	%o4
	movrlz	%g7,	0x227,	%l6
	sra	%g2,	0x11,	%l4
	tsubcctv	%l3,	%i1,	%g6
	smul	%o7,	%i3,	%i2
	fbg	%fcc3,	loop_1306
	taddcc	%l0,	0x014C,	%i4
	sth	%i0,	[%l7 + 0x26]
	movn	%xcc,	%g1,	%i6
loop_1306:
	xnor	%g4,	0x1CF1,	%o0
	ldx	[%l7 + 0x08],	%l5
	sdivcc	%l1,	0x18EB,	%i5
	fxnors	%f22,	%f2,	%f15
	smulcc	%o1,	%o2,	%l2
	taddcc	%g3,	%g5,	%i7
	movn	%icc,	%o6,	%o5
	fnor	%f6,	%f16,	%f14
	movne	%xcc,	%o3,	%g7
	umulcc	%o4,	%g2,	%l4
	addcc	%l3,	0x0B20,	%l6
	bn,a,pn	%icc,	loop_1307
	xor	%g6,	%o7,	%i3
	movrne	%i2,	%l0,	%i4
	sll	%i0,	%g1,	%i1
loop_1307:
	fmovsge	%icc,	%f28,	%f5
	sll	%g4,	%o0,	%l5
	orn	%l1,	0x1BF7,	%i5
	fmovdcs	%icc,	%f8,	%f27
	fornot2s	%f18,	%f15,	%f22
	fmovrsne	%i6,	%f1,	%f20
	tleu	%xcc,	0x0
	edge8n	%o1,	%o2,	%l2
	movvc	%icc,	%g5,	%i7
	smul	%o6,	0x1FE2,	%o5
	ldstub	[%l7 + 0x5C],	%o3
	faligndata	%f30,	%f8,	%f16
	fornot1	%f14,	%f26,	%f30
	or	%g7,	0x121E,	%g3
	membar	0x51
	srax	%g2,	0x00,	%o4
	udivcc	%l3,	0x1922,	%l4
	bn	loop_1308
	lduw	[%l7 + 0x3C],	%g6
	set	0x54, %o3
	sta	%f8,	[%l7 + %o3] 0x15
loop_1308:
	umul	%o7,	%l6,	%i2
	fbug,a	%fcc0,	loop_1309
	edge32	%i3,	%i4,	%i0
	edge32l	%g1,	%i1,	%l0
	array16	%o0,	%g4,	%l5
loop_1309:
	fpadd32	%f6,	%f22,	%f2
	subc	%l1,	%i6,	%o1
	mulx	%i5,	%l2,	%o2
	sllx	%g5,	%o6,	%i7
	fcmpgt32	%f16,	%f2,	%o5
	fpadd16	%f10,	%f2,	%f22
	orcc	%o3,	0x0EF2,	%g3
	fmovrdne	%g7,	%f0,	%f30
	fbul,a	%fcc2,	loop_1310
	srax	%o4,	0x14,	%g2
	edge32n	%l3,	%l4,	%o7
	ldsw	[%l7 + 0x7C],	%l6
loop_1310:
	fbn	%fcc3,	loop_1311
	subccc	%i2,	0x1AA3,	%i3
	fbue	%fcc0,	loop_1312
	movg	%icc,	%i4,	%i0
loop_1311:
	tsubcctv	%g1,	%g6,	%l0
	edge8	%o0,	%g4,	%i1
loop_1312:
	edge32l	%l1,	%i6,	%o1
	udiv	%i5,	0x06CA,	%l2
	tsubcc	%o2,	0x04A0,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o6,	%g5,	%o5
	orn	%i7,	%g3,	%g7
	mulscc	%o4,	%o3,	%l3
	srl	%g2,	%l4,	%o7
	fnot1	%f16,	%f16
	edge8ln	%i2,	%i3,	%i4
	udivx	%l6,	0x0931,	%g1
	smulcc	%g6,	%i0,	%l0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x66] %asi,	%o0
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x30] %asi,	%g4
	smulcc	%l1,	%i1,	%i6
	movrlez	%i5,	%o1,	%l2
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x40] %asi,	%o2
	edge16ln	%l5,	%o6,	%g5
	set	0x30, %o0
	prefetcha	[%l7 + %o0] 0x89,	 0x2
	tpos	%xcc,	0x6
	set	0x30, %o1
	stda	%g2,	[%l7 + %o1] 0x23
	membar	#Sync
	fblg,a	%fcc1,	loop_1313
	ldd	[%l7 + 0x58],	%g6
	sethi	0x030A,	%i7
	orcc	%o3,	%l3,	%g2
loop_1313:
	edge8l	%o4,	%l4,	%i2
	fbuge	%fcc0,	loop_1314
	movrgez	%o7,	0x1D3,	%i3
	tvc	%xcc,	0x5
	edge8ln	%l6,	%i4,	%g1
loop_1314:
	alignaddrl	%i0,	%l0,	%o0
	ble,a,pn	%icc,	loop_1315
	tsubcc	%g6,	%l1,	%g4
	fmovsge	%xcc,	%f20,	%f4
	te	%icc,	0x2
loop_1315:
	siam	0x6
	movcc	%xcc,	%i6,	%i1
	ba,a	%icc,	loop_1316
	udiv	%i5,	0x1BF3,	%o1
	movle	%xcc,	%o2,	%l2
	ble,a,pn	%xcc,	loop_1317
loop_1316:
	movn	%icc,	%l5,	%o6
	alignaddrl	%g5,	%g3,	%g7
	fand	%f24,	%f18,	%f0
loop_1317:
	edge32l	%o5,	%i7,	%l3
	tpos	%xcc,	0x2
	popc	0x0BF6,	%g2
	movrlz	%o3,	%o4,	%i2
	movvs	%icc,	%l4,	%o7
	fcmpeq32	%f26,	%f24,	%i3
	sll	%i4,	%l6,	%g1
	fsrc2s	%f23,	%f9
	array16	%l0,	%o0,	%i0
	edge8ln	%l1,	%g4,	%i6
	fxnors	%f0,	%f9,	%f15
	fandnot2	%f26,	%f12,	%f4
	fnegs	%f22,	%f24
	fmovdg	%xcc,	%f22,	%f22
	array32	%g6,	%i1,	%i5
	sll	%o1,	%l2,	%o2
	udivcc	%o6,	0x0219,	%g5
	wr	%g0,	0x0c,	%asi
	sta	%f15,	[%l7 + 0x48] %asi
	wr	%g0,	0x19,	%asi
	sta	%f27,	[%l7 + 0x74] %asi
	fmovrslz	%l5,	%f22,	%f28
	ld	[%l7 + 0x68],	%f30
	std	%f30,	[%l7 + 0x48]
	tvs	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f21,	%f3
	mulscc	%g3,	%o5,	%g7
	xor	%l3,	%g2,	%o3
	fnands	%f7,	%f7,	%f0
	bcc,pn	%icc,	loop_1318
	tneg	%icc,	0x7
	tne	%xcc,	0x5
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x58] %asi,	%f14
loop_1318:
	fmovrse	%i7,	%f25,	%f28
	addcc	%o4,	0x1C90,	%i2
	set	0x20, %l2
	ldda	[%l7 + %l2] 0x2c,	%l4
	ldstub	[%l7 + 0x40],	%i3
	edge16l	%i4,	%o7,	%l6
	fbu,a	%fcc0,	loop_1319
	bvc,a,pn	%icc,	loop_1320
	edge8	%g1,	%l0,	%i0
	fnegd	%f0,	%f26
loop_1319:
	be,a	%icc,	loop_1321
loop_1320:
	tge	%icc,	0x6
	addcc	%o0,	0x1DB8,	%l1
	movcc	%icc,	%g4,	%i6
loop_1321:
	tg	%icc,	0x0
	array16	%i1,	%g6,	%o1
	movrlz	%i5,	%o2,	%o6
	be,pn	%xcc,	loop_1322
	udiv	%g5,	0x091E,	%l2
	tsubcc	%g3,	0x09A7,	%l5
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x1e,	%f0
loop_1322:
	movpos	%icc,	%o5,	%g7
	array16	%l3,	%g2,	%i7
	movrgez	%o4,	%o3,	%l4
	or	%i2,	%i3,	%i4
	movrne	%l6,	0x25D,	%o7
	fmovdn	%icc,	%f28,	%f17
	membar	0x6E
	smul	%g1,	%l0,	%i0
	edge8	%l1,	%g4,	%i6
	subcc	%i1,	%o0,	%o1
	addccc	%g6,	0x1E72,	%o2
	sllx	%o6,	0x0A,	%g5
	tneg	%xcc,	0x5
	sra	%i5,	%g3,	%l5
	tge	%xcc,	0x6
	or	%l2,	%o5,	%g7
	edge32n	%l3,	%i7,	%o4
	edge16n	%g2,	%l4,	%i2
	membar	0x0A
	brnz	%i3,	loop_1323
	bcs,a	loop_1324
	umul	%i4,	%l6,	%o3
	fba	%fcc3,	loop_1325
loop_1323:
	tg	%icc,	0x7
loop_1324:
	stbar
	srax	%g1,	0x1B,	%o7
loop_1325:
	bgu,a	%xcc,	loop_1326
	movcc	%xcc,	%i0,	%l1
	te	%xcc,	0x5
	fmovscc	%icc,	%f31,	%f7
loop_1326:
	movrlz	%l0,	%g4,	%i1
	movg	%icc,	%i6,	%o1
	fmovde	%xcc,	%f16,	%f9
	fmul8ulx16	%f28,	%f28,	%f2
	fcmpgt16	%f10,	%f2,	%g6
	stw	%o0,	[%l7 + 0x78]
	fbug,a	%fcc0,	loop_1327
	mulscc	%o2,	%o6,	%g5
	fmovspos	%icc,	%f20,	%f27
	tle	%icc,	0x4
loop_1327:
	ble,a,pn	%xcc,	loop_1328
	fmovdleu	%icc,	%f0,	%f26
	edge8	%i5,	%l5,	%l2
	fmovdl	%xcc,	%f29,	%f19
loop_1328:
	tn	%icc,	0x0
	stb	%g3,	[%l7 + 0x1A]
	edge8l	%o5,	%g7,	%l3
	taddcctv	%o4,	0x0AF8,	%g2
	set	0x40, %l4
	ldstuba	[%l7 + %l4] 0x0c,	%l4
	umulcc	%i7,	%i3,	%i2
	or	%l6,	%i4,	%o3
	edge16l	%g1,	%o7,	%l1
	tcc	%xcc,	0x0
	fbg	%fcc0,	loop_1329
	movg	%icc,	%l0,	%i0
	movre	%g4,	0x3A5,	%i6
	edge16	%i1,	%g6,	%o1
loop_1329:
	fbne	%fcc2,	loop_1330
	andcc	%o0,	%o6,	%g5
	fxors	%f13,	%f26,	%f2
	wr	%g0,	0x89,	%asi
	stha	%o2,	[%l7 + 0x2A] %asi
loop_1330:
	tne	%xcc,	0x4
	bshuffle	%f22,	%f6,	%f30
	fmovdpos	%icc,	%f9,	%f17
	add	%i5,	%l2,	%g3
	tne	%xcc,	0x3
	be,pt	%xcc,	loop_1331
	orncc	%o5,	0x1E20,	%g7
	orcc	%l5,	%o4,	%l3
	sub	%g2,	0x1BC2,	%i7
loop_1331:
	movpos	%xcc,	%i3,	%i2
	fbn,a	%fcc1,	loop_1332
	xnor	%l4,	0x13D2,	%l6
	mova	%icc,	%i4,	%o3
	tle	%icc,	0x3
loop_1332:
	brnz	%o7,	loop_1333
	fbg	%fcc3,	loop_1334
	udivx	%g1,	0x0AC4,	%l1
	ld	[%l7 + 0x18],	%f15
loop_1333:
	movrlez	%i0,	%g4,	%l0
loop_1334:
	std	%f10,	[%l7 + 0x50]
	fmovsg	%xcc,	%f18,	%f5
	stx	%i6,	[%l7 + 0x78]
	udivcc	%i1,	0x0804,	%o1
	movne	%xcc,	%o0,	%o6
	sllx	%g6,	0x19,	%g5
	add	%i5,	%l2,	%g3
	fcmple16	%f8,	%f10,	%o5
	faligndata	%f8,	%f10,	%f14
	std	%o2,	[%l7 + 0x40]
	fbu,a	%fcc0,	loop_1335
	ba,a,pt	%xcc,	loop_1336
	te	%icc,	0x5
	sdiv	%l5,	0x0831,	%o4
loop_1335:
	subcc	%g7,	%g2,	%i7
loop_1336:
	ldx	[%l7 + 0x18],	%i3
	edge32n	%i2,	%l3,	%l4
	tn	%xcc,	0x5
	fbue	%fcc3,	loop_1337
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc2,	loop_1338
	be,a	loop_1339
loop_1337:
	ta	%xcc,	0x4
	movcc	%icc,	%l6,	%o3
loop_1338:
	edge16n	%i4,	%o7,	%g1
loop_1339:
	mova	%xcc,	%i0,	%g4
	sethi	0x1979,	%l1
	tvc	%icc,	0x3
	tcc	%icc,	0x0
	mulscc	%l0,	%i6,	%i1
	addc	%o0,	%o1,	%g6
	tsubcc	%o6,	0x00B4,	%i5
	xnor	%g5,	0x0A6C,	%l2
	fbul,a	%fcc3,	loop_1340
	fmovrse	%o5,	%f0,	%f2
	fmovrsgz	%g3,	%f7,	%f0
	ldstub	[%l7 + 0x10],	%o2
loop_1340:
	andn	%o4,	0x1734,	%g7
	movn	%xcc,	%g2,	%l5
	fmovsgu	%xcc,	%f8,	%f5
	movcs	%icc,	%i7,	%i2
	movrgez	%i3,	%l4,	%l3
	brnz,a	%o3,	loop_1341
	tne	%xcc,	0x6
	bgu	%xcc,	loop_1342
	edge32l	%i4,	%l6,	%o7
loop_1341:
	andcc	%i0,	0x1635,	%g4
	andn	%l1,	%l0,	%g1
loop_1342:
	fmovrsgez	%i1,	%f26,	%f1
	fmuld8sux16	%f19,	%f30,	%f10
	fmovsle	%icc,	%f18,	%f29
	edge16l	%o0,	%i6,	%g6
	movrne	%o6,	%o1,	%i5
	fcmpgt32	%f10,	%f16,	%l2
	fmovsne	%icc,	%f18,	%f14
	fcmpeq16	%f2,	%f6,	%g5
	stbar
	fcmple16	%f22,	%f4,	%g3
	fzeros	%f21
	movg	%icc,	%o5,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%g7,	%g2
	popc	%o4,	%l5
	bshuffle	%f6,	%f4,	%f20
	std	%f28,	[%l7 + 0x48]
	fmovscc	%icc,	%f10,	%f12
	edge32n	%i2,	%i3,	%l4
	fxnors	%f14,	%f29,	%f16
	fpackfix	%f12,	%f17
	movrne	%i7,	%l3,	%o3
	fbul	%fcc0,	loop_1343
	edge8n	%i4,	%l6,	%o7
	tsubcc	%g4,	%i0,	%l1
	edge16n	%g1,	%i1,	%o0
loop_1343:
	tvs	%xcc,	0x5
	fmovda	%icc,	%f5,	%f31
	lduh	[%l7 + 0x38],	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%g6,	%o6
	bcs,a,pn	%icc,	loop_1344
	stbar
	ldstub	[%l7 + 0x76],	%o1
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x3
loop_1344:
	movrlez	%i6,	0x0F6,	%l2
	ba	loop_1345
	tpos	%xcc,	0x2
	edge16n	%g3,	%g5,	%o2
	fsrc1s	%f31,	%f25
loop_1345:
	movrgez	%g7,	%o5,	%o4
	fbo	%fcc3,	loop_1346
	bvc	loop_1347
	sdivcc	%g2,	0x1B0A,	%l5
	edge8	%i2,	%i3,	%l4
loop_1346:
	fbule,a	%fcc2,	loop_1348
loop_1347:
	tcs	%xcc,	0x2
	fnegd	%f24,	%f6
	orncc	%i7,	0x08DF,	%l3
loop_1348:
	movrlez	%o3,	0x262,	%i4
	alignaddrl	%l6,	%o7,	%g4
	movre	%l1,	0x2D8,	%g1
	sub	%i0,	0x1438,	%i1
	fmovsl	%xcc,	%f10,	%f18
	edge32l	%o0,	%l0,	%g6
	movrne	%o6,	%o1,	%i6
	ldsh	[%l7 + 0x6A],	%l2
	fxnors	%f12,	%f30,	%f29
	edge32l	%i5,	%g5,	%g3
	set	0x18, %g4
	ldswa	[%l7 + %g4] 0x15,	%g7
	wr	%g0,	0x11,	%asi
	sta	%f28,	[%l7 + 0x58] %asi
	movcc	%icc,	%o2,	%o5
	fornot1	%f18,	%f10,	%f26
	xnor	%g2,	0x1CFE,	%l5
	alignaddr	%o4,	%i3,	%i2
	fmovdpos	%icc,	%f30,	%f11
	andcc	%l4,	0x0273,	%i7
	edge16l	%o3,	%l3,	%i4
	array16	%l6,	%o7,	%l1
	fsrc2	%f8,	%f22
	edge16n	%g4,	%i0,	%g1
	movcs	%icc,	%i1,	%l0
	movgu	%xcc,	%o0,	%o6
	umul	%g6,	0x0F5E,	%o1
	subccc	%l2,	0x0D5F,	%i5
	movg	%xcc,	%i6,	%g3
	for	%f20,	%f18,	%f18
	alignaddr	%g7,	%o2,	%o5
	fpack16	%f16,	%f24
	ta	%xcc,	0x1
	addccc	%g5,	0x102F,	%l5
	ldx	[%l7 + 0x08],	%o4
	fmovdleu	%icc,	%f21,	%f29
	and	%g2,	%i3,	%l4
	popc	%i2,	%i7
	fmul8x16au	%f16,	%f22,	%f20
	tleu	%icc,	0x0
	bn	%xcc,	loop_1349
	pdist	%f14,	%f22,	%f30
	sllx	%l3,	0x09,	%o3
	movrlez	%i4,	0x273,	%o7
loop_1349:
	umul	%l1,	0x13D1,	%g4
	fpsub16	%f4,	%f18,	%f4
	addccc	%i0,	%g1,	%i1
	srl	%l6,	0x09,	%l0
	bcc,a	%xcc,	loop_1350
	edge16	%o0,	%g6,	%o1
	fand	%f10,	%f16,	%f14
	lduh	[%l7 + 0x7C],	%l2
loop_1350:
	movgu	%icc,	%o6,	%i5
	te	%icc,	0x6
	bvc,a	loop_1351
	faligndata	%f18,	%f10,	%f26
	taddcc	%i6,	%g3,	%o2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%g5
loop_1351:
	srax	%g7,	0x18,	%l5
	sdivcc	%g2,	0x10E5,	%i3
	tpos	%xcc,	0x2
	tg	%xcc,	0x7
	brz	%o4,	loop_1352
	taddcctv	%i2,	0x0F77,	%l4
	fblg,a	%fcc0,	loop_1353
	fcmpeq16	%f12,	%f20,	%l3
loop_1352:
	array8	%o3,	%i4,	%i7
	alignaddr	%l1,	%o7,	%i0
loop_1353:
	brnz	%g1,	loop_1354
	fpsub16	%f12,	%f20,	%f18
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
loop_1354:
	edge32n	%i1,	%l6,	%l0
	srax	%o0,	%o1,	%g6
	fmovd	%f26,	%f16
	movleu	%xcc,	%l2,	%i5
	bpos,pn	%icc,	loop_1355
	tsubcc	%o6,	%g3,	%i6
	andn	%o2,	0x0818,	%g5
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
loop_1355:
	ble	%icc,	loop_1356
	edge32ln	%o5,	%g2,	%l5
	mulx	%o4,	0x1169,	%i2
	set	0x42, %i5
	stha	%i3,	[%l7 + %i5] 0x04
loop_1356:
	fnot1s	%f13,	%f5
	fmovdl	%xcc,	%f24,	%f24
	edge16n	%l3,	%l4,	%i4
	edge16	%o3,	%i7,	%o7
	edge16n	%i0,	%g1,	%l1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x10,	%i1,	%l6
	fexpand	%f27,	%f2
	sdivx	%l0,	0x1699,	%o0
	set	0x68, %l6
	ldswa	[%l7 + %l6] 0x10,	%o1
	fpadd16	%f18,	%f30,	%f8
	sllx	%g4,	%g6,	%l2
	smulcc	%o6,	0x128C,	%g3
	and	%i6,	0x041E,	%o2
	fzeros	%f19
	fbule	%fcc0,	loop_1357
	movg	%xcc,	%g5,	%i5
	tvs	%xcc,	0x3
	tgu	%icc,	0x4
loop_1357:
	sir	0x160A
	bne,a	loop_1358
	be,a	%icc,	loop_1359
	call	loop_1360
	movrlez	%g7,	%g2,	%l5
loop_1358:
	udiv	%o5,	0x1120,	%i2
loop_1359:
	bneg	loop_1361
loop_1360:
	fmul8sux16	%f18,	%f28,	%f12
	tne	%xcc,	0x2
	set	0x0C, %g5
	stha	%o4,	[%l7 + %g5] 0x27
	membar	#Sync
loop_1361:
	addc	%i3,	%l4,	%i4
	fpadd32	%f2,	%f4,	%f24
	fble	%fcc1,	loop_1362
	movn	%icc,	%l3,	%i7
	andcc	%o3,	0x1BB2,	%o7
	movne	%icc,	%i0,	%l1
loop_1362:
	fbuge,a	%fcc1,	loop_1363
	fornot1	%f0,	%f14,	%f10
	mulscc	%i1,	0x00FB,	%l6
	faligndata	%f20,	%f18,	%f10
loop_1363:
	sdivx	%l0,	0x1974,	%o0
	nop
	set	0x36, %l0
	ldsb	[%l7 + %l0],	%o1
	tsubcctv	%g1,	%g4,	%l2
	sdivcc	%g6,	0x0592,	%g3
	sllx	%o6,	%i6,	%g5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x10,	%o2,	%g7
	srl	%g2,	0x11,	%l5
	sllx	%i5,	0x18,	%i2
	alignaddrl	%o4,	%i3,	%o5
	sdivx	%i4,	0x1A35,	%l3
	sethi	0x1214,	%l4
	movrlz	%o3,	%i7,	%i0
	array32	%o7,	%l1,	%l6
	tl	%icc,	0x5
	xnorcc	%i1,	0x0C1B,	%o0
	tgu	%icc,	0x3
	bcs,pn	%icc,	loop_1364
	fmovsleu	%icc,	%f11,	%f18
	movn	%xcc,	%o1,	%l0
	edge8l	%g1,	%g4,	%g6
loop_1364:
	edge32ln	%l2,	%g3,	%i6
	udivcc	%o6,	0x0E37,	%g5
	mulx	%o2,	%g7,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge	%fcc0,	loop_1365
	ldx	[%l7 + 0x18],	%i5
	fmuld8ulx16	%f4,	%f11,	%f18
	addcc	%i2,	0x01A5,	%o4
loop_1365:
	edge8	%l5,	%o5,	%i3
	umul	%i4,	0x01EA,	%l3
	fornot2s	%f26,	%f31,	%f9
	ldstub	[%l7 + 0x2B],	%l4
	bpos,pt	%icc,	loop_1366
	edge8ln	%i7,	%o3,	%i0
	addc	%l1,	%o7,	%l6
	taddcc	%o0,	0x0FD3,	%i1
loop_1366:
	ldd	[%l7 + 0x68],	%f22
	edge32	%l0,	%g1,	%o1
	fblg	%fcc1,	loop_1367
	mova	%xcc,	%g4,	%g6
	and	%g3,	%i6,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1367:
	movrgez	%o6,	0x0E6,	%g5
	fmovdcs	%xcc,	%f11,	%f25
	sdiv	%g7,	0x07C0,	%g2
	sth	%o2,	[%l7 + 0x5A]
	mova	%xcc,	%i2,	%o4
	fmul8x16	%f9,	%f8,	%f30
	xor	%i5,	0x173A,	%o5
	fpsub16s	%f4,	%f6,	%f8
	movrgez	%l5,	0x12B,	%i3
	sir	0x0C0F
	orcc	%l3,	0x0978,	%i4
	faligndata	%f18,	%f0,	%f10
	movle	%icc,	%i7,	%l4
	tn	%xcc,	0x1
	movcs	%xcc,	%o3,	%l1
	st	%f2,	[%l7 + 0x10]
	wr	%g0,	0x0c,	%asi
	stxa	%o7,	[%l7 + 0x40] %asi
	movn	%icc,	%i0,	%l6
	fmovsl	%icc,	%f4,	%f15
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x30] %asi,	%i1
	edge32n	%o0,	%l0,	%g1
	fsrc1	%f0,	%f12
	tn	%icc,	0x1
	tsubcctv	%o1,	0x0000,	%g6
	movneg	%icc,	%g3,	%g4
	tle	%xcc,	0x7
	udivcc	%i6,	0x0CA8,	%o6
	edge8n	%l2,	%g5,	%g2
	tcs	%xcc,	0x1
	nop
	setx loop_1368, %l0, %l1
	jmpl %l1, %g7
	xnor	%i2,	%o4,	%i5
	movn	%xcc,	%o5,	%l5
	or	%i3,	0x0C5E,	%o2
loop_1368:
	tcc	%xcc,	0x2
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x80
	tle	%xcc,	0x3
	st	%f24,	[%l7 + 0x78]
	xnor	%i4,	%l3,	%l4
	array8	%i7,	%l1,	%o7
	sra	%i0,	0x1D,	%o3
	fmovrslez	%l6,	%f14,	%f8
	addcc	%i1,	%l0,	%o0
	ldx	[%l7 + 0x08],	%g1
	array32	%o1,	%g6,	%g4
	edge32n	%g3,	%o6,	%l2
	fornot1s	%f7,	%f0,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f10,	%f12
	andcc	%i6,	%g5,	%g7
	fbl,a	%fcc0,	loop_1369
	movrne	%g2,	0x119,	%i2
	fzeros	%f27
	fmovdl	%icc,	%f26,	%f31
loop_1369:
	fmovrdne	%i5,	%f30,	%f8
	tcs	%xcc,	0x0
	fmovrdlez	%o5,	%f10,	%f24
	tsubcctv	%o4,	0x1C8A,	%i3
	movrlz	%o2,	%i4,	%l5
	bge	loop_1370
	xnor	%l3,	%i7,	%l4
	movrlz	%l1,	%o7,	%i0
	tsubcc	%o3,	%l6,	%l0
loop_1370:
	ldstub	[%l7 + 0x47],	%o0
	brgez	%g1,	loop_1371
	bcs,a,pn	%xcc,	loop_1372
	tg	%icc,	0x7
	bl,a	loop_1373
loop_1371:
	taddcctv	%o1,	0x17EE,	%g6
loop_1372:
	nop
	wr	%g0,	0x2a,	%asi
	stda	%i0,	[%l7 + 0x48] %asi
	membar	#Sync
loop_1373:
	tge	%xcc,	0x1
	taddcc	%g3,	%o6,	%l2
	fpadd32	%f24,	%f16,	%f4
	addcc	%i6,	0x1B4B,	%g5
	ldsh	[%l7 + 0x0A],	%g7
	sub	%g2,	0x0239,	%g4
	bn	loop_1374
	movneg	%icc,	%i5,	%i2
	movrgz	%o5,	%i3,	%o2
	tle	%xcc,	0x3
loop_1374:
	andcc	%o4,	0x064B,	%l5
	fbule,a	%fcc1,	loop_1375
	fnot2s	%f10,	%f16
	fblg	%fcc1,	loop_1376
	movrgz	%l3,	%i4,	%i7
loop_1375:
	sllx	%l4,	%l1,	%o7
	fmovsvs	%icc,	%f8,	%f19
loop_1376:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
	faligndata	%f30,	%f26,	%f0
	fmovsg	%xcc,	%f12,	%f3
	stx	%o0,	[%l7 + 0x18]
	tcc	%xcc,	0x5
	fsrc2s	%f1,	%f28
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x2A] %asi,	%l0
	tg	%xcc,	0x2
	fmovdcc	%xcc,	%f7,	%f18
	stb	%g1,	[%l7 + 0x34]
	fornot1	%f6,	%f30,	%f24
	wr	%g0,	0x80,	%asi
	stwa	%o1,	[%l7 + 0x54] %asi
	fsrc2	%f0,	%f12
	fmovrsgez	%i1,	%f5,	%f26
	taddcc	%g6,	0x0199,	%o6
	fpadd32	%f28,	%f26,	%f26
	xnorcc	%l2,	%i6,	%g3
	fcmpeq16	%f28,	%f24,	%g5
	tl	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0A] %asi,	%g7
	edge32n	%g4,	%i5,	%g2
	brlz,a	%i2,	loop_1377
	fblg	%fcc1,	loop_1378
	fmovsvc	%icc,	%f11,	%f27
	xorcc	%i3,	%o5,	%o4
loop_1377:
	movgu	%icc,	%o2,	%l3
loop_1378:
	subcc	%i4,	0x081C,	%l5
	sdivcc	%l4,	0x06E3,	%l1
	tsubcctv	%i7,	0x1DBB,	%o7
	alignaddrl	%l6,	%o3,	%o0
	movrlz	%i0,	0x0C7,	%l0
	alignaddrl	%o1,	%g1,	%i1
	tl	%xcc,	0x5
	fmovsleu	%icc,	%f12,	%f5
	fsrc2	%f4,	%f26
	srlx	%o6,	0x00,	%g6
	tcc	%xcc,	0x4
	xor	%i6,	0x140B,	%l2
	fblg	%fcc3,	loop_1379
	lduw	[%l7 + 0x68],	%g3
	fpackfix	%f10,	%f23
	fandnot2s	%f7,	%f3,	%f2
loop_1379:
	sll	%g7,	%g4,	%g5
	bpos	loop_1380
	sdiv	%g2,	0x1686,	%i2
	nop
	setx	loop_1381,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umul	%i3,	%o5,	%i5
loop_1380:
	fmovdne	%xcc,	%f2,	%f19
	fmovdl	%xcc,	%f7,	%f28
loop_1381:
	or	%o2,	0x185A,	%l3
	ldsw	[%l7 + 0x78],	%o4
	mulscc	%l5,	%l4,	%l1
	movl	%icc,	%i7,	%i4
	mulx	%o7,	%o3,	%o0
	movl	%icc,	%l6,	%i0
	popc	%l0,	%o1
	taddcc	%i1,	0x199F,	%o6
	movle	%xcc,	%g1,	%i6
	ldx	[%l7 + 0x60],	%g6
	fblg,a	%fcc2,	loop_1382
	edge32l	%g3,	%g7,	%g4
	sdivcc	%l2,	0x1F84,	%g2
	fsrc2	%f0,	%f24
loop_1382:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g5,	%i3
	fbuge	%fcc3,	loop_1383
	edge8n	%o5,	%i5,	%o2
	tsubcc	%i2,	%l3,	%o4
	and	%l5,	0x0A5D,	%l4
loop_1383:
	tneg	%icc,	0x3
	movrgz	%l1,	0x1F2,	%i4
	fmovse	%xcc,	%f31,	%f22
	orn	%o7,	%o3,	%i7
	smul	%l6,	%i0,	%l0
	movrlez	%o0,	0x112,	%i1
	fmovsg	%icc,	%f16,	%f12
	tsubcc	%o1,	%g1,	%o6
	fmovscc	%icc,	%f27,	%f17
	fmovdpos	%icc,	%f18,	%f25
	smul	%g6,	%i6,	%g7
	fmul8sux16	%f0,	%f4,	%f4
	subc	%g3,	0x0A5D,	%l2
	lduh	[%l7 + 0x50],	%g2
	bgu	%xcc,	loop_1384
	movn	%icc,	%g4,	%g5
	fmovsa	%icc,	%f31,	%f26
	fones	%f8
loop_1384:
	andcc	%i3,	0x15BE,	%i5
	fble,a	%fcc0,	loop_1385
	stx	%o5,	[%l7 + 0x28]
	movneg	%xcc,	%i2,	%l3
	tcc	%xcc,	0x5
loop_1385:
	brnz	%o4,	loop_1386
	fba,a	%fcc3,	loop_1387
	movcs	%xcc,	%o2,	%l4
	fornot1s	%f23,	%f19,	%f4
loop_1386:
	fmovrsne	%l5,	%f4,	%f19
loop_1387:
	movn	%xcc,	%l1,	%o7
	bvc,a,pn	%icc,	loop_1388
	move	%icc,	%o3,	%i7
	bcc,pn	%xcc,	loop_1389
	tsubcc	%l6,	%i0,	%l0
loop_1388:
	fpackfix	%f26,	%f3
	orn	%o0,	%i1,	%o1
loop_1389:
	array16	%i4,	%g1,	%g6
	edge16ln	%i6,	%o6,	%g7
	fmovdcs	%icc,	%f1,	%f26
	sll	%l2,	%g3,	%g2
	bcc,pt	%icc,	loop_1390
	taddcctv	%g5,	0x0761,	%i3
	sll	%i5,	%o5,	%g4
	movpos	%icc,	%l3,	%o4
loop_1390:
	edge16n	%i2,	%l4,	%l5
	brlez,a	%o2,	loop_1391
	ldd	[%l7 + 0x50],	%l0
	array16	%o3,	%o7,	%l6
	fbuge	%fcc1,	loop_1392
loop_1391:
	fmovdne	%xcc,	%f31,	%f26
	movvs	%xcc,	%i0,	%l0
	andncc	%i7,	%o0,	%o1
loop_1392:
	tneg	%xcc,	0x1
	fmovde	%icc,	%f11,	%f27
	fbe	%fcc2,	loop_1393
	mulscc	%i1,	%g1,	%i4
	fbne	%fcc3,	loop_1394
	orncc	%g6,	0x0386,	%o6
loop_1393:
	fnands	%f22,	%f3,	%f25
	movl	%xcc,	%g7,	%l2
loop_1394:
	sth	%g3,	[%l7 + 0x3E]
	fmovscc	%xcc,	%f1,	%f0
	ldsw	[%l7 + 0x28],	%g2
	fmuld8sux16	%f15,	%f3,	%f14
	set	0x08, %g2
	swapa	[%l7 + %g2] 0x0c,	%i6
	movrgez	%g5,	%i5,	%i3
	edge16l	%g4,	%o5,	%l3
	fxnors	%f31,	%f26,	%f11
	fbuge	%fcc2,	loop_1395
	array16	%i2,	%l4,	%o4
	xnor	%l5,	0x0962,	%l1
	movvc	%icc,	%o2,	%o3
loop_1395:
	move	%icc,	%o7,	%l6
	sdivx	%i0,	0x170D,	%i7
	tle	%xcc,	0x4
	fpack16	%f30,	%f10
	movvc	%xcc,	%o0,	%l0
	fcmped	%fcc1,	%f28,	%f20
	prefetch	[%l7 + 0x2C],	 0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i1,	0x0D5F,	%g1
	tleu	%xcc,	0x0
	array32	%o1,	%g6,	%i4
	udivx	%o6,	0x0E13,	%l2
	umul	%g3,	%g7,	%g2
	xnorcc	%g5,	0x1062,	%i6
	bne,a,pn	%xcc,	loop_1396
	fmovdge	%icc,	%f16,	%f9
	ldub	[%l7 + 0x1C],	%i5
	tne	%xcc,	0x0
loop_1396:
	movvc	%xcc,	%g4,	%i3
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x2c,	%l2
	movcc	%xcc,	%o5,	%i2
	fand	%f0,	%f8,	%f2
	fpadd16s	%f12,	%f1,	%f12
	fbul,a	%fcc3,	loop_1397
	fmovdvs	%icc,	%f18,	%f26
	edge16n	%o4,	%l5,	%l4
	srl	%l1,	%o3,	%o2
loop_1397:
	tsubcctv	%o7,	0x1ECD,	%l6
	ldsh	[%l7 + 0x52],	%i7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%i0,	%o0
	udivx	%i1,	0x0FE6,	%g1
	movrlz	%o1,	%l0,	%g6
	fmovrdlz	%o6,	%f0,	%f6
	tg	%xcc,	0x4
	edge16ln	%l2,	%g3,	%i4
	array8	%g7,	%g2,	%i6
	edge32n	%g5,	%g4,	%i5
	for	%f16,	%f12,	%f6
	movne	%xcc,	%i3,	%o5
	fxnors	%f6,	%f9,	%f22
	fmovsa	%icc,	%f14,	%f8
	ldd	[%l7 + 0x68],	%f6
	mulx	%i2,	0x1111,	%l3
	tneg	%xcc,	0x2
	sir	0x1874
	edge8ln	%o4,	%l4,	%l1
	alignaddrl	%l5,	%o3,	%o7
	tge	%xcc,	0x5
	st	%f3,	[%l7 + 0x44]
	andncc	%o2,	%i7,	%l6
	set	0x38, %l3
	prefetcha	[%l7 + %l3] 0x88,	 0x1
	movre	%o0,	0x1A6,	%g1
	edge16n	%i1,	%l0,	%g6
	fbn,a	%fcc1,	loop_1398
	fmovrslz	%o1,	%f3,	%f16
	mulscc	%o6,	0x079F,	%l2
	fcmple16	%f2,	%f26,	%g3
loop_1398:
	nop
	wr	%g0,	0x11,	%asi
	stba	%g7,	[%l7 + 0x41] %asi
	udiv	%g2,	0x0618,	%i4
	or	%i6,	%g4,	%g5
	edge8ln	%i5,	%o5,	%i2
	sethi	0x02D0,	%l3
	fbo	%fcc1,	loop_1399
	membar	0x34
	srl	%o4,	0x0B,	%i3
	tcc	%icc,	0x0
loop_1399:
	addccc	%l4,	0x0A53,	%l5
	fmovsvc	%xcc,	%f11,	%f2
	fabsd	%f14,	%f30
	movvs	%icc,	%l1,	%o3
	tle	%xcc,	0x7
	smulcc	%o7,	0x1E91,	%o2
	ta	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x1C] %asi,	%l6
	bvc,pt	%xcc,	loop_1400
	alignaddr	%i0,	%i7,	%o0
	ldsh	[%l7 + 0x0A],	%i1
	movrlez	%l0,	%g1,	%g6
loop_1400:
	orn	%o6,	%l2,	%o1
	fbug	%fcc2,	loop_1401
	srax	%g3,	0x19,	%g2
	addc	%g7,	0x0B1F,	%i4
	fcmpeq16	%f4,	%f10,	%g4
loop_1401:
	fble	%fcc0,	loop_1402
	fxors	%f12,	%f8,	%f31
	fbule	%fcc0,	loop_1403
	tcc	%icc,	0x5
loop_1402:
	tneg	%icc,	0x2
	movvc	%xcc,	%i6,	%i5
loop_1403:
	fmovdleu	%xcc,	%f26,	%f8
	fbn	%fcc2,	loop_1404
	umulcc	%o5,	%i2,	%g5
	orncc	%o4,	0x1ECD,	%i3
	edge16	%l3,	%l4,	%l1
loop_1404:
	membar	0x02
	bl,a,pt	%xcc,	loop_1405
	fble,a	%fcc2,	loop_1406
	bge,a,pt	%xcc,	loop_1407
	fbn,a	%fcc1,	loop_1408
loop_1405:
	fmovsne	%xcc,	%f7,	%f17
loop_1406:
	xor	%o3,	0x1963,	%l5
loop_1407:
	fcmpne32	%f24,	%f2,	%o7
loop_1408:
	fbl,a	%fcc1,	loop_1409
	srlx	%l6,	0x07,	%o2
	movrne	%i0,	%i7,	%i1
	fmovrse	%o0,	%f19,	%f23
loop_1409:
	edge8ln	%l0,	%g1,	%o6
	ble,pn	%icc,	loop_1410
	tne	%icc,	0x1
	movneg	%icc,	%l2,	%g6
	ldsb	[%l7 + 0x59],	%o1
loop_1410:
	nop
	set	0x28, %o6
	prefetcha	[%l7 + %o6] 0x80,	 0x3
	tvs	%icc,	0x6
	ba,a,pn	%icc,	loop_1411
	ldx	[%l7 + 0x28],	%g7
	movge	%icc,	%i4,	%g4
	fmovrslz	%g2,	%f23,	%f26
loop_1411:
	subcc	%i5,	0x0AC6,	%i6
	tneg	%xcc,	0x5
	bleu	%xcc,	loop_1412
	stx	%o5,	[%l7 + 0x10]
	call	loop_1413
	ba	loop_1414
loop_1412:
	fmovrdlz	%i2,	%f0,	%f28
	movrlez	%g5,	0x350,	%o4
loop_1413:
	bn,pt	%xcc,	loop_1415
loop_1414:
	fpadd16s	%f22,	%f6,	%f18
	addcc	%l3,	0x1148,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1415:
	andcc	%l4,	%o3,	%l5
	fbg	%fcc3,	loop_1416
	bpos	%icc,	loop_1417
	nop
	setx	loop_1418,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tne	%icc,	0x6
loop_1416:
	taddcctv	%o7,	0x09F8,	%l1
loop_1417:
	ld	[%l7 + 0x54],	%f28
loop_1418:
	fnors	%f18,	%f26,	%f24
	udivx	%o2,	0x0748,	%l6
	subccc	%i0,	0x198A,	%i1
	bcc,a,pn	%icc,	loop_1419
	edge8ln	%o0,	%l0,	%g1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%i7
loop_1419:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x3
	fmovda	%icc,	%f13,	%f27
	ta	%icc,	0x3
	xorcc	%l2,	%o1,	%g6
	fmovdle	%icc,	%f0,	%f15
	fandnot2s	%f29,	%f19,	%f21
	movrgz	%g7,	%i4,	%g3
	movgu	%icc,	%g4,	%i5
	nop
	setx loop_1420, %l0, %l1
	jmpl %l1, %g2
	fbule	%fcc2,	loop_1421
	andcc	%o5,	%i6,	%g5
	wr	%g0,	0x89,	%asi
	stba	%o4,	[%l7 + 0x61] %asi
loop_1420:
	bneg,a,pt	%xcc,	loop_1422
loop_1421:
	bcs,pn	%xcc,	loop_1423
	fcmpne16	%f2,	%f26,	%l3
	swap	[%l7 + 0x4C],	%i3
loop_1422:
	fbn,a	%fcc1,	loop_1424
loop_1423:
	subccc	%l4,	%o3,	%l5
	movrlez	%i2,	%l1,	%o7
	fcmpeq16	%f2,	%f6,	%o2
loop_1424:
	ble,pt	%icc,	loop_1425
	movcs	%icc,	%i0,	%i1
	fmul8x16al	%f21,	%f12,	%f12
	tcc	%icc,	0x2
loop_1425:
	sll	%l6,	%o0,	%g1
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movg	%icc,	%l0,	%o6
	fmovrdgez	%l2,	%f12,	%f12
	udivcc	%i7,	0x150D,	%o1
	movvc	%icc,	%g7,	%g6
	orncc	%i4,	%g3,	%g4
	nop
	set	0x20, %i3
	stx	%g2,	[%l7 + %i3]
	subccc	%o5,	%i6,	%g5
	be,a,pn	%icc,	loop_1426
	st	%f8,	[%l7 + 0x38]
	tpos	%xcc,	0x0
	umulcc	%i5,	0x094B,	%l3
loop_1426:
	movrgez	%o4,	0x014,	%i3
	edge8	%l4,	%o3,	%i2
	mova	%icc,	%l5,	%o7
	fmovsg	%xcc,	%f9,	%f25
	sethi	0x0E5F,	%o2
	tle	%xcc,	0x3
	addcc	%l1,	%i1,	%i0
	fmovdpos	%xcc,	%f28,	%f28
	sub	%l6,	0x1608,	%o0
	orn	%g1,	%l0,	%l2
	movpos	%icc,	%o6,	%i7
	udivx	%o1,	0x1F77,	%g6
	movneg	%xcc,	%g7,	%i4
	edge8ln	%g3,	%g4,	%g2
	xnor	%o5,	%i6,	%g5
	xor	%l3,	0x0CFD,	%i5
	array8	%i3,	%o4,	%l4
	tge	%xcc,	0x6
	bleu	%icc,	loop_1427
	fcmps	%fcc1,	%f5,	%f24
	bn,pt	%xcc,	loop_1428
	sll	%o3,	0x11,	%i2
loop_1427:
	array8	%o7,	%l5,	%l1
	orn	%o2,	%i1,	%i0
loop_1428:
	bleu	%xcc,	loop_1429
	sllx	%o0,	%g1,	%l0
	fmovsgu	%icc,	%f6,	%f9
	udiv	%l2,	0x05AD,	%l6
loop_1429:
	xorcc	%o6,	0x1BBA,	%i7
	movcc	%icc,	%o1,	%g7
	tn	%xcc,	0x5
	array16	%g6,	%g3,	%i4
	umul	%g2,	0x05AD,	%o5
	subc	%g4,	0x1516,	%i6
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%l3
	wr	%g0,	0x2b,	%asi
	stwa	%i5,	[%l7 + 0x38] %asi
	membar	#Sync
	movg	%xcc,	%i3,	%g5
	edge16n	%o4,	%l4,	%o3
	fbu,a	%fcc2,	loop_1430
	movl	%xcc,	%i2,	%o7
	movl	%xcc,	%l5,	%o2
	ld	[%l7 + 0x40],	%f7
loop_1430:
	fmovdneg	%icc,	%f25,	%f17
	umulcc	%l1,	%i1,	%o0
	movrgz	%i0,	0x025,	%l0
	sir	0x19D6
	tn	%icc,	0x7
	fmovsa	%xcc,	%f1,	%f18
	fmovsvc	%xcc,	%f25,	%f30
	array8	%l2,	%l6,	%o6
	add	%i7,	0x03EE,	%g1
	tcs	%icc,	0x0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%g6
	orn	%g3,	%g7,	%g2
	ta	%xcc,	0x5
	edge16n	%i4,	%o5,	%g4
	set	0x80, %o2
	ldxa	[%g0 + %o2] 0x58,	%i6
	udivx	%l3,	0x1D7C,	%i5
	st	%f21,	[%l7 + 0x40]
	bleu,pn	%icc,	loop_1431
	movvc	%xcc,	%i3,	%o4
	orcc	%l4,	0x1EB8,	%o3
	stw	%g5,	[%l7 + 0x08]
loop_1431:
	sdivx	%o7,	0x1CDF,	%i2
	nop
	setx	loop_1432,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	flush	%l7 + 0x7C
	te	%xcc,	0x5
	edge16	%l5,	%l1,	%o2
loop_1432:
	fmovsa	%xcc,	%f12,	%f11
	movl	%icc,	%i1,	%o0
	movcc	%xcc,	%l0,	%i0
	fmovdpos	%xcc,	%f20,	%f31
	udiv	%l2,	0x13B2,	%o6
	bcs	loop_1433
	siam	0x6
	movn	%icc,	%l6,	%g1
	tn	%xcc,	0x0
loop_1433:
	nop
	set	0x08, %o4
	ldstuba	[%l7 + %o4] 0x80,	%o1
	set	0x6A, %g3
	lduba	[%l7 + %g3] 0x19,	%i7
	edge16	%g6,	%g7,	%g3
	te	%icc,	0x5
	te	%xcc,	0x2
	add	%g2,	%o5,	%g4
	set	0x40, %i2
	sta	%f28,	[%l7 + %i2] 0x14
	fbug,a	%fcc3,	loop_1434
	movrlez	%i4,	%i6,	%l3
	fmovrslez	%i5,	%f27,	%f0
	movrgz	%o4,	%l4,	%i3
loop_1434:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%o3,	%g5
	ta	%xcc,	0x4
	srax	%o7,	%l5,	%i2
	andncc	%l1,	%o2,	%o0
	fcmpes	%fcc0,	%f12,	%f8
	addccc	%l0,	%i0,	%l2
	fbe,a	%fcc1,	loop_1435
	stw	%o6,	[%l7 + 0x70]
	umul	%l6,	0x15A2,	%g1
	tle	%icc,	0x6
loop_1435:
	fbu,a	%fcc1,	loop_1436
	fnands	%f12,	%f21,	%f11
	movrgez	%o1,	0x0EF,	%i1
	movpos	%icc,	%i7,	%g7
loop_1436:
	movleu	%xcc,	%g6,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba	%fcc1,	loop_1437
	fmovs	%f12,	%f13
	srax	%g2,	0x09,	%o5
	fmovdleu	%icc,	%f17,	%f11
loop_1437:
	fbuge	%fcc1,	loop_1438
	fcmple32	%f18,	%f18,	%i4
	andcc	%g4,	%l3,	%i6
	srax	%i5,	%l4,	%i3
loop_1438:
	alignaddr	%o4,	%g5,	%o7
	edge8n	%l5,	%o3,	%i2
	mulx	%o2,	0x1F09,	%l1
	set	0x4E, %i1
	lduba	[%l7 + %i1] 0x88,	%l0
	tsubcctv	%o0,	0x1DF7,	%i0
	fble	%fcc3,	loop_1439
	movrlz	%o6,	%l6,	%l2
	tsubcc	%g1,	0x1DFE,	%o1
	fmovrdne	%i1,	%f4,	%f12
loop_1439:
	fbule,a	%fcc0,	loop_1440
	fbu,a	%fcc2,	loop_1441
	movcs	%xcc,	%g7,	%g6
	movrlz	%g3,	%i7,	%o5
loop_1440:
	sll	%g2,	0x03,	%i4
loop_1441:
	fbuge,a	%fcc3,	loop_1442
	tsubcctv	%l3,	0x093A,	%i6
	movne	%xcc,	%g4,	%l4
	movrgz	%i3,	%i5,	%o4
loop_1442:
	fmovrslez	%g5,	%f20,	%f16
	fmovrslz	%o7,	%f1,	%f22
	fnot2s	%f7,	%f3
	fbl	%fcc2,	loop_1443
	movge	%xcc,	%o3,	%i2
	umul	%l5,	%l1,	%l0
	subc	%o0,	%i0,	%o6
loop_1443:
	tn	%icc,	0x4
	stw	%l6,	[%l7 + 0x2C]
	tsubcc	%l2,	0x0C1B,	%o2
	brgez	%o1,	loop_1444
	movgu	%icc,	%i1,	%g7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%g1
loop_1444:
	fornot2	%f10,	%f6,	%f22
	srax	%g3,	0x0B,	%o5
	movcc	%icc,	%i7,	%i4
	movcs	%xcc,	%g2,	%l3
	set	0x34, %g1
	ldswa	[%l7 + %g1] 0x15,	%g4
	movge	%icc,	%i6,	%l4
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movrlez	%i5,	%o4,	%g5
	ldsh	[%l7 + 0x78],	%i3
	umulcc	%o3,	%i2,	%l5
	srl	%l1,	0x08,	%o7
	mova	%xcc,	%o0,	%i0
	alignaddrl	%l0,	%o6,	%l6
	edge16	%l2,	%o2,	%o1
	fbug	%fcc2,	loop_1445
	brlez,a	%i1,	loop_1446
	te	%icc,	0x0
	mulscc	%g6,	%g1,	%g7
loop_1445:
	movvc	%xcc,	%o5,	%g3
loop_1446:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x18] %asi,	%i7
	sllx	%i4,	0x11,	%l3
	set	0x1C, %l1
	ldswa	[%l7 + %l1] 0x14,	%g4
	fpsub32s	%f11,	%f16,	%f28
	xorcc	%i6,	0x0C09,	%l4
	edge8	%g2,	%o4,	%g5
	bn,a	loop_1447
	mulx	%i3,	%o3,	%i2
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1447:
	tgu	%xcc,	0x7
	fcmpne32	%f26,	%f28,	%l5
	umulcc	%l1,	0x0A9A,	%i5
	movrlz	%o7,	0x29C,	%i0
	udivx	%o0,	0x0C75,	%l0
	srax	%o6,	0x0B,	%l6
	alignaddrl	%l2,	%o1,	%i1
	move	%icc,	%g6,	%g1
	bl	loop_1448
	fmovsa	%icc,	%f16,	%f6
	movne	%icc,	%o2,	%g7
	tge	%xcc,	0x6
loop_1448:
	fmul8sux16	%f18,	%f22,	%f12
	alignaddrl	%g3,	%o5,	%i7
	tvc	%xcc,	0x3
	movne	%xcc,	%i4,	%g4
	edge8n	%l3,	%l4,	%i6
	movge	%xcc,	%o4,	%g2
	sdivx	%i3,	0x1576,	%g5
	movrlez	%i2,	0x3BC,	%o3
	sdiv	%l1,	0x1193,	%i5
	tleu	%icc,	0x7
	set	0x4C, %o7
	ldsha	[%l7 + %o7] 0x18,	%o7
	fzeros	%f21
	addcc	%i0,	0x19DC,	%l5
	nop
	set	0x0C, %g6
	lduh	[%l7 + %g6],	%l0
	fmovsvc	%icc,	%f23,	%f27
	tcc	%icc,	0x1
	bvs	%xcc,	loop_1449
	movne	%xcc,	%o6,	%o0
	popc	%l2,	%o1
	ble,a	%xcc,	loop_1450
loop_1449:
	ldstub	[%l7 + 0x35],	%i1
	fcmped	%fcc0,	%f24,	%f6
	edge8	%l6,	%g1,	%g6
loop_1450:
	fpsub16	%f22,	%f30,	%f2
	movre	%g7,	0x274,	%g3
	xorcc	%o5,	%o2,	%i7
	ldd	[%l7 + 0x40],	%f18
	edge16n	%i4,	%g4,	%l3
	mulx	%i6,	0x01B9,	%o4
	fcmpd	%fcc3,	%f10,	%f8
	tcc	%xcc,	0x6
	movpos	%icc,	%l4,	%g2
	movrlez	%i3,	0x24D,	%g5
	addc	%i2,	%o3,	%l1
	movvs	%icc,	%o7,	%i5
	popc	0x0E48,	%l5
	fmovsleu	%xcc,	%f6,	%f10
	ldsw	[%l7 + 0x2C],	%l0
	set	0x32, %l5
	stba	%i0,	[%l7 + %l5] 0x27
	membar	#Sync
	fcmpne16	%f10,	%f12,	%o6
	fandnot1s	%f16,	%f22,	%f10
	tneg	%xcc,	0x2
	tcs	%icc,	0x0
	tne	%xcc,	0x7
	fcmps	%fcc3,	%f2,	%f8
	fbu	%fcc3,	loop_1451
	sllx	%o0,	%o1,	%l2
	movvc	%icc,	%i1,	%g1
	movrne	%g6,	0x190,	%g7
loop_1451:
	membar	0x1F
	edge8n	%g3,	%o5,	%o2
	movre	%i7,	0x142,	%l6
	andn	%i4,	%g4,	%l3
	array32	%o4,	%i6,	%g2
	popc	%l4,	%g5
	fmovsa	%xcc,	%f3,	%f18
	udivcc	%i2,	0x0741,	%o3
	xnorcc	%i3,	0x0AF7,	%o7
	tcs	%xcc,	0x5
	orn	%i5,	%l1,	%l0
	bge	%xcc,	loop_1452
	mova	%xcc,	%i0,	%l5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%o1
loop_1452:
	stx	%l2,	[%l7 + 0x70]
	edge32n	%o0,	%i1,	%g1
	fbge,a	%fcc1,	loop_1453
	andn	%g7,	%g3,	%o5
	array8	%o2,	%i7,	%g6
	mulscc	%i4,	0x097B,	%l6
loop_1453:
	flush	%l7 + 0x58
	fmovsa	%icc,	%f14,	%f2
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x10
	tcc	%xcc,	0x1
	fmovsne	%icc,	%f20,	%f27
	add	%l3,	%o4,	%i6
	array32	%g4,	%g2,	%g5
	tsubcctv	%i2,	0x1329,	%l4
	ldsh	[%l7 + 0x1E],	%i3
	fnor	%f22,	%f4,	%f2
	sethi	0x016C,	%o3
	set	0x3C, %i0
	ldswa	[%l7 + %i0] 0x88,	%o7
	edge32	%i5,	%l0,	%l1
	tpos	%xcc,	0x2
	bleu,a,pn	%icc,	loop_1454
	bl,pn	%xcc,	loop_1455
	mova	%icc,	%l5,	%i0
	wr	%g0,	0x0c,	%asi
	stda	%o6,	[%l7 + 0x68] %asi
loop_1454:
	edge8ln	%l2,	%o1,	%i1
loop_1455:
	alignaddrl	%g1,	%o0,	%g7
	movrne	%g3,	%o5,	%i7
	fmul8x16au	%f13,	%f7,	%f10
	fmovrsgz	%o2,	%f9,	%f8
	sir	0x0771
	movvc	%icc,	%i4,	%l6
	fcmped	%fcc0,	%f22,	%f12
	fbge,a	%fcc2,	loop_1456
	array32	%g6,	%o4,	%i6
	set	0x37, %o5
	ldsba	[%l7 + %o5] 0x11,	%g4
loop_1456:
	fxor	%f26,	%f10,	%f28
	fzeros	%f22
	fmovsge	%icc,	%f13,	%f11
	movle	%icc,	%g2,	%g5
	std	%i2,	[%l7 + 0x58]
	fzero	%f26
	xorcc	%l3,	%l4,	%o3
	fbg	%fcc0,	loop_1457
	nop
	set	0x68, %o0
	std	%o6,	[%l7 + %o0]
	fmovsne	%icc,	%f8,	%f17
	edge16ln	%i3,	%l0,	%l1
loop_1457:
	bpos,a,pt	%xcc,	loop_1458
	fmovdle	%icc,	%f17,	%f20
	fpsub32s	%f4,	%f10,	%f11
	std	%f14,	[%l7 + 0x70]
loop_1458:
	tl	%icc,	0x5
	fmovsge	%icc,	%f17,	%f17
	bl	%icc,	loop_1459
	smulcc	%i5,	%l5,	%i0
	fmul8sux16	%f8,	%f4,	%f18
	sub	%o6,	0x0A24,	%l2
loop_1459:
	fmovdl	%icc,	%f16,	%f3
	te	%xcc,	0x6
	edge32ln	%i1,	%g1,	%o0
	alignaddrl	%g7,	%g3,	%o5
	fblg	%fcc0,	loop_1460
	edge16l	%o1,	%o2,	%i4
	addcc	%l6,	%i7,	%o4
	fornot2s	%f23,	%f8,	%f18
loop_1460:
	xorcc	%g6,	0x0952,	%g4
	subcc	%i6,	%g5,	%g2
	nop
	setx	loop_1461,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnor	%i2,	0x0F24,	%l4
	tvc	%xcc,	0x1
	fbug	%fcc1,	loop_1462
loop_1461:
	movrgez	%l3,	%o3,	%o7
	udiv	%i3,	0x0B8A,	%l0
	fnot2s	%f26,	%f29
loop_1462:
	nop
	set	0x10, %o3
	prefetcha	[%l7 + %o3] 0x19,	 0x3
	bge,pt	%icc,	loop_1463
	sllx	%l5,	%i0,	%o6
	sethi	0x1276,	%l2
	fpmerge	%f3,	%f28,	%f22
loop_1463:
	orn	%i5,	%g1,	%o0
	tsubcc	%i1,	%g3,	%o5
	te	%xcc,	0x0
	move	%icc,	%o1,	%o2
	fcmpgt16	%f30,	%f14,	%g7
	edge8n	%l6,	%i4,	%o4
	fbl,a	%fcc0,	loop_1464
	fpackfix	%f24,	%f14
	sub	%i7,	0x144B,	%g4
	tgu	%xcc,	0x0
loop_1464:
	edge32ln	%i6,	%g6,	%g2
	udivcc	%g5,	0x1E93,	%i2
	udivx	%l4,	0x11BB,	%o3
	stbar
	fble,a	%fcc1,	loop_1465
	srlx	%l3,	%i3,	%l0
	fcmps	%fcc1,	%f19,	%f11
	array32	%l1,	%l5,	%i0
loop_1465:
	fbule	%fcc1,	loop_1466
	siam	0x5
	prefetch	[%l7 + 0x44],	 0x1
	tneg	%icc,	0x3
loop_1466:
	bgu	loop_1467
	edge16	%o6,	%l2,	%i5
	st	%f16,	[%l7 + 0x44]
	addc	%o7,	%g1,	%i1
loop_1467:
	edge32ln	%g3,	%o5,	%o1
	movrgez	%o0,	0x133,	%o2
	subccc	%l6,	%g7,	%i4
	fbu,a	%fcc2,	loop_1468
	faligndata	%f0,	%f10,	%f26
	addc	%i7,	%o4,	%g4
	fmovdgu	%xcc,	%f13,	%f3
loop_1468:
	taddcctv	%i6,	0x088B,	%g2
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x43] %asi,	%g6
	fmovsl	%icc,	%f3,	%f14
	set	0x28, %l2
	stda	%g4,	[%l7 + %l2] 0x23
	membar	#Sync
	or	%i2,	%o3,	%l3
	umulcc	%i3,	0x1C6D,	%l4
	bvs,a	loop_1469
	fmovscc	%xcc,	%f13,	%f4
	tn	%xcc,	0x2
	mova	%xcc,	%l1,	%l5
loop_1469:
	umulcc	%l0,	%o6,	%l2
	edge8l	%i0,	%i5,	%g1
	fmul8sux16	%f20,	%f16,	%f22
	movcc	%xcc,	%i1,	%o7
	orn	%g3,	%o5,	%o0
	andn	%o2,	%o1,	%g7
	tvs	%xcc,	0x3
	orn	%i4,	%i7,	%o4
	edge32ln	%g4,	%i6,	%g2
	fnand	%f30,	%f16,	%f0
	andcc	%l6,	0x0854,	%g5
	subcc	%g6,	0x16CC,	%i2
	alignaddrl	%l3,	%i3,	%o3
	or	%l4,	%l5,	%l1
	mulx	%l0,	0x1C9D,	%l2
	bgu,a,pt	%xcc,	loop_1470
	sdiv	%o6,	0x00BB,	%i0
	alignaddr	%g1,	%i1,	%o7
	movl	%icc,	%i5,	%o5
loop_1470:
	tn	%xcc,	0x5
	umul	%g3,	0x18DA,	%o0
	edge16ln	%o2,	%g7,	%i4
	fandnot1	%f2,	%f8,	%f28
	fbule,a	%fcc2,	loop_1471
	array32	%o1,	%i7,	%o4
	fbue	%fcc1,	loop_1472
	sdiv	%i6,	0x0F2C,	%g4
loop_1471:
	movl	%icc,	%l6,	%g2
	and	%g6,	%g5,	%i2
loop_1472:
	fnand	%f6,	%f0,	%f6
	fmovdleu	%xcc,	%f9,	%f18
	or	%i3,	0x0F61,	%l3
	sll	%o3,	0x0A,	%l4
	array16	%l5,	%l0,	%l1
	udiv	%o6,	0x169A,	%l2
	fnot2s	%f31,	%f18
	movn	%xcc,	%g1,	%i0
	edge16ln	%o7,	%i5,	%o5
	fsrc1s	%f29,	%f13
	udiv	%i1,	0x14FC,	%o0
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	udivx	%o2,	0x0D3E,	%g3
	fpackfix	%f0,	%f3
	bne,a	loop_1473
	array16	%g7,	%i4,	%o1
	fsrc2	%f24,	%f28
	andcc	%i7,	%o4,	%g4
loop_1473:
	fmovrdlz	%l6,	%f26,	%f30
	movrgez	%g2,	0x1AE,	%i6
	fbo,a	%fcc1,	loop_1474
	bshuffle	%f28,	%f20,	%f20
	sdiv	%g5,	0x0176,	%g6
	sdivx	%i2,	0x1B10,	%i3
loop_1474:
	tpos	%icc,	0x5
	movrgez	%o3,	%l4,	%l5
	edge16l	%l0,	%l3,	%o6
	umul	%l1,	0x13F4,	%l2
	edge16	%g1,	%o7,	%i0
	fbue	%fcc2,	loop_1475
	fblg,a	%fcc0,	loop_1476
	fpadd32s	%f12,	%f16,	%f22
	array16	%o5,	%i1,	%i5
loop_1475:
	ble	%xcc,	loop_1477
loop_1476:
	ta	%xcc,	0x6
	movpos	%xcc,	%o0,	%g3
	bshuffle	%f22,	%f24,	%f12
loop_1477:
	fmovdle	%xcc,	%f8,	%f11
	sir	0x0BDC
	smul	%o2,	%g7,	%o1
	wr	%g0,	0x80,	%asi
	stxa	%i7,	[%l7 + 0x38] %asi
	tne	%xcc,	0x7
	fandnot1	%f10,	%f26,	%f12
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%o4
	std	%i4,	[%l7 + 0x68]
	tsubcc	%l6,	0x1498,	%g4
	movvc	%xcc,	%g2,	%i6
	tle	%icc,	0x7
	array16	%g5,	%i2,	%g6
	tle	%xcc,	0x2
	set	0x10, %l4
	prefetcha	[%l7 + %l4] 0x15,	 0x1
	tleu	%icc,	0x1
	andn	%l4,	%i3,	%l5
	fabss	%f4,	%f26
	movgu	%xcc,	%l3,	%o6
	tl	%icc,	0x3
	fnot2s	%f11,	%f30
	movgu	%xcc,	%l0,	%l1
	andn	%l2,	0x0ACB,	%o7
	move	%xcc,	%g1,	%o5
	fzero	%f20
	fandnot1s	%f24,	%f16,	%f1
	bleu,pt	%xcc,	loop_1478
	add	%i0,	%i5,	%o0
	movrgez	%g3,	0x012,	%i1
	movge	%xcc,	%o2,	%o1
loop_1478:
	tle	%icc,	0x5
	srlx	%g7,	%o4,	%i4
	sll	%i7,	0x0B,	%l6
	movge	%icc,	%g4,	%g2
	brlez	%g5,	loop_1479
	umul	%i6,	0x0C27,	%g6
	smul	%o3,	0x0DA6,	%i2
	stw	%l4,	[%l7 + 0x5C]
loop_1479:
	edge32	%l5,	%l3,	%o6
	tgu	%icc,	0x0
	fmovdle	%icc,	%f9,	%f23
	umul	%i3,	0x003C,	%l0
	addccc	%l1,	%l2,	%g1
	fmovdne	%xcc,	%f26,	%f21
	subccc	%o5,	%i0,	%i5
	edge8	%o0,	%o7,	%i1
	movpos	%icc,	%g3,	%o2
	udivx	%g7,	0x0A0A,	%o1
	fexpand	%f14,	%f28
	udivx	%o4,	0x1238,	%i7
	fmovsneg	%icc,	%f22,	%f19
	smulcc	%l6,	%g4,	%i4
	fsrc1s	%f25,	%f5
	edge8	%g2,	%i6,	%g5
	fmovse	%icc,	%f7,	%f28
	orncc	%o3,	%g6,	%i2
	fble,a	%fcc0,	loop_1480
	orncc	%l4,	%l5,	%l3
	tsubcc	%i3,	0x1A9B,	%l0
	ta	%icc,	0x5
loop_1480:
	mulscc	%o6,	0x0E45,	%l2
	edge8l	%l1,	%g1,	%i0
	fnegs	%f31,	%f25
	bn,pn	%xcc,	loop_1481
	addcc	%i5,	%o5,	%o7
	movl	%icc,	%i1,	%o0
	fmovdle	%icc,	%f14,	%f18
loop_1481:
	fbl,a	%fcc0,	loop_1482
	ble,a,pt	%xcc,	loop_1483
	stb	%g3,	[%l7 + 0x0D]
	movre	%o2,	0x138,	%o1
loop_1482:
	fmovrdlz	%g7,	%f28,	%f6
loop_1483:
	fba,a	%fcc2,	loop_1484
	edge16n	%i7,	%o4,	%g4
	sra	%l6,	0x14,	%i4
	movg	%xcc,	%i6,	%g2
loop_1484:
	tge	%icc,	0x2
	fbl,a	%fcc0,	loop_1485
	edge32n	%o3,	%g6,	%g5
	edge8	%i2,	%l5,	%l3
	fbo	%fcc2,	loop_1486
loop_1485:
	fmovrdne	%l4,	%f6,	%f0
	fpmerge	%f14,	%f9,	%f8
	sdivx	%l0,	0x0A85,	%i3
loop_1486:
	fbn	%fcc1,	loop_1487
	xnorcc	%o6,	0x177F,	%l2
	tvs	%icc,	0x2
	tne	%icc,	0x7
loop_1487:
	xnor	%l1,	%i0,	%i5
	movrgez	%o5,	0x0EF,	%g1
	edge8	%o7,	%i1,	%o0
	sll	%o2,	%g3,	%g7
	tne	%xcc,	0x5
	movneg	%xcc,	%i7,	%o4
	orcc	%g4,	0x0357,	%o1
	fbg,a	%fcc2,	loop_1488
	tsubcctv	%i4,	0x134D,	%i6
	edge16n	%l6,	%o3,	%g2
	andcc	%g6,	%i2,	%l5
loop_1488:
	nop
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x10,	%f16
	sub	%g5,	0x0E2F,	%l4
	ldd	[%l7 + 0x28],	%l0
	fbe	%fcc3,	loop_1489
	sub	%i3,	0x1585,	%o6
	fpadd16s	%f25,	%f9,	%f12
	bge,a	%icc,	loop_1490
loop_1489:
	addc	%l2,	%l3,	%l1
	sethi	0x0876,	%i0
	flush	%l7 + 0x28
loop_1490:
	movrlez	%o5,	0x29F,	%i5
	fmovsl	%xcc,	%f8,	%f4
	fnors	%f14,	%f22,	%f24
	brlz,a	%g1,	loop_1491
	srax	%o7,	%o0,	%o2
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
loop_1491:
	andncc	%g7,	%i1,	%o4
	bg,a	%xcc,	loop_1492
	movne	%icc,	%i7,	%o1
	xnorcc	%i4,	%g4,	%i6
	edge8	%l6,	%g2,	%g6
loop_1492:
	alignaddrl	%i2,	%l5,	%g5
	umul	%o3,	%l4,	%i3
	edge16	%l0,	%o6,	%l3
	orn	%l1,	%i0,	%l2
	set	0x50, %i5
	stda	%o4,	[%l7 + %i5] 0x11
	srlx	%g1,	0x12,	%i5
	orn	%o0,	0x1DF5,	%o7
	wr	%g0,	0x81,	%asi
	stba	%g3,	[%l7 + 0x09] %asi
	edge32n	%o2,	%i1,	%o4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x31, %l6
	ldstuba	[%l7 + %l6] 0x80,	%i7
	fnot1s	%f8,	%f10
	array32	%g7,	%o1,	%i4
	taddcc	%g4,	0x1F9A,	%l6
	subcc	%i6,	%g2,	%i2
	fbe	%fcc2,	loop_1493
	andn	%l5,	%g5,	%o3
	umulcc	%g6,	0x0ABF,	%i3
	fmovrdlez	%l0,	%f30,	%f12
loop_1493:
	nop
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	add	%o6,	0x08D5,	%l4
	edge8n	%l1,	%l3,	%i0
	fbo,a	%fcc0,	loop_1494
	swap	[%l7 + 0x38],	%o5
	alignaddrl	%g1,	%i5,	%l2
	fexpand	%f21,	%f16
loop_1494:
	edge32	%o7,	%g3,	%o2
	set	0x56, %g4
	ldsha	[%l7 + %g4] 0x10,	%o0
	wr	%g0,	0x80,	%asi
	sta	%f21,	[%l7 + 0x54] %asi
	udivx	%o4,	0x09FC,	%i7
	set	0x60, %l0
	stxa	%g7,	[%l7 + %l0] 0x15
	sir	0x1C56
	tneg	%xcc,	0x5
	movvs	%icc,	%i1,	%o1
	fmovdl	%xcc,	%f14,	%f0
	brgz,a	%i4,	loop_1495
	edge32	%l6,	%i6,	%g2
	andcc	%g4,	0x0309,	%l5
	xor	%i2,	0x11E8,	%o3
loop_1495:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%g5
	ldstub	[%l7 + 0x40],	%g6
	taddcc	%l0,	%o6,	%l4
	fnands	%f5,	%f24,	%f27
	sdiv	%l1,	0x0A2C,	%l3
	srl	%i3,	%o5,	%g1
	array16	%i0,	%l2,	%o7
	orncc	%i5,	%g3,	%o2
	sllx	%o4,	%o0,	%g7
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i1
	alignaddrl	%o1,	%i7,	%i4
	tvs	%icc,	0x3
	orcc	%i6,	0x10A0,	%g2
	fcmple32	%f28,	%f26,	%l6
	subcc	%l5,	%g4,	%o3
	wr	%g0,	0x80,	%asi
	stha	%i2,	[%l7 + 0x54] %asi
	subcc	%g6,	0x12CC,	%l0
	fmuld8ulx16	%f11,	%f2,	%f12
	sir	0x13EC
	fandnot1s	%f1,	%f1,	%f2
	movgu	%icc,	%o6,	%g5
	movrlz	%l1,	%l4,	%i3
	call	loop_1496
	flush	%l7 + 0x54
	movg	%xcc,	%o5,	%g1
	ldd	[%l7 + 0x20],	%f16
loop_1496:
	mulscc	%i0,	%l2,	%o7
	mova	%icc,	%l3,	%g3
	or	%i5,	%o2,	%o4
	fmuld8ulx16	%f28,	%f23,	%f0
	fnors	%f18,	%f7,	%f16
	bleu,pn	%xcc,	loop_1497
	edge8ln	%o0,	%i1,	%g7
	wr	%g0,	0x89,	%asi
	stxa	%i7,	[%l7 + 0x58] %asi
loop_1497:
	ble,pn	%icc,	loop_1498
	fmovsgu	%xcc,	%f8,	%f30
	sdiv	%i4,	0x069F,	%i6
	set	0x1A, %i4
	ldstuba	[%l7 + %i4] 0x04,	%g2
loop_1498:
	fcmple16	%f20,	%f8,	%l6
	fmul8x16au	%f0,	%f22,	%f8
	umul	%o1,	%g4,	%l5
	umulcc	%i2,	%o3,	%l0
	fmovrdlez	%o6,	%f14,	%f18
	lduh	[%l7 + 0x6A],	%g5
	fmovdne	%xcc,	%f6,	%f25
	bpos	%xcc,	loop_1499
	array16	%g6,	%l4,	%l1
	alignaddrl	%o5,	%g1,	%i0
	fmovde	%icc,	%f11,	%f19
loop_1499:
	movvc	%xcc,	%i3,	%l2
	sdiv	%o7,	0x0470,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l3,	%i5,	%o2
	fmovrde	%o0,	%f20,	%f30
	fmovdvs	%icc,	%f9,	%f28
	fmovdcs	%xcc,	%f16,	%f24
	alignaddr	%o4,	%i1,	%g7
	fnot2s	%f0,	%f3
	fmovrslz	%i7,	%f3,	%f10
	tcs	%icc,	0x4
	wr	%g0,	0x10,	%asi
	stda	%i6,	[%l7 + 0x50] %asi
	brgez,a	%i4,	loop_1500
	fmovsgu	%icc,	%f28,	%f8
	fsrc1	%f22,	%f0
	movl	%icc,	%g2,	%o1
loop_1500:
	fmovdne	%icc,	%f27,	%f28
	fblg,a	%fcc3,	loop_1501
	movneg	%icc,	%l6,	%l5
	fandnot1	%f10,	%f26,	%f14
	xnorcc	%i2,	0x1331,	%g4
loop_1501:
	ld	[%l7 + 0x60],	%f12
	movcc	%xcc,	%o3,	%o6
	lduw	[%l7 + 0x5C],	%l0
	sll	%g6,	%g5,	%l1
	fbg	%fcc0,	loop_1502
	sll	%o5,	0x07,	%l4
	sethi	0x0702,	%i0
	bshuffle	%f28,	%f6,	%f30
loop_1502:
	move	%xcc,	%i3,	%g1
	bvs,a,pt	%icc,	loop_1503
	xnorcc	%o7,	%g3,	%l2
	swap	[%l7 + 0x2C],	%l3
	movpos	%xcc,	%o2,	%i5
loop_1503:
	tl	%icc,	0x6
	subc	%o4,	%o0,	%i1
	bl,a,pt	%icc,	loop_1504
	orcc	%i7,	%g7,	%i4
	andncc	%g2,	%i6,	%l6
	fmovdne	%icc,	%f17,	%f19
loop_1504:
	add	%o1,	%l5,	%g4
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x70] %asi,	%o2
	siam	0x1
	fbe	%fcc0,	loop_1505
	nop
	set	0x5C, %g2
	stb	%o6,	[%l7 + %g2]
	tle	%xcc,	0x5
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x0c
loop_1505:
	fbuge,a	%fcc0,	loop_1506
	movrne	%l0,	%i2,	%g6
	stx	%g5,	[%l7 + 0x40]
	te	%icc,	0x6
loop_1506:
	movcc	%xcc,	%o5,	%l1
	fcmpne16	%f24,	%f28,	%l4
	taddcc	%i0,	0x0069,	%g1
	taddcctv	%o7,	%g3,	%i3
	fandnot1	%f28,	%f14,	%f18
	srlx	%l3,	0x1B,	%l2
	tgu	%icc,	0x6
	xnor	%o2,	0x1C0B,	%i5
	lduw	[%l7 + 0x6C],	%o4
	bvs,a	%xcc,	loop_1507
	udivx	%i1,	0x1439,	%i7
	edge16l	%g7,	%o0,	%i4
	addcc	%g2,	0x1E73,	%l6
loop_1507:
	fsrc2	%f16,	%f22
	fmovscc	%icc,	%f15,	%f6
	umulcc	%o1,	%i6,	%g4
	udiv	%l5,	0x08FB,	%o6
	xnor	%o3,	%i2,	%g6
	pdist	%f10,	%f12,	%f24
	xorcc	%g5,	0x0F40,	%o5
	andn	%l1,	%l4,	%l0
	array16	%g1,	%o7,	%i0
	tle	%xcc,	0x7
	fbg,a	%fcc2,	loop_1508
	ldsw	[%l7 + 0x3C],	%i3
	mova	%xcc,	%g3,	%l2
	array8	%l3,	%i5,	%o4
loop_1508:
	fones	%f15
	umul	%o2,	0x0C9E,	%i7
	or	%i1,	0x0D4E,	%g7
	smul	%o0,	%i4,	%l6
	taddcctv	%o1,	%i6,	%g4
	edge16ln	%l5,	%o6,	%g2
	wr	%g0,	0x22,	%asi
	stwa	%i2,	[%l7 + 0x48] %asi
	membar	#Sync
	tne	%icc,	0x1
	movrne	%g6,	%g5,	%o3
	fpadd32s	%f9,	%f7,	%f7
	movvc	%icc,	%l1,	%o5
	edge8ln	%l4,	%l0,	%o7
	fcmpd	%fcc3,	%f12,	%f22
	swap	[%l7 + 0x3C],	%g1
	edge16ln	%i3,	%g3,	%l2
	fmovrsgez	%i0,	%f10,	%f10
	edge8n	%l3,	%o4,	%o2
	tpos	%icc,	0x6
	movvc	%icc,	%i5,	%i7
	movn	%icc,	%g7,	%i1
	bl,a,pt	%icc,	loop_1509
	fmovsle	%xcc,	%f22,	%f31
	fmovdvc	%icc,	%f25,	%f1
	bg,a,pn	%icc,	loop_1510
loop_1509:
	tle	%icc,	0x0
	fmovrslz	%o0,	%f9,	%f11
	movne	%xcc,	%l6,	%i4
loop_1510:
	array16	%o1,	%i6,	%l5
	movrne	%g4,	0x198,	%g2
	brlz	%o6,	loop_1511
	brnz,a	%g6,	loop_1512
	fba	%fcc2,	loop_1513
	ldsh	[%l7 + 0x38],	%i2
loop_1511:
	fpsub32	%f16,	%f28,	%f0
loop_1512:
	tpos	%xcc,	0x1
loop_1513:
	andcc	%g5,	0x18B4,	%l1
	fbule,a	%fcc3,	loop_1514
	movrgez	%o5,	0x0B3,	%l4
	tle	%icc,	0x4
	xorcc	%o3,	0x1286,	%o7
loop_1514:
	ldd	[%l7 + 0x38],	%g0
	fmul8x16au	%f6,	%f30,	%f8
	movleu	%xcc,	%i3,	%l0
	edge8	%g3,	%l2,	%l3
	fmovsvs	%icc,	%f28,	%f27
	movvs	%xcc,	%o4,	%o2
	fmul8x16	%f22,	%f18,	%f12
	movgu	%icc,	%i5,	%i7
	nop
	setx	loop_1515,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%g7,	0x0D16,	%i0
	movrlz	%o0,	%l6,	%i1
	array16	%o1,	%i4,	%i6
loop_1515:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%l5,	%g2
	fnand	%f2,	%f30,	%f6
	membar	0x71
	subccc	%g4,	%o6,	%g6
	tcs	%icc,	0x5
	xnor	%g5,	0x1A22,	%l1
	bg,a	%icc,	loop_1516
	edge32	%o5,	%l4,	%i2
	movcs	%icc,	%o3,	%o7
	mulscc	%i3,	%g1,	%g3
loop_1516:
	tvs	%icc,	0x2
	bshuffle	%f18,	%f22,	%f14
	srax	%l2,	0x1B,	%l0
	udivx	%l3,	0x0424,	%o2
	tsubcctv	%i5,	0x0B46,	%i7
	movn	%icc,	%g7,	%o4
	siam	0x4
	brz	%o0,	loop_1517
	stbar
	fbu	%fcc0,	loop_1518
	udiv	%l6,	0x187E,	%i0
loop_1517:
	nop
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf9,	%f0
loop_1518:
	nop
	setx	loop_1519,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbuge,a	%fcc2,	loop_1520
	umulcc	%o1,	%i1,	%i6
	fxors	%f7,	%f23,	%f12
loop_1519:
	orn	%i4,	%g2,	%g4
loop_1520:
	tgu	%xcc,	0x1
	fpsub16s	%f15,	%f22,	%f7
	fblg	%fcc0,	loop_1521
	edge8	%l5,	%g6,	%o6
	sllx	%g5,	0x00,	%o5
	fornot2	%f14,	%f0,	%f30
loop_1521:
	nop
	set	0x54, %o6
	sta	%f17,	[%l7 + %o6] 0x0c
	tsubcc	%l4,	%i2,	%o3
	movcs	%icc,	%o7,	%i3
	set	0x35, %l3
	ldstuba	[%l7 + %l3] 0x18,	%l1
	tsubcc	%g3,	0x17CF,	%g1
	sdivcc	%l2,	0x1E47,	%l0
	fmovrdne	%o2,	%f28,	%f10
	tn	%xcc,	0x1
	fmovdle	%icc,	%f18,	%f2
	tn	%icc,	0x0
	udivcc	%i5,	0x18E9,	%l3
	umul	%i7,	0x02E8,	%o4
	set	0x5C, %i3
	lduwa	[%l7 + %i3] 0x04,	%o0
	move	%xcc,	%g7,	%i0
	fbule	%fcc2,	loop_1522
	fpack32	%f30,	%f22,	%f14
	fmovrdlez	%o1,	%f30,	%f28
	andncc	%i1,	%l6,	%i4
loop_1522:
	fbl	%fcc1,	loop_1523
	fmovdneg	%xcc,	%f27,	%f23
	tl	%xcc,	0x3
	tvc	%icc,	0x3
loop_1523:
	fmovsvc	%xcc,	%f15,	%f17
	fmovrslez	%i6,	%f16,	%f15
	movleu	%xcc,	%g4,	%g2
	taddcc	%l5,	0x19C5,	%g6
	taddcc	%g5,	0x06A7,	%o5
	smulcc	%l4,	0x00D2,	%o6
	fmovsge	%icc,	%f14,	%f12
	bcs,pn	%xcc,	loop_1524
	sub	%i2,	%o7,	%o3
	popc	0x1EC7,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1524:
	movrgz	%l1,	0x293,	%g1
	fmovdne	%xcc,	%f29,	%f4
	tcc	%icc,	0x2
	edge16l	%g3,	%l0,	%l2
	fmovd	%f6,	%f14
	fcmpne32	%f16,	%f16,	%o2
	edge8	%i5,	%i7,	%o4
	umul	%o0,	%g7,	%l3
	movvs	%icc,	%o1,	%i0
	move	%xcc,	%i1,	%l6
	movn	%icc,	%i4,	%i6
	bpos,a,pt	%xcc,	loop_1525
	edge8n	%g4,	%l5,	%g2
	wr	%g0,	0x80,	%asi
	stba	%g5,	[%l7 + 0x12] %asi
loop_1525:
	tvc	%xcc,	0x0
	movl	%icc,	%g6,	%o5
	tvc	%xcc,	0x4
	fmovscc	%icc,	%f23,	%f29
	fmovsvc	%xcc,	%f14,	%f10
	edge16n	%l4,	%o6,	%i2
	smul	%o3,	0x08B0,	%o7
	flush	%l7 + 0x38
	taddcctv	%i3,	%l1,	%g1
	edge8l	%g3,	%l0,	%o2
	movvs	%icc,	%i5,	%i7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%o0
	xnor	%l2,	%g7,	%l3
	fone	%f10
	addccc	%i0,	0x1261,	%i1
	tcs	%icc,	0x5
	ld	[%l7 + 0x70],	%f13
	ldd	[%l7 + 0x10],	%f10
	nop
	setx	loop_1526,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%l6,	%i4,	%i6
	fbule,a	%fcc3,	loop_1527
	ba,a	loop_1528
loop_1526:
	tsubcctv	%o1,	0x1402,	%g4
	fbe,a	%fcc3,	loop_1529
loop_1527:
	fnot2s	%f18,	%f10
loop_1528:
	andn	%l5,	%g2,	%g5
	fpsub32s	%f23,	%f25,	%f14
loop_1529:
	swap	[%l7 + 0x5C],	%o5
	fpadd16s	%f13,	%f18,	%f14
	fmovspos	%icc,	%f8,	%f9
	membar	0x6F
	tle	%xcc,	0x2
	fxnors	%f20,	%f0,	%f8
	fbn,a	%fcc0,	loop_1530
	st	%f12,	[%l7 + 0x24]
	subc	%l4,	%o6,	%i2
	fcmped	%fcc1,	%f10,	%f10
loop_1530:
	ldsw	[%l7 + 0x38],	%g6
	fbul,a	%fcc3,	loop_1531
	addc	%o7,	0x0C8F,	%o3
	movre	%i3,	%g1,	%l1
	fmovsg	%xcc,	%f18,	%f21
loop_1531:
	bn,pt	%icc,	loop_1532
	bcs	%icc,	loop_1533
	popc	0x02CD,	%g3
	fornot1s	%f26,	%f14,	%f31
loop_1532:
	array16	%l0,	%o2,	%i5
loop_1533:
	bleu,a,pn	%icc,	loop_1534
	fbo	%fcc0,	loop_1535
	tneg	%icc,	0x7
	andcc	%i7,	%o4,	%o0
loop_1534:
	movrne	%l2,	0x045,	%l3
loop_1535:
	movcc	%icc,	%g7,	%i1
	ble	%icc,	loop_1536
	brlez	%i0,	loop_1537
	fpackfix	%f20,	%f24
	movrlez	%l6,	0x0EC,	%i6
loop_1536:
	movn	%xcc,	%o1,	%i4
loop_1537:
	sdiv	%l5,	0x123A,	%g2
	move	%icc,	%g5,	%o5
	movne	%icc,	%l4,	%o6
	xnor	%i2,	0x03B6,	%g6
	udiv	%o7,	0x16A5,	%o3
	edge32	%g4,	%g1,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn	%icc,	loop_1538
	movge	%xcc,	%g3,	%l1
	edge8l	%o2,	%i5,	%i7
	set	0x68, %o4
	stxa	%l0,	[%l7 + %o4] 0x10
loop_1538:
	lduh	[%l7 + 0x42],	%o0
	tn	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x08] %asi,	%f29
	movvc	%icc,	%l2,	%l3
	addc	%o4,	%i1,	%i0
	edge16	%g7,	%i6,	%l6
	andn	%i4,	%l5,	%g2
	array8	%g5,	%o5,	%l4
	xnorcc	%o6,	0x0CFC,	%o1
	edge8ln	%g6,	%i2,	%o3
	bcc,pn	%icc,	loop_1539
	movleu	%icc,	%o7,	%g1
	ld	[%l7 + 0x50],	%f8
	subccc	%i3,	%g3,	%l1
loop_1539:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%g4
	popc	%i7,	%i5
	udiv	%l0,	0x162C,	%l2
	move	%icc,	%o0,	%l3
	addcc	%o4,	0x09D4,	%i1
	sth	%g7,	[%l7 + 0x60]
	fpadd16	%f6,	%f2,	%f30
	movrlez	%i6,	%i0,	%i4
	fcmpes	%fcc0,	%f27,	%f15
	bneg	%xcc,	loop_1540
	add	%l6,	%g2,	%l5
	ldsh	[%l7 + 0x76],	%o5
	array16	%l4,	%o6,	%o1
loop_1540:
	fabsd	%f26,	%f0
	mova	%xcc,	%g6,	%i2
	edge32	%o3,	%o7,	%g1
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	lduh	[%l7 + 0x12],	%i3
	array16	%g3,	%l1,	%o2
	movre	%g4,	%i7,	%l0
	movcc	%xcc,	%l2,	%o0
	fmul8sux16	%f30,	%f24,	%f4
	array32	%i5,	%o4,	%i1
	brgez,a	%l3,	loop_1541
	and	%i6,	%i0,	%i4
	array32	%g7,	%l6,	%l5
	bleu,a	%icc,	loop_1542
loop_1541:
	brlz	%g2,	loop_1543
	fbug	%fcc1,	loop_1544
	edge16ln	%o5,	%l4,	%o1
loop_1542:
	andcc	%g6,	0x1C9E,	%o6
loop_1543:
	srax	%i2,	%o3,	%o7
loop_1544:
	fba	%fcc3,	loop_1545
	ldub	[%l7 + 0x68],	%g1
	fsrc2s	%f6,	%f27
	fbul,a	%fcc3,	loop_1546
loop_1545:
	subc	%g5,	%g3,	%i3
	fblg	%fcc3,	loop_1547
	fpmerge	%f14,	%f22,	%f14
loop_1546:
	fbl	%fcc3,	loop_1548
	ba,a	%xcc,	loop_1549
loop_1547:
	prefetch	[%l7 + 0x48],	 0x1
	edge16ln	%l1,	%g4,	%o2
loop_1548:
	and	%l0,	0x1F17,	%l2
loop_1549:
	tn	%icc,	0x4
	fandnot1s	%f7,	%f25,	%f14
	fmovsa	%xcc,	%f16,	%f3
	movge	%icc,	%o0,	%i5
	move	%icc,	%o4,	%i1
	bleu,a,pn	%xcc,	loop_1550
	mulscc	%i7,	%i6,	%l3
	tvs	%xcc,	0x1
	movcs	%icc,	%i0,	%g7
loop_1550:
	nop
	setx	loop_1551,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sllx	%l6,	%i4,	%g2
	fpack32	%f4,	%f14,	%f20
	srax	%l5,	0x1B,	%l4
loop_1551:
	fbu,a	%fcc1,	loop_1552
	tneg	%icc,	0x3
	fba,a	%fcc3,	loop_1553
	fmul8ulx16	%f16,	%f20,	%f14
loop_1552:
	for	%f20,	%f14,	%f0
	orncc	%o1,	%g6,	%o5
loop_1553:
	or	%o6,	%o3,	%o7
	fpackfix	%f30,	%f0
	udivx	%g1,	0x1597,	%g5
	smulcc	%g3,	%i3,	%l1
	sdiv	%g4,	0x0926,	%o2
	udiv	%i2,	0x1F92,	%l2
	fsrc1s	%f10,	%f26
	tpos	%icc,	0x0
	fzeros	%f5
	set	0x0B, %o2
	ldsba	[%l7 + %o2] 0x88,	%o0
	set	0x38, %i2
	stxa	%l0,	[%l7 + %i2] 0x0c
	ldstub	[%l7 + 0x1A],	%o4
	xnorcc	%i5,	0x0AD4,	%i1
	fsrc1	%f0,	%f26
	addc	%i6,	%i7,	%i0
	tl	%icc,	0x6
	fxor	%f4,	%f4,	%f30
	bgu,pn	%icc,	loop_1554
	edge16n	%l3,	%g7,	%i4
	tne	%icc,	0x6
	xnorcc	%l6,	%g2,	%l4
loop_1554:
	tgu	%xcc,	0x4
	fxnor	%f16,	%f14,	%f8
	movrlez	%o1,	%l5,	%g6
	tneg	%icc,	0x5
	std	%f10,	[%l7 + 0x10]
	bg,pt	%icc,	loop_1555
	fmovrdlz	%o6,	%f28,	%f8
	subcc	%o5,	%o7,	%o3
	set	0x30, %g3
	stda	%g4,	[%l7 + %g3] 0x80
loop_1555:
	andncc	%g1,	%i3,	%g3
	movvc	%xcc,	%l1,	%g4
	addcc	%o2,	0x1E94,	%i2
	fandnot2	%f4,	%f8,	%f2
	fmovspos	%icc,	%f13,	%f29
	fandnot1s	%f23,	%f11,	%f7
	andcc	%o0,	0x0B58,	%l2
	fmovsle	%xcc,	%f2,	%f3
	xor	%l0,	0x18F3,	%i5
	movneg	%xcc,	%i1,	%o4
	fmul8x16al	%f19,	%f13,	%f12
	udiv	%i6,	0x1266,	%i0
	fbg	%fcc0,	loop_1556
	xor	%l3,	%i7,	%i4
	ldsb	[%l7 + 0x44],	%l6
	movpos	%icc,	%g7,	%g2
loop_1556:
	srlx	%l4,	0x0A,	%l5
	ldsb	[%l7 + 0x1E],	%g6
	alignaddr	%o1,	%o5,	%o7
	movcs	%icc,	%o6,	%o3
	tn	%xcc,	0x2
	brlz	%g5,	loop_1557
	alignaddrl	%g1,	%g3,	%l1
	movgu	%icc,	%i3,	%g4
	edge16ln	%o2,	%i2,	%o0
loop_1557:
	fsrc1	%f2,	%f4
	fmovscs	%icc,	%f19,	%f5
	andncc	%l2,	%l0,	%i1
	fmovdleu	%icc,	%f11,	%f21
	xor	%i5,	%i6,	%o4
	fmovrdgz	%l3,	%f0,	%f12
	movcc	%xcc,	%i0,	%i4
	fmovrdlz	%i7,	%f2,	%f30
	movn	%icc,	%l6,	%g7
	fbl,a	%fcc3,	loop_1558
	orcc	%l4,	%g2,	%g6
	fnors	%f20,	%f12,	%f24
	or	%o1,	%l5,	%o7
loop_1558:
	tne	%icc,	0x7
	udivx	%o5,	0x118F,	%o6
	taddcc	%o3,	%g5,	%g1
	sdiv	%g3,	0x04BD,	%i3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x72] %asi,	%g4
	fmovdg	%icc,	%f30,	%f1
	udiv	%o2,	0x13B1,	%i2
	fpack16	%f0,	%f29
	fnot2	%f14,	%f16
	bl	loop_1559
	addccc	%l1,	0x1EED,	%l2
	fmul8ulx16	%f30,	%f6,	%f18
	fmovrdgez	%o0,	%f30,	%f18
loop_1559:
	ta	%xcc,	0x0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i1,	%i5
	add	%l0,	0x005F,	%o4
	fmovdpos	%xcc,	%f1,	%f3
	tvc	%icc,	0x5
	fmovdg	%xcc,	%f6,	%f17
	xor	%i6,	0x1541,	%i0
	subcc	%i4,	0x06E0,	%l3
	set	0x68, %g1
	stha	%i7,	[%l7 + %g1] 0x2f
	membar	#Sync
	std	%f18,	[%l7 + 0x20]
	orn	%g7,	%l6,	%g2
	tge	%xcc,	0x1
	set	0x4F, %i1
	ldsba	[%l7 + %i1] 0x11,	%l4
	edge16l	%o1,	%l5,	%o7
	move	%icc,	%g6,	%o5
	popc	0x037A,	%o6
	or	%o3,	%g1,	%g5
	wr	%g0,	0x80,	%asi
	stwa	%i3,	[%l7 + 0x28] %asi
	andcc	%g4,	0x085A,	%o2
	fornot2	%f4,	%f12,	%f24
	array16	%i2,	%g3,	%l2
	fmovdneg	%xcc,	%f25,	%f13
	orn	%l1,	%i1,	%i5
	flush	%l7 + 0x70
	and	%l0,	0x0270,	%o4
	edge32ln	%o0,	%i0,	%i6
	smul	%i4,	0x0057,	%l3
	sdiv	%i7,	0x1778,	%l6
	or	%g7,	%g2,	%o1
	sethi	0x0225,	%l4
	udivcc	%l5,	0x0A4E,	%o7
	mulx	%g6,	%o6,	%o5
	fmovrdlez	%o3,	%f8,	%f2
	fcmple32	%f0,	%f10,	%g1
	fmovrdne	%i3,	%f30,	%f6
	movcs	%xcc,	%g5,	%o2
	brgz,a	%i2,	loop_1560
	movvs	%xcc,	%g4,	%g3
	or	%l1,	0x1FCF,	%l2
	tvc	%xcc,	0x6
loop_1560:
	bn,a,pn	%icc,	loop_1561
	edge16n	%i1,	%l0,	%i5
	addccc	%o4,	0x1E89,	%i0
	subc	%o0,	0x1CF1,	%i6
loop_1561:
	udivx	%i4,	0x06BA,	%l3
	siam	0x7
	umulcc	%l6,	0x12C3,	%i7
	te	%xcc,	0x3
	umul	%g7,	0x1F76,	%o1
	srl	%g2,	0x05,	%l5
	fmovrdlez	%o7,	%f6,	%f26
	ldub	[%l7 + 0x2C],	%l4
	udiv	%o6,	0x181C,	%o5
	fpsub32s	%f11,	%f2,	%f24
	edge32l	%o3,	%g6,	%g1
	umulcc	%i3,	0x0EE6,	%o2
	fbn	%fcc1,	loop_1562
	xnorcc	%i2,	0x1F22,	%g4
	edge16n	%g5,	%g3,	%l2
	bvc,a	%icc,	loop_1563
loop_1562:
	be	%icc,	loop_1564
	orn	%l1,	%l0,	%i1
	alignaddr	%o4,	%i5,	%i0
loop_1563:
	edge32ln	%o0,	%i4,	%l3
loop_1564:
	fors	%f21,	%f9,	%f5
	sra	%l6,	0x0C,	%i7
	tcc	%xcc,	0x5
	sll	%g7,	%i6,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x5
	mulx	%l5,	0x04AD,	%o1
	andcc	%o7,	0x04C0,	%l4
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x48, %l1
	lduha	[%l7 + %l1] 0x11,	%o6
	edge8	%o3,	%g6,	%o5
	fnot1	%f20,	%f16
	xorcc	%g1,	%o2,	%i3
	set	0x68, %g6
	ldsha	[%l7 + %g6] 0x15,	%i2
	tsubcctv	%g5,	0x1142,	%g3
	set	0x60, %o7
	lda	[%l7 + %o7] 0x14,	%f27
	movgu	%xcc,	%l2,	%l1
	edge8l	%g4,	%l0,	%i1
	fnors	%f7,	%f0,	%f16
	srlx	%i5,	%o4,	%o0
	bg,a,pn	%xcc,	loop_1565
	ldstub	[%l7 + 0x37],	%i4
	fbul	%fcc2,	loop_1566
	edge32n	%l3,	%i0,	%i7
loop_1565:
	te	%icc,	0x5
	orn	%g7,	%i6,	%g2
loop_1566:
	nop
	wr	%g0,	0x04,	%asi
	stda	%i6,	[%l7 + 0x70] %asi
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%f22
	andcc	%l5,	%o7,	%o1
	ble,a	%xcc,	loop_1567
	andncc	%l4,	%o3,	%o6
	ldsw	[%l7 + 0x38],	%o5
	fzero	%f2
loop_1567:
	fmovscc	%icc,	%f18,	%f26
	fmovsle	%icc,	%f28,	%f25
	edge8	%g6,	%o2,	%i3
	sdivcc	%i2,	0x1731,	%g5
	fmovdcc	%icc,	%f26,	%f28
	addccc	%g3,	%g1,	%l2
	bcc	loop_1568
	taddcc	%g4,	0x14C8,	%l1
	fmul8x16	%f26,	%f6,	%f22
	bg	%icc,	loop_1569
loop_1568:
	edge8ln	%l0,	%i5,	%o4
	fmovde	%xcc,	%f7,	%f17
	fmovda	%xcc,	%f5,	%f16
loop_1569:
	fcmpes	%fcc0,	%f24,	%f26
	tcc	%icc,	0x7
	fmovdneg	%icc,	%f3,	%f15
	brgz	%i1,	loop_1570
	fmovdl	%xcc,	%f13,	%f17
	fandnot1	%f24,	%f20,	%f30
	bg,a	loop_1571
loop_1570:
	movn	%xcc,	%o0,	%l3
	subcc	%i0,	%i4,	%i7
	movrlz	%i6,	0x002,	%g2
loop_1571:
	fmul8x16	%f7,	%f2,	%f6
	fmuld8sux16	%f26,	%f19,	%f26
	tne	%icc,	0x3
	movgu	%icc,	%g7,	%l6
	addc	%o7,	%l5,	%l4
	smulcc	%o1,	%o6,	%o5
	xnorcc	%g6,	0x092C,	%o3
	addccc	%o2,	%i3,	%g5
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fpadd16s	%f30,	%f26,	%f23
	sth	%i2,	[%l7 + 0x78]
	or	%g3,	%l2,	%g1
	fnegd	%f0,	%f24
	tleu	%icc,	0x3
	addc	%l1,	%l0,	%g4
	tpos	%icc,	0x7
	tleu	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f24,	%f2,	%f16
	bpos,a,pt	%icc,	loop_1572
	ldd	[%l7 + 0x60],	%o4
	fnot1	%f14,	%f10
	movrne	%i1,	%o0,	%l3
loop_1572:
	movvs	%xcc,	%i0,	%i4
	addccc	%i7,	0x038F,	%i6
	bvs	%xcc,	loop_1573
	fnegd	%f30,	%f28
	fcmpne32	%f0,	%f0,	%g2
	fmovsge	%xcc,	%f12,	%f4
loop_1573:
	mulx	%g7,	%i5,	%l6
	fxnors	%f9,	%f6,	%f5
	fpsub32s	%f15,	%f20,	%f18
	fpackfix	%f14,	%f21
	srlx	%o7,	%l5,	%l4
	fcmpeq32	%f14,	%f30,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o6,	0x182D,	%g6
	movcc	%icc,	%o3,	%o2
	add	%i3,	%g5,	%o5
	wr	%g0,	0x23,	%asi
	stda	%i2,	[%l7 + 0x70] %asi
	membar	#Sync
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x40] %asi,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%g1,	%l1
	or	%l0,	0x0446,	%g4
	movre	%g3,	0x3CB,	%i1
	udivcc	%o4,	0x19A2,	%o0
	edge16	%l3,	%i0,	%i7
	tsubcctv	%i4,	%g2,	%g7
	set	0x20, %i0
	ldstuba	[%l7 + %i0] 0x0c,	%i5
	tvc	%xcc,	0x4
	xor	%i6,	0x0300,	%o7
	mova	%icc,	%l5,	%l4
	fcmpgt32	%f6,	%f0,	%l6
	flush	%l7 + 0x7C
	be	%icc,	loop_1574
	tge	%icc,	0x1
	movpos	%icc,	%o1,	%o6
	fcmpne32	%f18,	%f10,	%g6
loop_1574:
	te	%xcc,	0x5
	fmovdle	%xcc,	%f0,	%f12
	fpmerge	%f13,	%f31,	%f0
	fbug,a	%fcc1,	loop_1575
	xor	%o3,	%i3,	%g5
	set	0x5C, %l5
	lduwa	[%l7 + %l5] 0x0c,	%o5
loop_1575:
	edge32	%o2,	%i2,	%l2
	movrlz	%l1,	0x214,	%l0
	stx	%g4,	[%l7 + 0x08]
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movvc	%xcc,	%g1,	%i1
	fmovs	%f25,	%f1
	nop
	setx	loop_1576,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrne	%g3,	%o4,	%l3
	fpack16	%f8,	%f18
	bshuffle	%f16,	%f24,	%f2
loop_1576:
	edge16ln	%i0,	%o0,	%i7
	fornot2	%f14,	%f30,	%f0
	movcs	%xcc,	%i4,	%g2
	edge16	%i5,	%g7,	%o7
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x14,	%l4
	edge16n	%i6,	%l4,	%l6
	fmovrslez	%o6,	%f17,	%f15
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x28] %asi,	%o1
	fcmpne16	%f6,	%f4,	%o3
	wr	%g0,	0x22,	%asi
	stxa	%i3,	[%l7 + 0x10] %asi
	membar	#Sync
	xorcc	%g5,	0x00AC,	%g6
	tsubcc	%o5,	%i2,	%l2
	movl	%xcc,	%l1,	%o2
	call	loop_1577
	movrlez	%g4,	%l0,	%g1
	fmovdvs	%icc,	%f22,	%f5
	movne	%icc,	%i1,	%g3
loop_1577:
	bvs,pt	%icc,	loop_1578
	fxors	%f9,	%f22,	%f25
	srax	%l3,	0x19,	%o4
	fcmple16	%f24,	%f14,	%o0
loop_1578:
	fcmple32	%f20,	%f26,	%i0
	fone	%f4
	fmovrdne	%i4,	%f20,	%f0
	set	0x15, %o5
	ldsba	[%l7 + %o5] 0x89,	%g2
	tl	%xcc,	0x6
	tg	%xcc,	0x4
	fmovdvs	%icc,	%f15,	%f6
	addcc	%i5,	%i7,	%g7
	tcc	%icc,	0x3
	udiv	%o7,	0x0554,	%i6
	array8	%l5,	%l4,	%o6
	edge32	%o1,	%l6,	%i3
	edge32	%o3,	%g6,	%o5
	fpadd16s	%f22,	%f26,	%f25
	fmovdneg	%xcc,	%f0,	%f27
	fbg	%fcc3,	loop_1579
	tne	%xcc,	0x3
	fmovdl	%icc,	%f2,	%f14
	stbar
loop_1579:
	nop
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g5
	edge16n	%i2,	%l2,	%l1
	set	0x10, %l2
	sta	%f15,	[%l7 + %l2] 0x14
	fpadd32	%f18,	%f20,	%f0
	tgu	%xcc,	0x6
	subcc	%o2,	%g4,	%l0
	fba	%fcc2,	loop_1580
	movleu	%icc,	%i1,	%g3
	array16	%g1,	%l3,	%o0
	tn	%icc,	0x6
loop_1580:
	move	%xcc,	%i0,	%o4
	fblg	%fcc0,	loop_1581
	tpos	%icc,	0x1
	movgu	%icc,	%i4,	%i5
	tge	%xcc,	0x5
loop_1581:
	mulscc	%g2,	0x11FA,	%g7
	bne	%xcc,	loop_1582
	fpadd32	%f28,	%f30,	%f26
	sdivcc	%i7,	0x0367,	%i6
	array8	%o7,	%l5,	%o6
loop_1582:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	movleu	%xcc,	%l6,	%o1
	mulx	%i3,	0x1C05,	%g6
	ta	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg	loop_1583
	movn	%xcc,	%o3,	%g5
	tsubcc	%o5,	0x195A,	%i2
	tsubcc	%l2,	0x0420,	%l1
loop_1583:
	ble	%xcc,	loop_1584
	fmovd	%f6,	%f4
	fandnot2	%f28,	%f28,	%f20
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1584:
	sdivcc	%g4,	0x157C,	%l0
	fabss	%f6,	%f19
	edge32	%i1,	%o2,	%g3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g1,	%l3
	subccc	%i0,	%o0,	%i4
	movg	%xcc,	%o4,	%i5
	movne	%xcc,	%g2,	%i7
	and	%g7,	0x00EA,	%o7
	brgz,a	%l5,	loop_1585
	call	loop_1586
	andn	%i6,	0x1498,	%l4
	edge16ln	%l6,	%o1,	%i3
loop_1585:
	fmovdn	%icc,	%f31,	%f1
loop_1586:
	fmovrdlz	%o6,	%f12,	%f20
	fmovrslez	%o3,	%f2,	%f5
	smulcc	%g6,	0x11B3,	%o5
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x50] %asi,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l2,	%g5,	%l1
	fxors	%f8,	%f17,	%f4
	movpos	%icc,	%l0,	%i1
	xorcc	%g4,	0x09F3,	%o2
	tge	%xcc,	0x4
	sdivcc	%g1,	0x10E5,	%l3
	move	%xcc,	%i0,	%o0
	fbu	%fcc1,	loop_1587
	flush	%l7 + 0x70
	sth	%i4,	[%l7 + 0x7A]
	fsrc2s	%f23,	%f31
loop_1587:
	fmovsleu	%xcc,	%f16,	%f1
	xorcc	%g3,	%i5,	%g2
	tn	%icc,	0x7
	tpos	%xcc,	0x2
	movrgz	%i7,	%o4,	%g7
	alignaddr	%o7,	%l5,	%i6
	fmovrsne	%l4,	%f1,	%f24
	st	%f6,	[%l7 + 0x34]
	wr	%g0,	0x80,	%asi
	sta	%f14,	[%l7 + 0x2C] %asi
	sir	0x1D3F
	sdivx	%o1,	0x0F53,	%i3
	orcc	%l6,	0x1F5E,	%o3
	stb	%o6,	[%l7 + 0x62]
	bge,a,pt	%xcc,	loop_1588
	srl	%o5,	%g6,	%l2
	fandnot2s	%f8,	%f19,	%f20
	udivx	%g5,	0x100A,	%i2
loop_1588:
	movrgez	%l1,	0x2A1,	%l0
	subcc	%i1,	0x0A30,	%g4
	st	%f6,	[%l7 + 0x58]
	orcc	%g1,	%l3,	%o2
	sra	%i0,	%i4,	%g3
	movrgz	%o0,	0x339,	%i5
	set	0x48, %o1
	stxa	%g2,	[%l7 + %o1] 0x14
	fcmps	%fcc0,	%f16,	%f24
	fnegs	%f12,	%f24
	fmuld8sux16	%f7,	%f3,	%f14
	fbl	%fcc2,	loop_1589
	array16	%i7,	%g7,	%o4
	fnot2	%f30,	%f6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] %asi,	%l5,	%i6
loop_1589:
	nop
	setx	loop_1590,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tpos	%xcc,	0x6
	std	%l4,	[%l7 + 0x08]
	movle	%icc,	%o1,	%o7
loop_1590:
	orncc	%l6,	0x0B9A,	%i3
	popc	0x01D6,	%o3
	fnegd	%f22,	%f18
	fxor	%f6,	%f14,	%f8
	xnorcc	%o6,	0x03E5,	%g6
	ta	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o5,	%l2
	set	0x50, %o3
	ldda	[%l7 + %o3] 0x80,	%g4
	andn	%l1,	%l0,	%i2
	srlx	%g4,	%g1,	%i1
	fmovrslez	%o2,	%f16,	%f29
	movcc	%icc,	%l3,	%i0
	movpos	%icc,	%i4,	%o0
	lduw	[%l7 + 0x60],	%i5
	xorcc	%g3,	%i7,	%g2
	alignaddrl	%g7,	%o4,	%l5
	movcs	%xcc,	%i6,	%o1
	fmovdcs	%icc,	%f29,	%f4
	std	%f24,	[%l7 + 0x48]
	fsrc2	%f12,	%f12
	ldd	[%l7 + 0x58],	%l4
	alignaddrl	%l6,	%o7,	%o3
	fmovrdlz	%o6,	%f18,	%f10
	alignaddrl	%i3,	%o5,	%g6
	mulscc	%g5,	0x1465,	%l1
	bl	%icc,	loop_1591
	srax	%l2,	0x08,	%i2
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x60] %asi,	%g4
loop_1591:
	ldd	[%l7 + 0x20],	%g0
	fpack16	%f16,	%f29
	tgu	%xcc,	0x6
	bl,a	%xcc,	loop_1592
	popc	0x006C,	%l0
	fbue,a	%fcc1,	loop_1593
	fcmpeq32	%f12,	%f14,	%i1
loop_1592:
	edge32ln	%l3,	%o2,	%i0
	fabss	%f10,	%f19
loop_1593:
	srlx	%i4,	%i5,	%o0
	bge,a	loop_1594
	fnors	%f13,	%f31,	%f29
	movle	%xcc,	%i7,	%g2
	sra	%g7,	%g3,	%l5
loop_1594:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x74] %asi,	%o4
	bvc,a	%icc,	loop_1595
	addc	%i6,	%o1,	%l6
	nop
	setx	loop_1596,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%icc,	0x0
loop_1595:
	fnands	%f18,	%f24,	%f31
	taddcc	%l4,	%o7,	%o3
loop_1596:
	lduh	[%l7 + 0x16],	%i3
	fble,a	%fcc2,	loop_1597
	nop
	setx	loop_1598,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%o6,	%o5,	%g5
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x33] %asi,	%l1
loop_1597:
	taddcctv	%g6,	%l2,	%i2
loop_1598:
	edge16ln	%g1,	%g4,	%i1
	smulcc	%l0,	%l3,	%o2
	fmovrdne	%i4,	%f6,	%f6
	fcmpeq16	%f22,	%f2,	%i5
	tneg	%icc,	0x2
	edge8l	%o0,	%i0,	%g2
	tl	%xcc,	0x6
	fblg,a	%fcc1,	loop_1599
	fbe	%fcc2,	loop_1600
	bvc,a,pt	%icc,	loop_1601
	fmul8x16	%f10,	%f8,	%f24
loop_1599:
	srl	%g7,	%g3,	%l5
loop_1600:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%i6
loop_1601:
	fbule,a	%fcc3,	loop_1602
	smulcc	%i7,	0x0BED,	%l6
	fbule,a	%fcc0,	loop_1603
	tpos	%icc,	0x5
loop_1602:
	tge	%xcc,	0x5
	set	0x14, %l4
	swapa	[%l7 + %l4] 0x19,	%l4
loop_1603:
	udiv	%o1,	0x103D,	%o3
	edge8n	%i3,	%o7,	%o5
	sllx	%o6,	0x15,	%l1
	fbge	%fcc0,	loop_1604
	orcc	%g5,	%l2,	%i2
	andncc	%g1,	%g4,	%g6
	ta	%icc,	0x1
loop_1604:
	fmovrsgz	%l0,	%f12,	%f7
	movvc	%xcc,	%i1,	%o2
	fmovsne	%icc,	%f13,	%f29
	bn,pt	%xcc,	loop_1605
	fpsub16s	%f17,	%f17,	%f14
	addccc	%i4,	0x1ED5,	%l3
	bleu,a,pn	%icc,	loop_1606
loop_1605:
	or	%o0,	0x1FC1,	%i5
	mulx	%i0,	%g7,	%g2
	ldsw	[%l7 + 0x38],	%g3
loop_1606:
	prefetch	[%l7 + 0x1C],	 0x1
	bneg,a,pt	%xcc,	loop_1607
	umulcc	%o4,	0x1496,	%l5
	srlx	%i7,	0x1B,	%l6
	sdivcc	%i6,	0x1AF7,	%l4
loop_1607:
	edge8ln	%o3,	%i3,	%o7
	fsrc1s	%f5,	%f15
	popc	%o1,	%o5
	tn	%icc,	0x2
	tn	%icc,	0x4
	movcs	%xcc,	%o6,	%g5
	popc	0x11B0,	%l1
	edge32n	%i2,	%g1,	%g4
	array8	%l2,	%g6,	%l0
	fmovdg	%xcc,	%f27,	%f14
	array8	%o2,	%i4,	%i1
	fbul,a	%fcc2,	loop_1608
	subccc	%o0,	%i5,	%i0
	add	%l3,	0x1560,	%g7
	subc	%g2,	%g3,	%o4
loop_1608:
	fmovsgu	%xcc,	%f18,	%f13
	movleu	%icc,	%i7,	%l6
	nop
	setx	loop_1609,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%i6,	0x147B,	%l4
	tpos	%xcc,	0x0
	movcc	%icc,	%o3,	%i3
loop_1609:
	ld	[%l7 + 0x20],	%f15
	movneg	%xcc,	%o7,	%l5
	fpsub16	%f2,	%f10,	%f26
	fble,a	%fcc3,	loop_1610
	fmovrdne	%o1,	%f20,	%f10
	move	%icc,	%o6,	%g5
	for	%f14,	%f24,	%f28
loop_1610:
	sra	%o5,	0x02,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i2,	%g4,	%l2
	fmovdcc	%icc,	%f1,	%f6
	addc	%g6,	%l0,	%o2
	tgu	%icc,	0x7
	andcc	%i4,	%i1,	%g1
	xnor	%i5,	0x145C,	%i0
	fmul8x16au	%f11,	%f30,	%f0
	tcc	%xcc,	0x2
	bcs	loop_1611
	movvs	%icc,	%l3,	%g7
	fnot1	%f20,	%f2
	tvs	%xcc,	0x4
loop_1611:
	bcc,a,pt	%xcc,	loop_1612
	fandnot1s	%f21,	%f31,	%f14
	tgu	%xcc,	0x2
	bneg,a,pn	%xcc,	loop_1613
loop_1612:
	movle	%icc,	%g2,	%g3
	movre	%o4,	%o0,	%i7
	tg	%xcc,	0x2
loop_1613:
	udiv	%i6,	0x1324,	%l6
	and	%o3,	%l4,	%i3
	fornot1	%f14,	%f4,	%f30
	call	loop_1614
	fnot1	%f16,	%f10
	fmovdge	%xcc,	%f30,	%f31
	udivx	%o7,	0x107A,	%o1
loop_1614:
	alignaddrl	%l5,	%o6,	%o5
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x10,	 0x1
	tneg	%icc,	0x7
	orcc	%i2,	%l1,	%l2
	movpos	%icc,	%g4,	%l0
	movl	%xcc,	%g6,	%o2
	movrne	%i1,	0x005,	%g1
	fble,a	%fcc0,	loop_1615
	mova	%xcc,	%i5,	%i4
	fmovrdgz	%i0,	%f20,	%f22
	fandnot2s	%f15,	%f8,	%f9
loop_1615:
	bge	%xcc,	loop_1616
	tl	%icc,	0x2
	andncc	%g7,	%g2,	%g3
	udivcc	%o4,	0x07B5,	%o0
loop_1616:
	xorcc	%i7,	%i6,	%l3
	tcc	%icc,	0x4
	array32	%l6,	%l4,	%i3
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x68] %asi,	%o7
	move	%xcc,	%o3,	%l5
	ldub	[%l7 + 0x2C],	%o6
	stw	%o1,	[%l7 + 0x30]
	mova	%xcc,	%o5,	%g5
	be,a,pn	%xcc,	loop_1617
	tn	%xcc,	0x3
	movl	%xcc,	%l1,	%l2
	andcc	%i2,	0x0D87,	%g4
loop_1617:
	fmovspos	%icc,	%f18,	%f17
	bvs	%icc,	loop_1618
	fmovdcc	%icc,	%f15,	%f10
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x7E] %asi,	%l0
loop_1618:
	fpack32	%f6,	%f2,	%f28
	fmovd	%f24,	%f6
	tcs	%xcc,	0x3
	movle	%xcc,	%g6,	%o2
	and	%i1,	0x163B,	%i5
	udivcc	%g1,	0x088A,	%i4
	set	0x08, %i5
	sta	%f16,	[%l7 + %i5] 0x19
	fmovse	%xcc,	%f29,	%f3
	movcs	%icc,	%g7,	%g2
	sllx	%g3,	0x1B,	%i0
	movgu	%icc,	%o0,	%o4
	ldsw	[%l7 + 0x18],	%i6
	movvc	%xcc,	%l3,	%i7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%l4
	umul	%o7,	0x1DF4,	%o3
	movn	%xcc,	%l5,	%i3
	te	%icc,	0x5
	sdivx	%o6,	0x13C7,	%o5
	fbge,a	%fcc3,	loop_1619
	movl	%xcc,	%o1,	%l1
	edge16	%l2,	%g5,	%i2
	movg	%icc,	%l0,	%g6
loop_1619:
	andncc	%g4,	%o2,	%i5
	srax	%i1,	%i4,	%g1
	movge	%icc,	%g7,	%g3
	mova	%icc,	%g2,	%i0
	fandnot1s	%f28,	%f22,	%f26
	fmovsa	%icc,	%f11,	%f21
	fmovdle	%xcc,	%f8,	%f22
	fblg,a	%fcc3,	loop_1620
	andncc	%o4,	%o0,	%i6
	array8	%i7,	%l6,	%l3
	array8	%l4,	%o3,	%l5
loop_1620:
	movg	%xcc,	%i3,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%xcc,	%f15,	%f11
	sir	0x0914
	edge32ln	%o6,	%o1,	%o5
	movrne	%l2,	0x1AE,	%l1
	wr	%g0,	0x18,	%asi
	sta	%f5,	[%l7 + 0x3C] %asi
	movcc	%icc,	%g5,	%l0
	movcs	%xcc,	%i2,	%g6
	orcc	%o2,	%i5,	%g4
	smul	%i1,	0x15AD,	%g1
	subc	%g7,	%i4,	%g2
	movneg	%xcc,	%g3,	%i0
	fnot2	%f6,	%f2
	movpos	%icc,	%o4,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i6,	%l6,	%l3
	fmovda	%icc,	%f5,	%f10
	fnors	%f26,	%f9,	%f25
	tcc	%xcc,	0x6
	tvc	%xcc,	0x1
	array8	%l4,	%o3,	%l5
	set	0x72, %l6
	ldsha	[%l7 + %l6] 0x81,	%i3
	fmovdg	%icc,	%f20,	%f22
	fbe	%fcc1,	loop_1621
	smulcc	%i7,	0x0261,	%o7
	brlez,a	%o1,	loop_1622
	subcc	%o5,	0x1B54,	%o6
loop_1621:
	tsubcc	%l1,	%l2,	%g5
	nop
	setx	loop_1623,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1622:
	movrgez	%l0,	%i2,	%o2
	fmovrdlez	%g6,	%f10,	%f18
	movcs	%xcc,	%g4,	%i1
loop_1623:
	sub	%g1,	%g7,	%i4
	fmovrslez	%i5,	%f20,	%f15
	fmovdne	%xcc,	%f23,	%f23
	orn	%g3,	0x168A,	%g2
	for	%f30,	%f10,	%f10
	te	%xcc,	0x7
	bneg,pt	%xcc,	loop_1624
	fmul8x16au	%f20,	%f28,	%f28
	and	%o4,	%i0,	%i6
	siam	0x1
loop_1624:
	nop
	wr	%g0,	0x04,	%asi
	stba	%o0,	[%l7 + 0x43] %asi
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x40] %asi,	%l2
	tpos	%icc,	0x3
	movpos	%icc,	%l6,	%o3
	edge8n	%l5,	%i3,	%i7
	tge	%xcc,	0x5
	udivcc	%l4,	0x07C2,	%o7
	mulx	%o5,	%o6,	%o1
	tn	%icc,	0x7
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x0C] %asi,	%l2
	fmovdne	%xcc,	%f25,	%f7
	set	0x26, %l0
	ldsha	[%l7 + %l0] 0x19,	%g5
	fmovdneg	%icc,	%f9,	%f20
	array32	%l1,	%l0,	%o2
	xnorcc	%i2,	%g6,	%i1
	sethi	0x11E0,	%g4
	movpos	%icc,	%g7,	%g1
	fmovsne	%icc,	%f10,	%f24
	taddcc	%i4,	%i5,	%g3
	stw	%g2,	[%l7 + 0x58]
	taddcctv	%i0,	%o4,	%i6
	sdiv	%o0,	0x04D7,	%l6
	movrlez	%l3,	%l5,	%o3
	alignaddrl	%i3,	%i7,	%o7
	addccc	%o5,	%o6,	%o1
	fbge	%fcc0,	loop_1625
	movcs	%icc,	%l4,	%g5
	membar	0x18
	tg	%xcc,	0x1
loop_1625:
	srlx	%l2,	%l1,	%l0
	sethi	0x0385,	%o2
	faligndata	%f24,	%f4,	%f26
	movg	%xcc,	%g6,	%i2
	edge16n	%g4,	%g7,	%i1
	addc	%i4,	0x015D,	%i5
	tsubcctv	%g3,	0x09E0,	%g1
	edge32	%i0,	%o4,	%g2
	edge32l	%o0,	%i6,	%l6
	movrgez	%l5,	%l3,	%i3
	sub	%o3,	%i7,	%o5
	fexpand	%f24,	%f4
	movrgz	%o6,	%o7,	%o1
	edge32l	%l4,	%g5,	%l1
	tne	%xcc,	0x7
	sethi	0x172E,	%l2
	brgez,a	%o2,	loop_1626
	fbge	%fcc0,	loop_1627
	bg,a	%icc,	loop_1628
	movn	%icc,	%l0,	%g6
loop_1626:
	srl	%g4,	0x1D,	%g7
loop_1627:
	movg	%icc,	%i1,	%i2
loop_1628:
	fcmpne16	%f0,	%f14,	%i5
	edge32	%g3,	%i4,	%g1
	brz,a	%i0,	loop_1629
	movge	%icc,	%o4,	%g2
	fmovsn	%xcc,	%f0,	%f10
	tcs	%xcc,	0x5
loop_1629:
	movrgz	%i6,	0x0D8,	%l6
	call	loop_1630
	fand	%f20,	%f6,	%f8
	fzeros	%f9
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1630:
	addccc	%l5,	%l3,	%o0
	movne	%icc,	%o3,	%i7
	sdivcc	%i3,	0x199B,	%o6
	tge	%xcc,	0x0
	ta	%xcc,	0x5
	fxor	%f2,	%f28,	%f18
	fmovdneg	%xcc,	%f14,	%f12
	movre	%o7,	0x0F9,	%o1
	fexpand	%f0,	%f0
	movrlez	%o5,	%l4,	%l1
	movrne	%l2,	%o2,	%l0
	sll	%g5,	%g6,	%g4
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i1,	%i2
	movre	%i5,	%g7,	%i4
	fxnors	%f25,	%f5,	%f25
	ble,pt	%xcc,	loop_1631
	movvc	%icc,	%g1,	%g3
	smul	%o4,	0x164C,	%g2
	tne	%icc,	0x6
loop_1631:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f4,	[%l7 + 0x18] %asi
	array8	%i6,	%l6,	%l5
	smul	%l3,	%i0,	%o0
	swap	[%l7 + 0x14],	%o3
	fbn,a	%fcc3,	loop_1632
	fmovrde	%i3,	%f10,	%f20
	movgu	%xcc,	%o6,	%i7
	sra	%o7,	%o1,	%o5
loop_1632:
	alignaddr	%l4,	%l1,	%o2
	set	0x20, %g4
	lda	[%l7 + %g4] 0x81,	%f31
	array32	%l0,	%l2,	%g6
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	setx	loop_1633,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%g5,	%g4,	%i2
	edge16n	%i5,	%g7,	%i1
	edge16	%i4,	%g1,	%g3
loop_1633:
	fmovsvs	%icc,	%f31,	%f9
	fmovdvs	%icc,	%f9,	%f21
	umulcc	%o4,	0x1E22,	%g2
	subccc	%i6,	0x1EB0,	%l6
	fmovrdlz	%l3,	%f24,	%f4
	umul	%i0,	%o0,	%o3
	tvs	%xcc,	0x0
	sdiv	%i3,	0x01DE,	%l5
	sdivcc	%o6,	0x0718,	%i7
	edge16	%o7,	%o1,	%l4
	ble,a	%icc,	loop_1634
	sdiv	%l1,	0x128C,	%o5
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x1f
	membar	#Sync
loop_1634:
	mulscc	%o2,	0x193E,	%l0
	edge16ln	%l2,	%g5,	%g6
	fmovsvc	%xcc,	%f14,	%f20
	bpos,pt	%icc,	loop_1635
	fabsd	%f26,	%f0
	fxor	%f12,	%f24,	%f8
	tsubcc	%i2,	0x016D,	%i5
loop_1635:
	movrlz	%g4,	0x198,	%i1
	ldsb	[%l7 + 0x6D],	%g7
	srax	%g1,	0x12,	%g3
	sth	%o4,	[%l7 + 0x34]
	bpos,a	loop_1636
	umul	%i4,	%g2,	%l6
	xnorcc	%i6,	0x15A5,	%l3
	addccc	%o0,	0x03AE,	%o3
loop_1636:
	fmovdvs	%xcc,	%f19,	%f23
	movl	%xcc,	%i0,	%i3
	bgu,a,pt	%xcc,	loop_1637
	fzeros	%f1
	std	%f12,	[%l7 + 0x70]
	movrlz	%o6,	%l5,	%i7
loop_1637:
	popc	%o7,	%o1
	be	%icc,	loop_1638
	brnz,a	%l4,	loop_1639
	movle	%icc,	%l1,	%o2
	alignaddr	%o5,	%l2,	%l0
loop_1638:
	tg	%icc,	0x0
loop_1639:
	fmovrdlez	%g5,	%f16,	%f2
	edge16n	%g6,	%i5,	%g4
	array16	%i1,	%i2,	%g1
	edge8n	%g3,	%o4,	%i4
	wr	%g0,	0x10,	%asi
	stba	%g7,	[%l7 + 0x57] %asi
	fmovsg	%xcc,	%f9,	%f9
	call	loop_1640
	fexpand	%f21,	%f2
	fandnot1s	%f24,	%f25,	%f27
	array16	%g2,	%i6,	%l3
loop_1640:
	fmovrde	%o0,	%f16,	%f28
	sethi	0x0F6B,	%l6
	umulcc	%i0,	0x0D93,	%i3
	tgu	%xcc,	0x6
	tgu	%icc,	0x4
	movle	%icc,	%o6,	%o3
	orn	%i7,	%l5,	%o7
	tge	%icc,	0x2
	brlez,a	%o1,	loop_1641
	move	%icc,	%l1,	%o2
	edge32l	%l4,	%o5,	%l0
	edge16l	%g5,	%g6,	%i5
loop_1641:
	tg	%icc,	0x1
	std	%f24,	[%l7 + 0x58]
	edge8	%l2,	%i1,	%g4
	brnz,a	%g1,	loop_1642
	xnorcc	%g3,	%i2,	%o4
	xor	%g7,	%i4,	%g2
	fsrc2	%f4,	%f2
loop_1642:
	edge32ln	%l3,	%i6,	%l6
	fba	%fcc3,	loop_1643
	edge16n	%o0,	%i0,	%i3
	udivcc	%o3,	0x04DC,	%o6
	movn	%icc,	%l5,	%i7
loop_1643:
	movle	%xcc,	%o7,	%l1
	fcmple32	%f26,	%f26,	%o1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%o2
	fbue	%fcc0,	loop_1644
	movrlz	%o5,	%l0,	%g5
	fbge,a	%fcc3,	loop_1645
	std	%g6,	[%l7 + 0x20]
loop_1644:
	fbe,a	%fcc3,	loop_1646
	andcc	%l2,	%i5,	%g4
loop_1645:
	orn	%i1,	0x15D0,	%g3
	brlz,a	%g1,	loop_1647
loop_1646:
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%f30
	edge32	%i2,	%g7,	%o4
	ldub	[%l7 + 0x59],	%i4
loop_1647:
	sllx	%g2,	%i6,	%l6
	fmovdge	%icc,	%f4,	%f8
	tcs	%xcc,	0x1
	mulx	%l3,	0x019F,	%i0
	bge	%icc,	loop_1648
	fmovspos	%xcc,	%f27,	%f13
	membar	0x74
	fmovdcs	%icc,	%f9,	%f14
loop_1648:
	tcs	%icc,	0x7
	edge16l	%o0,	%i3,	%o6
	fsrc2s	%f17,	%f12
	fbuge	%fcc2,	loop_1649
	movne	%xcc,	%l5,	%o3
	edge8ln	%i7,	%o7,	%l1
	sth	%l4,	[%l7 + 0x4E]
loop_1649:
	nop
	setx	loop_1650,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	popc	%o2,	%o5
	movle	%xcc,	%o1,	%l0
	mova	%xcc,	%g6,	%g5
loop_1650:
	orcc	%l2,	%g4,	%i5
	smul	%i1,	%g3,	%g1
	fcmpd	%fcc2,	%f20,	%f24
	bvs,a	%icc,	loop_1651
	sethi	0x18C1,	%g7
	fbul	%fcc1,	loop_1652
	nop
	setx	loop_1653,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1651:
	fblg	%fcc2,	loop_1654
	fmovdg	%xcc,	%f0,	%f6
loop_1652:
	tcs	%icc,	0x2
loop_1653:
	fmovrdlz	%o4,	%f8,	%f26
loop_1654:
	fbo	%fcc2,	loop_1655
	mulscc	%i4,	0x0B6A,	%i2
	edge16l	%g2,	%i6,	%l6
	movvc	%icc,	%i0,	%o0
loop_1655:
	smul	%l3,	0x05CD,	%i3
	sdivcc	%o6,	0x087A,	%l5
	mova	%icc,	%o3,	%o7
	ta	%xcc,	0x4
	fands	%f7,	%f2,	%f2
	ldsb	[%l7 + 0x49],	%l1
	te	%icc,	0x7
	brnz	%l4,	loop_1656
	fabsd	%f24,	%f2
	brlez,a	%o2,	loop_1657
	tcs	%icc,	0x7
loop_1656:
	fmovdle	%icc,	%f9,	%f2
	membar	0x47
loop_1657:
	membar	0x33
	fcmps	%fcc0,	%f7,	%f8
	fcmpes	%fcc0,	%f4,	%f3
	array32	%o5,	%o1,	%l0
	movle	%icc,	%i7,	%g6
	bn,a	loop_1658
	fmovsg	%xcc,	%f2,	%f16
	edge32n	%g5,	%g4,	%i5
	sll	%i1,	0x00,	%l2
loop_1658:
	tneg	%xcc,	0x0
	movleu	%icc,	%g1,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x2
	addcc	%g3,	0x1FAE,	%i4
	movvs	%icc,	%i2,	%g2
	movl	%xcc,	%o4,	%l6
	ldstub	[%l7 + 0x67],	%i0
	mulscc	%i6,	%o0,	%i3
	andcc	%l3,	0x1215,	%o6
	movrlz	%l5,	0x1B0,	%o7
	fmovde	%icc,	%f23,	%f19
	array16	%o3,	%l1,	%o2
	sethi	0x04C1,	%o5
	fmovdpos	%xcc,	%f7,	%f5
	fmovdl	%xcc,	%f15,	%f22
	movvc	%icc,	%o1,	%l0
	edge8n	%i7,	%l4,	%g5
	nop
	set	0x76, %i4
	sth	%g4,	[%l7 + %i4]
	fmovscs	%xcc,	%f31,	%f24
	andcc	%g6,	%i1,	%i5
	fmovrsne	%l2,	%f13,	%f21
	te	%icc,	0x0
	fnegs	%f8,	%f10
	faligndata	%f22,	%f6,	%f8
	fxnors	%f4,	%f13,	%f20
	udiv	%g1,	0x1684,	%g3
	orncc	%i4,	0x12AA,	%g7
	addccc	%i2,	%g2,	%o4
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf0
	membar	#Sync
	fmovde	%xcc,	%f14,	%f19
	flush	%l7 + 0x70
	sir	0x0A49
	sllx	%l6,	0x02,	%i6
	edge16n	%o0,	%i3,	%i0
	edge32n	%o6,	%l5,	%o7
	tleu	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fpsub32	%f14,	%f6,	%f26
	fmovsleu	%xcc,	%f7,	%f14
	fbuge,a	%fcc3,	loop_1659
	movvc	%xcc,	%o3,	%l1
	sethi	0x1008,	%l3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o5,	%o1
loop_1659:
	tcs	%xcc,	0x7
	fmovdleu	%icc,	%f11,	%f5
	movrlz	%l0,	%i7,	%o2
	smulcc	%g5,	0x0402,	%l4
	movvs	%xcc,	%g6,	%g4
	edge32n	%i1,	%l2,	%g1
	movrlz	%g3,	0x29F,	%i5
	prefetch	[%l7 + 0x78],	 0x2
	fmovdcs	%xcc,	%f30,	%f6
	ble,pt	%icc,	loop_1660
	std	%i4,	[%l7 + 0x28]
	fxor	%f28,	%f12,	%f26
	edge16	%g7,	%g2,	%i2
loop_1660:
	fpadd32	%f4,	%f22,	%f22
	tsubcc	%l6,	0x14C9,	%o4
	fmovsne	%xcc,	%f11,	%f17
	movvs	%icc,	%o0,	%i6
	fmul8x16	%f27,	%f26,	%f0
	sdivx	%i0,	0x03B7,	%o6
	ldsb	[%l7 + 0x7A],	%l5
	movg	%icc,	%i3,	%o7
	sdiv	%o3,	0x1724,	%l1
	sir	0x05B4
	tg	%icc,	0x1
	edge8ln	%l3,	%o5,	%l0
	addcc	%o1,	0x007B,	%o2
	umulcc	%g5,	%i7,	%l4
	tsubcctv	%g6,	0x0386,	%i1
	fzero	%f24
	fcmpgt32	%f30,	%f10,	%l2
	fmovs	%f12,	%f13
	wr	%g0,	0x0c,	%asi
	stxa	%g1,	[%l7 + 0x20] %asi
	udivx	%g3,	0x0369,	%g4
	bvs,a	%xcc,	loop_1661
	tge	%icc,	0x7
	set	0x10, %o6
	swapa	[%l7 + %o6] 0x89,	%i5
loop_1661:
	bn	%xcc,	loop_1662
	fmovdpos	%icc,	%f26,	%f27
	fmovdneg	%icc,	%f24,	%f28
	fmovde	%icc,	%f11,	%f9
loop_1662:
	movge	%icc,	%g7,	%i4
	ldx	[%l7 + 0x08],	%i2
	alignaddrl	%g2,	%o4,	%o0
	fmuld8sux16	%f4,	%f14,	%f30
	tne	%icc,	0x0
	andncc	%l6,	%i6,	%o6
	fmul8x16au	%f6,	%f18,	%f8
	udivcc	%l5,	0x13D8,	%i3
	fmovsgu	%xcc,	%f24,	%f27
	sll	%o7,	0x03,	%o3
	addccc	%l1,	0x0A33,	%l3
	mulscc	%i0,	0x1939,	%o5
	tneg	%icc,	0x2
	tl	%icc,	0x1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%o1
	edge32l	%g5,	%i7,	%l4
	xorcc	%g6,	0x12F4,	%o2
	movcs	%icc,	%l2,	%i1
	fornot1s	%f17,	%f9,	%f30
	edge16l	%g3,	%g1,	%i5
	fone	%f18
	move	%xcc,	%g4,	%g7
	fbu	%fcc0,	loop_1663
	mulscc	%i2,	%i4,	%g2
	movne	%xcc,	%o4,	%o0
	orcc	%i6,	0x1F1E,	%o6
loop_1663:
	sir	0x133A
	fbug	%fcc2,	loop_1664
	movgu	%xcc,	%l6,	%l5
	tvs	%icc,	0x6
	movvc	%icc,	%o7,	%i3
loop_1664:
	fmovrdgz	%o3,	%f4,	%f18
	movrne	%l1,	%i0,	%o5
	taddcc	%l3,	0x1FB1,	%l0
	sll	%o1,	0x0B,	%i7
	fbge	%fcc1,	loop_1665
	lduh	[%l7 + 0x4E],	%l4
	alignaddrl	%g5,	%o2,	%g6
	movrlz	%i1,	0x3CB,	%g3
loop_1665:
	udivx	%g1,	0x11B7,	%l2
	be,pt	%xcc,	loop_1666
	movleu	%icc,	%i5,	%g4
	fxor	%f20,	%f8,	%f22
	stb	%g7,	[%l7 + 0x5F]
loop_1666:
	umul	%i4,	%i2,	%g2
	sll	%o0,	0x01,	%i6
	array32	%o4,	%l6,	%l5
	std	%o6,	[%l7 + 0x20]
	movge	%xcc,	%i3,	%o6
	movgu	%xcc,	%o3,	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%l3
	orcc	%l0,	0x1E12,	%o1
	move	%xcc,	%i7,	%o5
	fmovdgu	%xcc,	%f29,	%f29
	taddcc	%g5,	0x01FD,	%o2
	tcc	%xcc,	0x0
	fmovrdlez	%g6,	%f16,	%f28
	fabss	%f9,	%f18
	fmovdvs	%icc,	%f2,	%f30
	orn	%l4,	%i1,	%g3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x43] %asi,	%g1
	orcc	%l2,	%i5,	%g7
	movleu	%xcc,	%i4,	%i2
	fbug,a	%fcc3,	loop_1667
	sth	%g2,	[%l7 + 0x2C]
	sir	0x1ECE
	popc	%g4,	%o0
loop_1667:
	srl	%o4,	0x13,	%i6
	array32	%l6,	%l5,	%i3
	edge8l	%o7,	%o6,	%o3
	xnor	%l1,	0x03BA,	%i0
	alignaddrl	%l0,	%o1,	%i7
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x20] %asi,	%o5
	fcmpgt16	%f6,	%f24,	%g5
	array8	%o2,	%l3,	%l4
	ta	%xcc,	0x4
	fpackfix	%f2,	%f8
	movle	%icc,	%g6,	%g3
	bvs,pt	%icc,	loop_1668
	ldsw	[%l7 + 0x0C],	%i1
	orcc	%g1,	0x0018,	%i5
	ldsb	[%l7 + 0x48],	%g7
loop_1668:
	fpsub32s	%f28,	%f22,	%f31
	flush	%l7 + 0x18
	subc	%i4,	%l2,	%g2
	edge8	%i2,	%o0,	%g4
	array32	%o4,	%i6,	%l6
	or	%l5,	0x1EA8,	%o7
	fsrc1	%f26,	%f6
	edge16ln	%o6,	%i3,	%l1
	fone	%f4
	bvs	%xcc,	loop_1669
	membar	0x34
	sir	0x0C9D
	taddcc	%o3,	%l0,	%o1
loop_1669:
	array8	%i0,	%i7,	%o5
	tvc	%xcc,	0x7
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x30] %asi,	%o2
	movcc	%icc,	%l3,	%l4
	sth	%g6,	[%l7 + 0x70]
	edge16	%g5,	%i1,	%g3
	edge16ln	%i5,	%g7,	%g1
	tne	%xcc,	0x3
	sllx	%i4,	%l2,	%i2
	fzeros	%f21
	ldd	[%l7 + 0x68],	%o0
	bge,pn	%icc,	loop_1670
	edge16ln	%g2,	%o4,	%i6
	fcmpd	%fcc0,	%f18,	%f30
	ba,a	loop_1671
loop_1670:
	orn	%g4,	%l6,	%l5
	smul	%o7,	%o6,	%i3
	array16	%l1,	%l0,	%o3
loop_1671:
	umulcc	%o1,	%i7,	%o5
	fnot2s	%f15,	%f8
	fmovs	%f8,	%f12
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	bpos,a,pn	%xcc,	loop_1672
	lduh	[%l7 + 0x46],	%i0
	sdivx	%l4,	0x08A2,	%l3
	fmovdn	%xcc,	%f12,	%f27
loop_1672:
	tsubcctv	%g5,	%i1,	%g3
	edge16	%g6,	%g7,	%g1
	fones	%f20
	bl	%icc,	loop_1673
	tg	%xcc,	0x7
	ldsh	[%l7 + 0x42],	%i4
	call	loop_1674
loop_1673:
	movl	%xcc,	%i5,	%l2
	bne,pt	%icc,	loop_1675
	popc	0x0DEF,	%i2
loop_1674:
	tcc	%xcc,	0x7
	te	%icc,	0x0
loop_1675:
	ldsh	[%l7 + 0x74],	%o0
	movle	%icc,	%g2,	%i6
	orn	%o4,	%l6,	%l5
	fandnot2	%f10,	%f24,	%f30
	alignaddr	%g4,	%o7,	%o6
	fmovde	%icc,	%f11,	%f19
	fpadd32	%f12,	%f20,	%f16
	fmovsvc	%xcc,	%f2,	%f4
	sdivx	%l1,	0x1637,	%i3
	edge8n	%o3,	%l0,	%o1
	fsrc1s	%f14,	%f21
	sdivx	%o5,	0x100C,	%i7
	fbe,a	%fcc3,	loop_1676
	xorcc	%o2,	0x11B6,	%i0
	srax	%l4,	%l3,	%g5
	movre	%i1,	%g3,	%g7
loop_1676:
	fmovrdlez	%g6,	%f30,	%f12
	sll	%i4,	0x00,	%g1
	edge16l	%l2,	%i5,	%i2
	be,a	%icc,	loop_1677
	alignaddrl	%g2,	%o0,	%i6
	andncc	%o4,	%l5,	%g4
	movvc	%icc,	%o7,	%l6
loop_1677:
	nop
	wr	%g0,	0x88,	%asi
	sta	%f6,	[%l7 + 0x24] %asi
	tneg	%icc,	0x4
	sll	%o6,	%i3,	%o3
	fble	%fcc2,	loop_1678
	tsubcc	%l0,	%l1,	%o5
	fmul8sux16	%f20,	%f24,	%f10
	bgu,pt	%icc,	loop_1679
loop_1678:
	alignaddrl	%o1,	%o2,	%i7
	edge32	%i0,	%l4,	%l3
	edge16l	%g5,	%g3,	%g7
loop_1679:
	movleu	%xcc,	%i1,	%g6
	fbge	%fcc0,	loop_1680
	andncc	%g1,	%l2,	%i5
	fone	%f10
	call	loop_1681
loop_1680:
	edge32ln	%i2,	%g2,	%i4
	edge32n	%i6,	%o0,	%o4
	fsrc1	%f18,	%f30
loop_1681:
	tvc	%xcc,	0x7
	fcmpne32	%f10,	%f24,	%g4
	fexpand	%f1,	%f18
	fmovde	%xcc,	%f0,	%f30
	tsubcctv	%o7,	%l6,	%l5
	sethi	0x00B8,	%i3
	xorcc	%o3,	0x11FA,	%o6
	mulscc	%l1,	0x1C64,	%o5
	mulscc	%o1,	0x1C02,	%l0
	fmovdpos	%icc,	%f4,	%f22
	sll	%o2,	0x10,	%i7
	movvs	%xcc,	%l4,	%l3
	bge,a	loop_1682
	sub	%i0,	%g3,	%g5
	ble	loop_1683
	movne	%xcc,	%i1,	%g7
loop_1682:
	fmovdvc	%xcc,	%f16,	%f26
	xnorcc	%g6,	0x01FE,	%g1
loop_1683:
	fbe,a	%fcc3,	loop_1684
	fxors	%f6,	%f27,	%f1
	add	%i5,	0x134B,	%i2
	fandnot1	%f24,	%f12,	%f30
loop_1684:
	srl	%l2,	%i4,	%g2
	brnz,a	%o0,	loop_1685
	movleu	%xcc,	%o4,	%g4
	movle	%xcc,	%o7,	%l6
	fblg,a	%fcc1,	loop_1686
loop_1685:
	subc	%l5,	0x163A,	%i6
	fpackfix	%f30,	%f17
	fmovdpos	%xcc,	%f6,	%f10
loop_1686:
	stbar
	sdiv	%i3,	0x0D52,	%o6
	tl	%icc,	0x5
	srlx	%o3,	0x18,	%o5
	edge8l	%o1,	%l1,	%l0
	mova	%xcc,	%o2,	%i7
	fornot2s	%f11,	%f28,	%f21
	std	%f16,	[%l7 + 0x20]
	fpsub16s	%f22,	%f26,	%f25
	alignaddrl	%l3,	%l4,	%g3
	tl	%icc,	0x5
	bg,pt	%icc,	loop_1687
	fbo	%fcc2,	loop_1688
	sdivx	%g5,	0x0A6A,	%i0
	ldsw	[%l7 + 0x6C],	%i1
loop_1687:
	srax	%g6,	%g1,	%g7
loop_1688:
	fmovd	%f20,	%f10
	tcs	%icc,	0x4
	srlx	%i2,	%l2,	%i5
	srlx	%i4,	%g2,	%o4
	fmovdge	%xcc,	%f7,	%f14
	movne	%icc,	%g4,	%o0
	movvs	%xcc,	%o7,	%l5
	brlez,a	%i6,	loop_1689
	movleu	%icc,	%l6,	%i3
	stw	%o6,	[%l7 + 0x74]
	fabss	%f25,	%f24
loop_1689:
	brlez	%o5,	loop_1690
	fcmpeq32	%f14,	%f26,	%o1
	array8	%l1,	%l0,	%o2
	fbne	%fcc3,	loop_1691
loop_1690:
	movpos	%icc,	%i7,	%o3
	fpsub16	%f6,	%f10,	%f24
	sdiv	%l4,	0x1F8D,	%l3
loop_1691:
	udivx	%g5,	0x0D09,	%i0
	fmovdne	%xcc,	%f7,	%f7
	tne	%xcc,	0x1
	set	0x5C, %l3
	lduwa	[%l7 + %l3] 0x04,	%i1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%g3
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movn	%icc,	%g7,	%g1
	sdivcc	%i2,	0x17B3,	%l2
	fzero	%f16
	sdivx	%i4,	0x1E97,	%i5
	tleu	%icc,	0x6
	movcs	%icc,	%o4,	%g2
	edge32n	%o0,	%o7,	%l5
	fabsd	%f16,	%f24
	edge16n	%g4,	%l6,	%i3
	fmovrslez	%i6,	%f15,	%f20
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x17,	%f16
	tl	%xcc,	0x3
	movrgez	%o5,	%o6,	%o1
	fbge	%fcc0,	loop_1692
	sethi	0x0D0E,	%l0
	fbg	%fcc0,	loop_1693
	fxnors	%f22,	%f2,	%f2
loop_1692:
	fmovsvc	%xcc,	%f4,	%f29
	fmovdgu	%xcc,	%f19,	%f9
loop_1693:
	tsubcc	%l1,	%o2,	%i7
	xnor	%l4,	0x103C,	%l3
	orn	%o3,	0x1EB5,	%g5
	umulcc	%i1,	%i0,	%g3
	tge	%xcc,	0x2
	movrgez	%g6,	0x384,	%g1
	fcmpes	%fcc0,	%f6,	%f2
	brgz,a	%i2,	loop_1694
	edge8n	%l2,	%g7,	%i4
	addccc	%o4,	%g2,	%o0
	membar	0x6D
loop_1694:
	nop
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x04,	%f0
	tpos	%icc,	0x2
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fornot1	%f28,	%f10,	%f26
	edge32	%i5,	%o7,	%l5
	fmul8x16al	%f10,	%f3,	%f4
	ldx	[%l7 + 0x10],	%l6
	bneg,pt	%xcc,	loop_1695
	orcc	%g4,	%i6,	%o5
	set	0x0C, %i2
	lda	[%l7 + %i2] 0x19,	%f12
loop_1695:
	brgz,a	%o6,	loop_1696
	edge32ln	%i3,	%l0,	%l1
	fbuge,a	%fcc2,	loop_1697
	fmovsg	%xcc,	%f27,	%f22
loop_1696:
	edge8n	%o1,	%o2,	%l4
	bg	%xcc,	loop_1698
loop_1697:
	movcc	%icc,	%l3,	%o3
	movcc	%xcc,	%g5,	%i1
	fbl	%fcc0,	loop_1699
loop_1698:
	fpadd16s	%f7,	%f11,	%f5
	brlez,a	%i0,	loop_1700
	bvc	%xcc,	loop_1701
loop_1699:
	sth	%i7,	[%l7 + 0x7A]
	smulcc	%g3,	0x1124,	%g1
loop_1700:
	fmovsge	%xcc,	%f27,	%f14
loop_1701:
	srl	%i2,	%l2,	%g7
	tcc	%icc,	0x0
	set	0x61, %o2
	ldsba	[%l7 + %o2] 0x18,	%g6
	movvs	%icc,	%o4,	%g2
	srl	%i4,	0x0F,	%i5
	be	%icc,	loop_1702
	edge16ln	%o0,	%o7,	%l6
	tcc	%xcc,	0x4
	bl,a	%xcc,	loop_1703
loop_1702:
	orcc	%l5,	%g4,	%o5
	umul	%o6,	0x0118,	%i6
	tsubcctv	%l0,	%i3,	%l1
loop_1703:
	fbge	%fcc2,	loop_1704
	movl	%icc,	%o2,	%o1
	fnegd	%f6,	%f2
	orncc	%l4,	%l3,	%g5
loop_1704:
	tcs	%xcc,	0x2
	xor	%o3,	%i0,	%i7
	fbl	%fcc1,	loop_1705
	xnor	%g3,	0x1A4E,	%g1
	fbe,a	%fcc2,	loop_1706
	fsrc1s	%f7,	%f5
loop_1705:
	lduw	[%l7 + 0x38],	%i2
	sdivcc	%l2,	0x049E,	%i1
loop_1706:
	movn	%xcc,	%g6,	%g7
	membar	0x27
	xnorcc	%g2,	0x1F74,	%i4
	fbug	%fcc0,	loop_1707
	ta	%xcc,	0x6
	fnegd	%f26,	%f8
	movge	%xcc,	%i5,	%o4
loop_1707:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o0,	0x1677,	%l6
	edge8l	%l5,	%g4,	%o7
	mova	%xcc,	%o6,	%i6
	mulscc	%o5,	%l0,	%i3
	movrgez	%o2,	%o1,	%l4
	wr	%g0,	0x89,	%asi
	stba	%l1,	[%l7 + 0x6F] %asi
	tcs	%icc,	0x3
	movl	%icc,	%l3,	%o3
	movrne	%i0,	0x335,	%g5
	sllx	%i7,	0x15,	%g3
	wr	%g0,	0x81,	%asi
	stha	%i2,	[%l7 + 0x1C] %asi
	movcc	%icc,	%g1,	%i1
	mulscc	%g6,	0x1481,	%g7
	edge8n	%l2,	%g2,	%i4
	membar	0x2B
	movrlz	%i5,	0x266,	%o4
	stbar
	edge32ln	%l6,	%l5,	%o0
	sdivx	%g4,	0x1883,	%o6
	and	%o7,	%i6,	%o5
	taddcctv	%i3,	0x1697,	%o2
	movrgz	%o1,	%l0,	%l1
	sub	%l3,	0x0E2F,	%l4
	sdivcc	%i0,	0x19B7,	%o3
	ba,pt	%icc,	loop_1708
	movle	%icc,	%i7,	%g3
	andcc	%i2,	%g5,	%g1
	edge16	%i1,	%g7,	%g6
loop_1708:
	subc	%g2,	%i4,	%i5
	movg	%icc,	%o4,	%l2
	ldd	[%l7 + 0x28],	%f18
	srl	%l5,	0x0E,	%l6
	tgu	%icc,	0x0
	fsrc1	%f8,	%f18
	taddcc	%g4,	0x07EA,	%o0
	taddcc	%o6,	%i6,	%o5
	xnorcc	%o7,	%o2,	%i3
	movre	%l0,	0x336,	%l1
	tsubcc	%o1,	%l3,	%i0
	movleu	%xcc,	%l4,	%o3
	fornot1s	%f8,	%f16,	%f13
	movl	%icc,	%g3,	%i2
	orncc	%g5,	0x1A73,	%i7
	edge32l	%i1,	%g7,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g2,	%g6,	%i5
	fmul8sux16	%f4,	%f28,	%f12
	srlx	%o4,	0x01,	%i4
	sub	%l2,	0x01FC,	%l6
	addcc	%g4,	0x1086,	%o0
	fnot1s	%f6,	%f1
	tpos	%icc,	0x1
	fxors	%f15,	%f26,	%f22
	fbug,a	%fcc1,	loop_1709
	edge8l	%o6,	%i6,	%o5
	tsubcctv	%o7,	%l5,	%i3
	fbue,a	%fcc1,	loop_1710
loop_1709:
	bne	loop_1711
	alignaddrl	%l0,	%o2,	%o1
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x14,	%l0
loop_1710:
	edge32ln	%l3,	%i0,	%l4
loop_1711:
	movgu	%icc,	%o3,	%g3
	tvs	%xcc,	0x7
	edge16l	%i2,	%i7,	%i1
	fmovse	%xcc,	%f26,	%f22
	alignaddrl	%g5,	%g7,	%g1
	fandnot1s	%f13,	%f26,	%f6
	sethi	0x1965,	%g2
	edge16l	%g6,	%i5,	%i4
	bshuffle	%f12,	%f20,	%f0
	membar	0x28
	xnorcc	%o4,	0x1246,	%l6
	brlz,a	%l2,	loop_1712
	edge32	%o0,	%g4,	%o6
	fmovd	%f12,	%f20
	flush	%l7 + 0x58
loop_1712:
	alignaddr	%i6,	%o7,	%l5
	lduw	[%l7 + 0x7C],	%i3
	addc	%o5,	0x1BEB,	%l0
	movle	%icc,	%o2,	%o1
	fmovsge	%icc,	%f26,	%f0
	sdivx	%l3,	0x1F0C,	%i0
	fsrc1s	%f29,	%f5
	movne	%xcc,	%l4,	%o3
	srl	%g3,	0x02,	%l1
	fbne	%fcc1,	loop_1713
	add	%i7,	0x1091,	%i2
	brz	%g5,	loop_1714
	fbne	%fcc2,	loop_1715
loop_1713:
	membar	0x7F
	ldstub	[%l7 + 0x11],	%g7
loop_1714:
	array8	%i1,	%g1,	%g6
loop_1715:
	tvc	%xcc,	0x3
	fpackfix	%f8,	%f0
	wr	%g0,	0x19,	%asi
	stba	%g2,	[%l7 + 0x6A] %asi
	fpsub32s	%f11,	%f19,	%f20
	fones	%f18
	stx	%i5,	[%l7 + 0x70]
	movleu	%icc,	%i4,	%l6
	fpmerge	%f13,	%f27,	%f4
	alignaddr	%l2,	%o4,	%o0
	brgz,a	%o6,	loop_1716
	fbo	%fcc0,	loop_1717
	fpadd32	%f12,	%f20,	%f18
	membar	0x4D
loop_1716:
	tpos	%xcc,	0x1
loop_1717:
	tl	%xcc,	0x7
	bneg,pn	%xcc,	loop_1718
	edge16	%g4,	%i6,	%o7
	movrlez	%i3,	%o5,	%l0
	edge8l	%o2,	%l5,	%o1
loop_1718:
	movvc	%xcc,	%l3,	%l4
	xnorcc	%o3,	%i0,	%g3
	std	%f4,	[%l7 + 0x68]
	movpos	%xcc,	%i7,	%l1
	and	%g5,	%i2,	%g7
	stw	%i1,	[%l7 + 0x60]
	tl	%icc,	0x4
	tl	%icc,	0x7
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x64] %asi,	%g6
	popc	%g2,	%i5
	fmovsleu	%icc,	%f16,	%f9
	fmovdvs	%xcc,	%f8,	%f20
	taddcctv	%g1,	%i4,	%l6
	brgez	%o4,	loop_1719
	edge8	%l2,	%o6,	%o0
	smulcc	%i6,	0x1C7F,	%g4
	fble	%fcc3,	loop_1720
loop_1719:
	tle	%xcc,	0x3
	fmovscc	%icc,	%f30,	%f9
	movg	%xcc,	%i3,	%o7
loop_1720:
	fmovrsne	%l0,	%f21,	%f18
	addcc	%o5,	%o2,	%l5
	taddcc	%l3,	0x04B7,	%l4
	set	0x30, %g1
	ldxa	[%g0 + %g1] 0x4f,	%o1
	andncc	%i0,	%o3,	%i7
	set	0x68, %l1
	stwa	%l1,	[%l7 + %l1] 0x19
	fbule,a	%fcc2,	loop_1721
	or	%g3,	0x0773,	%g5
	fnot1s	%f4,	%f24
	flush	%l7 + 0x48
loop_1721:
	tn	%xcc,	0x0
	movle	%icc,	%i2,	%i1
	alignaddr	%g6,	%g7,	%g2
	movg	%icc,	%g1,	%i4
	fxnor	%f2,	%f24,	%f8
	fpack16	%f10,	%f19
	wr	%g0,	0x18,	%asi
	sta	%f28,	[%l7 + 0x54] %asi
	mulscc	%i5,	0x1579,	%o4
	edge8ln	%l6,	%l2,	%o0
	movvc	%icc,	%o6,	%g4
	orn	%i3,	%o7,	%i6
	mulx	%o5,	0x1340,	%l0
	fexpand	%f12,	%f12
	and	%l5,	0x0FC2,	%l3
	movg	%icc,	%l4,	%o1
	std	%o2,	[%l7 + 0x20]
	fnor	%f10,	%f14,	%f22
	edge32l	%o3,	%i7,	%l1
	fcmpgt16	%f20,	%f6,	%g3
	stw	%i0,	[%l7 + 0x08]
	fandnot1s	%f26,	%f27,	%f26
	tvs	%icc,	0x2
	fbug,a	%fcc1,	loop_1722
	fmovrsne	%g5,	%f20,	%f13
	tleu	%xcc,	0x1
	fbuge	%fcc2,	loop_1723
loop_1722:
	fmovscc	%icc,	%f22,	%f17
	movleu	%xcc,	%i1,	%i2
	alignaddrl	%g7,	%g2,	%g6
loop_1723:
	bcs,a	loop_1724
	fnot2	%f28,	%f6
	ld	[%l7 + 0x74],	%f31
	fzeros	%f30
loop_1724:
	fands	%f4,	%f5,	%f27
	fmovdne	%icc,	%f3,	%f8
	sdivcc	%i4,	0x0930,	%i5
	brlez	%o4,	loop_1725
	tg	%icc,	0x4
	popc	0x0A07,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1725:
	prefetch	[%l7 + 0x60],	 0x3
	edge32n	%g1,	%o0,	%l2
	std	%o6,	[%l7 + 0x78]
	fcmpgt32	%f2,	%f20,	%g4
	flush	%l7 + 0x10
	fcmple16	%f22,	%f24,	%o7
	ldsh	[%l7 + 0x0C],	%i3
	movn	%xcc,	%i6,	%o5
	umulcc	%l0,	0x17B4,	%l5
	fnegs	%f13,	%f0
	fbo	%fcc2,	loop_1726
	xor	%l4,	0x0C8B,	%l3
	fmovsn	%xcc,	%f28,	%f30
	tleu	%icc,	0x4
loop_1726:
	fmovrdgez	%o2,	%f8,	%f6
	movrlez	%o1,	0x367,	%i7
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x24,	%l0
	movneg	%icc,	%g3,	%i0
	tpos	%xcc,	0x3
	fxnors	%f16,	%f13,	%f31
	edge8	%o3,	%g5,	%i1
	ldub	[%l7 + 0x7D],	%i2
	andncc	%g2,	%g7,	%g6
	tge	%xcc,	0x2
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x70] %asi,	%i5
	set	0x50, %o7
	stda	%i4,	[%l7 + %o7] 0x19
	edge8l	%l6,	%g1,	%o4
	brgez,a	%o0,	loop_1727
	fmovsvc	%icc,	%f13,	%f18
	tcs	%icc,	0x4
	fblg	%fcc1,	loop_1728
loop_1727:
	popc	0x09A6,	%o6
	tcs	%icc,	0x2
	ldsb	[%l7 + 0x0C],	%l2
loop_1728:
	umulcc	%o7,	0x1E00,	%i3
	fxor	%f6,	%f24,	%f12
	tcc	%icc,	0x2
	taddcctv	%g4,	%i6,	%o5
	ldx	[%l7 + 0x20],	%l0
	fmovrsgez	%l5,	%f30,	%f5
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	tsubcc	%l3,	0x05CA,	%o2
	lduw	[%l7 + 0x44],	%i7
	srlx	%o1,	%g3,	%i0
	subccc	%o3,	%g5,	%i1
	fpadd16	%f6,	%f30,	%f2
	fandnot2s	%f9,	%f14,	%f1
	membar	0x38
	edge16ln	%l1,	%g2,	%i2
	fcmpne16	%f10,	%f6,	%g7
	fmovdvc	%icc,	%f23,	%f8
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x46] %asi,	%i5
	taddcc	%g6,	0x1351,	%i4
	tsubcc	%l6,	%o4,	%o0
	fornot1	%f16,	%f4,	%f18
	sdivcc	%o6,	0x0A80,	%g1
	fsrc1s	%f1,	%f7
	fblg,a	%fcc3,	loop_1729
	subc	%l2,	0x06F1,	%i3
	fcmple16	%f28,	%f28,	%o7
	fsrc1	%f30,	%f20
loop_1729:
	smulcc	%i6,	0x1AB3,	%g4
	movn	%xcc,	%o5,	%l0
	fmul8x16	%f16,	%f14,	%f2
	bgu	loop_1730
	fmuld8sux16	%f26,	%f1,	%f26
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] %asi,	%l4,	%l3
loop_1730:
	nop
	set	0x22, %g7
	lduha	[%l7 + %g7] 0x18,	%o2
	srlx	%l5,	%o1,	%i7
	bpos	loop_1731
	std	%f16,	[%l7 + 0x28]
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x50] %asi,	%i0
loop_1731:
	mova	%icc,	%g3,	%g5
	tn	%xcc,	0x5
	movneg	%icc,	%o3,	%l1
	xnorcc	%i1,	%i2,	%g2
	for	%f30,	%f2,	%f10
	fcmpgt32	%f2,	%f0,	%i5
	tvs	%icc,	0x4
	movcc	%icc,	%g7,	%i4
	fbug,a	%fcc3,	loop_1732
	fmovsvc	%xcc,	%f21,	%f8
	fbue	%fcc3,	loop_1733
	andcc	%g6,	%l6,	%o4
loop_1732:
	fnegs	%f7,	%f16
	edge16	%o0,	%g1,	%o6
loop_1733:
	fand	%f14,	%f14,	%f16
	popc	0x0AA7,	%l2
	tge	%icc,	0x4
	fornot1s	%f22,	%f25,	%f19
	tle	%icc,	0x1
	fone	%f2
	xnor	%o7,	%i6,	%i3
	be,a	%icc,	loop_1734
	subc	%g4,	%l0,	%l4
	subccc	%o5,	%l3,	%o2
	fmovsgu	%icc,	%f31,	%f12
loop_1734:
	sdivcc	%o1,	0x07C2,	%l5
	sir	0x0734
	tneg	%xcc,	0x1
	sub	%i7,	%i0,	%g5
	tvc	%xcc,	0x0
	wr	%g0,	0x2f,	%asi
	stba	%o3,	[%l7 + 0x2A] %asi
	membar	#Sync
	te	%xcc,	0x2
	tn	%xcc,	0x2
	movvc	%icc,	%g3,	%l1
	set	0x64, %i0
	stba	%i2,	[%l7 + %i0] 0x18
	fnegd	%f16,	%f24
	set	0x3A, %g6
	stba	%i1,	[%l7 + %g6] 0x88
	movcc	%icc,	%g2,	%g7
	mova	%xcc,	%i4,	%i5
	edge16	%l6,	%o4,	%o0
	movre	%g1,	0x016,	%o6
	tgu	%icc,	0x7
	nop
	set	0x70, %o0
	std	%l2,	[%l7 + %o0]
	move	%xcc,	%g6,	%i6
	add	%o7,	%g4,	%i3
	movcs	%xcc,	%l4,	%l0
	sir	0x015B
	umulcc	%o5,	%l3,	%o1
	sethi	0x087B,	%o2
	movpos	%icc,	%i7,	%i0
	brnz	%g5,	loop_1735
	udiv	%o3,	0x11B7,	%l5
	stw	%g3,	[%l7 + 0x3C]
	movrlz	%l1,	%i1,	%i2
loop_1735:
	addcc	%g2,	0x03BE,	%g7
	bvc,a,pn	%icc,	loop_1736
	xor	%i5,	%i4,	%o4
	udivx	%o0,	0x15DD,	%g1
	fpack16	%f12,	%f1
loop_1736:
	tle	%icc,	0x7
	movg	%icc,	%o6,	%l6
	tl	%xcc,	0x2
	fnegd	%f22,	%f20
	fsrc1s	%f15,	%f7
	edge16l	%l2,	%g6,	%o7
	std	%i6,	[%l7 + 0x10]
	movn	%icc,	%i3,	%g4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x50] %asi,	%l0
	ldd	[%l7 + 0x60],	%l4
	fmovdl	%xcc,	%f22,	%f5
	set	0x65, %l5
	stba	%l3,	[%l7 + %l5] 0xe3
	membar	#Sync
	tsubcctv	%o5,	0x112F,	%o2
	movge	%xcc,	%i7,	%i0
	tgu	%icc,	0x2
	tcc	%xcc,	0x6
	set	0x48, %l2
	stwa	%o1,	[%l7 + %l2] 0x18
	tvs	%icc,	0x0
	fbu	%fcc1,	loop_1737
	fmovs	%f4,	%f20
	edge16	%o3,	%g5,	%g3
	tn	%icc,	0x0
loop_1737:
	orncc	%l5,	0x1343,	%l1
	tle	%icc,	0x6
	srlx	%i2,	%g2,	%i1
	set	0x60, %o1
	stxa	%g7,	[%l7 + %o1] 0x88
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
	st	%f27,	[%l7 + 0x30]
	subcc	%o4,	%o0,	%g1
	stx	%i4,	[%l7 + 0x40]
	movpos	%xcc,	%l6,	%l2
	xor	%o6,	0x0E0A,	%g6
	mulscc	%i6,	%o7,	%i3
	movn	%icc,	%l0,	%g4
	xnorcc	%l4,	%o5,	%l3
	bshuffle	%f14,	%f2,	%f26
	andncc	%i7,	%o2,	%i0
	set	0x18, %o5
	stba	%o1,	[%l7 + %o5] 0x11
	fmovrde	%g5,	%f8,	%f28
	ldd	[%l7 + 0x10],	%o2
	movvc	%xcc,	%l5,	%l1
	fmovspos	%icc,	%f24,	%f22
	set	0x5A, %l4
	ldsha	[%l7 + %l4] 0x80,	%i2
	call	loop_1738
	subc	%g3,	%i1,	%g2
	edge8	%i5,	%o4,	%o0
	fmovdvs	%xcc,	%f7,	%f26
loop_1738:
	fbl,a	%fcc2,	loop_1739
	sll	%g7,	%g1,	%l6
	subc	%l2,	%i4,	%g6
	siam	0x6
loop_1739:
	fpadd32	%f4,	%f10,	%f26
	andcc	%i6,	%o6,	%o7
	sra	%i3,	0x16,	%l0
	fnot1	%f26,	%f14
	mulx	%g4,	%l4,	%l3
	fpsub32	%f14,	%f2,	%f26
	orcc	%i7,	%o2,	%i0
	move	%icc,	%o1,	%g5
	tge	%xcc,	0x2
	ldub	[%l7 + 0x1E],	%o5
	bgu	%xcc,	loop_1740
	fmovdcc	%xcc,	%f24,	%f25
	fmovscs	%icc,	%f1,	%f4
	nop
	set	0x42, %i7
	sth	%l5,	[%l7 + %i7]
loop_1740:
	movleu	%xcc,	%o3,	%i2
	bn,a	%icc,	loop_1741
	array16	%g3,	%l1,	%g2
	srl	%i1,	%i5,	%o0
	tcs	%icc,	0x2
loop_1741:
	sdiv	%g7,	0x1AF0,	%o4
	ldd	[%l7 + 0x68],	%g0
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x10
	tcs	%icc,	0x5
	movrgez	%l6,	0x089,	%l2
	brgz	%i4,	loop_1742
	st	%f6,	[%l7 + 0x4C]
	fsrc1s	%f14,	%f5
	orcc	%i6,	0x144B,	%o6
loop_1742:
	tvc	%xcc,	0x5
	sub	%g6,	0x0ED0,	%o7
	umul	%l0,	0x0286,	%g4
	sdivcc	%i3,	0x021A,	%l3
	ldstub	[%l7 + 0x6F],	%l4
	array8	%i7,	%i0,	%o1
	tgu	%xcc,	0x6
	orcc	%g5,	0x1D6C,	%o2
	edge8	%l5,	%o5,	%o3
	fcmpne16	%f28,	%f22,	%i2
	srax	%g3,	%l1,	%g2
	mulx	%i1,	0x1D87,	%o0
	wr	%g0,	0x18,	%asi
	stxa	%g7,	[%l7 + 0x18] %asi
	fands	%f14,	%f8,	%f28
	ldx	[%l7 + 0x30],	%o4
	taddcc	%i5,	0x0A9E,	%l6
	edge32ln	%l2,	%i4,	%i6
	wr	%g0,	0x18,	%asi
	stda	%o6,	[%l7 + 0x68] %asi
	prefetch	[%l7 + 0x1C],	 0x3
	tn	%icc,	0x0
	addcc	%g6,	0x05BD,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l0,	%g4,	%i3
	edge16n	%l3,	%g1,	%l4
	add	%i0,	%o1,	%i7
	nop
	set	0x48, %o3
	stx	%g5,	[%l7 + %o3]
	ldstub	[%l7 + 0x55],	%l5
	mulscc	%o5,	%o2,	%o3
	udiv	%g3,	0x13E4,	%l1
	brlz	%g2,	loop_1743
	movrne	%i2,	%i1,	%o0
	movrlz	%g7,	0x310,	%i5
	fpack16	%f8,	%f4
loop_1743:
	fbug,a	%fcc0,	loop_1744
	brgez,a	%l6,	loop_1745
	fcmpgt32	%f14,	%f30,	%l2
	fbule,a	%fcc3,	loop_1746
loop_1744:
	bpos,a	loop_1747
loop_1745:
	fbne	%fcc2,	loop_1748
	nop
	setx	loop_1749,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1746:
	udivx	%i4,	0x1DCE,	%o4
loop_1747:
	ble,a	loop_1750
loop_1748:
	tcs	%xcc,	0x0
loop_1749:
	ldsw	[%l7 + 0x2C],	%o6
	stx	%g6,	[%l7 + 0x30]
loop_1750:
	fmuld8sux16	%f31,	%f24,	%f26
	fmovrdne	%i6,	%f24,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f2,	%f28,	%f24
	fornot2s	%f14,	%f10,	%f0
	ldsb	[%l7 + 0x53],	%o7
	movneg	%icc,	%l0,	%g4
	orcc	%l3,	0x12DF,	%i3
	fsrc2s	%f0,	%f24
	bgu,a,pn	%icc,	loop_1751
	xorcc	%l4,	0x0B82,	%g1
	tsubcctv	%i0,	%o1,	%i7
	sra	%l5,	0x15,	%g5
loop_1751:
	edge16ln	%o2,	%o5,	%g3
	fmovrslez	%l1,	%f27,	%f10
	set	0x20, %l0
	ldsba	[%l7 + %l0] 0x11,	%o3
	tle	%icc,	0x4
	nop
	set	0x31, %l6
	ldstub	[%l7 + %l6],	%g2
	fmovdvs	%icc,	%f17,	%f24
	fmovdvs	%xcc,	%f31,	%f18
	smulcc	%i1,	0x1E0A,	%i2
	st	%f25,	[%l7 + 0x3C]
	movrlz	%o0,	0x264,	%i5
	subcc	%g7,	0x0B52,	%l2
	array16	%i4,	%o4,	%l6
	wr	%g0,	0xe2,	%asi
	stba	%o6,	[%l7 + 0x23] %asi
	membar	#Sync
	edge16	%g6,	%i6,	%o7
	brz,a	%g4,	loop_1752
	nop
	set	0x0B, %g4
	ldstub	[%l7 + %g4],	%l0
	sdiv	%i3,	0x1527,	%l4
	tl	%icc,	0x0
loop_1752:
	tsubcctv	%l3,	%g1,	%o1
	popc	%i0,	%l5
	srlx	%g5,	%i7,	%o5
	sethi	0x1FA6,	%g3
	brlez,a	%l1,	loop_1753
	array32	%o3,	%g2,	%o2
	movge	%xcc,	%i1,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1753:
	movle	%xcc,	%i5,	%i2
	fmul8sux16	%f28,	%f6,	%f10
	fmovrse	%l2,	%f23,	%f24
	mulscc	%g7,	0x1F21,	%o4
	set	0x4C, %i6
	stha	%i4,	[%l7 + %i6] 0xe2
	membar	#Sync
	tsubcc	%l6,	0x1FF2,	%g6
	fmovdvc	%xcc,	%f26,	%f20
	taddcc	%i6,	%o7,	%o6
	fmovrslz	%l0,	%f20,	%f15
	movge	%xcc,	%i3,	%l4
	alignaddrl	%g4,	%g1,	%l3
	udivcc	%o1,	0x012B,	%i0
	umul	%g5,	0x0FB9,	%l5
	ldd	[%l7 + 0x08],	%f16
	movge	%xcc,	%i7,	%o5
	movle	%xcc,	%g3,	%l1
	movleu	%icc,	%g2,	%o2
	subccc	%o3,	0x0281,	%o0
	or	%i1,	0x0FD9,	%i2
	edge8l	%l2,	%g7,	%i5
	ldd	[%l7 + 0x60],	%f4
	tcc	%icc,	0x5
	fbge,a	%fcc3,	loop_1754
	edge16	%o4,	%i4,	%l6
	or	%i6,	%o7,	%g6
	mova	%xcc,	%l0,	%o6
loop_1754:
	mulscc	%l4,	%i3,	%g1
	edge8l	%g4,	%l3,	%i0
	alignaddrl	%g5,	%o1,	%l5
	addcc	%i7,	0x071D,	%o5
	fcmpd	%fcc2,	%f18,	%f30
	add	%g3,	0x1183,	%l1
	movge	%xcc,	%g2,	%o2
	udivcc	%o0,	0x194F,	%o3
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x14,	%f16
	fmovrdne	%i1,	%f4,	%f20
	edge16n	%l2,	%i2,	%g7
	edge8l	%o4,	%i5,	%i4
	fbuge,a	%fcc1,	loop_1755
	sll	%i6,	%l6,	%g6
	movrlz	%o7,	%l0,	%o6
	edge16n	%i3,	%l4,	%g1
loop_1755:
	movcs	%icc,	%l3,	%i0
	alignaddr	%g4,	%o1,	%l5
	andncc	%g5,	%i7,	%g3
	array8	%l1,	%o5,	%o2
	fmovda	%xcc,	%f10,	%f23
	edge16	%o0,	%g2,	%o3
	xnorcc	%i1,	%l2,	%i2
	tleu	%xcc,	0x3
	addccc	%g7,	%o4,	%i4
	sir	0x1CF8
	movcc	%xcc,	%i5,	%i6
	move	%icc,	%g6,	%l6
	fmovsl	%xcc,	%f30,	%f15
	popc	%o7,	%l0
	fmovdneg	%icc,	%f14,	%f16
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf8,	%f16
	fmovdn	%icc,	%f20,	%f8
	ba,a	loop_1756
	bg,a	%icc,	loop_1757
	fabsd	%f14,	%f18
	sll	%i3,	%o6,	%g1
loop_1756:
	nop
	set	0x38, %o6
	stxa	%l3,	[%l7 + %o6] 0x2f
	membar	#Sync
loop_1757:
	bg,a	%xcc,	loop_1758
	bgu	loop_1759
	fble,a	%fcc1,	loop_1760
	fabsd	%f0,	%f30
loop_1758:
	movle	%icc,	%i0,	%g4
loop_1759:
	movn	%xcc,	%o1,	%l4
loop_1760:
	or	%g5,	0x1153,	%i7
	movrne	%l5,	%g3,	%l1
	movl	%icc,	%o5,	%o2
	bl,a,pn	%icc,	loop_1761
	add	%g2,	%o0,	%i1
	srlx	%l2,	%i2,	%o3
	fexpand	%f19,	%f10
loop_1761:
	fcmple16	%f18,	%f16,	%g7
	fmovrsgez	%i4,	%f29,	%f31
	fmovdle	%xcc,	%f19,	%f15
	fxnors	%f24,	%f19,	%f8
	sir	0x0966
	fnor	%f18,	%f6,	%f20
	tl	%icc,	0x5
	movpos	%icc,	%o4,	%i5
	movrlz	%i6,	%l6,	%o7
	fpack16	%f6,	%f17
	fcmps	%fcc2,	%f25,	%f13
	nop
	setx loop_1762, %l0, %l1
	jmpl %l1, %g6
	fpmerge	%f20,	%f1,	%f26
	set	0x24, %g5
	lda	[%l7 + %g5] 0x14,	%f5
loop_1762:
	ldub	[%l7 + 0x61],	%i3
	fba	%fcc2,	loop_1763
	brnz,a	%o6,	loop_1764
	bshuffle	%f8,	%f12,	%f28
	movcc	%xcc,	%l0,	%g1
loop_1763:
	prefetch	[%l7 + 0x10],	 0x3
loop_1764:
	ta	%xcc,	0x6
	fornot2	%f30,	%f24,	%f30
	umul	%l3,	%g4,	%o1
	tvc	%xcc,	0x2
	alignaddrl	%l4,	%g5,	%i7
	tl	%icc,	0x4
	tle	%icc,	0x7
	fmovsg	%icc,	%f25,	%f8
	fbg,a	%fcc3,	loop_1765
	or	%l5,	0x028B,	%g3
	mulscc	%i0,	0x1055,	%l1
	orncc	%o5,	0x143B,	%g2
loop_1765:
	fsrc2s	%f24,	%f28
	fornot1s	%f23,	%f22,	%f12
	movvs	%xcc,	%o0,	%o2
	fmovdvs	%icc,	%f25,	%f20
	fmuld8sux16	%f6,	%f22,	%f10
	fbne	%fcc3,	loop_1766
	movrgez	%l2,	%i1,	%o3
	set	0x49, %l3
	stba	%g7,	[%l7 + %l3] 0x81
loop_1766:
	ldstub	[%l7 + 0x4B],	%i4
	set	0x26, %o4
	lduha	[%l7 + %o4] 0x81,	%i2
	fbn,a	%fcc0,	loop_1767
	fornot1	%f8,	%f8,	%f12
	mulscc	%o4,	%i6,	%i5
	bshuffle	%f4,	%f12,	%f10
loop_1767:
	fxor	%f24,	%f6,	%f12
	movrgez	%o7,	%g6,	%l6
	ba,pn	%icc,	loop_1768
	fmovse	%icc,	%f3,	%f29
	movvs	%xcc,	%o6,	%l0
	tneg	%icc,	0x4
loop_1768:
	sdiv	%i3,	0x1A2A,	%l3
	sdivx	%g4,	0x1FDA,	%g1
	tg	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x50] %asi,	%f1
	orncc	%o1,	0x15AE,	%g5
	movgu	%xcc,	%i7,	%l5
	movrlz	%l4,	%i0,	%g3
	sub	%l1,	%o5,	%o0
	movrgz	%o2,	%l2,	%g2
	movl	%icc,	%o3,	%i1
	bg,a,pn	%icc,	loop_1769
	fxors	%f30,	%f4,	%f9
	lduw	[%l7 + 0x14],	%g7
	fmovdcs	%xcc,	%f29,	%f26
loop_1769:
	sra	%i2,	0x13,	%o4
	fpsub16s	%f15,	%f14,	%f12
	edge16	%i6,	%i4,	%o7
	fmuld8ulx16	%f18,	%f22,	%f26
	umulcc	%g6,	0x186C,	%l6
	brz	%o6,	loop_1770
	edge32l	%l0,	%i3,	%i5
	fornot2s	%f24,	%f1,	%f18
	smulcc	%l3,	%g1,	%g4
loop_1770:
	movrlz	%g5,	%o1,	%l5
	bleu,pt	%icc,	loop_1771
	fornot1	%f0,	%f12,	%f2
	movre	%i7,	%i0,	%l4
	ba,a	%xcc,	loop_1772
loop_1771:
	st	%f22,	[%l7 + 0x50]
	fbu	%fcc3,	loop_1773
	umul	%l1,	0x05DA,	%o5
loop_1772:
	membar	0x1B
	fmovsge	%icc,	%f20,	%f15
loop_1773:
	edge32n	%o0,	%o2,	%l2
	movl	%xcc,	%g2,	%g3
	swap	[%l7 + 0x78],	%i1
	tge	%icc,	0x6
	addc	%g7,	%o3,	%i2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x30] %asi,	%f14
	ta	%icc,	0x0
	array8	%i6,	%o4,	%o7
	tle	%icc,	0x5
	ta	%icc,	0x0
	sll	%i4,	0x0D,	%l6
	srlx	%g6,	%o6,	%l0
	fmovda	%icc,	%f7,	%f18
	fmovrse	%i5,	%f25,	%f5
	edge8n	%l3,	%i3,	%g1
	addc	%g4,	%o1,	%g5
	tge	%icc,	0x1
	smulcc	%i7,	%l5,	%l4
	smul	%i0,	%l1,	%o0
	movgu	%icc,	%o2,	%o5
	stbar
	taddcctv	%l2,	0x0135,	%g3
	te	%xcc,	0x1
	tgu	%icc,	0x7
	fbg,a	%fcc3,	loop_1774
	fble,a	%fcc1,	loop_1775
	movge	%xcc,	%g2,	%i1
	fbu	%fcc1,	loop_1776
loop_1774:
	siam	0x1
loop_1775:
	ldsh	[%l7 + 0x5E],	%g7
	sra	%i2,	0x07,	%i6
loop_1776:
	fcmpes	%fcc3,	%f1,	%f25
	sub	%o4,	%o7,	%i4
	movcc	%icc,	%o3,	%g6
	st	%f8,	[%l7 + 0x0C]
	fbuge	%fcc1,	loop_1777
	fbg,a	%fcc3,	loop_1778
	fmovrdgz	%o6,	%f2,	%f18
	movpos	%xcc,	%l0,	%i5
loop_1777:
	mulx	%l6,	%l3,	%i3
loop_1778:
	fnor	%f2,	%f6,	%f8
	srax	%g1,	0x17,	%o1
	fmovscs	%xcc,	%f18,	%f24
	addccc	%g5,	0x17E0,	%g4
	fbule,a	%fcc3,	loop_1779
	fmovsgu	%xcc,	%f29,	%f3
	srlx	%i7,	%l4,	%l5
	alignaddr	%i0,	%o0,	%l1
loop_1779:
	fnands	%f5,	%f2,	%f29
	sdivcc	%o5,	0x1521,	%o2
	movgu	%icc,	%g3,	%l2
	edge8	%g2,	%g7,	%i2
	array32	%i6,	%i1,	%o7
	edge16n	%o4,	%i4,	%o3
	addcc	%o6,	%g6,	%i5
	or	%l6,	%l3,	%i3
	addc	%l0,	0x12A1,	%g1
	sllx	%o1,	%g4,	%i7
	fnot2	%f16,	%f16
	smul	%l4,	0x0BAE,	%l5
	set	0x0A, %i3
	stha	%g5,	[%l7 + %i3] 0x81
	movg	%xcc,	%i0,	%l1
	fmovdneg	%icc,	%f5,	%f18
	addc	%o0,	0x0454,	%o5
	be,a	loop_1780
	sethi	0x0550,	%g3
	edge8	%o2,	%l2,	%g7
	fsrc2	%f4,	%f14
loop_1780:
	array16	%g2,	%i2,	%i6
	fnot2s	%f0,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,a,pn	%xcc,	loop_1781
	umulcc	%o7,	%o4,	%i1
	fmovdcs	%icc,	%f14,	%f18
	sub	%i4,	0x0A46,	%o3
loop_1781:
	movcc	%icc,	%g6,	%i5
	movcs	%xcc,	%l6,	%l3
	fbuge	%fcc3,	loop_1782
	fands	%f24,	%f30,	%f16
	set	0x70, %o2
	sta	%f6,	[%l7 + %o2] 0x89
loop_1782:
	tcs	%xcc,	0x4
	tvs	%xcc,	0x4
	tcc	%icc,	0x1
	popc	%i3,	%l0
	bleu,a	%xcc,	loop_1783
	fcmpeq32	%f4,	%f12,	%o6
	xnor	%o1,	0x1C85,	%g1
	set	0x48, %i2
	lduwa	[%l7 + %i2] 0x88,	%i7
loop_1783:
	fbul,a	%fcc2,	loop_1784
	fnot1	%f8,	%f8
	fmul8x16	%f11,	%f26,	%f4
	flush	%l7 + 0x44
loop_1784:
	stx	%g4,	[%l7 + 0x50]
	ldsb	[%l7 + 0x19],	%l5
	addcc	%l4,	%i0,	%g5
	sllx	%l1,	%o5,	%o0
	ldub	[%l7 + 0x6D],	%o2
	bvs,pn	%icc,	loop_1785
	bshuffle	%f14,	%f10,	%f14
	fbu,a	%fcc0,	loop_1786
	tg	%icc,	0x7
loop_1785:
	fabss	%f15,	%f21
	fmul8x16	%f21,	%f14,	%f24
loop_1786:
	bg,a	%xcc,	loop_1787
	stw	%l2,	[%l7 + 0x14]
	fmovsvs	%xcc,	%f25,	%f11
	fmovdvs	%icc,	%f19,	%f19
loop_1787:
	fbo,a	%fcc0,	loop_1788
	orn	%g7,	%g3,	%g2
	std	%f18,	[%l7 + 0x78]
	tcc	%xcc,	0x0
loop_1788:
	tvs	%icc,	0x1
	fmovsvs	%icc,	%f3,	%f12
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf0
	membar	#Sync
	bg	loop_1789
	edge16	%i2,	%i6,	%o4
	mulscc	%i1,	%o7,	%i4
	sra	%g6,	0x16,	%i5
loop_1789:
	edge16	%o3,	%l3,	%l6
	edge16n	%i3,	%o6,	%o1
	mulx	%l0,	%g1,	%g4
	set	0x28, %l1
	stha	%i7,	[%l7 + %l1] 0x2f
	membar	#Sync
	bvc,a,pn	%xcc,	loop_1790
	tcc	%xcc,	0x6
	mulx	%l5,	%l4,	%g5
	movvc	%icc,	%l1,	%o5
loop_1790:
	andncc	%i0,	%o2,	%l2
	movleu	%icc,	%o0,	%g7
	movgu	%icc,	%g2,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%xcc,	%f21,	%f30
	xorcc	%i6,	%g3,	%i1
	edge8l	%o4,	%i4,	%g6
	fnot1s	%f10,	%f18
	ta	%xcc,	0x2
	fmovda	%icc,	%f20,	%f7
	andcc	%o7,	%i5,	%l3
	brnz	%l6,	loop_1791
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
	fmovdneg	%icc,	%f10,	%f31
	orncc	%o3,	0x129F,	%o6
loop_1791:
	sra	%i3,	0x00,	%o1
loop_1792:
	tpos	%icc,	0x2
	fbg,a	%fcc0,	loop_1793
	fmul8x16al	%f10,	%f7,	%f4
	orncc	%g1,	0x02D9,	%l0
	movrgez	%g4,	0x138,	%l5
loop_1793:
	movgu	%icc,	%l4,	%i7
	popc	0x1E69,	%g5
	sll	%o5,	0x19,	%l1
	smul	%i0,	%o2,	%l2
	tsubcc	%g7,	0x1902,	%o0
	movl	%icc,	%i2,	%g2
	udivcc	%g3,	0x07B0,	%i6
	bcc,a	%xcc,	loop_1794
	fone	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%icc,	%f14,	%f17
loop_1794:
	edge16l	%o4,	%i4,	%i1
	ld	[%l7 + 0x10],	%f30
	nop
	setx loop_1795, %l0, %l1
	jmpl %l1, %g6
	fpadd32	%f0,	%f2,	%f16
	brlez,a	%o7,	loop_1796
	array32	%i5,	%l3,	%o3
loop_1795:
	fmuld8ulx16	%f7,	%f21,	%f30
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%o6,	%i3
loop_1796:
	membar	0x00
	and	%l6,	0x0531,	%o1
	fmovse	%icc,	%f23,	%f29
	fmovsvs	%icc,	%f10,	%f12
	movvs	%icc,	%g1,	%l0
	xnorcc	%g4,	0x144C,	%l5
	wr	%g0,	0x22,	%asi
	stwa	%l4,	[%l7 + 0x6C] %asi
	membar	#Sync
	fbue	%fcc1,	loop_1797
	pdist	%f0,	%f14,	%f14
	edge8	%i7,	%g5,	%l1
	edge32l	%o5,	%i0,	%o2
loop_1797:
	movrlez	%l2,	0x035,	%g7
	taddcctv	%i2,	%o0,	%g2
	movcc	%xcc,	%g3,	%i6
	tneg	%xcc,	0x6
	fpmerge	%f4,	%f6,	%f26
	bvc,pn	%icc,	loop_1798
	edge32ln	%o4,	%i1,	%g6
	fbue,a	%fcc2,	loop_1799
	fandnot1s	%f14,	%f0,	%f15
loop_1798:
	sethi	0x1469,	%o7
	udivcc	%i5,	0x129F,	%l3
loop_1799:
	fmovdle	%icc,	%f3,	%f19
	umulcc	%i4,	%o6,	%o3
	ldsh	[%l7 + 0x60],	%i3
	addc	%o1,	%l6,	%l0
	movcc	%icc,	%g1,	%l5
	addc	%g4,	%l4,	%g5
	brlz,a	%l1,	loop_1800
	orn	%i7,	%i0,	%o2
	edge32	%o5,	%l2,	%g7
	udiv	%o0,	0x03F8,	%g2
loop_1800:
	brlez,a	%i2,	loop_1801
	andncc	%g3,	%i6,	%i1
	movleu	%icc,	%o4,	%g6
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x19,	%f0
loop_1801:
	fandnot1	%f30,	%f28,	%f20
	subccc	%o7,	%i5,	%l3
	sub	%o6,	0x1612,	%o3
	prefetch	[%l7 + 0x70],	 0x3
	bcs,a	loop_1802
	tcc	%icc,	0x0
	fsrc1	%f14,	%f22
	set	0x69, %i1
	lduba	[%l7 + %i1] 0x04,	%i4
loop_1802:
	orn	%i3,	0x1FDD,	%o1
	movrlz	%l6,	0x137,	%l0
	edge8	%g1,	%l5,	%g4
	edge8n	%l4,	%g5,	%i7
	taddcc	%i0,	0x0D18,	%l1
	tpos	%xcc,	0x6
	addccc	%o2,	%o5,	%l2
	tvs	%xcc,	0x2
	movrlez	%o0,	0x34C,	%g2
	fpadd16s	%f10,	%f27,	%f17
	bneg	loop_1803
	fmovrdlz	%i2,	%f8,	%f28
	subcc	%g7,	%g3,	%i6
	brz	%o4,	loop_1804
loop_1803:
	edge32l	%i1,	%o7,	%i5
	bleu,pt	%xcc,	loop_1805
	be,pn	%icc,	loop_1806
loop_1804:
	tcc	%icc,	0x1
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x38] %asi,	%g6
loop_1805:
	taddcc	%o6,	%o3,	%l3
loop_1806:
	movcs	%icc,	%i3,	%i4
	movn	%icc,	%l6,	%o1
	fbo	%fcc0,	loop_1807
	fmovscs	%xcc,	%f1,	%f21
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x68] %asi,	%l0
loop_1807:
	sra	%l5,	%g1,	%g4
	fbu,a	%fcc3,	loop_1808
	bl,a,pn	%xcc,	loop_1809
	fbne,a	%fcc3,	loop_1810
	ldstub	[%l7 + 0x64],	%l4
loop_1808:
	udiv	%g5,	0x1653,	%i7
loop_1809:
	tneg	%icc,	0x3
loop_1810:
	fxor	%f6,	%f8,	%f4
	ldsb	[%l7 + 0x6F],	%l1
	fmul8sux16	%f30,	%f0,	%f10
	ba,pn	%xcc,	loop_1811
	movrgez	%o2,	0x16D,	%o5
	andn	%i0,	0x085D,	%o0
	movneg	%xcc,	%g2,	%l2
loop_1811:
	fbne,a	%fcc1,	loop_1812
	fmovspos	%icc,	%f4,	%f13
	movrgez	%i2,	%g7,	%g3
	udiv	%o4,	0x072F,	%i1
loop_1812:
	movg	%xcc,	%o7,	%i6
	fcmped	%fcc0,	%f12,	%f8
	fand	%f2,	%f16,	%f4
	andcc	%g6,	%i5,	%o6
	set	0x38, %g7
	stxa	%l3,	[%l7 + %g7] 0x23
	membar	#Sync
	edge32	%i3,	%o3,	%i4
	fcmpgt32	%f26,	%f4,	%o1
	edge8	%l0,	%l6,	%l5
	set	0x53, %i0
	ldstuba	[%l7 + %i0] 0x10,	%g1
	addcc	%l4,	%g4,	%i7
	nop
	setx loop_1813, %l0, %l1
	jmpl %l1, %l1
	ldd	[%l7 + 0x10],	%f30
	sdivcc	%g5,	0x0D71,	%o2
	xorcc	%o5,	0x1E46,	%i0
loop_1813:
	movneg	%icc,	%g2,	%o0
	fmovrsne	%l2,	%f18,	%f25
	movvc	%icc,	%i2,	%g3
	fbne	%fcc2,	loop_1814
	sdivx	%g7,	0x0EC7,	%o4
	movcs	%xcc,	%o7,	%i6
	addccc	%i1,	%g6,	%i5
loop_1814:
	movrlz	%l3,	%o6,	%i3
	fbul,a	%fcc1,	loop_1815
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f9,	%f30,	%f21
	sir	0x1273
loop_1815:
	edge8	%o3,	%o1,	%i4
	sdivcc	%l6,	0x0650,	%l5
	sdivx	%l0,	0x06FD,	%l4
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x1e
	membar	#Sync
	fbue	%fcc3,	loop_1816
	sdiv	%g1,	0x1F97,	%g4
	fnot1	%f20,	%f28
	brz,a	%l1,	loop_1817
loop_1816:
	edge32	%i7,	%o2,	%o5
	sdivx	%g5,	0x074F,	%g2
	fmul8ulx16	%f6,	%f28,	%f20
loop_1817:
	bleu	%xcc,	loop_1818
	ldstub	[%l7 + 0x2E],	%i0
	ldx	[%l7 + 0x50],	%o0
	movgu	%xcc,	%l2,	%g3
loop_1818:
	movpos	%icc,	%i2,	%g7
	xnorcc	%o4,	0x19F2,	%o7
	be	loop_1819
	st	%f18,	[%l7 + 0x14]
	edge32ln	%i1,	%i6,	%g6
	wr	%g0,	0x04,	%asi
	stxa	%l3,	[%l7 + 0x30] %asi
loop_1819:
	stbar
	fbge	%fcc2,	loop_1820
	nop
	set	0x34, %o0
	prefetch	[%l7 + %o0],	 0x2
	fxnor	%f20,	%f6,	%f8
	brlez,a	%i5,	loop_1821
loop_1820:
	movle	%icc,	%i3,	%o3
	fxnors	%f11,	%f4,	%f31
	fmuld8sux16	%f0,	%f1,	%f8
loop_1821:
	fmovde	%xcc,	%f20,	%f10
	udiv	%o6,	0x1C13,	%o1
	udivcc	%i4,	0x1D59,	%l6
	bn	%xcc,	loop_1822
	bcc,pt	%icc,	loop_1823
	or	%l0,	0x1641,	%l4
	alignaddrl	%l5,	%g1,	%l1
loop_1822:
	udivcc	%g4,	0x1499,	%i7
loop_1823:
	fmovrse	%o2,	%f4,	%f17
	bge,a	loop_1824
	fmovrdne	%o5,	%f6,	%f22
	ba,a,pn	%xcc,	loop_1825
	movrgez	%g2,	0x37E,	%g5
loop_1824:
	nop
	set	0x38, %o7
	std	%f30,	[%l7 + %o7]
	fandnot1s	%f1,	%f30,	%f10
loop_1825:
	mova	%icc,	%o0,	%l2
	fpadd32s	%f9,	%f30,	%f24
	ba,pn	%icc,	loop_1826
	movleu	%icc,	%i0,	%g3
	movre	%i2,	%o4,	%o7
	movrne	%i1,	%i6,	%g7
loop_1826:
	brnz	%l3,	loop_1827
	movl	%icc,	%i5,	%g6
	udiv	%i3,	0x1C5F,	%o3
	tg	%icc,	0x1
loop_1827:
	edge16n	%o1,	%o6,	%i4
	tge	%icc,	0x1
	brnz,a	%l6,	loop_1828
	xnor	%l4,	%l0,	%l5
	edge8n	%g1,	%l1,	%g4
	taddcc	%o2,	%i7,	%o5
loop_1828:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g5,	%g2,	%l2
	nop
	setx loop_1829, %l0, %l1
	jmpl %l1, %i0
	stx	%g3,	[%l7 + 0x20]
	movpos	%icc,	%o0,	%i2
	movvs	%xcc,	%o7,	%i1
loop_1829:
	flush	%l7 + 0x5C
	udivx	%i6,	0x1A43,	%g7
	set	0x60, %l2
	ldda	[%l7 + %l2] 0xe2,	%o4
	fcmpeq32	%f26,	%f22,	%l3
	bvc	loop_1830
	fmovsvc	%icc,	%f0,	%f22
	taddcc	%g6,	0x1145,	%i5
	bn,pt	%icc,	loop_1831
loop_1830:
	movrlez	%o3,	0x051,	%o1
	fxors	%f24,	%f29,	%f18
	fbuge	%fcc2,	loop_1832
loop_1831:
	or	%o6,	0x0438,	%i4
	stx	%l6,	[%l7 + 0x18]
	sub	%l4,	0x117A,	%l0
loop_1832:
	smulcc	%i3,	%g1,	%l1
	fbl	%fcc1,	loop_1833
	sub	%l5,	0x05E0,	%o2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x18] %asi,	%g4
loop_1833:
	bpos,a	%icc,	loop_1834
	fsrc2	%f20,	%f14
	fnor	%f6,	%f16,	%f8
	fmul8sux16	%f14,	%f22,	%f28
loop_1834:
	umulcc	%i7,	0x14D2,	%o5
	movcs	%xcc,	%g2,	%g5
	tn	%xcc,	0x2
	fmovrdne	%l2,	%f14,	%f28
	ldd	[%l7 + 0x60],	%f30
	sdiv	%i0,	0x11B7,	%g3
	set	0x48, %o1
	prefetcha	[%l7 + %o1] 0x88,	 0x3
	xorcc	%i2,	0x0B3D,	%i1
	brlez	%i6,	loop_1835
	fabsd	%f22,	%f18
	fbe	%fcc0,	loop_1836
	edge16n	%o7,	%g7,	%l3
loop_1835:
	xnorcc	%g6,	%o4,	%i5
	bpos,a,pt	%icc,	loop_1837
loop_1836:
	srlx	%o1,	0x0E,	%o6
	fmovrdgz	%i4,	%f22,	%f0
	flush	%l7 + 0x68
loop_1837:
	fnot2	%f10,	%f2
	fxnors	%f30,	%f7,	%f20
	nop
	setx	loop_1838,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8l	%o3,	%l4,	%l6
	fbuge	%fcc2,	loop_1839
	tleu	%xcc,	0x5
loop_1838:
	edge16l	%l0,	%i3,	%l1
	tge	%xcc,	0x1
loop_1839:
	prefetch	[%l7 + 0x68],	 0x1
	edge32n	%g1,	%l5,	%o2
	fmovsge	%xcc,	%f7,	%f14
	tg	%xcc,	0x3
	tsubcctv	%i7,	0x16FD,	%g4
	tvc	%xcc,	0x1
	fmovsle	%xcc,	%f15,	%f14
	fbug	%fcc2,	loop_1840
	fornot2s	%f12,	%f27,	%f26
	fnot2	%f22,	%f16
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x68] %asi,	%g2
loop_1840:
	edge8ln	%g5,	%l2,	%i0
	orncc	%o5,	0x14CC,	%o0
	sth	%g3,	[%l7 + 0x20]
	movvc	%icc,	%i1,	%i2
	movre	%i6,	%g7,	%o7
	srl	%l3,	0x19,	%g6
	edge16l	%o4,	%o1,	%o6
	fsrc1s	%f5,	%f4
	alignaddrl	%i5,	%i4,	%l4
	sir	0x1EB4
	sra	%l6,	%o3,	%l0
	orn	%l1,	%g1,	%i3
	fmovrsgz	%o2,	%f6,	%f16
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf8,	%f0
	movneg	%xcc,	%l5,	%g4
	fbu,a	%fcc3,	loop_1841
	movl	%icc,	%i7,	%g2
	sdivcc	%l2,	0x08CA,	%g5
	orcc	%i0,	0x1A07,	%o5
loop_1841:
	smul	%g3,	0x016C,	%o0
	andcc	%i1,	%i2,	%g7
	fbo	%fcc0,	loop_1842
	sth	%i6,	[%l7 + 0x10]
	xnorcc	%l3,	0x077A,	%o7
	fnegd	%f10,	%f14
loop_1842:
	smulcc	%o4,	0x0590,	%o1
	or	%o6,	0x18DE,	%i5
	addcc	%i4,	0x0085,	%l4
	orcc	%g6,	%l6,	%o3
	subccc	%l1,	%g1,	%i3
	orcc	%l0,	0x0CFF,	%l5
	edge8l	%g4,	%i7,	%g2
	xorcc	%l2,	0x092B,	%g5
	udiv	%o2,	0x1A51,	%i0
	set	0x64, %l4
	swapa	[%l7 + %l4] 0x88,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g3,	%o0,	%i1
	std	%f8,	[%l7 + 0x48]
	fbug	%fcc3,	loop_1843
	tvs	%icc,	0x3
	umul	%i2,	0x16C1,	%i6
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x2A] %asi,	%g7
loop_1843:
	movrgez	%o7,	0x200,	%o4
	fbn	%fcc1,	loop_1844
	orncc	%o1,	%l3,	%i5
	fmovrsgz	%i4,	%f7,	%f11
	andn	%l4,	%o6,	%l6
loop_1844:
	fmovrdgez	%g6,	%f4,	%f26
	xnorcc	%o3,	%g1,	%i3
	edge8l	%l0,	%l5,	%l1
	fpadd16	%f26,	%f2,	%f26
	edge32	%i7,	%g2,	%g4
	fmovrslz	%g5,	%f28,	%f14
	edge16	%l2,	%o2,	%o5
	tpos	%xcc,	0x7
	movcc	%xcc,	%g3,	%o0
	srax	%i0,	0x18,	%i1
	array32	%i6,	%i2,	%o7
	umul	%g7,	%o1,	%o4
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovsvc	%icc,	%f22,	%f13
	bgu	loop_1845
	tneg	%icc,	0x1
	udiv	%i5,	0x1889,	%i4
	fpadd32s	%f1,	%f5,	%f21
loop_1845:
	fxnors	%f0,	%f21,	%f5
	edge16ln	%l4,	%o6,	%l6
	fnot2s	%f4,	%f6
	xor	%l3,	0x0F68,	%o3
	stb	%g6,	[%l7 + 0x49]
	fnegs	%f29,	%f4
	set	0x24, %o5
	ldswa	[%l7 + %o5] 0x88,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l0,	0x1571,	%i3
	move	%xcc,	%l5,	%i7
	udivx	%g2,	0x0DF2,	%g4
	fnands	%f29,	%f20,	%f21
	udivcc	%g5,	0x123E,	%l1
	fbe,a	%fcc2,	loop_1846
	andcc	%l2,	0x0DAA,	%o2
	bcs,a,pt	%xcc,	loop_1847
	udivx	%o5,	0x0041,	%o0
loop_1846:
	mulx	%i0,	0x0E59,	%g3
	sir	0x0016
loop_1847:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i1,	%i2
	fmul8x16al	%f31,	%f13,	%f30
	movcc	%icc,	%o7,	%i6
	tvc	%xcc,	0x2
	fbul,a	%fcc0,	loop_1848
	andn	%o1,	%g7,	%o4
	st	%f2,	[%l7 + 0x68]
	edge8l	%i4,	%l4,	%o6
loop_1848:
	umulcc	%i5,	%l6,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xea,	%l2
	movcc	%xcc,	%g1,	%g6
	xnorcc	%l0,	%l5,	%i7
	movvc	%xcc,	%g2,	%g4
	ta	%icc,	0x6
	movleu	%icc,	%g5,	%i3
	umulcc	%l1,	0x18AC,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o5,	%o0,	%o2
	fones	%f24
	movre	%i0,	%i1,	%g3
	ldub	[%l7 + 0x0D],	%o7
	edge32n	%i6,	%o1,	%i2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x38] %asi,	%o4
	fornot1s	%f1,	%f22,	%f3
	bcs,a	loop_1849
	edge8ln	%g7,	%l4,	%o6
	tgu	%xcc,	0x3
	fmovdleu	%icc,	%f3,	%f4
loop_1849:
	srax	%i4,	0x0F,	%i5
	movrlz	%l6,	%l3,	%o3
	edge8n	%g1,	%l0,	%g6
	fpadd16s	%f15,	%f19,	%f26
	movg	%xcc,	%l5,	%i7
	taddcctv	%g4,	%g2,	%i3
	edge16ln	%g5,	%l2,	%o5
	subcc	%o0,	0x1C97,	%o2
	fmovrse	%i0,	%f0,	%f2
	movge	%xcc,	%l1,	%i1
	nop
	setx	loop_1850,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%g3,	0x0CAB,	%i6
	tleu	%xcc,	0x6
	and	%o1,	%i2,	%o7
loop_1850:
	movpos	%xcc,	%g7,	%l4
	tcc	%icc,	0x6
	xnor	%o4,	0x11FD,	%o6
	ldstub	[%l7 + 0x16],	%i4
	bvs,a	%icc,	loop_1851
	sra	%l6,	%i5,	%o3
	membar	0x21
	edge8	%l3,	%l0,	%g1
loop_1851:
	fcmps	%fcc3,	%f3,	%f27
	edge16n	%g6,	%i7,	%l5
	set	0x28, %i5
	ldxa	[%g0 + %i5] 0x20,	%g4
	te	%icc,	0x7
	fmuld8sux16	%f19,	%f14,	%f26
	tn	%icc,	0x0
	movg	%icc,	%i3,	%g2
	edge16l	%l2,	%o5,	%o0
	fmovrdne	%g5,	%f30,	%f4
	sll	%o2,	%l1,	%i1
	sir	0x1C25
	movcc	%icc,	%i0,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x70],	%f26
	addccc	%o1,	0x0DB1,	%i2
	fbue,a	%fcc3,	loop_1852
	tcc	%xcc,	0x7
	edge16n	%i6,	%o7,	%l4
	orcc	%g7,	%o6,	%o4
loop_1852:
	sethi	0x0396,	%i4
	bvc,a,pn	%xcc,	loop_1853
	fandnot2	%f18,	%f30,	%f14
	wr	%g0,	0x19,	%asi
	stwa	%i5,	[%l7 + 0x44] %asi
loop_1853:
	fmovsge	%xcc,	%f15,	%f12
	fmovrsgz	%l6,	%f16,	%f29
	std	%f10,	[%l7 + 0x08]
	fabss	%f31,	%f29
	fmul8ulx16	%f18,	%f12,	%f0
	fbl,a	%fcc1,	loop_1854
	stw	%o3,	[%l7 + 0x54]
	orn	%l3,	0x1FBB,	%l0
	move	%icc,	%g6,	%i7
loop_1854:
	bvc	loop_1855
	sdivx	%l5,	0x03A5,	%g1
	for	%f28,	%f28,	%f14
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x18] %asi,	%i3
loop_1855:
	movle	%icc,	%g2,	%l2
	bg,a,pt	%icc,	loop_1856
	andn	%g4,	%o0,	%o5
	tn	%xcc,	0x5
	or	%o2,	%g5,	%i1
loop_1856:
	bvc	loop_1857
	fblg,a	%fcc3,	loop_1858
	movrne	%l1,	%g3,	%o1
	umul	%i2,	%i6,	%o7
loop_1857:
	mulscc	%i0,	%g7,	%o6
loop_1858:
	taddcc	%l4,	%i4,	%o4
	movpos	%icc,	%l6,	%o3
	subcc	%i5,	%l3,	%l0
	fmovrde	%i7,	%f24,	%f30
	membar	0x07
	ble,a	loop_1859
	ldsw	[%l7 + 0x4C],	%g6
	set	0x14, %o3
	ldswa	[%l7 + %o3] 0x80,	%l5
loop_1859:
	bn,a,pn	%xcc,	loop_1860
	bshuffle	%f26,	%f10,	%f30
	orcc	%g1,	%i3,	%l2
	edge32ln	%g4,	%g2,	%o5
loop_1860:
	nop
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movvs	%icc,	%o0,	%g5
	tne	%xcc,	0x7
	wr	%g0,	0x22,	%asi
	stda	%o2,	[%l7 + 0x18] %asi
	membar	#Sync
	taddcctv	%l1,	0x0A34,	%g3
	membar	0x7C
	set	0x3C, %l0
	sta	%f7,	[%l7 + %l0] 0x11
	fmovd	%f4,	%f24
	fzero	%f30
	add	%o1,	0x0A47,	%i2
	fbul	%fcc2,	loop_1861
	call	loop_1862
	umul	%i1,	%o7,	%i6
	smul	%g7,	0x119A,	%i0
loop_1861:
	tneg	%icc,	0x2
loop_1862:
	sdivx	%l4,	0x0EBC,	%i4
	fmovspos	%xcc,	%f20,	%f5
	movneg	%xcc,	%o4,	%l6
	fcmpgt32	%f16,	%f10,	%o3
	te	%icc,	0x7
	xor	%i5,	0x15B6,	%o6
	movle	%icc,	%l3,	%i7
	umulcc	%l0,	0x0E92,	%g6
	siam	0x0
	fnegd	%f14,	%f22
	prefetch	[%l7 + 0x78],	 0x3
	fbu	%fcc2,	loop_1863
	udivcc	%g1,	0x099A,	%i3
	udivx	%l2,	0x1BFA,	%g4
	movcs	%icc,	%g2,	%o5
loop_1863:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x2
	fmovrdgez	%l5,	%f2,	%f26
	xorcc	%o0,	0x11CC,	%g5
	tsubcc	%o2,	%g3,	%l1
	movrlz	%i2,	0x00D,	%i1
	fmul8ulx16	%f4,	%f10,	%f4
	umul	%o7,	0x089E,	%o1
	set	0x58, %g4
	ldxa	[%l7 + %g4] 0x89,	%g7
	tvc	%xcc,	0x4
	andcc	%i0,	%i6,	%l4
	movg	%xcc,	%i4,	%o4
	andncc	%l6,	%o3,	%i5
	taddcctv	%l3,	0x1448,	%o6
	tg	%xcc,	0x0
	fpack32	%f2,	%f28,	%f22
	taddcc	%i7,	0x07B3,	%l0
	fmovde	%xcc,	%f22,	%f4
	sra	%g6,	%g1,	%l2
	tpos	%xcc,	0x6
	edge8l	%g4,	%g2,	%i3
	fmovsl	%xcc,	%f2,	%f10
	tneg	%xcc,	0x1
	tgu	%icc,	0x3
	stbar
	fmovsl	%xcc,	%f12,	%f3
	mova	%xcc,	%o5,	%l5
	tn	%xcc,	0x0
	fmovdvc	%icc,	%f14,	%f11
	mulx	%o0,	%g5,	%o2
	tl	%xcc,	0x4
	bcc	loop_1864
	sdivcc	%g3,	0x0D7E,	%l1
	ldsb	[%l7 + 0x41],	%i1
	fmovd	%f26,	%f28
loop_1864:
	andcc	%i2,	%o7,	%o1
	subcc	%i0,	0x0F8F,	%i6
	fmovdl	%xcc,	%f13,	%f11
	movrne	%l4,	0x3FE,	%g7
	tcc	%xcc,	0x7
	movle	%xcc,	%i4,	%o4
	tgu	%xcc,	0x1
	fpsub16	%f22,	%f18,	%f10
	andncc	%l6,	%i5,	%l3
	bg	loop_1865
	fcmped	%fcc0,	%f10,	%f16
	edge8ln	%o6,	%i7,	%o3
	fmovsvc	%xcc,	%f30,	%f26
loop_1865:
	edge8n	%g6,	%g1,	%l0
	tge	%xcc,	0x3
	brz,a	%g4,	loop_1866
	or	%g2,	0x0874,	%l2
	mova	%xcc,	%o5,	%i3
	stbar
loop_1866:
	movre	%o0,	%l5,	%o2
	call	loop_1867
	umul	%g3,	0x0BF5,	%l1
	fnors	%f24,	%f8,	%f26
	fble	%fcc3,	loop_1868
loop_1867:
	nop
	set	0x38, %i6
	stx	%i1,	[%l7 + %i6]
	fpadd16s	%f13,	%f27,	%f11
	fmovd	%f20,	%f14
loop_1868:
	membar	0x50
	tpos	%xcc,	0x4
	fmul8x16au	%f9,	%f19,	%f30
	tg	%xcc,	0x4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x19,	%g5,	%i2
	array8	%o1,	%o7,	%i0
	movvs	%icc,	%l4,	%i6
	orncc	%i4,	%o4,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%xcc,	0x3
	movrgez	%i5,	0x239,	%l6
	fmovrdlez	%l3,	%f20,	%f20
	fsrc2s	%f20,	%f17
	ldd	[%l7 + 0x58],	%i6
	sra	%o6,	0x17,	%o3
	fmovrdgez	%g1,	%f0,	%f6
	nop
	setx	loop_1869,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpadd32	%f8,	%f20,	%f4
	ldd	[%l7 + 0x18],	%g6
	edge16n	%g4,	%g2,	%l0
loop_1869:
	tl	%xcc,	0x3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%o5
	edge8	%o0,	%i3,	%l5
	fnegs	%f28,	%f30
	sra	%o2,	0x16,	%g3
	fand	%f28,	%f18,	%f30
	umul	%l1,	%i1,	%g5
	bne,a,pt	%xcc,	loop_1870
	st	%f6,	[%l7 + 0x70]
	alignaddrl	%i2,	%o1,	%i0
	tneg	%icc,	0x4
loop_1870:
	edge8	%l4,	%i6,	%i4
	srax	%o7,	0x0C,	%g7
	taddcctv	%o4,	%i5,	%l3
	set	0x2B, %g2
	ldstuba	[%l7 + %g2] 0x10,	%l6
	fmovsg	%icc,	%f16,	%f7
	fbne	%fcc2,	loop_1871
	tcs	%xcc,	0x1
	or	%i7,	0x02F2,	%o6
	addc	%o3,	0x0786,	%g6
loop_1871:
	fcmpne16	%f20,	%f8,	%g4
	brz,a	%g2,	loop_1872
	fpmerge	%f28,	%f13,	%f10
	sllx	%g1,	0x1B,	%l2
	fmovrdgez	%l0,	%f18,	%f20
loop_1872:
	tcs	%xcc,	0x0
	fmovsa	%icc,	%f31,	%f18
	ldd	[%l7 + 0x20],	%f26
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x0c,	%o0,	%o5
	udivx	%l5,	0x16FF,	%i3
	fpack32	%f14,	%f22,	%f2
	bn,pt	%icc,	loop_1873
	bg,a,pt	%icc,	loop_1874
	tvs	%xcc,	0x4
	fmovda	%icc,	%f7,	%f20
loop_1873:
	mulscc	%o2,	0x1FC6,	%g3
loop_1874:
	fbule,a	%fcc3,	loop_1875
	array8	%i1,	%l1,	%i2
	membar	0x2E
	fmovdn	%icc,	%f17,	%f23
loop_1875:
	te	%icc,	0x6
	fsrc2	%f0,	%f20
	movrlz	%o1,	%g5,	%i0
	movcc	%icc,	%i6,	%l4
	bcc,pn	%xcc,	loop_1876
	movrgez	%o7,	0x0E1,	%i4
	bpos	loop_1877
	fcmpne16	%f4,	%f22,	%o4
loop_1876:
	sth	%g7,	[%l7 + 0x20]
	fmovdge	%xcc,	%f3,	%f17
loop_1877:
	fmovsleu	%icc,	%f23,	%f30
	fpadd32	%f18,	%f10,	%f18
	fbuge,a	%fcc0,	loop_1878
	taddcctv	%i5,	%l3,	%l6
	fmovdge	%xcc,	%f31,	%f8
	mulscc	%o6,	%o3,	%g6
loop_1878:
	bneg,pt	%icc,	loop_1879
	udivx	%g4,	0x0C8F,	%g2
	fpadd16	%f20,	%f20,	%f10
	fbo	%fcc1,	loop_1880
loop_1879:
	tgu	%xcc,	0x5
	or	%i7,	%g1,	%l0
	edge16	%l2,	%o0,	%o5
loop_1880:
	nop
	set	0x08, %l6
	sta	%f10,	[%l7 + %l6] 0x88
	lduw	[%l7 + 0x5C],	%l5
	fmovrslz	%o2,	%f30,	%f25
	mova	%icc,	%g3,	%i1
	tneg	%icc,	0x2
	xorcc	%i3,	0x13E5,	%l1
	set	0x18, %i4
	swapa	[%l7 + %i4] 0x0c,	%o1
	sdivcc	%g5,	0x0DEC,	%i2
	fbuge	%fcc1,	loop_1881
	sdiv	%i6,	0x0EE1,	%i0
	fbne,a	%fcc0,	loop_1882
	edge32l	%l4,	%i4,	%o4
loop_1881:
	orcc	%o7,	0x0694,	%g7
	fpadd32	%f18,	%f4,	%f4
loop_1882:
	add	%i5,	0x0085,	%l6
	umulcc	%l3,	0x1509,	%o6
	srax	%g6,	%g4,	%o3
	smulcc	%i7,	%g1,	%g2
	edge16ln	%l0,	%o0,	%o5
	edge32ln	%l2,	%l5,	%g3
	set	0x0A, %g5
	ldsha	[%l7 + %g5] 0x0c,	%i1
	array8	%o2,	%i3,	%o1
	edge16l	%g5,	%i2,	%l1
	fbe,a	%fcc3,	loop_1883
	sub	%i6,	%i0,	%i4
	or	%o4,	%l4,	%o7
	edge32n	%i5,	%g7,	%l3
loop_1883:
	tleu	%xcc,	0x3
	add	%l6,	0x1D18,	%g6
	fsrc2	%f28,	%f14
	fmovda	%icc,	%f8,	%f16
	sethi	0x06A0,	%g4
	ldx	[%l7 + 0x30],	%o3
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x17,	%f0
	set	0x68, %o6
	stxa	%i7,	[%l7 + %o6] 0x80
	set	0x4D, %i3
	ldstuba	[%l7 + %i3] 0x88,	%o6
	prefetch	[%l7 + 0x1C],	 0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g1,	0x00E8,	%g2
	wr	%g0,	0x04,	%asi
	stha	%l0,	[%l7 + 0x24] %asi
	fbn,a	%fcc1,	loop_1884
	tle	%xcc,	0x3
	fmovscs	%xcc,	%f3,	%f12
	fmovrdgez	%o5,	%f16,	%f28
loop_1884:
	movrne	%l2,	0x304,	%o0
	fsrc1s	%f30,	%f5
	fbue	%fcc2,	loop_1885
	fpsub16s	%f23,	%f15,	%f19
	movcs	%icc,	%g3,	%i1
	umul	%l5,	%o2,	%i3
loop_1885:
	tcs	%icc,	0x5
	bl,a,pt	%icc,	loop_1886
	stb	%o1,	[%l7 + 0x5A]
	fblg	%fcc0,	loop_1887
	bpos,pn	%icc,	loop_1888
loop_1886:
	and	%g5,	0x0A10,	%l1
	ldd	[%l7 + 0x08],	%i2
loop_1887:
	orcc	%i0,	%i6,	%o4
loop_1888:
	edge32l	%l4,	%i4,	%i5
	array8	%o7,	%l3,	%l6
	udivcc	%g6,	0x0E23,	%g7
	edge8n	%o3,	%i7,	%g4
	fmovspos	%icc,	%f0,	%f14
	fbne,a	%fcc1,	loop_1889
	fnor	%f6,	%f18,	%f12
	movrgez	%g1,	0x33F,	%g2
	sdivcc	%l0,	0x1852,	%o6
loop_1889:
	mulx	%o5,	0x0B73,	%o0
	edge32ln	%g3,	%i1,	%l2
	fmul8x16al	%f7,	%f27,	%f20
	movgu	%icc,	%l5,	%o2
	sub	%i3,	%o1,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i2,	0x1C97,	%i0
	movl	%icc,	%i6,	%o4
	movpos	%icc,	%l1,	%l4
	fnor	%f10,	%f30,	%f0
	set	0x54, %o2
	lda	[%l7 + %o2] 0x14,	%f0
	taddcctv	%i4,	0x0B4F,	%o7
	fzero	%f18
	fcmped	%fcc3,	%f20,	%f18
	orn	%l3,	%l6,	%i5
	fmovdvs	%xcc,	%f1,	%f30
	tge	%xcc,	0x0
	movl	%icc,	%g6,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%i7,	%g4
	brnz	%g1,	loop_1890
	fbul	%fcc3,	loop_1891
	fbg,a	%fcc1,	loop_1892
	fmul8sux16	%f6,	%f6,	%f10
loop_1890:
	andn	%g2,	0x0D0C,	%o3
loop_1891:
	tsubcctv	%l0,	%o5,	%o0
loop_1892:
	umulcc	%o6,	%g3,	%l2
	smulcc	%l5,	0x0C91,	%i1
	tgu	%icc,	0x3
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x11
	movre	%o2,	0x0D9,	%o1
	fmovrdlz	%g5,	%f4,	%f2
	sdivx	%i2,	0x1935,	%i3
	tg	%icc,	0x1
	fmovdneg	%xcc,	%f10,	%f18
	fmovdl	%xcc,	%f29,	%f26
	fandnot1	%f4,	%f30,	%f26
	srlx	%i0,	%o4,	%i6
	srl	%l1,	%i4,	%l4
	edge32l	%l3,	%o7,	%i5
	udivx	%g6,	0x19D1,	%g7
	movrne	%i7,	0x2F1,	%l6
	wr	%g0,	0x04,	%asi
	stha	%g4,	[%l7 + 0x12] %asi
	set	0x5C, %o4
	stba	%g2,	[%l7 + %o4] 0x80
	edge8n	%o3,	%l0,	%g1
	xorcc	%o0,	0x1F59,	%o5
	tgu	%icc,	0x7
	ldsh	[%l7 + 0x50],	%g3
	fbl	%fcc1,	loop_1893
	fcmped	%fcc3,	%f28,	%f14
	fbule,a	%fcc0,	loop_1894
	andncc	%o6,	%l5,	%l2
loop_1893:
	ble,pt	%xcc,	loop_1895
	movrlez	%i1,	%o1,	%g5
loop_1894:
	xnorcc	%o2,	0x0684,	%i2
	movpos	%icc,	%i0,	%o4
loop_1895:
	edge16ln	%i3,	%i6,	%l1
	fmovsa	%icc,	%f31,	%f10
	andcc	%i4,	0x152A,	%l4
	bge,a	loop_1896
	movneg	%icc,	%l3,	%i5
	tneg	%icc,	0x1
	prefetch	[%l7 + 0x78],	 0x1
loop_1896:
	smulcc	%o7,	%g7,	%g6
	set	0x60, %l1
	ldda	[%l7 + %l1] 0xea,	%i6
	umul	%i7,	0x08E6,	%g2
	tneg	%xcc,	0x4
	bgu,a,pn	%icc,	loop_1897
	fmovdcs	%icc,	%f8,	%f21
	faligndata	%f6,	%f28,	%f26
	subcc	%g4,	0x12A1,	%l0
loop_1897:
	udivx	%g1,	0x048E,	%o0
	bgu,a	%xcc,	loop_1898
	fmuld8ulx16	%f21,	%f17,	%f0
	fornot2s	%f24,	%f13,	%f11
	movrlez	%o5,	%o3,	%g3
loop_1898:
	fsrc2s	%f20,	%f26
	movleu	%icc,	%l5,	%l2
	bne,a,pn	%xcc,	loop_1899
	ba,a,pt	%xcc,	loop_1900
	sethi	0x1DE1,	%i1
	stx	%o6,	[%l7 + 0x38]
loop_1899:
	fmovspos	%icc,	%f3,	%f16
loop_1900:
	membar	0x79
	edge8	%g5,	%o1,	%o2
	fmovdn	%xcc,	%f2,	%f29
	sra	%i2,	0x0E,	%i0
	fmovda	%xcc,	%f14,	%f30
	fnot1	%f18,	%f22
	fmovsvc	%icc,	%f11,	%f3
	fcmple16	%f28,	%f12,	%o4
	alignaddrl	%i6,	%i3,	%l1
	tle	%icc,	0x4
	array8	%l4,	%l3,	%i5
	movvs	%icc,	%i4,	%o7
	set	0x63, %g1
	ldsba	[%l7 + %g1] 0x88,	%g6
	tvs	%xcc,	0x2
	orcc	%g7,	0x0C41,	%l6
	movre	%g2,	%g4,	%i7
	bpos,pn	%xcc,	loop_1901
	movpos	%icc,	%g1,	%l0
	edge16ln	%o5,	%o3,	%g3
	tcc	%icc,	0x4
loop_1901:
	movrlz	%l5,	0x312,	%l2
	movleu	%xcc,	%o0,	%o6
	bpos,a	%xcc,	loop_1902
	bpos,a	loop_1903
	tpos	%icc,	0x3
	fcmpgt32	%f26,	%f4,	%i1
loop_1902:
	fones	%f3
loop_1903:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o1,	%o2,	%g5
	flush	%l7 + 0x34
	movn	%icc,	%i2,	%o4
	addc	%i0,	%i6,	%i3
	fbug,a	%fcc3,	loop_1904
	or	%l1,	0x00A1,	%l4
	fmovsne	%xcc,	%f28,	%f24
	tsubcctv	%i5,	0x18AF,	%l3
loop_1904:
	movrne	%o7,	%i4,	%g6
	fmovspos	%xcc,	%f2,	%f2
	fsrc1s	%f29,	%f7
	tl	%icc,	0x6
	movrne	%l6,	%g2,	%g4
	movn	%icc,	%i7,	%g7
	set	0x34, %i1
	lda	[%l7 + %i1] 0x15,	%f4
	udiv	%l0,	0x1535,	%g1
	smulcc	%o5,	0x001D,	%g3
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x70] %asi,	%o3
	fcmple16	%f0,	%f6,	%l5
	fands	%f22,	%f14,	%f13
	orncc	%l2,	%o6,	%o0
	sll	%i1,	0x09,	%o2
	edge32n	%o1,	%i2,	%g5
	tg	%icc,	0x6
	tvc	%icc,	0x7
	set	0x12, %g3
	ldsha	[%l7 + %g3] 0x81,	%i0
	fors	%f5,	%f0,	%f30
	fcmpne32	%f20,	%f16,	%o4
	set	0x1C, %i0
	swapa	[%l7 + %i0] 0x0c,	%i6
	movne	%icc,	%l1,	%l4
	pdist	%f10,	%f10,	%f0
	fbu	%fcc0,	loop_1905
	movrlz	%i3,	%l3,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x48
loop_1905:
	xnorcc	%i5,	%i4,	%l6
	fmovdge	%xcc,	%f16,	%f0
	addccc	%g2,	%g6,	%g4
	siam	0x0
	smulcc	%i7,	0x057B,	%l0
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x24] %asi,	%g7
	fmovsa	%icc,	%f7,	%f31
	movn	%xcc,	%o5,	%g1
	addccc	%o3,	%g3,	%l2
	movle	%icc,	%l5,	%o0
	add	%o6,	%o2,	%i1
	add	%i2,	%g5,	%o1
	edge32n	%i0,	%o4,	%l1
	array32	%i6,	%i3,	%l3
	tvs	%xcc,	0x1
	mulx	%o7,	0x174A,	%i5
	set	0x28, %g6
	prefetcha	[%l7 + %g6] 0x15,	 0x3
	array16	%l4,	%l6,	%g6
	subcc	%g2,	%i7,	%l0
	movrlez	%g4,	0x16B,	%g7
	orcc	%g1,	0x1515,	%o3
	tg	%xcc,	0x1
	tsubcc	%g3,	%o5,	%l2
	fpmerge	%f15,	%f21,	%f16
	movvs	%icc,	%l5,	%o6
	tpos	%icc,	0x3
	pdist	%f10,	%f22,	%f6
	fbug	%fcc3,	loop_1906
	taddcctv	%o0,	0x18BF,	%o2
	fabss	%f4,	%f20
	wr	%g0,	0x0c,	%asi
	stba	%i2,	[%l7 + 0x2D] %asi
loop_1906:
	subcc	%i1,	%g5,	%i0
	bg,a,pt	%xcc,	loop_1907
	prefetch	[%l7 + 0x3C],	 0x3
	te	%icc,	0x0
	sdiv	%o4,	0x150F,	%l1
loop_1907:
	nop
	set	0x10, %o0
	ldxa	[%g0 + %o0] 0x4f,	%o1
	fnot2	%f28,	%f10
	tpos	%xcc,	0x3
	std	%f6,	[%l7 + 0x58]
	nop
	set	0x08, %g7
	stw	%i3,	[%l7 + %g7]
	bg	loop_1908
	ld	[%l7 + 0x18],	%f24
	ta	%icc,	0x2
	smulcc	%i6,	%l3,	%i5
loop_1908:
	sethi	0x07E2,	%i4
	sethi	0x1D41,	%o7
	fnegs	%f29,	%f17
	movge	%icc,	%l4,	%g6
	alignaddrl	%l6,	%g2,	%i7
	fmovrdlz	%g4,	%f10,	%f8
	fmovrde	%g7,	%f4,	%f2
	tl	%xcc,	0x4
	fbl,a	%fcc0,	loop_1909
	and	%l0,	0x0533,	%g1
	nop
	set	0x2C, %o7
	ldsb	[%l7 + %o7],	%o3
	xorcc	%o5,	0x0242,	%g3
loop_1909:
	bg	loop_1910
	movneg	%icc,	%l5,	%l2
	edge16ln	%o0,	%o2,	%i2
	set	0x60, %l2
	prefetcha	[%l7 + %l2] 0x04,	 0x3
loop_1910:
	fxor	%f2,	%f8,	%f26
	set	0x54, %o1
	stha	%g5,	[%l7 + %o1] 0x23
	membar	#Sync
	movrlez	%o6,	%o4,	%l1
	st	%f5,	[%l7 + 0x54]
	fmovsle	%icc,	%f28,	%f23
	subccc	%i0,	0x117F,	%i3
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%o1
	fbge	%fcc0,	loop_1911
	tpos	%icc,	0x5
	fmovdvc	%icc,	%f1,	%f21
	fpadd32	%f12,	%f26,	%f0
loop_1911:
	fmovdcc	%xcc,	%f6,	%f17
	movneg	%icc,	%l3,	%i6
	fmovdn	%xcc,	%f18,	%f7
	membar	0x46
	stx	%i5,	[%l7 + 0x08]
	srax	%o7,	0x13,	%l4
	movrne	%g6,	%l6,	%g2
	smulcc	%i7,	0x010F,	%g4
	call	loop_1912
	fmovdvc	%xcc,	%f11,	%f3
	fpsub16	%f30,	%f2,	%f20
	fpackfix	%f22,	%f15
loop_1912:
	fmovdl	%xcc,	%f20,	%f23
	fcmpeq16	%f8,	%f10,	%g7
	bne	%icc,	loop_1913
	movrlz	%l0,	%i4,	%o3
	fbo,a	%fcc3,	loop_1914
	fmovsg	%xcc,	%f12,	%f31
loop_1913:
	tvs	%xcc,	0x3
	tg	%xcc,	0x1
loop_1914:
	addccc	%g1,	0x0FDF,	%g3
	fblg	%fcc1,	loop_1915
	tle	%icc,	0x3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] %asi,	%l5,	%l2
loop_1915:
	prefetch	[%l7 + 0x48],	 0x0
	fsrc2	%f16,	%f14
	fbule,a	%fcc0,	loop_1916
	andcc	%o0,	0x0F4D,	%o5
	fzero	%f24
	ble,a,pn	%icc,	loop_1917
loop_1916:
	bvc,a	%icc,	loop_1918
	tvs	%xcc,	0x3
	tne	%icc,	0x2
loop_1917:
	fbuge,a	%fcc0,	loop_1919
loop_1918:
	te	%xcc,	0x0
	tneg	%xcc,	0x7
	udiv	%i2,	0x1B53,	%i1
loop_1919:
	std	%f6,	[%l7 + 0x28]
	bcs	%icc,	loop_1920
	bl,pn	%icc,	loop_1921
	fmovdg	%icc,	%f31,	%f16
	fmovdvc	%xcc,	%f12,	%f10
loop_1920:
	edge8n	%o2,	%o6,	%o4
loop_1921:
	fmul8ulx16	%f22,	%f16,	%f8
	fpadd32	%f10,	%f10,	%f0
	prefetch	[%l7 + 0x24],	 0x3
	brgez,a	%g5,	loop_1922
	fpsub32	%f6,	%f4,	%f26
	edge8ln	%i0,	%i3,	%l1
	subccc	%o1,	0x0F2C,	%l3
loop_1922:
	mulx	%i5,	0x0968,	%o7
	movcc	%xcc,	%l4,	%g6
	movg	%xcc,	%l6,	%g2
	nop
	set	0x10, %l5
	std	%f16,	[%l7 + %l5]
	fmovrdlz	%i6,	%f4,	%f6
	movvs	%icc,	%g4,	%i7
	popc	%l0,	%g7
	tsubcctv	%i4,	0x1E24,	%g1
	smulcc	%g3,	0x06A6,	%l5
	mova	%icc,	%o3,	%l2
	edge8n	%o0,	%i2,	%i1
	fpack16	%f12,	%f23
	popc	%o5,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f14,	%f20
	ldsh	[%l7 + 0x26],	%o4
	nop
	setx loop_1923, %l0, %l1
	jmpl %l1, %g5
	fsrc2	%f20,	%f22
	taddcctv	%i0,	%o2,	%l1
	wr	%g0,	0x19,	%asi
	stxa	%o1,	[%l7 + 0x58] %asi
loop_1923:
	sllx	%i3,	%i5,	%o7
	fbe	%fcc3,	loop_1924
	fmovrse	%l4,	%f4,	%f30
	edge32n	%l3,	%g6,	%l6
	tcs	%icc,	0x0
loop_1924:
	bleu,a	loop_1925
	edge16l	%i6,	%g4,	%i7
	fsrc1s	%f28,	%f27
	edge16	%g2,	%g7,	%i4
loop_1925:
	pdist	%f12,	%f30,	%f8
	fbn,a	%fcc1,	loop_1926
	fmovsn	%xcc,	%f29,	%f17
	edge32l	%l0,	%g3,	%g1
	srl	%o3,	0x1F,	%l2
loop_1926:
	stx	%l5,	[%l7 + 0x70]
	fornot2s	%f25,	%f1,	%f25
	tle	%xcc,	0x3
	fornot1s	%f4,	%f4,	%f31
	std	%f14,	[%l7 + 0x48]
	move	%xcc,	%o0,	%i2
	mulscc	%i1,	0x0143,	%o6
	bge	%icc,	loop_1927
	fbn,a	%fcc2,	loop_1928
	siam	0x3
	tge	%xcc,	0x1
loop_1927:
	array16	%o4,	%o5,	%i0
loop_1928:
	fandnot2	%f0,	%f6,	%f18
	ldx	[%l7 + 0x68],	%g5
	fpsub16	%f2,	%f10,	%f26
	be	%xcc,	loop_1929
	subcc	%l1,	0x08E3,	%o2
	xnor	%o1,	%i3,	%i5
	tpos	%xcc,	0x4
loop_1929:
	addccc	%l4,	%o7,	%l3
	wr	%g0,	0x23,	%asi
	stxa	%l6,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovda	%xcc,	%f26,	%f2
	fmovrdlz	%i6,	%f6,	%f26
	te	%icc,	0x0
	fmovsa	%xcc,	%f28,	%f1
	movrlz	%g4,	0x1FE,	%i7
	fble	%fcc1,	loop_1930
	brz	%g6,	loop_1931
	movvs	%icc,	%g2,	%g7
	fmovsneg	%icc,	%f22,	%f19
loop_1930:
	alignaddrl	%l0,	%i4,	%g1
loop_1931:
	edge16	%g3,	%l2,	%o3
	fbg,a	%fcc1,	loop_1932
	array32	%l5,	%o0,	%i1
	fpmerge	%f24,	%f13,	%f30
	ld	[%l7 + 0x0C],	%f30
loop_1932:
	edge16ln	%i2,	%o6,	%o5
	popc	0x0446,	%i0
	andncc	%o4,	%g5,	%l1
	alignaddrl	%o2,	%i3,	%i5
	umulcc	%l4,	0x1512,	%o7
	movg	%icc,	%l3,	%o1
	xor	%l6,	%i6,	%g4
	fmovdl	%icc,	%f21,	%f25
	sethi	0x1A7E,	%g6
	bcc	%xcc,	loop_1933
	smul	%g2,	0x118E,	%i7
	movneg	%xcc,	%g7,	%i4
	movneg	%xcc,	%l0,	%g3
loop_1933:
	te	%xcc,	0x4
	wr	%g0,	0x22,	%asi
	stwa	%g1,	[%l7 + 0x20] %asi
	membar	#Sync
	fandnot2s	%f17,	%f4,	%f12
	addc	%o3,	0x197E,	%l2
	sdivx	%o0,	0x1256,	%i1
	orcc	%l5,	0x12BB,	%i2
	fornot1s	%f10,	%f7,	%f8
	popc	%o6,	%o5
	fmovdn	%icc,	%f10,	%f13
	fmovda	%xcc,	%f24,	%f10
	fmul8x16	%f11,	%f20,	%f20
	fmovdleu	%xcc,	%f14,	%f18
	edge16ln	%o4,	%i0,	%l1
	tn	%xcc,	0x7
	edge8ln	%g5,	%i3,	%i5
	pdist	%f10,	%f20,	%f14
	xnor	%l4,	0x122D,	%o2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%o7
	ba,a	%icc,	loop_1934
	edge32l	%l3,	%o1,	%l6
	fcmple32	%f12,	%f28,	%g4
	tvc	%icc,	0x4
loop_1934:
	nop
	setx loop_1935, %l0, %l1
	jmpl %l1, %g6
	sra	%g2,	0x13,	%i7
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
loop_1935:
	fmovdgu	%xcc,	%f19,	%f10
	tle	%xcc,	0x4
	udiv	%g7,	0x15F7,	%i4
	fmovrslz	%l0,	%f18,	%f31
	fbule,a	%fcc0,	loop_1936
	movle	%xcc,	%g1,	%o3
	nop
	setx	loop_1937,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbuge,a	%fcc2,	loop_1938
loop_1936:
	umul	%g3,	%o0,	%i1
	fbe	%fcc2,	loop_1939
loop_1937:
	udivcc	%l2,	0x1F52,	%l5
loop_1938:
	bn,a,pt	%xcc,	loop_1940
	bvc	%icc,	loop_1941
loop_1939:
	sll	%o6,	%o5,	%i2
	srlx	%i0,	0x02,	%l1
loop_1940:
	and	%g5,	%o4,	%i5
loop_1941:
	brgz,a	%l4,	loop_1942
	tcc	%icc,	0x2
	fmovscc	%icc,	%f4,	%f10
	fnors	%f25,	%f1,	%f26
loop_1942:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o2
	mova	%icc,	%o7,	%l3
	movn	%xcc,	%o1,	%i3
	sra	%g4,	%g6,	%l6
	movrgez	%i7,	%i6,	%g2
	fmovdgu	%icc,	%f15,	%f31
	sdivx	%i4,	0x01C9,	%l0
	movg	%xcc,	%g1,	%g7
	set	0x31, %o5
	stba	%g3,	[%l7 + %o5] 0x18
	ta	%xcc,	0x3
	udiv	%o3,	0x1312,	%i1
	tpos	%xcc,	0x2
	tpos	%icc,	0x5
	bne	%icc,	loop_1943
	fcmpne16	%f0,	%f6,	%o0
	xor	%l5,	0x1CF1,	%o6
	udivcc	%l2,	0x09DC,	%o5
loop_1943:
	xor	%i0,	0x1EAA,	%l1
	tvc	%icc,	0x0
	fbug,a	%fcc3,	loop_1944
	sethi	0x0675,	%i2
	movleu	%xcc,	%g5,	%o4
	fcmpne32	%f18,	%f24,	%i5
loop_1944:
	sllx	%l4,	%o2,	%l3
	tl	%xcc,	0x4
	subc	%o1,	%i3,	%g4
	udivx	%g6,	0x013E,	%l6
	subc	%o7,	0x0B17,	%i6
	nop
	setx	loop_1945,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fzero	%f4
	set	0x6F, %i7
	lduba	[%l7 + %i7] 0x10,	%g2
loop_1945:
	fnot2s	%f11,	%f13
	xnor	%i7,	0x0447,	%i4
	brlz,a	%g1,	loop_1946
	orn	%l0,	%g7,	%o3
	move	%xcc,	%g3,	%i1
	bl,a	%icc,	loop_1947
loop_1946:
	tgu	%xcc,	0x2
	fmovdpos	%xcc,	%f7,	%f23
	addc	%l5,	%o6,	%l2
loop_1947:
	edge16l	%o5,	%o0,	%l1
	fbn,a	%fcc2,	loop_1948
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	siam	0x1
	ta	%xcc,	0x4
loop_1948:
	movg	%icc,	%i2,	%i0
	fpmerge	%f31,	%f18,	%f0
	bneg,pt	%xcc,	loop_1949
	orn	%g5,	%i5,	%l4
	stb	%o4,	[%l7 + 0x2D]
	edge32n	%o2,	%l3,	%o1
loop_1949:
	addccc	%i3,	%g6,	%l6
	sllx	%o7,	0x04,	%g4
	wr	%g0,	0x27,	%asi
	stha	%i6,	[%l7 + 0x1C] %asi
	membar	#Sync
	orcc	%g2,	0x0330,	%i4
	fxors	%f12,	%f7,	%f19
	sethi	0x106F,	%i7
	bcc,pn	%icc,	loop_1950
	ldub	[%l7 + 0x3A],	%g1
	orn	%g7,	%o3,	%l0
	fmovdl	%xcc,	%f8,	%f27
loop_1950:
	brlez	%g3,	loop_1951
	fblg	%fcc2,	loop_1952
	array32	%i1,	%l5,	%l2
	tneg	%xcc,	0x6
loop_1951:
	ta	%xcc,	0x2
loop_1952:
	sll	%o6,	%o5,	%l1
	movneg	%xcc,	%o0,	%i0
	movpos	%icc,	%g5,	%i2
	movneg	%icc,	%l4,	%i5
	alignaddr	%o2,	%o4,	%o1
	fmovsge	%xcc,	%f20,	%f17
	fbu,a	%fcc3,	loop_1953
	tge	%icc,	0x2
	edge16l	%l3,	%i3,	%g6
	ldsw	[%l7 + 0x54],	%l6
loop_1953:
	andcc	%o7,	0x10AF,	%i6
	tsubcc	%g2,	%i4,	%i7
	popc	0x1337,	%g4
	be	loop_1954
	fmovrdgez	%g7,	%f10,	%f18
	swap	[%l7 + 0x68],	%g1
	fmovdvs	%icc,	%f24,	%f3
loop_1954:
	sra	%o3,	0x0B,	%g3
	umulcc	%l0,	0x0D21,	%i1
	set	0x55, %i5
	stba	%l2,	[%l7 + %i5] 0xe3
	membar	#Sync
	movvs	%xcc,	%l5,	%o6
	edge32n	%o5,	%o0,	%i0
	ldd	[%l7 + 0x30],	%l0
	fcmpes	%fcc2,	%f26,	%f17
	sth	%i2,	[%l7 + 0x6C]
	fmovsleu	%icc,	%f16,	%f13
	membar	0x17
	membar	0x3E
	fcmpgt32	%f26,	%f10,	%g5
	alignaddrl	%l4,	%i5,	%o2
	ta	%icc,	0x2
	tvs	%xcc,	0x5
	sll	%o1,	0x10,	%l3
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf9,	%f16
	movneg	%icc,	%i3,	%g6
	movg	%icc,	%o4,	%l6
	srlx	%i6,	%o7,	%g2
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x12] %asi,	%i7
	srax	%g4,	0x05,	%g7
	fbge,a	%fcc0,	loop_1955
	add	%i4,	0x13ED,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x3
loop_1955:
	nop
	set	0x80, %l0
	ldxa	[%g0 + %l0] 0x58,	%g3
	srlx	%o3,	%l0,	%i1
	set	0x74, %g4
	lduwa	[%l7 + %g4] 0x11,	%l5
	addc	%l2,	0x0C7F,	%o6
	sdivcc	%o0,	0x1105,	%o5
	fbge	%fcc2,	loop_1956
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc2,	loop_1957
	add	%i0,	%i2,	%l1
loop_1956:
	prefetch	[%l7 + 0x30],	 0x2
	edge32ln	%l4,	%g5,	%o2
loop_1957:
	edge32l	%i5,	%l3,	%i3
	fbug	%fcc0,	loop_1958
	brlez,a	%o1,	loop_1959
	fornot1s	%f25,	%f27,	%f14
	fmovdne	%xcc,	%f22,	%f15
loop_1958:
	edge32n	%g6,	%o4,	%l6
loop_1959:
	prefetch	[%l7 + 0x3C],	 0x2
	orcc	%i6,	%g2,	%o7
	bcc	loop_1960
	fble	%fcc1,	loop_1961
	movrgez	%i7,	%g4,	%i4
	bvc,a	%xcc,	loop_1962
loop_1960:
	srl	%g1,	%g7,	%o3
loop_1961:
	fmovrsne	%l0,	%f7,	%f3
	tcs	%xcc,	0x7
loop_1962:
	sethi	0x0691,	%i1
	lduw	[%l7 + 0x78],	%g3
	stb	%l5,	[%l7 + 0x17]
	sdiv	%l2,	0x0B00,	%o0
	fxnor	%f8,	%f30,	%f10
	fbul	%fcc2,	loop_1963
	fmovdge	%icc,	%f15,	%f20
	smul	%o5,	%o6,	%i2
	xor	%l1,	%i0,	%g5
loop_1963:
	movne	%xcc,	%o2,	%i5
	edge16l	%l3,	%i3,	%o1
	nop
	setx	loop_1964,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbe,a	%fcc0,	loop_1965
	ta	%icc,	0x7
	subcc	%g6,	0x0FBA,	%l4
loop_1964:
	fmovsleu	%icc,	%f30,	%f14
loop_1965:
	sub	%l6,	0x1877,	%o4
	movgu	%icc,	%g2,	%o7
	edge32n	%i7,	%i6,	%g4
	fmovsvs	%xcc,	%f29,	%f11
	fnor	%f20,	%f22,	%f4
	mova	%xcc,	%g1,	%i4
	movrlz	%g7,	%l0,	%i1
	call	loop_1966
	bn,a	loop_1967
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o3,	%g3,	%l5
loop_1966:
	tge	%icc,	0x7
loop_1967:
	movl	%xcc,	%l2,	%o5
	movrlez	%o0,	%o6,	%i2
	taddcc	%l1,	0x0486,	%i0
	fbule	%fcc1,	loop_1968
	movn	%xcc,	%o2,	%i5
	fabss	%f2,	%f27
	fcmped	%fcc0,	%f14,	%f2
loop_1968:
	fmovdleu	%icc,	%f0,	%f22
	fornot2	%f10,	%f0,	%f12
	tneg	%icc,	0x4
	movneg	%xcc,	%g5,	%l3
	tg	%icc,	0x0
	or	%i3,	0x1045,	%g6
	sdivx	%l4,	0x08D4,	%l6
	te	%icc,	0x3
	subcc	%o1,	%g2,	%o4
	mova	%icc,	%i7,	%i6
	edge32	%g4,	%g1,	%o7
	fnot1	%f6,	%f12
	sub	%i4,	%l0,	%i1
	bcs,a,pt	%icc,	loop_1969
	lduh	[%l7 + 0x5E],	%g7
	flush	%l7 + 0x44
	tgu	%xcc,	0x1
loop_1969:
	fmovrdgez	%o3,	%f10,	%f8
	xorcc	%l5,	0x0733,	%g3
	alignaddr	%o5,	%l2,	%o0
	fmovsneg	%xcc,	%f24,	%f24
	brnz,a	%i2,	loop_1970
	tn	%xcc,	0x5
	fblg,a	%fcc3,	loop_1971
	tgu	%icc,	0x3
loop_1970:
	fmovdleu	%xcc,	%f16,	%f12
	orcc	%l1,	%o6,	%i0
loop_1971:
	fmovdleu	%xcc,	%f17,	%f7
	srax	%o2,	%g5,	%l3
	sth	%i3,	[%l7 + 0x54]
	tgu	%xcc,	0x2
	movne	%icc,	%g6,	%l4
	membar	0x24
	movrne	%i5,	0x259,	%o1
	tpos	%icc,	0x7
	movne	%xcc,	%g2,	%o4
	fxnors	%f15,	%f26,	%f15
	subc	%l6,	%i6,	%i7
	fornot2	%f24,	%f20,	%f18
	tn	%icc,	0x7
	fcmpeq32	%f10,	%f18,	%g1
	brgz	%o7,	loop_1972
	fbg,a	%fcc1,	loop_1973
	edge8	%g4,	%i4,	%l0
	xorcc	%g7,	%i1,	%o3
loop_1972:
	fcmps	%fcc2,	%f19,	%f6
loop_1973:
	fmovsg	%icc,	%f25,	%f8
	fmovrdgez	%l5,	%f16,	%f16
	fmovrdlez	%g3,	%f28,	%f18
	edge16n	%o5,	%o0,	%l2
	array32	%i2,	%o6,	%l1
	fmovrdlz	%i0,	%f8,	%f28
	nop
	set	0x68, %l4
	ldstub	[%l7 + %l4],	%g5
	fmovdneg	%icc,	%f12,	%f24
	movvs	%xcc,	%l3,	%i3
	edge32n	%o2,	%g6,	%l4
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x34] %asi,	%o1
	nop
	setx	loop_1974,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%icc,	%g2,	%i5
	tsubcc	%l6,	0x110A,	%o4
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x54] %asi,	%i7
loop_1974:
	edge16n	%g1,	%i6,	%g4
	sir	0x093C
	membar	0x54
	fcmpeq32	%f8,	%f12,	%i4
	movg	%xcc,	%o7,	%g7
	movneg	%xcc,	%l0,	%o3
	fbue	%fcc1,	loop_1975
	array32	%i1,	%l5,	%g3
	andcc	%o5,	%l2,	%o0
	srlx	%i2,	%o6,	%l1
loop_1975:
	tsubcctv	%g5,	0x0857,	%l3
	sllx	%i3,	%i0,	%g6
	mova	%xcc,	%l4,	%o1
	sra	%o2,	0x17,	%i5
	tpos	%icc,	0x3
	movrlz	%l6,	0x34B,	%g2
	move	%xcc,	%i7,	%o4
	fpadd16	%f10,	%f28,	%f26
	movvs	%icc,	%g1,	%g4
	fmovrdgez	%i4,	%f18,	%f26
	flush	%l7 + 0x68
	tleu	%icc,	0x4
	brnz	%o7,	loop_1976
	bgu,a,pn	%xcc,	loop_1977
	array8	%i6,	%g7,	%o3
	fblg	%fcc2,	loop_1978
loop_1976:
	fbne	%fcc0,	loop_1979
loop_1977:
	nop
	setx	loop_1980,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovspos	%icc,	%f16,	%f16
loop_1978:
	fnands	%f7,	%f22,	%f3
loop_1979:
	mulscc	%i1,	%l5,	%g3
loop_1980:
	sub	%o5,	%l2,	%l0
	ldx	[%l7 + 0x70],	%o0
	fmovrdlez	%i2,	%f4,	%f24
	movneg	%xcc,	%o6,	%g5
	andcc	%l3,	%i3,	%i0
	sub	%l1,	%g6,	%o1
	te	%icc,	0x3
	tle	%xcc,	0x3
	fxnor	%f2,	%f8,	%f8
	movrlez	%l4,	0x3BA,	%i5
	edge16l	%o2,	%l6,	%g2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%g1
	set	0x1A, %g2
	stha	%g4,	[%l7 + %g2] 0x88
	smul	%i4,	0x14AA,	%o7
	tcc	%icc,	0x6
	tneg	%icc,	0x2
	xor	%i6,	0x092A,	%i7
	sll	%o3,	%g7,	%l5
	nop
	set	0x3A, %i6
	lduh	[%l7 + %i6],	%i1
	movg	%icc,	%o5,	%l2
	mova	%icc,	%g3,	%l0
	sub	%i2,	0x10A4,	%o0
	fnor	%f28,	%f12,	%f20
	or	%o6,	0x1A35,	%l3
	array16	%g5,	%i3,	%l1
	movleu	%xcc,	%g6,	%i0
	fcmpne32	%f12,	%f0,	%o1
	edge32	%i5,	%o2,	%l4
	edge32	%g2,	%l6,	%g1
	sethi	0x0A50,	%g4
	prefetch	[%l7 + 0x6C],	 0x0
	taddcctv	%o4,	%o7,	%i6
	movrlz	%i4,	%i7,	%g7
	membar	0x31
	edge16l	%l5,	%i1,	%o3
	sir	0x1FC1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x33] %asi,	%o5
	ld	[%l7 + 0x70],	%f1
	fmovdcs	%icc,	%f6,	%f29
	te	%icc,	0x4
	fbul,a	%fcc0,	loop_1981
	udiv	%g3,	0x0A4E,	%l0
	brz,a	%i2,	loop_1982
	fcmps	%fcc2,	%f31,	%f6
loop_1981:
	edge8n	%o0,	%o6,	%l3
	fmovde	%xcc,	%f11,	%f0
loop_1982:
	flush	%l7 + 0x54
	stb	%g5,	[%l7 + 0x5D]
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x70] %asi,	%f0
	ld	[%l7 + 0x78],	%f24
	fandnot2s	%f20,	%f4,	%f27
	fcmple32	%f14,	%f16,	%i3
	movrgz	%l2,	%l1,	%g6
	andn	%o1,	0x14F2,	%i5
	ldsb	[%l7 + 0x57],	%i0
	brgz	%l4,	loop_1983
	array8	%o2,	%l6,	%g2
	srax	%g4,	0x02,	%g1
	sllx	%o7,	0x1F,	%o4
loop_1983:
	fmovdleu	%xcc,	%f15,	%f26
	edge32ln	%i4,	%i7,	%i6
	tcs	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g7
	movre	%l5,	0x155,	%i1
	umul	%o5,	%g3,	%o3
	udivcc	%i2,	0x0FDF,	%o0
	stw	%l0,	[%l7 + 0x60]
	fmul8x16al	%f13,	%f28,	%f16
	tne	%icc,	0x0
	edge16	%o6,	%l3,	%i3
	fone	%f18
	fmovrslz	%l2,	%f24,	%f5
	brgz	%g5,	loop_1984
	tge	%xcc,	0x3
	fmovscc	%icc,	%f28,	%f19
	addccc	%g6,	%o1,	%i5
loop_1984:
	nop
	set	0x70, %l6
	sta	%f9,	[%l7 + %l6] 0x10
	fandnot1s	%f23,	%f15,	%f11
	sdiv	%l1,	0x18C6,	%i0
	fbue,a	%fcc3,	loop_1985
	sir	0x09B4
	bcs	loop_1986
	sdivcc	%l4,	0x0FE3,	%l6
loop_1985:
	fbe	%fcc2,	loop_1987
	te	%xcc,	0x4
loop_1986:
	sllx	%g2,	0x1F,	%o2
	fpackfix	%f16,	%f23
loop_1987:
	tge	%icc,	0x7
	movge	%icc,	%g1,	%o7
	andncc	%o4,	%g4,	%i7
	fmuld8sux16	%f3,	%f3,	%f2
	movrne	%i6,	%i4,	%l5
	fornot2	%f28,	%f16,	%f16
	alignaddr	%g7,	%i1,	%o5
	movrlz	%o3,	0x337,	%i2
	sdivcc	%o0,	0x1E46,	%l0
	bvc,pn	%xcc,	loop_1988
	fmovsa	%icc,	%f22,	%f25
	ldsw	[%l7 + 0x0C],	%g3
	fbe,a	%fcc2,	loop_1989
loop_1988:
	movpos	%xcc,	%o6,	%l3
	movre	%i3,	0x0EC,	%g5
	sra	%l2,	0x09,	%g6
loop_1989:
	movn	%xcc,	%o1,	%i5
	tvc	%icc,	0x3
	fmovdcs	%icc,	%f31,	%f16
	set	0x08, %i4
	prefetcha	[%l7 + %i4] 0x10,	 0x0
	tg	%icc,	0x0
	fpsub16	%f0,	%f22,	%f4
	tleu	%icc,	0x7
	sdiv	%l4,	0x132A,	%l6
	popc	0x06D1,	%l1
	movle	%xcc,	%o2,	%g2
	tleu	%icc,	0x0
	fnot2	%f0,	%f22
	movrgez	%o7,	0x209,	%g1
	subccc	%o4,	0x14DD,	%i7
	tcc	%xcc,	0x6
	tle	%xcc,	0x2
	orcc	%g4,	%i4,	%i6
	fmul8ulx16	%f16,	%f2,	%f24
	fand	%f30,	%f16,	%f6
	array8	%l5,	%i1,	%g7
	udiv	%o3,	0x1C80,	%o5
	edge32n	%i2,	%o0,	%l0
	fmul8x16al	%f5,	%f25,	%f20
	add	%o6,	0x0ADD,	%l3
	tleu	%xcc,	0x5
	orcc	%i3,	0x0630,	%g3
	fmovsgu	%icc,	%f2,	%f26
	te	%icc,	0x6
	fabsd	%f20,	%f30
	tl	%xcc,	0x2
	fmul8x16au	%f16,	%f20,	%f4
	orn	%g5,	%g6,	%o1
	ldstub	[%l7 + 0x46],	%l2
	movvs	%icc,	%i0,	%i5
	xorcc	%l4,	%l1,	%o2
	fmovsgu	%xcc,	%f14,	%f19
	brlez,a	%l6,	loop_1990
	or	%g2,	0x17DF,	%o7
	brz	%o4,	loop_1991
	fpsub32s	%f22,	%f26,	%f11
loop_1990:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x58] %asi,	%i7
loop_1991:
	srax	%g1,	%i4,	%g4
	brgz	%i6,	loop_1992
	mulscc	%i1,	%l5,	%g7
	tpos	%xcc,	0x0
	fabsd	%f20,	%f0
loop_1992:
	movcc	%xcc,	%o3,	%i2
	stbar
	fbule,a	%fcc1,	loop_1993
	flush	%l7 + 0x34
	edge8l	%o0,	%o5,	%o6
	flush	%l7 + 0x1C
loop_1993:
	movle	%icc,	%l3,	%l0
	addcc	%i3,	%g5,	%g6
	xorcc	%g3,	0x0797,	%l2
	fblg,a	%fcc0,	loop_1994
	brlz	%o1,	loop_1995
	edge32ln	%i0,	%l4,	%l1
	nop
	setx	loop_1996,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1994:
	movvs	%icc,	%o2,	%i5
loop_1995:
	tsubcctv	%g2,	0x109D,	%o7
	move	%xcc,	%l6,	%i7
loop_1996:
	movne	%xcc,	%o4,	%i4
	movrlez	%g4,	%g1,	%i6
	and	%i1,	0x12F5,	%g7
	movrlez	%o3,	%l5,	%i2
	fbe,a	%fcc0,	loop_1997
	alignaddrl	%o0,	%o6,	%l3
	fmovsgu	%icc,	%f28,	%f8
	fnands	%f3,	%f17,	%f0
loop_1997:
	tcs	%xcc,	0x0
	sdivcc	%l0,	0x021A,	%i3
	edge32	%o5,	%g6,	%g5
	fpadd32	%f14,	%f10,	%f10
	udivcc	%l2,	0x15A4,	%o1
	tge	%icc,	0x3
	tvs	%xcc,	0x0
	movvc	%xcc,	%g3,	%l4
	bcc,a,pn	%xcc,	loop_1998
	bg,a	%xcc,	loop_1999
	xnor	%i0,	%o2,	%l1
	sub	%i5,	%g2,	%l6
loop_1998:
	fmovdvc	%icc,	%f16,	%f1
loop_1999:
	tvs	%xcc,	0x7
	movpos	%xcc,	%o7,	%o4
	ldsb	[%l7 + 0x1B],	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i4,	%g1,	%g4
	fsrc2	%f28,	%f30
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x5F] %asi,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%g7,	loop_2000
	movge	%xcc,	%i1,	%l5
	edge8	%o3,	%i2,	%o6
	tpos	%xcc,	0x3
loop_2000:
	fcmpeq32	%f4,	%f24,	%l3
	sra	%l0,	0x0B,	%o0
	bneg,a,pt	%icc,	loop_2001
	tgu	%xcc,	0x4
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x30] %asi,	%o5
loop_2001:
	tpos	%icc,	0x3
	edge16n	%g6,	%g5,	%i3
	tg	%xcc,	0x6
	wr	%g0,	0xe3,	%asi
	stda	%o0,	[%l7 + 0x08] %asi
	membar	#Sync
	addc	%l2,	%g3,	%l4
	fmovspos	%xcc,	%f5,	%f23
	array16	%i0,	%l1,	%o2
	edge16	%g2,	%l6,	%i5
	array32	%o4,	%i7,	%o7
	fcmpd	%fcc1,	%f4,	%f14
	movre	%g1,	0x3CF,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i6,	%g7,	%g4
	mulscc	%i1,	%l5,	%i2
	tvs	%icc,	0x1
	srl	%o6,	%o3,	%l3
	xnor	%l0,	0x0F4B,	%o0
	movcs	%icc,	%o5,	%g5
	wr	%g0,	0xeb,	%asi
	stha	%g6,	[%l7 + 0x5C] %asi
	membar	#Sync
	sllx	%i3,	0x14,	%l2
	fble,a	%fcc2,	loop_2002
	fbuge,a	%fcc0,	loop_2003
	tcs	%xcc,	0x7
	addc	%g3,	0x09F4,	%l4
loop_2002:
	fnot2	%f4,	%f12
loop_2003:
	tn	%xcc,	0x1
	set	0x34, %g5
	sta	%f20,	[%l7 + %g5] 0x11
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovrslez	%i0,	%f5,	%f15
	fmovrslz	%l1,	%f27,	%f30
	movcc	%xcc,	%o1,	%o2
	movgu	%icc,	%g2,	%l6
	edge8	%i5,	%i7,	%o4
	fmovsgu	%xcc,	%f29,	%f31
	edge8l	%g1,	%o7,	%i4
	fpsub16s	%f26,	%f17,	%f31
	and	%g7,	%g4,	%i1
	edge32l	%l5,	%i6,	%o6
	tcs	%icc,	0x1
	bge,a,pn	%xcc,	loop_2004
	brnz,a	%i2,	loop_2005
	pdist	%f14,	%f0,	%f22
	or	%l3,	0x0049,	%l0
loop_2004:
	mova	%xcc,	%o3,	%o5
loop_2005:
	sra	%o0,	%g5,	%i3
	siam	0x6
	edge32	%g6,	%g3,	%l2
	array16	%i0,	%l1,	%l4
	movg	%xcc,	%o2,	%o1
	fsrc2s	%f9,	%f21
	array32	%g2,	%i5,	%i7
	tle	%icc,	0x2
	fnot1s	%f23,	%f26
	fbu	%fcc3,	loop_2006
	tle	%xcc,	0x7
	fmovsgu	%icc,	%f15,	%f20
	tleu	%xcc,	0x4
loop_2006:
	fand	%f4,	%f28,	%f26
	fxnor	%f24,	%f14,	%f16
	te	%icc,	0x5
	movcc	%xcc,	%l6,	%g1
	fornot1s	%f15,	%f21,	%f18
	add	%o4,	0x1F2F,	%o7
	movle	%xcc,	%i4,	%g7
	fmovdvs	%icc,	%f8,	%f24
	set	0x2C, %l3
	lduwa	[%l7 + %l3] 0x11,	%g4
	mova	%icc,	%l5,	%i1
	fsrc2	%f18,	%f28
	sllx	%o6,	%i6,	%l3
	add	%i2,	0x0B84,	%l0
	bcc	%xcc,	loop_2007
	movvc	%icc,	%o5,	%o3
	orncc	%o0,	%i3,	%g6
	movg	%xcc,	%g3,	%l2
loop_2007:
	nop
	set	0x58, %i3
	stda	%g4,	[%l7 + %i3] 0x14
	movleu	%icc,	%i0,	%l4
	bvc,a	loop_2008
	srlx	%o2,	%o1,	%l1
	edge32l	%g2,	%i5,	%l6
	fmul8x16au	%f7,	%f10,	%f14
loop_2008:
	ldstub	[%l7 + 0x6A],	%i7
	nop
	setx	loop_2009,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subc	%o4,	%o7,	%i4
	lduh	[%l7 + 0x32],	%g1
	stx	%g4,	[%l7 + 0x78]
loop_2009:
	array16	%g7,	%i1,	%l5
	sdiv	%o6,	0x02F3,	%l3
	fbne,a	%fcc3,	loop_2010
	tsubcctv	%i6,	0x1043,	%i2
	edge16l	%l0,	%o3,	%o5
	brlz,a	%o0,	loop_2011
loop_2010:
	fpadd32	%f18,	%f4,	%f24
	nop
	set	0x78, %o6
	ldx	[%l7 + %o6],	%g6
	flush	%l7 + 0x24
loop_2011:
	nop
	set	0x37, %o2
	lduba	[%l7 + %o2] 0x18,	%i3
	movne	%icc,	%g3,	%l2
	srlx	%g5,	%l4,	%o2
	edge8l	%i0,	%o1,	%g2
	fmovsneg	%xcc,	%f7,	%f1
	bleu,pn	%icc,	loop_2012
	tcc	%xcc,	0x1
	call	loop_2013
	fbge	%fcc3,	loop_2014
loop_2012:
	tleu	%xcc,	0x7
	fcmpes	%fcc3,	%f27,	%f11
loop_2013:
	nop
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%l1
loop_2014:
	bl,pt	%xcc,	loop_2015
	movgu	%icc,	%i7,	%l6
	and	%o4,	%i4,	%o7
	edge8ln	%g1,	%g4,	%i1
loop_2015:
	ble	%xcc,	loop_2016
	mulscc	%l5,	%o6,	%g7
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i6
loop_2016:
	tle	%xcc,	0x1
	sir	0x13E7
	ld	[%l7 + 0x44],	%f2
	tcs	%xcc,	0x0
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movle	%icc,	%i2,	%l3
	fsrc2	%f16,	%f2
	and	%o3,	%o5,	%o0
	st	%f7,	[%l7 + 0x44]
	tvc	%xcc,	0x4
	fzeros	%f21
	tl	%icc,	0x2
	fbge	%fcc2,	loop_2017
	array16	%g6,	%l0,	%g3
	fmovrdgz	%i3,	%f2,	%f4
	movcc	%icc,	%g5,	%l4
loop_2017:
	fpadd32s	%f13,	%f16,	%f4
	mulx	%l2,	0x07AD,	%o2
	movg	%icc,	%o1,	%g2
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
	subc	%i5,	0x19CA,	%i0
	nop
	setx loop_2018, %l0, %l1
	jmpl %l1, %l1
	fcmpd	%fcc0,	%f4,	%f4
	edge8	%l6,	%o4,	%i7
	srax	%o7,	%g1,	%i4
loop_2018:
	fmovdne	%xcc,	%f21,	%f29
	tpos	%xcc,	0x7
	edge8ln	%g4,	%l5,	%i1
	sdivcc	%g7,	0x0FD1,	%i6
	srax	%o6,	0x0F,	%l3
	array8	%o3,	%o5,	%i2
	umulcc	%o0,	%l0,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i3,	0x14,	%g5
	fpack16	%f10,	%f14
	tleu	%icc,	0x6
	prefetch	[%l7 + 0x3C],	 0x3
	sub	%l4,	0x1D42,	%l2
	movrne	%o2,	0x286,	%o1
	fmul8x16au	%f26,	%f13,	%f20
	fnands	%f17,	%f29,	%f0
	and	%g6,	0x05F1,	%g2
	sllx	%i0,	0x1E,	%i5
	fornot2s	%f7,	%f4,	%f20
	set	0x220, %i2
	ldxa	[%g0 + %i2] 0x52,	%l1
	xorcc	%o4,	%i7,	%o7
	movvc	%xcc,	%g1,	%l6
	edge8l	%g4,	%i4,	%i1
	orncc	%l5,	%i6,	%o6
	xnor	%g7,	%o3,	%l3
	fmovsleu	%xcc,	%f27,	%f30
	fmovdne	%icc,	%f27,	%f29
	edge32ln	%o5,	%i2,	%o0
	edge32l	%l0,	%g3,	%g5
	fand	%f0,	%f18,	%f6
	fcmpgt32	%f22,	%f12,	%i3
	fbu,a	%fcc0,	loop_2019
	fxnor	%f22,	%f8,	%f26
	movrgez	%l2,	0x2B1,	%l4
	tl	%icc,	0x7
loop_2019:
	tg	%icc,	0x6
	alignaddr	%o1,	%o2,	%g2
	tgu	%icc,	0x5
	ldd	[%l7 + 0x48],	%i0
	move	%xcc,	%i5,	%g6
	edge8ln	%l1,	%o4,	%o7
	bgu,pn	%xcc,	loop_2020
	fzeros	%f4
	fcmpeq16	%f24,	%f20,	%i7
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%g1,	%l6
loop_2020:
	fnot1s	%f10,	%f14
	fbug	%fcc1,	loop_2021
	taddcc	%i4,	0x1DA2,	%g4
	andcc	%l5,	0x1FFC,	%i6
	ba,a	%icc,	loop_2022
loop_2021:
	fpsub32s	%f11,	%f20,	%f0
	array16	%o6,	%g7,	%o3
	fpmerge	%f16,	%f25,	%f24
loop_2022:
	bvc,a,pn	%xcc,	loop_2023
	fbe,a	%fcc2,	loop_2024
	fnegs	%f11,	%f3
	umulcc	%i1,	%l3,	%o5
loop_2023:
	smul	%o0,	%l0,	%i2
loop_2024:
	fble,a	%fcc1,	loop_2025
	tcs	%icc,	0x1
	andcc	%g3,	0x04E3,	%i3
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2025:
	fmovdleu	%icc,	%f1,	%f11
	brlz	%l2,	loop_2026
	tne	%icc,	0x7
	sethi	0x0B09,	%g5
	bge,pn	%icc,	loop_2027
loop_2026:
	movvc	%xcc,	%o1,	%l4
	fmul8x16au	%f25,	%f3,	%f0
	tvc	%icc,	0x2
loop_2027:
	fcmple32	%f0,	%f4,	%o2
	bn,a,pn	%xcc,	loop_2028
	bge,pn	%icc,	loop_2029
	tsubcc	%i0,	0x0CB7,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2028:
	nop
	set	0x4C, %o4
	lduwa	[%l7 + %o4] 0x15,	%g2
loop_2029:
	ta	%icc,	0x2
	fmovdvs	%xcc,	%f3,	%f5
	andn	%l1,	0x1D48,	%g6
	smul	%o4,	0x1CE5,	%i7
	movl	%xcc,	%o7,	%l6
	wr	%g0,	0x2b,	%asi
	stwa	%i4,	[%l7 + 0x3C] %asi
	membar	#Sync
	orcc	%g1,	%l5,	%g4
	movgu	%xcc,	%o6,	%g7
	siam	0x2
	addc	%i6,	%o3,	%l3
	sdiv	%i1,	0x1781,	%o5
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x04,	%l0
	std	%o0,	[%l7 + 0x50]
	movl	%icc,	%i2,	%g3
	nop
	set	0x64, %g1
	ldsw	[%l7 + %g1],	%l2
	ldsw	[%l7 + 0x08],	%g5
	fpadd16	%f22,	%f22,	%f26
	membar	0x07
	sir	0x05D4
	fbne,a	%fcc2,	loop_2030
	smulcc	%i3,	0x0E2A,	%l4
	umulcc	%o1,	0x1D6A,	%i0
	fbule,a	%fcc0,	loop_2031
loop_2030:
	subccc	%o2,	0x0BAD,	%g2
	fbn	%fcc1,	loop_2032
	movge	%xcc,	%l1,	%g6
loop_2031:
	fnand	%f26,	%f8,	%f24
	fmovdleu	%xcc,	%f0,	%f23
loop_2032:
	addcc	%o4,	%i7,	%i5
	fbug,a	%fcc0,	loop_2033
	lduw	[%l7 + 0x30],	%l6
	movleu	%xcc,	%o7,	%g1
	movvc	%icc,	%l5,	%g4
loop_2033:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x5F],	%o6
	swap	[%l7 + 0x7C],	%g7
	ld	[%l7 + 0x14],	%f27
	fpadd16	%f8,	%f12,	%f20
	sllx	%i4,	%o3,	%l3
	fmuld8sux16	%f21,	%f3,	%f2
	sir	0x1E2B
	set	0x60, %i1
	stda	%i0,	[%l7 + %i1] 0x15
	add	%i6,	0x1472,	%l0
	taddcc	%o0,	0x0E28,	%o5
	fble	%fcc2,	loop_2034
	mova	%icc,	%g3,	%i2
	bcc	%icc,	loop_2035
	mova	%xcc,	%l2,	%g5
loop_2034:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i3,	%l4,	%o1
loop_2035:
	mulscc	%i0,	0x1B12,	%g2
	array32	%o2,	%l1,	%o4
	edge8l	%i7,	%g6,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%l6,	%f24,	%f26
	fpadd16	%f26,	%f22,	%f16
	addcc	%g1,	%o7,	%g4
	fmovrdlez	%l5,	%f28,	%f4
	tg	%icc,	0x6
	call	loop_2036
	edge16n	%g7,	%i4,	%o6
	tsubcctv	%l3,	%o3,	%i1
	orcc	%l0,	0x0EA6,	%i6
loop_2036:
	fpadd16s	%f28,	%f22,	%f11
	st	%f4,	[%l7 + 0x08]
	movle	%xcc,	%o5,	%g3
	sethi	0x0F47,	%o0
	bg	%xcc,	loop_2037
	bgu,a	%xcc,	loop_2038
	fpackfix	%f0,	%f17
	wr	%g0,	0x2b,	%asi
	stwa	%l2,	[%l7 + 0x30] %asi
	membar	#Sync
loop_2037:
	nop
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x2a,	%g4
loop_2038:
	tgu	%xcc,	0x5
	movre	%i2,	%i3,	%o1
	udiv	%i0,	0x1C21,	%l4
	orn	%g2,	%l1,	%o2
	fexpand	%f24,	%f8
	umulcc	%o4,	0x12A0,	%g6
	fbne	%fcc2,	loop_2039
	edge32l	%i7,	%l6,	%g1
	brlz	%i5,	loop_2040
	brlez,a	%g4,	loop_2041
loop_2039:
	smulcc	%l5,	0x0286,	%o7
	movrne	%g7,	%o6,	%l3
loop_2040:
	tsubcctv	%i4,	%i1,	%o3
loop_2041:
	be,a,pt	%icc,	loop_2042
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%l0,	%f12,	%f0
	umul	%i6,	0x10E3,	%o5
loop_2042:
	movgu	%icc,	%g3,	%l2
	set	0x18, %g6
	lda	[%l7 + %g6] 0x89,	%f0
	movgu	%xcc,	%o0,	%i2
	fcmpgt32	%f2,	%f16,	%i3
	bne,pn	%icc,	loop_2043
	tneg	%xcc,	0x0
	fpadd32	%f22,	%f10,	%f12
	andn	%o1,	%g5,	%i0
loop_2043:
	tvc	%icc,	0x4
	swap	[%l7 + 0x2C],	%g2
	fxnor	%f14,	%f4,	%f8
	fmuld8sux16	%f21,	%f0,	%f24
	edge32	%l1,	%l4,	%o2
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%g6
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x0c
	fmovdl	%xcc,	%f2,	%f2
	xor	%i7,	%l6,	%g1
	fcmped	%fcc3,	%f26,	%f18
	smul	%i5,	0x0D58,	%g4
	te	%icc,	0x5
	fmovrdgez	%o4,	%f18,	%f14
	alignaddr	%o7,	%l5,	%g7
	tvc	%xcc,	0x3
	fmovdle	%icc,	%f5,	%f14
	edge16n	%l3,	%i4,	%o6
	fmovrsgz	%o3,	%f2,	%f13
	udiv	%l0,	0x1E23,	%i6
	movn	%xcc,	%o5,	%g3
	and	%i1,	%l2,	%o0
	tleu	%xcc,	0x2
	fxnor	%f24,	%f10,	%f4
	sdivcc	%i3,	0x1295,	%o1
	andcc	%g5,	0x12E2,	%i0
	orcc	%i2,	0x0DAD,	%l1
	be,a,pt	%icc,	loop_2044
	lduw	[%l7 + 0x0C],	%g2
	fmovrdlz	%l4,	%f24,	%f16
	fbg,a	%fcc3,	loop_2045
loop_2044:
	move	%xcc,	%g6,	%i7
	call	loop_2046
	taddcctv	%o2,	%g1,	%l6
loop_2045:
	movre	%g4,	%o4,	%i5
	fble	%fcc1,	loop_2047
loop_2046:
	andncc	%o7,	%g7,	%l3
	bpos,a	loop_2048
	orncc	%l5,	0x0601,	%i4
loop_2047:
	nop
	set	0x64, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o6
loop_2048:
	srl	%l0,	0x19,	%i6
	udiv	%o3,	0x137F,	%o5
	edge8l	%g3,	%l2,	%i1
	move	%xcc,	%o0,	%o1
	movneg	%icc,	%g5,	%i3
	sdivx	%i0,	0x1632,	%i2
	movle	%xcc,	%g2,	%l4
	ta	%xcc,	0x5
	andcc	%g6,	0x0CB6,	%l1
	movge	%icc,	%i7,	%o2
	umul	%g1,	0x07A8,	%g4
	bl,a	%xcc,	loop_2049
	fcmpd	%fcc1,	%f30,	%f24
	bgu,a	%xcc,	loop_2050
	edge16	%o4,	%l6,	%i5
loop_2049:
	siam	0x5
	sethi	0x0287,	%g7
loop_2050:
	brgz,a	%o7,	loop_2051
	be,pn	%icc,	loop_2052
	movcc	%xcc,	%l3,	%i4
	sllx	%o6,	0x0B,	%l5
loop_2051:
	or	%i6,	%l0,	%o3
loop_2052:
	bneg,a	loop_2053
	fsrc1	%f24,	%f26
	fmul8x16	%f23,	%f8,	%f28
	movrgez	%o5,	0x36F,	%g3
loop_2053:
	xnorcc	%i1,	%o0,	%o1
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x3C] %asi,	%g5
	fcmps	%fcc0,	%f26,	%f20
	orncc	%i3,	0x12F0,	%l2
	array16	%i0,	%g2,	%l4
	fmovs	%f29,	%f12
	edge32	%g6,	%i2,	%l1
	set	0x30, %l2
	ldstuba	[%l7 + %l2] 0x04,	%o2
	fmovrdgez	%i7,	%f16,	%f22
	bvs	%icc,	loop_2054
	smul	%g4,	%g1,	%o4
	mulx	%l6,	%i5,	%g7
	wr	%g0,	0x18,	%asi
	sta	%f2,	[%l7 + 0x4C] %asi
loop_2054:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x4D] %asi,	%o7
	edge8l	%i4,	%o6,	%l3
	fpack16	%f6,	%f19
	movleu	%icc,	%i6,	%l5
	sllx	%l0,	%o5,	%o3
	andcc	%g3,	0x119F,	%o0
	fandnot2	%f24,	%f6,	%f4
	edge8l	%i1,	%g5,	%i3
	movrgz	%l2,	0x3EC,	%o1
	udivcc	%i0,	0x05E7,	%l4
	wr	%g0,	0x19,	%asi
	stxa	%g6,	[%l7 + 0x20] %asi
	movleu	%xcc,	%i2,	%g2
	smulcc	%l1,	0x0DC5,	%o2
	xnorcc	%i7,	0x0118,	%g4
	brlz,a	%o4,	loop_2055
	movn	%xcc,	%l6,	%i5
	ldsh	[%l7 + 0x2C],	%g1
	edge8l	%o7,	%i4,	%o6
loop_2055:
	membar	0x66
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc2,	loop_2056
	fbu,a	%fcc0,	loop_2057
	orn	%l3,	%g7,	%l5
	fsrc2s	%f7,	%f15
loop_2056:
	tleu	%icc,	0x7
loop_2057:
	bneg,a,pn	%icc,	loop_2058
	smul	%l0,	%o5,	%o3
	fmovdgu	%icc,	%f13,	%f11
	fmovspos	%icc,	%f30,	%f1
loop_2058:
	nop
	set	0x50, %o1
	prefetch	[%l7 + %o1],	 0x0
	mulx	%i6,	%g3,	%o0
	fnors	%f23,	%f25,	%f16
	fornot2	%f8,	%f24,	%f10
	fcmpd	%fcc0,	%f20,	%f24
	movneg	%xcc,	%i1,	%i3
	brnz	%g5,	loop_2059
	fmovsg	%icc,	%f23,	%f8
	fcmped	%fcc2,	%f28,	%f0
	sdivcc	%o1,	0x08AA,	%i0
loop_2059:
	addccc	%l4,	0x18DB,	%l2
	fbul	%fcc2,	loop_2060
	tneg	%xcc,	0x4
	brlez,a	%g6,	loop_2061
	bl,a,pt	%xcc,	loop_2062
loop_2060:
	fmovdneg	%icc,	%f25,	%f18
	xnorcc	%i2,	%l1,	%g2
loop_2061:
	bge	loop_2063
loop_2062:
	orcc	%i7,	%o2,	%o4
	movne	%icc,	%g4,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2063:
	fand	%f22,	%f14,	%f2
	std	%g0,	[%l7 + 0x40]
	or	%i5,	%i4,	%o7
	fsrc1	%f10,	%f22
	fbne	%fcc0,	loop_2064
	movge	%xcc,	%l3,	%g7
	andn	%o6,	%l5,	%o5
	xnor	%l0,	%o3,	%g3
loop_2064:
	sllx	%o0,	0x08,	%i1
	nop
	setx	loop_2065,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%i6,	0x0F45,	%i3
	tge	%xcc,	0x3
	fbul	%fcc3,	loop_2066
loop_2065:
	movcc	%xcc,	%o1,	%i0
	fmovrse	%g5,	%f15,	%f29
	sllx	%l4,	0x05,	%l2
loop_2066:
	array16	%g6,	%l1,	%i2
	fmul8ulx16	%f8,	%f24,	%f8
	fzeros	%f9
	fbule,a	%fcc1,	loop_2067
	sll	%g2,	0x04,	%o2
	mova	%xcc,	%o4,	%i7
	edge8l	%g4,	%l6,	%i5
loop_2067:
	tle	%xcc,	0x4
	set	0x20, %l5
	stda	%g0,	[%l7 + %l5] 0x04
	orncc	%i4,	%l3,	%o7
	swap	[%l7 + 0x3C],	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g7,	%l5,	%l0
	array32	%o5,	%g3,	%o0
	addccc	%i1,	0x0049,	%i6
	nop
	setx loop_2068, %l0, %l1
	jmpl %l1, %i3
	sdiv	%o3,	0x0C59,	%i0
	fmovsleu	%icc,	%f13,	%f3
	tl	%icc,	0x6
loop_2068:
	orn	%o1,	%g5,	%l4
	fmovsn	%icc,	%f29,	%f31
	movne	%icc,	%g6,	%l2
	edge16ln	%l1,	%i2,	%o2
	brgez	%o4,	loop_2069
	srl	%i7,	0x1D,	%g4
	bn,a	%xcc,	loop_2070
	bvc,a	%icc,	loop_2071
loop_2069:
	fcmpne32	%f0,	%f2,	%g2
	fmovdneg	%icc,	%f22,	%f31
loop_2070:
	fone	%f30
loop_2071:
	subcc	%l6,	0x07FE,	%g1
	nop
	set	0x36, %o5
	lduh	[%l7 + %o5],	%i5
	tn	%icc,	0x5
	smul	%i4,	%l3,	%o6
	wr	%g0,	0x2f,	%asi
	stba	%g7,	[%l7 + 0x30] %asi
	membar	#Sync
	std	%f6,	[%l7 + 0x40]
	flush	%l7 + 0x2C
	movrgz	%l5,	0x053,	%l0
	edge8n	%o5,	%g3,	%o0
	edge32ln	%i1,	%o7,	%i6
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x5C] %asi,	%f10
	xorcc	%i3,	0x0807,	%i0
	array32	%o3,	%o1,	%l4
	fmul8x16al	%f14,	%f6,	%f28
	smulcc	%g6,	%l2,	%g5
	be,pn	%xcc,	loop_2072
	subcc	%l1,	%i2,	%o2
	pdist	%f6,	%f22,	%f14
	andncc	%o4,	%i7,	%g4
loop_2072:
	orcc	%l6,	%g2,	%g1
	movrgz	%i5,	%i4,	%l3
	ldsh	[%l7 + 0x56],	%o6
	or	%l5,	0x0482,	%g7
	fnot1	%f22,	%f8
	movrlez	%o5,	0x31E,	%g3
	subccc	%l0,	%i1,	%o7
	movvc	%icc,	%i6,	%i3
	tge	%xcc,	0x3
	set	0x18, %i0
	swapa	[%l7 + %i0] 0x11,	%o0
	fcmpgt32	%f22,	%f8,	%i0
	fnot1s	%f24,	%f27
	edge32ln	%o1,	%l4,	%g6
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x16
	membar	#Sync
	edge16ln	%o3,	%g5,	%l2
	bne,a,pn	%xcc,	loop_2073
	fmovdgu	%icc,	%f15,	%f15
	udivx	%l1,	0x1002,	%i2
	tg	%xcc,	0x2
loop_2073:
	subcc	%o2,	%i7,	%o4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x6C] %asi,	%f3
	bcs,pt	%xcc,	loop_2074
	nop
	setx loop_2075, %l0, %l1
	jmpl %l1, %l6
	fmovd	%f16,	%f0
	fbge	%fcc3,	loop_2076
loop_2074:
	tvs	%xcc,	0x2
loop_2075:
	smulcc	%g4,	%g2,	%g1
	or	%i5,	%l3,	%i4
loop_2076:
	fsrc2s	%f4,	%f15
	nop
	setx	loop_2077,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvc	%icc,	%o6,	%l5
	movgu	%icc,	%o5,	%g7
	fmovrde	%l0,	%f30,	%f6
loop_2077:
	movl	%icc,	%i1,	%o7
	sdivx	%i6,	0x0F35,	%i3
	fmuld8sux16	%f26,	%f7,	%f14
	bleu,pt	%icc,	loop_2078
	fpackfix	%f28,	%f6
	fbuge,a	%fcc3,	loop_2079
	addcc	%g3,	0x1BD3,	%i0
loop_2078:
	alignaddrl	%o1,	%o0,	%l4
	fble	%fcc1,	loop_2080
loop_2079:
	bvc,a	%icc,	loop_2081
	array8	%g6,	%g5,	%o3
	ldsh	[%l7 + 0x10],	%l2
loop_2080:
	nop
	set	0x6C, %i7
	stwa	%i2,	[%l7 + %i7] 0x2b
	membar	#Sync
loop_2081:
	tne	%icc,	0x3
	std	%f2,	[%l7 + 0x68]
	fmovsa	%icc,	%f16,	%f26
	tneg	%xcc,	0x7
	and	%l1,	%i7,	%o2
	ld	[%l7 + 0x18],	%f25
	udivcc	%l6,	0x0DB8,	%g4
	tvc	%icc,	0x4
	sth	%g2,	[%l7 + 0x74]
	ba,pt	%xcc,	loop_2082
	srlx	%g1,	0x02,	%o4
	fmovdgu	%icc,	%f14,	%f3
	addcc	%l3,	%i5,	%o6
loop_2082:
	movg	%xcc,	%i4,	%l5
	ldstub	[%l7 + 0x55],	%o5
	fble	%fcc0,	loop_2083
	umulcc	%l0,	%i1,	%o7
	fpack16	%f4,	%f1
	set	0x4C, %l0
	lduha	[%l7 + %l0] 0x04,	%i6
loop_2083:
	nop
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x46] %asi,	%i3
	move	%icc,	%g7,	%g3
	and	%i0,	0x0189,	%o1
	mulx	%o0,	%l4,	%g6
	xnorcc	%g5,	%o3,	%l2
	fbe	%fcc3,	loop_2084
	ldsb	[%l7 + 0x7C],	%i2
	movrne	%l1,	0x2BA,	%o2
	add	%l6,	%i7,	%g2
loop_2084:
	fabss	%f24,	%f7
	fmovrslz	%g4,	%f19,	%f21
	movleu	%xcc,	%g1,	%o4
	udiv	%l3,	0x09C8,	%o6
	movcc	%xcc,	%i5,	%l5
	fsrc2	%f24,	%f0
	edge16ln	%i4,	%l0,	%o5
	fpadd16	%f12,	%f10,	%f4
	ta	%icc,	0x6
	fxnors	%f31,	%f14,	%f7
	movvs	%xcc,	%o7,	%i6
	stw	%i3,	[%l7 + 0x3C]
	edge16ln	%g7,	%i1,	%g3
	fsrc2	%f24,	%f8
	subc	%o1,	0x0536,	%o0
	movvc	%icc,	%l4,	%g6
	sdiv	%g5,	0x100F,	%i0
	move	%icc,	%o3,	%l2
	array16	%i2,	%o2,	%l1
	and	%i7,	%g2,	%l6
	tgu	%icc,	0x5
	xor	%g1,	0x119B,	%g4
	fmovd	%f10,	%f8
	fmovrdgez	%o4,	%f20,	%f24
	fpadd16s	%f27,	%f4,	%f5
	tcs	%xcc,	0x4
	fcmple32	%f4,	%f12,	%o6
	st	%f25,	[%l7 + 0x40]
	tn	%icc,	0x0
	tvs	%icc,	0x5
	brlz	%l3,	loop_2085
	movrgz	%i5,	%i4,	%l0
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x58] %asi,	%o5
loop_2085:
	edge16	%o7,	%l5,	%i6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%g7
	brnz	%i3,	loop_2086
	fcmpeq32	%f10,	%f18,	%g3
	udivx	%i1,	0x069E,	%o0
	movle	%icc,	%o1,	%g6
loop_2086:
	bn	%xcc,	loop_2087
	tgu	%xcc,	0x7
	wr	%g0,	0x52,	%asi
	stxa	%g5,	[%g0 + 0x110] %asi
loop_2087:
	sir	0x08D3
	taddcctv	%l4,	0x0A12,	%o3
	movgu	%icc,	%i0,	%l2
	fors	%f0,	%f12,	%f17
	fble,a	%fcc0,	loop_2088
	edge8	%i2,	%o2,	%i7
	fbue,a	%fcc3,	loop_2089
	smulcc	%l1,	%l6,	%g1
loop_2088:
	stb	%g2,	[%l7 + 0x3C]
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x0C] %asi,	%o4
loop_2089:
	taddcc	%g4,	0x0360,	%o6
	alignaddrl	%l3,	%i5,	%l0
	movneg	%xcc,	%i4,	%o7
	fpadd16	%f20,	%f8,	%f18
	fbne,a	%fcc1,	loop_2090
	tsubcctv	%o5,	0x1E2F,	%l5
	addcc	%i6,	0x18F5,	%g7
	edge8ln	%i3,	%i1,	%g3
loop_2090:
	stbar
	srl	%o0,	0x04,	%o1
	movle	%xcc,	%g6,	%l4
	set	0x70, %o3
	lda	[%l7 + %o3] 0x04,	%f14
	tle	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o3,	0x120E,	%i0
	bge,a,pt	%xcc,	loop_2091
	fmovsn	%xcc,	%f25,	%f6
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x1f
	membar	#Sync
loop_2091:
	taddcctv	%g5,	%i2,	%o2
	array32	%l2,	%i7,	%l6
	brgez,a	%l1,	loop_2092
	sll	%g2,	%g1,	%g4
	edge8ln	%o4,	%l3,	%i5
	addcc	%l0,	0x0B5F,	%o6
loop_2092:
	movgu	%xcc,	%i4,	%o7
	edge32n	%l5,	%o5,	%g7
	andncc	%i6,	%i3,	%i1
	tleu	%xcc,	0x7
	fmovrdlez	%g3,	%f14,	%f16
	fcmps	%fcc2,	%f16,	%f27
	move	%xcc,	%o1,	%o0
	sethi	0x05B3,	%g6
	taddcctv	%l4,	0x0A40,	%i0
	bgu	%xcc,	loop_2093
	and	%o3,	0x1211,	%g5
	movgu	%icc,	%i2,	%l2
	move	%icc,	%o2,	%l6
loop_2093:
	andcc	%l1,	%i7,	%g1
	movrgez	%g2,	%g4,	%l3
	srlx	%o4,	0x1E,	%l0
	movrlz	%o6,	%i4,	%o7
	fbg,a	%fcc2,	loop_2094
	taddcctv	%l5,	%o5,	%g7
	edge8	%i5,	%i6,	%i1
	fand	%f24,	%f26,	%f8
loop_2094:
	edge32l	%g3,	%i3,	%o1
	bleu,a,pn	%xcc,	loop_2095
	tsubcctv	%o0,	0x141E,	%l4
	fmovse	%xcc,	%f15,	%f5
	movn	%xcc,	%i0,	%g6
loop_2095:
	tleu	%xcc,	0x0
	fpadd32s	%f30,	%f10,	%f17
	fnors	%f14,	%f29,	%f24
	edge16n	%o3,	%g5,	%i2
	mova	%icc,	%l2,	%o2
	edge16n	%l1,	%i7,	%l6
	bpos,a,pt	%xcc,	loop_2096
	fmovdcs	%xcc,	%f26,	%f13
	andn	%g2,	0x09F5,	%g1
	fbule	%fcc0,	loop_2097
loop_2096:
	andn	%l3,	0x0BFC,	%g4
	orncc	%o4,	%l0,	%o6
	fandnot1	%f20,	%f24,	%f10
loop_2097:
	movrgz	%i4,	0x0E1,	%l5
	stx	%o5,	[%l7 + 0x68]
	std	%g6,	[%l7 + 0x58]
	edge8n	%i5,	%o7,	%i6
	nop
	setx loop_2098, %l0, %l1
	jmpl %l1, %i1
	edge32ln	%i3,	%o1,	%g3
	movvc	%xcc,	%l4,	%i0
	fmovdcc	%icc,	%f11,	%f30
loop_2098:
	orcc	%o0,	0x0480,	%o3
	mulx	%g5,	0x0396,	%i2
	sra	%l2,	0x11,	%o2
	edge16l	%g6,	%i7,	%l1
	movle	%icc,	%l6,	%g1
	tne	%xcc,	0x7
	movcs	%icc,	%g2,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x1
	call	loop_2099
	movleu	%icc,	%l3,	%o4
	movge	%xcc,	%o6,	%l0
	movge	%icc,	%i4,	%l5
loop_2099:
	tgu	%xcc,	0x0
	tl	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%o5
	bn,a	%icc,	loop_2100
	move	%xcc,	%g7,	%i5
	sth	%i6,	[%l7 + 0x7A]
	fmovdn	%xcc,	%f18,	%f6
loop_2100:
	tleu	%xcc,	0x1
	movvc	%xcc,	%o7,	%i1
	edge8n	%o1,	%i3,	%l4
	edge8	%g3,	%i0,	%o0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	fmovd	%f6,	%f26
	prefetch	[%l7 + 0x10],	 0x2
	fors	%f12,	%f12,	%f17
	fba	%fcc1,	loop_2101
	movcc	%xcc,	%i2,	%l2
	srax	%o2,	%g5,	%i7
	nop
	setx	loop_2102,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2101:
	fcmpgt16	%f2,	%f18,	%l1
	movrne	%g6,	0x084,	%g1
	wr	%g0,	0x80,	%asi
	stda	%i6,	[%l7 + 0x18] %asi
loop_2102:
	fpadd16	%f24,	%f14,	%f24
	sethi	0x03FC,	%g4
	for	%f10,	%f2,	%f6
	tle	%xcc,	0x3
	fcmpes	%fcc3,	%f21,	%f17
	tvc	%xcc,	0x5
	xnor	%g2,	0x0DED,	%l3
	tg	%icc,	0x7
	movvs	%xcc,	%o4,	%l0
	addcc	%i4,	%l5,	%o6
	set	0x1C, %g4
	ldsha	[%l7 + %g4] 0x88,	%o5
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x48] %asi,	%f15
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x68] %asi,	%i5
	fcmpne16	%f0,	%f14,	%i6
	faligndata	%f10,	%f22,	%f22
	set	0x6C, %g2
	stwa	%o7,	[%l7 + %g2] 0x2a
	membar	#Sync
	sll	%g7,	%o1,	%i1
	movg	%icc,	%l4,	%i3
	xnorcc	%g3,	%i0,	%o0
	fcmpne32	%f28,	%f12,	%i2
	array16	%o3,	%o2,	%l2
	bgu,a	loop_2103
	edge8l	%g5,	%i7,	%g6
	tneg	%icc,	0x1
	prefetch	[%l7 + 0x68],	 0x2
loop_2103:
	movleu	%xcc,	%g1,	%l6
	edge32n	%g4,	%g2,	%l1
	movge	%icc,	%o4,	%l3
	ldsb	[%l7 + 0x57],	%i4
	movrlz	%l0,	0x383,	%l5
	addccc	%o5,	%o6,	%i5
	fabsd	%f6,	%f2
	movne	%xcc,	%i6,	%g7
	fbge	%fcc3,	loop_2104
	fpmerge	%f28,	%f20,	%f0
	fmovdleu	%xcc,	%f0,	%f26
	or	%o1,	0x06E5,	%i1
loop_2104:
	fornot1	%f16,	%f20,	%f26
	movcc	%icc,	%l4,	%i3
	fcmpd	%fcc0,	%f8,	%f16
	nop
	setx loop_2105, %l0, %l1
	jmpl %l1, %o7
	ldd	[%l7 + 0x30],	%i0
	fblg,a	%fcc2,	loop_2106
	movre	%o0,	0x2C8,	%i2
loop_2105:
	fnot2	%f16,	%f4
	fcmpd	%fcc0,	%f12,	%f30
loop_2106:
	fcmpeq32	%f6,	%f28,	%o3
	fcmpes	%fcc1,	%f21,	%f14
	brgez	%g3,	loop_2107
	tne	%xcc,	0x6
	fpsub16	%f8,	%f2,	%f18
	fbn,a	%fcc2,	loop_2108
loop_2107:
	bneg,a	loop_2109
	tl	%icc,	0x6
	fmovrsgz	%o2,	%f29,	%f2
loop_2108:
	fors	%f7,	%f21,	%f7
loop_2109:
	add	%l2,	0x175F,	%g5
	sub	%i7,	%g6,	%l6
	fmovrdlez	%g4,	%f0,	%f2
	std	%g2,	[%l7 + 0x60]
	xor	%g1,	0x171A,	%o4
	bn	loop_2110
	fmuld8ulx16	%f31,	%f11,	%f16
	sdivcc	%l1,	0x0E05,	%l3
	umulcc	%l0,	%l5,	%o5
loop_2110:
	fbl	%fcc0,	loop_2111
	brgz	%o6,	loop_2112
	fnands	%f11,	%f19,	%f15
	bl	loop_2113
loop_2111:
	tge	%icc,	0x4
loop_2112:
	bgu,pt	%xcc,	loop_2114
	movvc	%xcc,	%i5,	%i6
loop_2113:
	srax	%g7,	0x07,	%i4
	edge32ln	%i1,	%l4,	%i3
loop_2114:
	edge32n	%o1,	%i0,	%o0
	movre	%i2,	0x0E5,	%o3
	tsubcctv	%g3,	%o7,	%o2
	movrlz	%l2,	0x2E8,	%g5
	srax	%i7,	%g6,	%g4
	taddcc	%g2,	0x1539,	%l6
	mulscc	%g1,	%o4,	%l3
	edge8ln	%l1,	%l0,	%l5
	fmovrde	%o5,	%f18,	%f16
	movcs	%xcc,	%o6,	%i5
	fcmpne32	%f22,	%f4,	%g7
	bn,pn	%xcc,	loop_2115
	fmovscc	%icc,	%f15,	%f3
	fmovdne	%icc,	%f17,	%f3
	fmul8sux16	%f8,	%f22,	%f16
loop_2115:
	call	loop_2116
	fmovdn	%xcc,	%f11,	%f31
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2116:
	xnor	%i6,	0x108F,	%i1
	set	0x64, %i6
	lduba	[%l7 + %i6] 0x81,	%l4
	ta	%xcc,	0x3
	movvc	%icc,	%i3,	%i4
	udivx	%o1,	0x0126,	%o0
	fmovdcc	%xcc,	%f6,	%f29
	edge8l	%i2,	%i0,	%o3
	sdivx	%o7,	0x19B2,	%o2
	edge16n	%g3,	%l2,	%g5
	fmovda	%icc,	%f25,	%f19
	addcc	%g6,	%i7,	%g2
	fone	%f12
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x48] %asi,	%g4
	movvs	%xcc,	%l6,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f31,	%f17,	%f9
	fors	%f25,	%f10,	%f22
	st	%f30,	[%l7 + 0x14]
	brlez,a	%l3,	loop_2117
	fmovrdlz	%o4,	%f24,	%f10
	or	%l1,	0x0B72,	%l0
	fxnors	%f14,	%f23,	%f23
loop_2117:
	fpadd32	%f20,	%f20,	%f22
	fmovse	%xcc,	%f5,	%f25
	movrlez	%l5,	0x27B,	%o6
	set	0x20, %i4
	ldda	[%l7 + %i4] 0x80,	%o4
	sir	0x06E8
	smul	%g7,	%i5,	%i1
	subc	%i6,	%l4,	%i4
	xnor	%i3,	%o1,	%i2
	edge16ln	%i0,	%o0,	%o3
	fors	%f8,	%f12,	%f31
	tgu	%icc,	0x0
	fbuge,a	%fcc2,	loop_2118
	movrgz	%o2,	%o7,	%l2
	fmovsg	%xcc,	%f9,	%f25
	brgez	%g5,	loop_2119
loop_2118:
	edge8n	%g6,	%i7,	%g2
	fnot2	%f16,	%f16
	fmovs	%f15,	%f13
loop_2119:
	array8	%g3,	%g4,	%l6
	brlz,a	%l3,	loop_2120
	edge8n	%g1,	%o4,	%l0
	ld	[%l7 + 0x34],	%f31
	edge16n	%l1,	%l5,	%o6
loop_2120:
	udiv	%g7,	0x017E,	%o5
	udiv	%i5,	0x0878,	%i6
	fornot2	%f20,	%f12,	%f26
	edge32ln	%l4,	%i4,	%i1
	andncc	%o1,	%i3,	%i2
	bcs	loop_2121
	sdivx	%i0,	0x0B85,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x6A] %asi,	%o3
loop_2121:
	fble,a	%fcc3,	loop_2122
	tcs	%icc,	0x3
	sub	%o2,	0x03AB,	%l2
	ta	%xcc,	0x7
loop_2122:
	mulscc	%o7,	%g5,	%i7
	addcc	%g6,	0x1014,	%g2
	subccc	%g3,	%l6,	%l3
	set	0x20, %l6
	ldda	[%l7 + %l6] 0x19,	%g0
	and	%g4,	%l0,	%l1
	movcs	%xcc,	%l5,	%o6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x58] %asi,	%o4
	sll	%g7,	%o5,	%i6
	xnorcc	%i5,	%i4,	%l4
	xnor	%o1,	%i1,	%i3
	movrgez	%i0,	%i2,	%o3
	edge8	%o2,	%o0,	%l2
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	sdiv	%o7,	0x179C,	%g5
	fpsub16	%f30,	%f6,	%f8
	and	%g6,	%i7,	%g2
	fmovsle	%xcc,	%f3,	%f3
	ble,a,pn	%xcc,	loop_2123
	fnot2s	%f10,	%f6
	movre	%g3,	%l6,	%g1
	fmovsleu	%icc,	%f8,	%f2
loop_2123:
	sir	0x0B6D
	ldd	[%l7 + 0x48],	%g4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%l1
	fba,a	%fcc0,	loop_2124
	edge32	%l3,	%o6,	%o4
	lduw	[%l7 + 0x1C],	%g7
	edge16n	%o5,	%l5,	%i6
loop_2124:
	array8	%i5,	%l4,	%i4
	sir	0x0031
	move	%icc,	%i1,	%i3
	ldd	[%l7 + 0x10],	%o0
	ta	%xcc,	0x6
	ba	%xcc,	loop_2125
	smul	%i2,	%o3,	%o2
	bgu,a,pt	%icc,	loop_2126
	umul	%o0,	%l2,	%o7
loop_2125:
	fcmpgt16	%f16,	%f24,	%i0
	bgu	loop_2127
loop_2126:
	andncc	%g5,	%i7,	%g2
	fmovde	%icc,	%f26,	%f4
	movvs	%xcc,	%g6,	%g3
loop_2127:
	fmovsne	%icc,	%f5,	%f26
	fzero	%f28
	tl	%icc,	0x6
	movpos	%xcc,	%l6,	%g1
	fmul8sux16	%f12,	%f6,	%f14
	sir	0x198E
	mulx	%l0,	%g4,	%l3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x4E] %asi,	%o6
	orncc	%o4,	0x1E6E,	%g7
	umul	%l1,	0x1F10,	%l5
	fbo,a	%fcc3,	loop_2128
	movrlz	%i6,	0x1D1,	%o5
	set	0x4C, %g5
	ldstuba	[%l7 + %g5] 0x04,	%i5
loop_2128:
	xnorcc	%i4,	0x03C3,	%i1
	xnorcc	%l4,	0x07B7,	%o1
	orn	%i3,	%o3,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%o0,	%o2
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x53] %asi,	%l2
	movcc	%icc,	%o7,	%g5
	tn	%icc,	0x3
	udiv	%i0,	0x01A7,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i7,	%g3
	fble	%fcc2,	loop_2129
	movvs	%xcc,	%g6,	%l6
	ld	[%l7 + 0x54],	%f13
	alignaddr	%l0,	%g1,	%g4
loop_2129:
	sdivcc	%l3,	0x151C,	%o6
	tle	%xcc,	0x3
	tg	%icc,	0x6
	ldx	[%l7 + 0x78],	%g7
	andn	%o4,	0x17E5,	%l1
	addcc	%l5,	0x0166,	%o5
	bvs,pn	%icc,	loop_2130
	mulscc	%i5,	0x01BF,	%i6
	fmovdgu	%xcc,	%f31,	%f9
	fmovrdne	%i4,	%f8,	%f8
loop_2130:
	bgu,a	%xcc,	loop_2131
	fmovsa	%xcc,	%f0,	%f17
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f14,	%f26
loop_2131:
	bneg,pt	%xcc,	loop_2132
	ldsb	[%l7 + 0x0A],	%l4
	movcc	%icc,	%o1,	%i1
	andcc	%i3,	0x08E4,	%o3
loop_2132:
	srlx	%o0,	0x1C,	%i2
	set	0x48, %l3
	lduha	[%l7 + %l3] 0x10,	%l2
	fxnors	%f0,	%f9,	%f5
	fabsd	%f16,	%f30
	fones	%f14
	tleu	%icc,	0x4
	edge16ln	%o2,	%g5,	%i0
	tne	%icc,	0x5
	set	0x68, %i3
	prefetcha	[%l7 + %i3] 0x81,	 0x1
	movvs	%icc,	%g2,	%i7
	andn	%g3,	%l6,	%g6
	brlz	%l0,	loop_2133
	fornot1s	%f22,	%f21,	%f27
	nop
	set	0x64, %o2
	prefetch	[%l7 + %o2],	 0x3
	edge16l	%g1,	%l3,	%o6
loop_2133:
	andcc	%g7,	%g4,	%o4
	fbul	%fcc0,	loop_2134
	sdivx	%l1,	0x15FC,	%l5
	fpadd16	%f18,	%f12,	%f6
	std	%f26,	[%l7 + 0x28]
loop_2134:
	fmovdg	%icc,	%f22,	%f17
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
	tsubcc	%i5,	%i4,	%l4
	addc	%i6,	%i1,	%o1
	set	0x5D, %o6
	ldstuba	[%l7 + %o6] 0x10,	%o3
	xnorcc	%i3,	%o0,	%l2
	fpsub32	%f30,	%f12,	%f10
	fxor	%f8,	%f28,	%f12
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x64] %asi,	%i2
	fmovdvc	%icc,	%f12,	%f23
	movrgz	%o2,	0x023,	%i0
	tvc	%xcc,	0x4
	edge32ln	%g5,	%o7,	%i7
	mova	%icc,	%g3,	%g2
	addc	%g6,	%l6,	%l0
	movleu	%xcc,	%l3,	%g1
	bneg,a	%xcc,	loop_2135
	movrlez	%o6,	%g4,	%o4
	fpmerge	%f16,	%f9,	%f10
	fornot1	%f22,	%f6,	%f20
loop_2135:
	andn	%l1,	%g7,	%l5
	subcc	%i5,	%i4,	%l4
	fbn,a	%fcc3,	loop_2136
	edge16ln	%i6,	%i1,	%o5
	fmovrdne	%o1,	%f18,	%f16
	array32	%o3,	%o0,	%i3
loop_2136:
	for	%f10,	%f14,	%f26
	ld	[%l7 + 0x28],	%f22
	movge	%xcc,	%i2,	%l2
	udivcc	%o2,	0x187E,	%g5
	prefetch	[%l7 + 0x10],	 0x2
	tge	%xcc,	0x6
	tne	%icc,	0x0
	udivx	%i0,	0x0C22,	%i7
	andcc	%g3,	%g2,	%o7
	move	%icc,	%g6,	%l6
	alignaddrl	%l0,	%g1,	%l3
	edge16n	%g4,	%o6,	%l1
	popc	0x0411,	%g7
	edge16l	%o4,	%i5,	%i4
	fmul8sux16	%f10,	%f2,	%f8
	tcc	%xcc,	0x4
	st	%f3,	[%l7 + 0x38]
	movge	%xcc,	%l4,	%i6
	smul	%l5,	0x10E6,	%o5
	tle	%icc,	0x3
	movneg	%xcc,	%i1,	%o3
	std	%o0,	[%l7 + 0x68]
	edge32ln	%o1,	%i3,	%i2
	fmovscs	%icc,	%f8,	%f7
	be,a,pn	%xcc,	loop_2137
	brgez,a	%o2,	loop_2138
	movne	%icc,	%g5,	%i0
	brnz	%i7,	loop_2139
loop_2137:
	movge	%xcc,	%l2,	%g3
loop_2138:
	andcc	%g2,	%o7,	%l6
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x15,	%f16
loop_2139:
	fcmpgt32	%f16,	%f2,	%g6
	mova	%xcc,	%l0,	%l3
	stx	%g1,	[%l7 + 0x70]
	orn	%o6,	%g4,	%l1
	bcc,pn	%xcc,	loop_2140
	bge	%icc,	loop_2141
	edge32n	%o4,	%i5,	%i4
	array8	%g7,	%l4,	%i6
loop_2140:
	smulcc	%o5,	%l5,	%i1
loop_2141:
	sethi	0x138C,	%o3
	flush	%l7 + 0x70
	movgu	%xcc,	%o0,	%o1
	edge8n	%i3,	%o2,	%i2
	movre	%g5,	0x1AC,	%i0
	andn	%i7,	%g3,	%g2
	fmovspos	%xcc,	%f16,	%f25
	fpsub32s	%f19,	%f29,	%f20
	be,pn	%icc,	loop_2142
	bcs,pn	%xcc,	loop_2143
	tleu	%icc,	0x1
	fmovscc	%xcc,	%f12,	%f7
loop_2142:
	movge	%icc,	%o7,	%l6
loop_2143:
	subc	%l2,	%g6,	%l0
	edge16l	%g1,	%l3,	%o6
	tcs	%xcc,	0x3
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x88
	mulscc	%g4,	%l1,	%i5
	addccc	%i4,	%g7,	%o4
	bneg	%icc,	loop_2144
	bvc	%icc,	loop_2145
	tcc	%icc,	0x7
	smul	%i6,	0x1AE9,	%o5
loop_2144:
	movrgez	%l5,	0x2A4,	%i1
loop_2145:
	fmul8x16	%f16,	%f30,	%f22
	nop
	setx loop_2146, %l0, %l1
	jmpl %l1, %l4
	addcc	%o3,	%o0,	%o1
	tsubcctv	%i3,	0x1718,	%i2
	lduh	[%l7 + 0x24],	%o2
loop_2146:
	brgz	%i0,	loop_2147
	fmovsleu	%xcc,	%f5,	%f27
	wr	%g0,	0x2b,	%asi
	stba	%g5,	[%l7 + 0x3D] %asi
	membar	#Sync
loop_2147:
	sethi	0x14FE,	%i7
	fmovsne	%icc,	%f24,	%f27
	tcc	%icc,	0x5
	stbar
	brgez,a	%g2,	loop_2148
	edge32ln	%g3,	%l6,	%o7
	fmovdleu	%icc,	%f1,	%f15
	fbue,a	%fcc0,	loop_2149
loop_2148:
	std	%l2,	[%l7 + 0x28]
	add	%l0,	0x1F02,	%g1
	tvc	%icc,	0x6
loop_2149:
	edge16	%l3,	%g6,	%o6
	udivx	%g4,	0x1B37,	%l1
	umul	%i4,	%i5,	%g7
	andncc	%i6,	%o5,	%l5
	fmovdpos	%icc,	%f22,	%f20
	or	%i1,	%l4,	%o4
	fandnot2s	%f11,	%f26,	%f3
	sth	%o0,	[%l7 + 0x1C]
	sir	0x0293
	umul	%o3,	%o1,	%i2
	fcmpes	%fcc0,	%f25,	%f28
	swap	[%l7 + 0x30],	%i3
	taddcctv	%o2,	%g5,	%i7
	fba,a	%fcc1,	loop_2150
	fandnot2s	%f21,	%f6,	%f20
	fcmpne16	%f0,	%f18,	%g2
	edge8l	%i0,	%l6,	%g3
loop_2150:
	orcc	%l2,	%o7,	%l0
	subcc	%g1,	%g6,	%l3
	fandnot1	%f20,	%f28,	%f8
	tneg	%xcc,	0x2
	fmul8x16au	%f29,	%f5,	%f30
	udiv	%g4,	0x087D,	%o6
	orncc	%i4,	%l1,	%i5
	edge16n	%g7,	%o5,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%i6
	brlez,a	%i1,	loop_2151
	srax	%o4,	0x09,	%l4
	movvs	%xcc,	%o0,	%o1
	mulx	%o3,	%i2,	%i3
loop_2151:
	fmovrslez	%g5,	%f10,	%f11
	sir	0x1FD0
	sll	%i7,	%g2,	%i0
	ldub	[%l7 + 0x48],	%l6
	fmovdvc	%xcc,	%f31,	%f12
	udiv	%g3,	0x17CF,	%l2
	fmovdl	%xcc,	%f30,	%f27
	fmuld8sux16	%f17,	%f21,	%f16
	fnot2	%f28,	%f20
	movvc	%xcc,	%o2,	%l0
	fornot1	%f28,	%f12,	%f24
	fmul8ulx16	%f16,	%f28,	%f26
	edge8ln	%g1,	%o7,	%l3
	set	0x18, %l1
	prefetcha	[%l7 + %l1] 0x0c,	 0x2
	pdist	%f16,	%f8,	%f12
	array16	%g6,	%i4,	%o6
	nop
	setx loop_2152, %l0, %l1
	jmpl %l1, %l1
	and	%i5,	%g7,	%o5
	sdiv	%l5,	0x1490,	%i1
	fxor	%f20,	%f10,	%f6
loop_2152:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x04,	%o4,	%i6
	tcs	%icc,	0x5
	array16	%o0,	%l4,	%o1
	orn	%o3,	%i3,	%i2
	xnor	%i7,	0x0318,	%g5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%i0,	%g2
	stw	%l6,	[%l7 + 0x40]
	tle	%icc,	0x5
	tvc	%icc,	0x4
	fnegs	%f31,	%f23
	fcmple16	%f22,	%f4,	%g3
	brnz,a	%o2,	loop_2153
	ldd	[%l7 + 0x58],	%l2
	set	0x10, %g1
	ldswa	[%l7 + %g1] 0x89,	%l0
loop_2153:
	fmul8x16au	%f9,	%f8,	%f4
	sllx	%o7,	%l3,	%g1
	movg	%xcc,	%g4,	%i4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o6
	tle	%xcc,	0x7
	sra	%l1,	0x1C,	%i5
	edge32	%g6,	%g7,	%l5
	sra	%i1,	0x17,	%o4
	movleu	%icc,	%i6,	%o5
	tgu	%xcc,	0x1
	addcc	%l4,	%o1,	%o0
	tl	%icc,	0x5
	movn	%xcc,	%i3,	%i2
	sir	0x04AB
	tcc	%xcc,	0x7
	alignaddr	%i7,	%g5,	%i0
	edge8n	%g2,	%l6,	%g3
	nop
	set	0x2A, %g3
	sth	%o2,	[%l7 + %g3]
	edge16n	%o3,	%l2,	%l0
	movre	%l3,	0x010,	%g1
	fmovdleu	%xcc,	%f21,	%f30
	ba,pt	%xcc,	loop_2154
	addc	%o7,	%g4,	%i4
	tsubcc	%l1,	0x09F9,	%i5
	sll	%g6,	%o6,	%g7
loop_2154:
	edge8n	%l5,	%o4,	%i1
	ldsb	[%l7 + 0x10],	%o5
	and	%i6,	0x037E,	%o1
	set	0x30, %i1
	prefetcha	[%l7 + %i1] 0x15,	 0x3
	fmovse	%xcc,	%f14,	%f1
	fnegd	%f2,	%f12
	umulcc	%i3,	0x0385,	%i2
	movle	%xcc,	%l4,	%g5
	fmovrdgz	%i7,	%f22,	%f6
	or	%i0,	%g2,	%l6
	set	0x18, %g6
	stda	%o2,	[%l7 + %g6] 0x80
	wr	%g0,	0x10,	%asi
	sta	%f8,	[%l7 + 0x7C] %asi
	sethi	0x10A1,	%g3
	sir	0x1376
	orn	%l2,	%l0,	%o3
	umulcc	%g1,	0x11EC,	%o7
	brz	%l3,	loop_2155
	fnands	%f22,	%f3,	%f5
	tge	%icc,	0x0
	fornot2	%f6,	%f2,	%f18
loop_2155:
	fcmpgt32	%f8,	%f8,	%i4
	sllx	%l1,	%i5,	%g6
	tne	%xcc,	0x7
	srlx	%o6,	%g4,	%g7
	siam	0x7
	edge8	%o4,	%i1,	%o5
	movre	%i6,	0x25F,	%o1
	tcc	%xcc,	0x5
	fandnot1	%f18,	%f2,	%f2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%i3
	fbul,a	%fcc3,	loop_2156
	fmovrslez	%o0,	%f10,	%f23
	fmovscs	%icc,	%f4,	%f1
	movg	%xcc,	%l4,	%i2
loop_2156:
	bge	%xcc,	loop_2157
	alignaddrl	%i7,	%g5,	%i0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l6,	%o2
loop_2157:
	fmovrsgz	%g2,	%f2,	%f20
	ldstub	[%l7 + 0x60],	%g3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%o3
	movleu	%xcc,	%l0,	%o7
	popc	0x0C07,	%l3
	fbne,a	%fcc3,	loop_2158
	fmovse	%icc,	%f13,	%f0
	fmovdn	%icc,	%f12,	%f7
	udiv	%i4,	0x0F88,	%l1
loop_2158:
	fmovscc	%xcc,	%f26,	%f17
	lduh	[%l7 + 0x2C],	%g1
	xnorcc	%g6,	%o6,	%i5
	edge16	%g7,	%o4,	%i1
	bpos,pt	%xcc,	loop_2159
	fmovrdgez	%g4,	%f30,	%f8
	ble	loop_2160
	fsrc2s	%f4,	%f31
loop_2159:
	tl	%xcc,	0x5
	fnand	%f4,	%f6,	%f18
loop_2160:
	swap	[%l7 + 0x68],	%o5
	st	%f2,	[%l7 + 0x34]
	prefetch	[%l7 + 0x3C],	 0x1
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%o1
	fpadd32	%f8,	%f16,	%f26
	tgu	%xcc,	0x3
	nop
	set	0x31, %o0
	ldstub	[%l7 + %o0],	%l5
	for	%f24,	%f6,	%f2
	sll	%i3,	%o0,	%i6
	orn	%i2,	%l4,	%g5
	brnz	%i7,	loop_2161
	brgez,a	%l6,	loop_2162
	tvc	%icc,	0x4
	fmovdpos	%icc,	%f23,	%f29
loop_2161:
	and	%i0,	0x0516,	%g2
loop_2162:
	sethi	0x18D1,	%o2
	fmovda	%xcc,	%f8,	%f28
	sdivx	%g3,	0x189D,	%o3
	umul	%l0,	%l2,	%l3
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x1f
	membar	#Sync
	bl,a,pt	%icc,	loop_2163
	bvs,a,pn	%icc,	loop_2164
	fsrc1s	%f9,	%f25
	fornot1s	%f4,	%f9,	%f7
loop_2163:
	nop
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2164:
	edge16l	%i4,	%o7,	%g1
	brgez,a	%g6,	loop_2165
	movrgez	%l1,	%o6,	%g7
	stx	%o4,	[%l7 + 0x10]
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
loop_2165:
	fmovsa	%icc,	%f13,	%f17
	bne,a,pt	%xcc,	loop_2166
	ldx	[%l7 + 0x10],	%i5
	fmovsle	%icc,	%f27,	%f18
	tpos	%icc,	0x1
loop_2166:
	srl	%g4,	%o5,	%o1
	fbn,a	%fcc3,	loop_2167
	stx	%i3,	[%l7 + 0x30]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%l5,	%o0
loop_2167:
	tsubcctv	%i6,	%l4,	%g5
	fmovsn	%icc,	%f7,	%f13
	udivcc	%i7,	0x024B,	%i2
	fbo,a	%fcc0,	loop_2168
	xnor	%l6,	%i0,	%g2
	bvc,pn	%xcc,	loop_2169
	alignaddr	%g3,	%o2,	%o3
loop_2168:
	brgez	%l0,	loop_2170
	tvs	%icc,	0x3
loop_2169:
	edge8l	%l3,	%l2,	%o7
	nop
	setx loop_2171, %l0, %l1
	jmpl %l1, %i4
loop_2170:
	fble,a	%fcc0,	loop_2172
	xorcc	%g6,	0x0531,	%l1
	set	0x13, %g7
	ldsba	[%l7 + %g7] 0x10,	%g1
loop_2171:
	sub	%g7,	0x1A1F,	%o4
loop_2172:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i1,	%o6
	wr	%g0,	0x2b,	%asi
	stba	%g4,	[%l7 + 0x50] %asi
	membar	#Sync
	fbo,a	%fcc3,	loop_2173
	and	%o5,	%o1,	%i3
	tge	%xcc,	0x5
	fmul8ulx16	%f6,	%f6,	%f18
loop_2173:
	edge8ln	%i5,	%l5,	%i6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x40] %asi,	%o0
	sub	%l4,	0x0E45,	%g5
	bn,a,pt	%icc,	loop_2174
	xnorcc	%i7,	0x0995,	%l6
	fornot1s	%f7,	%f1,	%f31
	fmuld8ulx16	%f1,	%f16,	%f6
loop_2174:
	tcc	%xcc,	0x4
	mulx	%i2,	0x0D2E,	%g2
	edge16	%g3,	%o2,	%o3
	std	%f26,	[%l7 + 0x48]
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x20] %asi,	%l0
	fbe,a	%fcc0,	loop_2175
	srlx	%i0,	0x08,	%l2
	bl,pt	%xcc,	loop_2176
	tleu	%icc,	0x6
loop_2175:
	fmovsne	%icc,	%f4,	%f3
	movrgz	%l3,	%i4,	%g6
loop_2176:
	bl,pt	%xcc,	loop_2177
	srlx	%o7,	%l1,	%g1
	ldstub	[%l7 + 0x0E],	%o4
	movn	%icc,	%i1,	%g7
loop_2177:
	fmovsge	%xcc,	%f9,	%f0
	fpadd16s	%f20,	%f28,	%f11
	sub	%g4,	0x0110,	%o6
	subccc	%o1,	0x0061,	%o5
	tge	%icc,	0x4
	array8	%i3,	%i5,	%l5
	swap	[%l7 + 0x08],	%i6
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x24] %asi,	%o0
	ldsh	[%l7 + 0x14],	%g5
	edge8l	%i7,	%l4,	%l6
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x2e,	%i2
	fmovrsne	%g2,	%f30,	%f29
	fpadd32s	%f10,	%f6,	%f28
	addc	%g3,	%o3,	%o2
	fmovdvs	%xcc,	%f26,	%f23
	bneg	%xcc,	loop_2178
	std	%i0,	[%l7 + 0x48]
	bpos,pt	%icc,	loop_2179
	andn	%l0,	0x0C1A,	%l2
loop_2178:
	tgu	%icc,	0x3
	nop
	set	0x28, %l5
	lduh	[%l7 + %l5],	%l3
loop_2179:
	brgz,a	%i4,	loop_2180
	bcs	%icc,	loop_2181
	movl	%xcc,	%o7,	%l1
	tle	%icc,	0x6
loop_2180:
	tg	%icc,	0x3
loop_2181:
	tvs	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x78] %asi,	%g1
	te	%xcc,	0x0
	fnor	%f18,	%f0,	%f26
	movle	%icc,	%o4,	%g6
	addccc	%g7,	%i1,	%g4
	movl	%icc,	%o1,	%o5
	bgu,a,pt	%xcc,	loop_2182
	sir	0x103B
	brlz	%o6,	loop_2183
	andn	%i5,	0x133E,	%l5
loop_2182:
	tcs	%icc,	0x1
	tneg	%xcc,	0x1
loop_2183:
	tsubcc	%i6,	%o0,	%i3
	sdivcc	%i7,	0x154B,	%l4
	srax	%l6,	0x09,	%g5
	edge8n	%i2,	%g3,	%g2
	set	0x50, %l2
	ldda	[%l7 + %l2] 0x27,	%o2
	fcmple16	%f6,	%f28,	%i0
	tle	%icc,	0x1
	array32	%o2,	%l0,	%l3
	nop
	setx	loop_2184,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smul	%i4,	%l2,	%o7
	call	loop_2185
	fpadd32	%f20,	%f0,	%f2
loop_2184:
	bvs,pn	%icc,	loop_2186
	movneg	%icc,	%g1,	%o4
loop_2185:
	nop
	set	0x74, %o5
	ldsba	[%l7 + %o5] 0x14,	%l1
loop_2186:
	xnorcc	%g6,	0x10C0,	%g7
	edge16l	%g4,	%i1,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f28,	%f1
	fbul,a	%fcc0,	loop_2187
	fmovsle	%icc,	%f26,	%f17
	stx	%o5,	[%l7 + 0x18]
	tvc	%icc,	0x1
loop_2187:
	srl	%o6,	0x1E,	%l5
	brgez	%i6,	loop_2188
	udivx	%o0,	0x1A0A,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i7,	0x0591,	%i5
loop_2188:
	fandnot2	%f6,	%f0,	%f6
	array8	%l6,	%l4,	%i2
	wr	%g0,	0x81,	%asi
	stwa	%g5,	[%l7 + 0x18] %asi
	fmovdl	%xcc,	%f10,	%f4
	bl,pn	%xcc,	loop_2189
	smul	%g2,	%o3,	%g3
	fands	%f30,	%f24,	%f20
	fmovsne	%icc,	%f6,	%f9
loop_2189:
	edge32l	%o2,	%l0,	%i0
	brlz	%l3,	loop_2190
	fmul8sux16	%f8,	%f12,	%f18
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2190:
	tg	%icc,	0x6
	for	%f24,	%f2,	%f10
	andncc	%i4,	%o7,	%g1
	edge8n	%l2,	%l1,	%g6
	set	0x52, %i5
	ldsha	[%l7 + %i5] 0x11,	%o4
	brz,a	%g4,	loop_2191
	movg	%xcc,	%g7,	%i1
	be,pt	%icc,	loop_2192
	taddcctv	%o5,	%o1,	%l5
loop_2191:
	tgu	%xcc,	0x1
	mulx	%o6,	0x190B,	%o0
loop_2192:
	te	%xcc,	0x0
	tpos	%icc,	0x5
	edge8ln	%i3,	%i6,	%i5
	fpadd32s	%f13,	%f17,	%f23
	sth	%l6,	[%l7 + 0x74]
	edge16	%l4,	%i7,	%i2
	subccc	%g5,	0x129B,	%o3
	tvc	%icc,	0x5
	fcmps	%fcc1,	%f11,	%f2
	fbl	%fcc0,	loop_2193
	movrgez	%g3,	0x005,	%o2
	fblg,a	%fcc3,	loop_2194
	fmovdneg	%xcc,	%f17,	%f21
loop_2193:
	fornot1	%f28,	%f4,	%f30
	tpos	%xcc,	0x2
loop_2194:
	movvc	%icc,	%g2,	%l0
	fbo	%fcc0,	loop_2195
	ta	%xcc,	0x6
	smulcc	%i0,	%l3,	%o7
	edge16l	%g1,	%i4,	%l2
loop_2195:
	taddcc	%l1,	0x0926,	%g6
	sra	%g4,	%o4,	%i1
	fmovdcs	%icc,	%f20,	%f22
	array8	%g7,	%o1,	%o5
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x36] %asi,	%o6
	sllx	%o0,	0x03,	%l5
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x1C] %asi,	%f2
	fbue	%fcc3,	loop_2196
	fmovrdlz	%i6,	%f8,	%f6
	tvs	%icc,	0x5
	prefetch	[%l7 + 0x14],	 0x2
loop_2196:
	fpadd32s	%f5,	%f31,	%f0
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x14] %asi,	%i5
	tsubcctv	%i3,	0x0A54,	%l6
	addcc	%l4,	0x0B75,	%i7
	movcc	%xcc,	%i2,	%o3
	subccc	%g3,	0x1537,	%g5
	tcs	%xcc,	0x0
	bpos,pn	%xcc,	loop_2197
	movrgez	%o2,	0x03A,	%g2
	ldub	[%l7 + 0x71],	%i0
	tge	%xcc,	0x3
loop_2197:
	movcs	%icc,	%l3,	%o7
	orn	%g1,	%i4,	%l0
	fmovdgu	%xcc,	%f28,	%f27
	movrgez	%l1,	0x1E0,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x7
	tne	%xcc,	0x1
	array8	%g4,	%o4,	%g6
	brgez,a	%g7,	loop_2198
	edge32l	%i1,	%o1,	%o5
	edge8	%o6,	%l5,	%o0
	fbo	%fcc3,	loop_2199
loop_2198:
	sdivcc	%i6,	0x1A59,	%i5
	sra	%l6,	0x00,	%i3
	ld	[%l7 + 0x50],	%f18
loop_2199:
	fcmpgt16	%f26,	%f28,	%i7
	ldsb	[%l7 + 0x29],	%l4
	smul	%i2,	0x0079,	%o3
	add	%g3,	0x06AE,	%g5
	movrgz	%g2,	0x153,	%i0
	ldsh	[%l7 + 0x70],	%l3
	te	%xcc,	0x3
	bneg,pt	%xcc,	loop_2200
	fexpand	%f18,	%f22
	sll	%o7,	%g1,	%o2
	tvs	%icc,	0x0
loop_2200:
	sdiv	%i4,	0x065C,	%l1
	movge	%xcc,	%l2,	%l0
	fbne	%fcc3,	loop_2201
	movneg	%xcc,	%g4,	%o4
	addc	%g6,	0x0D9E,	%g7
	fnegs	%f30,	%f3
loop_2201:
	movpos	%xcc,	%o1,	%o5
	mova	%xcc,	%i1,	%l5
	edge32l	%o0,	%i6,	%i5
	fmul8x16al	%f21,	%f11,	%f30
	tge	%icc,	0x5
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x50] %asi,	%f28
	fcmple32	%f2,	%f18,	%o6
	movpos	%icc,	%i3,	%i7
	tne	%icc,	0x3
	movg	%icc,	%l6,	%l4
	orn	%o3,	0x1CAE,	%g3
	brgz	%i2,	loop_2202
	brlz,a	%g5,	loop_2203
	sdivx	%g2,	0x1025,	%i0
	fmovscc	%xcc,	%f0,	%f26
loop_2202:
	movrlz	%o7,	%g1,	%l3
loop_2203:
	udiv	%i4,	0x1B28,	%o2
	fors	%f22,	%f15,	%f14
	srl	%l2,	0x03,	%l0
	set	0x3F, %i7
	lduba	[%l7 + %i7] 0x19,	%g4
	orcc	%l1,	0x1439,	%o4
	or	%g6,	%o1,	%g7
	ldd	[%l7 + 0x40],	%i0
	movvs	%icc,	%l5,	%o0
	fcmpes	%fcc1,	%f24,	%f3
	edge8n	%o5,	%i5,	%o6
	fmovrdlez	%i6,	%f18,	%f2
	orncc	%i7,	%l6,	%i3
	pdist	%f12,	%f30,	%f24
	fcmpne32	%f22,	%f0,	%o3
	fpadd16s	%f1,	%f19,	%f15
	fpsub16s	%f4,	%f24,	%f10
	umul	%g3,	%l4,	%g5
	orncc	%g2,	%i0,	%i2
	tne	%xcc,	0x7
	fpsub16	%f28,	%f28,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g1,	0x15BF,	%o7
	taddcc	%i4,	0x03F4,	%l3
	mova	%xcc,	%l2,	%o2
	fcmple32	%f2,	%f22,	%g4
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x20] %asi,	%l0
	sra	%o4,	%l1,	%g6
	edge32l	%g7,	%i1,	%l5
	stbar
	fnot1	%f22,	%f20
	ldsh	[%l7 + 0x28],	%o1
	nop
	set	0x42, %i0
	ldsb	[%l7 + %i0],	%o0
	bvs	%xcc,	loop_2204
	bvs,a,pn	%icc,	loop_2205
	addccc	%i5,	0x1029,	%o5
	fnot2	%f0,	%f12
loop_2204:
	fmovdpos	%icc,	%f19,	%f30
loop_2205:
	nop
	set	0x1F, %o3
	ldstuba	[%l7 + %o3] 0x11,	%o6
	fmovsvc	%xcc,	%f9,	%f18
	brlez,a	%i6,	loop_2206
	fxors	%f18,	%f17,	%f31
	sir	0x0F72
	srl	%i7,	0x08,	%i3
loop_2206:
	nop
	setx loop_2207, %l0, %l1
	jmpl %l1, %o3
	sllx	%l6,	%l4,	%g5
	ldx	[%l7 + 0x50],	%g2
	fsrc1s	%f8,	%f18
loop_2207:
	edge8	%i0,	%i2,	%g1
	sdiv	%o7,	0x1D5A,	%g3
	smulcc	%i4,	0x0ACF,	%l3
	fpmerge	%f27,	%f21,	%f22
	movneg	%icc,	%o2,	%g4
	movneg	%xcc,	%l0,	%o4
	st	%f8,	[%l7 + 0x30]
	fpadd32s	%f26,	%f21,	%f3
	fbe,a	%fcc2,	loop_2208
	movcs	%icc,	%l2,	%l1
	pdist	%f26,	%f4,	%f12
	fmovsgu	%icc,	%f31,	%f8
loop_2208:
	tpos	%xcc,	0x2
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x24] %asi,	%g7
	tvc	%icc,	0x0
	tsubcctv	%g6,	%i1,	%l5
	fmovdleu	%icc,	%f11,	%f22
	fbge	%fcc0,	loop_2209
	orncc	%o0,	%o1,	%o5
	edge32ln	%o6,	%i5,	%i7
	fpsub16	%f6,	%f8,	%f28
loop_2209:
	xorcc	%i6,	0x01E1,	%i3
	tcs	%icc,	0x4
	orn	%o3,	0x1901,	%l6
	movg	%xcc,	%l4,	%g2
	movl	%icc,	%g5,	%i2
	brnz	%i0,	loop_2210
	orncc	%o7,	%g1,	%i4
	and	%l3,	%o2,	%g3
	fmovdge	%icc,	%f25,	%f24
loop_2210:
	stx	%g4,	[%l7 + 0x48]
	fmovrdne	%l0,	%f24,	%f2
	ldsh	[%l7 + 0x08],	%o4
	fandnot1s	%f18,	%f20,	%f2
	edge32ln	%l1,	%g7,	%g6
	or	%l2,	%i1,	%o0
	mulx	%l5,	0x08D7,	%o1
	movn	%xcc,	%o5,	%o6
	tsubcc	%i5,	%i7,	%i3
	alignaddr	%i6,	%l6,	%l4
	fpadd32s	%f16,	%f20,	%f15
	fsrc1s	%f15,	%f11
	movne	%icc,	%g2,	%o3
	alignaddrl	%i2,	%g5,	%o7
	tvc	%icc,	0x2
	srl	%i0,	%i4,	%g1
	edge16	%l3,	%o2,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g4,	0x0270,	%o4
	ldd	[%l7 + 0x10],	%f8
	sra	%l0,	%g7,	%l1
	fpmerge	%f23,	%f26,	%f10
	sub	%l2,	%i1,	%g6
	tg	%xcc,	0x4
	fpackfix	%f16,	%f5
	tneg	%icc,	0x5
	bg,pt	%xcc,	loop_2211
	tcc	%xcc,	0x2
	tvs	%xcc,	0x3
	sub	%o0,	0x0893,	%o1
loop_2211:
	bneg,a,pn	%xcc,	loop_2212
	fnot1	%f20,	%f0
	fmovrde	%l5,	%f4,	%f6
	fmovsne	%icc,	%f11,	%f24
loop_2212:
	tvs	%xcc,	0x2
	edge16	%o5,	%o6,	%i7
	fbl,a	%fcc0,	loop_2213
	bvc	loop_2214
	fandnot1	%f2,	%f18,	%f8
	addcc	%i5,	0x0C4C,	%i6
loop_2213:
	movge	%xcc,	%i3,	%l4
loop_2214:
	fmovsl	%xcc,	%f8,	%f10
	movvc	%xcc,	%g2,	%o3
	fnor	%f10,	%f8,	%f12
	fmovda	%xcc,	%f18,	%f17
	tcc	%xcc,	0x1
	movpos	%icc,	%i2,	%l6
	umul	%g5,	%i0,	%o7
	tsubcctv	%i4,	%l3,	%g1
	tgu	%xcc,	0x5
	fxors	%f8,	%f2,	%f26
	fmuld8sux16	%f9,	%f12,	%f8
	fxors	%f3,	%f9,	%f20
	movrne	%o2,	0x28A,	%g4
	edge32n	%o4,	%l0,	%g7
	tcs	%icc,	0x6
	fornot1s	%f15,	%f22,	%f23
	lduw	[%l7 + 0x0C],	%g3
	fcmpeq16	%f6,	%f12,	%l2
	movleu	%icc,	%l1,	%g6
	movrgez	%i1,	%o1,	%l5
	st	%f30,	[%l7 + 0x1C]
	fxnor	%f26,	%f16,	%f6
	orncc	%o5,	0x1388,	%o6
	alignaddr	%i7,	%o0,	%i5
	fmovdpos	%xcc,	%f12,	%f29
	fmovdge	%xcc,	%f5,	%f1
	fmuld8sux16	%f13,	%f17,	%f16
	fmovrslez	%i3,	%f0,	%f1
	taddcctv	%i6,	%g2,	%o3
	brnz	%l4,	loop_2215
	fmovrdgz	%l6,	%f12,	%f2
	ldx	[%l7 + 0x60],	%g5
	edge8l	%i2,	%i0,	%o7
loop_2215:
	membar	0x07
	fmul8ulx16	%f18,	%f10,	%f10
	movn	%xcc,	%l3,	%i4
	te	%xcc,	0x2
	move	%xcc,	%g1,	%g4
	fmul8sux16	%f20,	%f2,	%f16
	stw	%o2,	[%l7 + 0x5C]
	fcmpgt32	%f14,	%f14,	%o4
	stw	%g7,	[%l7 + 0x58]
	fpsub16s	%f17,	%f23,	%f1
	mulscc	%l0,	%l2,	%g3
	fornot2s	%f6,	%f19,	%f27
	movrgez	%g6,	%l1,	%o1
	movrne	%i1,	%o5,	%l5
	tneg	%icc,	0x0
	stbar
	umul	%o6,	0x1A4B,	%o0
	fcmps	%fcc1,	%f10,	%f0
	tcc	%xcc,	0x0
	fcmple16	%f8,	%f24,	%i7
	or	%i3,	%i6,	%g2
	fmovdne	%xcc,	%f11,	%f16
	udivx	%i5,	0x0E04,	%l4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l6,	%o3
	tgu	%xcc,	0x2
	subcc	%i2,	0x1C9D,	%g5
	fmovspos	%icc,	%f22,	%f30
	bvc,a,pt	%xcc,	loop_2216
	udivx	%o7,	0x12EF,	%l3
	brlz	%i4,	loop_2217
	addccc	%g1,	0x1CCD,	%g4
loop_2216:
	ldstub	[%l7 + 0x16],	%i0
	edge8l	%o2,	%o4,	%g7
loop_2217:
	array16	%l0,	%l2,	%g6
	tl	%icc,	0x6
	fzeros	%f7
	udiv	%l1,	0x0248,	%o1
	xnorcc	%g3,	%i1,	%l5
	fmovsne	%icc,	%f16,	%f17
	udivcc	%o6,	0x0BE7,	%o0
	fbug,a	%fcc2,	loop_2218
	fbug,a	%fcc2,	loop_2219
	fxnors	%f12,	%f3,	%f31
	fbuge	%fcc2,	loop_2220
loop_2218:
	movre	%o5,	%i3,	%i7
loop_2219:
	mulx	%i6,	0x0276,	%i5
	movrgez	%l4,	%g2,	%l6
loop_2220:
	tvc	%xcc,	0x4
	movle	%xcc,	%i2,	%g5
	sdivcc	%o7,	0x18F8,	%o3
	set	0x70, %l0
	ldxa	[%l7 + %l0] 0x81,	%l3
	te	%icc,	0x4
	bne,a,pt	%icc,	loop_2221
	smul	%i4,	0x1B4A,	%g1
	tne	%icc,	0x1
	fbg	%fcc3,	loop_2222
loop_2221:
	umul	%i0,	0x0326,	%g4
	tvc	%icc,	0x0
	mulx	%o2,	%o4,	%l0
loop_2222:
	fmovrdne	%l2,	%f6,	%f22
	tpos	%xcc,	0x2
	addc	%g7,	0x0535,	%l1
	andcc	%g6,	%g3,	%o1
	move	%xcc,	%l5,	%i1
	movcs	%icc,	%o0,	%o6
	bg,pn	%icc,	loop_2223
	movre	%o5,	%i3,	%i6
	bvc	loop_2224
	movleu	%xcc,	%i7,	%l4
loop_2223:
	fnot2s	%f29,	%f6
	andncc	%g2,	%l6,	%i2
loop_2224:
	movge	%xcc,	%i5,	%o7
	edge32l	%g5,	%l3,	%i4
	brnz	%o3,	loop_2225
	edge8l	%g1,	%i0,	%o2
	fpsub16	%f12,	%f10,	%f26
	fbl,a	%fcc0,	loop_2226
loop_2225:
	tg	%icc,	0x5
	edge16n	%g4,	%l0,	%o4
	fornot1s	%f17,	%f8,	%f12
loop_2226:
	umul	%l2,	%l1,	%g7
	tne	%icc,	0x6
	tg	%icc,	0x3
	fandnot1s	%f10,	%f1,	%f19
	tg	%icc,	0x4
	smulcc	%g6,	%o1,	%g3
	movgu	%icc,	%l5,	%i1
	taddcc	%o0,	0x1F41,	%o6
	brlez,a	%i3,	loop_2227
	xnor	%o5,	%i7,	%l4
	wr	%g0,	0x22,	%asi
	stha	%i6,	[%l7 + 0x64] %asi
	membar	#Sync
loop_2227:
	edge8n	%l6,	%i2,	%i5
	lduh	[%l7 + 0x08],	%g2
	set	0x79, %g4
	ldsba	[%l7 + %g4] 0x81,	%o7
	tneg	%icc,	0x0
	edge32l	%l3,	%i4,	%o3
	fand	%f6,	%f16,	%f22
	umulcc	%g1,	%g5,	%i0
	fnors	%f0,	%f20,	%f16
	addc	%g4,	0x1CF7,	%l0
	or	%o2,	0x10A0,	%o4
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%l2
	movrne	%l1,	%g6,	%o1
	addc	%g3,	0x1143,	%l5
	fandnot2s	%f21,	%f25,	%f14
	orn	%g7,	0x16E3,	%i1
	bcc,a	%icc,	loop_2228
	movrgz	%o0,	%i3,	%o5
	fmovda	%icc,	%f9,	%f23
	fmuld8sux16	%f19,	%f26,	%f24
loop_2228:
	ldstub	[%l7 + 0x18],	%o6
	fzero	%f8
	fcmpgt32	%f10,	%f22,	%i7
	array8	%i6,	%l4,	%l6
	movrgez	%i2,	%i5,	%o7
	nop
	set	0x59, %g2
	stb	%g2,	[%l7 + %g2]
	lduw	[%l7 + 0x7C],	%l3
	tsubcctv	%i4,	%o3,	%g5
	tle	%xcc,	0x2
	fcmpd	%fcc2,	%f4,	%f20
	movrgz	%g1,	%i0,	%g4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x0c,	%l0,	%o4
	fnegs	%f18,	%f4
	fbl,a	%fcc3,	loop_2229
	alignaddr	%o2,	%l1,	%g6
	umulcc	%o1,	%g3,	%l2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g7,	%i1
loop_2229:
	tsubcc	%o0,	%l5,	%i3
	fmovdg	%xcc,	%f16,	%f8
	fmovrdne	%o6,	%f24,	%f0
	orn	%i7,	0x14BB,	%i6
	ldstub	[%l7 + 0x77],	%o5
	brgz,a	%l4,	loop_2230
	movrlz	%l6,	0x2F0,	%i2
	array16	%o7,	%g2,	%l3
	fands	%f26,	%f25,	%f16
loop_2230:
	move	%xcc,	%i4,	%i5
	mova	%icc,	%g5,	%o3
	edge32n	%g1,	%g4,	%l0
	movneg	%icc,	%o4,	%i0
	sdivx	%o2,	0x0B9C,	%l1
	fandnot1	%f0,	%f26,	%f2
	brgz,a	%o1,	loop_2231
	umulcc	%g6,	%g3,	%l2
	tsubcctv	%g7,	%o0,	%l5
	udiv	%i3,	0x1ACF,	%i1
loop_2231:
	subc	%o6,	0x0775,	%i7
	addccc	%i6,	%l4,	%l6
	tle	%icc,	0x7
	brgez,a	%i2,	loop_2232
	subc	%o7,	0x1391,	%o5
	sllx	%g2,	%l3,	%i4
	tn	%xcc,	0x3
loop_2232:
	edge8l	%g5,	%i5,	%g1
	mova	%icc,	%o3,	%g4
	te	%icc,	0x4
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o4
	sir	0x0D58
	sll	%l0,	0x06,	%o2
	xorcc	%l1,	%o1,	%i0
	edge8ln	%g6,	%g3,	%g7
	bcs	loop_2233
	umulcc	%o0,	%l5,	%l2
	nop
	setx	loop_2234,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orcc	%i1,	%i3,	%i7
loop_2233:
	lduh	[%l7 + 0x10],	%i6
	fand	%f28,	%f26,	%f8
loop_2234:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%l4
	udivcc	%o6,	0x17CF,	%i2
	srl	%l6,	0x09,	%o7
	movle	%icc,	%o5,	%l3
	fandnot2	%f20,	%f6,	%f24
	taddcctv	%g2,	%g5,	%i4
	udivx	%i5,	0x07EC,	%g1
	fblg,a	%fcc3,	loop_2235
	movle	%icc,	%o3,	%g4
	subccc	%o4,	0x01D3,	%o2
	srlx	%l1,	%l0,	%o1
loop_2235:
	addcc	%i0,	0x008A,	%g3
	movrne	%g7,	%g6,	%o0
	prefetch	[%l7 + 0x40],	 0x1
	fmovdvs	%icc,	%f0,	%f22
	or	%l5,	0x0025,	%i1
	fmovsle	%xcc,	%f19,	%f20
	movge	%xcc,	%i3,	%i7
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x74] %asi,	%i6
	udiv	%l2,	0x1F43,	%o6
	fblg	%fcc2,	loop_2236
	edge8l	%i2,	%l6,	%o7
	array16	%o5,	%l4,	%l3
	ldx	[%l7 + 0x10],	%g5
loop_2236:
	nop
	set	0x70, %i6
	stda	%g2,	[%l7 + %i6] 0x22
	membar	#Sync
	tcs	%xcc,	0x3
	tl	%xcc,	0x0
	tcs	%icc,	0x1
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x14] %asi,	%i5
	stb	%i4,	[%l7 + 0x53]
	srax	%o3,	0x0F,	%g1
	fmul8x16al	%f7,	%f13,	%f4
	srax	%o4,	0x07,	%o2
	tl	%xcc,	0x5
	fmovd	%f6,	%f12
	fmovscc	%icc,	%f12,	%f31
	edge16ln	%g4,	%l0,	%o1
	smulcc	%l1,	0x1D39,	%g3
	flush	%l7 + 0x2C
	movvs	%icc,	%g7,	%g6
	edge32n	%o0,	%i0,	%i1
	nop
	setx loop_2237, %l0, %l1
	jmpl %l1, %l5
	fpmerge	%f20,	%f13,	%f8
	fmovrdgez	%i3,	%f10,	%f0
	lduw	[%l7 + 0x78],	%i6
loop_2237:
	ldub	[%l7 + 0x0A],	%l2
	subc	%i7,	%o6,	%l6
	edge8n	%i2,	%o7,	%l4
	wr	%g0,	0x80,	%asi
	sta	%f0,	[%l7 + 0x40] %asi
	tsubcc	%l3,	0x15D0,	%g5
	umulcc	%o5,	0x0013,	%g2
	orcc	%i4,	0x17E2,	%o3
	sdivx	%g1,	0x19FF,	%o4
	fmovrdgz	%o2,	%f14,	%f18
	addc	%g4,	0x07DF,	%l0
	smul	%o1,	0x17A6,	%i5
	fblg	%fcc1,	loop_2238
	xnor	%g3,	0x0FB6,	%l1
	edge16ln	%g7,	%o0,	%i0
	tg	%xcc,	0x0
loop_2238:
	fmovrdne	%g6,	%f20,	%f26
	std	%f8,	[%l7 + 0x70]
	movcc	%xcc,	%i1,	%i3
	fmovdpos	%icc,	%f7,	%f24
	tle	%xcc,	0x7
	tle	%xcc,	0x2
	fba,a	%fcc0,	loop_2239
	movvs	%xcc,	%i6,	%l5
	tneg	%xcc,	0x7
	fmovsa	%xcc,	%f22,	%f5
loop_2239:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i7,	%l2,	%o6
	tge	%icc,	0x4
	fmovrdlz	%i2,	%f16,	%f10
	movrlez	%o7,	%l4,	%l3
	sra	%l6,	0x19,	%g5
	bne	loop_2240
	addcc	%o5,	%i4,	%g2
	bcc,a	%icc,	loop_2241
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2240:
	edge16l	%g1,	%o3,	%o4
	movrne	%g4,	0x25B,	%l0
loop_2241:
	sllx	%o1,	%o2,	%g3
	tn	%icc,	0x3
	lduw	[%l7 + 0x1C],	%l1
	array8	%g7,	%i5,	%o0
	xorcc	%g6,	0x1B75,	%i0
	set	0x4C, %i4
	swapa	[%l7 + %i4] 0x04,	%i3
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x70] %asi,	%f7
	movcs	%xcc,	%i6,	%l5
	movleu	%xcc,	%i1,	%i7
	fmovdn	%icc,	%f25,	%f21
	bvs,a,pn	%icc,	loop_2242
	bne	%xcc,	loop_2243
	stb	%l2,	[%l7 + 0x1F]
	nop
	setx	loop_2244,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2242:
	tne	%xcc,	0x3
loop_2243:
	fcmpne32	%f20,	%f14,	%i2
	tsubcc	%o6,	%l4,	%l3
loop_2244:
	nop
	set	0x26, %l4
	lduha	[%l7 + %l4] 0x14,	%l6
	taddcctv	%g5,	%o7,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f16,	%f18
	movrlz	%g2,	0x12F,	%i4
	sll	%o3,	0x1C,	%o4
	xorcc	%g4,	0x1A0B,	%g1
	edge16	%o1,	%o2,	%l0
	membar	0x6D
	udivcc	%l1,	0x1279,	%g7
	std	%f30,	[%l7 + 0x28]
	fmovsvs	%xcc,	%f7,	%f25
	bgu,a	%xcc,	loop_2245
	sdiv	%i5,	0x10FF,	%g3
	brlez	%o0,	loop_2246
	movg	%xcc,	%i0,	%g6
loop_2245:
	edge8l	%i6,	%l5,	%i3
	srlx	%i7,	%i1,	%i2
loop_2246:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l2,	%l4
	edge32l	%l3,	%o6,	%l6
	smul	%g5,	%o7,	%o5
	movvc	%xcc,	%g2,	%o3
	movleu	%icc,	%o4,	%i4
	edge16l	%g1,	%g4,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o2,	0x1452,	%l0
	wr	%g0,	0x80,	%asi
	sta	%f18,	[%l7 + 0x64] %asi
	udivx	%l1,	0x075A,	%g7
	mulx	%i5,	0x023F,	%o0
	tl	%xcc,	0x6
	bg,a	loop_2247
	bvs,pt	%xcc,	loop_2248
	umul	%i0,	%g3,	%g6
	brnz,a	%i6,	loop_2249
loop_2247:
	fpack16	%f2,	%f0
loop_2248:
	srlx	%l5,	%i3,	%i7
	movcc	%icc,	%i1,	%l2
loop_2249:
	movcc	%xcc,	%l4,	%l3
	smul	%o6,	0x1555,	%i2
	fxnor	%f24,	%f0,	%f16
	movl	%icc,	%l6,	%g5
	fpsub32s	%f29,	%f31,	%f1
	nop
	setx	loop_2250,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fsrc2s	%f10,	%f12
	tg	%icc,	0x4
	movrlez	%o7,	%o5,	%o3
loop_2250:
	alignaddr	%o4,	%i4,	%g1
	set	0x30, %g5
	prefetcha	[%l7 + %g5] 0x10,	 0x0
	array8	%g4,	%o2,	%l0
	edge16n	%o1,	%g7,	%i5
	edge8l	%l1,	%i0,	%o0
	ldstub	[%l7 + 0x12],	%g3
	fbl	%fcc0,	loop_2251
	tvc	%xcc,	0x3
	edge16n	%g6,	%l5,	%i3
	bgu,a,pn	%icc,	loop_2252
loop_2251:
	sir	0x109D
	orcc	%i7,	0x12B1,	%i6
	fornot1	%f28,	%f14,	%f16
loop_2252:
	fpack16	%f18,	%f6
	alignaddrl	%l2,	%l4,	%i1
	fmovde	%icc,	%f15,	%f31
	set	0x64, %l3
	ldswa	[%l7 + %l3] 0x14,	%o6
	fblg	%fcc0,	loop_2253
	bneg	loop_2254
	ldd	[%l7 + 0x20],	%f26
	alignaddr	%l3,	%i2,	%g5
loop_2253:
	smulcc	%l6,	%o7,	%o5
loop_2254:
	fmovsl	%icc,	%f7,	%f23
	fmovsvs	%icc,	%f4,	%f10
	fbuge,a	%fcc3,	loop_2255
	fcmpd	%fcc2,	%f30,	%f4
	tleu	%icc,	0x5
	sllx	%o4,	%i4,	%g1
loop_2255:
	stbar
	fmovsl	%xcc,	%f3,	%f17
	tgu	%xcc,	0x1
	ta	%xcc,	0x1
	array32	%g2,	%o3,	%g4
	fands	%f20,	%f4,	%f17
	xorcc	%l0,	%o2,	%o1
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%i4
	movn	%xcc,	%l1,	%i0
	popc	%g7,	%o0
	fmovdl	%xcc,	%f16,	%f4
	edge16ln	%g3,	%g6,	%i3
	andcc	%i7,	0x0CC4,	%i6
	fpsub16	%f30,	%f8,	%f12
	fmovrsne	%l5,	%f23,	%f6
	ble,pt	%xcc,	loop_2256
	fbule	%fcc0,	loop_2257
	smulcc	%l4,	0x0445,	%l2
	sethi	0x0049,	%i1
loop_2256:
	movcc	%icc,	%o6,	%l3
loop_2257:
	edge32l	%i2,	%l6,	%g5
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x36] %asi,	%o5
	flush	%l7 + 0x1C
	sdivcc	%o4,	0x1049,	%i4
	movl	%xcc,	%o7,	%g1
	tsubcctv	%g2,	0x0E74,	%o3
	fmul8ulx16	%f2,	%f12,	%f18
	swap	[%l7 + 0x74],	%l0
	edge8l	%o2,	%o1,	%g4
	srl	%i5,	%i0,	%g7
	wr	%g0,	0x0c,	%asi
	stha	%o0,	[%l7 + 0x36] %asi
	movl	%icc,	%g3,	%g6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
	set	0x48, %l6
	stda	%i2,	[%l7 + %l6] 0x11
	ldstub	[%l7 + 0x2B],	%i6
	fpadd32	%f20,	%f28,	%f28
	taddcctv	%l5,	0x1276,	%l4
	fnegd	%f18,	%f16
	alignaddrl	%l2,	%i7,	%o6
	fbuge	%fcc0,	loop_2258
	membar	0x26
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x10,	%f0
loop_2258:
	fcmpne16	%f18,	%f22,	%i1
	ldsw	[%l7 + 0x5C],	%l3
	nop
	set	0x64, %i2
	lduh	[%l7 + %i2],	%i2
	andcc	%g5,	0x1F26,	%o5
	xnorcc	%l6,	%o4,	%o7
	fmovdl	%icc,	%f21,	%f20
	bvc,a,pt	%xcc,	loop_2259
	sdivcc	%i4,	0x1C7E,	%g2
	mulscc	%g1,	%o3,	%l0
	pdist	%f14,	%f6,	%f30
loop_2259:
	fmovrslez	%o2,	%f29,	%f26
	fones	%f10
	fbu	%fcc2,	loop_2260
	umulcc	%g4,	0x0B33,	%i5
	srl	%o1,	%g7,	%o0
	set	0x7C, %o4
	lduwa	[%l7 + %o4] 0x18,	%g3
loop_2260:
	bleu,a,pt	%xcc,	loop_2261
	sdiv	%g6,	0x1601,	%i0
	fpsub16s	%f17,	%f31,	%f2
	tvc	%icc,	0x6
loop_2261:
	movgu	%xcc,	%i3,	%l1
	fmovrdgez	%l5,	%f10,	%f2
	fmovsgu	%icc,	%f4,	%f22
	bcs,a,pt	%icc,	loop_2262
	ld	[%l7 + 0x40],	%f27
	fmovrslez	%l4,	%f22,	%f0
	bg,pt	%xcc,	loop_2263
loop_2262:
	sll	%i6,	%l2,	%i7
	nop
	set	0x6C, %o6
	lduw	[%l7 + %o6],	%i1
	fbl,a	%fcc0,	loop_2264
loop_2263:
	be,pn	%icc,	loop_2265
	xor	%l3,	0x06CC,	%i2
	fmovda	%xcc,	%f5,	%f5
loop_2264:
	fsrc2	%f10,	%f20
loop_2265:
	nop
	set	0x38, %g1
	std	%g4,	[%l7 + %g1]
	movgu	%icc,	%o5,	%l6
	fmovrde	%o6,	%f0,	%f14
	addcc	%o4,	0x0476,	%i4
	sir	0x15DF
	add	%g2,	%g1,	%o7
	tcc	%icc,	0x2
	fnot2s	%f10,	%f13
	tne	%icc,	0x2
	tpos	%icc,	0x7
	tne	%icc,	0x4
	fmovda	%icc,	%f5,	%f18
	add	%o3,	0x1040,	%o2
	bleu,pn	%xcc,	loop_2266
	tle	%xcc,	0x2
	sllx	%g4,	0x07,	%l0
	sdivcc	%i5,	0x0985,	%g7
loop_2266:
	tvs	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x10],	%o1
	tneg	%icc,	0x6
	or	%o0,	0x0132,	%g3
	movrgez	%i0,	%i3,	%g6
	nop
	setx	loop_2267,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%l1,	0x028E,	%l5
	fnot2	%f2,	%f30
	srl	%i6,	%l2,	%l4
loop_2267:
	move	%icc,	%i7,	%i1
	be	%xcc,	loop_2268
	te	%xcc,	0x5
	edge8l	%i2,	%g5,	%l3
	sdiv	%o5,	0x13DE,	%o6
loop_2268:
	sllx	%l6,	0x0A,	%i4
	array8	%o4,	%g2,	%o7
	fmovdl	%icc,	%f27,	%f20
	edge16n	%g1,	%o2,	%g4
	fexpand	%f24,	%f28
	movrlz	%l0,	%i5,	%g7
	or	%o1,	0x12C6,	%o0
	tsubcc	%g3,	%i0,	%o3
	smulcc	%g6,	0x13D2,	%l1
	fmovrsne	%i3,	%f27,	%f26
	fnot1s	%f23,	%f26
	fmovrdgez	%i6,	%f0,	%f20
	array32	%l2,	%l5,	%l4
	fandnot2s	%f8,	%f15,	%f3
	fmovsle	%xcc,	%f8,	%f27
	fzero	%f14
	tge	%icc,	0x7
	fxnors	%f6,	%f18,	%f30
	edge8l	%i1,	%i2,	%i7
	udivx	%g5,	0x1EFA,	%o5
	st	%f27,	[%l7 + 0x1C]
	srlx	%o6,	%l3,	%i4
	sdiv	%o4,	0x0EE1,	%g2
	tneg	%xcc,	0x6
	xnorcc	%l6,	%o7,	%g1
	fone	%f6
	movgu	%xcc,	%g4,	%l0
	subcc	%o2,	0x12EF,	%i5
	set	0x38, %l1
	lda	[%l7 + %l1] 0x19,	%f25
	fcmpne16	%f6,	%f22,	%o1
	edge8l	%o0,	%g3,	%i0
	fxnor	%f10,	%f22,	%f18
	movpos	%xcc,	%o3,	%g6
	edge32	%l1,	%i3,	%i6
	xor	%l2,	%g7,	%l5
	xnor	%l4,	%i1,	%i2
	tgu	%icc,	0x7
	add	%g5,	0x177B,	%i7
	movrne	%o5,	%l3,	%o6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x50] %asi,	%o4
	edge16n	%i4,	%l6,	%o7
	fcmpeq16	%f20,	%f4,	%g2
	move	%icc,	%g4,	%l0
	fmovdneg	%icc,	%f22,	%f13
	edge16n	%o2,	%g1,	%o1
	ldd	[%l7 + 0x48],	%o0
	te	%icc,	0x6
	nop
	setx	loop_2269,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvc,a,pn	%xcc,	loop_2270
	sir	0x024B
	tleu	%icc,	0x1
loop_2269:
	fsrc1s	%f30,	%f14
loop_2270:
	fxnors	%f12,	%f12,	%f2
	movl	%icc,	%i5,	%i0
	fandnot2	%f26,	%f22,	%f16
	bcc,a	loop_2271
	fblg,a	%fcc2,	loop_2272
	sllx	%o3,	%g3,	%l1
	wr	%g0,	0xe2,	%asi
	stxa	%g6,	[%l7 + 0x28] %asi
	membar	#Sync
loop_2271:
	tl	%icc,	0x2
loop_2272:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i3,	%i6,	%g7
	fmovsvs	%xcc,	%f2,	%f18
	move	%icc,	%l2,	%l4
	edge16	%i1,	%l5,	%i2
	fornot2	%f4,	%f8,	%f14
	fble,a	%fcc3,	loop_2273
	taddcctv	%g5,	%o5,	%i7
	fnegd	%f4,	%f30
	fzero	%f30
loop_2273:
	siam	0x5
	sll	%l3,	0x00,	%o4
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%o6
	set	0x78, %i1
	ldxa	[%l7 + %i1] 0x11,	%i4
	subccc	%o7,	%l6,	%g2
	bge,pt	%icc,	loop_2274
	sdiv	%g4,	0x0826,	%o2
	bpos,a,pt	%icc,	loop_2275
	orcc	%l0,	0x1C67,	%g1
loop_2274:
	lduw	[%l7 + 0x44],	%o1
	movgu	%icc,	%i5,	%i0
loop_2275:
	fbue,a	%fcc3,	loop_2276
	edge32ln	%o0,	%o3,	%l1
	fnegs	%f0,	%f3
	movn	%icc,	%g3,	%g6
loop_2276:
	std	%i2,	[%l7 + 0x78]
	mulx	%i6,	0x0CFF,	%g7
	fnand	%f22,	%f20,	%f20
	movrne	%l4,	0x140,	%l2
	fbl	%fcc3,	loop_2277
	orncc	%i1,	%i2,	%g5
	swap	[%l7 + 0x44],	%o5
	orcc	%i7,	%l3,	%o4
loop_2277:
	fbg	%fcc0,	loop_2278
	fmovrdgz	%l5,	%f14,	%f30
	andncc	%i4,	%o7,	%o6
	taddcctv	%l6,	%g4,	%g2
loop_2278:
	fsrc2	%f28,	%f30
	fxnors	%f5,	%f26,	%f27
	sdiv	%o2,	0x1327,	%l0
	bneg,pt	%xcc,	loop_2279
	taddcc	%g1,	%i5,	%o1
	tle	%icc,	0x1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x5D] %asi,	%i0
loop_2279:
	nop
	set	0x20, %g3
	stda	%o2,	[%l7 + %g3] 0x2b
	membar	#Sync
	smulcc	%o0,	%g3,	%l1
	fcmpeq16	%f28,	%f6,	%g6
	tne	%icc,	0x5
	movgu	%xcc,	%i3,	%i6
	nop
	setx loop_2280, %l0, %l1
	jmpl %l1, %g7
	bge,pt	%icc,	loop_2281
	movpos	%xcc,	%l2,	%l4
	edge16	%i1,	%g5,	%i2
loop_2280:
	movcs	%xcc,	%i7,	%o5
loop_2281:
	addccc	%o4,	0x1010,	%l3
	mova	%icc,	%i4,	%l5
	tge	%xcc,	0x3
	xnor	%o6,	0x11D0,	%l6
	fcmple16	%f12,	%f8,	%o7
	fmovsneg	%icc,	%f3,	%f23
	mulx	%g4,	0x0FD4,	%g2
	tpos	%xcc,	0x6
	fornot2	%f18,	%f8,	%f26
	xor	%l0,	0x0C3A,	%g1
	andncc	%o2,	%i5,	%i0
	fbg,a	%fcc0,	loop_2282
	udiv	%o1,	0x0C0F,	%o0
	fcmple32	%f8,	%f30,	%o3
	tle	%xcc,	0x0
loop_2282:
	sub	%l1,	%g3,	%i3
	tcs	%xcc,	0x3
	movcs	%icc,	%g6,	%i6
	movge	%xcc,	%g7,	%l4
	fzeros	%f6
	fbul	%fcc0,	loop_2283
	fpadd32	%f24,	%f10,	%f4
	movrne	%l2,	%i1,	%i2
	movleu	%xcc,	%g5,	%o5
loop_2283:
	edge32l	%i7,	%o4,	%i4
	ldsb	[%l7 + 0x7B],	%l3
	nop
	set	0x30, %o0
	lduw	[%l7 + %o0],	%o6
	sllx	%l6,	0x1B,	%o7
	array8	%g4,	%l5,	%g2
	sdivcc	%l0,	0x134E,	%g1
	fnors	%f8,	%f6,	%f22
	orn	%i5,	0x100A,	%o2
	umulcc	%i0,	%o0,	%o1
	membar	0x29
	fzero	%f12
	movcs	%icc,	%l1,	%o3
	tne	%xcc,	0x3
	set	0x20, %g6
	lda	[%l7 + %g6] 0x81,	%f8
	movne	%xcc,	%i3,	%g3
	be,pn	%icc,	loop_2284
	edge8ln	%g6,	%g7,	%i6
	movre	%l4,	%l2,	%i1
	tl	%icc,	0x4
loop_2284:
	movcc	%icc,	%g5,	%o5
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x80,	 0x3
	fxnors	%f26,	%f22,	%f24
	brz,a	%i7,	loop_2285
	fpackfix	%f24,	%f8
	fsrc1	%f10,	%f18
	movvs	%xcc,	%i4,	%l3
loop_2285:
	tsubcctv	%o4,	0x0198,	%l6
	bl,pt	%icc,	loop_2286
	ta	%xcc,	0x5
	tcs	%xcc,	0x6
	xorcc	%o7,	0x1FDE,	%o6
loop_2286:
	fpmerge	%f24,	%f19,	%f8
	movrlez	%l5,	0x12C,	%g2
	movneg	%xcc,	%l0,	%g4
	srax	%g1,	%o2,	%i0
	edge32ln	%o0,	%i5,	%o1
	sdivx	%l1,	0x0076,	%o3
	movvc	%xcc,	%i3,	%g3
	st	%f14,	[%l7 + 0x50]
	fxors	%f15,	%f8,	%f19
	sdiv	%g7,	0x05B0,	%g6
	mulscc	%l4,	0x1A36,	%i6
	fmovsg	%icc,	%f22,	%f21
	movvs	%icc,	%l2,	%g5
	sth	%i1,	[%l7 + 0x5A]
	bge,a,pt	%xcc,	loop_2287
	mulx	%o5,	0x1956,	%i2
	ldub	[%l7 + 0x6E],	%i7
	edge32l	%l3,	%i4,	%l6
loop_2287:
	ldx	[%l7 + 0x48],	%o7
	orncc	%o4,	%o6,	%l5
	st	%f20,	[%l7 + 0x44]
	sdivx	%g2,	0x15D7,	%g4
	movge	%icc,	%l0,	%g1
	subc	%o2,	%o0,	%i0
	srl	%i5,	0x0B,	%l1
	tne	%icc,	0x2
	bpos,pn	%xcc,	loop_2288
	fmovrsgez	%o3,	%f29,	%f31
	udiv	%o1,	0x1E51,	%i3
	bvc,a	%icc,	loop_2289
loop_2288:
	tne	%xcc,	0x1
	lduh	[%l7 + 0x3A],	%g7
	tvs	%icc,	0x4
loop_2289:
	popc	0x1DEF,	%g6
	udivcc	%l4,	0x1224,	%g3
	edge16ln	%l2,	%g5,	%i1
	movg	%xcc,	%i6,	%o5
	fcmps	%fcc1,	%f14,	%f30
	te	%icc,	0x0
	stw	%i2,	[%l7 + 0x34]
	set	0x08, %o1
	lduwa	[%l7 + %o1] 0x81,	%i7
	fmovscs	%icc,	%f11,	%f7
	fornot1	%f4,	%f18,	%f24
	and	%l3,	%i4,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o4,	0x0D,	%o7
	subcc	%o6,	0x1A9E,	%l5
	fbge	%fcc0,	loop_2290
	fmovsgu	%xcc,	%f7,	%f7
	fmovdl	%icc,	%f28,	%f15
	edge32n	%g4,	%g2,	%l0
loop_2290:
	st	%f8,	[%l7 + 0x3C]
	ba	%xcc,	loop_2291
	faligndata	%f28,	%f8,	%f0
	fbl,a	%fcc0,	loop_2292
	tsubcc	%g1,	%o2,	%o0
loop_2291:
	fmovsneg	%icc,	%f4,	%f13
	tl	%xcc,	0x7
loop_2292:
	add	%i5,	0x0DEF,	%i0
	fmovsge	%icc,	%f21,	%f28
	addcc	%o3,	0x010D,	%l1
	fbul	%fcc3,	loop_2293
	fmovrdgez	%o1,	%f6,	%f30
	fbug,a	%fcc3,	loop_2294
	tgu	%icc,	0x7
loop_2293:
	tcc	%icc,	0x7
	fbo,a	%fcc1,	loop_2295
loop_2294:
	fmovsle	%icc,	%f13,	%f15
	fcmpgt32	%f30,	%f18,	%i3
	bleu	%xcc,	loop_2296
loop_2295:
	array16	%g7,	%l4,	%g3
	tne	%icc,	0x3
	movge	%xcc,	%g6,	%g5
loop_2296:
	subccc	%i1,	%l2,	%i6
	stw	%o5,	[%l7 + 0x70]
	movne	%xcc,	%i7,	%i2
	movvs	%xcc,	%l3,	%i4
	fzeros	%f20
	move	%icc,	%l6,	%o7
	ldx	[%l7 + 0x58],	%o6
	ldx	[%l7 + 0x68],	%l5
	movneg	%xcc,	%o4,	%g4
	andncc	%l0,	%g2,	%g1
	movneg	%xcc,	%o0,	%i5
	sdivx	%i0,	0x0B70,	%o3
	fcmpeq32	%f2,	%f4,	%o2
	movpos	%icc,	%l1,	%i3
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x74] %asi,	%f1
	fmovdn	%icc,	%f21,	%f25
	tn	%xcc,	0x2
	fmovdvs	%icc,	%f31,	%f23
	fcmpgt16	%f10,	%f24,	%g7
	fmovdvc	%icc,	%f13,	%f10
	sdiv	%l4,	0x0CA0,	%g3
	for	%f4,	%f14,	%f30
	pdist	%f26,	%f12,	%f20
	edge32	%g6,	%g5,	%i1
	mulscc	%l2,	%o1,	%i6
	edge16ln	%o5,	%i2,	%l3
	movpos	%icc,	%i7,	%i4
	bpos,pn	%xcc,	loop_2297
	movvs	%xcc,	%o7,	%o6
	mulx	%l5,	0x1153,	%l6
	tcc	%icc,	0x5
loop_2297:
	xorcc	%g4,	%l0,	%g2
	sllx	%o4,	%o0,	%g1
	ldstub	[%l7 + 0x56],	%i0
	movge	%icc,	%i5,	%o2
	fmovsn	%xcc,	%f10,	%f20
	movneg	%icc,	%o3,	%i3
	edge32n	%l1,	%l4,	%g7
	fmovsl	%xcc,	%f29,	%f27
	tcc	%icc,	0x5
	fmovscs	%xcc,	%f14,	%f8
	edge32n	%g3,	%g5,	%g6
	tgu	%xcc,	0x6
	stb	%i1,	[%l7 + 0x66]
	fblg,a	%fcc3,	loop_2298
	udivx	%l2,	0x1139,	%o1
	srax	%o5,	%i2,	%l3
	edge32ln	%i6,	%i7,	%i4
loop_2298:
	array32	%o6,	%l5,	%o7
	flush	%l7 + 0x1C
	tvc	%icc,	0x1
	ble,a	%icc,	loop_2299
	mulx	%g4,	0x01C9,	%l6
	edge16	%l0,	%o4,	%o0
	array8	%g1,	%g2,	%i0
loop_2299:
	prefetch	[%l7 + 0x6C],	 0x0
	sethi	0x10FB,	%i5
	edge32ln	%o2,	%i3,	%o3
	fpadd16	%f24,	%f18,	%f8
	set	0x31, %o7
	stba	%l4,	[%l7 + %o7] 0x23
	membar	#Sync
	srl	%l1,	%g7,	%g5
	movrgz	%g3,	0x236,	%i1
	fbl,a	%fcc2,	loop_2300
	fpsub32	%f20,	%f4,	%f10
	flush	%l7 + 0x74
	edge8	%l2,	%o1,	%o5
loop_2300:
	tl	%xcc,	0x5
	add	%i2,	0x1DC4,	%g6
	fba,a	%fcc3,	loop_2301
	fmovsl	%icc,	%f1,	%f20
	stb	%l3,	[%l7 + 0x25]
	tvs	%xcc,	0x2
loop_2301:
	andcc	%i7,	%i4,	%o6
	fmovsl	%icc,	%f29,	%f22
	bn,a	loop_2302
	alignaddrl	%l5,	%i6,	%g4
	tneg	%icc,	0x2
	movcs	%icc,	%l6,	%l0
loop_2302:
	edge8	%o4,	%o7,	%o0
	ble,a,pt	%xcc,	loop_2303
	movleu	%xcc,	%g1,	%g2
	fbuge,a	%fcc3,	loop_2304
	xnor	%i5,	%o2,	%i0
loop_2303:
	lduh	[%l7 + 0x3E],	%o3
	tgu	%xcc,	0x7
loop_2304:
	fornot1s	%f23,	%f28,	%f2
	movvc	%icc,	%l4,	%i3
	tcs	%icc,	0x7
	movl	%icc,	%l1,	%g5
	fcmps	%fcc1,	%f2,	%f1
	mulx	%g3,	0x11E9,	%g7
	bleu,a,pt	%xcc,	loop_2305
	ldsw	[%l7 + 0x44],	%i1
	ta	%icc,	0x0
	movge	%xcc,	%o1,	%l2
loop_2305:
	bleu,pn	%icc,	loop_2306
	srlx	%o5,	%g6,	%i2
	movleu	%xcc,	%i7,	%i4
	fmovsneg	%xcc,	%f10,	%f28
loop_2306:
	nop
	set	0x7C, %l2
	ldsha	[%l7 + %l2] 0x04,	%o6
	movrlez	%l3,	0x1CE,	%l5
	smul	%i6,	0x15D9,	%l6
	nop
	set	0x78, %l5
	std	%g4,	[%l7 + %l5]
	tg	%icc,	0x4
	fpsub32s	%f3,	%f1,	%f17
	udivcc	%o4,	0x0CD9,	%o7
	ldx	[%l7 + 0x18],	%l0
	fbu,a	%fcc0,	loop_2307
	array8	%g1,	%o0,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i5,	%o2,	%o3
loop_2307:
	fors	%f20,	%f19,	%f3
	fmovdl	%xcc,	%f31,	%f6
	fmovdvc	%xcc,	%f1,	%f18
	ldsb	[%l7 + 0x2B],	%i0
	fpack32	%f6,	%f0,	%f4
	umulcc	%i3,	%l1,	%l4
	fmovrsgez	%g5,	%f31,	%f27
	movcs	%xcc,	%g3,	%g7
	bneg,a	%icc,	loop_2308
	fone	%f28
	movpos	%icc,	%i1,	%o1
	fmovdgu	%xcc,	%f11,	%f24
loop_2308:
	taddcctv	%l2,	%o5,	%g6
	fnot2s	%f13,	%f23
	movrgz	%i2,	%i4,	%o6
	fbul,a	%fcc2,	loop_2309
	array16	%i7,	%l3,	%l5
	orn	%l6,	%g4,	%o4
	addcc	%i6,	%o7,	%g1
loop_2309:
	fbge,a	%fcc2,	loop_2310
	fbo	%fcc0,	loop_2311
	xnorcc	%l0,	%g2,	%o0
	edge32	%o2,	%i5,	%i0
loop_2310:
	nop
	wr	%g0,	0x23,	%asi
	stxa	%o3,	[%l7 + 0x20] %asi
	membar	#Sync
loop_2311:
	tpos	%icc,	0x6
	fcmple16	%f26,	%f10,	%i3
	fblg	%fcc2,	loop_2312
	fbue	%fcc1,	loop_2313
	movpos	%icc,	%l1,	%l4
	fnands	%f17,	%f30,	%f28
loop_2312:
	edge8ln	%g3,	%g5,	%i1
loop_2313:
	mulx	%g7,	0x142A,	%o1
	fnor	%f10,	%f16,	%f26
	srl	%o5,	0x00,	%l2
	flush	%l7 + 0x30
	wr	%g0,	0x52,	%asi
	stxa	%g6,	[%g0 + 0x210] %asi
	ldsb	[%l7 + 0x4E],	%i4
	fmul8sux16	%f22,	%f2,	%f14
	srl	%i2,	0x19,	%o6
	fandnot1s	%f17,	%f11,	%f27
	popc	%i7,	%l3
	movcs	%xcc,	%l5,	%g4
	movl	%icc,	%o4,	%l6
	tsubcc	%i6,	0x1CC7,	%o7
	tleu	%xcc,	0x5
	movrlz	%g1,	0x20B,	%l0
	movg	%icc,	%g2,	%o0
	flush	%l7 + 0x5C
	xnor	%o2,	%i0,	%o3
	edge8n	%i3,	%i5,	%l4
	nop
	setx loop_2314, %l0, %l1
	jmpl %l1, %g3
	sdiv	%g5,	0x032B,	%l1
	flush	%l7 + 0x38
	fbule,a	%fcc3,	loop_2315
loop_2314:
	srl	%i1,	%g7,	%o5
	umulcc	%o1,	0x183F,	%l2
	movvc	%xcc,	%g6,	%i2
loop_2315:
	add	%o6,	0x0137,	%i4
	fpadd16s	%f8,	%f16,	%f21
	siam	0x3
	movvs	%icc,	%i7,	%l5
	bl	loop_2316
	sdivcc	%l3,	0x0ED1,	%g4
	fmovrse	%l6,	%f26,	%f6
	mulx	%o4,	%i6,	%g1
loop_2316:
	fnands	%f28,	%f14,	%f30
	brnz,a	%o7,	loop_2317
	fmovrdgz	%g2,	%f30,	%f6
	bl	loop_2318
	array8	%l0,	%o2,	%o0
loop_2317:
	lduw	[%l7 + 0x44],	%i0
	movre	%i3,	0x33A,	%i5
loop_2318:
	array16	%o3,	%l4,	%g5
	set	0x70, %o5
	lduwa	[%l7 + %o5] 0x81,	%l1
	xnor	%i1,	0x0CD2,	%g3
	nop
	setx	loop_2319,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	or	%o5,	0x0A9F,	%g7
	tsubcctv	%o1,	0x1965,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2319:
	array8	%g6,	%i2,	%i4
	fmovsgu	%xcc,	%f22,	%f0
	fblg,a	%fcc2,	loop_2320
	xnor	%o6,	0x1642,	%i7
	tne	%xcc,	0x5
	andn	%l5,	%g4,	%l6
loop_2320:
	fors	%f23,	%f30,	%f13
	fmovdneg	%xcc,	%f7,	%f0
	movleu	%icc,	%o4,	%l3
	bvs,pt	%icc,	loop_2321
	andn	%g1,	0x0998,	%i6
	popc	%o7,	%l0
	movrlez	%g2,	0x1BF,	%o2
loop_2321:
	bgu	loop_2322
	udivx	%i0,	0x0109,	%o0
	fblg	%fcc3,	loop_2323
	edge16ln	%i3,	%o3,	%i5
loop_2322:
	nop
	set	0x38, %i5
	prefetcha	[%l7 + %i5] 0x18,	 0x1
loop_2323:
	srax	%l1,	0x0B,	%i1
	tcs	%icc,	0x1
	orcc	%g3,	%g5,	%o5
	xorcc	%g7,	0x11E6,	%o1
	and	%g6,	0x0D94,	%l2
	andn	%i2,	0x0929,	%i4
	tgu	%icc,	0x1
	fmuld8ulx16	%f28,	%f27,	%f6
	bneg,pn	%xcc,	loop_2324
	fcmped	%fcc1,	%f2,	%f26
	movleu	%icc,	%i7,	%o6
	orn	%l5,	%g4,	%l6
loop_2324:
	sdivcc	%l3,	0x0037,	%o4
	fbue,a	%fcc3,	loop_2325
	bneg,pt	%xcc,	loop_2326
	edge32ln	%g1,	%o7,	%l0
	bcc	%icc,	loop_2327
loop_2325:
	umulcc	%g2,	%o2,	%i0
loop_2326:
	nop
	set	0x1D, %i0
	lduba	[%l7 + %i0] 0x10,	%i6
loop_2327:
	fmul8x16al	%f30,	%f7,	%f26
	fbo,a	%fcc0,	loop_2328
	edge8	%o0,	%i3,	%i5
	edge16l	%o3,	%l1,	%l4
	te	%xcc,	0x5
loop_2328:
	prefetch	[%l7 + 0x0C],	 0x1
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	fbne	%fcc2,	loop_2329
	std	%g4,	[%l7 + 0x10]
	movneg	%icc,	%o5,	%g3
	fmovsvc	%icc,	%f6,	%f27
loop_2329:
	fmovsa	%icc,	%f4,	%f20
	tpos	%xcc,	0x5
	bshuffle	%f0,	%f14,	%f22
	nop
	set	0x10, %o3
	std	%f30,	[%l7 + %o3]
	fbne	%fcc2,	loop_2330
	movleu	%icc,	%o1,	%g7
	edge32	%l2,	%g6,	%i4
	sll	%i7,	%o6,	%l5
loop_2330:
	sdivx	%g4,	0x0E9F,	%l6
	udivcc	%l3,	0x0E50,	%i2
	set	0x52, %i7
	lduba	[%l7 + %i7] 0x89,	%g1
	edge32	%o4,	%o7,	%g2
	swap	[%l7 + 0x2C],	%l0
	tcc	%icc,	0x7
	xor	%o2,	%i6,	%i0
	stx	%i3,	[%l7 + 0x18]
	fmovdl	%xcc,	%f6,	%f11
	ldsb	[%l7 + 0x6A],	%o0
	subc	%o3,	0x020B,	%l1
	tgu	%icc,	0x5
	movrgz	%l4,	0x016,	%i5
	mova	%icc,	%g5,	%o5
	andncc	%g3,	%o1,	%i1
	fbul	%fcc0,	loop_2331
	bg,a	loop_2332
	movneg	%xcc,	%l2,	%g7
	sdiv	%g6,	0x0540,	%i7
loop_2331:
	nop
	set	0x2B, %l0
	stba	%o6,	[%l7 + %l0] 0x23
	membar	#Sync
loop_2332:
	smul	%i4,	0x0BB8,	%l5
	subccc	%l6,	0x1322,	%g4
	or	%l3,	%g1,	%i2
	fmovs	%f14,	%f23
	brlez,a	%o7,	loop_2333
	fba	%fcc1,	loop_2334
	fcmps	%fcc0,	%f15,	%f26
	fmovde	%icc,	%f18,	%f27
loop_2333:
	bshuffle	%f4,	%f16,	%f22
loop_2334:
	fbul,a	%fcc3,	loop_2335
	array32	%g2,	%o4,	%l0
	fmovda	%icc,	%f7,	%f20
	fcmpne32	%f22,	%f6,	%o2
loop_2335:
	sll	%i6,	0x11,	%i3
	fmovsgu	%xcc,	%f27,	%f21
	movl	%xcc,	%i0,	%o0
	subcc	%o3,	0x05A7,	%l4
	umulcc	%l1,	%g5,	%i5
	movrgz	%g3,	%o1,	%i1
	fmovdge	%xcc,	%f15,	%f13
	fbu	%fcc1,	loop_2336
	fnot2	%f22,	%f2
	movrne	%o5,	0x0F1,	%g7
	fbl	%fcc2,	loop_2337
loop_2336:
	lduh	[%l7 + 0x16],	%l2
	brgez	%i7,	loop_2338
	movle	%icc,	%o6,	%g6
loop_2337:
	or	%i4,	%l5,	%g4
	addcc	%l6,	0x18D8,	%l3
loop_2338:
	fmovda	%xcc,	%f7,	%f15
	taddcc	%i2,	%o7,	%g2
	tsubcc	%o4,	%g1,	%l0
	movle	%xcc,	%o2,	%i3
	bl,a	loop_2339
	edge16ln	%i6,	%o0,	%i0
	fmovde	%icc,	%f21,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2339:
	edge32	%o3,	%l4,	%g5
	srlx	%l1,	%i5,	%o1
	fsrc2	%f4,	%f0
	alignaddr	%i1,	%g3,	%g7
	sdivx	%o5,	0x02E8,	%l2
	tne	%icc,	0x1
	fbo,a	%fcc2,	loop_2340
	ldstub	[%l7 + 0x38],	%i7
	addc	%g6,	0x0264,	%i4
	nop
	setx loop_2341, %l0, %l1
	jmpl %l1, %o6
loop_2340:
	fbge,a	%fcc2,	loop_2342
	andcc	%g4,	%l6,	%l5
	tvc	%icc,	0x6
loop_2341:
	movrgez	%i2,	%o7,	%g2
loop_2342:
	fmovdneg	%xcc,	%f22,	%f26
	fmovsl	%xcc,	%f27,	%f5
	subc	%o4,	%g1,	%l0
	smulcc	%l3,	%o2,	%i6
	edge16l	%o0,	%i0,	%o3
	umulcc	%l4,	%g5,	%l1
	fpsub16s	%f28,	%f16,	%f6
	fmovs	%f15,	%f30
	movvc	%xcc,	%i3,	%i5
	popc	%i1,	%g3
	fblg	%fcc1,	loop_2343
	sdivcc	%g7,	0x03C1,	%o5
	movleu	%xcc,	%l2,	%i7
	fbl	%fcc1,	loop_2344
loop_2343:
	movg	%icc,	%g6,	%o1
	alignaddr	%i4,	%g4,	%l6
	fmovd	%f6,	%f12
loop_2344:
	edge8n	%o6,	%l5,	%i2
	edge8ln	%o7,	%g2,	%o4
	alignaddr	%g1,	%l3,	%l0
	fbue,a	%fcc0,	loop_2345
	pdist	%f22,	%f12,	%f4
	sdivcc	%o2,	0x125B,	%o0
	fnors	%f1,	%f1,	%f28
loop_2345:
	movne	%xcc,	%i0,	%i6
	addcc	%o3,	0x0DDE,	%l4
	edge8	%g5,	%l1,	%i5
	sdivcc	%i3,	0x070F,	%i1
	edge16l	%g3,	%g7,	%o5
	ldx	[%l7 + 0x60],	%i7
	xnor	%l2,	0x1D79,	%g6
	fandnot1	%f2,	%f2,	%f24
	tneg	%icc,	0x7
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x24] %asi,	%f1
	edge32l	%i4,	%g4,	%l6
	te	%icc,	0x7
	tcc	%icc,	0x2
	udivcc	%o1,	0x0340,	%o6
	array32	%i2,	%o7,	%l5
	set	0x20, %g2
	stda	%g2,	[%l7 + %g2] 0x14
	andncc	%o4,	%g1,	%l0
	fpadd16s	%f13,	%f23,	%f27
	brlz	%o2,	loop_2346
	fcmpeq32	%f20,	%f12,	%l3
	movrlez	%o0,	%i0,	%o3
	fmovdg	%icc,	%f19,	%f16
loop_2346:
	edge32	%i6,	%g5,	%l1
	pdist	%f10,	%f24,	%f28
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] %asi,	%l4,	%i3
	edge16n	%i5,	%g3,	%i1
	mova	%xcc,	%o5,	%g7
	fbg,a	%fcc2,	loop_2347
	mulscc	%l2,	0x1384,	%g6
	bne,a	loop_2348
	udivx	%i7,	0x1B18,	%i4
loop_2347:
	mulx	%g4,	%o1,	%l6
	sir	0x0F58
loop_2348:
	edge16	%o6,	%o7,	%i2
	taddcctv	%g2,	0x05E4,	%o4
	addccc	%g1,	%l0,	%l5
	edge8	%l3,	%o2,	%i0
	and	%o3,	0x0CEE,	%i6
	movg	%xcc,	%g5,	%l1
	nop
	setx	loop_2349,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%xcc,	%o0,	%i3
	movpos	%icc,	%l4,	%g3
	movleu	%xcc,	%i1,	%i5
loop_2349:
	te	%icc,	0x7
	fmovsne	%xcc,	%f24,	%f8
	bge,pt	%icc,	loop_2350
	fcmpes	%fcc2,	%f19,	%f8
	fmovrdlez	%o5,	%f2,	%f16
	orcc	%l2,	%g6,	%i7
loop_2350:
	fmovde	%xcc,	%f24,	%f4
	brz,a	%g7,	loop_2351
	udivx	%g4,	0x0CDE,	%i4
	fnot1s	%f7,	%f1
	lduw	[%l7 + 0x34],	%l6
loop_2351:
	subccc	%o1,	%o6,	%i2
	mova	%icc,	%o7,	%g2
	ldd	[%l7 + 0x40],	%f22
	smulcc	%o4,	0x033B,	%g1
	taddcctv	%l5,	%l0,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f7,	%f26,	%f24
	movrlez	%i0,	%o3,	%l3
	movgu	%xcc,	%i6,	%g5
	edge8l	%o0,	%l1,	%i3
	ldub	[%l7 + 0x3A],	%g3
	set	0x20, %i6
	lduha	[%l7 + %i6] 0x88,	%l4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x04,	%i1,	%o5
	andn	%l2,	0x1320,	%g6
	tge	%xcc,	0x0
	movgu	%xcc,	%i5,	%i7
	nop
	set	0x70, %i4
	stx	%g4,	[%l7 + %i4]
	fandnot1	%f10,	%f8,	%f14
	bl,a	loop_2352
	edge16	%g7,	%i4,	%o1
	fmovdneg	%icc,	%f17,	%f8
	fmovspos	%xcc,	%f31,	%f15
loop_2352:
	sdivcc	%o6,	0x1DB9,	%i2
	fmul8x16al	%f15,	%f15,	%f4
	tsubcc	%o7,	0x005F,	%g2
	movrgez	%l6,	0x3B4,	%o4
	fpack32	%f28,	%f18,	%f30
	popc	%g1,	%l0
	edge8n	%l5,	%o2,	%o3
	tcs	%xcc,	0x5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] %asi,	%l3,	%i6
	fpmerge	%f25,	%f15,	%f8
	andn	%g5,	%o0,	%i0
	subc	%i3,	%l1,	%g3
	taddcctv	%l4,	%i1,	%l2
	sllx	%g6,	%o5,	%i5
	fbg,a	%fcc2,	loop_2353
	fmul8x16	%f3,	%f20,	%f12
	std	%f12,	[%l7 + 0x68]
	umul	%i7,	%g4,	%i4
loop_2353:
	edge32l	%o1,	%g7,	%o6
	ldsw	[%l7 + 0x08],	%o7
	fbu,a	%fcc1,	loop_2354
	taddcctv	%g2,	%l6,	%o4
	movvs	%xcc,	%i2,	%g1
	tle	%icc,	0x2
loop_2354:
	brlz	%l0,	loop_2355
	fpmerge	%f19,	%f6,	%f22
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o2,	%o3
loop_2355:
	addc	%l3,	0x0AC5,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l5,	%o0,	%i0
	fbg,a	%fcc3,	loop_2356
	mova	%xcc,	%i3,	%g5
	movge	%icc,	%g3,	%l1
	brgez,a	%l4,	loop_2357
loop_2356:
	tne	%xcc,	0x4
	sethi	0x11C5,	%i1
	udivcc	%l2,	0x1009,	%o5
loop_2357:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g6,	0x13D0,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i7,	%g4,	%i4
	ldstub	[%l7 + 0x1D],	%g7
	movcc	%icc,	%o1,	%o7
	bshuffle	%f22,	%f28,	%f2
	prefetch	[%l7 + 0x50],	 0x0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%o6
	sll	%l6,	0x08,	%i2
	sth	%o4,	[%l7 + 0x6A]
	fmul8x16al	%f16,	%f18,	%f4
	fpsub32	%f22,	%f10,	%f10
	fmovsge	%xcc,	%f11,	%f4
	umul	%g1,	%o2,	%l0
	fmovsleu	%icc,	%f18,	%f27
	xnorcc	%l3,	0x0FFE,	%o3
	array16	%i6,	%l5,	%o0
	movrlez	%i0,	%i3,	%g3
	movge	%icc,	%l1,	%l4
	movvs	%xcc,	%g5,	%l2
	ble,pt	%icc,	loop_2358
	xnor	%o5,	%i1,	%i5
	fnegs	%f31,	%f4
	fone	%f0
loop_2358:
	bge,pt	%xcc,	loop_2359
	fbge	%fcc1,	loop_2360
	sra	%i7,	0x0C,	%g4
	move	%icc,	%i4,	%g7
loop_2359:
	mulx	%o1,	%o7,	%g2
loop_2360:
	udiv	%o6,	0x0E0E,	%l6
	udiv	%i2,	0x0740,	%o4
	fcmpne32	%f10,	%f28,	%g1
	array16	%o2,	%l0,	%g6
	sll	%l3,	%i6,	%l5
	fpsub32s	%f1,	%f4,	%f8
	sir	0x0A3B
	edge8ln	%o3,	%o0,	%i0
	tvc	%xcc,	0x4
	brlez,a	%g3,	loop_2361
	edge8n	%i3,	%l1,	%l4
	fnegd	%f0,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2361:
	xor	%g5,	0x1B8C,	%l2
	add	%i1,	0x070A,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%i7,	%f16,	%f21
	fbe	%fcc0,	loop_2362
	movcc	%xcc,	%o5,	%g4
	bl,pt	%xcc,	loop_2363
	fmovsl	%xcc,	%f13,	%f5
loop_2362:
	sdiv	%g7,	0x0FB4,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2363:
	fmovdpos	%xcc,	%f21,	%f27
	fmul8x16au	%f31,	%f22,	%f30
	and	%i4,	%o7,	%o6
	fmovdpos	%icc,	%f13,	%f25
	fmovdneg	%xcc,	%f22,	%f8
	fbe,a	%fcc3,	loop_2364
	ldstub	[%l7 + 0x66],	%l6
	orn	%i2,	%o4,	%g2
	edge16l	%o2,	%g1,	%l0
loop_2364:
	udiv	%l3,	0x0C46,	%i6
	edge8l	%g6,	%l5,	%o0
	brgez,a	%o3,	loop_2365
	sdiv	%g3,	0x0C98,	%i0
	subccc	%l1,	0x1921,	%i3
	edge16ln	%l4,	%l2,	%i1
loop_2365:
	fmovrse	%i5,	%f18,	%f16
	orn	%g5,	0x09A9,	%i7
	tcc	%xcc,	0x3
	fmovsn	%icc,	%f8,	%f5
	fand	%f28,	%f28,	%f30
	movgu	%icc,	%g4,	%o5
	movvs	%icc,	%g7,	%i4
	movg	%xcc,	%o7,	%o1
	set	0x10, %l4
	ldxa	[%g0 + %l4] 0x4f,	%l6
	fornot1	%f6,	%f8,	%f30
	brlz	%o6,	loop_2366
	swap	[%l7 + 0x48],	%o4
	lduh	[%l7 + 0x6A],	%g2
	alignaddrl	%o2,	%i2,	%g1
loop_2366:
	nop
	wr	%g0,	0x80,	%asi
	stxa	%l0,	[%l7 + 0x48] %asi
	wr	%g0,	0x89,	%asi
	stxa	%l3,	[%l7 + 0x70] %asi
	mova	%icc,	%g6,	%i6
	brlz,a	%o0,	loop_2367
	sll	%o3,	0x0C,	%l5
	array8	%g3,	%l1,	%i3
	edge16	%l4,	%l2,	%i1
loop_2367:
	srax	%i5,	%g5,	%i7
	taddcctv	%g4,	0x08E6,	%o5
	tvs	%xcc,	0x5
	orcc	%g7,	0x0056,	%i0
	tne	%xcc,	0x4
	tge	%xcc,	0x2
	edge8ln	%o7,	%o1,	%l6
	orncc	%o6,	0x11E9,	%i4
	fbo	%fcc3,	loop_2368
	swap	[%l7 + 0x48],	%g2
	and	%o2,	0x0280,	%i2
	movpos	%xcc,	%o4,	%l0
loop_2368:
	ldstub	[%l7 + 0x44],	%g1
	addcc	%g6,	%i6,	%l3
	fexpand	%f15,	%f4
	tvc	%icc,	0x6
	alignaddrl	%o3,	%l5,	%o0
	fmovdvs	%xcc,	%f15,	%f14
	edge16l	%l1,	%g3,	%l4
	wr	%g0,	0x18,	%asi
	sta	%f6,	[%l7 + 0x14] %asi
	tsubcc	%l2,	%i3,	%i1
	te	%xcc,	0x4
	membar	0x1D
	sra	%g5,	0x19,	%i5
	move	%xcc,	%i7,	%o5
	alignaddrl	%g7,	%i0,	%o7
	fmovrsne	%o1,	%f6,	%f20
	brgez,a	%l6,	loop_2369
	bneg,a	%xcc,	loop_2370
	movg	%xcc,	%o6,	%i4
	movrne	%g2,	0x3C6,	%o2
loop_2369:
	ldstub	[%l7 + 0x7C],	%g4
loop_2370:
	sir	0x1C90
	brlz,a	%o4,	loop_2371
	nop
	setx	loop_2372,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bne	loop_2373
	fsrc1s	%f18,	%f11
loop_2371:
	nop
	setx	loop_2374,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2372:
	fmovrsgz	%i2,	%f25,	%f21
loop_2373:
	edge8ln	%l0,	%g1,	%i6
	call	loop_2375
loop_2374:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc	%xcc,	loop_2376
	and	%g6,	%l3,	%l5
loop_2375:
	fmuld8sux16	%f29,	%f12,	%f16
	fornot1	%f10,	%f24,	%f4
loop_2376:
	subc	%o3,	0x063F,	%l1
	fmovrsne	%g3,	%f20,	%f8
	bvc,a,pn	%icc,	loop_2377
	sir	0x1E0E
	movcc	%icc,	%l4,	%o0
	fmovsne	%icc,	%f14,	%f22
loop_2377:
	subc	%i3,	%i1,	%l2
	fcmped	%fcc3,	%f2,	%f0
	umul	%i5,	0x1D29,	%g5
	set	0x10, %g5
	ldda	[%l7 + %g5] 0x18,	%o4
	sllx	%i7,	0x00,	%g7
	srax	%o7,	0x0E,	%o1
	sll	%l6,	0x1A,	%o6
	tleu	%xcc,	0x4
	edge32l	%i4,	%g2,	%i0
	wr	%g0,	0x11,	%asi
	stwa	%g4,	[%l7 + 0x64] %asi
	movge	%xcc,	%o4,	%i2
	bcs,a,pn	%xcc,	loop_2378
	edge32l	%l0,	%g1,	%o2
	brgz	%i6,	loop_2379
	edge32	%g6,	%l5,	%l3
loop_2378:
	udiv	%l1,	0x0ECA,	%g3
	bne,a,pn	%icc,	loop_2380
loop_2379:
	fnands	%f2,	%f13,	%f25
	membar	0x14
	brlez,a	%l4,	loop_2381
loop_2380:
	fones	%f3
	subcc	%o0,	%i3,	%o3
	fmovs	%f20,	%f29
loop_2381:
	edge8n	%l2,	%i5,	%i1
	movn	%xcc,	%o5,	%g5
	pdist	%f28,	%f4,	%f12
	orncc	%g7,	%i7,	%o7
	xnor	%l6,	%o1,	%o6
	sethi	0x001C,	%i4
	subccc	%i0,	%g4,	%g2
	or	%i2,	%l0,	%o4
	set	0x108, %l3
	stxa	%g1,	[%g0 + %l3] 0x52
	edge8l	%i6,	%g6,	%o2
	edge8l	%l5,	%l3,	%g3
	xnorcc	%l4,	0x17EE,	%l1
	movgu	%xcc,	%o0,	%o3
	fmovdleu	%icc,	%f1,	%f20
	fbe	%fcc0,	loop_2382
	fxnors	%f9,	%f1,	%f0
	edge32n	%i3,	%l2,	%i1
	bvs,a	loop_2383
loop_2382:
	fxnor	%f2,	%f4,	%f30
	movvc	%icc,	%i5,	%g5
	fxnor	%f0,	%f20,	%f24
loop_2383:
	orcc	%g7,	0x1C70,	%o5
	brz	%i7,	loop_2384
	sdivx	%l6,	0x0908,	%o7
	fbul,a	%fcc1,	loop_2385
	tvs	%icc,	0x0
loop_2384:
	stb	%o1,	[%l7 + 0x3F]
	fzero	%f22
loop_2385:
	fzeros	%f2
	stb	%i4,	[%l7 + 0x54]
	movne	%xcc,	%i0,	%o6
	popc	%g2,	%i2
	sdivcc	%l0,	0x18D5,	%g4
	addc	%g1,	%o4,	%g6
	tle	%icc,	0x7
	addcc	%o2,	0x021F,	%l5
	xor	%l3,	0x0C15,	%g3
	fbn,a	%fcc2,	loop_2386
	brgez	%i6,	loop_2387
	fmovde	%xcc,	%f14,	%f14
	edge8ln	%l4,	%o0,	%o3
loop_2386:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2387:
	tleu	%xcc,	0x0
	smul	%l1,	%i3,	%i1
	andncc	%i5,	%g5,	%g7
	fxnors	%f29,	%f4,	%f15
	movpos	%xcc,	%o5,	%l2
	set	0x5A, %g4
	stba	%l6,	[%l7 + %g4] 0x2b
	membar	#Sync
	movgu	%xcc,	%i7,	%o1
	umulcc	%o7,	%i0,	%i4
	brnz	%o6,	loop_2388
	fcmped	%fcc1,	%f10,	%f20
	or	%g2,	0x01ED,	%i2
	smulcc	%g4,	%g1,	%o4
loop_2388:
	tpos	%icc,	0x2
	fbge	%fcc3,	loop_2389
	subc	%l0,	%o2,	%l5
	fpack16	%f10,	%f30
	set	0x5E, %l6
	ldstuba	[%l7 + %l6] 0x80,	%l3
loop_2389:
	addccc	%g3,	%g6,	%l4
	movre	%i6,	%o0,	%l1
	fmovspos	%xcc,	%f4,	%f31
	tvs	%icc,	0x3
	tsubcc	%o3,	%i3,	%i5
	edge8	%i1,	%g7,	%o5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x7E] %asi,	%l2
	mulx	%l6,	%g5,	%i7
	fzero	%f14
	movrlz	%o7,	0x244,	%o1
	umulcc	%i0,	0x1655,	%o6
	subc	%i4,	0x097A,	%i2
	xorcc	%g4,	0x1594,	%g1
	fpadd16s	%f16,	%f30,	%f7
	fbue,a	%fcc1,	loop_2390
	movvs	%xcc,	%o4,	%g2
	edge8ln	%o2,	%l5,	%l0
	subccc	%g3,	%g6,	%l3
loop_2390:
	xorcc	%i6,	%o0,	%l4
	xnor	%l1,	0x09EF,	%i3
	edge32	%i5,	%o3,	%i1
	edge32	%g7,	%l2,	%l6
	call	loop_2391
	alignaddr	%o5,	%i7,	%g5
	set	0x18, %i3
	lda	[%l7 + %i3] 0x89,	%f11
loop_2391:
	fmuld8sux16	%f1,	%f13,	%f6
	tgu	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x08],	%f24
	lduh	[%l7 + 0x48],	%o7
	std	%i0,	[%l7 + 0x40]
	fnot1s	%f6,	%f18
	addc	%o6,	%o1,	%i2
	fandnot1s	%f21,	%f5,	%f19
	addc	%i4,	%g4,	%o4
	subccc	%g2,	0x1418,	%g1
	orcc	%l5,	%l0,	%g3
	siam	0x4
	fmovd	%f26,	%f30
	fmovd	%f6,	%f6
	edge16n	%g6,	%o2,	%i6
	ta	%icc,	0x2
	srlx	%o0,	0x14,	%l3
	ld	[%l7 + 0x5C],	%f27
	taddcc	%l1,	%l4,	%i3
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	stb	%o3,	[%l7 + 0x7A]
	sub	%i1,	0x1A84,	%i5
	set	0x1C, %o2
	sta	%f17,	[%l7 + %o2] 0x10
	movrne	%l2,	%l6,	%g7
	sub	%o5,	0x03B6,	%g5
	edge32l	%i7,	%o7,	%i0
	srlx	%o6,	0x10,	%o1
	array16	%i2,	%g4,	%i4
	sub	%o4,	%g1,	%l5
	fnands	%f2,	%f29,	%f26
	fpsub16s	%f27,	%f17,	%f10
	addcc	%g2,	0x007B,	%l0
	call	loop_2392
	fcmpne32	%f2,	%f4,	%g6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
loop_2392:
	movn	%icc,	%i6,	%o2
	movle	%icc,	%l3,	%l1
	sir	0x01AB
	tge	%xcc,	0x6
	fmovsne	%xcc,	%f10,	%f0
	edge8n	%l4,	%o0,	%i3
	sra	%o3,	0x19,	%i5
	sub	%l2,	0x170B,	%l6
	edge8l	%g7,	%i1,	%o5
	edge32n	%g5,	%o7,	%i0
	tn	%xcc,	0x4
	tneg	%xcc,	0x0
	tg	%icc,	0x1
	pdist	%f20,	%f30,	%f0
	fnands	%f27,	%f10,	%f3
	movn	%icc,	%o6,	%o1
	wr	%g0,	0xe2,	%asi
	stha	%i2,	[%l7 + 0x1A] %asi
	membar	#Sync
	tl	%icc,	0x2
	edge32ln	%g4,	%i7,	%o4
	fmovsneg	%icc,	%f19,	%f0
	subcc	%g1,	0x1585,	%l5
	add	%g2,	0x0357,	%i4
	umul	%g6,	%g3,	%l0
	bpos	loop_2393
	edge32l	%i6,	%o2,	%l3
	movcs	%icc,	%l1,	%l4
	membar	0x63
loop_2393:
	bg	loop_2394
	edge16l	%o0,	%i3,	%o3
	edge16l	%l2,	%i5,	%g7
	andncc	%l6,	%i1,	%o5
loop_2394:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f15,	%f12,	%f24
	te	%xcc,	0x2
	smulcc	%g5,	0x0DED,	%i0
	fbne,a	%fcc1,	loop_2395
	andcc	%o7,	0x05F9,	%o1
	tsubcctv	%o6,	0x0328,	%g4
	fmovsle	%icc,	%f4,	%f13
loop_2395:
	fsrc2s	%f30,	%f0
	movneg	%icc,	%i7,	%o4
	umulcc	%g1,	0x16CF,	%l5
	nop
	setx	loop_2396,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdlez	%g2,	%f28,	%f2
	movl	%xcc,	%i2,	%i4
	smul	%g3,	0x0A8F,	%l0
loop_2396:
	tleu	%icc,	0x6
	tsubcctv	%i6,	0x1F65,	%g6
	alignaddrl	%o2,	%l3,	%l1
	movcs	%icc,	%l4,	%o0
	edge32l	%i3,	%o3,	%l2
	movcs	%icc,	%g7,	%l6
	fmovsneg	%xcc,	%f12,	%f25
	mulscc	%i5,	%o5,	%g5
	sdiv	%i0,	0x07F6,	%i1
	fmovrdgez	%o7,	%f2,	%f2
	ba	loop_2397
	fmovdvc	%xcc,	%f7,	%f2
	sdiv	%o6,	0x0AC5,	%g4
	nop
	set	0x48, %o4
	stx	%i7,	[%l7 + %o4]
loop_2397:
	movre	%o1,	%g1,	%l5
	and	%o4,	%i2,	%i4
	nop
	setx	loop_2398,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subccc	%g3,	0x146F,	%l0
	call	loop_2399
	umulcc	%i6,	0x1738,	%g6
loop_2398:
	fnands	%f15,	%f28,	%f17
	subc	%g2,	%l3,	%o2
loop_2399:
	addcc	%l1,	%l4,	%o0
	fmovdleu	%xcc,	%f18,	%f0
	fornot2	%f2,	%f18,	%f14
	movleu	%xcc,	%o3,	%i3
	edge16l	%g7,	%l2,	%l6
	fblg	%fcc1,	loop_2400
	brlez,a	%o5,	loop_2401
	edge32ln	%i5,	%i0,	%g5
	fbg	%fcc2,	loop_2402
loop_2400:
	sir	0x130E
loop_2401:
	fnot2s	%f13,	%f29
	tsubcc	%o7,	%o6,	%i1
loop_2402:
	lduw	[%l7 + 0x48],	%g4
	sethi	0x13F7,	%o1
	fmovdgu	%icc,	%f24,	%f5
	movl	%icc,	%g1,	%i7
	movleu	%icc,	%l5,	%i2
	tgu	%xcc,	0x0
	set	0x24, %o6
	lda	[%l7 + %o6] 0x88,	%f2
	srlx	%i4,	%o4,	%g3
	movvs	%icc,	%i6,	%g6
	brlz	%l0,	loop_2403
	srlx	%g2,	%o2,	%l1
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
loop_2403:
	nop
	wr	%g0,	0x88,	%asi
	stxa	%l4,	[%l7 + 0x38] %asi
	addccc	%o3,	0x1C4B,	%o0
	xnor	%g7,	0x0326,	%i3
	membar	0x44
	fmovrdgz	%l6,	%f24,	%f12
	udivcc	%l2,	0x0C73,	%i5
	st	%f22,	[%l7 + 0x74]
	movpos	%icc,	%i0,	%o5
	fmovdcs	%xcc,	%f25,	%f27
	edge32ln	%g5,	%o7,	%o6
	srl	%g4,	%o1,	%g1
	sir	0x083F
	sth	%i1,	[%l7 + 0x6C]
	umul	%i7,	0x0555,	%l5
	fmovsge	%xcc,	%f6,	%f3
	movcs	%icc,	%i2,	%o4
	std	%f10,	[%l7 + 0x40]
	andn	%i4,	%g3,	%i6
	edge32l	%l0,	%g6,	%g2
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
	ba,pn	%icc,	loop_2404
	prefetch	[%l7 + 0x34],	 0x3
	brnz	%l3,	loop_2405
	lduh	[%l7 + 0x4A],	%l1
loop_2404:
	movneg	%xcc,	%l4,	%o3
	fcmpeq16	%f2,	%f4,	%g7
loop_2405:
	edge32ln	%o0,	%i3,	%l6
	be,pn	%icc,	loop_2406
	fandnot1s	%f1,	%f2,	%f7
	nop
	setx	loop_2407,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movpos	%icc,	%i5,	%i0
loop_2406:
	te	%xcc,	0x7
	te	%xcc,	0x1
loop_2407:
	fmul8x16al	%f13,	%f12,	%f6
	fcmple32	%f8,	%f10,	%l2
	edge32ln	%o5,	%g5,	%o6
	orcc	%g4,	%o7,	%g1
	fcmpes	%fcc3,	%f28,	%f20
	for	%f4,	%f24,	%f14
	subcc	%i1,	0x03B1,	%o1
	fnands	%f3,	%f17,	%f7
	movgu	%xcc,	%i7,	%l5
	edge32ln	%o4,	%i2,	%i4
	fpsub16s	%f22,	%f17,	%f12
	membar	0x51
	flush	%l7 + 0x10
	tvs	%xcc,	0x6
	fbu,a	%fcc1,	loop_2408
	udivcc	%i6,	0x1469,	%l0
	nop
	set	0x58, %i2
	stx	%g3,	[%l7 + %i2]
	andncc	%g2,	%g6,	%o2
loop_2408:
	te	%xcc,	0x5
	fmovsneg	%xcc,	%f14,	%f4
	movcc	%icc,	%l3,	%l4
	be,a,pn	%icc,	loop_2409
	fnegd	%f24,	%f8
	array8	%l1,	%g7,	%o3
	movrlez	%i3,	%o0,	%l6
loop_2409:
	fnor	%f0,	%f16,	%f30
	subc	%i5,	%l2,	%o5
	ldsw	[%l7 + 0x2C],	%i0
	tl	%icc,	0x5
	udivx	%g5,	0x0A02,	%o6
	fmovsne	%xcc,	%f1,	%f16
	andn	%o7,	0x19B3,	%g1
	fmovdge	%xcc,	%f7,	%f0
	tleu	%xcc,	0x2
	tleu	%icc,	0x2
	subcc	%g4,	%o1,	%i7
	fzeros	%f10
	fmovsne	%icc,	%f17,	%f6
	fandnot2s	%f29,	%f4,	%f20
	orcc	%i1,	0x1CAE,	%o4
	edge8l	%i2,	%l5,	%i6
	lduh	[%l7 + 0x26],	%i4
	mova	%icc,	%l0,	%g3
	array32	%g6,	%g2,	%l3
	edge32n	%o2,	%l4,	%l1
	fmul8x16al	%f19,	%f25,	%f4
	tg	%xcc,	0x4
	wr	%g0,	0xea,	%asi
	stba	%o3,	[%l7 + 0x68] %asi
	membar	#Sync
	fbule	%fcc0,	loop_2410
	tleu	%xcc,	0x0
	tcc	%xcc,	0x7
	udivcc	%g7,	0x071C,	%o0
loop_2410:
	fsrc2	%f28,	%f0
	movle	%xcc,	%l6,	%i3
	tsubcc	%l2,	%i5,	%o5
	array32	%i0,	%g5,	%o7
	edge16	%g1,	%o6,	%g4
	smulcc	%i7,	0x071D,	%i1
	srl	%o4,	%o1,	%l5
	tg	%xcc,	0x4
	edge32l	%i2,	%i4,	%l0
	tle	%xcc,	0x3
	brlz	%i6,	loop_2411
	tcs	%icc,	0x7
	edge32n	%g3,	%g6,	%l3
	xnor	%o2,	%l4,	%l1
loop_2411:
	te	%xcc,	0x1
	ldub	[%l7 + 0x51],	%o3
	tne	%xcc,	0x5
	fand	%f8,	%f0,	%f12
	movne	%xcc,	%g2,	%o0
	orn	%g7,	%l6,	%l2
	mova	%icc,	%i3,	%i5
	fabss	%f31,	%f5
	tleu	%icc,	0x7
	set	0x08, %l1
	lduwa	[%l7 + %l1] 0x11,	%i0
	set	0x34, %g1
	ldsha	[%l7 + %g1] 0x15,	%o5
	tne	%icc,	0x3
	bcc	%xcc,	loop_2412
	array16	%g5,	%g1,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%g4,	0x1811,	%o6
loop_2412:
	umulcc	%i1,	0x13E8,	%i7
	umul	%o4,	0x12F6,	%o1
	fmovdge	%xcc,	%f31,	%f12
	movneg	%icc,	%l5,	%i4
	movleu	%icc,	%l0,	%i6
	umulcc	%g3,	0x1A6C,	%g6
	bcs,a,pt	%xcc,	loop_2413
	tcs	%xcc,	0x0
	fmovdg	%icc,	%f7,	%f5
	tsubcc	%l3,	0x01F7,	%o2
loop_2413:
	membar	0x41
	or	%l4,	%i2,	%o3
	fbe	%fcc2,	loop_2414
	mova	%icc,	%l1,	%g2
	mulscc	%o0,	0x1609,	%l6
	fandnot1	%f8,	%f26,	%f0
loop_2414:
	fmovse	%xcc,	%f22,	%f1
	orcc	%g7,	%l2,	%i3
	edge16	%i0,	%i5,	%g5
	sdivx	%o5,	0x0093,	%o7
	sdivx	%g1,	0x00FC,	%g4
	set	0x60, %i1
	sta	%f18,	[%l7 + %i1] 0x14
	edge16n	%i1,	%o6,	%i7
	move	%icc,	%o1,	%l5
	fabss	%f10,	%f12
	fnand	%f0,	%f8,	%f28
	bleu,a,pn	%xcc,	loop_2415
	fmovdgu	%icc,	%f14,	%f31
	fmovsvs	%icc,	%f30,	%f0
	std	%f14,	[%l7 + 0x08]
loop_2415:
	subccc	%i4,	%o4,	%i6
	sdiv	%l0,	0x117D,	%g3
	fmovdle	%xcc,	%f5,	%f17
	movrlz	%l3,	0x3C6,	%o2
	srlx	%l4,	0x1D,	%g6
	flush	%l7 + 0x0C
	fcmpgt16	%f4,	%f28,	%i2
	nop
	setx	loop_2416,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnors	%f5,	%f31,	%f14
	brlez	%l1,	loop_2417
	fands	%f23,	%f25,	%f2
loop_2416:
	xorcc	%o3,	%g2,	%o0
	stw	%g7,	[%l7 + 0x48]
loop_2417:
	nop
	set	0x13, %g3
	lduba	[%l7 + %g3] 0x80,	%l6
	tsubcctv	%l2,	%i0,	%i5
	movn	%icc,	%g5,	%o5
	fandnot1	%f26,	%f10,	%f20
	movne	%xcc,	%i3,	%o7
	edge16l	%g4,	%g1,	%i1
	sra	%o6,	%i7,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x2
	fand	%f28,	%f24,	%f20
	umulcc	%i4,	0x0FC1,	%l5
	tcs	%xcc,	0x5
	taddcctv	%i6,	%o4,	%g3
	tneg	%icc,	0x7
	fmovrdlz	%l3,	%f18,	%f16
	tcs	%icc,	0x3
	fbl,a	%fcc1,	loop_2418
	orncc	%l0,	%o2,	%l4
	set	0x10, %o0
	stda	%i2,	[%l7 + %o0] 0x27
	membar	#Sync
loop_2418:
	orn	%l1,	%g6,	%g2
	alignaddr	%o3,	%o0,	%l6
	or	%g7,	%i0,	%i5
	movgu	%icc,	%g5,	%o5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x78] %asi,	%i3
	sir	0x1157
	ldd	[%l7 + 0x40],	%f0
	mulx	%l2,	0x0797,	%o7
	bpos,pn	%icc,	loop_2419
	array32	%g4,	%i1,	%o6
	bgu,a,pn	%icc,	loop_2420
	sub	%g1,	0x02E1,	%o1
loop_2419:
	fnors	%f26,	%f9,	%f18
	flush	%l7 + 0x48
loop_2420:
	ta	%icc,	0x3
	sethi	0x09FB,	%i4
	array8	%i7,	%l5,	%i6
	sir	0x1643
	sdivcc	%o4,	0x1BF6,	%g3
	movvc	%icc,	%l0,	%o2
	tsubcc	%l4,	%i2,	%l3
	flush	%l7 + 0x60
	movrgz	%l1,	0x046,	%g2
	movrlez	%g6,	0x0B8,	%o0
	movcs	%icc,	%l6,	%o3
	tvc	%icc,	0x1
	fcmpne16	%f28,	%f22,	%g7
	edge8ln	%i0,	%i5,	%g5
	nop
	setx loop_2421, %l0, %l1
	jmpl %l1, %i3
	movpos	%xcc,	%l2,	%o5
	udivx	%o7,	0x09EC,	%g4
	fcmpes	%fcc1,	%f6,	%f4
loop_2421:
	sir	0x11F5
	ta	%xcc,	0x6
	smul	%o6,	0x1B8E,	%i1
	wr	%g0,	0x18,	%asi
	sta	%f0,	[%l7 + 0x74] %asi
	orcc	%g1,	%i4,	%i7
	tleu	%xcc,	0x3
	sdivcc	%l5,	0x08A7,	%o1
	fbo	%fcc0,	loop_2422
	xnorcc	%i6,	0x1396,	%g3
	set	0x6A, %g7
	ldstuba	[%l7 + %g7] 0x19,	%o4
loop_2422:
	nop
	wr	%g0,	0x23,	%asi
	stha	%o2,	[%l7 + 0x64] %asi
	membar	#Sync
	fmovrse	%l0,	%f20,	%f10
	fmovs	%f27,	%f26
	fmovrsgz	%i2,	%f18,	%f9
	movrgz	%l3,	0x142,	%l1
	array16	%g2,	%g6,	%l4
	move	%xcc,	%l6,	%o3
	set	0x4C, %o1
	swapa	[%l7 + %o1] 0x89,	%g7
	bpos,a,pt	%icc,	loop_2423
	fmovda	%icc,	%f9,	%f19
	movge	%icc,	%o0,	%i0
	srl	%i5,	%g5,	%i3
loop_2423:
	sra	%l2,	%o5,	%g4
	fmovdn	%icc,	%f24,	%f23
	movneg	%xcc,	%o7,	%o6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x56] %asi,	%i1
	edge16	%g1,	%i7,	%i4
	fmovrsgez	%o1,	%f3,	%f8
	fcmps	%fcc3,	%f3,	%f7
	mulscc	%i6,	0x0FFF,	%g3
	xnor	%o4,	%l5,	%o2
	sir	0x142A
	std	%f2,	[%l7 + 0x18]
	xnor	%l0,	0x0922,	%l3
	sllx	%i2,	0x08,	%l1
	movcs	%icc,	%g6,	%l4
	fornot1	%f20,	%f6,	%f30
	movle	%xcc,	%l6,	%o3
	xnor	%g7,	%g2,	%o0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i5,	%i0
	ta	%xcc,	0x6
	movge	%icc,	%i3,	%l2
	movrne	%g5,	0x34F,	%o5
	ta	%xcc,	0x4
	fnegd	%f24,	%f20
	call	loop_2424
	movvc	%xcc,	%g4,	%o7
	tneg	%xcc,	0x4
	edge8n	%o6,	%g1,	%i7
loop_2424:
	fpack32	%f4,	%f26,	%f10
	set	0x3C, %g6
	ldswa	[%l7 + %g6] 0x88,	%i1
	movpos	%xcc,	%i4,	%i6
	wr	%g0,	0x0c,	%asi
	stda	%g2,	[%l7 + 0x18] %asi
	tle	%icc,	0x6
	and	%o1,	%o4,	%o2
	subc	%l0,	%l5,	%i2
	edge8l	%l1,	%g6,	%l4
	array8	%l3,	%l6,	%g7
	fmul8x16au	%f18,	%f25,	%f4
	movg	%xcc,	%o3,	%o0
	and	%i5,	0x082D,	%g2
	ba	%icc,	loop_2425
	sllx	%i0,	0x01,	%i3
	sll	%l2,	0x1B,	%o5
	taddcc	%g4,	0x19CC,	%g5
loop_2425:
	nop
	set	0x20, %l2
	prefetcha	[%l7 + %l2] 0x81,	 0x0
	swap	[%l7 + 0x08],	%g1
	tsubcctv	%i7,	%i1,	%i4
	srl	%i6,	0x03,	%g3
	fmovdcs	%xcc,	%f23,	%f28
	fcmpne16	%f28,	%f4,	%o6
	brlez,a	%o4,	loop_2426
	orncc	%o2,	%l0,	%o1
	taddcc	%l5,	0x0DAB,	%l1
	movvc	%xcc,	%i2,	%l4
loop_2426:
	movg	%xcc,	%g6,	%l3
	ba,a,pn	%icc,	loop_2427
	brgez	%l6,	loop_2428
	fbul	%fcc1,	loop_2429
	subcc	%g7,	%o0,	%o3
loop_2427:
	fbul,a	%fcc3,	loop_2430
loop_2428:
	fmovdle	%xcc,	%f19,	%f10
loop_2429:
	udiv	%i5,	0x15BF,	%g2
	edge8	%i3,	%i0,	%l2
loop_2430:
	fbo	%fcc0,	loop_2431
	fblg,a	%fcc3,	loop_2432
	siam	0x0
	movge	%icc,	%o5,	%g4
loop_2431:
	ldd	[%l7 + 0x40],	%f26
loop_2432:
	subccc	%g5,	%o7,	%g1
	lduw	[%l7 + 0x1C],	%i1
	tn	%icc,	0x2
	sdivx	%i4,	0x0B2D,	%i6
	ldx	[%l7 + 0x60],	%i7
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x58] %asi,	%g3
	sir	0x1784
	movvc	%icc,	%o6,	%o4
	fpadd16	%f12,	%f6,	%f6
	fmovrsgz	%o2,	%f12,	%f17
	subc	%o1,	%l5,	%l0
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i2
	udivx	%l1,	0x0AC1,	%g6
	ldx	[%l7 + 0x08],	%l4
	fmovdgu	%icc,	%f14,	%f4
	fmovrsne	%l6,	%f30,	%f3
	fbue,a	%fcc1,	loop_2433
	fsrc2s	%f4,	%f18
	fmovrdgz	%g7,	%f18,	%f8
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x2e,	%l2
loop_2433:
	movrlz	%o3,	%o0,	%g2
	movrlz	%i5,	%i3,	%l2
	fabss	%f19,	%f24
	orcc	%o5,	0x1710,	%g4
	movle	%xcc,	%g5,	%i0
	bge	%icc,	loop_2434
	fornot2	%f14,	%f2,	%f6
	addc	%o7,	0x08CF,	%g1
	xnorcc	%i1,	0x0E37,	%i4
loop_2434:
	movne	%icc,	%i6,	%i7
	movrlez	%g3,	0x115,	%o4
	fbne,a	%fcc0,	loop_2435
	movle	%icc,	%o2,	%o6
	fmovsge	%xcc,	%f1,	%f12
	movgu	%xcc,	%o1,	%l0
loop_2435:
	smulcc	%l5,	%l1,	%i2
	membar	0x73
	nop
	setx	loop_2436,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%xcc,	%g6,	%l4
	ble,a,pt	%xcc,	loop_2437
	fmovda	%icc,	%f29,	%f23
loop_2436:
	ldsw	[%l7 + 0x50],	%g7
	fbuge,a	%fcc1,	loop_2438
loop_2437:
	andn	%l3,	%l6,	%o3
	addc	%g2,	0x09D6,	%o0
	tvs	%xcc,	0x4
loop_2438:
	array32	%i3,	%l2,	%o5
	bleu,pn	%icc,	loop_2439
	movrgez	%g4,	0x0B8,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g5,	%o7,	%g1
loop_2439:
	nop
	set	0x58, %o5
	lda	[%l7 + %o5] 0x11,	%f18
	set	0x18, %i5
	stxa	%i0,	[%l7 + %i5] 0x81
	fpsub16	%f24,	%f12,	%f20
	movne	%icc,	%i4,	%i1
	tcs	%xcc,	0x3
	tn	%xcc,	0x1
	ldsh	[%l7 + 0x76],	%i6
	fmovdleu	%icc,	%f18,	%f22
	sllx	%i7,	0x1B,	%g3
	srax	%o4,	%o2,	%o1
	stbar
	fnor	%f6,	%f16,	%f16
	sllx	%l0,	0x1B,	%l5
	edge16l	%o6,	%l1,	%i2
	brgz	%l4,	loop_2440
	fmovsle	%icc,	%f27,	%f5
	flush	%l7 + 0x0C
	tge	%icc,	0x2
loop_2440:
	nop
	set	0x1E, %i0
	stha	%g7,	[%l7 + %i0] 0x22
	membar	#Sync
	taddcctv	%g6,	%l3,	%o3
	bn,a,pn	%icc,	loop_2441
	nop
	setx loop_2442, %l0, %l1
	jmpl %l1, %g2
	brz,a	%o0,	loop_2443
	ble,a,pn	%icc,	loop_2444
loop_2441:
	ldsb	[%l7 + 0x20],	%i3
loop_2442:
	fbn	%fcc0,	loop_2445
loop_2443:
	nop
	setx	loop_2446,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2444:
	movpos	%icc,	%l6,	%o5
	te	%xcc,	0x2
loop_2445:
	edge32l	%l2,	%i5,	%g4
loop_2446:
	movgu	%xcc,	%g5,	%g1
	alignaddr	%o7,	%i4,	%i1
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x88
	bcc,a,pt	%icc,	loop_2447
	andn	%i0,	0x1BA9,	%i7
	fmovrse	%g3,	%f26,	%f1
	subcc	%o4,	0x0EF5,	%i6
loop_2447:
	movrlez	%o1,	0x176,	%l0
	fmovsleu	%xcc,	%f1,	%f9
	fmovrslez	%l5,	%f20,	%f10
	subcc	%o2,	%l1,	%i2
	fbg	%fcc2,	loop_2448
	addc	%o6,	%g7,	%g6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] %asi,	%l3,	%l4
loop_2448:
	tpos	%xcc,	0x3
	membar	0x49
	fpsub32	%f2,	%f14,	%f14
	bgu	loop_2449
	sra	%o3,	0x06,	%g2
	fmovdvc	%icc,	%f16,	%f8
	fnot1	%f14,	%f8
loop_2449:
	edge8	%i3,	%o0,	%o5
	set	0x55, %o3
	lduba	[%l7 + %o3] 0x04,	%l6
	sdivcc	%i5,	0x02F6,	%l2
	membar	0x31
	tle	%icc,	0x5
	fbu	%fcc0,	loop_2450
	edge8l	%g4,	%g1,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o7,	%i1,	%i0
loop_2450:
	udivx	%i7,	0x19E4,	%i4
	fmovd	%f28,	%f0
	sdivcc	%o4,	0x0AC2,	%i6
	stbar
	set	0x40, %l0
	lduha	[%l7 + %l0] 0x19,	%o1
	addc	%g3,	%l0,	%o2
	edge8l	%l1,	%i2,	%o6
	tle	%xcc,	0x7
	edge32l	%l5,	%g7,	%l3
	fsrc1	%f8,	%f2
	bvc,pn	%icc,	loop_2451
	udivx	%g6,	0x1DC0,	%o3
	bneg,pt	%icc,	loop_2452
	movvs	%icc,	%l4,	%g2
loop_2451:
	sll	%i3,	%o0,	%o5
	udivcc	%i5,	0x0ABB,	%l6
loop_2452:
	bpos,a	loop_2453
	fmovrsgz	%g4,	%f3,	%f6
	tn	%xcc,	0x7
	tsubcc	%l2,	0x0472,	%g1
loop_2453:
	tsubcc	%o7,	%i1,	%g5
	sethi	0x1241,	%i7
	movne	%icc,	%i0,	%i4
	edge16ln	%i6,	%o1,	%o4
	addcc	%g3,	%l0,	%l1
	movrgz	%o2,	0x378,	%o6
	xnor	%i2,	%l5,	%l3
	movrlz	%g6,	%g7,	%l4
	and	%o3,	%i3,	%o0
	fmovsn	%icc,	%f27,	%f21
	edge8ln	%g2,	%o5,	%i5
	fmovd	%f10,	%f6
	call	loop_2454
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f28,	%f16,	%f12
	sra	%l6,	%l2,	%g4
loop_2454:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%g1,	%i1
	fsrc1	%f18,	%f22
	umulcc	%g5,	%o7,	%i7
	flush	%l7 + 0x44
	fbne,a	%fcc2,	loop_2455
	array16	%i4,	%i0,	%i6
	ble,a,pt	%xcc,	loop_2456
	mulscc	%o4,	0x199E,	%g3
loop_2455:
	fmovd	%f4,	%f24
	wr	%g0,	0xeb,	%asi
	stba	%l0,	[%l7 + 0x48] %asi
	membar	#Sync
loop_2456:
	brz,a	%o1,	loop_2457
	fmovrde	%l1,	%f20,	%f14
	sub	%o2,	0x0BE8,	%o6
	lduw	[%l7 + 0x44],	%l5
loop_2457:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x65] %asi,	%i2
	subccc	%l3,	0x1BB4,	%g6
	std	%f6,	[%l7 + 0x58]
	popc	%l4,	%g7
	taddcc	%o3,	0x1AFE,	%o0
	or	%g2,	%i3,	%i5
	or	%l6,	0x1CA2,	%l2
	xorcc	%g4,	0x086C,	%g1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x52] %asi,	%i1
	addcc	%g5,	0x1AD4,	%o7
	ta	%icc,	0x5
	fba,a	%fcc2,	loop_2458
	taddcctv	%o5,	0x1C96,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x2E],	%i0
loop_2458:
	array8	%i6,	%o4,	%g3
	fbul,a	%fcc1,	loop_2459
	movcs	%xcc,	%i7,	%o1
	fmovsn	%icc,	%f11,	%f16
	edge16	%l1,	%l0,	%o2
loop_2459:
	srl	%l5,	%i2,	%o6
	nop
	setx loop_2460, %l0, %l1
	jmpl %l1, %g6
	ldub	[%l7 + 0x2B],	%l3
	mulscc	%l4,	%o3,	%o0
	nop
	setx	loop_2461,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2460:
	fbge,a	%fcc1,	loop_2462
	fmovd	%f12,	%f8
	movre	%g2,	0x12E,	%i3
loop_2461:
	fornot2	%f24,	%f28,	%f22
loop_2462:
	fmul8x16	%f2,	%f22,	%f12
	swap	[%l7 + 0x68],	%g7
	stw	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x60],	%f16
	bpos,a	loop_2463
	tvc	%xcc,	0x5
	std	%f28,	[%l7 + 0x10]
	fmovsle	%icc,	%f2,	%f3
loop_2463:
	fpmerge	%f11,	%f10,	%f12
	te	%icc,	0x6
	stx	%l2,	[%l7 + 0x28]
	fmovdge	%xcc,	%f11,	%f26
	bvc,pt	%xcc,	loop_2464
	movle	%xcc,	%i5,	%g1
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2464:
	nop
	wr	%g0,	0x27,	%asi
	stha	%g4,	[%l7 + 0x60] %asi
	membar	#Sync
	sllx	%i1,	0x00,	%g5
	fcmpes	%fcc0,	%f2,	%f5
	set	0x54, %g2
	lduwa	[%l7 + %g2] 0x89,	%o5
	orn	%i4,	%o7,	%i6
	ldd	[%l7 + 0x68],	%f14
	smul	%o4,	0x0F52,	%g3
	edge8	%i0,	%o1,	%l1
	edge8n	%l0,	%o2,	%l5
	tsubcc	%i2,	0x08A9,	%i7
	tvs	%icc,	0x6
	ldd	[%l7 + 0x50],	%o6
	and	%g6,	%l3,	%l4
	udivx	%o3,	0x14C4,	%g2
	movrlz	%i3,	%o0,	%g7
	fmovdvc	%xcc,	%f30,	%f21
	fnot2s	%f7,	%f30
	st	%f8,	[%l7 + 0x24]
	set	0x34, %i6
	swapa	[%l7 + %i6] 0x04,	%l2
	smul	%i5,	0x1005,	%l6
	st	%f19,	[%l7 + 0x4C]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f9,	%f24
	edge8	%g1,	%i1,	%g5
	sllx	%o5,	%g4,	%o7
	nop
	setx	loop_2465,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlez	%i4,	loop_2466
	movn	%icc,	%i6,	%o4
	taddcctv	%i0,	0x00A2,	%g3
loop_2465:
	fmul8x16al	%f29,	%f23,	%f30
loop_2466:
	edge8l	%l1,	%o1,	%l0
	fcmped	%fcc0,	%f4,	%f2
	edge8	%l5,	%o2,	%i2
	move	%icc,	%o6,	%g6
	alignaddr	%l3,	%i7,	%l4
	movge	%xcc,	%o3,	%i3
	set	0x60, %i7
	swapa	[%l7 + %i7] 0x80,	%g2
	fsrc1	%f6,	%f22
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x30] %asi,	%o0
	fmovsleu	%icc,	%f29,	%f1
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
	std	%i4,	[%l7 + 0x10]
	add	%g7,	0x0563,	%l6
	movn	%icc,	%i1,	%g5
	movrlz	%o5,	%g1,	%o7
	sdiv	%i4,	0x0D08,	%g4
	edge16	%o4,	%i0,	%g3
	movrgez	%l1,	0x31A,	%i6
	movcc	%xcc,	%l0,	%l5
	movgu	%xcc,	%o1,	%i2
	fmuld8ulx16	%f25,	%f19,	%f30
	fmul8sux16	%f20,	%f14,	%f14
	ldsw	[%l7 + 0x4C],	%o2
	sdivcc	%g6,	0x070B,	%o6
	fmovrdne	%l3,	%f2,	%f18
	fabsd	%f24,	%f24
	andcc	%l4,	0x1136,	%i7
	fxor	%f30,	%f28,	%f26
	add	%o3,	%g2,	%o0
	fxor	%f8,	%f4,	%f12
	fcmpes	%fcc1,	%f20,	%f31
	edge8n	%i3,	%i5,	%l2
	for	%f4,	%f30,	%f4
	sra	%g7,	%i1,	%g5
	fones	%f14
	edge32n	%l6,	%o5,	%g1
	call	loop_2467
	edge8	%i4,	%o7,	%o4
	ldub	[%l7 + 0x46],	%i0
	movvs	%icc,	%g4,	%g3
loop_2467:
	fmovdvc	%icc,	%f8,	%f31
	movrlz	%l1,	0x29C,	%i6
	udiv	%l0,	0x0BD1,	%l5
	fmovdvs	%icc,	%f22,	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%o1,	loop_2468
	tsubcctv	%o2,	0x14D7,	%g6
	sllx	%o6,	0x15,	%i2
	andcc	%l3,	0x0507,	%l4
loop_2468:
	edge32ln	%o3,	%g2,	%o0
	fmuld8ulx16	%f14,	%f7,	%f0
	sra	%i3,	0x1E,	%i7
	udivx	%l2,	0x078D,	%i5
	tge	%xcc,	0x6
	move	%xcc,	%g7,	%i1
	bne,a,pn	%icc,	loop_2469
	edge16l	%l6,	%o5,	%g1
	popc	0x1762,	%g5
	fpadd16s	%f24,	%f14,	%f30
loop_2469:
	orn	%i4,	%o7,	%i0
	fpsub16	%f28,	%f20,	%f18
	movrlz	%g4,	0x194,	%g3
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
	edge8	%o4,	%l1,	%l0
	movn	%xcc,	%i6,	%o1
	fcmple16	%f20,	%f28,	%l5
	umulcc	%o2,	0x0CD6,	%g6
	mova	%icc,	%i2,	%o6
	edge8l	%l4,	%o3,	%l3
	std	%f12,	[%l7 + 0x18]
	tle	%xcc,	0x4
	edge32	%o0,	%g2,	%i3
	sub	%l2,	0x170C,	%i7
	brnz,a	%i5,	loop_2470
	orncc	%i1,	0x1E27,	%g7
	fandnot2	%f24,	%f20,	%f14
	edge32ln	%l6,	%o5,	%g1
loop_2470:
	movvc	%xcc,	%i4,	%g5
	fmovrse	%i0,	%f25,	%f9
	pdist	%f8,	%f20,	%f18
	fmovrslz	%o7,	%f25,	%f12
	movn	%icc,	%g3,	%g4
	fmovsge	%xcc,	%f31,	%f14
	popc	%o4,	%l1
	ldsw	[%l7 + 0x10],	%i6
	fnot1s	%f1,	%f1
	fmovdge	%icc,	%f4,	%f4
	fbuge	%fcc3,	loop_2471
	pdist	%f6,	%f0,	%f26
	movcc	%icc,	%o1,	%l0
	tneg	%icc,	0x5
loop_2471:
	fba	%fcc2,	loop_2472
	fbo	%fcc1,	loop_2473
	srax	%o2,	%l5,	%i2
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x19
loop_2472:
	bvs,pn	%xcc,	loop_2474
loop_2473:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,pn	%icc,	loop_2475
	movcc	%icc,	%g6,	%o6
loop_2474:
	edge16l	%l4,	%l3,	%o0
	movcc	%icc,	%o3,	%i3
loop_2475:
	nop
	set	0x78, %g5
	prefetcha	[%l7 + %g5] 0x14,	 0x1
	tn	%xcc,	0x5
	xorcc	%g2,	0x0611,	%i5
	call	loop_2476
	nop
	setx	loop_2477,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16ln	%i7,	%i1,	%g7
	addccc	%l6,	0x0A2C,	%g1
loop_2476:
	xnorcc	%i4,	0x106B,	%o5
loop_2477:
	tn	%icc,	0x0
	te	%icc,	0x5
	sra	%g5,	0x00,	%o7
	srl	%i0,	0x00,	%g4
	movleu	%icc,	%g3,	%o4
	fones	%f13
	fpadd16s	%f17,	%f20,	%f19
	andncc	%l1,	%o1,	%l0
	srl	%i6,	%o2,	%l5
	fmovrsgez	%i2,	%f16,	%f25
	nop
	setx	loop_2478,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	be,pt	%icc,	loop_2479
	xnorcc	%o6,	%g6,	%l3
	fand	%f14,	%f10,	%f12
loop_2478:
	orncc	%l4,	%o0,	%o3
loop_2479:
	fornot1s	%f9,	%f20,	%f25
	udivx	%l2,	0x1FAA,	%i3
	sll	%i5,	%i7,	%g2
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x40] %asi,	%i1
	sub	%l6,	0x14AB,	%g1
	xnorcc	%g7,	%o5,	%i4
	array32	%o7,	%i0,	%g5
	edge16l	%g4,	%o4,	%g3
	nop
	setx	loop_2480,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvc	%xcc,	%l1,	%o1
	srax	%l0,	0x05,	%o2
	movl	%icc,	%l5,	%i6
loop_2480:
	edge32ln	%i2,	%g6,	%l3
	brz	%o6,	loop_2481
	fmovrslez	%o0,	%f7,	%f27
	edge32ln	%l4,	%l2,	%o3
	fmovdvs	%xcc,	%f12,	%f19
loop_2481:
	move	%xcc,	%i5,	%i7
	ldub	[%l7 + 0x23],	%g2
	srax	%i1,	0x11,	%i3
	ldd	[%l7 + 0x70],	%f8
	fmovsl	%icc,	%f29,	%f9
	sethi	0x1D1C,	%g1
	smul	%g7,	0x188E,	%l6
	movgu	%xcc,	%o5,	%i4
	edge32l	%i0,	%g5,	%g4
	fcmpeq32	%f26,	%f28,	%o7
	fpmerge	%f21,	%f15,	%f0
	tsubcctv	%o4,	0x1433,	%l1
	set	0x4A, %l4
	ldsba	[%l7 + %l4] 0x89,	%o1
	fzeros	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc1,	loop_2482
	srl	%g3,	%o2,	%l5
	movrlz	%i6,	%l0,	%i2
	array32	%g6,	%o6,	%o0
loop_2482:
	xnorcc	%l4,	%l3,	%o3
	movge	%xcc,	%l2,	%i7
	srl	%i5,	%i1,	%i3
	xnor	%g1,	%g2,	%l6
	addcc	%g7,	0x1509,	%o5
	mulx	%i4,	0x1BF1,	%i0
	fmovrsgz	%g5,	%f7,	%f28
	mova	%xcc,	%g4,	%o7
	fmovdleu	%icc,	%f25,	%f5
	brnz	%l1,	loop_2483
	alignaddr	%o4,	%o1,	%o2
	fbug	%fcc1,	loop_2484
	lduw	[%l7 + 0x3C],	%l5
loop_2483:
	fzero	%f10
	tge	%xcc,	0x7
loop_2484:
	taddcctv	%i6,	%l0,	%g3
	fnot1	%f10,	%f28
	wr	%g0,	0x11,	%asi
	stda	%i2,	[%l7 + 0x28] %asi
	edge32l	%g6,	%o0,	%o6
	ba,a	%xcc,	loop_2485
	fbe,a	%fcc2,	loop_2486
	sdivcc	%l3,	0x14BE,	%l4
	movleu	%icc,	%l2,	%o3
loop_2485:
	movrgz	%i7,	%i5,	%i1
loop_2486:
	tne	%xcc,	0x0
	fbe,a	%fcc0,	loop_2487
	edge16ln	%g1,	%g2,	%i3
	movre	%g7,	%l6,	%i4
	sir	0x1406
loop_2487:
	lduh	[%l7 + 0x2C],	%i0
	sllx	%o5,	%g4,	%g5
	udivx	%o7,	0x169A,	%l1
	ta	%icc,	0x2
	brlz,a	%o4,	loop_2488
	edge8l	%o2,	%o1,	%i6
	taddcc	%l0,	%l5,	%g3
	brlez	%g6,	loop_2489
loop_2488:
	tleu	%icc,	0x5
	edge32	%o0,	%i2,	%l3
	tge	%icc,	0x3
loop_2489:
	fmovrslz	%o6,	%f12,	%f12
	set	0x30, %l3
	lduwa	[%l7 + %l3] 0x0c,	%l2
	te	%xcc,	0x0
	fmovsgu	%icc,	%f18,	%f16
	alignaddr	%o3,	%i7,	%i5
	fbu,a	%fcc0,	loop_2490
	fbue	%fcc3,	loop_2491
	subcc	%i1,	%g1,	%g2
	fmovsvc	%icc,	%f9,	%f18
loop_2490:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2491:
	movl	%icc,	%i3,	%g7
	movpos	%icc,	%l4,	%i4
	brgez,a	%i0,	loop_2492
	sra	%l6,	%g4,	%o5
	fmovsne	%xcc,	%f4,	%f0
	bvs,a	loop_2493
loop_2492:
	sdivx	%o7,	0x1420,	%g5
	edge32	%o4,	%l1,	%o2
	sllx	%i6,	%l0,	%l5
loop_2493:
	umul	%o1,	%g3,	%o0
	swap	[%l7 + 0x14],	%g6
	popc	0x1C80,	%l3
	movrlz	%o6,	0x14D,	%i2
	nop
	setx	loop_2494,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	membar	0x5F
	ta	%icc,	0x5
	fpsub16s	%f0,	%f6,	%f20
loop_2494:
	st	%f1,	[%l7 + 0x78]
	lduh	[%l7 + 0x0A],	%l2
	addccc	%i7,	0x0904,	%i5
	tleu	%icc,	0x6
	movg	%icc,	%o3,	%g1
	udivcc	%i1,	0x0ADC,	%g2
	subccc	%i3,	%l4,	%i4
	addcc	%g7,	0x004C,	%l6
	movrlez	%i0,	%o5,	%g4
	fxnor	%f10,	%f18,	%f12
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x20] %asi,	%o6
	movgu	%xcc,	%o4,	%g5
	smul	%l1,	0x132B,	%o2
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	ldd	[%l7 + 0x28],	%l4
	bpos,a	loop_2495
	nop
	set	0x74, %l6
	ldsw	[%l7 + %l6],	%l0
	bcc	loop_2496
	te	%xcc,	0x0
loop_2495:
	bcc,pt	%xcc,	loop_2497
	xor	%o1,	%g3,	%g6
loop_2496:
	tneg	%icc,	0x2
	flush	%l7 + 0x28
loop_2497:
	tsubcctv	%l3,	%o0,	%i2
	tge	%icc,	0x2
	sdivx	%o6,	0x15FD,	%i7
	smul	%l2,	%i5,	%g1
	edge16l	%i1,	%o3,	%i3
	be	%icc,	loop_2498
	tg	%xcc,	0x1
	movcs	%xcc,	%l4,	%g2
	fpadd32	%f12,	%f28,	%f22
loop_2498:
	tl	%icc,	0x7
	fmovdgu	%icc,	%f16,	%f10
	sllx	%g7,	%l6,	%i4
	movl	%icc,	%o5,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o7,	%g4,	%g5
	addc	%o4,	%l1,	%o2
	fble	%fcc0,	loop_2499
	sdiv	%l5,	0x0C6E,	%i6
	xor	%o1,	0x11FE,	%g3
	movl	%xcc,	%l0,	%l3
loop_2499:
	mulx	%o0,	0x04AD,	%i2
	stb	%o6,	[%l7 + 0x11]
	fmovrdlez	%g6,	%f4,	%f16
	tvc	%xcc,	0x7
	fmovdvs	%icc,	%f1,	%f6
	std	%l2,	[%l7 + 0x10]
	fpadd16	%f6,	%f6,	%f16
	taddcc	%i7,	0x1E63,	%i5
	tl	%icc,	0x4
	taddcctv	%i1,	%g1,	%i3
	fzeros	%f11
	ldub	[%l7 + 0x4E],	%o3
	udivx	%l4,	0x079E,	%g2
	edge32l	%g7,	%l6,	%o5
	membar	0x09
	array8	%i0,	%i4,	%o7
	fxors	%f14,	%f24,	%f6
	tgu	%xcc,	0x6
	fpackfix	%f6,	%f31
	edge8ln	%g4,	%o4,	%l1
	tcc	%xcc,	0x3
	xnor	%g5,	0x07C8,	%o2
	movpos	%icc,	%i6,	%o1
	addcc	%l5,	0x0BA7,	%l0
	lduw	[%l7 + 0x28],	%g3
	move	%xcc,	%l3,	%o0
	movrgez	%o6,	0x2E9,	%g6
	fmovde	%xcc,	%f3,	%f25
	edge8n	%i2,	%l2,	%i7
	addc	%i5,	0x05F3,	%g1
	addccc	%i3,	%o3,	%l4
	bcs,a	loop_2500
	edge8ln	%g2,	%g7,	%l6
	brgz,a	%i1,	loop_2501
	srlx	%i0,	0x03,	%o5
loop_2500:
	stbar
	tgu	%icc,	0x2
loop_2501:
	fands	%f7,	%f15,	%f17
	fmovdpos	%icc,	%f28,	%f23
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x35] %asi,	%i4
	taddcc	%o7,	%o4,	%g4
	alignaddrl	%g5,	%o2,	%l1
	fxnors	%f22,	%f6,	%f8
	fcmpeq32	%f6,	%f14,	%i6
	membar	0x1C
	bne,pt	%xcc,	loop_2502
	sdiv	%l5,	0x09CE,	%o1
	tcs	%xcc,	0x7
	tsubcc	%l0,	0x1EE2,	%g3
loop_2502:
	edge16l	%l3,	%o0,	%g6
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	fxors	%f26,	%f19,	%f7
	array32	%i2,	%i7,	%i5
	ta	%icc,	0x3
	edge16n	%l2,	%i3,	%o3
	udiv	%g1,	0x18AE,	%l4
	bge	%xcc,	loop_2503
	tvc	%xcc,	0x7
	alignaddrl	%g7,	%g2,	%i1
	orcc	%i0,	0x11A0,	%l6
loop_2503:
	movvs	%icc,	%o5,	%o7
	brlez,a	%o4,	loop_2504
	srl	%i4,	%g5,	%g4
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
loop_2504:
	nop
	setx loop_2505, %l0, %l1
	jmpl %l1, %o2
	xorcc	%i6,	%o1,	%l5
	fblg	%fcc1,	loop_2506
	orcc	%l0,	0x0827,	%l3
loop_2505:
	srax	%o0,	0x14,	%g3
	fsrc2	%f0,	%f24
loop_2506:
	edge16ln	%g6,	%o6,	%i2
	fxor	%f12,	%f10,	%f2
	set	0x1D, %i3
	ldsba	[%l7 + %i3] 0x15,	%i5
	movvs	%icc,	%i7,	%l2
	taddcc	%o3,	%g1,	%l4
	addcc	%i3,	0x1A17,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g7,	0x09FE,	%i0
	tg	%xcc,	0x3
	ldd	[%l7 + 0x50],	%f24
	ldd	[%l7 + 0x10],	%f6
	movrne	%i1,	0x30D,	%l6
	fxnors	%f18,	%f12,	%f13
	addcc	%o7,	0x1CFE,	%o5
	sdivx	%i4,	0x1C24,	%g5
	movn	%icc,	%o4,	%g4
	sllx	%o2,	%l1,	%i6
	tleu	%xcc,	0x6
	smulcc	%o1,	0x1871,	%l0
	ba,a,pn	%icc,	loop_2507
	xnor	%l3,	%l5,	%o0
	umulcc	%g6,	0x17CC,	%g3
	bcs,pn	%xcc,	loop_2508
loop_2507:
	umulcc	%o6,	0x0AAF,	%i2
	stw	%i5,	[%l7 + 0x70]
	addc	%i7,	0x092E,	%o3
loop_2508:
	bshuffle	%f6,	%f2,	%f28
	set	0x1C, %o2
	lda	[%l7 + %o2] 0x10,	%f7
	udivx	%g1,	0x0876,	%l2
	array32	%l4,	%i3,	%g7
	fmovrdgz	%i0,	%f10,	%f10
	fsrc2s	%f21,	%f11
	mova	%xcc,	%g2,	%l6
	edge8	%o7,	%i1,	%o5
	fmovsl	%icc,	%f0,	%f23
	fmul8x16au	%f25,	%f23,	%f0
	udivcc	%i4,	0x1813,	%g5
	movrne	%o4,	0x127,	%g4
	lduh	[%l7 + 0x36],	%l1
	movrlez	%i6,	0x15B,	%o1
	edge16	%o2,	%l3,	%l5
	orn	%l0,	%o0,	%g6
	fpadd16	%f22,	%f6,	%f2
	tne	%xcc,	0x4
	fnegd	%f16,	%f2
	bcs,pn	%icc,	loop_2509
	prefetch	[%l7 + 0x40],	 0x3
	taddcctv	%o6,	%g3,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2509:
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%i4
	orcc	%o3,	0x02C7,	%i7
	fcmpes	%fcc1,	%f18,	%f14
	fmovdl	%xcc,	%f30,	%f20
	brnz,a	%g1,	loop_2510
	edge16ln	%l2,	%i3,	%l4
	xor	%i0,	%g7,	%g2
	ble,pn	%icc,	loop_2511
loop_2510:
	pdist	%f22,	%f2,	%f6
	movvc	%icc,	%o7,	%l6
	srlx	%o5,	%i1,	%i4
loop_2511:
	fmovdge	%xcc,	%f28,	%f25
	sth	%g5,	[%l7 + 0x26]
	fbe,a	%fcc1,	loop_2512
	sllx	%g4,	0x1E,	%o4
	ldstub	[%l7 + 0x3A],	%i6
	fexpand	%f16,	%f6
loop_2512:
	movcs	%xcc,	%l1,	%o1
	taddcc	%l3,	0x0193,	%o2
	sdiv	%l5,	0x1339,	%l0
	movne	%icc,	%o0,	%o6
	bge,a	loop_2513
	tsubcc	%g6,	0x0753,	%g3
	fbo,a	%fcc0,	loop_2514
	tpos	%xcc,	0x4
loop_2513:
	bneg,pn	%icc,	loop_2515
	call	loop_2516
loop_2514:
	std	%i2,	[%l7 + 0x08]
	lduw	[%l7 + 0x60],	%o3
loop_2515:
	edge8	%i7,	%g1,	%i5
loop_2516:
	movrlez	%l2,	0x008,	%l4
	fnands	%f4,	%f29,	%f12
	tsubcc	%i0,	%g7,	%i3
	bvc,a,pt	%xcc,	loop_2517
	fmovsg	%xcc,	%f9,	%f1
	fcmpne16	%f14,	%f0,	%o7
	edge32ln	%l6,	%o5,	%i1
loop_2517:
	movleu	%icc,	%i4,	%g5
	fmovsle	%icc,	%f1,	%f30
	brnz,a	%g2,	loop_2518
	ldsh	[%l7 + 0x58],	%o4
	edge8ln	%i6,	%g4,	%o1
	tneg	%xcc,	0x7
loop_2518:
	fmovse	%icc,	%f23,	%f6
	fba	%fcc1,	loop_2519
	mulx	%l3,	0x0A69,	%o2
	orn	%l5,	%l0,	%l1
	array16	%o0,	%o6,	%g3
loop_2519:
	ta	%xcc,	0x4
	fmovrse	%i2,	%f10,	%f14
	or	%o3,	%i7,	%g1
	addccc	%i5,	%l2,	%g6
	fpsub32s	%f21,	%f14,	%f9
	subc	%l4,	0x1B2D,	%i0
	movcs	%icc,	%i3,	%g7
	fmovdge	%xcc,	%f0,	%f1
	bn,pn	%xcc,	loop_2520
	fmovsvc	%icc,	%f2,	%f3
	andn	%o7,	%l6,	%o5
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x1A] %asi,	%i1
loop_2520:
	sll	%g5,	%g2,	%o4
	fbl,a	%fcc0,	loop_2521
	edge16l	%i6,	%i4,	%o1
	movne	%xcc,	%l3,	%o2
	brz	%l5,	loop_2522
loop_2521:
	fcmpeq32	%f14,	%f26,	%l0
	and	%g4,	0x0DB9,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2522:
	smulcc	%o0,	%g3,	%o6
	movrlz	%o3,	%i7,	%i2
	fnot2s	%f23,	%f30
	edge16n	%g1,	%i5,	%l2
	membar	0x19
	ldub	[%l7 + 0x26],	%l4
	fmovdpos	%xcc,	%f31,	%f4
	tsubcc	%g6,	0x06DB,	%i0
	sdivx	%g7,	0x1E4F,	%i3
	fmovd	%f22,	%f14
	umulcc	%l6,	%o5,	%i1
	fcmpeq32	%f14,	%f26,	%o7
	fmul8ulx16	%f24,	%f10,	%f0
	sll	%g2,	0x13,	%o4
	pdist	%f30,	%f2,	%f6
	fmovdpos	%xcc,	%f6,	%f23
	edge32	%g5,	%i4,	%i6
	fmovsvs	%xcc,	%f15,	%f20
	fpack32	%f18,	%f12,	%f30
	fpsub16	%f16,	%f0,	%f8
	bvc,a	loop_2523
	edge8	%o1,	%o2,	%l3
	srax	%l5,	0x17,	%l0
	array16	%g4,	%o0,	%l1
loop_2523:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g3,	%o6,	%o3
	sir	0x1EB6
	addc	%i7,	0x012D,	%g1
	fandnot1	%f22,	%f18,	%f18
	fnegd	%f26,	%f30
	fmovrde	%i5,	%f24,	%f6
	fmovsn	%icc,	%f7,	%f31
	sub	%i2,	0x0499,	%l4
	fmuld8sux16	%f5,	%f20,	%f6
	movrgz	%g6,	%i0,	%l2
	array8	%g7,	%l6,	%i3
	edge16l	%o5,	%i1,	%g2
	faligndata	%f30,	%f28,	%f4
	te	%icc,	0x5
	fbu	%fcc2,	loop_2524
	bl,a	loop_2525
	edge16l	%o4,	%g5,	%i4
	srl	%o7,	0x1F,	%o1
loop_2524:
	nop
	set	0x78, %o6
	stwa	%i6,	[%l7 + %o6] 0x14
loop_2525:
	fcmpeq32	%f20,	%f20,	%o2
	fmovrslz	%l5,	%f12,	%f29
	edge8ln	%l0,	%l3,	%g4
	ta	%icc,	0x7
	fornot2	%f8,	%f4,	%f4
	be	%icc,	loop_2526
	edge16n	%o0,	%l1,	%g3
	addc	%o3,	0x07F7,	%o6
	fmovdn	%icc,	%f10,	%f11
loop_2526:
	te	%icc,	0x4
	movre	%g1,	0x1E3,	%i5
	movg	%xcc,	%i7,	%l4
	subc	%i2,	%g6,	%i0
	set	0x7C, %o4
	ldsha	[%l7 + %o4] 0x88,	%g7
	fcmps	%fcc2,	%f22,	%f11
	sdiv	%l2,	0x029B,	%i3
	add	%l6,	0x1C67,	%o5
	fmovscc	%icc,	%f16,	%f23
	membar	0x7C
	fmovdgu	%xcc,	%f14,	%f26
	tl	%xcc,	0x2
	taddcctv	%i1,	%o4,	%g5
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x4C] %asi,	%f16
	te	%icc,	0x4
	move	%icc,	%o7,	%i4
	fbl	%fcc2,	loop_2527
	nop
	setx	loop_2528,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%xcc,	%o1,	%i6
	fmovrdgz	%o2,	%f22,	%f2
loop_2527:
	fmovsne	%icc,	%f20,	%f11
loop_2528:
	and	%l5,	%l3,	%g4
	te	%icc,	0x3
	set	0x6C, %i2
	ldsha	[%l7 + %i2] 0x04,	%l0
	set	0x69, %l1
	stba	%o0,	[%l7 + %l1] 0x18
	mulscc	%l1,	%o3,	%g3
	fmul8x16al	%f28,	%f26,	%f22
	umul	%o6,	%g1,	%i7
	fmuld8ulx16	%f9,	%f20,	%f6
	tn	%icc,	0x5
	stb	%l4,	[%l7 + 0x3E]
	movg	%xcc,	%i5,	%g6
	orn	%i2,	%g7,	%l2
	membar	0x56
	movl	%xcc,	%i3,	%l6
	std	%o4,	[%l7 + 0x30]
	fcmped	%fcc1,	%f30,	%f30
	fmul8ulx16	%f26,	%f20,	%f24
	set	0x28, %i1
	stxa	%i1,	[%l7 + %i1] 0xea
	membar	#Sync
	tle	%xcc,	0x7
	flush	%l7 + 0x68
	fpack16	%f26,	%f21
	fpadd32	%f14,	%f26,	%f4
	fcmpeq32	%f16,	%f26,	%i0
	fornot2s	%f4,	%f16,	%f1
	xor	%o4,	0x04A0,	%g2
	set	0x34, %g1
	stba	%g5,	[%l7 + %g1] 0x27
	membar	#Sync
	fnand	%f18,	%f10,	%f16
	andn	%o7,	0x17EF,	%i4
	fbue	%fcc0,	loop_2529
	fnor	%f16,	%f6,	%f16
	set	0x26, %g3
	stha	%i6,	[%l7 + %g3] 0x88
loop_2529:
	fandnot2s	%f2,	%f18,	%f13
	edge16l	%o1,	%o2,	%l5
	movcc	%xcc,	%l3,	%l0
	array16	%g4,	%o0,	%o3
	udivcc	%g3,	0x160C,	%o6
	stw	%g1,	[%l7 + 0x24]
	fpsub32s	%f26,	%f14,	%f4
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x30] %asi,	%l0
	andn	%i7,	%l4,	%g6
	tg	%icc,	0x5
	movrgz	%i5,	%i2,	%g7
	udivcc	%l2,	0x0976,	%l6
	array32	%i3,	%i1,	%o5
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x44] %asi,	%i0
	bne,pt	%xcc,	loop_2530
	movn	%xcc,	%g2,	%g5
	udiv	%o4,	0x0CC7,	%i4
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x50] %asi,	%o6
loop_2530:
	tsubcc	%i6,	0x0AF8,	%o2
	fbule	%fcc2,	loop_2531
	ldsw	[%l7 + 0x20],	%l5
	fblg,a	%fcc0,	loop_2532
	andn	%o1,	%l0,	%l3
loop_2531:
	fcmped	%fcc3,	%f16,	%f30
	movl	%xcc,	%o0,	%o3
loop_2532:
	array32	%g4,	%o6,	%g1
	fmovscs	%xcc,	%f14,	%f19
	bcc	loop_2533
	xor	%l1,	0x1894,	%g3
	movrgz	%i7,	%g6,	%i5
	bl	loop_2534
loop_2533:
	fone	%f6
	membar	0x6C
	st	%f14,	[%l7 + 0x50]
loop_2534:
	umul	%l4,	%i2,	%g7
	xorcc	%l6,	0x0318,	%l2
	fba	%fcc1,	loop_2535
	bcs,pt	%xcc,	loop_2536
	smul	%i1,	%i3,	%i0
	bvs,a	%xcc,	loop_2537
loop_2535:
	srl	%o5,	0x1C,	%g2
loop_2536:
	st	%f19,	[%l7 + 0x3C]
	fbue	%fcc3,	loop_2538
loop_2537:
	orncc	%g5,	%o4,	%o7
	fpsub16	%f30,	%f2,	%f12
	call	loop_2539
loop_2538:
	fbn,a	%fcc2,	loop_2540
	tvs	%icc,	0x4
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
loop_2539:
	fmul8x16au	%f5,	%f8,	%f24
loop_2540:
	nop
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x18] %asi,	%f27
	bcs,pn	%icc,	loop_2541
	membar	0x07
	movn	%xcc,	%i6,	%l5
	fmovdvs	%xcc,	%f29,	%f19
loop_2541:
	umul	%o1,	0x0081,	%l0
	udivx	%l3,	0x0321,	%o2
	sra	%o3,	0x19,	%g4
	ta	%xcc,	0x2
	andcc	%o0,	0x153A,	%o6
	movcc	%xcc,	%g1,	%g3
	bne,a	%xcc,	loop_2542
	orn	%l1,	%g6,	%i7
	subcc	%i5,	0x01E6,	%l4
	array16	%g7,	%l6,	%l2
loop_2542:
	fnegs	%f20,	%f6
	sra	%i2,	0x12,	%i3
	move	%icc,	%i0,	%o5
	array16	%i1,	%g5,	%g2
	fcmps	%fcc1,	%f17,	%f7
	addc	%o7,	%i4,	%i6
	udivcc	%l5,	0x1677,	%o4
	tl	%icc,	0x3
	for	%f4,	%f4,	%f6
	movrne	%o1,	%l3,	%l0
	mova	%icc,	%o2,	%o3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x0E] %asi,	%g4
	fornot1s	%f22,	%f5,	%f10
	fnot2	%f20,	%f28
	edge8l	%o6,	%g1,	%o0
	sra	%g3,	%g6,	%l1
	movg	%xcc,	%i7,	%l4
	mova	%icc,	%g7,	%l6
	movge	%icc,	%i5,	%l2
	fcmps	%fcc1,	%f14,	%f11
	fmovrsne	%i3,	%f26,	%f17
	andncc	%i2,	%o5,	%i0
	ldsb	[%l7 + 0x57],	%g5
	brgz,a	%i1,	loop_2543
	movgu	%icc,	%o7,	%i4
	edge32n	%g2,	%i6,	%o4
	andcc	%l5,	0x107B,	%l3
loop_2543:
	srlx	%o1,	0x04,	%l0
	smul	%o2,	0x17F9,	%o3
	set	0x60, %g7
	lduha	[%l7 + %g7] 0x89,	%g4
	brz,a	%g1,	loop_2544
	fmovrsne	%o0,	%f29,	%f31
	fcmple32	%f28,	%f24,	%g3
	movcc	%xcc,	%g6,	%o6
loop_2544:
	fbo,a	%fcc0,	loop_2545
	flush	%l7 + 0x28
	orcc	%i7,	0x1015,	%l4
	sra	%g7,	0x15,	%l6
loop_2545:
	orcc	%i5,	0x00C0,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%l1,	%i2
	sub	%o5,	%i3,	%g5
	array16	%i1,	%i0,	%i4
	fcmpeq16	%f2,	%f30,	%o7
	taddcctv	%g2,	0x0324,	%i6
	tneg	%xcc,	0x1
	bcs,a	%xcc,	loop_2546
	smul	%l5,	0x04AD,	%o4
	tpos	%icc,	0x3
	fbule,a	%fcc1,	loop_2547
loop_2546:
	fmovsvc	%xcc,	%f27,	%f19
	movrlz	%o1,	%l3,	%l0
	sdivx	%o3,	0x0C16,	%g4
loop_2547:
	tge	%xcc,	0x6
	movcs	%xcc,	%o2,	%g1
	set	0x71, %o1
	ldstuba	[%l7 + %o1] 0x04,	%g3
	srax	%o0,	0x0A,	%o6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x68] %asi,	%i7
	movg	%xcc,	%l4,	%g7
	bn,pn	%icc,	loop_2548
	array32	%l6,	%i5,	%l2
	movn	%xcc,	%g6,	%i2
	fpadd16	%f18,	%f12,	%f8
loop_2548:
	nop
	wr	%g0,	0x22,	%asi
	stwa	%o5,	[%l7 + 0x68] %asi
	membar	#Sync
	set	0x30, %o0
	swapa	[%l7 + %o0] 0x81,	%i3
	taddcc	%l1,	%g5,	%i1
	movg	%xcc,	%i0,	%i4
	membar	0x04
	brz,a	%o7,	loop_2549
	fmovdvc	%xcc,	%f20,	%f6
	brgez,a	%i6,	loop_2550
	fbu,a	%fcc2,	loop_2551
loop_2549:
	srax	%g2,	%l5,	%o1
	xnor	%l3,	%o4,	%l0
loop_2550:
	swap	[%l7 + 0x48],	%o3
loop_2551:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o2
	orn	%g1,	%g4,	%o0
	movle	%xcc,	%o6,	%g3
	fbo	%fcc3,	loop_2552
	faligndata	%f18,	%f28,	%f8
	fmovsge	%icc,	%f13,	%f18
	stw	%i7,	[%l7 + 0x20]
loop_2552:
	bl,a	loop_2553
	fbge,a	%fcc2,	loop_2554
	movpos	%xcc,	%g7,	%l4
	ldub	[%l7 + 0x70],	%i5
loop_2553:
	bcc,pt	%xcc,	loop_2555
loop_2554:
	sth	%l2,	[%l7 + 0x72]
	fmovsvc	%xcc,	%f7,	%f9
	brgez	%g6,	loop_2556
loop_2555:
	tn	%xcc,	0x2
	movg	%xcc,	%i2,	%l6
	movpos	%xcc,	%o5,	%l1
loop_2556:
	bcs,pt	%icc,	loop_2557
	tvs	%xcc,	0x7
	wr	%g0,	0x0c,	%asi
	stha	%g5,	[%l7 + 0x66] %asi
loop_2557:
	ldd	[%l7 + 0x30],	%i0
	edge8n	%i3,	%i4,	%i0
	bleu,a,pn	%icc,	loop_2558
	tneg	%xcc,	0x7
	sll	%o7,	%g2,	%l5
	fandnot1	%f20,	%f20,	%f16
loop_2558:
	fcmps	%fcc3,	%f7,	%f29
	movrlez	%i6,	0x033,	%o1
	fmovrde	%o4,	%f8,	%f20
	fmovrde	%l3,	%f22,	%f2
	set	0x3C, %g6
	lda	[%l7 + %g6] 0x14,	%f4
	array32	%l0,	%o2,	%g1
	bshuffle	%f8,	%f12,	%f16
	fbu,a	%fcc3,	loop_2559
	fbul	%fcc2,	loop_2560
	fbge	%fcc1,	loop_2561
	fornot2	%f14,	%f28,	%f12
loop_2559:
	sdiv	%g4,	0x134E,	%o0
loop_2560:
	fbne,a	%fcc0,	loop_2562
loop_2561:
	xnor	%o3,	%g3,	%i7
	std	%f14,	[%l7 + 0x70]
	edge8n	%o6,	%l4,	%i5
loop_2562:
	fcmpd	%fcc1,	%f2,	%f10
	sdivcc	%g7,	0x1864,	%g6
	alignaddr	%l2,	%l6,	%i2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%g5
	tcc	%xcc,	0x2
	udiv	%o5,	0x1B7A,	%i1
	fbge,a	%fcc0,	loop_2563
	sdivcc	%i4,	0x1987,	%i3
	bcs,a,pt	%icc,	loop_2564
	nop
	setx loop_2565, %l0, %l1
	jmpl %l1, %o7
loop_2563:
	movle	%icc,	%i0,	%g2
	fmovrse	%i6,	%f29,	%f30
loop_2564:
	movne	%xcc,	%o1,	%l5
loop_2565:
	fpsub32	%f0,	%f10,	%f24
	taddcc	%o4,	0x07F5,	%l3
	edge8l	%l0,	%o2,	%g1
	movle	%xcc,	%o0,	%o3
	tleu	%icc,	0x5
	tvc	%xcc,	0x7
	fmovrse	%g3,	%f18,	%f23
	sll	%g4,	0x07,	%i7
	udivx	%o6,	0x10B2,	%l4
	fandnot2s	%f25,	%f5,	%f10
	mulx	%i5,	%g6,	%l2
	fmul8x16	%f17,	%f10,	%f22
	movrgz	%g7,	0x32B,	%i2
	movrne	%l1,	%g5,	%o5
	sub	%i1,	0x0C38,	%i4
	movne	%icc,	%l6,	%o7
	sdiv	%i3,	0x1C10,	%i0
	sdiv	%i6,	0x1064,	%o1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%l4
	stbar
	taddcc	%o4,	0x1362,	%l3
	edge16n	%l0,	%g2,	%o2
	fmul8x16au	%f7,	%f2,	%f16
	tneg	%icc,	0x4
	fcmpgt16	%f24,	%f28,	%g1
	ldd	[%l7 + 0x20],	%o0
	nop
	set	0x38, %o7
	stx	%o3,	[%l7 + %o7]
	fmovsn	%icc,	%f10,	%f2
	tn	%icc,	0x0
	array8	%g3,	%i7,	%o6
	fbg,a	%fcc2,	loop_2566
	alignaddr	%g4,	%i5,	%l4
	edge8l	%l2,	%g7,	%i2
	tsubcc	%l1,	%g5,	%o5
loop_2566:
	fmovdle	%icc,	%f0,	%f20
	movn	%icc,	%g6,	%i1
	addcc	%l6,	0x0C3A,	%o7
	tle	%icc,	0x1
	tcs	%xcc,	0x5
	move	%icc,	%i4,	%i3
	movl	%xcc,	%i6,	%o1
	subcc	%i0,	%l5,	%o4
	xor	%l0,	%l3,	%o2
	fmul8x16al	%f2,	%f26,	%f14
	edge32n	%g2,	%o0,	%o3
	edge32ln	%g1,	%g3,	%i7
	movrne	%o6,	%i5,	%g4
	orcc	%l2,	0x175C,	%g7
	popc	%l4,	%l1
	fmul8x16al	%f1,	%f30,	%f20
	edge16ln	%g5,	%o5,	%g6
	set	0x60, %o5
	ldda	[%l7 + %o5] 0x89,	%i0
	sethi	0x110E,	%i2
	sll	%o7,	%i4,	%l6
	fmovdneg	%xcc,	%f27,	%f28
	flush	%l7 + 0x24
	subccc	%i3,	%i6,	%o1
	sir	0x00B6
	subc	%l5,	%o4,	%i0
	fornot1	%f12,	%f10,	%f8
	mulscc	%l0,	%l3,	%g2
	fpackfix	%f14,	%f11
	xnorcc	%o2,	%o0,	%g1
	tg	%xcc,	0x7
	movl	%icc,	%o3,	%i7
	movl	%xcc,	%o6,	%i5
	fmovsne	%xcc,	%f19,	%f9
	tl	%icc,	0x0
	udiv	%g3,	0x1023,	%l2
	membar	0x4C
	fmovrdlez	%g7,	%f2,	%f6
	edge8n	%g4,	%l4,	%l1
	sdiv	%o5,	0x1402,	%g6
	edge8l	%i1,	%i2,	%g5
	tcc	%xcc,	0x6
	te	%xcc,	0x2
	fmovdcs	%icc,	%f22,	%f28
	udivcc	%i4,	0x0797,	%o7
	movcc	%icc,	%l6,	%i3
	sll	%i6,	0x16,	%o1
	addccc	%l5,	0x0DA8,	%i0
	add	%o4,	0x0DB8,	%l3
	wr	%g0,	0x10,	%asi
	stwa	%g2,	[%l7 + 0x54] %asi
	udivcc	%o2,	0x056E,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x24],	%g1
	tcc	%icc,	0x3
	fmovscc	%icc,	%f19,	%f30
	movg	%xcc,	%o3,	%i7
	sub	%o0,	%i5,	%o6
	bgu,a	loop_2567
	ldsw	[%l7 + 0x08],	%g3
	fcmpgt32	%f16,	%f0,	%g7
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
loop_2567:
	fmovsl	%xcc,	%f30,	%f21
	tg	%icc,	0x6
	andn	%l4,	%g4,	%o5
	movleu	%icc,	%g6,	%l1
	edge8l	%i1,	%g5,	%i2
	std	%o6,	[%l7 + 0x40]
	fnot2s	%f20,	%f2
	subccc	%i4,	0x0D0E,	%i3
	fmovdg	%xcc,	%f26,	%f9
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
	fmovsvs	%xcc,	%f27,	%f6
	fands	%f30,	%f29,	%f19
	brgez	%i6,	loop_2568
	subc	%l5,	0x02E0,	%o1
	fpadd32s	%f28,	%f30,	%f27
	edge8l	%i0,	%l3,	%g2
loop_2568:
	fmovrde	%o4,	%f12,	%f28
	brgz,a	%o2,	loop_2569
	sth	%l0,	[%l7 + 0x48]
	bge,a	%icc,	loop_2570
	movne	%xcc,	%g1,	%o3
loop_2569:
	fble,a	%fcc0,	loop_2571
	taddcctv	%o0,	0x10CD,	%i5
loop_2570:
	udivcc	%o6,	0x12D3,	%g3
	edge16ln	%g7,	%l2,	%l4
loop_2571:
	movne	%icc,	%i7,	%g4
	brgez	%g6,	loop_2572
	ldsh	[%l7 + 0x50],	%l1
	fsrc2	%f24,	%f16
	and	%i1,	%g5,	%i2
loop_2572:
	srl	%o7,	%i4,	%i3
	edge16l	%l6,	%i6,	%o5
	orncc	%o1,	0x01C8,	%l5
	movpos	%xcc,	%l3,	%g2
	edge32n	%o4,	%o2,	%i0
	fbe,a	%fcc3,	loop_2573
	and	%g1,	0x1F2B,	%l0
	move	%icc,	%o0,	%o3
	bcs	loop_2574
loop_2573:
	sllx	%i5,	0x0D,	%g3
	fmovscs	%xcc,	%f7,	%f3
	mova	%icc,	%g7,	%o6
loop_2574:
	tsubcc	%l2,	%i7,	%l4
	edge32	%g4,	%l1,	%g6
	sra	%g5,	%i1,	%o7
	tpos	%icc,	0x6
	addcc	%i4,	%i3,	%l6
	subc	%i2,	%i6,	%o5
	fmovscc	%icc,	%f31,	%f1
	ba,a	%xcc,	loop_2575
	sub	%o1,	%l5,	%l3
	array32	%g2,	%o2,	%o4
	movcs	%icc,	%i0,	%g1
loop_2575:
	andncc	%o0,	%o3,	%l0
	tn	%xcc,	0x1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] %asi,	%g3,	%i5
	srl	%g7,	%l2,	%i7
	udivx	%o6,	0x0A29,	%g4
	edge16l	%l4,	%l1,	%g5
	te	%icc,	0x3
	edge8ln	%i1,	%o7,	%i4
	fbuge	%fcc2,	loop_2576
	movrlz	%i3,	%l6,	%g6
	tgu	%xcc,	0x0
	xnorcc	%i2,	0x165C,	%o5
loop_2576:
	fmovde	%xcc,	%f4,	%f9
	fmuld8ulx16	%f2,	%f12,	%f4
	fbu,a	%fcc1,	loop_2577
	fmovdle	%xcc,	%f24,	%f30
	orcc	%i6,	0x0D06,	%o1
	srlx	%l5,	%g2,	%l3
loop_2577:
	mova	%xcc,	%o2,	%o4
	movrlz	%g1,	0x0F7,	%o0
	edge32l	%o3,	%l0,	%g3
	sll	%i0,	0x1A,	%i5
	tneg	%xcc,	0x2
	fornot2	%f6,	%f2,	%f26
	tvs	%icc,	0x5
	umul	%g7,	0x1810,	%i7
	movrne	%o6,	0x1B5,	%l2
	movrgez	%l4,	0x106,	%g4
	umulcc	%g5,	%l1,	%o7
	edge8ln	%i1,	%i4,	%l6
	bleu,a	loop_2578
	movge	%icc,	%g6,	%i3
	smulcc	%i2,	0x193E,	%o5
	mulx	%i6,	0x1CE2,	%o1
loop_2578:
	bg,a	%icc,	loop_2579
	fpack32	%f16,	%f12,	%f8
	fxnors	%f15,	%f9,	%f22
	tl	%xcc,	0x4
loop_2579:
	fbue	%fcc3,	loop_2580
	or	%l5,	%l3,	%g2
	membar	0x6F
	tle	%icc,	0x4
loop_2580:
	fbg	%fcc1,	loop_2581
	membar	0x67
	membar	0x2E
	tle	%icc,	0x0
loop_2581:
	nop
	set	0x7C, %l2
	sta	%f31,	[%l7 + %l2] 0x18
	fpsub16s	%f27,	%f15,	%f7
	wr	%g0,	0x88,	%asi
	sta	%f11,	[%l7 + 0x10] %asi
	movn	%xcc,	%o2,	%g1
	udiv	%o4,	0x056B,	%o0
	andn	%l0,	%o3,	%i0
	fmovdcs	%icc,	%f1,	%f7
	mulscc	%i5,	0x0C2F,	%g7
	movrgez	%i7,	0x20A,	%g3
	brgz	%l2,	loop_2582
	fmul8ulx16	%f28,	%f10,	%f8
	mulscc	%l4,	0x0699,	%o6
	fsrc1	%f18,	%f0
loop_2582:
	addccc	%g5,	%l1,	%o7
	fmovrslz	%i1,	%f17,	%f28
	sdiv	%i4,	0x0E1E,	%g4
	call	loop_2583
	fcmps	%fcc3,	%f19,	%f13
	umulcc	%g6,	%l6,	%i3
	fblg	%fcc0,	loop_2584
loop_2583:
	fbg,a	%fcc2,	loop_2585
	taddcc	%o5,	0x0151,	%i2
	andncc	%i6,	%l5,	%l3
loop_2584:
	or	%g2,	%o1,	%o2
loop_2585:
	fcmpne16	%f24,	%f16,	%g1
	mova	%xcc,	%o4,	%o0
	fornot1	%f2,	%f14,	%f0
	movrne	%l0,	%o3,	%i0
	srl	%i5,	0x11,	%g7
	fbue,a	%fcc0,	loop_2586
	brnz	%g3,	loop_2587
	mulscc	%l2,	0x1D66,	%i7
	fnor	%f0,	%f12,	%f16
loop_2586:
	fmul8sux16	%f0,	%f6,	%f22
loop_2587:
	fbg	%fcc3,	loop_2588
	alignaddr	%o6,	%g5,	%l4
	edge8	%o7,	%l1,	%i4
	move	%icc,	%g4,	%i1
loop_2588:
	fmovs	%f26,	%f0
	fnegs	%f7,	%f3
	sra	%l6,	0x19,	%g6
	tcs	%xcc,	0x3
	nop
	setx	loop_2589,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbu,a	%fcc2,	loop_2590
	orn	%o5,	0x0AF7,	%i2
	fandnot1s	%f19,	%f22,	%f14
loop_2589:
	nop
	set	0x22, %i0
	sth	%i6,	[%l7 + %i0]
loop_2590:
	siam	0x0
	subcc	%i3,	0x195F,	%l3
	fmovrdgz	%l5,	%f6,	%f0
	nop
	set	0x69, %l5
	stb	%g2,	[%l7 + %l5]
	ldsw	[%l7 + 0x38],	%o1
	fpsub32	%f20,	%f4,	%f2
	set	0x70, %i5
	lda	[%l7 + %i5] 0x81,	%f13
	fmuld8sux16	%f30,	%f18,	%f18
	edge32ln	%g1,	%o2,	%o4
	sra	%l0,	%o0,	%o3
	andncc	%i5,	%i0,	%g3
	fba,a	%fcc3,	loop_2591
	st	%f25,	[%l7 + 0x60]
	edge16n	%g7,	%i7,	%l2
	fpadd16s	%f28,	%f4,	%f12
loop_2591:
	tsubcctv	%o6,	0x1B7A,	%l4
	fmul8sux16	%f2,	%f16,	%f22
	edge32	%g5,	%l1,	%o7
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	subc	%g4,	%i4,	%i1
	sub	%g6,	0x017A,	%l6
	movg	%xcc,	%i2,	%i6
	orn	%o5,	%l3,	%l5
	srl	%i3,	%g2,	%o1
	movvc	%icc,	%o2,	%g1
	fnegd	%f30,	%f18
	sll	%l0,	%o0,	%o4
	tleu	%icc,	0x6
	movneg	%icc,	%o3,	%i0
	tg	%icc,	0x4
	fmovdne	%xcc,	%f29,	%f13
	edge32n	%g3,	%i5,	%i7
	fnot2s	%f0,	%f17
	fmovrdne	%g7,	%f10,	%f26
	tcs	%icc,	0x3
	udivx	%o6,	0x0719,	%l2
	and	%l4,	%l1,	%o7
	ld	[%l7 + 0x44],	%f27
	smulcc	%g5,	0x13E6,	%i4
	xnor	%g4,	%g6,	%l6
	sdivx	%i2,	0x0CD1,	%i6
	popc	0x0A0B,	%i1
	bpos,a	%xcc,	loop_2592
	movrlez	%l3,	%o5,	%i3
	array8	%l5,	%o1,	%o2
	brz	%g2,	loop_2593
loop_2592:
	movrgez	%g1,	%o0,	%l0
	membar	0x0B
	fxor	%f8,	%f10,	%f10
loop_2593:
	edge8	%o3,	%o4,	%g3
	movgu	%xcc,	%i5,	%i7
	mova	%xcc,	%g7,	%o6
	bvs,a	loop_2594
	srlx	%l2,	0x0E,	%i0
	tneg	%icc,	0x7
	movcc	%icc,	%l1,	%l4
loop_2594:
	fpsub16	%f22,	%f28,	%f0
	xnorcc	%g5,	0x03C9,	%o7
	fmovrdlez	%i4,	%f22,	%f28
	bleu	%xcc,	loop_2595
	fbo	%fcc3,	loop_2596
	edge8ln	%g6,	%l6,	%i2
	stb	%i6,	[%l7 + 0x53]
loop_2595:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%g4
loop_2596:
	movg	%xcc,	%o5,	%l3
	sub	%i3,	%l5,	%o1
	smul	%g2,	%o2,	%o0
	addccc	%l0,	%o3,	%o4
	udivx	%g3,	0x1748,	%i5
	sll	%g1,	0x12,	%g7
	sll	%o6,	%l2,	%i0
	fmovdn	%xcc,	%f5,	%f12
	fmovdleu	%icc,	%f28,	%f26
	tsubcc	%l1,	0x05A3,	%i7
	tgu	%icc,	0x1
	fcmpgt32	%f26,	%f10,	%l4
	tcc	%icc,	0x0
	be,a	loop_2597
	ldsb	[%l7 + 0x0D],	%g5
	movrgez	%o7,	%i4,	%g6
	srl	%i2,	0x10,	%i6
loop_2597:
	mulx	%l6,	0x0739,	%i1
	fcmple16	%f26,	%f30,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1F2A,	%l3
	edge16	%o5,	%l5,	%i3
	addc	%g2,	0x0A76,	%o2
	smulcc	%o1,	%l0,	%o0
	fmovdg	%icc,	%f8,	%f29
	movrne	%o4,	0x254,	%g3
	fpack32	%f10,	%f30,	%f10
	fmovsgu	%icc,	%f9,	%f12
	edge32	%o3,	%i5,	%g1
	andcc	%o6,	%l2,	%g7
	tcc	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i0,	%i7,	%l4
	fbule,a	%fcc1,	loop_2598
	ldx	[%l7 + 0x30],	%g5
	bvs,pn	%icc,	loop_2599
	tpos	%icc,	0x7
loop_2598:
	nop
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x88
loop_2599:
	fbl,a	%fcc2,	loop_2600
	fmovsne	%xcc,	%f25,	%f31
	sub	%o7,	%l1,	%i4
	smul	%g6,	%i6,	%l6
loop_2600:
	edge16n	%i2,	%g4,	%l3
	fxors	%f2,	%f11,	%f26
	fornot2	%f18,	%f22,	%f26
	fnor	%f26,	%f14,	%f22
	add	%o5,	%i1,	%i3
	movrne	%l5,	%g2,	%o1
	array16	%l0,	%o0,	%o4
	srl	%o2,	%o3,	%i5
	tgu	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc1,	loop_2601
	tgu	%icc,	0x7
	fcmpgt16	%f22,	%f22,	%g1
	fxor	%f20,	%f22,	%f4
loop_2601:
	edge8n	%o6,	%g3,	%g7
	brgz	%l2,	loop_2602
	sdiv	%i0,	0x118E,	%i7
	fmovdgu	%icc,	%f20,	%f19
	taddcctv	%l4,	0x13DE,	%o7
loop_2602:
	membar	0x16
	bge,a	loop_2603
	sdiv	%l1,	0x004B,	%i4
	tl	%xcc,	0x4
	edge16n	%g5,	%i6,	%l6
loop_2603:
	stw	%i2,	[%l7 + 0x68]
	edge32ln	%g4,	%l3,	%g6
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x10] %asi,	%f30
	fmovdleu	%xcc,	%f31,	%f15
	movgu	%xcc,	%i1,	%o5
	te	%xcc,	0x4
	orncc	%i3,	0x060B,	%g2
	mova	%xcc,	%l5,	%o1
	ldx	[%l7 + 0x38],	%l0
	andncc	%o0,	%o2,	%o3
	edge8n	%o4,	%i5,	%g1
	tpos	%icc,	0x1
	ldsh	[%l7 + 0x58],	%o6
	fors	%f16,	%f29,	%f4
	edge16	%g7,	%g3,	%l2
	edge32n	%i0,	%l4,	%i7
	bne,pt	%icc,	loop_2604
	umulcc	%o7,	0x08A8,	%l1
	bge,a,pn	%xcc,	loop_2605
	srlx	%i4,	%g5,	%i6
loop_2604:
	addc	%l6,	%i2,	%l3
	bcc,pt	%icc,	loop_2606
loop_2605:
	fmovsa	%icc,	%f30,	%f28
	fmovrde	%g6,	%f6,	%f22
	fmovsneg	%xcc,	%f4,	%f23
loop_2606:
	tcs	%xcc,	0x4
	movrgz	%i1,	%g4,	%i3
	tle	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez,a	%o5,	loop_2607
	addc	%g2,	%o1,	%l5
	fmovdgu	%xcc,	%f3,	%f16
	addcc	%l0,	0x07D6,	%o2
loop_2607:
	nop
	setx loop_2608, %l0, %l1
	jmpl %l1, %o3
	ldd	[%l7 + 0x38],	%o0
	sll	%o4,	0x04,	%i5
	bshuffle	%f12,	%f14,	%f26
loop_2608:
	taddcc	%o6,	%g7,	%g1
	brlz,a	%g3,	loop_2609
	tgu	%xcc,	0x6
	tsubcctv	%l2,	0x1391,	%i0
	fblg	%fcc3,	loop_2610
loop_2609:
	sra	%l4,	%i7,	%l1
	fmuld8sux16	%f21,	%f10,	%f0
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x74] %asi,	%o7
loop_2610:
	fcmps	%fcc0,	%f25,	%f6
	ldstub	[%l7 + 0x3F],	%g5
	membar	0x1F
	edge32l	%i6,	%i4,	%i2
	tvc	%icc,	0x7
	fmovsge	%icc,	%f22,	%f7
	array8	%l3,	%l6,	%g6
	tleu	%icc,	0x3
	tl	%xcc,	0x2
	fmovspos	%icc,	%f24,	%f17
	array16	%g4,	%i1,	%i3
	orcc	%o5,	%g2,	%l5
	array16	%o1,	%l0,	%o3
	fpsub32s	%f18,	%f28,	%f12
	xor	%o2,	0x1152,	%o0
	edge32	%o4,	%i5,	%o6
	umulcc	%g7,	%g1,	%l2
	array32	%i0,	%g3,	%i7
	fmovrdlez	%l1,	%f20,	%f30
	tl	%icc,	0x5
	tle	%icc,	0x0
	fcmple16	%f8,	%f22,	%l4
	fornot1	%f0,	%f18,	%f22
	membar	0x2E
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x26] %asi,	%g5
	sethi	0x0450,	%i6
	stw	%i4,	[%l7 + 0x78]
	fmovsa	%xcc,	%f23,	%f7
	set	0x2C, %l0
	stha	%i2,	[%l7 + %l0] 0x14
	mova	%xcc,	%o7,	%l3
	movpos	%xcc,	%g6,	%g4
	sdivx	%i1,	0x1FC3,	%i3
	fmovsvc	%xcc,	%f19,	%f23
	set	0x21, %i6
	stba	%o5,	[%l7 + %i6] 0x18
	fmovs	%f29,	%f6
	sir	0x170F
	orncc	%g2,	%l6,	%o1
	fmovspos	%xcc,	%f3,	%f15
	tg	%icc,	0x4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%o3
	ble	loop_2611
	be,a	loop_2612
	tcc	%xcc,	0x7
	edge32n	%l5,	%o2,	%o4
loop_2611:
	movle	%xcc,	%i5,	%o0
loop_2612:
	fnot2s	%f23,	%f15
	tl	%xcc,	0x1
	movge	%icc,	%g7,	%o6
	nop
	setx	loop_2613,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8	%g1,	%i0,	%l2
	bcc	loop_2614
	movl	%icc,	%i7,	%g3
loop_2613:
	nop
	set	0x48, %i7
	lda	[%l7 + %i7] 0x80,	%f16
loop_2614:
	nop
	wr	%g0,	0x11,	%asi
	stwa	%l1,	[%l7 + 0x54] %asi
	taddcc	%g5,	%l4,	%i4
	fcmpd	%fcc2,	%f30,	%f22
	alignaddrl	%i2,	%i6,	%l3
	nop
	setx	loop_2615,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8x16al	%f21,	%f12,	%f8
	ldsh	[%l7 + 0x2C],	%o7
	set	0x08, %g2
	stxa	%g4,	[%l7 + %g2] 0x19
loop_2615:
	fnor	%f24,	%f2,	%f20
	fones	%f7
	ba	loop_2616
	umulcc	%i1,	%i3,	%g6
	stb	%o5,	[%l7 + 0x19]
	be	%icc,	loop_2617
loop_2616:
	fmovsgu	%xcc,	%f1,	%f26
	movneg	%xcc,	%g2,	%o1
	fandnot1s	%f12,	%f3,	%f9
loop_2617:
	movre	%l6,	0x1F1,	%o3
	fba	%fcc1,	loop_2618
	ldsb	[%l7 + 0x31],	%l0
	mulx	%l5,	0x0359,	%o4
	edge16l	%o2,	%o0,	%i5
loop_2618:
	mulscc	%g7,	0x19D5,	%g1
	fcmpne16	%f22,	%f20,	%o6
	fmovrdgez	%l2,	%f28,	%f16
	tleu	%icc,	0x4
	tg	%icc,	0x5
	tcs	%icc,	0x7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%g3
	udivx	%l1,	0x0E28,	%g5
	andcc	%i0,	%l4,	%i4
	movle	%xcc,	%i2,	%l3
	fornot1	%f30,	%f16,	%f24
	subcc	%i6,	0x09A1,	%o7
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x4C] %asi,	%g4
	bcc,a	%icc,	loop_2619
	taddcctv	%i1,	0x1093,	%i3
	ta	%icc,	0x0
	edge32ln	%g6,	%g2,	%o5
loop_2619:
	udivcc	%l6,	0x0FFC,	%o3
	srax	%l0,	%l5,	%o4
	edge16l	%o2,	%o0,	%o1
	addc	%g7,	%i5,	%g1
	fmovd	%f22,	%f24
	mulscc	%l2,	0x0B09,	%i7
	tcs	%xcc,	0x4
	ldsh	[%l7 + 0x44],	%g3
	srlx	%o6,	%l1,	%i0
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%g5
	fbn,a	%fcc2,	loop_2620
	tvs	%icc,	0x2
	fpackfix	%f2,	%f8
	fmovsa	%icc,	%f20,	%f2
loop_2620:
	fpadd16s	%f10,	%f19,	%f26
	tleu	%xcc,	0x3
	tleu	%xcc,	0x1
	tl	%xcc,	0x3
	bge,a,pt	%icc,	loop_2621
	fmovsl	%xcc,	%f22,	%f6
	sll	%l4,	%i4,	%i2
	orcc	%l3,	0x0592,	%i6
loop_2621:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x38] %asi,	%o7
	brlez	%g4,	loop_2622
	orn	%i1,	%i3,	%g2
	edge8ln	%g6,	%o5,	%l6
	alignaddr	%l0,	%o3,	%l5
loop_2622:
	fandnot1s	%f9,	%f14,	%f16
	brlz,a	%o2,	loop_2623
	brz,a	%o0,	loop_2624
	tcs	%icc,	0x7
	fmovsleu	%xcc,	%f7,	%f3
loop_2623:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x51] %asi,	%o4
loop_2624:
	movrlz	%o1,	0x0BD,	%g7
	movpos	%icc,	%g1,	%l2
	fbul	%fcc3,	loop_2625
	srlx	%i5,	%g3,	%o6
	sll	%i7,	0x03,	%l1
	fone	%f12
loop_2625:
	movrgz	%i0,	%l4,	%g5
	array32	%i4,	%l3,	%i2
	brlz	%i6,	loop_2626
	fblg,a	%fcc0,	loop_2627
	mova	%xcc,	%o7,	%g4
	nop
	set	0x50, %g5
	ldsw	[%l7 + %g5],	%i1
loop_2626:
	sub	%i3,	%g2,	%g6
loop_2627:
	taddcctv	%l6,	%l0,	%o5
	taddcc	%o3,	%o2,	%l5
	smul	%o0,	0x192D,	%o4
	fbg,a	%fcc1,	loop_2628
	add	%o1,	0x176E,	%g1
	taddcc	%l2,	0x0E94,	%i5
	edge32n	%g3,	%o6,	%i7
loop_2628:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
	sllx	%i0,	%g7,	%l4
	edge8	%i4,	%l3,	%g5
	addc	%i2,	%o7,	%g4
	fornot2s	%f19,	%f30,	%f14
	bneg,a,pt	%icc,	loop_2629
	fandnot1	%f4,	%f20,	%f28
	fmovdne	%xcc,	%f4,	%f3
	movleu	%icc,	%i1,	%i6
loop_2629:
	movvc	%icc,	%i3,	%g6
	srl	%g2,	0x0F,	%l6
	subccc	%l0,	%o3,	%o2
	fmovde	%icc,	%f12,	%f12
	brz	%o5,	loop_2630
	sdivcc	%o0,	0x0DBA,	%o4
	movrgez	%o1,	%l5,	%l2
	sir	0x11D8
loop_2630:
	sdivx	%i5,	0x1899,	%g1
	edge32ln	%g3,	%i7,	%o6
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge8l	%i0,	%g7,	%l1
	sdivcc	%i4,	0x0DEC,	%l3
	srl	%g5,	%i2,	%o7
	ldsb	[%l7 + 0x35],	%g4
	fmovrsgez	%l4,	%f13,	%f4
	fmovdvs	%icc,	%f8,	%f20
	ldstub	[%l7 + 0x28],	%i1
	mulscc	%i6,	0x0BEA,	%g6
	fxnor	%f8,	%f0,	%f2
	fone	%f18
	fbg,a	%fcc1,	loop_2631
	fmovdle	%icc,	%f27,	%f22
	orncc	%i3,	0x0CDE,	%g2
	movpos	%icc,	%l0,	%o3
loop_2631:
	sub	%o2,	%l6,	%o5
	fsrc1	%f28,	%f16
	fmovdle	%xcc,	%f20,	%f24
	tge	%icc,	0x5
	edge8n	%o4,	%o0,	%l5
	tsubcc	%l2,	0x12EE,	%o1
	nop
	setx	loop_2632,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bpos,a	%icc,	loop_2633
	fors	%f9,	%f8,	%f9
	fbu,a	%fcc0,	loop_2634
loop_2632:
	tge	%icc,	0x6
loop_2633:
	xnorcc	%i5,	%g3,	%g1
	brlz,a	%o6,	loop_2635
loop_2634:
	fpackfix	%f20,	%f2
	edge32ln	%i7,	%g7,	%l1
	ba,pn	%xcc,	loop_2636
loop_2635:
	fmovd	%f4,	%f20
	tl	%xcc,	0x7
	fmovsn	%xcc,	%f29,	%f26
loop_2636:
	andn	%i0,	%i4,	%l3
	sethi	0x1727,	%g5
	popc	%i2,	%o7
	sdiv	%l4,	0x0903,	%g4
	ta	%icc,	0x5
	movg	%icc,	%i1,	%g6
	taddcctv	%i6,	%g2,	%l0
	edge16l	%o3,	%o2,	%l6
	fcmpgt16	%f10,	%f12,	%i3
	and	%o4,	0x1528,	%o5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x10,	%o0,	%l5
	sll	%l2,	%i5,	%g3
	fnor	%f24,	%f10,	%f28
	tle	%icc,	0x4
	addcc	%g1,	%o1,	%i7
	nop
	setx	loop_2637,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%g7,	%o6,	%l1
	sdiv	%i4,	0x1207,	%i0
	and	%l3,	0x04B2,	%i2
loop_2637:
	tne	%xcc,	0x6
	fmovrdlez	%g5,	%f2,	%f4
	srlx	%l4,	%o7,	%g4
	fbug	%fcc2,	loop_2638
	fcmped	%fcc2,	%f14,	%f28
	fnot1	%f28,	%f20
	fmul8sux16	%f12,	%f30,	%f10
loop_2638:
	tn	%icc,	0x2
	te	%xcc,	0x4
	sub	%i1,	0x12D8,	%g6
	fmovdl	%icc,	%f25,	%f7
	movrgz	%g2,	0x0E3,	%i6
	taddcctv	%l0,	0x0D09,	%o2
	fbul,a	%fcc2,	loop_2639
	fone	%f28
	srlx	%o3,	%l6,	%i3
	xnor	%o5,	%o0,	%o4
loop_2639:
	be	loop_2640
	fmovdleu	%icc,	%f17,	%f16
	ldstub	[%l7 + 0x7F],	%l2
	bne,a	loop_2641
loop_2640:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x48],	%i5
	sdiv	%g3,	0x0360,	%l5
loop_2641:
	tl	%icc,	0x5
	srlx	%g1,	0x09,	%i7
	prefetch	[%l7 + 0x24],	 0x3
	set	0x20, %l4
	ldda	[%l7 + %l4] 0xeb,	%g6
	movre	%o1,	%o6,	%i4
	mova	%icc,	%i0,	%l1
	fmovsgu	%xcc,	%f26,	%f3
	addc	%i2,	0x0AC6,	%g5
	movne	%icc,	%l3,	%l4
	bleu,a	%icc,	loop_2642
	flush	%l7 + 0x38
	xnorcc	%g4,	%o7,	%i1
	andcc	%g2,	%g6,	%i6
loop_2642:
	brz,a	%o2,	loop_2643
	sir	0x1B5E
	array8	%l0,	%o3,	%l6
	sub	%i3,	0x03E4,	%o0
loop_2643:
	edge32l	%o5,	%l2,	%o4
	sdivcc	%i5,	0x132A,	%g3
	movrgez	%g1,	%i7,	%l5
	sra	%g7,	0x0D,	%o1
	set	0x10, %l3
	ldxa	[%l7 + %l3] 0x0c,	%o6
	swap	[%l7 + 0x18],	%i4
	xnorcc	%l1,	0x1948,	%i2
	bleu,pn	%xcc,	loop_2644
	movgu	%xcc,	%g5,	%i0
	movre	%l4,	%l3,	%o7
	mulscc	%i1,	%g2,	%g6
loop_2644:
	tne	%xcc,	0x2
	sub	%g4,	%i6,	%l0
	ble,a	loop_2645
	tcs	%xcc,	0x3
	tg	%icc,	0x1
	be,a	%xcc,	loop_2646
loop_2645:
	udiv	%o3,	0x02F1,	%l6
	and	%o2,	0x113E,	%i3
	set	0x70, %l6
	prefetcha	[%l7 + %l6] 0x89,	 0x1
loop_2646:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%l2,	%f20,	%f20
	set	0x60, %i4
	swapa	[%l7 + %i4] 0x0c,	%o5
	edge16ln	%o4,	%i5,	%g3
	movneg	%xcc,	%g1,	%l5
	move	%xcc,	%i7,	%o1
	fbge	%fcc2,	loop_2647
	ldsh	[%l7 + 0x40],	%o6
	bne,a,pn	%icc,	loop_2648
	move	%xcc,	%i4,	%l1
loop_2647:
	fmuld8ulx16	%f25,	%f8,	%f10
	brz,a	%i2,	loop_2649
loop_2648:
	fbl,a	%fcc2,	loop_2650
	call	loop_2651
	fpadd16s	%f7,	%f20,	%f23
loop_2649:
	edge32	%g5,	%g7,	%i0
loop_2650:
	fxor	%f8,	%f18,	%f26
loop_2651:
	smul	%l4,	%o7,	%l3
	be	loop_2652
	subc	%g2,	0x0802,	%g6
	fzeros	%f8
	sll	%g4,	0x1E,	%i1
loop_2652:
	xor	%l0,	%o3,	%l6
	fmovrdlez	%o2,	%f30,	%f0
	movge	%icc,	%i3,	%i6
	movrgz	%o0,	%l2,	%o4
	xnorcc	%i5,	%g3,	%o5
	swap	[%l7 + 0x0C],	%g1
	movle	%icc,	%i7,	%l5
	fpack16	%f26,	%f18
	ldsw	[%l7 + 0x48],	%o6
	srlx	%i4,	0x00,	%l1
	fmovdne	%xcc,	%f2,	%f20
	movpos	%icc,	%o1,	%i2
	movvc	%xcc,	%g5,	%g7
	or	%l4,	%o7,	%i0
	movleu	%xcc,	%g2,	%l3
	xor	%g6,	0x0FF2,	%g4
	edge16l	%i1,	%l0,	%l6
	movrgz	%o3,	%o2,	%i6
	sllx	%i3,	%l2,	%o4
	fone	%f20
	lduh	[%l7 + 0x30],	%o0
	fbo,a	%fcc2,	loop_2653
	tvs	%xcc,	0x1
	alignaddrl	%g3,	%i5,	%g1
	taddcc	%o5,	0x0788,	%l5
loop_2653:
	ldsh	[%l7 + 0x2E],	%i7
	fcmple16	%f10,	%f20,	%o6
	xnor	%i4,	0x1299,	%o1
	edge8l	%l1,	%g5,	%g7
	umulcc	%i2,	0x1922,	%l4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x10,	%i0,	%o7
	xor	%g2,	0x1E98,	%l3
	sll	%g4,	%i1,	%g6
	nop
	set	0x52, %i3
	ldsh	[%l7 + %i3],	%l6
	fcmpne32	%f30,	%f8,	%o3
	array32	%l0,	%o2,	%i3
	edge32n	%l2,	%i6,	%o0
	set	0x77, %o2
	ldsba	[%l7 + %o2] 0x10,	%g3
	fpack16	%f16,	%f7
	ba,a,pn	%xcc,	loop_2654
	array8	%i5,	%o4,	%o5
	fmovdpos	%icc,	%f12,	%f16
	tneg	%xcc,	0x7
loop_2654:
	fmovsg	%xcc,	%f13,	%f2
	fmovdpos	%xcc,	%f25,	%f9
	tge	%icc,	0x1
	tle	%xcc,	0x4
	nop
	setx loop_2655, %l0, %l1
	jmpl %l1, %l5
	movg	%icc,	%g1,	%i7
	subc	%i4,	0x19A0,	%o6
	tle	%icc,	0x3
loop_2655:
	fpadd32s	%f6,	%f27,	%f20
	fcmpes	%fcc3,	%f29,	%f17
	movl	%icc,	%l1,	%g5
	add	%o1,	0x06BF,	%i2
	sethi	0x0054,	%g7
	fsrc2s	%f24,	%f22
	ble,a,pn	%icc,	loop_2656
	pdist	%f22,	%f16,	%f22
	movrlez	%i0,	0x1D2,	%l4
	stb	%o7,	[%l7 + 0x41]
loop_2656:
	movg	%icc,	%g2,	%l3
	movg	%icc,	%i1,	%g6
	mova	%xcc,	%l6,	%o3
	fbe,a	%fcc2,	loop_2657
	fpmerge	%f20,	%f21,	%f6
	movpos	%icc,	%l0,	%o2
	movleu	%icc,	%i3,	%l2
loop_2657:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	fmovrdne	%g4,	%f20,	%f10
	movl	%xcc,	%g3,	%i5
	ta	%xcc,	0x6
	array16	%o4,	%o0,	%o5
	movne	%xcc,	%g1,	%i7
	sdivcc	%i4,	0x0854,	%l5
	lduw	[%l7 + 0x40],	%l1
	fbg,a	%fcc0,	loop_2658
	tpos	%icc,	0x3
	ldx	[%l7 + 0x68],	%g5
	bg,a	loop_2659
loop_2658:
	sll	%o6,	0x1F,	%i2
	fandnot2	%f4,	%f16,	%f20
	lduw	[%l7 + 0x64],	%g7
loop_2659:
	andcc	%o1,	%l4,	%o7
	movcs	%xcc,	%g2,	%l3
	fbug,a	%fcc3,	loop_2660
	movne	%xcc,	%i0,	%g6
	subcc	%l6,	%o3,	%i1
	addc	%o2,	0x19F8,	%i3
loop_2660:
	xnor	%l2,	%l0,	%g4
	fmovrslz	%i6,	%f17,	%f13
	fpsub16s	%f25,	%f5,	%f2
	fbn,a	%fcc3,	loop_2661
	nop
	set	0x78, %g4
	std	%g2,	[%l7 + %g4]
	tcc	%xcc,	0x1
	movn	%xcc,	%i5,	%o4
loop_2661:
	or	%o5,	0x1368,	%o0
	movcs	%icc,	%g1,	%i4
	fmovdge	%xcc,	%f14,	%f5
	bne,pn	%icc,	loop_2662
	fbne,a	%fcc3,	loop_2663
	tgu	%icc,	0x0
	bcc	%xcc,	loop_2664
loop_2662:
	edge16n	%i7,	%l5,	%l1
loop_2663:
	fandnot2	%f10,	%f24,	%f4
	smul	%o6,	0x10F0,	%g5
loop_2664:
	sllx	%i2,	0x01,	%o1
	array8	%l4,	%g7,	%o7
	fbug	%fcc0,	loop_2665
	fpsub32	%f4,	%f16,	%f8
	lduh	[%l7 + 0x18],	%l3
	movrgez	%g2,	%g6,	%i0
loop_2665:
	taddcctv	%o3,	%l6,	%o2
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x20] %asi,	%i2
	subcc	%i1,	0x04BD,	%l2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x48] %asi,	%f9
	fcmpne32	%f18,	%f8,	%l0
	mova	%icc,	%g4,	%i6
	movg	%xcc,	%i5,	%g3
	fpadd32s	%f27,	%f16,	%f30
	fmovdvs	%icc,	%f4,	%f16
	fcmpgt16	%f28,	%f28,	%o5
	set	0x78, %o6
	ldxa	[%l7 + %o6] 0x89,	%o4
	orcc	%g1,	0x04BA,	%o0
	edge16ln	%i7,	%l5,	%i4
	andn	%l1,	%g5,	%o6
	ld	[%l7 + 0x50],	%f1
	edge8	%i2,	%l4,	%o1
	movg	%xcc,	%g7,	%o7
	nop
	setx	loop_2666,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvs	%icc,	0x5
	fmovrslz	%g2,	%f29,	%f7
	addcc	%l3,	0x04DD,	%i0
loop_2666:
	fba	%fcc2,	loop_2667
	fmovscc	%icc,	%f22,	%f0
	brlez	%g6,	loop_2668
	te	%xcc,	0x6
loop_2667:
	fmul8x16au	%f23,	%f4,	%f2
	umul	%o3,	%o2,	%l6
loop_2668:
	fmovrsne	%i3,	%f25,	%f12
	umul	%i1,	0x0F22,	%l0
	tgu	%xcc,	0x5
	bne	%xcc,	loop_2669
	fnot2s	%f1,	%f22
	fmovrslz	%g4,	%f8,	%f2
	movrgez	%l2,	%i6,	%i5
loop_2669:
	tcs	%icc,	0x6
	movcc	%icc,	%g3,	%o4
	edge8n	%o5,	%o0,	%i7
	xor	%g1,	0x1063,	%l5
	movleu	%icc,	%l1,	%i4
	array8	%o6,	%i2,	%l4
	fmovrdlz	%o1,	%f18,	%f2
	sdiv	%g5,	0x0AAB,	%g7
	ldx	[%l7 + 0x68],	%o7
	movrlez	%g2,	%i0,	%l3
	mulx	%o3,	0x005F,	%o2
	fsrc2	%f18,	%f0
	andcc	%l6,	0x0AC1,	%i3
	addccc	%i1,	%g6,	%g4
	movneg	%icc,	%l2,	%i6
	fmovrsgz	%i5,	%f10,	%f29
	tl	%xcc,	0x3
	stbar
	nop
	setx loop_2670, %l0, %l1
	jmpl %l1, %g3
	bneg,pt	%icc,	loop_2671
	tsubcctv	%o4,	0x0223,	%o5
	movrgez	%l0,	%o0,	%g1
loop_2670:
	orncc	%l5,	0x0C68,	%i7
loop_2671:
	nop
	wr	%g0,	0x18,	%asi
	sta	%f28,	[%l7 + 0x54] %asi
	andcc	%i4,	0x041E,	%o6
	fpadd32s	%f25,	%f19,	%f11
	bvs,pt	%icc,	loop_2672
	fbug	%fcc0,	loop_2673
	tvs	%xcc,	0x0
	movvs	%icc,	%l1,	%l4
loop_2672:
	orn	%o1,	0x1000,	%g5
loop_2673:
	addcc	%g7,	0x0273,	%o7
	tg	%icc,	0x2
	swap	[%l7 + 0x0C],	%g2
	bneg,a	%icc,	loop_2674
	umul	%i0,	%i2,	%l3
	sdivcc	%o2,	0x1949,	%o3
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x7F] %asi,	%l6
loop_2674:
	udivx	%i1,	0x12BB,	%i3
	sth	%g4,	[%l7 + 0x7E]
	umulcc	%l2,	0x1385,	%i6
	movvs	%icc,	%g6,	%g3
	edge8	%o4,	%i5,	%o5
	tne	%icc,	0x4
	udivcc	%l0,	0x12D4,	%o0
	andncc	%l5,	%i7,	%i4
	tl	%icc,	0x7
	call	loop_2675
	fmovdn	%xcc,	%f29,	%f2
	edge16n	%o6,	%g1,	%l1
	bpos,pt	%icc,	loop_2676
loop_2675:
	fmovsn	%xcc,	%f11,	%f20
	movle	%xcc,	%o1,	%g5
	lduh	[%l7 + 0x08],	%l4
loop_2676:
	fnor	%f22,	%f18,	%f28
	movpos	%xcc,	%g7,	%g2
	addc	%o7,	%i2,	%l3
	fmovdleu	%icc,	%f28,	%f23
	sub	%o2,	0x0570,	%i0
	fmovrsgez	%l6,	%f2,	%f16
	fmul8x16	%f2,	%f4,	%f8
	fcmped	%fcc2,	%f8,	%f6
	movvc	%icc,	%o3,	%i1
	te	%xcc,	0x1
	popc	%i3,	%g4
	tg	%icc,	0x1
	brgz	%i6,	loop_2677
	xorcc	%l2,	0x014A,	%g3
	umul	%o4,	0x1C30,	%g6
	sdiv	%o5,	0x09BA,	%i5
loop_2677:
	fsrc1s	%f14,	%f30
	srax	%l0,	0x0E,	%l5
	orncc	%o0,	0x1FD6,	%i7
	xnorcc	%i4,	%g1,	%o6
	tgu	%xcc,	0x5
	subccc	%l1,	%o1,	%l4
	fmovsvc	%icc,	%f13,	%f24
	fbne,a	%fcc0,	loop_2678
	fpadd32s	%f28,	%f18,	%f20
	tneg	%xcc,	0x6
	tne	%xcc,	0x5
loop_2678:
	xorcc	%g7,	0x1669,	%g5
	edge8l	%g2,	%i2,	%o7
	edge16n	%o2,	%l3,	%i0
	bvs,a	%xcc,	loop_2679
	ldub	[%l7 + 0x30],	%l6
	fmul8x16al	%f6,	%f6,	%f16
	andcc	%o3,	%i1,	%i3
loop_2679:
	tcc	%xcc,	0x7
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x3A] %asi,	%i6
	fmovsn	%xcc,	%f11,	%f22
	smul	%l2,	%g3,	%g4
	smul	%o4,	0x0129,	%o5
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%i5
	sir	0x1CFD
	tg	%icc,	0x3
	edge32l	%l5,	%l0,	%o0
	popc	%i7,	%i4
	nop
	setx	loop_2680,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bne,a,pt	%xcc,	loop_2681
	movvc	%xcc,	%o6,	%g1
	add	%l1,	%l4,	%g7
loop_2680:
	mulscc	%g5,	0x1A9F,	%g2
loop_2681:
	edge8l	%o1,	%i2,	%o7
	fxors	%f25,	%f28,	%f16
	fnot1s	%f11,	%f29
	edge8l	%l3,	%o2,	%l6
	nop
	set	0x60, %i2
	stx	%o3,	[%l7 + %i2]
	fnot2s	%f27,	%f2
	fpmerge	%f12,	%f16,	%f20
	nop
	setx	loop_2682,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%i0,	%i1,	%i6
	tcc	%xcc,	0x6
	fxnors	%f10,	%f15,	%f2
loop_2682:
	tsubcc	%l2,	0x18FE,	%i3
	fbge	%fcc0,	loop_2683
	movrlz	%g4,	0x223,	%g3
	fblg,a	%fcc3,	loop_2684
	sir	0x1CD4
loop_2683:
	tvs	%icc,	0x7
	brz	%o4,	loop_2685
loop_2684:
	fmovd	%f16,	%f26
	sir	0x13A2
	fmovsleu	%xcc,	%f14,	%f16
loop_2685:
	array32	%g6,	%i5,	%o5
	srl	%l5,	0x1D,	%l0
	fbul	%fcc0,	loop_2686
	lduw	[%l7 + 0x58],	%i7
	subc	%o0,	0x03AA,	%o6
	subccc	%g1,	0x00BB,	%i4
loop_2686:
	ld	[%l7 + 0x48],	%f24
	mova	%icc,	%l1,	%g7
	sethi	0x05FE,	%l4
	movpos	%xcc,	%g2,	%o1
	nop
	setx	loop_2687,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sethi	0x1FE1,	%g5
	fmovsleu	%icc,	%f3,	%f0
	fmovdg	%xcc,	%f7,	%f18
loop_2687:
	addcc	%i2,	0x14F1,	%l3
	bne	%icc,	loop_2688
	xor	%o7,	0x151F,	%o2
	nop
	set	0x36, %l1
	stb	%l6,	[%l7 + %l1]
	fandnot2	%f24,	%f6,	%f14
loop_2688:
	stb	%i0,	[%l7 + 0x2D]
	fpsub32s	%f8,	%f1,	%f29
	umulcc	%o3,	0x1F83,	%i6
	prefetch	[%l7 + 0x20],	 0x1
	fcmpd	%fcc2,	%f30,	%f22
	nop
	setx	loop_2689,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movre	%l2,	0x063,	%i1
	udiv	%g4,	0x1F7C,	%i3
	fbg,a	%fcc2,	loop_2690
loop_2689:
	fmovse	%icc,	%f11,	%f1
	fbl	%fcc2,	loop_2691
	taddcc	%o4,	%g3,	%i5
loop_2690:
	xnor	%o5,	%g6,	%l0
	swap	[%l7 + 0x44],	%l5
loop_2691:
	fpsub32s	%f22,	%f8,	%f4
	fcmped	%fcc3,	%f4,	%f8
	taddcc	%o0,	0x175D,	%o6
	edge8ln	%i7,	%g1,	%l1
	array16	%i4,	%l4,	%g7
	fmovdcs	%icc,	%f27,	%f5
	movre	%o1,	0x151,	%g2
	sdivcc	%i2,	0x172F,	%l3
	fmovrslez	%g5,	%f20,	%f24
	fsrc2s	%f20,	%f10
	subc	%o7,	0x1C87,	%o2
	brlez,a	%i0,	loop_2692
	fnors	%f26,	%f17,	%f2
	alignaddr	%o3,	%l6,	%i6
	fones	%f10
loop_2692:
	sra	%i1,	0x13,	%l2
	udiv	%i3,	0x0CAC,	%g4
	movrgez	%o4,	0x078,	%g3
	movrlez	%o5,	%g6,	%i5
	udiv	%l5,	0x1B13,	%l0
	edge8l	%o6,	%o0,	%g1
	tgu	%xcc,	0x7
	movvs	%xcc,	%l1,	%i7
	fmovrdne	%i4,	%f14,	%f0
	move	%xcc,	%l4,	%g7
	set	0x34, %o4
	ldswa	[%l7 + %o4] 0x10,	%g2
	subccc	%i2,	%l3,	%g5
	fmovdn	%icc,	%f17,	%f10
	ldub	[%l7 + 0x65],	%o7
	ba	loop_2693
	orn	%o2,	0x13C7,	%i0
	edge16l	%o3,	%l6,	%i6
	and	%o1,	0x0D6F,	%i1
loop_2693:
	sth	%l2,	[%l7 + 0x6C]
	tcc	%icc,	0x6
	fmovrdlz	%i3,	%f8,	%f12
	fmovrse	%o4,	%f27,	%f7
	lduh	[%l7 + 0x74],	%g4
	set	0x78, %g1
	sta	%f18,	[%l7 + %g1] 0x19
	fcmps	%fcc3,	%f1,	%f5
	nop
	set	0x69, %i1
	ldub	[%l7 + %i1],	%o5
	fmovsne	%xcc,	%f19,	%f27
	nop
	set	0x4B, %g7
	ldstub	[%l7 + %g7],	%g6
	fbug	%fcc3,	loop_2694
	fmul8x16al	%f1,	%f3,	%f20
	set	0x3B, %o1
	stba	%i5,	[%l7 + %o1] 0x15
loop_2694:
	tsubcc	%l5,	0x0250,	%g3
	movrlz	%l0,	%o0,	%g1
	fmovsleu	%xcc,	%f25,	%f3
	fmovscc	%icc,	%f7,	%f1
	andcc	%l1,	%i7,	%o6
	movneg	%icc,	%i4,	%g7
	sir	0x0877
	nop
	setx	loop_2695,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addc	%g2,	0x07AB,	%i2
	array8	%l3,	%g5,	%o7
	fbue	%fcc1,	loop_2696
loop_2695:
	subc	%o2,	0x0183,	%l4
	fmovrse	%i0,	%f1,	%f28
	edge16ln	%l6,	%i6,	%o3
loop_2696:
	movle	%xcc,	%i1,	%o1
	call	loop_2697
	sir	0x189C
	alignaddrl	%l2,	%i3,	%o4
	fmovrdlz	%o5,	%f20,	%f18
loop_2697:
	add	%g4,	0x0697,	%i5
	movge	%icc,	%g6,	%g3
	fbue,a	%fcc0,	loop_2698
	fmovde	%xcc,	%f16,	%f1
	bcs,a,pt	%xcc,	loop_2699
	orncc	%l5,	0x0B8C,	%o0
loop_2698:
	tvc	%icc,	0x4
	fmovsg	%icc,	%f9,	%f21
loop_2699:
	nop
	set	0x26, %o0
	ldsba	[%l7 + %o0] 0x14,	%g1
	mova	%icc,	%l1,	%i7
	fcmps	%fcc1,	%f5,	%f20
	fxor	%f20,	%f2,	%f8
	movg	%xcc,	%o6,	%l0
	stb	%g7,	[%l7 + 0x31]
	tgu	%xcc,	0x7
	fcmpne16	%f10,	%f18,	%i4
	tle	%icc,	0x0
	add	%g2,	%i2,	%l3
	bcs,a,pn	%xcc,	loop_2700
	movgu	%xcc,	%g5,	%o2
	and	%l4,	0x0FC4,	%i0
	fmovsge	%xcc,	%f15,	%f20
loop_2700:
	edge32	%l6,	%i6,	%o7
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x80,	%f0
	mulscc	%o3,	0x04EA,	%i1
	sth	%l2,	[%l7 + 0x36]
	udiv	%o1,	0x07C0,	%o4
	tvc	%icc,	0x2
	ble	%icc,	loop_2701
	alignaddr	%o5,	%i3,	%i5
	andn	%g4,	0x0121,	%g6
	andncc	%l5,	%g3,	%g1
loop_2701:
	fornot2	%f20,	%f12,	%f12
	fbul	%fcc3,	loop_2702
	fmul8x16	%f29,	%f0,	%f16
	umulcc	%l1,	%i7,	%o6
	array32	%o0,	%l0,	%g7
loop_2702:
	nop
	set	0x40, %o7
	prefetcha	[%l7 + %o7] 0x14,	 0x0
	fnot1s	%f5,	%f14
	movg	%xcc,	%g2,	%l3
	fbug	%fcc1,	loop_2703
	edge8n	%g5,	%i2,	%l4
	fpsub32s	%f24,	%f16,	%f1
	taddcc	%o2,	0x059A,	%l6
loop_2703:
	bleu,pn	%xcc,	loop_2704
	stw	%i0,	[%l7 + 0x30]
	sethi	0x13E0,	%o7
	bg,pt	%icc,	loop_2705
loop_2704:
	ba,pn	%xcc,	loop_2706
	edge32ln	%i6,	%i1,	%o3
	fnors	%f16,	%f22,	%f9
loop_2705:
	subcc	%o1,	0x0A4F,	%o4
loop_2706:
	ble,a	loop_2707
	fpsub16s	%f25,	%f7,	%f20
	edge8n	%l2,	%i3,	%o5
	bleu,a,pn	%icc,	loop_2708
loop_2707:
	andncc	%g4,	%i5,	%g6
	subc	%g3,	%l5,	%g1
	movrgz	%i7,	0x1E9,	%o6
loop_2708:
	te	%xcc,	0x5
	taddcctv	%l1,	%o0,	%l0
	movn	%xcc,	%i4,	%g7
	fcmpne32	%f8,	%f18,	%g2
	movrgz	%l3,	0x1F9,	%g5
	fmuld8sux16	%f13,	%f23,	%f0
	pdist	%f28,	%f2,	%f22
	be,a,pt	%icc,	loop_2709
	fbu	%fcc2,	loop_2710
	or	%l4,	0x0104,	%i2
	tg	%icc,	0x7
loop_2709:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2710:
	srlx	%o2,	0x1B,	%i0
	fmovrslz	%o7,	%f7,	%f22
	wr	%g0,	0x2f,	%asi
	stba	%i6,	[%l7 + 0x53] %asi
	membar	#Sync
	tcc	%icc,	0x0
	movrne	%l6,	%i1,	%o3
	nop
	setx loop_2711, %l0, %l1
	jmpl %l1, %o1
	fabsd	%f10,	%f26
	fmovdne	%icc,	%f0,	%f25
	fpadd32s	%f10,	%f21,	%f22
loop_2711:
	subc	%o4,	%l2,	%o5
	xorcc	%g4,	0x1427,	%i3
	wr	%g0,	0x18,	%asi
	stba	%i5,	[%l7 + 0x2A] %asi
	fandnot2	%f8,	%f14,	%f8
	bg,a	loop_2712
	xorcc	%g6,	0x06CE,	%g3
	movvs	%xcc,	%g1,	%i7
	fba,a	%fcc0,	loop_2713
loop_2712:
	sllx	%l5,	%l1,	%o0
	tneg	%xcc,	0x0
	nop
	set	0x20, %o5
	lduw	[%l7 + %o5],	%o6
loop_2713:
	edge32l	%i4,	%g7,	%l0
	xnorcc	%l3,	%g2,	%g5
	te	%icc,	0x2
	movrgz	%i2,	%l4,	%i0
	fbl,a	%fcc2,	loop_2714
	bl,a,pn	%icc,	loop_2715
	fandnot2	%f20,	%f2,	%f10
	mulscc	%o2,	%o7,	%i6
loop_2714:
	tsubcctv	%l6,	0x0BA4,	%i1
loop_2715:
	tl	%xcc,	0x1
	addc	%o1,	%o3,	%l2
	fmovrdgez	%o5,	%f22,	%f22
	tsubcc	%o4,	%g4,	%i3
	movcs	%icc,	%g6,	%g3
	bneg,pt	%xcc,	loop_2716
	call	loop_2717
	movvc	%icc,	%i5,	%g1
	ldd	[%l7 + 0x58],	%f22
loop_2716:
	fnot2s	%f11,	%f26
loop_2717:
	tl	%xcc,	0x2
	tleu	%xcc,	0x1
	bneg,pt	%xcc,	loop_2718
	tvc	%xcc,	0x1
	tge	%icc,	0x7
	edge8	%l5,	%l1,	%o0
loop_2718:
	sir	0x1108
	nop
	setx loop_2719, %l0, %l1
	jmpl %l1, %o6
	fornot2	%f8,	%f6,	%f30
	udivcc	%i4,	0x0613,	%i7
	orn	%l0,	%l3,	%g2
loop_2719:
	sir	0x1A47
	ble,a	loop_2720
	movleu	%icc,	%g5,	%i2
	edge16ln	%g7,	%l4,	%o2
	move	%xcc,	%o7,	%i6
loop_2720:
	mulx	%l6,	0x04CF,	%i1
	sdiv	%i0,	0x030D,	%o1
	fcmple32	%f22,	%f24,	%o3
	movleu	%icc,	%l2,	%o4
	fba,a	%fcc2,	loop_2721
	edge16n	%g4,	%i3,	%g6
	tsubcc	%o5,	0x0E0B,	%g3
	sra	%i5,	%l5,	%g1
loop_2721:
	nop
	set	0x20, %l2
	ldda	[%l7 + %l2] 0x14,	%l0
	srl	%o0,	%i4,	%o6
	subccc	%i7,	0x1B0C,	%l0
	subc	%g2,	0x0C28,	%l3
	call	loop_2722
	subcc	%g5,	%g7,	%l4
	srl	%o2,	%i2,	%i6
	mova	%icc,	%o7,	%i1
loop_2722:
	movneg	%icc,	%l6,	%i0
	bneg,a	%icc,	loop_2723
	fcmpgt32	%f20,	%f20,	%o1
	udiv	%o3,	0x0401,	%o4
	andncc	%g4,	%i3,	%l2
loop_2723:
	edge32ln	%o5,	%g3,	%g6
	sra	%l5,	0x0A,	%i5
	fmovsle	%xcc,	%f19,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l1,	0x3E5,	%g1
	umul	%o0,	%o6,	%i4
	and	%i7,	0x182E,	%g2
	orncc	%l0,	0x1218,	%g5
	xnor	%g7,	0x1866,	%l3
	movleu	%icc,	%o2,	%l4
	fornot2	%f6,	%f18,	%f8
	srlx	%i6,	%i2,	%o7
	set	0x18, %i0
	sta	%f31,	[%l7 + %i0] 0x14
	fmovrde	%i1,	%f28,	%f14
	set	0x1C, %g6
	ldsha	[%l7 + %g6] 0x15,	%l6
	set	0x5A, %l5
	ldsha	[%l7 + %l5] 0x88,	%i0
	fpadd32s	%f2,	%f15,	%f16
	nop
	set	0x24, %i5
	lduw	[%l7 + %i5],	%o3
	tcs	%xcc,	0x1
	edge16n	%o1,	%o4,	%i3
	edge8n	%g4,	%l2,	%o5
	be,pn	%icc,	loop_2724
	tgu	%xcc,	0x2
	fmul8x16	%f9,	%f0,	%f6
	taddcctv	%g3,	%g6,	%l5
loop_2724:
	tcc	%xcc,	0x2
	movle	%xcc,	%i5,	%l1
	membar	0x31
	tcc	%icc,	0x0
	fbo,a	%fcc3,	loop_2725
	ld	[%l7 + 0x10],	%f26
	fmovrdlez	%o0,	%f8,	%f14
	orcc	%o6,	%g1,	%i7
loop_2725:
	movcs	%icc,	%i4,	%l0
	fors	%f9,	%f29,	%f23
	te	%xcc,	0x0
	tvc	%xcc,	0x7
	brnz,a	%g5,	loop_2726
	fmovrdgz	%g2,	%f12,	%f14
	movrgz	%g7,	%l3,	%o2
	ldx	[%l7 + 0x38],	%l4
loop_2726:
	fmovdneg	%icc,	%f26,	%f3
	fabsd	%f30,	%f20
	movg	%xcc,	%i6,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%i1,	%l6
	tl	%xcc,	0x1
	sethi	0x1F2C,	%i2
	ble,pt	%icc,	loop_2727
	edge32	%o3,	%o1,	%o4
	ldstub	[%l7 + 0x47],	%i0
	orcc	%g4,	%l2,	%o5
loop_2727:
	te	%icc,	0x7
	movvc	%xcc,	%g3,	%i3
	edge32n	%g6,	%i5,	%l5
	tleu	%icc,	0x5
	fsrc1s	%f28,	%f18
	lduh	[%l7 + 0x44],	%o0
	tcs	%xcc,	0x0
	mulscc	%o6,	0x0D6C,	%g1
	fmul8x16	%f26,	%f4,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x7
	bcc,a	loop_2728
	fxnors	%f30,	%f28,	%f27
	fmovs	%f10,	%f29
	fble,a	%fcc2,	loop_2729
loop_2728:
	orncc	%i7,	%i4,	%l0
	nop
	set	0x60, %l0
	std	%f26,	[%l7 + %l0]
	fmovsvc	%icc,	%f28,	%f2
loop_2729:
	nop
	setx loop_2730, %l0, %l1
	jmpl %l1, %g5
	movgu	%icc,	%l1,	%g2
	set	0x14, %o3
	ldswa	[%l7 + %o3] 0x80,	%g7
loop_2730:
	nop
	set	0x20, %i7
	stwa	%o2,	[%l7 + %i7] 0x15
	tl	%xcc,	0x5
	fmovsge	%icc,	%f11,	%f31
	andn	%l3,	%i6,	%l4
	fcmpd	%fcc1,	%f14,	%f14
	srlx	%i1,	%l6,	%i2
	array16	%o7,	%o3,	%o4
	movcc	%xcc,	%i0,	%o1
	lduh	[%l7 + 0x78],	%l2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%g4
	sdivcc	%o5,	0x1DB0,	%g3
	fornot2s	%f24,	%f16,	%f12
	fbge	%fcc1,	loop_2731
	edge16ln	%i3,	%i5,	%l5
	membar	0x1B
	subcc	%o0,	0x1877,	%g6
loop_2731:
	fnot1	%f4,	%f0
	fblg	%fcc2,	loop_2732
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc1,	loop_2733
	fmovsg	%icc,	%f15,	%f2
loop_2732:
	movrlez	%o6,	%g1,	%i4
	call	loop_2734
loop_2733:
	movcc	%xcc,	%i7,	%l0
	movn	%xcc,	%g5,	%l1
	movn	%xcc,	%g2,	%o2
loop_2734:
	movl	%icc,	%g7,	%l3
	or	%l4,	0x1EDC,	%i6
	array16	%l6,	%i1,	%o7
	edge8ln	%o3,	%i2,	%o4
	movgu	%icc,	%i0,	%o1
	prefetch	[%l7 + 0x30],	 0x3
	tleu	%xcc,	0x7
	andncc	%l2,	%o5,	%g4
	movge	%icc,	%i3,	%g3
	set	0x44, %i6
	lduha	[%l7 + %i6] 0x11,	%l5
	fmul8x16al	%f16,	%f16,	%f16
	array32	%i5,	%o0,	%g6
	tcc	%icc,	0x5
	edge8l	%g1,	%i4,	%o6
	fcmped	%fcc2,	%f2,	%f10
	swap	[%l7 + 0x44],	%l0
	fblg	%fcc0,	loop_2735
	movneg	%icc,	%g5,	%l1
	fands	%f7,	%f29,	%f0
	xnorcc	%i7,	%g2,	%o2
loop_2735:
	fcmpgt32	%f16,	%f22,	%g7
	fornot2	%f4,	%f8,	%f26
	sra	%l4,	%i6,	%l3
	be,a,pn	%xcc,	loop_2736
	fbul	%fcc2,	loop_2737
	bvs	%icc,	loop_2738
	fmovsn	%xcc,	%f0,	%f29
loop_2736:
	call	loop_2739
loop_2737:
	sllx	%i1,	%l6,	%o3
loop_2738:
	fblg,a	%fcc1,	loop_2740
	fmuld8ulx16	%f8,	%f21,	%f0
loop_2739:
	mulx	%o7,	%i2,	%o4
	addccc	%i0,	%o1,	%o5
loop_2740:
	bcs,a	loop_2741
	fnor	%f14,	%f6,	%f16
	fbge	%fcc1,	loop_2742
	fpsub32s	%f9,	%f23,	%f15
loop_2741:
	fmovsvc	%xcc,	%f27,	%f30
	edge16ln	%l2,	%i3,	%g4
loop_2742:
	bleu,a,pn	%xcc,	loop_2743
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l5,	%i5,	%o0
	xnor	%g3,	%g6,	%i4
loop_2743:
	nop
	wr	%g0,	0x2b,	%asi
	stwa	%o6,	[%l7 + 0x0C] %asi
	membar	#Sync
	andncc	%g1,	%l0,	%g5
	array16	%l1,	%g2,	%i7
	or	%g7,	0x1A00,	%l4
	nop
	setx	loop_2744,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%xcc,	%o2,	%i6
	movcs	%xcc,	%l3,	%i1
	pdist	%f18,	%f14,	%f18
loop_2744:
	movg	%icc,	%o3,	%l6
	stb	%o7,	[%l7 + 0x40]
	and	%o4,	%i0,	%i2
	fmovdle	%xcc,	%f12,	%f28
	membar	0x54
	edge32	%o1,	%o5,	%i3
	popc	%l2,	%g4
	movge	%xcc,	%i5,	%o0
	tl	%icc,	0x3
	movvc	%xcc,	%g3,	%l5
	movrlz	%i4,	%o6,	%g6
	udivcc	%g1,	0x0A67,	%l0
	tgu	%icc,	0x3
	subc	%g5,	0x1C84,	%l1
	movre	%g2,	%i7,	%l4
	nop
	setx	loop_2745,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%o2,	0x104,	%i6
	bne,pn	%icc,	loop_2746
	fbuge,a	%fcc2,	loop_2747
loop_2745:
	and	%l3,	%i1,	%g7
	ble,a,pn	%icc,	loop_2748
loop_2746:
	movrgez	%o3,	0x0D2,	%o7
loop_2747:
	subcc	%o4,	0x1C23,	%i0
	movvs	%icc,	%l6,	%o1
loop_2748:
	stx	%i2,	[%l7 + 0x40]
	movrne	%o5,	%l2,	%g4
	tcs	%icc,	0x4
	sdivx	%i5,	0x03A3,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f18,	%f14,	%f28
	fbue	%fcc1,	loop_2749
	flush	%l7 + 0x64
	subccc	%g3,	0x05EE,	%l5
	addccc	%i4,	%o6,	%g6
loop_2749:
	umulcc	%o0,	0x19D6,	%g1
	fcmped	%fcc3,	%f4,	%f18
	sir	0x052A
	edge8n	%l0,	%g5,	%l1
	movvs	%icc,	%g2,	%i7
	set	0x40, %g2
	stwa	%l4,	[%l7 + %g2] 0x10
	fors	%f2,	%f29,	%f30
	movrlz	%o2,	0x338,	%i6
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i1
	sdivx	%g7,	0x0DC2,	%l3
	movcc	%xcc,	%o3,	%o7
	edge8l	%i0,	%o4,	%l6
	for	%f30,	%f26,	%f22
	addc	%o1,	%o5,	%i2
	addccc	%l2,	0x0562,	%i5
	fbuge,a	%fcc3,	loop_2750
	ble,a,pn	%xcc,	loop_2751
	brlz	%i3,	loop_2752
	flush	%l7 + 0x08
loop_2750:
	tvc	%xcc,	0x2
loop_2751:
	udivx	%g4,	0x104B,	%g3
loop_2752:
	fmul8sux16	%f2,	%f14,	%f20
	tneg	%icc,	0x6
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	umulcc	%l5,	%i4,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x12],	%o6
	stbar
	fbg,a	%fcc2,	loop_2753
	bg,pn	%icc,	loop_2754
	mulscc	%o0,	%g1,	%g5
	fmovscs	%icc,	%f25,	%f0
loop_2753:
	edge16ln	%l0,	%g2,	%l1
loop_2754:
	edge8ln	%i7,	%l4,	%o2
	std	%i0,	[%l7 + 0x38]
	mulx	%g7,	%l3,	%i6
	fmul8x16au	%f7,	%f22,	%f28
	sdivx	%o3,	0x0C3F,	%o7
	set	0x10, %g5
	stxa	%o4,	[%l7 + %g5] 0x10
	tneg	%icc,	0x5
	sethi	0x04E6,	%i0
	edge32ln	%l6,	%o1,	%o5
	tvs	%xcc,	0x4
	fpsub32	%f28,	%f2,	%f8
	xorcc	%i2,	0x1083,	%l2
	fpackfix	%f2,	%f2
	wr	%g0,	0xe2,	%asi
	stwa	%i3,	[%l7 + 0x44] %asi
	membar	#Sync
	ldub	[%l7 + 0x50],	%i5
	fbge,a	%fcc0,	loop_2755
	fbuge,a	%fcc1,	loop_2756
	fmovdneg	%icc,	%f19,	%f24
	fmovspos	%xcc,	%f9,	%f19
loop_2755:
	fcmpes	%fcc0,	%f11,	%f27
loop_2756:
	nop
	set	0x50, %l3
	prefetcha	[%l7 + %l3] 0x0c,	 0x0
	edge16n	%l5,	%i4,	%g3
	set	0x76, %l4
	lduha	[%l7 + %l4] 0x18,	%g6
	fsrc2	%f14,	%f14
	orn	%o0,	0x0052,	%o6
	fbe,a	%fcc3,	loop_2757
	bne,pt	%icc,	loop_2758
	fbne	%fcc1,	loop_2759
	xorcc	%g5,	0x1B8C,	%g1
loop_2757:
	fcmped	%fcc0,	%f24,	%f20
loop_2758:
	tl	%xcc,	0x5
loop_2759:
	umul	%g2,	%l1,	%l0
	fbge	%fcc1,	loop_2760
	fmul8ulx16	%f28,	%f20,	%f14
	srax	%l4,	%i7,	%i1
	movcs	%icc,	%g7,	%o2
loop_2760:
	fbge	%fcc3,	loop_2761
	array16	%l3,	%i6,	%o3
	fbge,a	%fcc0,	loop_2762
	tge	%xcc,	0x5
loop_2761:
	bg	loop_2763
	or	%o4,	0x0A14,	%i0
loop_2762:
	movle	%icc,	%o7,	%l6
	bvc,a	%icc,	loop_2764
loop_2763:
	edge32	%o5,	%i2,	%o1
	andn	%l2,	%i3,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2764:
	orcc	%l5,	0x1C7B,	%i4
	movge	%icc,	%i5,	%g3
	movvs	%xcc,	%g6,	%o6
	udiv	%g5,	0x1F20,	%o0
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g1
	xor	%g2,	0x00CC,	%l1
	ldd	[%l7 + 0x40],	%f0
	tneg	%icc,	0x7
	umulcc	%l0,	%i7,	%l4
	edge8l	%i1,	%o2,	%g7
	udivx	%i6,	0x16A9,	%o3
	fmovspos	%icc,	%f2,	%f7
	edge16l	%l3,	%i0,	%o7
	fbue	%fcc0,	loop_2765
	movn	%icc,	%o4,	%o5
	fcmpeq32	%f26,	%f16,	%l6
	srl	%i2,	%o1,	%i3
loop_2765:
	fmul8x16al	%f31,	%f23,	%f24
	addccc	%l2,	0x17B3,	%l5
	fmovrsne	%i4,	%f28,	%f6
	edge32ln	%g4,	%g3,	%i5
	fmovdn	%icc,	%f6,	%f28
	xnorcc	%g6,	%o6,	%o0
	fcmped	%fcc0,	%f26,	%f28
	orcc	%g1,	0x0344,	%g5
	tl	%xcc,	0x2
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x58] %asi,	%l1
	ba,a	%xcc,	loop_2766
	membar	0x38
	edge16	%l0,	%i7,	%g2
	std	%f4,	[%l7 + 0x40]
loop_2766:
	movrgez	%l4,	0x030,	%o2
	edge8ln	%i1,	%g7,	%i6
	fmovdge	%icc,	%f10,	%f3
	edge32n	%o3,	%l3,	%i0
	set	0x2C, %l6
	ldswa	[%l7 + %l6] 0x04,	%o4
	taddcc	%o7,	0x0FD9,	%l6
	xorcc	%o5,	%o1,	%i3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%l2,	%i2
	fmovrde	%l5,	%f4,	%f20
	sdivcc	%g4,	0x04DF,	%i4
	fmovrsgez	%g3,	%f19,	%f9
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x04
	fpmerge	%f7,	%f21,	%f2
	add	%i5,	0x12ED,	%o6
	smul	%g6,	%o0,	%g5
	umulcc	%l1,	0x10B8,	%l0
	ldsw	[%l7 + 0x10],	%g1
	fmovsvs	%xcc,	%f9,	%f30
	brnz	%i7,	loop_2767
	sdivx	%g2,	0x037D,	%l4
	array16	%o2,	%g7,	%i6
	movneg	%xcc,	%o3,	%i1
loop_2767:
	nop
	set	0x78, %o2
	stda	%i0,	[%l7 + %o2] 0x89
	fblg	%fcc0,	loop_2768
	fpsub16	%f0,	%f10,	%f14
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x6D] %asi,	%o4
loop_2768:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x60] %asi,	%l2
	sra	%l6,	0x0B,	%o7
	udivcc	%o1,	0x1AA2,	%o5
	movge	%xcc,	%l2,	%i2
	fmul8sux16	%f10,	%f24,	%f26
	mova	%xcc,	%i3,	%g4
	fxnors	%f27,	%f16,	%f7
	bvc	%xcc,	loop_2769
	edge8l	%i4,	%l5,	%g3
	fbuge,a	%fcc2,	loop_2770
	fmovrdgez	%i5,	%f18,	%f22
loop_2769:
	sub	%g6,	0x03BC,	%o6
	xorcc	%g5,	0x02E2,	%o0
loop_2770:
	tgu	%xcc,	0x3
	srlx	%l0,	0x1C,	%g1
	movre	%i7,	%g2,	%l1
	set	0x60, %i3
	ldda	[%l7 + %i3] 0x2f,	%o2
	umulcc	%l4,	0x1990,	%i6
	orn	%o3,	%g7,	%i0
	array16	%o4,	%l3,	%i1
	tne	%xcc,	0x0
	sllx	%l6,	0x0A,	%o1
	sllx	%o7,	%l2,	%o5
	tcc	%xcc,	0x6
	movgu	%xcc,	%i2,	%i3
	tvs	%icc,	0x7
	fxnors	%f9,	%f10,	%f24
	sdivx	%g4,	0x09D8,	%l5
	set	0x4C, %g4
	lduwa	[%l7 + %g4] 0x18,	%g3
	brlez,a	%i5,	loop_2771
	fmovsg	%xcc,	%f15,	%f25
	edge32	%g6,	%o6,	%i4
	movrlez	%o0,	0x0C5,	%l0
loop_2771:
	tleu	%xcc,	0x7
	tg	%icc,	0x5
	fandnot1	%f0,	%f30,	%f28
	edge8l	%g1,	%i7,	%g2
	edge32ln	%g5,	%o2,	%l1
	taddcc	%i6,	%o3,	%l4
	movrlz	%g7,	0x155,	%o4
	movrlez	%i0,	0x30E,	%i1
	fmovspos	%xcc,	%f14,	%f9
	tleu	%icc,	0x5
	edge32	%l3,	%l6,	%o1
	orncc	%l2,	%o7,	%o5
	movrlz	%i3,	%i2,	%l5
	nop
	setx loop_2772, %l0, %l1
	jmpl %l1, %g4
	sub	%g3,	%g6,	%o6
	movge	%icc,	%i5,	%i4
	fornot2	%f10,	%f2,	%f22
loop_2772:
	edge32ln	%o0,	%g1,	%l0
	set	0x08, %o6
	prefetcha	[%l7 + %o6] 0x0c,	 0x0
	fmovsvc	%icc,	%f17,	%f4
	stb	%i7,	[%l7 + 0x10]
	bl,a,pn	%icc,	loop_2773
	edge32l	%o2,	%g5,	%i6
	tl	%icc,	0x1
	and	%o3,	%l4,	%g7
loop_2773:
	nop
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o4
	fbu,a	%fcc0,	loop_2774
	fmovrde	%i0,	%f18,	%f12
	movrlz	%i1,	0x107,	%l1
	fmul8ulx16	%f28,	%f24,	%f20
loop_2774:
	orn	%l3,	%l6,	%l2
	andncc	%o7,	%o5,	%o1
	tleu	%xcc,	0x3
	sdivx	%i3,	0x1B5F,	%l5
	fpackfix	%f10,	%f14
	fmovsa	%icc,	%f4,	%f13
	smulcc	%i2,	%g3,	%g4
	orn	%o6,	%g6,	%i4
	fmovsg	%xcc,	%f1,	%f15
	array8	%i5,	%o0,	%g1
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	alignaddrl	%i7,	%o2,	%l0
	tcs	%xcc,	0x2
	sdivx	%i6,	0x0CB3,	%g5
	fbul	%fcc2,	loop_2775
	bneg,a,pn	%icc,	loop_2776
	fbge	%fcc0,	loop_2777
	taddcc	%o3,	0x1D80,	%g7
loop_2775:
	fmul8x16	%f16,	%f22,	%f10
loop_2776:
	srl	%l4,	0x1B,	%o4
loop_2777:
	mulx	%i0,	%i1,	%l3
	fble,a	%fcc2,	loop_2778
	sll	%l6,	0x0D,	%l2
	fbuge	%fcc0,	loop_2779
	fmovsl	%xcc,	%f4,	%f27
loop_2778:
	prefetch	[%l7 + 0x7C],	 0x1
	stbar
loop_2779:
	fcmpne16	%f10,	%f6,	%l1
	sllx	%o5,	0x00,	%o7
	orcc	%i3,	0x1AAB,	%o1
	movg	%icc,	%l5,	%g3
	ldsw	[%l7 + 0x30],	%i2
	fandnot2	%f6,	%f10,	%f28
	edge16n	%o6,	%g4,	%g6
	sub	%i4,	0x1604,	%o0
	sll	%g1,	0x05,	%i5
	movne	%xcc,	%g2,	%i7
	bl,a	loop_2780
	sll	%o2,	%i6,	%l0
	andcc	%g5,	0x0C63,	%o3
	srlx	%l4,	%o4,	%g7
loop_2780:
	fcmple32	%f30,	%f2,	%i1
	mulscc	%l3,	%i0,	%l2
	movcs	%icc,	%l6,	%l1
	fpackfix	%f24,	%f15
	ldstub	[%l7 + 0x1C],	%o5
	flush	%l7 + 0x14
	move	%icc,	%i3,	%o7
	bvc	loop_2781
	movge	%icc,	%l5,	%g3
	bn,a	%icc,	loop_2782
	andn	%o1,	%o6,	%i2
loop_2781:
	tleu	%icc,	0x6
	bgu	loop_2783
loop_2782:
	orcc	%g4,	%i4,	%o0
	tgu	%xcc,	0x2
	movrgz	%g6,	0x29E,	%i5
loop_2783:
	xnor	%g2,	0x1520,	%i7
	movge	%icc,	%o2,	%g1
	fcmped	%fcc0,	%f16,	%f2
	bge,a,pn	%icc,	loop_2784
	alignaddr	%l0,	%i6,	%o3
	fmovsvs	%xcc,	%f5,	%f17
	set	0x26, %l1
	ldsha	[%l7 + %l1] 0x04,	%g5
loop_2784:
	tvc	%icc,	0x1
	bl,pt	%xcc,	loop_2785
	nop
	setx	loop_2786,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subcc	%o4,	%l4,	%i1
	edge16l	%g7,	%l3,	%l2
loop_2785:
	edge8	%l6,	%l1,	%o5
loop_2786:
	edge16ln	%i3,	%o7,	%i0
	fmovse	%icc,	%f2,	%f2
	srl	%g3,	0x11,	%o1
	fmovscs	%xcc,	%f17,	%f24
	ble	loop_2787
	sethi	0x1ED6,	%l5
	udiv	%i2,	0x0AC4,	%o6
	ba	%xcc,	loop_2788
loop_2787:
	movleu	%xcc,	%g4,	%i4
	fpadd16s	%f26,	%f6,	%f26
	alignaddrl	%g6,	%o0,	%i5
loop_2788:
	fone	%f30
	andn	%g2,	0x1272,	%o2
	fmovdvs	%xcc,	%f11,	%f4
	movrgez	%i7,	%l0,	%g1
	tvs	%xcc,	0x0
	fcmpne16	%f16,	%f16,	%o3
	edge8n	%g5,	%i6,	%o4
	smul	%i1,	0x06FC,	%g7
	subcc	%l3,	%l2,	%l4
	tl	%icc,	0x0
	brlz	%l6,	loop_2789
	fornot2s	%f21,	%f29,	%f21
	srax	%l1,	0x17,	%o5
	brgz,a	%i3,	loop_2790
loop_2789:
	addcc	%i0,	%o7,	%o1
	stbar
	subc	%l5,	%i2,	%g3
loop_2790:
	movre	%o6,	%i4,	%g6
	fornot2s	%f3,	%f24,	%f2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
	movl	%xcc,	%o0,	%g2
	movn	%icc,	%i5,	%i7
	fpack32	%f10,	%f2,	%f24
	lduw	[%l7 + 0x6C],	%o2
	fmovsvs	%icc,	%f18,	%f12
	xnor	%l0,	%o3,	%g5
	movgu	%icc,	%i6,	%o4
	fandnot1	%f26,	%f4,	%f0
	fbule,a	%fcc2,	loop_2791
	fsrc2	%f18,	%f8
	movn	%icc,	%i1,	%g1
	fandnot1	%f18,	%f14,	%f30
loop_2791:
	te	%icc,	0x3
	fmovdneg	%xcc,	%f25,	%f28
	movl	%xcc,	%l3,	%g7
	edge16ln	%l4,	%l2,	%l6
	xnorcc	%o5,	0x1939,	%l1
	udivcc	%i0,	0x09E7,	%o7
	sethi	0x0986,	%i3
	fmovdle	%xcc,	%f13,	%f31
	tgu	%icc,	0x3
	sll	%o1,	0x00,	%l5
	sll	%i2,	%g3,	%o6
	addc	%i4,	0x1FE5,	%g4
	bcs	%xcc,	loop_2792
	brlz	%g6,	loop_2793
	movle	%icc,	%o0,	%i5
	edge8ln	%i7,	%g2,	%l0
loop_2792:
	andcc	%o3,	%g5,	%o2
loop_2793:
	addccc	%i6,	%o4,	%g1
	fble,a	%fcc2,	loop_2794
	fzeros	%f21
	sdiv	%l3,	0x132F,	%i1
	brgez,a	%l4,	loop_2795
loop_2794:
	ldd	[%l7 + 0x18],	%f6
	edge8	%l2,	%g7,	%l6
	tn	%icc,	0x7
loop_2795:
	fmovs	%f3,	%f19
	sra	%o5,	0x15,	%l1
	movcc	%xcc,	%o7,	%i0
	movrlez	%i3,	0x058,	%l5
	fexpand	%f2,	%f28
	movrgez	%o1,	0x3EA,	%i2
	stx	%o6,	[%l7 + 0x30]
	edge8	%g3,	%i4,	%g4
	siam	0x6
	udivx	%g6,	0x1DA9,	%i5
	movne	%xcc,	%i7,	%g2
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x4A] %asi,	%o0
	udivcc	%l0,	0x064F,	%o3
	orcc	%o2,	0x11A0,	%i6
	set	0x67, %i2
	ldstuba	[%l7 + %i2] 0x10,	%o4
	sdivx	%g1,	0x0DE5,	%g5
	sethi	0x17EC,	%i1
	xor	%l3,	%l4,	%l2
	tgu	%xcc,	0x6
	alignaddr	%g7,	%l6,	%l1
	fexpand	%f17,	%f28
	sdiv	%o7,	0x1F78,	%i0
	edge8ln	%i3,	%o5,	%o1
	tge	%icc,	0x5
	fcmpd	%fcc1,	%f0,	%f22
	or	%l5,	0x0ABC,	%o6
	tpos	%icc,	0x0
	edge32n	%g3,	%i2,	%i4
	nop
	setx	loop_2796,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmped	%fcc1,	%f24,	%f16
	fmovse	%icc,	%f26,	%f28
	ldstub	[%l7 + 0x35],	%g4
loop_2796:
	edge8l	%g6,	%i5,	%g2
	sir	0x091D
	sra	%o0,	0x1E,	%i7
	movcs	%icc,	%o3,	%o2
	movne	%xcc,	%i6,	%l0
	smulcc	%g1,	0x1821,	%o4
	fbn	%fcc3,	loop_2797
	xorcc	%i1,	0x01FE,	%l3
	movn	%xcc,	%l4,	%g5
	fbn	%fcc2,	loop_2798
loop_2797:
	array8	%l2,	%l6,	%g7
	sdiv	%o7,	0x00DD,	%l1
	fbe	%fcc3,	loop_2799
loop_2798:
	movleu	%xcc,	%i3,	%o5
	movrgz	%i0,	%l5,	%o6
	wr	%g0,	0x89,	%asi
	stba	%g3,	[%l7 + 0x6B] %asi
loop_2799:
	ldsw	[%l7 + 0x3C],	%o1
	be,pt	%icc,	loop_2800
	movvc	%xcc,	%i2,	%g4
	sub	%i4,	%g6,	%i5
	fornot1s	%f30,	%f16,	%f12
loop_2800:
	bcc,pt	%icc,	loop_2801
	alignaddr	%g2,	%o0,	%o3
	tn	%xcc,	0x7
	fmovdvs	%icc,	%f24,	%f9
loop_2801:
	te	%icc,	0x7
	addcc	%o2,	0x1B9A,	%i7
	fabsd	%f10,	%f0
	umul	%i6,	0x0B31,	%g1
	fbe,a	%fcc2,	loop_2802
	bneg	%xcc,	loop_2803
	stw	%o4,	[%l7 + 0x50]
	movpos	%icc,	%i1,	%l0
loop_2802:
	movcc	%xcc,	%l3,	%g5
loop_2803:
	taddcc	%l2,	%l6,	%g7
	fpsub16	%f28,	%f16,	%f20
	ldx	[%l7 + 0x70],	%o7
	xorcc	%l1,	%i3,	%o5
	std	%i0,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%f23
	fcmpeq32	%f0,	%f26,	%l4
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf0
	membar	#Sync
	alignaddrl	%o6,	%l5,	%o1
	xor	%i2,	%g3,	%i4
	andcc	%g6,	0x1C37,	%g4
	fandnot1	%f18,	%f20,	%f2
	movg	%xcc,	%i5,	%o0
	bleu,a	loop_2804
	movcs	%icc,	%o3,	%o2
	sdivx	%i7,	0x0870,	%i6
	umul	%g1,	%g2,	%i1
loop_2804:
	tne	%xcc,	0x7
	orn	%l0,	0x1C5B,	%l3
	movg	%icc,	%g5,	%l2
	bvc,a	loop_2805
	fbg,a	%fcc1,	loop_2806
	fandnot1	%f2,	%f22,	%f0
	tcs	%icc,	0x6
loop_2805:
	movpos	%xcc,	%l6,	%g7
loop_2806:
	fmovrde	%o4,	%f10,	%f22
	sir	0x05AB
	brlez,a	%o7,	loop_2807
	flush	%l7 + 0x2C
	sllx	%l1,	%o5,	%i0
	udiv	%i3,	0x189C,	%o6
loop_2807:
	st	%f22,	[%l7 + 0x08]
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x5C] %asi,	%l5
	tsubcctv	%l4,	%o1,	%g3
	fnand	%f14,	%f2,	%f8
	sir	0x1E16
	fsrc2	%f20,	%f4
	tcc	%xcc,	0x6
	fmovdge	%xcc,	%f9,	%f15
	umul	%i2,	%g6,	%i4
	fbul,a	%fcc3,	loop_2808
	bcs,pn	%icc,	loop_2809
	andcc	%g4,	0x009F,	%o0
	fornot1s	%f30,	%f17,	%f19
loop_2808:
	fbule,a	%fcc1,	loop_2810
loop_2809:
	fmovdgu	%xcc,	%f5,	%f12
	fcmpgt16	%f12,	%f0,	%i5
	fbge	%fcc3,	loop_2811
loop_2810:
	tneg	%xcc,	0x4
	fmovsvc	%icc,	%f29,	%f9
	smul	%o2,	%i7,	%o3
loop_2811:
	fpack32	%f0,	%f28,	%f6
	tle	%icc,	0x0
	movvc	%icc,	%i6,	%g2
	fba,a	%fcc2,	loop_2812
	fbul	%fcc0,	loop_2813
	and	%g1,	0x19EB,	%l0
	udivx	%l3,	0x1937,	%g5
loop_2812:
	array16	%l2,	%l6,	%i1
loop_2813:
	tn	%icc,	0x3
	brlz,a	%o4,	loop_2814
	fmovsleu	%xcc,	%f30,	%f13
	srlx	%o7,	0x17,	%g7
	brz,a	%l1,	loop_2815
loop_2814:
	popc	0x07CA,	%i0
	sllx	%i3,	0x14,	%o5
	fbu,a	%fcc0,	loop_2816
loop_2815:
	fmovrslz	%l5,	%f2,	%f25
	fbu,a	%fcc2,	loop_2817
	bge	%icc,	loop_2818
loop_2816:
	nop
	set	0x7B, %o4
	ldstub	[%l7 + %o4],	%l4
	fmovdleu	%xcc,	%f10,	%f28
loop_2817:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x13] %asi,	%o6
loop_2818:
	bge,a,pn	%xcc,	loop_2819
	addcc	%g3,	%o1,	%g6
	array16	%i2,	%g4,	%o0
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x25] %asi,	%i4
loop_2819:
	ld	[%l7 + 0x54],	%f0
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x18] %asi,	%i5
	sir	0x06E5
	udiv	%o2,	0x034F,	%o3
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	subc	%g2,	0x1C08,	%i6
	movpos	%xcc,	%g1,	%l3
	ldstub	[%l7 + 0x7C],	%l0
	fone	%f6
	ta	%xcc,	0x1
	stx	%l2,	[%l7 + 0x40]
	and	%l6,	%g5,	%i1
	orn	%o4,	0x0388,	%g7
	mova	%icc,	%o7,	%i0
	movcs	%xcc,	%i3,	%l1
	fnand	%f14,	%f28,	%f28
	fpadd32s	%f14,	%f18,	%f8
	sub	%o5,	%l5,	%l4
	xorcc	%g3,	0x165B,	%o1
	umul	%o6,	0x1325,	%g6
	srlx	%g4,	0x13,	%i2
	fpsub32s	%f7,	%f0,	%f3
	fmovdneg	%xcc,	%f0,	%f19
	array16	%o0,	%i4,	%i5
	fcmpes	%fcc3,	%f11,	%f6
	orcc	%o3,	%i7,	%o2
	fmovdg	%xcc,	%f10,	%f5
	popc	%g2,	%i6
	tpos	%icc,	0x1
	fmovda	%xcc,	%f13,	%f9
	sir	0x1F10
	xnor	%g1,	%l3,	%l2
	tge	%icc,	0x3
	fmovsneg	%icc,	%f20,	%f9
	edge32n	%l0,	%l6,	%i1
	sdivcc	%g5,	0x15B7,	%o4
	fcmpne32	%f0,	%f2,	%o7
	ta	%icc,	0x5
	add	%i0,	%i3,	%l1
	fcmpgt32	%f12,	%f8,	%o5
	edge8n	%g7,	%l5,	%l4
	movre	%o1,	%g3,	%o6
	array8	%g4,	%g6,	%i2
	movle	%xcc,	%o0,	%i5
	movge	%icc,	%o3,	%i7
	fnegs	%f12,	%f26
	ldsw	[%l7 + 0x64],	%o2
	fsrc1s	%f16,	%f31
	fandnot2s	%f6,	%f6,	%f20
	lduh	[%l7 + 0x78],	%g2
	movneg	%icc,	%i6,	%g1
	fmovdcc	%xcc,	%f23,	%f8
	fandnot2	%f28,	%f30,	%f4
	tcc	%icc,	0x3
	edge8ln	%i4,	%l2,	%l3
	xnorcc	%l6,	%i1,	%g5
	movrlez	%o4,	0x05C,	%l0
	fmovda	%icc,	%f0,	%f16
	movle	%icc,	%i0,	%i3
	sub	%l1,	%o5,	%o7
	tcs	%icc,	0x0
	ba,a,pn	%icc,	loop_2820
	sllx	%g7,	%l5,	%l4
	bvs,a,pt	%icc,	loop_2821
	sethi	0x124E,	%g3
loop_2820:
	array8	%o6,	%g4,	%g6
	taddcc	%o1,	%o0,	%i5
loop_2821:
	xnorcc	%i2,	%i7,	%o2
	fabss	%f13,	%f28
	andcc	%g2,	%o3,	%i6
	tle	%icc,	0x6
	movne	%xcc,	%g1,	%l2
	addccc	%i4,	%l6,	%l3
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x10] %asi,	%g4
	fnand	%f6,	%f30,	%f8
	edge16n	%o4,	%l0,	%i0
	orncc	%i3,	0x0B78,	%l1
	edge8ln	%i1,	%o5,	%o7
	fmovsleu	%xcc,	%f25,	%f18
	edge8	%l5,	%l4,	%g7
	orcc	%o6,	0x04F1,	%g4
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x74] %asi,	%f27
	ldsw	[%l7 + 0x74],	%g3
	sllx	%g6,	%o1,	%i5
	fxors	%f23,	%f14,	%f9
	fbul	%fcc0,	loop_2822
	nop
	setx	loop_2823,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%o0,	%i2,	%i7
	orcc	%o2,	0x04A3,	%o3
loop_2822:
	nop
	set	0x18, %i1
	stha	%g2,	[%l7 + %i1] 0xe3
	membar	#Sync
loop_2823:
	movleu	%icc,	%g1,	%i6
	ldsw	[%l7 + 0x2C],	%l2
	movgu	%xcc,	%l6,	%l3
	st	%f18,	[%l7 + 0x44]
	set	0x28, %g7
	stda	%g4,	[%l7 + %g7] 0x0c
	bne,pt	%xcc,	loop_2824
	edge32ln	%i4,	%o4,	%l0
	xnorcc	%i0,	%l1,	%i1
	fmovdcs	%icc,	%f24,	%f31
loop_2824:
	fmul8x16al	%f22,	%f13,	%f28
	fmovdcs	%icc,	%f30,	%f14
	fabss	%f17,	%f17
	taddcc	%o5,	0x0B6F,	%o7
	sir	0x127B
	ldub	[%l7 + 0x37],	%i3
	brlz,a	%l4,	loop_2825
	movgu	%icc,	%l5,	%g7
	edge32	%g4,	%g3,	%g6
	movvs	%xcc,	%o6,	%o1
loop_2825:
	fmovrdlez	%o0,	%f24,	%f26
	st	%f3,	[%l7 + 0x40]
	array32	%i5,	%i7,	%i2
	fcmpne16	%f22,	%f16,	%o3
	movneg	%icc,	%o2,	%g2
	movcc	%xcc,	%i6,	%l2
	bvc,a,pn	%xcc,	loop_2826
	edge32l	%l6,	%l3,	%g5
	fmovsa	%icc,	%f21,	%f22
	tg	%icc,	0x1
loop_2826:
	edge16l	%g1,	%o4,	%l0
	array32	%i4,	%i0,	%i1
	sth	%o5,	[%l7 + 0x50]
	set	0x74, %o1
	sta	%f25,	[%l7 + %o1] 0x18
	fmovde	%xcc,	%f5,	%f17
	ldd	[%l7 + 0x50],	%l0
	smulcc	%o7,	0x05B4,	%l4
	fpack16	%f8,	%f18
	fmovsa	%icc,	%f20,	%f9
	edge8l	%i3,	%g7,	%l5
	fxor	%f16,	%f0,	%f14
	orcc	%g3,	%g6,	%o6
	fmovsvc	%xcc,	%f12,	%f14
	movne	%xcc,	%g4,	%o0
	bgu	%xcc,	loop_2827
	st	%f1,	[%l7 + 0x64]
	tsubcc	%o1,	%i7,	%i2
	edge8ln	%o3,	%o2,	%i5
loop_2827:
	add	%g2,	%l2,	%l6
	ldsw	[%l7 + 0x10],	%i6
	fblg,a	%fcc1,	loop_2828
	tge	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f4,	%f25
loop_2828:
	fmovsvs	%icc,	%f13,	%f5
	movvc	%icc,	%g5,	%g1
	movl	%xcc,	%o4,	%l3
	and	%i4,	0x1EC8,	%i0
	fbug	%fcc2,	loop_2829
	fpsub32	%f16,	%f18,	%f18
	sra	%i1,	0x03,	%l0
	bn	%xcc,	loop_2830
loop_2829:
	nop
	set	0x7A, %o0
	lduh	[%l7 + %o0],	%l1
	lduw	[%l7 + 0x58],	%o5
	fnot1s	%f27,	%f1
loop_2830:
	ldsh	[%l7 + 0x4A],	%o7
	ba,a,pt	%icc,	loop_2831
	stb	%i3,	[%l7 + 0x62]
	fmovrse	%l4,	%f10,	%f29
	fors	%f9,	%f30,	%f13
loop_2831:
	srlx	%g7,	0x00,	%l5
	ldstub	[%l7 + 0x1D],	%g3
	std	%g6,	[%l7 + 0x58]
	tcs	%xcc,	0x1
	fcmpne32	%f30,	%f28,	%g4
	movrgz	%o6,	0x25C,	%o1
	fand	%f30,	%f16,	%f0
	stb	%i7,	[%l7 + 0x77]
	fcmpeq32	%f28,	%f28,	%o0
	fcmpd	%fcc3,	%f4,	%f4
	array32	%i2,	%o3,	%i5
	lduw	[%l7 + 0x1C],	%g2
	tsubcctv	%o2,	%l6,	%i6
	sdivcc	%g5,	0x053B,	%l2
	movge	%icc,	%o4,	%l3
	set	0x3F, %o7
	ldsba	[%l7 + %o7] 0x89,	%g1
	movvc	%xcc,	%i4,	%i0
	fxor	%f22,	%f24,	%f12
	nop
	set	0x18, %g3
	ldsw	[%l7 + %g3],	%i1
	movpos	%icc,	%l0,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l1,	0x19,	%i3
	movg	%icc,	%l4,	%o7
	fmovrslz	%l5,	%f1,	%f1
	andn	%g3,	%g7,	%g4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x70] %asi,	%o6
	edge8n	%o1,	%g6,	%i7
	set	0x60, %l2
	sta	%f17,	[%l7 + %l2] 0x0c
	movre	%i2,	%o0,	%i5
	andcc	%o3,	%o2,	%g2
	edge16n	%i6,	%g5,	%l2
	fbu	%fcc0,	loop_2832
	fxor	%f10,	%f4,	%f0
	ld	[%l7 + 0x44],	%f21
	fmul8sux16	%f4,	%f14,	%f4
loop_2832:
	ldstub	[%l7 + 0x71],	%o4
	array16	%l6,	%g1,	%l3
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x19
	sll	%i0,	%i1,	%i4
	set	0x64, %g6
	lduwa	[%l7 + %g6] 0x04,	%l0
	movre	%o5,	%i3,	%l4
	edge8l	%o7,	%l5,	%g3
	edge32	%l1,	%g4,	%g7
	fba	%fcc0,	loop_2833
	siam	0x2
	movpos	%icc,	%o1,	%g6
	tpos	%icc,	0x6
loop_2833:
	fabss	%f7,	%f13
	addccc	%i7,	%o6,	%o0
	te	%xcc,	0x1
	fmovrsgz	%i2,	%f25,	%f27
	tsubcc	%i5,	0x0D8D,	%o2
	fnands	%f28,	%f21,	%f20
	array16	%o3,	%g2,	%g5
	movrgz	%l2,	%o4,	%l6
	alignaddrl	%i6,	%l3,	%g1
	bcs,pn	%xcc,	loop_2834
	fsrc1s	%f30,	%f3
	set	0x34, %l5
	lduha	[%l7 + %l5] 0x14,	%i0
loop_2834:
	fmovsvc	%icc,	%f25,	%f26
	brgez	%i1,	loop_2835
	fmul8sux16	%f12,	%f4,	%f24
	bcs	%icc,	loop_2836
	tne	%xcc,	0x6
loop_2835:
	swap	[%l7 + 0x34],	%i4
	fmovsn	%xcc,	%f13,	%f27
loop_2836:
	fmul8sux16	%f2,	%f16,	%f18
	tpos	%icc,	0x4
	fmovrdgez	%o5,	%f18,	%f10
	udivcc	%i3,	0x0750,	%l0
	udivcc	%l4,	0x00EA,	%l5
	and	%o7,	0x1108,	%g3
	bvs,a,pn	%icc,	loop_2837
	andcc	%g4,	%g7,	%l1
	set	0x10, %o5
	stda	%o0,	[%l7 + %o5] 0x0c
loop_2837:
	edge16ln	%i7,	%o6,	%g6
	bg,a,pt	%xcc,	loop_2838
	fpsub16s	%f9,	%f15,	%f7
	fpmerge	%f14,	%f0,	%f26
	fandnot2s	%f30,	%f19,	%f11
loop_2838:
	bshuffle	%f26,	%f16,	%f14
	fbue,a	%fcc1,	loop_2839
	array32	%o0,	%i2,	%i5
	tn	%icc,	0x0
	subccc	%o3,	%o2,	%g5
loop_2839:
	orn	%g2,	%o4,	%l6
	alignaddr	%l2,	%l3,	%i6
	ldd	[%l7 + 0x18],	%f30
	set	0x10, %i5
	ldda	[%l7 + %i5] 0x0c,	%i0
	bleu,pn	%xcc,	loop_2840
	sir	0x0036
	fnegs	%f31,	%f29
	udivx	%i1,	0x0819,	%i4
loop_2840:
	orn	%o5,	0x097D,	%i3
	tleu	%icc,	0x7
	bne,pt	%xcc,	loop_2841
	fbue	%fcc2,	loop_2842
	fmovdgu	%xcc,	%f28,	%f12
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x33] %asi,	%g1
loop_2841:
	movrlz	%l0,	%l5,	%l4
loop_2842:
	tleu	%icc,	0x3
	faligndata	%f26,	%f24,	%f14
	smul	%g3,	0x0001,	%g4
	fbul	%fcc0,	loop_2843
	fmovdn	%icc,	%f19,	%f21
	andn	%o7,	%l1,	%o1
	movrlez	%g7,	%o6,	%g6
loop_2843:
	nop
	set	0x54, %l0
	lda	[%l7 + %l0] 0x19,	%f28
	sra	%i7,	%o0,	%i5
	nop
	setx	loop_2844,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tgu	%xcc,	0x6
	mova	%icc,	%i2,	%o2
	fmovdne	%xcc,	%f14,	%f13
loop_2844:
	srlx	%g5,	0x08,	%o3
	srax	%g2,	%l6,	%l2
	tle	%icc,	0x0
	fmovsge	%xcc,	%f22,	%f13
	tge	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l3,	%o4,	%i6
	fands	%f10,	%f7,	%f28
	tcc	%icc,	0x4
	or	%i0,	%i4,	%i1
	xor	%o5,	%i3,	%l0
	bvs	loop_2845
	edge32n	%g1,	%l5,	%g3
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x67] %asi,	%l4
loop_2845:
	nop
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x60] %asi,	%o6
	fands	%f12,	%f31,	%f9
	bcs,pn	%xcc,	loop_2846
	ldsb	[%l7 + 0x7A],	%g4
	fmovrslz	%o1,	%f1,	%f27
	movle	%icc,	%l1,	%g7
loop_2846:
	srlx	%o6,	%i7,	%o0
	fpsub32	%f16,	%f6,	%f20
	movcs	%icc,	%i5,	%g6
	fmovsvc	%icc,	%f9,	%f11
	faligndata	%f12,	%f16,	%f24
	bneg,pt	%icc,	loop_2847
	umul	%i2,	%g5,	%o3
	xorcc	%g2,	%o2,	%l6
	mova	%xcc,	%l2,	%l3
loop_2847:
	fpsub32	%f26,	%f0,	%f12
	fmovdgu	%icc,	%f6,	%f5
	stw	%i6,	[%l7 + 0x34]
	fcmpeq32	%f16,	%f6,	%o4
	subcc	%i0,	%i4,	%o5
	fnot1	%f24,	%f4
	edge32	%i3,	%i1,	%l0
	fbo	%fcc1,	loop_2848
	fbe	%fcc2,	loop_2849
	ldstub	[%l7 + 0x4D],	%l5
	fbo,a	%fcc0,	loop_2850
loop_2848:
	fmovsleu	%icc,	%f13,	%f6
loop_2849:
	addc	%g3,	0x02CB,	%l4
	alignaddrl	%g1,	%o7,	%o1
loop_2850:
	std	%l0,	[%l7 + 0x30]
	fbu,a	%fcc2,	loop_2851
	ta	%xcc,	0x4
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x50] %asi,	%g4
loop_2851:
	for	%f16,	%f0,	%f24
	mulscc	%o6,	%i7,	%g7
	wr	%g0,	0x19,	%asi
	stda	%o0,	[%l7 + 0x58] %asi
	tle	%icc,	0x2
	fpack16	%f14,	%f10
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x16] %asi,	%i5
	fandnot2	%f6,	%f0,	%f22
	fpadd32s	%f7,	%f16,	%f24
	fmovrdgez	%g6,	%f2,	%f0
	fbuge,a	%fcc0,	loop_2852
	smulcc	%g5,	0x10E1,	%o3
	fpsub16	%f2,	%f28,	%f30
	and	%g2,	0x1DC2,	%o2
loop_2852:
	fpadd32s	%f10,	%f0,	%f7
	udivcc	%i2,	0x1150,	%l2
	edge8ln	%l3,	%i6,	%l6
	fbge	%fcc3,	loop_2853
	fmovda	%xcc,	%f22,	%f23
	movrne	%i0,	0x0DE,	%o4
	ble,pn	%icc,	loop_2854
loop_2853:
	or	%o5,	0x1EAB,	%i3
	fblg	%fcc2,	loop_2855
	fnot1	%f28,	%f30
loop_2854:
	tsubcc	%i4,	%l0,	%l5
	array16	%i1,	%l4,	%g1
loop_2855:
	subc	%g3,	%o7,	%o1
	srlx	%l1,	%g4,	%i7
	tneg	%xcc,	0x3
	fcmpes	%fcc0,	%f3,	%f7
	mulscc	%g7,	0x0BD6,	%o0
	edge16ln	%o6,	%g6,	%i5
	fmovdl	%xcc,	%f13,	%f0
	fmovrslez	%o3,	%f7,	%f21
	tsubcctv	%g2,	%o2,	%g5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x2D] %asi,	%l2
	fnegs	%f16,	%f13
	tvc	%xcc,	0x6
	alignaddr	%l3,	%i2,	%l6
	edge8	%i0,	%i6,	%o4
	tleu	%icc,	0x2
	sdivcc	%i3,	0x1E45,	%i4
	fxors	%f11,	%f1,	%f0
	taddcctv	%l0,	0x0769,	%o5
	fmovdneg	%icc,	%f23,	%f2
	fmovsne	%icc,	%f7,	%f22
	tg	%icc,	0x7
	set	0x68, %i7
	prefetcha	[%l7 + %i7] 0x11,	 0x1
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x14] %asi,	%i1
	te	%xcc,	0x4
	edge16l	%g1,	%g3,	%o7
	fcmpne32	%f4,	%f12,	%l4
	bpos,pt	%icc,	loop_2856
	be,pn	%xcc,	loop_2857
	fmuld8sux16	%f16,	%f28,	%f0
	mulscc	%o1,	%l1,	%i7
loop_2856:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%g4,	%o0
loop_2857:
	fmovrdlez	%g7,	%f2,	%f8
	fpsub32	%f20,	%f12,	%f26
	fnot2s	%f5,	%f19
	fbne,a	%fcc1,	loop_2858
	fbne,a	%fcc3,	loop_2859
	brlz	%g6,	loop_2860
	tsubcctv	%o6,	%i5,	%o3
loop_2858:
	andncc	%g2,	%g5,	%l2
loop_2859:
	tneg	%icc,	0x1
loop_2860:
	xnorcc	%l3,	%i2,	%l6
	sll	%i0,	0x03,	%i6
	movrgz	%o4,	0x320,	%o2
	orncc	%i3,	%i4,	%o5
	bgu,a,pn	%icc,	loop_2861
	edge16ln	%l5,	%l0,	%g1
	fpsub32s	%f26,	%f23,	%f17
	tcs	%icc,	0x5
loop_2861:
	movrgez	%g3,	0x1B7,	%i1
	fmovdneg	%icc,	%f12,	%f17
	be	%icc,	loop_2862
	edge16	%o7,	%o1,	%l4
	ldd	[%l7 + 0x60],	%f10
	nop
	setx	loop_2863,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2862:
	tgu	%icc,	0x7
	fxor	%f4,	%f18,	%f2
	edge8l	%l1,	%g4,	%i7
loop_2863:
	fbl	%fcc3,	loop_2864
	tsubcctv	%o0,	%g7,	%o6
	andcc	%g6,	0x013F,	%o3
	nop
	setx	loop_2865,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2864:
	subc	%g2,	%g5,	%l2
	mulscc	%l3,	%i5,	%l6
	udivx	%i2,	0x11FE,	%i6
loop_2865:
	srlx	%o4,	%o2,	%i3
	fpsub32s	%f12,	%f2,	%f24
	bcc,pn	%icc,	loop_2866
	fmovdne	%icc,	%f0,	%f5
	fors	%f30,	%f16,	%f19
	ta	%xcc,	0x7
loop_2866:
	nop
	setx	loop_2867,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movl	%icc,	%i4,	%o5
	fmovscs	%xcc,	%f1,	%f4
	ldsh	[%l7 + 0x5A],	%l5
loop_2867:
	fmovse	%xcc,	%f23,	%f2
	sdivcc	%i0,	0x0C43,	%l0
	movge	%xcc,	%g1,	%g3
	movcc	%icc,	%i1,	%o1
	tneg	%icc,	0x4
	fmovde	%xcc,	%f9,	%f1
	umulcc	%l4,	%o7,	%l1
	mulx	%i7,	0x1DFA,	%g4
	addccc	%g7,	0x1E60,	%o6
	mulscc	%o0,	0x1955,	%o3
	fcmpgt32	%f12,	%f16,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge	loop_2868
	fba	%fcc3,	loop_2869
	taddcc	%g6,	0x0702,	%l2
	srlx	%g5,	0x00,	%l3
loop_2868:
	udiv	%i5,	0x1BEF,	%l6
loop_2869:
	fmovdpos	%xcc,	%f24,	%f10
	fnot1	%f12,	%f2
	array32	%i2,	%o4,	%o2
	brz,a	%i3,	loop_2870
	bcs	%xcc,	loop_2871
	fmovd	%f0,	%f16
	prefetch	[%l7 + 0x20],	 0x0
loop_2870:
	st	%f3,	[%l7 + 0x44]
loop_2871:
	tneg	%xcc,	0x2
	tcc	%icc,	0x4
	andncc	%i4,	%i6,	%l5
	bl,a	%icc,	loop_2872
	edge16ln	%i0,	%l0,	%g1
	brgez,a	%g3,	loop_2873
	addcc	%o5,	0x0785,	%o1
loop_2872:
	fmovsleu	%xcc,	%f0,	%f16
	wr	%g0,	0x2f,	%asi
	stxa	%i1,	[%l7 + 0x30] %asi
	membar	#Sync
loop_2873:
	addccc	%l4,	%l1,	%o7
	brlez	%i7,	loop_2874
	movn	%xcc,	%g7,	%g4
	srl	%o6,	0x0A,	%o0
	tcc	%xcc,	0x4
loop_2874:
	fmuld8sux16	%f21,	%f24,	%f8
	fmovrde	%o3,	%f8,	%f14
	fabsd	%f2,	%f10
	udivcc	%g2,	0x16F4,	%g6
	edge32	%g5,	%l2,	%l3
	movl	%icc,	%i5,	%l6
	fpsub16	%f26,	%f6,	%f28
	movge	%icc,	%o4,	%o2
	stx	%i3,	[%l7 + 0x70]
	ba	loop_2875
	array32	%i4,	%i2,	%l5
	fblg	%fcc2,	loop_2876
	fmovdcs	%icc,	%f31,	%f22
loop_2875:
	fbge	%fcc3,	loop_2877
	membar	0x28
loop_2876:
	bpos,pt	%icc,	loop_2878
	fbge,a	%fcc2,	loop_2879
loop_2877:
	tcc	%xcc,	0x2
	fbe	%fcc1,	loop_2880
loop_2878:
	smulcc	%i0,	0x19F1,	%i6
loop_2879:
	bneg,pt	%icc,	loop_2881
	edge8n	%l0,	%g3,	%g1
loop_2880:
	add	%o1,	0x1D92,	%i1
	nop
	set	0x7C, %i6
	lduw	[%l7 + %i6],	%l4
loop_2881:
	bneg	loop_2882
	fnands	%f15,	%f18,	%f18
	nop
	set	0x56, %o3
	lduh	[%l7 + %o3],	%o5
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
loop_2882:
	fmovde	%xcc,	%f21,	%f18
	array16	%o7,	%g7,	%i7
	nop
	setx	loop_2883,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8ln	%g4,	%o6,	%o0
	movcc	%icc,	%g2,	%o3
	srax	%g6,	0x16,	%g5
loop_2883:
	fones	%f10
	smulcc	%l3,	0x0F6B,	%l2
	bge,pn	%icc,	loop_2884
	nop
	set	0x78, %g2
	std	%f0,	[%l7 + %g2]
	brgz,a	%l6,	loop_2885
	flush	%l7 + 0x38
loop_2884:
	fmovrsgez	%i5,	%f7,	%f12
	tne	%xcc,	0x7
loop_2885:
	fmovde	%icc,	%f21,	%f10
	fbl	%fcc2,	loop_2886
	edge8ln	%o2,	%i3,	%i4
	mulx	%o4,	%l5,	%i2
	subcc	%i6,	%i0,	%l0
loop_2886:
	xor	%g1,	0x1306,	%g3
	subc	%i1,	%o1,	%o5
	fmovrde	%l1,	%f0,	%f26
	swap	[%l7 + 0x70],	%o7
	movn	%icc,	%g7,	%l4
	fmovdn	%icc,	%f5,	%f15
	tvc	%xcc,	0x6
	tsubcc	%i7,	0x0C7C,	%o6
	tsubcctv	%o0,	%g4,	%o3
	movcc	%icc,	%g6,	%g2
	fnand	%f0,	%f4,	%f28
	smul	%l3,	%g5,	%l6
	fxor	%f18,	%f8,	%f0
	sllx	%l2,	0x1F,	%i5
	fmovsg	%icc,	%f26,	%f21
	andcc	%i3,	0x0C57,	%i4
	addccc	%o4,	%l5,	%i2
	fbl,a	%fcc1,	loop_2887
	popc	0x12F8,	%o2
	array32	%i6,	%i0,	%g1
	movne	%xcc,	%g3,	%i1
loop_2887:
	edge16ln	%l0,	%o1,	%o5
	fmul8sux16	%f20,	%f20,	%f20
	udivcc	%l1,	0x1A99,	%o7
	edge8	%g7,	%i7,	%l4
	fnegd	%f10,	%f28
	tneg	%icc,	0x4
	tge	%xcc,	0x1
	edge8ln	%o0,	%o6,	%o3
	xnorcc	%g6,	%g2,	%l3
	stx	%g5,	[%l7 + 0x70]
	subcc	%g4,	%l2,	%i5
	udivcc	%i3,	0x1D19,	%l6
	subc	%i4,	%l5,	%o4
	fmovsn	%icc,	%f2,	%f14
	fmovrdlez	%o2,	%f6,	%f16
	fcmpeq32	%f12,	%f28,	%i2
	taddcc	%i0,	%g1,	%g3
	movrgez	%i6,	%i1,	%l0
	andcc	%o1,	%o5,	%l1
	orcc	%g7,	0x1AD9,	%o7
	fbul,a	%fcc3,	loop_2888
	fmul8x16al	%f10,	%f6,	%f30
	tsubcctv	%l4,	0x15BC,	%o0
	nop
	setx loop_2889, %l0, %l1
	jmpl %l1, %o6
loop_2888:
	smul	%i7,	%o3,	%g2
	fbule,a	%fcc1,	loop_2890
	move	%xcc,	%l3,	%g5
loop_2889:
	tle	%xcc,	0x4
	fmovdcs	%xcc,	%f20,	%f20
loop_2890:
	addcc	%g6,	0x0361,	%l2
	flush	%l7 + 0x6C
	xnor	%g4,	%i5,	%i3
	movleu	%xcc,	%l6,	%i4
	movneg	%xcc,	%l5,	%o2
	fnors	%f6,	%f23,	%f24
	add	%i2,	%o4,	%g1
	mulx	%g3,	0x1B1D,	%i6
	fmovsgu	%xcc,	%f2,	%f30
	fbue,a	%fcc1,	loop_2891
	fbul,a	%fcc2,	loop_2892
	brlz,a	%i0,	loop_2893
	subccc	%l0,	%i1,	%o5
loop_2891:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2892:
	andncc	%o1,	%l1,	%o7
loop_2893:
	fcmple32	%f28,	%f6,	%l4
	set	0x58, %g5
	stxa	%o0,	[%l7 + %g5] 0x18
	fxor	%f4,	%f10,	%f6
	edge32ln	%g7,	%i7,	%o3
	ba,a	%xcc,	loop_2894
	movcs	%xcc,	%g2,	%o6
	xnorcc	%g5,	%l3,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2894:
	addccc	%g6,	0x0308,	%g4
	tpos	%icc,	0x5
	array8	%i3,	%l6,	%i4
	bvs	%icc,	loop_2895
	stbar
	umul	%i5,	0x19A3,	%o2
	srax	%i2,	%l5,	%g1
loop_2895:
	edge32n	%g3,	%i6,	%i0
	andcc	%l0,	%o4,	%o5
	set	0x58, %l3
	sta	%f5,	[%l7 + %l3] 0x10
	fmovdvs	%icc,	%f24,	%f0
	fornot1	%f28,	%f24,	%f30
	mulx	%i1,	0x0C3F,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l1,	%o7,	%o0
	tle	%icc,	0x2
	edge32n	%l4,	%g7,	%o3
	fbug,a	%fcc2,	loop_2896
	fzeros	%f13
	movg	%icc,	%i7,	%o6
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2896:
	fbe,a	%fcc1,	loop_2897
	edge32l	%g5,	%l3,	%l2
	movcc	%xcc,	%g6,	%g2
	bl,a,pn	%xcc,	loop_2898
loop_2897:
	fmovsn	%xcc,	%f21,	%f11
	fble,a	%fcc1,	loop_2899
	array16	%g4,	%i3,	%l6
loop_2898:
	swap	[%l7 + 0x54],	%i5
	fmovdleu	%xcc,	%f4,	%f8
loop_2899:
	nop
	set	0x6C, %l4
	lduwa	[%l7 + %l4] 0x14,	%o2
	movvs	%xcc,	%i2,	%l5
	brlz,a	%i4,	loop_2900
	movn	%xcc,	%g3,	%i6
	tleu	%xcc,	0x3
	ldd	[%l7 + 0x60],	%f16
loop_2900:
	movpos	%icc,	%i0,	%g1
	movrne	%l0,	0x39F,	%o4
	fbul,a	%fcc0,	loop_2901
	and	%i1,	%o1,	%l1
	fpsub16s	%f5,	%f18,	%f28
	fmovrdgez	%o5,	%f22,	%f0
loop_2901:
	tn	%icc,	0x4
	array8	%o0,	%o7,	%l4
	array32	%o3,	%i7,	%g7
	fmovdneg	%icc,	%f31,	%f29
	fble,a	%fcc1,	loop_2902
	xorcc	%o6,	%g5,	%l2
	fnegd	%f8,	%f24
	tleu	%xcc,	0x0
loop_2902:
	sub	%g6,	%g2,	%l3
	array32	%g4,	%i3,	%l6
	movvs	%icc,	%i5,	%i2
	popc	0x0834,	%l5
	fbg,a	%fcc0,	loop_2903
	edge32ln	%i4,	%o2,	%g3
	srl	%i6,	0x1A,	%i0
	subc	%g1,	%o4,	%i1
loop_2903:
	mulscc	%l0,	%o1,	%l1
	fbl,a	%fcc0,	loop_2904
	tsubcc	%o5,	0x00E8,	%o7
	andncc	%l4,	%o3,	%i7
	bneg,pn	%icc,	loop_2905
loop_2904:
	sll	%g7,	%o0,	%o6
	fandnot2	%f0,	%f28,	%f18
	fandnot2	%f0,	%f10,	%f20
loop_2905:
	srlx	%g5,	%g6,	%l2
	edge32n	%l3,	%g4,	%g2
	movcc	%xcc,	%l6,	%i3
	movvc	%xcc,	%i5,	%i2
	bge,a	%icc,	loop_2906
	ldub	[%l7 + 0x25],	%l5
	fbug,a	%fcc3,	loop_2907
	edge8ln	%i4,	%g3,	%o2
loop_2906:
	bshuffle	%f24,	%f18,	%f24
	st	%f11,	[%l7 + 0x0C]
loop_2907:
	tl	%icc,	0x4
	fmovsge	%icc,	%f8,	%f6
	bvc,pn	%icc,	loop_2908
	fcmpeq16	%f22,	%f14,	%i6
	fmovdleu	%icc,	%f24,	%f29
	ldub	[%l7 + 0x62],	%g1
loop_2908:
	xnor	%o4,	%i1,	%l0
	fmovsg	%icc,	%f29,	%f11
	array16	%o1,	%i0,	%o5
	set	0x68, %i4
	stda	%l0,	[%l7 + %i4] 0x19
	fmovrdne	%o7,	%f18,	%f20
	bleu,a	loop_2909
	fabsd	%f26,	%f28
	edge16n	%o3,	%i7,	%g7
	brnz,a	%o0,	loop_2910
loop_2909:
	mova	%xcc,	%o6,	%l4
	tgu	%icc,	0x6
	fbule	%fcc0,	loop_2911
loop_2910:
	addccc	%g5,	%l2,	%l3
	sir	0x1F4C
	fmovsneg	%icc,	%f30,	%f27
loop_2911:
	udivcc	%g4,	0x195D,	%g2
	sub	%l6,	%i3,	%i5
	fpsub32s	%f23,	%f18,	%f22
	fexpand	%f7,	%f0
	ble,a,pt	%icc,	loop_2912
	tvs	%icc,	0x1
	ld	[%l7 + 0x20],	%f30
	fnand	%f20,	%f24,	%f10
loop_2912:
	addc	%g6,	%i2,	%i4
	movle	%icc,	%l5,	%o2
	fcmpeq16	%f30,	%f16,	%i6
	tn	%xcc,	0x5
	sdivx	%g1,	0x0294,	%g3
	fbu,a	%fcc1,	loop_2913
	ta	%xcc,	0x3
	andcc	%i1,	%o4,	%l0
	edge32n	%i0,	%o5,	%o1
loop_2913:
	nop
	set	0x54, %l6
	swapa	[%l7 + %l6] 0x89,	%l1
	wr	%g0,	0x04,	%asi
	stda	%o2,	[%l7 + 0x08] %asi
	bge,pt	%icc,	loop_2914
	brnz	%i7,	loop_2915
	lduw	[%l7 + 0x18],	%o7
	fmul8sux16	%f30,	%f6,	%f4
loop_2914:
	ldsb	[%l7 + 0x0D],	%g7
loop_2915:
	mova	%icc,	%o0,	%o6
	xorcc	%g5,	0x0C9C,	%l2
	umul	%l4,	0x1D4B,	%g4
	movge	%icc,	%l3,	%l6
	movg	%xcc,	%g2,	%i3
	mova	%xcc,	%i5,	%i2
	wr	%g0,	0x10,	%asi
	stwa	%i4,	[%l7 + 0x78] %asi
	fpsub16s	%f18,	%f10,	%f7
	udiv	%l5,	0x0231,	%o2
	sll	%g6,	0x1D,	%i6
	fmovdgu	%icc,	%f20,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g1,	%i1,	%g3
	prefetch	[%l7 + 0x7C],	 0x2
	fmovdcs	%xcc,	%f29,	%f24
	edge16	%o4,	%l0,	%o5
	fmovdne	%xcc,	%f15,	%f7
	array16	%i0,	%l1,	%o3
	array32	%o1,	%i7,	%g7
	fmovs	%f26,	%f5
	orncc	%o0,	%o7,	%g5
	edge8n	%o6,	%l2,	%g4
	movvc	%icc,	%l4,	%l3
	ldx	[%l7 + 0x18],	%g2
	edge16	%l6,	%i5,	%i2
	fbo,a	%fcc1,	loop_2916
	tl	%xcc,	0x1
	movg	%icc,	%i4,	%i3
	ld	[%l7 + 0x38],	%f13
loop_2916:
	addccc	%l5,	%o2,	%i6
	sdivx	%g6,	0x1BE7,	%g1
	udiv	%i1,	0x1A6C,	%o4
	brz	%g3,	loop_2917
	brnz	%l0,	loop_2918
	nop
	setx loop_2919, %l0, %l1
	jmpl %l1, %o5
	fnands	%f31,	%f3,	%f26
loop_2917:
	fmovsvc	%xcc,	%f24,	%f19
loop_2918:
	udiv	%l1,	0x0FD4,	%o3
loop_2919:
	fpadd16s	%f7,	%f10,	%f15
	sdivx	%o1,	0x18E0,	%i0
	sra	%i7,	%g7,	%o7
	fbo,a	%fcc3,	loop_2920
	movg	%icc,	%g5,	%o0
	fbge	%fcc1,	loop_2921
	movvs	%icc,	%l2,	%g4
loop_2920:
	tpos	%icc,	0x5
	membar	0x79
loop_2921:
	andn	%o6,	0x1964,	%l4
	taddcctv	%g2,	%l6,	%i5
	fbul	%fcc2,	loop_2922
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,a	loop_2923
	be,a,pn	%xcc,	loop_2924
loop_2922:
	movl	%xcc,	%i2,	%l3
	tn	%icc,	0x7
loop_2923:
	andn	%i3,	%l5,	%i4
loop_2924:
	fmovdvs	%xcc,	%f30,	%f7
	brnz	%i6,	loop_2925
	brnz,a	%g6,	loop_2926
	tvc	%icc,	0x7
	fbl	%fcc0,	loop_2927
loop_2925:
	fand	%f10,	%f2,	%f10
loop_2926:
	movvs	%icc,	%g1,	%i1
	fnegd	%f16,	%f4
loop_2927:
	fzero	%f26
	mova	%icc,	%o2,	%g3
	movrlz	%l0,	%o4,	%o5
	fpack32	%f30,	%f12,	%f10
	tgu	%icc,	0x4
	addccc	%o3,	%o1,	%l1
	fnand	%f20,	%f16,	%f8
	fba	%fcc3,	loop_2928
	ldsw	[%l7 + 0x20],	%i7
	fbg,a	%fcc1,	loop_2929
	fmovrdlez	%i0,	%f0,	%f8
loop_2928:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%o7
loop_2929:
	taddcctv	%g7,	0x098D,	%o0
	movleu	%xcc,	%g5,	%l2
	tleu	%xcc,	0x5
	sllx	%g4,	%l4,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l6,	%g2
	udiv	%i2,	0x17F8,	%i5
	set	0x6E, %i3
	stha	%i3,	[%l7 + %i3] 0x22
	membar	#Sync
	brnz,a	%l5,	loop_2930
	movrgez	%i4,	0x1B1,	%l3
	mulscc	%g6,	%i6,	%g1
	andn	%o2,	%g3,	%l0
loop_2930:
	movne	%icc,	%i1,	%o4
	edge16ln	%o5,	%o3,	%l1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x60] %asi,	%o1
	ble	%icc,	loop_2931
	movcs	%xcc,	%i0,	%i7
	set	0x18, %o2
	sta	%f28,	[%l7 + %o2] 0x89
loop_2931:
	fmovdle	%xcc,	%f28,	%f11
	st	%f26,	[%l7 + 0x78]
	sll	%g7,	0x01,	%o7
	xnor	%o0,	%g5,	%l2
	tsubcc	%l4,	%g4,	%o6
	srax	%g2,	0x18,	%l6
	set	0x3E, %g4
	stha	%i5,	[%l7 + %g4] 0x04
	fmovdvc	%xcc,	%f18,	%f14
	umul	%i3,	0x01AC,	%i2
	stx	%l5,	[%l7 + 0x08]
	andcc	%i4,	%l3,	%i6
	fmul8x16	%f29,	%f18,	%f24
	smul	%g1,	%o2,	%g6
	tge	%icc,	0x2
	fzeros	%f3
	edge8l	%g3,	%l0,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	addccc	%o5,	0x13EC,	%o3
	array16	%l1,	%i0,	%i7
	umulcc	%o1,	0x1932,	%o7
	fcmpne32	%f14,	%f2,	%o0
	wr	%g0,	0x10,	%asi
	stda	%g6,	[%l7 + 0x18] %asi
	edge32l	%l2,	%l4,	%g5
	movn	%xcc,	%g4,	%g2
	fble	%fcc3,	loop_2932
	movleu	%xcc,	%l6,	%i5
	udivx	%i3,	0x0284,	%i2
	set	0x4C, %l1
	swapa	[%l7 + %l1] 0x10,	%l5
loop_2932:
	movle	%xcc,	%i4,	%l3
	edge32l	%i6,	%g1,	%o2
	or	%o6,	0x0E66,	%g3
	fmovda	%xcc,	%f25,	%f31
	brnz,a	%g6,	loop_2933
	movge	%icc,	%o4,	%i1
	tleu	%icc,	0x5
	fcmpeq32	%f14,	%f4,	%o5
loop_2933:
	movneg	%icc,	%o3,	%l1
	movrgez	%l0,	0x1FC,	%i0
	ble,pt	%xcc,	loop_2934
	fmovrsgez	%o1,	%f10,	%f21
	ldstub	[%l7 + 0x34],	%o7
	fmovrdne	%o0,	%f0,	%f6
loop_2934:
	edge32l	%g7,	%l2,	%l4
	tn	%icc,	0x4
	sdiv	%i7,	0x12F3,	%g5
	fmovdpos	%icc,	%f18,	%f8
	flush	%l7 + 0x4C
	fsrc2	%f16,	%f12
	set	0x33, %i2
	ldsba	[%l7 + %i2] 0x80,	%g2
	subc	%l6,	%g4,	%i3
	st	%f28,	[%l7 + 0x78]
	bleu	loop_2935
	fcmps	%fcc1,	%f2,	%f16
	xor	%i2,	0x1833,	%i5
	addccc	%i4,	0x1D72,	%l5
loop_2935:
	edge16ln	%i6,	%l3,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x6
	tvc	%xcc,	0x2
	udivcc	%o2,	0x0373,	%o6
	subcc	%g6,	0x163E,	%g3
	fcmpgt16	%f14,	%f22,	%o4
	movneg	%icc,	%i1,	%o5
	edge8n	%l1,	%o3,	%i0
	movne	%icc,	%o1,	%o7
	srax	%o0,	0x08,	%g7
	udivcc	%l0,	0x012A,	%l2
	edge16ln	%i7,	%l4,	%g5
	fmovsgu	%icc,	%f21,	%f22
	movg	%xcc,	%g2,	%g4
	fmovdgu	%xcc,	%f27,	%f13
	orncc	%l6,	%i3,	%i2
	tsubcctv	%i4,	0x12A8,	%i5
	edge16	%i6,	%l5,	%l3
	movl	%xcc,	%g1,	%o2
	fmovsa	%icc,	%f12,	%f24
	udivx	%o6,	0x12F3,	%g6
	tge	%xcc,	0x7
	edge16	%g3,	%i1,	%o4
	alignaddrl	%l1,	%o3,	%o5
	bcs	%xcc,	loop_2936
	bshuffle	%f16,	%f12,	%f16
	sll	%o1,	0x06,	%o7
	movrlz	%i0,	%g7,	%o0
loop_2936:
	fornot2s	%f19,	%f5,	%f10
	te	%xcc,	0x1
	srax	%l0,	%i7,	%l4
	udivcc	%l2,	0x1D40,	%g5
	wr	%g0,	0x80,	%asi
	sta	%f10,	[%l7 + 0x58] %asi
	fmul8sux16	%f0,	%f22,	%f2
	smul	%g4,	%g2,	%l6
	tcc	%icc,	0x4
	mova	%icc,	%i3,	%i4
	fbug	%fcc2,	loop_2937
	edge8l	%i5,	%i6,	%i2
	fmovdg	%icc,	%f7,	%f8
	fbu	%fcc1,	loop_2938
loop_2937:
	mulscc	%l3,	0x185E,	%l5
	ldd	[%l7 + 0x10],	%g0
	tne	%icc,	0x0
loop_2938:
	fmovdvc	%icc,	%f28,	%f9
	edge8n	%o6,	%g6,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2772
!	Type cti   	: 2938
!	Type x   	: 1287
!	Type f   	: 4642
!	Type i   	: 13361
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xE4A63891
.word 0x3843141B
.word 0x15E71EBE
.word 0x21EF841E
.word 0x96C2CD0B
.word 0x8C5D2616
.word 0x25A6D02A
.word 0x97BB9796
.word 0x2E6B959F
.word 0x5E3D5E7C
.word 0x7C26327A
.word 0xFBA656ED
.word 0x71E4887D
.word 0x14580AB6
.word 0x11E64A60
.word 0x7DD04C8B
.word 0x5FFC8B7E
.word 0x84E872A5
.word 0xDDAB4FC9
.word 0x39B6D4C3
.word 0xF30FF1C9
.word 0xD2AE3A11
.word 0xFCC31B1C
.word 0xA17C8EC4
.word 0x58BA7D3B
.word 0x2AF17814
.word 0x9BF5C730
.word 0x7A893143
.word 0xE1C2EFB0
.word 0x46B79F01
.word 0x0105F8FA
.word 0xA879F95A
.word 0x742F99BC
.word 0x15412A76
.word 0x42C03E48
.word 0x8965E17B
.word 0x1449D108
.word 0x5CF9997F
.word 0x6DADE850
.word 0x56D88BEA
.word 0xAFC4DBD0
.word 0xBF601A7B
.word 0x4D0C7C8E
.word 0x84D5278B
.word 0xCE43E243
.word 0xB5A5ABF0
.word 0x44B59D21
.word 0x3A9A3693
.word 0x02A7D459
.word 0x5B7C9B11
.word 0x76885F99
.word 0xE39D0E32
.word 0xDEA41799
.word 0x3DC015D4
.word 0x60792C3C
.word 0x38EFFDF1
.word 0xF4D42271
.word 0xA7EFF40D
.word 0xAC24202D
.word 0x9F8B826C
.word 0xEA850AC1
.word 0xD76C7934
.word 0xB1B6B65C
.word 0x05F6C744
.end
