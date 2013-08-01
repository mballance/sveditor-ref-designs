/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f11.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f11.s,v 1.1 2007/05/11 17:22:36 drp Exp $"
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
	setx	0xD3D8D8F6005FF8E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x9,	%g1
	set	0x3,	%g2
	set	0xE,	%g3
	set	0xF,	%g4
	set	0x4,	%g5
	set	0xE,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x6,	%i1
	set	-0x8,	%i2
	set	-0xA,	%i3
	set	-0x8,	%i4
	set	-0xE,	%i5
	set	-0x3,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x4C0EFFAE,	%l0
	set	0x16F40009,	%l1
	set	0x7B4D05CF,	%l2
	set	0x5A9C646E,	%l3
	set	0x22C88BED,	%l4
	set	0x70BBA242,	%l5
	set	0x492F0908,	%l6
	!# Output registers
	set	0x1117,	%o0
	set	-0x155E,	%o1
	set	-0x1F1B,	%o2
	set	-0x074B,	%o3
	set	0x188D,	%o4
	set	0x06E9,	%o5
	set	0x1B6A,	%o6
	set	-0x1F8F,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x549548065F7D1A64)
	INIT_TH_FP_REG(%l7,%f2,0x63447651901BACE0)
	INIT_TH_FP_REG(%l7,%f4,0x6A2749CD368D6387)
	INIT_TH_FP_REG(%l7,%f6,0x1AFFAED8172E37AA)
	INIT_TH_FP_REG(%l7,%f8,0x29E73E06ACC6BEF8)
	INIT_TH_FP_REG(%l7,%f10,0xEA0B4B066C97BB17)
	INIT_TH_FP_REG(%l7,%f12,0xD5CCC1A09B279BBA)
	INIT_TH_FP_REG(%l7,%f14,0xF4AFC4CC7BA401B6)
	INIT_TH_FP_REG(%l7,%f16,0x1CB1F9C5C47E9E77)
	INIT_TH_FP_REG(%l7,%f18,0x1302B4170765D4C1)
	INIT_TH_FP_REG(%l7,%f20,0xD35483F38F25AC1C)
	INIT_TH_FP_REG(%l7,%f22,0xBF007DA81A2DC153)
	INIT_TH_FP_REG(%l7,%f24,0x4955F8430204148E)
	INIT_TH_FP_REG(%l7,%f26,0x12AC2F0D009518D5)
	INIT_TH_FP_REG(%l7,%f28,0x517CDBF69472D093)
	INIT_TH_FP_REG(%l7,%f30,0x4F0ACFDFC0C0CC7E)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBD2, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	movcc	%xcc,	%l0,	%l6
	fmovde	%icc,	%f18,	%f13
	movneg	%icc,	%i6,	%g2
	addcc	%o4,	%i1,	%g6
	nop
	set	0x70, %g2
	ldx	[%l7 + %g2],	%l2
	xor	%i7,	%o1,	%g1
	save %g3, 0x05FE, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l1,	%i4,	%o7
	std	%f26,	[%l7 + 0x20]
	sdiv	%l4,	0x0D34,	%o5
	ldub	[%l7 + 0x71],	%g4
	fnands	%f11,	%f18,	%f28
	movl	%xcc,	%i3,	%o3
	sra	%o2,	%i2,	%o0
	xor	%o6,	%g7,	%l3
	array16	%i5,	%i0,	%g5
	ld	[%l7 + 0x20],	%f4
	fnot2	%f18,	%f28
	fmovscs	%xcc,	%f7,	%f6
	fxnors	%f6,	%f7,	%f4
	subccc	%l6,	%l0,	%i6
	andn	%g2,	0x0C92,	%i1
	sethi	0x1069,	%g6
	udiv	%l2,	0x0B0A,	%o4
	fandnot1s	%f11,	%f10,	%f25
	edge16ln	%o1,	%g1,	%i7
	movvc	%xcc,	%g3,	%l1
	xnorcc	%i4,	%l5,	%o7
	pdist	%f10,	%f0,	%f14
	edge8	%l4,	%o5,	%i3
	sllx	%o3,	0x00,	%g4
	fmovsl	%icc,	%f8,	%f16
	or	%o2,	0x0AD3,	%o0
	fpadd16s	%f13,	%f31,	%f30
	sdiv	%o6,	0x01A2,	%g7
	fexpand	%f19,	%f22
	mova	%xcc,	%i2,	%l3
	edge32l	%i0,	%i5,	%g5
	fmovdcc	%icc,	%f3,	%f30
	orn	%l0,	%i6,	%g2
	edge32ln	%l6,	%i1,	%l2
	movle	%xcc,	%g6,	%o4
	udivx	%g1,	0x164D,	%o1
	xnor	%g3,	%i7,	%i4
	fmovsne	%xcc,	%f4,	%f17
	sir	0x1CA0
	fabsd	%f2,	%f8
	fmovrdgez	%l1,	%f6,	%f16
	fnot1	%f16,	%f2
	movgu	%xcc,	%l5,	%l4
	fands	%f20,	%f11,	%f16
	edge8n	%o5,	%i3,	%o7
	xor	%o3,	0x1B12,	%g4
	xnor	%o2,	%o0,	%g7
	ldsh	[%l7 + 0x38],	%o6
	and	%l3,	%i2,	%i0
	smul	%i5,	0x1835,	%g5
	xor	%l0,	0x06E4,	%g2
	subcc	%l6,	%i6,	%i1
	ldub	[%l7 + 0x5A],	%g6
	srax	%o4,	%l2,	%o1
	fand	%f22,	%f14,	%f24
	movrgz	%g1,	0x130,	%i7
	udivx	%i4,	0x179B,	%l1
	movg	%icc,	%g3,	%l4
	subcc	%l5,	0x1000,	%i3
	xnorcc	%o7,	%o5,	%g4
	movcs	%xcc,	%o3,	%o0
	addcc	%g7,	%o2,	%l3
	movvc	%icc,	%i2,	%o6
	orn	%i0,	%i5,	%g5
	sub	%l0,	0x05FA,	%l6
	smulcc	%g2,	0x1B45,	%i1
	umul	%i6,	%g6,	%l2
	nop
	set	0x45, %l6
	ldub	[%l7 + %l6],	%o1
	orn	%g1,	0x0C1A,	%i7
	movcc	%icc,	%o4,	%l1
	alignaddr	%i4,	%g3,	%l4
	subc	%i3,	%o7,	%o5
	edge16n	%l5,	%g4,	%o0
	ldsh	[%l7 + 0x1C],	%g7
	andcc	%o2,	%o3,	%l3
	ldd	[%l7 + 0x60],	%o6
	restore %i2, %i0, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x68, %o0
	ldsw	[%l7 + %o0],	%l0
	edge16ln	%l6,	%g2,	%i1
	array16	%i5,	%g6,	%i6
	udivx	%o1,	0x046D,	%g1
	mulscc	%l2,	0x1B87,	%o4
	mulscc	%l1,	%i7,	%i4
	ldub	[%l7 + 0x0B],	%g3
	fnor	%f24,	%f26,	%f18
	fpsub32	%f0,	%f12,	%f6
	ld	[%l7 + 0x70],	%f4
	sll	%i3,	0x03,	%l4
	sth	%o5,	[%l7 + 0x0C]
	fcmpd	%fcc1,	%f30,	%f14
	ldsb	[%l7 + 0x3D],	%o7
	lduw	[%l7 + 0x7C],	%g4
	edge32ln	%l5,	%g7,	%o0
	fandnot2	%f20,	%f30,	%f14
	movge	%xcc,	%o3,	%l3
	ldd	[%l7 + 0x20],	%o6
	fmovsvc	%icc,	%f5,	%f29
	fcmple16	%f0,	%f20,	%i2
	stx	%o2,	[%l7 + 0x20]
	edge16l	%g5,	%i0,	%l6
	array16	%g2,	%i1,	%l0
	movn	%xcc,	%g6,	%i5
	fpadd32	%f28,	%f22,	%f20
	umulcc	%o1,	0x04B5,	%g1
	edge32ln	%l2,	%i6,	%l1
	smulcc	%o4,	%i4,	%i7
	stx	%i3,	[%l7 + 0x28]
	move	%xcc,	%l4,	%g3
	st	%f17,	[%l7 + 0x3C]
	save %o5, %g4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%l5,	%f29,	%f1
	srlx	%o0,	0x01,	%o3
	movgu	%icc,	%g7,	%l3
	edge32ln	%i2,	%o2,	%g5
	fmovscc	%icc,	%f10,	%f9
	movvs	%xcc,	%i0,	%o6
	fmovdneg	%xcc,	%f5,	%f25
	movrgz	%l6,	0x039,	%g2
	fmovspos	%icc,	%f20,	%f14
	movre	%l0,	%i1,	%i5
	edge32	%g6,	%o1,	%l2
	edge8l	%g1,	%l1,	%i6
	ldd	[%l7 + 0x60],	%o4
	ldx	[%l7 + 0x40],	%i4
	fmovsgu	%xcc,	%f29,	%f5
	fmovrsgez	%i3,	%f24,	%f21
	movl	%xcc,	%l4,	%i7
	orncc	%g3,	0x181A,	%g4
	ldub	[%l7 + 0x55],	%o7
	movneg	%xcc,	%l5,	%o5
	st	%f17,	[%l7 + 0x48]
	movleu	%icc,	%o3,	%g7
	edge8l	%l3,	%o0,	%i2
	movgu	%icc,	%g5,	%o2
	edge16	%o6,	%i0,	%g2
	nop
	set	0x3E, %o3
	sth	%l6,	[%l7 + %o3]
	fmovdn	%icc,	%f8,	%f22
	sll	%l0,	0x0B,	%i1
	stw	%g6,	[%l7 + 0x48]
	movpos	%xcc,	%o1,	%i5
	addcc	%l2,	0x12FA,	%l1
	ldsb	[%l7 + 0x59],	%i6
	fmuld8sux16	%f28,	%f21,	%f12
	movge	%icc,	%o4,	%g1
	edge8l	%i4,	%i3,	%i7
	srl	%l4,	%g3,	%g4
	alignaddr	%l5,	%o7,	%o3
	andn	%o5,	%g7,	%l3
	movrlez	%o0,	0x071,	%g5
	mulx	%o2,	%i2,	%o6
	ldsh	[%l7 + 0x54],	%g2
	ldsb	[%l7 + 0x4B],	%i0
	addccc	%l0,	0x1BDB,	%i1
	movvc	%xcc,	%g6,	%l6
	fpadd16s	%f27,	%f3,	%f1
	andcc	%o1,	%i5,	%l2
	andncc	%i6,	%l1,	%o4
	array8	%i4,	%g1,	%i3
	edge8	%l4,	%g3,	%g4
	nop
	set	0x26, %l5
	sth	%i7,	[%l7 + %l5]
	ldd	[%l7 + 0x20],	%o6
	ldub	[%l7 + 0x49],	%l5
	movvc	%icc,	%o5,	%o3
	xnorcc	%g7,	%o0,	%l3
	xor	%g5,	0x0643,	%o2
	fcmpgt16	%f16,	%f30,	%o6
	edge16n	%i2,	%i0,	%g2
	movg	%xcc,	%l0,	%g6
	lduh	[%l7 + 0x36],	%i1
	fnegd	%f30,	%f20
	fmovsne	%icc,	%f4,	%f3
	fpackfix	%f24,	%f22
	fabss	%f31,	%f2
	movne	%icc,	%l6,	%o1
	andn	%l2,	%i6,	%l1
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	movrlz	%i4,	%i3,	%g1
	udivcc	%g3,	0x087B,	%g4
	ldsh	[%l7 + 0x0C],	%i7
	fandnot2	%f8,	%f20,	%f30
	fmovrdlz	%l4,	%f24,	%f22
	subcc	%l5,	0x0F55,	%o7
	ldub	[%l7 + 0x47],	%o3
	popc	0x1847,	%o5
	pdist	%f4,	%f20,	%f22
	movcs	%icc,	%g7,	%l3
	array32	%g5,	%o0,	%o2
	fmul8sux16	%f12,	%f4,	%f28
	pdist	%f0,	%f10,	%f30
	xorcc	%i2,	%i0,	%g2
	subc	%o6,	0x14F8,	%g6
	fnegs	%f27,	%f25
	umulcc	%i1,	0x12AE,	%l6
	srlx	%o1,	0x1A,	%l2
	edge8n	%l0,	%l1,	%i6
	stx	%o4,	[%l7 + 0x50]
	umul	%i5,	%i4,	%g1
	movge	%xcc,	%i3,	%g3
	orncc	%g4,	%i7,	%l4
	movvs	%icc,	%o7,	%l5
	edge32l	%o3,	%o5,	%g7
	smulcc	%l3,	0x03F9,	%o0
	or	%g5,	0x1A85,	%o2
	sdivx	%i0,	0x1812,	%g2
	movne	%icc,	%o6,	%i2
	ld	[%l7 + 0x30],	%f10
	fzeros	%f24
	lduh	[%l7 + 0x48],	%i1
	ldsh	[%l7 + 0x62],	%l6
	mulscc	%g6,	%o1,	%l0
	or	%l1,	0x0381,	%l2
	and	%o4,	%i6,	%i4
	lduw	[%l7 + 0x48],	%i5
	fmovdneg	%xcc,	%f5,	%f6
	movneg	%xcc,	%g1,	%i3
	umulcc	%g4,	%i7,	%g3
	movl	%icc,	%l4,	%o7
	stb	%o3,	[%l7 + 0x67]
	movleu	%icc,	%o5,	%l5
	array8	%g7,	%o0,	%l3
	fmovda	%icc,	%f5,	%f11
	stw	%o2,	[%l7 + 0x28]
	addc	%i0,	%g5,	%g2
	movneg	%xcc,	%o6,	%i1
	xnorcc	%i2,	0x1944,	%g6
	smulcc	%l6,	%l0,	%l1
	edge32ln	%l2,	%o1,	%o4
	ldd	[%l7 + 0x20],	%i6
	orcc	%i5,	%i4,	%g1
	umulcc	%i3,	%i7,	%g3
	andcc	%l4,	0x04C0,	%o7
	movpos	%xcc,	%o3,	%g4
	udiv	%l5,	0x0B22,	%g7
	movre	%o5,	0x3BD,	%o0
	fmovrdgez	%o2,	%f20,	%f26
	fmul8sux16	%f6,	%f18,	%f26
	edge16l	%l3,	%g5,	%i0
	bshuffle	%f14,	%f24,	%f12
	fmovsn	%xcc,	%f29,	%f10
	fmovsvc	%icc,	%f13,	%f7
	xnorcc	%o6,	0x0D0B,	%i1
	edge8n	%i2,	%g6,	%l6
	lduw	[%l7 + 0x20],	%l0
	fsrc1s	%f17,	%f22
	subcc	%g2,	%l2,	%l1
	andncc	%o1,	%o4,	%i5
	edge32l	%i4,	%g1,	%i3
	addc	%i7,	%i6,	%l4
	orcc	%g3,	%o7,	%g4
	edge32ln	%l5,	%g7,	%o5
	ldd	[%l7 + 0x70],	%o2
	movvs	%xcc,	%o2,	%l3
	save %o0, %g5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f9,	%f25
	edge8n	%o6,	%i1,	%g6
	array8	%l6,	%l0,	%i2
	sth	%g2,	[%l7 + 0x50]
	sir	0x0456
	edge32l	%l1,	%o1,	%l2
	fcmple32	%f14,	%f2,	%i5
	movvs	%xcc,	%o4,	%g1
	array32	%i3,	%i7,	%i6
	movle	%icc,	%i4,	%g3
	movle	%xcc,	%o7,	%g4
	xor	%l4,	%l5,	%g7
	pdist	%f2,	%f24,	%f10
	addccc	%o5,	0x0F40,	%o3
	movrgz	%l3,	%o2,	%g5
	movn	%xcc,	%i0,	%o6
	fandnot1	%f2,	%f18,	%f22
	sra	%i1,	%g6,	%o0
	sll	%l0,	0x15,	%i2
	sra	%g2,	0x0E,	%l1
	sdivcc	%l6,	0x032C,	%o1
	fmovsneg	%icc,	%f9,	%f15
	fxors	%f22,	%f31,	%f27
	srax	%l2,	%o4,	%g1
	sdiv	%i5,	0x0744,	%i7
	fones	%f14
	fmovscc	%icc,	%f7,	%f17
	fand	%f0,	%f8,	%f28
	sllx	%i6,	%i4,	%i3
	lduh	[%l7 + 0x22],	%g3
	orcc	%g4,	%l4,	%l5
	fnor	%f30,	%f12,	%f22
	subc	%g7,	%o5,	%o7
	move	%xcc,	%l3,	%o2
	fmovscc	%icc,	%f15,	%f3
	edge16l	%g5,	%o3,	%i0
	movvs	%icc,	%o6,	%g6
	orcc	%i1,	%l0,	%i2
	edge16l	%o0,	%g2,	%l6
	sub	%o1,	0x10D8,	%l1
	add	%l2,	%g1,	%i5
	ldd	[%l7 + 0x20],	%o4
	orcc	%i6,	0x121B,	%i4
	addc	%i3,	0x108B,	%g3
	ldsh	[%l7 + 0x74],	%i7
	orn	%g4,	0x1410,	%l5
	xnor	%l4,	%o5,	%o7
	fmovdneg	%icc,	%f27,	%f1
	sdiv	%l3,	0x1854,	%g7
	fpsub16s	%f5,	%f30,	%f26
	edge32n	%g5,	%o3,	%i0
	st	%f5,	[%l7 + 0x18]
	movle	%icc,	%o6,	%g6
	ldub	[%l7 + 0x5A],	%i1
	umul	%o2,	0x189E,	%l0
	ldub	[%l7 + 0x32],	%o0
	movn	%icc,	%i2,	%g2
	fors	%f8,	%f31,	%f4
	movle	%icc,	%l6,	%l1
	stx	%l2,	[%l7 + 0x60]
	fornot1s	%f12,	%f27,	%f16
	fandnot2	%f24,	%f8,	%f26
	andn	%g1,	0x1B01,	%i5
	fmul8ulx16	%f24,	%f16,	%f10
	movrgez	%o1,	%i6,	%o4
	fors	%f24,	%f11,	%f22
	udiv	%i3,	0x1C72,	%g3
	edge32n	%i4,	%i7,	%l5
	fsrc1s	%f26,	%f14
	fmovsle	%xcc,	%f25,	%f30
	sethi	0x1D33,	%g4
	bshuffle	%f12,	%f18,	%f0
	edge16l	%l4,	%o7,	%o5
	fmovrde	%l3,	%f20,	%f24
	movrgz	%g5,	%o3,	%i0
	fandnot1s	%f17,	%f16,	%f3
	fornot2	%f26,	%f2,	%f28
	fpadd32s	%f11,	%f22,	%f0
	orn	%g7,	%g6,	%i1
	edge16ln	%o2,	%o6,	%l0
	srl	%i2,	0x1A,	%g2
	ldsw	[%l7 + 0x74],	%l6
	or	%o0,	%l2,	%l1
	sdiv	%i5,	0x111A,	%g1
	fpackfix	%f12,	%f21
	sethi	0x190F,	%i6
	fsrc1	%f24,	%f4
	ldsw	[%l7 + 0x4C],	%o4
	fmuld8sux16	%f4,	%f11,	%f26
	fmovse	%icc,	%f11,	%f26
	fand	%f2,	%f20,	%f18
	sra	%i3,	%g3,	%i4
	edge32	%i7,	%l5,	%g4
	sir	0x050B
	umulcc	%o1,	%l4,	%o7
	movrgz	%l3,	%g5,	%o5
	fmul8x16au	%f27,	%f31,	%f18
	ldx	[%l7 + 0x70],	%o3
	fcmps	%fcc0,	%f7,	%f19
	addcc	%i0,	%g7,	%g6
	sdivx	%i1,	0x10AA,	%o6
	fmovdn	%icc,	%f19,	%f26
	restore %l0, %i2, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l6,	0x03A0,	%g2
	sdivx	%o0,	0x184C,	%l1
	fmovdvc	%icc,	%f23,	%f28
	fmovscs	%xcc,	%f16,	%f26
	ldsb	[%l7 + 0x28],	%l2
	smulcc	%i5,	0x1ED1,	%i6
	udivcc	%o4,	0x03CC,	%i3
	fmovrslz	%g3,	%f21,	%f29
	movge	%icc,	%g1,	%i7
	movpos	%xcc,	%i4,	%l5
	fmovrsgez	%o1,	%f23,	%f30
	fones	%f27
	andn	%l4,	0x115B,	%o7
	or	%l3,	0x143E,	%g5
	array8	%o5,	%o3,	%g4
	movvc	%icc,	%g7,	%i0
	edge32l	%i1,	%o6,	%g6
	fmovdvc	%xcc,	%f5,	%f25
	ld	[%l7 + 0x64],	%f13
	udivcc	%i2,	0x180A,	%l0
	stb	%o2,	[%l7 + 0x26]
	fsrc2s	%f27,	%f5
	orncc	%g2,	%o0,	%l6
	andn	%l1,	%l2,	%i6
	sra	%i5,	0x0D,	%o4
	sll	%g3,	0x0B,	%g1
	fmovsl	%xcc,	%f18,	%f31
	fpadd32s	%f3,	%f11,	%f5
	mulx	%i7,	%i3,	%i4
	sra	%o1,	%l4,	%o7
	fcmple16	%f2,	%f28,	%l5
	srlx	%l3,	0x08,	%g5
	movrgz	%o3,	%g4,	%o5
	nop
	set	0x30, %o5
	stx	%g7,	[%l7 + %o5]
	andn	%i1,	%i0,	%o6
	fcmpgt16	%f8,	%f8,	%g6
	edge16	%l0,	%o2,	%g2
	edge8ln	%o0,	%l6,	%l1
	lduw	[%l7 + 0x08],	%l2
	xor	%i6,	%i2,	%o4
	movrlz	%i5,	0x27A,	%g3
	fmovdcc	%xcc,	%f13,	%f30
	movvc	%icc,	%g1,	%i3
	ldsh	[%l7 + 0x7E],	%i4
	fpadd16	%f28,	%f6,	%f10
	umul	%o1,	%l4,	%i7
	srax	%o7,	0x09,	%l3
	move	%icc,	%g5,	%l5
	edge32l	%o3,	%g4,	%o5
	fmovsle	%xcc,	%f19,	%f11
	udiv	%i1,	0x184D,	%i0
	addcc	%g7,	0x0C78,	%g6
	ld	[%l7 + 0x2C],	%f5
	fmovrsgez	%l0,	%f26,	%f24
	subcc	%o2,	%o6,	%o0
	edge16	%l6,	%g2,	%l2
	edge8	%i6,	%i2,	%o4
	fxors	%f4,	%f8,	%f13
	edge16ln	%i5,	%l1,	%g1
	fpadd16	%f14,	%f8,	%f6
	srlx	%i3,	%g3,	%o1
	movrlez	%i4,	%l4,	%o7
	movn	%icc,	%l3,	%g5
	movvs	%xcc,	%i7,	%o3
	xnor	%g4,	%l5,	%o5
	xor	%i0,	%i1,	%g6
	edge8	%g7,	%l0,	%o6
	sth	%o2,	[%l7 + 0x74]
	sth	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x3C],	%f21
	sra	%o0,	%g2,	%i6
	srlx	%l2,	0x10,	%i2
	movgu	%icc,	%i5,	%l1
	fmovscs	%icc,	%f15,	%f0
	fornot1	%f30,	%f20,	%f8
	smul	%g1,	%i3,	%o4
	smul	%o1,	0x11F1,	%i4
	sethi	0x19AF,	%l4
	sth	%g3,	[%l7 + 0x1E]
	fnands	%f21,	%f19,	%f21
	fpadd16s	%f25,	%f0,	%f7
	popc	0x0C39,	%o7
	addcc	%g5,	0x13F8,	%l3
	orn	%o3,	%i7,	%g4
	fmul8sux16	%f14,	%f26,	%f0
	ldsh	[%l7 + 0x38],	%l5
	movgu	%xcc,	%i0,	%i1
	popc	%o5,	%g7
	ldx	[%l7 + 0x78],	%l0
	edge8n	%g6,	%o2,	%o6
	mulx	%l6,	%g2,	%o0
	fexpand	%f13,	%f14
	sra	%l2,	0x01,	%i6
	fnot1	%f30,	%f8
	addc	%i2,	0x0A78,	%i5
	edge16ln	%g1,	%i3,	%l1
	movl	%xcc,	%o1,	%i4
	ldd	[%l7 + 0x60],	%o4
	edge8l	%g3,	%o7,	%g5
	fand	%f30,	%f2,	%f22
	sdivcc	%l4,	0x17F1,	%o3
	fmuld8ulx16	%f10,	%f29,	%f26
	fmovsge	%xcc,	%f29,	%f15
	lduh	[%l7 + 0x7A],	%l3
	move	%icc,	%i7,	%g4
	udivcc	%l5,	0x15CD,	%i0
	siam	0x2
	fors	%f28,	%f22,	%f26
	fnegd	%f26,	%f28
	srlx	%i1,	0x19,	%o5
	orcc	%l0,	%g6,	%o2
	st	%f17,	[%l7 + 0x0C]
	orcc	%o6,	0x1E89,	%g7
	movleu	%icc,	%g2,	%l6
	and	%o0,	0x0A9E,	%i6
	fcmpgt16	%f4,	%f10,	%l2
	fmovrsgez	%i5,	%f7,	%f4
	udiv	%g1,	0x054B,	%i3
	umul	%l1,	%i2,	%o1
	movge	%xcc,	%i4,	%g3
	and	%o7,	0x1F45,	%g5
	mova	%xcc,	%l4,	%o4
	array32	%l3,	%o3,	%i7
	sir	0x0142
	movre	%g4,	%l5,	%i1
	ldsw	[%l7 + 0x2C],	%i0
	sethi	0x0556,	%l0
	fnand	%f26,	%f26,	%f24
	edge16n	%o5,	%g6,	%o6
	fnor	%f28,	%f20,	%f8
	fcmpeq16	%f20,	%f12,	%o2
	mulx	%g2,	%l6,	%o0
	edge16n	%i6,	%g7,	%i5
	xnor	%l2,	0x0952,	%g1
	sth	%i3,	[%l7 + 0x30]
	addcc	%i2,	0x01AB,	%o1
	edge32ln	%l1,	%g3,	%i4
	fmul8sux16	%f6,	%f30,	%f4
	alignaddrl	%g5,	%l4,	%o4
	movge	%xcc,	%o7,	%o3
	sra	%l3,	0x14,	%i7
	movn	%icc,	%g4,	%l5
	sll	%i0,	%i1,	%o5
	xor	%g6,	%l0,	%o6
	movn	%icc,	%o2,	%l6
	fmovrsne	%g2,	%f21,	%f26
	subcc	%o0,	%i6,	%i5
	ldsh	[%l7 + 0x52],	%l2
	srax	%g7,	0x1D,	%g1
	lduh	[%l7 + 0x64],	%i2
	fones	%f0
	sll	%o1,	%l1,	%i3
	fpadd16s	%f19,	%f22,	%f1
	fnand	%f20,	%f8,	%f14
	movre	%g3,	%i4,	%g5
	mulx	%o4,	%o7,	%l4
	movleu	%icc,	%l3,	%o3
	and	%g4,	0x08F6,	%i7
	sra	%i0,	%l5,	%i1
	array16	%g6,	%l0,	%o5
	movrlez	%o6,	0x1E4,	%l6
	umulcc	%o2,	%o0,	%i6
	edge16	%i5,	%l2,	%g7
	srl	%g2,	%g1,	%o1
	fnegd	%f14,	%f26
	lduw	[%l7 + 0x18],	%l1
	fmovdcc	%icc,	%f3,	%f4
	srax	%i2,	%g3,	%i4
	save %i3, 0x1687, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f12,	[%l7 + 0x48]
	edge8l	%g5,	%l4,	%o7
	udivx	%o3,	0x1D4C,	%g4
	fmovse	%icc,	%f4,	%f0
	udivcc	%l3,	0x024D,	%i0
	movrlez	%i7,	%i1,	%g6
	movne	%icc,	%l5,	%l0
	movne	%xcc,	%o6,	%l6
	alignaddr	%o2,	%o5,	%o0
	movrgz	%i6,	%l2,	%i5
	fmul8x16al	%f10,	%f31,	%f24
	std	%f8,	[%l7 + 0x68]
	sth	%g2,	[%l7 + 0x0E]
	st	%f13,	[%l7 + 0x34]
	movrgez	%g1,	%g7,	%o1
	orn	%i2,	%l1,	%i4
	move	%xcc,	%i3,	%o4
	edge8	%g3,	%g5,	%l4
	alignaddr	%o7,	%o3,	%l3
	srl	%i0,	%i7,	%i1
	ldd	[%l7 + 0x50],	%f22
	popc	%g4,	%g6
	sub	%l0,	0x03EB,	%l5
	stx	%o6,	[%l7 + 0x48]
	orncc	%o2,	0x0921,	%l6
	srl	%o5,	0x0C,	%i6
	sth	%o0,	[%l7 + 0x5C]
	ldsw	[%l7 + 0x18],	%i5
	fpsub32s	%f31,	%f21,	%f5
	movrne	%g2,	0x2C4,	%g1
	movneg	%icc,	%l2,	%o1
	fnands	%f30,	%f10,	%f5
	fmovsleu	%xcc,	%f2,	%f20
	ldsh	[%l7 + 0x28],	%g7
	movcs	%icc,	%l1,	%i2
	popc	0x0101,	%i4
	ld	[%l7 + 0x28],	%f31
	edge8l	%i3,	%g3,	%g5
	fmovsge	%xcc,	%f19,	%f19
	udivcc	%l4,	0x1773,	%o7
	bshuffle	%f4,	%f6,	%f14
	mulx	%o4,	%o3,	%i0
	fpack16	%f0,	%f12
	edge16ln	%i7,	%i1,	%g4
	movne	%xcc,	%g6,	%l0
	edge8n	%l3,	%l5,	%o2
	fmovrslez	%l6,	%f0,	%f30
	stb	%o6,	[%l7 + 0x7B]
	fnands	%f5,	%f23,	%f14
	movpos	%icc,	%o5,	%i6
	edge32ln	%i5,	%g2,	%g1
	fnors	%f13,	%f10,	%f22
	fandnot1s	%f19,	%f21,	%f21
	fmovrsne	%l2,	%f19,	%f27
	ldd	[%l7 + 0x40],	%o0
	ldsw	[%l7 + 0x58],	%g7
	udiv	%l1,	0x0522,	%o0
	fpmerge	%f29,	%f21,	%f0
	fmovrsne	%i4,	%f11,	%f17
	add	%i3,	0x0B90,	%i2
	fmovde	%xcc,	%f18,	%f16
	fmovscc	%xcc,	%f11,	%f25
	sir	0x0DA2
	fmul8x16	%f9,	%f10,	%f14
	stw	%g5,	[%l7 + 0x7C]
	fmovrdlez	%l4,	%f2,	%f24
	subccc	%o7,	%o4,	%o3
	xnor	%i0,	0x12FF,	%i7
	xnorcc	%i1,	0x161C,	%g4
	sllx	%g6,	%l0,	%l3
	lduw	[%l7 + 0x78],	%g3
	fcmpgt32	%f22,	%f0,	%o2
	orn	%l6,	%o6,	%l5
	fmovs	%f13,	%f29
	lduh	[%l7 + 0x74],	%o5
	movl	%icc,	%i5,	%g2
	ld	[%l7 + 0x2C],	%f10
	orcc	%i6,	%l2,	%o1
	addcc	%g1,	%l1,	%g7
	sth	%i4,	[%l7 + 0x52]
	fmovde	%xcc,	%f10,	%f7
	fmovrdgz	%i3,	%f12,	%f14
	fcmpne16	%f6,	%f4,	%o0
	ldsw	[%l7 + 0x1C],	%i2
	ld	[%l7 + 0x40],	%f14
	movleu	%xcc,	%g5,	%l4
	and	%o7,	0x117C,	%o4
	nop
	set	0x18, %i5
	stx	%i0,	[%l7 + %i5]
	fmovdneg	%xcc,	%f16,	%f12
	edge8	%o3,	%i1,	%g4
	movrlz	%i7,	%g6,	%l3
	movrlez	%l0,	%o2,	%l6
	st	%f18,	[%l7 + 0x34]
	movre	%o6,	%g3,	%l5
	movrgz	%i5,	%o5,	%i6
	andcc	%g2,	0x1783,	%l2
	smul	%o1,	%g1,	%l1
	orn	%g7,	%i4,	%o0
	movle	%icc,	%i2,	%i3
	movne	%xcc,	%g5,	%o7
	fmul8x16au	%f18,	%f20,	%f14
	fnand	%f24,	%f18,	%f14
	fmul8x16au	%f11,	%f22,	%f2
	ldsb	[%l7 + 0x50],	%o4
	fmovdpos	%xcc,	%f10,	%f9
	stx	%i0,	[%l7 + 0x38]
	smul	%o3,	0x1655,	%i1
	stb	%l4,	[%l7 + 0x32]
	stw	%g4,	[%l7 + 0x6C]
	movrlez	%g6,	%i7,	%l0
	nop
	set	0x68, %g6
	ldsh	[%l7 + %g6],	%o2
	lduw	[%l7 + 0x08],	%l3
	fmovdle	%icc,	%f19,	%f3
	movvc	%xcc,	%o6,	%g3
	movcc	%icc,	%l5,	%i5
	edge32	%l6,	%i6,	%g2
	movvs	%xcc,	%o5,	%l2
	alignaddr	%g1,	%o1,	%l1
	udivx	%i4,	0x1DC1,	%g7
	addcc	%o0,	%i2,	%g5
	xorcc	%o7,	%i3,	%o4
	stw	%i0,	[%l7 + 0x50]
	sllx	%i1,	%o3,	%g4
	edge8ln	%g6,	%l4,	%l0
	sir	0x050A
	sethi	0x0CA6,	%i7
	ldsw	[%l7 + 0x1C],	%o2
	udiv	%o6,	0x1BD4,	%l3
	smulcc	%g3,	%i5,	%l6
	fmovsgu	%xcc,	%f28,	%f31
	movvc	%icc,	%l5,	%g2
	ldd	[%l7 + 0x60],	%i6
	add	%o5,	%l2,	%g1
	movrne	%l1,	%o1,	%i4
	xnorcc	%o0,	0x0C21,	%g7
	movpos	%icc,	%g5,	%i2
	srax	%o7,	0x0A,	%i3
	movneg	%icc,	%o4,	%i1
	stw	%o3,	[%l7 + 0x70]
	edge32n	%i0,	%g4,	%g6
	andncc	%l4,	%i7,	%o2
	movleu	%xcc,	%l0,	%l3
	srax	%o6,	%g3,	%i5
	fmovsle	%xcc,	%f28,	%f15
	srl	%l5,	%g2,	%i6
	andncc	%l6,	%o5,	%l2
	fmovrslz	%g1,	%f16,	%f10
	movrlez	%o1,	%l1,	%o0
	alignaddrl	%i4,	%g5,	%g7
	fmovrsne	%o7,	%f28,	%f15
	movre	%i2,	%i3,	%i1
	stx	%o4,	[%l7 + 0x40]
	movpos	%xcc,	%i0,	%g4
	edge16	%g6,	%o3,	%l4
	sra	%i7,	0x05,	%l0
	sllx	%l3,	0x15,	%o6
	fcmpne32	%f30,	%f24,	%o2
	fcmpgt16	%f10,	%f14,	%i5
	edge8n	%g3,	%l5,	%i6
	addc	%g2,	0x1049,	%l6
	fzeros	%f3
	mulx	%o5,	%l2,	%g1
	sub	%o1,	%o0,	%l1
	smulcc	%g5,	%g7,	%o7
	sdiv	%i2,	0x146A,	%i3
	mova	%icc,	%i1,	%o4
	stw	%i4,	[%l7 + 0x18]
	umulcc	%g4,	0x19BC,	%i0
	addcc	%g6,	0x1871,	%o3
	orcc	%i7,	%l4,	%l0
	fabsd	%f10,	%f6
	edge16n	%o6,	%l3,	%o2
	stw	%g3,	[%l7 + 0x60]
	srax	%i5,	%i6,	%g2
	fornot1s	%f19,	%f22,	%f25
	addc	%l5,	%l6,	%o5
	movrgez	%g1,	%o1,	%o0
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	subccc	%g5,	%i2,	%o7
	edge16l	%i1,	%o4,	%i4
	umul	%g4,	%i3,	%g6
	edge8	%o3,	%i0,	%l4
	fmovse	%xcc,	%f13,	%f16
	sdiv	%l0,	0x035C,	%i7
	movrgez	%l3,	0x17D,	%o2
	siam	0x7
	movrlez	%g3,	%i5,	%i6
	fnot2	%f10,	%f0
	edge16l	%o6,	%g2,	%l6
	sdivx	%o5,	0x1EDD,	%g1
	lduw	[%l7 + 0x14],	%o1
	sth	%o0,	[%l7 + 0x5C]
	fcmple16	%f28,	%f28,	%l5
	addc	%l1,	%g7,	%g5
	movneg	%xcc,	%i2,	%l2
	addcc	%i1,	0x1E62,	%o4
	movrgez	%o7,	0x356,	%g4
	fpack16	%f28,	%f2
	movvc	%xcc,	%i3,	%i4
	sth	%g6,	[%l7 + 0x16]
	udivx	%o3,	0x101C,	%i0
	fmul8x16	%f14,	%f6,	%f6
	fmovscs	%icc,	%f12,	%f25
	sdiv	%l0,	0x04DC,	%i7
	subcc	%l4,	%l3,	%g3
	fnot1	%f0,	%f16
	ldsb	[%l7 + 0x4D],	%i5
	edge8	%o2,	%o6,	%i6
	fands	%f24,	%f1,	%f14
	sdiv	%g2,	0x173C,	%l6
	movrgz	%o5,	0x290,	%g1
	fandnot1s	%f4,	%f1,	%f25
	fmovrsgz	%o1,	%f19,	%f2
	orn	%l5,	%o0,	%g7
	sra	%l1,	%i2,	%g5
	srl	%l2,	%i1,	%o7
	umul	%g4,	%i3,	%o4
	movrgez	%i4,	%g6,	%i0
	for	%f28,	%f8,	%f22
	sethi	0x1C97,	%o3
	andncc	%l0,	%i7,	%l4
	addccc	%l3,	%i5,	%o2
	mova	%icc,	%g3,	%i6
	udivx	%g2,	0x18BF,	%o6
	mulscc	%l6,	0x0C05,	%o5
	movle	%icc,	%o1,	%g1
	mova	%xcc,	%o0,	%l5
	fmovsne	%icc,	%f1,	%f20
	edge32n	%l1,	%g7,	%g5
	xnorcc	%l2,	0x1872,	%i1
	smulcc	%i2,	0x00D7,	%g4
	fnot2s	%f31,	%f1
	sub	%i3,	0x0462,	%o7
	stb	%o4,	[%l7 + 0x6F]
	orncc	%g6,	0x134B,	%i0
	popc	%o3,	%i4
	std	%f20,	[%l7 + 0x30]
	fxor	%f26,	%f6,	%f28
	andncc	%l0,	%l4,	%l3
	edge32	%i5,	%o2,	%g3
	orncc	%i7,	0x107A,	%g2
	movvc	%icc,	%i6,	%l6
	mulx	%o5,	0x069B,	%o6
	fand	%f22,	%f26,	%f6
	movn	%icc,	%g1,	%o0
	st	%f18,	[%l7 + 0x60]
	fmovrsne	%o1,	%f19,	%f0
	movvc	%xcc,	%l1,	%l5
	edge32ln	%g7,	%g5,	%i1
	smul	%i2,	0x1056,	%g4
	udivcc	%i3,	0x0BF3,	%o7
	andcc	%o4,	%g6,	%i0
	fmovsn	%xcc,	%f11,	%f24
	ldd	[%l7 + 0x18],	%l2
	fpsub32s	%f18,	%f24,	%f27
	edge8ln	%i4,	%o3,	%l0
	ldsw	[%l7 + 0x50],	%l3
	edge32ln	%i5,	%l4,	%o2
	movle	%xcc,	%g3,	%i7
	fandnot2s	%f29,	%f17,	%f9
	stb	%g2,	[%l7 + 0x66]
	subccc	%i6,	0x131E,	%l6
	alignaddrl	%o6,	%g1,	%o0
	array32	%o1,	%o5,	%l5
	edge16n	%l1,	%g7,	%g5
	srlx	%i1,	0x1D,	%i2
	fabsd	%f30,	%f16
	addc	%i3,	0x18FA,	%g4
	fpsub32s	%f9,	%f9,	%f28
	movneg	%xcc,	%o4,	%g6
	addccc	%o7,	0x1950,	%l2
	fmovdgu	%xcc,	%f12,	%f21
	fpadd32s	%f31,	%f2,	%f2
	umulcc	%i0,	0x04D6,	%i4
	movge	%xcc,	%l0,	%l3
	orncc	%i5,	0x0619,	%o3
	mova	%xcc,	%o2,	%l4
	movleu	%xcc,	%i7,	%g3
	movvc	%xcc,	%i6,	%g2
	ldsb	[%l7 + 0x1D],	%l6
	movrne	%g1,	%o0,	%o1
	xorcc	%o5,	0x0239,	%o6
	stx	%l5,	[%l7 + 0x18]
	movrgez	%l1,	0x296,	%g5
	movrlz	%i1,	0x20B,	%g7
	st	%f7,	[%l7 + 0x68]
	fmovdge	%xcc,	%f30,	%f4
	fabsd	%f16,	%f30
	ldd	[%l7 + 0x08],	%f16
	andn	%i3,	0x0EDA,	%g4
	fmovde	%icc,	%f18,	%f2
	edge8n	%o4,	%i2,	%o7
	movle	%xcc,	%g6,	%i0
	subcc	%i4,	%l0,	%l2
	nop
	set	0x33, %g7
	ldsb	[%l7 + %g7],	%i5
	fandnot1s	%f12,	%f22,	%f27
	ldsw	[%l7 + 0x6C],	%o3
	fmovsl	%xcc,	%f12,	%f24
	xor	%l3,	%o2,	%l4
	save %i7, %g3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x34],	%g2
	movneg	%icc,	%g1,	%o0
	movg	%xcc,	%o1,	%o5
	ld	[%l7 + 0x60],	%f13
	fandnot2s	%f26,	%f23,	%f21
	lduw	[%l7 + 0x74],	%l6
	st	%f7,	[%l7 + 0x20]
	fmovsvc	%xcc,	%f12,	%f13
	sethi	0x0730,	%o6
	addc	%l5,	0x04FB,	%g5
	edge16	%l1,	%i1,	%i3
	save %g7, %o4, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o7,	%g6,	%i2
	fmovsle	%icc,	%f10,	%f7
	fmovsleu	%icc,	%f19,	%f26
	andn	%i4,	0x0A3B,	%l0
	sdiv	%i0,	0x1381,	%l2
	edge8ln	%o3,	%l3,	%o2
	edge32	%l4,	%i7,	%g3
	orcc	%i5,	%g2,	%i6
	fpadd16s	%f23,	%f22,	%f9
	sethi	0x1116,	%g1
	ldd	[%l7 + 0x20],	%o0
	sdiv	%o5,	0x1FB0,	%o1
	lduw	[%l7 + 0x6C],	%o6
	movre	%l6,	%g5,	%l5
	fmovsvc	%icc,	%f8,	%f18
	andn	%l1,	%i3,	%g7
	array16	%i1,	%o4,	%g4
	ldd	[%l7 + 0x58],	%o6
	fandnot1	%f4,	%f28,	%f20
	fmovdvs	%icc,	%f28,	%f18
	fsrc2s	%f12,	%f28
	fmovrse	%g6,	%f7,	%f25
	fornot2s	%f0,	%f16,	%f8
	lduw	[%l7 + 0x18],	%i2
	ldsb	[%l7 + 0x0D],	%l0
	edge16ln	%i4,	%i0,	%o3
	siam	0x0
	ldd	[%l7 + 0x38],	%l2
	andncc	%l2,	%l4,	%o2
	sub	%i7,	%i5,	%g3
	fmovdge	%icc,	%f8,	%f19
	array32	%g2,	%g1,	%o0
	movcc	%icc,	%i6,	%o5
	st	%f6,	[%l7 + 0x20]
	alignaddr	%o6,	%o1,	%g5
	alignaddr	%l5,	%l1,	%i3
	xor	%g7,	0x0271,	%i1
	fmovrse	%o4,	%f13,	%f20
	edge8n	%l6,	%g4,	%o7
	fmul8x16	%f12,	%f2,	%f24
	smulcc	%i2,	%l0,	%g6
	subcc	%i4,	%i0,	%o3
	fmovdg	%xcc,	%f7,	%f26
	fandnot2	%f20,	%f8,	%f18
	movre	%l2,	0x36F,	%l3
	mova	%xcc,	%l4,	%o2
	srax	%i7,	0x16,	%i5
	xor	%g2,	%g1,	%o0
	xnor	%i6,	0x095B,	%g3
	andncc	%o5,	%o1,	%o6
	array16	%l5,	%l1,	%g5
	umulcc	%g7,	0x1011,	%i1
	fmovrdlz	%o4,	%f6,	%f28
	sra	%i3,	0x09,	%g4
	nop
	set	0x7C, %o1
	ldsw	[%l7 + %o1],	%l6
	bshuffle	%f14,	%f8,	%f30
	save %i2, 0x01D5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o7,	%g6,	%i4
	smul	%i0,	0x10A4,	%o3
	fmovdpos	%xcc,	%f4,	%f0
	ldsb	[%l7 + 0x36],	%l2
	movre	%l4,	0x3D5,	%l3
	movrlz	%o2,	0x30E,	%i5
	fmovsle	%xcc,	%f5,	%f23
	fcmpes	%fcc3,	%f6,	%f20
	or	%i7,	%g2,	%g1
	movn	%xcc,	%i6,	%g3
	edge16l	%o5,	%o0,	%o1
	fmovsgu	%xcc,	%f31,	%f1
	sdiv	%o6,	0x00D0,	%l5
	sdivx	%l1,	0x0754,	%g7
	siam	0x4
	fzero	%f0
	restore %i1, %g5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g4,	%l6,	%o4
	add	%i2,	%l0,	%o7
	subcc	%i4,	0x0115,	%i0
	fnegd	%f12,	%f12
	addccc	%o3,	0x0349,	%g6
	sdiv	%l4,	0x0C10,	%l3
	lduh	[%l7 + 0x42],	%o2
	ldx	[%l7 + 0x28],	%l2
	lduh	[%l7 + 0x78],	%i5
	ld	[%l7 + 0x24],	%f25
	addcc	%g2,	0x1722,	%g1
	fabsd	%f10,	%f20
	andn	%i6,	%g3,	%i7
	fsrc1	%f22,	%f14
	stb	%o0,	[%l7 + 0x7E]
	popc	%o5,	%o1
	fabss	%f18,	%f1
	movrgez	%l5,	%l1,	%o6
	movne	%xcc,	%g7,	%g5
	alignaddrl	%i1,	%i3,	%l6
	movre	%o4,	%g4,	%l0
	movg	%icc,	%o7,	%i4
	xor	%i0,	%o3,	%g6
	movgu	%xcc,	%l4,	%l3
	sll	%i2,	0x1A,	%o2
	subcc	%i5,	%g2,	%g1
	sethi	0x1606,	%l2
	srax	%g3,	0x1B,	%i7
	fmovdpos	%icc,	%f21,	%f7
	addcc	%i6,	0x045B,	%o5
	movvs	%icc,	%o1,	%l5
	edge8n	%o0,	%l1,	%g7
	sdivx	%g5,	0x1572,	%i1
	fand	%f18,	%f2,	%f2
	lduh	[%l7 + 0x7C],	%o6
	fpadd16	%f24,	%f18,	%f18
	andcc	%l6,	0x1A53,	%i3
	movgu	%xcc,	%g4,	%l0
	ld	[%l7 + 0x10],	%f19
	movcc	%icc,	%o7,	%o4
	movvs	%icc,	%i4,	%o3
	movne	%xcc,	%i0,	%l4
	or	%g6,	0x18E3,	%i2
	or	%o2,	0x1AD2,	%l3
	edge8l	%g2,	%i5,	%g1
	ldsb	[%l7 + 0x67],	%g3
	fnand	%f22,	%f22,	%f26
	sllx	%l2,	%i6,	%i7
	edge16ln	%o1,	%l5,	%o0
	fpsub32s	%f10,	%f10,	%f24
	sethi	0x07A3,	%o5
	movrlz	%g7,	0x13F,	%l1
	fnot2	%f10,	%f12
	ldd	[%l7 + 0x30],	%f0
	save %g5, 0x17BE, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x3C],	%f6
	ldd	[%l7 + 0x38],	%i6
	ldx	[%l7 + 0x50],	%i1
	array8	%g4,	%l0,	%i3
	movpos	%xcc,	%o7,	%i4
	andcc	%o4,	0x13C3,	%o3
	stw	%i0,	[%l7 + 0x7C]
	movg	%icc,	%g6,	%l4
	ld	[%l7 + 0x10],	%f16
	orcc	%i2,	0x12F7,	%l3
	edge16n	%g2,	%i5,	%o2
	addc	%g1,	0x01D8,	%l2
	movge	%xcc,	%i6,	%g3
	sethi	0x1641,	%i7
	ldub	[%l7 + 0x57],	%l5
	umulcc	%o1,	%o0,	%g7
	pdist	%f10,	%f6,	%f14
	ldx	[%l7 + 0x28],	%l1
	lduh	[%l7 + 0x64],	%g5
	sdivx	%o5,	0x178A,	%o6
	fpackfix	%f20,	%f9
	faligndata	%f24,	%f30,	%f20
	sll	%l6,	%g4,	%i1
	fcmple32	%f24,	%f4,	%i3
	movle	%xcc,	%l0,	%o7
	movrlz	%i4,	%o4,	%i0
	move	%xcc,	%o3,	%g6
	ldd	[%l7 + 0x78],	%l4
	stx	%i2,	[%l7 + 0x40]
	movrlez	%l3,	%g2,	%i5
	udiv	%o2,	0x19DE,	%l2
	sll	%i6,	0x12,	%g1
	movrgez	%i7,	0x3A4,	%l5
	edge32l	%g3,	%o1,	%o0
	fmovd	%f22,	%f14
	srlx	%l1,	%g7,	%g5
	movneg	%icc,	%o6,	%l6
	fcmped	%fcc0,	%f6,	%f16
	fmovrslz	%o5,	%f12,	%f13
	movrgez	%g4,	0x2C4,	%i3
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	stb	%o7,	[%l7 + 0x1C]
	udiv	%i4,	0x0386,	%i0
	movne	%xcc,	%o3,	%g6
	movg	%icc,	%l4,	%o4
	fmovrde	%i2,	%f20,	%f14
	fandnot1s	%f22,	%f22,	%f29
	mulscc	%g2,	0x1C78,	%i5
	orncc	%l3,	0x0463,	%o2
	sub	%l2,	0x1265,	%g1
	sub	%i6,	%l5,	%g3
	srl	%i7,	0x1D,	%o1
	fmovrsne	%l1,	%f3,	%f23
	xorcc	%o0,	%g7,	%o6
	lduw	[%l7 + 0x4C],	%g5
	fpsub32s	%f20,	%f12,	%f1
	movcc	%xcc,	%l6,	%g4
	fmovsleu	%icc,	%f26,	%f31
	edge16l	%i3,	%i1,	%l0
	array16	%o5,	%i4,	%o7
	sub	%o3,	%g6,	%l4
	sdivx	%i0,	0x01C6,	%i2
	fabsd	%f8,	%f30
	movleu	%xcc,	%o4,	%i5
	fmovsl	%icc,	%f22,	%f11
	stb	%g2,	[%l7 + 0x5A]
	lduh	[%l7 + 0x34],	%l3
	udivcc	%l2,	0x13E5,	%o2
	sethi	0x1AA5,	%i6
	addcc	%l5,	%g1,	%g3
	movn	%icc,	%i7,	%l1
	movle	%xcc,	%o0,	%o1
	movneg	%xcc,	%o6,	%g7
	ldd	[%l7 + 0x68],	%f8
	and	%l6,	0x0027,	%g5
	sllx	%g4,	%i1,	%i3
	subcc	%o5,	%l0,	%i4
	fmovrslez	%o7,	%f4,	%f10
	sra	%o3,	0x18,	%l4
	fmovd	%f12,	%f12
	sllx	%g6,	%i0,	%i2
	edge32n	%o4,	%i5,	%l3
	save %l2, 0x00CE, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x5B, %i2
	ldub	[%l7 + %i2],	%g2
	ldd	[%l7 + 0x10],	%f30
	sdiv	%l5,	0x16D9,	%g1
	fsrc1	%f6,	%f6
	movrne	%g3,	0x02C,	%i6
	lduw	[%l7 + 0x2C],	%i7
	movn	%xcc,	%o0,	%l1
	fmovd	%f14,	%f14
	movge	%icc,	%o6,	%o1
	ldx	[%l7 + 0x70],	%l6
	movpos	%icc,	%g7,	%g5
	sra	%g4,	0x02,	%i3
	movcs	%xcc,	%i1,	%l0
	movpos	%icc,	%o5,	%o7
	andcc	%i4,	%o3,	%g6
	edge16l	%i0,	%l4,	%i2
	stw	%o4,	[%l7 + 0x5C]
	edge8l	%i5,	%l3,	%o2
	edge8	%g2,	%l5,	%l2
	ld	[%l7 + 0x2C],	%f19
	mulx	%g1,	0x0AE4,	%i6
	sdivx	%i7,	0x135B,	%o0
	orncc	%l1,	%o6,	%g3
	fand	%f18,	%f28,	%f30
	movre	%o1,	0x3E4,	%l6
	array16	%g7,	%g4,	%g5
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%i0
	ld	[%l7 + 0x44],	%f23
	movcc	%xcc,	%i3,	%l0
	fmovdl	%xcc,	%f13,	%f8
	lduw	[%l7 + 0x38],	%o7
	edge16l	%i4,	%o5,	%g6
	mulscc	%o3,	0x00E3,	%l4
	andn	%i0,	%i2,	%o4
	fmovdcc	%xcc,	%f7,	%f6
	fpack32	%f0,	%f8,	%f16
	st	%f7,	[%l7 + 0x60]
	movcc	%xcc,	%i5,	%l3
	andcc	%o2,	0x1E0D,	%g2
	sub	%l5,	%l2,	%i6
	movrne	%g1,	%i7,	%l1
	subcc	%o6,	0x1138,	%o0
	stw	%o1,	[%l7 + 0x40]
	ldd	[%l7 + 0x48],	%f8
	andcc	%l6,	%g3,	%g4
	srlx	%g5,	0x11,	%i1
	sll	%g7,	0x0D,	%i3
	movrgz	%o7,	%i4,	%o5
	bshuffle	%f28,	%f30,	%f20
	array32	%l0,	%o3,	%g6
	ldsb	[%l7 + 0x13],	%l4
	movrgz	%i2,	0x0F3,	%i0
	save %i5, 0x11AF, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%l3,	%g2
	fmovdpos	%icc,	%f4,	%f18
	edge32ln	%o2,	%l5,	%l2
	sth	%g1,	[%l7 + 0x6E]
	fmovdvc	%icc,	%f9,	%f19
	movrgz	%i6,	0x349,	%i7
	edge32l	%o6,	%o0,	%l1
	sub	%o1,	%g3,	%g4
	movl	%icc,	%l6,	%i1
	fcmps	%fcc0,	%f13,	%f12
	array16	%g7,	%i3,	%o7
	lduh	[%l7 + 0x6E],	%i4
	addcc	%o5,	%l0,	%g5
	edge8ln	%o3,	%g6,	%i2
	movg	%xcc,	%l4,	%i5
	orcc	%i0,	%o4,	%g2
	fmovdpos	%icc,	%f16,	%f0
	nop
	set	0x68, %g4
	stw	%o2,	[%l7 + %g4]
	sllx	%l5,	0x07,	%l3
	fcmps	%fcc2,	%f29,	%f18
	fmovs	%f15,	%f3
	sub	%g1,	0x032A,	%i6
	movvs	%xcc,	%l2,	%o6
	stw	%i7,	[%l7 + 0x2C]
	movle	%xcc,	%l1,	%o1
	edge8	%g3,	%g4,	%l6
	array32	%o0,	%g7,	%i1
	fcmpgt32	%f24,	%f24,	%o7
	movle	%xcc,	%i4,	%o5
	movl	%icc,	%l0,	%g5
	alignaddr	%i3,	%g6,	%o3
	alignaddr	%i2,	%l4,	%i0
	save %i5, %o4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%g2,	%l3
	alignaddr	%g1,	%i6,	%l2
	srlx	%o6,	%l5,	%i7
	orn	%l1,	0x129D,	%o1
	restore %g3, 0x0373, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x037F,	%l6
	xnorcc	%o0,	%g7,	%i1
	nop
	set	0x3A, %g5
	ldsh	[%l7 + %g5],	%o7
	movcs	%xcc,	%o5,	%l0
	fsrc1	%f6,	%f0
	pdist	%f16,	%f28,	%f18
	fnot1s	%f7,	%f1
	fmovse	%xcc,	%f31,	%f0
	subc	%g5,	%i4,	%i3
	edge16n	%o3,	%g6,	%l4
	ldx	[%l7 + 0x10],	%i2
	fnot2	%f10,	%f8
	fpack16	%f2,	%f7
	movl	%icc,	%i5,	%i0
	movg	%xcc,	%o2,	%g2
	addccc	%l3,	0x0B85,	%g1
	array16	%o4,	%l2,	%i6
	andncc	%l5,	%i7,	%l1
	stx	%o1,	[%l7 + 0x28]
	subc	%g3,	0x1B3A,	%o6
	sra	%l6,	0x1A,	%g4
	srax	%o0,	0x0C,	%i1
	edge16	%o7,	%g7,	%o5
	umulcc	%l0,	0x1A08,	%g5
	alignaddrl	%i3,	%o3,	%g6
	movvs	%icc,	%i4,	%i2
	ldub	[%l7 + 0x77],	%l4
	addccc	%i0,	%i5,	%g2
	movrgez	%l3,	0x1BC,	%o2
	lduh	[%l7 + 0x16],	%g1
	movre	%o4,	0x0B9,	%i6
	sir	0x18A7
	sra	%l5,	%i7,	%l1
	fmovsne	%xcc,	%f31,	%f17
	xorcc	%l2,	0x1B92,	%g3
	alignaddrl	%o6,	%o1,	%l6
	movrgez	%g4,	0x0FC,	%i1
	fcmpeq16	%f2,	%f22,	%o7
	orcc	%o0,	%g7,	%o5
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	srax	%o3,	0x0B,	%g6
	sub	%i4,	0x0DB1,	%l4
	sra	%i2,	0x13,	%i5
	movl	%icc,	%g2,	%i0
	sllx	%o2,	%l3,	%o4
	movleu	%icc,	%i6,	%l5
	udivx	%g1,	0x1A70,	%i7
	nop
	set	0x3E, %l1
	sth	%l1,	[%l7 + %l1]
	xor	%g3,	%o6,	%l2
	edge32	%o1,	%g4,	%i1
	andcc	%l6,	%o7,	%o0
	edge32n	%g7,	%o5,	%l0
	edge32	%g5,	%o3,	%i3
	ldsh	[%l7 + 0x08],	%g6
	movl	%xcc,	%l4,	%i4
	movgu	%icc,	%i2,	%g2
	addc	%i5,	%i0,	%l3
	fcmpd	%fcc0,	%f14,	%f22
	smulcc	%o2,	%i6,	%o4
	movrlez	%l5,	%i7,	%l1
	movvs	%xcc,	%g3,	%g1
	movvc	%xcc,	%l2,	%o1
	lduh	[%l7 + 0x38],	%o6
	movleu	%xcc,	%g4,	%i1
	fands	%f29,	%f6,	%f12
	movneg	%xcc,	%o7,	%l6
	movle	%icc,	%o0,	%o5
	sdivx	%l0,	0x1163,	%g5
	xorcc	%g7,	0x0E16,	%i3
	sethi	0x1864,	%o3
	sllx	%g6,	0x10,	%l4
	udiv	%i4,	0x0E54,	%g2
	edge32n	%i2,	%i5,	%l3
	array32	%o2,	%i6,	%i0
	fsrc2	%f4,	%f10
	edge32n	%l5,	%i7,	%l1
	movvc	%icc,	%g3,	%g1
	xnorcc	%l2,	0x1547,	%o1
	fsrc1s	%f12,	%f6
	sdiv	%o6,	0x0146,	%o4
	fmovrdgz	%g4,	%f24,	%f8
	movleu	%xcc,	%o7,	%l6
	srl	%o0,	%o5,	%i1
	sllx	%g5,	%g7,	%i3
	xnor	%l0,	%g6,	%l4
	smulcc	%i4,	0x156D,	%g2
	fmovs	%f27,	%f23
	smulcc	%i2,	0x054B,	%o3
	edge32	%l3,	%o2,	%i5
	alignaddrl	%i6,	%i0,	%i7
	array32	%l1,	%g3,	%g1
	movre	%l5,	%o1,	%l2
	addccc	%o4,	0x0EC7,	%g4
	srl	%o7,	0x1C,	%o6
	srax	%l6,	%o5,	%i1
	andncc	%o0,	%g7,	%i3
	fandnot2	%f22,	%f30,	%f30
	umul	%g5,	%l0,	%g6
	fone	%f18
	udivcc	%i4,	0x0CB9,	%g2
	popc	%i2,	%o3
	movcc	%icc,	%l3,	%l4
	fmovsne	%xcc,	%f31,	%f9
	umul	%o2,	0x0D6D,	%i5
	lduw	[%l7 + 0x64],	%i6
	fmovrde	%i7,	%f24,	%f22
	edge32	%i0,	%g3,	%l1
	orn	%l5,	%o1,	%g1
	edge32l	%o4,	%l2,	%g4
	popc	%o7,	%l6
	fmovsge	%xcc,	%f24,	%f0
	andcc	%o6,	0x1777,	%i1
	bshuffle	%f10,	%f4,	%f4
	srl	%o0,	%g7,	%o5
	fmuld8ulx16	%f15,	%f14,	%f16
	xor	%i3,	%g5,	%g6
	fmovrdlez	%i4,	%f2,	%f14
	fmuld8sux16	%f14,	%f26,	%f10
	smulcc	%l0,	0x00FE,	%i2
	nop
	set	0x10, %o2
	ldx	[%l7 + %o2],	%o3
	sllx	%l3,	0x08,	%g2
	sth	%l4,	[%l7 + 0x68]
	popc	%o2,	%i6
	movcs	%icc,	%i7,	%i5
	move	%icc,	%i0,	%l1
	lduw	[%l7 + 0x6C],	%l5
	lduh	[%l7 + 0x3A],	%g3
	fpadd32s	%f12,	%f10,	%f18
	array32	%o1,	%g1,	%o4
	mulscc	%l2,	%o7,	%l6
	orcc	%o6,	%i1,	%g4
	lduw	[%l7 + 0x28],	%g7
	edge16ln	%o5,	%i3,	%g5
	st	%f23,	[%l7 + 0x2C]
	edge32	%o0,	%i4,	%g6
	fornot2s	%f28,	%f23,	%f18
	sub	%l0,	0x1819,	%i2
	udiv	%l3,	0x1062,	%o3
	movrlz	%g2,	0x1D1,	%l4
	movg	%xcc,	%o2,	%i7
	and	%i5,	0x1140,	%i0
	nop
	set	0x6C, %i7
	ldsw	[%l7 + %i7],	%i6
	srax	%l5,	%l1,	%g3
	udivx	%o1,	0x178B,	%o4
	edge16l	%l2,	%o7,	%l6
	fmovdvc	%xcc,	%f21,	%f24
	alignaddr	%o6,	%g1,	%i1
	orn	%g4,	0x0FE7,	%o5
	stb	%i3,	[%l7 + 0x66]
	movrne	%g7,	%g5,	%i4
	std	%f12,	[%l7 + 0x30]
	fmovsgu	%xcc,	%f26,	%f31
	move	%icc,	%g6,	%l0
	orncc	%i2,	%o0,	%o3
	smulcc	%l3,	%g2,	%l4
	edge8l	%i7,	%o2,	%i0
	movle	%xcc,	%i6,	%l5
	mulscc	%i5,	%g3,	%o1
	lduw	[%l7 + 0x24],	%o4
	fmovdvc	%xcc,	%f9,	%f0
	movcs	%xcc,	%l2,	%o7
	addccc	%l6,	0x0626,	%l1
	edge8n	%o6,	%i1,	%g1
	mova	%xcc,	%o5,	%i3
	mova	%icc,	%g7,	%g5
	movg	%xcc,	%i4,	%g6
	std	%f10,	[%l7 + 0x68]
	movvs	%xcc,	%l0,	%g4
	movcs	%icc,	%i2,	%o3
	save %o0, 0x1878, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l4,	%i7,	%g2
	fmovscc	%icc,	%f10,	%f18
	st	%f3,	[%l7 + 0x50]
	and	%i0,	0x1FAA,	%o2
	sra	%i6,	0x07,	%i5
	edge32l	%g3,	%l5,	%o4
	mulx	%l2,	%o1,	%l6
	srax	%o7,	%o6,	%l1
	edge8l	%g1,	%o5,	%i1
	fpadd32s	%f8,	%f8,	%f2
	sllx	%g7,	0x07,	%i3
	orn	%g5,	%i4,	%l0
	subc	%g4,	%g6,	%i2
	sub	%o0,	%o3,	%l3
	sdiv	%l4,	0x126F,	%g2
	sir	0x0A6F
	fmovrslz	%i0,	%f7,	%f3
	srlx	%o2,	0x07,	%i6
	movcc	%icc,	%i7,	%g3
	edge16n	%l5,	%i5,	%l2
	edge16l	%o1,	%l6,	%o4
	andncc	%o6,	%l1,	%o7
	edge16	%g1,	%i1,	%g7
	for	%f24,	%f2,	%f30
	ldd	[%l7 + 0x10],	%f24
	alignaddr	%i3,	%o5,	%g5
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%l0
	edge8l	%i4,	%g6,	%g4
	smulcc	%o0,	0x168E,	%i2
	sdivcc	%l3,	0x0468,	%o3
	udiv	%l4,	0x1834,	%g2
	array32	%o2,	%i6,	%i0
	ld	[%l7 + 0x68],	%f23
	mova	%icc,	%i7,	%l5
	xorcc	%g3,	%l2,	%i5
	sethi	0x01B9,	%o1
	orn	%l6,	%o4,	%l1
	lduw	[%l7 + 0x20],	%o7
	movne	%xcc,	%g1,	%i1
	sra	%g7,	%o6,	%o5
	mulscc	%i3,	0x0055,	%g5
	movvs	%xcc,	%i4,	%l0
	fxnors	%f26,	%f28,	%f1
	edge8n	%g4,	%o0,	%g6
	smulcc	%i2,	%o3,	%l3
	lduh	[%l7 + 0x0C],	%l4
	fmovrsgz	%o2,	%f16,	%f26
	and	%g2,	0x1B84,	%i0
	restore %i6, 0x129D, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f12,	%f12,	%f8
	ldsw	[%l7 + 0x28],	%l5
	fors	%f30,	%f22,	%f24
	movn	%xcc,	%l2,	%i5
	fornot2s	%f7,	%f13,	%f25
	andncc	%g3,	%o1,	%l6
	nop
	set	0x61, %i6
	stb	%o4,	[%l7 + %i6]
	andn	%l1,	%g1,	%i1
	fmovrdlez	%o7,	%f24,	%f22
	fmovscs	%xcc,	%f9,	%f20
	subcc	%o6,	%g7,	%o5
	lduw	[%l7 + 0x0C],	%g5
	subccc	%i3,	%l0,	%i4
	xnor	%g4,	%o0,	%g6
	subcc	%o3,	%i2,	%l4
	edge8n	%o2,	%l3,	%i0
	sth	%g2,	[%l7 + 0x34]
	or	%i6,	%i7,	%l5
	and	%i5,	%g3,	%o1
	fcmped	%fcc2,	%f14,	%f18
	sdivx	%l6,	0x08D3,	%l2
	smul	%o4,	0x030D,	%g1
	fpmerge	%f16,	%f5,	%f16
	edge8l	%l1,	%o7,	%o6
	fmovdvs	%icc,	%f27,	%f15
	fmovrsgz	%i1,	%f27,	%f29
	addc	%o5,	%g7,	%g5
	andncc	%i3,	%i4,	%g4
	xorcc	%l0,	%g6,	%o3
	fpack16	%f14,	%f4
	fone	%f12
	fmovdgu	%xcc,	%f25,	%f2
	sth	%i2,	[%l7 + 0x74]
	add	%l4,	%o0,	%o2
	smul	%l3,	0x07C0,	%g2
	nop
	set	0x60, %i1
	stw	%i6,	[%l7 + %i1]
	fnot2	%f30,	%f18
	udivcc	%i7,	0x0663,	%i0
	alignaddrl	%i5,	%g3,	%l5
	movl	%xcc,	%l6,	%l2
	addcc	%o1,	%o4,	%g1
	addcc	%o7,	0x1078,	%o6
	fzero	%f24
	subc	%l1,	%i1,	%o5
	ldx	[%l7 + 0x10],	%g7
	mova	%xcc,	%i3,	%g5
	movneg	%xcc,	%g4,	%l0
	movrgez	%i4,	0x1BC,	%g6
	movvc	%icc,	%i2,	%o3
	edge8n	%o0,	%o2,	%l3
	movn	%xcc,	%g2,	%i6
	fnot1s	%f14,	%f10
	array8	%i7,	%i0,	%i5
	andncc	%l4,	%g3,	%l5
	andcc	%l2,	0x199E,	%l6
	xnorcc	%o4,	0x0880,	%g1
	ldd	[%l7 + 0x50],	%f24
	movvs	%xcc,	%o7,	%o6
	movrgez	%l1,	0x0F2,	%i1
	edge32n	%o1,	%g7,	%o5
	save %i3, 0x02FC, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%xcc,	%f10,	%f27
	ldub	[%l7 + 0x34],	%l0
	smulcc	%i4,	%g6,	%i2
	fmovrdgez	%o3,	%f2,	%f4
	andcc	%g4,	0x1F38,	%o0
	andcc	%l3,	0x0E4D,	%o2
	subc	%g2,	%i7,	%i0
	movrlz	%i6,	0x225,	%l4
	fcmps	%fcc0,	%f19,	%f1
	andcc	%g3,	0x030D,	%l5
	movre	%i5,	%l2,	%o4
	sdivx	%l6,	0x0D9D,	%o7
	movgu	%xcc,	%o6,	%l1
	edge32n	%i1,	%g1,	%g7
	xorcc	%o1,	%o5,	%i3
	movrgz	%g5,	0x387,	%l0
	andncc	%g6,	%i4,	%i2
	fmovrde	%o3,	%f14,	%f18
	nop
	set	0x6B, %i3
	ldub	[%l7 + %i3],	%g4
	sir	0x174E
	ldub	[%l7 + 0x2A],	%o0
	edge16ln	%l3,	%g2,	%i7
	fmul8x16au	%f11,	%f16,	%f12
	movl	%xcc,	%o2,	%i0
	sll	%l4,	%i6,	%l5
	sll	%g3,	0x02,	%i5
	movneg	%xcc,	%l2,	%o4
	mova	%xcc,	%o7,	%o6
	addccc	%l6,	%l1,	%g1
	movl	%icc,	%i1,	%o1
	udivcc	%o5,	0x0DE4,	%g7
	sub	%i3,	0x1887,	%l0
	orn	%g5,	0x088F,	%i4
	xnorcc	%i2,	0x1975,	%g6
	sdiv	%o3,	0x15E7,	%g4
	ldsh	[%l7 + 0x78],	%l3
	movg	%xcc,	%g2,	%i7
	andcc	%o0,	0x0C88,	%o2
	movgu	%xcc,	%l4,	%i0
	array16	%i6,	%l5,	%i5
	array32	%g3,	%l2,	%o7
	fmovde	%xcc,	%f12,	%f19
	xnor	%o4,	%l6,	%o6
	smulcc	%l1,	%g1,	%i1
	subccc	%o1,	0x1573,	%o5
	movgu	%xcc,	%g7,	%i3
	movn	%xcc,	%l0,	%g5
	xnor	%i4,	0x00D1,	%i2
	lduh	[%l7 + 0x70],	%o3
	movgu	%icc,	%g4,	%g6
	movleu	%icc,	%g2,	%i7
	edge32n	%l3,	%o0,	%o2
	subc	%i0,	%i6,	%l4
	fmul8sux16	%f14,	%f14,	%f10
	orn	%l5,	%i5,	%g3
	movrgez	%o7,	%o4,	%l2
	movneg	%xcc,	%l6,	%l1
	movre	%o6,	%g1,	%o1
	array32	%o5,	%i1,	%g7
	edge8ln	%i3,	%g5,	%i4
	faligndata	%f10,	%f20,	%f6
	movvs	%xcc,	%l0,	%o3
	movrlz	%g4,	%g6,	%g2
	fands	%f11,	%f9,	%f10
	fnot1	%f6,	%f0
	movcs	%icc,	%i7,	%l3
	alignaddrl	%i2,	%o0,	%o2
	orn	%i0,	0x1207,	%l4
	srax	%i6,	%l5,	%i5
	andn	%o7,	0x02C0,	%g3
	edge8ln	%l2,	%o4,	%l1
	xor	%o6,	0x0729,	%g1
	movcs	%xcc,	%l6,	%o1
	fsrc2	%f20,	%f28
	ld	[%l7 + 0x58],	%f30
	sth	%o5,	[%l7 + 0x5E]
	ldsw	[%l7 + 0x40],	%g7
	array8	%i3,	%g5,	%i4
	lduh	[%l7 + 0x76],	%i1
	movne	%xcc,	%l0,	%g4
	movl	%icc,	%g6,	%o3
	stb	%g2,	[%l7 + 0x0C]
	fmovrslz	%l3,	%f30,	%f15
	ldd	[%l7 + 0x18],	%i2
	movcc	%xcc,	%i7,	%o0
	sir	0x0F51
	smulcc	%i0,	%o2,	%l4
	fornot2	%f28,	%f22,	%f2
	fmuld8ulx16	%f11,	%f27,	%f30
	st	%f19,	[%l7 + 0x48]
	movrlez	%l5,	%i5,	%o7
	edge32ln	%i6,	%l2,	%g3
	fzero	%f4
	stw	%l1,	[%l7 + 0x20]
	st	%f20,	[%l7 + 0x54]
	fcmpne32	%f0,	%f6,	%o6
	fsrc2	%f10,	%f26
	fmul8x16	%f24,	%f2,	%f28
	sll	%g1,	%l6,	%o1
	fmovdgu	%xcc,	%f28,	%f7
	ldsb	[%l7 + 0x72],	%o4
	srax	%o5,	%g7,	%i3
	subccc	%i4,	0x0F03,	%g5
	orcc	%i1,	%l0,	%g6
	array8	%o3,	%g2,	%g4
	fmovrde	%i2,	%f0,	%f30
	array32	%l3,	%i7,	%i0
	fmovde	%xcc,	%f13,	%f11
	movcs	%xcc,	%o2,	%o0
	andcc	%l4,	0x1FDC,	%l5
	or	%o7,	%i6,	%i5
	movcc	%icc,	%l2,	%l1
	fpadd32s	%f23,	%f19,	%f28
	and	%g3,	%g1,	%o6
	save %l6, 0x0A3A, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o1,	[%l7 + 0x46]
	movn	%xcc,	%g7,	%o5
	siam	0x0
	movre	%i4,	%g5,	%i1
	fmovsa	%icc,	%f31,	%f2
	sth	%l0,	[%l7 + 0x26]
	fmovdcs	%icc,	%f13,	%f30
	movrne	%i3,	0x360,	%g6
	fnot1	%f2,	%f26
	srlx	%o3,	0x01,	%g4
	fcmple16	%f20,	%f24,	%i2
	sub	%l3,	0x070F,	%i7
	movrlz	%i0,	%g2,	%o2
	nop
	set	0x78, %g3
	ldx	[%l7 + %g3],	%l4
	sdivx	%l5,	0x0DCA,	%o7
	movvc	%xcc,	%o0,	%i6
	and	%i5,	%l1,	%g3
	fmovdcc	%icc,	%f21,	%f6
	fmovscs	%xcc,	%f26,	%f6
	add	%g1,	%l2,	%o6
	movl	%xcc,	%l6,	%o4
	sir	0x1CDC
	fand	%f6,	%f8,	%f18
	edge16l	%o1,	%o5,	%i4
	fmul8ulx16	%f8,	%f20,	%f24
	edge8	%g5,	%i1,	%l0
	smulcc	%i3,	0x19BA,	%g7
	sth	%o3,	[%l7 + 0x6C]
	edge32ln	%g4,	%g6,	%i2
	array8	%l3,	%i7,	%i0
	popc	0x07E5,	%o2
	movneg	%icc,	%l4,	%g2
	edge8l	%l5,	%o7,	%o0
	edge32l	%i6,	%l1,	%g3
	fcmpgt16	%f16,	%f6,	%g1
	alignaddr	%l2,	%i5,	%l6
	fpack16	%f8,	%f7
	mova	%xcc,	%o4,	%o1
	movle	%icc,	%o5,	%o6
	movneg	%xcc,	%i4,	%g5
	movneg	%xcc,	%i1,	%l0
	movgu	%icc,	%g7,	%i3
	movl	%icc,	%g4,	%g6
	st	%f22,	[%l7 + 0x58]
	udivcc	%i2,	0x07D0,	%o3
	sdiv	%i7,	0x00A8,	%l3
	xnorcc	%o2,	%i0,	%g2
	movcc	%xcc,	%l4,	%o7
	fnands	%f19,	%f28,	%f9
	fornot1s	%f14,	%f22,	%f24
	fzeros	%f19
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	addcc	%l1,	0x1A99,	%i6
	subc	%g1,	%l2,	%g3
	movl	%xcc,	%l6,	%i5
	fmovdge	%icc,	%f8,	%f25
	movrlz	%o1,	0x29B,	%o5
	fmul8x16	%f28,	%f8,	%f10
	lduh	[%l7 + 0x18],	%o4
	srax	%i4,	%g5,	%i1
	ld	[%l7 + 0x64],	%f30
	fmovrsgez	%o6,	%f18,	%f31
	movne	%xcc,	%l0,	%i3
	fzeros	%f8
	smulcc	%g7,	0x1D49,	%g4
	fcmpgt16	%f30,	%f26,	%i2
	fmovsne	%icc,	%f0,	%f13
	addc	%o3,	0x059C,	%g6
	st	%f29,	[%l7 + 0x4C]
	alignaddr	%l3,	%i7,	%o2
	movcs	%icc,	%g2,	%i0
	stx	%o7,	[%l7 + 0x58]
	fmovrdlez	%l5,	%f22,	%f22
	movvs	%icc,	%l4,	%o0
	fmul8x16au	%f22,	%f11,	%f22
	movgu	%icc,	%l1,	%g1
	ldx	[%l7 + 0x58],	%l2
	edge32n	%g3,	%i6,	%i5
	nop
	set	0x3E, %o7
	sth	%o1,	[%l7 + %o7]
	ldub	[%l7 + 0x7A],	%o5
	movne	%icc,	%o4,	%l6
	sth	%g5,	[%l7 + 0x74]
	smul	%i1,	0x1266,	%o6
	fmovdleu	%xcc,	%f11,	%f13
	fmovspos	%icc,	%f28,	%f31
	fpadd16s	%f6,	%f11,	%f18
	array32	%l0,	%i3,	%g7
	movvs	%icc,	%i4,	%i2
	sth	%g4,	[%l7 + 0x4C]
	movrne	%g6,	0x31A,	%o3
	orncc	%i7,	%l3,	%o2
	fabss	%f30,	%f15
	edge16l	%g2,	%o7,	%i0
	restore %l4, %l5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f23,	%f25,	%f12
	fsrc1	%f28,	%f22
	fmovsle	%xcc,	%f11,	%f21
	movgu	%xcc,	%g1,	%l2
	edge16n	%g3,	%o0,	%i5
	edge32n	%i6,	%o5,	%o4
	array8	%l6,	%g5,	%o1
	xor	%i1,	%o6,	%i3
	sllx	%l0,	%g7,	%i2
	andn	%g4,	0x0D72,	%i4
	nop
	set	0x16, %l0
	lduh	[%l7 + %l0],	%g6
	edge32l	%i7,	%l3,	%o3
	edge16n	%g2,	%o7,	%o2
	movcs	%icc,	%i0,	%l4
	movrne	%l5,	0x3EC,	%l1
	stw	%g1,	[%l7 + 0x54]
	fornot1s	%f16,	%f10,	%f21
	mulscc	%l2,	0x16A3,	%o0
	fcmpeq32	%f28,	%f8,	%i5
	fmovdgu	%icc,	%f6,	%f10
	alignaddr	%i6,	%o5,	%o4
	edge16n	%g3,	%l6,	%g5
	sdivcc	%i1,	0x10A7,	%o1
	mulscc	%o6,	%i3,	%g7
	edge32	%l0,	%i2,	%g4
	edge16	%g6,	%i7,	%i4
	movl	%xcc,	%o3,	%g2
	fmovrsne	%o7,	%f13,	%f13
	movrgz	%l3,	0x347,	%o2
	sdiv	%i0,	0x11C6,	%l5
	ldsh	[%l7 + 0x14],	%l1
	movg	%xcc,	%g1,	%l2
	array8	%o0,	%i5,	%i6
	sdivx	%l4,	0x0D21,	%o4
	nop
	set	0x27, %g1
	ldub	[%l7 + %g1],	%g3
	movl	%icc,	%o5,	%l6
	xnor	%g5,	%i1,	%o6
	movrlz	%i3,	%o1,	%l0
	movleu	%xcc,	%g7,	%g4
	fxors	%f16,	%f19,	%f23
	ldub	[%l7 + 0x48],	%g6
	orcc	%i7,	0x09A7,	%i2
	fcmpes	%fcc3,	%f7,	%f12
	addc	%i4,	0x10D7,	%g2
	edge16	%o7,	%l3,	%o3
	stw	%i0,	[%l7 + 0x18]
	movvs	%icc,	%l5,	%l1
	edge32n	%g1,	%o2,	%o0
	srax	%l2,	%i5,	%l4
	addc	%i6,	0x1076,	%o4
	edge8l	%o5,	%l6,	%g5
	umulcc	%i1,	%g3,	%o6
	edge8n	%o1,	%l0,	%g7
	fcmpeq32	%f22,	%f22,	%i3
	fcmpne16	%f30,	%f6,	%g6
	edge16	%g4,	%i7,	%i4
	ldd	[%l7 + 0x40],	%i2
	movrne	%g2,	%l3,	%o3
	ldsb	[%l7 + 0x3D],	%i0
	fmovd	%f20,	%f8
	movrgz	%o7,	%l5,	%g1
	udiv	%l1,	0x104F,	%o0
	addcc	%l2,	0x0A24,	%o2
	fmovscs	%icc,	%f7,	%f12
	fornot2	%f28,	%f16,	%f2
	ldd	[%l7 + 0x38],	%f12
	edge16l	%i5,	%l4,	%o4
	fpmerge	%f10,	%f11,	%f12
	or	%o5,	%i6,	%l6
	movneg	%icc,	%i1,	%g5
	udivcc	%o6,	0x133D,	%o1
	subccc	%l0,	0x0438,	%g7
	movre	%i3,	0x313,	%g6
	movcc	%xcc,	%g3,	%i7
	std	%f10,	[%l7 + 0x38]
	addcc	%i4,	0x1714,	%i2
	subcc	%g2,	0x0900,	%l3
	fmovspos	%icc,	%f7,	%f26
	sdiv	%o3,	0x1861,	%i0
	mulscc	%g4,	0x0BB4,	%l5
	srl	%g1,	0x04,	%l1
	srl	%o0,	%l2,	%o7
	sir	0x0203
	fxors	%f2,	%f16,	%f26
	movgu	%icc,	%o2,	%l4
	move	%icc,	%i5,	%o4
	movrne	%i6,	%l6,	%o5
	fpadd16s	%f12,	%f4,	%f19
	movl	%xcc,	%g5,	%o6
	fones	%f1
	edge32n	%o1,	%i1,	%g7
	fexpand	%f27,	%f22
	ldd	[%l7 + 0x30],	%f0
	fmovdcc	%icc,	%f18,	%f23
	popc	0x00A4,	%l0
	stw	%g6,	[%l7 + 0x5C]
	edge16	%i3,	%i7,	%i4
	sllx	%g3,	%g2,	%l3
	std	%f4,	[%l7 + 0x68]
	stw	%o3,	[%l7 + 0x6C]
	fmovs	%f3,	%f17
	fmovsge	%xcc,	%f13,	%f16
	sdivx	%i0,	0x03D8,	%i2
	fmovsle	%icc,	%f1,	%f19
	std	%f2,	[%l7 + 0x48]
	edge16ln	%l5,	%g4,	%g1
	fpack32	%f4,	%f6,	%f20
	xorcc	%o0,	%l2,	%l1
	udivcc	%o7,	0x0743,	%o2
	movrgz	%i5,	0x117,	%l4
	addc	%i6,	0x1A4B,	%o4
	stb	%l6,	[%l7 + 0x67]
	movrgez	%g5,	%o6,	%o1
	fand	%f10,	%f4,	%f20
	fpadd16	%f12,	%f2,	%f4
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	mova	%xcc,	%g7,	%l0
	umul	%i3,	%g6,	%i7
	move	%xcc,	%i4,	%g2
	srlx	%l3,	0x17,	%o3
	edge8l	%i0,	%i2,	%l5
	srax	%g3,	0x10,	%g1
	fpackfix	%f12,	%f2
	mulx	%g4,	0x175B,	%l2
	fmul8x16au	%f21,	%f22,	%f16
	subc	%l1,	0x02E0,	%o0
	fand	%f18,	%f0,	%f6
	fsrc2s	%f26,	%f23
	umul	%o7,	0x159C,	%i5
	fcmpeq16	%f0,	%f6,	%l4
	edge32ln	%o2,	%o4,	%l6
	sllx	%g5,	0x1B,	%i6
	stw	%o1,	[%l7 + 0x28]
	addcc	%o6,	%i1,	%g7
	stx	%o5,	[%l7 + 0x10]
	ldub	[%l7 + 0x7F],	%l0
	edge32l	%i3,	%i7,	%g6
	andn	%g2,	0x022E,	%i4
	fmuld8ulx16	%f5,	%f19,	%f0
	umul	%o3,	0x1005,	%l3
	fmovsl	%xcc,	%f15,	%f5
	mulx	%i0,	0x14AF,	%i2
	save %g3, %g1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g4,	0x0798,	%l2
	sdiv	%l1,	0x0EB4,	%o0
	ldsh	[%l7 + 0x2E],	%o7
	edge32	%l4,	%i5,	%o4
	fpadd32s	%f26,	%f25,	%f9
	fmovrse	%o2,	%f20,	%f14
	srl	%g5,	0x0A,	%l6
	fmovrsne	%o1,	%f21,	%f31
	sdiv	%i6,	0x1841,	%i1
	fxnors	%f14,	%f3,	%f14
	movneg	%xcc,	%o6,	%g7
	popc	%l0,	%i3
	fandnot1	%f0,	%f12,	%f30
	edge8n	%i7,	%o5,	%g6
	fmovsgu	%xcc,	%f11,	%f0
	fmovsleu	%icc,	%f3,	%f26
	fpadd16s	%f28,	%f5,	%f1
	xor	%i4,	%g2,	%l3
	addcc	%i0,	%o3,	%i2
	sub	%g1,	0x1297,	%l5
	movpos	%xcc,	%g3,	%l2
	move	%xcc,	%g4,	%l1
	movcc	%xcc,	%o7,	%o0
	ld	[%l7 + 0x08],	%f30
	movcs	%icc,	%i5,	%o4
	nop
	set	0x14, %l2
	lduh	[%l7 + %l2],	%o2
	lduw	[%l7 + 0x18],	%g5
	srax	%l6,	0x11,	%o1
	mulscc	%i6,	%i1,	%l4
	movvs	%icc,	%o6,	%g7
	fmul8x16au	%f19,	%f3,	%f26
	array32	%i3,	%i7,	%o5
	fpsub32s	%f22,	%f29,	%f10
	sdivcc	%g6,	0x1D61,	%i4
	movn	%icc,	%g2,	%l0
	fpmerge	%f2,	%f15,	%f18
	popc	0x1161,	%i0
	edge32	%l3,	%i2,	%g1
	andn	%o3,	0x174B,	%g3
	fmovrslez	%l2,	%f24,	%f17
	fmovrsne	%g4,	%f25,	%f14
	sll	%l1,	0x19,	%o7
	ld	[%l7 + 0x54],	%f31
	udiv	%l5,	0x123A,	%i5
	fmovdl	%icc,	%f12,	%f20
	sdivcc	%o4,	0x13A1,	%o2
	sethi	0x0A96,	%o0
	movvs	%icc,	%l6,	%o1
	movvc	%icc,	%g5,	%i1
	add	%i6,	%l4,	%g7
	movvc	%icc,	%i3,	%o6
	stb	%i7,	[%l7 + 0x76]
	fnors	%f30,	%f20,	%f15
	srax	%g6,	0x1C,	%i4
	popc	%o5,	%l0
	nop
	set	0x28, %o4
	std	%f28,	[%l7 + %o4]
	smulcc	%g2,	%i0,	%l3
	fsrc2s	%f23,	%f13
	fmovrde	%g1,	%f16,	%f10
	smulcc	%o3,	%i2,	%g3
	ldx	[%l7 + 0x10],	%g4
	umul	%l1,	%o7,	%l2
	sll	%l5,	0x0F,	%o4
	udiv	%i5,	0x01AE,	%o0
	movrne	%l6,	%o2,	%g5
	andncc	%o1,	%i6,	%l4
	edge16l	%i1,	%i3,	%o6
	ldsw	[%l7 + 0x48],	%g7
	movge	%xcc,	%i7,	%g6
	smulcc	%i4,	%l0,	%g2
	edge8	%o5,	%i0,	%g1
	movrlz	%o3,	0x041,	%l3
	orn	%g3,	%g4,	%i2
	fnors	%f28,	%f26,	%f6
	movrlez	%l1,	0x096,	%o7
	sllx	%l2,	%o4,	%l5
	smul	%i5,	0x1C59,	%l6
	movne	%icc,	%o2,	%o0
	ldd	[%l7 + 0x48],	%o0
	bshuffle	%f14,	%f16,	%f0
	movn	%icc,	%i6,	%g5
	nop
	set	0x54, %i0
	stw	%l4,	[%l7 + %i0]
	fmovsl	%xcc,	%f15,	%f7
	fmovd	%f28,	%f8
	sdivx	%i3,	0x0D21,	%i1
	movpos	%xcc,	%o6,	%i7
	fpsub32	%f28,	%f30,	%f4
	fmovsg	%xcc,	%f14,	%f15
	orcc	%g7,	0x1467,	%i4
	or	%l0,	%g2,	%o5
	fmuld8sux16	%f30,	%f31,	%f20
	alignaddrl	%i0,	%g6,	%o3
	fpsub16	%f28,	%f14,	%f4
	orn	%g1,	%l3,	%g4
	xor	%i2,	0x125B,	%g3
	fmovdpos	%icc,	%f12,	%f10
	subc	%o7,	%l2,	%l1
	edge32n	%l5,	%o4,	%i5
	fornot1	%f6,	%f8,	%f30
	movrlez	%l6,	%o2,	%o0
	edge32	%o1,	%g5,	%l4
	popc	%i3,	%i6
	srl	%o6,	0x1D,	%i7
	movre	%i1,	0x019,	%i4
	fnands	%f14,	%f11,	%f23
	fmovsge	%xcc,	%f22,	%f25
	fcmpne32	%f24,	%f14,	%g7
	fcmpeq16	%f26,	%f10,	%l0
	movle	%icc,	%g2,	%o5
	sir	0x10A3
	movne	%xcc,	%g6,	%o3
	movle	%icc,	%g1,	%i0
	udiv	%g4,	0x0123,	%i2
	fpadd32	%f24,	%f10,	%f10
	edge16	%l3,	%g3,	%o7
	movrlz	%l2,	0x123,	%l5
	movgu	%xcc,	%l1,	%i5
	movre	%o4,	0x2C4,	%l6
	ldsw	[%l7 + 0x60],	%o2
	fmul8ulx16	%f8,	%f20,	%f10
	stw	%o1,	[%l7 + 0x20]
	mulx	%g5,	%l4,	%i3
	nop
	set	0x08, %l4
	ldx	[%l7 + %l4],	%o0
	xor	%i6,	0x1EE7,	%o6
	sir	0x177C
	andn	%i7,	%i1,	%i4
	xorcc	%g7,	0x1E56,	%g2
	smulcc	%l0,	%g6,	%o3
	andn	%o5,	0x07F3,	%i0
	fabss	%f6,	%f15
	fnegd	%f20,	%f14
	movpos	%icc,	%g4,	%i2
	fmovdl	%xcc,	%f5,	%f15
	mulx	%l3,	%g3,	%g1
	ldsb	[%l7 + 0x3A],	%o7
	movvc	%icc,	%l5,	%l2
	fors	%f5,	%f31,	%f28
	sra	%l1,	%o4,	%i5
	lduh	[%l7 + 0x60],	%l6
	fones	%f12
	movrne	%o2,	%g5,	%l4
	movg	%xcc,	%i3,	%o1
	or	%o0,	0x11B9,	%i6
	array8	%i7,	%i1,	%i4
	movrlez	%o6,	%g2,	%g7
	udivx	%g6,	0x0F1E,	%o3
	sdivcc	%o5,	0x0767,	%l0
	subccc	%i0,	0x13E4,	%i2
	sdiv	%g4,	0x0ED0,	%l3
	fmovdvs	%xcc,	%f16,	%f28
	sdivx	%g3,	0x08A0,	%o7
	edge32l	%l5,	%g1,	%l1
	st	%f3,	[%l7 + 0x74]
	edge32l	%l2,	%i5,	%o4
	lduh	[%l7 + 0x72],	%o2
	fpadd16s	%f21,	%f8,	%f22
	movneg	%icc,	%g5,	%l6
	sdiv	%i3,	0x142F,	%l4
	movg	%icc,	%o0,	%o1
	ld	[%l7 + 0x10],	%f16
	for	%f16,	%f8,	%f18
	fpmerge	%f7,	%f18,	%f12
	edge32n	%i6,	%i1,	%i7
	movrlez	%o6,	%g2,	%g7
	fmovdleu	%xcc,	%f13,	%f27
	array8	%g6,	%o3,	%o5
	movge	%icc,	%i4,	%i0
	ldd	[%l7 + 0x68],	%l0
	movge	%xcc,	%g4,	%l3
	fmul8x16au	%f20,	%f27,	%f22
	fnot1	%f0,	%f10
	mulx	%i2,	0x0637,	%g3
	fnand	%f6,	%f16,	%f12
	edge16ln	%o7,	%g1,	%l5
	edge16l	%l1,	%i5,	%o4
	stb	%o2,	[%l7 + 0x46]
	restore %l2, 0x110B, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x48],	%g4
	udivcc	%l4,	0x171A,	%i3
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	fornot1	%f14,	%f18,	%f22
	move	%xcc,	%i7,	%i1
	fmul8x16al	%f0,	%f24,	%f10
	xorcc	%g2,	0x0257,	%o6
	addccc	%g7,	0x08BC,	%o3
	movle	%icc,	%g6,	%i4
	edge8	%i0,	%l0,	%g4
	save %l3, %o5, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x58],	%o7
	xorcc	%g3,	%g1,	%l5
	fpsub16	%f24,	%f28,	%f8
	edge16ln	%i5,	%o4,	%l1
	edge16n	%o2,	%l2,	%l6
	ldsh	[%l7 + 0x40],	%g5
	ldx	[%l7 + 0x30],	%l4
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%o0
	nop
	set	0x18, %l3
	stx	%i3,	[%l7 + %l3]
	fnot1	%f12,	%f24
	mulx	%i6,	0x04E7,	%i7
	orncc	%i1,	0x02BE,	%g2
	fmul8x16	%f14,	%f22,	%f18
	nop
	set	0x34, %l6
	stw	%o1,	[%l7 + %l6]
	addcc	%g7,	0x166D,	%o6
	umulcc	%g6,	%o3,	%i4
	udivx	%i0,	0x115D,	%g4
	fnors	%f28,	%f22,	%f7
	fcmpeq16	%f24,	%f26,	%l0
	ldub	[%l7 + 0x77],	%l3
	movle	%icc,	%i2,	%o5
	fmovsg	%xcc,	%f4,	%f4
	edge32	%g3,	%g1,	%l5
	ldd	[%l7 + 0x60],	%o6
	umul	%i5,	0x06D7,	%l1
	srax	%o4,	0x10,	%o2
	ldd	[%l7 + 0x08],	%f16
	sdivx	%l6,	0x185D,	%l2
	sth	%g5,	[%l7 + 0x52]
	move	%icc,	%l4,	%o0
	stb	%i3,	[%l7 + 0x29]
	nop
	set	0x5E, %o0
	stb	%i7,	[%l7 + %o0]
	fcmple16	%f0,	%f12,	%i1
	umul	%i6,	%o1,	%g2
	sllx	%g7,	0x18,	%o6
	ldd	[%l7 + 0x20],	%f20
	edge32	%g6,	%i4,	%o3
	sir	0x17AD
	sethi	0x1D30,	%g4
	alignaddrl	%i0,	%l0,	%l3
	add	%o5,	%i2,	%g1
	lduw	[%l7 + 0x1C],	%l5
	sll	%g3,	0x0F,	%o7
	subccc	%l1,	0x0AED,	%i5
	smul	%o2,	%o4,	%l6
	ld	[%l7 + 0x20],	%f4
	stb	%l2,	[%l7 + 0x6F]
	fornot2s	%f31,	%f24,	%f10
	addccc	%l4,	0x18F2,	%g5
	stb	%i3,	[%l7 + 0x25]
	fnot1s	%f6,	%f23
	movle	%xcc,	%o0,	%i1
	sdivcc	%i7,	0x036F,	%i6
	fpsub32s	%f11,	%f3,	%f17
	andncc	%g2,	%g7,	%o6
	edge16l	%o1,	%g6,	%o3
	movpos	%icc,	%i4,	%g4
	movl	%icc,	%l0,	%i0
	movpos	%xcc,	%o5,	%i2
	ldub	[%l7 + 0x15],	%g1
	edge8ln	%l5,	%l3,	%o7
	edge32ln	%l1,	%g3,	%o2
	move	%icc,	%i5,	%l6
	srax	%l2,	0x1C,	%l4
	orn	%g5,	0x18E7,	%o4
	add	%i3,	0x15F8,	%i1
	fcmpne32	%f10,	%f26,	%o0
	xorcc	%i7,	%i6,	%g2
	movrgz	%g7,	0x282,	%o6
	andncc	%g6,	%o1,	%o3
	std	%f6,	[%l7 + 0x70]
	edge8n	%i4,	%g4,	%i0
	fcmpes	%fcc3,	%f18,	%f9
	addcc	%o5,	0x12D2,	%l0
	movvc	%icc,	%g1,	%l5
	ldsh	[%l7 + 0x14],	%l3
	edge32n	%o7,	%i2,	%l1
	fnand	%f18,	%f6,	%f14
	fmovrde	%o2,	%f12,	%f26
	orncc	%i5,	%g3,	%l2
	movl	%icc,	%l4,	%g5
	fnegd	%f12,	%f14
	fmovrslez	%l6,	%f31,	%f30
	fzeros	%f14
	mova	%icc,	%o4,	%i1
	ldsh	[%l7 + 0x14],	%o0
	edge32l	%i7,	%i3,	%g2
	mova	%icc,	%g7,	%o6
	movn	%xcc,	%i6,	%g6
	fmovrslez	%o1,	%f28,	%f12
	ldd	[%l7 + 0x68],	%f20
	array8	%o3,	%g4,	%i4
	udivx	%o5,	0x09FD,	%l0
	fxnors	%f27,	%f6,	%f28
	smulcc	%g1,	%i0,	%l3
	srlx	%o7,	%l5,	%l1
	stb	%o2,	[%l7 + 0x77]
	andncc	%i2,	%g3,	%l2
	srax	%l4,	%i5,	%g5
	fcmpeq16	%f20,	%f26,	%o4
	ldsh	[%l7 + 0x2E],	%l6
	movne	%xcc,	%i1,	%o0
	st	%f28,	[%l7 + 0x5C]
	movcc	%xcc,	%i7,	%i3
	orn	%g7,	0x1672,	%o6
	udiv	%g2,	0x1864,	%i6
	fsrc1s	%f5,	%f1
	move	%xcc,	%g6,	%o1
	std	%f30,	[%l7 + 0x18]
	movvc	%icc,	%g4,	%o3
	ldd	[%l7 + 0x18],	%o4
	and	%l0,	0x0AA8,	%g1
	subc	%i4,	%i0,	%l3
	movge	%xcc,	%o7,	%l1
	fzeros	%f28
	ldd	[%l7 + 0x08],	%f26
	edge16ln	%o2,	%l5,	%i2
	andn	%g3,	%l2,	%i5
	ldd	[%l7 + 0x60],	%f20
	nop
	set	0x48, %l5
	lduh	[%l7 + %l5],	%g5
	movcc	%icc,	%o4,	%l6
	st	%f9,	[%l7 + 0x74]
	ldx	[%l7 + 0x40],	%l4
	umulcc	%o0,	%i1,	%i7
	sdivcc	%i3,	0x1EE9,	%g7
	fmovrsgz	%g2,	%f18,	%f14
	move	%xcc,	%i6,	%g6
	srl	%o1,	%g4,	%o6
	fnand	%f8,	%f0,	%f6
	array16	%o3,	%o5,	%l0
	edge16	%g1,	%i0,	%i4
	sllx	%l3,	0x01,	%o7
	fmovde	%xcc,	%f27,	%f5
	or	%o2,	%l5,	%l1
	nop
	set	0x38, %o3
	stx	%g3,	[%l7 + %o3]
	andn	%l2,	%i5,	%i2
	fsrc2s	%f12,	%f3
	ld	[%l7 + 0x30],	%f31
	edge16ln	%g5,	%l6,	%l4
	udiv	%o4,	0x17E7,	%i1
	movrgz	%o0,	0x0EA,	%i3
	sdivcc	%i7,	0x16C5,	%g7
	edge16l	%i6,	%g2,	%o1
	std	%f28,	[%l7 + 0x78]
	fmovdge	%icc,	%f7,	%f9
	edge32ln	%g4,	%g6,	%o3
	fmovscs	%xcc,	%f31,	%f14
	smulcc	%o5,	%l0,	%o6
	movre	%g1,	0x247,	%i0
	fxor	%f14,	%f18,	%f0
	fpackfix	%f4,	%f24
	sub	%i4,	%o7,	%l3
	sra	%o2,	0x14,	%l5
	ldd	[%l7 + 0x70],	%f18
	array16	%g3,	%l2,	%l1
	udivcc	%i5,	0x14F8,	%g5
	movcc	%xcc,	%l6,	%i2
	fzero	%f8
	udivx	%o4,	0x0790,	%i1
	sub	%o0,	%l4,	%i7
	mulx	%i3,	%g7,	%i6
	movg	%xcc,	%o1,	%g4
	pdist	%f6,	%f8,	%f24
	srax	%g6,	0x0D,	%o3
	sdivcc	%g2,	0x1E31,	%o5
	array8	%l0,	%o6,	%g1
	umulcc	%i0,	%o7,	%l3
	fpack32	%f20,	%f30,	%f20
	movrgez	%i4,	0x23A,	%l5
	orncc	%g3,	%o2,	%l2
	edge8n	%l1,	%i5,	%g5
	mulscc	%i2,	%l6,	%o4
	movneg	%icc,	%o0,	%i1
	add	%i7,	%i3,	%l4
	nop
	set	0x70, %o5
	ldx	[%l7 + %o5],	%g7
	edge16ln	%o1,	%i6,	%g4
	fnands	%f7,	%f22,	%f24
	orcc	%g6,	%o3,	%o5
	edge32n	%g2,	%l0,	%o6
	xor	%i0,	0x1FE9,	%g1
	stx	%o7,	[%l7 + 0x70]
	sethi	0x092B,	%l3
	orncc	%i4,	0x13DC,	%g3
	fmovrdlz	%o2,	%f24,	%f18
	array32	%l2,	%l5,	%l1
	fmovdne	%xcc,	%f22,	%f23
	movle	%xcc,	%g5,	%i5
	st	%f8,	[%l7 + 0x0C]
	edge8	%l6,	%i2,	%o0
	fcmple32	%f20,	%f4,	%o4
	subccc	%i7,	%i3,	%l4
	edge32	%g7,	%o1,	%i1
	addcc	%i6,	0x08C1,	%g6
	sub	%o3,	0x11AC,	%o5
	edge16	%g2,	%l0,	%g4
	ldx	[%l7 + 0x20],	%i0
	fcmpes	%fcc2,	%f13,	%f27
	srax	%o6,	%g1,	%o7
	movrne	%l3,	0x1A5,	%i4
	std	%f0,	[%l7 + 0x48]
	movne	%icc,	%o2,	%g3
	fand	%f30,	%f2,	%f12
	fandnot1	%f18,	%f26,	%f4
	edge32l	%l5,	%l1,	%l2
	edge16n	%g5,	%l6,	%i5
	fmul8ulx16	%f14,	%f6,	%f22
	sir	0x0167
	array32	%i2,	%o4,	%i7
	stw	%i3,	[%l7 + 0x40]
	sir	0x07BF
	fsrc2	%f20,	%f12
	fmul8x16al	%f12,	%f24,	%f8
	fxor	%f16,	%f20,	%f18
	ldx	[%l7 + 0x38],	%l4
	subcc	%o0,	0x006D,	%g7
	ld	[%l7 + 0x60],	%f30
	movneg	%icc,	%i1,	%i6
	restore %g6, %o1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g2,	%o5,	%l0
	ld	[%l7 + 0x40],	%f25
	fmovrsgez	%g4,	%f7,	%f9
	edge16ln	%i0,	%g1,	%o6
	mova	%xcc,	%o7,	%i4
	and	%l3,	%g3,	%o2
	edge32	%l1,	%l5,	%g5
	addccc	%l2,	0x1813,	%l6
	sdivcc	%i2,	0x1A68,	%o4
	movcc	%xcc,	%i5,	%i7
	addcc	%i3,	%o0,	%g7
	edge32l	%l4,	%i6,	%g6
	fmovsn	%xcc,	%f7,	%f26
	fexpand	%f11,	%f10
	edge8	%o1,	%i1,	%o3
	movge	%icc,	%g2,	%o5
	andn	%g4,	%i0,	%l0
	mulx	%o6,	0x18BA,	%o7
	fpsub16	%f0,	%f14,	%f24
	movrgz	%g1,	0x3AE,	%l3
	sir	0x0F47
	fmovdgu	%xcc,	%f16,	%f31
	mulx	%g3,	%i4,	%l1
	ldsb	[%l7 + 0x2C],	%o2
	ldsb	[%l7 + 0x59],	%g5
	udivcc	%l2,	0x13D5,	%l6
	sdivcc	%l5,	0x16FA,	%o4
	ld	[%l7 + 0x24],	%f22
	movg	%icc,	%i2,	%i7
	sethi	0x11F1,	%i5
	mulx	%o0,	0x1068,	%g7
	subcc	%l4,	0x0226,	%i3
	array32	%i6,	%o1,	%g6
	xnorcc	%o3,	0x1A53,	%i1
	ldsw	[%l7 + 0x54],	%g2
	for	%f30,	%f0,	%f2
	mova	%xcc,	%g4,	%i0
	sth	%l0,	[%l7 + 0x44]
	movgu	%icc,	%o5,	%o6
	sir	0x038D
	movrgez	%g1,	0x18F,	%l3
	umul	%o7,	0x0B1E,	%g3
	sth	%l1,	[%l7 + 0x74]
	fpack32	%f12,	%f16,	%f8
	lduw	[%l7 + 0x10],	%o2
	addcc	%i4,	0x1989,	%g5
	fpadd16	%f20,	%f24,	%f12
	movleu	%xcc,	%l2,	%l5
	edge32	%o4,	%l6,	%i7
	fmovdleu	%icc,	%f30,	%f30
	fcmpgt32	%f0,	%f14,	%i2
	fands	%f10,	%f5,	%f4
	fmovsle	%xcc,	%f0,	%f13
	movne	%icc,	%o0,	%g7
	smul	%l4,	0x1C8B,	%i5
	movge	%xcc,	%i6,	%i3
	fcmpeq32	%f30,	%f2,	%g6
	sllx	%o1,	0x1D,	%i1
	mulx	%o3,	0x1885,	%g4
	fmovrdgez	%i0,	%f0,	%f16
	andncc	%g2,	%l0,	%o6
	movrlz	%g1,	0x01C,	%l3
	fmovsvc	%icc,	%f4,	%f22
	smul	%o7,	%g3,	%o5
	movrgz	%o2,	0x120,	%l1
	fornot1	%f14,	%f2,	%f10
	ldsh	[%l7 + 0x26],	%i4
	edge8n	%l2,	%g5,	%o4
	edge32ln	%l5,	%l6,	%i7
	edge32l	%o0,	%i2,	%g7
	save %i5, 0x1D6A, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l4,	0x072F,	%i3
	edge16	%o1,	%g6,	%o3
	movn	%xcc,	%i1,	%i0
	fsrc1s	%f24,	%f15
	ldd	[%l7 + 0x58],	%f30
	ldd	[%l7 + 0x58],	%g2
	sth	%g4,	[%l7 + 0x5E]
	stx	%l0,	[%l7 + 0x28]
	nop
	set	0x4C, %g6
	ldsh	[%l7 + %g6],	%o6
	movpos	%xcc,	%g1,	%l3
	movne	%xcc,	%g3,	%o7
	move	%xcc,	%o5,	%o2
	sdivx	%i4,	0x0973,	%l2
	ldd	[%l7 + 0x58],	%f10
	movn	%icc,	%g5,	%o4
	std	%f20,	[%l7 + 0x60]
	subccc	%l5,	%l1,	%l6
	stb	%i7,	[%l7 + 0x14]
	movle	%icc,	%i2,	%o0
	umulcc	%g7,	0x15BA,	%i5
	edge32n	%i6,	%i3,	%o1
	edge32l	%l4,	%g6,	%i1
	movrlz	%o3,	0x22B,	%i0
	smulcc	%g2,	%l0,	%o6
	edge16	%g1,	%g4,	%l3
	lduh	[%l7 + 0x50],	%o7
	smulcc	%g3,	0x13AB,	%o5
	movrgez	%i4,	%l2,	%o2
	fnands	%f12,	%f6,	%f6
	movle	%icc,	%g5,	%o4
	fmovdcc	%xcc,	%f8,	%f9
	fmovrse	%l1,	%f10,	%f30
	ld	[%l7 + 0x10],	%f21
	fmovd	%f0,	%f26
	andn	%l6,	0x1151,	%l5
	sir	0x0827
	fpsub16	%f6,	%f28,	%f14
	sll	%i7,	0x08,	%o0
	movcc	%icc,	%g7,	%i5
	movvc	%xcc,	%i2,	%i6
	fmovsleu	%icc,	%f0,	%f0
	fornot1	%f0,	%f26,	%f14
	edge8	%o1,	%i3,	%g6
	movleu	%xcc,	%i1,	%l4
	fnot1	%f6,	%f28
	movcs	%icc,	%i0,	%o3
	fands	%f31,	%f0,	%f16
	edge32l	%g2,	%o6,	%g1
	orncc	%l0,	%g4,	%l3
	fmovrdne	%o7,	%f14,	%f8
	fpsub32s	%f1,	%f31,	%f20
	sir	0x1D35
	smul	%g3,	0x1E93,	%i4
	movrgz	%l2,	%o5,	%g5
	andncc	%o2,	%o4,	%l1
	array32	%l5,	%l6,	%i7
	smulcc	%g7,	%i5,	%i2
	edge32l	%o0,	%i6,	%i3
	sth	%o1,	[%l7 + 0x3E]
	movvs	%xcc,	%i1,	%g6
	movrne	%i0,	%o3,	%l4
	movvc	%xcc,	%g2,	%g1
	ldx	[%l7 + 0x40],	%o6
	edge32n	%g4,	%l0,	%l3
	orncc	%o7,	%i4,	%g3
	sll	%l2,	0x1F,	%o5
	xnor	%o2,	%o4,	%l1
	array16	%l5,	%g5,	%i7
	fmovs	%f28,	%f4
	fmovdvc	%icc,	%f25,	%f14
	fmovspos	%icc,	%f21,	%f26
	edge16	%l6,	%i5,	%g7
	xorcc	%i2,	%o0,	%i6
	xor	%o1,	%i3,	%g6
	smul	%i1,	0x1FA1,	%i0
	umulcc	%o3,	0x1611,	%g2
	edge8n	%l4,	%g1,	%o6
	movgu	%xcc,	%l0,	%g4
	mulscc	%l3,	0x0C03,	%o7
	movvs	%icc,	%g3,	%i4
	fsrc1s	%f3,	%f17
	movn	%xcc,	%o5,	%o2
	sll	%l2,	0x13,	%o4
	addccc	%l1,	%l5,	%g5
	subc	%l6,	%i7,	%g7
	movgu	%icc,	%i2,	%o0
	fornot2s	%f12,	%f28,	%f25
	fnegd	%f4,	%f26
	lduw	[%l7 + 0x1C],	%i5
	andncc	%o1,	%i6,	%i3
	nop
	set	0x2C, %i5
	stw	%g6,	[%l7 + %i5]
	movrne	%i0,	%o3,	%g2
	ldub	[%l7 + 0x49],	%l4
	fmovsge	%icc,	%f24,	%f17
	array16	%g1,	%o6,	%l0
	mova	%icc,	%g4,	%l3
	srl	%i1,	%g3,	%o7
	sth	%o5,	[%l7 + 0x3C]
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	save %l1, %l5, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l6,	0x122D,	%l2
	or	%i7,	%g7,	%o0
	addc	%i5,	%i2,	%o1
	movrgz	%i3,	%i6,	%i0
	xnor	%o3,	0x0484,	%g6
	orcc	%g2,	%g1,	%l4
	fmovsleu	%icc,	%f18,	%f23
	ldd	[%l7 + 0x60],	%f0
	ldd	[%l7 + 0x38],	%f0
	ldsh	[%l7 + 0x10],	%o6
	movcs	%icc,	%l0,	%l3
	sir	0x0D0D
	stw	%i1,	[%l7 + 0x34]
	stx	%g4,	[%l7 + 0x38]
	sethi	0x0CFB,	%o7
	sir	0x0545
	fmovde	%icc,	%f26,	%f5
	sth	%g3,	[%l7 + 0x66]
	edge8l	%o5,	%i4,	%o4
	array8	%l1,	%o2,	%l5
	sll	%l6,	%g5,	%i7
	smul	%l2,	%o0,	%g7
	addc	%i2,	0x0358,	%o1
	fxnor	%f28,	%f28,	%f12
	restore %i5, 0x10C4, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i6,	%o3,	%g6
	fmovsvs	%icc,	%f24,	%f5
	and	%i0,	0x089E,	%g2
	smulcc	%l4,	%g1,	%l0
	smul	%o6,	0x0161,	%l3
	movg	%xcc,	%g4,	%i1
	movleu	%xcc,	%o7,	%o5
	fmovrsgez	%i4,	%f14,	%f24
	orncc	%g3,	0x195C,	%o4
	xnor	%l1,	0x1740,	%l5
	fmovda	%xcc,	%f16,	%f11
	edge32	%l6,	%g5,	%o2
	sdivcc	%i7,	0x0E44,	%o0
	ldx	[%l7 + 0x70],	%g7
	sll	%l2,	%o1,	%i5
	edge32ln	%i2,	%i3,	%i6
	ld	[%l7 + 0x68],	%f22
	fsrc1s	%f4,	%f29
	sdivx	%o3,	0x13B0,	%i0
	sir	0x14D2
	array32	%g2,	%g6,	%l4
	mulx	%g1,	0x0294,	%o6
	fxnors	%f30,	%f3,	%f20
	umulcc	%l3,	%g4,	%l0
	and	%o7,	%i1,	%o5
	lduw	[%l7 + 0x64],	%i4
	fand	%f4,	%f14,	%f26
	fnegd	%f18,	%f6
	fnor	%f20,	%f12,	%f28
	stb	%g3,	[%l7 + 0x64]
	std	%f18,	[%l7 + 0x70]
	ldd	[%l7 + 0x48],	%l0
	smul	%l5,	%l6,	%o4
	fnegs	%f15,	%f6
	popc	0x0A3B,	%o2
	orncc	%g5,	0x10AB,	%o0
	fmovdne	%icc,	%f8,	%f26
	faligndata	%f0,	%f22,	%f16
	addc	%g7,	0x108E,	%l2
	umulcc	%o1,	%i7,	%i5
	andncc	%i3,	%i6,	%o3
	udivx	%i0,	0x14B2,	%g2
	edge8ln	%i2,	%g6,	%l4
	movgu	%icc,	%o6,	%l3
	edge32l	%g4,	%l0,	%o7
	array32	%i1,	%g1,	%o5
	stb	%i4,	[%l7 + 0x43]
	edge32n	%l1,	%l5,	%l6
	sdivx	%g3,	0x02B7,	%o4
	fmovrse	%o2,	%f4,	%f20
	smul	%g5,	%g7,	%o0
	edge32	%l2,	%o1,	%i7
	array16	%i5,	%i6,	%i3
	sdivx	%i0,	0x1D0D,	%g2
	umulcc	%o3,	0x1113,	%g6
	orn	%l4,	%o6,	%l3
	alignaddrl	%i2,	%l0,	%g4
	smulcc	%o7,	%i1,	%g1
	srl	%i4,	0x07,	%o5
	movgu	%icc,	%l1,	%l6
	ldsw	[%l7 + 0x0C],	%g3
	sll	%o4,	0x16,	%l5
	stw	%g5,	[%l7 + 0x64]
	smul	%o2,	0x0138,	%o0
	fxnors	%f8,	%f14,	%f10
	lduh	[%l7 + 0x16],	%l2
	subc	%o1,	%i7,	%i5
	movcc	%icc,	%g7,	%i3
	fnand	%f8,	%f24,	%f4
	srl	%i0,	%g2,	%i6
	movrgz	%o3,	%g6,	%o6
	subcc	%l3,	0x0671,	%l4
	sra	%i2,	0x14,	%l0
	mulx	%o7,	%g4,	%i1
	movneg	%icc,	%i4,	%g1
	sub	%l1,	0x0810,	%o5
	fornot2s	%f0,	%f14,	%f4
	sethi	0x073E,	%g3
	movle	%xcc,	%l6,	%l5
	stb	%g5,	[%l7 + 0x7D]
	fmovdleu	%xcc,	%f10,	%f30
	movneg	%xcc,	%o2,	%o4
	edge32n	%l2,	%o0,	%i7
	edge8ln	%i5,	%g7,	%o1
	st	%f0,	[%l7 + 0x0C]
	xnor	%i3,	%g2,	%i6
	movcc	%xcc,	%o3,	%i0
	ld	[%l7 + 0x78],	%f14
	orcc	%o6,	0x1CC3,	%g6
	ldsw	[%l7 + 0x74],	%l4
	ldd	[%l7 + 0x28],	%i2
	fandnot1s	%f28,	%f27,	%f24
	array32	%l0,	%o7,	%g4
	movcc	%icc,	%i1,	%l3
	popc	%g1,	%i4
	lduh	[%l7 + 0x10],	%l1
	udivcc	%g3,	0x0089,	%o5
	movcs	%xcc,	%l6,	%l5
	fxor	%f2,	%f18,	%f28
	movrgez	%g5,	0x3D0,	%o2
	addcc	%o4,	0x0322,	%l2
	movleu	%xcc,	%o0,	%i7
	andcc	%g7,	0x0D93,	%i5
	ldd	[%l7 + 0x10],	%f26
	xnor	%i3,	%o1,	%g2
	lduw	[%l7 + 0x0C],	%o3
	lduh	[%l7 + 0x32],	%i0
	fpsub32s	%f30,	%f4,	%f29
	fmovsg	%icc,	%f8,	%f14
	sir	0x00AA
	addccc	%o6,	0x0B2E,	%g6
	ldsh	[%l7 + 0x5C],	%l4
	fmovdne	%xcc,	%f29,	%f23
	subcc	%i2,	0x0521,	%l0
	fmovde	%icc,	%f22,	%f1
	fandnot1	%f10,	%f6,	%f10
	or	%i6,	0x0D47,	%g4
	alignaddr	%i1,	%l3,	%g1
	fmovde	%icc,	%f17,	%f22
	edge32ln	%i4,	%l1,	%g3
	fmul8ulx16	%f0,	%f10,	%f6
	sdivx	%o5,	0x0424,	%o7
	sdiv	%l6,	0x0943,	%g5
	ld	[%l7 + 0x18],	%f4
	fmovsle	%icc,	%f21,	%f30
	fmovrsgez	%o2,	%f0,	%f13
	fornot1	%f0,	%f18,	%f12
	edge32l	%o4,	%l2,	%l5
	fmovsgu	%icc,	%f15,	%f16
	array32	%o0,	%g7,	%i5
	subccc	%i7,	%o1,	%g2
	nop
	set	0x14, %o1
	stw	%o3,	[%l7 + %o1]
	movneg	%xcc,	%i3,	%i0
	subcc	%o6,	%l4,	%g6
	fornot2	%f28,	%f20,	%f12
	udivx	%l0,	0x1F01,	%i2
	siam	0x5
	pdist	%f0,	%f6,	%f26
	subccc	%g4,	%i6,	%i1
	udiv	%g1,	0x0B3E,	%i4
	fmovsneg	%xcc,	%f21,	%f31
	popc	0x0EEF,	%l1
	sdivx	%l3,	0x1FFC,	%g3
	movcs	%icc,	%o5,	%l6
	array8	%o7,	%g5,	%o4
	fmul8x16	%f9,	%f10,	%f10
	sub	%o2,	%l2,	%o0
	movle	%icc,	%l5,	%i5
	edge32n	%g7,	%i7,	%g2
	ldd	[%l7 + 0x40],	%f28
	movrne	%o3,	%o1,	%i3
	ldsw	[%l7 + 0x4C],	%o6
	andcc	%i0,	%g6,	%l0
	movpos	%xcc,	%i2,	%l4
	save %g4, %i1, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x7A],	%i4
	movpos	%icc,	%l1,	%l3
	fmovrdgez	%i6,	%f10,	%f0
	fmovse	%xcc,	%f17,	%f10
	add	%g3,	%o5,	%o7
	edge8l	%l6,	%o4,	%o2
	stw	%g5,	[%l7 + 0x5C]
	fmovsgu	%icc,	%f5,	%f13
	orncc	%o0,	%l2,	%l5
	orcc	%i5,	%g7,	%g2
	subc	%o3,	0x1A63,	%i7
	orcc	%i3,	0x0FB8,	%o1
	movre	%o6,	0x147,	%i0
	sdiv	%g6,	0x1E17,	%l0
	movl	%icc,	%i2,	%g4
	popc	0x1B40,	%l4
	srax	%g1,	0x00,	%i4
	fnegs	%f20,	%f5
	edge16l	%i1,	%l3,	%i6
	sir	0x1918
	ld	[%l7 + 0x48],	%f3
	mulscc	%g3,	%l1,	%o5
	popc	0x1F8E,	%o7
	fmovdle	%icc,	%f6,	%f22
	edge16ln	%o4,	%o2,	%l6
	edge16n	%g5,	%o0,	%l5
	array16	%i5,	%g7,	%g2
	std	%f6,	[%l7 + 0x38]
	or	%o3,	%i7,	%i3
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	fmovdge	%xcc,	%f0,	%f0
	srax	%g6,	0x1B,	%o6
	sdivx	%i2,	0x07AA,	%l0
	ldsb	[%l7 + 0x27],	%g4
	andcc	%g1,	%l4,	%i1
	udivcc	%l3,	0x0591,	%i6
	fcmple16	%f6,	%f6,	%g3
	xor	%l1,	%o5,	%i4
	ldsh	[%l7 + 0x14],	%o4
	fmovrslz	%o7,	%f18,	%f24
	fnot1s	%f20,	%f31
	movneg	%icc,	%o2,	%g5
	andcc	%o0,	%l6,	%l5
	sth	%g7,	[%l7 + 0x2E]
	edge8	%g2,	%o3,	%i7
	mulscc	%i3,	%o1,	%l2
	fnot2s	%f27,	%f3
	fmovsvs	%icc,	%f26,	%f27
	movgu	%xcc,	%i5,	%g6
	movrlz	%o6,	0x3BA,	%i2
	fmovdge	%icc,	%f29,	%f18
	movrne	%l0,	0x353,	%i0
	array8	%g4,	%l4,	%i1
	edge8n	%g1,	%i6,	%l3
	mulx	%l1,	0x14D4,	%g3
	ld	[%l7 + 0x54],	%f15
	umulcc	%i4,	0x1F31,	%o5
	mulx	%o4,	%o7,	%o2
	and	%g5,	0x1897,	%l6
	edge16ln	%o0,	%l5,	%g7
	movcc	%icc,	%g2,	%o3
	edge16ln	%i7,	%o1,	%i3
	movvs	%icc,	%i5,	%g6
	fcmpgt16	%f14,	%f20,	%l2
	movge	%icc,	%i2,	%o6
	xnor	%l0,	0x1085,	%g4
	pdist	%f10,	%f12,	%f4
	orcc	%i0,	%l4,	%i1
	fmovde	%icc,	%f26,	%f29
	srax	%g1,	0x10,	%l3
	array8	%l1,	%g3,	%i6
	ldsw	[%l7 + 0x64],	%o5
	fmovsleu	%icc,	%f18,	%f24
	fmovdneg	%icc,	%f2,	%f12
	ldub	[%l7 + 0x18],	%i4
	fmovsle	%icc,	%f7,	%f2
	udivcc	%o7,	0x198E,	%o2
	lduh	[%l7 + 0x2E],	%o4
	smulcc	%l6,	0x1B0D,	%g5
	umul	%l5,	%o0,	%g2
	movvs	%xcc,	%o3,	%i7
	add	%g7,	%o1,	%i5
	fmuld8sux16	%f30,	%f9,	%f26
	subc	%g6,	0x1440,	%l2
	fexpand	%f24,	%f12
	fmovsg	%icc,	%f5,	%f25
	fpsub32s	%f1,	%f1,	%f26
	lduw	[%l7 + 0x60],	%i2
	movrlz	%o6,	0x291,	%l0
	ldx	[%l7 + 0x30],	%g4
	sub	%i3,	0x1E0E,	%l4
	and	%i0,	%g1,	%l3
	movne	%xcc,	%l1,	%g3
	sra	%i1,	%o5,	%i4
	movrlez	%o7,	%i6,	%o2
	ld	[%l7 + 0x08],	%f31
	fmul8sux16	%f22,	%f30,	%f4
	andncc	%o4,	%g5,	%l5
	fmovsle	%icc,	%f16,	%f8
	edge32l	%o0,	%g2,	%l6
	fmovdcc	%xcc,	%f9,	%f31
	fsrc1	%f6,	%f0
	movne	%icc,	%i7,	%g7
	udivcc	%o3,	0x1BEC,	%o1
	srlx	%i5,	%g6,	%l2
	edge32n	%i2,	%l0,	%o6
	movne	%xcc,	%i3,	%l4
	fxors	%f20,	%f24,	%f25
	andncc	%g4,	%g1,	%l3
	sdivcc	%l1,	0x104E,	%g3
	ldd	[%l7 + 0x40],	%i0
	fcmple16	%f28,	%f14,	%o5
	lduh	[%l7 + 0x3C],	%i4
	or	%o7,	0x181B,	%i0
	edge32n	%o2,	%o4,	%g5
	fsrc2	%f16,	%f26
	array16	%i6,	%l5,	%o0
	edge16	%g2,	%l6,	%i7
	addcc	%o3,	%g7,	%i5
	ldd	[%l7 + 0x50],	%f28
	and	%g6,	0x124F,	%l2
	edge32l	%i2,	%o1,	%l0
	popc	0x096B,	%o6
	umul	%l4,	0x1D0B,	%g4
	mova	%icc,	%i3,	%g1
	move	%xcc,	%l1,	%l3
	ldub	[%l7 + 0x27],	%g3
	fsrc2s	%f23,	%f21
	xorcc	%i1,	%o5,	%o7
	srlx	%i0,	0x06,	%i4
	fmovrsne	%o2,	%f31,	%f27
	stx	%o4,	[%l7 + 0x40]
	smulcc	%g5,	%i6,	%l5
	fmovdneg	%icc,	%f1,	%f6
	alignaddrl	%g2,	%o0,	%l6
	xor	%o3,	0x0514,	%i7
	smulcc	%g7,	0x1D47,	%g6
	andncc	%i5,	%i2,	%l2
	edge32	%l0,	%o1,	%l4
	array32	%g4,	%i3,	%g1
	alignaddrl	%l1,	%l3,	%g3
	sll	%o6,	0x06,	%i1
	and	%o7,	%o5,	%i0
	fnand	%f26,	%f16,	%f6
	stx	%o2,	[%l7 + 0x70]
	xor	%o4,	0x0260,	%i4
	movleu	%xcc,	%i6,	%l5
	fmovdg	%icc,	%f27,	%f20
	fnot2s	%f25,	%f19
	movge	%xcc,	%g5,	%g2
	lduw	[%l7 + 0x20],	%o0
	addcc	%l6,	%o3,	%i7
	sll	%g7,	%i5,	%i2
	srax	%g6,	0x1B,	%l0
	edge32l	%l2,	%l4,	%g4
	fmul8x16	%f24,	%f30,	%f0
	xor	%i3,	%g1,	%o1
	movrne	%l1,	%g3,	%l3
	or	%i1,	0x0232,	%o6
	smul	%o7,	%i0,	%o2
	move	%icc,	%o4,	%i4
	addccc	%o5,	%i6,	%g5
	movpos	%xcc,	%l5,	%g2
	movvc	%icc,	%l6,	%o3
	fmovdn	%icc,	%f26,	%f19
	orcc	%i7,	%g7,	%i5
	mova	%xcc,	%o0,	%i2
	stb	%l0,	[%l7 + 0x64]
	fpadd16s	%f13,	%f1,	%f1
	stw	%g6,	[%l7 + 0x44]
	std	%f4,	[%l7 + 0x78]
	ldub	[%l7 + 0x52],	%l2
	sth	%l4,	[%l7 + 0x4C]
	umul	%g4,	%i3,	%o1
	sethi	0x1773,	%g1
	edge16n	%g3,	%l3,	%i1
	add	%l1,	%o6,	%i0
	edge16n	%o2,	%o7,	%o4
	movgu	%xcc,	%i4,	%i6
	fzero	%f16
	movcs	%xcc,	%o5,	%l5
	andn	%g5,	%l6,	%o3
	edge8	%g2,	%g7,	%i7
	fnors	%f19,	%f17,	%f29
	fnand	%f0,	%f28,	%f16
	smulcc	%i5,	0x005A,	%o0
	edge16n	%l0,	%g6,	%i2
	movrgez	%l4,	0x29C,	%l2
	movg	%icc,	%g4,	%i3
	move	%xcc,	%o1,	%g1
	subcc	%l3,	0x12D1,	%i1
	fmovdleu	%xcc,	%f18,	%f26
	sll	%g3,	%l1,	%i0
	movcc	%icc,	%o6,	%o2
	fpadd32	%f30,	%f26,	%f6
	subcc	%o4,	%o7,	%i4
	smul	%o5,	%i6,	%l5
	movrgez	%g5,	%l6,	%o3
	movcc	%xcc,	%g2,	%i7
	movrne	%i5,	0x18F,	%o0
	smulcc	%l0,	0x1200,	%g7
	movne	%xcc,	%g6,	%i2
	movne	%xcc,	%l2,	%l4
	movn	%xcc,	%g4,	%i3
	addc	%o1,	%l3,	%i1
	edge32	%g1,	%l1,	%i0
	edge8l	%o6,	%o2,	%o4
	andn	%g3,	%o7,	%o5
	addcc	%i6,	%i4,	%l5
	ldub	[%l7 + 0x7B],	%l6
	sir	0x0933
	movne	%xcc,	%o3,	%g2
	xor	%i7,	0x1225,	%i5
	ldsh	[%l7 + 0x5C],	%o0
	edge16l	%l0,	%g5,	%g6
	fcmpgt16	%f20,	%f4,	%i2
	ldd	[%l7 + 0x58],	%g6
	ldsw	[%l7 + 0x24],	%l2
	st	%f10,	[%l7 + 0x7C]
	lduw	[%l7 + 0x18],	%g4
	mova	%xcc,	%l4,	%o1
	edge8	%i3,	%i1,	%l3
	movvc	%icc,	%l1,	%i0
	andcc	%g1,	%o6,	%o4
	subcc	%o2,	%g3,	%o7
	fcmps	%fcc2,	%f1,	%f14
	fpmerge	%f6,	%f8,	%f4
	ld	[%l7 + 0x30],	%f28
	fcmpne16	%f20,	%f26,	%o5
	mulx	%i6,	0x1DA4,	%i4
	udivcc	%l6,	0x1DA7,	%o3
	edge32l	%g2,	%i7,	%i5
	movle	%xcc,	%l5,	%l0
	edge32n	%o0,	%g5,	%g6
	movn	%xcc,	%i2,	%g7
	fpadd32s	%f27,	%f27,	%f6
	sra	%g4,	%l2,	%l4
	fmovdge	%icc,	%f1,	%f15
	movrlez	%o1,	%i3,	%i1
	movcs	%xcc,	%l1,	%l3
	stx	%i0,	[%l7 + 0x08]
	save %g1, 0x05A1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o2,	%o6,	%g3
	fmovrsgz	%o7,	%f6,	%f7
	fcmpeq16	%f16,	%f14,	%o5
	fmovdneg	%xcc,	%f7,	%f15
	xnorcc	%i6,	%i4,	%l6
	movrgz	%g2,	0x035,	%i7
	movrgz	%i5,	%l5,	%o3
	edge8	%l0,	%o0,	%g6
	sdivcc	%i2,	0x16A7,	%g7
	srlx	%g5,	%l2,	%l4
	st	%f11,	[%l7 + 0x6C]
	st	%f26,	[%l7 + 0x54]
	addc	%g4,	%i3,	%o1
	smulcc	%l1,	%l3,	%i1
	xorcc	%g1,	%i0,	%o4
	fpadd16	%f18,	%f0,	%f14
	fpsub16	%f18,	%f4,	%f14
	fpackfix	%f16,	%f13
	fpsub32s	%f17,	%f20,	%f1
	lduh	[%l7 + 0x2A],	%o6
	restore %o2, 0x01E7, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g3,	0x0028,	%i6
	subc	%i4,	%o5,	%l6
	sra	%i7,	0x10,	%g2
	movl	%icc,	%i5,	%l5
	movneg	%icc,	%o3,	%l0
	fmovdneg	%icc,	%f22,	%f29
	movle	%icc,	%g6,	%i2
	lduw	[%l7 + 0x48],	%g7
	movrlez	%o0,	%g5,	%l2
	fcmpeq16	%f6,	%f24,	%l4
	sub	%i3,	0x0324,	%g4
	andncc	%o1,	%l3,	%l1
	udivcc	%g1,	0x1533,	%i1
	fpack16	%f30,	%f8
	edge32	%i0,	%o6,	%o4
	edge8n	%o7,	%g3,	%o2
	save %i6, %i4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i7,	%g2,	%l6
	edge8ln	%l5,	%o3,	%i5
	movge	%icc,	%g6,	%l0
	movrlz	%g7,	%o0,	%g5
	fornot1	%f24,	%f26,	%f24
	orcc	%i2,	0x1970,	%l4
	fmovscs	%xcc,	%f5,	%f17
	fmovsgu	%xcc,	%f7,	%f19
	movge	%xcc,	%l2,	%i3
	fsrc2	%f24,	%f12
	movne	%icc,	%o1,	%l3
	umul	%l1,	0x11F6,	%g4
	udivx	%i1,	0x0ABB,	%i0
	movrlz	%o6,	0x259,	%o4
	udiv	%o7,	0x0C89,	%g1
	st	%f3,	[%l7 + 0x5C]
	sir	0x0F8C
	movrne	%o2,	%g3,	%i6
	andcc	%i4,	%o5,	%g2
	sub	%i7,	0x085B,	%l5
	movrgez	%o3,	%i5,	%l6
	sll	%g6,	0x19,	%l0
	fandnot1s	%f19,	%f18,	%f28
	srlx	%o0,	%g5,	%g7
	movgu	%icc,	%i2,	%l4
	sdiv	%l2,	0x1ACF,	%i3
	xor	%l3,	0x190C,	%l1
	alignaddr	%o1,	%i1,	%g4
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	fmovde	%icc,	%f25,	%f1
	movg	%xcc,	%o4,	%g1
	movneg	%icc,	%o2,	%o7
	fmovscs	%icc,	%f16,	%f8
	fmovd	%f20,	%f28
	popc	0x00C8,	%g3
	fabss	%f12,	%f30
	stx	%i6,	[%l7 + 0x68]
	addc	%o5,	0x0E9D,	%g2
	save %i4, 0x1B30, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l5,	%i5,	%o3
	movl	%icc,	%g6,	%l0
	ld	[%l7 + 0x5C],	%f24
	movcc	%icc,	%o0,	%l6
	fpsub32s	%f16,	%f30,	%f8
	fand	%f26,	%f12,	%f12
	subccc	%g5,	0x0DBA,	%i2
	fmovsn	%icc,	%f11,	%f18
	ldx	[%l7 + 0x50],	%g7
	movg	%xcc,	%l2,	%i3
	movne	%xcc,	%l4,	%l1
	or	%o1,	%i1,	%l3
	ldsw	[%l7 + 0x2C],	%g4
	alignaddrl	%o6,	%o4,	%i0
	ldx	[%l7 + 0x50],	%o2
	umul	%g1,	%o7,	%g3
	orncc	%i6,	%o5,	%i4
	edge16l	%i7,	%l5,	%g2
	movcs	%icc,	%o3,	%i5
	addcc	%l0,	%o0,	%g6
	movleu	%icc,	%l6,	%g5
	movrlz	%i2,	%g7,	%i3
	fone	%f24
	restore %l2, 0x0141, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f5,	%f22,	%f18
	edge8n	%o1,	%i1,	%l4
	xnor	%l3,	0x0BDE,	%g4
	sllx	%o6,	0x18,	%i0
	movpos	%xcc,	%o4,	%o2
	fmovsvs	%icc,	%f3,	%f3
	edge16l	%o7,	%g3,	%i6
	edge8l	%o5,	%g1,	%i4
	ldub	[%l7 + 0x3D],	%i7
	sub	%l5,	%o3,	%i5
	andcc	%g2,	%o0,	%l0
	andn	%g6,	%l6,	%i2
	udiv	%g5,	0x071F,	%i3
	fmovrslez	%l2,	%f10,	%f18
	fands	%f17,	%f11,	%f26
	fmovsge	%xcc,	%f27,	%f25
	popc	%l1,	%o1
	save %g7, 0x0B1E, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l3,	0x1476,	%g4
	fone	%f16
	subc	%o6,	0x1977,	%i0
	sth	%l4,	[%l7 + 0x7C]
	mulx	%o2,	%o7,	%o4
	edge32l	%g3,	%o5,	%i6
	edge32	%i4,	%g1,	%l5
	fmuld8ulx16	%f6,	%f15,	%f2
	udivx	%i7,	0x12BE,	%o3
	mulx	%g2,	%o0,	%l0
	ldx	[%l7 + 0x70],	%i5
	movrlz	%l6,	%i2,	%g5
	array8	%g6,	%i3,	%l1
	add	%o1,	0x0474,	%g7
	fmovs	%f23,	%f18
	fmuld8sux16	%f24,	%f4,	%f4
	movleu	%icc,	%l2,	%i1
	movpos	%xcc,	%g4,	%o6
	edge16n	%l3,	%i0,	%o2
	fpmerge	%f27,	%f10,	%f26
	movle	%xcc,	%o7,	%l4
	sdivcc	%g3,	0x035D,	%o4
	fcmpd	%fcc3,	%f12,	%f28
	nop
	set	0x60, %g7
	stw	%o5,	[%l7 + %g7]
	sth	%i6,	[%l7 + 0x14]
	fcmpeq32	%f6,	%f2,	%g1
	sdiv	%l5,	0x072B,	%i7
	edge32l	%i4,	%o3,	%o0
	fsrc2	%f4,	%f26
	sdivx	%g2,	0x1A21,	%l0
	fxor	%f14,	%f4,	%f22
	fmul8ulx16	%f16,	%f30,	%f0
	fand	%f2,	%f18,	%f30
	addcc	%i5,	0x1BEE,	%i2
	fmovrde	%g5,	%f4,	%f30
	fmovdvs	%xcc,	%f14,	%f8
	movg	%icc,	%l6,	%i3
	alignaddrl	%l1,	%o1,	%g7
	edge16l	%l2,	%i1,	%g4
	save %o6, 0x19A7, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l3,	%i0,	%o2
	fmovrslez	%o7,	%f13,	%f19
	mova	%xcc,	%g3,	%l4
	ldsw	[%l7 + 0x78],	%o5
	udivx	%o4,	0x126C,	%g1
	xnorcc	%l5,	0x1104,	%i6
	movrlz	%i4,	0x30A,	%o3
	movvs	%xcc,	%o0,	%i7
	movpos	%icc,	%g2,	%i5
	lduw	[%l7 + 0x08],	%i2
	ld	[%l7 + 0x68],	%f8
	umulcc	%g5,	%l0,	%i3
	array16	%l6,	%l1,	%o1
	smul	%l2,	0x0DFA,	%i1
	array8	%g7,	%g4,	%o6
	movcc	%xcc,	%l3,	%g6
	sdivx	%o2,	0x0483,	%i0
	andcc	%g3,	%l4,	%o7
	popc	%o4,	%o5
	umul	%l5,	0x030A,	%g1
	fmovsleu	%icc,	%f23,	%f29
	ldub	[%l7 + 0x51],	%i6
	movrlez	%o3,	0x12E,	%i4
	mulscc	%i7,	%o0,	%i5
	sll	%g2,	%i2,	%l0
	xor	%i3,	0x1947,	%l6
	udiv	%g5,	0x00B5,	%l1
	fabss	%f26,	%f18
	edge16	%o1,	%l2,	%g7
	movne	%icc,	%g4,	%o6
	st	%f11,	[%l7 + 0x74]
	edge16	%l3,	%g6,	%o2
	ldx	[%l7 + 0x78],	%i1
	fone	%f14
	srl	%g3,	0x09,	%i0
	movgu	%xcc,	%l4,	%o4
	fmovsn	%icc,	%f29,	%f18
	sdiv	%o7,	0x1568,	%o5
	edge16	%l5,	%i6,	%g1
	ld	[%l7 + 0x78],	%f9
	edge16ln	%i4,	%o3,	%o0
	srlx	%i5,	%i7,	%i2
	array32	%l0,	%g2,	%i3
	sir	0x0A68
	fpadd32s	%f5,	%f15,	%f5
	nop
	set	0x4C, %i4
	lduh	[%l7 + %i4],	%l6
	alignaddrl	%g5,	%l1,	%l2
	fmul8x16al	%f24,	%f31,	%f16
	andcc	%g7,	%o1,	%o6
	std	%f28,	[%l7 + 0x70]
	sdivx	%l3,	0x1A1E,	%g4
	fmovdneg	%icc,	%f17,	%f8
	sdiv	%g6,	0x139C,	%o2
	movrgez	%g3,	0x118,	%i1
	fpack32	%f4,	%f10,	%f22
	sub	%i0,	0x0943,	%l4
	fpackfix	%f20,	%f28
	andn	%o7,	0x02CF,	%o5
	ldx	[%l7 + 0x08],	%o4
	fpadd32	%f22,	%f14,	%f18
	movvc	%xcc,	%i6,	%g1
	fxor	%f6,	%f2,	%f26
	stx	%l5,	[%l7 + 0x08]
	sethi	0x0078,	%i4
	fmovd	%f18,	%f6
	ldd	[%l7 + 0x20],	%o2
	movpos	%xcc,	%o0,	%i7
	andn	%i5,	%l0,	%i2
	udivcc	%g2,	0x0B1A,	%i3
	edge16n	%g5,	%l1,	%l6
	addccc	%l2,	0x1193,	%o1
	fsrc1	%f4,	%f24
	fandnot2s	%f10,	%f7,	%f25
	fabsd	%f28,	%f18
	fcmple32	%f22,	%f16,	%o6
	orncc	%g7,	0x11CC,	%l3
	sdivcc	%g4,	0x085D,	%o2
	add	%g3,	%i1,	%g6
	orn	%l4,	0x031F,	%o7
	xnorcc	%o5,	0x10E5,	%o4
	sra	%i6,	%g1,	%i0
	srax	%i4,	%o3,	%o0
	fmovde	%icc,	%f26,	%f22
	udiv	%i7,	0x003E,	%i5
	movle	%icc,	%l5,	%l0
	sllx	%i2,	0x11,	%g2
	lduh	[%l7 + 0x2A],	%i3
	alignaddrl	%l1,	%l6,	%l2
	edge16n	%o1,	%o6,	%g5
	fmovsvs	%xcc,	%f5,	%f19
	addcc	%l3,	%g4,	%g7
	lduw	[%l7 + 0x74],	%o2
	ldx	[%l7 + 0x58],	%i1
	fmovdn	%icc,	%f18,	%f21
	sir	0x045A
	save %g3, 0x16E8, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o7,	%o5,	%o4
	nop
	set	0x74, %i2
	lduw	[%l7 + %i2],	%i6
	fmovsvs	%icc,	%f0,	%f9
	movne	%icc,	%g1,	%i0
	edge8n	%l4,	%o3,	%i4
	ldd	[%l7 + 0x30],	%f4
	xnorcc	%i7,	%i5,	%o0
	add	%l0,	0x15CA,	%i2
	move	%icc,	%l5,	%g2
	subc	%l1,	0x006A,	%i3
	umul	%l2,	%l6,	%o1
	or	%g5,	0x0014,	%o6
	ldsb	[%l7 + 0x08],	%g4
	edge32	%l3,	%o2,	%g7
	fmul8x16	%f23,	%f22,	%f8
	sra	%i1,	0x04,	%g3
	sll	%o7,	0x01,	%o5
	alignaddrl	%o4,	%g6,	%g1
	fmovrsne	%i0,	%f19,	%f24
	movneg	%icc,	%l4,	%i6
	movneg	%icc,	%i4,	%i7
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	edge16l	%o0,	%i2,	%l0
	fmovsge	%icc,	%f30,	%f14
	ldsb	[%l7 + 0x27],	%g2
	movle	%xcc,	%l5,	%l1
	movcc	%xcc,	%l2,	%l6
	fmovrsne	%o1,	%f15,	%f10
	edge16	%i3,	%o6,	%g4
	ldd	[%l7 + 0x40],	%g4
	edge8n	%l3,	%g7,	%o2
	sdiv	%g3,	0x1AA5,	%o7
	ldsw	[%l7 + 0x40],	%o5
	popc	0x17A1,	%i1
	fmovdneg	%icc,	%f4,	%f24
	addcc	%o4,	%g6,	%i0
	fpackfix	%f2,	%f2
	movrlez	%g1,	0x314,	%l4
	smulcc	%i4,	%i7,	%o3
	lduw	[%l7 + 0x58],	%i6
	edge16n	%i5,	%i2,	%l0
	movge	%icc,	%o0,	%l5
	movrgez	%g2,	%l1,	%l2
	sdivcc	%l6,	0x155F,	%o1
	ldub	[%l7 + 0x42],	%o6
	pdist	%f10,	%f16,	%f14
	stw	%i3,	[%l7 + 0x1C]
	movn	%xcc,	%g4,	%l3
	orcc	%g5,	%g7,	%o2
	movgu	%xcc,	%o7,	%o5
	fandnot1s	%f13,	%f18,	%f29
	movn	%xcc,	%i1,	%g3
	movl	%icc,	%g6,	%o4
	subc	%i0,	%g1,	%i4
	array16	%l4,	%o3,	%i7
	movg	%xcc,	%i6,	%i5
	stw	%l0,	[%l7 + 0x48]
	movcc	%xcc,	%i2,	%o0
	subccc	%g2,	0x12BC,	%l1
	subcc	%l2,	0x107C,	%l6
	sethi	0x12AF,	%o1
	fornot2	%f30,	%f16,	%f10
	movvc	%icc,	%o6,	%l5
	movrlez	%i3,	0x279,	%g4
	xor	%g5,	0x011F,	%g7
	fmovs	%f1,	%f21
	orncc	%l3,	%o7,	%o5
	udiv	%i1,	0x1079,	%g3
	fmovse	%icc,	%f5,	%f15
	fmul8x16	%f8,	%f24,	%f6
	array32	%o2,	%o4,	%g6
	srl	%i0,	0x11,	%g1
	srax	%l4,	0x1A,	%o3
	fpadd16	%f26,	%f10,	%f22
	ldd	[%l7 + 0x10],	%i4
	edge16ln	%i6,	%i7,	%l0
	mulx	%i5,	0x0A4C,	%i2
	srlx	%g2,	%l1,	%l2
	orn	%l6,	0x1010,	%o1
	edge32	%o0,	%l5,	%o6
	movle	%xcc,	%g4,	%i3
	stx	%g7,	[%l7 + 0x08]
	addcc	%g5,	0x12BE,	%l3
	movrlez	%o5,	0x3F6,	%o7
	ldsb	[%l7 + 0x4A],	%i1
	fmovd	%f14,	%f24
	movcc	%icc,	%g3,	%o4
	xor	%g6,	0x1A4A,	%i0
	popc	0x0F99,	%g1
	edge16n	%l4,	%o3,	%o2
	fmovsl	%xcc,	%f1,	%f26
	sllx	%i4,	0x05,	%i6
	fabss	%f8,	%f16
	subc	%i7,	%i5,	%l0
	edge16ln	%i2,	%l1,	%l2
	sth	%g2,	[%l7 + 0x24]
	movcs	%icc,	%o1,	%l6
	ld	[%l7 + 0x24],	%f2
	fmovdgu	%icc,	%f5,	%f7
	xor	%o0,	0x0D38,	%l5
	addcc	%g4,	%i3,	%g7
	lduh	[%l7 + 0x56],	%g5
	popc	%l3,	%o5
	st	%f2,	[%l7 + 0x4C]
	xorcc	%o6,	0x08FC,	%o7
	sdiv	%g3,	0x0F77,	%i1
	edge8n	%o4,	%i0,	%g6
	fpsub32s	%f12,	%f18,	%f2
	movn	%icc,	%g1,	%l4
	movge	%icc,	%o3,	%i4
	fmovsleu	%icc,	%f23,	%f24
	movrgez	%o2,	%i6,	%i5
	array16	%l0,	%i2,	%l1
	subc	%i7,	%g2,	%l2
	movleu	%icc,	%l6,	%o1
	srlx	%o0,	%l5,	%i3
	andcc	%g7,	%g5,	%l3
	movrgez	%g4,	%o5,	%o7
	fsrc2s	%f1,	%f18
	orcc	%g3,	0x095D,	%o6
	sra	%o4,	%i0,	%i1
	fmovsvc	%icc,	%f20,	%f16
	srax	%g1,	%g6,	%o3
	restore %l4, 0x0C69, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f16,	%f14,	%f12
	array32	%i6,	%i5,	%l0
	movrne	%i2,	%l1,	%o2
	sra	%i7,	0x1E,	%l2
	movcc	%xcc,	%g2,	%o1
	ld	[%l7 + 0x5C],	%f25
	subcc	%l6,	%l5,	%i3
	edge16ln	%o0,	%g5,	%g7
	xnor	%g4,	0x15ED,	%o5
	and	%l3,	0x08E8,	%o7
	and	%o6,	%o4,	%g3
	sdiv	%i0,	0x0668,	%g1
	subc	%g6,	0x1831,	%i1
	st	%f10,	[%l7 + 0x58]
	movrne	%o3,	0x305,	%i4
	ld	[%l7 + 0x58],	%f16
	udivx	%i6,	0x042B,	%i5
	fnegd	%f0,	%f24
	sra	%l4,	0x0A,	%l0
	save %l1, 0x1A1C, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i2,	%i7,	%g2
	fornot2s	%f30,	%f23,	%f28
	edge32l	%l2,	%l6,	%o1
	srl	%l5,	0x1B,	%o0
	array16	%g5,	%i3,	%g7
	faligndata	%f10,	%f30,	%f18
	lduh	[%l7 + 0x4C],	%g4
	stx	%o5,	[%l7 + 0x30]
	edge8ln	%l3,	%o6,	%o4
	fcmpeq16	%f4,	%f18,	%g3
	subcc	%o7,	0x083C,	%g1
	move	%icc,	%i0,	%i1
	movg	%xcc,	%o3,	%g6
	array32	%i6,	%i5,	%l4
	fpadd32	%f8,	%f16,	%f4
	fcmpeq32	%f8,	%f18,	%l0
	addc	%i4,	0x0586,	%l1
	bshuffle	%f2,	%f14,	%f14
	subc	%i2,	%o2,	%g2
	mulscc	%l2,	0x124B,	%l6
	popc	0x12A0,	%o1
	ldsh	[%l7 + 0x70],	%i7
	edge32	%o0,	%g5,	%l5
	fpsub32	%f28,	%f28,	%f18
	popc	0x1736,	%g7
	sethi	0x018B,	%i3
	fmovrsne	%g4,	%f23,	%f12
	fmovsvs	%xcc,	%f4,	%f13
	movgu	%xcc,	%l3,	%o6
	movleu	%xcc,	%o5,	%o4
	edge32n	%o7,	%g3,	%i0
	edge8	%g1,	%o3,	%g6
	fmovscc	%xcc,	%f4,	%f7
	movrgez	%i6,	0x3BE,	%i5
	movrgez	%i1,	%l0,	%i4
	edge16n	%l1,	%l4,	%o2
	movcc	%icc,	%i2,	%l2
	stb	%l6,	[%l7 + 0x4F]
	addcc	%o1,	%i7,	%o0
	srl	%g2,	%g5,	%g7
	movrlz	%l5,	0x152,	%i3
	ldsb	[%l7 + 0x16],	%l3
	edge32	%g4,	%o6,	%o5
	movle	%xcc,	%o4,	%g3
	movcs	%xcc,	%o7,	%i0
	subc	%o3,	0x003A,	%g6
	fmovsne	%icc,	%f5,	%f24
	movn	%icc,	%g1,	%i5
	subc	%i1,	%l0,	%i4
	umulcc	%i6,	0x1BC0,	%l4
	udiv	%l1,	0x1F4C,	%o2
	mova	%icc,	%i2,	%l2
	lduw	[%l7 + 0x7C],	%l6
	mulx	%o1,	%o0,	%g2
	sir	0x13C5
	movvs	%icc,	%g5,	%g7
	fmovrdne	%i7,	%f24,	%f24
	orcc	%l5,	0x1D06,	%i3
	fmovdcc	%icc,	%f30,	%f23
	movvc	%icc,	%l3,	%o6
	stw	%g4,	[%l7 + 0x70]
	fmovda	%xcc,	%f3,	%f9
	edge8	%o4,	%g3,	%o5
	movgu	%xcc,	%i0,	%o7
	alignaddrl	%o3,	%g6,	%g1
	movle	%icc,	%i5,	%i1
	edge16ln	%l0,	%i4,	%i6
	xor	%l4,	%o2,	%l1
	edge32ln	%l2,	%l6,	%i2
	subc	%o1,	0x0571,	%g2
	lduw	[%l7 + 0x20],	%o0
	sra	%g7,	0x03,	%g5
	subccc	%l5,	%i3,	%i7
	umulcc	%o6,	%g4,	%o4
	sll	%g3,	0x18,	%l3
	sll	%o5,	0x1E,	%o7
	subc	%o3,	%i0,	%g6
	edge16ln	%i5,	%g1,	%i1
	movne	%xcc,	%l0,	%i6
	ld	[%l7 + 0x7C],	%f19
	umul	%i4,	0x0106,	%l4
	movleu	%icc,	%o2,	%l2
	movrne	%l1,	0x005,	%i2
	sth	%l6,	[%l7 + 0x56]
	srl	%g2,	0x13,	%o1
	andcc	%o0,	0x07A2,	%g5
	fpack16	%f16,	%f2
	movre	%g7,	0x1BC,	%i3
	movrlz	%l5,	0x373,	%o6
	alignaddrl	%g4,	%o4,	%i7
	movge	%xcc,	%l3,	%o5
	movneg	%xcc,	%o7,	%o3
	ld	[%l7 + 0x1C],	%f20
	fnot1s	%f18,	%f28
	srl	%g3,	0x0B,	%i0
	addc	%g6,	0x1F14,	%i5
	array32	%i1,	%l0,	%i6
	edge32l	%g1,	%i4,	%o2
	edge16n	%l2,	%l4,	%l1
	fornot2	%f6,	%f26,	%f8
	andcc	%i2,	0x015D,	%l6
	fmul8x16al	%f24,	%f6,	%f24
	sth	%o1,	[%l7 + 0x36]
	movrgz	%g2,	%o0,	%g7
	movre	%g5,	%i3,	%l5
	fmovs	%f25,	%f12
	fmul8sux16	%f10,	%f14,	%f22
	udivx	%g4,	0x08C8,	%o6
	movrne	%o4,	0x14A,	%l3
	fmovrdne	%o5,	%f6,	%f26
	addcc	%i7,	0x11E1,	%o7
	edge16n	%o3,	%i0,	%g6
	ld	[%l7 + 0x34],	%f15
	popc	%g3,	%i5
	fmovs	%f5,	%f15
	movleu	%xcc,	%l0,	%i6
	srl	%i1,	0x11,	%i4
	mulscc	%g1,	%l2,	%l4
	addccc	%o2,	%l1,	%l6
	movre	%o1,	0x0C0,	%i2
	movvc	%xcc,	%o0,	%g7
	fones	%f22
	edge32	%g2,	%i3,	%l5
	movre	%g5,	0x12E,	%o6
	or	%g4,	0x02F3,	%l3
	fandnot1s	%f13,	%f27,	%f30
	ldx	[%l7 + 0x08],	%o4
	sub	%o5,	%i7,	%o7
	edge16l	%o3,	%g6,	%i0
	movcs	%icc,	%g3,	%l0
	movrlz	%i5,	%i6,	%i4
	mova	%icc,	%i1,	%l2
	movrlz	%g1,	0x386,	%o2
	nop
	set	0x44, %g5
	sth	%l4,	[%l7 + %g5]
	movl	%xcc,	%l1,	%l6
	ldsh	[%l7 + 0x3C],	%i2
	smulcc	%o1,	%o0,	%g7
	fmovrde	%i3,	%f20,	%f10
	ldx	[%l7 + 0x40],	%l5
	fmovd	%f6,	%f10
	edge32n	%g2,	%o6,	%g5
	save %l3, %o4, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f10,	%f18,	%o5
	fmovrdlez	%o7,	%f30,	%f18
	fmovdpos	%icc,	%f20,	%f9
	smulcc	%i7,	%g6,	%i0
	xnorcc	%o3,	0x1C5B,	%l0
	movg	%xcc,	%g3,	%i6
	ldub	[%l7 + 0x42],	%i4
	fmovdvs	%icc,	%f12,	%f29
	fors	%f14,	%f12,	%f21
	movge	%xcc,	%i5,	%l2
	edge8l	%g1,	%i1,	%o2
	orcc	%l4,	%l1,	%i2
	fmovdgu	%icc,	%f9,	%f22
	udivx	%l6,	0x132C,	%o1
	st	%f26,	[%l7 + 0x74]
	sllx	%o0,	%i3,	%g7
	movneg	%icc,	%g2,	%o6
	movrgz	%g5,	%l3,	%l5
	movpos	%icc,	%g4,	%o4
	movge	%icc,	%o7,	%o5
	umul	%g6,	%i0,	%o3
	orncc	%l0,	0x1923,	%i7
	movpos	%icc,	%i6,	%i4
	ldsw	[%l7 + 0x40],	%g3
	umul	%i5,	%g1,	%l2
	movcs	%xcc,	%i1,	%l4
	sir	0x1938
	movvs	%xcc,	%l1,	%o2
	mulx	%i2,	0x1E85,	%l6
	fmovsge	%xcc,	%f8,	%f12
	subccc	%o1,	0x059C,	%o0
	movl	%icc,	%i3,	%g2
	sra	%g7,	%o6,	%l3
	movvc	%icc,	%l5,	%g4
	alignaddr	%g5,	%o7,	%o4
	edge16l	%g6,	%o5,	%i0
	edge32l	%l0,	%i7,	%i6
	umulcc	%i4,	0x0967,	%o3
	sll	%i5,	%g1,	%g3
	movle	%xcc,	%l2,	%i1
	andcc	%l4,	%o2,	%l1
	fxnor	%f10,	%f12,	%f2
	alignaddrl	%l6,	%o1,	%o0
	array16	%i3,	%g2,	%g7
	mulx	%o6,	%l3,	%i2
	movle	%icc,	%g4,	%l5
	sub	%g5,	0x1304,	%o7
	alignaddrl	%o4,	%o5,	%i0
	fzeros	%f29
	movrlez	%g6,	%i7,	%i6
	sethi	0x1B83,	%i4
	ldub	[%l7 + 0x19],	%l0
	srax	%o3,	%i5,	%g1
	movgu	%xcc,	%g3,	%l2
	movleu	%icc,	%i1,	%l4
	udivcc	%l1,	0x1CFE,	%l6
	umulcc	%o1,	%o0,	%o2
	fmovdge	%xcc,	%f3,	%f13
	ldsb	[%l7 + 0x6D],	%g2
	fpsub16	%f30,	%f12,	%f16
	fcmpne32	%f14,	%f28,	%g7
	fmovrdlez	%o6,	%f24,	%f28
	array8	%i3,	%l3,	%g4
	ldsb	[%l7 + 0x2F],	%l5
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	ld	[%l7 + 0x14],	%f27
	fandnot1s	%f30,	%f8,	%f15
	fmovrslz	%o4,	%f7,	%f3
	movne	%xcc,	%g5,	%o5
	subccc	%g6,	%i7,	%i0
	fmovsn	%xcc,	%f1,	%f7
	edge16ln	%i4,	%i6,	%o3
	srl	%l0,	0x0D,	%g1
	smulcc	%i5,	0x1581,	%l2
	st	%f1,	[%l7 + 0x78]
	sdiv	%g3,	0x1375,	%i1
	edge32n	%l1,	%l4,	%l6
	sdivcc	%o1,	0x1E88,	%o2
	fsrc1	%f8,	%f2
	fcmple16	%f4,	%f4,	%o0
	save %g7, %g2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i3,	%g4,	%l3
	edge16l	%l5,	%i2,	%o4
	movvc	%icc,	%o7,	%o5
	siam	0x5
	stw	%g6,	[%l7 + 0x4C]
	ldd	[%l7 + 0x48],	%f30
	smul	%g5,	0x01E5,	%i7
	fnor	%f14,	%f26,	%f2
	fmovrde	%i0,	%f6,	%f6
	movle	%xcc,	%i6,	%o3
	fpadd32	%f12,	%f0,	%f24
	fmovdg	%xcc,	%f28,	%f0
	fmovda	%xcc,	%f8,	%f16
	movrlz	%l0,	0x366,	%g1
	xor	%i4,	0x1245,	%l2
	ldsh	[%l7 + 0x2C],	%g3
	lduh	[%l7 + 0x56],	%i5
	array32	%l1,	%i1,	%l4
	stw	%o1,	[%l7 + 0x40]
	sub	%l6,	0x0043,	%o0
	fzero	%f6
	ld	[%l7 + 0x60],	%f22
	srax	%g7,	%o2,	%o6
	alignaddrl	%i3,	%g4,	%g2
	fmul8x16al	%f10,	%f27,	%f16
	addccc	%l5,	%i2,	%l3
	subccc	%o7,	0x1608,	%o4
	sdivx	%g6,	0x0178,	%o5
	save %i7, %g5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f28,	%f14
	and	%i6,	%o3,	%g1
	umul	%i4,	0x1997,	%l2
	fnot2	%f0,	%f20
	restore %g3, 0x002B, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i5,	%i1,	%l1
	srax	%l4,	0x09,	%l6
	movvc	%xcc,	%o1,	%o0
	add	%o2,	%o6,	%g7
	stx	%i3,	[%l7 + 0x08]
	ldsw	[%l7 + 0x34],	%g2
	srlx	%g4,	%i2,	%l5
	orcc	%l3,	%o7,	%g6
	fmovsleu	%icc,	%f11,	%f0
	movle	%icc,	%o4,	%o5
	ldsw	[%l7 + 0x6C],	%i7
	fmovsn	%icc,	%f28,	%f22
	edge8	%i0,	%i6,	%o3
	fnegd	%f8,	%f6
	xorcc	%g5,	%g1,	%l2
	fmovdle	%icc,	%f9,	%f0
	fmuld8ulx16	%f7,	%f26,	%f14
	fmovrde	%i4,	%f0,	%f14
	fmovdge	%icc,	%f6,	%f29
	add	%g3,	0x0FAE,	%l0
	array16	%i1,	%l1,	%l4
	fcmple16	%f30,	%f16,	%l6
	mulx	%o1,	0x1E16,	%o0
	edge8ln	%i5,	%o2,	%g7
	movg	%icc,	%i3,	%o6
	fpsub16s	%f22,	%f5,	%f13
	andncc	%g2,	%g4,	%l5
	ldd	[%l7 + 0x48],	%f4
	udivx	%l3,	0x12BF,	%o7
	movcs	%xcc,	%i2,	%g6
	movrlez	%o5,	%i7,	%o4
	fmovsle	%xcc,	%f29,	%f5
	fmovsneg	%icc,	%f3,	%f18
	andcc	%i0,	%o3,	%g5
	sethi	0x0FAA,	%g1
	sethi	0x097C,	%i6
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	mulx	%g3,	%l1,	%i1
	sir	0x1CA5
	fmovrde	%l6,	%f24,	%f2
	addc	%l4,	0x01AB,	%o0
	sth	%i5,	[%l7 + 0x4C]
	sll	%o1,	%g7,	%o2
	srl	%o6,	%g2,	%i3
	stb	%l5,	[%l7 + 0x7E]
	sdivx	%l3,	0x1626,	%o7
	popc	0x151A,	%i2
	fmovrdgez	%g4,	%f22,	%f16
	edge8	%g6,	%i7,	%o5
	xnor	%i0,	%o4,	%o3
	orn	%g1,	0x01D4,	%g5
	orncc	%i6,	%i4,	%l0
	xnorcc	%l2,	%g3,	%l1
	srlx	%l6,	%i1,	%l4
	subc	%i5,	%o0,	%o1
	st	%f29,	[%l7 + 0x34]
	smulcc	%g7,	0x16A3,	%o6
	xnorcc	%o2,	%i3,	%l5
	xnor	%g2,	%o7,	%i2
	fnegd	%f22,	%f20
	movle	%xcc,	%l3,	%g6
	mulscc	%g4,	0x0D77,	%o5
	fmovrdlz	%i0,	%f24,	%f12
	mova	%icc,	%o4,	%i7
	fcmped	%fcc1,	%f14,	%f26
	edge8n	%g1,	%g5,	%i6
	fxor	%f14,	%f2,	%f8
	addcc	%i4,	0x0D26,	%l0
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%f12
	srl	%o3,	%g3,	%l2
	array16	%l1,	%i1,	%l4
	xnorcc	%i5,	0x1501,	%l6
	fmovspos	%icc,	%f23,	%f1
	andcc	%o1,	0x0E03,	%g7
	subc	%o0,	0x19B6,	%o2
	fnot2s	%f29,	%f2
	fnot2	%f6,	%f20
	movre	%i3,	%l5,	%o6
	srlx	%o7,	0x02,	%i2
	sll	%l3,	0x16,	%g6
	addccc	%g4,	%o5,	%i0
	movvc	%icc,	%g2,	%o4
	edge16n	%i7,	%g1,	%i6
	ld	[%l7 + 0x0C],	%f1
	array8	%g5,	%i4,	%l0
	movrgz	%g3,	0x386,	%o3
	or	%l2,	0x0911,	%l1
	movre	%i1,	0x168,	%i5
	subccc	%l6,	%o1,	%l4
	edge16ln	%g7,	%o0,	%i3
	sub	%o2,	0x004B,	%l5
	subcc	%o6,	%o7,	%i2
	lduw	[%l7 + 0x10],	%l3
	ld	[%l7 + 0x64],	%f8
	srlx	%g4,	0x09,	%g6
	edge16n	%o5,	%i0,	%g2
	movrlez	%i7,	%o4,	%g1
	array8	%i6,	%i4,	%l0
	st	%f20,	[%l7 + 0x28]
	movrgez	%g5,	%g3,	%l2
	sllx	%o3,	0x11,	%l1
	movrne	%i1,	0x099,	%l6
	ldsh	[%l7 + 0x60],	%o1
	save %i5, 0x03F0, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o0,	0x1FE8,	%i3
	movcs	%xcc,	%l4,	%l5
	stx	%o6,	[%l7 + 0x20]
	std	%f2,	[%l7 + 0x68]
	sub	%o7,	0x02C6,	%o2
	smulcc	%l3,	0x034E,	%i2
	edge8l	%g4,	%o5,	%g6
	edge16n	%i0,	%g2,	%o4
	edge16ln	%i7,	%g1,	%i6
	movleu	%icc,	%l0,	%g5
	edge32	%i4,	%l2,	%o3
	orcc	%g3,	%i1,	%l6
	fcmped	%fcc0,	%f4,	%f24
	edge32l	%l1,	%i5,	%g7
	sdivcc	%o0,	0x038B,	%i3
	fmovdne	%xcc,	%f4,	%f17
	edge32n	%o1,	%l4,	%o6
	xnorcc	%l5,	0x0E6E,	%o7
	fcmpne32	%f22,	%f18,	%l3
	fsrc1	%f14,	%f14
	edge32ln	%i2,	%g4,	%o5
	fmul8x16al	%f11,	%f17,	%f16
	fmovsle	%icc,	%f28,	%f11
	mulx	%o2,	%i0,	%g6
	alignaddrl	%g2,	%i7,	%o4
	lduw	[%l7 + 0x48],	%g1
	array16	%l0,	%i6,	%g5
	mulscc	%l2,	0x1399,	%o3
	movge	%xcc,	%i4,	%i1
	movcs	%xcc,	%g3,	%l6
	fxors	%f13,	%f14,	%f20
	addccc	%i5,	%l1,	%g7
	movneg	%xcc,	%o0,	%o1
	udiv	%l4,	0x0877,	%i3
	fmovsg	%xcc,	%f29,	%f11
	array32	%l5,	%o6,	%l3
	sdivx	%i2,	0x04E3,	%g4
	sdivcc	%o5,	0x175A,	%o7
	orncc	%o2,	%i0,	%g6
	ldd	[%l7 + 0x08],	%i6
	addcc	%g2,	%g1,	%o4
	sll	%i6,	0x14,	%g5
	orn	%l2,	%l0,	%o3
	ld	[%l7 + 0x14],	%f0
	umul	%i1,	%i4,	%l6
	fmul8x16	%f25,	%f4,	%f12
	lduh	[%l7 + 0x6A],	%i5
	fpmerge	%f9,	%f18,	%f2
	xor	%l1,	0x1C6C,	%g3
	subc	%g7,	%o0,	%l4
	fsrc1s	%f15,	%f17
	subccc	%i3,	%l5,	%o6
	sll	%o1,	0x0A,	%l3
	edge32l	%i2,	%o5,	%g4
	array16	%o7,	%i0,	%o2
	lduh	[%l7 + 0x5A],	%i7
	fpsub16	%f20,	%f30,	%f4
	movrgz	%g6,	0x26A,	%g1
	fpsub16	%f4,	%f6,	%f20
	movcc	%xcc,	%o4,	%i6
	xorcc	%g5,	0x1C2C,	%l2
	orcc	%l0,	%g2,	%o3
	edge32	%i4,	%l6,	%i5
	srl	%i1,	0x10,	%g3
	fmovdleu	%icc,	%f18,	%f31
	orncc	%l1,	%o0,	%g7
	andcc	%l4,	%l5,	%i3
	array32	%o6,	%l3,	%o1
	umulcc	%o5,	%i2,	%g4
	restore %o7, 0x07CF, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o2,	0x0A90,	%i7
	fxnor	%f20,	%f20,	%f16
	movneg	%icc,	%g1,	%o4
	lduh	[%l7 + 0x20],	%g6
	fmul8sux16	%f16,	%f24,	%f18
	ld	[%l7 + 0x4C],	%f15
	srl	%i6,	%g5,	%l0
	andcc	%l2,	0x015F,	%g2
	mulx	%i4,	%l6,	%o3
	ldsb	[%l7 + 0x47],	%i5
	lduw	[%l7 + 0x5C],	%g3
	udiv	%l1,	0x03A7,	%i1
	fmovsneg	%xcc,	%f10,	%f29
	addc	%g7,	0x1FF3,	%l4
	movg	%xcc,	%l5,	%i3
	orn	%o6,	%o0,	%l3
	xnorcc	%o5,	%o1,	%i2
	ld	[%l7 + 0x34],	%f28
	array32	%o7,	%g4,	%i0
	addc	%i7,	0x1111,	%o2
	for	%f0,	%f8,	%f30
	fpadd32	%f6,	%f28,	%f12
	movvs	%icc,	%o4,	%g1
	movneg	%icc,	%g6,	%i6
	xorcc	%g5,	%l0,	%l2
	fmovrsgz	%i4,	%f16,	%f25
	fcmpne16	%f10,	%f18,	%l6
	stb	%g2,	[%l7 + 0x2F]
	fnors	%f25,	%f8,	%f28
	orn	%i5,	%o3,	%l1
	array16	%g3,	%g7,	%l4
	sll	%l5,	%i3,	%i1
	fornot1s	%f24,	%f27,	%f9
	mulscc	%o0,	0x1353,	%o6
	movg	%xcc,	%o5,	%l3
	srax	%o1,	0x05,	%i2
	alignaddr	%g4,	%i0,	%i7
	movl	%xcc,	%o7,	%o2
	array32	%o4,	%g6,	%g1
	xnor	%i6,	0x00A7,	%g5
	fornot1s	%f15,	%f8,	%f30
	edge16	%l2,	%i4,	%l6
	and	%l0,	0x05A7,	%i5
	fornot1s	%f10,	%f29,	%f15
	ldsh	[%l7 + 0x5A],	%g2
	andcc	%o3,	0x0D3B,	%l1
	fnegs	%f29,	%f26
	lduw	[%l7 + 0x44],	%g7
	sll	%g3,	%l5,	%l4
	orn	%i3,	%i1,	%o0
	fnands	%f1,	%f30,	%f20
	subccc	%o6,	0x1289,	%l3
	umul	%o1,	%o5,	%g4
	movl	%icc,	%i0,	%i2
	lduh	[%l7 + 0x52],	%o7
	xorcc	%o2,	0x1B95,	%o4
	fand	%f24,	%f4,	%f4
	sdivcc	%i7,	0x0199,	%g1
	sth	%i6,	[%l7 + 0x22]
	mulscc	%g5,	%g6,	%i4
	lduh	[%l7 + 0x6C],	%l2
	lduh	[%l7 + 0x0A],	%l0
	srl	%l6,	%g2,	%i5
	ldd	[%l7 + 0x38],	%f16
	sir	0x0E30
	add	%o3,	0x040C,	%g7
	popc	%g3,	%l1
	array16	%l5,	%l4,	%i1
	srl	%i3,	%o6,	%l3
	fsrc1	%f0,	%f12
	srax	%o0,	0x02,	%o1
	sethi	0x1610,	%o5
	subc	%i0,	0x07BC,	%g4
	udivx	%i2,	0x16E0,	%o2
	fpadd32	%f24,	%f24,	%f2
	fandnot2s	%f9,	%f9,	%f28
	udivx	%o4,	0x0294,	%o7
	edge32l	%g1,	%i7,	%i6
	edge16ln	%g5,	%i4,	%g6
	movrne	%l2,	0x305,	%l6
	andncc	%g2,	%i5,	%l0
	std	%f30,	[%l7 + 0x18]
	ldd	[%l7 + 0x10],	%f30
	move	%icc,	%o3,	%g7
	movvs	%xcc,	%g3,	%l5
	movrne	%l4,	0x29A,	%i1
	fnot2s	%f30,	%f4
	movrne	%i3,	0x365,	%l1
	fmovsg	%xcc,	%f17,	%f18
	array32	%o6,	%l3,	%o0
	fmovdn	%xcc,	%f10,	%f19
	movg	%icc,	%o5,	%i0
	sdiv	%g4,	0x1A55,	%o1
	movre	%o2,	0x133,	%i2
	std	%f28,	[%l7 + 0x38]
	and	%o7,	%o4,	%i7
	fmovdvc	%xcc,	%f25,	%f19
	movrlz	%g1,	0x17A,	%g5
	orcc	%i4,	%i6,	%g6
	fcmpne32	%f22,	%f20,	%l2
	stw	%l6,	[%l7 + 0x20]
	udivcc	%g2,	0x147E,	%i5
	or	%o3,	%l0,	%g3
	udiv	%l5,	0x167F,	%g7
	fmovrdgz	%i1,	%f26,	%f0
	sub	%l4,	0x05DC,	%i3
	popc	%l1,	%l3
	sth	%o6,	[%l7 + 0x1A]
	fmovrslz	%o5,	%f23,	%f15
	smul	%i0,	%g4,	%o1
	ldx	[%l7 + 0x30],	%o0
	smul	%i2,	0x0D52,	%o7
	stw	%o4,	[%l7 + 0x5C]
	udiv	%i7,	0x1772,	%g1
	umul	%g5,	0x183D,	%i4
	or	%i6,	%o2,	%g6
	fmovrsgez	%l6,	%f11,	%f20
	movrne	%g2,	0x0AA,	%i5
	fmovscs	%xcc,	%f11,	%f12
	ldsw	[%l7 + 0x74],	%o3
	andncc	%l2,	%g3,	%l5
	fpsub32s	%f25,	%f31,	%f2
	ldd	[%l7 + 0x70],	%f24
	lduh	[%l7 + 0x22],	%l0
	movvc	%icc,	%g7,	%i1
	movre	%i3,	0x237,	%l1
	move	%xcc,	%l3,	%o6
	movcc	%xcc,	%l4,	%i0
	fmovdl	%icc,	%f12,	%f4
	mulx	%g4,	%o1,	%o0
	sll	%o5,	%i2,	%o7
	edge32ln	%i7,	%o4,	%g5
	stw	%i4,	[%l7 + 0x40]
	fsrc2s	%f8,	%f29
	smulcc	%g1,	%o2,	%g6
	subcc	%l6,	0x02FF,	%g2
	fmovdpos	%xcc,	%f0,	%f5
	fmovsle	%icc,	%f20,	%f14
	xnorcc	%i6,	%i5,	%l2
	ld	[%l7 + 0x40],	%f8
	fsrc2s	%f27,	%f11
	ldx	[%l7 + 0x10],	%o3
	xor	%g3,	%l0,	%g7
	fsrc2s	%f21,	%f2
	st	%f9,	[%l7 + 0x64]
	fexpand	%f25,	%f22
	srl	%l5,	0x16,	%i1
	mulx	%i3,	%l1,	%l3
	fabss	%f31,	%f6
	movneg	%icc,	%l4,	%o6
	movle	%icc,	%g4,	%o1
	sdivcc	%i0,	0x18F1,	%o0
	movrne	%i2,	%o5,	%i7
	st	%f21,	[%l7 + 0x34]
	orncc	%o7,	0x1B08,	%o4
	smul	%i4,	%g1,	%g5
	fpack32	%f8,	%f30,	%f4
	movcc	%xcc,	%o2,	%l6
	edge16n	%g2,	%i6,	%i5
	edge32ln	%l2,	%o3,	%g3
	fnand	%f30,	%f8,	%f8
	udivx	%l0,	0x03F5,	%g7
	andn	%l5,	0x0BD4,	%i1
	fpadd32	%f6,	%f18,	%f8
	fone	%f6
	edge32l	%g6,	%l1,	%i3
	andcc	%l4,	0x0A6E,	%l3
	popc	0x0EC8,	%g4
	add	%o6,	0x08C1,	%o1
	movle	%icc,	%o0,	%i0
	st	%f15,	[%l7 + 0x08]
	ldx	[%l7 + 0x70],	%i2
	edge8n	%i7,	%o5,	%o4
	fmovsg	%xcc,	%f11,	%f12
	addccc	%i4,	0x1891,	%o7
	movgu	%xcc,	%g1,	%o2
	fandnot1s	%f27,	%f22,	%f5
	mulscc	%l6,	0x1101,	%g2
	add	%g5,	0x08C5,	%i6
	addcc	%i5,	0x07F3,	%o3
	faligndata	%f12,	%f0,	%f12
	orncc	%g3,	%l0,	%g7
	fmovrdlz	%l5,	%f14,	%f8
	ldd	[%l7 + 0x38],	%f20
	srax	%l2,	%i1,	%l1
	sethi	0x0E3F,	%g6
	orncc	%i3,	%l3,	%l4
	fsrc1s	%f9,	%f3
	movrgez	%o6,	0x022,	%o1
	ldd	[%l7 + 0x58],	%g4
	fmovspos	%icc,	%f2,	%f29
	edge16	%o0,	%i0,	%i2
	srax	%i7,	0x1E,	%o5
	movg	%xcc,	%o4,	%o7
	fmovdne	%xcc,	%f27,	%f20
	orcc	%i4,	0x1FD0,	%g1
	movrlz	%o2,	0x355,	%g2
	edge16	%g5,	%l6,	%i6
	or	%o3,	%i5,	%l0
	movge	%icc,	%g7,	%l5
	subccc	%l2,	%i1,	%g3
	fmovscs	%xcc,	%f5,	%f4
	movg	%icc,	%g6,	%l1
	fmovrslz	%i3,	%f18,	%f3
	fmovdg	%icc,	%f9,	%f17
	edge16	%l4,	%o6,	%o1
	save %g4, 0x069B, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o0,	0x11,	%i0
	or	%i7,	0x1DD2,	%i2
	fxors	%f2,	%f20,	%f1
	orcc	%o5,	0x1339,	%o4
	fpadd16	%f6,	%f24,	%f14
	move	%icc,	%i4,	%g1
	fpsub16s	%f12,	%f9,	%f3
	movg	%xcc,	%o7,	%o2
	addccc	%g5,	0x1ABC,	%l6
	move	%icc,	%g2,	%i6
	edge16ln	%o3,	%l0,	%i5
	alignaddr	%l5,	%l2,	%g7
	movrne	%g3,	0x1D7,	%g6
	movleu	%icc,	%i1,	%i3
	umulcc	%l1,	%l4,	%o1
	st	%f22,	[%l7 + 0x64]
	edge32	%o6,	%g4,	%l3
	stx	%o0,	[%l7 + 0x60]
	ldd	[%l7 + 0x48],	%f22
	fand	%f14,	%f30,	%f8
	st	%f6,	[%l7 + 0x10]
	edge16	%i0,	%i7,	%i2
	ldd	[%l7 + 0x08],	%o4
	orcc	%i4,	0x070C,	%o5
	fpsub32	%f2,	%f6,	%f28
	subccc	%o7,	0x0309,	%o2
	movne	%icc,	%g1,	%l6
	movrlez	%g5,	%i6,	%o3
	sdivx	%g2,	0x18C7,	%i5
	fpackfix	%f22,	%f1
	fornot1	%f22,	%f26,	%f24
	movgu	%xcc,	%l5,	%l0
	ldsb	[%l7 + 0x65],	%g7
	orn	%g3,	%l2,	%g6
	movre	%i1,	0x0EC,	%i3
	array16	%l4,	%o1,	%o6
	ldx	[%l7 + 0x40],	%l1
	fsrc1	%f20,	%f30
	andcc	%l3,	0x0005,	%o0
	sth	%i0,	[%l7 + 0x3C]
	addc	%i7,	%i2,	%o4
	fmovsle	%xcc,	%f30,	%f14
	array16	%g4,	%i4,	%o7
	mova	%xcc,	%o2,	%o5
	movg	%xcc,	%l6,	%g5
	xnor	%g1,	0x12C7,	%o3
	popc	%g2,	%i5
	movn	%xcc,	%i6,	%l5
	movneg	%xcc,	%g7,	%l0
	fsrc1s	%f2,	%f17
	movg	%icc,	%g3,	%l2
	fnot1	%f24,	%f6
	fcmpne16	%f2,	%f20,	%g6
	ld	[%l7 + 0x6C],	%f9
	mulscc	%i3,	0x1BC1,	%l4
	orncc	%i1,	%o1,	%o6
	fmovse	%icc,	%f5,	%f25
	lduw	[%l7 + 0x70],	%l1
	sethi	0x08CD,	%l3
	array32	%i0,	%o0,	%i2
	movgu	%xcc,	%i7,	%o4
	addcc	%g4,	0x1131,	%o7
	movrgez	%i4,	%o5,	%l6
	movrlez	%o2,	%g5,	%g1
	fmovs	%f2,	%f1
	sllx	%g2,	0x15,	%i5
	andcc	%o3,	0x18ED,	%i6
	fpsub32	%f26,	%f20,	%f30
	xorcc	%l5,	0x0217,	%l0
	fmovdleu	%icc,	%f20,	%f26
	stw	%g3,	[%l7 + 0x10]
	fnor	%f18,	%f4,	%f14
	movrne	%l2,	0x39A,	%g6
	fxnor	%f6,	%f12,	%f0
	fmovrdlz	%g7,	%f0,	%f20
	sub	%i3,	0x1ECE,	%l4
	lduh	[%l7 + 0x34],	%i1
	st	%f24,	[%l7 + 0x78]
	sdiv	%o6,	0x0736,	%l1
	array32	%l3,	%o1,	%o0
	movrgez	%i2,	%i7,	%o4
	stx	%g4,	[%l7 + 0x48]
	movvc	%icc,	%i0,	%o7
	movl	%xcc,	%i4,	%o5
	movge	%xcc,	%o2,	%l6
	xnorcc	%g1,	0x1D85,	%g5
	edge8ln	%i5,	%g2,	%i6
	movrlz	%l5,	%o3,	%l0
	sub	%g3,	%g6,	%l2
	sdivx	%g7,	0x15FF,	%i3
	ldd	[%l7 + 0x78],	%f22
	fmovdcs	%icc,	%f25,	%f20
	mulx	%l4,	0x18AE,	%o6
	fcmpgt16	%f14,	%f28,	%l1
	ldx	[%l7 + 0x70],	%l3
	fornot1s	%f9,	%f12,	%f16
	edge16n	%i1,	%o1,	%i2
	fnot2s	%f31,	%f2
	fmovrdgez	%i7,	%f10,	%f4
	add	%o0,	0x0A01,	%g4
	movrlez	%o4,	0x21C,	%o7
	fxnor	%f10,	%f12,	%f20
	movg	%xcc,	%i0,	%i4
	movvc	%xcc,	%o2,	%o5
	subccc	%g1,	0x0CBD,	%l6
	alignaddr	%i5,	%g2,	%i6
	edge32l	%l5,	%o3,	%l0
	edge16	%g3,	%g5,	%l2
	orn	%g6,	%i3,	%g7
	sllx	%l4,	%o6,	%l3
	fand	%f8,	%f0,	%f24
	pdist	%f16,	%f10,	%f14
	edge8l	%l1,	%o1,	%i1
	nop
	set	0x28, %o2
	std	%f24,	[%l7 + %o2]
	edge32n	%i2,	%o0,	%i7
	movleu	%xcc,	%g4,	%o4
	fmovrdlez	%i0,	%f10,	%f12
	fmovdleu	%xcc,	%f20,	%f21
	addc	%i4,	0x1007,	%o2
	alignaddrl	%o7,	%g1,	%o5
	fmovd	%f12,	%f24
	srl	%l6,	0x13,	%i5
	srax	%g2,	%i6,	%o3
	addcc	%l5,	0x1457,	%l0
	lduh	[%l7 + 0x4A],	%g5
	edge8n	%l2,	%g6,	%g3
	for	%f0,	%f14,	%f30
	udivcc	%i3,	0x1E9F,	%g7
	fxnors	%f9,	%f1,	%f20
	mova	%xcc,	%o6,	%l3
	orncc	%l1,	0x00D8,	%o1
	movre	%i1,	0x1A9,	%l4
	edge32	%o0,	%i7,	%i2
	andncc	%g4,	%i0,	%i4
	fxnors	%f25,	%f16,	%f30
	ld	[%l7 + 0x18],	%f8
	umulcc	%o4,	%o7,	%o2
	edge32ln	%o5,	%l6,	%g1
	fpadd32s	%f14,	%f2,	%f10
	umulcc	%g2,	%i5,	%o3
	umulcc	%i6,	%l5,	%g5
	pdist	%f16,	%f10,	%f26
	xorcc	%l2,	%l0,	%g6
	popc	%g3,	%i3
	fnot1s	%f24,	%f29
	fmul8x16al	%f0,	%f1,	%f10
	fcmpgt32	%f18,	%f4,	%o6
	sth	%l3,	[%l7 + 0x58]
	array16	%l1,	%g7,	%i1
	udivx	%l4,	0x1DFB,	%o1
	stb	%i7,	[%l7 + 0x0A]
	subccc	%o0,	%g4,	%i2
	fmovrdgz	%i0,	%f16,	%f22
	sll	%o4,	%o7,	%o2
	fmovsgu	%icc,	%f30,	%f31
	addccc	%i4,	%l6,	%g1
	fmovsl	%icc,	%f31,	%f25
	udivcc	%o5,	0x1B7A,	%g2
	array16	%i5,	%o3,	%l5
	lduh	[%l7 + 0x10],	%i6
	faligndata	%f0,	%f6,	%f2
	array16	%l2,	%g5,	%g6
	nop
	set	0x20, %i7
	lduh	[%l7 + %i7],	%g3
	mulx	%l0,	%i3,	%o6
	fcmps	%fcc3,	%f6,	%f3
	ld	[%l7 + 0x3C],	%f1
	fxor	%f18,	%f12,	%f24
	movle	%xcc,	%l3,	%l1
	sth	%g7,	[%l7 + 0x08]
	mulscc	%l4,	%o1,	%i7
	addccc	%o0,	0x0FE6,	%g4
	lduh	[%l7 + 0x78],	%i1
	sra	%i0,	%i2,	%o7
	fmovdvc	%icc,	%f21,	%f8
	fxor	%f2,	%f24,	%f28
	movrgz	%o4,	0x39F,	%i4
	mova	%icc,	%l6,	%g1
	sll	%o5,	%g2,	%o2
	movrlz	%i5,	%o3,	%i6
	ldsw	[%l7 + 0x08],	%l5
	fmovdleu	%xcc,	%f6,	%f20
	fcmpne32	%f6,	%f28,	%l2
	ldd	[%l7 + 0x60],	%g6
	fandnot1	%f24,	%f24,	%f8
	ldsb	[%l7 + 0x22],	%g5
	sdivcc	%l0,	0x0156,	%i3
	std	%f8,	[%l7 + 0x20]
	movpos	%icc,	%o6,	%g3
	udiv	%l3,	0x0B76,	%g7
	fmovsn	%icc,	%f28,	%f27
	xnorcc	%l1,	%l4,	%o1
	edge16l	%o0,	%i7,	%g4
	popc	%i0,	%i2
	fmovdpos	%icc,	%f12,	%f24
	ldsw	[%l7 + 0x10],	%i1
	movrlez	%o7,	0x122,	%o4
	udivcc	%i4,	0x019B,	%g1
	fors	%f16,	%f29,	%f16
	udiv	%l6,	0x1B70,	%o5
	ldsw	[%l7 + 0x78],	%o2
	fornot1	%f10,	%f16,	%f26
	fmovsa	%icc,	%f9,	%f26
	for	%f20,	%f30,	%f8
	udivx	%i5,	0x0D73,	%o3
	movg	%icc,	%i6,	%g2
	xnorcc	%l2,	%l5,	%g5
	movneg	%xcc,	%g6,	%l0
	fmovrde	%i3,	%f12,	%f16
	fpsub32s	%f17,	%f27,	%f5
	movne	%xcc,	%g3,	%o6
	srax	%g7,	%l1,	%l4
	addc	%o1,	%o0,	%l3
	movvs	%icc,	%i7,	%g4
	save %i2, %i1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o4,	%i4,	%i0
	stw	%g1,	[%l7 + 0x40]
	alignaddr	%o5,	%l6,	%o2
	fmovdvc	%icc,	%f22,	%f28
	orncc	%i5,	%o3,	%i6
	ldd	[%l7 + 0x28],	%f30
	xor	%g2,	%l2,	%l5
	movne	%icc,	%g5,	%l0
	edge32ln	%i3,	%g6,	%g3
	ldx	[%l7 + 0x58],	%g7
	andcc	%o6,	%l4,	%l1
	st	%f13,	[%l7 + 0x08]
	fsrc1	%f14,	%f2
	subc	%o1,	0x06E7,	%o0
	ldd	[%l7 + 0x20],	%f20
	fmovrdgez	%l3,	%f22,	%f26
	fmovrslz	%i7,	%f3,	%f8
	or	%g4,	0x0EE0,	%i1
	andncc	%o7,	%o4,	%i2
	andn	%i4,	%g1,	%i0
	ldsw	[%l7 + 0x0C],	%l6
	udivx	%o2,	0x0FB2,	%i5
	movre	%o3,	0x317,	%i6
	fmovsne	%xcc,	%f14,	%f21
	edge32l	%g2,	%l2,	%o5
	movneg	%icc,	%l5,	%g5
	array16	%i3,	%g6,	%g3
	fsrc2s	%f25,	%f27
	st	%f11,	[%l7 + 0x18]
	stx	%g7,	[%l7 + 0x08]
	fmovdge	%xcc,	%f19,	%f12
	fpsub32	%f12,	%f2,	%f26
	edge16l	%o6,	%l0,	%l1
	array8	%l4,	%o1,	%o0
	movle	%icc,	%l3,	%g4
	movre	%i1,	0x137,	%o7
	movre	%i7,	%o4,	%i2
	ldx	[%l7 + 0x18],	%i4
	addccc	%i0,	%l6,	%g1
	xorcc	%i5,	0x0CA5,	%o2
	edge32	%o3,	%i6,	%g2
	fmovrslez	%l2,	%f26,	%f29
	movleu	%xcc,	%o5,	%g5
	edge8	%i3,	%l5,	%g6
	ld	[%l7 + 0x3C],	%f7
	add	%g3,	%g7,	%l0
	fmovrdlez	%o6,	%f26,	%f12
	ldd	[%l7 + 0x28],	%l4
	fmovsne	%xcc,	%f9,	%f23
	ldsh	[%l7 + 0x30],	%o1
	edge32n	%o0,	%l3,	%l1
	movgu	%icc,	%g4,	%o7
	xor	%i1,	%o4,	%i2
	fmovdg	%xcc,	%f21,	%f11
	movne	%icc,	%i7,	%i0
	umulcc	%l6,	%g1,	%i5
	movcc	%xcc,	%i4,	%o2
	or	%i6,	0x08BC,	%o3
	mulx	%l2,	%o5,	%g5
	movn	%xcc,	%g2,	%l5
	std	%f24,	[%l7 + 0x10]
	fandnot1	%f22,	%f30,	%f6
	st	%f22,	[%l7 + 0x44]
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	ldd	[%l7 + 0x20],	%l0
	xnor	%o6,	%g7,	%o1
	addc	%o0,	%l3,	%l1
	movneg	%xcc,	%g4,	%l4
	udiv	%i1,	0x1E8D,	%o4
	srax	%o7,	%i7,	%i0
	sdivx	%l6,	0x185E,	%i2
	fmovscs	%icc,	%f13,	%f12
	edge16n	%i5,	%i4,	%g1
	smul	%o2,	0x0B3A,	%o3
	fmovrdlez	%i6,	%f8,	%f14
	sra	%l2,	%o5,	%g2
	nop
	set	0x5C, %o6
	sth	%l5,	[%l7 + %o6]
	and	%g5,	0x161B,	%i3
	movrlz	%g3,	%l0,	%g6
	subcc	%g7,	%o1,	%o6
	fmovscc	%icc,	%f25,	%f5
	faligndata	%f6,	%f30,	%f6
	popc	0x08FF,	%o0
	and	%l1,	%l3,	%g4
	fcmpgt32	%f12,	%f22,	%l4
	fmovsne	%icc,	%f20,	%f24
	lduw	[%l7 + 0x78],	%i1
	movvc	%icc,	%o4,	%o7
	srlx	%i7,	0x18,	%l6
	edge16n	%i2,	%i5,	%i4
	movg	%xcc,	%g1,	%i0
	andn	%o3,	%i6,	%o2
	udivcc	%o5,	0x15B1,	%l2
	for	%f28,	%f6,	%f26
	movg	%icc,	%g2,	%g5
	for	%f30,	%f12,	%f10
	array32	%l5,	%i3,	%g3
	fmovscs	%xcc,	%f24,	%f5
	edge16n	%g6,	%l0,	%o1
	smulcc	%g7,	%o6,	%l1
	std	%f10,	[%l7 + 0x38]
	and	%l3,	0x0C3F,	%o0
	sth	%l4,	[%l7 + 0x5E]
	fnot2s	%f12,	%f19
	movrne	%i1,	%o4,	%g4
	fmovdg	%icc,	%f29,	%f12
	alignaddrl	%o7,	%i7,	%i2
	fandnot2s	%f8,	%f10,	%f18
	udiv	%i5,	0x08C7,	%l6
	orncc	%g1,	%i0,	%o3
	fpadd32	%f0,	%f2,	%f20
	fmovdcs	%xcc,	%f8,	%f5
	srl	%i4,	0x0F,	%i6
	sll	%o2,	%l2,	%g2
	array32	%g5,	%l5,	%o5
	srl	%i3,	0x17,	%g3
	movge	%icc,	%g6,	%l0
	smulcc	%g7,	0x18CE,	%o6
	stx	%l1,	[%l7 + 0x78]
	ldd	[%l7 + 0x40],	%f22
	edge32n	%o1,	%l3,	%l4
	movleu	%xcc,	%i1,	%o4
	orcc	%o0,	0x1740,	%g4
	subc	%i7,	%i2,	%o7
	fxnors	%f17,	%f27,	%f4
	edge16ln	%i5,	%g1,	%l6
	fsrc2s	%f30,	%f30
	fmovsg	%xcc,	%f9,	%f11
	addccc	%i0,	0x0F8D,	%o3
	alignaddrl	%i6,	%o2,	%i4
	edge8ln	%g2,	%l2,	%g5
	sth	%l5,	[%l7 + 0x4C]
	fcmpne32	%f2,	%f8,	%i3
	ldub	[%l7 + 0x17],	%o5
	stw	%g6,	[%l7 + 0x14]
	edge16ln	%l0,	%g7,	%g3
	edge32	%o6,	%l1,	%l3
	movcc	%xcc,	%l4,	%i1
	fpackfix	%f18,	%f1
	ldd	[%l7 + 0x68],	%f28
	edge32l	%o1,	%o4,	%g4
	for	%f4,	%f30,	%f20
	xor	%i7,	%o0,	%i2
	fmovsl	%xcc,	%f8,	%f20
	movge	%icc,	%o7,	%i5
	udiv	%l6,	0x19C9,	%i0
	array8	%g1,	%o3,	%o2
	array32	%i6,	%i4,	%g2
	sll	%l2,	%l5,	%g5
	pdist	%f12,	%f28,	%f14
	movneg	%xcc,	%o5,	%g6
	sdivcc	%i3,	0x16E9,	%l0
	fmul8sux16	%f2,	%f2,	%f2
	movrgz	%g7,	%o6,	%l1
	move	%icc,	%l3,	%g3
	fcmpne32	%f26,	%f20,	%l4
	subcc	%o1,	0x1876,	%i1
	movn	%xcc,	%g4,	%o4
	movcs	%xcc,	%i7,	%i2
	subccc	%o0,	%i5,	%l6
	sra	%i0,	%g1,	%o7
	fmovsn	%xcc,	%f15,	%f8
	fors	%f0,	%f22,	%f11
	subcc	%o2,	0x1499,	%o3
	restore %i4, 0x0D8C, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l2,	%g2,	%g5
	umulcc	%l5,	%g6,	%i3
	fmovrdlez	%o5,	%f18,	%f14
	edge16l	%l0,	%o6,	%l1
	fmul8x16	%f27,	%f30,	%f30
	sth	%g7,	[%l7 + 0x14]
	movpos	%xcc,	%l3,	%g3
	fandnot2s	%f11,	%f2,	%f15
	sllx	%o1,	0x0F,	%l4
	mulscc	%g4,	0x1752,	%i1
	xor	%o4,	%i2,	%o0
	mulx	%i7,	%l6,	%i5
	sll	%i0,	0x13,	%g1
	fpsub32s	%f21,	%f17,	%f12
	movrgez	%o7,	0x325,	%o3
	movn	%icc,	%i4,	%i6
	mova	%icc,	%l2,	%o2
	sdivcc	%g5,	0x0DBA,	%l5
	sethi	0x0FA6,	%g6
	movre	%g2,	0x2BE,	%i3
	stb	%l0,	[%l7 + 0x7A]
	movrgez	%o5,	%l1,	%o6
	fmovdge	%icc,	%f29,	%f30
	edge8	%g7,	%g3,	%l3
	ldsh	[%l7 + 0x30],	%o1
	smul	%g4,	0x0917,	%i1
	movleu	%icc,	%l4,	%i2
	movvs	%icc,	%o0,	%o4
	fandnot1s	%f16,	%f16,	%f25
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	fmovdneg	%icc,	%f13,	%f20
	movl	%icc,	%i7,	%g1
	sdiv	%i0,	0x048D,	%o3
	movvs	%xcc,	%i4,	%o7
	xorcc	%l2,	%i6,	%g5
	orn	%l5,	%o2,	%g6
	fcmped	%fcc2,	%f18,	%f30
	umul	%g2,	0x1F5E,	%l0
	fornot1s	%f22,	%f6,	%f2
	subcc	%i3,	%o5,	%o6
	orn	%l1,	0x1CCF,	%g7
	fxor	%f26,	%f0,	%f30
	array16	%l3,	%o1,	%g4
	edge16l	%i1,	%l4,	%g3
	alignaddrl	%o0,	%o4,	%l6
	smulcc	%i5,	%i7,	%i2
	movre	%g1,	%i0,	%i4
	edge16l	%o3,	%l2,	%i6
	orcc	%g5,	%o7,	%o2
	andn	%l5,	%g2,	%g6
	movcc	%xcc,	%i3,	%l0
	mulscc	%o5,	%o6,	%l1
	fmovsn	%xcc,	%f11,	%f27
	mova	%xcc,	%l3,	%o1
	mulx	%g4,	0x079D,	%i1
	edge16n	%g7,	%l4,	%g3
	ld	[%l7 + 0x0C],	%f5
	fpadd16s	%f24,	%f10,	%f31
	andcc	%o0,	0x07F9,	%l6
	srax	%o4,	%i5,	%i2
	ldsb	[%l7 + 0x26],	%i7
	movrgez	%g1,	%i4,	%i0
	edge8ln	%l2,	%i6,	%g5
	fabss	%f7,	%f24
	srl	%o3,	0x03,	%o2
	fmovscs	%icc,	%f3,	%f28
	restore %o7, 0x1DB0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f3,	%f14,	%f10
	xnorcc	%g2,	0x156E,	%g6
	fmovdcs	%xcc,	%f9,	%f0
	fmovsvs	%icc,	%f12,	%f20
	stx	%l0,	[%l7 + 0x08]
	srl	%i3,	0x19,	%o6
	movre	%o5,	%l1,	%o1
	movvs	%xcc,	%g4,	%i1
	sub	%l3,	0x053B,	%g7
	lduh	[%l7 + 0x1C],	%l4
	fornot2s	%f8,	%f19,	%f13
	umulcc	%g3,	%l6,	%o0
	fmovscc	%icc,	%f10,	%f9
	mova	%icc,	%i5,	%o4
	udiv	%i2,	0x0151,	%i7
	ldd	[%l7 + 0x70],	%f6
	andn	%g1,	0x1D85,	%i4
	lduw	[%l7 + 0x5C],	%i0
	fmovsneg	%xcc,	%f19,	%f13
	sdivcc	%i6,	0x1B95,	%l2
	movne	%icc,	%o3,	%g5
	alignaddr	%o7,	%l5,	%o2
	ldsw	[%l7 + 0x48],	%g2
	addcc	%l0,	%g6,	%i3
	nop
	set	0x1E, %i6
	ldub	[%l7 + %i6],	%o6
	lduh	[%l7 + 0x26],	%o5
	srax	%l1,	%o1,	%g4
	fcmpne16	%f6,	%f12,	%i1
	alignaddrl	%l3,	%l4,	%g7
	stx	%l6,	[%l7 + 0x10]
	movre	%o0,	%g3,	%o4
	edge16	%i5,	%i2,	%g1
	array16	%i7,	%i0,	%i4
	movrlez	%l2,	0x0FF,	%i6
	nop
	set	0x0C, %l1
	ldsh	[%l7 + %l1],	%g5
	std	%f28,	[%l7 + 0x68]
	alignaddr	%o7,	%l5,	%o3
	ldd	[%l7 + 0x30],	%g2
	sdiv	%l0,	0x0A35,	%g6
	fabsd	%f14,	%f18
	st	%f19,	[%l7 + 0x0C]
	or	%o2,	%i3,	%o6
	fsrc2	%f24,	%f8
	and	%o5,	0x01A7,	%o1
	add	%l1,	%i1,	%g4
	lduw	[%l7 + 0x28],	%l4
	fmovdne	%icc,	%f6,	%f18
	std	%f24,	[%l7 + 0x40]
	save %l3, %g7, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g3,	%l6,	%i5
	ldsh	[%l7 + 0x4E],	%i2
	sdivcc	%g1,	0x0FA8,	%o4
	sir	0x0397
	fnegs	%f1,	%f17
	fmovrdlz	%i7,	%f30,	%f22
	movcc	%xcc,	%i4,	%l2
	alignaddr	%i0,	%i6,	%o7
	fmovdpos	%xcc,	%f28,	%f22
	udivx	%l5,	0x1941,	%o3
	stw	%g5,	[%l7 + 0x34]
	fpsub32s	%f25,	%f6,	%f29
	movgu	%icc,	%l0,	%g2
	st	%f13,	[%l7 + 0x2C]
	move	%icc,	%o2,	%i3
	array8	%g6,	%o5,	%o6
	sir	0x12B7
	mulscc	%l1,	0x0B1F,	%o1
	edge32ln	%i1,	%l4,	%l3
	fmovsl	%xcc,	%f12,	%f24
	alignaddr	%g4,	%o0,	%g3
	edge16ln	%g7,	%l6,	%i5
	orncc	%i2,	%g1,	%i7
	and	%i4,	0x1726,	%o4
	movrgz	%i0,	%l2,	%i6
	edge32	%l5,	%o7,	%o3
	movleu	%icc,	%l0,	%g2
	smul	%o2,	%g5,	%g6
	fcmpeq32	%f6,	%f2,	%i3
	lduw	[%l7 + 0x48],	%o6
	orcc	%l1,	%o1,	%o5
	ldsh	[%l7 + 0x76],	%l4
	fcmpne32	%f26,	%f18,	%i1
	faligndata	%f14,	%f30,	%f12
	movn	%icc,	%g4,	%l3
	movl	%xcc,	%g3,	%g7
	udivx	%o0,	0x0D41,	%i5
	mulx	%i2,	%g1,	%l6
	and	%i4,	0x0C52,	%i7
	alignaddrl	%o4,	%l2,	%i6
	fmul8sux16	%f26,	%f16,	%f24
	stx	%l5,	[%l7 + 0x40]
	fmovse	%xcc,	%f13,	%f2
	save %i0, %o3, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f21,	%f23
	edge16	%g2,	%l0,	%o2
	stb	%g6,	[%l7 + 0x32]
	and	%g5,	0x05BD,	%i3
	edge8n	%o6,	%o1,	%o5
	siam	0x0
	edge16ln	%l4,	%i1,	%l1
	movre	%g4,	0x172,	%l3
	ldd	[%l7 + 0x68],	%f30
	save %g3, 0x15F2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o0,	0x06,	%i5
	fzeros	%f6
	movcc	%xcc,	%g1,	%l6
	edge8n	%i2,	%i4,	%o4
	for	%f24,	%f4,	%f24
	fcmpeq16	%f24,	%f28,	%i7
	lduw	[%l7 + 0x10],	%i6
	fcmped	%fcc3,	%f24,	%f6
	edge16n	%l5,	%i0,	%o3
	movge	%icc,	%o7,	%g2
	ldsw	[%l7 + 0x74],	%l2
	fmovsl	%xcc,	%f30,	%f22
	xnor	%o2,	0x013E,	%g6
	and	%l0,	0x1E08,	%i3
	udiv	%o6,	0x1740,	%o1
	andcc	%g5,	%o5,	%l4
	fmovsa	%icc,	%f10,	%f26
	lduw	[%l7 + 0x2C],	%i1
	movcs	%xcc,	%l1,	%g4
	fmovrdlez	%l3,	%f4,	%f4
	fandnot1	%f20,	%f8,	%f20
	st	%f22,	[%l7 + 0x48]
	movleu	%xcc,	%g3,	%g7
	movneg	%icc,	%i5,	%o0
	fandnot1s	%f28,	%f15,	%f13
	fmovsa	%icc,	%f13,	%f10
	movpos	%icc,	%g1,	%l6
	udiv	%i4,	0x0895,	%o4
	or	%i2,	0x1667,	%i7
	edge8ln	%l5,	%i0,	%o3
	edge16	%i6,	%o7,	%l2
	nop
	set	0x20, %i1
	stx	%g2,	[%l7 + %i1]
	edge32	%o2,	%g6,	%l0
	movvs	%icc,	%i3,	%o1
	srl	%o6,	0x16,	%g5
	orncc	%l4,	0x1C1A,	%i1
	edge32ln	%l1,	%o5,	%l3
	fmovd	%f10,	%f24
	fmovrsne	%g4,	%f1,	%f9
	fpackfix	%f12,	%f27
	subccc	%g7,	0x19FB,	%i5
	fands	%f27,	%f27,	%f31
	fmovrde	%g3,	%f6,	%f18
	alignaddr	%g1,	%l6,	%i4
	movrne	%o0,	0x214,	%o4
	sdiv	%i2,	0x06C0,	%i7
	std	%f2,	[%l7 + 0x38]
	fcmped	%fcc1,	%f6,	%f2
	sethi	0x12BC,	%i0
	movneg	%icc,	%l5,	%o3
	sub	%i6,	%l2,	%g2
	edge8ln	%o7,	%g6,	%o2
	fpsub32s	%f27,	%f23,	%f28
	ldd	[%l7 + 0x10],	%f12
	fmovsge	%icc,	%f23,	%f29
	edge16ln	%l0,	%o1,	%o6
	srax	%i3,	0x14,	%l4
	movl	%icc,	%i1,	%l1
	fmovrse	%o5,	%f6,	%f26
	save %g5, %l3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i5,	%g3,	%g4
	srlx	%g1,	0x0E,	%l6
	movl	%icc,	%o0,	%o4
	xorcc	%i2,	0x1FA6,	%i4
	fmovdn	%xcc,	%f7,	%f17
	edge8l	%i7,	%l5,	%i0
	movcs	%icc,	%i6,	%o3
	fpsub16	%f8,	%f10,	%f30
	array16	%g2,	%o7,	%l2
	movgu	%icc,	%o2,	%g6
	orcc	%l0,	%o1,	%o6
	sub	%l4,	0x190D,	%i3
	ldsw	[%l7 + 0x6C],	%i1
	st	%f10,	[%l7 + 0x7C]
	edge16	%o5,	%g5,	%l3
	fcmple32	%f26,	%f8,	%g7
	mulx	%l1,	0x1C6E,	%g3
	fmovrdlz	%g4,	%f2,	%f8
	movl	%icc,	%g1,	%l6
	array16	%o0,	%o4,	%i2
	stx	%i5,	[%l7 + 0x50]
	or	%i4,	0x044A,	%l5
	edge32	%i0,	%i7,	%o3
	fone	%f12
	ldx	[%l7 + 0x40],	%g2
	edge16n	%o7,	%l2,	%i6
	udivcc	%g6,	0x1DC3,	%o2
	fmovrsne	%o1,	%f15,	%f27
	edge8ln	%l0,	%l4,	%o6
	fcmple32	%f14,	%f18,	%i3
	ldd	[%l7 + 0x78],	%o4
	stb	%i1,	[%l7 + 0x2F]
	subcc	%g5,	0x0F6E,	%g7
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	fmul8x16	%f17,	%f18,	%f8
	edge8n	%g3,	%l6,	%g1
	movrlz	%o4,	0x2B4,	%o0
	add	%i2,	%i4,	%i5
	edge8n	%i0,	%l5,	%i7
	alignaddrl	%g2,	%o3,	%l2
	ldsw	[%l7 + 0x34],	%o7
	movneg	%xcc,	%i6,	%g6
	sdiv	%o2,	0x1953,	%l0
	fcmpd	%fcc1,	%f20,	%f20
	fmovdcc	%icc,	%f9,	%f19
	subccc	%l4,	%o6,	%i3
	movgu	%icc,	%o1,	%i1
	ldx	[%l7 + 0x18],	%o5
	movrne	%g7,	%g5,	%l3
	fnors	%f17,	%f13,	%f4
	ld	[%l7 + 0x0C],	%f25
	andcc	%g4,	%g3,	%l1
	orn	%g1,	%l6,	%o0
	sra	%i2,	%o4,	%i4
	sub	%i5,	%l5,	%i0
	array32	%g2,	%o3,	%i7
	edge32ln	%l2,	%i6,	%g6
	mova	%icc,	%o7,	%o2
	smulcc	%l0,	0x19BA,	%l4
	mulx	%i3,	0x185A,	%o6
	edge8	%i1,	%o5,	%o1
	fmovsvc	%icc,	%f12,	%f1
	mulscc	%g5,	%l3,	%g4
	stw	%g7,	[%l7 + 0x1C]
	fcmpne16	%f22,	%f20,	%l1
	sir	0x1164
	stw	%g1,	[%l7 + 0x50]
	udivx	%g3,	0x0EBA,	%l6
	fnot1	%f4,	%f16
	smul	%i2,	%o4,	%i4
	andncc	%o0,	%i5,	%l5
	sdivcc	%g2,	0x10C4,	%i0
	edge16ln	%i7,	%l2,	%o3
	fmovsa	%icc,	%f23,	%f15
	fxors	%f11,	%f11,	%f13
	sllx	%g6,	0x10,	%i6
	alignaddrl	%o2,	%l0,	%l4
	movre	%i3,	%o6,	%i1
	or	%o5,	0x0369,	%o7
	sra	%o1,	%l3,	%g4
	movpos	%xcc,	%g5,	%g7
	move	%xcc,	%g1,	%g3
	fzeros	%f22
	subcc	%l1,	0x161D,	%i2
	movrgez	%l6,	%i4,	%o4
	fnot2	%f26,	%f28
	orcc	%i5,	0x1FFE,	%o0
	fmovrdne	%g2,	%f16,	%f2
	edge32l	%i0,	%i7,	%l5
	or	%l2,	0x11CB,	%o3
	addcc	%g6,	%i6,	%l0
	sdivcc	%o2,	0x0987,	%l4
	and	%i3,	0x11B0,	%i1
	fpsub16	%f2,	%f20,	%f14
	array8	%o5,	%o6,	%o1
	movne	%icc,	%l3,	%g4
	umulcc	%g5,	%g7,	%g1
	sllx	%g3,	%o7,	%l1
	ldsh	[%l7 + 0x44],	%i2
	ld	[%l7 + 0x40],	%f21
	add	%i4,	%o4,	%l6
	nop
	set	0x53, %g3
	stb	%i5,	[%l7 + %g3]
	edge32ln	%o0,	%g2,	%i0
	fmul8x16	%f30,	%f20,	%f2
	fmovdpos	%icc,	%f5,	%f6
	edge32ln	%i7,	%l5,	%l2
	alignaddr	%o3,	%g6,	%l0
	andncc	%i6,	%o2,	%l4
	movre	%i1,	%i3,	%o5
	ldsh	[%l7 + 0x10],	%o6
	fmovrslz	%o1,	%f10,	%f26
	mulx	%g4,	%g5,	%l3
	srl	%g1,	0x0F,	%g7
	save %o7, 0x1070, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i2,	%g3,	%o4
	andncc	%i4,	%l6,	%o0
	sdivx	%g2,	0x0CB8,	%i5
	ldx	[%l7 + 0x40],	%i7
	movre	%i0,	0x131,	%l2
	smul	%l5,	%o3,	%l0
	orn	%i6,	%o2,	%l4
	xnorcc	%g6,	%i1,	%i3
	edge8	%o6,	%o1,	%g4
	fnot1	%f14,	%f14
	fmovsleu	%xcc,	%f8,	%f20
	movrne	%g5,	%l3,	%g1
	srl	%o5,	0x16,	%g7
	stb	%l1,	[%l7 + 0x24]
	smul	%i2,	%o7,	%o4
	andcc	%i4,	%l6,	%o0
	sdiv	%g3,	0x1E63,	%g2
	ldd	[%l7 + 0x18],	%f8
	subc	%i7,	%i5,	%l2
	fmul8sux16	%f30,	%f6,	%f22
	fcmpeq32	%f18,	%f2,	%i0
	sub	%l5,	%o3,	%i6
	edge16l	%o2,	%l0,	%l4
	fmovdge	%icc,	%f5,	%f0
	edge32n	%i1,	%g6,	%i3
	fmovdpos	%icc,	%f0,	%f5
	edge8l	%o1,	%g4,	%g5
	fpack16	%f12,	%f28
	fandnot1s	%f23,	%f4,	%f21
	sllx	%o6,	%l3,	%g1
	umulcc	%o5,	0x1B5A,	%g7
	edge32n	%l1,	%i2,	%o4
	subc	%o7,	0x0D93,	%l6
	sub	%i4,	%g3,	%g2
	andncc	%o0,	%i5,	%l2
	sra	%i7,	0x01,	%l5
	movg	%icc,	%i0,	%o3
	restore %i6, %l0, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i1,	%g6,	%l4
	orcc	%o1,	0x146A,	%g4
	orcc	%i3,	0x07B6,	%o6
	movn	%xcc,	%l3,	%g5
	edge32ln	%o5,	%g1,	%l1
	edge16l	%g7,	%i2,	%o7
	st	%f14,	[%l7 + 0x50]
	sub	%o4,	0x0D98,	%i4
	andncc	%l6,	%g3,	%g2
	srlx	%i5,	%o0,	%l2
	sdiv	%i7,	0x1183,	%i0
	mulx	%o3,	%i6,	%l0
	andncc	%o2,	%l5,	%i1
	fabss	%f23,	%f23
	orncc	%g6,	0x1E87,	%o1
	movneg	%xcc,	%g4,	%l4
	fmovsl	%icc,	%f22,	%f10
	save %i3, 0x0977, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g5,	0x0825,	%o5
	umulcc	%o6,	%g1,	%l1
	ldd	[%l7 + 0x38],	%i2
	movrne	%o7,	%o4,	%i4
	movleu	%xcc,	%l6,	%g3
	movgu	%icc,	%g7,	%g2
	nop
	set	0x20, %o7
	ldx	[%l7 + %o7],	%o0
	srax	%i5,	0x0C,	%l2
	movl	%icc,	%i7,	%i0
	stx	%i6,	[%l7 + 0x58]
	srax	%l0,	%o2,	%o3
	sth	%i1,	[%l7 + 0x52]
	edge32n	%l5,	%g6,	%g4
	movvc	%icc,	%o1,	%i3
	stx	%l3,	[%l7 + 0x48]
	addcc	%g5,	%l4,	%o6
	fmovdleu	%xcc,	%f18,	%f6
	movpos	%xcc,	%g1,	%l1
	smulcc	%i2,	%o5,	%o4
	sdivx	%i4,	0x1B38,	%l6
	movleu	%icc,	%g3,	%g7
	movcs	%xcc,	%o7,	%g2
	movre	%i5,	0x248,	%o0
	movgu	%xcc,	%i7,	%l2
	fnot2	%f8,	%f24
	addc	%i0,	0x186B,	%i6
	udivcc	%l0,	0x0119,	%o3
	fmovrdlz	%o2,	%f14,	%f0
	movrne	%l5,	0x186,	%i1
	fandnot2s	%f20,	%f19,	%f15
	ldsb	[%l7 + 0x52],	%g4
	movrne	%g6,	0x0B2,	%o1
	fmovdneg	%xcc,	%f11,	%f13
	ldsw	[%l7 + 0x50],	%i3
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	smul	%g1,	%l1,	%i2
	movle	%icc,	%o6,	%o5
	and	%i4,	0x08DF,	%o4
	movpos	%icc,	%l6,	%g7
	fabss	%f17,	%f7
	edge16l	%o7,	%g2,	%g3
	add	%o0,	%i5,	%i7
	udiv	%i0,	0x1414,	%l2
	fand	%f22,	%f18,	%f4
	sdiv	%i6,	0x0D64,	%o3
	save %l0, 0x16EA, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%i1,	%g4
	ldd	[%l7 + 0x68],	%o2
	orncc	%g6,	0x05A4,	%i3
	lduw	[%l7 + 0x3C],	%l3
	fcmps	%fcc0,	%f29,	%f26
	sllx	%g5,	0x10,	%l4
	fmovdle	%icc,	%f17,	%f14
	movre	%o1,	0x10A,	%l1
	edge16ln	%g1,	%i2,	%o6
	ldsw	[%l7 + 0x7C],	%i4
	addcc	%o4,	0x1E3D,	%o5
	fcmple32	%f12,	%f0,	%g7
	movleu	%xcc,	%o7,	%g2
	or	%g3,	0x1365,	%o0
	udivx	%i5,	0x00B6,	%l6
	fcmpeq16	%f22,	%f30,	%i7
	sdivcc	%l2,	0x0DD9,	%i0
	movle	%xcc,	%i6,	%l0
	srax	%l5,	%o3,	%g4
	movrgez	%o2,	0x219,	%i1
	edge16ln	%i3,	%g6,	%l3
	fnot1s	%f14,	%f21
	fsrc1s	%f4,	%f16
	stx	%g5,	[%l7 + 0x30]
	sra	%l4,	0x11,	%o1
	fpsub32	%f28,	%f30,	%f30
	array32	%g1,	%i2,	%l1
	restore %i4, 0x176A, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o5,	%g7,	%o7
	movg	%icc,	%g2,	%g3
	ld	[%l7 + 0x08],	%f1
	movcc	%xcc,	%o0,	%o4
	movvs	%xcc,	%l6,	%i7
	edge8ln	%l2,	%i5,	%i6
	fexpand	%f12,	%f14
	add	%l0,	%l5,	%i0
	subcc	%g4,	0x0657,	%o3
	fnands	%f23,	%f23,	%f20
	ldd	[%l7 + 0x48],	%f28
	fmovrdgz	%o2,	%f16,	%f0
	movcs	%xcc,	%i1,	%i3
	edge32ln	%l3,	%g6,	%g5
	stb	%o1,	[%l7 + 0x09]
	fmuld8sux16	%f24,	%f21,	%f24
	popc	0x0117,	%g1
	andcc	%l4,	0x172F,	%l1
	edge32n	%i2,	%o6,	%i4
	fands	%f23,	%f3,	%f8
	fnands	%f2,	%f29,	%f4
	udivcc	%g7,	0x05BB,	%o5
	orncc	%o7,	0x1D94,	%g2
	add	%o0,	0x04F5,	%g3
	move	%xcc,	%o4,	%i7
	movge	%xcc,	%l2,	%i5
	sir	0x008D
	movrgz	%l6,	0x168,	%l0
	fmovsge	%xcc,	%f25,	%f31
	stb	%i6,	[%l7 + 0x61]
	fmovspos	%icc,	%f31,	%f26
	movleu	%icc,	%i0,	%l5
	stx	%g4,	[%l7 + 0x28]
	fmovrdlez	%o2,	%f24,	%f20
	ldx	[%l7 + 0x50],	%o3
	stx	%i3,	[%l7 + 0x70]
	sllx	%i1,	0x05,	%g6
	andcc	%l3,	%o1,	%g1
	edge16ln	%l4,	%l1,	%g5
	edge8l	%i2,	%i4,	%o6
	movn	%icc,	%g7,	%o5
	ldsb	[%l7 + 0x4C],	%o7
	fmuld8ulx16	%f2,	%f24,	%f24
	ldd	[%l7 + 0x30],	%f26
	udiv	%o0,	0x100D,	%g3
	movleu	%icc,	%o4,	%i7
	movrlz	%l2,	%i5,	%l6
	sdivcc	%l0,	0x184B,	%g2
	movcs	%xcc,	%i6,	%l5
	fandnot2s	%f0,	%f4,	%f31
	sll	%i0,	%g4,	%o2
	sll	%o3,	0x01,	%i3
	lduh	[%l7 + 0x16],	%g6
	movcc	%icc,	%l3,	%o1
	array8	%g1,	%l4,	%l1
	smulcc	%i1,	0x1CE3,	%i2
	nop
	set	0x1D, %i3
	ldsb	[%l7 + %i3],	%i4
	fmovsvs	%xcc,	%f19,	%f4
	subccc	%g5,	%o6,	%o5
	movre	%g7,	0x1D2,	%o7
	edge8l	%g3,	%o4,	%i7
	sra	%l2,	0x05,	%i5
	edge16l	%o0,	%l0,	%g2
	xor	%i6,	0x007B,	%l6
	ldsb	[%l7 + 0x1F],	%l5
	stb	%i0,	[%l7 + 0x37]
	fmovdg	%xcc,	%f3,	%f14
	movcs	%xcc,	%o2,	%g4
	umulcc	%i3,	%o3,	%g6
	fpadd16s	%f12,	%f11,	%f28
	edge16	%o1,	%g1,	%l4
	xorcc	%l1,	0x19A6,	%l3
	subcc	%i1,	0x1DE8,	%i2
	fcmpeq32	%f16,	%f6,	%i4
	fpadd16	%f16,	%f28,	%f24
	fmovdvc	%icc,	%f5,	%f26
	edge8n	%g5,	%o6,	%o5
	umulcc	%g7,	%g3,	%o4
	xnor	%o7,	0x1BCB,	%l2
	sdivx	%i5,	0x1C03,	%i7
	fmovsl	%xcc,	%f25,	%f29
	smulcc	%o0,	%g2,	%l0
	movre	%i6,	0x00B,	%l6
	ldd	[%l7 + 0x40],	%l4
	movrgez	%o2,	0x13A,	%g4
	smul	%i0,	0x1CDA,	%i3
	sdivx	%o3,	0x0E82,	%g6
	orn	%o1,	0x0279,	%l4
	fmovd	%f18,	%f28
	fpadd32s	%f24,	%f18,	%f22
	fpadd32s	%f19,	%f4,	%f20
	addcc	%l1,	0x12D7,	%g1
	edge16ln	%i1,	%l3,	%i4
	orn	%i2,	0x0513,	%g5
	fmovse	%icc,	%f31,	%f13
	alignaddrl	%o5,	%o6,	%g3
	fnands	%f5,	%f23,	%f17
	movrne	%g7,	%o4,	%l2
	fcmple16	%f20,	%f8,	%i5
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	movre	%l0,	0x0A1,	%o7
	movge	%xcc,	%i6,	%l6
	edge8l	%o2,	%g4,	%i0
	edge16l	%i3,	%l5,	%o3
	fnegd	%f24,	%f2
	fsrc2	%f14,	%f4
	fornot2	%f8,	%f6,	%f14
	move	%icc,	%g6,	%o1
	udivcc	%l4,	0x1317,	%g1
	fmovrdlez	%i1,	%f12,	%f4
	popc	0x0F36,	%l1
	sub	%i4,	%i2,	%l3
	movneg	%icc,	%g5,	%o6
	stw	%g3,	[%l7 + 0x64]
	fmovrde	%o5,	%f14,	%f28
	sdivx	%g7,	0x0403,	%l2
	array8	%i5,	%o4,	%o0
	movrlz	%i7,	%l0,	%o7
	restore %i6, %g2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o2,	%i0
	ldub	[%l7 + 0x36],	%g4
	sdivcc	%i3,	0x1B21,	%o3
	fcmple16	%f6,	%f16,	%g6
	andn	%l5,	0x1A88,	%o1
	alignaddr	%g1,	%l4,	%i1
	sdiv	%i4,	0x1954,	%l1
	movleu	%xcc,	%l3,	%i2
	edge8	%g5,	%o6,	%g3
	fpsub16s	%f28,	%f18,	%f26
	xnor	%g7,	0x05F2,	%o5
	orncc	%i5,	%o4,	%o0
	orcc	%i7,	0x0020,	%l0
	fsrc1	%f2,	%f20
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	movn	%xcc,	%g2,	%i6
	edge16n	%o2,	%i0,	%g4
	sub	%i3,	%l6,	%g6
	bshuffle	%f30,	%f28,	%f8
	movrlz	%o3,	0x2DF,	%o1
	xnor	%l5,	%l4,	%g1
	udiv	%i4,	0x0F2E,	%l1
	restore %l3, 0x0C0E, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g5,	0x17,	%o6
	fmovdl	%icc,	%f30,	%f22
	subccc	%g3,	0x1FDE,	%i2
	fmovsne	%xcc,	%f25,	%f6
	edge8	%g7,	%i5,	%o5
	fmovsn	%xcc,	%f9,	%f16
	add	%o4,	%i7,	%l0
	movrgez	%o0,	%l2,	%g2
	edge8n	%i6,	%o2,	%i0
	fmovsl	%icc,	%f20,	%f26
	movleu	%icc,	%g4,	%o7
	smul	%i3,	%l6,	%g6
	fcmpgt16	%f12,	%f2,	%o3
	edge8n	%o1,	%l4,	%g1
	edge32	%l5,	%i4,	%l1
	smulcc	%l3,	%g5,	%i1
	sll	%g3,	0x1D,	%o6
	srlx	%g7,	%i2,	%i5
	andncc	%o5,	%i7,	%o4
	andn	%l0,	%o0,	%g2
	andcc	%i6,	0x1CF7,	%l2
	orncc	%i0,	0x0319,	%o2
	movge	%xcc,	%g4,	%i3
	xor	%o7,	%l6,	%o3
	fcmpes	%fcc2,	%f3,	%f2
	fabss	%f27,	%f2
	andn	%o1,	%l4,	%g1
	fpadd32	%f2,	%f24,	%f22
	subc	%g6,	%l5,	%i4
	movg	%icc,	%l1,	%g5
	stw	%l3,	[%l7 + 0x18]
	movrlez	%i1,	%o6,	%g3
	mulx	%g7,	0x1CF0,	%i2
	for	%f28,	%f16,	%f4
	fnand	%f14,	%f2,	%f22
	std	%f28,	[%l7 + 0x08]
	addc	%i5,	%i7,	%o5
	smulcc	%l0,	0x1D4B,	%o4
	srlx	%g2,	0x05,	%o0
	fmovde	%xcc,	%f30,	%f16
	andcc	%l2,	0x1EDF,	%i0
	movrgz	%i6,	0x3B4,	%g4
	andcc	%i3,	%o7,	%l6
	edge16ln	%o2,	%o1,	%l4
	edge8ln	%o3,	%g6,	%g1
	fmovsvc	%xcc,	%f28,	%f22
	xnor	%l5,	0x1200,	%i4
	fmovspos	%xcc,	%f3,	%f28
	save %l1, 0x1E68, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%icc,	%f20,	%f12
	ldx	[%l7 + 0x78],	%l3
	movvs	%xcc,	%o6,	%g3
	and	%i1,	0x10C0,	%g7
	ldd	[%l7 + 0x68],	%i2
	addcc	%i5,	%o5,	%i7
	udivx	%l0,	0x0460,	%o4
	nop
	set	0x7E, %g1
	ldub	[%l7 + %g1],	%o0
	stw	%g2,	[%l7 + 0x5C]
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%l2
	sub	%i0,	0x15B7,	%i6
	movleu	%icc,	%g4,	%i3
	subccc	%l6,	0x058B,	%o7
	movgu	%icc,	%o2,	%o1
	fornot2s	%f18,	%f25,	%f14
	movle	%xcc,	%l4,	%o3
	stw	%g1,	[%l7 + 0x78]
	addc	%l5,	%g6,	%i4
	edge32n	%l1,	%g5,	%o6
	array16	%l3,	%i1,	%g3
	for	%f6,	%f6,	%f10
	orncc	%i2,	0x0261,	%g7
	srax	%o5,	0x1E,	%i7
	alignaddr	%i5,	%o4,	%l0
	movcc	%xcc,	%g2,	%o0
	movrgez	%l2,	%i0,	%g4
	edge8ln	%i3,	%i6,	%l6
	fmovrdlz	%o2,	%f12,	%f0
	edge16ln	%o7,	%o1,	%l4
	edge32	%o3,	%g1,	%g6
	fornot2	%f26,	%f6,	%f8
	xorcc	%i4,	%l5,	%l1
	alignaddr	%g5,	%l3,	%o6
	stx	%g3,	[%l7 + 0x18]
	movg	%icc,	%i2,	%g7
	fmuld8ulx16	%f22,	%f19,	%f8
	sra	%o5,	0x12,	%i1
	std	%f30,	[%l7 + 0x78]
	umul	%i7,	%o4,	%i5
	smul	%l0,	%o0,	%l2
	faligndata	%f30,	%f26,	%f6
	fmovsvc	%icc,	%f17,	%f3
	movg	%xcc,	%g2,	%i0
	edge8l	%g4,	%i6,	%i3
	udiv	%o2,	0x1B17,	%l6
	fpadd16	%f4,	%f16,	%f24
	fsrc2s	%f0,	%f12
	move	%icc,	%o7,	%l4
	movrgez	%o1,	0x1AF,	%o3
	xnor	%g1,	0x0D1D,	%i4
	movcc	%xcc,	%l5,	%g6
	movrlz	%l1,	%l3,	%g5
	movrlz	%g3,	0x02E,	%o6
	mulscc	%i2,	%g7,	%i1
	movl	%xcc,	%o5,	%o4
	andcc	%i7,	0x193A,	%l0
	andncc	%o0,	%l2,	%g2
	fmovrdlez	%i0,	%f22,	%f22
	fnot1s	%f0,	%f15
	sdivcc	%g4,	0x133E,	%i6
	edge16l	%i5,	%o2,	%l6
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	fmovsl	%xcc,	%f2,	%f14
	edge16	%o3,	%g1,	%o1
	edge16n	%l5,	%g6,	%l1
	stw	%i4,	[%l7 + 0x68]
	movneg	%xcc,	%l3,	%g5
	sll	%o6,	0x0F,	%i2
	xor	%g3,	%i1,	%o5
	fornot2s	%f2,	%f17,	%f12
	ldx	[%l7 + 0x70],	%g7
	movgu	%icc,	%i7,	%l0
	ld	[%l7 + 0x20],	%f30
	movvc	%icc,	%o0,	%l2
	udivcc	%g2,	0x12A3,	%o4
	orcc	%g4,	%i6,	%i5
	ldsb	[%l7 + 0x74],	%i0
	mova	%xcc,	%l6,	%o7
	fpsub32	%f20,	%f2,	%f2
	lduh	[%l7 + 0x30],	%i3
	nop
	set	0x50, %o4
	lduw	[%l7 + %o4],	%l4
	fmovrslz	%o2,	%f2,	%f19
	orncc	%g1,	%o1,	%l5
	movle	%icc,	%g6,	%l1
	movle	%xcc,	%o3,	%l3
	andncc	%g5,	%o6,	%i4
	smulcc	%g3,	0x0ABC,	%i2
	movvs	%icc,	%i1,	%o5
	fand	%f20,	%f6,	%f12
	sll	%g7,	0x0D,	%i7
	movge	%xcc,	%o0,	%l2
	smulcc	%l0,	%g2,	%g4
	umul	%i6,	0x06F8,	%i5
	udivx	%o4,	0x0A4D,	%l6
	edge8	%o7,	%i0,	%l4
	movre	%o2,	0x259,	%i3
	ldsw	[%l7 + 0x3C],	%g1
	save %o1, 0x0900, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l5,	0x0A,	%o3
	sdivx	%l1,	0x11C0,	%l3
	save %o6, 0x00D1, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x28],	%f2
	ldd	[%l7 + 0x08],	%g2
	addc	%i2,	0x0132,	%g5
	edge16l	%o5,	%g7,	%i1
	srlx	%o0,	0x13,	%l2
	srlx	%i7,	%g2,	%l0
	subcc	%g4,	%i6,	%o4
	movneg	%xcc,	%i5,	%o7
	stb	%i0,	[%l7 + 0x0B]
	fmovdl	%icc,	%f29,	%f3
	srlx	%l6,	0x1B,	%l4
	subccc	%i3,	%g1,	%o1
	umul	%g6,	%l5,	%o3
	ldd	[%l7 + 0x28],	%f20
	orcc	%o2,	0x1508,	%l1
	addccc	%o6,	%l3,	%g3
	smulcc	%i2,	0x0849,	%i4
	sdivx	%o5,	0x1AA8,	%g5
	udiv	%g7,	0x01B3,	%i1
	fzeros	%f0
	sllx	%o0,	%l2,	%g2
	addcc	%l0,	%g4,	%i6
	nop
	set	0x7B, %l2
	ldub	[%l7 + %l2],	%i7
	fpackfix	%f22,	%f30
	lduh	[%l7 + 0x68],	%o4
	sdivcc	%o7,	0x0098,	%i5
	movle	%xcc,	%i0,	%l6
	movrlez	%l4,	0x302,	%g1
	edge32ln	%o1,	%g6,	%i3
	popc	%l5,	%o3
	movrne	%o2,	%o6,	%l3
	umulcc	%g3,	%i2,	%i4
	movneg	%icc,	%l1,	%g5
	edge16	%o5,	%g7,	%i1
	movcc	%icc,	%o0,	%l2
	edge16l	%g2,	%g4,	%l0
	fnegd	%f30,	%f22
	ldsh	[%l7 + 0x2C],	%i6
	fmovscs	%icc,	%f23,	%f10
	edge8l	%i7,	%o7,	%i5
	mulx	%i0,	0x0D34,	%l6
	edge32n	%l4,	%g1,	%o1
	ldsh	[%l7 + 0x38],	%g6
	xor	%i3,	0x0C07,	%o4
	mulscc	%l5,	%o3,	%o6
	fcmps	%fcc2,	%f20,	%f4
	bshuffle	%f2,	%f30,	%f0
	fandnot2	%f6,	%f28,	%f2
	array8	%l3,	%g3,	%i2
	edge16l	%i4,	%l1,	%g5
	sllx	%o2,	0x1C,	%g7
	orcc	%i1,	0x0C3E,	%o5
	fmovde	%icc,	%f5,	%f21
	xorcc	%l2,	0x0AD6,	%o0
	movle	%icc,	%g2,	%g4
	popc	%i6,	%l0
	lduh	[%l7 + 0x08],	%i7
	movpos	%icc,	%o7,	%i5
	fpsub16	%f18,	%f30,	%f24
	movge	%xcc,	%l6,	%i0
	mova	%xcc,	%l4,	%g1
	fmul8x16	%f16,	%f28,	%f28
	smul	%o1,	0x0630,	%i3
	movcs	%icc,	%o4,	%g6
	movleu	%xcc,	%o3,	%l5
	fmovrde	%l3,	%f16,	%f2
	bshuffle	%f12,	%f8,	%f30
	ldd	[%l7 + 0x68],	%g2
	sdivx	%i2,	0x1FDC,	%i4
	mulscc	%l1,	%g5,	%o2
	fpsub16s	%f25,	%f29,	%f2
	movle	%icc,	%g7,	%o6
	add	%o5,	0x0304,	%l2
	nop
	set	0x30, %l4
	stb	%o0,	[%l7 + %l4]
	ldd	[%l7 + 0x30],	%f12
	srlx	%i1,	0x0F,	%g4
	edge8	%g2,	%i6,	%i7
	edge32	%l0,	%o7,	%i5
	array16	%i0,	%l4,	%g1
	fornot2	%f6,	%f12,	%f8
	mulscc	%l6,	0x173E,	%i3
	fexpand	%f5,	%f30
	ldd	[%l7 + 0x28],	%f28
	movne	%xcc,	%o1,	%o4
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%f6
	fmovdne	%icc,	%f13,	%f25
	popc	%g6,	%o3
	nop
	set	0x58, %g2
	stw	%l5,	[%l7 + %g2]
	sethi	0x0D7C,	%l3
	xor	%g3,	%i4,	%l1
	fmovrse	%g5,	%f26,	%f0
	fzeros	%f1
	and	%i2,	%o2,	%o6
	sethi	0x1317,	%g7
	movrgz	%o5,	0x2B7,	%o0
	edge8	%l2,	%i1,	%g4
	and	%g2,	0x1EA8,	%i7
	sethi	0x0953,	%i6
	lduw	[%l7 + 0x70],	%o7
	movn	%xcc,	%i5,	%l0
	fcmpne16	%f0,	%f24,	%i0
	movcc	%xcc,	%l4,	%l6
	srlx	%i3,	%o1,	%g1
	sdivx	%g6,	0x0250,	%o4
	movcc	%xcc,	%o3,	%l3
	lduh	[%l7 + 0x46],	%g3
	fxnor	%f20,	%f22,	%f2
	fmovsvs	%icc,	%f0,	%f31
	andn	%l5,	%l1,	%i4
	movrlez	%i2,	%o2,	%g5
	lduh	[%l7 + 0x3E],	%o6
	st	%f31,	[%l7 + 0x68]
	ldsh	[%l7 + 0x14],	%o5
	mova	%icc,	%g7,	%l2
	udivx	%i1,	0x1309,	%o0
	fcmpne16	%f30,	%f12,	%g4
	fpsub16	%f22,	%f6,	%f6
	edge8l	%g2,	%i6,	%o7
	alignaddrl	%i7,	%l0,	%i0
	fandnot2s	%f1,	%f22,	%f20
	siam	0x4
	movrgz	%i5,	0x008,	%l4
	fnot1	%f8,	%f10
	movrgez	%i3,	0x3D8,	%l6
	edge16n	%o1,	%g1,	%o4
	subcc	%g6,	0x17A7,	%l3
	edge16n	%g3,	%l5,	%l1
	and	%o3,	0x084F,	%i2
	fcmple16	%f2,	%f10,	%o2
	fmovrsgez	%g5,	%f27,	%f23
	movle	%xcc,	%i4,	%o5
	movrlez	%g7,	0x2E4,	%l2
	subcc	%o6,	%o0,	%g4
	faligndata	%f24,	%f0,	%f0
	umulcc	%g2,	%i1,	%i6
	popc	0x172B,	%o7
	edge16l	%i7,	%l0,	%i0
	andcc	%l4,	0x025F,	%i3
	movrne	%i5,	0x1DA,	%l6
	movrgz	%o1,	0x2C1,	%g1
	move	%icc,	%o4,	%l3
	movpos	%xcc,	%g3,	%g6
	ldx	[%l7 + 0x20],	%l5
	edge16ln	%l1,	%o3,	%o2
	edge32	%g5,	%i4,	%i2
	andncc	%o5,	%l2,	%o6
	array8	%g7,	%o0,	%g2
	movcc	%icc,	%i1,	%g4
	addccc	%i6,	0x0614,	%i7
	udivx	%o7,	0x03C7,	%i0
	edge32ln	%l0,	%l4,	%i3
	fxor	%f20,	%f22,	%f10
	movn	%icc,	%i5,	%l6
	xnorcc	%o1,	0x0905,	%g1
	mova	%xcc,	%o4,	%g3
	edge8	%g6,	%l3,	%l1
	srl	%o3,	0x03,	%o2
	restore %g5, %i4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l5,	0x0E27,	%l2
	sdivx	%o5,	0x02A5,	%o6
	lduh	[%l7 + 0x36],	%g7
	fmovrslz	%g2,	%f10,	%f31
	edge16n	%o0,	%g4,	%i6
	stw	%i1,	[%l7 + 0x14]
	addc	%i7,	%i0,	%l0
	movrgz	%o7,	0x30B,	%i3
	sth	%i5,	[%l7 + 0x42]
	ldsh	[%l7 + 0x32],	%l4
	fsrc2s	%f9,	%f21
	mulx	%l6,	0x15AA,	%g1
	srl	%o1,	0x17,	%o4
	ldx	[%l7 + 0x08],	%g6
	fand	%f0,	%f14,	%f12
	fmovspos	%xcc,	%f2,	%f12
	addcc	%g3,	0x105F,	%l3
	movre	%l1,	%o2,	%o3
	movrgez	%g5,	%i2,	%l5
	fcmpes	%fcc3,	%f2,	%f0
	nop
	set	0x50, %l3
	ldx	[%l7 + %l3],	%i4
	orn	%o5,	0x070C,	%l2
	sll	%g7,	0x1D,	%o6
	subcc	%o0,	0x08A9,	%g2
	movne	%icc,	%i6,	%i1
	fmovs	%f3,	%f2
	fornot2s	%f26,	%f12,	%f23
	xnor	%g4,	0x0AD1,	%i7
	popc	0x1D12,	%i0
	smul	%o7,	%i3,	%i5
	movpos	%icc,	%l4,	%l6
	movcc	%icc,	%g1,	%l0
	orncc	%o4,	%g6,	%o1
	array32	%g3,	%l3,	%l1
	movvc	%icc,	%o3,	%g5
	edge16l	%i2,	%l5,	%i4
	fands	%f1,	%f30,	%f19
	fpadd32	%f12,	%f22,	%f0
	orcc	%o2,	%l2,	%g7
	srax	%o5,	0x1A,	%o0
	sub	%g2,	0x152E,	%o6
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	fmovse	%xcc,	%f20,	%f19
	movle	%icc,	%i0,	%i7
	edge16n	%i3,	%i5,	%o7
	edge16n	%l4,	%g1,	%l6
	fands	%f27,	%f25,	%f30
	lduw	[%l7 + 0x38],	%o4
	sdiv	%g6,	0x1E68,	%o1
	udiv	%l0,	0x1112,	%l3
	xnor	%l1,	0x0D10,	%o3
	std	%f2,	[%l7 + 0x48]
	ldx	[%l7 + 0x58],	%g3
	xorcc	%g5,	0x04B8,	%l5
	fandnot2s	%f16,	%f5,	%f11
	edge16ln	%i2,	%o2,	%l2
	fmovdge	%xcc,	%f15,	%f13
	popc	0x1AEC,	%g7
	smulcc	%o5,	0x1881,	%o0
	edge16	%g2,	%o6,	%i4
	ldx	[%l7 + 0x58],	%i6
	popc	0x1F47,	%g4
	smulcc	%i0,	0x02A6,	%i7
	sth	%i1,	[%l7 + 0x38]
	fmuld8ulx16	%f26,	%f20,	%f10
	edge8l	%i5,	%i3,	%l4
	movpos	%xcc,	%o7,	%g1
	mulscc	%o4,	0x17B4,	%l6
	fmovd	%f2,	%f30
	ldd	[%l7 + 0x38],	%o0
	fmovsleu	%xcc,	%f3,	%f14
	fmovsl	%xcc,	%f29,	%f13
	sdivx	%g6,	0x15FE,	%l3
	movl	%icc,	%l1,	%l0
	movvs	%icc,	%g3,	%o3
	movl	%xcc,	%l5,	%g5
	movvs	%icc,	%o2,	%i2
	alignaddrl	%l2,	%g7,	%o5
	xorcc	%o0,	0x1546,	%g2
	alignaddrl	%o6,	%i4,	%g4
	sub	%i6,	%i7,	%i0
	movre	%i5,	0x104,	%i1
	addcc	%i3,	0x088D,	%o7
	movne	%icc,	%l4,	%o4
	addc	%g1,	%l6,	%o1
	edge8	%g6,	%l1,	%l0
	ldx	[%l7 + 0x60],	%l3
	fmovdleu	%xcc,	%f13,	%f7
	movrgez	%o3,	0x214,	%g3
	stw	%g5,	[%l7 + 0x64]
	movleu	%xcc,	%o2,	%l5
	fcmpes	%fcc1,	%f3,	%f15
	andncc	%l2,	%g7,	%i2
	array16	%o5,	%o0,	%g2
	fmovsg	%icc,	%f13,	%f0
	srlx	%i4,	%o6,	%i6
	edge8	%i7,	%g4,	%i0
	sdivcc	%i5,	0x1E36,	%i3
	movne	%icc,	%i1,	%o7
	udivcc	%o4,	0x1910,	%g1
	or	%l6,	%o1,	%l4
	stb	%g6,	[%l7 + 0x4D]
	fmul8x16	%f4,	%f6,	%f16
	move	%xcc,	%l1,	%l3
	movrlz	%l0,	%g3,	%o3
	movrlz	%g5,	%o2,	%l5
	movn	%xcc,	%l2,	%g7
	orcc	%o5,	0x0522,	%o0
	edge16	%g2,	%i2,	%i4
	fcmpeq32	%f6,	%f24,	%i6
	andcc	%i7,	0x1FBB,	%o6
	movrlez	%i0,	%g4,	%i5
	ldd	[%l7 + 0x08],	%i2
	sllx	%o7,	0x02,	%i1
	edge16n	%g1,	%l6,	%o1
	fpsub32s	%f17,	%f5,	%f8
	mulscc	%l4,	0x15B4,	%o4
	sdivcc	%l1,	0x1262,	%g6
	fmovsl	%xcc,	%f7,	%f28
	andn	%l0,	%g3,	%l3
	nop
	set	0x4F, %l6
	stb	%g5,	[%l7 + %l6]
	udivcc	%o3,	0x133F,	%l5
	edge8n	%l2,	%o2,	%g7
	movge	%icc,	%o0,	%g2
	umulcc	%i2,	0x07E2,	%o5
	movn	%xcc,	%i6,	%i4
	fxnors	%f30,	%f4,	%f31
	fmovsa	%icc,	%f6,	%f20
	fxnors	%f24,	%f28,	%f12
	ldd	[%l7 + 0x10],	%i6
	edge16ln	%o6,	%g4,	%i0
	movge	%xcc,	%i5,	%i3
	fxors	%f5,	%f2,	%f17
	fmul8ulx16	%f8,	%f8,	%f10
	save %o7, 0x0C3E, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%l6,	%g1
	lduw	[%l7 + 0x78],	%l4
	fmuld8ulx16	%f1,	%f31,	%f20
	std	%f22,	[%l7 + 0x10]
	ldx	[%l7 + 0x30],	%o4
	orncc	%l1,	0x0B71,	%g6
	fcmpd	%fcc0,	%f8,	%f22
	mova	%icc,	%o1,	%l0
	xor	%l3,	0x08CA,	%g3
	stx	%o3,	[%l7 + 0x60]
	ldsw	[%l7 + 0x5C],	%g5
	movrne	%l5,	%l2,	%o2
	subcc	%o0,	0x0C81,	%g7
	fnot2	%f0,	%f24
	edge32l	%g2,	%i2,	%i6
	array16	%i4,	%o5,	%i7
	stb	%o6,	[%l7 + 0x55]
	orn	%g4,	0x11D7,	%i5
	or	%i0,	0x04EE,	%i3
	movg	%icc,	%o7,	%i1
	st	%f9,	[%l7 + 0x78]
	andcc	%g1,	0x0CF7,	%l6
	movre	%o4,	0x238,	%l4
	movcs	%icc,	%l1,	%g6
	and	%l0,	0x10F3,	%l3
	fmovdleu	%xcc,	%f1,	%f28
	addccc	%g3,	%o1,	%g5
	mova	%icc,	%l5,	%o3
	orncc	%o2,	0x08BD,	%l2
	fnegs	%f17,	%f26
	ldx	[%l7 + 0x60],	%o0
	udivcc	%g2,	0x00ED,	%i2
	sdivx	%g7,	0x1AF5,	%i4
	array8	%o5,	%i7,	%i6
	umul	%g4,	0x0244,	%o6
	fmovrslez	%i0,	%f26,	%f2
	array8	%i5,	%o7,	%i1
	sdiv	%g1,	0x0EBC,	%i3
	andn	%l6,	%l4,	%o4
	subccc	%l1,	0x185D,	%g6
	fandnot2s	%f0,	%f27,	%f0
	sdivx	%l3,	0x01B8,	%g3
	fmovda	%xcc,	%f24,	%f6
	sra	%l0,	0x1A,	%o1
	st	%f14,	[%l7 + 0x34]
	movleu	%icc,	%g5,	%o3
	fandnot2s	%f2,	%f0,	%f15
	movge	%xcc,	%o2,	%l2
	srlx	%o0,	0x18,	%l5
	st	%f26,	[%l7 + 0x50]
	srax	%i2,	0x00,	%g7
	movneg	%icc,	%g2,	%i4
	udivx	%i7,	0x0D66,	%o5
	xor	%i6,	%o6,	%g4
	movne	%icc,	%i0,	%o7
	srlx	%i1,	0x14,	%g1
	fmovrse	%i3,	%f28,	%f14
	movvs	%xcc,	%i5,	%l6
	andcc	%o4,	0x0536,	%l4
	movg	%xcc,	%l1,	%g6
	and	%g3,	0x0B45,	%l0
	mulscc	%l3,	%g5,	%o3
	fandnot2s	%f28,	%f7,	%f17
	smulcc	%o1,	%o2,	%o0
	andncc	%l2,	%i2,	%g7
	ldx	[%l7 + 0x40],	%l5
	restore %g2, 0x0229, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o5,	%i6,	%o6
	save %i4, %g4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x58],	%i1
	xnor	%o7,	%i3,	%g1
	fnands	%f22,	%f3,	%f4
	fmovscc	%xcc,	%f18,	%f2
	addcc	%i5,	%l6,	%l4
	fmovsne	%xcc,	%f21,	%f20
	subccc	%o4,	0x0D90,	%g6
	fandnot2s	%f2,	%f26,	%f31
	fmovdcc	%icc,	%f19,	%f27
	lduh	[%l7 + 0x16],	%l1
	xorcc	%g3,	0x0EC3,	%l0
	udivx	%g5,	0x1761,	%l3
	movpos	%icc,	%o1,	%o2
	movrlz	%o0,	%l2,	%o3
	movl	%icc,	%g7,	%l5
	sir	0x13A5
	movle	%icc,	%g2,	%i2
	fmovsle	%xcc,	%f1,	%f30
	sll	%o5,	0x11,	%i6
	fmul8ulx16	%f26,	%f24,	%f18
	fmovrse	%i7,	%f10,	%f2
	sth	%o6,	[%l7 + 0x5A]
	fmovs	%f18,	%f20
	srl	%g4,	0x02,	%i4
	popc	%i0,	%o7
	fmovrse	%i3,	%f21,	%f26
	ldub	[%l7 + 0x74],	%i1
	orcc	%g1,	0x16E4,	%l6
	movleu	%xcc,	%i5,	%o4
	move	%xcc,	%l4,	%l1
	fmovdcs	%icc,	%f18,	%f29
	sllx	%g6,	0x10,	%l0
	movrne	%g5,	%g3,	%l3
	movcc	%icc,	%o2,	%o0
	edge32n	%l2,	%o3,	%g7
	ldd	[%l7 + 0x60],	%l4
	xnor	%g2,	0x17F6,	%o1
	st	%f1,	[%l7 + 0x20]
	andn	%o5,	%i6,	%i7
	movneg	%xcc,	%i2,	%g4
	fmul8x16al	%f31,	%f10,	%f26
	sir	0x1C8A
	edge32	%o6,	%i4,	%o7
	ld	[%l7 + 0x6C],	%f2
	fmovsl	%icc,	%f17,	%f18
	array8	%i3,	%i0,	%i1
	fmovsl	%xcc,	%f15,	%f15
	edge16ln	%g1,	%i5,	%o4
	lduw	[%l7 + 0x44],	%l6
	fmovrse	%l1,	%f9,	%f15
	fcmped	%fcc2,	%f16,	%f12
	sdivcc	%g6,	0x017B,	%l4
	movrgez	%l0,	0x0CA,	%g3
	lduw	[%l7 + 0x6C],	%l3
	edge16	%g5,	%o2,	%l2
	move	%xcc,	%o3,	%g7
	std	%f18,	[%l7 + 0x10]
	array8	%l5,	%o0,	%g2
	sdiv	%o5,	0x0165,	%o1
	subc	%i7,	0x035A,	%i2
	addc	%i6,	0x0144,	%g4
	edge8l	%o6,	%i4,	%o7
	std	%f0,	[%l7 + 0x30]
	movrlez	%i0,	%i1,	%g1
	sethi	0x0CDC,	%i5
	xnor	%o4,	0x059E,	%i3
	movcs	%icc,	%l1,	%l6
	sdivcc	%l4,	0x0DDE,	%g6
	orncc	%l0,	0x1841,	%g3
	ldsh	[%l7 + 0x56],	%l3
	ld	[%l7 + 0x20],	%f12
	sub	%o2,	%g5,	%o3
	addc	%g7,	0x0C48,	%l2
	alignaddrl	%l5,	%o0,	%o5
	smulcc	%g2,	0x1D24,	%i7
	movrne	%o1,	0x0EB,	%i2
	array8	%i6,	%o6,	%i4
	ldd	[%l7 + 0x38],	%f24
	fmovsa	%xcc,	%f11,	%f0
	movge	%xcc,	%o7,	%g4
	movrne	%i0,	%g1,	%i5
	array8	%o4,	%i1,	%l1
	umulcc	%i3,	%l4,	%g6
	srlx	%l6,	%g3,	%l3
	array32	%l0,	%o2,	%g5
	sllx	%o3,	0x04,	%l2
	edge16n	%g7,	%o0,	%o5
	movne	%xcc,	%l5,	%i7
	orn	%o1,	0x0D8C,	%i2
	save %g2, %i6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o6,	0x03C,	%o7
	movge	%xcc,	%g4,	%i0
	addccc	%i5,	%g1,	%o4
	sir	0x0D27
	fcmpeq16	%f18,	%f8,	%l1
	movrlez	%i1,	0x197,	%l4
	and	%g6,	0x115B,	%i3
	edge16n	%g3,	%l3,	%l0
	fcmpes	%fcc2,	%f6,	%f18
	sdiv	%l6,	0x0040,	%o2
	sdivx	%g5,	0x0575,	%l2
	lduw	[%l7 + 0x28],	%o3
	movge	%xcc,	%g7,	%o5
	mulx	%o0,	0x1683,	%i7
	srlx	%l5,	%o1,	%g2
	array8	%i2,	%i6,	%i4
	udivx	%o7,	0x12B5,	%o6
	edge8l	%g4,	%i0,	%i5
	move	%icc,	%o4,	%l1
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	edge16n	%l4,	%g3,	%l3
	addcc	%i3,	0x1793,	%l0
	edge32ln	%o2,	%g5,	%l2
	fmovda	%icc,	%f30,	%f6
	array32	%l6,	%g7,	%o5
	srlx	%o0,	0x12,	%i7
	edge32ln	%l5,	%o1,	%g2
	array16	%i2,	%i6,	%i4
	addc	%o3,	%o6,	%o7
	addcc	%g4,	%i5,	%o4
	ldub	[%l7 + 0x4A],	%l1
	ld	[%l7 + 0x50],	%f5
	fpadd16	%f22,	%f20,	%f26
	fexpand	%f8,	%f24
	xorcc	%g1,	%i0,	%g6
	mulscc	%l4,	0x156E,	%g3
	movcc	%xcc,	%l3,	%i1
	fmul8ulx16	%f4,	%f2,	%f8
	ldd	[%l7 + 0x08],	%f18
	alignaddrl	%i3,	%l0,	%g5
	sdivx	%l2,	0x1CA5,	%l6
	edge32n	%g7,	%o5,	%o2
	ldd	[%l7 + 0x08],	%i6
	move	%icc,	%l5,	%o1
	subccc	%o0,	%g2,	%i2
	stb	%i6,	[%l7 + 0x24]
	fandnot2s	%f3,	%f18,	%f7
	movneg	%icc,	%o3,	%o6
	fmovrdlez	%o7,	%f24,	%f10
	sth	%i4,	[%l7 + 0x14]
	lduh	[%l7 + 0x64],	%g4
	array16	%o4,	%l1,	%g1
	fcmpeq32	%f22,	%f0,	%i0
	mova	%xcc,	%i5,	%g6
	smul	%g3,	0x0837,	%l3
	sra	%l4,	%i1,	%i3
	fmovdleu	%xcc,	%f25,	%f10
	edge8l	%l0,	%l2,	%l6
	fpadd32s	%f10,	%f20,	%f17
	subc	%g7,	%o5,	%g5
	or	%i7,	%l5,	%o2
	sll	%o0,	%g2,	%o1
	stw	%i6,	[%l7 + 0x74]
	array16	%i2,	%o3,	%o7
	movrlez	%i4,	%o6,	%o4
	fnot2s	%f4,	%f1
	udiv	%g4,	0x0667,	%g1
	fornot1	%f4,	%f8,	%f14
	addcc	%l1,	0x1656,	%i0
	srlx	%g6,	%i5,	%g3
	array32	%l3,	%i1,	%i3
	movl	%xcc,	%l4,	%l2
	udivcc	%l0,	0x07F7,	%l6
	fornot1s	%f18,	%f23,	%f26
	std	%f22,	[%l7 + 0x48]
	sllx	%g7,	%o5,	%g5
	mova	%icc,	%i7,	%l5
	movrne	%o0,	%g2,	%o1
	move	%icc,	%i6,	%o2
	popc	0x157D,	%o3
	fmovdg	%icc,	%f11,	%f26
	lduh	[%l7 + 0x7C],	%o7
	sdiv	%i4,	0x184F,	%o6
	array8	%i2,	%o4,	%g1
	move	%icc,	%l1,	%i0
	lduh	[%l7 + 0x24],	%g6
	for	%f18,	%f6,	%f8
	udivcc	%g4,	0x05EF,	%g3
	fpadd16s	%f29,	%f29,	%f13
	fmovspos	%xcc,	%f12,	%f0
	srl	%i5,	0x0F,	%l3
	lduh	[%l7 + 0x5C],	%i3
	fpsub32	%f4,	%f2,	%f22
	movvs	%xcc,	%i1,	%l4
	fmovscc	%icc,	%f20,	%f1
	save %l2, %l0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o5,	%g5,	%g7
	subccc	%i7,	0x0CBB,	%l5
	andcc	%o0,	0x11D4,	%g2
	movneg	%xcc,	%o1,	%o2
	orncc	%o3,	0x003D,	%o7
	sllx	%i4,	0x16,	%o6
	sra	%i2,	0x10,	%o4
	array32	%i6,	%l1,	%g1
	popc	0x0099,	%g6
	mulscc	%i0,	%g3,	%i5
	movg	%xcc,	%g4,	%l3
	mulscc	%i3,	0x12B9,	%i1
	fsrc2	%f14,	%f24
	edge16	%l2,	%l0,	%l4
	edge16	%o5,	%g5,	%l6
	udivx	%i7,	0x1A3B,	%l5
	edge32n	%g7,	%o0,	%g2
	xnorcc	%o2,	%o1,	%o3
	edge16	%i4,	%o6,	%o7
	srlx	%o4,	%i6,	%i2
	umulcc	%l1,	%g6,	%g1
	edge16	%g3,	%i0,	%g4
	sdivcc	%l3,	0x1834,	%i5
	movvc	%xcc,	%i1,	%i3
	smul	%l0,	0x150E,	%l2
	movle	%xcc,	%l4,	%g5
	popc	0x1E08,	%l6
	movleu	%icc,	%o5,	%l5
	movgu	%icc,	%i7,	%o0
	array8	%g7,	%g2,	%o2
	st	%f0,	[%l7 + 0x64]
	mulx	%o1,	%o3,	%i4
	xnor	%o6,	0x1493,	%o7
	smul	%i6,	0x0395,	%o4
	lduh	[%l7 + 0x44],	%i2
	srl	%l1,	0x14,	%g1
	movneg	%icc,	%g3,	%g6
	movl	%xcc,	%g4,	%i0
	smul	%l3,	%i5,	%i3
	smulcc	%l0,	0x0300,	%i1
	sdivx	%l4,	0x00F9,	%l2
	and	%g5,	0x007F,	%l6
	orn	%o5,	0x1FF1,	%l5
	smul	%i7,	%o0,	%g7
	sdiv	%g2,	0x1169,	%o2
	udivcc	%o3,	0x1C3D,	%o1
	save %o6, 0x1E70, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i4,	0x1DB3,	%i6
	movcs	%icc,	%o4,	%l1
	movrgz	%i2,	0x37B,	%g1
	edge8ln	%g6,	%g4,	%g3
	sll	%i0,	%l3,	%i3
	edge8l	%i5,	%l0,	%l4
	movleu	%icc,	%i1,	%l2
	movvs	%xcc,	%g5,	%o5
	fpack16	%f8,	%f31
	edge32ln	%l6,	%i7,	%l5
	smulcc	%o0,	%g2,	%g7
	sllx	%o3,	0x06,	%o1
	movpos	%icc,	%o6,	%o7
	sdiv	%o2,	0x1D1D,	%i4
	srax	%i6,	%l1,	%i2
	stx	%g1,	[%l7 + 0x68]
	fcmpd	%fcc1,	%f10,	%f2
	mulx	%o4,	%g6,	%g3
	fmovsg	%icc,	%f0,	%f13
	ldx	[%l7 + 0x70],	%g4
	sllx	%l3,	0x07,	%i3
	fnands	%f9,	%f10,	%f15
	mulx	%i5,	0x093E,	%i0
	fmovdgu	%xcc,	%f0,	%f7
	fpsub16s	%f1,	%f8,	%f0
	movvs	%icc,	%l4,	%l0
	movrne	%i1,	0x135,	%g5
	udivcc	%l2,	0x0BE9,	%l6
	edge16	%o5,	%i7,	%o0
	movrlez	%l5,	0x0D4,	%g2
	movre	%g7,	%o3,	%o1
	edge16ln	%o7,	%o2,	%o6
	std	%f2,	[%l7 + 0x28]
	movpos	%xcc,	%i4,	%i6
	stx	%i2,	[%l7 + 0x60]
	fmovsn	%icc,	%f18,	%f26
	srlx	%l1,	0x17,	%g1
	edge16	%o4,	%g3,	%g6
	fpadd16	%f0,	%f2,	%f8
	movrlz	%l3,	%i3,	%i5
	movvs	%xcc,	%g4,	%l4
	udiv	%l0,	0x0167,	%i1
	xor	%i0,	%g5,	%l2
	stw	%o5,	[%l7 + 0x14]
	movpos	%xcc,	%i7,	%l6
	array16	%o0,	%l5,	%g7
	fzeros	%f20
	addccc	%g2,	%o3,	%o1
	andn	%o7,	0x06F2,	%o6
	fmovrslez	%i4,	%f30,	%f20
	andncc	%i6,	%o2,	%l1
	edge8ln	%g1,	%o4,	%i2
	fmovdg	%xcc,	%f8,	%f22
	edge16ln	%g6,	%g3,	%i3
	smulcc	%l3,	%i5,	%l4
	movrgez	%l0,	%i1,	%i0
	edge32n	%g5,	%l2,	%o5
	st	%f16,	[%l7 + 0x1C]
	sll	%g4,	0x13,	%i7
	subc	%o0,	0x0ECC,	%l5
	fmovrdlez	%l6,	%f18,	%f8
	ldub	[%l7 + 0x2E],	%g7
	alignaddr	%o3,	%o1,	%o7
	fmovsge	%icc,	%f6,	%f26
	move	%xcc,	%g2,	%o6
	fmul8x16	%f7,	%f22,	%f16
	ld	[%l7 + 0x24],	%f18
	fcmpeq16	%f8,	%f22,	%i6
	smulcc	%o2,	%l1,	%g1
	addcc	%i4,	0x1195,	%i2
	fcmpne16	%f20,	%f22,	%g6
	fabsd	%f0,	%f6
	sll	%o4,	0x13,	%i3
	edge16	%l3,	%i5,	%g3
	mulscc	%l0,	0x1A4E,	%i1
	fmovrslz	%l4,	%f13,	%f2
	umulcc	%i0,	0x0BA4,	%l2
	edge16ln	%g5,	%g4,	%o5
	or	%o0,	%i7,	%l5
	orncc	%g7,	0x1659,	%l6
	movge	%xcc,	%o1,	%o7
	edge16l	%o3,	%g2,	%o6
	add	%i6,	0x13DE,	%o2
	fpack16	%f20,	%f19
	movrne	%l1,	%i4,	%g1
	movrgz	%i2,	0x36F,	%o4
	movrne	%i3,	0x2F2,	%g6
	fpmerge	%f29,	%f10,	%f16
	movrne	%i5,	%l3,	%g3
	add	%l0,	0x19E8,	%i1
	srax	%l4,	%l2,	%i0
	fandnot1	%f18,	%f20,	%f26
	sllx	%g5,	0x1F,	%o5
	edge8ln	%g4,	%o0,	%i7
	popc	0x123B,	%g7
	save %l5, 0x088A, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o1,	%o3
	umul	%o7,	%o6,	%g2
	umulcc	%o2,	%i6,	%i4
	xnor	%l1,	%i2,	%g1
	movneg	%icc,	%o4,	%g6
	edge16n	%i3,	%i5,	%l3
	andcc	%g3,	%i1,	%l0
	lduh	[%l7 + 0x08],	%l4
	sdivcc	%i0,	0x08F1,	%g5
	and	%o5,	0x05DF,	%l2
	edge8l	%g4,	%i7,	%g7
	array8	%l5,	%o0,	%l6
	fcmpeq32	%f12,	%f20,	%o3
	stx	%o1,	[%l7 + 0x30]
	movne	%icc,	%o6,	%g2
	fcmpeq16	%f14,	%f4,	%o2
	fexpand	%f1,	%f18
	fsrc2	%f22,	%f26
	umulcc	%o7,	%i4,	%l1
	array8	%i6,	%i2,	%g1
	fnand	%f22,	%f18,	%f20
	subc	%o4,	0x07A3,	%i3
	andncc	%g6,	%i5,	%l3
	xorcc	%g3,	%l0,	%l4
	fmovrsgez	%i1,	%f26,	%f4
	movvs	%icc,	%g5,	%i0
	fmovdcs	%icc,	%f23,	%f29
	edge32l	%o5,	%g4,	%l2
	udiv	%g7,	0x1E31,	%i7
	edge16n	%o0,	%l5,	%l6
	fnegd	%f6,	%f8
	mulx	%o1,	%o6,	%g2
	edge8l	%o3,	%o7,	%o2
	movvs	%icc,	%l1,	%i4
	orcc	%i2,	%i6,	%o4
	movrlz	%i3,	0x1BC,	%g1
	xorcc	%i5,	%l3,	%g6
	fmovdne	%icc,	%f15,	%f3
	sdivx	%l0,	0x0650,	%l4
	movrgz	%g3,	0x29C,	%i1
	pdist	%f2,	%f8,	%f30
	subc	%g5,	%o5,	%g4
	alignaddrl	%i0,	%l2,	%i7
	ldub	[%l7 + 0x12],	%o0
	andcc	%l5,	0x00B9,	%g7
	edge16	%o1,	%l6,	%o6
	edge16l	%o3,	%g2,	%o2
	fpsub16	%f14,	%f28,	%f30
	subc	%o7,	%l1,	%i2
	fcmpd	%fcc0,	%f28,	%f4
	fmovrsgz	%i6,	%f1,	%f17
	edge32l	%i4,	%i3,	%g1
	sethi	0x1AAD,	%o4
	xorcc	%i5,	%l3,	%g6
	fmovrde	%l4,	%f14,	%f6
	fnands	%f19,	%f1,	%f20
	movg	%icc,	%l0,	%i1
	udiv	%g5,	0x1AC9,	%g3
	edge32n	%o5,	%i0,	%l2
	fmuld8sux16	%f9,	%f12,	%f28
	stw	%g4,	[%l7 + 0x38]
	edge8ln	%i7,	%l5,	%g7
	andcc	%o0,	%l6,	%o6
	sdivcc	%o3,	0x0DC8,	%g2
	andncc	%o1,	%o2,	%l1
	sdivx	%i2,	0x0028,	%o7
	srax	%i6,	0x0A,	%i3
	fnor	%f12,	%f4,	%f28
	fpadd16s	%f16,	%f25,	%f27
	fnand	%f2,	%f2,	%f30
	fmovdn	%icc,	%f31,	%f7
	sllx	%i4,	0x0E,	%o4
	lduh	[%l7 + 0x26],	%g1
	sethi	0x0372,	%l3
	fcmpd	%fcc3,	%f20,	%f20
	edge32ln	%i5,	%g6,	%l0
	andncc	%i1,	%g5,	%g3
	fpsub32s	%f7,	%f30,	%f31
	fnand	%f30,	%f6,	%f12
	addc	%o5,	0x1BAC,	%l4
	movrlez	%i0,	0x034,	%g4
	andncc	%l2,	%l5,	%g7
	subcc	%i7,	%l6,	%o0
	movgu	%icc,	%o6,	%o3
	edge32l	%o1,	%g2,	%l1
	movpos	%icc,	%o2,	%i2
	sdivcc	%i6,	0x0743,	%o7
	sir	0x00DC
	mulscc	%i3,	0x0C44,	%o4
	pdist	%f22,	%f18,	%f14
	alignaddrl	%i4,	%g1,	%l3
	sth	%g6,	[%l7 + 0x26]
	alignaddr	%i5,	%l0,	%g5
	popc	%i1,	%g3
	movcs	%xcc,	%o5,	%l4
	sir	0x116E
	alignaddr	%g4,	%l2,	%i0
	edge8l	%g7,	%i7,	%l6
	edge32n	%l5,	%o6,	%o3
	pdist	%f24,	%f22,	%f0
	fnegs	%f25,	%f17
	sdiv	%o0,	0x08BB,	%o1
	save %l1, %o2, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %i6, 0x0F97, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g2,	0x0C43,	%i3
	move	%xcc,	%o4,	%g1
	movrlez	%i4,	%g6,	%i5
	fnands	%f31,	%f10,	%f15
	lduh	[%l7 + 0x7A],	%l3
	edge16	%l0,	%i1,	%g3
	orcc	%g5,	0x06B9,	%l4
	andcc	%g4,	%l2,	%i0
	stb	%g7,	[%l7 + 0x27]
	addccc	%o5,	%i7,	%l5
	fmovdl	%xcc,	%f12,	%f19
	fmovdcs	%icc,	%f21,	%f15
	subccc	%l6,	%o6,	%o3
	orn	%o0,	%o1,	%l1
	orn	%i2,	%i6,	%o7
	save %g2, %o2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o4,	%i4,	%g1
	lduw	[%l7 + 0x5C],	%g6
	sdivcc	%i5,	0x0307,	%l0
	edge32ln	%l3,	%i1,	%g5
	movl	%xcc,	%l4,	%g4
	fabsd	%f12,	%f16
	fmovrsgz	%l2,	%f7,	%f6
	stw	%g3,	[%l7 + 0x14]
	fnands	%f21,	%f28,	%f2
	fxor	%f22,	%f10,	%f18
	subccc	%g7,	%i0,	%o5
	ldd	[%l7 + 0x08],	%l4
	fnot1	%f28,	%f20
	umul	%l6,	0x04F5,	%i7
	smulcc	%o6,	%o3,	%o1
	addc	%o0,	%l1,	%i6
	udiv	%i2,	0x114D,	%o7
	or	%g2,	%o2,	%i3
	xnorcc	%i4,	0x0514,	%o4
	fmovsge	%icc,	%f27,	%f8
	smul	%g6,	%i5,	%l0
	srlx	%g1,	%i1,	%g5
	movge	%xcc,	%l3,	%g4
	movcs	%xcc,	%l2,	%g3
	fxnors	%f8,	%f20,	%f26
	umulcc	%l4,	0x0700,	%i0
	edge32	%g7,	%l5,	%l6
	fmovdneg	%icc,	%f18,	%f19
	sdivx	%i7,	0x1535,	%o6
	movrlez	%o3,	0x115,	%o5
	movvs	%icc,	%o0,	%o1
	mova	%icc,	%i6,	%l1
	edge16l	%i2,	%o7,	%o2
	ldub	[%l7 + 0x57],	%g2
	fpmerge	%f15,	%f12,	%f0
	movle	%xcc,	%i3,	%i4
	movrlez	%o4,	0x11D,	%g6
	ldsb	[%l7 + 0x27],	%l0
	std	%f16,	[%l7 + 0x60]
	alignaddrl	%g1,	%i1,	%g5
	subc	%i5,	%g4,	%l2
	movg	%xcc,	%g3,	%l4
	edge32ln	%i0,	%g7,	%l5
	edge32ln	%l3,	%l6,	%i7
	edge32n	%o3,	%o5,	%o0
	array16	%o6,	%i6,	%o1
	sll	%l1,	0x01,	%o7
	sdivx	%i2,	0x1865,	%g2
	fpack32	%f14,	%f20,	%f8
	st	%f17,	[%l7 + 0x18]
	ldub	[%l7 + 0x2F],	%i3
	stw	%i4,	[%l7 + 0x38]
	siam	0x3
	sth	%o4,	[%l7 + 0x20]
	fmovsge	%icc,	%f20,	%f27
	stb	%g6,	[%l7 + 0x24]
	edge8l	%l0,	%o2,	%i1
	subccc	%g1,	%i5,	%g5
	and	%l2,	0x0FA8,	%g4
	subccc	%g3,	0x15BD,	%i0
	fmovd	%f28,	%f8
	movrne	%g7,	%l4,	%l3
	mulx	%l5,	%l6,	%i7
	addc	%o5,	%o3,	%o0
	and	%i6,	%o1,	%l1
	fmovrdlez	%o6,	%f24,	%f0
	edge32	%o7,	%g2,	%i2
	alignaddr	%i4,	%i3,	%o4
	andcc	%l0,	0x0C1F,	%g6
	fmovrdlz	%o2,	%f22,	%f30
	fmovdvs	%icc,	%f21,	%f1
	subccc	%g1,	%i1,	%i5
	movcc	%xcc,	%g5,	%l2
	subccc	%g3,	0x1299,	%g4
	edge8	%g7,	%i0,	%l4
	ldsb	[%l7 + 0x5C],	%l5
	edge8	%l3,	%l6,	%o5
	movg	%icc,	%o3,	%o0
	subcc	%i7,	0x1654,	%i6
	andn	%l1,	0x0083,	%o6
	fmovsle	%xcc,	%f30,	%f30
	srlx	%o1,	%g2,	%o7
	movneg	%xcc,	%i2,	%i3
	fandnot2	%f16,	%f18,	%f4
	addcc	%i4,	0x0337,	%l0
	edge32	%g6,	%o2,	%g1
	fnand	%f14,	%f4,	%f8
	or	%i1,	0x082E,	%o4
	fxnors	%f4,	%f18,	%f5
	ldsb	[%l7 + 0x78],	%i5
	movrne	%l2,	0x3D0,	%g3
	xor	%g5,	%g4,	%g7
	sdivcc	%i0,	0x17C1,	%l5
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	fcmpes	%fcc3,	%f21,	%f0
	udivcc	%l4,	0x14B5,	%o3
	fnot2s	%f12,	%f7
	movgu	%icc,	%o5,	%i7
	fexpand	%f10,	%f14
	xnor	%i6,	%l1,	%o0
	fmovsa	%xcc,	%f28,	%f27
	ldd	[%l7 + 0x40],	%f6
	movge	%xcc,	%o1,	%g2
	sdivcc	%o6,	0x1DC5,	%o7
	mulscc	%i2,	%i4,	%i3
	movl	%xcc,	%l0,	%o2
	fsrc1s	%f9,	%f26
	fnors	%f24,	%f20,	%f21
	edge8l	%g1,	%i1,	%o4
	fcmple32	%f0,	%f8,	%i5
	addc	%g6,	%g3,	%g5
	mova	%icc,	%g4,	%g7
	andcc	%l2,	0x04DC,	%i0
	fxnor	%f30,	%f26,	%f22
	fxnors	%f24,	%f19,	%f31
	or	%l5,	%l3,	%l4
	fmovde	%xcc,	%f9,	%f9
	fmovsleu	%icc,	%f29,	%f9
	fcmple16	%f6,	%f8,	%l6
	stb	%o3,	[%l7 + 0x7E]
	movle	%icc,	%i7,	%i6
	edge16n	%o5,	%l1,	%o0
	edge32	%o1,	%o6,	%o7
	edge32n	%g2,	%i2,	%i3
	fcmps	%fcc1,	%f11,	%f22
	andn	%l0,	%i4,	%g1
	movpos	%xcc,	%i1,	%o2
	xor	%o4,	0x1F8C,	%g6
	fnot2s	%f18,	%f10
	nop
	set	0x26, %o0
	ldsb	[%l7 + %o0],	%g3
	sth	%i5,	[%l7 + 0x14]
	andncc	%g5,	%g7,	%l2
	edge8ln	%g4,	%l5,	%i0
	fmovdleu	%icc,	%f1,	%f12
	fnegs	%f22,	%f21
	sra	%l3,	0x1B,	%l6
	fpsub32	%f18,	%f30,	%f28
	movrlz	%o3,	0x1EB,	%i7
	edge8l	%i6,	%o5,	%l4
	fnors	%f17,	%f26,	%f24
	mulx	%l1,	0x1A10,	%o1
	movrne	%o6,	%o7,	%g2
	orcc	%i2,	%i3,	%o0
	lduw	[%l7 + 0x20],	%l0
	popc	%g1,	%i1
	array32	%o2,	%i4,	%o4
	fcmpd	%fcc0,	%f26,	%f8
	stb	%g6,	[%l7 + 0x32]
	nop
	set	0x18, %o3
	ldx	[%l7 + %o3],	%i5
	orcc	%g3,	0x025D,	%g7
	movrlez	%g5,	0x070,	%l2
	fexpand	%f0,	%f22
	ldd	[%l7 + 0x30],	%l4
	umulcc	%i0,	%l3,	%l6
	movcs	%icc,	%o3,	%g4
	fmovsn	%xcc,	%f10,	%f1
	and	%i7,	%o5,	%i6
	sll	%l1,	0x18,	%o1
	srax	%l4,	%o6,	%o7
	orn	%i2,	%g2,	%i3
	mulscc	%o0,	0x013B,	%g1
	movg	%xcc,	%l0,	%i1
	addc	%o2,	0x17A9,	%o4
	lduw	[%l7 + 0x2C],	%i4
	umulcc	%i5,	%g3,	%g7
	fpmerge	%f18,	%f3,	%f8
	nop
	set	0x19, %l5
	ldsb	[%l7 + %l5],	%g6
	movcs	%xcc,	%g5,	%l2
	movpos	%icc,	%i0,	%l3
	sll	%l6,	0x1D,	%o3
	subccc	%g4,	0x067E,	%i7
	fmovde	%icc,	%f7,	%f13
	orcc	%o5,	0x0F70,	%l5
	ldd	[%l7 + 0x58],	%l0
	fcmped	%fcc2,	%f4,	%f16
	sllx	%o1,	0x1F,	%i6
	edge16	%l4,	%o6,	%i2
	lduh	[%l7 + 0x2C],	%g2
	mulscc	%i3,	0x054F,	%o7
	fmovrslz	%g1,	%f30,	%f31
	edge8l	%l0,	%o0,	%i1
	and	%o4,	%i4,	%o2
	addcc	%g3,	%g7,	%i5
	movrne	%g5,	%l2,	%g6
	edge32	%i0,	%l3,	%o3
	movrgez	%g4,	%i7,	%o5
	sll	%l6,	0x1D,	%l5
	orn	%o1,	%l1,	%i6
	ldsh	[%l7 + 0x70],	%l4
	umulcc	%o6,	0x0B76,	%i2
	fsrc1	%f28,	%f10
	sll	%i3,	%g2,	%o7
	subccc	%g1,	0x188B,	%o0
	movrlz	%i1,	0x23B,	%l0
	fabss	%f19,	%f8
	edge16	%o4,	%i4,	%o2
	ldd	[%l7 + 0x48],	%g6
	andcc	%g3,	%g5,	%l2
	restore %g6, %i0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1704,	%o3
	fcmpne32	%f4,	%f10,	%l3
	and	%i7,	%g4,	%l6
	and	%l5,	0x0E32,	%o1
	movvs	%xcc,	%o5,	%i6
	movvs	%xcc,	%l4,	%l1
	edge8l	%i2,	%i3,	%o6
	xnorcc	%o7,	%g2,	%g1
	movleu	%icc,	%o0,	%l0
	xnor	%o4,	0x1E0F,	%i1
	sth	%o2,	[%l7 + 0x26]
	add	%g7,	%g3,	%g5
	sra	%l2,	0x0C,	%i4
	fmovrdgez	%g6,	%f24,	%f22
	array16	%i5,	%o3,	%l3
	mulx	%i7,	%i0,	%g4
	edge8ln	%l6,	%o1,	%l5
	sub	%i6,	%l4,	%o5
	srlx	%i2,	0x18,	%i3
	array16	%l1,	%o7,	%g2
	edge32n	%g1,	%o0,	%l0
	subccc	%o6,	%o4,	%i1
	addccc	%g7,	0x06C4,	%o2
	fmovrslez	%g3,	%f24,	%f29
	stb	%g5,	[%l7 + 0x32]
	ldub	[%l7 + 0x72],	%i4
	edge32	%g6,	%l2,	%o3
	fornot1	%f16,	%f14,	%f14
	ldd	[%l7 + 0x30],	%l2
	array8	%i5,	%i7,	%g4
	fmovrse	%l6,	%f2,	%f5
	movrlz	%o1,	%i0,	%i6
	xor	%l5,	%o5,	%l4
	fmovdvc	%xcc,	%f20,	%f19
	movg	%icc,	%i3,	%i2
	sra	%l1,	%o7,	%g1
	fmovrslz	%g2,	%f24,	%f29
	ldd	[%l7 + 0x28],	%l0
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	lduw	[%l7 + 0x64],	%i1
	save %o0, %o2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g7,	%g5,	%i4
	umulcc	%g6,	%o3,	%l3
	smulcc	%l2,	0x0576,	%i7
	fmovdleu	%icc,	%f25,	%f3
	sllx	%i5,	%l6,	%g4
	movpos	%icc,	%i0,	%i6
	sub	%o1,	0x0A29,	%l5
	edge32ln	%o5,	%i3,	%l4
	alignaddrl	%l1,	%i2,	%o7
	ldsh	[%l7 + 0x52],	%g1
	sethi	0x1E61,	%l0
	movl	%icc,	%g2,	%o4
	orcc	%o6,	0x0A68,	%o0
	movn	%xcc,	%o2,	%i1
	fcmps	%fcc0,	%f13,	%f12
	movre	%g3,	%g7,	%g5
	movg	%icc,	%g6,	%o3
	movrlz	%i4,	0x036,	%l2
	srax	%l3,	%i7,	%i5
	sdiv	%l6,	0x15BA,	%i0
	fpsub32	%f24,	%f0,	%f14
	edge16n	%i6,	%o1,	%l5
	fnegs	%f17,	%f18
	sir	0x0249
	stw	%g4,	[%l7 + 0x40]
	fcmpne16	%f6,	%f28,	%i3
	fandnot2	%f6,	%f28,	%f4
	fnot1	%f20,	%f28
	movvs	%xcc,	%o5,	%l1
	ldsh	[%l7 + 0x44],	%i2
	fsrc2s	%f5,	%f23
	xor	%o7,	%g1,	%l4
	orncc	%l0,	0x0E4C,	%g2
	fmovrsgz	%o4,	%f9,	%f6
	andcc	%o6,	0x0329,	%o2
	sdivcc	%o0,	0x18B4,	%i1
	alignaddrl	%g3,	%g5,	%g7
	movpos	%icc,	%o3,	%i4
	movle	%xcc,	%l2,	%g6
	srax	%i7,	0x0E,	%i5
	fmovrdgz	%l6,	%f14,	%f18
	edge16	%i0,	%l3,	%i6
	sth	%l5,	[%l7 + 0x52]
	movrgz	%g4,	%o1,	%o5
	or	%i3,	%i2,	%l1
	move	%xcc,	%g1,	%o7
	array32	%l0,	%l4,	%g2
	save %o6, %o2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x78],	%f29
	fmovrde	%i1,	%f18,	%f18
	movvc	%icc,	%g3,	%g5
	movleu	%xcc,	%g7,	%o0
	sllx	%i4,	0x06,	%o3
	fnot2	%f8,	%f6
	sll	%g6,	%l2,	%i5
	fmovde	%xcc,	%f12,	%f26
	save %l6, 0x1E55, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f4,	%f19,	%f29
	edge32ln	%i7,	%i6,	%l3
	subccc	%l5,	0x0FF8,	%g4
	subccc	%o5,	%o1,	%i3
	fnot2s	%f25,	%f1
	st	%f1,	[%l7 + 0x0C]
	addccc	%l1,	%i2,	%g1
	sethi	0x0E13,	%o7
	popc	%l0,	%l4
	movneg	%icc,	%o6,	%g2
	ldsw	[%l7 + 0x2C],	%o4
	xnorcc	%i1,	0x1063,	%o2
	or	%g5,	0x0797,	%g7
	edge8	%o0,	%g3,	%o3
	fmovrdlz	%g6,	%f14,	%f8
	addcc	%i4,	%l2,	%i5
	ldsh	[%l7 + 0x7A],	%i0
	fandnot1s	%f25,	%f29,	%f31
	lduh	[%l7 + 0x08],	%i7
	ld	[%l7 + 0x58],	%f17
	mulscc	%l6,	%i6,	%l5
	std	%f14,	[%l7 + 0x18]
	restore %l3, 0x198B, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o1,	0x1839,	%g4
	edge32ln	%i3,	%l1,	%i2
	smul	%o7,	0x188E,	%l0
	edge16ln	%l4,	%o6,	%g2
	udivx	%o4,	0x17D5,	%i1
	xorcc	%o2,	0x00DF,	%g5
	movrlz	%g1,	%g7,	%g3
	alignaddr	%o0,	%g6,	%i4
	fxnors	%f28,	%f30,	%f19
	fpadd32s	%f20,	%f4,	%f20
	edge8ln	%l2,	%i5,	%i0
	edge32l	%o3,	%i7,	%l6
	edge8	%i6,	%l5,	%o5
	udiv	%o1,	0x04C5,	%l3
	subc	%i3,	%l1,	%i2
	fcmpeq16	%f10,	%f28,	%g4
	movn	%xcc,	%o7,	%l4
	movcs	%icc,	%o6,	%l0
	xnorcc	%g2,	0x1842,	%i1
	fmovdne	%xcc,	%f31,	%f25
	fmovsgu	%xcc,	%f30,	%f2
	fcmple16	%f0,	%f20,	%o2
	movge	%xcc,	%g5,	%g1
	fand	%f14,	%f24,	%f8
	array8	%g7,	%o4,	%o0
	fmovdle	%xcc,	%f23,	%f0
	fsrc2s	%f11,	%f6
	sir	0x05BE
	xnorcc	%g6,	%g3,	%i4
	fabss	%f11,	%f10
	fmovsn	%icc,	%f12,	%f13
	move	%icc,	%l2,	%i5
	movcc	%xcc,	%i0,	%o3
	lduw	[%l7 + 0x2C],	%i7
	fones	%f2
	fmovsa	%xcc,	%f15,	%f0
	udivcc	%i6,	0x0A04,	%l6
	fabss	%f30,	%f3
	save %l5, %o1, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i3,	[%l7 + 0x30]
	ld	[%l7 + 0x20],	%f12
	subcc	%l3,	%i2,	%g4
	fmovrdgez	%o7,	%f12,	%f2
	fcmpgt32	%f20,	%f22,	%l1
	ldd	[%l7 + 0x38],	%o6
	stx	%l0,	[%l7 + 0x70]
	fnands	%f25,	%f18,	%f20
	sth	%g2,	[%l7 + 0x34]
	st	%f8,	[%l7 + 0x14]
	popc	0x0F1E,	%i1
	movcs	%icc,	%o2,	%l4
	fpackfix	%f16,	%f10
	sub	%g1,	%g5,	%o4
	movrne	%o0,	%g7,	%g6
	ldsw	[%l7 + 0x58],	%g3
	sub	%l2,	%i4,	%i0
	movrlez	%o3,	%i7,	%i6
	sdivx	%l6,	0x00F2,	%i5
	ldd	[%l7 + 0x18],	%o0
	fmovdcs	%xcc,	%f10,	%f22
	movre	%o5,	0x246,	%i3
	edge16l	%l3,	%i2,	%g4
	array32	%l5,	%o7,	%l1
	srlx	%l0,	0x01,	%g2
	movrgz	%o6,	0x3DB,	%o2
	ldd	[%l7 + 0x08],	%f10
	sra	%l4,	0x1C,	%i1
	xor	%g5,	0x02F4,	%o4
	fmovsvc	%xcc,	%f9,	%f15
	fornot2	%f24,	%f10,	%f12
	smulcc	%o0,	%g7,	%g6
	fmovrsgz	%g3,	%f14,	%f14
	umulcc	%g1,	%i4,	%l2
	srax	%i0,	%o3,	%i6
	edge32l	%l6,	%i7,	%i5
	edge8	%o5,	%o1,	%i3
	udivx	%i2,	0x1DCF,	%l3
	fmovrdgz	%l5,	%f0,	%f4
	movvc	%xcc,	%o7,	%g4
	movg	%icc,	%l0,	%l1
	srl	%g2,	%o6,	%l4
	stb	%i1,	[%l7 + 0x08]
	xor	%o2,	0x170E,	%g5
	sub	%o4,	%g7,	%o0
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	popc	0x1F5D,	%i4
	movge	%xcc,	%i0,	%o3
	lduh	[%l7 + 0x2E],	%l2
	edge16	%l6,	%i6,	%i5
	subc	%i7,	%o5,	%o1
	fmovrdlez	%i3,	%f6,	%f16
	xorcc	%i2,	%l3,	%o7
	umulcc	%g4,	%l5,	%l0
	movrgez	%g2,	%o6,	%l1
	fmovdne	%xcc,	%f0,	%f24
	fmovsl	%xcc,	%f28,	%f27
	movre	%l4,	%i1,	%o2
	restore %o4, %g7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g3,	0x007A,	%o0
	edge8n	%g1,	%g6,	%i4
	sir	0x0608
	ldsh	[%l7 + 0x26],	%o3
	ldx	[%l7 + 0x30],	%l2
	sethi	0x09F0,	%l6
	movpos	%xcc,	%i0,	%i6
	andncc	%i5,	%i7,	%o1
	fcmpgt16	%f26,	%f24,	%i3
	fcmpne32	%f26,	%f8,	%o5
	edge8ln	%l3,	%i2,	%o7
	udivcc	%g4,	0x0587,	%l5
	xnor	%g2,	%l0,	%l1
	udivcc	%o6,	0x1EA8,	%i1
	movne	%xcc,	%l4,	%o4
	sll	%g7,	%g5,	%o2
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	sth	%g1,	[%l7 + 0x56]
	edge16ln	%g6,	%o3,	%l2
	sdivx	%l6,	0x0426,	%i4
	sub	%i0,	%i5,	%i6
	udiv	%i7,	0x153C,	%o1
	umul	%i3,	0x0742,	%o5
	xnorcc	%i2,	0x1B79,	%o7
	movn	%xcc,	%l3,	%g4
	fmovrse	%g2,	%f7,	%f7
	movpos	%icc,	%l0,	%l1
	stx	%l5,	[%l7 + 0x08]
	movle	%icc,	%i1,	%l4
	movg	%xcc,	%o6,	%g7
	edge32ln	%o4,	%o2,	%g3
	ldd	[%l7 + 0x40],	%o0
	movrgz	%g5,	0x2AA,	%g6
	st	%f16,	[%l7 + 0x4C]
	udiv	%o3,	0x0B3A,	%g1
	sth	%l6,	[%l7 + 0x20]
	sra	%i4,	0x17,	%i0
	ld	[%l7 + 0x2C],	%f7
	ldsb	[%l7 + 0x7A],	%i5
	movrne	%i6,	0x1AC,	%l2
	movrgez	%o1,	%i3,	%i7
	umul	%i2,	%o7,	%l3
	sdivcc	%g4,	0x1883,	%o5
	edge8n	%l0,	%l1,	%g2
	ldsw	[%l7 + 0x58],	%i1
	srl	%l5,	%l4,	%g7
	edge8	%o4,	%o6,	%g3
	popc	%o2,	%o0
	sdivx	%g5,	0x1BC9,	%o3
	and	%g6,	%l6,	%g1
	stx	%i4,	[%l7 + 0x40]
	sll	%i5,	%i0,	%l2
	ldsb	[%l7 + 0x41],	%o1
	sdivcc	%i6,	0x0C77,	%i7
	sth	%i2,	[%l7 + 0x14]
	fzeros	%f8
	movpos	%xcc,	%o7,	%i3
	fmovsne	%icc,	%f24,	%f2
	srax	%l3,	%g4,	%l0
	movre	%l1,	%o5,	%g2
	movg	%icc,	%l5,	%l4
	sir	0x100B
	orncc	%i1,	0x1185,	%o4
	edge32ln	%g7,	%g3,	%o6
	sllx	%o0,	0x12,	%o2
	fmul8x16au	%f0,	%f0,	%f16
	movrlz	%g5,	0x1D5,	%g6
	xnor	%o3,	0x1E88,	%g1
	fmul8x16	%f29,	%f12,	%f20
	fmovdge	%xcc,	%f3,	%f11
	fnegd	%f26,	%f20
	movrne	%l6,	0x2C5,	%i4
	edge16	%i5,	%i0,	%o1
	stw	%i6,	[%l7 + 0x6C]
	edge32	%i7,	%l2,	%i2
	fors	%f1,	%f20,	%f5
	sethi	0x12D1,	%i3
	fmul8sux16	%f0,	%f16,	%f0
	subccc	%l3,	0x085D,	%g4
	movvs	%xcc,	%l0,	%o7
	fnegd	%f4,	%f26
	nop
	set	0x32, %g6
	sth	%l1,	[%l7 + %g6]
	save %g2, 0x052B, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l4,	%o5,	%o4
	nop
	set	0x14, %i5
	ldsh	[%l7 + %i5],	%i1
	smulcc	%g3,	0x1164,	%g7
	edge16	%o0,	%o6,	%g5
	ldx	[%l7 + 0x18],	%g6
	edge32	%o2,	%g1,	%l6
	mulx	%o3,	0x1E9B,	%i5
	fmovda	%icc,	%f28,	%f11
	fxors	%f20,	%f28,	%f25
	addccc	%i0,	0x00AC,	%o1
	sir	0x0193
	popc	%i4,	%i6
	xnorcc	%i7,	%i2,	%l2
	subcc	%i3,	0x1477,	%g4
	nop
	set	0x58, %o5
	ldsw	[%l7 + %o5],	%l3
	mulx	%o7,	%l0,	%g2
	addc	%l5,	%l1,	%o5
	addc	%o4,	%i1,	%g3
	edge32l	%g7,	%l4,	%o6
	sdiv	%o0,	0x0A67,	%g6
	edge16	%g5,	%g1,	%o2
	sir	0x0D33
	edge8	%o3,	%i5,	%i0
	ldd	[%l7 + 0x40],	%i6
	ldsw	[%l7 + 0x1C],	%o1
	movrgz	%i6,	0x336,	%i4
	stw	%i7,	[%l7 + 0x74]
	srax	%i2,	%i3,	%l2
	andcc	%g4,	0x144B,	%o7
	fmul8x16au	%f16,	%f25,	%f10
	ldub	[%l7 + 0x40],	%l0
	edge8l	%g2,	%l3,	%l1
	fmovrde	%o5,	%f28,	%f4
	ldsh	[%l7 + 0x18],	%l5
	stx	%o4,	[%l7 + 0x28]
	move	%icc,	%i1,	%g7
	addcc	%g3,	%o6,	%l4
	ldd	[%l7 + 0x60],	%g6
	stw	%g5,	[%l7 + 0x10]
	sra	%o0,	0x07,	%o2
	lduh	[%l7 + 0x4C],	%g1
	mulx	%i5,	0x04D9,	%i0
	sdiv	%l6,	0x112B,	%o3
	alignaddr	%i6,	%o1,	%i4
	movleu	%xcc,	%i2,	%i7
	movl	%xcc,	%i3,	%g4
	edge16	%l2,	%o7,	%g2
	fmovd	%f20,	%f14
	subc	%l0,	0x0352,	%l1
	ldx	[%l7 + 0x28],	%l3
	nop
	set	0x26, %o1
	sth	%o5,	[%l7 + %o1]
	edge16l	%l5,	%i1,	%o4
	sdivcc	%g3,	0x134C,	%o6
	sir	0x0510
	movpos	%icc,	%l4,	%g7
	ldd	[%l7 + 0x78],	%f4
	fornot2s	%f14,	%f5,	%f17
	sir	0x0E93
	srlx	%g5,	%o0,	%o2
	sdivcc	%g6,	0x062F,	%i5
	mulscc	%g1,	%i0,	%o3
	array8	%i6,	%o1,	%i4
	movle	%icc,	%l6,	%i2
	edge16ln	%i7,	%g4,	%l2
	fmovscc	%icc,	%f10,	%f19
	movgu	%icc,	%i3,	%g2
	fmovdgu	%icc,	%f15,	%f19
	fmul8x16	%f15,	%f22,	%f30
	sdivx	%l0,	0x0611,	%l1
	subcc	%l3,	%o7,	%o5
	fone	%f14
	umul	%l5,	0x003A,	%i1
	ld	[%l7 + 0x78],	%f4
	array16	%g3,	%o4,	%o6
	subc	%l4,	%g7,	%g5
	umul	%o0,	0x091E,	%o2
	sir	0x091E
	udiv	%g6,	0x19CD,	%i5
	edge32ln	%i0,	%o3,	%g1
	ldsh	[%l7 + 0x2C],	%o1
	movrgz	%i6,	%i4,	%l6
	movrlez	%i7,	%i2,	%g4
	fnand	%f26,	%f0,	%f14
	sethi	0x012D,	%i3
	fandnot1	%f8,	%f10,	%f10
	edge32n	%g2,	%l0,	%l1
	or	%l3,	%l2,	%o5
	fmovdleu	%icc,	%f29,	%f21
	fmovsvc	%xcc,	%f3,	%f29
	fmovdle	%xcc,	%f11,	%f11
	orn	%l5,	%o7,	%i1
	std	%f28,	[%l7 + 0x68]
	stx	%o4,	[%l7 + 0x60]
	umul	%g3,	0x0CD2,	%l4
	and	%o6,	0x113D,	%g7
	fnegd	%f12,	%f18
	fmovsge	%xcc,	%f26,	%f10
	fmovsneg	%xcc,	%f4,	%f16
	andn	%o0,	%o2,	%g6
	edge8	%i5,	%g5,	%i0
	edge16l	%g1,	%o1,	%o3
	smul	%i4,	%i6,	%l6
	movg	%icc,	%i2,	%i7
	movge	%xcc,	%i3,	%g2
	save %g4, 0x12EF, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1A14,	%l3
	movg	%xcc,	%l0,	%l2
	fmovrde	%l5,	%f22,	%f30
	movcs	%xcc,	%o5,	%i1
	edge16l	%o4,	%g3,	%l4
	addccc	%o6,	%o7,	%g7
	orncc	%o0,	%o2,	%i5
	andncc	%g5,	%g6,	%i0
	srl	%o1,	0x06,	%g1
	fexpand	%f3,	%f24
	restore %o3, %i4, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f6,	[%l7 + 0x08]
	andn	%i6,	%i7,	%i3
	movcc	%xcc,	%i2,	%g2
	nop
	set	0x50, %i4
	std	%f10,	[%l7 + %i4]
	smulcc	%g4,	%l3,	%l1
	fors	%f8,	%f8,	%f6
	fand	%f0,	%f30,	%f2
	movrlz	%l0,	%l2,	%o5
	fsrc2	%f20,	%f24
	srl	%i1,	0x0E,	%o4
	ldsw	[%l7 + 0x24],	%g3
	subc	%l4,	0x054E,	%o6
	edge16	%l5,	%g7,	%o7
	subc	%o2,	0x1450,	%o0
	edge32ln	%i5,	%g6,	%g5
	fcmple32	%f6,	%f12,	%i0
	movne	%xcc,	%g1,	%o3
	mulx	%o1,	0x07FF,	%i4
	fmovrse	%i6,	%f31,	%f2
	smul	%i7,	%l6,	%i3
	lduw	[%l7 + 0x5C],	%i2
	ldd	[%l7 + 0x38],	%g4
	sub	%l3,	%g2,	%l1
	movrgez	%l0,	%l2,	%i1
	edge8n	%o4,	%o5,	%g3
	umulcc	%l4,	%l5,	%o6
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	fmovs	%f29,	%f27
	subccc	%i5,	0x1A9E,	%g6
	orcc	%g5,	%i0,	%g1
	movrgez	%o0,	0x0BD,	%o3
	fmovsvc	%icc,	%f3,	%f19
	srl	%o1,	%i6,	%i7
	movrne	%l6,	%i4,	%i3
	fnor	%f26,	%f4,	%f28
	alignaddrl	%i2,	%l3,	%g4
	array32	%g2,	%l0,	%l2
	orncc	%i1,	0x0D10,	%l1
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%o4
	fmovdn	%icc,	%f13,	%f2
	stw	%g3,	[%l7 + 0x2C]
	fmovsl	%icc,	%f5,	%f8
	movcc	%icc,	%o5,	%l4
	udivcc	%o6,	0x1A1B,	%l5
	xorcc	%o7,	0x1BE5,	%o2
	andn	%i5,	%g7,	%g6
	fands	%f30,	%f23,	%f1
	edge32ln	%g5,	%g1,	%i0
	sdivx	%o0,	0x066B,	%o3
	subc	%o1,	%i7,	%i6
	stw	%i4,	[%l7 + 0x54]
	ld	[%l7 + 0x18],	%f12
	or	%l6,	0x18F6,	%i2
	movvs	%icc,	%i3,	%l3
	nop
	set	0x60, %g5
	stx	%g4,	[%l7 + %g5]
	edge8n	%g2,	%l2,	%l0
	move	%icc,	%l1,	%i1
	fones	%f9
	popc	0x0CF0,	%o4
	fnegd	%f10,	%f24
	smul	%o5,	%g3,	%o6
	edge16ln	%l4,	%l5,	%o7
	siam	0x4
	fsrc1	%f6,	%f10
	edge32	%i5,	%g7,	%o2
	ldd	[%l7 + 0x20],	%f14
	fand	%f0,	%f16,	%f22
	movrgz	%g5,	0x31C,	%g1
	andcc	%i0,	0x1664,	%o0
	movle	%icc,	%o3,	%g6
	fcmple16	%f30,	%f2,	%o1
	or	%i7,	%i4,	%i6
	movcc	%icc,	%i2,	%l6
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%f20
	subcc	%i3,	%l3,	%g4
	movleu	%xcc,	%l2,	%g2
	restore %l0, 0x10AE, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o4,	0x1C55,	%o5
	subcc	%g3,	0x1904,	%o6
	edge8	%l4,	%l1,	%o7
	fpadd32s	%f23,	%f30,	%f11
	orn	%l5,	%i5,	%o2
	array8	%g7,	%g5,	%i0
	fone	%f14
	fcmpes	%fcc3,	%f23,	%f13
	sth	%o0,	[%l7 + 0x6A]
	fmovrsgz	%g1,	%f3,	%f7
	movrgez	%g6,	0x0AE,	%o1
	nop
	set	0x79, %o2
	ldsb	[%l7 + %o2],	%o3
	addc	%i4,	%i7,	%i2
	movle	%icc,	%l6,	%i3
	fmul8ulx16	%f6,	%f22,	%f12
	stb	%i6,	[%l7 + 0x0A]
	edge16ln	%l3,	%l2,	%g2
	fmul8sux16	%f14,	%f10,	%f14
	mova	%xcc,	%g4,	%i1
	edge16ln	%l0,	%o4,	%g3
	or	%o6,	0x078B,	%l4
	movleu	%xcc,	%o5,	%o7
	movg	%xcc,	%l5,	%l1
	fmovrdgez	%i5,	%f4,	%f24
	subccc	%g7,	0x0700,	%o2
	srl	%i0,	%g5,	%o0
	fnot1	%f28,	%f26
	orn	%g6,	0x0382,	%g1
	mova	%icc,	%o1,	%i4
	std	%f14,	[%l7 + 0x30]
	fnot2	%f28,	%f8
	fpsub16s	%f20,	%f15,	%f26
	fornot2	%f20,	%f28,	%f20
	ldsw	[%l7 + 0x14],	%i7
	fmul8x16al	%f9,	%f24,	%f10
	mulscc	%o3,	%l6,	%i2
	sth	%i6,	[%l7 + 0x62]
	array8	%l3,	%l2,	%g2
	fmovsvs	%xcc,	%f24,	%f27
	movl	%icc,	%i3,	%i1
	fnegs	%f0,	%f26
	movvc	%xcc,	%g4,	%l0
	movneg	%xcc,	%o4,	%o6
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%g2
	udivx	%o5,	0x16A1,	%l4
	fandnot2s	%f0,	%f29,	%f19
	fmovdneg	%xcc,	%f5,	%f10
	std	%f18,	[%l7 + 0x40]
	srlx	%l5,	%l1,	%o7
	andcc	%i5,	%o2,	%i0
	movrlez	%g7,	0x359,	%g5
	andn	%o0,	0x0CDE,	%g1
	sir	0x14BB
	stb	%g6,	[%l7 + 0x50]
	xnor	%o1,	%i7,	%i4
	andncc	%o3,	%l6,	%i6
	ldd	[%l7 + 0x58],	%f0
	and	%l3,	0x0C59,	%i2
	nop
	set	0x1E, %g4
	lduh	[%l7 + %g4],	%g2
	xorcc	%i3,	%i1,	%g4
	mova	%icc,	%l0,	%o4
	ldd	[%l7 + 0x40],	%o6
	sir	0x0BB4
	fcmpd	%fcc2,	%f28,	%f18
	movvs	%icc,	%g3,	%o5
	fors	%f22,	%f30,	%f15
	umul	%l4,	%l2,	%l5
	fcmpgt16	%f20,	%f30,	%o7
	edge16	%i5,	%o2,	%l1
	movl	%xcc,	%g7,	%i0
	movre	%g5,	%o0,	%g1
	fmovrslez	%o1,	%f3,	%f27
	array16	%i7,	%g6,	%o3
	sdivx	%i4,	0x1896,	%i6
	mulx	%l6,	%i2,	%l3
	xor	%g2,	%i3,	%i1
	fpadd32	%f22,	%f18,	%f6
	movcs	%icc,	%l0,	%o4
	subcc	%o6,	0x05D3,	%g3
	ldub	[%l7 + 0x6A],	%g4
	array8	%o5,	%l4,	%l2
	stw	%l5,	[%l7 + 0x40]
	stw	%o7,	[%l7 + 0x38]
	fornot1s	%f27,	%f30,	%f25
	andcc	%o2,	0x0558,	%l1
	movrlz	%i5,	0x251,	%g7
	edge16l	%g5,	%o0,	%g1
	ldsb	[%l7 + 0x55],	%o1
	ld	[%l7 + 0x1C],	%f30
	fnors	%f17,	%f9,	%f15
	add	%i7,	0x16D2,	%i0
	xor	%g6,	%o3,	%i6
	udivcc	%l6,	0x0BC2,	%i2
	stx	%i4,	[%l7 + 0x48]
	fones	%f26
	movre	%l3,	0x26B,	%i3
	udivcc	%i1,	0x1486,	%g2
	addc	%l0,	%o4,	%g3
	movcs	%icc,	%o6,	%o5
	fandnot1	%f0,	%f6,	%f14
	umul	%g4,	0x0B88,	%l2
	alignaddrl	%l5,	%l4,	%o7
	stx	%o2,	[%l7 + 0x30]
	movn	%xcc,	%i5,	%l1
	smulcc	%g7,	0x190B,	%g5
	sll	%g1,	%o0,	%o1
	popc	0x0DD8,	%i0
	fabsd	%f28,	%f26
	movgu	%xcc,	%i7,	%o3
	sll	%g6,	0x08,	%i6
	ldsw	[%l7 + 0x58],	%i2
	edge16n	%i4,	%l6,	%i3
	movneg	%icc,	%i1,	%g2
	fornot1s	%f28,	%f15,	%f26
	nop
	set	0x4C, %i6
	sth	%l3,	[%l7 + %i6]
	lduw	[%l7 + 0x30],	%o4
	movre	%g3,	0x0E7,	%o6
	addc	%l0,	%o5,	%l2
	lduh	[%l7 + 0x70],	%l5
	move	%icc,	%g4,	%l4
	fmovdvs	%xcc,	%f13,	%f8
	xorcc	%o2,	%o7,	%i5
	edge32	%l1,	%g7,	%g1
	fcmped	%fcc0,	%f22,	%f18
	movrgz	%g5,	0x16F,	%o0
	nop
	set	0x30, %o6
	ldx	[%l7 + %o6],	%o1
	orncc	%i7,	0x1384,	%i0
	srax	%o3,	0x0A,	%g6
	edge16ln	%i2,	%i4,	%i6
	array16	%i3,	%i1,	%g2
	fmovrse	%l6,	%f31,	%f22
	nop
	set	0x68, %i1
	stw	%o4,	[%l7 + %i1]
	edge32l	%l3,	%o6,	%l0
	sdiv	%o5,	0x1807,	%l2
	fmovse	%xcc,	%f20,	%f25
	fcmpeq32	%f10,	%f12,	%l5
	ldd	[%l7 + 0x78],	%f18
	fcmpes	%fcc0,	%f8,	%f0
	movvc	%icc,	%g3,	%l4
	movrgz	%g4,	0x05F,	%o2
	xor	%i5,	%l1,	%g7
	sdiv	%g1,	0x1929,	%o7
	orncc	%o0,	0x0F96,	%o1
	edge16ln	%g5,	%i7,	%o3
	ldsb	[%l7 + 0x42],	%i0
	movrne	%g6,	0x263,	%i2
	addccc	%i4,	0x165C,	%i6
	movrgez	%i1,	%i3,	%g2
	movn	%xcc,	%o4,	%l3
	fcmpeq32	%f28,	%f30,	%o6
	andn	%l0,	0x0D29,	%o5
	fpack16	%f10,	%f16
	mulx	%l2,	%l6,	%l5
	stw	%l4,	[%l7 + 0x74]
	fpadd16	%f18,	%f12,	%f4
	udivx	%g4,	0x1499,	%g3
	andncc	%o2,	%i5,	%l1
	fmovspos	%xcc,	%f22,	%f16
	fpadd16	%f8,	%f0,	%f22
	andn	%g7,	%o7,	%o0
	movne	%xcc,	%o1,	%g5
	sth	%i7,	[%l7 + 0x46]
	udivx	%o3,	0x1F9D,	%g1
	edge16n	%g6,	%i0,	%i2
	fors	%f23,	%f0,	%f19
	edge32	%i4,	%i6,	%i1
	subc	%g2,	%o4,	%l3
	fmovdl	%xcc,	%f18,	%f10
	fnors	%f25,	%f3,	%f23
	ldub	[%l7 + 0x12],	%i3
	fnegs	%f5,	%f8
	udivcc	%l0,	0x0AAD,	%o5
	pdist	%f26,	%f16,	%f16
	edge16l	%l2,	%o6,	%l6
	sdivcc	%l4,	0x00D3,	%l5
	std	%f18,	[%l7 + 0x18]
	edge16l	%g3,	%g4,	%i5
	fmovrde	%o2,	%f8,	%f28
	fmovrdgz	%l1,	%f12,	%f24
	pdist	%f8,	%f26,	%f12
	fmovrsgz	%o7,	%f11,	%f21
	movrne	%o0,	0x1E3,	%g7
	srlx	%g5,	0x06,	%o1
	udivcc	%i7,	0x1EB5,	%o3
	fmovsl	%icc,	%f30,	%f21
	stx	%g1,	[%l7 + 0x38]
	ldd	[%l7 + 0x18],	%g6
	orncc	%i0,	%i4,	%i6
	fpack32	%f20,	%f22,	%f0
	sth	%i2,	[%l7 + 0x7C]
	srl	%g2,	0x17,	%o4
	fmovsvc	%xcc,	%f26,	%f2
	movl	%icc,	%i1,	%i3
	movgu	%xcc,	%l3,	%l0
	array32	%o5,	%l2,	%o6
	movpos	%icc,	%l4,	%l5
	fmovda	%icc,	%f0,	%f14
	edge8	%g3,	%l6,	%i5
	sllx	%o2,	%l1,	%o7
	movrgez	%g4,	0x21B,	%g7
	sdivcc	%g5,	0x0769,	%o1
	ldd	[%l7 + 0x70],	%o0
	movne	%icc,	%o3,	%g1
	movvs	%xcc,	%g6,	%i7
	and	%i0,	0x033B,	%i4
	addc	%i2,	%g2,	%i6
	movvs	%icc,	%o4,	%i3
	sdivcc	%l3,	0x17D8,	%i1
	fnor	%f12,	%f10,	%f18
	edge32n	%o5,	%l0,	%o6
	movg	%xcc,	%l4,	%l2
	movrlz	%g3,	0x388,	%l6
	lduw	[%l7 + 0x18],	%i5
	udiv	%l5,	0x0BF9,	%o2
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	movn	%xcc,	%g5,	%g7
	edge32l	%o0,	%o3,	%g1
	edge32	%o1,	%g6,	%i7
	edge16ln	%i0,	%i2,	%g2
	ldx	[%l7 + 0x68],	%i6
	stb	%o4,	[%l7 + 0x78]
	movvs	%xcc,	%i3,	%i4
	move	%icc,	%i1,	%o5
	ldsw	[%l7 + 0x7C],	%l3
	edge8l	%o6,	%l0,	%l4
	fnegd	%f30,	%f30
	fsrc2	%f4,	%f16
	srl	%g3,	%l6,	%i5
	smulcc	%l2,	0x0539,	%o2
	fcmpne16	%f2,	%f14,	%l1
	xnorcc	%g4,	0x0449,	%l5
	orn	%g5,	0x02C2,	%g7
	sra	%o7,	%o3,	%o0
	stw	%g1,	[%l7 + 0x40]
	ld	[%l7 + 0x28],	%f31
	edge16l	%g6,	%i7,	%i0
	edge8ln	%i2,	%g2,	%o1
	movvc	%xcc,	%o4,	%i3
	andncc	%i4,	%i6,	%i1
	array32	%o5,	%o6,	%l0
	udivx	%l4,	0x1F96,	%l3
	sdiv	%g3,	0x06FF,	%i5
	movgu	%xcc,	%l2,	%l6
	umul	%l1,	%o2,	%l5
	srax	%g4,	0x1D,	%g5
	fxor	%f30,	%f24,	%f16
	save %g7, 0x14C3, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o0,	%g1,	%o3
	movrne	%g6,	%i0,	%i2
	alignaddr	%i7,	%o1,	%g2
	stw	%o4,	[%l7 + 0x3C]
	movgu	%icc,	%i4,	%i3
	subc	%i1,	%o5,	%o6
	stx	%l0,	[%l7 + 0x68]
	edge32n	%i6,	%l4,	%g3
	fmovdvs	%xcc,	%f12,	%f3
	sth	%i5,	[%l7 + 0x6E]
	udivcc	%l2,	0x02DD,	%l6
	alignaddr	%l3,	%o2,	%l1
	srlx	%l5,	0x08,	%g4
	fmovdvs	%xcc,	%f31,	%f13
	edge16	%g7,	%g5,	%o0
	fmovdl	%xcc,	%f3,	%f26
	andn	%o7,	%g1,	%g6
	move	%xcc,	%i0,	%i2
	orn	%o3,	0x1D29,	%o1
	fandnot2s	%f0,	%f16,	%f0
	restore %i7, 0x0706, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %i4, %i3, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%g2,	%f12,	%f26
	fsrc2	%f30,	%f2
	edge32	%o5,	%l0,	%o6
	ldsw	[%l7 + 0x10],	%i6
	edge8	%g3,	%l4,	%i5
	srax	%l6,	%l3,	%l2
	udivx	%o2,	0x0861,	%l5
	xnor	%g4,	0x01EA,	%l1
	andcc	%g7,	%g5,	%o7
	fzeros	%f4
	edge8l	%g1,	%g6,	%i0
	and	%o0,	0x0BA4,	%i2
	fpmerge	%f12,	%f6,	%f24
	srl	%o1,	0x1E,	%i7
	srax	%o3,	0x10,	%i4
	andncc	%o4,	%i1,	%i3
	xorcc	%g2,	%l0,	%o5
	mova	%icc,	%i6,	%o6
	movrne	%l4,	%g3,	%i5
	ldsb	[%l7 + 0x6D],	%l6
	edge8ln	%l3,	%o2,	%l5
	xnor	%g4,	%l2,	%g7
	subcc	%g5,	%o7,	%l1
	std	%f14,	[%l7 + 0x10]
	fpadd32s	%f11,	%f30,	%f16
	xnorcc	%g6,	0x170E,	%g1
	udiv	%i0,	0x1407,	%o0
	stw	%i2,	[%l7 + 0x18]
	or	%i7,	%o1,	%o3
	ldd	[%l7 + 0x58],	%f4
	movrlez	%o4,	%i1,	%i4
	fmovsa	%xcc,	%f9,	%f29
	std	%f20,	[%l7 + 0x78]
	fmovdleu	%icc,	%f14,	%f6
	edge8n	%i3,	%g2,	%o5
	xnor	%l0,	%i6,	%l4
	edge8n	%o6,	%i5,	%g3
	movleu	%xcc,	%l6,	%l3
	movleu	%xcc,	%l5,	%o2
	fmovdge	%xcc,	%f27,	%f8
	fsrc1s	%f4,	%f28
	movrgz	%l2,	%g7,	%g4
	udiv	%o7,	0x1634,	%l1
	fmovrde	%g6,	%f12,	%f0
	subccc	%g5,	0x0508,	%g1
	ldub	[%l7 + 0x7A],	%i0
	movpos	%icc,	%o0,	%i2
	edge16ln	%i7,	%o3,	%o1
	movne	%xcc,	%o4,	%i4
	umulcc	%i3,	%i1,	%g2
	pdist	%f2,	%f0,	%f12
	smul	%o5,	0x0E3B,	%l0
	movneg	%xcc,	%i6,	%o6
	edge16l	%l4,	%g3,	%l6
	fmovsge	%xcc,	%f4,	%f13
	fmovdl	%xcc,	%f15,	%f30
	movrgz	%i5,	0x112,	%l5
	orn	%o2,	0x1BE6,	%l3
	std	%f8,	[%l7 + 0x58]
	fmul8sux16	%f14,	%f22,	%f4
	ldx	[%l7 + 0x40],	%g7
	subc	%l2,	%g4,	%l1
	subc	%g6,	0x0430,	%g5
	edge32ln	%o7,	%i0,	%g1
	ldsw	[%l7 + 0x34],	%o0
	array8	%i7,	%o3,	%i2
	xnorcc	%o4,	%i4,	%o1
	fcmpne32	%f26,	%f4,	%i1
	fmovdvs	%xcc,	%f17,	%f14
	movne	%xcc,	%g2,	%i3
	fxnors	%f30,	%f30,	%f22
	movleu	%icc,	%o5,	%l0
	stb	%o6,	[%l7 + 0x40]
	fmovsn	%xcc,	%f27,	%f25
	fpmerge	%f31,	%f22,	%f4
	fmovsgu	%xcc,	%f13,	%f1
	edge32ln	%l4,	%g3,	%l6
	andn	%i6,	%i5,	%l5
	movcs	%xcc,	%o2,	%l3
	edge8n	%g7,	%l2,	%l1
	fsrc1s	%f10,	%f11
	ldsw	[%l7 + 0x50],	%g6
	fmovdg	%xcc,	%f1,	%f29
	fnot1s	%f11,	%f4
	edge16	%g4,	%o7,	%i0
	movvc	%xcc,	%g5,	%g1
	st	%f13,	[%l7 + 0x68]
	addccc	%i7,	%o0,	%o3
	ldd	[%l7 + 0x40],	%i2
	subcc	%i4,	%o1,	%i1
	udivx	%o4,	0x11F4,	%i3
	movrne	%g2,	%o5,	%o6
	ldd	[%l7 + 0x30],	%f12
	and	%l0,	0x0853,	%g3
	edge32l	%l4,	%l6,	%i6
	andncc	%l5,	%i5,	%o2
	smulcc	%g7,	0x059D,	%l3
	edge16	%l1,	%g6,	%g4
	mova	%icc,	%o7,	%l2
	udivcc	%i0,	0x053F,	%g5
	nop
	set	0x6C, %l1
	ldsh	[%l7 + %l1],	%g1
	nop
	set	0x0E, %o7
	sth	%i7,	[%l7 + %o7]
	xnorcc	%o3,	0x0EB6,	%i2
	sth	%i4,	[%l7 + 0x56]
	sdivcc	%o1,	0x1693,	%i1
	smulcc	%o4,	%i3,	%o0
	addccc	%o5,	%g2,	%o6
	stx	%g3,	[%l7 + 0x18]
	subccc	%l0,	%l6,	%l4
	edge8n	%l5,	%i6,	%o2
	movneg	%icc,	%i5,	%l3
	stb	%l1,	[%l7 + 0x51]
	smul	%g7,	%g4,	%g6
	movvc	%xcc,	%o7,	%i0
	fmovspos	%icc,	%f18,	%f18
	mulscc	%g5,	%l2,	%g1
	fmovrdgez	%o3,	%f26,	%f24
	fnors	%f27,	%f1,	%f5
	andncc	%i7,	%i2,	%i4
	sethi	0x1C93,	%o1
	orncc	%i1,	0x17D4,	%o4
	ldsw	[%l7 + 0x38],	%o0
	movge	%xcc,	%o5,	%i3
	ldub	[%l7 + 0x7D],	%o6
	udiv	%g3,	0x14A5,	%l0
	ldsw	[%l7 + 0x1C],	%l6
	srlx	%g2,	0x09,	%l5
	or	%i6,	%o2,	%i5
	sllx	%l3,	0x1C,	%l1
	fmovsle	%icc,	%f9,	%f16
	addc	%g7,	%l4,	%g6
	move	%xcc,	%o7,	%g4
	orn	%g5,	0x12E9,	%i0
	movg	%icc,	%g1,	%o3
	movgu	%icc,	%i7,	%i2
	udiv	%l2,	0x1CA2,	%o1
	fcmpne16	%f10,	%f16,	%i1
	andn	%i4,	0x07C4,	%o4
	stx	%o5,	[%l7 + 0x50]
	edge16l	%i3,	%o6,	%g3
	array32	%o0,	%l0,	%g2
	fmovdn	%icc,	%f8,	%f19
	addcc	%l6,	%i6,	%l5
	movvs	%icc,	%i5,	%o2
	fexpand	%f31,	%f22
	sethi	0x13FC,	%l1
	fnor	%f6,	%f16,	%f28
	fpmerge	%f11,	%f14,	%f22
	fandnot1	%f8,	%f8,	%f2
	or	%g7,	%l3,	%l4
	ldsh	[%l7 + 0x38],	%g6
	addcc	%g4,	0x1F2E,	%o7
	movg	%icc,	%i0,	%g5
	edge32	%g1,	%i7,	%o3
	xnor	%i2,	%l2,	%o1
	movrgez	%i4,	0x18F,	%o4
	edge32ln	%o5,	%i1,	%o6
	edge32ln	%g3,	%i3,	%o0
	edge8ln	%g2,	%l6,	%i6
	movcc	%icc,	%l5,	%l0
	orn	%i5,	%o2,	%g7
	fmovde	%xcc,	%f31,	%f2
	edge16l	%l1,	%l3,	%l4
	movrlez	%g6,	0x023,	%g4
	movcs	%icc,	%o7,	%g5
	std	%f14,	[%l7 + 0x58]
	movgu	%icc,	%i0,	%g1
	andncc	%i7,	%o3,	%l2
	sir	0x1E6C
	sub	%o1,	%i2,	%i4
	sllx	%o4,	0x02,	%i1
	srlx	%o5,	%o6,	%i3
	addc	%o0,	0x191A,	%g2
	edge16ln	%l6,	%g3,	%l5
	edge8ln	%i6,	%i5,	%o2
	movge	%xcc,	%g7,	%l0
	mulscc	%l1,	0x10BC,	%l4
	xnorcc	%l3,	%g4,	%g6
	fmovsle	%xcc,	%f13,	%f23
	srlx	%g5,	0x06,	%i0
	sub	%o7,	%g1,	%o3
	xnor	%i7,	0x095E,	%l2
	ldsh	[%l7 + 0x26],	%o1
	edge32n	%i2,	%o4,	%i1
	move	%xcc,	%i4,	%o5
	ld	[%l7 + 0x20],	%f8
	smulcc	%i3,	0x073B,	%o0
	mulx	%o6,	0x1FB0,	%g2
	subccc	%g3,	0x01D3,	%l6
	fmovsvs	%icc,	%f19,	%f11
	sdiv	%i6,	0x1EB8,	%i5
	movne	%xcc,	%o2,	%l5
	stx	%l0,	[%l7 + 0x78]
	fandnot2	%f8,	%f4,	%f12
	fcmpgt16	%f12,	%f20,	%l1
	movle	%xcc,	%g7,	%l3
	faligndata	%f8,	%f14,	%f14
	movg	%icc,	%l4,	%g4
	stx	%g6,	[%l7 + 0x38]
	addc	%g5,	%i0,	%g1
	xorcc	%o7,	%o3,	%l2
	xnorcc	%o1,	0x1FCF,	%i2
	sdivcc	%o4,	0x0994,	%i7
	fabsd	%f10,	%f30
	sllx	%i1,	%i4,	%i3
	fpadd32s	%f11,	%f0,	%f12
	fnot2	%f6,	%f4
	ldsb	[%l7 + 0x0F],	%o0
	movrlez	%o6,	0x29F,	%g2
	movleu	%icc,	%g3,	%o5
	sth	%i6,	[%l7 + 0x2A]
	stx	%l6,	[%l7 + 0x60]
	move	%icc,	%o2,	%l5
	edge8l	%i5,	%l1,	%l0
	bshuffle	%f20,	%f18,	%f16
	edge8l	%g7,	%l4,	%g4
	edge16l	%g6,	%l3,	%g5
	fpadd32s	%f15,	%f6,	%f7
	fnand	%f22,	%f2,	%f8
	movgu	%xcc,	%i0,	%g1
	ldsb	[%l7 + 0x3D],	%o7
	edge32	%o3,	%l2,	%o1
	fmovdle	%xcc,	%f27,	%f7
	fxnor	%f22,	%f30,	%f16
	movre	%i2,	0x2F1,	%o4
	andcc	%i1,	0x1B0F,	%i7
	fmovrsgez	%i3,	%f16,	%f17
	fnand	%f10,	%f2,	%f8
	edge16l	%o0,	%o6,	%g2
	ldsb	[%l7 + 0x0E],	%g3
	sir	0x11F1
	movpos	%icc,	%o5,	%i4
	fmovdl	%xcc,	%f16,	%f7
	udivx	%i6,	0x02B3,	%o2
	sub	%l5,	%l6,	%l1
	fcmpgt32	%f16,	%f24,	%i5
	edge16	%g7,	%l0,	%g4
	movgu	%xcc,	%l4,	%g6
	movneg	%icc,	%l3,	%i0
	fmovsge	%xcc,	%f27,	%f19
	sdiv	%g5,	0x1EC2,	%o7
	or	%g1,	%l2,	%o1
	fpsub16s	%f8,	%f1,	%f0
	smulcc	%i2,	%o4,	%o3
	edge8ln	%i7,	%i3,	%o0
	stw	%o6,	[%l7 + 0x38]
	add	%g2,	%i1,	%o5
	movg	%icc,	%g3,	%i4
	save %o2, 0x09B6, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l6,	%l1,	%l5
	movvs	%xcc,	%i5,	%g7
	fmovsvc	%icc,	%f17,	%f15
	movrlez	%g4,	%l0,	%l4
	sllx	%l3,	%i0,	%g6
	andn	%g5,	0x0248,	%o7
	edge16l	%l2,	%o1,	%i2
	movneg	%xcc,	%o4,	%g1
	srl	%o3,	%i3,	%i7
	and	%o0,	%g2,	%o6
	fmovdleu	%xcc,	%f6,	%f18
	movgu	%xcc,	%o5,	%i1
	xnorcc	%i4,	%g3,	%i6
	movpos	%icc,	%o2,	%l6
	movrne	%l1,	0x330,	%i5
	sth	%g7,	[%l7 + 0x58]
	movrlz	%g4,	0x3C1,	%l5
	orcc	%l0,	%l4,	%i0
	sllx	%l3,	%g6,	%o7
	ldd	[%l7 + 0x20],	%f24
	save %l2, 0x0ABD, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f7,	%f26
	array8	%i2,	%o4,	%g5
	subccc	%g1,	%i3,	%o3
	movl	%xcc,	%o0,	%g2
	movcs	%icc,	%o6,	%i7
	fmovsn	%icc,	%f0,	%f24
	ldsw	[%l7 + 0x1C],	%i1
	mulx	%o5,	%g3,	%i4
	stx	%i6,	[%l7 + 0x38]
	orn	%l6,	%o2,	%l1
	alignaddr	%g7,	%i5,	%g4
	and	%l0,	0x13CB,	%l4
	fmovsleu	%icc,	%f6,	%f20
	smul	%l5,	%i0,	%g6
	movleu	%xcc,	%o7,	%l3
	subcc	%o1,	0x1EC4,	%l2
	fmovrslz	%i2,	%f22,	%f11
	edge32	%g5,	%o4,	%g1
	orn	%i3,	0x13BA,	%o3
	fpsub16	%f22,	%f2,	%f6
	addccc	%g2,	0x016E,	%o0
	movge	%icc,	%i7,	%o6
	srax	%i1,	%o5,	%i4
	ldub	[%l7 + 0x36],	%g3
	edge16	%i6,	%o2,	%l1
	fnot1	%f12,	%f14
	fpadd16	%f24,	%f24,	%f4
	movneg	%icc,	%g7,	%l6
	std	%f10,	[%l7 + 0x10]
	mulscc	%i5,	0x06A0,	%l0
	andn	%g4,	0x01A0,	%l4
	movrne	%i0,	%g6,	%o7
	array16	%l3,	%o1,	%l2
	edge32	%i2,	%l5,	%g5
	sdivcc	%g1,	0x185B,	%i3
	edge8ln	%o4,	%o3,	%g2
	edge32n	%i7,	%o6,	%i1
	movge	%xcc,	%o0,	%o5
	and	%i4,	%g3,	%o2
	umul	%i6,	%g7,	%l6
	lduw	[%l7 + 0x6C],	%l1
	sethi	0x09F9,	%l0
	add	%g4,	0x1134,	%i5
	edge32l	%l4,	%g6,	%o7
	sllx	%i0,	%l3,	%l2
	movle	%icc,	%o1,	%l5
	fmovrslz	%g5,	%f1,	%f19
	udivcc	%i2,	0x184E,	%g1
	stx	%o4,	[%l7 + 0x30]
	movcc	%xcc,	%i3,	%o3
	subc	%g2,	%o6,	%i7
	nop
	set	0x25, %g3
	ldub	[%l7 + %g3],	%o0
	sllx	%i1,	0x0D,	%o5
	movleu	%icc,	%g3,	%i4
	movl	%xcc,	%o2,	%i6
	fmovrdgz	%g7,	%f10,	%f0
	edge8ln	%l1,	%l0,	%l6
	edge32l	%g4,	%i5,	%g6
	nop
	set	0x48, %i3
	lduw	[%l7 + %i3],	%l4
	udivx	%i0,	0x15AD,	%o7
	udivcc	%l3,	0x1209,	%o1
	lduw	[%l7 + 0x60],	%l5
	subccc	%l2,	0x16B1,	%i2
	fnegd	%f0,	%f4
	edge16n	%g5,	%o4,	%g1
	edge16n	%o3,	%g2,	%i3
	sub	%i7,	0x07E1,	%o6
	array8	%i1,	%o0,	%g3
	fpadd32	%f14,	%f26,	%f10
	edge16	%i4,	%o5,	%o2
	ldsw	[%l7 + 0x5C],	%g7
	edge32	%l1,	%l0,	%i6
	udiv	%g4,	0x1752,	%i5
	sethi	0x0F34,	%g6
	add	%l4,	%l6,	%o7
	movrlez	%l3,	%o1,	%i0
	sir	0x1C94
	orncc	%l5,	%i2,	%l2
	edge16	%o4,	%g5,	%g1
	movre	%o3,	%g2,	%i3
	fmovrsne	%i7,	%f29,	%f16
	lduh	[%l7 + 0x70],	%i1
	fmovsl	%icc,	%f10,	%f17
	edge16ln	%o0,	%o6,	%g3
	fmovsleu	%icc,	%f31,	%f14
	and	%o5,	%i4,	%o2
	edge8l	%g7,	%l1,	%l0
	andn	%i6,	0x143A,	%i5
	edge16l	%g4,	%g6,	%l4
	st	%f27,	[%l7 + 0x7C]
	xnor	%l6,	%o7,	%o1
	or	%l3,	0x17DC,	%l5
	movvs	%xcc,	%i2,	%l2
	st	%f16,	[%l7 + 0x28]
	edge32l	%o4,	%i0,	%g1
	movrlez	%o3,	%g5,	%i3
	ldsb	[%l7 + 0x48],	%i7
	udivx	%i1,	0x083C,	%o0
	alignaddrl	%o6,	%g3,	%o5
	fmovrde	%i4,	%f2,	%f10
	edge8l	%g2,	%o2,	%g7
	udivx	%l0,	0x1494,	%l1
	fnor	%f12,	%f14,	%f6
	sdivcc	%i6,	0x06A4,	%i5
	fcmpeq16	%f16,	%f26,	%g4
	ldub	[%l7 + 0x13],	%l4
	movgu	%xcc,	%g6,	%o7
	st	%f30,	[%l7 + 0x48]
	movleu	%xcc,	%o1,	%l6
	fmovscs	%icc,	%f21,	%f24
	fand	%f14,	%f26,	%f28
	orncc	%l5,	0x1B96,	%l3
	stb	%l2,	[%l7 + 0x0A]
	movrgz	%i2,	%i0,	%o4
	addcc	%g1,	%o3,	%i3
	ldsh	[%l7 + 0x56],	%g5
	udivcc	%i7,	0x1D4F,	%i1
	orn	%o6,	%g3,	%o0
	movn	%xcc,	%i4,	%o5
	mulx	%g2,	%g7,	%o2
	sra	%l1,	0x1D,	%l0
	fnegs	%f16,	%f18
	add	%i5,	0x120B,	%g4
	orcc	%i6,	0x1F85,	%l4
	udiv	%o7,	0x1E43,	%g6
	fsrc1	%f22,	%f6
	orncc	%o1,	%l5,	%l6
	edge32l	%l3,	%l2,	%i0
	addccc	%o4,	%g1,	%o3
	sdivx	%i2,	0x1BA4,	%i3
	nop
	set	0x40, %g1
	stx	%i7,	[%l7 + %g1]
	fcmpeq16	%f20,	%f12,	%g5
	smulcc	%o6,	0x1CA4,	%g3
	edge8	%o0,	%i1,	%i4
	edge8l	%o5,	%g7,	%g2
	movn	%xcc,	%o2,	%l1
	fandnot1s	%f2,	%f28,	%f6
	bshuffle	%f10,	%f10,	%f26
	stb	%i5,	[%l7 + 0x63]
	movg	%xcc,	%l0,	%i6
	lduh	[%l7 + 0x0A],	%l4
	alignaddr	%o7,	%g6,	%o1
	orncc	%l5,	0x0656,	%g4
	edge32ln	%l6,	%l3,	%i0
	fmovrslez	%l2,	%f31,	%f27
	array16	%o4,	%o3,	%i2
	movge	%xcc,	%g1,	%i3
	edge8n	%i7,	%g5,	%o6
	ldub	[%l7 + 0x7C],	%o0
	and	%i1,	%g3,	%o5
	andcc	%i4,	%g2,	%g7
	array16	%o2,	%i5,	%l1
	sll	%i6,	0x04,	%l0
	sllx	%l4,	%g6,	%o1
	stb	%l5,	[%l7 + 0x6C]
	orn	%o7,	0x04CA,	%l6
	fcmple16	%f30,	%f6,	%l3
	orncc	%g4,	0x0A74,	%l2
	edge8n	%o4,	%i0,	%o3
	fmul8x16al	%f25,	%f7,	%f14
	fandnot2s	%f4,	%f30,	%f30
	ldd	[%l7 + 0x08],	%i2
	mulscc	%g1,	0x1873,	%i7
	srax	%i3,	0x15,	%g5
	movne	%icc,	%o0,	%o6
	array32	%g3,	%o5,	%i1
	fmovdg	%icc,	%f15,	%f8
	fcmpd	%fcc0,	%f10,	%f24
	movgu	%icc,	%g2,	%i4
	movle	%icc,	%o2,	%i5
	movneg	%icc,	%l1,	%g7
	fmovrdgez	%i6,	%f28,	%f0
	std	%f6,	[%l7 + 0x38]
	fmovsleu	%xcc,	%f28,	%f19
	edge16ln	%l0,	%l4,	%o1
	fsrc1s	%f22,	%f16
	stw	%g6,	[%l7 + 0x2C]
	stx	%l5,	[%l7 + 0x28]
	orncc	%l6,	%o7,	%l3
	fmovscc	%xcc,	%f30,	%f4
	movrlz	%g4,	0x09A,	%o4
	array8	%i0,	%o3,	%i2
	edge32l	%g1,	%i7,	%i3
	fmovdvs	%xcc,	%f2,	%f27
	fpsub16	%f12,	%f22,	%f22
	mova	%xcc,	%g5,	%l2
	subc	%o6,	0x1336,	%g3
	srax	%o0,	0x02,	%o5
	movcs	%icc,	%g2,	%i4
	fexpand	%f8,	%f18
	popc	%o2,	%i5
	edge16l	%l1,	%g7,	%i6
	fmovdleu	%icc,	%f7,	%f19
	andn	%l0,	0x1E2A,	%i1
	fand	%f18,	%f26,	%f22
	subcc	%l4,	0x16BC,	%g6
	lduh	[%l7 + 0x28],	%l5
	movrlz	%o1,	0x228,	%o7
	movcc	%xcc,	%l6,	%l3
	stb	%o4,	[%l7 + 0x33]
	ldsb	[%l7 + 0x0A],	%i0
	fmovdg	%icc,	%f18,	%f6
	array8	%o3,	%g4,	%i2
	lduh	[%l7 + 0x3A],	%i7
	movvs	%xcc,	%g1,	%g5
	stx	%l2,	[%l7 + 0x10]
	fcmped	%fcc0,	%f24,	%f16
	smulcc	%i3,	0x01BD,	%g3
	fmovsneg	%xcc,	%f15,	%f22
	st	%f11,	[%l7 + 0x18]
	movgu	%xcc,	%o6,	%o5
	subccc	%o0,	0x137F,	%g2
	and	%o2,	0x0A48,	%i5
	ldsw	[%l7 + 0x18],	%i4
	sth	%g7,	[%l7 + 0x48]
	movn	%icc,	%l1,	%i6
	fpadd16s	%f30,	%f8,	%f22
	fmovrdgz	%l0,	%f30,	%f18
	fpadd16	%f28,	%f14,	%f8
	movl	%icc,	%l4,	%g6
	addcc	%i1,	%o1,	%o7
	fpack32	%f0,	%f30,	%f4
	sth	%l6,	[%l7 + 0x2E]
	udivcc	%l5,	0x0B53,	%o4
	movg	%icc,	%l3,	%i0
	movleu	%icc,	%o3,	%g4
	edge16	%i2,	%g1,	%i7
	sub	%l2,	%i3,	%g3
	ldsw	[%l7 + 0x60],	%o6
	edge16l	%g5,	%o5,	%g2
	movgu	%xcc,	%o2,	%i5
	edge8n	%i4,	%g7,	%l1
	sethi	0x0EFF,	%o0
	xnorcc	%i6,	0x16D3,	%l4
	sllx	%g6,	%i1,	%l0
	ldx	[%l7 + 0x08],	%o7
	fmul8x16	%f1,	%f8,	%f0
	ldub	[%l7 + 0x21],	%o1
	srl	%l5,	%o4,	%l3
	subc	%l6,	%i0,	%o3
	ldub	[%l7 + 0x46],	%g4
	stx	%i2,	[%l7 + 0x60]
	movvs	%xcc,	%g1,	%l2
	edge32	%i7,	%g3,	%o6
	umul	%i3,	0x04EF,	%o5
	nop
	set	0x42, %l0
	ldub	[%l7 + %l0],	%g5
	fmovdge	%icc,	%f9,	%f27
	ld	[%l7 + 0x7C],	%f0
	sethi	0x0927,	%o2
	stw	%i5,	[%l7 + 0x40]
	array8	%g2,	%g7,	%i4
	for	%f4,	%f20,	%f10
	ldd	[%l7 + 0x20],	%l0
	ldsb	[%l7 + 0x2D],	%o0
	sdiv	%i6,	0x01F9,	%g6
	mulscc	%i1,	0x0EA5,	%l0
	xnorcc	%o7,	0x1E32,	%l4
	fandnot1s	%f21,	%f9,	%f9
	edge16n	%l5,	%o1,	%o4
	edge32n	%l3,	%l6,	%o3
	edge8	%g4,	%i0,	%i2
	movleu	%icc,	%g1,	%i7
	movleu	%icc,	%l2,	%g3
	movvc	%icc,	%o6,	%i3
	movrlz	%g5,	%o5,	%o2
	and	%i5,	%g2,	%i4
	fmovsleu	%xcc,	%f29,	%f26
	ldsh	[%l7 + 0x6E],	%g7
	fpmerge	%f23,	%f4,	%f20
	fsrc2	%f8,	%f20
	subcc	%l1,	%i6,	%o0
	ldd	[%l7 + 0x68],	%f28
	ldx	[%l7 + 0x58],	%i1
	smul	%l0,	0x0219,	%g6
	fmovsl	%icc,	%f18,	%f24
	fpsub32s	%f2,	%f29,	%f24
	edge16	%o7,	%l5,	%l4
	fpsub32	%f18,	%f18,	%f18
	ld	[%l7 + 0x4C],	%f21
	movvc	%xcc,	%o1,	%l3
	ldsw	[%l7 + 0x7C],	%l6
	umul	%o4,	0x159A,	%g4
	fmovsge	%icc,	%f12,	%f30
	edge8ln	%o3,	%i2,	%i0
	nop
	set	0x26, %o4
	ldub	[%l7 + %o4],	%i7
	sdiv	%g1,	0x126F,	%l2
	sth	%o6,	[%l7 + 0x70]
	edge32n	%i3,	%g5,	%o5
	fnors	%f1,	%f28,	%f8
	movcc	%xcc,	%o2,	%g3
	movleu	%xcc,	%g2,	%i5
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	array8	%i6,	%g7,	%i1
	and	%l0,	0x0A92,	%o0
	ld	[%l7 + 0x78],	%f30
	movre	%g6,	%l5,	%l4
	stb	%o7,	[%l7 + 0x2A]
	movvc	%xcc,	%l3,	%o1
	edge16ln	%l6,	%g4,	%o4
	umul	%i2,	%i0,	%o3
	xnor	%i7,	%l2,	%g1
	fnot1s	%f2,	%f17
	fmovscs	%xcc,	%f19,	%f31
	sdivcc	%i3,	0x02A7,	%o6
	movrlz	%g5,	0x2F1,	%o2
	fcmpeq32	%f8,	%f14,	%o5
	array8	%g2,	%i5,	%g3
	sdivcc	%l1,	0x18C5,	%i4
	stw	%i6,	[%l7 + 0x1C]
	orcc	%g7,	%i1,	%l0
	edge16n	%o0,	%g6,	%l4
	smul	%o7,	%l3,	%o1
	orcc	%l5,	0x0A9A,	%g4
	stb	%o4,	[%l7 + 0x55]
	movcc	%icc,	%i2,	%l6
	alignaddrl	%o3,	%i0,	%i7
	fmovsvs	%icc,	%f7,	%f9
	fcmpgt32	%f4,	%f26,	%g1
	fmovsgu	%icc,	%f17,	%f11
	st	%f9,	[%l7 + 0x68]
	edge32l	%i3,	%l2,	%o6
	subccc	%g5,	0x0B2F,	%o2
	stw	%o5,	[%l7 + 0x2C]
	movrgz	%g2,	%g3,	%l1
	movle	%xcc,	%i4,	%i6
	sll	%g7,	%i1,	%i5
	movrgz	%l0,	0x0D6,	%g6
	fmuld8sux16	%f19,	%f20,	%f30
	edge32	%l4,	%o7,	%o0
	fmovdcc	%icc,	%f31,	%f28
	and	%l3,	%l5,	%g4
	alignaddr	%o4,	%o1,	%l6
	mulscc	%o3,	0x0A5B,	%i0
	movvc	%xcc,	%i2,	%g1
	subccc	%i3,	%l2,	%o6
	subc	%i7,	%g5,	%o2
	sdivcc	%o5,	0x007A,	%g2
	ldsw	[%l7 + 0x4C],	%g3
	sdiv	%l1,	0x098E,	%i6
	sdiv	%i4,	0x0CDF,	%i1
	ldsb	[%l7 + 0x14],	%i5
	movcc	%icc,	%g7,	%l0
	mova	%xcc,	%g6,	%l4
	fmovse	%xcc,	%f5,	%f10
	nop
	set	0x14, %l2
	lduh	[%l7 + %l2],	%o7
	restore %l3, 0x15E0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g4,	%o4,	%o0
	sra	%l6,	%o3,	%i0
	fand	%f28,	%f30,	%f14
	ldd	[%l7 + 0x08],	%i2
	alignaddrl	%g1,	%o1,	%l2
	movl	%xcc,	%o6,	%i3
	movrne	%g5,	%o2,	%o5
	movn	%xcc,	%g2,	%g3
	smulcc	%i7,	0x0E5B,	%l1
	fzeros	%f18
	orncc	%i4,	%i1,	%i5
	mulscc	%i6,	%g7,	%l0
	fmovrdne	%l4,	%f6,	%f18
	movrlez	%o7,	%l3,	%g6
	movrlz	%g4,	0x2A6,	%l5
	movre	%o0,	0x377,	%o4
	movrne	%o3,	0x140,	%i0
	movne	%xcc,	%l6,	%i2
	addccc	%o1,	0x0641,	%l2
	fmovdl	%xcc,	%f23,	%f12
	sub	%o6,	%g1,	%g5
	pdist	%f28,	%f24,	%f8
	sllx	%i3,	%o5,	%g2
	fmuld8sux16	%f17,	%f28,	%f24
	andcc	%o2,	%g3,	%l1
	ldsw	[%l7 + 0x68],	%i4
	movge	%icc,	%i7,	%i5
	or	%i6,	0x1A8B,	%g7
	edge8l	%i1,	%l4,	%l0
	movre	%l3,	%o7,	%g4
	popc	0x11C3,	%g6
	subc	%l5,	0x011F,	%o4
	fmuld8sux16	%f30,	%f14,	%f22
	movneg	%xcc,	%o0,	%o3
	movn	%icc,	%l6,	%i0
	edge8l	%o1,	%l2,	%o6
	srl	%i2,	%g1,	%g5
	andcc	%i3,	%g2,	%o5
	movl	%icc,	%o2,	%g3
	ldd	[%l7 + 0x38],	%i4
	subc	%l1,	0x1EAF,	%i7
	ldd	[%l7 + 0x68],	%f14
	andncc	%i6,	%g7,	%i1
	movle	%xcc,	%i5,	%l4
	movcs	%icc,	%l0,	%l3
	sethi	0x0F39,	%g4
	xnorcc	%g6,	0x1C08,	%o7
	edge32n	%l5,	%o0,	%o3
	umul	%l6,	0x005F,	%o4
	edge16	%o1,	%l2,	%i0
	ld	[%l7 + 0x40],	%f23
	sethi	0x17E9,	%i2
	ldsb	[%l7 + 0x60],	%g1
	ld	[%l7 + 0x10],	%f12
	umul	%g5,	0x1A23,	%o6
	save %g2, 0x1EB4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f24,	%f23,	%f20
	orcc	%o2,	0x155E,	%g3
	stb	%i3,	[%l7 + 0x52]
	stw	%l1,	[%l7 + 0x64]
	fmovrdlz	%i4,	%f12,	%f22
	fzero	%f22
	fmovrsgez	%i6,	%f18,	%f1
	fmul8x16al	%f12,	%f13,	%f12
	array32	%i7,	%i1,	%g7
	fnors	%f28,	%f4,	%f27
	sdiv	%l4,	0x19FC,	%l0
	faligndata	%f4,	%f4,	%f0
	sdivx	%l3,	0x1448,	%g4
	andncc	%g6,	%o7,	%l5
	stw	%o0,	[%l7 + 0x68]
	fxor	%f2,	%f14,	%f6
	ld	[%l7 + 0x18],	%f30
	edge16	%o3,	%l6,	%o4
	array8	%i5,	%o1,	%l2
	edge8ln	%i2,	%g1,	%i0
	srax	%g5,	0x03,	%g2
	movrlz	%o6,	%o2,	%o5
	movpos	%icc,	%i3,	%l1
	for	%f12,	%f22,	%f28
	orcc	%g3,	%i4,	%i7
	fmovse	%xcc,	%f4,	%f20
	fmul8x16au	%f2,	%f10,	%f2
	udiv	%i6,	0x1365,	%i1
	subccc	%g7,	%l4,	%l0
	movrgez	%g4,	%l3,	%g6
	sth	%o7,	[%l7 + 0x54]
	ldsh	[%l7 + 0x46],	%o0
	fnor	%f24,	%f22,	%f12
	fmovsne	%icc,	%f25,	%f13
	fmul8sux16	%f26,	%f16,	%f30
	edge32n	%l5,	%l6,	%o4
	fmovsne	%xcc,	%f9,	%f0
	edge8ln	%o3,	%o1,	%l2
	save %i2, %i5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g5,	%i0,	%o6
	fmovrsgz	%g2,	%f17,	%f24
	siam	0x0
	move	%icc,	%o2,	%i3
	for	%f26,	%f24,	%f2
	stx	%l1,	[%l7 + 0x20]
	fsrc2	%f12,	%f18
	andncc	%g3,	%i4,	%i7
	subccc	%i6,	%o5,	%g7
	ldsh	[%l7 + 0x68],	%l4
	movneg	%icc,	%i1,	%l0
	fcmps	%fcc0,	%f1,	%f19
	srax	%l3,	%g4,	%g6
	fones	%f6
	fone	%f16
	edge8n	%o7,	%o0,	%l6
	sdiv	%l5,	0x1AE4,	%o3
	ldsw	[%l7 + 0x08],	%o1
	mova	%icc,	%l2,	%i2
	subccc	%i5,	0x0652,	%o4
	sdivcc	%g1,	0x012B,	%g5
	lduw	[%l7 + 0x2C],	%o6
	movgu	%icc,	%g2,	%o2
	movn	%xcc,	%i3,	%l1
	srl	%g3,	0x1E,	%i0
	srl	%i4,	%i7,	%i6
	edge16ln	%o5,	%l4,	%g7
	srl	%l0,	%l3,	%i1
	edge32	%g4,	%o7,	%g6
	xnor	%o0,	0x1CA4,	%l6
	fornot2	%f2,	%f8,	%f28
	movn	%xcc,	%o3,	%o1
	fxnor	%f26,	%f8,	%f14
	srl	%l2,	0x1D,	%l5
	movneg	%xcc,	%i2,	%i5
	edge32n	%o4,	%g1,	%o6
	addc	%g2,	0x16EB,	%g5
	ld	[%l7 + 0x64],	%f20
	sth	%o2,	[%l7 + 0x36]
	ldsb	[%l7 + 0x6B],	%l1
	srlx	%g3,	%i3,	%i4
	orcc	%i7,	0x05BD,	%i0
	fpadd16s	%f19,	%f13,	%f19
	movrlez	%o5,	0x300,	%l4
	sll	%i6,	%l0,	%g7
	movre	%l3,	%i1,	%o7
	add	%g6,	0x06BD,	%o0
	orcc	%g4,	%l6,	%o1
	st	%f20,	[%l7 + 0x7C]
	sth	%l2,	[%l7 + 0x62]
	xor	%l5,	0x11BF,	%o3
	fmovsl	%icc,	%f19,	%f28
	andcc	%i5,	0x0838,	%o4
	array32	%g1,	%o6,	%i2
	sub	%g2,	%g5,	%o2
	array8	%g3,	%l1,	%i4
	fmuld8ulx16	%f26,	%f22,	%f12
	smul	%i3,	%i7,	%o5
	movcs	%xcc,	%l4,	%i0
	move	%xcc,	%l0,	%i6
	fornot1	%f2,	%f0,	%f6
	stb	%l3,	[%l7 + 0x61]
	stx	%i1,	[%l7 + 0x38]
	fornot1s	%f3,	%f4,	%f16
	fmovspos	%icc,	%f19,	%f7
	ldub	[%l7 + 0x32],	%g7
	edge32ln	%g6,	%o0,	%g4
	fmovsleu	%icc,	%f0,	%f8
	sub	%o7,	%l6,	%l2
	movrlez	%l5,	%o3,	%o1
	fmovrsne	%i5,	%f1,	%f19
	movn	%icc,	%g1,	%o4
	orn	%o6,	%i2,	%g5
	orncc	%o2,	%g2,	%g3
	movn	%icc,	%i4,	%i3
	movcc	%xcc,	%i7,	%l1
	orn	%o5,	%l4,	%l0
	fmovsleu	%icc,	%f23,	%f18
	ldsh	[%l7 + 0x0C],	%i6
	fcmple32	%f22,	%f4,	%l3
	fnands	%f4,	%f14,	%f16
	subccc	%i1,	%i0,	%g6
	movre	%o0,	%g4,	%o7
	ldsh	[%l7 + 0x26],	%g7
	fpsub16s	%f9,	%f29,	%f25
	sir	0x0857
	movvc	%xcc,	%l2,	%l6
	fors	%f15,	%f14,	%f8
	movvc	%icc,	%o3,	%l5
	movneg	%xcc,	%o1,	%i5
	ldub	[%l7 + 0x73],	%g1
	fmovsge	%icc,	%f1,	%f24
	udivcc	%o6,	0x1688,	%o4
	movleu	%xcc,	%g5,	%i2
	movrgz	%o2,	0x090,	%g3
	faligndata	%f24,	%f18,	%f28
	ldub	[%l7 + 0x63],	%i4
	save %g2, 0x15B6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x18],	%i7
	movrgez	%l1,	%l4,	%o5
	sub	%l0,	%i6,	%i1
	array16	%i0,	%g6,	%l3
	orncc	%o0,	0x0FFC,	%g4
	xor	%o7,	%l2,	%l6
	xor	%o3,	%l5,	%o1
	edge32ln	%g7,	%g1,	%o6
	fmovdcc	%icc,	%f28,	%f29
	fpack16	%f20,	%f24
	fcmpne32	%f10,	%f20,	%i5
	fandnot2	%f6,	%f14,	%f4
	save %g5, 0x1415, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o4,	%o2,	%g3
	fmovde	%xcc,	%f28,	%f15
	fmovdle	%icc,	%f14,	%f1
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	andn	%l1,	%l4,	%i3
	edge8n	%l0,	%o5,	%i6
	fnand	%f2,	%f20,	%f0
	udivcc	%i1,	0x0C4D,	%i0
	fmovdne	%xcc,	%f23,	%f29
	orncc	%g6,	%l3,	%o0
	fmovsg	%icc,	%f13,	%f12
	edge8	%o7,	%l2,	%l6
	std	%f4,	[%l7 + 0x08]
	array8	%g4,	%l5,	%o1
	array32	%o3,	%g7,	%g1
	st	%f29,	[%l7 + 0x48]
	fsrc2	%f16,	%f6
	restore %o6, %i5, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o4,	%o2,	%g5
	addccc	%g2,	0x1FED,	%i4
	movcs	%icc,	%g3,	%i7
	sra	%l1,	%i3,	%l0
	movleu	%icc,	%l4,	%i6
	sdivcc	%o5,	0x13D2,	%i1
	movne	%xcc,	%i0,	%g6
	smulcc	%o0,	%l3,	%o7
	mulscc	%l2,	%l6,	%l5
	ldx	[%l7 + 0x38],	%o1
	fmovsg	%xcc,	%f16,	%f18
	movpos	%icc,	%g4,	%o3
	fmovrse	%g1,	%f25,	%f3
	movg	%icc,	%g7,	%o6
	andncc	%i2,	%o4,	%i5
	movre	%g5,	0x02A,	%o2
	sethi	0x09D0,	%i4
	srlx	%g3,	%g2,	%i7
	ldsb	[%l7 + 0x35],	%l1
	sdivcc	%i3,	0x0ACE,	%l4
	fsrc1	%f26,	%f16
	edge32	%i6,	%l0,	%i1
	fmovdvs	%xcc,	%f11,	%f9
	and	%o5,	0x1E20,	%i0
	stw	%o0,	[%l7 + 0x38]
	movrlz	%g6,	%o7,	%l2
	movrgz	%l3,	0x3C0,	%l6
	popc	%o1,	%l5
	fmuld8sux16	%f27,	%f4,	%f22
	stb	%o3,	[%l7 + 0x5C]
	edge8ln	%g1,	%g4,	%g7
	andncc	%i2,	%o6,	%i5
	movvs	%xcc,	%g5,	%o4
	movge	%icc,	%o2,	%i4
	movrgz	%g3,	0x256,	%i7
	orcc	%g2,	%i3,	%l1
	fone	%f4
	and	%l4,	0x18AB,	%l0
	lduw	[%l7 + 0x20],	%i1
	xnorcc	%i6,	%o5,	%o0
	xor	%i0,	0x1A8E,	%o7
	fpsub16	%f0,	%f20,	%f12
	ldsh	[%l7 + 0x20],	%g6
	addcc	%l3,	0x16E3,	%l2
	fandnot1s	%f4,	%f16,	%f31
	subcc	%o1,	0x1364,	%l5
	movne	%icc,	%l6,	%o3
	movcc	%xcc,	%g4,	%g7
	popc	%i2,	%g1
	fpadd16s	%f6,	%f4,	%f3
	fmul8sux16	%f28,	%f24,	%f18
	movle	%xcc,	%o6,	%i5
	sllx	%g5,	%o2,	%o4
	fmul8x16	%f22,	%f22,	%f22
	movcs	%icc,	%i4,	%g3
	fpsub16s	%f10,	%f6,	%f7
	edge8	%i7,	%i3,	%g2
	ld	[%l7 + 0x50],	%f26
	sra	%l1,	0x09,	%l4
	movcc	%xcc,	%l0,	%i1
	edge8l	%i6,	%o5,	%i0
	sethi	0x1BD8,	%o7
	srl	%o0,	0x12,	%g6
	save %l3, %o1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%l6,	%l5
	sethi	0x1E35,	%g4
	fcmple16	%f4,	%f22,	%o3
	fmovsvc	%icc,	%f12,	%f0
	ldsh	[%l7 + 0x58],	%i2
	movge	%icc,	%g7,	%o6
	fmovse	%icc,	%f12,	%f17
	subcc	%i5,	0x00C5,	%g5
	sdivcc	%o2,	0x1720,	%g1
	sth	%o4,	[%l7 + 0x70]
	movvs	%icc,	%i4,	%i7
	edge8l	%i3,	%g2,	%l1
	movg	%icc,	%l4,	%l0
	stx	%g3,	[%l7 + 0x78]
	sdivcc	%i1,	0x1640,	%o5
	sllx	%i6,	%o7,	%i0
	movge	%xcc,	%o0,	%l3
	xnor	%o1,	0x11FC,	%l2
	lduw	[%l7 + 0x4C],	%g6
	andcc	%l6,	0x09B1,	%l5
	umulcc	%g4,	%i2,	%g7
	sll	%o6,	%o3,	%i5
	alignaddrl	%g5,	%o2,	%g1
	orncc	%o4,	0x0D05,	%i4
	ldd	[%l7 + 0x70],	%i6
	sdiv	%i3,	0x09C5,	%g2
	sllx	%l1,	0x11,	%l0
	fnors	%f30,	%f29,	%f12
	fone	%f16
	sub	%g3,	%l4,	%o5
	array32	%i6,	%o7,	%i1
	movvs	%xcc,	%i0,	%l3
	sllx	%o0,	0x08,	%o1
	orn	%g6,	%l2,	%l6
	smul	%g4,	%i2,	%l5
	popc	0x141D,	%g7
	sir	0x0144
	fmovde	%xcc,	%f17,	%f4
	ldd	[%l7 + 0x70],	%f4
	movcc	%xcc,	%o6,	%o3
	fnands	%f9,	%f22,	%f12
	stb	%i5,	[%l7 + 0x49]
	fmovdn	%xcc,	%f17,	%f18
	sethi	0x1192,	%o2
	mova	%xcc,	%g1,	%g5
	sth	%i4,	[%l7 + 0x3A]
	fxnors	%f1,	%f10,	%f31
	fandnot2s	%f2,	%f30,	%f30
	stx	%i7,	[%l7 + 0x28]
	fmul8x16	%f27,	%f12,	%f12
	sdiv	%i3,	0x0477,	%o4
	sdiv	%l1,	0x034F,	%l0
	fmovsn	%xcc,	%f20,	%f6
	fcmps	%fcc1,	%f11,	%f29
	andn	%g3,	%l4,	%o5
	sdivx	%g2,	0x1770,	%i6
	edge8l	%i1,	%i0,	%o7
	movcs	%xcc,	%l3,	%o0
	movcs	%icc,	%o1,	%l2
	addcc	%g6,	%g4,	%i2
	edge8n	%l5,	%l6,	%o6
	ldsw	[%l7 + 0x78],	%g7
	add	%o3,	%i5,	%g1
	alignaddrl	%o2,	%i4,	%i7
	fmovdgu	%xcc,	%f30,	%f25
	movge	%icc,	%g5,	%i3
	fmovdneg	%xcc,	%f28,	%f9
	alignaddr	%o4,	%l1,	%l0
	fsrc1	%f16,	%f20
	fmovde	%xcc,	%f10,	%f20
	and	%g3,	0x09E0,	%l4
	edge32	%o5,	%i6,	%g2
	add	%i0,	%o7,	%l3
	save %o0, 0x0189, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l2,	0x171D,	%o1
	fmovsa	%icc,	%f4,	%f8
	st	%f6,	[%l7 + 0x58]
	movle	%xcc,	%g4,	%i2
	fmovscs	%icc,	%f6,	%f23
	movne	%xcc,	%l5,	%g6
	fxor	%f26,	%f8,	%f12
	subcc	%o6,	0x192B,	%g7
	array32	%o3,	%l6,	%g1
	andcc	%o2,	%i4,	%i5
	umulcc	%i7,	0x18DD,	%i3
	ldsw	[%l7 + 0x10],	%o4
	xorcc	%l1,	%g5,	%l0
	smulcc	%g3,	0x0444,	%l4
	sethi	0x1F42,	%i6
	alignaddr	%o5,	%i0,	%o7
	orn	%l3,	%g2,	%i1
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	andn	%o1,	%i2,	%g4
	umulcc	%g6,	0x1401,	%l5
	fpadd32	%f4,	%f16,	%f18
	ldub	[%l7 + 0x7A],	%g7
	save %o6, %o3, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o2,	%l6,	%i5
	lduh	[%l7 + 0x2E],	%i4
	sub	%i7,	0x04F0,	%o4
	sethi	0x19BA,	%i3
	andncc	%g5,	%l0,	%g3
	fmovrsne	%l4,	%f8,	%f12
	array8	%l1,	%i6,	%o5
	edge32ln	%i0,	%l3,	%g2
	fcmped	%fcc0,	%f26,	%f14
	subcc	%o7,	0x1B0D,	%o0
	sdivx	%i1,	0x13B9,	%o1
	srax	%i2,	%g4,	%l2
	subccc	%g6,	%l5,	%o6
	movgu	%xcc,	%g7,	%g1
	sth	%o3,	[%l7 + 0x4C]
	umulcc	%o2,	0x160C,	%i5
	sll	%i4,	0x1D,	%l6
	srl	%o4,	0x1E,	%i3
	movl	%icc,	%g5,	%l0
	andn	%g3,	%i7,	%l1
	ldsh	[%l7 + 0x5E],	%l4
	stw	%o5,	[%l7 + 0x4C]
	movvc	%xcc,	%i0,	%i6
	movvs	%icc,	%g2,	%l3
	srlx	%o0,	0x07,	%i1
	movrlz	%o7,	0x088,	%i2
	sll	%g4,	0x01,	%o1
	sub	%g6,	%l5,	%l2
	ldx	[%l7 + 0x78],	%o6
	addcc	%g1,	%g7,	%o2
	movrgz	%i5,	0x0BD,	%o3
	std	%f28,	[%l7 + 0x20]
	orn	%l6,	0x0066,	%o4
	mova	%xcc,	%i4,	%g5
	mova	%icc,	%l0,	%g3
	movneg	%icc,	%i3,	%i7
	xnor	%l1,	%o5,	%l4
	addcc	%i0,	0x03FB,	%g2
	movneg	%xcc,	%i6,	%l3
	fcmpgt16	%f0,	%f14,	%o0
	fnands	%f3,	%f25,	%f22
	srax	%i1,	0x09,	%i2
	sdivx	%g4,	0x1556,	%o1
	fxnors	%f7,	%f5,	%f17
	fnand	%f0,	%f14,	%f28
	sdivcc	%o7,	0x1724,	%l5
	fpsub16s	%f0,	%f11,	%f28
	fmuld8sux16	%f16,	%f5,	%f22
	add	%g6,	0x1837,	%l2
	andn	%o6,	0x1E40,	%g1
	fmovdleu	%xcc,	%f7,	%f9
	udivcc	%g7,	0x0F69,	%o2
	sll	%i5,	0x0C,	%o3
	popc	%o4,	%i4
	addccc	%g5,	%l6,	%l0
	stw	%g3,	[%l7 + 0x3C]
	ldsh	[%l7 + 0x2A],	%i3
	edge8ln	%i7,	%l1,	%l4
	ldd	[%l7 + 0x58],	%f30
	edge8	%i0,	%o5,	%g2
	fmovdg	%icc,	%f16,	%f20
	nop
	set	0x4D, %l4
	stb	%l3,	[%l7 + %l4]
	ld	[%l7 + 0x7C],	%f12
	edge8n	%i6,	%i1,	%i2
	alignaddrl	%g4,	%o1,	%o7
	sub	%l5,	0x0EB8,	%g6
	subccc	%l2,	%o6,	%g1
	fmovrdne	%o0,	%f28,	%f8
	movrgz	%g7,	%o2,	%i5
	xnorcc	%o4,	%o3,	%g5
	stx	%l6,	[%l7 + 0x08]
	edge16l	%l0,	%i4,	%g3
	ld	[%l7 + 0x08],	%f12
	addcc	%i3,	%i7,	%l1
	edge16	%l4,	%i0,	%o5
	udiv	%g2,	0x1500,	%l3
	addcc	%i6,	%i1,	%g4
	andn	%i2,	0x11C2,	%o1
	subc	%l5,	%g6,	%o7
	fmovrdne	%o6,	%f16,	%f30
	fsrc1s	%f26,	%f13
	movleu	%icc,	%g1,	%o0
	subccc	%g7,	%o2,	%l2
	fcmpne32	%f0,	%f0,	%i5
	xor	%o3,	%g5,	%l6
	sdivx	%o4,	0x06AC,	%i4
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%g3
	edge32	%l0,	%i3,	%i7
	movrlez	%l4,	%l1,	%i0
	stb	%o5,	[%l7 + 0x5A]
	array8	%l3,	%i6,	%i1
	fmovscc	%icc,	%f26,	%f14
	movcc	%icc,	%g4,	%i2
	st	%f27,	[%l7 + 0x4C]
	sethi	0x1366,	%g2
	alignaddr	%o1,	%l5,	%o7
	movrgz	%o6,	0x2D6,	%g1
	or	%g6,	%o0,	%o2
	movgu	%icc,	%g7,	%l2
	edge8ln	%i5,	%g5,	%l6
	edge32ln	%o3,	%o4,	%g3
	ldsh	[%l7 + 0x7E],	%i4
	fmul8ulx16	%f8,	%f30,	%f22
	srlx	%l0,	%i7,	%i3
	popc	0x124F,	%l1
	fnegd	%f2,	%f8
	subc	%i0,	0x1523,	%o5
	movcs	%icc,	%l3,	%i6
	st	%f8,	[%l7 + 0x14]
	fornot1	%f22,	%f28,	%f0
	fmovde	%icc,	%f27,	%f17
	fpsub32	%f12,	%f2,	%f30
	and	%l4,	0x1FFB,	%g4
	umulcc	%i2,	0x0211,	%g2
	sll	%o1,	0x0C,	%l5
	smulcc	%o7,	%o6,	%g1
	array16	%g6,	%i1,	%o0
	movg	%xcc,	%o2,	%l2
	fnand	%f26,	%f0,	%f0
	orncc	%i5,	%g5,	%g7
	sdivx	%l6,	0x0F7A,	%o3
	movl	%icc,	%g3,	%o4
	fcmpeq16	%f16,	%f30,	%l0
	mulx	%i4,	0x1116,	%i3
	addccc	%i7,	%l1,	%o5
	array8	%i0,	%i6,	%l3
	edge16l	%l4,	%i2,	%g4
	fnand	%f18,	%f6,	%f0
	movcc	%icc,	%g2,	%l5
	xnorcc	%o1,	%o6,	%g1
	ldd	[%l7 + 0x10],	%f0
	movcs	%icc,	%g6,	%o7
	fcmpgt16	%f22,	%f28,	%o0
	fmovdcs	%xcc,	%f1,	%f29
	mova	%icc,	%i1,	%o2
	array16	%l2,	%g5,	%i5
	movrlez	%l6,	0x146,	%g7
	st	%f11,	[%l7 + 0x58]
	edge8n	%o3,	%g3,	%o4
	movne	%xcc,	%i4,	%i3
	srl	%i7,	0x07,	%l1
	fcmpne32	%f18,	%f22,	%o5
	fmovsneg	%xcc,	%f20,	%f10
	fpack16	%f14,	%f31
	xorcc	%l0,	%i0,	%i6
	ldsb	[%l7 + 0x14],	%l4
	orcc	%l3,	0x0BAF,	%g4
	stb	%g2,	[%l7 + 0x28]
	srax	%l5,	%i2,	%o6
	std	%f10,	[%l7 + 0x08]
	xnorcc	%g1,	0x080F,	%g6
	array8	%o1,	%o7,	%i1
	ldub	[%l7 + 0x79],	%o0
	fcmpgt32	%f2,	%f0,	%l2
	edge32n	%o2,	%i5,	%g5
	fnegd	%f28,	%f10
	fmovrsgez	%g7,	%f31,	%f8
	movn	%xcc,	%o3,	%l6
	fcmpgt16	%f18,	%f14,	%o4
	stb	%g3,	[%l7 + 0x13]
	edge16	%i3,	%i4,	%l1
	xnor	%o5,	0x117D,	%l0
	fmovdleu	%icc,	%f21,	%f12
	movneg	%icc,	%i7,	%i6
	fmovrsgez	%i0,	%f22,	%f7
	andcc	%l4,	%g4,	%g2
	restore %l5, %i2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o6,	%g6,	%o1
	sra	%o7,	%i1,	%o0
	umulcc	%g1,	0x146E,	%l2
	mulx	%i5,	%o2,	%g5
	fzero	%f4
	subccc	%o3,	0x122B,	%g7
	orncc	%l6,	%g3,	%o4
	movrne	%i3,	%l1,	%i4
	edge16ln	%o5,	%i7,	%i6
	fmovspos	%icc,	%f4,	%f16
	mova	%icc,	%i0,	%l0
	sdivx	%l4,	0x1C63,	%g2
	edge32n	%l5,	%g4,	%l3
	fxors	%f8,	%f11,	%f12
	fpsub32s	%f6,	%f20,	%f14
	lduh	[%l7 + 0x4E],	%i2
	fands	%f27,	%f11,	%f15
	movg	%xcc,	%g6,	%o1
	udivx	%o6,	0x1854,	%i1
	ldsw	[%l7 + 0x08],	%o7
	edge32n	%g1,	%o0,	%l2
	fsrc1	%f12,	%f0
	fmovrse	%i5,	%f28,	%f3
	sllx	%g5,	%o2,	%o3
	sll	%l6,	0x0F,	%g3
	fmuld8ulx16	%f12,	%f15,	%f30
	sub	%o4,	%i3,	%l1
	ldub	[%l7 + 0x7C],	%g7
	stb	%i4,	[%l7 + 0x53]
	lduh	[%l7 + 0x32],	%o5
	array16	%i7,	%i0,	%i6
	movpos	%xcc,	%l4,	%l0
	srl	%l5,	%g2,	%g4
	stw	%i2,	[%l7 + 0x7C]
	smul	%l3,	0x18EA,	%o1
	ldd	[%l7 + 0x28],	%o6
	edge16n	%i1,	%o7,	%g1
	movg	%xcc,	%o0,	%l2
	andn	%i5,	%g6,	%o2
	xnorcc	%g5,	0x1455,	%l6
	movne	%xcc,	%o3,	%g3
	or	%i3,	0x157F,	%o4
	ldd	[%l7 + 0x68],	%l0
	movgu	%icc,	%i4,	%g7
	andn	%i7,	%o5,	%i0
	sdivx	%l4,	0x06C4,	%i6
	sethi	0x04EB,	%l5
	fmovdpos	%icc,	%f13,	%f23
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	sdivcc	%i2,	0x1366,	%l3
	umulcc	%g4,	%o1,	%o6
	sdiv	%o7,	0x06C0,	%g1
	addcc	%o0,	%l2,	%i1
	movrgez	%g6,	%o2,	%i5
	umulcc	%l6,	0x086F,	%o3
	ldsh	[%l7 + 0x38],	%g3
	fcmpeq32	%f12,	%f6,	%i3
	popc	0x123A,	%o4
	fmovsl	%icc,	%f2,	%f27
	alignaddr	%l1,	%g5,	%g7
	lduh	[%l7 + 0x0A],	%i4
	edge32l	%i7,	%o5,	%i0
	edge32l	%i6,	%l4,	%l5
	fmovdvc	%xcc,	%f17,	%f5
	edge16	%g2,	%i2,	%l3
	ldsw	[%l7 + 0x74],	%g4
	fmovdvc	%xcc,	%f31,	%f25
	subc	%l0,	%o6,	%o7
	srlx	%g1,	%o0,	%o1
	add	%i1,	0x1EC9,	%l2
	and	%g6,	0x18E0,	%o2
	lduh	[%l7 + 0x2E],	%l6
	ldd	[%l7 + 0x50],	%i4
	sra	%g3,	%i3,	%o4
	movvc	%xcc,	%l1,	%o3
	st	%f4,	[%l7 + 0x7C]
	movge	%xcc,	%g7,	%g5
	xnor	%i4,	%o5,	%i0
	fornot1s	%f12,	%f7,	%f26
	andn	%i7,	%l4,	%l5
	fcmpeq32	%f22,	%f10,	%i6
	array32	%i2,	%g2,	%l3
	movre	%l0,	%o6,	%o7
	array16	%g4,	%g1,	%o0
	sra	%i1,	0x18,	%o1
	edge16	%g6,	%l2,	%l6
	orcc	%i5,	0x14BA,	%o2
	stb	%i3,	[%l7 + 0x4B]
	xnor	%o4,	%l1,	%o3
	subcc	%g7,	%g3,	%g5
	udiv	%o5,	0x0868,	%i4
	movle	%xcc,	%i7,	%l4
	and	%i0,	0x04D9,	%l5
	edge8ln	%i2,	%g2,	%i6
	edge32n	%l3,	%l0,	%o7
	fmovdvc	%icc,	%f12,	%f2
	fmovsa	%xcc,	%f23,	%f24
	addc	%g4,	%g1,	%o0
	array32	%i1,	%o1,	%o6
	ldub	[%l7 + 0x6A],	%l2
	srlx	%l6,	0x10,	%i5
	srax	%g6,	%i3,	%o2
	ld	[%l7 + 0x1C],	%f3
	sub	%l1,	%o4,	%g7
	st	%f14,	[%l7 + 0x38]
	edge16	%o3,	%g3,	%g5
	subccc	%o5,	0x16AB,	%i7
	stw	%i4,	[%l7 + 0x0C]
	movrlz	%i0,	0x0EF,	%l4
	sdivx	%l5,	0x1019,	%i2
	edge32	%i6,	%g2,	%l0
	edge8ln	%l3,	%g4,	%o7
	addccc	%o0,	0x1D27,	%g1
	addc	%o1,	%i1,	%o6
	sdivcc	%l2,	0x0FB5,	%i5
	fcmped	%fcc1,	%f18,	%f26
	fcmple32	%f12,	%f14,	%l6
	movn	%xcc,	%g6,	%o2
	fpsub32s	%f12,	%f30,	%f27
	movrne	%i3,	0x2A3,	%l1
	ld	[%l7 + 0x78],	%f18
	movge	%icc,	%g7,	%o3
	stx	%o4,	[%l7 + 0x30]
	smulcc	%g5,	0x1A31,	%g3
	movg	%icc,	%o5,	%i4
	ldsw	[%l7 + 0x18],	%i7
	bshuffle	%f2,	%f2,	%f4
	sth	%i0,	[%l7 + 0x74]
	fmul8ulx16	%f14,	%f14,	%f28
	mova	%icc,	%l5,	%l4
	udivx	%i6,	0x1BCF,	%g2
	xorcc	%i2,	0x03B6,	%l0
	edge8ln	%l3,	%g4,	%o7
	alignaddr	%g1,	%o0,	%o1
	siam	0x2
	fones	%f7
	ldd	[%l7 + 0x68],	%o6
	udiv	%l2,	0x06F5,	%i5
	stx	%i1,	[%l7 + 0x68]
	movrne	%l6,	0x2F5,	%g6
	fors	%f16,	%f4,	%f20
	movleu	%icc,	%i3,	%l1
	edge16n	%o2,	%g7,	%o3
	fmovscc	%icc,	%f16,	%f28
	sth	%o4,	[%l7 + 0x6C]
	movneg	%icc,	%g5,	%o5
	umul	%i4,	%g3,	%i7
	andcc	%i0,	%l5,	%l4
	fmovrslez	%i6,	%f15,	%f8
	fmovsvs	%xcc,	%f0,	%f14
	movrlz	%i2,	0x0EF,	%l0
	smul	%l3,	%g2,	%o7
	fmovda	%xcc,	%f28,	%f7
	movvc	%xcc,	%g4,	%g1
	movleu	%icc,	%o0,	%o1
	fabss	%f12,	%f20
	movvc	%icc,	%o6,	%i5
	nop
	set	0x40, %i0
	std	%f10,	[%l7 + %i0]
	xorcc	%i1,	0x1B97,	%l2
	edge32n	%l6,	%i3,	%l1
	xorcc	%o2,	%g7,	%o3
	stx	%g6,	[%l7 + 0x10]
	pdist	%f30,	%f18,	%f10
	fmovscs	%xcc,	%f9,	%f14
	alignaddrl	%o4,	%g5,	%i4
	srl	%o5,	0x0A,	%i7
	andcc	%g3,	0x19A6,	%i0
	orcc	%l5,	%i6,	%i2
	mulx	%l0,	%l4,	%l3
	movvs	%xcc,	%o7,	%g4
	edge8l	%g1,	%g2,	%o1
	fcmpne16	%f4,	%f26,	%o0
	fzeros	%f31
	mova	%icc,	%i5,	%i1
	movrlez	%o6,	%l2,	%i3
	mulx	%l6,	0x0B07,	%l1
	movcc	%xcc,	%o2,	%g7
	fmovsg	%icc,	%f21,	%f28
	edge8	%o3,	%o4,	%g6
	movge	%icc,	%i4,	%o5
	andcc	%i7,	0x05E4,	%g5
	umul	%i0,	0x1EC0,	%g3
	edge8n	%i6,	%i2,	%l5
	edge8ln	%l4,	%l0,	%l3
	sllx	%o7,	%g4,	%g2
	movvc	%xcc,	%o1,	%g1
	edge16l	%o0,	%i1,	%i5
	save %o6, %l2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l6,	0x09F1,	%o2
	fornot1	%f28,	%f20,	%f6
	andncc	%l1,	%o3,	%g7
	sll	%g6,	0x19,	%o4
	xorcc	%i4,	0x1D94,	%i7
	add	%o5,	0x0C65,	%g5
	addccc	%g3,	0x07D0,	%i6
	srl	%i2,	0x13,	%i0
	movl	%xcc,	%l5,	%l0
	movle	%icc,	%l4,	%l3
	ld	[%l7 + 0x78],	%f25
	xor	%o7,	%g2,	%o1
	movle	%xcc,	%g4,	%o0
	edge8l	%i1,	%g1,	%i5
	lduh	[%l7 + 0x0C],	%l2
	fnegd	%f4,	%f30
	sir	0x157F
	fandnot2	%f18,	%f30,	%f2
	srax	%i3,	0x0C,	%l6
	sdiv	%o2,	0x0259,	%o6
	fmovse	%icc,	%f13,	%f4
	edge8l	%o3,	%g7,	%l1
	ldsb	[%l7 + 0x11],	%o4
	movneg	%icc,	%i4,	%i7
	or	%o5,	0x0EE1,	%g6
	fpsub16	%f2,	%f10,	%f16
	fmovdvs	%xcc,	%f15,	%f21
	srlx	%g5,	%i6,	%g3
	edge32	%i0,	%i2,	%l5
	addcc	%l4,	0x1ADC,	%l3
	sdiv	%o7,	0x1383,	%l0
	fnegs	%f14,	%f7
	xnorcc	%o1,	%g4,	%g2
	movrlez	%i1,	0x013,	%g1
	subcc	%o0,	%i5,	%i3
	or	%l2,	0x17D6,	%o2
	fandnot2s	%f25,	%f7,	%f1
	stb	%o6,	[%l7 + 0x59]
	movneg	%icc,	%l6,	%o3
	edge32l	%g7,	%l1,	%i4
	orncc	%i7,	%o4,	%g6
	fornot1	%f8,	%f14,	%f30
	subcc	%o5,	%g5,	%i6
	subccc	%g3,	%i0,	%l5
	fsrc1	%f30,	%f2
	movrne	%i2,	0x2FB,	%l3
	fpadd32s	%f18,	%f19,	%f7
	lduh	[%l7 + 0x54],	%o7
	xnorcc	%l4,	0x1C48,	%l0
	movneg	%xcc,	%o1,	%g2
	mulscc	%g4,	0x015A,	%i1
	xorcc	%o0,	%i5,	%i3
	fmovdneg	%icc,	%f18,	%f2
	sub	%l2,	%o2,	%g1
	alignaddrl	%l6,	%o3,	%o6
	fcmpgt16	%f8,	%f18,	%g7
	ldsb	[%l7 + 0x64],	%i4
	move	%icc,	%l1,	%i7
	ldsh	[%l7 + 0x7A],	%o4
	xorcc	%o5,	%g6,	%g5
	movrne	%i6,	%i0,	%g3
	movcc	%xcc,	%l5,	%i2
	fnegd	%f14,	%f2
	movvc	%icc,	%l3,	%o7
	udivcc	%l4,	0x0968,	%o1
	std	%f14,	[%l7 + 0x40]
	andn	%l0,	0x0EF3,	%g2
	stx	%g4,	[%l7 + 0x20]
	ldd	[%l7 + 0x78],	%f30
	array16	%o0,	%i5,	%i1
	edge16	%i3,	%l2,	%g1
	edge8ln	%l6,	%o3,	%o2
	fmovdne	%xcc,	%f28,	%f24
	sth	%o6,	[%l7 + 0x68]
	fmovsleu	%icc,	%f19,	%f11
	edge8l	%g7,	%l1,	%i7
	movneg	%xcc,	%o4,	%o5
	movvc	%xcc,	%g6,	%i4
	movvc	%icc,	%i6,	%i0
	movge	%icc,	%g3,	%l5
	stx	%i2,	[%l7 + 0x38]
	movrlz	%g5,	%o7,	%l3
	orn	%o1,	0x13A3,	%l4
	andcc	%l0,	%g2,	%g4
	udivx	%i5,	0x0E01,	%i1
	sdivx	%i3,	0x0589,	%o0
	sll	%g1,	%l6,	%o3
	fpsub16s	%f5,	%f26,	%f31
	fmovsvs	%icc,	%f27,	%f8
	addccc	%o2,	%l2,	%g7
	movge	%xcc,	%o6,	%i7
	movrlz	%l1,	0x0B5,	%o4
	popc	0x173E,	%g6
	siam	0x6
	xnor	%o5,	0x1049,	%i4
	movpos	%xcc,	%i0,	%g3
	stb	%l5,	[%l7 + 0x32]
	sra	%i2,	0x0D,	%g5
	fmovsne	%icc,	%f5,	%f2
	subccc	%i6,	%l3,	%o7
	udiv	%l4,	0x0682,	%l0
	st	%f9,	[%l7 + 0x64]
	fmovscs	%xcc,	%f8,	%f17
	edge16ln	%g2,	%o1,	%g4
	andn	%i5,	%i3,	%i1
	lduw	[%l7 + 0x64],	%o0
	andcc	%g1,	0x09F7,	%o3
	or	%l6,	%l2,	%g7
	udiv	%o2,	0x0FC0,	%i7
	fone	%f30
	sethi	0x1C6B,	%o6
	fmul8x16au	%f22,	%f0,	%f2
	movle	%xcc,	%l1,	%g6
	fmovsne	%xcc,	%f1,	%f30
	or	%o4,	%i4,	%i0
	fpsub32s	%f7,	%f16,	%f22
	fexpand	%f22,	%f10
	mova	%icc,	%o5,	%g3
	sethi	0x1348,	%i2
	save %l5, 0x1197, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i6,	0x0EF,	%l3
	fmovdcc	%icc,	%f0,	%f31
	smulcc	%o7,	%l4,	%g2
	edge16n	%o1,	%l0,	%i5
	array32	%g4,	%i1,	%o0
	xnorcc	%i3,	0x069D,	%o3
	movge	%icc,	%l6,	%g1
	movrne	%g7,	%l2,	%o2
	xorcc	%i7,	0x1D49,	%l1
	andncc	%o6,	%o4,	%i4
	sir	0x04E8
	fzeros	%f9
	movgu	%icc,	%i0,	%g6
	ldx	[%l7 + 0x38],	%g3
	fpackfix	%f18,	%f7
	edge32ln	%o5,	%i2,	%g5
	umulcc	%l5,	%i6,	%o7
	array16	%l4,	%l3,	%g2
	fabsd	%f16,	%f6
	edge32	%o1,	%l0,	%g4
	add	%i5,	0x1EF7,	%i1
	orn	%o0,	%o3,	%i3
	edge8l	%l6,	%g1,	%g7
	stw	%l2,	[%l7 + 0x30]
	fnands	%f8,	%f20,	%f13
	fmovrslez	%o2,	%f16,	%f14
	fmovsg	%icc,	%f12,	%f23
	movrlz	%i7,	%o6,	%l1
	lduw	[%l7 + 0x64],	%i4
	mulscc	%i0,	0x0BC2,	%o4
	edge8l	%g3,	%o5,	%g6
	fmul8x16	%f20,	%f22,	%f26
	movrgz	%i2,	0x0FF,	%l5
	andncc	%i6,	%o7,	%l4
	udivx	%g5,	0x10E0,	%l3
	fxor	%f0,	%f4,	%f22
	fnand	%f14,	%f12,	%f28
	and	%o1,	0x18F2,	%l0
	movn	%xcc,	%g4,	%g2
	fmovdpos	%icc,	%f10,	%f28
	stw	%i5,	[%l7 + 0x54]
	fornot1s	%f23,	%f4,	%f6
	edge16ln	%i1,	%o0,	%i3
	fzero	%f14
	movne	%xcc,	%o3,	%l6
	movle	%icc,	%g1,	%l2
	edge8n	%g7,	%o2,	%o6
	ldd	[%l7 + 0x60],	%f2
	fnot2s	%f1,	%f21
	stb	%i7,	[%l7 + 0x2C]
	restore %l1, %i0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%g3,	%o5
	edge8ln	%g6,	%i2,	%l5
	movne	%icc,	%i4,	%i6
	edge16l	%o7,	%g5,	%l4
	edge16	%l3,	%o1,	%l0
	movn	%icc,	%g4,	%g2
	fcmple16	%f12,	%f10,	%i5
	fmovdneg	%icc,	%f13,	%f25
	siam	0x3
	ldd	[%l7 + 0x08],	%o0
	movrgz	%i3,	0x0E8,	%o3
	sethi	0x051E,	%l6
	or	%i1,	%g1,	%l2
	movneg	%icc,	%o2,	%g7
	srax	%i7,	0x04,	%l1
	srax	%o6,	0x0B,	%i0
	array8	%o4,	%g3,	%o5
	movpos	%xcc,	%i2,	%g6
	lduw	[%l7 + 0x60],	%l5
	fsrc1	%f28,	%f24
	movne	%xcc,	%i4,	%o7
	sdiv	%i6,	0x0455,	%l4
	alignaddrl	%l3,	%g5,	%o1
	ldx	[%l7 + 0x08],	%l0
	movre	%g2,	0x1B2,	%g4
	movgu	%icc,	%o0,	%i5
	movne	%xcc,	%i3,	%l6
	and	%i1,	%g1,	%l2
	andcc	%o3,	%g7,	%i7
	fsrc1	%f26,	%f16
	std	%f4,	[%l7 + 0x50]
	udivx	%l1,	0x116E,	%o2
	sra	%i0,	%o6,	%o4
	fmovsvs	%xcc,	%f31,	%f5
	popc	%o5,	%g3
	edge16	%g6,	%l5,	%i2
	smulcc	%o7,	0x1F76,	%i4
	fmovdvs	%xcc,	%f16,	%f31
	xor	%i6,	%l4,	%g5
	fmovdle	%xcc,	%f16,	%f31
	add	%o1,	0x04C0,	%l3
	stx	%g2,	[%l7 + 0x40]
	lduw	[%l7 + 0x2C],	%l0
	fcmpne16	%f8,	%f18,	%o0
	nop
	set	0x48, %l6
	lduh	[%l7 + %l6],	%g4
	sdiv	%i5,	0x18E2,	%i3
	movgu	%xcc,	%i1,	%g1
	sllx	%l2,	0x1B,	%o3
	andncc	%l6,	%i7,	%l1
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%f12
	orn	%o2,	%i0,	%g7
	fsrc1s	%f22,	%f17
	movvs	%icc,	%o4,	%o6
	ldd	[%l7 + 0x68],	%g2
	fmovrsgez	%o5,	%f30,	%f18
	mova	%xcc,	%l5,	%i2
	srax	%o7,	%g6,	%i6
	array8	%i4,	%g5,	%o1
	edge8n	%l4,	%l3,	%l0
	movne	%icc,	%o0,	%g4
	umulcc	%g2,	%i5,	%i1
	and	%g1,	%l2,	%i3
	edge8	%l6,	%o3,	%l1
	fnegs	%f28,	%f13
	faligndata	%f14,	%f30,	%f16
	movl	%xcc,	%i7,	%o2
	movle	%icc,	%i0,	%o4
	srax	%o6,	%g7,	%o5
	ldsb	[%l7 + 0x7B],	%g3
	edge16	%i2,	%l5,	%g6
	sllx	%i6,	%o7,	%i4
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	srlx	%l3,	%g5,	%o0
	edge16n	%l0,	%g2,	%g4
	edge16l	%i5,	%i1,	%g1
	std	%f28,	[%l7 + 0x08]
	alignaddr	%i3,	%l6,	%l2
	ldsb	[%l7 + 0x69],	%o3
	lduh	[%l7 + 0x2C],	%i7
	sllx	%l1,	%i0,	%o2
	movrgez	%o4,	0x08E,	%o6
	edge32ln	%g7,	%o5,	%g3
	fands	%f29,	%f24,	%f15
	umulcc	%i2,	0x16BC,	%g6
	fmul8sux16	%f20,	%f26,	%f10
	st	%f23,	[%l7 + 0x1C]
	array16	%i6,	%l5,	%i4
	edge16ln	%o1,	%o7,	%l3
	ldx	[%l7 + 0x38],	%g5
	srax	%l4,	0x0E,	%o0
	fnegs	%f2,	%f2
	edge8ln	%l0,	%g2,	%g4
	fmovsleu	%xcc,	%f14,	%f1
	sllx	%i1,	%i5,	%i3
	edge16n	%g1,	%l6,	%l2
	fnegd	%f8,	%f0
	movrne	%o3,	%i7,	%l1
	orncc	%o2,	%i0,	%o4
	stx	%o6,	[%l7 + 0x48]
	andn	%g7,	0x1195,	%o5
	stw	%g3,	[%l7 + 0x34]
	fmovdn	%xcc,	%f11,	%f7
	edge32ln	%i2,	%i6,	%l5
	fmovsg	%xcc,	%f28,	%f9
	sllx	%i4,	%o1,	%o7
	std	%f2,	[%l7 + 0x70]
	ldd	[%l7 + 0x58],	%f6
	smulcc	%l3,	0x08FC,	%g6
	edge8n	%g5,	%l4,	%l0
	lduh	[%l7 + 0x18],	%g2
	subcc	%o0,	0x175D,	%g4
	fmovse	%icc,	%f30,	%f18
	ldub	[%l7 + 0x2E],	%i5
	edge32l	%i3,	%i1,	%l6
	fmuld8ulx16	%f21,	%f10,	%f10
	popc	0x1E56,	%g1
	edge16ln	%l2,	%i7,	%o3
	edge16ln	%l1,	%i0,	%o2
	fnot2	%f0,	%f18
	andn	%o4,	0x0A47,	%o6
	lduh	[%l7 + 0x56],	%o5
	movvc	%xcc,	%g7,	%g3
	stw	%i2,	[%l7 + 0x2C]
	movrne	%l5,	%i4,	%i6
	sub	%o1,	%l3,	%o7
	andcc	%g6,	%l4,	%g5
	udiv	%g2,	0x03D0,	%l0
	fmuld8ulx16	%f19,	%f5,	%f20
	movleu	%xcc,	%o0,	%g4
	movcs	%icc,	%i3,	%i5
	popc	0x0613,	%i1
	umul	%l6,	%l2,	%g1
	move	%xcc,	%o3,	%l1
	mova	%xcc,	%i7,	%i0
	movvs	%xcc,	%o4,	%o2
	movneg	%icc,	%o6,	%g7
	movpos	%icc,	%g3,	%i2
	xnor	%o5,	%i4,	%i6
	srl	%l5,	%o1,	%o7
	move	%icc,	%g6,	%l4
	pdist	%f16,	%f0,	%f0
	orcc	%l3,	0x1C9E,	%g2
	sll	%l0,	%o0,	%g5
	orncc	%g4,	%i3,	%i5
	movrgez	%l6,	0x1D3,	%l2
	edge16n	%i1,	%o3,	%l1
	movrlez	%g1,	0x183,	%i0
	fzero	%f4
	movgu	%xcc,	%i7,	%o2
	xorcc	%o6,	%g7,	%g3
	addc	%i2,	0x0507,	%o4
	smul	%o5,	%i6,	%i4
	ldsw	[%l7 + 0x2C],	%l5
	srlx	%o7,	0x0F,	%g6
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%l4
	fxor	%f8,	%f14,	%f24
	edge32ln	%l3,	%g2,	%o1
	ldsw	[%l7 + 0x0C],	%l0
	movrlz	%o0,	0x14D,	%g4
	umul	%g5,	0x0007,	%i5
	nop
	set	0x54, %o3
	ldsw	[%l7 + %o3],	%i3
	orncc	%l2,	0x1DAA,	%i1
	smulcc	%l6,	%l1,	%o3
	ldsh	[%l7 + 0x2E],	%g1
	srax	%i7,	%i0,	%o6
	movrgez	%o2,	0x3A4,	%g3
	srl	%g7,	0x1E,	%o4
	fzero	%f22
	sth	%i2,	[%l7 + 0x3E]
	restore %o5, %i4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o7,	%g6,	%l4
	fmovsge	%xcc,	%f26,	%f24
	movrgez	%l5,	0x3A6,	%g2
	fmovsvc	%icc,	%f15,	%f26
	or	%o1,	0x0D97,	%l3
	lduh	[%l7 + 0x28],	%o0
	fandnot1	%f16,	%f30,	%f2
	std	%f16,	[%l7 + 0x38]
	fmovdg	%xcc,	%f29,	%f17
	array8	%l0,	%g4,	%g5
	movn	%icc,	%i5,	%i3
	edge16n	%l2,	%l6,	%i1
	ldd	[%l7 + 0x70],	%f18
	movrgez	%l1,	0x2B3,	%g1
	fmovdne	%icc,	%f22,	%f4
	mulx	%i7,	0x1FC4,	%o3
	edge8n	%o6,	%o2,	%i0
	fmovdle	%icc,	%f16,	%f29
	edge8l	%g3,	%o4,	%i2
	umulcc	%o5,	%i4,	%i6
	edge16ln	%o7,	%g7,	%l4
	save %g6, %g2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x60],	%l3
	fxnor	%f16,	%f22,	%f12
	movneg	%icc,	%o0,	%l0
	popc	%l5,	%g5
	movvs	%icc,	%g4,	%i3
	edge32n	%i5,	%l6,	%i1
	ldd	[%l7 + 0x40],	%f8
	movleu	%xcc,	%l1,	%l2
	fexpand	%f20,	%f28
	xor	%g1,	%o3,	%o6
	andncc	%o2,	%i7,	%i0
	edge32ln	%g3,	%o4,	%i2
	xnor	%o5,	%i4,	%i6
	movge	%icc,	%g7,	%l4
	srl	%o7,	0x11,	%g6
	add	%g2,	%o1,	%l3
	movrne	%l0,	%l5,	%o0
	fmovsgu	%xcc,	%f28,	%f7
	array8	%g4,	%i3,	%g5
	movne	%icc,	%l6,	%i5
	addccc	%l1,	0x10E6,	%l2
	movpos	%xcc,	%g1,	%o3
	subcc	%i1,	0x13E4,	%o2
	edge32	%i7,	%i0,	%g3
	std	%f24,	[%l7 + 0x10]
	fzero	%f22
	pdist	%f6,	%f16,	%f12
	fones	%f11
	fcmpeq16	%f26,	%f14,	%o4
	sir	0x1DCC
	fornot2	%f0,	%f24,	%f4
	andn	%o6,	0x0779,	%i2
	umulcc	%o5,	0x1415,	%i6
	fmovscc	%icc,	%f0,	%f27
	fnands	%f21,	%f3,	%f20
	fnot2s	%f1,	%f25
	and	%g7,	%i4,	%l4
	movrlez	%o7,	%g2,	%o1
	fmovrdlez	%l3,	%f8,	%f12
	movre	%g6,	0x0B2,	%l0
	alignaddr	%o0,	%l5,	%g4
	fpack32	%f30,	%f10,	%f2
	edge16	%g5,	%l6,	%i3
	ldd	[%l7 + 0x30],	%f16
	movpos	%xcc,	%i5,	%l1
	movl	%xcc,	%l2,	%o3
	or	%g1,	0x06CC,	%i1
	orn	%o2,	%i7,	%i0
	xorcc	%g3,	0x13BB,	%o4
	ldd	[%l7 + 0x70],	%o6
	movrgz	%o5,	0x12A,	%i6
	sra	%i2,	%g7,	%l4
	stx	%o7,	[%l7 + 0x70]
	ldsb	[%l7 + 0x45],	%i4
	movcc	%xcc,	%o1,	%g2
	sth	%g6,	[%l7 + 0x5A]
	sdiv	%l3,	0x10DF,	%l0
	edge32	%o0,	%l5,	%g5
	fands	%f27,	%f0,	%f1
	sth	%l6,	[%l7 + 0x50]
	udiv	%g4,	0x0613,	%i5
	xorcc	%i3,	%l2,	%o3
	movrgez	%g1,	%i1,	%l1
	movcs	%icc,	%o2,	%i0
	mova	%icc,	%i7,	%o4
	alignaddr	%g3,	%o5,	%o6
	or	%i6,	%g7,	%l4
	movneg	%xcc,	%o7,	%i4
	movcs	%icc,	%o1,	%g2
	fcmpeq16	%f30,	%f2,	%g6
	xnor	%i2,	%l0,	%l3
	xnorcc	%o0,	%l5,	%g5
	udiv	%g4,	0x06B2,	%l6
	smul	%i5,	%l2,	%o3
	ldd	[%l7 + 0x28],	%g0
	std	%f14,	[%l7 + 0x18]
	xorcc	%i3,	0x0402,	%i1
	edge16ln	%o2,	%i0,	%i7
	addcc	%l1,	%o4,	%o5
	movle	%icc,	%g3,	%o6
	mulscc	%g7,	0x134F,	%i6
	mulscc	%o7,	%l4,	%o1
	andncc	%i4,	%g2,	%g6
	addcc	%i2,	%l0,	%o0
	ldsb	[%l7 + 0x0D],	%l3
	xor	%l5,	%g5,	%g4
	mulx	%i5,	%l2,	%o3
	fmovsg	%icc,	%f2,	%f2
	add	%l6,	%i3,	%g1
	andn	%o2,	0x12AF,	%i1
	movn	%xcc,	%i0,	%i7
	movne	%xcc,	%o4,	%l1
	ldd	[%l7 + 0x60],	%g2
	orcc	%o6,	%o5,	%i6
	edge16ln	%o7,	%g7,	%o1
	udivcc	%i4,	0x1D09,	%g2
	mulx	%l4,	0x0FD4,	%i2
	addcc	%l0,	0x1954,	%g6
	mulx	%o0,	%l5,	%l3
	and	%g4,	%i5,	%l2
	fmovdleu	%icc,	%f23,	%f11
	fmovrsgz	%o3,	%f20,	%f2
	or	%l6,	%i3,	%g5
	fandnot1	%f6,	%f20,	%f24
	sllx	%g1,	0x12,	%i1
	fpadd16	%f16,	%f12,	%f24
	sdiv	%o2,	0x092E,	%i0
	stw	%i7,	[%l7 + 0x48]
	fmovsa	%xcc,	%f13,	%f2
	fcmpne16	%f30,	%f22,	%l1
	orn	%o4,	%g3,	%o6
	ldsb	[%l7 + 0x33],	%i6
	fmovrse	%o7,	%f15,	%f25
	st	%f21,	[%l7 + 0x14]
	ldsw	[%l7 + 0x40],	%g7
	fmovsvs	%xcc,	%f22,	%f17
	edge16	%o5,	%o1,	%i4
	sllx	%l4,	0x0D,	%g2
	fabsd	%f30,	%f4
	andn	%i2,	%l0,	%g6
	fxors	%f6,	%f15,	%f19
	movne	%xcc,	%l5,	%l3
	alignaddrl	%g4,	%i5,	%l2
	edge32n	%o0,	%o3,	%l6
	fors	%f3,	%f13,	%f15
	subcc	%g5,	%i3,	%g1
	add	%i1,	0x13CB,	%o2
	edge32l	%i7,	%l1,	%o4
	faligndata	%f8,	%f24,	%f26
	smulcc	%i0,	%o6,	%g3
	fnot2s	%f14,	%f5
	array32	%o7,	%g7,	%o5
	fabss	%f30,	%f26
	subccc	%i6,	%o1,	%i4
	edge8l	%g2,	%l4,	%l0
	xor	%i2,	0x0113,	%g6
	ldd	[%l7 + 0x78],	%f12
	edge32n	%l3,	%g4,	%i5
	stw	%l5,	[%l7 + 0x14]
	fmovdpos	%icc,	%f15,	%f25
	edge8n	%o0,	%l2,	%o3
	sdivcc	%l6,	0x0A97,	%i3
	sir	0x02B1
	sra	%g1,	%g5,	%i1
	fmovdne	%icc,	%f22,	%f30
	fornot2s	%f7,	%f6,	%f18
	udiv	%i7,	0x12C2,	%l1
	fmovsneg	%icc,	%f13,	%f30
	movg	%xcc,	%o4,	%i0
	stx	%o2,	[%l7 + 0x68]
	subccc	%g3,	0x0B78,	%o7
	fmovrse	%o6,	%f10,	%f10
	sethi	0x0F01,	%g7
	array16	%o5,	%o1,	%i6
	sdiv	%i4,	0x1F8E,	%l4
	fmul8x16	%f2,	%f14,	%f24
	array8	%l0,	%i2,	%g2
	fmovsle	%icc,	%f25,	%f8
	fnot2s	%f18,	%f1
	fmovscc	%icc,	%f13,	%f30
	fxnors	%f20,	%f8,	%f17
	orcc	%g6,	%l3,	%i5
	xorcc	%l5,	%o0,	%g4
	movrlz	%o3,	%l2,	%l6
	movg	%icc,	%g1,	%g5
	movrne	%i1,	%i7,	%i3
	fnot2	%f28,	%f2
	edge16l	%l1,	%i0,	%o4
	smulcc	%o2,	%g3,	%o6
	array8	%o7,	%g7,	%o1
	andn	%o5,	%i6,	%l4
	lduw	[%l7 + 0x54],	%l0
	fmuld8sux16	%f19,	%f1,	%f6
	and	%i4,	0x1F61,	%i2
	alignaddr	%g6,	%l3,	%i5
	nop
	set	0x10, %g6
	ldd	[%l7 + %g6],	%f24
	umulcc	%g2,	0x1900,	%o0
	orn	%l5,	%g4,	%l2
	sir	0x0468
	movcc	%icc,	%o3,	%g1
	fornot1s	%f28,	%f9,	%f18
	movcs	%xcc,	%l6,	%g5
	or	%i7,	0x120D,	%i3
	movcc	%icc,	%l1,	%i0
	srl	%o4,	%i1,	%o2
	fmovrdlez	%g3,	%f24,	%f24
	movrlz	%o6,	0x175,	%o7
	srl	%o1,	0x0B,	%o5
	array32	%g7,	%l4,	%i6
	orcc	%i4,	%i2,	%g6
	alignaddrl	%l0,	%l3,	%g2
	save %o0, %i5, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g4,	0x04,	%o3
	xnor	%g1,	0x1877,	%l6
	fandnot1s	%f31,	%f18,	%f15
	movcs	%icc,	%l2,	%g5
	alignaddrl	%i3,	%l1,	%i0
	addcc	%o4,	%i1,	%o2
	sdivcc	%g3,	0x172D,	%i7
	orn	%o6,	%o1,	%o7
	andncc	%o5,	%g7,	%i6
	movrgez	%i4,	0x2DE,	%i2
	orcc	%g6,	%l4,	%l3
	fpsub32	%f28,	%f30,	%f10
	ldsb	[%l7 + 0x10],	%l0
	fmovdcs	%icc,	%f27,	%f3
	fmovscc	%xcc,	%f24,	%f22
	sdivx	%g2,	0x1751,	%o0
	movl	%icc,	%l5,	%i5
	stw	%o3,	[%l7 + 0x70]
	edge8ln	%g4,	%g1,	%l2
	movl	%icc,	%l6,	%i3
	lduh	[%l7 + 0x64],	%g5
	subcc	%l1,	%o4,	%i0
	andn	%i1,	%o2,	%i7
	alignaddrl	%g3,	%o6,	%o1
	xorcc	%o7,	%o5,	%i6
	movle	%icc,	%i4,	%g7
	fmovs	%f30,	%f19
	edge8n	%g6,	%l4,	%l3
	fnot2	%f8,	%f0
	fnands	%f22,	%f23,	%f18
	edge8n	%i2,	%l0,	%g2
	movvs	%icc,	%o0,	%l5
	udivcc	%o3,	0x0805,	%g4
	fornot2s	%f4,	%f18,	%f23
	sethi	0x15F0,	%i5
	fandnot2	%f16,	%f2,	%f12
	fmovdn	%icc,	%f28,	%f19
	movrgez	%l2,	%g1,	%i3
	movre	%g5,	0x137,	%l6
	sdivcc	%o4,	0x0FF4,	%l1
	movrlz	%i0,	0x230,	%i1
	lduh	[%l7 + 0x16],	%i7
	fmovrse	%g3,	%f8,	%f28
	fmovsge	%icc,	%f0,	%f22
	fpadd16s	%f1,	%f4,	%f6
	fmovdge	%xcc,	%f25,	%f4
	std	%f26,	[%l7 + 0x48]
	fornot2s	%f27,	%f10,	%f26
	movneg	%xcc,	%o2,	%o1
	movn	%icc,	%o7,	%o5
	movn	%xcc,	%o6,	%i4
	and	%g7,	%i6,	%g6
	ldub	[%l7 + 0x6F],	%l3
	fmovdneg	%icc,	%f28,	%f6
	orncc	%i2,	%l0,	%l4
	fmul8x16	%f25,	%f12,	%f4
	stx	%g2,	[%l7 + 0x28]
	st	%f13,	[%l7 + 0x44]
	xnor	%o0,	%o3,	%g4
	smulcc	%l5,	0x0AF4,	%l2
	movvc	%icc,	%g1,	%i3
	save %g5, %l6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l1,	%o4,	%i0
	fabsd	%f22,	%f28
	umulcc	%i7,	0x1302,	%i1
	ldsb	[%l7 + 0x6A],	%o2
	movcc	%xcc,	%g3,	%o1
	movleu	%xcc,	%o5,	%o6
	movge	%icc,	%i4,	%o7
	sdivx	%g7,	0x0541,	%g6
	fmovscs	%icc,	%f25,	%f17
	subcc	%l3,	%i6,	%i2
	edge16	%l0,	%l4,	%o0
	sra	%g2,	%g4,	%l5
	sdivcc	%l2,	0x1107,	%o3
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	srlx	%g5,	%i5,	%l1
	movneg	%icc,	%o4,	%i7
	andncc	%i0,	%i1,	%g3
	umul	%o1,	%o5,	%o2
	fmovdg	%icc,	%f19,	%f27
	udivcc	%o6,	0x0DA2,	%o7
	srlx	%i4,	0x17,	%g6
	fornot2s	%f17,	%f10,	%f17
	fmovrdgez	%l3,	%f10,	%f8
	orncc	%g7,	0x0CE9,	%i2
	alignaddrl	%l0,	%l4,	%i6
	subc	%o0,	%g4,	%l5
	movcc	%xcc,	%g2,	%o3
	edge32n	%i3,	%l2,	%l6
	andn	%g5,	%g1,	%l1
	fmovdl	%icc,	%f19,	%f15
	ldd	[%l7 + 0x30],	%f24
	andncc	%i5,	%i7,	%o4
	edge8l	%i0,	%g3,	%o1
	sra	%i1,	0x10,	%o2
	xnorcc	%o5,	0x1767,	%o7
	move	%icc,	%i4,	%g6
	udivx	%l3,	0x1278,	%o6
	movrgz	%g7,	%l0,	%l4
	edge16l	%i2,	%i6,	%g4
	movg	%xcc,	%l5,	%o0
	srl	%g2,	0x0C,	%o3
	alignaddrl	%i3,	%l2,	%g5
	sth	%l6,	[%l7 + 0x0E]
	edge8ln	%g1,	%l1,	%i5
	edge16	%i7,	%i0,	%g3
	movne	%xcc,	%o4,	%i1
	edge32l	%o2,	%o5,	%o1
	edge8ln	%o7,	%i4,	%l3
	stx	%o6,	[%l7 + 0x40]
	addc	%g7,	%g6,	%l0
	movvs	%icc,	%l4,	%i6
	edge32ln	%g4,	%l5,	%i2
	udivcc	%g2,	0x01D6,	%o0
	fmuld8ulx16	%f20,	%f11,	%f16
	ldsw	[%l7 + 0x1C],	%i3
	fexpand	%f27,	%f12
	fmovsvs	%icc,	%f8,	%f23
	fnands	%f13,	%f26,	%f1
	alignaddrl	%o3,	%l2,	%l6
	xnor	%g1,	0x03DA,	%l1
	subc	%g5,	0x165B,	%i7
	sir	0x0609
	edge16	%i0,	%g3,	%o4
	fpadd32s	%f24,	%f25,	%f26
	fmovdl	%xcc,	%f12,	%f10
	popc	0x166C,	%i5
	fmovdvs	%icc,	%f15,	%f22
	addccc	%o2,	%o5,	%i1
	subc	%o7,	%o1,	%l3
	subc	%o6,	%i4,	%g6
	srl	%l0,	%g7,	%l4
	nop
	set	0x20, %i5
	ldd	[%l7 + %i5],	%i6
	edge16l	%g4,	%l5,	%g2
	fpsub16s	%f24,	%f26,	%f28
	ldd	[%l7 + 0x38],	%f24
	andcc	%i2,	0x13DF,	%o0
	movrlez	%i3,	0x1E4,	%o3
	std	%f6,	[%l7 + 0x40]
	edge16n	%l2,	%l6,	%l1
	fcmpne16	%f0,	%f20,	%g1
	movle	%icc,	%i7,	%i0
	movvc	%xcc,	%g3,	%o4
	fand	%f16,	%f22,	%f0
	edge8l	%i5,	%g5,	%o5
	mulscc	%o2,	0x02A6,	%i1
	edge8ln	%o1,	%o7,	%o6
	movpos	%icc,	%l3,	%i4
	orncc	%g6,	0x1891,	%g7
	movvc	%icc,	%l0,	%l4
	stw	%g4,	[%l7 + 0x38]
	smulcc	%i6,	0x1A72,	%g2
	movvc	%xcc,	%l5,	%o0
	ldx	[%l7 + 0x30],	%i2
	nop
	set	0x5C, %o5
	ldsw	[%l7 + %o5],	%i3
	fmovdvc	%icc,	%f4,	%f29
	ldsb	[%l7 + 0x39],	%l2
	movne	%xcc,	%l6,	%l1
	movne	%xcc,	%o3,	%g1
	edge32l	%i7,	%g3,	%o4
	movle	%xcc,	%i0,	%i5
	edge8n	%g5,	%o2,	%i1
	lduh	[%l7 + 0x0E],	%o5
	nop
	set	0x16, %o1
	ldsh	[%l7 + %o1],	%o1
	fmovsneg	%xcc,	%f26,	%f8
	lduw	[%l7 + 0x3C],	%o7
	edge32	%l3,	%i4,	%o6
	fnors	%f30,	%f24,	%f26
	ldub	[%l7 + 0x31],	%g6
	ldx	[%l7 + 0x08],	%g7
	movrgz	%l4,	%g4,	%i6
	alignaddrl	%g2,	%l5,	%l0
	sra	%i2,	%i3,	%l2
	stw	%l6,	[%l7 + 0x50]
	xor	%o0,	%o3,	%l1
	fone	%f8
	fmovsge	%xcc,	%f16,	%f24
	addccc	%i7,	%g3,	%o4
	array8	%g1,	%i0,	%g5
	fxnor	%f6,	%f18,	%f20
	fmovdle	%icc,	%f30,	%f26
	fnor	%f16,	%f8,	%f20
	fmovdl	%xcc,	%f2,	%f5
	sdivcc	%i5,	0x115B,	%o2
	or	%o5,	%i1,	%o1
	or	%l3,	0x1845,	%i4
	fpackfix	%f20,	%f16
	sth	%o6,	[%l7 + 0x7E]
	array32	%g6,	%g7,	%o7
	movcs	%icc,	%l4,	%i6
	fxors	%f15,	%f13,	%f27
	fone	%f16
	fmovda	%xcc,	%f27,	%f21
	movl	%xcc,	%g4,	%l5
	fnot1	%f16,	%f14
	movrlz	%g2,	0x00A,	%l0
	fcmpeq32	%f2,	%f28,	%i2
	edge32ln	%l2,	%i3,	%o0
	fmovscs	%xcc,	%f23,	%f15
	umul	%l6,	%l1,	%i7
	fpsub16s	%f30,	%f10,	%f12
	alignaddrl	%g3,	%o4,	%g1
	edge16	%o3,	%i0,	%g5
	mulx	%i5,	0x1E5E,	%o2
	restore %o5, %i1, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l3,	%o6,	%g6
	sra	%i4,	0x1E,	%o7
	ldsw	[%l7 + 0x44],	%l4
	udiv	%i6,	0x0855,	%g7
	fmul8sux16	%f30,	%f14,	%f4
	udiv	%g4,	0x016B,	%g2
	sdivcc	%l0,	0x128D,	%l5
	mulscc	%l2,	0x1C1E,	%i3
	fmul8x16al	%f19,	%f19,	%f10
	fcmped	%fcc3,	%f6,	%f18
	udiv	%i2,	0x14C6,	%o0
	umulcc	%l1,	0x1BF5,	%l6
	subccc	%g3,	0x1D92,	%i7
	array32	%o4,	%o3,	%g1
	addcc	%g5,	%i5,	%i0
	fmovrdgez	%o2,	%f10,	%f4
	subc	%i1,	0x1543,	%o5
	movrgez	%l3,	%o1,	%g6
	save %i4, 0x103E, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l4,	%i6,	%o6
	nop
	set	0x18, %l5
	ldx	[%l7 + %l5],	%g7
	ldd	[%l7 + 0x50],	%g2
	ldsh	[%l7 + 0x6C],	%l0
	fcmpgt32	%f30,	%f24,	%g4
	movpos	%xcc,	%l5,	%i3
	udiv	%l2,	0x1AB8,	%o0
	fabsd	%f24,	%f26
	subc	%i2,	0x0E2F,	%l1
	mulx	%g3,	0x1B4F,	%i7
	movrlz	%l6,	%o4,	%g1
	addccc	%g5,	0x1ECE,	%o3
	stw	%i5,	[%l7 + 0x24]
	movleu	%xcc,	%o2,	%i1
	movrne	%i0,	%o5,	%o1
	ld	[%l7 + 0x3C],	%f15
	fcmpeq16	%f10,	%f8,	%l3
	mulx	%g6,	%i4,	%o7
	srl	%l4,	%o6,	%g7
	sdivx	%i6,	0x1986,	%g2
	save %g4, %l5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f26,	%f12,	%f6
	popc	0x0304,	%l2
	fmovsg	%xcc,	%f27,	%f3
	edge8	%l0,	%i2,	%l1
	ldsb	[%l7 + 0x72],	%o0
	movleu	%icc,	%i7,	%l6
	subccc	%g3,	0x1AD6,	%o4
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	fpack32	%f20,	%f28,	%f8
	orncc	%o3,	0x121D,	%o2
	movrne	%i5,	0x196,	%i0
	sll	%i1,	%o5,	%o1
	movleu	%icc,	%g6,	%i4
	movpos	%xcc,	%o7,	%l3
	faligndata	%f0,	%f30,	%f0
	array16	%l4,	%g7,	%i6
	edge32n	%o6,	%g4,	%l5
	ldsw	[%l7 + 0x60],	%g2
	mulx	%i3,	%l2,	%l0
	fmovrdlz	%l1,	%f26,	%f22
	fandnot1	%f24,	%f26,	%f20
	alignaddrl	%i2,	%i7,	%l6
	movvc	%xcc,	%g3,	%o0
	orcc	%o4,	0x0D16,	%g1
	fmovsle	%xcc,	%f17,	%f13
	lduw	[%l7 + 0x28],	%o3
	fnors	%f21,	%f12,	%f26
	movneg	%icc,	%g5,	%i5
	andncc	%o2,	%i0,	%o5
	nop
	set	0x15, %i2
	ldsb	[%l7 + %i2],	%o1
	ldsb	[%l7 + 0x5F],	%g6
	ldd	[%l7 + 0x60],	%i4
	fcmpeq32	%f12,	%f16,	%i1
	movvs	%xcc,	%o7,	%l3
	array8	%g7,	%l4,	%o6
	srlx	%i6,	0x08,	%l5
	fcmpne16	%f10,	%f30,	%g4
	ldd	[%l7 + 0x38],	%i2
	nop
	set	0x28, %i4
	std	%f6,	[%l7 + %i4]
	movrgz	%g2,	0x20A,	%l0
	edge8l	%l1,	%i2,	%l2
	nop
	set	0x58, %g7
	ldsh	[%l7 + %g7],	%l6
	edge8	%g3,	%i7,	%o0
	sdivx	%g1,	0x067E,	%o4
	xor	%g5,	%i5,	%o3
	fmovdvc	%xcc,	%f24,	%f8
	andcc	%o2,	%i0,	%o1
	add	%o5,	%g6,	%i1
	xorcc	%i4,	0x02E1,	%l3
	fmovsg	%icc,	%f5,	%f12
	stb	%g7,	[%l7 + 0x31]
	udivcc	%o7,	0x0D30,	%l4
	addc	%o6,	0x1A2A,	%i6
	fsrc2	%f20,	%f18
	movn	%icc,	%g4,	%i3
	fmuld8ulx16	%f16,	%f27,	%f8
	fmovrsgez	%l5,	%f23,	%f21
	fcmpeq16	%f10,	%f0,	%l0
	orncc	%g2,	%i2,	%l2
	xor	%l1,	0x1811,	%g3
	sir	0x1764
	subccc	%i7,	0x0ED8,	%o0
	addccc	%g1,	%o4,	%l6
	subcc	%g5,	%o3,	%o2
	lduh	[%l7 + 0x2E],	%i0
	std	%f28,	[%l7 + 0x58]
	fmovsl	%icc,	%f11,	%f17
	array32	%o1,	%o5,	%g6
	movgu	%xcc,	%i5,	%i1
	edge32	%i4,	%l3,	%g7
	and	%l4,	%o7,	%i6
	ldx	[%l7 + 0x68],	%o6
	stw	%g4,	[%l7 + 0x5C]
	edge8n	%l5,	%l0,	%i3
	movg	%xcc,	%g2,	%i2
	fnegs	%f1,	%f24
	fmovdvs	%icc,	%f3,	%f13
	movvc	%xcc,	%l1,	%g3
	movrne	%i7,	0x0A8,	%l2
	udivcc	%o0,	0x0F4B,	%o4
	sth	%g1,	[%l7 + 0x0E]
	fpadd32s	%f21,	%f17,	%f1
	fcmped	%fcc0,	%f10,	%f8
	movgu	%icc,	%g5,	%l6
	stx	%o2,	[%l7 + 0x68]
	fmovsg	%xcc,	%f13,	%f11
	srl	%i0,	0x13,	%o1
	movpos	%xcc,	%o5,	%o3
	umul	%i5,	%g6,	%i1
	xnor	%i4,	0x16F7,	%g7
	fmovrse	%l4,	%f2,	%f26
	mulscc	%l3,	0x0895,	%i6
	fmovsvc	%xcc,	%f1,	%f29
	orncc	%o6,	%o7,	%l5
	ldd	[%l7 + 0x20],	%g4
	movl	%xcc,	%i3,	%g2
	movrlz	%i2,	%l0,	%g3
	movvs	%xcc,	%i7,	%l1
	array16	%o0,	%l2,	%o4
	andn	%g5,	%l6,	%o2
	sth	%i0,	[%l7 + 0x4E]
	mulscc	%g1,	0x1AFC,	%o1
	movcc	%xcc,	%o5,	%i5
	edge8ln	%o3,	%i1,	%i4
	movgu	%xcc,	%g7,	%l4
	xorcc	%g6,	%l3,	%i6
	sra	%o7,	0x09,	%l5
	st	%f31,	[%l7 + 0x54]
	add	%o6,	0x1516,	%i3
	smul	%g2,	0x05A1,	%g4
	movvs	%xcc,	%l0,	%i2
	fmovrslz	%g3,	%f4,	%f28
	movrgez	%l1,	0x158,	%o0
	orn	%l2,	%i7,	%g5
	ldsw	[%l7 + 0x50],	%l6
	fnot1s	%f17,	%f14
	subccc	%o2,	0x0AE0,	%i0
	movgu	%icc,	%g1,	%o4
	edge16	%o5,	%i5,	%o1
	fnands	%f0,	%f10,	%f12
	subcc	%o3,	0x0B40,	%i1
	subc	%i4,	%g7,	%g6
	stx	%l3,	[%l7 + 0x08]
	edge8n	%l4,	%i6,	%l5
	alignaddr	%o6,	%i3,	%o7
	ldsw	[%l7 + 0x7C],	%g2
	alignaddr	%g4,	%l0,	%g3
	nop
	set	0x12, %o2
	lduh	[%l7 + %o2],	%l1
	edge16l	%i2,	%l2,	%o0
	movle	%icc,	%i7,	%l6
	restore %g5, %o2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g1,	%o5
	sll	%o4,	%i5,	%o1
	ldub	[%l7 + 0x39],	%i1
	ldsh	[%l7 + 0x72],	%o3
	sub	%i4,	0x1AF4,	%g6
	subc	%l3,	0x0F4A,	%g7
	movrgz	%i6,	0x063,	%l5
	array8	%l4,	%i3,	%o7
	orn	%g2,	%g4,	%o6
	ldd	[%l7 + 0x20],	%l0
	fmovs	%f19,	%f25
	ldd	[%l7 + 0x58],	%f2
	movrlez	%g3,	0x1E4,	%l1
	movleu	%icc,	%l2,	%o0
	fnegs	%f16,	%f5
	popc	%i7,	%i2
	fmovsl	%icc,	%f26,	%f5
	sdivx	%g5,	0x1950,	%l6
	fnor	%f18,	%f28,	%f0
	save %o2, 0x002E, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g1,	%o5,	%i5
	movpos	%xcc,	%o4,	%i1
	sra	%o3,	%o1,	%g6
	popc	0x176A,	%i4
	fmovsle	%xcc,	%f21,	%f26
	udivcc	%l3,	0x1FF3,	%g7
	and	%l5,	%l4,	%i3
	movgu	%icc,	%o7,	%i6
	sth	%g2,	[%l7 + 0x4E]
	movrne	%o6,	0x004,	%l0
	edge32	%g4,	%l1,	%g3
	edge16n	%o0,	%i7,	%l2
	sth	%i2,	[%l7 + 0x2A]
	edge32	%l6,	%g5,	%o2
	fcmpes	%fcc2,	%f16,	%f5
	sllx	%i0,	0x17,	%o5
	sra	%i5,	0x1B,	%o4
	edge8l	%g1,	%o3,	%o1
	addcc	%g6,	%i4,	%l3
	orn	%i1,	%l5,	%l4
	sdiv	%g7,	0x1C88,	%i3
	fmuld8sux16	%f17,	%f29,	%f18
	sethi	0x1363,	%i6
	movvs	%xcc,	%o7,	%g2
	movge	%icc,	%o6,	%l0
	alignaddrl	%g4,	%g3,	%l1
	array16	%o0,	%i7,	%i2
	movrne	%l6,	0x1CD,	%g5
	movpos	%icc,	%o2,	%i0
	fnot1	%f28,	%f8
	srl	%o5,	0x15,	%i5
	fors	%f30,	%f13,	%f31
	andncc	%l2,	%g1,	%o4
	popc	%o1,	%o3
	edge16	%g6,	%i4,	%i1
	sub	%l5,	0x1F71,	%l4
	fpsub32	%f16,	%f2,	%f12
	edge8l	%g7,	%l3,	%i6
	move	%icc,	%i3,	%o7
	sth	%o6,	[%l7 + 0x16]
	mova	%xcc,	%g2,	%l0
	subc	%g3,	0x1932,	%l1
	andcc	%g4,	0x180A,	%o0
	add	%i7,	0x0953,	%l6
	fpsub16s	%f1,	%f6,	%f19
	fmovsne	%xcc,	%f4,	%f13
	fands	%f31,	%f9,	%f2
	fmovrslez	%i2,	%f25,	%f3
	addccc	%o2,	0x033C,	%i0
	sdivx	%o5,	0x13AB,	%g5
	movneg	%xcc,	%i5,	%g1
	subc	%l2,	%o4,	%o1
	mulx	%o3,	%i4,	%g6
	ldx	[%l7 + 0x58],	%i1
	edge8ln	%l5,	%l4,	%g7
	ldub	[%l7 + 0x0F],	%i6
	mulx	%i3,	%o7,	%l3
	xorcc	%g2,	%o6,	%g3
	addc	%l1,	0x0EF9,	%g4
	addcc	%o0,	0x0C5B,	%i7
	movrgz	%l0,	0x05F,	%l6
	movrgez	%o2,	0x156,	%i2
	orcc	%i0,	0x08E9,	%o5
	for	%f22,	%f14,	%f28
	xor	%g5,	0x1E6A,	%i5
	movvc	%icc,	%l2,	%g1
	addccc	%o4,	0x0E10,	%o1
	ldx	[%l7 + 0x60],	%i4
	umulcc	%o3,	0x020A,	%i1
	andn	%g6,	0x1E01,	%l5
	umul	%g7,	0x1A24,	%l4
	srlx	%i3,	%o7,	%i6
	fpmerge	%f1,	%f13,	%f12
	sub	%l3,	0x03BA,	%g2
	movrne	%o6,	0x26F,	%g3
	edge8	%l1,	%g4,	%o0
	ld	[%l7 + 0x0C],	%f24
	orcc	%i7,	0x1485,	%l0
	addcc	%o2,	%l6,	%i0
	nop
	set	0x78, %g5
	ldx	[%l7 + %g5],	%i2
	movrlz	%g5,	%o5,	%i5
	st	%f22,	[%l7 + 0x30]
	sdivx	%g1,	0x16CF,	%l2
	fmovrdlez	%o4,	%f0,	%f6
	array32	%o1,	%i4,	%i1
	fmovdn	%icc,	%f9,	%f29
	stw	%g6,	[%l7 + 0x1C]
	movrlez	%o3,	0x189,	%g7
	xor	%l5,	%l4,	%o7
	ld	[%l7 + 0x7C],	%f31
	edge16ln	%i6,	%l3,	%g2
	subc	%i3,	%g3,	%o6
	smul	%g4,	0x0973,	%l1
	movge	%icc,	%o0,	%i7
	std	%f30,	[%l7 + 0x28]
	array32	%l0,	%o2,	%i0
	fmovdl	%icc,	%f31,	%f22
	xorcc	%l6,	0x06BD,	%i2
	array16	%o5,	%i5,	%g1
	lduw	[%l7 + 0x5C],	%l2
	fnegs	%f26,	%f10
	xor	%o4,	%g5,	%i4
	srlx	%i1,	%o1,	%g6
	movcc	%icc,	%g7,	%o3
	sra	%l4,	0x0E,	%l5
	fsrc1	%f22,	%f22
	std	%f8,	[%l7 + 0x58]
	movneg	%xcc,	%o7,	%i6
	subc	%l3,	0x1D98,	%i3
	fmovd	%f24,	%f10
	movrne	%g3,	%g2,	%g4
	fsrc1	%f8,	%f22
	fmovdgu	%icc,	%f21,	%f22
	movrlez	%o6,	%o0,	%l1
	fmovde	%xcc,	%f23,	%f18
	subc	%i7,	%o2,	%l0
	stw	%l6,	[%l7 + 0x08]
	sdiv	%i2,	0x1DC4,	%i0
	fmovde	%xcc,	%f19,	%f20
	sdivx	%o5,	0x1520,	%g1
	sll	%i5,	0x1B,	%l2
	add	%o4,	0x1723,	%g5
	or	%i1,	%o1,	%g6
	udivcc	%g7,	0x10B6,	%o3
	fnot2s	%f3,	%f5
	movge	%xcc,	%l4,	%i4
	smulcc	%o7,	%i6,	%l5
	movvc	%icc,	%i3,	%l3
	stw	%g2,	[%l7 + 0x0C]
	edge8	%g4,	%o6,	%o0
	srax	%g3,	0x1D,	%l1
	edge16ln	%i7,	%l0,	%o2
	fmovsgu	%icc,	%f28,	%f0
	addccc	%i2,	0x13E4,	%i0
	addcc	%o5,	0x093F,	%l6
	edge16ln	%i5,	%g1,	%o4
	sir	0x1CFD
	subc	%l2,	0x1F44,	%i1
	orn	%o1,	0x1AE5,	%g6
	std	%f10,	[%l7 + 0x18]
	sdiv	%g7,	0x192C,	%g5
	array32	%l4,	%i4,	%o3
	xorcc	%o7,	%i6,	%l5
	stb	%i3,	[%l7 + 0x1A]
	sra	%l3,	%g2,	%g4
	stx	%o0,	[%l7 + 0x30]
	fpadd32	%f22,	%f14,	%f20
	fnot2	%f8,	%f20
	alignaddr	%g3,	%o6,	%i7
	smul	%l0,	%o2,	%i2
	ldx	[%l7 + 0x10],	%i0
	fandnot2s	%f25,	%f7,	%f14
	edge32l	%l1,	%l6,	%i5
	andn	%g1,	0x1932,	%o4
	mova	%xcc,	%l2,	%o5
	sra	%o1,	%i1,	%g6
	fmovsn	%xcc,	%f9,	%f24
	edge8	%g7,	%g5,	%i4
	movpos	%xcc,	%o3,	%o7
	movneg	%icc,	%l4,	%l5
	sth	%i3,	[%l7 + 0x4E]
	move	%xcc,	%i6,	%l3
	movneg	%icc,	%g4,	%o0
	umul	%g3,	0x10A0,	%g2
	srlx	%i7,	0x10,	%o6
	movcs	%xcc,	%l0,	%i2
	fcmpeq32	%f12,	%f24,	%o2
	umul	%l1,	%i0,	%l6
	mova	%xcc,	%g1,	%i5
	umulcc	%l2,	0x0FA9,	%o4
	edge8n	%o5,	%i1,	%g6
	movneg	%icc,	%o1,	%g7
	sub	%i4,	%g5,	%o3
	fmovsvs	%icc,	%f26,	%f19
	edge8l	%l4,	%o7,	%i3
	srax	%l5,	%i6,	%l3
	ldsb	[%l7 + 0x22],	%g4
	andncc	%g3,	%o0,	%i7
	subccc	%o6,	0x092D,	%l0
	smul	%i2,	0x0B6C,	%g2
	movneg	%icc,	%l1,	%i0
	edge16	%l6,	%g1,	%o2
	fmovrse	%i5,	%f2,	%f15
	addcc	%l2,	0x0A5B,	%o4
	fandnot1	%f14,	%f16,	%f0
	movvc	%xcc,	%o5,	%g6
	alignaddr	%o1,	%g7,	%i4
	udivcc	%g5,	0x0B0D,	%o3
	srax	%i1,	0x1B,	%o7
	sth	%i3,	[%l7 + 0x24]
	movre	%l5,	0x348,	%i6
	ldsw	[%l7 + 0x54],	%l4
	edge8	%l3,	%g4,	%o0
	movrlz	%i7,	%o6,	%g3
	fmul8x16	%f16,	%f24,	%f4
	edge32	%l0,	%g2,	%i2
	fcmps	%fcc1,	%f0,	%f10
	move	%icc,	%l1,	%i0
	edge8	%g1,	%o2,	%l6
	edge32l	%l2,	%i5,	%o5
	umulcc	%g6,	%o1,	%g7
	edge16l	%o4,	%g5,	%o3
	movcc	%xcc,	%i4,	%i1
	fmul8sux16	%f14,	%f30,	%f4
	andncc	%i3,	%l5,	%o7
	fcmpes	%fcc2,	%f13,	%f17
	subccc	%l4,	%i6,	%g4
	edge32	%o0,	%i7,	%o6
	movrlz	%l3,	%g3,	%l0
	fsrc1s	%f25,	%f23
	sdivx	%i2,	0x0F20,	%g2
	subcc	%i0,	%l1,	%g1
	array16	%l6,	%o2,	%i5
	fnot2	%f30,	%f2
	add	%o5,	%l2,	%g6
	movvs	%xcc,	%g7,	%o1
	movrlz	%o4,	0x226,	%g5
	xnorcc	%o3,	0x1589,	%i4
	movneg	%icc,	%i1,	%i3
	sir	0x00F7
	fmovdvc	%xcc,	%f13,	%f18
	movpos	%icc,	%o7,	%l4
	srlx	%l5,	0x00,	%i6
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	fnand	%f2,	%f28,	%f14
	st	%f30,	[%l7 + 0x18]
	fmul8ulx16	%f30,	%f8,	%f20
	subcc	%o6,	%l3,	%l0
	movrne	%g3,	0x3D5,	%g2
	edge8n	%i2,	%l1,	%i0
	addcc	%l6,	0x1EA2,	%g1
	ldsw	[%l7 + 0x64],	%o2
	subcc	%i5,	%l2,	%o5
	edge16ln	%g6,	%g7,	%o1
	edge32ln	%o4,	%o3,	%i4
	mova	%xcc,	%i1,	%g5
	edge8ln	%i3,	%o7,	%l4
	fmovsne	%icc,	%f23,	%f3
	orcc	%i6,	0x098F,	%g4
	movrne	%l5,	0x06B,	%o0
	alignaddr	%i7,	%l3,	%o6
	sdivcc	%g3,	0x0777,	%g2
	edge32	%i2,	%l0,	%l1
	fmovsne	%icc,	%f19,	%f23
	fexpand	%f2,	%f28
	edge8ln	%l6,	%i0,	%g1
	fnot2s	%f20,	%f16
	movpos	%icc,	%i5,	%o2
	edge16l	%o5,	%g6,	%l2
	sdivx	%g7,	0x1DDD,	%o4
	xorcc	%o1,	%o3,	%i1
	stx	%g5,	[%l7 + 0x28]
	edge16ln	%i4,	%i3,	%o7
	xor	%l4,	0x1799,	%g4
	edge32l	%l5,	%i6,	%o0
	fmovdleu	%icc,	%f18,	%f14
	movre	%l3,	0x345,	%i7
	xnor	%g3,	0x0EDA,	%g2
	fmovsne	%icc,	%f14,	%f19
	movg	%xcc,	%o6,	%i2
	move	%icc,	%l0,	%l1
	fmul8x16al	%f19,	%f17,	%f28
	subcc	%l6,	%i0,	%i5
	umul	%g1,	%o2,	%g6
	ldub	[%l7 + 0x62],	%o5
	st	%f24,	[%l7 + 0x34]
	stb	%g7,	[%l7 + 0x17]
	andcc	%o4,	%o1,	%o3
	fandnot2s	%f2,	%f15,	%f24
	udivx	%i1,	0x1266,	%l2
	move	%xcc,	%i4,	%i3
	or	%o7,	0x1746,	%l4
	movrne	%g5,	0x155,	%l5
	stw	%i6,	[%l7 + 0x64]
	andn	%o0,	%l3,	%i7
	umulcc	%g3,	%g4,	%g2
	fmovdcc	%xcc,	%f1,	%f22
	ldx	[%l7 + 0x08],	%i2
	movvc	%xcc,	%o6,	%l1
	fmovrdlz	%l0,	%f10,	%f4
	fmovscc	%xcc,	%f18,	%f17
	edge32l	%l6,	%i0,	%g1
	std	%f22,	[%l7 + 0x28]
	fmovda	%xcc,	%f1,	%f31
	fxnor	%f18,	%f20,	%f18
	fpackfix	%f2,	%f14
	lduw	[%l7 + 0x14],	%i5
	edge32n	%o2,	%o5,	%g6
	stx	%g7,	[%l7 + 0x10]
	subccc	%o4,	0x0013,	%o1
	fnors	%f12,	%f10,	%f22
	save %i1, %l2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%i4,	%o7
	orcc	%l4,	%g5,	%i3
	ld	[%l7 + 0x54],	%f8
	movle	%xcc,	%l5,	%i6
	mova	%xcc,	%o0,	%l3
	fornot2	%f6,	%f16,	%f26
	edge32ln	%i7,	%g3,	%g4
	edge16ln	%g2,	%o6,	%l1
	movrlz	%l0,	%l6,	%i0
	fmovdcs	%icc,	%f12,	%f7
	mova	%icc,	%g1,	%i5
	movge	%icc,	%i2,	%o5
	restore %o2, %g7, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%xcc,	%f21,	%f0
	move	%icc,	%o1,	%i1
	ldsw	[%l7 + 0x2C],	%l2
	alignaddrl	%o4,	%o3,	%i4
	move	%xcc,	%l4,	%g5
	movl	%xcc,	%i3,	%o7
	mulx	%l5,	0x053E,	%o0
	fmovrdlz	%l3,	%f4,	%f18
	stw	%i6,	[%l7 + 0x28]
	edge32l	%g3,	%g4,	%g2
	edge16	%o6,	%i7,	%l0
	orn	%l6,	%i0,	%l1
	sra	%i5,	0x1B,	%g1
	udivcc	%i2,	0x014A,	%o2
	movrgez	%g7,	%o5,	%g6
	edge8	%o1,	%l2,	%o4
	edge32ln	%o3,	%i4,	%l4
	fmovdpos	%xcc,	%f15,	%f28
	movrlz	%g5,	%i3,	%o7
	smulcc	%i1,	0x1827,	%o0
	edge16	%l3,	%l5,	%g3
	ldsw	[%l7 + 0x58],	%i6
	fpack16	%f10,	%f26
	movle	%icc,	%g4,	%g2
	fmuld8sux16	%f3,	%f22,	%f24
	umulcc	%i7,	%l0,	%o6
	ld	[%l7 + 0x58],	%f9
	nop
	set	0x38, %i7
	ldsw	[%l7 + %i7],	%i0
	movge	%xcc,	%l6,	%i5
	sir	0x08CF
	movle	%icc,	%g1,	%i2
	sllx	%o2,	0x1C,	%g7
	andn	%o5,	0x02D9,	%g6
	lduw	[%l7 + 0x30],	%l1
	fmovs	%f14,	%f13
	andcc	%o1,	%o4,	%l2
	ldsh	[%l7 + 0x3A],	%i4
	movl	%icc,	%l4,	%g5
	srl	%o3,	0x05,	%o7
	movge	%icc,	%i3,	%o0
	edge8n	%i1,	%l5,	%l3
	edge8n	%i6,	%g3,	%g4
	xor	%i7,	%l0,	%g2
	fexpand	%f31,	%f16
	movge	%xcc,	%o6,	%i0
	addccc	%i5,	%l6,	%i2
	mulscc	%o2,	%g7,	%o5
	sethi	0x0368,	%g6
	umulcc	%l1,	%g1,	%o1
	fmovsne	%xcc,	%f23,	%f2
	edge16l	%o4,	%l2,	%l4
	fmovdne	%xcc,	%f14,	%f5
	edge32	%i4,	%o3,	%o7
	popc	%i3,	%o0
	fones	%f10
	mulscc	%g5,	%i1,	%l5
	fcmpne16	%f8,	%f18,	%l3
	fmul8x16	%f7,	%f22,	%f24
	movneg	%icc,	%i6,	%g4
	fmovdgu	%xcc,	%f17,	%f19
	andcc	%g3,	0x0DF9,	%l0
	fmovdl	%xcc,	%f26,	%f4
	movgu	%icc,	%i7,	%g2
	fmovspos	%xcc,	%f8,	%f31
	array32	%i0,	%i5,	%l6
	fmovde	%icc,	%f12,	%f12
	andncc	%o6,	%o2,	%i2
	st	%f16,	[%l7 + 0x64]
	ldub	[%l7 + 0x09],	%o5
	edge32l	%g7,	%g6,	%l1
	sethi	0x120C,	%o1
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	edge32n	%l4,	%l2,	%i4
	edge16	%o3,	%o7,	%o0
	mulscc	%i3,	%i1,	%l5
	edge8l	%l3,	%i6,	%g4
	edge32	%g5,	%l0,	%g3
	ldsw	[%l7 + 0x54],	%g2
	mova	%icc,	%i0,	%i7
	popc	0x1D2C,	%i5
	array16	%l6,	%o6,	%i2
	fcmpgt32	%f10,	%f28,	%o5
	movg	%icc,	%g7,	%g6
	srlx	%o2,	%o1,	%l1
	fone	%f10
	edge32n	%g1,	%o4,	%l4
	st	%f1,	[%l7 + 0x3C]
	sth	%l2,	[%l7 + 0x1E]
	xnor	%i4,	0x0884,	%o7
	fmovdl	%icc,	%f30,	%f31
	sdiv	%o3,	0x0672,	%i3
	edge8n	%o0,	%i1,	%l5
	subcc	%i6,	0x0F58,	%l3
	fmovsvs	%icc,	%f31,	%f31
	ldd	[%l7 + 0x68],	%f16
	movvs	%xcc,	%g4,	%l0
	xnorcc	%g5,	%g3,	%i0
	movrne	%g2,	0x23D,	%i7
	sdivx	%i5,	0x1CC8,	%o6
	mova	%xcc,	%l6,	%i2
	std	%f28,	[%l7 + 0x68]
	movrlez	%g7,	0x145,	%g6
	movrne	%o5,	0x298,	%o2
	srlx	%l1,	%g1,	%o4
	sra	%l4,	0x1C,	%o1
	move	%icc,	%l2,	%o7
	fabss	%f1,	%f11
	fmovsleu	%icc,	%f16,	%f22
	movre	%i4,	%o3,	%o0
	stx	%i3,	[%l7 + 0x40]
	fcmple32	%f8,	%f10,	%l5
	ldsw	[%l7 + 0x58],	%i1
	umul	%i6,	0x0CBD,	%l3
	srax	%l0,	%g4,	%g5
	andcc	%i0,	%g2,	%i7
	movg	%icc,	%g3,	%i5
	ldsh	[%l7 + 0x08],	%l6
	fnegd	%f8,	%f30
	smulcc	%i2,	%o6,	%g6
	fmovsvc	%icc,	%f2,	%f5
	nop
	set	0x53, %g4
	ldub	[%l7 + %g4],	%g7
	fxor	%f26,	%f8,	%f2
	ldd	[%l7 + 0x28],	%o2
	smulcc	%l1,	0x0909,	%g1
	fxors	%f28,	%f21,	%f14
	umul	%o5,	%o4,	%o1
	smulcc	%l4,	%o7,	%i4
	edge32ln	%o3,	%o0,	%i3
	orcc	%l2,	0x0AAC,	%l5
	movrgz	%i1,	%l3,	%l0
	movpos	%icc,	%g4,	%g5
	movcc	%xcc,	%i6,	%i0
	fsrc2s	%f22,	%f8
	umulcc	%i7,	%g3,	%g2
	mulx	%i5,	%l6,	%o6
	edge32l	%g6,	%g7,	%o2
	movle	%xcc,	%l1,	%g1
	lduw	[%l7 + 0x74],	%i2
	fornot1s	%f18,	%f24,	%f8
	sra	%o4,	0x15,	%o1
	movge	%xcc,	%l4,	%o7
	popc	0x0872,	%i4
	edge16n	%o5,	%o0,	%o3
	fpadd32s	%f0,	%f8,	%f0
	umul	%l2,	%l5,	%i3
	ldub	[%l7 + 0x53],	%i1
	mulscc	%l0,	%l3,	%g4
	movvs	%xcc,	%g5,	%i6
	movl	%icc,	%i7,	%g3
	sub	%i0,	%i5,	%l6
	fcmped	%fcc2,	%f2,	%f8
	mulscc	%o6,	0x0E17,	%g6
	fcmpgt32	%f14,	%f22,	%g7
	alignaddrl	%g2,	%o2,	%l1
	fmovdpos	%xcc,	%f25,	%f19
	fmovsge	%xcc,	%f15,	%f2
	pdist	%f16,	%f4,	%f16
	movrlz	%i2,	%g1,	%o1
	ldx	[%l7 + 0x58],	%l4
	fpackfix	%f2,	%f17
	ldsw	[%l7 + 0x54],	%o4
	xnorcc	%o7,	0x0A44,	%o5
	fcmpne16	%f4,	%f20,	%o0
	edge8n	%o3,	%i4,	%l5
	movrlez	%i3,	%i1,	%l0
	movrlz	%l2,	0x22C,	%g4
	movleu	%icc,	%g5,	%l3
	nop
	set	0x1C, %o6
	stb	%i7,	[%l7 + %o6]
	array32	%g3,	%i6,	%i0
	and	%l6,	%o6,	%g6
	addccc	%i5,	%g2,	%o2
	movcs	%xcc,	%g7,	%i2
	fpsub16s	%f0,	%f10,	%f7
	xnor	%l1,	0x1B19,	%o1
	move	%xcc,	%g1,	%o4
	fnor	%f18,	%f12,	%f12
	edge32ln	%l4,	%o5,	%o0
	edge8n	%o3,	%o7,	%i4
	ldsb	[%l7 + 0x4B],	%l5
	fmovsgu	%icc,	%f23,	%f0
	alignaddr	%i1,	%i3,	%l2
	srl	%l0,	%g4,	%g5
	for	%f2,	%f24,	%f24
	movgu	%icc,	%l3,	%g3
	alignaddrl	%i6,	%i0,	%l6
	smulcc	%o6,	%i7,	%g6
	fxor	%f14,	%f16,	%f6
	array16	%i5,	%g2,	%o2
	fmul8x16	%f13,	%f4,	%f6
	ldd	[%l7 + 0x60],	%g6
	fsrc2	%f16,	%f2
	edge8n	%l1,	%o1,	%g1
	stb	%o4,	[%l7 + 0x36]
	addccc	%l4,	0x09E7,	%o5
	movrne	%o0,	0x23C,	%i2
	ldsb	[%l7 + 0x13],	%o3
	edge8l	%o7,	%i4,	%l5
	lduw	[%l7 + 0x20],	%i1
	sethi	0x14F8,	%i3
	movrgez	%l0,	0x00F,	%l2
	fmovdneg	%icc,	%f31,	%f17
	movvc	%xcc,	%g5,	%l3
	smul	%g4,	0x1EA2,	%i6
	fmovsa	%icc,	%f5,	%f31
	smulcc	%g3,	0x06B0,	%i0
	andcc	%l6,	0x0765,	%o6
	andn	%g6,	%i5,	%g2
	fmovrsne	%i7,	%f3,	%f10
	orn	%g7,	0x059B,	%o2
	fmovrdne	%o1,	%f26,	%f16
	srl	%l1,	%g1,	%o4
	fmovdleu	%xcc,	%f0,	%f4
	or	%o5,	%o0,	%l4
	movrne	%i2,	%o7,	%i4
	fabsd	%f28,	%f30
	movrne	%o3,	0x044,	%i1
	and	%i3,	0x017C,	%l5
	ldx	[%l7 + 0x40],	%l2
	edge16	%g5,	%l0,	%l3
	addc	%g4,	%i6,	%i0
	umulcc	%l6,	%g3,	%g6
	fmovspos	%xcc,	%f0,	%f25
	array16	%o6,	%g2,	%i7
	sllx	%i5,	%g7,	%o1
	movl	%icc,	%o2,	%l1
	movrgz	%g1,	%o5,	%o4
	edge32ln	%o0,	%l4,	%o7
	andn	%i2,	0x009D,	%i4
	fmovrde	%i1,	%f30,	%f12
	movrlez	%o3,	0x0D9,	%l5
	umulcc	%i3,	%g5,	%l2
	ldsb	[%l7 + 0x36],	%l0
	edge32ln	%g4,	%l3,	%i0
	fxnors	%f11,	%f30,	%f14
	fmovdg	%icc,	%f8,	%f22
	fcmple16	%f28,	%f30,	%l6
	fpadd16s	%f7,	%f28,	%f18
	ldsb	[%l7 + 0x72],	%i6
	st	%f5,	[%l7 + 0x28]
	srl	%g6,	%g3,	%o6
	movrlez	%g2,	%i5,	%i7
	or	%g7,	0x0E67,	%o2
	mova	%icc,	%o1,	%g1
	udivx	%o5,	0x097A,	%l1
	sllx	%o4,	%l4,	%o0
	ld	[%l7 + 0x50],	%f13
	subcc	%o7,	0x0823,	%i2
	fmovdne	%icc,	%f22,	%f24
	xnor	%i1,	0x1412,	%o3
	sdiv	%l5,	0x13D1,	%i3
	movne	%xcc,	%i4,	%g5
	andncc	%l2,	%l0,	%g4
	andncc	%i0,	%l3,	%l6
	sllx	%g6,	%i6,	%o6
	fnor	%f22,	%f24,	%f0
	movvc	%icc,	%g2,	%i5
	restore %i7, 0x1F97, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f4,	%f8,	%g7
	stw	%o2,	[%l7 + 0x28]
	addc	%g1,	0x1C52,	%o1
	ldub	[%l7 + 0x37],	%l1
	fmovd	%f28,	%f8
	fmovrse	%o4,	%f7,	%f12
	sdivx	%l4,	0x0424,	%o5
	fmovsge	%icc,	%f20,	%f4
	movre	%o0,	%o7,	%i1
	addcc	%i2,	%o3,	%l5
	stb	%i4,	[%l7 + 0x28]
	sub	%i3,	0x1C45,	%l2
	movneg	%xcc,	%l0,	%g5
	edge8	%g4,	%i0,	%l6
	stb	%g6,	[%l7 + 0x13]
	fmovsleu	%xcc,	%f27,	%f28
	fxor	%f26,	%f24,	%f2
	edge16ln	%i6,	%o6,	%l3
	movrgez	%i5,	0x0A2,	%g2
	ldsh	[%l7 + 0x3E],	%i7
	nop
	set	0x38, %i1
	ldd	[%l7 + %i1],	%f2
	fpsub16	%f24,	%f4,	%f2
	edge16	%g7,	%g3,	%g1
	edge8	%o2,	%l1,	%o1
	xor	%o4,	0x0772,	%l4
	edge16n	%o5,	%o0,	%i1
	udivcc	%i2,	0x1134,	%o7
	ldsw	[%l7 + 0x18],	%o3
	fmovrsgez	%i4,	%f29,	%f3
	xnorcc	%i3,	%l5,	%l2
	for	%f24,	%f26,	%f4
	movleu	%icc,	%g5,	%l0
	fxnor	%f8,	%f2,	%f6
	edge16l	%i0,	%g4,	%l6
	movn	%xcc,	%g6,	%i6
	fmovsge	%icc,	%f0,	%f5
	fmovdg	%xcc,	%f28,	%f4
	fpsub32	%f12,	%f0,	%f12
	movrne	%o6,	0x1AA,	%i5
	fnot1	%f14,	%f18
	movl	%xcc,	%l3,	%g2
	fmovrslez	%i7,	%f24,	%f9
	ldd	[%l7 + 0x38],	%f26
	mulx	%g7,	0x10E7,	%g3
	fmovrdlez	%o2,	%f26,	%f0
	umulcc	%g1,	%o1,	%o4
	fmovdle	%xcc,	%f31,	%f12
	movle	%xcc,	%l1,	%o5
	movcc	%xcc,	%o0,	%i1
	fandnot2s	%f17,	%f26,	%f22
	edge8ln	%i2,	%l4,	%o7
	fcmpes	%fcc3,	%f29,	%f20
	fmovrsgz	%o3,	%f3,	%f23
	edge8n	%i3,	%i4,	%l5
	srlx	%l2,	%g5,	%i0
	subccc	%g4,	%l6,	%g6
	fcmple32	%f26,	%f28,	%i6
	movrgz	%o6,	%i5,	%l3
	movcs	%icc,	%l0,	%i7
	fxnor	%f18,	%f26,	%f26
	movge	%icc,	%g7,	%g3
	fmovscc	%icc,	%f4,	%f6
	andcc	%o2,	%g2,	%o1
	fmovd	%f30,	%f10
	sdivx	%o4,	0x1EC6,	%g1
	xor	%o5,	%l1,	%o0
	movvs	%xcc,	%i1,	%l4
	fmovdl	%icc,	%f29,	%f19
	orncc	%i2,	0x1A07,	%o7
	edge16n	%i3,	%i4,	%o3
	movg	%xcc,	%l2,	%g5
	edge8	%i0,	%g4,	%l6
	edge8ln	%l5,	%i6,	%g6
	edge8ln	%i5,	%l3,	%o6
	udiv	%i7,	0x12D0,	%g7
	movrlez	%l0,	0x1D7,	%o2
	fpmerge	%f3,	%f15,	%f6
	fmovsle	%icc,	%f19,	%f17
	fmovdleu	%icc,	%f11,	%f7
	array32	%g2,	%o1,	%o4
	and	%g3,	%g1,	%o5
	stx	%l1,	[%l7 + 0x40]
	sllx	%o0,	0x1E,	%i1
	stb	%l4,	[%l7 + 0x4A]
	movn	%xcc,	%i2,	%o7
	stx	%i3,	[%l7 + 0x30]
	ldub	[%l7 + 0x0C],	%i4
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	and	%i0,	%g5,	%g4
	sub	%l5,	%l6,	%g6
	movre	%i5,	%l3,	%i6
	fornot2	%f20,	%f18,	%f0
	fsrc1	%f24,	%f2
	lduh	[%l7 + 0x46],	%i7
	ldsw	[%l7 + 0x38],	%g7
	smulcc	%l0,	%o2,	%o6
	edge16n	%o1,	%o4,	%g2
	movgu	%xcc,	%g1,	%o5
	movcs	%icc,	%l1,	%g3
	sra	%i1,	%l4,	%i2
	smul	%o7,	%i3,	%o0
	movge	%xcc,	%i4,	%o3
	movl	%xcc,	%i0,	%l2
	movn	%xcc,	%g5,	%l5
	sir	0x070D
	orcc	%l6,	%g4,	%i5
	orn	%l3,	%i6,	%g6
	movrgz	%i7,	0x0CE,	%l0
	st	%f29,	[%l7 + 0x78]
	edge32ln	%g7,	%o6,	%o1
	addccc	%o4,	0x1098,	%o2
	fmovsneg	%icc,	%f4,	%f25
	sethi	0x01C9,	%g2
	move	%icc,	%g1,	%l1
	movl	%xcc,	%o5,	%g3
	fsrc1s	%f16,	%f21
	alignaddrl	%l4,	%i2,	%o7
	array8	%i1,	%o0,	%i3
	srl	%o3,	0x06,	%i4
	subcc	%i0,	0x15DF,	%l2
	fmovdgu	%icc,	%f28,	%f28
	popc	0x04CA,	%l5
	movpos	%icc,	%l6,	%g4
	bshuffle	%f12,	%f18,	%f6
	array8	%i5,	%l3,	%i6
	fabsd	%f8,	%f14
	ldub	[%l7 + 0x79],	%g5
	edge32l	%g6,	%l0,	%i7
	sdivcc	%g7,	0x0B3C,	%o6
	fpadd16	%f6,	%f6,	%f16
	add	%o1,	0x0C2C,	%o2
	fones	%f11
	std	%f14,	[%l7 + 0x28]
	srl	%o4,	%g2,	%l1
	movrgz	%o5,	0x35B,	%g1
	fnot2s	%f18,	%f28
	save %l4, %g3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o7,	%o0,	%i1
	movrgez	%i3,	0x002,	%i4
	andncc	%o3,	%l2,	%l5
	fmovrdgez	%l6,	%f6,	%f6
	ldub	[%l7 + 0x39],	%g4
	movn	%icc,	%i5,	%i0
	movrgz	%l3,	0x3A7,	%i6
	ldx	[%l7 + 0x40],	%g6
	fcmps	%fcc0,	%f24,	%f1
	smul	%l0,	0x008A,	%i7
	andcc	%g7,	%g5,	%o6
	addccc	%o2,	0x0772,	%o4
	umulcc	%g2,	%l1,	%o1
	orncc	%o5,	0x07A5,	%g1
	fcmpes	%fcc0,	%f15,	%f27
	fsrc1s	%f25,	%f16
	addcc	%l4,	%i2,	%o7
	udivcc	%g3,	0x1B70,	%o0
	xor	%i3,	%i1,	%o3
	fandnot1s	%f19,	%f30,	%f10
	umulcc	%l2,	%l5,	%i4
	fmul8x16al	%f11,	%f27,	%f12
	restore %l6, 0x007A, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%xcc,	%f3,	%f5
	andn	%i0,	0x191E,	%l3
	stb	%g4,	[%l7 + 0x18]
	ldd	[%l7 + 0x70],	%f14
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%g6
	subcc	%i6,	%l0,	%g7
	ld	[%l7 + 0x70],	%f24
	stw	%i7,	[%l7 + 0x6C]
	movre	%g5,	%o6,	%o4
	edge32l	%g2,	%l1,	%o2
	fcmpne32	%f30,	%f4,	%o1
	fmovdcs	%xcc,	%f29,	%f13
	edge32ln	%o5,	%g1,	%i2
	popc	0x0877,	%l4
	movre	%o7,	%g3,	%o0
	andn	%i1,	0x1EB5,	%o3
	andcc	%i3,	0x14C0,	%l2
	umul	%l5,	0x1CB2,	%l6
	orcc	%i5,	0x1ABD,	%i4
	movn	%icc,	%i0,	%g4
	popc	0x1EB2,	%l3
	array8	%g6,	%i6,	%l0
	sir	0x19FE
	movge	%xcc,	%i7,	%g7
	array8	%g5,	%o6,	%g2
	udivcc	%o4,	0x0111,	%l1
	addcc	%o1,	0x0CB7,	%o2
	movcs	%xcc,	%o5,	%i2
	orcc	%g1,	%l4,	%g3
	pdist	%f6,	%f22,	%f2
	fmovsne	%icc,	%f9,	%f9
	ldsw	[%l7 + 0x5C],	%o0
	fornot2	%f14,	%f14,	%f16
	fmovsn	%xcc,	%f8,	%f28
	lduw	[%l7 + 0x70],	%i1
	mulscc	%o7,	0x1F63,	%i3
	std	%f22,	[%l7 + 0x10]
	fxnors	%f19,	%f27,	%f26
	smul	%l2,	%l5,	%o3
	move	%xcc,	%l6,	%i4
	ldd	[%l7 + 0x78],	%f0
	sll	%i5,	0x08,	%i0
	sdivcc	%l3,	0x1D6D,	%g4
	ldd	[%l7 + 0x38],	%f20
	fcmpne16	%f14,	%f20,	%i6
	andncc	%l0,	%i7,	%g7
	fmovdge	%icc,	%f12,	%f7
	edge32n	%g6,	%g5,	%g2
	fpadd16s	%f11,	%f21,	%f8
	andn	%o4,	0x0C88,	%o6
	fmul8x16al	%f19,	%f29,	%f30
	sdiv	%l1,	0x1B07,	%o1
	array8	%o5,	%o2,	%g1
	ldsb	[%l7 + 0x4B],	%i2
	fxor	%f4,	%f8,	%f0
	smul	%l4,	0x0F2B,	%g3
	ldsb	[%l7 + 0x7B],	%o0
	fmovdn	%xcc,	%f0,	%f16
	stb	%o7,	[%l7 + 0x23]
	edge32n	%i3,	%l2,	%l5
	orn	%o3,	%l6,	%i1
	bshuffle	%f18,	%f10,	%f30
	edge8	%i4,	%i0,	%l3
	addccc	%g4,	0x15A8,	%i6
	movre	%l0,	0x221,	%i5
	movrgz	%i7,	0x24C,	%g6
	ldd	[%l7 + 0x28],	%g4
	orcc	%g2,	0x066F,	%g7
	movre	%o4,	0x335,	%l1
	fmovsl	%icc,	%f23,	%f3
	or	%o1,	0x1C68,	%o6
	ldd	[%l7 + 0x68],	%o4
	movcc	%icc,	%o2,	%g1
	movl	%xcc,	%l4,	%i2
	sth	%g3,	[%l7 + 0x40]
	stx	%o0,	[%l7 + 0x30]
	smulcc	%i3,	0x0F7A,	%l2
	addc	%o7,	0x1E5D,	%l5
	add	%o3,	0x0B4A,	%i1
	ldsh	[%l7 + 0x42],	%i4
	udivcc	%i0,	0x18D4,	%l3
	move	%xcc,	%l6,	%i6
	edge8l	%g4,	%l0,	%i7
	andncc	%g6,	%g5,	%i5
	fcmped	%fcc2,	%f0,	%f16
	edge16l	%g7,	%g2,	%l1
	ldx	[%l7 + 0x40],	%o1
	sll	%o4,	%o6,	%o5
	subcc	%o2,	0x1A8E,	%l4
	movl	%xcc,	%i2,	%g1
	lduh	[%l7 + 0x20],	%g3
	alignaddrl	%i3,	%l2,	%o7
	srax	%o0,	0x0F,	%o3
	or	%l5,	%i1,	%i0
	fmovda	%xcc,	%f10,	%f8
	movn	%xcc,	%i4,	%l6
	movle	%xcc,	%i6,	%l3
	fcmpne32	%f6,	%f28,	%g4
	edge16n	%i7,	%l0,	%g6
	save %i5, %g5, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x30],	%f15
	sth	%g7,	[%l7 + 0x76]
	xnorcc	%l1,	0x1ABB,	%o4
	sethi	0x17D9,	%o1
	umul	%o6,	%o2,	%l4
	mova	%xcc,	%i2,	%g1
	ldd	[%l7 + 0x28],	%f8
	smul	%g3,	%i3,	%l2
	sth	%o5,	[%l7 + 0x7A]
	udiv	%o0,	0x0F75,	%o3
	stx	%o7,	[%l7 + 0x50]
	fmovsle	%xcc,	%f20,	%f22
	stw	%i1,	[%l7 + 0x78]
	add	%i0,	%i4,	%l5
	movn	%xcc,	%l6,	%l3
	movpos	%xcc,	%i6,	%i7
	edge8	%g4,	%g6,	%i5
	sth	%l0,	[%l7 + 0x32]
	movg	%icc,	%g2,	%g5
	movge	%xcc,	%g7,	%o4
	fsrc2	%f30,	%f0
	xnorcc	%o1,	0x0B0C,	%o6
	fmovrslez	%o2,	%f1,	%f12
	udivx	%l1,	0x12D1,	%i2
	lduh	[%l7 + 0x1C],	%g1
	movleu	%xcc,	%l4,	%g3
	movrlez	%i3,	0x36E,	%l2
	nop
	set	0x28, %o7
	std	%f10,	[%l7 + %o7]
	array16	%o5,	%o3,	%o7
	movcc	%xcc,	%o0,	%i0
	xor	%i1,	0x15C9,	%l5
	udivx	%l6,	0x052A,	%l3
	movre	%i4,	%i6,	%g4
	fsrc2	%f6,	%f30
	umul	%g6,	%i5,	%l0
	movneg	%xcc,	%i7,	%g5
	fmovsneg	%icc,	%f27,	%f19
	ldx	[%l7 + 0x70],	%g7
	stx	%o4,	[%l7 + 0x10]
	sir	0x1735
	ldd	[%l7 + 0x68],	%f24
	orn	%o1,	0x12B2,	%o6
	orn	%g2,	0x1EF4,	%o2
	movgu	%xcc,	%i2,	%g1
	ldub	[%l7 + 0x44],	%l1
	smul	%g3,	0x115A,	%i3
	fmovsvs	%xcc,	%f29,	%f3
	movl	%icc,	%l2,	%o5
	fzeros	%f4
	addc	%o3,	0x0C8E,	%l4
	nop
	set	0x68, %g3
	ldsw	[%l7 + %g3],	%o0
	smul	%o7,	%i0,	%i1
	fcmpne32	%f14,	%f18,	%l6
	fands	%f27,	%f6,	%f26
	movneg	%xcc,	%l5,	%l3
	ldsh	[%l7 + 0x5E],	%i4
	xnorcc	%g4,	%g6,	%i5
	pdist	%f24,	%f28,	%f6
	stw	%l0,	[%l7 + 0x68]
	array8	%i7,	%i6,	%g5
	add	%g7,	0x1E29,	%o1
	orcc	%o4,	0x0917,	%g2
	mova	%icc,	%o2,	%i2
	lduw	[%l7 + 0x48],	%o6
	umul	%g1,	0x0C6A,	%g3
	movne	%icc,	%i3,	%l2
	ldsb	[%l7 + 0x24],	%o5
	alignaddr	%o3,	%l1,	%o0
	lduw	[%l7 + 0x68],	%o7
	movvc	%icc,	%i0,	%i1
	umul	%l6,	%l4,	%l5
	fmuld8sux16	%f18,	%f21,	%f2
	ldd	[%l7 + 0x30],	%f14
	fmuld8ulx16	%f9,	%f8,	%f28
	nop
	set	0x20, %i6
	stb	%i4,	[%l7 + %i6]
	movre	%l3,	0x056,	%g6
	popc	%g4,	%i5
	fsrc1	%f18,	%f2
	alignaddrl	%i7,	%i6,	%g5
	fmovsg	%xcc,	%f4,	%f12
	srl	%g7,	%o1,	%l0
	fmovrsne	%g2,	%f8,	%f21
	fxor	%f22,	%f6,	%f4
	edge32	%o4,	%i2,	%o2
	save %g1, %o6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l2,	0x1BA,	%o5
	ldub	[%l7 + 0x63],	%g3
	sth	%l1,	[%l7 + 0x24]
	sethi	0x08A0,	%o0
	fsrc1s	%f7,	%f12
	edge16n	%o7,	%o3,	%i1
	array16	%l6,	%i0,	%l4
	sub	%l5,	0x0EB0,	%i4
	fsrc2	%f14,	%f14
	fmovrde	%l3,	%f16,	%f0
	orncc	%g4,	%i5,	%g6
	sllx	%i7,	0x19,	%i6
	movcs	%icc,	%g7,	%g5
	movgu	%icc,	%l0,	%o1
	movle	%xcc,	%o4,	%i2
	fzero	%f22
	movneg	%icc,	%o2,	%g2
	sll	%g1,	%i3,	%o6
	movvs	%xcc,	%o5,	%l2
	orcc	%l1,	%g3,	%o0
	std	%f20,	[%l7 + 0x48]
	edge32l	%o3,	%i1,	%o7
	or	%i0,	%l4,	%l5
	edge8	%i4,	%l6,	%g4
	sll	%i5,	0x1B,	%g6
	udivcc	%i7,	0x1640,	%i6
	fmovrdlz	%g7,	%f4,	%f6
	xnor	%l3,	%g5,	%l0
	smul	%o1,	0x1FF9,	%i2
	stb	%o4,	[%l7 + 0x77]
	alignaddr	%o2,	%g1,	%i3
	sdivx	%g2,	0x09DD,	%o6
	nop
	set	0x78, %g1
	stw	%o5,	[%l7 + %g1]
	fmovrslz	%l1,	%f15,	%f7
	sllx	%l2,	0x0E,	%o0
	movrgz	%g3,	0x294,	%o3
	lduh	[%l7 + 0x30],	%i1
	smul	%i0,	0x0BEF,	%o7
	movn	%icc,	%l5,	%i4
	addccc	%l6,	%l4,	%g4
	sdivx	%g6,	0x155B,	%i5
	bshuffle	%f16,	%f22,	%f20
	srax	%i6,	%g7,	%l3
	fsrc2	%f24,	%f4
	fmovsa	%icc,	%f9,	%f8
	edge16	%i7,	%l0,	%g5
	sdivx	%o1,	0x042E,	%o4
	ldd	[%l7 + 0x78],	%f14
	ldsh	[%l7 + 0x10],	%o2
	udiv	%i2,	0x0E9F,	%i3
	andn	%g1,	%g2,	%o6
	xnorcc	%o5,	%l1,	%o0
	smulcc	%l2,	%o3,	%i1
	sdiv	%i0,	0x1C17,	%g3
	fcmpd	%fcc0,	%f24,	%f22
	sth	%o7,	[%l7 + 0x5A]
	edge8l	%i4,	%l6,	%l4
	movcs	%xcc,	%g4,	%l5
	fornot1s	%f0,	%f4,	%f23
	fpadd16s	%f6,	%f18,	%f22
	fmovde	%icc,	%f12,	%f12
	edge32ln	%i5,	%g6,	%i6
	fabss	%f12,	%f29
	fnand	%f14,	%f6,	%f26
	fmuld8sux16	%f4,	%f12,	%f20
	fmovrdlez	%g7,	%f4,	%f26
	movrgez	%i7,	0x0BE,	%l3
	fmul8sux16	%f14,	%f20,	%f24
	movvs	%xcc,	%l0,	%g5
	faligndata	%f22,	%f2,	%f12
	fxnors	%f8,	%f19,	%f6
	fand	%f2,	%f2,	%f16
	alignaddr	%o1,	%o4,	%o2
	smul	%i3,	0x0169,	%i2
	fcmps	%fcc0,	%f26,	%f10
	array8	%g2,	%o6,	%o5
	edge32n	%l1,	%o0,	%g1
	addcc	%o3,	0x1E0B,	%l2
	sra	%i0,	0x00,	%g3
	array32	%i1,	%o7,	%l6
	movrgz	%i4,	0x39E,	%g4
	xor	%l4,	0x1A03,	%i5
	edge32n	%g6,	%l5,	%g7
	move	%icc,	%i6,	%i7
	movcs	%icc,	%l3,	%l0
	andn	%o1,	0x0B3D,	%o4
	movrne	%o2,	%g5,	%i3
	movgu	%xcc,	%g2,	%o6
	movl	%xcc,	%o5,	%l1
	movpos	%icc,	%o0,	%g1
	movre	%o3,	%i2,	%l2
	sdivx	%i0,	0x0F8A,	%g3
	or	%o7,	%i1,	%l6
	sra	%g4,	%i4,	%l4
	orcc	%i5,	0x05C5,	%g6
	subcc	%l5,	0x1523,	%g7
	edge32ln	%i7,	%i6,	%l3
	andn	%l0,	%o4,	%o1
	sdivx	%g5,	0x0887,	%i3
	edge32n	%g2,	%o6,	%o2
	popc	0x013E,	%o5
	pdist	%f30,	%f0,	%f28
	array32	%l1,	%g1,	%o0
	edge16n	%i2,	%o3,	%l2
	movrgz	%g3,	%o7,	%i0
	fmovsge	%icc,	%f20,	%f20
	array16	%l6,	%g4,	%i1
	andcc	%l4,	0x16B5,	%i5
	fmovdvc	%icc,	%f15,	%f2
	ldsb	[%l7 + 0x21],	%g6
	fornot2s	%f4,	%f28,	%f31
	add	%l5,	%i4,	%i7
	orn	%g7,	0x18B2,	%i6
	fmovscs	%xcc,	%f27,	%f7
	for	%f14,	%f16,	%f26
	fpsub32s	%f3,	%f21,	%f8
	orn	%l3,	0x003E,	%o4
	fcmpgt16	%f2,	%f0,	%l0
	sdivcc	%g5,	0x03EB,	%o1
	fmovdne	%xcc,	%f16,	%f27
	subc	%i3,	0x0C60,	%o6
	subc	%o2,	%o5,	%g2
	fmovsne	%icc,	%f21,	%f18
	edge32	%l1,	%o0,	%i2
	edge32l	%g1,	%l2,	%g3
	fexpand	%f20,	%f4
	orcc	%o3,	0x18D9,	%o7
	stx	%l6,	[%l7 + 0x78]
	udivx	%i0,	0x19C7,	%g4
	movre	%i1,	0x38D,	%l4
	sdivcc	%i5,	0x00B7,	%g6
	edge8	%l5,	%i7,	%g7
	fnor	%f4,	%f30,	%f8
	movge	%icc,	%i6,	%l3
	fcmpeq32	%f26,	%f24,	%o4
	movvs	%xcc,	%l0,	%g5
	movcc	%icc,	%o1,	%i4
	movn	%icc,	%o6,	%i3
	movne	%icc,	%o2,	%o5
	movvc	%icc,	%l1,	%o0
	fxors	%f11,	%f15,	%f21
	edge32	%g2,	%g1,	%i2
	edge8	%l2,	%o3,	%g3
	fcmpne16	%f4,	%f4,	%o7
	sdiv	%i0,	0x00E9,	%l6
	sir	0x0E7C
	std	%f22,	[%l7 + 0x18]
	orncc	%g4,	0x015A,	%l4
	movneg	%icc,	%i1,	%i5
	orcc	%l5,	0x01E4,	%i7
	udivcc	%g6,	0x1CF1,	%g7
	edge8n	%i6,	%l3,	%l0
	sllx	%g5,	0x12,	%o1
	and	%o4,	0x1ABE,	%i4
	ldd	[%l7 + 0x58],	%i2
	array32	%o2,	%o5,	%o6
	fnand	%f16,	%f24,	%f0
	movre	%l1,	%o0,	%g1
	addcc	%g2,	%l2,	%o3
	fmovscc	%xcc,	%f10,	%f26
	move	%xcc,	%g3,	%o7
	edge8	%i0,	%i2,	%g4
	mulscc	%l6,	%i1,	%i5
	or	%l4,	0x00AA,	%l5
	stx	%i7,	[%l7 + 0x18]
	fmovsleu	%icc,	%f1,	%f4
	fmovrde	%g7,	%f6,	%f0
	fand	%f26,	%f30,	%f6
	sethi	0x13BD,	%i6
	save %g6, %l0, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o1,	0x0085,	%l3
	movge	%icc,	%o4,	%i3
	edge32l	%o2,	%o5,	%i4
	smul	%l1,	0x03CF,	%o6
	fcmpne16	%f16,	%f2,	%g1
	srax	%g2,	%l2,	%o3
	movre	%g3,	%o7,	%o0
	fpsub32s	%f31,	%f16,	%f6
	ldub	[%l7 + 0x09],	%i2
	fandnot2	%f10,	%f14,	%f28
	movg	%icc,	%i0,	%g4
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%i6
	fnands	%f11,	%f22,	%f17
	fmovsgu	%icc,	%f16,	%f31
	fmul8x16al	%f13,	%f18,	%f22
	ldsw	[%l7 + 0x38],	%i1
	lduh	[%l7 + 0x7A],	%l4
	fxors	%f12,	%f23,	%f1
	nop
	set	0x66, %o4
	ldub	[%l7 + %o4],	%l5
	alignaddrl	%i5,	%i7,	%i6
	pdist	%f6,	%f18,	%f24
	nop
	set	0x60, %l2
	ldx	[%l7 + %l2],	%g6
	edge32	%l0,	%g7,	%o1
	stb	%l3,	[%l7 + 0x55]
	xnor	%o4,	0x0035,	%g5
	sth	%o2,	[%l7 + 0x1C]
	fmovrsne	%i3,	%f14,	%f14
	nop
	set	0x28, %l0
	ldsw	[%l7 + %l0],	%o5
	udivcc	%i4,	0x0BB0,	%l1
	subc	%g1,	%g2,	%o6
	std	%f30,	[%l7 + 0x30]
	edge16	%o3,	%l2,	%o7
	fmovdl	%icc,	%f12,	%f4
	movrlz	%g3,	%o0,	%i0
	ldx	[%l7 + 0x38],	%g4
	addccc	%l6,	0x033C,	%i2
	std	%f16,	[%l7 + 0x30]
	movrgz	%i1,	0x091,	%l4
	sir	0x1BD4
	edge32ln	%l5,	%i7,	%i5
	srlx	%i6,	%g6,	%l0
	umul	%o1,	%l3,	%o4
	movleu	%xcc,	%g5,	%g7
	andn	%o2,	%i3,	%i4
	orn	%l1,	%g1,	%o5
	ldsh	[%l7 + 0x48],	%g2
	fmovdn	%xcc,	%f20,	%f13
	ldsw	[%l7 + 0x68],	%o6
	andn	%l2,	%o3,	%o7
	and	%g3,	0x0918,	%i0
	or	%g4,	%o0,	%i2
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	edge16ln	%l5,	%l4,	%i5
	xnorcc	%i7,	0x1693,	%i6
	movleu	%xcc,	%g6,	%o1
	andcc	%l0,	%l3,	%o4
	movle	%xcc,	%g7,	%g5
	sub	%o2,	0x1EE0,	%i4
	movl	%icc,	%i3,	%g1
	udivx	%o5,	0x1DE8,	%l1
	movcs	%icc,	%g2,	%l2
	sdivcc	%o3,	0x1660,	%o6
	sra	%g3,	%o7,	%i0
	ldd	[%l7 + 0x78],	%f0
	fmovdvs	%xcc,	%f0,	%f15
	sir	0x04EA
	ldx	[%l7 + 0x20],	%g4
	st	%f10,	[%l7 + 0x30]
	edge8	%o0,	%i2,	%i1
	edge16ln	%l6,	%l4,	%l5
	xnor	%i7,	%i6,	%g6
	edge16	%i5,	%l0,	%o1
	st	%f8,	[%l7 + 0x38]
	orncc	%o4,	0x0824,	%g7
	xnorcc	%l3,	%g5,	%i4
	umulcc	%o2,	%i3,	%g1
	movvs	%xcc,	%l1,	%o5
	srl	%l2,	0x16,	%g2
	movg	%xcc,	%o3,	%g3
	array16	%o6,	%i0,	%g4
	sdivx	%o0,	0x1FEC,	%i2
	edge16n	%o7,	%l6,	%l4
	mova	%xcc,	%i1,	%l5
	fsrc2	%f0,	%f10
	fpackfix	%f30,	%f11
	sll	%i7,	%g6,	%i5
	edge16	%l0,	%o1,	%o4
	ldd	[%l7 + 0x30],	%g6
	sethi	0x1B6B,	%l3
	fmovse	%icc,	%f4,	%f15
	fornot2s	%f11,	%f22,	%f2
	alignaddr	%g5,	%i6,	%o2
	movge	%icc,	%i4,	%i3
	lduh	[%l7 + 0x4C],	%g1
	srax	%l1,	0x14,	%l2
	fors	%f19,	%f25,	%f10
	fpsub16s	%f12,	%f5,	%f18
	fnor	%f14,	%f20,	%f20
	andncc	%g2,	%o3,	%g3
	movge	%xcc,	%o5,	%o6
	fpsub16	%f30,	%f16,	%f6
	movg	%xcc,	%i0,	%g4
	subcc	%o0,	%i2,	%l6
	array32	%l4,	%o7,	%l5
	addc	%i7,	0x13B6,	%i1
	fnors	%f10,	%f18,	%f17
	movl	%xcc,	%g6,	%l0
	smulcc	%i5,	%o4,	%o1
	fmovrdgz	%g7,	%f12,	%f30
	subccc	%l3,	%g5,	%o2
	fornot1	%f26,	%f12,	%f20
	fmovrsne	%i6,	%f30,	%f18
	edge8l	%i3,	%g1,	%i4
	movleu	%xcc,	%l1,	%l2
	addc	%g2,	0x04BE,	%g3
	mulx	%o5,	%o3,	%i0
	fmovdl	%icc,	%f14,	%f27
	movcs	%icc,	%g4,	%o6
	edge32ln	%o0,	%l6,	%l4
	addcc	%i2,	%l5,	%o7
	sub	%i1,	%i7,	%l0
	movrgez	%g6,	0x126,	%i5
	std	%f26,	[%l7 + 0x38]
	smulcc	%o1,	%g7,	%l3
	siam	0x5
	ldd	[%l7 + 0x30],	%g4
	ld	[%l7 + 0x44],	%f5
	movleu	%xcc,	%o4,	%o2
	fcmpeq32	%f20,	%f12,	%i6
	subccc	%i3,	0x01EF,	%i4
	edge8ln	%g1,	%l1,	%g2
	fzeros	%f17
	movg	%xcc,	%g3,	%o5
	udiv	%l2,	0x1C02,	%o3
	movcc	%icc,	%i0,	%o6
	restore %g4, %l6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f28,	%f5
	fmovrslez	%i2,	%f0,	%f23
	array8	%o0,	%o7,	%i1
	ldd	[%l7 + 0x30],	%f12
	sdivcc	%i7,	0x175F,	%l5
	fand	%f12,	%f30,	%f0
	movg	%xcc,	%l0,	%i5
	ldsh	[%l7 + 0x38],	%o1
	fmovsge	%xcc,	%f9,	%f19
	movg	%icc,	%g7,	%g6
	xorcc	%g5,	%o4,	%l3
	fmovrslz	%o2,	%f14,	%f0
	xor	%i3,	0x1E96,	%i6
	stx	%g1,	[%l7 + 0x50]
	fnot1	%f4,	%f24
	stw	%l1,	[%l7 + 0x50]
	array32	%g2,	%g3,	%i4
	ldd	[%l7 + 0x38],	%o4
	movre	%l2,	%i0,	%o3
	fmovrdgez	%g4,	%f20,	%f6
	fmovdg	%xcc,	%f21,	%f0
	stw	%l6,	[%l7 + 0x64]
	xnor	%o6,	0x109E,	%l4
	movn	%icc,	%o0,	%i2
	ldx	[%l7 + 0x60],	%o7
	fmovscc	%xcc,	%f23,	%f12
	movg	%icc,	%i7,	%i1
	orn	%l5,	0x1F29,	%l0
	array32	%i5,	%g7,	%g6
	ld	[%l7 + 0x28],	%f16
	fornot2s	%f4,	%f8,	%f8
	move	%icc,	%g5,	%o4
	edge32ln	%l3,	%o2,	%o1
	nop
	set	0x08, %g2
	std	%f2,	[%l7 + %g2]
	srl	%i6,	%g1,	%i3
	edge32n	%g2,	%l1,	%i4
	mova	%icc,	%o5,	%g3
	fexpand	%f27,	%f14
	save %i0, 0x0E68, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%icc,	%f27,	%f27
	movrne	%l2,	%l6,	%o6
	udivx	%l4,	0x1347,	%g4
	udivx	%o0,	0x1FFA,	%i2
	orn	%i7,	%i1,	%l5
	subcc	%l0,	0x101A,	%i5
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	sdivcc	%g5,	0x073B,	%o4
	fone	%f30
	movcc	%icc,	%l3,	%o7
	fands	%f21,	%f6,	%f29
	udivx	%o1,	0x0F2D,	%i6
	movrne	%o2,	%g1,	%g2
	alignaddrl	%l1,	%i4,	%o5
	movrgz	%g3,	%i0,	%i3
	sdiv	%l2,	0x19FE,	%l6
	lduw	[%l7 + 0x5C],	%o3
	andn	%l4,	%g4,	%o6
	edge8ln	%i2,	%o0,	%i7
	movneg	%xcc,	%i1,	%l0
	movpos	%icc,	%l5,	%i5
	fnot1	%f8,	%f10
	edge32n	%g7,	%g5,	%o4
	edge8l	%g6,	%l3,	%o7
	sdivcc	%o1,	0x080F,	%i6
	edge32l	%o2,	%g2,	%l1
	edge16n	%i4,	%o5,	%g3
	addccc	%g1,	%i3,	%l2
	movre	%l6,	%i0,	%l4
	sethi	0x1A11,	%g4
	movle	%xcc,	%o3,	%o6
	sllx	%o0,	0x03,	%i7
	umul	%i2,	%i1,	%l0
	fcmpgt16	%f24,	%f8,	%l5
	sethi	0x1ADB,	%i5
	fmovse	%xcc,	%f0,	%f14
	movrne	%g5,	0x2C8,	%g7
	movneg	%icc,	%g6,	%o4
	fmovd	%f0,	%f0
	std	%f16,	[%l7 + 0x78]
	movrgz	%o7,	%l3,	%o1
	subcc	%i6,	%o2,	%l1
	edge32l	%g2,	%o5,	%g3
	movvc	%icc,	%i4,	%g1
	edge16ln	%i3,	%l2,	%l6
	addcc	%i0,	0x1B94,	%l4
	ldsb	[%l7 + 0x78],	%g4
	edge16	%o3,	%o6,	%o0
	sdivcc	%i2,	0x0A36,	%i7
	alignaddr	%i1,	%l0,	%i5
	movn	%xcc,	%l5,	%g5
	edge8l	%g7,	%g6,	%o4
	movrlz	%o7,	0x363,	%o1
	srl	%i6,	%l3,	%o2
	add	%g2,	%l1,	%g3
	fmovsvs	%icc,	%f20,	%f9
	ldsw	[%l7 + 0x58],	%i4
	movcs	%icc,	%g1,	%i3
	sub	%l2,	%l6,	%i0
	sll	%o5,	0x1C,	%l4
	ldsw	[%l7 + 0x20],	%o3
	fmovrdgez	%o6,	%f2,	%f10
	or	%g4,	0x1884,	%i2
	array32	%o0,	%i1,	%i7
	subccc	%l0,	0x0888,	%l5
	fcmped	%fcc3,	%f0,	%f22
	addc	%g5,	%g7,	%i5
	movne	%xcc,	%o4,	%g6
	smulcc	%o7,	0x0457,	%i6
	srax	%o1,	0x01,	%o2
	fmovde	%icc,	%f31,	%f29
	edge8	%g2,	%l1,	%l3
	movvs	%xcc,	%i4,	%g1
	for	%f22,	%f28,	%f10
	andcc	%g3,	0x1F95,	%l2
	fandnot2s	%f15,	%f28,	%f25
	fmuld8ulx16	%f5,	%f15,	%f18
	array16	%i3,	%l6,	%o5
	smulcc	%l4,	0x18E7,	%i0
	edge16n	%o3,	%g4,	%i2
	fnot2	%f16,	%f6
	movneg	%xcc,	%o6,	%i1
	sdivx	%o0,	0x1727,	%l0
	ldub	[%l7 + 0x73],	%i7
	st	%f18,	[%l7 + 0x6C]
	fmovsne	%xcc,	%f25,	%f12
	edge8ln	%g5,	%g7,	%l5
	addc	%o4,	0x1C06,	%i5
	xnor	%g6,	0x16CC,	%i6
	alignaddrl	%o7,	%o1,	%g2
	nop
	set	0x14, %i0
	sth	%o2,	[%l7 + %i0]
	movneg	%icc,	%l1,	%l3
	ldd	[%l7 + 0x30],	%f2
	movgu	%icc,	%g1,	%i4
	fmul8sux16	%f20,	%f2,	%f28
	fmovsleu	%xcc,	%f18,	%f7
	umulcc	%l2,	%g3,	%l6
	alignaddr	%i3,	%l4,	%o5
	array8	%i0,	%g4,	%o3
	ldd	[%l7 + 0x60],	%i2
	ldx	[%l7 + 0x28],	%i1
	fexpand	%f5,	%f18
	movgu	%xcc,	%o0,	%l0
	movrlez	%o6,	0x0E8,	%g5
	popc	%g7,	%i7
	edge8n	%o4,	%i5,	%g6
	movvs	%icc,	%i6,	%l5
	mulscc	%o7,	%g2,	%o1
	array32	%l1,	%o2,	%g1
	fmovda	%icc,	%f23,	%f3
	movre	%i4,	0x109,	%l3
	smulcc	%l2,	%l6,	%g3
	movcs	%xcc,	%l4,	%i3
	fmovspos	%icc,	%f9,	%f17
	edge32	%i0,	%o5,	%g4
	stx	%i2,	[%l7 + 0x68]
	fmovsgu	%xcc,	%f29,	%f4
	array16	%i1,	%o0,	%o3
	srax	%l0,	%o6,	%g7
	fmovs	%f26,	%f5
	restore %i7, %g5, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%g6,	%i6
	edge8ln	%o4,	%o7,	%l5
	add	%g2,	%l1,	%o2
	ldx	[%l7 + 0x40],	%g1
	udiv	%i4,	0x1DEC,	%l3
	udiv	%o1,	0x1546,	%l2
	subccc	%l6,	%g3,	%l4
	movne	%xcc,	%i0,	%o5
	sdivcc	%i3,	0x1F57,	%g4
	xnorcc	%i2,	%o0,	%o3
	alignaddrl	%l0,	%o6,	%i1
	edge32ln	%g7,	%g5,	%i5
	edge8n	%g6,	%i7,	%i6
	stb	%o7,	[%l7 + 0x22]
	edge32ln	%o4,	%l5,	%g2
	and	%o2,	%l1,	%g1
	mulscc	%i4,	%l3,	%l2
	ldd	[%l7 + 0x78],	%o0
	movrlz	%g3,	0x05A,	%l4
	edge8	%i0,	%l6,	%i3
	edge16	%o5,	%i2,	%g4
	ldsh	[%l7 + 0x2A],	%o3
	fpadd16s	%f28,	%f14,	%f25
	umulcc	%l0,	0x0286,	%o0
	stb	%i1,	[%l7 + 0x2D]
	stx	%o6,	[%l7 + 0x78]
	array16	%g7,	%g5,	%i5
	addc	%i7,	0x1E5D,	%i6
	movcc	%icc,	%o7,	%o4
	movne	%icc,	%l5,	%g6
	subcc	%o2,	%l1,	%g1
	xor	%i4,	%l3,	%g2
	movle	%xcc,	%o1,	%l2
	sdiv	%l4,	0x147A,	%i0
	ldd	[%l7 + 0x30],	%i6
	sdivx	%g3,	0x1031,	%i3
	smulcc	%o5,	0x0B7C,	%g4
	srl	%o3,	0x06,	%l0
	nop
	set	0x40, %l4
	ldsw	[%l7 + %l4],	%i2
	ld	[%l7 + 0x58],	%f17
	array8	%o0,	%o6,	%g7
	movrlez	%g5,	%i1,	%i7
	movl	%xcc,	%i6,	%i5
	movpos	%xcc,	%o4,	%l5
	move	%xcc,	%g6,	%o2
	addc	%l1,	0x1AB9,	%o7
	udivcc	%g1,	0x0B4C,	%l3
	std	%f16,	[%l7 + 0x60]
	edge16ln	%i4,	%g2,	%l2
	fxors	%f26,	%f5,	%f16
	sdivx	%o1,	0x1F93,	%i0
	movge	%xcc,	%l4,	%l6
	movge	%xcc,	%g3,	%o5
	umulcc	%i3,	0x0DEA,	%o3
	fmovrdgz	%l0,	%f6,	%f18
	orcc	%g4,	0x07B9,	%o0
	addc	%o6,	%i2,	%g7
	fpsub16s	%f10,	%f10,	%f21
	lduh	[%l7 + 0x58],	%i1
	ldsw	[%l7 + 0x58],	%g5
	fnot2s	%f3,	%f21
	fmovsneg	%xcc,	%f20,	%f25
	xor	%i7,	%i5,	%o4
	movl	%icc,	%l5,	%i6
	xor	%o2,	0x110E,	%l1
	add	%o7,	%g6,	%l3
	fmovrsgez	%g1,	%f6,	%f4
	movcs	%xcc,	%g2,	%i4
	orcc	%l2,	%o1,	%i0
	nop
	set	0x10, %l6
	stx	%l6,	[%l7 + %l6]
	edge16n	%l4,	%o5,	%i3
	fmovrsne	%g3,	%f9,	%f5
	array8	%o3,	%g4,	%l0
	move	%xcc,	%o0,	%i2
	sdiv	%o6,	0x10C2,	%i1
	std	%f20,	[%l7 + 0x28]
	nop
	set	0x7C, %o0
	ldsw	[%l7 + %o0],	%g7
	edge8l	%g5,	%i7,	%o4
	xor	%i5,	0x169E,	%i6
	mulx	%o2,	0x0794,	%l5
	xnor	%l1,	%o7,	%g6
	add	%l3,	%g1,	%i4
	movrlz	%g2,	%o1,	%i0
	edge32l	%l2,	%l4,	%l6
	popc	0x0170,	%o5
	ldub	[%l7 + 0x22],	%g3
	movg	%xcc,	%i3,	%o3
	lduh	[%l7 + 0x6E],	%l0
	move	%xcc,	%g4,	%i2
	movrlz	%o0,	0x39E,	%i1
	edge32l	%g7,	%o6,	%g5
	array8	%o4,	%i7,	%i5
	sdiv	%i6,	0x0E1C,	%l5
	nop
	set	0x78, %o3
	ldx	[%l7 + %o3],	%l1
	sth	%o2,	[%l7 + 0x3E]
	edge32	%o7,	%g6,	%g1
	movrne	%l3,	%i4,	%o1
	edge32	%i0,	%l2,	%l4
	edge32	%l6,	%o5,	%g2
	edge16	%i3,	%g3,	%l0
	sllx	%o3,	0x14,	%g4
	edge16n	%o0,	%i2,	%g7
	sllx	%o6,	%g5,	%o4
	fors	%f1,	%f22,	%f27
	fmovdleu	%xcc,	%f0,	%f10
	addcc	%i7,	%i5,	%i1
	ld	[%l7 + 0x64],	%f10
	fnegs	%f26,	%f20
	add	%i6,	0x1C24,	%l1
	stw	%o2,	[%l7 + 0x24]
	lduh	[%l7 + 0x60],	%l5
	movrlz	%g6,	0x380,	%o7
	orcc	%g1,	0x0EDE,	%l3
	lduh	[%l7 + 0x42],	%i4
	mova	%icc,	%i0,	%l2
	movrne	%l4,	%l6,	%o5
	fmovsn	%icc,	%f1,	%f22
	movvc	%xcc,	%o1,	%g2
	orcc	%g3,	0x0762,	%i3
	fsrc2s	%f1,	%f5
	fmovsgu	%xcc,	%f6,	%f5
	movre	%l0,	%o3,	%o0
	fmuld8ulx16	%f12,	%f6,	%f16
	nop
	set	0x54, %l3
	lduh	[%l7 + %l3],	%g4
	movrne	%g7,	0x146,	%o6
	mulscc	%i2,	0x077D,	%o4
	srax	%i7,	0x02,	%i5
	fcmps	%fcc3,	%f20,	%f20
	edge16	%g5,	%i6,	%i1
	orn	%o2,	%l1,	%g6
	std	%f28,	[%l7 + 0x30]
	nop
	set	0x62, %g6
	sth	%l5,	[%l7 + %g6]
	fcmple32	%f26,	%f26,	%o7
	stx	%g1,	[%l7 + 0x30]
	lduh	[%l7 + 0x28],	%i4
	edge8n	%l3,	%l2,	%l4
	edge32n	%i0,	%l6,	%o5
	fnands	%f3,	%f17,	%f4
	xorcc	%o1,	0x1AA8,	%g2
	addcc	%i3,	0x0750,	%l0
	save %g3, %o3, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%g7,	%g4
	ldd	[%l7 + 0x08],	%o6
	st	%f16,	[%l7 + 0x10]
	umul	%i2,	%i7,	%o4
	sra	%g5,	0x10,	%i6
	sub	%i1,	0x1D8A,	%i5
	fpsub32s	%f27,	%f25,	%f28
	fpsub32	%f24,	%f4,	%f8
	srax	%l1,	%o2,	%g6
	sethi	0x03BB,	%l5
	smulcc	%g1,	0x0F89,	%o7
	srax	%l3,	%l2,	%i4
	fcmpne16	%f14,	%f24,	%l4
	fmul8x16	%f11,	%f4,	%f6
	movcc	%xcc,	%l6,	%i0
	fmovrsgz	%o5,	%f19,	%f3
	movpos	%icc,	%o1,	%g2
	st	%f13,	[%l7 + 0x44]
	fpmerge	%f30,	%f9,	%f24
	fmovsge	%icc,	%f31,	%f14
	fmovsa	%xcc,	%f10,	%f23
	movrlz	%l0,	%i3,	%o3
	popc	%o0,	%g3
	movleu	%xcc,	%g7,	%o6
	movvs	%xcc,	%i2,	%g4
	movrgez	%i7,	%o4,	%g5
	fnot2s	%f26,	%f7
	alignaddrl	%i1,	%i5,	%l1
	edge32ln	%i6,	%g6,	%l5
	array32	%g1,	%o2,	%l3
	movrgez	%l2,	0x014,	%i4
	ldd	[%l7 + 0x38],	%l4
	movleu	%xcc,	%o7,	%l6
	move	%xcc,	%i0,	%o1
	sdivx	%o5,	0x1C5D,	%g2
	sir	0x119F
	edge32l	%l0,	%o3,	%i3
	addcc	%o0,	0x0CA5,	%g3
	fpsub16s	%f26,	%f19,	%f19
	or	%o6,	0x11BF,	%i2
	edge32n	%g7,	%i7,	%g4
	fpackfix	%f22,	%f12
	ldd	[%l7 + 0x68],	%o4
	fcmpeq16	%f24,	%f28,	%i1
	fandnot1s	%f2,	%f22,	%f31
	popc	0x0C18,	%i5
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	mulx	%l5,	%g6,	%o2
	mova	%icc,	%g1,	%l2
	fcmpgt16	%f0,	%f4,	%i4
	edge32n	%l3,	%o7,	%l4
	srlx	%l6,	0x1B,	%o1
	sub	%i0,	%o5,	%l0
	movn	%xcc,	%o3,	%g2
	add	%i3,	%g3,	%o0
	movl	%xcc,	%i2,	%g7
	sdivcc	%o6,	0x0A2D,	%i7
	alignaddrl	%o4,	%g4,	%i1
	sdivx	%g5,	0x1C2D,	%i5
	fcmpgt16	%f6,	%f0,	%i6
	movneg	%icc,	%l5,	%l1
	fmovdleu	%xcc,	%f25,	%f27
	addcc	%g6,	0x10BD,	%g1
	nop
	set	0x30, %i5
	lduh	[%l7 + %i5],	%l2
	fandnot1	%f4,	%f12,	%f26
	array16	%i4,	%o2,	%o7
	movne	%xcc,	%l3,	%l4
	ldd	[%l7 + 0x38],	%o0
	orncc	%i0,	%l6,	%o5
	edge32	%o3,	%g2,	%l0
	umulcc	%g3,	%i3,	%i2
	xnor	%o0,	%g7,	%o6
	movge	%icc,	%o4,	%i7
	fmovrsgez	%i1,	%f29,	%f0
	movrne	%g4,	0x107,	%g5
	sra	%i5,	0x15,	%l5
	sdivx	%i6,	0x1ABA,	%l1
	stx	%g6,	[%l7 + 0x20]
	fpack16	%f8,	%f27
	edge8	%g1,	%i4,	%l2
	movleu	%xcc,	%o7,	%o2
	subc	%l4,	%o1,	%l3
	fmovsn	%icc,	%f13,	%f27
	ldsh	[%l7 + 0x28],	%l6
	edge32ln	%o5,	%i0,	%g2
	stx	%l0,	[%l7 + 0x40]
	sir	0x0BAA
	addcc	%g3,	%i3,	%i2
	subcc	%o3,	0x0F9B,	%g7
	edge32n	%o6,	%o4,	%o0
	subccc	%i7,	%g4,	%i1
	alignaddr	%g5,	%i5,	%i6
	srlx	%l1,	%g6,	%l5
	sth	%i4,	[%l7 + 0x5E]
	mova	%xcc,	%l2,	%o7
	stw	%g1,	[%l7 + 0x10]
	std	%f0,	[%l7 + 0x40]
	fmovdleu	%xcc,	%f29,	%f17
	alignaddrl	%l4,	%o1,	%l3
	fnot2	%f8,	%f30
	stw	%o2,	[%l7 + 0x1C]
	st	%f1,	[%l7 + 0x40]
	stb	%o5,	[%l7 + 0x37]
	fpack16	%f14,	%f30
	udivx	%l6,	0x14E3,	%i0
	fmovdle	%xcc,	%f8,	%f11
	addcc	%l0,	0x08DA,	%g2
	sethi	0x06B3,	%i3
	movg	%icc,	%g3,	%o3
	orncc	%g7,	%o6,	%i2
	addcc	%o0,	0x0E1C,	%o4
	fnegs	%f18,	%f2
	udiv	%i7,	0x0AD6,	%i1
	fors	%f9,	%f3,	%f15
	ldsb	[%l7 + 0x6E],	%g5
	edge16l	%i5,	%g4,	%i6
	movrgz	%g6,	0x116,	%l5
	fabsd	%f20,	%f18
	movrne	%i4,	%l1,	%l2
	addc	%o7,	0x115F,	%l4
	lduh	[%l7 + 0x2E],	%o1
	andn	%g1,	%o2,	%l3
	srl	%o5,	0x13,	%i0
	sethi	0x1D98,	%l0
	fands	%f18,	%f6,	%f27
	fpsub16	%f30,	%f0,	%f24
	movpos	%xcc,	%g2,	%i3
	orcc	%g3,	%l6,	%g7
	edge8	%o6,	%o3,	%i2
	edge8ln	%o0,	%o4,	%i7
	edge16ln	%g5,	%i5,	%i1
	alignaddr	%g4,	%i6,	%l5
	edge32ln	%g6,	%i4,	%l2
	fcmpgt32	%f22,	%f0,	%o7
	smulcc	%l1,	0x148A,	%l4
	fxnor	%f12,	%f30,	%f24
	nop
	set	0x1C, %o5
	stb	%o1,	[%l7 + %o5]
	fmovdpos	%icc,	%f8,	%f2
	mulscc	%o2,	0x17E3,	%g1
	subccc	%l3,	0x113C,	%i0
	fpack16	%f18,	%f30
	andn	%o5,	0x1744,	%l0
	movneg	%icc,	%g2,	%i3
	sdivx	%g3,	0x13F7,	%l6
	sdivcc	%o6,	0x19B9,	%o3
	movrgez	%g7,	0x0D3,	%i2
	movg	%icc,	%o4,	%o0
	fnot2s	%f24,	%f5
	andcc	%i7,	%g5,	%i1
	umul	%i5,	0x1EFF,	%i6
	movrne	%g4,	%g6,	%l5
	edge8n	%i4,	%o7,	%l2
	edge8ln	%l4,	%o1,	%o2
	fmovscs	%xcc,	%f18,	%f12
	xnor	%l1,	0x0B93,	%l3
	orn	%g1,	0x01C0,	%o5
	or	%i0,	%g2,	%l0
	fmuld8sux16	%f31,	%f11,	%f14
	array8	%g3,	%i3,	%o6
	udiv	%l6,	0x1B87,	%g7
	subcc	%i2,	0x0BEB,	%o3
	mova	%xcc,	%o4,	%i7
	movne	%icc,	%g5,	%o0
	stx	%i1,	[%l7 + 0x38]
	fpadd32s	%f25,	%f16,	%f17
	movcc	%xcc,	%i6,	%i5
	fmovdpos	%xcc,	%f20,	%f16
	movrlz	%g4,	%g6,	%l5
	stx	%i4,	[%l7 + 0x18]
	lduh	[%l7 + 0x32],	%l2
	edge8n	%l4,	%o1,	%o2
	addc	%l1,	%o7,	%l3
	stw	%g1,	[%l7 + 0x58]
	subccc	%i0,	%g2,	%o5
	fmul8ulx16	%f14,	%f8,	%f16
	stb	%g3,	[%l7 + 0x79]
	fcmple16	%f4,	%f14,	%l0
	ldsh	[%l7 + 0x44],	%o6
	subccc	%i3,	%l6,	%i2
	addcc	%g7,	0x1BA8,	%o4
	save %o3, %i7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o0,	0x026,	%i1
	fmovsleu	%xcc,	%f20,	%f5
	movrlz	%i6,	0x2CB,	%i5
	orn	%g6,	0x0518,	%g4
	stb	%i4,	[%l7 + 0x4E]
	movle	%icc,	%l2,	%l4
	edge16ln	%o1,	%o2,	%l1
	ldx	[%l7 + 0x10],	%o7
	fmul8x16	%f27,	%f2,	%f18
	ld	[%l7 + 0x2C],	%f18
	edge32	%l5,	%l3,	%g1
	movcc	%xcc,	%g2,	%o5
	movg	%icc,	%i0,	%g3
	xnorcc	%l0,	0x1DEC,	%o6
	edge16	%l6,	%i3,	%i2
	sll	%o4,	0x1A,	%o3
	sdivx	%g7,	0x1836,	%i7
	xorcc	%o0,	%i1,	%g5
	movrlez	%i6,	0x295,	%g6
	movrgz	%i5,	0x27B,	%g4
	fmovrse	%i4,	%f10,	%f4
	movn	%icc,	%l2,	%o1
	movgu	%icc,	%o2,	%l4
	stw	%o7,	[%l7 + 0x40]
	udivx	%l5,	0x002A,	%l3
	udivcc	%g1,	0x0785,	%g2
	fandnot1	%f16,	%f8,	%f14
	fmul8x16	%f24,	%f4,	%f16
	movneg	%xcc,	%l1,	%i0
	smulcc	%o5,	%g3,	%o6
	srl	%l0,	0x1B,	%l6
	fmovdle	%xcc,	%f28,	%f7
	movcs	%icc,	%i2,	%i3
	udivcc	%o4,	0x1CB0,	%o3
	ldsw	[%l7 + 0x58],	%g7
	fcmpne32	%f26,	%f30,	%i7
	fmul8ulx16	%f0,	%f16,	%f28
	sdivcc	%i1,	0x16A4,	%o0
	edge16n	%g5,	%g6,	%i6
	edge32	%i5,	%g4,	%i4
	xnorcc	%l2,	0x0830,	%o1
	and	%l4,	0x1EAC,	%o2
	movn	%icc,	%l5,	%o7
	orncc	%g1,	0x1931,	%l3
	edge8	%g2,	%l1,	%o5
	st	%f1,	[%l7 + 0x1C]
	st	%f15,	[%l7 + 0x7C]
	alignaddr	%g3,	%o6,	%l0
	mulx	%i0,	0x1207,	%i2
	fmovrslez	%i3,	%f18,	%f30
	movrgez	%o4,	%o3,	%g7
	alignaddr	%i7,	%i1,	%o0
	movvs	%icc,	%g5,	%g6
	ldd	[%l7 + 0x18],	%i6
	stw	%i5,	[%l7 + 0x2C]
	mulscc	%g4,	0x05AB,	%i4
	ldsh	[%l7 + 0x40],	%i6
	edge16l	%o1,	%l4,	%o2
	sethi	0x0E8A,	%l5
	xor	%l2,	0x169B,	%o7
	edge32ln	%l3,	%g2,	%g1
	save %o5, 0x0831, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g3,	%l0,	%o6
	st	%f27,	[%l7 + 0x34]
	srlx	%i2,	0x0C,	%i3
	nop
	set	0x7F, %o1
	ldsb	[%l7 + %o1],	%o4
	udiv	%i0,	0x065A,	%g7
	movle	%xcc,	%i7,	%o3
	restore %o0, 0x036E, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i1,	%l6,	%i5
	fpsub16s	%f27,	%f24,	%f22
	lduw	[%l7 + 0x34],	%g4
	edge16ln	%g6,	%i6,	%i4
	movne	%icc,	%l4,	%o1
	fmovrsne	%o2,	%f4,	%f28
	stx	%l5,	[%l7 + 0x48]
	fnor	%f20,	%f16,	%f22
	fpackfix	%f10,	%f26
	and	%o7,	%l3,	%l2
	fcmpd	%fcc3,	%f2,	%f10
	movl	%icc,	%g2,	%o5
	andncc	%l1,	%g3,	%g1
	ldx	[%l7 + 0x70],	%o6
	edge16	%l0,	%i3,	%i2
	popc	0x1FBB,	%o4
	addc	%g7,	%i0,	%o3
	edge32ln	%o0,	%g5,	%i1
	edge8ln	%i7,	%i5,	%g4
	movpos	%icc,	%l6,	%g6
	movrgz	%i6,	%i4,	%o1
	fones	%f0
	sdivx	%l4,	0x1B74,	%o2
	umul	%o7,	%l5,	%l3
	edge16n	%l2,	%o5,	%l1
	xorcc	%g2,	0x0F50,	%g1
	ldd	[%l7 + 0x30],	%g2
	movne	%icc,	%o6,	%i3
	orcc	%l0,	0x0C54,	%o4
	addcc	%i2,	%i0,	%g7
	sdiv	%o0,	0x0426,	%g5
	movrgz	%i1,	0x135,	%o3
	addcc	%i7,	0x1050,	%i5
	fpadd32s	%f4,	%f11,	%f8
	sdivcc	%l6,	0x11E9,	%g6
	ldsb	[%l7 + 0x18],	%g4
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	subc	%l4,	%i4,	%o2
	movrne	%l5,	0x307,	%l3
	xnor	%o7,	0x19F1,	%l2
	orncc	%l1,	0x1E34,	%o5
	sdiv	%g1,	0x027A,	%g3
	array16	%o6,	%g2,	%i3
	movrne	%o4,	0x2C3,	%l0
	stw	%i0,	[%l7 + 0x40]
	udivx	%i2,	0x1BDB,	%g7
	movvc	%icc,	%g5,	%i1
	edge32ln	%o0,	%o3,	%i7
	fmovdge	%xcc,	%f6,	%f26
	st	%f19,	[%l7 + 0x18]
	fzeros	%f0
	edge16	%l6,	%i5,	%g6
	fzero	%f2
	fmovdge	%xcc,	%f18,	%f15
	movcs	%xcc,	%i6,	%o1
	fpack32	%f12,	%f28,	%f8
	umulcc	%g4,	0x1167,	%i4
	ldsh	[%l7 + 0x26],	%o2
	edge16l	%l5,	%l4,	%o7
	movvc	%icc,	%l2,	%l3
	movneg	%xcc,	%l1,	%o5
	sllx	%g1,	%g3,	%g2
	mova	%xcc,	%i3,	%o4
	fnot2	%f24,	%f22
	subccc	%o6,	%i0,	%i2
	subcc	%l0,	0x0A3C,	%g5
	fnand	%f30,	%f18,	%f8
	array8	%i1,	%g7,	%o3
	movl	%xcc,	%o0,	%l6
	array32	%i7,	%i5,	%g6
	fpsub16s	%f20,	%f11,	%f20
	fpmerge	%f22,	%f25,	%f24
	fpackfix	%f2,	%f30
	ldd	[%l7 + 0x38],	%f22
	nop
	set	0x40, %i2
	stx	%o1,	[%l7 + %i2]
	fcmps	%fcc0,	%f27,	%f26
	sllx	%i6,	0x11,	%i4
	nop
	set	0x74, %l5
	ldsw	[%l7 + %l5],	%o2
	ldsh	[%l7 + 0x30],	%g4
	fmovdl	%icc,	%f17,	%f14
	stb	%l4,	[%l7 + 0x76]
	edge8n	%l5,	%o7,	%l2
	move	%xcc,	%l1,	%l3
	fnot1	%f6,	%f28
	movrlz	%g1,	0x310,	%o5
	and	%g2,	0x172C,	%g3
	fmovsn	%icc,	%f0,	%f16
	xnorcc	%i3,	0x039A,	%o4
	movrgez	%o6,	0x2EF,	%i0
	movle	%xcc,	%l0,	%i2
	umul	%i1,	0x00A6,	%g5
	edge16l	%g7,	%o3,	%o0
	fmovrsne	%i7,	%f23,	%f0
	sra	%i5,	0x0E,	%l6
	fmovse	%icc,	%f27,	%f14
	array8	%g6,	%o1,	%i6
	fandnot1	%f22,	%f26,	%f18
	fmovsl	%xcc,	%f6,	%f14
	edge8n	%o2,	%i4,	%l4
	subc	%l5,	0x0983,	%o7
	xorcc	%l2,	0x025B,	%l1
	mova	%icc,	%l3,	%g1
	fmuld8ulx16	%f17,	%f27,	%f22
	fnot2s	%f21,	%f28
	fandnot1s	%f3,	%f0,	%f28
	edge16	%g4,	%g2,	%o5
	sllx	%i3,	0x0F,	%o4
	fcmpeq32	%f14,	%f10,	%o6
	xorcc	%i0,	0x05E5,	%g3
	fxor	%f8,	%f6,	%f0
	addcc	%l0,	0x1B62,	%i2
	movl	%xcc,	%i1,	%g5
	alignaddrl	%g7,	%o3,	%o0
	edge16	%i5,	%i7,	%l6
	sdivx	%o1,	0x1685,	%g6
	save %i6, %i4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l5,	0x2A0,	%o7
	and	%l4,	0x0947,	%l2
	movne	%xcc,	%l3,	%l1
	movle	%xcc,	%g4,	%g2
	fpadd32	%f8,	%f30,	%f4
	movrgez	%g1,	%i3,	%o5
	edge32n	%o4,	%i0,	%g3
	edge32l	%o6,	%i2,	%l0
	movrgz	%g5,	%g7,	%i1
	fxors	%f8,	%f1,	%f22
	movre	%o0,	0x3DE,	%i5
	udivcc	%o3,	0x1A42,	%i7
	edge16ln	%o1,	%l6,	%i6
	srlx	%g6,	0x07,	%i4
	mova	%icc,	%o2,	%o7
	addc	%l5,	%l2,	%l4
	fabss	%f16,	%f20
	udivx	%l3,	0x08B4,	%l1
	fcmpgt32	%f6,	%f6,	%g4
	xnorcc	%g1,	%g2,	%o5
	fmovsleu	%xcc,	%f29,	%f27
	fnegd	%f0,	%f30
	xnorcc	%o4,	%i3,	%g3
	fmovsne	%icc,	%f18,	%f13
	add	%o6,	%i0,	%i2
	addcc	%l0,	0x0375,	%g7
	sethi	0x04CF,	%i1
	ldsb	[%l7 + 0x5D],	%o0
	fpadd16	%f14,	%f18,	%f30
	or	%i5,	%g5,	%o3
	fpack16	%f6,	%f19
	std	%f10,	[%l7 + 0x08]
	movge	%icc,	%o1,	%i7
	umul	%l6,	0x1CAC,	%g6
	udiv	%i6,	0x12AA,	%o2
	fmovde	%icc,	%f0,	%f2
	fabsd	%f2,	%f30
	save %i4, %o7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f25,	%f29
	xnor	%l4,	%l3,	%l1
	orn	%l5,	0x104E,	%g4
	mova	%xcc,	%g1,	%o5
	movn	%xcc,	%o4,	%i3
	fandnot1s	%f25,	%f9,	%f0
	umulcc	%g3,	0x0327,	%g2
	fmul8ulx16	%f4,	%f20,	%f26
	movrgez	%o6,	%i0,	%l0
	sethi	0x1AD9,	%i2
	smul	%g7,	0x1B21,	%i1
	fmovsleu	%xcc,	%f8,	%f22
	orcc	%o0,	%i5,	%o3
	andcc	%o1,	%g5,	%l6
	sethi	0x0183,	%i7
	fnands	%f4,	%f30,	%f12
	movle	%icc,	%g6,	%o2
	subc	%i4,	0x17EA,	%i6
	orncc	%l2,	0x06B5,	%l4
	movrgez	%o7,	%l1,	%l3
	lduw	[%l7 + 0x74],	%g4
	xorcc	%g1,	0x1E3C,	%l5
	std	%f0,	[%l7 + 0x70]
	fmovsne	%xcc,	%f4,	%f3
	movrne	%o4,	0x2AA,	%o5
	fnegs	%f17,	%f26
	subccc	%g3,	0x144A,	%g2
	fnor	%f10,	%f0,	%f12
	mova	%xcc,	%o6,	%i0
	mulx	%i3,	%l0,	%i2
	sir	0x0B69
	movle	%icc,	%g7,	%o0
	srlx	%i1,	%i5,	%o1
	xor	%o3,	0x1E45,	%g5
	sir	0x1D52
	smulcc	%l6,	%i7,	%g6
	fmovsge	%icc,	%f17,	%f21
	alignaddr	%o2,	%i4,	%l2
	array32	%i6,	%o7,	%l1
	addc	%l3,	%g4,	%l4
	ldd	[%l7 + 0x18],	%f22
	and	%g1,	%o4,	%o5
	umulcc	%g3,	%l5,	%g2
	array16	%o6,	%i0,	%i3
	edge32n	%i2,	%g7,	%o0
	fmovspos	%icc,	%f0,	%f5
	xnor	%l0,	0x12F9,	%i1
	save %i5, %o3, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l6,	%i7,	%g6
	movvs	%xcc,	%o2,	%i4
	edge32ln	%o1,	%i6,	%o7
	popc	%l2,	%l1
	addcc	%l3,	0x00AF,	%g4
	fornot1	%f0,	%f16,	%f0
	fmovsl	%icc,	%f15,	%f3
	subcc	%g1,	%o4,	%l4
	movn	%xcc,	%g3,	%o5
	subc	%l5,	%o6,	%g2
	ldub	[%l7 + 0x5E],	%i3
	movge	%icc,	%i2,	%g7
	lduh	[%l7 + 0x46],	%i0
	movvc	%xcc,	%l0,	%o0
	edge16	%i5,	%o3,	%i1
	ldx	[%l7 + 0x40],	%l6
	fandnot1s	%f12,	%f6,	%f24
	movne	%xcc,	%i7,	%g6
	fmovsge	%xcc,	%f5,	%f19
	fmuld8sux16	%f29,	%f20,	%f0
	xorcc	%g5,	0x0C1D,	%o2
	fmovrdgz	%i4,	%f22,	%f28
	fpmerge	%f16,	%f9,	%f0
	fmovdn	%icc,	%f31,	%f26
	movleu	%xcc,	%o1,	%i6
	xnorcc	%l2,	0x1F1C,	%l1
	lduw	[%l7 + 0x3C],	%o7
	edge32n	%g4,	%l3,	%o4
	mulx	%g1,	0x0C09,	%l4
	addcc	%o5,	%l5,	%o6
	movvc	%icc,	%g3,	%g2
	edge8l	%i2,	%i3,	%i0
	fcmpne16	%f16,	%f28,	%l0
	umul	%g7,	%o0,	%i5
	sth	%i1,	[%l7 + 0x08]
	fmovsneg	%icc,	%f2,	%f19
	fmovrdlz	%o3,	%f2,	%f8
	edge16n	%i7,	%l6,	%g6
	edge8n	%g5,	%i4,	%o2
	sethi	0x15CD,	%i6
	addc	%o1,	%l1,	%l2
	ldsb	[%l7 + 0x48],	%g4
	xor	%l3,	0x1335,	%o7
	sll	%g1,	%l4,	%o5
	fmul8x16au	%f9,	%f28,	%f6
	edge16l	%o4,	%l5,	%o6
	mova	%xcc,	%g2,	%i2
	edge16n	%g3,	%i0,	%l0
	mulx	%i3,	0x11D6,	%g7
	umul	%o0,	0x0284,	%i1
	edge16l	%o3,	%i5,	%l6
	ldsh	[%l7 + 0x48],	%g6
	fcmpne32	%f30,	%f2,	%g5
	popc	%i7,	%i4
	fnegs	%f0,	%f8
	movrgez	%o2,	%i6,	%o1
	sethi	0x1212,	%l2
	movrne	%g4,	%l3,	%l1
	ldsb	[%l7 + 0x58],	%o7
	array32	%l4,	%g1,	%o5
	nop
	set	0x30, %g7
	std	%f24,	[%l7 + %g7]
	edge32	%o4,	%l5,	%o6
	fpadd32	%f8,	%f2,	%f18
	save %i2, %g2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i0,	%i3,	%g7
	stw	%o0,	[%l7 + 0x44]
	edge16n	%i1,	%o3,	%i5
	fandnot2	%f0,	%f12,	%f16
	movvc	%icc,	%l0,	%l6
	movn	%xcc,	%g6,	%g5
	stb	%i7,	[%l7 + 0x1D]
	array32	%i4,	%i6,	%o1
	sll	%o2,	%g4,	%l3
	srl	%l1,	%l2,	%l4
	stb	%g1,	[%l7 + 0x30]
	movleu	%xcc,	%o7,	%o4
	movrne	%o5,	%l5,	%i2
	movvs	%xcc,	%g2,	%o6
	movrgez	%g3,	0x329,	%i0
	stx	%g7,	[%l7 + 0x68]
	fpmerge	%f5,	%f10,	%f12
	sub	%o0,	0x0147,	%i3
	pdist	%f22,	%f4,	%f10
	srax	%o3,	0x10,	%i5
	udiv	%i1,	0x03E4,	%l6
	movne	%icc,	%g6,	%g5
	addccc	%l0,	%i7,	%i4
	sth	%o1,	[%l7 + 0x30]
	nop
	set	0x11, %o2
	ldub	[%l7 + %o2],	%o2
	movg	%icc,	%i6,	%g4
	ld	[%l7 + 0x0C],	%f25
	sll	%l3,	0x1E,	%l2
	sub	%l1,	0x1A05,	%l4
	movne	%xcc,	%o7,	%g1
	andn	%o4,	0x1AFD,	%o5
	fxor	%f10,	%f4,	%f0
	edge32n	%l5,	%g2,	%i2
	st	%f26,	[%l7 + 0x68]
	udivcc	%g3,	0x1636,	%o6
	fmovrsgez	%i0,	%f2,	%f15
	nop
	set	0x57, %g5
	ldsb	[%l7 + %g5],	%o0
	movvc	%icc,	%g7,	%i3
	fmovdcs	%xcc,	%f1,	%f27
	movrlz	%i5,	0x059,	%i1
	fcmple32	%f14,	%f0,	%o3
	edge8ln	%g6,	%l6,	%g5
	fmovdne	%icc,	%f14,	%f20
	sra	%i7,	%l0,	%o1
	ldx	[%l7 + 0x60],	%i4
	ldsw	[%l7 + 0x64],	%i6
	subccc	%o2,	%l3,	%g4
	movn	%xcc,	%l2,	%l1
	ld	[%l7 + 0x0C],	%f27
	restore %l4, 0x1C86, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o7,	0x0432,	%o5
	edge8ln	%o4,	%l5,	%i2
	stb	%g2,	[%l7 + 0x45]
	smulcc	%g3,	%i0,	%o0
	fandnot2	%f4,	%f20,	%f30
	ldd	[%l7 + 0x70],	%f28
	mulscc	%o6,	0x11E4,	%i3
	fmovdge	%xcc,	%f27,	%f22
	sllx	%g7,	0x06,	%i1
	movge	%icc,	%i5,	%o3
	edge8n	%g6,	%g5,	%i7
	lduw	[%l7 + 0x68],	%l6
	addc	%o1,	0x1A55,	%l0
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	xnorcc	%o2,	0x12B9,	%l3
	sra	%g4,	%l1,	%l2
	edge8	%g1,	%l4,	%o7
	sdivx	%o4,	0x05A8,	%l5
	movvs	%icc,	%o5,	%i2
	st	%f30,	[%l7 + 0x38]
	movl	%xcc,	%g3,	%i0
	movne	%icc,	%o0,	%g2
	fmovdcc	%xcc,	%f3,	%f25
	fsrc1s	%f25,	%f12
	umul	%o6,	%g7,	%i3
	movge	%xcc,	%i5,	%o3
	movcc	%xcc,	%i1,	%g6
	addccc	%i7,	0x1113,	%l6
	movn	%xcc,	%o1,	%g5
	srlx	%l0,	%i4,	%o2
	lduw	[%l7 + 0x74],	%i6
	sethi	0x00D8,	%g4
	nop
	set	0x20, %i4
	stx	%l1,	[%l7 + %i4]
	ldd	[%l7 + 0x28],	%l2
	movre	%g1,	%l3,	%l4
	subccc	%o4,	%o7,	%l5
	fpack16	%f14,	%f29
	edge16ln	%o5,	%i2,	%g3
	orn	%o0,	%g2,	%i0
	sdivcc	%g7,	0x13DE,	%o6
	addcc	%i5,	0x0F62,	%o3
	fexpand	%f20,	%f14
	movle	%xcc,	%i1,	%g6
	sra	%i7,	0x16,	%i3
	fnot2s	%f23,	%f18
	addc	%l6,	0x17E4,	%g5
	movrlez	%l0,	%o1,	%i4
	sra	%i6,	%o2,	%l1
	ldd	[%l7 + 0x10],	%f8
	fandnot2	%f24,	%f28,	%f16
	mova	%xcc,	%g4,	%l2
	addcc	%l3,	0x08F4,	%g1
	subc	%l4,	%o7,	%o4
	movgu	%icc,	%l5,	%i2
	sll	%g3,	%o5,	%o0
	sethi	0x058A,	%i0
	srl	%g2,	0x09,	%g7
	xorcc	%i5,	0x004F,	%o3
	movle	%icc,	%i1,	%o6
	smul	%i7,	%g6,	%l6
	edge8n	%g5,	%i3,	%o1
	movl	%icc,	%l0,	%i4
	movvc	%xcc,	%o2,	%i6
	fnot2s	%f3,	%f11
	movrlz	%l1,	%l2,	%g4
	movg	%xcc,	%g1,	%l4
	ldd	[%l7 + 0x38],	%f28
	ldd	[%l7 + 0x20],	%f30
	fmuld8ulx16	%f6,	%f23,	%f10
	fmovs	%f5,	%f14
	fnegd	%f28,	%f2
	fornot2	%f30,	%f20,	%f2
	ldx	[%l7 + 0x20],	%o7
	sll	%l3,	%o4,	%l5
	ldub	[%l7 + 0x19],	%g3
	xnorcc	%i2,	0x1018,	%o5
	lduh	[%l7 + 0x1C],	%o0
	movrne	%g2,	0x10D,	%g7
	orncc	%i0,	0x1FF4,	%i5
	fmovsg	%icc,	%f31,	%f9
	movcc	%icc,	%i1,	%o3
	fmovrdgz	%o6,	%f14,	%f18
	fornot1s	%f9,	%f21,	%f10
	edge8ln	%g6,	%i7,	%g5
	sth	%l6,	[%l7 + 0x3C]
	umulcc	%i3,	%l0,	%i4
	sth	%o1,	[%l7 + 0x0A]
	xor	%o2,	0x1695,	%i6
	orn	%l1,	%g4,	%l2
	fmovdle	%icc,	%f11,	%f24
	sub	%g1,	0x0B61,	%l4
	stw	%l3,	[%l7 + 0x44]
	popc	%o4,	%l5
	std	%f12,	[%l7 + 0x68]
	edge16l	%g3,	%i2,	%o5
	ldd	[%l7 + 0x60],	%f14
	edge16n	%o0,	%o7,	%g2
	edge16	%g7,	%i5,	%i0
	fones	%f17
	fcmpne32	%f16,	%f22,	%o3
	fmovdvs	%xcc,	%f14,	%f14
	movge	%icc,	%i1,	%g6
	subcc	%o6,	%g5,	%l6
	popc	0x07D5,	%i7
	sdiv	%l0,	0x0AA5,	%i4
	addc	%i3,	0x0B63,	%o1
	fnegs	%f10,	%f26
	fornot2s	%f31,	%f11,	%f10
	sra	%i6,	%l1,	%o2
	subcc	%l2,	0x1034,	%g4
	smulcc	%g1,	0x14F2,	%l3
	std	%f8,	[%l7 + 0x30]
	std	%f12,	[%l7 + 0x30]
	movvc	%xcc,	%l4,	%o4
	fmovd	%f22,	%f30
	fpsub32s	%f26,	%f16,	%f8
	ldd	[%l7 + 0x10],	%f4
	ldd	[%l7 + 0x20],	%f20
	popc	%g3,	%i2
	srax	%o5,	0x03,	%o0
	sdivx	%l5,	0x1991,	%g2
	movpos	%xcc,	%o7,	%i5
	sdiv	%g7,	0x0DDE,	%o3
	sll	%i0,	%i1,	%o6
	ldub	[%l7 + 0x42],	%g6
	andn	%g5,	%i7,	%l6
	movrne	%i4,	%l0,	%o1
	movvc	%icc,	%i3,	%l1
	lduw	[%l7 + 0x3C],	%o2
	orncc	%l2,	%g4,	%g1
	fmovsa	%xcc,	%f30,	%f21
	sub	%l3,	%i6,	%o4
	array32	%l4,	%i2,	%g3
	umul	%o0,	0x19DF,	%l5
	fpsub16	%f8,	%f12,	%f24
	andn	%g2,	%o5,	%o7
	orn	%g7,	0x038C,	%i5
	ldsh	[%l7 + 0x4A],	%i0
	sdiv	%i1,	0x00F6,	%o3
	srax	%o6,	%g5,	%g6
	and	%i7,	%i4,	%l6
	fmovrse	%o1,	%f25,	%f30
	sdivcc	%l0,	0x0208,	%l1
	fmovdn	%icc,	%f19,	%f5
	orn	%i3,	0x06E1,	%l2
	smul	%g4,	%o2,	%g1
	add	%l3,	%o4,	%l4
	fpmerge	%f14,	%f17,	%f18
	movneg	%xcc,	%i6,	%i2
	addcc	%g3,	%l5,	%o0
	umul	%g2,	%o5,	%g7
	edge8	%i5,	%i0,	%o7
	srax	%o3,	%i1,	%o6
	movl	%xcc,	%g5,	%g6
	orncc	%i7,	0x0D2E,	%l6
	sir	0x0AB4
	umul	%i4,	0x17A0,	%l0
	movrlez	%o1,	0x330,	%l1
	fcmpeq32	%f26,	%f10,	%l2
	udiv	%g4,	0x058D,	%o2
	movgu	%xcc,	%g1,	%l3
	save %o4, 0x1ADE, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l4,	%i6,	%g3
	mulx	%l5,	0x1463,	%i2
	mova	%icc,	%g2,	%o0
	subc	%g7,	%o5,	%i0
	movl	%icc,	%o7,	%i5
	sdivcc	%o3,	0x114D,	%o6
	movpos	%xcc,	%i1,	%g6
	fandnot1s	%f23,	%f9,	%f30
	ldd	[%l7 + 0x48],	%f18
	fors	%f8,	%f11,	%f12
	smulcc	%i7,	0x04CF,	%l6
	movleu	%xcc,	%g5,	%i4
	stb	%l0,	[%l7 + 0x27]
	xnorcc	%l1,	%l2,	%o1
	srlx	%g4,	%o2,	%l3
	addcc	%o4,	0x1582,	%g1
	and	%i3,	0x151B,	%l4
	mulx	%i6,	%l5,	%g3
	andcc	%i2,	0x040E,	%o0
	movrgez	%g7,	%o5,	%i0
	edge32	%o7,	%i5,	%o3
	ld	[%l7 + 0x60],	%f31
	movcc	%xcc,	%g2,	%i1
	nop
	set	0x70, %g4
	stx	%g6,	[%l7 + %g4]
	srlx	%o6,	0x1D,	%i7
	or	%g5,	%i4,	%l6
	movl	%xcc,	%l0,	%l1
	movl	%icc,	%o1,	%l2
	fnegs	%f8,	%f11
	smul	%g4,	%l3,	%o2
	fmovrse	%o4,	%f23,	%f21
	edge8ln	%g1,	%l4,	%i3
	edge8l	%l5,	%i6,	%i2
	ldx	[%l7 + 0x30],	%g3
	fmul8x16al	%f9,	%f3,	%f20
	edge32ln	%o0,	%o5,	%g7
	fmovsneg	%icc,	%f14,	%f19
	ldd	[%l7 + 0x08],	%i0
	sethi	0x115A,	%o7
	fmovrslez	%o3,	%f0,	%f2
	ldx	[%l7 + 0x20],	%g2
	udiv	%i1,	0x067C,	%g6
	sllx	%o6,	%i7,	%g5
	nop
	set	0x68, %o6
	lduh	[%l7 + %o6],	%i4
	add	%i5,	0x1D79,	%l6
	sra	%l1,	0x01,	%l0
	sra	%l2,	%g4,	%l3
	xnor	%o1,	0x1F27,	%o4
	sir	0x0834
	edge8l	%g1,	%l4,	%o2
	fmovdl	%icc,	%f0,	%f19
	restore %l5, %i6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f22
	xnor	%i3,	%g3,	%o0
	fxnors	%f7,	%f24,	%f11
	sdiv	%o5,	0x0D27,	%g7
	ld	[%l7 + 0x68],	%f3
	lduh	[%l7 + 0x36],	%o7
	add	%i0,	0x16F1,	%o3
	fmovdvs	%xcc,	%f2,	%f4
	udivcc	%g2,	0x1EC3,	%g6
	alignaddr	%o6,	%i1,	%i7
	sll	%i4,	0x1C,	%g5
	stw	%l6,	[%l7 + 0x08]
	fnors	%f19,	%f0,	%f28
	xnorcc	%i5,	%l0,	%l1
	sdivx	%l2,	0x14EC,	%l3
	subccc	%o1,	0x13FB,	%g4
	fmovdgu	%icc,	%f30,	%f19
	orcc	%o4,	0x17AD,	%g1
	orncc	%l4,	%l5,	%o2
	fzeros	%f4
	movge	%xcc,	%i6,	%i2
	addcc	%i3,	0x05F1,	%g3
	fmovrsgz	%o5,	%f7,	%f18
	movcs	%xcc,	%o0,	%g7
	movrgez	%i0,	%o7,	%o3
	movrlz	%g6,	%o6,	%i1
	ld	[%l7 + 0x54],	%f27
	movrlez	%g2,	0x0BD,	%i7
	ldd	[%l7 + 0x48],	%g4
	fors	%f17,	%f24,	%f5
	andn	%i4,	%l6,	%i5
	fnot1	%f18,	%f10
	subc	%l1,	%l0,	%l2
	fmul8x16	%f28,	%f22,	%f6
	fsrc2	%f22,	%f8
	fone	%f20
	subccc	%l3,	0x16D1,	%g4
	edge32ln	%o4,	%g1,	%l4
	orn	%l5,	0x1D53,	%o2
	orncc	%o1,	%i6,	%i2
	movrgez	%g3,	0x302,	%o5
	fmovda	%icc,	%f5,	%f5
	sdiv	%o0,	0x15D0,	%g7
	movneg	%xcc,	%i0,	%o7
	for	%f24,	%f26,	%f26
	fmovdcc	%xcc,	%f16,	%f16
	movvs	%icc,	%i3,	%g6
	movcc	%icc,	%o3,	%i1
	edge32	%g2,	%i7,	%g5
	ldsh	[%l7 + 0x1A],	%i4
	fmovdvc	%icc,	%f21,	%f29
	movcc	%xcc,	%l6,	%o6
	smul	%l1,	%l0,	%i5
	orcc	%l2,	%l3,	%o4
	popc	%g4,	%l4
	smulcc	%l5,	%o2,	%o1
	fcmpgt16	%f2,	%f0,	%i6
	movvs	%xcc,	%g1,	%i2
	fors	%f16,	%f8,	%f31
	fmovsn	%icc,	%f9,	%f15
	xor	%o5,	%o0,	%g7
	srax	%i0,	%g3,	%o7
	fcmple16	%f24,	%f14,	%g6
	movvc	%icc,	%o3,	%i1
	udivx	%g2,	0x0D00,	%i7
	movle	%icc,	%g5,	%i4
	fnor	%f24,	%f6,	%f20
	edge16l	%i3,	%l6,	%l1
	movn	%icc,	%l0,	%i5
	fnot2s	%f26,	%f21
	xnorcc	%o6,	0x1E33,	%l2
	edge32ln	%o4,	%g4,	%l3
	fmovrse	%l5,	%f2,	%f0
	andncc	%o2,	%l4,	%o1
	std	%f18,	[%l7 + 0x78]
	sub	%i6,	%g1,	%i2
	sub	%o5,	0x1600,	%o0
	movne	%icc,	%i0,	%g7
	ldx	[%l7 + 0x48],	%o7
	pdist	%f12,	%f28,	%f22
	fpackfix	%f6,	%f21
	movrlez	%g6,	0x014,	%g3
	movleu	%icc,	%o3,	%i1
	srl	%i7,	%g5,	%g2
	sdiv	%i3,	0x19FE,	%l6
	fmuld8ulx16	%f11,	%f9,	%f0
	st	%f27,	[%l7 + 0x68]
	sdiv	%l1,	0x1CF5,	%i4
	array8	%i5,	%o6,	%l2
	movpos	%icc,	%o4,	%g4
	andn	%l3,	0x1D42,	%l5
	edge16ln	%o2,	%l0,	%o1
	fmovsvc	%icc,	%f21,	%f8
	mulx	%i6,	0x0D64,	%l4
	movpos	%icc,	%g1,	%i2
	edge32ln	%o5,	%i0,	%g7
	fmovdle	%xcc,	%f11,	%f30
	addc	%o0,	0x14D1,	%o7
	sdivx	%g6,	0x1167,	%g3
	fmovrde	%i1,	%f12,	%f20
	movcs	%xcc,	%o3,	%g5
	sllx	%g2,	0x16,	%i7
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	popc	%i4,	%i5
	orn	%o6,	0x064B,	%l2
	movrgz	%o4,	%l3,	%g4
	fcmpeq16	%f24,	%f0,	%o2
	edge16n	%l0,	%l5,	%i6
	addcc	%l4,	0x153A,	%o1
	fnegd	%f12,	%f28
	ldsw	[%l7 + 0x24],	%g1
	fcmpeq32	%f0,	%f2,	%i2
	ldsb	[%l7 + 0x32],	%i0
	fmovdle	%xcc,	%f17,	%f13
	movrgz	%o5,	%o0,	%g7
	sth	%g6,	[%l7 + 0x32]
	edge16	%o7,	%g3,	%i1
	movrgez	%o3,	%g2,	%i7
	subccc	%g5,	0x0BF7,	%i3
	fnands	%f28,	%f13,	%f26
	smulcc	%l1,	0x050F,	%l6
	fmovrde	%i5,	%f22,	%f26
	add	%o6,	0x07B7,	%l2
	array16	%i4,	%o4,	%g4
	orn	%o2,	0x1B04,	%l0
	orcc	%l3,	%l5,	%i6
	fmovrdgez	%l4,	%f8,	%f18
	sub	%o1,	%g1,	%i0
	edge32n	%o5,	%i2,	%g7
	xorcc	%o0,	0x1C5F,	%g6
	ldsb	[%l7 + 0x25],	%o7
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%f28
	add	%g3,	%i1,	%g2
	sir	0x0250
	mova	%xcc,	%i7,	%o3
	alignaddrl	%g5,	%l1,	%l6
	orncc	%i3,	%o6,	%i5
	fandnot1s	%f8,	%f0,	%f22
	sethi	0x1E91,	%l2
	movrlz	%i4,	0x28A,	%o4
	srlx	%o2,	%g4,	%l3
	lduw	[%l7 + 0x50],	%l0
	stw	%i6,	[%l7 + 0x74]
	nop
	set	0x69, %l1
	ldub	[%l7 + %l1],	%l4
	movge	%xcc,	%l5,	%o1
	stb	%g1,	[%l7 + 0x14]
	mulx	%i0,	%i2,	%g7
	ldsw	[%l7 + 0x74],	%o5
	umulcc	%g6,	%o7,	%o0
	sdiv	%i1,	0x0EFF,	%g2
	sllx	%i7,	0x01,	%o3
	fnot2s	%f24,	%f23
	sdivcc	%g5,	0x0915,	%l1
	nop
	set	0x08, %i1
	ldsw	[%l7 + %i1],	%g3
	movneg	%xcc,	%l6,	%o6
	fmovsleu	%xcc,	%f12,	%f10
	movrgz	%i3,	0x2CB,	%l2
	move	%icc,	%i5,	%o4
	fpadd16	%f28,	%f14,	%f24
	sub	%o2,	0x0344,	%g4
	srax	%l3,	0x00,	%i4
	st	%f11,	[%l7 + 0x18]
	fpackfix	%f28,	%f30
	sir	0x1A8E
	fmovscs	%xcc,	%f21,	%f12
	xnorcc	%i6,	%l0,	%l5
	fcmpne16	%f16,	%f24,	%o1
	movne	%icc,	%l4,	%i0
	movcc	%xcc,	%i2,	%g7
	fpadd32s	%f0,	%f25,	%f1
	fpsub32	%f0,	%f28,	%f0
	udivx	%o5,	0x0959,	%g6
	orcc	%o7,	0x19F1,	%g1
	edge32n	%i1,	%g2,	%o0
	edge8ln	%i7,	%g5,	%l1
	fxnors	%f17,	%f1,	%f7
	mulscc	%o3,	0x0652,	%l6
	movrne	%o6,	%g3,	%l2
	movvs	%xcc,	%i5,	%i3
	movcs	%xcc,	%o4,	%g4
	add	%o2,	%l3,	%i4
	subcc	%l0,	0x17B7,	%l5
	or	%i6,	0x0536,	%l4
	fmovsleu	%icc,	%f4,	%f24
	fones	%f25
	lduh	[%l7 + 0x42],	%o1
	addc	%i2,	0x14CD,	%i0
	move	%icc,	%g7,	%g6
	sdivx	%o5,	0x118C,	%g1
	save %i1, 0x0BCF, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %o0, 0x1E53, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o7,	%l1,	%o3
	movleu	%xcc,	%g5,	%l6
	array32	%g3,	%o6,	%i5
	fcmpd	%fcc0,	%f14,	%f30
	sdivx	%i3,	0x1853,	%l2
	alignaddrl	%o4,	%g4,	%l3
	orcc	%o2,	0x1B7D,	%l0
	andncc	%l5,	%i4,	%i6
	alignaddrl	%o1,	%l4,	%i0
	edge32l	%i2,	%g7,	%g6
	orcc	%g1,	%o5,	%g2
	fmovsneg	%icc,	%f2,	%f16
	edge32l	%o0,	%i7,	%o7
	stx	%l1,	[%l7 + 0x10]
	edge32l	%i1,	%o3,	%g5
	edge32	%l6,	%g3,	%o6
	fcmped	%fcc0,	%f2,	%f0
	mulx	%i5,	0x1683,	%l2
	popc	%i3,	%g4
	fmovdle	%icc,	%f17,	%f16
	fandnot2s	%f29,	%f25,	%f16
	fmul8x16au	%f21,	%f2,	%f10
	mulscc	%l3,	%o4,	%l0
	fmovde	%xcc,	%f1,	%f20
	fmovsleu	%icc,	%f16,	%f19
	movl	%xcc,	%o2,	%i4
	mova	%xcc,	%l5,	%i6
	subcc	%l4,	%o1,	%i0
	andncc	%i2,	%g6,	%g1
	fcmpgt16	%f14,	%f12,	%g7
	fsrc1s	%f23,	%f2
	fmovrslz	%o5,	%f4,	%f0
	fexpand	%f18,	%f18
	movrlz	%o0,	0x091,	%g2
	orcc	%o7,	%l1,	%i1
	stx	%o3,	[%l7 + 0x30]
	movvs	%icc,	%g5,	%i7
	fpack16	%f28,	%f9
	stw	%g3,	[%l7 + 0x10]
	andn	%l6,	%o6,	%i5
	lduw	[%l7 + 0x48],	%l2
	movge	%icc,	%i3,	%l3
	fmovsg	%xcc,	%f7,	%f24
	fmovdg	%icc,	%f23,	%f1
	fmovrdgez	%g4,	%f30,	%f12
	xnor	%o4,	%l0,	%i4
	srlx	%l5,	0x1E,	%o2
	edge16	%l4,	%o1,	%i6
	edge16	%i2,	%g6,	%i0
	fcmpeq16	%f24,	%f0,	%g1
	fzeros	%f22
	xor	%g7,	0x1C0A,	%o0
	fandnot2	%f18,	%f28,	%f16
	movcs	%xcc,	%g2,	%o5
	srlx	%l1,	0x1B,	%i1
	ldx	[%l7 + 0x20],	%o3
	alignaddrl	%o7,	%i7,	%g5
	std	%f10,	[%l7 + 0x40]
	smulcc	%l6,	%g3,	%o6
	fxnor	%f2,	%f16,	%f30
	movle	%icc,	%i5,	%l2
	movre	%l3,	0x100,	%i3
	movpos	%icc,	%o4,	%l0
	mulscc	%i4,	0x0F2D,	%g4
	popc	%o2,	%l4
	srlx	%o1,	%i6,	%l5
	ldsb	[%l7 + 0x59],	%g6
	movg	%xcc,	%i2,	%i0
	ldsw	[%l7 + 0x20],	%g7
	std	%f16,	[%l7 + 0x78]
	sir	0x0090
	orcc	%g1,	%g2,	%o0
	movl	%icc,	%o5,	%i1
	fcmpes	%fcc1,	%f19,	%f18
	stx	%o3,	[%l7 + 0x08]
	edge8l	%o7,	%i7,	%g5
	edge8n	%l1,	%l6,	%o6
	srlx	%g3,	%i5,	%l3
	movg	%xcc,	%l2,	%o4
	movre	%l0,	%i4,	%i3
	movrne	%g4,	%o2,	%o1
	xorcc	%i6,	0x1645,	%l5
	sdivx	%l4,	0x02DA,	%i2
	edge32l	%i0,	%g7,	%g6
	movg	%xcc,	%g1,	%g2
	ldd	[%l7 + 0x78],	%f0
	ldsb	[%l7 + 0x38],	%o0
	fmovdg	%icc,	%f31,	%f10
	sethi	0x0948,	%i1
	edge16ln	%o5,	%o7,	%i7
	fmul8x16au	%f25,	%f10,	%f22
	orn	%g5,	%o3,	%l6
	fmovrdne	%l1,	%f22,	%f2
	movvs	%icc,	%o6,	%g3
	sdivcc	%i5,	0x1EC1,	%l3
	or	%o4,	0x1D41,	%l2
	array8	%l0,	%i4,	%g4
	sir	0x0A39
	sdivx	%i3,	0x0BD4,	%o1
	siam	0x2
	sllx	%o2,	0x0B,	%l5
	movpos	%xcc,	%l4,	%i2
	movgu	%icc,	%i6,	%g7
	fmovrse	%g6,	%f3,	%f22
	smul	%i0,	0x08ED,	%g1
	edge16l	%o0,	%g2,	%i1
	sub	%o7,	%o5,	%i7
	movre	%o3,	%g5,	%l1
	andncc	%l6,	%g3,	%i5
	movrne	%l3,	0x1A7,	%o6
	fnor	%f20,	%f22,	%f30
	sra	%l2,	%o4,	%l0
	ldsh	[%l7 + 0x1E],	%i4
	movne	%xcc,	%g4,	%o1
	mulscc	%o2,	%i3,	%l5
	lduw	[%l7 + 0x70],	%i2
	fmovscc	%icc,	%f6,	%f27
	fsrc2s	%f16,	%f18
	movne	%icc,	%l4,	%i6
	umul	%g7,	%i0,	%g6
	fmul8ulx16	%f2,	%f22,	%f22
	fnors	%f28,	%f9,	%f14
	movvs	%icc,	%o0,	%g2
	edge8l	%g1,	%i1,	%o7
	fmovdvs	%icc,	%f9,	%f1
	fnot2	%f28,	%f0
	movgu	%xcc,	%i7,	%o5
	movrgez	%g5,	0x344,	%l1
	sll	%l6,	%g3,	%i5
	fmovsgu	%icc,	%f17,	%f29
	ldub	[%l7 + 0x35],	%o3
	umulcc	%l3,	0x02A7,	%o6
	umul	%l2,	%l0,	%i4
	edge16	%o4,	%o1,	%o2
	addccc	%g4,	0x0D6D,	%i3
	add	%l5,	%i2,	%l4
	subccc	%g7,	0x02EB,	%i6
	movgu	%xcc,	%i0,	%g6
	save %o0, %g1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o7,	%i1,	%o5
	movvc	%icc,	%g5,	%l1
	std	%f26,	[%l7 + 0x78]
	array16	%i7,	%l6,	%i5
	sethi	0x13C5,	%g3
	fmovsgu	%xcc,	%f7,	%f12
	mulx	%o3,	0x03F7,	%l3
	array32	%o6,	%l2,	%i4
	stw	%o4,	[%l7 + 0x24]
	movl	%icc,	%o1,	%l0
	sllx	%o2,	%i3,	%l5
	movrgz	%i2,	0x05E,	%l4
	movleu	%xcc,	%g7,	%i6
	srax	%i0,	0x12,	%g6
	subccc	%o0,	%g4,	%g1
	andncc	%g2,	%i1,	%o5
	nop
	set	0x10, %g3
	stw	%g5,	[%l7 + %g3]
	fexpand	%f4,	%f4
	smulcc	%o7,	%l1,	%i7
	andncc	%i5,	%g3,	%o3
	mulscc	%l3,	0x0464,	%l6
	add	%o6,	0x171D,	%l2
	fmovrsgz	%o4,	%f30,	%f11
	andcc	%o1,	%i4,	%o2
	sdivx	%l0,	0x186B,	%l5
	edge16n	%i2,	%l4,	%g7
	smul	%i6,	0x098B,	%i0
	fmovdpos	%icc,	%f13,	%f24
	edge16l	%i3,	%g6,	%o0
	sth	%g1,	[%l7 + 0x3C]
	fmovsleu	%xcc,	%f29,	%f17
	fnand	%f20,	%f0,	%f24
	fandnot2	%f10,	%f22,	%f16
	fmovrde	%g2,	%f0,	%f22
	edge32ln	%g4,	%i1,	%o5
	ldx	[%l7 + 0x30],	%o7
	srax	%l1,	0x1F,	%g5
	stb	%i5,	[%l7 + 0x47]
	array16	%i7,	%g3,	%o3
	xor	%l6,	0x1691,	%l3
	movleu	%xcc,	%o6,	%l2
	for	%f20,	%f0,	%f20
	orncc	%o4,	%o1,	%o2
	stb	%l0,	[%l7 + 0x4C]
	lduw	[%l7 + 0x50],	%i4
	fmovda	%xcc,	%f22,	%f6
	srlx	%i2,	0x19,	%l5
	fmovrdgez	%l4,	%f0,	%f18
	movg	%xcc,	%i6,	%g7
	std	%f26,	[%l7 + 0x08]
	xnorcc	%i3,	0x0B85,	%g6
	popc	0x0FB6,	%o0
	movne	%icc,	%i0,	%g2
	fmovrslez	%g4,	%f30,	%f28
	udiv	%i1,	0x117C,	%g1
	movg	%icc,	%o5,	%l1
	sdivx	%o7,	0x0A25,	%g5
	movvc	%icc,	%i5,	%i7
	fmovsgu	%xcc,	%f4,	%f26
	xnor	%o3,	%l6,	%g3
	stw	%l3,	[%l7 + 0x64]
	fxnor	%f8,	%f28,	%f16
	mulscc	%o6,	%l2,	%o1
	movg	%icc,	%o2,	%l0
	fnands	%f12,	%f28,	%f27
	movpos	%xcc,	%o4,	%i2
	movn	%icc,	%l5,	%l4
	std	%f6,	[%l7 + 0x18]
	fabsd	%f4,	%f2
	udivcc	%i6,	0x0519,	%i4
	st	%f6,	[%l7 + 0x38]
	fnand	%f14,	%f12,	%f8
	addcc	%i3,	%g6,	%g7
	fmovdg	%icc,	%f18,	%f15
	fnot1s	%f23,	%f18
	fors	%f14,	%f17,	%f24
	movgu	%icc,	%i0,	%o0
	andcc	%g2,	0x12E0,	%i1
	sub	%g1,	%g4,	%o5
	alignaddrl	%l1,	%g5,	%i5
	sllx	%o7,	0x19,	%o3
	fcmpne32	%f6,	%f20,	%i7
	edge16ln	%l6,	%l3,	%g3
	fandnot1	%f6,	%f10,	%f14
	udivx	%o6,	0x1EC9,	%o1
	fandnot2	%f10,	%f26,	%f16
	movle	%xcc,	%l2,	%l0
	movcc	%xcc,	%o2,	%i2
	alignaddrl	%l5,	%o4,	%i6
	and	%l4,	0x1B68,	%i4
	movle	%xcc,	%g6,	%g7
	subcc	%i3,	%i0,	%g2
	fmovscc	%xcc,	%f13,	%f11
	fcmpne32	%f18,	%f0,	%i1
	edge32	%o0,	%g4,	%g1
	edge8l	%o5,	%g5,	%i5
	movne	%xcc,	%l1,	%o7
	edge16	%o3,	%l6,	%i7
	alignaddr	%g3,	%o6,	%o1
	movcs	%xcc,	%l2,	%l0
	movne	%xcc,	%o2,	%i2
	fpsub32	%f26,	%f4,	%f4
	movrne	%l5,	%o4,	%i6
	restore %l4, 0x1D7A, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f19,	%f4
	fmul8x16au	%f30,	%f18,	%f0
	movvc	%xcc,	%l3,	%g7
	nop
	set	0x10, %i6
	std	%f8,	[%l7 + %i6]
	xor	%g6,	%i3,	%g2
	nop
	set	0x32, %o7
	sth	%i0,	[%l7 + %o7]
	fmul8x16	%f24,	%f30,	%f18
	addcc	%o0,	%g4,	%g1
	std	%f16,	[%l7 + 0x70]
	ldsh	[%l7 + 0x2E],	%i1
	ldsw	[%l7 + 0x4C],	%o5
	array8	%i5,	%g5,	%o7
	mulscc	%o3,	0x006E,	%l6
	xnor	%i7,	%l1,	%g3
	movgu	%icc,	%o1,	%l2
	ldsw	[%l7 + 0x3C],	%o6
	edge32n	%l0,	%o2,	%l5
	movrgez	%o4,	0x28C,	%i6
	stb	%i2,	[%l7 + 0x1C]
	array8	%l4,	%l3,	%i4
	or	%g7,	0x1DBA,	%i3
	udivcc	%g2,	0x086A,	%i0
	movvs	%icc,	%g6,	%g4
	fornot2s	%f21,	%f27,	%f7
	movvc	%xcc,	%o0,	%i1
	fornot1s	%f10,	%f13,	%f11
	ldsh	[%l7 + 0x46],	%g1
	fzero	%f20
	mova	%xcc,	%i5,	%g5
	ldub	[%l7 + 0x38],	%o7
	fmovsa	%xcc,	%f29,	%f25
	fcmpeq16	%f6,	%f14,	%o5
	movn	%icc,	%l6,	%i7
	xnorcc	%l1,	0x111D,	%o3
	fcmple16	%f8,	%f2,	%g3
	ldub	[%l7 + 0x4D],	%o1
	andcc	%l2,	0x04FE,	%l0
	fmovs	%f3,	%f29
	stx	%o2,	[%l7 + 0x38]
	sll	%o6,	0x00,	%o4
	and	%i6,	0x0D5C,	%i2
	movneg	%xcc,	%l4,	%l5
	fpack32	%f12,	%f16,	%f2
	movneg	%icc,	%l3,	%g7
	lduw	[%l7 + 0x70],	%i3
	fpadd32s	%f4,	%f5,	%f31
	movleu	%icc,	%i4,	%g2
	movvs	%xcc,	%g6,	%g4
	subc	%i0,	0x02CA,	%o0
	siam	0x5
	stw	%g1,	[%l7 + 0x30]
	fsrc2	%f6,	%f30
	udiv	%i5,	0x0533,	%i1
	xor	%o7,	0x1952,	%g5
	sir	0x1F1F
	udivx	%o5,	0x0E41,	%i7
	movge	%icc,	%l6,	%o3
	movcc	%xcc,	%l1,	%g3
	xnorcc	%l2,	%l0,	%o2
	sir	0x0E47
	movrlez	%o1,	%o6,	%i6
	movle	%icc,	%o4,	%l4
	alignaddrl	%i2,	%l5,	%g7
	fxnor	%f12,	%f20,	%f14
	fmovsn	%xcc,	%f17,	%f21
	subcc	%l3,	0x16AB,	%i4
	movne	%xcc,	%g2,	%i3
	xor	%g6,	%i0,	%o0
	fmovdle	%icc,	%f7,	%f22
	fcmped	%fcc0,	%f10,	%f4
	fmovdge	%icc,	%f23,	%f10
	fmovrslez	%g4,	%f23,	%f26
	orncc	%i5,	%g1,	%o7
	movleu	%icc,	%g5,	%o5
	movpos	%icc,	%i7,	%l6
	nop
	set	0x26, %i3
	ldsh	[%l7 + %i3],	%o3
	edge8ln	%i1,	%l1,	%l2
	fcmpeq32	%f28,	%f10,	%g3
	std	%f10,	[%l7 + 0x10]
	edge8l	%l0,	%o1,	%o6
	sub	%i6,	%o2,	%l4
	fmovsa	%icc,	%f13,	%f23
	fsrc1	%f18,	%f28
	fmovrdgz	%o4,	%f26,	%f4
	fmovrsne	%l5,	%f14,	%f3
	xor	%i2,	0x0DD5,	%l3
	ld	[%l7 + 0x48],	%f4
	smulcc	%g7,	0x18F0,	%i4
	sdiv	%g2,	0x13AA,	%g6
	xnor	%i0,	%i3,	%o0
	fmovsvs	%xcc,	%f1,	%f26
	fornot2	%f0,	%f24,	%f18
	fpack16	%f4,	%f28
	fpsub16s	%f14,	%f9,	%f13
	umul	%g4,	%i5,	%g1
	edge16n	%o7,	%o5,	%i7
	movpos	%xcc,	%l6,	%o3
	nop
	set	0x3D, %g1
	ldsb	[%l7 + %g1],	%g5
	alignaddrl	%i1,	%l2,	%l1
	movle	%icc,	%l0,	%o1
	fmul8x16	%f8,	%f30,	%f16
	movvc	%xcc,	%o6,	%i6
	or	%o2,	%g3,	%l4
	fmovs	%f13,	%f14
	st	%f0,	[%l7 + 0x10]
	fmovsge	%icc,	%f23,	%f8
	xnorcc	%o4,	%l5,	%i2
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	sll	%g2,	%i0,	%g6
	srlx	%o0,	%g4,	%i5
	xor	%i3,	%o7,	%g1
	edge16ln	%i7,	%l6,	%o3
	array8	%o5,	%g5,	%i1
	movrgez	%l2,	0x00C,	%l0
	fmovsgu	%icc,	%f6,	%f19
	movneg	%xcc,	%o1,	%o6
	fandnot2s	%f17,	%f28,	%f11
	fmovscs	%xcc,	%f26,	%f3
	fornot1	%f6,	%f18,	%f2
	edge32n	%i6,	%l1,	%g3
	fmovse	%icc,	%f12,	%f30
	sth	%l4,	[%l7 + 0x32]
	ldd	[%l7 + 0x28],	%f16
	andn	%o2,	0x0EDC,	%o4
	subcc	%i2,	%l5,	%l3
	edge8n	%g7,	%i4,	%g2
	smulcc	%i0,	0x07EF,	%o0
	udiv	%g6,	0x057A,	%g4
	edge16n	%i5,	%i3,	%o7
	nop
	set	0x60, %o4
	stw	%g1,	[%l7 + %o4]
	addcc	%i7,	0x1270,	%o3
	stx	%l6,	[%l7 + 0x08]
	udiv	%g5,	0x19D0,	%o5
	fcmpne16	%f0,	%f12,	%i1
	save %l0, 0x0CF2, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o6,	%o1,	%i6
	srl	%g3,	%l4,	%l1
	alignaddrl	%o2,	%i2,	%o4
	sir	0x0ED2
	fmovdn	%icc,	%f8,	%f6
	addcc	%l5,	0x02EC,	%g7
	movle	%icc,	%i4,	%g2
	udivcc	%i0,	0x1A35,	%o0
	edge16ln	%g6,	%l3,	%g4
	edge8l	%i3,	%o7,	%i5
	sub	%g1,	%i7,	%l6
	edge8n	%g5,	%o3,	%i1
	ldd	[%l7 + 0x60],	%o4
	movgu	%xcc,	%l2,	%o6
	ldsb	[%l7 + 0x31],	%o1
	array32	%l0,	%i6,	%g3
	srl	%l4,	%o2,	%i2
	xnor	%o4,	0x10E9,	%l5
	andcc	%g7,	%l1,	%i4
	fabsd	%f0,	%f22
	movrne	%g2,	0x1FD,	%i0
	sth	%o0,	[%l7 + 0x78]
	save %g6, %g4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i3,	%o7,	%i5
	edge8	%i7,	%g1,	%l6
	fnegd	%f16,	%f8
	lduw	[%l7 + 0x68],	%o3
	fmovdl	%xcc,	%f0,	%f26
	sth	%i1,	[%l7 + 0x76]
	save %o5, 0x0B83, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%g5,	%o1
	movrgez	%o6,	0x02B,	%i6
	movg	%xcc,	%g3,	%l0
	fcmps	%fcc3,	%f8,	%f4
	movpos	%icc,	%o2,	%i2
	popc	%l4,	%l5
	fmovdl	%xcc,	%f13,	%f19
	fandnot1s	%f1,	%f20,	%f8
	edge8ln	%g7,	%o4,	%l1
	movneg	%icc,	%i4,	%g2
	or	%i0,	%o0,	%g4
	movcc	%xcc,	%l3,	%i3
	fabsd	%f0,	%f8
	stb	%o7,	[%l7 + 0x24]
	fmuld8ulx16	%f20,	%f17,	%f2
	fandnot1s	%f28,	%f13,	%f15
	andncc	%g6,	%i7,	%g1
	array16	%l6,	%o3,	%i5
	ld	[%l7 + 0x10],	%f27
	ldx	[%l7 + 0x70],	%i1
	fmovdgu	%icc,	%f25,	%f17
	stw	%l2,	[%l7 + 0x48]
	fmovrsne	%o5,	%f3,	%f16
	addcc	%o1,	0x0876,	%g5
	fmovrde	%i6,	%f22,	%f2
	movrgz	%g3,	%o6,	%l0
	edge8ln	%i2,	%l4,	%l5
	ldsh	[%l7 + 0x28],	%o2
	sth	%o4,	[%l7 + 0x5C]
	fxors	%f30,	%f6,	%f0
	edge16n	%g7,	%i4,	%g2
	ld	[%l7 + 0x78],	%f8
	sll	%l1,	%i0,	%g4
	movrgez	%l3,	%o0,	%o7
	edge16l	%g6,	%i7,	%g1
	fmovsneg	%xcc,	%f10,	%f5
	movg	%xcc,	%i3,	%l6
	smulcc	%i5,	0x137F,	%i1
	movgu	%xcc,	%l2,	%o3
	array32	%o5,	%o1,	%i6
	subcc	%g3,	%o6,	%g5
	edge16	%l0,	%i2,	%l5
	fmovda	%icc,	%f18,	%f21
	nop
	set	0x28, %l2
	stx	%l4,	[%l7 + %l2]
	xorcc	%o2,	0x1ACA,	%o4
	movl	%xcc,	%i4,	%g2
	fexpand	%f17,	%f14
	sdivx	%l1,	0x0872,	%g7
	subcc	%i0,	%g4,	%l3
	subccc	%o0,	0x0308,	%g6
	movrlez	%i7,	0x17A,	%g1
	movrgez	%i3,	%l6,	%i5
	movg	%xcc,	%o7,	%l2
	fmovsle	%xcc,	%f27,	%f20
	fands	%f24,	%f25,	%f4
	fmuld8sux16	%f21,	%f17,	%f12
	movrlez	%o3,	%i1,	%o1
	fpackfix	%f14,	%f26
	ldsh	[%l7 + 0x42],	%i6
	movre	%o5,	0x35A,	%o6
	fmovrdgez	%g5,	%f10,	%f24
	srlx	%g3,	0x1F,	%i2
	fmovsn	%icc,	%f25,	%f6
	fmovdvc	%icc,	%f14,	%f18
	xor	%l0,	0x08DB,	%l4
	movcs	%xcc,	%l5,	%o2
	mova	%icc,	%i4,	%g2
	sir	0x1739
	udiv	%l1,	0x0E04,	%g7
	subcc	%o4,	0x1D14,	%g4
	popc	%l3,	%o0
	fcmpgt16	%f28,	%f24,	%g6
	restore %i0, %i7, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%l6,	%i3
	save %o7, %i5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o3,	%i1,	%o1
	mulscc	%o5,	0x1E98,	%i6
	sethi	0x0E13,	%g5
	sra	%o6,	%i2,	%l0
	sra	%g3,	%l5,	%o2
	udiv	%l4,	0x0EE4,	%i4
	bshuffle	%f12,	%f28,	%f10
	lduh	[%l7 + 0x2A],	%g2
	xor	%g7,	0x1FAE,	%l1
	sllx	%o4,	0x14,	%l3
	fmovsne	%icc,	%f31,	%f27
	add	%o0,	%g4,	%g6
	subccc	%i7,	0x096D,	%g1
	movleu	%xcc,	%l6,	%i0
	fmovs	%f26,	%f13
	sllx	%o7,	%i5,	%i3
	array32	%l2,	%i1,	%o3
	fmovrdgz	%o5,	%f18,	%f2
	ld	[%l7 + 0x7C],	%f20
	nop
	set	0x5C, %g2
	lduw	[%l7 + %g2],	%i6
	edge32n	%o1,	%g5,	%i2
	movleu	%xcc,	%l0,	%g3
	fnot2s	%f25,	%f23
	movge	%icc,	%o6,	%l5
	edge32	%o2,	%l4,	%i4
	sdivx	%g2,	0x1F65,	%l1
	movcs	%icc,	%o4,	%g7
	movvc	%icc,	%o0,	%l3
	subcc	%g6,	%i7,	%g4
	edge32l	%g1,	%l6,	%o7
	fandnot1	%f4,	%f10,	%f8
	ldx	[%l7 + 0x18],	%i5
	movl	%icc,	%i0,	%l2
	fmovdle	%xcc,	%f2,	%f5
	movrlez	%i1,	0x17B,	%o3
	fsrc2s	%f25,	%f21
	std	%f30,	[%l7 + 0x48]
	edge8n	%o5,	%i3,	%o1
	st	%f30,	[%l7 + 0x60]
	fmovrslz	%g5,	%f10,	%f16
	edge8ln	%i6,	%i2,	%l0
	addcc	%g3,	%o6,	%o2
	fnot2s	%f31,	%f15
	ld	[%l7 + 0x08],	%f26
	andn	%l5,	%l4,	%g2
	or	%l1,	0x1A53,	%o4
	fpadd16s	%f17,	%f13,	%f5
	sdivx	%g7,	0x190D,	%o0
	movleu	%icc,	%l3,	%g6
	array32	%i7,	%i4,	%g4
	st	%f5,	[%l7 + 0x68]
	alignaddrl	%l6,	%o7,	%i5
	fmovsleu	%xcc,	%f8,	%f8
	fcmpgt16	%f16,	%f6,	%i0
	lduw	[%l7 + 0x7C],	%l2
	xor	%g1,	%o3,	%i1
	sir	0x1D29
	movrlez	%i3,	0x19D,	%o5
	movvc	%icc,	%g5,	%o1
	addccc	%i6,	0x0844,	%i2
	edge32ln	%l0,	%g3,	%o6
	sdivx	%l5,	0x0689,	%o2
	alignaddr	%l4,	%g2,	%l1
	fmovsneg	%icc,	%f1,	%f8
	array8	%o4,	%o0,	%l3
	movcs	%icc,	%g6,	%i7
	movrgez	%g7,	0x05B,	%i4
	alignaddrl	%l6,	%o7,	%i5
	movpos	%xcc,	%i0,	%g4
	ldsb	[%l7 + 0x54],	%l2
	addccc	%g1,	%i1,	%o3
	ldsh	[%l7 + 0x7A],	%o5
	ldd	[%l7 + 0x20],	%i2
	alignaddr	%o1,	%g5,	%i6
	edge32	%l0,	%g3,	%o6
	andn	%l5,	0x156A,	%o2
	fmuld8ulx16	%f27,	%f0,	%f16
	sdivx	%l4,	0x0648,	%g2
	srax	%i2,	0x14,	%l1
	fmovde	%xcc,	%f27,	%f17
	array16	%o4,	%o0,	%l3
	movrgz	%i7,	0x24C,	%g6
	and	%i4,	0x16B6,	%g7
	ldx	[%l7 + 0x58],	%l6
	movvs	%xcc,	%i5,	%i0
	fpsub32	%f4,	%f2,	%f4
	sra	%o7,	0x08,	%l2
	fcmpeq16	%f12,	%f12,	%g4
	fsrc2s	%f21,	%f2
	edge8n	%g1,	%o3,	%o5
	edge16ln	%i3,	%i1,	%o1
	edge8	%g5,	%l0,	%i6
	orcc	%g3,	%l5,	%o2
	fmul8x16au	%f22,	%f17,	%f14
	fornot2	%f10,	%f30,	%f24
	fsrc1s	%f5,	%f19
	smulcc	%o6,	%l4,	%i2
	sllx	%l1,	0x14,	%o4
	umulcc	%g2,	0x0EA6,	%l3
	udivx	%i7,	0x017B,	%o0
	movge	%icc,	%i4,	%g6
	fcmped	%fcc3,	%f28,	%f6
	fmovsl	%xcc,	%f29,	%f28
	ldub	[%l7 + 0x49],	%l6
	sra	%i5,	%g7,	%o7
	edge16l	%l2,	%i0,	%g1
	addccc	%o3,	0x062A,	%g4
	fmovsvs	%xcc,	%f10,	%f5
	ldsb	[%l7 + 0x0F],	%o5
	smulcc	%i3,	0x1DC8,	%i1
	xorcc	%o1,	%g5,	%l0
	fmovsge	%icc,	%f7,	%f0
	smulcc	%i6,	%l5,	%g3
	movrlz	%o6,	0x323,	%o2
	sra	%l4,	0x13,	%l1
	movvs	%xcc,	%o4,	%i2
	orn	%l3,	%g2,	%o0
	addc	%i4,	%g6,	%i7
	edge32ln	%l6,	%i5,	%o7
	lduh	[%l7 + 0x2C],	%g7
	alignaddr	%l2,	%i0,	%o3
	andcc	%g4,	%g1,	%o5
	addccc	%i3,	0x014F,	%i1
	fmovdgu	%icc,	%f31,	%f10
	fmovdge	%icc,	%f27,	%f0
	ldsw	[%l7 + 0x5C],	%g5
	movrne	%l0,	%o1,	%i6
	fnand	%f18,	%f16,	%f10
	ldsw	[%l7 + 0x24],	%l5
	fsrc1s	%f16,	%f14
	array32	%g3,	%o2,	%l4
	movrne	%l1,	%o6,	%o4
	or	%l3,	%i2,	%g2
	stx	%i4,	[%l7 + 0x18]
	array16	%o0,	%g6,	%i7
	movn	%xcc,	%i5,	%l6
	fmovrsgz	%o7,	%f6,	%f7
	movg	%xcc,	%l2,	%g7
	movl	%icc,	%o3,	%i0
	orcc	%g4,	%g1,	%o5
	st	%f15,	[%l7 + 0x30]
	movrlz	%i3,	0x151,	%g5
	andn	%l0,	%i1,	%i6
	edge8n	%l5,	%o1,	%o2
	fpack32	%f0,	%f2,	%f24
	array32	%g3,	%l1,	%o6
	sdivcc	%o4,	0x02ED,	%l3
	andcc	%i2,	0x0271,	%g2
	fsrc2s	%f0,	%f15
	sll	%i4,	0x06,	%o0
	umulcc	%g6,	0x0FD4,	%i7
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	or	%l2,	%g7,	%o7
	edge32	%i0,	%g4,	%g1
	movpos	%icc,	%o3,	%i3
	orncc	%g5,	0x1914,	%l0
	edge8	%o5,	%i6,	%i1
	mulscc	%l5,	%o1,	%g3
	fandnot2s	%f6,	%f27,	%f28
	movrgez	%o2,	%o6,	%o4
	fmovsl	%icc,	%f26,	%f8
	edge16n	%l3,	%l1,	%i2
	fpsub32s	%f24,	%f31,	%f0
	ldsb	[%l7 + 0x6E],	%g2
	sra	%i4,	0x14,	%o0
	stx	%i7,	[%l7 + 0x30]
	movge	%xcc,	%l4,	%i5
	xor	%g6,	%l2,	%l6
	stw	%g7,	[%l7 + 0x70]
	edge16	%o7,	%g4,	%g1
	std	%f0,	[%l7 + 0x20]
	movl	%xcc,	%i0,	%i3
	movne	%xcc,	%o3,	%l0
	udivx	%g5,	0x1617,	%o5
	movne	%icc,	%i6,	%i1
	movcc	%xcc,	%l5,	%o1
	edge8n	%o2,	%g3,	%o6
	fcmpne16	%f18,	%f10,	%l3
	edge16l	%o4,	%l1,	%i2
	movge	%xcc,	%i4,	%g2
	subc	%i7,	0x1ED3,	%l4
	andncc	%i5,	%o0,	%l2
	movpos	%icc,	%l6,	%g7
	fmovsvc	%icc,	%f16,	%f8
	and	%o7,	0x157C,	%g6
	movrgez	%g4,	%i0,	%i3
	subc	%o3,	%l0,	%g5
	movleu	%xcc,	%g1,	%o5
	movne	%icc,	%i6,	%l5
	subcc	%i1,	%o2,	%g3
	movrne	%o6,	%l3,	%o4
	fcmpeq16	%f6,	%f6,	%l1
	movne	%icc,	%i2,	%i4
	mulx	%g2,	0x0868,	%o1
	fmovsa	%icc,	%f28,	%f6
	fmovdl	%xcc,	%f21,	%f2
	movvc	%icc,	%l4,	%i5
	array8	%i7,	%l2,	%l6
	addc	%o0,	%g7,	%g6
	fpsub32	%f6,	%f0,	%f8
	or	%g4,	%i0,	%o7
	add	%i3,	%o3,	%l0
	edge16ln	%g1,	%g5,	%o5
	edge32	%l5,	%i1,	%i6
	xorcc	%o2,	%g3,	%o6
	movg	%icc,	%l3,	%o4
	movcc	%xcc,	%i2,	%i4
	fmul8x16	%f30,	%f26,	%f18
	alignaddr	%l1,	%g2,	%o1
	mulscc	%i5,	%i7,	%l2
	movgu	%xcc,	%l6,	%o0
	edge16ln	%l4,	%g7,	%g4
	fmovdle	%icc,	%f12,	%f18
	movg	%icc,	%g6,	%o7
	sethi	0x0B2A,	%i3
	lduw	[%l7 + 0x4C],	%i0
	ldd	[%l7 + 0x38],	%f26
	array32	%o3,	%g1,	%g5
	fmovse	%icc,	%f22,	%f8
	edge8l	%o5,	%l0,	%l5
	fmovsn	%xcc,	%f9,	%f26
	mulx	%i1,	0x1BCB,	%o2
	movge	%icc,	%g3,	%i6
	smul	%l3,	%o6,	%i2
	or	%i4,	%o4,	%l1
	fmovsvc	%xcc,	%f1,	%f3
	fcmpne32	%f22,	%f18,	%g2
	edge16ln	%o1,	%i7,	%i5
	sra	%l2,	%o0,	%l4
	restore %g7, 0x1D0C, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g6,	%g4,	%i3
	sll	%i0,	0x05,	%o3
	alignaddr	%o7,	%g5,	%o5
	edge8l	%l0,	%g1,	%l5
	srlx	%o2,	%g3,	%i1
	fmovrde	%i6,	%f22,	%f14
	movrne	%l3,	%i2,	%i4
	ldsw	[%l7 + 0x28],	%o6
	edge8l	%l1,	%g2,	%o4
	ldub	[%l7 + 0x4F],	%i7
	fnor	%f28,	%f12,	%f30
	stw	%o1,	[%l7 + 0x78]
	fpadd16	%f2,	%f26,	%f14
	addc	%l2,	0x048D,	%o0
	addcc	%l4,	0x03BC,	%g7
	fmovsne	%xcc,	%f29,	%f3
	lduw	[%l7 + 0x6C],	%l6
	stx	%g6,	[%l7 + 0x28]
	fmovdne	%xcc,	%f28,	%f22
	fnegd	%f2,	%f26
	addcc	%g4,	%i5,	%i0
	movl	%xcc,	%o3,	%o7
	smul	%g5,	%o5,	%l0
	stb	%g1,	[%l7 + 0x34]
	movn	%xcc,	%l5,	%o2
	popc	0x1F88,	%i3
	xnorcc	%i1,	%g3,	%i6
	popc	0x0B59,	%i2
	fmovdg	%icc,	%f29,	%f15
	edge32ln	%i4,	%o6,	%l3
	sll	%g2,	0x13,	%o4
	st	%f2,	[%l7 + 0x3C]
	move	%xcc,	%l1,	%i7
	fpadd16s	%f14,	%f25,	%f1
	ldsw	[%l7 + 0x34],	%o1
	edge16ln	%l2,	%l4,	%g7
	fnegs	%f18,	%f6
	edge16	%l6,	%o0,	%g6
	alignaddrl	%g4,	%i5,	%i0
	subcc	%o3,	0x1457,	%o7
	sll	%g5,	0x12,	%l0
	fandnot1s	%f1,	%f2,	%f11
	orn	%g1,	%o5,	%l5
	st	%f26,	[%l7 + 0x64]
	movne	%icc,	%o2,	%i1
	edge32ln	%g3,	%i6,	%i3
	subcc	%i4,	%i2,	%l3
	fmul8x16au	%f5,	%f21,	%f28
	andcc	%o6,	0x0C36,	%g2
	movg	%xcc,	%o4,	%i7
	fpsub16	%f14,	%f20,	%f26
	smul	%o1,	0x0BE7,	%l2
	pdist	%f30,	%f0,	%f4
	edge16	%l4,	%g7,	%l6
	fsrc1s	%f4,	%f2
	udivcc	%l1,	0x0449,	%o0
	smulcc	%g6,	0x01AF,	%i5
	edge32ln	%i0,	%o3,	%o7
	edge8ln	%g5,	%g4,	%l0
	fzero	%f30
	stb	%o5,	[%l7 + 0x0C]
	ldd	[%l7 + 0x08],	%l4
	addcc	%o2,	%i1,	%g3
	addccc	%i6,	0x028E,	%i3
	stx	%i4,	[%l7 + 0x20]
	umulcc	%i2,	0x0B60,	%g1
	st	%f0,	[%l7 + 0x28]
	movle	%xcc,	%o6,	%l3
	movpos	%xcc,	%g2,	%i7
	and	%o1,	0x1DCF,	%l2
	orncc	%l4,	%o4,	%g7
	ldd	[%l7 + 0x38],	%f10
	movvs	%xcc,	%l1,	%l6
	fnot2s	%f13,	%f10
	xorcc	%g6,	%i5,	%o0
	and	%i0,	0x1DD3,	%o3
	and	%g5,	0x126A,	%o7
	or	%g4,	%o5,	%l0
	fandnot1	%f18,	%f16,	%f28
	fnands	%f11,	%f16,	%f14
	array32	%l5,	%i1,	%o2
	srlx	%g3,	%i6,	%i3
	movcc	%xcc,	%i4,	%i2
	udivcc	%g1,	0x1492,	%l3
	stx	%o6,	[%l7 + 0x08]
	movgu	%xcc,	%i7,	%o1
	edge8l	%g2,	%l2,	%l4
	and	%g7,	%l1,	%l6
	xorcc	%g6,	0x0DCF,	%o4
	addcc	%o0,	0x148B,	%i5
	fxor	%f24,	%f8,	%f20
	sub	%o3,	0x1B58,	%g5
	smul	%o7,	0x0261,	%i0
	addc	%o5,	%l0,	%l5
	sir	0x1AEC
	fmovscs	%xcc,	%f23,	%f15
	andncc	%i1,	%o2,	%g3
	fmovsvc	%xcc,	%f21,	%f11
	movge	%icc,	%g4,	%i6
	stx	%i3,	[%l7 + 0x58]
	ldx	[%l7 + 0x28],	%i4
	edge8	%g1,	%l3,	%i2
	edge32	%i7,	%o1,	%g2
	andcc	%o6,	%l4,	%l2
	movrgz	%l1,	%g7,	%l6
	ldsw	[%l7 + 0x70],	%g6
	fmovrse	%o4,	%f10,	%f26
	movvc	%xcc,	%o0,	%o3
	nop
	set	0x16, %i0
	ldsb	[%l7 + %i0],	%g5
	sethi	0x08A6,	%o7
	movrgz	%i5,	0x3B5,	%o5
	orn	%i0,	0x02B1,	%l5
	fnot1	%f12,	%f12
	umul	%i1,	0x041A,	%o2
	movcs	%icc,	%g3,	%l0
	add	%g4,	0x1DB9,	%i3
	ldsw	[%l7 + 0x08],	%i4
	fandnot1	%f24,	%f28,	%f18
	movrlz	%g1,	%i6,	%i2
	fmovsg	%icc,	%f31,	%f31
	movgu	%icc,	%l3,	%o1
	ld	[%l7 + 0x50],	%f30
	edge8ln	%i7,	%g2,	%l4
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	nop
	set	0x74, %l4
	sth	%l6,	[%l7 + %l4]
	movgu	%icc,	%g6,	%g7
	and	%o4,	%o3,	%o0
	ldsh	[%l7 + 0x42],	%g5
	movcc	%icc,	%i5,	%o7
	subcc	%i0,	0x166B,	%o5
	movrgez	%i1,	0x3C9,	%l5
	add	%o2,	%l0,	%g4
	ldd	[%l7 + 0x40],	%g2
	movl	%icc,	%i4,	%i3
	lduh	[%l7 + 0x7E],	%g1
	edge16l	%i6,	%l3,	%o1
	lduw	[%l7 + 0x60],	%i7
	movle	%icc,	%g2,	%l4
	movneg	%icc,	%l2,	%i2
	sir	0x16EC
	edge8ln	%o6,	%l6,	%g6
	ld	[%l7 + 0x20],	%f20
	sra	%g7,	%l1,	%o3
	nop
	set	0x70, %l0
	std	%f8,	[%l7 + %l0]
	fmovdgu	%icc,	%f10,	%f31
	fmovdpos	%icc,	%f0,	%f28
	edge16ln	%o4,	%g5,	%i5
	smul	%o0,	%i0,	%o5
	bshuffle	%f30,	%f24,	%f16
	fmovrdlz	%o7,	%f16,	%f12
	fpackfix	%f18,	%f18
	fmovrde	%l5,	%f6,	%f8
	st	%f8,	[%l7 + 0x74]
	fsrc2s	%f21,	%f21
	sir	0x17AD
	xor	%o2,	%l0,	%g4
	andcc	%i1,	%g3,	%i4
	smul	%g1,	%i3,	%i6
	ld	[%l7 + 0x0C],	%f1
	udivx	%l3,	0x0DA1,	%o1
	sra	%i7,	0x1F,	%l4
	sir	0x1A2D
	movle	%icc,	%l2,	%g2
	addccc	%o6,	0x0518,	%l6
	srax	%g6,	0x12,	%g7
	xor	%i2,	0x157B,	%l1
	fmul8ulx16	%f30,	%f12,	%f2
	or	%o3,	0x163F,	%g5
	movvs	%xcc,	%o4,	%o0
	stx	%i0,	[%l7 + 0x28]
	add	%i5,	0x1E9A,	%o5
	fmovde	%xcc,	%f17,	%f9
	fmovs	%f10,	%f17
	edge8	%l5,	%o2,	%l0
	movvc	%icc,	%o7,	%i1
	fcmpne16	%f16,	%f24,	%g4
	fones	%f20
	movre	%i4,	0x3DC,	%g3
	alignaddrl	%i3,	%g1,	%l3
	fands	%f8,	%f1,	%f8
	sdiv	%o1,	0x1A68,	%i7
	ldd	[%l7 + 0x30],	%i6
	stb	%l2,	[%l7 + 0x3D]
	movcs	%icc,	%g2,	%l4
	movg	%icc,	%o6,	%g6
	mova	%icc,	%l6,	%i2
	movvs	%xcc,	%l1,	%o3
	edge32ln	%g7,	%g5,	%o0
	movleu	%xcc,	%o4,	%i0
	fpsub16s	%f22,	%f23,	%f0
	mulx	%i5,	0x1B77,	%o5
	edge32l	%l5,	%o2,	%o7
	fmovsgu	%icc,	%f15,	%f0
	fmovscc	%xcc,	%f27,	%f15
	movl	%xcc,	%l0,	%i1
	subccc	%i4,	0x0514,	%g4
	fpackfix	%f0,	%f19
	movg	%icc,	%g3,	%g1
	ldx	[%l7 + 0x68],	%l3
	fsrc2s	%f1,	%f12
	umul	%i3,	%o1,	%i6
	movle	%xcc,	%l2,	%g2
	lduh	[%l7 + 0x66],	%i7
	ldd	[%l7 + 0x18],	%o6
	edge8	%g6,	%l4,	%l6
	lduw	[%l7 + 0x74],	%i2
	std	%f18,	[%l7 + 0x60]
	movpos	%icc,	%l1,	%g7
	fcmpd	%fcc3,	%f10,	%f2
	or	%g5,	0x007B,	%o3
	srl	%o4,	%i0,	%o0
	movle	%xcc,	%i5,	%o5
	movrne	%o2,	0x10C,	%l5
	fxnor	%f28,	%f12,	%f4
	edge8l	%l0,	%i1,	%o7
	xor	%g4,	0x003D,	%i4
	alignaddr	%g1,	%l3,	%i3
	st	%f12,	[%l7 + 0x64]
	orcc	%g3,	%o1,	%i6
	udivx	%g2,	0x0838,	%l2
	stx	%o6,	[%l7 + 0x28]
	edge8l	%i7,	%g6,	%l4
	edge32l	%i2,	%l1,	%l6
	edge8n	%g5,	%g7,	%o4
	movvs	%icc,	%o3,	%i0
	movrgez	%i5,	0x0FD,	%o5
	movvs	%xcc,	%o2,	%l5
	fmul8x16	%f21,	%f20,	%f14
	edge32n	%o0,	%i1,	%l0
	stw	%o7,	[%l7 + 0x7C]
	sub	%g4,	0x1A53,	%i4
	movne	%icc,	%l3,	%i3
	edge16l	%g1,	%g3,	%i6
	fmovsl	%icc,	%f3,	%f7
	and	%o1,	0x0C0C,	%g2
	lduw	[%l7 + 0x68],	%l2
	xnor	%o6,	0x0EDE,	%i7
	array8	%g6,	%i2,	%l4
	fcmpgt16	%f24,	%f22,	%l1
	orcc	%l6,	%g7,	%g5
	fcmpne32	%f10,	%f8,	%o4
	st	%f10,	[%l7 + 0x68]
	movgu	%xcc,	%i0,	%o3
	ldsb	[%l7 + 0x2D],	%i5
	fmul8sux16	%f4,	%f4,	%f20
	fcmpeq32	%f12,	%f22,	%o5
	fmovs	%f11,	%f7
	smulcc	%o2,	0x1C31,	%o0
	fzeros	%f15
	array8	%l5,	%l0,	%o7
	edge8n	%g4,	%i1,	%l3
	fmovrdgez	%i4,	%f20,	%f12
	movrlz	%i3,	%g3,	%g1
	lduh	[%l7 + 0x2E],	%i6
	faligndata	%f16,	%f26,	%f4
	array16	%o1,	%l2,	%g2
	movvc	%xcc,	%o6,	%i7
	or	%i2,	%g6,	%l4
	movre	%l1,	%g7,	%l6
	fmovsle	%xcc,	%f12,	%f29
	fnot1s	%f16,	%f28
	fmovdleu	%xcc,	%f3,	%f10
	subc	%g5,	0x0AA6,	%i0
	xorcc	%o3,	0x0E7D,	%i5
	movge	%icc,	%o4,	%o2
	sra	%o0,	%l5,	%l0
	fmovse	%icc,	%f19,	%f17
	fmovrsgez	%o7,	%f26,	%f16
	array8	%g4,	%o5,	%i1
	fmovrdgz	%l3,	%f10,	%f16
	edge16ln	%i4,	%g3,	%i3
	fmovdvs	%icc,	%f10,	%f3
	umul	%g1,	0x067C,	%i6
	fmovda	%icc,	%f20,	%f2
	fcmped	%fcc2,	%f26,	%f18
	andncc	%o1,	%g2,	%l2
	alignaddrl	%i7,	%i2,	%o6
	edge32ln	%g6,	%l4,	%g7
	edge32n	%l1,	%g5,	%i0
	fzero	%f28
	add	%o3,	%l6,	%o4
	popc	0x1D44,	%o2
	add	%o0,	%i5,	%l0
	smul	%o7,	0x1D8F,	%g4
	restore %l5, 0x17A9, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x08FB,	%l3
	subc	%o5,	%g3,	%i3
	andn	%g1,	0x14C1,	%i4
	ld	[%l7 + 0x58],	%f27
	lduh	[%l7 + 0x46],	%i6
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%f28
	fandnot1	%f0,	%f28,	%f2
	sir	0x16B2
	umul	%g2,	%o1,	%l2
	ldsw	[%l7 + 0x68],	%i7
	xor	%i2,	%o6,	%g6
	fmul8x16au	%f10,	%f5,	%f12
	edge32ln	%g7,	%l4,	%g5
	array16	%i0,	%l1,	%l6
	alignaddr	%o3,	%o4,	%o0
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	movl	%icc,	%g4,	%l5
	andn	%i1,	%l3,	%o5
	fornot2	%f8,	%f0,	%f4
	siam	0x7
	sdiv	%i5,	0x15F9,	%i3
	st	%f0,	[%l7 + 0x64]
	andn	%g1,	%g3,	%i6
	movpos	%icc,	%g2,	%i4
	edge16	%o1,	%l2,	%i7
	edge32n	%o6,	%i2,	%g7
	stx	%g6,	[%l7 + 0x40]
	edge16l	%l4,	%i0,	%g5
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%l0
	edge32ln	%l6,	%o4,	%o0
	movrlez	%o2,	0x3CA,	%l0
	or	%o7,	%g4,	%l5
	array16	%i1,	%l3,	%o5
	mulscc	%i5,	%i3,	%g1
	movrgez	%g3,	%i6,	%o3
	fmovdgu	%xcc,	%f24,	%f2
	array8	%g2,	%i4,	%l2
	ldx	[%l7 + 0x40],	%o1
	xor	%o6,	0x0EA3,	%i2
	edge8	%g7,	%g6,	%l4
	andncc	%i0,	%g5,	%i7
	movn	%xcc,	%l6,	%o4
	movl	%icc,	%o0,	%l1
	array8	%o2,	%o7,	%l0
	movgu	%icc,	%g4,	%i1
	xor	%l5,	0x19D0,	%o5
	fmovdpos	%xcc,	%f18,	%f0
	bshuffle	%f14,	%f26,	%f2
	edge16n	%i5,	%i3,	%l3
	stw	%g1,	[%l7 + 0x4C]
	array32	%g3,	%o3,	%i6
	lduh	[%l7 + 0x64],	%i4
	edge32	%l2,	%o1,	%o6
	faligndata	%f12,	%f6,	%f20
	movcc	%xcc,	%i2,	%g7
	fornot2s	%f27,	%f13,	%f17
	edge8	%g2,	%l4,	%i0
	movg	%xcc,	%g6,	%g5
	ldx	[%l7 + 0x78],	%l6
	movneg	%icc,	%o4,	%i7
	stw	%o0,	[%l7 + 0x60]
	edge8	%l1,	%o7,	%l0
	sdivx	%o2,	0x18CB,	%i1
	stx	%l5,	[%l7 + 0x48]
	addcc	%o5,	0x19BD,	%g4
	add	%i3,	%l3,	%g1
	fcmpes	%fcc0,	%f18,	%f17
	andncc	%i5,	%o3,	%g3
	movleu	%icc,	%i4,	%i6
	edge16l	%o1,	%l2,	%o6
	addccc	%i2,	%g2,	%l4
	fandnot1s	%f6,	%f14,	%f1
	alignaddr	%g7,	%g6,	%g5
	fmul8ulx16	%f4,	%f20,	%f26
	fmul8x16	%f8,	%f18,	%f26
	sdivcc	%i0,	0x0171,	%o4
	edge32l	%i7,	%l6,	%o0
	array16	%l1,	%o7,	%l0
	srax	%i1,	%l5,	%o5
	movne	%icc,	%o2,	%i3
	movneg	%xcc,	%l3,	%g4
	sth	%g1,	[%l7 + 0x60]
	sir	0x13E7
	fmovd	%f4,	%f2
	edge16ln	%i5,	%o3,	%g3
	ldd	[%l7 + 0x18],	%i4
	stb	%i6,	[%l7 + 0x6C]
	sdivcc	%l2,	0x164F,	%o6
	edge8l	%i2,	%o1,	%g2
	fmovscs	%xcc,	%f29,	%f13
	movleu	%xcc,	%l4,	%g6
	fmovdleu	%icc,	%f6,	%f24
	edge32	%g5,	%g7,	%i0
	edge16l	%i7,	%o4,	%l6
	stb	%l1,	[%l7 + 0x44]
	sethi	0x1F16,	%o0
	edge32l	%l0,	%i1,	%l5
	edge32l	%o5,	%o7,	%i3
	smul	%o2,	0x0890,	%l3
	fornot2s	%f18,	%f12,	%f24
	addccc	%g4,	0x1F96,	%i5
	fnors	%f15,	%f9,	%f26
	nop
	set	0x3E, %l3
	ldsb	[%l7 + %l3],	%g1
	smulcc	%g3,	0x194E,	%i4
	edge32ln	%o3,	%i6,	%o6
	movge	%xcc,	%l2,	%o1
	edge8	%g2,	%i2,	%l4
	movrgez	%g5,	0x3F4,	%g6
	edge32ln	%i0,	%i7,	%o4
	movleu	%xcc,	%l6,	%g7
	fsrc1	%f10,	%f18
	array16	%o0,	%l1,	%i1
	subccc	%l0,	%o5,	%l5
	sth	%i3,	[%l7 + 0x66]
	edge32	%o7,	%o2,	%g4
	std	%f24,	[%l7 + 0x18]
	mova	%xcc,	%l3,	%i5
	sllx	%g1,	0x0E,	%g3
	movg	%icc,	%o3,	%i6
	movvc	%xcc,	%o6,	%l2
	addccc	%i4,	0x100F,	%g2
	sllx	%i2,	%l4,	%g5
	stb	%o1,	[%l7 + 0x40]
	sth	%g6,	[%l7 + 0x1A]
	fcmped	%fcc2,	%f30,	%f22
	movvc	%xcc,	%i7,	%o4
	array16	%i0,	%l6,	%g7
	fornot2s	%f4,	%f15,	%f2
	movpos	%xcc,	%l1,	%o0
	subcc	%l0,	0x1A7C,	%o5
	movleu	%icc,	%i1,	%l5
	umulcc	%o7,	%i3,	%g4
	edge16	%l3,	%i5,	%o2
	addc	%g1,	%g3,	%i6
	xorcc	%o3,	0x174B,	%l2
	alignaddrl	%o6,	%i4,	%g2
	fandnot2	%f6,	%f18,	%f28
	ld	[%l7 + 0x38],	%f31
	fmovscc	%icc,	%f31,	%f18
	movcc	%icc,	%l4,	%i2
	edge32n	%o1,	%g6,	%i7
	ldd	[%l7 + 0x10],	%f20
	nop
	set	0x50, %o3
	std	%f4,	[%l7 + %o3]
	movpos	%xcc,	%g5,	%i0
	edge32n	%l6,	%g7,	%l1
	mulx	%o0,	0x0222,	%l0
	fandnot2	%f6,	%f20,	%f4
	udiv	%o5,	0x00F3,	%o4
	stw	%i1,	[%l7 + 0x70]
	sra	%l5,	0x09,	%i3
	movvs	%icc,	%g4,	%l3
	movge	%icc,	%i5,	%o2
	orn	%g1,	%g3,	%o7
	fones	%f31
	lduh	[%l7 + 0x20],	%i6
	fornot2s	%f29,	%f0,	%f23
	smul	%l2,	%o6,	%o3
	orncc	%g2,	%l4,	%i2
	subcc	%o1,	%g6,	%i7
	fcmps	%fcc2,	%f30,	%f3
	fcmpd	%fcc2,	%f2,	%f14
	sra	%i4,	%g5,	%l6
	movvc	%icc,	%g7,	%l1
	subccc	%i0,	0x159C,	%l0
	save %o5, 0x04A0, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f2,	%f22,	%f26
	smulcc	%o4,	0x17FC,	%l5
	ldd	[%l7 + 0x20],	%i0
	fors	%f26,	%f21,	%f21
	fmovd	%f10,	%f4
	movrlz	%i3,	%g4,	%l3
	xnorcc	%i5,	%g1,	%g3
	fands	%f1,	%f15,	%f4
	sethi	0x0906,	%o2
	udivcc	%o7,	0x0AFA,	%l2
	fpadd16	%f2,	%f8,	%f2
	xor	%o6,	0x19F3,	%i6
	sdivx	%o3,	0x03B3,	%g2
	smulcc	%i2,	%l4,	%g6
	ld	[%l7 + 0x50],	%f31
	move	%xcc,	%i7,	%o1
	std	%f14,	[%l7 + 0x08]
	srl	%g5,	0x14,	%i4
	movneg	%icc,	%g7,	%l6
	or	%l1,	%l0,	%i0
	edge8n	%o0,	%o5,	%l5
	sra	%i1,	%o4,	%i3
	movrlez	%l3,	0x11F,	%g4
	alignaddrl	%g1,	%i5,	%g3
	std	%f28,	[%l7 + 0x60]
	edge16	%o2,	%l2,	%o7
	subcc	%i6,	0x0B56,	%o3
	sdiv	%o6,	0x1375,	%g2
	movle	%xcc,	%i2,	%g6
	sdivx	%l4,	0x0488,	%o1
	fornot2s	%f30,	%f31,	%f1
	movge	%icc,	%i7,	%i4
	fandnot2	%f14,	%f14,	%f4
	alignaddrl	%g5,	%g7,	%l1
	srl	%l6,	0x01,	%i0
	ldsh	[%l7 + 0x26],	%o0
	addc	%o5,	%l0,	%l5
	movcc	%icc,	%o4,	%i3
	movcs	%icc,	%l3,	%i1
	stb	%g1,	[%l7 + 0x4E]
	ld	[%l7 + 0x38],	%f13
	stw	%g4,	[%l7 + 0x1C]
	edge32	%i5,	%g3,	%o2
	ldx	[%l7 + 0x68],	%o7
	addc	%i6,	0x07A0,	%l2
	movrne	%o3,	0x10E,	%g2
	stb	%o6,	[%l7 + 0x24]
	edge8	%i2,	%l4,	%g6
	restore %i7, %i4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f10,	%f16,	%f18
	smul	%o1,	%g7,	%l6
	save %i0, 0x081D, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o0,	0x1AB7,	%o5
	and	%l5,	%o4,	%i3
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	movrne	%l0,	%g4,	%i5
	fmovrse	%g3,	%f0,	%f28
	movl	%xcc,	%g1,	%o7
	fandnot1s	%f3,	%f16,	%f12
	sll	%i6,	0x09,	%o2
	movleu	%icc,	%l2,	%o3
	fsrc1s	%f7,	%f17
	fmovdvc	%xcc,	%f1,	%f26
	movcs	%icc,	%o6,	%i2
	addccc	%g2,	%g6,	%l4
	edge32	%i4,	%g5,	%i7
	edge32	%g7,	%o1,	%l6
	lduh	[%l7 + 0x2C],	%l1
	udiv	%o0,	0x13BE,	%i0
	umul	%o5,	0x028C,	%o4
	fnands	%f17,	%f27,	%f23
	save %l5, 0x02EC, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f0,	%f6
	sll	%i3,	%i1,	%l0
	fsrc1	%f12,	%f12
	edge16ln	%g4,	%g3,	%i5
	array32	%g1,	%i6,	%o7
	movrne	%l2,	0x01A,	%o3
	ldsb	[%l7 + 0x66],	%o2
	addccc	%i2,	%o6,	%g6
	edge8n	%l4,	%i4,	%g2
	sir	0x1398
	addc	%g5,	0x033A,	%i7
	alignaddrl	%o1,	%g7,	%l6
	movrlez	%o0,	%i0,	%l1
	movcc	%icc,	%o5,	%o4
	smulcc	%l3,	0x1045,	%l5
	fmovscc	%xcc,	%f30,	%f0
	edge16ln	%i3,	%i1,	%l0
	movleu	%icc,	%g3,	%g4
	mulx	%g1,	0x0494,	%i6
	fandnot2	%f28,	%f18,	%f28
	array16	%o7,	%i5,	%o3
	udiv	%l2,	0x1AD0,	%i2
	edge16	%o6,	%o2,	%l4
	movcc	%xcc,	%i4,	%g6
	smulcc	%g2,	0x0072,	%i7
	movrgz	%o1,	%g7,	%g5
	smul	%l6,	%o0,	%l1
	fmovrse	%o5,	%f27,	%f8
	srl	%o4,	0x16,	%l3
	fpadd32	%f28,	%f10,	%f26
	save %i0, %l5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l0,	%i1,	%g3
	mulx	%g1,	0x1305,	%g4
	addccc	%i6,	0x1511,	%i5
	popc	0x18D1,	%o7
	fcmpd	%fcc1,	%f6,	%f6
	stx	%o3,	[%l7 + 0x58]
	alignaddrl	%l2,	%o6,	%i2
	udivcc	%o2,	0x00E9,	%i4
	edge32l	%l4,	%g6,	%i7
	for	%f14,	%f16,	%f22
	ldsb	[%l7 + 0x40],	%g2
	sethi	0x1AAC,	%o1
	umulcc	%g5,	0x1CD1,	%l6
	edge32n	%o0,	%g7,	%l1
	edge32ln	%o5,	%o4,	%i0
	sllx	%l5,	%l3,	%l0
	fmovdneg	%icc,	%f31,	%f8
	std	%f18,	[%l7 + 0x68]
	sdiv	%i1,	0x0565,	%g3
	fornot1s	%f22,	%f27,	%f15
	edge32n	%g1,	%i3,	%g4
	xorcc	%i5,	%o7,	%o3
	edge32	%l2,	%o6,	%i2
	edge8n	%o2,	%i6,	%l4
	sdivcc	%i4,	0x164E,	%g6
	fmovsa	%xcc,	%f0,	%f2
	subccc	%i7,	0x07B4,	%g2
	andncc	%g5,	%o1,	%o0
	sdiv	%g7,	0x085B,	%l6
	ldsh	[%l7 + 0x58],	%l1
	srax	%o4,	%o5,	%l5
	fpmerge	%f29,	%f18,	%f22
	fnor	%f26,	%f24,	%f4
	andcc	%l3,	0x0DDC,	%i0
	fnot1	%f2,	%f6
	movle	%icc,	%l0,	%i1
	movne	%icc,	%g3,	%g1
	sra	%i3,	0x1D,	%i5
	andncc	%o7,	%g4,	%l2
	orn	%o6,	0x0360,	%i2
	orncc	%o2,	%i6,	%l4
	ldub	[%l7 + 0x52],	%i4
	sir	0x03B2
	movn	%xcc,	%o3,	%i7
	edge16l	%g2,	%g5,	%g6
	array8	%o0,	%o1,	%l6
	ld	[%l7 + 0x48],	%f10
	mulx	%g7,	0x0E81,	%l1
	movcs	%icc,	%o4,	%o5
	stb	%l5,	[%l7 + 0x65]
	addccc	%l3,	0x1755,	%i0
	movge	%icc,	%i1,	%l0
	and	%g3,	0x045A,	%i3
	or	%i5,	0x0E0D,	%o7
	fmovdne	%icc,	%f15,	%f13
	std	%f0,	[%l7 + 0x40]
	fmovrdlz	%g4,	%f2,	%f24
	fcmpgt16	%f18,	%f28,	%l2
	fnot2s	%f0,	%f17
	movn	%icc,	%o6,	%i2
	edge32l	%g1,	%i6,	%o2
	edge32n	%i4,	%l4,	%i7
	save %o3, 0x05D0, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g2,	0x0366,	%g6
	fabss	%f16,	%f11
	fsrc2	%f10,	%f6
	save %o1, %l6, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f6,	%f26
	fmovsne	%icc,	%f13,	%f20
	edge16ln	%o0,	%o4,	%o5
	sdivcc	%l5,	0x0103,	%l1
	smul	%i0,	0x0FEE,	%l3
	movpos	%xcc,	%i1,	%g3
	movge	%xcc,	%l0,	%i3
	sub	%i5,	%o7,	%g4
	ldub	[%l7 + 0x68],	%l2
	movl	%xcc,	%o6,	%i2
	movrgez	%i6,	0x372,	%g1
	edge16l	%i4,	%o2,	%i7
	add	%o3,	%g5,	%l4
	fmovsleu	%xcc,	%f15,	%f6
	fmovrslz	%g2,	%f4,	%f11
	xnorcc	%g6,	0x1DFC,	%o1
	ldsh	[%l7 + 0x4C],	%g7
	fmovrse	%o0,	%f20,	%f19
	fmovdl	%xcc,	%f20,	%f18
	fmul8x16au	%f31,	%f17,	%f2
	lduh	[%l7 + 0x10],	%l6
	array16	%o4,	%o5,	%l1
	popc	0x0E9A,	%l5
	fxnor	%f16,	%f6,	%f20
	add	%i0,	%l3,	%g3
	addccc	%i1,	%l0,	%i5
	fmovde	%icc,	%f28,	%f17
	siam	0x2
	sra	%i3,	0x10,	%o7
	movne	%icc,	%l2,	%g4
	srax	%o6,	0x1A,	%i2
	sdivcc	%i6,	0x1D9B,	%g1
	smul	%i4,	%o2,	%i7
	mulx	%o3,	%g5,	%g2
	edge32n	%g6,	%l4,	%g7
	subc	%o0,	0x13DD,	%o1
	lduh	[%l7 + 0x1E],	%l6
	sdiv	%o5,	0x0F5E,	%o4
	alignaddr	%l5,	%i0,	%l1
	nop
	set	0x2A, %g6
	ldsb	[%l7 + %g6],	%g3
	fmovd	%f2,	%f24
	fcmple32	%f8,	%f0,	%l3
	orn	%l0,	0x0750,	%i1
	restore %i3, %o7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%g4,	%f20,	%f26
	and	%o6,	0x0258,	%l2
	fnor	%f16,	%f10,	%f24
	ldd	[%l7 + 0x40],	%i2
	orncc	%g1,	0x17E8,	%i4
	fmul8x16	%f23,	%f24,	%f8
	fmovrsne	%o2,	%f25,	%f28
	smulcc	%i6,	0x1F5F,	%o3
	movgu	%xcc,	%i7,	%g5
	alignaddr	%g6,	%l4,	%g2
	sir	0x1033
	array32	%o0,	%o1,	%g7
	ldx	[%l7 + 0x60],	%l6
	mova	%icc,	%o5,	%o4
	movrlez	%i0,	0x1FD,	%l5
	sll	%g3,	0x13,	%l3
	edge8ln	%l1,	%l0,	%i3
	fxnors	%f24,	%f6,	%f9
	movcc	%icc,	%i1,	%o7
	fsrc2s	%f10,	%f20
	add	%g4,	0x019C,	%i5
	array8	%o6,	%l2,	%g1
	fpmerge	%f7,	%f29,	%f6
	addc	%i4,	0x040A,	%o2
	std	%f28,	[%l7 + 0x28]
	movpos	%xcc,	%i6,	%i2
	movg	%icc,	%o3,	%g5
	stw	%i7,	[%l7 + 0x3C]
	subc	%g6,	%l4,	%g2
	sdiv	%o1,	0x0407,	%o0
	fnor	%f12,	%f6,	%f24
	save %g7, %o5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x4C],	%o4
	movne	%icc,	%i0,	%g3
	array16	%l3,	%l5,	%l1
	alignaddr	%l0,	%i1,	%i3
	xor	%o7,	0x045A,	%i5
	fmovrslez	%o6,	%f24,	%f18
	andncc	%l2,	%g1,	%i4
	ldd	[%l7 + 0x08],	%f20
	fnegs	%f12,	%f31
	fpadd16s	%f0,	%f24,	%f12
	nop
	set	0x1E, %o5
	lduh	[%l7 + %o5],	%o2
	ldsw	[%l7 + 0x10],	%i6
	std	%f22,	[%l7 + 0x50]
	ld	[%l7 + 0x48],	%f11
	fcmple16	%f28,	%f18,	%g4
	movne	%icc,	%o3,	%i2
	movrlz	%g5,	%i7,	%g6
	sra	%l4,	0x0B,	%o1
	subcc	%g2,	0x0708,	%g7
	movneg	%xcc,	%o5,	%o0
	edge16	%l6,	%i0,	%o4
	movvs	%xcc,	%l3,	%g3
	movvs	%icc,	%l1,	%l5
	fmovrdlz	%l0,	%f28,	%f2
	add	%i3,	%o7,	%i1
	ldd	[%l7 + 0x10],	%f20
	edge16ln	%i5,	%o6,	%g1
	fnors	%f10,	%f16,	%f11
	faligndata	%f22,	%f10,	%f12
	fmul8x16au	%f14,	%f4,	%f12
	sethi	0x154C,	%l2
	subc	%i4,	0x101D,	%o2
	alignaddr	%i6,	%o3,	%g4
	array8	%g5,	%i2,	%i7
	udivx	%l4,	0x16B0,	%g6
	fcmpes	%fcc3,	%f2,	%f21
	umul	%g2,	0x13AF,	%o1
	fmovrdgez	%g7,	%f0,	%f18
	mulx	%o5,	%l6,	%o0
	fmul8x16au	%f25,	%f25,	%f16
	udivx	%i0,	0x1901,	%l3
	umul	%o4,	0x002E,	%l1
	fandnot2	%f10,	%f2,	%f2
	edge8l	%l5,	%l0,	%i3
	movn	%icc,	%g3,	%o7
	fmovrslz	%i5,	%f24,	%f17
	fmovsn	%xcc,	%f6,	%f10
	or	%i1,	0x08C5,	%o6
	movrgez	%g1,	0x0EB,	%i4
	movrlz	%l2,	%o2,	%o3
	movgu	%icc,	%g4,	%g5
	edge8n	%i2,	%i7,	%i6
	edge16l	%l4,	%g2,	%g6
	xnor	%g7,	0x1F4A,	%o1
	ldsb	[%l7 + 0x5D],	%o5
	movle	%xcc,	%o0,	%i0
	movvc	%xcc,	%l6,	%l3
	edge8n	%l1,	%l5,	%o4
	fcmpes	%fcc2,	%f18,	%f15
	sra	%l0,	%i3,	%g3
	fcmpd	%fcc0,	%f0,	%f12
	stw	%o7,	[%l7 + 0x3C]
	edge8n	%i5,	%i1,	%o6
	siam	0x2
	array8	%g1,	%i4,	%o2
	edge32n	%l2,	%o3,	%g4
	fmovrdgez	%i2,	%f14,	%f24
	ldd	[%l7 + 0x68],	%g4
	movpos	%xcc,	%i6,	%i7
	fnor	%f10,	%f0,	%f26
	movrgz	%l4,	%g2,	%g7
	fmul8ulx16	%f10,	%f12,	%f16
	srax	%o1,	0x15,	%g6
	stb	%o5,	[%l7 + 0x64]
	array32	%o0,	%i0,	%l6
	xorcc	%l1,	0x07D0,	%l3
	movneg	%icc,	%l5,	%o4
	srlx	%i3,	0x00,	%g3
	movrgz	%o7,	%i5,	%i1
	lduh	[%l7 + 0x42],	%o6
	fcmple32	%f12,	%f22,	%l0
	movrlz	%g1,	%o2,	%i4
	xor	%l2,	0x0061,	%o3
	array16	%i2,	%g4,	%i6
	fmul8x16au	%f15,	%f21,	%f8
	movl	%xcc,	%i7,	%l4
	fors	%f16,	%f7,	%f6
	edge32ln	%g2,	%g7,	%o1
	array16	%g5,	%o5,	%g6
	movl	%xcc,	%o0,	%i0
	orcc	%l6,	%l1,	%l5
	movre	%l3,	%o4,	%i3
	umulcc	%g3,	0x19B8,	%o7
	fnot2s	%f15,	%f31
	fcmpes	%fcc0,	%f15,	%f16
	orcc	%i5,	0x15C3,	%o6
	fnands	%f12,	%f21,	%f26
	umulcc	%i1,	0x034A,	%l0
	movrlz	%g1,	0x3FE,	%i4
	ldd	[%l7 + 0x60],	%f2
	fnands	%f7,	%f7,	%f20
	edge8l	%l2,	%o3,	%o2
	fcmpeq32	%f10,	%f14,	%i2
	lduh	[%l7 + 0x54],	%g4
	movvs	%xcc,	%i6,	%l4
	fmovsn	%icc,	%f1,	%f10
	fandnot2	%f8,	%f2,	%f18
	fands	%f18,	%f24,	%f1
	sdivcc	%g2,	0x108E,	%i7
	subc	%o1,	0x0E98,	%g5
	array16	%g7,	%o5,	%g6
	umul	%o0,	0x15EF,	%i0
	fmovsvc	%xcc,	%f7,	%f11
	edge16l	%l6,	%l5,	%l3
	edge16	%l1,	%o4,	%i3
	fmovd	%f20,	%f10
	array16	%o7,	%g3,	%o6
	edge32ln	%i1,	%i5,	%l0
	sra	%i4,	0x09,	%g1
	st	%f29,	[%l7 + 0x68]
	sub	%o3,	%l2,	%o2
	nop
	set	0x6A, %o1
	lduh	[%l7 + %o1],	%g4
	xor	%i2,	%i6,	%g2
	smulcc	%i7,	%l4,	%o1
	movrlez	%g5,	%o5,	%g6
	fmovsa	%xcc,	%f8,	%f27
	fmovrdlez	%o0,	%f20,	%f16
	movrgz	%g7,	%i0,	%l5
	fmovd	%f26,	%f30
	movrlez	%l6,	0x1A2,	%l3
	stb	%o4,	[%l7 + 0x74]
	movcc	%xcc,	%i3,	%o7
	ldd	[%l7 + 0x60],	%l0
	edge32	%g3,	%o6,	%i1
	mulscc	%l0,	0x1B78,	%i5
	orcc	%i4,	0x09B5,	%g1
	xnor	%o3,	0x02C1,	%o2
	fpack32	%f26,	%f14,	%f8
	save %g4, %i2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g2,	%l2,	%i7
	movrne	%l4,	%g5,	%o1
	orn	%g6,	%o0,	%g7
	fmovsne	%icc,	%f29,	%f2
	orn	%i0,	%o5,	%l6
	st	%f6,	[%l7 + 0x30]
	movleu	%xcc,	%l3,	%o4
	srl	%l5,	%o7,	%l1
	xnorcc	%i3,	0x0F86,	%o6
	fsrc2	%f2,	%f4
	srl	%i1,	0x06,	%g3
	udiv	%i5,	0x0847,	%i4
	srax	%l0,	%g1,	%o2
	movvc	%icc,	%o3,	%i2
	array8	%g4,	%g2,	%i6
	udivcc	%i7,	0x033E,	%l2
	std	%f10,	[%l7 + 0x28]
	nop
	set	0x1C, %i5
	lduw	[%l7 + %i5],	%g5
	fmovse	%icc,	%f3,	%f2
	stb	%o1,	[%l7 + 0x0B]
	ld	[%l7 + 0x24],	%f18
	fsrc2s	%f4,	%f5
	fnegs	%f3,	%f4
	xnor	%g6,	0x17C9,	%o0
	sdiv	%l4,	0x0A09,	%i0
	fcmpne32	%f18,	%f6,	%g7
	movcc	%icc,	%l6,	%o5
	sdiv	%l3,	0x13FB,	%o4
	movrgz	%o7,	%l1,	%i3
	sdiv	%l5,	0x17B5,	%i1
	mulx	%o6,	0x076E,	%i5
	sllx	%g3,	%l0,	%i4
	udivcc	%o2,	0x0311,	%o3
	alignaddrl	%g1,	%g4,	%i2
	movcc	%icc,	%g2,	%i6
	movcs	%icc,	%l2,	%i7
	subc	%o1,	%g5,	%g6
	addcc	%o0,	0x0A61,	%i0
	fmul8sux16	%f6,	%f10,	%f22
	stb	%g7,	[%l7 + 0x31]
	edge32	%l6,	%o5,	%l3
	movleu	%xcc,	%o4,	%l4
	st	%f7,	[%l7 + 0x1C]
	smul	%l1,	0x131F,	%i3
	smul	%l5,	0x152F,	%i1
	fornot1	%f4,	%f12,	%f18
	sir	0x0372
	sdivx	%o6,	0x0838,	%i5
	ldsb	[%l7 + 0x79],	%o7
	srl	%l0,	0x10,	%g3
	fand	%f16,	%f8,	%f22
	udivcc	%i4,	0x0372,	%o3
	sub	%g1,	0x07A4,	%o2
	fmovscs	%xcc,	%f18,	%f22
	edge8ln	%g4,	%i2,	%g2
	ldsb	[%l7 + 0x60],	%i6
	fpack32	%f14,	%f24,	%f0
	fmovrse	%l2,	%f14,	%f25
	fsrc1s	%f15,	%f18
	fnegs	%f19,	%f16
	orncc	%o1,	0x0000,	%i7
	movvc	%xcc,	%g6,	%g5
	mulscc	%o0,	0x1C72,	%i0
	fmovdneg	%icc,	%f28,	%f9
	edge16l	%l6,	%o5,	%g7
	alignaddrl	%o4,	%l4,	%l1
	addc	%l3,	%i3,	%l5
	sir	0x0C2C
	movcc	%icc,	%o6,	%i1
	udivx	%i5,	0x116F,	%l0
	or	%o7,	0x1BFB,	%i4
	edge8ln	%o3,	%g3,	%g1
	fmovscc	%xcc,	%f21,	%f28
	fcmps	%fcc1,	%f7,	%f23
	or	%g4,	%o2,	%i2
	ldx	[%l7 + 0x08],	%g2
	sll	%l2,	%o1,	%i6
	ldub	[%l7 + 0x28],	%i7
	std	%f2,	[%l7 + 0x48]
	stb	%g6,	[%l7 + 0x7D]
	umul	%g5,	0x02E5,	%i0
	movneg	%icc,	%o0,	%l6
	fmuld8ulx16	%f27,	%f12,	%f26
	edge16l	%g7,	%o5,	%o4
	fnand	%f6,	%f14,	%f2
	edge16	%l4,	%l3,	%l1
	and	%i3,	0x1E97,	%l5
	lduh	[%l7 + 0x22],	%i1
	stb	%o6,	[%l7 + 0x53]
	sdivcc	%l0,	0x130A,	%i5
	fmovspos	%icc,	%f20,	%f0
	sra	%i4,	%o3,	%g3
	alignaddrl	%g1,	%o7,	%g4
	std	%f6,	[%l7 + 0x38]
	ld	[%l7 + 0x14],	%f11
	sdivcc	%o2,	0x0111,	%g2
	fpsub32	%f8,	%f16,	%f2
	smul	%l2,	0x0491,	%o1
	edge8l	%i2,	%i7,	%g6
	alignaddrl	%i6,	%i0,	%o0
	array8	%g5,	%l6,	%g7
	ldd	[%l7 + 0x58],	%o4
	movgu	%xcc,	%o5,	%l3
	andcc	%l1,	0x1BF1,	%l4
	addc	%i3,	0x1565,	%i1
	st	%f3,	[%l7 + 0x0C]
	edge32	%l5,	%l0,	%o6
	addcc	%i5,	%i4,	%o3
	lduw	[%l7 + 0x70],	%g3
	stx	%o7,	[%l7 + 0x08]
	and	%g1,	%g4,	%o2
	fmovdvc	%xcc,	%f26,	%f15
	xorcc	%g2,	0x1B1D,	%l2
	movg	%icc,	%i2,	%i7
	ldd	[%l7 + 0x10],	%f30
	andn	%o1,	0x114C,	%g6
	fxnor	%f28,	%f16,	%f20
	fsrc2s	%f24,	%f15
	fcmpd	%fcc0,	%f18,	%f16
	fpack16	%f14,	%f24
	fsrc1	%f18,	%f16
	andncc	%i6,	%i0,	%o0
	edge8ln	%l6,	%g7,	%o4
	fcmps	%fcc0,	%f24,	%f27
	subcc	%o5,	0x11F8,	%l3
	movrlez	%g5,	%l4,	%i3
	sdivcc	%i1,	0x1DF3,	%l5
	ldx	[%l7 + 0x70],	%l1
	sub	%o6,	%i5,	%l0
	stx	%i4,	[%l7 + 0x70]
	array8	%o3,	%o7,	%g3
	edge8ln	%g1,	%o2,	%g2
	fmul8sux16	%f18,	%f12,	%f22
	fnors	%f18,	%f17,	%f11
	umulcc	%l2,	%i2,	%g4
	lduw	[%l7 + 0x2C],	%o1
	fpadd32	%f0,	%f18,	%f0
	fpsub32s	%f12,	%f25,	%f21
	srax	%g6,	0x11,	%i6
	xnor	%i0,	%o0,	%i7
	ld	[%l7 + 0x0C],	%f7
	ldsb	[%l7 + 0x71],	%l6
	add	%o4,	%o5,	%l3
	umul	%g5,	%l4,	%g7
	mova	%icc,	%i3,	%i1
	or	%l5,	0x1A4C,	%o6
	fnors	%f6,	%f27,	%f29
	umul	%i5,	%l1,	%i4
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	movpos	%xcc,	%l0,	%g3
	stx	%g1,	[%l7 + 0x78]
	ldub	[%l7 + 0x75],	%g2
	edge16n	%o2,	%l2,	%i2
	fmovdgu	%icc,	%f24,	%f27
	ldsw	[%l7 + 0x5C],	%o1
	orncc	%g4,	0x16CF,	%g6
	fand	%f6,	%f12,	%f20
	movrgez	%i0,	%i6,	%o0
	sll	%l6,	0x1F,	%o4
	fmovsneg	%xcc,	%f24,	%f20
	movcs	%xcc,	%i7,	%l3
	fpsub16s	%f4,	%f19,	%f21
	xor	%o5,	0x19E8,	%l4
	xnor	%g5,	0x08B5,	%i3
	movcc	%icc,	%g7,	%i1
	xnor	%l5,	0x171E,	%o6
	and	%l1,	0x1BBB,	%i4
	addcc	%i5,	0x0842,	%o7
	array32	%l0,	%g3,	%g1
	movcs	%icc,	%g2,	%o2
	fmovdcc	%xcc,	%f5,	%f12
	array32	%o3,	%l2,	%i2
	movn	%xcc,	%o1,	%g4
	movn	%xcc,	%i0,	%i6
	movleu	%icc,	%g6,	%l6
	xor	%o4,	%o0,	%l3
	addcc	%i7,	%o5,	%l4
	fpack32	%f4,	%f18,	%f22
	movpos	%xcc,	%g5,	%i3
	movcc	%xcc,	%i1,	%g7
	mova	%icc,	%l5,	%l1
	edge16l	%i4,	%i5,	%o7
	srl	%l0,	%g3,	%g1
	array8	%o6,	%o2,	%o3
	fmuld8ulx16	%f9,	%f13,	%f8
	sub	%l2,	%g2,	%i2
	orcc	%o1,	%g4,	%i6
	ld	[%l7 + 0x4C],	%f12
	array8	%i0,	%l6,	%o4
	stw	%o0,	[%l7 + 0x28]
	movneg	%xcc,	%l3,	%g6
	smul	%i7,	%o5,	%l4
	siam	0x2
	stb	%g5,	[%l7 + 0x5C]
	restore %i3, %i1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f6,	%f9,	%f18
	movneg	%xcc,	%l1,	%l5
	array32	%i5,	%i4,	%l0
	fexpand	%f17,	%f28
	and	%g3,	%o7,	%g1
	fpmerge	%f15,	%f10,	%f14
	mulx	%o2,	0x1D4A,	%o6
	xnor	%l2,	0x1B1D,	%o3
	ldx	[%l7 + 0x48],	%i2
	move	%icc,	%o1,	%g4
	popc	0x08B6,	%g2
	movrlz	%i6,	%l6,	%i0
	array8	%o0,	%l3,	%o4
	fmovdleu	%xcc,	%f16,	%f23
	lduh	[%l7 + 0x3C],	%i7
	movcs	%icc,	%g6,	%l4
	fmovdvs	%xcc,	%f15,	%f0
	move	%xcc,	%o5,	%g5
	movneg	%xcc,	%i1,	%i3
	nop
	set	0x1E, %i2
	lduh	[%l7 + %i2],	%g7
	stb	%l1,	[%l7 + 0x5B]
	fmovspos	%xcc,	%f15,	%f4
	subcc	%l5,	%i4,	%i5
	ldsw	[%l7 + 0x7C],	%l0
	st	%f21,	[%l7 + 0x6C]
	array8	%o7,	%g1,	%g3
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%f0
	mulx	%o2,	0x16BB,	%l2
	ldub	[%l7 + 0x08],	%o6
	nop
	set	0x36, %o2
	sth	%i2,	[%l7 + %o2]
	lduh	[%l7 + 0x12],	%o3
	fmovrdlz	%g4,	%f14,	%f28
	orcc	%o1,	%g2,	%l6
	movg	%icc,	%i6,	%o0
	fmovdneg	%xcc,	%f4,	%f8
	sdivx	%i0,	0x00DA,	%o4
	sdivx	%i7,	0x03B4,	%g6
	sll	%l4,	%l3,	%g5
	movvc	%icc,	%i1,	%o5
	alignaddrl	%i3,	%g7,	%l5
	save %i4, %l1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%o7,	%l0
	movrgz	%g1,	0x2EF,	%g3
	array32	%l2,	%o2,	%i2
	edge32l	%o3,	%o6,	%o1
	fmovdl	%xcc,	%f25,	%f15
	array8	%g4,	%g2,	%l6
	edge8l	%o0,	%i0,	%o4
	fmovscs	%xcc,	%f10,	%f16
	smul	%i7,	%i6,	%l4
	movrlez	%l3,	0x3E0,	%g5
	and	%i1,	%g6,	%i3
	fmovsgu	%xcc,	%f16,	%f6
	smul	%o5,	0x1BA8,	%l5
	edge16ln	%i4,	%l1,	%i5
	xnor	%g7,	0x02F3,	%o7
	fcmpd	%fcc2,	%f22,	%f10
	move	%xcc,	%g1,	%l0
	edge16ln	%g3,	%l2,	%i2
	movrgez	%o3,	0x37A,	%o6
	lduh	[%l7 + 0x4A],	%o1
	movrgez	%o2,	%g4,	%l6
	ldub	[%l7 + 0x5D],	%o0
	fmovrdlz	%g2,	%f12,	%f4
	subc	%i0,	%i7,	%o4
	smulcc	%i6,	0x0E96,	%l3
	srlx	%l4,	%i1,	%g6
	xor	%i3,	0x052E,	%g5
	std	%f2,	[%l7 + 0x50]
	movrgz	%l5,	%i4,	%l1
	sethi	0x079F,	%i5
	pdist	%f16,	%f16,	%f10
	movleu	%icc,	%o5,	%g7
	ldsb	[%l7 + 0x18],	%g1
	fmovscs	%xcc,	%f2,	%f15
	movvc	%xcc,	%l0,	%o7
	fmovsneg	%icc,	%f28,	%f17
	alignaddr	%l2,	%g3,	%i2
	ldx	[%l7 + 0x70],	%o6
	movneg	%xcc,	%o3,	%o2
	fcmped	%fcc0,	%f22,	%f2
	edge8n	%o1,	%g4,	%o0
	subcc	%g2,	%l6,	%i0
	movrlz	%o4,	%i7,	%l3
	movrgz	%i6,	%l4,	%g6
	movre	%i3,	%g5,	%l5
	fmovsgu	%icc,	%f20,	%f27
	fmovsneg	%icc,	%f20,	%f22
	fnegs	%f25,	%f8
	array32	%i4,	%l1,	%i1
	edge32l	%i5,	%g7,	%o5
	add	%l0,	%g1,	%l2
	sth	%g3,	[%l7 + 0x18]
	edge32n	%o7,	%i2,	%o3
	mova	%xcc,	%o6,	%o1
	fmovdneg	%icc,	%f10,	%f7
	edge32	%o2,	%g4,	%o0
	fandnot2s	%f24,	%f22,	%f20
	mulscc	%l6,	%g2,	%o4
	movvc	%xcc,	%i7,	%i0
	sdivx	%l3,	0x01D9,	%l4
	fmovdl	%xcc,	%f29,	%f2
	sir	0x0BB5
	movrne	%g6,	0x11C,	%i6
	movgu	%xcc,	%g5,	%l5
	fmovda	%xcc,	%f16,	%f23
	fmul8x16al	%f0,	%f30,	%f6
	fmovdleu	%icc,	%f26,	%f4
	movne	%icc,	%i3,	%i4
	subccc	%l1,	%i1,	%g7
	edge32	%o5,	%l0,	%i5
	umul	%l2,	%g1,	%o7
	popc	%g3,	%o3
	sllx	%o6,	0x15,	%o1
	fmovdneg	%xcc,	%f1,	%f31
	edge32n	%i2,	%o2,	%o0
	sth	%g4,	[%l7 + 0x70]
	sra	%g2,	%l6,	%i7
	fmovsne	%icc,	%f7,	%f10
	addccc	%o4,	%l3,	%i0
	ldd	[%l7 + 0x68],	%g6
	umul	%l4,	%i6,	%g5
	movle	%xcc,	%i3,	%l5
	movrlez	%l1,	%i1,	%g7
	movpos	%icc,	%o5,	%i4
	lduh	[%l7 + 0x2C],	%l0
	udiv	%i5,	0x1E95,	%g1
	fnot1s	%f2,	%f8
	edge32ln	%l2,	%o7,	%g3
	movrlz	%o3,	0x2C3,	%o1
	std	%f26,	[%l7 + 0x38]
	fmovrsne	%o6,	%f22,	%f14
	smulcc	%o2,	%i2,	%g4
	edge16l	%o0,	%g2,	%l6
	ldsw	[%l7 + 0x30],	%i7
	xnor	%o4,	%l3,	%i0
	stb	%l4,	[%l7 + 0x47]
	fmovscs	%icc,	%f10,	%f9
	move	%xcc,	%i6,	%g5
	ldsw	[%l7 + 0x30],	%g6
	movl	%icc,	%i3,	%l1
	fpack32	%f12,	%f2,	%f26
	alignaddrl	%i1,	%g7,	%l5
	fandnot2	%f20,	%f0,	%f4
	stw	%o5,	[%l7 + 0x6C]
	umulcc	%l0,	0x04FE,	%i5
	sir	0x0DA1
	umulcc	%i4,	%l2,	%g1
	mova	%icc,	%g3,	%o7
	fmovde	%xcc,	%f31,	%f4
	movvs	%xcc,	%o3,	%o6
	array16	%o2,	%i2,	%g4
	fzero	%f10
	array8	%o0,	%o1,	%g2
	sra	%i7,	%o4,	%l3
	edge16n	%l6,	%i0,	%l4
	movvc	%xcc,	%g5,	%i6
	alignaddr	%i3,	%g6,	%i1
	fmovrsgez	%g7,	%f13,	%f3
	fandnot2s	%f6,	%f21,	%f29
	movpos	%icc,	%l5,	%l1
	lduh	[%l7 + 0x5A],	%l0
	udiv	%o5,	0x1937,	%i4
	movl	%xcc,	%l2,	%g1
	edge16l	%g3,	%o7,	%i5
	and	%o3,	0x0A7A,	%o2
	movn	%xcc,	%i2,	%g4
	movrlez	%o6,	0x33B,	%o0
	srl	%g2,	%o1,	%i7
	sub	%o4,	0x0BDE,	%l3
	edge16	%l6,	%i0,	%g5
	fpadd16	%f2,	%f18,	%f30
	lduw	[%l7 + 0x68],	%l4
	add	%i6,	%g6,	%i1
	movn	%xcc,	%g7,	%i3
	movre	%l1,	%l0,	%o5
	movre	%l5,	0x118,	%i4
	st	%f5,	[%l7 + 0x3C]
	movrlz	%g1,	0x0A2,	%g3
	fcmpgt32	%f28,	%f8,	%l2
	movl	%xcc,	%o7,	%o3
	array8	%i5,	%o2,	%i2
	udivcc	%o6,	0x1DEE,	%g4
	fsrc2	%f18,	%f6
	mulscc	%g2,	0x14FA,	%o1
	movneg	%xcc,	%o0,	%o4
	srlx	%l3,	0x15,	%i7
	edge32l	%i0,	%l6,	%l4
	movrgez	%i6,	0x2BB,	%g5
	ld	[%l7 + 0x78],	%f16
	movrgez	%g6,	%g7,	%i3
	edge16ln	%l1,	%i1,	%l0
	ldub	[%l7 + 0x75],	%o5
	movne	%xcc,	%l5,	%g1
	addcc	%g3,	%l2,	%o7
	movneg	%icc,	%o3,	%i4
	fmovdleu	%icc,	%f7,	%f4
	or	%i5,	%i2,	%o6
	orn	%g4,	0x045D,	%g2
	xnorcc	%o1,	%o2,	%o0
	edge8	%l3,	%i7,	%i0
	array32	%l6,	%o4,	%i6
	save %l4, %g6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i3,	0x0463,	%l1
	sth	%i1,	[%l7 + 0x5C]
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%f10
	mulscc	%g7,	%o5,	%l0
	fzeros	%f9
	fors	%f26,	%f19,	%f6
	udiv	%l5,	0x10F3,	%g1
	popc	%l2,	%g3
	fpackfix	%f28,	%f8
	xor	%o3,	0x0476,	%o7
	smul	%i4,	%i2,	%o6
	fmovsvc	%xcc,	%f25,	%f29
	addcc	%g4,	0x036D,	%g2
	ldsh	[%l7 + 0x4C],	%i5
	fcmpeq16	%f30,	%f26,	%o1
	ldsb	[%l7 + 0x6D],	%o2
	bshuffle	%f26,	%f12,	%f10
	srax	%l3,	%o0,	%i7
	xnorcc	%l6,	0x1ACB,	%i0
	movpos	%icc,	%i6,	%l4
	orcc	%o4,	0x1CCC,	%g6
	edge16l	%g5,	%i3,	%l1
	stb	%i1,	[%l7 + 0x3F]
	fmovde	%icc,	%f28,	%f5
	ld	[%l7 + 0x74],	%f15
	movvc	%xcc,	%o5,	%l0
	edge32n	%l5,	%g7,	%l2
	sub	%g3,	0x182A,	%g1
	array8	%o7,	%o3,	%i2
	fcmpne32	%f26,	%f0,	%i4
	fmovspos	%icc,	%f9,	%f29
	movl	%xcc,	%g4,	%o6
	edge8ln	%i5,	%g2,	%o1
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	sllx	%i7,	0x1E,	%l6
	array32	%i6,	%i0,	%o4
	udiv	%l4,	0x1ED8,	%g5
	fmuld8ulx16	%f23,	%f7,	%f26
	orcc	%g6,	0x1495,	%l1
	fmul8x16	%f5,	%f22,	%f22
	udiv	%i1,	0x0A68,	%i3
	sdivx	%l0,	0x08F2,	%o5
	sethi	0x019B,	%l5
	movle	%icc,	%g7,	%g3
	movleu	%icc,	%l2,	%o7
	udivx	%o3,	0x1D7B,	%i2
	std	%f12,	[%l7 + 0x70]
	ldub	[%l7 + 0x2A],	%i4
	nop
	set	0x5A, %g5
	ldsh	[%l7 + %g5],	%g1
	fpadd16	%f22,	%f8,	%f20
	fandnot2	%f14,	%f28,	%f16
	fpsub32s	%f1,	%f28,	%f5
	subcc	%g4,	%i5,	%o6
	or	%o1,	0x1EF3,	%g2
	sdiv	%o2,	0x1E4A,	%l3
	addcc	%o0,	0x0F71,	%i7
	fpack32	%f10,	%f26,	%f28
	andncc	%i6,	%i0,	%o4
	movgu	%xcc,	%l6,	%l4
	sir	0x1DA7
	std	%f0,	[%l7 + 0x68]
	fxors	%f10,	%f1,	%f0
	movleu	%xcc,	%g5,	%l1
	stx	%i1,	[%l7 + 0x78]
	orcc	%g6,	0x0BE7,	%i3
	orncc	%o5,	%l0,	%g7
	udivx	%g3,	0x1C88,	%l2
	array32	%l5,	%o3,	%o7
	fmovspos	%icc,	%f14,	%f16
	fsrc2	%f20,	%f6
	edge16ln	%i4,	%g1,	%i2
	sdiv	%g4,	0x05AF,	%i5
	xorcc	%o1,	0x0563,	%g2
	fnors	%f0,	%f21,	%f31
	movrne	%o2,	%o6,	%o0
	fmovrslez	%l3,	%f29,	%f6
	edge8	%i7,	%i6,	%i0
	popc	%o4,	%l6
	fors	%f11,	%f13,	%f24
	srlx	%g5,	%l1,	%i1
	movg	%xcc,	%l4,	%g6
	popc	%o5,	%i3
	udivx	%g7,	0x16BF,	%l0
	fmovrdgz	%l2,	%f0,	%f4
	fsrc2	%f30,	%f22
	ldsh	[%l7 + 0x60],	%g3
	fpsub32	%f26,	%f28,	%f6
	movrlz	%o3,	%l5,	%o7
	movcs	%xcc,	%i4,	%g1
	mova	%icc,	%g4,	%i5
	edge16	%o1,	%i2,	%o2
	sth	%g2,	[%l7 + 0x1E]
	srlx	%o0,	0x1B,	%l3
	movne	%xcc,	%o6,	%i7
	save %i6, 0x1692, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l6,	0x0EF7,	%g5
	edge32	%l1,	%o4,	%l4
	lduw	[%l7 + 0x48],	%g6
	fmovsne	%xcc,	%f20,	%f9
	srax	%i1,	%i3,	%g7
	fmul8x16al	%f23,	%f18,	%f0
	udivx	%l0,	0x0C46,	%l2
	edge32	%o5,	%g3,	%l5
	stw	%o7,	[%l7 + 0x70]
	ld	[%l7 + 0x38],	%f31
	fcmpd	%fcc0,	%f30,	%f18
	edge32n	%i4,	%g1,	%o3
	fmul8ulx16	%f26,	%f26,	%f16
	stb	%i5,	[%l7 + 0x0B]
	ldx	[%l7 + 0x38],	%g4
	smul	%o1,	%i2,	%g2
	fmovspos	%icc,	%f15,	%f11
	fmovrslz	%o0,	%f17,	%f28
	movpos	%xcc,	%o2,	%l3
	restore %o6, %i7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x1C],	%i0
	edge8n	%g5,	%l6,	%o4
	add	%l1,	%g6,	%l4
	movpos	%xcc,	%i3,	%g7
	subc	%i1,	0x05E2,	%l2
	smulcc	%o5,	%g3,	%l0
	subcc	%o7,	0x06C1,	%i4
	andcc	%g1,	%l5,	%o3
	movn	%xcc,	%i5,	%o1
	sth	%i2,	[%l7 + 0x78]
	movrne	%g4,	0x2E1,	%o0
	movrgez	%o2,	0x129,	%g2
	edge8ln	%o6,	%l3,	%i7
	ld	[%l7 + 0x50],	%f11
	ldd	[%l7 + 0x50],	%i6
	mulx	%g5,	%l6,	%i0
	smul	%l1,	0x0917,	%o4
	edge8n	%g6,	%i3,	%l4
	fmul8sux16	%f28,	%f30,	%f24
	edge8ln	%g7,	%l2,	%i1
	fzero	%f2
	fmovsg	%icc,	%f29,	%f16
	movcc	%xcc,	%g3,	%l0
	fcmpgt32	%f28,	%f14,	%o7
	movcs	%icc,	%i4,	%g1
	subcc	%o5,	%l5,	%i5
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	fandnot2	%f2,	%f20,	%f24
	movle	%xcc,	%i2,	%g4
	movge	%xcc,	%o2,	%g2
	xnorcc	%o6,	0x1654,	%o0
	fornot1s	%f31,	%f0,	%f13
	fmul8ulx16	%f6,	%f14,	%f16
	movcc	%xcc,	%l3,	%i7
	fmovspos	%icc,	%f29,	%f23
	orn	%g5,	%l6,	%i6
	movvs	%icc,	%l1,	%o4
	sdivcc	%i0,	0x11EA,	%g6
	move	%icc,	%i3,	%l4
	move	%xcc,	%g7,	%i1
	edge8l	%l2,	%l0,	%o7
	movn	%xcc,	%g3,	%i4
	nop
	set	0x30, %i4
	ldsw	[%l7 + %i4],	%g1
	ldsb	[%l7 + 0x39],	%o5
	fandnot2s	%f19,	%f27,	%f11
	fmovrdlez	%l5,	%f8,	%f10
	xorcc	%i5,	0x03EE,	%o3
	fcmpeq32	%f4,	%f28,	%o1
	fmovscs	%icc,	%f1,	%f26
	move	%xcc,	%g4,	%o2
	edge32l	%g2,	%i2,	%o6
	stx	%o0,	[%l7 + 0x08]
	sll	%l3,	0x0E,	%i7
	mova	%icc,	%l6,	%g5
	movvc	%icc,	%i6,	%l1
	edge8ln	%i0,	%o4,	%i3
	sth	%g6,	[%l7 + 0x60]
	lduh	[%l7 + 0x44],	%l4
	bshuffle	%f2,	%f4,	%f24
	lduh	[%l7 + 0x5A],	%i1
	sir	0x1813
	fcmpne32	%f26,	%f4,	%l2
	smul	%g7,	%o7,	%g3
	stw	%i4,	[%l7 + 0x5C]
	subccc	%g1,	%o5,	%l0
	addccc	%i5,	%o3,	%l5
	movre	%o1,	%g4,	%o2
	ldsw	[%l7 + 0x0C],	%g2
	st	%f29,	[%l7 + 0x08]
	movcs	%xcc,	%i2,	%o6
	popc	%o0,	%l3
	fcmped	%fcc0,	%f12,	%f8
	ldx	[%l7 + 0x60],	%i7
	lduw	[%l7 + 0x18],	%g5
	orcc	%l6,	0x1924,	%l1
	movrgez	%i0,	%o4,	%i6
	srl	%i3,	0x04,	%l4
	ldx	[%l7 + 0x30],	%i1
	movrlz	%g6,	0x34E,	%l2
	subccc	%o7,	0x1851,	%g7
	edge16ln	%g3,	%g1,	%i4
	fmovdge	%xcc,	%f13,	%f5
	xor	%o5,	0x10FB,	%l0
	ldd	[%l7 + 0x20],	%o2
	subccc	%i5,	0x1523,	%o1
	smul	%l5,	%o2,	%g2
	movl	%xcc,	%g4,	%i2
	edge16n	%o6,	%o0,	%l3
	faligndata	%f22,	%f24,	%f2
	save %i7, 0x0BB5, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x198F,	%l1
	xorcc	%l6,	%i0,	%o4
	edge32ln	%i3,	%l4,	%i1
	subccc	%g6,	0x1450,	%l2
	mulx	%o7,	0x0C8C,	%g7
	movg	%xcc,	%i6,	%g3
	edge32ln	%i4,	%g1,	%o5
	subcc	%o3,	%l0,	%i5
	move	%xcc,	%l5,	%o2
	addcc	%g2,	0x0004,	%g4
	movpos	%xcc,	%i2,	%o6
	fand	%f8,	%f10,	%f24
	ldd	[%l7 + 0x78],	%f16
	udivx	%o0,	0x1BBB,	%o1
	and	%l3,	0x0E19,	%i7
	umulcc	%g5,	0x072C,	%l6
	orn	%i0,	0x157F,	%l1
	stw	%o4,	[%l7 + 0x54]
	addccc	%i3,	0x178B,	%l4
	xorcc	%i1,	0x0D0C,	%l2
	subccc	%o7,	%g6,	%g7
	umul	%g3,	%i4,	%g1
	edge32l	%o5,	%i6,	%o3
	add	%l0,	%i5,	%l5
	fmovs	%f25,	%f30
	edge16ln	%g2,	%o2,	%g4
	xorcc	%i2,	0x076E,	%o6
	movvs	%xcc,	%o0,	%l3
	edge32l	%o1,	%i7,	%l6
	movrlez	%g5,	%l1,	%o4
	udivcc	%i0,	0x055E,	%i3
	fpsub32	%f22,	%f22,	%f30
	subcc	%i1,	%l4,	%l2
	movneg	%xcc,	%g6,	%g7
	movle	%icc,	%g3,	%i4
	edge8l	%o7,	%g1,	%o5
	fandnot2s	%f28,	%f12,	%f11
	movgu	%icc,	%i6,	%l0
	pdist	%f26,	%f4,	%f14
	movrlez	%o3,	0x3E0,	%l5
	orncc	%g2,	0x0BB1,	%i5
	srl	%g4,	0x08,	%i2
	or	%o6,	0x1608,	%o2
	movleu	%xcc,	%l3,	%o1
	edge16	%i7,	%l6,	%g5
	mulx	%l1,	%o4,	%o0
	fornot1	%f0,	%f26,	%f0
	pdist	%f10,	%f24,	%f20
	movcs	%icc,	%i0,	%i1
	fpmerge	%f21,	%f5,	%f18
	udivcc	%l4,	0x1521,	%l2
	edge8ln	%i3,	%g6,	%g7
	movle	%xcc,	%g3,	%i4
	fpadd32s	%f2,	%f6,	%f23
	save %o7, 0x184A, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%g1,	%i6
	edge16l	%o3,	%l0,	%g2
	stb	%i5,	[%l7 + 0x4D]
	mulscc	%l5,	0x0B36,	%i2
	movrlz	%o6,	%g4,	%l3
	movle	%icc,	%o1,	%o2
	addc	%l6,	%i7,	%l1
	stb	%g5,	[%l7 + 0x39]
	stw	%o4,	[%l7 + 0x08]
	fands	%f9,	%f28,	%f1
	movge	%icc,	%o0,	%i0
	stb	%i1,	[%l7 + 0x2B]
	movge	%icc,	%l2,	%l4
	stb	%g6,	[%l7 + 0x7C]
	fnand	%f4,	%f26,	%f20
	lduw	[%l7 + 0x10],	%g7
	fpsub32	%f22,	%f12,	%f30
	fmovsvc	%xcc,	%f26,	%f0
	st	%f19,	[%l7 + 0x08]
	sth	%i3,	[%l7 + 0x30]
	movn	%xcc,	%i4,	%g3
	andcc	%o7,	0x1F62,	%o5
	movre	%i6,	%o3,	%g1
	nop
	set	0x69, %o6
	ldub	[%l7 + %o6],	%l0
	andncc	%g2,	%l5,	%i5
	fmovdcc	%xcc,	%f19,	%f3
	fsrc2	%f0,	%f28
	fmul8ulx16	%f6,	%f24,	%f20
	xnorcc	%o6,	0x0CF9,	%i2
	movpos	%xcc,	%g4,	%l3
	alignaddrl	%o1,	%l6,	%o2
	movne	%xcc,	%l1,	%i7
	faligndata	%f2,	%f22,	%f10
	fmul8ulx16	%f0,	%f16,	%f28
	mulx	%o4,	0x052B,	%g5
	mova	%icc,	%i0,	%o0
	fmovrdgz	%i1,	%f16,	%f0
	fmovse	%xcc,	%f9,	%f27
	xnor	%l4,	%l2,	%g6
	sdiv	%i3,	0x187E,	%g7
	andcc	%g3,	0x123C,	%o7
	fmovdl	%xcc,	%f29,	%f8
	fmovrsgz	%o5,	%f25,	%f22
	udivx	%i4,	0x062C,	%o3
	popc	%g1,	%i6
	fmovsg	%icc,	%f7,	%f11
	array16	%g2,	%l0,	%i5
	edge16l	%l5,	%o6,	%i2
	edge16	%g4,	%l3,	%l6
	andn	%o1,	0x1471,	%o2
	fabsd	%f8,	%f16
	fmovrde	%l1,	%f12,	%f20
	srax	%i7,	%o4,	%i0
	srl	%g5,	%i1,	%o0
	array8	%l2,	%l4,	%i3
	fpadd16s	%f14,	%f16,	%f27
	sir	0x003A
	sdiv	%g7,	0x1250,	%g3
	add	%g6,	%o7,	%o5
	array8	%o3,	%i4,	%g1
	andcc	%g2,	0x0AC0,	%i6
	smulcc	%i5,	0x0A35,	%l5
	sth	%o6,	[%l7 + 0x2C]
	fnand	%f16,	%f6,	%f8
	ldsw	[%l7 + 0x24],	%i2
	movgu	%xcc,	%g4,	%l3
	edge8l	%l6,	%o1,	%l0
	fmovdvc	%icc,	%f14,	%f17
	andncc	%l1,	%o2,	%i7
	edge8n	%o4,	%i0,	%i1
	pdist	%f12,	%f22,	%f20
	orcc	%o0,	0x1C7F,	%l2
	edge16ln	%l4,	%g5,	%g7
	fmovsa	%xcc,	%f29,	%f10
	edge8	%g3,	%i3,	%o7
	smul	%g6,	0x1D4E,	%o3
	edge8ln	%i4,	%g1,	%g2
	mulscc	%o5,	0x01AE,	%i6
	addcc	%l5,	%i5,	%o6
	array16	%i2,	%l3,	%g4
	edge32	%o1,	%l6,	%l1
	movge	%icc,	%l0,	%i7
	movn	%xcc,	%o4,	%i0
	mulscc	%i1,	%o0,	%l2
	fcmple16	%f8,	%f26,	%l4
	xnorcc	%g5,	0x0F14,	%g7
	sll	%g3,	0x00,	%o2
	fpsub16	%f18,	%f26,	%f2
	ld	[%l7 + 0x48],	%f0
	fmovdgu	%icc,	%f18,	%f6
	restore %i3, 0x10C0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f10,	%f16,	%f8
	movn	%icc,	%o7,	%i4
	mova	%xcc,	%g1,	%o3
	stx	%o5,	[%l7 + 0x30]
	add	%g2,	0x1176,	%i6
	ldx	[%l7 + 0x28],	%i5
	popc	%l5,	%i2
	addc	%o6,	0x0D92,	%g4
	lduw	[%l7 + 0x74],	%o1
	sir	0x1164
	smulcc	%l6,	%l3,	%l0
	fmovdneg	%xcc,	%f29,	%f28
	edge8	%l1,	%o4,	%i0
	ldsh	[%l7 + 0x16],	%i1
	movcs	%icc,	%i7,	%o0
	edge8n	%l2,	%l4,	%g5
	edge8	%g3,	%o2,	%i3
	sub	%g7,	%o7,	%i4
	edge16l	%g1,	%g6,	%o5
	sir	0x0281
	ldsw	[%l7 + 0x18],	%o3
	orn	%i6,	%g2,	%i5
	fcmple32	%f18,	%f12,	%i2
	ldd	[%l7 + 0x08],	%o6
	movvc	%icc,	%g4,	%l5
	stw	%o1,	[%l7 + 0x7C]
	addc	%l3,	0x0CDD,	%l0
	stw	%l6,	[%l7 + 0x10]
	addc	%l1,	0x1454,	%i0
	movl	%xcc,	%o4,	%i7
	movge	%icc,	%i1,	%l2
	umul	%l4,	%o0,	%g3
	srlx	%o2,	%g5,	%i3
	edge16n	%g7,	%o7,	%i4
	popc	0x19F5,	%g1
	edge8l	%g6,	%o3,	%i6
	and	%o5,	%i5,	%i2
	ldsw	[%l7 + 0x1C],	%g2
	srl	%o6,	%g4,	%l5
	sub	%l3,	%o1,	%l0
	fcmple32	%f12,	%f16,	%l6
	fpadd16s	%f12,	%f13,	%f11
	array32	%l1,	%i0,	%i7
	lduh	[%l7 + 0x08],	%i1
	movre	%l2,	0x2C6,	%o4
	xorcc	%o0,	%l4,	%o2
	xnor	%g3,	0x19DF,	%i3
	st	%f25,	[%l7 + 0x5C]
	movcc	%icc,	%g7,	%o7
	sdiv	%i4,	0x080D,	%g1
	fmovdvc	%xcc,	%f5,	%f31
	sub	%g6,	0x03DA,	%g5
	addc	%o3,	0x0567,	%i6
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	stx	%i2,	[%l7 + 0x68]
	udivx	%o6,	0x09EE,	%g4
	fmuld8ulx16	%f6,	%f18,	%f12
	edge32	%l5,	%l3,	%o1
	smulcc	%l6,	%l1,	%l0
	orncc	%i7,	%i1,	%i0
	addcc	%l2,	%o0,	%o4
	fmovscs	%icc,	%f4,	%f4
	fpadd32s	%f15,	%f13,	%f29
	udivx	%o2,	0x1E7B,	%g3
	movrlez	%l4,	0x34F,	%g7
	edge8l	%i3,	%o7,	%g1
	ld	[%l7 + 0x50],	%f5
	smul	%g6,	%g5,	%i4
	ldd	[%l7 + 0x20],	%i6
	sdiv	%o3,	0x0749,	%i5
	movpos	%xcc,	%g2,	%o5
	movpos	%icc,	%i2,	%g4
	orncc	%o6,	%l3,	%o1
	movrgz	%l6,	%l5,	%l0
	movrne	%l1,	%i7,	%i1
	xnor	%i0,	0x1362,	%o0
	xor	%l2,	0x097C,	%o2
	edge16	%g3,	%l4,	%o4
	fmovdne	%xcc,	%f10,	%f23
	or	%g7,	%o7,	%g1
	movn	%xcc,	%i3,	%g5
	array32	%i4,	%i6,	%g6
	array8	%o3,	%i5,	%o5
	edge8n	%g2,	%i2,	%g4
	sethi	0x173B,	%l3
	sllx	%o6,	0x12,	%l6
	movn	%xcc,	%l5,	%o1
	movrlz	%l0,	%i7,	%l1
	sra	%i0,	0x1E,	%i1
	sllx	%l2,	0x15,	%o0
	stx	%g3,	[%l7 + 0x68]
	fandnot1	%f16,	%f2,	%f4
	lduw	[%l7 + 0x50],	%l4
	stw	%o2,	[%l7 + 0x38]
	fands	%f4,	%f27,	%f21
	stx	%o4,	[%l7 + 0x48]
	edge32ln	%o7,	%g1,	%i3
	movvs	%xcc,	%g7,	%g5
	fsrc1	%f0,	%f8
	ldub	[%l7 + 0x70],	%i6
	subcc	%i4,	%g6,	%i5
	orcc	%o3,	%g2,	%o5
	movn	%icc,	%g4,	%l3
	addcc	%i2,	%o6,	%l5
	movvc	%icc,	%l6,	%o1
	movvc	%xcc,	%l0,	%l1
	ldd	[%l7 + 0x70],	%i0
	sra	%i1,	0x16,	%i7
	st	%f18,	[%l7 + 0x48]
	stx	%o0,	[%l7 + 0x18]
	fabsd	%f0,	%f20
	fnegd	%f22,	%f16
	edge32l	%l2,	%g3,	%o2
	and	%o4,	%l4,	%o7
	movpos	%icc,	%g1,	%g7
	fmovsn	%icc,	%f17,	%f7
	bshuffle	%f20,	%f30,	%f6
	xor	%i3,	%g5,	%i6
	orcc	%g6,	0x0F83,	%i5
	movg	%icc,	%i4,	%o3
	smul	%g2,	0x03CF,	%o5
	fmovs	%f18,	%f5
	sir	0x0D28
	fmovscc	%icc,	%f29,	%f30
	movg	%xcc,	%l3,	%i2
	stb	%g4,	[%l7 + 0x7C]
	fmul8sux16	%f10,	%f16,	%f22
	edge16n	%l5,	%l6,	%o1
	alignaddrl	%l0,	%o6,	%i0
	movgu	%icc,	%i1,	%i7
	movn	%xcc,	%l1,	%o0
	fmul8ulx16	%f24,	%f12,	%f6
	ldx	[%l7 + 0x08],	%g3
	fmul8sux16	%f26,	%f6,	%f4
	fmul8x16al	%f2,	%f8,	%f26
	move	%xcc,	%l2,	%o2
	fmovdcc	%icc,	%f9,	%f30
	udivcc	%o4,	0x1EC3,	%l4
	sdivcc	%g1,	0x1345,	%g7
	umul	%o7,	%i3,	%g5
	alignaddrl	%g6,	%i5,	%i4
	array16	%o3,	%g2,	%o5
	siam	0x2
	save %l3, %i6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%l5,	%l6
	array8	%g4,	%l0,	%o6
	movneg	%xcc,	%i0,	%o1
	mova	%xcc,	%i7,	%l1
	xorcc	%i1,	%g3,	%l2
	edge32l	%o2,	%o4,	%l4
	ldx	[%l7 + 0x68],	%g1
	srlx	%g7,	0x08,	%o0
	sir	0x1E13
	edge8n	%o7,	%i3,	%g5
	fcmpne32	%f22,	%f0,	%i5
	addc	%g6,	%o3,	%i4
	edge8n	%g2,	%o5,	%l3
	sdivx	%i6,	0x0708,	%i2
	edge8	%l6,	%g4,	%l5
	umulcc	%l0,	0x0652,	%o6
	movrgz	%i0,	0x051,	%o1
	edge8l	%l1,	%i7,	%i1
	movpos	%xcc,	%l2,	%o2
	xor	%g3,	%l4,	%o4
	andcc	%g1,	%o0,	%o7
	lduw	[%l7 + 0x10],	%g7
	array8	%i3,	%i5,	%g6
	edge16	%o3,	%i4,	%g2
	fcmpne32	%f14,	%f26,	%o5
	stw	%l3,	[%l7 + 0x4C]
	fcmple16	%f20,	%f18,	%g5
	stb	%i6,	[%l7 + 0x7B]
	subc	%l6,	0x15FD,	%i2
	ldd	[%l7 + 0x08],	%f8
	edge8ln	%g4,	%l0,	%l5
	ldsw	[%l7 + 0x08],	%o6
	ldx	[%l7 + 0x18],	%o1
	udivcc	%l1,	0x0E03,	%i0
	xor	%i7,	%i1,	%o2
	sub	%g3,	%l2,	%o4
	movvs	%xcc,	%l4,	%g1
	sth	%o0,	[%l7 + 0x46]
	fxnor	%f18,	%f18,	%f16
	ldub	[%l7 + 0x3B],	%g7
	stw	%o7,	[%l7 + 0x78]
	fandnot2s	%f19,	%f14,	%f31
	srl	%i3,	%i5,	%g6
	movrgz	%o3,	%g2,	%i4
	edge32n	%l3,	%g5,	%o5
	edge32l	%l6,	%i6,	%g4
	fsrc1	%f2,	%f26
	subc	%l0,	0x1D98,	%i2
	fmovsgu	%xcc,	%f7,	%f21
	subc	%o6,	%o1,	%l5
	subc	%l1,	%i0,	%i7
	addc	%i1,	%g3,	%o2
	st	%f10,	[%l7 + 0x54]
	orcc	%l2,	0x182F,	%o4
	ldub	[%l7 + 0x77],	%l4
	movn	%xcc,	%g1,	%g7
	subc	%o0,	0x1BF2,	%o7
	addc	%i5,	0x03FE,	%g6
	ldx	[%l7 + 0x18],	%o3
	fnors	%f30,	%f19,	%f17
	fmovdg	%xcc,	%f16,	%f18
	fmovsg	%icc,	%f10,	%f27
	array8	%g2,	%i4,	%i3
	udivcc	%l3,	0x0CCD,	%g5
	fone	%f20
	movge	%xcc,	%l6,	%o5
	movre	%g4,	0x033,	%i6
	sethi	0x01C8,	%l0
	std	%f12,	[%l7 + 0x08]
	edge8n	%o6,	%i2,	%l5
	std	%f18,	[%l7 + 0x60]
	alignaddrl	%o1,	%i0,	%i7
	fmul8sux16	%f30,	%f6,	%f22
	fmuld8sux16	%f19,	%f2,	%f24
	fmovdleu	%xcc,	%f15,	%f17
	fmuld8ulx16	%f17,	%f16,	%f22
	ldsw	[%l7 + 0x24],	%i1
	stx	%g3,	[%l7 + 0x50]
	fmovde	%icc,	%f2,	%f28
	xnor	%l1,	%o2,	%o4
	subc	%l2,	0x1D3D,	%l4
	fmovrdlz	%g7,	%f8,	%f16
	array16	%o0,	%o7,	%i5
	fsrc1	%f0,	%f8
	umulcc	%g6,	%o3,	%g2
	std	%f20,	[%l7 + 0x30]
	subccc	%g1,	%i3,	%i4
	movne	%xcc,	%l3,	%l6
	mulscc	%o5,	%g5,	%i6
	ldx	[%l7 + 0x70],	%l0
	srax	%g4,	0x13,	%o6
	fmovdge	%xcc,	%f17,	%f10
	mulscc	%l5,	%o1,	%i2
	movcc	%xcc,	%i7,	%i0
	edge32n	%i1,	%l1,	%o2
	array8	%o4,	%g3,	%l4
	sdiv	%g7,	0x1674,	%l2
	edge8ln	%o0,	%o7,	%g6
	movge	%xcc,	%i5,	%o3
	srlx	%g1,	%g2,	%i3
	udivx	%l3,	0x0079,	%l6
	smulcc	%i4,	0x1673,	%g5
	movcc	%icc,	%i6,	%l0
	addcc	%g4,	%o5,	%l5
	sra	%o1,	%i2,	%o6
	sra	%i0,	0x1F,	%i7
	fpadd16	%f10,	%f0,	%f2
	addc	%i1,	0x05A9,	%o2
	stb	%l1,	[%l7 + 0x2A]
	sdiv	%o4,	0x0DF6,	%g3
	std	%f22,	[%l7 + 0x68]
	ldsb	[%l7 + 0x28],	%g7
	and	%l2,	%o0,	%o7
	addc	%g6,	%l4,	%i5
	movcc	%xcc,	%g1,	%g2
	ldsw	[%l7 + 0x5C],	%o3
	ldsh	[%l7 + 0x32],	%l3
	fmovsleu	%icc,	%f27,	%f4
	restore %i3, 0x060E, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f22,	%f8
	edge8ln	%g5,	%l6,	%l0
	mulx	%i6,	0x12E0,	%g4
	edge32	%l5,	%o5,	%o1
	andcc	%o6,	%i0,	%i7
	edge16ln	%i2,	%o2,	%i1
	edge16n	%o4,	%l1,	%g3
	edge32l	%l2,	%o0,	%o7
	orncc	%g7,	%l4,	%g6
	ld	[%l7 + 0x64],	%f24
	fand	%f28,	%f22,	%f14
	movcs	%icc,	%i5,	%g2
	smulcc	%o3,	0x1889,	%g1
	stb	%l3,	[%l7 + 0x6E]
	edge16l	%i4,	%i3,	%l6
	or	%g5,	%i6,	%l0
	sdiv	%l5,	0x1879,	%g4
	addc	%o1,	%o6,	%i0
	fmuld8ulx16	%f19,	%f8,	%f28
	orcc	%i7,	%i2,	%o5
	lduw	[%l7 + 0x24],	%o2
	movgu	%xcc,	%i1,	%l1
	fnot2	%f16,	%f12
	fzeros	%f12
	srax	%o4,	%l2,	%g3
	sra	%o7,	%g7,	%o0
	stb	%g6,	[%l7 + 0x15]
	std	%f30,	[%l7 + 0x70]
	pdist	%f24,	%f30,	%f16
	orcc	%i5,	0x1EA1,	%l4
	addcc	%o3,	0x09C6,	%g1
	ldx	[%l7 + 0x20],	%l3
	mova	%xcc,	%g2,	%i4
	ldsw	[%l7 + 0x38],	%l6
	fandnot2	%f0,	%f18,	%f22
	sdivx	%i3,	0x1504,	%g5
	array16	%l0,	%l5,	%g4
	lduw	[%l7 + 0x28],	%i6
	st	%f0,	[%l7 + 0x2C]
	movgu	%xcc,	%o1,	%o6
	movneg	%icc,	%i7,	%i2
	udivx	%o5,	0x1313,	%i0
	nop
	set	0x68, %i7
	ldd	[%l7 + %i7],	%f22
	sllx	%i1,	%l1,	%o2
	edge16ln	%o4,	%g3,	%o7
	sll	%l2,	0x17,	%g7
	edge32l	%o0,	%g6,	%i5
	sdivcc	%o3,	0x0110,	%l4
	fmovsgu	%xcc,	%f23,	%f8
	srlx	%g1,	%g2,	%l3
	movrgez	%l6,	0x292,	%i3
	array8	%i4,	%g5,	%l0
	fmovrse	%g4,	%f0,	%f25
	fsrc1s	%f17,	%f25
	addcc	%i6,	%l5,	%o6
	movvs	%xcc,	%o1,	%i2
	fmovrdgez	%i7,	%f30,	%f30
	movvc	%icc,	%i0,	%o5
	edge8l	%l1,	%o2,	%i1
	fcmpes	%fcc2,	%f6,	%f6
	edge16ln	%o4,	%o7,	%l2
	movne	%icc,	%g7,	%g3
	fmovsvs	%icc,	%f11,	%f24
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f4
	fors	%f3,	%f23,	%f11
	fones	%f25
	fmovsge	%icc,	%f10,	%f21
	popc	%o0,	%i5
	fnot1s	%f13,	%f27
	ldd	[%l7 + 0x20],	%f0
	lduw	[%l7 + 0x20],	%o3
	fpsub16s	%f21,	%f11,	%f30
	fandnot1s	%f25,	%f4,	%f25
	andn	%l4,	%g6,	%g1
	stw	%g2,	[%l7 + 0x44]
	faligndata	%f2,	%f12,	%f16
	sllx	%l6,	%l3,	%i4
	andcc	%g5,	%l0,	%g4
	xorcc	%i6,	%i3,	%l5
	ldd	[%l7 + 0x18],	%o0
	fmovdvc	%icc,	%f13,	%f30
	fmovscs	%xcc,	%f20,	%f14
	srlx	%i2,	0x0D,	%i7
	fmuld8ulx16	%f16,	%f9,	%f20
	edge16l	%i0,	%o5,	%l1
	xnorcc	%o2,	0x13E5,	%i1
	movn	%xcc,	%o6,	%o7
	movgu	%xcc,	%l2,	%g7
	subccc	%o4,	%o0,	%i5
	movgu	%xcc,	%g3,	%l4
	edge32ln	%o3,	%g6,	%g2
	orncc	%l6,	%g1,	%i4
	fpsub16s	%f2,	%f12,	%f7
	movle	%xcc,	%g5,	%l0
	movl	%icc,	%g4,	%l3
	udivx	%i3,	0x199F,	%i6
	srl	%o1,	%i2,	%l5
	fpadd16	%f24,	%f10,	%f0
	nop
	set	0x49, %i1
	ldub	[%l7 + %i1],	%i0
	sdivx	%o5,	0x1317,	%i7
	fmovdne	%xcc,	%f24,	%f16
	sdiv	%o2,	0x17DF,	%l1
	fmovdge	%icc,	%f11,	%f28
	edge32ln	%o6,	%o7,	%l2
	movge	%icc,	%i1,	%g7
	ldd	[%l7 + 0x48],	%o4
	array16	%i5,	%o0,	%l4
	fcmpgt16	%f22,	%f0,	%g3
	nop
	set	0x0C, %l1
	ldsh	[%l7 + %l1],	%o3
	subcc	%g2,	%g6,	%g1
	edge16l	%l6,	%g5,	%l0
	array32	%i4,	%g4,	%l3
	movvc	%xcc,	%i6,	%i3
	subccc	%o1,	%l5,	%i0
	fmovsleu	%icc,	%f30,	%f0
	edge8	%o5,	%i7,	%i2
	xor	%l1,	0x1AFF,	%o2
	movre	%o7,	0x335,	%l2
	nop
	set	0x7A, %g3
	sth	%i1,	[%l7 + %g3]
	movgu	%icc,	%o6,	%o4
	edge8ln	%g7,	%o0,	%i5
	array32	%g3,	%l4,	%g2
	std	%f20,	[%l7 + 0x20]
	movvc	%xcc,	%g6,	%o3
	sub	%g1,	%g5,	%l0
	xor	%i4,	%g4,	%l6
	movneg	%icc,	%i6,	%l3
	sdivx	%i3,	0x15BF,	%l5
	edge32n	%o1,	%o5,	%i0
	umulcc	%i7,	%i2,	%l1
	mova	%icc,	%o2,	%l2
	ldd	[%l7 + 0x70],	%o6
	fmovsle	%icc,	%f6,	%f4
	fpsub32s	%f21,	%f29,	%f23
	edge32ln	%o6,	%i1,	%g7
	ldub	[%l7 + 0x0E],	%o0
	sdivx	%o4,	0x1A45,	%g3
	srax	%i5,	%g2,	%l4
	fmul8x16	%f21,	%f22,	%f0
	move	%icc,	%g6,	%g1
	edge16l	%g5,	%o3,	%l0
	umulcc	%i4,	0x130C,	%g4
	edge16n	%i6,	%l3,	%i3
	sub	%l6,	0x08E6,	%o1
	movvs	%xcc,	%l5,	%o5
	orn	%i7,	%i2,	%l1
	subccc	%i0,	%o2,	%l2
	sdivcc	%o6,	0x1B7F,	%i1
	addc	%g7,	%o0,	%o4
	mulx	%g3,	0x132C,	%i5
	fcmpgt16	%f22,	%f26,	%g2
	std	%f18,	[%l7 + 0x28]
	fmovsn	%icc,	%f12,	%f1
	addc	%l4,	%o7,	%g6
	movg	%xcc,	%g1,	%g5
	fmovrdlez	%l0,	%f4,	%f4
	save %o3, %g4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f23,	%f14
	movrne	%i4,	%l3,	%l6
	and	%o1,	%i3,	%o5
	movleu	%icc,	%l5,	%i7
	fmovrslz	%i2,	%f26,	%f5
	edge32	%i0,	%o2,	%l1
	ldsw	[%l7 + 0x44],	%l2
	smul	%o6,	%i1,	%g7
	stb	%o0,	[%l7 + 0x42]
	lduw	[%l7 + 0x10],	%o4
	movrne	%g3,	0x08C,	%i5
	orcc	%l4,	0x1358,	%g2
	edge8	%o7,	%g6,	%g1
	sdivcc	%g5,	0x1EA1,	%l0
	edge16l	%g4,	%i6,	%i4
	array16	%o3,	%l3,	%l6
	fnegs	%f19,	%f22
	sethi	0x0F68,	%o1
	srlx	%o5,	%l5,	%i3
	udivcc	%i7,	0x180A,	%i0
	fmovdl	%icc,	%f7,	%f2
	mova	%icc,	%o2,	%i2
	array32	%l1,	%o6,	%l2
	smul	%i1,	0x1D58,	%o0
	fsrc1	%f20,	%f22
	stw	%g7,	[%l7 + 0x28]
	movl	%xcc,	%g3,	%i5
	fxnors	%f10,	%f30,	%f31
	or	%l4,	0x12C5,	%g2
	xnor	%o7,	%o4,	%g1
	subccc	%g6,	%g5,	%g4
	edge16l	%l0,	%i4,	%i6
	orn	%o3,	%l3,	%o1
	fmovsvc	%icc,	%f13,	%f19
	nop
	set	0x48, %o7
	std	%f0,	[%l7 + %o7]
	movrne	%o5,	%l6,	%l5
	sir	0x1048
	movneg	%xcc,	%i7,	%i0
	movne	%xcc,	%o2,	%i3
	fmovsleu	%icc,	%f17,	%f11
	fsrc2	%f20,	%f0
	move	%icc,	%l1,	%o6
	movn	%xcc,	%i2,	%i1
	fandnot2	%f26,	%f10,	%f0
	fmuld8sux16	%f2,	%f4,	%f30
	st	%f30,	[%l7 + 0x34]
	stw	%o0,	[%l7 + 0x44]
	movneg	%xcc,	%l2,	%g7
	sethi	0x0217,	%g3
	smul	%i5,	%g2,	%o7
	movn	%xcc,	%l4,	%g1
	edge16	%o4,	%g5,	%g6
	xnorcc	%g4,	0x0DF9,	%i4
	fmovdleu	%xcc,	%f1,	%f8
	ldsh	[%l7 + 0x22],	%i6
	ldx	[%l7 + 0x70],	%o3
	movrgez	%l0,	%l3,	%o1
	subcc	%l6,	0x0BA6,	%l5
	srlx	%o5,	%i0,	%i7
	sethi	0x0E7A,	%o2
	xor	%i3,	0x1F21,	%l1
	edge32	%i2,	%i1,	%o6
	movrne	%l2,	0x3C8,	%o0
	subc	%g7,	%i5,	%g2
	sir	0x1199
	edge32n	%g3,	%l4,	%o7
	stw	%g1,	[%l7 + 0x30]
	srl	%g5,	%g6,	%o4
	movrlez	%g4,	0x239,	%i6
	stw	%i4,	[%l7 + 0x74]
	lduh	[%l7 + 0x58],	%l0
	array32	%o3,	%l3,	%l6
	alignaddrl	%o1,	%l5,	%i0
	fcmpd	%fcc2,	%f4,	%f6
	movvc	%xcc,	%i7,	%o5
	udivx	%i3,	0x0ADE,	%o2
	movcs	%xcc,	%i2,	%i1
	fcmpes	%fcc1,	%f29,	%f1
	xnorcc	%o6,	%l2,	%o0
	subcc	%g7,	0x1E38,	%i5
	subccc	%l1,	%g3,	%l4
	stb	%g2,	[%l7 + 0x2F]
	save %g1, %o7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g6,	%g4,	%o4
	alignaddr	%i4,	%l0,	%o3
	sdivx	%l3,	0x132C,	%l6
	fmovsgu	%xcc,	%f3,	%f31
	fornot2	%f4,	%f8,	%f4
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%f30
	fmovde	%icc,	%f1,	%f2
	ldub	[%l7 + 0x3C],	%o1
	fmovsa	%xcc,	%f17,	%f22
	andncc	%l5,	%i0,	%i7
	andcc	%o5,	0x0ED2,	%i6
	fornot2s	%f19,	%f16,	%f10
	movcs	%icc,	%i3,	%o2
	fpsub16	%f18,	%f18,	%f4
	sll	%i2,	%i1,	%o6
	mova	%icc,	%l2,	%g7
	or	%o0,	0x1357,	%l1
	xor	%g3,	%l4,	%i5
	udiv	%g2,	0x13E9,	%o7
	fands	%f6,	%f27,	%f17
	movpos	%icc,	%g5,	%g6
	edge8	%g4,	%o4,	%i4
	alignaddr	%g1,	%o3,	%l0
	andcc	%l3,	0x1684,	%l6
	fpack32	%f28,	%f18,	%f12
	sdivcc	%l5,	0x188E,	%o1
	edge8	%i7,	%i0,	%i6
	stb	%o5,	[%l7 + 0x13]
	srl	%i3,	0x06,	%o2
	fmovdcs	%icc,	%f27,	%f9
	ldsh	[%l7 + 0x7A],	%i2
	andncc	%o6,	%i1,	%l2
	ldx	[%l7 + 0x50],	%g7
	movrlz	%o0,	%g3,	%l1
	subc	%l4,	0x1B53,	%g2
	move	%icc,	%o7,	%i5
	add	%g6,	%g5,	%g4
	movl	%icc,	%o4,	%g1
	nop
	set	0x67, %g1
	ldub	[%l7 + %g1],	%i4
	addccc	%o3,	0x1F4F,	%l3
	fxnor	%f4,	%f20,	%f24
	sdiv	%l6,	0x02AA,	%l5
	fcmpne16	%f6,	%f28,	%o1
	fandnot1s	%f16,	%f28,	%f5
	srlx	%l0,	%i0,	%i7
	smul	%o5,	%i6,	%i3
	sdivcc	%o2,	0x0086,	%i2
	movvc	%icc,	%i1,	%l2
	fmul8x16	%f8,	%f28,	%f22
	fpmerge	%f11,	%f8,	%f10
	add	%g7,	%o0,	%g3
	fmovrslez	%l1,	%f6,	%f23
	popc	%o6,	%g2
	ldsh	[%l7 + 0x52],	%o7
	srl	%i5,	0x05,	%l4
	movvc	%icc,	%g6,	%g4
	ldd	[%l7 + 0x60],	%o4
	addc	%g5,	0x143C,	%i4
	movrlz	%g1,	%o3,	%l6
	movn	%icc,	%l3,	%o1
	orn	%l0,	%l5,	%i7
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	addccc	%i3,	0x13C5,	%o2
	sllx	%i6,	%i2,	%l2
	edge16	%i1,	%g7,	%o0
	sth	%g3,	[%l7 + 0x22]
	addccc	%o6,	%g2,	%o7
	lduh	[%l7 + 0x64],	%i5
	edge32	%l4,	%g6,	%g4
	edge8	%l1,	%o4,	%g5
	fmovsvc	%xcc,	%f30,	%f4
	mulscc	%g1,	0x18E8,	%i4
	movn	%icc,	%l6,	%o3
	move	%icc,	%l3,	%o1
	fnegd	%f12,	%f12
	ldsh	[%l7 + 0x78],	%l5
	sub	%i7,	%i0,	%l0
	sethi	0x0B30,	%i3
	fnot2	%f8,	%f4
	ldsw	[%l7 + 0x30],	%o5
	edge32n	%o2,	%i2,	%i6
	nop
	set	0x25, %o4
	stb	%i1,	[%l7 + %o4]
	udiv	%g7,	0x17D4,	%l2
	umulcc	%g3,	%o0,	%o6
	fmovdleu	%icc,	%f15,	%f11
	xnor	%o7,	%g2,	%i5
	movle	%icc,	%g6,	%l4
	fmovdn	%xcc,	%f20,	%f7
	lduh	[%l7 + 0x08],	%l1
	lduh	[%l7 + 0x20],	%o4
	movrgez	%g4,	0x1DA,	%g5
	ldd	[%l7 + 0x78],	%g0
	movrne	%i4,	0x0AE,	%l6
	orcc	%l3,	0x14E9,	%o3
	movcs	%xcc,	%o1,	%i7
	subcc	%l5,	0x1F88,	%l0
	fmovdge	%xcc,	%f15,	%f29
	umulcc	%i0,	0x1C69,	%i3
	sdivcc	%o5,	0x0436,	%i2
	lduh	[%l7 + 0x46],	%i6
	ldub	[%l7 + 0x1A],	%i1
	sra	%o2,	0x0D,	%l2
	edge8	%g3,	%o0,	%o6
	fmovrsgz	%g7,	%f5,	%f16
	movrne	%g2,	0x22C,	%i5
	save %g6, %l4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f18,	%f22
	edge16n	%o4,	%g4,	%l1
	or	%g5,	0x0EAE,	%i4
	andcc	%l6,	%g1,	%l3
	fsrc2	%f22,	%f0
	fandnot1	%f28,	%f28,	%f16
	andcc	%o1,	%i7,	%o3
	fmovscs	%icc,	%f22,	%f6
	edge16l	%l0,	%i0,	%l5
	fmovrdgez	%o5,	%f16,	%f20
	movcs	%icc,	%i3,	%i6
	addcc	%i2,	0x0EF8,	%o2
	ld	[%l7 + 0x68],	%f9
	udiv	%l2,	0x1C2D,	%g3
	or	%i1,	%o0,	%o6
	subc	%g7,	%g2,	%g6
	fmovrslz	%l4,	%f14,	%f8
	fmovse	%xcc,	%f31,	%f8
	sth	%o7,	[%l7 + 0x62]
	fnot1s	%f24,	%f3
	umulcc	%o4,	%i5,	%l1
	movvs	%xcc,	%g4,	%i4
	fandnot2s	%f8,	%f20,	%f15
	movne	%icc,	%g5,	%l6
	mova	%xcc,	%l3,	%o1
	lduw	[%l7 + 0x2C],	%g1
	sethi	0x01C4,	%i7
	fandnot1s	%f4,	%f30,	%f20
	movvs	%xcc,	%l0,	%i0
	fnot1	%f10,	%f28
	edge16l	%l5,	%o3,	%o5
	fmuld8ulx16	%f14,	%f16,	%f10
	ldd	[%l7 + 0x50],	%f4
	ldsh	[%l7 + 0x5E],	%i6
	xor	%i2,	%o2,	%i3
	ldsw	[%l7 + 0x34],	%l2
	movpos	%icc,	%g3,	%i1
	orncc	%o6,	%g7,	%g2
	andn	%g6,	0x1635,	%l4
	umul	%o7,	%o0,	%i5
	sra	%o4,	%g4,	%l1
	sll	%g5,	0x0C,	%l6
	movgu	%icc,	%i4,	%l3
	fnors	%f4,	%f7,	%f16
	alignaddr	%o1,	%i7,	%g1
	udiv	%i0,	0x1590,	%l5
	smulcc	%l0,	0x00DE,	%o3
	edge16ln	%i6,	%o5,	%i2
	fmovdl	%icc,	%f26,	%f28
	umulcc	%o2,	0x13C4,	%i3
	bshuffle	%f10,	%f18,	%f22
	srlx	%g3,	0x00,	%l2
	orncc	%o6,	0x1358,	%i1
	movleu	%icc,	%g7,	%g6
	movrlz	%g2,	0x1F8,	%o7
	lduw	[%l7 + 0x68],	%o0
	lduw	[%l7 + 0x18],	%l4
	std	%f8,	[%l7 + 0x20]
	movvc	%icc,	%i5,	%o4
	subc	%l1,	%g4,	%g5
	fmovdvc	%icc,	%f19,	%f9
	fxnors	%f0,	%f30,	%f24
	fpsub32	%f18,	%f0,	%f30
	movg	%xcc,	%i4,	%l6
	sth	%o1,	[%l7 + 0x76]
	stw	%l3,	[%l7 + 0x24]
	movge	%xcc,	%i7,	%g1
	movgu	%xcc,	%i0,	%l0
	st	%f10,	[%l7 + 0x2C]
	fcmpgt32	%f24,	%f20,	%l5
	movrgez	%o3,	%i6,	%o5
	fcmpgt16	%f4,	%f14,	%o2
	fmul8ulx16	%f2,	%f12,	%f8
	fcmple16	%f20,	%f0,	%i3
	restore %g3, %i2, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o6,	[%l7 + 0x17]
	edge8	%g7,	%i1,	%g2
	fmovrdgz	%g6,	%f12,	%f26
	subc	%o0,	%o7,	%i5
	orn	%o4,	0x1EFE,	%l1
	fmovsleu	%xcc,	%f29,	%f8
	srl	%g4,	%l4,	%g5
	orncc	%l6,	%o1,	%l3
	movne	%icc,	%i4,	%i7
	edge16ln	%i0,	%g1,	%l0
	fexpand	%f7,	%f10
	orcc	%l5,	0x14C8,	%o3
	fmovrsgz	%o5,	%f10,	%f2
	fxnor	%f18,	%f24,	%f22
	array8	%o2,	%i6,	%g3
	ldsw	[%l7 + 0x68],	%i3
	addccc	%l2,	0x0467,	%o6
	srlx	%g7,	%i1,	%g2
	orn	%i2,	%g6,	%o0
	fmovdne	%xcc,	%f9,	%f22
	sra	%o7,	0x18,	%i5
	srlx	%l1,	0x00,	%g4
	addccc	%o4,	%g5,	%l6
	addccc	%o1,	0x0DB3,	%l3
	lduh	[%l7 + 0x74],	%i4
	edge16l	%i7,	%l4,	%i0
	orcc	%g1,	0x04ED,	%l0
	movrgez	%l5,	%o3,	%o2
	fnot2	%f20,	%f16
	array8	%i6,	%g3,	%o5
	array16	%l2,	%i3,	%o6
	popc	0x1329,	%g7
	ld	[%l7 + 0x7C],	%f17
	orncc	%i1,	%i2,	%g6
	array32	%g2,	%o7,	%i5
	andn	%o0,	%g4,	%o4
	umul	%l1,	0x1FBB,	%g5
	movrgz	%o1,	%l3,	%l6
	nop
	set	0x78, %l2
	stx	%i7,	[%l7 + %l2]
	movg	%icc,	%l4,	%i4
	mova	%icc,	%i0,	%g1
	fmovrsgz	%l0,	%f24,	%f10
	fmovdpos	%icc,	%f4,	%f24
	movpos	%xcc,	%l5,	%o2
	sra	%o3,	0x0A,	%g3
	fmovrde	%i6,	%f28,	%f8
	array16	%o5,	%i3,	%l2
	movg	%xcc,	%g7,	%o6
	edge32l	%i1,	%i2,	%g2
	array8	%g6,	%i5,	%o7
	ldsh	[%l7 + 0x7C],	%o0
	edge16n	%g4,	%l1,	%o4
	fcmpgt32	%f12,	%f16,	%g5
	fmul8x16al	%f30,	%f23,	%f10
	edge16l	%l3,	%l6,	%i7
	and	%o1,	0x10C2,	%i4
	ldub	[%l7 + 0x28],	%i0
	andncc	%g1,	%l0,	%l4
	sdivx	%o2,	0x10B0,	%l5
	pdist	%f12,	%f28,	%f20
	andcc	%g3,	%i6,	%o5
	srl	%o3,	%i3,	%g7
	move	%icc,	%o6,	%l2
	ldd	[%l7 + 0x10],	%i0
	fcmped	%fcc0,	%f30,	%f24
	movpos	%xcc,	%i2,	%g6
	edge16	%g2,	%o7,	%o0
	fnands	%f10,	%f26,	%f26
	fmovrsgz	%i5,	%f14,	%f5
	stb	%l1,	[%l7 + 0x4D]
	sth	%g4,	[%l7 + 0x64]
	fmovsle	%icc,	%f29,	%f27
	orcc	%g5,	%l3,	%l6
	alignaddr	%i7,	%o4,	%i4
	xorcc	%o1,	0x1863,	%i0
	sth	%g1,	[%l7 + 0x40]
	sdivcc	%l4,	0x0EAE,	%l0
	nop
	set	0x2F, %g2
	stb	%l5,	[%l7 + %g2]
	array32	%g3,	%i6,	%o2
	fmuld8ulx16	%f17,	%f15,	%f2
	nop
	set	0x44, %i3
	lduw	[%l7 + %i3],	%o3
	ldd	[%l7 + 0x50],	%i2
	orn	%o5,	%o6,	%g7
	movrgz	%i1,	0x1D0,	%l2
	movrne	%g6,	%g2,	%o7
	edge16ln	%o0,	%i5,	%i2
	orcc	%l1,	0x113F,	%g4
	lduh	[%l7 + 0x42],	%g5
	mulscc	%l6,	0x08F7,	%i7
	edge32ln	%o4,	%i4,	%l3
	edge16n	%i0,	%g1,	%o1
	subc	%l4,	0x0201,	%l5
	stx	%g3,	[%l7 + 0x28]
	movpos	%xcc,	%i6,	%l0
	ldd	[%l7 + 0x68],	%f26
	fmul8sux16	%f10,	%f30,	%f22
	edge8	%o3,	%o2,	%i3
	mova	%xcc,	%o5,	%g7
	array16	%o6,	%i1,	%l2
	fmovdge	%xcc,	%f5,	%f27
	ld	[%l7 + 0x0C],	%f19
	edge8l	%g2,	%g6,	%o7
	stb	%i5,	[%l7 + 0x28]
	fmovsge	%icc,	%f25,	%f4
	fmovdcc	%xcc,	%f10,	%f31
	fmovdvs	%xcc,	%f19,	%f18
	fexpand	%f8,	%f14
	mulx	%o0,	0x159E,	%l1
	srl	%g4,	0x17,	%i2
	st	%f0,	[%l7 + 0x50]
	edge16n	%g5,	%i7,	%l6
	fnand	%f26,	%f24,	%f12
	fpack16	%f10,	%f24
	umulcc	%i4,	%l3,	%i0
	sdivx	%o4,	0x11B3,	%o1
	fnors	%f1,	%f20,	%f28
	movrgz	%g1,	0x0F8,	%l4
	edge32ln	%g3,	%i6,	%l0
	std	%f14,	[%l7 + 0x70]
	smulcc	%o3,	0x1DC4,	%l5
	edge16l	%o2,	%i3,	%o5
	movgu	%icc,	%o6,	%i1
	fnands	%f2,	%f20,	%f19
	array8	%l2,	%g7,	%g2
	movne	%icc,	%o7,	%i5
	movvc	%xcc,	%o0,	%g6
	std	%f10,	[%l7 + 0x10]
	add	%g4,	%l1,	%g5
	srl	%i7,	%i2,	%i4
	siam	0x5
	lduw	[%l7 + 0x14],	%l3
	xorcc	%l6,	0x1B16,	%i0
	udivcc	%o4,	0x0A81,	%o1
	edge32ln	%l4,	%g3,	%g1
	fone	%f22
	edge16ln	%i6,	%l0,	%l5
	fnegd	%f6,	%f10
	andncc	%o2,	%i3,	%o3
	lduw	[%l7 + 0x18],	%o5
	sdivcc	%o6,	0x0657,	%i1
	edge32	%g7,	%l2,	%o7
	alignaddr	%i5,	%o0,	%g2
	lduh	[%l7 + 0x40],	%g4
	xor	%l1,	0x087C,	%g6
	udivx	%i7,	0x12FC,	%i2
	edge8l	%i4,	%l3,	%g5
	save %i0, %l6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l4,	%g3,	%g1
	addccc	%o1,	%l0,	%l5
	movg	%icc,	%i6,	%o2
	movre	%o3,	%i3,	%o5
	udivcc	%i1,	0x06BE,	%o6
	ldsb	[%l7 + 0x4C],	%l2
	nop
	set	0x26, %i0
	stb	%o7,	[%l7 + %i0]
	fmovscs	%xcc,	%f29,	%f24
	udivcc	%i5,	0x1341,	%g7
	fmul8x16	%f18,	%f20,	%f30
	array16	%o0,	%g2,	%l1
	alignaddr	%g4,	%g6,	%i2
	edge32l	%i7,	%i4,	%g5
	fcmpeq32	%f0,	%f16,	%l3
	fpadd16	%f6,	%f0,	%f12
	sdiv	%l6,	0x0870,	%o4
	movn	%icc,	%i0,	%g3
	edge16	%g1,	%l4,	%l0
	pdist	%f22,	%f24,	%f6
	edge8ln	%o1,	%l5,	%o2
	sth	%o3,	[%l7 + 0x5E]
	fnot2s	%f28,	%f22
	add	%i6,	0x068B,	%o5
	subc	%i3,	%o6,	%l2
	ld	[%l7 + 0x64],	%f7
	movl	%icc,	%i1,	%o7
	array8	%i5,	%o0,	%g2
	movrne	%l1,	%g7,	%g4
	ldsh	[%l7 + 0x10],	%i2
	andn	%g6,	0x1EBC,	%i4
	fpsub16s	%f18,	%f4,	%f18
	fmovrse	%i7,	%f8,	%f3
	fmovdcs	%icc,	%f26,	%f23
	umul	%g5,	%l3,	%l6
	umulcc	%o4,	%i0,	%g1
	fmovdvs	%icc,	%f5,	%f11
	movle	%xcc,	%l4,	%g3
	srax	%l0,	%l5,	%o2
	ldsb	[%l7 + 0x7D],	%o3
	sll	%i6,	0x0D,	%o5
	movvs	%icc,	%o1,	%o6
	orn	%l2,	0x0646,	%i3
	ld	[%l7 + 0x64],	%f23
	orcc	%o7,	0x0B30,	%i1
	std	%f10,	[%l7 + 0x70]
	udiv	%i5,	0x1ED9,	%o0
	movleu	%icc,	%l1,	%g2
	srl	%g4,	0x15,	%i2
	sdivx	%g6,	0x07D3,	%i4
	udivx	%g7,	0x1C38,	%g5
	addc	%l3,	%i7,	%l6
	sllx	%o4,	%g1,	%i0
	movcc	%xcc,	%g3,	%l4
	orcc	%l5,	0x0D30,	%l0
	fcmple32	%f28,	%f20,	%o3
	fornot2	%f22,	%f16,	%f6
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	fandnot1	%f26,	%f4,	%f10
	sdiv	%o2,	0x134B,	%o6
	fandnot2s	%f6,	%f5,	%f11
	array32	%i3,	%o7,	%i1
	fcmple16	%f2,	%f22,	%l2
	edge32	%i5,	%l1,	%g2
	edge32l	%o0,	%g4,	%g6
	mova	%xcc,	%i2,	%g7
	std	%f24,	[%l7 + 0x60]
	subccc	%i4,	%l3,	%i7
	addccc	%g5,	0x1C7B,	%o4
	sth	%g1,	[%l7 + 0x48]
	ldd	[%l7 + 0x48],	%f18
	stx	%i0,	[%l7 + 0x18]
	xor	%g3,	0x0091,	%l6
	ldd	[%l7 + 0x28],	%l4
	sub	%l0,	0x0945,	%l4
	edge32	%o3,	%i6,	%o5
	stw	%o1,	[%l7 + 0x08]
	edge32l	%o2,	%o6,	%i3
	xnor	%o7,	0x1AB3,	%i1
	movrlz	%l2,	0x32F,	%i5
	movvs	%icc,	%g2,	%o0
	edge32l	%l1,	%g4,	%g6
	addc	%i2,	0x07CA,	%g7
	edge16n	%i4,	%l3,	%i7
	fpsub32	%f10,	%f0,	%f16
	orn	%o4,	%g5,	%g1
	fmovrsgz	%g3,	%f27,	%f20
	std	%f2,	[%l7 + 0x78]
	edge32n	%i0,	%l5,	%l6
	ldsw	[%l7 + 0x38],	%l0
	edge8ln	%o3,	%l4,	%o5
	movleu	%xcc,	%i6,	%o2
	alignaddr	%o1,	%o6,	%i3
	sth	%i1,	[%l7 + 0x36]
	udivx	%l2,	0x1CF6,	%i5
	addcc	%g2,	%o7,	%o0
	stb	%g4,	[%l7 + 0x3C]
	movre	%l1,	0x36D,	%g6
	lduw	[%l7 + 0x2C],	%g7
	fcmpne16	%f18,	%f2,	%i2
	edge8ln	%l3,	%i7,	%i4
	edge32	%g5,	%g1,	%g3
	ldsb	[%l7 + 0x46],	%o4
	sub	%l5,	%l6,	%i0
	movvs	%xcc,	%l0,	%o3
	sub	%o5,	%i6,	%o2
	movrlez	%o1,	0x2A9,	%l4
	std	%f28,	[%l7 + 0x60]
	movcs	%icc,	%i3,	%i1
	sdiv	%o6,	0x1E15,	%l2
	std	%f16,	[%l7 + 0x38]
	array16	%i5,	%g2,	%o7
	smul	%o0,	%l1,	%g6
	movpos	%icc,	%g4,	%i2
	ldx	[%l7 + 0x28],	%l3
	stx	%g7,	[%l7 + 0x40]
	fmul8sux16	%f18,	%f8,	%f26
	movne	%icc,	%i7,	%i4
	lduh	[%l7 + 0x64],	%g1
	stb	%g5,	[%l7 + 0x0A]
	restore %o4, %g3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%i0,	%l0
	ldd	[%l7 + 0x50],	%f14
	movl	%xcc,	%o3,	%l5
	edge32n	%i6,	%o2,	%o5
	mulx	%o1,	%i3,	%l4
	movgu	%icc,	%o6,	%l2
	edge8l	%i5,	%g2,	%i1
	movvs	%icc,	%o0,	%l1
	subccc	%g6,	%g4,	%i2
	edge16	%o7,	%l3,	%g7
	std	%f20,	[%l7 + 0x40]
	movg	%icc,	%i7,	%g1
	udivx	%g5,	0x02AB,	%o4
	fmovsvs	%icc,	%f10,	%f15
	fmovrse	%g3,	%f1,	%f22
	edge8l	%i4,	%i0,	%l6
	movneg	%icc,	%l0,	%l5
	sll	%i6,	%o2,	%o5
	udiv	%o3,	0x10D1,	%i3
	movl	%icc,	%o1,	%o6
	edge16n	%l2,	%i5,	%l4
	fxors	%f27,	%f18,	%f9
	edge8	%i1,	%o0,	%g2
	fmovsleu	%icc,	%f23,	%f19
	fmovdn	%xcc,	%f12,	%f16
	sir	0x186D
	movge	%icc,	%g6,	%l1
	edge8l	%g4,	%o7,	%i2
	andncc	%g7,	%i7,	%l3
	movrlz	%g5,	0x3B3,	%o4
	andcc	%g3,	0x0EF2,	%g1
	movpos	%xcc,	%i0,	%l6
	fmovdpos	%icc,	%f24,	%f11
	addccc	%i4,	0x179D,	%l0
	stw	%l5,	[%l7 + 0x24]
	fmovspos	%icc,	%f26,	%f31
	addccc	%i6,	%o2,	%o3
	save %o5, %o1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o6,	0x166D,	%l2
	fsrc2	%f6,	%f4
	fnors	%f8,	%f17,	%f29
	srax	%i5,	0x1F,	%i1
	movcc	%xcc,	%l4,	%g2
	movge	%icc,	%g6,	%l1
	srlx	%g4,	0x16,	%o7
	movrlez	%i2,	0x055,	%o0
	st	%f27,	[%l7 + 0x50]
	subccc	%i7,	%g7,	%g5
	smulcc	%o4,	0x0F23,	%l3
	smulcc	%g1,	%i0,	%g3
	xor	%l6,	0x14D5,	%i4
	pdist	%f0,	%f14,	%f14
	movrlz	%l0,	%i6,	%o2
	sdivcc	%o3,	0x1BE7,	%o5
	sdiv	%o1,	0x001F,	%l5
	fcmps	%fcc0,	%f27,	%f14
	smul	%o6,	%i3,	%l2
	edge16n	%i1,	%l4,	%g2
	subccc	%i5,	0x1DEA,	%g6
	fmovdge	%xcc,	%f7,	%f25
	save %g4, 0x0E38, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i2,	%o0,	%o7
	subcc	%g7,	%i7,	%g5
	orcc	%o4,	0x067B,	%l3
	alignaddrl	%i0,	%g3,	%l6
	st	%f18,	[%l7 + 0x28]
	fmovs	%f20,	%f22
	addc	%g1,	%l0,	%i6
	xor	%i4,	0x0BE6,	%o3
	orn	%o5,	0x10F5,	%o2
	edge16l	%o1,	%o6,	%i3
	subcc	%l2,	%l5,	%i1
	add	%l4,	0x0101,	%g2
	movleu	%xcc,	%g6,	%g4
	edge8	%l1,	%i5,	%o0
	movrlez	%o7,	0x199,	%i2
	fmul8sux16	%f18,	%f20,	%f8
	umulcc	%i7,	0x10A9,	%g7
	movl	%icc,	%o4,	%l3
	smul	%i0,	%g5,	%g3
	fsrc2	%f4,	%f0
	ldsw	[%l7 + 0x54],	%l6
	fpadd16s	%f24,	%f17,	%f16
	srax	%l0,	%g1,	%i6
	orncc	%o3,	%i4,	%o5
	fmovscs	%icc,	%f2,	%f22
	fmovsle	%xcc,	%f24,	%f23
	ld	[%l7 + 0x38],	%f25
	edge16l	%o2,	%o1,	%o6
	movne	%icc,	%i3,	%l5
	fnot1s	%f19,	%f9
	ldsw	[%l7 + 0x34],	%i1
	movgu	%icc,	%l2,	%g2
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	ldd	[%l7 + 0x60],	%i4
	sllx	%g4,	%o0,	%i2
	fmul8x16al	%f0,	%f6,	%f8
	sdivcc	%o7,	0x1522,	%g7
	smul	%i7,	0x035C,	%l3
	fzeros	%f13
	edge8n	%i0,	%g5,	%o4
	xorcc	%g3,	%l6,	%g1
	nop
	set	0x20, %l0
	ldub	[%l7 + %l0],	%l0
	alignaddr	%o3,	%i6,	%o5
	fabsd	%f20,	%f18
	sub	%i4,	%o1,	%o2
	fcmpeq32	%f24,	%f26,	%o6
	edge8	%i3,	%l5,	%i1
	array16	%g2,	%l2,	%g6
	smul	%l1,	0x0EF6,	%l4
	or	%g4,	%o0,	%i5
	orncc	%o7,	0x0645,	%i2
	nop
	set	0x40, %l4
	std	%f14,	[%l7 + %l4]
	fpsub16	%f28,	%f10,	%f6
	srax	%i7,	%g7,	%l3
	fmovdn	%xcc,	%f8,	%f18
	edge8	%g5,	%i0,	%o4
	restore %l6, 0x0C05, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g3,	%l0,	%o3
	andncc	%i6,	%o5,	%o1
	array8	%o2,	%i4,	%o6
	fmovdge	%xcc,	%f19,	%f26
	st	%f27,	[%l7 + 0x18]
	umulcc	%i3,	%l5,	%i1
	fcmped	%fcc2,	%f6,	%f12
	andncc	%g2,	%l2,	%g6
	fcmpne32	%f16,	%f28,	%l4
	udivx	%g4,	0x1CE7,	%o0
	fmovscc	%xcc,	%f20,	%f6
	movgu	%icc,	%i5,	%l1
	fxnors	%f18,	%f23,	%f23
	fnand	%f24,	%f8,	%f20
	movcc	%xcc,	%i2,	%i7
	lduh	[%l7 + 0x1C],	%g7
	and	%l3,	0x00BF,	%o7
	fmovscs	%icc,	%f26,	%f19
	array32	%g5,	%i0,	%o4
	addcc	%l6,	0x104E,	%g1
	xorcc	%l0,	0x0AEA,	%o3
	alignaddrl	%i6,	%g3,	%o1
	array32	%o2,	%i4,	%o6
	sub	%o5,	%i3,	%i1
	addc	%l5,	%g2,	%g6
	std	%f12,	[%l7 + 0x18]
	smulcc	%l2,	0x0E13,	%g4
	sdivcc	%l4,	0x1848,	%o0
	sdivcc	%i5,	0x1B7D,	%l1
	edge32ln	%i2,	%g7,	%l3
	fmovsle	%icc,	%f23,	%f26
	fnor	%f24,	%f18,	%f16
	stw	%i7,	[%l7 + 0x08]
	mulscc	%o7,	0x0DB3,	%g5
	sllx	%o4,	0x17,	%i0
	movge	%xcc,	%l6,	%g1
	fmovrslez	%o3,	%f27,	%f11
	movpos	%icc,	%l0,	%g3
	alignaddr	%i6,	%o1,	%o2
	movgu	%xcc,	%i4,	%o5
	lduw	[%l7 + 0x18],	%o6
	edge16l	%i3,	%l5,	%i1
	sdivcc	%g6,	0x0A62,	%g2
	st	%f25,	[%l7 + 0x34]
	ldx	[%l7 + 0x40],	%g4
	movle	%xcc,	%l2,	%o0
	fors	%f5,	%f1,	%f7
	stx	%l4,	[%l7 + 0x08]
	popc	%i5,	%i2
	alignaddr	%l1,	%g7,	%l3
	movrgz	%o7,	0x3C7,	%i7
	ldsb	[%l7 + 0x5D],	%g5
	fmovdneg	%xcc,	%f13,	%f31
	ldsb	[%l7 + 0x5A],	%o4
	umul	%i0,	0x1294,	%g1
	ldsh	[%l7 + 0x3E],	%l6
	andcc	%o3,	%l0,	%g3
	popc	0x0F03,	%o1
	srax	%i6,	0x13,	%i4
	array8	%o2,	%o5,	%i3
	fandnot2	%f16,	%f20,	%f0
	movn	%icc,	%l5,	%o6
	umulcc	%g6,	%i1,	%g4
	subc	%g2,	0x1FFA,	%l2
	add	%o0,	%l4,	%i2
	orcc	%l1,	0x08DE,	%i5
	sdivx	%g7,	0x0C35,	%o7
	fmovrdgz	%l3,	%f20,	%f6
	fandnot2s	%f19,	%f28,	%f15
	movcc	%xcc,	%g5,	%o4
	edge8n	%i0,	%i7,	%g1
	edge32l	%l6,	%o3,	%g3
	sllx	%l0,	%o1,	%i6
	sll	%i4,	%o2,	%i3
	movl	%xcc,	%o5,	%l5
	movgu	%xcc,	%g6,	%o6
	smul	%i1,	%g4,	%l2
	ldd	[%l7 + 0x18],	%f20
	lduw	[%l7 + 0x20],	%g2
	fones	%f4
	addc	%o0,	0x0936,	%i2
	fnors	%f29,	%f27,	%f3
	sdiv	%l4,	0x0215,	%i5
	edge16l	%l1,	%o7,	%g7
	srax	%g5,	0x1D,	%l3
	movvc	%icc,	%i0,	%o4
	andcc	%i7,	0x162E,	%g1
	fand	%f16,	%f24,	%f6
	edge32l	%o3,	%l6,	%g3
	xorcc	%l0,	%o1,	%i6
	movcc	%xcc,	%i4,	%i3
	smulcc	%o5,	%l5,	%o2
	fandnot1s	%f2,	%f2,	%f11
	alignaddrl	%o6,	%i1,	%g4
	umulcc	%g6,	0x116C,	%l2
	movl	%icc,	%o0,	%g2
	movneg	%xcc,	%l4,	%i5
	xnorcc	%i2,	%o7,	%g7
	movvc	%icc,	%l1,	%g5
	fxnor	%f10,	%f10,	%f24
	movre	%l3,	%o4,	%i7
	sdivcc	%g1,	0x0DAE,	%o3
	fnor	%f28,	%f8,	%f6
	ldd	[%l7 + 0x60],	%f14
	udivcc	%i0,	0x1FB6,	%g3
	stb	%l0,	[%l7 + 0x5C]
	movcc	%icc,	%l6,	%i6
	movpos	%xcc,	%i4,	%i3
	sdivx	%o1,	0x1AD9,	%l5
	fmovdvs	%xcc,	%f31,	%f4
	fornot2	%f30,	%f10,	%f8
	orn	%o5,	%o2,	%o6
	ldd	[%l7 + 0x48],	%i0
	orcc	%g6,	%g4,	%o0
	udivcc	%g2,	0x0561,	%l2
	fmul8x16	%f30,	%f6,	%f22
	subccc	%i5,	0x02D5,	%i2
	lduh	[%l7 + 0x7C],	%o7
	edge16l	%l4,	%g7,	%g5
	sethi	0x1A7B,	%l3
	umulcc	%o4,	%i7,	%l1
	sra	%o3,	%i0,	%g1
	fmovsa	%xcc,	%f8,	%f14
	fnands	%f9,	%f5,	%f12
	move	%icc,	%g3,	%l0
	ld	[%l7 + 0x34],	%f8
	smulcc	%i6,	0x1384,	%l6
	sdivx	%i4,	0x0FC1,	%i3
	andn	%l5,	%o5,	%o1
	movrgez	%o6,	0x28D,	%i1
	edge32ln	%o2,	%g4,	%g6
	umulcc	%o0,	%g2,	%l2
	alignaddr	%i5,	%i2,	%o7
	udiv	%g7,	0x1881,	%g5
	fmovrsgez	%l4,	%f11,	%f0
	mulscc	%l3,	0x0CF6,	%o4
	fpadd32s	%f19,	%f0,	%f25
	movrgz	%l1,	0x352,	%o3
	stw	%i0,	[%l7 + 0x10]
	subcc	%g1,	0x1C59,	%i7
	mova	%xcc,	%l0,	%g3
	fxnors	%f20,	%f1,	%f31
	sub	%l6,	%i6,	%i3
	lduh	[%l7 + 0x68],	%l5
	movrlz	%i4,	%o1,	%o6
	movvs	%xcc,	%i1,	%o2
	sll	%o5,	%g4,	%o0
	st	%f0,	[%l7 + 0x3C]
	mulx	%g2,	%g6,	%i5
	ldd	[%l7 + 0x38],	%f20
	edge32ln	%l2,	%i2,	%g7
	fcmpne32	%f24,	%f2,	%o7
	fsrc2	%f10,	%f6
	movle	%xcc,	%l4,	%g5
	smul	%l3,	0x06DE,	%o4
	st	%f9,	[%l7 + 0x08]
	edge8ln	%l1,	%i0,	%g1
	add	%o3,	0x1948,	%l0
	movrgz	%i7,	%l6,	%i6
	fmovdne	%xcc,	%f19,	%f25
	umul	%g3,	%i3,	%i4
	movrlz	%o1,	0x329,	%l5
	save %o6, %i1, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%g4,	%o2
	udiv	%g2,	0x137A,	%o0
	sethi	0x1FC4,	%g6
	and	%l2,	%i5,	%g7
	movrlez	%i2,	0x195,	%l4
	addc	%o7,	0x138A,	%l3
	ld	[%l7 + 0x3C],	%f20
	popc	%o4,	%g5
	orcc	%i0,	0x02B8,	%l1
	edge8n	%g1,	%l0,	%i7
	fandnot1	%f10,	%f20,	%f2
	xor	%o3,	0x143E,	%i6
	fandnot1s	%f11,	%f5,	%f10
	stb	%g3,	[%l7 + 0x44]
	edge32l	%l6,	%i4,	%i3
	movge	%icc,	%o1,	%l5
	ld	[%l7 + 0x5C],	%f21
	srlx	%i1,	%o5,	%g4
	addccc	%o2,	0x124A,	%g2
	movge	%xcc,	%o0,	%g6
	ldx	[%l7 + 0x18],	%l2
	andncc	%i5,	%o6,	%i2
	edge16ln	%l4,	%g7,	%l3
	sth	%o7,	[%l7 + 0x2C]
	ldub	[%l7 + 0x09],	%g5
	ldx	[%l7 + 0x38],	%i0
	orncc	%o4,	0x0B38,	%g1
	fzero	%f14
	ld	[%l7 + 0x54],	%f14
	subc	%l0,	%i7,	%l1
	movrlez	%i6,	0x040,	%o3
	andn	%l6,	%g3,	%i4
	srax	%i3,	%o1,	%l5
	edge32ln	%i1,	%o5,	%g4
	subccc	%g2,	0x0658,	%o2
	ldx	[%l7 + 0x30],	%o0
	andcc	%g6,	%i5,	%o6
	udiv	%i2,	0x1129,	%l2
	fpsub32	%f24,	%f28,	%f26
	fmuld8sux16	%f15,	%f26,	%f10
	lduw	[%l7 + 0x5C],	%g7
	stb	%l3,	[%l7 + 0x47]
	orncc	%l4,	0x1863,	%o7
	fcmple16	%f4,	%f6,	%i0
	sth	%o4,	[%l7 + 0x1C]
	lduh	[%l7 + 0x3A],	%g1
	ldx	[%l7 + 0x08],	%l0
	addc	%g5,	0x0D2F,	%l1
	sub	%i7,	%i6,	%l6
	fcmpne32	%f0,	%f18,	%o3
	movrne	%i4,	%g3,	%o1
	fsrc1s	%f5,	%f12
	alignaddrl	%l5,	%i3,	%o5
	fnands	%f18,	%f23,	%f14
	fpadd16	%f6,	%f26,	%f18
	umulcc	%i1,	0x194A,	%g2
	umulcc	%g4,	%o2,	%g6
	fmovrdlez	%i5,	%f22,	%f12
	fmovd	%f16,	%f2
	lduw	[%l7 + 0x4C],	%o0
	fone	%f10
	st	%f15,	[%l7 + 0x7C]
	movrlz	%o6,	%l2,	%g7
	movne	%xcc,	%l3,	%i2
	fmovrde	%o7,	%f30,	%f22
	fpadd32s	%f0,	%f22,	%f18
	edge16n	%i0,	%l4,	%o4
	xnor	%g1,	%g5,	%l1
	ld	[%l7 + 0x08],	%f25
	edge32ln	%l0,	%i6,	%l6
	fors	%f17,	%f29,	%f22
	smul	%i7,	%i4,	%g3
	orncc	%o1,	%o3,	%l5
	fands	%f23,	%f22,	%f18
	edge16ln	%i3,	%o5,	%i1
	sdivcc	%g4,	0x0826,	%o2
	fabss	%f2,	%f5
	fone	%f14
	ldsh	[%l7 + 0x4E],	%g6
	ldsb	[%l7 + 0x4A],	%g2
	sub	%o0,	%o6,	%l2
	fmovrdlez	%i5,	%f18,	%f4
	fmovrsgez	%g7,	%f27,	%f21
	xor	%l3,	0x0440,	%i2
	sllx	%i0,	%l4,	%o7
	movrgez	%g1,	%o4,	%l1
	ldub	[%l7 + 0x43],	%g5
	movle	%icc,	%l0,	%i6
	sllx	%i7,	%i4,	%g3
	movleu	%icc,	%l6,	%o1
	srlx	%o3,	0x13,	%l5
	subc	%i3,	0x1070,	%o5
	nop
	set	0x3C, %l6
	stw	%i1,	[%l7 + %l6]
	sdivx	%o2,	0x05ED,	%g6
	andcc	%g4,	%g2,	%o0
	movne	%icc,	%o6,	%l2
	fors	%f1,	%f5,	%f18
	addcc	%i5,	0x1FB6,	%l3
	udivx	%i2,	0x047E,	%i0
	sll	%g7,	0x05,	%l4
	smul	%g1,	%o7,	%o4
	orn	%g5,	%l0,	%i6
	sub	%l1,	%i7,	%g3
	movneg	%icc,	%l6,	%o1
	nop
	set	0x49, %o0
	ldsb	[%l7 + %o0],	%o3
	fandnot2	%f2,	%f14,	%f8
	fpsub32s	%f16,	%f1,	%f17
	movle	%icc,	%i4,	%i3
	xorcc	%o5,	0x1D3C,	%l5
	move	%xcc,	%o2,	%g6
	ldub	[%l7 + 0x4D],	%i1
	andncc	%g2,	%g4,	%o0
	lduw	[%l7 + 0x34],	%o6
	andncc	%l2,	%l3,	%i5
	popc	0x13FD,	%i2
	smul	%i0,	0x0246,	%l4
	movcs	%icc,	%g7,	%o7
	addc	%g1,	%g5,	%l0
	add	%o4,	0x1415,	%i6
	fone	%f12
	udivx	%i7,	0x039D,	%l1
	andn	%g3,	%l6,	%o1
	smulcc	%o3,	%i4,	%i3
	add	%o5,	0x1D26,	%o2
	orncc	%g6,	0x03B4,	%l5
	fmovdn	%icc,	%f8,	%f6
	movrne	%i1,	0x2B7,	%g4
	movrlez	%g2,	%o0,	%o6
	srlx	%l2,	0x0E,	%i5
	addccc	%i2,	0x0B4B,	%i0
	udivcc	%l3,	0x1AFE,	%g7
	ldub	[%l7 + 0x6E],	%o7
	ld	[%l7 + 0x60],	%f5
	fcmped	%fcc0,	%f14,	%f18
	sdivcc	%g1,	0x0C2D,	%l4
	move	%xcc,	%g5,	%l0
	stw	%o4,	[%l7 + 0x24]
	fcmpes	%fcc1,	%f13,	%f3
	fmovsne	%icc,	%f24,	%f6
	edge16ln	%i6,	%l1,	%g3
	udivcc	%l6,	0x0F2F,	%i7
	array16	%o3,	%i4,	%o1
	mova	%xcc,	%i3,	%o2
	fandnot1	%f24,	%f24,	%f12
	srlx	%o5,	0x1F,	%l5
	movvs	%icc,	%g6,	%g4
	fmovsneg	%xcc,	%f20,	%f19
	save %g2, %o0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l2,	%o6,	%i2
	popc	0x1F95,	%i5
	fmovsvc	%icc,	%f17,	%f0
	movl	%xcc,	%i0,	%g7
	fpsub32	%f28,	%f16,	%f22
	udiv	%o7,	0x0080,	%g1
	fmovdg	%xcc,	%f4,	%f29
	orcc	%l4,	0x104B,	%g5
	popc	0x0ACD,	%l0
	fcmpgt32	%f24,	%f14,	%l3
	stb	%o4,	[%l7 + 0x3E]
	ldsb	[%l7 + 0x62],	%l1
	subc	%i6,	%l6,	%g3
	edge32ln	%i7,	%o3,	%i4
	xorcc	%i3,	0x07B0,	%o1
	xor	%o5,	%l5,	%g6
	fmul8ulx16	%f8,	%f2,	%f10
	move	%icc,	%g4,	%o2
	fandnot2	%f4,	%f26,	%f20
	edge8l	%o0,	%i1,	%l2
	stw	%o6,	[%l7 + 0x08]
	sub	%g2,	%i2,	%i0
	movcs	%icc,	%i5,	%o7
	lduw	[%l7 + 0x6C],	%g1
	popc	0x033A,	%l4
	lduw	[%l7 + 0x70],	%g5
	fands	%f13,	%f16,	%f26
	fpsub32	%f0,	%f26,	%f18
	srax	%l0,	%l3,	%g7
	stb	%o4,	[%l7 + 0x58]
	fcmpne32	%f0,	%f28,	%i6
	fmovsvs	%xcc,	%f15,	%f17
	array32	%l1,	%g3,	%i7
	lduw	[%l7 + 0x24],	%o3
	st	%f25,	[%l7 + 0x58]
	edge16	%l6,	%i3,	%o1
	fmul8x16	%f0,	%f4,	%f18
	movge	%xcc,	%o5,	%i4
	fmovsvs	%xcc,	%f1,	%f28
	edge32ln	%g6,	%l5,	%o2
	sdivx	%o0,	0x17ED,	%i1
	ldub	[%l7 + 0x39],	%g4
	fexpand	%f22,	%f16
	sra	%o6,	0x11,	%l2
	alignaddr	%g2,	%i0,	%i5
	udivx	%o7,	0x05D2,	%g1
	ldsb	[%l7 + 0x69],	%l4
	fcmple16	%f12,	%f14,	%i2
	fnand	%f2,	%f30,	%f8
	for	%f20,	%f4,	%f20
	stb	%g5,	[%l7 + 0x65]
	movcc	%xcc,	%l3,	%g7
	fmovsleu	%xcc,	%f26,	%f0
	edge32ln	%o4,	%i6,	%l1
	movre	%l0,	%g3,	%i7
	movle	%xcc,	%o3,	%i3
	movvc	%icc,	%o1,	%l6
	std	%f30,	[%l7 + 0x20]
	andn	%i4,	0x0E5F,	%o5
	sra	%l5,	%o2,	%g6
	edge16n	%o0,	%g4,	%i1
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	or	%l2,	0x1CE9,	%i5
	move	%xcc,	%o7,	%i0
	stw	%g1,	[%l7 + 0x0C]
	xnorcc	%i2,	0x0C4A,	%g5
	lduh	[%l7 + 0x14],	%l4
	movre	%l3,	%o4,	%i6
	sdiv	%g7,	0x1FD3,	%l0
	fmovspos	%xcc,	%f27,	%f22
	movgu	%icc,	%l1,	%i7
	edge32n	%g3,	%o3,	%o1
	andcc	%l6,	%i3,	%o5
	srl	%i4,	%l5,	%o2
	udivx	%o0,	0x15D5,	%g6
	add	%i1,	0x146B,	%g4
	orn	%g2,	0x1643,	%o6
	fmovrse	%i5,	%f13,	%f4
	fmovse	%xcc,	%f28,	%f21
	std	%f22,	[%l7 + 0x68]
	lduh	[%l7 + 0x50],	%l2
	stx	%o7,	[%l7 + 0x60]
	alignaddrl	%i0,	%g1,	%i2
	andncc	%l4,	%l3,	%g5
	movrlz	%i6,	%o4,	%g7
	orn	%l0,	%l1,	%g3
	andcc	%o3,	%i7,	%l6
	movleu	%xcc,	%i3,	%o1
	fcmpeq32	%f26,	%f22,	%o5
	smul	%i4,	%l5,	%o2
	subc	%g6,	%i1,	%o0
	ldsw	[%l7 + 0x64],	%g4
	sllx	%g2,	0x0C,	%o6
	edge8n	%i5,	%o7,	%i0
	restore %l2, %i2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x59],	%l3
	edge8l	%g1,	%g5,	%o4
	xorcc	%g7,	0x0378,	%l0
	sth	%i6,	[%l7 + 0x5C]
	mova	%icc,	%l1,	%g3
	srlx	%o3,	%l6,	%i7
	sdiv	%i3,	0x0545,	%o5
	udivcc	%o1,	0x191C,	%l5
	edge32n	%i4,	%g6,	%o2
	fmovd	%f12,	%f24
	movg	%icc,	%o0,	%g4
	alignaddr	%i1,	%g2,	%i5
	ldub	[%l7 + 0x22],	%o6
	edge8ln	%i0,	%o7,	%l2
	fmuld8sux16	%f17,	%f14,	%f24
	srax	%i2,	0x16,	%l3
	array8	%g1,	%l4,	%o4
	fxor	%f14,	%f12,	%f12
	edge16l	%g7,	%g5,	%l0
	edge16n	%i6,	%g3,	%o3
	andn	%l6,	0x1653,	%l1
	smulcc	%i7,	0x146A,	%i3
	movcc	%xcc,	%o1,	%l5
	udivx	%i4,	0x03C4,	%g6
	move	%xcc,	%o2,	%o0
	udivcc	%g4,	0x0B56,	%i1
	alignaddr	%g2,	%i5,	%o6
	fmovdpos	%xcc,	%f6,	%f24
	orcc	%o5,	%o7,	%i0
	addc	%l2,	%i2,	%g1
	movrgez	%l3,	0x3FE,	%l4
	andcc	%g7,	0x0F40,	%o4
	fmuld8sux16	%f26,	%f19,	%f22
	edge32ln	%g5,	%i6,	%g3
	sdivx	%l0,	0x01FF,	%l6
	orn	%l1,	0x00DE,	%o3
	array16	%i7,	%i3,	%l5
	fxor	%f24,	%f20,	%f26
	sub	%i4,	0x1AB7,	%g6
	move	%xcc,	%o1,	%o2
	mulx	%o0,	0x11CA,	%g4
	xnor	%g2,	0x0C7B,	%i1
	fabsd	%f28,	%f0
	sub	%o6,	%o5,	%i5
	edge16l	%i0,	%o7,	%i2
	fmovda	%icc,	%f27,	%f17
	lduw	[%l7 + 0x60],	%l2
	array16	%l3,	%g1,	%g7
	fxnors	%f10,	%f26,	%f23
	fabsd	%f30,	%f4
	fmovdcc	%icc,	%f15,	%f24
	movre	%o4,	0x3E1,	%g5
	orcc	%i6,	0x0DE1,	%l4
	fpadd32	%f10,	%f30,	%f16
	addc	%l0,	%g3,	%l1
	movre	%l6,	%o3,	%i7
	sub	%i3,	%i4,	%g6
	fmovsvs	%icc,	%f21,	%f30
	movrne	%l5,	%o2,	%o0
	movpos	%icc,	%o1,	%g2
	orncc	%i1,	%g4,	%o5
	and	%o6,	%i5,	%o7
	array16	%i2,	%i0,	%l3
	stw	%g1,	[%l7 + 0x74]
	movrne	%g7,	0x030,	%l2
	lduw	[%l7 + 0x44],	%o4
	sllx	%g5,	0x00,	%i6
	movre	%l0,	%g3,	%l1
	smul	%l4,	%o3,	%l6
	nop
	set	0x28, %l3
	ldd	[%l7 + %l3],	%f22
	nop
	set	0x38, %o3
	std	%f18,	[%l7 + %o3]
	mova	%xcc,	%i7,	%i4
	andcc	%i3,	%l5,	%g6
	xor	%o2,	0x0ADF,	%o1
	edge32l	%o0,	%g2,	%i1
	ld	[%l7 + 0x14],	%f15
	fnot1s	%f12,	%f23
	udivcc	%g4,	0x011E,	%o5
	fabss	%f20,	%f29
	lduh	[%l7 + 0x74],	%i5
	movn	%icc,	%o7,	%o6
	edge16ln	%i2,	%l3,	%g1
	orcc	%i0,	0x08D6,	%g7
	fzeros	%f19
	orcc	%o4,	%g5,	%i6
	sdivx	%l0,	0x0724,	%l2
	movgu	%icc,	%g3,	%l4
	subcc	%l1,	0x098F,	%l6
	pdist	%f4,	%f6,	%f30
	movrlez	%i7,	%i4,	%i3
	sir	0x032C
	fabsd	%f4,	%f12
	andcc	%l5,	%g6,	%o3
	edge8	%o1,	%o2,	%g2
	sll	%o0,	%g4,	%o5
	movgu	%icc,	%i5,	%i1
	sllx	%o7,	%o6,	%l3
	edge16	%g1,	%i2,	%i0
	movre	%o4,	%g7,	%i6
	addccc	%g5,	%l0,	%l2
	movvs	%icc,	%l4,	%l1
	move	%icc,	%g3,	%l6
	fmovdle	%icc,	%f10,	%f29
	edge16l	%i4,	%i7,	%i3
	fmovscc	%icc,	%f7,	%f10
	movrgez	%l5,	0x251,	%o3
	fornot2s	%f0,	%f14,	%f10
	fmovsle	%xcc,	%f9,	%f9
	sllx	%o1,	%g6,	%o2
	movrlz	%o0,	%g2,	%g4
	edge8	%i5,	%o5,	%i1
	sethi	0x0B33,	%o6
	edge8n	%o7,	%g1,	%l3
	orn	%i2,	%o4,	%i0
	movgu	%xcc,	%g7,	%g5
	edge8n	%l0,	%l2,	%l4
	edge16	%l1,	%i6,	%l6
	subccc	%i4,	0x1588,	%g3
	sllx	%i3,	0x0C,	%i7
	lduw	[%l7 + 0x64],	%o3
	srax	%l5,	0x08,	%g6
	movgu	%icc,	%o2,	%o0
	andcc	%g2,	0x0301,	%o1
	edge16ln	%g4,	%o5,	%i5
	movrgez	%i1,	0x091,	%o7
	andcc	%o6,	%g1,	%i2
	sllx	%l3,	%o4,	%g7
	movl	%xcc,	%i0,	%l0
	udivcc	%l2,	0x026D,	%l4
	umul	%g5,	0x178F,	%l1
	fnot2	%f6,	%f22
	fnand	%f10,	%f4,	%f14
	fnot1	%f0,	%f24
	xnorcc	%l6,	0x17FF,	%i6
	xorcc	%i4,	%g3,	%i3
	fmovdcs	%icc,	%f29,	%f8
	fmul8ulx16	%f26,	%f24,	%f24
	orncc	%o3,	%i7,	%g6
	movrgez	%l5,	0x049,	%o0
	ldsw	[%l7 + 0x18],	%g2
	fxnor	%f30,	%f16,	%f12
	subcc	%o1,	0x1ABC,	%o2
	movre	%g4,	0x17D,	%i5
	udivx	%o5,	0x0C3D,	%i1
	st	%f10,	[%l7 + 0x20]
	array16	%o7,	%g1,	%i2
	edge16l	%l3,	%o4,	%o6
	mova	%xcc,	%g7,	%i0
	fmovsa	%xcc,	%f24,	%f28
	edge16l	%l2,	%l4,	%g5
	movl	%xcc,	%l1,	%l0
	edge32l	%i6,	%i4,	%g3
	alignaddr	%i3,	%o3,	%i7
	array8	%l6,	%g6,	%l5
	fors	%f0,	%f9,	%f21
	sra	%g2,	%o0,	%o1
	alignaddr	%o2,	%i5,	%o5
	edge8n	%i1,	%g4,	%o7
	fornot2s	%f14,	%f15,	%f4
	fabss	%f19,	%f4
	fmul8x16	%f31,	%f22,	%f20
	addccc	%i2,	0x0196,	%g1
	movcc	%xcc,	%o4,	%l3
	edge8l	%o6,	%i0,	%g7
	addc	%l4,	%g5,	%l2
	ld	[%l7 + 0x14],	%f20
	xnor	%l0,	0x0BB6,	%l1
	addc	%i6,	%i4,	%g3
	mulx	%o3,	%i3,	%l6
	fmovdgu	%xcc,	%f26,	%f5
	addc	%i7,	0x07AE,	%l5
	srl	%g2,	%g6,	%o0
	movl	%icc,	%o1,	%i5
	srl	%o5,	%o2,	%i1
	sdivx	%o7,	0x04BA,	%i2
	fmovdl	%icc,	%f20,	%f6
	fmovdgu	%icc,	%f30,	%f3
	udivx	%g4,	0x0DBC,	%g1
	srl	%l3,	%o6,	%o4
	array32	%g7,	%i0,	%l4
	sth	%l2,	[%l7 + 0x44]
	fors	%f2,	%f1,	%f10
	fcmple16	%f16,	%f2,	%l0
	movle	%xcc,	%l1,	%g5
	array8	%i4,	%g3,	%o3
	edge8n	%i3,	%l6,	%i6
	edge16	%l5,	%g2,	%g6
	edge8	%o0,	%o1,	%i5
	std	%f12,	[%l7 + 0x60]
	sir	0x1E4A
	edge8n	%i7,	%o2,	%i1
	udiv	%o7,	0x1F61,	%o5
	fmovrsgez	%i2,	%f15,	%f30
	pdist	%f24,	%f10,	%f0
	ld	[%l7 + 0x18],	%f15
	fcmpeq16	%f26,	%f18,	%g4
	edge32l	%l3,	%o6,	%g1
	ldd	[%l7 + 0x20],	%f6
	fabsd	%f12,	%f14
	subcc	%o4,	%g7,	%i0
	edge8n	%l2,	%l0,	%l1
	sdivx	%l4,	0x083A,	%i4
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	edge16n	%g5,	%i3,	%l6
	ldd	[%l7 + 0x20],	%f2
	ld	[%l7 + 0x14],	%f23
	orncc	%i6,	0x040A,	%l5
	mulx	%g2,	%g6,	%o0
	movg	%icc,	%i5,	%i7
	alignaddr	%o1,	%o2,	%i1
	subc	%o5,	%i2,	%o7
	array16	%l3,	%g4,	%o6
	ldd	[%l7 + 0x48],	%o4
	movcs	%xcc,	%g1,	%i0
	umul	%g7,	0x0E07,	%l0
	orn	%l2,	0x193F,	%l4
	fmovrdgz	%l1,	%f8,	%f24
	movcs	%xcc,	%i4,	%o3
	movpos	%icc,	%g3,	%g5
	movgu	%xcc,	%l6,	%i6
	fpadd16s	%f7,	%f30,	%f21
	nop
	set	0x64, %o5
	lduw	[%l7 + %o5],	%i3
	fornot2s	%f26,	%f24,	%f1
	edge32n	%l5,	%g6,	%g2
	ldsh	[%l7 + 0x6A],	%i5
	fornot2	%f26,	%f4,	%f2
	move	%xcc,	%o0,	%i7
	fpadd16	%f22,	%f16,	%f30
	edge16l	%o1,	%i1,	%o2
	array16	%o5,	%o7,	%i2
	or	%g4,	0x1EB4,	%o6
	udivx	%l3,	0x10A4,	%o4
	movne	%xcc,	%i0,	%g1
	restore %l0, %l2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%l1,	%f8,	%f6
	edge8l	%i4,	%o3,	%l4
	sll	%g3,	0x04,	%g5
	std	%f20,	[%l7 + 0x18]
	udivx	%i6,	0x016D,	%i3
	edge16ln	%l6,	%g6,	%l5
	addcc	%g2,	0x1290,	%o0
	movcc	%icc,	%i7,	%i5
	subc	%i1,	%o2,	%o5
	move	%icc,	%o7,	%o1
	fmovdleu	%icc,	%f9,	%f28
	movgu	%xcc,	%i2,	%g4
	fnot2s	%f26,	%f13
	smul	%o6,	%l3,	%o4
	nop
	set	0x56, %g6
	ldsh	[%l7 + %g6],	%i0
	sdiv	%g1,	0x006F,	%l0
	fpadd16s	%f18,	%f10,	%f20
	sth	%g7,	[%l7 + 0x40]
	alignaddrl	%l1,	%l2,	%i4
	movn	%xcc,	%o3,	%l4
	st	%f7,	[%l7 + 0x5C]
	fnot2s	%f28,	%f31
	fcmpgt16	%f16,	%f8,	%g3
	fmovsl	%icc,	%f11,	%f28
	sra	%i6,	0x19,	%g5
	fcmped	%fcc0,	%f6,	%f8
	move	%xcc,	%i3,	%g6
	edge16n	%l5,	%l6,	%o0
	udivx	%i7,	0x0EB7,	%i5
	array32	%i1,	%g2,	%o2
	movg	%xcc,	%o5,	%o1
	movrne	%o7,	0x3BA,	%g4
	fmovscs	%icc,	%f29,	%f28
	addccc	%i2,	0x011E,	%l3
	umulcc	%o4,	%o6,	%g1
	mulx	%l0,	%g7,	%i0
	mulx	%l2,	%l1,	%o3
	or	%i4,	%l4,	%g3
	std	%f22,	[%l7 + 0x50]
	fmovde	%icc,	%f24,	%f24
	addcc	%i6,	%i3,	%g6
	edge16n	%l5,	%g5,	%l6
	mulx	%o0,	0x1558,	%i7
	move	%icc,	%i5,	%i1
	fmovdneg	%xcc,	%f27,	%f12
	fmovrde	%g2,	%f8,	%f2
	fand	%f0,	%f30,	%f2
	movrgz	%o2,	%o1,	%o5
	edge8ln	%g4,	%i2,	%o7
	movrgz	%l3,	%o6,	%g1
	array16	%o4,	%l0,	%i0
	array16	%l2,	%l1,	%g7
	fpadd32	%f22,	%f28,	%f14
	movre	%i4,	0x298,	%o3
	udivcc	%g3,	0x188C,	%l4
	and	%i6,	%i3,	%l5
	fmovrde	%g6,	%f4,	%f26
	sdivcc	%l6,	0x1913,	%g5
	faligndata	%f6,	%f18,	%f8
	fxnor	%f16,	%f24,	%f30
	ldsh	[%l7 + 0x5C],	%o0
	stx	%i7,	[%l7 + 0x40]
	movneg	%xcc,	%i5,	%g2
	movrgez	%o2,	0x032,	%o1
	umul	%o5,	%g4,	%i2
	ldsb	[%l7 + 0x45],	%i1
	sdiv	%l3,	0x167E,	%o7
	sdivx	%g1,	0x089A,	%o4
	fmovse	%icc,	%f4,	%f1
	mova	%xcc,	%l0,	%o6
	sra	%i0,	%l2,	%l1
	ldd	[%l7 + 0x60],	%f10
	edge8n	%g7,	%o3,	%g3
	bshuffle	%f10,	%f28,	%f10
	addcc	%l4,	%i4,	%i3
	stw	%l5,	[%l7 + 0x7C]
	fmovsne	%xcc,	%f14,	%f22
	sll	%g6,	0x08,	%l6
	movl	%xcc,	%i6,	%o0
	xorcc	%i7,	%i5,	%g5
	sir	0x015A
	subc	%o2,	%g2,	%o1
	andcc	%g4,	%i2,	%i1
	add	%l3,	%o5,	%g1
	andncc	%o4,	%l0,	%o6
	fmovrde	%i0,	%f30,	%f30
	orcc	%o7,	0x1068,	%l1
	movge	%icc,	%l2,	%o3
	sllx	%g3,	%l4,	%g7
	movgu	%xcc,	%i3,	%l5
	fsrc2	%f30,	%f20
	edge8	%i4,	%g6,	%i6
	ldd	[%l7 + 0x68],	%f10
	orn	%l6,	%i7,	%o0
	ldd	[%l7 + 0x48],	%f2
	edge8n	%i5,	%o2,	%g2
	sdivx	%o1,	0x19ED,	%g4
	edge16ln	%i2,	%g5,	%l3
	addccc	%o5,	%g1,	%i1
	fnor	%f18,	%f0,	%f20
	movgu	%icc,	%l0,	%o4
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	ldsw	[%l7 + 0x24],	%l2
	movle	%icc,	%o3,	%o7
	fmuld8ulx16	%f15,	%f14,	%f22
	xnor	%l4,	0x19A2,	%g3
	fcmple32	%f28,	%f24,	%i3
	andcc	%l5,	0x1B5A,	%i4
	movcs	%xcc,	%g7,	%i6
	movcs	%icc,	%l6,	%i7
	ldsb	[%l7 + 0x16],	%g6
	ldx	[%l7 + 0x78],	%i5
	xnor	%o0,	%o2,	%o1
	fnot2s	%f7,	%f12
	move	%xcc,	%g2,	%g4
	movrgz	%i2,	%l3,	%o5
	fand	%f20,	%f30,	%f26
	movcs	%icc,	%g5,	%g1
	movrne	%l0,	0x106,	%i1
	movcc	%xcc,	%o4,	%i0
	andncc	%o6,	%l2,	%o3
	fmovscc	%xcc,	%f29,	%f19
	sdiv	%o7,	0x19A6,	%l4
	ldsb	[%l7 + 0x0F],	%l1
	lduw	[%l7 + 0x14],	%i3
	sub	%l5,	%i4,	%g3
	edge16l	%g7,	%l6,	%i7
	movrgez	%g6,	%i5,	%i6
	andn	%o0,	0x0C67,	%o2
	fmovrdgez	%o1,	%f0,	%f4
	movne	%xcc,	%g2,	%i2
	fmovrsgz	%g4,	%f20,	%f18
	fmovrsgez	%o5,	%f2,	%f12
	orn	%g5,	0x17EC,	%l3
	fone	%f22
	edge16ln	%g1,	%i1,	%l0
	ldx	[%l7 + 0x78],	%o4
	ld	[%l7 + 0x20],	%f26
	movge	%xcc,	%i0,	%l2
	smulcc	%o3,	%o6,	%o7
	xnorcc	%l1,	0x0D0F,	%l4
	edge32n	%l5,	%i3,	%i4
	or	%g7,	0x14CB,	%g3
	movvc	%icc,	%i7,	%g6
	umulcc	%l6,	%i6,	%i5
	subc	%o2,	%o0,	%o1
	sethi	0x0A10,	%i2
	sdivx	%g4,	0x01D4,	%o5
	srlx	%g2,	0x14,	%g5
	edge16n	%g1,	%i1,	%l3
	movge	%xcc,	%l0,	%i0
	sethi	0x0E8C,	%o4
	srax	%o3,	0x07,	%o6
	edge32ln	%l2,	%o7,	%l4
	addcc	%l1,	0x103B,	%l5
	xorcc	%i3,	%i4,	%g7
	ldsh	[%l7 + 0x50],	%i7
	fmovse	%icc,	%f28,	%f21
	andcc	%g3,	0x0774,	%g6
	sdiv	%i6,	0x071F,	%l6
	udiv	%o2,	0x1775,	%i5
	addc	%o0,	%o1,	%i2
	subccc	%g4,	0x1679,	%g2
	fmovsvc	%xcc,	%f3,	%f14
	fandnot2s	%f7,	%f9,	%f15
	movge	%icc,	%o5,	%g5
	addcc	%g1,	0x103F,	%i1
	xnor	%l3,	%l0,	%i0
	alignaddrl	%o3,	%o6,	%o4
	sethi	0x15F4,	%o7
	andn	%l2,	%l4,	%l1
	std	%f8,	[%l7 + 0x08]
	movgu	%icc,	%l5,	%i3
	movle	%xcc,	%g7,	%i7
	edge16	%g3,	%i4,	%i6
	orcc	%g6,	0x0B09,	%o2
	ldsh	[%l7 + 0x5A],	%i5
	subccc	%l6,	0x0BAE,	%o1
	addccc	%o0,	%i2,	%g4
	fones	%f25
	stw	%o5,	[%l7 + 0x54]
	ld	[%l7 + 0x7C],	%f0
	lduw	[%l7 + 0x5C],	%g2
	movrgez	%g1,	0x003,	%g5
	fmovdcs	%xcc,	%f2,	%f0
	movneg	%xcc,	%i1,	%l0
	movgu	%icc,	%l3,	%i0
	fmul8x16au	%f21,	%f16,	%f14
	srlx	%o6,	0x0E,	%o3
	ldsw	[%l7 + 0x1C],	%o7
	movrlez	%o4,	%l4,	%l1
	movge	%icc,	%l5,	%l2
	bshuffle	%f6,	%f22,	%f0
	ldx	[%l7 + 0x08],	%i3
	save %i7, %g3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g7,	0x1F,	%g6
	movneg	%icc,	%o2,	%i5
	fcmpne32	%f18,	%f0,	%l6
	addc	%i6,	%o1,	%o0
	srax	%i2,	0x14,	%g4
	subcc	%g2,	0x0057,	%o5
	fmovde	%icc,	%f14,	%f20
	udiv	%g1,	0x1493,	%i1
	fmovdcc	%icc,	%f28,	%f31
	edge16l	%l0,	%g5,	%i0
	edge8l	%o6,	%o3,	%l3
	sethi	0x0E24,	%o7
	subcc	%l4,	0x049B,	%l1
	array16	%o4,	%l5,	%i3
	movg	%icc,	%l2,	%g3
	fsrc2s	%f12,	%f16
	umulcc	%i7,	0x11D1,	%i4
	save %g6, %g7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o2,	0x184F,	%i6
	fcmpne32	%f16,	%f10,	%o1
	fcmple16	%f0,	%f30,	%l6
	alignaddrl	%i2,	%g4,	%o0
	edge8ln	%o5,	%g1,	%g2
	edge16l	%i1,	%l0,	%i0
	movcc	%icc,	%o6,	%g5
	fmovsl	%icc,	%f22,	%f24
	ldd	[%l7 + 0x28],	%o2
	sdivcc	%o7,	0x0E2E,	%l3
	array8	%l1,	%l4,	%o4
	edge8	%i3,	%l5,	%g3
	fmovdge	%xcc,	%f31,	%f0
	movleu	%icc,	%i7,	%i4
	fmuld8sux16	%f9,	%f4,	%f14
	udivcc	%l2,	0x0535,	%g6
	srax	%g7,	%i5,	%o2
	subccc	%i6,	%o1,	%l6
	sth	%g4,	[%l7 + 0x5E]
	fsrc1s	%f3,	%f0
	addccc	%i2,	0x078E,	%o0
	movrgez	%g1,	0x17C,	%o5
	ldsw	[%l7 + 0x40],	%g2
	umul	%l0,	0x1C5A,	%i0
	ld	[%l7 + 0x64],	%f7
	add	%o6,	0x0614,	%i1
	add	%o3,	0x1865,	%o7
	fpadd16	%f30,	%f26,	%f20
	movle	%xcc,	%g5,	%l1
	fxnor	%f20,	%f20,	%f30
	subc	%l3,	0x15CB,	%l4
	movgu	%xcc,	%i3,	%o4
	fandnot2	%f20,	%f20,	%f30
	edge8n	%l5,	%i7,	%g3
	movg	%xcc,	%l2,	%g6
	edge32l	%i4,	%i5,	%o2
	stx	%g7,	[%l7 + 0x78]
	ldd	[%l7 + 0x28],	%o0
	fabss	%f21,	%f17
	ldd	[%l7 + 0x10],	%i6
	movleu	%icc,	%g4,	%l6
	movrlz	%i2,	%o0,	%g1
	movcc	%icc,	%o5,	%l0
	movle	%xcc,	%i0,	%g2
	xor	%i1,	%o6,	%o3
	movgu	%icc,	%o7,	%g5
	sdivx	%l3,	0x17D7,	%l1
	orncc	%l4,	%o4,	%i3
	edge32n	%l5,	%g3,	%i7
	fpadd32s	%f5,	%f13,	%f22
	sethi	0x0112,	%g6
	orn	%i4,	%l2,	%o2
	fmovdgu	%icc,	%f10,	%f0
	fmul8x16al	%f23,	%f3,	%f12
	orncc	%i5,	0x19D3,	%g7
	fmovsa	%xcc,	%f22,	%f5
	fands	%f31,	%f18,	%f3
	movge	%xcc,	%o1,	%g4
	fnegs	%f10,	%f25
	fnor	%f0,	%f16,	%f0
	mulscc	%l6,	0x08E5,	%i6
	movneg	%xcc,	%i2,	%o0
	fmovspos	%xcc,	%f4,	%f28
	fpack32	%f0,	%f28,	%f12
	fornot1s	%f4,	%f27,	%f11
	ldsb	[%l7 + 0x31],	%o5
	ldsb	[%l7 + 0x0B],	%l0
	orn	%i0,	0x185D,	%g2
	ldx	[%l7 + 0x08],	%i1
	movrne	%o6,	%g1,	%o7
	addc	%g5,	0x09EF,	%l3
	movgu	%xcc,	%o3,	%l4
	orn	%o4,	0x16FD,	%l1
	movne	%icc,	%i3,	%l5
	edge16n	%i7,	%g6,	%i4
	smul	%l2,	0x17BC,	%g3
	ld	[%l7 + 0x08],	%f29
	and	%o2,	%i5,	%g7
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%o0
	ldd	[%l7 + 0x18],	%i6
	xnorcc	%i6,	0x03E5,	%g4
	fmul8x16au	%f6,	%f26,	%f22
	fmovdleu	%xcc,	%f18,	%f11
	and	%o0,	%o5,	%l0
	fmovsge	%icc,	%f15,	%f21
	fnot1s	%f15,	%f11
	fnot1s	%f1,	%f7
	smulcc	%i2,	%g2,	%i1
	movrlez	%o6,	%i0,	%g1
	fmovdpos	%xcc,	%f31,	%f25
	edge8	%g5,	%o7,	%l3
	addccc	%l4,	%o3,	%o4
	ldsh	[%l7 + 0x7C],	%l1
	lduh	[%l7 + 0x4E],	%i3
	addcc	%i7,	0x1356,	%g6
	subccc	%i4,	0x0563,	%l5
	stb	%g3,	[%l7 + 0x31]
	edge32	%o2,	%l2,	%g7
	edge8	%i5,	%l6,	%o1
	subccc	%g4,	%o0,	%o5
	std	%f26,	[%l7 + 0x60]
	nop
	set	0x18, %i2
	stx	%l0,	[%l7 + %i2]
	subccc	%i6,	0x1397,	%i2
	fmovsneg	%xcc,	%f0,	%f13
	edge32	%i1,	%g2,	%i0
	sethi	0x15C4,	%o6
	move	%icc,	%g5,	%o7
	movrgez	%g1,	%l3,	%o3
	fnands	%f18,	%f26,	%f26
	or	%o4,	0x10D1,	%l1
	fmul8x16	%f11,	%f30,	%f20
	subcc	%l4,	0x19BD,	%i7
	edge32ln	%g6,	%i3,	%i4
	fands	%f11,	%f21,	%f11
	lduh	[%l7 + 0x08],	%l5
	fxnor	%f24,	%f12,	%f2
	sllx	%g3,	0x01,	%l2
	stw	%o2,	[%l7 + 0x20]
	fmovsle	%xcc,	%f20,	%f10
	orcc	%g7,	0x0A58,	%l6
	ldsw	[%l7 + 0x6C],	%o1
	stb	%i5,	[%l7 + 0x41]
	addc	%o0,	0x1482,	%g4
	sth	%l0,	[%l7 + 0x1E]
	movre	%o5,	0x296,	%i2
	siam	0x1
	subc	%i1,	0x0CE2,	%g2
	save %i0, %i6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f22,	%f18,	%f22
	fandnot1s	%f14,	%f10,	%f4
	movcs	%xcc,	%o7,	%o6
	movrlz	%l3,	%g1,	%o3
	fmovrdlz	%o4,	%f28,	%f28
	sdivcc	%l1,	0x1D91,	%l4
	udivx	%i7,	0x17A3,	%i3
	udiv	%i4,	0x162E,	%l5
	xorcc	%g6,	0x1B95,	%g3
	add	%l2,	%g7,	%o2
	movn	%icc,	%l6,	%o1
	orcc	%i5,	%o0,	%g4
	edge16l	%l0,	%o5,	%i1
	fmul8sux16	%f16,	%f26,	%f16
	edge8l	%g2,	%i2,	%i6
	fpack16	%f30,	%f31
	edge16n	%i0,	%g5,	%o6
	movrlez	%o7,	0x09E,	%g1
	udivcc	%o3,	0x1AB3,	%o4
	fxnor	%f22,	%f30,	%f16
	movneg	%xcc,	%l3,	%l4
	subccc	%l1,	%i7,	%i4
	srl	%i3,	0x0E,	%g6
	orn	%g3,	%l5,	%g7
	edge32l	%l2,	%o2,	%l6
	udiv	%o1,	0x1E93,	%o0
	fandnot1	%f14,	%f30,	%f28
	nop
	set	0x53, %i5
	ldub	[%l7 + %i5],	%i5
	movleu	%xcc,	%g4,	%l0
	mulscc	%i1,	0x104F,	%o5
	edge32ln	%g2,	%i2,	%i6
	sir	0x0E9B
	movleu	%icc,	%g5,	%o6
	edge32n	%o7,	%i0,	%o3
	add	%g1,	0x1531,	%l3
	fsrc1s	%f25,	%f6
	sra	%l4,	0x13,	%o4
	fxnor	%f8,	%f20,	%f12
	sdiv	%i7,	0x05CF,	%l1
	addccc	%i4,	0x177C,	%g6
	movl	%icc,	%i3,	%l5
	xnorcc	%g7,	0x0235,	%g3
	array8	%l2,	%l6,	%o2
	mulx	%o1,	0x1FC4,	%i5
	lduw	[%l7 + 0x08],	%o0
	fmovrsgez	%l0,	%f8,	%f12
	save %i1, 0x1BFC, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f12,	%f13,	%f16
	movrlz	%g2,	%g4,	%i2
	udiv	%i6,	0x10C6,	%g5
	ldub	[%l7 + 0x4E],	%o6
	st	%f11,	[%l7 + 0x58]
	sub	%i0,	%o7,	%o3
	move	%icc,	%g1,	%l3
	fmovrdne	%l4,	%f28,	%f26
	fmovse	%xcc,	%f23,	%f4
	umul	%o4,	%l1,	%i4
	fmovdvc	%xcc,	%f24,	%f17
	andcc	%g6,	%i7,	%l5
	subccc	%g7,	%g3,	%l2
	fabss	%f17,	%f28
	udivcc	%i3,	0x1290,	%o2
	movge	%icc,	%l6,	%i5
	edge32ln	%o0,	%l0,	%i1
	std	%f2,	[%l7 + 0x48]
	andcc	%o5,	%o1,	%g2
	fmovsvs	%icc,	%f25,	%f23
	edge32ln	%i2,	%g4,	%g5
	fmul8x16au	%f21,	%f4,	%f24
	or	%i6,	%i0,	%o7
	edge8	%o3,	%g1,	%o6
	edge32ln	%l3,	%o4,	%l1
	ldx	[%l7 + 0x10],	%i4
	fsrc1	%f6,	%f12
	movcs	%xcc,	%g6,	%l4
	orcc	%i7,	0x01A1,	%g7
	sllx	%l5,	%g3,	%l2
	move	%xcc,	%i3,	%l6
	fandnot1	%f4,	%f26,	%f0
	edge16n	%o2,	%i5,	%o0
	bshuffle	%f10,	%f16,	%f8
	srax	%i1,	%o5,	%l0
	srlx	%o1,	%g2,	%g4
	movge	%xcc,	%g5,	%i2
	movneg	%xcc,	%i6,	%i0
	sdivcc	%o3,	0x0D1F,	%g1
	array16	%o7,	%o6,	%o4
	edge32	%l3,	%i4,	%l1
	fcmpeq32	%f20,	%f0,	%g6
	fmovdcs	%xcc,	%f6,	%f28
	fmovrdlz	%i7,	%f10,	%f12
	srax	%l4,	%g7,	%g3
	movneg	%xcc,	%l5,	%i3
	lduh	[%l7 + 0x14],	%l6
	fmul8ulx16	%f24,	%f30,	%f18
	movvs	%icc,	%l2,	%o2
	andncc	%i5,	%o0,	%o5
	fzeros	%f13
	fmovdvc	%xcc,	%f5,	%f15
	subccc	%l0,	%i1,	%g2
	ldsh	[%l7 + 0x38],	%g4
	alignaddrl	%g5,	%i2,	%o1
	fmovdg	%icc,	%f28,	%f20
	movrlez	%i0,	%i6,	%g1
	smulcc	%o7,	0x080A,	%o3
	movn	%icc,	%o4,	%l3
	array16	%i4,	%o6,	%g6
	smulcc	%i7,	%l4,	%l1
	ld	[%l7 + 0x54],	%f20
	array8	%g3,	%l5,	%g7
	fpsub16	%f4,	%f20,	%f28
	sub	%i3,	0x1EC8,	%l6
	ldsw	[%l7 + 0x6C],	%l2
	andn	%i5,	%o2,	%o0
	movneg	%xcc,	%l0,	%o5
	ldx	[%l7 + 0x40],	%g2
	nop
	set	0x46, %o2
	ldsb	[%l7 + %o2],	%g4
	movcs	%xcc,	%i1,	%g5
	fmovsne	%xcc,	%f23,	%f21
	fmovs	%f22,	%f4
	movcs	%xcc,	%i2,	%o1
	fpmerge	%f31,	%f6,	%f24
	lduh	[%l7 + 0x6A],	%i6
	xnorcc	%g1,	0x1F77,	%i0
	fmovdne	%xcc,	%f11,	%f0
	sra	%o3,	%o4,	%l3
	mova	%xcc,	%o7,	%o6
	smulcc	%i4,	%g6,	%i7
	edge16	%l4,	%l1,	%l5
	fmovdne	%xcc,	%f16,	%f7
	sdivx	%g3,	0x0769,	%i3
	edge32ln	%g7,	%l6,	%i5
	movvs	%xcc,	%o2,	%l2
	udivx	%o0,	0x1E5F,	%o5
	edge8l	%g2,	%l0,	%g4
	orcc	%g5,	%i2,	%i1
	ldsh	[%l7 + 0x5A],	%i6
	fandnot1s	%f5,	%f12,	%f14
	st	%f15,	[%l7 + 0x08]
	fnor	%f2,	%f26,	%f10
	fxnors	%f1,	%f7,	%f3
	edge16	%g1,	%o1,	%i0
	fmovdge	%icc,	%f11,	%f8
	edge8ln	%o4,	%o3,	%l3
	umulcc	%o7,	%o6,	%i4
	movcs	%xcc,	%g6,	%l4
	edge32ln	%l1,	%l5,	%g3
	fmul8sux16	%f12,	%f30,	%f28
	sll	%i7,	0x11,	%i3
	udivx	%l6,	0x1212,	%g7
	edge8	%i5,	%o2,	%o0
	addcc	%o5,	0x1D14,	%g2
	fmul8x16au	%f9,	%f8,	%f6
	fexpand	%f31,	%f12
	edge8ln	%l2,	%g4,	%g5
	orncc	%i2,	%l0,	%i6
	movleu	%xcc,	%g1,	%i1
	array8	%o1,	%i0,	%o3
	umul	%o4,	0x1F9D,	%o7
	sra	%l3,	%o6,	%i4
	stb	%g6,	[%l7 + 0x29]
	array8	%l1,	%l5,	%l4
	fabss	%f8,	%f6
	subccc	%g3,	%i3,	%l6
	ld	[%l7 + 0x78],	%f0
	subcc	%i7,	%i5,	%g7
	fandnot1	%f26,	%f16,	%f14
	fmovrde	%o2,	%f10,	%f22
	edge32	%o0,	%o5,	%l2
	movcs	%icc,	%g4,	%g2
	move	%xcc,	%i2,	%g5
	std	%f10,	[%l7 + 0x20]
	array32	%l0,	%i6,	%g1
	sdivcc	%i1,	0x1A60,	%o1
	addcc	%i0,	%o3,	%o7
	movrgez	%o4,	%l3,	%i4
	udiv	%o6,	0x159A,	%l1
	fmovdg	%icc,	%f22,	%f28
	std	%f28,	[%l7 + 0x08]
	andn	%g6,	%l5,	%g3
	sll	%i3,	0x10,	%l4
	fmovrsgz	%i7,	%f4,	%f15
	movcs	%icc,	%l6,	%i5
	andn	%g7,	%o0,	%o2
	fmovrdlz	%o5,	%f14,	%f12
	umul	%l2,	0x0ABA,	%g2
	andn	%i2,	%g5,	%l0
	fabss	%f1,	%f26
	srl	%g4,	0x15,	%g1
	stw	%i1,	[%l7 + 0x50]
	fcmple16	%f8,	%f4,	%i6
	restore %i0, %o1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o4,	%l3
	ld	[%l7 + 0x28],	%f1
	andcc	%i4,	%o7,	%l1
	fabsd	%f28,	%f14
	movcs	%icc,	%o6,	%g6
	movle	%xcc,	%l5,	%g3
	fpack32	%f20,	%f8,	%f18
	edge16ln	%i3,	%l4,	%i7
	movge	%icc,	%l6,	%i5
	addcc	%g7,	%o0,	%o5
	sllx	%l2,	%o2,	%g2
	sth	%g5,	[%l7 + 0x7C]
	orncc	%l0,	0x0E28,	%i2
	popc	%g4,	%g1
	fmovrdne	%i6,	%f26,	%f20
	ldsh	[%l7 + 0x40],	%i0
	fors	%f14,	%f16,	%f29
	array32	%i1,	%o1,	%o3
	fpadd16s	%f15,	%f7,	%f11
	mova	%icc,	%o4,	%i4
	ldub	[%l7 + 0x0D],	%l3
	move	%icc,	%l1,	%o6
	fmovsa	%icc,	%f27,	%f31
	sll	%o7,	%l5,	%g6
	bshuffle	%f10,	%f6,	%f8
	std	%f24,	[%l7 + 0x70]
	fmuld8ulx16	%f6,	%f1,	%f10
	xnor	%i3,	0x1DF4,	%l4
	andncc	%i7,	%g3,	%i5
	movvc	%xcc,	%l6,	%o0
	addc	%g7,	0x1F59,	%l2
	addc	%o5,	%g2,	%g5
	movne	%icc,	%o2,	%l0
	edge8n	%g4,	%g1,	%i2
	array32	%i6,	%i0,	%o1
	fmuld8sux16	%f23,	%f21,	%f28
	movge	%xcc,	%o3,	%i1
	ldsb	[%l7 + 0x0B],	%o4
	fones	%f25
	array16	%i4,	%l1,	%o6
	srlx	%l3,	%l5,	%g6
	stb	%i3,	[%l7 + 0x21]
	edge8n	%o7,	%l4,	%i7
	fornot2	%f20,	%f2,	%f0
	alignaddrl	%i5,	%l6,	%g3
	fmovsvc	%xcc,	%f4,	%f21
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%g6
	umul	%o0,	0x16D3,	%o5
	edge32ln	%g2,	%g5,	%l2
	addccc	%o2,	0x1F8C,	%l0
	edge16l	%g1,	%i2,	%i6
	movge	%xcc,	%i0,	%g4
	sub	%o1,	0x0E3C,	%o3
	ldub	[%l7 + 0x11],	%i1
	edge32ln	%i4,	%l1,	%o6
	st	%f25,	[%l7 + 0x68]
	edge32	%l3,	%o4,	%g6
	popc	0x0142,	%i3
	save %o7, 0x139A, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i7,	0x1378,	%l4
	edge32l	%l6,	%g3,	%g7
	array8	%i5,	%o0,	%g2
	fsrc1	%f24,	%f30
	array32	%g5,	%o5,	%l2
	pdist	%f20,	%f18,	%f26
	stw	%l0,	[%l7 + 0x60]
	edge16	%g1,	%o2,	%i6
	srl	%i2,	0x01,	%i0
	sllx	%o1,	0x1C,	%o3
	edge32l	%g4,	%i4,	%i1
	edge8	%l1,	%l3,	%o6
	movpos	%icc,	%g6,	%o4
	sub	%o7,	0x08CF,	%i3
	or	%l5,	0x1902,	%i7
	fand	%f6,	%f28,	%f14
	edge8l	%l6,	%g3,	%l4
	orncc	%i5,	0x11B5,	%g7
	and	%o0,	%g5,	%o5
	stw	%l2,	[%l7 + 0x1C]
	ldx	[%l7 + 0x48],	%g2
	addccc	%g1,	%o2,	%l0
	udivcc	%i2,	0x168C,	%i6
	ldd	[%l7 + 0x70],	%f8
	fnegs	%f30,	%f11
	fmovrslz	%o1,	%f15,	%f6
	edge32	%o3,	%g4,	%i0
	ldd	[%l7 + 0x20],	%i4
	fcmple32	%f16,	%f22,	%i1
	edge8n	%l3,	%o6,	%g6
	ldd	[%l7 + 0x68],	%l0
	movcs	%xcc,	%o7,	%o4
	array16	%i3,	%i7,	%l5
	ldub	[%l7 + 0x56],	%g3
	nop
	set	0x20, %g7
	ldsh	[%l7 + %g7],	%l6
	umulcc	%l4,	0x165F,	%g7
	edge32	%o0,	%i5,	%o5
	fmovsa	%xcc,	%f24,	%f3
	orcc	%l2,	0x03EC,	%g2
	movcs	%icc,	%g1,	%o2
	orncc	%l0,	0x1422,	%g5
	fcmped	%fcc3,	%f24,	%f18
	sir	0x1A18
	umulcc	%i6,	%i2,	%o3
	sra	%g4,	%o1,	%i4
	edge32n	%i0,	%l3,	%o6
	movrlez	%g6,	%i1,	%o7
	edge16l	%l1,	%o4,	%i3
	fmovde	%xcc,	%f10,	%f0
	fexpand	%f4,	%f22
	stw	%i7,	[%l7 + 0x68]
	sdivcc	%g3,	0x09C4,	%l6
	mulx	%l5,	0x052C,	%g7
	sdivcc	%l4,	0x0AA7,	%i5
	st	%f15,	[%l7 + 0x24]
	movre	%o0,	%o5,	%g2
	andcc	%l2,	%o2,	%l0
	edge8l	%g1,	%g5,	%i6
	ldx	[%l7 + 0x28],	%i2
	move	%xcc,	%o3,	%g4
	xorcc	%o1,	%i0,	%i4
	udivcc	%l3,	0x118E,	%g6
	fcmpeq32	%f24,	%f0,	%o6
	sll	%i1,	0x1E,	%o7
	smulcc	%o4,	0x0F9C,	%l1
	movvc	%icc,	%i7,	%i3
	array8	%g3,	%l6,	%l5
	fcmpne32	%f8,	%f12,	%g7
	ldub	[%l7 + 0x6F],	%i5
	fmovrslez	%o0,	%f0,	%f13
	smulcc	%l4,	%o5,	%g2
	stw	%o2,	[%l7 + 0x24]
	fnegs	%f31,	%f22
	andn	%l0,	%l2,	%g1
	fmovsvc	%icc,	%f8,	%f23
	udiv	%i6,	0x0EAE,	%g5
	movge	%xcc,	%o3,	%g4
	srlx	%o1,	0x0B,	%i2
	movleu	%icc,	%i0,	%l3
	andncc	%i4,	%o6,	%g6
	movrgez	%i1,	0x00A,	%o4
	fnand	%f18,	%f26,	%f4
	fsrc2s	%f31,	%f2
	movrne	%o7,	0x227,	%i7
	mulscc	%i3,	%l1,	%g3
	ldsw	[%l7 + 0x24],	%l6
	edge32ln	%l5,	%g7,	%o0
	orcc	%l4,	%o5,	%g2
	array32	%i5,	%o2,	%l0
	fmovdpos	%xcc,	%f31,	%f3
	ldub	[%l7 + 0x3D],	%l2
	xnor	%g1,	%i6,	%g5
	fandnot2	%f6,	%f12,	%f22
	subc	%o3,	%g4,	%i2
	edge32	%i0,	%o1,	%l3
	ldsw	[%l7 + 0x78],	%i4
	movrne	%o6,	%g6,	%o4
	array32	%i1,	%i7,	%o7
	xnorcc	%l1,	0x09F8,	%i3
	orn	%l6,	0x1F99,	%l5
	bshuffle	%f26,	%f30,	%f30
	subccc	%g7,	%o0,	%l4
	movl	%icc,	%g3,	%o5
	sth	%g2,	[%l7 + 0x08]
	edge16l	%i5,	%l0,	%o2
	save %l2, 0x0732, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i6,	%g5
	movrlez	%o3,	0x0D2,	%i2
	fmovs	%f3,	%f29
	movl	%icc,	%g4,	%i0
	ldub	[%l7 + 0x57],	%l3
	xnor	%i4,	%o1,	%o6
	edge8ln	%o4,	%g6,	%i7
	movgu	%icc,	%i1,	%l1
	andcc	%i3,	%l6,	%l5
	movge	%xcc,	%o7,	%g7
	addccc	%l4,	0x112B,	%g3
	fornot1s	%f20,	%f27,	%f30
	movleu	%xcc,	%o0,	%o5
	fornot2s	%f10,	%f25,	%f7
	udiv	%g2,	0x104E,	%l0
	ldsw	[%l7 + 0x14],	%i5
	movrgz	%o2,	%g1,	%l2
	ldsh	[%l7 + 0x3A],	%i6
	edge8ln	%o3,	%g5,	%i2
	fmovs	%f22,	%f0
	movvc	%icc,	%g4,	%i0
	fzeros	%f4
	alignaddr	%i4,	%o1,	%o6
	addc	%l3,	%g6,	%i7
	edge32ln	%o4,	%i1,	%l1
	popc	%l6,	%l5
	movl	%icc,	%o7,	%i3
	fnand	%f30,	%f30,	%f24
	or	%l4,	%g3,	%g7
	movne	%xcc,	%o5,	%o0
	umul	%g2,	%i5,	%o2
	lduh	[%l7 + 0x4C],	%l0
	stb	%g1,	[%l7 + 0x4E]
	ldub	[%l7 + 0x42],	%l2
	sra	%o3,	0x19,	%i6
	fnor	%f20,	%f14,	%f10
	andn	%g5,	%i2,	%i0
	subcc	%i4,	%g4,	%o1
	move	%xcc,	%o6,	%g6
	and	%l3,	%o4,	%i7
	stx	%l1,	[%l7 + 0x48]
	ldx	[%l7 + 0x08],	%i1
	ld	[%l7 + 0x7C],	%f18
	array32	%l6,	%o7,	%l5
	movrgez	%i3,	%g3,	%l4
	alignaddrl	%g7,	%o0,	%g2
	movn	%xcc,	%i5,	%o2
	addccc	%l0,	0x195B,	%o5
	fmul8x16	%f4,	%f18,	%f26
	xnorcc	%g1,	%l2,	%i6
	mulscc	%o3,	0x0C17,	%g5
	or	%i2,	%i4,	%i0
	fmovsg	%icc,	%f22,	%f18
	udivcc	%o1,	0x0168,	%g4
	edge16l	%o6,	%l3,	%g6
	array32	%o4,	%l1,	%i1
	movpos	%icc,	%i7,	%o7
	udivcc	%l6,	0x11F3,	%l5
	umulcc	%g3,	0x14F5,	%i3
	ldd	[%l7 + 0x18],	%f24
	add	%l4,	%g7,	%g2
	subcc	%o0,	%i5,	%l0
	edge32ln	%o2,	%o5,	%g1
	fxors	%f14,	%f31,	%f4
	addccc	%l2,	%o3,	%g5
	mulscc	%i6,	%i2,	%i0
	fmovde	%xcc,	%f4,	%f25
	movrlez	%o1,	0x002,	%i4
	sra	%g4,	0x03,	%l3
	fmovrsgez	%o6,	%f5,	%f6
	subc	%g6,	%l1,	%i1
	movleu	%xcc,	%i7,	%o4
	st	%f4,	[%l7 + 0x10]
	smulcc	%l6,	0x09BC,	%o7
	srlx	%l5,	%i3,	%l4
	fnegd	%f26,	%f30
	fmovde	%icc,	%f22,	%f31
	mulx	%g3,	%g7,	%g2
	fsrc1	%f2,	%f8
	movre	%o0,	0x26B,	%i5
	array8	%o2,	%o5,	%l0
	mulx	%l2,	0x0EA3,	%g1
	fpadd16s	%f17,	%f11,	%f2
	stw	%o3,	[%l7 + 0x6C]
	srax	%i6,	0x0A,	%i2
	fpmerge	%f20,	%f5,	%f0
	sra	%g5,	%o1,	%i0
	umulcc	%i4,	0x11AC,	%l3
	ldd	[%l7 + 0x58],	%f4
	ldd	[%l7 + 0x78],	%o6
	ldd	[%l7 + 0x58],	%g6
	edge16n	%l1,	%g4,	%i7
	fsrc2s	%f22,	%f15
	movleu	%icc,	%o4,	%l6
	movg	%icc,	%i1,	%l5
	xnor	%i3,	%l4,	%o7
	ldx	[%l7 + 0x60],	%g7
	mulscc	%g3,	0x185A,	%o0
	movg	%xcc,	%i5,	%o2
	sdivcc	%o5,	0x1D2C,	%l0
	movg	%icc,	%g2,	%l2
	array8	%g1,	%i6,	%i2
	orncc	%g5,	%o1,	%i0
	fzeros	%f22
	fmovscc	%icc,	%f28,	%f4
	fmovda	%xcc,	%f15,	%f20
	movle	%icc,	%i4,	%o3
	movle	%icc,	%l3,	%g6
	fmuld8ulx16	%f9,	%f9,	%f18
	fmovrde	%l1,	%f0,	%f10
	fcmpgt16	%f20,	%f2,	%o6
	movre	%i7,	%g4,	%o4
	sdiv	%i1,	0x00EB,	%l6
	srlx	%l5,	0x0F,	%i3
	fand	%f26,	%f10,	%f14
	popc	0x0AF1,	%l4
	srl	%o7,	0x04,	%g7
	movg	%icc,	%o0,	%g3
	fandnot1s	%f8,	%f6,	%f25
	edge32	%i5,	%o2,	%l0
	movvc	%xcc,	%g2,	%l2
	movn	%icc,	%g1,	%o5
	fmovsl	%icc,	%f5,	%f8
	ldd	[%l7 + 0x58],	%i2
	smulcc	%i6,	0x1F89,	%g5
	mulx	%i0,	0x1184,	%i4
	fcmple32	%f22,	%f30,	%o3
	lduw	[%l7 + 0x1C],	%l3
	fsrc1s	%f27,	%f26
	fmovrdne	%o1,	%f28,	%f10
	edge8n	%l1,	%o6,	%g6
	movrgz	%g4,	%i7,	%i1
	add	%o4,	0x19A5,	%l5
	edge32l	%i3,	%l4,	%o7
	fsrc2s	%f15,	%f26
	ldd	[%l7 + 0x58],	%i6
	sdivx	%g7,	0x0183,	%g3
	alignaddr	%i5,	%o2,	%o0
	movre	%g2,	0x283,	%l0
	xnor	%g1,	0x130C,	%l2
	popc	%i2,	%i6
	fmovda	%icc,	%f28,	%f17
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	udiv	%i4,	0x077A,	%g5
	edge16n	%l3,	%o3,	%o1
	xor	%o6,	0x0F09,	%g6
	fpmerge	%f24,	%f23,	%f0
	fmuld8sux16	%f20,	%f22,	%f18
	sir	0x09F3
	edge32ln	%l1,	%i7,	%i1
	addcc	%g4,	0x0B3A,	%l5
	movpos	%icc,	%o4,	%l4
	fcmple32	%f10,	%f28,	%i3
	fmul8ulx16	%f4,	%f18,	%f26
	edge8l	%o7,	%l6,	%g7
	movrne	%i5,	%g3,	%o2
	edge16n	%g2,	%o0,	%l0
	addccc	%l2,	%i2,	%i6
	edge8ln	%g1,	%o5,	%i4
	movn	%icc,	%g5,	%l3
	restore %i0, %o3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o6,	%g6,	%i7
	and	%i1,	0x0448,	%l1
	movne	%xcc,	%l5,	%g4
	nop
	set	0x1C, %i4
	lduw	[%l7 + %i4],	%o4
	fmovdle	%xcc,	%f19,	%f20
	orn	%i3,	%o7,	%l6
	movrne	%g7,	0x1C7,	%i5
	ldsh	[%l7 + 0x5C],	%g3
	movg	%icc,	%o2,	%g2
	xorcc	%o0,	%l4,	%l2
	fxnors	%f11,	%f16,	%f31
	fnegs	%f30,	%f7
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	fsrc1	%f30,	%f26
	sll	%g1,	0x18,	%l0
	mova	%xcc,	%o5,	%i4
	addc	%l3,	%g5,	%o3
	std	%f2,	[%l7 + 0x30]
	sdivx	%o1,	0x1893,	%i0
	addc	%g6,	0x1299,	%o6
	and	%i1,	%l1,	%i7
	movneg	%icc,	%g4,	%l5
	movge	%xcc,	%i3,	%o4
	and	%l6,	%g7,	%o7
	ldd	[%l7 + 0x10],	%f2
	edge32l	%g3,	%o2,	%g2
	ldsh	[%l7 + 0x58],	%i5
	addc	%l4,	%l2,	%o0
	array16	%i6,	%i2,	%g1
	sra	%o5,	%i4,	%l0
	fsrc2s	%f7,	%f18
	fabss	%f17,	%f29
	fzero	%f4
	movn	%icc,	%l3,	%g5
	ldub	[%l7 + 0x14],	%o3
	fmovdn	%xcc,	%f21,	%f7
	fmovdvs	%icc,	%f24,	%f21
	stx	%o1,	[%l7 + 0x38]
	edge8n	%i0,	%g6,	%i1
	addcc	%l1,	%i7,	%g4
	alignaddrl	%o6,	%i3,	%o4
	ldd	[%l7 + 0x30],	%f20
	udivx	%l5,	0x1CBF,	%g7
	umul	%o7,	%g3,	%o2
	edge8	%l6,	%i5,	%g2
	stx	%l2,	[%l7 + 0x40]
	edge16l	%o0,	%l4,	%i6
	movge	%icc,	%g1,	%i2
	edge16ln	%o5,	%i4,	%l0
	movge	%xcc,	%l3,	%g5
	mulscc	%o1,	%i0,	%g6
	or	%o3,	0x0F96,	%l1
	mova	%icc,	%i1,	%g4
	ldx	[%l7 + 0x68],	%o6
	for	%f10,	%f28,	%f12
	array32	%i3,	%i7,	%l5
	edge8	%o4,	%g7,	%o7
	movrgz	%o2,	0x0F3,	%g3
	addcc	%i5,	0x02E9,	%g2
	siam	0x0
	addcc	%l6,	0x143C,	%o0
	stb	%l4,	[%l7 + 0x62]
	subc	%i6,	%l2,	%g1
	udiv	%i2,	0x182C,	%i4
	mulscc	%o5,	0x1413,	%l3
	restore %g5, %l0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i0,	[%l7 + 0x38]
	ldub	[%l7 + 0x1B],	%g6
	fmovrse	%o3,	%f8,	%f14
	fpadd16	%f12,	%f4,	%f14
	or	%l1,	%i1,	%g4
	or	%i3,	%i7,	%o6
	sllx	%l5,	0x03,	%g7
	andcc	%o4,	0x1E1D,	%o2
	fornot1s	%f15,	%f16,	%f6
	umulcc	%g3,	0x00E1,	%i5
	addc	%g2,	0x1856,	%l6
	sth	%o7,	[%l7 + 0x6E]
	move	%icc,	%o0,	%l4
	srax	%i6,	0x18,	%l2
	sethi	0x17E4,	%g1
	andn	%i2,	0x1B71,	%o5
	udiv	%i4,	0x1B11,	%g5
	popc	%l0,	%l3
	lduh	[%l7 + 0x38],	%o1
	ld	[%l7 + 0x64],	%f1
	fmovdcs	%xcc,	%f29,	%f19
	xnor	%i0,	0x1DC7,	%o3
	fmovrde	%g6,	%f18,	%f20
	movneg	%xcc,	%l1,	%i1
	ldsb	[%l7 + 0x1F],	%g4
	fnot1	%f16,	%f10
	xor	%i7,	%o6,	%l5
	edge8	%g7,	%o4,	%o2
	edge8n	%g3,	%i5,	%i3
	fpsub32	%f6,	%f0,	%f24
	fmovdpos	%icc,	%f29,	%f6
	movrgz	%l6,	%o7,	%g2
	ldd	[%l7 + 0x50],	%f4
	udivcc	%o0,	0x06D5,	%l4
	st	%f13,	[%l7 + 0x0C]
	sethi	0x13EE,	%l2
	udivx	%g1,	0x19F2,	%i2
	popc	%o5,	%i4
	movre	%i6,	0x1FA,	%l0
	stx	%l3,	[%l7 + 0x28]
	faligndata	%f22,	%f26,	%f12
	pdist	%f22,	%f0,	%f10
	nop
	set	0x2D, %g5
	stb	%o1,	[%l7 + %g5]
	fpadd16	%f20,	%f4,	%f4
	ldd	[%l7 + 0x58],	%g4
	udivcc	%o3,	0x14EA,	%g6
	fmovdne	%xcc,	%f4,	%f10
	movcs	%xcc,	%i0,	%l1
	edge8n	%g4,	%i1,	%o6
	andcc	%l5,	%g7,	%i7
	fmovsvs	%icc,	%f30,	%f22
	save %o4, %o2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i3,	0x0EC1,	%l6
	fpack16	%f8,	%f14
	ld	[%l7 + 0x14],	%f1
	fmovscc	%icc,	%f28,	%f30
	movvs	%icc,	%i5,	%o7
	fandnot1	%f26,	%f12,	%f30
	ld	[%l7 + 0x4C],	%f28
	udivcc	%o0,	0x163C,	%g2
	movcs	%xcc,	%l2,	%l4
	movle	%icc,	%i2,	%o5
	lduh	[%l7 + 0x74],	%i4
	sethi	0x1E41,	%i6
	lduh	[%l7 + 0x20],	%g1
	ldsh	[%l7 + 0x0A],	%l0
	edge8ln	%o1,	%l3,	%g5
	fmovs	%f17,	%f13
	sllx	%o3,	%g6,	%i0
	addccc	%g4,	%i1,	%l1
	edge32ln	%l5,	%g7,	%o6
	nop
	set	0x68, %o6
	stw	%o4,	[%l7 + %o6]
	fnot2	%f18,	%f8
	mulscc	%i7,	0x012E,	%o2
	movrgez	%g3,	0x1F3,	%i3
	edge32ln	%i5,	%o7,	%l6
	movle	%xcc,	%o0,	%l2
	edge32l	%l4,	%i2,	%o5
	orcc	%i4,	%g2,	%g1
	alignaddrl	%i6,	%l0,	%o1
	move	%icc,	%l3,	%g5
	orn	%g6,	%i0,	%g4
	movrlz	%o3,	0x3AC,	%l1
	movl	%icc,	%i1,	%l5
	xorcc	%o6,	%o4,	%g7
	movg	%xcc,	%o2,	%i7
	movrgz	%i3,	%g3,	%i5
	ldx	[%l7 + 0x60],	%l6
	fmovrdne	%o7,	%f20,	%f22
	fmovdcc	%xcc,	%f31,	%f2
	smul	%l2,	%o0,	%l4
	sra	%i2,	%i4,	%o5
	ld	[%l7 + 0x20],	%f8
	fpsub16s	%f20,	%f16,	%f22
	fmovscs	%icc,	%f1,	%f29
	fmovdvs	%icc,	%f30,	%f24
	movn	%icc,	%g2,	%g1
	ld	[%l7 + 0x54],	%f24
	edge32l	%l0,	%i6,	%o1
	fmovsn	%xcc,	%f23,	%f8
	edge32	%l3,	%g5,	%g6
	movle	%xcc,	%i0,	%g4
	movvs	%icc,	%o3,	%l1
	movvc	%icc,	%i1,	%o6
	umulcc	%l5,	%o4,	%o2
	movleu	%icc,	%g7,	%i3
	st	%f4,	[%l7 + 0x64]
	alignaddrl	%g3,	%i7,	%l6
	edge32ln	%i5,	%o7,	%o0
	ldd	[%l7 + 0x30],	%l2
	srlx	%l4,	%i4,	%o5
	fmovse	%icc,	%f26,	%f25
	fcmpgt32	%f12,	%f30,	%i2
	fmovsl	%icc,	%f0,	%f1
	for	%f18,	%f22,	%f6
	lduw	[%l7 + 0x1C],	%g2
	fmuld8sux16	%f15,	%f4,	%f20
	movge	%xcc,	%g1,	%l0
	xorcc	%i6,	0x10FD,	%l3
	movge	%icc,	%g5,	%g6
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	stw	%g4,	[%l7 + 0x78]
	movvc	%xcc,	%o3,	%l1
	fmovrdne	%o6,	%f0,	%f12
	orcc	%i1,	0x017F,	%l5
	fmul8sux16	%f10,	%f18,	%f6
	smul	%o2,	0x13FD,	%g7
	popc	0x09F9,	%i3
	lduw	[%l7 + 0x2C],	%o4
	smulcc	%i7,	%l6,	%g3
	movne	%xcc,	%i5,	%o7
	fnot2s	%f20,	%f15
	sub	%o0,	0x0E60,	%l4
	smul	%l2,	%i4,	%i2
	fmovrde	%o5,	%f10,	%f8
	fnand	%f10,	%f2,	%f0
	umulcc	%g1,	%g2,	%i6
	edge16l	%l0,	%g5,	%g6
	sdiv	%i0,	0x0610,	%o1
	movgu	%icc,	%l3,	%g4
	subccc	%o3,	0x0877,	%l1
	fone	%f6
	sdivx	%o6,	0x1902,	%l5
	st	%f17,	[%l7 + 0x68]
	srlx	%i1,	%g7,	%i3
	edge16n	%o2,	%i7,	%l6
	movpos	%icc,	%o4,	%g3
	edge16l	%i5,	%o7,	%l4
	sll	%o0,	0x03,	%l2
	srlx	%i2,	0x0F,	%o5
	fzeros	%f4
	ldub	[%l7 + 0x1A],	%g1
	sub	%g2,	0x0C8C,	%i4
	umul	%i6,	%l0,	%g6
	movvc	%xcc,	%g5,	%o1
	fmovsne	%xcc,	%f17,	%f6
	edge32n	%i0,	%g4,	%o3
	sra	%l1,	%o6,	%l3
	addcc	%i1,	0x0078,	%g7
	fcmpeq32	%f18,	%f16,	%l5
	movgu	%xcc,	%o2,	%i7
	sra	%l6,	0x00,	%o4
	lduh	[%l7 + 0x18],	%i3
	edge32n	%g3,	%o7,	%l4
	sub	%i5,	0x073C,	%l2
	sethi	0x01C1,	%i2
	edge8	%o0,	%g1,	%g2
	edge8l	%i4,	%o5,	%i6
	fmovspos	%xcc,	%f20,	%f0
	movn	%icc,	%l0,	%g6
	fpadd16s	%f13,	%f18,	%f9
	st	%f2,	[%l7 + 0x5C]
	sll	%g5,	0x16,	%i0
	fmovdvc	%xcc,	%f23,	%f4
	edge32	%g4,	%o1,	%l1
	nop
	set	0x5C, %g4
	ldsw	[%l7 + %g4],	%o6
	fmovsgu	%icc,	%f23,	%f4
	movge	%xcc,	%l3,	%i1
	fcmpeq16	%f20,	%f8,	%o3
	movre	%g7,	%l5,	%o2
	edge8n	%i7,	%l6,	%i3
	udiv	%o4,	0x1075,	%g3
	movl	%xcc,	%o7,	%l4
	edge16l	%i5,	%l2,	%i2
	ldsh	[%l7 + 0x42],	%o0
	st	%f9,	[%l7 + 0x20]
	restore %g2, 0x0AF2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g1,	0x025D,	%i6
	array16	%o5,	%g6,	%l0
	addccc	%g5,	%g4,	%i0
	fmovdle	%xcc,	%f10,	%f14
	andcc	%l1,	%o1,	%l3
	alignaddrl	%i1,	%o3,	%g7
	fmovdg	%icc,	%f7,	%f6
	fmovdge	%icc,	%f27,	%f18
	fnot2	%f10,	%f6
	sth	%o6,	[%l7 + 0x38]
	ldx	[%l7 + 0x30],	%l5
	orcc	%o2,	0x1D6D,	%i7
	orn	%i3,	0x1BCE,	%l6
	xor	%g3,	0x1096,	%o4
	stw	%l4,	[%l7 + 0x50]
	mova	%icc,	%o7,	%i5
	movcs	%xcc,	%i2,	%l2
	edge32l	%o0,	%g2,	%g1
	mulscc	%i6,	%i4,	%g6
	edge32	%o5,	%l0,	%g5
	smul	%g4,	%i0,	%o1
	edge8n	%l3,	%l1,	%o3
	addcc	%i1,	0x1715,	%o6
	movrlez	%g7,	%l5,	%i7
	addcc	%o2,	%i3,	%g3
	fmovdn	%xcc,	%f8,	%f15
	fmuld8ulx16	%f5,	%f7,	%f12
	fmovdge	%xcc,	%f19,	%f31
	alignaddrl	%o4,	%l4,	%o7
	stx	%i5,	[%l7 + 0x18]
	alignaddr	%i2,	%l6,	%l2
	and	%g2,	0x1826,	%g1
	movrgez	%i6,	%o0,	%i4
	edge8ln	%o5,	%g6,	%g5
	movrgez	%l0,	0x247,	%i0
	movcc	%icc,	%g4,	%o1
	subcc	%l3,	%l1,	%i1
	movgu	%icc,	%o6,	%o3
	edge16ln	%g7,	%l5,	%i7
	fmovrdlez	%i3,	%f22,	%f2
	fmovrdlz	%g3,	%f16,	%f22
	movl	%xcc,	%o4,	%l4
	array32	%o7,	%i5,	%o2
	movrlez	%l6,	%i2,	%g2
	srl	%g1,	0x0C,	%l2
	array32	%o0,	%i6,	%o5
	ldx	[%l7 + 0x38],	%i4
	edge8	%g6,	%g5,	%l0
	xnor	%g4,	%i0,	%l3
	udiv	%o1,	0x018E,	%l1
	movvs	%icc,	%i1,	%o6
	subccc	%o3,	0x1ED0,	%g7
	ldsw	[%l7 + 0x40],	%i7
	udivx	%i3,	0x06EB,	%l5
	movrlz	%o4,	%g3,	%l4
	ldub	[%l7 + 0x6A],	%o7
	ldd	[%l7 + 0x50],	%f22
	ld	[%l7 + 0x20],	%f24
	fnor	%f14,	%f30,	%f2
	andcc	%o2,	%i5,	%l6
	subcc	%g2,	%i2,	%g1
	sir	0x12F9
	sir	0x0EBE
	edge32ln	%l2,	%i6,	%o0
	mulx	%o5,	0x1D33,	%g6
	ldsw	[%l7 + 0x34],	%g5
	udiv	%l0,	0x1EC1,	%g4
	srlx	%i0,	0x11,	%i4
	movrgz	%l3,	0x150,	%l1
	movneg	%icc,	%i1,	%o1
	ldsb	[%l7 + 0x5F],	%o6
	fand	%f8,	%f4,	%f26
	srax	%g7,	0x0F,	%o3
	fmovdgu	%icc,	%f23,	%f2
	stw	%i3,	[%l7 + 0x2C]
	movcs	%xcc,	%i7,	%o4
	fcmps	%fcc3,	%f15,	%f27
	alignaddrl	%g3,	%l5,	%o7
	stw	%o2,	[%l7 + 0x60]
	fmovrdne	%i5,	%f22,	%f8
	edge8ln	%l6,	%g2,	%l4
	lduw	[%l7 + 0x2C],	%g1
	save %i2, 0x0DE2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x50],	%l2
	ldx	[%l7 + 0x58],	%o5
	fmovdvs	%xcc,	%f9,	%f18
	orn	%g6,	0x0B90,	%g5
	fmovda	%icc,	%f16,	%f11
	smulcc	%o0,	0x091C,	%g4
	sdivcc	%l0,	0x18A8,	%i4
	ldsh	[%l7 + 0x24],	%i0
	movl	%icc,	%l3,	%l1
	fmovspos	%xcc,	%f23,	%f24
	fsrc2	%f0,	%f16
	andncc	%o1,	%i1,	%g7
	edge8n	%o6,	%i3,	%i7
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	fabsd	%f16,	%f18
	xnor	%g3,	%o7,	%o2
	fmovdle	%icc,	%f4,	%f27
	orcc	%i5,	0x1D2A,	%g2
	umul	%l6,	0x1290,	%g1
	andncc	%l4,	%i2,	%i6
	edge32ln	%o5,	%g6,	%g5
	movvs	%icc,	%l2,	%o0
	movrgz	%g4,	%i4,	%i0
	movvs	%xcc,	%l3,	%l0
	sdiv	%l1,	0x1C8E,	%i1
	smulcc	%o1,	%g7,	%o6
	movpos	%xcc,	%i3,	%o4
	fcmple16	%f26,	%f26,	%i7
	edge8	%o3,	%g3,	%o7
	lduh	[%l7 + 0x4E],	%l5
	ldub	[%l7 + 0x69],	%o2
	sdivcc	%i5,	0x13AE,	%g2
	fnegd	%f18,	%f26
	nop
	set	0x74, %i7
	lduw	[%l7 + %i7],	%g1
	movvc	%xcc,	%l4,	%i2
	sra	%l6,	0x16,	%i6
	save %o5, 0x1ADE, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l2,	%o0,	%g4
	xorcc	%g6,	%i0,	%l3
	stw	%i4,	[%l7 + 0x60]
	xnor	%l0,	0x15AC,	%l1
	movleu	%icc,	%o1,	%g7
	movre	%o6,	0x27C,	%i3
	edge16	%o4,	%i7,	%o3
	srax	%g3,	0x15,	%i1
	ldsb	[%l7 + 0x12],	%o7
	andcc	%l5,	%o2,	%i5
	fmovrsgz	%g1,	%f21,	%f17
	movle	%icc,	%l4,	%g2
	smul	%i2,	%i6,	%l6
	popc	0x1938,	%g5
	fmovdcc	%icc,	%f11,	%f28
	movne	%xcc,	%o5,	%l2
	sdivcc	%g4,	0x0B29,	%o0
	udivcc	%g6,	0x123F,	%i0
	ldx	[%l7 + 0x08],	%l3
	addcc	%i4,	%l1,	%l0
	addc	%g7,	%o1,	%i3
	srlx	%o6,	0x04,	%i7
	fornot1s	%f1,	%f3,	%f13
	subccc	%o3,	%o4,	%i1
	addcc	%o7,	%l5,	%o2
	fmuld8sux16	%f26,	%f16,	%f6
	fnors	%f0,	%f24,	%f15
	fandnot1	%f12,	%f24,	%f14
	movleu	%icc,	%g3,	%i5
	stb	%l4,	[%l7 + 0x3F]
	sir	0x15E8
	fxnors	%f20,	%f15,	%f14
	for	%f10,	%f22,	%f6
	st	%f2,	[%l7 + 0x24]
	movle	%xcc,	%g1,	%g2
	udivx	%i6,	0x15BD,	%l6
	and	%g5,	0x1D8D,	%o5
	and	%i2,	0x1C92,	%g4
	sdivcc	%o0,	0x0AFC,	%l2
	orcc	%g6,	0x0518,	%l3
	fmovdcs	%xcc,	%f24,	%f4
	array8	%i4,	%l1,	%l0
	move	%xcc,	%i0,	%o1
	ldd	[%l7 + 0x60],	%g6
	umul	%i3,	0x0ADB,	%o6
	movrgez	%o3,	%o4,	%i1
	ldsw	[%l7 + 0x68],	%o7
	movre	%i7,	0x2BC,	%o2
	sdivx	%l5,	0x187E,	%i5
	movge	%icc,	%g3,	%g1
	fmovdcc	%xcc,	%f15,	%f16
	orn	%g2,	0x07BA,	%l4
	movrgez	%i6,	%g5,	%l6
	ldsh	[%l7 + 0x3C],	%o5
	movl	%xcc,	%i2,	%g4
	udivcc	%o0,	0x0597,	%g6
	edge16	%l2,	%l3,	%i4
	sllx	%l0,	%i0,	%o1
	restore %g7, 0x073A, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i3,	%o6
	movneg	%xcc,	%o3,	%i1
	lduh	[%l7 + 0x7E],	%o7
	movcs	%xcc,	%o4,	%i7
	addc	%o2,	%l5,	%i5
	movrgz	%g3,	%g2,	%g1
	orcc	%l4,	0x0974,	%g5
	lduw	[%l7 + 0x14],	%i6
	array8	%o5,	%i2,	%g4
	std	%f0,	[%l7 + 0x30]
	movg	%icc,	%l6,	%o0
	movleu	%xcc,	%l2,	%l3
	stw	%g6,	[%l7 + 0x68]
	movpos	%icc,	%l0,	%i0
	umul	%i4,	%g7,	%o1
	add	%l1,	%o6,	%i3
	movrlz	%i1,	0x3E9,	%o7
	andn	%o4,	0x1872,	%o3
	ldd	[%l7 + 0x08],	%o2
	edge8n	%i7,	%l5,	%i5
	edge16l	%g2,	%g3,	%l4
	ldd	[%l7 + 0x70],	%f18
	fpadd32s	%f20,	%f0,	%f8
	movrgz	%g1,	%g5,	%i6
	fcmpeq16	%f22,	%f20,	%o5
	edge16ln	%g4,	%i2,	%l6
	sdiv	%o0,	0x045F,	%l3
	xnor	%l2,	%l0,	%g6
	add	%i0,	0x0099,	%i4
	edge8ln	%g7,	%l1,	%o1
	andcc	%i3,	0x0F93,	%i1
	sdivcc	%o7,	0x112D,	%o4
	orn	%o6,	%o3,	%o2
	movvc	%xcc,	%l5,	%i7
	fxors	%f0,	%f16,	%f27
	andcc	%g2,	%i5,	%l4
	mova	%icc,	%g1,	%g5
	ldx	[%l7 + 0x28],	%i6
	edge32	%o5,	%g4,	%i2
	fmovsleu	%xcc,	%f0,	%f27
	movrgz	%l6,	%o0,	%g3
	edge32ln	%l3,	%l0,	%g6
	edge8l	%l2,	%i0,	%i4
	fpsub32	%f26,	%f8,	%f28
	subc	%g7,	%o1,	%l1
	sll	%i1,	0x09,	%i3
	xnorcc	%o7,	0x048A,	%o6
	edge16	%o3,	%o4,	%o2
	save %l5, %g2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l4,	0x1BBC,	%i7
	ldsw	[%l7 + 0x1C],	%g1
	fands	%f5,	%f9,	%f14
	subccc	%g5,	0x1E57,	%i6
	srl	%o5,	%i2,	%g4
	subccc	%l6,	%g3,	%l3
	mova	%icc,	%l0,	%g6
	fxnors	%f4,	%f20,	%f28
	addccc	%l2,	0x1C0E,	%i0
	edge32n	%o0,	%g7,	%i4
	mova	%xcc,	%o1,	%i1
	sllx	%i3,	%o7,	%l1
	fmovde	%icc,	%f12,	%f12
	edge8l	%o3,	%o6,	%o4
	array32	%l5,	%g2,	%o2
	alignaddrl	%i5,	%i7,	%g1
	edge32l	%g5,	%i6,	%l4
	fabss	%f30,	%f29
	movl	%xcc,	%i2,	%o5
	fpadd32s	%f14,	%f27,	%f20
	save %g4, 0x040E, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l3,	0x1F6,	%l0
	edge32ln	%l6,	%l2,	%g6
	fmovsl	%icc,	%f22,	%f6
	array32	%i0,	%o0,	%g7
	movg	%xcc,	%i4,	%i1
	smul	%o1,	%i3,	%o7
	ld	[%l7 + 0x1C],	%f7
	smulcc	%o3,	%l1,	%o4
	mulx	%o6,	0x1E83,	%l5
	array16	%o2,	%i5,	%i7
	sllx	%g1,	%g5,	%i6
	movle	%xcc,	%g2,	%i2
	edge32	%o5,	%g4,	%g3
	lduh	[%l7 + 0x38],	%l3
	subc	%l4,	%l0,	%l2
	sll	%l6,	0x1B,	%g6
	movcs	%icc,	%i0,	%o0
	movrne	%g7,	0x240,	%i4
	edge8	%i1,	%o1,	%i3
	std	%f2,	[%l7 + 0x20]
	fmovse	%xcc,	%f23,	%f0
	addc	%o7,	%l1,	%o3
	sir	0x1858
	andcc	%o4,	0x1559,	%o6
	sll	%o2,	0x1B,	%i5
	movleu	%icc,	%i7,	%l5
	fcmpeq32	%f20,	%f12,	%g5
	movvs	%xcc,	%g1,	%g2
	subccc	%i6,	0x1748,	%o5
	andcc	%g4,	%i2,	%l3
	ldx	[%l7 + 0x68],	%l4
	fmovdvs	%icc,	%f21,	%f18
	stx	%g3,	[%l7 + 0x70]
	addcc	%l0,	%l2,	%g6
	fpsub32s	%f12,	%f28,	%f7
	umulcc	%i0,	0x13AE,	%l6
	ld	[%l7 + 0x78],	%f12
	movrne	%o0,	%i4,	%i1
	movn	%icc,	%g7,	%o1
	addcc	%o7,	%l1,	%o3
	lduh	[%l7 + 0x4A],	%o4
	move	%xcc,	%i3,	%o2
	fmovrsgz	%o6,	%f10,	%f14
	movcc	%xcc,	%i5,	%l5
	edge32l	%i7,	%g1,	%g2
	movle	%icc,	%g5,	%i6
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%l2
	smul	%l4,	0x1BAA,	%i2
	udivcc	%g3,	0x1654,	%l2
	movleu	%icc,	%l0,	%g6
	stx	%i0,	[%l7 + 0x10]
	movleu	%xcc,	%l6,	%i4
	add	%o0,	0x1E56,	%g7
	andncc	%i1,	%o7,	%o1
	movle	%icc,	%o3,	%l1
	edge16	%i3,	%o2,	%o4
	sll	%i5,	0x16,	%o6
	srl	%l5,	%i7,	%g1
	mulscc	%g2,	0x0969,	%g5
	addcc	%g4,	%o5,	%i6
	edge8ln	%l3,	%i2,	%g3
	xnor	%l2,	%l0,	%l4
	movrlz	%g6,	%l6,	%i0
	fone	%f0
	ldd	[%l7 + 0x30],	%f16
	for	%f20,	%f8,	%f10
	fmovd	%f20,	%f20
	popc	%o0,	%i4
	edge16l	%i1,	%g7,	%o7
	andn	%o3,	%o1,	%i3
	movvs	%xcc,	%l1,	%o4
	ldd	[%l7 + 0x78],	%o2
	edge32	%i5,	%o6,	%i7
	fmovrsgz	%g1,	%f22,	%f26
	restore %g2, 0x00D2, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f12,	%f4,	%f6
	array32	%g4,	%o5,	%i6
	movne	%icc,	%l3,	%i2
	ldsb	[%l7 + 0x2E],	%g3
	edge32n	%l2,	%l0,	%l4
	ldsh	[%l7 + 0x66],	%g6
	movrgz	%l6,	%g5,	%o0
	movge	%xcc,	%i4,	%i1
	movrgz	%i0,	0x112,	%o7
	movvc	%xcc,	%g7,	%o1
	or	%o3,	0x17AC,	%i3
	movrlz	%l1,	%o4,	%o2
	movle	%xcc,	%i5,	%o6
	fcmpeq32	%f10,	%f4,	%i7
	ldd	[%l7 + 0x78],	%f2
	fmovrslez	%g1,	%f16,	%f20
	movn	%xcc,	%g2,	%l5
	edge32n	%g4,	%i6,	%l3
	fpackfix	%f2,	%f16
	ld	[%l7 + 0x70],	%f26
	sra	%o5,	0x0F,	%i2
	edge32ln	%l2,	%g3,	%l0
	fmovdvc	%xcc,	%f3,	%f0
	nop
	set	0x08, %i1
	ldx	[%l7 + %i1],	%l4
	fmovda	%xcc,	%f18,	%f30
	fnegd	%f24,	%f12
	sra	%g6,	%g5,	%o0
	fornot1	%f26,	%f16,	%f18
	stb	%i4,	[%l7 + 0x7B]
	fones	%f28
	fmul8ulx16	%f24,	%f20,	%f2
	andncc	%i1,	%i0,	%l6
	fmuld8sux16	%f7,	%f12,	%f10
	sdivx	%g7,	0x013E,	%o1
	subcc	%o3,	%o7,	%l1
	fnot2	%f18,	%f10
	ldd	[%l7 + 0x30],	%i2
	fmovsge	%xcc,	%f31,	%f31
	mulx	%o4,	0x1285,	%i5
	edge16l	%o2,	%i7,	%o6
	popc	0x07AF,	%g1
	movg	%xcc,	%g2,	%l5
	stw	%i6,	[%l7 + 0x28]
	srlx	%l3,	%g4,	%i2
	edge8ln	%o5,	%l2,	%l0
	fcmpgt32	%f18,	%f24,	%g3
	ldsw	[%l7 + 0x38],	%l4
	movpos	%xcc,	%g5,	%g6
	fnor	%f4,	%f24,	%f10
	sir	0x0E93
	fmovdleu	%icc,	%f11,	%f17
	sth	%i4,	[%l7 + 0x68]
	sll	%i1,	%i0,	%l6
	ldsw	[%l7 + 0x7C],	%g7
	mulx	%o1,	0x011A,	%o0
	fmovrse	%o7,	%f8,	%f10
	fmovsg	%icc,	%f3,	%f30
	subcc	%l1,	0x0F67,	%o3
	edge8ln	%o4,	%i3,	%i5
	fmovsleu	%icc,	%f21,	%f6
	xnor	%o2,	0x12BD,	%i7
	fmovsvs	%icc,	%f9,	%f2
	subccc	%o6,	%g1,	%g2
	sllx	%l5,	%i6,	%l3
	fands	%f4,	%f13,	%f8
	array32	%g4,	%i2,	%l2
	xnorcc	%l0,	%o5,	%l4
	xorcc	%g3,	%g6,	%i4
	movg	%icc,	%i1,	%i0
	fmovsle	%icc,	%f14,	%f26
	orncc	%g5,	0x02D3,	%g7
	andcc	%l6,	%o0,	%o1
	umulcc	%o7,	%o3,	%l1
	movrlz	%o4,	%i3,	%o2
	fmovsge	%icc,	%f16,	%f9
	movpos	%xcc,	%i7,	%o6
	movrgez	%g1,	%i5,	%g2
	fmovdl	%icc,	%f19,	%f22
	srl	%l5,	%i6,	%l3
	array32	%g4,	%i2,	%l0
	udiv	%o5,	0x095A,	%l2
	ldd	[%l7 + 0x78],	%f8
	sub	%l4,	%g3,	%g6
	sra	%i1,	0x02,	%i4
	alignaddrl	%i0,	%g5,	%l6
	stx	%g7,	[%l7 + 0x30]
	ldsh	[%l7 + 0x54],	%o1
	or	%o7,	0x0480,	%o0
	save %l1, %o3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o2,	0x0759,	%i3
	subcc	%i7,	0x007C,	%g1
	stw	%o6,	[%l7 + 0x28]
	lduw	[%l7 + 0x58],	%g2
	xnorcc	%i5,	%i6,	%l3
	fmul8ulx16	%f28,	%f20,	%f12
	array8	%g4,	%i2,	%l0
	movrgez	%o5,	0x095,	%l2
	edge16l	%l4,	%g3,	%g6
	movrlez	%i1,	%i4,	%l5
	fmovdcc	%icc,	%f28,	%f5
	ldsb	[%l7 + 0x31],	%g5
	smulcc	%i0,	0x1609,	%l6
	add	%o1,	0x115E,	%o7
	movg	%xcc,	%o0,	%l1
	sll	%g7,	%o4,	%o3
	fpadd32	%f6,	%f26,	%f18
	fnegs	%f26,	%f22
	edge16l	%o2,	%i3,	%g1
	fmul8sux16	%f28,	%f20,	%f28
	fxor	%f0,	%f14,	%f22
	edge16l	%o6,	%g2,	%i5
	ldd	[%l7 + 0x60],	%f4
	udivx	%i7,	0x0A1E,	%i6
	movl	%xcc,	%l3,	%g4
	sir	0x1D86
	movrgez	%i2,	%l0,	%l2
	edge8n	%l4,	%o5,	%g3
	ldsh	[%l7 + 0x7C],	%g6
	xnorcc	%i4,	0x0FD9,	%l5
	sll	%i1,	%i0,	%g5
	andncc	%o1,	%o7,	%o0
	bshuffle	%f16,	%f20,	%f14
	ldd	[%l7 + 0x50],	%f16
	andcc	%l6,	%g7,	%o4
	stx	%o3,	[%l7 + 0x50]
	sdiv	%o2,	0x02A0,	%i3
	ldx	[%l7 + 0x68],	%l1
	fnands	%f6,	%f21,	%f4
	ldd	[%l7 + 0x08],	%f2
	fandnot2	%f22,	%f10,	%f10
	edge32l	%o6,	%g1,	%g2
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	fcmpd	%fcc1,	%f26,	%f30
	edge8l	%l3,	%i7,	%i2
	addccc	%l0,	0x0189,	%l2
	fmovdvs	%xcc,	%f7,	%f13
	fcmpeq16	%f28,	%f2,	%l4
	ldd	[%l7 + 0x78],	%g4
	edge8ln	%o5,	%g6,	%g3
	fmovdneg	%xcc,	%f5,	%f7
	save %i4, %l5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i1,	%o1,	%o7
	fnot2s	%f0,	%f5
	ldsh	[%l7 + 0x6A],	%g5
	fmovrsgz	%l6,	%f16,	%f26
	fnot2s	%f12,	%f1
	ldsw	[%l7 + 0x7C],	%o0
	fmovdg	%icc,	%f6,	%f13
	siam	0x6
	add	%o4,	0x1513,	%o3
	andcc	%o2,	%i3,	%g7
	movneg	%xcc,	%l1,	%o6
	save %g2, %i5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f9
	movge	%icc,	%g1,	%l3
	addccc	%i2,	0x0E3C,	%l0
	xor	%i7,	0x1826,	%l4
	sdivcc	%l2,	0x1ED8,	%g4
	movg	%icc,	%g6,	%g3
	movl	%xcc,	%o5,	%l5
	umulcc	%i0,	%i4,	%o1
	edge16l	%i1,	%g5,	%o7
	sir	0x1ABB
	movre	%l6,	%o4,	%o0
	smul	%o2,	%o3,	%i3
	fand	%f18,	%f12,	%f2
	edge32l	%l1,	%g7,	%o6
	subc	%g2,	%i6,	%g1
	udivcc	%l3,	0x002B,	%i5
	addccc	%i2,	0x02FA,	%i7
	movne	%icc,	%l4,	%l0
	srl	%l2,	%g6,	%g3
	stw	%g4,	[%l7 + 0x18]
	fabsd	%f20,	%f10
	xor	%o5,	%i0,	%i4
	stx	%l5,	[%l7 + 0x58]
	udiv	%o1,	0x095A,	%g5
	fmovsl	%xcc,	%f12,	%f18
	std	%f6,	[%l7 + 0x78]
	ldd	[%l7 + 0x58],	%f22
	movgu	%xcc,	%o7,	%i1
	fnot2s	%f1,	%f17
	fnegd	%f24,	%f22
	movleu	%xcc,	%l6,	%o0
	edge32n	%o2,	%o3,	%i3
	sra	%o4,	0x12,	%g7
	movrlez	%l1,	%g2,	%o6
	fmovsne	%xcc,	%f21,	%f13
	edge8	%i6,	%l3,	%g1
	or	%i2,	%i7,	%l4
	st	%f11,	[%l7 + 0x34]
	save %l0, %l2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g3,	%g4
	restore %o5, %i0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%l5,	%f18,	%f8
	fnors	%f3,	%f25,	%f20
	ldub	[%l7 + 0x50],	%o1
	movn	%xcc,	%g5,	%o7
	movrlz	%i4,	%l6,	%o0
	ld	[%l7 + 0x20],	%f0
	add	%i1,	0x1364,	%o3
	stb	%o2,	[%l7 + 0x18]
	fsrc1	%f6,	%f28
	save %i3, 0x07B6, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o4,	%g2
	stb	%o6,	[%l7 + 0x4B]
	and	%l1,	%l3,	%g1
	movl	%icc,	%i6,	%i2
	stw	%i7,	[%l7 + 0x24]
	xorcc	%l4,	0x016D,	%l0
	sethi	0x150E,	%l2
	movre	%g6,	0x205,	%g4
	movne	%icc,	%g3,	%o5
	movl	%icc,	%i5,	%l5
	add	%i0,	0x0A8A,	%g5
	mova	%icc,	%o1,	%i4
	st	%f26,	[%l7 + 0x10]
	fands	%f29,	%f12,	%f7
	ldsb	[%l7 + 0x4A],	%l6
	stx	%o0,	[%l7 + 0x70]
	fsrc2	%f16,	%f16
	fone	%f2
	fnegd	%f12,	%f14
	subc	%o7,	%i1,	%o2
	fcmpgt32	%f0,	%f10,	%o3
	move	%icc,	%i3,	%g7
	fand	%f4,	%f10,	%f2
	edge16l	%g2,	%o4,	%o6
	udivcc	%l1,	0x12C3,	%l3
	movleu	%icc,	%i6,	%i2
	mulx	%g1,	0x1A32,	%i7
	stw	%l4,	[%l7 + 0x7C]
	fmovdgu	%xcc,	%f24,	%f0
	fmovsa	%icc,	%f28,	%f8
	alignaddrl	%l2,	%l0,	%g6
	edge32n	%g3,	%g4,	%o5
	movrlz	%i5,	0x20A,	%i0
	fmovdl	%xcc,	%f5,	%f28
	fzero	%f16
	movpos	%icc,	%g5,	%l5
	subc	%i4,	%o1,	%o0
	movleu	%xcc,	%l6,	%o7
	ld	[%l7 + 0x54],	%f1
	fone	%f0
	srax	%o2,	0x0A,	%o3
	mulscc	%i3,	%i1,	%g2
	fandnot2	%f24,	%f6,	%f12
	movneg	%icc,	%g7,	%o6
	edge32l	%l1,	%o4,	%l3
	edge16l	%i6,	%g1,	%i7
	movre	%i2,	%l4,	%l2
	movre	%l0,	%g3,	%g6
	edge32ln	%g4,	%o5,	%i5
	movvs	%icc,	%g5,	%l5
	edge32l	%i0,	%i4,	%o0
	movg	%icc,	%l6,	%o7
	movn	%icc,	%o2,	%o1
	fcmple32	%f8,	%f22,	%i3
	stx	%i1,	[%l7 + 0x40]
	alignaddrl	%o3,	%g2,	%g7
	movcc	%icc,	%o6,	%l1
	stb	%o4,	[%l7 + 0x67]
	orncc	%l3,	%i6,	%g1
	fornot2s	%f18,	%f23,	%f22
	subccc	%i7,	0x19A3,	%i2
	orn	%l4,	0x1921,	%l0
	edge8l	%l2,	%g6,	%g4
	array32	%g3,	%o5,	%i5
	ldsb	[%l7 + 0x27],	%g5
	fnot2s	%f4,	%f15
	fmovsneg	%xcc,	%f25,	%f16
	xor	%l5,	0x1216,	%i4
	mulscc	%o0,	%i0,	%o7
	fmovdge	%icc,	%f4,	%f4
	nop
	set	0x26, %g3
	ldub	[%l7 + %g3],	%l6
	nop
	set	0x2E, %i6
	ldub	[%l7 + %i6],	%o1
	srl	%i3,	0x1F,	%o2
	std	%f8,	[%l7 + 0x50]
	mulscc	%i1,	%o3,	%g2
	fmovdvs	%xcc,	%f30,	%f0
	movcs	%icc,	%o6,	%l1
	movne	%xcc,	%g7,	%l3
	movcs	%icc,	%o4,	%i6
	sra	%i7,	%g1,	%l4
	save %i2, %l2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f11,	%f2,	%f6
	movleu	%icc,	%g4,	%g3
	alignaddrl	%o5,	%i5,	%g5
	movvs	%xcc,	%g6,	%i4
	st	%f13,	[%l7 + 0x2C]
	ldd	[%l7 + 0x08],	%f6
	edge32	%l5,	%o0,	%i0
	lduh	[%l7 + 0x7C],	%o7
	movle	%xcc,	%o1,	%i3
	for	%f18,	%f2,	%f30
	umulcc	%o2,	0x1359,	%l6
	fnors	%f3,	%f26,	%f9
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%f20
	ld	[%l7 + 0x54],	%f14
	for	%f16,	%f12,	%f0
	udivx	%i1,	0x075C,	%g2
	fmuld8sux16	%f1,	%f13,	%f30
	edge16l	%o3,	%o6,	%l1
	fmovrdlez	%l3,	%f6,	%f12
	movpos	%icc,	%o4,	%i6
	nop
	set	0x6C, %g1
	lduw	[%l7 + %g1],	%i7
	srax	%g7,	%g1,	%l4
	fmovse	%xcc,	%f2,	%f28
	popc	0x039A,	%i2
	ldd	[%l7 + 0x68],	%f30
	umulcc	%l2,	0x0B90,	%g4
	andn	%g3,	0x1F8B,	%l0
	lduh	[%l7 + 0x5E],	%o5
	fmovrdlez	%g5,	%f8,	%f12
	array8	%g6,	%i5,	%l5
	smulcc	%o0,	%i4,	%i0
	fmovdvc	%xcc,	%f6,	%f7
	edge16	%o1,	%i3,	%o2
	ldd	[%l7 + 0x08],	%f20
	stb	%l6,	[%l7 + 0x5C]
	edge16ln	%o7,	%i1,	%g2
	ldd	[%l7 + 0x20],	%f16
	array32	%o3,	%l1,	%o6
	movne	%xcc,	%o4,	%l3
	fmovscc	%icc,	%f18,	%f5
	st	%f28,	[%l7 + 0x1C]
	alignaddrl	%i7,	%g7,	%g1
	mulscc	%l4,	%i2,	%i6
	movpos	%icc,	%l2,	%g3
	udivx	%l0,	0x160E,	%g4
	ldd	[%l7 + 0x08],	%o4
	faligndata	%f8,	%f22,	%f22
	ldsb	[%l7 + 0x1E],	%g6
	array32	%g5,	%i5,	%l5
	movle	%xcc,	%i4,	%o0
	alignaddrl	%o1,	%i0,	%o2
	edge8n	%i3,	%o7,	%i1
	move	%icc,	%g2,	%o3
	save %l6, %o6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l1,	%i7
	edge32	%l3,	%g7,	%g1
	alignaddr	%l4,	%i6,	%l2
	movneg	%xcc,	%i2,	%l0
	sll	%g4,	0x1C,	%o5
	array16	%g6,	%g5,	%g3
	fnot1s	%f1,	%f17
	udiv	%i5,	0x1F8A,	%l5
	xnorcc	%o0,	0x01C0,	%o1
	sdivx	%i4,	0x190B,	%i0
	orcc	%o2,	0x11D2,	%o7
	mova	%xcc,	%i1,	%g2
	sdivx	%i3,	0x196F,	%l6
	andncc	%o6,	%o4,	%o3
	sll	%l1,	0x09,	%l3
	fmovsvc	%icc,	%f23,	%f14
	lduh	[%l7 + 0x40],	%i7
	edge16	%g7,	%g1,	%l4
	fmul8sux16	%f14,	%f26,	%f16
	sir	0x09B5
	udiv	%l2,	0x0ACD,	%i2
	array16	%l0,	%g4,	%o5
	movrlz	%g6,	%i6,	%g5
	fpadd32s	%f24,	%f8,	%f14
	movl	%xcc,	%g3,	%l5
	xnorcc	%o0,	%i5,	%i4
	addcc	%i0,	%o2,	%o1
	and	%o7,	%g2,	%i1
	movvc	%xcc,	%l6,	%o6
	edge16	%o4,	%i3,	%o3
	fcmpeq32	%f12,	%f26,	%l1
	edge16ln	%i7,	%l3,	%g7
	sllx	%l4,	0x05,	%l2
	fmovsl	%icc,	%f11,	%f26
	movg	%xcc,	%i2,	%g1
	fnot1s	%f15,	%f6
	faligndata	%f26,	%f24,	%f4
	lduw	[%l7 + 0x18],	%g4
	fcmpes	%fcc3,	%f13,	%f13
	orn	%l0,	%o5,	%i6
	edge16	%g5,	%g6,	%g3
	movrlz	%o0,	%i5,	%i4
	movleu	%icc,	%l5,	%i0
	fzeros	%f8
	lduh	[%l7 + 0x20],	%o1
	or	%o2,	%g2,	%o7
	fmovscs	%xcc,	%f31,	%f3
	bshuffle	%f14,	%f30,	%f26
	fcmpgt32	%f30,	%f2,	%l6
	addc	%i1,	%o6,	%o4
	sdivcc	%i3,	0x12BC,	%l1
	and	%o3,	0x0E0A,	%i7
	fmovdle	%xcc,	%f23,	%f7
	ldd	[%l7 + 0x48],	%l2
	fzeros	%f2
	ld	[%l7 + 0x30],	%f12
	ldsh	[%l7 + 0x60],	%l4
	edge8ln	%g7,	%i2,	%g1
	movge	%xcc,	%l2,	%l0
	udivx	%g4,	0x0FD5,	%i6
	movpos	%xcc,	%o5,	%g6
	movcs	%xcc,	%g5,	%g3
	sethi	0x0E10,	%i5
	srl	%i4,	0x17,	%o0
	movrlez	%l5,	%o1,	%i0
	lduw	[%l7 + 0x60],	%g2
	andcc	%o2,	0x0170,	%l6
	addccc	%o7,	%o6,	%o4
	popc	%i3,	%l1
	mova	%xcc,	%o3,	%i1
	srlx	%l3,	0x13,	%i7
	movne	%xcc,	%l4,	%g7
	edge8	%g1,	%i2,	%l0
	smul	%g4,	%i6,	%l2
	fand	%f2,	%f2,	%f30
	movcs	%icc,	%o5,	%g5
	movcc	%xcc,	%g6,	%i5
	fmovsvc	%xcc,	%f14,	%f23
	movcc	%icc,	%i4,	%o0
	st	%f31,	[%l7 + 0x18]
	edge16l	%l5,	%g3,	%o1
	orn	%i0,	%g2,	%l6
	movne	%icc,	%o2,	%o6
	fnot2	%f4,	%f16
	subcc	%o4,	0x00E7,	%i3
	edge8ln	%l1,	%o7,	%o3
	ldsb	[%l7 + 0x58],	%l3
	ld	[%l7 + 0x74],	%f4
	movge	%xcc,	%i1,	%i7
	st	%f17,	[%l7 + 0x30]
	array16	%l4,	%g1,	%g7
	edge16	%i2,	%l0,	%g4
	smulcc	%i6,	0x0297,	%l2
	and	%o5,	0x138C,	%g5
	and	%i5,	%i4,	%g6
	sub	%l5,	%o0,	%o1
	alignaddrl	%i0,	%g3,	%l6
	fmovdg	%icc,	%f13,	%f23
	array32	%o2,	%g2,	%o6
	movpos	%xcc,	%i3,	%o4
	edge8ln	%o7,	%o3,	%l1
	fnegs	%f2,	%f22
	umul	%l3,	%i7,	%l4
	srl	%g1,	%g7,	%i2
	ldsh	[%l7 + 0x3A],	%l0
	sethi	0x1911,	%g4
	fpadd16s	%f19,	%f16,	%f27
	ldd	[%l7 + 0x40],	%f26
	ldx	[%l7 + 0x30],	%i6
	udivx	%l2,	0x14E0,	%i1
	edge32n	%o5,	%i5,	%i4
	orcc	%g5,	%g6,	%l5
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	sdiv	%g3,	0x0C2E,	%i0
	move	%xcc,	%l6,	%g2
	subcc	%o6,	%o2,	%o4
	save %i3, 0x064D, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l1,	%l3,	%o3
	fmovrdgez	%l4,	%f2,	%f2
	subcc	%g1,	0x0058,	%g7
	fmul8x16	%f3,	%f18,	%f30
	fmuld8sux16	%f3,	%f0,	%f4
	ldd	[%l7 + 0x50],	%f30
	sdivx	%i2,	0x1D12,	%l0
	movne	%xcc,	%i7,	%i6
	movvs	%xcc,	%g4,	%i1
	mulx	%l2,	%o5,	%i4
	or	%g5,	%g6,	%l5
	fmovrslz	%o1,	%f29,	%f6
	fpsub32	%f6,	%f12,	%f22
	movre	%o0,	%i5,	%g3
	edge16ln	%i0,	%l6,	%o6
	ldsh	[%l7 + 0x52],	%g2
	subc	%o2,	%o4,	%i3
	ldsh	[%l7 + 0x54],	%l1
	addc	%o7,	0x1E9F,	%o3
	fmovrsgez	%l3,	%f25,	%f22
	movne	%icc,	%l4,	%g7
	fones	%f0
	edge8	%g1,	%i2,	%i7
	ldsw	[%l7 + 0x78],	%l0
	fpsub32	%f10,	%f0,	%f12
	stb	%i6,	[%l7 + 0x26]
	fmovd	%f12,	%f26
	smulcc	%g4,	0x07DD,	%i1
	addcc	%o5,	%l2,	%g5
	fmovsl	%xcc,	%f14,	%f24
	addccc	%g6,	%l5,	%o1
	fornot2	%f0,	%f6,	%f14
	movrlez	%i4,	0x2BD,	%o0
	stb	%g3,	[%l7 + 0x4F]
	fmovrdne	%i0,	%f10,	%f24
	movrne	%i5,	%o6,	%l6
	edge8n	%g2,	%o4,	%i3
	restore %l1, 0x097C, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o7,	%l3,	%o3
	edge16	%g7,	%g1,	%l4
	stx	%i7,	[%l7 + 0x60]
	movle	%xcc,	%i2,	%l0
	movpos	%icc,	%g4,	%i1
	smulcc	%i6,	0x08D1,	%l2
	fmul8x16	%f12,	%f10,	%f26
	edge32ln	%o5,	%g5,	%g6
	array32	%o1,	%l5,	%i4
	andcc	%o0,	%g3,	%i0
	array16	%o6,	%i5,	%g2
	fabss	%f11,	%f8
	edge16ln	%o4,	%i3,	%l6
	fmovdpos	%xcc,	%f2,	%f1
	addccc	%o2,	%o7,	%l3
	array32	%o3,	%l1,	%g7
	movge	%icc,	%g1,	%l4
	movrne	%i2,	%l0,	%i7
	fcmpes	%fcc3,	%f1,	%f21
	mova	%xcc,	%g4,	%i6
	ldsh	[%l7 + 0x32],	%l2
	movrne	%o5,	%i1,	%g6
	stw	%o1,	[%l7 + 0x48]
	st	%f13,	[%l7 + 0x14]
	fpadd16s	%f12,	%f29,	%f22
	array8	%l5,	%i4,	%g5
	movrgz	%g3,	0x284,	%o0
	udivcc	%i0,	0x0DD6,	%o6
	edge8ln	%i5,	%g2,	%o4
	sth	%l6,	[%l7 + 0x18]
	ldsw	[%l7 + 0x68],	%i3
	sra	%o2,	%l3,	%o7
	udivx	%l1,	0x1329,	%o3
	edge32ln	%g1,	%g7,	%i2
	array16	%l0,	%l4,	%i7
	orncc	%g4,	%l2,	%i6
	edge8ln	%o5,	%i1,	%g6
	edge32n	%l5,	%o1,	%i4
	movneg	%xcc,	%g3,	%o0
	edge32l	%g5,	%o6,	%i0
	movrgz	%i5,	0x3A9,	%o4
	xnorcc	%g2,	%l6,	%i3
	fcmpgt32	%f4,	%f18,	%o2
	fmovsle	%xcc,	%f15,	%f28
	andn	%l3,	%l1,	%o3
	edge8l	%o7,	%g1,	%i2
	srlx	%l0,	0x0C,	%g7
	ldd	[%l7 + 0x78],	%f4
	sdivcc	%i7,	0x19B9,	%l4
	umulcc	%l2,	%i6,	%o5
	ldd	[%l7 + 0x70],	%i0
	fpack32	%f24,	%f28,	%f10
	move	%xcc,	%g6,	%l5
	nop
	set	0x08, %o4
	lduh	[%l7 + %o4],	%g4
	umul	%i4,	%g3,	%o0
	movrlez	%g5,	%o1,	%i0
	sdiv	%o6,	0x1CBF,	%o4
	mulx	%g2,	0x1CBF,	%i5
	lduh	[%l7 + 0x50],	%l6
	fandnot2	%f12,	%f12,	%f26
	lduw	[%l7 + 0x24],	%o2
	fmovsl	%icc,	%f29,	%f7
	movl	%icc,	%i3,	%l1
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	fmovse	%xcc,	%f29,	%f15
	sth	%i2,	[%l7 + 0x74]
	orcc	%l0,	%l3,	%i7
	movgu	%xcc,	%l4,	%g7
	stw	%l2,	[%l7 + 0x18]
	ldd	[%l7 + 0x18],	%o4
	save %i6, 0x1EC9, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%g6,	%l5
	fmovrdgz	%i4,	%f12,	%f26
	fcmpeq16	%f14,	%f30,	%g3
	fpsub16	%f28,	%f8,	%f28
	edge16l	%g4,	%o0,	%o1
	stx	%i0,	[%l7 + 0x28]
	movre	%g5,	0x0ED,	%o6
	st	%f18,	[%l7 + 0x64]
	edge8n	%g2,	%i5,	%l6
	srlx	%o4,	%o2,	%l1
	ldd	[%l7 + 0x58],	%f14
	orn	%i3,	0x0381,	%o7
	fmovdneg	%xcc,	%f31,	%f10
	xorcc	%o3,	0x1899,	%i2
	movneg	%xcc,	%g1,	%l3
	fmovdgu	%icc,	%f25,	%f19
	srlx	%l0,	%l4,	%i7
	array32	%l2,	%o5,	%i6
	movrne	%g7,	0x1AE,	%i1
	ld	[%l7 + 0x68],	%f27
	ldd	[%l7 + 0x20],	%f28
	movne	%xcc,	%g6,	%l5
	movpos	%icc,	%i4,	%g3
	nop
	set	0x20, %g2
	ldsw	[%l7 + %g2],	%o0
	fmovscc	%xcc,	%f29,	%f26
	fmovrdne	%o1,	%f12,	%f8
	srl	%g4,	0x12,	%i0
	movne	%icc,	%g5,	%o6
	edge16l	%i5,	%g2,	%l6
	fmul8sux16	%f28,	%f12,	%f6
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%o2
	movneg	%icc,	%o4,	%i3
	movle	%icc,	%o7,	%l1
	fzeros	%f19
	mulx	%o3,	0x0070,	%g1
	fpsub32	%f22,	%f8,	%f30
	alignaddrl	%i2,	%l0,	%l4
	movcs	%icc,	%l3,	%i7
	edge16ln	%l2,	%i6,	%o5
	fmovsg	%xcc,	%f2,	%f18
	move	%xcc,	%i1,	%g7
	movvs	%xcc,	%l5,	%g6
	udivcc	%i4,	0x0B3E,	%g3
	xorcc	%o0,	0x1B74,	%g4
	ld	[%l7 + 0x34],	%f25
	edge8	%i0,	%o1,	%o6
	udiv	%i5,	0x0A34,	%g2
	movl	%icc,	%l6,	%o2
	edge16	%g5,	%o4,	%i3
	movpos	%icc,	%l1,	%o3
	nop
	set	0x7A, %i0
	lduh	[%l7 + %i0],	%o7
	movvs	%xcc,	%i2,	%g1
	movge	%icc,	%l4,	%l3
	edge32ln	%i7,	%l0,	%l2
	srax	%i6,	0x01,	%i1
	ldx	[%l7 + 0x20],	%g7
	edge32l	%l5,	%o5,	%i4
	fcmple32	%f24,	%f18,	%g3
	ldsb	[%l7 + 0x24],	%g6
	restore %g4, 0x0404, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i0,	[%l7 + 0x10]
	lduw	[%l7 + 0x2C],	%o1
	and	%i5,	0x01E4,	%o6
	sth	%l6,	[%l7 + 0x74]
	edge8n	%g2,	%o2,	%g5
	sub	%i3,	0x0E86,	%o4
	smul	%l1,	0x03A4,	%o7
	fmovrslez	%o3,	%f25,	%f1
	fxor	%f30,	%f26,	%f12
	edge8ln	%i2,	%g1,	%l4
	movge	%xcc,	%i7,	%l0
	andncc	%l2,	%i6,	%i1
	edge16l	%g7,	%l5,	%o5
	fmovdn	%icc,	%f6,	%f16
	umulcc	%l3,	0x066E,	%g3
	edge16ln	%i4,	%g6,	%g4
	srlx	%i0,	0x04,	%o0
	andcc	%o1,	%o6,	%l6
	fand	%f0,	%f10,	%f24
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	edge32ln	%g5,	%i3,	%o4
	orcc	%o7,	0x16FC,	%o3
	ldd	[%l7 + 0x78],	%l0
	ldd	[%l7 + 0x20],	%i2
	ldsh	[%l7 + 0x42],	%g1
	movvs	%icc,	%l4,	%i7
	fornot2s	%f0,	%f11,	%f7
	andncc	%l0,	%l2,	%i1
	add	%g7,	0x1BFF,	%l5
	mulscc	%i6,	0x067E,	%l3
	edge8l	%g3,	%o5,	%g6
	andn	%g4,	%i4,	%o0
	xnor	%i0,	%o6,	%l6
	sethi	0x17A7,	%o1
	array32	%g2,	%o2,	%i5
	movrgez	%i3,	%g5,	%o4
	edge8n	%o3,	%o7,	%i2
	fnegd	%f4,	%f18
	andncc	%l1,	%l4,	%i7
	udivcc	%g1,	0x02BB,	%l2
	xor	%l0,	%i1,	%l5
	movcc	%icc,	%i6,	%g7
	array16	%g3,	%l3,	%g6
	sra	%g4,	0x19,	%i4
	edge8l	%o0,	%o5,	%i0
	edge8n	%o6,	%o1,	%g2
	edge8n	%o2,	%i5,	%i3
	alignaddr	%l6,	%g5,	%o3
	movle	%icc,	%o4,	%o7
	sth	%l1,	[%l7 + 0x72]
	udivx	%l4,	0x181C,	%i2
	edge8	%g1,	%i7,	%l2
	fmovdn	%icc,	%f2,	%f6
	edge8n	%l0,	%i1,	%i6
	fmovscc	%icc,	%f31,	%f3
	movvs	%xcc,	%l5,	%g7
	sra	%g3,	0x0A,	%l3
	sir	0x0245
	fabss	%f29,	%f2
	sub	%g6,	0x071E,	%i4
	movne	%icc,	%o0,	%g4
	movcs	%xcc,	%o5,	%i0
	mulscc	%o1,	0x0480,	%g2
	fmovrslz	%o2,	%f31,	%f12
	movvc	%icc,	%i5,	%i3
	smulcc	%o6,	0x012C,	%l6
	movpos	%xcc,	%g5,	%o3
	movcs	%icc,	%o4,	%l1
	sethi	0x082F,	%o7
	nop
	set	0x6C, %l2
	stb	%l4,	[%l7 + %l2]
	fpadd32	%f8,	%f6,	%f24
	srlx	%g1,	%i2,	%i7
	fcmped	%fcc2,	%f28,	%f14
	edge32	%l2,	%i1,	%i6
	smul	%l5,	%g7,	%g3
	srl	%l0,	0x03,	%l3
	mulx	%g6,	%i4,	%g4
	sdivcc	%o0,	0x10C2,	%o5
	array32	%o1,	%i0,	%g2
	andncc	%o2,	%i3,	%i5
	fsrc2	%f14,	%f24
	movvc	%icc,	%l6,	%g5
	movpos	%xcc,	%o6,	%o4
	movpos	%icc,	%o3,	%o7
	fmovsleu	%icc,	%f11,	%f3
	movn	%xcc,	%l1,	%l4
	mulscc	%i2,	0x1135,	%g1
	or	%l2,	%i7,	%i1
	fxor	%f26,	%f0,	%f18
	srax	%l5,	0x05,	%g7
	stx	%i6,	[%l7 + 0x18]
	smul	%g3,	%l0,	%g6
	edge8l	%l3,	%g4,	%i4
	smul	%o0,	0x1548,	%o1
	array32	%o5,	%g2,	%i0
	sir	0x087E
	edge32	%i3,	%o2,	%l6
	fnands	%f19,	%f5,	%f22
	fmovsa	%xcc,	%f12,	%f2
	addc	%g5,	%o6,	%o4
	fmovsneg	%icc,	%f25,	%f2
	movvs	%icc,	%i5,	%o7
	movneg	%icc,	%l1,	%o3
	fmovscs	%icc,	%f1,	%f0
	edge32ln	%i2,	%g1,	%l4
	popc	%i7,	%i1
	movrlez	%l5,	0x3BB,	%g7
	fmovrdlz	%i6,	%f28,	%f12
	movgu	%icc,	%g3,	%l0
	xor	%l2,	%l3,	%g6
	movg	%icc,	%i4,	%g4
	fpsub16s	%f7,	%f10,	%f31
	ldub	[%l7 + 0x0C],	%o0
	orn	%o1,	0x1308,	%g2
	ldsh	[%l7 + 0x70],	%i0
	sub	%o5,	0x16E9,	%o2
	movrgz	%i3,	%g5,	%l6
	fmovdvc	%xcc,	%f12,	%f28
	ldub	[%l7 + 0x21],	%o6
	andn	%o4,	0x1EA5,	%i5
	sllx	%l1,	0x03,	%o7
	sth	%o3,	[%l7 + 0x1A]
	fmovdpos	%xcc,	%f6,	%f30
	fmovsg	%icc,	%f18,	%f1
	fpadd16s	%f30,	%f9,	%f4
	mova	%xcc,	%i2,	%g1
	fpmerge	%f21,	%f15,	%f24
	addccc	%l4,	%i1,	%l5
	orn	%i7,	0x0CD4,	%i6
	movrne	%g7,	%g3,	%l0
	movrlez	%l2,	%l3,	%g6
	ldd	[%l7 + 0x10],	%f2
	fpadd32s	%f15,	%f17,	%f30
	fcmped	%fcc1,	%f0,	%f28
	orn	%g4,	%o0,	%i4
	fcmpne16	%f16,	%f2,	%g2
	siam	0x4
	edge8ln	%i0,	%o5,	%o2
	movrgz	%i3,	%o1,	%l6
	sra	%g5,	%o4,	%o6
	fornot2	%f2,	%f16,	%f28
	sdivcc	%l1,	0x0B01,	%i5
	lduh	[%l7 + 0x40],	%o7
	ld	[%l7 + 0x64],	%f5
	edge16	%i2,	%o3,	%g1
	sethi	0x0787,	%l4
	movle	%icc,	%i1,	%l5
	fands	%f2,	%f6,	%f16
	fmovrsgez	%i7,	%f16,	%f11
	edge8	%i6,	%g7,	%g3
	addccc	%l2,	%l0,	%g6
	stx	%l3,	[%l7 + 0x20]
	andncc	%o0,	%g4,	%g2
	nop
	set	0x58, %l0
	stw	%i0,	[%l7 + %l0]
	edge16n	%i4,	%o5,	%i3
	popc	0x0B40,	%o1
	edge32l	%o2,	%g5,	%o4
	fpack16	%f16,	%f0
	fmul8ulx16	%f8,	%f24,	%f14
	andn	%l6,	%o6,	%l1
	orcc	%i5,	0x14E7,	%o7
	xnorcc	%o3,	%g1,	%i2
	movre	%l4,	0x204,	%l5
	movre	%i7,	0x368,	%i6
	edge32ln	%i1,	%g3,	%l2
	fmovsge	%xcc,	%f17,	%f16
	fpsub32s	%f11,	%f5,	%f29
	movleu	%xcc,	%g7,	%l0
	edge32	%l3,	%o0,	%g4
	orn	%g6,	%i0,	%g2
	sth	%o5,	[%l7 + 0x60]
	array16	%i3,	%i4,	%o1
	edge8ln	%g5,	%o2,	%o4
	fmovsl	%icc,	%f3,	%f5
	movleu	%xcc,	%o6,	%l6
	sth	%l1,	[%l7 + 0x60]
	movg	%xcc,	%o7,	%i5
	mulscc	%o3,	0x0661,	%i2
	movcc	%icc,	%l4,	%l5
	fcmpes	%fcc1,	%f14,	%f30
	fcmped	%fcc3,	%f14,	%f0
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%g1
	fpadd16s	%f13,	%f10,	%f24
	ld	[%l7 + 0x54],	%f24
	mulx	%i6,	0x0CBB,	%i7
	fmovdgu	%icc,	%f30,	%f24
	nop
	set	0x70, %o0
	ldx	[%l7 + %o0],	%g3
	addccc	%l2,	%i1,	%l0
	fzero	%f12
	lduw	[%l7 + 0x08],	%g7
	fmovscc	%icc,	%f18,	%f13
	andncc	%l3,	%g4,	%g6
	movcc	%icc,	%o0,	%g2
	ldsw	[%l7 + 0x44],	%o5
	fnot2s	%f23,	%f4
	andcc	%i0,	%i3,	%o1
	fmovscs	%icc,	%f4,	%f14
	fcmpgt32	%f20,	%f24,	%i4
	lduh	[%l7 + 0x30],	%o2
	ldx	[%l7 + 0x70],	%o4
	lduw	[%l7 + 0x38],	%g5
	addc	%o6,	0x0D28,	%l6
	orncc	%l1,	%i5,	%o7
	and	%o3,	%i2,	%l5
	movg	%icc,	%l4,	%i6
	subccc	%g1,	%g3,	%l2
	movgu	%icc,	%i7,	%i1
	xnorcc	%l0,	0x15B3,	%l3
	xor	%g4,	0x1F14,	%g6
	fnor	%f22,	%f20,	%f6
	sub	%g7,	%o0,	%o5
	fcmpne32	%f28,	%f6,	%g2
	movre	%i0,	%o1,	%i4
	and	%o2,	0x0A25,	%i3
	fmovda	%icc,	%f9,	%f8
	stw	%o4,	[%l7 + 0x30]
	edge32	%g5,	%l6,	%o6
	fexpand	%f20,	%f8
	movl	%xcc,	%l1,	%i5
	umulcc	%o7,	%i2,	%l5
	fmovdvs	%icc,	%f7,	%f8
	andn	%o3,	0x103B,	%l4
	addccc	%g1,	%i6,	%l2
	subccc	%g3,	0x1ADC,	%i1
	fnot2	%f16,	%f2
	ld	[%l7 + 0x50],	%f2
	ldd	[%l7 + 0x50],	%f28
	restore %i7, %l0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x34],	%g4
	fmovdvs	%xcc,	%f26,	%f23
	array8	%g6,	%o0,	%g7
	srlx	%g2,	0x16,	%i0
	fmovsvs	%icc,	%f0,	%f18
	ldsh	[%l7 + 0x3E],	%o5
	edge8	%o1,	%i4,	%o2
	ldd	[%l7 + 0x38],	%f18
	ldub	[%l7 + 0x68],	%o4
	movne	%xcc,	%g5,	%i3
	bshuffle	%f16,	%f18,	%f4
	alignaddr	%l6,	%o6,	%l1
	edge32n	%o7,	%i5,	%i2
	ldd	[%l7 + 0x10],	%o2
	alignaddrl	%l5,	%l4,	%g1
	ldx	[%l7 + 0x50],	%l2
	fone	%f24
	fnand	%f12,	%f10,	%f24
	edge16ln	%g3,	%i6,	%i7
	sll	%l0,	%i1,	%g4
	fmul8ulx16	%f8,	%f22,	%f4
	fands	%f17,	%f1,	%f18
	orcc	%g6,	0x1B5E,	%l3
	sdivx	%g7,	0x1FFB,	%g2
	subccc	%i0,	0x033A,	%o0
	movpos	%xcc,	%o5,	%o1
	movneg	%icc,	%i4,	%o2
	popc	%o4,	%g5
	fpadd32s	%f10,	%f0,	%f23
	edge32l	%i3,	%o6,	%l1
	edge8l	%o7,	%l6,	%i2
	edge8	%i5,	%o3,	%l4
	ldub	[%l7 + 0x23],	%g1
	sdiv	%l2,	0x0045,	%g3
	edge8ln	%i6,	%l5,	%i7
	ldsh	[%l7 + 0x58],	%i1
	edge8n	%g4,	%l0,	%g6
	fandnot1	%f20,	%f2,	%f4
	fxnors	%f1,	%f21,	%f6
	nop
	set	0x58, %l4
	ldsw	[%l7 + %l4],	%l3
	srl	%g7,	0x16,	%g2
	or	%o0,	%o5,	%o1
	andncc	%i4,	%o2,	%o4
	sdiv	%i0,	0x1345,	%i3
	fmuld8ulx16	%f19,	%f27,	%f14
	fmovscc	%xcc,	%f16,	%f12
	fnors	%f13,	%f7,	%f19
	fmovdvs	%xcc,	%f3,	%f20
	xnorcc	%o6,	0x08A5,	%g5
	ldd	[%l7 + 0x78],	%f30
	nop
	set	0x5E, %o3
	lduh	[%l7 + %o3],	%l1
	movrgz	%l6,	%o7,	%i2
	movrgez	%o3,	0x34B,	%i5
	fcmpd	%fcc1,	%f22,	%f26
	umul	%l4,	0x01D8,	%g1
	srlx	%l2,	0x0D,	%i6
	edge32n	%g3,	%l5,	%i7
	movg	%icc,	%i1,	%g4
	fcmpgt32	%f0,	%f14,	%l0
	movg	%xcc,	%l3,	%g6
	movn	%xcc,	%g2,	%g7
	ld	[%l7 + 0x48],	%f4
	edge8	%o5,	%o1,	%i4
	array8	%o2,	%o4,	%o0
	movrne	%i0,	%i3,	%o6
	stw	%g5,	[%l7 + 0x74]
	mulscc	%l1,	0x1F16,	%o7
	ldsw	[%l7 + 0x70],	%l6
	stx	%i2,	[%l7 + 0x38]
	fornot2	%f22,	%f30,	%f14
	stx	%i5,	[%l7 + 0x28]
	mulscc	%l4,	0x0CFC,	%g1
	fabss	%f15,	%f6
	edge8l	%o3,	%l2,	%g3
	orn	%l5,	%i7,	%i1
	udivcc	%g4,	0x09E6,	%i6
	ldsw	[%l7 + 0x70],	%l0
	ldd	[%l7 + 0x70],	%f2
	array32	%l3,	%g6,	%g7
	xorcc	%o5,	0x0F98,	%o1
	array16	%g2,	%o2,	%i4
	movcs	%icc,	%o0,	%o4
	andn	%i0,	0x0255,	%i3
	orncc	%o6,	0x1222,	%g5
	fexpand	%f11,	%f24
	sra	%l1,	0x13,	%l6
	movgu	%xcc,	%o7,	%i5
	fsrc1	%f2,	%f26
	umul	%l4,	%g1,	%o3
	ldub	[%l7 + 0x61],	%l2
	fmovrdne	%g3,	%f12,	%f26
	movvs	%xcc,	%l5,	%i7
	fcmpgt16	%f30,	%f26,	%i1
	fmovde	%icc,	%f10,	%f14
	fmovdvc	%xcc,	%f19,	%f25
	fmovde	%icc,	%f18,	%f24
	ldx	[%l7 + 0x18],	%i2
	ldsh	[%l7 + 0x18],	%i6
	fpadd32	%f24,	%f22,	%f2
	fnand	%f6,	%f0,	%f22
	movge	%icc,	%l0,	%l3
	orncc	%g6,	0x0E28,	%g7
	edge32ln	%o5,	%g4,	%g2
	fmovrdlz	%o1,	%f2,	%f12
	movvc	%xcc,	%i4,	%o2
	movcs	%icc,	%o4,	%o0
	fmuld8ulx16	%f30,	%f11,	%f30
	andncc	%i0,	%o6,	%i3
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	ldsb	[%l7 + 0x0B],	%i5
	stw	%o7,	[%l7 + 0x0C]
	udiv	%g1,	0x1582,	%l4
	edge32l	%l2,	%g3,	%o3
	movrlez	%i7,	0x268,	%l5
	lduw	[%l7 + 0x2C],	%i2
	xnor	%i6,	%l0,	%i1
	srlx	%g6,	0x06,	%l3
	add	%o5,	%g7,	%g2
	fmovrslz	%g4,	%f5,	%f14
	movcs	%icc,	%o1,	%o2
	ldub	[%l7 + 0x37],	%o4
	movrlez	%o0,	%i0,	%o6
	movle	%icc,	%i4,	%g5
	st	%f27,	[%l7 + 0x48]
	mova	%icc,	%i3,	%l1
	alignaddr	%l6,	%o7,	%i5
	sllx	%g1,	0x0A,	%l4
	fpack16	%f8,	%f17
	fnot1s	%f25,	%f25
	fones	%f27
	smulcc	%l2,	%g3,	%i7
	array32	%o3,	%l5,	%i6
	fpack32	%f0,	%f24,	%f16
	edge32	%i2,	%i1,	%g6
	fnot2	%f12,	%f0
	movrlz	%l0,	%l3,	%g7
	edge32n	%g2,	%o5,	%o1
	subc	%g4,	%o4,	%o0
	sdiv	%i0,	0x0ADE,	%o6
	save %o2, %i4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%l1,	%f2,	%f30
	sdiv	%l6,	0x0E80,	%i3
	udiv	%o7,	0x1B6C,	%i5
	ldub	[%l7 + 0x2A],	%g1
	movrgez	%l2,	0x209,	%l4
	sth	%i7,	[%l7 + 0x20]
	srlx	%o3,	0x1C,	%l5
	array8	%i6,	%i2,	%i1
	edge8n	%g3,	%g6,	%l0
	fmovs	%f29,	%f15
	movle	%icc,	%g7,	%g2
	fmovde	%icc,	%f20,	%f13
	movneg	%xcc,	%l3,	%o5
	smulcc	%o1,	%g4,	%o0
	save %o4, 0x0A9C, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o6,	0x1F,	%o2
	movrne	%g5,	%l1,	%l6
	fmul8x16	%f16,	%f24,	%f4
	mova	%icc,	%i3,	%i4
	sll	%i5,	0x03,	%o7
	fnot1s	%f8,	%f17
	edge16	%l2,	%g1,	%i7
	srl	%o3,	%l4,	%l5
	smulcc	%i2,	%i1,	%i6
	array16	%g6,	%l0,	%g7
	ld	[%l7 + 0x44],	%f23
	fornot1s	%f27,	%f17,	%f0
	xnor	%g2,	0x0D2F,	%l3
	movrlez	%o5,	%g3,	%g4
	st	%f29,	[%l7 + 0x6C]
	lduw	[%l7 + 0x0C],	%o1
	sir	0x13D4
	st	%f31,	[%l7 + 0x48]
	smul	%o4,	%i0,	%o6
	fmovrdgz	%o0,	%f6,	%f4
	mova	%xcc,	%o2,	%l1
	movgu	%xcc,	%l6,	%i3
	mova	%xcc,	%i4,	%i5
	andncc	%g5,	%l2,	%o7
	fmovdleu	%icc,	%f22,	%f14
	move	%xcc,	%g1,	%o3
	movl	%xcc,	%l4,	%i7
	nop
	set	0x6E, %o5
	sth	%i2,	[%l7 + %o5]
	alignaddr	%l5,	%i6,	%g6
	stb	%l0,	[%l7 + 0x5F]
	fcmped	%fcc0,	%f30,	%f20
	umulcc	%i1,	%g2,	%l3
	andcc	%o5,	%g7,	%g4
	bshuffle	%f0,	%f16,	%f28
	fnand	%f26,	%f6,	%f2
	fcmpeq16	%f22,	%f14,	%g3
	sth	%o1,	[%l7 + 0x52]
	st	%f15,	[%l7 + 0x1C]
	sllx	%i0,	%o6,	%o4
	ldsh	[%l7 + 0x60],	%o0
	movleu	%xcc,	%o2,	%l1
	orn	%i3,	%l6,	%i5
	edge32	%g5,	%i4,	%l2
	edge16ln	%g1,	%o3,	%l4
	edge32	%o7,	%i2,	%l5
	fnors	%f15,	%f27,	%f6
	movne	%xcc,	%i6,	%i7
	fnot2s	%f26,	%f23
	fmovdpos	%xcc,	%f18,	%f0
	movrgz	%g6,	0x2B0,	%i1
	alignaddrl	%g2,	%l0,	%l3
	fmovdg	%xcc,	%f18,	%f1
	fcmpne32	%f28,	%f16,	%g7
	orncc	%g4,	%g3,	%o1
	edge8l	%i0,	%o6,	%o4
	movrlez	%o5,	0x237,	%o2
	udiv	%l1,	0x0DEA,	%i3
	ld	[%l7 + 0x74],	%f25
	edge8l	%l6,	%o0,	%g5
	fands	%f3,	%f21,	%f13
	xnorcc	%i5,	0x131F,	%i4
	fabsd	%f14,	%f14
	nop
	set	0x26, %l3
	sth	%l2,	[%l7 + %l3]
	move	%xcc,	%o3,	%g1
	array8	%l4,	%o7,	%i2
	movrlz	%l5,	0x172,	%i6
	move	%icc,	%g6,	%i7
	popc	0x026A,	%g2
	ldx	[%l7 + 0x08],	%i1
	orcc	%l0,	0x19F8,	%l3
	movcc	%icc,	%g4,	%g3
	edge16ln	%g7,	%i0,	%o6
	edge32	%o1,	%o4,	%o2
	movrlez	%l1,	0x3C5,	%o5
	addc	%i3,	%o0,	%g5
	fabss	%f10,	%f3
	fmovrsne	%i5,	%f26,	%f21
	fmovsgu	%icc,	%f19,	%f22
	or	%i4,	0x1832,	%l2
	ldd	[%l7 + 0x78],	%f18
	alignaddr	%l6,	%o3,	%g1
	srl	%l4,	0x1E,	%i2
	fmovdne	%icc,	%f20,	%f18
	restore %l5, %o7, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%i6,	%g2
	andcc	%i7,	0x0AAB,	%i1
	edge32	%l3,	%l0,	%g4
	bshuffle	%f20,	%f30,	%f14
	movleu	%icc,	%g3,	%g7
	alignaddrl	%i0,	%o1,	%o4
	ldsw	[%l7 + 0x3C],	%o2
	movne	%xcc,	%l1,	%o5
	fmovdl	%icc,	%f5,	%f16
	movcc	%xcc,	%i3,	%o6
	edge16l	%o0,	%i5,	%i4
	fmovsa	%icc,	%f28,	%f9
	move	%icc,	%l2,	%g5
	movrlez	%l6,	%g1,	%o3
	nop
	set	0x74, %o1
	lduh	[%l7 + %o1],	%i2
	or	%l4,	0x0199,	%o7
	udivcc	%l5,	0x0596,	%g6
	fandnot2s	%f13,	%f8,	%f29
	smul	%i6,	%i7,	%g2
	stw	%i1,	[%l7 + 0x08]
	andncc	%l0,	%l3,	%g3
	smulcc	%g4,	0x13E8,	%g7
	nop
	set	0x08, %g6
	ldsw	[%l7 + %g6],	%o1
	ldub	[%l7 + 0x7C],	%i0
	xnorcc	%o2,	0x00A8,	%o4
	movne	%icc,	%l1,	%o5
	sdiv	%i3,	0x179F,	%o6
	smul	%i5,	0x1685,	%o0
	edge32n	%i4,	%g5,	%l2
	or	%l6,	%o3,	%g1
	fmuld8sux16	%f8,	%f5,	%f14
	addc	%i2,	0x0D27,	%l4
	subc	%l5,	%o7,	%i6
	subc	%g6,	0x16D5,	%i7
	mulx	%i1,	%l0,	%g2
	movrgez	%g3,	%g4,	%l3
	movl	%xcc,	%o1,	%g7
	movl	%xcc,	%i0,	%o4
	movrlez	%l1,	%o2,	%o5
	xnor	%i3,	%i5,	%o0
	movcs	%xcc,	%o6,	%g5
	movvc	%xcc,	%l2,	%l6
	ldx	[%l7 + 0x70],	%o3
	fornot1s	%f14,	%f12,	%f5
	fand	%f16,	%f0,	%f10
	ldx	[%l7 + 0x58],	%g1
	fmovsne	%xcc,	%f28,	%f11
	sra	%i4,	0x0F,	%l4
	sub	%i2,	%o7,	%l5
	movne	%xcc,	%i6,	%g6
	sdiv	%i1,	0x1587,	%l0
	smulcc	%i7,	0x10C3,	%g3
	std	%f2,	[%l7 + 0x50]
	smul	%g4,	%g2,	%l3
	alignaddr	%g7,	%o1,	%o4
	orn	%i0,	0x056F,	%l1
	smul	%o5,	0x17C6,	%o2
	addc	%i3,	0x0D09,	%o0
	mulx	%i5,	%g5,	%o6
	movleu	%xcc,	%l6,	%o3
	movrlez	%l2,	%i4,	%g1
	ldsb	[%l7 + 0x5A],	%l4
	fmovdvc	%xcc,	%f13,	%f17
	fandnot2	%f8,	%f10,	%f16
	fpadd32s	%f2,	%f2,	%f7
	edge16l	%i2,	%l5,	%i6
	udiv	%o7,	0x1793,	%g6
	sub	%l0,	0x1BF5,	%i1
	fnors	%f3,	%f24,	%f15
	fmovdle	%xcc,	%f2,	%f12
	movneg	%xcc,	%i7,	%g3
	fmovrdlez	%g4,	%f20,	%f10
	addc	%l3,	%g7,	%g2
	or	%o4,	%o1,	%l1
	mulx	%i0,	%o5,	%o2
	smul	%i3,	0x0B3B,	%i5
	xorcc	%o0,	0x1C7F,	%o6
	and	%g5,	0x13AD,	%l6
	ldsb	[%l7 + 0x4C],	%o3
	movrne	%l2,	0x119,	%i4
	movpos	%icc,	%g1,	%i2
	addc	%l4,	%i6,	%o7
	ldx	[%l7 + 0x70],	%g6
	ldsw	[%l7 + 0x28],	%l0
	andncc	%l5,	%i7,	%i1
	fpack16	%f24,	%f10
	fcmps	%fcc1,	%f18,	%f24
	andcc	%g3,	0x120E,	%g4
	andn	%g7,	%g2,	%o4
	movrgz	%o1,	%l1,	%l3
	mulscc	%o5,	0x10B3,	%o2
	edge8n	%i3,	%i0,	%o0
	fxnor	%f28,	%f24,	%f26
	fnands	%f27,	%f26,	%f21
	sdiv	%i5,	0x0A96,	%o6
	umulcc	%g5,	%o3,	%l2
	sdiv	%l6,	0x1721,	%g1
	fcmpes	%fcc3,	%f2,	%f2
	umulcc	%i4,	0x1E30,	%l4
	movrgz	%i6,	0x00B,	%i2
	ldsw	[%l7 + 0x3C],	%g6
	edge8ln	%o7,	%l5,	%l0
	fmovsne	%icc,	%f3,	%f0
	move	%icc,	%i1,	%g3
	edge16l	%i7,	%g7,	%g4
	edge32n	%o4,	%o1,	%g2
	std	%f16,	[%l7 + 0x20]
	movle	%xcc,	%l3,	%o5
	fmovs	%f16,	%f26
	movvc	%icc,	%o2,	%i3
	movne	%xcc,	%i0,	%l1
	srax	%i5,	%o6,	%g5
	fmovdneg	%icc,	%f15,	%f1
	fsrc2	%f20,	%f8
	smul	%o0,	%o3,	%l6
	edge8ln	%g1,	%i4,	%l2
	addccc	%i6,	0x0321,	%i2
	edge32ln	%g6,	%l4,	%o7
	edge8	%l5,	%i1,	%g3
	movvc	%icc,	%l0,	%i7
	ldsh	[%l7 + 0x1E],	%g4
	fmovdl	%icc,	%f11,	%f24
	sllx	%g7,	0x01,	%o4
	orncc	%o1,	0x19C0,	%l3
	movn	%icc,	%g2,	%o5
	srlx	%i3,	0x17,	%i0
	edge8n	%o2,	%i5,	%l1
	fmovrsne	%o6,	%f13,	%f16
	andcc	%g5,	0x155D,	%o0
	stb	%l6,	[%l7 + 0x29]
	movneg	%icc,	%o3,	%g1
	srlx	%i4,	0x0D,	%i6
	movg	%xcc,	%l2,	%i2
	movre	%l4,	0x316,	%g6
	movrlez	%l5,	0x1AA,	%i1
	movgu	%icc,	%o7,	%l0
	array16	%i7,	%g3,	%g4
	and	%o4,	%o1,	%g7
	umulcc	%l3,	0x0C53,	%g2
	addccc	%o5,	%i3,	%o2
	xor	%i0,	%l1,	%o6
	subcc	%g5,	%i5,	%l6
	umul	%o3,	0x08D2,	%g1
	andncc	%i4,	%i6,	%l2
	edge8l	%o0,	%l4,	%i2
	edge16ln	%g6,	%i1,	%l5
	fmovdpos	%xcc,	%f23,	%f2
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	andcc	%g3,	%l0,	%g4
	andn	%o4,	0x1686,	%o1
	movcs	%icc,	%g7,	%l3
	movg	%xcc,	%o5,	%g2
	sethi	0x0CF8,	%o2
	edge8l	%i3,	%l1,	%i0
	ld	[%l7 + 0x20],	%f24
	edge32ln	%g5,	%o6,	%i5
	sll	%o3,	%g1,	%i4
	movg	%icc,	%l6,	%i6
	fmovrse	%o0,	%f14,	%f13
	fabsd	%f4,	%f28
	sdivx	%l2,	0x027C,	%i2
	st	%f7,	[%l7 + 0x6C]
	ldsw	[%l7 + 0x24],	%l4
	movpos	%xcc,	%i1,	%l5
	edge32ln	%g6,	%o7,	%i7
	xorcc	%g3,	%g4,	%o4
	andncc	%l0,	%g7,	%o1
	addc	%l3,	%o5,	%o2
	subcc	%g2,	%i3,	%i0
	movcs	%icc,	%l1,	%o6
	umul	%i5,	0x1C78,	%o3
	and	%g5,	0x1D38,	%i4
	sdiv	%l6,	0x199D,	%g1
	fandnot2	%f10,	%f18,	%f18
	sdivx	%o0,	0x0A4B,	%l2
	movvs	%xcc,	%i6,	%i2
	udivx	%l4,	0x1CC8,	%l5
	nop
	set	0x70, %i2
	ldub	[%l7 + %i2],	%i1
	fnot2s	%f0,	%f22
	fcmpeq32	%f28,	%f24,	%g6
	sll	%i7,	%g3,	%o7
	srlx	%o4,	%g4,	%l0
	addc	%g7,	0x1DA8,	%o1
	edge8l	%l3,	%o5,	%g2
	movre	%i3,	%i0,	%o2
	movne	%icc,	%o6,	%i5
	sethi	0x15A6,	%l1
	fnors	%f27,	%f15,	%f15
	movre	%g5,	%o3,	%l6
	orcc	%g1,	0x09A5,	%i4
	alignaddr	%o0,	%l2,	%i2
	sub	%l4,	0x14D2,	%l5
	movleu	%xcc,	%i6,	%i1
	srax	%g6,	%i7,	%o7
	andn	%o4,	0x1B4F,	%g3
	movne	%xcc,	%g4,	%g7
	fmovd	%f14,	%f2
	fmul8x16al	%f4,	%f15,	%f6
	bshuffle	%f2,	%f16,	%f20
	edge16n	%o1,	%l0,	%l3
	xorcc	%o5,	%g2,	%i0
	ld	[%l7 + 0x78],	%f26
	mulscc	%o2,	0x1A7F,	%i3
	movvs	%xcc,	%i5,	%l1
	fsrc2s	%f9,	%f27
	movg	%xcc,	%o6,	%o3
	alignaddr	%g5,	%l6,	%i4
	srlx	%o0,	%g1,	%i2
	fpadd16s	%f28,	%f8,	%f14
	fandnot1	%f18,	%f20,	%f4
	edge32ln	%l4,	%l2,	%i6
	movleu	%xcc,	%l5,	%i1
	movpos	%xcc,	%i7,	%o7
	stx	%g6,	[%l7 + 0x70]
	subc	%o4,	%g3,	%g7
	ldub	[%l7 + 0x44],	%o1
	movrlz	%l0,	0x3F0,	%g4
	andncc	%o5,	%l3,	%g2
	fzero	%f26
	save %o2, %i0, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f9,	%f12,	%f6
	movcc	%xcc,	%i5,	%o6
	pdist	%f20,	%f16,	%f8
	fcmpes	%fcc0,	%f13,	%f7
	fmovrsgez	%l1,	%f31,	%f23
	edge16l	%g5,	%o3,	%i4
	srax	%o0,	0x0D,	%l6
	subc	%g1,	0x150D,	%l4
	addc	%l2,	%i6,	%l5
	add	%i1,	0x1BEC,	%i7
	andncc	%o7,	%i2,	%g6
	add	%o4,	%g3,	%o1
	movneg	%xcc,	%l0,	%g7
	nop
	set	0x48, %i5
	stx	%o5,	[%l7 + %i5]
	edge16	%g4,	%g2,	%l3
	movrlez	%o2,	0x12C,	%i0
	movle	%icc,	%i3,	%o6
	sethi	0x10B5,	%i5
	ldd	[%l7 + 0x50],	%f24
	edge16n	%l1,	%g5,	%o3
	fpsub16	%f4,	%f8,	%f4
	movg	%icc,	%i4,	%o0
	nop
	set	0x72, %l5
	sth	%g1,	[%l7 + %l5]
	xnorcc	%l4,	0x177F,	%l2
	xnor	%l6,	0x12B8,	%l5
	movn	%xcc,	%i6,	%i7
	srlx	%i1,	%o7,	%i2
	or	%g6,	%o4,	%o1
	fmovdleu	%xcc,	%f10,	%f18
	movcc	%icc,	%l0,	%g7
	edge8ln	%g3,	%o5,	%g2
	edge32ln	%l3,	%g4,	%o2
	mova	%xcc,	%i0,	%i3
	fmovspos	%icc,	%f13,	%f15
	movvc	%icc,	%o6,	%l1
	fpack32	%f20,	%f22,	%f10
	fmovsne	%xcc,	%f22,	%f15
	orn	%i5,	0x1780,	%g5
	fandnot2	%f24,	%f22,	%f2
	fnors	%f31,	%f9,	%f25
	fmovsne	%icc,	%f2,	%f9
	st	%f9,	[%l7 + 0x30]
	or	%i4,	%o3,	%g1
	movle	%xcc,	%l4,	%l2
	udivcc	%l6,	0x0E6A,	%o0
	movrlez	%l5,	0x101,	%i6
	fnor	%f8,	%f30,	%f18
	fxnors	%f2,	%f3,	%f11
	smulcc	%i1,	%i7,	%i2
	nop
	set	0x6C, %o2
	lduw	[%l7 + %o2],	%g6
	subcc	%o7,	0x0F94,	%o1
	st	%f28,	[%l7 + 0x60]
	fxnor	%f28,	%f0,	%f2
	subcc	%o4,	%g7,	%g3
	move	%icc,	%l0,	%g2
	array32	%o5,	%g4,	%o2
	ldsh	[%l7 + 0x50],	%l3
	for	%f18,	%f2,	%f18
	alignaddrl	%i0,	%i3,	%l1
	and	%i5,	%o6,	%g5
	sub	%o3,	0x1465,	%g1
	udiv	%l4,	0x1778,	%i4
	edge16n	%l6,	%l2,	%o0
	movpos	%xcc,	%l5,	%i6
	addcc	%i1,	0x1BF8,	%i2
	movrgez	%i7,	%g6,	%o1
	ldd	[%l7 + 0x68],	%o4
	edge16ln	%o7,	%g3,	%l0
	array8	%g7,	%o5,	%g4
	fmovdneg	%xcc,	%f29,	%f20
	movcs	%icc,	%o2,	%g2
	srl	%l3,	0x0A,	%i0
	edge16l	%l1,	%i5,	%o6
	movcs	%icc,	%i3,	%o3
	fmovdg	%xcc,	%f13,	%f1
	add	%g1,	%g5,	%i4
	ld	[%l7 + 0x78],	%f11
	ldx	[%l7 + 0x18],	%l4
	stx	%l6,	[%l7 + 0x50]
	xnor	%o0,	0x088E,	%l2
	movrlez	%l5,	0x24C,	%i1
	bshuffle	%f24,	%f30,	%f12
	fcmpes	%fcc1,	%f26,	%f8
	mulx	%i2,	%i6,	%g6
	edge16l	%i7,	%o1,	%o7
	movvs	%xcc,	%g3,	%l0
	ldsb	[%l7 + 0x3F],	%g7
	lduh	[%l7 + 0x7C],	%o4
	fnor	%f8,	%f2,	%f30
	sir	0x1777
	andcc	%g4,	%o2,	%o5
	smul	%g2,	%i0,	%l1
	fmovscs	%xcc,	%f5,	%f19
	subc	%i5,	%l3,	%i3
	fabsd	%f10,	%f2
	sdivx	%o6,	0x0FF4,	%g1
	edge8	%g5,	%i4,	%l4
	sth	%l6,	[%l7 + 0x4C]
	movcc	%icc,	%o0,	%l2
	umul	%l5,	0x0AA8,	%o3
	fcmps	%fcc1,	%f5,	%f23
	st	%f31,	[%l7 + 0x2C]
	movge	%xcc,	%i2,	%i6
	fcmpgt32	%f6,	%f26,	%i1
	fxnor	%f18,	%f20,	%f10
	popc	0x09DB,	%i7
	or	%g6,	0x0BDB,	%o1
	movrlz	%g3,	%l0,	%g7
	pdist	%f20,	%f22,	%f4
	stb	%o4,	[%l7 + 0x59]
	andn	%o7,	0x1699,	%o2
	movpos	%icc,	%g4,	%g2
	fsrc1s	%f20,	%f27
	andncc	%o5,	%i0,	%l1
	stb	%l3,	[%l7 + 0x78]
	lduh	[%l7 + 0x12],	%i5
	mulscc	%i3,	%o6,	%g1
	ldx	[%l7 + 0x20],	%i4
	fmovsleu	%icc,	%f13,	%f8
	umul	%g5,	%l6,	%o0
	std	%f18,	[%l7 + 0x38]
	stb	%l4,	[%l7 + 0x3C]
	movrgez	%l5,	%o3,	%i2
	edge32ln	%l2,	%i1,	%i7
	ldub	[%l7 + 0x51],	%i6
	fmul8sux16	%f2,	%f2,	%f2
	ldsw	[%l7 + 0x30],	%o1
	fmovda	%xcc,	%f14,	%f24
	add	%g6,	%g3,	%g7
	movrgz	%o4,	0x36A,	%o7
	sll	%o2,	%l0,	%g4
	fcmpne16	%f4,	%f12,	%g2
	movpos	%icc,	%i0,	%l1
	movl	%xcc,	%l3,	%i5
	fmovs	%f16,	%f7
	movl	%xcc,	%o5,	%i3
	fmovsn	%xcc,	%f23,	%f5
	edge16n	%g1,	%i4,	%o6
	sra	%l6,	%o0,	%g5
	fcmpne32	%f8,	%f10,	%l4
	fnot2	%f8,	%f16
	alignaddr	%l5,	%o3,	%l2
	st	%f13,	[%l7 + 0x4C]
	movg	%icc,	%i2,	%i1
	sllx	%i6,	0x1E,	%o1
	xnor	%g6,	%g3,	%g7
	sdivcc	%o4,	0x1942,	%i7
	popc	0x08DA,	%o2
	umulcc	%o7,	0x0D13,	%l0
	fandnot1	%f6,	%f28,	%f0
	edge8	%g4,	%i0,	%g2
	movne	%icc,	%l1,	%i5
	sub	%o5,	%i3,	%g1
	stw	%l3,	[%l7 + 0x60]
	mulx	%o6,	0x0DC7,	%l6
	sub	%i4,	0x1F23,	%g5
	fands	%f27,	%f16,	%f1
	ldub	[%l7 + 0x62],	%l4
	array32	%l5,	%o0,	%o3
	sth	%l2,	[%l7 + 0x14]
	addcc	%i2,	0x19DF,	%i6
	ldd	[%l7 + 0x70],	%f2
	udivcc	%i1,	0x0920,	%o1
	edge32ln	%g6,	%g7,	%g3
	mova	%xcc,	%i7,	%o4
	subcc	%o2,	0x00CC,	%o7
	fmovspos	%icc,	%f8,	%f19
	movcc	%xcc,	%g4,	%i0
	movneg	%icc,	%g2,	%l1
	movrlez	%i5,	%l0,	%i3
	alignaddr	%o5,	%l3,	%g1
	edge16ln	%l6,	%o6,	%g5
	fcmpes	%fcc2,	%f13,	%f9
	restore %i4, 0x1F32, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l4,	%o3,	%l2
	std	%f16,	[%l7 + 0x18]
	edge32	%i2,	%i6,	%o0
	edge16l	%i1,	%g6,	%o1
	movn	%xcc,	%g7,	%i7
	movpos	%icc,	%o4,	%o2
	fandnot2	%f12,	%f12,	%f20
	sub	%g3,	%o7,	%g4
	edge8ln	%g2,	%l1,	%i0
	addcc	%i5,	%l0,	%o5
	ldub	[%l7 + 0x46],	%l3
	movvc	%xcc,	%i3,	%g1
	xor	%o6,	0x1DC3,	%g5
	movgu	%icc,	%i4,	%l6
	fands	%f13,	%f31,	%f19
	orncc	%l5,	%o3,	%l2
	umul	%l4,	0x0144,	%i2
	andn	%o0,	0x0C03,	%i1
	alignaddr	%i6,	%o1,	%g6
	st	%f8,	[%l7 + 0x60]
	lduw	[%l7 + 0x44],	%i7
	nop
	set	0x6C, %g7
	ldub	[%l7 + %g7],	%g7
	movge	%icc,	%o2,	%g3
	move	%icc,	%o7,	%g4
	array16	%g2,	%l1,	%o4
	movrgz	%i0,	0x116,	%i5
	fcmple32	%f20,	%f16,	%o5
	movrgez	%l0,	%i3,	%l3
	lduh	[%l7 + 0x20],	%o6
	fcmpeq32	%f14,	%f22,	%g1
	edge8n	%i4,	%g5,	%l5
	movrlez	%l6,	%l2,	%l4
	subc	%o3,	%o0,	%i1
	fcmped	%fcc0,	%f24,	%f6
	movcc	%xcc,	%i6,	%i2
	fmul8x16	%f3,	%f20,	%f20
	andncc	%g6,	%i7,	%g7
	movle	%xcc,	%o2,	%g3
	for	%f14,	%f0,	%f18
	edge32n	%o7,	%o1,	%g4
	alignaddr	%l1,	%g2,	%i0
	subcc	%i5,	%o5,	%l0
	sethi	0x00E7,	%i3
	fmovspos	%xcc,	%f1,	%f2
	lduw	[%l7 + 0x70],	%l3
	addccc	%o4,	%g1,	%i4
	mulscc	%o6,	%g5,	%l5
	and	%l2,	%l4,	%l6
	or	%o3,	%i1,	%i6
	movl	%icc,	%o0,	%i2
	movn	%icc,	%i7,	%g7
	movge	%icc,	%o2,	%g3
	fmovdcs	%xcc,	%f30,	%f11
	array16	%g6,	%o1,	%o7
	xor	%g4,	%g2,	%i0
	or	%i5,	0x088E,	%l1
	movn	%xcc,	%l0,	%o5
	stb	%l3,	[%l7 + 0x41]
	fmovsle	%icc,	%f20,	%f14
	popc	%o4,	%g1
	for	%f26,	%f24,	%f8
	array32	%i4,	%o6,	%i3
	edge16	%g5,	%l2,	%l4
	edge16n	%l5,	%l6,	%i1
	subc	%o3,	%o0,	%i6
	sethi	0x05FB,	%i7
	fmul8x16al	%f20,	%f21,	%f18
	movge	%icc,	%g7,	%i2
	movrlz	%o2,	0x2E7,	%g3
	fcmpeq16	%f12,	%f28,	%g6
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%o6
	mova	%xcc,	%o1,	%g2
	fone	%f14
	edge8n	%i0,	%i5,	%g4
	edge32l	%l0,	%o5,	%l3
	movleu	%xcc,	%o4,	%g1
	edge32n	%i4,	%o6,	%i3
	sub	%l1,	%l2,	%l4
	movn	%xcc,	%g5,	%l5
	movrgez	%i1,	0x1FF,	%o3
	lduh	[%l7 + 0x4A],	%l6
	movne	%xcc,	%i6,	%o0
	sth	%g7,	[%l7 + 0x76]
	fmovde	%xcc,	%f4,	%f4
	or	%i7,	0x000D,	%o2
	fmovscs	%xcc,	%f29,	%f16
	edge16l	%i2,	%g6,	%g3
	fmovrdgz	%o7,	%f12,	%f22
	fmovrdgz	%g2,	%f10,	%f6
	sra	%o1,	0x19,	%i0
	sllx	%g4,	0x0D,	%l0
	ldub	[%l7 + 0x3C],	%o5
	xorcc	%l3,	%i5,	%g1
	andn	%o4,	0x1BAE,	%o6
	stb	%i3,	[%l7 + 0x5E]
	mova	%xcc,	%i4,	%l1
	ldd	[%l7 + 0x50],	%l2
	fmovsvs	%icc,	%f3,	%f18
	movneg	%xcc,	%g5,	%l5
	srl	%i1,	0x02,	%o3
	fmovrdgz	%l6,	%f14,	%f16
	fmovda	%icc,	%f3,	%f12
	fmovda	%icc,	%f3,	%f6
	fsrc1s	%f30,	%f12
	fmuld8sux16	%f25,	%f28,	%f28
	movcc	%xcc,	%i6,	%o0
	fpsub32s	%f2,	%f21,	%f28
	sdivx	%l4,	0x07E2,	%i7
	array16	%o2,	%i2,	%g7
	edge16n	%g3,	%g6,	%o7
	movl	%icc,	%o1,	%i0
	udivx	%g2,	0x148A,	%l0
	edge16n	%o5,	%l3,	%i5
	movpos	%xcc,	%g4,	%o4
	fmovscs	%xcc,	%f23,	%f5
	fmul8sux16	%f4,	%f26,	%f28
	lduh	[%l7 + 0x18],	%g1
	fmovdvc	%icc,	%f11,	%f6
	or	%i3,	0x0068,	%o6
	fands	%f14,	%f31,	%f17
	mova	%icc,	%i4,	%l2
	movrlz	%l1,	%g5,	%l5
	movrne	%i1,	%o3,	%i6
	edge8n	%l6,	%l4,	%o0
	addcc	%o2,	0x016C,	%i7
	movpos	%icc,	%g7,	%g3
	save %i2, 0x1ECF, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x24],	%o1
	umul	%g6,	0x1578,	%i0
	addccc	%l0,	%o5,	%g2
	edge16n	%i5,	%l3,	%g4
	fcmps	%fcc0,	%f24,	%f28
	popc	0x1C98,	%g1
	movrgz	%i3,	0x0C9,	%o6
	edge16n	%i4,	%l2,	%o4
	umul	%g5,	%l5,	%i1
	nop
	set	0x48, %g5
	stx	%o3,	[%l7 + %g5]
	edge16	%l1,	%l6,	%l4
	addccc	%o0,	0x0CA9,	%o2
	sllx	%i6,	0x04,	%g7
	movleu	%icc,	%g3,	%i2
	edge8ln	%o7,	%o1,	%g6
	edge32ln	%i0,	%l0,	%o5
	addcc	%i7,	0x1F72,	%g2
	movn	%xcc,	%i5,	%l3
	movrgz	%g1,	%i3,	%o6
	movgu	%icc,	%g4,	%l2
	fsrc2	%f10,	%f16
	umulcc	%o4,	0x0DBE,	%i4
	movcc	%xcc,	%g5,	%i1
	sllx	%o3,	%l1,	%l5
	edge8l	%l4,	%o0,	%o2
	movre	%l6,	%g7,	%g3
	stx	%i6,	[%l7 + 0x20]
	fandnot1	%f6,	%f2,	%f18
	movrlz	%i2,	%o1,	%o7
	srax	%g6,	0x0E,	%l0
	edge8ln	%i0,	%o5,	%g2
	ldsw	[%l7 + 0x7C],	%i5
	fandnot2s	%f29,	%f9,	%f6
	umulcc	%i7,	%l3,	%i3
	xnorcc	%o6,	0x06C9,	%g4
	ldub	[%l7 + 0x36],	%l2
	movrlez	%o4,	0x35E,	%g1
	smul	%g5,	0x0046,	%i4
	fcmpne16	%f6,	%f22,	%i1
	fsrc1s	%f30,	%f23
	movge	%icc,	%l1,	%l5
	edge16n	%o3,	%o0,	%l4
	stx	%l6,	[%l7 + 0x28]
	subc	%o2,	%g7,	%g3
	smulcc	%i6,	%i2,	%o1
	movg	%xcc,	%o7,	%l0
	sir	0x020C
	fmovse	%icc,	%f26,	%f5
	fmovdcc	%xcc,	%f18,	%f16
	movneg	%xcc,	%i0,	%o5
	movcc	%xcc,	%g2,	%g6
	array8	%i7,	%i5,	%i3
	mulscc	%o6,	%g4,	%l3
	mova	%xcc,	%l2,	%g1
	srax	%g5,	0x0A,	%i4
	srl	%o4,	0x1C,	%l1
	fpsub32	%f8,	%f14,	%f10
	sth	%i1,	[%l7 + 0x24]
	fmovsn	%xcc,	%f25,	%f9
	sir	0x0C61
	movpos	%icc,	%l5,	%o3
	edge32n	%l4,	%l6,	%o0
	fmovdcs	%icc,	%f10,	%f2
	fpadd16s	%f3,	%f22,	%f31
	array32	%o2,	%g3,	%g7
	udiv	%i6,	0x1D64,	%i2
	orncc	%o7,	0x092C,	%o1
	array16	%i0,	%o5,	%g2
	add	%l0,	0x0AC5,	%i7
	sdiv	%g6,	0x0F3C,	%i3
	fmovdle	%icc,	%f20,	%f29
	umulcc	%o6,	%g4,	%i5
	udiv	%l3,	0x04A1,	%g1
	sethi	0x172B,	%g5
	addcc	%l2,	0x0A64,	%i4
	movrne	%o4,	0x3C2,	%i1
	edge8ln	%l5,	%l1,	%l4
	ldx	[%l7 + 0x20],	%o3
	edge8	%o0,	%l6,	%o2
	array16	%g3,	%i6,	%i2
	fmovrdlez	%o7,	%f6,	%f18
	fnot1s	%f30,	%f7
	sdivx	%g7,	0x1C6D,	%o1
	fmovrdlez	%i0,	%f30,	%f20
	sethi	0x0376,	%o5
	ldub	[%l7 + 0x44],	%g2
	addccc	%l0,	0x12A9,	%g6
	nop
	set	0x2C, %o6
	stw	%i3,	[%l7 + %o6]
	movge	%xcc,	%o6,	%g4
	srlx	%i5,	0x03,	%l3
	ldsb	[%l7 + 0x6D],	%g1
	ldsb	[%l7 + 0x14],	%i7
	movleu	%icc,	%l2,	%g5
	fpmerge	%f0,	%f16,	%f14
	fmul8x16al	%f28,	%f10,	%f28
	addccc	%o4,	0x18BB,	%i1
	movleu	%icc,	%i4,	%l1
	xnorcc	%l4,	0x1E72,	%l5
	movvs	%icc,	%o0,	%o3
	edge32ln	%o2,	%l6,	%g3
	movge	%icc,	%i6,	%i2
	edge32ln	%g7,	%o1,	%o7
	fmovdcs	%icc,	%f27,	%f21
	edge16	%i0,	%o5,	%g2
	addcc	%g6,	%i3,	%l0
	alignaddr	%o6,	%g4,	%l3
	movneg	%xcc,	%i5,	%i7
	umulcc	%l2,	%g1,	%o4
	edge32n	%i1,	%g5,	%i4
	sir	0x0856
	orcc	%l4,	0x0F45,	%l5
	xorcc	%o0,	0x0679,	%o3
	fcmpeq16	%f10,	%f16,	%l1
	smul	%o2,	0x0DF1,	%g3
	stw	%l6,	[%l7 + 0x2C]
	movne	%icc,	%i2,	%i6
	edge8ln	%o1,	%g7,	%i0
	andcc	%o7,	0x1D40,	%o5
	fnot1	%f28,	%f22
	movrlz	%g2,	%g6,	%i3
	fnegs	%f22,	%f30
	udivcc	%l0,	0x0FE9,	%g4
	ldsb	[%l7 + 0x17],	%o6
	andcc	%i5,	0x142C,	%l3
	fornot2	%f28,	%f20,	%f22
	edge32n	%i7,	%g1,	%l2
	edge32n	%i1,	%o4,	%g5
	ldsw	[%l7 + 0x48],	%l4
	fands	%f2,	%f17,	%f14
	movcs	%icc,	%i4,	%o0
	srlx	%o3,	0x17,	%l5
	edge8ln	%o2,	%l1,	%l6
	movcs	%xcc,	%g3,	%i2
	edge8	%o1,	%i6,	%g7
	fmovsne	%xcc,	%f25,	%f19
	andncc	%i0,	%o5,	%o7
	smulcc	%g6,	%g2,	%l0
	orncc	%g4,	%i3,	%o6
	fnot1s	%f3,	%f1
	movn	%xcc,	%i5,	%l3
	sdivx	%g1,	0x0747,	%i7
	edge8l	%l2,	%o4,	%g5
	movg	%icc,	%l4,	%i4
	movrgz	%o0,	%o3,	%l5
	sth	%o2,	[%l7 + 0x64]
	xorcc	%l1,	%l6,	%i1
	nop
	set	0x68, %g4
	std	%f8,	[%l7 + %g4]
	fcmple16	%f4,	%f8,	%i2
	fcmpne32	%f12,	%f20,	%o1
	fnands	%f30,	%f31,	%f17
	subc	%i6,	%g7,	%i0
	fpadd16	%f4,	%f20,	%f6
	mulx	%g3,	0x1B1C,	%o7
	lduh	[%l7 + 0x6A],	%o5
	movrgz	%g6,	0x37B,	%l0
	fmovdn	%icc,	%f24,	%f28
	movleu	%xcc,	%g4,	%i3
	fmovspos	%xcc,	%f13,	%f7
	orcc	%o6,	%g2,	%l3
	faligndata	%f24,	%f26,	%f28
	fabss	%f30,	%f31
	orn	%g1,	0x00C5,	%i7
	ldsb	[%l7 + 0x70],	%l2
	srlx	%o4,	0x10,	%g5
	srax	%l4,	0x1E,	%i4
	movgu	%xcc,	%o0,	%o3
	edge16	%l5,	%i5,	%l1
	fcmpne16	%f4,	%f0,	%o2
	movrlez	%l6,	%i2,	%i1
	lduw	[%l7 + 0x48],	%o1
	fpsub16	%f22,	%f30,	%f26
	movvc	%xcc,	%g7,	%i0
	st	%f18,	[%l7 + 0x10]
	movgu	%xcc,	%i6,	%g3
	fmovse	%xcc,	%f14,	%f30
	edge8l	%o5,	%g6,	%l0
	nop
	set	0x15, %i7
	ldsb	[%l7 + %i7],	%o7
	sub	%g4,	0x09A2,	%o6
	sub	%i3,	0x0855,	%g2
	fsrc2s	%f0,	%f24
	popc	%g1,	%i7
	movg	%xcc,	%l2,	%o4
	sir	0x1174
	movcc	%icc,	%l3,	%l4
	xorcc	%i4,	%g5,	%o0
	fmovsvc	%icc,	%f2,	%f8
	movrlez	%l5,	0x2F4,	%o3
	edge8l	%l1,	%i5,	%l6
	edge16n	%i2,	%i1,	%o1
	sdiv	%o2,	0x19F6,	%g7
	add	%i6,	0x1701,	%i0
	udivx	%g3,	0x059F,	%o5
	sir	0x19F4
	movrgez	%g6,	%o7,	%l0
	sethi	0x18AB,	%g4
	fabsd	%f20,	%f22
	sdivcc	%o6,	0x1392,	%i3
	fand	%f18,	%f30,	%f18
	addccc	%g1,	%i7,	%g2
	sllx	%o4,	%l3,	%l4
	array16	%i4,	%l2,	%g5
	movleu	%xcc,	%o0,	%l5
	movgu	%xcc,	%o3,	%i5
	fmovrsgez	%l6,	%f26,	%f26
	movcc	%icc,	%l1,	%i2
	sdiv	%o1,	0x04B6,	%i1
	lduw	[%l7 + 0x2C],	%o2
	movneg	%xcc,	%i6,	%g7
	udivcc	%i0,	0x0885,	%g3
	popc	%g6,	%o5
	edge8n	%o7,	%g4,	%l0
	umul	%o6,	%i3,	%i7
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	edge8ln	%o4,	%l3,	%l4
	movcs	%xcc,	%i4,	%l2
	movvc	%icc,	%g5,	%l5
	movne	%icc,	%o3,	%o0
	movvc	%icc,	%i5,	%l6
	fnands	%f12,	%f15,	%f22
	smulcc	%l1,	%o1,	%i2
	movn	%icc,	%i1,	%o2
	ld	[%l7 + 0x34],	%f0
	fmovsleu	%xcc,	%f14,	%f17
	subccc	%g7,	%i6,	%g3
	udivcc	%i0,	0x0049,	%g6
	move	%icc,	%o5,	%g4
	movge	%icc,	%l0,	%o7
	mova	%xcc,	%i3,	%o6
	fmovrslez	%i7,	%f9,	%f13
	fand	%f26,	%f0,	%f30
	srlx	%g1,	%g2,	%l3
	movg	%icc,	%l4,	%o4
	fmovscc	%xcc,	%f6,	%f30
	sra	%i4,	0x1E,	%l2
	fmovsl	%icc,	%f8,	%f23
	mulscc	%l5,	0x17BA,	%g5
	edge8l	%o3,	%o0,	%i5
	ldsb	[%l7 + 0x23],	%l6
	andn	%o1,	%i2,	%l1
	ld	[%l7 + 0x64],	%f31
	fsrc1s	%f31,	%f23
	smul	%i1,	0x147B,	%g7
	ldsw	[%l7 + 0x14],	%o2
	movrlz	%i6,	%g3,	%i0
	srlx	%o5,	0x1F,	%g4
	smul	%l0,	%o7,	%g6
	fornot2	%f22,	%f16,	%f10
	stw	%o6,	[%l7 + 0x28]
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%f22
	movrne	%i3,	%g1,	%g2
	faligndata	%f10,	%f2,	%f10
	ld	[%l7 + 0x64],	%f5
	movrlez	%i7,	0x00F,	%l4
	fmovrslez	%l3,	%f2,	%f11
	edge32n	%i4,	%l2,	%o4
	sdivcc	%l5,	0x0B83,	%o3
	sub	%g5,	%o0,	%l6
	srlx	%i5,	%i2,	%l1
	fcmpeq32	%f16,	%f30,	%i1
	sdiv	%o1,	0x1A24,	%g7
	fmovsge	%xcc,	%f15,	%f15
	movneg	%icc,	%o2,	%g3
	orcc	%i6,	%o5,	%i0
	umul	%g4,	%o7,	%l0
	movcc	%icc,	%g6,	%i3
	subc	%g1,	%o6,	%i7
	sdiv	%g2,	0x01E5,	%l4
	save %l3, 0x0C90, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o4,	0x1D74,	%l2
	popc	0x0AEB,	%o3
	edge8ln	%g5,	%o0,	%l5
	umulcc	%l6,	%i2,	%i5
	stb	%l1,	[%l7 + 0x30]
	subcc	%o1,	0x1EAA,	%g7
	edge8n	%i1,	%o2,	%g3
	movrlez	%i6,	%i0,	%g4
	fzero	%f26
	fmul8ulx16	%f2,	%f30,	%f8
	fcmpgt32	%f24,	%f2,	%o5
	edge8l	%o7,	%g6,	%l0
	fmovrslz	%g1,	%f11,	%f14
	movge	%icc,	%i3,	%i7
	fmovrslz	%g2,	%f0,	%f26
	umul	%l4,	0x06FE,	%l3
	stw	%o6,	[%l7 + 0x60]
	andn	%i4,	%l2,	%o4
	addcc	%o3,	0x07B1,	%o0
	fornot1s	%f24,	%f3,	%f3
	ldsb	[%l7 + 0x79],	%g5
	ldsh	[%l7 + 0x34],	%l5
	movl	%xcc,	%i2,	%i5
	save %l6, %l1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i1,	0x00,	%o1
	move	%xcc,	%o2,	%g3
	xorcc	%i6,	%i0,	%o5
	sth	%o7,	[%l7 + 0x7A]
	orncc	%g4,	0x070C,	%g6
	fcmple16	%f6,	%f28,	%l0
	sub	%g1,	0x0C58,	%i7
	srlx	%i3,	0x02,	%g2
	edge32	%l4,	%o6,	%i4
	addc	%l3,	0x11EA,	%l2
	movrne	%o4,	%o3,	%g5
	ldsh	[%l7 + 0x08],	%o0
	edge32l	%l5,	%i5,	%l6
	udiv	%l1,	0x1644,	%i2
	edge8n	%g7,	%i1,	%o2
	fcmpgt32	%f4,	%f24,	%g3
	sll	%i6,	0x1D,	%o1
	xorcc	%i0,	0x0390,	%o7
	edge32l	%g4,	%g6,	%l0
	fmovrdlez	%o5,	%f26,	%f26
	orncc	%g1,	0x03F8,	%i3
	edge32n	%g2,	%i7,	%o6
	bshuffle	%f16,	%f26,	%f8
	movrlz	%l4,	0x380,	%i4
	ldsw	[%l7 + 0x6C],	%l2
	edge16ln	%l3,	%o3,	%o4
	mulscc	%o0,	0x1775,	%g5
	movg	%xcc,	%i5,	%l6
	fzeros	%f15
	sethi	0x0142,	%l1
	movrne	%l5,	0x140,	%i2
	ldd	[%l7 + 0x78],	%f22
	nop
	set	0x60, %g3
	ldd	[%l7 + %g3],	%f12
	sdiv	%g7,	0x1C29,	%o2
	udivx	%i1,	0x1494,	%g3
	edge16	%o1,	%i0,	%o7
	movle	%xcc,	%i6,	%g4
	movrlez	%g6,	%o5,	%g1
	subccc	%i3,	0x17F1,	%g2
	movcc	%xcc,	%l0,	%i7
	movvs	%xcc,	%o6,	%l4
	sth	%i4,	[%l7 + 0x62]
	edge16l	%l3,	%o3,	%o4
	udiv	%l2,	0x0AC9,	%o0
	edge16n	%g5,	%i5,	%l1
	andcc	%l6,	%i2,	%l5
	movge	%xcc,	%o2,	%g7
	edge16n	%i1,	%g3,	%i0
	stb	%o7,	[%l7 + 0x57]
	array8	%o1,	%i6,	%g4
	orcc	%o5,	0x0815,	%g1
	movg	%icc,	%i3,	%g2
	movrlz	%g6,	0x002,	%l0
	sir	0x1F2C
	smulcc	%i7,	0x1193,	%l4
	fmovrde	%o6,	%f28,	%f22
	edge8n	%i4,	%o3,	%o4
	andncc	%l2,	%l3,	%g5
	edge16l	%i5,	%o0,	%l1
	sir	0x0335
	movg	%icc,	%i2,	%l6
	sra	%o2,	%g7,	%i1
	ldd	[%l7 + 0x50],	%g2
	movrgz	%i0,	%l5,	%o7
	lduh	[%l7 + 0x0E],	%o1
	fmuld8sux16	%f31,	%f6,	%f28
	fmul8ulx16	%f18,	%f28,	%f4
	add	%g4,	%i6,	%g1
	fmovrslz	%i3,	%f7,	%f9
	ldsh	[%l7 + 0x38],	%g2
	save %o5, 0x0757, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i7,	[%l7 + 0x5A]
	ldx	[%l7 + 0x08],	%g6
	array32	%l4,	%o6,	%o3
	fcmpne16	%f8,	%f4,	%o4
	edge16l	%i4,	%l3,	%g5
	edge16l	%l2,	%i5,	%l1
	movge	%icc,	%o0,	%l6
	andcc	%i2,	0x1AD7,	%g7
	fpackfix	%f6,	%f6
	movrlz	%i1,	0x094,	%g3
	fmovspos	%xcc,	%f28,	%f6
	sir	0x1C67
	fmovrdlz	%i0,	%f16,	%f4
	movrgz	%l5,	%o7,	%o2
	add	%o1,	%g4,	%g1
	andn	%i6,	%g2,	%i3
	movle	%xcc,	%l0,	%i7
	fmovrde	%g6,	%f8,	%f4
	fmovdpos	%icc,	%f20,	%f18
	fsrc2s	%f13,	%f29
	smul	%l4,	0x085A,	%o6
	srlx	%o5,	%o3,	%o4
	restore %l3, %i4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g5,	0x0AFA,	%l1
	movrgez	%o0,	0x067,	%l6
	sub	%i2,	%g7,	%i1
	fmovdneg	%xcc,	%f6,	%f1
	edge32n	%g3,	%i5,	%i0
	array8	%l5,	%o7,	%o2
	move	%xcc,	%g4,	%o1
	andncc	%i6,	%g1,	%g2
	fors	%f12,	%f18,	%f29
	edge32l	%i3,	%i7,	%g6
	popc	%l0,	%l4
	ldsw	[%l7 + 0x20],	%o5
	nop
	set	0x2B, %i6
	ldub	[%l7 + %i6],	%o6
	addc	%o3,	0x1778,	%l3
	fcmpeq16	%f14,	%f16,	%i4
	alignaddrl	%o4,	%l2,	%l1
	edge8l	%g5,	%l6,	%o0
	save %g7, %i2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i5,	%i0,	%l5
	ldd	[%l7 + 0x50],	%f12
	move	%icc,	%o7,	%g3
	save %o2, %o1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i6,	0x0CAD,	%g1
	srax	%i3,	%g2,	%g6
	sdiv	%i7,	0x1BC1,	%l0
	ld	[%l7 + 0x60],	%f21
	xor	%o5,	%o6,	%l4
	addc	%o3,	%l3,	%i4
	ldd	[%l7 + 0x18],	%f20
	smul	%l2,	%o4,	%l1
	subccc	%l6,	%o0,	%g5
	movcc	%icc,	%g7,	%i2
	fxnors	%f15,	%f21,	%f11
	fmovrdlez	%i1,	%f24,	%f12
	andcc	%i5,	0x0BE4,	%l5
	fmovrdgz	%o7,	%f10,	%f12
	movleu	%xcc,	%i0,	%g3
	smulcc	%o1,	%o2,	%g4
	movrne	%i6,	%i3,	%g2
	stx	%g6,	[%l7 + 0x08]
	movrgez	%i7,	0x2F1,	%l0
	udiv	%g1,	0x1613,	%o5
	lduh	[%l7 + 0x2C],	%l4
	sth	%o3,	[%l7 + 0x72]
	alignaddrl	%l3,	%o6,	%i4
	fmovdge	%xcc,	%f23,	%f18
	movle	%icc,	%o4,	%l2
	edge8n	%l6,	%l1,	%o0
	fandnot1	%f12,	%f28,	%f10
	sll	%g5,	0x17,	%i2
	movrgez	%i1,	0x3C9,	%g7
	movre	%l5,	%i5,	%o7
	edge16ln	%i0,	%g3,	%o1
	edge8n	%g4,	%i6,	%i3
	smulcc	%o2,	%g6,	%i7
	edge8ln	%g2,	%g1,	%l0
	edge32	%l4,	%o3,	%l3
	umul	%o6,	%o5,	%o4
	edge16ln	%i4,	%l2,	%l6
	edge32l	%o0,	%g5,	%l1
	st	%f24,	[%l7 + 0x54]
	fpsub32s	%f28,	%f29,	%f15
	fzero	%f0
	ld	[%l7 + 0x08],	%f12
	sra	%i1,	0x10,	%i2
	movrlz	%l5,	0x0F4,	%g7
	movge	%xcc,	%o7,	%i0
	sllx	%g3,	0x00,	%o1
	movrgez	%g4,	%i6,	%i5
	edge8l	%i3,	%g6,	%o2
	movpos	%xcc,	%g2,	%i7
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%l0
	edge32ln	%l4,	%o3,	%l3
	fmovsleu	%icc,	%f25,	%f30
	and	%g1,	%o6,	%o5
	ldsw	[%l7 + 0x54],	%o4
	subcc	%l2,	%i4,	%o0
	movge	%xcc,	%g5,	%l6
	movrlz	%l1,	0x1C6,	%i1
	udivx	%l5,	0x1CB2,	%g7
	movleu	%icc,	%i2,	%i0
	sllx	%o7,	0x18,	%g3
	alignaddrl	%g4,	%i6,	%i5
	fnot1	%f16,	%f10
	move	%xcc,	%o1,	%g6
	fcmpne32	%f16,	%f6,	%i3
	st	%f0,	[%l7 + 0x30]
	ldd	[%l7 + 0x60],	%f16
	fpadd16	%f8,	%f22,	%f8
	ldsw	[%l7 + 0x6C],	%g2
	umulcc	%o2,	%l0,	%l4
	ldsw	[%l7 + 0x5C],	%i7
	mulx	%l3,	0x1459,	%o3
	sdivcc	%o6,	0x0CBB,	%o5
	sdivcc	%o4,	0x1E2F,	%g1
	array16	%i4,	%l2,	%o0
	fmovsneg	%xcc,	%f12,	%f26
	move	%xcc,	%l6,	%g5
	fabss	%f19,	%f28
	mulx	%l1,	%i1,	%g7
	sethi	0x0F0F,	%l5
	fornot1	%f10,	%f24,	%f24
	xnorcc	%i0,	%o7,	%i2
	and	%g3,	0x11D7,	%g4
	and	%i6,	0x0EBB,	%i5
	and	%g6,	0x1164,	%o1
	fmovrslez	%i3,	%f5,	%f1
	move	%xcc,	%g2,	%l0
	fpack32	%f26,	%f24,	%f4
	movre	%l4,	%o2,	%i7
	movvc	%icc,	%o3,	%o6
	sdiv	%o5,	0x198A,	%l3
	fcmpd	%fcc3,	%f18,	%f8
	movg	%xcc,	%g1,	%o4
	xor	%i4,	%l2,	%o0
	alignaddrl	%l6,	%g5,	%i1
	array16	%l1,	%g7,	%l5
	xorcc	%i0,	0x0E6D,	%o7
	sll	%i2,	0x12,	%g3
	edge8n	%g4,	%i6,	%i5
	subc	%o1,	%g6,	%i3
	fand	%f14,	%f30,	%f24
	sll	%g2,	0x13,	%l0
	umul	%o2,	0x1E85,	%i7
	add	%l4,	%o3,	%o5
	sth	%l3,	[%l7 + 0x68]
	move	%icc,	%g1,	%o6
	lduh	[%l7 + 0x10],	%i4
	orncc	%l2,	0x0D6A,	%o0
	edge16l	%o4,	%l6,	%i1
	ldd	[%l7 + 0x28],	%g4
	fmovsl	%xcc,	%f29,	%f30
	fcmpd	%fcc1,	%f16,	%f28
	fcmpd	%fcc3,	%f8,	%f16
	sdivcc	%g7,	0x1D9E,	%l1
	sll	%i0,	0x1D,	%o7
	fandnot2	%f6,	%f14,	%f24
	sethi	0x0D2F,	%i2
	movgu	%icc,	%l5,	%g4
	srax	%i6,	0x03,	%i5
	orcc	%g3,	0x0A69,	%g6
	srlx	%o1,	0x04,	%i3
	sth	%l0,	[%l7 + 0x56]
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	sra	%l4,	0x0A,	%o3
	edge8l	%o5,	%l3,	%g1
	smul	%o2,	%o6,	%l2
	fmovdcc	%xcc,	%f10,	%f8
	movvs	%xcc,	%o0,	%o4
	fmul8x16al	%f27,	%f24,	%f22
	fxnors	%f16,	%f15,	%f10
	stw	%l6,	[%l7 + 0x14]
	fmovdvc	%xcc,	%f11,	%f15
	sll	%i1,	0x1B,	%g5
	add	%g7,	0x0D5A,	%l1
	alignaddr	%i0,	%o7,	%i2
	movcs	%xcc,	%i4,	%g4
	edge16	%l5,	%i6,	%g3
	andncc	%i5,	%o1,	%i3
	orcc	%l0,	%g6,	%i7
	movvc	%xcc,	%g2,	%o3
	std	%f14,	[%l7 + 0x30]
	sth	%l4,	[%l7 + 0x3C]
	fmovdneg	%xcc,	%f25,	%f13
	std	%f0,	[%l7 + 0x18]
	fmovda	%icc,	%f18,	%f18
	orncc	%o5,	%l3,	%o2
	orcc	%o6,	%g1,	%l2
	move	%icc,	%o0,	%l6
	fmovdcs	%icc,	%f25,	%f29
	std	%f24,	[%l7 + 0x60]
	movrlz	%i1,	0x16A,	%o4
	edge8ln	%g7,	%g5,	%l1
	ldd	[%l7 + 0x48],	%f20
	faligndata	%f8,	%f4,	%f26
	umulcc	%o7,	%i2,	%i4
	andn	%i0,	%g4,	%l5
	ldsh	[%l7 + 0x16],	%g3
	and	%i6,	0x05B9,	%o1
	umulcc	%i5,	0x1AD0,	%i3
	ld	[%l7 + 0x58],	%f26
	fmovsg	%xcc,	%f5,	%f19
	fornot1	%f14,	%f4,	%f18
	save %g6, 0x0CEA, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x10F5,	%l0
	fmovsa	%icc,	%f3,	%f6
	fcmped	%fcc0,	%f14,	%f0
	movrlez	%g2,	%l4,	%o3
	edge32n	%l3,	%o5,	%o6
	addc	%o2,	%l2,	%o0
	array16	%g1,	%l6,	%o4
	mulscc	%g7,	0x1718,	%i1
	edge8ln	%g5,	%o7,	%l1
	edge16l	%i2,	%i4,	%g4
	ldsh	[%l7 + 0x3A],	%l5
	xor	%i0,	0x0F96,	%g3
	fsrc2s	%f11,	%f14
	save %o1, %i6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f24,	%f4,	%f22
	popc	0x132E,	%g6
	fmovrsgz	%i3,	%f31,	%f26
	xnor	%l0,	%g2,	%i7
	ld	[%l7 + 0x5C],	%f16
	ldsb	[%l7 + 0x78],	%l4
	fmovrdgez	%l3,	%f0,	%f28
	edge32	%o5,	%o6,	%o2
	movne	%xcc,	%o3,	%o0
	array16	%g1,	%l2,	%o4
	or	%g7,	%l6,	%i1
	fcmpgt32	%f12,	%f26,	%o7
	udivx	%g5,	0x1439,	%i2
	movcs	%xcc,	%i4,	%l1
	movvs	%icc,	%g4,	%l5
	std	%f28,	[%l7 + 0x50]
	lduw	[%l7 + 0x24],	%g3
	edge16ln	%o1,	%i0,	%i6
	fmovsne	%xcc,	%f20,	%f9
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%i4
	fcmple32	%f6,	%f0,	%i3
	ldsw	[%l7 + 0x6C],	%g6
	movrgz	%l0,	%g2,	%l4
	stx	%i7,	[%l7 + 0x18]
	movgu	%xcc,	%l3,	%o6
	movn	%icc,	%o5,	%o3
	mulscc	%o0,	%o2,	%g1
	movl	%icc,	%l2,	%o4
	fmovrsgez	%g7,	%f17,	%f7
	addccc	%i1,	0x1691,	%o7
	fandnot2s	%f22,	%f2,	%f19
	movcc	%xcc,	%l6,	%g5
	addccc	%i2,	%l1,	%i4
	sir	0x152E
	orn	%g4,	%l5,	%g3
	addcc	%o1,	%i6,	%i5
	std	%f18,	[%l7 + 0x70]
	movle	%icc,	%i3,	%g6
	popc	0x0391,	%i0
	orncc	%g2,	%l0,	%l4
	lduw	[%l7 + 0x4C],	%l3
	subcc	%i7,	%o5,	%o6
	array8	%o0,	%o2,	%g1
	sdiv	%o3,	0x18CC,	%l2
	movcc	%xcc,	%g7,	%i1
	fmovdle	%xcc,	%f6,	%f31
	sll	%o4,	%l6,	%o7
	edge16ln	%g5,	%l1,	%i2
	edge8	%i4,	%l5,	%g4
	movl	%icc,	%o1,	%i6
	fmovd	%f24,	%f28
	smulcc	%g3,	%i3,	%i5
	stb	%i0,	[%l7 + 0x08]
	ldsb	[%l7 + 0x20],	%g6
	subcc	%g2,	%l4,	%l0
	movrlz	%l3,	%i7,	%o6
	xorcc	%o5,	%o0,	%g1
	fxor	%f18,	%f4,	%f18
	udivx	%o2,	0x066B,	%o3
	movrne	%l2,	%g7,	%o4
	fcmple16	%f10,	%f4,	%i1
	udivcc	%o7,	0x0611,	%g5
	sra	%l1,	0x16,	%i2
	st	%f24,	[%l7 + 0x58]
	fmovdcs	%xcc,	%f10,	%f22
	mulx	%i4,	%l5,	%l6
	mulx	%o1,	%g4,	%g3
	andn	%i6,	%i5,	%i0
	xorcc	%i3,	%g6,	%g2
	fmovrsgz	%l4,	%f29,	%f30
	st	%f10,	[%l7 + 0x0C]
	array32	%l3,	%i7,	%l0
	fcmps	%fcc0,	%f21,	%f17
	array8	%o6,	%o0,	%g1
	movg	%xcc,	%o5,	%o2
	movleu	%icc,	%l2,	%o3
	fpsub16	%f2,	%f14,	%f20
	movneg	%icc,	%o4,	%g7
	movpos	%icc,	%o7,	%g5
	array8	%i1,	%l1,	%i4
	edge16l	%i2,	%l5,	%o1
	sir	0x0857
	stb	%g4,	[%l7 + 0x77]
	ldsw	[%l7 + 0x0C],	%l6
	movle	%xcc,	%i6,	%i5
	xor	%g3,	%i0,	%g6
	orn	%g2,	0x061B,	%i3
	edge32l	%l4,	%l3,	%i7
	andn	%l0,	%o0,	%o6
	ldx	[%l7 + 0x68],	%g1
	popc	%o5,	%o2
	addc	%o3,	%o4,	%l2
	udivx	%o7,	0x04EE,	%g5
	ldub	[%l7 + 0x0A],	%g7
	sllx	%l1,	%i1,	%i4
	edge16	%i2,	%o1,	%l5
	subccc	%l6,	%i6,	%i5
	movl	%icc,	%g3,	%i0
	movpos	%xcc,	%g4,	%g2
	sth	%i3,	[%l7 + 0x34]
	fmul8ulx16	%f24,	%f14,	%f22
	sdivcc	%g6,	0x0A53,	%l3
	movcs	%xcc,	%l4,	%l0
	fexpand	%f20,	%f6
	edge8ln	%i7,	%o0,	%o6
	sdiv	%o5,	0x1B1A,	%g1
	fpack16	%f0,	%f15
	udivcc	%o3,	0x1774,	%o4
	mulscc	%l2,	0x1B61,	%o2
	srl	%g5,	0x0D,	%o7
	edge32ln	%g7,	%l1,	%i4
	fxors	%f12,	%f27,	%f31
	st	%f2,	[%l7 + 0x50]
	nop
	set	0x0E, %o4
	lduh	[%l7 + %o4],	%i2
	movvc	%icc,	%i1,	%l5
	andn	%o1,	%l6,	%i6
	edge32	%g3,	%i5,	%g4
	fzeros	%f13
	movrlez	%g2,	%i3,	%g6
	fands	%f17,	%f8,	%f31
	movn	%xcc,	%i0,	%l4
	fsrc2	%f14,	%f24
	ldx	[%l7 + 0x58],	%l3
	fmovdneg	%xcc,	%f17,	%f17
	movle	%icc,	%l0,	%o0
	edge32l	%o6,	%i7,	%g1
	fmovrdgz	%o3,	%f6,	%f10
	stb	%o5,	[%l7 + 0x4A]
	xor	%l2,	0x1229,	%o4
	orn	%o2,	0x0866,	%o7
	fmovdcc	%xcc,	%f12,	%f30
	edge16l	%g7,	%g5,	%i4
	ldd	[%l7 + 0x68],	%l0
	fmuld8sux16	%f1,	%f8,	%f6
	array8	%i2,	%l5,	%i1
	st	%f11,	[%l7 + 0x38]
	xnorcc	%o1,	0x110C,	%l6
	subccc	%g3,	%i5,	%g4
	std	%f8,	[%l7 + 0x70]
	ldsw	[%l7 + 0x5C],	%i6
	movn	%icc,	%i3,	%g6
	fnands	%f15,	%f29,	%f19
	fandnot2s	%f0,	%f14,	%f18
	popc	%i0,	%l4
	ldd	[%l7 + 0x10],	%g2
	edge16n	%l3,	%l0,	%o0
	andn	%o6,	0x0030,	%i7
	movl	%xcc,	%o3,	%o5
	umul	%l2,	0x154E,	%o4
	popc	%g1,	%o2
	movcs	%icc,	%g7,	%g5
	movrgz	%o7,	0x260,	%l1
	mova	%icc,	%i2,	%i4
	xnorcc	%i1,	0x1E34,	%l5
	movl	%icc,	%l6,	%g3
	movcs	%icc,	%i5,	%o1
	array8	%i6,	%g4,	%i3
	xnorcc	%i0,	0x16A1,	%g6
	array16	%g2,	%l3,	%l0
	subccc	%l4,	%o6,	%o0
	movge	%xcc,	%i7,	%o5
	stb	%l2,	[%l7 + 0x62]
	orncc	%o4,	%g1,	%o3
	umul	%o2,	0x0C41,	%g7
	ldx	[%l7 + 0x70],	%g5
	for	%f6,	%f28,	%f4
	fandnot2s	%f3,	%f16,	%f2
	xnor	%l1,	0x169B,	%i2
	edge8l	%i4,	%i1,	%l5
	movrlz	%o7,	0x37C,	%l6
	edge32l	%i5,	%o1,	%i6
	alignaddr	%g3,	%i3,	%g4
	or	%g6,	%i0,	%g2
	sllx	%l0,	0x08,	%l4
	fxnors	%f6,	%f18,	%f27
	stb	%l3,	[%l7 + 0x41]
	sra	%o0,	0x0F,	%i7
	fnot1s	%f7,	%f26
	movgu	%icc,	%o6,	%o5
	sdiv	%o4,	0x0DFC,	%g1
	fsrc1s	%f14,	%f6
	xnorcc	%o3,	0x08DD,	%o2
	edge16ln	%g7,	%l2,	%g5
	fmovscs	%xcc,	%f29,	%f5
	movrlz	%i2,	%l1,	%i4
	andncc	%i1,	%o7,	%l5
	fpack32	%f8,	%f28,	%f28
	edge8n	%i5,	%o1,	%l6
	movrgz	%g3,	%i3,	%i6
	sra	%g6,	0x1A,	%i0
	smul	%g4,	0x0206,	%g2
	ldsb	[%l7 + 0x5B],	%l4
	fone	%f0
	fmovsn	%xcc,	%f15,	%f11
	fcmpgt16	%f28,	%f26,	%l0
	movre	%o0,	%i7,	%l3
	ldd	[%l7 + 0x68],	%f20
	mova	%xcc,	%o6,	%o5
	fabss	%f11,	%f24
	edge16l	%o4,	%g1,	%o3
	subc	%o2,	0x148A,	%g7
	addc	%l2,	0x0BDF,	%g5
	lduh	[%l7 + 0x52],	%i2
	ldsw	[%l7 + 0x20],	%l1
	srlx	%i1,	0x13,	%i4
	andncc	%l5,	%i5,	%o7
	movle	%icc,	%o1,	%l6
	edge16n	%i3,	%g3,	%i6
	fandnot2	%f4,	%f6,	%f20
	ldd	[%l7 + 0x20],	%i0
	movge	%xcc,	%g4,	%g6
	fmovsge	%icc,	%f28,	%f15
	sub	%g2,	%l4,	%l0
	lduw	[%l7 + 0x7C],	%o0
	movl	%icc,	%l3,	%o6
	sdivx	%i7,	0x1C06,	%o4
	fmovdle	%xcc,	%f24,	%f31
	fcmpes	%fcc3,	%f1,	%f1
	sethi	0x040F,	%o5
	fmovrslez	%o3,	%f0,	%f31
	array8	%o2,	%g7,	%l2
	stw	%g5,	[%l7 + 0x60]
	andcc	%g1,	%i2,	%l1
	array8	%i4,	%l5,	%i1
	movge	%xcc,	%i5,	%o7
	movcs	%icc,	%l6,	%o1
	alignaddrl	%i3,	%i6,	%g3
	edge8l	%i0,	%g6,	%g2
	udiv	%l4,	0x0C1E,	%g4
	ldd	[%l7 + 0x58],	%f14
	fzero	%f10
	orn	%o0,	0x0403,	%l0
	restore %o6, %l3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i7,	0x0FA3,	%o3
	xnor	%o2,	0x04E0,	%o5
	udivx	%g7,	0x0E64,	%g5
	sll	%l2,	0x0A,	%g1
	movcs	%xcc,	%l1,	%i4
	sub	%i2,	0x084F,	%l5
	sll	%i5,	0x17,	%o7
	umulcc	%i1,	%l6,	%i3
	for	%f26,	%f8,	%f0
	orncc	%o1,	0x08D8,	%g3
	fmovdg	%icc,	%f13,	%f0
	sir	0x1E4A
	umulcc	%i6,	%i0,	%g2
	fsrc2s	%f2,	%f0
	fnot1	%f6,	%f12
	array32	%g6,	%g4,	%l4
	udivx	%l0,	0x1058,	%o0
	addccc	%l3,	%o6,	%o4
	fmovrdlz	%i7,	%f26,	%f10
	udivcc	%o3,	0x1E9E,	%o2
	fxor	%f4,	%f20,	%f2
	xnor	%g7,	0x0F54,	%o5
	ldsh	[%l7 + 0x42],	%l2
	xnor	%g1,	%g5,	%i4
	srlx	%i2,	%l1,	%i5
	and	%o7,	0x16AF,	%l5
	fmovrsgez	%i1,	%f4,	%f3
	movgu	%icc,	%i3,	%o1
	array8	%l6,	%i6,	%g3
	ldd	[%l7 + 0x40],	%g2
	movl	%xcc,	%g6,	%g4
	fmovdg	%icc,	%f26,	%f4
	edge16l	%l4,	%i0,	%l0
	movrgez	%o0,	%l3,	%o6
	edge16	%i7,	%o3,	%o2
	mova	%xcc,	%o4,	%o5
	movcc	%xcc,	%g7,	%l2
	movleu	%xcc,	%g1,	%g5
	subcc	%i2,	0x1937,	%l1
	fmovrdlez	%i5,	%f12,	%f8
	fnor	%f10,	%f18,	%f20
	srl	%i4,	%l5,	%o7
	fmovsle	%icc,	%f2,	%f12
	movne	%icc,	%i1,	%o1
	xorcc	%l6,	%i6,	%g3
	ld	[%l7 + 0x7C],	%f0
	fcmps	%fcc3,	%f11,	%f6
	movpos	%icc,	%g2,	%i3
	movcs	%icc,	%g6,	%g4
	lduh	[%l7 + 0x44],	%l4
	nop
	set	0x20, %g1
	std	%f4,	[%l7 + %g1]
	sllx	%i0,	%o0,	%l3
	fmuld8sux16	%f16,	%f29,	%f4
	sra	%l0,	%i7,	%o3
	ldx	[%l7 + 0x08],	%o6
	fmovsl	%icc,	%f3,	%f22
	edge32	%o4,	%o2,	%g7
	movrlz	%o5,	0x3F6,	%g1
	fcmpes	%fcc3,	%f17,	%f17
	subccc	%g5,	0x02D9,	%i2
	edge32l	%l2,	%i5,	%l1
	srl	%l5,	0x02,	%o7
	fornot2	%f22,	%f12,	%f6
	movl	%xcc,	%i1,	%o1
	fmovspos	%xcc,	%f22,	%f15
	fnot2s	%f8,	%f9
	srl	%l6,	0x0B,	%i4
	move	%xcc,	%g3,	%g2
	sub	%i3,	%i6,	%g6
	movpos	%xcc,	%l4,	%i0
	lduh	[%l7 + 0x3E],	%g4
	subc	%l3,	0x0D39,	%l0
	stw	%o0,	[%l7 + 0x10]
	andcc	%o3,	0x0265,	%o6
	save %o4, %i7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f9,	%f16,	%f17
	movrgz	%o2,	%g1,	%g5
	sub	%o5,	0x19FB,	%i2
	mulx	%l2,	0x1C57,	%l1
	sdivx	%i5,	0x121A,	%l5
	movcs	%xcc,	%i1,	%o1
	xnor	%o7,	%l6,	%i4
	fornot2s	%f29,	%f6,	%f4
	movleu	%xcc,	%g2,	%i3
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	movcs	%icc,	%g6,	%g4
	sll	%i0,	0x07,	%l3
	or	%l0,	0x0B36,	%o3
	fabss	%f1,	%f3
	mulx	%o0,	%o4,	%i7
	mulx	%o6,	0x175A,	%o2
	udivx	%g7,	0x15A5,	%g5
	popc	%o5,	%g1
	fmovsn	%icc,	%f7,	%f30
	ldsb	[%l7 + 0x35],	%i2
	movcc	%icc,	%l1,	%l2
	srax	%l5,	%i5,	%o1
	sdivcc	%o7,	0x1F03,	%l6
	fsrc2	%f8,	%f22
	fmovde	%icc,	%f6,	%f10
	movvc	%xcc,	%i1,	%g2
	fandnot1	%f18,	%f28,	%f20
	fzeros	%f17
	fmovdne	%icc,	%f4,	%f7
	ldd	[%l7 + 0x50],	%i4
	ldsb	[%l7 + 0x73],	%i3
	orn	%i6,	%g3,	%l4
	movvc	%icc,	%g4,	%g6
	fands	%f31,	%f0,	%f14
	mova	%xcc,	%l3,	%i0
	stx	%o3,	[%l7 + 0x78]
	st	%f15,	[%l7 + 0x6C]
	lduh	[%l7 + 0x18],	%l0
	sub	%o0,	0x0C4C,	%o4
	xorcc	%o6,	0x13C5,	%o2
	andcc	%i7,	0x0D99,	%g7
	mulscc	%o5,	%g5,	%g1
	udivcc	%l1,	0x19D6,	%i2
	fmul8x16al	%f4,	%f6,	%f0
	movn	%icc,	%l2,	%i5
	subc	%o1,	0x1155,	%o7
	edge16	%l6,	%i1,	%g2
	fnegs	%f7,	%f29
	mulx	%l5,	%i4,	%i3
	ldd	[%l7 + 0x30],	%i6
	stx	%g3,	[%l7 + 0x20]
	fmovsg	%icc,	%f15,	%f24
	movg	%icc,	%g4,	%l4
	movrgz	%g6,	0x09B,	%i0
	movrgez	%o3,	0x279,	%l0
	mulx	%l3,	0x0A20,	%o4
	srl	%o0,	0x07,	%o6
	movrgz	%o2,	%g7,	%i7
	andcc	%o5,	0x165A,	%g1
	movvc	%xcc,	%l1,	%g5
	mova	%xcc,	%l2,	%i5
	movrgz	%o1,	0x39E,	%i2
	subccc	%o7,	%i1,	%g2
	st	%f28,	[%l7 + 0x6C]
	edge8l	%l5,	%l6,	%i3
	srlx	%i4,	0x03,	%i6
	sth	%g3,	[%l7 + 0x78]
	edge8l	%l4,	%g6,	%g4
	movrne	%o3,	0x227,	%l0
	fcmpeq16	%f4,	%f2,	%i0
	xnor	%o4,	%l3,	%o0
	sethi	0x1295,	%o2
	ldub	[%l7 + 0x15],	%o6
	movcc	%icc,	%g7,	%o5
	sethi	0x1B2C,	%g1
	movrlez	%l1,	0x0F0,	%g5
	popc	%i7,	%i5
	movvc	%xcc,	%l2,	%o1
	xnorcc	%i2,	%o7,	%g2
	subcc	%l5,	%i1,	%l6
	fpack16	%f20,	%f7
	edge8ln	%i3,	%i4,	%i6
	mulx	%l4,	0x0D51,	%g6
	movrne	%g3,	%o3,	%l0
	edge32n	%i0,	%g4,	%l3
	movrgez	%o4,	%o0,	%o6
	movleu	%xcc,	%g7,	%o5
	sethi	0x1857,	%g1
	ldub	[%l7 + 0x60],	%o2
	fexpand	%f6,	%f16
	fmovdcc	%icc,	%f30,	%f24
	ldsw	[%l7 + 0x2C],	%l1
	fnot2s	%f27,	%f5
	edge16ln	%g5,	%i5,	%l2
	array8	%o1,	%i2,	%i7
	pdist	%f30,	%f22,	%f24
	movcc	%icc,	%g2,	%o7
	sir	0x0296
	fnot1s	%f15,	%f9
	addcc	%i1,	0x0A20,	%l5
	alignaddrl	%l6,	%i4,	%i3
	srlx	%i6,	0x16,	%g6
	fnot1	%f16,	%f4
	fandnot1	%f24,	%f0,	%f28
	fabsd	%f20,	%f0
	sll	%l4,	0x15,	%g3
	edge8n	%o3,	%i0,	%l0
	ld	[%l7 + 0x70],	%f5
	fmul8ulx16	%f30,	%f10,	%f30
	xnor	%l3,	%g4,	%o4
	fpadd16	%f10,	%f8,	%f30
	fmovdneg	%xcc,	%f8,	%f20
	subc	%o0,	%g7,	%o6
	sllx	%g1,	0x1A,	%o2
	xorcc	%o5,	0x106A,	%l1
	array8	%i5,	%l2,	%o1
	ldd	[%l7 + 0x60],	%f24
	fzero	%f4
	fnor	%f30,	%f16,	%f18
	movrgz	%g5,	0x216,	%i7
	fcmpne32	%f14,	%f6,	%g2
	ld	[%l7 + 0x14],	%f20
	xnorcc	%o7,	0x1EA9,	%i2
	edge16	%l5,	%i1,	%l6
	fmovsle	%icc,	%f30,	%f8
	sethi	0x0EDE,	%i3
	sdiv	%i4,	0x095F,	%g6
	edge16l	%i6,	%g3,	%l4
	and	%o3,	0x041D,	%l0
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%l2
	fxor	%f0,	%f10,	%f10
	move	%icc,	%i0,	%g4
	array8	%o4,	%o0,	%o6
	smul	%g1,	%o2,	%o5
	srlx	%g7,	0x00,	%i5
	fmovrse	%l2,	%f27,	%f6
	mulx	%o1,	%g5,	%i7
	nop
	set	0x71, %i0
	ldub	[%l7 + %i0],	%l1
	sll	%g2,	%i2,	%l5
	stw	%o7,	[%l7 + 0x34]
	fxor	%f20,	%f2,	%f6
	edge32n	%l6,	%i1,	%i4
	smul	%i3,	%g6,	%i6
	subccc	%l4,	%o3,	%g3
	movvs	%xcc,	%l0,	%l3
	ldsb	[%l7 + 0x7B],	%g4
	andcc	%o4,	%i0,	%o6
	fornot1	%f12,	%f10,	%f18
	edge8	%o0,	%g1,	%o2
	fzero	%f10
	move	%icc,	%g7,	%i5
	movrgez	%l2,	0x2CE,	%o1
	movrlz	%g5,	%i7,	%o5
	fpsub32s	%f0,	%f20,	%f14
	array32	%l1,	%g2,	%i2
	movl	%icc,	%l5,	%l6
	edge32	%o7,	%i1,	%i4
	movrgz	%i3,	%i6,	%l4
	edge16ln	%o3,	%g6,	%l0
	fone	%f24
	move	%xcc,	%l3,	%g4
	edge32ln	%o4,	%i0,	%o6
	fmovs	%f31,	%f12
	fmovrdlez	%g3,	%f24,	%f4
	ldsh	[%l7 + 0x5C],	%g1
	movrne	%o0,	0x20D,	%g7
	fnand	%f2,	%f10,	%f20
	mova	%xcc,	%o2,	%l2
	movn	%xcc,	%i5,	%o1
	sub	%i7,	%o5,	%g5
	sdivcc	%g2,	0x1CA8,	%i2
	movrlez	%l5,	0x3AB,	%l1
	mova	%icc,	%l6,	%o7
	sir	0x0D71
	fpsub16s	%f11,	%f16,	%f1
	popc	0x1FDE,	%i4
	lduh	[%l7 + 0x7E],	%i1
	movrne	%i3,	%i6,	%l4
	movne	%xcc,	%o3,	%g6
	bshuffle	%f14,	%f0,	%f0
	fnand	%f2,	%f6,	%f26
	movvs	%icc,	%l0,	%l3
	smul	%g4,	%i0,	%o4
	ldx	[%l7 + 0x48],	%o6
	fexpand	%f20,	%f24
	srlx	%g1,	0x02,	%g3
	umulcc	%g7,	%o2,	%l2
	addc	%o0,	0x1904,	%o1
	edge8n	%i7,	%i5,	%g5
	sdivcc	%o5,	0x0B6C,	%i2
	edge8l	%l5,	%g2,	%l1
	edge32ln	%o7,	%l6,	%i4
	fnegd	%f10,	%f12
	fmovrdlez	%i3,	%f10,	%f22
	addc	%i6,	%i1,	%o3
	sth	%l4,	[%l7 + 0x30]
	fmul8ulx16	%f8,	%f10,	%f12
	lduw	[%l7 + 0x1C],	%l0
	fornot2	%f0,	%f30,	%f8
	edge8	%l3,	%g6,	%i0
	fcmpeq16	%f26,	%f24,	%o4
	movrgez	%g4,	%g1,	%g3
	sra	%g7,	%o2,	%l2
	movgu	%xcc,	%o6,	%o1
	umul	%o0,	%i5,	%i7
	fcmpgt16	%f4,	%f2,	%g5
	mulx	%o5,	0x0EB5,	%l5
	movvs	%xcc,	%i2,	%g2
	mova	%icc,	%o7,	%l6
	nop
	set	0x60, %l2
	std	%f16,	[%l7 + %l2]
	movcc	%xcc,	%i4,	%i3
	fcmpeq32	%f6,	%f30,	%i6
	movcs	%xcc,	%l1,	%i1
	edge32n	%l4,	%l0,	%o3
	fmovsn	%xcc,	%f4,	%f31
	movle	%xcc,	%g6,	%l3
	movpos	%xcc,	%o4,	%g4
	edge32n	%g1,	%g3,	%g7
	movrlz	%i0,	0x23A,	%o2
	array32	%l2,	%o1,	%o6
	edge8ln	%i5,	%o0,	%g5
	fexpand	%f28,	%f4
	edge8l	%i7,	%o5,	%l5
	nop
	set	0x20, %l0
	ldsw	[%l7 + %l0],	%g2
	movpos	%xcc,	%i2,	%l6
	fmovscs	%xcc,	%f11,	%f2
	fmovdg	%icc,	%f29,	%f20
	movrne	%o7,	%i4,	%i3
	edge32l	%l1,	%i6,	%l4
	fornot1	%f16,	%f2,	%f30
	addcc	%l0,	0x1B7A,	%o3
	sll	%i1,	0x03,	%l3
	mulscc	%g6,	%g4,	%o4
	sra	%g1,	0x10,	%g3
	movvs	%icc,	%i0,	%g7
	ldsh	[%l7 + 0x2C],	%o2
	edge16	%l2,	%o6,	%i5
	fmovrde	%o1,	%f22,	%f14
	sdivx	%o0,	0x035D,	%i7
	fors	%f17,	%f16,	%f15
	movrgz	%g5,	0x160,	%o5
	array8	%l5,	%i2,	%g2
	umul	%l6,	0x1617,	%o7
	edge8	%i3,	%l1,	%i4
	sdiv	%l4,	0x0606,	%l0
	lduh	[%l7 + 0x10],	%o3
	fmovsgu	%xcc,	%f26,	%f6
	edge32ln	%i1,	%i6,	%l3
	sllx	%g6,	0x1F,	%o4
	ldx	[%l7 + 0x18],	%g1
	edge16	%g3,	%g4,	%i0
	ldsb	[%l7 + 0x2C],	%o2
	fmul8x16au	%f3,	%f16,	%f28
	array32	%l2,	%g7,	%o6
	movcc	%xcc,	%o1,	%o0
	andn	%i5,	0x1AB3,	%g5
	srlx	%o5,	%l5,	%i7
	movrlez	%i2,	%g2,	%l6
	fmuld8sux16	%f23,	%f23,	%f2
	std	%f18,	[%l7 + 0x18]
	ldd	[%l7 + 0x30],	%o6
	movl	%xcc,	%i3,	%l1
	fmovdvc	%icc,	%f1,	%f30
	andn	%l4,	%i4,	%o3
	restore %l0, %i6, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g6, 0x18DB, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o4,	%g3
	fmovsgu	%xcc,	%f27,	%f7
	umul	%g4,	%g1,	%o2
	sethi	0x010A,	%l2
	subccc	%i0,	%o6,	%o1
	array16	%o0,	%i5,	%g5
	movgu	%xcc,	%o5,	%l5
	xor	%g7,	%i7,	%g2
	array16	%l6,	%i2,	%o7
	fxnors	%f22,	%f21,	%f3
	movrgz	%i3,	%l1,	%l4
	edge32	%o3,	%l0,	%i4
	ldsh	[%l7 + 0x6E],	%i6
	fandnot2s	%f19,	%f7,	%f24
	sdiv	%l3,	0x06A6,	%i1
	umul	%g6,	0x134A,	%g3
	fmul8x16al	%f5,	%f12,	%f4
	fxors	%f16,	%f11,	%f31
	fmovrslez	%g4,	%f26,	%f5
	pdist	%f18,	%f30,	%f12
	movrlez	%o4,	%o2,	%l2
	fnor	%f18,	%f12,	%f0
	movrlez	%i0,	0x078,	%o6
	sllx	%o1,	0x18,	%o0
	save %g1, %i5, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o5,	%g7
	fabss	%f28,	%f30
	std	%f4,	[%l7 + 0x28]
	sllx	%i7,	%l5,	%l6
	edge32l	%i2,	%g2,	%i3
	alignaddrl	%o7,	%l1,	%l4
	fmovd	%f12,	%f4
	fmovdcc	%icc,	%f18,	%f13
	xnor	%o3,	0x0F4C,	%l0
	sdivcc	%i6,	0x0791,	%i4
	movleu	%xcc,	%l3,	%g6
	movpos	%icc,	%g3,	%g4
	fmovrdgz	%i1,	%f14,	%f6
	alignaddrl	%o4,	%o2,	%l2
	andcc	%i0,	0x00C9,	%o1
	movvs	%icc,	%o0,	%o6
	stw	%i5,	[%l7 + 0x24]
	srl	%g1,	0x0E,	%g5
	fmovda	%icc,	%f21,	%f7
	udivx	%g7,	0x1FA0,	%o5
	mulscc	%i7,	0x027A,	%l5
	edge32ln	%l6,	%g2,	%i2
	edge16l	%i3,	%l1,	%o7
	subccc	%l4,	%l0,	%i6
	fmovsl	%xcc,	%f27,	%f11
	xorcc	%i4,	%o3,	%l3
	fmovrsne	%g6,	%f9,	%f20
	edge16l	%g3,	%i1,	%g4
	andn	%o4,	%l2,	%o2
	ldsw	[%l7 + 0x54],	%o1
	fabss	%f13,	%f7
	xnorcc	%i0,	0x00E9,	%o6
	sllx	%i5,	0x06,	%o0
	movl	%xcc,	%g1,	%g5
	fcmpne32	%f14,	%f10,	%o5
	fornot2s	%f3,	%f2,	%f4
	movvs	%xcc,	%i7,	%g7
	udivx	%l6,	0x17E4,	%g2
	fsrc1s	%f17,	%f7
	fmovdvs	%icc,	%f25,	%f29
	ldsw	[%l7 + 0x58],	%l5
	movgu	%icc,	%i2,	%l1
	array32	%i3,	%o7,	%l4
	udivcc	%l0,	0x1F87,	%i6
	nop
	set	0x42, %l6
	ldub	[%l7 + %l6],	%o3
	mulscc	%i4,	0x195F,	%l3
	movge	%xcc,	%g3,	%i1
	fsrc1s	%f10,	%f23
	and	%g6,	0x06C6,	%g4
	movpos	%icc,	%o4,	%l2
	movl	%icc,	%o2,	%i0
	umulcc	%o1,	0x11DB,	%i5
	fcmps	%fcc3,	%f19,	%f0
	ld	[%l7 + 0x78],	%f27
	edge16ln	%o0,	%g1,	%g5
	fpadd16s	%f30,	%f8,	%f2
	fmovsle	%icc,	%f25,	%f16
	mova	%icc,	%o6,	%o5
	sll	%i7,	0x0B,	%g7
	xorcc	%g2,	0x0384,	%l6
	and	%l5,	0x0CC4,	%l1
	edge16l	%i3,	%o7,	%l4
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	fmovd	%f8,	%f8
	sethi	0x053C,	%o3
	ldsh	[%l7 + 0x14],	%i4
	edge32	%i6,	%g3,	%l3
	edge32	%g6,	%g4,	%o4
	fmul8x16al	%f17,	%f12,	%f6
	sub	%l2,	0x06D2,	%o2
	sllx	%i0,	0x1D,	%i1
	movrlez	%i5,	0x3BA,	%o1
	movrgz	%o0,	%g5,	%o6
	srax	%g1,	%o5,	%g7
	subc	%i7,	%g2,	%l5
	fxnor	%f0,	%f16,	%f18
	and	%l1,	0x14A5,	%i3
	fmovde	%xcc,	%f31,	%f18
	udiv	%o7,	0x1AF6,	%l4
	sll	%i2,	0x02,	%l0
	addcc	%l6,	0x050A,	%i4
	movrgz	%o3,	%g3,	%i6
	movleu	%icc,	%g6,	%g4
	movn	%icc,	%l3,	%l2
	fnand	%f12,	%f18,	%f20
	movrgz	%o2,	%i0,	%i1
	popc	0x0157,	%o4
	subcc	%o1,	%i5,	%o0
	fmovsa	%xcc,	%f6,	%f22
	andncc	%g5,	%g1,	%o6
	movge	%xcc,	%g7,	%o5
	edge32l	%g2,	%i7,	%l5
	umul	%i3,	0x177E,	%l1
	subc	%l4,	%i2,	%l0
	umul	%l6,	%i4,	%o7
	sdiv	%g3,	0x03D0,	%o3
	fmovsvs	%xcc,	%f2,	%f28
	mova	%icc,	%i6,	%g4
	sll	%g6,	0x08,	%l3
	movvc	%xcc,	%l2,	%i0
	edge32n	%i1,	%o2,	%o1
	edge32ln	%i5,	%o0,	%o4
	ld	[%l7 + 0x68],	%f19
	movl	%xcc,	%g1,	%g5
	srax	%o6,	0x1E,	%g7
	add	%o5,	%i7,	%g2
	fmovrdgz	%l5,	%f20,	%f18
	movcs	%icc,	%i3,	%l1
	movleu	%xcc,	%l4,	%i2
	fcmple32	%f4,	%f2,	%l6
	addc	%l0,	0x0146,	%i4
	fmovrsgz	%o7,	%f10,	%f19
	std	%f16,	[%l7 + 0x40]
	sllx	%o3,	0x1F,	%g3
	movle	%xcc,	%g4,	%i6
	fmovd	%f12,	%f30
	udivx	%l3,	0x1F2D,	%g6
	edge16n	%i0,	%l2,	%i1
	fmovsg	%xcc,	%f26,	%f7
	ldsh	[%l7 + 0x70],	%o2
	or	%o1,	%i5,	%o4
	sdiv	%o0,	0x16DC,	%g1
	movgu	%xcc,	%g5,	%g7
	edge8ln	%o6,	%o5,	%g2
	sir	0x0C18
	ldub	[%l7 + 0x67],	%l5
	movrgz	%i3,	0x231,	%l1
	udivcc	%l4,	0x0CF1,	%i2
	or	%i7,	0x0B5D,	%l6
	lduh	[%l7 + 0x66],	%l0
	fmovdvs	%icc,	%f6,	%f4
	ld	[%l7 + 0x40],	%f28
	ldsb	[%l7 + 0x0A],	%i4
	move	%icc,	%o3,	%o7
	edge16	%g3,	%g4,	%i6
	ldub	[%l7 + 0x36],	%l3
	udivcc	%g6,	0x1D06,	%l2
	array16	%i0,	%i1,	%o1
	fmovsa	%xcc,	%f10,	%f4
	mulscc	%o2,	0x139E,	%i5
	move	%icc,	%o4,	%o0
	subccc	%g1,	0x192E,	%g7
	movrgez	%g5,	%o5,	%g2
	fsrc1	%f2,	%f2
	mulscc	%l5,	%i3,	%l1
	sdivx	%l4,	0x1568,	%i2
	addcc	%o6,	0x017D,	%l6
	movrne	%l0,	%i4,	%i7
	fpsub32s	%f25,	%f13,	%f14
	array32	%o7,	%g3,	%g4
	array16	%o3,	%i6,	%l3
	edge16	%g6,	%i0,	%l2
	fcmps	%fcc1,	%f14,	%f7
	fmovrdlez	%o1,	%f10,	%f12
	fmul8ulx16	%f24,	%f8,	%f22
	movvc	%icc,	%o2,	%i5
	fzeros	%f14
	xor	%i1,	%o4,	%g1
	ldd	[%l7 + 0x60],	%f2
	fmuld8sux16	%f20,	%f19,	%f0
	sethi	0x1BCA,	%g7
	addccc	%o0,	%g5,	%g2
	udivcc	%l5,	0x195C,	%o5
	sllx	%l1,	%i3,	%i2
	sethi	0x1443,	%l4
	andncc	%l6,	%l0,	%i4
	stw	%i7,	[%l7 + 0x08]
	movl	%xcc,	%o6,	%o7
	st	%f15,	[%l7 + 0x0C]
	array16	%g3,	%o3,	%i6
	restore %l3, 0x14AA, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g4,	0x019E,	%l2
	movrlez	%o1,	0x38C,	%i0
	edge8ln	%o2,	%i1,	%i5
	subccc	%o4,	%g1,	%g7
	subc	%g5,	0x0A03,	%o0
	movcc	%icc,	%g2,	%o5
	fmovrslez	%l1,	%f20,	%f20
	ldd	[%l7 + 0x58],	%i2
	ldub	[%l7 + 0x2A],	%i2
	xnor	%l5,	0x19DE,	%l6
	edge16n	%l4,	%l0,	%i4
	fxors	%f10,	%f28,	%f0
	array16	%i7,	%o6,	%g3
	movne	%icc,	%o7,	%o3
	sir	0x0EEA
	alignaddr	%l3,	%i6,	%g6
	sub	%g4,	%l2,	%i0
	srlx	%o2,	0x02,	%i1
	addccc	%o1,	0x1723,	%i5
	xnor	%o4,	%g1,	%g7
	ldsw	[%l7 + 0x64],	%g5
	movpos	%icc,	%o0,	%o5
	movn	%xcc,	%g2,	%l1
	alignaddrl	%i2,	%l5,	%i3
	sethi	0x02F5,	%l4
	sdiv	%l6,	0x1C87,	%i4
	subccc	%l0,	%o6,	%i7
	fmovsge	%icc,	%f1,	%f7
	xorcc	%o7,	0x0F3C,	%g3
	nop
	set	0x78, %o0
	ldx	[%l7 + %o0],	%o3
	andncc	%i6,	%g6,	%l3
	edge16l	%g4,	%l2,	%o2
	fmovsle	%xcc,	%f5,	%f16
	movneg	%icc,	%i1,	%o1
	fnand	%f14,	%f4,	%f6
	alignaddr	%i0,	%i5,	%o4
	subcc	%g7,	%g5,	%g1
	or	%o5,	0x17CC,	%o0
	addc	%l1,	%g2,	%i2
	xor	%i3,	0x1913,	%l4
	fmovdn	%icc,	%f24,	%f28
	movrlez	%l6,	%i4,	%l5
	sir	0x10B9
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	edge16n	%o7,	%l0,	%g3
	smulcc	%o3,	0x1E02,	%i6
	sdiv	%g6,	0x1EF2,	%l3
	movcc	%xcc,	%g4,	%l2
	subcc	%o2,	0x06DD,	%i1
	srlx	%o1,	0x1C,	%i5
	movg	%icc,	%o4,	%i0
	xorcc	%g7,	0x066D,	%g1
	sth	%o5,	[%l7 + 0x18]
	std	%f8,	[%l7 + 0x10]
	xorcc	%o0,	%g5,	%l1
	lduw	[%l7 + 0x7C],	%g2
	andn	%i3,	%i2,	%l4
	sub	%l6,	%l5,	%i4
	ldsb	[%l7 + 0x53],	%i7
	movrlz	%o7,	%o6,	%g3
	smulcc	%o3,	%l0,	%g6
	fpadd32	%f10,	%f26,	%f26
	movrlez	%l3,	%i6,	%g4
	ldsh	[%l7 + 0x0C],	%l2
	edge8	%o2,	%i1,	%i5
	fmovsl	%icc,	%f29,	%f0
	edge16n	%o1,	%i0,	%o4
	fabsd	%f14,	%f24
	xnor	%g7,	%g1,	%o0
	movrne	%g5,	%l1,	%g2
	or	%i3,	0x0590,	%i2
	xorcc	%o5,	0x17B3,	%l6
	fcmpd	%fcc2,	%f30,	%f4
	fmovrslez	%l4,	%f26,	%f10
	array32	%i4,	%l5,	%o7
	fcmple16	%f2,	%f30,	%o6
	movrne	%i7,	0x201,	%g3
	move	%icc,	%l0,	%o3
	fnegs	%f2,	%f20
	restore %g6, %l3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i6,	%o2,	%i1
	fmovd	%f4,	%f16
	mulx	%l2,	%i5,	%o1
	xorcc	%o4,	%i0,	%g1
	array16	%o0,	%g7,	%l1
	stw	%g5,	[%l7 + 0x70]
	std	%f0,	[%l7 + 0x08]
	movcs	%xcc,	%i3,	%g2
	fpsub32s	%f0,	%f23,	%f2
	edge32ln	%i2,	%l6,	%o5
	smul	%i4,	%l5,	%o7
	fnands	%f24,	%f17,	%f30
	array8	%l4,	%i7,	%o6
	ld	[%l7 + 0x1C],	%f11
	edge32l	%l0,	%o3,	%g3
	sth	%g6,	[%l7 + 0x0E]
	subc	%g4,	%i6,	%o2
	fmovrdgz	%l3,	%f12,	%f12
	edge8ln	%l2,	%i5,	%i1
	add	%o4,	%i0,	%o1
	ldx	[%l7 + 0x38],	%o0
	edge8n	%g1,	%g7,	%l1
	umulcc	%i3,	0x1CEA,	%g5
	edge16ln	%i2,	%l6,	%g2
	sllx	%i4,	%o5,	%l5
	movgu	%icc,	%l4,	%o7
	add	%i7,	%l0,	%o6
	lduw	[%l7 + 0x0C],	%o3
	movleu	%icc,	%g3,	%g6
	srlx	%i6,	%g4,	%l3
	edge8	%l2,	%i5,	%o2
	fmovsvs	%xcc,	%f7,	%f5
	fmovrdlz	%i1,	%f2,	%f12
	addcc	%o4,	0x0088,	%i0
	movcc	%xcc,	%o0,	%o1
	ld	[%l7 + 0x0C],	%f2
	movg	%xcc,	%g7,	%l1
	mulscc	%g1,	0x08FB,	%i3
	ld	[%l7 + 0x58],	%f18
	fands	%f28,	%f16,	%f0
	movn	%xcc,	%i2,	%l6
	stx	%g5,	[%l7 + 0x18]
	orn	%g2,	0x1D92,	%o5
	edge16ln	%l5,	%l4,	%i4
	ldsw	[%l7 + 0x34],	%o7
	fmovrde	%i7,	%f22,	%f0
	sub	%o6,	0x015C,	%l0
	addc	%g3,	0x05E6,	%g6
	movcs	%xcc,	%i6,	%g4
	ldsb	[%l7 + 0x31],	%l3
	xnorcc	%l2,	0x0AA8,	%i5
	popc	0x1778,	%o3
	movg	%xcc,	%o2,	%i1
	sdivx	%o4,	0x1125,	%i0
	ldsb	[%l7 + 0x0C],	%o0
	fmovdge	%icc,	%f13,	%f2
	movre	%g7,	%o1,	%l1
	xorcc	%g1,	%i3,	%i2
	movle	%icc,	%l6,	%g2
	fmovdleu	%xcc,	%f12,	%f2
	fmovrdlz	%o5,	%f18,	%f22
	movne	%xcc,	%g5,	%l4
	save %l5, %i4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f14
	subc	%i7,	%l0,	%g3
	fmul8x16au	%f7,	%f28,	%f30
	fandnot1	%f14,	%f20,	%f12
	xnorcc	%g6,	%i6,	%o6
	sub	%l3,	%l2,	%g4
	sir	0x0265
	fmovrdne	%i5,	%f6,	%f6
	fnot2	%f30,	%f18
	ldd	[%l7 + 0x18],	%f24
	alignaddr	%o2,	%i1,	%o3
	fmovsge	%icc,	%f24,	%f21
	sra	%o4,	%o0,	%g7
	andn	%i0,	0x19EF,	%o1
	movrlz	%l1,	0x047,	%g1
	movcc	%icc,	%i2,	%l6
	array32	%i3,	%g2,	%o5
	fpsub32s	%f15,	%f6,	%f18
	lduh	[%l7 + 0x0C],	%g5
	edge16	%l4,	%i4,	%o7
	fmovdcc	%xcc,	%f5,	%f24
	mulscc	%i7,	0x0574,	%l5
	movle	%icc,	%g3,	%l0
	movcs	%icc,	%i6,	%o6
	add	%g6,	%l2,	%g4
	array16	%i5,	%o2,	%i1
	andn	%o3,	0x0F6B,	%l3
	orncc	%o4,	0x19E1,	%g7
	add	%i0,	0x12E7,	%o1
	ldsw	[%l7 + 0x7C],	%l1
	fpadd16s	%f5,	%f23,	%f7
	fmovdl	%xcc,	%f23,	%f10
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	xor	%l6,	0x033C,	%i3
	xorcc	%g2,	0x0C89,	%o5
	movrlz	%o0,	0x1F9,	%l4
	edge16l	%i4,	%g5,	%o7
	move	%xcc,	%l5,	%i7
	fmovrdlez	%l0,	%f16,	%f6
	udivx	%i6,	0x121D,	%o6
	edge32	%g6,	%l2,	%g3
	andncc	%i5,	%g4,	%i1
	movcc	%icc,	%o3,	%o2
	sll	%l3,	%o4,	%g7
	movpos	%icc,	%o1,	%i0
	umul	%g1,	0x1165,	%i2
	std	%f10,	[%l7 + 0x50]
	fnands	%f9,	%f6,	%f25
	fpadd32s	%f17,	%f20,	%f6
	udivx	%l6,	0x1446,	%l1
	sth	%i3,	[%l7 + 0x68]
	edge16n	%o5,	%o0,	%g2
	movcc	%xcc,	%i4,	%l4
	movrne	%o7,	%g5,	%i7
	fmuld8ulx16	%f11,	%f7,	%f16
	movrgz	%l0,	%l5,	%o6
	smul	%g6,	0x0995,	%l2
	movcc	%icc,	%g3,	%i5
	fmovdge	%icc,	%f7,	%f25
	subc	%i6,	0x02C1,	%g4
	fmovrdne	%i1,	%f2,	%f26
	edge32	%o3,	%o2,	%l3
	array16	%o4,	%o1,	%i0
	std	%f6,	[%l7 + 0x58]
	ldd	[%l7 + 0x68],	%g0
	fnor	%f8,	%f10,	%f0
	andn	%g7,	0x0365,	%i2
	std	%f12,	[%l7 + 0x20]
	fornot2s	%f25,	%f7,	%f26
	sll	%l1,	%i3,	%o5
	lduw	[%l7 + 0x78],	%o0
	save %l6, 0x1407, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f10,	%f18
	fmuld8sux16	%f19,	%f21,	%f18
	or	%l4,	0x08E7,	%o7
	movvs	%xcc,	%g2,	%g5
	move	%xcc,	%l0,	%l5
	edge32n	%i7,	%g6,	%l2
	fmul8x16	%f13,	%f0,	%f2
	udivx	%o6,	0x133C,	%i5
	orncc	%i6,	%g3,	%i1
	ldd	[%l7 + 0x58],	%f24
	fmovrslz	%o3,	%f4,	%f31
	udiv	%g4,	0x00CA,	%o2
	smul	%l3,	%o1,	%i0
	addccc	%g1,	0x0CAC,	%g7
	save %o4, 0x10E0, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i3,	%o5,	%i2
	addc	%l6,	%o0,	%i4
	movrlz	%o7,	%g2,	%g5
	fpsub16s	%f23,	%f9,	%f16
	stb	%l0,	[%l7 + 0x2C]
	ldsb	[%l7 + 0x69],	%l5
	ldsw	[%l7 + 0x5C],	%l4
	and	%i7,	0x1EFB,	%g6
	fmovrdgz	%o6,	%f20,	%f20
	subc	%l2,	0x1403,	%i5
	movn	%xcc,	%g3,	%i6
	ldx	[%l7 + 0x18],	%i1
	edge16n	%g4,	%o2,	%l3
	sra	%o1,	0x17,	%i0
	orcc	%o3,	0x0451,	%g1
	movcc	%xcc,	%o4,	%g7
	movne	%xcc,	%l1,	%i3
	fmovsn	%xcc,	%f0,	%f15
	edge8l	%i2,	%l6,	%o0
	xnorcc	%i4,	%o7,	%g2
	fcmple16	%f2,	%f6,	%o5
	fabsd	%f28,	%f26
	pdist	%f10,	%f28,	%f8
	move	%xcc,	%l0,	%l5
	movcs	%icc,	%l4,	%i7
	movrgez	%g5,	0x2DA,	%o6
	smul	%g6,	%i5,	%g3
	orcc	%i6,	%i1,	%g4
	array32	%o2,	%l2,	%l3
	andncc	%o1,	%i0,	%g1
	ldub	[%l7 + 0x3D],	%o3
	ldx	[%l7 + 0x70],	%o4
	ldsw	[%l7 + 0x6C],	%g7
	movleu	%xcc,	%i3,	%i2
	st	%f5,	[%l7 + 0x7C]
	andn	%l6,	%o0,	%l1
	srlx	%o7,	0x14,	%g2
	movrne	%i4,	0x081,	%o5
	subccc	%l0,	0x16A5,	%l4
	fmovsl	%icc,	%f27,	%f7
	subcc	%l5,	0x0269,	%g5
	movrgz	%i7,	0x115,	%g6
	xnor	%o6,	%g3,	%i6
	addccc	%i5,	%i1,	%g4
	fornot1s	%f12,	%f25,	%f25
	andn	%l2,	0x1EED,	%l3
	ldx	[%l7 + 0x68],	%o2
	edge16ln	%i0,	%o1,	%g1
	sethi	0x1E2B,	%o4
	stw	%g7,	[%l7 + 0x4C]
	udivx	%o3,	0x04F1,	%i3
	stb	%l6,	[%l7 + 0x0E]
	xnorcc	%o0,	0x1EFB,	%i2
	sll	%l1,	0x15,	%g2
	sdivcc	%i4,	0x042B,	%o7
	movl	%icc,	%l0,	%l4
	movgu	%icc,	%l5,	%g5
	ldsb	[%l7 + 0x53],	%o5
	fmovspos	%xcc,	%f17,	%f1
	movgu	%icc,	%i7,	%g6
	fmovsvs	%icc,	%f7,	%f1
	movneg	%xcc,	%g3,	%o6
	fcmpd	%fcc1,	%f2,	%f30
	ldsw	[%l7 + 0x14],	%i6
	restore %i1, %g4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l3,	%o2,	%i0
	nop
	set	0x2E, %i3
	lduh	[%l7 + %i3],	%o1
	sra	%g1,	%o4,	%g7
	sdivx	%o3,	0x15FE,	%i3
	movpos	%icc,	%l2,	%l6
	subccc	%o0,	%l1,	%g2
	movle	%icc,	%i4,	%o7
	fmovrdlez	%l0,	%f16,	%f30
	fmovrdne	%i2,	%f6,	%f16
	mulscc	%l4,	0x1820,	%g5
	addcc	%l5,	0x019B,	%i7
	fornot1s	%f18,	%f0,	%f14
	subcc	%o5,	0x0C09,	%g3
	addccc	%o6,	0x0188,	%i6
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	orcc	%l3,	0x0C3D,	%i5
	mulscc	%i0,	%o2,	%o1
	movvs	%xcc,	%o4,	%g7
	sra	%o3,	0x0E,	%i3
	st	%f9,	[%l7 + 0x50]
	bshuffle	%f14,	%f24,	%f30
	sllx	%l2,	0x16,	%l6
	ldsb	[%l7 + 0x59],	%g1
	edge32n	%l1,	%o0,	%i4
	edge16ln	%o7,	%g2,	%l0
	popc	%i2,	%g5
	sll	%l4,	%l5,	%i7
	sir	0x16AE
	movcc	%icc,	%g3,	%o6
	fmovdvs	%xcc,	%f2,	%f9
	movrne	%i6,	%g6,	%i1
	array16	%o5,	%l3,	%g4
	smulcc	%i5,	%i0,	%o2
	addccc	%o1,	0x1348,	%o4
	srlx	%g7,	%o3,	%i3
	or	%l2,	%g1,	%l1
	nop
	set	0x50, %o3
	ldx	[%l7 + %o3],	%o0
	movcc	%icc,	%i4,	%l6
	ldd	[%l7 + 0x18],	%f6
	fmovsn	%icc,	%f17,	%f31
	std	%f28,	[%l7 + 0x70]
	fnor	%f26,	%f28,	%f16
	edge32n	%g2,	%l0,	%o7
	lduh	[%l7 + 0x2E],	%i2
	edge8n	%l4,	%g5,	%l5
	movle	%xcc,	%g3,	%o6
	sll	%i6,	0x0B,	%i7
	fpsub16	%f4,	%f18,	%f24
	ld	[%l7 + 0x40],	%f24
	fsrc2	%f0,	%f22
	fmovscs	%xcc,	%f18,	%f24
	and	%i1,	%o5,	%l3
	st	%f10,	[%l7 + 0x08]
	array8	%g6,	%i5,	%i0
	edge8ln	%o2,	%o1,	%o4
	movrgz	%g4,	0x13E,	%g7
	alignaddrl	%o3,	%l2,	%i3
	xnor	%g1,	0x19D0,	%o0
	movrne	%l1,	%l6,	%g2
	fornot2s	%f14,	%f10,	%f9
	fcmpgt32	%f24,	%f18,	%l0
	stx	%o7,	[%l7 + 0x60]
	fmovsge	%xcc,	%f27,	%f10
	smul	%i2,	%l4,	%g5
	fmovrse	%l5,	%f0,	%f11
	or	%g3,	%o6,	%i6
	alignaddr	%i4,	%i7,	%o5
	movneg	%icc,	%i1,	%g6
	stb	%l3,	[%l7 + 0x21]
	andncc	%i0,	%i5,	%o2
	mulscc	%o1,	0x1353,	%g4
	fpsub16	%f12,	%f28,	%f10
	edge16n	%g7,	%o3,	%l2
	fxors	%f5,	%f9,	%f7
	xorcc	%o4,	%g1,	%o0
	save %i3, 0x171D, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%l6,	%g2
	nop
	set	0x22, %l4
	ldsh	[%l7 + %l4],	%l0
	movneg	%icc,	%i2,	%l4
	nop
	set	0x0C, %l3
	sth	%g5,	[%l7 + %l3]
	orcc	%l5,	0x0673,	%o7
	lduh	[%l7 + 0x1E],	%o6
	movneg	%xcc,	%g3,	%i6
	ldd	[%l7 + 0x28],	%f24
	array8	%i4,	%o5,	%i7
	stx	%i1,	[%l7 + 0x68]
	edge8l	%l3,	%i0,	%g6
	fmovrdgz	%i5,	%f22,	%f20
	edge8n	%o1,	%g4,	%g7
	movvs	%xcc,	%o3,	%o2
	fmovrdlez	%l2,	%f12,	%f26
	fcmpd	%fcc0,	%f16,	%f12
	restore %g1, 0x1CE3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x6E, %o5
	sth	%o0,	[%l7 + %o5]
	sub	%l1,	%l6,	%i3
	movgu	%xcc,	%g2,	%i2
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	andcc	%l5,	0x0B04,	%o6
	or	%g3,	%i6,	%i4
	and	%o7,	%o5,	%i1
	orncc	%l3,	%i7,	%g6
	fmuld8sux16	%f23,	%f23,	%f22
	movvc	%xcc,	%i0,	%i5
	ldsw	[%l7 + 0x10],	%g4
	movle	%icc,	%g7,	%o1
	movleu	%xcc,	%o2,	%l2
	movrgez	%o3,	%o4,	%o0
	srl	%g1,	%l1,	%l6
	stx	%i3,	[%l7 + 0x10]
	movvs	%icc,	%g2,	%l4
	sub	%l0,	%g5,	%i2
	andcc	%o6,	%g3,	%i6
	edge32n	%i4,	%l5,	%o7
	stw	%i1,	[%l7 + 0x20]
	alignaddr	%l3,	%o5,	%g6
	fmul8x16al	%f4,	%f3,	%f28
	srax	%i0,	%i5,	%i7
	fone	%f30
	andcc	%g7,	%g4,	%o1
	movrgez	%l2,	%o2,	%o3
	movleu	%xcc,	%o4,	%g1
	movpos	%xcc,	%l1,	%o0
	udiv	%l6,	0x0D06,	%i3
	fmovd	%f30,	%f4
	movneg	%xcc,	%g2,	%l4
	movcc	%xcc,	%g5,	%l0
	array8	%o6,	%i2,	%i6
	fcmped	%fcc3,	%f20,	%f6
	addccc	%i4,	%l5,	%g3
	std	%f2,	[%l7 + 0x58]
	sra	%o7,	%l3,	%i1
	bshuffle	%f22,	%f22,	%f26
	movle	%icc,	%g6,	%i0
	sll	%o5,	0x13,	%i5
	xnorcc	%g7,	%i7,	%g4
	nop
	set	0x38, %g6
	ldx	[%l7 + %g6],	%o1
	edge32n	%l2,	%o3,	%o2
	edge16ln	%g1,	%l1,	%o0
	movrlz	%o4,	%i3,	%g2
	srlx	%l6,	%g5,	%l0
	std	%f18,	[%l7 + 0x30]
	addc	%l4,	%i2,	%i6
	edge32ln	%o6,	%l5,	%g3
	fnor	%f30,	%f6,	%f20
	fands	%f13,	%f22,	%f10
	movvc	%xcc,	%o7,	%i4
	subcc	%i1,	%g6,	%l3
	addc	%i0,	0x043C,	%o5
	udivcc	%g7,	0x09F3,	%i7
	fnors	%f7,	%f16,	%f10
	ldsw	[%l7 + 0x5C],	%i5
	srl	%g4,	0x19,	%o1
	edge32	%o3,	%o2,	%g1
	nop
	set	0x7C, %o1
	lduw	[%l7 + %o1],	%l1
	movneg	%icc,	%o0,	%o4
	sdivcc	%i3,	0x04C9,	%l2
	umul	%l6,	0x14B4,	%g5
	movleu	%icc,	%g2,	%l4
	sllx	%i2,	%i6,	%l0
	fmovsl	%xcc,	%f15,	%f15
	stw	%o6,	[%l7 + 0x38]
	udiv	%g3,	0x1C73,	%o7
	smul	%i4,	%i1,	%g6
	fnot1s	%f9,	%f2
	or	%l3,	0x1A90,	%l5
	fmovrslez	%o5,	%f1,	%f12
	fmovdl	%xcc,	%f19,	%f3
	fmovsn	%icc,	%f9,	%f29
	orn	%i0,	0x0827,	%i7
	sir	0x18B3
	movg	%xcc,	%i5,	%g4
	ldx	[%l7 + 0x40],	%g7
	edge32l	%o1,	%o3,	%g1
	xnorcc	%l1,	0x0352,	%o0
	ldsw	[%l7 + 0x08],	%o2
	sth	%o4,	[%l7 + 0x28]
	alignaddrl	%l2,	%l6,	%g5
	movne	%xcc,	%i3,	%l4
	subcc	%i2,	0x0D37,	%g2
	array32	%i6,	%o6,	%g3
	movg	%xcc,	%o7,	%i4
	fmovdneg	%xcc,	%f11,	%f7
	edge8n	%i1,	%l0,	%g6
	smulcc	%l3,	%l5,	%i0
	fnot1	%f26,	%f12
	fandnot2s	%f3,	%f10,	%f0
	popc	0x15C4,	%i7
	move	%xcc,	%o5,	%i5
	orcc	%g4,	0x0055,	%g7
	fnot1s	%f23,	%f11
	sir	0x0E73
	sll	%o1,	0x1A,	%g1
	fand	%f26,	%f14,	%f14
	ldsw	[%l7 + 0x44],	%l1
	subc	%o3,	%o0,	%o2
	fmovrslz	%o4,	%f8,	%f29
	movn	%xcc,	%l2,	%l6
	fmovspos	%icc,	%f16,	%f12
	ldsw	[%l7 + 0x68],	%g5
	srl	%l4,	%i2,	%i3
	fmovsle	%xcc,	%f18,	%f8
	edge16n	%g2,	%o6,	%i6
	fpsub16s	%f9,	%f28,	%f23
	fornot2s	%f30,	%f18,	%f4
	mulscc	%g3,	0x0AB1,	%o7
	sll	%i4,	%l0,	%g6
	mulx	%i1,	0x19B7,	%l5
	fcmpd	%fcc1,	%f28,	%f10
	edge16	%l3,	%i0,	%o5
	sth	%i5,	[%l7 + 0x08]
	fands	%f31,	%f2,	%f7
	fmovrdgz	%i7,	%f30,	%f10
	array8	%g7,	%o1,	%g1
	edge32n	%g4,	%o3,	%l1
	fand	%f20,	%f8,	%f18
	edge32	%o2,	%o4,	%o0
	fmul8x16au	%f2,	%f13,	%f4
	fnegs	%f15,	%f9
	fmovdcc	%icc,	%f27,	%f19
	stb	%l2,	[%l7 + 0x6F]
	mulscc	%g5,	%l4,	%i2
	ldub	[%l7 + 0x09],	%l6
	fmovrde	%g2,	%f2,	%f4
	sth	%o6,	[%l7 + 0x7E]
	fsrc1	%f14,	%f8
	fmul8sux16	%f12,	%f2,	%f12
	ldsb	[%l7 + 0x56],	%i3
	movle	%xcc,	%i6,	%o7
	stb	%g3,	[%l7 + 0x68]
	andn	%l0,	0x1FEB,	%i4
	ldsw	[%l7 + 0x34],	%i1
	ldd	[%l7 + 0x78],	%g6
	edge32l	%l5,	%i0,	%o5
	movl	%xcc,	%i5,	%l3
	fpadd32s	%f31,	%f16,	%f10
	movleu	%xcc,	%g7,	%i7
	ldx	[%l7 + 0x68],	%g1
	fmovsgu	%xcc,	%f14,	%f10
	sdivx	%o1,	0x1E6D,	%o3
	srax	%l1,	%o2,	%g4
	alignaddrl	%o4,	%o0,	%l2
	movleu	%icc,	%l4,	%g5
	movrgz	%i2,	%l6,	%o6
	move	%icc,	%g2,	%i6
	sdiv	%i3,	0x100E,	%g3
	edge32	%o7,	%l0,	%i1
	movrgez	%i4,	%g6,	%l5
	sll	%o5,	0x07,	%i5
	orcc	%l3,	%i0,	%i7
	edge8l	%g7,	%g1,	%o1
	movre	%l1,	%o2,	%o3
	array8	%g4,	%o0,	%l2
	fand	%f0,	%f26,	%f16
	mulscc	%l4,	%g5,	%o4
	sir	0x1156
	fmovrsgez	%l6,	%f18,	%f3
	smulcc	%o6,	0x0B6A,	%i2
	addc	%i6,	0x1708,	%g2
	edge16l	%g3,	%i3,	%l0
	movg	%icc,	%i1,	%o7
	orcc	%g6,	%i4,	%l5
	movleu	%xcc,	%o5,	%i5
	sth	%i0,	[%l7 + 0x68]
	sdivx	%l3,	0x0348,	%i7
	fmovrsne	%g1,	%f10,	%f20
	umulcc	%o1,	%g7,	%l1
	movre	%o3,	0x3A7,	%o2
	edge16	%o0,	%g4,	%l4
	alignaddrl	%l2,	%g5,	%o4
	fcmpd	%fcc3,	%f0,	%f26
	umulcc	%l6,	0x0208,	%i2
	movleu	%icc,	%i6,	%g2
	movleu	%xcc,	%o6,	%i3
	std	%f16,	[%l7 + 0x40]
	movrgz	%g3,	%l0,	%i1
	edge16ln	%o7,	%g6,	%l5
	array8	%o5,	%i5,	%i4
	fpadd16	%f16,	%f6,	%f12
	orn	%i0,	%l3,	%g1
	fandnot2s	%f12,	%f29,	%f30
	movn	%xcc,	%i7,	%g7
	fpmerge	%f25,	%f20,	%f16
	fcmpd	%fcc3,	%f18,	%f2
	udiv	%o1,	0x0D6A,	%o3
	edge32ln	%l1,	%o0,	%g4
	ldsw	[%l7 + 0x40],	%o2
	smul	%l2,	%g5,	%l4
	fnot1	%f4,	%f2
	edge16ln	%l6,	%i2,	%o4
	movneg	%xcc,	%i6,	%g2
	andn	%o6,	%g3,	%i3
	orn	%l0,	%o7,	%i1
	fcmpgt32	%f24,	%f2,	%l5
	lduw	[%l7 + 0x50],	%o5
	fmovsleu	%icc,	%f8,	%f20
	fcmpd	%fcc0,	%f2,	%f22
	sub	%i5,	0x194B,	%g6
	ldsb	[%l7 + 0x3E],	%i0
	st	%f2,	[%l7 + 0x4C]
	ldd	[%l7 + 0x20],	%l2
	mulscc	%i4,	0x0A22,	%i7
	sub	%g7,	%g1,	%o1
	move	%xcc,	%l1,	%o0
	fandnot2	%f22,	%f4,	%f14
	udiv	%g4,	0x0391,	%o3
	movcc	%icc,	%o2,	%l2
	ld	[%l7 + 0x48],	%f22
	popc	0x1AC8,	%l4
	fands	%f7,	%f27,	%f24
	ldub	[%l7 + 0x29],	%g5
	fmovsgu	%icc,	%f30,	%f7
	fnot2s	%f13,	%f15
	mova	%icc,	%i2,	%l6
	fnot2	%f30,	%f18
	subc	%o4,	0x0D59,	%g2
	fmovsa	%xcc,	%f16,	%f0
	subcc	%i6,	0x1D99,	%g3
	addcc	%o6,	0x04DA,	%l0
	andn	%o7,	0x1B1D,	%i3
	movneg	%icc,	%l5,	%o5
	movre	%i1,	0x0BB,	%g6
	movgu	%icc,	%i0,	%l3
	udiv	%i4,	0x04FD,	%i5
	mova	%icc,	%g7,	%i7
	movvc	%icc,	%g1,	%o1
	subccc	%l1,	%o0,	%o3
	movl	%xcc,	%g4,	%l2
	fmovse	%icc,	%f0,	%f10
	sll	%l4,	%g5,	%o2
	umulcc	%i2,	%o4,	%l6
	movn	%icc,	%g2,	%i6
	movleu	%xcc,	%g3,	%o6
	fnot1	%f30,	%f8
	edge16	%o7,	%l0,	%l5
	addcc	%o5,	%i3,	%i1
	fsrc1	%f8,	%f8
	sll	%g6,	0x0C,	%l3
	ldd	[%l7 + 0x08],	%i4
	movrgez	%i0,	0x33C,	%g7
	movge	%xcc,	%i7,	%i5
	save %o1, 0x0333, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l1,	%o0,	%o3
	ldsb	[%l7 + 0x58],	%l2
	sdivx	%g4,	0x084F,	%g5
	movleu	%xcc,	%o2,	%l4
	xor	%o4,	%l6,	%i2
	edge32ln	%i6,	%g3,	%o6
	movre	%o7,	0x04E,	%l0
	popc	%g2,	%l5
	fmovrsgez	%o5,	%f16,	%f15
	edge8n	%i3,	%g6,	%l3
	faligndata	%f6,	%f16,	%f0
	stw	%i4,	[%l7 + 0x20]
	lduw	[%l7 + 0x10],	%i0
	alignaddr	%g7,	%i1,	%i5
	save %o1, %g1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i7,	0x1752,	%o0
	fpadd16	%f8,	%f12,	%f18
	srlx	%l2,	%o3,	%g4
	sub	%o2,	0x0120,	%l4
	edge32n	%g5,	%l6,	%i2
	sra	%o4,	0x06,	%i6
	smul	%o6,	0x17CE,	%o7
	movvc	%icc,	%l0,	%g3
	and	%g2,	0x1881,	%o5
	xnorcc	%l5,	0x1D20,	%g6
	sub	%i3,	0x021E,	%l3
	ldub	[%l7 + 0x63],	%i4
	movn	%xcc,	%i0,	%g7
	fmovspos	%xcc,	%f17,	%f3
	movle	%icc,	%i5,	%i1
	subccc	%o1,	0x02C6,	%l1
	fmovrslez	%g1,	%f15,	%f20
	fmovdcc	%icc,	%f22,	%f28
	umul	%i7,	0x1980,	%o0
	udivx	%o3,	0x11A3,	%g4
	fmovsle	%icc,	%f10,	%f29
	andn	%l2,	0x112B,	%o2
	fandnot2	%f26,	%f22,	%f16
	sllx	%g5,	0x13,	%l6
	movgu	%icc,	%l4,	%o4
	movl	%icc,	%i6,	%o6
	fmovrsgez	%i2,	%f23,	%f15
	fpack32	%f0,	%f4,	%f30
	movcs	%icc,	%o7,	%l0
	movpos	%xcc,	%g3,	%g2
	smul	%l5,	0x0B05,	%g6
	movne	%xcc,	%i3,	%o5
	andn	%i4,	0x095D,	%l3
	ldx	[%l7 + 0x08],	%i0
	ldd	[%l7 + 0x70],	%i4
	fpadd32	%f22,	%f22,	%f28
	movvc	%icc,	%g7,	%i1
	movge	%icc,	%o1,	%l1
	sdivcc	%i7,	0x1931,	%g1
	fmovdge	%icc,	%f22,	%f12
	edge8	%o3,	%o0,	%l2
	movcc	%icc,	%g4,	%g5
	fnot2	%f30,	%f18
	for	%f30,	%f8,	%f28
	orcc	%o2,	%l4,	%o4
	stb	%l6,	[%l7 + 0x66]
	srax	%i6,	%i2,	%o7
	stb	%o6,	[%l7 + 0x36]
	movleu	%xcc,	%g3,	%g2
	edge32	%l0,	%l5,	%g6
	stw	%i3,	[%l7 + 0x74]
	movvc	%icc,	%o5,	%i4
	sdivcc	%l3,	0x05F6,	%i0
	addc	%g7,	%i1,	%i5
	movcs	%xcc,	%o1,	%l1
	movcs	%icc,	%i7,	%o3
	andncc	%g1,	%l2,	%o0
	ldub	[%l7 + 0x11],	%g4
	subccc	%o2,	%g5,	%l4
	fexpand	%f0,	%f28
	movg	%icc,	%l6,	%i6
	edge16ln	%o4,	%o7,	%o6
	fsrc1s	%f23,	%f20
	movpos	%icc,	%i2,	%g2
	edge16ln	%l0,	%l5,	%g3
	smulcc	%i3,	%o5,	%i4
	st	%f1,	[%l7 + 0x30]
	andn	%g6,	0x01CA,	%i0
	fmovrse	%g7,	%f2,	%f26
	movleu	%icc,	%i1,	%l3
	fcmpne16	%f20,	%f16,	%i5
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f8
	udiv	%o1,	0x0C51,	%i7
	nop
	set	0x23, %l5
	stb	%l1,	[%l7 + %l5]
	move	%icc,	%o3,	%g1
	sdiv	%l2,	0x05C1,	%o0
	sllx	%g4,	0x0E,	%g5
	edge32n	%l4,	%l6,	%o2
	addc	%o4,	%i6,	%o6
	fxnor	%f4,	%f12,	%f28
	sir	0x1B8A
	orncc	%o7,	%i2,	%g2
	ld	[%l7 + 0x08],	%f9
	movcc	%icc,	%l0,	%l5
	mova	%icc,	%g3,	%i3
	fandnot1	%f10,	%f0,	%f12
	fmovrdne	%i4,	%f22,	%f16
	movrgz	%g6,	0x119,	%o5
	mova	%xcc,	%i0,	%g7
	subc	%i1,	%l3,	%i5
	ldx	[%l7 + 0x60],	%i7
	movl	%icc,	%l1,	%o3
	fcmped	%fcc2,	%f8,	%f18
	ldd	[%l7 + 0x08],	%f8
	fxnor	%f12,	%f6,	%f22
	xnor	%g1,	%l2,	%o1
	fands	%f4,	%f31,	%f5
	ldd	[%l7 + 0x28],	%f6
	movl	%icc,	%o0,	%g4
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%f24
	fexpand	%f26,	%f2
	edge32l	%l4,	%l6,	%o2
	stw	%o4,	[%l7 + 0x54]
	fcmpgt16	%f14,	%f22,	%i6
	edge16n	%o6,	%g5,	%o7
	movneg	%xcc,	%g2,	%l0
	ld	[%l7 + 0x20],	%f4
	sth	%l5,	[%l7 + 0x28]
	mulscc	%i2,	%i3,	%i4
	and	%g3,	0x00BB,	%g6
	edge8	%o5,	%g7,	%i1
	fcmpd	%fcc2,	%f20,	%f26
	and	%i0,	%i5,	%l3
	andcc	%l1,	0x1611,	%o3
	movrlez	%i7,	%g1,	%l2
	movneg	%icc,	%o1,	%o0
	udivcc	%l4,	0x1DE0,	%l6
	fmul8sux16	%f12,	%f30,	%f28
	edge16n	%g4,	%o4,	%i6
	fmovrse	%o2,	%f0,	%f5
	stb	%g5,	[%l7 + 0x4F]
	sllx	%o7,	0x03,	%o6
	movle	%icc,	%l0,	%l5
	fzero	%f0
	fpackfix	%f4,	%f2
	fmovsgu	%icc,	%f1,	%f5
	addc	%i2,	%g2,	%i3
	edge32l	%i4,	%g6,	%g3
	lduh	[%l7 + 0x6C],	%o5
	alignaddr	%g7,	%i0,	%i5
	fands	%f28,	%f24,	%f6
	fcmple32	%f14,	%f6,	%l3
	umul	%l1,	0x1FCB,	%i1
	andn	%i7,	%g1,	%l2
	st	%f1,	[%l7 + 0x3C]
	fors	%f20,	%f30,	%f25
	edge8	%o1,	%o3,	%l4
	subc	%l6,	%g4,	%o4
	stb	%i6,	[%l7 + 0x36]
	sethi	0x04F0,	%o2
	edge16l	%g5,	%o0,	%o7
	fmovsge	%xcc,	%f19,	%f30
	udiv	%l0,	0x1E45,	%l5
	movrgez	%o6,	%i2,	%i3
	movneg	%icc,	%g2,	%g6
	fnors	%f22,	%f1,	%f17
	mova	%xcc,	%g3,	%i4
	movrgz	%g7,	0x08E,	%i0
	stw	%i5,	[%l7 + 0x64]
	movrlz	%l3,	0x192,	%l1
	xnor	%i1,	0x09E2,	%i7
	fsrc1	%f28,	%f18
	edge32n	%o5,	%g1,	%o1
	addc	%l2,	0x0108,	%l4
	fpmerge	%f15,	%f10,	%f8
	fmul8ulx16	%f22,	%f2,	%f16
	movneg	%icc,	%l6,	%o3
	edge8	%g4,	%i6,	%o2
	fmovdvc	%xcc,	%f27,	%f25
	xor	%o4,	0x0E14,	%g5
	fsrc1	%f12,	%f16
	xorcc	%o0,	0x1370,	%l0
	fandnot2	%f22,	%f16,	%f24
	fmovrde	%l5,	%f30,	%f28
	save %o7, 0x026C, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o6,	%i3
	edge8l	%g2,	%g3,	%g6
	smulcc	%g7,	0x1A40,	%i0
	edge16l	%i4,	%i5,	%l3
	lduw	[%l7 + 0x68],	%i1
	fmovdpos	%xcc,	%f19,	%f21
	andcc	%i7,	0x189B,	%o5
	fmovdvc	%xcc,	%f17,	%f20
	ldub	[%l7 + 0x15],	%l1
	srl	%o1,	%g1,	%l2
	srlx	%l6,	%o3,	%l4
	mulx	%g4,	0x1EB5,	%i6
	movgu	%icc,	%o2,	%g5
	bshuffle	%f12,	%f0,	%f22
	sdiv	%o4,	0x0BB1,	%o0
	movvs	%xcc,	%l5,	%o7
	fmovdcs	%xcc,	%f3,	%f1
	movn	%icc,	%l0,	%i2
	edge32ln	%o6,	%g2,	%i3
	ldsw	[%l7 + 0x78],	%g3
	xorcc	%g7,	%i0,	%i4
	sra	%i5,	%l3,	%i1
	xor	%g6,	0x0EC3,	%i7
	umul	%l1,	%o1,	%o5
	ldub	[%l7 + 0x74],	%l2
	array16	%g1,	%o3,	%l6
	ldsh	[%l7 + 0x46],	%g4
	smul	%i6,	0x00C2,	%l4
	fexpand	%f25,	%f12
	sth	%g5,	[%l7 + 0x74]
	sub	%o4,	0x092C,	%o2
	orcc	%l5,	0x04FC,	%o7
	orcc	%l0,	0x19AF,	%i2
	mulscc	%o0,	0x1A77,	%o6
	edge8	%i3,	%g3,	%g2
	save %i0, 0x1D65, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i4,	%l3,	%i5
	sdivx	%i1,	0x179B,	%i7
	fsrc1s	%f3,	%f15
	udiv	%g6,	0x0847,	%o1
	sdiv	%l1,	0x0262,	%o5
	alignaddrl	%l2,	%g1,	%o3
	subc	%l6,	0x0B25,	%i6
	fmovdgu	%xcc,	%f21,	%f15
	movgu	%icc,	%g4,	%g5
	fsrc2	%f12,	%f20
	siam	0x2
	mulscc	%o4,	%o2,	%l4
	nop
	set	0x64, %i5
	ldsb	[%l7 + %i5],	%l5
	fnot2	%f26,	%f26
	fcmpgt16	%f26,	%f2,	%l0
	stb	%o7,	[%l7 + 0x2F]
	movrgz	%i2,	0x19E,	%o6
	movn	%icc,	%i3,	%g3
	ldub	[%l7 + 0x57],	%o0
	lduw	[%l7 + 0x7C],	%g2
	fmovdle	%xcc,	%f30,	%f10
	sdivcc	%i0,	0x1926,	%g7
	fmovsge	%xcc,	%f24,	%f12
	edge16l	%l3,	%i5,	%i1
	sir	0x03D2
	array16	%i7,	%i4,	%g6
	ldd	[%l7 + 0x30],	%f22
	fornot2s	%f29,	%f15,	%f22
	fpsub16s	%f28,	%f24,	%f19
	srax	%l1,	0x17,	%o1
	andncc	%o5,	%g1,	%o3
	movpos	%icc,	%l2,	%i6
	srl	%g4,	%g5,	%o4
	ldub	[%l7 + 0x63],	%l6
	fnot2	%f8,	%f30
	restore %o2, %l4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f2,	%f6,	%f24
	fmovdn	%xcc,	%f28,	%f26
	ldd	[%l7 + 0x68],	%o6
	edge8l	%l0,	%i2,	%o6
	lduh	[%l7 + 0x74],	%g3
	fcmpd	%fcc2,	%f26,	%f24
	edge32l	%i3,	%o0,	%i0
	fmul8sux16	%f20,	%f2,	%f18
	andcc	%g7,	%l3,	%i5
	movre	%g2,	0x3A5,	%i1
	edge8	%i4,	%g6,	%l1
	fmovdn	%icc,	%f1,	%f0
	fmovse	%icc,	%f19,	%f25
	xnorcc	%i7,	%o1,	%o5
	movg	%xcc,	%g1,	%l2
	fsrc2s	%f8,	%f31
	stb	%i6,	[%l7 + 0x67]
	fmovdleu	%xcc,	%f30,	%f14
	fmul8x16	%f10,	%f18,	%f0
	fmovsn	%xcc,	%f29,	%f8
	fmul8sux16	%f2,	%f0,	%f22
	xnor	%o3,	0x1AC8,	%g4
	sra	%o4,	0x1B,	%l6
	edge8l	%o2,	%l4,	%l5
	srlx	%g5,	%l0,	%i2
	sll	%o6,	%g3,	%i3
	mulx	%o7,	%o0,	%i0
	addcc	%g7,	%l3,	%g2
	andcc	%i1,	%i4,	%g6
	srax	%l1,	0x1C,	%i5
	xnorcc	%o1,	0x1247,	%o5
	movgu	%icc,	%i7,	%g1
	andcc	%l2,	%i6,	%g4
	fmovsa	%xcc,	%f18,	%f10
	movg	%icc,	%o3,	%l6
	movvc	%icc,	%o2,	%l4
	ld	[%l7 + 0x0C],	%f11
	edge32	%l5,	%o4,	%g5
	siam	0x6
	edge16ln	%l0,	%i2,	%g3
	edge8	%o6,	%i3,	%o7
	andncc	%i0,	%g7,	%o0
	movg	%icc,	%l3,	%i1
	movrlez	%i4,	%g2,	%l1
	fmovrdgz	%i5,	%f12,	%f16
	fmovrde	%o1,	%f22,	%f20
	movn	%icc,	%g6,	%o5
	edge8	%g1,	%l2,	%i6
	fcmpne16	%f4,	%f10,	%i7
	and	%g4,	%l6,	%o3
	stb	%l4,	[%l7 + 0x69]
	fpsub32s	%f3,	%f14,	%f24
	fcmpgt16	%f28,	%f28,	%o2
	fcmple32	%f28,	%f10,	%l5
	fors	%f2,	%f20,	%f11
	stx	%g5,	[%l7 + 0x28]
	alignaddrl	%l0,	%o4,	%i2
	fmovsn	%xcc,	%f19,	%f8
	fxors	%f17,	%f17,	%f28
	movre	%o6,	0x3C9,	%i3
	edge8l	%o7,	%g3,	%g7
	edge32ln	%o0,	%i0,	%l3
	addcc	%i4,	0x0D31,	%i1
	addcc	%g2,	0x1E0D,	%i5
	movle	%icc,	%l1,	%g6
	srlx	%o5,	0x1B,	%o1
	movpos	%icc,	%g1,	%i6
	mova	%icc,	%i7,	%l2
	edge8n	%l6,	%g4,	%l4
	ld	[%l7 + 0x30],	%f15
	edge32	%o2,	%o3,	%l5
	fandnot2s	%f7,	%f31,	%f10
	and	%g5,	%l0,	%o4
	fmovdne	%xcc,	%f17,	%f22
	fmul8x16au	%f13,	%f9,	%f10
	lduh	[%l7 + 0x48],	%i2
	ld	[%l7 + 0x6C],	%f2
	nop
	set	0x5A, %i4
	sth	%o6,	[%l7 + %i4]
	move	%icc,	%i3,	%g3
	edge16l	%o7,	%g7,	%i0
	ldsh	[%l7 + 0x30],	%l3
	movn	%xcc,	%i4,	%i1
	sub	%g2,	0x0748,	%i5
	fxor	%f22,	%f24,	%f0
	fmul8x16	%f31,	%f22,	%f6
	fpackfix	%f24,	%f4
	movneg	%xcc,	%l1,	%g6
	srlx	%o0,	0x12,	%o5
	ldd	[%l7 + 0x78],	%f2
	mulscc	%g1,	%o1,	%i7
	alignaddr	%l2,	%i6,	%g4
	addccc	%l4,	%l6,	%o2
	nop
	set	0x48, %g5
	lduh	[%l7 + %g5],	%o3
	fmovrdgz	%g5,	%f16,	%f0
	array8	%l0,	%o4,	%i2
	edge8n	%o6,	%l5,	%g3
	sra	%o7,	%i3,	%g7
	addccc	%i0,	%i4,	%i1
	st	%f7,	[%l7 + 0x38]
	fone	%f18
	fnot1s	%f11,	%f29
	fmul8x16al	%f31,	%f24,	%f20
	movl	%xcc,	%g2,	%l3
	movne	%icc,	%i5,	%g6
	array8	%l1,	%o5,	%o0
	srax	%o1,	0x16,	%g1
	subcc	%i7,	%i6,	%g4
	edge16n	%l2,	%l4,	%o2
	sdivx	%o3,	0x1D67,	%l6
	movl	%xcc,	%l0,	%o4
	ldx	[%l7 + 0x48],	%g5
	ldd	[%l7 + 0x38],	%o6
	alignaddr	%l5,	%g3,	%i2
	sra	%i3,	%o7,	%g7
	stx	%i4,	[%l7 + 0x20]
	add	%i1,	%g2,	%i0
	fnot2s	%f18,	%f20
	mulscc	%i5,	0x1D05,	%l3
	edge16	%g6,	%o5,	%l1
	subccc	%o1,	%o0,	%i7
	fpadd16	%f26,	%f2,	%f18
	subccc	%i6,	%g1,	%l2
	sethi	0x0EC0,	%g4
	srax	%o2,	%l4,	%o3
	alignaddr	%l6,	%l0,	%g5
	srl	%o4,	%o6,	%l5
	mulx	%i2,	0x1F04,	%g3
	movcc	%xcc,	%i3,	%o7
	ldsw	[%l7 + 0x0C],	%g7
	fmovrdgz	%i4,	%f28,	%f8
	orn	%g2,	0x0823,	%i0
	save %i1, 0x0362, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f11,	%f8
	mova	%icc,	%l3,	%o5
	fmovdleu	%icc,	%f19,	%f10
	movle	%icc,	%g6,	%o1
	sdivcc	%o0,	0x1B38,	%l1
	fandnot2s	%f26,	%f7,	%f18
	udivx	%i7,	0x03CD,	%i6
	ldsh	[%l7 + 0x48],	%g1
	stx	%g4,	[%l7 + 0x38]
	ld	[%l7 + 0x78],	%f3
	edge8	%l2,	%l4,	%o2
	edge16	%o3,	%l0,	%l6
	stw	%o4,	[%l7 + 0x6C]
	fmovrslez	%o6,	%f27,	%f11
	lduh	[%l7 + 0x30],	%g5
	fsrc1s	%f13,	%f21
	movrlez	%l5,	%i2,	%i3
	array8	%g3,	%o7,	%g7
	nop
	set	0x30, %o6
	ldsw	[%l7 + %o6],	%g2
	movpos	%xcc,	%i0,	%i1
	sdiv	%i5,	0x0602,	%i4
	srlx	%o5,	%l3,	%g6
	edge32	%o1,	%o0,	%l1
	movre	%i7,	%g1,	%g4
	siam	0x4
	edge8n	%i6,	%l4,	%l2
	movneg	%xcc,	%o2,	%l0
	stw	%o3,	[%l7 + 0x60]
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	lduh	[%l7 + 0x34],	%o4
	edge32	%l5,	%i2,	%i3
	movg	%icc,	%g3,	%o7
	umulcc	%g7,	%g2,	%i0
	movrlz	%i5,	%i1,	%i4
	orncc	%l3,	%o5,	%o1
	addcc	%g6,	0x16B4,	%o0
	ldsh	[%l7 + 0x76],	%l1
	edge16	%i7,	%g4,	%i6
	umul	%l4,	%g1,	%l2
	fabss	%f27,	%f25
	movpos	%icc,	%l0,	%o3
	fnot2s	%f27,	%f20
	sll	%o2,	0x0C,	%l6
	fcmpgt16	%f26,	%f14,	%o6
	orncc	%o4,	0x1865,	%l5
	sir	0x0FE1
	std	%f30,	[%l7 + 0x40]
	bshuffle	%f0,	%f16,	%f10
	fmovsn	%xcc,	%f8,	%f4
	edge16n	%g5,	%i3,	%g3
	array8	%o7,	%g7,	%i2
	array16	%i0,	%g2,	%i5
	xor	%i4,	%i1,	%o5
	movneg	%icc,	%l3,	%g6
	sdiv	%o1,	0x1A0E,	%l1
	srlx	%i7,	0x1D,	%o0
	sllx	%g4,	0x00,	%l4
	movn	%icc,	%g1,	%l2
	ldx	[%l7 + 0x30],	%l0
	fmul8x16au	%f0,	%f14,	%f4
	movl	%xcc,	%o3,	%i6
	fmovdleu	%xcc,	%f1,	%f16
	fnands	%f4,	%f20,	%f24
	fnor	%f22,	%f12,	%f8
	fmovdpos	%icc,	%f0,	%f9
	mulscc	%l6,	%o2,	%o4
	movle	%icc,	%l5,	%o6
	movrne	%g5,	0x1A2,	%g3
	fmovrdlz	%o7,	%f14,	%f6
	movge	%xcc,	%g7,	%i2
	fmovsvc	%icc,	%f31,	%f23
	fpack16	%f28,	%f4
	edge8l	%i0,	%g2,	%i3
	fnands	%f24,	%f11,	%f21
	add	%i5,	0x184D,	%i1
	andcc	%o5,	%i4,	%l3
	fabsd	%f10,	%f20
	edge16n	%g6,	%o1,	%l1
	fsrc2	%f6,	%f28
	fmul8x16al	%f6,	%f29,	%f8
	and	%o0,	%i7,	%l4
	fzeros	%f8
	umulcc	%g4,	%g1,	%l2
	nop
	set	0x39, %g7
	stb	%l0,	[%l7 + %g7]
	fmovdge	%xcc,	%f18,	%f31
	xnorcc	%i6,	0x02F1,	%l6
	smul	%o3,	0x0CA1,	%o2
	orn	%l5,	%o4,	%o6
	stx	%g3,	[%l7 + 0x30]
	ldd	[%l7 + 0x40],	%f18
	movrlz	%o7,	0x1B4,	%g7
	fands	%f26,	%f11,	%f26
	ldd	[%l7 + 0x58],	%i2
	movcs	%icc,	%g5,	%g2
	xnorcc	%i3,	%i0,	%i1
	fmovrdlz	%o5,	%f18,	%f12
	or	%i4,	0x0479,	%l3
	orcc	%g6,	%o1,	%l1
	alignaddr	%i5,	%i7,	%l4
	movvc	%icc,	%g4,	%g1
	udiv	%o0,	0x09FE,	%l2
	movn	%icc,	%l0,	%l6
	stb	%i6,	[%l7 + 0x65]
	sth	%o2,	[%l7 + 0x7C]
	addc	%l5,	%o4,	%o3
	mova	%icc,	%o6,	%g3
	fandnot2	%f0,	%f16,	%f26
	srlx	%o7,	0x1F,	%i2
	xor	%g5,	0x00CA,	%g7
	movvc	%xcc,	%g2,	%i0
	fmovdn	%xcc,	%f11,	%f10
	fsrc1s	%f9,	%f14
	st	%f6,	[%l7 + 0x20]
	movgu	%icc,	%i1,	%i3
	edge16ln	%o5,	%l3,	%g6
	sdivx	%i4,	0x10F4,	%o1
	subcc	%l1,	%i5,	%i7
	mulscc	%g4,	0x0E57,	%l4
	udivcc	%g1,	0x0DF4,	%l2
	movg	%icc,	%l0,	%l6
	ldsw	[%l7 + 0x68],	%o0
	fmovse	%icc,	%f31,	%f18
	movge	%xcc,	%i6,	%o2
	sub	%o4,	0x06A6,	%o3
	fpack16	%f14,	%f7
	fzero	%f24
	save %o6, 0x1C58, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l5,	%i2,	%o7
	fmovda	%icc,	%f30,	%f16
	umulcc	%g5,	0x1198,	%g7
	xorcc	%i0,	%i1,	%i3
	fmul8x16au	%f11,	%f16,	%f26
	movg	%icc,	%o5,	%g2
	fornot2	%f14,	%f6,	%f4
	fornot1	%f6,	%f28,	%f0
	fzero	%f0
	move	%icc,	%g6,	%l3
	lduw	[%l7 + 0x1C],	%o1
	fcmpd	%fcc1,	%f14,	%f6
	edge16l	%i4,	%i5,	%l1
	stx	%g4,	[%l7 + 0x60]
	movvs	%xcc,	%i7,	%l4
	ldsh	[%l7 + 0x2C],	%l2
	fmovscs	%xcc,	%f1,	%f27
	edge32l	%g1,	%l0,	%l6
	edge32l	%o0,	%i6,	%o2
	edge16	%o3,	%o6,	%g3
	or	%o4,	0x07B9,	%i2
	movge	%icc,	%l5,	%g5
	fmovsne	%xcc,	%f12,	%f20
	fnands	%f27,	%f29,	%f19
	fpadd32	%f26,	%f10,	%f28
	fmovrse	%o7,	%f18,	%f26
	sdivcc	%i0,	0x1275,	%i1
	alignaddrl	%i3,	%g7,	%o5
	movrlz	%g2,	0x294,	%l3
	udivx	%g6,	0x1297,	%i4
	fmovda	%xcc,	%f24,	%f2
	alignaddrl	%o1,	%i5,	%g4
	sethi	0x05B9,	%i7
	addc	%l4,	%l1,	%g1
	fpsub16	%f20,	%f12,	%f8
	srlx	%l0,	0x11,	%l2
	sethi	0x1805,	%o0
	movleu	%icc,	%l6,	%o2
	fpadd32	%f6,	%f14,	%f8
	edge8l	%o3,	%i6,	%o6
	movg	%xcc,	%g3,	%i2
	ldsh	[%l7 + 0x22],	%l5
	ldsw	[%l7 + 0x50],	%o4
	fmuld8ulx16	%f12,	%f28,	%f20
	andn	%g5,	%o7,	%i1
	movne	%xcc,	%i0,	%g7
	edge16n	%o5,	%i3,	%g2
	save %g6, 0x1F2C, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%i4,	%o1
	fnot2s	%f1,	%f6
	ldsb	[%l7 + 0x72],	%i5
	bshuffle	%f22,	%f22,	%f18
	srl	%i7,	0x1E,	%l4
	alignaddrl	%l1,	%g4,	%l0
	std	%f8,	[%l7 + 0x50]
	fpackfix	%f14,	%f21
	alignaddrl	%l2,	%o0,	%l6
	orn	%o2,	%o3,	%g1
	sth	%o6,	[%l7 + 0x42]
	srlx	%i6,	%i2,	%l5
	ldsw	[%l7 + 0x30],	%o4
	srax	%g5,	0x00,	%g3
	andncc	%o7,	%i0,	%g7
	movge	%xcc,	%o5,	%i1
	sdivcc	%i3,	0x1F51,	%g2
	fcmpeq16	%f12,	%f18,	%l3
	fpadd16s	%f5,	%f3,	%f4
	smulcc	%i4,	0x0316,	%o1
	andncc	%g6,	%i7,	%l4
	umul	%l1,	0x1E23,	%g4
	std	%f22,	[%l7 + 0x70]
	mulx	%i5,	%l0,	%o0
	ldd	[%l7 + 0x70],	%l2
	sth	%o2,	[%l7 + 0x1A]
	or	%l6,	0x1727,	%o3
	movl	%icc,	%g1,	%i6
	sth	%o6,	[%l7 + 0x10]
	fmul8x16au	%f22,	%f16,	%f18
	edge32	%l5,	%o4,	%g5
	fpack16	%f12,	%f6
	popc	%i2,	%g3
	subcc	%i0,	0x1059,	%g7
	sdivcc	%o7,	0x0424,	%i1
	array16	%o5,	%g2,	%l3
	movrgez	%i3,	0x15F,	%o1
	movneg	%icc,	%g6,	%i7
	smulcc	%i4,	%l1,	%g4
	andcc	%l4,	%i5,	%o0
	and	%l0,	0x13C6,	%o2
	fmovscs	%icc,	%f6,	%f13
	movrgz	%l6,	%l2,	%g1
	or	%i6,	%o3,	%o6
	xorcc	%o4,	%g5,	%i2
	subcc	%l5,	%i0,	%g7
	movne	%icc,	%g3,	%i1
	nop
	set	0x74, %i7
	stw	%o7,	[%l7 + %i7]
	array16	%o5,	%g2,	%l3
	sra	%i3,	%g6,	%i7
	udivcc	%o1,	0x0C7B,	%l1
	movn	%xcc,	%g4,	%i4
	siam	0x0
	smul	%i5,	%l4,	%l0
	fpack32	%f10,	%f6,	%f6
	subccc	%o2,	0x113D,	%o0
	edge32l	%l2,	%g1,	%l6
	fmovsge	%xcc,	%f25,	%f0
	mulx	%i6,	0x1820,	%o6
	alignaddrl	%o4,	%g5,	%o3
	umul	%l5,	0x1BBD,	%i0
	ldsh	[%l7 + 0x4A],	%i2
	stx	%g7,	[%l7 + 0x50]
	array8	%g3,	%o7,	%o5
	sra	%g2,	%i1,	%i3
	fpsub32	%f4,	%f20,	%f12
	restore %g6, %i7, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%l1,	%l3
	fxor	%f22,	%f22,	%f26
	add	%i4,	%i5,	%l4
	srax	%g4,	%o2,	%o0
	orncc	%l2,	0x0E5E,	%l0
	sdivx	%g1,	0x1BF0,	%i6
	edge8	%l6,	%o6,	%o4
	movg	%icc,	%o3,	%g5
	sth	%i0,	[%l7 + 0x16]
	std	%f26,	[%l7 + 0x30]
	movne	%xcc,	%i2,	%l5
	mulscc	%g7,	%o7,	%g3
	edge32n	%g2,	%i1,	%o5
	fmovscs	%icc,	%f6,	%f27
	movg	%xcc,	%g6,	%i3
	addccc	%o1,	0x1CA3,	%i7
	mulscc	%l3,	0x10B9,	%l1
	ldd	[%l7 + 0x10],	%i4
	addcc	%l4,	%g4,	%i5
	mulx	%o2,	0x0857,	%l2
	lduh	[%l7 + 0x3E],	%o0
	fnand	%f6,	%f6,	%f22
	movrlz	%l0,	%i6,	%l6
	srlx	%o6,	%o4,	%o3
	fpackfix	%f16,	%f23
	srlx	%g1,	0x15,	%i0
	orn	%i2,	%l5,	%g5
	movcs	%icc,	%o7,	%g7
	movrgez	%g2,	0x387,	%i1
	addc	%o5,	%g3,	%i3
	sth	%o1,	[%l7 + 0x78]
	fornot2s	%f21,	%f18,	%f5
	orncc	%i7,	0x0655,	%l3
	fmovrdgz	%l1,	%f18,	%f8
	subc	%g6,	0x1A18,	%l4
	movrlez	%g4,	%i5,	%i4
	edge8n	%l2,	%o2,	%l0
	sdivcc	%i6,	0x1A7E,	%o0
	movrlez	%l6,	0x12F,	%o4
	movrgz	%o3,	0x0D8,	%g1
	udivx	%i0,	0x0CD7,	%o6
	smulcc	%i2,	%g5,	%o7
	fone	%f28
	movl	%icc,	%g7,	%g2
	smul	%l5,	%o5,	%i1
	fpackfix	%f20,	%f0
	xnor	%g3,	0x1B3F,	%i3
	fmovsg	%icc,	%f6,	%f1
	mulscc	%o1,	%l3,	%i7
	alignaddr	%l1,	%l4,	%g6
	edge8ln	%g4,	%i4,	%i5
	fpack16	%f22,	%f13
	smulcc	%o2,	%l2,	%i6
	udiv	%o0,	0x14AF,	%l6
	orcc	%o4,	0x05A8,	%l0
	smulcc	%g1,	%i0,	%o6
	movcc	%icc,	%o3,	%g5
	orn	%i2,	%g7,	%g2
	mulx	%l5,	%o5,	%i1
	stx	%g3,	[%l7 + 0x28]
	xorcc	%i3,	%o1,	%l3
	movvc	%icc,	%i7,	%l1
	srax	%o7,	0x0C,	%g6
	sub	%l4,	0x0D99,	%i4
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%f16
	edge8l	%i5,	%g4,	%o2
	fcmpes	%fcc0,	%f2,	%f4
	udiv	%i6,	0x02DB,	%l2
	edge32	%o0,	%o4,	%l0
	ldd	[%l7 + 0x70],	%f4
	sth	%g1,	[%l7 + 0x56]
	edge16l	%i0,	%l6,	%o3
	xor	%o6,	%g5,	%i2
	udiv	%g2,	0x001E,	%g7
	xnorcc	%o5,	0x11DE,	%i1
	movle	%xcc,	%g3,	%l5
	movpos	%icc,	%o1,	%i3
	ldsh	[%l7 + 0x16],	%l3
	lduh	[%l7 + 0x58],	%i7
	fmovrde	%l1,	%f0,	%f6
	move	%xcc,	%g6,	%o7
	siam	0x0
	smulcc	%l4,	0x00E3,	%i5
	add	%i4,	0x03AF,	%o2
	orcc	%i6,	%g4,	%o0
	xorcc	%l2,	%o4,	%l0
	udiv	%g1,	0x1465,	%i0
	ldd	[%l7 + 0x68],	%f10
	movne	%xcc,	%l6,	%o3
	movl	%xcc,	%g5,	%o6
	stb	%i2,	[%l7 + 0x4D]
	movcs	%icc,	%g2,	%g7
	fcmps	%fcc1,	%f13,	%f5
	xor	%i1,	%o5,	%l5
	subc	%o1,	%i3,	%l3
	edge32n	%i7,	%g3,	%g6
	siam	0x6
	fmovdl	%icc,	%f21,	%f8
	movrlez	%o7,	0x31D,	%l4
	movvc	%xcc,	%l1,	%i5
	fmovdne	%xcc,	%f8,	%f5
	mulscc	%o2,	0x19FA,	%i4
	movpos	%xcc,	%i6,	%o0
	xorcc	%g4,	0x06AE,	%l2
	srl	%l0,	%o4,	%i0
	fxors	%f2,	%f2,	%f8
	array32	%g1,	%l6,	%g5
	umulcc	%o6,	0x00DD,	%i2
	fcmple16	%f28,	%f20,	%o3
	movle	%xcc,	%g7,	%g2
	array32	%o5,	%l5,	%o1
	orn	%i1,	0x1A92,	%i3
	fmovrdlez	%i7,	%f20,	%f16
	edge16	%g3,	%g6,	%o7
	fcmpne16	%f0,	%f10,	%l4
	fmovdn	%icc,	%f28,	%f14
	array16	%l3,	%l1,	%i5
	sll	%o2,	0x1E,	%i6
	movvs	%xcc,	%o0,	%i4
	movrgz	%l2,	%g4,	%o4
	addccc	%i0,	0x13D1,	%l0
	movge	%icc,	%g1,	%g5
	movleu	%xcc,	%o6,	%i2
	fmovdge	%xcc,	%f17,	%f11
	xor	%o3,	0x0D8C,	%g7
	subccc	%l6,	0x1434,	%g2
	sdivx	%o5,	0x109A,	%o1
	movgu	%icc,	%i1,	%i3
	edge8ln	%i7,	%g3,	%g6
	andncc	%o7,	%l5,	%l4
	udiv	%l3,	0x1C6D,	%i5
	andncc	%l1,	%o2,	%i6
	edge16l	%o0,	%i4,	%g4
	udivcc	%l2,	0x16C1,	%i0
	fmovrsgez	%l0,	%f9,	%f9
	sra	%g1,	%o4,	%g5
	edge16n	%i2,	%o3,	%g7
	save %l6, %o6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g2,	%i1,	%i3
	ld	[%l7 + 0x1C],	%f29
	fmovspos	%xcc,	%f7,	%f18
	stw	%i7,	[%l7 + 0x68]
	andncc	%g3,	%g6,	%o7
	movrlz	%o1,	%l5,	%l4
	sra	%l3,	0x1D,	%l1
	xorcc	%i5,	%i6,	%o0
	edge8	%o2,	%g4,	%l2
	umul	%i4,	%l0,	%i0
	fnot2	%f14,	%f10
	fmovdge	%icc,	%f24,	%f19
	ldd	[%l7 + 0x18],	%f12
	fmovsg	%xcc,	%f2,	%f3
	movle	%xcc,	%g1,	%g5
	umulcc	%i2,	%o4,	%o3
	movpos	%icc,	%l6,	%o6
	fcmpne32	%f6,	%f20,	%g7
	edge8n	%g2,	%i1,	%o5
	array16	%i7,	%i3,	%g6
	sll	%o7,	%g3,	%l5
	ldub	[%l7 + 0x39],	%l4
	andncc	%l3,	%l1,	%i5
	fcmpne16	%f20,	%f14,	%o1
	movrlz	%o0,	%o2,	%i6
	fmovrdne	%l2,	%f24,	%f10
	st	%f23,	[%l7 + 0x5C]
	movrgez	%i4,	0x33F,	%g4
	sll	%l0,	%i0,	%g5
	orcc	%g1,	%o4,	%o3
	sir	0x0D5A
	move	%xcc,	%l6,	%i2
	sllx	%o6,	0x1E,	%g2
	fcmpgt32	%f4,	%f20,	%i1
	subcc	%g7,	0x146F,	%i7
	movn	%xcc,	%o5,	%i3
	sdiv	%g6,	0x1644,	%g3
	fmul8x16au	%f4,	%f21,	%f8
	sethi	0x127C,	%o7
	fmovspos	%icc,	%f12,	%f3
	umulcc	%l4,	%l5,	%l3
	ldx	[%l7 + 0x40],	%i5
	srlx	%o1,	%o0,	%l1
	fmovrdlz	%i6,	%f24,	%f28
	movneg	%xcc,	%o2,	%l2
	xor	%i4,	%g4,	%i0
	edge8	%l0,	%g1,	%o4
	fmul8x16au	%f10,	%f29,	%f8
	mulscc	%g5,	0x0A62,	%o3
	movrne	%l6,	0x2BF,	%i2
	srlx	%g2,	%i1,	%o6
	std	%f22,	[%l7 + 0x78]
	xnor	%g7,	0x1B5C,	%i7
	fabsd	%f18,	%f28
	fpack32	%f22,	%f4,	%f8
	movcs	%icc,	%i3,	%o5
	fnors	%f5,	%f31,	%f16
	fmovscc	%icc,	%f26,	%f28
	fornot2s	%f15,	%f10,	%f11
	xorcc	%g6,	%g3,	%o7
	movre	%l4,	%l3,	%i5
	sll	%o1,	%o0,	%l1
	movvs	%icc,	%l5,	%i6
	movleu	%xcc,	%o2,	%i4
	andncc	%l2,	%i0,	%g4
	movpos	%xcc,	%g1,	%o4
	fandnot2s	%f25,	%f17,	%f4
	lduw	[%l7 + 0x44],	%g5
	std	%f28,	[%l7 + 0x68]
	fmovrsgz	%l0,	%f5,	%f19
	movrne	%l6,	0x2C0,	%o3
	movg	%icc,	%g2,	%i1
	srl	%i2,	%o6,	%g7
	movleu	%icc,	%i3,	%i7
	fcmpeq32	%f30,	%f18,	%g6
	ldub	[%l7 + 0x61],	%o5
	ldd	[%l7 + 0x28],	%f18
	movge	%xcc,	%g3,	%l4
	addc	%l3,	0x11ED,	%o7
	fmovdl	%xcc,	%f30,	%f10
	orncc	%i5,	%o1,	%l1
	umulcc	%l5,	%o0,	%o2
	edge8ln	%i6,	%l2,	%i4
	fmovdge	%icc,	%f9,	%f3
	smulcc	%g4,	0x0745,	%g1
	ldub	[%l7 + 0x44],	%i0
	ldd	[%l7 + 0x60],	%f26
	edge16n	%g5,	%l0,	%o4
	fmovdg	%xcc,	%f2,	%f22
	sra	%l6,	0x03,	%g2
	ldub	[%l7 + 0x17],	%i1
	edge8	%i2,	%o3,	%g7
	xnor	%i3,	%o6,	%g6
	movrne	%o5,	0x0DD,	%i7
	orcc	%l4,	%l3,	%g3
	movpos	%xcc,	%o7,	%o1
	fcmpne16	%f14,	%f14,	%l1
	movgu	%icc,	%l5,	%i5
	fmovdgu	%xcc,	%f6,	%f31
	movre	%o0,	0x0E8,	%i6
	edge16l	%l2,	%o2,	%g4
	movvs	%xcc,	%i4,	%i0
	fnors	%f26,	%f17,	%f0
	fmovrsgz	%g5,	%f7,	%f11
	edge8	%l0,	%g1,	%l6
	ldsh	[%l7 + 0x7E],	%g2
	movrne	%o4,	0x026,	%i1
	lduw	[%l7 + 0x2C],	%o3
	fmovdcc	%xcc,	%f19,	%f10
	add	%g7,	%i3,	%i2
	fabsd	%f20,	%f8
	add	%o6,	%o5,	%g6
	movge	%xcc,	%i7,	%l3
	smul	%l4,	%g3,	%o7
	nop
	set	0x5D, %g4
	ldsb	[%l7 + %g4],	%o1
	sdivcc	%l1,	0x1E38,	%i5
	edge8n	%o0,	%l5,	%l2
	fmul8ulx16	%f22,	%f6,	%f4
	fpsub16	%f26,	%f2,	%f22
	movn	%icc,	%i6,	%g4
	nop
	set	0x4C, %g3
	lduh	[%l7 + %g3],	%o2
	movge	%xcc,	%i0,	%i4
	addc	%l0,	0x17C9,	%g1
	udivx	%g5,	0x0D62,	%l6
	movge	%xcc,	%o4,	%i1
	sdivcc	%g2,	0x10E2,	%g7
	sdiv	%i3,	0x16D9,	%o3
	fmovdvc	%xcc,	%f18,	%f27
	movpos	%icc,	%i2,	%o5
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	and	%l4,	%g3,	%i7
	fmuld8sux16	%f16,	%f17,	%f6
	udivx	%o7,	0x10DD,	%l1
	orcc	%o1,	%i5,	%l5
	fsrc2s	%f9,	%f12
	subcc	%l2,	0x09C2,	%i6
	faligndata	%f26,	%f26,	%f24
	mulscc	%o0,	0x1177,	%g4
	movgu	%xcc,	%i0,	%i4
	fmul8ulx16	%f22,	%f26,	%f14
	addccc	%l0,	0x04E4,	%g1
	sethi	0x15EE,	%o2
	movgu	%xcc,	%l6,	%o4
	edge32	%g5,	%i1,	%g2
	fsrc2	%f6,	%f4
	umulcc	%g7,	%o3,	%i2
	move	%xcc,	%i3,	%o6
	restore %o5, 0x00BD, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l3,	%g3,	%i7
	sdivx	%l4,	0x07DA,	%l1
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	fxor	%f4,	%f26,	%f30
	ldsw	[%l7 + 0x70],	%l2
	edge16	%i5,	%o0,	%i6
	std	%f10,	[%l7 + 0x68]
	fmul8sux16	%f2,	%f14,	%f18
	stx	%g4,	[%l7 + 0x78]
	stw	%i0,	[%l7 + 0x3C]
	xorcc	%i4,	%l0,	%g1
	fpadd16s	%f23,	%f17,	%f1
	stx	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x24],	%f1
	faligndata	%f24,	%f26,	%f14
	edge8n	%o2,	%g5,	%o4
	udiv	%i1,	0x0302,	%g2
	sdivx	%g7,	0x00EC,	%o3
	fones	%f25
	ldsw	[%l7 + 0x18],	%i2
	sethi	0x1530,	%o6
	ldx	[%l7 + 0x68],	%o5
	movcc	%xcc,	%i3,	%g6
	fmovrsgz	%l3,	%f6,	%f16
	movg	%icc,	%g3,	%i7
	sdivcc	%l4,	0x026A,	%l1
	sth	%o1,	[%l7 + 0x14]
	edge32	%o7,	%l2,	%i5
	or	%o0,	0x100A,	%i6
	fcmpeq32	%f30,	%f8,	%l5
	std	%f24,	[%l7 + 0x18]
	st	%f20,	[%l7 + 0x64]
	fmovdvs	%xcc,	%f15,	%f14
	movvs	%icc,	%i0,	%g4
	sdiv	%i4,	0x17A7,	%g1
	edge32n	%l0,	%o2,	%l6
	mova	%xcc,	%o4,	%g5
	stw	%g2,	[%l7 + 0x0C]
	fmuld8sux16	%f29,	%f11,	%f18
	ldsw	[%l7 + 0x28],	%i1
	mova	%xcc,	%g7,	%i2
	movre	%o6,	0x100,	%o3
	andcc	%o5,	0x0543,	%g6
	siam	0x1
	movle	%icc,	%i3,	%g3
	mova	%xcc,	%l3,	%i7
	fcmpeq16	%f2,	%f6,	%l4
	edge32l	%l1,	%o7,	%l2
	ldub	[%l7 + 0x0E],	%o1
	fmul8sux16	%f2,	%f4,	%f2
	fnot2s	%f6,	%f14
	sllx	%o0,	%i6,	%l5
	sethi	0x0D13,	%i0
	movne	%icc,	%i5,	%i4
	ldub	[%l7 + 0x45],	%g1
	movg	%icc,	%g4,	%l0
	sub	%l6,	%o4,	%o2
	fmul8ulx16	%f16,	%f30,	%f6
	smul	%g5,	%i1,	%g2
	ldub	[%l7 + 0x7F],	%g7
	fxnor	%f12,	%f12,	%f12
	nop
	set	0x20, %o7
	ldd	[%l7 + %o7],	%f8
	edge16l	%i2,	%o6,	%o3
	orn	%o5,	0x0828,	%i3
	movcs	%icc,	%g3,	%l3
	addccc	%g6,	0x1062,	%l4
	edge16	%l1,	%o7,	%l2
	edge16l	%o1,	%i7,	%o0
	and	%l5,	0x0DF5,	%i0
	fmovdn	%icc,	%f19,	%f28
	fmovrslz	%i6,	%f26,	%f29
	edge16l	%i4,	%g1,	%i5
	movvs	%icc,	%g4,	%l0
	srl	%l6,	0x0A,	%o2
	fmovdvc	%xcc,	%f2,	%f7
	mova	%icc,	%g5,	%i1
	ldsh	[%l7 + 0x08],	%g2
	fpadd16s	%f5,	%f12,	%f30
	sdiv	%g7,	0x1AF3,	%i2
	xnorcc	%o4,	0x0CEF,	%o3
	orncc	%o5,	0x075C,	%i3
	subc	%o6,	0x0914,	%g3
	fcmpeq16	%f16,	%f10,	%g6
	andncc	%l4,	%l3,	%o7
	xnor	%l2,	0x0878,	%o1
	fmovdn	%xcc,	%f25,	%f16
	sdiv	%i7,	0x1AAA,	%l1
	movn	%icc,	%l5,	%i0
	udiv	%o0,	0x0099,	%i4
	fmovsa	%xcc,	%f26,	%f18
	srlx	%i6,	%g1,	%g4
	xorcc	%i5,	0x1F5F,	%l0
	sir	0x1543
	alignaddr	%o2,	%l6,	%i1
	ldsh	[%l7 + 0x28],	%g2
	mova	%xcc,	%g7,	%i2
	mulscc	%o4,	0x1669,	%o3
	edge16l	%g5,	%o5,	%i3
	lduw	[%l7 + 0x6C],	%o6
	mova	%icc,	%g6,	%g3
	sdiv	%l3,	0x0488,	%o7
	movrgez	%l2,	0x231,	%l4
	fmovsle	%icc,	%f4,	%f21
	edge16l	%o1,	%i7,	%l5
	edge16ln	%l1,	%i0,	%i4
	movgu	%icc,	%i6,	%o0
	lduw	[%l7 + 0x40],	%g1
	nop
	set	0x28, %i6
	ldx	[%l7 + %i6],	%i5
	sth	%g4,	[%l7 + 0x62]
	sethi	0x1D19,	%o2
	sdivcc	%l0,	0x10C2,	%i1
	fmovscc	%icc,	%f0,	%f28
	fabsd	%f2,	%f8
	movpos	%xcc,	%g2,	%g7
	sdivcc	%i2,	0x0594,	%o4
	or	%l6,	0x0BDE,	%g5
	sir	0x0224
	alignaddr	%o5,	%i3,	%o6
	fnot1	%f18,	%f30
	ldsh	[%l7 + 0x38],	%o3
	sllx	%g6,	%l3,	%g3
	edge16l	%l2,	%l4,	%o7
	fnot2s	%f27,	%f23
	restore %o1, 0x1AB2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l1,	0x1FB6,	%l5
	fmovrsgez	%i4,	%f14,	%f27
	udivx	%i0,	0x03D1,	%i6
	movvs	%xcc,	%o0,	%i5
	fpadd32	%f4,	%f22,	%f24
	movvs	%xcc,	%g4,	%g1
	st	%f23,	[%l7 + 0x40]
	movn	%xcc,	%l0,	%o2
	movrlz	%i1,	%g2,	%g7
	fmovdne	%xcc,	%f22,	%f10
	movl	%icc,	%o4,	%l6
	orn	%i2,	%o5,	%g5
	movrne	%o6,	0x262,	%o3
	edge8ln	%i3,	%l3,	%g3
	edge8l	%g6,	%l4,	%l2
	ldx	[%l7 + 0x08],	%o1
	subcc	%i7,	%l1,	%o7
	add	%l5,	%i0,	%i6
	edge8l	%i4,	%i5,	%g4
	movle	%xcc,	%g1,	%l0
	movleu	%icc,	%o0,	%i1
	mulscc	%o2,	0x1141,	%g7
	mova	%icc,	%g2,	%o4
	movrlez	%l6,	0x261,	%i2
	movle	%xcc,	%o5,	%g5
	subcc	%o6,	%i3,	%l3
	sll	%o3,	0x05,	%g3
	save %l4, 0x10F2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l2,	0x11DD,	%o1
	fcmped	%fcc3,	%f18,	%f28
	stw	%l1,	[%l7 + 0x5C]
	nop
	set	0x58, %o4
	sth	%i7,	[%l7 + %o4]
	fandnot1	%f0,	%f8,	%f14
	fandnot1s	%f20,	%f16,	%f25
	edge8ln	%l5,	%o7,	%i0
	edge16n	%i6,	%i5,	%i4
	and	%g4,	%l0,	%o0
	movneg	%xcc,	%g1,	%i1
	andcc	%g7,	%o2,	%o4
	udiv	%l6,	0x1D3C,	%g2
	sub	%i2,	0x0265,	%g5
	umul	%o6,	%i3,	%l3
	andn	%o3,	0x1CC7,	%g3
	sir	0x0084
	fmovrdlez	%o5,	%f28,	%f12
	stb	%l4,	[%l7 + 0x4A]
	alignaddrl	%g6,	%o1,	%l1
	addcc	%l2,	0x14C9,	%i7
	sir	0x1B15
	movleu	%xcc,	%l5,	%o7
	fandnot1	%f28,	%f4,	%f0
	sth	%i0,	[%l7 + 0x7C]
	fpsub16	%f18,	%f22,	%f6
	xorcc	%i6,	%i4,	%i5
	xnor	%l0,	0x091B,	%o0
	orcc	%g4,	0x0F9B,	%g1
	orncc	%i1,	%g7,	%o2
	movge	%xcc,	%o4,	%l6
	subccc	%g2,	%g5,	%i2
	fands	%f31,	%f26,	%f11
	movvs	%icc,	%o6,	%l3
	movg	%xcc,	%o3,	%g3
	nop
	set	0x58, %g1
	ldx	[%l7 + %g1],	%o5
	sub	%l4,	%i3,	%g6
	edge16n	%l1,	%l2,	%i7
	fexpand	%f0,	%f8
	xnorcc	%o1,	0x09DF,	%l5
	movrgz	%i0,	0x224,	%i6
	nop
	set	0x18, %i1
	ldsh	[%l7 + %i1],	%o7
	movrgez	%i4,	0x214,	%l0
	addc	%o0,	0x107B,	%i5
	movrgz	%g4,	0x0BF,	%g1
	fnot2	%f30,	%f4
	srlx	%i1,	%g7,	%o2
	srax	%l6,	0x0F,	%o4
	xnor	%g2,	%i2,	%o6
	fpsub32s	%f6,	%f18,	%f6
	fmovspos	%xcc,	%f19,	%f26
	lduh	[%l7 + 0x22],	%g5
	sethi	0x1F45,	%o3
	and	%l3,	%o5,	%l4
	orn	%i3,	%g3,	%l1
	fzeros	%f4
	fsrc1	%f8,	%f26
	orncc	%l2,	%i7,	%g6
	fmovrslez	%l5,	%f15,	%f26
	edge32n	%o1,	%i6,	%i0
	udivcc	%o7,	0x110E,	%l0
	ld	[%l7 + 0x48],	%f6
	sdivcc	%i4,	0x0CBD,	%i5
	fzero	%f24
	xor	%o0,	0x02F0,	%g4
	udivcc	%i1,	0x1E7E,	%g1
	movge	%icc,	%g7,	%l6
	udiv	%o4,	0x0A86,	%g2
	sth	%i2,	[%l7 + 0x58]
	fornot1s	%f24,	%f8,	%f20
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	movvc	%icc,	%l3,	%g5
	sir	0x182C
	array32	%o5,	%i3,	%l4
	fsrc1	%f6,	%f24
	fmovsne	%xcc,	%f31,	%f22
	sth	%l1,	[%l7 + 0x62]
	andn	%g3,	0x0729,	%i7
	fpadd32	%f6,	%f14,	%f28
	srlx	%g6,	%l5,	%l2
	mova	%xcc,	%i6,	%o1
	subcc	%o7,	0x1410,	%l0
	addc	%i0,	0x068E,	%i5
	fpack32	%f26,	%f30,	%f8
	xnor	%i4,	0x0378,	%g4
	st	%f29,	[%l7 + 0x50]
	alignaddr	%i1,	%o0,	%g7
	umulcc	%g1,	%o4,	%l6
	addcc	%g2,	0x15D1,	%o2
	st	%f16,	[%l7 + 0x70]
	sll	%o6,	%i2,	%o3
	stx	%g5,	[%l7 + 0x50]
	xnorcc	%o5,	0x1168,	%l3
	mulscc	%l4,	0x06AF,	%i3
	lduw	[%l7 + 0x4C],	%l1
	ldsh	[%l7 + 0x54],	%i7
	andcc	%g3,	0x165F,	%l5
	move	%icc,	%g6,	%i6
	srl	%l2,	%o7,	%l0
	edge32ln	%o1,	%i0,	%i5
	andn	%g4,	%i1,	%o0
	movrgz	%g7,	0x18A,	%g1
	udivcc	%o4,	0x0D31,	%i4
	edge8l	%g2,	%o2,	%o6
	fmovspos	%icc,	%f23,	%f12
	andn	%l6,	0x0616,	%o3
	save %g5, 0x0C28, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%xcc,	%f5,	%f28
	edge8ln	%l3,	%o5,	%i3
	xorcc	%l4,	%l1,	%g3
	fmovsn	%icc,	%f18,	%f14
	sll	%i7,	%g6,	%i6
	sdivx	%l2,	0x0BD5,	%o7
	fnegd	%f12,	%f8
	fnands	%f10,	%f29,	%f21
	movne	%xcc,	%l5,	%o1
	orcc	%i0,	0x119B,	%l0
	addcc	%g4,	0x10D6,	%i1
	addccc	%i5,	%o0,	%g7
	movvc	%icc,	%g1,	%o4
	stb	%g2,	[%l7 + 0x47]
	mulx	%i4,	%o6,	%o2
	mova	%icc,	%o3,	%l6
	bshuffle	%f18,	%f22,	%f14
	edge8	%i2,	%l3,	%o5
	fandnot1	%f12,	%f2,	%f10
	fcmpd	%fcc0,	%f24,	%f16
	sdiv	%i3,	0x12B2,	%l4
	alignaddrl	%l1,	%g5,	%g3
	move	%xcc,	%i7,	%g6
	sir	0x0233
	xnorcc	%i6,	0x1940,	%l2
	sllx	%o7,	0x11,	%o1
	srlx	%l5,	0x18,	%l0
	ldsw	[%l7 + 0x44],	%g4
	faligndata	%f24,	%f30,	%f16
	array32	%i1,	%i0,	%o0
	movre	%g7,	%i5,	%o4
	fmovd	%f10,	%f8
	orn	%g2,	%g1,	%o6
	stw	%o2,	[%l7 + 0x48]
	fmovde	%xcc,	%f26,	%f17
	addcc	%i4,	0x040B,	%l6
	fpadd16	%f12,	%f28,	%f20
	std	%f26,	[%l7 + 0x48]
	orncc	%i2,	%o3,	%l3
	fmovse	%icc,	%f23,	%f31
	fnegs	%f15,	%f27
	pdist	%f24,	%f14,	%f28
	srl	%i3,	0x1E,	%o5
	array8	%l1,	%l4,	%g3
	orn	%g5,	%i7,	%g6
	st	%f17,	[%l7 + 0x54]
	umul	%l2,	%o7,	%i6
	add	%o1,	%l5,	%l0
	fcmple16	%f22,	%f10,	%g4
	fmovsge	%icc,	%f24,	%f7
	save %i0, %i1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i5,	%g7,	%o4
	ldub	[%l7 + 0x44],	%g2
	fmovdgu	%icc,	%f2,	%f26
	edge32ln	%o6,	%o2,	%g1
	andcc	%i4,	%l6,	%o3
	movrlez	%l3,	0x319,	%i3
	ldd	[%l7 + 0x28],	%i2
	ldd	[%l7 + 0x70],	%f10
	alignaddr	%l1,	%o5,	%l4
	mova	%icc,	%g3,	%i7
	movle	%xcc,	%g6,	%g5
	addc	%o7,	0x15DC,	%l2
	movleu	%xcc,	%o1,	%i6
	fexpand	%f2,	%f0
	sethi	0x0940,	%l0
	sdivcc	%l5,	0x0CCA,	%i0
	fxnors	%f23,	%f3,	%f7
	ldsh	[%l7 + 0x34],	%g4
	add	%o0,	%i5,	%i1
	array32	%g7,	%o4,	%g2
	stb	%o2,	[%l7 + 0x12]
	popc	0x0D4B,	%o6
	and	%i4,	%g1,	%o3
	fands	%f8,	%f10,	%f30
	umulcc	%l6,	0x107C,	%l3
	fmovsa	%icc,	%f17,	%f4
	fmovsge	%icc,	%f16,	%f25
	sth	%i2,	[%l7 + 0x76]
	srlx	%i3,	%l1,	%l4
	sllx	%g3,	%o5,	%i7
	movvc	%icc,	%g5,	%o7
	fandnot2s	%f23,	%f13,	%f9
	sdivx	%l2,	0x09D4,	%o1
	srax	%g6,	0x0A,	%i6
	movl	%icc,	%l0,	%l5
	and	%i0,	0x0258,	%g4
	edge32l	%i5,	%o0,	%i1
	or	%g7,	0x1587,	%o4
	ld	[%l7 + 0x74],	%f12
	movg	%icc,	%g2,	%o2
	orncc	%i4,	0x0628,	%o6
	ldsh	[%l7 + 0x4A],	%o3
	movcc	%xcc,	%g1,	%l6
	save %i2, 0x0C27, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i3,	%l1,	%g3
	movg	%icc,	%o5,	%i7
	stw	%l4,	[%l7 + 0x78]
	fcmpes	%fcc3,	%f26,	%f18
	fmovdne	%xcc,	%f18,	%f7
	sra	%o7,	0x14,	%g5
	fmovrdgez	%o1,	%f0,	%f10
	orcc	%l2,	0x1947,	%g6
	sub	%l0,	%l5,	%i6
	ldd	[%l7 + 0x08],	%f10
	stw	%i0,	[%l7 + 0x44]
	umulcc	%i5,	%g4,	%i1
	fmul8sux16	%f16,	%f26,	%f4
	sub	%g7,	0x0F4B,	%o4
	fcmps	%fcc1,	%f10,	%f23
	ldsb	[%l7 + 0x47],	%o0
	fsrc1s	%f2,	%f0
	add	%g2,	%i4,	%o2
	addc	%o3,	0x11B6,	%o6
	movrne	%l6,	%i2,	%g1
	movneg	%xcc,	%i3,	%l3
	edge8	%l1,	%g3,	%o5
	movcs	%icc,	%i7,	%l4
	ldd	[%l7 + 0x10],	%g4
	edge8	%o7,	%l2,	%g6
	movneg	%icc,	%o1,	%l0
	fmovdgu	%icc,	%f19,	%f5
	fsrc2s	%f29,	%f19
	sllx	%i6,	0x09,	%l5
	lduh	[%l7 + 0x62],	%i0
	andn	%g4,	%i1,	%g7
	sra	%i5,	0x07,	%o4
	popc	0x0B00,	%o0
	andncc	%g2,	%i4,	%o2
	move	%xcc,	%o6,	%o3
	srax	%l6,	0x05,	%i2
	lduw	[%l7 + 0x10],	%i3
	xnor	%l3,	%l1,	%g1
	move	%icc,	%o5,	%i7
	edge32n	%l4,	%g5,	%g3
	orncc	%o7,	%g6,	%l2
	fmovdcs	%xcc,	%f22,	%f7
	movrlez	%l0,	0x399,	%i6
	fabss	%f30,	%f15
	array32	%o1,	%l5,	%g4
	andncc	%i0,	%g7,	%i1
	fmovsge	%icc,	%f11,	%f17
	fmovdgu	%xcc,	%f14,	%f24
	andn	%o4,	%o0,	%i5
	sra	%g2,	0x17,	%i4
	edge8	%o6,	%o2,	%l6
	ldd	[%l7 + 0x58],	%o2
	movvc	%icc,	%i3,	%l3
	addccc	%l1,	%g1,	%o5
	edge8ln	%i2,	%i7,	%g5
	mulx	%l4,	%g3,	%g6
	smul	%l2,	%o7,	%i6
	fpack16	%f0,	%f2
	movrlz	%o1,	0x276,	%l5
	sdivx	%l0,	0x146E,	%i0
	fpadd16	%f28,	%f2,	%f6
	movrgez	%g4,	0x227,	%g7
	sllx	%i1,	%o4,	%i5
	movgu	%xcc,	%g2,	%o0
	edge16l	%i4,	%o6,	%l6
	edge32l	%o3,	%i3,	%l3
	subc	%l1,	%o2,	%g1
	movn	%xcc,	%i2,	%o5
	addccc	%i7,	%g5,	%l4
	move	%xcc,	%g6,	%g3
	fmovsne	%icc,	%f7,	%f7
	edge32	%l2,	%o7,	%i6
	ld	[%l7 + 0x48],	%f4
	xnorcc	%l5,	0x1F89,	%l0
	add	%o1,	0x0670,	%i0
	udivcc	%g4,	0x1174,	%g7
	fnors	%f15,	%f30,	%f16
	movne	%xcc,	%i1,	%o4
	udiv	%g2,	0x0F3B,	%i5
	subccc	%i4,	0x03CF,	%o6
	udivx	%o0,	0x12EF,	%l6
	movrgz	%i3,	0x231,	%o3
	lduw	[%l7 + 0x78],	%l1
	edge32	%o2,	%g1,	%i2
	edge16l	%o5,	%l3,	%i7
	subc	%l4,	%g6,	%g3
	orn	%g5,	%l2,	%o7
	sdivx	%i6,	0x0ED0,	%l0
	alignaddr	%l5,	%i0,	%g4
	movneg	%xcc,	%o1,	%i1
	movg	%icc,	%g7,	%o4
	movneg	%icc,	%g2,	%i5
	sllx	%i4,	0x03,	%o6
	fmovdg	%xcc,	%f14,	%f11
	movn	%icc,	%o0,	%l6
	fornot1	%f30,	%f30,	%f20
	popc	%i3,	%o3
	edge8ln	%l1,	%g1,	%i2
	orcc	%o5,	0x1FB2,	%l3
	srl	%o2,	%i7,	%g6
	add	%g3,	%g5,	%l2
	fmovdg	%xcc,	%f18,	%f4
	fnor	%f22,	%f16,	%f28
	orncc	%l4,	0x1A97,	%i6
	ldd	[%l7 + 0x48],	%f6
	fnors	%f30,	%f5,	%f5
	movge	%xcc,	%o7,	%l0
	edge32	%l5,	%g4,	%i0
	fsrc1	%f22,	%f8
	alignaddr	%o1,	%g7,	%o4
	edge16	%g2,	%i5,	%i4
	movleu	%icc,	%i1,	%o6
	udivx	%l6,	0x02FF,	%o0
	add	%o3,	%l1,	%i3
	bshuffle	%f18,	%f20,	%f0
	movrlez	%g1,	0x291,	%i2
	save %o5, 0x1AEA, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f22,	%f31,	%f16
	umulcc	%o2,	0x1C48,	%i7
	addccc	%g6,	0x012E,	%g5
	array32	%g3,	%l4,	%l2
	ld	[%l7 + 0x4C],	%f10
	subcc	%i6,	%l0,	%l5
	fsrc2s	%f25,	%f6
	fmovrdgez	%g4,	%f2,	%f20
	edge8l	%o7,	%i0,	%o1
	fsrc1	%f2,	%f18
	udivx	%g7,	0x1332,	%o4
	nop
	set	0x50, %i0
	ldsw	[%l7 + %i0],	%g2
	fabsd	%f10,	%f24
	alignaddrl	%i5,	%i4,	%o6
	orcc	%i1,	%l6,	%o0
	fmovsleu	%icc,	%f20,	%f15
	fmovdle	%icc,	%f20,	%f17
	stb	%l1,	[%l7 + 0x42]
	subccc	%o3,	%i3,	%i2
	restore %o5, %g1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%l3,	%g6
	std	%f22,	[%l7 + 0x40]
	smul	%i7,	%g3,	%g5
	ldsb	[%l7 + 0x3E],	%l4
	mova	%xcc,	%i6,	%l2
	movne	%icc,	%l0,	%g4
	movneg	%xcc,	%o7,	%l5
	orncc	%o1,	%i0,	%g7
	move	%xcc,	%g2,	%o4
	edge16	%i5,	%i4,	%o6
	mulscc	%l6,	%i1,	%o0
	fsrc2	%f20,	%f26
	array32	%o3,	%l1,	%i2
	fornot1s	%f26,	%f13,	%f16
	addcc	%o5,	0x1608,	%g1
	movleu	%xcc,	%i3,	%l3
	fpack32	%f24,	%f22,	%f0
	umul	%o2,	0x01EF,	%i7
	movrgz	%g6,	0x13C,	%g3
	movrgez	%g5,	%l4,	%l2
	array8	%l0,	%g4,	%o7
	andncc	%i6,	%o1,	%i0
	mulx	%g7,	%g2,	%o4
	smul	%l5,	%i4,	%o6
	alignaddrl	%l6,	%i5,	%o0
	movrlez	%o3,	0x3C8,	%l1
	and	%i2,	%o5,	%i1
	fzero	%f10
	movneg	%xcc,	%i3,	%g1
	edge16	%o2,	%i7,	%g6
	mova	%icc,	%g3,	%g5
	umul	%l3,	0x0178,	%l4
	move	%xcc,	%l2,	%l0
	mova	%xcc,	%o7,	%g4
	movneg	%xcc,	%o1,	%i6
	sdivcc	%i0,	0x1FDD,	%g2
	sir	0x1BA4
	orncc	%o4,	0x05CA,	%g7
	movg	%xcc,	%l5,	%i4
	fmovrdgez	%l6,	%f6,	%f26
	stx	%o6,	[%l7 + 0x28]
	xnorcc	%o0,	0x1C44,	%o3
	movgu	%xcc,	%i5,	%l1
	andn	%i2,	0x14CF,	%i1
	fmovdge	%xcc,	%f26,	%f6
	mova	%xcc,	%o5,	%g1
	subcc	%o2,	0x104E,	%i3
	srlx	%g6,	%i7,	%g5
	orncc	%l3,	%l4,	%g3
	xorcc	%l0,	0x192C,	%l2
	subccc	%g4,	%o7,	%i6
	subcc	%o1,	0x0861,	%i0
	orn	%o4,	0x0985,	%g2
	movn	%xcc,	%l5,	%i4
	movleu	%icc,	%g7,	%l6
	xorcc	%o6,	%o0,	%o3
	sir	0x09FE
	movge	%xcc,	%l1,	%i2
	movcs	%xcc,	%i1,	%i5
	ld	[%l7 + 0x60],	%f14
	sethi	0x1FC7,	%o5
	movrgez	%g1,	0x050,	%i3
	mulscc	%o2,	%i7,	%g6
	orn	%l3,	0x0AC7,	%l4
	fmul8x16al	%f0,	%f27,	%f14
	addc	%g3,	%l0,	%g5
	mulscc	%g4,	0x0B5D,	%o7
	alignaddrl	%i6,	%l2,	%i0
	edge32n	%o4,	%o1,	%l5
	fexpand	%f10,	%f18
	fpsub32	%f26,	%f14,	%f10
	smulcc	%g2,	0x1233,	%i4
	movrgez	%l6,	0x333,	%g7
	fmovde	%icc,	%f11,	%f29
	std	%f28,	[%l7 + 0x20]
	fcmpgt32	%f10,	%f28,	%o6
	movleu	%xcc,	%o0,	%o3
	st	%f5,	[%l7 + 0x5C]
	array32	%i2,	%l1,	%i1
	st	%f24,	[%l7 + 0x24]
	movle	%xcc,	%i5,	%g1
	fsrc2	%f0,	%f20
	ldsw	[%l7 + 0x64],	%o5
	movvs	%icc,	%o2,	%i3
	edge32	%i7,	%l3,	%l4
	edge32l	%g6,	%g3,	%g5
	alignaddrl	%g4,	%o7,	%i6
	sra	%l2,	%l0,	%o4
	mulx	%o1,	%l5,	%g2
	movvs	%xcc,	%i0,	%i4
	fmovsneg	%icc,	%f17,	%f15
	edge16l	%g7,	%l6,	%o0
	edge16	%o6,	%o3,	%l1
	orcc	%i1,	%i2,	%g1
	edge16l	%o5,	%i5,	%o2
	edge8	%i3,	%l3,	%i7
	movcs	%xcc,	%g6,	%l4
	fpmerge	%f28,	%f20,	%f26
	fmuld8sux16	%f30,	%f3,	%f0
	stw	%g3,	[%l7 + 0x50]
	addccc	%g4,	0x143F,	%g5
	sra	%i6,	0x10,	%l2
	sllx	%o7,	0x06,	%o4
	ldx	[%l7 + 0x40],	%o1
	fcmpd	%fcc3,	%f12,	%f12
	edge32n	%l0,	%g2,	%i0
	stw	%i4,	[%l7 + 0x3C]
	edge32l	%l5,	%g7,	%o0
	orncc	%o6,	0x10D4,	%l6
	movpos	%xcc,	%o3,	%i1
	ld	[%l7 + 0x38],	%f5
	fmovscs	%xcc,	%f31,	%f17
	alignaddrl	%i2,	%g1,	%l1
	xor	%i5,	0x1207,	%o5
	subcc	%i3,	0x0A22,	%o2
	ld	[%l7 + 0x50],	%f8
	pdist	%f26,	%f8,	%f0
	fcmpne16	%f8,	%f14,	%l3
	fmovdcc	%icc,	%f12,	%f7
	addccc	%i7,	0x0A4A,	%g6
	andn	%l4,	0x12B8,	%g4
	movrlez	%g5,	%i6,	%g3
	movneg	%icc,	%l2,	%o4
	movge	%xcc,	%o7,	%o1
	fcmped	%fcc3,	%f6,	%f8
	fands	%f0,	%f24,	%f23
	movrne	%g2,	0x3E7,	%l0
	fmovrsgz	%i4,	%f19,	%f21
	fpadd32	%f12,	%f0,	%f6
	edge16ln	%l5,	%g7,	%i0
	fmovsleu	%icc,	%f29,	%f6
	subccc	%o0,	%l6,	%o3
	mulx	%o6,	%i2,	%i1
	fmovspos	%xcc,	%f26,	%f8
	stb	%l1,	[%l7 + 0x72]
	fmovsg	%icc,	%f30,	%f14
	ldsh	[%l7 + 0x5E],	%g1
	fsrc1	%f4,	%f4
	fors	%f20,	%f16,	%f6
	movpos	%icc,	%o5,	%i5
	move	%icc,	%i3,	%l3
	subccc	%o2,	0x15DB,	%g6
	movcs	%xcc,	%l4,	%g4
	movle	%xcc,	%g5,	%i7
	edge32	%i6,	%g3,	%o4
	addccc	%l2,	%o7,	%o1
	std	%f22,	[%l7 + 0x08]
	ldx	[%l7 + 0x10],	%l0
	movge	%icc,	%g2,	%l5
	addccc	%g7,	0x1AAA,	%i4
	fmovrdgz	%i0,	%f12,	%f14
	sub	%l6,	%o0,	%o6
	ldub	[%l7 + 0x6C],	%o3
	fmul8ulx16	%f12,	%f2,	%f14
	mova	%icc,	%i1,	%i2
	nop
	set	0x64, %l2
	lduh	[%l7 + %l2],	%l1
	edge8l	%g1,	%o5,	%i3
	array16	%i5,	%o2,	%l3
	edge16l	%l4,	%g6,	%g5
	edge16ln	%i7,	%g4,	%i6
	lduw	[%l7 + 0x40],	%g3
	sub	%o4,	%o7,	%l2
	xorcc	%l0,	%o1,	%g2
	movcs	%icc,	%g7,	%l5
	srax	%i0,	0x17,	%l6
	edge8	%i4,	%o6,	%o3
	srlx	%o0,	0x1B,	%i1
	edge8n	%l1,	%i2,	%g1
	smulcc	%o5,	%i3,	%i5
	movvs	%xcc,	%o2,	%l3
	stb	%l4,	[%l7 + 0x4C]
	fpmerge	%f30,	%f7,	%f6
	edge16n	%g6,	%i7,	%g4
	ldx	[%l7 + 0x50],	%i6
	alignaddr	%g5,	%g3,	%o4
	ldd	[%l7 + 0x20],	%f14
	andn	%o7,	%l2,	%o1
	sdivcc	%g2,	0x162F,	%l0
	movleu	%icc,	%g7,	%l5
	subc	%l6,	%i4,	%o6
	udivx	%i0,	0x1550,	%o0
	ldsh	[%l7 + 0x26],	%o3
	ldx	[%l7 + 0x08],	%i1
	fcmpne16	%f18,	%f2,	%l1
	sllx	%i2,	%g1,	%o5
	fmovdleu	%icc,	%f12,	%f16
	movne	%xcc,	%i3,	%i5
	fmovrsgez	%o2,	%f31,	%f9
	fabss	%f8,	%f19
	andn	%l3,	0x0661,	%g6
	edge16l	%l4,	%g4,	%i7
	fmovdle	%xcc,	%f11,	%f7
	sdivcc	%i6,	0x1A75,	%g5
	fornot1	%f6,	%f4,	%f0
	stb	%o4,	[%l7 + 0x73]
	fmovrdlz	%g3,	%f0,	%f4
	edge16ln	%l2,	%o1,	%g2
	movgu	%icc,	%o7,	%l0
	movre	%l5,	%g7,	%i4
	movne	%icc,	%l6,	%i0
	movrlz	%o6,	0x355,	%o3
	fpsub32s	%f8,	%f17,	%f17
	add	%i1,	%l1,	%o0
	mova	%xcc,	%g1,	%o5
	addcc	%i3,	0x06EF,	%i2
	movrlz	%o2,	%l3,	%g6
	mova	%xcc,	%i5,	%g4
	movrgz	%l4,	0x18D,	%i7
	stw	%i6,	[%l7 + 0x3C]
	movrgz	%o4,	%g3,	%g5
	edge16l	%o1,	%l2,	%g2
	edge8ln	%o7,	%l5,	%l0
	fpsub32	%f16,	%f28,	%f6
	fcmpgt32	%f16,	%f14,	%i4
	sub	%l6,	%i0,	%o6
	fpadd32s	%f1,	%f24,	%f27
	subccc	%o3,	%g7,	%l1
	lduh	[%l7 + 0x4E],	%i1
	edge16n	%o0,	%g1,	%i3
	udivx	%o5,	0x0DCD,	%i2
	sethi	0x14FF,	%l3
	movrlz	%g6,	0x317,	%o2
	orn	%g4,	%i5,	%l4
	fabsd	%f6,	%f14
	addc	%i6,	0x1D35,	%o4
	xnorcc	%i7,	%g3,	%g5
	smulcc	%l2,	0x153D,	%g2
	sethi	0x1A2C,	%o7
	xnor	%o1,	0x13D3,	%l5
	movge	%icc,	%i4,	%l0
	fpadd32s	%f5,	%f29,	%f6
	movg	%xcc,	%i0,	%l6
	addccc	%o6,	%o3,	%l1
	movne	%xcc,	%i1,	%o0
	fornot1	%f0,	%f14,	%f12
	popc	0x1570,	%g7
	xorcc	%g1,	%i3,	%o5
	movge	%xcc,	%l3,	%g6
	movl	%icc,	%i2,	%o2
	fcmpne16	%f18,	%f24,	%i5
	movrlz	%g4,	%l4,	%o4
	fxors	%f21,	%f23,	%f14
	movg	%xcc,	%i6,	%i7
	movrlz	%g3,	%g5,	%l2
	edge32ln	%g2,	%o7,	%o1
	udivx	%i4,	0x0D64,	%l5
	srl	%l0,	%l6,	%i0
	popc	0x12B8,	%o3
	edge16	%o6,	%i1,	%o0
	st	%f13,	[%l7 + 0x18]
	movrgez	%l1,	0x177,	%g7
	ldd	[%l7 + 0x70],	%f24
	addc	%g1,	0x04B0,	%i3
	sll	%o5,	0x1F,	%l3
	umulcc	%i2,	%o2,	%i5
	movleu	%icc,	%g4,	%g6
	lduw	[%l7 + 0x44],	%o4
	ldsb	[%l7 + 0x77],	%i6
	movgu	%icc,	%l4,	%g3
	movleu	%icc,	%i7,	%l2
	array16	%g2,	%o7,	%g5
	movcc	%xcc,	%i4,	%o1
	srax	%l0,	%l5,	%l6
	edge32	%i0,	%o6,	%o3
	movre	%i1,	%o0,	%l1
	fmovsn	%icc,	%f2,	%f0
	orncc	%g7,	%i3,	%g1
	ldub	[%l7 + 0x15],	%l3
	xor	%i2,	0x0058,	%o5
	fmovrse	%i5,	%f10,	%f31
	edge16l	%o2,	%g6,	%g4
	fmovdcs	%icc,	%f29,	%f4
	ldd	[%l7 + 0x10],	%f4
	sllx	%i6,	0x1C,	%o4
	sdiv	%l4,	0x0137,	%i7
	movrlz	%l2,	%g3,	%g2
	orn	%g5,	0x11C3,	%i4
	orn	%o1,	%l0,	%l5
	fmovdcc	%icc,	%f29,	%f23
	movle	%xcc,	%l6,	%o7
	mulx	%o6,	0x1D6F,	%i0
	for	%f30,	%f20,	%f24
	andncc	%i1,	%o0,	%l1
	srax	%g7,	%o3,	%i3
	fpsub16s	%f21,	%f28,	%f22
	edge32	%l3,	%i2,	%g1
	sethi	0x0026,	%i5
	ldsh	[%l7 + 0x24],	%o5
	movl	%icc,	%o2,	%g6
	udivcc	%i6,	0x0343,	%o4
	movvs	%icc,	%l4,	%g4
	udivx	%l2,	0x1759,	%i7
	fmul8x16au	%f5,	%f9,	%f30
	sllx	%g3,	0x06,	%g5
	movneg	%icc,	%i4,	%o1
	edge16l	%l0,	%l5,	%l6
	fxor	%f30,	%f18,	%f4
	sir	0x0BA9
	edge32l	%g2,	%o6,	%i0
	array32	%o7,	%o0,	%l1
	srax	%g7,	%o3,	%i3
	ldsw	[%l7 + 0x14],	%l3
	fcmpgt16	%f24,	%f6,	%i1
	sir	0x1C8D
	andcc	%i2,	0x03A0,	%g1
	xnor	%o5,	0x1588,	%o2
	fsrc1	%f16,	%f28
	smul	%i5,	0x0A9D,	%i6
	sdivx	%g6,	0x1D0C,	%o4
	movrne	%l4,	0x2DB,	%l2
	fabsd	%f16,	%f22
	xor	%g4,	%g3,	%i7
	edge32l	%i4,	%g5,	%l0
	srax	%o1,	0x1C,	%l6
	movvs	%xcc,	%g2,	%o6
	edge32l	%i0,	%l5,	%o0
	movle	%xcc,	%l1,	%g7
	fnegs	%f12,	%f11
	sethi	0x1FEC,	%o3
	edge16ln	%i3,	%o7,	%l3
	ldub	[%l7 + 0x34],	%i1
	orcc	%i2,	0x0485,	%o5
	movvs	%xcc,	%g1,	%o2
	ldsw	[%l7 + 0x4C],	%i5
	edge32n	%g6,	%i6,	%o4
	edge8	%l2,	%l4,	%g4
	movge	%xcc,	%i7,	%g3
	fornot1s	%f11,	%f6,	%f7
	fmovdvc	%xcc,	%f10,	%f24
	fzero	%f16
	sll	%i4,	%g5,	%l0
	orcc	%l6,	%o1,	%g2
	movgu	%icc,	%o6,	%i0
	movvc	%icc,	%l5,	%o0
	movleu	%icc,	%l1,	%o3
	smul	%i3,	0x1535,	%g7
	movrlez	%l3,	%o7,	%i1
	edge16l	%i2,	%g1,	%o5
	sir	0x09D3
	movpos	%xcc,	%o2,	%g6
	movre	%i6,	0x367,	%o4
	fpsub16s	%f6,	%f30,	%f26
	sra	%l2,	0x08,	%i5
	subc	%g4,	%l4,	%i7
	mova	%xcc,	%i4,	%g5
	movrlez	%g3,	0x063,	%l6
	nop
	set	0x33, %l0
	ldsb	[%l7 + %l0],	%l0
	srlx	%g2,	%o6,	%i0
	movle	%xcc,	%l5,	%o0
	fmul8x16	%f1,	%f10,	%f20
	add	%o1,	%o3,	%l1
	movrgz	%i3,	0x296,	%l3
	srlx	%g7,	0x1C,	%i1
	movneg	%xcc,	%i2,	%g1
	fpsub16s	%f4,	%f16,	%f14
	addccc	%o5,	%o7,	%g6
	array16	%o2,	%o4,	%l2
	smul	%i6,	%g4,	%l4
	movcc	%xcc,	%i7,	%i5
	xorcc	%g5,	0x016B,	%g3
	ldd	[%l7 + 0x70],	%f0
	udivx	%l6,	0x1DA9,	%l0
	alignaddr	%g2,	%o6,	%i0
	movrlez	%l5,	%i4,	%o0
	fmovrde	%o3,	%f0,	%f26
	movpos	%xcc,	%l1,	%o1
	movpos	%xcc,	%i3,	%l3
	fpsub16s	%f30,	%f23,	%f1
	edge8n	%i1,	%g7,	%g1
	sdivcc	%i2,	0x1A08,	%o7
	fmul8ulx16	%f16,	%f20,	%f30
	fmovsa	%xcc,	%f10,	%f11
	ldub	[%l7 + 0x6E],	%o5
	fmovsvc	%icc,	%f18,	%f4
	add	%g6,	%o2,	%o4
	mova	%icc,	%i6,	%g4
	edge32n	%l4,	%i7,	%i5
	movre	%g5,	0x30C,	%g3
	movneg	%icc,	%l6,	%l0
	movcs	%icc,	%l2,	%o6
	fmovrdgz	%g2,	%f24,	%f8
	fmovrsgz	%l5,	%f22,	%f29
	bshuffle	%f22,	%f18,	%f24
	addcc	%i4,	%o0,	%i0
	sdivcc	%o3,	0x083F,	%o1
	fpack16	%f8,	%f1
	movge	%icc,	%l1,	%i3
	udiv	%i1,	0x0865,	%l3
	xorcc	%g1,	%g7,	%i2
	movrne	%o7,	0x2FD,	%g6
	std	%f24,	[%l7 + 0x70]
	std	%f10,	[%l7 + 0x50]
	array8	%o5,	%o4,	%o2
	srlx	%g4,	%l4,	%i6
	orcc	%i5,	%i7,	%g3
	fpackfix	%f8,	%f3
	for	%f0,	%f2,	%f12
	movrgz	%g5,	0x37A,	%l0
	edge8n	%l2,	%l6,	%g2
	std	%f18,	[%l7 + 0x78]
	subcc	%o6,	%l5,	%o0
	fmovrse	%i4,	%f4,	%f23
	sra	%o3,	0x1F,	%o1
	xor	%l1,	0x0998,	%i0
	fcmpne32	%f20,	%f14,	%i1
	nop
	set	0x60, %l6
	stx	%i3,	[%l7 + %l6]
	udiv	%g1,	0x05C2,	%g7
	andncc	%l3,	%o7,	%i2
	subc	%o5,	%o4,	%g6
	sdivx	%g4,	0x04E5,	%o2
	andncc	%i6,	%l4,	%i5
	movge	%icc,	%g3,	%i7
	pdist	%f28,	%f26,	%f12
	sllx	%g5,	0x1E,	%l2
	movg	%xcc,	%l6,	%g2
	array16	%o6,	%l0,	%o0
	ldsh	[%l7 + 0x28],	%l5
	edge16	%o3,	%o1,	%i4
	stb	%l1,	[%l7 + 0x32]
	movpos	%xcc,	%i0,	%i1
	sth	%i3,	[%l7 + 0x3E]
	fmovrde	%g7,	%f10,	%f10
	sub	%g1,	0x0256,	%l3
	fxors	%f4,	%f6,	%f18
	subc	%o7,	0x0CF2,	%i2
	ld	[%l7 + 0x68],	%f22
	fmovdgu	%icc,	%f1,	%f15
	mulscc	%o4,	%o5,	%g4
	fmovscc	%xcc,	%f25,	%f0
	orn	%g6,	%o2,	%l4
	fmovdge	%xcc,	%f12,	%f4
	movre	%i6,	0x118,	%i5
	udivx	%g3,	0x05A0,	%i7
	popc	%g5,	%l6
	ld	[%l7 + 0x5C],	%f21
	movrgz	%l2,	0x2CB,	%o6
	movle	%icc,	%g2,	%l0
	srax	%l5,	0x15,	%o0
	udivx	%o3,	0x1568,	%i4
	movle	%icc,	%l1,	%o1
	stb	%i1,	[%l7 + 0x64]
	orncc	%i0,	%g7,	%i3
	fmovscs	%icc,	%f5,	%f24
	fmovsvs	%icc,	%f14,	%f21
	sdivcc	%g1,	0x0063,	%l3
	movle	%icc,	%i2,	%o7
	addcc	%o4,	0x03F3,	%o5
	sll	%g6,	%o2,	%g4
	edge16ln	%l4,	%i6,	%g3
	fnot2s	%f30,	%f2
	andcc	%i5,	%i7,	%l6
	smul	%l2,	0x1E35,	%g5
	fmovrdlez	%g2,	%f14,	%f12
	andncc	%o6,	%l0,	%o0
	stb	%l5,	[%l7 + 0x57]
	addcc	%o3,	0x1A1B,	%i4
	fmovsne	%xcc,	%f11,	%f0
	fzero	%f16
	fmovsvs	%icc,	%f7,	%f13
	fsrc2	%f14,	%f14
	addccc	%o1,	0x14D1,	%l1
	udivx	%i1,	0x12A2,	%g7
	subccc	%i3,	0x17B6,	%g1
	stx	%i0,	[%l7 + 0x78]
	stx	%i2,	[%l7 + 0x08]
	edge32n	%o7,	%o4,	%l3
	movvs	%icc,	%g6,	%o5
	srl	%g4,	%l4,	%o2
	array32	%g3,	%i5,	%i7
	ldd	[%l7 + 0x68],	%f20
	andn	%l6,	%l2,	%i6
	movle	%xcc,	%g5,	%o6
	fexpand	%f5,	%f2
	fmovsn	%icc,	%f16,	%f8
	sdivx	%l0,	0x1F1B,	%g2
	movneg	%xcc,	%l5,	%o0
	sir	0x0C91
	st	%f8,	[%l7 + 0x28]
	movrgz	%i4,	%o3,	%l1
	subc	%o1,	0x1293,	%i1
	mova	%icc,	%i3,	%g7
	udivx	%i0,	0x0EF2,	%g1
	fmovdcs	%icc,	%f26,	%f6
	fmovdg	%xcc,	%f11,	%f2
	alignaddr	%i2,	%o4,	%o7
	edge16n	%g6,	%l3,	%g4
	lduw	[%l7 + 0x0C],	%o5
	array8	%l4,	%o2,	%i5
	edge32n	%g3,	%i7,	%l6
	ldub	[%l7 + 0x6E],	%l2
	movneg	%xcc,	%i6,	%g5
	addc	%o6,	0x00F7,	%g2
	xor	%l0,	%o0,	%i4
	movleu	%xcc,	%o3,	%l5
	edge8	%l1,	%i1,	%i3
	addc	%g7,	%o1,	%i0
	xnor	%i2,	%o4,	%g1
	ldx	[%l7 + 0x78],	%g6
	nop
	set	0x78, %o0
	lduh	[%l7 + %o0],	%l3
	and	%g4,	%o5,	%l4
	sra	%o2,	%i5,	%g3
	fones	%f3
	edge32	%o7,	%i7,	%l6
	mulscc	%l2,	%g5,	%o6
	smul	%g2,	%l0,	%i6
	array8	%i4,	%o0,	%o3
	movleu	%icc,	%l5,	%i1
	fcmpne16	%f12,	%f10,	%i3
	nop
	set	0x3C, %g2
	lduh	[%l7 + %g2],	%l1
	movpos	%xcc,	%o1,	%i0
	fmovda	%icc,	%f12,	%f31
	srl	%i2,	%g7,	%g1
	alignaddrl	%o4,	%l3,	%g6
	movre	%g4,	%l4,	%o2
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	fpack32	%f30,	%f24,	%f14
	umul	%o5,	%i7,	%o7
	movrne	%l6,	0x287,	%g5
	edge32n	%o6,	%g2,	%l2
	edge32ln	%l0,	%i6,	%i4
	restore %o3, 0x0063, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l5,	[%l7 + 0x47]
	fmovde	%xcc,	%f27,	%f24
	or	%i1,	%l1,	%o1
	umulcc	%i3,	0x0179,	%i0
	xor	%g7,	%g1,	%i2
	orncc	%l3,	0x1ACA,	%o4
	fmovrdgez	%g6,	%f30,	%f2
	array8	%g4,	%o2,	%i5
	addccc	%g3,	%l4,	%i7
	umulcc	%o5,	%l6,	%g5
	fzeros	%f31
	sethi	0x06FF,	%o7
	edge32n	%o6,	%l2,	%g2
	xorcc	%i6,	%l0,	%o3
	andn	%i4,	0x111A,	%o0
	edge16	%l5,	%l1,	%o1
	array32	%i1,	%i3,	%i0
	addc	%g7,	%g1,	%l3
	addcc	%o4,	%g6,	%i2
	fmovdle	%xcc,	%f30,	%f4
	bshuffle	%f28,	%f20,	%f0
	movg	%icc,	%g4,	%i5
	movl	%xcc,	%g3,	%o2
	mova	%icc,	%l4,	%o5
	ldd	[%l7 + 0x38],	%f24
	orncc	%l6,	0x1CB5,	%g5
	edge16l	%i7,	%o7,	%o6
	smulcc	%l2,	%i6,	%g2
	array8	%o3,	%i4,	%l0
	fpack16	%f0,	%f2
	fmovspos	%icc,	%f9,	%f2
	ldd	[%l7 + 0x08],	%o0
	fmovrsgz	%l5,	%f5,	%f28
	edge16n	%o1,	%l1,	%i1
	edge8	%i3,	%g7,	%i0
	ldsb	[%l7 + 0x54],	%l3
	smulcc	%g1,	0x1188,	%o4
	fmovsa	%xcc,	%f28,	%f2
	xnor	%i2,	%g4,	%g6
	stw	%i5,	[%l7 + 0x0C]
	popc	%o2,	%g3
	lduh	[%l7 + 0x28],	%l4
	ldsb	[%l7 + 0x76],	%o5
	edge8ln	%l6,	%g5,	%o7
	orn	%i7,	%o6,	%l2
	movrlez	%g2,	0x037,	%o3
	stw	%i6,	[%l7 + 0x30]
	stx	%i4,	[%l7 + 0x78]
	edge16ln	%l0,	%o0,	%o1
	stw	%l5,	[%l7 + 0x40]
	fcmpd	%fcc1,	%f20,	%f6
	ldsw	[%l7 + 0x20],	%l1
	fmul8ulx16	%f16,	%f20,	%f4
	fpsub16s	%f24,	%f7,	%f5
	movgu	%xcc,	%i3,	%i1
	movrgez	%g7,	0x2AA,	%i0
	sra	%g1,	0x06,	%o4
	edge8	%i2,	%g4,	%l3
	andcc	%g6,	0x13F2,	%i5
	movle	%xcc,	%g3,	%l4
	umul	%o2,	0x005A,	%o5
	orcc	%g5,	0x1F21,	%l6
	edge8	%i7,	%o6,	%o7
	alignaddrl	%l2,	%o3,	%g2
	array16	%i6,	%l0,	%o0
	array16	%i4,	%l5,	%o1
	andn	%i3,	0x023F,	%l1
	movleu	%icc,	%i1,	%g7
	smul	%i0,	%g1,	%o4
	udiv	%g4,	0x16D2,	%l3
	edge32	%g6,	%i5,	%g3
	alignaddrl	%i2,	%l4,	%o2
	st	%f16,	[%l7 + 0x38]
	edge16ln	%g5,	%l6,	%i7
	movrgz	%o6,	%o7,	%o5
	fmovsa	%icc,	%f17,	%f14
	fmovdn	%xcc,	%f22,	%f27
	edge8n	%l2,	%o3,	%g2
	fmovdneg	%xcc,	%f30,	%f28
	movneg	%icc,	%l0,	%i6
	udivcc	%i4,	0x0B7B,	%l5
	fmovrslz	%o0,	%f11,	%f29
	edge32l	%o1,	%l1,	%i1
	subcc	%g7,	0x0C09,	%i3
	fmovdgu	%icc,	%f16,	%f13
	xor	%g1,	%i0,	%o4
	mulscc	%l3,	0x1386,	%g4
	fmovsvc	%xcc,	%f27,	%f30
	umul	%i5,	%g3,	%g6
	movre	%l4,	0x36E,	%o2
	orcc	%g5,	0x0B02,	%i2
	sethi	0x0A29,	%i7
	ldd	[%l7 + 0x70],	%f18
	fxor	%f14,	%f20,	%f30
	stb	%l6,	[%l7 + 0x6D]
	movleu	%icc,	%o7,	%o5
	ldsw	[%l7 + 0x1C],	%l2
	ldsb	[%l7 + 0x68],	%o3
	fmovrdlez	%g2,	%f6,	%f2
	udiv	%l0,	0x1A87,	%o6
	sethi	0x00B5,	%i6
	edge16ln	%l5,	%i4,	%o1
	edge16n	%o0,	%l1,	%g7
	andcc	%i1,	%i3,	%g1
	movrlz	%i0,	%l3,	%g4
	movrlez	%o4,	0x1CC,	%i5
	edge8	%g6,	%g3,	%l4
	bshuffle	%f12,	%f2,	%f8
	siam	0x0
	fzero	%f16
	fmovrse	%g5,	%f28,	%f31
	ldsh	[%l7 + 0x38],	%o2
	lduh	[%l7 + 0x10],	%i2
	movn	%icc,	%i7,	%o7
	array8	%l6,	%o5,	%l2
	umulcc	%o3,	0x1E97,	%g2
	fpadd16s	%f22,	%f3,	%f8
	fornot2s	%f14,	%f29,	%f24
	ldub	[%l7 + 0x50],	%l0
	st	%f30,	[%l7 + 0x10]
	array32	%o6,	%l5,	%i4
	movvc	%icc,	%i6,	%o0
	edge16l	%o1,	%g7,	%l1
	addc	%i3,	%g1,	%i1
	alignaddr	%l3,	%i0,	%g4
	umulcc	%i5,	0x0392,	%o4
	sll	%g3,	0x01,	%g6
	fnot1s	%f25,	%f18
	fnot2	%f26,	%f24
	movrlz	%g5,	%l4,	%i2
	subc	%i7,	%o2,	%l6
	st	%f19,	[%l7 + 0x50]
	sth	%o7,	[%l7 + 0x12]
	orn	%l2,	0x1D4C,	%o3
	stw	%g2,	[%l7 + 0x14]
	ldsb	[%l7 + 0x70],	%o5
	mulx	%o6,	0x0F51,	%l5
	edge8	%i4,	%i6,	%l0
	fandnot2s	%f5,	%f13,	%f31
	xnor	%o0,	0x034A,	%o1
	ldsh	[%l7 + 0x48],	%l1
	lduh	[%l7 + 0x34],	%g7
	fcmpne16	%f14,	%f0,	%g1
	fmul8x16	%f10,	%f18,	%f12
	fmovrdne	%i1,	%f2,	%f6
	stb	%i3,	[%l7 + 0x20]
	fmovsn	%xcc,	%f17,	%f13
	alignaddrl	%i0,	%l3,	%g4
	edge8ln	%o4,	%i5,	%g6
	alignaddr	%g3,	%g5,	%l4
	edge8l	%i7,	%i2,	%o2
	subc	%o7,	%l6,	%l2
	fmovd	%f10,	%f30
	fmovdne	%xcc,	%f13,	%f21
	orcc	%g2,	0x066D,	%o3
	nop
	set	0x11, %i3
	stb	%o6,	[%l7 + %i3]
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%f2
	addcc	%o5,	%l5,	%i6
	fxnors	%f6,	%f14,	%f26
	xnor	%i4,	%o0,	%o1
	movrne	%l1,	%l0,	%g7
	xnor	%g1,	0x0752,	%i3
	array8	%i0,	%i1,	%l3
	subccc	%o4,	%i5,	%g6
	movvc	%xcc,	%g3,	%g4
	andncc	%l4,	%i7,	%g5
	udiv	%o2,	0x0E86,	%o7
	sdiv	%i2,	0x077C,	%l6
	fones	%f14
	subc	%l2,	0x01C8,	%g2
	orcc	%o6,	0x0EF2,	%o5
	edge32ln	%o3,	%l5,	%i4
	addc	%o0,	%o1,	%l1
	alignaddrl	%l0,	%i6,	%g1
	sdivcc	%i3,	0x1C99,	%g7
	sdivcc	%i0,	0x109A,	%i1
	xor	%o4,	%i5,	%l3
	mulscc	%g3,	%g6,	%l4
	movvc	%xcc,	%g4,	%g5
	array32	%o2,	%o7,	%i7
	fcmpeq32	%f2,	%f30,	%i2
	movge	%xcc,	%l2,	%g2
	udivx	%o6,	0x1C92,	%o5
	save %l6, 0x015E, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f26,	[%l7 + 0x58]
	fandnot1	%f26,	%f28,	%f18
	movleu	%icc,	%l5,	%i4
	stb	%o0,	[%l7 + 0x10]
	subcc	%o1,	%l0,	%l1
	fnot2s	%f6,	%f8
	umul	%g1,	%i3,	%i6
	fmovdpos	%icc,	%f24,	%f5
	movre	%i0,	%i1,	%g7
	fpack32	%f10,	%f0,	%f8
	movrlz	%o4,	0x3E6,	%l3
	fmovrde	%i5,	%f16,	%f0
	edge32l	%g6,	%l4,	%g4
	movvc	%icc,	%g3,	%o2
	fmovdneg	%xcc,	%f25,	%f12
	fmovsle	%icc,	%f7,	%f17
	ldsh	[%l7 + 0x5E],	%o7
	fandnot1	%f4,	%f14,	%f20
	xnor	%i7,	0x1A46,	%g5
	nop
	set	0x64, %o3
	lduw	[%l7 + %o3],	%l2
	xnor	%g2,	0x0629,	%i2
	andn	%o5,	%l6,	%o3
	sdivx	%o6,	0x1CBA,	%i4
	sllx	%o0,	0x18,	%l5
	ldsw	[%l7 + 0x68],	%l0
	alignaddrl	%o1,	%l1,	%i3
	movvs	%xcc,	%i6,	%g1
	alignaddr	%i0,	%g7,	%i1
	movrne	%l3,	0x25A,	%i5
	sra	%g6,	0x14,	%o4
	fmul8sux16	%f8,	%f22,	%f0
	stb	%g4,	[%l7 + 0x14]
	umul	%g3,	0x1105,	%l4
	sdiv	%o7,	0x0188,	%i7
	ldd	[%l7 + 0x30],	%f6
	st	%f24,	[%l7 + 0x24]
	sir	0x12F3
	subc	%g5,	0x0C1E,	%o2
	alignaddrl	%g2,	%l2,	%o5
	movl	%icc,	%i2,	%o3
	sdiv	%o6,	0x12D6,	%l6
	fmovrdgez	%i4,	%f20,	%f0
	movre	%o0,	%l0,	%l5
	stw	%l1,	[%l7 + 0x64]
	movpos	%xcc,	%i3,	%o1
	edge32	%i6,	%i0,	%g7
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	fsrc1	%f16,	%f4
	ldsw	[%l7 + 0x10],	%g6
	nop
	set	0x18, %l3
	stx	%i5,	[%l7 + %l3]
	array32	%o4,	%g3,	%g4
	sth	%o7,	[%l7 + 0x36]
	edge32l	%l4,	%g5,	%o2
	andcc	%i7,	%g2,	%o5
	movl	%icc,	%i2,	%l2
	movvs	%xcc,	%o6,	%o3
	sdivcc	%l6,	0x0C14,	%i4
	movn	%xcc,	%l0,	%l5
	movgu	%icc,	%l1,	%i3
	xnor	%o0,	0x0249,	%o1
	fones	%f21
	movrgez	%i0,	%g7,	%i1
	fornot2s	%f21,	%f25,	%f6
	fsrc1s	%f29,	%f24
	movvs	%xcc,	%l3,	%i6
	movleu	%icc,	%g1,	%g6
	nop
	set	0x50, %o5
	stx	%o4,	[%l7 + %o5]
	sdivx	%i5,	0x0BFE,	%g4
	edge16ln	%g3,	%o7,	%g5
	stw	%o2,	[%l7 + 0x70]
	udivcc	%l4,	0x0C2C,	%g2
	fmovde	%xcc,	%f27,	%f21
	movle	%icc,	%o5,	%i2
	or	%i7,	0x0ADA,	%o6
	edge8ln	%o3,	%l2,	%l6
	fpadd16s	%f10,	%f24,	%f13
	sth	%i4,	[%l7 + 0x5C]
	ldsb	[%l7 + 0x46],	%l5
	movre	%l0,	0x354,	%i3
	stx	%o0,	[%l7 + 0x18]
	array8	%o1,	%l1,	%g7
	movcc	%icc,	%i0,	%l3
	sdivx	%i6,	0x0961,	%g1
	sethi	0x0F9D,	%g6
	orcc	%i1,	%i5,	%o4
	std	%f10,	[%l7 + 0x20]
	std	%f12,	[%l7 + 0x10]
	edge16l	%g3,	%o7,	%g4
	alignaddrl	%g5,	%o2,	%g2
	ld	[%l7 + 0x44],	%f26
	fcmpeq16	%f10,	%f4,	%o5
	fmul8x16au	%f14,	%f23,	%f0
	edge32l	%l4,	%i2,	%o6
	addccc	%o3,	%i7,	%l2
	sdivx	%l6,	0x1AF1,	%l5
	edge16ln	%i4,	%l0,	%o0
	srl	%i3,	%l1,	%g7
	addcc	%i0,	%l3,	%o1
	ldsh	[%l7 + 0x6C],	%i6
	addccc	%g1,	%i1,	%i5
	addcc	%g6,	0x08DD,	%o4
	fmovrde	%o7,	%f4,	%f2
	addc	%g4,	0x088B,	%g5
	fcmpeq32	%f26,	%f6,	%g3
	popc	0x0B8E,	%o2
	subc	%o5,	0x010F,	%g2
	st	%f15,	[%l7 + 0x58]
	stx	%i2,	[%l7 + 0x68]
	xnor	%l4,	0x1768,	%o3
	std	%f16,	[%l7 + 0x30]
	std	%f0,	[%l7 + 0x40]
	xorcc	%i7,	0x1BAB,	%l2
	popc	0x0040,	%l6
	restore %o6, 0x1E06, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%i4,	%o0
	movrlz	%l0,	%l1,	%i3
	fmovsvs	%icc,	%f11,	%f2
	save %i0, 0x10CB, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o1,	%l3,	%g1
	fmovdge	%xcc,	%f14,	%f0
	andncc	%i6,	%i1,	%g6
	andn	%o4,	%i5,	%g4
	smul	%g5,	%o7,	%o2
	xnor	%o5,	0x1303,	%g3
	movleu	%xcc,	%i2,	%l4
	fmovd	%f4,	%f2
	alignaddr	%o3,	%i7,	%g2
	fmovdleu	%icc,	%f24,	%f14
	mulscc	%l2,	0x0629,	%o6
	fmovrdgz	%l6,	%f24,	%f0
	xor	%i4,	0x18E7,	%l5
	fmovsn	%icc,	%f4,	%f2
	addccc	%l0,	%o0,	%l1
	edge32ln	%i3,	%g7,	%i0
	ld	[%l7 + 0x60],	%f6
	udivx	%l3,	0x0BAB,	%o1
	fnot1s	%f27,	%f0
	fmovscc	%icc,	%f1,	%f19
	move	%icc,	%i6,	%g1
	sub	%g6,	%i1,	%o4
	fmuld8sux16	%f18,	%f17,	%f18
	alignaddr	%i5,	%g5,	%g4
	edge32n	%o7,	%o5,	%o2
	ld	[%l7 + 0x68],	%f19
	umulcc	%i2,	0x0C20,	%l4
	movvs	%xcc,	%g3,	%i7
	movl	%icc,	%g2,	%l2
	fnot2	%f10,	%f4
	std	%f14,	[%l7 + 0x10]
	mova	%icc,	%o6,	%l6
	movvs	%icc,	%i4,	%l5
	fpmerge	%f0,	%f16,	%f10
	or	%l0,	0x0951,	%o3
	fnegd	%f28,	%f20
	edge8ln	%l1,	%i3,	%o0
	fsrc1s	%f1,	%f19
	edge32n	%i0,	%g7,	%l3
	edge32n	%i6,	%g1,	%o1
	udivcc	%g6,	0x0288,	%o4
	fmovdvc	%xcc,	%f15,	%f30
	alignaddrl	%i5,	%g5,	%g4
	fcmps	%fcc2,	%f16,	%f20
	save %o7, 0x18D3, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o2,	%i2,	%o5
	udivx	%l4,	0x1383,	%i7
	subcc	%g2,	0x0007,	%g3
	st	%f19,	[%l7 + 0x6C]
	umulcc	%l2,	%l6,	%o6
	movgu	%icc,	%i4,	%l0
	fnot2s	%f25,	%f7
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%l5
	mulx	%o3,	0x10E0,	%i3
	lduh	[%l7 + 0x52],	%o0
	movcc	%icc,	%l1,	%g7
	edge32n	%i0,	%i6,	%l3
	popc	%g1,	%g6
	fcmpne32	%f20,	%f26,	%o1
	fcmpgt32	%f22,	%f16,	%o4
	sra	%i5,	%g4,	%g5
	udivcc	%o7,	0x0288,	%i1
	fands	%f5,	%f16,	%f25
	fmovdne	%xcc,	%f15,	%f28
	sdivx	%i2,	0x132C,	%o5
	ld	[%l7 + 0x50],	%f26
	movne	%icc,	%l4,	%o2
	ldsw	[%l7 + 0x7C],	%i7
	add	%g3,	%g2,	%l6
	udivx	%o6,	0x14FA,	%l2
	movrlez	%i4,	%l5,	%l0
	sdiv	%i3,	0x178D,	%o0
	sllx	%l1,	0x0B,	%o3
	fmovdg	%xcc,	%f4,	%f6
	fzero	%f10
	subccc	%i0,	%i6,	%g7
	udivcc	%l3,	0x0633,	%g6
	movleu	%xcc,	%o1,	%g1
	fcmpgt32	%f4,	%f0,	%i5
	xorcc	%g4,	0x0076,	%g5
	stb	%o4,	[%l7 + 0x62]
	addcc	%i1,	0x00BB,	%i2
	srlx	%o7,	0x1B,	%l4
	ldsh	[%l7 + 0x7E],	%o2
	movn	%icc,	%i7,	%g3
	fpmerge	%f12,	%f18,	%f6
	st	%f5,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%f7
	std	%f14,	[%l7 + 0x70]
	ldsw	[%l7 + 0x34],	%g2
	st	%f7,	[%l7 + 0x0C]
	edge16l	%l6,	%o5,	%l2
	fcmps	%fcc2,	%f13,	%f12
	or	%i4,	0x054C,	%l5
	movvc	%icc,	%l0,	%i3
	sdiv	%o6,	0x17C5,	%o0
	stw	%o3,	[%l7 + 0x74]
	sth	%l1,	[%l7 + 0x3C]
	edge32n	%i6,	%i0,	%l3
	fnor	%f30,	%f24,	%f4
	ldsb	[%l7 + 0x5D],	%g7
	sir	0x0CF7
	edge32n	%o1,	%g1,	%i5
	add	%g4,	%g5,	%g6
	fmul8ulx16	%f18,	%f4,	%f10
	sdivx	%i1,	0x157B,	%o4
	fnegd	%f10,	%f20
	or	%o7,	%i2,	%o2
	movrgz	%i7,	%g3,	%l4
	xnor	%l6,	%o5,	%l2
	sra	%i4,	0x01,	%g2
	fcmps	%fcc3,	%f19,	%f5
	fands	%f17,	%f20,	%f24
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%l5
	ldd	[%l7 + 0x48],	%f30
	fandnot1	%f22,	%f4,	%f2
	mulscc	%i3,	0x0C88,	%o6
	umulcc	%l0,	0x19B6,	%o3
	st	%f27,	[%l7 + 0x4C]
	movvc	%icc,	%o0,	%l1
	movg	%icc,	%i0,	%l3
	fsrc1	%f22,	%f24
	popc	%g7,	%i6
	orcc	%g1,	0x066C,	%i5
	orncc	%g4,	%o1,	%g5
	orn	%i1,	0x12F4,	%g6
	edge16l	%o4,	%o7,	%o2
	movn	%icc,	%i2,	%i7
	stx	%l4,	[%l7 + 0x50]
	st	%f31,	[%l7 + 0x10]
	orncc	%l6,	0x1329,	%o5
	edge8n	%g3,	%l2,	%i4
	movn	%icc,	%g2,	%l5
	array32	%o6,	%l0,	%i3
	movrgz	%o3,	%l1,	%i0
	movleu	%icc,	%l3,	%g7
	addcc	%i6,	0x0B43,	%g1
	edge16	%o0,	%g4,	%i5
	sdivcc	%o1,	0x1A32,	%i1
	stb	%g6,	[%l7 + 0x1C]
	fnor	%f16,	%f22,	%f2
	movcs	%icc,	%o4,	%o7
	sdiv	%o2,	0x1D64,	%i2
	fmovrslez	%i7,	%f29,	%f11
	fcmps	%fcc0,	%f16,	%f8
	addccc	%l4,	0x00F8,	%l6
	subcc	%o5,	0x110E,	%g5
	fmovrdlz	%l2,	%f8,	%f16
	edge8	%i4,	%g3,	%g2
	fandnot2	%f18,	%f30,	%f14
	edge32ln	%o6,	%l0,	%i3
	andncc	%l5,	%o3,	%l1
	fmul8ulx16	%f26,	%f12,	%f6
	fornot2s	%f8,	%f17,	%f28
	edge8ln	%l3,	%i0,	%g7
	movre	%i6,	0x01F,	%g1
	popc	%o0,	%g4
	stw	%o1,	[%l7 + 0x44]
	movre	%i1,	0x1CD,	%g6
	stb	%o4,	[%l7 + 0x09]
	umulcc	%o7,	0x119E,	%i5
	xorcc	%i2,	0x0AF8,	%i7
	fpmerge	%f14,	%f10,	%f8
	mova	%icc,	%o2,	%l4
	fzeros	%f22
	siam	0x4
	sra	%l6,	%o5,	%l2
	fpmerge	%f11,	%f5,	%f4
	orcc	%i4,	%g5,	%g3
	sethi	0x0BB3,	%o6
	movcs	%icc,	%l0,	%g2
	fnot2s	%f22,	%f23
	movg	%icc,	%l5,	%i3
	movl	%xcc,	%l1,	%l3
	srax	%o3,	0x15,	%i0
	edge32	%i6,	%g1,	%g7
	fcmpne16	%f24,	%f22,	%o0
	movrne	%g4,	%i1,	%o1
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	ldx	[%l7 + 0x30],	%i5
	lduw	[%l7 + 0x58],	%i2
	movpos	%xcc,	%o7,	%i7
	fsrc2s	%f6,	%f30
	ldub	[%l7 + 0x50],	%l4
	edge16l	%o2,	%l6,	%l2
	edge16	%o5,	%g5,	%i4
	fcmple32	%f0,	%f26,	%g3
	movleu	%icc,	%o6,	%l0
	std	%f2,	[%l7 + 0x58]
	edge32	%l5,	%i3,	%l1
	fpadd32s	%f11,	%f31,	%f8
	xnorcc	%g2,	%o3,	%i0
	for	%f20,	%f30,	%f24
	fpmerge	%f16,	%f18,	%f8
	ld	[%l7 + 0x68],	%f12
	ldsb	[%l7 + 0x7F],	%l3
	or	%g1,	0x1B76,	%g7
	movrne	%i6,	%o0,	%i1
	array32	%g4,	%o1,	%o4
	fcmpne16	%f0,	%f30,	%g6
	fmovdn	%xcc,	%f8,	%f29
	movle	%xcc,	%i5,	%i2
	srlx	%i7,	%l4,	%o2
	stb	%o7,	[%l7 + 0x2B]
	ldx	[%l7 + 0x30],	%l6
	fmovrde	%l2,	%f0,	%f6
	ldx	[%l7 + 0x38],	%g5
	movne	%icc,	%i4,	%g3
	ldsh	[%l7 + 0x5A],	%o6
	edge8l	%o5,	%l0,	%l5
	edge16ln	%l1,	%i3,	%o3
	orn	%i0,	0x0197,	%l3
	movre	%g1,	%g7,	%g2
	addcc	%i6,	%o0,	%i1
	movleu	%icc,	%o1,	%o4
	array32	%g4,	%g6,	%i2
	movleu	%xcc,	%i7,	%i5
	movvc	%xcc,	%o2,	%l4
	fornot2s	%f4,	%f22,	%f30
	sdiv	%o7,	0x0FB9,	%l2
	st	%f7,	[%l7 + 0x4C]
	fpsub32	%f0,	%f2,	%f16
	edge8ln	%g5,	%i4,	%l6
	sdiv	%o6,	0x077A,	%g3
	movn	%xcc,	%o5,	%l5
	mulscc	%l1,	%i3,	%l0
	fcmps	%fcc0,	%f6,	%f12
	movgu	%icc,	%o3,	%i0
	edge16ln	%l3,	%g1,	%g2
	alignaddrl	%i6,	%o0,	%i1
	sdivx	%g7,	0x13D3,	%o1
	movrgez	%g4,	0x0E8,	%g6
	mulscc	%i2,	%i7,	%i5
	xorcc	%o4,	0x1D79,	%o2
	fmovdcc	%xcc,	%f2,	%f28
	subcc	%o7,	0x0BF1,	%l2
	edge16n	%l4,	%i4,	%g5
	st	%f29,	[%l7 + 0x54]
	xor	%o6,	%g3,	%l6
	mulscc	%o5,	%l5,	%i3
	movle	%icc,	%l0,	%o3
	movrlz	%l1,	%i0,	%g1
	movvs	%xcc,	%l3,	%i6
	movleu	%icc,	%o0,	%g2
	ldsh	[%l7 + 0x60],	%i1
	movn	%icc,	%g7,	%o1
	fmovsg	%xcc,	%f19,	%f1
	ldx	[%l7 + 0x78],	%g4
	srax	%g6,	0x12,	%i2
	fmovdgu	%icc,	%f23,	%f10
	subc	%i7,	%o4,	%i5
	subcc	%o7,	0x0D2D,	%o2
	fzero	%f26
	sra	%l4,	0x12,	%i4
	movvc	%xcc,	%g5,	%o6
	edge32	%l2,	%g3,	%o5
	movpos	%icc,	%l5,	%l6
	srax	%i3,	0x0E,	%o3
	or	%l0,	0x0E84,	%i0
	movgu	%icc,	%g1,	%l3
	fmovrslez	%i6,	%f3,	%f8
	edge32ln	%o0,	%g2,	%l1
	array32	%i1,	%o1,	%g4
	fcmpne16	%f14,	%f2,	%g7
	fmovrslz	%g6,	%f19,	%f29
	restore %i7, 0x0CBD, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f14,	%f24,	%f26
	lduh	[%l7 + 0x3C],	%o4
	sethi	0x0C06,	%o7
	ldsh	[%l7 + 0x6A],	%o2
	sll	%l4,	0x18,	%i4
	sth	%i5,	[%l7 + 0x2E]
	for	%f12,	%f20,	%f8
	nop
	set	0x60, %g6
	std	%f24,	[%l7 + %g6]
	sir	0x07A2
	movn	%xcc,	%g5,	%l2
	ldx	[%l7 + 0x70],	%o6
	edge8n	%g3,	%l5,	%l6
	movpos	%xcc,	%o5,	%o3
	edge32l	%i3,	%l0,	%i0
	fmovrslez	%g1,	%f28,	%f8
	sdiv	%i6,	0x10BA,	%l3
	addc	%o0,	0x02A2,	%g2
	fnot2	%f6,	%f30
	sdivx	%l1,	0x1048,	%o1
	sth	%i1,	[%l7 + 0x2A]
	edge8	%g4,	%g7,	%g6
	ldx	[%l7 + 0x60],	%i2
	sdivx	%i7,	0x0048,	%o4
	fcmple32	%f24,	%f4,	%o2
	std	%f14,	[%l7 + 0x68]
	ldd	[%l7 + 0x10],	%l4
	fmovrslz	%i4,	%f21,	%f24
	subccc	%o7,	%g5,	%l2
	save %o6, 0x090E, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%g3,	%l6
	fpadd16	%f6,	%f4,	%f14
	movn	%icc,	%o5,	%o3
	sth	%l5,	[%l7 + 0x1C]
	orncc	%i3,	0x05B0,	%i0
	movrgz	%g1,	%i6,	%l0
	movcc	%icc,	%l3,	%g2
	movgu	%icc,	%l1,	%o1
	movgu	%xcc,	%i1,	%o0
	edge32	%g7,	%g6,	%i2
	fmuld8ulx16	%f8,	%f3,	%f16
	ldsb	[%l7 + 0x38],	%g4
	sllx	%o4,	%i7,	%o2
	movvs	%xcc,	%i4,	%o7
	fpack32	%f4,	%f8,	%f8
	subccc	%g5,	0x1198,	%l4
	smulcc	%l2,	%o6,	%i5
	sllx	%l6,	0x0E,	%o5
	sdiv	%g3,	0x0605,	%o3
	srax	%l5,	0x1E,	%i3
	movge	%xcc,	%i0,	%i6
	edge32	%g1,	%l0,	%g2
	movvc	%xcc,	%l1,	%l3
	add	%i1,	%o0,	%o1
	ldub	[%l7 + 0x0A],	%g6
	sdiv	%i2,	0x1B8B,	%g7
	ldd	[%l7 + 0x10],	%f20
	popc	%o4,	%i7
	fmovdvs	%xcc,	%f14,	%f30
	edge8	%o2,	%g4,	%o7
	ldub	[%l7 + 0x64],	%i4
	mulx	%g5,	%l2,	%o6
	movrlz	%i5,	0x089,	%l4
	fcmple16	%f26,	%f24,	%o5
	sethi	0x0B33,	%l6
	movrlz	%g3,	0x2CC,	%o3
	ldsh	[%l7 + 0x50],	%l5
	edge32l	%i0,	%i3,	%g1
	umulcc	%l0,	%i6,	%l1
	fornot2	%f24,	%f30,	%f8
	std	%f16,	[%l7 + 0x68]
	xor	%g2,	0x1058,	%l3
	umulcc	%o0,	0x1AC3,	%i1
	movneg	%icc,	%o1,	%g6
	movle	%icc,	%i2,	%g7
	edge32n	%o4,	%o2,	%i7
	fsrc2	%f20,	%f18
	orcc	%o7,	0x08BC,	%i4
	movcc	%xcc,	%g4,	%g5
	edge8ln	%o6,	%i5,	%l4
	movcc	%xcc,	%l2,	%o5
	edge32n	%g3,	%o3,	%l5
	for	%f10,	%f26,	%f18
	umul	%i0,	%i3,	%g1
	and	%l6,	%l0,	%i6
	udivcc	%g2,	0x1C52,	%l3
	ldd	[%l7 + 0x50],	%f30
	fandnot1	%f26,	%f6,	%f16
	fnot2s	%f29,	%f4
	subccc	%l1,	%i1,	%o1
	lduh	[%l7 + 0x0A],	%g6
	edge8	%i2,	%o0,	%o4
	movrgez	%g7,	0x399,	%o2
	addccc	%o7,	0x0928,	%i4
	mulx	%g4,	%i7,	%g5
	movrlz	%o6,	%i5,	%l4
	movne	%xcc,	%l2,	%g3
	ldd	[%l7 + 0x48],	%o2
	edge32n	%l5,	%o5,	%i3
	stb	%i0,	[%l7 + 0x7A]
	ldd	[%l7 + 0x20],	%i6
	fandnot1	%f0,	%f2,	%f18
	orn	%l0,	0x194A,	%g1
	save %g2, 0x1DEA, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i6,	0x1FF9,	%i1
	movpos	%icc,	%o1,	%g6
	sir	0x0D08
	st	%f27,	[%l7 + 0x20]
	mulx	%i2,	%o0,	%o4
	movn	%icc,	%l1,	%o2
	srax	%o7,	0x09,	%i4
	orncc	%g4,	0x12DB,	%g7
	xnor	%g5,	%o6,	%i5
	movl	%xcc,	%l4,	%i7
	umul	%g3,	%l2,	%l5
	edge8	%o5,	%o3,	%i3
	subcc	%i0,	%l6,	%g1
	or	%g2,	0x06CB,	%l3
	sllx	%l0,	0x09,	%i6
	movl	%xcc,	%i1,	%o1
	movgu	%icc,	%i2,	%g6
	movrgz	%o0,	%l1,	%o2
	andcc	%o4,	0x03BB,	%i4
	fmovdn	%xcc,	%f28,	%f29
	ldd	[%l7 + 0x10],	%f26
	sllx	%g4,	%g7,	%o7
	udivx	%o6,	0x009C,	%g5
	edge8n	%i5,	%l4,	%i7
	sethi	0x11DC,	%g3
	fnors	%f10,	%f10,	%f5
	movg	%xcc,	%l5,	%l2
	edge16n	%o3,	%o5,	%i3
	std	%f8,	[%l7 + 0x68]
	edge32l	%l6,	%i0,	%g2
	edge8l	%l3,	%g1,	%i6
	fmovrdgez	%l0,	%f0,	%f22
	fmovsa	%icc,	%f5,	%f14
	movl	%icc,	%o1,	%i1
	fsrc2	%f4,	%f12
	umul	%g6,	%i2,	%o0
	umul	%o2,	0x18A0,	%l1
	add	%o4,	%i4,	%g7
	edge16l	%g4,	%o7,	%o6
	movleu	%xcc,	%g5,	%i5
	ld	[%l7 + 0x50],	%f21
	alignaddr	%l4,	%i7,	%g3
	smul	%l5,	%l2,	%o5
	fexpand	%f5,	%f26
	movgu	%icc,	%i3,	%o3
	andcc	%l6,	0x1F1D,	%g2
	orncc	%l3,	%i0,	%i6
	fmovrsgez	%l0,	%f14,	%f11
	smulcc	%o1,	%g1,	%g6
	andcc	%i1,	%i2,	%o2
	sub	%o0,	%o4,	%i4
	fmovrdlez	%g7,	%f14,	%f10
	umul	%g4,	%o7,	%l1
	movrne	%g5,	%o6,	%l4
	edge32n	%i7,	%i5,	%g3
	ldsw	[%l7 + 0x70],	%l2
	udivx	%l5,	0x074A,	%o5
	fmovsleu	%xcc,	%f3,	%f28
	nop
	set	0x62, %o2
	ldsh	[%l7 + %o2],	%i3
	fmovrdlez	%o3,	%f30,	%f8
	movrne	%g2,	0x088,	%l6
	edge16ln	%i0,	%i6,	%l3
	andncc	%l0,	%o1,	%g6
	alignaddrl	%g1,	%i1,	%i2
	edge32l	%o2,	%o4,	%i4
	fmovdvs	%xcc,	%f20,	%f24
	edge8	%o0,	%g7,	%o7
	fmovde	%xcc,	%f17,	%f24
	movgu	%xcc,	%l1,	%g4
	edge16n	%o6,	%g5,	%l4
	sllx	%i5,	0x01,	%i7
	fcmpne32	%f0,	%f20,	%g3
	xnor	%l2,	%o5,	%l5
	stx	%i3,	[%l7 + 0x38]
	fnot2s	%f19,	%f12
	fmovdl	%xcc,	%f2,	%f4
	fmuld8ulx16	%f17,	%f0,	%f18
	mulx	%o3,	0x0E8C,	%l6
	for	%f6,	%f30,	%f10
	udivx	%g2,	0x1085,	%i6
	movrgz	%i0,	0x312,	%l0
	edge32ln	%o1,	%g6,	%l3
	movcc	%xcc,	%i1,	%i2
	movcs	%icc,	%g1,	%o2
	subc	%o4,	%i4,	%g7
	and	%o7,	0x1844,	%o0
	fandnot1	%f2,	%f24,	%f26
	popc	0x0427,	%g4
	fmovsgu	%xcc,	%f31,	%f29
	move	%icc,	%o6,	%g5
	addccc	%l4,	0x1B65,	%l1
	stw	%i7,	[%l7 + 0x78]
	ldd	[%l7 + 0x28],	%i4
	movleu	%icc,	%g3,	%l2
	sll	%o5,	%i3,	%l5
	edge8	%o3,	%l6,	%g2
	edge16l	%i6,	%i0,	%l0
	ldd	[%l7 + 0x50],	%f22
	movrlz	%o1,	0x029,	%l3
	sdivcc	%g6,	0x1F12,	%i1
	movle	%xcc,	%g1,	%i2
	fcmpeq16	%f0,	%f4,	%o4
	sllx	%o2,	0x10,	%g7
	sll	%o7,	0x0D,	%i4
	ld	[%l7 + 0x4C],	%f6
	lduh	[%l7 + 0x2C],	%o0
	edge32	%o6,	%g4,	%l4
	ldx	[%l7 + 0x78],	%g5
	edge16n	%l1,	%i5,	%g3
	fmovdgu	%icc,	%f26,	%f10
	fabss	%f12,	%f23
	umulcc	%l2,	%o5,	%i3
	movrlz	%l5,	0x1E2,	%o3
	fxors	%f2,	%f14,	%f12
	movg	%xcc,	%i7,	%l6
	movrlz	%i6,	0x328,	%i0
	and	%g2,	0x0E82,	%o1
	movrgez	%l0,	0x14A,	%g6
	edge16l	%i1,	%l3,	%g1
	movrne	%o4,	%i2,	%o2
	edge8	%o7,	%i4,	%o0
	movn	%icc,	%g7,	%g4
	fpadd32	%f8,	%f28,	%f14
	fxnor	%f20,	%f24,	%f6
	fmovrsgez	%o6,	%f10,	%f3
	edge32ln	%l4,	%l1,	%i5
	movleu	%icc,	%g5,	%l2
	movle	%icc,	%o5,	%i3
	addc	%g3,	%l5,	%o3
	fmovdcc	%icc,	%f16,	%f15
	edge8	%i7,	%l6,	%i0
	movg	%xcc,	%g2,	%o1
	nop
	set	0x4C, %l5
	ldub	[%l7 + %l5],	%l0
	sth	%g6,	[%l7 + 0x1E]
	smul	%i1,	%i6,	%g1
	fmovse	%xcc,	%f9,	%f3
	sllx	%o4,	0x1A,	%i2
	addccc	%l3,	0x1FC3,	%o7
	umul	%i4,	0x16F2,	%o0
	ldsh	[%l7 + 0x0A],	%o2
	fxors	%f6,	%f9,	%f18
	or	%g4,	0x0825,	%g7
	srl	%o6,	0x1C,	%l4
	array16	%l1,	%g5,	%l2
	st	%f1,	[%l7 + 0x08]
	smulcc	%i5,	0x0A31,	%i3
	ld	[%l7 + 0x74],	%f9
	subc	%o5,	%l5,	%g3
	movcs	%icc,	%o3,	%l6
	fcmpeq32	%f22,	%f2,	%i7
	sll	%i0,	0x0B,	%o1
	edge16ln	%l0,	%g2,	%i1
	umul	%i6,	%g1,	%g6
	for	%f22,	%f22,	%f8
	move	%xcc,	%i2,	%l3
	fmovdn	%icc,	%f12,	%f28
	ld	[%l7 + 0x4C],	%f8
	fmovrslz	%o7,	%f4,	%f28
	stb	%o4,	[%l7 + 0x56]
	movge	%icc,	%i4,	%o2
	edge8ln	%g4,	%o0,	%o6
	edge32l	%g7,	%l1,	%g5
	sll	%l4,	0x18,	%l2
	umulcc	%i3,	0x163E,	%i5
	edge32ln	%o5,	%l5,	%g3
	xnor	%o3,	%i7,	%l6
	lduw	[%l7 + 0x70],	%i0
	sth	%o1,	[%l7 + 0x0C]
	umul	%g2,	%l0,	%i6
	fmovrdne	%i1,	%f16,	%f4
	edge8ln	%g6,	%i2,	%l3
	movgu	%icc,	%o7,	%g1
	edge16l	%i4,	%o4,	%o2
	andn	%o0,	0x0E73,	%o6
	fmovrdne	%g7,	%f14,	%f18
	movpos	%xcc,	%l1,	%g5
	addc	%l4,	0x01E6,	%g4
	edge16l	%l2,	%i5,	%o5
	ld	[%l7 + 0x28],	%f10
	ldsw	[%l7 + 0x68],	%i3
	fmovsg	%xcc,	%f20,	%f27
	movcc	%xcc,	%g3,	%o3
	smul	%l5,	0x0616,	%i7
	subcc	%i0,	0x042F,	%o1
	movge	%xcc,	%l6,	%l0
	ldsb	[%l7 + 0x08],	%g2
	srlx	%i6,	0x0C,	%i1
	array32	%i2,	%g6,	%l3
	ldd	[%l7 + 0x48],	%g0
	edge16l	%o7,	%i4,	%o2
	fmul8sux16	%f0,	%f14,	%f4
	array16	%o4,	%o6,	%g7
	udiv	%l1,	0x0404,	%g5
	ldd	[%l7 + 0x28],	%f16
	ldsb	[%l7 + 0x41],	%o0
	fmovdvs	%icc,	%f8,	%f31
	srl	%l4,	0x0D,	%l2
	edge16	%g4,	%i5,	%i3
	st	%f17,	[%l7 + 0x20]
	fmovdvc	%xcc,	%f7,	%f19
	udivx	%g3,	0x014B,	%o3
	movrne	%o5,	%i7,	%i0
	movne	%icc,	%o1,	%l6
	ldsb	[%l7 + 0x27],	%l5
	fcmps	%fcc3,	%f15,	%f24
	fmovsneg	%xcc,	%f25,	%f12
	alignaddrl	%g2,	%i6,	%l0
	fmul8ulx16	%f0,	%f20,	%f0
	ldub	[%l7 + 0x10],	%i2
	movle	%icc,	%i1,	%l3
	ldsw	[%l7 + 0x38],	%g6
	alignaddrl	%o7,	%i4,	%o2
	umulcc	%o4,	0x083F,	%g1
	fnand	%f24,	%f4,	%f18
	alignaddr	%o6,	%g7,	%l1
	orncc	%o0,	%g5,	%l2
	nop
	set	0x54, %i5
	ldsw	[%l7 + %i5],	%l4
	popc	%g4,	%i5
	stb	%i3,	[%l7 + 0x74]
	movre	%g3,	0x0DD,	%o3
	umul	%i7,	0x0984,	%o5
	ldub	[%l7 + 0x4B],	%i0
	movrgz	%o1,	%l6,	%l5
	movrgz	%g2,	0x2CD,	%i6
	fnot2s	%f27,	%f24
	srax	%l0,	0x18,	%i2
	movrne	%i1,	0x19D,	%l3
	fsrc2	%f14,	%f24
	srax	%g6,	%o7,	%o2
	movre	%i4,	%o4,	%g1
	sllx	%g7,	%o6,	%o0
	fmovrsgz	%l1,	%f21,	%f26
	xnor	%g5,	0x1DFF,	%l4
	udiv	%g4,	0x1BC4,	%l2
	edge16	%i5,	%g3,	%o3
	smul	%i7,	%o5,	%i0
	lduh	[%l7 + 0x52],	%o1
	fors	%f22,	%f2,	%f5
	umulcc	%i3,	%l5,	%l6
	orncc	%g2,	0x0B5A,	%l0
	movrgez	%i6,	%i2,	%l3
	stb	%i1,	[%l7 + 0x3F]
	xnorcc	%o7,	0x070D,	%o2
	edge8n	%g6,	%i4,	%g1
	movre	%o4,	0x3C5,	%o6
	array8	%o0,	%g7,	%l1
	ldsh	[%l7 + 0x16],	%l4
	popc	%g4,	%g5
	ldd	[%l7 + 0x18],	%f26
	or	%i5,	0x1EDD,	%l2
	and	%g3,	0x0790,	%o3
	array8	%i7,	%o5,	%i0
	edge32	%o1,	%i3,	%l6
	sll	%l5,	0x17,	%l0
	movvc	%xcc,	%i6,	%i2
	sll	%l3,	0x06,	%g2
	stb	%o7,	[%l7 + 0x32]
	fnot1s	%f26,	%f27
	fpack16	%f24,	%f23
	ldsw	[%l7 + 0x18],	%i1
	ld	[%l7 + 0x48],	%f25
	std	%f20,	[%l7 + 0x78]
	udivx	%o2,	0x0A4D,	%i4
	edge32ln	%g1,	%o4,	%g6
	orncc	%o6,	%o0,	%g7
	sth	%l1,	[%l7 + 0x08]
	stb	%g4,	[%l7 + 0x5B]
	save %g5, 0x0087, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f15,	%f28,	%f27
	edge8	%i5,	%g3,	%o3
	umul	%l2,	0x0410,	%i7
	xor	%i0,	0x16D5,	%o1
	umulcc	%o5,	%l6,	%i3
	fnands	%f9,	%f23,	%f13
	movpos	%xcc,	%l5,	%i6
	movre	%l0,	0x14C,	%l3
	fmovsn	%xcc,	%f12,	%f28
	alignaddr	%i2,	%o7,	%g2
	fsrc2	%f12,	%f24
	ldsh	[%l7 + 0x4E],	%o2
	movneg	%icc,	%i1,	%i4
	movrlez	%o4,	%g1,	%o6
	stb	%o0,	[%l7 + 0x42]
	edge32n	%g6,	%l1,	%g7
	udivx	%g4,	0x09A3,	%g5
	fxors	%f0,	%f11,	%f16
	array8	%l4,	%g3,	%i5
	array32	%o3,	%i7,	%i0
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	move	%icc,	%l6,	%o5
	movl	%icc,	%l5,	%i6
	fmovsvc	%icc,	%f5,	%f17
	edge8l	%l0,	%i3,	%l3
	movl	%xcc,	%o7,	%g2
	umulcc	%i2,	0x0886,	%o2
	fandnot1	%f22,	%f0,	%f30
	fmovdg	%xcc,	%f15,	%f11
	movg	%icc,	%i4,	%i1
	array8	%g1,	%o4,	%o0
	fnegs	%f26,	%f16
	add	%g6,	%l1,	%o6
	ldsb	[%l7 + 0x61],	%g4
	sllx	%g5,	%l4,	%g7
	ldd	[%l7 + 0x50],	%g2
	srl	%o3,	0x0E,	%i5
	movg	%xcc,	%i7,	%i0
	ldsh	[%l7 + 0x30],	%l2
	movrgez	%o1,	0x231,	%l6
	fabss	%f29,	%f14
	nop
	set	0x70, %g5
	ldsw	[%l7 + %g5],	%l5
	save %o5, 0x0B75, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f22,	%f24,	%f28
	fmovrdgez	%i3,	%f26,	%f16
	movge	%icc,	%l0,	%l3
	std	%f2,	[%l7 + 0x78]
	orncc	%g2,	0x0743,	%i2
	andcc	%o7,	0x0FD7,	%i4
	fpsub32s	%f4,	%f7,	%f25
	addc	%o2,	%i1,	%o4
	srl	%o0,	%g1,	%g6
	andn	%l1,	%o6,	%g5
	edge32ln	%g4,	%g7,	%l4
	fmovdvc	%icc,	%f24,	%f18
	edge16ln	%g3,	%o3,	%i7
	movvs	%xcc,	%i0,	%l2
	edge32	%o1,	%l6,	%l5
	fcmpeq16	%f0,	%f10,	%i5
	movg	%xcc,	%o5,	%i3
	orn	%l0,	0x1282,	%l3
	edge16n	%g2,	%i6,	%i2
	addc	%o7,	%i4,	%i1
	array16	%o2,	%o4,	%g1
	and	%o0,	0x1AAB,	%g6
	mulscc	%l1,	0x0711,	%g5
	and	%o6,	%g7,	%g4
	sll	%g3,	0x1A,	%l4
	movrlez	%o3,	0x100,	%i7
	fcmpne16	%f6,	%f22,	%l2
	xorcc	%o1,	%l6,	%i0
	xnor	%i5,	0x021A,	%l5
	sdiv	%i3,	0x1850,	%l0
	movrlez	%l3,	0x337,	%o5
	orncc	%i6,	%i2,	%g2
	fmovrsgz	%i4,	%f0,	%f5
	fandnot2s	%f19,	%f19,	%f2
	mova	%icc,	%o7,	%i1
	fpsub32	%f12,	%f16,	%f16
	fcmple32	%f0,	%f4,	%o4
	fmovsne	%xcc,	%f7,	%f13
	fmovda	%xcc,	%f2,	%f25
	move	%xcc,	%g1,	%o0
	edge8n	%o2,	%l1,	%g6
	xor	%g5,	0x1E7D,	%g7
	umulcc	%o6,	%g3,	%g4
	addc	%l4,	%i7,	%o3
	orn	%o1,	%l2,	%l6
	mova	%xcc,	%i0,	%l5
	movrne	%i5,	%l0,	%l3
	alignaddrl	%i3,	%o5,	%i6
	srl	%i2,	0x0B,	%i4
	subcc	%g2,	%i1,	%o4
	ld	[%l7 + 0x6C],	%f9
	sdivcc	%g1,	0x1433,	%o7
	ldsb	[%l7 + 0x3E],	%o0
	sethi	0x0172,	%o2
	subccc	%l1,	0x0D56,	%g6
	udivx	%g7,	0x019C,	%o6
	edge8ln	%g3,	%g4,	%g5
	std	%f10,	[%l7 + 0x50]
	movg	%xcc,	%l4,	%i7
	sra	%o3,	%l2,	%o1
	move	%icc,	%l6,	%i0
	fmovdleu	%xcc,	%f31,	%f1
	edge16	%i5,	%l0,	%l3
	mulscc	%i3,	%o5,	%i6
	fmovdvs	%icc,	%f3,	%f27
	subc	%l5,	%i4,	%i2
	movrgez	%i1,	0x3A7,	%o4
	movrgz	%g2,	%g1,	%o0
	fnot1	%f24,	%f14
	fandnot1	%f22,	%f18,	%f16
	sra	%o7,	%l1,	%g6
	lduw	[%l7 + 0x68],	%g7
	movvc	%icc,	%o2,	%o6
	fmovdne	%xcc,	%f3,	%f10
	fpadd16	%f14,	%f14,	%f18
	subcc	%g4,	0x0FAA,	%g3
	movne	%xcc,	%g5,	%i7
	xnorcc	%l4,	%l2,	%o3
	st	%f3,	[%l7 + 0x10]
	fandnot2s	%f6,	%f31,	%f12
	orn	%o1,	%l6,	%i5
	fcmpd	%fcc1,	%f12,	%f4
	array16	%l0,	%i0,	%i3
	fmovsvs	%xcc,	%f3,	%f31
	edge32ln	%l3,	%i6,	%o5
	ldub	[%l7 + 0x32],	%l5
	movre	%i4,	%i1,	%o4
	nop
	set	0x24, %i4
	stb	%g2,	[%l7 + %i4]
	lduh	[%l7 + 0x50],	%i2
	array32	%g1,	%o0,	%o7
	sllx	%l1,	0x1C,	%g7
	movrne	%o2,	0x18E,	%g6
	fnands	%f22,	%f13,	%f20
	movcc	%xcc,	%g4,	%o6
	fcmpne16	%f28,	%f20,	%g3
	fmovsge	%icc,	%f16,	%f9
	or	%g5,	0x1B2D,	%i7
	fmovdvc	%icc,	%f12,	%f13
	fandnot1	%f20,	%f14,	%f14
	fmovrdne	%l4,	%f0,	%f10
	sll	%o3,	%l2,	%l6
	stb	%i5,	[%l7 + 0x17]
	fmovdleu	%icc,	%f1,	%f29
	alignaddr	%l0,	%i0,	%o1
	edge32	%i3,	%i6,	%o5
	fmovscs	%icc,	%f8,	%f31
	srl	%l5,	%i4,	%i1
	alignaddr	%o4,	%g2,	%l3
	udiv	%g1,	0x1DEE,	%i2
	fnegd	%f24,	%f18
	fsrc2	%f8,	%f24
	fmovspos	%xcc,	%f20,	%f25
	xorcc	%o0,	0x0DFB,	%l1
	ld	[%l7 + 0x14],	%f1
	ldsh	[%l7 + 0x3E],	%o7
	movleu	%icc,	%g7,	%o2
	lduw	[%l7 + 0x38],	%g6
	fmovrdne	%g4,	%f2,	%f12
	restore %o6, %g3, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpd	%fcc0,	%f10,	%f20
	edge32n	%l4,	%o3,	%i7
	fornot2s	%f16,	%f13,	%f28
	fmovsg	%icc,	%f13,	%f6
	stx	%l6,	[%l7 + 0x50]
	fnand	%f28,	%f6,	%f10
	fpack32	%f20,	%f8,	%f10
	bshuffle	%f2,	%f16,	%f30
	popc	0x1C5F,	%i5
	edge8n	%l2,	%i0,	%l0
	udiv	%o1,	0x1D48,	%i6
	sra	%o5,	%i3,	%i4
	fexpand	%f23,	%f30
	movrlez	%i1,	%o4,	%l5
	andn	%g2,	%l3,	%i2
	xnorcc	%o0,	%g1,	%l1
	mova	%icc,	%o7,	%g7
	srl	%g6,	0x1E,	%o2
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%g4
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	subc	%g3,	%l4,	%o3
	addc	%l6,	%i7,	%l2
	fmovdpos	%icc,	%f27,	%f23
	edge16ln	%i5,	%i0,	%o1
	movge	%xcc,	%i6,	%o5
	andcc	%l0,	%i3,	%i1
	fmovrdlz	%i4,	%f14,	%f10
	movrgez	%o4,	0x043,	%g2
	sllx	%l5,	0x1A,	%l3
	stw	%o0,	[%l7 + 0x74]
	sll	%g1,	%l1,	%o7
	movn	%icc,	%g7,	%i2
	sethi	0x185D,	%g6
	addccc	%o2,	0x12B3,	%o6
	ldx	[%l7 + 0x48],	%g4
	movrgez	%g5,	0x0F9,	%l4
	movcs	%xcc,	%o3,	%g3
	edge16l	%i7,	%l6,	%l2
	or	%i0,	0x01DD,	%i5
	move	%xcc,	%o1,	%i6
	subc	%o5,	0x11C2,	%l0
	udivx	%i3,	0x1285,	%i1
	fmovdle	%icc,	%f16,	%f10
	movcc	%icc,	%o4,	%i4
	sdivcc	%g2,	0x0021,	%l5
	st	%f27,	[%l7 + 0x4C]
	udivx	%o0,	0x01F5,	%g1
	movcs	%xcc,	%l1,	%o7
	edge8ln	%g7,	%i2,	%g6
	alignaddr	%l3,	%o6,	%g4
	edge32ln	%o2,	%g5,	%l4
	sub	%g3,	%o3,	%l6
	save %i7, %l2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f12,	%f2
	xnor	%o1,	%i6,	%o5
	movcc	%icc,	%l0,	%i3
	faligndata	%f22,	%f10,	%f22
	movcc	%icc,	%i1,	%i0
	fsrc1	%f0,	%f16
	movgu	%icc,	%o4,	%g2
	orn	%l5,	0x07F3,	%i4
	fandnot2	%f10,	%f6,	%f2
	alignaddr	%o0,	%l1,	%g1
	add	%o7,	0x1001,	%i2
	edge8n	%g7,	%g6,	%o6
	movgu	%xcc,	%l3,	%o2
	movleu	%icc,	%g4,	%l4
	movl	%xcc,	%g5,	%o3
	fnegs	%f16,	%f7
	smulcc	%g3,	0x1F7F,	%i7
	sub	%l6,	%l2,	%i5
	fmovrdgz	%i6,	%f30,	%f22
	fmovdpos	%icc,	%f10,	%f5
	srl	%o1,	%o5,	%l0
	edge16ln	%i1,	%i0,	%o4
	st	%f1,	[%l7 + 0x44]
	movcs	%icc,	%i3,	%l5
	fcmpgt16	%f2,	%f20,	%g2
	andn	%i4,	%l1,	%o0
	movre	%g1,	%o7,	%g7
	mulx	%g6,	%o6,	%l3
	andcc	%o2,	%i2,	%g4
	save %g5, 0x04AA, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x7D],	%g3
	sllx	%o3,	%l6,	%l2
	st	%f21,	[%l7 + 0x54]
	fmovrsgez	%i7,	%f5,	%f16
	edge8	%i6,	%i5,	%o1
	orncc	%l0,	0x0EB9,	%o5
	ldsb	[%l7 + 0x5B],	%i1
	srl	%i0,	%o4,	%i3
	ldd	[%l7 + 0x70],	%f16
	fcmpes	%fcc1,	%f6,	%f16
	fmovde	%xcc,	%f22,	%f23
	xor	%l5,	%i4,	%g2
	edge8l	%o0,	%l1,	%o7
	fpack16	%f6,	%f11
	srlx	%g7,	0x08,	%g1
	movre	%o6,	0x120,	%g6
	fornot2	%f16,	%f10,	%f24
	movcc	%icc,	%o2,	%i2
	movvc	%icc,	%g4,	%l3
	fmovdle	%icc,	%f12,	%f11
	addccc	%l4,	%g3,	%o3
	orn	%g5,	0x1877,	%l6
	movl	%icc,	%l2,	%i6
	movge	%icc,	%i7,	%o1
	pdist	%f2,	%f20,	%f30
	smulcc	%l0,	0x01E1,	%o5
	sllx	%i1,	0x06,	%i0
	movcs	%icc,	%o4,	%i5
	edge32	%i3,	%l5,	%i4
	smul	%o0,	%g2,	%l1
	ldub	[%l7 + 0x44],	%o7
	movre	%g1,	0x24A,	%g7
	move	%icc,	%g6,	%o6
	mulscc	%o2,	%i2,	%l3
	edge16n	%l4,	%g3,	%g4
	and	%g5,	0x0106,	%o3
	srax	%l6,	%l2,	%i7
	movgu	%xcc,	%o1,	%i6
	movne	%xcc,	%o5,	%i1
	edge32ln	%l0,	%o4,	%i5
	srax	%i3,	%l5,	%i0
	subc	%o0,	0x15EB,	%i4
	fxors	%f7,	%f6,	%f21
	sethi	0x1035,	%l1
	udivcc	%g2,	0x0686,	%o7
	fpmerge	%f30,	%f28,	%f28
	movneg	%xcc,	%g7,	%g1
	lduw	[%l7 + 0x6C],	%g6
	movne	%icc,	%o6,	%o2
	addcc	%l3,	%i2,	%g3
	edge32ln	%g4,	%g5,	%o3
	movcc	%xcc,	%l4,	%l2
	udiv	%i7,	0x0DFC,	%l6
	sth	%i6,	[%l7 + 0x0C]
	edge32ln	%o1,	%i1,	%o5
	fmovsleu	%icc,	%f2,	%f13
	fzeros	%f15
	fcmpne32	%f2,	%f24,	%o4
	alignaddr	%l0,	%i3,	%l5
	fpadd16s	%f31,	%f29,	%f1
	lduh	[%l7 + 0x4E],	%i0
	sll	%o0,	0x06,	%i4
	lduh	[%l7 + 0x68],	%i5
	sth	%l1,	[%l7 + 0x7A]
	edge32l	%o7,	%g7,	%g1
	movcc	%xcc,	%g2,	%o6
	orncc	%g6,	0x0098,	%o2
	fabsd	%f18,	%f22
	edge16	%i2,	%g3,	%g4
	edge32l	%l3,	%g5,	%o3
	fpsub16	%f24,	%f24,	%f22
	xnor	%l2,	0x1EF1,	%i7
	sub	%l4,	%i6,	%l6
	movgu	%xcc,	%o1,	%i1
	save %o5, 0x02F8, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x74],	%o4
	stw	%l5,	[%l7 + 0x2C]
	movne	%icc,	%i3,	%i0
	movneg	%xcc,	%i4,	%o0
	xnorcc	%i5,	%o7,	%g7
	srl	%l1,	%g1,	%o6
	movrgz	%g6,	0x262,	%g2
	orcc	%o2,	0x1289,	%i2
	sdiv	%g4,	0x1E0A,	%l3
	fmovrde	%g3,	%f30,	%f0
	stx	%g5,	[%l7 + 0x50]
	orncc	%l2,	0x1C76,	%i7
	fnot2s	%f19,	%f15
	fmovrdlez	%o3,	%f20,	%f22
	fmovsne	%xcc,	%f7,	%f12
	st	%f1,	[%l7 + 0x34]
	fand	%f8,	%f18,	%f22
	udivx	%i6,	0x04C0,	%l6
	srax	%o1,	0x12,	%i1
	sdivx	%o5,	0x1975,	%l4
	array32	%l0,	%l5,	%o4
	restore %i3, 0x173C, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%i4,	%o0
	fmovrdne	%o7,	%f14,	%f12
	ldd	[%l7 + 0x40],	%f2
	smulcc	%i5,	0x129C,	%l1
	sdivx	%g7,	0x0946,	%g1
	add	%g6,	0x1179,	%g2
	nop
	set	0x28, %i7
	std	%f6,	[%l7 + %i7]
	fmovdvc	%xcc,	%f22,	%f23
	edge32	%o6,	%i2,	%o2
	lduw	[%l7 + 0x38],	%l3
	movrgz	%g4,	0x0A8,	%g5
	fmovsle	%icc,	%f21,	%f22
	popc	0x0212,	%g3
	fcmpeq16	%f16,	%f2,	%l2
	movgu	%icc,	%o3,	%i6
	edge16l	%l6,	%i7,	%o1
	movneg	%icc,	%i1,	%l4
	fpsub32	%f24,	%f2,	%f24
	fmovse	%xcc,	%f9,	%f4
	xor	%o5,	%l5,	%l0
	movre	%i3,	0x14A,	%i0
	fmovdneg	%icc,	%f15,	%f18
	fnors	%f28,	%f4,	%f30
	edge32	%o4,	%i4,	%o7
	udiv	%i5,	0x0EB1,	%l1
	edge8ln	%o0,	%g7,	%g1
	movge	%icc,	%g6,	%o6
	movcs	%icc,	%g2,	%i2
	orcc	%l3,	0x02B1,	%o2
	movg	%icc,	%g5,	%g4
	andcc	%g3,	%o3,	%l2
	sra	%i6,	0x02,	%l6
	xnor	%i7,	0x0129,	%o1
	fxors	%f12,	%f5,	%f2
	fandnot2	%f0,	%f6,	%f12
	fmovdgu	%icc,	%f19,	%f3
	and	%i1,	%o5,	%l5
	movrgz	%l0,	%l4,	%i0
	edge32ln	%i3,	%o4,	%i4
	fmovse	%xcc,	%f2,	%f6
	fmovdne	%icc,	%f6,	%f29
	movneg	%icc,	%i5,	%l1
	movneg	%xcc,	%o0,	%g7
	edge32l	%o7,	%g1,	%g6
	sra	%o6,	%g2,	%l3
	xor	%i2,	%o2,	%g5
	edge32	%g4,	%g3,	%o3
	movne	%xcc,	%l2,	%l6
	edge8l	%i6,	%o1,	%i1
	movn	%xcc,	%i7,	%l5
	fcmpeq16	%f8,	%f22,	%o5
	fmovrdgz	%l0,	%f22,	%f12
	movrne	%l4,	%i3,	%o4
	mova	%icc,	%i0,	%i5
	movrgez	%i4,	%l1,	%g7
	movrgz	%o7,	0x1E8,	%g1
	ldx	[%l7 + 0x58],	%o0
	movrlez	%g6,	0x1FB,	%g2
	movpos	%icc,	%l3,	%o6
	movle	%icc,	%o2,	%g5
	edge8ln	%g4,	%g3,	%o3
	udivx	%i2,	0x1433,	%l6
	fabss	%f23,	%f3
	move	%icc,	%i6,	%o1
	ld	[%l7 + 0x60],	%f22
	fcmple16	%f18,	%f30,	%i1
	move	%xcc,	%l2,	%i7
	lduh	[%l7 + 0x10],	%l5
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	stb	%o4,	[%l7 + 0x79]
	addccc	%i0,	0x0782,	%i3
	addcc	%i5,	%i4,	%g7
	sdivcc	%o7,	0x1B7A,	%g1
	subccc	%o0,	0x1B87,	%l1
	fmovdvc	%xcc,	%f6,	%f0
	lduh	[%l7 + 0x58],	%g6
	fpmerge	%f14,	%f25,	%f4
	movpos	%xcc,	%l3,	%g2
	umulcc	%o6,	0x0775,	%o2
	srl	%g5,	%g4,	%o3
	fmovdleu	%xcc,	%f30,	%f26
	movl	%xcc,	%i2,	%l6
	movvc	%xcc,	%i6,	%g3
	stw	%i1,	[%l7 + 0x0C]
	fpsub32	%f28,	%f14,	%f22
	sth	%o1,	[%l7 + 0x14]
	edge16l	%l2,	%i7,	%l5
	sdivcc	%o5,	0x0980,	%l4
	edge16n	%l0,	%o4,	%i3
	fmovrdne	%i0,	%f30,	%f16
	movrne	%i4,	%i5,	%o7
	fcmple16	%f2,	%f18,	%g1
	srl	%o0,	0x1D,	%l1
	move	%xcc,	%g7,	%l3
	movrgez	%g2,	%o6,	%o2
	andncc	%g5,	%g6,	%g4
	fandnot1s	%f24,	%f2,	%f7
	movle	%xcc,	%o3,	%i2
	udivx	%i6,	0x05AC,	%g3
	sethi	0x0CF8,	%l6
	andn	%o1,	%l2,	%i1
	lduh	[%l7 + 0x16],	%i7
	fmovdn	%xcc,	%f2,	%f8
	fmovdle	%icc,	%f21,	%f7
	movre	%o5,	0x3DA,	%l5
	sdivcc	%l4,	0x0E1A,	%o4
	sth	%l0,	[%l7 + 0x76]
	and	%i3,	%i4,	%i0
	nop
	set	0x48, %l1
	std	%f22,	[%l7 + %l1]
	ldd	[%l7 + 0x60],	%i4
	stx	%g1,	[%l7 + 0x68]
	fmovrdgez	%o0,	%f22,	%f28
	srax	%o7,	%l1,	%l3
	fcmple32	%f18,	%f12,	%g2
	edge16	%g7,	%o2,	%g5
	sra	%o6,	0x0D,	%g4
	sra	%o3,	0x11,	%g6
	fmovde	%xcc,	%f1,	%f7
	edge8	%i2,	%i6,	%l6
	fmovsge	%xcc,	%f31,	%f20
	mulx	%g3,	0x113A,	%l2
	save %o1, %i7, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x38, %g7
	stw	%o5,	[%l7 + %g7]
	movge	%xcc,	%l5,	%l4
	movrlz	%l0,	0x342,	%i3
	fxnor	%f26,	%f2,	%f6
	fxnors	%f22,	%f23,	%f11
	sir	0x1E57
	lduh	[%l7 + 0x14],	%o4
	ldx	[%l7 + 0x70],	%i0
	mulscc	%i4,	0x170D,	%g1
	sir	0x1D93
	movrgez	%i5,	%o0,	%o7
	fnors	%f22,	%f8,	%f28
	movneg	%xcc,	%l3,	%l1
	fmovsvs	%icc,	%f27,	%f16
	fmovdn	%icc,	%f27,	%f30
	ldsh	[%l7 + 0x7C],	%g2
	edge32l	%o2,	%g5,	%g7
	movg	%xcc,	%o6,	%o3
	mova	%xcc,	%g4,	%g6
	srlx	%i2,	0x07,	%i6
	movvs	%icc,	%l6,	%l2
	xorcc	%g3,	0x1F13,	%i7
	save %i1, %o1, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l5,	0x1A7,	%l4
	movrgez	%l0,	0x234,	%o4
	andn	%i0,	%i4,	%i3
	edge16	%i5,	%g1,	%o7
	fmovrdgz	%o0,	%f18,	%f0
	xnorcc	%l3,	0x03B5,	%l1
	restore %o2, %g5, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g7,	0x050B,	%o3
	movle	%xcc,	%o6,	%g6
	xnorcc	%i2,	%i6,	%l6
	movge	%xcc,	%l2,	%g4
	fandnot2s	%f8,	%f25,	%f5
	fnand	%f28,	%f26,	%f22
	subccc	%g3,	%i7,	%o1
	sdivcc	%i1,	0x0F4E,	%o5
	save %l4, %l5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i0,	0x1227,	%l0
	movg	%xcc,	%i4,	%i3
	xor	%i5,	%g1,	%o0
	udivx	%l3,	0x00F9,	%o7
	fnors	%f1,	%f31,	%f9
	movrne	%l1,	0x2BD,	%g5
	orncc	%g2,	%g7,	%o2
	fpackfix	%f30,	%f31
	fmovdcc	%xcc,	%f24,	%f9
	sub	%o6,	0x1F40,	%g6
	nop
	set	0x24, %g4
	ldsw	[%l7 + %g4],	%o3
	sth	%i6,	[%l7 + 0x4E]
	sdiv	%i2,	0x1D84,	%l6
	andncc	%l2,	%g4,	%i7
	movg	%xcc,	%g3,	%o1
	fornot1	%f10,	%f8,	%f12
	fmovsl	%xcc,	%f18,	%f22
	movrne	%i1,	0x33E,	%o5
	fmul8x16	%f31,	%f0,	%f6
	movre	%l4,	0x2F2,	%o4
	orn	%i0,	0x11C9,	%l5
	array8	%i4,	%i3,	%l0
	movrlez	%g1,	0x006,	%i5
	umulcc	%o0,	%l3,	%l1
	fornot2s	%f3,	%f23,	%f31
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	sdivcc	%o2,	0x10A3,	%o6
	fexpand	%f5,	%f20
	stw	%g6,	[%l7 + 0x50]
	fxor	%f24,	%f4,	%f30
	smulcc	%o3,	0x1D0C,	%i6
	addc	%i2,	%g7,	%l6
	edge32	%g4,	%i7,	%g3
	nop
	set	0x32, %o7
	lduh	[%l7 + %o7],	%l2
	fmovrsne	%i1,	%f24,	%f14
	addcc	%o5,	0x0667,	%o1
	edge8	%o4,	%l4,	%l5
	std	%f28,	[%l7 + 0x78]
	fmovdleu	%icc,	%f10,	%f28
	movvc	%icc,	%i0,	%i3
	ldd	[%l7 + 0x38],	%i4
	save %g1, 0x10FA, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f4,	%f12,	%f4
	xorcc	%i5,	0x0293,	%o0
	sdiv	%l1,	0x0E4B,	%g5
	fzero	%f2
	alignaddr	%o7,	%g2,	%l3
	udiv	%o6,	0x108B,	%g6
	fmovrdlez	%o2,	%f20,	%f30
	sdivcc	%o3,	0x0BA2,	%i2
	std	%f26,	[%l7 + 0x70]
	fcmpd	%fcc3,	%f30,	%f12
	alignaddrl	%g7,	%i6,	%g4
	fmovdle	%icc,	%f6,	%f7
	mova	%xcc,	%i7,	%l6
	ldx	[%l7 + 0x20],	%l2
	mulscc	%i1,	0x07A7,	%o5
	fzero	%f6
	fmovrdlez	%o1,	%f14,	%f22
	stw	%g3,	[%l7 + 0x18]
	orn	%o4,	%l5,	%l4
	udivcc	%i3,	0x0CBC,	%i4
	fandnot2	%f30,	%f2,	%f22
	edge32	%g1,	%l0,	%i0
	xnor	%o0,	0x19CA,	%i5
	movleu	%xcc,	%g5,	%o7
	xnorcc	%g2,	%l3,	%l1
	fmovsg	%xcc,	%f29,	%f26
	udiv	%g6,	0x199C,	%o6
	ldub	[%l7 + 0x0E],	%o2
	array32	%o3,	%g7,	%i6
	move	%icc,	%i2,	%g4
	udivcc	%l6,	0x0D3A,	%i7
	movcs	%icc,	%i1,	%o5
	orn	%l2,	%o1,	%o4
	sth	%g3,	[%l7 + 0x32]
	edge16ln	%l4,	%l5,	%i4
	movge	%icc,	%g1,	%i3
	fmovrse	%l0,	%f29,	%f17
	fcmpgt16	%f26,	%f22,	%o0
	fmovse	%icc,	%f22,	%f15
	or	%i0,	0x11C3,	%i5
	mova	%icc,	%g5,	%g2
	movn	%xcc,	%l3,	%l1
	lduw	[%l7 + 0x4C],	%g6
	addc	%o7,	0x1608,	%o6
	srlx	%o3,	0x0E,	%o2
	srl	%g7,	0x12,	%i2
	ldsw	[%l7 + 0x60],	%g4
	mulx	%l6,	0x1709,	%i7
	xorcc	%i1,	%o5,	%i6
	addc	%l2,	%o4,	%g3
	popc	0x0EC0,	%o1
	udivx	%l5,	0x0B2E,	%l4
	add	%i4,	0x1FB1,	%g1
	udivx	%i3,	0x1586,	%o0
	fmovdvs	%icc,	%f21,	%f12
	edge8l	%i0,	%l0,	%g5
	smul	%g2,	0x1B6D,	%i5
	restore %l1, 0x1FAC, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%g6,	%o7
	lduh	[%l7 + 0x1C],	%o3
	fmovdgu	%xcc,	%f2,	%f3
	udiv	%o2,	0x1262,	%g7
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	fmuld8ulx16	%f18,	%f28,	%f4
	sethi	0x0779,	%g4
	subcc	%i7,	%i1,	%l6
	andn	%o5,	0x19A2,	%l2
	xnorcc	%i6,	%o4,	%g3
	srax	%o1,	0x0D,	%l4
	ldsb	[%l7 + 0x25],	%i4
	fabsd	%f30,	%f28
	movpos	%icc,	%l5,	%g1
	movne	%xcc,	%o0,	%i3
	save %i0, %g5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g2,	%l1,	%i5
	addccc	%g6,	0x0B58,	%l3
	restore %o3, %o7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0B75,	%o6
	movrlz	%i2,	0x392,	%g7
	popc	%g4,	%i1
	fcmps	%fcc1,	%f19,	%f20
	array32	%l6,	%i7,	%l2
	xorcc	%o5,	0x0283,	%i6
	sub	%g3,	%o1,	%l4
	ldd	[%l7 + 0x20],	%i4
	movge	%icc,	%l5,	%g1
	edge8ln	%o0,	%o4,	%i0
	movpos	%icc,	%i3,	%l0
	movneg	%xcc,	%g5,	%l1
	addcc	%i5,	%g2,	%g6
	fone	%f20
	fpadd32	%f2,	%f30,	%f18
	movrlz	%o3,	0x3DA,	%l3
	fmovdg	%xcc,	%f2,	%f11
	stx	%o2,	[%l7 + 0x10]
	addccc	%o7,	0x026A,	%o6
	movn	%icc,	%i2,	%g4
	fpadd16	%f22,	%f12,	%f24
	sdiv	%g7,	0x0E14,	%i1
	move	%icc,	%i7,	%l2
	fxnors	%f15,	%f19,	%f12
	umul	%l6,	%i6,	%g3
	sdiv	%o5,	0x16D6,	%l4
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	fmul8sux16	%f20,	%f14,	%f30
	alignaddr	%g1,	%o4,	%i0
	stb	%i3,	[%l7 + 0x41]
	movrgez	%o0,	0x37B,	%l0
	addcc	%g5,	0x134D,	%l1
	movg	%xcc,	%g2,	%g6
	nop
	set	0x48, %i6
	std	%f4,	[%l7 + %i6]
	andncc	%o3,	%l3,	%o2
	fmovd	%f6,	%f6
	faligndata	%f8,	%f6,	%f10
	fmovdpos	%icc,	%f14,	%f21
	std	%f6,	[%l7 + 0x48]
	popc	0x0896,	%o7
	fpadd16	%f12,	%f2,	%f16
	ldx	[%l7 + 0x50],	%i5
	xnor	%o6,	0x19C5,	%i2
	fornot2s	%f17,	%f16,	%f8
	movleu	%xcc,	%g4,	%i1
	edge8l	%g7,	%l2,	%l6
	srl	%i7,	%i6,	%g3
	mulscc	%l4,	%i4,	%o1
	fone	%f2
	smulcc	%l5,	%g1,	%o5
	ld	[%l7 + 0x54],	%f29
	mulx	%o4,	0x06DD,	%i0
	srax	%i3,	%l0,	%o0
	edge32ln	%g5,	%g2,	%l1
	smul	%o3,	%l3,	%g6
	fmul8x16al	%f25,	%f18,	%f2
	popc	%o7,	%i5
	movrlez	%o6,	0x27A,	%o2
	udivcc	%i2,	0x19C7,	%g4
	udivx	%g7,	0x07A4,	%i1
	lduw	[%l7 + 0x3C],	%l2
	sra	%i7,	%i6,	%g3
	fnegd	%f2,	%f4
	fmovdvc	%icc,	%f23,	%f10
	fmuld8sux16	%f4,	%f10,	%f22
	edge8n	%l6,	%l4,	%o1
	ldsh	[%l7 + 0x7A],	%i4
	edge8n	%g1,	%o5,	%o4
	fmovse	%icc,	%f18,	%f9
	andncc	%l5,	%i0,	%i3
	movn	%xcc,	%l0,	%g5
	ldub	[%l7 + 0x68],	%o0
	array32	%g2,	%o3,	%l1
	movrlz	%l3,	0x38B,	%g6
	udiv	%i5,	0x17B3,	%o6
	andncc	%o7,	%o2,	%g4
	fpackfix	%f18,	%f27
	fornot2	%f26,	%f16,	%f6
	edge8n	%g7,	%i1,	%i2
	array16	%l2,	%i7,	%i6
	edge32l	%l6,	%l4,	%g3
	fands	%f24,	%f23,	%f18
	ldd	[%l7 + 0x20],	%f18
	add	%o1,	%i4,	%g1
	fnot2s	%f31,	%f8
	edge16	%o5,	%o4,	%i0
	movcc	%icc,	%i3,	%l5
	fnor	%f30,	%f0,	%f22
	sth	%g5,	[%l7 + 0x78]
	fpsub16	%f6,	%f12,	%f18
	fsrc2s	%f28,	%f29
	sth	%l0,	[%l7 + 0x2A]
	ldsb	[%l7 + 0x3E],	%g2
	stw	%o3,	[%l7 + 0x20]
	andncc	%l1,	%o0,	%g6
	addcc	%l3,	%o6,	%i5
	fpsub16s	%f26,	%f0,	%f16
	ldx	[%l7 + 0x28],	%o7
	fmovrde	%o2,	%f28,	%f0
	alignaddr	%g4,	%i1,	%i2
	edge32l	%g7,	%i7,	%i6
	edge16	%l2,	%l6,	%g3
	movcc	%xcc,	%o1,	%l4
	sub	%g1,	0x0FC8,	%o5
	movre	%i4,	0x302,	%i0
	restore %o4, %i3, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l5,	%l0,	%o3
	edge8l	%g2,	%l1,	%g6
	sll	%o0,	%l3,	%i5
	movle	%xcc,	%o7,	%o6
	subc	%o2,	0x1A17,	%g4
	addc	%i2,	%g7,	%i7
	array32	%i6,	%i1,	%l2
	fmovs	%f7,	%f1
	umul	%l6,	%o1,	%l4
	move	%xcc,	%g1,	%g3
	movrgez	%i4,	0x2B2,	%i0
	fabsd	%f18,	%f26
	movvc	%icc,	%o4,	%o5
	move	%icc,	%g5,	%i3
	and	%l0,	%l5,	%o3
	fandnot2s	%f28,	%f22,	%f2
	move	%xcc,	%l1,	%g6
	addc	%g2,	%l3,	%o0
	edge8ln	%o7,	%o6,	%o2
	sub	%g4,	0x0A8C,	%i2
	sth	%g7,	[%l7 + 0x24]
	alignaddrl	%i5,	%i7,	%i1
	fmovs	%f9,	%f7
	edge8n	%l2,	%l6,	%o1
	srlx	%i6,	%g1,	%l4
	sir	0x17A3
	lduw	[%l7 + 0x0C],	%i4
	fcmpd	%fcc0,	%f26,	%f18
	movrgez	%g3,	%i0,	%o4
	sllx	%o5,	%i3,	%g5
	stx	%l5,	[%l7 + 0x28]
	movleu	%xcc,	%l0,	%l1
	andcc	%g6,	%o3,	%l3
	move	%xcc,	%g2,	%o0
	alignaddr	%o7,	%o2,	%o6
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	edge16n	%i5,	%g4,	%i1
	movn	%icc,	%i7,	%l2
	fcmpgt32	%f6,	%f4,	%l6
	movne	%icc,	%i6,	%g1
	fmovde	%icc,	%f15,	%f11
	subccc	%o1,	0x12BC,	%i4
	edge8	%g3,	%i0,	%o4
	fmovs	%f24,	%f2
	movpos	%icc,	%o5,	%l4
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f12
	edge16l	%i3,	%g5,	%l5
	edge32n	%l1,	%g6,	%l0
	movpos	%xcc,	%o3,	%g2
	orncc	%l3,	%o0,	%o7
	edge16	%o2,	%o6,	%g7
	stw	%i2,	[%l7 + 0x78]
	array8	%g4,	%i1,	%i5
	mulx	%i7,	0x1996,	%l6
	save %i6, %l2, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x70, %g3
	sth	%o1,	[%l7 + %g3]
	movpos	%xcc,	%g3,	%i0
	movrne	%i4,	%o4,	%l4
	fpack16	%f2,	%f12
	std	%f28,	[%l7 + 0x38]
	udiv	%i3,	0x13DE,	%g5
	orncc	%o5,	0x08DE,	%l5
	addcc	%g6,	0x09E8,	%l0
	edge8l	%o3,	%g2,	%l1
	mulx	%l3,	%o0,	%o2
	sdivcc	%o7,	0x049F,	%g7
	sllx	%i2,	0x07,	%g4
	movrne	%i1,	0x16A,	%o6
	movgu	%icc,	%i7,	%i5
	movcc	%xcc,	%i6,	%l2
	udivx	%g1,	0x1BBD,	%l6
	sir	0x187A
	sdivx	%o1,	0x106E,	%g3
	fmovspos	%xcc,	%f23,	%f13
	andn	%i4,	0x03DA,	%i0
	andncc	%o4,	%i3,	%l4
	or	%o5,	0x070A,	%g5
	popc	0x1255,	%l5
	fexpand	%f1,	%f10
	umulcc	%g6,	0x12A3,	%o3
	stx	%l0,	[%l7 + 0x50]
	edge32ln	%l1,	%g2,	%l3
	movrgez	%o2,	0x363,	%o0
	edge32n	%o7,	%i2,	%g7
	ldd	[%l7 + 0x68],	%f20
	or	%g4,	0x133D,	%i1
	movrlez	%i7,	0x0C3,	%i5
	sdiv	%o6,	0x0668,	%i6
	ldx	[%l7 + 0x28],	%g1
	sir	0x10F2
	fmovscc	%icc,	%f30,	%f23
	fcmped	%fcc3,	%f0,	%f0
	movn	%icc,	%l6,	%o1
	andncc	%l2,	%i4,	%g3
	edge32	%i0,	%o4,	%i3
	movpos	%icc,	%l4,	%o5
	movrgez	%g5,	0x195,	%l5
	movleu	%icc,	%g6,	%l0
	alignaddrl	%o3,	%g2,	%l1
	fxors	%f19,	%f4,	%f31
	xorcc	%l3,	0x0E23,	%o0
	alignaddr	%o2,	%i2,	%o7
	movre	%g7,	%i1,	%g4
	srax	%i7,	0x1F,	%i5
	srlx	%i6,	%g1,	%l6
	and	%o6,	%o1,	%l2
	subccc	%i4,	0x120E,	%i0
	fmovrslz	%o4,	%f0,	%f12
	edge8n	%g3,	%i3,	%o5
	sethi	0x0209,	%l4
	fmovsgu	%xcc,	%f6,	%f29
	movn	%icc,	%l5,	%g5
	movrne	%l0,	0x05A,	%g6
	nop
	set	0x4A, %i1
	ldub	[%l7 + %i1],	%o3
	stx	%l1,	[%l7 + 0x08]
	lduh	[%l7 + 0x62],	%g2
	umulcc	%l3,	0x0E1A,	%o0
	movne	%icc,	%i2,	%o7
	movne	%xcc,	%o2,	%g7
	fpack16	%f28,	%f26
	ldd	[%l7 + 0x30],	%f22
	movgu	%xcc,	%g4,	%i7
	movre	%i1,	%i5,	%g1
	ldsh	[%l7 + 0x42],	%i6
	xnorcc	%l6,	%o1,	%o6
	sdivcc	%l2,	0x06CE,	%i4
	array32	%o4,	%g3,	%i0
	fpack16	%f20,	%f23
	movl	%icc,	%i3,	%l4
	alignaddr	%l5,	%g5,	%l0
	st	%f14,	[%l7 + 0x18]
	fmovdne	%xcc,	%f8,	%f13
	fpsub16	%f6,	%f10,	%f22
	movrgez	%o5,	0x3BE,	%g6
	movg	%xcc,	%l1,	%g2
	restore %o3, 0x1694, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f12,	%f6,	%f26
	fcmpne32	%f22,	%f2,	%i2
	sll	%o0,	%o7,	%o2
	movgu	%icc,	%g4,	%i7
	fpsub32	%f30,	%f30,	%f2
	smulcc	%g7,	%i1,	%i5
	fmovsleu	%xcc,	%f18,	%f15
	ldd	[%l7 + 0x48],	%g0
	subcc	%l6,	%o1,	%o6
	movrgez	%l2,	%i4,	%o4
	xor	%g3,	0x11F9,	%i0
	fmovsne	%xcc,	%f24,	%f11
	sethi	0x1663,	%i6
	movcc	%icc,	%i3,	%l5
	and	%g5,	0x0DA2,	%l4
	ldsb	[%l7 + 0x5D],	%l0
	fsrc2	%f30,	%f8
	smulcc	%g6,	%l1,	%o5
	array32	%g2,	%o3,	%l3
	edge8l	%o0,	%o7,	%i2
	ldd	[%l7 + 0x20],	%f26
	sir	0x130E
	array8	%g4,	%o2,	%i7
	movcc	%xcc,	%i1,	%i5
	movne	%icc,	%g1,	%g7
	fxor	%f10,	%f24,	%f18
	andncc	%o1,	%o6,	%l6
	sllx	%l2,	0x0D,	%o4
	andn	%i4,	%g3,	%i6
	edge32ln	%i3,	%l5,	%i0
	ld	[%l7 + 0x54],	%f17
	sdivx	%l4,	0x0E34,	%g5
	movneg	%xcc,	%g6,	%l0
	sethi	0x0CE3,	%l1
	edge8l	%g2,	%o5,	%o3
	lduh	[%l7 + 0x1A],	%o0
	ldsh	[%l7 + 0x36],	%o7
	movne	%icc,	%l3,	%i2
	fmovsvc	%xcc,	%f0,	%f17
	and	%o2,	0x0F3D,	%i7
	edge32	%i1,	%i5,	%g1
	movrne	%g4,	%o1,	%g7
	edge16ln	%l6,	%o6,	%o4
	movne	%xcc,	%l2,	%g3
	xnor	%i4,	%i6,	%i3
	movrgez	%i0,	0x096,	%l4
	orncc	%g5,	0x1D79,	%g6
	movne	%icc,	%l0,	%l1
	movneg	%icc,	%g2,	%l5
	xor	%o3,	0x0611,	%o5
	ld	[%l7 + 0x20],	%f26
	fmovrslez	%o7,	%f13,	%f22
	fornot2s	%f12,	%f29,	%f15
	edge8ln	%l3,	%o0,	%o2
	andcc	%i7,	0x1A6D,	%i1
	mova	%icc,	%i5,	%i2
	array16	%g4,	%o1,	%g1
	ldd	[%l7 + 0x48],	%f28
	addc	%l6,	0x039F,	%g7
	srlx	%o6,	%l2,	%o4
	movgu	%xcc,	%g3,	%i6
	movl	%icc,	%i4,	%i0
	st	%f31,	[%l7 + 0x30]
	nop
	set	0x4A, %i0
	lduh	[%l7 + %i0],	%l4
	mulx	%i3,	0x00F5,	%g5
	movvs	%xcc,	%g6,	%l0
	nop
	set	0x14, %l2
	lduh	[%l7 + %l2],	%g2
	udiv	%l5,	0x1041,	%o3
	srlx	%o5,	%l1,	%l3
	sir	0x1520
	fsrc1s	%f24,	%f28
	addccc	%o0,	%o7,	%o2
	udivcc	%i7,	0x080E,	%i1
	sra	%i5,	0x19,	%g4
	fabss	%f29,	%f30
	movvs	%icc,	%o1,	%i2
	movcs	%xcc,	%g1,	%g7
	array16	%o6,	%l2,	%l6
	orcc	%o4,	%i6,	%g3
	movgu	%xcc,	%i0,	%l4
	sethi	0x0764,	%i4
	movrgez	%i3,	%g6,	%l0
	edge32n	%g5,	%g2,	%o3
	array32	%l5,	%o5,	%l3
	for	%f4,	%f22,	%f26
	edge8l	%o0,	%o7,	%o2
	movvs	%xcc,	%l1,	%i7
	smulcc	%i1,	0x154A,	%g4
	or	%o1,	0x0D2E,	%i2
	edge16n	%i5,	%g1,	%g7
	ldd	[%l7 + 0x78],	%o6
	fmovrdne	%l6,	%f20,	%f8
	fpackfix	%f8,	%f8
	fornot2s	%f11,	%f13,	%f22
	for	%f16,	%f2,	%f24
	orncc	%o4,	%l2,	%g3
	smul	%i6,	0x0ABA,	%l4
	fnegs	%f31,	%f25
	std	%f30,	[%l7 + 0x70]
	fsrc1s	%f11,	%f15
	sra	%i0,	%i3,	%g6
	fpack32	%f16,	%f4,	%f18
	nop
	set	0x68, %l0
	std	%f18,	[%l7 + %l0]
	fpack16	%f16,	%f25
	xorcc	%l0,	0x09E1,	%i4
	movrgz	%g2,	0x2B3,	%o3
	ldd	[%l7 + 0x10],	%g4
	array16	%o5,	%l5,	%l3
	edge16ln	%o7,	%o2,	%o0
	fcmpne16	%f22,	%f10,	%l1
	edge32l	%i7,	%i1,	%o1
	addcc	%g4,	%i5,	%g1
	edge32ln	%g7,	%o6,	%l6
	movcs	%icc,	%o4,	%i2
	sethi	0x07FE,	%l2
	movle	%icc,	%i6,	%l4
	orncc	%g3,	%i3,	%g6
	fmovs	%f15,	%f6
	srlx	%l0,	0x04,	%i0
	ldsb	[%l7 + 0x28],	%g2
	fmul8x16al	%f29,	%f24,	%f18
	movre	%i4,	0x361,	%g5
	fmovdgu	%xcc,	%f26,	%f6
	movge	%xcc,	%o3,	%o5
	xorcc	%l5,	0x002A,	%l3
	movrgez	%o2,	%o7,	%o0
	sdivcc	%i7,	0x0159,	%i1
	ldsb	[%l7 + 0x6D],	%l1
	edge8l	%o1,	%g4,	%g1
	or	%g7,	0x1F6C,	%o6
	popc	%i5,	%o4
	edge8ln	%l6,	%i2,	%i6
	lduh	[%l7 + 0x36],	%l2
	xnorcc	%g3,	%i3,	%g6
	xnorcc	%l4,	%l0,	%g2
	xnor	%i0,	%i4,	%o3
	movvc	%xcc,	%g5,	%l5
	std	%f2,	[%l7 + 0x18]
	subccc	%l3,	%o5,	%o7
	xnorcc	%o2,	%o0,	%i1
	ldsh	[%l7 + 0x60],	%i7
	addcc	%l1,	0x196B,	%g4
	ld	[%l7 + 0x18],	%f7
	movleu	%icc,	%o1,	%g7
	sllx	%o6,	0x1E,	%g1
	mulx	%i5,	%o4,	%i2
	fmovrdne	%i6,	%f20,	%f6
	stb	%l2,	[%l7 + 0x6A]
	andn	%g3,	%i3,	%g6
	addccc	%l4,	%l6,	%l0
	array16	%i0,	%i4,	%g2
	fmovdl	%xcc,	%f21,	%f21
	addccc	%o3,	%g5,	%l5
	andn	%o5,	0x1E5B,	%l3
	or	%o2,	%o0,	%i1
	movrlez	%o7,	%l1,	%i7
	fandnot2	%f26,	%f12,	%f10
	sth	%o1,	[%l7 + 0x78]
	sub	%g4,	%o6,	%g7
	movgu	%icc,	%g1,	%i5
	fmovdgu	%xcc,	%f27,	%f2
	st	%f5,	[%l7 + 0x3C]
	movge	%xcc,	%o4,	%i2
	andncc	%i6,	%l2,	%i3
	sethi	0x174A,	%g6
	movpos	%xcc,	%l4,	%g3
	srl	%l0,	%l6,	%i4
	sdiv	%i0,	0x0E35,	%o3
	sdivx	%g2,	0x1904,	%l5
	lduw	[%l7 + 0x74],	%o5
	umul	%l3,	0x1B55,	%g5
	sir	0x0ECF
	fmovrdgez	%o2,	%f0,	%f18
	movcs	%icc,	%o0,	%o7
	movgu	%xcc,	%l1,	%i7
	edge8l	%o1,	%g4,	%i1
	lduh	[%l7 + 0x70],	%o6
	xor	%g7,	%g1,	%o4
	popc	%i2,	%i6
	movrlz	%i5,	%i3,	%g6
	edge8l	%l4,	%g3,	%l2
	movrlez	%l6,	0x3AD,	%l0
	fmovse	%icc,	%f1,	%f19
	sth	%i0,	[%l7 + 0x08]
	fornot2s	%f23,	%f11,	%f7
	fmovrslez	%i4,	%f18,	%f11
	fnand	%f28,	%f2,	%f16
	movrgez	%o3,	%l5,	%g2
	movrne	%l3,	%o5,	%g5
	addc	%o2,	%o0,	%o7
	sdiv	%i7,	0x124C,	%o1
	array16	%g4,	%i1,	%o6
	fandnot1	%f8,	%f24,	%f20
	sub	%l1,	0x0A8A,	%g1
	fone	%f26
	sdivcc	%o4,	0x0884,	%i2
	mova	%icc,	%i6,	%g7
	fpadd32	%f22,	%f12,	%f8
	fmovdvs	%xcc,	%f9,	%f7
	fmovsg	%xcc,	%f9,	%f14
	stb	%i5,	[%l7 + 0x44]
	alignaddrl	%g6,	%l4,	%g3
	movrne	%l2,	0x1C9,	%i3
	edge8ln	%l6,	%l0,	%i0
	xorcc	%o3,	0x17E0,	%l5
	udivcc	%g2,	0x12D8,	%i4
	fmovrdlez	%l3,	%f12,	%f24
	sth	%g5,	[%l7 + 0x64]
	fcmpd	%fcc1,	%f22,	%f28
	or	%o5,	%o0,	%o7
	add	%o2,	0x0DFB,	%i7
	fcmpgt32	%f26,	%f10,	%g4
	fmovdne	%icc,	%f7,	%f31
	fmovdle	%xcc,	%f0,	%f25
	nop
	set	0x64, %l6
	sth	%o1,	[%l7 + %l6]
	edge8ln	%o6,	%i1,	%l1
	edge32l	%g1,	%o4,	%i2
	movn	%xcc,	%g7,	%i6
	udivcc	%i5,	0x1A10,	%g6
	array32	%g3,	%l2,	%i3
	fmovrsne	%l6,	%f30,	%f12
	and	%l4,	%l0,	%o3
	fcmpeq16	%f4,	%f12,	%i0
	mova	%xcc,	%g2,	%l5
	addc	%i4,	%g5,	%o5
	orcc	%l3,	0x02CC,	%o0
	edge8n	%o2,	%o7,	%g4
	stx	%i7,	[%l7 + 0x60]
	save %o6, 0x05F6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l1,	%g1,	%i1
	ldd	[%l7 + 0x58],	%f18
	stw	%i2,	[%l7 + 0x24]
	edge16	%g7,	%i6,	%o4
	sllx	%g6,	0x1C,	%g3
	srax	%i5,	%l2,	%i3
	std	%f26,	[%l7 + 0x10]
	mulscc	%l4,	%l0,	%l6
	std	%f6,	[%l7 + 0x70]
	movrlz	%o3,	%i0,	%l5
	xnor	%g2,	%g5,	%o5
	movg	%icc,	%i4,	%l3
	fcmped	%fcc1,	%f14,	%f2
	edge8ln	%o2,	%o0,	%o7
	ldd	[%l7 + 0x30],	%i6
	smul	%g4,	%o6,	%o1
	fcmpes	%fcc3,	%f10,	%f31
	array16	%g1,	%l1,	%i2
	fcmple32	%f30,	%f4,	%g7
	or	%i6,	0x06FC,	%o4
	ld	[%l7 + 0x60],	%f21
	sdivx	%g6,	0x0CFC,	%i1
	fmovdvs	%icc,	%f13,	%f3
	edge8n	%g3,	%l2,	%i3
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%f28
	edge32	%l4,	%i5,	%l6
	fmovsvc	%xcc,	%f12,	%f16
	smulcc	%l0,	%o3,	%i0
	movne	%xcc,	%l5,	%g2
	movge	%xcc,	%o5,	%i4
	fmovrdlez	%l3,	%f0,	%f18
	movrlez	%g5,	%o2,	%o0
	umul	%o7,	0x1884,	%g4
	fpadd16s	%f17,	%f21,	%f27
	movvs	%xcc,	%i7,	%o1
	fmovdneg	%xcc,	%f29,	%f29
	ldsh	[%l7 + 0x72],	%g1
	fmovdleu	%icc,	%f4,	%f20
	xor	%l1,	%i2,	%g7
	ldsb	[%l7 + 0x27],	%o6
	movneg	%icc,	%i6,	%g6
	mulscc	%i1,	%g3,	%o4
	stb	%i3,	[%l7 + 0x54]
	edge16	%l4,	%l2,	%l6
	fand	%f26,	%f0,	%f10
	movge	%xcc,	%l0,	%i5
	movn	%xcc,	%i0,	%o3
	xor	%g2,	0x0572,	%o5
	sethi	0x083F,	%i4
	sir	0x023E
	edge8n	%l3,	%l5,	%o2
	sth	%o0,	[%l7 + 0x7C]
	sll	%g5,	0x11,	%g4
	fsrc2	%f12,	%f10
	fmovse	%icc,	%f19,	%f7
	fmovdne	%xcc,	%f11,	%f8
	andn	%o7,	0x129F,	%o1
	subccc	%g1,	0x1D3B,	%i7
	fmovdcs	%xcc,	%f10,	%f9
	udiv	%i2,	0x077F,	%g7
	srax	%l1,	%i6,	%g6
	andn	%i1,	0x0F5E,	%o6
	umul	%o4,	0x0EF6,	%i3
	mulscc	%l4,	%g3,	%l2
	fmovrde	%l0,	%f16,	%f8
	fmovscs	%xcc,	%f26,	%f21
	st	%f11,	[%l7 + 0x2C]
	subccc	%i5,	%l6,	%o3
	edge16	%g2,	%i0,	%i4
	save %o5, %l3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o0,	%g5,	%g4
	fmovspos	%icc,	%f8,	%f27
	or	%o7,	0x1C55,	%o1
	edge32n	%g1,	%o2,	%i2
	fmovsle	%icc,	%f21,	%f22
	ldsh	[%l7 + 0x26],	%g7
	ldx	[%l7 + 0x18],	%i7
	lduw	[%l7 + 0x6C],	%i6
	movne	%icc,	%l1,	%g6
	sdivx	%i1,	0x1CBE,	%o4
	xnor	%i3,	0x167D,	%o6
	sth	%g3,	[%l7 + 0x2C]
	stx	%l2,	[%l7 + 0x28]
	stx	%l0,	[%l7 + 0x50]
	popc	0x09EC,	%i5
	subcc	%l4,	0x1433,	%l6
	movneg	%xcc,	%g2,	%i0
	addccc	%o3,	%o5,	%i4
	movl	%xcc,	%l3,	%l5
	sub	%o0,	0x136A,	%g4
	movrlz	%o7,	0x1BD,	%o1
	lduw	[%l7 + 0x38],	%g1
	stw	%o2,	[%l7 + 0x24]
	ldsw	[%l7 + 0x3C],	%i2
	nop
	set	0x26, %g1
	ldub	[%l7 + %g1],	%g7
	andncc	%g5,	%i7,	%l1
	xor	%g6,	%i1,	%i6
	udivcc	%i3,	0x0BFA,	%o4
	movge	%xcc,	%g3,	%l2
	edge16ln	%o6,	%i5,	%l0
	movle	%icc,	%l6,	%l4
	movvs	%icc,	%i0,	%g2
	movcs	%icc,	%o5,	%o3
	fornot1s	%f27,	%f19,	%f12
	srax	%i4,	%l3,	%l5
	popc	%o0,	%o7
	mulx	%o1,	%g4,	%o2
	fpadd16s	%f0,	%f12,	%f28
	andn	%i2,	0x0031,	%g7
	ldd	[%l7 + 0x70],	%f10
	subccc	%g1,	0x1543,	%i7
	movrlz	%l1,	0x23E,	%g5
	edge16n	%i1,	%i6,	%i3
	srl	%o4,	%g3,	%l2
	fpadd32s	%f8,	%f0,	%f10
	fcmpeq32	%f28,	%f2,	%g6
	orcc	%i5,	0x0722,	%o6
	faligndata	%f2,	%f28,	%f6
	nop
	set	0x38, %g2
	std	%f18,	[%l7 + %g2]
	andcc	%l6,	%l0,	%l4
	movvs	%xcc,	%i0,	%o5
	fcmple32	%f18,	%f4,	%g2
	udivx	%o3,	0x11B2,	%l3
	umulcc	%i4,	0x0C7F,	%o0
	lduh	[%l7 + 0x58],	%o7
	andcc	%l5,	%g4,	%o1
	ldd	[%l7 + 0x50],	%f16
	udivcc	%i2,	0x0A8B,	%g7
	for	%f16,	%f4,	%f0
	fmovd	%f18,	%f20
	stb	%o2,	[%l7 + 0x3E]
	addccc	%i7,	%l1,	%g5
	movre	%g1,	0x2E8,	%i1
	srax	%i3,	0x1A,	%i6
	fmuld8sux16	%f19,	%f12,	%f4
	fmovrdgez	%g3,	%f24,	%f16
	array16	%l2,	%g6,	%o4
	fpsub16s	%f17,	%f5,	%f6
	edge32n	%o6,	%i5,	%l6
	fmovsa	%xcc,	%f15,	%f10
	ldsh	[%l7 + 0x08],	%l0
	subc	%l4,	0x0E20,	%o5
	srl	%i0,	%g2,	%l3
	subcc	%o3,	%o0,	%i4
	fmovda	%xcc,	%f7,	%f15
	edge8	%l5,	%o7,	%g4
	sir	0x0924
	edge8	%o1,	%g7,	%i2
	srlx	%o2,	%i7,	%l1
	udivx	%g5,	0x1CB3,	%g1
	movl	%xcc,	%i1,	%i3
	srax	%g3,	%i6,	%l2
	sra	%g6,	0x1B,	%o6
	std	%f18,	[%l7 + 0x40]
	fzero	%f20
	srlx	%i5,	0x02,	%o4
	addc	%l0,	%l4,	%l6
	fxor	%f6,	%f26,	%f16
	alignaddrl	%i0,	%o5,	%g2
	sdivx	%o3,	0x0BAE,	%o0
	subccc	%i4,	0x0D8D,	%l5
	movrgez	%o7,	0x0A4,	%l3
	fmovsvs	%icc,	%f19,	%f14
	stx	%o1,	[%l7 + 0x70]
	sra	%g7,	0x18,	%g4
	srax	%o2,	%i7,	%l1
	fmovsneg	%xcc,	%f26,	%f9
	andncc	%g5,	%g1,	%i1
	mova	%xcc,	%i2,	%g3
	edge8ln	%i6,	%l2,	%i3
	movneg	%icc,	%g6,	%o6
	fmovdneg	%xcc,	%f5,	%f3
	movrgz	%o4,	0x0DC,	%l0
	mova	%xcc,	%l4,	%i5
	fpsub16	%f4,	%f20,	%f30
	xor	%i0,	0x1386,	%l6
	movrlez	%g2,	0x33F,	%o3
	fsrc1s	%f12,	%f28
	edge32ln	%o5,	%o0,	%l5
	addc	%o7,	%l3,	%i4
	movle	%icc,	%g7,	%g4
	movpos	%icc,	%o1,	%i7
	fexpand	%f27,	%f18
	sdivx	%o2,	0x0870,	%l1
	ldsb	[%l7 + 0x4F],	%g5
	sir	0x0932
	orn	%i1,	0x0BD6,	%i2
	umulcc	%g1,	%i6,	%g3
	movvc	%icc,	%l2,	%g6
	movcc	%xcc,	%i3,	%o6
	subcc	%l0,	0x19D6,	%l4
	movne	%xcc,	%o4,	%i0
	sth	%i5,	[%l7 + 0x40]
	fornot2s	%f20,	%f5,	%f27
	edge8l	%g2,	%l6,	%o5
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	mulscc	%l5,	0x105E,	%l3
	edge8ln	%i4,	%o7,	%g7
	std	%f0,	[%l7 + 0x18]
	stx	%o1,	[%l7 + 0x08]
	edge16ln	%g4,	%i7,	%l1
	srl	%o2,	0x1C,	%g5
	mova	%xcc,	%i1,	%g1
	movcc	%icc,	%i2,	%g3
	udivx	%l2,	0x0447,	%i6
	popc	0x0E11,	%g6
	sth	%o6,	[%l7 + 0x68]
	addc	%i3,	%l0,	%l4
	sdiv	%i0,	0x1BA6,	%o4
	sth	%g2,	[%l7 + 0x0E]
	edge8ln	%i5,	%o5,	%o0
	smulcc	%o3,	0x1557,	%l5
	udivcc	%l3,	0x05DE,	%l6
	fandnot2s	%f20,	%f24,	%f10
	edge8	%i4,	%g7,	%o1
	ldd	[%l7 + 0x48],	%g4
	move	%icc,	%o7,	%l1
	fcmpgt16	%f4,	%f24,	%i7
	fmovs	%f29,	%f10
	smul	%o2,	%g5,	%g1
	alignaddrl	%i1,	%g3,	%i2
	sllx	%i6,	0x0D,	%l2
	smulcc	%o6,	0x021F,	%g6
	array8	%l0,	%l4,	%i3
	xnorcc	%o4,	%g2,	%i0
	edge32	%o5,	%i5,	%o0
	subcc	%o3,	%l3,	%l6
	fmovsgu	%icc,	%f2,	%f21
	siam	0x1
	subcc	%i4,	0x1E75,	%l5
	addcc	%g7,	%g4,	%o1
	alignaddr	%l1,	%i7,	%o2
	edge16l	%o7,	%g1,	%g5
	ldsw	[%l7 + 0x3C],	%i1
	edge8ln	%i2,	%g3,	%l2
	movrne	%o6,	%i6,	%g6
	smul	%l0,	%i3,	%o4
	alignaddr	%l4,	%g2,	%i0
	edge8n	%i5,	%o0,	%o3
	fmul8sux16	%f4,	%f18,	%f10
	mova	%icc,	%l3,	%l6
	fmovdge	%icc,	%f28,	%f16
	umulcc	%o5,	%l5,	%i4
	movvc	%icc,	%g4,	%o1
	sdiv	%g7,	0x0B5D,	%l1
	movne	%xcc,	%o2,	%o7
	edge32n	%g1,	%i7,	%g5
	stw	%i2,	[%l7 + 0x58]
	movcc	%xcc,	%i1,	%g3
	mova	%xcc,	%o6,	%l2
	ldub	[%l7 + 0x2B],	%g6
	movg	%xcc,	%i6,	%l0
	fmovdneg	%xcc,	%f8,	%f29
	fmovsn	%icc,	%f26,	%f23
	andncc	%i3,	%o4,	%g2
	movvs	%xcc,	%i0,	%l4
	lduh	[%l7 + 0x76],	%o0
	srax	%i5,	0x03,	%l3
	fcmpne16	%f16,	%f14,	%l6
	andncc	%o3,	%l5,	%i4
	ldsb	[%l7 + 0x5F],	%g4
	fmovda	%icc,	%f28,	%f14
	xnorcc	%o1,	%g7,	%l1
	movrgez	%o5,	0x260,	%o2
	fones	%f18
	sdivcc	%o7,	0x1984,	%i7
	movge	%xcc,	%g1,	%i2
	movpos	%icc,	%i1,	%g5
	mulscc	%g3,	0x18C4,	%o6
	sub	%l2,	0x0D2A,	%i6
	edge16ln	%l0,	%i3,	%g6
	fandnot1	%f30,	%f0,	%f4
	array32	%o4,	%g2,	%l4
	fcmpd	%fcc2,	%f26,	%f16
	fmovrdgz	%i0,	%f14,	%f30
	sir	0x1CBE
	edge8l	%o0,	%l3,	%l6
	stx	%i5,	[%l7 + 0x38]
	fcmpgt32	%f28,	%f26,	%o3
	subccc	%l5,	%g4,	%o1
	andcc	%g7,	%l1,	%o5
	nop
	set	0x2C, %l4
	ldsw	[%l7 + %l4],	%o2
	sdiv	%i4,	0x0FD1,	%i7
	ldd	[%l7 + 0x30],	%f16
	ldsh	[%l7 + 0x1E],	%g1
	fmovrdlz	%o7,	%f10,	%f20
	stb	%i2,	[%l7 + 0x7E]
	fmovscs	%icc,	%f12,	%f9
	fcmple16	%f30,	%f28,	%g5
	srl	%i1,	%o6,	%g3
	andncc	%l2,	%l0,	%i6
	nop
	set	0x3B, %i3
	ldub	[%l7 + %i3],	%i3
	subc	%o4,	0x1EBF,	%g2
	ldx	[%l7 + 0x60],	%l4
	fmovrsne	%i0,	%f29,	%f31
	movgu	%xcc,	%o0,	%l3
	addccc	%l6,	%i5,	%o3
	srl	%l5,	0x16,	%g6
	movre	%o1,	0x09A,	%g4
	fnot1s	%f18,	%f25
	ldx	[%l7 + 0x48],	%g7
	addcc	%l1,	0x0CD9,	%o5
	fxnors	%f4,	%f9,	%f31
	or	%o2,	0x1A77,	%i4
	edge16l	%i7,	%g1,	%i2
	subccc	%g5,	0x131F,	%i1
	movrlez	%o7,	0x1C8,	%o6
	fands	%f27,	%f18,	%f20
	edge16ln	%g3,	%l0,	%l2
	array16	%i3,	%i6,	%o4
	popc	%g2,	%l4
	stb	%o0,	[%l7 + 0x70]
	movleu	%icc,	%l3,	%i0
	ldx	[%l7 + 0x20],	%l6
	movpos	%icc,	%i5,	%o3
	movcc	%icc,	%l5,	%g6
	edge16l	%g4,	%g7,	%l1
	orncc	%o1,	%o5,	%i4
	fsrc1	%f26,	%f18
	move	%xcc,	%i7,	%g1
	srlx	%o2,	%g5,	%i2
	and	%i1,	%o7,	%o6
	movcs	%xcc,	%g3,	%l2
	fpsub16s	%f11,	%f12,	%f24
	fpadd32	%f16,	%f12,	%f2
	std	%f10,	[%l7 + 0x28]
	mulx	%i3,	%l0,	%i6
	sdiv	%o4,	0x1CB8,	%l4
	fmovdpos	%icc,	%f28,	%f12
	addc	%o0,	%l3,	%g2
	movgu	%xcc,	%i0,	%i5
	movcc	%xcc,	%o3,	%l5
	sllx	%l6,	%g6,	%g7
	fcmpeq16	%f8,	%f24,	%g4
	fmovscs	%icc,	%f2,	%f1
	movn	%icc,	%o1,	%o5
	move	%xcc,	%i4,	%l1
	umulcc	%g1,	%o2,	%g5
	edge32n	%i2,	%i1,	%o7
	fors	%f25,	%f11,	%f11
	movgu	%xcc,	%o6,	%i7
	fandnot1s	%f27,	%f29,	%f5
	edge16ln	%g3,	%i3,	%l0
	edge8l	%l2,	%o4,	%i6
	sra	%l4,	%l3,	%o0
	edge16	%i0,	%i5,	%o3
	sdivx	%g2,	0x1F85,	%l6
	movn	%icc,	%l5,	%g7
	orcc	%g6,	0x19A2,	%g4
	xnor	%o5,	0x0CD8,	%i4
	fmuld8ulx16	%f15,	%f2,	%f18
	fmovdgu	%icc,	%f25,	%f28
	smulcc	%o1,	0x1B6E,	%l1
	umul	%o2,	%g5,	%g1
	fpsub32s	%f23,	%f8,	%f17
	fmovdle	%xcc,	%f15,	%f25
	ldsb	[%l7 + 0x76],	%i2
	movg	%xcc,	%o7,	%i1
	fmovrde	%o6,	%f22,	%f28
	orcc	%i7,	%g3,	%i3
	fand	%f8,	%f18,	%f28
	andn	%l2,	%o4,	%i6
	edge16n	%l0,	%l4,	%l3
	fcmped	%fcc0,	%f2,	%f22
	sll	%i0,	%i5,	%o3
	fmovdcc	%icc,	%f30,	%f29
	mulscc	%o0,	%l6,	%g2
	and	%l5,	0x0940,	%g7
	fnot1	%f28,	%f30
	fmovsneg	%xcc,	%f24,	%f15
	xnorcc	%g4,	%g6,	%o5
	ld	[%l7 + 0x78],	%f19
	edge32n	%i4,	%o1,	%o2
	nop
	set	0x28, %l3
	ldx	[%l7 + %l3],	%l1
	movpos	%xcc,	%g1,	%i2
	stb	%g5,	[%l7 + 0x4F]
	fnot2	%f16,	%f20
	ldx	[%l7 + 0x08],	%o7
	edge16	%o6,	%i7,	%g3
	edge16n	%i3,	%i1,	%l2
	movpos	%icc,	%i6,	%o4
	fmovde	%xcc,	%f1,	%f16
	ld	[%l7 + 0x38],	%f27
	movl	%xcc,	%l4,	%l0
	lduh	[%l7 + 0x1A],	%l3
	edge32ln	%i0,	%o3,	%i5
	movrne	%l6,	0x158,	%g2
	popc	%o0,	%l5
	addcc	%g7,	%g6,	%o5
	srlx	%i4,	%g4,	%o2
	xor	%l1,	%o1,	%i2
	sir	0x1B9B
	edge8ln	%g1,	%o7,	%o6
	addc	%g5,	%i7,	%g3
	smulcc	%i1,	0x1A7D,	%i3
	srax	%i6,	0x1C,	%o4
	movrgez	%l2,	0x245,	%l0
	smulcc	%l4,	%l3,	%i0
	smulcc	%i5,	0x1D65,	%l6
	xnorcc	%g2,	0x0BC6,	%o3
	sll	%o0,	0x05,	%l5
	edge16n	%g6,	%o5,	%i4
	movrgez	%g7,	0x212,	%o2
	addcc	%l1,	0x1874,	%o1
	srax	%g4,	%i2,	%g1
	edge32	%o6,	%g5,	%i7
	mulx	%g3,	0x02F1,	%i1
	sll	%i3,	%i6,	%o4
	movg	%icc,	%l2,	%o7
	edge8ln	%l0,	%l4,	%l3
	fcmpeq32	%f2,	%f6,	%i0
	fors	%f4,	%f6,	%f26
	movrgez	%i5,	0x3DB,	%g2
	udivx	%l6,	0x1FC3,	%o0
	fmovde	%xcc,	%f15,	%f6
	movcc	%icc,	%o3,	%l5
	ld	[%l7 + 0x78],	%f19
	fmul8sux16	%f2,	%f30,	%f24
	movrgz	%g6,	0x256,	%i4
	movgu	%icc,	%o5,	%g7
	sir	0x08D2
	umulcc	%l1,	%o2,	%o1
	ld	[%l7 + 0x18],	%f23
	umulcc	%i2,	0x1688,	%g4
	fmovsle	%icc,	%f5,	%f14
	alignaddrl	%o6,	%g5,	%i7
	edge8n	%g3,	%i1,	%g1
	stw	%i6,	[%l7 + 0x78]
	ldsh	[%l7 + 0x50],	%i3
	andcc	%l2,	%o7,	%l0
	move	%icc,	%o4,	%l4
	popc	%l3,	%i5
	fexpand	%f13,	%f10
	subc	%i0,	%g2,	%o0
	fand	%f4,	%f10,	%f14
	movrne	%l6,	%l5,	%o3
	movcc	%icc,	%g6,	%o5
	fnegd	%f0,	%f24
	lduh	[%l7 + 0x7E],	%i4
	orn	%g7,	%l1,	%o1
	fnor	%f30,	%f14,	%f8
	movle	%icc,	%i2,	%g4
	stw	%o6,	[%l7 + 0x2C]
	add	%g5,	0x1C19,	%o2
	movvs	%icc,	%i7,	%i1
	ldd	[%l7 + 0x18],	%f14
	edge32	%g3,	%i6,	%i3
	fmovsneg	%xcc,	%f15,	%f24
	movrgez	%l2,	%g1,	%o7
	movneg	%icc,	%l0,	%l4
	fcmpne32	%f6,	%f16,	%o4
	movneg	%xcc,	%i5,	%i0
	movrgz	%l3,	0x34C,	%g2
	fmovrslz	%l6,	%f2,	%f24
	ldsb	[%l7 + 0x28],	%o0
	fmovsne	%xcc,	%f4,	%f7
	stx	%o3,	[%l7 + 0x38]
	movvs	%icc,	%l5,	%o5
	movvs	%icc,	%g6,	%i4
	fmovsg	%icc,	%f25,	%f8
	fmovrslez	%g7,	%f16,	%f28
	movpos	%icc,	%o1,	%i2
	bshuffle	%f26,	%f4,	%f0
	restore %l1, %g4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o2,	%o6,	%i7
	ld	[%l7 + 0x70],	%f19
	fmovsge	%xcc,	%f3,	%f5
	xorcc	%i1,	%i6,	%g3
	udiv	%i3,	0x1C84,	%g1
	subc	%o7,	0x1E6B,	%l0
	add	%l2,	%l4,	%o4
	srlx	%i0,	0x0D,	%l3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3553
!	Type f   	: 5345
!	Type i   	: 16102
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x393E84AD
.word 0xCAF942CA
.word 0xD864A1D8
.word 0x260AE2AD
.word 0x558A98C9
.word 0x61AC7414
.word 0x429CB029
.word 0x46AF002B
.word 0x3B308FC9
.word 0x4079A811
.word 0x40A4F080
.word 0x962241B9
.word 0xB8181469
.word 0x11E8FC92
.word 0x98202260
.word 0xFCAE1E56
.word 0x2B0B6A85
.word 0xA57B4A72
.word 0x582AA766
.word 0x2C7EFD3F
.word 0x942138D0
.word 0xD8271A23
.word 0x8CE691FC
.word 0xC7303FED
.word 0x9F5AA922
.word 0x25E9B389
.word 0x38392F81
.word 0x5ECCB0CB
.word 0x9696DD20
.word 0xAE048756
.word 0x74E6F44E
.word 0x8260E63F
.word 0x49A47CDC
.word 0x707F467B
.word 0x1884E0C9
.word 0xBE1E7A42
.word 0x79F25355
.word 0x18441C56
.word 0xEBDA937D
.word 0x9DAAD066
.word 0x6B6F69EE
.word 0x87FA9F30
.word 0x1E81F62A
.word 0xF06BBBCA
.word 0xA9F9FCEA
.word 0x5862BB2B
.word 0x9405F7EE
.word 0x82DCB7D3
.word 0x6A70CF5D
.word 0x840FC592
.word 0x1CCC34C2
.word 0x47E5F678
.word 0xCC6FE25B
.word 0x163149C0
.word 0x55D15F0E
.word 0x393B8265
.word 0x8DD52942
.word 0x0E83572D
.word 0x6E224C98
.word 0x91EBAD64
.word 0xF08980CE
.word 0xFC6A1035
.word 0x426BB770
.word 0x18366B4F
.end
