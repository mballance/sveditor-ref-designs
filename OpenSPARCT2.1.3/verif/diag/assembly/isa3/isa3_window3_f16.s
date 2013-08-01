/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f16.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f16.s,v 1.1 2007/05/11 17:22:37 drp Exp $"
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
	setx	0x560ECF31A06B8042,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xA,	%g1
	set	0xE,	%g2
	set	0x8,	%g3
	set	0x2,	%g4
	set	0xA,	%g5
	set	0xE,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0xE,	%i1
	set	-0xF,	%i2
	set	-0x8,	%i3
	set	-0x4,	%i4
	set	-0x8,	%i5
	set	-0x5,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x0C136A94,	%l0
	set	0x3EB97EEF,	%l1
	set	0x2DBC0F6C,	%l2
	set	0x24FA53ED,	%l3
	set	0x58674794,	%l4
	set	0x4BE784C1,	%l5
	set	0x26E7E48B,	%l6
	!# Output registers
	set	0x1308,	%o0
	set	-0x1CA5,	%o1
	set	-0x0A16,	%o2
	set	0x1F07,	%o3
	set	-0x02CB,	%o4
	set	0x10FA,	%o5
	set	0x0183,	%o6
	set	-0x0C54,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x30F0E5B5F98689A7)
	INIT_TH_FP_REG(%l7,%f2,0xE0A85CA30C18E7EE)
	INIT_TH_FP_REG(%l7,%f4,0xD04C9448B0C7B15E)
	INIT_TH_FP_REG(%l7,%f6,0x7702A3DC0D0D35AE)
	INIT_TH_FP_REG(%l7,%f8,0x5735E62494493C29)
	INIT_TH_FP_REG(%l7,%f10,0xE1BB301F1B66127F)
	INIT_TH_FP_REG(%l7,%f12,0xF8CCD8458E6E7E4D)
	INIT_TH_FP_REG(%l7,%f14,0xC4D9C0668C44520A)
	INIT_TH_FP_REG(%l7,%f16,0x9DEE9A742C7503EC)
	INIT_TH_FP_REG(%l7,%f18,0xCD68735A2953B714)
	INIT_TH_FP_REG(%l7,%f20,0xAFC2B4D8B1A1C92D)
	INIT_TH_FP_REG(%l7,%f22,0xB1E4E7A546C17E5A)
	INIT_TH_FP_REG(%l7,%f24,0x287951FE2F946D7C)
	INIT_TH_FP_REG(%l7,%f26,0xCD277B58DF097928)
	INIT_TH_FP_REG(%l7,%f28,0x5CA2A541B5BAC30E)
	INIT_TH_FP_REG(%l7,%f30,0x8382F6E844CA51C3)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBF1, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	std	%f0,	[%l7 + 0x48]
	fmovdn	%xcc,	%f18,	%f12
	sir	0x03B2
	st	%f26,	[%l7 + 0x74]
	ldsh	[%l7 + 0x30],	%o4
	movn	%icc,	%l2,	%o3
	movcs	%xcc,	%i0,	%g3
	array16	%g7,	%i2,	%o6
	subcc	%i4,	0x0089,	%i3
	st	%f31,	[%l7 + 0x78]
	fsrc2s	%f19,	%f19
	umulcc	%l6,	%l5,	%i7
	movg	%icc,	%i6,	%o5
	edge32l	%o1,	%o7,	%g6
	umulcc	%l0,	%o0,	%i1
	edge16n	%g4,	%l1,	%i5
	andn	%g2,	%o2,	%l4
	and	%g1,	%l3,	%g5
	edge32n	%l2,	%o3,	%i0
	udivx	%o4,	0x1377,	%g7
	smul	%g3,	%o6,	%i2
	andcc	%i4,	%i3,	%l5
	udivcc	%i7,	0x0A98,	%l6
	fmovrsne	%o5,	%f21,	%f13
	sethi	0x0988,	%o1
	movgu	%icc,	%o7,	%g6
	udiv	%i6,	0x1CBB,	%o0
	fands	%f25,	%f24,	%f27
	mova	%xcc,	%l0,	%i1
	andn	%g4,	%l1,	%i5
	edge32ln	%o2,	%l4,	%g1
	xnorcc	%l3,	%g2,	%g5
	movcs	%xcc,	%o3,	%l2
	st	%f12,	[%l7 + 0x60]
	movge	%icc,	%i0,	%o4
	fmovscc	%xcc,	%f21,	%f14
	sth	%g3,	[%l7 + 0x64]
	orncc	%g7,	0x089F,	%i2
	andncc	%o6,	%i4,	%l5
	save %i3, 0x05AE, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%l6,	%o1
	ldx	[%l7 + 0x20],	%o5
	fmovscs	%xcc,	%f0,	%f7
	movcs	%xcc,	%g6,	%i6
	stx	%o7,	[%l7 + 0x18]
	andn	%o0,	0x05C0,	%l0
	fmovsge	%icc,	%f12,	%f26
	ldsb	[%l7 + 0x1A],	%i1
	mulscc	%g4,	%i5,	%o2
	fcmpes	%fcc0,	%f8,	%f26
	movgu	%xcc,	%l4,	%g1
	move	%icc,	%l3,	%l1
	umul	%g5,	%g2,	%l2
	orn	%o3,	0x183D,	%o4
	andn	%g3,	0x0848,	%i0
	fands	%f25,	%f19,	%f10
	fxor	%f30,	%f6,	%f26
	movrne	%g7,	0x0D3,	%o6
	umulcc	%i4,	%i2,	%l5
	movvc	%xcc,	%i7,	%l6
	fmovrsne	%o1,	%f25,	%f25
	st	%f24,	[%l7 + 0x54]
	edge32ln	%o5,	%g6,	%i6
	edge8l	%i3,	%o0,	%o7
	udivx	%i1,	0x0054,	%g4
	movgu	%icc,	%l0,	%i5
	fmovdvc	%icc,	%f3,	%f6
	movrgz	%o2,	0x012,	%l4
	edge32l	%l3,	%g1,	%l1
	mulx	%g2,	0x1968,	%g5
	edge16	%l2,	%o4,	%o3
	xorcc	%i0,	%g7,	%o6
	andn	%i4,	%i2,	%l5
	sllx	%i7,	%l6,	%o1
	edge32l	%o5,	%g3,	%i6
	xorcc	%g6,	0x18A7,	%i3
	fmovsne	%xcc,	%f20,	%f23
	sth	%o7,	[%l7 + 0x52]
	mulx	%i1,	%g4,	%l0
	fmovdg	%xcc,	%f25,	%f29
	subc	%i5,	0x1E3D,	%o2
	sethi	0x0351,	%o0
	edge8n	%l4,	%g1,	%l1
	add	%g2,	0x02AF,	%g5
	movrne	%l2,	%l3,	%o3
	movcc	%xcc,	%i0,	%g7
	movcc	%xcc,	%o4,	%o6
	nop
	set	0x4C, %g6
	stw	%i2,	[%l7 + %g6]
	restore %i4, 0x1982, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%l6,	%l5
	umul	%o5,	%o1,	%g3
	movge	%icc,	%i6,	%g6
	subc	%o7,	%i3,	%g4
	popc	0x1D1F,	%i1
	edge32	%l0,	%o2,	%o0
	movgu	%xcc,	%i5,	%g1
	and	%l1,	0x12B9,	%g2
	fmovdgu	%icc,	%f0,	%f23
	fmovrdlz	%l4,	%f20,	%f30
	ld	[%l7 + 0x48],	%f24
	edge16l	%l2,	%l3,	%g5
	nop
	set	0x08, %g4
	stx	%o3,	[%l7 + %g4]
	ldsb	[%l7 + 0x1E],	%i0
	edge8	%o4,	%g7,	%o6
	ld	[%l7 + 0x5C],	%f2
	sllx	%i4,	%i2,	%i7
	std	%f24,	[%l7 + 0x28]
	fmovdpos	%icc,	%f5,	%f15
	movvs	%xcc,	%l5,	%l6
	movrlez	%o1,	%o5,	%i6
	ldsb	[%l7 + 0x7C],	%g6
	sir	0x10F4
	fabsd	%f26,	%f2
	fmuld8sux16	%f31,	%f10,	%f8
	edge32ln	%g3,	%o7,	%g4
	subc	%i3,	%l0,	%o2
	popc	%o0,	%i1
	sra	%g1,	0x1D,	%l1
	ld	[%l7 + 0x4C],	%f14
	ldsw	[%l7 + 0x3C],	%g2
	udivcc	%i5,	0x1D66,	%l2
	lduw	[%l7 + 0x14],	%l4
	alignaddr	%l3,	%g5,	%i0
	siam	0x3
	udivx	%o4,	0x0A2C,	%g7
	sdiv	%o6,	0x0244,	%i4
	sth	%i2,	[%l7 + 0x4C]
	fpadd32s	%f1,	%f4,	%f10
	save %i7, %l5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o1,	%o5,	%i6
	fmovrdlz	%l6,	%f24,	%f10
	andn	%g6,	0x0F4B,	%o7
	edge8l	%g4,	%g3,	%i3
	sdivcc	%l0,	0x0F3B,	%o0
	array16	%o2,	%i1,	%l1
	andncc	%g2,	%i5,	%g1
	edge8n	%l2,	%l3,	%g5
	movn	%icc,	%i0,	%o4
	stb	%l4,	[%l7 + 0x50]
	save %o6, %g7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x15E7
	edge32ln	%i7,	%l5,	%i4
	smulcc	%o3,	0x12B3,	%o1
	array16	%i6,	%o5,	%g6
	nop
	set	0x7E, %l0
	ldsh	[%l7 + %l0],	%l6
	fmovda	%xcc,	%f4,	%f5
	fsrc1	%f28,	%f30
	subc	%o7,	0x078D,	%g4
	edge16ln	%g3,	%i3,	%o0
	popc	0x0246,	%o2
	ldsh	[%l7 + 0x56],	%l0
	array8	%l1,	%g2,	%i1
	fmovrdgez	%i5,	%f30,	%f8
	or	%l2,	0x0DA0,	%l3
	srlx	%g5,	0x1A,	%i0
	fmovsl	%icc,	%f26,	%f7
	stx	%g1,	[%l7 + 0x60]
	sdiv	%o4,	0x10CB,	%l4
	edge16l	%g7,	%i2,	%i7
	movg	%xcc,	%l5,	%o6
	orncc	%o3,	0x18DC,	%o1
	movpos	%icc,	%i6,	%o5
	array8	%i4,	%g6,	%o7
	xor	%l6,	0x1DC4,	%g4
	fmovrdlez	%i3,	%f28,	%f16
	edge32	%o0,	%o2,	%g3
	fpadd16s	%f15,	%f12,	%f29
	fpadd16	%f6,	%f18,	%f22
	edge8ln	%l0,	%l1,	%i1
	fornot2	%f26,	%f14,	%f30
	sir	0x0EA5
	and	%g2,	0x068D,	%i5
	movre	%l2,	0x32E,	%l3
	mova	%xcc,	%i0,	%g1
	ldd	[%l7 + 0x60],	%o4
	fnegd	%f4,	%f16
	or	%g5,	0x00D4,	%g7
	xnor	%i2,	%i7,	%l5
	ldd	[%l7 + 0x08],	%l4
	fandnot1	%f4,	%f28,	%f18
	ldd	[%l7 + 0x70],	%o2
	subc	%o6,	0x1A19,	%i6
	movpos	%xcc,	%o5,	%o1
	nop
	set	0x0A, %g1
	sth	%g6,	[%l7 + %g1]
	xnor	%o7,	0x01AD,	%i4
	smulcc	%g4,	%l6,	%o0
	subcc	%i3,	%o2,	%l0
	orcc	%g3,	0x093E,	%i1
	fand	%f16,	%f0,	%f0
	fmovse	%xcc,	%f9,	%f1
	fmul8x16au	%f9,	%f10,	%f6
	xorcc	%l1,	0x017E,	%g2
	addc	%i5,	0x1E2C,	%l3
	movneg	%xcc,	%i0,	%g1
	movneg	%xcc,	%o4,	%l2
	array8	%g5,	%i2,	%i7
	mova	%xcc,	%l5,	%l4
	andn	%g7,	%o3,	%i6
	fandnot1	%f28,	%f10,	%f16
	movrgez	%o6,	%o5,	%o1
	alignaddrl	%g6,	%o7,	%g4
	xnorcc	%i4,	%o0,	%l6
	andn	%i3,	%l0,	%o2
	smulcc	%g3,	0x0155,	%l1
	fxnor	%f12,	%f28,	%f12
	fpadd32	%f10,	%f24,	%f12
	umul	%i1,	%g2,	%i5
	movre	%i0,	%l3,	%o4
	orcc	%l2,	0x1333,	%g1
	mulscc	%g5,	%i2,	%l5
	sethi	0x1275,	%i7
	fmovsgu	%xcc,	%f22,	%f19
	sra	%g7,	%l4,	%o3
	xnor	%i6,	%o5,	%o6
	edge16	%g6,	%o7,	%o1
	movvs	%icc,	%i4,	%o0
	edge16l	%l6,	%i3,	%g4
	fmovdn	%xcc,	%f15,	%f29
	mulscc	%o2,	%g3,	%l0
	sll	%l1,	%g2,	%i5
	ldsh	[%l7 + 0x38],	%i0
	sth	%l3,	[%l7 + 0x1E]
	movpos	%icc,	%i1,	%o4
	edge8ln	%l2,	%g1,	%g5
	fornot1s	%f10,	%f7,	%f25
	ldub	[%l7 + 0x1C],	%i2
	xnor	%l5,	0x163B,	%i7
	fsrc1s	%f20,	%f4
	movne	%xcc,	%l4,	%o3
	lduh	[%l7 + 0x76],	%i6
	fcmpes	%fcc0,	%f27,	%f28
	movrne	%g7,	%o6,	%o5
	umulcc	%o7,	0x0823,	%o1
	ldsw	[%l7 + 0x08],	%g6
	andncc	%o0,	%i4,	%i3
	array16	%l6,	%g4,	%g3
	edge8	%l0,	%o2,	%g2
	mulscc	%i5,	%i0,	%l3
	orncc	%l1,	%o4,	%i1
	st	%f10,	[%l7 + 0x58]
	xorcc	%g1,	%g5,	%i2
	st	%f16,	[%l7 + 0x2C]
	fpadd16s	%f7,	%f13,	%f15
	movrne	%l2,	0x013,	%l5
	udivcc	%l4,	0x0A55,	%i7
	array16	%o3,	%i6,	%o6
	subc	%g7,	0x14D8,	%o5
	xorcc	%o1,	%g6,	%o7
	orcc	%i4,	0x193C,	%o0
	move	%xcc,	%i3,	%g4
	subccc	%l6,	0x1EB2,	%l0
	movpos	%xcc,	%o2,	%g2
	srlx	%i5,	%i0,	%l3
	movn	%xcc,	%g3,	%l1
	orcc	%i1,	%g1,	%g5
	array32	%o4,	%i2,	%l2
	fmovsl	%icc,	%f1,	%f28
	fmovsa	%xcc,	%f11,	%f12
	sub	%l4,	%l5,	%o3
	sdivx	%i6,	0x03CD,	%o6
	sth	%i7,	[%l7 + 0x42]
	fmul8x16al	%f2,	%f2,	%f30
	ldub	[%l7 + 0x30],	%o5
	fsrc1s	%f9,	%f4
	movne	%icc,	%o1,	%g6
	xor	%g7,	0x1CA4,	%i4
	fnot1s	%f30,	%f12
	smulcc	%o0,	%o7,	%i3
	movrgz	%l6,	%l0,	%o2
	srlx	%g2,	0x1D,	%g4
	udivx	%i0,	0x0D53,	%l3
	addcc	%i5,	%g3,	%l1
	popc	%g1,	%g5
	movrlez	%o4,	0x3B2,	%i2
	nop
	set	0x7C, %l4
	ldsw	[%l7 + %l4],	%i1
	st	%f19,	[%l7 + 0x24]
	stw	%l4,	[%l7 + 0x34]
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	or	%o6,	%o3,	%o5
	smul	%o1,	%g6,	%g7
	mulx	%i7,	%i4,	%o0
	fnot2s	%f7,	%f13
	stx	%o7,	[%l7 + 0x18]
	andncc	%i3,	%l0,	%o2
	fmovs	%f4,	%f25
	array32	%g2,	%g4,	%l6
	movl	%icc,	%i0,	%l3
	mova	%xcc,	%g3,	%l1
	nop
	set	0x1E, %i5
	ldub	[%l7 + %i5],	%i5
	addccc	%g5,	%o4,	%g1
	movcc	%icc,	%i1,	%i2
	edge32n	%l4,	%l2,	%l5
	addcc	%i6,	%o3,	%o6
	movgu	%xcc,	%o5,	%g6
	movle	%icc,	%g7,	%i7
	std	%f6,	[%l7 + 0x78]
	move	%icc,	%o1,	%o0
	movleu	%icc,	%i4,	%o7
	edge16	%l0,	%o2,	%g2
	fmovdle	%xcc,	%f25,	%f7
	stw	%i3,	[%l7 + 0x68]
	movle	%xcc,	%l6,	%i0
	srax	%g4,	0x14,	%g3
	orcc	%l1,	0x1779,	%i5
	fcmped	%fcc2,	%f20,	%f8
	orn	%g5,	%l3,	%g1
	lduw	[%l7 + 0x1C],	%o4
	fmovdn	%icc,	%f26,	%f29
	movgu	%icc,	%i1,	%l4
	fornot2	%f4,	%f22,	%f12
	mova	%xcc,	%l2,	%l5
	movleu	%icc,	%i2,	%i6
	fexpand	%f2,	%f14
	movcc	%xcc,	%o6,	%o3
	fsrc2s	%f31,	%f5
	fnand	%f8,	%f28,	%f26
	sllx	%g6,	%o5,	%i7
	sth	%g7,	[%l7 + 0x36]
	st	%f27,	[%l7 + 0x20]
	movrne	%o1,	%o0,	%o7
	fmovdvc	%xcc,	%f19,	%f16
	edge16	%l0,	%i4,	%o2
	mulscc	%g2,	%i3,	%l6
	movne	%xcc,	%i0,	%g4
	mova	%icc,	%g3,	%l1
	fnand	%f24,	%f18,	%f26
	fmovdle	%icc,	%f0,	%f29
	movvc	%xcc,	%g5,	%i5
	lduh	[%l7 + 0x50],	%l3
	fnot2	%f26,	%f24
	fmovrslz	%g1,	%f19,	%f3
	addcc	%o4,	0x0467,	%l4
	movleu	%xcc,	%l2,	%l5
	fmul8ulx16	%f8,	%f4,	%f30
	edge16n	%i2,	%i6,	%i1
	mulscc	%o3,	0x1352,	%g6
	fmovdg	%icc,	%f5,	%f19
	move	%xcc,	%o6,	%o5
	srlx	%g7,	%o1,	%o0
	fmovrdne	%i7,	%f6,	%f6
	movvc	%xcc,	%l0,	%o7
	xnor	%i4,	%g2,	%i3
	movle	%icc,	%l6,	%o2
	faligndata	%f0,	%f30,	%f16
	movcs	%xcc,	%g4,	%i0
	movrgz	%g3,	%g5,	%l1
	move	%icc,	%i5,	%g1
	lduh	[%l7 + 0x62],	%l3
	subccc	%l4,	0x0A72,	%o4
	nop
	set	0x64, %l3
	ldsh	[%l7 + %l3],	%l2
	fpmerge	%f9,	%f29,	%f26
	edge16n	%i2,	%l5,	%i1
	udiv	%i6,	0x1B87,	%g6
	udivcc	%o6,	0x1432,	%o5
	ldd	[%l7 + 0x10],	%o2
	and	%o1,	%o0,	%g7
	ldd	[%l7 + 0x28],	%f4
	fand	%f28,	%f22,	%f16
	st	%f22,	[%l7 + 0x60]
	nop
	set	0x20, %o1
	stw	%l0,	[%l7 + %o1]
	fnegd	%f6,	%f22
	addcc	%i7,	0x0B6F,	%o7
	move	%xcc,	%i4,	%g2
	movg	%icc,	%i3,	%l6
	stb	%o2,	[%l7 + 0x3F]
	sth	%i0,	[%l7 + 0x5E]
	fmovrdne	%g3,	%f6,	%f8
	ldsh	[%l7 + 0x78],	%g4
	fmovdn	%xcc,	%f2,	%f19
	stb	%l1,	[%l7 + 0x78]
	sdivx	%g5,	0x0018,	%g1
	sll	%i5,	0x0A,	%l3
	fmovrdgez	%l4,	%f26,	%f22
	fnegs	%f6,	%f3
	edge16ln	%o4,	%l2,	%l5
	udivx	%i2,	0x0F46,	%i6
	fmovs	%f31,	%f26
	ldsw	[%l7 + 0x48],	%i1
	xorcc	%o6,	%o5,	%o3
	srlx	%o1,	%g6,	%g7
	movpos	%icc,	%l0,	%i7
	edge8n	%o0,	%i4,	%o7
	ldsh	[%l7 + 0x2A],	%g2
	movrgez	%l6,	%o2,	%i0
	edge16n	%i3,	%g3,	%l1
	fornot1	%f14,	%f0,	%f0
	sdiv	%g4,	0x0C27,	%g1
	edge16n	%i5,	%l3,	%l4
	udivx	%g5,	0x1AFD,	%l2
	udivx	%o4,	0x0E74,	%l5
	fmul8ulx16	%f22,	%f4,	%f6
	ldsw	[%l7 + 0x58],	%i6
	movn	%icc,	%i2,	%o6
	movrne	%i1,	%o3,	%o5
	edge32ln	%g6,	%g7,	%o1
	movg	%icc,	%l0,	%i7
	subccc	%i4,	%o7,	%o0
	array32	%g2,	%l6,	%i0
	fmovrdlez	%i3,	%f22,	%f16
	xorcc	%g3,	%l1,	%o2
	mulx	%g1,	0x11FD,	%i5
	fmovspos	%icc,	%f15,	%f14
	fmovrsne	%g4,	%f1,	%f13
	fmovd	%f2,	%f22
	xor	%l4,	0x0608,	%g5
	stw	%l2,	[%l7 + 0x30]
	movn	%icc,	%l3,	%o4
	ldx	[%l7 + 0x78],	%i6
	movleu	%icc,	%l5,	%i2
	sdivcc	%i1,	0x1D36,	%o3
	ldub	[%l7 + 0x0A],	%o6
	sub	%g6,	%o5,	%g7
	fmul8x16	%f22,	%f26,	%f26
	fmul8x16al	%f29,	%f2,	%f14
	fornot2	%f4,	%f22,	%f8
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%o1
	std	%f20,	[%l7 + 0x48]
	std	%f6,	[%l7 + 0x40]
	andn	%l0,	0x0ECD,	%i4
	sub	%i7,	%o0,	%g2
	ldsw	[%l7 + 0x14],	%o7
	fornot2	%f14,	%f18,	%f10
	movvs	%icc,	%l6,	%i0
	move	%icc,	%g3,	%i3
	fsrc2	%f24,	%f2
	sir	0x1C89
	udivcc	%o2,	0x10C6,	%g1
	movn	%icc,	%l1,	%g4
	fmovrsgez	%i5,	%f0,	%f25
	ldx	[%l7 + 0x10],	%l4
	fandnot1	%f8,	%f28,	%f0
	movge	%xcc,	%l2,	%g5
	ldd	[%l7 + 0x30],	%l2
	restore %o4, 0x15BF, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f20,	%f4,	%f2
	array16	%i2,	%i6,	%i1
	movcc	%icc,	%o6,	%o3
	movre	%g6,	0x215,	%o5
	stx	%o1,	[%l7 + 0x40]
	array8	%l0,	%i4,	%i7
	fmovrdlez	%o0,	%f20,	%f0
	addcc	%g2,	%o7,	%l6
	fexpand	%f20,	%f26
	fmovdgu	%icc,	%f5,	%f4
	sllx	%g7,	0x04,	%g3
	movvc	%xcc,	%i0,	%i3
	ld	[%l7 + 0x20],	%f5
	and	%o2,	%g1,	%l1
	movneg	%xcc,	%i5,	%g4
	mulscc	%l4,	%g5,	%l3
	mulscc	%o4,	0x1D00,	%l2
	smulcc	%l5,	%i2,	%i1
	fmul8x16au	%f17,	%f19,	%f4
	std	%f8,	[%l7 + 0x68]
	fmovrdgz	%o6,	%f10,	%f12
	fmovdneg	%xcc,	%f23,	%f6
	edge16l	%i6,	%o3,	%o5
	sir	0x0338
	ldsh	[%l7 + 0x30],	%g6
	fcmpeq16	%f24,	%f22,	%l0
	sdivx	%i4,	0x1320,	%o1
	movvc	%icc,	%i7,	%g2
	sethi	0x031B,	%o0
	save %l6, 0x02C0, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	fmul8ulx16	%f20,	%f24,	%f12
	stb	%o7,	[%l7 + 0x44]
	edge16l	%o2,	%i3,	%l1
	alignaddrl	%g1,	%i5,	%g4
	smul	%l4,	%g5,	%o4
	and	%l3,	%l2,	%i2
	subc	%l5,	%o6,	%i1
	movgu	%xcc,	%i6,	%o5
	subccc	%g6,	%l0,	%i4
	stw	%o3,	[%l7 + 0x48]
	sra	%i7,	%o1,	%g2
	srax	%o0,	%g7,	%g3
	movrgez	%i0,	0x203,	%l6
	or	%o7,	%o2,	%l1
	alignaddrl	%g1,	%i3,	%i5
	movre	%l4,	0x00E,	%g4
	edge16ln	%g5,	%l3,	%l2
	fmovdle	%xcc,	%f11,	%f25
	mova	%xcc,	%i2,	%o4
	and	%o6,	0x098D,	%l5
	and	%i6,	%o5,	%i1
	srl	%l0,	%g6,	%o3
	movrlez	%i7,	0x208,	%o1
	array32	%g2,	%o0,	%i4
	mulscc	%g3,	0x1B5A,	%i0
	sllx	%l6,	%o7,	%g7
	ldsw	[%l7 + 0x28],	%o2
	movl	%xcc,	%l1,	%g1
	edge32n	%i5,	%i3,	%l4
	mulx	%g4,	%l3,	%g5
	fpsub32s	%f31,	%f5,	%f0
	movne	%icc,	%i2,	%o4
	fmovdcs	%icc,	%f12,	%f22
	fexpand	%f14,	%f4
	ldd	[%l7 + 0x78],	%f28
	and	%l2,	0x1C70,	%l5
	edge32l	%i6,	%o6,	%i1
	srl	%o5,	%l0,	%g6
	ld	[%l7 + 0x54],	%f25
	sllx	%i7,	0x1B,	%o1
	fpmerge	%f17,	%f14,	%f18
	fcmple32	%f14,	%f24,	%g2
	edge32l	%o3,	%o0,	%i4
	movrne	%i0,	0x1F1,	%g3
	movrlz	%l6,	%o7,	%o2
	array8	%l1,	%g7,	%i5
	stb	%g1,	[%l7 + 0x21]
	siam	0x3
	fpack16	%f18,	%f2
	srl	%i3,	%g4,	%l3
	bshuffle	%f6,	%f18,	%f4
	sir	0x1529
	fmovrsne	%l4,	%f8,	%f24
	move	%icc,	%i2,	%o4
	addccc	%l2,	0x0C4B,	%g5
	movvc	%icc,	%i6,	%o6
	stw	%i1,	[%l7 + 0x58]
	ldsh	[%l7 + 0x7A],	%o5
	sra	%l0,	0x10,	%g6
	fmovrdgez	%i7,	%f14,	%f4
	sll	%l5,	0x0F,	%g2
	andcc	%o3,	%o0,	%o1
	edge32l	%i0,	%g3,	%l6
	fsrc1s	%f2,	%f28
	addc	%i4,	%o2,	%o7
	smulcc	%g7,	%l1,	%i5
	fmovrde	%g1,	%f28,	%f26
	fmovrdlez	%i3,	%f10,	%f30
	fcmpeq32	%f8,	%f30,	%l3
	movvs	%xcc,	%g4,	%i2
	edge16ln	%o4,	%l2,	%g5
	array8	%l4,	%i6,	%i1
	ldub	[%l7 + 0x6B],	%o6
	fmovrslez	%l0,	%f28,	%f9
	udivx	%g6,	0x0AA6,	%o5
	srl	%l5,	%g2,	%o3
	ldub	[%l7 + 0x1E],	%i7
	andcc	%o1,	%o0,	%i0
	edge16n	%l6,	%g3,	%o2
	sethi	0x1337,	%i4
	fcmpd	%fcc0,	%f2,	%f14
	fcmpgt32	%f6,	%f24,	%o7
	mulscc	%l1,	%g7,	%g1
	mulx	%i5,	0x0A7F,	%i3
	edge8ln	%g4,	%l3,	%i2
	fmovdneg	%icc,	%f3,	%f26
	andncc	%o4,	%l2,	%g5
	movl	%icc,	%l4,	%i1
	andcc	%o6,	0x1B68,	%i6
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%f28
	save %l0, 0x19D8, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x50],	%l5
	ldd	[%l7 + 0x70],	%g6
	andcc	%o3,	%g2,	%o1
	edge32l	%i7,	%o0,	%i0
	udivx	%g3,	0x002C,	%l6
	movleu	%xcc,	%i4,	%o7
	fsrc2s	%f9,	%f29
	orn	%l1,	%o2,	%g1
	sth	%g7,	[%l7 + 0x70]
	stw	%i3,	[%l7 + 0x38]
	ldx	[%l7 + 0x58],	%i5
	edge32ln	%l3,	%g4,	%o4
	movne	%xcc,	%i2,	%l2
	xnorcc	%l4,	0x19C3,	%g5
	fmovrsne	%i1,	%f1,	%f16
	ldsh	[%l7 + 0x6A],	%o6
	xorcc	%i6,	0x1095,	%l0
	fcmpd	%fcc3,	%f14,	%f12
	sir	0x1A10
	lduw	[%l7 + 0x54],	%o5
	fpsub16	%f24,	%f20,	%f28
	sdivcc	%l5,	0x1A16,	%o3
	ldsw	[%l7 + 0x54],	%g6
	edge16ln	%o1,	%i7,	%g2
	mulscc	%o0,	%g3,	%i0
	andncc	%l6,	%o7,	%l1
	fmovrdne	%i4,	%f22,	%f14
	andn	%o2,	0x0B15,	%g7
	fpsub16	%f24,	%f28,	%f26
	movneg	%icc,	%g1,	%i3
	sdiv	%l3,	0x15BC,	%g4
	andcc	%o4,	0x0C47,	%i5
	srl	%i2,	0x0D,	%l4
	xorcc	%g5,	0x076D,	%i1
	movcs	%xcc,	%l2,	%o6
	subccc	%i6,	%l0,	%l5
	fmovrdgez	%o5,	%f18,	%f26
	xor	%g6,	0x15ED,	%o1
	edge16	%i7,	%o3,	%o0
	fpack16	%f26,	%f4
	orn	%g2,	%i0,	%g3
	fpadd16s	%f9,	%f5,	%f22
	orncc	%l6,	0x0F1D,	%l1
	sllx	%o7,	0x01,	%o2
	andncc	%i4,	%g7,	%i3
	pdist	%f2,	%f10,	%f4
	subcc	%l3,	0x1E17,	%g1
	edge32ln	%g4,	%i5,	%i2
	smulcc	%o4,	%l4,	%i1
	movvc	%xcc,	%g5,	%l2
	ldsw	[%l7 + 0x6C],	%i6
	fexpand	%f3,	%f10
	alignaddrl	%l0,	%l5,	%o6
	fmovsneg	%xcc,	%f8,	%f17
	edge32n	%g6,	%o5,	%i7
	nop
	set	0x0D, %o5
	stb	%o1,	[%l7 + %o5]
	subcc	%o0,	%o3,	%g2
	sdivcc	%g3,	0x07CB,	%l6
	fmovsle	%xcc,	%f30,	%f26
	mulscc	%l1,	%i0,	%o7
	fcmple16	%f12,	%f16,	%o2
	movcc	%xcc,	%g7,	%i3
	alignaddr	%i4,	%l3,	%g4
	udivx	%g1,	0x1208,	%i2
	edge16	%o4,	%i5,	%l4
	movg	%icc,	%g5,	%l2
	umulcc	%i6,	0x051B,	%l0
	ldsw	[%l7 + 0x38],	%l5
	addccc	%o6,	%g6,	%o5
	edge32n	%i1,	%o1,	%i7
	alignaddrl	%o0,	%g2,	%o3
	orn	%l6,	%g3,	%i0
	movg	%xcc,	%l1,	%o2
	save %o7, 0x1E0F, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i4,	%l3
	edge16l	%g4,	%g7,	%i2
	popc	%o4,	%i5
	array8	%g1,	%l4,	%g5
	nop
	set	0x7A, %i0
	ldub	[%l7 + %i0],	%l2
	fpadd32s	%f20,	%f9,	%f25
	fpadd16s	%f31,	%f17,	%f21
	fmul8ulx16	%f16,	%f26,	%f4
	sdivcc	%i6,	0x1BC9,	%l5
	fnot1	%f20,	%f2
	fmovdge	%xcc,	%f14,	%f16
	movneg	%xcc,	%o6,	%g6
	fnegs	%f13,	%f7
	fmovsvs	%icc,	%f27,	%f6
	stx	%l0,	[%l7 + 0x38]
	orcc	%o5,	0x1DDF,	%o1
	movpos	%xcc,	%i1,	%o0
	movrlz	%g2,	0x091,	%i7
	ldsh	[%l7 + 0x4C],	%o3
	fnand	%f18,	%f0,	%f16
	fmovsl	%icc,	%f8,	%f30
	sth	%g3,	[%l7 + 0x74]
	fmovdvs	%xcc,	%f8,	%f6
	movneg	%xcc,	%i0,	%l6
	ldsh	[%l7 + 0x3E],	%o2
	fmovse	%icc,	%f14,	%f6
	ld	[%l7 + 0x5C],	%f26
	sir	0x0A7C
	ld	[%l7 + 0x70],	%f29
	sth	%l1,	[%l7 + 0x14]
	subc	%i3,	0x08EA,	%i4
	edge16	%l3,	%o7,	%g4
	sethi	0x0DDC,	%g7
	subc	%o4,	%i5,	%g1
	fmovse	%icc,	%f25,	%f24
	fmovsneg	%xcc,	%f20,	%f12
	move	%xcc,	%i2,	%g5
	subc	%l2,	%l4,	%l5
	edge32n	%o6,	%i6,	%g6
	fcmpne16	%f10,	%f22,	%l0
	movrne	%o5,	0x29B,	%o1
	edge32n	%o0,	%g2,	%i1
	movn	%icc,	%o3,	%i7
	stb	%g3,	[%l7 + 0x66]
	umul	%i0,	%l6,	%l1
	smul	%i3,	0x02CA,	%o2
	fcmpeq16	%f8,	%f22,	%l3
	fnegs	%f18,	%f9
	fornot2	%f24,	%f4,	%f6
	restore %i4, %o7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g7,	0x26A,	%o4
	fcmple32	%f24,	%f30,	%g1
	stw	%i5,	[%l7 + 0x24]
	addccc	%i2,	0x0E2A,	%g5
	sra	%l4,	0x18,	%l5
	movcc	%xcc,	%o6,	%l2
	srlx	%i6,	%l0,	%o5
	fmovsne	%icc,	%f20,	%f8
	andncc	%o1,	%o0,	%g6
	fmuld8ulx16	%f30,	%f11,	%f6
	xorcc	%i1,	0x1A3B,	%g2
	nop
	set	0x5E, %o6
	lduh	[%l7 + %o6],	%i7
	nop
	set	0x08, %g5
	ldx	[%l7 + %g5],	%g3
	stx	%o3,	[%l7 + 0x50]
	stw	%i0,	[%l7 + 0x78]
	addcc	%l1,	0x02B3,	%i3
	orncc	%l6,	0x01EB,	%o2
	fpack16	%f22,	%f13
	fcmpne16	%f6,	%f20,	%i4
	fcmpeq32	%f16,	%f26,	%l3
	edge8n	%o7,	%g7,	%o4
	andncc	%g1,	%i5,	%g4
	fands	%f29,	%f18,	%f18
	umulcc	%i2,	0x1915,	%g5
	fpsub32	%f12,	%f28,	%f8
	st	%f20,	[%l7 + 0x2C]
	movne	%xcc,	%l4,	%o6
	movrlez	%l5,	0x0CF,	%i6
	fcmpne16	%f20,	%f0,	%l2
	fxnors	%f22,	%f26,	%f23
	andncc	%l0,	%o1,	%o0
	mova	%xcc,	%g6,	%i1
	movrlez	%o5,	0x1C2,	%i7
	fnot2s	%f12,	%f1
	fmovd	%f28,	%f14
	edge32ln	%g2,	%o3,	%g3
	lduh	[%l7 + 0x3A],	%i0
	fmovdcc	%xcc,	%f7,	%f3
	movneg	%xcc,	%l1,	%i3
	andncc	%l6,	%i4,	%l3
	edge8l	%o2,	%o7,	%g7
	movvs	%icc,	%g1,	%i5
	sdivcc	%o4,	0x10C8,	%g4
	subcc	%g5,	%l4,	%i2
	addc	%l5,	0x059B,	%i6
	movrne	%l2,	%o6,	%o1
	movvc	%xcc,	%l0,	%o0
	movrlez	%i1,	0x2D5,	%o5
	orcc	%g6,	0x09E2,	%g2
	orncc	%i7,	0x152A,	%o3
	fnand	%f16,	%f20,	%f18
	movneg	%icc,	%g3,	%i0
	movvc	%xcc,	%l1,	%i3
	move	%xcc,	%i4,	%l6
	movrgz	%o2,	0x0E9,	%l3
	mova	%xcc,	%o7,	%g7
	sdivx	%g1,	0x0BD6,	%i5
	std	%f4,	[%l7 + 0x08]
	ldsw	[%l7 + 0x10],	%g4
	ldsw	[%l7 + 0x3C],	%g5
	fpadd16	%f6,	%f0,	%f18
	edge16l	%o4,	%i2,	%l4
	subc	%l5,	%i6,	%o6
	sdiv	%o1,	0x1703,	%l2
	edge8l	%l0,	%i1,	%o0
	movleu	%icc,	%o5,	%g2
	movl	%icc,	%g6,	%i7
	movrlz	%g3,	%i0,	%l1
	for	%f22,	%f2,	%f6
	movn	%xcc,	%o3,	%i4
	fands	%f1,	%f19,	%f12
	udivcc	%i3,	0x01FD,	%o2
	movne	%xcc,	%l6,	%l3
	sdiv	%o7,	0x1F07,	%g1
	mulx	%g7,	%g4,	%i5
	xorcc	%o4,	%i2,	%l4
	ldd	[%l7 + 0x50],	%g4
	movleu	%xcc,	%i6,	%l5
	fnors	%f2,	%f15,	%f0
	orncc	%o1,	%l2,	%l0
	umul	%o6,	%i1,	%o5
	ldsw	[%l7 + 0x50],	%g2
	movrgz	%o0,	0x2E6,	%g6
	srax	%i7,	%i0,	%l1
	edge32ln	%o3,	%g3,	%i3
	fpsub16s	%f26,	%f14,	%f13
	mulscc	%o2,	%l6,	%l3
	fmovde	%icc,	%f1,	%f11
	ldsw	[%l7 + 0x3C],	%o7
	edge32	%i4,	%g1,	%g7
	movrgez	%i5,	%o4,	%g4
	ldsh	[%l7 + 0x6E],	%l4
	ldub	[%l7 + 0x46],	%i2
	fmovdn	%icc,	%f4,	%f24
	fmovs	%f5,	%f20
	fmovsge	%icc,	%f16,	%f2
	movvc	%xcc,	%g5,	%l5
	fnor	%f20,	%f22,	%f28
	std	%f16,	[%l7 + 0x78]
	movvs	%icc,	%o1,	%l2
	sll	%i6,	0x0D,	%l0
	andncc	%o6,	%o5,	%g2
	movpos	%icc,	%o0,	%g6
	movvc	%xcc,	%i7,	%i1
	fsrc2	%f0,	%f4
	fnand	%f6,	%f30,	%f18
	array8	%i0,	%l1,	%g3
	movle	%xcc,	%o3,	%o2
	addc	%i3,	0x11FD,	%l3
	movn	%xcc,	%o7,	%i4
	fmovrdlz	%g1,	%f30,	%f26
	movpos	%icc,	%g7,	%l6
	edge8n	%o4,	%i5,	%l4
	edge8	%i2,	%g4,	%g5
	ldd	[%l7 + 0x08],	%l4
	ldx	[%l7 + 0x18],	%o1
	ldsh	[%l7 + 0x6A],	%i6
	edge32ln	%l0,	%l2,	%o6
	alignaddrl	%o5,	%g2,	%g6
	addc	%i7,	0x0FEC,	%i1
	fmuld8sux16	%f1,	%f12,	%f6
	srax	%o0,	%l1,	%g3
	movle	%xcc,	%i0,	%o3
	movvc	%xcc,	%i3,	%l3
	lduh	[%l7 + 0x1A],	%o7
	mova	%icc,	%i4,	%g1
	fmovdvc	%icc,	%f12,	%f20
	andn	%g7,	%o2,	%l6
	sub	%o4,	0x191A,	%i5
	edge8l	%i2,	%g4,	%l4
	edge8l	%l5,	%g5,	%i6
	edge8ln	%o1,	%l0,	%l2
	subcc	%o5,	0x0069,	%g2
	movpos	%xcc,	%g6,	%o6
	array8	%i1,	%i7,	%l1
	popc	%o0,	%g3
	movcs	%icc,	%o3,	%i0
	movrne	%l3,	%i3,	%i4
	movvc	%icc,	%g1,	%o7
	fpackfix	%f26,	%f30
	orncc	%g7,	%l6,	%o4
	edge8l	%o2,	%i5,	%i2
	edge32l	%l4,	%g4,	%l5
	addcc	%i6,	0x00F2,	%g5
	fmovd	%f6,	%f16
	ldsh	[%l7 + 0x2A],	%o1
	ldx	[%l7 + 0x18],	%l0
	movrne	%l2,	%g2,	%o5
	movgu	%xcc,	%o6,	%g6
	movn	%icc,	%i7,	%i1
	edge16	%l1,	%g3,	%o3
	xor	%i0,	0x0B99,	%l3
	addccc	%o0,	0x07D7,	%i3
	mulscc	%i4,	0x0E8C,	%g1
	movre	%g7,	0x055,	%l6
	fmovd	%f22,	%f2
	umulcc	%o4,	0x132A,	%o2
	movre	%i5,	%o7,	%i2
	mova	%icc,	%g4,	%l4
	umulcc	%i6,	%g5,	%l5
	movle	%icc,	%o1,	%l0
	fcmped	%fcc1,	%f22,	%f8
	edge16	%l2,	%g2,	%o6
	movrgz	%o5,	0x3F4,	%g6
	edge8ln	%i7,	%l1,	%g3
	fands	%f28,	%f24,	%f10
	stw	%o3,	[%l7 + 0x08]
	alignaddrl	%i1,	%i0,	%o0
	stx	%i3,	[%l7 + 0x20]
	xorcc	%l3,	0x072D,	%g1
	sth	%i4,	[%l7 + 0x62]
	srax	%g7,	0x1D,	%l6
	addcc	%o4,	0x0B59,	%i5
	subcc	%o2,	0x12C3,	%i2
	fmovrsgz	%o7,	%f18,	%f2
	fabsd	%f8,	%f14
	ldub	[%l7 + 0x62],	%l4
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	orcc	%l5,	%g5,	%o1
	xnor	%l2,	0x1A86,	%g2
	movrne	%o6,	0x088,	%o5
	movne	%icc,	%g6,	%l0
	andcc	%l1,	%i7,	%o3
	sub	%i1,	%g3,	%i0
	movleu	%icc,	%o0,	%l3
	movcc	%xcc,	%i3,	%g1
	fmul8x16au	%f9,	%f3,	%f4
	movrgez	%g7,	%i4,	%l6
	orn	%o4,	0x0AE8,	%i5
	udivx	%i2,	0x1007,	%o2
	edge32n	%o7,	%g4,	%l4
	nop
	set	0x28, %o7
	std	%f30,	[%l7 + %o7]
	ldd	[%l7 + 0x68],	%i6
	save %g5, 0x0D59, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l5,	%g2,	%l2
	mulscc	%o6,	%g6,	%o5
	ldsw	[%l7 + 0x30],	%l0
	lduw	[%l7 + 0x3C],	%l1
	ldd	[%l7 + 0x50],	%o2
	andncc	%i7,	%g3,	%i0
	sethi	0x087D,	%o0
	ldub	[%l7 + 0x36],	%l3
	fmovrdne	%i3,	%f12,	%f16
	fcmpgt16	%f0,	%f20,	%g1
	sdivx	%i1,	0x0867,	%g7
	alignaddrl	%i4,	%l6,	%i5
	fcmpes	%fcc1,	%f19,	%f28
	umulcc	%o4,	%i2,	%o7
	movcc	%icc,	%g4,	%l4
	fabsd	%f0,	%f28
	sdivx	%i6,	0x18DF,	%g5
	fmovrslez	%o1,	%f25,	%f15
	or	%l5,	%o2,	%g2
	fmovrslez	%l2,	%f18,	%f0
	xnorcc	%o6,	%g6,	%o5
	movrlez	%l1,	0x04D,	%l0
	nop
	set	0x1C, %o2
	stw	%i7,	[%l7 + %o2]
	udiv	%g3,	0x153A,	%i0
	fmovsa	%icc,	%f16,	%f29
	mulx	%o0,	0x1F67,	%o3
	alignaddrl	%l3,	%g1,	%i3
	addc	%i1,	0x18AE,	%g7
	udivcc	%i4,	0x0A9E,	%l6
	sllx	%o4,	%i5,	%o7
	xnor	%g4,	0x025B,	%i2
	fcmpes	%fcc0,	%f5,	%f18
	restore %l4, 0x0F07, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f31,	%f28,	%f14
	fmovrde	%o1,	%f28,	%f2
	nop
	set	0x76, %g7
	stb	%l5,	[%l7 + %g7]
	fandnot2s	%f30,	%f16,	%f14
	sdiv	%o2,	0x03D0,	%i6
	smulcc	%l2,	%o6,	%g2
	movrne	%o5,	0x273,	%l1
	movcc	%icc,	%l0,	%i7
	xorcc	%g6,	%i0,	%o0
	edge16n	%o3,	%l3,	%g1
	movgu	%icc,	%i3,	%i1
	ld	[%l7 + 0x54],	%f12
	fpadd32	%f28,	%f30,	%f14
	edge8l	%g7,	%i4,	%l6
	addc	%g3,	%i5,	%o7
	or	%o4,	0x14D9,	%g4
	fexpand	%f0,	%f20
	fabsd	%f20,	%f6
	xnorcc	%l4,	0x121A,	%i2
	fpsub32s	%f12,	%f2,	%f4
	movleu	%icc,	%o1,	%g5
	movg	%icc,	%o2,	%i6
	add	%l2,	0x0D5D,	%l5
	mova	%xcc,	%g2,	%o5
	movvc	%xcc,	%o6,	%l1
	movne	%xcc,	%i7,	%g6
	subc	%l0,	%i0,	%o3
	edge8l	%l3,	%g1,	%i3
	fmul8ulx16	%f2,	%f16,	%f26
	addc	%o0,	0x0D0A,	%g7
	fmovsleu	%icc,	%f23,	%f7
	movpos	%xcc,	%i4,	%i1
	subccc	%g3,	%i5,	%l6
	or	%o7,	0x1113,	%o4
	edge8	%l4,	%i2,	%g4
	fandnot2	%f0,	%f0,	%f10
	movgu	%xcc,	%o1,	%o2
	andncc	%i6,	%g5,	%l2
	and	%l5,	0x0234,	%o5
	movre	%g2,	0x353,	%l1
	fsrc1s	%f29,	%f27
	ldsw	[%l7 + 0x30],	%o6
	lduh	[%l7 + 0x60],	%i7
	edge16n	%l0,	%g6,	%i0
	save %o3, %l3, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f20,	%f8,	%f20
	std	%f24,	[%l7 + 0x28]
	sllx	%i3,	%g7,	%i4
	movcs	%xcc,	%i1,	%g3
	addcc	%i5,	0x1087,	%l6
	movleu	%icc,	%o7,	%o4
	edge32	%o0,	%i2,	%l4
	alignaddrl	%o1,	%g4,	%o2
	movle	%icc,	%g5,	%i6
	fmul8ulx16	%f30,	%f4,	%f4
	fcmpeq32	%f2,	%f28,	%l2
	movge	%icc,	%o5,	%l5
	movg	%xcc,	%g2,	%l1
	fpackfix	%f26,	%f26
	array8	%o6,	%l0,	%i7
	stb	%i0,	[%l7 + 0x51]
	popc	0x09A7,	%o3
	addc	%l3,	%g6,	%g1
	smul	%g7,	%i4,	%i3
	sdivcc	%g3,	0x0224,	%i1
	alignaddr	%l6,	%o7,	%i5
	fxnor	%f24,	%f30,	%f30
	fmovspos	%icc,	%f16,	%f3
	sdiv	%o4,	0x0321,	%o0
	smul	%i2,	0x0D9F,	%l4
	ldsh	[%l7 + 0x4E],	%o1
	movneg	%icc,	%g4,	%o2
	add	%i6,	0x1EB5,	%l2
	array16	%o5,	%l5,	%g2
	xorcc	%l1,	%o6,	%g5
	sub	%i7,	0x116D,	%l0
	xnor	%i0,	%o3,	%l3
	lduw	[%l7 + 0x78],	%g1
	fmovdl	%icc,	%f15,	%f12
	ldx	[%l7 + 0x38],	%g7
	srax	%i4,	%g6,	%g3
	ldsb	[%l7 + 0x09],	%i1
	nop
	set	0x1C, %l2
	ldsw	[%l7 + %l2],	%i3
	fcmped	%fcc3,	%f22,	%f20
	xorcc	%l6,	0x0F43,	%o7
	smulcc	%i5,	0x118D,	%o0
	andncc	%o4,	%l4,	%o1
	movrlz	%g4,	%o2,	%i6
	ld	[%l7 + 0x10],	%f30
	edge32ln	%i2,	%o5,	%l5
	movgu	%icc,	%l2,	%l1
	save %o6, 0x1F03, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g2,	0x108B,	%l0
	lduh	[%l7 + 0x4A],	%i0
	fcmpd	%fcc1,	%f24,	%f22
	sub	%o3,	%l3,	%i7
	lduw	[%l7 + 0x5C],	%g1
	move	%icc,	%g7,	%i4
	sethi	0x1958,	%g6
	addc	%g3,	0x0CEB,	%i1
	fmovscc	%xcc,	%f28,	%f3
	movle	%icc,	%i3,	%l6
	edge8n	%o7,	%o0,	%o4
	movcc	%xcc,	%i5,	%l4
	fones	%f1
	addccc	%o1,	0x0BA1,	%g4
	addc	%o2,	%i2,	%o5
	movl	%icc,	%i6,	%l5
	andcc	%l2,	%o6,	%g5
	sir	0x1565
	subc	%g2,	%l0,	%l1
	nop
	set	0x56, %o4
	ldsh	[%l7 + %o4],	%o3
	mulscc	%i0,	0x1E53,	%i7
	subcc	%l3,	0x13AF,	%g7
	movneg	%xcc,	%g1,	%g6
	movcc	%icc,	%i4,	%i1
	movn	%icc,	%i3,	%g3
	fmovda	%xcc,	%f7,	%f23
	alignaddrl	%l6,	%o7,	%o0
	fnegd	%f2,	%f10
	udivx	%o4,	0x1C57,	%l4
	fmovrsgez	%i5,	%f23,	%f30
	andcc	%g4,	0x1C18,	%o2
	fnors	%f15,	%f21,	%f2
	edge32	%o1,	%i2,	%o5
	edge32ln	%l5,	%l2,	%o6
	or	%i6,	%g5,	%g2
	fnot2	%f26,	%f20
	movre	%l0,	0x24F,	%l1
	mulx	%o3,	0x0B32,	%i0
	array8	%l3,	%i7,	%g7
	fcmpgt32	%f18,	%f10,	%g6
	lduh	[%l7 + 0x2A],	%i4
	fmovrdlez	%i1,	%f24,	%f18
	sir	0x194D
	fsrc2	%f28,	%f22
	fcmple16	%f26,	%f30,	%i3
	addc	%g1,	0x0157,	%g3
	fmovsle	%xcc,	%f16,	%f1
	movrgz	%l6,	%o7,	%o4
	fmovdvs	%xcc,	%f4,	%f29
	array32	%o0,	%i5,	%l4
	sll	%g4,	0x1A,	%o1
	sra	%i2,	%o5,	%l5
	andcc	%l2,	0x118F,	%o2
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	edge8n	%g2,	%l0,	%l1
	mulx	%i6,	%o3,	%i0
	sllx	%l3,	%i7,	%g6
	movrgez	%g7,	0x0AE,	%i1
	array32	%i4,	%g1,	%g3
	st	%f20,	[%l7 + 0x48]
	and	%i3,	%o7,	%o4
	save %o0, %l6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g4,	%o1,	%i2
	fmovscs	%icc,	%f14,	%f27
	fpadd16s	%f7,	%f20,	%f13
	udivx	%i5,	0x0E5B,	%o5
	fmovrsne	%l5,	%f5,	%f21
	edge8l	%o2,	%l2,	%o6
	edge8l	%g5,	%g2,	%l1
	movleu	%icc,	%i6,	%l0
	edge8	%o3,	%i0,	%i7
	edge32n	%l3,	%g7,	%i1
	fmovsl	%xcc,	%f3,	%f1
	array8	%g6,	%g1,	%i4
	sllx	%i3,	0x1B,	%o7
	fnegd	%f8,	%f20
	fzero	%f0
	ld	[%l7 + 0x70],	%f21
	alignaddrl	%o4,	%g3,	%o0
	fpadd32s	%f9,	%f11,	%f13
	fmovdg	%icc,	%f5,	%f1
	sdiv	%l4,	0x045B,	%g4
	fsrc1s	%f30,	%f7
	fornot2	%f8,	%f26,	%f20
	movn	%icc,	%o1,	%i2
	edge32	%l6,	%o5,	%l5
	array16	%o2,	%i5,	%l2
	fmovdle	%xcc,	%f29,	%f21
	save %o6, 0x1BA4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l1,	%g2,	%l0
	edge16ln	%i6,	%o3,	%i0
	sdivcc	%l3,	0x1923,	%i7
	st	%f9,	[%l7 + 0x48]
	umul	%g7,	0x08CD,	%g6
	ldub	[%l7 + 0x49],	%g1
	srax	%i1,	0x0C,	%i3
	sub	%i4,	0x01C5,	%o7
	edge16n	%g3,	%o0,	%o4
	fnot1	%f28,	%f30
	movrne	%l4,	%o1,	%g4
	umul	%i2,	0x0A76,	%l6
	edge16	%o5,	%o2,	%l5
	fmovsne	%xcc,	%f20,	%f29
	stx	%l2,	[%l7 + 0x78]
	fmovdg	%xcc,	%f11,	%f29
	andncc	%i5,	%o6,	%g5
	and	%g2,	%l1,	%l0
	umul	%i6,	%o3,	%l3
	fmovrslz	%i7,	%f19,	%f27
	edge16n	%i0,	%g7,	%g6
	edge32ln	%i1,	%i3,	%g1
	udivx	%i4,	0x031D,	%o7
	udiv	%o0,	0x0003,	%g3
	ldsb	[%l7 + 0x65],	%o4
	movcc	%xcc,	%o1,	%g4
	fabss	%f26,	%f19
	edge8	%l4,	%l6,	%o5
	ld	[%l7 + 0x10],	%f11
	fmovsvs	%icc,	%f14,	%f12
	fsrc2	%f14,	%f28
	edge32l	%i2,	%l5,	%l2
	fsrc1s	%f10,	%f16
	edge16l	%o2,	%i5,	%g5
	edge32ln	%o6,	%l1,	%g2
	movrgez	%l0,	0x24F,	%i6
	fmul8sux16	%f12,	%f2,	%f2
	fmovsleu	%icc,	%f2,	%f4
	restore %o3, %i7, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f10,	[%l7 + 0x30]
	ldd	[%l7 + 0x40],	%f30
	udivcc	%g7,	0x14CD,	%i0
	movneg	%xcc,	%i1,	%g6
	xor	%g1,	0x0E93,	%i4
	fands	%f21,	%f26,	%f26
	fcmpd	%fcc1,	%f22,	%f0
	pdist	%f28,	%f14,	%f22
	edge16	%o7,	%i3,	%o0
	lduh	[%l7 + 0x10],	%g3
	and	%o4,	%o1,	%l4
	fmovrdne	%l6,	%f6,	%f26
	sdivx	%o5,	0x0955,	%i2
	edge8	%g4,	%l2,	%o2
	xorcc	%l5,	%g5,	%i5
	xorcc	%o6,	0x196E,	%g2
	xorcc	%l1,	%l0,	%i6
	fexpand	%f16,	%f24
	stx	%o3,	[%l7 + 0x70]
	st	%f9,	[%l7 + 0x68]
	stw	%i7,	[%l7 + 0x74]
	umul	%l3,	%i0,	%g7
	xorcc	%g6,	%i1,	%i4
	fmovrse	%o7,	%f8,	%f25
	subc	%i3,	0x1827,	%o0
	edge32ln	%g1,	%g3,	%o4
	smulcc	%o1,	0x074C,	%l4
	array32	%l6,	%o5,	%g4
	xor	%l2,	%i2,	%l5
	ldd	[%l7 + 0x58],	%f12
	fmovsl	%icc,	%f11,	%f20
	std	%f16,	[%l7 + 0x40]
	subcc	%g5,	0x1AB0,	%o2
	nop
	set	0x78, %i1
	ldsh	[%l7 + %i1],	%i5
	movleu	%xcc,	%g2,	%o6
	sdiv	%l1,	0x0918,	%l0
	sdiv	%i6,	0x11F7,	%o3
	sdivx	%l3,	0x056D,	%i7
	fmovrdne	%i0,	%f28,	%f4
	bshuffle	%f28,	%f18,	%f8
	array32	%g7,	%g6,	%i4
	nop
	set	0x10, %g3
	ldsw	[%l7 + %g3],	%i1
	mulscc	%i3,	%o0,	%g1
	xnorcc	%g3,	%o7,	%o1
	edge8l	%o4,	%l6,	%l4
	stw	%o5,	[%l7 + 0x78]
	fcmpd	%fcc1,	%f0,	%f12
	move	%icc,	%g4,	%l2
	fmovsgu	%icc,	%f16,	%f25
	sethi	0x0D49,	%l5
	sllx	%g5,	0x15,	%o2
	ldub	[%l7 + 0x43],	%i5
	ldsb	[%l7 + 0x72],	%i2
	fmovsl	%icc,	%f14,	%f4
	fmovsne	%xcc,	%f6,	%f15
	and	%g2,	%l1,	%l0
	movpos	%xcc,	%o6,	%o3
	sethi	0x0DCE,	%l3
	andcc	%i7,	0x1C56,	%i0
	ldub	[%l7 + 0x47],	%i6
	movre	%g6,	0x2FF,	%g7
	add	%i4,	%i1,	%o0
	sdivx	%g1,	0x183F,	%g3
	sdivx	%i3,	0x0054,	%o1
	addcc	%o4,	%l6,	%l4
	movvs	%xcc,	%o5,	%g4
	fmovdge	%xcc,	%f10,	%f13
	movle	%xcc,	%o7,	%l5
	fmul8x16au	%f19,	%f17,	%f8
	movgu	%icc,	%g5,	%l2
	xor	%i5,	0x0AF1,	%i2
	umul	%g2,	0x0A23,	%o2
	edge32	%l0,	%l1,	%o6
	mulx	%o3,	%i7,	%i0
	fnand	%f10,	%f18,	%f30
	addcc	%i6,	%l3,	%g6
	xor	%g7,	%i1,	%o0
	array16	%g1,	%i4,	%i3
	umulcc	%g3,	%o4,	%o1
	sethi	0x067B,	%l4
	addccc	%o5,	0x072D,	%l6
	sth	%g4,	[%l7 + 0x5C]
	mova	%icc,	%o7,	%l5
	movrlz	%g5,	0x0D3,	%l2
	fmovdn	%icc,	%f28,	%f14
	st	%f25,	[%l7 + 0x50]
	mulscc	%i5,	0x0487,	%i2
	movrlez	%g2,	%l0,	%l1
	movrne	%o2,	0x007,	%o6
	sdivx	%i7,	0x008F,	%o3
	mulscc	%i0,	%i6,	%l3
	fornot1	%f8,	%f12,	%f18
	movl	%icc,	%g7,	%g6
	xnorcc	%i1,	%o0,	%i4
	sdiv	%g1,	0x0D3D,	%g3
	sra	%o4,	%i3,	%o1
	orn	%l4,	%l6,	%g4
	ldd	[%l7 + 0x40],	%f30
	edge16	%o7,	%o5,	%g5
	addc	%l2,	%l5,	%i5
	fmovdge	%xcc,	%f8,	%f9
	edge32	%i2,	%l0,	%g2
	fpadd32	%f12,	%f18,	%f16
	fmovdleu	%xcc,	%f27,	%f5
	mulscc	%l1,	0x0FF1,	%o2
	and	%i7,	%o3,	%o6
	alignaddr	%i0,	%l3,	%g7
	fsrc1	%f30,	%f18
	movg	%xcc,	%g6,	%i1
	fcmps	%fcc3,	%f10,	%f25
	array32	%o0,	%i4,	%i6
	movgu	%icc,	%g3,	%g1
	edge16l	%o4,	%i3,	%o1
	fmovda	%icc,	%f21,	%f1
	edge32l	%l4,	%g4,	%o7
	movn	%xcc,	%o5,	%g5
	pdist	%f26,	%f16,	%f8
	fnand	%f20,	%f8,	%f30
	array8	%l2,	%l5,	%l6
	movrlz	%i2,	0x34E,	%l0
	ldsh	[%l7 + 0x6E],	%i5
	st	%f3,	[%l7 + 0x1C]
	mulscc	%g2,	0x0A97,	%l1
	smul	%o2,	0x1714,	%o3
	addc	%i7,	%o6,	%i0
	movvs	%icc,	%l3,	%g6
	movg	%icc,	%g7,	%i1
	ldd	[%l7 + 0x40],	%f6
	edge8n	%o0,	%i6,	%i4
	andn	%g3,	%g1,	%i3
	add	%o1,	0x1CBA,	%o4
	fmovdcs	%xcc,	%f29,	%f15
	movvs	%icc,	%l4,	%g4
	ldd	[%l7 + 0x78],	%f24
	std	%f0,	[%l7 + 0x28]
	and	%o5,	%g5,	%o7
	save %l2, 0x157E, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i2,	%l0,	%l5
	sdiv	%i5,	0x0E6D,	%l1
	movre	%g2,	0x1B1,	%o2
	alignaddrl	%o3,	%o6,	%i7
	stb	%i0,	[%l7 + 0x3B]
	fmovda	%icc,	%f23,	%f27
	edge8	%l3,	%g6,	%g7
	movcc	%xcc,	%o0,	%i6
	edge16l	%i4,	%g3,	%i1
	st	%f26,	[%l7 + 0x58]
	alignaddr	%i3,	%g1,	%o1
	orn	%o4,	%l4,	%g4
	sra	%g5,	%o5,	%l2
	movrne	%l6,	%i2,	%l0
	addc	%l5,	%o7,	%l1
	fcmpgt32	%f22,	%f26,	%g2
	edge8	%o2,	%i5,	%o3
	array16	%o6,	%i7,	%l3
	fabsd	%f14,	%f30
	fmovsne	%xcc,	%f28,	%f16
	sethi	0x081A,	%i0
	fnot2s	%f25,	%f26
	fmovsg	%icc,	%f13,	%f3
	lduh	[%l7 + 0x14],	%g6
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%f20
	fmovsa	%icc,	%f11,	%f22
	edge8	%g7,	%i6,	%o0
	movge	%xcc,	%i4,	%g3
	movge	%icc,	%i3,	%i1
	movrne	%o1,	0x23B,	%o4
	sdiv	%g1,	0x16AE,	%l4
	xor	%g4,	%o5,	%l2
	movrne	%g5,	0x0E6,	%l6
	xor	%l0,	%i2,	%l5
	movre	%o7,	%l1,	%o2
	nop
	set	0x24, %o3
	sth	%i5,	[%l7 + %o3]
	fxnors	%f6,	%f29,	%f24
	umul	%o3,	%g2,	%i7
	alignaddr	%l3,	%i0,	%g6
	fmovspos	%xcc,	%f29,	%f14
	movcs	%icc,	%o6,	%i6
	save %o0, 0x0937, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g3,	%i4,	%i3
	fmovda	%xcc,	%f18,	%f13
	fmovdcc	%icc,	%f31,	%f2
	ldd	[%l7 + 0x08],	%o0
	fmovrslz	%i1,	%f27,	%f24
	sethi	0x0C8D,	%g1
	fmovdvc	%xcc,	%f19,	%f0
	xnor	%l4,	0x1C1A,	%g4
	st	%f16,	[%l7 + 0x14]
	sir	0x1C15
	subccc	%o5,	0x03BA,	%l2
	mulscc	%g5,	0x0170,	%o4
	movneg	%icc,	%l6,	%i2
	stb	%l5,	[%l7 + 0x66]
	orn	%l0,	%o7,	%o2
	movl	%xcc,	%l1,	%o3
	umulcc	%i5,	0x1745,	%g2
	smulcc	%i7,	%l3,	%i0
	sub	%o6,	%i6,	%g6
	fone	%f0
	sub	%g7,	0x16CA,	%o0
	move	%icc,	%g3,	%i3
	ldd	[%l7 + 0x58],	%f24
	subccc	%o1,	%i4,	%i1
	movrlz	%g1,	0x207,	%l4
	alignaddrl	%o5,	%l2,	%g4
	edge32	%g5,	%l6,	%o4
	fornot1s	%f10,	%f26,	%f17
	andcc	%i2,	%l0,	%l5
	stx	%o2,	[%l7 + 0x50]
	edge8ln	%l1,	%o7,	%o3
	sir	0x0FD6
	save %g2, %i7, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i0,	0x077,	%o6
	xorcc	%i6,	0x1DBF,	%g6
	ldsh	[%l7 + 0x12],	%i5
	movvs	%icc,	%o0,	%g7
	movvs	%icc,	%i3,	%g3
	movrlz	%i4,	0x2EB,	%o1
	srlx	%i1,	%l4,	%o5
	movleu	%xcc,	%g1,	%g4
	sllx	%l2,	%g5,	%o4
	ld	[%l7 + 0x4C],	%f2
	stx	%i2,	[%l7 + 0x60]
	edge8ln	%l0,	%l5,	%l6
	and	%o2,	%o7,	%o3
	fandnot2	%f30,	%f14,	%f4
	stw	%g2,	[%l7 + 0x28]
	ldsb	[%l7 + 0x5B],	%i7
	nop
	set	0x7C, %o0
	ldsw	[%l7 + %o0],	%l3
	fmovscs	%icc,	%f17,	%f16
	sllx	%l1,	%o6,	%i6
	st	%f30,	[%l7 + 0x08]
	add	%i0,	%g6,	%i5
	sll	%o0,	0x0A,	%i3
	fmovrse	%g7,	%f9,	%f15
	ldub	[%l7 + 0x74],	%i4
	edge32	%o1,	%i1,	%g3
	umulcc	%o5,	%g1,	%g4
	movleu	%xcc,	%l4,	%g5
	movvs	%icc,	%l2,	%o4
	sth	%l0,	[%l7 + 0x54]
	andn	%i2,	0x1E3C,	%l6
	movvs	%xcc,	%l5,	%o2
	movrgz	%o3,	%g2,	%i7
	srl	%l3,	0x01,	%o7
	subcc	%o6,	%i6,	%i0
	movpos	%xcc,	%l1,	%i5
	edge32n	%g6,	%i3,	%o0
	edge8n	%i4,	%g7,	%o1
	udivx	%i1,	0x0014,	%g3
	sdiv	%o5,	0x1C98,	%g1
	movge	%icc,	%l4,	%g5
	udivcc	%l2,	0x1F62,	%o4
	alignaddrl	%g4,	%i2,	%l0
	movvs	%xcc,	%l6,	%l5
	edge8ln	%o2,	%g2,	%o3
	xor	%l3,	%o7,	%o6
	fxnors	%f16,	%f21,	%f21
	stx	%i7,	[%l7 + 0x08]
	addc	%i0,	0x0AB8,	%l1
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	edge32ln	%i6,	%o0,	%i4
	alignaddr	%g7,	%i1,	%g3
	srl	%o1,	%g1,	%l4
	edge32	%o5,	%g5,	%o4
	mulscc	%l2,	%g4,	%i2
	fcmpeq16	%f14,	%f14,	%l6
	sll	%l5,	%l0,	%o2
	umul	%g2,	%o3,	%l3
	movvc	%icc,	%o6,	%i7
	stw	%o7,	[%l7 + 0x3C]
	fmovrslz	%i0,	%f29,	%f29
	nop
	set	0x54, %i6
	lduw	[%l7 + %i6],	%i5
	array16	%l1,	%i3,	%i6
	subcc	%o0,	%i4,	%g7
	st	%f9,	[%l7 + 0x0C]
	sethi	0x1FF7,	%i1
	sir	0x1B1C
	movcc	%icc,	%g3,	%o1
	ldd	[%l7 + 0x48],	%f26
	fnegs	%f24,	%f6
	edge8l	%g1,	%g6,	%o5
	array16	%l4,	%o4,	%g5
	edge32n	%g4,	%l2,	%i2
	fmovrslz	%l6,	%f26,	%f2
	sllx	%l5,	0x1C,	%o2
	nop
	set	0x50, %l1
	stx	%l0,	[%l7 + %l1]
	fpsub32	%f8,	%f22,	%f20
	ldx	[%l7 + 0x50],	%g2
	smulcc	%l3,	0x0E57,	%o3
	ldsb	[%l7 + 0x6D],	%i7
	ldub	[%l7 + 0x72],	%o6
	smul	%o7,	%i0,	%i5
	srax	%l1,	%i6,	%i3
	movrlez	%o0,	0x3D9,	%i4
	sll	%g7,	%i1,	%g3
	movn	%xcc,	%o1,	%g6
	fcmpeq16	%f4,	%f8,	%o5
	ldub	[%l7 + 0x3B],	%l4
	udivcc	%g1,	0x1CE1,	%o4
	edge8ln	%g4,	%g5,	%i2
	fpadd16s	%f24,	%f16,	%f2
	movre	%l2,	%l6,	%o2
	edge8l	%l5,	%l0,	%l3
	edge8n	%g2,	%i7,	%o6
	fexpand	%f13,	%f22
	fone	%f18
	movrgz	%o7,	%i0,	%o3
	smulcc	%l1,	%i5,	%i3
	umulcc	%i6,	%i4,	%g7
	movpos	%xcc,	%o0,	%g3
	xnor	%i1,	%o1,	%o5
	smulcc	%l4,	%g1,	%g6
	umulcc	%g4,	0x0A5E,	%o4
	ldd	[%l7 + 0x18],	%f12
	xor	%i2,	0x16DC,	%g5
	edge32l	%l2,	%l6,	%o2
	sdiv	%l5,	0x0D55,	%l3
	movne	%xcc,	%l0,	%i7
	movcs	%icc,	%g2,	%o7
	edge8l	%i0,	%o6,	%o3
	addcc	%l1,	%i3,	%i5
	movrne	%i6,	0x24A,	%g7
	sth	%o0,	[%l7 + 0x6C]
	std	%f14,	[%l7 + 0x78]
	sdivcc	%g3,	0x0C37,	%i1
	alignaddr	%o1,	%o5,	%l4
	movrgez	%i4,	0x32A,	%g1
	fmul8x16	%f21,	%f20,	%f20
	movneg	%icc,	%g6,	%g4
	fxnor	%f2,	%f24,	%f16
	ldub	[%l7 + 0x42],	%i2
	fexpand	%f0,	%f30
	subccc	%g5,	%o4,	%l2
	move	%icc,	%o2,	%l6
	fone	%f8
	subccc	%l3,	%l0,	%i7
	movl	%xcc,	%g2,	%o7
	orn	%i0,	%l5,	%o6
	xnorcc	%o3,	0x06AD,	%i3
	fmovda	%xcc,	%f9,	%f28
	udiv	%l1,	0x0814,	%i5
	sllx	%g7,	%i6,	%o0
	ldd	[%l7 + 0x18],	%i0
	smulcc	%o1,	%o5,	%g3
	fmovsvc	%icc,	%f10,	%f2
	array8	%i4,	%g1,	%g6
	movne	%icc,	%l4,	%i2
	alignaddrl	%g5,	%g4,	%l2
	std	%f6,	[%l7 + 0x18]
	subcc	%o2,	%l6,	%o4
	umul	%l3,	%i7,	%l0
	edge16l	%g2,	%o7,	%l5
	ldd	[%l7 + 0x08],	%f6
	fnot2s	%f12,	%f2
	ldd	[%l7 + 0x40],	%o6
	subc	%i0,	%o3,	%l1
	st	%f11,	[%l7 + 0x3C]
	movpos	%xcc,	%i5,	%i3
	fornot2	%f26,	%f18,	%f24
	fmovsge	%icc,	%f2,	%f1
	ldub	[%l7 + 0x11],	%g7
	fmul8x16	%f2,	%f16,	%f10
	srlx	%i6,	0x07,	%i1
	subcc	%o1,	0x05CC,	%o5
	edge8ln	%o0,	%i4,	%g1
	andcc	%g6,	0x1101,	%g3
	xnorcc	%l4,	%i2,	%g5
	movvc	%icc,	%g4,	%l2
	addcc	%l6,	%o2,	%o4
	movne	%xcc,	%i7,	%l3
	save %g2, 0x15A4, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x5C],	%o7
	fabss	%f0,	%f12
	fmovdleu	%xcc,	%f6,	%f10
	fmovrsgz	%l5,	%f16,	%f20
	fmovdvc	%xcc,	%f14,	%f28
	fmovsleu	%icc,	%f10,	%f10
	edge8	%i0,	%o6,	%o3
	or	%l1,	%i5,	%g7
	xnor	%i6,	0x07A3,	%i1
	mulx	%i3,	0x187C,	%o5
	sethi	0x0209,	%o0
	fsrc1	%f2,	%f30
	fmovdvc	%xcc,	%f7,	%f28
	orcc	%o1,	0x01B1,	%g1
	stb	%i4,	[%l7 + 0x61]
	movre	%g6,	0x27D,	%g3
	movrgez	%i2,	%g5,	%g4
	ldd	[%l7 + 0x28],	%l2
	ldd	[%l7 + 0x78],	%f24
	add	%l4,	0x1401,	%l6
	fmovdle	%xcc,	%f28,	%f31
	restore %o4, %o2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%i7,	%g2
	movre	%o7,	%l0,	%l5
	sra	%o6,	0x03,	%o3
	ldsw	[%l7 + 0x70],	%l1
	pdist	%f8,	%f12,	%f12
	sdivx	%i5,	0x12FC,	%i0
	stx	%g7,	[%l7 + 0x58]
	ld	[%l7 + 0x14],	%f21
	and	%i6,	%i3,	%o5
	movg	%xcc,	%o0,	%i1
	st	%f10,	[%l7 + 0x58]
	fmovsvc	%icc,	%f12,	%f23
	movrne	%g1,	0x337,	%o1
	sdiv	%i4,	0x1470,	%g6
	movrlz	%g3,	0x0BB,	%g5
	ldub	[%l7 + 0x4C],	%g4
	array16	%l2,	%i2,	%l4
	orcc	%o4,	0x0B22,	%l6
	movvs	%icc,	%o2,	%i7
	alignaddrl	%g2,	%o7,	%l0
	udivcc	%l3,	0x0023,	%o6
	alignaddr	%l5,	%l1,	%i5
	sub	%i0,	%g7,	%o3
	lduw	[%l7 + 0x4C],	%i3
	fnot2s	%f29,	%f2
	alignaddrl	%i6,	%o0,	%i1
	sll	%g1,	0x1E,	%o1
	edge32n	%o5,	%i4,	%g6
	fmovdne	%icc,	%f0,	%f7
	sth	%g3,	[%l7 + 0x44]
	movvs	%icc,	%g5,	%g4
	fzero	%f24
	srax	%l2,	0x00,	%i2
	fmovsge	%xcc,	%f26,	%f19
	movrlez	%o4,	%l4,	%o2
	andncc	%l6,	%g2,	%i7
	edge8ln	%o7,	%l3,	%o6
	ld	[%l7 + 0x44],	%f13
	and	%l5,	0x1C7F,	%l0
	fmovdneg	%icc,	%f30,	%f4
	edge32ln	%i5,	%i0,	%g7
	fmovsa	%xcc,	%f6,	%f3
	udivx	%l1,	0x1E48,	%o3
	ldsb	[%l7 + 0x14],	%i3
	fcmped	%fcc3,	%f4,	%f28
	fones	%f22
	array16	%i6,	%o0,	%i1
	movgu	%xcc,	%g1,	%o5
	popc	%o1,	%g6
	addcc	%i4,	%g3,	%g5
	edge32	%l2,	%i2,	%o4
	fcmpne32	%f20,	%f12,	%l4
	edge8l	%g4,	%o2,	%l6
	popc	0x1E52,	%i7
	udiv	%g2,	0x1176,	%o7
	movvc	%xcc,	%l3,	%o6
	array16	%l0,	%l5,	%i0
	alignaddrl	%g7,	%i5,	%o3
	subccc	%i3,	%i6,	%o0
	sdivcc	%i1,	0x10CC,	%l1
	xorcc	%g1,	0x19B2,	%o5
	sdivcc	%o1,	0x0F80,	%g6
	sethi	0x03F9,	%g3
	movl	%icc,	%i4,	%l2
	fpadd16	%f2,	%f22,	%f24
	sll	%g5,	0x03,	%i2
	mova	%xcc,	%l4,	%o4
	fpack32	%f16,	%f20,	%f0
	sll	%o2,	0x08,	%g4
	movvs	%xcc,	%l6,	%g2
	mulscc	%o7,	0x1341,	%l3
	alignaddr	%o6,	%l0,	%i7
	ldsb	[%l7 + 0x35],	%i0
	andncc	%g7,	%l5,	%o3
	fpack32	%f4,	%f22,	%f2
	fors	%f27,	%f10,	%f14
	movvs	%icc,	%i5,	%i6
	sll	%o0,	%i3,	%l1
	and	%g1,	0x14B7,	%o5
	movcs	%xcc,	%o1,	%g6
	ldx	[%l7 + 0x30],	%g3
	edge16l	%i1,	%l2,	%g5
	or	%i2,	0x1C59,	%i4
	fnor	%f4,	%f18,	%f28
	movre	%o4,	0x34A,	%o2
	edge8ln	%l4,	%l6,	%g2
	edge32l	%o7,	%l3,	%o6
	sdivcc	%l0,	0x0476,	%i7
	umul	%g4,	0x174F,	%g7
	fzeros	%f9
	movgu	%xcc,	%l5,	%i0
	movrgz	%i5,	%i6,	%o0
	movle	%icc,	%i3,	%o3
	array16	%l1,	%g1,	%o5
	xnor	%o1,	%g6,	%i1
	andncc	%l2,	%g5,	%i2
	fmovsne	%xcc,	%f29,	%f19
	smulcc	%i4,	%o4,	%g3
	edge16	%o2,	%l6,	%l4
	std	%f16,	[%l7 + 0x58]
	andncc	%o7,	%l3,	%g2
	stw	%o6,	[%l7 + 0x58]
	andn	%i7,	0x123F,	%l0
	edge32ln	%g7,	%l5,	%i0
	edge16ln	%g4,	%i6,	%o0
	smul	%i3,	%o3,	%l1
	movrlz	%g1,	%i5,	%o1
	srlx	%g6,	0x04,	%i1
	fmovsvs	%icc,	%f18,	%f13
	fmovrdgez	%o5,	%f8,	%f26
	movrlz	%l2,	%g5,	%i2
	mulscc	%o4,	%i4,	%g3
	sir	0x1332
	mulx	%l6,	0x0657,	%l4
	fmul8x16au	%f9,	%f29,	%f12
	movvc	%icc,	%o7,	%o2
	fnors	%f19,	%f8,	%f17
	sra	%l3,	0x1D,	%o6
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	ld	[%l7 + 0x60],	%f1
	nop
	set	0x2A, %i3
	ldsb	[%l7 + %i3],	%g7
	fnors	%f9,	%f10,	%f4
	sdivcc	%l5,	0x11DE,	%i0
	fmovsa	%icc,	%f26,	%f6
	fandnot2	%f20,	%f14,	%f16
	edge16ln	%g4,	%l0,	%i6
	mova	%icc,	%o0,	%i3
	ldd	[%l7 + 0x40],	%l0
	edge16n	%o3,	%g1,	%i5
	sra	%g6,	%o1,	%o5
	edge16	%l2,	%i1,	%g5
	ldd	[%l7 + 0x20],	%i2
	alignaddr	%i4,	%g3,	%l6
	orncc	%o4,	%o7,	%o2
	srl	%l4,	0x04,	%l3
	edge32	%g2,	%o6,	%i7
	movvs	%xcc,	%g7,	%l5
	edge16n	%i0,	%g4,	%l0
	edge32l	%o0,	%i3,	%l1
	udivcc	%i6,	0x1BFA,	%o3
	movrlez	%g1,	%i5,	%g6
	std	%f6,	[%l7 + 0x78]
	fmovdl	%icc,	%f31,	%f29
	fmovdn	%xcc,	%f18,	%f25
	smul	%o1,	%l2,	%o5
	addcc	%g5,	%i2,	%i1
	edge8l	%i4,	%l6,	%o4
	fnands	%f3,	%f13,	%f10
	fmovs	%f13,	%f30
	edge8l	%g3,	%o7,	%l4
	fpadd16s	%f19,	%f22,	%f3
	fcmpes	%fcc2,	%f13,	%f17
	sir	0x17A1
	alignaddrl	%o2,	%g2,	%o6
	edge16ln	%i7,	%g7,	%l5
	orncc	%i0,	0x0BDC,	%g4
	sllx	%l0,	%l3,	%i3
	fmovsl	%icc,	%f31,	%f10
	or	%o0,	%i6,	%l1
	fmovrsne	%o3,	%f14,	%f15
	udivcc	%i5,	0x172D,	%g1
	movge	%icc,	%g6,	%o1
	movn	%icc,	%o5,	%g5
	edge8	%l2,	%i1,	%i4
	movg	%xcc,	%i2,	%l6
	udivcc	%o4,	0x144D,	%g3
	umul	%o7,	%l4,	%g2
	fmovscs	%icc,	%f22,	%f31
	stx	%o6,	[%l7 + 0x30]
	movvs	%xcc,	%i7,	%o2
	fnand	%f6,	%f30,	%f14
	fnot1	%f4,	%f22
	udivcc	%g7,	0x1875,	%l5
	move	%icc,	%g4,	%i0
	fone	%f18
	movre	%l3,	%l0,	%o0
	xor	%i3,	%l1,	%i6
	movrgez	%o3,	0x011,	%i5
	udivx	%g6,	0x1C65,	%o1
	ldx	[%l7 + 0x30],	%g1
	movg	%icc,	%g5,	%l2
	fpmerge	%f23,	%f20,	%f22
	sdiv	%o5,	0x18DB,	%i4
	smul	%i1,	0x0ECD,	%i2
	nop
	set	0x24, %i7
	stw	%o4,	[%l7 + %i7]
	fsrc2	%f24,	%f16
	edge32l	%l6,	%g3,	%l4
	array32	%g2,	%o7,	%i7
	stw	%o2,	[%l7 + 0x64]
	orncc	%g7,	%o6,	%l5
	udivcc	%g4,	0x1FEB,	%i0
	sir	0x0496
	udiv	%l3,	0x0EE2,	%o0
	movvc	%xcc,	%i3,	%l0
	movvc	%icc,	%l1,	%i6
	sdivcc	%i5,	0x08E8,	%o3
	umulcc	%o1,	%g6,	%g5
	sll	%l2,	0x1E,	%o5
	orncc	%g1,	0x08CB,	%i1
	ldd	[%l7 + 0x18],	%i4
	fabsd	%f30,	%f0
	movvs	%xcc,	%o4,	%l6
	fmovscc	%xcc,	%f22,	%f3
	fnegs	%f9,	%f31
	orncc	%i2,	%l4,	%g3
	stw	%g2,	[%l7 + 0x14]
	xnor	%o7,	%o2,	%g7
	fandnot2	%f8,	%f10,	%f14
	popc	%i7,	%o6
	fabsd	%f28,	%f24
	fmuld8ulx16	%f26,	%f4,	%f10
	udivx	%g4,	0x01DD,	%i0
	array8	%l3,	%l5,	%o0
	std	%f8,	[%l7 + 0x68]
	movvc	%icc,	%i3,	%l1
	udiv	%i6,	0x0A15,	%i5
	movrlez	%l0,	0x055,	%o1
	array32	%o3,	%g5,	%g6
	srl	%l2,	%g1,	%o5
	movle	%xcc,	%i1,	%o4
	andncc	%i4,	%i2,	%l6
	fandnot2s	%f12,	%f16,	%f29
	stx	%l4,	[%l7 + 0x70]
	srlx	%g2,	%g3,	%o2
	array8	%o7,	%g7,	%i7
	umulcc	%g4,	%o6,	%l3
	movn	%xcc,	%l5,	%i0
	smul	%o0,	%i3,	%i6
	movrne	%i5,	0x12F,	%l1
	st	%f5,	[%l7 + 0x7C]
	fnot1s	%f26,	%f8
	array32	%o1,	%l0,	%g5
	ldsw	[%l7 + 0x3C],	%o3
	movvc	%xcc,	%g6,	%l2
	ld	[%l7 + 0x18],	%f17
	fmovsge	%icc,	%f14,	%f1
	fnot2	%f18,	%f28
	addccc	%g1,	0x09C9,	%o5
	fpadd16s	%f11,	%f8,	%f30
	ld	[%l7 + 0x40],	%f17
	umulcc	%o4,	0x0E61,	%i4
	fzeros	%f23
	fmovscc	%xcc,	%f7,	%f0
	udivx	%i1,	0x0092,	%i2
	fpmerge	%f19,	%f23,	%f14
	st	%f27,	[%l7 + 0x3C]
	fcmpgt16	%f6,	%f4,	%l6
	stb	%g2,	[%l7 + 0x23]
	udiv	%g3,	0x02B3,	%o2
	for	%f14,	%f10,	%f12
	movrlz	%l4,	0x089,	%g7
	edge32l	%o7,	%g4,	%i7
	edge32	%l3,	%l5,	%o6
	edge8	%i0,	%i3,	%o0
	fornot1s	%f18,	%f29,	%f18
	fmovdvc	%xcc,	%f9,	%f31
	edge16ln	%i5,	%l1,	%i6
	sethi	0x0E67,	%l0
	fmovdneg	%icc,	%f30,	%f6
	array8	%g5,	%o3,	%g6
	movrgez	%l2,	0x1F2,	%o1
	movrgez	%g1,	%o4,	%i4
	fmul8x16	%f29,	%f24,	%f24
	movl	%icc,	%i1,	%i2
	fmovsa	%xcc,	%f1,	%f11
	fnegs	%f7,	%f2
	fmovdn	%xcc,	%f17,	%f4
	movrlez	%l6,	%o5,	%g2
	ldx	[%l7 + 0x58],	%o2
	edge16ln	%l4,	%g3,	%o7
	ldx	[%l7 + 0x50],	%g4
	fabss	%f20,	%f16
	umulcc	%i7,	%g7,	%l3
	movle	%xcc,	%l5,	%i0
	xorcc	%i3,	0x14A4,	%o0
	movrlez	%o6,	%l1,	%i5
	movn	%icc,	%l0,	%i6
	fandnot1s	%f22,	%f24,	%f28
	sdivx	%o3,	0x040A,	%g6
	alignaddrl	%l2,	%o1,	%g5
	fornot1	%f26,	%f18,	%f2
	edge16ln	%o4,	%g1,	%i1
	ldd	[%l7 + 0x70],	%f22
	fmuld8sux16	%f14,	%f26,	%f2
	movcc	%xcc,	%i2,	%l6
	fmovde	%xcc,	%f19,	%f24
	xor	%o5,	%g2,	%i4
	xnor	%o2,	0x13ED,	%l4
	subcc	%o7,	%g4,	%i7
	array8	%g3,	%l3,	%g7
	fmovdcs	%icc,	%f25,	%f30
	fmovrdlz	%l5,	%f26,	%f28
	sllx	%i0,	%o0,	%i3
	edge32	%o6,	%l1,	%i5
	andncc	%l0,	%o3,	%g6
	sth	%i6,	[%l7 + 0x4E]
	sir	0x0087
	fmovsvs	%xcc,	%f2,	%f29
	movl	%icc,	%l2,	%o1
	pdist	%f30,	%f10,	%f30
	save %o4, 0x1508, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i1,	%i2,	%g5
	array32	%l6,	%g2,	%i4
	edge8l	%o5,	%o2,	%l4
	sra	%g4,	%i7,	%g3
	fand	%f30,	%f16,	%f30
	srax	%l3,	0x0B,	%o7
	sethi	0x061F,	%l5
	add	%i0,	%g7,	%i3
	alignaddr	%o0,	%l1,	%o6
	xnorcc	%l0,	%o3,	%i5
	fsrc2s	%f6,	%f14
	movrlz	%i6,	0x01C,	%g6
	movcs	%xcc,	%o1,	%l2
	sethi	0x1DC6,	%o4
	fnands	%f2,	%f22,	%f10
	ldub	[%l7 + 0x78],	%i1
	stb	%i2,	[%l7 + 0x30]
	fmovs	%f14,	%f27
	movrgez	%g1,	0x3CE,	%g5
	xnor	%l6,	0x0E37,	%g2
	sdivcc	%o5,	0x184E,	%i4
	siam	0x1
	movcc	%xcc,	%l4,	%g4
	xnor	%i7,	0x1ED0,	%o2
	smul	%g3,	0x0CD2,	%l3
	fands	%f10,	%f4,	%f28
	edge8	%o7,	%i0,	%g7
	sethi	0x1CBA,	%i3
	edge16ln	%l5,	%l1,	%o6
	addcc	%o0,	0x17C1,	%o3
	fxnors	%f10,	%f11,	%f4
	fpadd16	%f16,	%f28,	%f12
	xnorcc	%l0,	0x12A9,	%i6
	addccc	%g6,	%o1,	%i5
	ldx	[%l7 + 0x50],	%l2
	fmovde	%xcc,	%f23,	%f25
	movrgz	%o4,	0x271,	%i2
	edge16	%g1,	%g5,	%i1
	fmovdg	%xcc,	%f3,	%f4
	popc	%g2,	%o5
	sdivx	%i4,	0x16BB,	%l4
	ld	[%l7 + 0x50],	%f3
	fmovde	%icc,	%f21,	%f27
	st	%f4,	[%l7 + 0x0C]
	addcc	%l6,	%g4,	%i7
	fornot1s	%f21,	%f4,	%f18
	fmovsn	%icc,	%f17,	%f31
	movrlz	%o2,	%g3,	%l3
	movn	%icc,	%o7,	%g7
	udivcc	%i3,	0x1E77,	%l5
	smul	%l1,	0x11D2,	%o6
	addc	%i0,	%o0,	%o3
	udivx	%i6,	0x023E,	%g6
	ldd	[%l7 + 0x18],	%f6
	mulscc	%l0,	%o1,	%l2
	andn	%i5,	%i2,	%g1
	stx	%g5,	[%l7 + 0x10]
	edge32l	%i1,	%o4,	%o5
	movcs	%icc,	%g2,	%l4
	edge32	%i4,	%g4,	%i7
	srlx	%l6,	%g3,	%o2
	ld	[%l7 + 0x48],	%f7
	umulcc	%l3,	%g7,	%i3
	edge32n	%o7,	%l1,	%o6
	orcc	%l5,	0x1C6F,	%i0
	ld	[%l7 + 0x40],	%f25
	umulcc	%o3,	0x193C,	%i6
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%g6
	ldsb	[%l7 + 0x76],	%l0
	edge8l	%o0,	%o1,	%l2
	for	%f30,	%f18,	%f30
	movleu	%icc,	%i5,	%i2
	fmovrdne	%g5,	%f8,	%f18
	edge16l	%g1,	%o4,	%o5
	movle	%xcc,	%g2,	%l4
	movge	%xcc,	%i4,	%i1
	sll	%g4,	%i7,	%g3
	ldd	[%l7 + 0x58],	%i6
	sdivcc	%l3,	0x02A2,	%g7
	st	%f12,	[%l7 + 0x5C]
	lduh	[%l7 + 0x2A],	%o2
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%f28
	srlx	%i3,	0x01,	%l1
	fmovsne	%xcc,	%f26,	%f31
	fmovspos	%icc,	%f1,	%f19
	fnand	%f2,	%f26,	%f4
	fandnot2	%f26,	%f2,	%f18
	fxors	%f1,	%f2,	%f7
	array8	%o6,	%l5,	%o7
	edge32ln	%i0,	%i6,	%g6
	movgu	%xcc,	%o3,	%o0
	alignaddrl	%o1,	%l2,	%l0
	srlx	%i2,	%i5,	%g1
	movpos	%icc,	%o4,	%o5
	andn	%g5,	0x0050,	%g2
	edge32n	%l4,	%i4,	%i1
	fcmpgt32	%f14,	%f4,	%g4
	ldsh	[%l7 + 0x18],	%i7
	sra	%g3,	%l3,	%l6
	edge32	%g7,	%i3,	%l1
	popc	%o2,	%o6
	udivx	%o7,	0x115B,	%i0
	edge16n	%l5,	%g6,	%o3
	movrlz	%i6,	0x276,	%o1
	fzero	%f28
	andcc	%l2,	%o0,	%i2
	fmovrse	%l0,	%f23,	%f0
	movrgez	%g1,	%i5,	%o5
	movg	%xcc,	%g5,	%o4
	mova	%icc,	%g2,	%l4
	fpadd32s	%f7,	%f22,	%f18
	xnorcc	%i4,	0x16EB,	%i1
	ld	[%l7 + 0x1C],	%f22
	ldsb	[%l7 + 0x31],	%g4
	ldd	[%l7 + 0x08],	%i6
	fsrc1s	%f3,	%f1
	fmovscc	%xcc,	%f7,	%f13
	restore %g3, %l3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f6,	%f3,	%f21
	stw	%i3,	[%l7 + 0x0C]
	movvs	%icc,	%l1,	%o2
	fcmpgt32	%f8,	%f26,	%g7
	orcc	%o7,	%o6,	%l5
	edge8	%i0,	%g6,	%o3
	mova	%icc,	%o1,	%l2
	movneg	%xcc,	%o0,	%i2
	array8	%i6,	%l0,	%i5
	lduw	[%l7 + 0x5C],	%o5
	fcmped	%fcc2,	%f26,	%f18
	movvs	%icc,	%g5,	%o4
	fmuld8ulx16	%f15,	%f12,	%f12
	mulx	%g1,	0x0E13,	%l4
	edge32l	%i4,	%i1,	%g4
	subc	%i7,	0x0B1B,	%g2
	sdiv	%g3,	0x01D9,	%l3
	faligndata	%f12,	%f20,	%f10
	fone	%f14
	movle	%icc,	%i3,	%l1
	movrgz	%l6,	%o2,	%g7
	sdivcc	%o6,	0x1892,	%l5
	ld	[%l7 + 0x30],	%f2
	ld	[%l7 + 0x2C],	%f6
	edge16ln	%i0,	%g6,	%o7
	movrlez	%o1,	0x11C,	%o3
	movle	%xcc,	%o0,	%l2
	movpos	%xcc,	%i2,	%i6
	fmovrdgez	%l0,	%f4,	%f22
	edge16	%i5,	%g5,	%o5
	fcmpes	%fcc2,	%f3,	%f6
	sub	%g1,	%o4,	%i4
	addccc	%l4,	%i1,	%g4
	lduw	[%l7 + 0x4C],	%g2
	sllx	%i7,	0x16,	%l3
	fpadd16	%f28,	%f20,	%f14
	movcc	%icc,	%g3,	%i3
	fmul8x16al	%f26,	%f30,	%f12
	sethi	0x0930,	%l1
	fnot2	%f0,	%f30
	sth	%l6,	[%l7 + 0x14]
	andn	%o2,	0x091F,	%o6
	ld	[%l7 + 0x58],	%f11
	srlx	%g7,	%i0,	%g6
	addcc	%o7,	0x0001,	%l5
	umulcc	%o1,	0x00C9,	%o3
	umul	%o0,	%l2,	%i2
	sth	%i6,	[%l7 + 0x3C]
	umulcc	%l0,	%g5,	%i5
	orcc	%o5,	0x1015,	%g1
	movg	%xcc,	%o4,	%i4
	sra	%i1,	0x0A,	%l4
	ldsh	[%l7 + 0x34],	%g4
	fands	%f19,	%f14,	%f9
	edge32l	%i7,	%l3,	%g2
	edge32ln	%g3,	%l1,	%i3
	fcmpes	%fcc3,	%f21,	%f8
	sdivcc	%l6,	0x0F12,	%o6
	fxor	%f20,	%f22,	%f14
	fcmpne32	%f8,	%f2,	%g7
	save %o2, 0x039C, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%i0,	%f9,	%f10
	edge32	%l5,	%o7,	%o1
	ldsw	[%l7 + 0x68],	%o3
	fpadd16	%f6,	%f26,	%f14
	movrgez	%l2,	0x1A6,	%o0
	fmovsn	%xcc,	%f14,	%f4
	mulscc	%i2,	%i6,	%g5
	save %l0, 0x0CD7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o5,	0x0AF1,	%g1
	sllx	%o4,	0x0B,	%i1
	fpsub32	%f26,	%f26,	%f0
	array8	%l4,	%i4,	%i7
	edge32	%l3,	%g2,	%g3
	stx	%l1,	[%l7 + 0x28]
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	mova	%xcc,	%o6,	%g7
	fmovdle	%xcc,	%f15,	%f0
	movrgz	%o2,	0x28D,	%g6
	mulscc	%i3,	%l5,	%i0
	add	%o1,	0x1B3A,	%o3
	movcc	%icc,	%l2,	%o7
	edge16n	%i2,	%o0,	%g5
	movgu	%icc,	%i6,	%l0
	edge16l	%i5,	%o5,	%g1
	mulx	%i1,	0x07C1,	%l4
	restore %o4, 0x1212, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i4,	%g2,	%l3
	movrlz	%l1,	0x09E,	%g4
	lduh	[%l7 + 0x54],	%g3
	addcc	%l6,	0x0458,	%o6
	edge16	%o2,	%g7,	%g6
	fmuld8ulx16	%f0,	%f10,	%f20
	sdivx	%l5,	0x0B5D,	%i3
	subcc	%i0,	%o3,	%o1
	mova	%xcc,	%o7,	%i2
	movne	%icc,	%o0,	%l2
	nop
	set	0x76, %g4
	ldsh	[%l7 + %g4],	%i6
	fmuld8ulx16	%f21,	%f5,	%f4
	movcc	%icc,	%l0,	%g5
	and	%o5,	%i5,	%g1
	edge32ln	%i1,	%o4,	%l4
	popc	%i4,	%i7
	movpos	%icc,	%l3,	%l1
	fmovrsgez	%g4,	%f14,	%f12
	mova	%xcc,	%g3,	%l6
	fpack16	%f2,	%f17
	lduh	[%l7 + 0x4E],	%g2
	ldd	[%l7 + 0x10],	%f18
	fcmpeq32	%f22,	%f26,	%o2
	fandnot2s	%f1,	%f8,	%f11
	for	%f16,	%f18,	%f10
	fnor	%f28,	%f8,	%f10
	movle	%icc,	%o6,	%g7
	lduw	[%l7 + 0x08],	%g6
	std	%f22,	[%l7 + 0x58]
	subc	%l5,	0x08B2,	%i3
	orn	%o3,	%o1,	%i0
	orn	%o7,	0x0ABA,	%o0
	fmovsneg	%xcc,	%f5,	%f23
	lduw	[%l7 + 0x54],	%l2
	movrgz	%i2,	%i6,	%g5
	fnot2	%f18,	%f10
	fzero	%f0
	mulscc	%o5,	%l0,	%g1
	faligndata	%f16,	%f14,	%f18
	addccc	%i1,	0x1187,	%i5
	fexpand	%f26,	%f24
	mulscc	%o4,	0x139F,	%l4
	and	%i7,	0x0CA7,	%i4
	movcs	%xcc,	%l3,	%l1
	movvc	%xcc,	%g3,	%l6
	ldsw	[%l7 + 0x0C],	%g2
	ldx	[%l7 + 0x30],	%o2
	fcmple32	%f18,	%f18,	%o6
	addccc	%g4,	%g7,	%l5
	fmovsle	%xcc,	%f8,	%f13
	orn	%i3,	0x1BAA,	%g6
	fmovspos	%xcc,	%f9,	%f10
	fmovd	%f12,	%f24
	sub	%o3,	0x0D36,	%o1
	udivx	%o7,	0x0D0F,	%o0
	sdivcc	%i0,	0x0A3E,	%i2
	or	%i6,	%g5,	%l2
	edge8l	%o5,	%g1,	%i1
	edge32ln	%l0,	%o4,	%l4
	fnot1	%f10,	%f30
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	fmovrdgz	%l3,	%f16,	%f10
	restore %i5, %l1, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%g2,	%o2
	fmul8ulx16	%f22,	%f22,	%f24
	stx	%o6,	[%l7 + 0x68]
	edge8l	%g4,	%g3,	%g7
	xorcc	%l5,	0x0FF9,	%g6
	mulscc	%i3,	%o3,	%o7
	fnors	%f5,	%f19,	%f18
	fsrc2s	%f15,	%f30
	addccc	%o1,	0x1426,	%o0
	andn	%i2,	0x1F74,	%i0
	srlx	%g5,	%i6,	%o5
	srax	%g1,	%l2,	%i1
	fpsub16	%f14,	%f30,	%f0
	fmovdcc	%xcc,	%f13,	%f24
	edge8	%l0,	%l4,	%o4
	udivx	%i4,	0x01A5,	%i7
	fmovd	%f8,	%f20
	edge8ln	%i5,	%l1,	%l6
	xor	%g2,	%l3,	%o2
	st	%f10,	[%l7 + 0x74]
	array8	%g4,	%o6,	%g3
	edge16n	%g7,	%g6,	%i3
	edge32	%o3,	%l5,	%o7
	save %o1, 0x0587, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f28,	%f2,	%f8
	fmovdvc	%icc,	%f15,	%f6
	movleu	%xcc,	%i0,	%o0
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%i6
	sub	%o5,	0x106F,	%g1
	orcc	%l2,	%i1,	%l0
	movrgez	%l4,	0x116,	%o4
	st	%f10,	[%l7 + 0x1C]
	andcc	%i4,	%g5,	%i5
	bshuffle	%f26,	%f16,	%f0
	addcc	%l1,	%l6,	%g2
	fmovrdne	%l3,	%f2,	%f18
	andcc	%o2,	%i7,	%o6
	movneg	%xcc,	%g3,	%g7
	orncc	%g4,	%g6,	%o3
	fpsub32	%f6,	%f0,	%f22
	lduw	[%l7 + 0x1C],	%l5
	sth	%o7,	[%l7 + 0x44]
	stw	%o1,	[%l7 + 0x20]
	fmovsgu	%xcc,	%f24,	%f24
	sth	%i2,	[%l7 + 0x6A]
	movrlz	%i0,	0x25F,	%o0
	sethi	0x11EA,	%i6
	addc	%i3,	%o5,	%l2
	subc	%g1,	0x1049,	%l0
	subc	%i1,	%l4,	%o4
	or	%i4,	0x0F9A,	%g5
	edge8l	%i5,	%l1,	%l6
	smulcc	%l3,	0x12B5,	%o2
	movrgez	%i7,	%o6,	%g2
	nop
	set	0x40, %g2
	ldsh	[%l7 + %g2],	%g7
	ldd	[%l7 + 0x20],	%f12
	srl	%g3,	0x11,	%g4
	stx	%g6,	[%l7 + 0x60]
	fcmpd	%fcc3,	%f28,	%f2
	andn	%l5,	%o3,	%o1
	edge16n	%o7,	%i0,	%o0
	srax	%i2,	%i3,	%o5
	edge16l	%i6,	%g1,	%l0
	move	%xcc,	%l2,	%l4
	xorcc	%i1,	%o4,	%g5
	srax	%i4,	0x08,	%l1
	fmovrsgez	%l6,	%f15,	%f19
	movle	%xcc,	%l3,	%o2
	sllx	%i7,	0x0D,	%i5
	addccc	%g2,	0x0076,	%o6
	udiv	%g7,	0x0FFF,	%g4
	fnors	%f0,	%f17,	%f27
	std	%f26,	[%l7 + 0x60]
	edge16ln	%g6,	%g3,	%l5
	ldsw	[%l7 + 0x34],	%o1
	movle	%xcc,	%o3,	%i0
	movre	%o7,	%o0,	%i3
	fmul8x16au	%f31,	%f21,	%f28
	stb	%i2,	[%l7 + 0x37]
	ld	[%l7 + 0x20],	%f3
	mulx	%o5,	%i6,	%g1
	fmovsvc	%icc,	%f13,	%f10
	add	%l0,	%l2,	%l4
	fnegd	%f26,	%f18
	sdivcc	%o4,	0x1BF8,	%i1
	sdivx	%g5,	0x00A2,	%l1
	movvc	%xcc,	%l6,	%i4
	umulcc	%o2,	0x0BA0,	%i7
	fpack16	%f24,	%f10
	lduh	[%l7 + 0x78],	%l3
	andn	%g2,	%o6,	%g7
	andn	%i5,	%g6,	%g3
	edge16l	%l5,	%o1,	%g4
	fmovdpos	%xcc,	%f8,	%f9
	edge8	%o3,	%i0,	%o0
	add	%o7,	0x067D,	%i3
	fpack32	%f30,	%f0,	%f4
	movge	%icc,	%o5,	%i2
	movcs	%icc,	%i6,	%g1
	edge8	%l2,	%l0,	%l4
	movgu	%icc,	%o4,	%g5
	ld	[%l7 + 0x6C],	%f2
	movleu	%icc,	%l1,	%l6
	sdiv	%i4,	0x0B1C,	%i1
	movpos	%icc,	%i7,	%l3
	sir	0x0C8D
	array32	%g2,	%o2,	%o6
	edge16ln	%i5,	%g7,	%g3
	edge8	%g6,	%o1,	%g4
	fmuld8ulx16	%f21,	%f18,	%f24
	movrgez	%l5,	0x1EC,	%o3
	fmovdn	%xcc,	%f23,	%f30
	movge	%xcc,	%o0,	%o7
	andn	%i3,	0x00DC,	%o5
	orcc	%i2,	%i0,	%i6
	movrgz	%g1,	%l0,	%l4
	fmuld8ulx16	%f4,	%f19,	%f20
	edge32	%o4,	%l2,	%l1
	movcc	%xcc,	%l6,	%g5
	fmovsg	%icc,	%f31,	%f9
	movl	%xcc,	%i1,	%i4
	sll	%l3,	0x19,	%i7
	mova	%icc,	%g2,	%o2
	fmovsvs	%icc,	%f3,	%f13
	movrgez	%o6,	0x024,	%i5
	edge16	%g7,	%g3,	%o1
	srl	%g4,	0x03,	%l5
	fornot1	%f14,	%f6,	%f10
	addcc	%o3,	0x0E34,	%o0
	fmovrdgez	%o7,	%f12,	%f2
	lduh	[%l7 + 0x30],	%i3
	array16	%o5,	%i2,	%i0
	fmovsleu	%icc,	%f12,	%f14
	sdiv	%g6,	0x0F50,	%g1
	move	%icc,	%l0,	%i6
	edge16n	%l4,	%o4,	%l2
	alignaddr	%l6,	%g5,	%i1
	movcs	%xcc,	%l1,	%i4
	fpadd32	%f4,	%f10,	%f8
	ldsw	[%l7 + 0x74],	%i7
	alignaddrl	%l3,	%o2,	%o6
	fmovsvs	%icc,	%f25,	%f20
	movgu	%xcc,	%g2,	%g7
	or	%i5,	0x14D5,	%g3
	movge	%icc,	%g4,	%o1
	alignaddr	%l5,	%o0,	%o3
	movge	%icc,	%i3,	%o7
	array8	%i2,	%i0,	%o5
	nop
	set	0x38, %g1
	std	%f20,	[%l7 + %g1]
	movn	%xcc,	%g1,	%l0
	edge32ln	%g6,	%l4,	%i6
	fmul8x16al	%f30,	%f2,	%f16
	movvs	%icc,	%l2,	%l6
	save %g5, %i1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x64],	%o4
	alignaddrl	%i7,	%l3,	%i4
	sra	%o2,	0x0B,	%o6
	fornot1	%f30,	%f14,	%f2
	bshuffle	%f10,	%f30,	%f0
	lduw	[%l7 + 0x08],	%g2
	movrne	%g7,	0x25D,	%g3
	movleu	%icc,	%g4,	%i5
	orn	%o1,	%o0,	%o3
	or	%l5,	%i3,	%i2
	fmovdge	%icc,	%f10,	%f13
	andn	%i0,	%o7,	%g1
	fone	%f2
	movrlz	%o5,	%g6,	%l0
	umul	%i6,	0x1774,	%l4
	sir	0x11D0
	fpmerge	%f19,	%f26,	%f20
	edge32ln	%l2,	%g5,	%i1
	movrlez	%l1,	0x349,	%o4
	fmovsge	%xcc,	%f28,	%f30
	srax	%i7,	0x01,	%l3
	movcc	%xcc,	%i4,	%o2
	nop
	set	0x24, %l4
	ldsh	[%l7 + %l4],	%o6
	or	%l6,	0x1126,	%g7
	ldsb	[%l7 + 0x30],	%g3
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	sub	%o1,	%o3,	%o0
	fnor	%f22,	%f16,	%f4
	fmovdneg	%icc,	%f16,	%f6
	movvs	%icc,	%l5,	%i3
	mulscc	%i0,	0x1124,	%i2
	fmovscc	%xcc,	%f19,	%f5
	fmovdvs	%xcc,	%f24,	%f30
	fmovdn	%xcc,	%f25,	%f22
	sethi	0x1408,	%g1
	fsrc1	%f18,	%f0
	ldd	[%l7 + 0x40],	%f20
	fmovsvs	%icc,	%f11,	%f0
	xor	%o7,	0x1AC9,	%o5
	sub	%l0,	%i6,	%g6
	movgu	%icc,	%l2,	%l4
	orncc	%i1,	0x1EA5,	%l1
	movre	%g5,	%i7,	%l3
	fornot2	%f4,	%f0,	%f18
	movn	%xcc,	%o4,	%i4
	nop
	set	0x68, %i5
	stx	%o6,	[%l7 + %i5]
	movge	%xcc,	%l6,	%g7
	movge	%icc,	%o2,	%g4
	alignaddr	%g2,	%g3,	%i5
	mulx	%o3,	0x0B55,	%o0
	movcc	%icc,	%o1,	%i3
	movne	%xcc,	%i0,	%i2
	xorcc	%g1,	%o7,	%o5
	edge16n	%l5,	%l0,	%i6
	sub	%g6,	0x0E75,	%l2
	subccc	%i1,	0x132F,	%l1
	stx	%g5,	[%l7 + 0x30]
	nop
	set	0x18, %l3
	ldub	[%l7 + %l3],	%l4
	ld	[%l7 + 0x54],	%f20
	edge16ln	%l3,	%i7,	%o4
	edge16l	%i4,	%l6,	%g7
	fmovrdlez	%o6,	%f24,	%f22
	ldx	[%l7 + 0x18],	%o2
	subc	%g2,	0x1F8C,	%g4
	fxnor	%f10,	%f24,	%f24
	mulx	%g3,	0x0FEC,	%o3
	array16	%i5,	%o0,	%o1
	movrgez	%i3,	0x39D,	%i2
	smulcc	%g1,	0x08C3,	%o7
	fmovrdlz	%i0,	%f6,	%f8
	umul	%o5,	%l0,	%i6
	movrlez	%l5,	0x0E9,	%l2
	nop
	set	0x20, %l5
	ldub	[%l7 + %l5],	%i1
	sdivcc	%g6,	0x13F6,	%g5
	fpsub16s	%f0,	%f21,	%f8
	fpack32	%f24,	%f22,	%f0
	sub	%l4,	0x08AE,	%l3
	ldd	[%l7 + 0x78],	%f24
	stb	%i7,	[%l7 + 0x79]
	stb	%o4,	[%l7 + 0x3F]
	mova	%icc,	%l1,	%l6
	fmovrde	%g7,	%f4,	%f2
	umulcc	%o6,	0x047B,	%o2
	edge8l	%i4,	%g2,	%g3
	movcc	%icc,	%o3,	%g4
	and	%o0,	0x08EB,	%i5
	array16	%o1,	%i2,	%g1
	movrlez	%o7,	0x3F5,	%i3
	fmovdge	%icc,	%f10,	%f17
	movge	%icc,	%o5,	%l0
	fcmpne32	%f30,	%f28,	%i0
	srl	%l5,	%i6,	%l2
	edge32	%g6,	%i1,	%g5
	edge32l	%l3,	%l4,	%i7
	edge8l	%l1,	%o4,	%l6
	srl	%o6,	0x16,	%g7
	ldd	[%l7 + 0x40],	%f24
	movne	%xcc,	%i4,	%o2
	lduw	[%l7 + 0x58],	%g2
	subccc	%o3,	%g4,	%g3
	fones	%f14
	xnorcc	%i5,	0x1912,	%o1
	or	%i2,	%o0,	%o7
	ldx	[%l7 + 0x68],	%i3
	lduw	[%l7 + 0x10],	%g1
	add	%l0,	0x023B,	%o5
	addc	%i0,	0x0989,	%l5
	fandnot1s	%f2,	%f23,	%f4
	fpadd16	%f12,	%f22,	%f20
	fmovrsgz	%i6,	%f22,	%f14
	array16	%l2,	%g6,	%i1
	sdiv	%l3,	0x135E,	%l4
	sub	%i7,	0x14FB,	%l1
	ldx	[%l7 + 0x30],	%g5
	movneg	%icc,	%o4,	%l6
	ldsb	[%l7 + 0x67],	%o6
	movrne	%i4,	%g7,	%g2
	edge32ln	%o3,	%g4,	%o2
	ldub	[%l7 + 0x60],	%i5
	fmovdl	%icc,	%f21,	%f28
	fornot2s	%f13,	%f29,	%f23
	movvs	%xcc,	%g3,	%i2
	fmovsleu	%icc,	%f15,	%f0
	alignaddrl	%o1,	%o0,	%i3
	movcc	%xcc,	%o7,	%g1
	fnegd	%f4,	%f10
	srl	%l0,	0x11,	%o5
	udivcc	%i0,	0x1BB3,	%i6
	xorcc	%l2,	%l5,	%i1
	fxor	%f2,	%f10,	%f16
	fpadd16s	%f18,	%f18,	%f31
	ldub	[%l7 + 0x17],	%g6
	movneg	%icc,	%l3,	%l4
	alignaddr	%i7,	%l1,	%o4
	udiv	%l6,	0x0E1C,	%o6
	xorcc	%g5,	0x1968,	%g7
	edge16	%g2,	%o3,	%g4
	movle	%icc,	%i4,	%o2
	fmovde	%icc,	%f2,	%f22
	lduh	[%l7 + 0x62],	%g3
	edge32l	%i2,	%i5,	%o0
	siam	0x7
	movgu	%icc,	%i3,	%o1
	srax	%g1,	%l0,	%o5
	umulcc	%o7,	%i0,	%i6
	movrne	%l2,	0x2EC,	%l5
	movcc	%xcc,	%i1,	%l3
	fmovsl	%icc,	%f15,	%f29
	save %g6, %l4, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%xcc,	%f18,	%f28
	addcc	%o4,	%l6,	%l1
	movrlez	%g5,	%g7,	%o6
	restore %g2, 0x1068, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f14,	[%l7 + 0x68]
	ldx	[%l7 + 0x60],	%o3
	movn	%xcc,	%i4,	%o2
	movrgz	%g3,	0x32A,	%i5
	fmovrdgz	%o0,	%f28,	%f12
	fpsub16s	%f0,	%f5,	%f21
	addc	%i3,	%o1,	%i2
	sth	%g1,	[%l7 + 0x0E]
	fsrc2s	%f8,	%f21
	addc	%l0,	0x0C5C,	%o5
	movn	%xcc,	%i0,	%o7
	edge32l	%i6,	%l5,	%i1
	edge16	%l3,	%g6,	%l2
	addc	%l4,	0x0841,	%i7
	edge32	%l6,	%o4,	%l1
	array16	%g5,	%g7,	%o6
	ldx	[%l7 + 0x08],	%g4
	srax	%g2,	%o3,	%o2
	fnot1s	%f20,	%f6
	andcc	%g3,	0x0C5A,	%i5
	srax	%i4,	%i3,	%o0
	udivcc	%o1,	0x132F,	%i2
	movrlz	%g1,	0x2D7,	%l0
	sir	0x09CC
	sll	%o5,	0x16,	%i0
	for	%f20,	%f16,	%f2
	array32	%o7,	%i6,	%i1
	pdist	%f0,	%f20,	%f28
	andncc	%l5,	%l3,	%g6
	ldsw	[%l7 + 0x24],	%l4
	smul	%l2,	0x05DE,	%i7
	andncc	%l6,	%o4,	%g5
	move	%icc,	%l1,	%o6
	st	%f30,	[%l7 + 0x10]
	subcc	%g7,	0x0C0A,	%g2
	movl	%icc,	%g4,	%o2
	fmovdg	%icc,	%f16,	%f14
	andncc	%g3,	%o3,	%i5
	ldd	[%l7 + 0x78],	%i4
	xnorcc	%o0,	%o1,	%i3
	sub	%g1,	0x0DAB,	%i2
	edge16n	%l0,	%i0,	%o5
	sllx	%o7,	0x08,	%i1
	fmovrsne	%l5,	%f29,	%f1
	fmovsgu	%xcc,	%f22,	%f14
	mulscc	%i6,	0x1EFB,	%g6
	array32	%l4,	%l2,	%l3
	stx	%i7,	[%l7 + 0x78]
	movcc	%xcc,	%l6,	%o4
	fmul8x16	%f22,	%f20,	%f20
	orncc	%g5,	0x18EC,	%l1
	sll	%o6,	%g7,	%g2
	fnand	%f8,	%f22,	%f2
	ldd	[%l7 + 0x18],	%o2
	fmovrslz	%g4,	%f15,	%f24
	movrne	%o3,	%g3,	%i4
	ldub	[%l7 + 0x2E],	%o0
	mova	%xcc,	%o1,	%i3
	fmovrse	%i5,	%f21,	%f28
	ldd	[%l7 + 0x60],	%f28
	array16	%i2,	%l0,	%g1
	umulcc	%o5,	%o7,	%i1
	sth	%l5,	[%l7 + 0x22]
	alignaddr	%i0,	%g6,	%i6
	movle	%icc,	%l4,	%l2
	udivcc	%i7,	0x0580,	%l6
	mulscc	%o4,	%l3,	%l1
	srax	%g5,	0x1E,	%g7
	stx	%g2,	[%l7 + 0x38]
	fmovrslz	%o2,	%f6,	%f10
	array32	%o6,	%o3,	%g3
	movre	%i4,	%o0,	%g4
	stb	%i3,	[%l7 + 0x74]
	movpos	%xcc,	%o1,	%i2
	udivcc	%i5,	0x0E37,	%l0
	sethi	0x0186,	%g1
	srlx	%o7,	0x06,	%i1
	fcmpgt16	%f8,	%f4,	%o5
	subc	%i0,	0x0A36,	%g6
	fmovsgu	%xcc,	%f18,	%f27
	pdist	%f10,	%f22,	%f26
	st	%f11,	[%l7 + 0x48]
	movre	%l5,	0x3F8,	%i6
	fsrc2s	%f22,	%f30
	fandnot2s	%f1,	%f9,	%f10
	srlx	%l4,	%l2,	%l6
	movre	%o4,	%i7,	%l3
	ld	[%l7 + 0x48],	%f22
	movn	%icc,	%l1,	%g7
	subccc	%g2,	%g5,	%o2
	udiv	%o3,	0x1455,	%g3
	srlx	%o6,	0x16,	%o0
	fmovdle	%icc,	%f6,	%f17
	array8	%i4,	%g4,	%o1
	movvs	%xcc,	%i2,	%i5
	array8	%i3,	%l0,	%o7
	ldsh	[%l7 + 0x3E],	%g1
	smul	%i1,	0x0D3A,	%i0
	orn	%o5,	0x0643,	%g6
	ld	[%l7 + 0x5C],	%f16
	fnot2s	%f26,	%f20
	sethi	0x01D0,	%l5
	udivx	%i6,	0x0B00,	%l2
	mova	%icc,	%l4,	%o4
	sdivcc	%i7,	0x1330,	%l3
	movvs	%icc,	%l1,	%g7
	sub	%g2,	%g5,	%o2
	ldd	[%l7 + 0x58],	%i6
	fmuld8ulx16	%f14,	%f28,	%f2
	ld	[%l7 + 0x20],	%f6
	ldd	[%l7 + 0x68],	%o2
	fcmple16	%f2,	%f12,	%o6
	movle	%icc,	%g3,	%o0
	subcc	%i4,	0x171B,	%o1
	alignaddrl	%i2,	%i5,	%g4
	movrgez	%l0,	0x335,	%o7
	addc	%g1,	0x16D9,	%i3
	movrlez	%i0,	%o5,	%g6
	sra	%l5,	0x11,	%i6
	movg	%icc,	%i1,	%l2
	fxnors	%f19,	%f4,	%f30
	lduh	[%l7 + 0x7C],	%l4
	edge8l	%i7,	%o4,	%l3
	movn	%icc,	%g7,	%l1
	xnor	%g5,	0x0296,	%o2
	stw	%g2,	[%l7 + 0x64]
	andncc	%l6,	%o3,	%g3
	edge8	%o6,	%i4,	%o0
	sir	0x0211
	sub	%o1,	0x1C08,	%i2
	srax	%i5,	0x1A,	%l0
	std	%f18,	[%l7 + 0x78]
	fcmpd	%fcc3,	%f24,	%f18
	edge8l	%g4,	%o7,	%i3
	sir	0x0D57
	andcc	%i0,	0x0000,	%g1
	array32	%g6,	%o5,	%l5
	fmul8sux16	%f20,	%f12,	%f0
	fmovdneg	%icc,	%f7,	%f9
	fmovrdne	%i6,	%f12,	%f10
	movre	%l2,	0x1B3,	%l4
	movgu	%icc,	%i1,	%o4
	movneg	%xcc,	%l3,	%g7
	subc	%i7,	%g5,	%l1
	sll	%o2,	%l6,	%g2
	add	%g3,	0x07AB,	%o3
	movcs	%icc,	%i4,	%o6
	movcc	%xcc,	%o0,	%o1
	fmovs	%f31,	%f14
	movneg	%xcc,	%i5,	%l0
	umulcc	%g4,	%i2,	%o7
	save %i3, 0x0AE5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g6,	%o5,	%i0
	xor	%i6,	0x0855,	%l5
	umulcc	%l4,	0x1694,	%l2
	umul	%o4,	0x0183,	%i1
	srlx	%g7,	%l3,	%i7
	sllx	%l1,	%g5,	%o2
	movcs	%xcc,	%l6,	%g2
	ldub	[%l7 + 0x1D],	%g3
	fmovscs	%xcc,	%f21,	%f16
	sethi	0x0389,	%i4
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%o2
	edge8n	%o0,	%o1,	%o6
	movvs	%icc,	%i5,	%g4
	save %l0, 0x0DDB, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i2,	%g1,	%g6
	fmuld8ulx16	%f29,	%f25,	%f6
	movvc	%icc,	%i3,	%i0
	edge8n	%o5,	%l5,	%i6
	movvc	%xcc,	%l4,	%o4
	fmovrdlez	%i1,	%f22,	%f24
	fmovrslez	%g7,	%f19,	%f1
	sdiv	%l2,	0x1315,	%i7
	movvc	%icc,	%l1,	%g5
	movrlz	%l3,	%l6,	%o2
	movvc	%icc,	%g2,	%i4
	edge16n	%g3,	%o3,	%o0
	ldsb	[%l7 + 0x28],	%o6
	smul	%i5,	0x0455,	%o1
	sdivx	%l0,	0x04B8,	%g4
	ldd	[%l7 + 0x08],	%i2
	fnands	%f26,	%f17,	%f14
	edge32n	%o7,	%g1,	%g6
	ldsb	[%l7 + 0x61],	%i3
	fpmerge	%f13,	%f25,	%f10
	save %o5, %i0, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%l5,	%l4
	movvs	%xcc,	%o4,	%g7
	subcc	%i1,	%l2,	%i7
	sllx	%l1,	%g5,	%l3
	subccc	%l6,	%o2,	%g2
	movn	%xcc,	%g3,	%i4
	movle	%xcc,	%o0,	%o3
	sir	0x02A4
	andcc	%o6,	0x04D7,	%i5
	movrgz	%l0,	%g4,	%i2
	udivx	%o1,	0x01AB,	%o7
	stw	%g6,	[%l7 + 0x28]
	udiv	%i3,	0x0BE3,	%o5
	fnands	%f8,	%f15,	%f14
	movgu	%xcc,	%g1,	%i6
	subccc	%i0,	%l5,	%l4
	fnegs	%f28,	%f24
	fcmpgt16	%f6,	%f18,	%o4
	fmovrsgez	%g7,	%f2,	%f9
	fabsd	%f6,	%f26
	movneg	%xcc,	%l2,	%i7
	for	%f22,	%f2,	%f0
	ldsh	[%l7 + 0x26],	%i1
	mulscc	%g5,	0x1BAB,	%l1
	srax	%l6,	%l3,	%g2
	nop
	set	0x3D, %o1
	stb	%o2,	[%l7 + %o1]
	umul	%g3,	%o0,	%o3
	ld	[%l7 + 0x44],	%f11
	add	%o6,	0x13AE,	%i4
	fmovdneg	%icc,	%f29,	%f6
	sir	0x0F3B
	fornot2s	%f31,	%f21,	%f15
	movre	%l0,	0x269,	%i5
	andncc	%g4,	%i2,	%o1
	fornot1s	%f8,	%f2,	%f15
	movre	%o7,	0x19C,	%i3
	edge8ln	%o5,	%g6,	%g1
	andcc	%i0,	%l5,	%i6
	fmovs	%f17,	%f19
	add	%l4,	0x1311,	%g7
	move	%xcc,	%o4,	%i7
	movpos	%xcc,	%i1,	%l2
	sth	%g5,	[%l7 + 0x64]
	fmovdg	%icc,	%f4,	%f6
	movcc	%xcc,	%l1,	%l3
	movgu	%icc,	%l6,	%g2
	movne	%icc,	%o2,	%o0
	andncc	%o3,	%o6,	%g3
	edge32	%i4,	%l0,	%g4
	fsrc1	%f0,	%f10
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%f12
	xorcc	%i5,	0x05FE,	%o1
	sir	0x1A81
	andcc	%o7,	%i3,	%i2
	fsrc2s	%f30,	%f25
	sth	%o5,	[%l7 + 0x7E]
	movrgez	%g1,	%g6,	%i0
	movgu	%xcc,	%i6,	%l4
	movleu	%icc,	%g7,	%o4
	movle	%icc,	%l5,	%i7
	smul	%i1,	%g5,	%l2
	std	%f28,	[%l7 + 0x78]
	ldd	[%l7 + 0x30],	%l2
	orncc	%l1,	0x103E,	%g2
	fcmpgt32	%f22,	%f22,	%o2
	subcc	%l6,	0x10D8,	%o3
	nop
	set	0x67, %i0
	stb	%o0,	[%l7 + %i0]
	addc	%o6,	%i4,	%g3
	popc	%g4,	%i5
	mova	%icc,	%l0,	%o1
	fandnot2	%f14,	%f14,	%f24
	stw	%o7,	[%l7 + 0x18]
	movneg	%icc,	%i3,	%i2
	xnorcc	%g1,	0x10FE,	%g6
	sdivx	%o5,	0x0A75,	%i0
	orn	%i6,	%g7,	%o4
	udivcc	%l5,	0x02CA,	%l4
	fmovdcs	%xcc,	%f10,	%f25
	sllx	%i7,	%i1,	%g5
	umulcc	%l3,	%l2,	%l1
	ldub	[%l7 + 0x48],	%o2
	subccc	%g2,	%l6,	%o0
	srl	%o3,	%i4,	%g3
	fmovd	%f14,	%f28
	fzero	%f6
	movrlez	%o6,	0x1DC,	%g4
	srl	%l0,	0x0B,	%o1
	fcmpgt16	%f26,	%f30,	%i5
	edge8l	%i3,	%i2,	%o7
	ld	[%l7 + 0x08],	%f9
	movg	%xcc,	%g1,	%o5
	fxnor	%f14,	%f28,	%f12
	fmul8sux16	%f2,	%f22,	%f22
	fzero	%f18
	fnegs	%f3,	%f6
	st	%f30,	[%l7 + 0x44]
	fmovscs	%xcc,	%f30,	%f26
	sethi	0x1685,	%i0
	andcc	%g6,	%g7,	%o4
	fzeros	%f29
	mova	%xcc,	%l5,	%i6
	edge8ln	%i7,	%l4,	%g5
	orcc	%i1,	0x02C1,	%l3
	sdivx	%l2,	0x135B,	%o2
	sir	0x0D77
	edge16n	%g2,	%l6,	%l1
	andncc	%o0,	%i4,	%o3
	move	%xcc,	%o6,	%g4
	sdivcc	%l0,	0x1835,	%o1
	fmovdneg	%xcc,	%f26,	%f25
	fmovdleu	%xcc,	%f27,	%f6
	fandnot2s	%f29,	%f12,	%f17
	fnand	%f8,	%f0,	%f12
	mulx	%g3,	%i5,	%i3
	fnot2	%f18,	%f0
	sub	%o7,	%i2,	%o5
	edge32l	%g1,	%i0,	%g7
	edge16	%o4,	%g6,	%i6
	fpack32	%f24,	%f2,	%f26
	srl	%i7,	%l5,	%l4
	faligndata	%f14,	%f24,	%f28
	movrlez	%i1,	%g5,	%l3
	stx	%o2,	[%l7 + 0x50]
	edge32n	%l2,	%g2,	%l6
	movl	%xcc,	%l1,	%i4
	sllx	%o3,	%o0,	%o6
	movrlez	%l0,	%o1,	%g3
	addc	%g4,	%i5,	%i3
	movrgez	%i2,	0x3EA,	%o7
	movre	%o5,	0x025,	%i0
	fmovrdgz	%g7,	%f26,	%f2
	movneg	%xcc,	%g1,	%g6
	alignaddr	%o4,	%i7,	%i6
	subcc	%l4,	0x1B09,	%l5
	fzero	%f16
	array8	%i1,	%g5,	%l3
	movcs	%xcc,	%o2,	%g2
	array8	%l6,	%l1,	%l2
	fmovdneg	%xcc,	%f16,	%f30
	addcc	%o3,	%o0,	%i4
	fmovdpos	%xcc,	%f11,	%f8
	edge8	%l0,	%o6,	%g3
	fmovdne	%xcc,	%f7,	%f13
	st	%f19,	[%l7 + 0x60]
	udiv	%g4,	0x1E0B,	%i5
	ld	[%l7 + 0x70],	%f8
	fmovsneg	%icc,	%f4,	%f1
	fmuld8ulx16	%f23,	%f28,	%f6
	srl	%o1,	%i2,	%o7
	std	%f2,	[%l7 + 0x70]
	fands	%f7,	%f31,	%f7
	edge32l	%o5,	%i3,	%g7
	movrgez	%i0,	0x324,	%g6
	add	%g1,	%i7,	%i6
	fxors	%f11,	%f24,	%f10
	srl	%l4,	%o4,	%i1
	move	%xcc,	%g5,	%l5
	fmovsg	%icc,	%f12,	%f2
	fnot2	%f26,	%f4
	sllx	%l3,	%g2,	%l6
	orcc	%l1,	0x073D,	%l2
	movre	%o3,	0x121,	%o2
	fandnot1	%f10,	%f30,	%f8
	lduh	[%l7 + 0x5E],	%o0
	srl	%i4,	%l0,	%o6
	fsrc2s	%f7,	%f1
	edge32ln	%g4,	%g3,	%o1
	movrgez	%i2,	%i5,	%o5
	movgu	%xcc,	%i3,	%o7
	addcc	%g7,	0x1C4E,	%g6
	and	%g1,	0x0D86,	%i7
	array32	%i0,	%l4,	%o4
	ld	[%l7 + 0x4C],	%f30
	add	%i6,	%g5,	%i1
	stx	%l3,	[%l7 + 0x50]
	movrgz	%g2,	0x0AE,	%l5
	fcmpne32	%f10,	%f18,	%l6
	fcmpne16	%f28,	%f14,	%l1
	stb	%l2,	[%l7 + 0x39]
	srlx	%o3,	%o0,	%i4
	fmovd	%f28,	%f14
	udiv	%o2,	0x1BEE,	%o6
	lduh	[%l7 + 0x30],	%l0
	fands	%f27,	%f2,	%f22
	fpadd32	%f14,	%f24,	%f0
	edge16l	%g3,	%o1,	%i2
	fmovdg	%icc,	%f19,	%f19
	fmovrde	%g4,	%f16,	%f4
	fnot1	%f16,	%f10
	movre	%i5,	%i3,	%o7
	or	%o5,	%g7,	%g1
	fxnor	%f6,	%f8,	%f12
	movge	%xcc,	%i7,	%i0
	stx	%l4,	[%l7 + 0x40]
	stw	%o4,	[%l7 + 0x14]
	move	%xcc,	%i6,	%g6
	addcc	%g5,	0x0702,	%l3
	fandnot1	%f16,	%f20,	%f8
	smul	%g2,	%l5,	%l6
	sth	%l1,	[%l7 + 0x18]
	subcc	%i1,	0x0067,	%o3
	edge16l	%o0,	%l2,	%i4
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	movrlz	%o1,	0x2EB,	%o6
	movn	%xcc,	%g4,	%i2
	nop
	set	0x70, %o6
	lduh	[%l7 + %o6],	%i5
	movrlez	%i3,	0x04D,	%o7
	edge8ln	%g7,	%o5,	%g1
	movpos	%icc,	%i7,	%i0
	andcc	%l4,	0x1737,	%o4
	edge32	%i6,	%g5,	%l3
	ld	[%l7 + 0x4C],	%f26
	alignaddrl	%g6,	%g2,	%l6
	stb	%l1,	[%l7 + 0x71]
	movcc	%icc,	%i1,	%l5
	stw	%o3,	[%l7 + 0x78]
	orn	%o0,	0x1021,	%l2
	subccc	%i4,	%l0,	%o2
	addccc	%o1,	%o6,	%g3
	smulcc	%g4,	%i5,	%i3
	ldd	[%l7 + 0x70],	%f2
	fmovdg	%xcc,	%f27,	%f2
	edge32l	%o7,	%g7,	%o5
	fmovsl	%xcc,	%f25,	%f30
	fnot1s	%f0,	%f10
	sethi	0x14C0,	%i2
	umul	%g1,	%i0,	%l4
	smul	%o4,	%i7,	%g5
	ldd	[%l7 + 0x38],	%f6
	addcc	%l3,	0x0610,	%i6
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%f26
	udivcc	%g6,	0x0783,	%g2
	lduw	[%l7 + 0x38],	%l6
	move	%xcc,	%l1,	%l5
	sub	%o3,	0x1D1C,	%i1
	andcc	%l2,	0x12D6,	%i4
	sra	%o0,	%l0,	%o1
	ldsh	[%l7 + 0x78],	%o2
	movre	%g3,	%g4,	%i5
	save %i3, 0x1AE6, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%g7,	%o6
	fandnot1s	%f29,	%f20,	%f16
	movl	%icc,	%o5,	%g1
	edge8ln	%i0,	%i2,	%o4
	alignaddr	%l4,	%i7,	%l3
	edge16ln	%g5,	%i6,	%g2
	addcc	%g6,	0x0E2E,	%l6
	sra	%l1,	%o3,	%l5
	sth	%l2,	[%l7 + 0x6E]
	sub	%i1,	%o0,	%l0
	edge16	%i4,	%o2,	%o1
	fcmpd	%fcc1,	%f18,	%f22
	fpsub32	%f16,	%f18,	%f4
	srl	%g3,	%i5,	%g4
	subc	%i3,	0x0D41,	%g7
	movleu	%icc,	%o6,	%o7
	fands	%f29,	%f0,	%f27
	andncc	%o5,	%g1,	%i0
	fxnors	%f11,	%f4,	%f0
	movrgez	%i2,	%o4,	%l4
	subcc	%l3,	%g5,	%i6
	ldsh	[%l7 + 0x0C],	%g2
	addcc	%g6,	%l6,	%i7
	alignaddr	%o3,	%l5,	%l2
	edge32n	%i1,	%l1,	%l0
	mulx	%o0,	%o2,	%o1
	ldd	[%l7 + 0x48],	%f22
	fnands	%f2,	%f8,	%f21
	fmovdcs	%icc,	%f13,	%f3
	movge	%xcc,	%i4,	%i5
	alignaddr	%g4,	%g3,	%g7
	movn	%xcc,	%o6,	%o7
	fexpand	%f19,	%f10
	orcc	%o5,	%g1,	%i0
	fmovse	%xcc,	%f21,	%f18
	addcc	%i2,	%o4,	%l4
	edge8ln	%l3,	%i3,	%i6
	movcs	%xcc,	%g2,	%g6
	movne	%xcc,	%g5,	%l6
	fmovsneg	%icc,	%f31,	%f16
	ldx	[%l7 + 0x38],	%i7
	ldd	[%l7 + 0x78],	%f8
	movn	%icc,	%o3,	%l5
	movvc	%icc,	%l2,	%i1
	movcc	%icc,	%l0,	%l1
	lduh	[%l7 + 0x4A],	%o2
	fcmpgt32	%f20,	%f26,	%o0
	edge16n	%o1,	%i4,	%g4
	fmovdvc	%icc,	%f22,	%f4
	sdivcc	%g3,	0x1720,	%g7
	fcmpes	%fcc0,	%f3,	%f28
	movne	%icc,	%o6,	%o7
	movl	%xcc,	%i5,	%g1
	edge8	%i0,	%i2,	%o4
	movrlz	%l4,	0x122,	%l3
	andncc	%o5,	%i6,	%i3
	fmovsvs	%icc,	%f15,	%f16
	sethi	0x10C1,	%g2
	sdivx	%g5,	0x0091,	%g6
	edge8	%l6,	%i7,	%l5
	movge	%xcc,	%l2,	%o3
	sir	0x0CD2
	sdivx	%i1,	0x11B9,	%l0
	orncc	%o2,	0x03D7,	%l1
	edge32	%o1,	%o0,	%i4
	orcc	%g4,	%g3,	%g7
	sll	%o7,	0x16,	%o6
	edge32	%i5,	%i0,	%g1
	fmovdcc	%xcc,	%f2,	%f26
	umulcc	%o4,	0x1BA0,	%l4
	fsrc2s	%f16,	%f18
	fcmple32	%f4,	%f16,	%l3
	stb	%i2,	[%l7 + 0x14]
	udiv	%o5,	0x0715,	%i6
	stx	%i3,	[%l7 + 0x38]
	srlx	%g5,	0x01,	%g2
	fmovsa	%icc,	%f4,	%f13
	sdiv	%l6,	0x1ADB,	%i7
	fone	%f0
	srl	%l5,	0x00,	%l2
	fnands	%f9,	%f23,	%f5
	sdiv	%g6,	0x0A49,	%o3
	ldsw	[%l7 + 0x40],	%l0
	edge32ln	%o2,	%l1,	%o1
	popc	%i1,	%o0
	fcmpgt32	%f30,	%f8,	%g4
	fmovrde	%i4,	%f2,	%f24
	fmovrdlez	%g3,	%f0,	%f10
	xor	%o7,	0x03AA,	%g7
	stw	%o6,	[%l7 + 0x44]
	edge32n	%i0,	%g1,	%o4
	lduh	[%l7 + 0x4A],	%i5
	fabsd	%f16,	%f6
	sra	%l3,	0x0B,	%i2
	st	%f22,	[%l7 + 0x70]
	sdivcc	%l4,	0x1332,	%i6
	fmovsgu	%xcc,	%f16,	%f0
	edge8l	%i3,	%o5,	%g5
	edge8	%l6,	%i7,	%g2
	xor	%l5,	0x09B0,	%l2
	movvs	%xcc,	%o3,	%l0
	sra	%g6,	%o2,	%l1
	movgu	%xcc,	%o1,	%i1
	stx	%g4,	[%l7 + 0x20]
	movvs	%xcc,	%o0,	%g3
	edge16ln	%o7,	%i4,	%g7
	edge16n	%o6,	%i0,	%g1
	movl	%icc,	%o4,	%l3
	ldsw	[%l7 + 0x20],	%i2
	edge32n	%i5,	%l4,	%i3
	fmovrdlz	%i6,	%f26,	%f12
	std	%f18,	[%l7 + 0x08]
	array16	%g5,	%l6,	%o5
	udiv	%i7,	0x1780,	%l5
	udivx	%g2,	0x11A0,	%l2
	fmul8x16	%f2,	%f2,	%f8
	movcc	%icc,	%l0,	%g6
	move	%icc,	%o2,	%l1
	movrgz	%o1,	0x277,	%o3
	movrgz	%i1,	0x018,	%g4
	movcs	%icc,	%o0,	%g3
	movrgez	%i4,	0x273,	%g7
	movpos	%icc,	%o7,	%o6
	movgu	%xcc,	%g1,	%i0
	udiv	%o4,	0x0FCE,	%l3
	andncc	%i2,	%l4,	%i3
	ldub	[%l7 + 0x2B],	%i5
	array32	%g5,	%i6,	%o5
	fcmped	%fcc0,	%f10,	%f14
	movcc	%xcc,	%l6,	%i7
	umul	%l5,	%l2,	%l0
	std	%f10,	[%l7 + 0x50]
	array16	%g6,	%o2,	%g2
	popc	%l1,	%o3
	andcc	%o1,	%g4,	%i1
	fnand	%f18,	%f16,	%f28
	movle	%xcc,	%g3,	%o0
	fmovdvs	%icc,	%f7,	%f15
	fabss	%f16,	%f1
	edge16l	%i4,	%o7,	%g7
	andn	%g1,	0x1859,	%i0
	ldsh	[%l7 + 0x78],	%o4
	fnegs	%f2,	%f29
	fpackfix	%f2,	%f27
	edge16	%l3,	%o6,	%i2
	fnegs	%f26,	%f12
	fmovsgu	%icc,	%f17,	%f22
	fmovdle	%xcc,	%f12,	%f22
	xnorcc	%i3,	0x1060,	%i5
	lduw	[%l7 + 0x3C],	%l4
	addc	%g5,	%i6,	%o5
	edge16l	%l6,	%l5,	%i7
	ld	[%l7 + 0x38],	%f5
	mulscc	%l0,	0x1683,	%l2
	srlx	%o2,	%g2,	%l1
	edge8n	%g6,	%o1,	%g4
	srlx	%i1,	%o3,	%g3
	ldsw	[%l7 + 0x18],	%o0
	subc	%o7,	%g7,	%g1
	std	%f28,	[%l7 + 0x78]
	ldsb	[%l7 + 0x21],	%i0
	movvc	%icc,	%o4,	%i4
	andcc	%o6,	0x1F63,	%l3
	andcc	%i2,	%i5,	%i3
	smul	%g5,	%i6,	%o5
	movvc	%icc,	%l4,	%l5
	mulscc	%l6,	%l0,	%i7
	xor	%o2,	%l2,	%g2
	fmovsl	%xcc,	%f18,	%f26
	udivx	%g6,	0x02E2,	%o1
	fcmpeq16	%f16,	%f0,	%g4
	movvc	%xcc,	%i1,	%l1
	fxor	%f30,	%f2,	%f20
	udivcc	%o3,	0x13C4,	%g3
	ldsw	[%l7 + 0x10],	%o0
	movl	%xcc,	%o7,	%g7
	sra	%g1,	0x19,	%i0
	sdiv	%o4,	0x0ACC,	%o6
	stb	%l3,	[%l7 + 0x23]
	srl	%i4,	0x02,	%i2
	popc	%i3,	%g5
	alignaddrl	%i6,	%i5,	%o5
	sethi	0x12B5,	%l5
	ldsb	[%l7 + 0x4B],	%l6
	movle	%icc,	%l4,	%i7
	andn	%o2,	%l2,	%g2
	fmovrde	%g6,	%f8,	%f14
	fmul8x16	%f1,	%f24,	%f12
	fmovsa	%xcc,	%f30,	%f9
	umulcc	%l0,	%o1,	%g4
	mova	%xcc,	%l1,	%o3
	sth	%g3,	[%l7 + 0x0C]
	array32	%o0,	%i1,	%o7
	subc	%g1,	%i0,	%g7
	xor	%o6,	0x0429,	%l3
	xnor	%i4,	%i2,	%o4
	sra	%g5,	%i6,	%i5
	edge32n	%i3,	%o5,	%l5
	umul	%l4,	0x1B3E,	%i7
	add	%l6,	%o2,	%g2
	fornot1s	%f22,	%f26,	%f11
	array16	%g6,	%l0,	%o1
	edge32ln	%l2,	%g4,	%l1
	addc	%o3,	%g3,	%o0
	umul	%i1,	%g1,	%i0
	fsrc2s	%f24,	%f25
	restore %o7, 0x168C, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l3,	0x3E4,	%o6
	sra	%i4,	%o4,	%i2
	edge32ln	%g5,	%i6,	%i3
	edge8	%o5,	%l5,	%i5
	movcs	%xcc,	%i7,	%l4
	edge16	%o2,	%g2,	%l6
	fpsub32	%f18,	%f16,	%f18
	subcc	%l0,	%o1,	%g6
	orn	%l2,	0x1945,	%l1
	alignaddr	%o3,	%g4,	%g3
	edge32l	%i1,	%o0,	%i0
	alignaddr	%g1,	%g7,	%o7
	fmovdcc	%xcc,	%f12,	%f15
	udivcc	%l3,	0x0029,	%o6
	xor	%i4,	%i2,	%g5
	fmovscs	%icc,	%f13,	%f24
	std	%f18,	[%l7 + 0x08]
	fpadd16	%f2,	%f6,	%f16
	srl	%i6,	0x01,	%o4
	ldsb	[%l7 + 0x60],	%i3
	sdivcc	%o5,	0x0B39,	%l5
	orn	%i5,	%l4,	%o2
	sll	%g2,	%i7,	%l0
	movrgz	%l6,	0x140,	%g6
	xor	%l2,	0x13D6,	%l1
	array16	%o3,	%g4,	%o1
	fmovsge	%icc,	%f0,	%f0
	or	%g3,	%o0,	%i1
	fmovscc	%xcc,	%f27,	%f3
	orcc	%i0,	0x15B6,	%g7
	sethi	0x1E7C,	%g1
	std	%f22,	[%l7 + 0x68]
	array32	%l3,	%o7,	%i4
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%f4
	edge32l	%o6,	%g5,	%i2
	fmovsvc	%icc,	%f2,	%f13
	move	%xcc,	%i6,	%i3
	fmovse	%icc,	%f30,	%f14
	fpackfix	%f10,	%f2
	st	%f7,	[%l7 + 0x30]
	edge16	%o4,	%o5,	%i5
	movne	%icc,	%l5,	%l4
	movleu	%icc,	%o2,	%g2
	fmovsn	%icc,	%f27,	%f19
	addccc	%i7,	%l0,	%l6
	smulcc	%l2,	0x03B4,	%g6
	fxnor	%f2,	%f28,	%f4
	fpmerge	%f25,	%f15,	%f30
	fpackfix	%f2,	%f11
	orn	%l1,	0x0548,	%o3
	movrgez	%o1,	%g4,	%o0
	edge32l	%g3,	%i1,	%i0
	ldsb	[%l7 + 0x6A],	%g1
	fmovdvs	%xcc,	%f15,	%f15
	movrgez	%l3,	%g7,	%i4
	movvs	%xcc,	%o6,	%g5
	movvc	%icc,	%i2,	%i6
	fexpand	%f20,	%f0
	movpos	%xcc,	%o7,	%o4
	ldsw	[%l7 + 0x08],	%o5
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	movrlez	%i5,	0x3E6,	%o2
	movrgez	%l4,	0x1DB,	%i7
	mulscc	%l0,	%l6,	%l2
	movne	%xcc,	%g6,	%g2
	fmovdvs	%xcc,	%f13,	%f5
	or	%o3,	%o1,	%g4
	fpack32	%f30,	%f8,	%f24
	fmovrsne	%o0,	%f14,	%f2
	udivx	%g3,	0x0ABD,	%l1
	fnegd	%f18,	%f24
	edge16l	%i0,	%g1,	%i1
	movrne	%g7,	0x35B,	%l3
	orcc	%o6,	%i4,	%i2
	ldx	[%l7 + 0x78],	%g5
	movpos	%xcc,	%o7,	%i6
	alignaddrl	%o5,	%o4,	%i3
	udivcc	%i5,	0x00E5,	%l5
	movg	%xcc,	%l4,	%i7
	andn	%l0,	0x04D1,	%l6
	fmul8x16	%f0,	%f16,	%f30
	movle	%xcc,	%l2,	%o2
	addc	%g2,	0x038A,	%o3
	stw	%g6,	[%l7 + 0x5C]
	restore %g4, 0x0DEC, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%g3,	%l1
	movrlez	%i0,	0x10B,	%g1
	lduh	[%l7 + 0x20],	%i1
	movrgez	%o1,	%g7,	%o6
	umulcc	%l3,	%i4,	%i2
	movle	%icc,	%g5,	%i6
	addccc	%o7,	%o4,	%o5
	move	%icc,	%i5,	%i3
	edge16ln	%l4,	%i7,	%l0
	edge32	%l6,	%l2,	%o2
	stw	%g2,	[%l7 + 0x50]
	fmovdleu	%xcc,	%f0,	%f4
	subc	%l5,	0x08D6,	%o3
	umulcc	%g4,	%g6,	%g3
	movle	%xcc,	%o0,	%l1
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	movgu	%icc,	%g1,	%g7
	alignaddrl	%l3,	%o6,	%i4
	and	%i2,	%i6,	%g5
	alignaddrl	%o4,	%o7,	%o5
	movre	%i5,	%i3,	%i7
	popc	%l4,	%l6
	umulcc	%l0,	0x19CC,	%o2
	movvc	%xcc,	%l2,	%l5
	restore %o3, 0x0EE4, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f16,	[%l7 + 0x58]
	srax	%g6,	%g3,	%o0
	fmovsneg	%xcc,	%f8,	%f19
	fmovscc	%xcc,	%f30,	%f29
	mova	%xcc,	%l1,	%g2
	xnor	%i0,	0x0BFA,	%o1
	nop
	set	0x60, %g7
	std	%f28,	[%l7 + %g7]
	fpack32	%f26,	%f24,	%f16
	orcc	%g1,	%g7,	%i1
	xor	%o6,	%i4,	%l3
	fsrc2s	%f20,	%f2
	save %i2, 0x153D, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%o4,	%g5
	stw	%o7,	[%l7 + 0x64]
	fmovdleu	%icc,	%f15,	%f1
	fmovrdlz	%o5,	%f18,	%f22
	fmovsge	%xcc,	%f29,	%f25
	fcmps	%fcc0,	%f9,	%f15
	std	%f4,	[%l7 + 0x08]
	movgu	%xcc,	%i3,	%i5
	stb	%l4,	[%l7 + 0x0F]
	edge8ln	%i7,	%l0,	%l6
	fmovdge	%icc,	%f23,	%f28
	ldsh	[%l7 + 0x42],	%l2
	fpadd32	%f18,	%f4,	%f30
	fcmpes	%fcc1,	%f30,	%f18
	sdivx	%l5,	0x0B8A,	%o3
	movvc	%xcc,	%o2,	%g6
	fmovsle	%icc,	%f8,	%f14
	andn	%g4,	%g3,	%o0
	stb	%l1,	[%l7 + 0x7B]
	xorcc	%g2,	0x15FA,	%i0
	ldd	[%l7 + 0x30],	%f0
	alignaddrl	%o1,	%g1,	%g7
	subcc	%o6,	0x0981,	%i4
	movrlez	%l3,	0x3EE,	%i1
	and	%i6,	0x0CB8,	%i2
	edge8ln	%g5,	%o4,	%o7
	or	%o5,	0x0924,	%i3
	fabss	%f5,	%f15
	movrgz	%l4,	0x0DE,	%i7
	edge16l	%i5,	%l0,	%l6
	ld	[%l7 + 0x74],	%f3
	move	%icc,	%l5,	%o3
	ldub	[%l7 + 0x3E],	%o2
	movrlez	%g6,	%g4,	%l2
	fmovrdlz	%o0,	%f4,	%f4
	movn	%xcc,	%g3,	%l1
	nop
	set	0x0C, %g5
	lduw	[%l7 + %g5],	%i0
	sth	%g2,	[%l7 + 0x68]
	edge16l	%o1,	%g1,	%g7
	udivx	%o6,	0x1390,	%i4
	umulcc	%l3,	%i6,	%i2
	sth	%g5,	[%l7 + 0x18]
	fmovd	%f22,	%f28
	fpack32	%f2,	%f24,	%f2
	fpsub16s	%f30,	%f21,	%f2
	xnorcc	%i1,	%o4,	%o7
	movneg	%icc,	%o5,	%l4
	fsrc2s	%f3,	%f9
	for	%f16,	%f18,	%f2
	nop
	set	0x38, %o4
	stx	%i3,	[%l7 + %o4]
	fmovdgu	%xcc,	%f22,	%f2
	or	%i5,	0x102A,	%l0
	sra	%i7,	%l5,	%o3
	fmovsg	%icc,	%f14,	%f17
	edge32ln	%o2,	%l6,	%g4
	movrgez	%g6,	0x3FE,	%l2
	movrgez	%g3,	0x3B5,	%o0
	orcc	%i0,	0x1D90,	%l1
	edge32	%o1,	%g2,	%g7
	movcc	%xcc,	%g1,	%o6
	movrne	%i4,	%i6,	%i2
	movl	%icc,	%g5,	%l3
	ldd	[%l7 + 0x60],	%i0
	fmovsa	%icc,	%f11,	%f20
	fnot1	%f10,	%f26
	array16	%o4,	%o5,	%l4
	sdivx	%o7,	0x14B8,	%i5
	lduh	[%l7 + 0x40],	%i3
	array32	%i7,	%l5,	%l0
	srax	%o3,	%o2,	%g4
	fmovdl	%xcc,	%f18,	%f5
	faligndata	%f18,	%f16,	%f20
	udivcc	%l6,	0x1A2E,	%g6
	fpsub16	%f28,	%f28,	%f2
	edge32ln	%l2,	%o0,	%i0
	st	%f1,	[%l7 + 0x6C]
	nop
	set	0x28, %l2
	stx	%g3,	[%l7 + %l2]
	smulcc	%l1,	0x13EE,	%g2
	movgu	%xcc,	%o1,	%g7
	fmovsne	%xcc,	%f27,	%f0
	sub	%g1,	0x1503,	%o6
	movleu	%icc,	%i6,	%i2
	ldx	[%l7 + 0x48],	%i4
	ldsb	[%l7 + 0x60],	%l3
	lduh	[%l7 + 0x64],	%i1
	movvc	%icc,	%g5,	%o5
	array16	%o4,	%o7,	%l4
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	fcmple16	%f8,	%f0,	%i3
	or	%l0,	0x164E,	%o3
	movneg	%icc,	%g4,	%o2
	array16	%l6,	%l2,	%o0
	edge32ln	%g6,	%i0,	%l1
	movre	%g3,	%g2,	%o1
	fsrc2s	%f21,	%f16
	move	%xcc,	%g7,	%o6
	or	%g1,	0x059B,	%i6
	ldd	[%l7 + 0x50],	%f8
	movgu	%xcc,	%i4,	%l3
	and	%i1,	0x0449,	%i2
	movrne	%g5,	0x3E8,	%o5
	add	%o4,	0x1EA9,	%o7
	fmovdgu	%xcc,	%f25,	%f25
	xnorcc	%l4,	0x1DF4,	%i5
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%f14
	fmovrsne	%l5,	%f26,	%f31
	sdivcc	%i3,	0x0463,	%i7
	movle	%xcc,	%l0,	%g4
	edge32n	%o2,	%l6,	%o3
	addcc	%o0,	%g6,	%l2
	array16	%l1,	%i0,	%g2
	sethi	0x1DE2,	%o1
	alignaddr	%g3,	%o6,	%g1
	ldsw	[%l7 + 0x4C],	%g7
	ldd	[%l7 + 0x38],	%i4
	edge16n	%l3,	%i6,	%i2
	smulcc	%i1,	0x14D7,	%g5
	movvs	%xcc,	%o5,	%o7
	movcc	%icc,	%l4,	%o4
	sub	%i5,	0x017D,	%i3
	array8	%l5,	%i7,	%l0
	sdivx	%o2,	0x0FF9,	%g4
	fmovrde	%l6,	%f18,	%f16
	std	%f12,	[%l7 + 0x18]
	movgu	%icc,	%o0,	%o3
	fmovdleu	%xcc,	%f4,	%f6
	fandnot1	%f30,	%f6,	%f8
	ldsw	[%l7 + 0x1C],	%g6
	movle	%icc,	%l1,	%i0
	edge8	%g2,	%l2,	%o1
	stw	%g3,	[%l7 + 0x5C]
	alignaddrl	%g1,	%g7,	%i4
	fmovdl	%xcc,	%f20,	%f7
	andn	%l3,	%o6,	%i2
	array8	%i1,	%g5,	%o5
	orcc	%i6,	%o7,	%o4
	sdivx	%l4,	0x10DD,	%i5
	movle	%icc,	%l5,	%i3
	edge8l	%l0,	%i7,	%g4
	srlx	%o2,	0x06,	%o0
	movneg	%icc,	%l6,	%o3
	stb	%l1,	[%l7 + 0x1B]
	srl	%i0,	0x13,	%g2
	st	%f22,	[%l7 + 0x40]
	fsrc2	%f24,	%f0
	ldsw	[%l7 + 0x2C],	%l2
	fone	%f30
	or	%o1,	%g6,	%g1
	or	%g3,	0x1C29,	%i4
	sra	%g7,	%l3,	%o6
	and	%i2,	0x024C,	%i1
	movg	%icc,	%o5,	%g5
	xor	%o7,	0x13A3,	%i6
	andncc	%l4,	%o4,	%l5
	andn	%i3,	0x1765,	%i5
	ld	[%l7 + 0x24],	%f15
	edge32	%l0,	%i7,	%g4
	movn	%xcc,	%o0,	%l6
	move	%xcc,	%o3,	%l1
	sdivx	%i0,	0x16CC,	%o2
	movcc	%xcc,	%g2,	%l2
	fnands	%f27,	%f30,	%f29
	edge32	%g6,	%g1,	%o1
	ldd	[%l7 + 0x50],	%i4
	udivx	%g3,	0x11C5,	%g7
	fnot1s	%f20,	%f23
	ld	[%l7 + 0x20],	%f19
	or	%o6,	0x1797,	%i2
	fmovrdne	%l3,	%f22,	%f14
	sdivcc	%o5,	0x196E,	%g5
	umul	%o7,	0x0105,	%i6
	fnot1s	%f30,	%f11
	sdivcc	%i1,	0x024B,	%l4
	movg	%xcc,	%l5,	%i3
	movge	%xcc,	%i5,	%l0
	subc	%o4,	0x1AAE,	%g4
	mulx	%i7,	0x1330,	%l6
	fcmple16	%f22,	%f26,	%o3
	fandnot1s	%f27,	%f12,	%f11
	subc	%o0,	%i0,	%l1
	stx	%g2,	[%l7 + 0x58]
	move	%xcc,	%l2,	%g6
	movl	%xcc,	%g1,	%o2
	ldsh	[%l7 + 0x12],	%o1
	srlx	%i4,	%g7,	%o6
	andn	%i2,	0x1075,	%l3
	edge16ln	%g3,	%g5,	%o5
	movleu	%icc,	%o7,	%i6
	edge16n	%i1,	%l5,	%l4
	addccc	%i5,	0x058B,	%i3
	edge16ln	%o4,	%g4,	%l0
	orncc	%i7,	%o3,	%o0
	fmovdle	%icc,	%f10,	%f29
	fabss	%f12,	%f22
	xnor	%l6,	0x0B6D,	%i0
	udivx	%l1,	0x1696,	%g2
	fcmpeq16	%f4,	%f24,	%g6
	sdiv	%g1,	0x0B8D,	%l2
	std	%f10,	[%l7 + 0x10]
	lduw	[%l7 + 0x3C],	%o1
	udivx	%i4,	0x095C,	%o2
	fmovsvs	%icc,	%f17,	%f9
	movle	%icc,	%o6,	%i2
	movge	%icc,	%g7,	%l3
	movne	%xcc,	%g5,	%g3
	alignaddrl	%o7,	%i6,	%i1
	fands	%f27,	%f19,	%f20
	popc	0x0A58,	%o5
	alignaddr	%l4,	%i5,	%l5
	edge16	%i3,	%o4,	%g4
	fcmpgt32	%f26,	%f2,	%l0
	edge32n	%o3,	%o0,	%i7
	edge8ln	%l6,	%l1,	%i0
	subcc	%g6,	0x197A,	%g1
	movl	%xcc,	%g2,	%l2
	array8	%o1,	%o2,	%i4
	udiv	%i2,	0x1821,	%o6
	fmovsge	%icc,	%f0,	%f0
	mova	%xcc,	%l3,	%g7
	movrgez	%g3,	0x283,	%g5
	fmovrsne	%i6,	%f31,	%f0
	movrlz	%o7,	%o5,	%l4
	movgu	%xcc,	%i5,	%l5
	alignaddrl	%i3,	%o4,	%g4
	stw	%l0,	[%l7 + 0x38]
	movne	%icc,	%o3,	%i1
	lduw	[%l7 + 0x48],	%o0
	fxnor	%f6,	%f0,	%f8
	srl	%l6,	%l1,	%i7
	fpadd16	%f6,	%f8,	%f26
	ldub	[%l7 + 0x64],	%i0
	move	%icc,	%g6,	%g2
	nop
	set	0x50, %i4
	ldd	[%l7 + %i4],	%l2
	xnorcc	%g1,	0x18D8,	%o2
	edge16l	%i4,	%o1,	%i2
	array16	%l3,	%o6,	%g7
	movrlez	%g3,	0x0BE,	%g5
	edge16l	%o7,	%o5,	%i6
	addc	%l4,	%l5,	%i5
	st	%f20,	[%l7 + 0x58]
	movle	%icc,	%i3,	%g4
	fnot2s	%f17,	%f6
	fmovrdlez	%o4,	%f6,	%f8
	alignaddrl	%l0,	%o3,	%o0
	movvc	%icc,	%i1,	%l6
	addccc	%l1,	0x1FD5,	%i0
	xnorcc	%i7,	0x0DA2,	%g6
	lduh	[%l7 + 0x3E],	%g2
	fpack32	%f0,	%f22,	%f0
	ldd	[%l7 + 0x38],	%f14
	srl	%l2,	%o2,	%i4
	edge8	%g1,	%i2,	%l3
	fmovrdgz	%o6,	%f24,	%f10
	smulcc	%g7,	%o1,	%g3
	edge16n	%o7,	%o5,	%g5
	ld	[%l7 + 0x18],	%f28
	movn	%icc,	%l4,	%i6
	movrne	%i5,	0x3B1,	%i3
	ld	[%l7 + 0x3C],	%f12
	edge32l	%g4,	%o4,	%l0
	save %o3, 0x030D, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o0,	0x1B9C,	%i1
	mulscc	%l6,	%i0,	%i7
	and	%g6,	%g2,	%l2
	mulscc	%l1,	%i4,	%o2
	array16	%i2,	%g1,	%o6
	fmul8x16au	%f15,	%f15,	%f30
	fornot2s	%f3,	%f26,	%f19
	smulcc	%g7,	%l3,	%g3
	fnot2s	%f17,	%f23
	addcc	%o7,	%o5,	%g5
	lduh	[%l7 + 0x2A],	%l4
	movrlez	%o1,	0x19A,	%i5
	smulcc	%i3,	0x0A91,	%g4
	movneg	%xcc,	%o4,	%i6
	fxor	%f14,	%f16,	%f26
	udivx	%o3,	0x115D,	%l0
	movvs	%icc,	%l5,	%i1
	movleu	%xcc,	%l6,	%i0
	edge8n	%o0,	%g6,	%g2
	orncc	%l2,	%l1,	%i4
	movge	%xcc,	%o2,	%i2
	ldsb	[%l7 + 0x54],	%i7
	xorcc	%o6,	0x0971,	%g7
	fpadd32s	%f15,	%f31,	%f5
	fzeros	%f24
	andncc	%g1,	%g3,	%o7
	movcc	%icc,	%o5,	%l3
	fabss	%f10,	%f23
	sra	%g5,	0x03,	%o1
	movrlez	%i5,	%l4,	%g4
	or	%i3,	0x1990,	%o4
	ldub	[%l7 + 0x08],	%i6
	fnegs	%f27,	%f17
	srlx	%o3,	%l5,	%i1
	sll	%l6,	0x09,	%i0
	sllx	%o0,	%g6,	%g2
	orcc	%l2,	0x057E,	%l1
	save %i4, %l0, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i2,	[%l7 + 0x78]
	movcs	%icc,	%i7,	%g7
	edge32l	%o6,	%g3,	%g1
	edge16ln	%o7,	%l3,	%g5
	fpadd16	%f30,	%f18,	%f8
	fmul8x16	%f28,	%f6,	%f6
	or	%o5,	%i5,	%o1
	addc	%l4,	0x07A1,	%g4
	ldsw	[%l7 + 0x20],	%i3
	alignaddr	%o4,	%o3,	%l5
	array16	%i1,	%i6,	%l6
	movge	%xcc,	%o0,	%g6
	movvs	%icc,	%g2,	%l2
	subccc	%l1,	0x05DE,	%i4
	fornot1s	%f26,	%f0,	%f13
	fmovsvc	%icc,	%f10,	%f14
	udivx	%i0,	0x1CBF,	%o2
	fmovrse	%i2,	%f27,	%f13
	fmovsa	%xcc,	%f17,	%f13
	ldub	[%l7 + 0x6B],	%i7
	fmovrse	%g7,	%f25,	%f23
	xnorcc	%l0,	0x17C2,	%g3
	fmovdvs	%icc,	%f1,	%f31
	add	%g1,	0x04A5,	%o7
	fmovdcc	%icc,	%f20,	%f27
	smul	%o6,	0x1DF0,	%l3
	fcmple32	%f20,	%f0,	%g5
	fmovsgu	%xcc,	%f14,	%f28
	popc	%o5,	%o1
	array8	%i5,	%l4,	%i3
	std	%f30,	[%l7 + 0x28]
	movleu	%icc,	%o4,	%g4
	nop
	set	0x7C, %i1
	stb	%o3,	[%l7 + %i1]
	sdiv	%i1,	0x1F35,	%i6
	sth	%l6,	[%l7 + 0x4A]
	orn	%o0,	0x0297,	%g6
	sll	%l5,	%l2,	%l1
	edge32	%i4,	%i0,	%o2
	movneg	%xcc,	%g2,	%i7
	addc	%g7,	0x11EB,	%i2
	movvc	%xcc,	%l0,	%g1
	ldx	[%l7 + 0x30],	%g3
	stx	%o6,	[%l7 + 0x68]
	fnor	%f4,	%f14,	%f30
	edge16ln	%l3,	%g5,	%o7
	move	%xcc,	%o5,	%o1
	bshuffle	%f14,	%f10,	%f4
	umulcc	%i5,	%i3,	%o4
	fmuld8sux16	%f25,	%f14,	%f6
	fmovsg	%icc,	%f19,	%f2
	mulx	%l4,	0x194D,	%g4
	mulscc	%i1,	0x1D27,	%i6
	restore %l6, 0x08B7, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g6,	0x18,	%l5
	umul	%l2,	0x087E,	%l1
	xorcc	%o3,	%i0,	%i4
	srax	%o2,	%i7,	%g2
	edge32n	%g7,	%i2,	%l0
	subccc	%g1,	%g3,	%l3
	std	%f14,	[%l7 + 0x40]
	andn	%o6,	%g5,	%o5
	fmovdle	%icc,	%f6,	%f0
	smulcc	%o1,	%i5,	%o7
	fmul8x16al	%f13,	%f26,	%f16
	sllx	%i3,	0x1F,	%o4
	movge	%xcc,	%l4,	%g4
	edge8ln	%i6,	%i1,	%o0
	fcmpgt32	%f26,	%f24,	%l6
	mulx	%g6,	0x0237,	%l2
	array16	%l1,	%l5,	%i0
	andncc	%i4,	%o3,	%i7
	fandnot2	%f26,	%f20,	%f16
	popc	0x04F7,	%g2
	andcc	%o2,	0x1CB7,	%g7
	fmovdleu	%icc,	%f13,	%f15
	subcc	%i2,	0x19B6,	%g1
	fnands	%f10,	%f11,	%f17
	andn	%l0,	0x09B2,	%l3
	movgu	%icc,	%g3,	%o6
	udiv	%g5,	0x19C1,	%o1
	fmovrsne	%i5,	%f26,	%f9
	array32	%o5,	%o7,	%i3
	sll	%o4,	0x0D,	%g4
	umulcc	%l4,	0x0616,	%i6
	movrgz	%i1,	%o0,	%l6
	movge	%icc,	%l2,	%l1
	ldub	[%l7 + 0x3F],	%g6
	ldsh	[%l7 + 0x2C],	%i0
	xor	%i4,	%o3,	%i7
	fcmple16	%f20,	%f24,	%l5
	ld	[%l7 + 0x18],	%f8
	ldd	[%l7 + 0x40],	%f28
	movn	%xcc,	%g2,	%g7
	lduw	[%l7 + 0x10],	%i2
	save %g1, %l0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o2,	%g3
	andncc	%o6,	%g5,	%o1
	movrgz	%o5,	0x192,	%i5
	edge8l	%i3,	%o4,	%g4
	ldsb	[%l7 + 0x0A],	%l4
	edge8n	%o7,	%i1,	%i6
	movneg	%xcc,	%l6,	%o0
	udivcc	%l2,	0x0416,	%l1
	addccc	%i0,	0x00AC,	%i4
	edge16n	%o3,	%g6,	%l5
	array32	%i7,	%g7,	%g2
	udivcc	%i2,	0x194E,	%g1
	sra	%l3,	%l0,	%o2
	movcc	%xcc,	%g3,	%o6
	movne	%xcc,	%g5,	%o1
	fand	%f30,	%f20,	%f2
	fmovdcc	%icc,	%f18,	%f29
	sllx	%i5,	0x09,	%i3
	fmovde	%icc,	%f5,	%f29
	alignaddrl	%o5,	%o4,	%g4
	edge32ln	%l4,	%o7,	%i6
	fornot2s	%f31,	%f8,	%f8
	lduh	[%l7 + 0x72],	%l6
	fmovsg	%xcc,	%f20,	%f30
	fmovdl	%xcc,	%f26,	%f6
	movrgez	%i1,	0x2B4,	%o0
	edge8n	%l1,	%i0,	%l2
	orn	%i4,	0x06C6,	%g6
	sra	%o3,	%l5,	%g7
	add	%i7,	0x1F3D,	%g2
	addc	%i2,	%l3,	%l0
	fxnor	%f8,	%f4,	%f12
	fnot1	%f20,	%f0
	fcmpne32	%f16,	%f20,	%g1
	edge16l	%g3,	%o2,	%g5
	fpadd32s	%f2,	%f9,	%f9
	fsrc2	%f2,	%f0
	fmovrdlez	%o6,	%f14,	%f26
	subc	%o1,	%i5,	%i3
	mova	%xcc,	%o5,	%g4
	movge	%xcc,	%o4,	%o7
	movneg	%xcc,	%l4,	%l6
	edge16ln	%i6,	%i1,	%o0
	addccc	%i0,	0x1625,	%l2
	fmovsvc	%xcc,	%f13,	%f19
	xor	%l1,	0x1929,	%i4
	sub	%g6,	0x1999,	%l5
	movrgz	%o3,	0x1DA,	%i7
	movn	%icc,	%g2,	%i2
	fmovse	%icc,	%f0,	%f7
	fnot1s	%f15,	%f14
	fpadd16s	%f16,	%f13,	%f26
	orcc	%g7,	0x0DFD,	%l0
	andncc	%g1,	%l3,	%o2
	smulcc	%g5,	0x1627,	%o6
	fnor	%f0,	%f18,	%f8
	movge	%icc,	%g3,	%i5
	srl	%i3,	%o5,	%g4
	edge32ln	%o4,	%o1,	%o7
	edge16l	%l6,	%i6,	%l4
	lduh	[%l7 + 0x16],	%o0
	umul	%i0,	0x0BAD,	%i1
	add	%l2,	0x0081,	%l1
	movvc	%icc,	%i4,	%l5
	smul	%o3,	%i7,	%g6
	add	%i2,	0x11DC,	%g7
	fmovsvc	%xcc,	%f30,	%f29
	edge8l	%l0,	%g1,	%l3
	sdiv	%o2,	0x003A,	%g5
	fmovsvc	%icc,	%f7,	%f6
	umulcc	%o6,	0x0EBF,	%g3
	save %i5, %g2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g4,	%i3,	%o4
	orncc	%o7,	%o1,	%i6
	orncc	%l4,	%o0,	%i0
	edge16	%l6,	%l2,	%i1
	andncc	%l1,	%i4,	%l5
	addccc	%i7,	%g6,	%o3
	ldd	[%l7 + 0x10],	%f10
	ldx	[%l7 + 0x50],	%i2
	fcmpd	%fcc3,	%f28,	%f10
	sdivcc	%l0,	0x15D2,	%g7
	fandnot1s	%f4,	%f13,	%f2
	srlx	%g1,	%o2,	%g5
	mulscc	%o6,	0x0CD5,	%g3
	edge8ln	%i5,	%l3,	%o5
	fabss	%f13,	%f26
	fornot1s	%f0,	%f24,	%f5
	movrlz	%g4,	%i3,	%g2
	andn	%o7,	0x077B,	%o4
	srlx	%i6,	0x0B,	%o1
	sdivx	%l4,	0x0A29,	%i0
	udivx	%l6,	0x199E,	%l2
	ldd	[%l7 + 0x60],	%o0
	lduh	[%l7 + 0x6A],	%l1
	udiv	%i4,	0x0125,	%i1
	lduh	[%l7 + 0x3E],	%l5
	lduw	[%l7 + 0x7C],	%g6
	movrlz	%i7,	%o3,	%i2
	ldsw	[%l7 + 0x30],	%g7
	orn	%l0,	0x1CF3,	%o2
	save %g1, 0x1429, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g5,	0x1C77,	%g3
	nop
	set	0x16, %o3
	sth	%i5,	[%l7 + %o3]
	fnors	%f10,	%f24,	%f19
	movg	%xcc,	%l3,	%g4
	mova	%icc,	%o5,	%g2
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%i2
	fmovspos	%icc,	%f30,	%f6
	lduw	[%l7 + 0x24],	%o7
	xorcc	%i6,	%o4,	%o1
	fnot2	%f8,	%f28
	orncc	%i0,	0x1967,	%l6
	fnands	%f19,	%f29,	%f5
	lduw	[%l7 + 0x1C],	%l4
	movre	%l2,	%o0,	%l1
	umulcc	%i1,	0x14D9,	%l5
	fmovs	%f9,	%f15
	umul	%g6,	0x0735,	%i7
	move	%icc,	%o3,	%i4
	add	%i2,	0x0661,	%g7
	and	%l0,	0x1A4E,	%g1
	subcc	%o2,	%o6,	%g5
	std	%f16,	[%l7 + 0x18]
	umul	%g3,	0x1E82,	%l3
	orncc	%i5,	0x00FC,	%o5
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	edge16ln	%g2,	%o7,	%i6
	orncc	%o1,	0x072B,	%o4
	orncc	%l6,	0x11D7,	%l4
	smul	%i0,	0x07AD,	%o0
	fpackfix	%f8,	%f0
	lduh	[%l7 + 0x4A],	%l1
	sdivcc	%l2,	0x1325,	%i1
	sir	0x13BD
	andcc	%g6,	0x1260,	%l5
	move	%xcc,	%i7,	%o3
	faligndata	%f14,	%f26,	%f12
	udivcc	%i2,	0x09E8,	%g7
	edge16n	%i4,	%g1,	%o2
	alignaddr	%o6,	%g5,	%l0
	pdist	%f0,	%f6,	%f28
	fmovrdne	%l3,	%f2,	%f24
	fmovrslz	%i5,	%f19,	%f16
	subc	%o5,	0x17F8,	%g3
	edge32n	%g4,	%i3,	%o7
	movn	%xcc,	%g2,	%i6
	fornot1	%f30,	%f0,	%f14
	edge32l	%o4,	%o1,	%l6
	fand	%f10,	%f8,	%f26
	andcc	%i0,	%o0,	%l4
	edge32ln	%l2,	%l1,	%i1
	nop
	set	0x08, %l1
	ldsh	[%l7 + %l1],	%l5
	fzero	%f14
	movrgez	%g6,	0x08E,	%i7
	popc	%i2,	%o3
	movre	%i4,	%g1,	%g7
	sra	%o2,	0x1F,	%g5
	fmuld8sux16	%f11,	%f0,	%f24
	fmovrslez	%o6,	%f16,	%f29
	std	%f22,	[%l7 + 0x48]
	addc	%l3,	0x1293,	%l0
	fcmped	%fcc3,	%f14,	%f30
	andcc	%i5,	0x1F51,	%o5
	movg	%icc,	%g3,	%g4
	mulscc	%i3,	%g2,	%o7
	umul	%i6,	0x1EEF,	%o4
	edge32	%l6,	%i0,	%o1
	sdiv	%o0,	0x1EFB,	%l4
	fandnot2	%f8,	%f16,	%f20
	fmuld8sux16	%f9,	%f17,	%f16
	udiv	%l1,	0x084F,	%i1
	movrgz	%l5,	%g6,	%l2
	orn	%i2,	0x0858,	%o3
	edge16l	%i7,	%g1,	%i4
	addcc	%g7,	0x1524,	%o2
	sdiv	%g5,	0x0FB4,	%l3
	fpadd32s	%f29,	%f4,	%f6
	movvc	%icc,	%o6,	%i5
	andncc	%o5,	%l0,	%g3
	fnand	%f10,	%f14,	%f22
	edge16ln	%g4,	%g2,	%o7
	and	%i6,	0x0326,	%o4
	fandnot1	%f4,	%f0,	%f22
	fcmpeq16	%f20,	%f10,	%l6
	mova	%icc,	%i0,	%i3
	sub	%o1,	0x1A0B,	%o0
	udivx	%l4,	0x12D0,	%i1
	edge32	%l1,	%l5,	%g6
	orcc	%l2,	%i2,	%o3
	xnor	%i7,	%g1,	%g7
	array16	%o2,	%g5,	%l3
	andcc	%o6,	%i4,	%i5
	movrlz	%o5,	%l0,	%g4
	ldx	[%l7 + 0x10],	%g3
	restore %o7, %i6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l6,	%g2,	%i3
	subccc	%o1,	%o0,	%i0
	edge16ln	%i1,	%l1,	%l5
	fornot2s	%f10,	%f2,	%f17
	fexpand	%f2,	%f2
	movrlz	%g6,	%l4,	%i2
	edge8n	%l2,	%i7,	%g1
	lduw	[%l7 + 0x58],	%o3
	fpackfix	%f14,	%f2
	edge16ln	%g7,	%g5,	%l3
	movg	%xcc,	%o6,	%i4
	xnor	%o2,	%o5,	%i5
	andncc	%g4,	%l0,	%o7
	ldd	[%l7 + 0x50],	%i6
	fornot2	%f30,	%f6,	%f10
	ld	[%l7 + 0x58],	%f30
	movneg	%icc,	%g3,	%o4
	edge8ln	%l6,	%i3,	%o1
	array32	%o0,	%i0,	%i1
	ldd	[%l7 + 0x28],	%g2
	sll	%l1,	0x03,	%l5
	addccc	%l4,	%g6,	%i2
	sll	%l2,	0x08,	%g1
	udiv	%o3,	0x0B74,	%i7
	save %g7, %l3, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i4,	%o2,	%g5
	movrlz	%i5,	0x26E,	%g4
	andncc	%o5,	%o7,	%l0
	sllx	%g3,	%i6,	%o4
	srlx	%l6,	%o1,	%i3
	edge32ln	%i0,	%o0,	%i1
	xnor	%g2,	%l5,	%l1
	movg	%xcc,	%g6,	%i2
	fpadd16	%f22,	%f24,	%f4
	popc	%l4,	%g1
	movpos	%xcc,	%l2,	%o3
	fmovs	%f5,	%f19
	movn	%icc,	%i7,	%l3
	udiv	%g7,	0x0244,	%o6
	add	%i4,	%g5,	%i5
	edge32ln	%o2,	%g4,	%o7
	save %o5, %l0, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o4,	%l6,	%o1
	ldd	[%l7 + 0x20],	%f26
	edge8n	%i3,	%i0,	%o0
	alignaddr	%g3,	%i1,	%g2
	fmovdvc	%icc,	%f0,	%f15
	fmovsa	%icc,	%f3,	%f5
	edge8ln	%l5,	%g6,	%l1
	fmovrsgz	%l4,	%f8,	%f29
	udivcc	%i2,	0x0001,	%g1
	edge8l	%l2,	%o3,	%l3
	edge8n	%g7,	%o6,	%i4
	subc	%g5,	0x073D,	%i7
	fmovdg	%xcc,	%f4,	%f24
	subcc	%o2,	%i5,	%o7
	sdivx	%o5,	0x04ED,	%l0
	sir	0x0C82
	andn	%g4,	0x1779,	%i6
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	smul	%l6,	%i0,	%o0
	ld	[%l7 + 0x70],	%f29
	mova	%xcc,	%i1,	%g3
	xnor	%g2,	%l5,	%l1
	sdivcc	%g6,	0x10A4,	%i2
	fcmpeq16	%f4,	%f28,	%g1
	srlx	%l2,	0x1A,	%l4
	edge16l	%o3,	%g7,	%l3
	fcmpne16	%f10,	%f22,	%o6
	stb	%g5,	[%l7 + 0x11]
	srl	%i7,	0x14,	%o2
	std	%f20,	[%l7 + 0x28]
	std	%f2,	[%l7 + 0x58]
	srl	%i4,	%i5,	%o7
	edge32	%l0,	%g4,	%i6
	fmovsgu	%icc,	%f18,	%f18
	movcc	%icc,	%o5,	%o1
	ldsw	[%l7 + 0x54],	%i3
	fcmpeq16	%f18,	%f12,	%l6
	movcs	%icc,	%o4,	%o0
	fmovrde	%i1,	%f16,	%f14
	fors	%f3,	%f30,	%f12
	array8	%i0,	%g2,	%l5
	srlx	%g3,	0x12,	%g6
	st	%f15,	[%l7 + 0x30]
	orncc	%l1,	%g1,	%l2
	sll	%l4,	0x14,	%i2
	edge16ln	%o3,	%g7,	%o6
	fcmpeq32	%f8,	%f16,	%l3
	edge16n	%g5,	%i7,	%o2
	subc	%i5,	%i4,	%o7
	fzero	%f4
	mova	%icc,	%g4,	%i6
	sdivcc	%o5,	0x0B27,	%o1
	fpsub32s	%f6,	%f25,	%f2
	movrlez	%l0,	0x08C,	%l6
	movre	%i3,	0x382,	%o4
	movcc	%xcc,	%i1,	%o0
	umulcc	%i0,	%l5,	%g3
	fors	%f0,	%f16,	%f6
	save %g6, %l1, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g2,	%l4,	%l2
	fmovsl	%icc,	%f11,	%f13
	sub	%o3,	%g7,	%i2
	mova	%xcc,	%o6,	%g5
	sdivcc	%l3,	0x1504,	%i7
	fornot2	%f8,	%f22,	%f26
	edge16ln	%i5,	%o2,	%o7
	fmovspos	%icc,	%f4,	%f6
	sub	%g4,	%i4,	%i6
	movleu	%xcc,	%o1,	%l0
	bshuffle	%f18,	%f22,	%f0
	mulscc	%l6,	%o5,	%o4
	or	%i1,	0x0906,	%o0
	and	%i0,	0x12FA,	%i3
	fmovsgu	%xcc,	%f12,	%f24
	movrgez	%l5,	%g3,	%l1
	sll	%g6,	0x18,	%g1
	movleu	%xcc,	%g2,	%l2
	edge8n	%o3,	%l4,	%g7
	movvc	%xcc,	%i2,	%o6
	fornot2	%f2,	%f28,	%f28
	orcc	%g5,	%i7,	%i5
	udivcc	%l3,	0x0521,	%o2
	fmovdleu	%icc,	%f23,	%f16
	edge32n	%o7,	%i4,	%g4
	mova	%xcc,	%o1,	%i6
	movl	%icc,	%l0,	%o5
	mulx	%l6,	%i1,	%o0
	nop
	set	0x28, %i3
	ldx	[%l7 + %i3],	%i0
	ldsw	[%l7 + 0x74],	%o4
	movrgz	%i3,	0x391,	%g3
	sethi	0x1F7C,	%l1
	sll	%l5,	%g1,	%g6
	addccc	%l2,	0x0501,	%g2
	fcmpgt16	%f30,	%f26,	%l4
	edge32ln	%o3,	%g7,	%i2
	sdivx	%g5,	0x1BE8,	%o6
	fpmerge	%f27,	%f11,	%f30
	sir	0x1FB3
	ld	[%l7 + 0x48],	%f1
	fcmps	%fcc1,	%f23,	%f5
	restore %i5, 0x03E1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i7,	%o2
	srax	%i4,	0x1F,	%g4
	std	%f28,	[%l7 + 0x10]
	addcc	%o7,	0x13D8,	%i6
	mova	%xcc,	%l0,	%o5
	sethi	0x1F12,	%l6
	srl	%i1,	%o1,	%o0
	movre	%i0,	0x153,	%o4
	array32	%i3,	%g3,	%l5
	array32	%g1,	%g6,	%l1
	xnorcc	%g2,	0x0471,	%l4
	movn	%icc,	%o3,	%g7
	edge8	%i2,	%l2,	%o6
	fmovsleu	%icc,	%f5,	%f26
	fmovspos	%icc,	%f26,	%f10
	or	%i5,	%g5,	%i7
	move	%xcc,	%l3,	%i4
	smul	%o2,	%g4,	%o7
	array16	%i6,	%l0,	%o5
	srlx	%i1,	%o1,	%l6
	movcc	%icc,	%i0,	%o4
	fcmps	%fcc1,	%f27,	%f4
	fcmpgt32	%f24,	%f4,	%o0
	sethi	0x150F,	%g3
	subccc	%l5,	%g1,	%g6
	fmovdl	%xcc,	%f30,	%f7
	alignaddrl	%i3,	%g2,	%l1
	fcmped	%fcc0,	%f26,	%f18
	movl	%xcc,	%l4,	%o3
	array8	%i2,	%l2,	%g7
	addc	%i5,	%o6,	%i7
	fmovdcs	%xcc,	%f4,	%f10
	movre	%g5,	%l3,	%i4
	mulx	%g4,	%o7,	%o2
	andcc	%l0,	%i6,	%i1
	movvs	%xcc,	%o5,	%o1
	srlx	%l6,	0x16,	%o4
	sra	%o0,	%g3,	%i0
	siam	0x0
	fandnot1	%f6,	%f0,	%f30
	movrgz	%l5,	%g1,	%i3
	sll	%g2,	0x1D,	%g6
	fmovdge	%xcc,	%f1,	%f23
	orcc	%l4,	%l1,	%i2
	fmovscs	%xcc,	%f26,	%f6
	stx	%o3,	[%l7 + 0x70]
	ld	[%l7 + 0x44],	%f15
	alignaddrl	%g7,	%l2,	%i5
	andncc	%i7,	%o6,	%g5
	array8	%l3,	%i4,	%g4
	nop
	set	0x74, %i7
	ldsh	[%l7 + %i7],	%o2
	fandnot2	%f14,	%f6,	%f14
	sdivcc	%l0,	0x1E80,	%o7
	sdivx	%i6,	0x004F,	%o5
	fmovsvs	%icc,	%f18,	%f31
	movrgz	%i1,	%o1,	%o4
	st	%f11,	[%l7 + 0x20]
	fmuld8sux16	%f15,	%f14,	%f16
	movn	%icc,	%o0,	%l6
	edge32	%i0,	%g3,	%g1
	alignaddrl	%l5,	%g2,	%g6
	xnorcc	%l4,	%l1,	%i3
	fmovrdgez	%i2,	%f26,	%f18
	add	%o3,	0x11F9,	%g7
	alignaddr	%i5,	%l2,	%i7
	stb	%g5,	[%l7 + 0x46]
	fcmpes	%fcc3,	%f4,	%f5
	edge32ln	%l3,	%o6,	%i4
	fmovrdne	%g4,	%f4,	%f22
	array8	%o2,	%o7,	%l0
	udivcc	%o5,	0x0C82,	%i1
	fnot1	%f28,	%f10
	movrlez	%i6,	%o1,	%o4
	umulcc	%l6,	%o0,	%i0
	udivx	%g3,	0x19FC,	%g1
	edge16l	%g2,	%l5,	%l4
	xnorcc	%l1,	0x1EE3,	%g6
	addcc	%i2,	%i3,	%g7
	fnot1	%f2,	%f10
	sdivx	%o3,	0x18E2,	%l2
	orcc	%i7,	0x003F,	%g5
	and	%i5,	%l3,	%i4
	sdiv	%g4,	0x01C5,	%o6
	st	%f21,	[%l7 + 0x74]
	sth	%o2,	[%l7 + 0x68]
	array16	%l0,	%o7,	%i1
	edge32n	%o5,	%i6,	%o4
	fcmple32	%f20,	%f4,	%o1
	faligndata	%f4,	%f22,	%f4
	sth	%o0,	[%l7 + 0x30]
	lduh	[%l7 + 0x56],	%i0
	edge8ln	%l6,	%g3,	%g1
	ldsw	[%l7 + 0x14],	%l5
	fmul8sux16	%f10,	%f0,	%f30
	popc	0x1D37,	%g2
	edge8	%l4,	%l1,	%g6
	add	%i2,	0x1FE5,	%g7
	fand	%f20,	%f0,	%f24
	stx	%i3,	[%l7 + 0x48]
	fmuld8ulx16	%f27,	%f31,	%f14
	srl	%o3,	%i7,	%l2
	edge32l	%i5,	%l3,	%i4
	movg	%xcc,	%g4,	%o6
	std	%f22,	[%l7 + 0x48]
	stb	%g5,	[%l7 + 0x2E]
	movge	%xcc,	%l0,	%o2
	movre	%i1,	0x29A,	%o5
	fmovsn	%icc,	%f20,	%f19
	mulx	%o7,	0x1B37,	%i6
	lduh	[%l7 + 0x0E],	%o4
	fpsub16	%f20,	%f24,	%f22
	edge16l	%o0,	%o1,	%i0
	xorcc	%g3,	0x1B5E,	%l6
	fmovsvs	%icc,	%f4,	%f3
	movvc	%icc,	%g1,	%g2
	popc	0x1929,	%l4
	fcmple32	%f16,	%f26,	%l1
	edge16ln	%l5,	%g6,	%g7
	fpack32	%f0,	%f16,	%f18
	edge32l	%i3,	%o3,	%i2
	movg	%icc,	%i7,	%l2
	move	%xcc,	%l3,	%i4
	ldsw	[%l7 + 0x48],	%i5
	mulx	%g4,	0x0B5F,	%o6
	movne	%xcc,	%l0,	%g5
	fzero	%f0
	alignaddrl	%i1,	%o5,	%o2
	xorcc	%i6,	0x0CE5,	%o7
	fmovrdlez	%o0,	%f6,	%f26
	addc	%o1,	%i0,	%g3
	movvc	%xcc,	%o4,	%g1
	stx	%l6,	[%l7 + 0x20]
	xor	%l4,	0x08C6,	%l1
	fmovrse	%g2,	%f10,	%f28
	movgu	%icc,	%g6,	%l5
	ld	[%l7 + 0x78],	%f8
	movn	%icc,	%g7,	%o3
	save %i3, 0x1EBC, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x2C],	%l2
	ld	[%l7 + 0x7C],	%f11
	fnegs	%f14,	%f0
	sth	%i2,	[%l7 + 0x2C]
	movge	%xcc,	%l3,	%i4
	addc	%g4,	0x1C93,	%o6
	movrne	%l0,	%i5,	%g5
	fmul8x16	%f11,	%f24,	%f0
	fmovdcs	%xcc,	%f14,	%f2
	sdivcc	%o5,	0x13EC,	%o2
	movrlz	%i6,	%o7,	%i1
	fmovrsne	%o0,	%f14,	%f1
	ldd	[%l7 + 0x20],	%f6
	edge32	%i0,	%o1,	%g3
	ldsw	[%l7 + 0x38],	%g1
	movneg	%icc,	%l6,	%l4
	sdivx	%o4,	0x074F,	%g2
	fpadd32	%f22,	%f18,	%f26
	sethi	0x1DA0,	%g6
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	movre	%l1,	%o3,	%i3
	mulscc	%l2,	0x1206,	%i7
	sdiv	%l3,	0x040A,	%i2
	fmovrsne	%i4,	%f26,	%f1
	alignaddrl	%o6,	%l0,	%g4
	nop
	set	0x66, %o0
	sth	%g5,	[%l7 + %o0]
	edge32l	%o5,	%o2,	%i5
	or	%o7,	0x045E,	%i6
	sth	%o0,	[%l7 + 0x14]
	alignaddr	%i1,	%i0,	%o1
	andncc	%g1,	%l6,	%l4
	movrne	%g3,	%g2,	%g6
	ldsb	[%l7 + 0x67],	%o4
	mulx	%g7,	%l1,	%o3
	ldsb	[%l7 + 0x78],	%i3
	xnor	%l5,	%l2,	%i7
	sll	%i2,	0x03,	%l3
	fmovsge	%icc,	%f19,	%f28
	fcmple16	%f20,	%f2,	%i4
	lduh	[%l7 + 0x7C],	%o6
	movrgez	%g4,	%l0,	%g5
	fornot2	%f22,	%f2,	%f14
	fands	%f30,	%f14,	%f24
	ldub	[%l7 + 0x08],	%o5
	st	%f31,	[%l7 + 0x6C]
	udiv	%i5,	0x1A84,	%o7
	sdivx	%i6,	0x064F,	%o0
	st	%f7,	[%l7 + 0x2C]
	fmovsneg	%icc,	%f27,	%f30
	mulscc	%o2,	0x1D5A,	%i1
	edge16	%i0,	%o1,	%l6
	ldsh	[%l7 + 0x0C],	%g1
	movl	%xcc,	%l4,	%g3
	sth	%g6,	[%l7 + 0x72]
	movre	%o4,	%g7,	%g2
	add	%o3,	0x039E,	%l1
	std	%f24,	[%l7 + 0x50]
	popc	0x12B2,	%l5
	movneg	%icc,	%l2,	%i3
	ldd	[%l7 + 0x70],	%i2
	alignaddrl	%i7,	%i4,	%l3
	sub	%o6,	0x1D14,	%g4
	move	%xcc,	%g5,	%l0
	addc	%i5,	0x0E59,	%o5
	movge	%xcc,	%o7,	%i6
	fmul8x16al	%f10,	%f24,	%f0
	add	%o0,	%i1,	%o2
	sir	0x111C
	xnor	%i0,	0x1996,	%o1
	movvc	%icc,	%l6,	%g1
	sethi	0x1FAB,	%g3
	movvs	%xcc,	%l4,	%o4
	fcmpes	%fcc3,	%f8,	%f16
	edge16ln	%g6,	%g2,	%g7
	addc	%l1,	%l5,	%l2
	fcmple16	%f18,	%f22,	%o3
	movleu	%icc,	%i3,	%i7
	udiv	%i2,	0x1973,	%l3
	xnorcc	%i4,	0x1E5B,	%g4
	move	%xcc,	%g5,	%l0
	fmovscs	%icc,	%f16,	%f24
	sll	%i5,	%o5,	%o7
	andn	%i6,	0x1BA2,	%o0
	fone	%f16
	fmuld8sux16	%f14,	%f24,	%f24
	movn	%icc,	%i1,	%o6
	movrgz	%o2,	0x0F5,	%o1
	edge8n	%l6,	%g1,	%g3
	fnors	%f20,	%f26,	%f15
	movrlz	%l4,	0x37C,	%o4
	movvc	%icc,	%g6,	%g2
	sra	%i0,	%l1,	%l5
	smulcc	%l2,	0x10D0,	%o3
	subcc	%g7,	%i7,	%i2
	movg	%xcc,	%l3,	%i3
	fmul8ulx16	%f2,	%f6,	%f6
	lduw	[%l7 + 0x78],	%i4
	fcmpgt32	%f24,	%f18,	%g4
	fxor	%f20,	%f2,	%f18
	fnands	%f1,	%f20,	%f19
	fnegd	%f6,	%f20
	movrne	%g5,	0x193,	%l0
	or	%i5,	0x114E,	%o5
	srl	%i6,	0x16,	%o0
	andcc	%i1,	0x094B,	%o7
	fandnot1	%f30,	%f20,	%f8
	edge16	%o6,	%o2,	%o1
	udivcc	%g1,	0x1931,	%g3
	srax	%l6,	%o4,	%g6
	fmovrdgez	%g2,	%f6,	%f0
	array16	%i0,	%l4,	%l1
	sdivcc	%l2,	0x05B9,	%l5
	movl	%xcc,	%g7,	%i7
	mulscc	%o3,	%l3,	%i2
	addccc	%i3,	0x0B50,	%i4
	fcmps	%fcc2,	%f31,	%f28
	fmovdl	%xcc,	%f30,	%f16
	addcc	%g4,	%l0,	%g5
	ldx	[%l7 + 0x10],	%i5
	movleu	%xcc,	%i6,	%o5
	smul	%o0,	0x109C,	%o7
	st	%f1,	[%l7 + 0x44]
	fzero	%f28
	fmovdvc	%xcc,	%f8,	%f22
	orn	%o6,	0x1098,	%i1
	fmovrsgez	%o2,	%f17,	%f4
	fmovrdlez	%o1,	%f4,	%f4
	ldsb	[%l7 + 0x31],	%g3
	subcc	%g1,	%o4,	%l6
	movrgz	%g6,	%i0,	%g2
	fones	%f6
	umul	%l1,	0x0C70,	%l4
	lduh	[%l7 + 0x5C],	%l5
	sra	%l2,	%g7,	%i7
	addcc	%o3,	0x196F,	%i2
	addcc	%l3,	%i3,	%i4
	subc	%g4,	%g5,	%l0
	movle	%icc,	%i6,	%o5
	andcc	%i5,	%o0,	%o6
	sub	%o7,	0x05C0,	%i1
	ldsw	[%l7 + 0x4C],	%o2
	array16	%o1,	%g3,	%o4
	movcc	%xcc,	%g1,	%g6
	movle	%xcc,	%i0,	%g2
	stw	%l6,	[%l7 + 0x60]
	sllx	%l1,	0x15,	%l4
	fpadd32s	%f19,	%f12,	%f22
	fandnot1	%f0,	%f18,	%f12
	sdiv	%l2,	0x1974,	%l5
	smul	%g7,	%i7,	%i2
	smulcc	%l3,	%i3,	%i4
	edge8l	%o3,	%g5,	%l0
	fmovsvs	%icc,	%f31,	%f14
	sth	%g4,	[%l7 + 0x3C]
	edge16	%i6,	%i5,	%o0
	sll	%o6,	%o5,	%i1
	movvs	%xcc,	%o2,	%o1
	fmovscc	%icc,	%f6,	%f5
	sll	%o7,	0x0B,	%o4
	ldsh	[%l7 + 0x58],	%g1
	edge32	%g6,	%g3,	%g2
	fmovsvs	%xcc,	%f10,	%f5
	andcc	%l6,	%l1,	%i0
	fpmerge	%f15,	%f0,	%f6
	fnot1s	%f27,	%f3
	fnot2	%f24,	%f18
	movge	%xcc,	%l2,	%l4
	fnand	%f2,	%f4,	%f12
	orncc	%l5,	%g7,	%i7
	xor	%i2,	%l3,	%i3
	orn	%i4,	0x0E41,	%g5
	movne	%xcc,	%l0,	%o3
	fmovsge	%icc,	%f7,	%f6
	sra	%i6,	%i5,	%o0
	array16	%g4,	%o5,	%i1
	fornot2	%f10,	%f10,	%f8
	udivcc	%o6,	0x11B3,	%o1
	umulcc	%o2,	0x0910,	%o7
	smul	%g1,	0x101B,	%o4
	fands	%f10,	%f15,	%f6
	subccc	%g6,	0x0F82,	%g3
	udivcc	%g2,	0x0CD4,	%l6
	movl	%xcc,	%l1,	%l2
	save %i0, 0x0BCE, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g7,	%l4,	%i2
	andcc	%i7,	0x19A6,	%i3
	popc	0x1F1F,	%i4
	andcc	%l3,	%g5,	%l0
	movle	%xcc,	%o3,	%i6
	bshuffle	%f18,	%f4,	%f14
	mulscc	%o0,	%i5,	%o5
	fsrc1s	%f20,	%f11
	xorcc	%i1,	0x1AC8,	%g4
	mulx	%o6,	0x0396,	%o2
	sth	%o1,	[%l7 + 0x46]
	ldub	[%l7 + 0x3A],	%o7
	fpackfix	%f16,	%f16
	fnot2s	%f25,	%f20
	ld	[%l7 + 0x08],	%f14
	fzero	%f2
	edge16	%o4,	%g6,	%g3
	movgu	%xcc,	%g1,	%l6
	edge32l	%g2,	%l1,	%l2
	fpsub32s	%f13,	%f30,	%f20
	movle	%xcc,	%i0,	%l5
	movrlez	%l4,	%g7,	%i7
	movrgez	%i3,	%i2,	%i4
	fcmpne16	%f10,	%f6,	%l3
	orn	%l0,	0x0A67,	%g5
	umulcc	%i6,	0x095B,	%o3
	ldub	[%l7 + 0x69],	%i5
	fcmpgt16	%f16,	%f0,	%o5
	mulscc	%i1,	%g4,	%o0
	fmovdvc	%xcc,	%f17,	%f19
	movrlez	%o6,	%o2,	%o7
	orn	%o1,	%g6,	%g3
	mulscc	%o4,	%l6,	%g1
	xnor	%g2,	%l2,	%i0
	fnot1s	%f16,	%f2
	ldsh	[%l7 + 0x74],	%l5
	addcc	%l1,	%g7,	%l4
	fmovd	%f22,	%f10
	fmovdle	%icc,	%f14,	%f17
	edge16l	%i3,	%i7,	%i2
	array32	%i4,	%l0,	%l3
	sllx	%g5,	0x0C,	%i6
	movneg	%xcc,	%o3,	%i5
	edge32n	%o5,	%g4,	%o0
	fcmpd	%fcc3,	%f26,	%f0
	movrne	%o6,	%i1,	%o7
	xor	%o1,	0x1A72,	%o2
	movleu	%xcc,	%g3,	%o4
	fcmpne32	%f24,	%f4,	%g6
	ldx	[%l7 + 0x48],	%l6
	xnor	%g1,	0x1E7B,	%l2
	mova	%xcc,	%g2,	%i0
	fmovsg	%xcc,	%f15,	%f4
	fmovsle	%xcc,	%f10,	%f11
	fmuld8sux16	%f30,	%f13,	%f4
	andcc	%l5,	0x178E,	%g7
	udivx	%l4,	0x14FB,	%i3
	fmovscc	%xcc,	%f29,	%f5
	fmovrdgez	%i7,	%f8,	%f20
	stw	%i2,	[%l7 + 0x2C]
	alignaddrl	%l1,	%l0,	%l3
	alignaddr	%g5,	%i4,	%o3
	stb	%i6,	[%l7 + 0x60]
	stw	%o5,	[%l7 + 0x28]
	ldd	[%l7 + 0x18],	%i4
	ldsw	[%l7 + 0x60],	%o0
	srl	%g4,	0x13,	%o6
	srl	%i1,	%o7,	%o1
	popc	0x0845,	%o2
	udivcc	%g3,	0x09D3,	%o4
	movpos	%icc,	%g6,	%l6
	edge8	%g1,	%g2,	%i0
	sdivx	%l5,	0x1F4A,	%g7
	array32	%l4,	%i3,	%l2
	edge32	%i7,	%i2,	%l0
	sll	%l1,	%l3,	%g5
	movcs	%icc,	%i4,	%i6
	sll	%o5,	0x1A,	%o3
	fmovspos	%icc,	%f10,	%f23
	smulcc	%o0,	0x1FE2,	%i5
	movne	%icc,	%o6,	%g4
	stx	%i1,	[%l7 + 0x30]
	fmovsne	%icc,	%f2,	%f12
	stb	%o7,	[%l7 + 0x7F]
	movrgez	%o1,	%g3,	%o2
	lduw	[%l7 + 0x6C],	%g6
	xorcc	%o4,	%g1,	%g2
	fmovdle	%xcc,	%f17,	%f22
	fsrc2s	%f18,	%f13
	sdivcc	%i0,	0x1F68,	%l6
	movre	%g7,	0x0B1,	%l5
	fpadd32s	%f20,	%f29,	%f18
	fexpand	%f8,	%f2
	nop
	set	0x78, %l6
	ldub	[%l7 + %l6],	%l4
	ldub	[%l7 + 0x45],	%l2
	smul	%i7,	0x1B1F,	%i3
	lduh	[%l7 + 0x4C],	%l0
	alignaddr	%i2,	%l3,	%g5
	movneg	%xcc,	%i4,	%l1
	movle	%icc,	%o5,	%i6
	fmovsvs	%icc,	%f17,	%f25
	move	%xcc,	%o0,	%i5
	movg	%xcc,	%o3,	%g4
	sir	0x0C51
	alignaddr	%i1,	%o6,	%o1
	ldsh	[%l7 + 0x56],	%g3
	movvs	%xcc,	%o2,	%o7
	sth	%o4,	[%l7 + 0x7E]
	popc	0x0B17,	%g1
	fpmerge	%f4,	%f30,	%f8
	edge16n	%g6,	%g2,	%i0
	movvc	%icc,	%l6,	%l5
	sdiv	%l4,	0x1B55,	%g7
	or	%i7,	%i3,	%l2
	fmul8x16au	%f19,	%f0,	%f22
	ldx	[%l7 + 0x78],	%l0
	fmovs	%f18,	%f26
	sdiv	%l3,	0x0C94,	%g5
	edge16l	%i2,	%l1,	%i4
	fmul8ulx16	%f26,	%f0,	%f16
	sllx	%o5,	%i6,	%o0
	umulcc	%o3,	%i5,	%i1
	popc	0x04EE,	%o6
	edge8	%o1,	%g4,	%g3
	udivcc	%o2,	0x187A,	%o7
	fmovsge	%xcc,	%f30,	%f12
	andcc	%g1,	0x03A5,	%o4
	fcmpeq16	%f16,	%f20,	%g2
	mulscc	%i0,	0x1DEE,	%l6
	ldd	[%l7 + 0x48],	%g6
	nop
	set	0x70, %g4
	ldsh	[%l7 + %g4],	%l4
	fxnor	%f12,	%f8,	%f14
	ld	[%l7 + 0x6C],	%f14
	edge8n	%g7,	%l5,	%i7
	stb	%i3,	[%l7 + 0x61]
	nop
	set	0x2C, %l0
	stb	%l2,	[%l7 + %l0]
	fornot2	%f2,	%f0,	%f8
	fmovsle	%icc,	%f6,	%f5
	umulcc	%l0,	%g5,	%l3
	mova	%xcc,	%l1,	%i4
	fabss	%f13,	%f1
	andncc	%i2,	%o5,	%o0
	edge32	%i6,	%o3,	%i5
	fornot2	%f2,	%f2,	%f26
	sll	%i1,	0x1D,	%o1
	sdiv	%g4,	0x1020,	%g3
	movl	%icc,	%o2,	%o6
	edge32l	%o7,	%o4,	%g2
	andcc	%g1,	%i0,	%l6
	add	%l4,	%g7,	%g6
	fmovrdgz	%l5,	%f12,	%f30
	andn	%i7,	0x0E17,	%l2
	smulcc	%i3,	%l0,	%l3
	movvs	%icc,	%g5,	%i4
	addccc	%l1,	0x0C66,	%o5
	fcmpne32	%f28,	%f18,	%o0
	edge8	%i6,	%i2,	%o3
	fmovrdlez	%i1,	%f24,	%f6
	fpadd32	%f16,	%f26,	%f30
	movre	%i5,	%g4,	%o1
	edge32	%o2,	%g3,	%o7
	fandnot1s	%f22,	%f29,	%f18
	std	%f16,	[%l7 + 0x40]
	srl	%o6,	%o4,	%g1
	add	%i0,	%l6,	%g2
	fnors	%f5,	%f6,	%f31
	ldd	[%l7 + 0x58],	%f6
	subcc	%l4,	%g7,	%l5
	fsrc2s	%f26,	%f8
	smul	%i7,	0x0975,	%g6
	nop
	set	0x34, %g6
	sth	%i3,	[%l7 + %g6]
	fmovrslez	%l2,	%f28,	%f23
	fcmpeq16	%f0,	%f30,	%l3
	popc	%l0,	%i4
	sra	%l1,	%o5,	%o0
	sdivx	%i6,	0x1104,	%i2
	xor	%g5,	%i1,	%i5
	movleu	%icc,	%g4,	%o3
	movrlz	%o2,	%o1,	%o7
	fmovsa	%xcc,	%f16,	%f29
	orncc	%o6,	0x18CA,	%g3
	save %o4, %i0, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f6,	%f22,	%f22
	stx	%g2,	[%l7 + 0x40]
	fzeros	%f6
	subcc	%l6,	0x16A0,	%l4
	fmul8ulx16	%f16,	%f6,	%f0
	orn	%l5,	%i7,	%g7
	stx	%g6,	[%l7 + 0x58]
	fnot1s	%f24,	%f9
	fabss	%f0,	%f14
	fcmps	%fcc2,	%f13,	%f18
	array8	%i3,	%l2,	%l0
	fmovdvc	%icc,	%f23,	%f1
	edge32l	%l3,	%i4,	%l1
	fexpand	%f11,	%f28
	lduw	[%l7 + 0x34],	%o0
	movneg	%xcc,	%o5,	%i2
	sll	%i6,	%i1,	%g5
	array8	%g4,	%i5,	%o3
	sdivcc	%o2,	0x1D1A,	%o1
	move	%xcc,	%o7,	%g3
	sir	0x00F3
	ldd	[%l7 + 0x70],	%o4
	addc	%i0,	0x1E7B,	%g1
	and	%o6,	0x08E8,	%g2
	srl	%l4,	0x17,	%l6
	fxors	%f6,	%f11,	%f2
	std	%f2,	[%l7 + 0x20]
	move	%xcc,	%i7,	%l5
	movg	%xcc,	%g6,	%g7
	array8	%l2,	%i3,	%l3
	subccc	%i4,	0x11A0,	%l0
	mova	%icc,	%o0,	%o5
	fpadd32s	%f1,	%f27,	%f8
	fornot2s	%f21,	%f31,	%f27
	alignaddr	%l1,	%i6,	%i2
	edge8	%g5,	%g4,	%i1
	fpadd32	%f8,	%f10,	%f6
	edge32l	%i5,	%o2,	%o3
	movleu	%xcc,	%o7,	%g3
	umul	%o4,	0x13F3,	%i0
	fmovrdlez	%g1,	%f24,	%f30
	fandnot1	%f18,	%f14,	%f20
	popc	0x0DB3,	%o1
	fexpand	%f19,	%f20
	sdiv	%g2,	0x055F,	%l4
	add	%o6,	0x17D3,	%l6
	sir	0x012E
	edge16	%l5,	%i7,	%g6
	smulcc	%g7,	0x1111,	%i3
	sra	%l3,	%i4,	%l2
	smulcc	%l0,	%o5,	%o0
	fmovsgu	%xcc,	%f25,	%f24
	fandnot2	%f30,	%f30,	%f16
	fnand	%f28,	%f6,	%f4
	xorcc	%l1,	%i2,	%g5
	xnor	%g4,	%i1,	%i5
	fnegd	%f28,	%f20
	restore %i6, 0x15D8, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o7,	%g3,	%o4
	alignaddr	%i0,	%o3,	%g1
	edge8ln	%g2,	%o1,	%o6
	lduh	[%l7 + 0x1C],	%l6
	fands	%f23,	%f31,	%f16
	stx	%l4,	[%l7 + 0x58]
	umulcc	%l5,	0x1E3E,	%g6
	edge8n	%g7,	%i7,	%l3
	srl	%i3,	%i4,	%l2
	fmovsg	%icc,	%f26,	%f3
	ld	[%l7 + 0x24],	%f21
	mulx	%l0,	%o5,	%o0
	edge16ln	%l1,	%g5,	%g4
	movne	%xcc,	%i1,	%i5
	sdivcc	%i6,	0x0192,	%i2
	fmovsneg	%icc,	%f19,	%f7
	movl	%xcc,	%o2,	%o7
	andn	%o4,	0x1A99,	%i0
	movrne	%o3,	%g3,	%g1
	movl	%icc,	%g2,	%o1
	nop
	set	0x2B, %g2
	ldub	[%l7 + %g2],	%l6
	movpos	%xcc,	%o6,	%l4
	andn	%l5,	%g6,	%i7
	andcc	%g7,	0x05C3,	%i3
	udivx	%i4,	0x1388,	%l2
	addc	%l0,	0x0292,	%l3
	alignaddr	%o0,	%l1,	%o5
	fmovse	%xcc,	%f9,	%f0
	srlx	%g4,	%i1,	%i5
	movle	%icc,	%i6,	%i2
	movrlez	%o2,	%g5,	%o7
	edge8n	%o4,	%o3,	%i0
	stx	%g1,	[%l7 + 0x58]
	edge8	%g2,	%g3,	%o1
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	edge32	%l5,	%i7,	%g6
	srax	%g7,	%i3,	%l2
	sdivx	%i4,	0x19C5,	%l3
	ldd	[%l7 + 0x58],	%f12
	srlx	%l0,	%o0,	%o5
	sdivx	%g4,	0x155B,	%l1
	sir	0x1A08
	array16	%i1,	%i5,	%i6
	edge8n	%o2,	%g5,	%o7
	ldx	[%l7 + 0x30],	%i2
	movcc	%icc,	%o3,	%i0
	subccc	%g1,	0x17E0,	%g2
	or	%o4,	0x1056,	%g3
	lduw	[%l7 + 0x40],	%o6
	ld	[%l7 + 0x44],	%f14
	fpack16	%f6,	%f2
	smulcc	%o1,	%l6,	%l5
	stx	%l4,	[%l7 + 0x08]
	xnor	%g6,	0x1419,	%i7
	movle	%icc,	%i3,	%l2
	mulx	%g7,	0x07E2,	%i4
	fand	%f10,	%f10,	%f2
	udivx	%l3,	0x115F,	%o0
	fsrc2	%f30,	%f4
	fnot2s	%f21,	%f30
	ldub	[%l7 + 0x62],	%o5
	std	%f30,	[%l7 + 0x18]
	movrlez	%g4,	0x00E,	%l0
	fmovrdgez	%l1,	%f0,	%f6
	fmovrde	%i5,	%f4,	%f16
	edge32n	%i6,	%o2,	%g5
	ldsh	[%l7 + 0x3E],	%i1
	edge8	%o7,	%i2,	%i0
	fmovsl	%xcc,	%f6,	%f7
	umulcc	%o3,	0x177D,	%g2
	umulcc	%o4,	0x100F,	%g1
	movvs	%icc,	%g3,	%o6
	edge16l	%o1,	%l5,	%l4
	ldub	[%l7 + 0x15],	%l6
	ldd	[%l7 + 0x70],	%i6
	ldsw	[%l7 + 0x48],	%i3
	ldsw	[%l7 + 0x70],	%l2
	sdivcc	%g7,	0x1A5C,	%i4
	subccc	%l3,	%g6,	%o5
	array8	%o0,	%l0,	%g4
	movneg	%xcc,	%i5,	%i6
	nop
	set	0x46, %l4
	ldub	[%l7 + %l4],	%o2
	array8	%l1,	%i1,	%o7
	save %g5, 0x0C47, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f0,	%f8
	edge8ln	%o3,	%g2,	%o4
	nop
	set	0x20, %i5
	ldd	[%l7 + %i5],	%f8
	fpsub32	%f4,	%f12,	%f4
	fzeros	%f7
	fmovscs	%xcc,	%f25,	%f29
	fnors	%f26,	%f15,	%f12
	sra	%g1,	%g3,	%i0
	addccc	%o6,	%o1,	%l5
	sra	%l4,	0x15,	%l6
	sub	%i3,	%i7,	%l2
	movrne	%g7,	0x348,	%i4
	alignaddr	%l3,	%g6,	%o0
	ldx	[%l7 + 0x08],	%l0
	or	%g4,	0x1BB6,	%o5
	movrlz	%i5,	0x00E,	%o2
	fpsub16s	%f16,	%f30,	%f22
	edge8	%l1,	%i1,	%o7
	subc	%g5,	0x17D2,	%i6
	stx	%o3,	[%l7 + 0x70]
	move	%xcc,	%g2,	%o4
	lduh	[%l7 + 0x5E],	%g1
	movneg	%xcc,	%g3,	%i0
	orcc	%i2,	0x09A5,	%o1
	ldx	[%l7 + 0x58],	%l5
	fornot1	%f2,	%f10,	%f14
	edge8l	%o6,	%l4,	%l6
	edge8n	%i3,	%l2,	%i7
	movle	%xcc,	%g7,	%i4
	movg	%xcc,	%l3,	%g6
	sth	%l0,	[%l7 + 0x2E]
	add	%o0,	0x0C8B,	%g4
	movvc	%xcc,	%i5,	%o5
	addccc	%l1,	%i1,	%o7
	andcc	%g5,	%o2,	%o3
	fmovdl	%xcc,	%f12,	%f27
	fcmple16	%f6,	%f4,	%g2
	edge8ln	%o4,	%i6,	%g1
	fabss	%f27,	%f9
	addccc	%i0,	0x1E4E,	%g3
	umul	%i2,	%o1,	%l5
	edge16l	%o6,	%l4,	%i3
	movn	%xcc,	%l6,	%i7
	edge16l	%g7,	%i4,	%l3
	fmovsne	%xcc,	%f30,	%f20
	andcc	%g6,	%l2,	%o0
	sth	%g4,	[%l7 + 0x2A]
	movrne	%i5,	0x187,	%o5
	add	%l1,	0x1723,	%l0
	udiv	%o7,	0x0FA5,	%g5
	fsrc2	%f10,	%f2
	movrne	%o2,	%o3,	%g2
	siam	0x5
	xnor	%o4,	%i1,	%i6
	orn	%i0,	0x1795,	%g3
	fmovsle	%icc,	%f3,	%f28
	stb	%g1,	[%l7 + 0x33]
	smul	%o1,	0x1B11,	%i2
	fnot2	%f22,	%f6
	xorcc	%o6,	0x149B,	%l5
	and	%i3,	%l6,	%i7
	movrgz	%l4,	%i4,	%l3
	movleu	%icc,	%g6,	%g7
	subccc	%o0,	%g4,	%l2
	or	%o5,	%i5,	%l1
	fmovrdgz	%l0,	%f16,	%f18
	subccc	%g5,	0x12D0,	%o7
	movvc	%icc,	%o3,	%o2
	fxnors	%f23,	%f3,	%f11
	nop
	set	0x7A, %g1
	ldsb	[%l7 + %g1],	%g2
	andn	%i1,	%i6,	%i0
	mulx	%g3,	%o4,	%o1
	andn	%i2,	0x0C53,	%g1
	edge8n	%l5,	%i3,	%l6
	movrgez	%o6,	%l4,	%i4
	for	%f10,	%f10,	%f6
	xor	%i7,	0x1032,	%l3
	movne	%xcc,	%g7,	%g6
	popc	%o0,	%l2
	movre	%g4,	0x065,	%o5
	srl	%i5,	0x1B,	%l1
	fmuld8ulx16	%f22,	%f18,	%f4
	fmovdcs	%xcc,	%f30,	%f31
	nop
	set	0x10, %l5
	stx	%l0,	[%l7 + %l5]
	edge16l	%o7,	%g5,	%o2
	fands	%f5,	%f13,	%f11
	movneg	%icc,	%g2,	%i1
	orcc	%o3,	%i6,	%i0
	fmovrslez	%g3,	%f14,	%f31
	movrlz	%o1,	0x2D1,	%o4
	xor	%g1,	%i2,	%l5
	fmovdpos	%xcc,	%f17,	%f15
	fpackfix	%f18,	%f19
	mulscc	%i3,	%l6,	%l4
	sth	%o6,	[%l7 + 0x26]
	movgu	%icc,	%i7,	%i4
	movrlz	%g7,	%l3,	%o0
	sll	%l2,	%g4,	%o5
	movpos	%xcc,	%i5,	%g6
	xnorcc	%l1,	%l0,	%g5
	addcc	%o7,	0x0C88,	%g2
	edge32n	%i1,	%o2,	%o3
	fnot2s	%f24,	%f19
	edge8	%i0,	%i6,	%g3
	stw	%o4,	[%l7 + 0x28]
	movpos	%xcc,	%o1,	%g1
	lduh	[%l7 + 0x7E],	%i2
	stb	%i3,	[%l7 + 0x25]
	ldd	[%l7 + 0x50],	%f16
	movge	%icc,	%l6,	%l5
	movle	%xcc,	%o6,	%l4
	movle	%icc,	%i4,	%g7
	pdist	%f8,	%f22,	%f6
	ldd	[%l7 + 0x40],	%l2
	udiv	%o0,	0x0082,	%l2
	addccc	%i7,	%o5,	%i5
	movneg	%xcc,	%g6,	%l1
	and	%l0,	0x11B7,	%g5
	smul	%g4,	0x0724,	%g2
	ldd	[%l7 + 0x50],	%f6
	ld	[%l7 + 0x44],	%f13
	fandnot2s	%f27,	%f27,	%f11
	umulcc	%o7,	0x0E0E,	%i1
	smul	%o3,	%i0,	%i6
	movcs	%icc,	%g3,	%o4
	orn	%o1,	0x1726,	%g1
	subccc	%i2,	0x194A,	%i3
	fnot1s	%f16,	%f31
	fpadd32s	%f1,	%f31,	%f23
	ldd	[%l7 + 0x48],	%i6
	orncc	%o2,	0x129A,	%l5
	movcs	%xcc,	%o6,	%i4
	edge16ln	%g7,	%l3,	%o0
	move	%icc,	%l2,	%i7
	fmovsgu	%xcc,	%f27,	%f0
	sdiv	%o5,	0x042F,	%l4
	movre	%i5,	0x21B,	%g6
	fnot2s	%f27,	%f15
	or	%l1,	0x11B2,	%g5
	udiv	%l0,	0x0444,	%g4
	ldd	[%l7 + 0x18],	%o6
	mulscc	%g2,	0x1607,	%i1
	movleu	%xcc,	%o3,	%i0
	fpadd32s	%f24,	%f3,	%f3
	lduw	[%l7 + 0x1C],	%i6
	fcmpes	%fcc0,	%f29,	%f9
	movg	%xcc,	%g3,	%o1
	movvc	%xcc,	%g1,	%i2
	udiv	%o4,	0x15C0,	%i3
	fabsd	%f12,	%f24
	sdivcc	%l6,	0x14F0,	%l5
	add	%o2,	%o6,	%i4
	array8	%g7,	%o0,	%l3
	move	%icc,	%l2,	%o5
	fnor	%f12,	%f4,	%f2
	restore %l4, %i7, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x73],	%l1
	fmovde	%xcc,	%f0,	%f11
	smulcc	%g5,	0x1A01,	%l0
	ld	[%l7 + 0x14],	%f6
	andncc	%i5,	%o7,	%g4
	xor	%i1,	0x1BA4,	%o3
	smul	%i0,	%i6,	%g3
	movleu	%icc,	%o1,	%g2
	movcc	%xcc,	%i2,	%o4
	movg	%xcc,	%g1,	%l6
	fmovrdne	%l5,	%f6,	%f24
	mulx	%o2,	%o6,	%i3
	alignaddrl	%g7,	%o0,	%i4
	movrlez	%l3,	%o5,	%l2
	movvs	%xcc,	%l4,	%g6
	lduw	[%l7 + 0x3C],	%i7
	subcc	%g5,	0x0934,	%l1
	fmovsl	%icc,	%f23,	%f2
	mulscc	%i5,	%l0,	%g4
	movge	%xcc,	%o7,	%i1
	srlx	%i0,	%i6,	%o3
	ld	[%l7 + 0x78],	%f24
	movrlez	%o1,	0x0B2,	%g2
	sra	%g3,	0x1B,	%i2
	orncc	%g1,	%l6,	%l5
	fmovde	%icc,	%f26,	%f12
	umulcc	%o4,	0x0FC1,	%o2
	fcmpeq32	%f2,	%f12,	%i3
	sub	%g7,	%o6,	%o0
	edge32l	%i4,	%o5,	%l2
	or	%l4,	0x08CA,	%g6
	ldub	[%l7 + 0x63],	%i7
	movcc	%xcc,	%g5,	%l3
	srlx	%l1,	%i5,	%l0
	edge32l	%o7,	%i1,	%i0
	fmovdn	%icc,	%f10,	%f9
	bshuffle	%f4,	%f24,	%f14
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	movvs	%xcc,	%o1,	%g3
	mulscc	%i2,	%g2,	%g1
	andcc	%l5,	%o4,	%o2
	fandnot2s	%f1,	%f0,	%f8
	movl	%icc,	%i3,	%l6
	movge	%icc,	%g7,	%o6
	fcmpeq16	%f0,	%f0,	%i4
	or	%o0,	0x1DFB,	%l2
	umul	%l4,	0x015F,	%g6
	sethi	0x0526,	%o5
	movpos	%xcc,	%i7,	%g5
	fzero	%f2
	addcc	%l3,	%l1,	%i5
	stb	%l0,	[%l7 + 0x6B]
	fmovdg	%xcc,	%f22,	%f26
	sdivcc	%o7,	0x01F0,	%i0
	ld	[%l7 + 0x48],	%f3
	ldx	[%l7 + 0x10],	%i6
	udivx	%i1,	0x1E21,	%o3
	smul	%o1,	0x0941,	%g3
	movre	%g4,	0x33D,	%i2
	xnor	%g1,	%l5,	%o4
	movl	%icc,	%g2,	%o2
	udivx	%l6,	0x10BD,	%g7
	ldd	[%l7 + 0x78],	%f0
	subcc	%o6,	0x06B9,	%i3
	sethi	0x186C,	%i4
	movcc	%icc,	%l2,	%l4
	fones	%f11
	ldd	[%l7 + 0x50],	%g6
	edge8	%o5,	%i7,	%g5
	movrne	%l3,	0x0A4,	%o0
	umul	%l1,	0x1A0C,	%l0
	xnor	%i5,	0x1CBB,	%o7
	movre	%i0,	%i6,	%o3
	movvc	%xcc,	%o1,	%g3
	std	%f20,	[%l7 + 0x30]
	edge16	%i1,	%g4,	%g1
	orn	%i2,	%l5,	%o4
	sll	%o2,	0x00,	%g2
	fmul8x16	%f23,	%f18,	%f8
	movn	%icc,	%g7,	%l6
	sdivx	%i3,	0x1D9C,	%o6
	movleu	%icc,	%l2,	%i4
	xorcc	%l4,	0x0394,	%o5
	movvc	%xcc,	%g6,	%g5
	st	%f3,	[%l7 + 0x58]
	fmovsa	%xcc,	%f12,	%f19
	edge8l	%l3,	%o0,	%l1
	st	%f11,	[%l7 + 0x68]
	fandnot1s	%f15,	%f29,	%f31
	edge8ln	%l0,	%i5,	%i7
	umulcc	%i0,	0x0081,	%i6
	ldd	[%l7 + 0x28],	%o6
	movg	%xcc,	%o3,	%o1
	movvc	%xcc,	%i1,	%g4
	std	%f2,	[%l7 + 0x10]
	edge8	%g3,	%g1,	%i2
	movne	%icc,	%o4,	%o2
	alignaddrl	%l5,	%g7,	%l6
	mova	%icc,	%g2,	%o6
	popc	%l2,	%i4
	movneg	%xcc,	%l4,	%i3
	sub	%o5,	0x0D3E,	%g5
	ldsw	[%l7 + 0x54],	%g6
	or	%o0,	0x0B46,	%l1
	xnor	%l0,	0x0C2F,	%l3
	smulcc	%i7,	0x0A3E,	%i5
	save %i6, 0x1D43, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o3,	0x06B0,	%o7
	movre	%o1,	0x014,	%i1
	udivcc	%g3,	0x0677,	%g1
	movrlz	%g4,	%o4,	%o2
	edge16n	%i2,	%l5,	%g7
	fmovdl	%icc,	%f30,	%f10
	udiv	%g2,	0x02E6,	%l6
	edge32	%o6,	%l2,	%l4
	alignaddrl	%i3,	%i4,	%g5
	fexpand	%f26,	%f12
	restore %o5, %g6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f7,	%f24
	subccc	%l0,	0x1F23,	%l3
	movrlz	%i7,	%l1,	%i5
	fcmpne16	%f28,	%f16,	%i6
	fandnot2s	%f1,	%f27,	%f5
	nop
	set	0x6E, %l3
	ldsh	[%l7 + %l3],	%i0
	ldsh	[%l7 + 0x2A],	%o3
	addcc	%o1,	%o7,	%i1
	edge16	%g1,	%g3,	%g4
	andcc	%o2,	%o4,	%l5
	fmovdcs	%xcc,	%f27,	%f11
	stb	%g7,	[%l7 + 0x79]
	andncc	%g2,	%l6,	%i2
	edge16ln	%l2,	%l4,	%i3
	xnorcc	%i4,	%o6,	%o5
	movvs	%icc,	%g6,	%g5
	movrgez	%l0,	%o0,	%i7
	lduw	[%l7 + 0x70],	%l3
	udiv	%i5,	0x0F16,	%l1
	mulx	%i6,	%i0,	%o3
	fmovscs	%xcc,	%f17,	%f31
	ld	[%l7 + 0x6C],	%f25
	sdiv	%o1,	0x15C5,	%i1
	srl	%o7,	%g1,	%g3
	array16	%g4,	%o4,	%l5
	fmovsa	%xcc,	%f4,	%f18
	ldsb	[%l7 + 0x55],	%g7
	edge8ln	%o2,	%g2,	%l6
	subcc	%i2,	%l2,	%i3
	sll	%i4,	0x18,	%o6
	edge8ln	%o5,	%l4,	%g5
	fand	%f0,	%f24,	%f0
	edge16	%g6,	%l0,	%i7
	movvc	%xcc,	%l3,	%i5
	stx	%l1,	[%l7 + 0x40]
	udivcc	%i6,	0x071F,	%o0
	movcc	%xcc,	%i0,	%o1
	sir	0x120B
	fmovrdne	%i1,	%f2,	%f24
	sll	%o3,	%g1,	%o7
	umul	%g3,	%o4,	%g4
	popc	%l5,	%g7
	edge8l	%g2,	%l6,	%o2
	fmovrse	%l2,	%f12,	%f2
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	ldsb	[%l7 + 0x2C],	%i4
	umulcc	%o5,	0x03CB,	%l4
	subc	%o6,	0x1ED8,	%g6
	ldsh	[%l7 + 0x3C],	%l0
	array32	%g5,	%l3,	%i5
	movrne	%l1,	%i7,	%o0
	movcc	%xcc,	%i0,	%i6
	stw	%o1,	[%l7 + 0x60]
	movre	%i1,	0x166,	%o3
	array16	%o7,	%g1,	%o4
	edge32n	%g3,	%l5,	%g7
	sethi	0x022A,	%g2
	fnor	%f16,	%f4,	%f18
	stb	%g4,	[%l7 + 0x1F]
	movle	%icc,	%l6,	%o2
	srlx	%l2,	0x09,	%i2
	edge8	%i4,	%o5,	%i3
	fmovsge	%xcc,	%f0,	%f2
	fmovscs	%xcc,	%f12,	%f11
	mulx	%l4,	%o6,	%l0
	fpack32	%f14,	%f16,	%f30
	mova	%icc,	%g5,	%l3
	orcc	%g6,	%i5,	%i7
	fmovda	%icc,	%f2,	%f4
	stb	%l1,	[%l7 + 0x12]
	ldd	[%l7 + 0x28],	%f14
	fnot1	%f12,	%f2
	movrlez	%o0,	0x0FC,	%i6
	fmovsvc	%xcc,	%f1,	%f18
	movneg	%xcc,	%i0,	%o1
	fmovsn	%xcc,	%f28,	%f14
	stb	%o3,	[%l7 + 0x15]
	array8	%i1,	%g1,	%o7
	array16	%g3,	%l5,	%g7
	xor	%g2,	%o4,	%g4
	ldd	[%l7 + 0x58],	%o2
	bshuffle	%f16,	%f4,	%f30
	fmovrdlz	%l2,	%f12,	%f28
	movcc	%xcc,	%l6,	%i2
	addcc	%o5,	0x1667,	%i3
	mova	%icc,	%i4,	%l4
	udiv	%o6,	0x05F7,	%l0
	movn	%xcc,	%g5,	%l3
	fsrc1	%f22,	%f10
	addc	%i5,	%i7,	%g6
	movg	%icc,	%o0,	%i6
	fornot2	%f0,	%f26,	%f16
	edge16	%i0,	%l1,	%o1
	siam	0x2
	array16	%o3,	%i1,	%o7
	fmovscc	%icc,	%f2,	%f23
	fpsub16	%f26,	%f28,	%f20
	save %g3, 0x14F3, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%xcc,	%f27,	%f27
	umulcc	%g7,	0x030E,	%l5
	movcs	%icc,	%o4,	%g4
	sub	%o2,	%g2,	%l2
	fpsub32	%f0,	%f30,	%f22
	movge	%xcc,	%i2,	%o5
	move	%xcc,	%i3,	%i4
	ldd	[%l7 + 0x18],	%f14
	movcs	%icc,	%l6,	%l4
	move	%xcc,	%l0,	%g5
	restore %o6, %l3, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x68, %i2
	stx	%i7,	[%l7 + %i2]
	xor	%g6,	%i6,	%i0
	movvc	%xcc,	%o0,	%o1
	addc	%o3,	0x0253,	%l1
	movne	%xcc,	%o7,	%g3
	fzero	%f20
	movl	%xcc,	%g1,	%i1
	movle	%icc,	%l5,	%g7
	fsrc2s	%f22,	%f8
	sub	%o4,	%o2,	%g4
	edge8	%g2,	%i2,	%o5
	fcmped	%fcc1,	%f2,	%f4
	stx	%l2,	[%l7 + 0x40]
	fmovrsgz	%i4,	%f31,	%f7
	sethi	0x17ED,	%l6
	andncc	%l4,	%i3,	%l0
	sra	%g5,	0x1A,	%l3
	edge16	%i5,	%i7,	%o6
	fnot1s	%f4,	%f14
	xorcc	%g6,	0x1EE8,	%i0
	movrgez	%i6,	0x397,	%o0
	mulscc	%o1,	%l1,	%o3
	array32	%o7,	%g1,	%i1
	fmovsg	%xcc,	%f15,	%f23
	sethi	0x060A,	%g3
	fmovrse	%g7,	%f6,	%f11
	movrgez	%l5,	0x253,	%o2
	edge8ln	%o4,	%g4,	%g2
	fabsd	%f6,	%f0
	movle	%icc,	%o5,	%l2
	fzero	%f10
	addc	%i2,	%i4,	%l4
	orn	%i3,	%l0,	%l6
	edge32	%l3,	%i5,	%i7
	orn	%o6,	%g5,	%g6
	fmovsle	%icc,	%f8,	%f4
	fmovrsgez	%i6,	%f17,	%f31
	fmovda	%icc,	%f23,	%f27
	st	%f10,	[%l7 + 0x08]
	mova	%xcc,	%i0,	%o1
	ldub	[%l7 + 0x5E],	%o0
	fpack16	%f16,	%f8
	and	%l1,	%o7,	%g1
	ldd	[%l7 + 0x60],	%f24
	fmovdl	%xcc,	%f26,	%f27
	fnot2	%f4,	%f2
	fornot2	%f6,	%f4,	%f18
	fmovdne	%xcc,	%f7,	%f2
	std	%f28,	[%l7 + 0x30]
	nop
	set	0x18, %o1
	ldx	[%l7 + %o1],	%i1
	fxnor	%f30,	%f12,	%f10
	mova	%xcc,	%o3,	%g3
	fmovda	%icc,	%f1,	%f20
	edge8l	%l5,	%o2,	%o4
	fmovdleu	%icc,	%f1,	%f10
	fcmped	%fcc3,	%f2,	%f12
	movgu	%icc,	%g4,	%g2
	umulcc	%g7,	%o5,	%l2
	edge32	%i2,	%i4,	%l4
	fmovsg	%xcc,	%f30,	%f15
	xnor	%i3,	0x11DE,	%l6
	fmovdl	%icc,	%f26,	%f7
	alignaddr	%l3,	%l0,	%i5
	fmovdvc	%xcc,	%f18,	%f31
	ldx	[%l7 + 0x08],	%o6
	save %i7, %g5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f16,	%f8,	%f28
	subccc	%g6,	%i0,	%o1
	movle	%xcc,	%l1,	%o0
	ldsh	[%l7 + 0x36],	%g1
	fmovrdne	%o7,	%f20,	%f16
	nop
	set	0x54, %o5
	ldsw	[%l7 + %o5],	%o3
	lduw	[%l7 + 0x74],	%i1
	popc	0x0C17,	%l5
	fpadd16s	%f12,	%f4,	%f13
	array8	%g3,	%o4,	%g4
	mulscc	%g2,	%o2,	%g7
	andcc	%l2,	%o5,	%i4
	sra	%i2,	0x1F,	%l4
	edge16l	%l6,	%i3,	%l0
	stb	%l3,	[%l7 + 0x4F]
	ldx	[%l7 + 0x60],	%i5
	fmovsa	%icc,	%f29,	%f8
	udiv	%i7,	0x06BD,	%o6
	nop
	set	0x68, %o6
	ldsw	[%l7 + %o6],	%g5
	or	%i6,	0x1264,	%i0
	nop
	set	0x65, %i0
	ldub	[%l7 + %i0],	%o1
	sdiv	%g6,	0x09A5,	%o0
	movcc	%xcc,	%l1,	%o7
	movn	%xcc,	%o3,	%g1
	movrgez	%i1,	%l5,	%g3
	orcc	%g4,	%o4,	%o2
	movl	%icc,	%g7,	%l2
	xorcc	%g2,	0x07D2,	%i4
	movge	%xcc,	%i2,	%l4
	sll	%l6,	%i3,	%o5
	lduw	[%l7 + 0x64],	%l0
	siam	0x7
	fmul8x16	%f12,	%f10,	%f12
	ldub	[%l7 + 0x51],	%i5
	movneg	%icc,	%l3,	%i7
	stw	%o6,	[%l7 + 0x18]
	sll	%i6,	%i0,	%o1
	fnot2s	%f23,	%f9
	fmovscc	%icc,	%f31,	%f11
	fmul8sux16	%f30,	%f8,	%f10
	array32	%g6,	%o0,	%l1
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	fpack32	%f12,	%f18,	%f26
	fmovdvc	%icc,	%f24,	%f25
	stx	%o7,	[%l7 + 0x48]
	siam	0x0
	fpack16	%f16,	%f21
	movg	%icc,	%l5,	%i1
	array16	%g3,	%o4,	%g4
	srl	%g7,	%o2,	%l2
	edge32l	%i4,	%g2,	%l4
	udivcc	%l6,	0x1C8E,	%i2
	movneg	%xcc,	%i3,	%l0
	stx	%o5,	[%l7 + 0x08]
	add	%i5,	%i7,	%l3
	and	%o6,	0x0CFE,	%i6
	movrne	%o1,	%g6,	%o0
	ldub	[%l7 + 0x63],	%i0
	ldd	[%l7 + 0x78],	%g4
	ldsw	[%l7 + 0x40],	%l1
	std	%f0,	[%l7 + 0x50]
	movgu	%xcc,	%g1,	%o7
	edge32n	%l5,	%i1,	%o3
	andncc	%o4,	%g3,	%g7
	movne	%xcc,	%g4,	%l2
	movpos	%xcc,	%o2,	%g2
	lduh	[%l7 + 0x3A],	%l4
	lduw	[%l7 + 0x6C],	%l6
	subcc	%i4,	%i2,	%i3
	ldsw	[%l7 + 0x18],	%o5
	save %i5, %i7, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l3,	0x0E9B,	%i6
	srl	%o6,	%g6,	%o1
	fnegs	%f19,	%f22
	movrlez	%i0,	%g5,	%o0
	movcs	%xcc,	%l1,	%o7
	orn	%l5,	%i1,	%o3
	edge32	%o4,	%g1,	%g3
	ldsw	[%l7 + 0x70],	%g7
	fmuld8sux16	%f0,	%f13,	%f24
	ldsw	[%l7 + 0x44],	%g4
	fcmpes	%fcc3,	%f5,	%f7
	ld	[%l7 + 0x64],	%f5
	movre	%l2,	0x3F0,	%g2
	edge32ln	%l4,	%o2,	%i4
	udivx	%l6,	0x06F4,	%i2
	fpsub16	%f18,	%f16,	%f24
	umul	%o5,	%i3,	%i7
	sub	%i5,	%l0,	%i6
	array16	%l3,	%g6,	%o1
	fmovrse	%o6,	%f30,	%f8
	xorcc	%g5,	0x0F8A,	%o0
	xnor	%i0,	%l1,	%o7
	ldsh	[%l7 + 0x20],	%l5
	ldub	[%l7 + 0x5D],	%o3
	stx	%i1,	[%l7 + 0x48]
	fcmple32	%f8,	%f4,	%g1
	edge16	%o4,	%g7,	%g4
	sra	%l2,	%g3,	%g2
	movl	%icc,	%o2,	%i4
	nop
	set	0x38, %o2
	ldx	[%l7 + %o2],	%l4
	ldd	[%l7 + 0x60],	%f14
	stw	%l6,	[%l7 + 0x74]
	fmovda	%xcc,	%f29,	%f4
	mulscc	%o5,	%i3,	%i7
	movl	%icc,	%i5,	%l0
	fmovrslez	%i2,	%f24,	%f30
	edge32	%l3,	%g6,	%i6
	sth	%o6,	[%l7 + 0x6C]
	subccc	%g5,	%o1,	%i0
	stx	%l1,	[%l7 + 0x10]
	xnor	%o7,	%o0,	%l5
	edge8ln	%i1,	%o3,	%o4
	ldsh	[%l7 + 0x4C],	%g7
	edge32	%g1,	%l2,	%g4
	edge16l	%g2,	%g3,	%i4
	sll	%l4,	0x13,	%o2
	movrlez	%l6,	%i3,	%i7
	popc	0x0E3B,	%i5
	fmovdneg	%xcc,	%f14,	%f12
	xnorcc	%o5,	%i2,	%l0
	array8	%g6,	%l3,	%i6
	nop
	set	0x40, %o7
	ldsw	[%l7 + %o7],	%o6
	movrlez	%o1,	0x336,	%g5
	movrgez	%i0,	%o7,	%o0
	xorcc	%l1,	0x1868,	%i1
	fxor	%f22,	%f16,	%f14
	edge16n	%o3,	%l5,	%o4
	and	%g7,	%l2,	%g1
	udiv	%g4,	0x0251,	%g3
	stw	%i4,	[%l7 + 0x7C]
	sir	0x0259
	subcc	%l4,	%g2,	%o2
	sdivcc	%l6,	0x14F5,	%i3
	srax	%i7,	0x1D,	%i5
	edge32ln	%i2,	%l0,	%o5
	xnor	%g6,	0x1225,	%l3
	umul	%i6,	0x0274,	%o1
	xor	%o6,	0x1D5F,	%g5
	udiv	%i0,	0x030E,	%o0
	orn	%l1,	%i1,	%o3
	movpos	%icc,	%o7,	%l5
	orcc	%o4,	%g7,	%l2
	andcc	%g4,	%g3,	%i4
	edge8n	%l4,	%g2,	%o2
	edge32	%g1,	%i3,	%l6
	movcc	%xcc,	%i7,	%i2
	addc	%l0,	0x13D8,	%i5
	fmovdge	%icc,	%f24,	%f6
	and	%o5,	0x0D8B,	%l3
	xnorcc	%i6,	0x1DB0,	%g6
	fmovdcs	%icc,	%f31,	%f6
	sdivcc	%o1,	0x18C3,	%o6
	fpadd16	%f18,	%f2,	%f16
	stb	%i0,	[%l7 + 0x31]
	movle	%xcc,	%o0,	%g5
	sdivcc	%i1,	0x15FB,	%l1
	edge32l	%o3,	%l5,	%o4
	movneg	%icc,	%o7,	%g7
	fmovsvs	%icc,	%f30,	%f0
	fand	%f8,	%f12,	%f12
	movneg	%xcc,	%g4,	%g3
	or	%l2,	%l4,	%i4
	edge8	%o2,	%g1,	%i3
	sethi	0x198C,	%g2
	andcc	%l6,	0x16AD,	%i7
	sethi	0x11D0,	%i2
	edge32n	%i5,	%o5,	%l0
	addc	%l3,	%i6,	%o1
	movneg	%xcc,	%g6,	%i0
	fmovdleu	%icc,	%f8,	%f28
	edge32	%o6,	%g5,	%o0
	save %l1, %i1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o3,	%o4,	%g7
	movre	%g4,	0x16F,	%g3
	fzero	%f30
	edge32ln	%o7,	%l4,	%l2
	and	%o2,	0x1C81,	%g1
	fmovsle	%icc,	%f27,	%f6
	stw	%i3,	[%l7 + 0x50]
	and	%i4,	0x0A61,	%g2
	movrlz	%l6,	0x332,	%i7
	andncc	%i5,	%i2,	%l0
	fmovdgu	%icc,	%f4,	%f17
	fmovse	%xcc,	%f8,	%f31
	alignaddrl	%l3,	%o5,	%i6
	sdivx	%o1,	0x020E,	%g6
	std	%f0,	[%l7 + 0x78]
	and	%i0,	%o6,	%o0
	movrgez	%g5,	%l1,	%i1
	sdivcc	%o3,	0x111A,	%o4
	movge	%icc,	%l5,	%g4
	edge8ln	%g7,	%g3,	%l4
	fxors	%f28,	%f6,	%f24
	sdivx	%l2,	0x0CE0,	%o2
	movcs	%xcc,	%g1,	%o7
	movrne	%i3,	%g2,	%l6
	umulcc	%i7,	%i5,	%i2
	xor	%i4,	%l0,	%o5
	movpos	%icc,	%i6,	%l3
	edge8	%o1,	%i0,	%o6
	movpos	%icc,	%g6,	%g5
	andcc	%l1,	%i1,	%o3
	edge8	%o4,	%o0,	%g4
	nop
	set	0x40, %g5
	stb	%g7,	[%l7 + %g5]
	ldsh	[%l7 + 0x4A],	%l5
	umul	%l4,	%g3,	%l2
	mulscc	%o2,	%o7,	%g1
	edge32ln	%i3,	%l6,	%g2
	orcc	%i5,	%i7,	%i4
	st	%f10,	[%l7 + 0x20]
	edge32ln	%i2,	%o5,	%i6
	fandnot1s	%f16,	%f15,	%f11
	smulcc	%l0,	0x0F65,	%l3
	movg	%xcc,	%i0,	%o1
	sub	%g6,	0x08ED,	%o6
	edge32ln	%l1,	%i1,	%g5
	andncc	%o4,	%o3,	%o0
	umul	%g7,	%l5,	%g4
	fmovsvs	%icc,	%f26,	%f9
	st	%f23,	[%l7 + 0x48]
	movn	%xcc,	%l4,	%g3
	popc	0x1AE0,	%o2
	stx	%l2,	[%l7 + 0x60]
	movneg	%icc,	%g1,	%i3
	stb	%l6,	[%l7 + 0x12]
	sub	%o7,	0x1B00,	%i5
	ldub	[%l7 + 0x30],	%g2
	move	%xcc,	%i7,	%i2
	fmovdpos	%icc,	%f4,	%f9
	fxnor	%f8,	%f22,	%f12
	movvc	%icc,	%i4,	%o5
	fmovsa	%xcc,	%f31,	%f28
	movle	%xcc,	%l0,	%l3
	edge32ln	%i0,	%o1,	%g6
	stb	%i6,	[%l7 + 0x7E]
	movge	%xcc,	%o6,	%l1
	ldub	[%l7 + 0x3F],	%g5
	sir	0x10E0
	movle	%xcc,	%o4,	%o3
	orcc	%o0,	%i1,	%g7
	add	%g4,	%l5,	%l4
	mulscc	%g3,	%l2,	%g1
	lduh	[%l7 + 0x26],	%o2
	sethi	0x0BF2,	%l6
	smul	%o7,	0x1E46,	%i3
	smulcc	%i5,	%i7,	%i2
	subcc	%i4,	%g2,	%l0
	edge16n	%l3,	%o5,	%i0
	xnor	%g6,	%i6,	%o6
	movleu	%xcc,	%l1,	%g5
	alignaddrl	%o4,	%o3,	%o1
	nop
	set	0x0C, %g7
	stw	%i1,	[%l7 + %g7]
	smul	%o0,	0x1198,	%g7
	mova	%icc,	%g4,	%l4
	fmovdcs	%xcc,	%f15,	%f17
	restore %g3, 0x1F0E, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g1,	0x0D84,	%l2
	ldsb	[%l7 + 0x23],	%o2
	sir	0x076B
	movrgez	%o7,	0x0AD,	%i3
	fsrc2s	%f29,	%f17
	sub	%i5,	%l6,	%i2
	fornot2s	%f1,	%f16,	%f17
	smulcc	%i7,	0x13DC,	%i4
	faligndata	%f0,	%f6,	%f20
	edge32	%g2,	%l0,	%o5
	fmovsg	%icc,	%f31,	%f25
	edge8l	%i0,	%l3,	%g6
	umulcc	%i6,	%l1,	%g5
	stb	%o6,	[%l7 + 0x38]
	andn	%o4,	0x1D04,	%o1
	edge8	%i1,	%o3,	%o0
	fmovdpos	%xcc,	%f26,	%f29
	movrlz	%g7,	0x375,	%l4
	orn	%g4,	%g3,	%g1
	umulcc	%l5,	0x04B7,	%l2
	fmovsgu	%xcc,	%f14,	%f24
	movvc	%xcc,	%o2,	%i3
	stb	%i5,	[%l7 + 0x70]
	srl	%l6,	%i2,	%i7
	movg	%xcc,	%o7,	%i4
	udiv	%g2,	0x03D7,	%o5
	movrlz	%i0,	%l3,	%l0
	addc	%i6,	%l1,	%g6
	fmovrdgz	%o6,	%f20,	%f24
	fmovdneg	%icc,	%f3,	%f3
	orncc	%o4,	0x1951,	%g5
	movvc	%icc,	%o1,	%i1
	andncc	%o0,	%o3,	%l4
	alignaddr	%g7,	%g3,	%g4
	edge8ln	%l5,	%g1,	%o2
	xorcc	%i3,	0x1CD8,	%i5
	udivx	%l6,	0x0F79,	%i2
	fmovdcs	%icc,	%f15,	%f2
	save %l2, %o7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f14,	%f14,	%f8
	andn	%g2,	%i7,	%o5
	bshuffle	%f26,	%f8,	%f18
	orcc	%i0,	0x12FB,	%l0
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	array16	%g6,	%o4,	%o6
	fxnors	%f27,	%f18,	%f18
	or	%o1,	0x1101,	%i1
	subcc	%o0,	0x19F1,	%g5
	andcc	%l4,	%o3,	%g3
	fmovsl	%icc,	%f3,	%f4
	sdivx	%g4,	0x14E5,	%l5
	ldd	[%l7 + 0x78],	%g6
	andn	%o2,	%i3,	%i5
	andcc	%l6,	0x109E,	%g1
	mulx	%i2,	%o7,	%l2
	edge8l	%i4,	%i7,	%g2
	edge16l	%i0,	%o5,	%i6
	xor	%l0,	%l3,	%l1
	edge8ln	%o4,	%o6,	%o1
	ld	[%l7 + 0x14],	%f18
	xorcc	%g6,	0x089C,	%i1
	sth	%g5,	[%l7 + 0x40]
	movre	%o0,	%o3,	%l4
	ldub	[%l7 + 0x2C],	%g3
	xnor	%g4,	0x1B76,	%l5
	ldd	[%l7 + 0x60],	%f14
	fxor	%f16,	%f0,	%f4
	smulcc	%o2,	%i3,	%g7
	mulx	%l6,	%i5,	%i2
	sll	%o7,	0x18,	%g1
	edge16l	%i4,	%l2,	%g2
	movge	%xcc,	%i7,	%o5
	andcc	%i0,	0x0F5A,	%i6
	umul	%l0,	%l3,	%l1
	fzeros	%f9
	ldd	[%l7 + 0x48],	%f2
	ldx	[%l7 + 0x58],	%o6
	fmovsg	%xcc,	%f11,	%f31
	movne	%xcc,	%o4,	%o1
	sdivcc	%g6,	0x12C7,	%i1
	fmovdcs	%icc,	%f10,	%f21
	lduw	[%l7 + 0x5C],	%g5
	addcc	%o3,	0x19EA,	%l4
	fmovrde	%g3,	%f30,	%f6
	xnor	%o0,	0x0CA7,	%l5
	lduw	[%l7 + 0x40],	%g4
	st	%f13,	[%l7 + 0x24]
	movge	%xcc,	%i3,	%g7
	edge32n	%l6,	%o2,	%i2
	save %i5, %o7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g1,	%g2,	%i7
	addccc	%o5,	0x1D78,	%i0
	orcc	%i6,	%l2,	%l0
	smul	%l3,	0x0178,	%l1
	fxnor	%f22,	%f0,	%f6
	sll	%o4,	%o6,	%g6
	edge8l	%i1,	%o1,	%o3
	edge16	%l4,	%g3,	%g5
	ldx	[%l7 + 0x50],	%l5
	movvs	%icc,	%o0,	%i3
	movrne	%g4,	%g7,	%l6
	ldsh	[%l7 + 0x1C],	%o2
	addcc	%i5,	%i2,	%o7
	udivcc	%i4,	0x01DD,	%g1
	edge16	%g2,	%i7,	%i0
	stb	%i6,	[%l7 + 0x23]
	fmovsne	%icc,	%f22,	%f16
	edge16n	%l2,	%l0,	%l3
	array16	%l1,	%o4,	%o5
	array8	%o6,	%i1,	%o1
	fmovrsne	%o3,	%f2,	%f14
	edge32n	%l4,	%g3,	%g6
	or	%l5,	%o0,	%i3
	fmovdge	%xcc,	%f21,	%f14
	fpsub16	%f30,	%f10,	%f22
	fxnors	%f7,	%f13,	%f0
	sra	%g4,	0x05,	%g5
	movpos	%icc,	%l6,	%g7
	smul	%i5,	%o2,	%o7
	addccc	%i4,	0x074E,	%g1
	save %g2, 0x1F74, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f2,	[%l7 + 0x24]
	sra	%i0,	0x12,	%i7
	ldd	[%l7 + 0x28],	%l2
	udiv	%l0,	0x03E6,	%i6
	fsrc2	%f14,	%f6
	addccc	%l3,	%l1,	%o5
	fmovscc	%icc,	%f28,	%f6
	andncc	%o6,	%i1,	%o4
	st	%f12,	[%l7 + 0x3C]
	lduh	[%l7 + 0x66],	%o3
	fmovsge	%xcc,	%f19,	%f21
	sdivcc	%l4,	0x1C43,	%o1
	fabss	%f17,	%f31
	xor	%g6,	%l5,	%g3
	fornot2s	%f26,	%f4,	%f7
	fmovrslz	%o0,	%f16,	%f24
	movge	%icc,	%g4,	%g5
	fpsub16s	%f8,	%f24,	%f5
	fmovdvs	%xcc,	%f30,	%f22
	fmovrsgez	%i3,	%f3,	%f8
	xorcc	%g7,	%l6,	%o2
	addccc	%o7,	0x111D,	%i4
	st	%f5,	[%l7 + 0x64]
	movcs	%icc,	%g1,	%i5
	sth	%g2,	[%l7 + 0x7E]
	movrlz	%i0,	%i2,	%l2
	edge32ln	%i7,	%l0,	%l3
	xnorcc	%i6,	0x1AED,	%l1
	fnand	%f22,	%f20,	%f14
	fmovsl	%icc,	%f9,	%f10
	mulx	%o5,	%o6,	%i1
	movneg	%xcc,	%o3,	%l4
	array16	%o1,	%g6,	%o4
	edge8n	%l5,	%g3,	%o0
	movvs	%icc,	%g5,	%g4
	andn	%g7,	%i3,	%l6
	addcc	%o7,	0x14E6,	%i4
	andcc	%g1,	%i5,	%o2
	fmovd	%f28,	%f8
	movre	%i0,	%i2,	%g2
	fnand	%f6,	%f0,	%f28
	fandnot2	%f24,	%f30,	%f12
	fmovdneg	%xcc,	%f8,	%f20
	addcc	%l2,	%i7,	%l3
	edge16n	%l0,	%i6,	%l1
	edge32ln	%o5,	%i1,	%o3
	move	%icc,	%l4,	%o6
	umulcc	%g6,	0x028E,	%o1
	srax	%l5,	0x1D,	%o4
	andncc	%o0,	%g5,	%g4
	srax	%g7,	%i3,	%l6
	andn	%g3,	%o7,	%i4
	sdiv	%i5,	0x08F4,	%g1
	std	%f20,	[%l7 + 0x60]
	fmovdvs	%xcc,	%f0,	%f30
	orncc	%i0,	%i2,	%g2
	subcc	%l2,	%i7,	%l3
	edge16l	%o2,	%l0,	%i6
	ld	[%l7 + 0x4C],	%f22
	subccc	%l1,	0x10DC,	%i1
	andcc	%o5,	%l4,	%o6
	movrgez	%o3,	0x1E6,	%g6
	fornot2	%f14,	%f0,	%f12
	alignaddrl	%o1,	%l5,	%o4
	edge16	%o0,	%g4,	%g5
	fmovsa	%icc,	%f8,	%f30
	xnorcc	%i3,	%g7,	%l6
	movg	%icc,	%g3,	%i4
	sethi	0x15E2,	%i5
	ld	[%l7 + 0x18],	%f5
	lduw	[%l7 + 0x18],	%g1
	movvs	%xcc,	%o7,	%i2
	edge16	%i0,	%l2,	%i7
	edge32l	%l3,	%o2,	%l0
	fmovrdlz	%g2,	%f26,	%f22
	edge8n	%l1,	%i1,	%i6
	stb	%l4,	[%l7 + 0x20]
	lduw	[%l7 + 0x18],	%o5
	xnorcc	%o3,	0x16A2,	%g6
	nop
	set	0x6A, %o4
	ldsh	[%l7 + %o4],	%o6
	fpadd32s	%f21,	%f21,	%f3
	fmovdl	%xcc,	%f29,	%f23
	subc	%l5,	0x17FF,	%o1
	edge8n	%o4,	%o0,	%g5
	edge16l	%i3,	%g4,	%g7
	sth	%g3,	[%l7 + 0x10]
	ldub	[%l7 + 0x13],	%l6
	mulscc	%i5,	%i4,	%o7
	fmovdvs	%xcc,	%f29,	%f30
	movvc	%xcc,	%g1,	%i0
	edge16n	%l2,	%i7,	%l3
	movgu	%icc,	%o2,	%l0
	edge16n	%g2,	%i2,	%l1
	subccc	%i6,	%i1,	%o5
	fcmps	%fcc2,	%f11,	%f15
	edge8ln	%l4,	%g6,	%o3
	fxor	%f16,	%f12,	%f4
	fmovsl	%icc,	%f23,	%f3
	sdivcc	%o6,	0x026D,	%l5
	xnor	%o1,	%o0,	%g5
	edge32ln	%i3,	%o4,	%g7
	fmovsneg	%xcc,	%f31,	%f29
	subc	%g4,	%g3,	%i5
	ld	[%l7 + 0x58],	%f23
	for	%f10,	%f0,	%f0
	movrlz	%i4,	%l6,	%g1
	lduw	[%l7 + 0x3C],	%i0
	udivx	%l2,	0x1B8A,	%o7
	movre	%l3,	0x10A,	%o2
	array16	%i7,	%l0,	%g2
	xnorcc	%l1,	%i2,	%i1
	udivx	%o5,	0x1626,	%l4
	sethi	0x0F70,	%g6
	fpmerge	%f25,	%f3,	%f10
	fmovdcs	%xcc,	%f2,	%f3
	xnor	%o3,	%o6,	%l5
	subcc	%i6,	0x0653,	%o1
	lduh	[%l7 + 0x5C],	%o0
	fmul8ulx16	%f12,	%f14,	%f0
	sdivx	%i3,	0x0829,	%g5
	orcc	%o4,	0x0BAF,	%g4
	sdivcc	%g3,	0x1D3F,	%g7
	lduw	[%l7 + 0x10],	%i4
	fsrc1	%f20,	%f26
	fmovrde	%i5,	%f2,	%f12
	ldx	[%l7 + 0x10],	%l6
	std	%f30,	[%l7 + 0x78]
	fmovrse	%g1,	%f7,	%f30
	xnorcc	%i0,	%l2,	%l3
	edge8ln	%o2,	%i7,	%o7
	fcmpne16	%f8,	%f20,	%g2
	stx	%l0,	[%l7 + 0x10]
	nop
	set	0x24, %g3
	lduw	[%l7 + %g3],	%i2
	movrlez	%l1,	0x05C,	%i1
	edge8l	%o5,	%g6,	%o3
	fzero	%f20
	subc	%l4,	%l5,	%i6
	edge8ln	%o1,	%o0,	%o6
	movge	%icc,	%i3,	%o4
	edge8l	%g5,	%g3,	%g4
	mova	%icc,	%g7,	%i4
	ldsb	[%l7 + 0x34],	%i5
	edge16ln	%g1,	%l6,	%i0
	xnorcc	%l2,	0x1B71,	%o2
	movrlez	%l3,	0x1A8,	%o7
	movpos	%xcc,	%i7,	%l0
	movneg	%xcc,	%i2,	%g2
	fnot1s	%f11,	%f27
	fpadd32	%f12,	%f0,	%f18
	stx	%l1,	[%l7 + 0x40]
	fcmple32	%f4,	%f12,	%o5
	sub	%g6,	0x1D52,	%i1
	nop
	set	0x44, %i4
	lduw	[%l7 + %i4],	%o3
	fnegs	%f1,	%f19
	sdiv	%l5,	0x1DD6,	%i6
	movne	%xcc,	%l4,	%o0
	sll	%o6,	%o1,	%i3
	ldsw	[%l7 + 0x70],	%o4
	stb	%g5,	[%l7 + 0x5F]
	fmovrdgz	%g3,	%f22,	%f20
	movrgez	%g7,	%g4,	%i5
	movrne	%g1,	%i4,	%i0
	ldd	[%l7 + 0x78],	%l2
	fornot2s	%f10,	%f26,	%f22
	umul	%o2,	%l6,	%o7
	edge8ln	%l3,	%i7,	%l0
	fcmpne32	%f2,	%f18,	%i2
	edge16n	%l1,	%g2,	%g6
	fmovsne	%icc,	%f26,	%f13
	edge8ln	%o5,	%o3,	%i1
	umul	%i6,	0x1218,	%l5
	fornot2	%f28,	%f22,	%f28
	ldub	[%l7 + 0x4F],	%l4
	subcc	%o0,	0x1A8E,	%o6
	ldd	[%l7 + 0x20],	%f4
	andn	%i3,	0x183F,	%o1
	sdivx	%g5,	0x0F6E,	%g3
	edge8ln	%o4,	%g4,	%i5
	fpmerge	%f27,	%f20,	%f6
	fnot1	%f4,	%f0
	array32	%g1,	%g7,	%i0
	ldx	[%l7 + 0x58],	%l2
	movrgz	%i4,	%l6,	%o2
	srax	%l3,	%o7,	%l0
	movrgz	%i7,	0x07E,	%i2
	fnot2s	%f12,	%f15
	fmovspos	%icc,	%f0,	%f6
	movre	%l1,	0x3F5,	%g6
	orcc	%o5,	0x09A5,	%g2
	fexpand	%f14,	%f14
	udivx	%o3,	0x14EC,	%i1
	movrgez	%i6,	%l4,	%l5
	fpadd32s	%f7,	%f31,	%f13
	fcmped	%fcc2,	%f10,	%f30
	fpack32	%f14,	%f26,	%f30
	srl	%o0,	0x1F,	%i3
	udiv	%o1,	0x01B5,	%g5
	addc	%o6,	0x1A00,	%o4
	ldub	[%l7 + 0x29],	%g3
	array32	%i5,	%g4,	%g1
	udivx	%i0,	0x0CBA,	%l2
	movg	%xcc,	%i4,	%l6
	movpos	%icc,	%o2,	%l3
	movvc	%xcc,	%g7,	%l0
	fornot1	%f24,	%f22,	%f8
	fornot1	%f2,	%f8,	%f22
	ldsh	[%l7 + 0x2E],	%o7
	movrgez	%i2,	0x265,	%l1
	movrlez	%i7,	0x134,	%o5
	edge8	%g2,	%o3,	%i1
	orn	%g6,	%i6,	%l4
	srl	%o0,	0x02,	%l5
	udivx	%o1,	0x10AD,	%g5
	ld	[%l7 + 0x14],	%f12
	fmovdvs	%icc,	%f2,	%f28
	srax	%i3,	%o4,	%g3
	mulscc	%i5,	0x1DF5,	%o6
	xorcc	%g4,	0x0605,	%g1
	fpack16	%f10,	%f5
	ldub	[%l7 + 0x3D],	%l2
	edge16ln	%i4,	%l6,	%o2
	subcc	%i0,	%g7,	%l0
	movgu	%xcc,	%o7,	%i2
	fmovdcc	%icc,	%f18,	%f16
	fornot1	%f26,	%f10,	%f20
	ldsb	[%l7 + 0x25],	%l1
	fsrc1	%f10,	%f18
	sdivx	%i7,	0x057D,	%l3
	movrne	%o5,	%g2,	%o3
	edge32ln	%g6,	%i1,	%l4
	fornot1s	%f9,	%f3,	%f21
	ldsh	[%l7 + 0x5E],	%i6
	mulx	%o0,	%o1,	%l5
	sdivcc	%g5,	0x199A,	%o4
	edge16n	%i3,	%g3,	%i5
	ld	[%l7 + 0x74],	%f17
	fcmpeq16	%f28,	%f24,	%g4
	fpsub32s	%f1,	%f30,	%f16
	smul	%o6,	0x174B,	%l2
	movpos	%icc,	%i4,	%l6
	movvs	%icc,	%g1,	%i0
	fxors	%f27,	%f30,	%f8
	ldub	[%l7 + 0x60],	%g7
	movrgez	%l0,	0x200,	%o7
	mulx	%o2,	%l1,	%i7
	movge	%xcc,	%l3,	%o5
	fcmpne16	%f26,	%f16,	%g2
	addccc	%o3,	%i2,	%g6
	edge32n	%i1,	%i6,	%o0
	fands	%f9,	%f2,	%f9
	edge16l	%o1,	%l4,	%g5
	orn	%o4,	%l5,	%i3
	sllx	%g3,	0x11,	%i5
	lduw	[%l7 + 0x6C],	%o6
	edge16ln	%g4,	%i4,	%l6
	xor	%l2,	%g1,	%i0
	fmovdle	%xcc,	%f9,	%f6
	fpack16	%f12,	%f14
	and	%l0,	%o7,	%g7
	sdivcc	%l1,	0x1AC4,	%o2
	fpsub32s	%f31,	%f23,	%f7
	fmul8x16au	%f9,	%f13,	%f26
	movrne	%i7,	%o5,	%g2
	ld	[%l7 + 0x7C],	%f27
	srax	%o3,	0x12,	%i2
	ldub	[%l7 + 0x30],	%l3
	fandnot1	%f20,	%f4,	%f22
	lduh	[%l7 + 0x70],	%i1
	stw	%g6,	[%l7 + 0x5C]
	smul	%o0,	%o1,	%i6
	andncc	%l4,	%g5,	%l5
	array32	%o4,	%g3,	%i3
	edge32n	%i5,	%o6,	%i4
	udivx	%g4,	0x0C69,	%l6
	smulcc	%g1,	0x1AE5,	%l2
	fcmple16	%f6,	%f2,	%l0
	movpos	%xcc,	%i0,	%o7
	srlx	%l1,	%o2,	%i7
	lduh	[%l7 + 0x34],	%o5
	and	%g2,	0x1CF3,	%o3
	movvs	%icc,	%i2,	%g7
	movle	%xcc,	%i1,	%l3
	ldx	[%l7 + 0x28],	%o0
	sllx	%o1,	0x16,	%g6
	mulx	%i6,	0x079C,	%l4
	lduh	[%l7 + 0x20],	%l5
	stw	%g5,	[%l7 + 0x6C]
	ld	[%l7 + 0x50],	%f31
	orncc	%o4,	0x1E8A,	%i3
	ld	[%l7 + 0x7C],	%f2
	movle	%xcc,	%g3,	%i5
	faligndata	%f14,	%f30,	%f22
	fmovspos	%icc,	%f6,	%f1
	ld	[%l7 + 0x10],	%f19
	fands	%f12,	%f13,	%f8
	ld	[%l7 + 0x68],	%f14
	alignaddrl	%o6,	%g4,	%i4
	subccc	%g1,	%l2,	%l0
	edge32ln	%i0,	%l6,	%l1
	edge32n	%o7,	%i7,	%o2
	sethi	0x08CD,	%g2
	udivx	%o5,	0x0CCE,	%i2
	sethi	0x0B4C,	%g7
	fcmpne32	%f10,	%f8,	%o3
	movrlz	%l3,	0x012,	%i1
	fmovscs	%xcc,	%f20,	%f28
	srl	%o0,	%o1,	%i6
	movrgz	%l4,	0x0A8,	%g6
	faligndata	%f12,	%f26,	%f10
	fxnors	%f18,	%f26,	%f4
	srax	%l5,	%g5,	%o4
	fmovd	%f10,	%f8
	addc	%i3,	%g3,	%o6
	edge16n	%g4,	%i5,	%i4
	udiv	%g1,	0x1CBC,	%l0
	edge32	%i0,	%l6,	%l2
	orncc	%l1,	0x07F6,	%i7
	ldub	[%l7 + 0x7D],	%o7
	sra	%g2,	%o5,	%o2
	fxors	%f10,	%f24,	%f4
	fcmped	%fcc3,	%f4,	%f30
	orn	%g7,	0x07F6,	%i2
	srax	%o3,	0x05,	%i1
	orn	%l3,	0x0B66,	%o0
	fpadd32s	%f30,	%f6,	%f7
	edge8ln	%o1,	%l4,	%i6
	lduw	[%l7 + 0x18],	%g6
	fmovrdne	%g5,	%f16,	%f2
	xor	%l5,	0x1094,	%i3
	movneg	%xcc,	%o4,	%o6
	sir	0x082E
	fmovsg	%xcc,	%f1,	%f12
	sll	%g4,	0x08,	%i5
	subccc	%i4,	0x024E,	%g3
	ldsb	[%l7 + 0x46],	%g1
	xnorcc	%i0,	%l6,	%l2
	movl	%xcc,	%l0,	%l1
	sethi	0x0E0F,	%i7
	subccc	%g2,	%o7,	%o5
	fcmpne16	%f18,	%f4,	%o2
	fmovde	%xcc,	%f16,	%f18
	fmovrdgez	%i2,	%f18,	%f28
	movl	%xcc,	%g7,	%o3
	popc	0x0A8B,	%i1
	sdiv	%l3,	0x0B33,	%o1
	sdiv	%l4,	0x02E5,	%i6
	movge	%icc,	%o0,	%g6
	fmovsgu	%xcc,	%f20,	%f24
	subccc	%g5,	%l5,	%o4
	fnands	%f27,	%f30,	%f1
	st	%f19,	[%l7 + 0x3C]
	ldsh	[%l7 + 0x70],	%i3
	addccc	%g4,	0x1BCF,	%i5
	movn	%xcc,	%o6,	%g3
	movrlez	%i4,	0x3BD,	%g1
	array32	%i0,	%l2,	%l6
	fxor	%f30,	%f22,	%f20
	xorcc	%l0,	0x149E,	%i7
	and	%l1,	0x05AA,	%o7
	sir	0x0F73
	smulcc	%g2,	%o2,	%o5
	pdist	%f12,	%f6,	%f0
	movrne	%i2,	%g7,	%i1
	andn	%o3,	%l3,	%l4
	array32	%o1,	%o0,	%g6
	sdivx	%g5,	0x0BE9,	%i6
	movrgz	%l5,	0x1F5,	%i3
	edge16ln	%o4,	%i5,	%g4
	sdivcc	%o6,	0x1F22,	%g3
	fmovsl	%icc,	%f25,	%f17
	mulx	%g1,	0x1AAA,	%i0
	smul	%l2,	%l6,	%i4
	edge32	%i7,	%l1,	%o7
	fmovdg	%xcc,	%f25,	%f6
	srl	%g2,	0x02,	%l0
	sdiv	%o2,	0x1AD6,	%o5
	fmovdcs	%xcc,	%f11,	%f26
	sll	%i2,	0x17,	%g7
	movl	%icc,	%o3,	%l3
	mulx	%i1,	0x0AAB,	%l4
	udivx	%o0,	0x12EF,	%g6
	movg	%icc,	%g5,	%i6
	movcs	%xcc,	%l5,	%i3
	bshuffle	%f22,	%f2,	%f16
	lduh	[%l7 + 0x26],	%o1
	stb	%o4,	[%l7 + 0x16]
	movrlez	%i5,	%g4,	%o6
	movrlez	%g1,	%i0,	%l2
	edge16n	%l6,	%g3,	%i7
	save %l1, 0x05D6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%o7,	%l0
	edge16l	%o2,	%g2,	%i2
	fmovdcc	%icc,	%f17,	%f23
	smulcc	%o5,	%o3,	%g7
	movne	%icc,	%l3,	%l4
	for	%f28,	%f20,	%f2
	movre	%i1,	%o0,	%g5
	fcmped	%fcc3,	%f26,	%f28
	subccc	%i6,	%l5,	%i3
	array16	%o1,	%g6,	%o4
	movrgz	%g4,	0x1C9,	%i5
	movvs	%xcc,	%o6,	%g1
	restore %l2, 0x024B, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g3,	%i7,	%l1
	andn	%i4,	0x1740,	%l6
	andcc	%l0,	%o7,	%g2
	movg	%xcc,	%o2,	%o5
	save %o3, %g7, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i2,	%i1
	ldd	[%l7 + 0x48],	%o0
	movcc	%icc,	%l4,	%g5
	array32	%l5,	%i6,	%i3
	movneg	%icc,	%g6,	%o4
	ldd	[%l7 + 0x48],	%f16
	ldsb	[%l7 + 0x59],	%o1
	movpos	%xcc,	%i5,	%g4
	umulcc	%g1,	0x0813,	%o6
	fmuld8ulx16	%f25,	%f16,	%f20
	andcc	%i0,	%l2,	%g3
	ldsb	[%l7 + 0x1B],	%l1
	fmovdpos	%xcc,	%f0,	%f6
	addcc	%i7,	0x023B,	%l6
	fcmpes	%fcc3,	%f24,	%f30
	std	%f14,	[%l7 + 0x40]
	orn	%l0,	%o7,	%i4
	orncc	%g2,	0x18A2,	%o5
	orcc	%o3,	%o2,	%l3
	stb	%g7,	[%l7 + 0x4E]
	sth	%i1,	[%l7 + 0x58]
	fands	%f2,	%f0,	%f30
	udivx	%i2,	0x0DEA,	%o0
	orcc	%l4,	%g5,	%l5
	fmovdn	%xcc,	%f16,	%f24
	movcc	%xcc,	%i3,	%i6
	orcc	%o4,	0x12AD,	%o1
	lduw	[%l7 + 0x20],	%g6
	movne	%xcc,	%i5,	%g4
	xor	%o6,	%g1,	%i0
	edge8n	%l2,	%l1,	%i7
	movrlez	%g3,	%l6,	%o7
	sllx	%l0,	%g2,	%o5
	fcmpd	%fcc2,	%f14,	%f10
	movrne	%i4,	%o2,	%o3
	fandnot1	%f24,	%f24,	%f8
	edge32	%g7,	%l3,	%i2
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f18
	fsrc1s	%f9,	%f27
	sir	0x04D4
	ldsb	[%l7 + 0x16],	%i1
	movl	%xcc,	%l4,	%o0
	ldd	[%l7 + 0x28],	%f26
	sdiv	%g5,	0x1D08,	%i3
	andcc	%i6,	%l5,	%o4
	movleu	%icc,	%o1,	%i5
	mulscc	%g4,	%g6,	%g1
	add	%o6,	%i0,	%l2
	movcs	%xcc,	%l1,	%i7
	addc	%g3,	0x0008,	%l6
	ldsh	[%l7 + 0x0C],	%o7
	ldub	[%l7 + 0x6D],	%l0
	udivcc	%g2,	0x08FB,	%o5
	addcc	%i4,	0x10FC,	%o3
	array16	%o2,	%g7,	%l3
	movn	%icc,	%i2,	%i1
	stx	%l4,	[%l7 + 0x40]
	udivx	%o0,	0x08D3,	%g5
	sllx	%i6,	%i3,	%l5
	orncc	%o1,	0x192F,	%o4
	add	%g4,	%i5,	%g1
	sdivx	%g6,	0x0EB3,	%i0
	popc	%l2,	%o6
	fnot2	%f4,	%f10
	fmovrsne	%l1,	%f20,	%f14
	sethi	0x0139,	%g3
	alignaddr	%i7,	%o7,	%l6
	subcc	%l0,	0x0F5A,	%g2
	movcc	%xcc,	%o5,	%o3
	subccc	%o2,	%i4,	%l3
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	ldd	[%l7 + 0x78],	%f6
	fmuld8sux16	%f26,	%f1,	%f14
	fmovrslez	%o0,	%f21,	%f16
	stx	%g5,	[%l7 + 0x78]
	edge16n	%l4,	%i6,	%i3
	movgu	%icc,	%l5,	%o1
	orcc	%g4,	0x161F,	%i5
	udivx	%g1,	0x1366,	%o4
	alignaddr	%i0,	%g6,	%l2
	or	%o6,	0x091F,	%g3
	srlx	%l1,	%i7,	%l6
	sll	%l0,	0x04,	%o7
	for	%f20,	%f28,	%f22
	edge32n	%o5,	%o3,	%g2
	fmul8sux16	%f28,	%f0,	%f22
	ld	[%l7 + 0x38],	%f13
	ld	[%l7 + 0x38],	%f18
	smul	%o2,	%l3,	%i4
	smulcc	%i2,	0x1316,	%i1
	sdivx	%g7,	0x0A77,	%g5
	mova	%xcc,	%l4,	%i6
	sth	%i3,	[%l7 + 0x50]
	fornot1s	%f27,	%f23,	%f4
	save %o0, %l5, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f12,	%f9
	stw	%g4,	[%l7 + 0x58]
	xor	%i5,	%g1,	%i0
	andcc	%o4,	%l2,	%o6
	array32	%g6,	%g3,	%l1
	movrgz	%l6,	%i7,	%l0
	movpos	%icc,	%o7,	%o5
	alignaddrl	%g2,	%o3,	%l3
	movvs	%icc,	%i4,	%i2
	fmovsvc	%xcc,	%f12,	%f6
	edge8n	%i1,	%g7,	%g5
	edge32	%l4,	%o2,	%i6
	ld	[%l7 + 0x30],	%f31
	movvc	%xcc,	%o0,	%l5
	fabss	%f14,	%f18
	edge32n	%i3,	%g4,	%o1
	fmovsleu	%icc,	%f27,	%f6
	udiv	%i5,	0x0647,	%g1
	popc	%o4,	%i0
	lduh	[%l7 + 0x70],	%l2
	movre	%o6,	%g6,	%l1
	ldsh	[%l7 + 0x62],	%l6
	std	%f16,	[%l7 + 0x10]
	fmovrse	%g3,	%f21,	%f6
	andn	%i7,	0x17BE,	%o7
	st	%f10,	[%l7 + 0x38]
	edge8n	%l0,	%o5,	%o3
	subccc	%g2,	0x0F78,	%i4
	fmovrsgez	%l3,	%f13,	%f7
	fnor	%f16,	%f8,	%f10
	movge	%xcc,	%i2,	%g7
	addc	%i1,	0x0FA4,	%g5
	movcc	%xcc,	%o2,	%i6
	movrne	%o0,	%l4,	%i3
	ldd	[%l7 + 0x78],	%f10
	nop
	set	0x37, %o3
	ldsb	[%l7 + %o3],	%l5
	array32	%g4,	%i5,	%o1
	movl	%icc,	%o4,	%g1
	movge	%xcc,	%l2,	%o6
	restore %g6, 0x1C04, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i0,	0x0FCC,	%l6
	movge	%icc,	%i7,	%g3
	sub	%l0,	0x0F6B,	%o5
	fxors	%f26,	%f22,	%f29
	addc	%o7,	0x1B42,	%o3
	edge16l	%i4,	%l3,	%i2
	sethi	0x0207,	%g7
	edge16	%i1,	%g2,	%o2
	srl	%i6,	0x11,	%g5
	fzero	%f28
	fandnot1	%f2,	%f16,	%f24
	fmovscs	%icc,	%f4,	%f16
	fone	%f0
	movrgz	%l4,	0x026,	%i3
	sllx	%o0,	%g4,	%l5
	fmovdgu	%xcc,	%f29,	%f11
	udivcc	%o1,	0x146D,	%o4
	fnands	%f20,	%f11,	%f27
	edge16l	%i5,	%g1,	%l2
	mulx	%o6,	%l1,	%i0
	ldx	[%l7 + 0x38],	%l6
	addccc	%i7,	%g6,	%l0
	ldd	[%l7 + 0x28],	%f0
	sdiv	%g3,	0x1E0E,	%o7
	movvs	%icc,	%o3,	%o5
	fpsub32	%f30,	%f20,	%f6
	orncc	%i4,	%l3,	%g7
	ldsb	[%l7 + 0x4F],	%i1
	stw	%i2,	[%l7 + 0x6C]
	ldd	[%l7 + 0x28],	%g2
	addccc	%i6,	%o2,	%l4
	movle	%icc,	%g5,	%i3
	fmovdn	%icc,	%f11,	%f8
	fmovsneg	%xcc,	%f20,	%f26
	ldd	[%l7 + 0x70],	%f6
	udiv	%o0,	0x08BE,	%g4
	movrne	%l5,	%o4,	%i5
	edge8n	%g1,	%o1,	%o6
	movg	%icc,	%l2,	%i0
	edge32l	%l1,	%i7,	%g6
	fornot1	%f6,	%f28,	%f6
	subc	%l0,	0x0738,	%l6
	sub	%g3,	%o3,	%o7
	ldub	[%l7 + 0x56],	%i4
	stx	%l3,	[%l7 + 0x48]
	fmovdvs	%xcc,	%f6,	%f7
	fmovdvs	%xcc,	%f5,	%f10
	srlx	%o5,	%g7,	%i1
	movcs	%icc,	%i2,	%i6
	fpsub16s	%f16,	%f27,	%f18
	edge8ln	%o2,	%l4,	%g2
	fmovsn	%xcc,	%f16,	%f7
	orcc	%g5,	0x0A9E,	%i3
	fmovrse	%o0,	%f22,	%f5
	array16	%g4,	%l5,	%i5
	lduw	[%l7 + 0x1C],	%o4
	edge16n	%o1,	%g1,	%o6
	fmovdvc	%icc,	%f29,	%f30
	lduh	[%l7 + 0x46],	%i0
	srl	%l1,	%l2,	%g6
	movge	%icc,	%l0,	%l6
	fxor	%f0,	%f6,	%f28
	movrlz	%i7,	%g3,	%o7
	movrne	%o3,	0x04C,	%i4
	xorcc	%o5,	%g7,	%l3
	edge8l	%i2,	%i6,	%o2
	fzeros	%f16
	or	%i1,	%l4,	%g5
	movvc	%xcc,	%g2,	%o0
	sra	%g4,	%i3,	%l5
	and	%o4,	%o1,	%i5
	edge8n	%o6,	%g1,	%l1
	mova	%icc,	%l2,	%i0
	movl	%icc,	%l0,	%g6
	movle	%icc,	%i7,	%g3
	movrgez	%l6,	0x0C0,	%o7
	srl	%o3,	%o5,	%i4
	sll	%g7,	%l3,	%i2
	movge	%xcc,	%o2,	%i6
	fone	%f18
	orn	%l4,	%g5,	%g2
	mulx	%i1,	0x089B,	%o0
	mova	%xcc,	%i3,	%g4
	movl	%xcc,	%l5,	%o1
	addcc	%i5,	%o6,	%o4
	movre	%g1,	0x206,	%l2
	fcmpne32	%f24,	%f14,	%l1
	sdivcc	%i0,	0x1164,	%g6
	sdivcc	%l0,	0x1E13,	%g3
	fcmped	%fcc1,	%f20,	%f2
	fmovsgu	%icc,	%f27,	%f27
	mulscc	%l6,	%o7,	%o3
	edge8	%o5,	%i4,	%g7
	fxnor	%f22,	%f12,	%f10
	siam	0x5
	sir	0x0A9A
	movrgez	%i7,	0x002,	%i2
	umul	%o2,	%l3,	%i6
	movrne	%l4,	0x221,	%g2
	edge8l	%g5,	%i1,	%o0
	edge16ln	%g4,	%l5,	%i3
	stb	%i5,	[%l7 + 0x2D]
	xor	%o6,	%o4,	%o1
	andcc	%l2,	0x0A8F,	%g1
	nop
	set	0x54, %l2
	lduw	[%l7 + %l2],	%i0
	nop
	set	0x68, %l1
	ldx	[%l7 + %l1],	%g6
	fpsub16s	%f19,	%f6,	%f17
	edge8l	%l1,	%l0,	%g3
	movrgz	%l6,	%o7,	%o5
	stx	%i4,	[%l7 + 0x70]
	fcmple32	%f24,	%f6,	%o3
	fmovrdgez	%i7,	%f30,	%f30
	edge16l	%i2,	%g7,	%l3
	fornot1	%f2,	%f8,	%f12
	smulcc	%i6,	0x19FB,	%o2
	subc	%g2,	%l4,	%g5
	fnot2s	%f16,	%f28
	movvc	%icc,	%o0,	%g4
	umulcc	%i1,	%l5,	%i3
	movleu	%icc,	%i5,	%o4
	edge16n	%o6,	%l2,	%g1
	andn	%o1,	%g6,	%l1
	xor	%i0,	0x0B12,	%l0
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	fsrc2s	%f3,	%f23
	srax	%o5,	%i4,	%o7
	movrgez	%i7,	%o3,	%i2
	sllx	%l3,	0x19,	%i6
	sll	%o2,	%g7,	%g2
	sethi	0x19A4,	%l4
	fpmerge	%f5,	%f18,	%f10
	fmul8x16al	%f24,	%f24,	%f24
	movvc	%xcc,	%o0,	%g5
	fnot1	%f28,	%f6
	fmuld8ulx16	%f23,	%f28,	%f8
	fmovrdlez	%i1,	%f28,	%f6
	fmovsneg	%xcc,	%f31,	%f0
	edge16	%l5,	%i3,	%g4
	udivcc	%i5,	0x105C,	%o4
	subccc	%o6,	0x020C,	%g1
	movcc	%icc,	%o1,	%l2
	ldd	[%l7 + 0x30],	%g6
	edge16l	%l1,	%i0,	%l0
	st	%f7,	[%l7 + 0x54]
	smul	%l6,	0x1DAE,	%g3
	srlx	%o5,	0x08,	%o7
	xorcc	%i4,	0x17F2,	%o3
	orcc	%i7,	%l3,	%i2
	edge32l	%o2,	%i6,	%g2
	subcc	%l4,	%o0,	%g5
	sdiv	%i1,	0x023D,	%l5
	ldub	[%l7 + 0x1B],	%i3
	sdivx	%g7,	0x05F8,	%g4
	addccc	%o4,	%i5,	%o6
	movre	%o1,	%l2,	%g6
	edge8	%g1,	%l1,	%i0
	fmovdl	%icc,	%f26,	%f6
	array16	%l6,	%g3,	%l0
	sdiv	%o5,	0x0861,	%o7
	edge8	%i4,	%o3,	%l3
	sllx	%i2,	%o2,	%i7
	fmovrslz	%i6,	%f6,	%f26
	fcmpne16	%f10,	%f20,	%g2
	fmovdpos	%xcc,	%f16,	%f0
	nop
	set	0x3C, %i3
	lduw	[%l7 + %i3],	%o0
	ldx	[%l7 + 0x18],	%g5
	fmovrslz	%i1,	%f10,	%f21
	add	%l5,	%i3,	%g7
	fmovdvs	%xcc,	%f0,	%f8
	edge16ln	%g4,	%l4,	%o4
	mulscc	%o6,	0x1FE3,	%i5
	andn	%o1,	%g6,	%g1
	movcs	%xcc,	%l1,	%i0
	sdiv	%l6,	0x006A,	%g3
	fmovdneg	%icc,	%f0,	%f23
	array16	%l2,	%l0,	%o7
	movrne	%o5,	0x2B5,	%i4
	ld	[%l7 + 0x08],	%f23
	movleu	%icc,	%l3,	%o3
	fcmpes	%fcc1,	%f15,	%f26
	udivx	%i2,	0x14FF,	%i7
	fcmpne16	%f4,	%f6,	%o2
	edge32	%g2,	%i6,	%g5
	fmovscs	%xcc,	%f18,	%f23
	fnot2	%f24,	%f2
	array16	%o0,	%i1,	%i3
	fmovsvc	%xcc,	%f1,	%f5
	stb	%l5,	[%l7 + 0x1A]
	ld	[%l7 + 0x78],	%f12
	addccc	%g4,	%l4,	%g7
	sllx	%o4,	0x1A,	%i5
	nop
	set	0x18, %i7
	ldx	[%l7 + %i7],	%o1
	movrgz	%g6,	0x150,	%g1
	movrgez	%o6,	%i0,	%l1
	edge8	%g3,	%l2,	%l6
	addccc	%o7,	0x1D36,	%l0
	movrlez	%i4,	0x155,	%o5
	fmovdvc	%icc,	%f26,	%f4
	srax	%l3,	%o3,	%i7
	edge8	%o2,	%g2,	%i2
	ld	[%l7 + 0x6C],	%f17
	sdivx	%g5,	0x005A,	%i6
	addccc	%o0,	0x0C00,	%i3
	sth	%l5,	[%l7 + 0x30]
	edge32ln	%g4,	%i1,	%g7
	fmovrdne	%l4,	%f12,	%f14
	xnorcc	%i5,	%o4,	%o1
	fcmpne16	%f24,	%f4,	%g1
	sdivcc	%g6,	0x1385,	%o6
	fpsub16	%f26,	%f0,	%f6
	subcc	%i0,	%g3,	%l2
	addccc	%l6,	%l1,	%o7
	fmovdgu	%icc,	%f17,	%f24
	edge8	%i4,	%l0,	%o5
	ldd	[%l7 + 0x18],	%f12
	edge32ln	%l3,	%o3,	%o2
	movge	%xcc,	%g2,	%i2
	movge	%icc,	%i7,	%g5
	xnor	%o0,	%i6,	%l5
	ldsh	[%l7 + 0x40],	%i3
	smulcc	%g4,	%g7,	%l4
	movvc	%icc,	%i5,	%i1
	ldsh	[%l7 + 0x40],	%o4
	fmovsn	%xcc,	%f17,	%f14
	alignaddr	%o1,	%g1,	%o6
	addc	%g6,	0x0C65,	%i0
	popc	0x12F0,	%l2
	lduh	[%l7 + 0x2C],	%l6
	sethi	0x0B29,	%g3
	fmovdvc	%icc,	%f30,	%f19
	smulcc	%o7,	0x163D,	%l1
	fornot1	%f30,	%f26,	%f20
	andncc	%l0,	%i4,	%l3
	edge32ln	%o3,	%o2,	%o5
	smulcc	%g2,	0x1691,	%i7
	srax	%g5,	0x1F,	%o0
	fpadd32s	%f16,	%f30,	%f2
	movrgez	%i6,	%i2,	%i3
	lduh	[%l7 + 0x28],	%g4
	lduw	[%l7 + 0x7C],	%l5
	srax	%g7,	0x0B,	%i5
	edge8n	%l4,	%o4,	%o1
	fmovscc	%icc,	%f8,	%f6
	orcc	%i1,	0x1FDE,	%o6
	pdist	%f10,	%f12,	%f0
	sra	%g1,	%g6,	%l2
	udiv	%i0,	0x1689,	%g3
	ldx	[%l7 + 0x78],	%o7
	ldsw	[%l7 + 0x18],	%l1
	fpsub32	%f30,	%f26,	%f22
	movgu	%icc,	%l6,	%l0
	sth	%i4,	[%l7 + 0x42]
	fmovde	%icc,	%f5,	%f11
	sll	%o3,	0x12,	%l3
	edge32n	%o2,	%g2,	%o5
	fpsub16	%f0,	%f18,	%f28
	fcmpne16	%f24,	%f14,	%i7
	movrlez	%o0,	%g5,	%i2
	fmovrsgz	%i3,	%f20,	%f26
	movn	%xcc,	%g4,	%l5
	movvc	%icc,	%i6,	%i5
	edge16l	%l4,	%g7,	%o1
	movle	%icc,	%i1,	%o4
	array16	%g1,	%g6,	%o6
	sra	%i0,	%g3,	%l2
	movcc	%icc,	%o7,	%l1
	fpmerge	%f27,	%f6,	%f30
	xnor	%l0,	0x0CDD,	%l6
	array16	%o3,	%l3,	%o2
	save %g2, %i4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i7,	%o0
	stb	%g5,	[%l7 + 0x5F]
	fxnor	%f10,	%f4,	%f4
	orn	%i2,	%g4,	%l5
	movgu	%xcc,	%i3,	%i6
	fxors	%f28,	%f15,	%f10
	fones	%f11
	fnegd	%f10,	%f2
	edge16	%l4,	%g7,	%i5
	ldub	[%l7 + 0x30],	%o1
	array8	%o4,	%g1,	%i1
	fornot1s	%f7,	%f8,	%f27
	subccc	%o6,	0x0D4B,	%g6
	ldub	[%l7 + 0x39],	%i0
	subcc	%g3,	%o7,	%l1
	ldx	[%l7 + 0x78],	%l0
	stx	%l6,	[%l7 + 0x40]
	addcc	%l2,	%o3,	%l3
	fmul8ulx16	%f10,	%f26,	%f4
	or	%o2,	0x1A20,	%i4
	fcmpeq32	%f24,	%f18,	%o5
	edge16n	%i7,	%o0,	%g2
	edge16	%g5,	%i2,	%g4
	edge16	%i3,	%l5,	%l4
	sllx	%g7,	0x1C,	%i6
	movn	%icc,	%o1,	%i5
	xnorcc	%o4,	%g1,	%o6
	xorcc	%i1,	0x0E36,	%i0
	array32	%g6,	%g3,	%o7
	movle	%icc,	%l1,	%l0
	fnegs	%f3,	%f22
	movrne	%l6,	%o3,	%l2
	xor	%l3,	0x123B,	%o2
	udivcc	%o5,	0x0782,	%i4
	xnor	%o0,	%g2,	%i7
	sub	%g5,	%g4,	%i2
	andn	%l5,	0x19B9,	%l4
	edge8n	%i3,	%i6,	%g7
	alignaddrl	%i5,	%o4,	%g1
	edge32	%o6,	%o1,	%i1
	fors	%f0,	%f11,	%f5
	mulx	%i0,	%g6,	%g3
	edge32n	%o7,	%l0,	%l6
	sra	%l1,	%o3,	%l3
	movneg	%icc,	%l2,	%o5
	edge32l	%o2,	%i4,	%g2
	movl	%xcc,	%o0,	%i7
	movn	%icc,	%g5,	%g4
	movleu	%xcc,	%l5,	%i2
	fmovsleu	%xcc,	%f24,	%f11
	alignaddrl	%l4,	%i6,	%g7
	mova	%xcc,	%i3,	%o4
	edge16n	%i5,	%g1,	%o6
	fmovse	%xcc,	%f1,	%f27
	move	%icc,	%o1,	%i0
	sdiv	%g6,	0x1DBA,	%g3
	edge8	%i1,	%l0,	%l6
	fmovrdne	%l1,	%f6,	%f14
	restore %o3, %o7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%o5,	%l3
	edge16l	%o2,	%i4,	%g2
	fcmpd	%fcc3,	%f18,	%f16
	sll	%i7,	%g5,	%g4
	array32	%o0,	%l5,	%i2
	fzero	%f24
	fmovsa	%xcc,	%f7,	%f18
	orncc	%l4,	%i6,	%g7
	subc	%o4,	%i5,	%i3
	orn	%g1,	%o1,	%i0
	ldd	[%l7 + 0x08],	%f24
	sllx	%g6,	0x1B,	%o6
	mova	%icc,	%i1,	%g3
	movrgz	%l0,	0x15A,	%l6
	movg	%xcc,	%l1,	%o3
	mulx	%o7,	0x19D9,	%l2
	movne	%icc,	%l3,	%o2
	popc	0x133F,	%o5
	ld	[%l7 + 0x50],	%f1
	save %g2, 0x026B, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g5,	0x080,	%g4
	srlx	%i4,	0x00,	%o0
	fandnot1s	%f22,	%f18,	%f9
	ldd	[%l7 + 0x68],	%f6
	std	%f26,	[%l7 + 0x18]
	mova	%icc,	%l5,	%i2
	sdivx	%i6,	0x11A0,	%l4
	movgu	%icc,	%o4,	%i5
	edge16ln	%i3,	%g7,	%o1
	addc	%i0,	0x0441,	%g1
	edge16	%g6,	%i1,	%o6
	smul	%g3,	%l0,	%l6
	xor	%o3,	%o7,	%l2
	edge8n	%l1,	%l3,	%o2
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	save %g5, 0x09D4, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f19,	%f30
	edge32l	%g4,	%o0,	%l5
	srlx	%i4,	0x18,	%i6
	ldd	[%l7 + 0x48],	%i2
	lduh	[%l7 + 0x74],	%o4
	fmovrdne	%l4,	%f26,	%f8
	restore %i5, %i3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g7,	%i0,	%g6
	orn	%i1,	0x0DD0,	%g1
	fornot2	%f14,	%f12,	%f28
	sethi	0x042C,	%o6
	udivx	%g3,	0x07BD,	%l6
	stb	%o3,	[%l7 + 0x3F]
	ldub	[%l7 + 0x7B],	%l0
	fcmpne32	%f12,	%f4,	%o7
	edge32n	%l2,	%l3,	%l1
	addc	%o5,	0x1CE1,	%g2
	fmovsleu	%icc,	%f22,	%f1
	sethi	0x054A,	%o2
	save %i7, %g4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f14,	%f0,	%f10
	lduh	[%l7 + 0x60],	%g5
	movgu	%icc,	%l5,	%i6
	array32	%i2,	%i4,	%l4
	fnot2s	%f8,	%f14
	stb	%o4,	[%l7 + 0x2F]
	ld	[%l7 + 0x70],	%f7
	movvs	%xcc,	%i3,	%o1
	stb	%i5,	[%l7 + 0x2E]
	umulcc	%i0,	%g6,	%g7
	sub	%i1,	%g1,	%o6
	lduw	[%l7 + 0x10],	%g3
	addccc	%l6,	0x1BC3,	%l0
	edge16	%o3,	%l2,	%o7
	sub	%l1,	0x04E8,	%o5
	save %l3, %g2, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i7,	%g4,	%o0
	fpsub16	%f14,	%f28,	%f24
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	xnor	%i6,	0x1A0C,	%i4
	movrlz	%l4,	%o4,	%i2
	movneg	%icc,	%i3,	%i5
	st	%f31,	[%l7 + 0x4C]
	edge16	%o1,	%g6,	%i0
	movleu	%xcc,	%g7,	%g1
	fpadd16s	%f13,	%f30,	%f15
	alignaddr	%i1,	%o6,	%l6
	smul	%g3,	0x02EC,	%o3
	smulcc	%l0,	%o7,	%l1
	fnot2	%f22,	%f2
	fmovrde	%l2,	%f6,	%f26
	addcc	%o5,	0x1826,	%l3
	srax	%o2,	0x09,	%i7
	sdiv	%g4,	0x0807,	%g2
	fmovrdlez	%l5,	%f14,	%f16
	movg	%icc,	%o0,	%g5
	stx	%i6,	[%l7 + 0x78]
	fmovrse	%l4,	%f0,	%f0
	movvc	%icc,	%o4,	%i2
	lduw	[%l7 + 0x08],	%i3
	sdivx	%i5,	0x12AB,	%o1
	stw	%i4,	[%l7 + 0x7C]
	fabsd	%f22,	%f8
	andn	%i0,	%g7,	%g1
	sth	%g6,	[%l7 + 0x6E]
	srax	%i1,	0x0F,	%o6
	sir	0x006E
	movre	%l6,	%g3,	%o3
	fcmps	%fcc2,	%f26,	%f26
	edge16	%o7,	%l1,	%l2
	sll	%l0,	0x0A,	%l3
	array8	%o5,	%o2,	%g4
	addcc	%i7,	0x0364,	%g2
	sdivx	%o0,	0x1DBD,	%l5
	alignaddr	%i6,	%l4,	%g5
	sdivcc	%o4,	0x1029,	%i3
	sra	%i2,	%o1,	%i4
	movneg	%xcc,	%i0,	%g7
	add	%i5,	%g6,	%g1
	subcc	%i1,	0x0785,	%o6
	sllx	%l6,	0x03,	%o3
	fmovscc	%xcc,	%f6,	%f20
	sllx	%g3,	%l1,	%o7
	fzeros	%f1
	fors	%f2,	%f6,	%f16
	orncc	%l0,	%l3,	%l2
	ldd	[%l7 + 0x78],	%o4
	movleu	%xcc,	%g4,	%o2
	fmovdpos	%xcc,	%f18,	%f30
	edge8	%g2,	%o0,	%l5
	addcc	%i6,	%i7,	%g5
	edge32l	%o4,	%l4,	%i2
	movrgez	%o1,	%i4,	%i0
	movne	%xcc,	%g7,	%i3
	sth	%g6,	[%l7 + 0x26]
	sdivcc	%g1,	0x1440,	%i5
	mulx	%o6,	0x0377,	%l6
	fsrc2s	%f18,	%f19
	fnor	%f24,	%f18,	%f10
	fors	%f26,	%f26,	%f26
	movne	%xcc,	%i1,	%o3
	movrlez	%l1,	%o7,	%l0
	edge32	%g3,	%l2,	%o5
	movrne	%g4,	0x30E,	%o2
	movvs	%xcc,	%g2,	%o0
	fcmpes	%fcc2,	%f9,	%f22
	movge	%xcc,	%l5,	%l3
	ldx	[%l7 + 0x48],	%i7
	movge	%xcc,	%i6,	%g5
	sllx	%o4,	%i2,	%o1
	alignaddr	%l4,	%i0,	%i4
	stx	%g7,	[%l7 + 0x68]
	movrgez	%i3,	0x3C2,	%g1
	movg	%icc,	%g6,	%o6
	fmovdl	%xcc,	%f2,	%f18
	fmovrslz	%l6,	%f30,	%f10
	and	%i5,	0x05E6,	%o3
	edge32ln	%i1,	%o7,	%l0
	edge32	%g3,	%l1,	%o5
	nop
	set	0x58, %o0
	ldsw	[%l7 + %o0],	%l2
	fmovdge	%xcc,	%f20,	%f5
	edge32ln	%o2,	%g4,	%g2
	or	%l5,	%l3,	%i7
	array8	%o0,	%i6,	%o4
	fnand	%f20,	%f6,	%f24
	restore %i2, 0x19E6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	sdivx	%i4,	0x0E4B,	%g7
	smulcc	%g1,	%i3,	%o6
	movg	%icc,	%g6,	%i5
	edge16n	%o3,	%l6,	%i1
	addccc	%l0,	%g3,	%l1
	fmovspos	%icc,	%f25,	%f6
	pdist	%f30,	%f8,	%f22
	fmovrse	%o5,	%f18,	%f23
	fmovsa	%xcc,	%f23,	%f14
	fzero	%f26
	ldsh	[%l7 + 0x74],	%o7
	fmovrsne	%l2,	%f0,	%f5
	fmovdn	%icc,	%f31,	%f26
	fxors	%f29,	%f13,	%f8
	fnands	%f30,	%f26,	%f13
	sir	0x0F46
	save %g4, %g2, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l3,	0x1D64,	%l5
	ld	[%l7 + 0x20],	%f26
	fone	%f16
	movvs	%icc,	%i7,	%i6
	ldd	[%l7 + 0x08],	%f2
	alignaddrl	%o0,	%o4,	%i2
	srax	%o1,	%g5,	%l4
	ldub	[%l7 + 0x4B],	%i0
	fcmpgt32	%f20,	%f4,	%i4
	array8	%g1,	%g7,	%i3
	fcmpne16	%f28,	%f6,	%g6
	move	%xcc,	%i5,	%o6
	srlx	%o3,	0x00,	%l6
	srax	%i1,	0x06,	%l0
	restore %g3, 0x02C3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%o5,	%l2
	movn	%xcc,	%o7,	%g4
	sll	%o2,	%l3,	%g2
	save %i7, %i6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f28,	%f22
	udivx	%o4,	0x1559,	%l5
	popc	0x1A34,	%i2
	fmul8x16al	%f31,	%f28,	%f24
	sra	%g5,	0x1C,	%l4
	fpackfix	%f14,	%f3
	smulcc	%o1,	0x1B2F,	%i0
	addc	%i4,	0x105C,	%g1
	xnorcc	%g7,	0x093F,	%i3
	ld	[%l7 + 0x64],	%f29
	sethi	0x09B7,	%g6
	movcc	%xcc,	%i5,	%o3
	umul	%l6,	0x1A70,	%o6
	fandnot2s	%f23,	%f10,	%f20
	movrgz	%l0,	0x3A6,	%i1
	xnorcc	%g3,	%l1,	%o5
	ldx	[%l7 + 0x68],	%o7
	fcmple16	%f2,	%f18,	%g4
	movleu	%icc,	%l2,	%o2
	fornot1	%f4,	%f8,	%f28
	fmovscc	%xcc,	%f0,	%f5
	fsrc2	%f12,	%f0
	ldsh	[%l7 + 0x30],	%g2
	udivx	%l3,	0x16A9,	%i7
	fnot2s	%f5,	%f13
	fmovsl	%icc,	%f24,	%f23
	move	%icc,	%o0,	%o4
	movrlz	%i6,	%l5,	%i2
	xnor	%g5,	0x1BCF,	%o1
	lduw	[%l7 + 0x78],	%i0
	fmovrdgz	%l4,	%f26,	%f10
	alignaddr	%i4,	%g1,	%g7
	edge8l	%i3,	%g6,	%i5
	alignaddr	%o3,	%l6,	%o6
	fornot2	%f24,	%f28,	%f16
	xnorcc	%i1,	%g3,	%l1
	addcc	%l0,	%o5,	%g4
	movle	%xcc,	%l2,	%o2
	stw	%o7,	[%l7 + 0x60]
	movl	%xcc,	%g2,	%l3
	movrgez	%o0,	%i7,	%o4
	andcc	%l5,	0x1B3F,	%i2
	sllx	%i6,	%o1,	%g5
	bshuffle	%f26,	%f6,	%f14
	lduh	[%l7 + 0x5E],	%l4
	sdivcc	%i4,	0x1176,	%g1
	sllx	%g7,	%i0,	%i3
	ldd	[%l7 + 0x78],	%g6
	fmuld8sux16	%f9,	%f1,	%f24
	sdivcc	%i5,	0x0656,	%o3
	udivcc	%o6,	0x16B8,	%l6
	stx	%i1,	[%l7 + 0x70]
	edge32	%l1,	%l0,	%g3
	and	%g4,	0x11AE,	%o5
	lduw	[%l7 + 0x74],	%l2
	edge32l	%o7,	%o2,	%g2
	fmovdn	%xcc,	%f12,	%f29
	ldsb	[%l7 + 0x2E],	%l3
	ldx	[%l7 + 0x78],	%o0
	movcc	%xcc,	%o4,	%l5
	lduh	[%l7 + 0x1A],	%i7
	fmovsle	%icc,	%f31,	%f17
	movneg	%icc,	%i2,	%o1
	mulx	%g5,	0x004B,	%l4
	edge8l	%i4,	%i6,	%g1
	movl	%icc,	%i0,	%g7
	movpos	%icc,	%g6,	%i5
	fmul8sux16	%f8,	%f6,	%f8
	andncc	%i3,	%o3,	%l6
	fors	%f31,	%f9,	%f24
	addc	%i1,	%o6,	%l0
	addcc	%g3,	%g4,	%o5
	ldsb	[%l7 + 0x19],	%l2
	fpackfix	%f22,	%f24
	ldsw	[%l7 + 0x18],	%o7
	fmovrsgz	%l1,	%f0,	%f19
	fcmple16	%f6,	%f28,	%o2
	sdivx	%l3,	0x04F0,	%g2
	movrgez	%o4,	0x1DE,	%l5
	ldub	[%l7 + 0x0E],	%o0
	movcs	%xcc,	%i7,	%o1
	stw	%g5,	[%l7 + 0x48]
	mova	%xcc,	%l4,	%i4
	std	%f0,	[%l7 + 0x20]
	fpack32	%f0,	%f30,	%f6
	fpsub32	%f22,	%f2,	%f22
	sdivcc	%i2,	0x19A0,	%i6
	fcmple16	%f24,	%f24,	%i0
	fexpand	%f21,	%f0
	edge32	%g1,	%g7,	%g6
	movcs	%icc,	%i3,	%i5
	movgu	%xcc,	%o3,	%i1
	edge16	%l6,	%l0,	%o6
	fmul8sux16	%f24,	%f4,	%f12
	fornot1	%f12,	%f0,	%f12
	edge16	%g3,	%g4,	%o5
	umulcc	%o7,	0x06CB,	%l2
	ldub	[%l7 + 0x0D],	%l1
	movg	%xcc,	%l3,	%g2
	fcmpeq32	%f26,	%f6,	%o4
	edge16	%l5,	%o0,	%i7
	fpsub32	%f14,	%f10,	%f24
	fpadd16	%f14,	%f6,	%f16
	addc	%o2,	0x1DCE,	%g5
	movre	%l4,	0x2C3,	%i4
	std	%f26,	[%l7 + 0x50]
	movle	%xcc,	%o1,	%i6
	subccc	%i0,	0x09FD,	%g1
	sethi	0x15A7,	%i2
	array16	%g7,	%g6,	%i3
	udivx	%i5,	0x0F64,	%o3
	add	%l6,	0x05FA,	%l0
	ldsh	[%l7 + 0x28],	%o6
	fexpand	%f4,	%f0
	edge8n	%i1,	%g3,	%g4
	movneg	%icc,	%o5,	%o7
	fnand	%f2,	%f28,	%f24
	addc	%l2,	0x0AB4,	%l3
	fcmpgt32	%f0,	%f10,	%g2
	for	%f10,	%f14,	%f6
	movrlez	%l1,	0x0DD,	%l5
	alignaddr	%o0,	%i7,	%o2
	save %g5, 0x149A, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l4,	%i4,	%o1
	fmovdleu	%xcc,	%f2,	%f25
	std	%f26,	[%l7 + 0x48]
	fcmpgt16	%f26,	%f20,	%i6
	fmovrdlz	%g1,	%f8,	%f26
	edge32ln	%i2,	%i0,	%g6
	bshuffle	%f24,	%f6,	%f12
	fcmpgt16	%f14,	%f18,	%i3
	alignaddr	%i5,	%o3,	%g7
	andncc	%l6,	%l0,	%i1
	fsrc1s	%f12,	%f12
	fcmpd	%fcc1,	%f10,	%f26
	umulcc	%o6,	0x1397,	%g3
	move	%icc,	%o5,	%o7
	sethi	0x0991,	%g4
	movre	%l3,	0x011,	%g2
	movcc	%xcc,	%l1,	%l5
	fmovsne	%icc,	%f14,	%f11
	ldsw	[%l7 + 0x3C],	%l2
	ldub	[%l7 + 0x74],	%i7
	edge32l	%o0,	%o2,	%g5
	popc	%l4,	%i4
	edge16ln	%o1,	%i6,	%o4
	movle	%xcc,	%i2,	%i0
	xorcc	%g1,	%g6,	%i5
	subc	%i3,	%o3,	%g7
	fpack32	%f28,	%f0,	%f8
	orcc	%l0,	0x1077,	%l6
	edge16ln	%o6,	%g3,	%i1
	orcc	%o7,	%o5,	%l3
	movleu	%icc,	%g2,	%l1
	array8	%l5,	%g4,	%i7
	sdiv	%o0,	0x0710,	%l2
	fmovrdne	%o2,	%f20,	%f2
	fornot2s	%f22,	%f4,	%f28
	addc	%l4,	%i4,	%o1
	alignaddrl	%g5,	%i6,	%i2
	smulcc	%i0,	%g1,	%o4
	fcmpes	%fcc0,	%f0,	%f19
	popc	%g6,	%i5
	fcmpd	%fcc0,	%f28,	%f0
	fnor	%f28,	%f16,	%f16
	movrne	%i3,	0x208,	%g7
	movrgz	%o3,	0x165,	%l0
	fcmpgt32	%f26,	%f24,	%l6
	movrne	%o6,	0x145,	%g3
	smul	%i1,	0x197F,	%o5
	xnor	%l3,	0x073F,	%o7
	fcmpne32	%f28,	%f14,	%l1
	umulcc	%l5,	%g4,	%i7
	movpos	%xcc,	%o0,	%l2
	ldub	[%l7 + 0x5C],	%o2
	orn	%l4,	%g2,	%o1
	fandnot2s	%f30,	%f30,	%f0
	nop
	set	0x08, %l6
	std	%f12,	[%l7 + %l6]
	edge32l	%g5,	%i6,	%i4
	mulx	%i0,	%g1,	%o4
	fnors	%f16,	%f7,	%f0
	fmovda	%xcc,	%f11,	%f17
	sdiv	%g6,	0x1573,	%i5
	udivx	%i3,	0x1074,	%i2
	movl	%xcc,	%o3,	%g7
	xorcc	%l6,	0x0086,	%o6
	mulscc	%g3,	%i1,	%l0
	ld	[%l7 + 0x0C],	%f17
	orcc	%l3,	0x0341,	%o7
	fmovrde	%l1,	%f8,	%f10
	fcmpne16	%f24,	%f20,	%l5
	movleu	%icc,	%o5,	%i7
	movcs	%xcc,	%o0,	%l2
	lduh	[%l7 + 0x6E],	%g4
	edge32l	%o2,	%g2,	%o1
	movleu	%xcc,	%g5,	%i6
	array16	%i4,	%l4,	%g1
	umulcc	%i0,	0x16CD,	%o4
	movg	%xcc,	%g6,	%i3
	smul	%i2,	%o3,	%g7
	sub	%l6,	0x03DE,	%i5
	fxnor	%f14,	%f4,	%f14
	srlx	%g3,	%i1,	%o6
	fmovdg	%icc,	%f12,	%f6
	edge16n	%l3,	%l0,	%o7
	fmovsvs	%icc,	%f14,	%f6
	srax	%l5,	0x1B,	%o5
	movcs	%xcc,	%l1,	%o0
	ld	[%l7 + 0x34],	%f3
	movrne	%l2,	0x050,	%i7
	addccc	%g4,	0x0529,	%o2
	movn	%icc,	%g2,	%o1
	movrlz	%g5,	%i6,	%l4
	movcs	%icc,	%g1,	%i4
	fpack16	%f30,	%f9
	umulcc	%o4,	0x07BB,	%i0
	fmovsge	%icc,	%f8,	%f20
	movrne	%i3,	0x12F,	%i2
	fmovrdlz	%g6,	%f24,	%f30
	movvc	%icc,	%o3,	%g7
	sdivx	%i5,	0x0ACD,	%g3
	movgu	%xcc,	%i1,	%l6
	nop
	set	0x16, %g4
	lduh	[%l7 + %g4],	%l3
	orcc	%l0,	%o7,	%o6
	movrlz	%l5,	0x304,	%l1
	orcc	%o5,	0x0E1E,	%l2
	lduw	[%l7 + 0x54],	%i7
	edge32l	%g4,	%o0,	%o2
	sethi	0x0766,	%o1
	sllx	%g5,	%i6,	%g2
	fcmped	%fcc0,	%f28,	%f28
	fmovrdlez	%l4,	%f8,	%f6
	andcc	%g1,	0x0636,	%o4
	faligndata	%f28,	%f22,	%f20
	movl	%icc,	%i0,	%i4
	ldsb	[%l7 + 0x52],	%i2
	sth	%g6,	[%l7 + 0x36]
	movvc	%icc,	%i3,	%o3
	udivcc	%g7,	0x0A27,	%i5
	alignaddrl	%i1,	%l6,	%l3
	ldd	[%l7 + 0x38],	%l0
	ldsh	[%l7 + 0x58],	%o7
	xnor	%g3,	%o6,	%l5
	xnor	%o5,	%l1,	%l2
	smulcc	%i7,	0x013A,	%g4
	edge32l	%o0,	%o1,	%o2
	stx	%i6,	[%l7 + 0x08]
	movleu	%xcc,	%g5,	%g2
	xnor	%g1,	%l4,	%o4
	udiv	%i4,	0x129E,	%i0
	mulx	%g6,	0x00A1,	%i2
	srlx	%o3,	%i3,	%g7
	subccc	%i1,	0x1796,	%l6
	edge8	%i5,	%l3,	%o7
	sra	%g3,	0x0F,	%o6
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	fmovsge	%xcc,	%f31,	%f29
	mulscc	%l2,	0x1BDF,	%i7
	restore %g4, %o0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l1,	0x0932,	%i6
	subc	%o2,	0x0866,	%g2
	faligndata	%f30,	%f18,	%f6
	sdivx	%g5,	0x06DF,	%g1
	edge16ln	%l4,	%i4,	%i0
	orn	%o4,	%i2,	%g6
	edge16n	%i3,	%g7,	%i1
	movre	%o3,	0x09E,	%i5
	fmovdg	%icc,	%f10,	%f17
	fand	%f4,	%f14,	%f30
	ldsb	[%l7 + 0x31],	%l3
	orncc	%l6,	%o7,	%g3
	udiv	%o6,	0x1B66,	%l0
	alignaddrl	%o5,	%l2,	%i7
	edge32l	%l5,	%o0,	%o1
	array16	%l1,	%g4,	%i6
	smul	%o2,	0x1423,	%g5
	ldsw	[%l7 + 0x64],	%g2
	fnot1s	%f3,	%f29
	stb	%l4,	[%l7 + 0x29]
	ldsh	[%l7 + 0x20],	%i4
	movrgz	%i0,	0x11E,	%o4
	movg	%icc,	%i2,	%g1
	fmovrse	%g6,	%f22,	%f7
	edge8l	%i3,	%i1,	%o3
	popc	%i5,	%g7
	fmovs	%f8,	%f23
	sub	%l3,	0x158C,	%o7
	or	%l6,	%o6,	%l0
	movge	%xcc,	%g3,	%o5
	array8	%i7,	%l5,	%l2
	orcc	%o0,	0x0C1C,	%l1
	ld	[%l7 + 0x54],	%f26
	add	%g4,	0x1190,	%o1
	edge32n	%i6,	%g5,	%g2
	save %l4, 0x0EA9, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i4,	0x0AAF,	%i0
	edge8l	%o4,	%i2,	%g6
	and	%i3,	%g1,	%o3
	xnor	%i5,	%g7,	%i1
	fcmpeq32	%f26,	%f28,	%l3
	edge32n	%l6,	%o7,	%l0
	movrne	%o6,	%o5,	%i7
	alignaddr	%l5,	%g3,	%l2
	fmovrsne	%l1,	%f8,	%f10
	smul	%g4,	%o1,	%i6
	fmovsleu	%xcc,	%f23,	%f22
	fcmpes	%fcc2,	%f13,	%f19
	fpadd16	%f30,	%f16,	%f28
	edge8	%o0,	%g2,	%g5
	edge16l	%l4,	%i4,	%i0
	popc	0x0F06,	%o4
	fmovde	%icc,	%f31,	%f2
	sdivcc	%i2,	0x0F6F,	%o2
	edge8n	%i3,	%g1,	%g6
	fmul8ulx16	%f10,	%f12,	%f30
	movrgez	%i5,	0x314,	%g7
	lduw	[%l7 + 0x0C],	%i1
	xorcc	%o3,	%l6,	%l3
	movge	%icc,	%o7,	%o6
	stb	%l0,	[%l7 + 0x16]
	st	%f18,	[%l7 + 0x78]
	stb	%i7,	[%l7 + 0x5C]
	srl	%l5,	%g3,	%o5
	ldd	[%l7 + 0x20],	%f4
	fcmpgt16	%f20,	%f16,	%l1
	edge16	%l2,	%g4,	%o1
	ld	[%l7 + 0x3C],	%f17
	fcmpgt32	%f26,	%f2,	%i6
	xnorcc	%g2,	0x15CA,	%g5
	srax	%o0,	%i4,	%l4
	movrlz	%o4,	%i2,	%o2
	and	%i3,	%i0,	%g6
	mulscc	%i5,	0x0361,	%g7
	stw	%i1,	[%l7 + 0x14]
	subccc	%o3,	%l6,	%l3
	xnor	%g1,	0x1C9F,	%o7
	edge8	%l0,	%o6,	%i7
	sdiv	%l5,	0x1EBE,	%o5
	nop
	set	0x39, %l0
	ldsb	[%l7 + %l0],	%l1
	fmovscs	%icc,	%f22,	%f29
	stw	%l2,	[%l7 + 0x68]
	fmovsne	%xcc,	%f9,	%f29
	edge8ln	%g3,	%o1,	%i6
	fmovrsne	%g2,	%f23,	%f31
	edge8	%g4,	%g5,	%o0
	movre	%i4,	0x11E,	%l4
	move	%icc,	%o4,	%o2
	lduh	[%l7 + 0x1C],	%i2
	ldx	[%l7 + 0x40],	%i3
	movgu	%xcc,	%g6,	%i0
	srax	%i5,	%i1,	%o3
	popc	%l6,	%g7
	sub	%l3,	%g1,	%o7
	popc	%l0,	%o6
	movle	%icc,	%i7,	%l5
	edge8	%l1,	%l2,	%g3
	edge32l	%o5,	%o1,	%i6
	movge	%icc,	%g2,	%g4
	srl	%o0,	%i4,	%l4
	orcc	%o4,	0x0611,	%o2
	fnegd	%f2,	%f16
	edge8n	%g5,	%i2,	%g6
	edge16l	%i0,	%i3,	%i1
	movrne	%o3,	%i5,	%l6
	fmovrdlez	%l3,	%f22,	%f8
	sub	%g1,	0x15C2,	%o7
	edge8	%g7,	%o6,	%l0
	stb	%i7,	[%l7 + 0x40]
	mova	%icc,	%l1,	%l2
	fabss	%f18,	%f23
	bshuffle	%f0,	%f22,	%f28
	stw	%l5,	[%l7 + 0x74]
	udiv	%g3,	0x1E84,	%o1
	edge32n	%o5,	%g2,	%g4
	movrlez	%i6,	%i4,	%l4
	movge	%xcc,	%o4,	%o0
	orn	%o2,	0x1746,	%g5
	subcc	%i2,	%i0,	%g6
	xor	%i3,	%i1,	%o3
	fnegd	%f4,	%f28
	movgu	%xcc,	%i5,	%l6
	fxor	%f22,	%f18,	%f18
	edge8ln	%l3,	%g1,	%o7
	ldd	[%l7 + 0x38],	%f14
	movre	%o6,	%l0,	%g7
	fmovdle	%icc,	%f4,	%f0
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%f16
	andcc	%l1,	0x0625,	%i7
	movrne	%l2,	%l5,	%g3
	fmovdn	%xcc,	%f21,	%f6
	add	%o5,	%o1,	%g4
	edge16n	%i6,	%i4,	%g2
	movrlz	%l4,	%o4,	%o2
	move	%icc,	%o0,	%g5
	udivcc	%i0,	0x1503,	%i2
	ld	[%l7 + 0x10],	%f3
	movrlz	%g6,	0x21D,	%i1
	edge16n	%i3,	%o3,	%l6
	movneg	%icc,	%l3,	%g1
	lduh	[%l7 + 0x48],	%o7
	fmovrsne	%i5,	%f18,	%f24
	addcc	%l0,	%g7,	%o6
	movcc	%xcc,	%l1,	%l2
	udivcc	%l5,	0x04D9,	%g3
	array16	%i7,	%o1,	%o5
	srl	%g4,	0x1B,	%i6
	ldub	[%l7 + 0x41],	%i4
	xor	%g2,	0x078F,	%o4
	lduw	[%l7 + 0x44],	%o2
	mova	%icc,	%l4,	%g5
	movleu	%xcc,	%o0,	%i2
	movle	%icc,	%g6,	%i0
	movn	%xcc,	%i1,	%o3
	save %i3, %l6, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x3B],	%o7
	edge32n	%i5,	%g1,	%g7
	fcmpeq32	%f18,	%f6,	%o6
	addccc	%l0,	%l1,	%l2
	smulcc	%l5,	0x16AE,	%i7
	orn	%o1,	%g3,	%g4
	fpadd32s	%f8,	%f15,	%f26
	orn	%o5,	0x0073,	%i6
	and	%g2,	0x1C29,	%o4
	udivcc	%o2,	0x1411,	%i4
	xnorcc	%l4,	%o0,	%g5
	popc	0x143D,	%g6
	movrgz	%i2,	%i0,	%o3
	fcmpgt16	%f22,	%f16,	%i3
	sth	%i1,	[%l7 + 0x24]
	orcc	%l6,	%l3,	%i5
	andncc	%o7,	%g7,	%o6
	ld	[%l7 + 0x54],	%f3
	bshuffle	%f0,	%f2,	%f4
	movrne	%g1,	0x2FB,	%l0
	popc	0x1682,	%l2
	orncc	%l5,	%i7,	%l1
	xnor	%g3,	%o1,	%o5
	movrlez	%i6,	%g2,	%g4
	fones	%f20
	xorcc	%o4,	0x0E33,	%o2
	fmovde	%xcc,	%f14,	%f29
	stw	%l4,	[%l7 + 0x38]
	ldsh	[%l7 + 0x72],	%i4
	ldub	[%l7 + 0x37],	%o0
	ldd	[%l7 + 0x08],	%f6
	edge8n	%g5,	%g6,	%i0
	udivx	%o3,	0x14B8,	%i3
	addcc	%i2,	0x05B2,	%l6
	sth	%l3,	[%l7 + 0x7E]
	xorcc	%i1,	0x1F97,	%i5
	edge8	%g7,	%o7,	%g1
	srax	%l0,	%o6,	%l5
	movvc	%icc,	%l2,	%i7
	fmovrdgz	%g3,	%f16,	%f14
	ldsb	[%l7 + 0x7D],	%o1
	st	%f13,	[%l7 + 0x08]
	fmovsge	%xcc,	%f27,	%f31
	orncc	%o5,	0x10D2,	%i6
	ldx	[%l7 + 0x08],	%l1
	mulscc	%g2,	0x1E3D,	%g4
	xnorcc	%o4,	0x1ED7,	%o2
	array16	%i4,	%l4,	%g5
	sdivx	%o0,	0x162F,	%i0
	move	%xcc,	%g6,	%i3
	ldd	[%l7 + 0x68],	%f8
	edge8n	%o3,	%l6,	%i2
	andncc	%l3,	%i1,	%g7
	fornot1s	%f9,	%f22,	%f14
	edge16	%o7,	%g1,	%i5
	edge8n	%o6,	%l5,	%l0
	stx	%l2,	[%l7 + 0x38]
	fmovdvc	%icc,	%f15,	%f12
	mova	%xcc,	%i7,	%g3
	udiv	%o1,	0x1E82,	%i6
	fmovdneg	%xcc,	%f16,	%f16
	popc	%o5,	%l1
	and	%g2,	%g4,	%o2
	fmovdn	%xcc,	%f22,	%f19
	sra	%o4,	0x06,	%l4
	addc	%g5,	%o0,	%i4
	srlx	%g6,	%i0,	%o3
	alignaddrl	%l6,	%i3,	%i2
	alignaddrl	%i1,	%l3,	%o7
	ldsh	[%l7 + 0x22],	%g7
	stw	%g1,	[%l7 + 0x6C]
	movleu	%icc,	%i5,	%o6
	edge8ln	%l5,	%l0,	%i7
	udiv	%l2,	0x0A8B,	%o1
	movpos	%xcc,	%i6,	%g3
	edge16n	%l1,	%o5,	%g4
	or	%o2,	0x02A9,	%g2
	movrne	%o4,	%g5,	%o0
	mulscc	%i4,	0x003C,	%l4
	andcc	%i0,	0x1700,	%g6
	stb	%o3,	[%l7 + 0x2A]
	array32	%i3,	%l6,	%i1
	alignaddr	%i2,	%l3,	%o7
	st	%f18,	[%l7 + 0x1C]
	mulscc	%g7,	%g1,	%i5
	xor	%o6,	%l0,	%l5
	andcc	%l2,	0x0329,	%i7
	srax	%o1,	0x06,	%g3
	andn	%l1,	%i6,	%o5
	ldd	[%l7 + 0x20],	%f4
	edge16	%g4,	%o2,	%o4
	ldub	[%l7 + 0x21],	%g2
	movle	%xcc,	%g5,	%o0
	fcmpne32	%f18,	%f4,	%i4
	array8	%i0,	%l4,	%g6
	or	%o3,	0x0B0A,	%l6
	fcmpne16	%f6,	%f12,	%i1
	ldx	[%l7 + 0x40],	%i2
	edge32l	%i3,	%o7,	%g7
	sra	%g1,	0x07,	%l3
	fpadd16s	%f29,	%f16,	%f8
	ldub	[%l7 + 0x58],	%o6
	sdivx	%i5,	0x0155,	%l0
	movvs	%xcc,	%l2,	%i7
	stx	%l5,	[%l7 + 0x48]
	mova	%xcc,	%g3,	%l1
	fsrc1	%f8,	%f18
	movcs	%icc,	%i6,	%o5
	andn	%g4,	%o2,	%o4
	ldd	[%l7 + 0x58],	%o0
	udiv	%g2,	0x01AB,	%g5
	mulx	%i4,	0x11B3,	%o0
	edge32ln	%i0,	%l4,	%g6
	movrne	%l6,	%i1,	%i2
	alignaddr	%i3,	%o3,	%g7
	movn	%icc,	%o7,	%l3
	st	%f27,	[%l7 + 0x5C]
	fmovdl	%icc,	%f27,	%f18
	stb	%g1,	[%l7 + 0x13]
	andn	%i5,	%o6,	%l0
	sra	%i7,	%l5,	%g3
	smulcc	%l1,	0x0820,	%l2
	udiv	%o5,	0x04D2,	%i6
	addcc	%g4,	%o4,	%o2
	fnands	%f30,	%f7,	%f17
	ldsb	[%l7 + 0x3B],	%o1
	lduh	[%l7 + 0x1C],	%g5
	fnot1s	%f27,	%f31
	smul	%i4,	0x00E5,	%o0
	sethi	0x04F4,	%i0
	ld	[%l7 + 0x7C],	%f1
	save %g2, 0x14CC, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc3,	%f12,	%f18
	sdivcc	%g6,	0x0DEF,	%i1
	fcmped	%fcc1,	%f20,	%f16
	ld	[%l7 + 0x48],	%f8
	smulcc	%l6,	0x0982,	%i2
	edge16l	%o3,	%g7,	%i3
	fcmpeq32	%f26,	%f0,	%o7
	stw	%l3,	[%l7 + 0x74]
	andn	%g1,	0x1F48,	%i5
	edge8ln	%o6,	%l0,	%i7
	popc	%l5,	%l1
	movleu	%xcc,	%l2,	%g3
	ldd	[%l7 + 0x10],	%f30
	fxnors	%f22,	%f2,	%f17
	movne	%xcc,	%i6,	%g4
	edge32ln	%o5,	%o2,	%o1
	movle	%icc,	%g5,	%i4
	subcc	%o0,	0x1F90,	%i0
	and	%g2,	%l4,	%g6
	subccc	%o4,	0x0BD8,	%i1
	fmovdne	%icc,	%f2,	%f5
	edge16l	%l6,	%i2,	%o3
	srl	%i3,	0x1B,	%g7
	movleu	%icc,	%l3,	%o7
	ldd	[%l7 + 0x68],	%f2
	sth	%g1,	[%l7 + 0x40]
	or	%o6,	%i5,	%i7
	ld	[%l7 + 0x74],	%f23
	sdiv	%l0,	0x0F04,	%l1
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	fmovsl	%xcc,	%f25,	%f26
	stb	%i6,	[%l7 + 0x34]
	sdivcc	%g3,	0x1CAA,	%g4
	edge32ln	%o5,	%o2,	%g5
	fmuld8ulx16	%f28,	%f16,	%f16
	fmovrse	%o1,	%f21,	%f3
	fzeros	%f19
	alignaddrl	%i4,	%o0,	%g2
	fmovdl	%xcc,	%f4,	%f3
	fpadd16	%f26,	%f14,	%f26
	edge32l	%i0,	%g6,	%l4
	edge32ln	%o4,	%l6,	%i1
	popc	0x07B4,	%i2
	nop
	set	0x51, %g2
	stb	%i3,	[%l7 + %g2]
	movl	%icc,	%o3,	%g7
	fnor	%f12,	%f24,	%f10
	fmovsne	%icc,	%f23,	%f21
	fornot1s	%f0,	%f25,	%f15
	fsrc2	%f20,	%f30
	ldsh	[%l7 + 0x4A],	%l3
	fmovsgu	%xcc,	%f23,	%f18
	save %o7, 0x126C, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%i5,	%i7
	fpadd16	%f30,	%f16,	%f30
	movleu	%icc,	%l0,	%o6
	edge32n	%l2,	%l5,	%i6
	srax	%g3,	%l1,	%o5
	fmovdvc	%xcc,	%f10,	%f6
	array16	%g4,	%g5,	%o1
	fmovrdlez	%i4,	%f2,	%f4
	fornot2	%f6,	%f24,	%f4
	fpack16	%f8,	%f2
	subc	%o0,	%g2,	%i0
	movcs	%icc,	%g6,	%l4
	movvc	%xcc,	%o4,	%l6
	st	%f16,	[%l7 + 0x50]
	movrne	%i1,	0x02D,	%o2
	edge16n	%i3,	%i2,	%g7
	orn	%o3,	0x11F6,	%l3
	addc	%g1,	0x1B4F,	%o7
	movre	%i5,	0x252,	%l0
	fmovdl	%xcc,	%f3,	%f6
	addcc	%o6,	%i7,	%l2
	array32	%l5,	%i6,	%g3
	movre	%o5,	0x171,	%l1
	edge16l	%g4,	%o1,	%g5
	fabss	%f26,	%f14
	mulx	%i4,	%g2,	%i0
	restore %o0, 0x15A2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o4,	%l6
	movcc	%xcc,	%i1,	%o2
	lduw	[%l7 + 0x7C],	%l4
	array32	%i2,	%g7,	%o3
	sub	%i3,	%l3,	%o7
	andncc	%i5,	%g1,	%l0
	mulx	%i7,	%o6,	%l5
	fornot1	%f30,	%f10,	%f26
	ldx	[%l7 + 0x20],	%i6
	edge8	%g3,	%l2,	%l1
	xnorcc	%g4,	%o5,	%g5
	fxor	%f12,	%f20,	%f26
	lduw	[%l7 + 0x64],	%i4
	movg	%icc,	%o1,	%g2
	and	%i0,	0x12E1,	%g6
	array32	%o4,	%o0,	%l6
	fmovrde	%o2,	%f8,	%f16
	movcs	%icc,	%l4,	%i1
	save %g7, 0x087A, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f24,	%f14,	%f30
	fpack16	%f24,	%f30
	edge8l	%i2,	%i3,	%l3
	xnorcc	%o7,	0x19DC,	%g1
	fornot1	%f30,	%f28,	%f2
	movgu	%icc,	%l0,	%i5
	alignaddr	%i7,	%o6,	%i6
	fxor	%f28,	%f24,	%f4
	fmovsneg	%xcc,	%f3,	%f27
	fornot2s	%f4,	%f1,	%f8
	lduw	[%l7 + 0x78],	%g3
	ldd	[%l7 + 0x48],	%f8
	umul	%l2,	0x13A7,	%l1
	sll	%l5,	%g4,	%o5
	ldd	[%l7 + 0x60],	%g4
	udivx	%i4,	0x1F10,	%g2
	edge32l	%i0,	%g6,	%o1
	movn	%icc,	%o4,	%l6
	smul	%o2,	%l4,	%o0
	sdiv	%g7,	0x076D,	%i1
	fzeros	%f13
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	fmovspos	%icc,	%f12,	%f0
	lduh	[%l7 + 0x7E],	%i2
	fcmpes	%fcc0,	%f2,	%f16
	fandnot1s	%f23,	%f27,	%f6
	fpsub32s	%f0,	%f7,	%f7
	xnorcc	%l3,	%o7,	%l0
	fcmpeq32	%f12,	%f14,	%i5
	sdivx	%g1,	0x11FC,	%o6
	subcc	%i7,	%g3,	%l2
	array8	%i6,	%l1,	%l5
	edge8n	%g4,	%g5,	%i4
	fsrc1	%f14,	%f30
	srax	%o5,	%g2,	%g6
	bshuffle	%f12,	%f30,	%f14
	movle	%xcc,	%o1,	%o4
	stb	%l6,	[%l7 + 0x48]
	popc	%o2,	%i0
	fmul8x16al	%f7,	%f13,	%f14
	smulcc	%l4,	0x0907,	%o0
	alignaddr	%g7,	%o3,	%i3
	movcc	%xcc,	%i2,	%l3
	edge8	%o7,	%l0,	%i1
	movleu	%xcc,	%g1,	%i5
	addccc	%i7,	%g3,	%l2
	edge8	%i6,	%l1,	%l5
	fmovrdlz	%o6,	%f6,	%f18
	st	%f18,	[%l7 + 0x2C]
	sdivcc	%g4,	0x07F9,	%g5
	sethi	0x10F2,	%o5
	ldsw	[%l7 + 0x6C],	%g2
	smul	%i4,	%g6,	%o4
	array8	%o1,	%l6,	%o2
	fcmped	%fcc2,	%f22,	%f14
	fnegd	%f6,	%f16
	fmovdleu	%icc,	%f24,	%f23
	movpos	%icc,	%l4,	%o0
	orncc	%i0,	%g7,	%i3
	bshuffle	%f4,	%f22,	%f12
	sdivcc	%o3,	0x1CB3,	%i2
	sdivx	%o7,	0x1F45,	%l0
	fmovrdlez	%i1,	%f2,	%f2
	movcs	%xcc,	%l3,	%g1
	subcc	%i5,	%g3,	%i7
	array32	%l2,	%l1,	%i6
	ldsw	[%l7 + 0x18],	%l5
	orn	%o6,	0x1E29,	%g5
	andcc	%o5,	%g2,	%g4
	mulx	%i4,	0x0C8C,	%g6
	and	%o1,	0x0D4B,	%l6
	movvs	%xcc,	%o2,	%o4
	st	%f23,	[%l7 + 0x20]
	movne	%icc,	%l4,	%o0
	edge32ln	%i0,	%i3,	%g7
	fmovsgu	%xcc,	%f9,	%f2
	move	%xcc,	%o3,	%o7
	mulx	%i2,	0x003B,	%i1
	subcc	%l0,	0x076C,	%l3
	edge8ln	%i5,	%g3,	%i7
	udiv	%g1,	0x0894,	%l2
	umulcc	%l1,	0x0FE4,	%l5
	srax	%i6,	0x19,	%o6
	movl	%icc,	%g5,	%g2
	fmovrdne	%g4,	%f4,	%f30
	udivcc	%i4,	0x1BA6,	%o5
	array16	%g6,	%l6,	%o2
	save %o1, %o4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0B35
	ldx	[%l7 + 0x30],	%i0
	fmovdcs	%xcc,	%f5,	%f17
	xnor	%l4,	0x1E75,	%g7
	andn	%o3,	%o7,	%i3
	xorcc	%i2,	%l0,	%l3
	fmovdcc	%xcc,	%f29,	%f16
	edge16n	%i5,	%g3,	%i7
	lduh	[%l7 + 0x14],	%g1
	edge8ln	%l2,	%i1,	%l1
	fmovsneg	%xcc,	%f31,	%f17
	fmovrslz	%l5,	%f20,	%f7
	movle	%icc,	%o6,	%g5
	fcmple32	%f8,	%f30,	%g2
	edge8	%g4,	%i4,	%o5
	udiv	%i6,	0x0B00,	%g6
	edge32n	%o2,	%o1,	%o4
	subcc	%o0,	0x142A,	%i0
	fmul8sux16	%f18,	%f28,	%f12
	andcc	%l6,	%g7,	%o3
	move	%xcc,	%o7,	%l4
	fxnor	%f22,	%f2,	%f2
	subc	%i2,	0x1857,	%i3
	fmul8x16au	%f1,	%f1,	%f2
	movrlz	%l3,	0x1D5,	%i5
	fmovrsgez	%g3,	%f1,	%f18
	movge	%icc,	%l0,	%g1
	subc	%l2,	0x071B,	%i1
	fpack16	%f28,	%f3
	stb	%i7,	[%l7 + 0x21]
	srl	%l1,	%l5,	%g5
	srl	%g2,	%o6,	%i4
	restore %o5, %g4, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i6,	%o1,	%o2
	alignaddr	%o0,	%i0,	%l6
	fands	%f17,	%f8,	%f13
	mulx	%g7,	%o3,	%o7
	stw	%l4,	[%l7 + 0x48]
	edge32ln	%i2,	%o4,	%i3
	fones	%f14
	sdivcc	%i5,	0x01EA,	%l3
	movgu	%xcc,	%l0,	%g1
	move	%xcc,	%l2,	%g3
	std	%f22,	[%l7 + 0x48]
	subcc	%i7,	0x0B65,	%i1
	lduh	[%l7 + 0x30],	%l1
	movne	%xcc,	%g5,	%l5
	fcmped	%fcc1,	%f24,	%f30
	edge32ln	%g2,	%o6,	%i4
	subc	%o5,	%g4,	%i6
	alignaddr	%g6,	%o2,	%o0
	save %i0, 0x0C75, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g7,	[%l7 + 0x40]
	edge16n	%o1,	%o7,	%l4
	movl	%icc,	%o3,	%o4
	alignaddr	%i3,	%i5,	%l3
	xnor	%i2,	%g1,	%l0
	orncc	%l2,	%g3,	%i7
	popc	%i1,	%l1
	andcc	%l5,	0x0F57,	%g5
	add	%o6,	%g2,	%o5
	fabss	%f12,	%f16
	ldx	[%l7 + 0x20],	%i4
	fmovdcc	%xcc,	%f2,	%f10
	std	%f8,	[%l7 + 0x48]
	movrlez	%g4,	%i6,	%g6
	edge16l	%o2,	%i0,	%o0
	andncc	%g7,	%l6,	%o1
	move	%icc,	%l4,	%o3
	fpack32	%f26,	%f30,	%f28
	xnor	%o7,	0x18CA,	%o4
	ldsb	[%l7 + 0x0F],	%i5
	std	%f24,	[%l7 + 0x40]
	orcc	%i3,	0x1E1E,	%l3
	popc	0x09F0,	%g1
	edge8l	%i2,	%l0,	%l2
	nop
	set	0x51, %l4
	ldsb	[%l7 + %l4],	%i7
	fpack16	%f28,	%f11
	edge8ln	%g3,	%l1,	%l5
	movleu	%xcc,	%i1,	%g5
	array16	%g2,	%o6,	%i4
	edge16ln	%g4,	%o5,	%g6
	popc	0x1451,	%i6
	subccc	%i0,	0x0510,	%o2
	fmovdcc	%xcc,	%f13,	%f9
	add	%o0,	0x0549,	%g7
	edge16l	%l6,	%o1,	%o3
	ld	[%l7 + 0x5C],	%f0
	ldd	[%l7 + 0x30],	%l4
	fpsub32s	%f19,	%f17,	%f21
	nop
	set	0x36, %g6
	ldsb	[%l7 + %g6],	%o4
	alignaddr	%i5,	%i3,	%l3
	ldsw	[%l7 + 0x5C],	%o7
	subcc	%g1,	%i2,	%l0
	array8	%l2,	%i7,	%l1
	for	%f4,	%f12,	%f2
	fpadd32	%f22,	%f22,	%f10
	fandnot1s	%f30,	%f29,	%f16
	movleu	%xcc,	%l5,	%g3
	ld	[%l7 + 0x58],	%f30
	sir	0x1EA8
	movrne	%g5,	0x31A,	%i1
	movgu	%icc,	%g2,	%o6
	stb	%i4,	[%l7 + 0x24]
	edge8ln	%g4,	%g6,	%o5
	addc	%i0,	%i6,	%o2
	ldsw	[%l7 + 0x68],	%o0
	fmovsg	%icc,	%f21,	%f26
	fnands	%f26,	%f5,	%f3
	sub	%g7,	%l6,	%o3
	ldub	[%l7 + 0x2A],	%o1
	fsrc2s	%f9,	%f1
	edge8	%o4,	%l4,	%i3
	popc	0x11B4,	%i5
	fmovdn	%xcc,	%f22,	%f25
	fcmple16	%f22,	%f2,	%l3
	add	%o7,	0x0C4A,	%g1
	addccc	%l0,	%l2,	%i2
	fmovrsgz	%l1,	%f9,	%f1
	ldsb	[%l7 + 0x5E],	%i7
	fsrc1	%f18,	%f26
	sethi	0x0592,	%l5
	fone	%f10
	movpos	%icc,	%g3,	%g5
	edge16	%i1,	%g2,	%o6
	movcs	%xcc,	%g4,	%g6
	edge32ln	%o5,	%i4,	%i6
	or	%i0,	0x0811,	%o2
	mulx	%g7,	%o0,	%o3
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	fmovsleu	%icc,	%f31,	%f0
	movrne	%l4,	0x2D1,	%o1
	movvs	%xcc,	%i5,	%l3
	movrgz	%i3,	0x1FD,	%g1
	smulcc	%o7,	0x0631,	%l2
	movrne	%i2,	%l1,	%l0
	fexpand	%f10,	%f16
	array8	%l5,	%i7,	%g3
	udiv	%g5,	0x1028,	%g2
	edge8l	%i1,	%g4,	%g6
	addcc	%o6,	0x08E8,	%o5
	movl	%xcc,	%i4,	%i0
	faligndata	%f4,	%f14,	%f30
	edge32ln	%i6,	%g7,	%o0
	ldub	[%l7 + 0x17],	%o2
	edge16l	%o3,	%o4,	%l6
	ldx	[%l7 + 0x48],	%l4
	sub	%i5,	0x037B,	%l3
	srlx	%i3,	0x1A,	%o1
	fcmpeq32	%f16,	%f12,	%g1
	ldd	[%l7 + 0x68],	%f30
	fcmped	%fcc0,	%f22,	%f16
	fornot1	%f10,	%f30,	%f26
	ldub	[%l7 + 0x5F],	%l2
	udiv	%o7,	0x15AB,	%l1
	alignaddr	%l0,	%i2,	%i7
	fsrc2s	%f17,	%f26
	edge32n	%g3,	%l5,	%g2
	sethi	0x0E58,	%g5
	edge16l	%g4,	%i1,	%o6
	fmovrslez	%g6,	%f1,	%f23
	movneg	%xcc,	%o5,	%i4
	ld	[%l7 + 0x48],	%f11
	movrne	%i0,	0x325,	%i6
	nop
	set	0x24, %i5
	ldsw	[%l7 + %i5],	%g7
	ldsw	[%l7 + 0x68],	%o0
	sra	%o3,	0x03,	%o4
	movrgz	%o2,	%l6,	%i5
	edge16n	%l3,	%i3,	%l4
	fmovdcs	%xcc,	%f26,	%f19
	fmovdne	%xcc,	%f13,	%f19
	smul	%g1,	0x06AB,	%l2
	fmovsge	%xcc,	%f17,	%f28
	movg	%xcc,	%o1,	%l1
	movcs	%xcc,	%l0,	%i2
	array16	%o7,	%g3,	%i7
	sll	%l5,	%g5,	%g4
	fnot2	%f26,	%f12
	movne	%icc,	%i1,	%g2
	fmovdle	%xcc,	%f28,	%f26
	andcc	%g6,	0x0F52,	%o6
	st	%f24,	[%l7 + 0x78]
	ld	[%l7 + 0x6C],	%f13
	fmovrslz	%o5,	%f5,	%f3
	nop
	set	0x68, %l5
	ldd	[%l7 + %l5],	%i4
	movne	%icc,	%i0,	%g7
	movrlz	%i6,	%o0,	%o3
	fmovspos	%xcc,	%f2,	%f11
	fmovrdlez	%o4,	%f18,	%f28
	move	%icc,	%o2,	%i5
	xor	%l6,	%i3,	%l3
	srlx	%g1,	0x0F,	%l2
	subccc	%l4,	0x0477,	%l1
	nop
	set	0x0A, %l3
	ldsh	[%l7 + %l3],	%o1
	smulcc	%l0,	0x045D,	%i2
	edge32	%g3,	%o7,	%l5
	andn	%g5,	%i7,	%g4
	fcmped	%fcc2,	%f16,	%f22
	xnor	%g2,	%i1,	%o6
	sra	%g6,	%o5,	%i4
	edge8	%i0,	%i6,	%g7
	or	%o0,	%o4,	%o2
	fpsub16s	%f11,	%f31,	%f28
	fmovsl	%xcc,	%f29,	%f5
	movgu	%icc,	%o3,	%i5
	andn	%i3,	%l6,	%g1
	siam	0x5
	edge16l	%l3,	%l4,	%l1
	sdivcc	%o1,	0x0A43,	%l2
	ld	[%l7 + 0x2C],	%f5
	fone	%f20
	edge32n	%l0,	%g3,	%i2
	popc	%o7,	%l5
	movpos	%icc,	%i7,	%g5
	ld	[%l7 + 0x64],	%f4
	ldub	[%l7 + 0x0C],	%g2
	restore %g4, %i1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o5,	%g6,	%i4
	ldsw	[%l7 + 0x48],	%i6
	fcmpne32	%f2,	%f12,	%g7
	stx	%o0,	[%l7 + 0x70]
	edge32	%o4,	%i0,	%o2
	fmul8x16au	%f25,	%f28,	%f28
	orncc	%i5,	%o3,	%l6
	array32	%i3,	%l3,	%g1
	fabss	%f26,	%f3
	fnor	%f30,	%f30,	%f16
	ldsb	[%l7 + 0x1F],	%l1
	sir	0x1112
	mulscc	%o1,	0x0AF9,	%l2
	movcc	%icc,	%l0,	%l4
	move	%icc,	%g3,	%i2
	andncc	%o7,	%i7,	%l5
	subccc	%g5,	%g4,	%g2
	fnot2	%f22,	%f8
	save %o6, 0x11D4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i1,	0x02DB,	%g6
	edge16	%i6,	%g7,	%i4
	save %o0, 0x1B5C, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o2,	%o4,	%i5
	edge16	%o3,	%i3,	%l3
	sub	%g1,	%l6,	%l1
	add	%o1,	%l2,	%l0
	fmovdn	%icc,	%f31,	%f17
	srlx	%g3,	0x03,	%l4
	udivcc	%i2,	0x1278,	%i7
	movrgz	%o7,	%g5,	%l5
	sdiv	%g4,	0x0F6B,	%o6
	movle	%icc,	%g2,	%i1
	andncc	%g6,	%o5,	%i6
	fmovsg	%icc,	%f30,	%f27
	fmuld8sux16	%f0,	%f3,	%f4
	movvs	%icc,	%i4,	%g7
	fnot2	%f28,	%f30
	mulscc	%i0,	0x1EA6,	%o2
	stb	%o0,	[%l7 + 0x0B]
	sdivx	%i5,	0x1BEA,	%o4
	xor	%o3,	0x140D,	%i3
	sllx	%g1,	%l3,	%l1
	st	%f27,	[%l7 + 0x14]
	movvs	%icc,	%l6,	%o1
	movcs	%xcc,	%l2,	%l0
	movgu	%xcc,	%l4,	%i2
	udivcc	%i7,	0x02B3,	%o7
	fmovse	%icc,	%f5,	%f0
	nop
	set	0x3A, %i2
	ldsb	[%l7 + %i2],	%g3
	edge8l	%l5,	%g5,	%g4
	movvc	%icc,	%g2,	%o6
	fcmpeq16	%f28,	%f4,	%g6
	edge16l	%o5,	%i1,	%i4
	st	%f6,	[%l7 + 0x0C]
	movne	%icc,	%g7,	%i6
	movcs	%xcc,	%o2,	%i0
	andcc	%i5,	0x0ACF,	%o4
	fpsub32	%f4,	%f18,	%f10
	addc	%o0,	%o3,	%g1
	fmovsl	%xcc,	%f20,	%f19
	orncc	%i3,	0x1D92,	%l1
	fmovrslz	%l3,	%f19,	%f13
	fmovda	%icc,	%f19,	%f10
	movleu	%icc,	%o1,	%l2
	and	%l6,	%l4,	%i2
	subcc	%i7,	%o7,	%g3
	movrlez	%l5,	%g5,	%g4
	fandnot1	%f20,	%f30,	%f30
	movgu	%icc,	%g2,	%o6
	stw	%l0,	[%l7 + 0x20]
	edge32ln	%o5,	%i1,	%g6
	edge32ln	%i4,	%g7,	%i6
	movne	%icc,	%i0,	%o2
	mova	%xcc,	%o4,	%o0
	mulx	%i5,	0x0F61,	%o3
	movrlez	%i3,	0x08C,	%g1
	smul	%l1,	%l3,	%o1
	bshuffle	%f2,	%f26,	%f16
	fandnot1s	%f17,	%f2,	%f18
	udiv	%l2,	0x0524,	%l6
	edge16ln	%l4,	%i2,	%o7
	edge32n	%i7,	%g3,	%g5
	movn	%xcc,	%l5,	%g2
	srlx	%o6,	0x12,	%g4
	fmovdcc	%xcc,	%f11,	%f5
	edge16l	%o5,	%l0,	%g6
	xnorcc	%i1,	%i4,	%g7
	ldd	[%l7 + 0x08],	%i6
	srlx	%o2,	%o4,	%o0
	udiv	%i0,	0x003A,	%o3
	sdiv	%i5,	0x05C0,	%g1
	movre	%l1,	0x180,	%l3
	ldd	[%l7 + 0x58],	%i2
	edge8ln	%l2,	%l6,	%l4
	edge8n	%i2,	%o7,	%i7
	umul	%o1,	%g5,	%g3
	ldd	[%l7 + 0x58],	%f8
	nop
	set	0x54, %o1
	ldsh	[%l7 + %o1],	%g2
	fpack16	%f14,	%f18
	smul	%o6,	%l5,	%g4
	edge8	%l0,	%o5,	%i1
	movrne	%i4,	%g7,	%i6
	array8	%g6,	%o2,	%o4
	movre	%o0,	0x238,	%o3
	fmovsge	%xcc,	%f2,	%f23
	edge32	%i0,	%i5,	%g1
	movcs	%xcc,	%l1,	%i3
	fmovrde	%l2,	%f24,	%f16
	movvc	%icc,	%l3,	%l6
	edge16n	%l4,	%o7,	%i7
	edge16	%i2,	%o1,	%g5
	ldub	[%l7 + 0x7B],	%g3
	fcmpd	%fcc1,	%f8,	%f4
	movpos	%icc,	%g2,	%o6
	movle	%icc,	%g4,	%l0
	edge16n	%o5,	%l5,	%i1
	lduh	[%l7 + 0x50],	%g7
	fmovrdlez	%i4,	%f6,	%f2
	xnor	%i6,	%g6,	%o2
	fnor	%f16,	%f30,	%f2
	siam	0x7
	lduh	[%l7 + 0x58],	%o4
	srl	%o3,	0x02,	%i0
	ldsw	[%l7 + 0x68],	%i5
	edge32	%g1,	%o0,	%i3
	movrne	%l1,	0x144,	%l3
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	edge16n	%o7,	%l6,	%i2
	fpadd16	%f0,	%f30,	%f8
	ldsh	[%l7 + 0x52],	%o1
	ldd	[%l7 + 0x58],	%f0
	udiv	%g5,	0x1BA1,	%g3
	fmovsleu	%xcc,	%f20,	%f6
	edge16l	%g2,	%i7,	%o6
	xorcc	%g4,	0x05FE,	%o5
	movvc	%xcc,	%l0,	%l5
	sllx	%g7,	%i1,	%i4
	andn	%g6,	0x0CEF,	%i6
	xnorcc	%o4,	%o2,	%i0
	fmovrdgz	%o3,	%f6,	%f6
	fornot2	%f22,	%f18,	%f18
	srax	%i5,	0x0A,	%g1
	edge16	%o0,	%i3,	%l1
	addc	%l3,	%l4,	%o7
	srl	%l2,	%l6,	%o1
	sdivx	%i2,	0x0A83,	%g5
	udivcc	%g2,	0x1532,	%i7
	orcc	%g3,	0x1971,	%o6
	ldd	[%l7 + 0x08],	%g4
	alignaddr	%o5,	%l0,	%g7
	fmovdge	%icc,	%f13,	%f20
	fzero	%f2
	fmovdneg	%icc,	%f29,	%f2
	movrne	%l5,	0x3D9,	%i1
	fmovrsgz	%g6,	%f11,	%f27
	movcs	%icc,	%i6,	%i4
	ld	[%l7 + 0x64],	%f30
	ldx	[%l7 + 0x50],	%o4
	movrgz	%i0,	%o3,	%i5
	movneg	%xcc,	%o2,	%g1
	movneg	%xcc,	%o0,	%i3
	save %l3, 0x14B2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f2,	%f2,	%f24
	movg	%xcc,	%o7,	%l2
	andcc	%l4,	%o1,	%i2
	fabss	%f15,	%f28
	movl	%xcc,	%g5,	%g2
	sethi	0x164E,	%l6
	alignaddr	%i7,	%o6,	%g4
	bshuffle	%f24,	%f28,	%f10
	lduh	[%l7 + 0x22],	%o5
	fones	%f23
	addcc	%l0,	0x016E,	%g7
	stb	%g3,	[%l7 + 0x13]
	ldd	[%l7 + 0x50],	%l4
	edge32n	%g6,	%i1,	%i4
	fand	%f30,	%f6,	%f22
	fpackfix	%f22,	%f4
	st	%f9,	[%l7 + 0x3C]
	movne	%icc,	%o4,	%i0
	popc	%i6,	%o3
	mova	%icc,	%o2,	%i5
	ldsw	[%l7 + 0x70],	%o0
	xnor	%i3,	0x0E51,	%g1
	umul	%l1,	0x1A82,	%o7
	movcc	%xcc,	%l3,	%l4
	orn	%l2,	0x1DED,	%i2
	siam	0x7
	move	%icc,	%o1,	%g5
	ldub	[%l7 + 0x2A],	%l6
	stb	%i7,	[%l7 + 0x41]
	restore %o6, %g2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0FA4,	%o5
	fnegd	%f6,	%f6
	alignaddrl	%g7,	%g3,	%l0
	fexpand	%f16,	%f6
	fpack16	%f14,	%f9
	bshuffle	%f0,	%f4,	%f24
	st	%f0,	[%l7 + 0x38]
	fmovde	%icc,	%f16,	%f5
	smulcc	%l5,	%i1,	%i4
	fmul8x16al	%f25,	%f2,	%f20
	stw	%g6,	[%l7 + 0x54]
	fmovdl	%xcc,	%f14,	%f17
	ldub	[%l7 + 0x52],	%i0
	edge8ln	%o4,	%o3,	%i6
	lduh	[%l7 + 0x10],	%o2
	fcmps	%fcc0,	%f7,	%f27
	movrlez	%i5,	%i3,	%o0
	edge8	%l1,	%g1,	%l3
	sdivx	%l4,	0x04BE,	%l2
	and	%i2,	%o1,	%g5
	andncc	%o7,	%l6,	%o6
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	fmovda	%icc,	%f0,	%f18
	ldsb	[%l7 + 0x79],	%o5
	fxor	%f30,	%f30,	%f4
	fpackfix	%f30,	%f17
	udivx	%g3,	0x05F4,	%l0
	edge16n	%g7,	%i1,	%l5
	ld	[%l7 + 0x34],	%f10
	fcmple16	%f20,	%f18,	%g6
	std	%f24,	[%l7 + 0x18]
	ldub	[%l7 + 0x39],	%i0
	mova	%icc,	%i4,	%o3
	edge16	%i6,	%o4,	%o2
	fcmpne16	%f4,	%f4,	%i5
	fmovrsne	%o0,	%f7,	%f8
	subcc	%l1,	0x118F,	%i3
	edge8ln	%l3,	%l4,	%g1
	smul	%i2,	%l2,	%g5
	movpos	%xcc,	%o7,	%o1
	fxors	%f20,	%f10,	%f28
	array32	%l6,	%g2,	%o6
	movre	%g4,	%i7,	%o5
	fmovrslez	%l0,	%f27,	%f19
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%g2
	andcc	%i1,	%l5,	%g7
	orncc	%i0,	0x1D56,	%g6
	smul	%o3,	%i6,	%o4
	std	%f2,	[%l7 + 0x20]
	movn	%xcc,	%i4,	%i5
	add	%o0,	0x1578,	%l1
	sub	%i3,	%l3,	%l4
	ldd	[%l7 + 0x48],	%g0
	subcc	%i2,	0x0114,	%l2
	siam	0x2
	fxnors	%f10,	%f3,	%f31
	sdivx	%o2,	0x0452,	%o7
	sub	%g5,	%l6,	%o1
	ldub	[%l7 + 0x49],	%g2
	sub	%g4,	0x1FDD,	%i7
	andncc	%o6,	%l0,	%g3
	alignaddrl	%o5,	%i1,	%l5
	fnand	%f10,	%f24,	%f30
	smulcc	%i0,	%g7,	%o3
	mulscc	%g6,	0x0BE9,	%o4
	fmovdleu	%xcc,	%f3,	%f14
	movge	%icc,	%i6,	%i4
	move	%icc,	%o0,	%i5
	ldsh	[%l7 + 0x6A],	%i3
	edge8l	%l3,	%l1,	%g1
	srlx	%i2,	%l4,	%l2
	fnot1	%f8,	%f20
	ldsw	[%l7 + 0x4C],	%o7
	addcc	%o2,	0x10D8,	%l6
	edge8l	%o1,	%g2,	%g5
	fmovrde	%g4,	%f6,	%f8
	movg	%xcc,	%i7,	%o6
	sth	%g3,	[%l7 + 0x20]
	array16	%l0,	%i1,	%l5
	fmovsn	%icc,	%f8,	%f21
	fmovrdlz	%i0,	%f8,	%f18
	orcc	%o5,	0x12EB,	%g7
	andn	%o3,	0x01D4,	%o4
	movge	%xcc,	%i6,	%i4
	subcc	%o0,	%g6,	%i3
	ldd	[%l7 + 0x60],	%l2
	fmovsle	%xcc,	%f6,	%f31
	orn	%l1,	%g1,	%i5
	ldsw	[%l7 + 0x0C],	%l4
	array8	%l2,	%o7,	%i2
	array16	%o2,	%o1,	%l6
	movg	%xcc,	%g5,	%g2
	mulscc	%i7,	%g4,	%g3
	move	%icc,	%o6,	%l0
	ld	[%l7 + 0x44],	%f23
	movre	%l5,	0x1F1,	%i0
	ldsb	[%l7 + 0x73],	%o5
	movvs	%xcc,	%i1,	%o3
	fxors	%f17,	%f7,	%f22
	ld	[%l7 + 0x10],	%f1
	movne	%icc,	%o4,	%g7
	movle	%xcc,	%i6,	%o0
	and	%i4,	0x0A55,	%i3
	andncc	%g6,	%l1,	%g1
	edge16l	%i5,	%l4,	%l3
	fmovdgu	%xcc,	%f2,	%f26
	srax	%l2,	0x16,	%i2
	sll	%o2,	%o1,	%l6
	ldsh	[%l7 + 0x54],	%g5
	movcc	%xcc,	%g2,	%o7
	fornot2	%f16,	%f16,	%f10
	movn	%icc,	%g4,	%g3
	fmovsvs	%icc,	%f14,	%f21
	fcmple16	%f14,	%f30,	%o6
	subccc	%i7,	0x07D5,	%l5
	edge8l	%i0,	%l0,	%o5
	movvs	%icc,	%i1,	%o4
	fnor	%f12,	%f26,	%f0
	edge32ln	%g7,	%i6,	%o3
	sllx	%o0,	%i4,	%g6
	fpackfix	%f8,	%f16
	lduh	[%l7 + 0x5A],	%i3
	sdivx	%l1,	0x0CC5,	%i5
	ld	[%l7 + 0x28],	%f18
	ld	[%l7 + 0x64],	%f29
	sethi	0x14C0,	%g1
	subc	%l3,	0x1F68,	%l4
	nop
	set	0x54, %o5
	ldsh	[%l7 + %o5],	%l2
	fmovsleu	%xcc,	%f15,	%f16
	smulcc	%i2,	%o1,	%o2
	ldd	[%l7 + 0x08],	%g4
	edge16n	%g2,	%l6,	%g4
	movg	%xcc,	%o7,	%o6
	add	%i7,	%l5,	%i0
	addcc	%l0,	%o5,	%g3
	move	%icc,	%i1,	%o4
	xorcc	%g7,	0x1F85,	%o3
	fmovdgu	%icc,	%f25,	%f21
	movcc	%icc,	%i6,	%i4
	movrgz	%o0,	0x240,	%i3
	fmovda	%icc,	%f14,	%f27
	sir	0x1B9E
	orn	%g6,	%l1,	%i5
	sdivx	%g1,	0x19F9,	%l4
	movrgz	%l2,	%i2,	%l3
	sll	%o1,	0x1B,	%o2
	ldub	[%l7 + 0x11],	%g2
	udivcc	%g5,	0x05A4,	%g4
	edge32ln	%o7,	%o6,	%l6
	fmovrsne	%i7,	%f21,	%f13
	orncc	%l5,	0x1A0E,	%i0
	movrne	%l0,	0x000,	%o5
	fmovd	%f22,	%f22
	orncc	%g3,	%o4,	%i1
	movcc	%icc,	%o3,	%i6
	fmovdneg	%xcc,	%f24,	%f21
	movrgez	%i4,	0x141,	%g7
	smulcc	%i3,	%o0,	%l1
	movcs	%icc,	%i5,	%g1
	fcmpgt16	%f22,	%f30,	%l4
	sra	%g6,	0x09,	%i2
	fmovsle	%icc,	%f30,	%f30
	movleu	%xcc,	%l2,	%l3
	fornot1s	%f25,	%f23,	%f17
	andncc	%o1,	%o2,	%g5
	orncc	%g2,	%o7,	%g4
	mova	%xcc,	%o6,	%l6
	udivcc	%i7,	0x1651,	%l5
	edge32	%i0,	%l0,	%g3
	add	%o4,	%i1,	%o3
	array32	%i6,	%i4,	%g7
	movrgez	%o5,	%i3,	%o0
	fmovdcc	%xcc,	%f10,	%f21
	ldsw	[%l7 + 0x20],	%l1
	xnorcc	%i5,	0x1C98,	%g1
	ldsw	[%l7 + 0x74],	%l4
	orcc	%i2,	0x0186,	%g6
	orn	%l2,	0x1178,	%l3
	addccc	%o1,	%g5,	%g2
	sub	%o2,	%o7,	%o6
	fmovscs	%icc,	%f2,	%f16
	array8	%l6,	%i7,	%l5
	alignaddrl	%g4,	%i0,	%l0
	fornot2s	%f0,	%f0,	%f27
	mova	%xcc,	%o4,	%i1
	addccc	%o3,	%g3,	%i4
	fpackfix	%f22,	%f7
	fpadd16	%f22,	%f2,	%f8
	ldd	[%l7 + 0x70],	%f8
	edge32	%i6,	%g7,	%i3
	ldd	[%l7 + 0x58],	%f6
	ldsh	[%l7 + 0x52],	%o0
	umulcc	%l1,	%o5,	%i5
	movg	%xcc,	%l4,	%i2
	fandnot2	%f4,	%f30,	%f14
	sdivx	%g1,	0x1CE7,	%l2
	ldd	[%l7 + 0x38],	%f18
	array32	%g6,	%l3,	%o1
	xnorcc	%g2,	%o2,	%o7
	sth	%o6,	[%l7 + 0x18]
	stx	%g5,	[%l7 + 0x50]
	and	%l6,	%i7,	%g4
	add	%l5,	%i0,	%l0
	lduw	[%l7 + 0x38],	%i1
	fpadd32s	%f7,	%f5,	%f28
	movpos	%icc,	%o3,	%o4
	edge32ln	%i4,	%g3,	%i6
	edge16	%i3,	%o0,	%g7
	fpmerge	%f0,	%f26,	%f28
	movrlz	%o5,	%i5,	%l1
	std	%f14,	[%l7 + 0x58]
	movrlez	%l4,	0x2E5,	%g1
	orn	%i2,	%l2,	%g6
	movne	%xcc,	%l3,	%o1
	andncc	%g2,	%o2,	%o7
	movne	%xcc,	%o6,	%g5
	lduw	[%l7 + 0x3C],	%l6
	movrne	%i7,	0x167,	%l5
	restore %g4, 0x1746, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f25,	%f25
	mulscc	%i1,	0x11AB,	%o3
	edge8ln	%l0,	%i4,	%g3
	array8	%i6,	%o4,	%o0
	edge32l	%i3,	%o5,	%i5
	or	%l1,	%l4,	%g7
	fsrc1	%f26,	%f6
	fcmped	%fcc2,	%f2,	%f24
	xnorcc	%g1,	0x1D13,	%i2
	add	%l2,	0x1337,	%l3
	fmovdneg	%xcc,	%f16,	%f9
	subc	%g6,	%g2,	%o2
	fxors	%f21,	%f2,	%f23
	and	%o1,	0x012D,	%o7
	udivx	%o6,	0x0E26,	%g5
	edge32	%l6,	%i7,	%g4
	andn	%i0,	0x034E,	%i1
	movrgz	%l5,	%l0,	%o3
	subcc	%g3,	%i6,	%o4
	fmovrse	%i4,	%f3,	%f29
	edge8l	%o0,	%i3,	%o5
	edge32ln	%i5,	%l1,	%l4
	or	%g1,	%g7,	%i2
	array8	%l3,	%l2,	%g2
	stx	%o2,	[%l7 + 0x18]
	ldd	[%l7 + 0x78],	%o0
	edge16	%o7,	%o6,	%g6
	alignaddr	%g5,	%i7,	%l6
	ld	[%l7 + 0x28],	%f2
	movg	%icc,	%g4,	%i0
	edge32n	%i1,	%l5,	%o3
	add	%l0,	0x130F,	%g3
	fmovsg	%icc,	%f30,	%f10
	movpos	%icc,	%i6,	%i4
	edge16	%o4,	%i3,	%o0
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	movrne	%l4,	%i5,	%g1
	st	%f23,	[%l7 + 0x24]
	fexpand	%f24,	%f16
	andn	%i2,	0x0C32,	%g7
	fpadd32s	%f15,	%f24,	%f26
	fmovrde	%l2,	%f20,	%f24
	addc	%l3,	%o2,	%o1
	edge8n	%g2,	%o7,	%o6
	fcmpne32	%f20,	%f20,	%g5
	array32	%g6,	%l6,	%g4
	movl	%icc,	%i7,	%i1
	udivcc	%l5,	0x03CA,	%i0
	movvs	%icc,	%l0,	%o3
	and	%i6,	%i4,	%o4
	fmovscc	%icc,	%f11,	%f8
	udivcc	%i3,	0x15FE,	%o0
	sllx	%g3,	%l1,	%o5
	fandnot1	%f24,	%f28,	%f4
	fcmple32	%f10,	%f26,	%i5
	xnorcc	%l4,	0x05C3,	%g1
	edge8l	%g7,	%i2,	%l2
	edge16n	%l3,	%o2,	%o1
	restore %g2, 0x0659, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x4C],	%g5
	xorcc	%g6,	0x0A13,	%o7
	movle	%icc,	%g4,	%i7
	sethi	0x1211,	%i1
	xnorcc	%l5,	%i0,	%l6
	smulcc	%o3,	0x174B,	%l0
	movrgez	%i6,	%i4,	%o4
	edge16ln	%i3,	%g3,	%o0
	array32	%l1,	%o5,	%l4
	andncc	%i5,	%g7,	%g1
	movre	%l2,	%l3,	%i2
	movrlez	%o2,	%g2,	%o6
	smul	%o1,	0x0977,	%g6
	fnot1	%f2,	%f28
	movre	%o7,	0x215,	%g5
	edge8l	%g4,	%i7,	%l5
	xnorcc	%i1,	%i0,	%l6
	fcmped	%fcc1,	%f10,	%f4
	srax	%l0,	0x0B,	%i6
	edge8n	%o3,	%o4,	%i3
	fmovsle	%icc,	%f27,	%f31
	movgu	%xcc,	%g3,	%i4
	edge16n	%o0,	%l1,	%l4
	fsrc2	%f20,	%f22
	movn	%xcc,	%o5,	%i5
	ldd	[%l7 + 0x20],	%f10
	sdivcc	%g1,	0x0682,	%g7
	edge8	%l2,	%l3,	%o2
	movneg	%icc,	%g2,	%o6
	subccc	%i2,	0x17C2,	%g6
	orncc	%o1,	0x0726,	%g5
	addccc	%o7,	%g4,	%l5
	alignaddrl	%i1,	%i7,	%i0
	orn	%l6,	0x17BE,	%i6
	bshuffle	%f6,	%f8,	%f28
	fmovrse	%o3,	%f8,	%f23
	udivcc	%o4,	0x05D2,	%i3
	stw	%g3,	[%l7 + 0x14]
	andcc	%i4,	0x1E87,	%l0
	and	%o0,	0x0F13,	%l4
	movge	%icc,	%o5,	%l1
	movleu	%xcc,	%g1,	%i5
	subccc	%l2,	%g7,	%l3
	fcmped	%fcc0,	%f6,	%f10
	fmul8ulx16	%f22,	%f18,	%f12
	ldsw	[%l7 + 0x1C],	%g2
	ldx	[%l7 + 0x40],	%o2
	movneg	%icc,	%i2,	%g6
	fpsub16	%f6,	%f28,	%f6
	edge8l	%o6,	%g5,	%o7
	sll	%o1,	0x00,	%g4
	fcmpne16	%f4,	%f0,	%l5
	edge8	%i1,	%i0,	%i7
	orn	%i6,	0x18CA,	%l6
	nop
	set	0x5E, %o6
	ldsh	[%l7 + %o6],	%o4
	orcc	%o3,	0x006A,	%g3
	andn	%i3,	0x131D,	%l0
	subccc	%o0,	0x1740,	%l4
	edge16	%o5,	%i4,	%l1
	movrgz	%i5,	0x23B,	%g1
	mulx	%l2,	%l3,	%g7
	fnot2s	%f24,	%f10
	fpadd32s	%f21,	%f17,	%f9
	mulscc	%g2,	%o2,	%g6
	udivcc	%i2,	0x09AC,	%o6
	fnegs	%f14,	%f18
	ldx	[%l7 + 0x10],	%o7
	fcmple16	%f14,	%f8,	%g5
	edge8ln	%g4,	%l5,	%o1
	movrgz	%i0,	0x2F8,	%i7
	xnor	%i6,	0x1D23,	%i1
	fsrc2	%f14,	%f20
	subc	%l6,	0x0D6C,	%o3
	srl	%g3,	0x1A,	%i3
	movrlz	%l0,	%o0,	%l4
	ldub	[%l7 + 0x56],	%o5
	fmovscc	%xcc,	%f23,	%f14
	stb	%i4,	[%l7 + 0x08]
	addc	%l1,	%o4,	%i5
	fmovdvs	%xcc,	%f16,	%f20
	ldsw	[%l7 + 0x20],	%g1
	fnegd	%f28,	%f20
	edge32l	%l2,	%g7,	%l3
	mulx	%o2,	0x135B,	%g2
	edge16	%g6,	%i2,	%o6
	movvc	%icc,	%g5,	%o7
	movg	%icc,	%g4,	%o1
	st	%f12,	[%l7 + 0x68]
	fand	%f26,	%f28,	%f0
	save %l5, %i7, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i1,	0x039E,	%i6
	fmovsgu	%xcc,	%f6,	%f22
	orcc	%o3,	0x1947,	%l6
	fnands	%f13,	%f20,	%f1
	edge32ln	%g3,	%i3,	%o0
	fpack32	%f4,	%f2,	%f4
	sdiv	%l0,	0x081D,	%l4
	fpsub32	%f18,	%f20,	%f28
	fnegs	%f13,	%f13
	sir	0x0ED4
	stw	%o5,	[%l7 + 0x1C]
	movrne	%l1,	0x0EF,	%i4
	xnor	%i5,	0x0A81,	%g1
	movrlez	%o4,	%l2,	%g7
	orcc	%l3,	%g2,	%g6
	movvs	%icc,	%i2,	%o6
	ldd	[%l7 + 0x18],	%g4
	stw	%o7,	[%l7 + 0x58]
	fmovde	%icc,	%f4,	%f10
	edge16	%o2,	%g4,	%o1
	movcc	%xcc,	%i7,	%i0
	array16	%i1,	%l5,	%i6
	fmovsge	%icc,	%f31,	%f31
	edge16n	%o3,	%l6,	%i3
	sra	%g3,	0x01,	%l0
	array8	%l4,	%o0,	%o5
	edge16n	%l1,	%i4,	%g1
	edge8ln	%i5,	%o4,	%g7
	fmovsa	%icc,	%f13,	%f16
	movneg	%xcc,	%l2,	%l3
	mulx	%g6,	%i2,	%o6
	movleu	%icc,	%g5,	%o7
	ldd	[%l7 + 0x70],	%f16
	edge8ln	%o2,	%g4,	%g2
	alignaddr	%o1,	%i0,	%i1
	and	%i7,	0x1EBE,	%l5
	sir	0x1DBF
	ldsw	[%l7 + 0x38],	%o3
	umulcc	%l6,	%i3,	%i6
	fcmpgt16	%f4,	%f16,	%l0
	fmovse	%xcc,	%f7,	%f1
	andncc	%g3,	%o0,	%l4
	edge32	%o5,	%i4,	%g1
	movneg	%xcc,	%l1,	%o4
	alignaddrl	%i5,	%l2,	%l3
	udivx	%g6,	0x1A3D,	%i2
	or	%g7,	%o6,	%o7
	fsrc1	%f26,	%f28
	edge16l	%o2,	%g4,	%g5
	sth	%o1,	[%l7 + 0x7A]
	edge16ln	%i0,	%i1,	%i7
	sir	0x1532
	sdivx	%g2,	0x1852,	%l5
	fmovsle	%icc,	%f2,	%f22
	mova	%xcc,	%l6,	%o3
	addc	%i6,	0x11BF,	%l0
	fmovdl	%xcc,	%f11,	%f11
	movre	%i3,	%g3,	%o0
	movrgz	%o5,	%l4,	%i4
	stx	%l1,	[%l7 + 0x28]
	andcc	%o4,	%g1,	%l2
	orcc	%l3,	%i5,	%g6
	edge16ln	%g7,	%o6,	%i2
	edge8	%o2,	%o7,	%g4
	fsrc2	%f12,	%f6
	stb	%o1,	[%l7 + 0x2F]
	sdivx	%i0,	0x048F,	%g5
	fnot2	%f22,	%f6
	movvc	%icc,	%i1,	%i7
	andn	%g2,	%l5,	%o3
	sdivcc	%i6,	0x116B,	%l6
	edge32ln	%i3,	%l0,	%o0
	sllx	%o5,	%l4,	%i4
	mova	%icc,	%g3,	%o4
	fandnot1	%f0,	%f8,	%f6
	addcc	%g1,	0x0DD9,	%l1
	ldsb	[%l7 + 0x73],	%l2
	sra	%i5,	0x14,	%l3
	ld	[%l7 + 0x70],	%f9
	sdivx	%g6,	0x1354,	%o6
	popc	%i2,	%g7
	popc	%o7,	%g4
	alignaddrl	%o1,	%o2,	%i0
	udivcc	%i1,	0x045B,	%i7
	save %g5, %g2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i6,	0x1D61,	%l6
	alignaddr	%l5,	%l0,	%i3
	edge8	%o5,	%o0,	%i4
	fmovsne	%icc,	%f14,	%f1
	and	%g3,	0x0BBB,	%l4
	fandnot1	%f4,	%f16,	%f12
	smul	%g1,	%o4,	%l2
	fmovrsgz	%l1,	%f7,	%f30
	movvc	%icc,	%i5,	%l3
	sethi	0x1E11,	%o6
	smul	%g6,	0x1CC6,	%i2
	addccc	%g7,	%g4,	%o1
	std	%f14,	[%l7 + 0x18]
	popc	%o7,	%o2
	fcmpgt16	%f16,	%f12,	%i1
	edge16ln	%i7,	%i0,	%g5
	mulx	%o3,	0x006E,	%g2
	fmovrdgz	%i6,	%f28,	%f16
	ldsh	[%l7 + 0x0E],	%l5
	mova	%icc,	%l6,	%i3
	ldd	[%l7 + 0x10],	%l0
	stw	%o0,	[%l7 + 0x60]
	ldsb	[%l7 + 0x71],	%o5
	fmovdneg	%icc,	%f4,	%f24
	fmovrdlz	%i4,	%f10,	%f2
	ldd	[%l7 + 0x78],	%l4
	edge32n	%g1,	%g3,	%o4
	andn	%l1,	%l2,	%l3
	fmovscs	%icc,	%f9,	%f17
	movcc	%xcc,	%o6,	%g6
	udivx	%i5,	0x029A,	%i2
	fmovse	%icc,	%f29,	%f20
	fnands	%f11,	%f17,	%f13
	fpsub32	%f8,	%f26,	%f24
	nop
	set	0x2E, %i0
	lduh	[%l7 + %i0],	%g7
	movg	%xcc,	%g4,	%o7
	edge32ln	%o1,	%o2,	%i1
	fornot2s	%f14,	%f11,	%f12
	fzero	%f14
	or	%i7,	%i0,	%g5
	fnot1	%f18,	%f20
	sra	%g2,	0x10,	%i6
	fpmerge	%f21,	%f7,	%f30
	edge16n	%o3,	%l6,	%l5
	lduh	[%l7 + 0x3C],	%l0
	fnands	%f29,	%f26,	%f30
	fmovda	%icc,	%f16,	%f0
	bshuffle	%f8,	%f22,	%f22
	edge32	%i3,	%o5,	%i4
	fmovrde	%o0,	%f20,	%f2
	sub	%g1,	0x1C01,	%l4
	udivx	%o4,	0x0668,	%l1
	movleu	%icc,	%g3,	%l2
	mova	%xcc,	%l3,	%o6
	xorcc	%i5,	0x130D,	%i2
	movpos	%icc,	%g6,	%g4
	sdiv	%g7,	0x0599,	%o1
	movrlez	%o7,	0x022,	%i1
	udivcc	%o2,	0x08FF,	%i0
	orcc	%g5,	%g2,	%i7
	orn	%i6,	%o3,	%l5
	addccc	%l6,	0x1084,	%i3
	orn	%l0,	%o5,	%o0
	movleu	%icc,	%g1,	%l4
	andn	%i4,	%o4,	%l1
	fornot2s	%f30,	%f16,	%f16
	sra	%l2,	0x05,	%l3
	ldd	[%l7 + 0x20],	%f16
	movrlez	%o6,	%g3,	%i5
	srax	%i2,	%g6,	%g7
	fsrc1s	%f13,	%f9
	xorcc	%g4,	0x005B,	%o1
	fnot1	%f22,	%f22
	fcmpgt16	%f28,	%f10,	%o7
	alignaddrl	%i1,	%i0,	%o2
	movne	%icc,	%g5,	%i7
	fpsub16s	%f31,	%f26,	%f21
	edge16	%g2,	%o3,	%l5
	fcmpgt16	%f28,	%f0,	%i6
	smul	%l6,	0x084C,	%i3
	edge16l	%l0,	%o5,	%o0
	sth	%g1,	[%l7 + 0x7C]
	edge32n	%i4,	%o4,	%l1
	fmovsgu	%xcc,	%f16,	%f8
	movrgz	%l4,	0x05C,	%l3
	st	%f18,	[%l7 + 0x30]
	ldsh	[%l7 + 0x6E],	%o6
	movleu	%icc,	%l2,	%i5
	fmovrde	%i2,	%f12,	%f12
	edge16l	%g3,	%g7,	%g4
	movre	%o1,	0x333,	%g6
	stb	%i1,	[%l7 + 0x53]
	movne	%icc,	%i0,	%o7
	sdivcc	%g5,	0x0D4A,	%o2
	fnot2s	%f17,	%f1
	sub	%g2,	0x0485,	%o3
	edge32	%l5,	%i6,	%l6
	movvc	%icc,	%i7,	%i3
	add	%l0,	0x03AE,	%o5
	fmovrslz	%g1,	%f2,	%f12
	ldd	[%l7 + 0x48],	%f16
	smul	%o0,	0x1786,	%o4
	edge16	%i4,	%l4,	%l1
	sethi	0x06F5,	%l3
	edge32l	%l2,	%i5,	%i2
	addcc	%o6,	0x1F46,	%g7
	array8	%g3,	%g4,	%o1
	sdiv	%g6,	0x1B26,	%i1
	edge16l	%o7,	%g5,	%i0
	edge32ln	%o2,	%g2,	%o3
	andn	%l5,	%i6,	%l6
	orcc	%i7,	0x1348,	%l0
	edge8l	%i3,	%o5,	%o0
	movcc	%xcc,	%o4,	%i4
	edge8ln	%l4,	%g1,	%l1
	edge8l	%l3,	%l2,	%i5
	fnot1s	%f29,	%f13
	sll	%i2,	%g7,	%o6
	alignaddr	%g3,	%o1,	%g6
	sdivx	%g4,	0x16FB,	%i1
	array8	%g5,	%i0,	%o2
	xor	%g2,	0x0732,	%o3
	xnor	%o7,	0x13BD,	%l5
	movrgez	%l6,	0x38B,	%i7
	edge8n	%l0,	%i6,	%i3
	udivcc	%o5,	0x0A03,	%o0
	movgu	%xcc,	%o4,	%l4
	edge8	%g1,	%i4,	%l3
	edge32ln	%l1,	%l2,	%i5
	fmovrdlez	%g7,	%f26,	%f2
	st	%f20,	[%l7 + 0x6C]
	fpsub16	%f10,	%f20,	%f28
	umulcc	%o6,	%i2,	%o1
	orcc	%g6,	0x04F2,	%g4
	fcmpne16	%f0,	%f24,	%g3
	movrne	%i1,	%g5,	%o2
	array8	%g2,	%i0,	%o3
	mulx	%o7,	%l5,	%i7
	alignaddrl	%l0,	%i6,	%l6
	movcs	%xcc,	%i3,	%o5
	edge32n	%o4,	%o0,	%l4
	movg	%icc,	%g1,	%l3
	sllx	%l1,	%i4,	%i5
	edge32n	%l2,	%g7,	%o6
	ldsh	[%l7 + 0x2A],	%i2
	orncc	%o1,	0x185E,	%g4
	fpsub32s	%f0,	%f6,	%f15
	movneg	%xcc,	%g3,	%g6
	fmovdvs	%xcc,	%f9,	%f31
	fpsub32s	%f1,	%f8,	%f10
	std	%f8,	[%l7 + 0x28]
	edge8n	%i1,	%o2,	%g2
	udiv	%g5,	0x099A,	%i0
	edge8ln	%o3,	%o7,	%l5
	fpadd32s	%f2,	%f17,	%f5
	sdivx	%l0,	0x0A08,	%i7
	sll	%i6,	0x03,	%i3
	fcmpgt32	%f2,	%f20,	%l6
	edge8ln	%o5,	%o0,	%l4
	fcmped	%fcc1,	%f20,	%f18
	srl	%g1,	%o4,	%l3
	or	%l1,	%i4,	%l2
	xnor	%g7,	0x09EC,	%o6
	sll	%i5,	%o1,	%i2
	stb	%g4,	[%l7 + 0x57]
	st	%f23,	[%l7 + 0x68]
	sdiv	%g3,	0x01ED,	%g6
	addccc	%o2,	0x0302,	%i1
	sllx	%g5,	%i0,	%o3
	smul	%o7,	%l5,	%g2
	movrlz	%l0,	%i6,	%i7
	mova	%xcc,	%i3,	%l6
	edge16l	%o0,	%l4,	%g1
	umulcc	%o5,	0x1B75,	%l3
	edge32n	%o4,	%i4,	%l2
	fmul8x16au	%f3,	%f29,	%f4
	stb	%l1,	[%l7 + 0x1D]
	edge8	%g7,	%i5,	%o1
	andn	%o6,	%i2,	%g4
	orcc	%g3,	0x0E10,	%o2
	edge32ln	%g6,	%g5,	%i0
	fcmple16	%f10,	%f14,	%o3
	xor	%o7,	0x1D47,	%i1
	ldsh	[%l7 + 0x76],	%l5
	fnot1	%f6,	%f26
	ldsw	[%l7 + 0x40],	%l0
	fmuld8sux16	%f1,	%f3,	%f6
	ldsb	[%l7 + 0x60],	%i6
	edge32	%i7,	%i3,	%l6
	edge16l	%g2,	%o0,	%l4
	fmovdvs	%xcc,	%f2,	%f14
	edge16	%g1,	%o5,	%l3
	movrne	%o4,	%l2,	%l1
	stx	%i4,	[%l7 + 0x68]
	ld	[%l7 + 0x70],	%f9
	fnot1	%f6,	%f6
	fornot2s	%f11,	%f4,	%f31
	sir	0x15A8
	fone	%f8
	sdivcc	%g7,	0x17BB,	%o1
	mulscc	%o6,	%i2,	%g4
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	ldsb	[%l7 + 0x45],	%g6
	edge32ln	%i0,	%o3,	%g5
	fmovrdgz	%i1,	%f4,	%f0
	mulx	%o7,	0x1A36,	%l5
	edge16n	%l0,	%i7,	%i6
	andcc	%l6,	0x0B85,	%i3
	xor	%g2,	%o0,	%l4
	addc	%o5,	0x09F7,	%g1
	sdivcc	%l3,	0x11ED,	%o4
	sth	%l2,	[%l7 + 0x1A]
	fcmps	%fcc0,	%f23,	%f28
	movvs	%xcc,	%l1,	%i4
	edge32ln	%o1,	%g7,	%i2
	fpsub32	%f30,	%f12,	%f26
	fcmpd	%fcc3,	%f6,	%f6
	edge32ln	%o6,	%g4,	%o2
	array8	%i5,	%g3,	%g6
	stb	%o3,	[%l7 + 0x1A]
	srl	%g5,	0x1C,	%i0
	smulcc	%o7,	%l5,	%l0
	orn	%i7,	0x0FA9,	%i1
	movge	%xcc,	%i6,	%i3
	addc	%l6,	%g2,	%o0
	fands	%f6,	%f5,	%f14
	popc	0x14BF,	%o5
	nop
	set	0x0E, %o7
	ldsh	[%l7 + %o7],	%l4
	stx	%g1,	[%l7 + 0x30]
	move	%xcc,	%l3,	%l2
	sra	%l1,	%i4,	%o1
	movneg	%xcc,	%g7,	%i2
	xnor	%o4,	0x0F44,	%o6
	edge8ln	%o2,	%i5,	%g3
	fors	%f0,	%f10,	%f0
	fmovdne	%icc,	%f21,	%f19
	sllx	%g6,	%o3,	%g5
	movle	%icc,	%i0,	%g4
	array8	%o7,	%l5,	%l0
	fzeros	%f24
	movgu	%xcc,	%i7,	%i6
	fxors	%f13,	%f11,	%f19
	movne	%icc,	%i3,	%l6
	ldd	[%l7 + 0x48],	%g2
	srlx	%i1,	%o0,	%o5
	subcc	%l4,	0x0B71,	%l3
	subcc	%g1,	0x1264,	%l2
	ldub	[%l7 + 0x59],	%l1
	edge32	%i4,	%o1,	%i2
	andn	%o4,	%o6,	%g7
	popc	0x0C38,	%i5
	restore %g3, %g6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x08],	%o3
	ldsb	[%l7 + 0x56],	%g5
	orcc	%g4,	%o7,	%i0
	array32	%l5,	%l0,	%i6
	popc	0x0B21,	%i7
	xnorcc	%l6,	0x0C32,	%g2
	movvc	%xcc,	%i3,	%o0
	ldd	[%l7 + 0x58],	%f30
	movg	%xcc,	%o5,	%i1
	fmul8x16	%f20,	%f28,	%f2
	andncc	%l3,	%l4,	%l2
	sllx	%g1,	0x07,	%i4
	addcc	%o1,	%l1,	%o4
	fmovdcs	%icc,	%f9,	%f22
	alignaddr	%i2,	%o6,	%g7
	movrgez	%g3,	0x22E,	%g6
	sllx	%i5,	%o2,	%o3
	fand	%f16,	%f16,	%f22
	save %g4, 0x1F26, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%icc,	%f13,	%f3
	ldx	[%l7 + 0x70],	%i0
	edge16l	%l5,	%g5,	%i6
	fcmpeq32	%f14,	%f10,	%i7
	stw	%l6,	[%l7 + 0x60]
	movcs	%icc,	%g2,	%l0
	stx	%o0,	[%l7 + 0x58]
	st	%f1,	[%l7 + 0x10]
	xnorcc	%o5,	%i1,	%l3
	movle	%icc,	%l4,	%i3
	movrgz	%g1,	0x2CF,	%l2
	xor	%i4,	%o1,	%l1
	fnand	%f10,	%f28,	%f4
	sethi	0x0395,	%o4
	alignaddr	%o6,	%i2,	%g3
	array32	%g6,	%i5,	%o2
	fpsub32s	%f22,	%f21,	%f22
	movle	%icc,	%g7,	%g4
	fmul8ulx16	%f4,	%f26,	%f2
	movpos	%icc,	%o7,	%o3
	xorcc	%i0,	%g5,	%l5
	fmovrdgz	%i6,	%f6,	%f18
	stx	%i7,	[%l7 + 0x60]
	edge16	%l6,	%g2,	%l0
	alignaddr	%o5,	%i1,	%l3
	sub	%l4,	0x0AE2,	%i3
	sir	0x1F04
	fzeros	%f2
	orcc	%o0,	%l2,	%g1
	movcc	%icc,	%i4,	%o1
	fmovdpos	%icc,	%f2,	%f22
	fandnot2	%f22,	%f16,	%f12
	alignaddr	%o4,	%l1,	%i2
	fcmpne16	%f24,	%f4,	%o6
	fmovrdlz	%g6,	%f18,	%f26
	movn	%icc,	%i5,	%o2
	faligndata	%f6,	%f18,	%f18
	array8	%g3,	%g4,	%g7
	addc	%o3,	%o7,	%i0
	movrne	%l5,	0x08C,	%i6
	fnors	%f10,	%f11,	%f15
	ld	[%l7 + 0x7C],	%f8
	fmovsl	%icc,	%f26,	%f18
	edge32ln	%i7,	%l6,	%g2
	movrlez	%l0,	%g5,	%i1
	mulx	%l3,	%l4,	%o5
	subc	%i3,	%l2,	%o0
	fcmpgt16	%f18,	%f2,	%g1
	array16	%i4,	%o4,	%o1
	movrne	%l1,	%i2,	%g6
	edge16	%i5,	%o2,	%o6
	ldsb	[%l7 + 0x66],	%g4
	addc	%g3,	%g7,	%o3
	ldd	[%l7 + 0x38],	%i0
	alignaddr	%l5,	%o7,	%i6
	movn	%xcc,	%i7,	%g2
	alignaddr	%l6,	%g5,	%i1
	or	%l3,	%l4,	%l0
	subccc	%o5,	%l2,	%o0
	ldd	[%l7 + 0x18],	%g0
	ldx	[%l7 + 0x38],	%i3
	fcmple32	%f12,	%f14,	%i4
	sllx	%o4,	%l1,	%o1
	fcmpd	%fcc3,	%f22,	%f8
	andncc	%i2,	%i5,	%o2
	ldsb	[%l7 + 0x08],	%o6
	edge16n	%g4,	%g3,	%g7
	movrlz	%g6,	0x226,	%o3
	edge8ln	%l5,	%o7,	%i6
	fnot1	%f20,	%f18
	fmovrsne	%i0,	%f19,	%f11
	udivx	%g2,	0x068B,	%i7
	fcmpes	%fcc0,	%f23,	%f12
	edge8n	%l6,	%i1,	%l3
	fmovdle	%xcc,	%f19,	%f15
	xor	%g5,	0x1671,	%l0
	movge	%xcc,	%o5,	%l4
	mulscc	%o0,	0x14EC,	%g1
	movge	%xcc,	%l2,	%i4
	ldd	[%l7 + 0x30],	%f6
	fmovde	%icc,	%f18,	%f27
	movle	%xcc,	%o4,	%l1
	movn	%xcc,	%o1,	%i2
	sdiv	%i3,	0x187F,	%o2
	nop
	set	0x50, %g5
	stw	%i5,	[%l7 + %g5]
	lduw	[%l7 + 0x74],	%g4
	edge16n	%o6,	%g3,	%g7
	udiv	%g6,	0x10E3,	%l5
	movleu	%xcc,	%o3,	%i6
	stb	%i0,	[%l7 + 0x3D]
	array8	%o7,	%g2,	%i7
	ldd	[%l7 + 0x20],	%f18
	sllx	%l6,	0x09,	%l3
	array32	%i1,	%l0,	%g5
	udivcc	%l4,	0x0225,	%o5
	fmovrslez	%o0,	%f24,	%f9
	stx	%g1,	[%l7 + 0x58]
	udivcc	%l2,	0x0471,	%o4
	xor	%i4,	0x0A3F,	%o1
	array8	%i2,	%l1,	%o2
	movneg	%xcc,	%i5,	%i3
	fnor	%f28,	%f10,	%f0
	alignaddr	%g4,	%g3,	%o6
	srl	%g7,	0x02,	%g6
	addcc	%l5,	%o3,	%i0
	movvs	%icc,	%o7,	%i6
	fmovscs	%xcc,	%f21,	%f0
	xnor	%g2,	%l6,	%l3
	popc	0x01ED,	%i7
	addccc	%l0,	0x025F,	%i1
	sethi	0x0436,	%l4
	edge8n	%o5,	%o0,	%g5
	popc	%l2,	%o4
	movl	%icc,	%g1,	%i4
	addc	%i2,	%o1,	%l1
	fcmpeq16	%f30,	%f20,	%i5
	fzero	%f28
	stb	%i3,	[%l7 + 0x43]
	edge16l	%o2,	%g3,	%g4
	orncc	%g7,	0x1CD5,	%g6
	addccc	%l5,	0x1F8E,	%o3
	alignaddr	%o6,	%i0,	%o7
	fpadd32s	%f1,	%f24,	%f18
	sir	0x1B6F
	mova	%xcc,	%g2,	%i6
	fnors	%f31,	%f23,	%f18
	sdivcc	%l6,	0x1CF8,	%i7
	ldub	[%l7 + 0x18],	%l3
	ldd	[%l7 + 0x08],	%i0
	udiv	%l0,	0x03C5,	%l4
	fmovsg	%xcc,	%f9,	%f16
	movg	%xcc,	%o0,	%g5
	or	%o5,	0x179F,	%o4
	array16	%l2,	%g1,	%i2
	fcmpgt32	%f24,	%f16,	%i4
	stb	%l1,	[%l7 + 0x4F]
	movge	%icc,	%o1,	%i3
	fmovsle	%icc,	%f12,	%f16
	mulscc	%o2,	%i5,	%g3
	fors	%f16,	%f5,	%f15
	edge16	%g4,	%g6,	%l5
	fmovdcc	%xcc,	%f31,	%f7
	or	%g7,	%o6,	%i0
	sethi	0x0A94,	%o7
	edge32	%o3,	%g2,	%i6
	sdivx	%l6,	0x11A3,	%l3
	lduw	[%l7 + 0x34],	%i7
	edge32l	%i1,	%l4,	%l0
	fandnot1s	%f20,	%f8,	%f17
	ldd	[%l7 + 0x18],	%f12
	andn	%g5,	%o0,	%o5
	edge32n	%o4,	%l2,	%g1
	bshuffle	%f14,	%f0,	%f26
	movvs	%xcc,	%i2,	%i4
	edge8n	%l1,	%i3,	%o1
	fmovsvc	%xcc,	%f10,	%f13
	movre	%o2,	0x3A7,	%g3
	movle	%xcc,	%i5,	%g4
	fcmple32	%f16,	%f24,	%g6
	ld	[%l7 + 0x10],	%f24
	andcc	%l5,	0x1181,	%o6
	edge16ln	%g7,	%o7,	%i0
	lduw	[%l7 + 0x54],	%g2
	fpack32	%f10,	%f8,	%f26
	fpackfix	%f24,	%f30
	movneg	%xcc,	%o3,	%l6
	fmovrde	%i6,	%f24,	%f12
	movrgz	%i7,	0x369,	%i1
	edge8ln	%l4,	%l3,	%l0
	ldx	[%l7 + 0x30],	%o0
	sra	%o5,	0x0B,	%o4
	movrlez	%g5,	%l2,	%g1
	ldsh	[%l7 + 0x36],	%i2
	sub	%i4,	%i3,	%l1
	movcs	%xcc,	%o2,	%o1
	sethi	0x0D2F,	%g3
	and	%g4,	0x1A87,	%g6
	fmuld8ulx16	%f23,	%f7,	%f26
	srl	%l5,	0x1C,	%i5
	subcc	%g7,	%o7,	%i0
	sethi	0x06AC,	%o6
	ldd	[%l7 + 0x70],	%f6
	movpos	%icc,	%g2,	%l6
	sdiv	%i6,	0x1D2F,	%o3
	xorcc	%i7,	%i1,	%l4
	edge32ln	%l0,	%o0,	%l3
	st	%f30,	[%l7 + 0x20]
	movle	%xcc,	%o5,	%g5
	sll	%o4,	%l2,	%i2
	array8	%i4,	%g1,	%l1
	movrlez	%i3,	%o1,	%g3
	fcmpd	%fcc1,	%f22,	%f24
	fpsub32s	%f2,	%f30,	%f15
	stx	%o2,	[%l7 + 0x68]
	orn	%g4,	0x0416,	%l5
	orcc	%i5,	%g6,	%g7
	xnor	%i0,	%o6,	%g2
	fcmpeq16	%f28,	%f30,	%o7
	fxnors	%f25,	%f30,	%f6
	fmul8x16al	%f23,	%f0,	%f12
	addc	%l6,	0x0114,	%o3
	sth	%i7,	[%l7 + 0x3E]
	ldx	[%l7 + 0x58],	%i6
	subc	%l4,	0x1C86,	%i1
	fmovsle	%xcc,	%f3,	%f4
	edge32n	%l0,	%l3,	%o5
	addcc	%o0,	%g5,	%o4
	ldsb	[%l7 + 0x58],	%i2
	srax	%l2,	%i4,	%g1
	edge8l	%i3,	%o1,	%l1
	mulx	%o2,	%g3,	%g4
	edge32l	%i5,	%l5,	%g6
	sll	%g7,	0x18,	%o6
	fcmpd	%fcc3,	%f14,	%f30
	edge16ln	%g2,	%o7,	%i0
	array8	%o3,	%l6,	%i7
	edge16	%l4,	%i6,	%l0
	stw	%l3,	[%l7 + 0x58]
	std	%f4,	[%l7 + 0x58]
	fabsd	%f20,	%f22
	sdivcc	%i1,	0x113B,	%o5
	srl	%o0,	%o4,	%i2
	xorcc	%g5,	%i4,	%g1
	movrlez	%l2,	%i3,	%l1
	edge32l	%o1,	%o2,	%g4
	xorcc	%i5,	%g3,	%l5
	addc	%g7,	%o6,	%g6
	fmovdl	%icc,	%f31,	%f0
	edge8ln	%o7,	%i0,	%o3
	array16	%l6,	%g2,	%i7
	movrlez	%l4,	0x12B,	%i6
	sth	%l0,	[%l7 + 0x70]
	mulscc	%i1,	%l3,	%o0
	sdivx	%o5,	0x10D9,	%o4
	subcc	%i2,	%i4,	%g5
	std	%f14,	[%l7 + 0x58]
	nop
	set	0x49, %g7
	ldub	[%l7 + %g7],	%g1
	xnorcc	%i3,	%l2,	%l1
	sra	%o2,	%g4,	%o1
	save %g3, %i5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f0,	%f15,	%f8
	movcc	%xcc,	%o6,	%l5
	sra	%o7,	0x12,	%g6
	fmovs	%f7,	%f29
	ld	[%l7 + 0x1C],	%f28
	fmovscs	%xcc,	%f12,	%f3
	movrne	%o3,	0x287,	%l6
	subccc	%g2,	%i0,	%i7
	movcc	%xcc,	%i6,	%l4
	xnorcc	%l0,	0x1E94,	%i1
	nop
	set	0x23, %o4
	ldsb	[%l7 + %o4],	%o0
	ld	[%l7 + 0x50],	%f11
	movl	%xcc,	%o5,	%o4
	fornot1s	%f30,	%f29,	%f28
	add	%l3,	%i2,	%i4
	fnot1s	%f8,	%f29
	movl	%icc,	%g1,	%g5
	edge16l	%l2,	%l1,	%i3
	movvc	%xcc,	%o2,	%o1
	movgu	%xcc,	%g4,	%i5
	fmovdl	%icc,	%f24,	%f15
	movgu	%icc,	%g7,	%g3
	movpos	%icc,	%l5,	%o6
	orcc	%g6,	%o7,	%o3
	mova	%xcc,	%g2,	%i0
	orn	%l6,	%i6,	%i7
	xor	%l0,	%l4,	%i1
	edge16	%o0,	%o4,	%l3
	and	%o5,	0x0201,	%i4
	edge32n	%g1,	%g5,	%l2
	andncc	%i2,	%l1,	%o2
	movre	%o1,	0x221,	%i3
	sth	%i5,	[%l7 + 0x56]
	ldsw	[%l7 + 0x1C],	%g7
	sth	%g3,	[%l7 + 0x1E]
	edge8l	%l5,	%o6,	%g6
	umulcc	%o7,	%o3,	%g4
	fmovrdlez	%g2,	%f2,	%f4
	movle	%xcc,	%i0,	%l6
	xnor	%i7,	0x00A4,	%i6
	add	%l0,	%l4,	%i1
	orn	%o4,	%l3,	%o5
	fcmpes	%fcc3,	%f16,	%f3
	movleu	%icc,	%i4,	%o0
	fmovdle	%xcc,	%f3,	%f7
	and	%g5,	%l2,	%g1
	mova	%icc,	%i2,	%l1
	stx	%o1,	[%l7 + 0x60]
	stb	%i3,	[%l7 + 0x3D]
	addcc	%o2,	0x0161,	%i5
	orn	%g3,	%g7,	%o6
	or	%l5,	0x1CE5,	%o7
	srl	%g6,	%o3,	%g2
	movle	%icc,	%g4,	%l6
	movne	%xcc,	%i7,	%i0
	andcc	%l0,	0x0C52,	%i6
	stx	%l4,	[%l7 + 0x20]
	edge8	%i1,	%o4,	%l3
	add	%o5,	%i4,	%g5
	sra	%o0,	%g1,	%i2
	sll	%l2,	%l1,	%i3
	movgu	%icc,	%o1,	%i5
	movle	%xcc,	%o2,	%g7
	edge32	%o6,	%l5,	%o7
	movrlez	%g6,	0x033,	%o3
	ldx	[%l7 + 0x30],	%g2
	movge	%icc,	%g4,	%g3
	move	%icc,	%i7,	%i0
	alignaddrl	%l6,	%l0,	%i6
	st	%f16,	[%l7 + 0x14]
	ldsb	[%l7 + 0x5D],	%i1
	movneg	%icc,	%l4,	%o4
	save %l3, %o5, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i4,	%g1,	%o0
	array8	%l2,	%i2,	%l1
	movrgez	%i3,	0x0A2,	%i5
	popc	%o1,	%o2
	movrlez	%o6,	0x0E3,	%g7
	lduw	[%l7 + 0x0C],	%o7
	edge16	%g6,	%l5,	%o3
	stw	%g2,	[%l7 + 0x70]
	orcc	%g3,	0x027F,	%i7
	sth	%i0,	[%l7 + 0x14]
	sub	%l6,	%g4,	%l0
	movle	%xcc,	%i6,	%l4
	movg	%xcc,	%i1,	%l3
	movpos	%icc,	%o5,	%o4
	orn	%g5,	0x18EC,	%g1
	fpsub16s	%f11,	%f17,	%f16
	lduw	[%l7 + 0x54],	%i4
	xor	%o0,	%i2,	%l1
	umul	%l2,	0x01F0,	%i3
	movge	%icc,	%o1,	%o2
	sdivcc	%o6,	0x1627,	%g7
	ld	[%l7 + 0x44],	%f12
	edge16l	%o7,	%g6,	%l5
	sdivx	%i5,	0x1630,	%o3
	stx	%g3,	[%l7 + 0x60]
	movrgez	%g2,	0x02A,	%i7
	sllx	%l6,	0x17,	%g4
	mova	%xcc,	%i0,	%i6
	ldub	[%l7 + 0x3F],	%l0
	fpmerge	%f8,	%f3,	%f10
	addcc	%l4,	0x057F,	%i1
	udivx	%l3,	0x0D94,	%o4
	fnot1	%f14,	%f6
	fmovsvc	%xcc,	%f26,	%f30
	orcc	%g5,	%o5,	%g1
	st	%f16,	[%l7 + 0x70]
	movrgez	%o0,	0x1EE,	%i2
	array16	%l1,	%l2,	%i4
	edge16l	%o1,	%i3,	%o2
	srl	%o6,	%g7,	%g6
	sdiv	%o7,	0x0434,	%i5
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%l4
	smul	%o3,	0x061F,	%g3
	fmovrse	%g2,	%f15,	%f25
	edge8	%i7,	%g4,	%i0
	stw	%i6,	[%l7 + 0x44]
	umulcc	%l0,	%l4,	%l6
	fmul8x16	%f26,	%f30,	%f0
	std	%f4,	[%l7 + 0x78]
	ld	[%l7 + 0x20],	%f9
	ldd	[%l7 + 0x78],	%i0
	smul	%l3,	0x0FD0,	%g5
	siam	0x6
	edge32ln	%o5,	%o4,	%g1
	fmovrsne	%i2,	%f2,	%f21
	std	%f12,	[%l7 + 0x28]
	movvs	%xcc,	%o0,	%l2
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%l0
	udivcc	%i4,	0x0441,	%i3
	movneg	%xcc,	%o2,	%o1
	fmovsl	%icc,	%f15,	%f12
	edge8n	%g7,	%o6,	%o7
	movleu	%icc,	%i5,	%l5
	movpos	%icc,	%g6,	%g3
	save %g2, 0x1C95, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x56],	%g4
	array8	%i7,	%i6,	%i0
	movvs	%icc,	%l4,	%l0
	array16	%l6,	%l3,	%i1
	sdivcc	%o5,	0x012D,	%g5
	fpadd32	%f6,	%f16,	%f0
	fmovdvs	%icc,	%f2,	%f4
	andncc	%o4,	%i2,	%g1
	stx	%l2,	[%l7 + 0x20]
	lduh	[%l7 + 0x7A],	%o0
	fmovda	%icc,	%f24,	%f21
	fornot2s	%f14,	%f4,	%f14
	smul	%i4,	%i3,	%l1
	udivcc	%o1,	0x1FB9,	%o2
	mulx	%o6,	%g7,	%o7
	movl	%icc,	%i5,	%l5
	udiv	%g3,	0x14A7,	%g2
	ldsh	[%l7 + 0x0A],	%o3
	udivx	%g4,	0x1FAF,	%g6
	std	%f2,	[%l7 + 0x60]
	srax	%i7,	0x14,	%i0
	lduh	[%l7 + 0x76],	%i6
	udiv	%l0,	0x18A4,	%l4
	st	%f11,	[%l7 + 0x5C]
	edge16	%l3,	%i1,	%l6
	or	%o5,	%g5,	%i2
	sll	%o4,	0x1E,	%g1
	movrgez	%l2,	%o0,	%i4
	xnorcc	%l1,	%o1,	%o2
	fors	%f30,	%f17,	%f3
	fmul8x16	%f20,	%f26,	%f6
	array16	%o6,	%g7,	%o7
	sub	%i3,	0x0123,	%i5
	sethi	0x0ADC,	%g3
	umul	%g2,	%o3,	%l5
	edge32n	%g4,	%i7,	%g6
	stw	%i6,	[%l7 + 0x54]
	fmovse	%xcc,	%f5,	%f25
	ld	[%l7 + 0x54],	%f10
	lduh	[%l7 + 0x4A],	%i0
	movge	%icc,	%l0,	%l3
	movl	%xcc,	%l4,	%i1
	fsrc1	%f30,	%f6
	subcc	%o5,	0x00B4,	%g5
	sethi	0x1818,	%i2
	movneg	%icc,	%o4,	%g1
	movn	%xcc,	%l6,	%o0
	stw	%i4,	[%l7 + 0x78]
	fmovdn	%icc,	%f0,	%f28
	movl	%xcc,	%l2,	%o1
	edge16n	%l1,	%o6,	%g7
	array32	%o7,	%i3,	%i5
	fsrc1s	%f29,	%f25
	movvs	%xcc,	%g3,	%o2
	srlx	%g2,	0x08,	%o3
	edge16ln	%g4,	%i7,	%g6
	sir	0x06DD
	or	%i6,	%l5,	%l0
	array16	%l3,	%i0,	%l4
	edge16l	%i1,	%g5,	%i2
	ldub	[%l7 + 0x29],	%o5
	or	%g1,	%o4,	%o0
	fexpand	%f18,	%f18
	udivcc	%l6,	0x163B,	%l2
	udivcc	%i4,	0x06CA,	%l1
	fmul8x16al	%f27,	%f17,	%f30
	sdivx	%o1,	0x045B,	%o6
	ldub	[%l7 + 0x52],	%g7
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	fcmpne16	%f20,	%f22,	%o2
	fxnors	%f21,	%f0,	%f16
	fandnot1	%f20,	%f14,	%f18
	andcc	%i3,	0x1E40,	%o3
	fmovsneg	%icc,	%f17,	%f7
	sdivx	%g4,	0x03D1,	%i7
	fmul8sux16	%f6,	%f4,	%f0
	stw	%g2,	[%l7 + 0x18]
	movrgz	%g6,	%i6,	%l5
	fnot2s	%f13,	%f19
	movpos	%icc,	%l0,	%i0
	movcc	%xcc,	%l3,	%i1
	xor	%g5,	%l4,	%i2
	movvc	%xcc,	%g1,	%o5
	fmovrdgz	%o4,	%f8,	%f20
	sth	%l6,	[%l7 + 0x50]
	lduh	[%l7 + 0x44],	%l2
	save %i4, %l1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o1,	%g7,	%o7
	save %o6, 0x136E, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o2,	%i3,	%o3
	umulcc	%g4,	%i7,	%i5
	fmovs	%f26,	%f3
	array16	%g2,	%g6,	%l5
	andcc	%i6,	0x0E1B,	%i0
	popc	0x05B8,	%l3
	edge16	%i1,	%l0,	%g5
	fcmple16	%f30,	%f18,	%i2
	udivcc	%g1,	0x11B1,	%l4
	fnot1s	%f11,	%f7
	move	%xcc,	%o4,	%o5
	andn	%l2,	%i4,	%l6
	movcs	%xcc,	%l1,	%o1
	ldd	[%l7 + 0x68],	%g6
	sllx	%o7,	0x01,	%o0
	orn	%o6,	%o2,	%i3
	edge16ln	%o3,	%g4,	%g3
	fmovsleu	%xcc,	%f28,	%f19
	andn	%i7,	0x1A5D,	%g2
	movrlz	%g6,	%i5,	%i6
	fornot1s	%f31,	%f16,	%f20
	smul	%i0,	0x01EF,	%l5
	edge8ln	%l3,	%l0,	%g5
	movvs	%icc,	%i2,	%i1
	edge8l	%l4,	%o4,	%o5
	and	%g1,	0x1731,	%l2
	edge16n	%l6,	%l1,	%i4
	and	%g7,	0x1B77,	%o7
	mulscc	%o0,	%o6,	%o1
	or	%o2,	0x13CA,	%o3
	restore %i3, %g3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g2,	0x0CB5,	%g4
	edge16l	%i5,	%g6,	%i6
	edge16	%l5,	%l3,	%i0
	movrne	%g5,	0x01E,	%i2
	udivcc	%i1,	0x1AA9,	%l4
	movge	%xcc,	%o4,	%l0
	udiv	%g1,	0x0A0A,	%l2
	edge32ln	%o5,	%l1,	%l6
	st	%f26,	[%l7 + 0x18]
	orn	%g7,	0x0C4B,	%i4
	for	%f2,	%f26,	%f20
	ld	[%l7 + 0x4C],	%f28
	fcmpgt16	%f8,	%f20,	%o0
	smul	%o7,	0x0E46,	%o1
	edge32ln	%o2,	%o6,	%i3
	orcc	%g3,	0x0C52,	%o3
	movvc	%xcc,	%i7,	%g2
	ld	[%l7 + 0x24],	%f28
	addccc	%i5,	%g4,	%g6
	udiv	%l5,	0x0D73,	%l3
	orcc	%i6,	0x020B,	%i0
	sth	%g5,	[%l7 + 0x0E]
	fone	%f22
	fpsub16	%f10,	%f30,	%f0
	movcc	%xcc,	%i1,	%l4
	smulcc	%i2,	0x0894,	%l0
	subccc	%o4,	0x1C54,	%g1
	stx	%o5,	[%l7 + 0x78]
	fnegd	%f2,	%f18
	srax	%l1,	%l6,	%g7
	ldsb	[%l7 + 0x3E],	%l2
	edge8l	%i4,	%o7,	%o0
	fcmpeq32	%f6,	%f6,	%o2
	fands	%f28,	%f28,	%f21
	stw	%o1,	[%l7 + 0x74]
	smul	%o6,	%i3,	%g3
	edge32n	%i7,	%g2,	%o3
	andn	%g4,	0x0E13,	%g6
	smul	%i5,	0x0AE6,	%l3
	fmovdle	%icc,	%f19,	%f21
	addccc	%i6,	0x0982,	%i0
	movcc	%icc,	%l5,	%i1
	sth	%g5,	[%l7 + 0x12]
	srax	%i2,	%l0,	%o4
	movrgez	%g1,	0x38C,	%l4
	orcc	%o5,	0x01D8,	%l6
	andcc	%g7,	%l2,	%l1
	fabss	%f28,	%f7
	udivcc	%i4,	0x00E0,	%o7
	movre	%o2,	%o0,	%o6
	array16	%i3,	%g3,	%i7
	alignaddr	%o1,	%g2,	%o3
	smulcc	%g4,	%g6,	%l3
	andcc	%i5,	0x0519,	%i6
	ldsw	[%l7 + 0x70],	%i0
	movrgez	%l5,	%g5,	%i2
	movcc	%icc,	%i1,	%l0
	movrlz	%o4,	%l4,	%o5
	add	%l6,	0x1B0C,	%g1
	sra	%l2,	%g7,	%l1
	save %o7, 0x0024, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f26,	%f2
	srlx	%o2,	%o6,	%i3
	edge32ln	%o0,	%g3,	%o1
	movle	%icc,	%g2,	%o3
	bshuffle	%f12,	%f6,	%f16
	fmovrsgez	%i7,	%f1,	%f18
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	sdiv	%i5,	0x0E2B,	%g6
	fpsub32	%f2,	%f30,	%f2
	ldx	[%l7 + 0x30],	%i0
	udiv	%i6,	0x010F,	%g5
	fcmpne16	%f20,	%f14,	%l5
	fmovrsgz	%i2,	%f27,	%f19
	sub	%i1,	0x12E3,	%o4
	nop
	set	0x38, %i1
	ldub	[%l7 + %i1],	%l4
	smul	%o5,	0x17B3,	%l0
	ldsw	[%l7 + 0x74],	%g1
	srax	%l2,	%l6,	%g7
	movrlz	%o7,	%i4,	%o2
	fmovsg	%xcc,	%f23,	%f7
	subccc	%o6,	0x0C6D,	%i3
	ld	[%l7 + 0x10],	%f30
	subc	%o0,	0x1653,	%g3
	movrne	%l1,	0x0FA,	%o1
	restore %o3, 0x0FC1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g2,	%l3,	%i5
	fmovrdlez	%g4,	%f16,	%f8
	save %g6, %i0, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l5,	%i2,	%i1
	or	%o4,	0x17DC,	%i6
	fzeros	%f23
	edge16ln	%l4,	%l0,	%o5
	fmovdleu	%icc,	%f31,	%f10
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%f8
	mova	%xcc,	%l2,	%g1
	movcc	%xcc,	%l6,	%o7
	andcc	%i4,	0x0604,	%o2
	save %o6, %i3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g3,	%l1,	%o1
	array32	%o0,	%i7,	%o3
	sethi	0x197D,	%g2
	edge8	%l3,	%i5,	%g4
	sll	%g6,	0x06,	%i0
	movrne	%g5,	%l5,	%i1
	ldsw	[%l7 + 0x3C],	%i2
	movrgez	%o4,	0x35A,	%i6
	andn	%l0,	0x1DB4,	%l4
	sdiv	%o5,	0x0E59,	%g1
	edge16	%l6,	%o7,	%i4
	fmovdleu	%xcc,	%f30,	%f13
	alignaddrl	%l2,	%o6,	%o2
	udivx	%i3,	0x0FA9,	%g3
	fnand	%f6,	%f4,	%f4
	fabsd	%f16,	%f0
	fmovrsgz	%g7,	%f19,	%f5
	xor	%o1,	%l1,	%i7
	edge32	%o3,	%o0,	%l3
	sth	%i5,	[%l7 + 0x60]
	orcc	%g2,	%g6,	%i0
	ldx	[%l7 + 0x28],	%g5
	smulcc	%g4,	0x0173,	%l5
	smulcc	%i2,	0x008F,	%i1
	ldd	[%l7 + 0x38],	%i6
	movn	%xcc,	%l0,	%o4
	or	%l4,	0x0940,	%g1
	movrgez	%l6,	0x153,	%o5
	fandnot2	%f16,	%f6,	%f10
	udiv	%o7,	0x061E,	%l2
	ldsb	[%l7 + 0x7C],	%i4
	fmovsg	%icc,	%f18,	%f0
	fnot1s	%f22,	%f7
	fxnors	%f6,	%f3,	%f20
	fmovrsne	%o6,	%f26,	%f23
	movg	%icc,	%i3,	%g3
	movrlez	%o2,	%o1,	%g7
	andcc	%i7,	%l1,	%o0
	movcs	%icc,	%o3,	%l3
	st	%f6,	[%l7 + 0x54]
	edge32	%i5,	%g2,	%i0
	stb	%g5,	[%l7 + 0x18]
	sth	%g4,	[%l7 + 0x50]
	orcc	%l5,	0x044E,	%i2
	umul	%g6,	0x0890,	%i1
	fmul8x16	%f2,	%f2,	%f12
	sethi	0x1FC7,	%i6
	lduh	[%l7 + 0x4E],	%o4
	fpadd32	%f8,	%f10,	%f0
	fmovsleu	%icc,	%f1,	%f25
	sdiv	%l0,	0x1786,	%l4
	edge32l	%l6,	%g1,	%o5
	sethi	0x1404,	%o7
	subcc	%i4,	0x053D,	%o6
	edge8l	%l2,	%g3,	%o2
	srlx	%o1,	0x0C,	%i3
	edge16ln	%i7,	%l1,	%o0
	mulscc	%g7,	%o3,	%i5
	edge8l	%g2,	%l3,	%g5
	alignaddrl	%i0,	%g4,	%l5
	fabsd	%f4,	%f4
	movn	%xcc,	%g6,	%i2
	ldd	[%l7 + 0x48],	%f8
	movcs	%xcc,	%i6,	%i1
	subcc	%o4,	%l4,	%l0
	fcmpd	%fcc0,	%f20,	%f22
	edge8	%g1,	%o5,	%l6
	edge16	%i4,	%o7,	%o6
	fmovdge	%icc,	%f4,	%f15
	sllx	%l2,	%o2,	%g3
	alignaddr	%i3,	%o1,	%i7
	movrlez	%l1,	%g7,	%o0
	xor	%i5,	%o3,	%g2
	movneg	%xcc,	%g5,	%l3
	fmovsvc	%xcc,	%f22,	%f9
	udivx	%i0,	0x126F,	%l5
	movneg	%xcc,	%g4,	%g6
	umul	%i6,	0x001D,	%i2
	std	%f20,	[%l7 + 0x60]
	movvc	%icc,	%o4,	%i1
	fmovsa	%xcc,	%f30,	%f26
	ldd	[%l7 + 0x08],	%l0
	ld	[%l7 + 0x14],	%f4
	movcc	%icc,	%g1,	%l4
	srlx	%o5,	%i4,	%l6
	edge32ln	%o7,	%o6,	%o2
	udiv	%l2,	0x1E7D,	%g3
	movvc	%icc,	%i3,	%i7
	sll	%l1,	%o1,	%g7
	sub	%o0,	%i5,	%o3
	umul	%g2,	%l3,	%g5
	movvs	%icc,	%l5,	%g4
	nop
	set	0x6C, %l2
	ldub	[%l7 + %l2],	%g6
	move	%xcc,	%i0,	%i6
	addcc	%i2,	0x0802,	%i1
	xnorcc	%l0,	%o4,	%l4
	edge8n	%g1,	%o5,	%i4
	fsrc1s	%f28,	%f0
	fnand	%f16,	%f14,	%f2
	sir	0x1C2D
	movrgz	%o7,	%l6,	%o6
	xnor	%l2,	%g3,	%i3
	xorcc	%i7,	0x06DF,	%l1
	movrlz	%o2,	%o1,	%o0
	fcmpgt32	%f0,	%f22,	%i5
	fpadd16	%f30,	%f4,	%f28
	fmovdne	%xcc,	%f0,	%f14
	st	%f19,	[%l7 + 0x2C]
	movvc	%xcc,	%g7,	%g2
	sllx	%l3,	%g5,	%l5
	movrgz	%g4,	0x3C7,	%g6
	ldd	[%l7 + 0x28],	%i0
	orncc	%o3,	%i6,	%i2
	movle	%xcc,	%l0,	%o4
	fmovrsgz	%i1,	%f8,	%f30
	stb	%g1,	[%l7 + 0x20]
	sub	%l4,	%o5,	%o7
	edge8	%i4,	%o6,	%l2
	or	%l6,	0x1115,	%i3
	xnor	%i7,	%g3,	%l1
	movre	%o1,	%o2,	%o0
	sdivx	%i5,	0x1372,	%g7
	ldsh	[%l7 + 0x12],	%l3
	alignaddrl	%g5,	%l5,	%g2
	addcc	%g4,	0x1466,	%i0
	fcmpne16	%f20,	%f0,	%g6
	movrgez	%o3,	0x1BA,	%i2
	nop
	set	0x30, %i4
	ldsb	[%l7 + %i4],	%i6
	mova	%xcc,	%o4,	%l0
	edge8n	%i1,	%l4,	%g1
	movcc	%xcc,	%o7,	%i4
	edge16n	%o6,	%l2,	%l6
	fsrc2	%f16,	%f8
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	fmovrsne	%o5,	%f17,	%f20
	and	%o1,	%o2,	%o0
	fmovsleu	%xcc,	%f7,	%f6
	movrgez	%l1,	%g7,	%i5
	movneg	%icc,	%l3,	%g5
	orncc	%g2,	%g4,	%i0
	movleu	%icc,	%l5,	%o3
	addccc	%g6,	0x0479,	%i6
	movpos	%icc,	%o4,	%l0
	fabss	%f21,	%f24
	lduw	[%l7 + 0x74],	%i1
	sth	%l4,	[%l7 + 0x2A]
	orcc	%i2,	%g1,	%o7
	ldd	[%l7 + 0x60],	%o6
	popc	0x0977,	%l2
	ldsb	[%l7 + 0x7C],	%l6
	sdivcc	%i3,	0x1536,	%i4
	restore %i7, 0x0C06, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%g3,	%f14,	%f6
	fxors	%f21,	%f27,	%f27
	ldsh	[%l7 + 0x72],	%o2
	orn	%o0,	%o1,	%g7
	stb	%l1,	[%l7 + 0x15]
	edge16	%i5,	%l3,	%g2
	ldsh	[%l7 + 0x6A],	%g4
	edge32	%i0,	%g5,	%o3
	sra	%l5,	%i6,	%o4
	edge16	%l0,	%g6,	%l4
	sra	%i2,	%g1,	%i1
	movneg	%icc,	%o7,	%o6
	fmovdl	%icc,	%f31,	%f11
	ldub	[%l7 + 0x43],	%l2
	stx	%i3,	[%l7 + 0x38]
	ldd	[%l7 + 0x08],	%i4
	movgu	%xcc,	%l6,	%o5
	fmovrdgz	%i7,	%f2,	%f2
	st	%f5,	[%l7 + 0x30]
	addc	%o2,	0x0D1D,	%o0
	fmul8x16au	%f18,	%f29,	%f20
	srlx	%o1,	0x02,	%g3
	orncc	%l1,	%g7,	%l3
	srax	%g2,	%g4,	%i0
	edge8l	%i5,	%o3,	%l5
	ld	[%l7 + 0x78],	%f22
	fandnot2	%f0,	%f8,	%f26
	fmovda	%icc,	%f0,	%f21
	lduw	[%l7 + 0x0C],	%i6
	and	%o4,	0x1C56,	%g5
	ldx	[%l7 + 0x08],	%g6
	srlx	%l4,	%i2,	%l0
	fxnor	%f8,	%f30,	%f2
	movleu	%xcc,	%g1,	%i1
	add	%o7,	0x18B4,	%l2
	edge32	%o6,	%i4,	%i3
	edge16	%l6,	%o5,	%i7
	array8	%o0,	%o2,	%o1
	mulx	%l1,	0x1A22,	%g7
	srl	%g3,	0x01,	%l3
	fnor	%f20,	%f20,	%f20
	ldd	[%l7 + 0x50],	%g2
	andn	%g4,	0x07CF,	%i0
	addccc	%i5,	0x0195,	%l5
	edge8n	%o3,	%i6,	%o4
	edge32ln	%g5,	%l4,	%g6
	fmovdge	%icc,	%f28,	%f13
	addc	%l0,	0x1E63,	%i2
	sllx	%g1,	%i1,	%l2
	movrne	%o7,	0x2EC,	%i4
	fmovs	%f23,	%f2
	subcc	%o6,	%l6,	%o5
	fmovsgu	%icc,	%f8,	%f17
	movgu	%icc,	%i3,	%o0
	sllx	%i7,	0x00,	%o1
	edge32ln	%o2,	%g7,	%g3
	edge16ln	%l3,	%l1,	%g4
	alignaddrl	%g2,	%i5,	%l5
	ldsw	[%l7 + 0x14],	%i0
	umul	%i6,	0x17B6,	%o3
	fzero	%f12
	ldsh	[%l7 + 0x22],	%g5
	andcc	%l4,	%g6,	%o4
	st	%f27,	[%l7 + 0x0C]
	fandnot2s	%f4,	%f8,	%f20
	fpadd32	%f0,	%f10,	%f18
	alignaddr	%i2,	%g1,	%i1
	movl	%icc,	%l0,	%o7
	sethi	0x1AAD,	%i4
	sllx	%o6,	0x09,	%l6
	fmovrdlez	%l2,	%f26,	%f22
	ldsb	[%l7 + 0x4B],	%o5
	fzero	%f28
	fmovdl	%xcc,	%f24,	%f12
	smul	%i3,	%i7,	%o1
	edge8	%o2,	%g7,	%o0
	movne	%icc,	%l3,	%l1
	movl	%xcc,	%g4,	%g3
	fmovsl	%xcc,	%f10,	%f26
	edge8	%i5,	%g2,	%l5
	movcc	%icc,	%i0,	%o3
	xnorcc	%i6,	0x07A6,	%l4
	ldub	[%l7 + 0x0B],	%g6
	fcmps	%fcc3,	%f2,	%f11
	fcmple16	%f0,	%f4,	%g5
	ldsh	[%l7 + 0x2C],	%o4
	movn	%icc,	%i2,	%g1
	xnor	%l0,	0x18D0,	%o7
	movrgez	%i1,	0x0F6,	%o6
	ldd	[%l7 + 0x68],	%i4
	subc	%l2,	0x194C,	%l6
	edge8ln	%i3,	%o5,	%i7
	mulx	%o1,	%o2,	%g7
	edge32n	%l3,	%o0,	%l1
	movle	%icc,	%g4,	%g3
	mova	%xcc,	%g2,	%i5
	popc	%i0,	%l5
	ldsh	[%l7 + 0x0C],	%o3
	edge32ln	%i6,	%g6,	%g5
	add	%o4,	0x1901,	%l4
	movcc	%xcc,	%i2,	%g1
	edge8l	%l0,	%o7,	%o6
	fpsub16s	%f3,	%f14,	%f29
	popc	%i4,	%i1
	fmovdvc	%xcc,	%f0,	%f28
	srl	%l2,	%i3,	%l6
	ldx	[%l7 + 0x48],	%o5
	save %i7, %o1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l3,	[%l7 + 0x70]
	fsrc1	%f10,	%f30
	movrgz	%o0,	%g7,	%g4
	udivcc	%g3,	0x14A3,	%g2
	movl	%xcc,	%i5,	%l1
	fpadd16s	%f9,	%f14,	%f3
	movcc	%xcc,	%l5,	%o3
	std	%f28,	[%l7 + 0x78]
	fnand	%f0,	%f22,	%f20
	umul	%i0,	%i6,	%g5
	sir	0x16CE
	movleu	%icc,	%o4,	%l4
	stx	%i2,	[%l7 + 0x10]
	udiv	%g1,	0x1612,	%l0
	movpos	%icc,	%g6,	%o6
	movn	%icc,	%o7,	%i4
	array8	%i1,	%l2,	%l6
	movle	%icc,	%o5,	%i3
	edge16n	%i7,	%o1,	%l3
	sethi	0x1CF3,	%o0
	fmul8x16au	%f24,	%f28,	%f12
	or	%o2,	%g4,	%g7
	fmovsa	%xcc,	%f14,	%f18
	fone	%f30
	movle	%xcc,	%g3,	%i5
	fnands	%f25,	%f4,	%f5
	fcmpd	%fcc3,	%f16,	%f10
	add	%g2,	%l5,	%l1
	fnor	%f28,	%f20,	%f22
	fcmpgt32	%f28,	%f4,	%o3
	fcmpne32	%f18,	%f30,	%i6
	lduw	[%l7 + 0x18],	%g5
	ldsb	[%l7 + 0x74],	%o4
	save %i0, %l4, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f22,	%f8,	%f28
	xorcc	%l0,	%g6,	%o6
	fmovrdgz	%i2,	%f6,	%f14
	edge16	%i4,	%o7,	%i1
	udivcc	%l2,	0x11B3,	%o5
	subcc	%i3,	%i7,	%o1
	fmovd	%f0,	%f20
	movg	%icc,	%l3,	%l6
	fzeros	%f31
	fandnot2s	%f31,	%f29,	%f21
	movrlez	%o0,	%g4,	%o2
	fsrc2s	%f8,	%f31
	ldsw	[%l7 + 0x70],	%g7
	srlx	%i5,	0x1C,	%g3
	mulx	%g2,	%l5,	%l1
	fpackfix	%f30,	%f25
	movrgez	%i6,	%g5,	%o4
	edge32n	%o3,	%l4,	%i0
	stb	%l0,	[%l7 + 0x2B]
	array8	%g6,	%o6,	%g1
	edge16	%i2,	%i4,	%i1
	ldsw	[%l7 + 0x54],	%o7
	movpos	%icc,	%l2,	%i3
	smul	%i7,	%o1,	%l3
	orncc	%l6,	%o0,	%g4
	popc	%o2,	%g7
	movrgez	%o5,	%g3,	%i5
	fsrc2	%f8,	%f2
	andcc	%l5,	%l1,	%i6
	edge8	%g2,	%o4,	%g5
	movgu	%xcc,	%o3,	%i0
	edge32l	%l0,	%g6,	%l4
	lduh	[%l7 + 0x6A],	%o6
	fmul8sux16	%f18,	%f22,	%f30
	fnand	%f22,	%f14,	%f4
	edge32ln	%g1,	%i4,	%i2
	add	%i1,	%o7,	%l2
	fmovrsgez	%i3,	%f23,	%f14
	fxor	%f8,	%f16,	%f8
	fsrc2s	%f24,	%f10
	mulx	%i7,	%l3,	%o1
	srl	%l6,	%o0,	%o2
	sdivx	%g7,	0x0D58,	%o5
	bshuffle	%f0,	%f30,	%f4
	array32	%g3,	%g4,	%i5
	ldub	[%l7 + 0x44],	%l5
	ldub	[%l7 + 0x1B],	%i6
	edge16	%g2,	%o4,	%l1
	movvs	%xcc,	%o3,	%i0
	fmovsn	%icc,	%f23,	%f27
	fmovrse	%g5,	%f16,	%f2
	fmovsne	%xcc,	%f23,	%f20
	fmovse	%xcc,	%f7,	%f26
	nop
	set	0x53, %i3
	stb	%g6,	[%l7 + %i3]
	xorcc	%l0,	0x17AA,	%o6
	edge32ln	%l4,	%i4,	%i2
	subccc	%g1,	%i1,	%l2
	orncc	%i3,	%i7,	%l3
	movl	%icc,	%o7,	%o1
	movvs	%icc,	%o0,	%o2
	sll	%g7,	%l6,	%o5
	udivcc	%g4,	0x09A9,	%i5
	sethi	0x1E41,	%g3
	edge8n	%i6,	%g2,	%o4
	umulcc	%l5,	0x0DD6,	%l1
	xnorcc	%i0,	%g5,	%g6
	edge8l	%l0,	%o6,	%o3
	fmovda	%xcc,	%f27,	%f2
	stb	%i4,	[%l7 + 0x6F]
	movneg	%icc,	%i2,	%g1
	edge8ln	%i1,	%l2,	%i3
	fmovdl	%xcc,	%f28,	%f11
	srlx	%l4,	0x0E,	%i7
	fandnot1s	%f29,	%f7,	%f9
	xnorcc	%l3,	%o1,	%o0
	fone	%f24
	udiv	%o2,	0x0FD6,	%g7
	edge32	%l6,	%o5,	%g4
	ldsh	[%l7 + 0x68],	%o7
	fmovsvc	%icc,	%f2,	%f22
	fcmpne32	%f6,	%f28,	%i5
	andncc	%i6,	%g3,	%g2
	xor	%l5,	%o4,	%l1
	movl	%xcc,	%i0,	%g6
	fmovrde	%g5,	%f8,	%f22
	edge8l	%l0,	%o6,	%i4
	sir	0x13AC
	addccc	%o3,	0x11E1,	%g1
	movcc	%xcc,	%i1,	%i2
	movn	%xcc,	%i3,	%l4
	edge32ln	%l2,	%i7,	%l3
	fcmple32	%f16,	%f10,	%o0
	mulx	%o2,	0x10EC,	%g7
	fand	%f18,	%f18,	%f0
	addccc	%l6,	%o5,	%g4
	xor	%o1,	0x0E35,	%i5
	edge8l	%i6,	%g3,	%g2
	stb	%o7,	[%l7 + 0x3C]
	udivcc	%o4,	0x1845,	%l5
	fpadd32	%f14,	%f20,	%f0
	addcc	%l1,	0x1E28,	%g6
	ldsb	[%l7 + 0x23],	%i0
	addccc	%g5,	0x1EE5,	%l0
	edge16l	%o6,	%o3,	%i4
	fmovdvs	%icc,	%f29,	%f27
	fxnor	%f28,	%f26,	%f18
	fmovscc	%xcc,	%f31,	%f1
	movg	%icc,	%i1,	%g1
	fcmple32	%f14,	%f2,	%i3
	movre	%i2,	0x067,	%l2
	stw	%i7,	[%l7 + 0x7C]
	fcmped	%fcc2,	%f10,	%f28
	fnegd	%f6,	%f16
	edge8ln	%l4,	%l3,	%o0
	stb	%o2,	[%l7 + 0x35]
	fmovspos	%icc,	%f1,	%f18
	fmovsa	%icc,	%f24,	%f0
	stx	%l6,	[%l7 + 0x40]
	movvs	%xcc,	%o5,	%g7
	movrgez	%g4,	%i5,	%o1
	xor	%g3,	0x1312,	%g2
	fmovsneg	%icc,	%f5,	%f18
	sra	%o7,	%i6,	%l5
	st	%f9,	[%l7 + 0x38]
	xor	%o4,	%l1,	%i0
	udivx	%g6,	0x0BC9,	%g5
	movne	%xcc,	%o6,	%l0
	and	%o3,	%i1,	%g1
	movne	%icc,	%i3,	%i2
	alignaddr	%i4,	%i7,	%l2
	subcc	%l3,	%o0,	%o2
	addccc	%l4,	%o5,	%l6
	ldd	[%l7 + 0x30],	%g4
	fpadd16	%f16,	%f10,	%f10
	edge8ln	%i5,	%o1,	%g7
	fcmpgt32	%f6,	%f4,	%g2
	andncc	%g3,	%i6,	%l5
	fmovrdgez	%o7,	%f28,	%f6
	edge8	%l1,	%o4,	%i0
	mova	%icc,	%g6,	%g5
	array8	%o6,	%o3,	%l0
	fmovse	%icc,	%f6,	%f11
	movvc	%xcc,	%g1,	%i1
	fmovrdne	%i3,	%f12,	%f8
	xor	%i4,	%i2,	%l2
	alignaddr	%l3,	%o0,	%i7
	ldd	[%l7 + 0x18],	%f16
	sdivx	%o2,	0x0FDA,	%l4
	add	%l6,	0x192C,	%g4
	movneg	%icc,	%o5,	%i5
	sir	0x1879
	bshuffle	%f2,	%f4,	%f2
	movl	%xcc,	%g7,	%g2
	udiv	%o1,	0x048C,	%i6
	movge	%icc,	%g3,	%o7
	movge	%xcc,	%l1,	%o4
	edge16l	%l5,	%i0,	%g6
	movcs	%icc,	%g5,	%o6
	fornot1	%f0,	%f4,	%f8
	ldsb	[%l7 + 0x14],	%l0
	addccc	%g1,	0x0853,	%i1
	umul	%o3,	%i3,	%i4
	mulscc	%l2,	0x06CD,	%i2
	fpsub32	%f26,	%f16,	%f12
	sub	%l3,	0x0463,	%i7
	orncc	%o2,	%o0,	%l4
	srlx	%g4,	%l6,	%o5
	fmul8x16	%f10,	%f2,	%f12
	movrgez	%g7,	0x361,	%i5
	movle	%xcc,	%o1,	%i6
	umulcc	%g2,	%g3,	%l1
	srl	%o4,	%l5,	%i0
	xnorcc	%o7,	0x1BAF,	%g6
	ldsb	[%l7 + 0x3A],	%g5
	edge32ln	%o6,	%g1,	%i1
	orcc	%o3,	0x13A3,	%i3
	ldd	[%l7 + 0x20],	%l0
	edge8n	%i4,	%i2,	%l2
	edge16ln	%l3,	%i7,	%o0
	edge16	%l4,	%g4,	%o2
	add	%l6,	%g7,	%o5
	movrgz	%o1,	%i5,	%g2
	andcc	%i6,	%g3,	%l1
	ld	[%l7 + 0x08],	%f18
	alignaddr	%o4,	%i0,	%l5
	edge16	%o7,	%g6,	%g5
	sllx	%g1,	%o6,	%o3
	xor	%i3,	0x0800,	%i1
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	movge	%icc,	%l3,	%l2
	fmovrslz	%o0,	%f14,	%f26
	array16	%l4,	%i7,	%o2
	ld	[%l7 + 0x34],	%f23
	ldsb	[%l7 + 0x16],	%g4
	srax	%l6,	%g7,	%o1
	orncc	%o5,	0x0A72,	%g2
	fpsub32	%f20,	%f18,	%f16
	fmovsl	%xcc,	%f5,	%f7
	xor	%i5,	0x1BD7,	%g3
	movge	%icc,	%l1,	%i6
	array16	%o4,	%i0,	%o7
	ldd	[%l7 + 0x78],	%l4
	edge8l	%g6,	%g1,	%g5
	fzeros	%f19
	udivx	%o3,	0x194A,	%o6
	edge8l	%i3,	%i1,	%l0
	fsrc1s	%f26,	%f27
	movcc	%xcc,	%i2,	%l3
	fmovrdgez	%i4,	%f6,	%f28
	movge	%xcc,	%o0,	%l2
	fmul8x16au	%f20,	%f9,	%f26
	xorcc	%i7,	0x1FF5,	%o2
	fmovse	%icc,	%f7,	%f10
	movneg	%icc,	%g4,	%l6
	edge8n	%g7,	%o1,	%l4
	udivx	%g2,	0x18CC,	%o5
	edge32ln	%i5,	%l1,	%g3
	or	%i6,	%o4,	%o7
	fnegd	%f24,	%f14
	sethi	0x11C8,	%i0
	move	%xcc,	%g6,	%g1
	fands	%f4,	%f7,	%f10
	ldub	[%l7 + 0x66],	%l5
	xorcc	%g5,	0x016F,	%o3
	lduh	[%l7 + 0x32],	%i3
	ldd	[%l7 + 0x18],	%o6
	udiv	%l0,	0x17EA,	%i2
	edge16l	%l3,	%i4,	%o0
	orcc	%l2,	0x153F,	%i7
	movrgez	%i1,	%o2,	%g4
	sllx	%l6,	0x0B,	%g7
	stx	%o1,	[%l7 + 0x78]
	fmovrslez	%l4,	%f23,	%f18
	fmuld8ulx16	%f25,	%f0,	%f12
	movre	%g2,	%o5,	%l1
	move	%xcc,	%i5,	%i6
	fmovdge	%icc,	%f29,	%f13
	movrlz	%o4,	0x3B1,	%o7
	and	%g3,	%i0,	%g1
	movrlz	%g6,	0x118,	%l5
	subcc	%g5,	0x1F3F,	%i3
	st	%f7,	[%l7 + 0x24]
	movre	%o3,	0x2FF,	%o6
	pdist	%f20,	%f14,	%f22
	stx	%l0,	[%l7 + 0x10]
	andncc	%l3,	%i4,	%o0
	fzeros	%f26
	subc	%l2,	0x1885,	%i7
	fmovdvs	%icc,	%f9,	%f11
	sra	%i1,	%o2,	%g4
	fexpand	%f22,	%f16
	addcc	%i2,	%l6,	%g7
	fpsub32	%f22,	%f24,	%f20
	alignaddr	%l4,	%g2,	%o5
	sir	0x113B
	movle	%xcc,	%o1,	%i5
	umulcc	%i6,	%o4,	%l1
	addccc	%o7,	%g3,	%i0
	sra	%g6,	0x01,	%l5
	subc	%g1,	0x11AD,	%g5
	edge32n	%o3,	%o6,	%i3
	fors	%f27,	%f22,	%f30
	array8	%l3,	%i4,	%o0
	movrgz	%l0,	%i7,	%i1
	array16	%o2,	%l2,	%g4
	movrgz	%i2,	%g7,	%l6
	udivcc	%l4,	0x0787,	%g2
	srl	%o1,	0x01,	%i5
	ldd	[%l7 + 0x60],	%i6
	ldsw	[%l7 + 0x64],	%o4
	fmovdle	%xcc,	%f10,	%f13
	fmovdne	%xcc,	%f11,	%f20
	save %l1, %o5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%i0,	%g3
	movleu	%xcc,	%g6,	%l5
	lduh	[%l7 + 0x18],	%g1
	array8	%g5,	%o3,	%i3
	sth	%o6,	[%l7 + 0x7A]
	edge16ln	%l3,	%i4,	%l0
	popc	%i7,	%i1
	movne	%icc,	%o0,	%l2
	alignaddr	%o2,	%i2,	%g7
	edge8ln	%g4,	%l4,	%l6
	fpmerge	%f24,	%f22,	%f10
	subccc	%g2,	%o1,	%i6
	nop
	set	0x43, %l1
	ldsb	[%l7 + %l1],	%i5
	andcc	%o4,	0x1B66,	%l1
	udivcc	%o5,	0x0701,	%o7
	fpadd16s	%f27,	%f4,	%f12
	fmovsvs	%xcc,	%f19,	%f8
	fcmps	%fcc2,	%f13,	%f16
	orncc	%g3,	%i0,	%g6
	pdist	%f20,	%f24,	%f22
	movre	%l5,	0x35B,	%g1
	fcmple32	%f2,	%f0,	%g5
	fcmped	%fcc3,	%f8,	%f0
	fzero	%f10
	and	%i3,	0x08C9,	%o6
	ldd	[%l7 + 0x48],	%f18
	movcc	%xcc,	%o3,	%l3
	addc	%l0,	%i4,	%i7
	andcc	%i1,	%l2,	%o2
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%i2
	udivx	%g7,	0x1968,	%g4
	movrlz	%o0,	%l4,	%l6
	fpsub32s	%f22,	%f20,	%f4
	fornot2s	%f9,	%f24,	%f7
	sdivcc	%g2,	0x0F39,	%i6
	sdiv	%i5,	0x1621,	%o1
	ldd	[%l7 + 0x60],	%f8
	array8	%l1,	%o4,	%o5
	orcc	%g3,	0x028E,	%o7
	bshuffle	%f4,	%f10,	%f20
	stx	%i0,	[%l7 + 0x18]
	movvc	%xcc,	%l5,	%g6
	nop
	set	0x73, %l6
	stb	%g5,	[%l7 + %l6]
	sethi	0x1A7A,	%i3
	movcs	%xcc,	%o6,	%o3
	sth	%l3,	[%l7 + 0x4C]
	alignaddrl	%g1,	%i4,	%i7
	ldd	[%l7 + 0x78],	%f24
	movleu	%xcc,	%i1,	%l2
	edge16	%l0,	%o2,	%i2
	fornot2	%f6,	%f16,	%f20
	fzero	%f16
	ldsh	[%l7 + 0x46],	%g7
	lduw	[%l7 + 0x14],	%g4
	movl	%xcc,	%l4,	%o0
	lduh	[%l7 + 0x3C],	%g2
	restore %i6, 0x153D, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o1,	0x00E1,	%l1
	fmovse	%icc,	%f24,	%f9
	stb	%i5,	[%l7 + 0x1F]
	mulscc	%o5,	0x0FD3,	%g3
	ldsh	[%l7 + 0x36],	%o4
	fmovrslez	%i0,	%f31,	%f23
	movcc	%xcc,	%l5,	%g6
	sdivcc	%o7,	0x10F5,	%g5
	ldsw	[%l7 + 0x4C],	%o6
	ldsb	[%l7 + 0x38],	%o3
	movg	%xcc,	%l3,	%g1
	sdiv	%i4,	0x1EBE,	%i7
	orn	%i3,	0x1728,	%i1
	andncc	%l0,	%o2,	%l2
	edge8ln	%g7,	%i2,	%g4
	movn	%xcc,	%l4,	%g2
	fxors	%f7,	%f12,	%f24
	fpsub16s	%f12,	%f25,	%f17
	edge16l	%i6,	%l6,	%o0
	sllx	%o1,	0x08,	%i5
	and	%o5,	0x0053,	%l1
	ldsh	[%l7 + 0x66],	%g3
	edge32	%o4,	%i0,	%g6
	andn	%l5,	%g5,	%o7
	stw	%o3,	[%l7 + 0x20]
	array16	%l3,	%o6,	%g1
	edge32ln	%i7,	%i3,	%i1
	orn	%l0,	0x16FD,	%i4
	fmovdgu	%icc,	%f12,	%f4
	fnor	%f8,	%f6,	%f22
	sth	%o2,	[%l7 + 0x1C]
	fmovrsne	%l2,	%f12,	%f13
	fmovde	%xcc,	%f17,	%f12
	sll	%g7,	%i2,	%l4
	sll	%g2,	%i6,	%g4
	fxnors	%f3,	%f3,	%f8
	fxors	%f7,	%f7,	%f28
	alignaddr	%l6,	%o0,	%i5
	movge	%icc,	%o5,	%o1
	ldsh	[%l7 + 0x16],	%l1
	edge8ln	%g3,	%o4,	%i0
	sll	%l5,	0x08,	%g6
	ld	[%l7 + 0x58],	%f26
	addcc	%o7,	%g5,	%l3
	popc	0x1D84,	%o6
	std	%f4,	[%l7 + 0x28]
	movg	%xcc,	%g1,	%i7
	smul	%o3,	0x1B71,	%i1
	add	%i3,	%i4,	%l0
	ld	[%l7 + 0x08],	%f20
	movrne	%l2,	%o2,	%g7
	movgu	%icc,	%l4,	%g2
	fmovdpos	%xcc,	%f11,	%f13
	save %i2, %i6, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o0,	%l6
	movcc	%icc,	%i5,	%o1
	fandnot2s	%f20,	%f10,	%f27
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	orncc	%i0,	0x17AA,	%o4
	ldd	[%l7 + 0x30],	%l4
	udiv	%g6,	0x17D7,	%o7
	andncc	%g5,	%l3,	%g1
	movleu	%xcc,	%i7,	%o6
	movle	%icc,	%i1,	%i3
	st	%f0,	[%l7 + 0x0C]
	xnorcc	%o3,	0x0572,	%l0
	array8	%i4,	%o2,	%l2
	movn	%icc,	%l4,	%g7
	edge32ln	%g2,	%i6,	%g4
	alignaddrl	%o0,	%l6,	%i2
	movrgz	%o1,	%i5,	%g3
	move	%xcc,	%o5,	%l1
	ld	[%l7 + 0x0C],	%f4
	fmovsg	%xcc,	%f18,	%f13
	edge32n	%o4,	%i0,	%l5
	sllx	%g6,	0x06,	%g5
	srax	%o7,	0x06,	%g1
	smul	%i7,	0x1B49,	%l3
	xor	%i1,	0x1C5A,	%o6
	fmovsvs	%icc,	%f27,	%f26
	fmovspos	%icc,	%f2,	%f9
	udivcc	%i3,	0x09FE,	%l0
	xorcc	%o3,	%i4,	%l2
	umul	%l4,	0x18F6,	%o2
	movneg	%xcc,	%g2,	%i6
	movneg	%icc,	%g7,	%o0
	srlx	%l6,	0x0B,	%g4
	stw	%o1,	[%l7 + 0x70]
	fors	%f11,	%f22,	%f17
	ldub	[%l7 + 0x47],	%i5
	fcmple32	%f22,	%f24,	%g3
	sir	0x0F5B
	edge8l	%o5,	%i2,	%o4
	umul	%l1,	%l5,	%i0
	movle	%xcc,	%g5,	%o7
	fcmpeq32	%f20,	%f20,	%g1
	srax	%i7,	0x13,	%l3
	edge16n	%g6,	%o6,	%i1
	addcc	%l0,	0x05A5,	%i3
	subccc	%i4,	%o3,	%l4
	ld	[%l7 + 0x3C],	%f9
	fmovdvs	%xcc,	%f8,	%f15
	subccc	%l2,	0x01BD,	%g2
	fmovscc	%xcc,	%f27,	%f30
	smul	%o2,	0x1910,	%g7
	fsrc2s	%f29,	%f30
	edge8ln	%o0,	%l6,	%i6
	add	%o1,	%i5,	%g4
	srlx	%g3,	0x10,	%o5
	movrgez	%o4,	%i2,	%l1
	edge8ln	%l5,	%i0,	%g5
	movvc	%xcc,	%o7,	%i7
	movl	%icc,	%g1,	%g6
	fmovse	%icc,	%f27,	%f5
	st	%f24,	[%l7 + 0x1C]
	restore %o6, %l3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f12,	%f31
	fcmped	%fcc3,	%f28,	%f8
	fmovrslez	%i3,	%f17,	%f29
	andcc	%i4,	%o3,	%i1
	addc	%l4,	0x0EC8,	%l2
	stx	%g2,	[%l7 + 0x58]
	orcc	%o2,	%o0,	%g7
	umul	%l6,	0x197B,	%i6
	movl	%xcc,	%o1,	%g4
	st	%f0,	[%l7 + 0x44]
	lduh	[%l7 + 0x7E],	%i5
	lduh	[%l7 + 0x7A],	%g3
	fxors	%f24,	%f27,	%f29
	edge8ln	%o4,	%i2,	%o5
	edge8ln	%l5,	%l1,	%g5
	andncc	%i0,	%o7,	%g1
	srl	%i7,	0x08,	%o6
	std	%f4,	[%l7 + 0x68]
	udiv	%g6,	0x04A2,	%l0
	edge16ln	%l3,	%i3,	%o3
	addcc	%i4,	0x07EA,	%l4
	orcc	%l2,	%i1,	%o2
	sdiv	%g2,	0x0E5B,	%o0
	umulcc	%l6,	0x183B,	%g7
	edge16	%i6,	%o1,	%g4
	fmul8x16au	%f1,	%f30,	%f14
	sub	%g3,	0x199C,	%i5
	array8	%o4,	%i2,	%o5
	udivcc	%l1,	0x1BA7,	%g5
	sth	%i0,	[%l7 + 0x14]
	ldsh	[%l7 + 0x42],	%o7
	srlx	%l5,	%g1,	%o6
	add	%i7,	%l0,	%l3
	fmovde	%icc,	%f0,	%f16
	fabsd	%f2,	%f20
	edge16	%g6,	%i3,	%o3
	edge16	%l4,	%i4,	%l2
	edge16	%i1,	%o2,	%g2
	addc	%o0,	%l6,	%g7
	fnot2s	%f14,	%f22
	ldsh	[%l7 + 0x3C],	%o1
	or	%i6,	%g4,	%i5
	ldub	[%l7 + 0x2E],	%g3
	fandnot1s	%f12,	%f7,	%f23
	edge32ln	%o4,	%o5,	%i2
	edge32	%l1,	%g5,	%o7
	alignaddrl	%i0,	%g1,	%l5
	alignaddr	%i7,	%l0,	%l3
	movrlz	%o6,	%i3,	%o3
	addcc	%l4,	%g6,	%i4
	array32	%l2,	%i1,	%o2
	xor	%o0,	0x12EE,	%l6
	movle	%xcc,	%g2,	%g7
	mulscc	%i6,	0x166A,	%g4
	array8	%o1,	%i5,	%o4
	movre	%o5,	0x395,	%g3
	movne	%icc,	%i2,	%g5
	fmovdne	%icc,	%f30,	%f14
	umulcc	%l1,	%o7,	%g1
	orn	%l5,	%i7,	%l0
	xnorcc	%l3,	%i0,	%o6
	edge32ln	%i3,	%l4,	%o3
	movg	%icc,	%g6,	%l2
	edge8n	%i4,	%o2,	%o0
	sdivcc	%l6,	0x026E,	%g2
	edge32ln	%i1,	%i6,	%g4
	ldx	[%l7 + 0x08],	%o1
	edge32ln	%g7,	%o4,	%i5
	movge	%icc,	%g3,	%o5
	edge16l	%g5,	%l1,	%i2
	fnand	%f16,	%f2,	%f18
	fsrc1	%f0,	%f22
	xnor	%g1,	%o7,	%i7
	fmul8x16au	%f21,	%f17,	%f22
	subc	%l0,	%l3,	%l5
	sub	%o6,	0x0452,	%i0
	fmovspos	%xcc,	%f4,	%f11
	fcmpes	%fcc1,	%f24,	%f19
	srlx	%i3,	%o3,	%g6
	subc	%l4,	%l2,	%i4
	fmovspos	%icc,	%f6,	%f16
	ldsw	[%l7 + 0x08],	%o2
	edge16l	%o0,	%l6,	%i1
	save %i6, %g2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%g7,	%o1
	edge8ln	%i5,	%g3,	%o5
	edge16ln	%o4,	%g5,	%i2
	orn	%l1,	%o7,	%i7
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	fmovrdgz	%o6,	%f20,	%f16
	subc	%i0,	0x1F46,	%i3
	edge32l	%l0,	%o3,	%l4
	alignaddrl	%l2,	%i4,	%o2
	addc	%o0,	%l6,	%i1
	subcc	%i6,	0x1656,	%g6
	andcc	%g4,	%g7,	%o1
	srl	%i5,	%g2,	%o5
	xnorcc	%g3,	%o4,	%i2
	movrlz	%g5,	%l1,	%o7
	mulx	%i7,	0x197B,	%l3
	save %l5, %g1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%i3,	%f6,	%f22
	fmovsvc	%icc,	%f3,	%f0
	movg	%xcc,	%i0,	%l0
	srax	%o3,	%l4,	%i4
	fmovdcs	%xcc,	%f29,	%f29
	fmuld8sux16	%f0,	%f16,	%f14
	mulscc	%l2,	%o2,	%o0
	xorcc	%i1,	%l6,	%i6
	edge32l	%g4,	%g6,	%o1
	save %i5, 0x0594, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %o5, %g2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o4,	[%l7 + 0x24]
	fnegs	%f24,	%f6
	movrlez	%g5,	%i2,	%o7
	fmovda	%icc,	%f9,	%f30
	xnorcc	%i7,	0x0DB8,	%l1
	mulx	%l5,	%l3,	%g1
	siam	0x6
	subccc	%i3,	0x0778,	%i0
	xnor	%o6,	0x1522,	%o3
	edge32	%l0,	%i4,	%l2
	movrlz	%o2,	%o0,	%i1
	fmovs	%f7,	%f25
	ldd	[%l7 + 0x60],	%f18
	fone	%f28
	subccc	%l4,	%l6,	%g4
	st	%f9,	[%l7 + 0x64]
	movrne	%i6,	0x375,	%g6
	alignaddrl	%i5,	%o1,	%o5
	fmovsle	%xcc,	%f8,	%f3
	st	%f14,	[%l7 + 0x3C]
	and	%g2,	0x0B97,	%g7
	movle	%xcc,	%o4,	%g5
	srlx	%g3,	0x13,	%i2
	lduh	[%l7 + 0x60],	%o7
	fpack32	%f12,	%f10,	%f6
	edge32	%i7,	%l5,	%l1
	movcs	%xcc,	%l3,	%i3
	fmovdleu	%icc,	%f2,	%f19
	mulscc	%g1,	0x169F,	%i0
	fandnot2	%f0,	%f2,	%f30
	edge16	%o6,	%l0,	%i4
	subc	%o3,	0x0C43,	%o2
	movg	%xcc,	%o0,	%l2
	sll	%l4,	%i1,	%l6
	andcc	%g4,	0x14AE,	%g6
	srlx	%i5,	%i6,	%o1
	movcc	%xcc,	%g2,	%o5
	movvc	%icc,	%g7,	%g5
	sethi	0x164C,	%g3
	movrne	%i2,	%o7,	%i7
	orncc	%l5,	%o4,	%l1
	sth	%i3,	[%l7 + 0x0A]
	fmovs	%f8,	%f24
	stw	%g1,	[%l7 + 0x20]
	alignaddr	%l3,	%o6,	%i0
	sir	0x0BF3
	srax	%i4,	%l0,	%o3
	fcmple16	%f14,	%f0,	%o0
	movre	%l2,	%o2,	%l4
	edge8	%l6,	%i1,	%g6
	sra	%g4,	0x00,	%i5
	nop
	set	0x08, %g4
	ldx	[%l7 + %g4],	%o1
	edge8	%i6,	%g2,	%o5
	movre	%g5,	%g3,	%g7
	lduh	[%l7 + 0x0C],	%o7
	orncc	%i7,	0x0C9A,	%i2
	ldsw	[%l7 + 0x40],	%o4
	movleu	%icc,	%l1,	%l5
	fmovdleu	%xcc,	%f9,	%f11
	movcc	%icc,	%i3,	%l3
	fone	%f28
	addccc	%g1,	0x041A,	%i0
	subcc	%o6,	0x1B51,	%l0
	lduw	[%l7 + 0x30],	%i4
	ldd	[%l7 + 0x70],	%o2
	fxor	%f0,	%f22,	%f10
	ld	[%l7 + 0x64],	%f0
	edge8	%o0,	%l2,	%l4
	sth	%o2,	[%l7 + 0x20]
	fors	%f15,	%f31,	%f16
	fmovdle	%icc,	%f13,	%f18
	fmovdl	%xcc,	%f9,	%f11
	udivx	%l6,	0x1429,	%g6
	fmul8ulx16	%f14,	%f28,	%f2
	sdiv	%i1,	0x19AD,	%i5
	xorcc	%o1,	0x1ACB,	%i6
	fcmple32	%f6,	%f0,	%g4
	edge8ln	%o5,	%g2,	%g5
	movrlez	%g3,	%o7,	%g7
	stb	%i7,	[%l7 + 0x46]
	fmovdleu	%xcc,	%f15,	%f3
	movcs	%xcc,	%o4,	%i2
	movcc	%icc,	%l5,	%l1
	movne	%xcc,	%i3,	%g1
	edge8n	%i0,	%o6,	%l3
	movre	%l0,	0x1A2,	%i4
	xnor	%o0,	0x1DDE,	%l2
	or	%o3,	0x09B6,	%l4
	srl	%l6,	0x16,	%g6
	fmovrsgz	%i1,	%f0,	%f3
	umul	%i5,	0x0C30,	%o1
	fmovsvc	%xcc,	%f17,	%f11
	ldd	[%l7 + 0x38],	%i6
	umulcc	%o2,	%o5,	%g4
	fornot1	%f18,	%f6,	%f16
	nop
	set	0x4C, %l0
	ldsw	[%l7 + %l0],	%g5
	sub	%g3,	0x1FD7,	%o7
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	alignaddrl	%g2,	%i2,	%o4
	udivx	%l5,	0x13E0,	%i3
	fmovs	%f6,	%f17
	movg	%xcc,	%g1,	%i0
	fpsub32	%f22,	%f18,	%f28
	fmovdn	%xcc,	%f9,	%f22
	fmovrslz	%l1,	%f23,	%f16
	addccc	%o6,	%l3,	%i4
	movge	%icc,	%o0,	%l0
	popc	0x05AE,	%o3
	sdiv	%l4,	0x134A,	%l6
	fmovrslz	%g6,	%f15,	%f4
	addccc	%i1,	%l2,	%i5
	st	%f5,	[%l7 + 0x0C]
	fpack16	%f14,	%f3
	mulx	%i6,	%o2,	%o5
	umulcc	%o1,	%g5,	%g4
	andcc	%o7,	%g3,	%i7
	ldx	[%l7 + 0x78],	%g7
	edge32n	%i2,	%g2,	%l5
	fcmple32	%f18,	%f4,	%i3
	smulcc	%o4,	%g1,	%i0
	udivcc	%l1,	0x08E8,	%l3
	std	%f24,	[%l7 + 0x18]
	andn	%i4,	0x0EE6,	%o0
	fmovdg	%xcc,	%f12,	%f25
	save %o6, %l0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l4,	%l6,	%g6
	nop
	set	0x40, %i6
	stx	%l2,	[%l7 + %i6]
	fmovsn	%icc,	%f30,	%f25
	sdivcc	%i5,	0x029C,	%i1
	edge32n	%i6,	%o2,	%o5
	fsrc1s	%f23,	%f26
	fcmpes	%fcc1,	%f0,	%f12
	fmovrsgez	%g5,	%f19,	%f16
	fmovsne	%icc,	%f14,	%f11
	mulscc	%o1,	%o7,	%g4
	edge8ln	%i7,	%g7,	%g3
	addcc	%g2,	%i2,	%l5
	ldsw	[%l7 + 0x68],	%i3
	popc	0x102A,	%o4
	fpadd32s	%f20,	%f19,	%f29
	mulx	%i0,	0x1D43,	%l1
	smul	%l3,	%g1,	%o0
	subc	%o6,	0x0812,	%i4
	movleu	%xcc,	%o3,	%l4
	movpos	%xcc,	%l0,	%g6
	umul	%l2,	0x1D29,	%l6
	ldd	[%l7 + 0x18],	%i0
	addcc	%i5,	%o2,	%o5
	and	%i6,	%g5,	%o7
	subcc	%o1,	%i7,	%g7
	movcs	%xcc,	%g4,	%g3
	umul	%i2,	%l5,	%i3
	ldd	[%l7 + 0x20],	%f18
	fnand	%f16,	%f12,	%f10
	sth	%g2,	[%l7 + 0x7A]
	stw	%i0,	[%l7 + 0x30]
	udivx	%o4,	0x1641,	%l1
	movle	%icc,	%g1,	%o0
	movrgz	%l3,	0x364,	%i4
	lduw	[%l7 + 0x7C],	%o3
	edge32n	%o6,	%l4,	%l0
	std	%f30,	[%l7 + 0x28]
	edge8n	%g6,	%l2,	%i1
	alignaddrl	%l6,	%o2,	%i5
	fcmpes	%fcc2,	%f31,	%f31
	array16	%o5,	%g5,	%i6
	fpadd16s	%f13,	%f28,	%f21
	fmovdg	%icc,	%f5,	%f14
	ldd	[%l7 + 0x30],	%o6
	movrgez	%o1,	0x088,	%i7
	fmovdneg	%xcc,	%f3,	%f16
	ldsb	[%l7 + 0x4B],	%g4
	ldsh	[%l7 + 0x34],	%g3
	addc	%i2,	%g7,	%l5
	fmovrsgz	%g2,	%f10,	%f25
	xnorcc	%i3,	%i0,	%l1
	fmovse	%icc,	%f17,	%f2
	fmovdpos	%xcc,	%f2,	%f6
	xorcc	%o4,	0x04E9,	%g1
	movneg	%xcc,	%o0,	%i4
	umul	%l3,	%o6,	%o3
	edge32	%l4,	%l0,	%g6
	stb	%i1,	[%l7 + 0x2F]
	srax	%l6,	0x09,	%o2
	nop
	set	0x58, %g2
	ldsb	[%l7 + %g2],	%l2
	smulcc	%i5,	%g5,	%i6
	movleu	%xcc,	%o7,	%o1
	fmul8sux16	%f22,	%f4,	%f4
	addcc	%o5,	%i7,	%g3
	sdivx	%g4,	0x18F7,	%g7
	edge16ln	%l5,	%g2,	%i3
	ldx	[%l7 + 0x28],	%i0
	fmul8x16au	%f17,	%f12,	%f24
	movl	%xcc,	%i2,	%l1
	add	%g1,	0x00A8,	%o4
	edge16ln	%i4,	%o0,	%o6
	edge16l	%o3,	%l3,	%l0
	udiv	%l4,	0x0595,	%i1
	stb	%l6,	[%l7 + 0x0B]
	umul	%g6,	%o2,	%i5
	fmovrse	%g5,	%f0,	%f11
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%l2
	edge16l	%i6,	%o7,	%o1
	ldd	[%l7 + 0x40],	%f12
	stw	%i7,	[%l7 + 0x70]
	edge16n	%o5,	%g3,	%g7
	movneg	%icc,	%l5,	%g2
	ldd	[%l7 + 0x38],	%f22
	movn	%xcc,	%g4,	%i3
	array8	%i2,	%l1,	%g1
	srax	%o4,	%i4,	%i0
	fmovrde	%o0,	%f26,	%f30
	movpos	%icc,	%o6,	%l3
	movcs	%xcc,	%l0,	%o3
	xor	%l4,	0x01B5,	%l6
	movgu	%icc,	%i1,	%o2
	movvs	%xcc,	%g6,	%g5
	move	%xcc,	%l2,	%i6
	or	%o7,	0x1C42,	%i5
	mova	%icc,	%i7,	%o1
	restore %o5, %g7, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g2,	%g4,	%l5
	edge16	%i3,	%l1,	%i2
	sdivcc	%o4,	0x03DA,	%g1
	alignaddr	%i4,	%o0,	%o6
	and	%i0,	%l3,	%o3
	lduw	[%l7 + 0x58],	%l0
	stw	%l6,	[%l7 + 0x78]
	ldd	[%l7 + 0x40],	%f14
	andn	%l4,	%o2,	%g6
	sub	%g5,	0x0D0B,	%l2
	fandnot1s	%f9,	%f12,	%f18
	fpack16	%f26,	%f22
	movrne	%i6,	0x22B,	%o7
	alignaddrl	%i1,	%i5,	%i7
	fmovsge	%icc,	%f17,	%f3
	movvc	%icc,	%o5,	%g7
	movvs	%xcc,	%g3,	%g2
	sra	%o1,	%l5,	%g4
	fabss	%f5,	%f20
	andncc	%l1,	%i3,	%i2
	fzero	%f12
	fmovrsgz	%o4,	%f18,	%f23
	movcc	%icc,	%i4,	%o0
	fpmerge	%f4,	%f3,	%f4
	movvc	%xcc,	%o6,	%g1
	nop
	set	0x38, %g6
	std	%f24,	[%l7 + %g6]
	fmovda	%xcc,	%f24,	%f21
	edge8	%i0,	%o3,	%l3
	fmovdle	%icc,	%f25,	%f11
	add	%l0,	0x07D0,	%l6
	save %o2, %l4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l2,	%i6,	%g6
	alignaddr	%o7,	%i1,	%i7
	fxors	%f1,	%f4,	%f14
	xor	%o5,	0x0C10,	%i5
	fcmpeq32	%f22,	%f10,	%g7
	save %g2, 0x043F, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f14,	%f6,	%f18
	array8	%l5,	%o1,	%l1
	movgu	%icc,	%i3,	%g4
	lduw	[%l7 + 0x20],	%o4
	mulscc	%i4,	0x1731,	%i2
	andcc	%o0,	0x0FD1,	%g1
	fmovdle	%icc,	%f13,	%f23
	edge8n	%o6,	%o3,	%i0
	srl	%l0,	%l3,	%o2
	movl	%xcc,	%l4,	%g5
	fmovsl	%xcc,	%f26,	%f21
	orn	%l2,	%l6,	%g6
	sllx	%o7,	0x11,	%i1
	fabss	%f2,	%f28
	fmul8sux16	%f18,	%f12,	%f16
	fcmpne16	%f26,	%f12,	%i7
	fmovsl	%icc,	%f14,	%f7
	xnorcc	%o5,	0x097E,	%i5
	sub	%g7,	0x0FE5,	%g2
	edge8n	%i6,	%g3,	%l5
	movgu	%icc,	%o1,	%l1
	ldsb	[%l7 + 0x0F],	%g4
	add	%o4,	%i3,	%i4
	edge32l	%o0,	%g1,	%o6
	movvc	%icc,	%i2,	%o3
	movrgz	%l0,	%i0,	%o2
	and	%l3,	0x0643,	%g5
	orn	%l2,	0x1959,	%l4
	fornot2	%f4,	%f18,	%f22
	alignaddrl	%l6,	%o7,	%i1
	xnor	%g6,	0x0FA6,	%i7
	ldsh	[%l7 + 0x52],	%i5
	fornot1	%f12,	%f4,	%f30
	addcc	%g7,	0x1FB4,	%g2
	udivx	%o5,	0x0B15,	%i6
	st	%f25,	[%l7 + 0x14]
	movre	%g3,	%o1,	%l1
	alignaddr	%l5,	%g4,	%o4
	fnors	%f7,	%f21,	%f21
	fmovsge	%icc,	%f11,	%f7
	andncc	%i3,	%o0,	%i4
	xorcc	%o6,	0x0A18,	%g1
	subcc	%i2,	0x08BC,	%l0
	stx	%i0,	[%l7 + 0x38]
	movgu	%xcc,	%o3,	%o2
	popc	0x152A,	%g5
	and	%l3,	0x15DA,	%l2
	st	%f25,	[%l7 + 0x50]
	xnorcc	%l6,	%l4,	%i1
	movcc	%xcc,	%o7,	%i7
	movg	%icc,	%i5,	%g6
	movcc	%icc,	%g2,	%o5
	popc	0x10D3,	%i6
	orncc	%g7,	0x0331,	%g3
	sllx	%l1,	0x1D,	%o1
	fmul8x16al	%f28,	%f29,	%f12
	lduw	[%l7 + 0x50],	%g4
	subc	%l5,	%o4,	%o0
	edge16	%i3,	%o6,	%g1
	sdivx	%i2,	0x16C5,	%l0
	stw	%i0,	[%l7 + 0x30]
	fxors	%f16,	%f25,	%f6
	edge32l	%i4,	%o2,	%o3
	move	%xcc,	%l3,	%l2
	ldx	[%l7 + 0x30],	%g5
	popc	0x0DE7,	%l4
	edge32ln	%i1,	%o7,	%l6
	edge16n	%i5,	%i7,	%g2
	sra	%g6,	0x03,	%i6
	sethi	0x0D9D,	%o5
	movn	%icc,	%g7,	%g3
	st	%f5,	[%l7 + 0x60]
	or	%o1,	0x04DB,	%g4
	umul	%l5,	0x18FA,	%o4
	xnorcc	%l1,	0x0D91,	%i3
	edge8ln	%o6,	%g1,	%o0
	movleu	%icc,	%i2,	%i0
	ldd	[%l7 + 0x08],	%l0
	alignaddrl	%o2,	%i4,	%o3
	movne	%xcc,	%l2,	%g5
	sra	%l4,	0x02,	%l3
	xor	%i1,	0x1028,	%o7
	movne	%icc,	%i5,	%i7
	ldd	[%l7 + 0x78],	%i6
	fmovrde	%g2,	%f24,	%f2
	edge16	%g6,	%o5,	%g7
	movvs	%icc,	%i6,	%g3
	smul	%o1,	%l5,	%g4
	edge16ln	%l1,	%o4,	%o6
	fmul8x16au	%f22,	%f16,	%f2
	sll	%i3,	0x1D,	%o0
	fxor	%f30,	%f6,	%f28
	sdivcc	%g1,	0x042A,	%i0
	fmovdg	%icc,	%f8,	%f4
	fpsub16s	%f27,	%f16,	%f1
	movneg	%xcc,	%i2,	%l0
	sdivx	%o2,	0x0E15,	%i4
	or	%l2,	0x125E,	%o3
	fmovs	%f16,	%f5
	movgu	%icc,	%l4,	%g5
	movpos	%icc,	%l3,	%i1
	andncc	%i5,	%o7,	%l6
	movcc	%icc,	%g2,	%g6
	fcmple16	%f26,	%f8,	%o5
	fandnot1s	%f4,	%f19,	%f2
	fpsub16s	%f21,	%f5,	%f31
	movl	%xcc,	%i7,	%g7
	smulcc	%g3,	0x0E4E,	%o1
	edge32l	%l5,	%i6,	%g4
	fmovdl	%xcc,	%f15,	%f24
	andncc	%l1,	%o6,	%o4
	fcmpd	%fcc3,	%f26,	%f26
	fmovrde	%i3,	%f16,	%f4
	fmovrde	%o0,	%f2,	%f14
	subccc	%i0,	%g1,	%l0
	movge	%icc,	%o2,	%i2
	umul	%i4,	0x1D69,	%o3
	movleu	%icc,	%l2,	%g5
	udivcc	%l4,	0x1F47,	%l3
	fpack16	%f22,	%f9
	fmovdpos	%xcc,	%f22,	%f4
	smulcc	%i1,	%o7,	%i5
	faligndata	%f12,	%f0,	%f8
	move	%icc,	%g2,	%l6
	ldsb	[%l7 + 0x69],	%o5
	andn	%g6,	0x02C4,	%g7
	sdiv	%g3,	0x0602,	%o1
	lduw	[%l7 + 0x08],	%i7
	ldsb	[%l7 + 0x76],	%l5
	xnor	%g4,	0x1AA4,	%i6
	alignaddr	%o6,	%o4,	%i3
	movneg	%xcc,	%o0,	%i0
	sth	%g1,	[%l7 + 0x4E]
	sdiv	%l1,	0x163D,	%l0
	mulx	%o2,	0x18EE,	%i2
	fmovrslz	%i4,	%f6,	%f15
	movrlez	%l2,	0x3B7,	%o3
	orncc	%l4,	0x1F6D,	%l3
	movl	%xcc,	%g5,	%i1
	array16	%o7,	%g2,	%l6
	smul	%o5,	%g6,	%g7
	fabss	%f24,	%f25
	sdivx	%i5,	0x082A,	%g3
	lduw	[%l7 + 0x24],	%i7
	ldsh	[%l7 + 0x40],	%o1
	movrlez	%g4,	%i6,	%o6
	fpadd16s	%f12,	%f25,	%f10
	movrlez	%l5,	%o4,	%o0
	fcmpd	%fcc1,	%f30,	%f2
	xor	%i3,	%i0,	%g1
	fmuld8ulx16	%f13,	%f2,	%f24
	umul	%l0,	0x1107,	%l1
	udiv	%o2,	0x0E0B,	%i2
	mulx	%l2,	%i4,	%o3
	andncc	%l3,	%g5,	%l4
	nop
	set	0x6A, %i5
	ldsh	[%l7 + %i5],	%i1
	edge16ln	%g2,	%l6,	%o5
	ldd	[%l7 + 0x50],	%o6
	fpadd16	%f20,	%f10,	%f14
	fandnot2s	%f13,	%f29,	%f21
	andncc	%g7,	%i5,	%g6
	movcs	%xcc,	%g3,	%i7
	movvc	%xcc,	%g4,	%o1
	fpsub32	%f14,	%f10,	%f8
	fcmpne32	%f12,	%f28,	%o6
	sll	%i6,	0x11,	%o4
	fpack16	%f28,	%f27
	sir	0x16E2
	edge8	%o0,	%l5,	%i3
	movrlz	%i0,	%g1,	%l0
	popc	%o2,	%i2
	smulcc	%l2,	0x0F46,	%i4
	stw	%o3,	[%l7 + 0x50]
	edge8ln	%l1,	%l3,	%l4
	stw	%i1,	[%l7 + 0x68]
	movvc	%xcc,	%g5,	%l6
	udivcc	%o5,	0x1DC2,	%o7
	edge8ln	%g2,	%g7,	%i5
	sra	%g6,	0x09,	%i7
	sra	%g4,	0x03,	%g3
	fmovspos	%xcc,	%f21,	%f21
	mulx	%o1,	0x057B,	%i6
	fmul8x16au	%f12,	%f11,	%f12
	udivcc	%o4,	0x1E28,	%o6
	fcmpes	%fcc0,	%f2,	%f17
	ldsh	[%l7 + 0x14],	%l5
	fsrc1	%f26,	%f8
	edge16	%i3,	%i0,	%o0
	movcs	%xcc,	%l0,	%o2
	sth	%i2,	[%l7 + 0x48]
	fandnot2s	%f21,	%f16,	%f28
	ldd	[%l7 + 0x18],	%g0
	edge32l	%l2,	%i4,	%o3
	ldd	[%l7 + 0x48],	%f30
	movg	%icc,	%l3,	%l1
	subcc	%i1,	0x0B73,	%g5
	xorcc	%l4,	0x0058,	%o5
	fmovsne	%icc,	%f0,	%f15
	lduw	[%l7 + 0x38],	%l6
	and	%o7,	0x16E3,	%g2
	movrlz	%g7,	%i5,	%i7
	orn	%g4,	0x1B96,	%g6
	addccc	%g3,	%o1,	%o4
	umul	%i6,	%l5,	%o6
	edge8ln	%i0,	%i3,	%o0
	movrgez	%o2,	0x0D9,	%l0
	sllx	%i2,	0x08,	%g1
	movg	%icc,	%l2,	%i4
	fcmpgt16	%f26,	%f12,	%o3
	mulscc	%l3,	%i1,	%g5
	smul	%l1,	0x1F45,	%l4
	nop
	set	0x18, %l5
	stx	%o5,	[%l7 + %l5]
	fmovdcc	%xcc,	%f30,	%f22
	fpadd32	%f12,	%f20,	%f20
	popc	0x185D,	%o7
	subcc	%l6,	%g2,	%i5
	edge16n	%g7,	%g4,	%g6
	movl	%icc,	%i7,	%o1
	fmovsvs	%icc,	%f9,	%f9
	fmovdpos	%xcc,	%f18,	%f23
	nop
	set	0x34, %l4
	ldub	[%l7 + %l4],	%o4
	edge8ln	%i6,	%g3,	%l5
	stx	%o6,	[%l7 + 0x48]
	movg	%icc,	%i0,	%i3
	alignaddrl	%o2,	%o0,	%i2
	orn	%g1,	0x1F66,	%l0
	stb	%i4,	[%l7 + 0x0E]
	fnand	%f6,	%f16,	%f8
	ldd	[%l7 + 0x70],	%l2
	lduh	[%l7 + 0x54],	%l3
	movn	%icc,	%i1,	%o3
	movgu	%icc,	%g5,	%l4
	srl	%o5,	%l1,	%l6
	movcs	%xcc,	%o7,	%g2
	movne	%icc,	%g7,	%g4
	fmovsle	%xcc,	%f24,	%f7
	fnor	%f12,	%f26,	%f22
	udiv	%g6,	0x1E3E,	%i5
	array8	%i7,	%o4,	%o1
	mulscc	%g3,	%l5,	%o6
	orncc	%i0,	%i6,	%o2
	array8	%i3,	%o0,	%i2
	ldsh	[%l7 + 0x3A],	%l0
	movcc	%xcc,	%g1,	%l2
	edge8	%i4,	%i1,	%l3
	lduw	[%l7 + 0x30],	%o3
	movrlez	%g5,	0x35B,	%o5
	nop
	set	0x28, %l3
	ldd	[%l7 + %l3],	%f24
	umulcc	%l1,	%l4,	%o7
	movvc	%xcc,	%g2,	%g7
	fcmpd	%fcc2,	%f26,	%f14
	movrlez	%g4,	0x19C,	%g6
	movrlez	%l6,	0x117,	%i5
	add	%o4,	%i7,	%o1
	movrlz	%l5,	0x2F1,	%g3
	fmovrdgez	%o6,	%f20,	%f28
	fmovde	%xcc,	%f6,	%f6
	udivcc	%i6,	0x0AAE,	%i0
	fnot1	%f20,	%f26
	umul	%i3,	%o0,	%o2
	lduw	[%l7 + 0x4C],	%i2
	orn	%g1,	%l0,	%l2
	subccc	%i1,	%l3,	%o3
	fmovs	%f27,	%f31
	subcc	%i4,	%o5,	%g5
	sll	%l4,	0x13,	%o7
	andcc	%g2,	%l1,	%g4
	udivcc	%g6,	0x05C2,	%g7
	edge32n	%l6,	%i5,	%o4
	fmuld8sux16	%f3,	%f26,	%f16
	fpadd32	%f10,	%f6,	%f10
	andn	%o1,	0x116C,	%i7
	mova	%icc,	%l5,	%o6
	addcc	%i6,	0x0F28,	%g3
	movleu	%xcc,	%i0,	%o0
	stb	%i3,	[%l7 + 0x60]
	mulscc	%i2,	%o2,	%g1
	fmovspos	%xcc,	%f1,	%f10
	orncc	%l0,	0x0A62,	%i1
	stx	%l2,	[%l7 + 0x10]
	sll	%l3,	0x13,	%i4
	lduh	[%l7 + 0x1E],	%o5
	mulx	%g5,	%o3,	%o7
	sll	%g2,	%l1,	%l4
	movg	%icc,	%g4,	%g6
	xor	%l6,	%g7,	%o4
	lduw	[%l7 + 0x0C],	%o1
	andcc	%i7,	%i5,	%o6
	fmul8x16	%f11,	%f12,	%f4
	mova	%xcc,	%i6,	%g3
	movrgz	%l5,	0x1B0,	%i0
	edge16l	%i3,	%i2,	%o2
	edge8ln	%g1,	%l0,	%i1
	movvc	%xcc,	%o0,	%l2
	alignaddr	%l3,	%i4,	%o5
	move	%icc,	%o3,	%g5
	udiv	%g2,	0x06C5,	%l1
	orncc	%l4,	%o7,	%g6
	smul	%l6,	%g4,	%o4
	mulscc	%g7,	0x1E29,	%o1
	fandnot2	%f2,	%f26,	%f16
	alignaddr	%i5,	%i7,	%i6
	subc	%o6,	0x03CC,	%l5
	sdivcc	%i0,	0x051B,	%g3
	stw	%i2,	[%l7 + 0x64]
	movgu	%xcc,	%o2,	%g1
	ld	[%l7 + 0x60],	%f15
	addccc	%l0,	%i1,	%o0
	fornot1s	%f14,	%f15,	%f2
	edge8	%i3,	%l2,	%l3
	xnor	%o5,	%o3,	%g5
	xor	%g2,	%i4,	%l4
	edge8n	%o7,	%g6,	%l1
	fmovsvc	%icc,	%f20,	%f31
	ldsw	[%l7 + 0x40],	%g4
	addc	%l6,	0x0758,	%g7
	sub	%o4,	0x094A,	%o1
	udivcc	%i7,	0x009E,	%i5
	alignaddr	%i6,	%l5,	%o6
	st	%f22,	[%l7 + 0x54]
	ldd	[%l7 + 0x38],	%g2
	fpadd32s	%f2,	%f8,	%f10
	movcs	%icc,	%i2,	%o2
	subcc	%g1,	0x022F,	%i0
	udivcc	%i1,	0x05A9,	%l0
	fmovdleu	%xcc,	%f14,	%f13
	and	%i3,	%o0,	%l3
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	srax	%o5,	%g2,	%i4
	fones	%f30
	nop
	set	0x1F, %i2
	stb	%l4,	[%l7 + %i2]
	subc	%g6,	0x0CFC,	%l1
	srl	%o7,	0x04,	%g4
	st	%f3,	[%l7 + 0x24]
	addccc	%l6,	0x185F,	%o4
	srl	%g7,	0x14,	%o1
	ldd	[%l7 + 0x48],	%i6
	ldd	[%l7 + 0x18],	%f12
	andncc	%i6,	%i5,	%l5
	fpack32	%f26,	%f0,	%f16
	movcs	%xcc,	%g3,	%i2
	movvc	%icc,	%o2,	%g1
	sdivx	%o6,	0x144A,	%i0
	fand	%f0,	%f0,	%f26
	xorcc	%l0,	%i3,	%o0
	movrgz	%l3,	%l2,	%i1
	movrgez	%g5,	0x246,	%o3
	movvs	%xcc,	%g2,	%o5
	add	%l4,	0x0991,	%i4
	movle	%xcc,	%g6,	%o7
	mulscc	%g4,	%l6,	%l1
	sllx	%o4,	%o1,	%g7
	edge8n	%i7,	%i6,	%i5
	popc	0x131A,	%g3
	movcc	%icc,	%l5,	%i2
	move	%xcc,	%g1,	%o6
	sra	%i0,	0x16,	%l0
	fxnors	%f11,	%f29,	%f22
	mulscc	%o2,	0x0E06,	%i3
	nop
	set	0x38, %o1
	stx	%l3,	[%l7 + %o1]
	restore %l2, %i1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g5,	%g2,	%o3
	std	%f20,	[%l7 + 0x70]
	fmovda	%icc,	%f2,	%f29
	andn	%o5,	0x053C,	%i4
	fsrc2s	%f30,	%f15
	fcmpne32	%f30,	%f14,	%l4
	fandnot1	%f22,	%f4,	%f0
	fsrc1s	%f31,	%f11
	nop
	set	0x0C, %o5
	lduh	[%l7 + %o5],	%o7
	andn	%g4,	%l6,	%g6
	xnorcc	%o4,	0x033A,	%l1
	alignaddrl	%g7,	%i7,	%i6
	sll	%o1,	%g3,	%l5
	st	%f29,	[%l7 + 0x18]
	edge8ln	%i2,	%i5,	%g1
	fmuld8sux16	%f21,	%f5,	%f8
	or	%o6,	0x0C7E,	%l0
	movrgez	%o2,	%i0,	%i3
	sll	%l3,	%l2,	%i1
	ldx	[%l7 + 0x48],	%o0
	movre	%g2,	%o3,	%o5
	fpadd16	%f2,	%f0,	%f24
	stw	%i4,	[%l7 + 0x14]
	fmovrdlez	%l4,	%f28,	%f10
	xnor	%o7,	%g5,	%l6
	movrgz	%g6,	%g4,	%o4
	subc	%l1,	0x0AB1,	%i7
	umulcc	%i6,	%g7,	%g3
	fandnot2s	%f23,	%f4,	%f29
	fcmpd	%fcc3,	%f22,	%f10
	array8	%l5,	%o1,	%i2
	sra	%i5,	%g1,	%l0
	fxor	%f22,	%f0,	%f22
	fabsd	%f14,	%f8
	mova	%icc,	%o2,	%o6
	xor	%i3,	%i0,	%l2
	andncc	%l3,	%o0,	%i1
	andn	%o3,	0x0AC6,	%g2
	orncc	%i4,	%l4,	%o7
	edge32l	%o5,	%g5,	%l6
	fcmpd	%fcc0,	%f10,	%f24
	add	%g6,	0x01D7,	%g4
	movrgz	%l1,	0x36E,	%o4
	srl	%i7,	%g7,	%g3
	fnot2	%f22,	%f28
	movge	%xcc,	%i6,	%l5
	movrlz	%i2,	0x314,	%o1
	array32	%i5,	%l0,	%g1
	ldsh	[%l7 + 0x7C],	%o6
	movg	%icc,	%i3,	%o2
	fmovsvc	%icc,	%f16,	%f7
	popc	%l2,	%i0
	fornot1	%f10,	%f24,	%f8
	movge	%icc,	%l3,	%o0
	fone	%f8
	alignaddrl	%i1,	%g2,	%o3
	lduh	[%l7 + 0x6C],	%l4
	siam	0x4
	stb	%i4,	[%l7 + 0x7F]
	edge16	%o7,	%g5,	%o5
	sll	%g6,	%l6,	%l1
	sir	0x0151
	sth	%o4,	[%l7 + 0x42]
	sra	%g4,	0x11,	%g7
	fcmpne16	%f14,	%f20,	%i7
	edge32ln	%g3,	%l5,	%i6
	sll	%o1,	%i5,	%l0
	orcc	%i2,	%o6,	%g1
	fpadd16s	%f21,	%f6,	%f5
	ldsb	[%l7 + 0x14],	%o2
	movne	%xcc,	%l2,	%i0
	umulcc	%l3,	%o0,	%i1
	udiv	%i3,	0x19AF,	%g2
	save %l4, 0x070A, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%o7,	0x15,	%g5
	fnor	%f10,	%f6,	%f12
	addc	%o5,	0x16E4,	%o3
	ldd	[%l7 + 0x70],	%g6
	fsrc1s	%f2,	%f7
	addcc	%l6,	%o4,	%l1
	movcc	%icc,	%g4,	%g7
	fmul8x16au	%f3,	%f4,	%f8
	addc	%g3,	0x1BA2,	%l5
	ldx	[%l7 + 0x60],	%i7
	fcmps	%fcc1,	%f15,	%f26
	fcmped	%fcc1,	%f12,	%f18
	lduw	[%l7 + 0x0C],	%i6
	alignaddr	%i5,	%o1,	%l0
	array8	%i2,	%o6,	%o2
	orn	%l2,	0x008A,	%g1
	fmovrdgz	%l3,	%f28,	%f2
	udivcc	%i0,	0x0CBA,	%o0
	fsrc1s	%f28,	%f14
	sllx	%i3,	%i1,	%g2
	edge8n	%i4,	%l4,	%o7
	fmovdcc	%xcc,	%f12,	%f24
	fnegd	%f22,	%f14
	andn	%g5,	%o5,	%o3
	edge32	%g6,	%o4,	%l6
	nop
	set	0x70, %o6
	sth	%l1,	[%l7 + %o6]
	addcc	%g4,	0x0D24,	%g3
	ldx	[%l7 + 0x70],	%l5
	subccc	%i7,	%i6,	%g7
	sllx	%o1,	%i5,	%l0
	sll	%i2,	%o2,	%o6
	mulscc	%g1,	0x0901,	%l2
	edge8	%l3,	%i0,	%i3
	fnor	%f14,	%f0,	%f12
	edge8ln	%o0,	%g2,	%i4
	movrgez	%i1,	0x2D8,	%o7
	edge8ln	%g5,	%o5,	%l4
	movre	%g6,	0x001,	%o3
	movrne	%l6,	%l1,	%g4
	addcc	%o4,	0x158F,	%g3
	sra	%l5,	%i7,	%i6
	or	%g7,	0x1EAB,	%o1
	smul	%i5,	0x0B34,	%l0
	edge32n	%o2,	%o6,	%g1
	fabss	%f18,	%f8
	popc	0x0ED5,	%i2
	xnorcc	%l2,	%l3,	%i0
	fmovdl	%xcc,	%f23,	%f0
	fmovsne	%xcc,	%f5,	%f14
	fcmpgt16	%f22,	%f14,	%o0
	edge8l	%i3,	%g2,	%i4
	srlx	%i1,	0x14,	%g5
	st	%f6,	[%l7 + 0x78]
	xorcc	%o7,	%l4,	%g6
	array16	%o3,	%l6,	%l1
	stx	%o5,	[%l7 + 0x30]
	fnegs	%f3,	%f25
	subcc	%g4,	%g3,	%l5
	mova	%icc,	%o4,	%i7
	addccc	%i6,	0x1364,	%g7
	mulx	%i5,	%l0,	%o2
	ldsw	[%l7 + 0x4C],	%o1
	edge16l	%o6,	%g1,	%l2
	edge8l	%l3,	%i0,	%o0
	sdivcc	%i3,	0x1F14,	%g2
	sub	%i4,	0x1414,	%i2
	fandnot2s	%f13,	%f14,	%f28
	fmovscs	%xcc,	%f21,	%f12
	ldd	[%l7 + 0x58],	%f22
	andncc	%i1,	%o7,	%g5
	movrgez	%g6,	0x2FD,	%l4
	edge8ln	%o3,	%l1,	%o5
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	movpos	%icc,	%o4,	%l5
	sdiv	%i7,	0x0CFF,	%g7
	andn	%i6,	%l0,	%o2
	fmovrde	%i5,	%f22,	%f6
	orn	%o6,	%g1,	%o1
	sth	%l3,	[%l7 + 0x3E]
	movrne	%i0,	%l2,	%o0
	orcc	%g2,	%i4,	%i2
	umulcc	%i3,	0x1EE5,	%i1
	ldd	[%l7 + 0x18],	%f22
	array32	%g5,	%g6,	%o7
	fandnot2s	%f24,	%f6,	%f30
	mulx	%l4,	0x0EC3,	%l1
	ldd	[%l7 + 0x70],	%f18
	edge16n	%o3,	%o5,	%l6
	movvs	%xcc,	%g3,	%g4
	smul	%o4,	%l5,	%i7
	umul	%g7,	0x1AFE,	%l0
	sethi	0x1BE6,	%o2
	movpos	%icc,	%i6,	%o6
	ldx	[%l7 + 0x40],	%g1
	movvc	%xcc,	%o1,	%i5
	udivx	%i0,	0x0F11,	%l2
	movgu	%xcc,	%o0,	%l3
	ldd	[%l7 + 0x58],	%g2
	st	%f15,	[%l7 + 0x2C]
	popc	%i2,	%i4
	sdiv	%i3,	0x0609,	%i1
	edge32l	%g6,	%o7,	%g5
	orncc	%l1,	%l4,	%o3
	fmuld8ulx16	%f22,	%f22,	%f20
	smul	%l6,	%g3,	%g4
	xnorcc	%o4,	0x0AF7,	%o5
	edge8n	%l5,	%g7,	%l0
	ldsh	[%l7 + 0x38],	%i7
	fzero	%f16
	ldsh	[%l7 + 0x26],	%o2
	edge16ln	%o6,	%g1,	%o1
	movvs	%icc,	%i5,	%i0
	ldd	[%l7 + 0x58],	%f10
	fmovrdlez	%i6,	%f18,	%f8
	ldsw	[%l7 + 0x20],	%o0
	edge16	%l3,	%l2,	%i2
	array8	%i4,	%g2,	%i1
	sll	%g6,	%o7,	%i3
	movcc	%xcc,	%l1,	%l4
	smulcc	%o3,	0x1F06,	%l6
	save %g5, %g4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g3,	%o5,	%g7
	xorcc	%l5,	%i7,	%l0
	lduw	[%l7 + 0x68],	%o6
	fexpand	%f11,	%f18
	ldsb	[%l7 + 0x45],	%o2
	addc	%g1,	%o1,	%i0
	edge8	%i5,	%o0,	%l3
	mova	%icc,	%i6,	%l2
	edge32	%i2,	%i4,	%g2
	stw	%g6,	[%l7 + 0x7C]
	srax	%o7,	%i3,	%i1
	umulcc	%l4,	0x1EB4,	%l1
	fsrc2	%f14,	%f14
	fcmpeq32	%f28,	%f30,	%l6
	srlx	%o3,	%g5,	%o4
	subccc	%g4,	0x1872,	%g3
	udivcc	%g7,	0x1CE7,	%o5
	fpackfix	%f26,	%f8
	add	%i7,	0x048C,	%l5
	alignaddrl	%l0,	%o2,	%o6
	orn	%g1,	%i0,	%i5
	movre	%o0,	%o1,	%l3
	movrlez	%l2,	0x2BE,	%i2
	ld	[%l7 + 0x5C],	%f13
	movcc	%icc,	%i6,	%g2
	lduw	[%l7 + 0x28],	%g6
	subc	%i4,	0x0403,	%o7
	sll	%i3,	0x13,	%i1
	movne	%icc,	%l1,	%l4
	fnot2	%f20,	%f8
	fmovsg	%xcc,	%f21,	%f16
	move	%xcc,	%l6,	%o3
	ldsw	[%l7 + 0x68],	%o4
	movrlz	%g4,	0x0DF,	%g3
	ld	[%l7 + 0x28],	%f5
	smul	%g5,	0x0FDD,	%g7
	movrgez	%i7,	0x270,	%o5
	ld	[%l7 + 0x38],	%f6
	fands	%f17,	%f31,	%f10
	edge16	%l5,	%o2,	%o6
	edge16ln	%l0,	%g1,	%i5
	fmovscs	%icc,	%f23,	%f2
	movrlez	%i0,	%o0,	%l3
	restore %l2, 0x131F, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f8,	%f24
	srlx	%o1,	0x0C,	%g2
	udivx	%i6,	0x1BA4,	%g6
	fands	%f30,	%f29,	%f15
	sdiv	%o7,	0x16A3,	%i3
	orncc	%i1,	%l1,	%l4
	srlx	%i4,	%l6,	%o3
	fcmpgt32	%f4,	%f18,	%o4
	fmovsvc	%icc,	%f10,	%f8
	sethi	0x1134,	%g4
	edge32	%g3,	%g7,	%g5
	fmovdleu	%icc,	%f1,	%f11
	stx	%o5,	[%l7 + 0x70]
	move	%icc,	%l5,	%o2
	smul	%i7,	%l0,	%o6
	movrgz	%g1,	%i0,	%o0
	edge32l	%l3,	%i5,	%l2
	sth	%i2,	[%l7 + 0x42]
	edge16l	%g2,	%i6,	%o1
	array16	%o7,	%g6,	%i3
	fcmpeq16	%f26,	%f6,	%l1
	popc	0x06F5,	%i1
	fmovse	%xcc,	%f16,	%f10
	fand	%f2,	%f18,	%f20
	sll	%l4,	%l6,	%o3
	lduw	[%l7 + 0x28],	%i4
	fmovdne	%xcc,	%f3,	%f4
	edge32ln	%o4,	%g3,	%g4
	movne	%xcc,	%g7,	%o5
	mulx	%l5,	%g5,	%i7
	stx	%l0,	[%l7 + 0x58]
	array8	%o2,	%o6,	%g1
	fone	%f8
	fmovrslez	%o0,	%f7,	%f25
	sra	%l3,	0x07,	%i0
	ldsh	[%l7 + 0x3E],	%i5
	edge32n	%l2,	%i2,	%i6
	andn	%o1,	0x140E,	%o7
	fmovdgu	%xcc,	%f30,	%f12
	ldd	[%l7 + 0x58],	%g6
	sub	%i3,	%l1,	%g2
	fnot1s	%f8,	%f27
	fmovrslez	%i1,	%f15,	%f19
	fsrc2s	%f7,	%f18
	xorcc	%l6,	%o3,	%i4
	movneg	%icc,	%l4,	%g3
	edge32	%g4,	%o4,	%g7
	ldd	[%l7 + 0x28],	%l4
	edge8ln	%o5,	%g5,	%i7
	movrgz	%o2,	0x341,	%o6
	stx	%g1,	[%l7 + 0x68]
	fmovrslz	%o0,	%f16,	%f22
	fpmerge	%f15,	%f23,	%f20
	mova	%xcc,	%l3,	%l0
	ldub	[%l7 + 0x16],	%i0
	stx	%l2,	[%l7 + 0x60]
	sir	0x0000
	lduh	[%l7 + 0x30],	%i2
	ldsb	[%l7 + 0x22],	%i5
	array16	%i6,	%o7,	%o1
	edge32ln	%g6,	%l1,	%g2
	movle	%xcc,	%i3,	%l6
	fmovsl	%icc,	%f2,	%f30
	movvs	%icc,	%i1,	%i4
	sth	%o3,	[%l7 + 0x2C]
	ld	[%l7 + 0x10],	%f5
	movn	%icc,	%g3,	%g4
	fmovdl	%xcc,	%f10,	%f29
	udiv	%o4,	0x0693,	%g7
	fmovrse	%l4,	%f31,	%f17
	xor	%l5,	0x146E,	%o5
	movpos	%icc,	%i7,	%g5
	fmovdge	%xcc,	%f29,	%f29
	for	%f18,	%f18,	%f30
	fmovsg	%icc,	%f20,	%f2
	nop
	set	0x48, %g1
	ldsh	[%l7 + %g1],	%o2
	fmovdl	%icc,	%f16,	%f3
	sll	%g1,	%o0,	%o6
	add	%l3,	%l0,	%i0
	fmovsvc	%icc,	%f22,	%f14
	fpadd32s	%f15,	%f9,	%f3
	ldub	[%l7 + 0x10],	%i2
	fmul8sux16	%f2,	%f2,	%f24
	edge8ln	%i5,	%i6,	%l2
	array32	%o1,	%g6,	%o7
	fnot2s	%f24,	%f12
	movge	%icc,	%l1,	%i3
	andncc	%g2,	%i1,	%i4
	fmovsle	%icc,	%f5,	%f25
	fmovscs	%xcc,	%f9,	%f6
	fandnot2	%f18,	%f18,	%f16
	alignaddr	%l6,	%g3,	%g4
	sra	%o3,	0x09,	%o4
	fsrc2	%f0,	%f22
	srlx	%l4,	0x18,	%l5
	movvc	%xcc,	%o5,	%g7
	array8	%g5,	%i7,	%o2
	movvs	%xcc,	%g1,	%o0
	fxnor	%f4,	%f18,	%f22
	subc	%o6,	0x0064,	%l0
	move	%xcc,	%l3,	%i0
	fmovdne	%xcc,	%f24,	%f7
	sll	%i2,	%i5,	%i6
	fxnors	%f9,	%f27,	%f1
	movl	%icc,	%o1,	%l2
	subc	%o7,	0x1A4A,	%l1
	movge	%icc,	%i3,	%g6
	movcc	%icc,	%i1,	%g2
	fmul8sux16	%f2,	%f14,	%f2
	stx	%i4,	[%l7 + 0x40]
	sllx	%l6,	0x0C,	%g3
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	ldx	[%l7 + 0x60],	%g4
	subcc	%l5,	%o5,	%g5
	restore %i7, 0x1124, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o2,	%g1,	%o6
	movre	%l0,	0x0D9,	%o0
	array32	%i0,	%i2,	%l3
	ldsb	[%l7 + 0x1D],	%i5
	xorcc	%o1,	0x01AC,	%l2
	fmovsgu	%icc,	%f3,	%f18
	array8	%i6,	%l1,	%o7
	xor	%i3,	%g6,	%g2
	movn	%icc,	%i1,	%l6
	fabss	%f15,	%f6
	mova	%icc,	%i4,	%o3
	movneg	%icc,	%g3,	%l4
	mulx	%o4,	%g4,	%o5
	std	%f0,	[%l7 + 0x68]
	std	%f18,	[%l7 + 0x10]
	movg	%icc,	%l5,	%g5
	edge32n	%g7,	%i7,	%g1
	or	%o2,	0x0C5B,	%o6
	stw	%o0,	[%l7 + 0x34]
	movne	%icc,	%i0,	%l0
	edge32ln	%i2,	%l3,	%o1
	udivcc	%i5,	0x1936,	%l2
	mova	%icc,	%l1,	%o7
	fmovrsne	%i6,	%f1,	%f14
	sdiv	%g6,	0x06CA,	%g2
	st	%f7,	[%l7 + 0x4C]
	movvc	%icc,	%i1,	%i3
	fmovd	%f26,	%f6
	movleu	%xcc,	%i4,	%l6
	edge16	%o3,	%l4,	%o4
	srl	%g3,	0x14,	%o5
	orcc	%l5,	%g5,	%g4
	orn	%g7,	%g1,	%i7
	edge8ln	%o6,	%o0,	%o2
	edge16ln	%i0,	%i2,	%l0
	fnors	%f28,	%f8,	%f12
	edge32l	%l3,	%o1,	%l2
	fzeros	%f14
	sll	%i5,	%o7,	%i6
	sll	%g6,	0x15,	%g2
	fmovsg	%xcc,	%f21,	%f9
	sethi	0x1376,	%l1
	orn	%i1,	0x0F2A,	%i4
	fmovdge	%xcc,	%f29,	%f12
	fmovrsgez	%l6,	%f25,	%f8
	edge16l	%o3,	%i3,	%l4
	movpos	%xcc,	%g3,	%o4
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	sra	%g4,	0x0D,	%l5
	movrgez	%g1,	0x14A,	%g7
	fcmple16	%f14,	%f6,	%o6
	ldsh	[%l7 + 0x7C],	%o0
	fxnors	%f10,	%f30,	%f10
	fmovdleu	%icc,	%f2,	%f7
	andncc	%o2,	%i7,	%i2
	mova	%xcc,	%i0,	%l3
	andn	%l0,	0x17D7,	%l2
	movrgz	%o1,	%o7,	%i6
	movvc	%icc,	%g6,	%g2
	fmovsle	%xcc,	%f11,	%f11
	alignaddrl	%i5,	%l1,	%i1
	xnor	%l6,	0x06CE,	%o3
	fmovrslz	%i3,	%f23,	%f4
	subccc	%l4,	%i4,	%g3
	ldx	[%l7 + 0x40],	%o5
	or	%g5,	0x0FC3,	%g4
	fpsub32s	%f3,	%f11,	%f24
	subcc	%o4,	0x1542,	%g1
	smulcc	%l5,	%o6,	%o0
	ldsb	[%l7 + 0x69],	%g7
	smulcc	%i7,	0x01EC,	%i2
	lduh	[%l7 + 0x30],	%i0
	fcmpgt16	%f24,	%f6,	%l3
	ld	[%l7 + 0x40],	%f22
	alignaddrl	%o2,	%l2,	%o1
	sllx	%l0,	0x04,	%o7
	st	%f19,	[%l7 + 0x0C]
	sdivcc	%i6,	0x09F3,	%g2
	movcs	%xcc,	%i5,	%l1
	edge32n	%i1,	%g6,	%l6
	sub	%o3,	0x1D4A,	%l4
	umulcc	%i4,	0x0B2E,	%i3
	stb	%o5,	[%l7 + 0x1F]
	fpadd32s	%f2,	%f4,	%f7
	xnorcc	%g3,	%g4,	%o4
	fmovdvc	%icc,	%f2,	%f13
	xnor	%g5,	0x0E4F,	%g1
	movleu	%icc,	%l5,	%o0
	andncc	%o6,	%g7,	%i2
	fnegs	%f6,	%f2
	movleu	%xcc,	%i0,	%i7
	umulcc	%l3,	0x0A27,	%o2
	movre	%o1,	0x0E1,	%l2
	ldx	[%l7 + 0x10],	%o7
	fmovde	%xcc,	%f21,	%f17
	andcc	%l0,	0x10DC,	%i6
	edge8	%i5,	%g2,	%i1
	edge16l	%l1,	%g6,	%o3
	fmovscc	%icc,	%f17,	%f4
	fornot1s	%f22,	%f20,	%f2
	movneg	%xcc,	%l4,	%i4
	sub	%i3,	%o5,	%l6
	fsrc1	%f0,	%f20
	fnor	%f30,	%f6,	%f28
	bshuffle	%f12,	%f4,	%f18
	or	%g3,	%g4,	%g5
	umul	%o4,	%g1,	%l5
	lduh	[%l7 + 0x6A],	%o0
	edge32	%o6,	%i2,	%g7
	fmovdneg	%xcc,	%f23,	%f14
	ldd	[%l7 + 0x18],	%f6
	fmovrdlez	%i7,	%f2,	%f4
	sth	%l3,	[%l7 + 0x40]
	sdivcc	%i0,	0x0A9B,	%o1
	movgu	%xcc,	%l2,	%o2
	edge32l	%l0,	%i6,	%o7
	mulscc	%g2,	0x0859,	%i1
	ld	[%l7 + 0x4C],	%f17
	movrgz	%i5,	0x2A7,	%g6
	ld	[%l7 + 0x34],	%f21
	srl	%o3,	0x18,	%l1
	fmovdcs	%icc,	%f14,	%f23
	edge32l	%i4,	%i3,	%l4
	sub	%o5,	%g3,	%l6
	sll	%g4,	0x15,	%o4
	fzeros	%f22
	lduw	[%l7 + 0x70],	%g5
	udivcc	%l5,	0x1A90,	%g1
	movg	%icc,	%o0,	%i2
	alignaddr	%o6,	%i7,	%g7
	fors	%f6,	%f0,	%f16
	mova	%icc,	%l3,	%i0
	nop
	set	0x48, %i0
	ldx	[%l7 + %i0],	%o1
	orn	%l2,	0x194D,	%l0
	stx	%o2,	[%l7 + 0x40]
	fnegs	%f10,	%f8
	addccc	%i6,	0x1A16,	%o7
	movrgz	%g2,	%i5,	%g6
	fsrc1	%f22,	%f30
	edge16	%i1,	%l1,	%o3
	movrgez	%i3,	0x1CC,	%l4
	ldd	[%l7 + 0x60],	%i4
	array16	%g3,	%o5,	%l6
	udivcc	%g4,	0x1C8C,	%o4
	movpos	%xcc,	%l5,	%g1
	edge32n	%g5,	%o0,	%i2
	move	%xcc,	%i7,	%g7
	ldsh	[%l7 + 0x30],	%l3
	xorcc	%o6,	0x0BF4,	%o1
	stw	%i0,	[%l7 + 0x50]
	movrlz	%l0,	0x080,	%l2
	movpos	%xcc,	%i6,	%o7
	subcc	%g2,	%i5,	%g6
	fxnor	%f20,	%f24,	%f10
	fmovda	%icc,	%f20,	%f23
	edge16ln	%i1,	%o2,	%o3
	lduh	[%l7 + 0x0E],	%i3
	ldd	[%l7 + 0x28],	%f16
	srl	%l4,	0x0E,	%i4
	smulcc	%l1,	%o5,	%g3
	fmovrdne	%l6,	%f22,	%f10
	fabss	%f27,	%f31
	fxor	%f26,	%f20,	%f30
	srax	%g4,	%l5,	%o4
	fmovrdlez	%g1,	%f26,	%f4
	sethi	0x1C47,	%g5
	umulcc	%i2,	0x0017,	%i7
	movrgez	%o0,	0x359,	%l3
	movgu	%xcc,	%o6,	%o1
	ldd	[%l7 + 0x38],	%g6
	udivx	%i0,	0x1015,	%l2
	fmovsgu	%icc,	%f20,	%f0
	movvc	%xcc,	%i6,	%l0
	orn	%g2,	%o7,	%i5
	ldd	[%l7 + 0x08],	%f10
	mova	%xcc,	%g6,	%i1
	fand	%f14,	%f0,	%f26
	array8	%o2,	%i3,	%l4
	sth	%i4,	[%l7 + 0x52]
	popc	%l1,	%o3
	orcc	%o5,	%g3,	%g4
	movne	%xcc,	%l5,	%l6
	edge16l	%g1,	%g5,	%i2
	ldsh	[%l7 + 0x62],	%i7
	fornot2s	%f26,	%f0,	%f15
	array32	%o0,	%l3,	%o4
	sir	0x0993
	edge16n	%o6,	%g7,	%i0
	fmovse	%xcc,	%f30,	%f9
	ldd	[%l7 + 0x28],	%l2
	mulx	%o1,	%l0,	%g2
	edge8ln	%i6,	%i5,	%o7
	fmovrse	%i1,	%f6,	%f20
	addc	%o2,	0x1CE2,	%g6
	fmovsle	%icc,	%f14,	%f29
	xor	%i3,	%l4,	%i4
	fmovdle	%icc,	%f21,	%f31
	xor	%o3,	%l1,	%g3
	andcc	%o5,	0x15EE,	%l5
	fandnot2	%f26,	%f0,	%f2
	edge32n	%l6,	%g1,	%g5
	fandnot2	%f18,	%f16,	%f10
	movrgez	%g4,	0x24D,	%i7
	array32	%i2,	%o0,	%l3
	fabsd	%f28,	%f24
	fpadd32s	%f4,	%f26,	%f0
	umulcc	%o6,	0x08EA,	%g7
	fsrc1s	%f15,	%f19
	movrne	%i0,	%l2,	%o1
	addcc	%l0,	0x1F39,	%o4
	movge	%xcc,	%g2,	%i5
	lduw	[%l7 + 0x7C],	%o7
	move	%xcc,	%i1,	%o2
	fmovsa	%icc,	%f30,	%f6
	add	%i6,	%g6,	%i3
	sra	%l4,	0x0C,	%i4
	smul	%o3,	%g3,	%o5
	fcmpd	%fcc3,	%f6,	%f30
	edge16n	%l1,	%l6,	%g1
	ldd	[%l7 + 0x78],	%l4
	ldub	[%l7 + 0x75],	%g5
	ldx	[%l7 + 0x18],	%g4
	mova	%xcc,	%i2,	%o0
	movcc	%xcc,	%l3,	%o6
	srl	%g7,	%i7,	%l2
	xor	%i0,	0x1014,	%l0
	movrlez	%o1,	%o4,	%g2
	ldub	[%l7 + 0x7D],	%i5
	edge8ln	%i1,	%o2,	%i6
	movle	%xcc,	%o7,	%i3
	sdivcc	%g6,	0x16B5,	%i4
	fmovsgu	%icc,	%f23,	%f0
	fmovdn	%xcc,	%f16,	%f15
	edge8	%l4,	%o3,	%o5
	stx	%l1,	[%l7 + 0x38]
	udivcc	%g3,	0x01DC,	%g1
	xnorcc	%l5,	0x0A04,	%g5
	edge32n	%l6,	%g4,	%o0
	xor	%i2,	%o6,	%l3
	stw	%i7,	[%l7 + 0x54]
	array32	%g7,	%i0,	%l0
	stb	%o1,	[%l7 + 0x3A]
	xorcc	%l2,	%o4,	%g2
	and	%i1,	0x1D3A,	%o2
	udivcc	%i6,	0x1BA3,	%i5
	smul	%i3,	%g6,	%o7
	ldd	[%l7 + 0x10],	%l4
	fmovsvs	%xcc,	%f26,	%f12
	ldsw	[%l7 + 0x28],	%i4
	fcmple32	%f8,	%f0,	%o3
	ldsw	[%l7 + 0x6C],	%l1
	movge	%xcc,	%g3,	%o5
	andncc	%g1,	%g5,	%l5
	udivcc	%g4,	0x0453,	%l6
	orcc	%i2,	0x1775,	%o0
	srl	%o6,	0x17,	%l3
	array16	%g7,	%i0,	%i7
	movne	%icc,	%o1,	%l0
	fornot2s	%f27,	%f26,	%f14
	ldx	[%l7 + 0x20],	%o4
	edge32ln	%l2,	%g2,	%o2
	fpmerge	%f24,	%f18,	%f10
	sdivx	%i6,	0x1A6C,	%i1
	save %i3, 0x1879, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i5,	%l4,	%i4
	movrgz	%o7,	0x2D3,	%l1
	nop
	set	0x20, %g5
	sth	%g3,	[%l7 + %g5]
	movneg	%xcc,	%o5,	%o3
	orcc	%g1,	%g5,	%g4
	movvs	%xcc,	%l5,	%l6
	edge32ln	%i2,	%o0,	%o6
	alignaddrl	%l3,	%g7,	%i0
	addc	%o1,	%l0,	%i7
	sethi	0x018A,	%o4
	xorcc	%l2,	%g2,	%i6
	restore %o2, 0x0082, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i3,	%g6,	%l4
	alignaddr	%i5,	%i4,	%o7
	udivx	%l1,	0x0CBF,	%g3
	fxnor	%f24,	%f10,	%f20
	stw	%o3,	[%l7 + 0x20]
	orn	%o5,	%g1,	%g4
	srl	%g5,	0x01,	%l6
	udivcc	%l5,	0x118B,	%i2
	fnegs	%f27,	%f28
	andncc	%o6,	%l3,	%g7
	sll	%i0,	0x1C,	%o0
	fcmpeq16	%f12,	%f4,	%l0
	edge16ln	%i7,	%o1,	%l2
	sdivcc	%g2,	0x1DFE,	%o4
	xor	%i6,	0x0809,	%i1
	std	%f24,	[%l7 + 0x38]
	fmovsg	%icc,	%f15,	%f7
	fcmped	%fcc0,	%f26,	%f8
	subcc	%o2,	%g6,	%i3
	faligndata	%f6,	%f8,	%f2
	ldx	[%l7 + 0x70],	%l4
	movvc	%xcc,	%i5,	%i4
	edge32n	%l1,	%g3,	%o3
	sllx	%o7,	0x1C,	%o5
	ldd	[%l7 + 0x28],	%f12
	fmovdgu	%icc,	%f10,	%f19
	subcc	%g4,	0x0467,	%g1
	mulscc	%g5,	0x1343,	%l6
	ldsh	[%l7 + 0x4C],	%l5
	edge8n	%i2,	%o6,	%l3
	ld	[%l7 + 0x28],	%f22
	edge16	%i0,	%o0,	%l0
	fornot2	%f12,	%f26,	%f20
	bshuffle	%f20,	%f4,	%f20
	sra	%i7,	0x04,	%g7
	fpsub32	%f26,	%f4,	%f20
	fmovdle	%icc,	%f2,	%f9
	edge32l	%l2,	%o1,	%g2
	edge32ln	%o4,	%i1,	%i6
	lduh	[%l7 + 0x3A],	%g6
	movge	%icc,	%o2,	%l4
	fmul8x16au	%f1,	%f15,	%f10
	movleu	%xcc,	%i5,	%i4
	subcc	%i3,	0x18BB,	%g3
	alignaddr	%o3,	%o7,	%o5
	xor	%l1,	%g1,	%g4
	movrne	%l6,	0x3E9,	%l5
	stb	%i2,	[%l7 + 0x18]
	edge16	%o6,	%l3,	%i0
	subcc	%o0,	0x006B,	%l0
	addccc	%g5,	0x0556,	%g7
	fmovdpos	%icc,	%f13,	%f2
	sethi	0x06CC,	%l2
	sethi	0x06E1,	%i7
	movle	%xcc,	%o1,	%g2
	xnor	%i1,	%i6,	%o4
	xnorcc	%g6,	%l4,	%i5
	movne	%xcc,	%o2,	%i4
	udivcc	%i3,	0x1D66,	%g3
	andcc	%o3,	0x0E79,	%o5
	lduh	[%l7 + 0x56],	%l1
	sll	%g1,	%o7,	%l6
	fnand	%f0,	%f30,	%f28
	edge32	%g4,	%i2,	%l5
	sdiv	%o6,	0x0731,	%l3
	xnorcc	%o0,	0x00F8,	%l0
	fmovsneg	%icc,	%f11,	%f20
	fmovrslez	%i0,	%f27,	%f12
	stw	%g7,	[%l7 + 0x40]
	edge8	%l2,	%i7,	%g5
	edge8	%o1,	%i1,	%i6
	movrgez	%g2,	0x076,	%o4
	movcc	%xcc,	%g6,	%i5
	mulscc	%o2,	%l4,	%i3
	movcs	%xcc,	%g3,	%o3
	addcc	%o5,	0x1485,	%l1
	movne	%icc,	%g1,	%i4
	movneg	%xcc,	%l6,	%o7
	fors	%f12,	%f15,	%f7
	xnor	%g4,	0x0052,	%i2
	edge16l	%l5,	%l3,	%o6
	movre	%o0,	0x0A2,	%i0
	movg	%xcc,	%g7,	%l0
	umulcc	%l2,	0x171F,	%i7
	movl	%icc,	%o1,	%g5
	fmovdge	%icc,	%f8,	%f21
	andncc	%i1,	%g2,	%o4
	sdivcc	%g6,	0x14E7,	%i6
	array16	%o2,	%l4,	%i3
	ldx	[%l7 + 0x20],	%g3
	stx	%i5,	[%l7 + 0x10]
	udivcc	%o5,	0x17D6,	%l1
	movn	%xcc,	%o3,	%i4
	udivcc	%l6,	0x0DC6,	%g1
	smul	%o7,	%i2,	%l5
	movneg	%xcc,	%g4,	%o6
	fsrc1s	%f21,	%f15
	andcc	%l3,	0x12B5,	%i0
	edge8l	%o0,	%l0,	%g7
	stb	%i7,	[%l7 + 0x66]
	movcc	%icc,	%l2,	%g5
	array16	%i1,	%g2,	%o4
	fnands	%f20,	%f6,	%f27
	sdivcc	%o1,	0x16E4,	%i6
	stx	%o2,	[%l7 + 0x20]
	fmovspos	%xcc,	%f10,	%f12
	smul	%l4,	0x1DF6,	%g6
	movn	%xcc,	%i3,	%g3
	movle	%xcc,	%o5,	%i5
	movge	%xcc,	%o3,	%i4
	fabss	%f31,	%f31
	fnot1s	%f20,	%f12
	fmovsle	%icc,	%f16,	%f24
	mulx	%l1,	%g1,	%l6
	fpsub32s	%f23,	%f30,	%f0
	sdiv	%o7,	0x0066,	%l5
	edge32	%i2,	%g4,	%o6
	sra	%l3,	%i0,	%l0
	srax	%g7,	%o0,	%l2
	fmovsn	%xcc,	%f8,	%f23
	alignaddrl	%i7,	%i1,	%g2
	ldx	[%l7 + 0x68],	%o4
	movpos	%icc,	%o1,	%g5
	fmovrdlz	%o2,	%f22,	%f2
	andcc	%l4,	%g6,	%i6
	fmovsne	%icc,	%f28,	%f1
	smul	%g3,	%o5,	%i5
	fmul8x16al	%f25,	%f21,	%f6
	movneg	%icc,	%i3,	%o3
	movge	%icc,	%i4,	%g1
	movre	%l1,	%l6,	%o7
	movg	%icc,	%l5,	%g4
	sth	%o6,	[%l7 + 0x74]
	sethi	0x11F5,	%i2
	save %i0, 0x1A92, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l3,	0x0E8C,	%g7
	fmovrslz	%o0,	%f20,	%f13
	stb	%i7,	[%l7 + 0x2A]
	movcs	%xcc,	%l2,	%g2
	andn	%i1,	%o1,	%g5
	fmovscc	%icc,	%f14,	%f26
	xnorcc	%o2,	0x0F45,	%l4
	sdiv	%o4,	0x10FD,	%i6
	movge	%xcc,	%g6,	%g3
	fmovrslez	%o5,	%f15,	%f30
	stw	%i3,	[%l7 + 0x44]
	edge32ln	%o3,	%i4,	%g1
	edge16l	%l1,	%i5,	%l6
	stx	%o7,	[%l7 + 0x58]
	movg	%icc,	%g4,	%o6
	move	%xcc,	%i2,	%i0
	movrlz	%l5,	0x2F3,	%l3
	fmovrsgez	%l0,	%f4,	%f29
	or	%g7,	%o0,	%i7
	sth	%l2,	[%l7 + 0x76]
	movrgez	%i1,	0x1B4,	%g2
	umul	%o1,	0x0099,	%o2
	fmovsge	%xcc,	%f5,	%f19
	udivx	%g5,	0x0E38,	%o4
	move	%xcc,	%l4,	%g6
	sub	%i6,	%o5,	%i3
	udivcc	%g3,	0x076A,	%i4
	edge8ln	%g1,	%o3,	%i5
	orncc	%l6,	0x0D6A,	%o7
	fmovsl	%xcc,	%f31,	%f25
	array32	%g4,	%o6,	%i2
	movcs	%xcc,	%l1,	%l5
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	movpos	%xcc,	%g7,	%i0
	andncc	%i7,	%o0,	%l2
	fsrc2s	%f31,	%f15
	fmovrsgez	%g2,	%f12,	%f19
	fornot1	%f16,	%f12,	%f20
	srlx	%i1,	%o1,	%g5
	alignaddr	%o2,	%l4,	%o4
	fmovspos	%xcc,	%f19,	%f11
	umulcc	%i6,	0x137A,	%o5
	edge8l	%i3,	%g6,	%i4
	array8	%g3,	%o3,	%g1
	subccc	%l6,	%o7,	%i5
	orncc	%g4,	%i2,	%o6
	array32	%l1,	%l5,	%l0
	fnot2s	%f16,	%f19
	xor	%l3,	0x0772,	%i0
	movneg	%icc,	%g7,	%o0
	sdivcc	%i7,	0x004E,	%l2
	save %g2, 0x16BC, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g5,	0x0961,	%o2
	subcc	%l4,	0x0DF4,	%o4
	edge32ln	%i6,	%i1,	%o5
	edge8ln	%g6,	%i3,	%i4
	fmovrdgz	%g3,	%f24,	%f18
	xnorcc	%o3,	%g1,	%o7
	ld	[%l7 + 0x58],	%f0
	orn	%l6,	0x1A87,	%i5
	nop
	set	0x20, %g7
	lduw	[%l7 + %g7],	%i2
	ld	[%l7 + 0x58],	%f24
	movn	%icc,	%g4,	%l1
	sdivx	%o6,	0x06F7,	%l5
	srl	%l3,	0x18,	%l0
	stb	%g7,	[%l7 + 0x67]
	movrne	%o0,	0x2F3,	%i7
	xnorcc	%i0,	%g2,	%l2
	ld	[%l7 + 0x34],	%f9
	ldsh	[%l7 + 0x28],	%g5
	srlx	%o1,	%l4,	%o4
	srl	%o2,	0x15,	%i6
	sdivx	%o5,	0x12F7,	%g6
	movrgez	%i1,	0x303,	%i3
	mulscc	%g3,	%i4,	%g1
	srlx	%o3,	%o7,	%l6
	fcmpne16	%f30,	%f20,	%i2
	ldd	[%l7 + 0x28],	%f4
	ldsh	[%l7 + 0x70],	%g4
	edge16n	%l1,	%o6,	%l5
	umul	%i5,	0x0371,	%l3
	popc	%l0,	%g7
	fmovsn	%icc,	%f5,	%f27
	sllx	%o0,	%i7,	%g2
	movn	%xcc,	%l2,	%g5
	fmovsge	%xcc,	%f10,	%f25
	ldsb	[%l7 + 0x41],	%i0
	ldsw	[%l7 + 0x50],	%l4
	fxnors	%f24,	%f7,	%f16
	mulscc	%o1,	0x1D94,	%o2
	subc	%o4,	%o5,	%g6
	mova	%icc,	%i6,	%i1
	movneg	%xcc,	%i3,	%g3
	edge8ln	%i4,	%o3,	%o7
	fxnors	%f3,	%f8,	%f17
	movcc	%xcc,	%l6,	%g1
	fmovsneg	%xcc,	%f19,	%f8
	edge32	%g4,	%l1,	%o6
	movge	%xcc,	%l5,	%i5
	movrlz	%i2,	%l3,	%g7
	xorcc	%o0,	%i7,	%l0
	edge8	%l2,	%g2,	%i0
	alignaddr	%g5,	%l4,	%o1
	xorcc	%o2,	0x1142,	%o5
	fcmple16	%f18,	%f2,	%g6
	sethi	0x1E4F,	%i6
	subc	%o4,	0x19A4,	%i1
	movre	%i3,	0x0B8,	%i4
	fcmpgt16	%f12,	%f28,	%g3
	fornot1s	%f3,	%f3,	%f4
	xor	%o3,	%l6,	%o7
	edge16ln	%g1,	%l1,	%g4
	sra	%o6,	0x11,	%i5
	alignaddrl	%i2,	%l3,	%g7
	edge16l	%l5,	%i7,	%l0
	subc	%o0,	0x1EC2,	%l2
	ldsw	[%l7 + 0x34],	%i0
	bshuffle	%f18,	%f14,	%f18
	srl	%g5,	0x1D,	%l4
	sth	%g2,	[%l7 + 0x18]
	ldd	[%l7 + 0x68],	%f26
	movrgz	%o2,	%o5,	%g6
	fmovrslez	%o1,	%f28,	%f3
	subccc	%o4,	0x1526,	%i6
	sir	0x17B5
	addccc	%i3,	0x18A1,	%i1
	popc	0x0429,	%i4
	mulx	%o3,	0x16A9,	%g3
	fmovsvs	%xcc,	%f15,	%f3
	fzero	%f2
	add	%l6,	%g1,	%l1
	orn	%g4,	0x04AA,	%o7
	umul	%o6,	%i2,	%i5
	faligndata	%f10,	%f2,	%f10
	sll	%l3,	%l5,	%g7
	sethi	0x1B95,	%i7
	movrlz	%o0,	0x282,	%l2
	andn	%l0,	0x0405,	%i0
	movgu	%icc,	%l4,	%g2
	edge16l	%o2,	%g5,	%o5
	fnot2s	%f24,	%f16
	sra	%g6,	%o1,	%o4
	ldx	[%l7 + 0x50],	%i6
	movrgez	%i1,	%i3,	%i4
	fmovsne	%icc,	%f28,	%f17
	and	%o3,	%l6,	%g1
	st	%f10,	[%l7 + 0x18]
	nop
	set	0x50, %o7
	lduh	[%l7 + %o7],	%l1
	movgu	%xcc,	%g3,	%g4
	fmovrdgz	%o6,	%f30,	%f26
	lduw	[%l7 + 0x68],	%o7
	movre	%i2,	0x276,	%l3
	array16	%l5,	%g7,	%i7
	nop
	set	0x30, %o2
	lduw	[%l7 + %o2],	%i5
	sethi	0x0C70,	%l2
	move	%icc,	%l0,	%i0
	sub	%o0,	%g2,	%o2
	movre	%g5,	%l4,	%o5
	fmovrdgz	%g6,	%f8,	%f14
	orn	%o1,	0x1151,	%i6
	edge8n	%i1,	%i3,	%i4
	array32	%o3,	%l6,	%g1
	orn	%l1,	%g3,	%g4
	move	%xcc,	%o4,	%o7
	fmovdleu	%xcc,	%f31,	%f24
	sll	%o6,	%l3,	%i2
	movge	%xcc,	%g7,	%i7
	sdivx	%i5,	0x0D10,	%l2
	fabss	%f5,	%f10
	fmovsn	%icc,	%f9,	%f7
	addcc	%l0,	%i0,	%l5
	fsrc2s	%f15,	%f4
	sdiv	%g2,	0x038A,	%o0
	and	%g5,	%l4,	%o5
	or	%o2,	0x0CE8,	%o1
	mova	%xcc,	%g6,	%i1
	movrlz	%i6,	0x1EB,	%i4
	ldd	[%l7 + 0x40],	%f4
	movcc	%xcc,	%i3,	%o3
	ldsw	[%l7 + 0x54],	%g1
	fpack16	%f20,	%f16
	srlx	%l1,	%l6,	%g4
	fmovsge	%icc,	%f25,	%f13
	fmovsn	%xcc,	%f2,	%f4
	ldd	[%l7 + 0x50],	%f26
	fmovsgu	%icc,	%f3,	%f23
	xorcc	%o4,	0x08F7,	%o7
	sir	0x13F4
	fpadd16s	%f23,	%f28,	%f1
	fzero	%f18
	sub	%g3,	%o6,	%l3
	and	%i2,	0x14C9,	%g7
	srlx	%i7,	0x1F,	%i5
	std	%f18,	[%l7 + 0x50]
	fsrc1	%f10,	%f14
	for	%f18,	%f28,	%f20
	movrlez	%l0,	%i0,	%l2
	sdivx	%l5,	0x0E98,	%o0
	movleu	%icc,	%g2,	%l4
	lduw	[%l7 + 0x5C],	%g5
	fpadd16s	%f28,	%f9,	%f30
	alignaddr	%o2,	%o5,	%o1
	alignaddrl	%i1,	%g6,	%i4
	for	%f30,	%f18,	%f6
	fmovspos	%icc,	%f17,	%f20
	udivcc	%i6,	0x0050,	%o3
	array16	%i3,	%l1,	%g1
	subcc	%l6,	%o4,	%g4
	and	%o7,	%g3,	%l3
	pdist	%f8,	%f26,	%f30
	sra	%o6,	%i2,	%i7
	sll	%i5,	%g7,	%l0
	fmovsleu	%xcc,	%f4,	%f17
	andncc	%l2,	%l5,	%i0
	nop
	set	0x40, %g3
	std	%f30,	[%l7 + %g3]
	movvs	%xcc,	%o0,	%l4
	fnor	%f8,	%f28,	%f14
	ldsw	[%l7 + 0x60],	%g5
	addc	%g2,	0x096F,	%o5
	movvs	%xcc,	%o1,	%i1
	movcc	%xcc,	%g6,	%i4
	array32	%o2,	%i6,	%i3
	edge16ln	%o3,	%l1,	%g1
	fmovspos	%icc,	%f27,	%f28
	array16	%o4,	%l6,	%g4
	stb	%g3,	[%l7 + 0x1C]
	fmovdcc	%icc,	%f5,	%f28
	movrgz	%o7,	%o6,	%i2
	edge32ln	%l3,	%i7,	%g7
	add	%l0,	%i5,	%l2
	ldub	[%l7 + 0x6D],	%i0
	udivx	%o0,	0x119E,	%l4
	stw	%g5,	[%l7 + 0x08]
	edge8	%g2,	%l5,	%o1
	mova	%icc,	%o5,	%g6
	edge32l	%i4,	%i1,	%o2
	fmovsne	%xcc,	%f5,	%f10
	srax	%i3,	0x13,	%o3
	ldd	[%l7 + 0x58],	%f10
	sdivx	%i6,	0x1D59,	%g1
	subcc	%l1,	0x1880,	%o4
	orn	%l6,	0x07DB,	%g3
	fandnot1s	%f16,	%f13,	%f6
	edge8n	%g4,	%o7,	%o6
	fmovdcc	%icc,	%f19,	%f28
	movneg	%xcc,	%l3,	%i7
	fmul8x16al	%f11,	%f26,	%f2
	ld	[%l7 + 0x48],	%f3
	siam	0x4
	sllx	%g7,	%i2,	%l0
	movcs	%xcc,	%i5,	%l2
	xor	%i0,	%o0,	%l4
	smulcc	%g5,	0x1A15,	%g2
	restore %l5, %o5, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i4,	0x0083,	%g6
	sllx	%o2,	0x1C,	%i3
	stw	%i1,	[%l7 + 0x50]
	edge8l	%i6,	%o3,	%g1
	orn	%o4,	%l1,	%g3
	nop
	set	0x10, %i1
	stb	%g4,	[%l7 + %i1]
	fmuld8ulx16	%f15,	%f29,	%f4
	smulcc	%l6,	0x0439,	%o6
	save %o7, 0x1468, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i7,	%g7,	%l0
	st	%f2,	[%l7 + 0x0C]
	edge16n	%i5,	%i2,	%i0
	ldx	[%l7 + 0x50],	%o0
	edge16	%l4,	%l2,	%g2
	fmovdle	%xcc,	%f13,	%f27
	subccc	%l5,	0x1F64,	%o5
	ldsw	[%l7 + 0x7C],	%g5
	move	%xcc,	%o1,	%i4
	edge32ln	%g6,	%o2,	%i1
	movcs	%icc,	%i6,	%i3
	array16	%o3,	%g1,	%o4
	fsrc2s	%f10,	%f18
	fmovsle	%icc,	%f21,	%f30
	edge32n	%l1,	%g3,	%g4
	fcmpes	%fcc1,	%f30,	%f12
	orncc	%o6,	%l6,	%o7
	umul	%i7,	0x012F,	%g7
	movl	%xcc,	%l0,	%i5
	fmovdleu	%xcc,	%f15,	%f3
	edge8l	%i2,	%l3,	%i0
	sdivx	%o0,	0x0C0E,	%l4
	smul	%g2,	%l5,	%l2
	std	%f2,	[%l7 + 0x50]
	and	%g5,	0x0177,	%o1
	ldd	[%l7 + 0x70],	%i4
	sth	%g6,	[%l7 + 0x28]
	movrlez	%o5,	0x22D,	%i1
	stb	%i6,	[%l7 + 0x51]
	orcc	%i3,	0x1A08,	%o3
	fzero	%f10
	edge16l	%o2,	%o4,	%g1
	fmovrdgez	%g3,	%f8,	%f14
	orncc	%l1,	0x0F96,	%o6
	movg	%icc,	%g4,	%l6
	srlx	%i7,	0x0B,	%g7
	movleu	%xcc,	%l0,	%i5
	fcmpd	%fcc2,	%f26,	%f28
	movgu	%icc,	%o7,	%l3
	fsrc1s	%f21,	%f5
	sdivcc	%i2,	0x0276,	%i0
	movrgez	%o0,	0x06F,	%g2
	andcc	%l4,	0x0CC1,	%l2
	xorcc	%g5,	0x01B1,	%o1
	srax	%i4,	0x1B,	%g6
	fmovsge	%xcc,	%f18,	%f18
	orn	%o5,	%i1,	%l5
	orcc	%i6,	%i3,	%o2
	or	%o3,	0x0A30,	%o4
	edge16l	%g1,	%g3,	%o6
	array16	%g4,	%l1,	%i7
	movg	%icc,	%g7,	%l0
	lduh	[%l7 + 0x5E],	%l6
	sir	0x16B7
	edge16l	%i5,	%o7,	%l3
	addccc	%i0,	0x01D5,	%o0
	sub	%g2,	0x14D0,	%l4
	edge16	%l2,	%g5,	%o1
	fmul8ulx16	%f26,	%f24,	%f4
	movne	%xcc,	%i2,	%g6
	fmovsl	%icc,	%f16,	%f3
	fcmpes	%fcc2,	%f19,	%f5
	fxors	%f8,	%f5,	%f14
	fcmple32	%f12,	%f20,	%o5
	movge	%icc,	%i1,	%i4
	sethi	0x16D8,	%i6
	fmovdvs	%icc,	%f4,	%f20
	ldub	[%l7 + 0x7B],	%l5
	sdivcc	%i3,	0x17BC,	%o2
	fcmple32	%f28,	%f8,	%o4
	movrne	%g1,	0x252,	%o3
	add	%g3,	%g4,	%l1
	fmovdcs	%xcc,	%f4,	%f28
	array8	%i7,	%g7,	%o6
	fornot2	%f2,	%f30,	%f20
	edge16ln	%l6,	%l0,	%o7
	xorcc	%i5,	%l3,	%o0
	orncc	%i0,	%l4,	%g2
	srl	%l2,	%g5,	%i2
	ldd	[%l7 + 0x18],	%o0
	addccc	%g6,	%o5,	%i1
	fmovsa	%icc,	%f8,	%f23
	umulcc	%i6,	0x11F0,	%i4
	array8	%l5,	%o2,	%o4
	udiv	%g1,	0x124B,	%o3
	lduw	[%l7 + 0x2C],	%g3
	smulcc	%g4,	%l1,	%i7
	fmul8x16al	%f16,	%f18,	%f8
	sub	%g7,	0x1092,	%i3
	edge16ln	%o6,	%l0,	%l6
	movrlez	%o7,	%i5,	%o0
	fone	%f6
	edge32l	%l3,	%i0,	%l4
	fmovrslez	%g2,	%f27,	%f1
	fnands	%f7,	%f15,	%f5
	sra	%l2,	%g5,	%o1
	fxor	%f4,	%f14,	%f2
	edge8n	%i2,	%o5,	%i1
	movrlz	%g6,	%i4,	%i6
	sdiv	%o2,	0x037F,	%o4
	xnor	%l5,	0x1E5C,	%o3
	st	%f12,	[%l7 + 0x74]
	ldx	[%l7 + 0x20],	%g3
	edge8l	%g1,	%g4,	%i7
	subcc	%l1,	0x1CBD,	%g7
	edge32	%i3,	%o6,	%l6
	movne	%icc,	%o7,	%i5
	smulcc	%l0,	0x187A,	%l3
	movn	%xcc,	%i0,	%l4
	save %o0, 0x0360, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%l2,	%o1
	fcmpne32	%f22,	%f22,	%g5
	subcc	%o5,	%i2,	%i1
	udivcc	%g6,	0x1E27,	%i6
	xnor	%o2,	0x0386,	%o4
	srlx	%i4,	0x14,	%l5
	srl	%g3,	%g1,	%o3
	srl	%i7,	%l1,	%g4
	movg	%icc,	%g7,	%i3
	add	%o6,	%o7,	%i5
	addc	%l0,	0x140C,	%l3
	mulx	%l6,	0x18BC,	%l4
	fpackfix	%f14,	%f14
	xor	%i0,	0x177E,	%g2
	array32	%l2,	%o1,	%g5
	fmul8sux16	%f4,	%f20,	%f26
	stx	%o0,	[%l7 + 0x38]
	fmul8sux16	%f30,	%f8,	%f4
	or	%o5,	0x1C06,	%i2
	edge16	%i1,	%i6,	%o2
	fmovrsgez	%g6,	%f19,	%f6
	fmovda	%icc,	%f11,	%f10
	sra	%i4,	0x0C,	%l5
	udiv	%o4,	0x1B19,	%g1
	sdivcc	%g3,	0x15A9,	%o3
	addcc	%i7,	0x1C5F,	%l1
	subc	%g4,	%i3,	%g7
	stx	%o6,	[%l7 + 0x60]
	fpadd32	%f2,	%f22,	%f2
	fmovsne	%xcc,	%f19,	%f1
	fmovdvc	%xcc,	%f13,	%f16
	alignaddrl	%o7,	%l0,	%l3
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	edge32l	%g2,	%l2,	%i0
	fmovrdlz	%g5,	%f24,	%f28
	movvs	%xcc,	%o0,	%o1
	fmovdl	%icc,	%f1,	%f29
	lduw	[%l7 + 0x48],	%i2
	edge32n	%o5,	%i1,	%o2
	movn	%icc,	%g6,	%i6
	sll	%l5,	%o4,	%g1
	fpsub16s	%f17,	%f22,	%f4
	smulcc	%g3,	%i4,	%o3
	array16	%i7,	%l1,	%i3
	array32	%g7,	%g4,	%o7
	xor	%o6,	%l0,	%i5
	fmovrsgez	%l4,	%f20,	%f28
	edge16	%l3,	%g2,	%l6
	edge8	%l2,	%i0,	%o0
	fnot1	%f26,	%f14
	movg	%xcc,	%o1,	%i2
	xnorcc	%o5,	%g5,	%o2
	xor	%g6,	0x15F4,	%i6
	array32	%i1,	%o4,	%g1
	xnor	%g3,	%i4,	%l5
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%f22
	ldub	[%l7 + 0x3E],	%i7
	add	%l1,	%o3,	%g7
	addcc	%g4,	%i3,	%o7
	fxnors	%f24,	%f26,	%f21
	edge8	%o6,	%i5,	%l0
	edge16l	%l3,	%l4,	%g2
	lduh	[%l7 + 0x10],	%l6
	st	%f11,	[%l7 + 0x20]
	edge8n	%i0,	%l2,	%o1
	sub	%i2,	%o0,	%o5
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f28
	ldd	[%l7 + 0x38],	%o2
	sethi	0x1BA4,	%g5
	ldsw	[%l7 + 0x64],	%g6
	movvs	%xcc,	%i6,	%o4
	edge8l	%g1,	%g3,	%i4
	or	%l5,	%i7,	%l1
	array8	%o3,	%i1,	%g4
	fzero	%f0
	andcc	%i3,	%g7,	%o6
	umul	%o7,	%i5,	%l3
	fsrc1	%f2,	%f30
	sub	%l0,	0x0F7A,	%g2
	sdiv	%l6,	0x18FB,	%l4
	srl	%i0,	%l2,	%o1
	subccc	%i2,	%o0,	%o5
	orcc	%o2,	%g6,	%i6
	umul	%o4,	0x080A,	%g5
	movrlez	%g1,	0x14E,	%i4
	movpos	%xcc,	%l5,	%g3
	mulscc	%i7,	0x1415,	%o3
	edge16ln	%i1,	%l1,	%i3
	stx	%g4,	[%l7 + 0x58]
	udivx	%o6,	0x0F13,	%o7
	orncc	%g7,	0x1B55,	%i5
	movcc	%xcc,	%l3,	%g2
	udivcc	%l6,	0x13BE,	%l0
	movrlz	%i0,	%l2,	%o1
	fmovdgu	%xcc,	%f5,	%f0
	addcc	%l4,	%o0,	%o5
	fcmpeq32	%f6,	%f28,	%o2
	edge16	%g6,	%i2,	%o4
	edge16n	%i6,	%g5,	%g1
	sth	%l5,	[%l7 + 0x26]
	restore %g3, 0x0CC3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%o3,	%i1
	movne	%xcc,	%l1,	%i4
	fpadd32s	%f3,	%f23,	%f4
	movn	%icc,	%g4,	%i3
	fcmps	%fcc3,	%f18,	%f7
	fmovrslz	%o6,	%f14,	%f15
	fmuld8sux16	%f12,	%f25,	%f22
	sllx	%o7,	0x0E,	%i5
	alignaddr	%l3,	%g2,	%g7
	movleu	%icc,	%l0,	%l6
	fmovsge	%icc,	%f11,	%f11
	ldx	[%l7 + 0x60],	%i0
	fmovd	%f16,	%f26
	array16	%o1,	%l2,	%l4
	fmovrdgez	%o5,	%f20,	%f0
	stb	%o2,	[%l7 + 0x08]
	fcmpne32	%f18,	%f8,	%o0
	orncc	%g6,	%o4,	%i6
	sethi	0x0314,	%g5
	edge8n	%i2,	%l5,	%g1
	fandnot2	%f6,	%f12,	%f2
	edge32ln	%i7,	%g3,	%i1
	move	%xcc,	%l1,	%o3
	sra	%g4,	%i3,	%i4
	stb	%o6,	[%l7 + 0x0B]
	alignaddrl	%i5,	%l3,	%g2
	save %g7, 0x0E62, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l0,	%l6,	%i0
	edge8	%l2,	%o1,	%o5
	addccc	%o2,	%o0,	%l4
	mulx	%g6,	0x0A67,	%i6
	ldsh	[%l7 + 0x18],	%o4
	orn	%g5,	%i2,	%l5
	fmovrdne	%i7,	%f16,	%f4
	alignaddrl	%g3,	%i1,	%g1
	udivx	%o3,	0x0109,	%l1
	array8	%i3,	%i4,	%o6
	movn	%icc,	%g4,	%i5
	mulx	%l3,	%g2,	%o7
	ldd	[%l7 + 0x28],	%f26
	edge8	%l0,	%g7,	%i0
	mulx	%l6,	0x0ED2,	%l2
	edge8	%o5,	%o2,	%o0
	fmovd	%f8,	%f8
	movne	%icc,	%o1,	%l4
	xorcc	%g6,	%i6,	%g5
	ldsh	[%l7 + 0x54],	%o4
	fcmple32	%f30,	%f30,	%l5
	fmovdpos	%xcc,	%f24,	%f22
	movn	%xcc,	%i7,	%i2
	fmovdne	%icc,	%f23,	%f9
	fmovscs	%icc,	%f29,	%f7
	move	%xcc,	%i1,	%g3
	umulcc	%g1,	0x02FD,	%l1
	edge8ln	%i3,	%i4,	%o3
	smul	%o6,	%g4,	%i5
	fmovrdlez	%g2,	%f8,	%f24
	ldsw	[%l7 + 0x30],	%l3
	movle	%icc,	%l0,	%o7
	srax	%g7,	0x04,	%l6
	fnot2s	%f18,	%f28
	movcs	%icc,	%l2,	%i0
	edge32	%o2,	%o5,	%o0
	fcmple16	%f30,	%f30,	%o1
	sdiv	%g6,	0x1259,	%i6
	srlx	%l4,	%g5,	%o4
	srax	%l5,	%i2,	%i1
	fmovsn	%xcc,	%f12,	%f12
	ldd	[%l7 + 0x58],	%g2
	addccc	%g1,	%i7,	%i3
	fcmpes	%fcc0,	%f4,	%f31
	mova	%xcc,	%i4,	%l1
	smulcc	%o3,	0x1F25,	%o6
	st	%f30,	[%l7 + 0x78]
	fmovdne	%xcc,	%f1,	%f20
	stx	%i5,	[%l7 + 0x70]
	edge8	%g2,	%l3,	%l0
	ldsh	[%l7 + 0x1E],	%o7
	nop
	set	0x5A, %l2
	lduh	[%l7 + %l2],	%g7
	andncc	%l6,	%g4,	%l2
	fornot2s	%f4,	%f29,	%f7
	fcmpgt32	%f12,	%f18,	%i0
	umul	%o5,	0x113F,	%o0
	edge8n	%o2,	%g6,	%o1
	add	%i6,	0x1696,	%g5
	sdivcc	%o4,	0x123D,	%l4
	andn	%i2,	%i1,	%g3
	movne	%icc,	%g1,	%l5
	stb	%i7,	[%l7 + 0x49]
	srlx	%i4,	%i3,	%l1
	sll	%o3,	%i5,	%o6
	edge16	%g2,	%l3,	%o7
	orcc	%l0,	%l6,	%g4
	stb	%l2,	[%l7 + 0x29]
	sllx	%g7,	%o5,	%o0
	add	%o2,	0x1A52,	%g6
	array8	%o1,	%i6,	%g5
	movcc	%xcc,	%o4,	%i0
	fxor	%f14,	%f12,	%f0
	sdivcc	%l4,	0x1963,	%i1
	movl	%xcc,	%g3,	%g1
	orncc	%l5,	%i2,	%i4
	udiv	%i3,	0x0414,	%i7
	movrlez	%l1,	%o3,	%i5
	movneg	%xcc,	%g2,	%o6
	fpsub32	%f24,	%f22,	%f14
	ldx	[%l7 + 0x10],	%o7
	edge8n	%l3,	%l6,	%l0
	fmovrslez	%l2,	%f24,	%f31
	stw	%g4,	[%l7 + 0x08]
	movpos	%icc,	%g7,	%o5
	array16	%o2,	%o0,	%o1
	array8	%g6,	%g5,	%i6
	edge16l	%o4,	%l4,	%i1
	fcmpne16	%f20,	%f4,	%i0
	sdivx	%g3,	0x10B8,	%g1
	andncc	%i2,	%i4,	%i3
	edge8ln	%i7,	%l1,	%o3
	movre	%i5,	%g2,	%l5
	srl	%o6,	%l3,	%o7
	movrlz	%l6,	0x2E1,	%l2
	umul	%l0,	%g4,	%g7
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	stb	%o5,	[%l7 + 0x74]
	edge8	%o1,	%g6,	%g5
	srax	%o4,	%l4,	%i6
	sth	%i0,	[%l7 + 0x28]
	fabss	%f28,	%f29
	fsrc2	%f4,	%f26
	fmovdcs	%xcc,	%f8,	%f14
	ldsw	[%l7 + 0x1C],	%g3
	addcc	%i1,	0x1566,	%g1
	fmovsn	%xcc,	%f3,	%f22
	movre	%i2,	0x0E9,	%i4
	sdivcc	%i3,	0x132A,	%i7
	srl	%o3,	%i5,	%g2
	fmovrdne	%l1,	%f22,	%f20
	movneg	%icc,	%o6,	%l5
	fcmpne16	%f4,	%f20,	%o7
	fmovdle	%xcc,	%f18,	%f26
	andn	%l6,	0x1BF4,	%l3
	fmovdg	%xcc,	%f8,	%f17
	addccc	%l2,	%l0,	%g4
	sllx	%g7,	%o2,	%o5
	fpmerge	%f9,	%f22,	%f18
	nop
	set	0x4D, %i3
	ldub	[%l7 + %i3],	%o1
	srl	%o0,	%g6,	%g5
	stw	%o4,	[%l7 + 0x58]
	alignaddrl	%i6,	%i0,	%l4
	fones	%f2
	ldsh	[%l7 + 0x5E],	%g3
	sdiv	%i1,	0x0911,	%g1
	lduh	[%l7 + 0x08],	%i4
	edge16n	%i3,	%i7,	%i2
	sllx	%o3,	0x17,	%i5
	sth	%l1,	[%l7 + 0x60]
	fmul8x16au	%f26,	%f1,	%f10
	sethi	0x124A,	%o6
	ld	[%l7 + 0x38],	%f16
	movneg	%xcc,	%g2,	%l5
	sra	%o7,	%l6,	%l2
	orn	%l3,	0x1E84,	%l0
	umulcc	%g7,	0x1A3B,	%g4
	andncc	%o5,	%o2,	%o1
	movcc	%icc,	%o0,	%g6
	ldx	[%l7 + 0x18],	%o4
	fabss	%f31,	%f9
	movle	%icc,	%i6,	%i0
	fsrc1s	%f13,	%f6
	movrlez	%l4,	0x1BD,	%g5
	addc	%g3,	%g1,	%i1
	sth	%i3,	[%l7 + 0x34]
	movleu	%xcc,	%i4,	%i2
	orncc	%i7,	0x1CAF,	%i5
	array32	%o3,	%l1,	%g2
	fpadd32	%f8,	%f2,	%f4
	array8	%l5,	%o7,	%l6
	fmovrse	%l2,	%f16,	%f3
	movrlz	%l3,	0x32E,	%o6
	ldsb	[%l7 + 0x76],	%l0
	addc	%g7,	%o5,	%g4
	add	%o2,	0x00B9,	%o1
	ldd	[%l7 + 0x58],	%f8
	smul	%g6,	0x1A73,	%o4
	sub	%o0,	0x0E57,	%i0
	alignaddrl	%l4,	%i6,	%g5
	mova	%xcc,	%g3,	%g1
	edge8l	%i1,	%i4,	%i3
	xnor	%i7,	%i2,	%i5
	nop
	set	0x34, %l1
	lduh	[%l7 + %l1],	%o3
	xnorcc	%g2,	%l1,	%o7
	udiv	%l6,	0x1AC5,	%l5
	sir	0x0B91
	subccc	%l2,	0x1BD5,	%l3
	srlx	%o6,	%g7,	%o5
	mulx	%g4,	%o2,	%l0
	save %g6, %o1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i0,	0x0E1C,	%o0
	subcc	%l4,	0x1026,	%g5
	xnor	%g3,	0x037A,	%g1
	addc	%i1,	%i4,	%i3
	fmovdg	%xcc,	%f30,	%f26
	lduw	[%l7 + 0x60],	%i6
	ldsh	[%l7 + 0x42],	%i7
	xor	%i5,	%i2,	%g2
	fexpand	%f30,	%f8
	movgu	%icc,	%l1,	%o7
	array32	%l6,	%o3,	%l2
	fandnot2	%f22,	%f10,	%f26
	edge16l	%l3,	%o6,	%g7
	sth	%o5,	[%l7 + 0x7E]
	ld	[%l7 + 0x28],	%f10
	sir	0x1753
	movpos	%icc,	%l5,	%o2
	array16	%g4,	%g6,	%l0
	sth	%o1,	[%l7 + 0x6A]
	fmovrse	%o4,	%f17,	%f13
	movge	%xcc,	%o0,	%l4
	fmovrsgz	%i0,	%f26,	%f6
	xnor	%g3,	%g1,	%i1
	sra	%g5,	%i4,	%i6
	andcc	%i3,	0x08BA,	%i7
	fsrc1	%f28,	%f30
	fpadd16	%f0,	%f20,	%f14
	movneg	%xcc,	%i5,	%i2
	sdiv	%l1,	0x10BE,	%o7
	orn	%g2,	%l6,	%o3
	ldsb	[%l7 + 0x0C],	%l3
	fnot1s	%f31,	%f12
	add	%l2,	0x1E3D,	%g7
	fxnors	%f14,	%f29,	%f18
	xorcc	%o5,	0x1FD5,	%l5
	fmovsl	%xcc,	%f28,	%f13
	movrgz	%o2,	%g4,	%o6
	ldx	[%l7 + 0x28],	%l0
	addccc	%g6,	%o1,	%o0
	movvs	%xcc,	%o4,	%i0
	sir	0x01E8
	edge32ln	%g3,	%g1,	%l4
	fcmpgt32	%f22,	%f28,	%i1
	movvs	%xcc,	%g5,	%i6
	ldsb	[%l7 + 0x1E],	%i4
	movleu	%icc,	%i3,	%i5
	movg	%xcc,	%i7,	%l1
	srl	%i2,	0x07,	%g2
	sdivcc	%l6,	0x1632,	%o7
	addcc	%l3,	%l2,	%g7
	fmovsle	%xcc,	%f8,	%f25
	movcc	%icc,	%o5,	%l5
	andcc	%o3,	%o2,	%g4
	alignaddrl	%o6,	%l0,	%o1
	fmovdge	%icc,	%f24,	%f22
	srlx	%g6,	%o0,	%o4
	movneg	%xcc,	%g3,	%g1
	fmovdn	%xcc,	%f20,	%f10
	andcc	%i0,	0x0ACD,	%l4
	movne	%xcc,	%i1,	%g5
	subc	%i6,	0x0286,	%i3
	xorcc	%i4,	%i7,	%i5
	fmovda	%xcc,	%f6,	%f17
	edge8n	%i2,	%g2,	%l1
	movvs	%icc,	%o7,	%l3
	fone	%f12
	sllx	%l6,	%l2,	%o5
	udivcc	%l5,	0x134D,	%o3
	fmovspos	%icc,	%f21,	%f2
	subcc	%o2,	0x0768,	%g4
	lduw	[%l7 + 0x70],	%g7
	sethi	0x11B4,	%o6
	movrlz	%o1,	%l0,	%g6
	movrlz	%o0,	%g3,	%o4
	std	%f22,	[%l7 + 0x20]
	movvs	%xcc,	%i0,	%l4
	fmovsneg	%xcc,	%f11,	%f0
	fcmps	%fcc3,	%f23,	%f13
	movre	%i1,	0x0B0,	%g5
	movcs	%xcc,	%g1,	%i6
	srlx	%i3,	%i4,	%i7
	andcc	%i5,	0x1144,	%i2
	edge32l	%l1,	%o7,	%g2
	array32	%l6,	%l2,	%o5
	smulcc	%l5,	%l3,	%o2
	movcs	%xcc,	%o3,	%g4
	umulcc	%o6,	0x11AB,	%g7
	ldub	[%l7 + 0x35],	%l0
	restore %o1, 0x1435, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g6,	%o4,	%i0
	sdivcc	%g3,	0x0319,	%i1
	stw	%l4,	[%l7 + 0x48]
	xnorcc	%g5,	0x18B9,	%i6
	srlx	%g1,	0x1B,	%i4
	movg	%xcc,	%i7,	%i5
	ldx	[%l7 + 0x50],	%i2
	popc	0x0FB3,	%i3
	udiv	%l1,	0x053E,	%g2
	fmovrdgez	%o7,	%f10,	%f26
	edge32n	%l2,	%l6,	%l5
	sdiv	%o5,	0x0B09,	%o2
	addcc	%o3,	0x0B92,	%l3
	andncc	%g4,	%o6,	%l0
	for	%f14,	%f16,	%f2
	orncc	%g7,	0x10E3,	%o0
	std	%f24,	[%l7 + 0x78]
	umul	%g6,	0x0C86,	%o4
	xor	%i0,	0x109F,	%g3
	array8	%i1,	%l4,	%o1
	udivcc	%g5,	0x0D8E,	%i6
	st	%f31,	[%l7 + 0x24]
	move	%icc,	%i4,	%i7
	sdivcc	%g1,	0x0B11,	%i2
	add	%i5,	%i3,	%l1
	movn	%xcc,	%g2,	%o7
	fnot2	%f16,	%f12
	movvc	%icc,	%l6,	%l2
	movrgz	%o5,	0x16C,	%o2
	orcc	%o3,	0x1D1F,	%l3
	sll	%g4,	%l5,	%l0
	fcmped	%fcc0,	%f4,	%f14
	edge32ln	%g7,	%o0,	%o6
	movvs	%icc,	%g6,	%o4
	stw	%i0,	[%l7 + 0x74]
	fmovsne	%xcc,	%f3,	%f20
	andncc	%i1,	%l4,	%o1
	std	%f30,	[%l7 + 0x08]
	andcc	%g5,	%i6,	%g3
	sth	%i7,	[%l7 + 0x08]
	andncc	%g1,	%i2,	%i5
	sth	%i4,	[%l7 + 0x32]
	fsrc1s	%f29,	%f22
	orcc	%l1,	%g2,	%i3
	save %o7, %l2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f28,	%f31
	ldub	[%l7 + 0x54],	%o2
	edge32ln	%l6,	%o3,	%l3
	pdist	%f10,	%f14,	%f18
	orcc	%g4,	0x1C31,	%l5
	fmovrdne	%l0,	%f22,	%f14
	save %g7, 0x02F5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g6,	0x1D39,	%o0
	umulcc	%o4,	0x0D73,	%i1
	ld	[%l7 + 0x14],	%f2
	fsrc1	%f2,	%f4
	movvc	%icc,	%i0,	%l4
	sethi	0x01B2,	%o1
	fexpand	%f25,	%f8
	sdivcc	%i6,	0x10C9,	%g3
	ldd	[%l7 + 0x58],	%i6
	srlx	%g1,	0x0C,	%g5
	fandnot2	%f12,	%f0,	%f26
	sub	%i2,	0x07D6,	%i4
	save %i5, 0x1C6A, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x66],	%l1
	fmovsleu	%icc,	%f17,	%f3
	add	%o7,	0x1743,	%l2
	fandnot1s	%f17,	%f29,	%f14
	fnegs	%f26,	%f24
	edge32ln	%o5,	%i3,	%l6
	fmovscc	%icc,	%f27,	%f24
	orncc	%o2,	%o3,	%l3
	lduw	[%l7 + 0x7C],	%l5
	movneg	%xcc,	%l0,	%g7
	smul	%g4,	0x0505,	%o6
	move	%xcc,	%o0,	%o4
	ldsw	[%l7 + 0x30],	%i1
	sra	%g6,	0x1A,	%i0
	lduw	[%l7 + 0x24],	%o1
	faligndata	%f22,	%f0,	%f22
	edge32n	%l4,	%i6,	%i7
	fmovdle	%icc,	%f23,	%f22
	mulscc	%g1,	0x06F3,	%g5
	movre	%i2,	0x141,	%i4
	sth	%g3,	[%l7 + 0x34]
	save %i5, 0x0952, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l1,	%l2,	%o7
	fornot2	%f26,	%f16,	%f20
	subcc	%i3,	0x154C,	%o5
	mulscc	%l6,	%o3,	%l3
	st	%f17,	[%l7 + 0x2C]
	sll	%l5,	%o2,	%g7
	umulcc	%l0,	%o6,	%g4
	srlx	%o4,	0x08,	%i1
	srlx	%o0,	0x0D,	%i0
	movrlz	%o1,	%l4,	%i6
	fcmple32	%f14,	%f6,	%g6
	stx	%i7,	[%l7 + 0x38]
	movl	%icc,	%g5,	%i2
	std	%f4,	[%l7 + 0x60]
	srl	%i4,	%g1,	%i5
	movle	%icc,	%g2,	%l1
	edge8n	%g3,	%l2,	%i3
	fmovrslez	%o5,	%f30,	%f3
	orcc	%l6,	0x00C2,	%o3
	fmovdleu	%xcc,	%f28,	%f17
	sra	%o7,	%l5,	%l3
	sub	%o2,	0x1B54,	%l0
	fsrc1	%f0,	%f14
	ldx	[%l7 + 0x50],	%g7
	stw	%g4,	[%l7 + 0x28]
	andcc	%o6,	0x1528,	%i1
	lduh	[%l7 + 0x2A],	%o0
	movn	%icc,	%o4,	%o1
	umul	%i0,	0x1FB1,	%i6
	fmovdpos	%icc,	%f6,	%f7
	xor	%g6,	%i7,	%l4
	and	%g5,	%i2,	%i4
	alignaddrl	%i5,	%g2,	%l1
	edge32ln	%g1,	%g3,	%i3
	srax	%l2,	0x0D,	%o5
	movrgez	%o3,	0x247,	%l6
	umul	%l5,	0x1E40,	%o7
	andcc	%o2,	%l3,	%g7
	movg	%xcc,	%l0,	%o6
	sir	0x18AA
	movre	%i1,	0x3B4,	%o0
	fandnot2s	%f24,	%f13,	%f28
	fmovs	%f12,	%f7
	lduh	[%l7 + 0x5E],	%g4
	movn	%icc,	%o1,	%o4
	sdivcc	%i0,	0x119B,	%g6
	movg	%icc,	%i7,	%l4
	andn	%i6,	0x0374,	%i2
	array16	%g5,	%i5,	%i4
	ld	[%l7 + 0x0C],	%f17
	umul	%g2,	%g1,	%g3
	array32	%l1,	%i3,	%o5
	sdivcc	%l2,	0x1872,	%l6
	sra	%l5,	0x0D,	%o3
	array32	%o2,	%o7,	%g7
	sir	0x02DF
	edge32n	%l0,	%o6,	%l3
	xor	%o0,	%i1,	%o1
	movcs	%xcc,	%o4,	%i0
	orn	%g6,	%i7,	%l4
	movcs	%xcc,	%g4,	%i6
	std	%f4,	[%l7 + 0x58]
	fnor	%f18,	%f16,	%f4
	alignaddrl	%i2,	%g5,	%i4
	fexpand	%f5,	%f10
	orncc	%i5,	0x0B68,	%g1
	umulcc	%g2,	0x0F70,	%l1
	edge8ln	%i3,	%o5,	%g3
	xnor	%l6,	%l5,	%o3
	andn	%l2,	0x1936,	%o2
	fmovsn	%icc,	%f3,	%f8
	movne	%xcc,	%o7,	%g7
	move	%icc,	%o6,	%l0
	edge16ln	%l3,	%i1,	%o0
	subccc	%o1,	0x1F87,	%o4
	subc	%i0,	%g6,	%i7
	movvs	%icc,	%g4,	%l4
	mulx	%i6,	%i2,	%i4
	movleu	%xcc,	%i5,	%g1
	movrgez	%g5,	0x03A,	%g2
	move	%icc,	%l1,	%i3
	alignaddrl	%g3,	%o5,	%l5
	srlx	%o3,	%l2,	%l6
	ldsh	[%l7 + 0x2C],	%o2
	srlx	%g7,	0x1E,	%o7
	ldsh	[%l7 + 0x62],	%o6
	addcc	%l0,	%l3,	%i1
	addcc	%o0,	%o1,	%i0
	srlx	%g6,	0x0A,	%i7
	movcc	%xcc,	%g4,	%o4
	smulcc	%l4,	%i6,	%i4
	sdivx	%i5,	0x1212,	%g1
	mulscc	%g5,	0x1E98,	%i2
	fcmps	%fcc1,	%f13,	%f0
	faligndata	%f20,	%f28,	%f12
	stw	%l1,	[%l7 + 0x70]
	subc	%i3,	%g2,	%o5
	edge32ln	%g3,	%o3,	%l2
	array16	%l6,	%o2,	%g7
	fcmple16	%f30,	%f28,	%o7
	fmovsvs	%xcc,	%f0,	%f15
	fcmpd	%fcc3,	%f2,	%f4
	edge32ln	%l5,	%o6,	%l3
	stw	%l0,	[%l7 + 0x24]
	fpack32	%f20,	%f4,	%f18
	ldd	[%l7 + 0x70],	%o0
	pdist	%f6,	%f30,	%f12
	edge16ln	%i1,	%i0,	%o1
	mulx	%i7,	%g6,	%g4
	sir	0x0B89
	andcc	%l4,	%o4,	%i6
	add	%i4,	%i5,	%g1
	add	%g5,	%l1,	%i3
	pdist	%f16,	%f2,	%f10
	fandnot2	%f12,	%f6,	%f0
	fmovdgu	%xcc,	%f5,	%f0
	or	%g2,	0x1802,	%i2
	movg	%xcc,	%o5,	%o3
	subccc	%g3,	0x12A9,	%l2
	ldd	[%l7 + 0x60],	%i6
	xnorcc	%g7,	0x18B0,	%o2
	movvs	%xcc,	%o7,	%o6
	fmovdcc	%xcc,	%f30,	%f28
	fmovrdlz	%l3,	%f24,	%f6
	orncc	%l0,	0x1420,	%o0
	sethi	0x1D57,	%i1
	addccc	%i0,	%l5,	%o1
	stx	%i7,	[%l7 + 0x70]
	edge32n	%g6,	%l4,	%g4
	sra	%o4,	%i4,	%i5
	st	%f20,	[%l7 + 0x14]
	fmovsg	%icc,	%f2,	%f1
	array32	%i6,	%g5,	%l1
	subcc	%g1,	%i3,	%g2
	fpmerge	%f5,	%f12,	%f30
	udivx	%o5,	0x136C,	%i2
	fcmple16	%f2,	%f8,	%o3
	ldd	[%l7 + 0x68],	%f16
	edge16l	%l2,	%g3,	%l6
	xorcc	%g7,	%o7,	%o6
	add	%o2,	%l0,	%o0
	lduw	[%l7 + 0x3C],	%i1
	umul	%i0,	%l5,	%l3
	fmovsg	%icc,	%f21,	%f4
	xor	%o1,	%i7,	%l4
	fcmple32	%f14,	%f16,	%g6
	edge32ln	%o4,	%i4,	%g4
	fmovsleu	%icc,	%f20,	%f6
	sll	%i5,	%g5,	%l1
	fpmerge	%f4,	%f12,	%f24
	sll	%i6,	0x1D,	%g1
	movgu	%xcc,	%i3,	%o5
	sdivx	%g2,	0x0DD9,	%i2
	fpack32	%f20,	%f4,	%f22
	edge16	%l2,	%g3,	%o3
	stx	%l6,	[%l7 + 0x08]
	popc	0x0428,	%o7
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	movg	%icc,	%o0,	%i1
	movre	%i0,	0x123,	%o2
	st	%f28,	[%l7 + 0x38]
	or	%l3,	%l5,	%i7
	alignaddrl	%o1,	%l4,	%g6
	xnor	%o4,	0x01B4,	%g4
	stx	%i4,	[%l7 + 0x40]
	subc	%i5,	%g5,	%i6
	fnands	%f1,	%f29,	%f14
	fsrc1s	%f23,	%f26
	umulcc	%g1,	0x1D58,	%l1
	mulscc	%i3,	0x1A82,	%g2
	fpsub16	%f8,	%f8,	%f28
	fpackfix	%f14,	%f8
	movl	%xcc,	%i2,	%l2
	mulx	%o5,	%o3,	%g3
	srax	%l6,	%o7,	%g7
	edge32n	%l0,	%o0,	%i1
	ldd	[%l7 + 0x48],	%i0
	edge16n	%o2,	%l3,	%o6
	movle	%icc,	%i7,	%o1
	xnor	%l4,	%l5,	%g6
	sub	%g4,	0x1CBA,	%o4
	fmovse	%icc,	%f5,	%f17
	ldx	[%l7 + 0x60],	%i4
	ldd	[%l7 + 0x28],	%i4
	fcmps	%fcc2,	%f16,	%f29
	addcc	%g5,	0x13B3,	%i6
	umul	%g1,	0x18E9,	%i3
	sdivx	%l1,	0x0A58,	%i2
	orncc	%g2,	0x12EA,	%o5
	sra	%o3,	%g3,	%l6
	fmovdgu	%xcc,	%f7,	%f24
	ldd	[%l7 + 0x70],	%l2
	sir	0x0F63
	srax	%o7,	%l0,	%o0
	movn	%icc,	%g7,	%i0
	movge	%icc,	%o2,	%l3
	nop
	set	0x22, %o0
	sth	%i1,	[%l7 + %o0]
	edge8	%i7,	%o1,	%o6
	edge8	%l5,	%g6,	%l4
	fcmpeq16	%f28,	%f4,	%o4
	array16	%g4,	%i5,	%g5
	srl	%i6,	%g1,	%i4
	faligndata	%f20,	%f22,	%f30
	srax	%i3,	%i2,	%l1
	edge8ln	%o5,	%o3,	%g3
	movvs	%icc,	%g2,	%l2
	edge32ln	%o7,	%l6,	%l0
	fcmpeq32	%f6,	%f24,	%g7
	subccc	%o0,	%o2,	%i0
	edge8l	%l3,	%i1,	%i7
	sethi	0x12F3,	%o1
	ldsw	[%l7 + 0x5C],	%l5
	smul	%o6,	%g6,	%l4
	addc	%o4,	0x0DE3,	%i5
	movrlz	%g5,	%i6,	%g4
	addcc	%i4,	0x1D85,	%i3
	fmovsa	%xcc,	%f11,	%f7
	fnot2	%f26,	%f12
	stb	%g1,	[%l7 + 0x5E]
	fnand	%f8,	%f14,	%f8
	subc	%i2,	0x1C5E,	%o5
	movpos	%icc,	%l1,	%o3
	edge8n	%g2,	%g3,	%l2
	fandnot1s	%f1,	%f6,	%f11
	fcmpd	%fcc1,	%f2,	%f10
	ldd	[%l7 + 0x30],	%o6
	fornot2s	%f8,	%f29,	%f17
	mova	%xcc,	%l6,	%l0
	fmovdgu	%xcc,	%f17,	%f26
	sll	%g7,	0x1E,	%o2
	edge32l	%i0,	%o0,	%i1
	fandnot1	%f20,	%f14,	%f8
	mulscc	%l3,	%i7,	%l5
	fsrc2	%f22,	%f4
	sllx	%o1,	0x00,	%g6
	fmovsneg	%xcc,	%f14,	%f17
	ldsw	[%l7 + 0x08],	%l4
	edge16	%o6,	%i5,	%g5
	xorcc	%o4,	%g4,	%i6
	array8	%i3,	%g1,	%i2
	smul	%i4,	0x0EAF,	%o5
	edge8	%o3,	%g2,	%g3
	ldd	[%l7 + 0x58],	%f4
	fmuld8sux16	%f2,	%f7,	%f2
	ldd	[%l7 + 0x20],	%f8
	subccc	%l1,	%o7,	%l6
	edge8	%l2,	%g7,	%o2
	movle	%icc,	%i0,	%o0
	edge8	%i1,	%l3,	%l0
	edge32	%l5,	%o1,	%g6
	save %l4, 0x17C1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f24,	%f8,	%f18
	subccc	%o6,	%g5,	%i5
	movrne	%g4,	%o4,	%i6
	movre	%i3,	0x34F,	%g1
	alignaddrl	%i2,	%o5,	%i4
	stb	%o3,	[%l7 + 0x42]
	nop
	set	0x0C, %i4
	lduw	[%l7 + %i4],	%g3
	movcc	%xcc,	%l1,	%o7
	stb	%g2,	[%l7 + 0x0C]
	fmovsleu	%icc,	%f12,	%f12
	sdivcc	%l6,	0x0625,	%l2
	ldsw	[%l7 + 0x14],	%o2
	st	%f16,	[%l7 + 0x44]
	mova	%xcc,	%i0,	%g7
	addc	%o0,	0x134F,	%i1
	srlx	%l3,	%l5,	%o1
	subcc	%g6,	%l4,	%i7
	udivcc	%o6,	0x120F,	%l0
	addccc	%i5,	%g5,	%g4
	fsrc1s	%f28,	%f4
	addcc	%i6,	%i3,	%o4
	fcmpd	%fcc1,	%f0,	%f14
	fandnot1	%f28,	%f16,	%f10
	ldd	[%l7 + 0x10],	%f4
	edge32l	%i2,	%g1,	%o5
	movcs	%xcc,	%o3,	%g3
	or	%i4,	0x1955,	%l1
	udivcc	%g2,	0x0C67,	%o7
	fmovrse	%l2,	%f22,	%f29
	array8	%o2,	%l6,	%g7
	subcc	%i0,	0x1071,	%o0
	array16	%l3,	%i1,	%l5
	andcc	%g6,	0x0C51,	%o1
	xorcc	%l4,	%o6,	%l0
	fandnot2	%f6,	%f10,	%f6
	sdivx	%i5,	0x01BC,	%g5
	movle	%icc,	%i7,	%i6
	sdivx	%i3,	0x1CC1,	%g4
	sdiv	%o4,	0x17A7,	%g1
	st	%f26,	[%l7 + 0x48]
	sdivcc	%o5,	0x1BD9,	%i2
	movcs	%xcc,	%g3,	%i4
	xorcc	%l1,	0x130B,	%o3
	sethi	0x1ABD,	%g2
	std	%f22,	[%l7 + 0x58]
	move	%xcc,	%o7,	%l2
	ldsw	[%l7 + 0x2C],	%l6
	srlx	%o2,	0x03,	%i0
	movneg	%xcc,	%g7,	%l3
	movcs	%xcc,	%o0,	%i1
	fcmple16	%f30,	%f6,	%g6
	addc	%o1,	0x1DAD,	%l4
	array8	%o6,	%l0,	%i5
	fnot2s	%f30,	%f25
	st	%f1,	[%l7 + 0x28]
	fmovd	%f26,	%f12
	movvc	%xcc,	%g5,	%i7
	edge8l	%i6,	%l5,	%g4
	subcc	%o4,	%g1,	%o5
	fmovrse	%i3,	%f1,	%f12
	edge16ln	%g3,	%i4,	%l1
	udiv	%i2,	0x00DA,	%o3
	sth	%g2,	[%l7 + 0x7E]
	fcmpgt16	%f2,	%f24,	%o7
	srl	%l2,	0x1F,	%o2
	movrne	%i0,	0x22A,	%g7
	ldsw	[%l7 + 0x0C],	%l3
	smulcc	%l6,	%o0,	%g6
	ldx	[%l7 + 0x58],	%o1
	save %l4, %o6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f20,	%f30
	restore %i1, %g5, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f10,	%f10
	addccc	%i6,	%i7,	%g4
	sllx	%l5,	%o4,	%g1
	ldsh	[%l7 + 0x74],	%i3
	movleu	%icc,	%o5,	%g3
	edge8ln	%i4,	%i2,	%o3
	edge8l	%l1,	%o7,	%l2
	srlx	%o2,	0x1C,	%g2
	udivcc	%g7,	0x0974,	%i0
	ldd	[%l7 + 0x18],	%f14
	fornot2s	%f14,	%f3,	%f11
	sth	%l6,	[%l7 + 0x4C]
	movrgz	%o0,	%g6,	%o1
	movg	%xcc,	%l4,	%o6
	udivcc	%l3,	0x0138,	%i1
	edge8l	%l0,	%i5,	%i6
	movle	%xcc,	%g5,	%g4
	fpsub16s	%f9,	%f10,	%f7
	sra	%i7,	%l5,	%o4
	udiv	%i3,	0x0610,	%o5
	movn	%icc,	%g3,	%i4
	sth	%g1,	[%l7 + 0x2C]
	save %o3, %i2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l2,	0x0A1B,	%l1
	movvs	%icc,	%g2,	%o2
	addc	%i0,	0x07B4,	%g7
	fmovdn	%xcc,	%f2,	%f5
	sra	%l6,	0x02,	%o0
	stb	%g6,	[%l7 + 0x78]
	udiv	%l4,	0x09A9,	%o1
	sra	%o6,	%i1,	%l3
	ldsh	[%l7 + 0x3C],	%l0
	subcc	%i6,	%i5,	%g5
	fmovrdlz	%g4,	%f30,	%f10
	fmovda	%icc,	%f3,	%f6
	udivcc	%l5,	0x078C,	%i7
	fmul8sux16	%f12,	%f2,	%f4
	fandnot1s	%f8,	%f4,	%f5
	fandnot2s	%f29,	%f29,	%f26
	edge32ln	%o4,	%o5,	%i3
	addccc	%i4,	0x006C,	%g3
	fxnor	%f8,	%f16,	%f8
	fnot1	%f14,	%f30
	xnorcc	%g1,	0x0E97,	%i2
	edge16n	%o7,	%o3,	%l2
	nop
	set	0x38, %g4
	ldsh	[%l7 + %g4],	%l1
	fmovdvs	%xcc,	%f25,	%f2
	sdiv	%g2,	0x18FA,	%i0
	sub	%o2,	0x124B,	%g7
	edge8n	%o0,	%g6,	%l4
	fpsub16s	%f11,	%f0,	%f26
	fmovse	%icc,	%f25,	%f10
	edge16	%l6,	%o1,	%i1
	ldsh	[%l7 + 0x5E],	%l3
	smulcc	%o6,	0x1BF1,	%l0
	sir	0x0771
	movpos	%xcc,	%i6,	%i5
	ldsh	[%l7 + 0x52],	%g5
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	edge16	%o4,	%o5,	%i3
	st	%f20,	[%l7 + 0x24]
	xnor	%i7,	%g3,	%g1
	movre	%i2,	%i4,	%o7
	movvs	%icc,	%o3,	%l2
	smul	%g2,	%l1,	%o2
	sub	%g7,	%o0,	%g6
	fmovdne	%icc,	%f20,	%f31
	edge8ln	%l4,	%i0,	%o1
	ldsb	[%l7 + 0x5B],	%l6
	nop
	set	0x40, %l6
	ldx	[%l7 + %l6],	%l3
	lduh	[%l7 + 0x12],	%o6
	mulscc	%l0,	0x0514,	%i6
	edge8	%i5,	%g5,	%i1
	stw	%l5,	[%l7 + 0x10]
	fornot1s	%f22,	%f25,	%f9
	ldd	[%l7 + 0x08],	%o4
	srax	%g4,	0x12,	%o5
	fxnor	%f24,	%f18,	%f0
	xnorcc	%i3,	0x0C49,	%i7
	fnands	%f5,	%f27,	%f27
	std	%f2,	[%l7 + 0x70]
	fmovdgu	%xcc,	%f13,	%f4
	ld	[%l7 + 0x18],	%f11
	save %g3, 0x14E1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g1,	0x1EC7,	%i4
	udivx	%o3,	0x1E7C,	%l2
	fmovdvc	%icc,	%f28,	%f21
	udiv	%o7,	0x1461,	%g2
	orncc	%l1,	%o2,	%g7
	movgu	%xcc,	%o0,	%g6
	popc	%l4,	%i0
	st	%f11,	[%l7 + 0x40]
	fcmpeq32	%f8,	%f26,	%l6
	edge8l	%o1,	%l3,	%l0
	sra	%o6,	0x03,	%i6
	nop
	set	0x68, %l0
	ldd	[%l7 + %l0],	%f18
	fnors	%f0,	%f26,	%f21
	movn	%icc,	%i5,	%g5
	srl	%l5,	0x0E,	%o4
	fandnot2s	%f15,	%f22,	%f7
	for	%f12,	%f18,	%f8
	mova	%xcc,	%i1,	%o5
	fmovdvs	%icc,	%f7,	%f27
	ldd	[%l7 + 0x48],	%i2
	siam	0x7
	edge8l	%g4,	%g3,	%i7
	movrlez	%i2,	%i4,	%o3
	edge8	%l2,	%o7,	%g1
	smulcc	%l1,	0x1040,	%o2
	std	%f8,	[%l7 + 0x08]
	orcc	%g7,	%g2,	%o0
	srax	%l4,	0x08,	%i0
	fmovs	%f25,	%f12
	orcc	%l6,	%g6,	%o1
	subccc	%l0,	%o6,	%i6
	fmovrdlz	%i5,	%f10,	%f16
	movrlz	%g5,	%l3,	%o4
	fpsub16	%f12,	%f14,	%f8
	fmul8x16al	%f29,	%f24,	%f20
	fmul8x16	%f1,	%f0,	%f0
	fmul8sux16	%f4,	%f16,	%f0
	smulcc	%i1,	0x18FA,	%l5
	edge8n	%i3,	%g4,	%o5
	xor	%i7,	%g3,	%i4
	ldub	[%l7 + 0x12],	%i2
	sra	%l2,	%o7,	%o3
	edge8n	%g1,	%l1,	%o2
	ldsb	[%l7 + 0x56],	%g7
	fmovdgu	%xcc,	%f6,	%f21
	andn	%g2,	%l4,	%o0
	fmovdge	%icc,	%f30,	%f2
	edge32	%i0,	%l6,	%o1
	array32	%g6,	%l0,	%o6
	fsrc2	%f14,	%f30
	subccc	%i5,	%g5,	%l3
	movge	%xcc,	%i6,	%i1
	ldsb	[%l7 + 0x5E],	%o4
	restore %i3, 0x12BC, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f14
	fcmpgt32	%f16,	%f30,	%g4
	lduw	[%l7 + 0x54],	%i7
	movvc	%xcc,	%g3,	%o5
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	edge16n	%o7,	%l2,	%o3
	fexpand	%f31,	%f8
	fcmpd	%fcc3,	%f16,	%f24
	srl	%l1,	%g1,	%o2
	sdivcc	%g7,	0x086A,	%l4
	udivcc	%o0,	0x1B26,	%i0
	fmovsvs	%icc,	%f3,	%f20
	sethi	0x017D,	%g2
	fone	%f10
	fpsub16	%f24,	%f2,	%f2
	movrne	%l6,	0x378,	%g6
	move	%xcc,	%o1,	%l0
	edge8	%i5,	%o6,	%l3
	stx	%i6,	[%l7 + 0x60]
	or	%g5,	0x0957,	%i1
	movle	%icc,	%i3,	%l5
	ldd	[%l7 + 0x28],	%f4
	movleu	%xcc,	%o4,	%g4
	edge8ln	%i7,	%o5,	%g3
	movrgz	%i2,	0x1B9,	%o7
	udivx	%l2,	0x18CF,	%o3
	edge32l	%l1,	%g1,	%o2
	xor	%i4,	0x0DE3,	%g7
	fmovdleu	%icc,	%f23,	%f19
	fandnot2	%f20,	%f4,	%f20
	fpmerge	%f3,	%f2,	%f16
	fmovscs	%icc,	%f8,	%f28
	fmovdvc	%icc,	%f21,	%f3
	sdiv	%o0,	0x1BA9,	%i0
	orcc	%g2,	%l4,	%l6
	fmovde	%xcc,	%f13,	%f13
	edge32l	%o1,	%l0,	%i5
	udivx	%g6,	0x1066,	%o6
	addccc	%i6,	%l3,	%i1
	ld	[%l7 + 0x10],	%f28
	save %i3, 0x04C9, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l5,	%o4,	%i7
	edge8n	%g4,	%o5,	%g3
	edge32	%i2,	%o7,	%o3
	orn	%l2,	%g1,	%l1
	subc	%o2,	0x1316,	%i4
	orncc	%g7,	%o0,	%i0
	movl	%icc,	%l4,	%g2
	movrlz	%l6,	0x162,	%o1
	smul	%l0,	0x1B8E,	%g6
	sdiv	%o6,	0x0CBA,	%i6
	orcc	%i5,	%l3,	%i1
	std	%f2,	[%l7 + 0x08]
	sll	%i3,	0x12,	%l5
	edge32	%g5,	%o4,	%g4
	orn	%o5,	%g3,	%i7
	movre	%i2,	0x2A3,	%o3
	fpack32	%f0,	%f24,	%f30
	movn	%icc,	%l2,	%g1
	and	%l1,	%o2,	%i4
	umulcc	%g7,	0x0D43,	%o0
	edge32l	%i0,	%o7,	%l4
	xnorcc	%l6,	%o1,	%l0
	xnor	%g2,	0x1967,	%o6
	sllx	%i6,	0x18,	%g6
	movge	%xcc,	%l3,	%i1
	fmovse	%icc,	%f30,	%f26
	sethi	0x06BA,	%i5
	edge32n	%l5,	%i3,	%o4
	ldd	[%l7 + 0x18],	%f12
	fmovs	%f6,	%f13
	edge16n	%g4,	%g5,	%g3
	movg	%icc,	%o5,	%i7
	alignaddr	%o3,	%l2,	%i2
	subc	%g1,	0x133C,	%o2
	udiv	%l1,	0x11B8,	%i4
	fcmpeq16	%f20,	%f8,	%o0
	ldd	[%l7 + 0x60],	%i0
	sra	%g7,	0x14,	%l4
	umul	%l6,	0x16E1,	%o7
	fmovda	%icc,	%f30,	%f14
	xorcc	%o1,	0x1FCA,	%g2
	sdivcc	%l0,	0x13E8,	%i6
	fpsub32s	%f1,	%f25,	%f13
	ldx	[%l7 + 0x70],	%g6
	fmovrdgez	%o6,	%f26,	%f12
	std	%f26,	[%l7 + 0x10]
	edge8	%l3,	%i1,	%l5
	edge32l	%i5,	%i3,	%o4
	fand	%f14,	%f20,	%f10
	edge32ln	%g5,	%g3,	%g4
	movvs	%icc,	%o5,	%o3
	andcc	%i7,	%i2,	%l2
	andncc	%o2,	%g1,	%i4
	fones	%f31
	fmovs	%f8,	%f21
	fsrc2s	%f17,	%f1
	movl	%xcc,	%o0,	%i0
	edge16l	%l1,	%l4,	%l6
	movneg	%xcc,	%o7,	%g7
	mulscc	%g2,	0x0CB4,	%o1
	ldsh	[%l7 + 0x62],	%l0
	stb	%i6,	[%l7 + 0x70]
	sra	%o6,	%l3,	%i1
	edge16	%l5,	%i5,	%g6
	fand	%f2,	%f6,	%f24
	fmovdgu	%icc,	%f8,	%f0
	movl	%icc,	%i3,	%g5
	edge16ln	%g3,	%g4,	%o4
	andncc	%o5,	%o3,	%i7
	xor	%i2,	0x1741,	%l2
	movvs	%icc,	%o2,	%g1
	udiv	%o0,	0x1A43,	%i0
	andncc	%l1,	%i4,	%l6
	ld	[%l7 + 0x64],	%f18
	addccc	%l4,	%o7,	%g7
	orn	%g2,	0x179B,	%l0
	lduh	[%l7 + 0x36],	%o1
	edge8	%o6,	%l3,	%i1
	ldd	[%l7 + 0x28],	%f10
	edge8n	%l5,	%i6,	%i5
	array16	%i3,	%g5,	%g6
	fmovdcs	%icc,	%f15,	%f4
	smulcc	%g4,	0x0EA9,	%o4
	fcmpne16	%f16,	%f18,	%g3
	movrgez	%o3,	%o5,	%i2
	ldsh	[%l7 + 0x16],	%l2
	fmuld8ulx16	%f30,	%f6,	%f18
	movl	%xcc,	%i7,	%o2
	edge16ln	%g1,	%i0,	%o0
	movrgez	%i4,	0x10F,	%l1
	addccc	%l4,	%o7,	%l6
	fmovdge	%xcc,	%f8,	%f24
	fcmped	%fcc0,	%f16,	%f20
	xnorcc	%g7,	0x1EC9,	%l0
	movrlez	%o1,	0x0BF,	%o6
	smul	%g2,	%i1,	%l3
	sir	0x17FF
	fmovrdlez	%i6,	%f2,	%f16
	and	%l5,	%i5,	%g5
	andcc	%g6,	%i3,	%o4
	udivx	%g3,	0x1A7C,	%g4
	ld	[%l7 + 0x0C],	%f26
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%f16
	movne	%xcc,	%o5,	%o3
	std	%f8,	[%l7 + 0x20]
	stw	%i2,	[%l7 + 0x08]
	fandnot2	%f16,	%f16,	%f28
	mulscc	%i7,	0x0982,	%o2
	edge16ln	%l2,	%i0,	%o0
	sdivcc	%g1,	0x1E9F,	%i4
	udiv	%l4,	0x10DD,	%l1
	fmovsg	%icc,	%f22,	%f26
	ldsw	[%l7 + 0x08],	%l6
	subc	%g7,	0x19D2,	%o7
	movcs	%xcc,	%o1,	%l0
	sll	%g2,	0x16,	%i1
	lduh	[%l7 + 0x7A],	%o6
	orncc	%i6,	%l3,	%l5
	pdist	%f4,	%f2,	%f0
	st	%f11,	[%l7 + 0x2C]
	movvc	%xcc,	%g5,	%g6
	movl	%icc,	%i3,	%i5
	xor	%o4,	0x04E9,	%g4
	movrgz	%o5,	%o3,	%i2
	fmovsneg	%icc,	%f20,	%f23
	movge	%icc,	%i7,	%o2
	xorcc	%l2,	%g3,	%i0
	fandnot2	%f6,	%f16,	%f20
	fnot1	%f18,	%f8
	xnorcc	%g1,	0x198B,	%i4
	xor	%o0,	0x1BDC,	%l1
	xorcc	%l6,	%l4,	%g7
	nop
	set	0x34, %i7
	ldsw	[%l7 + %i7],	%o7
	save %o1, %l0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o6,	[%l7 + 0x38]
	movvc	%icc,	%g2,	%i6
	srlx	%l5,	%l3,	%g5
	fmovsl	%icc,	%f24,	%f3
	fmuld8sux16	%f27,	%f0,	%f24
	movge	%icc,	%g6,	%i5
	movg	%xcc,	%o4,	%i3
	ldx	[%l7 + 0x10],	%o5
	movrgez	%g4,	%o3,	%i7
	fpadd16	%f12,	%f6,	%f22
	ldub	[%l7 + 0x35],	%i2
	movrgez	%o2,	%g3,	%i0
	sth	%l2,	[%l7 + 0x2C]
	addcc	%g1,	%i4,	%l1
	or	%o0,	%l6,	%l4
	sdivcc	%g7,	0x0453,	%o1
	fpack16	%f2,	%f28
	movpos	%xcc,	%o7,	%i1
	subcc	%o6,	0x0A5B,	%l0
	orn	%i6,	%g2,	%l5
	sra	%g5,	%l3,	%g6
	edge8n	%i5,	%i3,	%o5
	subcc	%o4,	0x0250,	%g4
	sethi	0x05F2,	%o3
	fmovdle	%icc,	%f3,	%f4
	andn	%i7,	0x09C5,	%o2
	movleu	%xcc,	%g3,	%i0
	stx	%i2,	[%l7 + 0x68]
	orncc	%g1,	%i4,	%l1
	sdiv	%o0,	0x1757,	%l2
	movg	%xcc,	%l4,	%g7
	movge	%icc,	%o1,	%o7
	ldx	[%l7 + 0x18],	%i1
	movleu	%xcc,	%l6,	%l0
	andn	%i6,	0x0DA9,	%o6
	fpmerge	%f18,	%f29,	%f30
	movneg	%xcc,	%l5,	%g2
	movgu	%xcc,	%l3,	%g5
	stx	%i5,	[%l7 + 0x20]
	ldub	[%l7 + 0x0D],	%i3
	mova	%xcc,	%g6,	%o4
	movrlez	%o5,	0x3F3,	%g4
	fcmpd	%fcc2,	%f6,	%f14
	fmul8x16	%f21,	%f16,	%f12
	ldsh	[%l7 + 0x1A],	%o3
	subc	%i7,	%o2,	%g3
	mova	%icc,	%i2,	%i0
	lduh	[%l7 + 0x7A],	%g1
	fornot1s	%f10,	%f4,	%f31
	ld	[%l7 + 0x4C],	%f2
	sub	%i4,	%l1,	%o0
	std	%f6,	[%l7 + 0x68]
	ldd	[%l7 + 0x78],	%l2
	movn	%xcc,	%g7,	%l4
	nop
	set	0x58, %i6
	ldx	[%l7 + %i6],	%o7
	andcc	%o1,	%l6,	%l0
	fexpand	%f11,	%f24
	ldsw	[%l7 + 0x68],	%i6
	ldx	[%l7 + 0x20],	%i1
	movcs	%icc,	%l5,	%g2
	movl	%icc,	%o6,	%g5
	movn	%icc,	%l3,	%i5
	fone	%f10
	stw	%g6,	[%l7 + 0x70]
	movneg	%xcc,	%i3,	%o4
	udivx	%g4,	0x1E58,	%o5
	add	%o3,	%i7,	%o2
	fmovrdne	%g3,	%f0,	%f6
	srl	%i2,	%g1,	%i0
	sdivx	%i4,	0x1DCC,	%l1
	popc	%o0,	%l2
	sir	0x141E
	andncc	%g7,	%o7,	%l4
	fmul8ulx16	%f6,	%f28,	%f2
	xnorcc	%l6,	%o1,	%l0
	edge8l	%i1,	%l5,	%i6
	movg	%icc,	%o6,	%g2
	xor	%l3,	%g5,	%i5
	add	%g6,	%i3,	%g4
	movrgz	%o4,	%o5,	%o3
	movne	%xcc,	%o2,	%g3
	sub	%i7,	%g1,	%i2
	fmovdge	%xcc,	%f3,	%f18
	fandnot2	%f8,	%f8,	%f14
	and	%i4,	0x0384,	%i0
	stx	%o0,	[%l7 + 0x68]
	edge32n	%l1,	%g7,	%l2
	stx	%l4,	[%l7 + 0x40]
	xorcc	%o7,	0x1ABC,	%l6
	movl	%icc,	%l0,	%i1
	sll	%l5,	%i6,	%o6
	movneg	%icc,	%g2,	%l3
	orn	%o1,	0x0F0D,	%i5
	movre	%g6,	%g5,	%i3
	andn	%o4,	0x19D4,	%g4
	ldsb	[%l7 + 0x09],	%o3
	ldd	[%l7 + 0x70],	%o4
	fpsub32s	%f28,	%f7,	%f23
	fmovscs	%xcc,	%f25,	%f24
	edge16n	%g3,	%o2,	%i7
	ldsb	[%l7 + 0x64],	%i2
	edge16n	%i4,	%g1,	%i0
	fmovdn	%icc,	%f23,	%f0
	fmovdle	%icc,	%f7,	%f25
	movleu	%xcc,	%l1,	%o0
	mova	%xcc,	%l2,	%g7
	ldd	[%l7 + 0x30],	%f16
	movn	%xcc,	%l4,	%l6
	edge16ln	%o7,	%i1,	%l5
	fcmped	%fcc1,	%f22,	%f24
	movleu	%xcc,	%l0,	%o6
	nop
	set	0x3E, %g6
	stb	%i6,	[%l7 + %g6]
	edge32l	%l3,	%g2,	%i5
	sth	%g6,	[%l7 + 0x6E]
	fpsub32	%f14,	%f2,	%f22
	edge8n	%o1,	%i3,	%g5
	lduw	[%l7 + 0x44],	%o4
	fmovscs	%icc,	%f5,	%f5
	umulcc	%o3,	0x1C14,	%g4
	andcc	%o5,	0x03A0,	%o2
	sra	%g3,	%i7,	%i2
	movgu	%xcc,	%g1,	%i4
	srax	%l1,	%o0,	%i0
	fnors	%f18,	%f16,	%f31
	and	%l2,	%g7,	%l6
	edge32l	%l4,	%o7,	%l5
	edge32l	%l0,	%i1,	%i6
	mulx	%o6,	%l3,	%i5
	movpos	%xcc,	%g2,	%o1
	udivcc	%g6,	0x1B48,	%g5
	movneg	%icc,	%o4,	%o3
	ldsh	[%l7 + 0x1E],	%i3
	fmovsvs	%icc,	%f9,	%f31
	edge8l	%o5,	%o2,	%g4
	udivx	%i7,	0x1202,	%i2
	stw	%g3,	[%l7 + 0x30]
	alignaddrl	%g1,	%i4,	%o0
	umul	%i0,	0x0474,	%l2
	fmovrdgz	%g7,	%f22,	%f2
	umul	%l6,	0x135C,	%l1
	for	%f6,	%f2,	%f14
	array8	%o7,	%l5,	%l4
	fsrc1s	%f3,	%f28
	siam	0x3
	movle	%icc,	%l0,	%i6
	movrlez	%o6,	%i1,	%i5
	popc	0x0580,	%l3
	movneg	%xcc,	%o1,	%g2
	movgu	%xcc,	%g5,	%o4
	edge8ln	%o3,	%g6,	%o5
	movge	%icc,	%i3,	%g4
	ldub	[%l7 + 0x56],	%i7
	ldub	[%l7 + 0x08],	%i2
	fandnot1s	%f15,	%f16,	%f19
	stb	%o2,	[%l7 + 0x22]
	popc	0x0773,	%g1
	movg	%icc,	%i4,	%g3
	movpos	%icc,	%o0,	%i0
	movrlez	%g7,	0x3EE,	%l6
	nop
	set	0x63, %l5
	ldub	[%l7 + %l5],	%l1
	sllx	%l2,	0x16,	%o7
	fnor	%f30,	%f24,	%f12
	srl	%l4,	%l5,	%i6
	ldx	[%l7 + 0x40],	%o6
	fandnot1s	%f28,	%f25,	%f4
	movpos	%xcc,	%i1,	%l0
	add	%i5,	0x1108,	%l3
	srlx	%g2,	%o1,	%o4
	andn	%g5,	%o3,	%o5
	sub	%g6,	0x1C8F,	%i3
	move	%icc,	%i7,	%g4
	fpackfix	%f26,	%f19
	sllx	%o2,	0x0D,	%i2
	movn	%icc,	%i4,	%g3
	edge16l	%o0,	%i0,	%g1
	nop
	set	0x51, %i5
	ldsb	[%l7 + %i5],	%l6
	fcmpne16	%f20,	%f24,	%g7
	udivcc	%l2,	0x18E9,	%o7
	edge8n	%l4,	%l5,	%l1
	fornot2	%f14,	%f28,	%f24
	udivx	%i6,	0x0D54,	%i1
	andn	%o6,	0x134C,	%l0
	movre	%i5,	0x036,	%g2
	fandnot1s	%f13,	%f7,	%f26
	ldsb	[%l7 + 0x23],	%l3
	edge16n	%o1,	%g5,	%o4
	movle	%xcc,	%o5,	%g6
	fmovdgu	%icc,	%f25,	%f9
	fmovdl	%xcc,	%f22,	%f31
	popc	0x0541,	%i3
	ldd	[%l7 + 0x30],	%f26
	xnorcc	%o3,	%g4,	%i7
	andncc	%o2,	%i2,	%i4
	fnot1s	%f24,	%f6
	orncc	%o0,	%g3,	%g1
	array16	%l6,	%g7,	%l2
	stb	%i0,	[%l7 + 0x25]
	ld	[%l7 + 0x4C],	%f16
	movvs	%icc,	%l4,	%o7
	xnorcc	%l1,	0x0C89,	%l5
	stb	%i1,	[%l7 + 0x73]
	fnegs	%f4,	%f21
	sdivx	%o6,	0x096E,	%i6
	sdiv	%i5,	0x1CAF,	%g2
	fpsub16s	%f25,	%f16,	%f16
	ldsh	[%l7 + 0x1A],	%l0
	srl	%l3,	0x08,	%g5
	fmovrdgz	%o4,	%f8,	%f14
	xorcc	%o1,	0x06FD,	%o5
	pdist	%f16,	%f20,	%f30
	lduw	[%l7 + 0x18],	%g6
	fandnot2	%f28,	%f10,	%f28
	restore %i3, 0x1034, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%i7,	%o3
	movvc	%xcc,	%i2,	%i4
	sub	%o2,	0x0075,	%o0
	fnegs	%f20,	%f5
	movleu	%xcc,	%g1,	%g3
	nop
	set	0x28, %l3
	sth	%l6,	[%l7 + %l3]
	movn	%icc,	%g7,	%i0
	fornot2s	%f22,	%f18,	%f2
	udiv	%l4,	0x1216,	%l2
	movrgez	%l1,	%o7,	%i1
	fabss	%f31,	%f21
	movgu	%xcc,	%o6,	%i6
	array32	%l5,	%i5,	%g2
	fmovdge	%xcc,	%f15,	%f3
	sir	0x0ED2
	xnor	%l0,	%g5,	%l3
	movcs	%icc,	%o4,	%o1
	addccc	%o5,	%i3,	%g6
	fmovsvc	%xcc,	%f8,	%f8
	fpsub16	%f2,	%f0,	%f14
	edge8ln	%g4,	%i7,	%o3
	lduh	[%l7 + 0x40],	%i2
	movpos	%xcc,	%o2,	%o0
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	edge32l	%g3,	%g7,	%l6
	move	%xcc,	%l4,	%l2
	movn	%icc,	%i0,	%l1
	fmovspos	%xcc,	%f31,	%f19
	movrgz	%i1,	0x3D0,	%o6
	addccc	%o7,	0x1D4F,	%l5
	mulscc	%i5,	0x1FDD,	%i6
	xnorcc	%l0,	0x0C61,	%g2
	fmovsg	%xcc,	%f15,	%f2
	fmul8x16	%f16,	%f0,	%f22
	std	%f8,	[%l7 + 0x18]
	mulx	%l3,	0x0CF9,	%o4
	fmovda	%icc,	%f10,	%f26
	fpack32	%f2,	%f20,	%f22
	movrgez	%g5,	0x244,	%o5
	movne	%xcc,	%i3,	%g6
	fcmpgt16	%f10,	%f26,	%o1
	fmovdpos	%icc,	%f1,	%f23
	movcs	%xcc,	%g4,	%o3
	fone	%f4
	fones	%f21
	edge32ln	%i2,	%i7,	%o2
	fmovrsgz	%i4,	%f21,	%f0
	edge8n	%g1,	%g3,	%g7
	movle	%icc,	%o0,	%l4
	std	%f28,	[%l7 + 0x50]
	addcc	%l6,	%l2,	%l1
	fmovsle	%xcc,	%f15,	%f29
	udiv	%i1,	0x05AB,	%o6
	fxnors	%f7,	%f21,	%f17
	ldsw	[%l7 + 0x4C],	%o7
	addc	%l5,	%i5,	%i0
	fxors	%f16,	%f15,	%f26
	orcc	%i6,	%l0,	%l3
	or	%o4,	0x0A66,	%g2
	lduh	[%l7 + 0x68],	%o5
	xorcc	%g5,	%g6,	%o1
	sth	%g4,	[%l7 + 0x44]
	ldsb	[%l7 + 0x2E],	%o3
	movvc	%icc,	%i2,	%i7
	movleu	%xcc,	%i3,	%i4
	fmovdvc	%xcc,	%f30,	%f24
	edge16	%g1,	%g3,	%o2
	alignaddrl	%o0,	%g7,	%l4
	udiv	%l2,	0x02EB,	%l6
	srax	%i1,	0x02,	%o6
	sethi	0x1C2C,	%o7
	fmovdge	%xcc,	%f25,	%f26
	ldsh	[%l7 + 0x6A],	%l5
	alignaddrl	%l1,	%i5,	%i6
	movneg	%xcc,	%l0,	%i0
	fmovsa	%icc,	%f7,	%f2
	fsrc2	%f6,	%f12
	st	%f30,	[%l7 + 0x74]
	ldsw	[%l7 + 0x64],	%o4
	fmovsl	%xcc,	%f11,	%f10
	fcmple32	%f30,	%f12,	%l3
	addc	%g2,	0x12A5,	%g5
	andncc	%g6,	%o1,	%g4
	sll	%o3,	0x1E,	%o5
	udiv	%i7,	0x0607,	%i3
	srlx	%i4,	0x12,	%g1
	udivcc	%i2,	0x192D,	%g3
	fmovrdlz	%o2,	%f20,	%f22
	fcmpes	%fcc0,	%f28,	%f7
	edge32n	%o0,	%g7,	%l2
	movneg	%icc,	%l6,	%l4
	movvs	%xcc,	%i1,	%o7
	movne	%xcc,	%l5,	%l1
	movle	%icc,	%o6,	%i5
	fcmps	%fcc1,	%f4,	%f19
	edge16ln	%i6,	%i0,	%l0
	mulscc	%o4,	%l3,	%g2
	edge16n	%g5,	%o1,	%g4
	or	%g6,	0x1735,	%o3
	sethi	0x0D7E,	%i7
	andncc	%o5,	%i3,	%i4
	ldx	[%l7 + 0x60],	%i2
	xor	%g1,	0x1FBA,	%o2
	fmovdne	%xcc,	%f27,	%f18
	andncc	%o0,	%g3,	%l2
	smul	%l6,	%g7,	%i1
	ldsb	[%l7 + 0x2A],	%l4
	and	%o7,	%l1,	%o6
	addccc	%l5,	%i5,	%i0
	andncc	%l0,	%i6,	%l3
	movl	%icc,	%o4,	%g2
	movrlz	%o1,	0x2D2,	%g5
	fmul8x16	%f2,	%f0,	%f6
	edge32n	%g6,	%g4,	%i7
	edge8l	%o5,	%i3,	%i4
	movneg	%xcc,	%i2,	%o3
	edge16l	%g1,	%o2,	%g3
	movneg	%icc,	%o0,	%l2
	andncc	%g7,	%i1,	%l4
	fmovsneg	%icc,	%f25,	%f24
	andncc	%l6,	%o7,	%l1
	movre	%o6,	0x0C7,	%l5
	movne	%xcc,	%i0,	%l0
	movge	%icc,	%i5,	%i6
	save %l3, 0x19CE, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g2,	%g5,	%g6
	fmovs	%f31,	%f6
	or	%o1,	0x1441,	%g4
	array16	%o5,	%i7,	%i3
	ld	[%l7 + 0x14],	%f11
	sll	%i4,	0x1E,	%o3
	edge8	%i2,	%g1,	%g3
	edge16ln	%o0,	%l2,	%g7
	fmovrsgez	%o2,	%f10,	%f9
	st	%f13,	[%l7 + 0x74]
	andn	%i1,	0x05B0,	%l4
	ldx	[%l7 + 0x58],	%o7
	xorcc	%l6,	%l1,	%l5
	array32	%o6,	%l0,	%i5
	andn	%i6,	%l3,	%i0
	movle	%xcc,	%g2,	%o4
	save %g6, 0x00FC, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o1,	%o5,	%i7
	sdivx	%g4,	0x144C,	%i3
	ldd	[%l7 + 0x70],	%i4
	smul	%o3,	0x10B0,	%i2
	fmovscc	%xcc,	%f26,	%f19
	edge8n	%g3,	%g1,	%o0
	sll	%g7,	%l2,	%o2
	movcs	%xcc,	%i1,	%l4
	movle	%icc,	%l6,	%o7
	fandnot1s	%f29,	%f17,	%f22
	movvs	%xcc,	%l5,	%l1
	fmovspos	%icc,	%f12,	%f11
	udiv	%l0,	0x1DF2,	%o6
	xorcc	%i5,	%i6,	%l3
	stx	%i0,	[%l7 + 0x58]
	fcmpd	%fcc0,	%f0,	%f28
	fnor	%f0,	%f18,	%f2
	movcs	%icc,	%g2,	%g6
	fmovdpos	%icc,	%f23,	%f18
	umulcc	%g5,	%o1,	%o4
	movrlez	%i7,	0x3DC,	%g4
	fmovsge	%xcc,	%f8,	%f18
	sir	0x1F0F
	subccc	%o5,	%i3,	%o3
	srl	%i4,	0x1B,	%i2
	movcs	%xcc,	%g1,	%o0
	smulcc	%g7,	0x15CA,	%g3
	fmovrdgez	%o2,	%f18,	%f4
	edge16l	%l2,	%i1,	%l4
	nop
	set	0x30, %l4
	stw	%o7,	[%l7 + %l4]
	umul	%l6,	0x0A85,	%l1
	fmovrse	%l5,	%f3,	%f27
	movvs	%xcc,	%o6,	%i5
	sdivcc	%i6,	0x0081,	%l0
	sth	%l3,	[%l7 + 0x28]
	edge32n	%g2,	%i0,	%g5
	addccc	%o1,	0x1AED,	%g6
	restore %i7, 0x0DB5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o5,	%i3
	movvc	%icc,	%o3,	%g4
	sra	%i2,	%g1,	%i4
	fandnot2s	%f14,	%f4,	%f20
	fmovsleu	%xcc,	%f2,	%f4
	alignaddr	%g7,	%o0,	%o2
	srl	%g3,	0x0A,	%i1
	stw	%l4,	[%l7 + 0x58]
	movrgz	%o7,	%l6,	%l2
	ldd	[%l7 + 0x08],	%l4
	orncc	%o6,	%l1,	%i6
	edge8	%i5,	%l0,	%g2
	sdiv	%l3,	0x1BD6,	%g5
	alignaddrl	%i0,	%g6,	%o1
	fmovsgu	%icc,	%f14,	%f25
	subc	%o4,	%o5,	%i7
	save %o3, %g4, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x01A7,	%g1
	nop
	set	0x40, %i2
	ldsw	[%l7 + %i2],	%i2
	ldd	[%l7 + 0x08],	%f14
	fand	%f14,	%f16,	%f16
	fmovsg	%xcc,	%f23,	%f26
	fcmpeq32	%f16,	%f6,	%i4
	movvs	%xcc,	%o0,	%o2
	lduw	[%l7 + 0x74],	%g3
	movrgez	%i1,	%g7,	%o7
	movrlez	%l6,	0x33C,	%l4
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	movgu	%icc,	%i6,	%l2
	add	%i5,	0x1113,	%l0
	xnorcc	%g2,	0x0329,	%g5
	ldsh	[%l7 + 0x6E],	%i0
	add	%l3,	0x00F0,	%g6
	andcc	%o1,	0x0B33,	%o4
	ldd	[%l7 + 0x30],	%i6
	edge8n	%o3,	%g4,	%o5
	fand	%f30,	%f18,	%f6
	addccc	%g1,	%i2,	%i4
	xnorcc	%o0,	0x129E,	%o2
	udiv	%i3,	0x149F,	%g3
	xorcc	%g7,	%i1,	%l6
	umulcc	%o7,	0x07F1,	%l4
	srlx	%o6,	%l1,	%l5
	xnorcc	%l2,	0x05EE,	%i5
	sllx	%i6,	%l0,	%g2
	srl	%g5,	%i0,	%g6
	fnors	%f31,	%f18,	%f28
	fmovrsgz	%o1,	%f20,	%f12
	andn	%l3,	0x1D2A,	%o4
	edge16	%i7,	%o3,	%g4
	movleu	%icc,	%o5,	%g1
	movre	%i4,	0x09E,	%o0
	fmovsne	%icc,	%f9,	%f21
	sdivx	%o2,	0x15E7,	%i2
	smul	%g3,	%i3,	%i1
	xnorcc	%g7,	0x13E4,	%l6
	addccc	%l4,	%o6,	%o7
	umulcc	%l5,	%l1,	%i5
	movn	%xcc,	%l2,	%i6
	movrgz	%g2,	%l0,	%i0
	orn	%g5,	%g6,	%l3
	ldsb	[%l7 + 0x2D],	%o4
	alignaddrl	%o1,	%o3,	%i7
	sdivx	%g4,	0x1864,	%g1
	umul	%i4,	0x0043,	%o5
	fornot2	%f30,	%f22,	%f0
	fnands	%f30,	%f9,	%f13
	movg	%xcc,	%o2,	%o0
	movrgz	%i2,	%i3,	%g3
	addcc	%i1,	%g7,	%l6
	udivx	%l4,	0x1031,	%o6
	popc	%l5,	%l1
	orcc	%o7,	%l2,	%i5
	stx	%g2,	[%l7 + 0x10]
	edge8l	%l0,	%i6,	%g5
	fmovdvs	%xcc,	%f18,	%f20
	sra	%g6,	%l3,	%i0
	std	%f10,	[%l7 + 0x78]
	srlx	%o1,	%o3,	%o4
	smul	%g4,	0x11B5,	%g1
	movvc	%icc,	%i7,	%o5
	fsrc1s	%f10,	%f3
	fcmpeq16	%f12,	%f22,	%o2
	orncc	%o0,	%i4,	%i2
	xnor	%g3,	%i1,	%g7
	movvs	%xcc,	%i3,	%l6
	sra	%l4,	%l5,	%l1
	fmuld8ulx16	%f23,	%f20,	%f2
	nop
	set	0x28, %o1
	stx	%o6,	[%l7 + %o1]
	fmuld8sux16	%f23,	%f30,	%f18
	subc	%o7,	%i5,	%g2
	stx	%l0,	[%l7 + 0x18]
	fmovsa	%icc,	%f30,	%f13
	stx	%l2,	[%l7 + 0x50]
	sll	%g5,	0x10,	%i6
	array16	%l3,	%i0,	%g6
	edge8ln	%o1,	%o4,	%g4
	mulscc	%g1,	0x0696,	%i7
	edge8ln	%o3,	%o2,	%o5
	nop
	set	0x24, %o6
	stw	%i4,	[%l7 + %o6]
	array8	%i2,	%o0,	%g3
	fsrc1	%f28,	%f12
	fmovrsgez	%g7,	%f13,	%f31
	alignaddrl	%i3,	%i1,	%l4
	movpos	%icc,	%l6,	%l5
	subccc	%l1,	%o7,	%o6
	fpmerge	%f29,	%f17,	%f28
	edge8l	%i5,	%g2,	%l2
	movrgez	%l0,	0x187,	%i6
	addc	%l3,	0x1F2C,	%i0
	fcmpne16	%f16,	%f20,	%g6
	movne	%xcc,	%o1,	%g5
	ldd	[%l7 + 0x68],	%f26
	fmovrslez	%o4,	%f14,	%f17
	addcc	%g4,	%g1,	%o3
	edge8ln	%o2,	%o5,	%i7
	fmovdge	%xcc,	%f23,	%f22
	xorcc	%i4,	%i2,	%o0
	fmovsg	%xcc,	%f31,	%f10
	umul	%g3,	%i3,	%g7
	fmovdg	%xcc,	%f24,	%f19
	sdivcc	%i1,	0x07B7,	%l6
	fpackfix	%f26,	%f19
	movleu	%icc,	%l4,	%l5
	array8	%o7,	%o6,	%i5
	andncc	%g2,	%l2,	%l0
	xnor	%i6,	%l3,	%l1
	ldx	[%l7 + 0x18],	%i0
	nop
	set	0x72, %o5
	ldsb	[%l7 + %o5],	%o1
	stx	%g6,	[%l7 + 0x60]
	fzeros	%f22
	andn	%g5,	0x073A,	%g4
	movleu	%xcc,	%o4,	%g1
	ldd	[%l7 + 0x70],	%o2
	xnorcc	%o2,	%o5,	%i4
	orncc	%i2,	0x1E40,	%i7
	udivcc	%o0,	0x12E7,	%g3
	fnot2	%f8,	%f30
	edge8l	%g7,	%i1,	%i3
	fabsd	%f30,	%f14
	fmovrdne	%l6,	%f8,	%f8
	mulscc	%l5,	0x0EE3,	%l4
	move	%icc,	%o7,	%o6
	edge32	%i5,	%l2,	%l0
	ld	[%l7 + 0x50],	%f31
	mova	%icc,	%i6,	%l3
	ldsw	[%l7 + 0x0C],	%g2
	ldsh	[%l7 + 0x14],	%l1
	fornot2	%f4,	%f10,	%f20
	subccc	%i0,	%g6,	%o1
	edge32l	%g5,	%o4,	%g1
	movl	%icc,	%o3,	%o2
	fmovrdne	%o5,	%f12,	%f30
	movg	%icc,	%i4,	%g4
	smul	%i2,	%i7,	%o0
	fnors	%f26,	%f20,	%f26
	edge16l	%g7,	%i1,	%g3
	srlx	%i3,	%l5,	%l4
	udivx	%o7,	0x1410,	%l6
	fpsub16s	%f4,	%f0,	%f12
	orcc	%o6,	%i5,	%l0
	movre	%l2,	%l3,	%i6
	umul	%l1,	0x0AE7,	%i0
	movle	%icc,	%g6,	%g2
	fpadd32	%f28,	%f0,	%f18
	fmovdn	%icc,	%f24,	%f26
	fpadd32s	%f16,	%f26,	%f9
	fmovrdgz	%o1,	%f8,	%f26
	fxors	%f4,	%f13,	%f16
	mulx	%o4,	%g1,	%g5
	for	%f12,	%f18,	%f14
	fmovsvc	%xcc,	%f28,	%f12
	xorcc	%o3,	%o5,	%o2
	movrgz	%g4,	%i4,	%i7
	mova	%xcc,	%o0,	%g7
	srax	%i2,	%g3,	%i3
	fmovsvc	%icc,	%f6,	%f23
	umul	%l5,	0x0EC8,	%i1
	edge32	%l4,	%l6,	%o6
	xnor	%o7,	0x1C52,	%l0
	movvs	%xcc,	%l2,	%l3
	andncc	%i6,	%i5,	%l1
	fcmpeq16	%f26,	%f6,	%g6
	restore %g2, %i0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x70, %i0
	ldsh	[%l7 + %i0],	%o4
	sdivcc	%g1,	0x023D,	%o3
	sdivx	%o5,	0x077C,	%o2
	edge32l	%g5,	%i4,	%i7
	subc	%g4,	%o0,	%g7
	lduh	[%l7 + 0x18],	%i2
	and	%i3,	0x10FF,	%l5
	addcc	%i1,	0x1E14,	%l4
	lduh	[%l7 + 0x56],	%g3
	movrgz	%l6,	0x1CE,	%o7
	orncc	%o6,	%l2,	%l0
	movrne	%i6,	%l3,	%i5
	xor	%g6,	0x11EF,	%g2
	edge8n	%i0,	%o1,	%l1
	orn	%o4,	0x1AEA,	%g1
	edge32l	%o5,	%o3,	%o2
	fcmple16	%f6,	%f14,	%i4
	movg	%xcc,	%i7,	%g5
	movcs	%xcc,	%o0,	%g7
	orn	%g4,	%i2,	%l5
	ldx	[%l7 + 0x78],	%i3
	edge16l	%l4,	%g3,	%i1
	srl	%l6,	%o6,	%l2
	umul	%o7,	%i6,	%l3
	ldsh	[%l7 + 0x28],	%l0
	movrlz	%g6,	%i5,	%g2
	umul	%o1,	0x19FB,	%l1
	udiv	%o4,	0x19B9,	%g1
	fmovdcc	%xcc,	%f8,	%f31
	alignaddrl	%i0,	%o3,	%o5
	nop
	set	0x50, %g5
	stw	%o2,	[%l7 + %g5]
	andcc	%i4,	0x10AD,	%g5
	addcc	%o0,	0x0531,	%g7
	fnegs	%f27,	%f18
	sth	%i7,	[%l7 + 0x74]
	ldsb	[%l7 + 0x46],	%i2
	sra	%g4,	0x08,	%l5
	add	%i3,	%g3,	%i1
	movrlez	%l6,	%l4,	%l2
	and	%o6,	%o7,	%i6
	edge32n	%l0,	%g6,	%l3
	fpadd16s	%f8,	%f29,	%f3
	subcc	%g2,	%o1,	%i5
	sub	%o4,	0x0C60,	%g1
	sethi	0x06F4,	%l1
	edge8l	%o3,	%i0,	%o5
	save %i4, %o2, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f4,	%f10
	movgu	%icc,	%g5,	%g7
	fmovrdlz	%i7,	%f26,	%f14
	ldsw	[%l7 + 0x34],	%g4
	sll	%l5,	%i3,	%i2
	fsrc2s	%f24,	%f29
	movg	%xcc,	%g3,	%l6
	movle	%xcc,	%i1,	%l2
	fnor	%f0,	%f4,	%f16
	smulcc	%o6,	0x0531,	%l4
	fzeros	%f15
	fandnot1	%f22,	%f22,	%f18
	movre	%o7,	0x2D0,	%i6
	ldd	[%l7 + 0x28],	%f4
	subcc	%g6,	0x1080,	%l3
	movrgz	%g2,	%l0,	%o1
	orcc	%o4,	0x047F,	%i5
	edge16n	%g1,	%o3,	%i0
	for	%f24,	%f0,	%f12
	stw	%l1,	[%l7 + 0x68]
	udivx	%o5,	0x0711,	%o2
	fornot2s	%f21,	%f29,	%f0
	sethi	0x070C,	%o0
	fmovsl	%icc,	%f29,	%f23
	xor	%i4,	0x09E7,	%g5
	edge16l	%g7,	%i7,	%g4
	movre	%l5,	%i2,	%g3
	stx	%i3,	[%l7 + 0x68]
	movrgez	%i1,	%l2,	%l6
	alignaddr	%l4,	%o6,	%o7
	nop
	set	0x0C, %g7
	ldsw	[%l7 + %g7],	%i6
	movrgz	%g6,	0x1F4,	%l3
	edge16	%l0,	%g2,	%o4
	fors	%f30,	%f7,	%f7
	sethi	0x121E,	%i5
	movn	%xcc,	%g1,	%o1
	sth	%o3,	[%l7 + 0x14]
	movne	%icc,	%l1,	%i0
	siam	0x6
	movneg	%icc,	%o5,	%o2
	fmovspos	%xcc,	%f4,	%f1
	movle	%icc,	%o0,	%i4
	ldd	[%l7 + 0x60],	%g6
	edge32l	%i7,	%g4,	%g5
	edge32	%i2,	%g3,	%i3
	sll	%i1,	0x0A,	%l5
	movrgez	%l2,	%l6,	%l4
	xor	%o6,	%i6,	%o7
	fnot2s	%f11,	%f1
	subcc	%g6,	0x187C,	%l3
	ldub	[%l7 + 0x74],	%l0
	fmovrdgez	%g2,	%f28,	%f8
	xnorcc	%i5,	0x10BF,	%g1
	sethi	0x15A6,	%o1
	edge16l	%o3,	%l1,	%o4
	fcmpes	%fcc1,	%f3,	%f18
	fpsub16	%f24,	%f0,	%f26
	xnorcc	%o5,	0x01A0,	%i0
	edge32l	%o0,	%o2,	%i4
	fcmps	%fcc0,	%f15,	%f11
	smulcc	%g7,	0x0EA1,	%i7
	fpadd16s	%f1,	%f12,	%f9
	movrgz	%g4,	%g5,	%g3
	ld	[%l7 + 0x6C],	%f23
	andncc	%i2,	%i1,	%i3
	sth	%l5,	[%l7 + 0x58]
	subccc	%l6,	0x1746,	%l2
	fone	%f30
	fsrc2	%f24,	%f6
	orn	%o6,	0x19A8,	%l4
	fmovsl	%icc,	%f1,	%f18
	movpos	%xcc,	%i6,	%g6
	andn	%l3,	%o7,	%g2
	array16	%i5,	%l0,	%g1
	edge16l	%o1,	%o3,	%o4
	addccc	%l1,	%o5,	%i0
	fands	%f15,	%f27,	%f27
	movvc	%icc,	%o2,	%i4
	movpos	%icc,	%g7,	%o0
	umul	%i7,	%g5,	%g3
	sllx	%g4,	%i2,	%i3
	movcc	%xcc,	%i1,	%l6
	fnegs	%f30,	%f13
	ldsb	[%l7 + 0x43],	%l2
	movrne	%o6,	%l5,	%l4
	fmovdg	%xcc,	%f26,	%f6
	edge8ln	%g6,	%l3,	%o7
	mulx	%i6,	0x18D2,	%i5
	sdivx	%l0,	0x0BC8,	%g2
	fornot1s	%f4,	%f2,	%f19
	ldd	[%l7 + 0x28],	%g0
	movg	%icc,	%o3,	%o1
	mova	%icc,	%o4,	%l1
	movge	%icc,	%o5,	%i0
	sdivx	%i4,	0x121B,	%g7
	movcs	%xcc,	%o0,	%i7
	movrgz	%g5,	%g3,	%g4
	ldub	[%l7 + 0x7F],	%i2
	fmovscs	%icc,	%f9,	%f29
	fmovrse	%i3,	%f12,	%f14
	edge8l	%o2,	%i1,	%l6
	xor	%o6,	%l2,	%l4
	umul	%g6,	%l3,	%l5
	ldd	[%l7 + 0x40],	%f26
	sra	%i6,	0x0B,	%i5
	alignaddr	%l0,	%o7,	%g2
	movg	%xcc,	%g1,	%o1
	fmovrde	%o3,	%f8,	%f22
	fmovdl	%xcc,	%f5,	%f24
	udivx	%o4,	0x02FC,	%l1
	sdiv	%i0,	0x04FC,	%i4
	fmuld8ulx16	%f24,	%f7,	%f28
	movrgez	%g7,	%o5,	%i7
	movcc	%icc,	%o0,	%g5
	ldub	[%l7 + 0x47],	%g4
	movrgz	%g3,	%i3,	%i2
	orn	%o2,	%i1,	%o6
	edge16	%l2,	%l4,	%l6
	movpos	%xcc,	%l3,	%l5
	edge8	%g6,	%i6,	%l0
	fpadd16s	%f29,	%f18,	%f8
	fands	%f6,	%f30,	%f31
	movleu	%icc,	%o7,	%g2
	edge16n	%g1,	%i5,	%o1
	edge8n	%o4,	%o3,	%i0
	array32	%i4,	%g7,	%o5
	array32	%l1,	%i7,	%o0
	ldd	[%l7 + 0x60],	%f22
	movcs	%icc,	%g4,	%g5
	edge32ln	%i3,	%g3,	%o2
	fnot1s	%f5,	%f18
	fmovdne	%xcc,	%f7,	%f9
	fzero	%f4
	ldub	[%l7 + 0x3A],	%i2
	fnegs	%f13,	%f11
	fexpand	%f28,	%f20
	mova	%xcc,	%i1,	%o6
	sth	%l2,	[%l7 + 0x6C]
	xor	%l4,	0x089B,	%l3
	move	%xcc,	%l5,	%g6
	fpackfix	%f6,	%f29
	addcc	%i6,	%l0,	%l6
	movvc	%xcc,	%o7,	%g2
	mulx	%g1,	%i5,	%o4
	fpack16	%f20,	%f13
	movrgz	%o1,	0x217,	%o3
	udivcc	%i0,	0x02E0,	%g7
	addccc	%i4,	0x11E9,	%l1
	edge8l	%o5,	%o0,	%g4
	sll	%g5,	0x1B,	%i3
	edge8l	%i7,	%g3,	%i2
	st	%f12,	[%l7 + 0x44]
	edge16n	%i1,	%o2,	%l2
	ld	[%l7 + 0x60],	%f12
	smulcc	%l4,	0x0CA2,	%l3
	umul	%l5,	%o6,	%g6
	fcmpes	%fcc1,	%f25,	%f6
	sub	%i6,	0x1DC0,	%l6
	movvs	%icc,	%l0,	%o7
	xorcc	%g2,	%i5,	%o4
	ldsh	[%l7 + 0x24],	%g1
	popc	%o3,	%o1
	edge8n	%g7,	%i4,	%i0
	movle	%xcc,	%o5,	%l1
	ldx	[%l7 + 0x60],	%o0
	popc	%g4,	%g5
	st	%f20,	[%l7 + 0x2C]
	sth	%i7,	[%l7 + 0x2A]
	fcmps	%fcc2,	%f22,	%f18
	edge32l	%g3,	%i3,	%i2
	movvc	%icc,	%i1,	%o2
	sll	%l4,	0x02,	%l3
	array16	%l2,	%l5,	%o6
	movrne	%i6,	%g6,	%l0
	or	%o7,	0x04B8,	%g2
	edge8l	%i5,	%o4,	%l6
	fones	%f27
	movrlz	%o3,	%o1,	%g7
	std	%f22,	[%l7 + 0x10]
	movle	%xcc,	%g1,	%i4
	udivx	%i0,	0x1E9A,	%o5
	edge16l	%o0,	%g4,	%g5
	sllx	%i7,	%g3,	%i3
	std	%f20,	[%l7 + 0x40]
	orn	%i2,	%l1,	%o2
	fpadd16s	%f26,	%f7,	%f15
	edge32n	%i1,	%l3,	%l2
	ldd	[%l7 + 0x78],	%f14
	movrgez	%l4,	%l5,	%o6
	fpadd32s	%f20,	%f9,	%f11
	fmovrsgez	%g6,	%f1,	%f26
	fcmped	%fcc0,	%f24,	%f12
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%f24
	fcmpne16	%f14,	%f12,	%l0
	fmul8x16	%f5,	%f30,	%f6
	ld	[%l7 + 0x7C],	%f8
	std	%f8,	[%l7 + 0x70]
	array8	%o7,	%i6,	%i5
	fandnot1s	%f31,	%f30,	%f17
	srl	%o4,	%g2,	%l6
	fmovrse	%o1,	%f29,	%f11
	andcc	%g7,	0x1E3F,	%o3
	sdiv	%i4,	0x1F5C,	%i0
	alignaddr	%g1,	%o5,	%o0
	fand	%f22,	%f24,	%f14
	movge	%xcc,	%g4,	%i7
	stx	%g5,	[%l7 + 0x40]
	fcmpgt32	%f14,	%f6,	%g3
	fmovsa	%icc,	%f14,	%f5
	mulx	%i3,	0x0A1F,	%l1
	movleu	%icc,	%o2,	%i2
	movneg	%xcc,	%i1,	%l3
	stb	%l2,	[%l7 + 0x0C]
	xor	%l4,	0x030B,	%o6
	array16	%g6,	%l5,	%l0
	fmovsl	%icc,	%f7,	%f22
	edge8	%i6,	%o7,	%i5
	movrgz	%o4,	0x09C,	%l6
	srl	%o1,	0x16,	%g2
	movcs	%icc,	%g7,	%i4
	edge16ln	%o3,	%i0,	%o5
	fpadd16s	%f6,	%f6,	%f18
	fmovdpos	%xcc,	%f21,	%f29
	andncc	%g1,	%g4,	%o0
	andn	%g5,	0x139B,	%g3
	srlx	%i7,	0x1D,	%l1
	andcc	%o2,	0x1207,	%i3
	ldsh	[%l7 + 0x32],	%i1
	xor	%l3,	0x0706,	%l2
	fnegs	%f10,	%f22
	xor	%l4,	%i2,	%o6
	umulcc	%l5,	%g6,	%i6
	srax	%l0,	0x1B,	%o7
	movpos	%xcc,	%o4,	%i5
	andncc	%l6,	%o1,	%g2
	array8	%i4,	%g7,	%o3
	edge16ln	%o5,	%g1,	%g4
	mulscc	%i0,	0x05A5,	%o0
	movne	%xcc,	%g3,	%g5
	srax	%l1,	%o2,	%i7
	sdivx	%i3,	0x0CCF,	%i1
	move	%xcc,	%l2,	%l3
	subcc	%l4,	0x1B0C,	%i2
	mova	%icc,	%o6,	%l5
	fnegs	%f12,	%f4
	fmovrslz	%g6,	%f18,	%f12
	fcmpne32	%f0,	%f30,	%l0
	fpackfix	%f28,	%f12
	fabsd	%f14,	%f24
	movrlz	%i6,	0x0DE,	%o4
	fmul8sux16	%f14,	%f14,	%f26
	sth	%o7,	[%l7 + 0x34]
	umulcc	%l6,	%o1,	%i5
	movcs	%icc,	%i4,	%g7
	andncc	%g2,	%o3,	%g1
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	movvc	%icc,	%o0,	%g3
	sra	%i0,	%g5,	%l1
	fandnot1	%f28,	%f8,	%f10
	srlx	%o2,	0x19,	%i7
	fpsub32	%f30,	%f16,	%f12
	sethi	0x1E56,	%i1
	movg	%xcc,	%i3,	%l3
	subccc	%l2,	%i2,	%o6
	fpadd32s	%f26,	%f27,	%f4
	restore %l4, %g6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i6,	[%l7 + 0x12]
	nop
	set	0x68, %o7
	stw	%l0,	[%l7 + %o7]
	movcc	%icc,	%o7,	%o4
	alignaddr	%l6,	%i5,	%i4
	movre	%o1,	0x2C6,	%g7
	umul	%g2,	0x00A7,	%g1
	fcmpgt16	%f30,	%f8,	%o3
	array16	%g4,	%o0,	%o5
	movg	%xcc,	%g3,	%g5
	movrlez	%i0,	0x254,	%l1
	srl	%o2,	0x15,	%i1
	fnand	%f6,	%f0,	%f20
	movvc	%xcc,	%i7,	%i3
	andn	%l3,	0x016C,	%i2
	ldx	[%l7 + 0x10],	%o6
	sdiv	%l2,	0x1562,	%g6
	orncc	%l5,	0x0EAE,	%l4
	fpsub32s	%f4,	%f11,	%f21
	movleu	%icc,	%i6,	%o7
	ldub	[%l7 + 0x5F],	%l0
	fmovdle	%icc,	%f13,	%f14
	xnorcc	%o4,	0x1379,	%l6
	mulscc	%i5,	%o1,	%i4
	fmovrsgez	%g7,	%f17,	%f17
	andn	%g1,	%g2,	%g4
	popc	%o0,	%o3
	movcs	%icc,	%o5,	%g3
	stb	%i0,	[%l7 + 0x79]
	movl	%icc,	%l1,	%o2
	movgu	%xcc,	%g5,	%i7
	fcmpeq32	%f0,	%f28,	%i3
	movcc	%xcc,	%l3,	%i1
	std	%f14,	[%l7 + 0x48]
	nop
	set	0x4D, %g3
	ldub	[%l7 + %g3],	%o6
	alignaddrl	%i2,	%l2,	%l5
	stx	%g6,	[%l7 + 0x10]
	stw	%i6,	[%l7 + 0x2C]
	subcc	%l4,	%l0,	%o7
	movne	%icc,	%l6,	%i5
	ldd	[%l7 + 0x60],	%o0
	lduw	[%l7 + 0x38],	%i4
	fmovdvs	%xcc,	%f15,	%f17
	addcc	%o4,	%g1,	%g2
	umulcc	%g7,	0x0353,	%o0
	edge8n	%o3,	%g4,	%g3
	movvc	%icc,	%i0,	%o5
	sllx	%o2,	%g5,	%l1
	array32	%i7,	%l3,	%i1
	movl	%xcc,	%i3,	%i2
	edge32ln	%l2,	%o6,	%g6
	or	%l5,	%i6,	%l0
	sdivx	%o7,	0x0F35,	%l6
	movneg	%icc,	%l4,	%o1
	fcmpeq32	%f12,	%f6,	%i5
	std	%f16,	[%l7 + 0x18]
	movne	%xcc,	%i4,	%o4
	sethi	0x0C52,	%g1
	edge8l	%g2,	%o0,	%o3
	ldub	[%l7 + 0x43],	%g4
	udivcc	%g3,	0x0D90,	%i0
	ldd	[%l7 + 0x20],	%g6
	faligndata	%f10,	%f20,	%f2
	ldsh	[%l7 + 0x16],	%o2
	xor	%g5,	0x1B60,	%o5
	ldub	[%l7 + 0x71],	%i7
	stw	%l3,	[%l7 + 0x40]
	or	%l1,	0x15AF,	%i1
	fmovrslez	%i3,	%f1,	%f3
	movpos	%xcc,	%i2,	%l2
	movle	%icc,	%g6,	%l5
	addccc	%i6,	%o6,	%l0
	edge32l	%l6,	%o7,	%o1
	fmovsge	%xcc,	%f18,	%f16
	fmovsgu	%icc,	%f20,	%f23
	popc	%i5,	%l4
	sdiv	%i4,	0x01FE,	%o4
	xor	%g1,	%o0,	%o3
	or	%g4,	0x1F69,	%g2
	save %i0, %g7, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x48, %i1
	ldd	[%l7 + %i1],	%f8
	umul	%g5,	%o5,	%o2
	lduh	[%l7 + 0x6A],	%l3
	subccc	%l1,	0x16D6,	%i1
	lduw	[%l7 + 0x6C],	%i3
	movrlez	%i7,	%i2,	%l2
	alignaddrl	%g6,	%i6,	%o6
	edge32l	%l5,	%l6,	%o7
	movrgz	%o1,	%l0,	%l4
	edge8l	%i5,	%o4,	%i4
	mulx	%g1,	%o3,	%o0
	fpackfix	%f10,	%f6
	mulx	%g4,	0x0A45,	%g2
	fmovsge	%icc,	%f10,	%f24
	fmovsvs	%xcc,	%f10,	%f18
	fmuld8ulx16	%f14,	%f6,	%f6
	fnand	%f18,	%f8,	%f10
	movcs	%icc,	%i0,	%g7
	fxor	%f6,	%f16,	%f16
	orn	%g3,	0x05FB,	%g5
	fmovrsgez	%o5,	%f7,	%f1
	array8	%o2,	%l1,	%l3
	orcc	%i1,	0x1A56,	%i3
	srax	%i2,	%i7,	%g6
	fpack16	%f30,	%f25
	mova	%icc,	%i6,	%l2
	movcc	%icc,	%o6,	%l6
	ldsb	[%l7 + 0x64],	%l5
	fornot2	%f20,	%f24,	%f2
	orncc	%o7,	%o1,	%l0
	and	%l4,	0x1E8D,	%i5
	sdivcc	%i4,	0x0290,	%g1
	edge32l	%o4,	%o3,	%o0
	movne	%icc,	%g2,	%g4
	sdivx	%i0,	0x1D1E,	%g3
	nop
	set	0x5E, %o3
	lduh	[%l7 + %o3],	%g7
	edge8l	%g5,	%o2,	%l1
	movle	%icc,	%l3,	%i1
	ldsb	[%l7 + 0x70],	%i3
	movrgez	%o5,	0x2C9,	%i2
	addcc	%i7,	%g6,	%l2
	save %o6, %l6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o7,	0x043,	%i6
	add	%o1,	%l4,	%i5
	movvs	%xcc,	%i4,	%l0
	sub	%o4,	0x102C,	%g1
	alignaddr	%o0,	%o3,	%g2
	edge16ln	%g4,	%i0,	%g3
	movne	%xcc,	%g7,	%g5
	movleu	%icc,	%l1,	%l3
	ldub	[%l7 + 0x13],	%i1
	srlx	%o2,	%o5,	%i3
	edge32l	%i7,	%i2,	%l2
	fmuld8sux16	%f3,	%f8,	%f22
	fone	%f22
	and	%g6,	0x1152,	%o6
	mova	%xcc,	%l6,	%l5
	umul	%o7,	%o1,	%i6
	edge16l	%l4,	%i4,	%i5
	subcc	%l0,	%g1,	%o0
	save %o4, 0x0B2B, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g2,	%g4,	%g3
	fzeros	%f7
	fnors	%f0,	%f23,	%f26
	sdivcc	%i0,	0x1598,	%g7
	movvs	%icc,	%g5,	%l3
	edge8l	%i1,	%l1,	%o2
	movrgez	%o5,	0x3DF,	%i7
	sdivcc	%i2,	0x00A6,	%i3
	srl	%l2,	%o6,	%l6
	edge16n	%g6,	%l5,	%o1
	ldsh	[%l7 + 0x54],	%i6
	xor	%l4,	%o7,	%i4
	fcmpd	%fcc1,	%f26,	%f30
	edge32ln	%l0,	%g1,	%o0
	fnand	%f22,	%f22,	%f26
	movleu	%xcc,	%o4,	%o3
	movne	%xcc,	%g2,	%g4
	fors	%f5,	%f16,	%f31
	sdivcc	%g3,	0x106A,	%i5
	fzero	%f0
	edge8ln	%i0,	%g5,	%g7
	edge16ln	%l3,	%i1,	%o2
	edge32n	%o5,	%l1,	%i7
	edge8	%i3,	%l2,	%o6
	fmovde	%xcc,	%f6,	%f22
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%i2
	fnot1	%f18,	%f6
	movrgez	%l6,	0x226,	%g6
	movle	%icc,	%o1,	%i6
	mulx	%l4,	0x1A8E,	%l5
	ldx	[%l7 + 0x48],	%i4
	edge16n	%o7,	%l0,	%g1
	srax	%o0,	0x0C,	%o3
	subcc	%g2,	%o4,	%g3
	for	%f6,	%f8,	%f16
	edge16l	%i5,	%i0,	%g4
	edge16ln	%g7,	%g5,	%i1
	fnot2	%f14,	%f12
	fsrc2s	%f27,	%f23
	edge32ln	%l3,	%o5,	%l1
	srl	%i7,	0x07,	%o2
	ldd	[%l7 + 0x60],	%f14
	bshuffle	%f30,	%f6,	%f6
	movl	%icc,	%i3,	%o6
	edge8	%i2,	%l2,	%g6
	array8	%o1,	%l6,	%l4
	subccc	%l5,	0x02E6,	%i4
	alignaddr	%o7,	%i6,	%l0
	fmovsgu	%xcc,	%f1,	%f8
	fmovscs	%icc,	%f27,	%f22
	movcc	%xcc,	%o0,	%o3
	fmovdpos	%icc,	%f5,	%f20
	ldsb	[%l7 + 0x53],	%g2
	ldd	[%l7 + 0x20],	%f26
	ldx	[%l7 + 0x78],	%o4
	fmovdpos	%icc,	%f23,	%f7
	fmovsn	%icc,	%f26,	%f5
	sethi	0x0530,	%g1
	movrlez	%i5,	0x191,	%i0
	ldd	[%l7 + 0x20],	%f30
	subcc	%g3,	%g7,	%g4
	movrgz	%i1,	%l3,	%g5
	sll	%o5,	0x13,	%i7
	edge16	%l1,	%o2,	%i3
	fandnot1s	%f29,	%f23,	%f11
	fcmped	%fcc2,	%f8,	%f14
	edge32l	%i2,	%l2,	%o6
	fmovspos	%icc,	%f22,	%f31
	srlx	%g6,	%l6,	%o1
	array8	%l4,	%i4,	%l5
	fmuld8ulx16	%f26,	%f21,	%f16
	fcmped	%fcc3,	%f10,	%f26
	udivx	%o7,	0x0227,	%l0
	sllx	%i6,	%o3,	%g2
	fmovdneg	%xcc,	%f20,	%f12
	fnot2s	%f29,	%f16
	ldd	[%l7 + 0x10],	%f28
	fmovdg	%xcc,	%f1,	%f27
	movge	%xcc,	%o4,	%o0
	alignaddrl	%i5,	%g1,	%g3
	orncc	%i0,	0x0BFB,	%g4
	fmul8x16au	%f17,	%f18,	%f10
	xor	%g7,	0x0219,	%i1
	sdivx	%l3,	0x1C82,	%g5
	sth	%o5,	[%l7 + 0x7E]
	sll	%i7,	0x16,	%o2
	subccc	%l1,	0x09B7,	%i3
	smulcc	%i2,	%o6,	%l2
	addccc	%g6,	0x0BF6,	%l6
	movre	%o1,	0x0F4,	%i4
	fpsub16s	%f26,	%f6,	%f2
	movvc	%icc,	%l5,	%o7
	sth	%l0,	[%l7 + 0x28]
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	array32	%o4,	%o0,	%i5
	ldsh	[%l7 + 0x1E],	%g1
	stb	%g3,	[%l7 + 0x08]
	fxnors	%f21,	%f8,	%f27
	subcc	%g2,	0x106C,	%i0
	fpsub32	%f14,	%f18,	%f6
	std	%f4,	[%l7 + 0x50]
	mulx	%g4,	0x134A,	%g7
	smul	%i1,	%l3,	%o5
	srlx	%g5,	0x03,	%i7
	fmovscc	%icc,	%f14,	%f31
	movrlz	%o2,	0x3F4,	%i3
	fmovspos	%xcc,	%f11,	%f19
	fmul8x16	%f27,	%f2,	%f18
	movle	%xcc,	%i2,	%o6
	edge16n	%l2,	%l1,	%g6
	lduh	[%l7 + 0x36],	%o1
	move	%xcc,	%l6,	%i4
	save %o7, 0x0A38, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l4,	%i6,	%o3
	ldub	[%l7 + 0x76],	%o4
	std	%f16,	[%l7 + 0x08]
	fmovsne	%xcc,	%f10,	%f31
	fpack16	%f12,	%f5
	edge16ln	%l0,	%i5,	%o0
	orncc	%g1,	%g3,	%i0
	srlx	%g4,	%g2,	%g7
	movcc	%xcc,	%l3,	%i1
	or	%g5,	%i7,	%o2
	edge32	%i3,	%o5,	%o6
	nop
	set	0x24, %l2
	ldsw	[%l7 + %l2],	%i2
	ldsb	[%l7 + 0x27],	%l2
	movg	%xcc,	%g6,	%o1
	restore %l1, %l6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o7,	%l5,	%i6
	fcmped	%fcc0,	%f16,	%f12
	fcmpd	%fcc2,	%f22,	%f18
	sth	%l4,	[%l7 + 0x40]
	xnor	%o4,	0x0296,	%l0
	edge16ln	%o3,	%i5,	%o0
	movl	%xcc,	%g3,	%g1
	stb	%i0,	[%l7 + 0x52]
	sdivx	%g2,	0x1926,	%g7
	ldsw	[%l7 + 0x74],	%g4
	array16	%l3,	%g5,	%i1
	udivx	%i7,	0x1F95,	%o2
	fcmpgt16	%f30,	%f8,	%o5
	edge8n	%i3,	%o6,	%i2
	fmovrde	%g6,	%f28,	%f16
	xor	%l2,	0x139C,	%o1
	popc	%l6,	%l1
	fcmpes	%fcc0,	%f24,	%f17
	subc	%i4,	%o7,	%l5
	fmovs	%f10,	%f21
	mulscc	%i6,	%l4,	%l0
	array32	%o4,	%o3,	%o0
	movg	%xcc,	%g3,	%i5
	movgu	%icc,	%i0,	%g1
	andncc	%g7,	%g2,	%g4
	fpack32	%f30,	%f16,	%f6
	alignaddrl	%l3,	%g5,	%i7
	sir	0x0757
	edge16l	%o2,	%o5,	%i3
	subc	%i1,	%i2,	%g6
	fmovsl	%xcc,	%f2,	%f10
	save %o6, 0x02C7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l6,	%o1,	%l1
	movvc	%xcc,	%i4,	%o7
	srl	%i6,	0x1C,	%l5
	movrlz	%l0,	%o4,	%o3
	stw	%l4,	[%l7 + 0x1C]
	nop
	set	0x6D, %i3
	ldsb	[%l7 + %i3],	%g3
	fexpand	%f12,	%f26
	andncc	%i5,	%o0,	%g1
	alignaddrl	%i0,	%g2,	%g7
	movrlez	%g4,	%g5,	%l3
	sll	%o2,	0x1F,	%i7
	nop
	set	0x7C, %o4
	ldsh	[%l7 + %o4],	%o5
	edge32	%i3,	%i1,	%g6
	subc	%o6,	0x10F3,	%i2
	movrne	%l2,	%l6,	%o1
	fmovsle	%icc,	%f30,	%f3
	movvs	%icc,	%i4,	%l1
	stb	%i6,	[%l7 + 0x7B]
	fmovrdlez	%l5,	%f18,	%f16
	movg	%icc,	%o7,	%l0
	edge32l	%o3,	%o4,	%l4
	ldsb	[%l7 + 0x3E],	%g3
	ldsb	[%l7 + 0x0D],	%i5
	popc	0x1D0D,	%g1
	ldx	[%l7 + 0x20],	%i0
	lduw	[%l7 + 0x6C],	%g2
	sllx	%g7,	%g4,	%g5
	ldd	[%l7 + 0x10],	%f28
	andncc	%l3,	%o0,	%i7
	sir	0x1BBC
	edge32ln	%o5,	%i3,	%i1
	ldsw	[%l7 + 0x60],	%o2
	fnot1	%f28,	%f24
	or	%o6,	%g6,	%i2
	edge8l	%l6,	%o1,	%i4
	movl	%icc,	%l1,	%i6
	mulx	%l5,	0x1209,	%l2
	fandnot1	%f14,	%f2,	%f12
	popc	0x1F7E,	%l0
	sll	%o3,	0x0A,	%o4
	sethi	0x1079,	%o7
	udiv	%g3,	0x1B2E,	%i5
	movvs	%icc,	%l4,	%i0
	udivx	%g2,	0x0B7F,	%g1
	addccc	%g7,	0x194F,	%g4
	mulx	%g5,	%l3,	%o0
	movrne	%i7,	%o5,	%i1
	fmovda	%icc,	%f29,	%f30
	std	%f26,	[%l7 + 0x28]
	movpos	%icc,	%i3,	%o6
	movpos	%xcc,	%g6,	%o2
	ldsw	[%l7 + 0x34],	%i2
	umulcc	%o1,	%i4,	%l6
	addcc	%l1,	0x1882,	%i6
	fcmps	%fcc1,	%f31,	%f12
	edge16	%l2,	%l0,	%o3
	edge32l	%l5,	%o4,	%o7
	fandnot2s	%f12,	%f19,	%f8
	movrlz	%g3,	%i5,	%l4
	fcmpeq32	%f0,	%f12,	%g2
	edge16l	%i0,	%g1,	%g4
	movcc	%xcc,	%g7,	%l3
	fmuld8ulx16	%f25,	%f8,	%f22
	sllx	%o0,	0x0A,	%g5
	sethi	0x08D4,	%o5
	edge8n	%i7,	%i1,	%i3
	array32	%g6,	%o2,	%o6
	movle	%xcc,	%o1,	%i4
	movvc	%xcc,	%i2,	%l1
	lduw	[%l7 + 0x20],	%l6
	fxors	%f15,	%f13,	%f29
	edge8n	%l2,	%l0,	%i6
	xor	%o3,	%o4,	%l5
	nop
	set	0x2E, %l1
	lduh	[%l7 + %l1],	%g3
	array16	%o7,	%i5,	%g2
	smulcc	%i0,	%g1,	%g4
	fmovspos	%icc,	%f0,	%f3
	sllx	%g7,	%l4,	%o0
	andn	%l3,	%o5,	%i7
	alignaddr	%i1,	%i3,	%g5
	fcmped	%fcc1,	%f10,	%f14
	ldub	[%l7 + 0x34],	%g6
	sdivx	%o2,	0x03CD,	%o1
	fcmps	%fcc3,	%f12,	%f7
	array8	%i4,	%i2,	%o6
	sir	0x1043
	fmovrslz	%l1,	%f7,	%f16
	sth	%l2,	[%l7 + 0x1A]
	fpadd16s	%f17,	%f9,	%f30
	subc	%l0,	0x1A3A,	%i6
	xnorcc	%l6,	%o3,	%l5
	movcc	%xcc,	%o4,	%g3
	xor	%o7,	0x1085,	%i5
	std	%f26,	[%l7 + 0x58]
	edge32l	%g2,	%g1,	%g4
	udivcc	%g7,	0x1F3E,	%i0
	ldub	[%l7 + 0x16],	%l4
	sub	%l3,	%o0,	%i7
	edge16	%o5,	%i3,	%i1
	movle	%xcc,	%g6,	%o2
	ldd	[%l7 + 0x20],	%f30
	sllx	%o1,	%i4,	%i2
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	edge32	%o6,	%l0,	%i6
	siam	0x5
	orn	%l6,	%l5,	%o4
	xnorcc	%o3,	%o7,	%i5
	andncc	%g2,	%g1,	%g4
	edge32ln	%g7,	%i0,	%g3
	fsrc2	%f6,	%f6
	movne	%xcc,	%l4,	%o0
	sdiv	%i7,	0x1C5D,	%o5
	fmovrdne	%i3,	%f26,	%f24
	umul	%i1,	%l3,	%g6
	array16	%o2,	%o1,	%i2
	lduw	[%l7 + 0x0C],	%g5
	fnot2	%f22,	%f24
	srax	%i4,	0x09,	%l2
	fnegs	%f24,	%f15
	move	%xcc,	%l1,	%l0
	fmovdg	%xcc,	%f25,	%f28
	edge32	%o6,	%l6,	%l5
	fnors	%f17,	%f19,	%f6
	fmovdgu	%xcc,	%f4,	%f2
	lduw	[%l7 + 0x08],	%o4
	lduw	[%l7 + 0x68],	%i6
	edge16n	%o3,	%o7,	%i5
	fnot2s	%f27,	%f26
	umulcc	%g1,	0x1AF7,	%g2
	sdivcc	%g7,	0x06AA,	%g4
	fandnot2s	%f25,	%f22,	%f23
	umul	%i0,	%g3,	%l4
	movrlz	%i7,	0x09E,	%o5
	ldsh	[%l7 + 0x64],	%o0
	ldd	[%l7 + 0x70],	%f28
	bshuffle	%f26,	%f30,	%f4
	fnors	%f13,	%f14,	%f11
	alignaddrl	%i1,	%l3,	%g6
	fpsub16	%f14,	%f20,	%f10
	edge32l	%i3,	%o1,	%i2
	ldd	[%l7 + 0x30],	%g4
	mulscc	%o2,	%i4,	%l2
	fexpand	%f21,	%f6
	array16	%l0,	%l1,	%o6
	fmovrdlez	%l6,	%f10,	%f16
	fmul8x16au	%f3,	%f8,	%f6
	fmovrsgez	%o4,	%f19,	%f6
	xor	%i6,	%l5,	%o7
	movleu	%xcc,	%i5,	%g1
	ldsb	[%l7 + 0x6C],	%o3
	fones	%f10
	movle	%icc,	%g2,	%g7
	movrne	%i0,	%g4,	%g3
	faligndata	%f6,	%f22,	%f4
	udivcc	%i7,	0x0EBD,	%l4
	array16	%o0,	%i1,	%l3
	fcmped	%fcc3,	%f8,	%f18
	movrgz	%g6,	0x056,	%i3
	addc	%o5,	%o1,	%g5
	edge16n	%o2,	%i4,	%i2
	fmovdvc	%icc,	%f17,	%f9
	std	%f30,	[%l7 + 0x70]
	fornot1	%f2,	%f12,	%f30
	ldd	[%l7 + 0x30],	%f0
	save %l0, 0x147B, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o6,	%l6,	%l2
	fmul8x16	%f14,	%f16,	%f12
	lduh	[%l7 + 0x0E],	%i6
	fmul8x16au	%f17,	%f9,	%f30
	array16	%l5,	%o4,	%i5
	fmovs	%f18,	%f10
	movcc	%xcc,	%o7,	%o3
	xorcc	%g2,	0x17D8,	%g7
	or	%g1,	0x1FED,	%g4
	subcc	%i0,	%i7,	%g3
	add	%l4,	0x1C65,	%o0
	fcmpeq16	%f6,	%f14,	%i1
	fexpand	%f5,	%f10
	mulx	%l3,	%g6,	%o5
	sir	0x1831
	array32	%o1,	%i3,	%o2
	sth	%g5,	[%l7 + 0x1E]
	movn	%xcc,	%i4,	%i2
	fmovs	%f8,	%f19
	sdivcc	%l1,	0x06BE,	%o6
	fandnot1	%f16,	%f0,	%f16
	sllx	%l6,	0x1A,	%l0
	andn	%l2,	0x0129,	%l5
	udiv	%o4,	0x06B9,	%i5
	fmovse	%icc,	%f13,	%f21
	sll	%o7,	%o3,	%i6
	srax	%g2,	%g7,	%g4
	fsrc2s	%f2,	%f4
	ldd	[%l7 + 0x38],	%g0
	addccc	%i7,	0x05BD,	%i0
	udivcc	%g3,	0x0BD1,	%o0
	andncc	%i1,	%l3,	%l4
	fexpand	%f24,	%f12
	ldsw	[%l7 + 0x74],	%o5
	edge32ln	%o1,	%i3,	%g6
	edge16	%g5,	%i4,	%i2
	subccc	%o2,	%l1,	%l6
	edge32n	%o6,	%l2,	%l0
	sub	%l5,	0x0B33,	%o4
	fornot1s	%f16,	%f3,	%f1
	movrgez	%i5,	%o7,	%o3
	mova	%xcc,	%i6,	%g2
	fcmpne16	%f6,	%f0,	%g4
	addccc	%g7,	%i7,	%g1
	mova	%icc,	%g3,	%o0
	nop
	set	0x30, %i4
	stw	%i1,	[%l7 + %i4]
	ldsw	[%l7 + 0x30],	%l3
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%f2
	umulcc	%l4,	0x02B7,	%i0
	fmovdleu	%icc,	%f19,	%f11
	fornot2	%f6,	%f22,	%f28
	ldsb	[%l7 + 0x3A],	%o5
	edge16l	%i3,	%g6,	%g5
	movpos	%icc,	%i4,	%i2
	sll	%o2,	%l1,	%l6
	andncc	%o1,	%l2,	%o6
	alignaddrl	%l5,	%l0,	%i5
	fmovdvc	%icc,	%f2,	%f4
	sethi	0x0D64,	%o7
	nop
	set	0x58, %g4
	stw	%o4,	[%l7 + %g4]
	orncc	%o3,	%g2,	%g4
	subcc	%g7,	%i7,	%i6
	orcc	%g3,	0x062B,	%g1
	fpadd32s	%f10,	%f21,	%f12
	edge8	%i1,	%o0,	%l4
	andn	%i0,	0x0C72,	%l3
	fmovda	%icc,	%f25,	%f31
	subc	%i3,	0x17DF,	%o5
	movle	%icc,	%g5,	%g6
	sdivcc	%i2,	0x1C39,	%o2
	edge8n	%i4,	%l1,	%o1
	srl	%l2,	%o6,	%l6
	movge	%xcc,	%l5,	%i5
	movneg	%xcc,	%l0,	%o4
	sub	%o3,	0x0016,	%o7
	andncc	%g2,	%g4,	%g7
	edge32l	%i6,	%g3,	%i7
	movn	%xcc,	%i1,	%o0
	addccc	%l4,	0x1555,	%g1
	array8	%i0,	%l3,	%o5
	movne	%xcc,	%g5,	%g6
	movgu	%icc,	%i3,	%i2
	addcc	%o2,	0x04C5,	%i4
	movrlez	%o1,	0x007,	%l2
	subc	%o6,	0x1EA9,	%l6
	fandnot2s	%f9,	%f9,	%f5
	st	%f8,	[%l7 + 0x20]
	ldub	[%l7 + 0x17],	%l5
	stw	%l1,	[%l7 + 0x78]
	movrlez	%i5,	%o4,	%l0
	edge8ln	%o3,	%g2,	%g4
	ldsh	[%l7 + 0x68],	%g7
	fmovdn	%xcc,	%f16,	%f19
	std	%f26,	[%l7 + 0x30]
	edge16	%i6,	%o7,	%g3
	fmovdl	%icc,	%f10,	%f9
	fnor	%f6,	%f12,	%f28
	srax	%i1,	%o0,	%l4
	udivx	%g1,	0x12BF,	%i7
	stw	%i0,	[%l7 + 0x0C]
	movpos	%xcc,	%o5,	%g5
	edge32	%l3,	%i3,	%i2
	sir	0x096F
	smul	%o2,	%g6,	%i4
	restore %l2, %o1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x6A, %l0
	ldsh	[%l7 + %l0],	%l5
	udiv	%l1,	0x0ED7,	%l6
	xnor	%i5,	0x0CE4,	%o4
	bshuffle	%f2,	%f10,	%f0
	ldd	[%l7 + 0x28],	%o2
	fmovscs	%icc,	%f24,	%f29
	orncc	%l0,	0x094C,	%g4
	stx	%g7,	[%l7 + 0x08]
	sdiv	%i6,	0x033D,	%g2
	movre	%g3,	%i1,	%o7
	edge8n	%o0,	%l4,	%g1
	bshuffle	%f20,	%f6,	%f30
	fmovdvc	%xcc,	%f23,	%f28
	siam	0x7
	sub	%i7,	0x0CF6,	%i0
	nop
	set	0x50, %l6
	std	%f20,	[%l7 + %l6]
	fpack32	%f24,	%f28,	%f20
	edge32ln	%g5,	%o5,	%l3
	add	%i3,	0x04E7,	%o2
	udiv	%g6,	0x1680,	%i2
	movvs	%xcc,	%i4,	%l2
	edge16l	%o1,	%o6,	%l1
	addccc	%l5,	%i5,	%o4
	fnot1	%f26,	%f14
	subccc	%l6,	0x00A7,	%l0
	andn	%g4,	%o3,	%g7
	ldd	[%l7 + 0x78],	%f8
	mulx	%i6,	%g3,	%i1
	edge32n	%g2,	%o7,	%l4
	umulcc	%o0,	%g1,	%i0
	movrlez	%g5,	0x222,	%o5
	movg	%xcc,	%l3,	%i7
	orn	%i3,	0x0575,	%o2
	fmovrsgz	%i2,	%f21,	%f24
	movre	%g6,	0x28A,	%i4
	subc	%l2,	%o1,	%l1
	movneg	%icc,	%l5,	%i5
	fandnot2s	%f4,	%f22,	%f16
	smulcc	%o4,	0x0976,	%o6
	xorcc	%l6,	%l0,	%g4
	fmovsle	%xcc,	%f15,	%f17
	fmovsvc	%xcc,	%f5,	%f5
	add	%g7,	0x126D,	%o3
	movvs	%icc,	%i6,	%g3
	fxnors	%f17,	%f9,	%f17
	array32	%g2,	%i1,	%o7
	sethi	0x0197,	%o0
	fnot2s	%f0,	%f16
	faligndata	%f22,	%f6,	%f4
	movcc	%xcc,	%l4,	%i0
	sub	%g5,	0x1B2D,	%g1
	edge8l	%l3,	%o5,	%i3
	fpsub16s	%f4,	%f28,	%f22
	mulx	%o2,	0x050C,	%i2
	movcc	%icc,	%g6,	%i7
	nop
	set	0x58, %g2
	stx	%i4,	[%l7 + %g2]
	srl	%l2,	0x09,	%l1
	fmovdn	%icc,	%f1,	%f9
	movrlz	%o1,	0x182,	%l5
	udiv	%i5,	0x0DB1,	%o4
	udiv	%o6,	0x0AD2,	%l6
	sub	%g4,	0x178A,	%l0
	movl	%xcc,	%g7,	%i6
	fabss	%f4,	%f8
	sra	%g3,	0x15,	%o3
	fpack32	%f20,	%f28,	%f16
	fornot1s	%f23,	%f11,	%f10
	fmuld8sux16	%f8,	%f31,	%f22
	edge32n	%g2,	%o7,	%i1
	andcc	%o0,	%l4,	%i0
	sub	%g5,	0x1EE5,	%l3
	edge16n	%o5,	%i3,	%o2
	fmovdgu	%icc,	%f25,	%f25
	xor	%i2,	0x16D4,	%g6
	andcc	%i7,	0x09F2,	%g1
	fpsub16s	%f11,	%f21,	%f8
	edge32l	%l2,	%i4,	%l1
	stw	%l5,	[%l7 + 0x18]
	movcs	%xcc,	%o1,	%i5
	fpack32	%f30,	%f30,	%f26
	fcmpne32	%f6,	%f10,	%o4
	lduw	[%l7 + 0x6C],	%o6
	edge8n	%g4,	%l6,	%l0
	stw	%i6,	[%l7 + 0x50]
	movpos	%icc,	%g3,	%g7
	sdivcc	%g2,	0x084E,	%o7
	sra	%i1,	%o0,	%l4
	xnor	%o3,	0x1700,	%i0
	ldsh	[%l7 + 0x66],	%l3
	sir	0x063D
	sllx	%o5,	0x09,	%g5
	fandnot1	%f24,	%f28,	%f20
	sdiv	%i3,	0x10A0,	%i2
	fpsub32	%f30,	%f14,	%f12
	fsrc1	%f18,	%f24
	edge16	%o2,	%i7,	%g6
	fmul8x16	%f25,	%f6,	%f8
	movl	%xcc,	%g1,	%i4
	edge8n	%l2,	%l1,	%l5
	udiv	%o1,	0x18D2,	%i5
	movle	%icc,	%o6,	%o4
	fmovrsne	%l6,	%f23,	%f22
	sll	%l0,	%i6,	%g4
	edge32n	%g7,	%g2,	%o7
	fmovsvc	%xcc,	%f3,	%f30
	fcmpd	%fcc1,	%f28,	%f18
	srax	%i1,	0x07,	%o0
	fmovdn	%icc,	%f2,	%f12
	srlx	%l4,	0x15,	%o3
	sdivcc	%g3,	0x0066,	%l3
	edge8l	%o5,	%i0,	%i3
	save %g5, 0x1CC1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i7,	%g6,	%o2
	for	%f4,	%f26,	%f24
	sth	%g1,	[%l7 + 0x66]
	movrlz	%i4,	0x14C,	%l2
	edge32l	%l5,	%l1,	%o1
	edge32ln	%o6,	%i5,	%o4
	movrne	%l0,	%l6,	%i6
	fzeros	%f13
	edge16n	%g4,	%g7,	%o7
	std	%f10,	[%l7 + 0x18]
	mulx	%g2,	%o0,	%i1
	edge32ln	%l4,	%o3,	%g3
	edge8ln	%o5,	%i0,	%l3
	edge32n	%i3,	%g5,	%i7
	st	%f20,	[%l7 + 0x58]
	orn	%g6,	%o2,	%g1
	sethi	0x1705,	%i4
	fmovrslz	%i2,	%f18,	%f12
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	edge8l	%o6,	%i5,	%l1
	sllx	%o4,	%l0,	%i6
	movrgez	%g4,	%g7,	%l6
	or	%o7,	0x1B27,	%o0
	fandnot1s	%f12,	%f29,	%f25
	movrlez	%g2,	0x106,	%i1
	subcc	%o3,	%l4,	%g3
	movl	%icc,	%o5,	%i0
	movpos	%xcc,	%l3,	%g5
	umul	%i7,	%g6,	%i3
	movpos	%icc,	%g1,	%o2
	movrne	%i2,	%i4,	%l2
	fmovrsne	%o1,	%f27,	%f26
	fand	%f16,	%f6,	%f6
	fnot2s	%f31,	%f25
	add	%l5,	0x0169,	%i5
	movre	%o6,	0x040,	%o4
	movrlez	%l0,	%i6,	%l1
	ld	[%l7 + 0x30],	%f7
	st	%f28,	[%l7 + 0x60]
	alignaddr	%g7,	%g4,	%l6
	movleu	%xcc,	%o0,	%g2
	or	%i1,	%o3,	%l4
	mulscc	%g3,	0x0B7A,	%o5
	xnor	%o7,	0x1134,	%i0
	orcc	%l3,	%i7,	%g5
	fmovrdlz	%g6,	%f0,	%f24
	fpsub16	%f4,	%f26,	%f10
	edge8n	%g1,	%i3,	%o2
	fmovdge	%xcc,	%f18,	%f1
	add	%i4,	%l2,	%o1
	sethi	0x0CF2,	%l5
	sub	%i2,	%o6,	%o4
	subcc	%l0,	%i6,	%i5
	smul	%g7,	%g4,	%l1
	fand	%f26,	%f28,	%f30
	edge16l	%o0,	%g2,	%i1
	ldub	[%l7 + 0x70],	%o3
	edge32	%l4,	%l6,	%o5
	fpsub16s	%f19,	%f28,	%f9
	umul	%g3,	0x0E07,	%i0
	fmovscc	%xcc,	%f1,	%f11
	ldsh	[%l7 + 0x4E],	%o7
	fmovdle	%icc,	%f11,	%f14
	fnand	%f8,	%f18,	%f4
	edge8l	%l3,	%g5,	%g6
	edge32	%i7,	%g1,	%o2
	sdiv	%i4,	0x1CF2,	%l2
	orn	%o1,	%l5,	%i3
	ldx	[%l7 + 0x08],	%i2
	edge32	%o6,	%l0,	%o4
	sub	%i6,	%g7,	%i5
	fmovsg	%icc,	%f17,	%f11
	fcmpne32	%f0,	%f2,	%g4
	alignaddrl	%o0,	%l1,	%g2
	movcs	%icc,	%o3,	%i1
	fmovsge	%xcc,	%f22,	%f25
	lduh	[%l7 + 0x2E],	%l4
	edge32n	%o5,	%l6,	%g3
	fmovsl	%xcc,	%f19,	%f10
	addccc	%i0,	%o7,	%g5
	std	%f14,	[%l7 + 0x60]
	sdivx	%l3,	0x11B0,	%i7
	lduw	[%l7 + 0x2C],	%g1
	addccc	%o2,	%g6,	%l2
	movgu	%xcc,	%o1,	%l5
	edge32ln	%i3,	%i2,	%i4
	mova	%xcc,	%l0,	%o4
	addcc	%i6,	0x020A,	%g7
	fxnors	%f13,	%f12,	%f30
	sll	%i5,	0x0F,	%o6
	movrgz	%o0,	%g4,	%l1
	movg	%xcc,	%g2,	%i1
	xor	%o3,	%o5,	%l4
	ldd	[%l7 + 0x08],	%i6
	edge16l	%g3,	%i0,	%o7
	addccc	%l3,	0x15C5,	%i7
	movre	%g5,	0x34C,	%o2
	sdivcc	%g1,	0x0320,	%g6
	movpos	%xcc,	%o1,	%l2
	lduh	[%l7 + 0x50],	%i3
	edge32l	%i2,	%l5,	%l0
	smulcc	%i4,	0x1343,	%i6
	smul	%g7,	%o4,	%i5
	addc	%o0,	%o6,	%g4
	udiv	%g2,	0x009A,	%i1
	lduw	[%l7 + 0x14],	%o3
	xnorcc	%o5,	%l1,	%l4
	lduw	[%l7 + 0x7C],	%l6
	movn	%xcc,	%g3,	%i0
	edge8	%o7,	%i7,	%l3
	fmul8sux16	%f6,	%f4,	%f18
	move	%xcc,	%g5,	%g1
	sth	%o2,	[%l7 + 0x6E]
	andn	%o1,	%g6,	%i3
	st	%f6,	[%l7 + 0x1C]
	sth	%l2,	[%l7 + 0x1E]
	xnorcc	%i2,	%l0,	%l5
	umulcc	%i4,	0x1D36,	%i6
	fnor	%f6,	%f22,	%f4
	st	%f28,	[%l7 + 0x24]
	movcs	%icc,	%g7,	%i5
	array32	%o4,	%o0,	%g4
	orncc	%o6,	%i1,	%g2
	edge32n	%o5,	%l1,	%o3
	ldx	[%l7 + 0x70],	%l4
	movrne	%l6,	0x08E,	%i0
	alignaddrl	%o7,	%g3,	%i7
	alignaddr	%g5,	%g1,	%l3
	fmovscs	%xcc,	%f7,	%f23
	mova	%icc,	%o1,	%o2
	edge16ln	%i3,	%g6,	%l2
	array8	%i2,	%l0,	%l5
	fnegd	%f0,	%f6
	movrne	%i6,	0x17C,	%i4
	movrgez	%g7,	%i5,	%o4
	movgu	%xcc,	%g4,	%o0
	movle	%xcc,	%i1,	%g2
	sir	0x0F24
	movge	%xcc,	%o5,	%l1
	move	%xcc,	%o6,	%o3
	sra	%l6,	0x09,	%l4
	fmul8x16au	%f12,	%f8,	%f2
	smul	%i0,	0x011B,	%o7
	sub	%i7,	%g3,	%g1
	sllx	%l3,	%o1,	%o2
	movrgz	%g5,	0x1C3,	%g6
	movpos	%icc,	%l2,	%i2
	sethi	0x198A,	%i3
	xnor	%l0,	%i6,	%l5
	sth	%g7,	[%l7 + 0x2A]
	edge32n	%i4,	%o4,	%i5
	edge16l	%g4,	%o0,	%i1
	movg	%xcc,	%o5,	%g2
	movg	%xcc,	%o6,	%o3
	movrne	%l6,	0x2E6,	%l1
	fzero	%f8
	addc	%i0,	%l4,	%o7
	fmovsne	%xcc,	%f24,	%f20
	fornot2s	%f20,	%f18,	%f8
	stb	%i7,	[%l7 + 0x10]
	ld	[%l7 + 0x74],	%f7
	edge16	%g1,	%l3,	%g3
	ldsb	[%l7 + 0x54],	%o1
	fcmpgt16	%f26,	%f14,	%g5
	fpackfix	%f16,	%f16
	fmul8sux16	%f28,	%f28,	%f18
	sir	0x0A3D
	ldsb	[%l7 + 0x2A],	%o2
	fmovrdgz	%g6,	%f26,	%f22
	subccc	%i2,	0x09F8,	%l2
	move	%icc,	%i3,	%i6
	movge	%xcc,	%l5,	%l0
	sir	0x0FBD
	sth	%i4,	[%l7 + 0x0C]
	xnor	%g7,	0x0FB9,	%o4
	sra	%i5,	0x12,	%o0
	movg	%icc,	%g4,	%i1
	fnegd	%f24,	%f10
	ldsw	[%l7 + 0x68],	%g2
	andcc	%o6,	%o3,	%l6
	edge8	%l1,	%i0,	%o5
	nop
	set	0x74, %i7
	lduw	[%l7 + %i7],	%l4
	srl	%i7,	0x18,	%g1
	movleu	%icc,	%o7,	%g3
	sllx	%o1,	0x15,	%g5
	fmovsg	%icc,	%f0,	%f21
	ldsb	[%l7 + 0x18],	%l3
	fmovd	%f4,	%f20
	fmovsneg	%icc,	%f14,	%f6
	sdivx	%o2,	0x06BA,	%g6
	movge	%icc,	%i2,	%i3
	nop
	set	0x44, %i6
	ldsw	[%l7 + %i6],	%i6
	fsrc1s	%f14,	%f21
	fcmps	%fcc1,	%f1,	%f20
	udivcc	%l5,	0x10B7,	%l2
	sllx	%i4,	0x17,	%l0
	popc	%g7,	%o4
	smulcc	%i5,	%o0,	%i1
	ldd	[%l7 + 0x78],	%g2
	udivcc	%o6,	0x001A,	%g4
	ldsh	[%l7 + 0x7C],	%l6
	ldub	[%l7 + 0x5D],	%o3
	orn	%l1,	0x0240,	%o5
	addc	%l4,	%i7,	%g1
	nop
	set	0x38, %g6
	std	%f24,	[%l7 + %g6]
	stb	%i0,	[%l7 + 0x0F]
	movgu	%icc,	%o7,	%g3
	movne	%icc,	%o1,	%l3
	lduw	[%l7 + 0x78],	%g5
	movrlez	%o2,	%i2,	%g6
	ldsw	[%l7 + 0x78],	%i3
	fmuld8sux16	%f20,	%f14,	%f8
	edge16ln	%i6,	%l2,	%l5
	andncc	%i4,	%l0,	%g7
	alignaddr	%i5,	%o4,	%o0
	andncc	%g2,	%o6,	%i1
	edge8l	%g4,	%o3,	%l6
	alignaddr	%l1,	%l4,	%i7
	and	%g1,	%i0,	%o5
	movre	%o7,	0x3F8,	%g3
	udiv	%l3,	0x0236,	%g5
	fmovsneg	%xcc,	%f8,	%f14
	edge32n	%o1,	%i2,	%o2
	movleu	%xcc,	%i3,	%i6
	movn	%xcc,	%g6,	%l2
	std	%f10,	[%l7 + 0x28]
	movcs	%xcc,	%i4,	%l0
	fpadd32s	%f1,	%f1,	%f16
	fone	%f20
	edge16l	%g7,	%i5,	%l5
	edge8n	%o4,	%o0,	%g2
	save %o6, %i1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%icc,	%f8,	%f8
	edge32l	%l6,	%l1,	%l4
	addc	%g4,	%i7,	%i0
	umul	%g1,	%o7,	%o5
	fmul8sux16	%f22,	%f18,	%f26
	movrlz	%g3,	0x368,	%l3
	sir	0x02DA
	smulcc	%o1,	0x1DA6,	%i2
	udivx	%g5,	0x18C1,	%o2
	xnor	%i3,	0x0415,	%i6
	array32	%l2,	%g6,	%i4
	sethi	0x1AD9,	%g7
	smul	%i5,	0x1A3D,	%l0
	orcc	%l5,	%o0,	%g2
	st	%f15,	[%l7 + 0x14]
	ldsh	[%l7 + 0x0E],	%o4
	movcc	%icc,	%o6,	%i1
	sdivcc	%o3,	0x153A,	%l6
	sdivcc	%l4,	0x12DE,	%l1
	fmovrdgz	%g4,	%f26,	%f6
	addc	%i0,	0x1F0A,	%g1
	ldd	[%l7 + 0x50],	%i6
	fpsub32	%f4,	%f22,	%f16
	alignaddr	%o7,	%g3,	%l3
	fmovdvs	%icc,	%f30,	%f8
	ldsw	[%l7 + 0x50],	%o1
	subccc	%o5,	0x14F7,	%i2
	addccc	%o2,	0x027B,	%g5
	fmul8sux16	%f26,	%f10,	%f12
	movne	%xcc,	%i3,	%l2
	popc	%g6,	%i4
	movleu	%icc,	%i6,	%g7
	umul	%i5,	%l5,	%l0
	fandnot2	%f6,	%f6,	%f24
	move	%icc,	%o0,	%g2
	addcc	%o4,	0x0C0E,	%o6
	fsrc1s	%f11,	%f13
	addc	%i1,	0x1787,	%l6
	array8	%o3,	%l1,	%l4
	udivx	%g4,	0x07BA,	%g1
	movvc	%xcc,	%i0,	%i7
	alignaddrl	%g3,	%o7,	%l3
	fmovdn	%xcc,	%f22,	%f3
	orncc	%o1,	%i2,	%o2
	nop
	set	0x10, %i5
	lduw	[%l7 + %i5],	%g5
	sethi	0x08DF,	%o5
	edge8l	%i3,	%l2,	%i4
	array8	%g6,	%i6,	%g7
	ldsb	[%l7 + 0x33],	%i5
	smul	%l5,	0x0BBF,	%o0
	edge32l	%l0,	%o4,	%o6
	popc	%i1,	%g2
	std	%f6,	[%l7 + 0x50]
	sethi	0x03E0,	%l6
	lduw	[%l7 + 0x70],	%l1
	edge16n	%l4,	%o3,	%g4
	movgu	%icc,	%g1,	%i7
	ld	[%l7 + 0x34],	%f15
	fmovrsgez	%g3,	%f15,	%f17
	sub	%i0,	%l3,	%o7
	edge8n	%i2,	%o1,	%g5
	movvs	%icc,	%o2,	%i3
	sdivx	%o5,	0x0A16,	%i4
	fpadd32s	%f12,	%f20,	%f2
	andncc	%l2,	%g6,	%g7
	alignaddr	%i5,	%i6,	%o0
	edge32l	%l0,	%l5,	%o6
	movvc	%xcc,	%o4,	%g2
	sdivcc	%l6,	0x0436,	%l1
	sra	%l4,	0x13,	%i1
	movrgez	%o3,	0x3CF,	%g4
	orncc	%i7,	%g3,	%g1
	orn	%l3,	0x1C7B,	%o7
	array8	%i2,	%i0,	%g5
	fors	%f0,	%f9,	%f24
	movl	%xcc,	%o2,	%i3
	smulcc	%o5,	0x1E07,	%o1
	edge32	%i4,	%l2,	%g6
	movg	%icc,	%g7,	%i5
	sdiv	%i6,	0x1A00,	%l0
	edge8l	%o0,	%o6,	%o4
	fmovspos	%xcc,	%f0,	%f29
	umul	%l5,	0x07DE,	%g2
	ldx	[%l7 + 0x08],	%l1
	umul	%l4,	%i1,	%l6
	umul	%g4,	0x1586,	%o3
	orn	%i7,	0x1D0D,	%g1
	fnegs	%f28,	%f13
	sir	0x1ED4
	ld	[%l7 + 0x4C],	%f18
	srlx	%l3,	%g3,	%i2
	edge8l	%o7,	%g5,	%i0
	sdivx	%i3,	0x1C4F,	%o2
	ldsh	[%l7 + 0x5E],	%o5
	popc	%o1,	%l2
	andn	%i4,	0x0045,	%g7
	lduw	[%l7 + 0x5C],	%g6
	sdivcc	%i6,	0x15FA,	%l0
	edge32n	%o0,	%o6,	%o4
	srlx	%l5,	%i5,	%l1
	xorcc	%g2,	0x18E5,	%l4
	sll	%l6,	0x09,	%i1
	edge8	%o3,	%g4,	%g1
	sth	%i7,	[%l7 + 0x1E]
	sethi	0x1028,	%g3
	fmovda	%xcc,	%f1,	%f3
	subc	%i2,	%o7,	%l3
	edge8l	%g5,	%i0,	%o2
	xorcc	%o5,	0x13EE,	%o1
	andn	%l2,	%i3,	%g7
	movvc	%xcc,	%i4,	%g6
	nop
	set	0x74, %l3
	lduh	[%l7 + %l3],	%l0
	array16	%i6,	%o6,	%o4
	ldd	[%l7 + 0x40],	%l4
	movpos	%icc,	%i5,	%l1
	addc	%o0,	0x043B,	%l4
	fmul8x16al	%f18,	%f14,	%f24
	ldsb	[%l7 + 0x78],	%l6
	fsrc1	%f28,	%f22
	movcs	%xcc,	%g2,	%o3
	mova	%icc,	%i1,	%g4
	sdiv	%i7,	0x038A,	%g1
	fpadd16	%f18,	%f18,	%f18
	smul	%i2,	0x172C,	%g3
	sdiv	%l3,	0x05B2,	%o7
	sdivx	%g5,	0x1F24,	%o2
	sra	%i0,	0x0D,	%o1
	andcc	%o5,	0x1E13,	%i3
	stx	%g7,	[%l7 + 0x28]
	alignaddrl	%l2,	%g6,	%i4
	fmovsg	%xcc,	%f21,	%f31
	mulx	%l0,	%o6,	%i6
	ldsb	[%l7 + 0x5D],	%o4
	restore %i5, %l1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o0,	0x08DD,	%l6
	andn	%l4,	%g2,	%i1
	orcc	%g4,	0x194D,	%i7
	edge16ln	%g1,	%i2,	%o3
	save %g3, 0x0958, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g5,	0x15CF,	%o2
	fmovsg	%icc,	%f19,	%f26
	movvc	%xcc,	%l3,	%o1
	fmovdgu	%icc,	%f16,	%f23
	fmovdneg	%xcc,	%f19,	%f20
	fzero	%f26
	orcc	%i0,	0x03CE,	%o5
	alignaddrl	%g7,	%l2,	%g6
	edge16	%i3,	%i4,	%l0
	mulscc	%i6,	0x1379,	%o6
	fpsub32s	%f16,	%f19,	%f4
	movcs	%icc,	%i5,	%o4
	sdivcc	%l1,	0x021A,	%l5
	ldd	[%l7 + 0x30],	%i6
	nop
	set	0x08, %l5
	lduh	[%l7 + %l5],	%l4
	edge8ln	%o0,	%g2,	%g4
	addccc	%i7,	%i1,	%g1
	fmovsle	%xcc,	%f2,	%f17
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	edge8n	%o3,	%g5,	%l3
	for	%f6,	%f6,	%f18
	stw	%o2,	[%l7 + 0x1C]
	save %o1, %i0, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g7,	%l2,	%g6
	fpackfix	%f30,	%f3
	edge16	%i3,	%l0,	%i6
	sdivx	%o6,	0x019A,	%i4
	umulcc	%i5,	0x15A1,	%o4
	std	%f12,	[%l7 + 0x18]
	sir	0x11AB
	fmovdl	%icc,	%f12,	%f26
	lduw	[%l7 + 0x28],	%l5
	fmovrde	%l6,	%f6,	%f20
	fcmpne32	%f30,	%f12,	%l4
	edge16n	%l1,	%o0,	%g4
	mova	%xcc,	%i7,	%g2
	ld	[%l7 + 0x40],	%f19
	fmovrse	%i1,	%f23,	%f18
	add	%g1,	0x19BF,	%i2
	movge	%xcc,	%g3,	%o3
	ldsw	[%l7 + 0x64],	%g5
	fpsub32	%f4,	%f10,	%f6
	sdivx	%l3,	0x0A91,	%o7
	bshuffle	%f2,	%f4,	%f0
	andcc	%o1,	%o2,	%i0
	movl	%xcc,	%g7,	%o5
	movl	%xcc,	%l2,	%g6
	fmul8x16au	%f10,	%f5,	%f2
	addcc	%i3,	0x03F1,	%i6
	orn	%l0,	%o6,	%i4
	xnorcc	%i5,	%o4,	%l6
	mulx	%l5,	%l1,	%l4
	fmovse	%icc,	%f14,	%f10
	xnor	%o0,	%g4,	%i7
	edge16l	%i1,	%g2,	%g1
	movg	%xcc,	%g3,	%o3
	edge32ln	%i2,	%l3,	%o7
	ldd	[%l7 + 0x48],	%f2
	fmovdvc	%xcc,	%f0,	%f19
	fand	%f16,	%f6,	%f6
	or	%o1,	0x1606,	%g5
	fmovdvc	%xcc,	%f2,	%f6
	movcc	%icc,	%i0,	%g7
	std	%f20,	[%l7 + 0x08]
	movvs	%icc,	%o5,	%o2
	addccc	%l2,	0x159A,	%g6
	movn	%xcc,	%i6,	%l0
	fones	%f15
	movrlz	%o6,	%i4,	%i3
	sllx	%i5,	%o4,	%l6
	fmovrse	%l5,	%f14,	%f30
	ld	[%l7 + 0x6C],	%f16
	fmovrslz	%l1,	%f0,	%f24
	ld	[%l7 + 0x10],	%f29
	fpadd32s	%f30,	%f20,	%f19
	movg	%xcc,	%l4,	%o0
	nop
	set	0x70, %l4
	stx	%g4,	[%l7 + %l4]
	edge16n	%i1,	%g2,	%g1
	movleu	%xcc,	%i7,	%g3
	fmovrse	%o3,	%f7,	%f12
	orn	%i2,	%o7,	%l3
	nop
	set	0x08, %o1
	ldx	[%l7 + %o1],	%g5
	edge16	%o1,	%i0,	%g7
	and	%o5,	%o2,	%l2
	xnorcc	%g6,	%i6,	%o6
	sra	%l0,	0x16,	%i4
	stw	%i3,	[%l7 + 0x20]
	addcc	%i5,	0x1746,	%l6
	and	%o4,	0x14C6,	%l5
	addccc	%l1,	%o0,	%l4
	fpadd16	%f8,	%f26,	%f18
	edge16ln	%g4,	%g2,	%g1
	fcmpeq32	%f18,	%f30,	%i1
	movvc	%xcc,	%g3,	%o3
	fmovdvc	%icc,	%f23,	%f1
	fmovde	%icc,	%f8,	%f24
	add	%i7,	%i2,	%o7
	ld	[%l7 + 0x10],	%f2
	movpos	%xcc,	%l3,	%o1
	alignaddr	%i0,	%g7,	%o5
	sdivcc	%g5,	0x0204,	%l2
	movrgz	%o2,	%g6,	%o6
	and	%l0,	0x0A5A,	%i6
	ldub	[%l7 + 0x6E],	%i3
	mulscc	%i4,	%i5,	%l6
	addc	%l5,	0x1D5E,	%o4
	fpsub16s	%f5,	%f30,	%f0
	stx	%l1,	[%l7 + 0x38]
	edge32l	%l4,	%o0,	%g2
	fpsub16	%f26,	%f26,	%f22
	andn	%g1,	%i1,	%g3
	addcc	%o3,	0x0025,	%i7
	fxor	%f28,	%f14,	%f28
	restore %g4, %o7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l3,	%o1,	%i0
	movrgez	%o5,	%g7,	%l2
	sllx	%g5,	0x09,	%o2
	fmovrslz	%o6,	%f11,	%f23
	fmovdcs	%icc,	%f16,	%f1
	xor	%l0,	0x013C,	%g6
	movvc	%xcc,	%i6,	%i3
	fmuld8ulx16	%f9,	%f8,	%f4
	edge16ln	%i4,	%i5,	%l5
	fcmped	%fcc0,	%f0,	%f24
	movrgz	%o4,	0x351,	%l6
	edge8	%l4,	%o0,	%g2
	sub	%g1,	%l1,	%i1
	fcmped	%fcc1,	%f10,	%f0
	srax	%o3,	0x01,	%i7
	fxnor	%f22,	%f16,	%f28
	xor	%g3,	0x12A7,	%g4
	mulscc	%o7,	0x1EF5,	%l3
	movg	%icc,	%i2,	%i0
	addcc	%o5,	0x144D,	%g7
	addcc	%l2,	%g5,	%o2
	edge16	%o6,	%o1,	%l0
	fandnot1s	%f5,	%f3,	%f25
	move	%icc,	%i6,	%i3
	fmovrse	%i4,	%f21,	%f22
	udivx	%i5,	0x0BEF,	%l5
	array16	%o4,	%g6,	%l4
	stw	%l6,	[%l7 + 0x44]
	movcs	%icc,	%o0,	%g1
	orncc	%l1,	%g2,	%o3
	orncc	%i7,	%g3,	%i1
	fmovsgu	%icc,	%f22,	%f9
	srl	%o7,	%g4,	%l3
	sdivx	%i2,	0x08F1,	%o5
	lduh	[%l7 + 0x14],	%i0
	fmovsge	%xcc,	%f20,	%f24
	fmovdcc	%icc,	%f4,	%f26
	ldsw	[%l7 + 0x60],	%l2
	edge16l	%g5,	%g7,	%o6
	stb	%o1,	[%l7 + 0x22]
	or	%o2,	%l0,	%i3
	addcc	%i6,	0x08ED,	%i4
	andcc	%l5,	%o4,	%g6
	ldd	[%l7 + 0x78],	%f26
	movge	%xcc,	%i5,	%l4
	movre	%o0,	0x1CE,	%g1
	st	%f10,	[%l7 + 0x44]
	movg	%icc,	%l1,	%l6
	add	%o3,	0x08B8,	%i7
	fcmpd	%fcc2,	%f30,	%f14
	sdivcc	%g3,	0x0E96,	%g2
	fmovdne	%icc,	%f0,	%f1
	fandnot1s	%f1,	%f30,	%f1
	fmovsne	%icc,	%f31,	%f9
	fcmped	%fcc1,	%f30,	%f30
	stx	%o7,	[%l7 + 0x08]
	xor	%i1,	0x1FE6,	%l3
	move	%icc,	%i2,	%o5
	fnand	%f20,	%f12,	%f6
	sdiv	%g4,	0x0FBF,	%l2
	and	%i0,	%g7,	%o6
	movvs	%xcc,	%g5,	%o1
	ldub	[%l7 + 0x0D],	%o2
	smul	%l0,	0x1837,	%i3
	fcmpne16	%f8,	%f6,	%i6
	nop
	set	0x14, %o6
	ldub	[%l7 + %o6],	%l5
	fmovdle	%icc,	%f21,	%f17
	movrne	%o4,	%g6,	%i5
	array32	%i4,	%l4,	%o0
	array32	%l1,	%l6,	%o3
	umulcc	%i7,	%g3,	%g2
	fmovdvs	%xcc,	%f8,	%f2
	smul	%o7,	%i1,	%g1
	ldd	[%l7 + 0x48],	%f24
	andcc	%i2,	%l3,	%g4
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	orn	%g7,	%o6,	%o1
	edge32n	%o2,	%l0,	%i3
	andn	%i6,	%g5,	%o4
	movleu	%xcc,	%g6,	%i5
	orcc	%l5,	0x10DE,	%i4
	movn	%icc,	%l4,	%l1
	fmovsvc	%xcc,	%f10,	%f8
	movneg	%xcc,	%o0,	%l6
	sub	%i7,	%g3,	%g2
	andncc	%o7,	%o3,	%g1
	st	%f6,	[%l7 + 0x24]
	sub	%i2,	0x0F29,	%l3
	sir	0x1285
	movrlez	%i1,	0x360,	%l2
	alignaddr	%i0,	%o5,	%g4
	move	%xcc,	%g7,	%o6
	addcc	%o1,	0x00B5,	%l0
	edge8l	%i3,	%i6,	%g5
	lduw	[%l7 + 0x74],	%o2
	fones	%f6
	addccc	%o4,	%g6,	%i5
	movneg	%xcc,	%l5,	%l4
	ldsh	[%l7 + 0x36],	%i4
	movne	%icc,	%o0,	%l1
	fnegd	%f10,	%f12
	ldsh	[%l7 + 0x16],	%l6
	fpadd32	%f4,	%f30,	%f4
	and	%g3,	%i7,	%o7
	edge16	%g2,	%g1,	%i2
	xnorcc	%o3,	0x0B32,	%l3
	nop
	set	0x6C, %o5
	ldub	[%l7 + %o5],	%l2
	or	%i0,	0x0A79,	%o5
	edge8ln	%i1,	%g4,	%g7
	sdiv	%o6,	0x1B65,	%o1
	movrgez	%i3,	%i6,	%l0
	movrgez	%g5,	0x2D0,	%o2
	edge32l	%g6,	%o4,	%i5
	ld	[%l7 + 0x38],	%f8
	movre	%l5,	%i4,	%l4
	fornot2	%f20,	%f4,	%f10
	and	%o0,	0x03C7,	%l6
	movge	%icc,	%g3,	%i7
	fmul8x16al	%f22,	%f26,	%f16
	nop
	set	0x70, %i0
	sth	%o7,	[%l7 + %i0]
	movne	%xcc,	%g2,	%g1
	fmovse	%icc,	%f13,	%f21
	movle	%icc,	%i2,	%l1
	fnegd	%f16,	%f24
	movre	%o3,	0x021,	%l3
	sth	%i0,	[%l7 + 0x62]
	subccc	%o5,	0x06B1,	%l2
	fcmple16	%f6,	%f10,	%g4
	fmovrsne	%g7,	%f19,	%f20
	save %i1, 0x11F7, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x50],	%i3
	movg	%icc,	%i6,	%l0
	movl	%icc,	%o1,	%g5
	mulx	%g6,	0x152F,	%o2
	movle	%icc,	%o4,	%l5
	fmovrdlz	%i5,	%f20,	%f30
	add	%i4,	0x0A27,	%o0
	sllx	%l4,	%l6,	%g3
	orcc	%o7,	%i7,	%g1
	lduh	[%l7 + 0x22],	%g2
	mova	%icc,	%i2,	%o3
	movpos	%icc,	%l1,	%l3
	fmovdvs	%xcc,	%f2,	%f18
	sra	%i0,	0x05,	%l2
	edge8ln	%g4,	%g7,	%o5
	fornot2	%f6,	%f18,	%f16
	nop
	set	0x60, %i2
	ldsw	[%l7 + %i2],	%i1
	fmovsg	%icc,	%f23,	%f23
	xor	%i3,	%i6,	%o6
	movpos	%xcc,	%o1,	%l0
	move	%xcc,	%g5,	%g6
	xorcc	%o2,	%o4,	%l5
	movcc	%xcc,	%i5,	%i4
	umulcc	%l4,	%o0,	%l6
	sra	%g3,	%o7,	%i7
	fmovspos	%icc,	%f16,	%f21
	movne	%xcc,	%g1,	%g2
	fandnot2s	%f10,	%f29,	%f25
	move	%xcc,	%i2,	%o3
	sub	%l1,	0x0F93,	%l3
	edge8	%l2,	%i0,	%g7
	fnot1s	%f28,	%f28
	umul	%g4,	0x0364,	%o5
	orncc	%i3,	0x1919,	%i1
	srax	%i6,	%o6,	%l0
	sllx	%o1,	0x10,	%g5
	movvc	%xcc,	%o2,	%o4
	sub	%l5,	0x1D6C,	%i5
	fcmpeq32	%f24,	%f22,	%g6
	ld	[%l7 + 0x68],	%f19
	and	%i4,	%l4,	%o0
	alignaddrl	%g3,	%l6,	%o7
	movrgz	%i7,	0x369,	%g2
	or	%i2,	0x115A,	%o3
	edge8ln	%l1,	%g1,	%l2
	fnot2	%f26,	%f22
	array8	%i0,	%g7,	%g4
	movg	%icc,	%l3,	%i3
	fnot2s	%f4,	%f30
	fmovsge	%icc,	%f0,	%f6
	and	%o5,	%i1,	%i6
	movn	%xcc,	%l0,	%o1
	andcc	%o6,	0x068F,	%g5
	movvs	%xcc,	%o2,	%o4
	ldsw	[%l7 + 0x38],	%i5
	fcmple32	%f2,	%f28,	%g6
	movvc	%xcc,	%i4,	%l5
	sethi	0x0C51,	%o0
	sth	%l4,	[%l7 + 0x58]
	edge16ln	%l6,	%o7,	%i7
	fmovd	%f30,	%f14
	and	%g2,	0x080E,	%i2
	sethi	0x1ADA,	%g3
	ldsb	[%l7 + 0x37],	%l1
	movvc	%icc,	%g1,	%o3
	array32	%l2,	%g7,	%g4
	edge8n	%l3,	%i3,	%i0
	movcc	%icc,	%i1,	%i6
	stw	%o5,	[%l7 + 0x30]
	srax	%l0,	0x18,	%o1
	smulcc	%o6,	0x0260,	%o2
	orcc	%g5,	0x14DB,	%i5
	ldd	[%l7 + 0x70],	%g6
	umulcc	%o4,	0x1ED6,	%l5
	fpsub32	%f12,	%f22,	%f18
	movcc	%xcc,	%i4,	%o0
	andncc	%l6,	%l4,	%o7
	movrne	%g2,	0x232,	%i7
	srl	%g3,	%i2,	%g1
	fcmped	%fcc3,	%f16,	%f18
	sdiv	%l1,	0x0EE1,	%l2
	fmovrdlz	%o3,	%f16,	%f8
	subc	%g4,	%l3,	%i3
	movrlez	%g7,	0x311,	%i0
	ldsb	[%l7 + 0x32],	%i6
	xorcc	%i1,	0x1AEF,	%o5
	orcc	%l0,	%o1,	%o2
	movre	%o6,	0x20E,	%i5
	movrne	%g6,	%o4,	%g5
	movvc	%xcc,	%i4,	%o0
	ldx	[%l7 + 0x58],	%l5
	mulx	%l4,	%l6,	%o7
	fabsd	%f14,	%f20
	fxor	%f22,	%f12,	%f26
	sll	%g2,	%i7,	%g3
	edge8n	%i2,	%g1,	%l2
	fcmpeq32	%f22,	%f10,	%o3
	movleu	%xcc,	%g4,	%l3
	movre	%i3,	%g7,	%l1
	sllx	%i0,	%i6,	%o5
	edge32l	%l0,	%i1,	%o2
	fmul8sux16	%f0,	%f20,	%f28
	movrne	%o6,	%o1,	%g6
	alignaddr	%o4,	%i5,	%i4
	orncc	%o0,	%g5,	%l5
	mulscc	%l6,	0x1C10,	%o7
	add	%g2,	%l4,	%i7
	lduh	[%l7 + 0x4C],	%g3
	add	%i2,	%g1,	%l2
	movrgez	%g4,	0x3D9,	%o3
	movrne	%l3,	%g7,	%i3
	srlx	%l1,	%i0,	%o5
	stx	%l0,	[%l7 + 0x40]
	addcc	%i6,	0x026D,	%i1
	fmovsleu	%icc,	%f28,	%f18
	movcc	%icc,	%o2,	%o6
	st	%f22,	[%l7 + 0x58]
	srlx	%g6,	%o4,	%o1
	movneg	%xcc,	%i5,	%o0
	edge16ln	%i4,	%g5,	%l6
	sll	%l5,	%g2,	%l4
	lduw	[%l7 + 0x44],	%o7
	addc	%i7,	%g3,	%g1
	mulscc	%i2,	%g4,	%l2
	add	%o3,	%l3,	%i3
	movg	%xcc,	%g7,	%i0
	movcc	%xcc,	%l1,	%o5
	srlx	%i6,	%l0,	%o2
	lduw	[%l7 + 0x4C],	%o6
	sllx	%g6,	%o4,	%i1
	ldsh	[%l7 + 0x14],	%o1
	ld	[%l7 + 0x70],	%f4
	ldub	[%l7 + 0x5C],	%o0
	edge16ln	%i4,	%g5,	%i5
	movrgez	%l5,	%l6,	%l4
	add	%g2,	%i7,	%g3
	movrne	%g1,	%i2,	%g4
	movrlez	%o7,	0x2E0,	%l2
	movrgez	%o3,	%l3,	%i3
	fmovdg	%icc,	%f22,	%f25
	fabss	%f9,	%f8
	addcc	%i0,	%g7,	%o5
	fmovdcs	%xcc,	%f2,	%f18
	movrne	%l1,	%l0,	%o2
	movrlz	%o6,	%i6,	%g6
	udiv	%i1,	0x103A,	%o4
	movrlez	%o0,	%i4,	%g5
	movle	%xcc,	%i5,	%l5
	stw	%o1,	[%l7 + 0x34]
	fmovdcc	%icc,	%f11,	%f18
	ld	[%l7 + 0x60],	%f8
	edge32ln	%l6,	%l4,	%i7
	for	%f28,	%f8,	%f0
	fnot2	%f0,	%f2
	andcc	%g2,	0x1E7A,	%g3
	sllx	%i2,	%g1,	%o7
	lduw	[%l7 + 0x20],	%l2
	addcc	%g4,	%l3,	%i3
	srax	%o3,	0x11,	%i0
	edge16l	%o5,	%g7,	%l1
	ldd	[%l7 + 0x58],	%o2
	add	%o6,	%i6,	%g6
	andcc	%i1,	%o4,	%l0
	andncc	%o0,	%i4,	%i5
	fxnors	%f15,	%f28,	%f15
	array8	%g5,	%o1,	%l5
	umulcc	%l4,	%i7,	%l6
	fpack16	%f24,	%f18
	restore %g3, 0x054B, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%g1,	%f29,	%f23
	smul	%i2,	%l2,	%o7
	ldsw	[%l7 + 0x3C],	%l3
	sethi	0x0412,	%i3
	sll	%o3,	%g4,	%i0
	srlx	%g7,	0x1E,	%l1
	movleu	%xcc,	%o2,	%o6
	edge32n	%o5,	%g6,	%i1
	movl	%xcc,	%o4,	%l0
	array16	%o0,	%i6,	%i5
	add	%g5,	0x024B,	%o1
	edge16l	%i4,	%l5,	%l4
	smul	%i7,	0x140A,	%g3
	fsrc2	%f30,	%f26
	fpack32	%f16,	%f12,	%f30
	save %l6, 0x08A7, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0DF4
	or	%g1,	%l2,	%o7
	orncc	%i2,	0x05DF,	%i3
	movneg	%xcc,	%o3,	%g4
	srlx	%l3,	0x02,	%g7
	mova	%xcc,	%l1,	%i0
	stx	%o2,	[%l7 + 0x70]
	array8	%o5,	%g6,	%i1
	edge32l	%o4,	%o6,	%l0
	mulscc	%i6,	%o0,	%i5
	fmovdcc	%icc,	%f2,	%f1
	edge16ln	%o1,	%g5,	%i4
	fmovsvc	%icc,	%f20,	%f29
	sth	%l5,	[%l7 + 0x18]
	ldsh	[%l7 + 0x6E],	%i7
	stx	%g3,	[%l7 + 0x10]
	edge8l	%l4,	%g2,	%l6
	xnor	%g1,	%l2,	%i2
	mulscc	%o7,	0x08B1,	%i3
	udiv	%o3,	0x1C3C,	%g4
	ldsw	[%l7 + 0x08],	%l3
	sethi	0x0A2D,	%g7
	nop
	set	0x6C, %g5
	ldsw	[%l7 + %g5],	%l1
	edge32n	%i0,	%o2,	%g6
	addccc	%o5,	0x125B,	%i1
	movne	%xcc,	%o4,	%l0
	fsrc1s	%f0,	%f3
	fpack32	%f18,	%f18,	%f2
	addccc	%o6,	%i6,	%o0
	movcc	%icc,	%i5,	%o1
	movrlz	%i4,	%l5,	%g5
	ldd	[%l7 + 0x20],	%f8
	xnorcc	%g3,	0x0EC8,	%l4
	udivcc	%g2,	0x1922,	%l6
	subc	%g1,	%i7,	%i2
	fmovde	%icc,	%f26,	%f22
	lduw	[%l7 + 0x54],	%o7
	edge8ln	%i3,	%l2,	%g4
	fmovdge	%icc,	%f10,	%f1
	addcc	%l3,	%o3,	%g7
	movne	%xcc,	%i0,	%o2
	fmovsge	%xcc,	%f29,	%f8
	fnegd	%f10,	%f20
	movn	%icc,	%g6,	%o5
	movrlez	%i1,	%o4,	%l0
	movneg	%xcc,	%o6,	%i6
	fmovscs	%icc,	%f23,	%f20
	andncc	%l1,	%i5,	%o0
	fmovscc	%xcc,	%f10,	%f12
	ld	[%l7 + 0x3C],	%f25
	edge16	%o1,	%i4,	%l5
	alignaddrl	%g3,	%l4,	%g2
	orcc	%g5,	0x169B,	%l6
	fandnot2	%f18,	%f0,	%f8
	fnot2	%f0,	%f14
	ldx	[%l7 + 0x10],	%i7
	and	%g1,	%i2,	%o7
	movn	%xcc,	%l2,	%i3
	andn	%l3,	%o3,	%g7
	sra	%i0,	0x08,	%g4
	andn	%o2,	0x13C5,	%g6
	fmovs	%f2,	%f26
	st	%f11,	[%l7 + 0x78]
	fmovdvc	%xcc,	%f9,	%f7
	ldd	[%l7 + 0x78],	%f20
	orcc	%i1,	%o4,	%o5
	nop
	set	0x32, %g7
	ldsh	[%l7 + %g7],	%l0
	ldsw	[%l7 + 0x30],	%o6
	ldd	[%l7 + 0x38],	%i6
	array32	%l1,	%o0,	%o1
	fmovscc	%xcc,	%f6,	%f29
	nop
	set	0x0C, %g1
	ldsh	[%l7 + %g1],	%i5
	edge16	%i4,	%g3,	%l5
	movrgz	%g2,	%g5,	%l6
	movcs	%xcc,	%i7,	%g1
	and	%i2,	0x0A9F,	%o7
	srl	%l2,	%l4,	%l3
	bshuffle	%f28,	%f20,	%f28
	edge32n	%i3,	%o3,	%i0
	andn	%g7,	%o2,	%g6
	smulcc	%g4,	0x0724,	%i1
	fmovrdgez	%o5,	%f8,	%f10
	movrgez	%l0,	0x21B,	%o6
	sub	%i6,	%l1,	%o4
	alignaddrl	%o0,	%i5,	%i4
	fcmped	%fcc1,	%f0,	%f2
	fzeros	%f14
	movcs	%xcc,	%o1,	%g3
	subc	%l5,	0x00F4,	%g2
	array32	%g5,	%l6,	%g1
	fpadd16s	%f12,	%f30,	%f5
	stx	%i2,	[%l7 + 0x70]
	stx	%i7,	[%l7 + 0x20]
	movcc	%xcc,	%o7,	%l2
	movrgez	%l4,	%i3,	%l3
	edge32l	%o3,	%g7,	%o2
	fnot1	%f2,	%f26
	edge16l	%g6,	%g4,	%i1
	movle	%icc,	%o5,	%i0
	ldsh	[%l7 + 0x76],	%o6
	movpos	%icc,	%i6,	%l0
	sra	%l1,	0x12,	%o4
	ldd	[%l7 + 0x58],	%f2
	andn	%i5,	%o0,	%i4
	fpmerge	%f30,	%f7,	%f26
	fmovda	%xcc,	%f25,	%f30
	movrgz	%o1,	0x1C7,	%l5
	sll	%g2,	0x1F,	%g3
	xnor	%g5,	%g1,	%l6
	subcc	%i7,	%o7,	%i2
	fnegs	%f28,	%f23
	subcc	%l2,	%i3,	%l3
	addcc	%l4,	%o3,	%g7
	ldsh	[%l7 + 0x3E],	%o2
	movneg	%xcc,	%g4,	%g6
	add	%o5,	%i1,	%i0
	and	%o6,	%l0,	%l1
	fmovscs	%xcc,	%f18,	%f8
	edge16n	%o4,	%i6,	%i5
	udivx	%o0,	0x10C1,	%i4
	ldsb	[%l7 + 0x30],	%o1
	xorcc	%g2,	0x00AF,	%l5
	movg	%xcc,	%g3,	%g5
	edge16n	%l6,	%g1,	%o7
	movvc	%icc,	%i7,	%l2
	subc	%i2,	0x06BC,	%i3
	subccc	%l4,	0x1B5C,	%o3
	edge16ln	%g7,	%l3,	%g4
	movn	%xcc,	%g6,	%o2
	srl	%i1,	0x1B,	%o5
	edge8ln	%o6,	%i0,	%l0
	movvc	%icc,	%o4,	%i6
	andncc	%l1,	%o0,	%i4
	andn	%o1,	%i5,	%l5
	umulcc	%g2,	%g5,	%l6
	add	%g1,	0x0AB8,	%o7
	fmuld8ulx16	%f23,	%f5,	%f16
	mova	%icc,	%i7,	%l2
	sth	%i2,	[%l7 + 0x3C]
	bshuffle	%f10,	%f10,	%f8
	movvs	%icc,	%i3,	%l4
	orcc	%o3,	%g7,	%g3
	fornot2s	%f6,	%f12,	%f0
	fornot2	%f10,	%f6,	%f2
	edge16l	%g4,	%l3,	%o2
	orncc	%i1,	%o5,	%g6
	srl	%i0,	%l0,	%o6
	ld	[%l7 + 0x14],	%f31
	subc	%i6,	0x17F1,	%o4
	udiv	%l1,	0x1F2B,	%i4
	fnand	%f12,	%f0,	%f10
	fcmple32	%f24,	%f2,	%o1
	addccc	%o0,	%l5,	%g2
	fabss	%f6,	%f6
	ldx	[%l7 + 0x48],	%g5
	xorcc	%i5,	%g1,	%o7
	subccc	%i7,	0x15B8,	%l6
	addccc	%l2,	%i2,	%i3
	mulscc	%o3,	%l4,	%g3
	addc	%g4,	%g7,	%l3
	orncc	%i1,	0x1545,	%o2
	movne	%icc,	%o5,	%i0
	add	%g6,	0x184B,	%o6
	edge8n	%l0,	%o4,	%i6
	xor	%i4,	%o1,	%o0
	fmovsne	%icc,	%f4,	%f1
	edge8l	%l5,	%l1,	%g5
	fone	%f10
	movrlez	%i5,	%g1,	%o7
	movneg	%xcc,	%g2,	%i7
	movg	%icc,	%l2,	%i2
	edge32ln	%l6,	%o3,	%l4
	addcc	%g3,	0x1E00,	%g4
	movne	%xcc,	%i3,	%l3
	movpos	%icc,	%g7,	%o2
	edge32n	%o5,	%i0,	%g6
	sub	%i1,	0x0718,	%l0
	mulscc	%o6,	%i6,	%i4
	umulcc	%o4,	0x13BC,	%o0
	fmovsn	%icc,	%f14,	%f15
	ld	[%l7 + 0x34],	%f30
	andcc	%l5,	0x19FB,	%o1
	edge8l	%l1,	%g5,	%g1
	fmovd	%f16,	%f4
	udivx	%o7,	0x074D,	%i5
	edge8n	%i7,	%g2,	%i2
	movcc	%icc,	%l2,	%l6
	fmul8x16	%f20,	%f26,	%f28
	movvc	%icc,	%o3,	%l4
	ldsb	[%l7 + 0x56],	%g4
	fsrc2s	%f21,	%f30
	fpadd32	%f18,	%f14,	%f30
	std	%f26,	[%l7 + 0x28]
	subcc	%i3,	0x025E,	%g3
	xor	%l3,	%g7,	%o2
	fmovd	%f18,	%f20
	fmovsvc	%xcc,	%f26,	%f28
	sir	0x0E6C
	lduw	[%l7 + 0x6C],	%o5
	fmovscc	%xcc,	%f28,	%f15
	srax	%i0,	%g6,	%i1
	save %l0, 0x0C85, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o6,	%o4,	%i4
	movrgez	%l5,	0x01D,	%o1
	orncc	%l1,	%o0,	%g5
	fornot2	%f8,	%f6,	%f16
	sethi	0x193B,	%o7
	edge32	%g1,	%i5,	%g2
	addccc	%i2,	0x1FCD,	%l2
	udivx	%i7,	0x0514,	%l6
	sethi	0x07B0,	%o3
	sdivx	%g4,	0x1907,	%l4
	fmovse	%icc,	%f14,	%f31
	smul	%g3,	%l3,	%g7
	movl	%icc,	%i3,	%o5
	fpadd16s	%f10,	%f13,	%f4
	fnor	%f24,	%f4,	%f22
	alignaddr	%o2,	%i0,	%i1
	lduh	[%l7 + 0x4E],	%g6
	addccc	%i6,	%o6,	%l0
	move	%icc,	%o4,	%l5
	movleu	%xcc,	%i4,	%o1
	stw	%o0,	[%l7 + 0x68]
	movrgz	%l1,	0x34E,	%o7
	fmovrse	%g5,	%f23,	%f5
	edge32l	%i5,	%g1,	%g2
	st	%f5,	[%l7 + 0x18]
	subccc	%l2,	0x17D7,	%i7
	udivx	%i2,	0x107C,	%o3
	st	%f29,	[%l7 + 0x10]
	or	%g4,	0x06E0,	%l6
	movl	%icc,	%l4,	%g3
	fmul8sux16	%f24,	%f2,	%f2
	fnot2s	%f10,	%f18
	fcmpgt32	%f16,	%f12,	%g7
	smul	%l3,	0x0222,	%o5
	stw	%i3,	[%l7 + 0x74]
	stx	%i0,	[%l7 + 0x38]
	smul	%o2,	0x082A,	%g6
	sllx	%i1,	%o6,	%i6
	sll	%o4,	0x0E,	%l0
	movl	%xcc,	%i4,	%o1
	subcc	%o0,	%l5,	%l1
	fmuld8sux16	%f25,	%f25,	%f8
	fmul8x16al	%f16,	%f31,	%f6
	fmovrslz	%g5,	%f5,	%f1
	stw	%o7,	[%l7 + 0x60]
	subccc	%i5,	0x161A,	%g2
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	array16	%o3,	%i2,	%g4
	fcmpeq32	%f20,	%f10,	%l4
	sra	%l6,	0x1A,	%g7
	popc	%l3,	%o5
	fmovdleu	%icc,	%f29,	%f18
	edge8n	%i3,	%i0,	%o2
	srax	%g3,	0x1B,	%i1
	fmovdpos	%xcc,	%f22,	%f23
	movvs	%xcc,	%g6,	%i6
	fpsub16	%f2,	%f12,	%f14
	movvs	%icc,	%o4,	%l0
	movrlez	%i4,	0x048,	%o1
	fpackfix	%f26,	%f5
	popc	%o0,	%o6
	smul	%l5,	%l1,	%g5
	udivcc	%o7,	0x1037,	%g2
	edge8	%g1,	%i5,	%i7
	nop
	set	0x2D, %g3
	stb	%o3,	[%l7 + %g3]
	fxnors	%f18,	%f2,	%f12
	movrne	%l2,	0x224,	%i2
	sethi	0x116E,	%l4
	movl	%xcc,	%l6,	%g7
	srl	%g4,	%l3,	%i3
	edge8	%i0,	%o5,	%g3
	movcs	%icc,	%i1,	%g6
	movgu	%icc,	%o2,	%o4
	edge16n	%i6,	%l0,	%o1
	and	%o0,	%i4,	%l5
	ldd	[%l7 + 0x68],	%l0
	popc	0x02E3,	%g5
	fmovsleu	%xcc,	%f1,	%f19
	fmovsgu	%icc,	%f12,	%f3
	ldsh	[%l7 + 0x34],	%o7
	fmovsa	%icc,	%f13,	%f30
	fxor	%f22,	%f4,	%f2
	umul	%g2,	0x1252,	%o6
	umul	%g1,	0x0B21,	%i5
	array16	%i7,	%o3,	%l2
	fmuld8sux16	%f0,	%f6,	%f12
	xnorcc	%i2,	%l4,	%l6
	fzero	%f24
	fmovsne	%xcc,	%f17,	%f5
	stb	%g7,	[%l7 + 0x66]
	sllx	%g4,	0x18,	%l3
	andcc	%i0,	%o5,	%g3
	udivcc	%i3,	0x0B7A,	%g6
	udivx	%o2,	0x0571,	%o4
	stw	%i6,	[%l7 + 0x1C]
	fmovsg	%xcc,	%f10,	%f28
	ldd	[%l7 + 0x78],	%f4
	smulcc	%l0,	%o1,	%o0
	fcmpne32	%f16,	%f0,	%i1
	smul	%l5,	%l1,	%i4
	addccc	%g5,	0x00F6,	%o7
	movrgz	%g2,	0x2DC,	%o6
	sir	0x0556
	edge32	%g1,	%i7,	%i5
	umul	%l2,	%i2,	%l4
	movrgez	%l6,	0x0B1,	%g7
	addcc	%g4,	%o3,	%i0
	fcmpgt32	%f4,	%f30,	%l3
	movrgez	%o5,	0x300,	%g3
	xnorcc	%i3,	%g6,	%o2
	fmovdg	%icc,	%f10,	%f26
	addcc	%i6,	%l0,	%o1
	fornot2	%f6,	%f12,	%f12
	stb	%o0,	[%l7 + 0x3D]
	movrne	%i1,	%o4,	%l5
	srlx	%i4,	0x0E,	%g5
	fcmpeq16	%f12,	%f2,	%o7
	fmovda	%icc,	%f17,	%f23
	xor	%l1,	0x1EAB,	%o6
	and	%g2,	%i7,	%i5
	movvc	%xcc,	%l2,	%g1
	sllx	%l4,	0x16,	%i2
	sir	0x1916
	sllx	%l6,	0x0F,	%g4
	movre	%g7,	0x361,	%i0
	fmovdcs	%xcc,	%f6,	%f3
	movpos	%icc,	%l3,	%o3
	ldx	[%l7 + 0x68],	%g3
	fmovsvs	%xcc,	%f1,	%f21
	srax	%o5,	%g6,	%i3
	fmovsn	%icc,	%f7,	%f2
	st	%f13,	[%l7 + 0x74]
	fmovrslez	%i6,	%f6,	%f10
	movpos	%icc,	%o2,	%l0
	movne	%xcc,	%o1,	%i1
	sub	%o4,	%l5,	%i4
	movl	%xcc,	%g5,	%o0
	ldsw	[%l7 + 0x7C],	%o7
	udivcc	%o6,	0x150A,	%l1
	movvc	%icc,	%g2,	%i7
	sll	%l2,	%i5,	%l4
	movl	%xcc,	%i2,	%g1
	movg	%xcc,	%g4,	%l6
	orncc	%i0,	%g7,	%o3
	fmovrdgz	%l3,	%f0,	%f12
	movgu	%icc,	%g3,	%o5
	movrne	%i3,	%i6,	%g6
	restore %o2, %o1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x10],	%o4
	xor	%i1,	0x1B28,	%l5
	andncc	%g5,	%o0,	%o7
	andn	%o6,	%l1,	%i4
	edge8n	%g2,	%i7,	%i5
	andncc	%l4,	%i2,	%l2
	xor	%g4,	0x08C8,	%g1
	andcc	%l6,	0x0789,	%i0
	alignaddr	%g7,	%o3,	%g3
	subccc	%o5,	%i3,	%i6
	ldub	[%l7 + 0x7A],	%g6
	srlx	%o2,	0x1E,	%l3
	fmul8sux16	%f4,	%f2,	%f10
	movl	%xcc,	%o1,	%o4
	subc	%l0,	%i1,	%g5
	siam	0x3
	nop
	set	0x36, %i1
	sth	%o0,	[%l7 + %i1]
	ldx	[%l7 + 0x28],	%l5
	move	%icc,	%o7,	%o6
	mulx	%l1,	0x17EA,	%g2
	movrne	%i7,	0x1DA,	%i4
	fmovrdgez	%l4,	%f0,	%f18
	move	%icc,	%i5,	%i2
	edge16ln	%g4,	%l2,	%g1
	ldub	[%l7 + 0x5B],	%l6
	fmovsa	%icc,	%f0,	%f5
	stb	%i0,	[%l7 + 0x6F]
	ld	[%l7 + 0x74],	%f31
	srax	%o3,	0x1C,	%g7
	bshuffle	%f24,	%f2,	%f28
	mova	%xcc,	%g3,	%i3
	movrlez	%i6,	0x10C,	%o5
	fors	%f8,	%f19,	%f26
	ldd	[%l7 + 0x38],	%f6
	andcc	%o2,	0x1F76,	%l3
	movge	%icc,	%g6,	%o1
	fmovde	%xcc,	%f29,	%f9
	fmovrdlz	%o4,	%f20,	%f26
	popc	0x144E,	%i1
	sir	0x1A21
	movre	%g5,	0x106,	%o0
	ldx	[%l7 + 0x48],	%l0
	movle	%xcc,	%l5,	%o7
	sub	%l1,	0x0BD3,	%o6
	movvc	%xcc,	%g2,	%i7
	sdivcc	%l4,	0x1EC9,	%i4
	ldx	[%l7 + 0x68],	%i2
	lduw	[%l7 + 0x40],	%i5
	fmovdl	%icc,	%f6,	%f12
	ldsw	[%l7 + 0x50],	%g4
	fcmpgt16	%f12,	%f10,	%g1
	mova	%icc,	%l2,	%l6
	fornot1	%f12,	%f6,	%f24
	or	%i0,	%o3,	%g7
	fmovrde	%g3,	%f30,	%f16
	array32	%i3,	%i6,	%o2
	and	%o5,	%g6,	%o1
	movcc	%xcc,	%o4,	%i1
	edge16ln	%g5,	%l3,	%o0
	ldub	[%l7 + 0x4C],	%l5
	andncc	%l0,	%l1,	%o7
	addccc	%g2,	%o6,	%l4
	fnors	%f17,	%f20,	%f18
	fnot2s	%f6,	%f8
	subcc	%i4,	0x032C,	%i2
	edge32n	%i7,	%g4,	%g1
	addccc	%i5,	%l6,	%l2
	ld	[%l7 + 0x14],	%f25
	fmovsvc	%icc,	%f28,	%f10
	ldsb	[%l7 + 0x6D],	%o3
	mova	%icc,	%g7,	%g3
	movre	%i0,	0x1F5,	%i6
	ldub	[%l7 + 0x16],	%i3
	fxnor	%f30,	%f2,	%f8
	move	%icc,	%o2,	%o5
	lduh	[%l7 + 0x30],	%g6
	sth	%o4,	[%l7 + 0x38]
	fcmpd	%fcc2,	%f28,	%f2
	fmovdvc	%icc,	%f8,	%f7
	subccc	%i1,	0x11B6,	%o1
	edge32n	%g5,	%o0,	%l5
	sdivx	%l3,	0x1A8C,	%l1
	ldsb	[%l7 + 0x62],	%o7
	movge	%icc,	%l0,	%o6
	udivx	%g2,	0x0C7E,	%i4
	fmovsleu	%icc,	%f3,	%f26
	move	%icc,	%l4,	%i2
	smul	%i7,	%g4,	%g1
	movvs	%xcc,	%i5,	%l6
	fmovsvc	%icc,	%f13,	%f6
	xorcc	%l2,	%g7,	%g3
	smulcc	%i0,	%o3,	%i6
	fexpand	%f17,	%f26
	subc	%o2,	0x1AA3,	%i3
	orcc	%o5,	0x1EBC,	%o4
	movge	%icc,	%g6,	%i1
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	addccc	%l3,	0x01B3,	%l5
	std	%f12,	[%l7 + 0x48]
	sdiv	%l1,	0x1834,	%l0
	srl	%o6,	%o7,	%i4
	edge16l	%g2,	%l4,	%i7
	stw	%g4,	[%l7 + 0x68]
	ldub	[%l7 + 0x79],	%g1
	edge32ln	%i2,	%l6,	%l2
	fmovsleu	%xcc,	%f15,	%f9
	movn	%xcc,	%i5,	%g3
	fmovsn	%xcc,	%f9,	%f8
	fmovrdlz	%i0,	%f18,	%f24
	ldx	[%l7 + 0x70],	%g7
	sethi	0x0B58,	%i6
	fornot1s	%f27,	%f24,	%f9
	edge32ln	%o3,	%o2,	%i3
	for	%f20,	%f22,	%f20
	movrgz	%o5,	%g6,	%i1
	movle	%xcc,	%o4,	%o0
	fornot2s	%f25,	%f16,	%f5
	fornot2	%f4,	%f10,	%f4
	alignaddr	%o1,	%l3,	%g5
	edge32n	%l5,	%l1,	%o6
	andcc	%o7,	%l0,	%i4
	andn	%g2,	%i7,	%g4
	movrne	%g1,	0x29B,	%i2
	move	%xcc,	%l6,	%l2
	st	%f3,	[%l7 + 0x14]
	ldd	[%l7 + 0x48],	%f10
	fand	%f10,	%f0,	%f4
	ld	[%l7 + 0x64],	%f28
	fmovdvc	%icc,	%f21,	%f11
	movrgez	%i5,	0x064,	%g3
	fmovdgu	%xcc,	%f17,	%f5
	addccc	%l4,	0x0545,	%g7
	edge32n	%i6,	%o3,	%i0
	fsrc1	%f16,	%f22
	std	%f20,	[%l7 + 0x58]
	fcmpes	%fcc3,	%f30,	%f3
	nop
	set	0x5E, %o7
	ldsh	[%l7 + %o7],	%o2
	ld	[%l7 + 0x34],	%f5
	edge32l	%o5,	%i3,	%i1
	fpack32	%f4,	%f2,	%f0
	movcc	%icc,	%g6,	%o4
	movneg	%xcc,	%o0,	%l3
	stb	%o1,	[%l7 + 0x0A]
	fmovrde	%g5,	%f12,	%f8
	ldub	[%l7 + 0x43],	%l5
	ldx	[%l7 + 0x68],	%o6
	udivx	%l1,	0x18C0,	%l0
	popc	0x1301,	%i4
	lduw	[%l7 + 0x18],	%g2
	andn	%i7,	0x19BD,	%g4
	alignaddrl	%o7,	%i2,	%g1
	srax	%l6,	0x0B,	%i5
	fmovrdgez	%l2,	%f26,	%f4
	movleu	%icc,	%l4,	%g7
	edge32ln	%g3,	%i6,	%i0
	fxnor	%f8,	%f12,	%f24
	lduh	[%l7 + 0x6C],	%o3
	nop
	set	0x60, %o2
	lduw	[%l7 + %o2],	%o2
	std	%f24,	[%l7 + 0x28]
	array8	%o5,	%i3,	%g6
	mova	%xcc,	%i1,	%o4
	movleu	%icc,	%o0,	%l3
	stw	%g5,	[%l7 + 0x64]
	movl	%icc,	%l5,	%o1
	popc	0x0113,	%l1
	xorcc	%o6,	0x0AE6,	%l0
	alignaddr	%g2,	%i7,	%i4
	udivcc	%o7,	0x0DE8,	%i2
	fnor	%f22,	%f8,	%f22
	subc	%g4,	0x144B,	%g1
	movl	%xcc,	%i5,	%l2
	array8	%l6,	%g7,	%g3
	mulx	%l4,	0x1438,	%i6
	movgu	%icc,	%i0,	%o2
	umul	%o5,	%i3,	%o3
	movrlez	%g6,	%i1,	%o4
	smul	%o0,	%g5,	%l3
	movle	%xcc,	%o1,	%l1
	fmovde	%icc,	%f13,	%f31
	array32	%l5,	%o6,	%g2
	fpadd16s	%f24,	%f1,	%f9
	edge32	%i7,	%i4,	%o7
	udivcc	%l0,	0x18A2,	%i2
	edge32n	%g4,	%g1,	%l2
	movrgz	%l6,	0x033,	%g7
	fmul8sux16	%f22,	%f12,	%f0
	fnands	%f24,	%f9,	%f7
	edge32	%g3,	%i5,	%i6
	ldd	[%l7 + 0x20],	%i0
	sethi	0x0FFE,	%l4
	edge16n	%o5,	%i3,	%o2
	andcc	%g6,	%i1,	%o3
	srl	%o0,	%o4,	%l3
	ldd	[%l7 + 0x58],	%g4
	movcs	%xcc,	%l1,	%l5
	xor	%o1,	%g2,	%o6
	fcmped	%fcc2,	%f2,	%f24
	restore %i4, %o7, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i7,	0x1F0A,	%i2
	fornot1	%f30,	%f0,	%f28
	movle	%xcc,	%g1,	%l2
	ldsh	[%l7 + 0x2E],	%g4
	movneg	%icc,	%g7,	%g3
	movl	%icc,	%l6,	%i6
	sethi	0x01B5,	%i0
	addcc	%l4,	%i5,	%i3
	stw	%o5,	[%l7 + 0x24]
	movn	%icc,	%o2,	%i1
	movgu	%xcc,	%g6,	%o3
	movrgz	%o4,	%o0,	%l3
	fnand	%f24,	%f26,	%f2
	movrlz	%g5,	0x3FD,	%l1
	edge8	%l5,	%o1,	%g2
	or	%o6,	0x11EA,	%o7
	subccc	%l0,	0x0E15,	%i7
	ldsw	[%l7 + 0x20],	%i4
	movgu	%xcc,	%i2,	%g1
	fornot2	%f6,	%f2,	%f6
	edge16n	%g4,	%g7,	%g3
	edge32n	%l2,	%l6,	%i6
	xnor	%i0,	%l4,	%i3
	ld	[%l7 + 0x6C],	%f0
	andn	%i5,	0x1AAF,	%o2
	movge	%icc,	%i1,	%g6
	fexpand	%f15,	%f18
	movneg	%icc,	%o5,	%o3
	fnegs	%f13,	%f20
	movleu	%xcc,	%o4,	%l3
	fpsub16	%f14,	%f14,	%f2
	ldx	[%l7 + 0x20],	%o0
	movneg	%icc,	%l1,	%l5
	xnor	%g5,	%o1,	%g2
	sethi	0x0BD3,	%o6
	edge32n	%l0,	%i7,	%o7
	fmovdge	%icc,	%f6,	%f22
	sdivcc	%i4,	0x1F6A,	%i2
	movn	%xcc,	%g1,	%g4
	fmovrdlz	%g7,	%f16,	%f6
	alignaddr	%l2,	%l6,	%i6
	xor	%g3,	0x0438,	%i0
	alignaddrl	%l4,	%i3,	%o2
	edge8ln	%i5,	%g6,	%o5
	andncc	%i1,	%o4,	%l3
	lduh	[%l7 + 0x62],	%o3
	mulx	%o0,	%l1,	%l5
	sdiv	%g5,	0x1304,	%o1
	fmovrdgz	%o6,	%f24,	%f28
	fmovde	%xcc,	%f18,	%f9
	ldd	[%l7 + 0x38],	%l0
	fmovrdne	%g2,	%f26,	%f12
	sra	%i7,	0x1A,	%i4
	xnorcc	%i2,	0x0460,	%o7
	addccc	%g4,	%g7,	%g1
	andn	%l6,	0x06D3,	%i6
	movcc	%xcc,	%l2,	%g3
	lduh	[%l7 + 0x48],	%i0
	fpackfix	%f28,	%f5
	addc	%i3,	%o2,	%l4
	ldd	[%l7 + 0x30],	%f20
	fcmpne16	%f26,	%f0,	%g6
	orcc	%i5,	0x0AF9,	%i1
	sir	0x089D
	edge8l	%o4,	%o5,	%o3
	smul	%l3,	0x0A6E,	%l1
	sir	0x045E
	xnorcc	%o0,	%l5,	%o1
	fmovdge	%xcc,	%f30,	%f26
	fmovsa	%icc,	%f28,	%f9
	orn	%o6,	%l0,	%g2
	movrlz	%g5,	%i7,	%i2
	fmovdpos	%icc,	%f1,	%f29
	nop
	set	0x74, %o3
	ldsh	[%l7 + %o3],	%i4
	fands	%f26,	%f3,	%f7
	movne	%icc,	%g4,	%g7
	fmul8x16	%f2,	%f26,	%f2
	fmovscs	%xcc,	%f17,	%f11
	fmovspos	%icc,	%f9,	%f9
	fmovdle	%xcc,	%f10,	%f1
	movle	%icc,	%g1,	%l6
	std	%f0,	[%l7 + 0x58]
	movg	%icc,	%o7,	%l2
	ldd	[%l7 + 0x30],	%f6
	save %g3, %i6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o2,	%l4,	%i3
	add	%g6,	%i5,	%i1
	fsrc1	%f20,	%f12
	array16	%o5,	%o4,	%o3
	fmovsne	%xcc,	%f14,	%f17
	xorcc	%l1,	0x0EC2,	%o0
	or	%l3,	%l5,	%o6
	movpos	%icc,	%l0,	%o1
	movcc	%icc,	%g5,	%i7
	fxnor	%f22,	%f10,	%f4
	sir	0x158D
	smul	%i2,	%g2,	%i4
	stw	%g4,	[%l7 + 0x7C]
	fxor	%f2,	%f26,	%f24
	fmovrsgez	%g7,	%f31,	%f29
	udiv	%g1,	0x160C,	%l6
	mulscc	%o7,	0x07AB,	%g3
	std	%f4,	[%l7 + 0x50]
	edge32	%l2,	%i0,	%o2
	array16	%l4,	%i3,	%i6
	movrgez	%i5,	%g6,	%i1
	mova	%xcc,	%o4,	%o3
	sub	%l1,	%o5,	%o0
	movn	%icc,	%l5,	%o6
	udiv	%l3,	0x10F8,	%l0
	andn	%o1,	%i7,	%g5
	movvc	%icc,	%g2,	%i2
	sdivx	%i4,	0x139E,	%g4
	movcc	%icc,	%g1,	%l6
	sdivx	%o7,	0x180B,	%g7
	andcc	%g3,	%l2,	%i0
	fmovdneg	%icc,	%f2,	%f29
	alignaddrl	%l4,	%i3,	%i6
	mova	%icc,	%i5,	%g6
	subcc	%i1,	%o2,	%o4
	umul	%l1,	0x1ECC,	%o3
	stx	%o5,	[%l7 + 0x08]
	or	%o0,	%l5,	%l3
	umulcc	%o6,	%o1,	%i7
	lduw	[%l7 + 0x28],	%l0
	fcmple16	%f28,	%f28,	%g2
	fmul8x16al	%f30,	%f9,	%f8
	std	%f18,	[%l7 + 0x50]
	movgu	%icc,	%i2,	%i4
	xnorcc	%g4,	0x156C,	%g1
	srax	%l6,	0x00,	%o7
	xor	%g7,	0x1417,	%g3
	xor	%l2,	0x1FB4,	%i0
	for	%f22,	%f6,	%f16
	or	%g5,	%l4,	%i3
	ldub	[%l7 + 0x4B],	%i5
	fmul8ulx16	%f18,	%f14,	%f6
	umul	%g6,	0x133E,	%i6
	array16	%o2,	%o4,	%i1
	sdivcc	%o3,	0x1222,	%o5
	subccc	%l1,	%o0,	%l5
	edge8l	%o6,	%o1,	%l3
	subcc	%i7,	%g2,	%i2
	lduh	[%l7 + 0x22],	%l0
	subcc	%g4,	%i4,	%g1
	xnor	%o7,	0x045F,	%g7
	umulcc	%g3,	0x1028,	%l2
	std	%f24,	[%l7 + 0x30]
	orncc	%l6,	%i0,	%g5
	subcc	%i3,	0x12AC,	%l4
	ldx	[%l7 + 0x68],	%g6
	fmovdl	%icc,	%f8,	%f28
	array32	%i6,	%i5,	%o2
	subc	%i1,	0x01BB,	%o3
	edge16l	%o5,	%o4,	%o0
	xnor	%l5,	0x0C32,	%o6
	or	%o1,	0x11C9,	%l1
	movne	%xcc,	%l3,	%i7
	sethi	0x07F3,	%i2
	save %g2, %g4, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f10,	%f2,	%f26
	edge16l	%i4,	%g1,	%g7
	ldub	[%l7 + 0x1E],	%g3
	array8	%l2,	%o7,	%i0
	lduw	[%l7 + 0x08],	%l6
	srl	%g5,	0x17,	%i3
	array8	%g6,	%i6,	%l4
	fcmpeq32	%f28,	%f8,	%i5
	mulx	%i1,	%o2,	%o5
	siam	0x6
	movrlez	%o4,	0x171,	%o0
	stw	%l5,	[%l7 + 0x3C]
	siam	0x0
	movcc	%xcc,	%o3,	%o1
	fmovdcs	%icc,	%f31,	%f13
	edge32l	%o6,	%l1,	%i7
	edge8l	%i2,	%l3,	%g4
	edge8n	%l0,	%g2,	%i4
	ldsh	[%l7 + 0x2A],	%g7
	umul	%g3,	%g1,	%l2
	orn	%o7,	0x0C5F,	%i0
	sdiv	%l6,	0x1FC7,	%i3
	movleu	%icc,	%g6,	%i6
	save %l4, 0x090C, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f24,	%f16,	%f8
	fmovdneg	%icc,	%f17,	%f2
	orcc	%i1,	0x1878,	%i5
	fmovdleu	%xcc,	%f19,	%f25
	fcmpgt32	%f16,	%f8,	%o2
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%f4
	fabss	%f5,	%f4
	fpadd16s	%f26,	%f0,	%f10
	orncc	%o5,	0x1014,	%o4
	st	%f25,	[%l7 + 0x50]
	edge8l	%o0,	%o3,	%o1
	edge8	%l5,	%l1,	%o6
	fmul8sux16	%f2,	%f6,	%f6
	fmovsvc	%xcc,	%f20,	%f13
	smul	%i2,	%l3,	%i7
	sdivcc	%l0,	0x1BEA,	%g2
	sllx	%i4,	%g4,	%g3
	save %g7, 0x1068, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g1,	0x0D32,	%o7
	smul	%i0,	%l6,	%g6
	fmovsne	%xcc,	%f6,	%f28
	sdivcc	%i3,	0x1418,	%i6
	movvs	%xcc,	%g5,	%i1
	fmovrdne	%i5,	%f24,	%f28
	move	%icc,	%o2,	%l4
	umul	%o4,	0x0DE8,	%o5
	lduw	[%l7 + 0x0C],	%o0
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	fmovsleu	%xcc,	%f18,	%f17
	edge16n	%l1,	%l5,	%o6
	mulscc	%i2,	0x1058,	%l3
	ldx	[%l7 + 0x78],	%l0
	mova	%xcc,	%i7,	%i4
	movne	%icc,	%g2,	%g3
	edge32	%g7,	%l2,	%g4
	orn	%g1,	0x06D1,	%i0
	ldd	[%l7 + 0x58],	%o6
	movpos	%xcc,	%l6,	%g6
	fornot2s	%f16,	%f5,	%f24
	fmovrdne	%i3,	%f16,	%f10
	edge32l	%i6,	%i1,	%g5
	move	%icc,	%o2,	%l4
	addcc	%o4,	%o5,	%o0
	orcc	%o3,	0x1AF2,	%o1
	movleu	%icc,	%l1,	%i5
	popc	0x0FF7,	%o6
	sub	%l5,	0x0FAA,	%l3
	fsrc1	%f16,	%f2
	movne	%xcc,	%i2,	%i7
	sllx	%i4,	0x0C,	%l0
	fmovsn	%xcc,	%f21,	%f29
	srlx	%g2,	%g7,	%g3
	ld	[%l7 + 0x58],	%f12
	sra	%g4,	%g1,	%l2
	movn	%icc,	%i0,	%l6
	andncc	%o7,	%i3,	%i6
	nop
	set	0x68, %l2
	ldsw	[%l7 + %l2],	%i1
	movg	%icc,	%g6,	%o2
	fmovscc	%xcc,	%f16,	%f6
	movrlz	%l4,	0x2BB,	%o4
	fmul8ulx16	%f18,	%f30,	%f18
	subccc	%g5,	0x0FC7,	%o5
	fpmerge	%f24,	%f5,	%f26
	st	%f10,	[%l7 + 0x38]
	ldx	[%l7 + 0x78],	%o3
	array32	%o0,	%l1,	%o1
	fmovdcc	%icc,	%f22,	%f10
	sdivx	%i5,	0x02BF,	%o6
	fmovdgu	%xcc,	%f8,	%f14
	array16	%l5,	%l3,	%i2
	fmovrsne	%i7,	%f30,	%f25
	fpadd16s	%f26,	%f29,	%f12
	movle	%icc,	%i4,	%l0
	fmul8sux16	%f4,	%f8,	%f18
	fmovsneg	%icc,	%f19,	%f8
	sub	%g2,	%g3,	%g7
	sir	0x0327
	movpos	%xcc,	%g4,	%g1
	subc	%i0,	%l2,	%o7
	edge16	%i3,	%i6,	%l6
	movvs	%xcc,	%i1,	%o2
	fmovrde	%g6,	%f24,	%f6
	fmovsg	%xcc,	%f10,	%f13
	add	%o4,	%g5,	%l4
	orcc	%o5,	%o0,	%l1
	srl	%o3,	%o1,	%o6
	edge8	%l5,	%i5,	%i2
	edge8ln	%i7,	%i4,	%l3
	edge8n	%l0,	%g3,	%g7
	edge32l	%g2,	%g4,	%i0
	alignaddr	%l2,	%o7,	%g1
	mulx	%i3,	0x0CCC,	%i6
	edge8ln	%i1,	%l6,	%g6
	andcc	%o4,	0x15E0,	%o2
	fcmpeq32	%f4,	%f10,	%g5
	movvs	%xcc,	%o5,	%o0
	sllx	%l4,	%o3,	%o1
	stx	%l1,	[%l7 + 0x70]
	sllx	%l5,	0x08,	%i5
	edge32n	%i2,	%i7,	%o6
	array32	%i4,	%l0,	%g3
	sdivx	%l3,	0x1C99,	%g7
	orn	%g2,	%i0,	%g4
	ldub	[%l7 + 0x46],	%l2
	andncc	%g1,	%o7,	%i3
	fornot1s	%f28,	%f15,	%f9
	movvc	%xcc,	%i1,	%i6
	udiv	%g6,	0x078C,	%o4
	andncc	%o2,	%l6,	%o5
	ldsb	[%l7 + 0x6E],	%o0
	fmovsvs	%xcc,	%f12,	%f19
	fnand	%f26,	%f6,	%f16
	udivx	%g5,	0x046B,	%o3
	fmovrsgz	%l4,	%f21,	%f5
	movle	%xcc,	%l1,	%o1
	umul	%l5,	0x17A6,	%i5
	fornot2	%f12,	%f22,	%f4
	array8	%i7,	%o6,	%i4
	fmovdcc	%icc,	%f5,	%f0
	movcc	%xcc,	%i2,	%g3
	nop
	set	0x68, %l1
	stw	%l0,	[%l7 + %l1]
	udivcc	%g7,	0x171A,	%l3
	sub	%g2,	%g4,	%i0
	movrgz	%l2,	%g1,	%i3
	movrne	%i1,	%i6,	%g6
	stx	%o4,	[%l7 + 0x70]
	ldd	[%l7 + 0x38],	%f10
	save %o7, %l6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o0,	%g5,	%o2
	array32	%l4,	%o3,	%o1
	fmovsl	%xcc,	%f18,	%f30
	udivcc	%l5,	0x057C,	%i5
	andn	%i7,	%l1,	%i4
	ldsw	[%l7 + 0x68],	%i2
	sth	%g3,	[%l7 + 0x68]
	alignaddrl	%l0,	%o6,	%l3
	edge32n	%g2,	%g7,	%g4
	array32	%l2,	%i0,	%i3
	movvs	%icc,	%i1,	%i6
	xnor	%g6,	%g1,	%o4
	sdivcc	%l6,	0x0CAA,	%o7
	mulx	%o0,	0x1E8D,	%g5
	movcc	%icc,	%o5,	%l4
	array32	%o3,	%o1,	%l5
	fabss	%f18,	%f4
	fmovrslez	%i5,	%f10,	%f21
	fpadd32s	%f7,	%f13,	%f24
	sdivcc	%o2,	0x1572,	%i7
	fnands	%f24,	%f2,	%f4
	orcc	%l1,	0x1173,	%i4
	orncc	%i2,	0x1E79,	%l0
	fmul8x16al	%f27,	%f2,	%f4
	or	%o6,	0x1708,	%l3
	restore %g3, 0x07BB, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g2,	%l2,	%i0
	stw	%g4,	[%l7 + 0x30]
	addccc	%i3,	0x0AB5,	%i6
	srl	%g6,	%i1,	%g1
	nop
	set	0x41, %o4
	stb	%o4,	[%l7 + %o4]
	andncc	%l6,	%o0,	%g5
	sdiv	%o5,	0x1FA2,	%o7
	xor	%o3,	%o1,	%l5
	xor	%i5,	%o2,	%i7
	movpos	%icc,	%l4,	%l1
	fmovspos	%icc,	%f6,	%f13
	mulx	%i2,	0x1EC7,	%l0
	edge32n	%o6,	%i4,	%g3
	ld	[%l7 + 0x08],	%f31
	mulscc	%l3,	0x17C9,	%g7
	ldsh	[%l7 + 0x42],	%g2
	fmovrdne	%i0,	%f30,	%f28
	sub	%g4,	%i3,	%i6
	edge32n	%l2,	%i1,	%g1
	fpsub16	%f16,	%f12,	%f20
	sub	%g6,	0x19A5,	%l6
	sth	%o4,	[%l7 + 0x4C]
	faligndata	%f6,	%f24,	%f30
	edge16n	%o0,	%g5,	%o7
	xnor	%o5,	0x10F7,	%o1
	edge8l	%o3,	%i5,	%o2
	stx	%l5,	[%l7 + 0x08]
	fmovrdlz	%l4,	%f18,	%f2
	movrgez	%l1,	0x041,	%i7
	fcmped	%fcc3,	%f14,	%f24
	andncc	%l0,	%o6,	%i2
	udivx	%i4,	0x13A6,	%g3
	fmovspos	%icc,	%f24,	%f0
	addc	%l3,	%g7,	%g2
	andn	%g4,	%i3,	%i0
	mova	%xcc,	%i6,	%l2
	add	%g1,	%g6,	%i1
	fmovsge	%icc,	%f8,	%f11
	subccc	%l6,	0x0900,	%o0
	movrgz	%o4,	%o7,	%o5
	sra	%o1,	%o3,	%g5
	subccc	%o2,	0x0F3C,	%i5
	ldx	[%l7 + 0x18],	%l5
	array16	%l4,	%i7,	%l0
	fmovdn	%icc,	%f13,	%f24
	fmovse	%icc,	%f28,	%f31
	sllx	%l1,	%o6,	%i4
	fmovrsne	%g3,	%f14,	%f17
	sll	%i2,	0x15,	%g7
	fmovdcc	%xcc,	%f17,	%f21
	edge8	%l3,	%g2,	%g4
	fmovscc	%icc,	%f15,	%f7
	sdivcc	%i0,	0x174A,	%i6
	ldd	[%l7 + 0x48],	%i2
	mulscc	%l2,	0x1713,	%g6
	fmovrslez	%i1,	%f5,	%f4
	mova	%xcc,	%g1,	%l6
	move	%icc,	%o0,	%o4
	udiv	%o7,	0x130B,	%o5
	udiv	%o3,	0x1F18,	%o1
	fmovspos	%xcc,	%f15,	%f22
	movl	%xcc,	%g5,	%o2
	srlx	%l5,	%l4,	%i5
	movvs	%icc,	%i7,	%l1
	array8	%o6,	%l0,	%g3
	fmovsgu	%xcc,	%f11,	%f16
	array16	%i4,	%i2,	%l3
	stw	%g7,	[%l7 + 0x64]
	fmovdl	%icc,	%f26,	%f8
	fcmped	%fcc2,	%f10,	%f24
	movrlz	%g2,	0x1FF,	%g4
	movvs	%icc,	%i6,	%i3
	fnegs	%f4,	%f29
	edge32l	%l2,	%g6,	%i1
	srl	%g1,	0x0E,	%l6
	movvs	%xcc,	%o0,	%o4
	xorcc	%i0,	0x0FD7,	%o5
	movvc	%xcc,	%o3,	%o7
	movleu	%xcc,	%g5,	%o2
	ldsb	[%l7 + 0x5C],	%l5
	and	%l4,	0x1E82,	%i5
	ldsh	[%l7 + 0x58],	%i7
	addccc	%o1,	0x15E5,	%l1
	fmuld8ulx16	%f22,	%f7,	%f16
	sethi	0x0EB8,	%l0
	smul	%o6,	%i4,	%i2
	fcmps	%fcc1,	%f6,	%f17
	movrgez	%l3,	0x2BB,	%g3
	subc	%g7,	0x0F1D,	%g4
	addc	%g2,	%i3,	%i6
	edge8n	%l2,	%i1,	%g6
	mova	%xcc,	%g1,	%l6
	movvs	%xcc,	%o4,	%o0
	movneg	%icc,	%i0,	%o5
	addc	%o7,	%g5,	%o3
	srax	%o2,	0x07,	%l4
	fmovdvs	%xcc,	%f28,	%f12
	stx	%l5,	[%l7 + 0x08]
	umul	%i5,	%i7,	%o1
	array16	%l0,	%o6,	%i4
	fmovrslez	%i2,	%f3,	%f24
	fmovdne	%icc,	%f19,	%f15
	xnor	%l1,	0x162C,	%l3
	xor	%g3,	0x1477,	%g7
	pdist	%f16,	%f4,	%f20
	movle	%xcc,	%g2,	%g4
	alignaddr	%i6,	%l2,	%i3
	fmovdg	%xcc,	%f29,	%f16
	fmovd	%f4,	%f18
	sra	%g6,	0x01,	%i1
	add	%l6,	0x0C6D,	%o4
	fmovrdlz	%o0,	%f10,	%f2
	srlx	%i0,	0x02,	%g1
	orcc	%o7,	0x02EE,	%g5
	fmovda	%icc,	%f7,	%f3
	ldd	[%l7 + 0x10],	%f0
	ldd	[%l7 + 0x70],	%o4
	edge32ln	%o3,	%l4,	%o2
	xorcc	%i5,	0x0197,	%i7
	mulx	%o1,	0x160B,	%l0
	nop
	set	0x45, %o0
	stb	%l5,	[%l7 + %o0]
	edge32l	%o6,	%i4,	%l1
	fcmpeq16	%f30,	%f4,	%i2
	fcmpd	%fcc3,	%f22,	%f4
	stx	%l3,	[%l7 + 0x10]
	edge16n	%g7,	%g2,	%g3
	sll	%g4,	0x04,	%l2
	fmovscs	%icc,	%f24,	%f3
	movrne	%i3,	%g6,	%i6
	ldub	[%l7 + 0x7F],	%i1
	movvs	%icc,	%l6,	%o0
	fmovdg	%icc,	%f4,	%f27
	stb	%i0,	[%l7 + 0x20]
	sub	%o4,	%g1,	%g5
	fandnot2	%f2,	%f20,	%f24
	edge32l	%o7,	%o5,	%o3
	nop
	set	0x08, %g4
	ldsw	[%l7 + %g4],	%l4
	udiv	%o2,	0x1F23,	%i7
	or	%o1,	%l0,	%i5
	sll	%o6,	%l5,	%l1
	movn	%xcc,	%i2,	%i4
	fmovsvs	%icc,	%f15,	%f2
	nop
	set	0x60, %l0
	std	%f14,	[%l7 + %l0]
	mova	%icc,	%l3,	%g7
	udivx	%g3,	0x0CC0,	%g2
	edge32l	%l2,	%g4,	%g6
	umulcc	%i6,	%i1,	%i3
	sll	%o0,	%l6,	%i0
	fmovscs	%xcc,	%f10,	%f16
	fmovde	%icc,	%f3,	%f1
	ldsh	[%l7 + 0x0E],	%g1
	add	%g5,	0x0B8A,	%o7
	sub	%o5,	%o3,	%l4
	udivx	%o2,	0x08FF,	%i7
	edge16ln	%o1,	%o4,	%i5
	fcmpne32	%f4,	%f18,	%o6
	stw	%l0,	[%l7 + 0x78]
	fmovscc	%icc,	%f28,	%f0
	save %l1, %l5, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%l3,	%i4
	fmovdge	%xcc,	%f8,	%f16
	bshuffle	%f18,	%f2,	%f28
	sdiv	%g7,	0x0B2D,	%g2
	stx	%g3,	[%l7 + 0x30]
	orn	%l2,	%g4,	%g6
	array32	%i6,	%i1,	%i3
	fcmps	%fcc1,	%f17,	%f23
	mova	%icc,	%o0,	%l6
	ldub	[%l7 + 0x17],	%g1
	fmovsl	%icc,	%f21,	%f29
	popc	0x068D,	%g5
	stb	%o7,	[%l7 + 0x42]
	alignaddrl	%o5,	%o3,	%l4
	ld	[%l7 + 0x4C],	%f31
	mulscc	%o2,	0x1993,	%i7
	nop
	set	0x50, %l6
	lduw	[%l7 + %l6],	%i0
	addccc	%o1,	0x10AC,	%i5
	ldd	[%l7 + 0x48],	%o6
	fmovrdlez	%l0,	%f0,	%f6
	xor	%o4,	0x0A1F,	%l5
	edge8	%i2,	%l3,	%l1
	array16	%i4,	%g2,	%g7
	alignaddr	%l2,	%g4,	%g3
	fmovrdgz	%g6,	%f12,	%f8
	ldsb	[%l7 + 0x5B],	%i1
	fmovdvs	%icc,	%f17,	%f21
	fmovse	%xcc,	%f30,	%f19
	movrne	%i6,	0x2E3,	%o0
	fpsub32s	%f21,	%f6,	%f8
	movvc	%xcc,	%l6,	%i3
	fabsd	%f14,	%f8
	array32	%g1,	%o7,	%o5
	smul	%g5,	0x19DB,	%o3
	stx	%o2,	[%l7 + 0x20]
	movg	%xcc,	%l4,	%i7
	fsrc1	%f30,	%f14
	nop
	set	0x18, %g2
	ldub	[%l7 + %g2],	%o1
	andcc	%i0,	%i5,	%o6
	addc	%o4,	0x0619,	%l0
	ldub	[%l7 + 0x4B],	%l5
	movrlez	%i2,	%l3,	%l1
	addccc	%i4,	%g7,	%g2
	fmovrsgez	%g4,	%f10,	%f8
	movre	%g3,	0x35A,	%l2
	edge8l	%i1,	%g6,	%o0
	movpos	%xcc,	%i6,	%i3
	andncc	%l6,	%g1,	%o7
	mova	%icc,	%g5,	%o3
	udiv	%o5,	0x03F7,	%o2
	fmovdcs	%xcc,	%f10,	%f26
	edge32ln	%l4,	%o1,	%i0
	fmovrsgez	%i5,	%f15,	%f18
	move	%xcc,	%o6,	%o4
	movge	%icc,	%i7,	%l0
	stw	%i2,	[%l7 + 0x34]
	fcmpne16	%f30,	%f14,	%l5
	movleu	%xcc,	%l3,	%i4
	array16	%g7,	%g2,	%g4
	fmovdvc	%xcc,	%f15,	%f10
	sll	%g3,	%l2,	%i1
	andn	%l1,	%g6,	%o0
	movl	%xcc,	%i6,	%l6
	edge16	%i3,	%o7,	%g1
	and	%o3,	0x1486,	%o5
	ld	[%l7 + 0x64],	%f24
	fandnot1s	%f1,	%f15,	%f12
	srl	%o2,	%l4,	%g5
	movrlz	%i0,	%i5,	%o1
	edge8ln	%o4,	%o6,	%i7
	fmovdpos	%xcc,	%f4,	%f18
	srl	%l0,	0x17,	%l5
	fpackfix	%f20,	%f29
	edge32	%i2,	%l3,	%g7
	umulcc	%i4,	0x01FA,	%g4
	fnot1s	%f14,	%f0
	fcmpes	%fcc1,	%f6,	%f6
	xnor	%g3,	%l2,	%i1
	sethi	0x058C,	%l1
	sub	%g2,	0x0BE9,	%o0
	udivx	%g6,	0x1542,	%i6
	sllx	%l6,	0x1E,	%i3
	edge16ln	%o7,	%o3,	%o5
	fmovsvc	%xcc,	%f31,	%f3
	sdivcc	%g1,	0x1C76,	%o2
	orcc	%g5,	0x102B,	%l4
	fcmped	%fcc1,	%f22,	%f12
	edge32ln	%i5,	%i0,	%o1
	srl	%o4,	%i7,	%o6
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	movrlz	%g7,	0x3BE,	%i2
	addcc	%i4,	%g3,	%l2
	udivcc	%g4,	0x1BAC,	%l1
	movvc	%icc,	%g2,	%o0
	nop
	set	0x54, %i4
	sth	%g6,	[%l7 + %i4]
	mova	%icc,	%i6,	%l6
	and	%i1,	0x03E3,	%o7
	edge16l	%o3,	%i3,	%g1
	smul	%o5,	0x0734,	%g5
	lduw	[%l7 + 0x1C],	%l4
	fmovdneg	%icc,	%f15,	%f15
	edge16	%i5,	%o2,	%i0
	sll	%o4,	%o1,	%i7
	fmovrsgez	%l5,	%f16,	%f3
	andcc	%o6,	%l3,	%g7
	ldsh	[%l7 + 0x4C],	%i2
	movl	%icc,	%i4,	%l0
	movvs	%icc,	%g3,	%g4
	sub	%l2,	%g2,	%o0
	sir	0x04A4
	fmovscs	%xcc,	%f26,	%f22
	ldub	[%l7 + 0x22],	%l1
	sth	%i6,	[%l7 + 0x0C]
	st	%f26,	[%l7 + 0x18]
	fors	%f17,	%f13,	%f11
	fmul8x16	%f5,	%f4,	%f20
	sir	0x1FE1
	movvc	%xcc,	%l6,	%i1
	movcs	%xcc,	%o7,	%g6
	stx	%o3,	[%l7 + 0x68]
	stw	%g1,	[%l7 + 0x7C]
	sra	%i3,	0x1C,	%o5
	st	%f14,	[%l7 + 0x40]
	movne	%icc,	%l4,	%g5
	ld	[%l7 + 0x44],	%f12
	fmovdl	%xcc,	%f12,	%f5
	xnor	%i5,	%i0,	%o4
	fnor	%f16,	%f8,	%f16
	mulscc	%o1,	%o2,	%l5
	ldx	[%l7 + 0x28],	%o6
	movre	%l3,	0x3D6,	%g7
	std	%f2,	[%l7 + 0x18]
	fmovsle	%icc,	%f28,	%f3
	fandnot1s	%f13,	%f1,	%f2
	edge16n	%i7,	%i2,	%l0
	smulcc	%i4,	0x131E,	%g4
	udiv	%l2,	0x1CB6,	%g3
	movneg	%xcc,	%o0,	%l1
	fcmped	%fcc3,	%f16,	%f20
	fmul8x16au	%f19,	%f29,	%f2
	alignaddr	%i6,	%g2,	%i1
	sll	%l6,	0x09,	%g6
	movcc	%xcc,	%o3,	%g1
	fpadd32s	%f28,	%f29,	%f12
	movre	%o7,	0x179,	%i3
	fand	%f28,	%f2,	%f24
	movne	%xcc,	%o5,	%g5
	fxnors	%f14,	%f22,	%f18
	orncc	%i5,	0x0003,	%i0
	ldsh	[%l7 + 0x12],	%o4
	fmovsa	%icc,	%f27,	%f21
	fmovrdlez	%l4,	%f6,	%f20
	sub	%o1,	%o2,	%o6
	fsrc2	%f20,	%f2
	save %l3, 0x09F4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f10,	%f12
	orn	%g7,	0x1B15,	%i2
	fmovsneg	%icc,	%f9,	%f16
	std	%f24,	[%l7 + 0x70]
	xorcc	%i7,	0x1C7A,	%l0
	orn	%i4,	0x02FF,	%g4
	ldsh	[%l7 + 0x28],	%l2
	sethi	0x08F6,	%g3
	srlx	%l1,	%o0,	%i6
	movpos	%xcc,	%g2,	%i1
	movvs	%xcc,	%l6,	%o3
	fornot2s	%f9,	%f0,	%f26
	xor	%g1,	%g6,	%o7
	fmovscs	%icc,	%f21,	%f26
	sll	%i3,	%g5,	%i5
	fmovdne	%icc,	%f19,	%f6
	nop
	set	0x4C, %i7
	stw	%o5,	[%l7 + %i7]
	ld	[%l7 + 0x70],	%f16
	movcs	%icc,	%i0,	%o4
	std	%f22,	[%l7 + 0x30]
	sdivcc	%o1,	0x1028,	%l4
	stx	%o2,	[%l7 + 0x20]
	edge8ln	%o6,	%l3,	%l5
	subcc	%g7,	0x1AC0,	%i2
	and	%i7,	0x19D4,	%l0
	and	%i4,	0x0055,	%g4
	fmovdcc	%icc,	%f10,	%f1
	fmul8x16	%f23,	%f24,	%f10
	fnands	%f26,	%f10,	%f3
	xorcc	%l2,	%l1,	%g3
	movcc	%icc,	%o0,	%g2
	edge16	%i6,	%i1,	%o3
	popc	0x0251,	%l6
	subccc	%g1,	%o7,	%i3
	edge16	%g6,	%g5,	%i5
	movleu	%icc,	%i0,	%o4
	edge32n	%o1,	%o5,	%o2
	sdivcc	%o6,	0x0834,	%l4
	movvc	%icc,	%l5,	%l3
	fmovdcc	%icc,	%f19,	%f31
	ldsh	[%l7 + 0x1A],	%i2
	ld	[%l7 + 0x14],	%f15
	fmovscs	%icc,	%f13,	%f13
	smulcc	%i7,	%g7,	%l0
	restore %g4, %l2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%icc,	%f2,	%f3
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	movrne	%g2,	%i1,	%o3
	movgu	%icc,	%l6,	%g1
	udivx	%o7,	0x1740,	%i3
	sllx	%g6,	%g5,	%i6
	movge	%icc,	%i0,	%i5
	addcc	%o4,	%o1,	%o2
	xorcc	%o6,	0x0D8C,	%l4
	sdivx	%l5,	0x186E,	%l3
	udivcc	%i2,	0x038D,	%o5
	fnors	%f25,	%f11,	%f13
	fmovrdgz	%g7,	%f22,	%f12
	andcc	%i7,	0x0761,	%l0
	ldd	[%l7 + 0x10],	%g4
	fmovrde	%l2,	%f12,	%f6
	subc	%l1,	%i4,	%o0
	fmovrse	%g2,	%f10,	%f30
	movcs	%icc,	%i1,	%g3
	lduh	[%l7 + 0x26],	%l6
	for	%f26,	%f6,	%f2
	udivx	%g1,	0x0898,	%o7
	movrgez	%i3,	%g6,	%o3
	smulcc	%g5,	0x1FD9,	%i0
	smul	%i6,	0x1AFF,	%i5
	fmuld8ulx16	%f5,	%f6,	%f6
	movg	%xcc,	%o1,	%o4
	movg	%xcc,	%o6,	%o2
	edge16ln	%l5,	%l4,	%l3
	edge16l	%o5,	%g7,	%i2
	and	%i7,	0x0EF4,	%g4
	orcc	%l2,	0x0BF5,	%l0
	sll	%l1,	%i4,	%g2
	array16	%o0,	%g3,	%l6
	smulcc	%i1,	0x04F5,	%o7
	ldsw	[%l7 + 0x68],	%g1
	fcmps	%fcc1,	%f3,	%f10
	sdivcc	%g6,	0x1BA8,	%o3
	save %g5, %i3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i5,	%o1,	%i0
	addc	%o4,	0x0D87,	%o2
	fandnot1s	%f11,	%f23,	%f26
	movrne	%l5,	0x352,	%l4
	subcc	%o6,	0x018C,	%o5
	xor	%g7,	%i2,	%i7
	ldd	[%l7 + 0x60],	%l2
	sll	%l2,	%l0,	%g4
	addc	%l1,	0x0728,	%i4
	movcc	%icc,	%o0,	%g2
	movrne	%l6,	%g3,	%i1
	movn	%xcc,	%g1,	%g6
	siam	0x3
	fmovrdlez	%o7,	%f26,	%f0
	addc	%g5,	%i3,	%i6
	edge32	%o3,	%i5,	%i0
	movrgz	%o1,	0x316,	%o4
	nop
	set	0x74, %g6
	ldsh	[%l7 + %g6],	%l5
	fmovsvc	%xcc,	%f21,	%f14
	fmovsne	%icc,	%f6,	%f31
	alignaddr	%l4,	%o2,	%o6
	mulx	%g7,	%o5,	%i7
	smulcc	%i2,	0x0C1E,	%l3
	udivcc	%l0,	0x13FA,	%l2
	sdivcc	%g4,	0x0D7B,	%i4
	orn	%l1,	%o0,	%g2
	movn	%icc,	%g3,	%i1
	sir	0x17E5
	popc	0x113D,	%g1
	orcc	%g6,	%o7,	%l6
	edge32n	%i3,	%g5,	%i6
	umulcc	%o3,	0x17DE,	%i0
	movneg	%xcc,	%o1,	%o4
	mulx	%i5,	0x002C,	%l5
	xnorcc	%l4,	0x0203,	%o6
	edge32	%g7,	%o2,	%o5
	movcc	%icc,	%i2,	%l3
	lduw	[%l7 + 0x5C],	%i7
	edge16ln	%l2,	%g4,	%i4
	fmovdge	%icc,	%f14,	%f27
	fcmpes	%fcc3,	%f13,	%f11
	mulscc	%l1,	0x1867,	%l0
	movvc	%icc,	%g2,	%g3
	orcc	%i1,	%o0,	%g6
	and	%o7,	0x09C8,	%l6
	ldd	[%l7 + 0x58],	%g0
	fmovdne	%xcc,	%f27,	%f21
	ld	[%l7 + 0x74],	%f14
	ldub	[%l7 + 0x42],	%i3
	add	%g5,	%i6,	%o3
	edge16n	%i0,	%o4,	%i5
	movrlz	%o1,	0x036,	%l5
	fxnors	%f9,	%f10,	%f2
	andn	%l4,	%o6,	%g7
	srlx	%o2,	0x02,	%o5
	movrgez	%l3,	%i7,	%i2
	udivcc	%g4,	0x1DFC,	%l2
	movrlz	%l1,	%i4,	%l0
	fmovspos	%icc,	%f11,	%f16
	sra	%g2,	%i1,	%o0
	ldd	[%l7 + 0x40],	%f22
	subc	%g3,	%g6,	%l6
	movrne	%o7,	0x3F4,	%i3
	sub	%g5,	0x1C44,	%i6
	mulx	%o3,	0x1353,	%i0
	sdiv	%o4,	0x07D4,	%i5
	movle	%icc,	%g1,	%o1
	fmovspos	%icc,	%f13,	%f15
	sra	%l4,	0x1C,	%o6
	xnorcc	%g7,	0x1847,	%l5
	movrne	%o2,	%o5,	%i7
	fmovdge	%icc,	%f6,	%f13
	fsrc2s	%f6,	%f15
	udivx	%i2,	0x0EA3,	%l3
	fmovd	%f4,	%f22
	sdiv	%l2,	0x18F8,	%l1
	orn	%i4,	%g4,	%l0
	fmovrdlz	%i1,	%f22,	%f20
	edge32n	%o0,	%g2,	%g6
	edge32l	%l6,	%o7,	%g3
	fmovrde	%i3,	%f26,	%f4
	movcs	%icc,	%g5,	%i6
	movg	%xcc,	%o3,	%o4
	stb	%i5,	[%l7 + 0x4A]
	fmovsa	%xcc,	%f25,	%f20
	fmovrde	%g1,	%f2,	%f0
	movle	%icc,	%o1,	%i0
	movcc	%xcc,	%o6,	%l4
	fpadd32	%f6,	%f26,	%f26
	array16	%l5,	%g7,	%o2
	alignaddrl	%o5,	%i7,	%i2
	nop
	set	0x28, %i5
	stw	%l3,	[%l7 + %i5]
	ldd	[%l7 + 0x40],	%f14
	subc	%l1,	%i4,	%g4
	xnor	%l0,	%l2,	%o0
	st	%f14,	[%l7 + 0x44]
	movne	%xcc,	%i1,	%g2
	ldsh	[%l7 + 0x76],	%l6
	mulx	%o7,	%g6,	%g3
	fmovrsgz	%i3,	%f30,	%f3
	std	%f14,	[%l7 + 0x10]
	andcc	%i6,	0x031F,	%o3
	sth	%o4,	[%l7 + 0x38]
	movl	%icc,	%i5,	%g5
	xorcc	%o1,	0x1477,	%i0
	edge32	%o6,	%l4,	%g1
	mulx	%l5,	%g7,	%o2
	ldd	[%l7 + 0x28],	%f20
	fcmped	%fcc0,	%f6,	%f10
	stx	%o5,	[%l7 + 0x38]
	edge8ln	%i7,	%i2,	%l1
	array16	%i4,	%l3,	%g4
	save %l2, %o0, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i1,	%g2,	%l6
	srlx	%g6,	0x17,	%o7
	srlx	%i3,	0x0B,	%g3
	movgu	%xcc,	%i6,	%o4
	movcc	%icc,	%i5,	%g5
	fnand	%f22,	%f0,	%f14
	fandnot2s	%f4,	%f12,	%f5
	orncc	%o1,	%i0,	%o3
	movrgz	%o6,	%g1,	%l4
	edge8	%g7,	%l5,	%o5
	fmuld8ulx16	%f18,	%f25,	%f26
	ld	[%l7 + 0x14],	%f25
	movrgz	%i7,	%o2,	%l1
	xnorcc	%i4,	0x115B,	%l3
	ldsb	[%l7 + 0x27],	%g4
	fnegd	%f16,	%f22
	fpsub16	%f4,	%f6,	%f30
	mova	%xcc,	%i2,	%o0
	movn	%icc,	%l0,	%i1
	fzeros	%f28
	or	%g2,	0x154E,	%l6
	mova	%icc,	%l2,	%o7
	edge32l	%g6,	%i3,	%i6
	edge8ln	%g3,	%o4,	%i5
	movg	%xcc,	%g5,	%o1
	smulcc	%o3,	0x0D87,	%i0
	fornot2s	%f7,	%f19,	%f2
	andn	%o6,	%g1,	%g7
	fxor	%f20,	%f22,	%f18
	ldsw	[%l7 + 0x4C],	%l5
	ld	[%l7 + 0x5C],	%f10
	edge16n	%o5,	%l4,	%i7
	edge32l	%o2,	%i4,	%l3
	sir	0x0312
	fnands	%f25,	%f19,	%f4
	pdist	%f20,	%f10,	%f2
	movleu	%xcc,	%l1,	%g4
	fnot1s	%f22,	%f25
	smul	%o0,	%i2,	%l0
	xor	%g2,	0x137C,	%l6
	edge8n	%l2,	%o7,	%g6
	andcc	%i3,	%i1,	%g3
	movre	%i6,	%i5,	%o4
	edge16l	%o1,	%o3,	%i0
	orncc	%g5,	0x0760,	%o6
	edge16l	%g7,	%g1,	%l5
	movgu	%xcc,	%l4,	%o5
	fmovscs	%xcc,	%f31,	%f4
	lduw	[%l7 + 0x70],	%o2
	stb	%i7,	[%l7 + 0x53]
	movrlz	%i4,	0x056,	%l3
	ld	[%l7 + 0x1C],	%f19
	subccc	%g4,	%l1,	%i2
	restore %l0, %o0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l2,	%g2,	%o7
	edge32l	%i3,	%i1,	%g6
	edge16n	%g3,	%i6,	%o4
	addcc	%o1,	0x08CA,	%i5
	mulx	%i0,	0x15A1,	%g5
	save %o6, %o3, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l5,	%g7,	%l4
	fmovrdlz	%o5,	%f26,	%f22
	fnot1s	%f18,	%f11
	subccc	%o2,	0x03D8,	%i7
	addccc	%l3,	0x0748,	%g4
	movn	%icc,	%i4,	%l1
	andcc	%i2,	%o0,	%l6
	fpsub32	%f8,	%f30,	%f8
	movvc	%icc,	%l2,	%l0
	movcc	%icc,	%o7,	%g2
	edge8n	%i1,	%i3,	%g6
	fmul8sux16	%f14,	%f16,	%f16
	andcc	%i6,	0x05E9,	%o4
	mulscc	%o1,	0x0AC6,	%i5
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	mulscc	%g5,	%o3,	%l5
	srlx	%g7,	0x00,	%l4
	fzeros	%f10
	bshuffle	%f18,	%f20,	%f26
	and	%g1,	%o2,	%o5
	addcc	%i7,	%l3,	%i4
	fmovrde	%l1,	%f20,	%f14
	mova	%icc,	%g4,	%o0
	fpadd32s	%f27,	%f13,	%f28
	andcc	%l6,	%i2,	%l0
	std	%f2,	[%l7 + 0x60]
	movrgz	%l2,	0x2BE,	%g2
	fornot1	%f8,	%f2,	%f12
	array8	%i1,	%o7,	%g6
	array8	%i6,	%o4,	%o1
	movcc	%xcc,	%i3,	%i5
	fmovsneg	%xcc,	%f20,	%f23
	fmovsneg	%icc,	%f5,	%f30
	fpmerge	%f27,	%f11,	%f12
	fmovdg	%icc,	%f9,	%f10
	movge	%icc,	%g3,	%o6
	movle	%icc,	%g5,	%o3
	movrlz	%i0,	0x097,	%g7
	movge	%xcc,	%l4,	%g1
	movcs	%icc,	%l5,	%o2
	movne	%icc,	%o5,	%i7
	movcc	%xcc,	%l3,	%l1
	fmovsvc	%xcc,	%f11,	%f6
	addc	%g4,	%o0,	%i4
	sllx	%i2,	0x12,	%l0
	fnot1s	%f11,	%f24
	ldsw	[%l7 + 0x54],	%l6
	fmovrdlez	%l2,	%f10,	%f8
	edge16	%i1,	%o7,	%g2
	edge16l	%i6,	%g6,	%o1
	xnor	%i3,	0x1761,	%o4
	movrgz	%g3,	%i5,	%g5
	and	%o3,	0x02B7,	%o6
	move	%xcc,	%i0,	%l4
	andncc	%g1,	%g7,	%o2
	smulcc	%l5,	%o5,	%l3
	movvs	%icc,	%l1,	%i7
	fmul8ulx16	%f0,	%f16,	%f2
	stb	%g4,	[%l7 + 0x5A]
	fandnot2s	%f10,	%f16,	%f12
	fsrc1	%f16,	%f4
	xor	%i4,	%o0,	%l0
	edge16ln	%i2,	%l6,	%i1
	sdivcc	%o7,	0x1A7D,	%l2
	fmovse	%xcc,	%f9,	%f22
	udivcc	%i6,	0x1165,	%g2
	edge32n	%o1,	%i3,	%o4
	ldsw	[%l7 + 0x28],	%g3
	fmovsneg	%xcc,	%f3,	%f8
	edge8n	%i5,	%g6,	%g5
	xnor	%o6,	%i0,	%o3
	fmovsleu	%icc,	%f9,	%f29
	sll	%l4,	0x03,	%g1
	sethi	0x061C,	%o2
	edge8	%l5,	%g7,	%o5
	ldd	[%l7 + 0x30],	%l2
	xorcc	%l1,	%g4,	%i4
	ldsb	[%l7 + 0x63],	%i7
	xnor	%o0,	%l0,	%l6
	fmovsge	%icc,	%f11,	%f10
	mulscc	%i2,	0x1EB8,	%o7
	orncc	%l2,	%i1,	%g2
	addc	%o1,	%i6,	%o4
	edge32ln	%i3,	%g3,	%g6
	st	%f19,	[%l7 + 0x70]
	subccc	%i5,	0x0602,	%o6
	fxors	%f12,	%f18,	%f29
	smulcc	%i0,	%o3,	%g5
	fmovsvc	%xcc,	%f14,	%f1
	st	%f3,	[%l7 + 0x40]
	edge16ln	%l4,	%o2,	%g1
	addcc	%l5,	%o5,	%g7
	movl	%xcc,	%l1,	%g4
	movrlz	%i4,	0x0C4,	%i7
	fpsub16	%f8,	%f14,	%f14
	fmovrsgez	%l3,	%f7,	%f12
	mulscc	%o0,	%l6,	%l0
	xnor	%i2,	0x1F8E,	%l2
	array32	%o7,	%g2,	%i1
	movrgez	%i6,	%o1,	%o4
	fnot1s	%f23,	%f22
	array32	%i3,	%g3,	%g6
	andcc	%o6,	%i5,	%i0
	stb	%g5,	[%l7 + 0x4D]
	fcmpgt32	%f28,	%f18,	%l4
	mulx	%o3,	%g1,	%o2
	fmovdleu	%xcc,	%f21,	%f12
	popc	0x1441,	%o5
	fmovsge	%icc,	%f11,	%f10
	mulscc	%g7,	%l1,	%l5
	ldd	[%l7 + 0x78],	%f16
	restore %i4, 0x137F, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l3,	%i7,	%o0
	add	%l0,	%l6,	%i2
	stx	%l2,	[%l7 + 0x60]
	sir	0x07FA
	umul	%g2,	0x1022,	%o7
	udivx	%i6,	0x1DFE,	%o1
	ldsw	[%l7 + 0x20],	%i1
	subccc	%o4,	0x09A5,	%g3
	srax	%g6,	%o6,	%i3
	movle	%xcc,	%i5,	%i0
	fmovsn	%icc,	%f16,	%f26
	mova	%xcc,	%g5,	%l4
	stx	%o3,	[%l7 + 0x40]
	and	%o2,	%g1,	%g7
	edge32ln	%l1,	%l5,	%i4
	move	%xcc,	%o5,	%l3
	xorcc	%g4,	0x061F,	%o0
	pdist	%f2,	%f26,	%f28
	andn	%l0,	0x16A9,	%i7
	udivx	%l6,	0x07E7,	%i2
	movrne	%l2,	0x071,	%o7
	fcmpne32	%f8,	%f8,	%i6
	fandnot2	%f4,	%f16,	%f30
	array8	%o1,	%g2,	%o4
	fpack32	%f24,	%f10,	%f6
	fandnot1s	%f15,	%f10,	%f7
	subcc	%g3,	%g6,	%i1
	edge8	%i3,	%i5,	%i0
	movrne	%o6,	0x03F,	%l4
	fpsub16s	%f1,	%f7,	%f16
	movcs	%xcc,	%g5,	%o2
	fmovsle	%xcc,	%f2,	%f2
	edge16n	%g1,	%o3,	%g7
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	umul	%o5,	%l3,	%g4
	mulscc	%i4,	0x049A,	%l0
	movleu	%xcc,	%i7,	%o0
	fand	%f16,	%f16,	%f14
	movge	%icc,	%i2,	%l2
	fmovdg	%xcc,	%f21,	%f13
	sll	%o7,	%i6,	%l6
	movrlez	%o1,	0x3AF,	%o4
	udivx	%g3,	0x0275,	%g2
	pdist	%f12,	%f30,	%f14
	movvs	%xcc,	%g6,	%i3
	sir	0x0BBC
	fmovdcc	%icc,	%f15,	%f13
	move	%icc,	%i5,	%i1
	fmovrdgez	%o6,	%f2,	%f24
	nop
	set	0x1C, %l3
	ldsw	[%l7 + %l3],	%i0
	ldsh	[%l7 + 0x16],	%l4
	subccc	%g5,	0x0908,	%g1
	andcc	%o2,	%g7,	%o3
	array16	%l5,	%l1,	%l3
	fmovrde	%o5,	%f6,	%f10
	sth	%g4,	[%l7 + 0x70]
	umul	%l0,	%i7,	%o0
	faligndata	%f0,	%f10,	%f14
	udivx	%i2,	0x1375,	%l2
	subccc	%i4,	%i6,	%o7
	edge16ln	%o1,	%o4,	%l6
	sth	%g3,	[%l7 + 0x22]
	edge32ln	%g6,	%i3,	%g2
	fmovspos	%xcc,	%f22,	%f16
	stw	%i5,	[%l7 + 0x60]
	edge8ln	%o6,	%i1,	%i0
	movrlz	%g5,	%g1,	%l4
	fsrc2s	%f23,	%f18
	fzero	%f28
	lduw	[%l7 + 0x7C],	%o2
	ldub	[%l7 + 0x16],	%o3
	or	%l5,	%l1,	%l3
	movcs	%xcc,	%g7,	%o5
	xnor	%g4,	%l0,	%o0
	restore %i2, 0x1025, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l2,	0x012E,	%i6
	edge16n	%o7,	%o1,	%i4
	fmovdgu	%xcc,	%f28,	%f26
	fabss	%f8,	%f24
	sth	%o4,	[%l7 + 0x3A]
	addcc	%g3,	%l6,	%g6
	addc	%g2,	%i5,	%i3
	edge8	%o6,	%i0,	%i1
	movre	%g1,	%g5,	%o2
	fmovde	%icc,	%f30,	%f27
	fmovsn	%icc,	%f27,	%f16
	sub	%l4,	%l5,	%o3
	edge16l	%l3,	%g7,	%o5
	sth	%g4,	[%l7 + 0x7C]
	edge32n	%l1,	%o0,	%l0
	sdiv	%i2,	0x13EF,	%i7
	fmovsneg	%icc,	%f8,	%f11
	fmul8x16	%f29,	%f0,	%f26
	subccc	%l2,	%o7,	%i6
	xnorcc	%i4,	%o1,	%g3
	move	%icc,	%l6,	%g6
	fmuld8ulx16	%f25,	%f9,	%f20
	fmovrsne	%o4,	%f5,	%f14
	fxnor	%f14,	%f6,	%f20
	st	%f13,	[%l7 + 0x68]
	fmul8x16al	%f15,	%f29,	%f12
	fmovdne	%xcc,	%f21,	%f19
	ldsb	[%l7 + 0x5D],	%i5
	udivx	%i3,	0x1E8E,	%o6
	edge16ln	%i0,	%i1,	%g2
	save %g1, %g5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%o2,	%o3
	lduh	[%l7 + 0x3C],	%l3
	movrgez	%l5,	0x1B8,	%g7
	sir	0x18B7
	edge32n	%g4,	%l1,	%o5
	alignaddrl	%l0,	%i2,	%i7
	array32	%o0,	%l2,	%o7
	andncc	%i6,	%i4,	%g3
	faligndata	%f0,	%f8,	%f16
	andncc	%l6,	%o1,	%g6
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	movvc	%icc,	%o6,	%i3
	movrlez	%i1,	0x107,	%g2
	fmovdl	%icc,	%f15,	%f2
	fcmpeq16	%f20,	%f0,	%i0
	fcmpne32	%f18,	%f0,	%g5
	movn	%icc,	%g1,	%l4
	lduh	[%l7 + 0x2A],	%o2
	movrlez	%l3,	0x30A,	%l5
	xnorcc	%g7,	%g4,	%o3
	movrne	%o5,	%l0,	%l1
	movn	%icc,	%i2,	%o0
	lduw	[%l7 + 0x78],	%i7
	fmovsneg	%xcc,	%f18,	%f11
	add	%o7,	%i6,	%i4
	movle	%icc,	%l2,	%l6
	fpackfix	%f10,	%f10
	fnot2s	%f12,	%f23
	andcc	%g3,	%o1,	%i5
	andcc	%o4,	%g6,	%o6
	edge8l	%i1,	%g2,	%i3
	andn	%g5,	%g1,	%i0
	movrlez	%o2,	0x21C,	%l4
	st	%f11,	[%l7 + 0x0C]
	fmovdg	%icc,	%f29,	%f9
	ldd	[%l7 + 0x18],	%l2
	sra	%g7,	%g4,	%l5
	and	%o3,	%o5,	%l0
	edge16l	%i2,	%l1,	%i7
	sdivcc	%o0,	0x12B0,	%i6
	popc	0x0F17,	%i4
	movrlez	%l2,	%o7,	%l6
	fmuld8ulx16	%f6,	%f29,	%f22
	fmul8x16	%f26,	%f10,	%f26
	edge32	%g3,	%i5,	%o4
	add	%o1,	%g6,	%o6
	fxnors	%f28,	%f27,	%f4
	subccc	%i1,	%g2,	%i3
	ldd	[%l7 + 0x58],	%g0
	stx	%g5,	[%l7 + 0x50]
	srax	%o2,	%l4,	%l3
	orncc	%g7,	%i0,	%g4
	xorcc	%l5,	%o5,	%l0
	fmul8sux16	%f0,	%f10,	%f4
	restore %i2, 0x19FB, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o3,	[%l7 + 0x60]
	fmovrslez	%o0,	%f30,	%f7
	movcc	%xcc,	%i6,	%i4
	for	%f12,	%f12,	%f30
	smul	%i7,	%o7,	%l2
	sth	%l6,	[%l7 + 0x5A]
	movleu	%icc,	%g3,	%i5
	ld	[%l7 + 0x14],	%f10
	movcc	%icc,	%o4,	%g6
	stw	%o6,	[%l7 + 0x24]
	srl	%o1,	0x17,	%g2
	fsrc2s	%f18,	%f0
	fmovdl	%xcc,	%f30,	%f12
	fpack16	%f14,	%f16
	edge8l	%i3,	%g1,	%i1
	fornot2s	%f6,	%f8,	%f14
	or	%g5,	%l4,	%l3
	stb	%g7,	[%l7 + 0x2D]
	ldx	[%l7 + 0x08],	%i0
	fmovsle	%xcc,	%f20,	%f12
	edge8ln	%o2,	%g4,	%l5
	umulcc	%l0,	0x191E,	%i2
	sra	%l1,	0x1A,	%o3
	fmovsne	%xcc,	%f20,	%f25
	fnegs	%f27,	%f1
	edge32n	%o5,	%i6,	%i4
	edge8ln	%o0,	%i7,	%o7
	or	%l6,	%l2,	%g3
	fcmpgt32	%f12,	%f30,	%i5
	fors	%f13,	%f23,	%f7
	orn	%g6,	%o6,	%o4
	sethi	0x0BB7,	%g2
	fmovdvs	%xcc,	%f29,	%f10
	mulx	%i3,	0x007C,	%g1
	srlx	%i1,	%o1,	%l4
	fnegs	%f24,	%f17
	orncc	%l3,	0x0B03,	%g5
	srl	%i0,	%o2,	%g4
	edge32l	%l5,	%g7,	%l0
	smul	%i2,	%l1,	%o5
	sra	%i6,	%o3,	%i4
	ldd	[%l7 + 0x20],	%f8
	sdivx	%o0,	0x1293,	%i7
	lduw	[%l7 + 0x6C],	%o7
	edge8l	%l2,	%l6,	%g3
	fmovsle	%icc,	%f6,	%f30
	movrne	%i5,	%o6,	%o4
	andcc	%g6,	0x1F87,	%g2
	movn	%xcc,	%i3,	%i1
	movge	%icc,	%o1,	%l4
	edge32l	%g1,	%l3,	%g5
	fmovdn	%xcc,	%f21,	%f14
	edge8l	%o2,	%g4,	%i0
	sethi	0x0B9B,	%l5
	udivx	%l0,	0x0B52,	%i2
	sdivx	%l1,	0x08F3,	%g7
	ldsw	[%l7 + 0x68],	%o5
	sir	0x0052
	st	%f11,	[%l7 + 0x40]
	fxnor	%f14,	%f4,	%f14
	movrlez	%i6,	%i4,	%o3
	srax	%i7,	0x12,	%o7
	fxnors	%f10,	%f10,	%f20
	save %o0, 0x0936, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f8,	%f14,	%f12
	movvc	%xcc,	%l2,	%i5
	orcc	%o6,	0x02E8,	%o4
	fxors	%f25,	%f8,	%f25
	edge16ln	%g3,	%g2,	%i3
	stx	%g6,	[%l7 + 0x38]
	fmovsg	%icc,	%f31,	%f7
	edge8n	%o1,	%l4,	%g1
	udivx	%i1,	0x19CE,	%g5
	srlx	%l3,	%g4,	%i0
	fcmpgt32	%f18,	%f18,	%o2
	mova	%icc,	%l0,	%i2
	popc	0x1028,	%l1
	fmovsleu	%xcc,	%f30,	%f1
	fmovscc	%icc,	%f27,	%f4
	sra	%l5,	%g7,	%i6
	for	%f0,	%f28,	%f22
	edge16n	%i4,	%o5,	%o3
	subccc	%o7,	0x05F2,	%i7
	fornot2s	%f16,	%f0,	%f9
	edge16l	%l6,	%o0,	%l2
	fpadd16	%f18,	%f10,	%f30
	fmovdne	%xcc,	%f5,	%f17
	ldsw	[%l7 + 0x08],	%i5
	smulcc	%o6,	0x03AB,	%o4
	fmovsvc	%icc,	%f15,	%f17
	movn	%icc,	%g3,	%g2
	array16	%g6,	%i3,	%o1
	ldsw	[%l7 + 0x6C],	%l4
	ldx	[%l7 + 0x70],	%g1
	ldsw	[%l7 + 0x3C],	%g5
	edge8n	%l3,	%i1,	%g4
	edge8ln	%i0,	%l0,	%i2
	fmul8sux16	%f30,	%f28,	%f26
	movn	%icc,	%o2,	%l5
	edge8l	%l1,	%g7,	%i4
	udivcc	%i6,	0x1647,	%o5
	edge16l	%o7,	%i7,	%l6
	ldsb	[%l7 + 0x3E],	%o0
	andn	%l2,	%i5,	%o6
	movrne	%o4,	%g3,	%g2
	array32	%g6,	%o3,	%o1
	ldd	[%l7 + 0x40],	%f0
	fnot1	%f14,	%f2
	edge32	%i3,	%l4,	%g5
	std	%f2,	[%l7 + 0x10]
	fsrc2	%f2,	%f12
	edge16l	%g1,	%i1,	%l3
	sth	%g4,	[%l7 + 0x5E]
	ldsw	[%l7 + 0x54],	%l0
	fsrc1	%f12,	%f10
	movpos	%icc,	%i0,	%o2
	fcmped	%fcc2,	%f22,	%f26
	fmovscc	%xcc,	%f20,	%f13
	nop
	set	0x7C, %i6
	stw	%i2,	[%l7 + %i6]
	smul	%l1,	0x1F02,	%g7
	fornot1	%f4,	%f12,	%f16
	srax	%i4,	%l5,	%i6
	mulx	%o5,	0x03E2,	%o7
	fcmple16	%f8,	%f28,	%i7
	movvc	%xcc,	%o0,	%l2
	or	%l6,	%o6,	%i5
	sdivx	%o4,	0x0770,	%g3
	umulcc	%g2,	%g6,	%o1
	ld	[%l7 + 0x7C],	%f7
	sra	%i3,	0x0F,	%l4
	sll	%o3,	%g5,	%g1
	movneg	%icc,	%i1,	%l3
	st	%f27,	[%l7 + 0x6C]
	array16	%g4,	%i0,	%l0
	subc	%i2,	0x05BF,	%o2
	edge32l	%g7,	%l1,	%i4
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	fsrc2s	%f2,	%f17
	xnorcc	%o7,	%o5,	%o0
	ldub	[%l7 + 0x28],	%l2
	edge32l	%l6,	%i7,	%o6
	xorcc	%o4,	0x020E,	%g3
	fnors	%f2,	%f26,	%f6
	fmovsgu	%icc,	%f7,	%f12
	sub	%i5,	0x0999,	%g2
	movre	%g6,	0x1D3,	%i3
	movcc	%xcc,	%o1,	%o3
	fmovscc	%icc,	%f4,	%f24
	array32	%l4,	%g1,	%g5
	udivx	%l3,	0x10AC,	%g4
	lduh	[%l7 + 0x2C],	%i0
	stx	%l0,	[%l7 + 0x50]
	lduw	[%l7 + 0x68],	%i2
	ldsb	[%l7 + 0x69],	%i1
	array32	%g7,	%l1,	%i4
	xnorcc	%l5,	%i6,	%o7
	movgu	%icc,	%o2,	%o5
	fand	%f8,	%f26,	%f0
	fands	%f8,	%f2,	%f2
	sdiv	%o0,	0x146B,	%l2
	ldd	[%l7 + 0x10],	%f28
	fpack16	%f22,	%f4
	orn	%i7,	%l6,	%o4
	movle	%xcc,	%o6,	%i5
	ldub	[%l7 + 0x5E],	%g3
	fmovscc	%xcc,	%f21,	%f11
	st	%f3,	[%l7 + 0x7C]
	ld	[%l7 + 0x48],	%f23
	umulcc	%g2,	%g6,	%o1
	fmul8x16au	%f10,	%f18,	%f0
	fmovrdlz	%o3,	%f10,	%f0
	fmovdl	%xcc,	%f19,	%f12
	movle	%xcc,	%i3,	%l4
	save %g5, %l3, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g4,	%l0,	%i2
	move	%xcc,	%i1,	%g7
	sdiv	%l1,	0x0FAE,	%i4
	mova	%icc,	%i0,	%i6
	ldsw	[%l7 + 0x30],	%o7
	sdiv	%l5,	0x133C,	%o2
	array16	%o0,	%l2,	%i7
	fmovsle	%xcc,	%f14,	%f27
	or	%o5,	0x1E89,	%l6
	ldsh	[%l7 + 0x3E],	%o6
	stb	%i5,	[%l7 + 0x4E]
	mova	%icc,	%o4,	%g2
	smulcc	%g3,	0x0629,	%o1
	sdivcc	%o3,	0x01F5,	%g6
	fnot1s	%f6,	%f9
	array8	%l4,	%g5,	%i3
	andcc	%g1,	%l3,	%l0
	edge32l	%i2,	%g4,	%i1
	fone	%f28
	movle	%xcc,	%l1,	%i4
	movvc	%xcc,	%g7,	%i0
	fxnor	%f28,	%f28,	%f2
	movcs	%icc,	%o7,	%i6
	sra	%l5,	%o2,	%o0
	fpmerge	%f13,	%f29,	%f6
	stw	%i7,	[%l7 + 0x3C]
	movrlez	%l2,	0x2AF,	%o5
	movrlez	%o6,	0x18C,	%l6
	mulscc	%i5,	%g2,	%o4
	fpadd16s	%f11,	%f11,	%f8
	andncc	%g3,	%o1,	%g6
	smul	%o3,	0x11DD,	%g5
	xnor	%l4,	0x166E,	%g1
	array8	%l3,	%l0,	%i3
	stw	%g4,	[%l7 + 0x6C]
	stb	%i2,	[%l7 + 0x15]
	array8	%i1,	%l1,	%g7
	ldsw	[%l7 + 0x48],	%i4
	and	%i0,	%o7,	%l5
	lduh	[%l7 + 0x26],	%o2
	srlx	%o0,	%i6,	%l2
	fmovdneg	%icc,	%f4,	%f26
	movcs	%icc,	%o5,	%o6
	fcmpne32	%f12,	%f16,	%l6
	fcmpd	%fcc1,	%f20,	%f26
	edge32	%i7,	%i5,	%o4
	movl	%xcc,	%g3,	%g2
	fandnot1	%f20,	%f8,	%f8
	fmovdvs	%xcc,	%f9,	%f26
	fornot2s	%f20,	%f20,	%f1
	lduw	[%l7 + 0x08],	%o1
	sir	0x1156
	edge16	%g6,	%g5,	%l4
	edge8n	%o3,	%g1,	%l0
	edge8n	%l3,	%i3,	%i2
	andcc	%i1,	%l1,	%g4
	smulcc	%i4,	0x1637,	%i0
	srl	%g7,	%o7,	%l5
	fmovrdgez	%o2,	%f22,	%f6
	fmul8x16al	%f30,	%f14,	%f6
	fmovscc	%xcc,	%f27,	%f20
	fexpand	%f2,	%f10
	edge8n	%i6,	%o0,	%o5
	xnorcc	%o6,	0x1E12,	%l6
	srax	%i7,	%l2,	%i5
	andcc	%o4,	0x10A9,	%g3
	fmovsg	%icc,	%f23,	%f1
	movneg	%icc,	%o1,	%g2
	fpsub16	%f18,	%f28,	%f16
	edge16n	%g6,	%g5,	%o3
	srl	%l4,	0x12,	%l0
	fzero	%f2
	sll	%l3,	%g1,	%i3
	save %i2, 0x0698, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l1,	[%l7 + 0x78]
	fandnot2s	%f30,	%f1,	%f25
	movrlez	%i4,	0x1CA,	%g4
	edge16l	%g7,	%i0,	%o7
	mulscc	%l5,	%o2,	%o0
	edge16l	%o5,	%i6,	%o6
	movl	%xcc,	%i7,	%l2
	movrgez	%i5,	0x152,	%o4
	xor	%g3,	%o1,	%l6
	movl	%xcc,	%g6,	%g2
	fpack32	%f10,	%f20,	%f14
	ldsb	[%l7 + 0x59],	%g5
	srlx	%l4,	%o3,	%l0
	fnot1s	%f12,	%f12
	movn	%xcc,	%g1,	%l3
	nop
	set	0x40, %l5
	std	%f0,	[%l7 + %l5]
	ldub	[%l7 + 0x34],	%i3
	alignaddrl	%i2,	%i1,	%l1
	sll	%g4,	%g7,	%i0
	fpsub16s	%f8,	%f20,	%f9
	stw	%i4,	[%l7 + 0x0C]
	mova	%xcc,	%o7,	%l5
	fcmple32	%f26,	%f26,	%o0
	subccc	%o2,	0x1D46,	%o5
	add	%i6,	%o6,	%i7
	popc	0x0ACF,	%i5
	ldx	[%l7 + 0x68],	%o4
	edge8n	%l2,	%o1,	%g3
	siam	0x0
	movne	%xcc,	%g6,	%g2
	fmovrdne	%g5,	%f0,	%f6
	mulscc	%l4,	%l6,	%o3
	array32	%g1,	%l3,	%l0
	edge16l	%i3,	%i1,	%l1
	srl	%g4,	0x02,	%i2
	movrgz	%i0,	0x337,	%i4
	movvc	%xcc,	%g7,	%l5
	movgu	%icc,	%o0,	%o7
	movrlez	%o2,	0x109,	%o5
	fabsd	%f6,	%f26
	addccc	%i6,	0x0891,	%i7
	movrne	%i5,	%o6,	%o4
	fmovrse	%l2,	%f12,	%f7
	ld	[%l7 + 0x74],	%f12
	fmovdneg	%icc,	%f23,	%f25
	andcc	%o1,	%g3,	%g6
	edge16l	%g2,	%l4,	%l6
	popc	0x1F3A,	%o3
	fmovscc	%icc,	%f0,	%f9
	movrlz	%g5,	%g1,	%l0
	fmovrdlez	%l3,	%f14,	%f2
	nop
	set	0x0C, %l4
	stw	%i3,	[%l7 + %l4]
	alignaddrl	%l1,	%g4,	%i2
	fmovrdlez	%i1,	%f24,	%f8
	edge16	%i4,	%g7,	%l5
	fmovscs	%xcc,	%f0,	%f28
	edge16	%i0,	%o0,	%o7
	edge32ln	%o2,	%i6,	%o5
	fpsub32	%f18,	%f8,	%f24
	fmovse	%icc,	%f12,	%f20
	lduh	[%l7 + 0x16],	%i7
	stb	%i5,	[%l7 + 0x6C]
	srax	%o6,	%o4,	%l2
	edge32n	%g3,	%o1,	%g6
	and	%l4,	0x1559,	%g2
	lduh	[%l7 + 0x78],	%l6
	edge32ln	%o3,	%g5,	%g1
	movle	%icc,	%l0,	%i3
	ldsb	[%l7 + 0x73],	%l1
	orcc	%g4,	%l3,	%i1
	umulcc	%i2,	%i4,	%g7
	edge16ln	%l5,	%i0,	%o7
	movcs	%icc,	%o2,	%i6
	movrlz	%o0,	%i7,	%o5
	lduh	[%l7 + 0x30],	%i5
	andn	%o4,	%l2,	%g3
	fmovdleu	%xcc,	%f30,	%f10
	save %o1, 0x1784, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f30,	%f1,	%f26
	movcc	%icc,	%l4,	%g2
	fcmpgt16	%f2,	%f0,	%g6
	edge8n	%o3,	%g5,	%g1
	fands	%f28,	%f5,	%f1
	movpos	%icc,	%l0,	%l6
	edge16l	%i3,	%l1,	%g4
	sdivx	%i1,	0x01E9,	%l3
	sllx	%i4,	0x12,	%i2
	movle	%icc,	%l5,	%i0
	fsrc1s	%f24,	%f23
	sra	%o7,	0x05,	%o2
	alignaddr	%g7,	%i6,	%i7
	movvc	%xcc,	%o5,	%o0
	movne	%icc,	%o4,	%i5
	ldd	[%l7 + 0x58],	%l2
	srax	%o1,	%o6,	%g3
	movcc	%icc,	%g2,	%g6
	edge32l	%l4,	%o3,	%g5
	ldx	[%l7 + 0x10],	%g1
	fmovdne	%icc,	%f24,	%f19
	fmovdpos	%xcc,	%f30,	%f15
	mulx	%l0,	0x163B,	%i3
	or	%l6,	0x1869,	%l1
	andncc	%g4,	%i1,	%i4
	edge8n	%i2,	%l5,	%l3
	fsrc2s	%f8,	%f15
	fcmpeq16	%f10,	%f8,	%o7
	array16	%i0,	%g7,	%i6
	edge8ln	%i7,	%o2,	%o0
	lduw	[%l7 + 0x24],	%o5
	stb	%o4,	[%l7 + 0x79]
	sir	0x1AD3
	fcmpeq32	%f30,	%f30,	%l2
	lduh	[%l7 + 0x60],	%o1
	ldsb	[%l7 + 0x7A],	%i5
	and	%o6,	%g3,	%g6
	fcmple32	%f0,	%f30,	%g2
	andn	%l4,	0x1A90,	%o3
	fmovsvc	%icc,	%f31,	%f5
	sdivcc	%g5,	0x0DB3,	%l0
	fcmped	%fcc1,	%f30,	%f8
	edge8ln	%i3,	%g1,	%l1
	edge16n	%l6,	%g4,	%i4
	movvc	%icc,	%i2,	%i1
	fnegd	%f4,	%f24
	fornot2s	%f18,	%f1,	%f27
	srax	%l5,	0x11,	%l3
	fmovrse	%i0,	%f10,	%f0
	subc	%o7,	%i6,	%i7
	edge32l	%o2,	%o0,	%g7
	fands	%f31,	%f3,	%f27
	ldsw	[%l7 + 0x2C],	%o4
	lduw	[%l7 + 0x28],	%l2
	udiv	%o1,	0x1118,	%i5
	movre	%o5,	0x005,	%o6
	orcc	%g6,	%g3,	%l4
	ldx	[%l7 + 0x20],	%g2
	or	%g5,	0x1A47,	%l0
	subcc	%o3,	%g1,	%l1
	fmovda	%icc,	%f20,	%f3
	sub	%i3,	%g4,	%i4
	and	%i2,	0x10D8,	%i1
	std	%f28,	[%l7 + 0x48]
	udivcc	%l5,	0x1DBB,	%l6
	and	%l3,	0x0C10,	%o7
	or	%i0,	%i7,	%o2
	lduh	[%l7 + 0x24],	%i6
	edge8l	%g7,	%o0,	%o4
	umul	%l2,	%o1,	%i5
	fmovsvc	%icc,	%f15,	%f15
	movvs	%icc,	%o5,	%o6
	ldd	[%l7 + 0x18],	%g2
	movleu	%icc,	%g6,	%l4
	udivx	%g5,	0x0C9C,	%g2
	fmovrse	%l0,	%f18,	%f26
	ldsw	[%l7 + 0x6C],	%o3
	movl	%icc,	%g1,	%l1
	andn	%g4,	%i4,	%i2
	subccc	%i3,	0x157C,	%l5
	fsrc1s	%f2,	%f2
	fnegd	%f10,	%f2
	edge16ln	%l6,	%l3,	%i1
	xor	%i0,	0x0E9A,	%i7
	fmovdg	%icc,	%f30,	%f18
	save %o7, %i6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f5,	%f17
	addcc	%o0,	0x1A78,	%o4
	alignaddrl	%g7,	%l2,	%o1
	fmovd	%f20,	%f14
	edge8n	%i5,	%o5,	%o6
	ldub	[%l7 + 0x0D],	%g6
	edge32	%g3,	%l4,	%g2
	movcs	%icc,	%g5,	%o3
	fxor	%f2,	%f0,	%f12
	mulx	%l0,	0x1225,	%l1
	smulcc	%g4,	0x14A3,	%g1
	ldx	[%l7 + 0x50],	%i4
	array16	%i2,	%i3,	%l5
	srl	%l6,	%l3,	%i1
	fnor	%f24,	%f10,	%f6
	movg	%xcc,	%i7,	%i0
	orn	%o7,	%o2,	%i6
	alignaddrl	%o0,	%g7,	%l2
	umulcc	%o1,	0x0724,	%o4
	movge	%xcc,	%i5,	%o6
	edge16n	%o5,	%g6,	%g3
	movvc	%icc,	%g2,	%l4
	movn	%icc,	%g5,	%l0
	ldsw	[%l7 + 0x34],	%o3
	fmul8x16au	%f1,	%f24,	%f18
	fxnors	%f0,	%f6,	%f7
	fone	%f10
	fcmpeq32	%f12,	%f16,	%g4
	ld	[%l7 + 0x0C],	%f25
	mulscc	%g1,	0x01F1,	%l1
	sethi	0x12C2,	%i2
	sll	%i4,	%i3,	%l5
	fmovsle	%icc,	%f8,	%f21
	sir	0x0490
	smulcc	%l6,	0x1292,	%i1
	umulcc	%l3,	%i0,	%o7
	fmuld8ulx16	%f8,	%f12,	%f0
	umulcc	%i7,	0x0577,	%i6
	edge8	%o0,	%g7,	%l2
	restore %o2, 0x007D, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o4,	%o6
	fmovsvs	%xcc,	%f28,	%f8
	fmovde	%xcc,	%f14,	%f24
	subccc	%o5,	%i5,	%g3
	addc	%g2,	0x1B44,	%g6
	add	%l4,	0x0134,	%l0
	umul	%o3,	%g4,	%g1
	movl	%icc,	%l1,	%i2
	sra	%g5,	%i4,	%l5
	sdivx	%l6,	0x0FC0,	%i3
	movg	%icc,	%i1,	%l3
	edge32	%i0,	%o7,	%i6
	mova	%xcc,	%i7,	%g7
	movg	%xcc,	%o0,	%o2
	orcc	%o1,	0x0611,	%l2
	fnegd	%f8,	%f8
	edge16ln	%o6,	%o4,	%i5
	movle	%xcc,	%g3,	%g2
	movre	%g6,	0x2AF,	%l4
	nop
	set	0x70, %o6
	ldx	[%l7 + %o6],	%l0
	ldd	[%l7 + 0x10],	%f10
	fxnor	%f8,	%f4,	%f2
	andncc	%o3,	%g4,	%o5
	sub	%l1,	%i2,	%g5
	fornot2	%f18,	%f6,	%f4
	movvc	%xcc,	%g1,	%l5
	fmul8sux16	%f8,	%f18,	%f30
	orn	%i4,	%i3,	%l6
	udivcc	%i1,	0x1EE7,	%l3
	ldx	[%l7 + 0x18],	%o7
	xor	%i0,	%i7,	%i6
	sir	0x03CB
	xnor	%g7,	0x1014,	%o2
	subc	%o1,	%o0,	%l2
	sir	0x1B17
	movle	%xcc,	%o6,	%i5
	orncc	%o4,	%g2,	%g6
	movne	%xcc,	%g3,	%l4
	fors	%f13,	%f27,	%f28
	ldd	[%l7 + 0x58],	%f2
	sdiv	%o3,	0x1737,	%l0
	movrlz	%o5,	%l1,	%i2
	array32	%g4,	%g1,	%g5
	fpadd16s	%f5,	%f8,	%f31
	movneg	%icc,	%l5,	%i3
	subc	%i4,	0x0EBA,	%i1
	movg	%xcc,	%l3,	%o7
	xnor	%i0,	0x1604,	%i7
	ldsh	[%l7 + 0x66],	%i6
	movg	%icc,	%l6,	%o2
	fzeros	%f14
	fmuld8sux16	%f17,	%f31,	%f12
	for	%f24,	%f4,	%f6
	stx	%o1,	[%l7 + 0x30]
	fsrc2	%f14,	%f0
	fcmped	%fcc3,	%f20,	%f22
	addcc	%g7,	0x0068,	%o0
	xorcc	%l2,	%o6,	%o4
	nop
	set	0x54, %o1
	lduw	[%l7 + %o1],	%i5
	lduh	[%l7 + 0x5A],	%g6
	umul	%g3,	%g2,	%l4
	movn	%icc,	%l0,	%o5
	movcc	%icc,	%o3,	%l1
	fsrc2	%f16,	%f18
	ldsb	[%l7 + 0x6A],	%i2
	xnorcc	%g1,	%g5,	%g4
	bshuffle	%f16,	%f0,	%f6
	umul	%i3,	0x0D9E,	%l5
	orn	%i4,	%l3,	%o7
	save %i1, %i7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i0,	%l6,	%o1
	movrlez	%g7,	%o2,	%l2
	fmovspos	%xcc,	%f17,	%f22
	smul	%o0,	0x0652,	%o4
	fmovrdlez	%o6,	%f28,	%f10
	edge8n	%i5,	%g3,	%g6
	edge8ln	%g2,	%l4,	%o5
	stx	%l0,	[%l7 + 0x38]
	alignaddr	%l1,	%o3,	%g1
	movrlz	%i2,	%g4,	%g5
	ldsh	[%l7 + 0x14],	%l5
	edge32l	%i3,	%l3,	%o7
	fmovspos	%icc,	%f15,	%f24
	fxors	%f28,	%f10,	%f26
	ldx	[%l7 + 0x30],	%i1
	edge16n	%i7,	%i6,	%i0
	sir	0x1F4A
	sll	%i4,	%l6,	%g7
	srl	%o1,	%o2,	%o0
	alignaddrl	%o4,	%o6,	%i5
	xor	%g3,	0x171F,	%g6
	movrne	%l2,	0x13B,	%g2
	fmovscc	%icc,	%f22,	%f8
	siam	0x0
	fmovdcc	%icc,	%f0,	%f20
	movrlz	%l4,	%l0,	%o5
	xnorcc	%l1,	%o3,	%i2
	fcmpne16	%f30,	%f20,	%g1
	sllx	%g4,	%g5,	%l5
	edge16n	%i3,	%l3,	%o7
	lduw	[%l7 + 0x34],	%i1
	alignaddrl	%i7,	%i6,	%i4
	stb	%l6,	[%l7 + 0x27]
	udiv	%g7,	0x1B59,	%o1
	subccc	%i0,	0x04A9,	%o2
	edge32ln	%o0,	%o4,	%o6
	ldub	[%l7 + 0x49],	%g3
	fmovd	%f20,	%f4
	movre	%i5,	0x3FE,	%g6
	edge8l	%l2,	%l4,	%l0
	fmovdg	%xcc,	%f3,	%f20
	subcc	%o5,	%l1,	%o3
	sdivx	%g2,	0x0C0A,	%i2
	udiv	%g4,	0x1379,	%g1
	orcc	%g5,	0x1801,	%l5
	fmovsl	%xcc,	%f17,	%f3
	xor	%i3,	0x0C70,	%o7
	movpos	%xcc,	%l3,	%i7
	edge8	%i1,	%i6,	%i4
	alignaddr	%l6,	%g7,	%o1
	stx	%o2,	[%l7 + 0x10]
	fmovscs	%xcc,	%f25,	%f11
	fmovrse	%i0,	%f29,	%f10
	ldub	[%l7 + 0x5C],	%o0
	umul	%o6,	0x0D8B,	%o4
	movneg	%icc,	%i5,	%g6
	fmovscc	%xcc,	%f30,	%f21
	array32	%g3,	%l2,	%l0
	subcc	%l4,	%o5,	%l1
	fornot1	%f24,	%f2,	%f8
	edge32	%o3,	%i2,	%g4
	sdiv	%g2,	0x0A51,	%g5
	array16	%g1,	%i3,	%o7
	sth	%l3,	[%l7 + 0x7A]
	fmovdn	%xcc,	%f18,	%f28
	movre	%i7,	0x1CB,	%i1
	ldd	[%l7 + 0x58],	%l4
	umulcc	%i6,	%l6,	%i4
	edge8	%g7,	%o2,	%i0
	sll	%o1,	%o6,	%o4
	movrgez	%i5,	0x12F,	%g6
	udivx	%o0,	0x1EC4,	%g3
	ldd	[%l7 + 0x58],	%f20
	andn	%l2,	0x11E8,	%l0
	sir	0x1275
	sdiv	%o5,	0x1E08,	%l4
	fmovrde	%l1,	%f20,	%f22
	fnot2	%f28,	%f8
	ldd	[%l7 + 0x60],	%o2
	subc	%g4,	%g2,	%i2
	save %g5, 0x0711, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o7,	%l3,	%i7
	fmovdvc	%icc,	%f25,	%f15
	xnorcc	%i1,	0x1A11,	%i3
	fpsub32s	%f30,	%f1,	%f2
	fsrc2	%f2,	%f8
	edge8	%i6,	%l5,	%l6
	sdivx	%g7,	0x062F,	%o2
	orn	%i4,	%o1,	%o6
	edge16ln	%i0,	%i5,	%o4
	stw	%g6,	[%l7 + 0x68]
	edge8n	%o0,	%g3,	%l2
	fmovrdne	%o5,	%f8,	%f16
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	fandnot1s	%f24,	%f9,	%f4
	or	%o3,	%g4,	%i2
	ldub	[%l7 + 0x0D],	%g2
	lduw	[%l7 + 0x7C],	%g1
	sdiv	%g5,	0x0F6C,	%l3
	movneg	%icc,	%i7,	%i1
	udivcc	%o7,	0x102B,	%i6
	fxor	%f16,	%f14,	%f0
	movrgez	%i3,	%l5,	%l6
	lduh	[%l7 + 0x08],	%g7
	sra	%i4,	%o1,	%o6
	udiv	%o2,	0x08E0,	%i5
	movle	%xcc,	%i0,	%g6
	movrgz	%o0,	0x211,	%o4
	andncc	%l2,	%o5,	%g3
	edge8ln	%l0,	%l1,	%l4
	sra	%o3,	%i2,	%g2
	sllx	%g4,	%g1,	%g5
	and	%i7,	%i1,	%l3
	movre	%o7,	0x0A2,	%i3
	fmul8x16al	%f10,	%f1,	%f10
	sub	%l5,	%i6,	%l6
	fmovdleu	%xcc,	%f9,	%f29
	edge8l	%i4,	%o1,	%o6
	movvc	%icc,	%g7,	%i5
	srax	%o2,	0x18,	%g6
	andncc	%i0,	%o4,	%l2
	ldsw	[%l7 + 0x54],	%o5
	array32	%o0,	%l0,	%l1
	ldsb	[%l7 + 0x1E],	%g3
	sub	%l4,	%i2,	%g2
	subc	%g4,	0x1480,	%g1
	fpadd32s	%f21,	%f12,	%f2
	orncc	%o3,	%i7,	%i1
	movne	%xcc,	%l3,	%o7
	sll	%g5,	0x01,	%i3
	fexpand	%f7,	%f20
	fmovdgu	%xcc,	%f22,	%f3
	move	%icc,	%i6,	%l6
	mulscc	%l5,	0x033F,	%o1
	orn	%i4,	%g7,	%o6
	sdivx	%i5,	0x1426,	%o2
	fsrc1s	%f5,	%f31
	stb	%g6,	[%l7 + 0x5C]
	fcmple16	%f26,	%f16,	%o4
	and	%i0,	0x0236,	%o5
	srlx	%o0,	%l2,	%l0
	movcc	%icc,	%g3,	%l4
	array8	%l1,	%g2,	%g4
	movneg	%xcc,	%i2,	%o3
	movneg	%icc,	%i7,	%i1
	smul	%g1,	%o7,	%g5
	addcc	%l3,	0x187D,	%i3
	for	%f20,	%f0,	%f0
	fmovscs	%icc,	%f9,	%f28
	edge32ln	%l6,	%i6,	%l5
	edge16	%o1,	%g7,	%i4
	and	%o6,	%o2,	%i5
	movneg	%xcc,	%o4,	%i0
	stw	%o5,	[%l7 + 0x60]
	ldsh	[%l7 + 0x12],	%o0
	sll	%l2,	0x07,	%l0
	ldd	[%l7 + 0x48],	%f2
	movgu	%xcc,	%g6,	%l4
	ldd	[%l7 + 0x48],	%f30
	sdivx	%l1,	0x027B,	%g3
	udivcc	%g4,	0x1C27,	%i2
	save %g2, 0x1178, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i7,	%i1
	fmovrsgz	%g1,	%f2,	%f3
	srlx	%o7,	0x0F,	%g5
	mulx	%i3,	0x1544,	%l3
	array8	%i6,	%l6,	%l5
	movneg	%xcc,	%o1,	%g7
	fornot1s	%f16,	%f1,	%f23
	fornot1s	%f11,	%f25,	%f29
	ldsw	[%l7 + 0x54],	%o6
	stb	%o2,	[%l7 + 0x52]
	ld	[%l7 + 0x5C],	%f22
	srl	%i4,	0x04,	%i5
	movcc	%xcc,	%i0,	%o5
	srlx	%o4,	%l2,	%o0
	edge32ln	%g6,	%l0,	%l1
	siam	0x4
	bshuffle	%f20,	%f18,	%f4
	fornot2	%f28,	%f28,	%f28
	popc	0x1B2A,	%l4
	andn	%g3,	0x07D5,	%g4
	alignaddrl	%g2,	%o3,	%i7
	andn	%i1,	0x0D25,	%g1
	fcmple32	%f28,	%f22,	%i2
	movne	%icc,	%o7,	%g5
	popc	0x0AAD,	%l3
	srax	%i3,	0x04,	%i6
	fpack16	%f0,	%f22
	stb	%l6,	[%l7 + 0x5C]
	movgu	%xcc,	%l5,	%o1
	move	%icc,	%o6,	%o2
	movne	%icc,	%i4,	%i5
	fmovdneg	%icc,	%f13,	%f1
	stw	%g7,	[%l7 + 0x64]
	sra	%o5,	%o4,	%i0
	fmovrsne	%o0,	%f2,	%f30
	sth	%l2,	[%l7 + 0x36]
	stw	%l0,	[%l7 + 0x78]
	sethi	0x1466,	%l1
	fmovsvc	%xcc,	%f24,	%f31
	movvs	%xcc,	%g6,	%l4
	mova	%xcc,	%g3,	%g4
	movrgz	%g2,	0x08D,	%o3
	move	%icc,	%i1,	%g1
	sethi	0x0080,	%i7
	subccc	%o7,	0x12C0,	%g5
	movrlez	%l3,	%i2,	%i6
	ldsb	[%l7 + 0x54],	%l6
	movrgz	%i3,	%l5,	%o1
	fmovse	%icc,	%f8,	%f19
	orcc	%o2,	0x0563,	%i4
	st	%f11,	[%l7 + 0x68]
	sethi	0x143D,	%o6
	srlx	%g7,	0x04,	%o5
	fmovdne	%icc,	%f19,	%f18
	array8	%o4,	%i0,	%o0
	movg	%xcc,	%i5,	%l2
	for	%f18,	%f4,	%f22
	movgu	%icc,	%l0,	%l1
	movle	%icc,	%g6,	%g3
	fcmpne16	%f24,	%f14,	%l4
	lduh	[%l7 + 0x2C],	%g2
	movre	%o3,	%g4,	%g1
	udiv	%i1,	0x0B9F,	%i7
	fzero	%f4
	ld	[%l7 + 0x18],	%f20
	orncc	%o7,	%l3,	%i2
	fandnot2s	%f27,	%f21,	%f28
	ldsb	[%l7 + 0x2A],	%g5
	movn	%xcc,	%i6,	%l6
	st	%f2,	[%l7 + 0x78]
	fcmpgt16	%f4,	%f14,	%l5
	udiv	%o1,	0x0608,	%o2
	edge8	%i3,	%o6,	%i4
	sra	%o5,	%g7,	%i0
	edge32l	%o4,	%i5,	%o0
	nop
	set	0x7C, %o5
	ldsw	[%l7 + %o5],	%l2
	alignaddr	%l1,	%g6,	%g3
	fors	%f8,	%f9,	%f0
	edge8ln	%l4,	%g2,	%l0
	fcmpeq32	%f30,	%f24,	%o3
	edge32	%g1,	%i1,	%g4
	restore %o7, %l3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f29,	%f23
	fmovda	%icc,	%f2,	%f17
	fnot2s	%f28,	%f22
	movrlz	%i2,	%g5,	%i6
	movg	%xcc,	%l6,	%l5
	andn	%o1,	0x025D,	%i3
	ldsh	[%l7 + 0x78],	%o2
	movpos	%icc,	%o6,	%o5
	ldsw	[%l7 + 0x2C],	%g7
	xnor	%i0,	%i4,	%o4
	for	%f20,	%f2,	%f0
	movcc	%xcc,	%i5,	%l2
	siam	0x6
	edge32ln	%o0,	%l1,	%g3
	andncc	%g6,	%g2,	%l0
	fmuld8ulx16	%f6,	%f29,	%f24
	std	%f22,	[%l7 + 0x78]
	ldx	[%l7 + 0x08],	%o3
	sdivx	%l4,	0x0F6C,	%g1
	ldsb	[%l7 + 0x68],	%g4
	movn	%xcc,	%o7,	%l3
	edge8l	%i1,	%i7,	%i2
	movrlez	%i6,	%g5,	%l6
	andncc	%o1,	%i3,	%o2
	addc	%o6,	%l5,	%o5
	fmul8x16	%f10,	%f18,	%f0
	sra	%i0,	0x0F,	%g7
	edge8	%i4,	%o4,	%i5
	lduw	[%l7 + 0x40],	%l2
	movne	%xcc,	%l1,	%o0
	fnegs	%f26,	%f4
	nop
	set	0x3C, %i0
	ldsw	[%l7 + %i0],	%g3
	array16	%g6,	%g2,	%o3
	popc	0x0C09,	%l4
	smulcc	%l0,	0x1C08,	%g4
	for	%f22,	%f20,	%f20
	array16	%o7,	%g1,	%i1
	edge8n	%l3,	%i2,	%i7
	fmovrsne	%i6,	%f7,	%f10
	sra	%l6,	0x19,	%o1
	subccc	%i3,	0x1820,	%o2
	movleu	%icc,	%g5,	%l5
	movcc	%xcc,	%o5,	%i0
	andncc	%g7,	%i4,	%o6
	fnors	%f9,	%f3,	%f4
	fnot2s	%f31,	%f15
	alignaddr	%o4,	%l2,	%i5
	edge32ln	%o0,	%l1,	%g6
	mova	%icc,	%g2,	%o3
	alignaddrl	%l4,	%l0,	%g3
	lduh	[%l7 + 0x0E],	%o7
	ldd	[%l7 + 0x70],	%g4
	sdivx	%i1,	0x11A6,	%l3
	ldd	[%l7 + 0x08],	%f10
	movrlez	%g1,	%i7,	%i6
	or	%i2,	0x18DF,	%l6
	xnor	%i3,	0x1E57,	%o1
	subc	%g5,	%o2,	%o5
	srax	%i0,	0x0A,	%l5
	fmovdg	%xcc,	%f20,	%f26
	fmovs	%f8,	%f8
	mulx	%i4,	%o6,	%o4
	srl	%g7,	%l2,	%o0
	pdist	%f30,	%f24,	%f6
	movgu	%xcc,	%i5,	%l1
	movneg	%xcc,	%g6,	%o3
	movrlez	%l4,	0x219,	%l0
	array16	%g2,	%g3,	%o7
	movrgz	%g4,	0x289,	%i1
	movne	%icc,	%l3,	%g1
	ld	[%l7 + 0x18],	%f0
	movvs	%icc,	%i7,	%i6
	subc	%i2,	%l6,	%o1
	stw	%g5,	[%l7 + 0x5C]
	udivcc	%i3,	0x0E5F,	%o5
	popc	0x0DC1,	%o2
	st	%f1,	[%l7 + 0x5C]
	fnot2	%f10,	%f8
	movg	%icc,	%i0,	%i4
	fsrc2	%f12,	%f20
	edge32n	%o6,	%l5,	%o4
	fmovsgu	%icc,	%f27,	%f31
	movrlez	%g7,	%l2,	%i5
	fnands	%f26,	%f13,	%f26
	mulx	%o0,	0x0A9E,	%g6
	edge32	%o3,	%l4,	%l1
	fmovdn	%xcc,	%f12,	%f14
	movpos	%xcc,	%l0,	%g3
	fmul8x16au	%f23,	%f18,	%f10
	udivx	%o7,	0x1EC6,	%g2
	ldsh	[%l7 + 0x42],	%i1
	popc	0x1BFE,	%l3
	orncc	%g1,	%g4,	%i7
	sdivcc	%i6,	0x1587,	%l6
	movg	%xcc,	%o1,	%g5
	umulcc	%i3,	%o5,	%o2
	movrgz	%i0,	0x1B9,	%i4
	ld	[%l7 + 0x78],	%f24
	movre	%i2,	0x176,	%l5
	srax	%o4,	%o6,	%l2
	edge8n	%i5,	%o0,	%g7
	movrlez	%g6,	0x208,	%l4
	fcmpgt16	%f10,	%f4,	%l1
	orcc	%l0,	%o3,	%o7
	move	%icc,	%g2,	%i1
	movg	%xcc,	%l3,	%g3
	nop
	set	0x5E, %i2
	ldsb	[%l7 + %i2],	%g4
	stw	%g1,	[%l7 + 0x6C]
	movne	%icc,	%i7,	%l6
	fmovdvs	%xcc,	%f25,	%f28
	movrne	%i6,	0x063,	%o1
	sub	%i3,	%g5,	%o2
	addccc	%o5,	0x08F8,	%i0
	fnand	%f12,	%f6,	%f30
	sdivx	%i4,	0x02D3,	%l5
	umul	%i2,	0x14CF,	%o4
	andn	%o6,	%l2,	%o0
	nop
	set	0x7C, %g7
	ldub	[%l7 + %g7],	%g7
	movvs	%icc,	%g6,	%i5
	movrlez	%l1,	0x373,	%l0
	srl	%o3,	%l4,	%g2
	movcs	%icc,	%o7,	%i1
	fpackfix	%f24,	%f19
	movge	%icc,	%l3,	%g4
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	bshuffle	%f0,	%f18,	%f26
	fmovdn	%xcc,	%f28,	%f16
	fzero	%f14
	xnor	%g1,	0x0528,	%o1
	ldub	[%l7 + 0x72],	%i3
	udivx	%i6,	0x13F7,	%g5
	add	%o2,	0x0496,	%o5
	fmul8sux16	%f28,	%f8,	%f22
	movne	%icc,	%i0,	%l5
	fmovdgu	%xcc,	%f8,	%f13
	xnorcc	%i4,	%i2,	%o4
	stx	%l2,	[%l7 + 0x20]
	umulcc	%o6,	0x1264,	%g7
	orncc	%o0,	0x0759,	%i5
	sth	%g6,	[%l7 + 0x26]
	fpadd16s	%f4,	%f31,	%f20
	andncc	%l0,	%o3,	%l1
	movge	%icc,	%g2,	%l4
	movl	%xcc,	%o7,	%i1
	movcs	%xcc,	%l3,	%g3
	movcs	%xcc,	%g4,	%l6
	movne	%icc,	%i7,	%g1
	array8	%o1,	%i6,	%g5
	subc	%i3,	%o2,	%o5
	orcc	%i0,	%l5,	%i2
	movg	%icc,	%o4,	%l2
	restore %i4, %o6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x00B7
	fmovsneg	%icc,	%f7,	%f8
	fmovdleu	%xcc,	%f2,	%f17
	movneg	%xcc,	%i5,	%g7
	sdivx	%g6,	0x03D6,	%l0
	movrgez	%l1,	%g2,	%l4
	edge8ln	%o3,	%i1,	%l3
	movcs	%xcc,	%g3,	%o7
	fmovrdgez	%g4,	%f4,	%f12
	sdiv	%i7,	0x14E2,	%g1
	sethi	0x0832,	%l6
	fmovdle	%icc,	%f13,	%f5
	fmovdle	%xcc,	%f31,	%f18
	ldd	[%l7 + 0x18],	%f28
	st	%f12,	[%l7 + 0x24]
	xorcc	%i6,	0x02F4,	%g5
	std	%f4,	[%l7 + 0x78]
	sllx	%o1,	0x1E,	%o2
	stb	%o5,	[%l7 + 0x10]
	move	%xcc,	%i0,	%l5
	fmovsle	%xcc,	%f9,	%f14
	sra	%i2,	0x1D,	%i3
	movvc	%icc,	%l2,	%i4
	movvs	%icc,	%o6,	%o0
	srl	%o4,	%i5,	%g6
	stx	%g7,	[%l7 + 0x30]
	sdiv	%l0,	0x04ED,	%g2
	movn	%icc,	%l4,	%l1
	orn	%o3,	%i1,	%l3
	array16	%g3,	%o7,	%g4
	mova	%xcc,	%i7,	%l6
	move	%icc,	%i6,	%g5
	fcmpne32	%f6,	%f16,	%g1
	sll	%o2,	%o1,	%i0
	movrne	%o5,	%l5,	%i3
	movcs	%icc,	%l2,	%i2
	subccc	%o6,	%i4,	%o4
	edge16ln	%o0,	%i5,	%g7
	fcmple32	%f30,	%f26,	%l0
	udivx	%g6,	0x0284,	%g2
	fmovrdgz	%l4,	%f12,	%f6
	mulscc	%o3,	%i1,	%l1
	fmul8sux16	%f4,	%f22,	%f6
	fmovrsgez	%g3,	%f5,	%f0
	movvs	%icc,	%o7,	%l3
	fmovrdne	%i7,	%f4,	%f14
	edge8	%g4,	%l6,	%g5
	sub	%g1,	0x0104,	%i6
	movrlz	%o1,	0x215,	%o2
	fmovscc	%xcc,	%f6,	%f24
	movleu	%icc,	%i0,	%l5
	edge8n	%o5,	%l2,	%i2
	movrgz	%o6,	%i4,	%o4
	sllx	%i3,	0x12,	%i5
	addcc	%g7,	%o0,	%g6
	fmovdg	%xcc,	%f29,	%f6
	ldsw	[%l7 + 0x14],	%l0
	alignaddr	%l4,	%o3,	%g2
	udivx	%l1,	0x02CA,	%i1
	fpadd16	%f8,	%f14,	%f20
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	sdiv	%o7,	0x1B10,	%g4
	movrne	%l6,	%g5,	%i7
	movneg	%icc,	%i6,	%o1
	mulx	%o2,	%g1,	%i0
	movcc	%icc,	%l5,	%l2
	fnors	%f7,	%f1,	%f23
	movneg	%icc,	%o5,	%o6
	movpos	%xcc,	%i2,	%o4
	sdivx	%i3,	0x1300,	%i4
	umulcc	%i5,	%g7,	%o0
	fmovrsgez	%g6,	%f30,	%f31
	save %l4, 0x1435, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g2,	0x0647,	%l1
	fnegd	%f28,	%f14
	sllx	%o3,	0x0D,	%i1
	movcc	%xcc,	%g3,	%l3
	edge16	%o7,	%l6,	%g4
	fsrc1s	%f19,	%f29
	subc	%g5,	%i7,	%o1
	ld	[%l7 + 0x3C],	%f23
	fcmpgt32	%f14,	%f0,	%i6
	fmovde	%icc,	%f2,	%f31
	move	%icc,	%g1,	%i0
	fmovsa	%xcc,	%f17,	%f30
	or	%l5,	0x1414,	%o2
	orn	%o5,	0x1B29,	%l2
	fcmps	%fcc0,	%f17,	%f27
	movvc	%xcc,	%i2,	%o4
	fmovrsgz	%i3,	%f2,	%f13
	orncc	%o6,	%i4,	%i5
	move	%xcc,	%o0,	%g6
	edge8n	%l4,	%g7,	%g2
	movre	%l0,	0x328,	%l1
	fmovsvs	%icc,	%f28,	%f2
	fmovd	%f24,	%f22
	edge16ln	%i1,	%g3,	%l3
	andcc	%o3,	0x01CD,	%l6
	orn	%o7,	0x1116,	%g5
	movn	%icc,	%i7,	%o1
	ldd	[%l7 + 0x18],	%g4
	array16	%i6,	%i0,	%g1
	fmovrdlz	%l5,	%f30,	%f26
	xor	%o5,	0x1BF9,	%l2
	or	%i2,	%o4,	%o2
	udivx	%o6,	0x0DCE,	%i4
	popc	0x0AAE,	%i3
	edge32	%o0,	%i5,	%l4
	fmovdg	%xcc,	%f0,	%f21
	movg	%icc,	%g6,	%g7
	ldd	[%l7 + 0x60],	%g2
	move	%icc,	%l1,	%l0
	sth	%i1,	[%l7 + 0x1C]
	fpadd16	%f12,	%f10,	%f12
	array16	%g3,	%o3,	%l6
	alignaddrl	%l3,	%g5,	%o7
	siam	0x1
	umulcc	%o1,	0x0624,	%g4
	andcc	%i6,	%i0,	%g1
	fandnot1s	%f10,	%f21,	%f7
	restore %i7, 0x0296, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l5,	0x168B,	%l2
	sth	%i2,	[%l7 + 0x52]
	fmovsl	%icc,	%f3,	%f12
	subc	%o2,	0x0303,	%o6
	fmovrdne	%o4,	%f24,	%f14
	fsrc1s	%f6,	%f9
	movrne	%i3,	0x201,	%i4
	addccc	%i5,	%l4,	%o0
	movpos	%icc,	%g6,	%g7
	faligndata	%f28,	%f30,	%f4
	fmovdneg	%icc,	%f31,	%f27
	movl	%xcc,	%g2,	%l0
	alignaddrl	%l1,	%i1,	%g3
	mulx	%l6,	0x034B,	%l3
	andcc	%o3,	0x1E07,	%g5
	mova	%xcc,	%o7,	%o1
	fmovdl	%icc,	%f30,	%f8
	xor	%i6,	%g4,	%i0
	movge	%icc,	%i7,	%g1
	andn	%l5,	%o5,	%l2
	movvs	%xcc,	%i2,	%o2
	stw	%o6,	[%l7 + 0x28]
	and	%o4,	0x1240,	%i3
	movne	%xcc,	%i5,	%l4
	movrlz	%i4,	%g6,	%o0
	fmovscs	%icc,	%f15,	%f0
	fmovsa	%xcc,	%f26,	%f0
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	edge16n	%l0,	%i1,	%g3
	array16	%l6,	%l3,	%l1
	fmovdleu	%icc,	%f12,	%f3
	std	%f22,	[%l7 + 0x20]
	fcmped	%fcc2,	%f2,	%f0
	orncc	%g5,	%o7,	%o3
	fxnors	%f10,	%f10,	%f0
	fpmerge	%f21,	%f17,	%f16
	fandnot1s	%f17,	%f8,	%f10
	movvs	%xcc,	%i6,	%g4
	orn	%o1,	0x0C6C,	%i0
	xnor	%g1,	%i7,	%l5
	ldub	[%l7 + 0x1B],	%l2
	array8	%o5,	%o2,	%o6
	fmovdleu	%icc,	%f19,	%f24
	sdivx	%i2,	0x1E25,	%i3
	xnor	%i5,	0x19E2,	%l4
	array8	%o4,	%g6,	%o0
	fmovrdgez	%i4,	%f14,	%f24
	nop
	set	0x62, %g1
	ldsb	[%l7 + %g1],	%g2
	array32	%g7,	%l0,	%g3
	fmovrdlz	%l6,	%f22,	%f16
	orcc	%l3,	0x18D8,	%l1
	fmovrdlz	%i1,	%f24,	%f22
	fpmerge	%f20,	%f9,	%f6
	fmovdleu	%xcc,	%f14,	%f30
	ldx	[%l7 + 0x18],	%g5
	nop
	set	0x12, %g3
	lduh	[%l7 + %g3],	%o3
	fmovs	%f27,	%f4
	fmovsge	%xcc,	%f2,	%f5
	ld	[%l7 + 0x78],	%f27
	std	%f24,	[%l7 + 0x48]
	popc	0x0D5D,	%i6
	ldsw	[%l7 + 0x3C],	%o7
	edge8n	%g4,	%o1,	%g1
	fmovsl	%icc,	%f21,	%f31
	movge	%xcc,	%i0,	%i7
	addcc	%l5,	0x0DC3,	%o5
	fcmpeq32	%f20,	%f18,	%l2
	fpadd32	%f12,	%f0,	%f28
	movg	%xcc,	%o6,	%o2
	array32	%i2,	%i5,	%l4
	movne	%xcc,	%o4,	%i3
	orn	%g6,	%i4,	%g2
	lduh	[%l7 + 0x50],	%o0
	ldub	[%l7 + 0x1C],	%g7
	umul	%g3,	%l6,	%l3
	movge	%xcc,	%l0,	%l1
	smulcc	%g5,	%i1,	%o3
	fpack32	%f16,	%f20,	%f8
	alignaddrl	%i6,	%g4,	%o7
	fmovdvs	%icc,	%f16,	%f18
	subcc	%o1,	0x1A6F,	%g1
	fmovdvs	%icc,	%f21,	%f19
	nop
	set	0x5F, %i1
	stb	%i7,	[%l7 + %i1]
	ldd	[%l7 + 0x38],	%l4
	sllx	%o5,	0x12,	%i0
	movvc	%xcc,	%l2,	%o2
	udivx	%i2,	0x086C,	%o6
	udiv	%i5,	0x14BF,	%o4
	movg	%xcc,	%l4,	%g6
	movge	%icc,	%i4,	%i3
	sllx	%o0,	%g2,	%g3
	sir	0x0201
	fmuld8ulx16	%f15,	%f29,	%f2
	fcmpne32	%f22,	%f24,	%g7
	fzero	%f10
	sub	%l6,	%l3,	%l1
	ldd	[%l7 + 0x58],	%f28
	edge16n	%g5,	%l0,	%i1
	fmovse	%icc,	%f7,	%f7
	pdist	%f30,	%f30,	%f24
	xnor	%o3,	%i6,	%o7
	nop
	set	0x1A, %o7
	sth	%o1,	[%l7 + %o7]
	fornot1s	%f12,	%f22,	%f7
	mova	%icc,	%g1,	%i7
	fabss	%f15,	%f13
	edge8ln	%l5,	%o5,	%i0
	orn	%l2,	%g4,	%o2
	lduh	[%l7 + 0x78],	%o6
	movle	%icc,	%i5,	%i2
	add	%o4,	%l4,	%i4
	fmovscs	%xcc,	%f10,	%f16
	save %g6, 0x0209, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%xcc,	%f21,	%f17
	umul	%i3,	%g2,	%g7
	movre	%l6,	%l3,	%l1
	movrlez	%g5,	%l0,	%i1
	movvc	%icc,	%g3,	%o3
	edge16l	%i6,	%o1,	%o7
	sll	%g1,	%i7,	%o5
	udivcc	%l5,	0x07A7,	%l2
	fmul8ulx16	%f28,	%f0,	%f4
	orncc	%i0,	0x0487,	%o2
	move	%icc,	%o6,	%i5
	save %i2, 0x078C, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l4, 0x1F06, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g6,	%g4,	%o0
	xnorcc	%g2,	%g7,	%l6
	fmovrsgz	%i3,	%f20,	%f10
	std	%f10,	[%l7 + 0x20]
	ldub	[%l7 + 0x1C],	%l1
	edge32n	%g5,	%l3,	%l0
	fxor	%f28,	%f24,	%f22
	ldsh	[%l7 + 0x3E],	%i1
	st	%f4,	[%l7 + 0x3C]
	fxnor	%f10,	%f18,	%f2
	fsrc2s	%f19,	%f10
	fmovscs	%xcc,	%f1,	%f24
	lduw	[%l7 + 0x24],	%o3
	mulscc	%g3,	0x1475,	%i6
	movre	%o1,	0x205,	%g1
	nop
	set	0x36, %o2
	ldsh	[%l7 + %o2],	%i7
	orncc	%o7,	0x1199,	%o5
	fmovdne	%xcc,	%f10,	%f17
	fmovdl	%icc,	%f21,	%f10
	mulx	%l5,	%l2,	%o2
	or	%o6,	%i0,	%i2
	edge16l	%o4,	%i5,	%i4
	sdivx	%l4,	0x16AE,	%g4
	movrlez	%g6,	%g2,	%g7
	sll	%l6,	0x0D,	%o0
	fmovrdne	%l1,	%f30,	%f16
	sll	%i3,	%g5,	%l0
	smul	%l3,	%o3,	%g3
	movleu	%icc,	%i1,	%i6
	edge8ln	%o1,	%i7,	%o7
	smulcc	%o5,	0x09E8,	%l5
	fpsub32s	%f19,	%f31,	%f8
	and	%l2,	%o2,	%o6
	subcc	%g1,	%i0,	%o4
	fxors	%f15,	%f23,	%f29
	subcc	%i5,	%i2,	%l4
	fpsub32	%f4,	%f6,	%f14
	movleu	%xcc,	%i4,	%g4
	fnands	%f15,	%f27,	%f0
	xor	%g2,	%g6,	%g7
	fpadd32s	%f9,	%f24,	%f19
	movcs	%xcc,	%l6,	%l1
	edge8	%o0,	%g5,	%l0
	fcmped	%fcc0,	%f20,	%f14
	subcc	%i3,	0x1B61,	%o3
	edge16ln	%g3,	%i1,	%l3
	movne	%xcc,	%o1,	%i6
	fornot2s	%f23,	%f15,	%f24
	movle	%xcc,	%i7,	%o5
	movpos	%icc,	%o7,	%l2
	edge32	%o2,	%l5,	%g1
	orncc	%o6,	%i0,	%i5
	subccc	%o4,	%l4,	%i4
	smulcc	%i2,	%g2,	%g6
	fmovscc	%icc,	%f7,	%f6
	xnor	%g7,	%l6,	%l1
	sth	%g4,	[%l7 + 0x24]
	array32	%g5,	%o0,	%l0
	srax	%i3,	0x19,	%g3
	fmovdpos	%icc,	%f6,	%f20
	bshuffle	%f24,	%f10,	%f22
	ldub	[%l7 + 0x2E],	%i1
	sra	%o3,	%o1,	%l3
	edge16l	%i7,	%o5,	%o7
	movrne	%l2,	%i6,	%o2
	subc	%l5,	0x1857,	%g1
	edge16l	%o6,	%i0,	%i5
	edge16l	%o4,	%i4,	%i2
	sll	%l4,	0x11,	%g6
	andn	%g7,	0x0E5F,	%l6
	fmovdvc	%icc,	%f13,	%f10
	fpsub16	%f20,	%f0,	%f4
	addccc	%g2,	0x1F82,	%g4
	movvs	%icc,	%g5,	%l1
	sra	%l0,	%i3,	%g3
	subc	%o0,	0x115B,	%i1
	movne	%xcc,	%o3,	%o1
	fpackfix	%f20,	%f12
	movcs	%xcc,	%i7,	%o5
	edge32	%l3,	%l2,	%i6
	ldx	[%l7 + 0x08],	%o7
	array32	%o2,	%g1,	%o6
	edge32l	%l5,	%i0,	%o4
	fabss	%f15,	%f0
	movgu	%xcc,	%i4,	%i2
	smulcc	%l4,	0x0EE7,	%i5
	movl	%xcc,	%g6,	%g7
	fmovscc	%xcc,	%f6,	%f21
	subcc	%l6,	%g2,	%g4
	movrlez	%g5,	%l1,	%i3
	stb	%g3,	[%l7 + 0x2A]
	save %l0, 0x0F50, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x08],	%f12
	sub	%o3,	%o1,	%i7
	sdivx	%o0,	0x0380,	%o5
	edge8l	%l2,	%i6,	%o7
	movne	%xcc,	%o2,	%g1
	movn	%xcc,	%o6,	%l3
	fmovdleu	%xcc,	%f17,	%f3
	movge	%icc,	%l5,	%i0
	sth	%o4,	[%l7 + 0x42]
	nop
	set	0x2C, %g5
	stb	%i4,	[%l7 + %g5]
	fpsub32s	%f15,	%f23,	%f22
	or	%l4,	%i5,	%g6
	movre	%g7,	0x23D,	%l6
	mova	%xcc,	%g2,	%i2
	fmul8x16au	%f7,	%f29,	%f4
	fandnot1s	%f13,	%f5,	%f25
	sdivcc	%g5,	0x0FA0,	%l1
	sth	%g4,	[%l7 + 0x34]
	ld	[%l7 + 0x2C],	%f24
	movcc	%xcc,	%g3,	%i3
	array8	%i1,	%l0,	%o3
	fmovrsgez	%o1,	%f11,	%f12
	subccc	%i7,	%o5,	%l2
	edge8ln	%i6,	%o7,	%o2
	edge8	%g1,	%o0,	%o6
	movge	%xcc,	%l5,	%i0
	xor	%o4,	0x1639,	%l3
	sth	%l4,	[%l7 + 0x60]
	ldd	[%l7 + 0x60],	%i4
	array8	%i5,	%g7,	%l6
	movcc	%xcc,	%g2,	%g6
	sub	%g5,	%l1,	%g4
	orn	%i2,	%g3,	%i1
	array32	%i3,	%l0,	%o3
	movn	%icc,	%o1,	%i7
	edge8l	%o5,	%i6,	%o7
	nop
	set	0x14, %i3
	lduh	[%l7 + %i3],	%o2
	sub	%g1,	0x1FE2,	%l2
	ldx	[%l7 + 0x50],	%o6
	ld	[%l7 + 0x70],	%f20
	movne	%xcc,	%o0,	%i0
	std	%f26,	[%l7 + 0x48]
	addcc	%l5,	%l3,	%o4
	movrlez	%i4,	%i5,	%l4
	edge8n	%l6,	%g7,	%g6
	fmul8sux16	%f6,	%f30,	%f4
	subcc	%g5,	%g2,	%l1
	edge16l	%i2,	%g4,	%i1
	fpadd32s	%f30,	%f20,	%f9
	xor	%g3,	0x1E5E,	%l0
	ldd	[%l7 + 0x28],	%o2
	sth	%o1,	[%l7 + 0x44]
	st	%f29,	[%l7 + 0x20]
	sdivx	%i3,	0x014C,	%i7
	ldub	[%l7 + 0x36],	%i6
	alignaddr	%o7,	%o2,	%g1
	srl	%o5,	0x12,	%l2
	mulx	%o6,	0x14FF,	%i0
	fmovsneg	%icc,	%f21,	%f15
	ldd	[%l7 + 0x58],	%f18
	fmovdvs	%xcc,	%f9,	%f19
	lduw	[%l7 + 0x08],	%l5
	orncc	%l3,	0x0DF8,	%o0
	ldd	[%l7 + 0x08],	%i4
	fmovrsne	%o4,	%f25,	%f25
	sdivx	%i5,	0x0083,	%l6
	fandnot1	%f28,	%f24,	%f30
	sir	0x11B6
	move	%icc,	%l4,	%g6
	sllx	%g5,	0x13,	%g2
	std	%f18,	[%l7 + 0x68]
	move	%icc,	%g7,	%l1
	ldsw	[%l7 + 0x74],	%g4
	sra	%i2,	0x18,	%g3
	edge32ln	%i1,	%o3,	%l0
	or	%i3,	0x0168,	%i7
	edge32	%o1,	%o7,	%i6
	andn	%o2,	0x09AB,	%g1
	movcc	%icc,	%l2,	%o6
	sir	0x099F
	fpsub16	%f20,	%f26,	%f28
	movvs	%icc,	%i0,	%o5
	movleu	%icc,	%l3,	%o0
	movgu	%xcc,	%i4,	%l5
	add	%i5,	%l6,	%o4
	fmovdge	%icc,	%f8,	%f20
	ld	[%l7 + 0x28],	%f0
	orncc	%l4,	%g5,	%g6
	udivx	%g2,	0x0884,	%g7
	st	%f12,	[%l7 + 0x28]
	movge	%icc,	%l1,	%g4
	sth	%g3,	[%l7 + 0x16]
	movrgez	%i1,	%i2,	%o3
	movrne	%i3,	%l0,	%i7
	movgu	%icc,	%o1,	%o7
	or	%o2,	%g1,	%l2
	movne	%icc,	%o6,	%i0
	st	%f0,	[%l7 + 0x60]
	movge	%xcc,	%i6,	%o5
	movcs	%xcc,	%o0,	%l3
	fmovscs	%xcc,	%f9,	%f20
	fcmple16	%f6,	%f6,	%l5
	edge8	%i4,	%i5,	%l6
	sub	%o4,	%l4,	%g6
	sra	%g2,	%g7,	%l1
	sethi	0x1BEF,	%g5
	srlx	%g3,	%i1,	%g4
	fmovrdlz	%i2,	%f12,	%f30
	mulscc	%o3,	0x0BC3,	%l0
	edge8n	%i7,	%i3,	%o1
	fcmpne32	%f4,	%f6,	%o7
	array16	%g1,	%l2,	%o6
	addc	%o2,	%i0,	%o5
	mulx	%o0,	0x0382,	%i6
	edge32l	%l3,	%l5,	%i5
	udivx	%l6,	0x1BB1,	%i4
	fnands	%f26,	%f11,	%f28
	sra	%l4,	%g6,	%g2
	movn	%icc,	%g7,	%o4
	movvs	%xcc,	%l1,	%g5
	fmovrde	%i1,	%f22,	%f24
	addc	%g4,	%i2,	%g3
	srl	%o3,	0x06,	%l0
	bshuffle	%f22,	%f28,	%f24
	movgu	%xcc,	%i3,	%i7
	fmovscc	%icc,	%f30,	%f11
	ldub	[%l7 + 0x09],	%o1
	fmovspos	%xcc,	%f18,	%f23
	srax	%g1,	0x0B,	%l2
	stw	%o6,	[%l7 + 0x1C]
	fsrc2s	%f0,	%f16
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%f28
	srlx	%o2,	0x0E,	%o7
	fands	%f23,	%f14,	%f25
	stw	%i0,	[%l7 + 0x7C]
	fmovdl	%xcc,	%f13,	%f28
	sllx	%o0,	%o5,	%l3
	smulcc	%i6,	0x01C3,	%i5
	or	%l5,	0x1104,	%l6
	fmovsne	%xcc,	%f27,	%f20
	alignaddr	%i4,	%g6,	%g2
	movge	%icc,	%g7,	%o4
	fmovsle	%xcc,	%f18,	%f8
	movgu	%icc,	%l1,	%g5
	sll	%i1,	%g4,	%l4
	movre	%g3,	0x0F7,	%i2
	sdiv	%o3,	0x1959,	%i3
	fnot2	%f30,	%f4
	sdiv	%i7,	0x1DA0,	%o1
	fmul8x16al	%f13,	%f18,	%f4
	addc	%l0,	%g1,	%o6
	movge	%icc,	%o2,	%o7
	movle	%icc,	%i0,	%o0
	sdivx	%o5,	0x1B24,	%l3
	ldsw	[%l7 + 0x40],	%l2
	std	%f6,	[%l7 + 0x60]
	nop
	set	0x70, %l2
	sth	%i5,	[%l7 + %l2]
	stx	%i6,	[%l7 + 0x18]
	fnot2s	%f25,	%f18
	xorcc	%l5,	%l6,	%g6
	edge8n	%i4,	%g2,	%o4
	sdiv	%g7,	0x1A26,	%l1
	xnor	%g5,	0x1E5A,	%g4
	subc	%l4,	0x139B,	%g3
	subcc	%i1,	%i2,	%o3
	fmovrslz	%i3,	%f10,	%f11
	sll	%o1,	%l0,	%i7
	udiv	%o6,	0x1216,	%o2
	movcc	%icc,	%o7,	%g1
	stx	%i0,	[%l7 + 0x78]
	edge8l	%o5,	%o0,	%l3
	for	%f0,	%f8,	%f22
	faligndata	%f26,	%f20,	%f12
	sdivcc	%i5,	0x1F61,	%i6
	sdivcc	%l2,	0x13F0,	%l6
	addc	%g6,	%i4,	%g2
	ldsh	[%l7 + 0x7A],	%o4
	movpos	%xcc,	%g7,	%l5
	subcc	%l1,	0x0C6F,	%g5
	edge32l	%l4,	%g4,	%i1
	edge16	%g3,	%o3,	%i3
	fmovrse	%i2,	%f20,	%f26
	movrgz	%o1,	%l0,	%o6
	orcc	%o2,	0x1F3C,	%o7
	fmovse	%xcc,	%f22,	%f4
	movrne	%g1,	%i0,	%o5
	edge16ln	%i7,	%l3,	%o0
	fcmped	%fcc0,	%f2,	%f16
	edge8	%i5,	%l2,	%i6
	std	%f4,	[%l7 + 0x28]
	ldd	[%l7 + 0x60],	%g6
	ldx	[%l7 + 0x30],	%i4
	subc	%l6,	0x0B5B,	%g2
	movge	%xcc,	%g7,	%l5
	movrne	%l1,	%g5,	%l4
	sir	0x196E
	edge16n	%g4,	%i1,	%g3
	fmovrde	%o4,	%f2,	%f14
	fmovdleu	%icc,	%f30,	%f2
	array16	%i3,	%i2,	%o3
	umul	%o1,	%l0,	%o6
	movpos	%icc,	%o2,	%g1
	movre	%o7,	0x38E,	%o5
	sllx	%i7,	0x02,	%i0
	save %o0, 0x18E7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l3,	%l2,	%i6
	movrgz	%i4,	0x14B,	%l6
	umul	%g2,	%g7,	%g6
	movrgz	%l5,	0x1DE,	%l1
	sth	%l4,	[%l7 + 0x18]
	sdivx	%g5,	0x146A,	%i1
	xor	%g4,	0x07B3,	%o4
	array32	%g3,	%i2,	%o3
	fpsub16s	%f7,	%f5,	%f5
	movpos	%xcc,	%i3,	%l0
	ldsw	[%l7 + 0x7C],	%o6
	movrlez	%o1,	%o2,	%g1
	movgu	%xcc,	%o7,	%o5
	fmovsne	%icc,	%f29,	%f28
	sub	%i7,	%i0,	%o0
	edge8l	%l3,	%l2,	%i5
	add	%i4,	%i6,	%g2
	stw	%l6,	[%l7 + 0x08]
	movleu	%icc,	%g6,	%g7
	sdivx	%l5,	0x06BC,	%l4
	orcc	%l1,	%i1,	%g5
	ldub	[%l7 + 0x49],	%g4
	movne	%icc,	%o4,	%i2
	orcc	%g3,	%o3,	%i3
	fmovdl	%icc,	%f30,	%f30
	popc	0x0CF7,	%l0
	subc	%o1,	%o2,	%o6
	restore %g1, 0x150D, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o7,	%i0,	%i7
	fpack32	%f14,	%f6,	%f20
	sth	%o0,	[%l7 + 0x68]
	movcc	%xcc,	%l3,	%l2
	alignaddrl	%i5,	%i6,	%i4
	movvc	%xcc,	%l6,	%g2
	srax	%g6,	%l5,	%l4
	fcmpeq32	%f4,	%f30,	%l1
	move	%xcc,	%g7,	%g5
	edge16ln	%i1,	%o4,	%i2
	movgu	%icc,	%g3,	%o3
	edge16l	%g4,	%l0,	%o1
	movrgez	%o2,	%i3,	%g1
	fcmpne32	%f6,	%f10,	%o6
	movvc	%icc,	%o5,	%i0
	umul	%i7,	%o7,	%o0
	mulscc	%l2,	%i5,	%l3
	fnot1s	%f3,	%f29
	fmovsvc	%xcc,	%f24,	%f22
	movrlez	%i6,	0x384,	%i4
	movrlez	%l6,	%g6,	%g2
	andncc	%l5,	%l1,	%l4
	umul	%g5,	0x10AD,	%i1
	fmovdcc	%xcc,	%f6,	%f1
	ldub	[%l7 + 0x4A],	%o4
	fmuld8sux16	%f4,	%f29,	%f30
	movpos	%icc,	%g7,	%i2
	edge8l	%o3,	%g3,	%l0
	alignaddrl	%o1,	%g4,	%o2
	fornot1s	%f18,	%f0,	%f0
	andcc	%g1,	0x1D9D,	%o6
	edge8	%o5,	%i0,	%i7
	edge32	%i3,	%o0,	%o7
	udivcc	%l2,	0x17C1,	%i5
	stx	%l3,	[%l7 + 0x28]
	fmovsn	%xcc,	%f13,	%f24
	mulscc	%i4,	%l6,	%g6
	fmovd	%f26,	%f14
	fcmpes	%fcc1,	%f7,	%f27
	fxors	%f15,	%f1,	%f27
	edge8	%i6,	%l5,	%l1
	fnot1	%f0,	%f28
	edge16	%l4,	%g5,	%i1
	sll	%g2,	%o4,	%g7
	xnor	%i2,	%g3,	%o3
	edge8n	%o1,	%g4,	%l0
	xor	%o2,	0x0741,	%o6
	fmovdcc	%xcc,	%f29,	%f6
	movneg	%icc,	%g1,	%o5
	sth	%i7,	[%l7 + 0x7C]
	edge16ln	%i3,	%o0,	%i0
	fmovdl	%icc,	%f24,	%f19
	fabsd	%f0,	%f22
	mova	%xcc,	%o7,	%i5
	move	%icc,	%l2,	%l3
	edge8	%l6,	%g6,	%i4
	udivcc	%i6,	0x0F94,	%l5
	edge16	%l4,	%g5,	%l1
	edge16	%i1,	%g2,	%g7
	ldsb	[%l7 + 0x73],	%o4
	movrlz	%g3,	%i2,	%o1
	edge16l	%o3,	%l0,	%o2
	movne	%icc,	%g4,	%o6
	fors	%f22,	%f20,	%f29
	ldub	[%l7 + 0x79],	%o5
	movneg	%icc,	%i7,	%i3
	edge8l	%g1,	%i0,	%o0
	smul	%i5,	0x03AC,	%l2
	umul	%o7,	%l6,	%l3
	movneg	%icc,	%g6,	%i6
	fmuld8sux16	%f6,	%f21,	%f18
	subc	%i4,	0x1DD9,	%l4
	umulcc	%g5,	0x1667,	%l5
	pdist	%f14,	%f22,	%f18
	sdivx	%l1,	0x0846,	%g2
	srl	%g7,	%i1,	%g3
	movge	%xcc,	%i2,	%o4
	nop
	set	0x18, %l1
	std	%f26,	[%l7 + %l1]
	edge8n	%o1,	%o3,	%l0
	movrne	%g4,	%o2,	%o6
	movneg	%xcc,	%o5,	%i7
	andcc	%g1,	%i0,	%i3
	mulscc	%o0,	0x13A5,	%l2
	movrne	%i5,	%o7,	%l3
	udiv	%g6,	0x0320,	%i6
	movvc	%icc,	%l6,	%i4
	fmovdn	%xcc,	%f24,	%f19
	subccc	%l4,	%g5,	%l5
	save %l1, 0x1D1A, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i1,	[%l7 + 0x57]
	movleu	%xcc,	%g7,	%g3
	fmul8sux16	%f6,	%f20,	%f26
	addccc	%o4,	0x09EA,	%o1
	ldsb	[%l7 + 0x08],	%o3
	fpmerge	%f23,	%f30,	%f28
	fmovdgu	%xcc,	%f14,	%f25
	umul	%l0,	0x036A,	%i2
	udivx	%o2,	0x1217,	%o6
	movrgz	%g4,	%i7,	%g1
	edge16n	%o5,	%i0,	%o0
	ldsb	[%l7 + 0x7C],	%i3
	edge16n	%l2,	%i5,	%o7
	movcc	%icc,	%l3,	%i6
	addccc	%l6,	0x0880,	%g6
	edge32n	%i4,	%g5,	%l4
	movrlez	%l1,	0x0D3,	%l5
	umul	%i1,	0x09D2,	%g2
	edge8l	%g3,	%o4,	%g7
	fmovsle	%icc,	%f25,	%f23
	alignaddrl	%o3,	%o1,	%l0
	edge32l	%i2,	%o2,	%o6
	movrgez	%i7,	%g4,	%g1
	edge8l	%i0,	%o0,	%o5
	movle	%xcc,	%l2,	%i3
	fmovsa	%xcc,	%f19,	%f1
	sllx	%o7,	%i5,	%l3
	alignaddrl	%l6,	%i6,	%i4
	fnot1	%f26,	%f28
	sdivx	%g6,	0x0C2C,	%g5
	fnot2	%f22,	%f12
	stb	%l4,	[%l7 + 0x65]
	movvc	%icc,	%l5,	%l1
	movcs	%icc,	%i1,	%g3
	srax	%g2,	0x1E,	%g7
	stb	%o4,	[%l7 + 0x16]
	sllx	%o3,	0x05,	%o1
	ldd	[%l7 + 0x38],	%l0
	fmovdge	%xcc,	%f2,	%f9
	movne	%xcc,	%i2,	%o2
	stw	%o6,	[%l7 + 0x34]
	xor	%i7,	0x1271,	%g4
	lduh	[%l7 + 0x2E],	%i0
	srax	%g1,	%o5,	%o0
	ldx	[%l7 + 0x08],	%l2
	or	%o7,	%i5,	%l3
	ldsb	[%l7 + 0x63],	%l6
	fmovdcs	%icc,	%f25,	%f26
	movle	%icc,	%i3,	%i6
	edge16ln	%g6,	%i4,	%l4
	ldsb	[%l7 + 0x2B],	%l5
	fmovrdgz	%g5,	%f30,	%f20
	srax	%i1,	%g3,	%l1
	ldsb	[%l7 + 0x2E],	%g7
	fmovrdne	%o4,	%f24,	%f30
	alignaddr	%g2,	%o3,	%l0
	edge8l	%o1,	%o2,	%o6
	sdivx	%i2,	0x074C,	%i7
	fzero	%f28
	movn	%icc,	%g4,	%g1
	fandnot2	%f0,	%f26,	%f2
	umul	%o5,	%i0,	%l2
	stb	%o7,	[%l7 + 0x4E]
	edge32l	%i5,	%l3,	%o0
	movrne	%l6,	0x11E,	%i3
	smulcc	%g6,	%i6,	%i4
	sub	%l4,	0x1913,	%g5
	popc	%i1,	%g3
	array32	%l5,	%l1,	%o4
	ldd	[%l7 + 0x40],	%g2
	fmovrslz	%g7,	%f29,	%f17
	fmovdgu	%xcc,	%f12,	%f26
	lduw	[%l7 + 0x54],	%o3
	stw	%o1,	[%l7 + 0x0C]
	fmovsgu	%xcc,	%f20,	%f7
	mulx	%l0,	0x01EF,	%o6
	fornot1	%f4,	%f26,	%f26
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	udivx	%g4,	0x1A65,	%o2
	ldub	[%l7 + 0x45],	%o5
	fpadd16	%f4,	%f12,	%f4
	sra	%g1,	0x1F,	%l2
	sra	%o7,	%i0,	%l3
	movre	%i5,	0x2AC,	%l6
	fmovrdgez	%o0,	%f0,	%f0
	ldsh	[%l7 + 0x3A],	%g6
	fpack32	%f10,	%f6,	%f28
	sdiv	%i6,	0x03FB,	%i3
	alignaddrl	%i4,	%g5,	%i1
	sth	%g3,	[%l7 + 0x46]
	std	%f2,	[%l7 + 0x70]
	udivx	%l5,	0x025B,	%l1
	fmovdne	%icc,	%f29,	%f31
	orncc	%l4,	%g2,	%o4
	ldd	[%l7 + 0x10],	%f4
	or	%o3,	%g7,	%o1
	fxors	%f6,	%f5,	%f25
	subc	%l0,	0x1CA7,	%i2
	for	%f4,	%f22,	%f14
	stb	%o6,	[%l7 + 0x4D]
	srl	%g4,	%i7,	%o5
	fmovsvs	%icc,	%f31,	%f20
	movrne	%o2,	0x220,	%g1
	movvs	%xcc,	%l2,	%o7
	sub	%l3,	0x15B9,	%i0
	ldsb	[%l7 + 0x78],	%l6
	movrgz	%o0,	%i5,	%i6
	sllx	%g6,	0x1F,	%i3
	mova	%xcc,	%g5,	%i1
	sub	%i4,	%g3,	%l1
	ldsw	[%l7 + 0x7C],	%l5
	fzero	%f8
	movrlez	%l4,	0x319,	%o4
	lduh	[%l7 + 0x3A],	%o3
	siam	0x5
	addcc	%g2,	%o1,	%l0
	movrlez	%g7,	0x331,	%i2
	fsrc2	%f30,	%f10
	sll	%o6,	0x0B,	%g4
	movgu	%xcc,	%o5,	%o2
	umul	%g1,	0x0CFC,	%i7
	mulscc	%o7,	%l2,	%i0
	array8	%l3,	%o0,	%l6
	fmovde	%xcc,	%f25,	%f13
	movcc	%xcc,	%i6,	%i5
	mulscc	%g6,	0x1CB6,	%i3
	movcc	%icc,	%g5,	%i4
	sra	%g3,	%l1,	%i1
	fsrc2s	%f13,	%f22
	lduw	[%l7 + 0x64],	%l5
	and	%o4,	0x143D,	%o3
	fmovsle	%xcc,	%f12,	%f15
	fmovdn	%xcc,	%f0,	%f22
	smul	%g2,	0x19D5,	%o1
	alignaddrl	%l0,	%l4,	%i2
	umulcc	%g7,	%o6,	%o5
	fpackfix	%f0,	%f23
	movrlez	%o2,	%g4,	%i7
	fmovsg	%icc,	%f7,	%f26
	movvc	%xcc,	%g1,	%o7
	alignaddr	%i0,	%l2,	%o0
	edge8l	%l3,	%l6,	%i6
	for	%f22,	%f18,	%f8
	andn	%i5,	%i3,	%g5
	array16	%i4,	%g6,	%g3
	sethi	0x0D59,	%l1
	edge16	%l5,	%i1,	%o3
	fcmpne16	%f20,	%f28,	%o4
	sth	%g2,	[%l7 + 0x26]
	fmovsne	%icc,	%f10,	%f20
	movcs	%xcc,	%o1,	%l0
	orn	%i2,	0x1724,	%g7
	fpack16	%f30,	%f3
	edge16	%o6,	%l4,	%o2
	stx	%g4,	[%l7 + 0x30]
	sra	%o5,	%i7,	%g1
	sra	%o7,	0x13,	%l2
	fmovse	%icc,	%f22,	%f7
	addccc	%i0,	0x1712,	%o0
	sth	%l6,	[%l7 + 0x5E]
	lduw	[%l7 + 0x58],	%l3
	fpsub32	%f22,	%f10,	%f12
	lduh	[%l7 + 0x5C],	%i5
	ldd	[%l7 + 0x18],	%i6
	mulscc	%g5,	0x1335,	%i3
	st	%f12,	[%l7 + 0x6C]
	fpackfix	%f16,	%f25
	nop
	set	0x18, %o0
	sth	%g6,	[%l7 + %o0]
	movrlez	%g3,	0x371,	%l1
	movle	%xcc,	%i4,	%l5
	movrgz	%o3,	0x19E,	%i1
	fmovrdne	%g2,	%f30,	%f28
	edge16	%o1,	%o4,	%l0
	andn	%g7,	%i2,	%l4
	smulcc	%o6,	%g4,	%o2
	fmovsne	%icc,	%f21,	%f1
	mulscc	%o5,	0x09FB,	%g1
	fmovdcs	%xcc,	%f21,	%f15
	sth	%i7,	[%l7 + 0x70]
	udivx	%l2,	0x0AA8,	%i0
	subcc	%o0,	%l6,	%l3
	sth	%i5,	[%l7 + 0x7E]
	fmul8ulx16	%f26,	%f28,	%f28
	orncc	%o7,	0x09F7,	%g5
	addc	%i3,	0x0C12,	%g6
	ldsh	[%l7 + 0x74],	%g3
	fxnors	%f13,	%f23,	%f13
	andcc	%i6,	0x052E,	%l1
	movrne	%i4,	0x3AC,	%l5
	edge8ln	%i1,	%o3,	%o1
	andcc	%o4,	0x1057,	%l0
	xor	%g7,	0x196A,	%i2
	xorcc	%l4,	0x1E57,	%g2
	edge8	%o6,	%g4,	%o5
	fmovdneg	%icc,	%f25,	%f5
	fcmple32	%f22,	%f0,	%g1
	fpadd16s	%f31,	%f12,	%f23
	xor	%o2,	%l2,	%i0
	xnor	%i7,	%o0,	%l3
	movleu	%xcc,	%l6,	%i5
	udivcc	%o7,	0x0739,	%i3
	stw	%g6,	[%l7 + 0x64]
	fmovrdgez	%g3,	%f20,	%f28
	stw	%i6,	[%l7 + 0x0C]
	movrlez	%g5,	0x2C9,	%i4
	fornot1	%f6,	%f4,	%f18
	ld	[%l7 + 0x3C],	%f29
	sllx	%l1,	0x0E,	%i1
	fnot1	%f18,	%f20
	fsrc2	%f12,	%f8
	fmovsl	%xcc,	%f17,	%f17
	srl	%o3,	%o1,	%o4
	restore %l0, 0x0A2A, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i2,	0x0C31,	%l5
	fcmpne16	%f22,	%f30,	%l4
	fpadd16s	%f30,	%f13,	%f19
	st	%f31,	[%l7 + 0x70]
	edge32l	%g2,	%o6,	%o5
	or	%g4,	%o2,	%l2
	movrlez	%g1,	0x06C,	%i0
	xorcc	%o0,	0x1B80,	%l3
	movpos	%icc,	%i7,	%i5
	edge16n	%o7,	%i3,	%g6
	movle	%icc,	%l6,	%i6
	st	%f30,	[%l7 + 0x34]
	andn	%g5,	0x15B7,	%g3
	sdivx	%l1,	0x1B70,	%i4
	srax	%o3,	%i1,	%o1
	edge32l	%l0,	%o4,	%i2
	fones	%f27
	addcc	%l5,	%g7,	%l4
	movneg	%icc,	%o6,	%g2
	mulscc	%g4,	%o5,	%l2
	fmovsle	%xcc,	%f17,	%f14
	fpackfix	%f6,	%f29
	movrlez	%o2,	%g1,	%i0
	pdist	%f14,	%f28,	%f2
	fornot1s	%f30,	%f25,	%f19
	edge32n	%l3,	%i7,	%o0
	ldsw	[%l7 + 0x1C],	%o7
	fnors	%f14,	%f19,	%f23
	mulscc	%i5,	%g6,	%l6
	subccc	%i6,	0x03C7,	%g5
	ldsh	[%l7 + 0x6E],	%g3
	add	%l1,	%i4,	%o3
	fxor	%f18,	%f24,	%f30
	movge	%xcc,	%i3,	%o1
	fmovdleu	%xcc,	%f11,	%f22
	srax	%l0,	0x12,	%i1
	ldx	[%l7 + 0x20],	%o4
	andcc	%i2,	0x0F2C,	%g7
	movrlz	%l4,	0x1E6,	%o6
	sir	0x043A
	edge8l	%g2,	%l5,	%g4
	fmovdne	%icc,	%f29,	%f18
	or	%o5,	0x1F8E,	%l2
	movne	%icc,	%o2,	%g1
	sdiv	%l3,	0x006E,	%i7
	movrlez	%i0,	%o7,	%o0
	movrne	%g6,	%l6,	%i5
	udiv	%g5,	0x0565,	%g3
	movn	%icc,	%l1,	%i4
	fxor	%f30,	%f20,	%f12
	fors	%f22,	%f14,	%f17
	nop
	set	0x7A, %o4
	ldsb	[%l7 + %o4],	%i6
	subc	%i3,	0x1CA8,	%o1
	ldx	[%l7 + 0x70],	%l0
	edge8ln	%o3,	%i1,	%i2
	smulcc	%g7,	0x0C04,	%l4
	nop
	set	0x46, %g4
	lduh	[%l7 + %g4],	%o6
	popc	0x0D4B,	%o4
	movpos	%icc,	%g2,	%l5
	movge	%xcc,	%o5,	%g4
	lduh	[%l7 + 0x5C],	%l2
	edge32n	%g1,	%o2,	%l3
	udivx	%i7,	0x1808,	%i0
	movg	%icc,	%o0,	%o7
	sll	%l6,	0x1E,	%g6
	fpsub32s	%f22,	%f31,	%f13
	sra	%g5,	%g3,	%i5
	sir	0x1C24
	edge16l	%i4,	%l1,	%i6
	movre	%o1,	0x157,	%i3
	movre	%l0,	%i1,	%o3
	popc	0x06C3,	%g7
	subc	%i2,	%l4,	%o4
	ldx	[%l7 + 0x30],	%o6
	mulscc	%g2,	0x12D3,	%l5
	std	%f2,	[%l7 + 0x50]
	sdivx	%g4,	0x0498,	%l2
	fmovrde	%g1,	%f6,	%f22
	ldd	[%l7 + 0x50],	%f28
	std	%f30,	[%l7 + 0x70]
	fmovrsgez	%o5,	%f17,	%f16
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	array32	%i0,	%o7,	%l6
	ldsb	[%l7 + 0x63],	%o0
	fone	%f18
	stb	%g6,	[%l7 + 0x4F]
	fcmpne32	%f10,	%f30,	%g5
	movge	%icc,	%g3,	%i5
	restore %i4, 0x0EEC, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o1,	0x07,	%i6
	fcmpgt16	%f2,	%f22,	%i3
	movcs	%xcc,	%i1,	%l0
	ldd	[%l7 + 0x20],	%o2
	movpos	%icc,	%g7,	%i2
	movre	%l4,	%o4,	%o6
	movge	%icc,	%l5,	%g4
	subccc	%g2,	%g1,	%l2
	alignaddrl	%o2,	%o5,	%l3
	andcc	%i0,	%i7,	%o7
	edge32n	%o0,	%g6,	%l6
	fpsub32s	%f1,	%f19,	%f2
	udiv	%g3,	0x09EF,	%g5
	andncc	%i4,	%i5,	%o1
	ld	[%l7 + 0x0C],	%f31
	movge	%xcc,	%i6,	%i3
	ldx	[%l7 + 0x38],	%l1
	movrgez	%i1,	0x008,	%l0
	xnorcc	%g7,	%i2,	%o3
	fpadd16s	%f31,	%f22,	%f21
	edge8ln	%o4,	%o6,	%l5
	xorcc	%l4,	0x163A,	%g2
	smul	%g1,	0x1060,	%g4
	edge16ln	%o2,	%o5,	%l3
	mulscc	%i0,	%i7,	%l2
	fcmpgt16	%f2,	%f14,	%o0
	or	%o7,	0x1AD1,	%g6
	movcc	%xcc,	%l6,	%g5
	orncc	%g3,	%i5,	%i4
	add	%o1,	%i6,	%i3
	st	%f14,	[%l7 + 0x58]
	stw	%i1,	[%l7 + 0x60]
	fsrc1s	%f6,	%f11
	umulcc	%l1,	0x0A45,	%l0
	array8	%g7,	%i2,	%o3
	std	%f18,	[%l7 + 0x40]
	ld	[%l7 + 0x20],	%f26
	popc	0x04A8,	%o4
	edge32ln	%o6,	%l4,	%g2
	ldsw	[%l7 + 0x48],	%g1
	orncc	%l5,	0x1D05,	%o2
	movne	%icc,	%o5,	%g4
	sethi	0x0CE6,	%i0
	fnegs	%f3,	%f13
	edge32	%l3,	%l2,	%o0
	stw	%o7,	[%l7 + 0x18]
	xnorcc	%g6,	%i7,	%g5
	mulscc	%g3,	%i5,	%l6
	alignaddr	%i4,	%i6,	%i3
	andncc	%o1,	%i1,	%l1
	or	%g7,	%l0,	%o3
	mova	%xcc,	%i2,	%o4
	sdivcc	%l4,	0x0B8B,	%g2
	add	%o6,	%l5,	%o2
	mulx	%o5,	0x058B,	%g4
	fmovdne	%icc,	%f22,	%f26
	movn	%xcc,	%g1,	%i0
	movrlez	%l3,	0x049,	%o0
	edge16n	%l2,	%o7,	%i7
	movcc	%icc,	%g5,	%g3
	edge32ln	%i5,	%g6,	%i4
	andn	%l6,	0x02E0,	%i6
	bshuffle	%f0,	%f16,	%f4
	fmovrslez	%i3,	%f12,	%f5
	edge32l	%o1,	%i1,	%l1
	fcmpd	%fcc3,	%f22,	%f2
	fmuld8sux16	%f23,	%f9,	%f16
	umul	%l0,	%o3,	%i2
	fpadd32	%f2,	%f14,	%f2
	siam	0x4
	addccc	%g7,	0x090F,	%o4
	xor	%l4,	%g2,	%o6
	mulx	%l5,	%o5,	%g4
	andcc	%o2,	%g1,	%i0
	nop
	set	0x78, %l0
	lduw	[%l7 + %l0],	%o0
	nop
	set	0x2A, %l6
	sth	%l3,	[%l7 + %l6]
	mulx	%o7,	%i7,	%g5
	movcc	%xcc,	%g3,	%i5
	ldub	[%l7 + 0x35],	%l2
	stb	%g6,	[%l7 + 0x1E]
	fcmpd	%fcc1,	%f10,	%f0
	fcmpgt32	%f24,	%f18,	%l6
	sdivx	%i6,	0x0FCE,	%i4
	sll	%i3,	0x1D,	%i1
	fcmpgt32	%f0,	%f14,	%o1
	stx	%l0,	[%l7 + 0x58]
	edge8l	%o3,	%i2,	%g7
	movne	%icc,	%l1,	%o4
	xnorcc	%l4,	%g2,	%o6
	movcc	%icc,	%l5,	%o5
	fcmpeq16	%f30,	%f18,	%o2
	sethi	0x1841,	%g4
	udivx	%i0,	0x04CB,	%g1
	umul	%l3,	0x0785,	%o0
	fmovdvs	%icc,	%f23,	%f10
	st	%f4,	[%l7 + 0x70]
	fzeros	%f21
	srl	%i7,	0x06,	%g5
	ldsb	[%l7 + 0x5A],	%g3
	fandnot2s	%f3,	%f7,	%f2
	movle	%xcc,	%i5,	%l2
	move	%icc,	%o7,	%g6
	movn	%xcc,	%i6,	%i4
	movl	%xcc,	%l6,	%i3
	fmovscc	%icc,	%f1,	%f2
	movleu	%icc,	%o1,	%l0
	fcmpes	%fcc1,	%f21,	%f16
	orn	%o3,	0x0734,	%i1
	st	%f9,	[%l7 + 0x78]
	mulscc	%i2,	0x027E,	%l1
	udivcc	%o4,	0x0AF2,	%g7
	movne	%xcc,	%g2,	%l4
	for	%f20,	%f10,	%f28
	save %o6, 0x0AC8, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o5,	%o2,	%g4
	fcmped	%fcc1,	%f22,	%f12
	lduw	[%l7 + 0x1C],	%i0
	mulscc	%g1,	%l3,	%i7
	movcs	%icc,	%g5,	%o0
	andn	%g3,	%i5,	%l2
	movn	%xcc,	%g6,	%i6
	subc	%i4,	0x194C,	%o7
	movne	%xcc,	%l6,	%o1
	movrgez	%i3,	0x047,	%o3
	fnot2	%f18,	%f6
	fabsd	%f26,	%f28
	fmovdcs	%icc,	%f17,	%f15
	fpack16	%f16,	%f30
	fmovrdgez	%l0,	%f28,	%f6
	edge32l	%i1,	%l1,	%i2
	fsrc2	%f8,	%f26
	lduw	[%l7 + 0x28],	%o4
	movcs	%xcc,	%g7,	%l4
	edge16l	%g2,	%l5,	%o6
	ldx	[%l7 + 0x50],	%o2
	mulx	%o5,	%g4,	%g1
	std	%f20,	[%l7 + 0x28]
	alignaddr	%i0,	%l3,	%i7
	fcmpes	%fcc1,	%f26,	%f3
	fmovs	%f29,	%f13
	fxnors	%f21,	%f5,	%f8
	fmovdvc	%xcc,	%f22,	%f5
	andncc	%g5,	%o0,	%g3
	fmovdvs	%xcc,	%f8,	%f19
	fmul8x16au	%f11,	%f3,	%f8
	orn	%l2,	0x1770,	%i5
	xorcc	%i6,	0x04D7,	%g6
	nop
	set	0x1A, %i4
	ldsh	[%l7 + %i4],	%o7
	addccc	%i4,	0x0D2F,	%l6
	ld	[%l7 + 0x38],	%f19
	fzeros	%f17
	edge16l	%i3,	%o1,	%l0
	xnor	%o3,	%l1,	%i2
	ldx	[%l7 + 0x08],	%i1
	edge8n	%g7,	%o4,	%l4
	edge8ln	%l5,	%o6,	%g2
	edge16	%o5,	%o2,	%g4
	lduh	[%l7 + 0x0A],	%i0
	movl	%icc,	%l3,	%g1
	edge32n	%i7,	%g5,	%o0
	fnor	%f0,	%f2,	%f0
	sllx	%l2,	%i5,	%i6
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	fsrc2	%f14,	%f14
	andn	%l6,	0x1AAE,	%i4
	movg	%xcc,	%o1,	%i3
	sra	%l0,	%l1,	%i2
	umul	%i1,	0x1359,	%g7
	edge8l	%o3,	%l4,	%o4
	ldx	[%l7 + 0x70],	%l5
	orcc	%o6,	0x1B1A,	%o5
	movne	%xcc,	%g2,	%g4
	fmovdvs	%xcc,	%f12,	%f1
	movn	%icc,	%o2,	%l3
	srl	%g1,	0x0D,	%i0
	and	%g5,	0x03E7,	%o0
	smul	%l2,	%i7,	%i6
	fmovsgu	%xcc,	%f31,	%f28
	fzeros	%f26
	ldx	[%l7 + 0x60],	%g3
	stw	%i5,	[%l7 + 0x3C]
	array8	%o7,	%g6,	%l6
	fmovsgu	%icc,	%f6,	%f12
	fmovsl	%icc,	%f28,	%f7
	fpadd32	%f2,	%f18,	%f28
	fmovdvs	%xcc,	%f5,	%f16
	mulx	%i4,	0x0D44,	%i3
	sdivcc	%l0,	0x1BC6,	%l1
	sth	%i2,	[%l7 + 0x2E]
	mulscc	%i1,	%g7,	%o3
	edge32n	%o1,	%l4,	%o4
	movvc	%xcc,	%l5,	%o6
	stx	%g2,	[%l7 + 0x08]
	lduw	[%l7 + 0x58],	%g4
	edge8l	%o2,	%o5,	%l3
	fmovdne	%xcc,	%f5,	%f31
	array8	%i0,	%g5,	%g1
	fmovd	%f16,	%f6
	orncc	%l2,	0x1BB3,	%i7
	edge8ln	%i6,	%g3,	%i5
	fmovscs	%icc,	%f9,	%f20
	fmul8x16al	%f28,	%f16,	%f2
	for	%f4,	%f6,	%f4
	fmovrse	%o7,	%f0,	%f14
	bshuffle	%f10,	%f2,	%f28
	fmovdg	%xcc,	%f7,	%f12
	subccc	%o0,	0x0541,	%l6
	movge	%icc,	%g6,	%i3
	fandnot2	%f6,	%f10,	%f26
	mova	%xcc,	%i4,	%l1
	fmovrsne	%l0,	%f29,	%f1
	sllx	%i2,	%g7,	%o3
	fmovrdlz	%i1,	%f16,	%f20
	movrgz	%o1,	0x1C3,	%o4
	array16	%l5,	%l4,	%g2
	array8	%o6,	%o2,	%o5
	fnegs	%f24,	%f28
	fmovrsgez	%g4,	%f26,	%f25
	fcmped	%fcc2,	%f22,	%f6
	fzero	%f16
	fornot1s	%f22,	%f12,	%f26
	fpadd16s	%f1,	%f9,	%f7
	ldd	[%l7 + 0x50],	%l2
	edge16ln	%g5,	%g1,	%i0
	array8	%l2,	%i7,	%i6
	addccc	%g3,	0x05BA,	%i5
	fcmpd	%fcc3,	%f0,	%f22
	fnot1s	%f14,	%f19
	ld	[%l7 + 0x7C],	%f3
	fsrc1s	%f23,	%f10
	fmovse	%xcc,	%f12,	%f7
	umulcc	%o7,	0x1966,	%o0
	fmovsgu	%xcc,	%f14,	%f0
	movrgez	%l6,	%i3,	%i4
	edge32n	%g6,	%l0,	%l1
	mulscc	%g7,	0x1025,	%o3
	addcc	%i2,	0x11BE,	%o1
	fmuld8sux16	%f19,	%f6,	%f30
	fzero	%f28
	orncc	%i1,	0x1B88,	%o4
	fmovscs	%xcc,	%f18,	%f19
	fnot1s	%f1,	%f18
	sdivcc	%l4,	0x03D2,	%l5
	smulcc	%g2,	0x15D1,	%o2
	fpmerge	%f6,	%f14,	%f6
	mova	%icc,	%o6,	%g4
	edge8l	%l3,	%o5,	%g5
	add	%g1,	%i0,	%i7
	edge32l	%i6,	%l2,	%g3
	movl	%icc,	%i5,	%o7
	sllx	%o0,	%l6,	%i4
	array32	%i3,	%l0,	%l1
	fmuld8sux16	%f9,	%f31,	%f10
	sllx	%g7,	%g6,	%i2
	edge16	%o3,	%i1,	%o4
	edge8ln	%l4,	%o1,	%g2
	smulcc	%l5,	%o6,	%o2
	edge32ln	%l3,	%o5,	%g5
	fsrc1	%f4,	%f22
	movrne	%g4,	%i0,	%g1
	movvs	%icc,	%i6,	%l2
	movne	%icc,	%i7,	%i5
	ldx	[%l7 + 0x50],	%g3
	edge32ln	%o0,	%o7,	%i4
	st	%f23,	[%l7 + 0x34]
	movpos	%icc,	%l6,	%i3
	fmovdg	%icc,	%f27,	%f8
	fnegd	%f16,	%f0
	edge8l	%l1,	%g7,	%g6
	orcc	%l0,	0x0CA7,	%o3
	orcc	%i2,	0x09FE,	%i1
	fandnot2	%f30,	%f8,	%f28
	srl	%l4,	%o4,	%g2
	movrgez	%o1,	%l5,	%o6
	lduw	[%l7 + 0x40],	%l3
	movvs	%icc,	%o2,	%g5
	nop
	set	0x20, %i7
	ldsh	[%l7 + %i7],	%o5
	edge32	%g4,	%g1,	%i6
	restore %l2, %i7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f16,	%f20,	%f6
	fpsub16	%f2,	%f12,	%f6
	ldsw	[%l7 + 0x48],	%i0
	udivcc	%o0,	0x19A9,	%g3
	orncc	%i4,	0x0371,	%o7
	fpadd16s	%f30,	%f22,	%f6
	save %i3, %l1, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%icc,	%f31,	%f29
	addccc	%g6,	0x008B,	%l0
	movg	%icc,	%g7,	%o3
	add	%i1,	%l4,	%o4
	movgu	%xcc,	%g2,	%i2
	sdiv	%o1,	0x0AB5,	%o6
	fmovscs	%xcc,	%f17,	%f31
	save %l3, %o2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f2,	%f7,	%f6
	edge8l	%o5,	%g4,	%l5
	movcs	%icc,	%g1,	%i6
	fmovsa	%xcc,	%f5,	%f29
	st	%f24,	[%l7 + 0x28]
	edge8n	%i7,	%i5,	%i0
	fmul8ulx16	%f16,	%f20,	%f20
	for	%f20,	%f16,	%f22
	movpos	%xcc,	%l2,	%g3
	udivx	%i4,	0x1C99,	%o0
	ldsb	[%l7 + 0x56],	%i3
	movrgz	%l1,	0x26C,	%l6
	ldd	[%l7 + 0x30],	%f26
	movvc	%xcc,	%o7,	%g6
	stb	%l0,	[%l7 + 0x64]
	fmovdgu	%xcc,	%f2,	%f21
	fcmpd	%fcc1,	%f4,	%f28
	edge16n	%o3,	%g7,	%l4
	ldd	[%l7 + 0x58],	%o4
	st	%f30,	[%l7 + 0x08]
	subcc	%i1,	0x0EA2,	%g2
	subc	%o1,	0x0360,	%o6
	ldd	[%l7 + 0x58],	%i2
	fmovrslz	%l3,	%f14,	%f18
	fandnot2	%f18,	%f30,	%f26
	st	%f7,	[%l7 + 0x28]
	stx	%g5,	[%l7 + 0x78]
	movn	%icc,	%o5,	%g4
	sir	0x064E
	movg	%icc,	%o2,	%g1
	or	%i6,	0x1D99,	%l5
	mulscc	%i5,	0x117D,	%i0
	sethi	0x1596,	%i7
	andncc	%g3,	%l2,	%o0
	ld	[%l7 + 0x1C],	%f12
	edge16ln	%i4,	%i3,	%l1
	subc	%l6,	%g6,	%l0
	fmovdcs	%icc,	%f31,	%f29
	movrlez	%o7,	%g7,	%l4
	xorcc	%o4,	%i1,	%g2
	array16	%o1,	%o6,	%i2
	ldsw	[%l7 + 0x44],	%l3
	lduh	[%l7 + 0x12],	%o3
	movrne	%g5,	0x1EC,	%o5
	movrgz	%g4,	%g1,	%i6
	andn	%l5,	%o2,	%i0
	sethi	0x0667,	%i7
	fpadd16	%f28,	%f14,	%f0
	fmovsvc	%xcc,	%f12,	%f17
	fands	%f31,	%f20,	%f29
	udiv	%g3,	0x1108,	%i5
	andcc	%o0,	0x03A4,	%l2
	edge8	%i4,	%i3,	%l1
	subcc	%g6,	%l0,	%o7
	movle	%icc,	%l6,	%g7
	smulcc	%l4,	%i1,	%o4
	movg	%icc,	%g2,	%o6
	addc	%o1,	%i2,	%l3
	movrgz	%o3,	%o5,	%g5
	subc	%g4,	%i6,	%g1
	movne	%xcc,	%l5,	%i0
	mulx	%o2,	0x0E94,	%i7
	sdivcc	%g3,	0x1112,	%i5
	sth	%o0,	[%l7 + 0x2A]
	subc	%i4,	%l2,	%l1
	movcs	%icc,	%i3,	%l0
	xorcc	%g6,	%o7,	%g7
	edge8	%l4,	%l6,	%i1
	lduw	[%l7 + 0x24],	%o4
	sub	%o6,	0x0A8C,	%g2
	edge32	%i2,	%l3,	%o1
	umul	%o5,	0x1E30,	%o3
	srax	%g4,	0x0A,	%i6
	edge16n	%g1,	%l5,	%g5
	udivx	%o2,	0x14F4,	%i0
	sdivcc	%i7,	0x194B,	%g3
	edge32ln	%i5,	%o0,	%l2
	edge32l	%i4,	%i3,	%l0
	fcmpeq16	%f30,	%f18,	%l1
	popc	%g6,	%o7
	umul	%l4,	0x092A,	%g7
	stx	%l6,	[%l7 + 0x10]
	movrlez	%o4,	%i1,	%o6
	movg	%xcc,	%g2,	%i2
	andn	%o1,	%l3,	%o5
	xnor	%g4,	%o3,	%i6
	stb	%l5,	[%l7 + 0x36]
	movg	%xcc,	%g1,	%g5
	edge16n	%i0,	%i7,	%o2
	lduw	[%l7 + 0x28],	%g3
	edge8l	%o0,	%i5,	%l2
	srl	%i4,	%l0,	%i3
	edge8ln	%g6,	%l1,	%o7
	edge16ln	%l4,	%g7,	%l6
	fmovse	%xcc,	%f4,	%f19
	fmovsne	%icc,	%f17,	%f18
	andcc	%i1,	%o4,	%o6
	edge32l	%i2,	%g2,	%o1
	mulscc	%o5,	0x0992,	%l3
	alignaddr	%o3,	%g4,	%i6
	smul	%g1,	0x0AE0,	%l5
	srlx	%g5,	%i7,	%i0
	edge16	%g3,	%o0,	%i5
	movre	%o2,	0x1C0,	%l2
	mova	%icc,	%l0,	%i4
	ldsh	[%l7 + 0x5E],	%i3
	fmovrdgez	%g6,	%f10,	%f14
	movrne	%l1,	%o7,	%l4
	fmovdneg	%xcc,	%f10,	%f18
	fmovdcs	%icc,	%f20,	%f29
	fmovsg	%icc,	%f23,	%f18
	movre	%l6,	0x144,	%g7
	edge8l	%i1,	%o6,	%i2
	mulx	%o4,	%o1,	%o5
	movge	%xcc,	%g2,	%o3
	movleu	%xcc,	%l3,	%i6
	orncc	%g1,	%g4,	%l5
	movrlez	%g5,	0x1E8,	%i7
	fcmpgt32	%f28,	%f24,	%i0
	nop
	set	0x20, %g2
	std	%f10,	[%l7 + %g2]
	mulscc	%g3,	0x1331,	%i5
	ldsw	[%l7 + 0x0C],	%o2
	fornot1s	%f7,	%f19,	%f28
	movg	%xcc,	%l2,	%o0
	fmovspos	%xcc,	%f6,	%f23
	movpos	%xcc,	%l0,	%i4
	stw	%i3,	[%l7 + 0x64]
	subc	%g6,	%o7,	%l4
	fmovsvc	%icc,	%f14,	%f28
	xnorcc	%l6,	%l1,	%i1
	save %o6, %i2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g7,	%o5,	%g2
	srax	%o3,	0x02,	%o1
	fpadd16s	%f27,	%f13,	%f17
	subc	%i6,	%g1,	%l3
	mulscc	%g4,	%g5,	%l5
	orncc	%i7,	0x15F9,	%i0
	ldsb	[%l7 + 0x35],	%g3
	edge16l	%o2,	%i5,	%l2
	sir	0x1BE4
	edge32n	%o0,	%l0,	%i3
	addccc	%g6,	%o7,	%i4
	sll	%l6,	0x1F,	%l4
	lduh	[%l7 + 0x44],	%i1
	nop
	set	0x2B, %g6
	ldsb	[%l7 + %g6],	%l1
	alignaddrl	%i2,	%o4,	%o6
	edge8n	%o5,	%g2,	%g7
	movcc	%icc,	%o3,	%o1
	fmovrsne	%i6,	%f11,	%f15
	edge16ln	%l3,	%g1,	%g5
	array16	%g4,	%l5,	%i7
	edge32	%g3,	%i0,	%o2
	ldx	[%l7 + 0x38],	%l2
	lduw	[%l7 + 0x40],	%i5
	sir	0x0695
	addccc	%o0,	0x1109,	%l0
	addcc	%i3,	%o7,	%i4
	xorcc	%l6,	0x139B,	%g6
	udivx	%i1,	0x06A7,	%l1
	sdiv	%l4,	0x1F84,	%i2
	sllx	%o6,	0x0A,	%o4
	edge16	%g2,	%g7,	%o5
	save %o1, 0x1D0D, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f13,	%f12,	%f6
	movrgez	%l3,	%o3,	%g1
	fandnot1s	%f27,	%f8,	%f23
	sir	0x1443
	lduh	[%l7 + 0x6A],	%g5
	fandnot1s	%f17,	%f28,	%f25
	movl	%xcc,	%l5,	%g4
	fmovrse	%i7,	%f24,	%f4
	popc	0x197A,	%g3
	orn	%i0,	0x119B,	%o2
	mulscc	%i5,	%l2,	%o0
	fmovd	%f6,	%f6
	movneg	%icc,	%l0,	%i3
	mulx	%o7,	%i4,	%g6
	movcc	%xcc,	%i1,	%l1
	smulcc	%l6,	%l4,	%i2
	umulcc	%o4,	%g2,	%o6
	or	%o5,	0x0F50,	%o1
	fcmpd	%fcc2,	%f2,	%f14
	popc	%g7,	%l3
	srl	%o3,	0x17,	%i6
	lduw	[%l7 + 0x1C],	%g5
	sdivcc	%l5,	0x0806,	%g1
	xor	%i7,	0x00B2,	%g4
	fnot2	%f12,	%f12
	faligndata	%f6,	%f12,	%f20
	fsrc1s	%f31,	%f24
	ldsb	[%l7 + 0x70],	%g3
	edge32n	%o2,	%i0,	%l2
	movle	%xcc,	%i5,	%l0
	fmovsne	%xcc,	%f21,	%f24
	xnorcc	%o0,	%o7,	%i3
	movne	%xcc,	%i4,	%g6
	andn	%l1,	%i1,	%l6
	addc	%i2,	0x03AE,	%l4
	sllx	%g2,	%o6,	%o5
	save %o4, 0x172C, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l3,	%g7,	%i6
	std	%f18,	[%l7 + 0x60]
	sth	%o3,	[%l7 + 0x5E]
	movrgez	%g5,	0x3AE,	%g1
	movne	%icc,	%i7,	%l5
	mova	%xcc,	%g4,	%o2
	fmovdn	%icc,	%f2,	%f17
	fmovrdgz	%g3,	%f14,	%f24
	mulscc	%i0,	0x17F1,	%l2
	edge16ln	%l0,	%o0,	%i5
	umulcc	%o7,	0x135C,	%i4
	stw	%g6,	[%l7 + 0x7C]
	addc	%l1,	0x089A,	%i1
	ld	[%l7 + 0x48],	%f10
	array16	%l6,	%i2,	%i3
	movrne	%l4,	%g2,	%o5
	fxnors	%f9,	%f11,	%f27
	fmovscc	%icc,	%f12,	%f15
	fnot2s	%f3,	%f31
	smul	%o4,	%o1,	%o6
	sdiv	%g7,	0x0FA1,	%i6
	addcc	%l3,	0x0183,	%o3
	st	%f18,	[%l7 + 0x34]
	edge16	%g5,	%i7,	%l5
	udivcc	%g1,	0x0444,	%o2
	edge32ln	%g3,	%g4,	%l2
	ldsh	[%l7 + 0x5E],	%l0
	edge16ln	%o0,	%i0,	%i5
	ld	[%l7 + 0x60],	%f24
	st	%f31,	[%l7 + 0x7C]
	edge8	%o7,	%g6,	%l1
	fcmpne16	%f26,	%f30,	%i1
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	sdivcc	%l4,	0x1203,	%g2
	udivx	%o5,	0x14B2,	%o4
	fmovsl	%icc,	%f15,	%f20
	ldx	[%l7 + 0x70],	%i3
	orcc	%o6,	0x1B3E,	%o1
	lduw	[%l7 + 0x40],	%g7
	ldsb	[%l7 + 0x25],	%i6
	mulscc	%l3,	%g5,	%i7
	fmovsle	%xcc,	%f1,	%f18
	sra	%l5,	0x00,	%o3
	ldsw	[%l7 + 0x08],	%g1
	andcc	%o2,	0x0476,	%g3
	fpack16	%f2,	%f18
	movcc	%xcc,	%l2,	%g4
	and	%o0,	0x1539,	%l0
	sethi	0x1117,	%i5
	xorcc	%i0,	0x0EDF,	%g6
	movre	%l1,	0x3E1,	%i1
	movg	%icc,	%l6,	%i4
	edge16ln	%i2,	%l4,	%o7
	movrlez	%g2,	0x222,	%o4
	fmovrdgez	%i3,	%f16,	%f24
	movleu	%xcc,	%o5,	%o1
	orncc	%o6,	0x0AFF,	%i6
	fmovsle	%xcc,	%f19,	%f24
	fsrc2s	%f9,	%f11
	fmovrde	%l3,	%f14,	%f30
	fzero	%f20
	st	%f0,	[%l7 + 0x18]
	srax	%g5,	%g7,	%i7
	fmul8x16au	%f28,	%f19,	%f12
	edge8ln	%o3,	%l5,	%o2
	fcmple32	%f6,	%f18,	%g1
	subc	%l2,	%g3,	%g4
	ld	[%l7 + 0x0C],	%f16
	movl	%xcc,	%l0,	%i5
	movrgz	%o0,	%g6,	%i0
	movle	%xcc,	%i1,	%l6
	fmovsg	%xcc,	%f28,	%f30
	movrlz	%i4,	%i2,	%l1
	sth	%l4,	[%l7 + 0x74]
	addcc	%o7,	%o4,	%i3
	srl	%g2,	0x04,	%o5
	edge32	%o1,	%o6,	%i6
	fmovdl	%icc,	%f25,	%f28
	movre	%l3,	%g5,	%i7
	subc	%g7,	0x11A9,	%l5
	movge	%xcc,	%o2,	%g1
	fmovdvc	%icc,	%f14,	%f4
	sth	%o3,	[%l7 + 0x2E]
	movl	%xcc,	%l2,	%g4
	srax	%g3,	%i5,	%o0
	fsrc2	%f6,	%f22
	andn	%g6,	0x13F5,	%i0
	srl	%i1,	%l6,	%i4
	fabsd	%f12,	%f8
	movre	%i2,	0x180,	%l0
	udivx	%l4,	0x163F,	%o7
	fmovdl	%icc,	%f13,	%f2
	fmul8x16	%f16,	%f18,	%f28
	popc	%l1,	%i3
	movle	%xcc,	%g2,	%o5
	movn	%xcc,	%o1,	%o4
	srl	%i6,	0x15,	%o6
	array8	%l3,	%i7,	%g7
	sdivcc	%l5,	0x111D,	%g5
	xorcc	%o2,	0x06E8,	%o3
	stb	%l2,	[%l7 + 0x3B]
	nop
	set	0x0C, %i5
	ldsh	[%l7 + %i5],	%g4
	edge16l	%g1,	%g3,	%i5
	subccc	%g6,	%i0,	%i1
	alignaddrl	%l6,	%o0,	%i4
	array16	%l0,	%i2,	%o7
	ldsb	[%l7 + 0x5E],	%l4
	sll	%i3,	0x1A,	%l1
	stx	%o5,	[%l7 + 0x68]
	fmovsvs	%icc,	%f16,	%f14
	orcc	%o1,	0x1197,	%o4
	movge	%icc,	%i6,	%o6
	fcmpeq32	%f6,	%f6,	%l3
	xnorcc	%i7,	0x18D7,	%g7
	addc	%g2,	0x186E,	%l5
	alignaddr	%o2,	%g5,	%o3
	stb	%g4,	[%l7 + 0x71]
	addccc	%l2,	0x1A08,	%g1
	movleu	%xcc,	%g3,	%i5
	andncc	%g6,	%i1,	%l6
	movleu	%icc,	%o0,	%i4
	fmovrdgez	%l0,	%f2,	%f4
	fnot1	%f20,	%f22
	edge8l	%i0,	%o7,	%l4
	edge16n	%i2,	%l1,	%o5
	movne	%icc,	%o1,	%i3
	or	%o4,	%o6,	%i6
	add	%i7,	%l3,	%g2
	umulcc	%l5,	0x1320,	%g7
	sth	%o2,	[%l7 + 0x28]
	fcmpgt32	%f16,	%f8,	%o3
	mulx	%g5,	%l2,	%g4
	fmovsne	%xcc,	%f2,	%f10
	orn	%g1,	0x089C,	%i5
	srax	%g3,	%g6,	%i1
	fmovdle	%icc,	%f23,	%f1
	udiv	%o0,	0x0A28,	%i4
	std	%f2,	[%l7 + 0x40]
	edge8	%l6,	%i0,	%o7
	fmul8sux16	%f18,	%f14,	%f0
	fsrc2s	%f17,	%f16
	movleu	%xcc,	%l4,	%l0
	fcmpeq16	%f12,	%f22,	%l1
	fcmpgt32	%f0,	%f30,	%o5
	addccc	%i2,	0x04C3,	%i3
	ldsh	[%l7 + 0x7C],	%o1
	ldub	[%l7 + 0x7F],	%o6
	andn	%o4,	%i6,	%l3
	edge16n	%g2,	%l5,	%g7
	xnor	%o2,	0x1D22,	%i7
	fcmpgt32	%f30,	%f2,	%g5
	srl	%o3,	%l2,	%g1
	fsrc1	%f8,	%f6
	srlx	%g4,	0x07,	%i5
	fpadd32	%f10,	%f16,	%f4
	smulcc	%g6,	%g3,	%o0
	fone	%f6
	addcc	%i4,	%i1,	%i0
	stb	%o7,	[%l7 + 0x60]
	fmul8x16au	%f4,	%f18,	%f4
	fmovse	%icc,	%f29,	%f30
	fmovs	%f10,	%f10
	save %l6, %l0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l1,	%o5,	%i3
	srl	%o1,	0x0A,	%i2
	move	%icc,	%o4,	%o6
	movleu	%xcc,	%i6,	%l3
	umul	%g2,	0x0F25,	%g7
	bshuffle	%f12,	%f10,	%f30
	mulx	%o2,	0x066C,	%l5
	udiv	%i7,	0x009C,	%o3
	addccc	%l2,	%g1,	%g5
	edge8n	%i5,	%g6,	%g4
	movrgz	%o0,	0x0BF,	%i4
	sdivcc	%g3,	0x03A6,	%i0
	st	%f2,	[%l7 + 0x40]
	orn	%o7,	0x150C,	%i1
	lduh	[%l7 + 0x5C],	%l0
	restore %l6, %l1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o5,	%i3,	%o1
	fxnors	%f11,	%f4,	%f14
	nop
	set	0x10, %l3
	ldsw	[%l7 + %l3],	%o4
	umulcc	%i2,	0x0056,	%i6
	andcc	%o6,	0x076C,	%g2
	fmovrdlz	%l3,	%f30,	%f18
	move	%xcc,	%g7,	%l5
	movcc	%icc,	%o2,	%i7
	lduh	[%l7 + 0x08],	%o3
	movcs	%xcc,	%l2,	%g1
	andncc	%i5,	%g6,	%g5
	movneg	%icc,	%o0,	%i4
	fpackfix	%f26,	%f31
	fcmpes	%fcc3,	%f29,	%f2
	movrne	%g3,	0x1FD,	%g4
	sllx	%i0,	%o7,	%l0
	nop
	set	0x64, %i6
	stw	%i1,	[%l7 + %i6]
	edge16l	%l6,	%l4,	%l1
	sllx	%o5,	0x1B,	%i3
	srlx	%o1,	%o4,	%i2
	umulcc	%i6,	%o6,	%l3
	sdiv	%g2,	0x0378,	%l5
	fcmped	%fcc2,	%f22,	%f10
	movrne	%o2,	%i7,	%o3
	ld	[%l7 + 0x18],	%f4
	fands	%f19,	%f0,	%f18
	sdiv	%g7,	0x1521,	%g1
	movpos	%xcc,	%l2,	%g6
	movg	%xcc,	%i5,	%o0
	fornot2	%f8,	%f6,	%f24
	lduh	[%l7 + 0x22],	%g5
	andn	%i4,	%g4,	%i0
	edge16ln	%g3,	%l0,	%o7
	movcs	%xcc,	%i1,	%l6
	movre	%l4,	%o5,	%i3
	array8	%l1,	%o1,	%i2
	edge16	%i6,	%o6,	%l3
	move	%icc,	%o4,	%g2
	movcc	%icc,	%l5,	%i7
	std	%f16,	[%l7 + 0x18]
	edge8	%o3,	%o2,	%g1
	subcc	%l2,	0x0B27,	%g6
	movrgez	%g7,	0x0B8,	%i5
	ldub	[%l7 + 0x12],	%g5
	orcc	%i4,	%g4,	%o0
	movg	%icc,	%g3,	%l0
	fpackfix	%f6,	%f10
	ld	[%l7 + 0x48],	%f28
	ld	[%l7 + 0x20],	%f22
	andn	%o7,	%i0,	%i1
	edge32ln	%l6,	%l4,	%o5
	sdiv	%l1,	0x1F24,	%i3
	orcc	%i2,	%i6,	%o6
	movrgez	%l3,	%o1,	%g2
	st	%f21,	[%l7 + 0x24]
	movcc	%xcc,	%l5,	%i7
	fxors	%f7,	%f16,	%f16
	xnor	%o4,	%o3,	%g1
	movvc	%icc,	%l2,	%g6
	lduh	[%l7 + 0x7A],	%o2
	movcs	%xcc,	%i5,	%g7
	fcmple16	%f2,	%f18,	%i4
	edge32	%g5,	%o0,	%g4
	xorcc	%g3,	0x0B85,	%o7
	fors	%f8,	%f7,	%f30
	edge16n	%i0,	%l0,	%l6
	edge16n	%i1,	%o5,	%l1
	movrne	%i3,	%l4,	%i2
	st	%f29,	[%l7 + 0x20]
	fnot1	%f26,	%f22
	addcc	%i6,	%o6,	%l3
	movvc	%icc,	%o1,	%g2
	edge32l	%l5,	%o4,	%o3
	stx	%i7,	[%l7 + 0x68]
	ld	[%l7 + 0x0C],	%f18
	smulcc	%g1,	0x16A0,	%g6
	sir	0x1A0E
	std	%f28,	[%l7 + 0x28]
	umulcc	%l2,	0x191A,	%o2
	umul	%g7,	%i4,	%i5
	sllx	%g5,	0x01,	%g4
	fmovrdne	%o0,	%f28,	%f0
	fmovdl	%xcc,	%f13,	%f11
	fpackfix	%f4,	%f22
	smul	%g3,	0x1F63,	%i0
	array32	%o7,	%l6,	%i1
	edge32	%l0,	%o5,	%i3
	movpos	%icc,	%l1,	%l4
	srlx	%i2,	%o6,	%i6
	fmovsne	%icc,	%f9,	%f15
	movl	%xcc,	%o1,	%g2
	sdivcc	%l3,	0x0633,	%l5
	orcc	%o3,	%i7,	%g1
	movvs	%icc,	%o4,	%g6
	ldsh	[%l7 + 0x40],	%l2
	movge	%icc,	%o2,	%g7
	mova	%xcc,	%i5,	%i4
	movrlez	%g5,	%g4,	%o0
	sdivx	%g3,	0x13F2,	%i0
	sllx	%o7,	0x06,	%i1
	sdivcc	%l6,	0x0C3E,	%l0
	movn	%icc,	%i3,	%o5
	fcmps	%fcc0,	%f12,	%f27
	edge32n	%l4,	%l1,	%o6
	andcc	%i6,	%o1,	%g2
	stb	%i2,	[%l7 + 0x67]
	fmovrsne	%l5,	%f5,	%f23
	sdiv	%l3,	0x0AB6,	%o3
	srl	%g1,	0x15,	%o4
	fnand	%f26,	%f6,	%f6
	fmovrdlez	%i7,	%f26,	%f10
	srlx	%g6,	%l2,	%g7
	fmovrsne	%i5,	%f2,	%f27
	subccc	%o2,	0x0761,	%g5
	edge32ln	%i4,	%o0,	%g3
	mulx	%i0,	%g4,	%i1
	and	%o7,	0x05B4,	%l0
	move	%xcc,	%l6,	%i3
	fmovdvs	%icc,	%f25,	%f4
	ldx	[%l7 + 0x60],	%o5
	movrgez	%l4,	0x3FE,	%l1
	ldsh	[%l7 + 0x36],	%i6
	xorcc	%o6,	0x1330,	%g2
	fcmpd	%fcc3,	%f2,	%f8
	orcc	%o1,	0x144B,	%i2
	movl	%xcc,	%l5,	%l3
	movl	%icc,	%o3,	%g1
	movgu	%xcc,	%o4,	%g6
	array16	%i7,	%g7,	%l2
	fpack16	%f26,	%f4
	subcc	%i5,	0x0A41,	%g5
	xnor	%o2,	0x1DF6,	%o0
	srl	%g3,	0x11,	%i4
	movn	%xcc,	%g4,	%i0
	udivx	%i1,	0x08E9,	%o7
	edge16n	%l0,	%l6,	%i3
	fmul8sux16	%f0,	%f4,	%f26
	faligndata	%f24,	%f14,	%f2
	sdivx	%o5,	0x0919,	%l1
	sth	%l4,	[%l7 + 0x32]
	fmovrslez	%o6,	%f1,	%f13
	fnand	%f16,	%f30,	%f26
	edge32ln	%g2,	%o1,	%i6
	ldx	[%l7 + 0x08],	%i2
	mova	%xcc,	%l3,	%l5
	sdivcc	%o3,	0x0A52,	%g1
	or	%o4,	0x095D,	%g6
	mulscc	%g7,	0x086A,	%i7
	stb	%l2,	[%l7 + 0x48]
	fmovdvc	%icc,	%f2,	%f1
	sth	%i5,	[%l7 + 0x36]
	fmovrslz	%o2,	%f5,	%f5
	movre	%g5,	%g3,	%i4
	std	%f30,	[%l7 + 0x40]
	sth	%o0,	[%l7 + 0x2C]
	movgu	%icc,	%i0,	%i1
	alignaddr	%o7,	%l0,	%l6
	array32	%i3,	%g4,	%l1
	movrne	%o5,	0x3CE,	%l4
	ldsb	[%l7 + 0x29],	%o6
	fmul8sux16	%f22,	%f14,	%f24
	sub	%o1,	0x0DEC,	%i6
	fmovsn	%xcc,	%f26,	%f24
	movg	%icc,	%g2,	%l3
	fabsd	%f0,	%f28
	ldub	[%l7 + 0x09],	%i2
	movgu	%xcc,	%l5,	%o3
	movcs	%xcc,	%o4,	%g1
	edge16	%g6,	%g7,	%l2
	sir	0x18C5
	umul	%i7,	%o2,	%i5
	orncc	%g3,	%i4,	%o0
	xor	%g5,	0x15AE,	%i1
	edge32n	%i0,	%l0,	%l6
	mulscc	%o7,	0x1D6B,	%g4
	edge8l	%l1,	%i3,	%l4
	sub	%o6,	%o5,	%i6
	fmovsneg	%icc,	%f24,	%f0
	add	%g2,	%l3,	%i2
	orn	%o1,	0x0F29,	%l5
	fpadd32s	%f26,	%f12,	%f7
	alignaddr	%o4,	%g1,	%g6
	fmovdge	%xcc,	%f18,	%f29
	orn	%g7,	%l2,	%o3
	subc	%i7,	0x14ED,	%i5
	addc	%g3,	%o2,	%o0
	mova	%xcc,	%i4,	%i1
	addc	%i0,	%g5,	%l6
	fnands	%f14,	%f31,	%f25
	nop
	set	0x0E, %l4
	sth	%l0,	[%l7 + %l4]
	umul	%g4,	%o7,	%l1
	fabss	%f12,	%f13
	alignaddrl	%l4,	%o6,	%i3
	andn	%i6,	%o5,	%g2
	addcc	%i2,	%o1,	%l3
	fmovsleu	%icc,	%f24,	%f6
	edge16l	%o4,	%l5,	%g6
	subcc	%g7,	0x140B,	%l2
	mova	%xcc,	%o3,	%i7
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	sra	%i5,	0x1B,	%o0
	edge16	%o2,	%i4,	%i1
	edge16l	%g5,	%i0,	%l0
	fcmpne32	%f20,	%f10,	%l6
	movcs	%icc,	%g4,	%o7
	or	%l4,	%o6,	%i3
	fmovscc	%icc,	%f12,	%f24
	edge8	%i6,	%o5,	%g2
	movvs	%xcc,	%i2,	%o1
	fmuld8sux16	%f16,	%f19,	%f28
	movgu	%xcc,	%l1,	%l3
	mova	%icc,	%o4,	%l5
	xnor	%g7,	0x11CD,	%g6
	sdiv	%l2,	0x05AF,	%o3
	ldd	[%l7 + 0x38],	%i6
	fmovsg	%icc,	%f11,	%f16
	umul	%g1,	0x002F,	%i5
	sub	%o0,	0x1789,	%o2
	xor	%g3,	%i4,	%i1
	fmovdl	%xcc,	%f22,	%f7
	fmul8sux16	%f16,	%f6,	%f14
	sll	%g5,	0x09,	%l0
	sdiv	%i0,	0x0B9B,	%l6
	edge32l	%o7,	%g4,	%l4
	sdivcc	%i3,	0x107E,	%i6
	movcs	%xcc,	%o5,	%o6
	fpsub16	%f6,	%f24,	%f8
	mulx	%g2,	0x1AD3,	%o1
	xor	%i2,	0x04E0,	%l3
	nop
	set	0x2F, %l5
	stb	%o4,	[%l7 + %l5]
	edge32	%l5,	%l1,	%g7
	ldsh	[%l7 + 0x66],	%l2
	edge32	%o3,	%g6,	%i7
	movl	%xcc,	%g1,	%o0
	fmovscc	%xcc,	%f12,	%f1
	array8	%o2,	%i5,	%i4
	or	%i1,	0x027B,	%g3
	alignaddrl	%l0,	%g5,	%l6
	edge8ln	%i0,	%o7,	%l4
	fmovdge	%xcc,	%f24,	%f30
	sethi	0x12D1,	%i3
	sra	%i6,	0x0A,	%g4
	save %o6, %o5, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o1,	0x1F9F,	%l3
	stx	%o4,	[%l7 + 0x10]
	and	%i2,	0x187A,	%l1
	ldx	[%l7 + 0x68],	%l5
	add	%l2,	%g7,	%g6
	ldd	[%l7 + 0x70],	%f4
	array8	%o3,	%g1,	%i7
	lduh	[%l7 + 0x66],	%o0
	xnor	%i5,	0x0210,	%o2
	fors	%f24,	%f24,	%f14
	fmovdle	%xcc,	%f9,	%f11
	fmovdl	%xcc,	%f22,	%f26
	udivx	%i1,	0x197B,	%g3
	subc	%l0,	0x1FFF,	%g5
	ldd	[%l7 + 0x08],	%i4
	ldsb	[%l7 + 0x7C],	%i0
	xorcc	%o7,	0x1C7D,	%l6
	andcc	%l4,	%i3,	%g4
	fmovsa	%icc,	%f24,	%f30
	sdivx	%i6,	0x0F6B,	%o5
	movcc	%xcc,	%g2,	%o6
	ldx	[%l7 + 0x08],	%l3
	xnor	%o1,	0x0909,	%i2
	fmovsleu	%xcc,	%f28,	%f19
	fmovrslez	%l1,	%f11,	%f17
	addcc	%l5,	%l2,	%o4
	movrlz	%g6,	%g7,	%o3
	sra	%g1,	0x0E,	%o0
	fmovrsgez	%i7,	%f13,	%f30
	movl	%icc,	%i5,	%i1
	umul	%g3,	%o2,	%l0
	nop
	set	0x12, %o6
	ldsb	[%l7 + %o6],	%g5
	array8	%i4,	%i0,	%o7
	edge32l	%l4,	%l6,	%g4
	edge8ln	%i6,	%o5,	%i3
	fexpand	%f0,	%f12
	sdivx	%g2,	0x111D,	%o6
	movne	%icc,	%l3,	%o1
	or	%l1,	%i2,	%l5
	movg	%xcc,	%o4,	%g6
	movge	%icc,	%g7,	%o3
	stw	%g1,	[%l7 + 0x6C]
	fmovdgu	%icc,	%f21,	%f16
	fmovsa	%icc,	%f2,	%f12
	movrlz	%l2,	%o0,	%i5
	movvs	%xcc,	%i7,	%i1
	xnorcc	%g3,	%o2,	%l0
	fmul8x16au	%f25,	%f12,	%f8
	edge32	%i4,	%g5,	%o7
	addc	%l4,	0x02D8,	%l6
	array32	%i0,	%g4,	%o5
	srl	%i6,	%g2,	%o6
	stw	%i3,	[%l7 + 0x30]
	nop
	set	0x74, %o5
	stw	%l3,	[%l7 + %o5]
	and	%o1,	%i2,	%l5
	alignaddrl	%o4,	%l1,	%g7
	sdivx	%g6,	0x0A7E,	%o3
	fmovsleu	%xcc,	%f5,	%f13
	edge32	%l2,	%o0,	%i5
	movcs	%xcc,	%i7,	%i1
	addcc	%g1,	0x03F4,	%o2
	movcs	%icc,	%g3,	%i4
	sth	%g5,	[%l7 + 0x42]
	edge16ln	%o7,	%l4,	%l0
	orcc	%i0,	%l6,	%o5
	orncc	%g4,	%i6,	%o6
	xor	%i3,	%l3,	%g2
	movcs	%xcc,	%o1,	%l5
	fandnot2s	%f25,	%f29,	%f24
	ldub	[%l7 + 0x7C],	%i2
	mulx	%o4,	%g7,	%l1
	orncc	%g6,	0x11BD,	%o3
	st	%f27,	[%l7 + 0x20]
	srlx	%l2,	0x10,	%i5
	mulx	%i7,	%o0,	%g1
	ldd	[%l7 + 0x78],	%f18
	srax	%i1,	%o2,	%g3
	subcc	%i4,	%g5,	%o7
	sdiv	%l4,	0x01BE,	%i0
	fmovrse	%l0,	%f4,	%f27
	udivcc	%l6,	0x0C8C,	%g4
	save %i6, %o6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%xcc,	%f5,	%f28
	edge32ln	%o5,	%l3,	%g2
	movle	%icc,	%o1,	%i2
	xorcc	%l5,	0x0620,	%o4
	movcs	%icc,	%g7,	%g6
	fmovrdlez	%l1,	%f28,	%f12
	fmovdvs	%icc,	%f17,	%f5
	fpadd16	%f10,	%f12,	%f18
	ldx	[%l7 + 0x30],	%o3
	addcc	%l2,	0x0D72,	%i5
	nop
	set	0x30, %i0
	sth	%i7,	[%l7 + %i0]
	stx	%o0,	[%l7 + 0x40]
	andn	%g1,	0x0CD6,	%i1
	fnor	%f14,	%f8,	%f20
	fpsub32	%f28,	%f14,	%f10
	udivcc	%o2,	0x1C2B,	%i4
	restore %g3, %o7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l4,	%l0,	%i0
	sdiv	%g4,	0x1105,	%l6
	fcmpes	%fcc1,	%f30,	%f17
	umul	%o6,	0x1E25,	%i6
	ldsh	[%l7 + 0x42],	%i3
	andn	%l3,	0x1819,	%o5
	andn	%g2,	0x0842,	%o1
	edge8ln	%l5,	%i2,	%g7
	fmul8x16al	%f1,	%f31,	%f2
	movrgz	%g6,	%o4,	%o3
	movvc	%xcc,	%l1,	%l2
	edge8n	%i7,	%o0,	%g1
	stb	%i1,	[%l7 + 0x6C]
	xnor	%o2,	0x09C8,	%i4
	addc	%i5,	%g3,	%o7
	xorcc	%l4,	0x0720,	%g5
	fandnot1	%f0,	%f6,	%f24
	ldd	[%l7 + 0x68],	%f30
	movle	%icc,	%i0,	%l0
	array32	%l6,	%g4,	%i6
	add	%o6,	0x19B4,	%l3
	ldsb	[%l7 + 0x4E],	%i3
	andn	%o5,	%o1,	%l5
	sdiv	%g2,	0x1697,	%i2
	edge32n	%g7,	%g6,	%o4
	stw	%l1,	[%l7 + 0x0C]
	fmovsge	%icc,	%f21,	%f20
	udivcc	%o3,	0x05EC,	%i7
	edge16n	%o0,	%g1,	%i1
	fornot2	%f14,	%f26,	%f14
	movl	%xcc,	%l2,	%o2
	add	%i5,	0x0E7C,	%g3
	sllx	%o7,	%l4,	%i4
	sth	%i0,	[%l7 + 0x20]
	xnor	%g5,	%l0,	%l6
	ldd	[%l7 + 0x28],	%g4
	array16	%o6,	%i6,	%l3
	xorcc	%i3,	%o1,	%l5
	movrlez	%g2,	0x307,	%o5
	fmovd	%f6,	%f28
	umul	%i2,	0x0F97,	%g7
	fmovrsgez	%o4,	%f2,	%f12
	array32	%l1,	%g6,	%o3
	sll	%i7,	%g1,	%i1
	movleu	%icc,	%l2,	%o0
	fabss	%f30,	%f12
	movrne	%o2,	%i5,	%g3
	edge32l	%o7,	%l4,	%i0
	nop
	set	0x58, %o1
	stw	%i4,	[%l7 + %o1]
	alignaddrl	%g5,	%l6,	%g4
	fpack32	%f12,	%f20,	%f8
	ldd	[%l7 + 0x28],	%o6
	fmovrdgz	%l0,	%f30,	%f30
	movg	%icc,	%l3,	%i6
	edge16n	%o1,	%l5,	%g2
	ldsb	[%l7 + 0x21],	%i3
	lduh	[%l7 + 0x36],	%o5
	fmul8x16au	%f12,	%f22,	%f30
	alignaddr	%g7,	%i2,	%l1
	orcc	%o4,	%g6,	%i7
	std	%f10,	[%l7 + 0x68]
	sdivx	%o3,	0x1755,	%i1
	orncc	%l2,	0x17BB,	%g1
	movleu	%icc,	%o2,	%i5
	edge8l	%g3,	%o7,	%o0
	mova	%icc,	%l4,	%i0
	stw	%g5,	[%l7 + 0x34]
	fcmpeq16	%f8,	%f4,	%i4
	edge16l	%g4,	%l6,	%l0
	fxnor	%f2,	%f18,	%f24
	fnegs	%f0,	%f24
	andn	%l3,	0x0ECE,	%o6
	movneg	%icc,	%i6,	%o1
	udiv	%l5,	0x0727,	%i3
	srl	%g2,	0x06,	%o5
	fmovscc	%icc,	%f14,	%f27
	fornot2	%f8,	%f16,	%f14
	movcc	%icc,	%i2,	%g7
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%f24
	movcs	%xcc,	%o4,	%g6
	ldsw	[%l7 + 0x48],	%l1
	std	%f24,	[%l7 + 0x10]
	nop
	set	0x20, %i2
	std	%f26,	[%l7 + %i2]
	std	%f12,	[%l7 + 0x70]
	sir	0x146C
	edge32ln	%o3,	%i7,	%l2
	ldsb	[%l7 + 0x43],	%g1
	std	%f0,	[%l7 + 0x08]
	ldsh	[%l7 + 0x48],	%o2
	edge32	%i1,	%g3,	%i5
	array8	%o7,	%o0,	%i0
	ldsh	[%l7 + 0x36],	%g5
	fmovrslez	%l4,	%f0,	%f5
	fcmpeq32	%f12,	%f16,	%g4
	umul	%i4,	0x1288,	%l0
	fmul8sux16	%f16,	%f10,	%f20
	movrne	%l6,	0x358,	%l3
	movpos	%icc,	%i6,	%o1
	xnor	%l5,	0x1959,	%o6
	edge16	%i3,	%g2,	%i2
	movg	%icc,	%o5,	%g7
	fpadd32	%f16,	%f8,	%f28
	movrlez	%g6,	%o4,	%o3
	andncc	%i7,	%l1,	%l2
	movl	%icc,	%o2,	%i1
	fmovsn	%icc,	%f18,	%f18
	smul	%g3,	%i5,	%o7
	ldx	[%l7 + 0x20],	%o0
	movpos	%icc,	%g1,	%g5
	udivcc	%l4,	0x0C5C,	%g4
	movrgz	%i4,	0x0F0,	%i0
	move	%xcc,	%l6,	%l0
	fmovscs	%xcc,	%f14,	%f6
	fmovdge	%icc,	%f19,	%f6
	alignaddrl	%l3,	%o1,	%l5
	subc	%i6,	%o6,	%g2
	array8	%i2,	%i3,	%g7
	movvs	%xcc,	%o5,	%o4
	xnorcc	%o3,	%i7,	%g6
	xnor	%l2,	%l1,	%o2
	edge8n	%g3,	%i1,	%i5
	fand	%f30,	%f10,	%f30
	edge32	%o7,	%o0,	%g5
	fcmpd	%fcc2,	%f22,	%f26
	popc	%l4,	%g4
	save %i4, 0x0004, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f20,	%f30,	%l6
	or	%l0,	%l3,	%o1
	fmovdleu	%xcc,	%f7,	%f2
	edge32l	%l5,	%g1,	%i6
	edge32ln	%g2,	%o6,	%i2
	movvc	%icc,	%g7,	%o5
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	ldsb	[%l7 + 0x60],	%i7
	ldub	[%l7 + 0x5B],	%g6
	movrlz	%i3,	%l2,	%l1
	orncc	%g3,	%i1,	%o2
	fcmpeq32	%f8,	%f6,	%o7
	fmovrslez	%o0,	%f29,	%f15
	movcs	%xcc,	%i5,	%g5
	fmovdne	%icc,	%f25,	%f9
	ldd	[%l7 + 0x20],	%g4
	subcc	%l4,	%i4,	%i0
	orcc	%l0,	%l3,	%l6
	ldsh	[%l7 + 0x3C],	%l5
	orn	%g1,	0x01BB,	%o1
	sra	%i6,	%o6,	%g2
	xnor	%i2,	%o5,	%g7
	sdivx	%o4,	0x1714,	%i7
	ldsw	[%l7 + 0x30],	%o3
	fpadd32s	%f2,	%f31,	%f14
	edge32	%g6,	%l2,	%i3
	nop
	set	0x24, %g3
	ldsh	[%l7 + %g3],	%l1
	ldsh	[%l7 + 0x2C],	%g3
	edge8	%i1,	%o7,	%o0
	st	%f22,	[%l7 + 0x68]
	mova	%xcc,	%i5,	%o2
	alignaddrl	%g5,	%l4,	%i4
	sir	0x1273
	udivx	%g4,	0x064D,	%l0
	movneg	%icc,	%l3,	%i0
	sllx	%l5,	0x19,	%g1
	st	%f28,	[%l7 + 0x40]
	edge32ln	%l6,	%i6,	%o1
	edge16n	%g2,	%i2,	%o5
	fmovrsgez	%o6,	%f15,	%f19
	lduh	[%l7 + 0x70],	%o4
	subcc	%i7,	0x14C6,	%g7
	movl	%xcc,	%g6,	%o3
	srax	%i3,	%l1,	%l2
	movn	%icc,	%g3,	%o7
	mova	%icc,	%o0,	%i1
	array16	%o2,	%g5,	%i5
	array16	%i4,	%l4,	%g4
	popc	%l0,	%i0
	edge16	%l3,	%l5,	%g1
	sethi	0x030F,	%l6
	add	%i6,	0x0B73,	%o1
	or	%g2,	0x17D3,	%i2
	edge32	%o5,	%o6,	%i7
	edge8n	%g7,	%o4,	%o3
	movre	%i3,	0x00B,	%l1
	move	%xcc,	%l2,	%g3
	movgu	%xcc,	%o7,	%g6
	xnorcc	%o0,	0x141A,	%o2
	movge	%xcc,	%i1,	%i5
	sll	%g5,	%l4,	%g4
	ldd	[%l7 + 0x38],	%f16
	udiv	%i4,	0x1764,	%i0
	srax	%l3,	%l0,	%g1
	sllx	%l6,	%l5,	%i6
	sllx	%g2,	0x1F,	%i2
	addcc	%o5,	0x051E,	%o6
	stx	%i7,	[%l7 + 0x50]
	sra	%g7,	%o1,	%o4
	alignaddr	%i3,	%l1,	%o3
	alignaddrl	%g3,	%o7,	%g6
	xor	%o0,	%o2,	%i1
	alignaddrl	%i5,	%l2,	%l4
	srax	%g4,	0x05,	%g5
	array16	%i0,	%l3,	%i4
	mova	%icc,	%l0,	%l6
	movle	%xcc,	%g1,	%l5
	and	%g2,	%i6,	%o5
	fmuld8sux16	%f10,	%f10,	%f18
	subc	%o6,	%i7,	%g7
	orcc	%o1,	%o4,	%i3
	fmovdneg	%xcc,	%f1,	%f9
	edge32n	%i2,	%o3,	%g3
	fmovsneg	%icc,	%f13,	%f17
	array16	%o7,	%l1,	%o0
	ldd	[%l7 + 0x78],	%g6
	subccc	%i1,	%o2,	%l2
	addc	%i5,	0x1A97,	%g4
	ld	[%l7 + 0x10],	%f3
	fpsub32	%f8,	%f8,	%f12
	add	%g5,	%l4,	%l3
	edge32	%i4,	%i0,	%l6
	alignaddrl	%g1,	%l0,	%g2
	edge8l	%l5,	%o5,	%o6
	orcc	%i7,	%g7,	%o1
	ldsb	[%l7 + 0x16],	%o4
	movcc	%xcc,	%i3,	%i2
	movl	%icc,	%i6,	%o3
	fnegs	%f5,	%f29
	sth	%o7,	[%l7 + 0x7E]
	fcmple32	%f8,	%f12,	%g3
	movrlz	%l1,	%o0,	%g6
	edge32n	%i1,	%l2,	%i5
	andn	%o2,	%g5,	%l4
	for	%f30,	%f10,	%f8
	edge8l	%l3,	%g4,	%i0
	andn	%l6,	%i4,	%g1
	fcmps	%fcc1,	%f0,	%f21
	std	%f24,	[%l7 + 0x68]
	ldd	[%l7 + 0x68],	%f26
	movrgz	%l0,	0x0C4,	%l5
	edge32l	%o5,	%g2,	%o6
	fandnot2s	%f13,	%f13,	%f23
	edge8l	%g7,	%o1,	%o4
	subc	%i7,	%i3,	%i6
	fmovdg	%icc,	%f0,	%f25
	movvs	%icc,	%o3,	%i2
	sllx	%g3,	0x02,	%l1
	fmovrslz	%o7,	%f31,	%f4
	udiv	%g6,	0x1173,	%i1
	fpsub16s	%f23,	%f16,	%f11
	sra	%o0,	%l2,	%o2
	movge	%icc,	%i5,	%g5
	popc	0x08E6,	%l3
	andn	%l4,	0x03FD,	%g4
	movcs	%icc,	%l6,	%i0
	movcs	%icc,	%g1,	%l0
	array8	%l5,	%i4,	%o5
	edge16ln	%g2,	%g7,	%o6
	fcmped	%fcc2,	%f6,	%f20
	sdivx	%o4,	0x0C30,	%o1
	sllx	%i3,	0x11,	%i6
	movvc	%xcc,	%o3,	%i2
	orncc	%g3,	%i7,	%o7
	siam	0x7
	xnor	%l1,	0x1746,	%i1
	sdiv	%o0,	0x167F,	%g6
	movcc	%icc,	%o2,	%i5
	fpadd16s	%f31,	%f26,	%f5
	orn	%g5,	%l3,	%l4
	ld	[%l7 + 0x14],	%f16
	movrlez	%l2,	0x20A,	%g4
	xnorcc	%l6,	0x1598,	%g1
	movrgz	%i0,	%l5,	%l0
	fcmpd	%fcc0,	%f18,	%f14
	movpos	%icc,	%o5,	%i4
	fcmps	%fcc3,	%f5,	%f29
	sdivcc	%g7,	0x08E7,	%o6
	fnands	%f9,	%f26,	%f3
	save %o4, 0x0376, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i3,	%i6,	%g2
	movne	%icc,	%o3,	%i2
	fcmple32	%f30,	%f12,	%g3
	nop
	set	0x39, %i1
	ldub	[%l7 + %i1],	%o7
	movleu	%xcc,	%l1,	%i7
	ldsb	[%l7 + 0x53],	%i1
	sdivcc	%g6,	0x17F5,	%o2
	addccc	%i5,	0x0897,	%o0
	xnor	%l3,	0x0273,	%l4
	movvs	%icc,	%g5,	%l2
	umulcc	%l6,	0x108B,	%g4
	addcc	%i0,	0x19A2,	%l5
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%f24
	array16	%l0,	%g1,	%o5
	fmovsleu	%icc,	%f8,	%f15
	xnorcc	%i4,	0x19BA,	%g7
	ldsh	[%l7 + 0x1A],	%o6
	edge32ln	%o1,	%o4,	%i3
	andncc	%i6,	%o3,	%g2
	fmovsleu	%xcc,	%f12,	%f31
	movrne	%i2,	%o7,	%l1
	addc	%g3,	%i7,	%g6
	bshuffle	%f24,	%f20,	%f16
	movrgez	%i1,	0x0DE,	%o2
	sll	%o0,	%l3,	%l4
	movcc	%icc,	%i5,	%l2
	fand	%f2,	%f22,	%f20
	and	%g5,	0x0847,	%g4
	mulscc	%l6,	0x0E9C,	%i0
	movne	%icc,	%l5,	%g1
	edge8n	%o5,	%l0,	%i4
	fmovdge	%icc,	%f0,	%f9
	umulcc	%o6,	0x0CDB,	%g7
	lduw	[%l7 + 0x6C],	%o1
	ldx	[%l7 + 0x28],	%i3
	ldx	[%l7 + 0x58],	%i6
	fxors	%f29,	%f21,	%f20
	array16	%o3,	%o4,	%g2
	sethi	0x00D6,	%o7
	movrlz	%l1,	%i2,	%g3
	std	%f2,	[%l7 + 0x78]
	sdivx	%i7,	0x1687,	%g6
	edge8	%i1,	%o0,	%l3
	fcmpgt32	%f8,	%f2,	%o2
	fmuld8ulx16	%f19,	%f1,	%f2
	stb	%l4,	[%l7 + 0x29]
	sdivcc	%i5,	0x165B,	%l2
	edge16n	%g5,	%g4,	%i0
	stw	%l6,	[%l7 + 0x30]
	fmovrsne	%g1,	%f8,	%f23
	srl	%o5,	%l5,	%l0
	movrgz	%i4,	%g7,	%o6
	mulscc	%o1,	%i6,	%o3
	fornot1s	%f10,	%f18,	%f11
	ldd	[%l7 + 0x78],	%f4
	mulx	%o4,	0x0F1C,	%g2
	edge16ln	%i3,	%o7,	%i2
	nop
	set	0x18, %o2
	sth	%l1,	[%l7 + %o2]
	movge	%xcc,	%i7,	%g6
	fsrc1	%f22,	%f10
	fabss	%f6,	%f23
	movcs	%icc,	%g3,	%i1
	sub	%l3,	0x1BBD,	%o2
	sdivcc	%l4,	0x0716,	%i5
	movl	%xcc,	%l2,	%g5
	udiv	%g4,	0x0805,	%o0
	edge16n	%i0,	%g1,	%o5
	fmovrsgz	%l6,	%f20,	%f0
	fsrc2	%f6,	%f8
	umulcc	%l5,	%i4,	%l0
	udiv	%g7,	0x0490,	%o1
	stx	%o6,	[%l7 + 0x18]
	addc	%i6,	%o3,	%g2
	fmovscs	%xcc,	%f30,	%f28
	ldsb	[%l7 + 0x0D],	%o4
	andncc	%o7,	%i2,	%l1
	st	%f22,	[%l7 + 0x18]
	xor	%i3,	%g6,	%g3
	fpmerge	%f19,	%f24,	%f10
	andcc	%i1,	%i7,	%o2
	sllx	%l3,	%l4,	%i5
	movleu	%xcc,	%g5,	%g4
	movrlez	%o0,	%l2,	%g1
	and	%o5,	0x0DC0,	%l6
	movvc	%xcc,	%i0,	%i4
	ldd	[%l7 + 0x10],	%l4
	nop
	set	0x40, %g5
	ldsh	[%l7 + %g5],	%l0
	movrgz	%o1,	0x0AA,	%g7
	srax	%i6,	%o3,	%o6
	popc	0x065A,	%g2
	stx	%o7,	[%l7 + 0x68]
	fmovrdgz	%i2,	%f30,	%f20
	sdivcc	%o4,	0x04CA,	%l1
	udiv	%g6,	0x001C,	%i3
	movrlez	%g3,	%i7,	%i1
	movl	%icc,	%o2,	%l4
	movrne	%i5,	%g5,	%g4
	movgu	%icc,	%o0,	%l2
	fmul8sux16	%f28,	%f14,	%f8
	srlx	%l3,	0x02,	%o5
	sth	%g1,	[%l7 + 0x2C]
	edge16	%i0,	%i4,	%l5
	nop
	set	0x60, %g1
	ldsw	[%l7 + %g1],	%l0
	mova	%icc,	%l6,	%g7
	fxnors	%f23,	%f19,	%f26
	movleu	%xcc,	%i6,	%o3
	fnot1s	%f31,	%f11
	lduw	[%l7 + 0x4C],	%o1
	addc	%o6,	%g2,	%i2
	andncc	%o4,	%l1,	%g6
	fmovda	%icc,	%f18,	%f27
	alignaddrl	%o7,	%g3,	%i7
	mulx	%i1,	0x1437,	%i3
	fmovdgu	%icc,	%f4,	%f18
	udivx	%o2,	0x12AB,	%i5
	fsrc2	%f6,	%f14
	and	%g5,	%l4,	%g4
	ldsh	[%l7 + 0x76],	%o0
	sethi	0x1069,	%l2
	fmovdg	%xcc,	%f23,	%f29
	ldsb	[%l7 + 0x2B],	%o5
	std	%f26,	[%l7 + 0x40]
	alignaddr	%l3,	%g1,	%i4
	sdiv	%i0,	0x0246,	%l5
	edge8n	%l6,	%g7,	%l0
	popc	%i6,	%o3
	movpos	%xcc,	%o1,	%o6
	smulcc	%i2,	0x1507,	%g2
	xorcc	%o4,	%l1,	%o7
	for	%f12,	%f12,	%f10
	restore %g6, 0x0524, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x0C],	%f22
	sdiv	%i1,	0x1037,	%i3
	subc	%i7,	%o2,	%g5
	mulscc	%i5,	0x1D1F,	%g4
	addc	%l4,	%o0,	%o5
	array16	%l2,	%g1,	%i4
	sdivcc	%l3,	0x0FEB,	%l5
	for	%f28,	%f22,	%f24
	fmovsge	%xcc,	%f26,	%f17
	nop
	set	0x10, %o3
	std	%f8,	[%l7 + %o3]
	udivcc	%l6,	0x180D,	%i0
	alignaddrl	%l0,	%g7,	%o3
	fabss	%f24,	%f20
	lduw	[%l7 + 0x60],	%o1
	udiv	%o6,	0x1B99,	%i6
	addcc	%i2,	%o4,	%l1
	srax	%g2,	%g6,	%o7
	movn	%xcc,	%i1,	%i3
	ld	[%l7 + 0x6C],	%f9
	nop
	set	0x24, %i3
	sth	%g3,	[%l7 + %i3]
	fone	%f0
	movgu	%xcc,	%i7,	%o2
	ldx	[%l7 + 0x70],	%g5
	edge16ln	%i5,	%l4,	%g4
	andncc	%o5,	%o0,	%g1
	udivx	%i4,	0x00E4,	%l3
	edge16	%l5,	%l2,	%l6
	array16	%i0,	%l0,	%g7
	orcc	%o1,	%o6,	%i6
	fzeros	%f29
	sethi	0x08AA,	%o3
	movrgz	%o4,	0x372,	%i2
	movneg	%icc,	%l1,	%g6
	for	%f26,	%f4,	%f2
	movrgez	%o7,	0x09B,	%g2
	mulscc	%i1,	0x06D0,	%g3
	sra	%i3,	%i7,	%g5
	fnor	%f0,	%f6,	%f24
	movge	%icc,	%o2,	%l4
	array16	%g4,	%o5,	%o0
	sllx	%g1,	0x1A,	%i5
	ldsw	[%l7 + 0x1C],	%l3
	fcmps	%fcc0,	%f24,	%f30
	movneg	%xcc,	%i4,	%l2
	fmovdne	%icc,	%f9,	%f15
	edge32n	%l5,	%l6,	%i0
	stb	%l0,	[%l7 + 0x3A]
	movrne	%g7,	0x146,	%o1
	ldsb	[%l7 + 0x49],	%o6
	nop
	set	0x10, %l2
	lduw	[%l7 + %l2],	%i6
	mulx	%o3,	0x1945,	%i2
	fcmped	%fcc0,	%f28,	%f6
	fmovrdgez	%l1,	%f14,	%f10
	move	%icc,	%o4,	%o7
	edge32n	%g6,	%g2,	%g3
	sir	0x1F7F
	movl	%icc,	%i3,	%i1
	and	%g5,	%i7,	%l4
	movleu	%xcc,	%g4,	%o2
	andn	%o0,	0x0F48,	%g1
	or	%i5,	0x0732,	%o5
	ldd	[%l7 + 0x68],	%l2
	movn	%icc,	%l2,	%l5
	fcmpne16	%f28,	%f24,	%l6
	popc	0x11E6,	%i4
	subccc	%l0,	0x121C,	%g7
	edge32ln	%o1,	%o6,	%i6
	array8	%o3,	%i2,	%l1
	mulx	%i0,	0x1620,	%o7
	movn	%xcc,	%o4,	%g6
	mova	%xcc,	%g2,	%g3
	udiv	%i3,	0x1833,	%g5
	lduw	[%l7 + 0x14],	%i1
	stw	%l4,	[%l7 + 0x60]
	orn	%i7,	%g4,	%o0
	pdist	%f6,	%f14,	%f16
	srlx	%g1,	0x0E,	%i5
	fmul8ulx16	%f18,	%f16,	%f30
	fmovsvc	%xcc,	%f13,	%f24
	fmul8sux16	%f16,	%f6,	%f10
	umulcc	%o5,	0x1B38,	%l3
	fors	%f2,	%f15,	%f1
	fmovsn	%icc,	%f22,	%f14
	fmovrse	%l2,	%f25,	%f24
	srax	%l5,	0x14,	%o2
	move	%xcc,	%i4,	%l6
	sth	%l0,	[%l7 + 0x58]
	fpsub16s	%f18,	%f26,	%f16
	nop
	set	0x50, %l1
	stx	%o1,	[%l7 + %l1]
	ldx	[%l7 + 0x20],	%o6
	movn	%icc,	%g7,	%o3
	fpadd32s	%f10,	%f2,	%f2
	sra	%i6,	%i2,	%l1
	movge	%xcc,	%o7,	%i0
	xor	%o4,	%g2,	%g3
	mulscc	%i3,	%g6,	%g5
	ldx	[%l7 + 0x18],	%l4
	xnorcc	%i1,	0x1120,	%g4
	fpadd16s	%f24,	%f30,	%f17
	movvs	%xcc,	%i7,	%g1
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%o0
	edge8	%o5,	%l3,	%i5
	xnorcc	%l2,	%o2,	%l5
	movvc	%icc,	%l6,	%l0
	movge	%icc,	%i4,	%o6
	udivx	%g7,	0x0F93,	%o3
	srl	%o1,	%i2,	%i6
	xnor	%l1,	0x1F69,	%o7
	subccc	%o4,	%g2,	%g3
	sllx	%i0,	%i3,	%g6
	movvs	%xcc,	%g5,	%l4
	ldsb	[%l7 + 0x31],	%g4
	srax	%i1,	0x04,	%i7
	ldx	[%l7 + 0x60],	%g1
	movl	%icc,	%o0,	%l3
	sdivcc	%o5,	0x0845,	%l2
	sll	%i5,	%l5,	%o2
	fmovs	%f29,	%f9
	sir	0x054C
	fxor	%f30,	%f30,	%f20
	fand	%f26,	%f24,	%f26
	fmovde	%icc,	%f30,	%f22
	movcs	%xcc,	%l0,	%i4
	edge32ln	%l6,	%g7,	%o3
	edge8ln	%o1,	%i2,	%i6
	xorcc	%o6,	%l1,	%o7
	addc	%g2,	0x08BB,	%o4
	stx	%g3,	[%l7 + 0x50]
	srl	%i0,	0x01,	%g6
	fsrc2s	%f9,	%f13
	array16	%g5,	%l4,	%i3
	ldd	[%l7 + 0x50],	%f18
	fmul8sux16	%f30,	%f18,	%f12
	edge32l	%i1,	%g4,	%g1
	umul	%i7,	0x108A,	%l3
	movvc	%xcc,	%o5,	%o0
	movrlz	%i5,	%l2,	%l5
	addc	%l0,	0x0331,	%i4
	sth	%l6,	[%l7 + 0x54]
	movl	%icc,	%o2,	%g7
	movcs	%icc,	%o3,	%o1
	umulcc	%i6,	0x1040,	%i2
	movg	%icc,	%l1,	%o6
	array16	%o7,	%o4,	%g3
	fnot2s	%f26,	%f18
	edge8	%i0,	%g2,	%g6
	sdivcc	%g5,	0x08D7,	%l4
	sra	%i1,	0x0B,	%g4
	smul	%g1,	0x0F8D,	%i7
	st	%f15,	[%l7 + 0x58]
	sra	%l3,	0x1D,	%o5
	ld	[%l7 + 0x38],	%f7
	movge	%icc,	%i3,	%o0
	srax	%i5,	%l5,	%l0
	addc	%i4,	0x0C01,	%l2
	edge32l	%l6,	%g7,	%o2
	srlx	%o1,	%i6,	%i2
	lduh	[%l7 + 0x40],	%o3
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	edge32ln	%o4,	%o6,	%g3
	addc	%g2,	0x00D4,	%g6
	sdivcc	%i0,	0x058B,	%g5
	subccc	%i1,	0x0B74,	%g4
	subcc	%g1,	%i7,	%l4
	alignaddr	%o5,	%i3,	%o0
	fcmpd	%fcc0,	%f24,	%f6
	stw	%l3,	[%l7 + 0x60]
	sll	%i5,	0x16,	%l5
	ldub	[%l7 + 0x5D],	%l0
	orcc	%i4,	%l6,	%l2
	orn	%g7,	%o2,	%o1
	edge16ln	%i6,	%o3,	%l1
	movgu	%icc,	%i2,	%o4
	edge16	%o6,	%o7,	%g2
	ldsw	[%l7 + 0x44],	%g6
	movgu	%xcc,	%i0,	%g3
	stx	%i1,	[%l7 + 0x08]
	and	%g4,	%g5,	%i7
	srl	%l4,	0x1F,	%g1
	fxnors	%f22,	%f25,	%f6
	edge16	%o5,	%i3,	%l3
	movvc	%icc,	%o0,	%l5
	movrgz	%i5,	0x090,	%i4
	ldd	[%l7 + 0x70],	%i6
	movrlez	%l2,	%g7,	%l0
	fmul8ulx16	%f8,	%f20,	%f14
	subcc	%o2,	%i6,	%o3
	fand	%f16,	%f4,	%f24
	sth	%l1,	[%l7 + 0x0C]
	srlx	%i2,	0x13,	%o1
	srlx	%o4,	0x0B,	%o6
	movn	%xcc,	%o7,	%g6
	edge8	%g2,	%g3,	%i0
	movn	%xcc,	%g4,	%g5
	fmovdge	%xcc,	%f13,	%f10
	sethi	0x1FF4,	%i7
	sth	%l4,	[%l7 + 0x3C]
	movrlez	%i1,	%o5,	%i3
	orcc	%g1,	0x1ADC,	%o0
	bshuffle	%f24,	%f14,	%f10
	movn	%icc,	%l5,	%l3
	sub	%i5,	0x06F7,	%l6
	xorcc	%l2,	%g7,	%i4
	sdivx	%o2,	0x1F13,	%l0
	fmovdcs	%icc,	%f18,	%f24
	edge16l	%i6,	%l1,	%i2
	array8	%o3,	%o1,	%o6
	edge8n	%o7,	%g6,	%g2
	fsrc1s	%f28,	%f1
	movcs	%xcc,	%o4,	%g3
	movleu	%icc,	%g4,	%g5
	restore %i7, 0x0C77, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x40],	%i0
	movne	%xcc,	%l4,	%o5
	edge16l	%g1,	%i3,	%o0
	lduh	[%l7 + 0x1E],	%l5
	movl	%icc,	%i5,	%l6
	smulcc	%l2,	0x1D8D,	%g7
	umulcc	%i4,	0x04F8,	%l3
	edge16n	%o2,	%i6,	%l1
	fpmerge	%f22,	%f13,	%f22
	array8	%i2,	%l0,	%o3
	sethi	0x163A,	%o1
	ldsw	[%l7 + 0x38],	%o7
	umul	%o6,	0x1987,	%g2
	alignaddr	%g6,	%g3,	%g4
	fcmpgt32	%f10,	%f22,	%o4
	umul	%g5,	0x0B62,	%i7
	srlx	%i0,	0x12,	%l4
	fcmpeq16	%f28,	%f14,	%o5
	udiv	%i1,	0x060D,	%g1
	udivcc	%i3,	0x16C2,	%l5
	umul	%o0,	0x03BF,	%l6
	sub	%l2,	%i5,	%i4
	movge	%icc,	%g7,	%l3
	add	%i6,	%l1,	%o2
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	movge	%xcc,	%o1,	%o7
	movl	%icc,	%g2,	%o6
	alignaddr	%g6,	%g3,	%g4
	andn	%o4,	%i7,	%i0
	movrgz	%g5,	%l4,	%o5
	popc	%g1,	%i1
	edge16l	%l5,	%o0,	%i3
	stx	%l6,	[%l7 + 0x38]
	fmovd	%f8,	%f30
	movg	%xcc,	%i5,	%i4
	sth	%l2,	[%l7 + 0x28]
	sethi	0x0984,	%g7
	edge16n	%i6,	%l3,	%l1
	movrgez	%l0,	%o2,	%i2
	sra	%o3,	%o1,	%o7
	add	%o6,	0x1354,	%g2
	alignaddrl	%g6,	%g4,	%g3
	subc	%o4,	0x12CE,	%i0
	fmovdle	%xcc,	%f19,	%f9
	movcs	%xcc,	%g5,	%l4
	movcs	%icc,	%i7,	%g1
	smulcc	%o5,	%i1,	%o0
	or	%i3,	%l5,	%l6
	popc	%i5,	%l2
	sub	%i4,	%i6,	%g7
	andcc	%l3,	0x1094,	%l1
	edge8ln	%l0,	%i2,	%o2
	orn	%o3,	0x0381,	%o1
	smul	%o7,	%g2,	%g6
	andcc	%o6,	%g4,	%g3
	fnot1s	%f21,	%f17
	nop
	set	0x19, %o0
	stb	%i0,	[%l7 + %o0]
	array8	%g5,	%o4,	%i7
	edge8ln	%g1,	%o5,	%l4
	addc	%o0,	0x0989,	%i1
	ldx	[%l7 + 0x18],	%l5
	add	%l6,	%i3,	%i5
	orncc	%i4,	%i6,	%g7
	fmul8x16au	%f2,	%f16,	%f8
	movvc	%xcc,	%l3,	%l1
	edge8ln	%l0,	%i2,	%l2
	movgu	%xcc,	%o2,	%o3
	fmovdle	%xcc,	%f16,	%f27
	movpos	%xcc,	%o1,	%o7
	udiv	%g2,	0x064A,	%o6
	fpadd32s	%f12,	%f6,	%f24
	fcmpgt32	%f16,	%f26,	%g4
	fmovdvs	%icc,	%f30,	%f9
	stb	%g3,	[%l7 + 0x63]
	sth	%i0,	[%l7 + 0x6C]
	movpos	%icc,	%g5,	%o4
	movcc	%xcc,	%i7,	%g6
	xnor	%g1,	0x14B1,	%l4
	movl	%icc,	%o0,	%i1
	st	%f8,	[%l7 + 0x74]
	faligndata	%f6,	%f10,	%f8
	movneg	%xcc,	%l5,	%o5
	orn	%l6,	0x1F46,	%i3
	alignaddrl	%i5,	%i6,	%i4
	fmovrde	%l3,	%f22,	%f8
	movge	%icc,	%g7,	%l0
	movcs	%icc,	%i2,	%l2
	movpos	%xcc,	%l1,	%o2
	orncc	%o1,	0x0AF7,	%o7
	alignaddr	%o3,	%o6,	%g4
	array16	%g3,	%i0,	%g2
	fandnot1s	%f26,	%f21,	%f28
	edge16l	%o4,	%g5,	%i7
	udiv	%g1,	0x0156,	%l4
	ldd	[%l7 + 0x40],	%g6
	andcc	%i1,	%o0,	%l5
	movneg	%icc,	%l6,	%i3
	movrlz	%o5,	%i5,	%i6
	move	%icc,	%l3,	%i4
	nop
	set	0x79, %l0
	stb	%g7,	[%l7 + %l0]
	movcc	%xcc,	%i2,	%l2
	sll	%l1,	0x14,	%l0
	fmovsn	%xcc,	%f11,	%f28
	subcc	%o2,	%o1,	%o7
	fmovdcs	%icc,	%f27,	%f2
	sdivx	%o3,	0x1FC0,	%g4
	srlx	%o6,	0x11,	%i0
	stb	%g2,	[%l7 + 0x12]
	fpadd32	%f30,	%f28,	%f14
	movrgez	%g3,	%g5,	%i7
	subccc	%g1,	0x1590,	%o4
	subcc	%g6,	0x0568,	%l4
	srlx	%i1,	%o0,	%l6
	fpadd16	%f22,	%f2,	%f10
	fcmple32	%f28,	%f26,	%l5
	subccc	%i3,	0x0718,	%o5
	for	%f18,	%f8,	%f10
	mulscc	%i5,	%l3,	%i4
	movrgez	%i6,	0x39A,	%i2
	movcs	%xcc,	%l2,	%l1
	edge8l	%g7,	%l0,	%o2
	srlx	%o1,	0x1C,	%o7
	xor	%g4,	0x0249,	%o6
	subcc	%i0,	%g2,	%g3
	fandnot1	%f26,	%f2,	%f6
	restore %g5, %i7, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o4,	%o3,	%l4
	or	%g6,	0x07FF,	%i1
	sethi	0x1B1D,	%o0
	movgu	%icc,	%l5,	%i3
	movrgz	%l6,	0x38C,	%o5
	edge16l	%i5,	%i4,	%l3
	fmovrde	%i2,	%f4,	%f2
	fmovrde	%l2,	%f28,	%f28
	xnorcc	%i6,	%l1,	%g7
	addc	%l0,	0x1D2A,	%o1
	movneg	%xcc,	%o7,	%o2
	fcmpgt16	%f18,	%f30,	%o6
	fmovdneg	%icc,	%f13,	%f22
	movvs	%icc,	%g4,	%i0
	udivcc	%g3,	0x173D,	%g2
	orncc	%i7,	%g5,	%g1
	fcmpeq16	%f10,	%f8,	%o4
	movne	%xcc,	%l4,	%o3
	addccc	%g6,	0x05E0,	%o0
	xnorcc	%i1,	%l5,	%l6
	sir	0x0D22
	andn	%o5,	%i3,	%i5
	edge16ln	%i4,	%l3,	%l2
	fandnot2	%f16,	%f30,	%f16
	movneg	%icc,	%i6,	%l1
	fandnot1s	%f16,	%f15,	%f30
	movpos	%xcc,	%g7,	%i2
	ldd	[%l7 + 0x48],	%f26
	edge32n	%l0,	%o7,	%o1
	umulcc	%o2,	0x078B,	%o6
	umulcc	%i0,	%g4,	%g3
	array32	%i7,	%g2,	%g5
	alignaddrl	%g1,	%o4,	%o3
	fmovs	%f24,	%f26
	fcmps	%fcc0,	%f16,	%f21
	andcc	%g6,	%o0,	%l4
	movg	%xcc,	%i1,	%l6
	movgu	%xcc,	%o5,	%l5
	movl	%xcc,	%i5,	%i3
	movg	%icc,	%i4,	%l3
	ldsh	[%l7 + 0x36],	%l2
	fmul8sux16	%f28,	%f26,	%f10
	fpsub16s	%f10,	%f14,	%f2
	fmovrslez	%i6,	%f16,	%f25
	edge16	%l1,	%g7,	%l0
	movle	%xcc,	%o7,	%i2
	andcc	%o2,	%o1,	%o6
	srl	%g4,	0x18,	%g3
	edge32n	%i0,	%i7,	%g2
	fornot1	%f8,	%f8,	%f30
	movrlz	%g1,	0x3BB,	%g5
	lduh	[%l7 + 0x26],	%o4
	fmovdgu	%xcc,	%f21,	%f14
	edge32ln	%g6,	%o3,	%o0
	fone	%f8
	subc	%i1,	0x112E,	%l6
	fcmpeq16	%f14,	%f16,	%o5
	andcc	%l5,	0x07DA,	%l4
	movleu	%xcc,	%i3,	%i5
	edge16n	%i4,	%l3,	%i6
	sir	0x0081
	save %l2, %g7, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	edge32ln	%i2,	%o6,	%g4
	ldub	[%l7 + 0x42],	%g3
	fcmple16	%f12,	%f24,	%o1
	udivx	%i0,	0x0802,	%i7
	movne	%xcc,	%g2,	%g1
	edge8l	%o4,	%g5,	%o3
	fmovdgu	%xcc,	%f22,	%f24
	fornot1s	%f18,	%f15,	%f24
	sdiv	%g6,	0x022F,	%o0
	movrgez	%l6,	0x20F,	%i1
	array8	%o5,	%l4,	%i3
	stb	%i5,	[%l7 + 0x45]
	edge8l	%i4,	%l5,	%l3
	fmul8sux16	%f10,	%f16,	%f8
	xorcc	%l2,	%g7,	%l0
	subccc	%l1,	0x0FEE,	%o7
	srlx	%o2,	%i6,	%i2
	fandnot2s	%f22,	%f26,	%f4
	srl	%o6,	%g3,	%g4
	sir	0x1EBD
	movvs	%icc,	%o1,	%i0
	save %g2, 0x1895, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f29,	%f4,	%f0
	alignaddr	%o4,	%i7,	%g5
	udivcc	%g6,	0x0687,	%o0
	movcs	%xcc,	%l6,	%o3
	edge16ln	%i1,	%l4,	%o5
	sdivx	%i3,	0x1C88,	%i5
	and	%i4,	0x17C9,	%l3
	movge	%icc,	%l5,	%l2
	sdiv	%l0,	0x141A,	%g7
	ldd	[%l7 + 0x20],	%l0
	addccc	%o7,	%o2,	%i6
	ldx	[%l7 + 0x28],	%i2
	movge	%icc,	%o6,	%g4
	edge16	%g3,	%i0,	%g2
	edge32ln	%o1,	%g1,	%i7
	fpackfix	%f18,	%f18
	orcc	%o4,	%g5,	%o0
	fmovrdgez	%l6,	%f6,	%f22
	movvs	%xcc,	%g6,	%o3
	edge16ln	%i1,	%o5,	%l4
	fcmpeq16	%f30,	%f18,	%i3
	fmovsvs	%xcc,	%f16,	%f26
	srl	%i5,	%l3,	%l5
	fmovdg	%icc,	%f24,	%f20
	nop
	set	0x72, %g4
	lduh	[%l7 + %g4],	%l2
	fmul8sux16	%f22,	%f30,	%f18
	ldsw	[%l7 + 0x48],	%i4
	sra	%l0,	%g7,	%l1
	fnot1s	%f16,	%f7
	edge32	%o2,	%o7,	%i2
	fmovsg	%icc,	%f19,	%f7
	alignaddr	%i6,	%g4,	%g3
	sllx	%o6,	0x18,	%g2
	xor	%i0,	0x02D0,	%o1
	movrlz	%g1,	0x027,	%i7
	fmovde	%xcc,	%f31,	%f29
	andcc	%g5,	0x0E85,	%o4
	add	%o0,	%l6,	%g6
	addc	%i1,	%o3,	%o5
	ldx	[%l7 + 0x28],	%l4
	sra	%i3,	%i5,	%l3
	fmovrsgz	%l5,	%f16,	%f25
	ld	[%l7 + 0x68],	%f25
	stb	%l2,	[%l7 + 0x7E]
	umulcc	%l0,	0x0923,	%i4
	alignaddrl	%g7,	%l1,	%o7
	stb	%o2,	[%l7 + 0x7B]
	fpsub32s	%f21,	%f19,	%f14
	addccc	%i6,	%i2,	%g3
	lduw	[%l7 + 0x44],	%g4
	fmovse	%icc,	%f31,	%f16
	mulx	%g2,	0x081C,	%i0
	edge32ln	%o1,	%g1,	%o6
	fmovspos	%icc,	%f22,	%f27
	edge16ln	%i7,	%o4,	%g5
	smul	%o0,	0x061A,	%g6
	movrne	%i1,	%l6,	%o3
	fcmpeq32	%f0,	%f4,	%l4
	fandnot2	%f0,	%f10,	%f2
	fcmpes	%fcc1,	%f21,	%f24
	edge16ln	%i3,	%i5,	%o5
	st	%f26,	[%l7 + 0x14]
	edge8l	%l5,	%l3,	%l2
	xor	%i4,	0x0245,	%g7
	smulcc	%l0,	0x02F7,	%l1
	xnor	%o2,	0x15B8,	%o7
	srl	%i2,	%g3,	%i6
	fpadd16	%f0,	%f18,	%f14
	movcs	%xcc,	%g4,	%g2
	edge16n	%i0,	%g1,	%o1
	xnor	%o6,	0x1A9C,	%i7
	array8	%g5,	%o0,	%g6
	sir	0x1657
	orn	%i1,	%o4,	%l6
	restore %o3, %i3, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x18],	%f4
	movleu	%xcc,	%l4,	%o5
	movrgz	%l5,	%l2,	%i4
	umul	%l3,	0x0841,	%l0
	ldub	[%l7 + 0x36],	%g7
	subc	%o2,	0x1216,	%o7
	sir	0x1CC7
	ldsb	[%l7 + 0x65],	%l1
	fpadd32	%f8,	%f20,	%f22
	popc	%g3,	%i6
	ldub	[%l7 + 0x2E],	%i2
	std	%f14,	[%l7 + 0x60]
	lduh	[%l7 + 0x5E],	%g2
	edge8	%g4,	%i0,	%g1
	subcc	%o1,	%o6,	%i7
	array32	%o0,	%g6,	%g5
	udiv	%o4,	0x1717,	%i1
	subc	%l6,	%o3,	%i5
	edge8n	%l4,	%i3,	%o5
	edge8ln	%l2,	%i4,	%l5
	stb	%l3,	[%l7 + 0x38]
	edge32ln	%g7,	%l0,	%o7
	movrlz	%l1,	0x19B,	%g3
	sub	%i6,	0x1084,	%i2
	fmovdl	%icc,	%f25,	%f22
	movrgz	%g2,	0x354,	%o2
	srlx	%g4,	0x18,	%g1
	umulcc	%o1,	0x140B,	%i0
	subcc	%o6,	0x0A16,	%o0
	udivx	%i7,	0x01D8,	%g6
	ldx	[%l7 + 0x10],	%g5
	fxor	%f24,	%f24,	%f18
	ldub	[%l7 + 0x3E],	%o4
	array16	%l6,	%o3,	%i5
	fmovrdlz	%l4,	%f10,	%f26
	movrlz	%i1,	%i3,	%o5
	ldub	[%l7 + 0x58],	%i4
	movgu	%xcc,	%l2,	%l3
	sllx	%l5,	%g7,	%o7
	udivx	%l1,	0x1DC2,	%g3
	array8	%l0,	%i6,	%i2
	ldub	[%l7 + 0x75],	%o2
	subc	%g2,	%g4,	%o1
	movpos	%xcc,	%g1,	%i0
	fmovdl	%xcc,	%f7,	%f11
	stw	%o6,	[%l7 + 0x70]
	st	%f11,	[%l7 + 0x40]
	fcmpgt32	%f12,	%f20,	%i7
	fpsub16	%f24,	%f30,	%f6
	fxor	%f30,	%f28,	%f10
	sllx	%g6,	%o0,	%g5
	fmovscs	%xcc,	%f31,	%f12
	udiv	%l6,	0x116C,	%o4
	mulx	%o3,	0x01B9,	%l4
	movrlez	%i1,	0x004,	%i5
	popc	0x01A1,	%i3
	orcc	%i4,	%o5,	%l2
	srlx	%l5,	%l3,	%o7
	addc	%l1,	0x11B2,	%g7
	nop
	set	0x12, %l6
	ldub	[%l7 + %l6],	%g3
	movcc	%icc,	%i6,	%i2
	edge32n	%l0,	%g2,	%o2
	fmovscs	%xcc,	%f12,	%f28
	fpackfix	%f6,	%f3
	fcmpes	%fcc2,	%f0,	%f20
	movle	%xcc,	%o1,	%g4
	addc	%g1,	0x03EF,	%i0
	movneg	%xcc,	%i7,	%g6
	fmul8x16	%f28,	%f10,	%f22
	movcs	%xcc,	%o6,	%o0
	alignaddrl	%l6,	%g5,	%o4
	edge16ln	%l4,	%o3,	%i1
	ldd	[%l7 + 0x58],	%f26
	lduw	[%l7 + 0x44],	%i3
	edge16l	%i5,	%i4,	%o5
	sir	0x1101
	array32	%l2,	%l3,	%l5
	fandnot2s	%f27,	%f2,	%f24
	addc	%l1,	%g7,	%o7
	movpos	%xcc,	%g3,	%i2
	ldd	[%l7 + 0x28],	%f26
	xnor	%l0,	%g2,	%o2
	fone	%f2
	movrgz	%i6,	%o1,	%g4
	array16	%i0,	%g1,	%g6
	orcc	%o6,	0x12DC,	%i7
	movrgez	%o0,	%g5,	%l6
	mulx	%l4,	0x1E40,	%o3
	fmovde	%xcc,	%f12,	%f25
	srl	%o4,	0x02,	%i3
	nop
	set	0x54, %i4
	ldsw	[%l7 + %i4],	%i5
	edge32ln	%i1,	%i4,	%l2
	alignaddrl	%l3,	%l5,	%o5
	udiv	%g7,	0x0BF1,	%l1
	movg	%icc,	%o7,	%i2
	sra	%l0,	0x0A,	%g2
	orn	%g3,	0x0281,	%o2
	fmul8ulx16	%f12,	%f26,	%f4
	mova	%xcc,	%o1,	%g4
	edge16l	%i6,	%g1,	%i0
	fpsub32s	%f0,	%f31,	%f15
	array8	%g6,	%o6,	%i7
	fands	%f13,	%f29,	%f31
	edge16ln	%g5,	%l6,	%o0
	edge16l	%o3,	%l4,	%i3
	fmovdneg	%xcc,	%f19,	%f16
	movcc	%icc,	%o4,	%i5
	edge8	%i4,	%i1,	%l3
	xnor	%l5,	0x0308,	%o5
	movne	%xcc,	%l2,	%l1
	fpackfix	%f20,	%f9
	sdivx	%o7,	0x09E1,	%g7
	subc	%l0,	0x1190,	%g2
	alignaddrl	%i2,	%o2,	%o1
	edge8l	%g4,	%g3,	%i6
	udiv	%g1,	0x1B24,	%g6
	xorcc	%i0,	%o6,	%g5
	sir	0x1F1C
	sir	0x1718
	fxors	%f13,	%f30,	%f15
	edge8n	%l6,	%o0,	%i7
	mulscc	%l4,	%i3,	%o3
	fpadd32	%f12,	%f30,	%f16
	fandnot2	%f2,	%f12,	%f0
	fnot1s	%f8,	%f31
	movrne	%i5,	%o4,	%i1
	array8	%i4,	%l3,	%l5
	mulx	%l2,	%l1,	%o7
	fmovsg	%xcc,	%f27,	%f14
	mova	%icc,	%o5,	%l0
	addccc	%g2,	%g7,	%i2
	fmovsa	%icc,	%f17,	%f21
	ldsh	[%l7 + 0x50],	%o1
	mulx	%o2,	%g4,	%i6
	movne	%icc,	%g3,	%g1
	movne	%icc,	%i0,	%o6
	fmovrdgez	%g6,	%f18,	%f30
	mova	%xcc,	%g5,	%l6
	fpadd32	%f24,	%f28,	%f12
	fones	%f1
	andcc	%o0,	%l4,	%i7
	edge8n	%i3,	%i5,	%o3
	alignaddr	%o4,	%i1,	%l3
	faligndata	%f4,	%f16,	%f8
	ldub	[%l7 + 0x58],	%i4
	orn	%l5,	%l2,	%l1
	xorcc	%o7,	%o5,	%l0
	fpadd32	%f28,	%f12,	%f24
	fmovsvc	%icc,	%f29,	%f30
	fnot1	%f12,	%f6
	fcmpgt32	%f22,	%f30,	%g2
	edge16n	%g7,	%i2,	%o1
	umulcc	%o2,	0x0E90,	%i6
	addccc	%g3,	%g1,	%g4
	sdiv	%i0,	0x1949,	%o6
	fnot1s	%f2,	%f19
	fmovsne	%icc,	%f14,	%f2
	fmovdpos	%xcc,	%f29,	%f1
	sdiv	%g6,	0x02BC,	%l6
	orcc	%g5,	%o0,	%l4
	xnorcc	%i7,	0x0551,	%i5
	fnot1	%f12,	%f6
	umul	%o3,	%o4,	%i3
	movl	%icc,	%l3,	%i1
	fmovse	%xcc,	%f21,	%f16
	fnot2s	%f31,	%f30
	fnot1s	%f11,	%f8
	fmovdne	%xcc,	%f7,	%f30
	mulscc	%i4,	%l5,	%l1
	movvs	%icc,	%o7,	%o5
	fmovsl	%icc,	%f17,	%f8
	edge8ln	%l2,	%l0,	%g7
	array32	%i2,	%g2,	%o1
	movvs	%xcc,	%o2,	%g3
	popc	0x1B0F,	%g1
	array32	%g4,	%i0,	%o6
	ldd	[%l7 + 0x40],	%f14
	orn	%g6,	%i6,	%l6
	popc	%o0,	%g5
	stw	%l4,	[%l7 + 0x18]
	movge	%icc,	%i7,	%i5
	edge32n	%o4,	%o3,	%i3
	movl	%xcc,	%l3,	%i4
	or	%i1,	%l1,	%o7
	movre	%o5,	0x012,	%l5
	fxors	%f2,	%f0,	%f19
	fmovs	%f15,	%f24
	ldsw	[%l7 + 0x28],	%l0
	udivx	%l2,	0x1D09,	%i2
	fmovdpos	%icc,	%f23,	%f15
	fsrc1	%f4,	%f30
	sir	0x0495
	movre	%g2,	0x0F2,	%g7
	sllx	%o1,	0x00,	%o2
	addcc	%g3,	0x1696,	%g1
	movcs	%xcc,	%i0,	%g4
	edge16n	%g6,	%o6,	%l6
	movpos	%xcc,	%i6,	%g5
	fcmple16	%f14,	%f0,	%l4
	stx	%o0,	[%l7 + 0x48]
	sra	%i5,	%o4,	%o3
	udivcc	%i3,	0x1D44,	%l3
	fmovrdlez	%i4,	%f2,	%f6
	movcs	%icc,	%i1,	%i7
	edge32ln	%l1,	%o7,	%o5
	udiv	%l0,	0x107E,	%l5
	edge16n	%l2,	%g2,	%g7
	movleu	%xcc,	%o1,	%i2
	movle	%icc,	%o2,	%g3
	fmovrsgz	%g1,	%f4,	%f26
	fxnors	%f31,	%f31,	%f3
	umulcc	%g4,	%i0,	%g6
	fmovspos	%xcc,	%f7,	%f12
	movleu	%xcc,	%o6,	%i6
	fnot1	%f18,	%f2
	sub	%l6,	%g5,	%l4
	orcc	%i5,	%o0,	%o3
	movrgz	%i3,	0x050,	%l3
	ldsh	[%l7 + 0x7E],	%i4
	save %o4, 0x1F2B, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%l1,	%i1
	umulcc	%o7,	%o5,	%l5
	lduw	[%l7 + 0x50],	%l0
	fmovrdgz	%l2,	%f10,	%f26
	movcc	%xcc,	%g7,	%g2
	movleu	%xcc,	%o1,	%i2
	sdiv	%g3,	0x12F5,	%g1
	addcc	%o2,	0x081A,	%i0
	stx	%g4,	[%l7 + 0x30]
	fones	%f12
	fone	%f26
	stb	%g6,	[%l7 + 0x59]
	fabss	%f27,	%f20
	subc	%o6,	%l6,	%g5
	sllx	%l4,	0x0F,	%i5
	movne	%xcc,	%i6,	%o0
	sth	%o3,	[%l7 + 0x08]
	popc	0x09CB,	%l3
	edge32l	%i4,	%o4,	%i3
	fmovd	%f10,	%f30
	fnot1s	%f1,	%f25
	mulx	%i7,	0x07D6,	%l1
	edge8n	%o7,	%o5,	%l5
	fmovspos	%icc,	%f27,	%f17
	umulcc	%l0,	0x1E06,	%i1
	srl	%g7,	0x18,	%l2
	mova	%icc,	%g2,	%o1
	fmovsvs	%icc,	%f26,	%f15
	ldx	[%l7 + 0x50],	%g3
	stb	%i2,	[%l7 + 0x26]
	movrgez	%g1,	0x2EC,	%o2
	sllx	%g4,	0x09,	%i0
	edge32n	%o6,	%l6,	%g5
	fmovrsgez	%l4,	%f17,	%f18
	movre	%i5,	%g6,	%i6
	movrgez	%o0,	%l3,	%i4
	edge8ln	%o4,	%i3,	%i7
	sdivcc	%o3,	0x0842,	%l1
	fmovdcs	%xcc,	%f24,	%f19
	smulcc	%o5,	%l5,	%o7
	bshuffle	%f12,	%f4,	%f10
	sra	%i1,	%g7,	%l0
	sub	%g2,	0x1C59,	%o1
	fmovsn	%xcc,	%f2,	%f9
	fmul8sux16	%f20,	%f24,	%f4
	ldd	[%l7 + 0x38],	%f26
	fnors	%f20,	%f25,	%f24
	fnot2s	%f22,	%f4
	edge8ln	%g3,	%i2,	%l2
	xnor	%o2,	0x0AB1,	%g4
	movvs	%icc,	%i0,	%o6
	edge8ln	%g1,	%g5,	%l6
	sdivx	%i5,	0x00A3,	%l4
	edge32ln	%i6,	%g6,	%o0
	andncc	%i4,	%l3,	%o4
	sll	%i7,	%o3,	%l1
	fmovdvc	%xcc,	%f31,	%f1
	ldsb	[%l7 + 0x43],	%i3
	udivx	%l5,	0x0EBB,	%o5
	edge16n	%o7,	%i1,	%g7
	ldd	[%l7 + 0x58],	%f14
	edge16n	%g2,	%l0,	%o1
	srl	%g3,	0x1F,	%l2
	alignaddr	%i2,	%g4,	%i0
	sra	%o2,	%o6,	%g1
	fmovscs	%icc,	%f16,	%f23
	udivx	%l6,	0x0451,	%g5
	orcc	%i5,	%i6,	%l4
	sir	0x1D21
	fcmpeq32	%f12,	%f0,	%g6
	movvc	%icc,	%o0,	%i4
	edge16	%o4,	%i7,	%l3
	movgu	%xcc,	%o3,	%l1
	fpadd16	%f22,	%f6,	%f30
	fabss	%f28,	%f3
	sub	%i3,	%o5,	%o7
	array16	%l5,	%i1,	%g7
	edge8n	%l0,	%o1,	%g2
	array32	%g3,	%i2,	%g4
	movpos	%icc,	%l2,	%o2
	movrne	%i0,	%g1,	%o6
	ldx	[%l7 + 0x68],	%g5
	fmovsvs	%xcc,	%f9,	%f0
	fmovsvc	%xcc,	%f12,	%f16
	ldsw	[%l7 + 0x34],	%i5
	subcc	%l6,	0x0819,	%l4
	mulscc	%g6,	%i6,	%o0
	edge16ln	%o4,	%i4,	%l3
	srax	%o3,	0x0C,	%l1
	fpack16	%f26,	%f10
	srax	%i3,	0x11,	%i7
	movleu	%icc,	%o5,	%o7
	fsrc2s	%f2,	%f24
	ldx	[%l7 + 0x48],	%l5
	sra	%i1,	%g7,	%o1
	edge8	%l0,	%g3,	%i2
	movvs	%xcc,	%g2,	%g4
	movne	%icc,	%l2,	%o2
	sth	%i0,	[%l7 + 0x44]
	fmovse	%icc,	%f24,	%f20
	andn	%o6,	%g5,	%g1
	fmovdleu	%xcc,	%f27,	%f23
	movrgz	%i5,	0x221,	%l4
	movrlez	%l6,	0x1BA,	%g6
	move	%xcc,	%i6,	%o4
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	fnot1	%f22,	%f18
	alignaddr	%l1,	%i3,	%o3
	movrlez	%i7,	%o5,	%l5
	array16	%o7,	%i1,	%o1
	movvs	%icc,	%g7,	%l0
	srax	%g3,	0x16,	%i2
	movvc	%icc,	%g4,	%l2
	xorcc	%o2,	%i0,	%o6
	movleu	%icc,	%g2,	%g5
	edge32	%i5,	%g1,	%l4
	mulscc	%l6,	%i6,	%g6
	ldsb	[%l7 + 0x2E],	%o0
	subccc	%l3,	0x0328,	%i4
	umulcc	%l1,	0x0C92,	%i3
	mulx	%o4,	%o3,	%o5
	movre	%l5,	0x0F3,	%i7
	movvc	%icc,	%o7,	%i1
	and	%g7,	%o1,	%l0
	lduh	[%l7 + 0x40],	%g3
	fnot2s	%f25,	%f7
	ldsw	[%l7 + 0x18],	%i2
	movpos	%xcc,	%g4,	%l2
	nop
	set	0x55, %i7
	ldub	[%l7 + %i7],	%o2
	fmovdcc	%icc,	%f31,	%f25
	fxnor	%f16,	%f12,	%f2
	sethi	0x03CC,	%i0
	movrlz	%o6,	0x1A9,	%g5
	movre	%i5,	%g2,	%l4
	lduh	[%l7 + 0x64],	%l6
	movle	%xcc,	%g1,	%g6
	smul	%o0,	%i6,	%i4
	and	%l3,	0x0B87,	%i3
	sub	%l1,	%o3,	%o5
	movre	%o4,	%l5,	%o7
	mulx	%i7,	%i1,	%o1
	sra	%g7,	0x08,	%l0
	fpackfix	%f26,	%f16
	smulcc	%g3,	%g4,	%l2
	fnor	%f16,	%f20,	%f24
	ldub	[%l7 + 0x32],	%o2
	orn	%i0,	0x1B41,	%o6
	fabsd	%f4,	%f26
	smul	%g5,	%i2,	%g2
	sllx	%l4,	0x05,	%l6
	movrgez	%i5,	%g6,	%g1
	ld	[%l7 + 0x5C],	%f19
	movneg	%icc,	%o0,	%i6
	edge8	%l3,	%i4,	%i3
	udiv	%o3,	0x1DF9,	%o5
	fcmple32	%f30,	%f28,	%l1
	stx	%l5,	[%l7 + 0x28]
	subc	%o4,	0x028B,	%i7
	movle	%xcc,	%i1,	%o7
	edge8	%g7,	%o1,	%g3
	umul	%g4,	0x0FD1,	%l0
	udivx	%o2,	0x1D61,	%l2
	sth	%i0,	[%l7 + 0x26]
	lduh	[%l7 + 0x2E],	%g5
	edge32	%i2,	%o6,	%g2
	fpsub32	%f14,	%f2,	%f14
	orn	%l6,	0x09CD,	%i5
	or	%g6,	%g1,	%l4
	edge8ln	%i6,	%o0,	%l3
	fmovsg	%xcc,	%f26,	%f28
	edge16	%i4,	%o3,	%i3
	stx	%o5,	[%l7 + 0x08]
	save %l5, %l1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i7,	0x022C,	%o7
	sir	0x0C12
	sdiv	%g7,	0x1627,	%o1
	restore %g3, 0x0E3F, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%i1,	%l0
	mova	%xcc,	%o2,	%l2
	movrgz	%i0,	%i2,	%g5
	ldsb	[%l7 + 0x7E],	%o6
	orcc	%l6,	%i5,	%g2
	movneg	%xcc,	%g6,	%l4
	xnorcc	%i6,	%g1,	%l3
	movpos	%xcc,	%o0,	%o3
	andncc	%i4,	%o5,	%i3
	fcmps	%fcc3,	%f0,	%f21
	fmul8ulx16	%f12,	%f0,	%f28
	mova	%xcc,	%l1,	%l5
	subccc	%o4,	0x0F96,	%i7
	sdivx	%g7,	0x04EB,	%o1
	andcc	%o7,	%g4,	%i1
	fcmped	%fcc2,	%f0,	%f10
	array32	%l0,	%g3,	%o2
	lduw	[%l7 + 0x58],	%i0
	fmuld8ulx16	%f24,	%f2,	%f6
	fzeros	%f17
	srl	%l2,	0x01,	%g5
	orn	%i2,	0x0B44,	%l6
	movre	%i5,	0x35D,	%g2
	movneg	%icc,	%g6,	%o6
	addcc	%l4,	0x048B,	%g1
	movvc	%icc,	%i6,	%o0
	srax	%l3,	%o3,	%i4
	mulx	%i3,	%o5,	%l5
	popc	0x10DC,	%l1
	sdivcc	%i7,	0x1D36,	%g7
	sdivx	%o4,	0x0F13,	%o1
	movpos	%icc,	%o7,	%g4
	array8	%i1,	%g3,	%l0
	movrgez	%o2,	%l2,	%i0
	ldd	[%l7 + 0x60],	%g4
	movre	%i2,	%l6,	%g2
	or	%i5,	0x1DD2,	%o6
	edge16l	%l4,	%g6,	%g1
	edge16n	%o0,	%l3,	%i6
	sdivcc	%o3,	0x0CFC,	%i4
	fpsub16s	%f20,	%f18,	%f18
	addc	%o5,	0x1201,	%l5
	andncc	%l1,	%i7,	%g7
	sllx	%i3,	%o4,	%o1
	sll	%g4,	0x0B,	%i1
	orn	%o7,	0x03D1,	%g3
	xnorcc	%l0,	%o2,	%l2
	movcs	%icc,	%g5,	%i2
	orn	%i0,	%g2,	%l6
	stx	%o6,	[%l7 + 0x08]
	and	%i5,	%l4,	%g1
	edge16	%o0,	%g6,	%i6
	srl	%l3,	0x17,	%i4
	ldsw	[%l7 + 0x38],	%o3
	array32	%l5,	%l1,	%i7
	array8	%o5,	%i3,	%g7
	save %o4, 0x0B83, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g4,	0x18E2,	%i1
	fcmpd	%fcc0,	%f16,	%f2
	xnorcc	%o7,	0x0C56,	%g3
	movvc	%xcc,	%l0,	%o2
	fmovscs	%icc,	%f27,	%f3
	srl	%l2,	0x19,	%i2
	xorcc	%g5,	%g2,	%l6
	st	%f7,	[%l7 + 0x48]
	fmovsvc	%icc,	%f11,	%f8
	movvs	%icc,	%i0,	%o6
	smulcc	%l4,	0x0553,	%g1
	xnorcc	%i5,	%o0,	%g6
	xnor	%i6,	0x153F,	%i4
	fcmple16	%f28,	%f14,	%l3
	mulx	%l5,	%o3,	%i7
	smulcc	%o5,	0x0915,	%i3
	edge32n	%g7,	%o4,	%l1
	sdivx	%o1,	0x1263,	%i1
	fmovsge	%icc,	%f3,	%f13
	movrgez	%g4,	0x1A4,	%o7
	ldd	[%l7 + 0x18],	%f28
	srax	%l0,	0x11,	%g3
	movrne	%o2,	%l2,	%g5
	fmovd	%f4,	%f8
	std	%f10,	[%l7 + 0x28]
	edge8l	%i2,	%g2,	%i0
	and	%o6,	%l6,	%l4
	array32	%g1,	%o0,	%i5
	lduw	[%l7 + 0x30],	%g6
	add	%i6,	0x1CBF,	%l3
	fnors	%f4,	%f31,	%f20
	edge32ln	%l5,	%i4,	%o3
	umulcc	%o5,	0x1437,	%i7
	or	%g7,	%o4,	%i3
	fmovspos	%xcc,	%f1,	%f29
	nop
	set	0x40, %g2
	stx	%l1,	[%l7 + %g2]
	sethi	0x08C3,	%o1
	sdiv	%g4,	0x133A,	%i1
	ldsb	[%l7 + 0x59],	%l0
	fcmpne32	%f6,	%f8,	%g3
	movrgz	%o7,	%l2,	%g5
	edge8l	%i2,	%o2,	%i0
	sir	0x0318
	fone	%f14
	fmovsvs	%icc,	%f25,	%f13
	movne	%icc,	%o6,	%l6
	edge8n	%l4,	%g1,	%g2
	edge8	%o0,	%i5,	%i6
	fmovdleu	%xcc,	%f23,	%f14
	edge16ln	%l3,	%l5,	%i4
	xorcc	%g6,	%o3,	%o5
	ldd	[%l7 + 0x60],	%f30
	ld	[%l7 + 0x0C],	%f5
	ldub	[%l7 + 0x16],	%g7
	std	%f22,	[%l7 + 0x20]
	edge16l	%o4,	%i3,	%i7
	sdiv	%o1,	0x1909,	%g4
	fxnors	%f9,	%f30,	%f27
	array8	%i1,	%l1,	%g3
	stx	%o7,	[%l7 + 0x50]
	and	%l2,	%l0,	%g5
	fnegd	%f22,	%f6
	fzero	%f24
	movge	%xcc,	%i2,	%o2
	movrgez	%i0,	%o6,	%l4
	edge32	%g1,	%g2,	%l6
	srlx	%i5,	0x1B,	%i6
	fones	%f26
	stw	%l3,	[%l7 + 0x30]
	fmovsg	%icc,	%f23,	%f12
	or	%o0,	%l5,	%i4
	movrgz	%g6,	%o5,	%o3
	fmovscc	%xcc,	%f21,	%f25
	move	%icc,	%g7,	%i3
	faligndata	%f26,	%f2,	%f30
	popc	0x0926,	%i7
	sethi	0x05D2,	%o1
	array8	%g4,	%i1,	%o4
	orncc	%g3,	%o7,	%l2
	ldsh	[%l7 + 0x36],	%l1
	mulscc	%g5,	%i2,	%l0
	movn	%xcc,	%i0,	%o2
	fsrc1	%f14,	%f24
	ldsb	[%l7 + 0x62],	%l4
	edge16	%o6,	%g1,	%g2
	and	%i5,	0x03AF,	%l6
	edge8	%l3,	%i6,	%l5
	fmovsne	%xcc,	%f18,	%f27
	alignaddrl	%o0,	%g6,	%i4
	sdivx	%o3,	0x0B08,	%g7
	subccc	%o5,	0x0AEE,	%i3
	movleu	%xcc,	%i7,	%o1
	addc	%i1,	0x0674,	%o4
	stx	%g4,	[%l7 + 0x70]
	fmovrdlz	%g3,	%f26,	%f0
	ldub	[%l7 + 0x17],	%o7
	movl	%xcc,	%l1,	%g5
	fpsub32s	%f28,	%f23,	%f26
	subccc	%i2,	0x0ADB,	%l0
	sdivx	%i0,	0x0B67,	%l2
	popc	0x0F0D,	%l4
	edge32	%o6,	%g1,	%g2
	andn	%o2,	0x1F9C,	%i5
	fandnot1s	%f6,	%f19,	%f10
	fsrc1	%f6,	%f26
	fnot2s	%f18,	%f18
	fmovdne	%xcc,	%f3,	%f23
	movgu	%xcc,	%l6,	%l3
	fnand	%f24,	%f30,	%f10
	or	%l5,	%i6,	%g6
	ldsb	[%l7 + 0x78],	%i4
	fxor	%f8,	%f30,	%f22
	fmovrse	%o3,	%f6,	%f21
	move	%xcc,	%g7,	%o0
	fcmpgt16	%f18,	%f30,	%i3
	edge8n	%o5,	%i7,	%i1
	fmovsleu	%xcc,	%f17,	%f13
	pdist	%f30,	%f24,	%f20
	edge32l	%o4,	%g4,	%o1
	xnorcc	%o7,	0x0026,	%l1
	xorcc	%g5,	%g3,	%l0
	mulx	%i0,	%l2,	%l4
	st	%f15,	[%l7 + 0x44]
	movrgez	%o6,	0x22C,	%i2
	edge16	%g1,	%o2,	%i5
	edge32ln	%l6,	%g2,	%l5
	subc	%i6,	%g6,	%i4
	fmovsgu	%icc,	%f2,	%f3
	movcs	%xcc,	%l3,	%g7
	movn	%icc,	%o0,	%i3
	fmovsvc	%icc,	%f17,	%f28
	sir	0x1529
	mulx	%o5,	%i7,	%i1
	fsrc1	%f16,	%f20
	subccc	%o4,	%o3,	%o1
	subccc	%g4,	%o7,	%l1
	fcmpne32	%f6,	%f28,	%g5
	fmovdg	%xcc,	%f17,	%f31
	xnorcc	%l0,	%g3,	%i0
	movcc	%icc,	%l2,	%o6
	ld	[%l7 + 0x48],	%f16
	sub	%i2,	0x0779,	%l4
	ldx	[%l7 + 0x70],	%o2
	fnegs	%f23,	%f13
	edge32ln	%i5,	%g1,	%l6
	addccc	%g2,	0x15D4,	%l5
	move	%xcc,	%i6,	%i4
	subc	%g6,	%g7,	%l3
	stx	%o0,	[%l7 + 0x38]
	movrne	%i3,	0x0CF,	%o5
	edge32	%i1,	%i7,	%o3
	array16	%o1,	%g4,	%o7
	edge8ln	%o4,	%l1,	%l0
	and	%g5,	0x103A,	%i0
	srlx	%g3,	%l2,	%o6
	sir	0x1B74
	fones	%f23
	fpsub16s	%f7,	%f23,	%f15
	movrgz	%l4,	0x3CC,	%o2
	fmovsn	%xcc,	%f6,	%f25
	and	%i5,	0x0397,	%i2
	andcc	%l6,	0x1DC3,	%g1
	popc	%g2,	%i6
	sllx	%l5,	%g6,	%i4
	movl	%xcc,	%g7,	%l3
	smulcc	%o0,	0x0EFF,	%o5
	srlx	%i1,	%i3,	%o3
	stx	%o1,	[%l7 + 0x70]
	fmovse	%xcc,	%f25,	%f19
	mulscc	%i7,	%o7,	%g4
	stx	%l1,	[%l7 + 0x38]
	fpadd32	%f0,	%f4,	%f6
	ldub	[%l7 + 0x2B],	%o4
	subcc	%g5,	%i0,	%l0
	mova	%xcc,	%l2,	%o6
	ldsh	[%l7 + 0x7A],	%g3
	array8	%l4,	%o2,	%i2
	xorcc	%i5,	0x177F,	%g1
	add	%l6,	0x1165,	%i6
	umulcc	%g2,	0x1FD6,	%l5
	save %g6, 0x0C1E, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l3,	%o0,	%g7
	ldsh	[%l7 + 0x32],	%i1
	fones	%f25
	movrgz	%o5,	%i3,	%o3
	mulx	%o1,	0x14C7,	%o7
	array32	%g4,	%l1,	%o4
	sll	%g5,	%i0,	%l0
	ldd	[%l7 + 0x10],	%l2
	movvs	%xcc,	%o6,	%g3
	xnor	%i7,	%o2,	%l4
	fmovdge	%xcc,	%f10,	%f11
	sub	%i5,	%i2,	%l6
	movrlez	%g1,	%i6,	%l5
	addc	%g2,	%g6,	%l3
	movpos	%xcc,	%i4,	%o0
	edge8n	%i1,	%o5,	%g7
	edge32l	%i3,	%o1,	%o7
	sdiv	%g4,	0x0F8A,	%o3
	ldx	[%l7 + 0x28],	%l1
	andcc	%g5,	0x01AB,	%o4
	fmul8ulx16	%f4,	%f10,	%f22
	edge8n	%l0,	%l2,	%i0
	movrne	%o6,	%g3,	%o2
	subcc	%l4,	0x1235,	%i7
	fcmpes	%fcc1,	%f3,	%f13
	fmovda	%icc,	%f24,	%f22
	and	%i5,	0x0781,	%l6
	ldub	[%l7 + 0x27],	%i2
	popc	0x054B,	%g1
	add	%i6,	%l5,	%g2
	movre	%g6,	0x1A7,	%l3
	udiv	%i4,	0x0426,	%o0
	subc	%o5,	%i1,	%g7
	sdivx	%o1,	0x1542,	%i3
	movg	%icc,	%o7,	%g4
	ldsh	[%l7 + 0x24],	%o3
	movgu	%xcc,	%l1,	%o4
	movcc	%icc,	%l0,	%l2
	sdivx	%i0,	0x14B8,	%o6
	fmovrsgez	%g3,	%f9,	%f11
	udivx	%o2,	0x0D89,	%l4
	movrlez	%g5,	%i5,	%i7
	move	%xcc,	%l6,	%g1
	fnot2	%f24,	%f24
	lduh	[%l7 + 0x1A],	%i6
	fmovsleu	%icc,	%f16,	%f9
	sllx	%l5,	0x1E,	%i2
	fmovrse	%g6,	%f31,	%f5
	movpos	%xcc,	%l3,	%g2
	subccc	%i4,	%o5,	%i1
	add	%g7,	%o1,	%i3
	edge8n	%o0,	%g4,	%o3
	umul	%o7,	%o4,	%l1
	addcc	%l2,	0x1B98,	%i0
	smulcc	%o6,	%g3,	%l0
	sll	%l4,	%o2,	%i5
	std	%f26,	[%l7 + 0x78]
	sir	0x1F1D
	alignaddrl	%g5,	%l6,	%g1
	xnorcc	%i6,	%i7,	%i2
	sdiv	%l5,	0x1D32,	%g6
	fmovdge	%xcc,	%f8,	%f2
	array32	%l3,	%g2,	%o5
	xnor	%i1,	%i4,	%o1
	mulx	%g7,	%o0,	%i3
	fpack32	%f12,	%f24,	%f22
	edge32	%o3,	%g4,	%o7
	sllx	%o4,	%l1,	%l2
	faligndata	%f10,	%f14,	%f22
	orn	%i0,	0x179E,	%g3
	edge16l	%o6,	%l0,	%o2
	udivx	%l4,	0x08BD,	%i5
	srlx	%g5,	0x17,	%g1
	fpsub16	%f22,	%f10,	%f26
	fmovdg	%icc,	%f23,	%f6
	sir	0x1199
	array8	%i6,	%l6,	%i2
	ldsb	[%l7 + 0x7B],	%l5
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	fmul8x16	%f11,	%f12,	%f28
	movgu	%xcc,	%i7,	%o5
	sub	%i1,	0x112B,	%g2
	fnegs	%f18,	%f21
	fmul8x16al	%f18,	%f9,	%f2
	movrgz	%o1,	0x368,	%i4
	sdiv	%g7,	0x0B10,	%i3
	movgu	%xcc,	%o3,	%o0
	sll	%g4,	%o4,	%o7
	edge16n	%l2,	%l1,	%i0
	andcc	%g3,	%o6,	%l0
	fornot1s	%f29,	%f0,	%f0
	ldd	[%l7 + 0x60],	%f26
	sir	0x1BBD
	fors	%f21,	%f12,	%f15
	fmovdgu	%icc,	%f0,	%f0
	sllx	%o2,	%i5,	%g5
	ldsb	[%l7 + 0x7B],	%l4
	fpsub16s	%f15,	%f3,	%f13
	movcs	%icc,	%i6,	%l6
	fcmped	%fcc3,	%f26,	%f28
	fcmps	%fcc0,	%f31,	%f7
	xor	%i2,	0x16DA,	%g1
	movle	%xcc,	%g6,	%l5
	smulcc	%l3,	%i7,	%i1
	udiv	%g2,	0x0BDF,	%o1
	mulx	%i4,	%o5,	%g7
	subccc	%o3,	%o0,	%i3
	srl	%g4,	0x04,	%o4
	orn	%l2,	%l1,	%o7
	std	%f26,	[%l7 + 0x18]
	sdivcc	%g3,	0x1DEF,	%i0
	edge8l	%o6,	%o2,	%l0
	xor	%g5,	%i5,	%l4
	fmovsgu	%icc,	%f6,	%f28
	mulx	%i6,	%i2,	%l6
	ldsw	[%l7 + 0x54],	%g1
	fmovsne	%icc,	%f16,	%f6
	bshuffle	%f10,	%f24,	%f24
	lduh	[%l7 + 0x28],	%g6
	sethi	0x0FEA,	%l5
	subc	%i7,	%l3,	%g2
	fpadd32	%f2,	%f10,	%f22
	fmovrdlez	%o1,	%f8,	%f6
	fornot2	%f20,	%f24,	%f2
	fornot2s	%f8,	%f2,	%f20
	sth	%i4,	[%l7 + 0x56]
	fmovs	%f16,	%f27
	sra	%i1,	%o5,	%o3
	move	%icc,	%g7,	%o0
	movg	%xcc,	%g4,	%i3
	fabsd	%f24,	%f26
	addc	%o4,	%l2,	%l1
	fnot1	%f18,	%f8
	orcc	%o7,	0x16C3,	%i0
	edge8l	%g3,	%o6,	%l0
	fmovdle	%xcc,	%f5,	%f25
	andn	%g5,	%o2,	%i5
	mulscc	%l4,	0x0998,	%i2
	movn	%icc,	%i6,	%l6
	movl	%xcc,	%g1,	%l5
	move	%icc,	%g6,	%l3
	movvc	%icc,	%i7,	%g2
	ldub	[%l7 + 0x5C],	%o1
	alignaddrl	%i4,	%o5,	%i1
	fmul8sux16	%f4,	%f26,	%f16
	movcc	%icc,	%g7,	%o0
	mova	%xcc,	%o3,	%g4
	addc	%o4,	0x016A,	%l2
	edge16ln	%l1,	%i3,	%o7
	edge16ln	%i0,	%o6,	%l0
	fmovse	%icc,	%f12,	%f27
	movg	%xcc,	%g5,	%g3
	and	%i5,	%l4,	%o2
	fsrc2	%f2,	%f2
	popc	0x16C8,	%i6
	and	%l6,	0x1D7D,	%g1
	fcmped	%fcc2,	%f28,	%f12
	srax	%i2,	%l5,	%g6
	fmovs	%f20,	%f17
	add	%i7,	0x0B3D,	%g2
	fmovdneg	%xcc,	%f28,	%f8
	st	%f4,	[%l7 + 0x7C]
	udivx	%l3,	0x19F0,	%i4
	orn	%o5,	%o1,	%g7
	bshuffle	%f18,	%f14,	%f28
	fxnors	%f15,	%f16,	%f17
	sub	%i1,	%o0,	%o3
	fand	%f4,	%f12,	%f0
	movre	%o4,	%g4,	%l1
	fmovrslz	%l2,	%f31,	%f15
	mulx	%i3,	0x1AD2,	%i0
	orn	%o7,	0x14E8,	%o6
	sdivx	%g5,	0x067B,	%l0
	movre	%g3,	0x39B,	%l4
	fmovspos	%xcc,	%f18,	%f25
	fnor	%f30,	%f24,	%f16
	fxor	%f22,	%f10,	%f30
	and	%o2,	%i5,	%i6
	ldd	[%l7 + 0x68],	%f6
	fnegd	%f20,	%f18
	ldx	[%l7 + 0x28],	%g1
	addc	%i2,	%l6,	%l5
	srl	%g6,	0x0D,	%g2
	mova	%xcc,	%l3,	%i4
	fors	%f11,	%f25,	%f14
	movle	%xcc,	%o5,	%i7
	smul	%o1,	%g7,	%i1
	fcmpeq32	%f8,	%f24,	%o3
	edge16ln	%o4,	%o0,	%g4
	edge32n	%l2,	%i3,	%i0
	fmovdle	%icc,	%f9,	%f10
	fmovdvs	%xcc,	%f2,	%f4
	movle	%icc,	%l1,	%o7
	add	%g5,	0x0CDF,	%o6
	movrlez	%l0,	%g3,	%o2
	udivcc	%i5,	0x0C77,	%l4
	mulscc	%g1,	0x18EB,	%i6
	ldd	[%l7 + 0x30],	%i6
	movl	%xcc,	%i2,	%g6
	sdivcc	%l5,	0x1957,	%l3
	subc	%g2,	0x1BEA,	%i4
	sdivx	%i7,	0x08F5,	%o5
	addc	%o1,	%g7,	%o3
	udivx	%o4,	0x16CB,	%o0
	udiv	%i1,	0x1D2A,	%g4
	movrgez	%i3,	0x32E,	%i0
	edge16	%l1,	%l2,	%g5
	addcc	%o6,	%o7,	%l0
	smul	%g3,	0x02F2,	%i5
	ldd	[%l7 + 0x20],	%l4
	nop
	set	0x1B, %g6
	ldub	[%l7 + %g6],	%g1
	stw	%i6,	[%l7 + 0x10]
	stb	%l6,	[%l7 + 0x1E]
	addccc	%i2,	0x0F9F,	%g6
	fmovdvc	%icc,	%f20,	%f13
	fexpand	%f11,	%f14
	stx	%l5,	[%l7 + 0x08]
	ldub	[%l7 + 0x7D],	%l3
	mova	%xcc,	%o2,	%i4
	movcs	%icc,	%g2,	%o5
	movrgz	%i7,	%g7,	%o1
	fmovrde	%o4,	%f28,	%f12
	movre	%o0,	%i1,	%o3
	edge32n	%i3,	%g4,	%l1
	fpmerge	%f12,	%f12,	%f20
	mova	%xcc,	%l2,	%i0
	fmovde	%xcc,	%f9,	%f9
	popc	0x0D78,	%g5
	ld	[%l7 + 0x54],	%f10
	fxnor	%f28,	%f24,	%f28
	movcc	%xcc,	%o6,	%o7
	fzeros	%f7
	edge32ln	%g3,	%i5,	%l4
	movge	%xcc,	%l0,	%g1
	movn	%xcc,	%i6,	%l6
	srax	%g6,	0x1B,	%l5
	fmovda	%xcc,	%f12,	%f9
	ldsb	[%l7 + 0x20],	%i2
	sdivcc	%l3,	0x12C0,	%o2
	fsrc2	%f2,	%f22
	fmul8x16	%f16,	%f20,	%f0
	udivx	%g2,	0x0C6D,	%i4
	movrgez	%i7,	0x206,	%o5
	sub	%g7,	%o4,	%o1
	movg	%icc,	%o0,	%i1
	movl	%icc,	%o3,	%g4
	andncc	%l1,	%i3,	%l2
	fmovrslez	%g5,	%f16,	%f9
	movrlez	%o6,	0x011,	%i0
	fmovrde	%o7,	%f2,	%f16
	sth	%g3,	[%l7 + 0x22]
	movne	%icc,	%i5,	%l0
	ldx	[%l7 + 0x18],	%g1
	sethi	0x0EEF,	%l4
	fnand	%f4,	%f22,	%f18
	movle	%xcc,	%i6,	%g6
	ldsw	[%l7 + 0x7C],	%l6
	movrne	%i2,	0x25B,	%l5
	pdist	%f18,	%f4,	%f2
	mulx	%o2,	0x14BD,	%l3
	fpsub32s	%f20,	%f12,	%f1
	movrgez	%i4,	%i7,	%g2
	srl	%g7,	%o5,	%o4
	xor	%o0,	%i1,	%o3
	srax	%g4,	0x1A,	%o1
	srlx	%l1,	0x0C,	%i3
	movgu	%xcc,	%g5,	%l2
	srax	%i0,	%o6,	%o7
	srlx	%i5,	%l0,	%g1
	sdivcc	%l4,	0x0141,	%g3
	movle	%xcc,	%i6,	%l6
	orncc	%i2,	%l5,	%g6
	fmovsneg	%icc,	%f30,	%f14
	and	%o2,	0x0BAA,	%l3
	alignaddr	%i4,	%i7,	%g2
	movneg	%icc,	%o5,	%g7
	add	%o0,	%o4,	%i1
	sll	%g4,	%o1,	%l1
	andcc	%o3,	0x1875,	%g5
	stx	%i3,	[%l7 + 0x58]
	umul	%i0,	%o6,	%o7
	edge32	%l2,	%l0,	%g1
	std	%f26,	[%l7 + 0x60]
	fmul8x16al	%f6,	%f24,	%f8
	fpadd32	%f24,	%f2,	%f10
	orn	%l4,	0x07FA,	%i5
	edge8n	%g3,	%i6,	%l6
	fmovdneg	%icc,	%f9,	%f8
	srlx	%i2,	0x17,	%g6
	movneg	%xcc,	%o2,	%l3
	addccc	%l5,	0x00EE,	%i7
	stb	%g2,	[%l7 + 0x49]
	edge16	%i4,	%o5,	%o0
	popc	%g7,	%i1
	sth	%o4,	[%l7 + 0x34]
	fandnot1s	%f4,	%f19,	%f27
	smul	%g4,	0x1D57,	%o1
	mulx	%l1,	0x0A6B,	%g5
	fsrc1	%f10,	%f20
	nop
	set	0x51, %l3
	ldub	[%l7 + %l3],	%i3
	movrlez	%o3,	0x2F2,	%o6
	sllx	%i0,	%o7,	%l2
	sethi	0x09F8,	%g1
	sdivx	%l4,	0x1499,	%l0
	fnor	%f8,	%f4,	%f28
	fmul8x16	%f17,	%f2,	%f22
	edge32n	%i5,	%i6,	%g3
	fmovdvc	%icc,	%f13,	%f22
	fmovdneg	%xcc,	%f22,	%f29
	xnor	%i2,	0x1E7D,	%l6
	movrlez	%g6,	0x11B,	%l3
	fpadd16s	%f11,	%f31,	%f5
	fmovda	%xcc,	%f15,	%f18
	movvc	%xcc,	%o2,	%l5
	or	%g2,	0x0524,	%i7
	addccc	%i4,	0x1780,	%o0
	movleu	%icc,	%g7,	%i1
	movgu	%xcc,	%o4,	%o5
	ldsw	[%l7 + 0x48],	%o1
	ldx	[%l7 + 0x10],	%g4
	addccc	%l1,	%g5,	%i3
	movgu	%xcc,	%o6,	%o3
	lduh	[%l7 + 0x5E],	%o7
	movn	%icc,	%l2,	%g1
	lduh	[%l7 + 0x08],	%i0
	addccc	%l4,	0x1E92,	%l0
	fmovsgu	%xcc,	%f20,	%f22
	andn	%i6,	0x0A1B,	%g3
	movvc	%xcc,	%i5,	%i2
	movrlez	%l6,	%l3,	%g6
	fcmpeq16	%f26,	%f16,	%l5
	fmovrdlez	%o2,	%f0,	%f2
	edge16l	%g2,	%i4,	%o0
	srax	%g7,	%i1,	%i7
	movrlez	%o5,	%o1,	%o4
	edge16	%l1,	%g4,	%g5
	andncc	%o6,	%i3,	%o7
	subccc	%l2,	0x0B92,	%g1
	fxor	%f12,	%f28,	%f18
	lduh	[%l7 + 0x66],	%o3
	ldd	[%l7 + 0x50],	%f14
	ldsw	[%l7 + 0x6C],	%l4
	fmovrse	%l0,	%f12,	%f15
	popc	0x1D6D,	%i6
	sdivcc	%i0,	0x1A02,	%g3
	movcc	%xcc,	%i5,	%i2
	fpack32	%f6,	%f12,	%f12
	std	%f0,	[%l7 + 0x38]
	movgu	%icc,	%l6,	%l3
	movneg	%xcc,	%g6,	%o2
	movl	%icc,	%l5,	%i4
	sub	%o0,	%g7,	%i1
	srax	%i7,	%o5,	%o1
	movgu	%xcc,	%g2,	%o4
	fnor	%f0,	%f24,	%f8
	fone	%f26
	subccc	%g4,	0x10A8,	%l1
	or	%o6,	%g5,	%o7
	nop
	set	0x6F, %i6
	stb	%i3,	[%l7 + %i6]
	edge16n	%l2,	%o3,	%g1
	nop
	set	0x2E, %l4
	ldub	[%l7 + %l4],	%l4
	stx	%i6,	[%l7 + 0x18]
	fnors	%f5,	%f20,	%f30
	addcc	%i0,	0x1BB8,	%g3
	mulx	%l0,	0x1F68,	%i5
	mova	%xcc,	%i2,	%l3
	movcs	%icc,	%g6,	%l6
	movcc	%xcc,	%o2,	%l5
	movpos	%icc,	%i4,	%o0
	edge16ln	%i1,	%i7,	%o5
	sethi	0x0855,	%g7
	fcmple16	%f2,	%f0,	%g2
	edge16l	%o4,	%o1,	%l1
	ldx	[%l7 + 0x28],	%o6
	edge16n	%g5,	%o7,	%i3
	andncc	%l2,	%o3,	%g4
	movrne	%l4,	%i6,	%i0
	edge32	%g3,	%l0,	%i5
	fpack16	%f2,	%f26
	srl	%i2,	0x08,	%g1
	fmovda	%xcc,	%f15,	%f16
	smul	%l3,	%g6,	%l6
	edge32l	%l5,	%o2,	%i4
	movrlez	%i1,	0x1A5,	%o0
	andncc	%o5,	%g7,	%g2
	ld	[%l7 + 0x68],	%f2
	edge32l	%i7,	%o1,	%o4
	orncc	%o6,	%l1,	%o7
	movvs	%icc,	%g5,	%i3
	array8	%l2,	%o3,	%g4
	fxors	%f18,	%f23,	%f27
	edge16l	%i6,	%l4,	%i0
	orcc	%l0,	0x0361,	%i5
	fmovda	%icc,	%f28,	%f0
	mulscc	%i2,	0x1817,	%g3
	lduh	[%l7 + 0x2C],	%l3
	fandnot1s	%f11,	%f1,	%f3
	edge16	%g6,	%g1,	%l6
	movcs	%xcc,	%o2,	%i4
	and	%l5,	0x1C7A,	%i1
	or	%o5,	%g7,	%g2
	fmovdneg	%xcc,	%f17,	%f12
	fnegd	%f0,	%f24
	subcc	%i7,	0x125E,	%o1
	ldsw	[%l7 + 0x48],	%o4
	fmovdn	%icc,	%f4,	%f10
	edge8l	%o6,	%o0,	%o7
	movvc	%icc,	%g5,	%i3
	fnegs	%f0,	%f0
	movrlez	%l2,	%o3,	%l1
	orncc	%i6,	0x033E,	%l4
	movle	%xcc,	%g4,	%l0
	addcc	%i0,	0x0F0E,	%i2
	sth	%i5,	[%l7 + 0x7C]
	movneg	%xcc,	%g3,	%g6
	ld	[%l7 + 0x4C],	%f17
	popc	0x181D,	%g1
	movrne	%l6,	0x1B1,	%l3
	fmuld8ulx16	%f14,	%f2,	%f16
	edge8ln	%o2,	%i4,	%l5
	edge16ln	%i1,	%o5,	%g7
	fcmpeq16	%f30,	%f28,	%i7
	umulcc	%o1,	%g2,	%o4
	movcs	%xcc,	%o0,	%o7
	fmovrdlz	%o6,	%f22,	%f14
	umul	%g5,	%l2,	%o3
	ldsw	[%l7 + 0x34],	%l1
	fexpand	%f12,	%f20
	fmovdn	%icc,	%f25,	%f20
	umulcc	%i6,	%l4,	%g4
	edge32n	%l0,	%i0,	%i3
	movn	%xcc,	%i5,	%g3
	ldsw	[%l7 + 0x4C],	%g6
	edge16l	%i2,	%g1,	%l6
	fmovdgu	%icc,	%f21,	%f30
	stw	%o2,	[%l7 + 0x40]
	edge8	%i4,	%l5,	%i1
	movn	%xcc,	%l3,	%o5
	subc	%i7,	0x1430,	%o1
	restore %g2, %g7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%o7,	%f6,	%f25
	edge8	%o0,	%g5,	%o6
	subcc	%o3,	%l1,	%i6
	ldx	[%l7 + 0x58],	%l4
	fmovrsgez	%g4,	%f7,	%f22
	movrlz	%l2,	%i0,	%i3
	fmovdvc	%xcc,	%f12,	%f25
	ldub	[%l7 + 0x51],	%i5
	move	%xcc,	%l0,	%g6
	or	%g3,	%g1,	%l6
	movle	%xcc,	%i2,	%o2
	movrne	%i4,	0x123,	%l5
	fnegs	%f27,	%f26
	edge16	%l3,	%o5,	%i1
	srlx	%i7,	0x1E,	%o1
	or	%g7,	%o4,	%g2
	movvc	%xcc,	%o0,	%g5
	and	%o6,	%o7,	%l1
	fpackfix	%f12,	%f19
	movg	%xcc,	%i6,	%o3
	movleu	%icc,	%l4,	%g4
	movgu	%xcc,	%l2,	%i0
	movrlez	%i3,	%l0,	%i5
	and	%g6,	%g1,	%l6
	alignaddr	%i2,	%g3,	%i4
	ldsw	[%l7 + 0x78],	%l5
	fandnot2	%f8,	%f6,	%f22
	popc	0x1607,	%o2
	ldx	[%l7 + 0x50],	%l3
	and	%i1,	0x1A50,	%i7
	edge8l	%o1,	%g7,	%o5
	add	%o4,	0x0259,	%o0
	edge32l	%g5,	%o6,	%g2
	save %o7, 0x0175, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o3,	%l1,	%l4
	ldsh	[%l7 + 0x14],	%l2
	fmovrslz	%g4,	%f18,	%f21
	edge16ln	%i3,	%i0,	%i5
	or	%g6,	%g1,	%l6
	ldsb	[%l7 + 0x53],	%i2
	smul	%l0,	0x1A49,	%g3
	ldsb	[%l7 + 0x40],	%l5
	andncc	%o2,	%i4,	%i1
	nop
	set	0x32, %i5
	stb	%i7,	[%l7 + %i5]
	fmuld8ulx16	%f2,	%f22,	%f20
	movvs	%xcc,	%l3,	%g7
	stb	%o5,	[%l7 + 0x62]
	or	%o4,	%o1,	%g5
	fxors	%f17,	%f11,	%f13
	srl	%o6,	%g2,	%o0
	udivx	%i6,	0x10A4,	%o7
	movneg	%xcc,	%o3,	%l4
	subcc	%l1,	%l2,	%g4
	fzeros	%f17
	orncc	%i0,	%i5,	%g6
	fandnot2	%f12,	%f22,	%f22
	lduw	[%l7 + 0x54],	%i3
	fpack16	%f28,	%f25
	alignaddrl	%l6,	%g1,	%l0
	alignaddr	%i2,	%g3,	%l5
	movneg	%icc,	%i4,	%i1
	andncc	%i7,	%o2,	%g7
	fxnor	%f12,	%f30,	%f26
	sra	%o5,	0x10,	%o4
	orcc	%o1,	0x078C,	%g5
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	movrne	%o6,	%i6,	%o0
	edge8l	%o7,	%l4,	%l1
	edge8ln	%o3,	%g4,	%i0
	movrgez	%l2,	%g6,	%i5
	lduh	[%l7 + 0x62],	%i3
	fcmpgt32	%f6,	%f22,	%l6
	andncc	%l0,	%i2,	%g3
	and	%g1,	%i4,	%i1
	sra	%i7,	%o2,	%l5
	fmovrse	%g7,	%f23,	%f19
	save %o4, 0x064F, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g5,	0x0D66,	%l3
	fnot2	%f12,	%f14
	sll	%o5,	%o6,	%i6
	std	%f28,	[%l7 + 0x60]
	sdivx	%o0,	0x1E46,	%o7
	fcmpd	%fcc1,	%f14,	%f30
	std	%f4,	[%l7 + 0x40]
	edge16n	%l4,	%g2,	%o3
	movle	%xcc,	%g4,	%i0
	ldx	[%l7 + 0x20],	%l2
	movne	%xcc,	%l1,	%g6
	fmovsge	%xcc,	%f22,	%f20
	udivcc	%i3,	0x1D2B,	%i5
	ldsw	[%l7 + 0x3C],	%l6
	save %i2, 0x1575, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l0,	%g1,	%i4
	fmul8sux16	%f20,	%f18,	%f2
	fmovrdgz	%i7,	%f6,	%f30
	edge8l	%i1,	%o2,	%l5
	addcc	%o4,	0x005F,	%o1
	addccc	%g5,	0x1E0A,	%g7
	srl	%l3,	0x16,	%o5
	edge16l	%i6,	%o0,	%o6
	std	%f14,	[%l7 + 0x60]
	fmovda	%icc,	%f17,	%f31
	fmovsle	%xcc,	%f0,	%f3
	fpsub16	%f24,	%f30,	%f6
	addccc	%o7,	0x0B39,	%l4
	movrgez	%o3,	%g2,	%g4
	orcc	%l2,	0x1DE9,	%i0
	andcc	%l1,	0x03B0,	%i3
	alignaddrl	%g6,	%i5,	%i2
	xnorcc	%l6,	%g3,	%l0
	fmovrsne	%g1,	%f14,	%f1
	array16	%i4,	%i7,	%i1
	subccc	%l5,	0x0675,	%o4
	movpos	%icc,	%o1,	%o2
	fpadd32	%f4,	%f8,	%f26
	ldsb	[%l7 + 0x5F],	%g5
	edge32	%l3,	%o5,	%i6
	addc	%g7,	%o0,	%o6
	movleu	%xcc,	%l4,	%o3
	fmovrdlez	%o7,	%f28,	%f26
	fmovsle	%icc,	%f17,	%f23
	udiv	%g2,	0x0AFC,	%g4
	fmovrslz	%l2,	%f8,	%f23
	sethi	0x07DC,	%i0
	movgu	%xcc,	%l1,	%i3
	fcmpne16	%f24,	%f4,	%g6
	edge16ln	%i2,	%i5,	%g3
	xor	%l6,	%g1,	%l0
	save %i4, 0x09F7, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%i7,	%o4
	andcc	%o1,	0x0188,	%o2
	popc	0x1CBC,	%l5
	fmuld8sux16	%f15,	%f31,	%f20
	edge32l	%g5,	%l3,	%i6
	sir	0x08F7
	st	%f24,	[%l7 + 0x14]
	fpadd16s	%f12,	%f30,	%f14
	movleu	%icc,	%o5,	%g7
	stx	%o0,	[%l7 + 0x68]
	umul	%o6,	0x0FC6,	%l4
	save %o3, %o7, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g4,	0x102B,	%i0
	fmovdle	%icc,	%f6,	%f7
	xnorcc	%l1,	%l2,	%g6
	movgu	%icc,	%i2,	%i3
	stb	%i5,	[%l7 + 0x1F]
	mulscc	%g3,	0x1827,	%g1
	edge16l	%l0,	%l6,	%i4
	movl	%icc,	%i7,	%o4
	xnorcc	%i1,	%o2,	%o1
	ld	[%l7 + 0x5C],	%f31
	array16	%l5,	%l3,	%i6
	edge32ln	%o5,	%g7,	%o0
	stx	%g5,	[%l7 + 0x78]
	sllx	%l4,	0x10,	%o6
	andncc	%o7,	%g2,	%o3
	alignaddrl	%i0,	%l1,	%g4
	sethi	0x099A,	%g6
	popc	%l2,	%i3
	movneg	%icc,	%i2,	%i5
	or	%g1,	0x13E6,	%l0
	addc	%g3,	%i4,	%i7
	sllx	%o4,	0x0D,	%l6
	sdivx	%i1,	0x087A,	%o1
	sethi	0x1BD2,	%o2
	nop
	set	0x20, %l5
	ldub	[%l7 + %l5],	%l5
	movl	%icc,	%i6,	%l3
	lduw	[%l7 + 0x50],	%o5
	fmovsne	%xcc,	%f21,	%f12
	sra	%g7,	0x05,	%o0
	edge8	%l4,	%g5,	%o7
	stx	%o6,	[%l7 + 0x60]
	fcmpne16	%f22,	%f4,	%o3
	movrlz	%i0,	0x24F,	%g2
	xnor	%l1,	0x114F,	%g6
	smulcc	%l2,	0x0138,	%i3
	addccc	%g4,	%i5,	%g1
	umulcc	%l0,	0x16F1,	%g3
	sdiv	%i2,	0x04AA,	%i7
	save %o4, 0x0871, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%i1,	%f18,	%f13
	fmuld8sux16	%f4,	%f4,	%f12
	xor	%i4,	0x07BB,	%o1
	and	%o2,	0x012E,	%l5
	and	%l3,	%o5,	%g7
	std	%f12,	[%l7 + 0x40]
	alignaddrl	%i6,	%l4,	%g5
	edge8l	%o7,	%o6,	%o0
	udiv	%i0,	0x08B7,	%o3
	edge8n	%g2,	%l1,	%l2
	fmuld8sux16	%f7,	%f2,	%f18
	movre	%i3,	%g4,	%i5
	ld	[%l7 + 0x2C],	%f31
	fmovsgu	%icc,	%f25,	%f3
	movrlez	%g6,	%g1,	%g3
	fand	%f24,	%f2,	%f22
	orncc	%l0,	%i7,	%i2
	ldsb	[%l7 + 0x26],	%o4
	sethi	0x0DBC,	%l6
	sdiv	%i1,	0x038D,	%o1
	edge16ln	%o2,	%i4,	%l3
	movn	%xcc,	%o5,	%l5
	edge32ln	%g7,	%l4,	%i6
	and	%o7,	0x0F77,	%o6
	fcmple16	%f22,	%f12,	%o0
	sth	%i0,	[%l7 + 0x5A]
	fcmpgt32	%f30,	%f0,	%g5
	movpos	%icc,	%o3,	%g2
	fmovscs	%xcc,	%f18,	%f25
	mulx	%l1,	%i3,	%l2
	fmovsg	%icc,	%f1,	%f13
	edge8ln	%i5,	%g6,	%g1
	fandnot1	%f20,	%f26,	%f2
	subc	%g4,	0x1962,	%g3
	std	%f0,	[%l7 + 0x08]
	sir	0x1786
	popc	0x0FCF,	%l0
	smul	%i7,	0x0082,	%i2
	fmovde	%icc,	%f19,	%f16
	alignaddrl	%l6,	%i1,	%o1
	edge32	%o4,	%i4,	%l3
	sir	0x0374
	restore %o5, 0x10CC, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x68, %o6
	ldub	[%l7 + %o6],	%g7
	fmul8x16al	%f3,	%f26,	%f10
	movrgz	%l5,	0x20A,	%l4
	andn	%o7,	0x0B61,	%i6
	ldsb	[%l7 + 0x73],	%o6
	edge8l	%i0,	%g5,	%o3
	ld	[%l7 + 0x40],	%f6
	st	%f24,	[%l7 + 0x2C]
	fmovrdlz	%g2,	%f30,	%f16
	movge	%icc,	%o0,	%l1
	subc	%l2,	%i5,	%i3
	move	%icc,	%g6,	%g1
	movn	%xcc,	%g4,	%l0
	addcc	%i7,	0x01BD,	%i2
	ld	[%l7 + 0x2C],	%f15
	sllx	%l6,	%i1,	%g3
	andcc	%o1,	%i4,	%o4
	fpsub16s	%f28,	%f4,	%f17
	movg	%xcc,	%o5,	%o2
	movn	%xcc,	%g7,	%l5
	or	%l4,	%o7,	%l3
	edge16	%i6,	%i0,	%o6
	addcc	%o3,	%g5,	%g2
	ldd	[%l7 + 0x78],	%f30
	xnorcc	%l1,	0x0126,	%o0
	ldsb	[%l7 + 0x7E],	%l2
	fmuld8ulx16	%f6,	%f5,	%f16
	stw	%i3,	[%l7 + 0x1C]
	udivcc	%g6,	0x1BDB,	%i5
	edge16l	%g1,	%l0,	%g4
	movl	%xcc,	%i7,	%l6
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	movpos	%xcc,	%o1,	%i4
	movrlez	%o4,	%o5,	%g3
	fcmpne16	%f10,	%f24,	%g7
	fmovrdlez	%o2,	%f24,	%f4
	xnorcc	%l5,	%o7,	%l3
	edge8l	%l4,	%i0,	%o6
	sra	%i6,	0x0E,	%g5
	faligndata	%f24,	%f6,	%f12
	fornot1s	%f25,	%f13,	%f29
	srlx	%g2,	0x17,	%o3
	nop
	set	0x60, %i0
	ldsw	[%l7 + %i0],	%l1
	siam	0x2
	ldx	[%l7 + 0x50],	%l2
	edge8l	%o0,	%g6,	%i3
	addc	%g1,	0x0893,	%l0
	sra	%i5,	0x1D,	%g4
	umul	%i7,	%i1,	%i2
	and	%l6,	0x1CF6,	%o1
	fmovscs	%icc,	%f3,	%f8
	edge8	%o4,	%o5,	%i4
	movpos	%icc,	%g7,	%g3
	movl	%icc,	%o2,	%l5
	stx	%l3,	[%l7 + 0x28]
	save %l4, %i0, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i6,	0x312,	%o6
	ldsw	[%l7 + 0x5C],	%g5
	fmovdvc	%xcc,	%f2,	%f6
	fnor	%f2,	%f4,	%f22
	sdivx	%o3,	0x1DB9,	%g2
	fcmps	%fcc0,	%f23,	%f1
	fmovsneg	%xcc,	%f19,	%f0
	movgu	%icc,	%l1,	%o0
	lduw	[%l7 + 0x18],	%l2
	sethi	0x0E7A,	%g6
	stx	%g1,	[%l7 + 0x78]
	sra	%l0,	%i5,	%i3
	udivcc	%i7,	0x067F,	%i1
	st	%f1,	[%l7 + 0x34]
	ldsw	[%l7 + 0x24],	%i2
	restore %l6, %o1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o5,	%g4,	%i4
	lduw	[%l7 + 0x7C],	%g7
	edge8n	%o2,	%g3,	%l5
	move	%icc,	%l3,	%l4
	addccc	%o7,	%i6,	%i0
	array16	%g5,	%o6,	%o3
	stw	%g2,	[%l7 + 0x5C]
	lduw	[%l7 + 0x44],	%o0
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%l0
	addcc	%g6,	0x08E8,	%g1
	movle	%icc,	%l2,	%i5
	mulscc	%l0,	%i7,	%i3
	movne	%xcc,	%i2,	%i1
	smul	%l6,	0x0340,	%o4
	movrlez	%o5,	%g4,	%i4
	xor	%g7,	%o1,	%g3
	andcc	%o2,	%l3,	%l4
	edge8ln	%o7,	%i6,	%l5
	stw	%i0,	[%l7 + 0x40]
	sdivx	%o6,	0x1A11,	%o3
	ldd	[%l7 + 0x38],	%f18
	movneg	%icc,	%g2,	%o0
	edge8n	%l1,	%g5,	%g6
	movg	%icc,	%l2,	%i5
	add	%g1,	0x044B,	%l0
	alignaddr	%i7,	%i2,	%i1
	edge16l	%l6,	%i3,	%o5
	movgu	%icc,	%o4,	%g4
	edge16l	%i4,	%o1,	%g7
	fmovdgu	%icc,	%f8,	%f5
	udivcc	%o2,	0x1BAD,	%g3
	edge32ln	%l3,	%o7,	%i6
	edge8n	%l5,	%i0,	%o6
	orcc	%o3,	0x17F9,	%g2
	orncc	%l4,	%l1,	%g5
	addccc	%g6,	%l2,	%i5
	fmovdcc	%icc,	%f4,	%f12
	movne	%icc,	%g1,	%l0
	sethi	0x0571,	%o0
	stb	%i7,	[%l7 + 0x2D]
	array16	%i2,	%l6,	%i3
	ldsb	[%l7 + 0x56],	%o5
	stb	%o4,	[%l7 + 0x5F]
	udivx	%i1,	0x0068,	%i4
	addc	%o1,	%g4,	%g7
	fnegs	%f23,	%f26
	udiv	%g3,	0x161D,	%o2
	array16	%o7,	%i6,	%l5
	fmul8x16au	%f27,	%f26,	%f28
	fmovdpos	%icc,	%f26,	%f2
	movvs	%xcc,	%i0,	%l3
	fmovrsgz	%o6,	%f17,	%f3
	edge8l	%o3,	%g2,	%l4
	alignaddr	%l1,	%g6,	%g5
	subccc	%i5,	%l2,	%g1
	fornot1	%f26,	%f10,	%f22
	edge32	%l0,	%i7,	%o0
	fmovd	%f4,	%f14
	mova	%icc,	%l6,	%i3
	fmul8sux16	%f20,	%f28,	%f4
	move	%xcc,	%o5,	%o4
	movneg	%icc,	%i1,	%i4
	fmovscc	%xcc,	%f21,	%f21
	xorcc	%o1,	%i2,	%g4
	fmovrsgez	%g7,	%f0,	%f27
	movle	%icc,	%g3,	%o7
	fmovd	%f24,	%f14
	andncc	%i6,	%l5,	%o2
	ldsb	[%l7 + 0x62],	%l3
	umul	%i0,	0x1A57,	%o6
	subc	%o3,	%l4,	%l1
	ldx	[%l7 + 0x40],	%g6
	stb	%g2,	[%l7 + 0x54]
	ldsh	[%l7 + 0x7A],	%g5
	fxnor	%f8,	%f8,	%f18
	fmul8x16au	%f14,	%f24,	%f6
	movvc	%xcc,	%i5,	%g1
	movg	%icc,	%l0,	%i7
	edge16	%l2,	%o0,	%i3
	stw	%l6,	[%l7 + 0x38]
	stb	%o5,	[%l7 + 0x39]
	fors	%f24,	%f24,	%f8
	addccc	%o4,	%i4,	%i1
	andcc	%i2,	%o1,	%g7
	fpsub16	%f26,	%f28,	%f26
	fpsub32	%f6,	%f8,	%f8
	fsrc2s	%f24,	%f31
	movge	%xcc,	%g4,	%o7
	movrgz	%g3,	0x35B,	%l5
	xnor	%o2,	%l3,	%i6
	fxors	%f5,	%f0,	%f26
	movl	%icc,	%i0,	%o3
	orncc	%l4,	%l1,	%o6
	ld	[%l7 + 0x70],	%f26
	edge16n	%g2,	%g5,	%i5
	edge32	%g1,	%l0,	%i7
	movn	%icc,	%g6,	%l2
	fmul8x16al	%f15,	%f17,	%f14
	fmovsne	%xcc,	%f28,	%f11
	sir	0x0E70
	orcc	%i3,	0x1B24,	%l6
	siam	0x4
	movrne	%o0,	0x3B7,	%o5
	ldx	[%l7 + 0x60],	%i4
	movl	%icc,	%i1,	%o4
	movrne	%o1,	0x1C6,	%i2
	sll	%g7,	%o7,	%g4
	fpsub32	%f24,	%f8,	%f12
	srl	%l5,	%o2,	%l3
	fmovdle	%xcc,	%f3,	%f23
	smulcc	%g3,	0x0E26,	%i0
	smulcc	%i6,	0x0645,	%o3
	addcc	%l4,	0x012D,	%l1
	siam	0x3
	movleu	%xcc,	%o6,	%g5
	movgu	%xcc,	%g2,	%g1
	sll	%i5,	0x10,	%i7
	fmul8x16al	%f9,	%f20,	%f2
	pdist	%f24,	%f20,	%f4
	ldsw	[%l7 + 0x70],	%l0
	umul	%l2,	0x0C5D,	%i3
	stb	%g6,	[%l7 + 0x19]
	ldd	[%l7 + 0x38],	%i6
	fnot2	%f6,	%f20
	stx	%o0,	[%l7 + 0x38]
	movne	%icc,	%i4,	%o5
	sllx	%o4,	0x1B,	%o1
	movne	%xcc,	%i2,	%g7
	alignaddr	%o7,	%g4,	%l5
	alignaddr	%i1,	%l3,	%g3
	udivcc	%i0,	0x0D46,	%i6
	alignaddrl	%o3,	%o2,	%l4
	andn	%l1,	%g5,	%g2
	sdiv	%g1,	0x121D,	%o6
	udivcc	%i5,	0x17D8,	%l0
	ldd	[%l7 + 0x30],	%l2
	mulx	%i3,	%g6,	%l6
	andn	%o0,	0x0C41,	%i7
	edge16	%i4,	%o5,	%o4
	xorcc	%i2,	%g7,	%o1
	fmovsgu	%icc,	%f27,	%f12
	mulx	%g4,	%o7,	%l5
	fand	%f4,	%f4,	%f28
	sub	%i1,	%l3,	%g3
	array32	%i0,	%i6,	%o3
	movcc	%xcc,	%l4,	%l1
	ldsh	[%l7 + 0x6C],	%g5
	ldub	[%l7 + 0x4A],	%g2
	smulcc	%o2,	%o6,	%g1
	fandnot1s	%f6,	%f21,	%f11
	movre	%l0,	%l2,	%i5
	xor	%i3,	0x0397,	%l6
	sra	%g6,	%o0,	%i7
	array8	%o5,	%i4,	%i2
	edge32l	%g7,	%o4,	%o1
	ldub	[%l7 + 0x61],	%g4
	or	%o7,	%l5,	%l3
	fpsub16	%f4,	%f6,	%f6
	mova	%xcc,	%g3,	%i0
	xorcc	%i1,	%o3,	%l4
	fmovsg	%xcc,	%f31,	%f15
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	xnorcc	%l1,	%g2,	%o6
	array16	%o2,	%l0,	%l2
	st	%f27,	[%l7 + 0x50]
	fpadd32	%f20,	%f0,	%f2
	udivcc	%g1,	0x1053,	%i5
	fmovsle	%icc,	%f26,	%f27
	array16	%i3,	%l6,	%g6
	sra	%o0,	%o5,	%i4
	movl	%xcc,	%i7,	%i2
	ldx	[%l7 + 0x68],	%o4
	ldx	[%l7 + 0x20],	%g7
	subcc	%g4,	%o7,	%o1
	stw	%l3,	[%l7 + 0x74]
	stw	%g3,	[%l7 + 0x4C]
	movrgz	%l5,	%i0,	%o3
	fmovsgu	%icc,	%f3,	%f27
	movrne	%i1,	%i6,	%g5
	sir	0x1441
	movne	%xcc,	%l4,	%l1
	movg	%icc,	%o6,	%g2
	movgu	%xcc,	%l0,	%o2
	movre	%l2,	0x215,	%i5
	mulx	%i3,	%l6,	%g6
	edge32ln	%o0,	%o5,	%g1
	movg	%icc,	%i7,	%i2
	edge16l	%o4,	%g7,	%i4
	mulscc	%g4,	%o1,	%o7
	edge8	%g3,	%l5,	%l3
	andcc	%i0,	%o3,	%i1
	edge16l	%i6,	%l4,	%g5
	fpsub16	%f26,	%f8,	%f22
	fone	%f4
	fnor	%f2,	%f26,	%f20
	fmovrslez	%l1,	%f31,	%f1
	ld	[%l7 + 0x14],	%f17
	edge16	%g2,	%o6,	%l0
	save %l2, 0x0388, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x14],	%i3
	restore %l6, %g6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x78],	%f20
	fmovsgu	%icc,	%f16,	%f6
	umul	%o0,	%g1,	%i7
	sdivcc	%i2,	0x08F0,	%o5
	xnor	%o4,	0x0B72,	%i4
	fpsub32	%f12,	%f6,	%f28
	fornot1	%f30,	%f30,	%f0
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%g4
	movge	%xcc,	%o1,	%g7
	add	%o7,	0x03AC,	%l5
	fmovsn	%icc,	%f20,	%f3
	movle	%icc,	%l3,	%i0
	ld	[%l7 + 0x78],	%f9
	sra	%o3,	%i1,	%i6
	alignaddrl	%l4,	%g3,	%l1
	std	%f16,	[%l7 + 0x68]
	alignaddrl	%g2,	%o6,	%l0
	xnorcc	%l2,	%g5,	%i3
	fpack16	%f6,	%f31
	umul	%l6,	%o2,	%i5
	xnor	%o0,	%g1,	%i7
	fmovsa	%xcc,	%f30,	%f12
	movg	%xcc,	%i2,	%o5
	fmovdpos	%xcc,	%f16,	%f1
	lduw	[%l7 + 0x54],	%g6
	addccc	%i4,	%g4,	%o4
	ld	[%l7 + 0x50],	%f6
	fabsd	%f26,	%f26
	umulcc	%o1,	0x0A95,	%g7
	movg	%xcc,	%o7,	%l5
	st	%f11,	[%l7 + 0x18]
	movleu	%icc,	%i0,	%o3
	fmuld8ulx16	%f3,	%f7,	%f24
	ld	[%l7 + 0x78],	%f10
	movg	%icc,	%l3,	%i1
	orcc	%l4,	%i6,	%g3
	sdiv	%l1,	0x073D,	%g2
	sir	0x128D
	fsrc1	%f10,	%f0
	udivx	%o6,	0x07BA,	%l2
	std	%f8,	[%l7 + 0x68]
	xor	%g5,	0x10A4,	%l0
	fnot1	%f24,	%f8
	umul	%l6,	%o2,	%i3
	fornot2	%f12,	%f4,	%f14
	array32	%o0,	%i5,	%i7
	fcmps	%fcc0,	%f8,	%f8
	edge8ln	%i2,	%g1,	%o5
	ldd	[%l7 + 0x38],	%i4
	popc	0x030D,	%g6
	array32	%o4,	%o1,	%g7
	stx	%g4,	[%l7 + 0x50]
	bshuffle	%f14,	%f24,	%f4
	stw	%o7,	[%l7 + 0x14]
	fands	%f29,	%f0,	%f15
	ldd	[%l7 + 0x50],	%f0
	srl	%l5,	%i0,	%o3
	array8	%l3,	%l4,	%i6
	sll	%i1,	%l1,	%g2
	smulcc	%o6,	0x013F,	%l2
	sethi	0x1CE7,	%g5
	ldsw	[%l7 + 0x60],	%g3
	movleu	%xcc,	%l6,	%o2
	srax	%l0,	0x05,	%i3
	umulcc	%o0,	0x0258,	%i7
	xorcc	%i2,	0x1D6C,	%g1
	movvs	%xcc,	%o5,	%i5
	fornot1	%f6,	%f28,	%f8
	ldx	[%l7 + 0x40],	%g6
	fmul8ulx16	%f30,	%f22,	%f6
	subcc	%i4,	0x1049,	%o4
	srax	%o1,	%g7,	%o7
	ldd	[%l7 + 0x58],	%l4
	srlx	%g4,	0x02,	%i0
	edge32l	%l3,	%l4,	%o3
	ldd	[%l7 + 0x58],	%i0
	sllx	%i6,	%l1,	%o6
	umul	%g2,	%g5,	%g3
	fmovspos	%icc,	%f6,	%f26
	edge16	%l2,	%l6,	%l0
	stb	%i3,	[%l7 + 0x30]
	fcmple16	%f22,	%f30,	%o2
	siam	0x7
	add	%o0,	%i2,	%g1
	array16	%o5,	%i5,	%i7
	fmovsge	%xcc,	%f26,	%f25
	movrlez	%g6,	0x3B9,	%o4
	movrgez	%i4,	%g7,	%o7
	andcc	%l5,	%o1,	%i0
	ldx	[%l7 + 0x70],	%l3
	movle	%icc,	%g4,	%o3
	move	%xcc,	%l4,	%i6
	fnot2	%f30,	%f12
	movcs	%xcc,	%i1,	%l1
	alignaddrl	%g2,	%o6,	%g5
	subcc	%l2,	0x0841,	%l6
	fandnot2s	%f26,	%f6,	%f28
	xnor	%l0,	0x09C6,	%g3
	xnor	%i3,	0x00AF,	%o0
	smulcc	%i2,	0x0FD7,	%o2
	edge8	%g1,	%o5,	%i7
	subc	%i5,	%o4,	%g6
	move	%xcc,	%g7,	%i4
	smul	%o7,	%l5,	%o1
	movgu	%icc,	%l3,	%i0
	mulscc	%g4,	0x02FF,	%o3
	movg	%icc,	%l4,	%i1
	lduh	[%l7 + 0x26],	%l1
	move	%icc,	%g2,	%o6
	mulscc	%i6,	%g5,	%l6
	movrgz	%l0,	0x0E4,	%l2
	ldsh	[%l7 + 0x5C],	%i3
	addcc	%o0,	%i2,	%o2
	movre	%g1,	%g3,	%i7
	movrlz	%o5,	%o4,	%g6
	udivcc	%g7,	0x02EE,	%i4
	edge8ln	%o7,	%l5,	%i5
	fmovrslz	%l3,	%f24,	%f13
	andcc	%o1,	%i0,	%g4
	fcmpeq32	%f26,	%f8,	%l4
	subccc	%i1,	0x0C11,	%l1
	fand	%f20,	%f16,	%f4
	fone	%f18
	andn	%o3,	%o6,	%g2
	edge8l	%i6,	%g5,	%l0
	ldsb	[%l7 + 0x67],	%l2
	movg	%xcc,	%l6,	%i3
	umul	%o0,	0x1983,	%o2
	edge16l	%g1,	%g3,	%i2
	movrlez	%o5,	0x299,	%i7
	stw	%g6,	[%l7 + 0x7C]
	mova	%icc,	%o4,	%i4
	movvs	%xcc,	%o7,	%g7
	movgu	%xcc,	%i5,	%l3
	edge16l	%o1,	%l5,	%g4
	fcmpgt32	%f26,	%f26,	%i0
	array32	%l4,	%i1,	%o3
	save %l1, 0x1A71, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o6,	%g5,	%i6
	ldd	[%l7 + 0x40],	%f24
	fmovde	%xcc,	%f31,	%f31
	alignaddr	%l2,	%l0,	%l6
	fmovrslz	%o0,	%f8,	%f28
	addc	%o2,	0x1436,	%g1
	srax	%g3,	0x00,	%i3
	movgu	%xcc,	%o5,	%i2
	umulcc	%g6,	%o4,	%i7
	fmovse	%xcc,	%f15,	%f16
	ldd	[%l7 + 0x18],	%f10
	fandnot1s	%f21,	%f25,	%f13
	orn	%i4,	%o7,	%g7
	udivcc	%i5,	0x06F3,	%o1
	xorcc	%l5,	0x134E,	%g4
	edge16	%l3,	%i0,	%i1
	edge8n	%o3,	%l4,	%g2
	mova	%xcc,	%o6,	%g5
	fxnor	%f18,	%f18,	%f4
	std	%f12,	[%l7 + 0x08]
	movre	%l1,	%i6,	%l0
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%i6
	alignaddr	%o0,	%o2,	%l2
	xor	%g3,	0x1B95,	%i3
	move	%icc,	%o5,	%i2
	fpack32	%f4,	%f26,	%f22
	sdivx	%g1,	0x0608,	%o4
	fmovdpos	%xcc,	%f22,	%f6
	fandnot1	%f26,	%f16,	%f22
	fone	%f24
	fmovdne	%icc,	%f1,	%f0
	srax	%g6,	%i4,	%o7
	ldd	[%l7 + 0x10],	%g6
	mulx	%i5,	%o1,	%i7
	movl	%xcc,	%l5,	%g4
	array16	%l3,	%i0,	%o3
	udivx	%l4,	0x0D4B,	%g2
	sdivx	%o6,	0x1735,	%i1
	lduw	[%l7 + 0x48],	%g5
	fabsd	%f20,	%f10
	udivx	%l1,	0x1397,	%l0
	sethi	0x07B6,	%l6
	for	%f8,	%f18,	%f10
	sdivx	%o0,	0x05EF,	%i6
	addcc	%o2,	%l2,	%i3
	movrne	%o5,	%i2,	%g3
	movl	%xcc,	%o4,	%g1
	save %i4, %o7, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g7,	%o1,	%i5
	movgu	%icc,	%i7,	%l5
	smulcc	%g4,	%l3,	%o3
	movre	%l4,	0x32A,	%g2
	movgu	%icc,	%o6,	%i0
	srax	%g5,	0x04,	%l1
	orcc	%l0,	%l6,	%o0
	fmovs	%f22,	%f0
	sllx	%i1,	0x1C,	%i6
	fmovse	%xcc,	%f29,	%f1
	sethi	0x0632,	%l2
	movrgez	%o2,	0x3C3,	%i3
	array8	%o5,	%i2,	%g3
	movrlz	%o4,	%i4,	%o7
	movcs	%xcc,	%g6,	%g7
	orn	%o1,	%g1,	%i5
	subcc	%i7,	0x197C,	%l5
	smul	%g4,	%o3,	%l4
	alignaddrl	%l3,	%g2,	%o6
	movrlez	%i0,	%g5,	%l0
	ldsh	[%l7 + 0x26],	%l6
	array16	%l1,	%i1,	%o0
	mulx	%l2,	%i6,	%o2
	lduh	[%l7 + 0x26],	%o5
	addcc	%i3,	%i2,	%g3
	ldd	[%l7 + 0x20],	%f26
	st	%f21,	[%l7 + 0x48]
	edge16ln	%i4,	%o4,	%g6
	ldsh	[%l7 + 0x5C],	%g7
	movg	%xcc,	%o7,	%g1
	fmovdvs	%icc,	%f2,	%f1
	move	%xcc,	%o1,	%i7
	edge8l	%l5,	%i5,	%g4
	movl	%xcc,	%l4,	%l3
	andcc	%o3,	0x02C7,	%g2
	umul	%i0,	%o6,	%g5
	fcmps	%fcc0,	%f23,	%f14
	udivx	%l0,	0x08B9,	%l6
	xorcc	%l1,	%i1,	%l2
	fnot2	%f20,	%f14
	edge16n	%i6,	%o0,	%o5
	addc	%o2,	0x0976,	%i2
	umulcc	%i3,	%i4,	%g3
	movgu	%icc,	%o4,	%g7
	alignaddrl	%g6,	%o7,	%o1
	movle	%xcc,	%i7,	%g1
	edge16ln	%l5,	%g4,	%i5
	movrne	%l4,	%l3,	%o3
	fpsub32	%f16,	%f14,	%f22
	subc	%i0,	0x0D4D,	%o6
	movge	%xcc,	%g5,	%g2
	ldd	[%l7 + 0x48],	%f24
	movrlz	%l0,	0x0A1,	%l6
	mulscc	%i1,	%l1,	%l2
	movge	%xcc,	%o0,	%i6
	movne	%icc,	%o2,	%i2
	mulscc	%i3,	0x06C1,	%i4
	edge8n	%o5,	%g3,	%g7
	movleu	%xcc,	%g6,	%o4
	fnegd	%f20,	%f14
	fornot2	%f18,	%f16,	%f30
	edge16n	%o7,	%i7,	%g1
	mulscc	%o1,	0x148E,	%l5
	movrlez	%i5,	0x387,	%l4
	subc	%g4,	0x0D38,	%l3
	mulx	%i0,	0x0954,	%o3
	ldd	[%l7 + 0x38],	%o6
	xnor	%g5,	0x17F5,	%g2
	sdivcc	%l6,	0x1420,	%i1
	edge16l	%l0,	%l2,	%o0
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	nop
	set	0x5C, %i2
	ldsw	[%l7 + %i2],	%i2
	fmovd	%f2,	%f20
	fmovrse	%i4,	%f2,	%f2
	fmovsgu	%icc,	%f20,	%f6
	fmovsne	%xcc,	%f27,	%f30
	fmovsneg	%xcc,	%f1,	%f1
	fxnor	%f4,	%f6,	%f24
	st	%f23,	[%l7 + 0x28]
	edge8l	%o5,	%g3,	%i3
	udivcc	%g6,	0x1AFE,	%o4
	movrlez	%o7,	0x098,	%g7
	srlx	%i7,	%o1,	%g1
	srl	%i5,	%l5,	%g4
	xorcc	%l3,	%i0,	%l4
	fnor	%f12,	%f10,	%f0
	fmovrsne	%o6,	%f26,	%f15
	std	%f10,	[%l7 + 0x18]
	ldd	[%l7 + 0x78],	%o2
	sdivx	%g5,	0x18AC,	%l6
	umulcc	%i1,	0x1760,	%l0
	movrgez	%l2,	0x110,	%o0
	fandnot2s	%f9,	%f29,	%f17
	sdivcc	%i6,	0x0FC7,	%g2
	edge8	%l1,	%o2,	%i4
	fmuld8sux16	%f9,	%f7,	%f12
	ldsb	[%l7 + 0x19],	%o5
	edge32ln	%i2,	%g3,	%i3
	movre	%o4,	0x2E7,	%o7
	subccc	%g7,	0x08C0,	%i7
	sdivx	%g6,	0x030E,	%g1
	fmovsl	%icc,	%f21,	%f15
	movrlz	%o1,	%i5,	%g4
	movgu	%icc,	%l3,	%l5
	srl	%l4,	%i0,	%o6
	edge16ln	%o3,	%g5,	%i1
	umul	%l0,	0x0C58,	%l2
	orn	%l6,	%o0,	%i6
	stw	%g2,	[%l7 + 0x38]
	andncc	%o2,	%l1,	%i4
	or	%i2,	%o5,	%g3
	mulscc	%o4,	%i3,	%o7
	udiv	%g7,	0x1B19,	%g6
	ld	[%l7 + 0x74],	%f6
	andncc	%g1,	%i7,	%i5
	mova	%icc,	%o1,	%l3
	fmovdneg	%icc,	%f21,	%f18
	andn	%l5,	%g4,	%l4
	movgu	%xcc,	%o6,	%i0
	siam	0x6
	addccc	%o3,	%i1,	%l0
	st	%f2,	[%l7 + 0x50]
	udivx	%g5,	0x1954,	%l6
	restore %l2, %o0, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%g2,	%o2
	movleu	%xcc,	%l1,	%i2
	srlx	%o5,	%i4,	%o4
	srlx	%g3,	%i3,	%o7
	move	%xcc,	%g7,	%g1
	umulcc	%i7,	0x185E,	%g6
	fcmped	%fcc3,	%f22,	%f22
	addcc	%o1,	0x0CFB,	%i5
	ldd	[%l7 + 0x20],	%f18
	edge32l	%l3,	%g4,	%l5
	sdivcc	%l4,	0x0699,	%i0
	fmovdneg	%icc,	%f2,	%f12
	fpsub32	%f18,	%f24,	%f22
	sll	%o6,	0x16,	%o3
	array32	%l0,	%g5,	%i1
	fmovsgu	%xcc,	%f4,	%f8
	fmovsl	%icc,	%f19,	%f16
	andn	%l2,	0x004E,	%l6
	movn	%icc,	%o0,	%i6
	edge8n	%o2,	%g2,	%l1
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	sir	0x1C09
	edge8ln	%o4,	%g3,	%i3
	popc	0x0087,	%o7
	add	%g1,	0x04CE,	%i7
	udiv	%g6,	0x06FE,	%o1
	fabsd	%f0,	%f4
	orcc	%g7,	0x06ED,	%i5
	fabss	%f8,	%f28
	sdivx	%g4,	0x1154,	%l5
	andncc	%l3,	%l4,	%i0
	ldsb	[%l7 + 0x2F],	%o6
	subccc	%o3,	%l0,	%i1
	mulx	%g5,	%l2,	%o0
	smul	%i6,	%l6,	%o2
	fpackfix	%f24,	%f18
	edge32l	%g2,	%o5,	%l1
	fmovdl	%icc,	%f2,	%f11
	stb	%i2,	[%l7 + 0x49]
	fmovdg	%xcc,	%f6,	%f18
	movrgz	%i4,	0x3F3,	%o4
	fmovscc	%xcc,	%f29,	%f22
	st	%f5,	[%l7 + 0x50]
	popc	%g3,	%i3
	movge	%xcc,	%o7,	%i7
	smul	%g1,	%g6,	%o1
	edge8n	%g7,	%i5,	%l5
	movle	%xcc,	%l3,	%g4
	udiv	%l4,	0x12C7,	%i0
	movleu	%icc,	%o6,	%l0
	restore %o3, 0x09A1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i1,	%l2,	%i6
	movneg	%icc,	%o0,	%o2
	alignaddrl	%g2,	%o5,	%l6
	edge16	%l1,	%i2,	%o4
	movrne	%i4,	%g3,	%o7
	movcs	%xcc,	%i7,	%i3
	edge8l	%g1,	%o1,	%g7
	orncc	%i5,	0x0C11,	%g6
	movvs	%xcc,	%l5,	%l3
	edge8n	%g4,	%i0,	%l4
	movre	%l0,	%o6,	%g5
	udivx	%o3,	0x1B5E,	%i1
	fmovrslz	%i6,	%f3,	%f21
	edge8l	%o0,	%l2,	%o2
	subcc	%g2,	%l6,	%l1
	udiv	%i2,	0x027B,	%o5
	sdivcc	%i4,	0x1546,	%g3
	sra	%o7,	0x10,	%i7
	movrlez	%o4,	0x2F4,	%i3
	sllx	%g1,	0x03,	%o1
	xnorcc	%i5,	%g7,	%l5
	fsrc2s	%f6,	%f12
	sdiv	%g6,	0x15C0,	%g4
	andncc	%l3,	%i0,	%l4
	std	%f0,	[%l7 + 0x40]
	ldd	[%l7 + 0x68],	%o6
	xorcc	%g5,	0x0534,	%o3
	ldd	[%l7 + 0x10],	%l0
	ldd	[%l7 + 0x38],	%f24
	and	%i6,	%o0,	%i1
	ldx	[%l7 + 0x20],	%o2
	std	%f28,	[%l7 + 0x70]
	lduh	[%l7 + 0x7A],	%g2
	orn	%l2,	0x06B9,	%l6
	movrne	%l1,	%i2,	%i4
	sdivcc	%g3,	0x0F05,	%o5
	fmovsg	%xcc,	%f23,	%f30
	orn	%i7,	0x1304,	%o7
	save %o4, 0x1F70, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o1,	0x029D,	%i3
	mulx	%i5,	%g7,	%l5
	fmovsle	%icc,	%f23,	%f24
	ldx	[%l7 + 0x70],	%g6
	fmovrslez	%l3,	%f11,	%f30
	edge16n	%i0,	%l4,	%o6
	ldsw	[%l7 + 0x40],	%g4
	subcc	%o3,	0x14FA,	%l0
	mulx	%g5,	%i6,	%o0
	mulscc	%i1,	0x0D64,	%g2
	ldd	[%l7 + 0x50],	%f28
	fcmpgt32	%f0,	%f28,	%o2
	edge8	%l6,	%l1,	%i2
	fornot1	%f10,	%f20,	%f4
	fmovscc	%xcc,	%f26,	%f2
	sir	0x1787
	andncc	%i4,	%g3,	%l2
	stx	%i7,	[%l7 + 0x50]
	orn	%o7,	0x1490,	%o5
	stx	%g1,	[%l7 + 0x30]
	sdivcc	%o1,	0x1DD1,	%i3
	fnands	%f11,	%f11,	%f31
	ldd	[%l7 + 0x58],	%o4
	sra	%g7,	0x1C,	%i5
	movneg	%icc,	%l5,	%l3
	st	%f7,	[%l7 + 0x7C]
	udivx	%g6,	0x1DA8,	%l4
	xnor	%o6,	%g4,	%o3
	ldub	[%l7 + 0x2D],	%i0
	fcmpd	%fcc2,	%f22,	%f22
	sllx	%g5,	0x1E,	%i6
	orcc	%o0,	%l0,	%i1
	movn	%icc,	%o2,	%l6
	movl	%xcc,	%l1,	%g2
	addc	%i4,	%g3,	%l2
	fmovsleu	%xcc,	%f6,	%f4
	alignaddrl	%i7,	%o7,	%i2
	alignaddrl	%o5,	%o1,	%g1
	std	%f28,	[%l7 + 0x50]
	edge32ln	%i3,	%o4,	%g7
	std	%f8,	[%l7 + 0x70]
	udivx	%i5,	0x0D44,	%l5
	movl	%icc,	%g6,	%l3
	sll	%l4,	%g4,	%o6
	fand	%f24,	%f8,	%f20
	fmovrslez	%i0,	%f1,	%f14
	sdivx	%o3,	0x0AB3,	%g5
	movrlz	%o0,	0x27B,	%i6
	edge32n	%l0,	%i1,	%l6
	and	%l1,	0x1640,	%o2
	lduw	[%l7 + 0x38],	%g2
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	mova	%xcc,	%i4,	%o7
	andcc	%i2,	%o5,	%i7
	movpos	%xcc,	%o1,	%g1
	edge32l	%i3,	%g7,	%o4
	movcc	%icc,	%i5,	%l5
	stw	%l3,	[%l7 + 0x44]
	edge8ln	%g6,	%l4,	%o6
	movn	%xcc,	%i0,	%o3
	fnot2s	%f28,	%f20
	movn	%xcc,	%g4,	%g5
	save %i6, %o0, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%xcc,	%f7,	%f15
	sra	%i1,	%l1,	%o2
	for	%f10,	%f26,	%f14
	edge32n	%g2,	%l6,	%g3
	ldsb	[%l7 + 0x75],	%i4
	addc	%o7,	0x12D7,	%l2
	edge32l	%o5,	%i7,	%i2
	fmul8ulx16	%f14,	%f10,	%f30
	sdivx	%g1,	0x04A8,	%o1
	sub	%g7,	%o4,	%i3
	fmovsa	%icc,	%f19,	%f5
	fmovsn	%icc,	%f4,	%f21
	add	%i5,	0x1F58,	%l5
	faligndata	%f22,	%f22,	%f12
	xnorcc	%g6,	%l4,	%o6
	addccc	%i0,	0x0D75,	%o3
	udiv	%l3,	0x1948,	%g4
	xorcc	%i6,	0x1148,	%o0
	siam	0x7
	fmovscs	%icc,	%f23,	%f8
	fmovrslz	%l0,	%f19,	%f27
	sdivx	%g5,	0x0C83,	%i1
	smul	%o2,	%g2,	%l6
	fsrc1s	%f11,	%f31
	stb	%l1,	[%l7 + 0x2C]
	mova	%icc,	%i4,	%g3
	smulcc	%l2,	0x1D73,	%o5
	fnot1	%f30,	%f28
	array8	%o7,	%i2,	%i7
	sra	%o1,	0x02,	%g1
	popc	0x1C96,	%o4
	or	%i3,	0x04DF,	%g7
	movl	%icc,	%i5,	%g6
	fabsd	%f12,	%f6
	or	%l4,	0x008C,	%l5
	movleu	%xcc,	%o6,	%i0
	alignaddr	%l3,	%g4,	%i6
	sra	%o0,	0x01,	%o3
	movge	%icc,	%l0,	%i1
	fnands	%f8,	%f20,	%f9
	udivcc	%g5,	0x198B,	%g2
	subcc	%l6,	%o2,	%l1
	fnands	%f27,	%f30,	%f16
	fsrc2s	%f27,	%f16
	and	%g3,	0x12E1,	%i4
	nop
	set	0x3C, %g3
	lduw	[%l7 + %g3],	%o5
	fmovdcs	%xcc,	%f2,	%f31
	edge8n	%o7,	%l2,	%i7
	orcc	%i2,	0x175E,	%o1
	mulscc	%o4,	0x1701,	%g1
	sll	%g7,	0x00,	%i3
	fmovd	%f28,	%f24
	fmovdn	%xcc,	%f9,	%f18
	sra	%i5,	%g6,	%l4
	alignaddr	%o6,	%l5,	%l3
	fpackfix	%f24,	%f5
	movpos	%xcc,	%g4,	%i0
	movneg	%xcc,	%i6,	%o3
	fmovrde	%o0,	%f24,	%f0
	movre	%i1,	%l0,	%g2
	srlx	%l6,	0x1A,	%o2
	sth	%g5,	[%l7 + 0x3C]
	mulx	%g3,	0x186B,	%i4
	xor	%l1,	%o7,	%o5
	movne	%icc,	%i7,	%l2
	udiv	%o1,	0x1F87,	%i2
	andn	%g1,	%g7,	%o4
	fcmpgt32	%f20,	%f4,	%i5
	fnot1	%f0,	%f6
	movcc	%xcc,	%g6,	%i3
	orncc	%o6,	%l5,	%l4
	fcmple16	%f24,	%f10,	%l3
	movcs	%icc,	%g4,	%i6
	array8	%i0,	%o3,	%o0
	orncc	%l0,	%g2,	%i1
	movrlz	%o2,	0x2A6,	%l6
	fzero	%f8
	sdivcc	%g3,	0x1415,	%g5
	edge8n	%l1,	%i4,	%o7
	sllx	%o5,	0x0E,	%l2
	ldsh	[%l7 + 0x38],	%i7
	movleu	%xcc,	%o1,	%i2
	fcmple16	%f10,	%f12,	%g7
	mova	%icc,	%o4,	%i5
	fmovrdne	%g6,	%f0,	%f12
	fmovsa	%icc,	%f1,	%f27
	faligndata	%f6,	%f6,	%f28
	ldd	[%l7 + 0x78],	%g0
	edge8ln	%i3,	%l5,	%o6
	sra	%l4,	0x1D,	%l3
	st	%f2,	[%l7 + 0x14]
	fmovdleu	%xcc,	%f15,	%f16
	fmovrde	%g4,	%f14,	%f8
	add	%i0,	0x0C29,	%i6
	lduh	[%l7 + 0x60],	%o0
	movpos	%xcc,	%l0,	%g2
	addcc	%i1,	0x0551,	%o3
	fcmpgt16	%f8,	%f14,	%o2
	umulcc	%l6,	0x0066,	%g3
	sra	%g5,	0x0A,	%l1
	siam	0x2
	save %i4, 0x0B62, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%xcc,	%f5,	%f0
	sra	%o7,	%i7,	%o1
	or	%l2,	0x196B,	%g7
	movge	%xcc,	%i2,	%o4
	fmovsge	%icc,	%f7,	%f6
	orncc	%g6,	%g1,	%i3
	fpsub16	%f20,	%f10,	%f18
	xor	%l5,	%i5,	%o6
	movpos	%icc,	%l3,	%g4
	edge8n	%l4,	%i6,	%o0
	subc	%l0,	0x1C6D,	%g2
	fmovrdgez	%i1,	%f2,	%f22
	mulscc	%i0,	%o3,	%o2
	or	%l6,	0x01BA,	%g5
	fones	%f1
	save %l1, 0x13E2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0A0F,	%o5
	fcmpne32	%f22,	%f22,	%o7
	orcc	%g3,	%i7,	%o1
	sethi	0x1A04,	%l2
	fornot1s	%f8,	%f27,	%f16
	stb	%g7,	[%l7 + 0x56]
	sllx	%i2,	0x0A,	%o4
	sethi	0x1343,	%g1
	subcc	%g6,	%i3,	%l5
	ldsb	[%l7 + 0x6A],	%i5
	xnor	%l3,	0x0E0E,	%o6
	ldub	[%l7 + 0x37],	%g4
	andn	%i6,	%l4,	%o0
	edge16	%l0,	%g2,	%i0
	stx	%o3,	[%l7 + 0x40]
	movrne	%o2,	0x1A2,	%l6
	movrlez	%g5,	%i1,	%l1
	movleu	%icc,	%o5,	%o7
	fmovdle	%xcc,	%f22,	%f12
	edge16ln	%g3,	%i7,	%i4
	sllx	%l2,	%g7,	%i2
	movrlz	%o4,	0x376,	%o1
	mulscc	%g6,	%g1,	%l5
	movvs	%icc,	%i3,	%i5
	alignaddrl	%l3,	%g4,	%o6
	pdist	%f18,	%f28,	%f22
	movgu	%xcc,	%i6,	%o0
	mulx	%l0,	%g2,	%l4
	sdiv	%i0,	0x1309,	%o3
	ldub	[%l7 + 0x75],	%o2
	fmovdl	%icc,	%f4,	%f30
	subc	%l6,	%g5,	%l1
	edge8l	%o5,	%o7,	%i1
	fexpand	%f26,	%f28
	sdivcc	%i7,	0x092F,	%g3
	or	%i4,	0x024E,	%l2
	and	%i2,	%g7,	%o1
	fmovdn	%icc,	%f16,	%f3
	popc	0x1B7A,	%o4
	subc	%g6,	0x044E,	%g1
	smulcc	%i3,	%i5,	%l5
	fpadd32s	%f31,	%f8,	%f3
	udivx	%g4,	0x019A,	%l3
	alignaddr	%i6,	%o0,	%l0
	array16	%o6,	%l4,	%i0
	edge32l	%g2,	%o3,	%o2
	edge32ln	%g5,	%l1,	%o5
	popc	%l6,	%i1
	udivx	%o7,	0x13D9,	%g3
	edge32n	%i4,	%l2,	%i7
	sub	%g7,	0x0DED,	%i2
	sll	%o1,	0x1B,	%o4
	movl	%xcc,	%g6,	%i3
	fcmpeq16	%f28,	%f28,	%i5
	fmovrslez	%l5,	%f9,	%f21
	subccc	%g4,	0x0550,	%l3
	addccc	%i6,	%o0,	%g1
	ldsw	[%l7 + 0x7C],	%o6
	ldx	[%l7 + 0x68],	%l4
	mulscc	%i0,	%l0,	%o3
	popc	0x1519,	%o2
	sethi	0x1878,	%g5
	fmovrsgez	%g2,	%f14,	%f12
	sir	0x1473
	movneg	%xcc,	%o5,	%l6
	save %i1, 0x0B6A, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l1, %g3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x36],	%i7
	xnorcc	%l2,	0x1E9E,	%i2
	mulx	%g7,	%o4,	%o1
	xnorcc	%i3,	0x08ED,	%g6
	sir	0x07FE
	ldx	[%l7 + 0x48],	%i5
	fexpand	%f8,	%f2
	addcc	%g4,	%l5,	%l3
	edge16ln	%o0,	%i6,	%o6
	ld	[%l7 + 0x34],	%f19
	sdivcc	%l4,	0x0D69,	%g1
	movrlez	%i0,	0x18D,	%o3
	mulscc	%o2,	0x18A5,	%l0
	fmuld8ulx16	%f18,	%f25,	%f12
	ldd	[%l7 + 0x60],	%g2
	movrgz	%g5,	%o5,	%i1
	move	%xcc,	%o7,	%l6
	edge32ln	%g3,	%l1,	%i7
	addcc	%i4,	%l2,	%g7
	ldsh	[%l7 + 0x22],	%o4
	fnot1s	%f19,	%f2
	fsrc1s	%f9,	%f17
	sethi	0x0C37,	%i2
	sub	%o1,	0x0344,	%i3
	array8	%i5,	%g6,	%l5
	umulcc	%g4,	%o0,	%i6
	fmovrdgz	%o6,	%f22,	%f20
	movle	%icc,	%l4,	%l3
	and	%i0,	0x15C4,	%o3
	mulx	%g1,	0x1026,	%l0
	std	%f24,	[%l7 + 0x08]
	lduw	[%l7 + 0x28],	%o2
	fcmple16	%f20,	%f12,	%g5
	ldsh	[%l7 + 0x7C],	%o5
	subccc	%g2,	0x17BD,	%o7
	fand	%f8,	%f20,	%f2
	fpadd16	%f6,	%f24,	%f2
	ldd	[%l7 + 0x18],	%f6
	move	%xcc,	%i1,	%l6
	udivcc	%l1,	0x04E7,	%g3
	sub	%i7,	%l2,	%g7
	edge16n	%o4,	%i4,	%o1
	sethi	0x0288,	%i3
	move	%xcc,	%i5,	%i2
	movrlez	%l5,	0x049,	%g6
	movrgz	%g4,	%i6,	%o6
	ldub	[%l7 + 0x60],	%l4
	movleu	%icc,	%l3,	%o0
	orn	%i0,	0x1C35,	%o3
	ldd	[%l7 + 0x58],	%f8
	smulcc	%g1,	%l0,	%g5
	udiv	%o2,	0x03D3,	%g2
	xor	%o5,	0x12AB,	%o7
	fornot2	%f0,	%f28,	%f4
	lduw	[%l7 + 0x08],	%l6
	edge32n	%i1,	%g3,	%l1
	fxor	%f22,	%f4,	%f30
	ldsh	[%l7 + 0x56],	%i7
	movvc	%icc,	%l2,	%g7
	lduw	[%l7 + 0x34],	%o4
	stx	%o1,	[%l7 + 0x60]
	sra	%i3,	0x10,	%i5
	subc	%i4,	%i2,	%g6
	array32	%l5,	%g4,	%i6
	sir	0x0C06
	movpos	%xcc,	%l4,	%o6
	movn	%xcc,	%o0,	%i0
	lduw	[%l7 + 0x4C],	%l3
	fornot1s	%f0,	%f29,	%f15
	fcmpd	%fcc1,	%f18,	%f4
	ld	[%l7 + 0x60],	%f6
	sllx	%g1,	%l0,	%o3
	edge32l	%o2,	%g5,	%o5
	movrlz	%g2,	%o7,	%i1
	fmovrdlz	%l6,	%f26,	%f6
	movre	%l1,	%i7,	%l2
	orcc	%g3,	0x09E8,	%o4
	popc	%g7,	%i3
	edge8l	%o1,	%i4,	%i2
	fpadd32s	%f30,	%f23,	%f12
	movn	%xcc,	%i5,	%g6
	movge	%icc,	%l5,	%g4
	lduh	[%l7 + 0x42],	%l4
	movvs	%xcc,	%o6,	%i6
	smulcc	%i0,	0x1A1C,	%l3
	ldub	[%l7 + 0x54],	%o0
	movrgez	%l0,	0x142,	%o3
	sdiv	%g1,	0x0558,	%g5
	ld	[%l7 + 0x38],	%f16
	ldd	[%l7 + 0x70],	%f18
	fmovrdgz	%o5,	%f4,	%f8
	edge32n	%o2,	%g2,	%o7
	fmovsge	%icc,	%f18,	%f11
	srl	%l6,	%i1,	%l1
	or	%l2,	%g3,	%i7
	sra	%o4,	%i3,	%o1
	movvc	%xcc,	%g7,	%i4
	addc	%i2,	0x04D9,	%g6
	movcs	%icc,	%l5,	%i5
	fzeros	%f15
	lduh	[%l7 + 0x0E],	%g4
	fmovdcs	%xcc,	%f26,	%f11
	xorcc	%o6,	0x1EBA,	%l4
	movgu	%xcc,	%i0,	%l3
	st	%f22,	[%l7 + 0x1C]
	mulscc	%o0,	0x1995,	%i6
	bshuffle	%f12,	%f28,	%f10
	fmuld8sux16	%f3,	%f15,	%f16
	edge32ln	%l0,	%g1,	%o3
	xnor	%o5,	0x165E,	%o2
	st	%f30,	[%l7 + 0x64]
	st	%f10,	[%l7 + 0x78]
	andn	%g2,	%o7,	%g5
	sll	%l6,	%l1,	%i1
	sir	0x0224
	edge8l	%l2,	%i7,	%o4
	sllx	%i3,	%o1,	%g7
	srlx	%i4,	%i2,	%g6
	fmovdneg	%xcc,	%f31,	%f25
	edge32ln	%g3,	%i5,	%l5
	movrne	%g4,	%l4,	%o6
	alignaddr	%l3,	%i0,	%o0
	sdivx	%l0,	0x062B,	%g1
	array16	%o3,	%o5,	%o2
	smul	%g2,	%o7,	%i6
	sra	%l6,	0x0F,	%l1
	udivx	%g5,	0x1E99,	%i1
	fmovsneg	%icc,	%f20,	%f29
	movrgez	%i7,	%l2,	%i3
	fmuld8sux16	%f30,	%f4,	%f22
	add	%o4,	0x0932,	%g7
	mulscc	%o1,	%i2,	%i4
	sub	%g3,	0x02B2,	%i5
	ldsh	[%l7 + 0x64],	%l5
	addc	%g4,	0x0F17,	%g6
	srlx	%o6,	0x1E,	%l4
	movrlez	%l3,	%o0,	%l0
	alignaddrl	%g1,	%i0,	%o5
	ldsb	[%l7 + 0x63],	%o3
	srax	%o2,	%o7,	%i6
	fnot1s	%f24,	%f4
	subc	%g2,	0x0CA0,	%l1
	fnand	%f0,	%f2,	%f6
	fmovscc	%xcc,	%f1,	%f6
	fmovrdgz	%g5,	%f6,	%f24
	pdist	%f12,	%f8,	%f16
	umulcc	%l6,	0x1A0D,	%i1
	udivcc	%l2,	0x04B6,	%i7
	sllx	%i3,	%g7,	%o1
	mulx	%o4,	%i4,	%i2
	ldd	[%l7 + 0x20],	%g2
	sdivcc	%l5,	0x17D5,	%g4
	movneg	%icc,	%i5,	%g6
	movrne	%l4,	%l3,	%o6
	std	%f28,	[%l7 + 0x28]
	stb	%o0,	[%l7 + 0x6F]
	bshuffle	%f16,	%f30,	%f2
	umulcc	%l0,	%g1,	%o5
	movcs	%icc,	%o3,	%o2
	ldsb	[%l7 + 0x57],	%i0
	for	%f28,	%f18,	%f4
	movl	%xcc,	%i6,	%g2
	movre	%l1,	%g5,	%o7
	smul	%i1,	0x0555,	%l6
	lduw	[%l7 + 0x78],	%l2
	udiv	%i7,	0x085E,	%g7
	or	%o1,	0x0EC5,	%o4
	subcc	%i4,	0x11E1,	%i2
	fmovdpos	%icc,	%f31,	%f9
	sllx	%g3,	0x13,	%i3
	stb	%l5,	[%l7 + 0x67]
	sll	%g4,	%i5,	%g6
	fones	%f8
	ldsb	[%l7 + 0x25],	%l3
	fmovrde	%l4,	%f22,	%f24
	movge	%icc,	%o6,	%o0
	ldub	[%l7 + 0x49],	%l0
	movn	%icc,	%g1,	%o5
	movleu	%icc,	%o2,	%o3
	fmovsgu	%xcc,	%f2,	%f5
	add	%i6,	0x1C03,	%g2
	edge16ln	%l1,	%g5,	%o7
	movre	%i0,	0x124,	%l6
	faligndata	%f12,	%f0,	%f22
	fornot2s	%f17,	%f24,	%f3
	fcmple32	%f22,	%f20,	%l2
	array32	%i7,	%g7,	%i1
	array32	%o1,	%i4,	%o4
	edge8ln	%g3,	%i3,	%i2
	movn	%xcc,	%l5,	%g4
	subcc	%i5,	%g6,	%l4
	ldsw	[%l7 + 0x14],	%o6
	edge8l	%o0,	%l3,	%l0
	ldsw	[%l7 + 0x5C],	%g1
	edge32l	%o2,	%o3,	%o5
	sdiv	%i6,	0x1C38,	%l1
	umul	%g2,	0x00FE,	%o7
	xor	%i0,	0x00E3,	%g5
	fmovrdlez	%l6,	%f10,	%f8
	edge8n	%l2,	%i7,	%i1
	fmul8ulx16	%f18,	%f24,	%f16
	sdivcc	%g7,	0x0714,	%i4
	add	%o1,	%g3,	%o4
	subccc	%i3,	0x1814,	%l5
	orncc	%g4,	%i2,	%g6
	fmovdcs	%icc,	%f27,	%f6
	fpmerge	%f30,	%f31,	%f24
	movcc	%xcc,	%i5,	%o6
	array8	%o0,	%l4,	%l0
	umul	%g1,	0x1306,	%o2
	stb	%l3,	[%l7 + 0x3F]
	lduh	[%l7 + 0x56],	%o5
	sra	%i6,	%l1,	%g2
	edge32n	%o7,	%i0,	%g5
	smul	%o3,	0x1C31,	%l6
	sllx	%l2,	0x0B,	%i1
	andncc	%g7,	%i4,	%i7
	movleu	%xcc,	%o1,	%o4
	ld	[%l7 + 0x60],	%f29
	ldd	[%l7 + 0x10],	%g2
	movleu	%xcc,	%i3,	%l5
	andncc	%i2,	%g6,	%g4
	array32	%i5,	%o6,	%o0
	edge16	%l4,	%g1,	%o2
	movrgz	%l3,	0x366,	%o5
	stw	%l0,	[%l7 + 0x18]
	fmovrsgz	%i6,	%f13,	%f12
	andn	%l1,	%o7,	%g2
	edge16l	%i0,	%g5,	%o3
	ld	[%l7 + 0x5C],	%f21
	movleu	%icc,	%l6,	%l2
	movle	%icc,	%i1,	%g7
	lduh	[%l7 + 0x22],	%i7
	addcc	%o1,	0x156E,	%i4
	movg	%xcc,	%o4,	%i3
	movl	%xcc,	%g3,	%l5
	movrgez	%i2,	%g6,	%i5
	sdivcc	%o6,	0x0A15,	%g4
	fmovrslz	%o0,	%f7,	%f8
	fmovd	%f16,	%f24
	stb	%l4,	[%l7 + 0x78]
	ldub	[%l7 + 0x7F],	%o2
	stx	%g1,	[%l7 + 0x78]
	movrlz	%l3,	0x0F4,	%o5
	udivcc	%l0,	0x1B6B,	%i6
	fmovsgu	%xcc,	%f17,	%f20
	ldx	[%l7 + 0x28],	%o7
	xor	%l1,	%g2,	%i0
	nop
	set	0x18, %o7
	ldsw	[%l7 + %o7],	%o3
	edge8	%g5,	%l6,	%i1
	std	%f18,	[%l7 + 0x08]
	movle	%icc,	%l2,	%i7
	ldub	[%l7 + 0x2F],	%g7
	edge16	%i4,	%o4,	%i3
	ldd	[%l7 + 0x38],	%o0
	xor	%g3,	%l5,	%i2
	edge8ln	%g6,	%i5,	%g4
	array8	%o0,	%l4,	%o2
	fxnor	%f12,	%f18,	%f2
	movcs	%icc,	%g1,	%o6
	xorcc	%l3,	%o5,	%i6
	array32	%o7,	%l1,	%g2
	fmovsge	%icc,	%f17,	%f21
	sir	0x0AEF
	smul	%i0,	0x134A,	%o3
	edge32	%g5,	%l6,	%i1
	ldx	[%l7 + 0x20],	%l2
	edge16l	%l0,	%g7,	%i4
	movrgez	%i7,	0x06C,	%i3
	movg	%xcc,	%o1,	%o4
	alignaddr	%l5,	%i2,	%g6
	edge32	%i5,	%g4,	%g3
	srl	%l4,	%o2,	%o0
	srl	%g1,	0x0C,	%l3
	subccc	%o6,	%i6,	%o5
	ldd	[%l7 + 0x50],	%f4
	fnegd	%f4,	%f6
	move	%xcc,	%o7,	%g2
	mova	%xcc,	%l1,	%o3
	movrgz	%i0,	%g5,	%l6
	and	%l2,	%l0,	%g7
	fmul8x16al	%f10,	%f19,	%f6
	movne	%icc,	%i4,	%i7
	fmovrdne	%i1,	%f28,	%f18
	fmuld8ulx16	%f28,	%f11,	%f22
	movle	%xcc,	%o1,	%o4
	edge8	%l5,	%i3,	%i2
	udiv	%i5,	0x17A4,	%g4
	ldd	[%l7 + 0x48],	%f26
	restore %g3, %l4, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o2,	%o0
	fcmpgt16	%f14,	%f28,	%g1
	faligndata	%f30,	%f10,	%f24
	addc	%l3,	%o6,	%o5
	movvc	%icc,	%o7,	%i6
	edge32ln	%l1,	%o3,	%i0
	subc	%g2,	%g5,	%l2
	stx	%l0,	[%l7 + 0x28]
	mulx	%l6,	%g7,	%i7
	mova	%icc,	%i4,	%o1
	popc	0x0DC7,	%o4
	ld	[%l7 + 0x48],	%f12
	edge32n	%i1,	%i3,	%l5
	movne	%xcc,	%i2,	%g4
	fmovdvs	%xcc,	%f13,	%f5
	edge8ln	%g3,	%i5,	%g6
	addccc	%o2,	0x12F8,	%o0
	ld	[%l7 + 0x20],	%f28
	movrgz	%g1,	0x3FB,	%l3
	srax	%l4,	0x13,	%o6
	sll	%o5,	%i6,	%l1
	udivx	%o7,	0x19DD,	%o3
	subc	%i0,	0x1242,	%g2
	sir	0x0362
	movre	%l2,	0x288,	%g5
	edge32	%l0,	%l6,	%i7
	edge32l	%i4,	%g7,	%o4
	orcc	%i1,	%o1,	%i3
	fmovrsgz	%l5,	%f0,	%f25
	st	%f21,	[%l7 + 0x44]
	nop
	set	0x20, %o2
	ldx	[%l7 + %o2],	%g4
	sethi	0x1088,	%g3
	movn	%icc,	%i2,	%i5
	st	%f17,	[%l7 + 0x44]
	udivx	%o2,	0x15E7,	%o0
	sub	%g6,	%g1,	%l4
	movrlz	%l3,	%o6,	%i6
	addcc	%o5,	0x0E4E,	%l1
	xnor	%o7,	%o3,	%i0
	array32	%g2,	%g5,	%l2
	sub	%l6,	0x16DC,	%i7
	ldsh	[%l7 + 0x42],	%l0
	movgu	%xcc,	%i4,	%o4
	fsrc1s	%f3,	%f28
	edge8	%g7,	%i1,	%o1
	edge32	%l5,	%g4,	%i3
	sra	%g3,	0x15,	%i2
	fandnot1s	%f27,	%f8,	%f17
	sdiv	%o2,	0x1F23,	%o0
	add	%i5,	0x1AFF,	%g6
	fexpand	%f9,	%f4
	edge32l	%l4,	%l3,	%o6
	siam	0x3
	movn	%xcc,	%g1,	%i6
	move	%xcc,	%o5,	%o7
	nop
	set	0x70, %i1
	sth	%l1,	[%l7 + %i1]
	fmovdgu	%icc,	%f4,	%f25
	smulcc	%i0,	0x1A44,	%o3
	umul	%g5,	%l2,	%l6
	fmovsne	%xcc,	%f14,	%f8
	stb	%g2,	[%l7 + 0x17]
	ldsh	[%l7 + 0x10],	%i7
	ld	[%l7 + 0x74],	%f29
	umul	%i4,	%l0,	%o4
	xnorcc	%g7,	%o1,	%i1
	udivx	%g4,	0x0592,	%l5
	movvs	%icc,	%i3,	%g3
	fcmpeq32	%f22,	%f18,	%o2
	edge32l	%o0,	%i5,	%g6
	lduw	[%l7 + 0x60],	%i2
	fmovrdne	%l4,	%f8,	%f2
	movrgz	%o6,	%l3,	%i6
	umul	%o5,	%g1,	%o7
	umulcc	%i0,	0x0E33,	%l1
	popc	%o3,	%l2
	fmovdl	%icc,	%f1,	%f2
	sdivcc	%g5,	0x0720,	%g2
	movrlez	%l6,	%i4,	%i7
	st	%f1,	[%l7 + 0x68]
	sra	%l0,	%o4,	%g7
	movrne	%i1,	0x34A,	%g4
	fsrc1s	%f27,	%f8
	ldd	[%l7 + 0x20],	%f2
	movrgz	%o1,	0x28A,	%i3
	movcs	%icc,	%l5,	%g3
	movvc	%xcc,	%o0,	%i5
	stw	%g6,	[%l7 + 0x28]
	or	%o2,	%i2,	%o6
	sub	%l3,	%l4,	%o5
	fxor	%f24,	%f24,	%f14
	edge8l	%g1,	%o7,	%i0
	movne	%icc,	%l1,	%o3
	stw	%i6,	[%l7 + 0x3C]
	movgu	%icc,	%l2,	%g5
	sll	%g2,	0x04,	%i4
	fsrc1	%f24,	%f0
	ldd	[%l7 + 0x18],	%f28
	fcmped	%fcc1,	%f20,	%f20
	movvc	%xcc,	%l6,	%l0
	edge32l	%o4,	%i7,	%i1
	fnot2	%f6,	%f2
	sir	0x1F45
	subcc	%g4,	%g7,	%i3
	ld	[%l7 + 0x10],	%f25
	smul	%l5,	0x0B17,	%o1
	fcmpne16	%f12,	%f0,	%o0
	movrgz	%i5,	0x38C,	%g6
	movcc	%xcc,	%g3,	%i2
	ldsw	[%l7 + 0x08],	%o2
	fmuld8sux16	%f6,	%f19,	%f22
	subcc	%l3,	0x184E,	%o6
	edge8l	%l4,	%o5,	%o7
	movrlz	%g1,	0x00F,	%l1
	movrne	%i0,	0x2BE,	%o3
	mulscc	%l2,	%g5,	%i6
	edge8	%i4,	%l6,	%l0
	sub	%o4,	0x1DBE,	%i7
	fandnot1s	%f27,	%f22,	%f24
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	movleu	%icc,	%g7,	%g4
	mova	%icc,	%l5,	%i3
	edge8n	%o0,	%i5,	%g6
	move	%xcc,	%g3,	%i2
	and	%o1,	0x11FA,	%o2
	movl	%icc,	%l3,	%o6
	fpsub16s	%f7,	%f17,	%f19
	xnor	%l4,	0x00EF,	%o7
	smulcc	%o5,	0x0156,	%l1
	edge8ln	%i0,	%g1,	%o3
	udivx	%l2,	0x10D3,	%i6
	edge32ln	%g5,	%i4,	%l0
	sra	%l6,	0x0C,	%o4
	fmovdle	%icc,	%f28,	%f31
	restore %i1, 0x0A7A, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%i7,	%g4
	movvc	%xcc,	%l5,	%g7
	edge16ln	%o0,	%i3,	%i5
	movge	%icc,	%g3,	%g6
	sra	%i2,	%o1,	%o2
	fcmped	%fcc1,	%f20,	%f22
	edge32ln	%o6,	%l3,	%l4
	ldd	[%l7 + 0x38],	%f18
	fmul8sux16	%f8,	%f10,	%f18
	std	%f2,	[%l7 + 0x28]
	andncc	%o5,	%o7,	%i0
	fornot1s	%f25,	%f27,	%f1
	movl	%icc,	%l1,	%g1
	sdivx	%o3,	0x0792,	%l2
	fmovde	%xcc,	%f16,	%f22
	ldsb	[%l7 + 0x50],	%i6
	udivcc	%g5,	0x0757,	%i4
	movl	%icc,	%l0,	%o4
	fmuld8ulx16	%f25,	%f30,	%f24
	movleu	%icc,	%i1,	%g2
	fmovrde	%l6,	%f2,	%f8
	udivx	%i7,	0x190F,	%l5
	ldub	[%l7 + 0x37],	%g7
	fmovse	%xcc,	%f22,	%f27
	edge16l	%g4,	%o0,	%i3
	sth	%i5,	[%l7 + 0x10]
	sdivcc	%g6,	0x02EC,	%i2
	alignaddr	%g3,	%o2,	%o1
	movrlez	%l3,	%l4,	%o6
	fpackfix	%f30,	%f19
	movvs	%xcc,	%o7,	%i0
	fmovrdgz	%l1,	%f14,	%f2
	sir	0x1FD8
	fpack16	%f14,	%f15
	edge8l	%g1,	%o3,	%o5
	fornot2	%f18,	%f20,	%f10
	array8	%i6,	%l2,	%i4
	udivcc	%g5,	0x1E3B,	%l0
	movrne	%i1,	0x100,	%g2
	edge32ln	%l6,	%o4,	%l5
	array16	%i7,	%g7,	%o0
	orncc	%i3,	0x1E3E,	%i5
	fmovdpos	%icc,	%f30,	%f4
	fmovrdgez	%g6,	%f12,	%f12
	fmovdcc	%icc,	%f10,	%f14
	mulx	%g4,	%i2,	%g3
	mova	%xcc,	%o1,	%l3
	ldx	[%l7 + 0x78],	%o2
	sub	%l4,	0x0034,	%o6
	movle	%icc,	%o7,	%i0
	addccc	%l1,	0x122C,	%o3
	or	%o5,	%g1,	%i6
	movg	%xcc,	%l2,	%i4
	sth	%l0,	[%l7 + 0x0A]
	ldd	[%l7 + 0x68],	%f8
	umulcc	%g5,	%i1,	%g2
	orn	%l6,	%l5,	%i7
	stw	%g7,	[%l7 + 0x28]
	lduh	[%l7 + 0x56],	%o4
	movn	%xcc,	%i3,	%i5
	edge16ln	%g6,	%o0,	%g4
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	andcc	%o1,	0x183F,	%l4
	sub	%o2,	0x1F7F,	%o6
	andn	%o7,	0x0EF2,	%i0
	movvc	%xcc,	%o3,	%l1
	sir	0x01A2
	smul	%o5,	0x09D1,	%i6
	fmovsg	%xcc,	%f6,	%f22
	lduh	[%l7 + 0x68],	%g1
	sub	%l2,	%i4,	%g5
	subc	%l0,	0x1A79,	%g2
	fpsub16	%f20,	%f8,	%f30
	srlx	%l6,	%l5,	%i1
	fornot2s	%f5,	%f11,	%f20
	edge16	%i7,	%o4,	%g7
	siam	0x2
	movle	%xcc,	%i5,	%i3
	xnor	%g6,	0x18C0,	%g4
	edge8ln	%o0,	%i2,	%g3
	movrlez	%o1,	%l3,	%l4
	orn	%o2,	0x0901,	%o6
	edge16l	%o7,	%i0,	%l1
	umulcc	%o3,	%o5,	%g1
	mulx	%l2,	%i4,	%i6
	umulcc	%l0,	%g5,	%l6
	fmul8x16au	%f9,	%f18,	%f22
	fpack16	%f0,	%f26
	movle	%icc,	%g2,	%l5
	fpadd16	%f2,	%f2,	%f18
	movre	%i1,	0x26F,	%o4
	fmovdvs	%icc,	%f7,	%f10
	array8	%g7,	%i7,	%i3
	movrne	%i5,	0x18B,	%g6
	srax	%g4,	0x13,	%o0
	movn	%icc,	%g3,	%i2
	sllx	%l3,	%l4,	%o2
	fandnot1s	%f25,	%f5,	%f15
	pdist	%f12,	%f12,	%f6
	movrne	%o1,	0x375,	%o7
	subccc	%o6,	%i0,	%o3
	fcmpne16	%f30,	%f16,	%o5
	movvc	%xcc,	%g1,	%l1
	fxors	%f18,	%f24,	%f18
	alignaddrl	%l2,	%i6,	%l0
	orncc	%i4,	0x0992,	%g5
	fmovdvc	%icc,	%f30,	%f11
	std	%f28,	[%l7 + 0x78]
	subcc	%l6,	0x07D0,	%g2
	popc	0x1577,	%i1
	movle	%xcc,	%l5,	%g7
	andcc	%o4,	0x141B,	%i7
	movle	%xcc,	%i5,	%i3
	subc	%g4,	0x0DF5,	%g6
	fmovrsgz	%g3,	%f26,	%f15
	srl	%o0,	0x1F,	%i2
	fmovsn	%icc,	%f5,	%f2
	sth	%l3,	[%l7 + 0x1A]
	fcmpes	%fcc1,	%f2,	%f3
	mulscc	%o2,	0x1BBD,	%o1
	sub	%l4,	%o7,	%o6
	xnorcc	%o3,	%i0,	%g1
	edge32	%l1,	%l2,	%i6
	fmovsle	%xcc,	%f6,	%f16
	fpmerge	%f1,	%f24,	%f0
	move	%xcc,	%l0,	%i4
	array16	%o5,	%l6,	%g2
	addc	%g5,	0x0D4E,	%l5
	fmovdvc	%icc,	%f26,	%f1
	srl	%i1,	%g7,	%o4
	popc	%i7,	%i3
	alignaddr	%g4,	%i5,	%g6
	udivcc	%o0,	0x0E0C,	%i2
	subcc	%g3,	0x041A,	%o2
	udivcc	%o1,	0x09F8,	%l3
	subc	%l4,	%o6,	%o7
	movrgez	%i0,	%o3,	%l1
	subccc	%l2,	%i6,	%g1
	movneg	%icc,	%l0,	%i4
	orcc	%l6,	%o5,	%g2
	ldsh	[%l7 + 0x4C],	%l5
	fnor	%f2,	%f26,	%f6
	fcmpne32	%f14,	%f14,	%g5
	fcmpne32	%f30,	%f16,	%g7
	orcc	%i1,	%i7,	%o4
	ldsh	[%l7 + 0x72],	%i3
	stw	%g4,	[%l7 + 0x48]
	edge16ln	%g6,	%i5,	%i2
	smulcc	%g3,	0x1F1D,	%o2
	addcc	%o1,	0x0A96,	%l3
	umulcc	%l4,	%o6,	%o0
	alignaddrl	%o7,	%o3,	%l1
	lduh	[%l7 + 0x40],	%l2
	xorcc	%i0,	0x1B56,	%i6
	udiv	%g1,	0x1EC0,	%l0
	edge16n	%i4,	%o5,	%g2
	smulcc	%l6,	0x0CB3,	%g5
	stx	%l5,	[%l7 + 0x70]
	movleu	%icc,	%g7,	%i7
	movrgez	%o4,	0x33F,	%i1
	edge32l	%i3,	%g4,	%i5
	sub	%i2,	%g6,	%o2
	sethi	0x0FCE,	%g3
	movn	%xcc,	%l3,	%o1
	restore %l4, %o6, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o0,	0x11D8,	%l1
	fmovde	%icc,	%f20,	%f29
	fmovdle	%icc,	%f4,	%f4
	move	%xcc,	%l2,	%i0
	bshuffle	%f2,	%f0,	%f14
	fmovscs	%icc,	%f30,	%f26
	fcmpne32	%f8,	%f0,	%o3
	movrgez	%g1,	0x3BB,	%i6
	array8	%l0,	%i4,	%o5
	fcmpeq32	%f18,	%f0,	%l6
	ldsw	[%l7 + 0x34],	%g2
	for	%f0,	%f0,	%f28
	xorcc	%l5,	%g7,	%i7
	ldx	[%l7 + 0x58],	%o4
	fnegs	%f26,	%f9
	umulcc	%i1,	0x0BED,	%i3
	fmovda	%icc,	%f29,	%f14
	smul	%g4,	%i5,	%i2
	srlx	%g6,	0x0A,	%o2
	alignaddr	%g3,	%g5,	%l3
	sethi	0x0B32,	%o1
	fmovse	%xcc,	%f18,	%f6
	std	%f30,	[%l7 + 0x48]
	movn	%icc,	%l4,	%o6
	fnors	%f7,	%f10,	%f25
	orn	%o7,	%l1,	%o0
	fnegd	%f2,	%f10
	ldsw	[%l7 + 0x60],	%i0
	ldsb	[%l7 + 0x37],	%l2
	movrne	%g1,	%o3,	%l0
	udivx	%i6,	0x02B1,	%o5
	movrgz	%l6,	%i4,	%g2
	edge32n	%g7,	%i7,	%o4
	srax	%i1,	%i3,	%g4
	movrgz	%i5,	%l5,	%g6
	movl	%xcc,	%i2,	%o2
	sub	%g5,	%l3,	%o1
	stb	%g3,	[%l7 + 0x6D]
	sra	%l4,	0x17,	%o6
	movgu	%icc,	%l1,	%o0
	stb	%i0,	[%l7 + 0x66]
	movvc	%icc,	%l2,	%g1
	fnand	%f28,	%f22,	%f16
	sdivcc	%o3,	0x0500,	%l0
	edge32n	%o7,	%i6,	%o5
	ldd	[%l7 + 0x60],	%i4
	array16	%l6,	%g2,	%i7
	movne	%xcc,	%o4,	%i1
	srlx	%g7,	0x06,	%g4
	movrne	%i5,	0x153,	%l5
	edge32l	%i3,	%g6,	%i2
	movn	%xcc,	%o2,	%l3
	fcmple32	%f14,	%f6,	%o1
	edge32ln	%g5,	%l4,	%g3
	lduh	[%l7 + 0x5A],	%o6
	edge16ln	%l1,	%o0,	%i0
	fcmple32	%f12,	%f24,	%l2
	movrlz	%o3,	%g1,	%o7
	sllx	%i6,	0x04,	%l0
	subc	%o5,	0x1BF0,	%i4
	and	%l6,	%g2,	%o4
	save %i7, 0x0A5E, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i1,	%i5,	%g4
	fone	%f0
	fnor	%f30,	%f26,	%f22
	fornot1s	%f20,	%f0,	%f27
	sdivcc	%i3,	0x0070,	%g6
	xor	%l5,	0x16EE,	%i2
	movrgez	%l3,	%o2,	%o1
	movrgz	%g5,	0x2AD,	%g3
	movvs	%icc,	%o6,	%l4
	sdivcc	%l1,	0x0BE2,	%i0
	edge32ln	%l2,	%o0,	%o3
	or	%o7,	0x0F95,	%g1
	sir	0x13C1
	nop
	set	0x0C, %g1
	stw	%i6,	[%l7 + %g1]
	movne	%xcc,	%o5,	%l0
	movne	%icc,	%l6,	%g2
	udivx	%o4,	0x122B,	%i7
	array32	%g7,	%i1,	%i5
	sir	0x06CF
	movneg	%icc,	%i4,	%g4
	sllx	%i3,	%g6,	%l5
	movneg	%xcc,	%i2,	%l3
	movvs	%icc,	%o1,	%g5
	ldd	[%l7 + 0x30],	%o2
	movn	%xcc,	%g3,	%o6
	xnorcc	%l4,	%l1,	%i0
	mulx	%o0,	0x17AE,	%l2
	movrgez	%o3,	0x3AD,	%g1
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%i6
	fabss	%f4,	%f8
	movvc	%xcc,	%o7,	%l0
	ldub	[%l7 + 0x3F],	%o5
	movcc	%xcc,	%g2,	%l6
	xnor	%o4,	0x103D,	%g7
	movl	%xcc,	%i1,	%i5
	fmovsvs	%icc,	%f18,	%f30
	udiv	%i7,	0x077A,	%g4
	stb	%i3,	[%l7 + 0x0F]
	movrgez	%g6,	%l5,	%i4
	sir	0x0846
	ldx	[%l7 + 0x38],	%i2
	edge16ln	%l3,	%g5,	%o2
	fmovsne	%icc,	%f9,	%f6
	fmovdleu	%xcc,	%f30,	%f22
	fmovda	%icc,	%f1,	%f26
	sdivcc	%g3,	0x15E6,	%o1
	orcc	%l4,	0x022E,	%l1
	fcmpeq16	%f16,	%f4,	%i0
	sth	%o6,	[%l7 + 0x24]
	edge16l	%l2,	%o3,	%g1
	udivcc	%i6,	0x1F8D,	%o7
	orn	%l0,	0x17CA,	%o0
	movre	%g2,	0x319,	%l6
	lduw	[%l7 + 0x38],	%o4
	stw	%g7,	[%l7 + 0x48]
	add	%i1,	0x10AD,	%i5
	srax	%o5,	0x1E,	%i7
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	andn	%l5,	0x155B,	%i4
	stw	%i2,	[%l7 + 0x58]
	fpadd32	%f22,	%f6,	%f12
	sdivx	%g6,	0x13B0,	%g5
	ld	[%l7 + 0x74],	%f5
	sdiv	%l3,	0x12E5,	%g3
	ldsb	[%l7 + 0x39],	%o2
	movcs	%xcc,	%l4,	%l1
	xorcc	%i0,	0x1C54,	%o1
	edge32l	%l2,	%o3,	%o6
	edge32l	%i6,	%o7,	%g1
	movvs	%xcc,	%l0,	%g2
	lduh	[%l7 + 0x4E],	%l6
	nop
	set	0x1C, %i3
	sth	%o0,	[%l7 + %i3]
	fandnot1	%f6,	%f20,	%f22
	movvc	%xcc,	%g7,	%i1
	std	%f28,	[%l7 + 0x38]
	fmovrslz	%o4,	%f24,	%f23
	movrgz	%i5,	%i7,	%g4
	movvs	%icc,	%o5,	%l5
	srax	%i3,	0x0D,	%i2
	movl	%icc,	%g6,	%i4
	movcc	%icc,	%g5,	%g3
	fsrc2s	%f18,	%f23
	nop
	set	0x30, %l2
	lduw	[%l7 + %l2],	%l3
	fmovsg	%xcc,	%f10,	%f16
	edge32l	%o2,	%l4,	%i0
	edge32l	%o1,	%l1,	%l2
	addccc	%o3,	0x1BCF,	%i6
	add	%o7,	0x1FFA,	%g1
	movpos	%icc,	%l0,	%o6
	lduw	[%l7 + 0x34],	%g2
	fmovdcs	%icc,	%f29,	%f14
	xor	%l6,	%g7,	%o0
	add	%o4,	0x189B,	%i1
	array32	%i5,	%g4,	%i7
	movcc	%xcc,	%l5,	%o5
	array32	%i3,	%i2,	%g6
	movpos	%xcc,	%g5,	%g3
	smul	%i4,	%o2,	%l4
	edge32	%l3,	%i0,	%o1
	movrlz	%l1,	0x031,	%o3
	fmuld8ulx16	%f2,	%f0,	%f16
	orn	%i6,	0x118A,	%o7
	andcc	%g1,	%l2,	%o6
	movrgz	%l0,	0x28E,	%g2
	edge32l	%g7,	%o0,	%o4
	mulx	%l6,	%i5,	%g4
	movrgez	%i1,	%i7,	%l5
	stx	%i3,	[%l7 + 0x38]
	srl	%i2,	0x1E,	%o5
	edge8	%g6,	%g3,	%i4
	movrgez	%o2,	0x199,	%g5
	movrgz	%l3,	0x2EA,	%i0
	fnors	%f25,	%f9,	%f1
	lduw	[%l7 + 0x3C],	%o1
	save %l1, %o3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i6,	%o7,	%g1
	mova	%icc,	%l2,	%l0
	fmovrse	%g2,	%f17,	%f1
	fmovdneg	%xcc,	%f0,	%f22
	fcmpgt16	%f8,	%f2,	%o6
	fmovsn	%icc,	%f20,	%f10
	fpsub32s	%f28,	%f1,	%f19
	array16	%o0,	%g7,	%o4
	smul	%i5,	0x0384,	%g4
	ldsh	[%l7 + 0x18],	%i1
	movgu	%icc,	%l6,	%l5
	fornot2s	%f11,	%f18,	%f23
	fcmpes	%fcc3,	%f20,	%f11
	edge16n	%i7,	%i3,	%o5
	move	%xcc,	%g6,	%i2
	edge16n	%g3,	%i4,	%g5
	fmovdvc	%xcc,	%f22,	%f0
	movrlez	%l3,	0x271,	%i0
	fxor	%f20,	%f14,	%f24
	udivx	%o2,	0x0ED4,	%l1
	fpadd16	%f10,	%f12,	%f8
	ldd	[%l7 + 0x58],	%f8
	xorcc	%o3,	0x0A3A,	%l4
	srlx	%o1,	0x1A,	%i6
	edge32n	%g1,	%l2,	%o7
	udivcc	%g2,	0x1B83,	%l0
	movge	%icc,	%o6,	%o0
	edge16	%g7,	%i5,	%g4
	movvc	%xcc,	%i1,	%o4
	fnands	%f27,	%f0,	%f8
	edge16n	%l5,	%l6,	%i3
	fpadd16	%f14,	%f12,	%f18
	lduh	[%l7 + 0x10],	%i7
	ld	[%l7 + 0x0C],	%f21
	sdivx	%o5,	0x043A,	%g6
	sth	%g3,	[%l7 + 0x10]
	mulx	%i2,	0x049C,	%g5
	mulx	%l3,	%i0,	%o2
	umulcc	%i4,	%o3,	%l1
	std	%f12,	[%l7 + 0x50]
	movpos	%icc,	%o1,	%i6
	smulcc	%g1,	0x140D,	%l4
	fcmpeq16	%f8,	%f8,	%l2
	popc	0x0D6E,	%o7
	sdivcc	%g2,	0x09A8,	%o6
	udivcc	%o0,	0x170E,	%l0
	fnegd	%f28,	%f26
	move	%icc,	%g7,	%g4
	edge32ln	%i1,	%o4,	%l5
	stx	%l6,	[%l7 + 0x58]
	edge32l	%i3,	%i5,	%o5
	nop
	set	0x48, %l1
	lduw	[%l7 + %l1],	%g6
	fmovde	%icc,	%f28,	%f25
	alignaddrl	%g3,	%i2,	%i7
	stw	%g5,	[%l7 + 0x40]
	add	%l3,	0x0381,	%i0
	movcs	%icc,	%o2,	%i4
	ldsh	[%l7 + 0x76],	%o3
	movcc	%xcc,	%o1,	%l1
	edge32l	%g1,	%i6,	%l4
	sdivcc	%l2,	0x1AA1,	%o7
	fmovsg	%icc,	%f7,	%f15
	and	%g2,	0x0BD2,	%o0
	popc	%o6,	%g7
	mulscc	%l0,	%g4,	%o4
	alignaddr	%l5,	%i1,	%i3
	xorcc	%l6,	0x1740,	%i5
	mulscc	%o5,	%g3,	%i2
	fornot1	%f6,	%f16,	%f12
	fpadd32s	%f19,	%f14,	%f16
	umul	%g6,	%g5,	%l3
	sir	0x09FA
	movvc	%xcc,	%i0,	%o2
	fandnot1	%f10,	%f0,	%f2
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%i6
	ldsw	[%l7 + 0x6C],	%o3
	srlx	%o1,	%i4,	%g1
	xor	%i6,	%l1,	%l4
	edge32n	%o7,	%l2,	%o0
	orn	%o6,	0x1E90,	%g2
	xnor	%g7,	%l0,	%o4
	siam	0x1
	xorcc	%l5,	0x0DAE,	%g4
	movg	%xcc,	%i3,	%l6
	ldd	[%l7 + 0x10],	%i0
	edge8	%o5,	%i5,	%i2
	edge32l	%g6,	%g5,	%l3
	fsrc1	%f10,	%f30
	movl	%icc,	%g3,	%i0
	or	%o2,	%o3,	%i7
	umul	%i4,	0x0086,	%o1
	movvs	%icc,	%i6,	%g1
	edge8n	%l1,	%o7,	%l2
	sth	%o0,	[%l7 + 0x1A]
	edge32n	%o6,	%l4,	%g2
	movrgz	%g7,	%l0,	%o4
	std	%f10,	[%l7 + 0x30]
	movgu	%icc,	%l5,	%i3
	array32	%l6,	%i1,	%o5
	movrlez	%i5,	0x08C,	%g4
	movne	%xcc,	%g6,	%g5
	stw	%i2,	[%l7 + 0x44]
	lduh	[%l7 + 0x7E],	%g3
	sub	%l3,	0x1087,	%i0
	subccc	%o2,	%o3,	%i4
	siam	0x3
	subc	%i7,	%i6,	%g1
	movne	%xcc,	%o1,	%l1
	sdiv	%o7,	0x048B,	%l2
	array16	%o0,	%o6,	%l4
	fxor	%f4,	%f8,	%f22
	edge16n	%g7,	%g2,	%o4
	subc	%l5,	%l0,	%i3
	addc	%i1,	0x123E,	%l6
	restore %i5, %o5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g5,	%i2,	%g3
	movle	%icc,	%l3,	%g6
	stx	%o2,	[%l7 + 0x40]
	fsrc1	%f10,	%f30
	fabss	%f17,	%f6
	add	%i0,	%i4,	%i7
	save %o3, 0x18A8, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o1,	%i6
	ldsh	[%l7 + 0x5A],	%l1
	sub	%l2,	%o7,	%o0
	fmovdle	%icc,	%f2,	%f20
	fmovscc	%icc,	%f18,	%f5
	fpadd32	%f8,	%f16,	%f20
	fmovrdlez	%l4,	%f8,	%f20
	mova	%xcc,	%g7,	%o6
	sdivx	%o4,	0x13D5,	%g2
	sra	%l0,	0x08,	%l5
	movle	%icc,	%i1,	%i3
	movvc	%icc,	%i5,	%o5
	siam	0x2
	movvc	%icc,	%l6,	%g5
	movrlz	%i2,	0x306,	%g3
	sethi	0x1A67,	%g4
	stb	%l3,	[%l7 + 0x09]
	movl	%xcc,	%g6,	%o2
	movre	%i4,	%i0,	%i7
	xor	%g1,	%o3,	%i6
	fcmpgt16	%f26,	%f30,	%l1
	st	%f11,	[%l7 + 0x5C]
	srax	%o1,	0x19,	%o7
	edge32l	%l2,	%l4,	%g7
	movge	%icc,	%o0,	%o4
	fmovsneg	%icc,	%f9,	%f30
	andn	%g2,	0x0D98,	%o6
	srl	%l5,	0x02,	%i1
	sllx	%l0,	%i3,	%i5
	fmovsa	%icc,	%f15,	%f7
	fnot1	%f2,	%f20
	sethi	0x19A8,	%o5
	fmovsn	%icc,	%f22,	%f8
	orncc	%l6,	0x0E2E,	%g5
	addccc	%i2,	%g4,	%l3
	movrgez	%g6,	0x2FE,	%g3
	movgu	%xcc,	%o2,	%i0
	st	%f13,	[%l7 + 0x74]
	edge32	%i4,	%i7,	%g1
	fmovdge	%icc,	%f4,	%f22
	alignaddr	%o3,	%i6,	%l1
	ldd	[%l7 + 0x20],	%f28
	fandnot2	%f18,	%f14,	%f24
	sir	0x122B
	sethi	0x1EB3,	%o7
	fcmpne32	%f6,	%f0,	%o1
	fmovsvc	%icc,	%f19,	%f1
	sdivcc	%l2,	0x1CCB,	%g7
	xnorcc	%l4,	%o0,	%o4
	fandnot2	%f20,	%f12,	%f10
	fzeros	%f21
	movleu	%xcc,	%o6,	%g2
	array32	%l5,	%l0,	%i3
	std	%f20,	[%l7 + 0x40]
	pdist	%f28,	%f20,	%f4
	edge8ln	%i5,	%o5,	%i1
	fnot2	%f2,	%f24
	fnot2s	%f20,	%f20
	movle	%icc,	%l6,	%i2
	fmul8x16au	%f1,	%f6,	%f20
	fmovsle	%icc,	%f3,	%f23
	sth	%g4,	[%l7 + 0x20]
	nop
	set	0x50, %o0
	std	%f14,	[%l7 + %o0]
	ld	[%l7 + 0x3C],	%f17
	ldd	[%l7 + 0x58],	%l2
	and	%g6,	0x1FE5,	%g3
	movre	%g5,	%o2,	%i4
	andncc	%i0,	%i7,	%g1
	mulx	%o3,	%i6,	%o7
	ldsw	[%l7 + 0x70],	%l1
	fcmpes	%fcc0,	%f28,	%f7
	fandnot1	%f16,	%f0,	%f24
	edge16n	%o1,	%g7,	%l4
	addc	%l2,	0x164D,	%o0
	edge8ln	%o6,	%g2,	%l5
	smul	%l0,	%o4,	%i3
	subcc	%i5,	0x1FE5,	%i1
	ldsw	[%l7 + 0x38],	%l6
	nop
	set	0x18, %o4
	stw	%o5,	[%l7 + %o4]
	faligndata	%f16,	%f24,	%f0
	movrne	%i2,	%l3,	%g4
	fmovsn	%xcc,	%f17,	%f11
	ld	[%l7 + 0x14],	%f3
	lduh	[%l7 + 0x7A],	%g6
	xor	%g3,	0x0D1B,	%g5
	srlx	%i4,	%i0,	%o2
	subcc	%i7,	0x0F3C,	%o3
	sdivx	%g1,	0x15FC,	%i6
	edge32l	%l1,	%o1,	%g7
	stx	%l4,	[%l7 + 0x68]
	srl	%l2,	0x0D,	%o0
	sllx	%o6,	0x17,	%o7
	edge16ln	%g2,	%l0,	%l5
	sdiv	%i3,	0x16A2,	%i5
	movle	%xcc,	%i1,	%o4
	fmovrdlez	%l6,	%f0,	%f20
	fnands	%f11,	%f28,	%f2
	movneg	%xcc,	%i2,	%l3
	subcc	%g4,	0x0047,	%o5
	fabsd	%f30,	%f26
	fmovrdlez	%g6,	%f16,	%f26
	edge16n	%g5,	%i4,	%g3
	ldx	[%l7 + 0x48],	%i0
	movcc	%icc,	%o2,	%i7
	std	%f12,	[%l7 + 0x28]
	movle	%icc,	%g1,	%i6
	popc	%o3,	%o1
	movcc	%icc,	%l1,	%g7
	ldsw	[%l7 + 0x54],	%l2
	movleu	%icc,	%o0,	%o6
	move	%icc,	%l4,	%o7
	movcc	%icc,	%g2,	%l0
	ldsw	[%l7 + 0x1C],	%l5
	movneg	%icc,	%i3,	%i5
	fpsub32	%f6,	%f6,	%f10
	mulscc	%o4,	0x1169,	%i1
	fmovrse	%i2,	%f12,	%f1
	fmovspos	%xcc,	%f24,	%f5
	movvc	%xcc,	%l3,	%l6
	umulcc	%g4,	%g6,	%g5
	edge16l	%i4,	%g3,	%i0
	ldsh	[%l7 + 0x16],	%o2
	fmovsne	%icc,	%f19,	%f17
	array8	%i7,	%o5,	%g1
	fornot1s	%f1,	%f11,	%f21
	array32	%o3,	%i6,	%o1
	nop
	set	0x10, %l0
	ldx	[%l7 + %l0],	%g7
	stx	%l1,	[%l7 + 0x58]
	siam	0x7
	fmovsa	%xcc,	%f5,	%f6
	fmovrsgz	%l2,	%f14,	%f5
	edge8l	%o0,	%l4,	%o6
	st	%f14,	[%l7 + 0x74]
	fzero	%f0
	edge8ln	%o7,	%l0,	%g2
	fornot2s	%f16,	%f9,	%f30
	stx	%i3,	[%l7 + 0x50]
	sth	%l5,	[%l7 + 0x2E]
	fpadd32s	%f3,	%f12,	%f29
	movge	%xcc,	%o4,	%i5
	ldd	[%l7 + 0x70],	%f18
	fmovsl	%xcc,	%f13,	%f6
	fmul8ulx16	%f8,	%f20,	%f10
	edge8	%i1,	%l3,	%i2
	fpackfix	%f28,	%f22
	edge32l	%l6,	%g4,	%g5
	subccc	%i4,	%g6,	%i0
	srlx	%g3,	0x14,	%i7
	ldx	[%l7 + 0x18],	%o2
	fmuld8sux16	%f0,	%f1,	%f2
	edge16ln	%g1,	%o3,	%i6
	fmovrdlz	%o1,	%f30,	%f20
	move	%icc,	%o5,	%g7
	std	%f6,	[%l7 + 0x40]
	umulcc	%l2,	%l1,	%l4
	ldsh	[%l7 + 0x10],	%o6
	movrgz	%o0,	0x210,	%o7
	fmuld8ulx16	%f15,	%f18,	%f10
	popc	%l0,	%g2
	fmovs	%f13,	%f6
	movcc	%icc,	%l5,	%o4
	bshuffle	%f10,	%f30,	%f14
	edge32ln	%i5,	%i3,	%l3
	movvs	%xcc,	%i2,	%l6
	sra	%g4,	0x0C,	%i1
	udivcc	%i4,	0x0058,	%g5
	movleu	%icc,	%i0,	%g6
	fandnot2	%f20,	%f2,	%f12
	ldsw	[%l7 + 0x18],	%g3
	srlx	%o2,	%i7,	%g1
	movcs	%icc,	%o3,	%o1
	sethi	0x1A1A,	%o5
	movvc	%xcc,	%i6,	%l2
	fsrc2s	%f24,	%f7
	edge32l	%l1,	%l4,	%g7
	xor	%o0,	0x1DC5,	%o6
	umul	%o7,	%l0,	%l5
	fcmpgt32	%f0,	%f22,	%g2
	subc	%o4,	0x0A63,	%i5
	movrlz	%l3,	%i2,	%l6
	xorcc	%g4,	%i1,	%i4
	fmovsgu	%xcc,	%f24,	%f18
	udiv	%i3,	0x0646,	%i0
	sdiv	%g6,	0x032A,	%g5
	movge	%xcc,	%o2,	%i7
	move	%xcc,	%g3,	%o3
	sth	%o1,	[%l7 + 0x32]
	movvc	%icc,	%o5,	%g1
	fmovsgu	%icc,	%f8,	%f15
	movrgez	%l2,	%l1,	%l4
	orcc	%i6,	%g7,	%o0
	fsrc2	%f30,	%f6
	movrlz	%o7,	0x085,	%o6
	ldx	[%l7 + 0x58],	%l5
	alignaddr	%l0,	%o4,	%g2
	fmovdvc	%icc,	%f23,	%f2
	sub	%i5,	%i2,	%l3
	array8	%g4,	%l6,	%i1
	fmovdge	%xcc,	%f28,	%f14
	orcc	%i3,	0x02AF,	%i0
	edge16l	%g6,	%g5,	%i4
	stx	%i7,	[%l7 + 0x08]
	fands	%f14,	%f6,	%f9
	edge16l	%g3,	%o2,	%o1
	movvs	%icc,	%o5,	%g1
	movrgez	%o3,	0x07C,	%l1
	fmovrslz	%l2,	%f15,	%f23
	movrgz	%l4,	%i6,	%o0
	movrlz	%g7,	%o7,	%o6
	orncc	%l0,	%o4,	%l5
	subccc	%g2,	%i5,	%l3
	sethi	0x16A8,	%i2
	sethi	0x0076,	%l6
	ldsw	[%l7 + 0x10],	%g4
	fcmple32	%f16,	%f4,	%i1
	fmovrslz	%i3,	%f16,	%f17
	smulcc	%g6,	0x0007,	%g5
	fpadd32	%f12,	%f30,	%f2
	stw	%i0,	[%l7 + 0x4C]
	ldsb	[%l7 + 0x40],	%i7
	udivx	%g3,	0x0F5B,	%i4
	movg	%xcc,	%o1,	%o5
	edge32ln	%g1,	%o2,	%o3
	sdivcc	%l2,	0x0BB8,	%l1
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	fcmpeq32	%f18,	%f18,	%g7
	movre	%o0,	0x242,	%o7
	movge	%xcc,	%o6,	%o4
	fnot1	%f26,	%f30
	alignaddrl	%l0,	%g2,	%i5
	move	%icc,	%l5,	%l3
	fmovdl	%icc,	%f25,	%f12
	srlx	%i2,	%l6,	%i1
	orcc	%i3,	0x0329,	%g6
	andcc	%g4,	%g5,	%i0
	movrne	%i7,	0x08C,	%g3
	movrlez	%o1,	0x020,	%i4
	fandnot1	%f26,	%f20,	%f0
	fmul8x16	%f6,	%f18,	%f28
	lduw	[%l7 + 0x4C],	%g1
	subcc	%o2,	%o5,	%l2
	sdiv	%l1,	0x1B1F,	%i6
	ldd	[%l7 + 0x40],	%f30
	sdivx	%l4,	0x1AA4,	%o3
	sth	%o0,	[%l7 + 0x5A]
	sth	%g7,	[%l7 + 0x2A]
	movle	%icc,	%o6,	%o7
	andncc	%o4,	%g2,	%l0
	sdiv	%i5,	0x1CFF,	%l3
	fpack32	%f20,	%f30,	%f8
	ld	[%l7 + 0x58],	%f12
	fandnot1s	%f16,	%f17,	%f24
	edge16ln	%l5,	%l6,	%i1
	fandnot1	%f2,	%f28,	%f10
	save %i2, %i3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f14,	[%l7 + 0x70]
	movrgez	%g4,	0x196,	%i0
	movrne	%g5,	%g3,	%o1
	movrgez	%i7,	%i4,	%o2
	movrlz	%o5,	0x35F,	%g1
	array16	%l1,	%i6,	%l2
	movcs	%xcc,	%l4,	%o0
	fcmps	%fcc3,	%f26,	%f2
	movvc	%xcc,	%o3,	%o6
	ldsw	[%l7 + 0x30],	%o7
	fmovrsgez	%o4,	%f27,	%f26
	fmovspos	%xcc,	%f5,	%f15
	edge16l	%g2,	%g7,	%i5
	fcmpeq16	%f22,	%f26,	%l3
	lduh	[%l7 + 0x4E],	%l5
	xnorcc	%l6,	0x0FF5,	%i1
	movgu	%icc,	%l0,	%i3
	sdivcc	%i2,	0x150A,	%g6
	xnor	%g4,	0x1CDE,	%i0
	movne	%xcc,	%g5,	%g3
	array8	%i7,	%i4,	%o2
	umul	%o1,	0x0EDC,	%g1
	movpos	%icc,	%o5,	%i6
	srl	%l1,	0x09,	%l4
	ldsw	[%l7 + 0x30],	%o0
	lduw	[%l7 + 0x28],	%o3
	movcs	%icc,	%o6,	%o7
	edge8	%o4,	%l2,	%g2
	edge32ln	%i5,	%g7,	%l5
	movrgz	%l6,	0x196,	%l3
	fmovsl	%icc,	%f27,	%f7
	and	%i1,	%i3,	%l0
	edge32ln	%i2,	%g4,	%g6
	fmovrsgez	%g5,	%f4,	%f26
	mova	%icc,	%g3,	%i0
	orncc	%i7,	%o2,	%i4
	ldd	[%l7 + 0x60],	%f14
	movl	%xcc,	%g1,	%o1
	fcmpne16	%f16,	%f8,	%i6
	array16	%l1,	%l4,	%o0
	fpadd32s	%f9,	%f18,	%f26
	sdivcc	%o5,	0x1B52,	%o6
	ldsb	[%l7 + 0x51],	%o3
	sdiv	%o4,	0x15AA,	%o7
	alignaddr	%l2,	%g2,	%i5
	subc	%l5,	%l6,	%l3
	sdivx	%i1,	0x1EB3,	%g7
	smul	%l0,	%i2,	%g4
	andcc	%i3,	0x135D,	%g5
	movgu	%xcc,	%g6,	%g3
	edge16l	%i0,	%i7,	%i4
	fpsub16	%f0,	%f26,	%f22
	mulscc	%g1,	%o2,	%o1
	movl	%xcc,	%l1,	%i6
	ldsw	[%l7 + 0x1C],	%l4
	sllx	%o5,	%o6,	%o0
	edge16	%o3,	%o7,	%l2
	edge32l	%g2,	%o4,	%l5
	fsrc1s	%f9,	%f30
	ldd	[%l7 + 0x60],	%i4
	edge16n	%l3,	%i1,	%g7
	lduh	[%l7 + 0x52],	%l6
	restore %l0, %i2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1F15
	fxnor	%f4,	%f24,	%f12
	movleu	%icc,	%g5,	%g4
	sll	%g6,	0x08,	%g3
	fcmpne32	%f8,	%f30,	%i7
	movgu	%icc,	%i4,	%i0
	ldd	[%l7 + 0x78],	%o2
	fmuld8ulx16	%f14,	%f21,	%f24
	mulx	%g1,	0x0C1B,	%o1
	fornot2	%f20,	%f12,	%f26
	fmovd	%f8,	%f22
	sll	%i6,	0x03,	%l4
	mulscc	%o5,	0x091F,	%l1
	fpsub16	%f12,	%f2,	%f16
	addc	%o6,	%o3,	%o7
	movvs	%icc,	%l2,	%g2
	movvs	%icc,	%o0,	%l5
	mulx	%o4,	0x1ADF,	%i5
	addc	%i1,	%g7,	%l3
	addc	%l0,	0x1D1E,	%l6
	movleu	%icc,	%i3,	%i2
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%f10
	edge8l	%g4,	%g5,	%g3
	ldsw	[%l7 + 0x2C],	%i7
	orncc	%g6,	%i0,	%o2
	sub	%i4,	0x06EC,	%o1
	movl	%xcc,	%g1,	%l4
	move	%icc,	%o5,	%l1
	xnorcc	%i6,	0x038F,	%o3
	alignaddr	%o7,	%o6,	%l2
	udivx	%g2,	0x1F13,	%o0
	srlx	%o4,	0x06,	%l5
	edge16ln	%i1,	%g7,	%l3
	fmovrdlez	%i5,	%f22,	%f24
	std	%f28,	[%l7 + 0x30]
	srax	%l0,	%i3,	%i2
	st	%f29,	[%l7 + 0x4C]
	ld	[%l7 + 0x60],	%f29
	movn	%icc,	%g4,	%l6
	udiv	%g3,	0x1D08,	%i7
	edge8l	%g6,	%g5,	%o2
	srlx	%i0,	0x10,	%o1
	alignaddr	%i4,	%g1,	%l4
	subc	%o5,	0x0D0B,	%i6
	orcc	%l1,	%o3,	%o6
	alignaddrl	%l2,	%g2,	%o0
	srlx	%o4,	0x1C,	%o7
	fmovdne	%xcc,	%f18,	%f18
	ld	[%l7 + 0x60],	%f30
	mova	%xcc,	%i1,	%g7
	movcc	%xcc,	%l3,	%i5
	sdivx	%l5,	0x0E3C,	%l0
	srl	%i2,	%g4,	%l6
	fmovsneg	%icc,	%f0,	%f27
	mulx	%i3,	%g3,	%g6
	nop
	set	0x68, %i4
	ldx	[%l7 + %i4],	%i7
	fandnot1	%f16,	%f22,	%f0
	udivcc	%o2,	0x1BD1,	%g5
	popc	%i0,	%i4
	lduh	[%l7 + 0x24],	%g1
	andcc	%l4,	0x0C0E,	%o5
	movgu	%xcc,	%o1,	%i6
	stw	%o3,	[%l7 + 0x78]
	pdist	%f4,	%f12,	%f20
	ldx	[%l7 + 0x18],	%o6
	fandnot1	%f26,	%f24,	%f20
	edge8n	%l2,	%g2,	%o0
	movvs	%icc,	%o4,	%o7
	lduw	[%l7 + 0x18],	%i1
	sth	%g7,	[%l7 + 0x70]
	addc	%l3,	%i5,	%l1
	orn	%l5,	0x09AD,	%i2
	movrgez	%l0,	0x146,	%l6
	movrgez	%g4,	%g3,	%g6
	srl	%i7,	0x18,	%o2
	or	%g5,	0x074C,	%i0
	umul	%i4,	0x01B6,	%i3
	movgu	%icc,	%g1,	%l4
	movre	%o1,	%o5,	%i6
	xnorcc	%o6,	%l2,	%o3
	sdiv	%g2,	0x03FC,	%o0
	udiv	%o7,	0x0EC8,	%o4
	array8	%i1,	%l3,	%i5
	sdivx	%l1,	0x0712,	%l5
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%g7
	fpackfix	%f28,	%f20
	alignaddr	%l0,	%i2,	%g4
	orn	%l6,	%g6,	%g3
	fmovs	%f22,	%f2
	ldd	[%l7 + 0x58],	%f10
	fmovs	%f31,	%f6
	and	%i7,	%g5,	%o2
	sll	%i0,	%i4,	%g1
	fmovsa	%xcc,	%f26,	%f14
	addcc	%i3,	0x069D,	%o1
	st	%f0,	[%l7 + 0x64]
	xor	%l4,	%i6,	%o5
	fmovdgu	%icc,	%f17,	%f18
	fmovdneg	%xcc,	%f31,	%f19
	fmovdn	%icc,	%f31,	%f7
	edge8n	%l2,	%o6,	%o3
	edge16ln	%o0,	%g2,	%o4
	fmovrsgz	%o7,	%f20,	%f8
	fcmpne32	%f24,	%f26,	%i1
	sethi	0x14A9,	%i5
	edge16l	%l1,	%l5,	%g7
	subcc	%l0,	0x1265,	%l3
	movl	%xcc,	%g4,	%l6
	fcmpeq16	%f6,	%f18,	%g6
	save %g3, %i7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f20,	%f24,	%f24
	edge16l	%g5,	%i0,	%i4
	ldsb	[%l7 + 0x56],	%g1
	fmuld8sux16	%f22,	%f19,	%f12
	sub	%o2,	0x1FE8,	%o1
	movrlz	%l4,	0x0C8,	%i6
	fmul8sux16	%f24,	%f18,	%f12
	fnors	%f2,	%f8,	%f15
	fmul8x16au	%f18,	%f4,	%f2
	movg	%icc,	%i3,	%o5
	movrgez	%o6,	0x042,	%o3
	subccc	%o0,	%l2,	%g2
	andcc	%o4,	%i1,	%i5
	fmovsn	%icc,	%f11,	%f0
	movleu	%icc,	%o7,	%l5
	sra	%l1,	0x16,	%g7
	smul	%l3,	%l0,	%l6
	fpadd32	%f20,	%f28,	%f8
	edge16	%g6,	%g4,	%i7
	move	%xcc,	%i2,	%g3
	subccc	%i0,	0x0BC5,	%g5
	fmovrsne	%i4,	%f0,	%f7
	udivx	%g1,	0x0753,	%o1
	lduh	[%l7 + 0x6A],	%l4
	edge8l	%i6,	%o2,	%i3
	movvc	%xcc,	%o6,	%o3
	fmovsgu	%icc,	%f15,	%f27
	movl	%icc,	%o5,	%l2
	fornot2	%f18,	%f8,	%f20
	edge8ln	%g2,	%o4,	%i1
	andn	%o0,	0x1156,	%o7
	fabsd	%f2,	%f28
	xor	%l5,	%i5,	%l1
	movle	%xcc,	%l3,	%l0
	movcs	%icc,	%l6,	%g7
	smul	%g6,	%g4,	%i2
	fnegd	%f6,	%f4
	movrne	%i7,	0x21A,	%i0
	mulx	%g3,	0x1F24,	%i4
	fmovdleu	%xcc,	%f20,	%f6
	srlx	%g5,	0x0C,	%g1
	array16	%o1,	%l4,	%i6
	movrlz	%i3,	0x069,	%o6
	movvs	%icc,	%o3,	%o2
	orn	%o5,	%g2,	%l2
	subc	%o4,	%i1,	%o0
	udivcc	%l5,	0x03D7,	%i5
	sdivx	%o7,	0x0377,	%l3
	movre	%l1,	%l6,	%g7
	lduw	[%l7 + 0x34],	%l0
	ldsh	[%l7 + 0x3A],	%g4
	add	%i2,	%g6,	%i0
	movrne	%i7,	0x229,	%i4
	fnand	%f0,	%f28,	%f12
	ldsw	[%l7 + 0x60],	%g5
	subcc	%g3,	%g1,	%l4
	movge	%xcc,	%o1,	%i3
	andncc	%i6,	%o3,	%o2
	orn	%o6,	0x02D6,	%g2
	edge16l	%o5,	%o4,	%i1
	stx	%l2,	[%l7 + 0x60]
	edge8l	%o0,	%l5,	%i5
	stx	%l3,	[%l7 + 0x08]
	fmovrsgz	%l1,	%f7,	%f1
	sll	%l6,	%o7,	%l0
	subccc	%g7,	0x18AC,	%i2
	xor	%g6,	0x00FE,	%g4
	ld	[%l7 + 0x54],	%f0
	xor	%i0,	%i7,	%i4
	udivcc	%g3,	0x04A0,	%g5
	subccc	%g1,	0x0CA1,	%l4
	sth	%i3,	[%l7 + 0x32]
	edge16l	%o1,	%o3,	%o2
	ldd	[%l7 + 0x30],	%o6
	fmovrse	%i6,	%f17,	%f5
	fone	%f22
	movrgz	%o5,	0x3DA,	%o4
	subc	%g2,	%i1,	%l2
	lduh	[%l7 + 0x6A],	%l5
	fmovrdlz	%o0,	%f12,	%f18
	srlx	%l3,	%i5,	%l6
	fornot1	%f8,	%f14,	%f12
	fmul8x16	%f1,	%f24,	%f22
	st	%f22,	[%l7 + 0x50]
	sth	%o7,	[%l7 + 0x16]
	edge32l	%l0,	%l1,	%g7
	move	%xcc,	%g6,	%i2
	fxnor	%f14,	%f16,	%f10
	ldsb	[%l7 + 0x60],	%g4
	ldub	[%l7 + 0x26],	%i7
	fmovdl	%icc,	%f4,	%f18
	movrgez	%i4,	0x25C,	%i0
	fmovdle	%icc,	%f25,	%f8
	movle	%icc,	%g5,	%g1
	edge16	%g3,	%i3,	%o1
	smul	%l4,	%o2,	%o3
	ld	[%l7 + 0x44],	%f19
	array16	%o6,	%o5,	%o4
	stb	%i6,	[%l7 + 0x27]
	fandnot1	%f30,	%f16,	%f2
	edge32	%g2,	%i1,	%l2
	fcmple16	%f30,	%f10,	%o0
	movcc	%icc,	%l3,	%l5
	fnor	%f10,	%f26,	%f14
	alignaddrl	%i5,	%l6,	%o7
	add	%l1,	%l0,	%g6
	array16	%g7,	%g4,	%i7
	fxor	%f6,	%f20,	%f20
	sethi	0x18B9,	%i4
	fmul8x16au	%f14,	%f28,	%f24
	edge32	%i0,	%i2,	%g5
	fxnor	%f8,	%f2,	%f0
	movvs	%icc,	%g1,	%g3
	umul	%o1,	0x1874,	%i3
	fmovdleu	%xcc,	%f21,	%f18
	fmul8x16al	%f25,	%f18,	%f24
	xnor	%l4,	0x14D9,	%o3
	movg	%icc,	%o6,	%o5
	save %o2, %i6, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o4,	0x1B8E,	%i1
	sethi	0x040E,	%l2
	movvs	%xcc,	%o0,	%l3
	move	%xcc,	%l5,	%i5
	faligndata	%f8,	%f8,	%f12
	stb	%o7,	[%l7 + 0x30]
	nop
	set	0x10, %i7
	std	%f16,	[%l7 + %i7]
	array32	%l1,	%l0,	%l6
	edge32ln	%g7,	%g6,	%g4
	alignaddr	%i4,	%i7,	%i2
	movrgez	%g5,	0x2F0,	%g1
	movre	%g3,	%o1,	%i0
	pdist	%f2,	%f22,	%f10
	edge8ln	%i3,	%l4,	%o3
	movn	%xcc,	%o6,	%o2
	edge32n	%o5,	%i6,	%o4
	sethi	0x0FEC,	%i1
	popc	0x075A,	%l2
	edge32ln	%g2,	%o0,	%l5
	subccc	%l3,	0x13C2,	%i5
	movcs	%icc,	%l1,	%l0
	udiv	%o7,	0x0694,	%g7
	udivcc	%l6,	0x0BF0,	%g6
	fornot1s	%f15,	%f5,	%f23
	srlx	%i4,	%i7,	%g4
	movrne	%g5,	%g1,	%i2
	ldsb	[%l7 + 0x0C],	%g3
	udivx	%o1,	0x1064,	%i3
	xor	%i0,	%o3,	%l4
	sra	%o2,	%o6,	%o5
	sdivx	%o4,	0x1F44,	%i1
	fpadd32	%f22,	%f22,	%f28
	xorcc	%i6,	%g2,	%l2
	or	%l5,	0x159F,	%l3
	fmovdgu	%xcc,	%f23,	%f2
	orncc	%i5,	0x0470,	%o0
	fmovscc	%icc,	%f8,	%f17
	fmovdgu	%xcc,	%f10,	%f1
	ldsb	[%l7 + 0x50],	%l0
	movle	%xcc,	%l1,	%g7
	fpsub32	%f26,	%f12,	%f20
	edge8ln	%l6,	%o7,	%g6
	andn	%i4,	%i7,	%g5
	umul	%g1,	0x16E2,	%g4
	ldsw	[%l7 + 0x0C],	%i2
	array16	%g3,	%o1,	%i0
	fandnot2	%f8,	%f20,	%f2
	fmul8ulx16	%f30,	%f30,	%f0
	ldd	[%l7 + 0x08],	%o2
	movpos	%icc,	%i3,	%l4
	fsrc1s	%f21,	%f19
	edge16n	%o6,	%o5,	%o4
	nop
	set	0x73, %g2
	ldsb	[%l7 + %g2],	%i1
	sir	0x1FBF
	fpadd16	%f8,	%f8,	%f26
	array8	%i6,	%g2,	%l2
	smulcc	%o2,	%l3,	%i5
	edge32l	%o0,	%l0,	%l1
	movrlz	%l5,	%l6,	%o7
	movrlz	%g6,	%g7,	%i4
	std	%f0,	[%l7 + 0x10]
	stx	%i7,	[%l7 + 0x38]
	stw	%g1,	[%l7 + 0x08]
	add	%g4,	%i2,	%g5
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	lduw	[%l7 + 0x14],	%o3
	fandnot1s	%f21,	%f17,	%f22
	srax	%i3,	%l4,	%o6
	edge8n	%o5,	%o4,	%i0
	sethi	0x11F6,	%i1
	ldd	[%l7 + 0x58],	%g2
	ldsb	[%l7 + 0x60],	%i6
	smul	%o2,	%l3,	%i5
	xorcc	%o0,	0x11D3,	%l0
	ldsb	[%l7 + 0x0B],	%l1
	fmovsgu	%xcc,	%f3,	%f11
	edge16ln	%l2,	%l6,	%l5
	movrlz	%g6,	%g7,	%o7
	movrgez	%i7,	0x17D,	%i4
	edge8ln	%g4,	%i2,	%g1
	array8	%o1,	%g3,	%o3
	faligndata	%f8,	%f8,	%f18
	fcmps	%fcc1,	%f30,	%f10
	movgu	%icc,	%i3,	%l4
	orcc	%g5,	0x0580,	%o6
	movcs	%xcc,	%o5,	%i0
	movneg	%icc,	%i1,	%g2
	smulcc	%i6,	%o2,	%l3
	popc	0x1297,	%o4
	movrlz	%o0,	%i5,	%l0
	array32	%l2,	%l6,	%l5
	sllx	%g6,	%l1,	%g7
	movcc	%xcc,	%i7,	%o7
	nop
	set	0x79, %l3
	ldsb	[%l7 + %l3],	%g4
	movvs	%xcc,	%i2,	%i4
	addcc	%g1,	0x0437,	%o1
	xnorcc	%g3,	%i3,	%o3
	udiv	%l4,	0x1BCB,	%g5
	fmovrdgez	%o5,	%f28,	%f16
	edge8ln	%i0,	%i1,	%o6
	fmovsvs	%icc,	%f8,	%f3
	popc	0x1F4A,	%i6
	fmovdn	%icc,	%f14,	%f29
	sllx	%o2,	%g2,	%l3
	faligndata	%f20,	%f8,	%f30
	fmovdcs	%xcc,	%f5,	%f10
	mova	%xcc,	%o4,	%i5
	smulcc	%o0,	%l0,	%l6
	fone	%f6
	fpsub16s	%f10,	%f26,	%f9
	fmovdvs	%xcc,	%f19,	%f16
	orn	%l2,	0x1EC5,	%l5
	stb	%g6,	[%l7 + 0x4B]
	movvs	%xcc,	%l1,	%i7
	lduh	[%l7 + 0x7E],	%g7
	move	%icc,	%o7,	%g4
	fmuld8sux16	%f23,	%f13,	%f16
	edge32	%i4,	%g1,	%i2
	array32	%o1,	%g3,	%o3
	fmovse	%icc,	%f13,	%f14
	movrne	%i3,	0x35D,	%l4
	fmovrde	%o5,	%f20,	%f20
	restore %g5, %i0, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i1,	0x15FC,	%o2
	alignaddrl	%g2,	%i6,	%l3
	fabsd	%f18,	%f14
	fone	%f16
	edge16ln	%i5,	%o4,	%l0
	sdivcc	%l6,	0x0BD8,	%o0
	movgu	%icc,	%l2,	%l5
	sethi	0x010D,	%l1
	movvc	%icc,	%i7,	%g7
	sdivcc	%g6,	0x1BAA,	%g4
	umul	%o7,	0x1DDE,	%g1
	sdivcc	%i4,	0x1D82,	%o1
	fsrc2	%f12,	%f0
	sdivx	%i2,	0x1029,	%o3
	xor	%g3,	0x0199,	%i3
	movleu	%xcc,	%o5,	%l4
	subccc	%i0,	%g5,	%o6
	edge16l	%o2,	%i1,	%i6
	stx	%g2,	[%l7 + 0x10]
	sethi	0x0843,	%l3
	fxnor	%f14,	%f24,	%f26
	lduh	[%l7 + 0x14],	%i5
	movn	%xcc,	%l0,	%l6
	save %o0, 0x14AE, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l5,	%l1,	%i7
	fexpand	%f25,	%f10
	sllx	%o4,	%g7,	%g4
	udivx	%o7,	0x1435,	%g6
	ldd	[%l7 + 0x40],	%f14
	subcc	%g1,	0x0A39,	%o1
	lduw	[%l7 + 0x6C],	%i4
	fmovsge	%icc,	%f2,	%f3
	fmovscs	%icc,	%f16,	%f8
	movg	%icc,	%i2,	%g3
	fzeros	%f21
	fmovrslz	%i3,	%f10,	%f5
	movl	%icc,	%o5,	%o3
	ldsb	[%l7 + 0x5F],	%i0
	movne	%xcc,	%l4,	%g5
	srax	%o2,	%o6,	%i6
	or	%i1,	%l3,	%g2
	movne	%icc,	%i5,	%l6
	array32	%o0,	%l2,	%l5
	addccc	%l1,	%l0,	%i7
	ldsb	[%l7 + 0x4E],	%o4
	array16	%g4,	%g7,	%o7
	udivcc	%g6,	0x0A3B,	%g1
	edge8n	%i4,	%i2,	%o1
	ld	[%l7 + 0x10],	%f26
	movge	%icc,	%g3,	%i3
	orn	%o3,	%o5,	%l4
	fcmped	%fcc1,	%f20,	%f12
	movrgz	%g5,	0x0DD,	%o2
	ldd	[%l7 + 0x70],	%i0
	fmovdn	%icc,	%f5,	%f27
	std	%f18,	[%l7 + 0x10]
	movrlez	%o6,	0x365,	%i1
	smul	%l3,	0x175C,	%i6
	movvc	%icc,	%g2,	%i5
	fmovdcs	%icc,	%f14,	%f1
	fornot1	%f0,	%f30,	%f20
	alignaddrl	%o0,	%l2,	%l6
	fmovsgu	%xcc,	%f9,	%f20
	nop
	set	0x3C, %g6
	lduw	[%l7 + %g6],	%l5
	ldsb	[%l7 + 0x3F],	%l0
	mova	%icc,	%l1,	%o4
	array16	%i7,	%g4,	%g7
	ldsh	[%l7 + 0x7C],	%g6
	xorcc	%g1,	%i4,	%i2
	smulcc	%o1,	0x15CD,	%o7
	srax	%i3,	0x10,	%g3
	movn	%xcc,	%o5,	%o3
	subccc	%l4,	0x15F6,	%o2
	movrgez	%g5,	%o6,	%i1
	and	%i0,	0x1275,	%l3
	fmovsge	%icc,	%f23,	%f24
	movl	%icc,	%i6,	%g2
	addcc	%o0,	0x00B0,	%l2
	mulx	%l6,	0x1308,	%l5
	srax	%l0,	0x1A,	%i5
	sth	%l1,	[%l7 + 0x7C]
	sir	0x0971
	fcmpes	%fcc0,	%f4,	%f3
	edge32	%i7,	%o4,	%g4
	orncc	%g6,	0x194F,	%g1
	fone	%f30
	lduw	[%l7 + 0x78],	%g7
	andncc	%i2,	%o1,	%i4
	movleu	%icc,	%o7,	%i3
	xor	%g3,	%o3,	%o5
	array16	%l4,	%o2,	%g5
	subc	%i1,	0x06FB,	%i0
	movpos	%icc,	%o6,	%l3
	alignaddr	%g2,	%i6,	%l2
	movrlz	%l6,	0x31D,	%o0
	alignaddr	%l0,	%i5,	%l1
	movcs	%xcc,	%l5,	%o4
	array16	%i7,	%g6,	%g1
	addccc	%g4,	%i2,	%g7
	ldd	[%l7 + 0x20],	%f6
	movleu	%xcc,	%i4,	%o1
	smulcc	%i3,	%o7,	%g3
	sub	%o3,	%l4,	%o5
	mulx	%o2,	%i1,	%g5
	edge8ln	%i0,	%o6,	%l3
	array8	%g2,	%l2,	%i6
	orncc	%l6,	%o0,	%i5
	fmovrse	%l0,	%f16,	%f13
	movcs	%xcc,	%l5,	%o4
	array8	%l1,	%g6,	%i7
	movle	%icc,	%g4,	%i2
	fmovrdne	%g1,	%f14,	%f6
	smul	%i4,	%o1,	%i3
	add	%g7,	%o7,	%g3
	xnor	%l4,	0x1CB6,	%o3
	fzero	%f18
	ldub	[%l7 + 0x61],	%o2
	array32	%o5,	%g5,	%i1
	movcs	%icc,	%i0,	%o6
	edge8n	%g2,	%l2,	%i6
	subc	%l3,	%l6,	%i5
	fmovrse	%l0,	%f9,	%f9
	fmovdg	%xcc,	%f19,	%f10
	edge8l	%o0,	%l5,	%l1
	orncc	%o4,	0x0C92,	%g6
	smul	%i7,	0x1684,	%g4
	mova	%icc,	%g1,	%i2
	orn	%i4,	%i3,	%g7
	edge8l	%o7,	%g3,	%o1
	fcmps	%fcc1,	%f28,	%f10
	orcc	%l4,	0x1663,	%o3
	fmul8sux16	%f20,	%f26,	%f18
	movvs	%xcc,	%o5,	%g5
	movcc	%icc,	%o2,	%i0
	movn	%xcc,	%o6,	%i1
	edge16n	%l2,	%i6,	%g2
	orn	%l3,	%l6,	%l0
	fmovdvs	%icc,	%f14,	%f30
	movcc	%icc,	%o0,	%i5
	std	%f24,	[%l7 + 0x58]
	udivcc	%l1,	0x0C1E,	%l5
	setx loop_94, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_94: 	movleu	%xcc,	%g4,	%g1
	movg	%xcc,	%g6,	%i4
	edge16ln	%i3,	%g7,	%i2
	movrne	%g3,	%o1,	%o7
	movrgez	%o3,	%o5,	%g5
	smulcc	%l4,	%o2,	%o6
	sir	0x1650
	std	%f22,	[%l7 + 0x48]
	udivx	%i1,	0x09EE,	%i0
	movrlz	%l2,	%i6,	%g2
	array8	%l6,	%l0,	%o0
	orn	%i5,	0x11AF,	%l1
	or	%l3,	%l5,	%i7
	umul	%o4,	0x04AE,	%g4
	udiv	%g6,	0x1940,	%g1
	movvs	%icc,	%i4,	%i3
	fmovdne	%xcc,	%f10,	%f2
	movneg	%xcc,	%g7,	%g3
	smul	%o1,	0x1C28,	%o7
	movneg	%xcc,	%o3,	%i2
	lduw	[%l7 + 0x44],	%g5
	edge16l	%l4,	%o5,	%o6
	lduh	[%l7 + 0x44],	%i1
	alignaddr	%o2,	%i0,	%l2
	st	%f3,	[%l7 + 0x5C]
	sll	%i6,	0x0F,	%l6
	orncc	%l0,	0x1F80,	%g2
	edge32l	%o0,	%i5,	%l3
	udiv	%l5,	0x1CD2,	%l1
	srax	%o4,	0x01,	%i7
	edge16	%g6,	%g1,	%g4
	fmovda	%icc,	%f7,	%f17
	fsrc2	%f2,	%f2
	ldsb	[%l7 + 0x3D],	%i4
	mova	%icc,	%i3,	%g7
	srlx	%o1,	%g3,	%o3
	ldsw	[%l7 + 0x74],	%o7
	alignaddr	%i2,	%l4,	%o5
	fpack32	%f24,	%f28,	%f28
	fmovde	%xcc,	%f14,	%f3
	fmovrdgz	%o6,	%f18,	%f28
	orn	%i1,	0x0747,	%g5
	edge16n	%o2,	%i0,	%l2
	andn	%i6,	%l0,	%l6
	movrgez	%o0,	0x15B,	%g2
	fmovdcs	%xcc,	%f7,	%f17
	xor	%i5,	0x064B,	%l5
	fmul8x16al	%f4,	%f6,	%f28
	sdiv	%l3,	0x1BCC,	%o4
	edge8ln	%i7,	%l1,	%g1
	ldd	[%l7 + 0x18],	%f0
	edge32n	%g4,	%i4,	%g6
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%f2
	fmovdvc	%xcc,	%f27,	%f31
	lduh	[%l7 + 0x42],	%i3
	for	%f22,	%f24,	%f2
	ld	[%l7 + 0x64],	%f0
	fcmpgt32	%f6,	%f0,	%g7
	addc	%o1,	%g3,	%o7
	array16	%o3,	%i2,	%o5
	ldsb	[%l7 + 0x2D],	%l4
	fmovsvs	%icc,	%f6,	%f5
	ldsb	[%l7 + 0x0C],	%o6
	fmovrdlz	%g5,	%f8,	%f30
	mova	%icc,	%i1,	%i0
	fmovrdgz	%l2,	%f6,	%f20
	fpadd32s	%f13,	%f30,	%f27
	fmovrde	%o2,	%f30,	%f6
	mulx	%i6,	%l0,	%l6
	movle	%icc,	%g2,	%i5
	fnand	%f4,	%f12,	%f6
	save %o0, %l3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f4
	smulcc	%i7,	%l1,	%l5
	sdiv	%g4,	0x132A,	%g1
	fmovdcs	%icc,	%f7,	%f24
	udivx	%g6,	0x1A4E,	%i4
	movle	%xcc,	%i3,	%g7
	umulcc	%g3,	0x022B,	%o7
	umul	%o1,	0x0549,	%i2
	movle	%xcc,	%o5,	%o3
	movcc	%icc,	%o6,	%g5
	movne	%xcc,	%i1,	%i0
	move	%icc,	%l2,	%l4
	sra	%i6,	0x1C,	%l0
	ldsb	[%l7 + 0x1D],	%l6
	addcc	%g2,	0x14C7,	%i5
	sdiv	%o0,	0x1B36,	%l3
	or	%o4,	%o2,	%l1
	movl	%icc,	%i7,	%g4
	st	%f8,	[%l7 + 0x70]
	fone	%f24
	udiv	%g1,	0x1713,	%l5
	fmovsgu	%xcc,	%f2,	%f0
	addc	%g6,	0x0C24,	%i3
	subccc	%i4,	%g3,	%o7
	fmovsn	%xcc,	%f10,	%f25
	nop
	set	0x4D, %l4
	ldub	[%l7 + %l4],	%o1
	fmul8x16al	%f16,	%f27,	%f30
	movrlz	%i2,	0x030,	%g7
	alignaddrl	%o3,	%o5,	%o6
	subc	%i1,	%g5,	%i0
	array16	%l2,	%l4,	%i6
	popc	%l6,	%g2
	fmovdvc	%icc,	%f4,	%f25
	fzeros	%f1
	ldd	[%l7 + 0x10],	%i4
	ldsw	[%l7 + 0x20],	%o0
	movvs	%xcc,	%l0,	%l3
	movne	%xcc,	%o4,	%l1
	lduh	[%l7 + 0x2E],	%i7
	edge32	%o2,	%g4,	%g1
	stw	%g6,	[%l7 + 0x68]
	movrlz	%l5,	%i3,	%i4
	sdivx	%o7,	0x01BD,	%g3
	udiv	%o1,	0x1697,	%g7
	xnor	%i2,	0x18AC,	%o5
	std	%f6,	[%l7 + 0x58]
	movre	%o6,	0x1B8,	%o3
	ldub	[%l7 + 0x35],	%g5
	mulx	%i1,	%l2,	%i0
	movn	%icc,	%i6,	%l4
	mova	%icc,	%g2,	%l6
	sethi	0x0ABD,	%o0
	fcmpes	%fcc1,	%f17,	%f25
	edge32l	%i5,	%l3,	%l0
	ldd	[%l7 + 0x18],	%l0
	andncc	%i7,	%o2,	%g4
	movvc	%icc,	%g1,	%g6
	srl	%l5,	0x0C,	%o4
	alignaddrl	%i4,	%o7,	%i3
	fpsub32	%f10,	%f22,	%f14
	movrgez	%o1,	%g3,	%g7
	edge8n	%o5,	%i2,	%o6
	fnegs	%f4,	%f3
	stb	%g5,	[%l7 + 0x7B]
	ldsw	[%l7 + 0x24],	%i1
	fone	%f2
	alignaddrl	%l2,	%i0,	%o3
	fpsub16	%f20,	%f10,	%f30
	movrgez	%i6,	0x20F,	%l4
	mova	%xcc,	%l6,	%g2
	sdivx	%o0,	0x1335,	%i5
	edge32	%l3,	%l1,	%l0
	subccc	%o2,	0x087A,	%i7
	mulscc	%g1,	%g4,	%l5
	movpos	%xcc,	%g6,	%o4
	stb	%o7,	[%l7 + 0x67]
	subccc	%i3,	%i4,	%o1
	save %g3, %o5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f20,	%f20
	pdist	%f18,	%f20,	%f2
	ldub	[%l7 + 0x7A],	%o6
	movl	%icc,	%i2,	%g5
	fabsd	%f20,	%f18
	movg	%icc,	%i1,	%l2
	ldd	[%l7 + 0x58],	%i0
	udivcc	%i6,	0x0EED,	%o3
	fmovdn	%icc,	%f5,	%f12
	addc	%l6,	0x088E,	%g2
	fmul8x16au	%f14,	%f10,	%f22
	orncc	%o0,	%l4,	%l3
	fmovsleu	%xcc,	%f12,	%f29
	xnorcc	%l1,	%l0,	%i5
	movrgez	%i7,	0x059,	%g1
	stb	%g4,	[%l7 + 0x14]
	edge16	%l5,	%o2,	%g6
	srax	%o7,	%i3,	%i4
	fxors	%f15,	%f20,	%f17
	fmovdge	%xcc,	%f6,	%f13
	fxnor	%f20,	%f2,	%f2
	mulscc	%o4,	%o1,	%o5
	edge32	%g7,	%g3,	%o6
	udivx	%g5,	0x00FC,	%i2
	movrlez	%l2,	0x302,	%i1
	movg	%icc,	%i0,	%i6
	ldd	[%l7 + 0x20],	%f14
	array32	%l6,	%o3,	%o0
	fmovdcs	%icc,	%f0,	%f30
	xor	%l4,	%l3,	%g2
	fmovscc	%icc,	%f14,	%f4
	sth	%l0,	[%l7 + 0x10]
	array8	%i5,	%l1,	%i7
	fmovrdgz	%g1,	%f6,	%f4
	srl	%g4,	0x0D,	%l5
	mulx	%g6,	0x0E80,	%o7
	movgu	%icc,	%i3,	%o2
	orncc	%i4,	%o1,	%o5
	movre	%g7,	%g3,	%o6
	udiv	%g5,	0x081E,	%i2
	ldsh	[%l7 + 0x4A],	%o4
	ldsw	[%l7 + 0x20],	%l2
	edge8	%i1,	%i0,	%l6
	fmovde	%xcc,	%f28,	%f26
	sdiv	%i6,	0x09FC,	%o3
	fandnot1s	%f1,	%f8,	%f30
	ldx	[%l7 + 0x68],	%o0
	udivcc	%l4,	0x103A,	%g2
	movrne	%l3,	0x395,	%l0
	edge8l	%l1,	%i5,	%g1
	save %g4, 0x0E4E, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%xcc,	%f6,	%f20
	xnorcc	%g6,	%o7,	%i3
	movrlz	%o2,	0x35A,	%l5
	edge8	%i4,	%o1,	%o5
	alignaddr	%g7,	%g3,	%g5
	edge16	%o6,	%i2,	%l2
	fmovspos	%xcc,	%f4,	%f18
	subc	%o4,	%i0,	%l6
	fmovsn	%icc,	%f31,	%f2
	fmovscs	%icc,	%f22,	%f9
	fabsd	%f24,	%f26
	andncc	%i1,	%o3,	%o0
	ldsb	[%l7 + 0x4E],	%i6
	movrlz	%g2,	0x295,	%l4
	mulx	%l3,	0x0035,	%l1
	andcc	%i5,	0x1A5D,	%g1
	fpadd32s	%f12,	%f19,	%f1
	nop
	set	0x3C, %l5
	ldsw	[%l7 + %l5],	%l0
	and	%g4,	0x0BEE,	%i7
	orcc	%g6,	%i3,	%o7
	fpackfix	%f12,	%f22
	orn	%o2,	0x15F4,	%i4
	ld	[%l7 + 0x54],	%f28
	smul	%l5,	0x19E0,	%o5
	ldsh	[%l7 + 0x08],	%o1
	edge32	%g7,	%g5,	%g3
	fpsub16s	%f27,	%f2,	%f30
	xorcc	%o6,	0x0FBB,	%i2
	movvs	%xcc,	%l2,	%i0
	sdivx	%o4,	0x092B,	%i1
	ldub	[%l7 + 0x32],	%l6
	fnor	%f0,	%f24,	%f10
	movvs	%xcc,	%o0,	%i6
	edge16	%o3,	%l4,	%g2
	addcc	%l1,	%i5,	%l3
	or	%l0,	%g1,	%g4
	movrlez	%g6,	%i7,	%i3
	fmovdg	%xcc,	%f0,	%f28
	fmovrdlez	%o7,	%f14,	%f2
	andn	%o2,	0x0B1A,	%i4
	nop
	set	0x60, %i5
	ldsw	[%l7 + %i5],	%l5
	or	%o5,	%o1,	%g7
	xnorcc	%g5,	0x01A5,	%o6
	fmul8x16	%f23,	%f22,	%f0
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%i2
	udiv	%l2,	0x1F40,	%i0
	fsrc1s	%f26,	%f15
	fpadd32s	%f8,	%f17,	%f5
	fpadd32s	%f1,	%f9,	%f11
	fcmpgt32	%f24,	%f26,	%o4
	fmul8ulx16	%f22,	%f24,	%f28
	ld	[%l7 + 0x44],	%f4
	fmovrsgez	%g3,	%f18,	%f29
	edge16l	%i1,	%o0,	%l6
	movvc	%icc,	%i6,	%o3
	fpsub16s	%f30,	%f12,	%f14
	sub	%l4,	0x043E,	%l1
	popc	%g2,	%i5
	edge16l	%l0,	%g1,	%g4
	ldsh	[%l7 + 0x0C],	%g6
	edge8l	%i7,	%i3,	%l3
	nop
	set	0x3C, %i0
	lduw	[%l7 + %i0],	%o7
	movre	%o2,	%l5,	%i4
	andcc	%o5,	%o1,	%g5
	fmovsn	%xcc,	%f23,	%f29
	sra	%o6,	0x1D,	%g7
	mulx	%i2,	0x0BFD,	%i0
	movl	%xcc,	%l2,	%o4
	movrlez	%i1,	%g3,	%o0
	alignaddr	%l6,	%i6,	%o3
	addccc	%l1,	0x0267,	%l4
	alignaddr	%i5,	%l0,	%g2
	fmovde	%xcc,	%f0,	%f6
	addc	%g1,	%g6,	%g4
	fmovdleu	%xcc,	%f19,	%f19
	movrgz	%i7,	%l3,	%i3
	fexpand	%f10,	%f30
	ldx	[%l7 + 0x68],	%o2
	srl	%o7,	%l5,	%o5
	fnors	%f7,	%f9,	%f30
	fnegd	%f14,	%f6
	movvc	%icc,	%o1,	%g5
	movrlez	%o6,	%i4,	%g7
	array16	%i2,	%i0,	%o4
	movge	%icc,	%l2,	%i1
	ldd	[%l7 + 0x50],	%g2
	movvs	%icc,	%l6,	%i6
	fxors	%f14,	%f20,	%f1
	udiv	%o0,	0x0968,	%o3
	addcc	%l4,	%l1,	%l0
	fcmple16	%f4,	%f16,	%g2
	ldsb	[%l7 + 0x32],	%i5
	array16	%g6,	%g1,	%i7
	array16	%g4,	%i3,	%o2
	fmovrdgz	%l3,	%f14,	%f28
	lduh	[%l7 + 0x16],	%l5
	fmovsa	%icc,	%f15,	%f22
	srlx	%o7,	0x02,	%o5
	fnot2	%f20,	%f12
	sdivcc	%o1,	0x08E3,	%o6
	srl	%g5,	%g7,	%i4
	movn	%xcc,	%i0,	%i2
	edge8	%l2,	%o4,	%i1
	sdivcc	%g3,	0x17F9,	%i6
	mulscc	%l6,	%o3,	%o0
	udivcc	%l1,	0x0BC5,	%l4
	movn	%icc,	%g2,	%i5
	smulcc	%g6,	%l0,	%g1
	edge32l	%i7,	%i3,	%g4
	add	%l3,	0x143F,	%l5
	movrne	%o7,	%o2,	%o1
	mova	%xcc,	%o6,	%o5
	save %g5, %g7, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i2,	%l2,	%o4
	edge8l	%i1,	%i4,	%g3
	movleu	%icc,	%i6,	%l6
	sth	%o3,	[%l7 + 0x14]
	movrlz	%l1,	%o0,	%l4
	edge16	%g2,	%g6,	%l0
	fmovspos	%xcc,	%f30,	%f9
	fones	%f26
	xnor	%i5,	0x11F9,	%i7
	add	%i3,	0x0A19,	%g1
	nop
	set	0x18, %o5
	stx	%g4,	[%l7 + %o5]
	st	%f15,	[%l7 + 0x28]
	popc	%l3,	%o7
	fnand	%f10,	%f4,	%f10
	fmovsgu	%icc,	%f24,	%f6
	movneg	%icc,	%l5,	%o1
	fmovrsgz	%o2,	%f5,	%f29
	orn	%o6,	0x075C,	%g5
	fmovdge	%icc,	%f20,	%f19
	sra	%o5,	0x00,	%i0
	srax	%i2,	0x18,	%g7
	umul	%o4,	0x0DB6,	%i1
	array32	%l2,	%g3,	%i4
	srlx	%l6,	0x1A,	%i6
	orn	%o3,	0x1836,	%o0
	sll	%l1,	%g2,	%g6
	orcc	%l0,	0x0743,	%l4
	stb	%i7,	[%l7 + 0x15]
	fmovsne	%xcc,	%f26,	%f12
	fornot1s	%f5,	%f29,	%f26
	fpsub16	%f20,	%f20,	%f28
	fmovsgu	%xcc,	%f2,	%f16
	udivcc	%i5,	0x1E55,	%g1
	fzeros	%f17
	fpsub32s	%f24,	%f21,	%f4
	udivx	%g4,	0x1ED2,	%i3
	srl	%l3,	%l5,	%o1
	smul	%o7,	0x1878,	%o6
	movge	%icc,	%o2,	%g5
	movrgez	%o5,	0x381,	%i2
	orn	%i0,	%g7,	%o4
	addcc	%i1,	%g3,	%l2
	add	%i4,	0x0BF0,	%l6
	movrne	%o3,	0x25A,	%i6
	edge16n	%l1,	%o0,	%g6
	andcc	%l0,	0x185B,	%l4
	alignaddr	%i7,	%i5,	%g1
	edge16	%g4,	%g2,	%l3
	fpadd32	%f6,	%f8,	%f8
	xnor	%l5,	%i3,	%o7
	fmovdle	%xcc,	%f1,	%f28
	umul	%o1,	%o2,	%o6
	movn	%icc,	%o5,	%g5
	popc	0x15D6,	%i0
	movn	%xcc,	%g7,	%i2
	orcc	%i1,	%o4,	%l2
	umulcc	%i4,	0x1682,	%l6
	udivcc	%g3,	0x00F5,	%o3
	ldd	[%l7 + 0x70],	%l0
	fornot2	%f18,	%f28,	%f30
	smul	%o0,	0x1120,	%g6
	fornot2	%f14,	%f14,	%f10
	addcc	%l0,	0x12DC,	%l4
	movcc	%icc,	%i7,	%i6
	sllx	%g1,	0x18,	%i5
	add	%g4,	0x0D54,	%g2
	movneg	%xcc,	%l5,	%l3
	ldsb	[%l7 + 0x6F],	%i3
	fandnot2	%f4,	%f6,	%f20
	orncc	%o7,	%o1,	%o6
	movcc	%xcc,	%o5,	%o2
	nop
	set	0x50, %o1
	stx	%i0,	[%l7 + %o1]
	move	%xcc,	%g5,	%i2
	fzeros	%f7
	sll	%g7,	0x01,	%i1
	udivx	%l2,	0x12E4,	%o4
	edge8l	%i4,	%l6,	%g3
	edge32ln	%o3,	%l1,	%o0
	smul	%g6,	%l4,	%l0
	mulx	%i7,	%i6,	%g1
	subccc	%g4,	0x15A5,	%i5
	fmovsg	%xcc,	%f19,	%f29
	fmovdl	%xcc,	%f6,	%f3
	smul	%g2,	%l3,	%i3
	movvs	%icc,	%l5,	%o1
	movneg	%icc,	%o7,	%o6
	edge16	%o5,	%i0,	%g5
	movcc	%xcc,	%i2,	%g7
	mulscc	%i1,	%o2,	%o4
	bshuffle	%f8,	%f22,	%f20
	stb	%i4,	[%l7 + 0x4D]
	array32	%l6,	%l2,	%o3
	fornot2	%f6,	%f16,	%f6
	array32	%g3,	%o0,	%g6
	sub	%l1,	0x0645,	%l4
	edge8l	%i7,	%i6,	%g1
	movvs	%icc,	%g4,	%i5
	fmovdcc	%icc,	%f15,	%f31
	addc	%g2,	%l3,	%i3
	alignaddr	%l0,	%o1,	%l5
	srlx	%o6,	%o5,	%i0
	stb	%g5,	[%l7 + 0x3B]
	ldub	[%l7 + 0x4D],	%i2
	sir	0x01CD
	lduw	[%l7 + 0x18],	%o7
	fcmple32	%f20,	%f14,	%i1
	umulcc	%g7,	0x142F,	%o4
	edge8ln	%o2,	%i4,	%l2
	fpack32	%f24,	%f2,	%f18
	srlx	%o3,	0x02,	%l6
	ldub	[%l7 + 0x4B],	%g3
	std	%f14,	[%l7 + 0x70]
	fmovdpos	%icc,	%f25,	%f20
	fzero	%f6
	fnot1s	%f13,	%f13
	movvs	%xcc,	%o0,	%l1
	xorcc	%l4,	0x0719,	%g6
	umul	%i7,	0x1A2A,	%i6
	ldx	[%l7 + 0x30],	%g1
	movneg	%icc,	%g4,	%i5
	stb	%l3,	[%l7 + 0x40]
	stx	%g2,	[%l7 + 0x68]
	stw	%l0,	[%l7 + 0x38]
	edge32l	%o1,	%l5,	%o6
	sth	%i3,	[%l7 + 0x54]
	popc	0x18B9,	%o5
	fsrc2	%f14,	%f28
	srl	%i0,	%i2,	%o7
	movrgz	%g5,	%i1,	%g7
	nop
	set	0x46, %g7
	lduh	[%l7 + %g7],	%o2
	ldub	[%l7 + 0x43],	%o4
	fornot1	%f22,	%f18,	%f14
	umul	%i4,	%l2,	%o3
	sth	%l6,	[%l7 + 0x18]
	andcc	%g3,	%l1,	%o0
	fxor	%f18,	%f12,	%f18
	sdivx	%g6,	0x0A46,	%i7
	stx	%l4,	[%l7 + 0x70]
	sir	0x119A
	ldsh	[%l7 + 0x0A],	%i6
	edge16	%g4,	%g1,	%l3
	smul	%g2,	0x1CC1,	%l0
	edge32	%i5,	%l5,	%o6
	restore %o1, 0x069A, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i0,	%i2,	%i3
	edge8	%g5,	%o7,	%i1
	addcc	%o2,	%g7,	%o4
	sethi	0x170B,	%l2
	edge8n	%i4,	%o3,	%g3
	umulcc	%l1,	%l6,	%o0
	ld	[%l7 + 0x20],	%f22
	mulx	%g6,	%i7,	%i6
	edge16	%l4,	%g4,	%g1
	udiv	%g2,	0x1226,	%l0
	edge16n	%i5,	%l3,	%l5
	ld	[%l7 + 0x7C],	%f7
	array8	%o6,	%o5,	%o1
	fpmerge	%f1,	%f15,	%f10
	sth	%i2,	[%l7 + 0x3C]
	movrgez	%i0,	%g5,	%o7
	mulx	%i1,	0x1E7B,	%o2
	stw	%g7,	[%l7 + 0x40]
	fmovdvs	%xcc,	%f2,	%f4
	fmovscc	%icc,	%f17,	%f4
	fmovdneg	%icc,	%f31,	%f23
	edge16	%o4,	%l2,	%i4
	xorcc	%i3,	%g3,	%l1
	fnors	%f11,	%f22,	%f12
	edge8	%o3,	%l6,	%o0
	orcc	%g6,	0x1A2C,	%i6
	orncc	%i7,	%g4,	%g1
	subccc	%g2,	0x110A,	%l0
	udiv	%i5,	0x06E9,	%l4
	save %l3, %l5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o1,	%i2
	movge	%icc,	%o5,	%g5
	edge8ln	%i0,	%o7,	%i1
	movn	%icc,	%g7,	%o4
	fmovrdlz	%l2,	%f18,	%f12
	addccc	%o2,	0x0E63,	%i3
	mulscc	%g3,	0x0EEE,	%l1
	fmovsneg	%icc,	%f3,	%f12
	movleu	%xcc,	%o3,	%i4
	fpsub16	%f10,	%f6,	%f18
	smul	%o0,	0x0333,	%l6
	fmovsleu	%icc,	%f20,	%f12
	fpackfix	%f18,	%f31
	sdivcc	%i6,	0x1EA4,	%i7
	mulscc	%g6,	0x0CD7,	%g1
	fpack16	%f14,	%f11
	sir	0x02CB
	ldub	[%l7 + 0x2E],	%g2
	fmovdn	%icc,	%f23,	%f4
	movl	%xcc,	%g4,	%l0
	movgu	%icc,	%i5,	%l3
	ldx	[%l7 + 0x48],	%l5
	orcc	%l4,	0x01A8,	%o1
	srl	%i2,	0x18,	%o6
	ldsh	[%l7 + 0x34],	%g5
	movl	%icc,	%o5,	%i0
	xor	%o7,	%g7,	%o4
	fmovsvs	%icc,	%f8,	%f27
	and	%l2,	0x1B99,	%o2
	sll	%i1,	0x1A,	%i3
	fandnot2s	%f14,	%f17,	%f22
	orn	%g3,	%o3,	%i4
	ldsw	[%l7 + 0x44],	%l1
	add	%o0,	0x02B9,	%l6
	sdivcc	%i6,	0x07CC,	%g6
	fmovsvs	%icc,	%f14,	%f16
	fnegd	%f18,	%f0
	edge32ln	%i7,	%g2,	%g4
	movneg	%xcc,	%l0,	%i5
	movcc	%icc,	%l3,	%g1
	fmovsvs	%icc,	%f22,	%f15
	fmovdgu	%xcc,	%f21,	%f31
	fzeros	%f7
	fnot1s	%f27,	%f9
	fsrc2s	%f8,	%f14
	move	%xcc,	%l4,	%l5
	movcc	%icc,	%o1,	%i2
	fornot2s	%f22,	%f2,	%f25
	movl	%xcc,	%o6,	%g5
	fsrc1	%f4,	%f20
	fmovsleu	%xcc,	%f14,	%f15
	edge32l	%o5,	%i0,	%o7
	srlx	%o4,	%g7,	%o2
	fmovdneg	%xcc,	%f18,	%f15
	addccc	%l2,	0x073F,	%i3
	edge16n	%g3,	%i1,	%i4
	mulx	%o3,	%o0,	%l1
	xor	%i6,	%g6,	%i7
	ldd	[%l7 + 0x40],	%g2
	sll	%l6,	%g4,	%i5
	movleu	%icc,	%l0,	%g1
	fmovrde	%l4,	%f8,	%f26
	fabss	%f26,	%f23
	umul	%l5,	0x0181,	%l3
	ld	[%l7 + 0x18],	%f14
	fcmpne32	%f2,	%f28,	%o1
	movneg	%xcc,	%o6,	%i2
	fxor	%f0,	%f30,	%f30
	subccc	%o5,	0x1336,	%i0
	stb	%g5,	[%l7 + 0x4C]
	edge8	%o7,	%g7,	%o2
	fornot2	%f24,	%f30,	%f30
	fabsd	%f10,	%f0
	movleu	%xcc,	%o4,	%l2
	srlx	%i3,	%i1,	%g3
	fnand	%f20,	%f28,	%f6
	addccc	%i4,	%o3,	%o0
	lduw	[%l7 + 0x7C],	%i6
	ldub	[%l7 + 0x56],	%l1
	edge16l	%i7,	%g2,	%l6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3587
!	Type f   	: 5442
!	Type i   	: 15971
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x0CAF9CBD
.word 0x71F9BB87
.word 0x72A3B89B
.word 0x4EC4474A
.word 0x8A258FCA
.word 0x53278507
.word 0x7354BF4B
.word 0x2B3F32A7
.word 0x10AF1CE0
.word 0x9D259E30
.word 0xB81091C6
.word 0xFEA88FF5
.word 0x5305445D
.word 0xABF1CE0D
.word 0xAA1423CA
.word 0xF5234C99
.word 0x3B950D0B
.word 0x7B5D79C4
.word 0xE0CD3088
.word 0xE4E89967
.word 0xB60BE022
.word 0x1263750B
.word 0x33C529E0
.word 0x67FEF2F2
.word 0x52E4479E
.word 0xA02F7160
.word 0xF5570C47
.word 0xEFBA0FF6
.word 0x86FDF8C7
.word 0xB98A8B4C
.word 0xE7C6D66F
.word 0x95A93995
.word 0x6C51F1E1
.word 0xDAE87B35
.word 0x825F3CC6
.word 0x36A692D8
.word 0xF8404625
.word 0x874D7490
.word 0x8C5208FD
.word 0x1C7129DD
.word 0x92E0CC10
.word 0x66F6C05E
.word 0x0A9CC7F1
.word 0xB0725130
.word 0x2282C7FE
.word 0xC00CB7C3
.word 0x022446E6
.word 0xD1DF06FB
.word 0xCB119C5C
.word 0x982FA44D
.word 0xD2FDB5BE
.word 0xF9C64788
.word 0x7220FA3B
.word 0x0D96F957
.word 0x92BFD239
.word 0x3BDD94D4
.word 0x3AF1AC6D
.word 0xCA4FB8BC
.word 0x14C38232
.word 0xEA6719C2
.word 0x99914EB3
.word 0x60E01CC0
.word 0x75FAEAD4
.word 0x89C95339
.end
