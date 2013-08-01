/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f3.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f3.s,v 1.1 2007/05/11 17:22:38 drp Exp $"
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
	setx	0x14CB2281A0511142,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x3,	%g1
	set	0x6,	%g2
	set	0x6,	%g3
	set	0x4,	%g4
	set	0x3,	%g5
	set	0x2,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x6,	%i1
	set	-0x1,	%i2
	set	-0xA,	%i3
	set	-0xE,	%i4
	set	-0x7,	%i5
	set	-0xF,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x1626CC08,	%l0
	set	0x3A59925F,	%l1
	set	0x66E4A004,	%l2
	set	0x34E6B906,	%l3
	set	0x1E0837C3,	%l4
	set	0x363C97D4,	%l5
	set	0x1FD396EA,	%l6
	!# Output registers
	set	0x12CB,	%o0
	set	-0x12A3,	%o1
	set	-0x0153,	%o2
	set	-0x0B06,	%o3
	set	-0x1769,	%o4
	set	-0x01DD,	%o5
	set	-0x0ADC,	%o6
	set	-0x0438,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xD224EBCA9A43DAB4)
	INIT_TH_FP_REG(%l7,%f2,0xE83CD0CF1C865357)
	INIT_TH_FP_REG(%l7,%f4,0xBE06F0B00EFF648F)
	INIT_TH_FP_REG(%l7,%f6,0x534BF2A567AD0334)
	INIT_TH_FP_REG(%l7,%f8,0xE1F09D4AEB42E898)
	INIT_TH_FP_REG(%l7,%f10,0x549B3BB546CEBCCE)
	INIT_TH_FP_REG(%l7,%f12,0x9B37B7A440958CCD)
	INIT_TH_FP_REG(%l7,%f14,0x254F92F35D69632A)
	INIT_TH_FP_REG(%l7,%f16,0xE1487CD1F3F25379)
	INIT_TH_FP_REG(%l7,%f18,0xFA23E3D5D794903A)
	INIT_TH_FP_REG(%l7,%f20,0x6BB49568B181535B)
	INIT_TH_FP_REG(%l7,%f22,0xE6ABD83E9C2930F7)
	INIT_TH_FP_REG(%l7,%f24,0x73772F3451153BEB)
	INIT_TH_FP_REG(%l7,%f26,0xB224C62100D0D9B7)
	INIT_TH_FP_REG(%l7,%f28,0xE3533200ABDF78A0)
	INIT_TH_FP_REG(%l7,%f30,0xE2AFD1CB9FA25125)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	array32	%g1,	%i5,	%l0
	edge16l	%g5,	%l4,	%g3
	fmovdne	%xcc,	%f18,	%f23
	edge16	%l1,	%g6,	%o4
	movne	%xcc,	%i4,	%l5
	edge8ln	%o1,	%g4,	%l3
	udivcc	%o6,	0x1D35,	%i7
	orcc	%l6,	%i6,	%o3
	movl	%icc,	%o5,	%o2
	fnot2s	%f12,	%f23
	fcmps	%fcc2,	%f0,	%f23
	movrgez	%i1,	%g2,	%g7
	fmovsleu	%xcc,	%f20,	%f26
	movne	%icc,	%o7,	%o0
	lduw	[%l7 + 0x74],	%l2
	array16	%i0,	%i3,	%g1
	fmovd	%f2,	%f0
	alignaddrl	%i5,	%l0,	%g5
	fmovrdgez	%i2,	%f20,	%f0
	nop
	set	0x30, %l3
	sth	%g3,	[%l7 + %l3]
	edge8n	%l1,	%l4,	%g6
	xorcc	%o4,	%i4,	%o1
	mulscc	%g4,	%l3,	%o6
	nop
	set	0x37, %o1
	ldub	[%l7 + %o1],	%i7
	ldd	[%l7 + 0x78],	%f0
	edge8l	%l5,	%i6,	%o3
	save %o5, %l6, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o2,	%g2,	%g7
	addcc	%o0,	%l2,	%o7
	orcc	%i0,	%g1,	%i5
	udivcc	%i3,	0x169B,	%g5
	alignaddr	%i2,	%l0,	%l1
	fxors	%f14,	%f28,	%f12
	udivx	%l4,	0x0D68,	%g3
	edge8n	%o4,	%g6,	%i4
	movne	%icc,	%o1,	%l3
	faligndata	%f18,	%f24,	%f6
	xnor	%g4,	%o6,	%i7
	std	%f6,	[%l7 + 0x50]
	xnorcc	%i6,	0x18A2,	%o3
	sth	%o5,	[%l7 + 0x64]
	fmovsg	%xcc,	%f4,	%f26
	edge16l	%l6,	%l5,	%i1
	subcc	%g2,	%o2,	%g7
	udivx	%o0,	0x0F8C,	%l2
	movrgez	%o7,	%g1,	%i5
	fmovsneg	%xcc,	%f28,	%f29
	fpsub32s	%f21,	%f19,	%f8
	ldsb	[%l7 + 0x2A],	%i0
	mulx	%i3,	%i2,	%l0
	fmovdvc	%icc,	%f24,	%f5
	add	%l1,	%l4,	%g5
	array32	%o4,	%g6,	%i4
	edge8n	%o1,	%g3,	%g4
	st	%f25,	[%l7 + 0x54]
	movge	%icc,	%l3,	%i7
	fcmpd	%fcc2,	%f22,	%f22
	movvc	%xcc,	%o6,	%o3
	edge32ln	%i6,	%o5,	%l6
	ldsb	[%l7 + 0x40],	%l5
	movle	%icc,	%g2,	%o2
	movre	%g7,	0x2A2,	%i1
	and	%l2,	%o7,	%g1
	edge8n	%i5,	%i0,	%i3
	fmul8ulx16	%f4,	%f24,	%f6
	save %o0, 0x004E, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x3C],	%l1
	orn	%l4,	%g5,	%l0
	udivcc	%g6,	0x00CA,	%i4
	popc	0x0515,	%o4
	array8	%o1,	%g4,	%g3
	ldsb	[%l7 + 0x7A],	%i7
	udivx	%o6,	0x067E,	%o3
	fnot2	%f12,	%f30
	edge16n	%i6,	%l3,	%l6
	ldx	[%l7 + 0x50],	%l5
	fmovrdgz	%g2,	%f16,	%f2
	mulx	%o2,	0x0E2D,	%o5
	sethi	0x0071,	%g7
	andcc	%l2,	%o7,	%i1
	sra	%g1,	%i0,	%i3
	popc	%o0,	%i2
	fmovrsgez	%i5,	%f14,	%f29
	lduh	[%l7 + 0x62],	%l4
	fpadd16	%f30,	%f16,	%f14
	movrgez	%l1,	0x1FF,	%g5
	movrne	%g6,	0x270,	%l0
	orcc	%o4,	0x08E1,	%i4
	movne	%icc,	%g4,	%g3
	xor	%o1,	%i7,	%o3
	andn	%o6,	%i6,	%l3
	edge16n	%l5,	%g2,	%l6
	ldd	[%l7 + 0x70],	%f4
	movg	%icc,	%o2,	%g7
	movrlez	%l2,	0x268,	%o7
	edge32n	%i1,	%g1,	%o5
	edge16n	%i3,	%i0,	%i2
	movre	%i5,	0x30E,	%l4
	fornot1	%f28,	%f4,	%f14
	movrne	%l1,	%o0,	%g5
	fmovrsne	%l0,	%f26,	%f4
	ldx	[%l7 + 0x18],	%o4
	ldsw	[%l7 + 0x38],	%i4
	subccc	%g4,	%g6,	%g3
	std	%f4,	[%l7 + 0x08]
	subccc	%o1,	%o3,	%o6
	pdist	%f16,	%f0,	%f2
	movne	%icc,	%i6,	%i7
	umul	%l5,	%g2,	%l3
	sllx	%o2,	0x08,	%l6
	ld	[%l7 + 0x2C],	%f20
	movgu	%icc,	%g7,	%o7
	sethi	0x167F,	%i1
	fmovse	%xcc,	%f17,	%f14
	srax	%g1,	%o5,	%i3
	subcc	%l2,	0x19EB,	%i0
	fmovde	%icc,	%f17,	%f9
	smul	%i2,	0x033C,	%i5
	addc	%l1,	0x008F,	%o0
	sir	0x0E95
	fmovrsgez	%g5,	%f25,	%f18
	or	%l4,	%o4,	%i4
	mulx	%g4,	0x1208,	%l0
	umul	%g6,	%o1,	%g3
	udiv	%o3,	0x19DD,	%o6
	movrlez	%i6,	%l5,	%g2
	orcc	%l3,	%o2,	%i7
	movrgz	%g7,	%l6,	%o7
	faligndata	%f14,	%f24,	%f8
	ldd	[%l7 + 0x70],	%i0
	edge8n	%o5,	%g1,	%l2
	edge8ln	%i0,	%i3,	%i5
	xnorcc	%l1,	0x0ED8,	%o0
	mulx	%i2,	%g5,	%o4
	alignaddr	%l4,	%i4,	%g4
	movn	%icc,	%l0,	%g6
	alignaddrl	%g3,	%o3,	%o1
	movrlez	%o6,	0x0F0,	%l5
	andcc	%i6,	%g2,	%o2
	movneg	%icc,	%l3,	%g7
	fmovd	%f20,	%f28
	movvs	%xcc,	%i7,	%o7
	sth	%i1,	[%l7 + 0x18]
	smul	%o5,	%l6,	%l2
	fmovrde	%i0,	%f18,	%f8
	fpadd16s	%f12,	%f23,	%f3
	movvs	%icc,	%i3,	%g1
	st	%f23,	[%l7 + 0x6C]
	xorcc	%l1,	%o0,	%i2
	sdivx	%g5,	0x0E8D,	%o4
	edge8l	%i5,	%l4,	%i4
	sra	%g4,	0x1E,	%g6
	edge16l	%l0,	%o3,	%g3
	orncc	%o1,	%l5,	%o6
	fmovrslez	%g2,	%f18,	%f1
	andcc	%i6,	0x0978,	%l3
	save %g7, %o2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i7,	%o5
	movrgz	%i1,	%l6,	%i0
	fzero	%f8
	fcmple16	%f16,	%f4,	%l2
	fmovrsne	%g1,	%f21,	%f1
	fabss	%f3,	%f31
	addc	%i3,	%l1,	%o0
	edge16	%i2,	%g5,	%i5
	xnor	%o4,	0x0346,	%i4
	udiv	%l4,	0x14BD,	%g6
	fmovdneg	%xcc,	%f19,	%f7
	movrgz	%g4,	%l0,	%o3
	edge32	%g3,	%o1,	%l5
	ldx	[%l7 + 0x68],	%g2
	mulscc	%i6,	0x05F0,	%o6
	fmovsg	%xcc,	%f22,	%f29
	edge8ln	%g7,	%o2,	%o7
	ldd	[%l7 + 0x40],	%i6
	fmovsgu	%xcc,	%f20,	%f5
	movg	%icc,	%l3,	%o5
	edge8l	%l6,	%i0,	%l2
	fandnot1s	%f25,	%f13,	%f14
	ldd	[%l7 + 0x48],	%i0
	nop
	set	0x58, %o7
	ldsh	[%l7 + %o7],	%i3
	udivx	%l1,	0x0BCF,	%g1
	edge32l	%o0,	%g5,	%i5
	lduh	[%l7 + 0x14],	%i2
	stx	%i4,	[%l7 + 0x28]
	movrne	%o4,	0x26B,	%g6
	movpos	%xcc,	%g4,	%l0
	orn	%l4,	0x077D,	%g3
	movgu	%icc,	%o3,	%l5
	andn	%o1,	%g2,	%i6
	ldub	[%l7 + 0x59],	%g7
	movrlez	%o2,	0x3D2,	%o7
	ldsb	[%l7 + 0x65],	%o6
	addccc	%i7,	%o5,	%l3
	ld	[%l7 + 0x24],	%f4
	movne	%icc,	%i0,	%l6
	smulcc	%l2,	0x0BDE,	%i3
	std	%f6,	[%l7 + 0x68]
	fmovrde	%l1,	%f30,	%f24
	srax	%i1,	0x0A,	%g1
	orcc	%o0,	0x1851,	%i5
	movneg	%icc,	%g5,	%i2
	orn	%o4,	0x1B8A,	%g6
	std	%f2,	[%l7 + 0x38]
	popc	%g4,	%i4
	udivx	%l4,	0x1B06,	%g3
	fsrc1	%f2,	%f30
	smulcc	%l0,	%l5,	%o1
	andcc	%g2,	0x0DAD,	%o3
	edge8	%g7,	%i6,	%o7
	faligndata	%f20,	%f4,	%f2
	sir	0x0DD5
	edge32	%o6,	%i7,	%o5
	srl	%o2,	%l3,	%i0
	xnor	%l6,	%l2,	%l1
	st	%f12,	[%l7 + 0x58]
	fmovdvc	%xcc,	%f31,	%f11
	sth	%i3,	[%l7 + 0x28]
	movrgez	%g1,	%i1,	%o0
	fmovsgu	%xcc,	%f29,	%f11
	mulscc	%i5,	%g5,	%i2
	movne	%icc,	%o4,	%g4
	smulcc	%i4,	0x109A,	%g6
	ld	[%l7 + 0x54],	%f23
	movneg	%xcc,	%g3,	%l4
	movvc	%xcc,	%l5,	%o1
	save %l0, 0x1EFC, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g7,	0x1EB6,	%i6
	movrlez	%o3,	0x048,	%o6
	movrgz	%o7,	0x073,	%o5
	array8	%i7,	%l3,	%i0
	edge32n	%o2,	%l2,	%l6
	fmovdge	%icc,	%f19,	%f8
	fmovrdne	%i3,	%f26,	%f10
	movvc	%icc,	%g1,	%i1
	movrlez	%o0,	%i5,	%l1
	fmovsvs	%icc,	%f31,	%f4
	fexpand	%f1,	%f8
	move	%icc,	%i2,	%g5
	fors	%f18,	%f18,	%f4
	lduw	[%l7 + 0x2C],	%g4
	edge8l	%o4,	%i4,	%g6
	srax	%g3,	%l4,	%l5
	movcs	%xcc,	%l0,	%g2
	bshuffle	%f8,	%f12,	%f14
	alignaddrl	%o1,	%i6,	%g7
	fmovsvc	%icc,	%f29,	%f29
	nop
	set	0x7C, %o0
	lduw	[%l7 + %o0],	%o6
	movvs	%icc,	%o3,	%o5
	edge8l	%i7,	%o7,	%i0
	sir	0x18B4
	array16	%l3,	%o2,	%l2
	fmovscs	%icc,	%f13,	%f1
	stx	%l6,	[%l7 + 0x58]
	fcmpeq16	%f12,	%f22,	%g1
	andncc	%i3,	%i1,	%i5
	movrgz	%o0,	0x17F,	%l1
	stx	%i2,	[%l7 + 0x58]
	fpsub16s	%f4,	%f28,	%f26
	ldsb	[%l7 + 0x7E],	%g5
	movvs	%icc,	%o4,	%g4
	addc	%i4,	0x0B6B,	%g6
	orncc	%l4,	0x16C0,	%l5
	mulscc	%l0,	%g2,	%g3
	fone	%f6
	sth	%o1,	[%l7 + 0x10]
	edge16n	%i6,	%o6,	%o3
	sub	%o5,	0x1E42,	%g7
	edge16l	%i7,	%o7,	%i0
	edge8n	%o2,	%l2,	%l3
	edge16n	%g1,	%i3,	%l6
	subccc	%i1,	%i5,	%l1
	movvs	%icc,	%o0,	%i2
	umulcc	%o4,	%g4,	%g5
	sdivcc	%g6,	0x03AB,	%l4
	movrgz	%l5,	0x352,	%l0
	addc	%g2,	%g3,	%i4
	ldub	[%l7 + 0x1C],	%o1
	fxor	%f20,	%f30,	%f8
	ldsb	[%l7 + 0x11],	%o6
	udiv	%o3,	0x1C34,	%o5
	array8	%i6,	%i7,	%g7
	andn	%o7,	%i0,	%o2
	edge8l	%l3,	%l2,	%g1
	fmovsleu	%icc,	%f28,	%f23
	umulcc	%i3,	0x0D71,	%i1
	fmovsn	%xcc,	%f12,	%f19
	movcc	%xcc,	%i5,	%l1
	umul	%o0,	%l6,	%i2
	movvs	%xcc,	%g4,	%o4
	udivcc	%g6,	0x17C3,	%l4
	sllx	%l5,	%l0,	%g2
	array32	%g3,	%g5,	%o1
	save %i4, %o6, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f6,	[%l7 + 0x48]
	movl	%icc,	%o5,	%i7
	add	%g7,	0x1DDA,	%o7
	movne	%xcc,	%i0,	%i6
	edge16l	%l3,	%o2,	%l2
	alignaddr	%g1,	%i1,	%i5
	edge16n	%i3,	%l1,	%l6
	addcc	%i2,	%g4,	%o0
	movrne	%g6,	0x3B4,	%l4
	fnot1s	%f15,	%f2
	edge16ln	%l5,	%o4,	%g2
	fmovdn	%icc,	%f24,	%f19
	ld	[%l7 + 0x3C],	%f3
	addc	%l0,	%g5,	%g3
	movrgez	%i4,	0x0A9,	%o6
	subccc	%o1,	%o3,	%o5
	stb	%g7,	[%l7 + 0x32]
	ldx	[%l7 + 0x68],	%o7
	stx	%i7,	[%l7 + 0x40]
	or	%i0,	%i6,	%o2
	mova	%xcc,	%l3,	%g1
	movleu	%icc,	%i1,	%l2
	fzeros	%f6
	sdivcc	%i5,	0x15CA,	%i3
	movgu	%xcc,	%l6,	%l1
	movrlz	%g4,	%o0,	%g6
	ld	[%l7 + 0x18],	%f21
	movpos	%icc,	%l4,	%i2
	movvs	%icc,	%l5,	%g2
	sra	%o4,	%l0,	%g5
	sllx	%g3,	%o6,	%i4
	movrlez	%o3,	%o5,	%g7
	nop
	set	0x3A, %o6
	stb	%o1,	[%l7 + %o6]
	movl	%xcc,	%i7,	%o7
	movge	%xcc,	%i0,	%o2
	fpadd32s	%f9,	%f16,	%f12
	umul	%i6,	%l3,	%i1
	srl	%g1,	0x15,	%i5
	ldx	[%l7 + 0x18],	%l2
	addc	%i3,	%l6,	%g4
	fmovsneg	%xcc,	%f31,	%f16
	fnegs	%f0,	%f16
	popc	%l1,	%g6
	movre	%o0,	0x310,	%i2
	stb	%l4,	[%l7 + 0x31]
	movvc	%icc,	%g2,	%o4
	sth	%l0,	[%l7 + 0x1E]
	movvc	%icc,	%l5,	%g3
	sllx	%o6,	%i4,	%o3
	movn	%icc,	%g5,	%o5
	add	%g7,	0x0F84,	%o1
	edge8l	%o7,	%i0,	%o2
	sra	%i6,	%i7,	%i1
	subccc	%g1,	0x1BB2,	%i5
	addcc	%l3,	%i3,	%l2
	andcc	%l6,	%g4,	%l1
	restore %o0, 0x1E5C, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%l4,	%g2
	sir	0x0D63
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%o4
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	movrlz	%o6,	0x18D,	%i4
	fmovsg	%xcc,	%f24,	%f31
	fandnot1	%f14,	%f10,	%f24
	array8	%o3,	%l5,	%g5
	smulcc	%o5,	0x1EBF,	%o1
	fpadd16s	%f29,	%f4,	%f5
	mulx	%g7,	%i0,	%o7
	sethi	0x1161,	%o2
	fmovrsgz	%i6,	%f24,	%f7
	movvc	%xcc,	%i1,	%g1
	movvc	%xcc,	%i5,	%i7
	save %i3, %l2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f2,	%f20,	%f16
	movrlez	%g4,	0x3B3,	%l1
	sth	%l3,	[%l7 + 0x30]
	fcmpgt32	%f24,	%f0,	%o0
	movle	%icc,	%g6,	%l4
	udivx	%o4,	0x15E6,	%l0
	movrne	%i2,	%g2,	%g3
	add	%i4,	0x06BE,	%o3
	fexpand	%f15,	%f16
	movcc	%icc,	%l5,	%o6
	movgu	%xcc,	%g5,	%o1
	orcc	%o5,	0x04D8,	%i0
	xorcc	%g7,	0x07B3,	%o7
	fmovrdgz	%i6,	%f16,	%f2
	nop
	set	0x50, %i2
	stx	%o2,	[%l7 + %i2]
	fmovdle	%xcc,	%f5,	%f4
	fcmpne32	%f0,	%f0,	%i1
	ldub	[%l7 + 0x79],	%g1
	udivcc	%i7,	0x0BB0,	%i5
	movrgez	%l2,	0x2FC,	%l6
	movge	%icc,	%i3,	%l1
	edge16l	%g4,	%l3,	%g6
	edge8n	%o0,	%l4,	%l0
	xorcc	%o4,	%g2,	%i2
	fmovrsgez	%g3,	%f22,	%f9
	edge8ln	%o3,	%i4,	%o6
	fpackfix	%f14,	%f16
	sllx	%l5,	0x14,	%g5
	fmovrsne	%o1,	%f8,	%f3
	movrgz	%o5,	%g7,	%i0
	movne	%icc,	%i6,	%o7
	movre	%o2,	0x294,	%i1
	ldd	[%l7 + 0x10],	%f14
	fmovrdlez	%g1,	%f16,	%f12
	sll	%i7,	0x18,	%i5
	array16	%l2,	%i3,	%l6
	sll	%l1,	%g4,	%l3
	ldd	[%l7 + 0x30],	%f4
	movvs	%xcc,	%o0,	%g6
	array32	%l4,	%o4,	%g2
	array8	%i2,	%l0,	%o3
	mova	%xcc,	%i4,	%o6
	xor	%g3,	%g5,	%l5
	sir	0x188C
	movrlz	%o5,	%o1,	%g7
	lduh	[%l7 + 0x12],	%i0
	subccc	%i6,	%o2,	%o7
	st	%f1,	[%l7 + 0x34]
	movg	%xcc,	%g1,	%i7
	lduw	[%l7 + 0x54],	%i1
	lduw	[%l7 + 0x40],	%i5
	fmovspos	%icc,	%f17,	%f15
	addcc	%i3,	%l6,	%l2
	fmovsg	%xcc,	%f27,	%f14
	fmovrdgez	%g4,	%f28,	%f10
	array8	%l1,	%l3,	%g6
	fabss	%f6,	%f1
	movcs	%xcc,	%l4,	%o0
	movcc	%xcc,	%o4,	%i2
	fsrc2	%f24,	%f18
	addccc	%l0,	%o3,	%g2
	edge32n	%o6,	%g3,	%i4
	movge	%icc,	%g5,	%l5
	udiv	%o5,	0x0E96,	%g7
	ldsh	[%l7 + 0x60],	%i0
	fmovsvs	%xcc,	%f20,	%f17
	ldd	[%l7 + 0x60],	%f4
	fmovdpos	%xcc,	%f8,	%f25
	alignaddrl	%i6,	%o1,	%o2
	fmovdle	%xcc,	%f12,	%f11
	movcc	%xcc,	%g1,	%i7
	sdivx	%i1,	0x1529,	%i5
	movle	%xcc,	%o7,	%i3
	fnegs	%f10,	%f25
	fmovdleu	%icc,	%f7,	%f16
	save %l6, %g4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l1,	%l3
	mulx	%g6,	0x05A6,	%o0
	edge16	%o4,	%l4,	%i2
	movleu	%xcc,	%o3,	%g2
	array16	%o6,	%g3,	%l0
	sir	0x1B90
	fands	%f4,	%f22,	%f21
	edge16n	%i4,	%l5,	%g5
	fandnot2s	%f25,	%f9,	%f2
	array32	%g7,	%o5,	%i6
	sethi	0x0EC5,	%o1
	siam	0x4
	addcc	%o2,	0x0E62,	%i0
	edge8n	%g1,	%i1,	%i7
	movle	%xcc,	%i5,	%i3
	fmovrsne	%o7,	%f12,	%f26
	andncc	%l6,	%g4,	%l2
	fandnot2	%f20,	%f26,	%f4
	sdiv	%l1,	0x0B8D,	%g6
	ld	[%l7 + 0x60],	%f10
	srax	%l3,	0x17,	%o0
	movrgz	%l4,	0x376,	%i2
	popc	%o3,	%g2
	movneg	%icc,	%o6,	%o4
	mulscc	%l0,	0x1331,	%g3
	ldsh	[%l7 + 0x6A],	%i4
	fnegd	%f14,	%f28
	fmovrde	%l5,	%f28,	%f14
	move	%xcc,	%g7,	%o5
	fnor	%f6,	%f20,	%f12
	mulx	%i6,	%g5,	%o2
	move	%icc,	%o1,	%i0
	movrgz	%i1,	0x2EA,	%g1
	fxors	%f19,	%f5,	%f12
	ldsh	[%l7 + 0x48],	%i5
	edge32ln	%i3,	%o7,	%i7
	fnor	%f4,	%f30,	%f28
	subc	%l6,	%l2,	%l1
	movle	%icc,	%g4,	%g6
	andncc	%o0,	%l4,	%i2
	stx	%o3,	[%l7 + 0x78]
	fmovsl	%xcc,	%f20,	%f16
	or	%l3,	0x116C,	%o6
	movrgez	%o4,	%g2,	%l0
	andncc	%i4,	%l5,	%g3
	ldd	[%l7 + 0x50],	%g6
	movrne	%o5,	0x009,	%i6
	pdist	%f26,	%f14,	%f14
	add	%o2,	0x1933,	%o1
	xnor	%i0,	%i1,	%g5
	sir	0x10E9
	udivx	%i5,	0x15D2,	%i3
	movrne	%g1,	%o7,	%i7
	movrlez	%l2,	0x015,	%l6
	edge16l	%g4,	%g6,	%o0
	mulx	%l1,	0x0ADC,	%i2
	ldd	[%l7 + 0x58],	%f24
	edge16ln	%o3,	%l3,	%o6
	xor	%o4,	%l4,	%l0
	edge16ln	%i4,	%l5,	%g2
	subcc	%g7,	0x0953,	%o5
	sra	%g3,	0x0E,	%o2
	stb	%i6,	[%l7 + 0x45]
	array16	%o1,	%i1,	%i0
	nop
	set	0x7F, %i6
	ldub	[%l7 + %i6],	%i5
	edge8ln	%g5,	%i3,	%o7
	restore %g1, %i7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f18,	%f0
	fmovspos	%xcc,	%f27,	%f1
	edge8n	%l6,	%g4,	%o0
	st	%f20,	[%l7 + 0x2C]
	popc	%g6,	%i2
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%o2
	movle	%xcc,	%l1,	%l3
	movrlz	%o6,	%o4,	%l4
	movre	%l0,	0x343,	%l5
	fmuld8sux16	%f31,	%f24,	%f18
	addcc	%g2,	%g7,	%i4
	addc	%o5,	0x1E5F,	%g3
	fmovdpos	%icc,	%f10,	%f14
	movneg	%icc,	%o2,	%o1
	fcmpgt16	%f20,	%f24,	%i6
	movvc	%xcc,	%i0,	%i1
	umul	%g5,	%i3,	%o7
	movneg	%icc,	%g1,	%i7
	fnors	%f19,	%f6,	%f19
	fmovsgu	%xcc,	%f30,	%f3
	edge8l	%i5,	%l2,	%g4
	movl	%xcc,	%o0,	%l6
	fcmpeq32	%f30,	%f28,	%g6
	addcc	%i2,	%l1,	%l3
	srlx	%o6,	0x10,	%o4
	udivcc	%l4,	0x0454,	%l0
	sll	%l5,	%g2,	%o3
	save %g7, %i4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%g3,	%o1
	fmovsvs	%xcc,	%f17,	%f0
	fmovsne	%icc,	%f5,	%f25
	movrlez	%i6,	0x135,	%o2
	udivx	%i1,	0x0C81,	%g5
	movcs	%xcc,	%i0,	%i3
	sdivcc	%o7,	0x1ECE,	%g1
	alignaddr	%i5,	%l2,	%i7
	ldd	[%l7 + 0x10],	%f12
	edge8	%o0,	%l6,	%g4
	array32	%g6,	%l1,	%i2
	udivcc	%o6,	0x0E80,	%l3
	movn	%xcc,	%o4,	%l4
	sth	%l0,	[%l7 + 0x3C]
	move	%icc,	%l5,	%o3
	fmovsn	%icc,	%f3,	%f2
	orcc	%g2,	%i4,	%o5
	movrlz	%g7,	%g3,	%o1
	mulx	%i6,	%i1,	%o2
	mova	%xcc,	%g5,	%i3
	sub	%i0,	%g1,	%o7
	alignaddr	%l2,	%i7,	%i5
	sll	%o0,	%l6,	%g4
	umul	%l1,	0x10F9,	%i2
	lduw	[%l7 + 0x28],	%o6
	smulcc	%l3,	%o4,	%l4
	fcmpes	%fcc0,	%f31,	%f16
	udivx	%l0,	0x1ADE,	%g6
	edge8l	%l5,	%o3,	%i4
	ldd	[%l7 + 0x20],	%g2
	edge32n	%g7,	%g3,	%o5
	ldd	[%l7 + 0x28],	%o0
	edge8ln	%i1,	%o2,	%i6
	fmovrsgez	%i3,	%f4,	%f6
	move	%xcc,	%i0,	%g5
	movn	%icc,	%g1,	%l2
	sdiv	%i7,	0x0490,	%o7
	stx	%i5,	[%l7 + 0x58]
	movg	%icc,	%o0,	%l6
	fmovscs	%icc,	%f19,	%f27
	umul	%l1,	%g4,	%o6
	fmovsne	%icc,	%f22,	%f21
	fmovsa	%icc,	%f8,	%f30
	umul	%i2,	0x18D7,	%l3
	fcmped	%fcc0,	%f0,	%f10
	alignaddrl	%o4,	%l0,	%l4
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	edge16l	%g2,	%o3,	%g7
	sethi	0x0C00,	%o5
	ldsb	[%l7 + 0x22],	%o1
	edge16n	%g3,	%o2,	%i1
	fornot2s	%f22,	%f30,	%f0
	movcc	%icc,	%i3,	%i6
	nop
	set	0x22, %i5
	ldsb	[%l7 + %i5],	%i0
	umulcc	%g5,	0x0C19,	%g1
	smulcc	%l2,	%o7,	%i5
	addccc	%o0,	0x0E86,	%i7
	std	%f30,	[%l7 + 0x40]
	fpsub16s	%f21,	%f21,	%f11
	fnot2s	%f23,	%f21
	popc	%l1,	%g4
	fones	%f18
	or	%l6,	0x1316,	%o6
	movrlez	%l3,	0x34D,	%o4
	mulscc	%i2,	%l0,	%g6
	addccc	%l5,	0x1AB5,	%i4
	save %l4, %g2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g7,	0x1353,	%o5
	edge8ln	%o1,	%g3,	%i1
	fcmped	%fcc0,	%f20,	%f10
	fcmpgt32	%f12,	%f6,	%o2
	ldsw	[%l7 + 0x0C],	%i6
	mova	%icc,	%i0,	%i3
	sra	%g1,	0x14,	%g5
	array32	%o7,	%i5,	%l2
	orncc	%o0,	0x0699,	%i7
	st	%f21,	[%l7 + 0x34]
	stx	%g4,	[%l7 + 0x68]
	orcc	%l1,	0x1223,	%o6
	fmovsle	%xcc,	%f24,	%f30
	subc	%l3,	0x0127,	%o4
	mova	%icc,	%l6,	%i2
	movrgz	%l0,	%l5,	%i4
	edge16	%g6,	%g2,	%l4
	fmovd	%f24,	%f6
	andcc	%g7,	%o3,	%o5
	movrne	%o1,	%g3,	%o2
	udivcc	%i6,	0x154A,	%i0
	ldsh	[%l7 + 0x58],	%i3
	alignaddrl	%g1,	%g5,	%i1
	fpsub32	%f8,	%f30,	%f12
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%f6
	ldd	[%l7 + 0x38],	%o6
	fnegd	%f28,	%f30
	fmovdg	%icc,	%f25,	%f26
	ldx	[%l7 + 0x50],	%i5
	edge16	%l2,	%i7,	%o0
	movre	%l1,	0x0E2,	%o6
	andcc	%l3,	%o4,	%l6
	stx	%g4,	[%l7 + 0x30]
	ldx	[%l7 + 0x40],	%i2
	fcmpgt16	%f24,	%f22,	%l0
	edge32l	%l5,	%g6,	%i4
	xnorcc	%l4,	0x0331,	%g7
	restore %o3, %g2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%g3,	%o2
	fmovdcc	%xcc,	%f28,	%f9
	sub	%i6,	0x071F,	%i0
	ldd	[%l7 + 0x40],	%f10
	lduh	[%l7 + 0x7A],	%o1
	nop
	set	0x7E, %g4
	lduh	[%l7 + %g4],	%g1
	fmovrsgez	%g5,	%f31,	%f4
	movpos	%xcc,	%i1,	%o7
	mova	%icc,	%i3,	%l2
	sll	%i7,	%i5,	%o0
	addc	%l1,	%o6,	%l3
	movvc	%icc,	%l6,	%o4
	movpos	%icc,	%g4,	%l0
	sub	%i2,	%g6,	%l5
	save %i4, %l4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g7,	0x0729,	%o5
	xor	%g3,	0x0B89,	%g2
	edge8l	%o2,	%i0,	%i6
	array32	%o1,	%g5,	%g1
	movg	%icc,	%o7,	%i3
	fnot2s	%f2,	%f26
	lduw	[%l7 + 0x3C],	%l2
	srax	%i7,	0x15,	%i5
	fnands	%f31,	%f19,	%f16
	smul	%i1,	%o0,	%o6
	andn	%l1,	%l6,	%o4
	fabsd	%f22,	%f22
	sdiv	%g4,	0x1E25,	%l3
	orncc	%l0,	0x00DC,	%g6
	lduh	[%l7 + 0x10],	%i2
	popc	%i4,	%l4
	edge16n	%l5,	%g7,	%o5
	fmovdpos	%xcc,	%f10,	%f12
	movrlez	%g3,	0x186,	%o3
	xnorcc	%g2,	0x075C,	%o2
	lduh	[%l7 + 0x6A],	%i6
	udivcc	%o1,	0x0353,	%i0
	edge32l	%g1,	%g5,	%o7
	subccc	%l2,	%i7,	%i3
	ldsh	[%l7 + 0x48],	%i1
	sll	%i5,	%o0,	%o6
	udiv	%l1,	0x1AF8,	%o4
	ldx	[%l7 + 0x68],	%g4
	sethi	0x07F3,	%l3
	movrgz	%l6,	%g6,	%i2
	movrgz	%i4,	%l0,	%l5
	sllx	%l4,	0x1E,	%o5
	edge8	%g7,	%g3,	%g2
	fpackfix	%f14,	%f21
	fmul8x16al	%f1,	%f1,	%f24
	fcmpeq32	%f12,	%f28,	%o3
	addcc	%i6,	0x1DB5,	%o1
	fnegd	%f20,	%f24
	alignaddrl	%i0,	%g1,	%g5
	fsrc2	%f26,	%f24
	movrlz	%o2,	%l2,	%o7
	movvs	%icc,	%i7,	%i1
	fors	%f11,	%f4,	%f2
	sll	%i3,	%i5,	%o0
	smul	%l1,	%o6,	%o4
	ldx	[%l7 + 0x58],	%l3
	udivcc	%l6,	0x056F,	%g6
	array32	%i2,	%g4,	%i4
	movcc	%icc,	%l5,	%l4
	movgu	%icc,	%o5,	%l0
	stx	%g7,	[%l7 + 0x20]
	popc	%g2,	%o3
	movl	%xcc,	%g3,	%o1
	fmovsa	%icc,	%f31,	%f7
	edge32	%i0,	%g1,	%i6
	fnot2s	%f31,	%f27
	andncc	%g5,	%l2,	%o7
	movvs	%icc,	%o2,	%i7
	movcs	%xcc,	%i1,	%i5
	edge8	%o0,	%l1,	%o6
	subc	%i3,	%o4,	%l3
	sra	%l6,	%i2,	%g4
	edge8n	%i4,	%l5,	%g6
	array16	%o5,	%l0,	%l4
	sub	%g2,	0x1754,	%o3
	fmovrslez	%g3,	%f0,	%f28
	fnand	%f22,	%f2,	%f8
	popc	0x0BEC,	%o1
	fmovsn	%xcc,	%f4,	%f22
	fmul8x16au	%f19,	%f20,	%f10
	sethi	0x1707,	%g7
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	fmovdg	%xcc,	%f24,	%f17
	fnot2s	%f2,	%f13
	fandnot1s	%f29,	%f5,	%f10
	stx	%l2,	[%l7 + 0x18]
	fmovdpos	%xcc,	%f30,	%f26
	fnot1s	%f28,	%f20
	fxor	%f16,	%f0,	%f0
	edge8n	%o7,	%o2,	%i7
	movle	%xcc,	%i0,	%i1
	edge16	%o0,	%l1,	%o6
	udivcc	%i3,	0x0AF5,	%i5
	fsrc1s	%f13,	%f3
	edge32ln	%l3,	%l6,	%i2
	nop
	set	0x60, %o3
	lduw	[%l7 + %o3],	%o4
	fmovsne	%icc,	%f28,	%f24
	movrgz	%i4,	%g4,	%g6
	fmovse	%xcc,	%f6,	%f3
	umulcc	%l5,	0x18D2,	%o5
	edge32ln	%l0,	%l4,	%g2
	andcc	%o3,	%g3,	%g7
	fmovrdgz	%o1,	%f22,	%f16
	edge16n	%i6,	%g1,	%g5
	umulcc	%l2,	%o2,	%i7
	stx	%i0,	[%l7 + 0x28]
	orn	%i1,	%o0,	%l1
	popc	0x1C33,	%o6
	andcc	%o7,	%i5,	%l3
	fandnot1	%f12,	%f10,	%f2
	sdiv	%i3,	0x000C,	%l6
	nop
	set	0x3C, %g5
	sth	%i2,	[%l7 + %g5]
	array32	%o4,	%i4,	%g4
	movvs	%xcc,	%l5,	%g6
	ld	[%l7 + 0x74],	%f31
	smul	%l0,	0x052F,	%l4
	addcc	%o5,	0x098F,	%g2
	st	%f16,	[%l7 + 0x2C]
	ldsw	[%l7 + 0x5C],	%o3
	andncc	%g7,	%g3,	%i6
	movgu	%icc,	%g1,	%o1
	stx	%l2,	[%l7 + 0x18]
	bshuffle	%f14,	%f26,	%f16
	edge16ln	%g5,	%i7,	%o2
	sllx	%i0,	%o0,	%i1
	fmovscc	%icc,	%f23,	%f13
	fmovrse	%l1,	%f3,	%f13
	sdivx	%o7,	0x1859,	%o6
	sllx	%i5,	%i3,	%l3
	edge16	%i2,	%o4,	%i4
	mulscc	%l6,	0x0C22,	%l5
	st	%f19,	[%l7 + 0x24]
	alignaddrl	%g6,	%g4,	%l4
	mulscc	%o5,	0x1BAF,	%l0
	ld	[%l7 + 0x0C],	%f8
	movn	%icc,	%g2,	%g7
	add	%o3,	%i6,	%g3
	movrgz	%g1,	0x0E2,	%l2
	movvc	%icc,	%g5,	%i7
	array32	%o1,	%i0,	%o0
	movrgez	%i1,	%l1,	%o7
	ldx	[%l7 + 0x58],	%o2
	fcmple16	%f28,	%f2,	%o6
	movl	%xcc,	%i5,	%l3
	srax	%i3,	%i2,	%i4
	orcc	%o4,	%l6,	%l5
	edge32ln	%g6,	%l4,	%o5
	popc	%g4,	%l0
	movre	%g2,	%o3,	%i6
	fnegs	%f25,	%f29
	mova	%icc,	%g7,	%g3
	edge8l	%g1,	%g5,	%l2
	movne	%xcc,	%i7,	%o1
	popc	%i0,	%o0
	fmovdl	%xcc,	%f27,	%f14
	umul	%i1,	%l1,	%o2
	movvs	%xcc,	%o7,	%i5
	ldd	[%l7 + 0x38],	%f26
	fmovdvc	%icc,	%f26,	%f26
	srax	%l3,	0x18,	%o6
	movneg	%icc,	%i2,	%i3
	movrlz	%o4,	%l6,	%l5
	movne	%xcc,	%i4,	%g6
	ldd	[%l7 + 0x58],	%f2
	sub	%l4,	0x16E6,	%o5
	movrlz	%l0,	0x305,	%g2
	movcs	%xcc,	%o3,	%i6
	xorcc	%g4,	%g3,	%g7
	stw	%g5,	[%l7 + 0x0C]
	stx	%g1,	[%l7 + 0x30]
	movl	%xcc,	%i7,	%l2
	srl	%i0,	%o1,	%i1
	fandnot1s	%f7,	%f9,	%f20
	mulx	%l1,	%o0,	%o2
	mova	%xcc,	%o7,	%i5
	mulx	%l3,	0x05FC,	%o6
	xnorcc	%i2,	0x03CC,	%o4
	fcmpd	%fcc1,	%f30,	%f20
	fxnor	%f6,	%f26,	%f20
	sdiv	%l6,	0x066B,	%i3
	subc	%i4,	0x0DB4,	%g6
	pdist	%f8,	%f22,	%f4
	ldd	[%l7 + 0x68],	%l4
	movvc	%icc,	%l4,	%o5
	addcc	%l0,	%g2,	%i6
	umul	%g4,	0x1259,	%g3
	fmovrdgez	%o3,	%f6,	%f22
	fabsd	%f10,	%f20
	fandnot1	%f14,	%f8,	%f18
	udivx	%g7,	0x02A2,	%g1
	array32	%i7,	%g5,	%l2
	fandnot1s	%f20,	%f2,	%f10
	save %o1, %i1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i0,	%o2,	%o7
	srax	%o0,	0x13,	%l3
	umulcc	%i5,	0x17FE,	%o6
	or	%i2,	0x1DE4,	%o4
	movleu	%xcc,	%l6,	%i3
	fmovd	%f8,	%f10
	ld	[%l7 + 0x74],	%f14
	movrne	%g6,	0x1C4,	%i4
	umulcc	%l4,	0x1873,	%l5
	fmovsn	%icc,	%f20,	%f0
	edge32l	%l0,	%g2,	%i6
	fmovdcc	%icc,	%f14,	%f29
	fornot2	%f14,	%f4,	%f2
	movne	%xcc,	%g4,	%g3
	edge16ln	%o3,	%o5,	%g1
	edge8n	%g7,	%i7,	%g5
	sub	%l2,	0x0A23,	%o1
	fmovsvc	%icc,	%f5,	%f16
	stw	%l1,	[%l7 + 0x78]
	fmovdleu	%icc,	%f2,	%f22
	ldx	[%l7 + 0x28],	%i1
	smul	%o2,	%o7,	%i0
	fmul8x16au	%f22,	%f0,	%f22
	sra	%o0,	%i5,	%o6
	movcc	%xcc,	%l3,	%i2
	fmovdleu	%xcc,	%f7,	%f11
	mulx	%o4,	0x1100,	%l6
	movpos	%xcc,	%i3,	%g6
	movvc	%xcc,	%l4,	%l5
	fmuld8ulx16	%f5,	%f26,	%f30
	fcmpes	%fcc0,	%f7,	%f14
	fnot2	%f6,	%f12
	ldsh	[%l7 + 0x32],	%i4
	movre	%l0,	0x146,	%i6
	fmul8ulx16	%f6,	%f6,	%f8
	fand	%f12,	%f22,	%f14
	move	%icc,	%g2,	%g4
	ldsw	[%l7 + 0x0C],	%o3
	fnors	%f27,	%f11,	%f23
	movrgez	%g3,	%g1,	%o5
	xor	%i7,	%g7,	%l2
	sllx	%o1,	%l1,	%g5
	ldsh	[%l7 + 0x4C],	%o2
	xnorcc	%o7,	0x1C0B,	%i1
	movle	%icc,	%o0,	%i5
	lduh	[%l7 + 0x38],	%o6
	xnor	%i0,	0x1B39,	%i2
	orcc	%o4,	0x1316,	%l6
	udivcc	%i3,	0x1C2B,	%g6
	ldsb	[%l7 + 0x5B],	%l4
	addccc	%l3,	%l5,	%l0
	movcs	%xcc,	%i4,	%g2
	addc	%g4,	%i6,	%g3
	fornot1s	%f18,	%f4,	%f31
	movne	%xcc,	%g1,	%o3
	addc	%o5,	%i7,	%g7
	or	%l2,	0x09D2,	%o1
	edge32l	%l1,	%o2,	%o7
	srax	%i1,	%o0,	%g5
	restore %i5, 0x0EEC, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i2,	%i0,	%o4
	edge32l	%l6,	%i3,	%g6
	fpackfix	%f0,	%f26
	ldd	[%l7 + 0x58],	%l4
	edge8l	%l3,	%l5,	%i4
	srlx	%l0,	%g4,	%g2
	sdiv	%g3,	0x1E1A,	%i6
	sdivx	%o3,	0x0714,	%o5
	nop
	set	0x3F, %g3
	ldub	[%l7 + %g3],	%g1
	movgu	%icc,	%i7,	%l2
	sethi	0x0BFC,	%o1
	smulcc	%l1,	%o2,	%g7
	fmuld8ulx16	%f13,	%f12,	%f22
	lduh	[%l7 + 0x32],	%o7
	movgu	%xcc,	%i1,	%g5
	array32	%o0,	%o6,	%i5
	movcc	%icc,	%i0,	%i2
	movg	%icc,	%l6,	%i3
	andncc	%g6,	%l4,	%o4
	or	%l5,	0x0AF8,	%i4
	movgu	%icc,	%l3,	%l0
	sdivcc	%g2,	0x1F9B,	%g3
	subc	%g4,	%o3,	%o5
	edge16l	%g1,	%i7,	%l2
	smulcc	%i6,	%l1,	%o2
	xnorcc	%g7,	0x1103,	%o7
	fmovdvs	%xcc,	%f9,	%f30
	fxors	%f11,	%f6,	%f28
	fnot2	%f30,	%f12
	movrgz	%i1,	%o1,	%g5
	orn	%o0,	%i5,	%o6
	movle	%icc,	%i2,	%l6
	udiv	%i3,	0x0E14,	%i0
	mova	%icc,	%l4,	%o4
	fmovsne	%icc,	%f6,	%f25
	fornot2	%f8,	%f26,	%f14
	edge32	%l5,	%g6,	%l3
	alignaddrl	%i4,	%g2,	%g3
	umul	%g4,	0x0049,	%l0
	edge16	%o3,	%g1,	%o5
	orncc	%l2,	%i6,	%i7
	edge8ln	%o2,	%l1,	%o7
	smul	%i1,	%o1,	%g5
	fmul8x16al	%f5,	%f20,	%f0
	fandnot1s	%f0,	%f26,	%f25
	fmovdleu	%icc,	%f26,	%f2
	fpadd32	%f20,	%f6,	%f30
	xnor	%o0,	%g7,	%i5
	bshuffle	%f0,	%f20,	%f6
	edge8n	%i2,	%l6,	%o6
	lduw	[%l7 + 0x44],	%i3
	movleu	%xcc,	%i0,	%l4
	fcmpgt16	%f0,	%f28,	%o4
	movneg	%icc,	%g6,	%l3
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	fxnor	%f26,	%f30,	%f30
	xorcc	%i4,	0x0F8C,	%g4
	addcc	%g3,	0x0164,	%o3
	fmovdcs	%xcc,	%f9,	%f24
	fmul8x16au	%f14,	%f9,	%f10
	lduh	[%l7 + 0x7E],	%l0
	fpackfix	%f0,	%f0
	movge	%xcc,	%o5,	%g1
	save %l2, %i6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i7,	[%l7 + 0x61]
	fpsub32s	%f31,	%f12,	%f8
	alignaddr	%l1,	%o7,	%i1
	fnot2	%f12,	%f8
	fmovrdne	%g5,	%f0,	%f22
	subc	%o0,	%o1,	%i5
	fmovsn	%icc,	%f29,	%f20
	fornot1	%f22,	%f14,	%f16
	nop
	set	0x08, %i3
	sth	%i2,	[%l7 + %i3]
	ldub	[%l7 + 0x26],	%g7
	restore %l6, %i3, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%l4,	%o4
	for	%f10,	%f4,	%f18
	subcc	%o6,	%l3,	%l5
	movgu	%icc,	%g6,	%i4
	subc	%g4,	%g2,	%o3
	fmovse	%icc,	%f17,	%f26
	movcc	%icc,	%g3,	%l0
	movrgz	%g1,	0x046,	%o5
	umul	%l2,	0x061B,	%i6
	fnands	%f10,	%f5,	%f10
	movrne	%i7,	%l1,	%o2
	fandnot2s	%f16,	%f4,	%f2
	movne	%xcc,	%i1,	%g5
	mulx	%o0,	0x09A7,	%o1
	sra	%o7,	0x00,	%i2
	nop
	set	0x67, %g1
	stb	%g7,	[%l7 + %g1]
	ldub	[%l7 + 0x57],	%l6
	alignaddrl	%i5,	%i3,	%l4
	alignaddrl	%o4,	%o6,	%i0
	fsrc1	%f4,	%f0
	fmovrdgez	%l5,	%f24,	%f26
	fmovse	%xcc,	%f23,	%f13
	fmovda	%xcc,	%f13,	%f19
	mulx	%l3,	0x1268,	%i4
	movne	%xcc,	%g6,	%g2
	udiv	%o3,	0x0C5C,	%g3
	edge32	%g4,	%l0,	%g1
	popc	%o5,	%l2
	orcc	%i7,	0x0EA7,	%l1
	edge8n	%o2,	%i6,	%g5
	xor	%i1,	%o0,	%o1
	andcc	%o7,	%g7,	%l6
	edge8	%i2,	%i3,	%l4
	fpmerge	%f28,	%f13,	%f22
	edge8ln	%o4,	%o6,	%i0
	ldsw	[%l7 + 0x60],	%l5
	fexpand	%f18,	%f20
	addc	%l3,	%i4,	%i5
	fornot1s	%f21,	%f10,	%f25
	add	%g6,	0x0539,	%o3
	edge16l	%g2,	%g4,	%g3
	movneg	%xcc,	%g1,	%l0
	movle	%icc,	%o5,	%i7
	fmul8sux16	%f24,	%f6,	%f10
	srl	%l2,	0x09,	%l1
	ldd	[%l7 + 0x68],	%i6
	srl	%g5,	%o2,	%o0
	subcc	%i1,	%o1,	%g7
	xorcc	%o7,	%l6,	%i3
	or	%i2,	%o4,	%l4
	orncc	%i0,	0x194B,	%o6
	add	%l5,	0x1576,	%l3
	movvc	%xcc,	%i5,	%g6
	fnegs	%f9,	%f3
	array32	%i4,	%g2,	%o3
	udivx	%g3,	0x0491,	%g4
	movrgz	%g1,	%l0,	%o5
	movrlez	%i7,	0x3EE,	%l1
	and	%l2,	%i6,	%g5
	edge32	%o0,	%o2,	%o1
	mulx	%g7,	%o7,	%l6
	array32	%i1,	%i2,	%o4
	fandnot1s	%f16,	%f8,	%f29
	movvs	%icc,	%l4,	%i0
	ldd	[%l7 + 0x60],	%i2
	umulcc	%o6,	0x0EDC,	%l5
	ldub	[%l7 + 0x14],	%i5
	movn	%icc,	%l3,	%g6
	and	%i4,	0x1EC6,	%o3
	movne	%xcc,	%g2,	%g4
	movne	%xcc,	%g1,	%l0
	sir	0x1EF3
	edge32l	%o5,	%i7,	%l1
	fcmpd	%fcc3,	%f28,	%f30
	subc	%g3,	%i6,	%l2
	fcmpeq32	%f24,	%f20,	%g5
	stb	%o0,	[%l7 + 0x33]
	movle	%xcc,	%o1,	%o2
	sdivcc	%o7,	0x1DB3,	%g7
	edge16l	%i1,	%i2,	%l6
	fsrc2s	%f9,	%f11
	movrlz	%l4,	0x2A0,	%i0
	ld	[%l7 + 0x34],	%f27
	xorcc	%i3,	0x1935,	%o6
	sethi	0x12BB,	%l5
	andncc	%i5,	%l3,	%o4
	fmovrdgz	%g6,	%f4,	%f14
	movrlz	%o3,	0x028,	%i4
	edge8l	%g4,	%g1,	%g2
	fcmpes	%fcc1,	%f22,	%f2
	nop
	set	0x76, %i4
	ldsh	[%l7 + %i4],	%l0
	movvc	%xcc,	%o5,	%i7
	move	%xcc,	%g3,	%i6
	fpackfix	%f8,	%f15
	array8	%l1,	%g5,	%l2
	movneg	%xcc,	%o1,	%o0
	alignaddr	%o7,	%g7,	%i1
	sra	%o2,	%i2,	%l6
	movgu	%xcc,	%i0,	%i3
	sth	%l4,	[%l7 + 0x5C]
	edge8l	%l5,	%i5,	%o6
	movpos	%xcc,	%o4,	%l3
	mova	%xcc,	%g6,	%i4
	edge32n	%o3,	%g1,	%g4
	edge32l	%l0,	%o5,	%i7
	fpsub32	%f4,	%f26,	%f14
	edge16l	%g2,	%i6,	%l1
	andn	%g5,	%l2,	%g3
	array16	%o1,	%o7,	%g7
	fmul8x16al	%f5,	%f6,	%f6
	sdivcc	%i1,	0x08CB,	%o0
	movcc	%icc,	%i2,	%o2
	ldsb	[%l7 + 0x0E],	%l6
	orncc	%i0,	0x1C29,	%i3
	movg	%xcc,	%l5,	%l4
	sdivx	%o6,	0x1939,	%i5
	edge32ln	%l3,	%g6,	%o4
	fpack16	%f14,	%f28
	fcmple32	%f28,	%f22,	%o3
	ld	[%l7 + 0x14],	%f13
	srlx	%g1,	0x17,	%i4
	subc	%l0,	0x0572,	%g4
	addcc	%i7,	0x1FE2,	%o5
	siam	0x6
	sdivx	%i6,	0x09C2,	%g2
	ldd	[%l7 + 0x10],	%l0
	udivx	%l2,	0x0ACF,	%g5
	srl	%g3,	%o7,	%g7
	edge32n	%i1,	%o0,	%o1
	fpadd32	%f10,	%f8,	%f26
	xorcc	%i2,	0x1F2D,	%o2
	movle	%icc,	%i0,	%l6
	fmovda	%xcc,	%f16,	%f24
	edge8	%l5,	%i3,	%o6
	movge	%icc,	%l4,	%i5
	fmovse	%icc,	%f1,	%f19
	sethi	0x01BC,	%g6
	movn	%icc,	%l3,	%o3
	xorcc	%g1,	%o4,	%i4
	ldsw	[%l7 + 0x5C],	%l0
	alignaddr	%i7,	%g4,	%o5
	fpack16	%f12,	%f3
	movcs	%xcc,	%g2,	%i6
	udivx	%l2,	0x13F1,	%g5
	udiv	%g3,	0x0BBF,	%o7
	andcc	%g7,	%i1,	%l1
	umulcc	%o1,	%i2,	%o2
	srlx	%i0,	0x1F,	%o0
	fmovdge	%icc,	%f17,	%f26
	edge16n	%l5,	%i3,	%l6
	sub	%o6,	%i5,	%g6
	ldsw	[%l7 + 0x74],	%l3
	fnegd	%f12,	%f26
	subccc	%l4,	%g1,	%o3
	edge32l	%o4,	%l0,	%i4
	array8	%i7,	%o5,	%g4
	fcmpd	%fcc2,	%f28,	%f6
	add	%i6,	0x00AC,	%l2
	sethi	0x1F27,	%g5
	save %g2, %g3, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f27,	%f16
	alignaddrl	%i1,	%l1,	%o1
	array8	%i2,	%g7,	%o2
	mulx	%i0,	%o0,	%l5
	movneg	%icc,	%l6,	%o6
	ld	[%l7 + 0x24],	%f1
	ld	[%l7 + 0x48],	%f13
	edge32ln	%i5,	%g6,	%l3
	mova	%icc,	%i3,	%l4
	std	%f4,	[%l7 + 0x60]
	stx	%o3,	[%l7 + 0x78]
	movl	%icc,	%o4,	%g1
	andcc	%i4,	0x0E05,	%i7
	addcc	%o5,	%l0,	%i6
	sdivcc	%g4,	0x1FA9,	%g5
	addc	%l2,	0x096A,	%g2
	sub	%g3,	%o7,	%l1
	andncc	%o1,	%i2,	%g7
	lduh	[%l7 + 0x2E],	%o2
	sdivcc	%i1,	0x1815,	%i0
	mulx	%l5,	0x0712,	%l6
	alignaddr	%o6,	%i5,	%g6
	movg	%icc,	%o0,	%l3
	movvc	%xcc,	%i3,	%l4
	fpsub32	%f0,	%f2,	%f12
	sth	%o3,	[%l7 + 0x60]
	udiv	%g1,	0x1B65,	%o4
	smul	%i4,	0x09B8,	%i7
	movcs	%xcc,	%o5,	%l0
	orcc	%i6,	0x0EAF,	%g5
	fmovsne	%xcc,	%f19,	%f16
	fmovdn	%xcc,	%f29,	%f19
	xorcc	%g4,	0x13F2,	%g2
	or	%l2,	0x1849,	%o7
	stx	%l1,	[%l7 + 0x70]
	srlx	%o1,	0x1C,	%g3
	sethi	0x00A3,	%i2
	add	%o2,	0x11F5,	%g7
	move	%icc,	%i1,	%i0
	std	%f20,	[%l7 + 0x10]
	mova	%xcc,	%l5,	%l6
	movn	%xcc,	%o6,	%g6
	udiv	%i5,	0x1B3C,	%o0
	movcc	%xcc,	%l3,	%i3
	nop
	set	0x60, %i1
	stx	%o3,	[%l7 + %i1]
	stx	%g1,	[%l7 + 0x78]
	xorcc	%l4,	%o4,	%i4
	fxor	%f14,	%f20,	%f22
	addc	%i7,	0x001A,	%o5
	alignaddrl	%l0,	%i6,	%g4
	ldx	[%l7 + 0x40],	%g2
	array16	%l2,	%o7,	%g5
	fmovdle	%icc,	%f15,	%f19
	umulcc	%o1,	0x11BF,	%l1
	xnor	%g3,	%o2,	%g7
	udivcc	%i1,	0x16F0,	%i0
	sll	%i2,	0x0A,	%l6
	movl	%xcc,	%o6,	%g6
	sllx	%i5,	0x18,	%l5
	andn	%l3,	0x046F,	%i3
	lduh	[%l7 + 0x24],	%o3
	addcc	%o0,	%l4,	%o4
	sub	%i4,	0x19D4,	%g1
	movg	%xcc,	%i7,	%l0
	fnot2	%f30,	%f8
	fmovscs	%icc,	%f10,	%f6
	fnands	%f17,	%f6,	%f4
	st	%f6,	[%l7 + 0x64]
	fnot2s	%f15,	%f15
	mulscc	%o5,	0x1D1D,	%g4
	movne	%icc,	%i6,	%l2
	srlx	%o7,	%g2,	%o1
	fornot2	%f2,	%f22,	%f16
	array32	%l1,	%g5,	%g3
	sra	%g7,	%i1,	%o2
	std	%f22,	[%l7 + 0x40]
	nop
	set	0x2C, %o2
	stw	%i0,	[%l7 + %o2]
	udivcc	%i2,	0x15C2,	%o6
	andn	%l6,	0x198B,	%g6
	movvc	%icc,	%l5,	%l3
	fpadd16	%f22,	%f14,	%f20
	edge32l	%i3,	%i5,	%o3
	ldsw	[%l7 + 0x1C],	%l4
	movrgz	%o4,	%i4,	%o0
	orncc	%i7,	%l0,	%o5
	movcc	%xcc,	%g4,	%i6
	orncc	%g1,	%o7,	%l2
	move	%icc,	%o1,	%g2
	movrgez	%l1,	0x247,	%g5
	sethi	0x0193,	%g3
	edge8	%g7,	%i1,	%o2
	mova	%xcc,	%i2,	%i0
	sllx	%l6,	%g6,	%o6
	sra	%l3,	%l5,	%i5
	sll	%i3,	%o3,	%l4
	orncc	%i4,	0x0F49,	%o4
	sdivx	%i7,	0x0B37,	%o0
	edge32l	%o5,	%l0,	%g4
	lduh	[%l7 + 0x1E],	%i6
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	array8	%g1,	%g2,	%l1
	sdivcc	%g3,	0x14D3,	%g5
	st	%f14,	[%l7 + 0x30]
	alignaddrl	%i1,	%o2,	%g7
	fpsub16	%f8,	%f12,	%f26
	fsrc1	%f24,	%f26
	fmovdl	%xcc,	%f8,	%f14
	restore %i2, 0x0395, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x08, %l4
	std	%f18,	[%l7 + %l4]
	ldsh	[%l7 + 0x18],	%g6
	orn	%o6,	0x1B7B,	%l3
	fornot1s	%f0,	%f15,	%f25
	ldx	[%l7 + 0x48],	%l5
	movn	%xcc,	%l6,	%i5
	array8	%o3,	%l4,	%i3
	ldsw	[%l7 + 0x7C],	%i4
	movpos	%xcc,	%i7,	%o4
	subcc	%o5,	%o0,	%l0
	addccc	%g4,	0x107D,	%o7
	movne	%icc,	%l2,	%i6
	array16	%g1,	%o1,	%l1
	alignaddrl	%g2,	%g3,	%i1
	fmovsneg	%icc,	%f27,	%f30
	mova	%xcc,	%g5,	%o2
	array16	%i2,	%i0,	%g7
	ldx	[%l7 + 0x08],	%g6
	movrlz	%l3,	0x10D,	%l5
	fmovdg	%xcc,	%f10,	%f22
	movrgez	%o6,	%l6,	%i5
	lduw	[%l7 + 0x10],	%o3
	std	%f24,	[%l7 + 0x50]
	ldd	[%l7 + 0x08],	%f24
	fmovsl	%xcc,	%f14,	%f12
	movge	%icc,	%i3,	%i4
	udiv	%l4,	0x188A,	%i7
	orcc	%o5,	%o0,	%o4
	subcc	%l0,	%o7,	%g4
	fxnor	%f6,	%f6,	%f16
	ld	[%l7 + 0x30],	%f11
	ldd	[%l7 + 0x50],	%l2
	fcmpgt32	%f18,	%f8,	%i6
	mulx	%g1,	0x0E94,	%l1
	movrgz	%o1,	0x1FB,	%g2
	edge8	%i1,	%g3,	%o2
	fnegd	%f18,	%f6
	fmovrsne	%i2,	%f16,	%f18
	movrlz	%g5,	0x012,	%i0
	movneg	%icc,	%g7,	%g6
	addccc	%l3,	0x069E,	%o6
	andcc	%l6,	%i5,	%o3
	fmuld8sux16	%f27,	%f18,	%f24
	movg	%icc,	%i3,	%l5
	edge8l	%l4,	%i7,	%i4
	movge	%xcc,	%o5,	%o4
	add	%o0,	0x1B38,	%o7
	fcmped	%fcc2,	%f2,	%f20
	subccc	%g4,	0x0D4A,	%l2
	fmovrdlz	%l0,	%f12,	%f14
	udiv	%g1,	0x041B,	%i6
	ldsw	[%l7 + 0x14],	%l1
	fornot1	%f24,	%f2,	%f4
	sethi	0x04C1,	%o1
	fmovsl	%icc,	%f0,	%f13
	edge32n	%i1,	%g3,	%o2
	or	%i2,	%g5,	%i0
	movcc	%xcc,	%g2,	%g6
	sll	%g7,	%l3,	%o6
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	srax	%i5,	%l5,	%i3
	movvc	%xcc,	%i7,	%l4
	ldd	[%l7 + 0x70],	%f30
	fxnors	%f30,	%f4,	%f17
	ldd	[%l7 + 0x60],	%i4
	std	%f30,	[%l7 + 0x08]
	fmovdneg	%xcc,	%f13,	%f20
	ldsh	[%l7 + 0x7E],	%o5
	subcc	%o4,	0x02E8,	%o0
	edge16	%o7,	%l2,	%g4
	fmovsge	%icc,	%f9,	%f16
	array16	%l0,	%g1,	%l1
	restore %i6, %i1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o2,	%i2,	%o1
	mulscc	%g5,	%g2,	%g6
	addccc	%g7,	%l3,	%o6
	lduw	[%l7 + 0x74],	%l6
	sethi	0x033A,	%i0
	edge16ln	%o3,	%i5,	%l5
	sth	%i3,	[%l7 + 0x20]
	nop
	set	0x20, %g2
	std	%f0,	[%l7 + %g2]
	andcc	%l4,	0x1353,	%i4
	xor	%i7,	%o4,	%o5
	mulscc	%o7,	0x07DD,	%l2
	orcc	%o0,	0x0F0D,	%l0
	sll	%g1,	%g4,	%i6
	movrlez	%i1,	%g3,	%o2
	movrlz	%i2,	%l1,	%g5
	movg	%icc,	%o1,	%g2
	fpadd32	%f0,	%f18,	%f26
	mulx	%g6,	0x0A66,	%g7
	sll	%l3,	%l6,	%i0
	sir	0x088C
	movrgez	%o6,	%i5,	%l5
	srl	%i3,	0x0B,	%o3
	edge32	%l4,	%i7,	%o4
	ldx	[%l7 + 0x10],	%i4
	fmovdleu	%icc,	%f1,	%f2
	fmovse	%icc,	%f12,	%f10
	save %o7, 0x1F3E, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l2,	%l0,	%g1
	movge	%xcc,	%g4,	%o0
	fxnors	%f17,	%f14,	%f1
	array32	%i6,	%i1,	%o2
	fand	%f2,	%f22,	%f20
	ldx	[%l7 + 0x68],	%g3
	fmovse	%icc,	%f1,	%f22
	orncc	%l1,	0x0975,	%i2
	fsrc1s	%f9,	%f3
	ldd	[%l7 + 0x30],	%g4
	fmovdne	%xcc,	%f7,	%f23
	movne	%icc,	%o1,	%g6
	nop
	set	0x77, %i0
	ldub	[%l7 + %i0],	%g7
	addccc	%g2,	0x104E,	%l3
	edge32	%i0,	%o6,	%l6
	udiv	%l5,	0x0633,	%i5
	movg	%icc,	%i3,	%l4
	add	%o3,	0x1E7E,	%o4
	udiv	%i4,	0x0003,	%o7
	movpos	%xcc,	%o5,	%l2
	addcc	%i7,	%l0,	%g4
	or	%g1,	%o0,	%i1
	fnand	%f8,	%f22,	%f18
	mulx	%i6,	%g3,	%o2
	orn	%l1,	0x0BC0,	%i2
	ldsb	[%l7 + 0x6D],	%o1
	fmul8sux16	%f16,	%f18,	%f2
	mova	%icc,	%g5,	%g6
	xnorcc	%g7,	%g2,	%l3
	fmovs	%f9,	%f25
	orcc	%i0,	0x1E0F,	%o6
	array8	%l5,	%i5,	%i3
	andn	%l4,	0x1553,	%o3
	edge32	%l6,	%o4,	%i4
	edge8n	%o7,	%l2,	%o5
	ldsb	[%l7 + 0x4B],	%l0
	andn	%g4,	0x01C0,	%g1
	array32	%o0,	%i1,	%i6
	movle	%xcc,	%g3,	%o2
	smul	%l1,	0x17E6,	%i2
	srlx	%o1,	%i7,	%g5
	nop
	set	0x1A, %g7
	ldub	[%l7 + %g7],	%g7
	smulcc	%g6,	0x0FF1,	%g2
	edge16ln	%l3,	%i0,	%o6
	srax	%i5,	0x14,	%i3
	edge8n	%l4,	%o3,	%l5
	mulscc	%o4,	0x0D8D,	%l6
	srax	%o7,	0x18,	%i4
	fmul8x16au	%f30,	%f29,	%f10
	movrlz	%o5,	%l0,	%l2
	fnegs	%f29,	%f9
	move	%icc,	%g4,	%g1
	ldsb	[%l7 + 0x2D],	%i1
	edge16n	%i6,	%o0,	%o2
	array8	%l1,	%i2,	%o1
	fcmpd	%fcc1,	%f0,	%f24
	movge	%xcc,	%g3,	%i7
	edge32l	%g7,	%g6,	%g5
	edge16ln	%g2,	%l3,	%i0
	fmovdcs	%icc,	%f19,	%f26
	movleu	%icc,	%o6,	%i3
	edge8l	%l4,	%i5,	%o3
	fmovrslez	%l5,	%f3,	%f15
	ldub	[%l7 + 0x35],	%o4
	fpadd16s	%f2,	%f1,	%f1
	array16	%l6,	%o7,	%i4
	ld	[%l7 + 0x2C],	%f18
	movle	%xcc,	%l0,	%o5
	array32	%l2,	%g4,	%g1
	stb	%i6,	[%l7 + 0x7F]
	ldd	[%l7 + 0x18],	%f6
	movn	%xcc,	%o0,	%i1
	subccc	%o2,	0x0ABE,	%i2
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	alignaddrl	%g7,	%g6,	%g5
	andn	%l1,	%l3,	%i0
	edge32	%o6,	%g2,	%i3
	xnorcc	%i5,	%o3,	%l5
	xnorcc	%l4,	0x05E1,	%l6
	movg	%xcc,	%o7,	%i4
	xnorcc	%l0,	0x1452,	%o5
	fpsub32s	%f28,	%f30,	%f8
	fmovdne	%icc,	%f11,	%f15
	sir	0x180C
	orncc	%o4,	0x1AB3,	%l2
	fmovsne	%xcc,	%f18,	%f30
	fmovsg	%xcc,	%f2,	%f30
	fmovd	%f16,	%f2
	sub	%g1,	%i6,	%o0
	orncc	%g4,	%i1,	%o2
	save %o1, %g3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f13,	%f6
	addccc	%i7,	%g7,	%g6
	mova	%xcc,	%l1,	%l3
	edge16ln	%i0,	%o6,	%g2
	sir	0x0C5C
	movrlz	%i3,	%i5,	%o3
	srlx	%l5,	0x01,	%l4
	edge8l	%l6,	%o7,	%g5
	array32	%i4,	%l0,	%o5
	andn	%l2,	0x0CC5,	%o4
	movpos	%xcc,	%g1,	%i6
	fnegd	%f0,	%f2
	fornot2s	%f21,	%f7,	%f27
	andcc	%o0,	%g4,	%i1
	edge8	%o1,	%g3,	%o2
	edge16	%i2,	%g7,	%g6
	fzero	%f10
	ld	[%l7 + 0x1C],	%f24
	movn	%icc,	%i7,	%l3
	fmovdvc	%icc,	%f15,	%f24
	array16	%i0,	%o6,	%l1
	fexpand	%f4,	%f26
	fmovdneg	%icc,	%f16,	%f24
	fmovsgu	%xcc,	%f29,	%f8
	alignaddr	%i3,	%g2,	%i5
	movgu	%xcc,	%o3,	%l5
	ldub	[%l7 + 0x5C],	%l6
	edge32l	%o7,	%l4,	%g5
	fmovrdne	%l0,	%f0,	%f10
	sub	%o5,	%i4,	%l2
	fmovscc	%icc,	%f23,	%f2
	movrne	%o4,	%g1,	%i6
	edge8	%g4,	%o0,	%o1
	umulcc	%g3,	0x02E3,	%o2
	sir	0x0237
	alignaddrl	%i2,	%g7,	%i1
	addcc	%i7,	%g6,	%i0
	edge32	%l3,	%l1,	%o6
	move	%icc,	%g2,	%i3
	movneg	%xcc,	%i5,	%o3
	edge32n	%l6,	%o7,	%l5
	movne	%xcc,	%g5,	%l4
	edge8ln	%l0,	%i4,	%o5
	fsrc2s	%f24,	%f30
	edge32ln	%l2,	%g1,	%o4
	std	%f12,	[%l7 + 0x60]
	sub	%i6,	%g4,	%o1
	fcmpes	%fcc1,	%f13,	%f8
	sethi	0x14AD,	%g3
	sdivcc	%o0,	0x1F4E,	%o2
	ldsw	[%l7 + 0x7C],	%i2
	stx	%g7,	[%l7 + 0x08]
	udiv	%i7,	0x153D,	%i1
	stw	%g6,	[%l7 + 0x70]
	stw	%i0,	[%l7 + 0x4C]
	fmovsle	%icc,	%f20,	%f20
	fmovrsgz	%l1,	%f20,	%f7
	xor	%l3,	%o6,	%i3
	fmovrsgez	%g2,	%f30,	%f9
	fandnot2s	%f7,	%f20,	%f25
	sdiv	%i5,	0x0629,	%l6
	nop
	set	0x1E, %g6
	lduh	[%l7 + %g6],	%o7
	addccc	%l5,	%g5,	%l4
	edge32l	%l0,	%o3,	%i4
	fmovsl	%xcc,	%f26,	%f12
	ldd	[%l7 + 0x50],	%f22
	fnand	%f4,	%f8,	%f0
	orncc	%o5,	0x0DCF,	%g1
	fmovda	%icc,	%f9,	%f15
	sra	%o4,	%l2,	%g4
	lduw	[%l7 + 0x0C],	%i6
	alignaddrl	%g3,	%o1,	%o0
	subc	%i2,	%o2,	%g7
	edge32n	%i7,	%g6,	%i1
	addc	%i0,	0x1DDF,	%l1
	udivx	%l3,	0x001E,	%o6
	save %i3, 0x062B, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g2,	%l6,	%l5
	sdivcc	%g5,	0x0A64,	%o7
	movre	%l0,	%l4,	%o3
	fmovdcs	%xcc,	%f11,	%f17
	sra	%o5,	0x0D,	%g1
	umul	%i4,	0x1F83,	%l2
	ldx	[%l7 + 0x40],	%g4
	subccc	%i6,	%o4,	%g3
	edge8n	%o1,	%i2,	%o2
	andn	%g7,	0x116E,	%i7
	movne	%icc,	%o0,	%g6
	stb	%i0,	[%l7 + 0x7F]
	edge16n	%l1,	%i1,	%l3
	edge8n	%o6,	%i3,	%g2
	sra	%i5,	%l6,	%l5
	edge32n	%o7,	%g5,	%l4
	and	%o3,	0x1EED,	%l0
	save %g1, %o5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g4,	%l2,	%o4
	fpackfix	%f12,	%f20
	siam	0x1
	addcc	%g3,	%i6,	%o1
	fmovsvs	%icc,	%f16,	%f27
	fnot1	%f24,	%f22
	sub	%o2,	0x1219,	%i2
	xor	%i7,	0x0B59,	%o0
	fmovrse	%g6,	%f14,	%f14
	umulcc	%i0,	%l1,	%g7
	add	%i1,	%l3,	%o6
	edge16ln	%i3,	%g2,	%l6
	fxor	%f8,	%f18,	%f18
	orcc	%i5,	%l5,	%g5
	sdiv	%l4,	0x0611,	%o3
	udiv	%o7,	0x113B,	%l0
	udivcc	%g1,	0x106E,	%o5
	movgu	%xcc,	%i4,	%l2
	fmovdn	%xcc,	%f13,	%f7
	umulcc	%g4,	%g3,	%i6
	sir	0x00C0
	umulcc	%o4,	%o2,	%i2
	udiv	%o1,	0x0F86,	%o0
	movg	%xcc,	%i7,	%i0
	edge8ln	%l1,	%g6,	%g7
	array32	%i1,	%l3,	%i3
	edge8l	%g2,	%l6,	%o6
	restore %l5, 0x18B9, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	subccc	%o7,	%o3,	%l0
	fmovdvc	%icc,	%f30,	%f4
	movre	%g1,	0x1E1,	%o5
	srlx	%i4,	0x16,	%g4
	fmovdn	%icc,	%f28,	%f1
	alignaddrl	%l2,	%g3,	%i6
	ldd	[%l7 + 0x30],	%o2
	sdiv	%o4,	0x14D7,	%i2
	srax	%o0,	0x08,	%i7
	addcc	%o1,	0x0C32,	%l1
	movneg	%xcc,	%g6,	%g7
	fmul8x16	%f28,	%f12,	%f2
	stw	%i0,	[%l7 + 0x60]
	restore %i1, %l3, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l6,	0x085F,	%i3
	mulscc	%o6,	%i5,	%l5
	save %l4, 0x111A, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o3,	0x07EB,	%l0
	ldsw	[%l7 + 0x68],	%g1
	sra	%o5,	0x05,	%o7
	edge32	%i4,	%g4,	%l2
	movl	%icc,	%i6,	%g3
	sth	%o2,	[%l7 + 0x16]
	subcc	%o4,	0x01FA,	%o0
	fcmps	%fcc2,	%f26,	%f11
	alignaddr	%i2,	%i7,	%l1
	sllx	%g6,	0x11,	%g7
	orncc	%o1,	%i1,	%l3
	edge16	%g2,	%l6,	%i3
	orn	%o6,	0x1D90,	%i5
	smul	%l5,	%i0,	%l4
	fmovdpos	%icc,	%f22,	%f11
	movgu	%xcc,	%o3,	%l0
	sll	%g1,	0x06,	%o5
	srax	%g5,	%o7,	%g4
	ldsh	[%l7 + 0x3E],	%l2
	umulcc	%i6,	0x1755,	%g3
	movrgz	%i4,	0x2BA,	%o4
	edge16	%o0,	%o2,	%i2
	fpsub32	%f26,	%f20,	%f28
	st	%f27,	[%l7 + 0x44]
	ldsb	[%l7 + 0x76],	%i7
	xorcc	%l1,	0x0AF6,	%g7
	movvs	%xcc,	%o1,	%g6
	sth	%l3,	[%l7 + 0x68]
	fmovsneg	%xcc,	%f11,	%f27
	sll	%i1,	0x12,	%l6
	fmovrsne	%g2,	%f13,	%f15
	fmovdcs	%icc,	%f1,	%f9
	movvc	%icc,	%o6,	%i5
	ldd	[%l7 + 0x60],	%l4
	fmovdne	%xcc,	%f6,	%f1
	edge8n	%i3,	%i0,	%l4
	movne	%xcc,	%l0,	%g1
	movrne	%o3,	%o5,	%o7
	edge16n	%g5,	%l2,	%i6
	movcs	%xcc,	%g4,	%i4
	edge16ln	%g3,	%o4,	%o0
	movg	%icc,	%o2,	%i7
	ld	[%l7 + 0x38],	%f15
	umulcc	%l1,	%i2,	%o1
	lduw	[%l7 + 0x24],	%g7
	sdivcc	%g6,	0x1D60,	%i1
	fands	%f8,	%f6,	%f9
	fpsub16s	%f28,	%f24,	%f27
	fmovsg	%icc,	%f11,	%f3
	sll	%l3,	0x1E,	%g2
	movg	%xcc,	%l6,	%o6
	mulx	%i5,	%l5,	%i0
	andn	%l4,	%i3,	%l0
	movpos	%xcc,	%g1,	%o3
	edge32ln	%o7,	%g5,	%o5
	fcmpeq32	%f8,	%f12,	%i6
	or	%l2,	0x0A13,	%i4
	movcs	%icc,	%g4,	%g3
	movleu	%icc,	%o0,	%o4
	movre	%o2,	%i7,	%l1
	ldsw	[%l7 + 0x08],	%i2
	addc	%o1,	0x0003,	%g7
	sra	%i1,	0x0A,	%l3
	movvs	%xcc,	%g2,	%l6
	umul	%g6,	%i5,	%o6
	lduw	[%l7 + 0x18],	%i0
	sdivcc	%l4,	0x0A91,	%l5
	alignaddrl	%l0,	%i3,	%o3
	edge32l	%g1,	%o7,	%o5
	fcmpne16	%f0,	%f2,	%g5
	movgu	%icc,	%l2,	%i6
	fandnot1s	%f10,	%f7,	%f29
	fmovrde	%i4,	%f28,	%f28
	edge32	%g4,	%o0,	%o4
	save %g3, 0x0573, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f16,	%f24
	srl	%l1,	0x15,	%i2
	sllx	%i7,	0x15,	%g7
	fcmped	%fcc3,	%f20,	%f22
	fmovdle	%xcc,	%f24,	%f20
	orncc	%i1,	0x135C,	%l3
	or	%o1,	%g2,	%l6
	sllx	%i5,	0x19,	%g6
	mova	%icc,	%i0,	%l4
	array32	%l5,	%l0,	%i3
	movgu	%xcc,	%o6,	%o3
	fmovd	%f20,	%f22
	fpsub16	%f10,	%f26,	%f14
	ldsw	[%l7 + 0x2C],	%g1
	edge16	%o5,	%o7,	%l2
	fmovrdgez	%i6,	%f14,	%f22
	movvc	%xcc,	%i4,	%g5
	sdivx	%g4,	0x0B4C,	%o4
	fmovrdne	%g3,	%f26,	%f16
	edge8l	%o0,	%o2,	%l1
	ldsh	[%l7 + 0x1C],	%i7
	sethi	0x0E95,	%i2
	movrne	%i1,	%g7,	%o1
	orn	%l3,	%g2,	%i5
	addcc	%l6,	%i0,	%l4
	lduh	[%l7 + 0x5C],	%g6
	movvs	%xcc,	%l5,	%l0
	edge16n	%o6,	%o3,	%g1
	movg	%xcc,	%i3,	%o5
	fmovsl	%icc,	%f25,	%f27
	subccc	%l2,	%o7,	%i6
	fnot2s	%f5,	%f1
	sdivx	%i4,	0x185F,	%g4
	addccc	%g5,	%o4,	%o0
	andncc	%o2,	%l1,	%i7
	mova	%xcc,	%g3,	%i2
	ldsb	[%l7 + 0x22],	%i1
	movvc	%icc,	%g7,	%o1
	fmovdvc	%xcc,	%f22,	%f6
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	umulcc	%l6,	%i0,	%l4
	movre	%g6,	%l5,	%l0
	xnorcc	%i5,	%o3,	%o6
	edge16	%g1,	%o5,	%l2
	movrlz	%o7,	0x316,	%i6
	mova	%icc,	%i3,	%i4
	std	%f26,	[%l7 + 0x20]
	movre	%g4,	%o4,	%o0
	subc	%o2,	%g5,	%l1
	nop
	set	0x72, %i7
	lduh	[%l7 + %i7],	%g3
	addc	%i7,	0x1039,	%i2
	fmovsn	%icc,	%f13,	%f14
	fnand	%f12,	%f2,	%f30
	ldd	[%l7 + 0x28],	%f22
	fmovdpos	%xcc,	%f17,	%f18
	movrgez	%i1,	%g7,	%g2
	xorcc	%l3,	%l6,	%i0
	fornot2	%f0,	%f4,	%f24
	sdivx	%l4,	0x0BD6,	%g6
	std	%f2,	[%l7 + 0x10]
	movrgez	%l5,	%o1,	%i5
	ldsb	[%l7 + 0x32],	%l0
	movn	%icc,	%o3,	%o6
	subcc	%g1,	%o5,	%o7
	ldsh	[%l7 + 0x1C],	%l2
	fmovrsgz	%i6,	%f17,	%f3
	movle	%icc,	%i4,	%g4
	srax	%i3,	%o0,	%o2
	movrlez	%o4,	%g5,	%l1
	alignaddr	%i7,	%i2,	%g3
	andncc	%g7,	%i1,	%g2
	movrgez	%l3,	0x116,	%l6
	edge8ln	%i0,	%l4,	%l5
	orcc	%o1,	0x11E8,	%i5
	subccc	%l0,	%o3,	%g6
	movcs	%icc,	%o6,	%g1
	sub	%o5,	%o7,	%i6
	fors	%f27,	%f22,	%f10
	edge32	%l2,	%i4,	%i3
	movgu	%icc,	%g4,	%o0
	fmovdl	%icc,	%f31,	%f19
	sethi	0x0FE4,	%o4
	fornot2s	%f7,	%f15,	%f13
	xnor	%g5,	0x0DE1,	%o2
	sdiv	%l1,	0x161C,	%i2
	movre	%g3,	0x0EC,	%g7
	mova	%icc,	%i7,	%g2
	edge8ln	%i1,	%l3,	%i0
	fpackfix	%f12,	%f12
	fandnot1s	%f19,	%f19,	%f12
	movrgez	%l4,	%l5,	%l6
	orcc	%i5,	%l0,	%o3
	fpackfix	%f30,	%f23
	fmovrde	%o1,	%f8,	%f30
	udivx	%g6,	0x09B9,	%o6
	ldsb	[%l7 + 0x32],	%g1
	movne	%icc,	%o5,	%i6
	mulscc	%o7,	%l2,	%i4
	sdiv	%i3,	0x1CAB,	%o0
	fcmpgt32	%f26,	%f4,	%o4
	orncc	%g4,	%o2,	%l1
	edge16l	%i2,	%g3,	%g5
	ld	[%l7 + 0x18],	%f10
	alignaddrl	%g7,	%g2,	%i7
	udiv	%l3,	0x13B6,	%i0
	umul	%i1,	0x0262,	%l4
	ldsw	[%l7 + 0x28],	%l6
	edge16l	%i5,	%l5,	%l0
	move	%icc,	%o3,	%o1
	andncc	%o6,	%g1,	%o5
	faligndata	%f4,	%f4,	%f8
	fmovsle	%icc,	%f16,	%f17
	movrlz	%g6,	%i6,	%o7
	umul	%i4,	%l2,	%o0
	restore %o4, 0x03B4, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%o2,	%l1
	movcs	%icc,	%g4,	%i2
	edge16	%g5,	%g7,	%g2
	orcc	%g3,	0x083F,	%l3
	fmovdcc	%icc,	%f28,	%f0
	andn	%i7,	%i1,	%i0
	edge16	%l6,	%i5,	%l5
	addccc	%l4,	0x1F5B,	%o3
	ldd	[%l7 + 0x68],	%f2
	movleu	%icc,	%o1,	%l0
	ldd	[%l7 + 0x18],	%f16
	movge	%xcc,	%g1,	%o5
	stx	%o6,	[%l7 + 0x18]
	add	%g6,	0x1A40,	%o7
	fpadd16s	%f20,	%f16,	%f1
	stb	%i4,	[%l7 + 0x6D]
	sub	%i6,	%o0,	%o4
	edge32n	%i3,	%o2,	%l2
	fpadd32s	%f1,	%f20,	%f31
	alignaddrl	%g4,	%l1,	%i2
	fnor	%f26,	%f22,	%f30
	fmovdvs	%xcc,	%f27,	%f4
	movneg	%icc,	%g5,	%g7
	edge32l	%g2,	%l3,	%i7
	sllx	%i1,	%i0,	%l6
	fornot2	%f26,	%f18,	%f18
	sdivx	%i5,	0x0D36,	%l5
	andncc	%g3,	%l4,	%o3
	movle	%xcc,	%o1,	%l0
	umul	%o5,	%o6,	%g6
	movre	%o7,	0x0F7,	%i4
	movl	%xcc,	%g1,	%i6
	lduw	[%l7 + 0x0C],	%o0
	edge32	%o4,	%i3,	%o2
	array32	%g4,	%l2,	%i2
	srax	%l1,	%g7,	%g2
	fmovdg	%icc,	%f18,	%f12
	sth	%l3,	[%l7 + 0x36]
	stx	%g5,	[%l7 + 0x08]
	stw	%i7,	[%l7 + 0x10]
	edge8	%i1,	%l6,	%i0
	movrgz	%l5,	0x18A,	%i5
	udivcc	%g3,	0x0904,	%o3
	movrgez	%l4,	0x2E4,	%l0
	fxors	%f6,	%f12,	%f11
	fmovspos	%xcc,	%f26,	%f12
	xnorcc	%o5,	%o6,	%o1
	ld	[%l7 + 0x08],	%f28
	stw	%o7,	[%l7 + 0x2C]
	st	%f10,	[%l7 + 0x38]
	movre	%g6,	0x1DA,	%g1
	fsrc2	%f26,	%f18
	sub	%i4,	%o0,	%o4
	sdiv	%i6,	0x13F4,	%o2
	srl	%i3,	0x07,	%g4
	movrgz	%i2,	%l1,	%l2
	array32	%g7,	%l3,	%g5
	popc	%g2,	%i1
	ldx	[%l7 + 0x70],	%l6
	fmovsge	%xcc,	%f3,	%f27
	sra	%i0,	0x1E,	%l5
	orcc	%i7,	0x0B60,	%i5
	or	%o3,	0x1BEB,	%l4
	movrgz	%g3,	0x374,	%o5
	fmovdl	%xcc,	%f26,	%f25
	movrlez	%o6,	%o1,	%o7
	orcc	%g6,	%l0,	%g1
	smul	%o0,	%o4,	%i6
	movcs	%icc,	%i4,	%i3
	fnegs	%f8,	%f19
	fands	%f4,	%f13,	%f29
	addcc	%o2,	0x0B18,	%i2
	udivx	%l1,	0x158C,	%l2
	save %g7, %l3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%icc,	%f10,	%f25
	fmovrslz	%g2,	%f17,	%f23
	movvc	%icc,	%i1,	%g5
	movrlz	%i0,	0x259,	%l6
	movle	%xcc,	%i7,	%i5
	sdivx	%l5,	0x0A4E,	%l4
	fxor	%f14,	%f6,	%f6
	andn	%g3,	%o3,	%o6
	nop
	set	0x6C, %l1
	ldsw	[%l7 + %l1],	%o1
	fmul8x16au	%f3,	%f22,	%f30
	ldsw	[%l7 + 0x24],	%o5
	subcc	%o7,	%l0,	%g1
	edge8l	%g6,	%o0,	%o4
	fones	%f24
	mulx	%i6,	%i3,	%i4
	fmul8x16	%f2,	%f10,	%f28
	movn	%xcc,	%i2,	%o2
	fmovspos	%icc,	%f21,	%f12
	stb	%l1,	[%l7 + 0x35]
	edge8ln	%g7,	%l2,	%g4
	xorcc	%g2,	0x1EFD,	%i1
	andncc	%l3,	%i0,	%g5
	nop
	set	0x3C, %o4
	ldsw	[%l7 + %o4],	%l6
	fnand	%f16,	%f10,	%f0
	fcmpd	%fcc1,	%f18,	%f18
	alignaddrl	%i5,	%l5,	%l4
	edge16n	%i7,	%g3,	%o6
	subccc	%o1,	0x14D6,	%o5
	fpmerge	%f25,	%f10,	%f12
	movvc	%icc,	%o3,	%l0
	andn	%o7,	%g1,	%o0
	movre	%o4,	%i6,	%g6
	movle	%icc,	%i4,	%i2
	srl	%o2,	0x02,	%i3
	edge16	%l1,	%g7,	%g4
	addccc	%l2,	%i1,	%l3
	srax	%i0,	0x05,	%g5
	alignaddr	%g2,	%l6,	%i5
	fones	%f2
	stw	%l4,	[%l7 + 0x5C]
	fpack16	%f18,	%f3
	edge16ln	%l5,	%i7,	%g3
	sdivcc	%o1,	0x0527,	%o5
	lduh	[%l7 + 0x76],	%o3
	edge32	%o6,	%o7,	%l0
	xnorcc	%o0,	%o4,	%g1
	fmovdge	%icc,	%f6,	%f16
	movg	%xcc,	%g6,	%i6
	subccc	%i2,	0x1E40,	%i4
	subc	%o2,	0x1EDE,	%l1
	sll	%g7,	0x16,	%g4
	xor	%i3,	%i1,	%l2
	fmovdcc	%icc,	%f9,	%f20
	fzeros	%f22
	edge8l	%i0,	%l3,	%g5
	edge8n	%l6,	%i5,	%l4
	orcc	%g2,	%i7,	%l5
	lduh	[%l7 + 0x5A],	%o1
	fcmpeq32	%f18,	%f12,	%g3
	movrgez	%o5,	%o6,	%o7
	popc	%o3,	%l0
	for	%f0,	%f0,	%f2
	movcs	%xcc,	%o0,	%o4
	fmovsge	%icc,	%f25,	%f7
	fmul8x16au	%f27,	%f6,	%f14
	edge32l	%g1,	%g6,	%i6
	ldsb	[%l7 + 0x60],	%i4
	lduh	[%l7 + 0x6C],	%o2
	xnorcc	%l1,	%i2,	%g7
	movre	%i3,	%g4,	%l2
	fmovdleu	%xcc,	%f2,	%f5
	nop
	set	0x58, %o5
	stx	%i0,	[%l7 + %o5]
	mulx	%i1,	%l3,	%l6
	stx	%g5,	[%l7 + 0x28]
	movne	%xcc,	%l4,	%i5
	stx	%g2,	[%l7 + 0x38]
	fmovsg	%icc,	%f1,	%f19
	fpack32	%f2,	%f8,	%f28
	srl	%l5,	0x19,	%o1
	movleu	%xcc,	%g3,	%o5
	orcc	%i7,	0x0860,	%o7
	lduw	[%l7 + 0x34],	%o3
	stb	%o6,	[%l7 + 0x55]
	siam	0x5
	subc	%l0,	0x0C8A,	%o4
	orncc	%o0,	0x040C,	%g1
	udivx	%g6,	0x1F20,	%i6
	fmovdgu	%xcc,	%f15,	%f31
	fmul8sux16	%f18,	%f20,	%f20
	addccc	%i4,	%l1,	%o2
	andncc	%g7,	%i2,	%i3
	subcc	%l2,	%g4,	%i1
	subc	%l3,	0x084F,	%i0
	fmovsvs	%xcc,	%f23,	%f6
	array8	%l6,	%l4,	%i5
	mulscc	%g5,	%l5,	%g2
	nop
	set	0x30, %l3
	std	%f14,	[%l7 + %l3]
	add	%o1,	0x05AE,	%g3
	lduh	[%l7 + 0x24],	%o5
	edge8n	%i7,	%o3,	%o7
	movn	%icc,	%l0,	%o6
	sdiv	%o0,	0x093A,	%o4
	fmul8x16al	%f23,	%f1,	%f6
	ld	[%l7 + 0x1C],	%f8
	movrlez	%g6,	%g1,	%i6
	smulcc	%i4,	%l1,	%g7
	mulscc	%o2,	%i2,	%i3
	xnorcc	%g4,	%l2,	%l3
	ldsb	[%l7 + 0x51],	%i1
	movl	%xcc,	%i0,	%l4
	fmovrdgz	%i5,	%f8,	%f8
	srlx	%g5,	%l6,	%l5
	subccc	%g2,	0x1D16,	%o1
	movrgez	%o5,	0x27B,	%i7
	st	%f3,	[%l7 + 0x18]
	std	%f30,	[%l7 + 0x38]
	sethi	0x15C9,	%o3
	fmovdg	%icc,	%f20,	%f13
	udivcc	%o7,	0x0BBE,	%g3
	mulx	%l0,	0x1EA7,	%o0
	movgu	%xcc,	%o6,	%o4
	fsrc1s	%f26,	%f0
	movn	%icc,	%g1,	%g6
	ldd	[%l7 + 0x60],	%f18
	edge16l	%i6,	%i4,	%l1
	fmovdge	%icc,	%f27,	%f21
	alignaddr	%o2,	%i2,	%i3
	sethi	0x177F,	%g7
	movrlz	%g4,	0x260,	%l3
	st	%f1,	[%l7 + 0x30]
	movleu	%icc,	%l2,	%i1
	fmovrslez	%i0,	%f27,	%f9
	movpos	%xcc,	%i5,	%g5
	sllx	%l6,	0x07,	%l4
	sllx	%l5,	%g2,	%o5
	fcmpes	%fcc2,	%f21,	%f12
	fabsd	%f16,	%f20
	xor	%o1,	%o3,	%o7
	stx	%i7,	[%l7 + 0x68]
	lduw	[%l7 + 0x0C],	%g3
	stw	%l0,	[%l7 + 0x40]
	edge8ln	%o6,	%o0,	%g1
	fmovdvc	%xcc,	%f23,	%f14
	fnand	%f2,	%f30,	%f28
	xnor	%o4,	%g6,	%i4
	fmovs	%f15,	%f23
	xor	%i6,	0x1AC3,	%l1
	edge16n	%i2,	%o2,	%i3
	smul	%g4,	0x0517,	%g7
	fsrc2s	%f5,	%f3
	orcc	%l2,	%l3,	%i0
	ldsb	[%l7 + 0x2C],	%i1
	save %g5, %i5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l5,	%g2,	%o5
	edge8n	%o1,	%l4,	%o3
	fmovspos	%icc,	%f27,	%f8
	srlx	%i7,	%o7,	%g3
	smul	%l0,	0x1675,	%o6
	or	%g1,	0x1E0E,	%o0
	edge16n	%g6,	%o4,	%i4
	movne	%icc,	%l1,	%i6
	movle	%icc,	%i2,	%o2
	ldd	[%l7 + 0x30],	%g4
	fmovdcs	%xcc,	%f10,	%f16
	edge8ln	%i3,	%l2,	%g7
	movge	%xcc,	%i0,	%i1
	movn	%xcc,	%g5,	%i5
	sdivcc	%l3,	0x0ADD,	%l6
	movgu	%xcc,	%l5,	%g2
	sdivcc	%o5,	0x0652,	%l4
	fexpand	%f10,	%f20
	movrgez	%o1,	0x375,	%i7
	movrgz	%o7,	%o3,	%l0
	movrlez	%g3,	%g1,	%o0
	fmovrslz	%o6,	%f31,	%f2
	orncc	%o4,	0x1F4E,	%g6
	orn	%l1,	%i6,	%i2
	save %i4, 0x1D17, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i3,	0x1D,	%g4
	srl	%l2,	%i0,	%g7
	umul	%g5,	%i1,	%l3
	smulcc	%l6,	%i5,	%l5
	save %o5, 0x0B05, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o1,	%i7,	%g2
	udivcc	%o3,	0x0BEC,	%l0
	fmovspos	%icc,	%f6,	%f27
	sethi	0x1E92,	%o7
	movvs	%xcc,	%g3,	%g1
	fmovdge	%xcc,	%f4,	%f25
	movrgez	%o0,	0x3C6,	%o6
	lduw	[%l7 + 0x28],	%o4
	movleu	%icc,	%l1,	%g6
	movl	%xcc,	%i2,	%i4
	fcmpeq16	%f4,	%f30,	%o2
	xnorcc	%i6,	0x08DE,	%g4
	movcc	%xcc,	%l2,	%i3
	mova	%icc,	%g7,	%i0
	movrne	%g5,	0x308,	%l3
	orn	%l6,	0x146C,	%i5
	addcc	%l5,	%o5,	%i1
	sll	%o1,	0x08,	%l4
	movge	%icc,	%g2,	%o3
	fmovrslz	%l0,	%f19,	%f18
	stb	%i7,	[%l7 + 0x5E]
	lduh	[%l7 + 0x34],	%g3
	lduh	[%l7 + 0x28],	%g1
	fpsub16	%f16,	%f30,	%f30
	srl	%o0,	0x14,	%o6
	fxnor	%f20,	%f20,	%f28
	and	%o4,	%l1,	%o7
	edge8	%g6,	%i4,	%i2
	lduw	[%l7 + 0x3C],	%o2
	sub	%g4,	%i6,	%i3
	fmovsle	%icc,	%f31,	%f29
	movvs	%icc,	%l2,	%i0
	smulcc	%g7,	0x1530,	%l3
	sir	0x1AF6
	array32	%g5,	%l6,	%i5
	fzero	%f6
	add	%l5,	0x0D90,	%o5
	mova	%icc,	%o1,	%i1
	fpackfix	%f24,	%f24
	stb	%l4,	[%l7 + 0x11]
	srlx	%o3,	0x18,	%l0
	smulcc	%i7,	0x0064,	%g3
	fcmped	%fcc0,	%f30,	%f12
	lduw	[%l7 + 0x58],	%g2
	alignaddrl	%o0,	%o6,	%g1
	ldd	[%l7 + 0x40],	%l0
	subcc	%o7,	%o4,	%g6
	xorcc	%i2,	%i4,	%o2
	fmovdcc	%xcc,	%f26,	%f30
	ld	[%l7 + 0x44],	%f23
	fone	%f16
	udivx	%i6,	0x1727,	%i3
	movrlz	%l2,	0x186,	%i0
	movleu	%xcc,	%g4,	%g7
	addcc	%l3,	0x1932,	%l6
	sllx	%g5,	%l5,	%o5
	sth	%o1,	[%l7 + 0x70]
	lduw	[%l7 + 0x6C],	%i1
	fmovrsne	%l4,	%f24,	%f26
	edge16ln	%i5,	%o3,	%i7
	edge16ln	%g3,	%l0,	%g2
	st	%f3,	[%l7 + 0x08]
	nop
	set	0x44, %o1
	ldsw	[%l7 + %o1],	%o0
	udivcc	%g1,	0x1386,	%l1
	movle	%xcc,	%o6,	%o4
	addccc	%o7,	%g6,	%i4
	ldsw	[%l7 + 0x18],	%o2
	edge8n	%i2,	%i3,	%l2
	array16	%i0,	%i6,	%g4
	fpadd32s	%f10,	%f20,	%f17
	popc	%g7,	%l3
	mulscc	%g5,	0x03BF,	%l5
	edge16ln	%l6,	%o1,	%o5
	sll	%l4,	0x0A,	%i1
	popc	0x07CB,	%i5
	edge32ln	%i7,	%g3,	%o3
	fmovscc	%xcc,	%f18,	%f21
	movrlez	%g2,	0x061,	%l0
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	sdivx	%o6,	0x10FC,	%o4
	edge8n	%g6,	%i4,	%o2
	subc	%o7,	%i3,	%i2
	subccc	%i0,	%i6,	%g4
	fpadd32s	%f3,	%f11,	%f29
	and	%l2,	0x11F9,	%l3
	sir	0x1B64
	movneg	%icc,	%g7,	%g5
	fmovdgu	%xcc,	%f25,	%f24
	umul	%l6,	%o1,	%l5
	fcmpd	%fcc2,	%f4,	%f10
	orncc	%l4,	0x080A,	%o5
	stx	%i1,	[%l7 + 0x20]
	alignaddr	%i5,	%g3,	%o3
	movgu	%icc,	%g2,	%l0
	movn	%icc,	%i7,	%o0
	subccc	%l1,	%g1,	%o4
	edge16n	%o6,	%g6,	%i4
	edge16	%o7,	%i3,	%i2
	movrlez	%o2,	%i0,	%i6
	sll	%g4,	0x09,	%l3
	movrne	%l2,	0x2F4,	%g7
	movleu	%icc,	%g5,	%l6
	lduw	[%l7 + 0x5C],	%l5
	movpos	%icc,	%o1,	%l4
	movle	%icc,	%i1,	%o5
	movg	%icc,	%i5,	%g3
	movn	%xcc,	%o3,	%g2
	fcmpeq32	%f2,	%f22,	%l0
	bshuffle	%f22,	%f12,	%f4
	and	%i7,	%o0,	%g1
	umul	%o4,	0x04BF,	%o6
	fxors	%f22,	%f19,	%f2
	stw	%l1,	[%l7 + 0x78]
	fmovdn	%xcc,	%f6,	%f29
	sdiv	%g6,	0x177D,	%i4
	fmovde	%xcc,	%f8,	%f5
	ldd	[%l7 + 0x48],	%f6
	std	%f0,	[%l7 + 0x38]
	movg	%xcc,	%o7,	%i2
	fmovrsgz	%i3,	%f17,	%f26
	movneg	%icc,	%o2,	%i6
	add	%g4,	%i0,	%l2
	restore %g7, %g5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l5,	%o1,	%l4
	sethi	0x0210,	%i1
	orncc	%o5,	%i5,	%l3
	fcmple16	%f22,	%f18,	%o3
	fmovsn	%icc,	%f28,	%f30
	fcmpne32	%f24,	%f4,	%g3
	edge8n	%l0,	%i7,	%o0
	edge32n	%g2,	%g1,	%o4
	umul	%o6,	%g6,	%i4
	xorcc	%l1,	%o7,	%i3
	edge32ln	%i2,	%o2,	%g4
	movl	%icc,	%i0,	%l2
	and	%g7,	0x15FD,	%i6
	edge8ln	%l6,	%l5,	%g5
	edge16	%l4,	%i1,	%o5
	edge8l	%o1,	%l3,	%o3
	movg	%xcc,	%i5,	%g3
	st	%f7,	[%l7 + 0x40]
	bshuffle	%f28,	%f18,	%f16
	edge32n	%l0,	%o0,	%g2
	array8	%i7,	%o4,	%g1
	fnors	%f30,	%f10,	%f1
	fcmpeq32	%f4,	%f8,	%o6
	movgu	%xcc,	%i4,	%g6
	fpmerge	%f11,	%f14,	%f28
	movcc	%icc,	%o7,	%i3
	udiv	%i2,	0x0231,	%o2
	sdiv	%g4,	0x1460,	%l1
	edge16ln	%l2,	%g7,	%i0
	fmovsa	%xcc,	%f2,	%f11
	fmovdg	%icc,	%f2,	%f26
	xnorcc	%l6,	0x1C5E,	%i6
	edge32l	%g5,	%l5,	%l4
	fmul8sux16	%f8,	%f6,	%f10
	movgu	%xcc,	%i1,	%o1
	subc	%l3,	0x1035,	%o5
	fcmple32	%f16,	%f2,	%o3
	sll	%i5,	0x1A,	%g3
	sll	%l0,	0x0E,	%g2
	pdist	%f12,	%f26,	%f28
	sir	0x1A25
	or	%i7,	%o0,	%o4
	fmovsle	%icc,	%f2,	%f29
	fpsub32	%f28,	%f30,	%f16
	xorcc	%g1,	0x1A73,	%i4
	movvs	%xcc,	%g6,	%o7
	movleu	%icc,	%o6,	%i2
	st	%f11,	[%l7 + 0x58]
	sllx	%i3,	0x18,	%o2
	srax	%g4,	%l2,	%l1
	sdiv	%g7,	0x156C,	%i0
	addc	%i6,	0x0674,	%l6
	sth	%l5,	[%l7 + 0x7C]
	edge8	%l4,	%g5,	%i1
	stx	%l3,	[%l7 + 0x58]
	movrgez	%o5,	%o1,	%o3
	sdivcc	%i5,	0x199A,	%l0
	sir	0x1695
	edge16ln	%g2,	%g3,	%i7
	lduh	[%l7 + 0x3E],	%o0
	fmovrdlez	%o4,	%f26,	%f24
	sra	%g1,	%i4,	%g6
	movle	%xcc,	%o7,	%i2
	sethi	0x1E30,	%i3
	ld	[%l7 + 0x74],	%f24
	sdiv	%o2,	0x1741,	%o6
	fnor	%f14,	%f16,	%f10
	movrlz	%l2,	%l1,	%g4
	mulx	%i0,	%g7,	%i6
	sll	%l6,	%l4,	%l5
	fpsub32	%f16,	%f16,	%f24
	std	%f26,	[%l7 + 0x08]
	fmovde	%icc,	%f17,	%f26
	fmovrdgz	%g5,	%f12,	%f16
	movvc	%xcc,	%l3,	%i1
	fmovdleu	%xcc,	%f1,	%f11
	fmovsl	%icc,	%f22,	%f6
	movrlz	%o5,	0x32D,	%o3
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	movl	%xcc,	%g3,	%i7
	edge16ln	%o0,	%o4,	%g1
	fnot2s	%f1,	%f4
	sethi	0x023B,	%g2
	ldx	[%l7 + 0x18],	%g6
	movge	%icc,	%o7,	%i2
	edge32	%i3,	%o2,	%o6
	sdivx	%l2,	0x109D,	%i4
	fmovdcc	%xcc,	%f21,	%f0
	fpadd16	%f26,	%f12,	%f22
	ldub	[%l7 + 0x36],	%l1
	addcc	%i0,	0x1C27,	%g7
	movvc	%xcc,	%g4,	%i6
	movne	%xcc,	%l4,	%l6
	subcc	%l5,	0x0F5B,	%g5
	fxor	%f12,	%f6,	%f6
	fmovrdgz	%l3,	%f24,	%f10
	xnor	%i1,	%o5,	%i5
	stw	%l0,	[%l7 + 0x40]
	andncc	%o3,	%g3,	%i7
	fmovsn	%xcc,	%f6,	%f3
	movpos	%xcc,	%o1,	%o0
	fmovd	%f28,	%f8
	fxnors	%f21,	%f27,	%f0
	stx	%o4,	[%l7 + 0x38]
	fexpand	%f4,	%f20
	stx	%g2,	[%l7 + 0x18]
	edge32ln	%g1,	%g6,	%i2
	fmovdleu	%xcc,	%f8,	%f2
	movle	%icc,	%i3,	%o2
	array32	%o7,	%l2,	%i4
	edge8n	%o6,	%l1,	%g7
	fpsub16	%f10,	%f2,	%f2
	sdivcc	%g4,	0x1410,	%i6
	fmuld8ulx16	%f22,	%f20,	%f24
	udivx	%l4,	0x19A8,	%i0
	edge32l	%l6,	%l5,	%g5
	bshuffle	%f4,	%f24,	%f28
	move	%icc,	%l3,	%o5
	movge	%icc,	%i5,	%l0
	movge	%xcc,	%i1,	%o3
	udiv	%i7,	0x1ACD,	%o1
	udiv	%o0,	0x1219,	%o4
	movne	%xcc,	%g2,	%g1
	movrgez	%g3,	0x230,	%g6
	edge16	%i2,	%o2,	%o7
	xorcc	%l2,	%i3,	%o6
	movcs	%xcc,	%i4,	%l1
	andncc	%g7,	%i6,	%g4
	movre	%i0,	%l6,	%l5
	edge8ln	%l4,	%l3,	%o5
	fsrc1	%f10,	%f12
	fxnors	%f1,	%f6,	%f21
	umulcc	%i5,	%g5,	%i1
	fcmpne32	%f16,	%f0,	%l0
	stx	%o3,	[%l7 + 0x68]
	ldsh	[%l7 + 0x4E],	%o1
	edge32n	%i7,	%o4,	%o0
	alignaddrl	%g1,	%g3,	%g6
	sth	%g2,	[%l7 + 0x64]
	array8	%i2,	%o2,	%o7
	lduw	[%l7 + 0x34],	%i3
	orn	%o6,	%i4,	%l1
	movcs	%icc,	%g7,	%i6
	umulcc	%g4,	0x1138,	%l2
	fpsub16	%f18,	%f16,	%f28
	edge8	%i0,	%l5,	%l6
	edge8n	%l3,	%l4,	%o5
	fnegd	%f6,	%f24
	fcmpgt16	%f6,	%f12,	%i5
	movneg	%xcc,	%g5,	%l0
	movvs	%xcc,	%o3,	%o1
	ldsw	[%l7 + 0x4C],	%i7
	xnorcc	%i1,	%o4,	%g1
	fcmps	%fcc3,	%f8,	%f21
	movg	%icc,	%o0,	%g3
	fpmerge	%f21,	%f9,	%f28
	subcc	%g2,	%g6,	%o2
	ldd	[%l7 + 0x50],	%f14
	and	%o7,	0x0879,	%i3
	subccc	%o6,	0x0BB4,	%i2
	addccc	%i4,	0x115A,	%g7
	orcc	%l1,	0x0CA3,	%i6
	mulscc	%l2,	%g4,	%l5
	sll	%l6,	%i0,	%l3
	ldx	[%l7 + 0x28],	%l4
	add	%i5,	0x17D8,	%g5
	xnor	%l0,	0x00B9,	%o5
	fmovse	%icc,	%f11,	%f16
	srax	%o1,	0x16,	%i7
	stx	%i1,	[%l7 + 0x08]
	andn	%o3,	0x13CA,	%g1
	movgu	%xcc,	%o0,	%o4
	orcc	%g2,	%g3,	%o2
	alignaddr	%o7,	%i3,	%o6
	nop
	set	0x64, %l0
	ldsh	[%l7 + %l0],	%i2
	array16	%g6,	%g7,	%l1
	movl	%xcc,	%i6,	%i4
	movrlez	%g4,	%l2,	%l5
	movg	%xcc,	%i0,	%l6
	orcc	%l3,	0x033E,	%i5
	fmuld8ulx16	%f0,	%f16,	%f20
	fcmpgt32	%f8,	%f24,	%g5
	fmovdge	%icc,	%f7,	%f28
	fmovrde	%l4,	%f28,	%f6
	fpmerge	%f9,	%f2,	%f2
	fmul8x16	%f31,	%f10,	%f4
	subc	%o5,	0x0627,	%l0
	fmovda	%icc,	%f11,	%f29
	edge16	%o1,	%i1,	%i7
	movcs	%xcc,	%o3,	%o0
	fmul8x16au	%f14,	%f23,	%f4
	fmovdleu	%icc,	%f22,	%f1
	movpos	%xcc,	%g1,	%g2
	fandnot1s	%f0,	%f4,	%f24
	ldx	[%l7 + 0x18],	%g3
	fnand	%f6,	%f4,	%f10
	addccc	%o4,	0x0DF1,	%o7
	fsrc2s	%f19,	%f25
	sdivx	%o2,	0x0C2A,	%i3
	mova	%xcc,	%o6,	%g6
	lduw	[%l7 + 0x70],	%g7
	movvc	%xcc,	%l1,	%i6
	fxnor	%f26,	%f8,	%f6
	movle	%icc,	%i2,	%g4
	edge32n	%i4,	%l2,	%l5
	movvc	%xcc,	%l6,	%l3
	and	%i0,	0x1027,	%g5
	movrlez	%i5,	%l4,	%o5
	xorcc	%o1,	%l0,	%i7
	movrgez	%i1,	%o0,	%o3
	subcc	%g1,	%g2,	%o4
	edge8l	%g3,	%o2,	%o7
	ld	[%l7 + 0x54],	%f11
	fmovrdlez	%o6,	%f0,	%f2
	lduh	[%l7 + 0x4A],	%g6
	andcc	%g7,	0x0B3A,	%i3
	udivcc	%i6,	0x0C92,	%l1
	udivx	%g4,	0x0A48,	%i4
	udivx	%l2,	0x131D,	%i2
	array8	%l5,	%l3,	%l6
	mulx	%i0,	%i5,	%g5
	smulcc	%l4,	%o5,	%o1
	addcc	%i7,	0x0F7F,	%l0
	mulscc	%o0,	0x14E2,	%o3
	sll	%i1,	%g1,	%g2
	movl	%icc,	%o4,	%o2
	alignaddr	%o7,	%g3,	%o6
	movleu	%xcc,	%g7,	%i3
	edge16n	%g6,	%l1,	%i6
	fone	%f8
	std	%f22,	[%l7 + 0x08]
	sra	%i4,	%g4,	%l2
	add	%l5,	0x0CED,	%i2
	movcc	%icc,	%l6,	%l3
	andcc	%i5,	%g5,	%l4
	addccc	%i0,	%o5,	%i7
	or	%o1,	%o0,	%o3
	xnor	%i1,	0x03D1,	%l0
	fone	%f10
	stb	%g1,	[%l7 + 0x12]
	fmul8sux16	%f2,	%f6,	%f28
	movrgz	%o4,	0x236,	%o2
	ld	[%l7 + 0x6C],	%f19
	smulcc	%g2,	%o7,	%g3
	popc	0x14A0,	%g7
	addc	%i3,	0x1926,	%g6
	add	%o6,	0x0C27,	%i6
	srlx	%l1,	0x15,	%i4
	array32	%l2,	%g4,	%i2
	addcc	%l6,	%l5,	%i5
	andcc	%g5,	0x039C,	%l4
	edge8	%l3,	%i0,	%i7
	sdiv	%o1,	0x135D,	%o0
	fmovrsne	%o3,	%f27,	%f15
	add	%i1,	0x0F3B,	%o5
	or	%l0,	0x1EC8,	%g1
	array32	%o4,	%g2,	%o2
	andn	%g3,	0x1DE5,	%g7
	edge16	%i3,	%g6,	%o7
	andncc	%o6,	%l1,	%i6
	edge32ln	%l2,	%g4,	%i4
	edge8l	%l6,	%l5,	%i5
	fmovdne	%icc,	%f17,	%f27
	edge8ln	%g5,	%l4,	%i2
	movneg	%icc,	%i0,	%l3
	srax	%o1,	%i7,	%o0
	addcc	%o3,	%i1,	%o5
	lduh	[%l7 + 0x48],	%g1
	srl	%o4,	0x16,	%l0
	edge16	%g2,	%o2,	%g3
	fmovdcs	%icc,	%f0,	%f26
	movg	%icc,	%g7,	%i3
	alignaddrl	%g6,	%o6,	%o7
	movg	%icc,	%i6,	%l1
	mulscc	%g4,	0x1B9E,	%l2
	and	%i4,	%l6,	%l5
	add	%g5,	0x11D1,	%l4
	umul	%i2,	0x0882,	%i0
	fmul8ulx16	%f30,	%f28,	%f12
	umul	%i5,	%l3,	%o1
	fcmpes	%fcc2,	%f25,	%f2
	edge16ln	%o0,	%o3,	%i1
	fmovsle	%icc,	%f24,	%f0
	fmovsvc	%xcc,	%f13,	%f1
	srax	%o5,	%i7,	%g1
	movrgez	%o4,	0x3A0,	%g2
	nop
	set	0x67, %o7
	ldub	[%l7 + %o7],	%o2
	smul	%l0,	0x0F03,	%g3
	lduw	[%l7 + 0x2C],	%g7
	fornot2	%f6,	%f8,	%f30
	srl	%g6,	0x0C,	%o6
	movrgez	%i3,	0x280,	%o7
	edge8n	%i6,	%l1,	%g4
	movcs	%xcc,	%i4,	%l2
	ldsb	[%l7 + 0x46],	%l6
	movpos	%xcc,	%l5,	%g5
	fmovrsgz	%l4,	%f30,	%f20
	sra	%i0,	0x1C,	%i2
	srlx	%i5,	%l3,	%o0
	srlx	%o1,	%o3,	%o5
	fcmpne16	%f0,	%f6,	%i1
	andn	%g1,	0x06D9,	%i7
	edge32ln	%g2,	%o4,	%o2
	smulcc	%l0,	%g7,	%g6
	movle	%icc,	%g3,	%o6
	fcmpne16	%f26,	%f16,	%i3
	fmovrde	%i6,	%f0,	%f26
	edge8ln	%o7,	%l1,	%i4
	ldd	[%l7 + 0x70],	%l2
	movge	%icc,	%g4,	%l6
	edge8ln	%g5,	%l5,	%l4
	edge8n	%i2,	%i5,	%l3
	movgu	%xcc,	%o0,	%o1
	mova	%xcc,	%i0,	%o5
	orncc	%i1,	0x142F,	%g1
	ldub	[%l7 + 0x22],	%i7
	fpackfix	%f24,	%f6
	subc	%o3,	0x07F4,	%o4
	and	%o2,	0x0C57,	%g2
	array16	%l0,	%g6,	%g7
	add	%o6,	0x12CE,	%i3
	mulscc	%g3,	%o7,	%l1
	movge	%xcc,	%i4,	%i6
	nop
	set	0x68, %o6
	sth	%g4,	[%l7 + %o6]
	lduh	[%l7 + 0x4A],	%l2
	fmovrse	%g5,	%f17,	%f14
	edge16n	%l6,	%l4,	%l5
	movrlz	%i2,	%i5,	%o0
	fmovsvs	%xcc,	%f16,	%f20
	smulcc	%o1,	0x0D59,	%l3
	ldd	[%l7 + 0x20],	%f30
	movgu	%xcc,	%i0,	%o5
	sethi	0x12D1,	%g1
	xnor	%i7,	%o3,	%o4
	fmul8ulx16	%f6,	%f10,	%f28
	movl	%xcc,	%o2,	%g2
	movrgez	%l0,	%i1,	%g7
	fmovrslez	%g6,	%f19,	%f1
	edge16l	%i3,	%o6,	%g3
	fmovrde	%l1,	%f22,	%f28
	and	%o7,	%i6,	%i4
	fmovde	%xcc,	%f4,	%f30
	edge32ln	%g4,	%g5,	%l6
	movge	%xcc,	%l2,	%l5
	edge16n	%i2,	%l4,	%i5
	ldub	[%l7 + 0x1A],	%o0
	fpsub32s	%f0,	%f12,	%f6
	addccc	%l3,	%o1,	%i0
	movcc	%xcc,	%g1,	%o5
	st	%f17,	[%l7 + 0x50]
	siam	0x5
	alignaddr	%o3,	%i7,	%o4
	movcc	%icc,	%o2,	%g2
	fmovsgu	%xcc,	%f3,	%f17
	sllx	%i1,	0x08,	%l0
	edge8	%g7,	%i3,	%o6
	srl	%g6,	0x1C,	%g3
	andcc	%o7,	%i6,	%l1
	srlx	%i4,	%g4,	%l6
	udivx	%l2,	0x1715,	%g5
	and	%i2,	%l5,	%i5
	edge32	%o0,	%l4,	%l3
	movvs	%icc,	%i0,	%o1
	edge32ln	%g1,	%o5,	%i7
	and	%o4,	0x038D,	%o2
	fmovse	%xcc,	%f30,	%f16
	fmovscs	%xcc,	%f22,	%f8
	sethi	0x1B0D,	%o3
	addc	%g2,	%i1,	%l0
	fmovsl	%icc,	%f25,	%f25
	movpos	%xcc,	%i3,	%o6
	fabss	%f29,	%f16
	xorcc	%g6,	0x19F1,	%g3
	save %g7, %o7, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%icc,	%f22,	%f1
	ldd	[%l7 + 0x68],	%i4
	fmovse	%icc,	%f27,	%f21
	movpos	%xcc,	%g4,	%l6
	edge8	%l2,	%i6,	%i2
	fcmpne16	%f2,	%f6,	%g5
	edge16	%l5,	%o0,	%l4
	movrgz	%i5,	%i0,	%o1
	udiv	%l3,	0x01A4,	%g1
	udivx	%o5,	0x0EE6,	%i7
	edge16n	%o2,	%o3,	%o4
	sethi	0x0C63,	%i1
	subcc	%g2,	%l0,	%i3
	fabsd	%f4,	%f16
	andn	%g6,	0x183B,	%o6
	array16	%g7,	%g3,	%o7
	addccc	%i4,	%l1,	%l6
	movrlez	%g4,	%l2,	%i6
	movgu	%icc,	%i2,	%g5
	ldsb	[%l7 + 0x5F],	%l5
	fmovsg	%xcc,	%f30,	%f25
	st	%f31,	[%l7 + 0x60]
	popc	0x1441,	%l4
	movleu	%xcc,	%o0,	%i0
	srlx	%o1,	0x11,	%l3
	nop
	set	0x1C, %l6
	lduw	[%l7 + %l6],	%i5
	array8	%g1,	%o5,	%o2
	movvs	%icc,	%i7,	%o3
	move	%icc,	%o4,	%i1
	movre	%g2,	0x198,	%i3
	fsrc1	%f6,	%f2
	subcc	%g6,	0x1EAC,	%o6
	subc	%l0,	%g7,	%o7
	movgu	%xcc,	%g3,	%l1
	mulx	%i4,	%l6,	%g4
	movrne	%l2,	%i2,	%i6
	movrlez	%g5,	0x29A,	%l4
	fabsd	%f30,	%f8
	sethi	0x15B9,	%o0
	fxnor	%f0,	%f2,	%f10
	sdivx	%l5,	0x0D5B,	%o1
	udiv	%i0,	0x1B54,	%i5
	sll	%l3,	0x00,	%o5
	ldd	[%l7 + 0x38],	%f24
	ldsb	[%l7 + 0x7F],	%g1
	std	%f16,	[%l7 + 0x10]
	andcc	%i7,	%o3,	%o4
	movrgez	%o2,	%g2,	%i3
	movgu	%xcc,	%i1,	%o6
	sir	0x034F
	add	%g6,	%g7,	%l0
	nop
	set	0x2C, %o0
	lduw	[%l7 + %o0],	%o7
	movrne	%g3,	%i4,	%l1
	xorcc	%g4,	%l6,	%i2
	mulscc	%i6,	%g5,	%l2
	andcc	%o0,	%l5,	%l4
	movrlez	%i0,	0x111,	%i5
	addccc	%l3,	%o1,	%o5
	mulscc	%g1,	%i7,	%o4
	fands	%f19,	%f28,	%f0
	srl	%o2,	0x07,	%o3
	movg	%icc,	%g2,	%i3
	ldsh	[%l7 + 0x1A],	%o6
	array16	%g6,	%g7,	%l0
	fmovsgu	%xcc,	%f17,	%f4
	udiv	%o7,	0x1AB5,	%i1
	orncc	%i4,	0x06C8,	%l1
	srlx	%g3,	0x17,	%g4
	addccc	%l6,	%i2,	%g5
	edge16l	%l2,	%i6,	%l5
	fabsd	%f10,	%f20
	stx	%l4,	[%l7 + 0x48]
	fmovdvc	%xcc,	%f17,	%f31
	mova	%icc,	%o0,	%i0
	alignaddr	%i5,	%l3,	%o1
	lduh	[%l7 + 0x4A],	%o5
	st	%f8,	[%l7 + 0x50]
	andcc	%g1,	0x00AF,	%i7
	ldsw	[%l7 + 0x74],	%o4
	fones	%f9
	sub	%o3,	%o2,	%g2
	sethi	0x0153,	%o6
	stx	%g6,	[%l7 + 0x68]
	for	%f2,	%f4,	%f8
	edge8	%i3,	%g7,	%o7
	stb	%i1,	[%l7 + 0x61]
	edge8n	%i4,	%l1,	%l0
	save %g3, %l6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%g5,	%l2
	edge8l	%i6,	%l5,	%g4
	sub	%o0,	%i0,	%l4
	stw	%l3,	[%l7 + 0x44]
	srlx	%o1,	%i5,	%o5
	sdivcc	%g1,	0x16ED,	%i7
	fmovdgu	%xcc,	%f10,	%f0
	fsrc1s	%f7,	%f10
	std	%f8,	[%l7 + 0x10]
	ldsb	[%l7 + 0x7E],	%o4
	movcs	%icc,	%o2,	%o3
	mova	%icc,	%g2,	%g6
	edge32n	%o6,	%i3,	%o7
	fzeros	%f21
	xnorcc	%g7,	%i1,	%l1
	ldsh	[%l7 + 0x48],	%i4
	fornot1s	%f29,	%f16,	%f30
	fmovdne	%xcc,	%f28,	%f12
	edge32ln	%l0,	%g3,	%l6
	mulx	%g5,	%i2,	%i6
	stx	%l5,	[%l7 + 0x40]
	add	%g4,	0x160F,	%l2
	fmovdvc	%icc,	%f5,	%f6
	addccc	%o0,	%i0,	%l4
	edge8ln	%l3,	%o1,	%i5
	restore %o5, 0x0B99, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	siam	0x6
	movrgez	%o4,	%o2,	%o3
	fmul8x16au	%f9,	%f27,	%f26
	xorcc	%g2,	%g6,	%i7
	andncc	%o6,	%o7,	%g7
	fpsub32s	%f1,	%f27,	%f14
	addcc	%i1,	0x11E9,	%l1
	udiv	%i3,	0x1000,	%l0
	array16	%i4,	%l6,	%g5
	fcmpgt16	%f12,	%f30,	%i2
	udiv	%i6,	0x04EA,	%g3
	andcc	%l5,	0x154B,	%g4
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	fcmpne32	%f24,	%f20,	%l2
	std	%f14,	[%l7 + 0x40]
	restore %l3, %l4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o5,	0x1E,	%o1
	movle	%icc,	%g1,	%o2
	fnot2	%f0,	%f14
	fpsub16s	%f7,	%f6,	%f12
	fpack16	%f26,	%f20
	movn	%xcc,	%o4,	%o3
	xnor	%g6,	0x04E2,	%g2
	orn	%o6,	%i7,	%o7
	ldsb	[%l7 + 0x5A],	%i1
	stw	%l1,	[%l7 + 0x10]
	ldx	[%l7 + 0x78],	%i3
	andn	%l0,	%g7,	%l6
	movl	%xcc,	%i4,	%i2
	movleu	%xcc,	%g5,	%g3
	orn	%i6,	0x033A,	%g4
	sethi	0x05E2,	%l5
	edge8l	%o0,	%i0,	%l2
	addccc	%l4,	%i5,	%o5
	ldub	[%l7 + 0x78],	%o1
	xnor	%l3,	%g1,	%o4
	fmovrslez	%o2,	%f30,	%f6
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%o2
	addccc	%g6,	0x0A2A,	%o6
	stx	%i7,	[%l7 + 0x08]
	fmovrslz	%g2,	%f8,	%f5
	fornot1s	%f10,	%f8,	%f23
	mova	%icc,	%i1,	%l1
	or	%i3,	0x0227,	%o7
	edge32ln	%g7,	%l0,	%i4
	subcc	%i2,	%l6,	%g5
	movrgez	%i6,	0x399,	%g3
	edge32	%l5,	%g4,	%i0
	mulscc	%o0,	0x15FE,	%l2
	fpsub32s	%f5,	%f21,	%f27
	xorcc	%l4,	0x1C05,	%i5
	edge32	%o1,	%l3,	%o5
	movg	%xcc,	%o4,	%o2
	subccc	%o3,	%g6,	%o6
	fcmped	%fcc3,	%f4,	%f8
	sub	%g1,	%i7,	%g2
	edge32	%l1,	%i1,	%o7
	udiv	%i3,	0x05A1,	%g7
	edge16	%l0,	%i2,	%i4
	smul	%l6,	0x04FF,	%i6
	edge32	%g5,	%l5,	%g4
	fandnot1s	%f1,	%f15,	%f11
	edge32n	%i0,	%g3,	%o0
	andcc	%l4,	0x11D7,	%l2
	edge16l	%i5,	%o1,	%l3
	stb	%o4,	[%l7 + 0x0B]
	mulscc	%o5,	0x0F90,	%o2
	sir	0x13CC
	addcc	%g6,	0x13CF,	%o6
	sllx	%g1,	%o3,	%g2
	movle	%xcc,	%i7,	%i1
	addc	%l1,	%o7,	%i3
	umulcc	%g7,	%l0,	%i2
	fornot2s	%f1,	%f7,	%f12
	edge32	%i4,	%l6,	%g5
	fnor	%f18,	%f12,	%f24
	edge16	%i6,	%l5,	%g4
	fmovdcc	%icc,	%f26,	%f22
	sdivx	%i0,	0x118E,	%o0
	edge8n	%g3,	%l2,	%l4
	sir	0x0EB5
	or	%o1,	0x0036,	%i5
	movle	%icc,	%l3,	%o4
	alignaddr	%o2,	%o5,	%o6
	fpsub16s	%f13,	%f19,	%f22
	edge8ln	%g1,	%g6,	%g2
	ld	[%l7 + 0x78],	%f28
	fnegd	%f22,	%f4
	mulscc	%i7,	%i1,	%l1
	movrlez	%o7,	0x2C0,	%i3
	addcc	%o3,	%g7,	%l0
	fmul8x16au	%f4,	%f3,	%f12
	orncc	%i4,	%l6,	%i2
	ldub	[%l7 + 0x2D],	%g5
	andn	%l5,	%g4,	%i6
	edge8ln	%o0,	%g3,	%i0
	fcmpne32	%f2,	%f10,	%l2
	xnorcc	%o1,	%l4,	%i5
	sdivcc	%o4,	0x0886,	%l3
	edge8	%o2,	%o5,	%g1
	movre	%o6,	%g6,	%i7
	ldd	[%l7 + 0x18],	%f0
	movge	%xcc,	%g2,	%l1
	addc	%o7,	%i3,	%i1
	movrgz	%o3,	0x331,	%g7
	mulscc	%l0,	0x05F6,	%l6
	movvs	%xcc,	%i2,	%g5
	movneg	%icc,	%i4,	%l5
	edge8	%i6,	%o0,	%g3
	nop
	set	0x1E, %i6
	sth	%i0,	[%l7 + %i6]
	movpos	%icc,	%g4,	%o1
	subcc	%l4,	%i5,	%l2
	sdiv	%o4,	0x1FF3,	%o2
	nop
	set	0x42, %i5
	ldsb	[%l7 + %i5],	%l3
	save %g1, %o5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i7,	0x16EC,	%g6
	fmovdle	%xcc,	%f13,	%f15
	edge32ln	%l1,	%g2,	%i3
	andn	%o7,	0x00D5,	%i1
	addc	%o3,	%l0,	%g7
	alignaddr	%i2,	%l6,	%i4
	sethi	0x0C82,	%l5
	xnor	%i6,	0x0755,	%g5
	ldsb	[%l7 + 0x4D],	%o0
	edge16n	%i0,	%g4,	%g3
	and	%l4,	%o1,	%i5
	lduh	[%l7 + 0x40],	%o4
	xnorcc	%l2,	0x02D7,	%l3
	xnor	%g1,	%o5,	%o2
	subccc	%i7,	%g6,	%o6
	ldsw	[%l7 + 0x30],	%l1
	movne	%xcc,	%i3,	%g2
	subc	%i1,	0x12B3,	%o7
	or	%o3,	%l0,	%i2
	movl	%icc,	%g7,	%i4
	fmovdne	%xcc,	%f4,	%f20
	save %l5, %l6, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g5, 0x1989, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i0,	%g4,	%l4
	fandnot2	%f0,	%f6,	%f14
	sdivcc	%g3,	0x1A6A,	%o1
	movneg	%xcc,	%o4,	%l2
	movrgz	%l3,	0x252,	%g1
	edge32ln	%o5,	%o2,	%i7
	edge16	%g6,	%o6,	%i5
	xnor	%l1,	0x1968,	%i3
	edge8ln	%g2,	%i1,	%o3
	sra	%o7,	%l0,	%g7
	umulcc	%i2,	0x1949,	%l5
	udivcc	%l6,	0x02DC,	%i6
	fmovscs	%icc,	%f9,	%f9
	fsrc1	%f26,	%f4
	subc	%i4,	%o0,	%g5
	movle	%xcc,	%i0,	%l4
	movrgez	%g4,	0x131,	%o1
	edge8l	%g3,	%l2,	%o4
	nop
	set	0x20, %l2
	sth	%l3,	[%l7 + %l2]
	orn	%g1,	0x0CBE,	%o5
	alignaddrl	%o2,	%g6,	%i7
	movrne	%i5,	0x089,	%o6
	movle	%xcc,	%i3,	%g2
	fmovs	%f8,	%f29
	edge8l	%l1,	%i1,	%o3
	orncc	%o7,	%g7,	%l0
	edge32	%l5,	%i2,	%i6
	udivcc	%l6,	0x1DF8,	%i4
	fands	%f18,	%f28,	%f2
	or	%g5,	%o0,	%i0
	addccc	%g4,	%o1,	%l4
	umul	%g3,	%l2,	%l3
	sll	%g1,	%o4,	%o2
	sra	%g6,	0x0B,	%o5
	ldx	[%l7 + 0x78],	%i7
	ld	[%l7 + 0x54],	%f25
	addc	%i5,	%o6,	%i3
	movn	%icc,	%g2,	%i1
	edge32	%o3,	%l1,	%o7
	edge16	%g7,	%l5,	%l0
	fabsd	%f6,	%f10
	alignaddr	%i6,	%l6,	%i4
	subcc	%i2,	%g5,	%o0
	movvc	%xcc,	%i0,	%g4
	add	%o1,	%g3,	%l4
	sth	%l3,	[%l7 + 0x54]
	fmovrslez	%g1,	%f15,	%f30
	stb	%l2,	[%l7 + 0x64]
	movl	%icc,	%o4,	%o2
	sth	%g6,	[%l7 + 0x74]
	add	%i7,	0x195F,	%o5
	fsrc1	%f2,	%f4
	fmovsn	%icc,	%f10,	%f14
	nop
	set	0x58, %l5
	lduw	[%l7 + %l5],	%i5
	subc	%i3,	%g2,	%o6
	sdivcc	%o3,	0x080E,	%l1
	addccc	%i1,	0x1CE2,	%g7
	fmul8ulx16	%f14,	%f28,	%f16
	srax	%l5,	0x15,	%o7
	fmovspos	%icc,	%f3,	%f8
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%f22
	udivx	%l0,	0x0737,	%i6
	lduw	[%l7 + 0x40],	%l6
	nop
	set	0x5D, %g5
	stb	%i4,	[%l7 + %g5]
	addcc	%i2,	%o0,	%g5
	xor	%g4,	%o1,	%g3
	lduw	[%l7 + 0x18],	%l4
	ldsh	[%l7 + 0x78],	%i0
	andcc	%g1,	%l2,	%o4
	edge16n	%o2,	%g6,	%i7
	xorcc	%l3,	0x1595,	%o5
	fxnor	%f18,	%f26,	%f20
	subc	%i3,	%i5,	%g2
	fors	%f5,	%f14,	%f7
	fsrc2	%f28,	%f20
	edge16ln	%o3,	%o6,	%l1
	ldd	[%l7 + 0x20],	%g6
	addc	%i1,	%l5,	%o7
	xorcc	%l0,	%l6,	%i4
	fxnor	%f2,	%f20,	%f18
	stb	%i2,	[%l7 + 0x7A]
	xor	%o0,	%i6,	%g4
	sdivcc	%g5,	0x0D95,	%g3
	fmul8ulx16	%f12,	%f6,	%f12
	stx	%l4,	[%l7 + 0x38]
	edge16ln	%o1,	%g1,	%l2
	move	%xcc,	%i0,	%o2
	pdist	%f2,	%f12,	%f20
	udivx	%g6,	0x11C8,	%o4
	udivcc	%l3,	0x014A,	%i7
	andn	%o5,	%i3,	%i5
	sdivx	%o3,	0x15C9,	%o6
	add	%l1,	0x1FB1,	%g2
	sir	0x0668
	addcc	%i1,	0x10EE,	%g7
	movvs	%xcc,	%o7,	%l5
	ld	[%l7 + 0x70],	%f8
	srlx	%l0,	%l6,	%i4
	xorcc	%i2,	%o0,	%i6
	movrlez	%g4,	%g5,	%g3
	lduh	[%l7 + 0x62],	%l4
	st	%f16,	[%l7 + 0x30]
	sdiv	%g1,	0x0754,	%o1
	xnor	%l2,	0x1A94,	%i0
	movpos	%icc,	%g6,	%o4
	fmovda	%icc,	%f16,	%f2
	edge8ln	%o2,	%i7,	%l3
	mulscc	%i3,	%o5,	%i5
	ldub	[%l7 + 0x70],	%o3
	addc	%o6,	0x0191,	%l1
	xorcc	%i1,	%g7,	%o7
	edge32ln	%g2,	%l5,	%l0
	addcc	%l6,	%i2,	%o0
	movl	%xcc,	%i6,	%g4
	fand	%f30,	%f18,	%f2
	ldsh	[%l7 + 0x7E],	%g5
	fmuld8sux16	%f22,	%f20,	%f24
	fmul8ulx16	%f12,	%f10,	%f8
	fpsub32s	%f3,	%f0,	%f23
	fcmpgt32	%f10,	%f8,	%i4
	subccc	%l4,	0x1953,	%g1
	andncc	%g3,	%l2,	%o1
	ldsb	[%l7 + 0x14],	%i0
	ldsh	[%l7 + 0x52],	%g6
	array32	%o4,	%o2,	%i7
	andn	%i3,	%o5,	%l3
	movvs	%xcc,	%o3,	%i5
	move	%icc,	%l1,	%i1
	fpack32	%f6,	%f16,	%f24
	mova	%icc,	%g7,	%o7
	ldd	[%l7 + 0x50],	%g2
	edge32ln	%l5,	%l0,	%o6
	orn	%i2,	%o0,	%i6
	sllx	%l6,	%g5,	%i4
	edge32	%g4,	%g1,	%l4
	fpadd32	%f22,	%f6,	%f2
	edge32	%g3,	%o1,	%i0
	sir	0x0FC2
	and	%l2,	0x00AB,	%o4
	edge32n	%g6,	%i7,	%o2
	ldd	[%l7 + 0x10],	%f18
	umulcc	%i3,	0x0C55,	%l3
	array8	%o5,	%o3,	%l1
	edge32n	%i5,	%i1,	%g7
	fcmped	%fcc3,	%f6,	%f28
	sllx	%g2,	%o7,	%l5
	movvc	%xcc,	%o6,	%l0
	ldsb	[%l7 + 0x6F],	%i2
	edge16n	%i6,	%o0,	%l6
	fzeros	%f17
	fmovrdlz	%g5,	%f22,	%f6
	subcc	%g4,	%i4,	%l4
	fnand	%f16,	%f8,	%f30
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	fands	%f15,	%f12,	%f3
	orncc	%i0,	0x09FC,	%o1
	fmovdle	%icc,	%f28,	%f25
	udiv	%l2,	0x1C2A,	%g6
	movpos	%xcc,	%o4,	%o2
	alignaddrl	%i7,	%i3,	%o5
	movrlez	%l3,	%o3,	%l1
	fmovsge	%xcc,	%f21,	%f10
	smulcc	%i5,	0x0838,	%g7
	fmovrslz	%g2,	%f3,	%f25
	alignaddr	%i1,	%o7,	%o6
	edge8l	%l5,	%l0,	%i6
	fmovscs	%xcc,	%f4,	%f2
	edge8	%i2,	%o0,	%g5
	stb	%g4,	[%l7 + 0x7B]
	fmovdvc	%icc,	%f16,	%f4
	srax	%i4,	%l6,	%g1
	subc	%l4,	0x01BF,	%g3
	ldsb	[%l7 + 0x47],	%o1
	fmovrdgez	%l2,	%f24,	%f10
	edge16n	%i0,	%o4,	%o2
	srl	%i7,	%i3,	%g6
	srax	%o5,	%l3,	%o3
	addccc	%l1,	%i5,	%g7
	fsrc1	%f26,	%f0
	fmovdvc	%xcc,	%f10,	%f3
	srax	%i1,	0x05,	%o7
	smul	%g2,	%l5,	%o6
	smul	%i6,	%i2,	%l0
	orcc	%g5,	0x1102,	%o0
	movl	%xcc,	%g4,	%l6
	edge16ln	%i4,	%l4,	%g1
	udivcc	%g3,	0x1643,	%l2
	orncc	%i0,	0x0ED7,	%o1
	andncc	%o4,	%o2,	%i7
	movrne	%g6,	%o5,	%l3
	fmovrdgz	%i3,	%f14,	%f0
	ldsh	[%l7 + 0x3C],	%o3
	fandnot2	%f18,	%f16,	%f8
	sll	%l1,	%g7,	%i1
	fmovrdlez	%o7,	%f6,	%f0
	subccc	%i5,	0x19A8,	%g2
	sir	0x1783
	popc	0x0894,	%o6
	edge16	%i6,	%i2,	%l0
	fpackfix	%f14,	%f28
	movgu	%icc,	%g5,	%o0
	smul	%l5,	0x1C88,	%l6
	xnor	%i4,	0x14DC,	%g4
	movgu	%xcc,	%g1,	%l4
	ldd	[%l7 + 0x30],	%l2
	orcc	%g3,	0x0BBC,	%i0
	smulcc	%o1,	0x1393,	%o4
	subc	%i7,	0x0888,	%g6
	movrlz	%o2,	0x1F7,	%l3
	fmovrdgz	%i3,	%f4,	%f30
	fmovsvs	%xcc,	%f22,	%f1
	ldsh	[%l7 + 0x78],	%o5
	edge32	%o3,	%g7,	%l1
	siam	0x4
	movrne	%o7,	0x0CB,	%i5
	movrgez	%g2,	0x1FF,	%o6
	stx	%i6,	[%l7 + 0x28]
	fmovsg	%icc,	%f27,	%f4
	movrgez	%i1,	0x14A,	%l0
	movrlz	%i2,	%g5,	%o0
	fcmped	%fcc0,	%f26,	%f2
	movn	%icc,	%l5,	%i4
	save %g4, 0x19B5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x14],	%l6
	movvc	%icc,	%l2,	%l4
	alignaddr	%i0,	%o1,	%g3
	fmovrsne	%o4,	%f31,	%f29
	save %i7, 0x1482, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%o2,	%l3
	xnorcc	%o5,	0x1A5B,	%o3
	movvs	%icc,	%g7,	%l1
	sir	0x0F64
	subc	%o7,	0x0D0A,	%i5
	ldsb	[%l7 + 0x11],	%i3
	fmul8x16	%f1,	%f12,	%f10
	edge8	%o6,	%g2,	%i1
	fornot1	%f12,	%f26,	%f28
	orcc	%l0,	0x1BD9,	%i2
	movgu	%xcc,	%i6,	%g5
	fmovdvs	%icc,	%f10,	%f24
	move	%icc,	%l5,	%o0
	sub	%g4,	0x089B,	%g1
	andcc	%i4,	%l2,	%l6
	fornot1s	%f2,	%f13,	%f13
	fmovse	%icc,	%f31,	%f27
	array16	%i0,	%o1,	%l4
	stb	%o4,	[%l7 + 0x23]
	movrlz	%i7,	0x1B1,	%g3
	orcc	%g6,	0x15A5,	%o2
	st	%f18,	[%l7 + 0x18]
	xor	%l3,	%o5,	%g7
	subc	%l1,	0x10C4,	%o7
	movre	%o3,	%i5,	%i3
	fcmpeq32	%f18,	%f10,	%g2
	umul	%o6,	0x0F0E,	%i1
	xnorcc	%l0,	0x010F,	%i2
	movrgez	%i6,	%l5,	%g5
	alignaddr	%g4,	%o0,	%i4
	save %l2, 0x06A1, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%xcc,	%f0,	%f12
	ldsh	[%l7 + 0x70],	%i0
	fmovrdgez	%o1,	%f18,	%f6
	movrgez	%l4,	0x1B4,	%o4
	edge16ln	%g1,	%g3,	%g6
	lduh	[%l7 + 0x3A],	%i7
	xnor	%o2,	0x19C1,	%l3
	orcc	%o5,	%g7,	%o7
	siam	0x1
	std	%f30,	[%l7 + 0x58]
	fornot1	%f26,	%f6,	%f16
	fmovsn	%icc,	%f29,	%f31
	ldd	[%l7 + 0x30],	%o2
	movcc	%xcc,	%i5,	%l1
	edge32l	%i3,	%g2,	%o6
	alignaddrl	%l0,	%i1,	%i6
	orncc	%l5,	0x0A33,	%g5
	lduw	[%l7 + 0x5C],	%i2
	edge16	%g4,	%o0,	%i4
	edge8n	%l6,	%i0,	%l2
	movl	%icc,	%o1,	%l4
	smulcc	%o4,	0x12BA,	%g1
	pdist	%f2,	%f26,	%f10
	fcmpgt32	%f0,	%f12,	%g6
	ldd	[%l7 + 0x70],	%i6
	ldd	[%l7 + 0x40],	%g2
	stb	%o2,	[%l7 + 0x22]
	fpadd16	%f2,	%f26,	%f16
	mulscc	%o5,	%g7,	%l3
	ldsb	[%l7 + 0x34],	%o3
	xnor	%i5,	%o7,	%l1
	edge8	%g2,	%o6,	%l0
	pdist	%f26,	%f10,	%f4
	xnor	%i3,	0x1136,	%i6
	smul	%l5,	%i1,	%i2
	fpsub32s	%f22,	%f1,	%f26
	orncc	%g4,	%g5,	%o0
	fnor	%f26,	%f30,	%f30
	fmovsa	%xcc,	%f8,	%f28
	xnorcc	%l6,	0x078F,	%i4
	ldsb	[%l7 + 0x21],	%i0
	nop
	set	0x44, %g3
	ldsh	[%l7 + %g3],	%l2
	add	%o1,	%o4,	%g1
	movge	%icc,	%l4,	%g6
	edge16	%g3,	%o2,	%i7
	orn	%g7,	%l3,	%o3
	xorcc	%i5,	0x1F51,	%o7
	andn	%l1,	%o5,	%o6
	sethi	0x0204,	%l0
	movpos	%icc,	%i3,	%i6
	movcc	%icc,	%g2,	%l5
	movvc	%xcc,	%i1,	%i2
	sth	%g5,	[%l7 + 0x14]
	sllx	%g4,	%o0,	%l6
	udivcc	%i0,	0x094F,	%l2
	sir	0x14F0
	fabsd	%f10,	%f16
	sethi	0x18D6,	%i4
	udivx	%o4,	0x005B,	%o1
	mulscc	%l4,	%g6,	%g1
	movl	%xcc,	%g3,	%i7
	movrgez	%o2,	0x354,	%g7
	popc	0x1ED3,	%l3
	movg	%xcc,	%i5,	%o3
	move	%xcc,	%l1,	%o5
	xorcc	%o7,	0x0A0C,	%o6
	movvc	%icc,	%i3,	%l0
	fcmpgt16	%f8,	%f4,	%g2
	fornot1s	%f13,	%f15,	%f14
	stb	%l5,	[%l7 + 0x2D]
	ld	[%l7 + 0x44],	%f26
	orcc	%i1,	%i2,	%g5
	subcc	%i6,	0x10FB,	%o0
	fxnor	%f8,	%f24,	%f18
	fnegs	%f17,	%f4
	fmovrdgez	%g4,	%f28,	%f28
	array8	%l6,	%i0,	%i4
	edge16n	%o4,	%l2,	%o1
	bshuffle	%f26,	%f4,	%f22
	movrlz	%g6,	%l4,	%g3
	restore %g1, %i7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f22,	%f12
	movneg	%xcc,	%l3,	%o2
	array32	%i5,	%o3,	%o5
	subcc	%o7,	0x1599,	%l1
	sra	%o6,	%l0,	%i3
	fpsub16	%f2,	%f2,	%f0
	smulcc	%l5,	0x0F99,	%g2
	sdiv	%i1,	0x180C,	%g5
	fmovrdgez	%i6,	%f18,	%f18
	subc	%i2,	0x1B96,	%o0
	fmul8sux16	%f28,	%f20,	%f18
	fmovdcs	%icc,	%f5,	%f29
	fnot1	%f4,	%f20
	srlx	%g4,	%l6,	%i0
	srax	%o4,	0x16,	%l2
	array8	%o1,	%i4,	%g6
	nop
	set	0x67, %i3
	stb	%l4,	[%l7 + %i3]
	andn	%g1,	%i7,	%g7
	andcc	%l3,	0x1323,	%g3
	srlx	%i5,	0x05,	%o2
	move	%icc,	%o5,	%o7
	ldub	[%l7 + 0x4B],	%l1
	movvs	%icc,	%o3,	%o6
	ldx	[%l7 + 0x18],	%i3
	fornot1s	%f4,	%f28,	%f11
	mulx	%l0,	%l5,	%i1
	xor	%g5,	0x1D43,	%i6
	orcc	%i2,	%o0,	%g2
	edge8l	%l6,	%g4,	%o4
	lduw	[%l7 + 0x5C],	%l2
	alignaddr	%i0,	%o1,	%i4
	fxors	%f23,	%f11,	%f2
	xorcc	%l4,	%g6,	%i7
	srl	%g1,	%l3,	%g3
	edge16	%g7,	%o2,	%o5
	nop
	set	0x26, %g1
	sth	%i5,	[%l7 + %g1]
	fmovrdne	%o7,	%f30,	%f2
	edge32ln	%l1,	%o3,	%o6
	sdivcc	%i3,	0x1837,	%l0
	subccc	%l5,	0x0F5A,	%i1
	stw	%g5,	[%l7 + 0x18]
	ldd	[%l7 + 0x20],	%i2
	edge16	%o0,	%g2,	%i6
	movg	%xcc,	%l6,	%o4
	array8	%l2,	%g4,	%i0
	movleu	%icc,	%i4,	%o1
	edge16ln	%l4,	%i7,	%g1
	sir	0x0C3D
	array32	%l3,	%g6,	%g7
	movg	%icc,	%o2,	%o5
	fmovrdlez	%g3,	%f24,	%f6
	subc	%i5,	%o7,	%l1
	fpack16	%f28,	%f5
	sll	%o6,	%i3,	%l0
	ldub	[%l7 + 0x5D],	%o3
	fmovsn	%xcc,	%f3,	%f20
	std	%f22,	[%l7 + 0x68]
	st	%f13,	[%l7 + 0x58]
	fmovdge	%xcc,	%f3,	%f6
	stw	%l5,	[%l7 + 0x64]
	ldsb	[%l7 + 0x6F],	%g5
	fxors	%f19,	%f11,	%f25
	xnorcc	%i1,	0x0514,	%i2
	edge32ln	%o0,	%g2,	%i6
	edge8ln	%o4,	%l6,	%g4
	fmovscc	%icc,	%f16,	%f9
	fmovs	%f7,	%f26
	move	%icc,	%i0,	%l2
	xor	%i4,	0x1B31,	%o1
	fabss	%f12,	%f28
	movre	%i7,	0x07C,	%g1
	subc	%l3,	0x0F99,	%g6
	movneg	%xcc,	%l4,	%g7
	xnor	%o2,	0x1609,	%o5
	movrgz	%i5,	0x3B6,	%o7
	stw	%g3,	[%l7 + 0x78]
	sllx	%o6,	0x08,	%i3
	orcc	%l0,	%o3,	%l1
	edge8n	%g5,	%i1,	%i2
	nop
	set	0x66, %o3
	sth	%o0,	[%l7 + %o3]
	edge8ln	%g2,	%i6,	%l5
	fpackfix	%f20,	%f24
	ldx	[%l7 + 0x78],	%l6
	fmovrde	%o4,	%f2,	%f18
	fmovdge	%icc,	%f25,	%f21
	sll	%i0,	%l2,	%i4
	movle	%xcc,	%g4,	%o1
	stw	%i7,	[%l7 + 0x28]
	save %g1, 0x06AB, %g6
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
loop_13: 	movrgez	%g7,	%o5,	%o7
	ldsb	[%l7 + 0x0D],	%i5
	fsrc1	%f4,	%f18
	movgu	%xcc,	%o6,	%g3
	movne	%icc,	%l0,	%i3
	fmul8x16au	%f12,	%f16,	%f28
	edge32ln	%l1,	%g5,	%i1
	movrne	%i2,	%o3,	%g2
	fxor	%f30,	%f14,	%f0
	fcmple16	%f14,	%f30,	%o0
	edge8l	%l5,	%i6,	%l6
	sir	0x1F1E
	sub	%i0,	0x05FF,	%o4
	fpadd32s	%f21,	%f15,	%f1
	udiv	%i4,	0x041F,	%g4
	edge32	%l2,	%i7,	%o1
	popc	0x16EB,	%g6
	stb	%l4,	[%l7 + 0x15]
	mulx	%g1,	%o2,	%l3
	add	%o5,	0x1B5F,	%o7
	edge16l	%g7,	%o6,	%i5
	lduw	[%l7 + 0x74],	%g3
	fmul8x16	%f18,	%f10,	%f20
	ldx	[%l7 + 0x08],	%l0
	edge8	%i3,	%g5,	%l1
	movn	%icc,	%i2,	%o3
	smul	%i1,	0x0D6E,	%g2
	smulcc	%l5,	%i6,	%o0
	edge8	%i0,	%o4,	%i4
	movcc	%icc,	%g4,	%l6
	stw	%i7,	[%l7 + 0x38]
	stb	%o1,	[%l7 + 0x57]
	fmovrdne	%l2,	%f26,	%f28
	add	%g6,	%g1,	%l4
	mulscc	%o2,	%o5,	%l3
	fmovdpos	%icc,	%f8,	%f24
	fzero	%f22
	movvs	%xcc,	%g7,	%o7
	udivx	%o6,	0x1719,	%i5
	fsrc1s	%f28,	%f23
	sth	%l0,	[%l7 + 0x3A]
	std	%f16,	[%l7 + 0x70]
	umulcc	%g3,	%i3,	%l1
	sdivcc	%i2,	0x0B58,	%o3
	fpadd32	%f6,	%f2,	%f0
	fxnor	%f0,	%f6,	%f18
	fmovsvs	%xcc,	%f6,	%f29
	sdivcc	%i1,	0x1A20,	%g5
	movpos	%icc,	%g2,	%l5
	fpack32	%f14,	%f10,	%f16
	edge8n	%o0,	%i0,	%o4
	movrgez	%i6,	%i4,	%l6
	movgu	%xcc,	%g4,	%i7
	fmovsleu	%icc,	%f31,	%f13
	sllx	%o1,	0x11,	%l2
	for	%f16,	%f20,	%f12
	fpadd16	%f16,	%f10,	%f14
	xnorcc	%g6,	%g1,	%o2
	xnor	%o5,	0x11D9,	%l4
	fmovsneg	%icc,	%f30,	%f7
	fornot2s	%f20,	%f23,	%f1
	movvc	%xcc,	%g7,	%l3
	save %o6, 0x13C6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%xcc,	%f31,	%f12
	orn	%o7,	%l0,	%i3
	movrlez	%g3,	0x22E,	%i2
	movrlez	%l1,	%o3,	%g5
	edge32	%i1,	%l5,	%g2
	ldsw	[%l7 + 0x64],	%i0
	srl	%o4,	%o0,	%i6
	or	%l6,	%i4,	%g4
	sra	%i7,	%o1,	%g6
	movle	%xcc,	%g1,	%o2
	orcc	%o5,	%l4,	%l2
	fpsub16s	%f19,	%f12,	%f18
	movleu	%xcc,	%g7,	%o6
	ldd	[%l7 + 0x48],	%i4
	ld	[%l7 + 0x3C],	%f24
	movne	%icc,	%o7,	%l0
	edge32n	%l3,	%g3,	%i2
	edge8n	%l1,	%o3,	%i3
	movre	%i1,	%g5,	%g2
	ldsw	[%l7 + 0x24],	%l5
	udiv	%i0,	0x1B29,	%o0
	edge16	%i6,	%o4,	%i4
	faligndata	%f0,	%f22,	%f4
	ldd	[%l7 + 0x10],	%f8
	movcc	%xcc,	%g4,	%l6
	edge32	%i7,	%o1,	%g6
	fmovrdgez	%g1,	%f24,	%f20
	fmovsgu	%xcc,	%f10,	%f5
	subcc	%o2,	0x0997,	%o5
	sub	%l4,	0x12E8,	%l2
	edge8l	%o6,	%i5,	%o7
	add	%l0,	%l3,	%g7
	movne	%xcc,	%g3,	%l1
	fcmpes	%fcc1,	%f26,	%f19
	xorcc	%i2,	0x0AF7,	%i3
	srl	%i1,	0x1D,	%g5
	smulcc	%g2,	0x0F7E,	%l5
	xnor	%i0,	0x1985,	%o0
	ldsw	[%l7 + 0x74],	%o3
	mulscc	%o4,	0x16E4,	%i4
	andncc	%g4,	%l6,	%i6
	fmovdpos	%icc,	%f22,	%f5
	smulcc	%i7,	%o1,	%g6
	fpsub16	%f18,	%f22,	%f24
	fcmps	%fcc2,	%f14,	%f20
	sra	%o2,	%o5,	%l4
	mova	%xcc,	%l2,	%g1
	array8	%o6,	%i5,	%l0
	fcmple16	%f6,	%f26,	%o7
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f30
	srax	%l3,	%g3,	%l1
	udiv	%g7,	0x1E32,	%i3
	fmovsvc	%icc,	%f21,	%f28
	orn	%i1,	0x1005,	%g5
	edge32n	%g2,	%l5,	%i0
	movl	%icc,	%i2,	%o0
	fmovdl	%xcc,	%f24,	%f0
	st	%f30,	[%l7 + 0x68]
	fmovrdgez	%o3,	%f16,	%f30
	fmovdne	%icc,	%f11,	%f30
	srlx	%i4,	%o4,	%l6
	fmovda	%xcc,	%f28,	%f3
	subc	%g4,	%i7,	%i6
	edge8ln	%g6,	%o1,	%o2
	movl	%icc,	%o5,	%l4
	addc	%l2,	0x1A73,	%g1
	xnorcc	%i5,	%l0,	%o7
	sra	%o6,	%l3,	%g3
	movrlz	%l1,	%g7,	%i1
	xnorcc	%g5,	%g2,	%l5
	sir	0x143A
	movpos	%icc,	%i0,	%i2
	sth	%i3,	[%l7 + 0x4E]
	movrlz	%o0,	%i4,	%o4
	alignaddr	%o3,	%g4,	%l6
	srax	%i7,	0x0B,	%g6
	fnors	%f25,	%f2,	%f11
	bshuffle	%f20,	%f2,	%f26
	ldd	[%l7 + 0x38],	%f14
	faligndata	%f0,	%f28,	%f14
	edge16	%i6,	%o1,	%o2
	fmovsle	%xcc,	%f6,	%f23
	edge8n	%o5,	%l4,	%g1
	array16	%l2,	%l0,	%o7
	subcc	%o6,	%i5,	%g3
	edge16	%l1,	%g7,	%i1
	ldsw	[%l7 + 0x1C],	%g5
	andncc	%g2,	%l5,	%i0
	andcc	%l3,	%i2,	%o0
	fmovd	%f10,	%f18
	movvc	%xcc,	%i4,	%i3
	ldsh	[%l7 + 0x76],	%o4
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%o2
	fpmerge	%f0,	%f19,	%f28
	ldub	[%l7 + 0x7B],	%l6
	ldx	[%l7 + 0x60],	%i7
	movvc	%xcc,	%g6,	%g4
	subcc	%o1,	0x0B02,	%o2
	movpos	%icc,	%i6,	%l4
	movn	%icc,	%g1,	%l2
	movvs	%xcc,	%l0,	%o5
	mulscc	%o7,	%i5,	%g3
	sllx	%l1,	0x05,	%g7
	xnorcc	%o6,	0x1372,	%i1
	movvc	%icc,	%g5,	%g2
	edge8	%l5,	%i0,	%l3
	addccc	%o0,	%i4,	%i3
	sdivx	%i2,	0x0E6C,	%o3
	fmovdpos	%xcc,	%f19,	%f9
	movvs	%xcc,	%l6,	%i7
	mova	%xcc,	%o4,	%g6
	movrlz	%o1,	0x29C,	%g4
	orn	%o2,	0x0742,	%i6
	and	%g1,	0x080C,	%l4
	alignaddrl	%l2,	%l0,	%o7
	edge8l	%o5,	%g3,	%i5
	and	%g7,	%o6,	%l1
	movvc	%icc,	%i1,	%g2
	sdiv	%g5,	0x1B57,	%l5
	fmovsvs	%xcc,	%f26,	%f10
	fandnot1	%f4,	%f14,	%f8
	sdivcc	%l3,	0x09B1,	%i0
	sdiv	%o0,	0x09D0,	%i3
	ld	[%l7 + 0x0C],	%f13
	fmul8x16al	%f22,	%f20,	%f18
	fmovscs	%icc,	%f22,	%f10
	array32	%i2,	%o3,	%i4
	restore %l6, 0x145A, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g6,	%o4
	edge8ln	%o1,	%o2,	%g4
	ldd	[%l7 + 0x18],	%g0
	movg	%xcc,	%l4,	%l2
	movre	%l0,	0x015,	%o7
	movrne	%i6,	0x260,	%g3
	xnor	%i5,	%g7,	%o6
	umulcc	%o5,	%l1,	%g2
	xnor	%i1,	%l5,	%g5
	sra	%i0,	0x12,	%l3
	save %o0, 0x0E5F, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x50, %i4
	lduw	[%l7 + %i4],	%i3
	edge8n	%o3,	%i4,	%i7
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	restore %o2, 0x0FEF, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x20],	%f26
	fcmps	%fcc1,	%f15,	%f15
	mulx	%g1,	0x163D,	%o1
	move	%icc,	%l2,	%l4
	andncc	%o7,	%l0,	%i6
	fones	%f9
	mulx	%g3,	%i5,	%g7
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	fmovrdne	%i1,	%f6,	%f16
	fcmpes	%fcc3,	%f5,	%f20
	stw	%l1,	[%l7 + 0x70]
	pdist	%f22,	%f4,	%f28
	sra	%g5,	0x17,	%i0
	fmovscc	%icc,	%f0,	%f7
	fmovs	%f18,	%f9
	orn	%l5,	0x0EB5,	%o0
	edge32l	%l3,	%i2,	%i3
	sdivcc	%o3,	0x1B2E,	%i4
	movcs	%icc,	%g6,	%l6
	edge16ln	%o4,	%i7,	%o2
	edge8l	%g1,	%o1,	%g4
	movvc	%icc,	%l4,	%o7
	fnegd	%f14,	%f26
	fexpand	%f0,	%f10
	xor	%l0,	%i6,	%l2
	sub	%g3,	0x1467,	%g7
	fcmped	%fcc2,	%f12,	%f4
	fsrc2	%f10,	%f28
	edge32n	%i5,	%o6,	%o5
	smul	%g2,	%l1,	%i1
	fzeros	%f9
	movgu	%xcc,	%g5,	%i0
	srax	%o0,	%l5,	%i2
	faligndata	%f12,	%f2,	%f28
	array8	%i3,	%l3,	%o3
	movleu	%xcc,	%g6,	%l6
	ldsh	[%l7 + 0x62],	%o4
	edge8	%i4,	%i7,	%o2
	fmovd	%f18,	%f2
	umul	%o1,	0x02B4,	%g1
	fxnors	%f18,	%f16,	%f24
	fmovd	%f4,	%f2
	or	%g4,	0x0217,	%o7
	fandnot2s	%f6,	%f14,	%f8
	fornot2	%f20,	%f20,	%f26
	fnegd	%f22,	%f6
	move	%xcc,	%l4,	%i6
	xor	%l2,	0x1A4C,	%g3
	movneg	%xcc,	%g7,	%l0
	movrgez	%o6,	0x0DA,	%i5
	fcmpes	%fcc1,	%f7,	%f31
	mulscc	%g2,	%o5,	%i1
	edge32	%l1,	%g5,	%i0
	orncc	%l5,	%o0,	%i2
	sub	%l3,	0x0847,	%o3
	subccc	%g6,	%i3,	%l6
	fornot2	%f10,	%f6,	%f8
	add	%i4,	0x0584,	%i7
	fmovse	%icc,	%f22,	%f16
	fmovrdlz	%o4,	%f18,	%f16
	orn	%o2,	%o1,	%g4
	umul	%g1,	%o7,	%l4
	fmovdle	%icc,	%f22,	%f11
	edge32ln	%l2,	%i6,	%g3
	ldsw	[%l7 + 0x34],	%l0
	movl	%icc,	%o6,	%g7
	movneg	%xcc,	%g2,	%o5
	movvc	%xcc,	%i5,	%l1
	movvs	%xcc,	%i1,	%g5
	fmovd	%f12,	%f24
	srl	%i0,	%l5,	%i2
	movrgz	%o0,	%l3,	%g6
	sll	%o3,	0x0C,	%i3
	movge	%icc,	%i4,	%l6
	fpsub32	%f30,	%f12,	%f14
	umulcc	%o4,	%o2,	%o1
	udivcc	%i7,	0x15F4,	%g1
	fmuld8ulx16	%f24,	%f27,	%f2
	edge32	%o7,	%g4,	%l2
	movrlez	%i6,	%g3,	%l4
	xnor	%o6,	0x156A,	%l0
	addcc	%g7,	0x13CF,	%g2
	xorcc	%o5,	%l1,	%i5
	save %i1, %g5, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i0,	[%l7 + 0x5F]
	ldd	[%l7 + 0x10],	%f12
	edge32ln	%i2,	%o0,	%g6
	edge32l	%l3,	%i3,	%i4
	fmovdl	%icc,	%f24,	%f10
	movvc	%icc,	%l6,	%o4
	fpadd32s	%f14,	%f9,	%f28
	edge32ln	%o2,	%o1,	%o3
	fmovdl	%icc,	%f25,	%f23
	edge8l	%g1,	%o7,	%i7
	fcmpne16	%f26,	%f4,	%l2
	movrne	%i6,	%g4,	%l4
	fmovrsgez	%g3,	%f6,	%f0
	alignaddrl	%l0,	%o6,	%g2
	ldd	[%l7 + 0x10],	%g6
	movge	%xcc,	%o5,	%l1
	fmovdneg	%icc,	%f14,	%f24
	fxnors	%f26,	%f5,	%f6
	movrgz	%i5,	0x13C,	%i1
	fornot1s	%f16,	%f17,	%f12
	ldd	[%l7 + 0x28],	%l4
	fpack32	%f16,	%f4,	%f26
	movle	%icc,	%i0,	%g5
	fpadd32	%f24,	%f12,	%f2
	movg	%xcc,	%i2,	%g6
	srlx	%l3,	0x06,	%o0
	sub	%i4,	0x16F5,	%i3
	stb	%l6,	[%l7 + 0x7E]
	ldsw	[%l7 + 0x54],	%o4
	lduw	[%l7 + 0x68],	%o1
	pdist	%f26,	%f2,	%f28
	ldd	[%l7 + 0x08],	%f4
	movn	%xcc,	%o3,	%o2
	movl	%xcc,	%g1,	%o7
	movge	%xcc,	%i7,	%i6
	umulcc	%l2,	%l4,	%g3
	array16	%g4,	%l0,	%g2
	popc	%g7,	%o6
	movre	%l1,	%i5,	%o5
	fzero	%f16
	fnand	%f16,	%f10,	%f2
	movpos	%icc,	%i1,	%i0
	ldd	[%l7 + 0x38],	%g4
	alignaddrl	%l5,	%g6,	%l3
	lduh	[%l7 + 0x52],	%i2
	edge8l	%o0,	%i3,	%l6
	lduw	[%l7 + 0x3C],	%o4
	sethi	0x009E,	%i4
	sth	%o1,	[%l7 + 0x44]
	lduw	[%l7 + 0x6C],	%o3
	edge8n	%g1,	%o2,	%o7
	fmovsvs	%icc,	%f0,	%f19
	stw	%i6,	[%l7 + 0x58]
	movpos	%icc,	%i7,	%l4
	std	%f10,	[%l7 + 0x70]
	subcc	%g3,	%l2,	%l0
	edge8l	%g4,	%g7,	%o6
	fmovrse	%g2,	%f11,	%f13
	fcmpgt16	%f20,	%f28,	%l1
	edge32ln	%i5,	%o5,	%i0
	movge	%icc,	%g5,	%l5
	orcc	%i1,	%g6,	%l3
	fcmpeq32	%f30,	%f12,	%i2
	fpack16	%f18,	%f15
	movrlz	%o0,	%l6,	%i3
	sdivcc	%o4,	0x0E50,	%o1
	lduh	[%l7 + 0x0C],	%o3
	sdiv	%g1,	0x0C08,	%i4
	siam	0x6
	fmovsa	%icc,	%f12,	%f26
	or	%o2,	%i6,	%o7
	edge16	%i7,	%l4,	%g3
	udiv	%l0,	0x05FE,	%g4
	ldub	[%l7 + 0x08],	%l2
	edge16	%g7,	%o6,	%l1
	sir	0x1FEC
	lduw	[%l7 + 0x30],	%g2
	fmovsge	%xcc,	%f26,	%f13
	fmovdne	%icc,	%f5,	%f13
	xor	%o5,	%i5,	%i0
	umul	%g5,	0x1E98,	%l5
	alignaddrl	%g6,	%i1,	%l3
	movcc	%icc,	%i2,	%o0
	edge16n	%l6,	%o4,	%o1
	sll	%i3,	%g1,	%o3
	mova	%xcc,	%o2,	%i4
	sub	%o7,	0x06B4,	%i6
	fmovdl	%icc,	%f10,	%f13
	fcmpne16	%f12,	%f6,	%l4
	popc	%g3,	%i7
	or	%g4,	0x1F3B,	%l0
	fsrc2s	%f0,	%f3
	faligndata	%f6,	%f26,	%f12
	edge32n	%l2,	%o6,	%l1
	stb	%g7,	[%l7 + 0x18]
	movleu	%icc,	%g2,	%i5
	sir	0x1673
	fmovdvs	%xcc,	%f20,	%f21
	xnorcc	%i0,	0x00E3,	%o5
	nop
	set	0x7C, %l4
	lduw	[%l7 + %l4],	%l5
	edge8ln	%g5,	%i1,	%l3
	stb	%g6,	[%l7 + 0x08]
	fcmple32	%f4,	%f10,	%i2
	fpsub32s	%f18,	%f21,	%f7
	nop
	set	0x12, %i0
	ldub	[%l7 + %i0],	%l6
	fnegs	%f26,	%f2
	edge32l	%o0,	%o4,	%o1
	movne	%xcc,	%i3,	%o3
	movcs	%icc,	%o2,	%i4
	sdiv	%g1,	0x0EB6,	%i6
	movcs	%xcc,	%o7,	%g3
	sth	%l4,	[%l7 + 0x64]
	movrlez	%i7,	0x389,	%g4
	std	%f28,	[%l7 + 0x38]
	subccc	%l2,	0x1DA4,	%l0
	array8	%l1,	%o6,	%g7
	movvc	%icc,	%i5,	%g2
	movrne	%i0,	%l5,	%g5
	fpadd16s	%f16,	%f26,	%f4
	edge8ln	%o5,	%i1,	%g6
	orn	%l3,	0x1FA0,	%i2
	fcmpgt32	%f30,	%f28,	%l6
	fcmps	%fcc2,	%f14,	%f5
	fmovrdgez	%o4,	%f14,	%f12
	subc	%o0,	%i3,	%o1
	edge8l	%o3,	%o2,	%i4
	std	%f10,	[%l7 + 0x28]
	fmovrslz	%i6,	%f29,	%f27
	srlx	%o7,	0x06,	%g1
	movleu	%icc,	%g3,	%i7
	fpsub16s	%f31,	%f5,	%f7
	alignaddrl	%g4,	%l4,	%l0
	array8	%l2,	%l1,	%o6
	fmul8x16al	%f16,	%f27,	%f4
	movgu	%xcc,	%g7,	%g2
	faligndata	%f12,	%f2,	%f14
	movcc	%icc,	%i0,	%i5
	movvc	%xcc,	%l5,	%o5
	fmovdleu	%xcc,	%f9,	%f21
	movg	%xcc,	%g5,	%i1
	movrlz	%l3,	%g6,	%i2
	addcc	%l6,	%o0,	%o4
	stx	%i3,	[%l7 + 0x28]
	addccc	%o3,	0x1A75,	%o2
	nop
	set	0x70, %g2
	lduw	[%l7 + %g2],	%i4
	popc	0x143B,	%o1
	fmovdge	%icc,	%f27,	%f23
	mulx	%o7,	0x0BAF,	%g1
	movpos	%icc,	%i6,	%g3
	lduh	[%l7 + 0x62],	%g4
	subccc	%l4,	%l0,	%l2
	movge	%icc,	%l1,	%o6
	fpadd32s	%f3,	%f9,	%f8
	movgu	%icc,	%i7,	%g7
	fpsub32s	%f1,	%f10,	%f30
	restore %g2, %i0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i5,	%g5,	%i1
	std	%f24,	[%l7 + 0x30]
	fmovrdne	%l3,	%f20,	%f12
	for	%f28,	%f6,	%f4
	sethi	0x09E9,	%o5
	movge	%xcc,	%g6,	%i2
	subcc	%o0,	%o4,	%i3
	alignaddrl	%l6,	%o3,	%i4
	sllx	%o1,	%o2,	%g1
	orn	%o7,	0x0FB6,	%g3
	umul	%g4,	0x0FA6,	%l4
	for	%f18,	%f12,	%f10
	fmovde	%icc,	%f4,	%f23
	movle	%xcc,	%l0,	%i6
	popc	0x0144,	%l2
	ld	[%l7 + 0x60],	%f18
	ldsw	[%l7 + 0x0C],	%l1
	movcs	%xcc,	%i7,	%g7
	fnot1	%f4,	%f24
	movre	%g2,	0x375,	%o6
	udivx	%i0,	0x07D1,	%i5
	fxor	%f4,	%f12,	%f0
	sdivx	%g5,	0x093C,	%i1
	umul	%l3,	0x127B,	%o5
	fnand	%f20,	%f8,	%f18
	st	%f31,	[%l7 + 0x10]
	array16	%l5,	%i2,	%o0
	ldsb	[%l7 + 0x4C],	%o4
	xorcc	%i3,	%g6,	%l6
	fmovs	%f22,	%f25
	fsrc2s	%f3,	%f5
	lduw	[%l7 + 0x58],	%i4
	stx	%o1,	[%l7 + 0x28]
	stb	%o3,	[%l7 + 0x1A]
	umul	%g1,	0x02AD,	%o7
	ldx	[%l7 + 0x78],	%g3
	ldd	[%l7 + 0x28],	%f4
	umulcc	%o2,	%l4,	%g4
	and	%l0,	%l2,	%i6
	bshuffle	%f6,	%f20,	%f8
	fmovdg	%xcc,	%f14,	%f23
	movvc	%xcc,	%i7,	%g7
	stw	%g2,	[%l7 + 0x18]
	fpackfix	%f12,	%f15
	movl	%xcc,	%l1,	%i0
	sdivcc	%i5,	0x14DE,	%o6
	stb	%i1,	[%l7 + 0x62]
	sir	0x1B55
	smul	%l3,	0x193D,	%g5
	movvc	%icc,	%o5,	%i2
	fpsub16	%f10,	%f4,	%f18
	xorcc	%o0,	0x0D47,	%o4
	movrlz	%l5,	%i3,	%g6
	st	%f18,	[%l7 + 0x78]
	fcmpeq16	%f24,	%f4,	%l6
	edge16n	%o1,	%i4,	%g1
	save %o7, %g3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f0,	%f6,	%f0
	andn	%l4,	%o3,	%l0
	stb	%g4,	[%l7 + 0x41]
	st	%f30,	[%l7 + 0x4C]
	movvs	%icc,	%i6,	%i7
	array32	%g7,	%l2,	%l1
	movrlz	%i0,	%g2,	%o6
	sdivcc	%i5,	0x015E,	%i1
	ldsw	[%l7 + 0x30],	%l3
	movle	%icc,	%o5,	%i2
	udivx	%o0,	0x06E0,	%o4
	umulcc	%g5,	0x0F12,	%l5
	srl	%g6,	0x14,	%i3
	srl	%l6,	0x13,	%i4
	fnegd	%f2,	%f10
	save %g1, %o1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o2,	0x05E,	%l4
	movvs	%icc,	%o3,	%l0
	fmovsgu	%xcc,	%f12,	%f23
	edge8	%g4,	%i6,	%i7
	fpadd32s	%f0,	%f29,	%f9
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	sub	%i0,	%l2,	%o6
	srlx	%i5,	0x10,	%i1
	stb	%l3,	[%l7 + 0x40]
	subc	%g2,	0x11F3,	%o5
	srax	%i2,	0x1A,	%o0
	addcc	%o4,	0x1D17,	%g5
	lduh	[%l7 + 0x08],	%g6
	fmovsvs	%xcc,	%f9,	%f27
	alignaddrl	%l5,	%i3,	%l6
	addc	%g1,	%o1,	%o7
	edge8ln	%o2,	%l4,	%i4
	ldd	[%l7 + 0x48],	%o2
	xor	%g4,	0x1C84,	%l0
	fsrc2	%f26,	%f18
	xor	%i7,	%i6,	%g7
	fmovsgu	%xcc,	%f30,	%f9
	movge	%icc,	%l1,	%i0
	movleu	%xcc,	%l2,	%o6
	movg	%icc,	%g3,	%i5
	sir	0x186C
	movl	%xcc,	%l3,	%i1
	addcc	%g2,	%i2,	%o5
	fmovse	%icc,	%f25,	%f18
	edge8l	%o0,	%g5,	%g6
	ldd	[%l7 + 0x68],	%l4
	fandnot2	%f4,	%f28,	%f4
	srax	%i3,	0x11,	%o4
	movcs	%xcc,	%g1,	%l6
	movrgz	%o1,	0x244,	%o2
	and	%o7,	%i4,	%l4
	andcc	%o3,	%g4,	%l0
	fmovrdgz	%i7,	%f8,	%f18
	addcc	%g7,	0x1CF1,	%l1
	popc	0x0559,	%i6
	nop
	set	0x2A, %g7
	sth	%i0,	[%l7 + %g7]
	stb	%l2,	[%l7 + 0x4B]
	fxnors	%f2,	%f1,	%f3
	and	%g3,	0x13D7,	%o6
	add	%i5,	%i1,	%l3
	edge8	%g2,	%o5,	%o0
	mova	%icc,	%i2,	%g5
	umulcc	%l5,	0x1AE5,	%g6
	fmovdvc	%xcc,	%f11,	%f14
	movrne	%i3,	%o4,	%g1
	fcmpeq16	%f26,	%f14,	%o1
	movpos	%icc,	%l6,	%o7
	ldd	[%l7 + 0x38],	%f2
	movre	%o2,	0x344,	%i4
	fsrc2	%f30,	%f20
	edge32	%o3,	%l4,	%l0
	movvc	%xcc,	%g4,	%i7
	ldsw	[%l7 + 0x28],	%g7
	ldd	[%l7 + 0x10],	%f30
	fcmpd	%fcc3,	%f22,	%f4
	andncc	%i6,	%l1,	%l2
	addc	%g3,	%o6,	%i0
	lduh	[%l7 + 0x26],	%i1
	movl	%icc,	%i5,	%l3
	fnand	%f30,	%f26,	%f2
	save %o5, 0x1425, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x30],	%i2
	srlx	%g5,	0x14,	%l5
	orcc	%o0,	%i3,	%o4
	popc	0x09DC,	%g6
	sll	%g1,	0x02,	%l6
	movle	%icc,	%o7,	%o2
	orn	%i4,	%o3,	%o1
	movrlz	%l4,	%l0,	%i7
	alignaddrl	%g4,	%i6,	%g7
	fcmpeq16	%f6,	%f30,	%l1
	srl	%g3,	0x12,	%l2
	st	%f11,	[%l7 + 0x44]
	movn	%xcc,	%i0,	%o6
	ldd	[%l7 + 0x68],	%f16
	fcmps	%fcc3,	%f30,	%f19
	mulx	%i5,	0x1DB4,	%l3
	movrne	%o5,	%g2,	%i1
	movvs	%icc,	%g5,	%i2
	fnors	%f31,	%f19,	%f19
	andcc	%l5,	%i3,	%o0
	fmovsleu	%icc,	%f9,	%f4
	mulx	%g6,	0x15D3,	%o4
	edge16	%g1,	%o7,	%o2
	xorcc	%i4,	%o3,	%l6
	fone	%f6
	save %o1, 0x1941, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %l4, 0x0F10, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%i6,	%g7
	fnegs	%f29,	%f16
	ldsh	[%l7 + 0x3C],	%l1
	ld	[%l7 + 0x68],	%f12
	ldd	[%l7 + 0x70],	%g2
	st	%f11,	[%l7 + 0x38]
	sll	%l2,	0x04,	%i0
	ldsw	[%l7 + 0x68],	%i7
	and	%o6,	0x0211,	%i5
	edge32n	%o5,	%l3,	%g2
	addc	%i1,	0x064A,	%g5
	edge8n	%l5,	%i2,	%i3
	orncc	%g6,	0x056B,	%o0
	movpos	%xcc,	%o4,	%o7
	movcs	%icc,	%g1,	%i4
	umul	%o2,	%o3,	%l6
	ldd	[%l7 + 0x38],	%f0
	edge8l	%o1,	%l0,	%g4
	fnands	%f22,	%f10,	%f10
	fandnot2s	%f0,	%f28,	%f15
	movleu	%xcc,	%l4,	%g7
	movleu	%icc,	%i6,	%l1
	movle	%icc,	%g3,	%i0
	movrlez	%l2,	0x368,	%o6
	fpadd16s	%f14,	%f3,	%f15
	edge32l	%i7,	%i5,	%o5
	sllx	%g2,	0x13,	%i1
	add	%l3,	%g5,	%i2
	edge32n	%i3,	%l5,	%o0
	udiv	%o4,	0x1324,	%g6
	movn	%xcc,	%g1,	%o7
	mova	%xcc,	%i4,	%o3
	stb	%o2,	[%l7 + 0x34]
	orn	%l6,	%l0,	%g4
	sth	%o1,	[%l7 + 0x6C]
	movvc	%xcc,	%l4,	%i6
	array8	%g7,	%g3,	%i0
	ldx	[%l7 + 0x60],	%l1
	edge16n	%o6,	%i7,	%l2
	sth	%i5,	[%l7 + 0x0C]
	lduw	[%l7 + 0x7C],	%o5
	fmovdn	%icc,	%f14,	%f26
	edge32	%i1,	%l3,	%g5
	orcc	%i2,	0x1CB2,	%g2
	xor	%l5,	%o0,	%i3
	subc	%g6,	0x10B7,	%o4
	array16	%g1,	%i4,	%o7
	popc	0x0438,	%o3
	save %o2, 0x1BC6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g4,	%l0,	%o1
	xorcc	%l4,	0x1ACE,	%g7
	fornot1	%f16,	%f10,	%f14
	subccc	%g3,	0x1F36,	%i0
	andncc	%l1,	%i6,	%i7
	xor	%o6,	%l2,	%o5
	array16	%i5,	%l3,	%i1
	xorcc	%i2,	0x0F58,	%g5
	movge	%icc,	%l5,	%g2
	ldsb	[%l7 + 0x7A],	%i3
	movne	%icc,	%g6,	%o4
	fxnors	%f30,	%f5,	%f7
	alignaddr	%o0,	%i4,	%o7
	xnor	%o3,	0x1823,	%o2
	sir	0x1AF3
	move	%xcc,	%l6,	%g4
	srl	%l0,	0x02,	%g1
	orncc	%o1,	%l4,	%g7
	movcc	%icc,	%g3,	%i0
	add	%l1,	%i7,	%i6
	fpadd32s	%f23,	%f16,	%f4
	fxnor	%f24,	%f28,	%f4
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	movrne	%i5,	%o6,	%i1
	movcc	%xcc,	%i2,	%l3
	ldd	[%l7 + 0x28],	%f10
	array16	%g5,	%l5,	%g2
	movg	%xcc,	%g6,	%o4
	alignaddr	%i3,	%i4,	%o0
	fnand	%f18,	%f0,	%f12
	std	%f12,	[%l7 + 0x38]
	fmovdge	%icc,	%f10,	%f26
	nop
	set	0x18, %g6
	stx	%o7,	[%l7 + %g6]
	addccc	%o3,	0x068B,	%l6
	ld	[%l7 + 0x14],	%f12
	stw	%o2,	[%l7 + 0x2C]
	stx	%g4,	[%l7 + 0x68]
	edge32ln	%l0,	%g1,	%l4
	alignaddrl	%o1,	%g7,	%i0
	fnand	%f4,	%f8,	%f2
	save %l1, %g3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i6,	%o5,	%i5
	ldd	[%l7 + 0x28],	%o6
	fmovdge	%icc,	%f21,	%f12
	edge16ln	%l2,	%i2,	%i1
	orn	%l3,	%g5,	%l5
	movneg	%icc,	%g6,	%o4
	array32	%g2,	%i3,	%i4
	xorcc	%o7,	0x1F23,	%o0
	stw	%o3,	[%l7 + 0x44]
	sth	%o2,	[%l7 + 0x20]
	movcs	%icc,	%l6,	%l0
	fpadd16s	%f6,	%f1,	%f1
	movpos	%xcc,	%g1,	%g4
	edge32l	%o1,	%l4,	%i0
	fmovrdlez	%g7,	%f30,	%f26
	array8	%l1,	%i7,	%g3
	ldsw	[%l7 + 0x1C],	%i6
	fnors	%f24,	%f18,	%f11
	fxors	%f20,	%f12,	%f7
	movrlz	%o5,	%i5,	%o6
	array16	%l2,	%i2,	%l3
	subcc	%i1,	%g5,	%g6
	orcc	%l5,	0x18CC,	%g2
	movrne	%o4,	0x362,	%i4
	move	%xcc,	%o7,	%i3
	movge	%icc,	%o0,	%o3
	fnot2s	%f2,	%f6
	alignaddr	%o2,	%l0,	%l6
	st	%f1,	[%l7 + 0x5C]
	movrgz	%g4,	0x1EB,	%o1
	sdiv	%g1,	0x0BB6,	%l4
	addc	%i0,	%l1,	%i7
	fmovsneg	%xcc,	%f7,	%f18
	ld	[%l7 + 0x38],	%f23
	stx	%g3,	[%l7 + 0x48]
	fcmpd	%fcc2,	%f6,	%f22
	movge	%xcc,	%i6,	%o5
	sdiv	%g7,	0x19DF,	%o6
	udiv	%l2,	0x142C,	%i2
	movrlz	%i5,	0x370,	%i1
	udivx	%l3,	0x0DD4,	%g6
	subc	%g5,	%l5,	%g2
	xnorcc	%o4,	0x1E18,	%o7
	movrlez	%i4,	%i3,	%o0
	edge8l	%o3,	%l0,	%l6
	edge8	%g4,	%o1,	%g1
	fmovsne	%icc,	%f27,	%f6
	edge32n	%o2,	%i0,	%l1
	array8	%i7,	%l4,	%g3
	array16	%i6,	%g7,	%o5
	fmovrdlz	%l2,	%f0,	%f16
	lduh	[%l7 + 0x66],	%o6
	array16	%i2,	%i1,	%l3
	movneg	%xcc,	%i5,	%g6
	xorcc	%l5,	%g2,	%o4
	edge8n	%g5,	%o7,	%i4
	ldub	[%l7 + 0x15],	%i3
	movvs	%xcc,	%o0,	%o3
	movvs	%xcc,	%l0,	%g4
	edge32n	%l6,	%o1,	%o2
	movvc	%xcc,	%i0,	%l1
	smulcc	%g1,	0x1033,	%i7
	srl	%g3,	0x04,	%i6
	fmovsvs	%icc,	%f8,	%f1
	udivcc	%l4,	0x14BC,	%o5
	sth	%l2,	[%l7 + 0x5A]
	fxors	%f17,	%f24,	%f28
	movle	%icc,	%g7,	%i2
	subcc	%o6,	%l3,	%i1
	mulx	%g6,	0x012E,	%i5
	ldx	[%l7 + 0x10],	%l5
	subc	%g2,	%g5,	%o7
	xnor	%i4,	%o4,	%o0
	fcmpeq32	%f10,	%f24,	%i3
	fones	%f29
	edge8	%o3,	%l0,	%g4
	xnor	%l6,	0x061D,	%o1
	srax	%i0,	0x0B,	%l1
	mulx	%o2,	%i7,	%g1
	add	%g3,	0x07E4,	%l4
	sir	0x0CB1
	edge32n	%i6,	%o5,	%l2
	and	%g7,	0x1616,	%o6
	srl	%i2,	0x03,	%i1
	array8	%g6,	%l3,	%i5
	movrlez	%l5,	%g2,	%o7
	sll	%i4,	0x17,	%g5
	or	%o0,	0x1876,	%i3
	std	%f26,	[%l7 + 0x78]
	ld	[%l7 + 0x54],	%f18
	fpadd16	%f12,	%f4,	%f10
	sdivx	%o3,	0x0783,	%o4
	smulcc	%g4,	%l6,	%o1
	mulscc	%l0,	%i0,	%l1
	fxnor	%f16,	%f6,	%f12
	fornot2	%f14,	%f10,	%f16
	fmovdpos	%icc,	%f15,	%f0
	srax	%o2,	0x1C,	%i7
	fpack16	%f10,	%f1
	orncc	%g3,	0x01F7,	%l4
	movrgez	%g1,	0x3D1,	%i6
	fpsub32	%f18,	%f2,	%f20
	addc	%o5,	%l2,	%g7
	edge32n	%i2,	%o6,	%i1
	array16	%l3,	%i5,	%l5
	mulscc	%g6,	0x0582,	%g2
	addccc	%i4,	0x03F3,	%o7
	fandnot1s	%f27,	%f0,	%f16
	fcmple16	%f16,	%f30,	%o0
	udivcc	%i3,	0x0F6F,	%o3
	udivcc	%g5,	0x00C5,	%o4
	movrlz	%l6,	0x05B,	%o1
	sdiv	%l0,	0x1ABD,	%i0
	movgu	%icc,	%l1,	%g4
	movneg	%icc,	%o2,	%g3
	restore %i7, %g1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l4,	[%l7 + 0x60]
	fmovdn	%xcc,	%f11,	%f11
	movl	%xcc,	%o5,	%l2
	array8	%i2,	%g7,	%o6
	udivx	%l3,	0x0A72,	%i5
	addc	%l5,	0x1C49,	%i1
	array32	%g6,	%g2,	%i4
	xor	%o7,	%o0,	%o3
	udivx	%i3,	0x117F,	%g5
	umul	%l6,	0x0B9B,	%o4
	fmul8sux16	%f30,	%f4,	%f14
	array8	%o1,	%l0,	%l1
	edge32l	%i0,	%g4,	%o2
	movvs	%icc,	%g3,	%g1
	sdivcc	%i7,	0x086D,	%i6
	fmul8x16	%f13,	%f0,	%f28
	sdivcc	%o5,	0x08A2,	%l4
	srlx	%i2,	0x18,	%l2
	movrgez	%o6,	0x076,	%g7
	movneg	%icc,	%l3,	%i5
	mulx	%i1,	%g6,	%l5
	fmovdpos	%icc,	%f20,	%f8
	movrgez	%g2,	%i4,	%o0
	add	%o7,	0x01D3,	%o3
	fmovrdlez	%g5,	%f4,	%f8
	udiv	%i3,	0x15C2,	%o4
	movcs	%xcc,	%l6,	%o1
	fzeros	%f19
	sdivcc	%l0,	0x15CF,	%l1
	ld	[%l7 + 0x3C],	%f8
	xnorcc	%i0,	0x05AF,	%o2
	fmovsg	%icc,	%f1,	%f4
	subcc	%g3,	%g4,	%g1
	fsrc2	%f28,	%f26
	or	%i7,	0x1D72,	%i6
	movvs	%xcc,	%o5,	%i2
	xnor	%l4,	%o6,	%l2
	fmovdcc	%icc,	%f31,	%f11
	array16	%l3,	%g7,	%i5
	lduw	[%l7 + 0x1C],	%g6
	smulcc	%l5,	%i1,	%i4
	edge8	%g2,	%o7,	%o3
	sethi	0x191A,	%g5
	xorcc	%o0,	%o4,	%l6
	mulscc	%i3,	0x1295,	%o1
	fmovdvs	%xcc,	%f4,	%f31
	edge16n	%l0,	%l1,	%i0
	orcc	%o2,	%g4,	%g3
	addccc	%g1,	%i6,	%i7
	fcmpne32	%f16,	%f8,	%i2
	mulx	%o5,	0x0217,	%l4
	fmovdne	%icc,	%f11,	%f3
	fmovdvc	%icc,	%f11,	%f29
	orn	%l2,	0x149A,	%l3
	mova	%xcc,	%o6,	%g7
	addcc	%i5,	0x1950,	%g6
	movn	%icc,	%l5,	%i4
	fmovdge	%icc,	%f27,	%f15
	movl	%icc,	%i1,	%o7
	movrne	%g2,	%g5,	%o0
	udivcc	%o4,	0x085B,	%l6
	ldsw	[%l7 + 0x74],	%i3
	siam	0x3
	mulscc	%o1,	%l0,	%l1
	add	%i0,	0x13A4,	%o3
	fcmpne32	%f10,	%f22,	%g4
	fzeros	%f14
	sub	%o2,	%g3,	%g1
	fpsub32	%f8,	%f18,	%f14
	movneg	%xcc,	%i6,	%i2
	edge16ln	%i7,	%l4,	%o5
	addc	%l3,	0x195F,	%l2
	mova	%icc,	%o6,	%g7
	sir	0x1514
	subccc	%g6,	%i5,	%i4
	xnor	%i1,	0x02AC,	%o7
	orncc	%g2,	0x04B7,	%g5
	sdivcc	%o0,	0x0DFE,	%l5
	movcc	%xcc,	%o4,	%l6
	movge	%xcc,	%i3,	%l0
	sethi	0x1947,	%o1
	fnand	%f2,	%f22,	%f18
	movrne	%l1,	%i0,	%o3
	movge	%icc,	%g4,	%g3
	xnorcc	%o2,	0x0FD7,	%i6
	orcc	%i2,	%i7,	%g1
	fsrc2s	%f31,	%f21
	sra	%o5,	0x10,	%l3
	fnot2	%f10,	%f30
	mulx	%l2,	%o6,	%g7
	nop
	set	0x5F, %i7
	stb	%l4,	[%l7 + %i7]
	ldx	[%l7 + 0x78],	%g6
	orncc	%i4,	%i1,	%o7
	movrlez	%i5,	0x041,	%g2
	fabsd	%f14,	%f16
	ld	[%l7 + 0x40],	%f8
	ld	[%l7 + 0x50],	%f16
	and	%g5,	0x157F,	%l5
	movcc	%icc,	%o0,	%o4
	movne	%icc,	%l6,	%l0
	addcc	%i3,	0x16F1,	%l1
	addccc	%i0,	0x00C1,	%o1
	alignaddr	%o3,	%g3,	%g4
	orncc	%i6,	0x11D0,	%o2
	xor	%i2,	%g1,	%i7
	subcc	%o5,	0x1380,	%l3
	addcc	%o6,	0x1A8B,	%g7
	sethi	0x182D,	%l2
	movcs	%icc,	%l4,	%g6
	fnands	%f23,	%f18,	%f31
	and	%i4,	0x0402,	%i1
	or	%o7,	0x11CD,	%i5
	umul	%g5,	%l5,	%o0
	stw	%o4,	[%l7 + 0x58]
	ldsh	[%l7 + 0x12],	%l6
	movpos	%xcc,	%l0,	%g2
	fsrc1s	%f1,	%f26
	sethi	0x0A55,	%l1
	ldx	[%l7 + 0x68],	%i0
	or	%o1,	0x054B,	%o3
	sllx	%g3,	%i3,	%i6
	movl	%icc,	%o2,	%i2
	stw	%g4,	[%l7 + 0x64]
	fornot2s	%f14,	%f28,	%f24
	smul	%i7,	0x0547,	%o5
	fpackfix	%f26,	%f7
	fmovsneg	%icc,	%f2,	%f19
	movrne	%g1,	%o6,	%g7
	addccc	%l2,	0x19B9,	%l3
	st	%f4,	[%l7 + 0x40]
	udivcc	%g6,	0x12C8,	%i4
	fandnot1	%f28,	%f8,	%f16
	array32	%l4,	%i1,	%i5
	xnor	%g5,	%o7,	%l5
	srl	%o0,	0x1F,	%o4
	fabsd	%f12,	%f16
	ld	[%l7 + 0x74],	%f0
	movle	%xcc,	%l6,	%l0
	save %g2, 0x141E, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i0,	%o3
	fmovsvc	%icc,	%f18,	%f18
	fnor	%f22,	%f30,	%f8
	edge8l	%g3,	%i3,	%i6
	fmovs	%f10,	%f21
	movvc	%xcc,	%o1,	%o2
	fpadd32	%f24,	%f30,	%f24
	subcc	%g4,	%i7,	%o5
	or	%i2,	%o6,	%g7
	edge32n	%l2,	%l3,	%g1
	array16	%i4,	%g6,	%i1
	fmul8x16al	%f5,	%f9,	%f30
	lduh	[%l7 + 0x26],	%i5
	movrgez	%g5,	0x2E3,	%l4
	fcmped	%fcc0,	%f20,	%f6
	xorcc	%l5,	%o7,	%o0
	movrgz	%l6,	0x2BD,	%o4
	fmovdneg	%icc,	%f21,	%f6
	fmovse	%icc,	%f10,	%f29
	movleu	%icc,	%l0,	%l1
	movrgz	%i0,	0x3D8,	%g2
	and	%o3,	%i3,	%g3
	udivcc	%o1,	0x1E43,	%i6
	srl	%g4,	0x01,	%i7
	xorcc	%o2,	0x1E7F,	%o5
	xnor	%i2,	%g7,	%o6
	umulcc	%l2,	0x0FA4,	%g1
	fmovdneg	%icc,	%f23,	%f10
	addccc	%i4,	0x1F73,	%l3
	fpsub32	%f0,	%f10,	%f26
	sll	%i1,	%i5,	%g6
	fmovdvs	%icc,	%f22,	%f21
	orn	%g5,	0x0D25,	%l4
	andcc	%o7,	0x00E1,	%l5
	fmul8x16	%f25,	%f24,	%f28
	or	%l6,	%o0,	%o4
	sub	%l1,	%l0,	%i0
	nop
	set	0x20, %l1
	ldx	[%l7 + %l1],	%g2
	movrne	%o3,	0x02D,	%i3
	sth	%o1,	[%l7 + 0x70]
	movleu	%icc,	%g3,	%i6
	movre	%g4,	%o2,	%o5
	fcmple16	%f20,	%f26,	%i7
	movrgz	%i2,	%g7,	%l2
	andncc	%o6,	%g1,	%l3
	sll	%i1,	%i5,	%g6
	sth	%g5,	[%l7 + 0x14]
	ldx	[%l7 + 0x78],	%i4
	mulscc	%l4,	%o7,	%l5
	ldsh	[%l7 + 0x1A],	%l6
	std	%f6,	[%l7 + 0x18]
	lduw	[%l7 + 0x4C],	%o0
	lduh	[%l7 + 0x18],	%o4
	edge16ln	%l1,	%l0,	%i0
	stx	%g2,	[%l7 + 0x58]
	mulscc	%o3,	%o1,	%i3
	mulx	%i6,	0x084D,	%g3
	orncc	%o2,	%g4,	%o5
	fornot2	%f22,	%f6,	%f2
	edge8l	%i2,	%g7,	%i7
	movneg	%icc,	%o6,	%g1
	movre	%l3,	%l2,	%i1
	fmovdneg	%xcc,	%f30,	%f16
	lduw	[%l7 + 0x34],	%g6
	edge8l	%g5,	%i5,	%l4
	edge8n	%o7,	%l5,	%i4
	orncc	%o0,	0x0146,	%l6
	movgu	%icc,	%o4,	%l1
	umulcc	%i0,	0x1790,	%l0
	addc	%g2,	%o3,	%o1
	udivx	%i6,	0x16B6,	%i3
	sdivcc	%g3,	0x06F4,	%g4
	fandnot2	%f28,	%f0,	%f14
	orn	%o2,	%o5,	%i2
	andcc	%g7,	%o6,	%i7
	sdivx	%l3,	0x1E48,	%g1
	smulcc	%l2,	0x17F5,	%i1
	array16	%g5,	%i5,	%g6
	lduw	[%l7 + 0x4C],	%o7
	fsrc1s	%f22,	%f15
	nop
	set	0x40, %o5
	ldsw	[%l7 + %o5],	%l5
	fcmpes	%fcc1,	%f9,	%f27
	udivx	%i4,	0x1F27,	%l4
	fmul8ulx16	%f4,	%f22,	%f8
	addcc	%o0,	0x1635,	%l6
	mulx	%o4,	0x1ECE,	%l1
	array32	%i0,	%l0,	%g2
	edge32l	%o3,	%o1,	%i6
	stb	%i3,	[%l7 + 0x72]
	lduh	[%l7 + 0x58],	%g3
	movg	%xcc,	%o2,	%o5
	edge32ln	%g4,	%i2,	%o6
	xnor	%g7,	0x0998,	%i7
	udivcc	%l3,	0x1433,	%l2
	xor	%g1,	%i1,	%i5
	st	%f7,	[%l7 + 0x48]
	for	%f16,	%f22,	%f6
	srax	%g5,	0x18,	%g6
	faligndata	%f20,	%f20,	%f20
	movrgez	%l5,	%i4,	%l4
	sdiv	%o0,	0x0DE7,	%o7
	movle	%xcc,	%o4,	%l6
	movpos	%icc,	%i0,	%l1
	sll	%g2,	0x02,	%o3
	movvc	%icc,	%l0,	%i6
	sth	%o1,	[%l7 + 0x66]
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	or	%g4,	%i2,	%i3
	sir	0x1581
	sir	0x106E
	edge8	%g7,	%o6,	%l3
	movne	%icc,	%l2,	%g1
	umul	%i7,	0x055B,	%i1
	movcc	%xcc,	%i5,	%g6
	nop
	set	0x40, %o4
	stw	%g5,	[%l7 + %o4]
	movvs	%icc,	%l5,	%l4
	nop
	set	0x1A, %o1
	lduh	[%l7 + %o1],	%o0
	movcs	%xcc,	%i4,	%o7
	movcs	%xcc,	%o4,	%i0
	fmovda	%icc,	%f24,	%f26
	smulcc	%l1,	%g2,	%l6
	edge32ln	%l0,	%o3,	%i6
	sdivx	%o1,	0x0C49,	%o2
	alignaddr	%g3,	%o5,	%i2
	movg	%xcc,	%i3,	%g7
	move	%icc,	%o6,	%l3
	orn	%l2,	0x1BAB,	%g4
	xor	%g1,	0x1EAC,	%i1
	fnor	%f4,	%f26,	%f2
	edge32	%i7,	%i5,	%g5
	or	%g6,	0x1937,	%l5
	lduh	[%l7 + 0x34],	%o0
	sdivx	%i4,	0x0C63,	%o7
	ldx	[%l7 + 0x28],	%o4
	subcc	%l4,	0x0CBC,	%i0
	movrlez	%g2,	%l6,	%l1
	ld	[%l7 + 0x6C],	%f5
	fcmpd	%fcc3,	%f2,	%f20
	fcmpd	%fcc1,	%f4,	%f0
	siam	0x4
	movpos	%icc,	%o3,	%l0
	subcc	%o1,	0x06E0,	%o2
	mova	%xcc,	%g3,	%i6
	ldd	[%l7 + 0x10],	%i2
	orcc	%o5,	0x0046,	%g7
	mova	%icc,	%o6,	%l3
	movre	%l2,	%g4,	%i3
	fmovsl	%icc,	%f20,	%f27
	move	%xcc,	%g1,	%i7
	fmovdgu	%xcc,	%f28,	%f1
	fcmpne16	%f10,	%f28,	%i5
	movrne	%i1,	0x0E8,	%g6
	fnor	%f8,	%f0,	%f30
	srl	%g5,	%l5,	%o0
	udivx	%i4,	0x006D,	%o7
	movvs	%icc,	%o4,	%i0
	move	%xcc,	%g2,	%l4
	sllx	%l1,	0x1E,	%l6
	fors	%f12,	%f15,	%f18
	orncc	%o3,	%o1,	%o2
	movrgz	%l0,	%i6,	%g3
	fnor	%f14,	%f28,	%f6
	lduw	[%l7 + 0x60],	%i2
	edge16	%o5,	%g7,	%o6
	movrlz	%l2,	0x28B,	%l3
	xorcc	%i3,	0x090E,	%g4
	fpack32	%f12,	%f24,	%f22
	array16	%g1,	%i7,	%i5
	std	%f12,	[%l7 + 0x28]
	xorcc	%i1,	0x017C,	%g5
	ldub	[%l7 + 0x24],	%g6
	subc	%o0,	0x1E07,	%i4
	fnot2s	%f5,	%f6
	movle	%icc,	%l5,	%o7
	sdiv	%o4,	0x036A,	%g2
	fpackfix	%f6,	%f14
	movgu	%xcc,	%i0,	%l1
	edge8n	%l6,	%o3,	%o1
	movrgz	%o2,	%l4,	%l0
	addc	%g3,	0x00C6,	%i2
	movcs	%xcc,	%i6,	%g7
	fmovdneg	%xcc,	%f8,	%f15
	movneg	%xcc,	%o5,	%l2
	sra	%o6,	%l3,	%g4
	movge	%icc,	%i3,	%g1
	sethi	0x025E,	%i5
	xnor	%i7,	%i1,	%g6
	ldx	[%l7 + 0x48],	%g5
	alignaddr	%i4,	%l5,	%o7
	edge32	%o0,	%g2,	%o4
	movn	%xcc,	%l1,	%l6
	lduw	[%l7 + 0x10],	%o3
	addc	%o1,	0x07CC,	%o2
	movcc	%xcc,	%l4,	%i0
	bshuffle	%f10,	%f20,	%f8
	edge32	%l0,	%i2,	%g3
	ldsw	[%l7 + 0x5C],	%g7
	subcc	%o5,	%l2,	%i6
	movrlez	%o6,	%g4,	%l3
	movrgz	%i3,	0x147,	%g1
	edge32n	%i7,	%i1,	%i5
	fnot1	%f18,	%f6
	sub	%g6,	%g5,	%l5
	sll	%i4,	%o7,	%o0
	st	%f14,	[%l7 + 0x44]
	array16	%g2,	%o4,	%l6
	fmuld8sux16	%f13,	%f2,	%f26
	udiv	%o3,	0x1BD5,	%l1
	fmul8x16	%f17,	%f6,	%f26
	movle	%xcc,	%o1,	%l4
	add	%o2,	%i0,	%i2
	fmovdge	%icc,	%f21,	%f6
	edge32	%g3,	%l0,	%g7
	fmovrdne	%o5,	%f12,	%f2
	ldd	[%l7 + 0x28],	%l2
	edge8	%o6,	%i6,	%l3
	save %g4, 0x1FAE, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%i7,	%i3
	move	%icc,	%i1,	%g6
	movvs	%xcc,	%i5,	%l5
	subcc	%g5,	%i4,	%o0
	array8	%g2,	%o7,	%o4
	movneg	%icc,	%o3,	%l6
	ldsh	[%l7 + 0x1C],	%l1
	xnor	%o1,	%o2,	%l4
	fmovdge	%icc,	%f26,	%f8
	siam	0x3
	edge32ln	%i2,	%i0,	%g3
	fornot1	%f2,	%f14,	%f28
	restore %g7, %l0, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f3
	or	%o6,	%i6,	%o5
	fands	%f4,	%f20,	%f8
	nop
	set	0x5B, %l0
	ldsb	[%l7 + %l0],	%l3
	movvs	%xcc,	%g4,	%i7
	edge16	%i3,	%g1,	%i1
	ldsh	[%l7 + 0x2E],	%i5
	mova	%xcc,	%g6,	%g5
	xnorcc	%i4,	0x129A,	%o0
	edge32	%l5,	%g2,	%o7
	andncc	%o3,	%l6,	%o4
	movgu	%xcc,	%o1,	%l1
	fornot2s	%f10,	%f31,	%f7
	alignaddr	%l4,	%i2,	%i0
	or	%g3,	%g7,	%l0
	fmovsvc	%xcc,	%f6,	%f7
	andncc	%l2,	%o6,	%i6
	subccc	%o2,	%o5,	%l3
	fmovrdgez	%g4,	%f18,	%f8
	fnands	%f8,	%f20,	%f11
	edge8ln	%i7,	%i3,	%g1
	xnor	%i1,	0x0635,	%i5
	alignaddrl	%g6,	%i4,	%g5
	sdivcc	%l5,	0x023B,	%g2
	fnot1s	%f26,	%f3
	array16	%o0,	%o3,	%l6
	umulcc	%o4,	%o7,	%o1
	udiv	%l4,	0x03AA,	%i2
	faligndata	%f8,	%f28,	%f10
	st	%f31,	[%l7 + 0x58]
	save %l1, 0x1D62, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%icc,	%f23,	%f18
	fmovrsne	%g3,	%f20,	%f14
	orcc	%l0,	0x1404,	%l2
	nop
	set	0x68, %l3
	ldsw	[%l7 + %l3],	%o6
	subcc	%i6,	0x003C,	%o2
	movleu	%icc,	%g7,	%l3
	addccc	%g4,	%o5,	%i7
	movcc	%xcc,	%g1,	%i3
	smulcc	%i1,	0x007D,	%g6
	smul	%i5,	0x1F06,	%i4
	fmovsvs	%icc,	%f30,	%f25
	array16	%l5,	%g5,	%o0
	ldub	[%l7 + 0x69],	%g2
	edge16ln	%l6,	%o4,	%o3
	fands	%f11,	%f24,	%f1
	fnor	%f28,	%f28,	%f2
	ldx	[%l7 + 0x18],	%o7
	sir	0x0CC6
	umul	%l4,	%o1,	%l1
	fsrc1s	%f4,	%f11
	stx	%i2,	[%l7 + 0x28]
	movrgez	%g3,	0x0BA,	%i0
	edge32n	%l2,	%l0,	%o6
	srl	%o2,	%g7,	%i6
	movrlez	%g4,	0x071,	%l3
	xor	%o5,	0x06CA,	%i7
	edge16l	%i3,	%i1,	%g6
	andcc	%g1,	0x0832,	%i4
	addc	%l5,	%i5,	%g5
	fornot2s	%f25,	%f22,	%f14
	edge16n	%o0,	%l6,	%g2
	movge	%icc,	%o3,	%o7
	edge16	%l4,	%o1,	%o4
	movg	%xcc,	%i2,	%g3
	popc	0x07D7,	%i0
	sdiv	%l2,	0x14BE,	%l1
	orcc	%o6,	0x1AB5,	%o2
	movre	%g7,	0x3FF,	%l0
	sir	0x0FED
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	mulx	%l3,	0x0E3B,	%i7
	fzeros	%f12
	stb	%i3,	[%l7 + 0x70]
	fcmple16	%f0,	%f30,	%i1
	movg	%icc,	%g1,	%g6
	xorcc	%l5,	0x0D3C,	%i5
	fcmped	%fcc3,	%f6,	%f30
	udiv	%g5,	0x0929,	%i4
	array8	%l6,	%g2,	%o3
	st	%f6,	[%l7 + 0x10]
	udivx	%o7,	0x166C,	%l4
	ld	[%l7 + 0x54],	%f25
	movrlez	%o0,	0x2B3,	%o1
	movre	%o4,	%i2,	%g3
	fmovse	%xcc,	%f10,	%f21
	lduw	[%l7 + 0x48],	%i0
	fornot2s	%f11,	%f11,	%f31
	movrlz	%l2,	%l1,	%o2
	fmuld8sux16	%f9,	%f17,	%f0
	udiv	%g7,	0x1A7F,	%l0
	sllx	%i6,	0x03,	%o6
	fmovdn	%icc,	%f23,	%f14
	ld	[%l7 + 0x7C],	%f0
	movl	%xcc,	%g4,	%l3
	fpadd16	%f22,	%f16,	%f4
	sllx	%o5,	%i3,	%i7
	movge	%icc,	%i1,	%g1
	sdiv	%g6,	0x119A,	%i5
	movleu	%icc,	%l5,	%g5
	subcc	%i4,	0x16B7,	%l6
	fpmerge	%f10,	%f0,	%f4
	movrgez	%g2,	%o7,	%o3
	stx	%l4,	[%l7 + 0x78]
	fmovse	%icc,	%f0,	%f25
	edge8l	%o1,	%o4,	%o0
	lduh	[%l7 + 0x44],	%i2
	movrgez	%i0,	%g3,	%l2
	ldub	[%l7 + 0x63],	%l1
	array32	%g7,	%l0,	%o2
	restore %o6, %g4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o5,	%i3,	%l3
	fxor	%f6,	%f16,	%f30
	ldd	[%l7 + 0x60],	%f4
	movgu	%xcc,	%i1,	%g1
	movre	%g6,	%i5,	%l5
	movvc	%icc,	%i7,	%g5
	ldsh	[%l7 + 0x64],	%i4
	sir	0x1987
	fcmpne16	%f10,	%f8,	%l6
	sllx	%o7,	%o3,	%l4
	fcmpne16	%f18,	%f22,	%o1
	lduh	[%l7 + 0x18],	%o4
	stw	%o0,	[%l7 + 0x5C]
	sethi	0x045A,	%i2
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	fmovrslez	%g2,	%f1,	%f11
	smulcc	%g7,	0x028D,	%l1
	lduh	[%l7 + 0x24],	%l0
	fsrc2s	%f21,	%f18
	orcc	%o2,	0x02D2,	%o6
	fpackfix	%f16,	%f30
	sir	0x0481
	umul	%g4,	0x1806,	%o5
	lduh	[%l7 + 0x26],	%i6
	subccc	%l3,	%i3,	%i1
	alignaddr	%g6,	%i5,	%g1
	sllx	%i7,	0x1B,	%g5
	xnor	%i4,	0x0756,	%l5
	ldd	[%l7 + 0x48],	%i6
	movre	%o3,	%o7,	%l4
	andncc	%o4,	%o1,	%i2
	fmul8x16au	%f5,	%f20,	%f18
	sllx	%o0,	0x00,	%i0
	save %g3, 0x054D, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%icc,	%f8,	%f30
	edge32ln	%g7,	%g2,	%l0
	movre	%o2,	0x34A,	%l1
	edge16l	%g4,	%o6,	%o5
	sdivcc	%i6,	0x1ED7,	%l3
	or	%i3,	%g6,	%i1
	fpadd32s	%f13,	%f22,	%f18
	fandnot2	%f30,	%f4,	%f20
	fnegs	%f8,	%f25
	movpos	%xcc,	%i5,	%g1
	movvs	%icc,	%g5,	%i4
	lduh	[%l7 + 0x2C],	%i7
	save %l5, %o3, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%xcc,	%f21,	%f0
	srax	%l4,	0x01,	%l6
	fcmple16	%f18,	%f20,	%o4
	xorcc	%i2,	0x1F15,	%o0
	fsrc1s	%f0,	%f29
	stb	%i0,	[%l7 + 0x64]
	ldsw	[%l7 + 0x68],	%o1
	sir	0x0814
	subcc	%g3,	%g7,	%g2
	fmovdleu	%xcc,	%f30,	%f24
	srlx	%l2,	0x0B,	%l0
	lduw	[%l7 + 0x58],	%l1
	mulx	%o2,	%g4,	%o5
	subcc	%i6,	%o6,	%l3
	umul	%g6,	%i1,	%i5
	alignaddr	%g1,	%i3,	%g5
	ldd	[%l7 + 0x70],	%i6
	edge32	%i4,	%o3,	%o7
	movcc	%icc,	%l4,	%l5
	movle	%icc,	%o4,	%i2
	srl	%o0,	%l6,	%o1
	edge16	%g3,	%i0,	%g2
	udiv	%l2,	0x1B6D,	%g7
	nop
	set	0x4B, %o6
	ldsb	[%l7 + %o6],	%l1
	xor	%o2,	%l0,	%o5
	ldd	[%l7 + 0x18],	%f4
	smul	%i6,	0x1591,	%g4
	fmovrdgez	%l3,	%f28,	%f18
	nop
	set	0x30, %o7
	sth	%o6,	[%l7 + %o7]
	fmul8x16	%f8,	%f6,	%f26
	edge8	%g6,	%i5,	%g1
	fpack32	%f24,	%f14,	%f14
	orncc	%i3,	0x1E6F,	%g5
	edge8ln	%i7,	%i1,	%i4
	fmovrdlz	%o7,	%f20,	%f4
	movgu	%icc,	%l4,	%o3
	edge8l	%l5,	%i2,	%o0
	stb	%o4,	[%l7 + 0x58]
	movne	%icc,	%l6,	%o1
	ldsb	[%l7 + 0x22],	%g3
	sub	%i0,	0x1123,	%g2
	edge16ln	%g7,	%l1,	%l2
	xnor	%l0,	%o2,	%i6
	orn	%g4,	%l3,	%o5
	movrgez	%o6,	%i5,	%g6
	edge8ln	%i3,	%g1,	%g5
	fors	%f26,	%f20,	%f0
	sdivcc	%i1,	0x072E,	%i4
	save %o7, 0x1F6A, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l4,	0x0900,	%o3
	bshuffle	%f30,	%f28,	%f4
	fmovspos	%icc,	%f17,	%f23
	fmuld8sux16	%f6,	%f18,	%f4
	fcmped	%fcc1,	%f12,	%f10
	sth	%l5,	[%l7 + 0x78]
	mova	%xcc,	%i2,	%o4
	subc	%l6,	%o1,	%g3
	ld	[%l7 + 0x4C],	%f1
	udivcc	%o0,	0x1B31,	%g2
	edge16n	%g7,	%l1,	%l2
	fmovsne	%icc,	%f25,	%f8
	movl	%xcc,	%i0,	%l0
	move	%xcc,	%o2,	%g4
	addccc	%l3,	0x06E5,	%i6
	umulcc	%o6,	0x0F63,	%o5
	edge16n	%i5,	%g6,	%i3
	edge16ln	%g5,	%g1,	%i4
	smulcc	%i1,	0x0E58,	%i7
	stb	%o7,	[%l7 + 0x37]
	movle	%xcc,	%l4,	%l5
	alignaddr	%i2,	%o4,	%o3
	fpmerge	%f20,	%f6,	%f16
	edge32	%o1,	%g3,	%l6
	array32	%g2,	%g7,	%l1
	fmovse	%xcc,	%f3,	%f26
	edge8l	%l2,	%i0,	%l0
	fxors	%f22,	%f26,	%f17
	sra	%o0,	%g4,	%l3
	fmovrsne	%o2,	%f20,	%f11
	or	%i6,	%o5,	%i5
	ldd	[%l7 + 0x20],	%f24
	ld	[%l7 + 0x70],	%f12
	srlx	%o6,	%i3,	%g6
	edge32ln	%g5,	%g1,	%i1
	srl	%i4,	%i7,	%l4
	ldub	[%l7 + 0x1B],	%l5
	move	%icc,	%i2,	%o7
	lduh	[%l7 + 0x3C],	%o3
	stb	%o1,	[%l7 + 0x0A]
	xnor	%g3,	0x0B1E,	%l6
	smulcc	%g2,	0x01C4,	%o4
	movneg	%icc,	%l1,	%g7
	sdivx	%l2,	0x1F40,	%i0
	edge16	%l0,	%o0,	%g4
	edge8l	%l3,	%i6,	%o2
	andn	%i5,	0x19C7,	%o6
	fornot2s	%f15,	%f30,	%f7
	fmovrslez	%o5,	%f21,	%f24
	fmovsleu	%icc,	%f22,	%f29
	nop
	set	0x08, %l6
	std	%f22,	[%l7 + %l6]
	sir	0x0DA0
	srl	%i3,	0x03,	%g5
	movg	%icc,	%g6,	%g1
	ldx	[%l7 + 0x60],	%i4
	restore %i1, 0x1AAF, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f12,	%f20
	fmovsneg	%xcc,	%f7,	%f28
	stw	%l4,	[%l7 + 0x58]
	smul	%l5,	%i2,	%o3
	movpos	%xcc,	%o7,	%g3
	edge8l	%o1,	%g2,	%o4
	orn	%l6,	%g7,	%l2
	movrlez	%l1,	%l0,	%i0
	fmovdleu	%icc,	%f30,	%f15
	ldub	[%l7 + 0x5F],	%g4
	addcc	%l3,	0x08FA,	%o0
	fnot2s	%f20,	%f29
	edge16ln	%i6,	%i5,	%o6
	movg	%icc,	%o2,	%o5
	and	%i3,	0x0EB6,	%g6
	movle	%icc,	%g5,	%i4
	ldsb	[%l7 + 0x32],	%i1
	movrlz	%g1,	0x2F8,	%l4
	fmovdgu	%xcc,	%f3,	%f9
	movpos	%xcc,	%l5,	%i2
	lduh	[%l7 + 0x6A],	%i7
	sdiv	%o3,	0x0C3E,	%g3
	edge32ln	%o1,	%g2,	%o4
	mova	%icc,	%l6,	%o7
	fmovrdlz	%g7,	%f16,	%f14
	fmuld8sux16	%f11,	%f26,	%f28
	edge8l	%l1,	%l0,	%l2
	fcmpgt32	%f26,	%f26,	%i0
	subcc	%l3,	0x195B,	%g4
	ldsb	[%l7 + 0x28],	%i6
	movvs	%icc,	%i5,	%o6
	xnorcc	%o2,	%o0,	%o5
	xor	%i3,	%g5,	%g6
	movcc	%xcc,	%i4,	%i1
	alignaddr	%g1,	%l5,	%i2
	orncc	%i7,	%l4,	%g3
	lduw	[%l7 + 0x18],	%o3
	orn	%o1,	%g2,	%l6
	udiv	%o7,	0x155E,	%o4
	alignaddr	%l1,	%g7,	%l2
	fmovrdlez	%l0,	%f24,	%f18
	ldx	[%l7 + 0x28],	%i0
	xnorcc	%g4,	%l3,	%i6
	subc	%i5,	%o6,	%o0
	sethi	0x1336,	%o2
	fmovrslez	%o5,	%f3,	%f31
	smulcc	%g5,	0x0E56,	%i3
	ldd	[%l7 + 0x10],	%f18
	movrlz	%i4,	0x150,	%g6
	fmovrdgz	%g1,	%f20,	%f4
	ld	[%l7 + 0x14],	%f29
	st	%f5,	[%l7 + 0x28]
	edge8l	%l5,	%i1,	%i2
	movgu	%xcc,	%i7,	%g3
	movgu	%icc,	%l4,	%o3
	mulx	%o1,	0x1279,	%l6
	alignaddrl	%g2,	%o7,	%o4
	fand	%f30,	%f10,	%f12
	fmovsvs	%xcc,	%f25,	%f14
	sllx	%l1,	0x11,	%g7
	fcmps	%fcc1,	%f9,	%f9
	alignaddr	%l2,	%i0,	%g4
	movrgez	%l0,	%l3,	%i5
	fmovscs	%icc,	%f13,	%f16
	movl	%xcc,	%o6,	%o0
	sth	%i6,	[%l7 + 0x54]
	fmovsvs	%xcc,	%f8,	%f7
	ldd	[%l7 + 0x58],	%f22
	mova	%icc,	%o5,	%g5
	xnorcc	%i3,	%i4,	%g6
	subcc	%o2,	%l5,	%g1
	edge8l	%i1,	%i2,	%i7
	fabss	%f26,	%f26
	fmovsvc	%xcc,	%f19,	%f29
	sdivcc	%g3,	0x02C4,	%o3
	st	%f16,	[%l7 + 0x7C]
	fcmpgt16	%f16,	%f16,	%o1
	sra	%l6,	0x1A,	%l4
	andn	%o7,	%o4,	%l1
	move	%icc,	%g7,	%l2
	fmovrdlez	%i0,	%f8,	%f30
	movcc	%xcc,	%g4,	%l0
	fpadd32	%f24,	%f18,	%f28
	stw	%l3,	[%l7 + 0x68]
	fmovsvs	%icc,	%f28,	%f31
	smulcc	%g2,	0x1C93,	%o6
	andncc	%i5,	%o0,	%i6
	fpsub16s	%f4,	%f6,	%f28
	edge8	%g5,	%o5,	%i3
	umul	%g6,	%i4,	%o2
	movne	%xcc,	%l5,	%g1
	alignaddr	%i2,	%i1,	%g3
	edge16ln	%i7,	%o1,	%l6
	movrgez	%l4,	%o7,	%o3
	siam	0x5
	sth	%l1,	[%l7 + 0x70]
	edge16ln	%o4,	%g7,	%l2
	orcc	%i0,	0x1049,	%l0
	movrne	%g4,	%g2,	%l3
	sethi	0x0782,	%i5
	movrlez	%o6,	%i6,	%g5
	umulcc	%o0,	0x1248,	%o5
	alignaddr	%i3,	%g6,	%i4
	ldsh	[%l7 + 0x14],	%o2
	array8	%l5,	%g1,	%i1
	edge8n	%g3,	%i7,	%i2
	fabss	%f20,	%f16
	ldsb	[%l7 + 0x33],	%l6
	fmovsne	%xcc,	%f22,	%f2
	fone	%f12
	sdivcc	%l4,	0x17DF,	%o7
	array8	%o3,	%l1,	%o1
	mova	%icc,	%o4,	%l2
	srlx	%i0,	%l0,	%g7
	movvc	%icc,	%g2,	%l3
	srlx	%g4,	0x07,	%i5
	nop
	set	0x48, %i2
	sth	%i6,	[%l7 + %i2]
	fmovsn	%icc,	%f10,	%f0
	fsrc1s	%f20,	%f9
	stx	%o6,	[%l7 + 0x68]
	array16	%g5,	%o0,	%o5
	fmovsa	%xcc,	%f10,	%f8
	alignaddrl	%g6,	%i3,	%i4
	subc	%l5,	0x17C2,	%g1
	fornot2	%f10,	%f28,	%f4
	lduh	[%l7 + 0x52],	%i1
	addcc	%g3,	0x181E,	%i7
	or	%o2,	%i2,	%l6
	udivx	%l4,	0x0E92,	%o7
	fmovrdgez	%l1,	%f8,	%f24
	stx	%o3,	[%l7 + 0x50]
	sllx	%o1,	%l2,	%i0
	lduh	[%l7 + 0x66],	%l0
	mulscc	%o4,	0x0CBE,	%g2
	movrgz	%l3,	%g7,	%g4
	pdist	%f16,	%f12,	%f20
	ldsw	[%l7 + 0x70],	%i6
	alignaddrl	%o6,	%g5,	%i5
	fmovrslez	%o5,	%f0,	%f25
	ldd	[%l7 + 0x58],	%g6
	lduw	[%l7 + 0x14],	%o0
	fcmple16	%f8,	%f8,	%i3
	fmovdneg	%xcc,	%f22,	%f27
	subccc	%i4,	0x1A25,	%g1
	fmovdge	%icc,	%f28,	%f6
	sllx	%l5,	%i1,	%i7
	nop
	set	0x68, %i6
	stw	%g3,	[%l7 + %i6]
	andncc	%o2,	%i2,	%l4
	ldd	[%l7 + 0x38],	%i6
	fmovrdlez	%l1,	%f28,	%f28
	umulcc	%o3,	0x1798,	%o1
	fandnot1s	%f31,	%f24,	%f21
	sdivx	%l2,	0x026B,	%i0
	edge8ln	%o7,	%o4,	%g2
	edge16	%l0,	%l3,	%g4
	fmovrdgz	%g7,	%f10,	%f24
	sdivcc	%o6,	0x0162,	%i6
	edge32n	%i5,	%o5,	%g6
	smulcc	%g5,	0x1200,	%i3
	array8	%i4,	%g1,	%l5
	movrgz	%i1,	0x2D5,	%i7
	subcc	%o0,	0x0CEC,	%g3
	fmovdpos	%icc,	%f24,	%f24
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	sub	%l4,	%l6,	%l1
	srax	%o3,	0x08,	%l2
	andcc	%o1,	0x19E3,	%i0
	orcc	%o7,	0x0821,	%g2
	stw	%o4,	[%l7 + 0x6C]
	udiv	%l3,	0x183E,	%g4
	stx	%l0,	[%l7 + 0x08]
	edge32ln	%g7,	%o6,	%i5
	lduh	[%l7 + 0x54],	%i6
	array8	%o5,	%g6,	%i3
	fmovsvc	%xcc,	%f26,	%f13
	fpsub32s	%f22,	%f2,	%f27
	fpadd16	%f20,	%f6,	%f14
	nop
	set	0x40, %o0
	stx	%g5,	[%l7 + %o0]
	ldub	[%l7 + 0x7A],	%g1
	andncc	%i4,	%l5,	%i1
	fmovrsgez	%o0,	%f14,	%f7
	or	%i7,	%i2,	%o2
	ldsh	[%l7 + 0x50],	%l4
	subc	%l6,	0x14F4,	%g3
	stb	%o3,	[%l7 + 0x68]
	fmovrsgez	%l1,	%f31,	%f8
	movleu	%xcc,	%l2,	%o1
	fmul8x16	%f16,	%f4,	%f4
	andn	%o7,	0x1817,	%g2
	movrlz	%i0,	%l3,	%g4
	fmovsvs	%icc,	%f1,	%f5
	movre	%o4,	0x076,	%l0
	sir	0x02EA
	fpack32	%f30,	%f22,	%f4
	edge16	%o6,	%i5,	%i6
	edge8	%o5,	%g7,	%i3
	movgu	%xcc,	%g5,	%g6
	sdivcc	%i4,	0x1186,	%l5
	edge8n	%i1,	%g1,	%i7
	edge8	%o0,	%o2,	%i2
	edge16ln	%l4,	%l6,	%o3
	or	%l1,	%g3,	%o1
	edge8l	%l2,	%g2,	%i0
	fxor	%f0,	%f22,	%f10
	xor	%l3,	%o7,	%o4
	edge8n	%l0,	%g4,	%o6
	fzero	%f6
	fxnor	%f22,	%f20,	%f16
	fpadd16s	%f7,	%f29,	%f3
	or	%i5,	%i6,	%o5
	subc	%i3,	%g7,	%g6
	movn	%icc,	%g5,	%l5
	sdivcc	%i1,	0x04A6,	%g1
	or	%i4,	0x1564,	%i7
	nop
	set	0x58, %i5
	ldsb	[%l7 + %i5],	%o0
	andncc	%o2,	%l4,	%l6
	sir	0x1B75
	orcc	%i2,	0x0E0B,	%o3
	movn	%icc,	%g3,	%l1
	movl	%xcc,	%o1,	%l2
	save %i0, 0x1065, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o7,	%g2,	%o4
	array8	%g4,	%l0,	%i5
	fnot2	%f6,	%f6
	movl	%icc,	%i6,	%o5
	restore %i3, %o6, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g7,	0x17D5,	%g5
	udiv	%l5,	0x074C,	%i1
	subcc	%i4,	0x16FF,	%i7
	udivx	%o0,	0x0577,	%g1
	st	%f26,	[%l7 + 0x3C]
	fcmpgt16	%f8,	%f12,	%o2
	edge32ln	%l6,	%i2,	%l4
	fmovsgu	%xcc,	%f22,	%f27
	edge16ln	%o3,	%g3,	%o1
	edge16	%l1,	%i0,	%l2
	sll	%o7,	%g2,	%o4
	fcmped	%fcc1,	%f28,	%f16
	ldx	[%l7 + 0x18],	%l3
	edge8n	%g4,	%i5,	%l0
	edge8ln	%i6,	%i3,	%o6
	edge8	%g6,	%o5,	%g5
	sdivx	%g7,	0x1728,	%l5
	ldsh	[%l7 + 0x4C],	%i4
	udivx	%i1,	0x1551,	%i7
	fmovdvc	%icc,	%f18,	%f4
	ldsh	[%l7 + 0x0E],	%o0
	movge	%xcc,	%g1,	%l6
	movneg	%xcc,	%i2,	%o2
	fmovsgu	%icc,	%f15,	%f5
	movge	%icc,	%l4,	%o3
	ld	[%l7 + 0x44],	%f4
	movrgez	%g3,	%o1,	%l1
	move	%xcc,	%i0,	%l2
	lduh	[%l7 + 0x34],	%o7
	fsrc1	%f18,	%f18
	subc	%g2,	0x0E89,	%l3
	fnor	%f10,	%f28,	%f0
	fmovdvs	%icc,	%f17,	%f20
	fones	%f18
	movleu	%icc,	%o4,	%i5
	array32	%l0,	%g4,	%i6
	movvs	%xcc,	%o6,	%i3
	sdiv	%g6,	0x037D,	%g5
	movl	%icc,	%g7,	%l5
	movrgz	%o5,	0x23B,	%i1
	fcmps	%fcc0,	%f18,	%f23
	smulcc	%i7,	0x045C,	%i4
	edge16l	%o0,	%g1,	%l6
	ldsh	[%l7 + 0x36],	%i2
	edge32ln	%o2,	%o3,	%l4
	array16	%g3,	%o1,	%l1
	ldsb	[%l7 + 0x1D],	%l2
	stx	%i0,	[%l7 + 0x30]
	nop
	set	0x64, %l5
	ldsw	[%l7 + %l5],	%g2
	stb	%o7,	[%l7 + 0x39]
	ldd	[%l7 + 0x58],	%f18
	movrgz	%o4,	%i5,	%l0
	fands	%f31,	%f7,	%f24
	sdivx	%l3,	0x18B9,	%g4
	edge16l	%o6,	%i3,	%i6
	edge32ln	%g6,	%g5,	%l5
	orn	%o5,	0x0AC1,	%i1
	sir	0x1A01
	ldx	[%l7 + 0x30],	%g7
	andncc	%i4,	%o0,	%g1
	ldx	[%l7 + 0x18],	%l6
	orncc	%i2,	%o2,	%i7
	edge32ln	%l4,	%g3,	%o3
	fcmpne16	%f20,	%f2,	%l1
	addc	%l2,	%o1,	%g2
	lduh	[%l7 + 0x78],	%o7
	fzeros	%f16
	udivcc	%o4,	0x0A91,	%i0
	edge8	%i5,	%l3,	%g4
	fmovrdgz	%o6,	%f0,	%f0
	stb	%l0,	[%l7 + 0x7F]
	mulx	%i3,	0x1C4D,	%i6
	ldsb	[%l7 + 0x68],	%g6
	fsrc2s	%f8,	%f16
	sdivcc	%l5,	0x1F5C,	%o5
	nop
	set	0x19, %l2
	stb	%g5,	[%l7 + %l2]
	fcmpne32	%f4,	%f20,	%g7
	sth	%i1,	[%l7 + 0x30]
	xnorcc	%o0,	%g1,	%l6
	movrne	%i2,	0x125,	%i4
	edge16	%o2,	%i7,	%l4
	fcmple16	%f10,	%f20,	%g3
	sllx	%o3,	0x19,	%l1
	movle	%icc,	%o1,	%l2
	fmovdvc	%icc,	%f11,	%f10
	lduh	[%l7 + 0x6A],	%g2
	fcmped	%fcc0,	%f6,	%f22
	nop
	set	0x55, %g4
	ldsb	[%l7 + %g4],	%o4
	nop
	set	0x46, %g3
	ldsh	[%l7 + %g3],	%i0
	fmovdleu	%icc,	%f7,	%f10
	subcc	%i5,	0x128F,	%l3
	ldub	[%l7 + 0x7B],	%g4
	edge8	%o7,	%o6,	%i3
	subc	%i6,	%l0,	%l5
	fmovsgu	%xcc,	%f5,	%f15
	subcc	%g6,	%g5,	%o5
	add	%g7,	%i1,	%o0
	popc	%g1,	%i2
	ldd	[%l7 + 0x18],	%f26
	addcc	%l6,	0x0C4C,	%o2
	addccc	%i7,	%i4,	%l4
	fpack32	%f16,	%f24,	%f2
	fcmple16	%f4,	%f26,	%o3
	edge8	%l1,	%g3,	%o1
	fmovda	%icc,	%f2,	%f1
	move	%xcc,	%l2,	%o4
	movrlz	%g2,	%i0,	%l3
	fcmpeq32	%f2,	%f0,	%i5
	movleu	%xcc,	%o7,	%o6
	edge16ln	%g4,	%i6,	%l0
	movrlez	%i3,	%l5,	%g6
	edge32l	%o5,	%g5,	%i1
	edge16n	%g7,	%g1,	%o0
	andcc	%i2,	0x09C5,	%l6
	subcc	%i7,	%i4,	%l4
	nop
	set	0x3B, %g5
	ldsb	[%l7 + %g5],	%o2
	lduw	[%l7 + 0x20],	%o3
	andcc	%l1,	%o1,	%l2
	movle	%xcc,	%o4,	%g3
	movrgz	%i0,	%l3,	%i5
	sll	%g2,	%o6,	%o7
	sdivx	%g4,	0x0BF7,	%l0
	fxnor	%f18,	%f16,	%f30
	std	%f14,	[%l7 + 0x18]
	fornot2s	%f7,	%f21,	%f17
	fmovrdgz	%i6,	%f6,	%f2
	popc	%l5,	%g6
	fzero	%f20
	for	%f14,	%f22,	%f30
	fmovscc	%icc,	%f10,	%f11
	udivcc	%i3,	0x06C5,	%g5
	add	%o5,	0x1926,	%i1
	fornot1	%f10,	%f24,	%f10
	sll	%g7,	0x01,	%o0
	movle	%xcc,	%g1,	%l6
	std	%f12,	[%l7 + 0x28]
	movleu	%icc,	%i2,	%i4
	fmovdcs	%icc,	%f19,	%f2
	stb	%l4,	[%l7 + 0x54]
	ld	[%l7 + 0x10],	%f3
	edge16	%i7,	%o2,	%o3
	edge32l	%o1,	%l1,	%o4
	movrgez	%g3,	%i0,	%l2
	fmuld8ulx16	%f4,	%f8,	%f28
	movgu	%xcc,	%l3,	%i5
	edge8ln	%o6,	%g2,	%o7
	sir	0x187F
	fmovrsgz	%l0,	%f29,	%f9
	fabss	%f4,	%f25
	edge8n	%i6,	%l5,	%g4
	move	%icc,	%i3,	%g6
	andcc	%o5,	0x08F9,	%i1
	stw	%g5,	[%l7 + 0x14]
	fcmpeq32	%f20,	%f28,	%g7
	fandnot1	%f2,	%f28,	%f18
	edge8ln	%o0,	%l6,	%g1
	move	%icc,	%i2,	%i4
	fpadd16s	%f11,	%f8,	%f31
	sth	%i7,	[%l7 + 0x2A]
	movrlz	%o2,	0x14B,	%l4
	sdiv	%o3,	0x17A9,	%l1
	movl	%xcc,	%o4,	%g3
	movrlz	%i0,	%l2,	%l3
	lduw	[%l7 + 0x50],	%i5
	fone	%f22
	movg	%xcc,	%o1,	%g2
	movn	%icc,	%o7,	%l0
	sethi	0x07B9,	%i6
	fmovdl	%icc,	%f23,	%f0
	fpadd16s	%f25,	%f11,	%f28
	andn	%l5,	0x1D86,	%g4
	sdivx	%o6,	0x0BFD,	%i3
	orncc	%o5,	%i1,	%g6
	movpos	%icc,	%g5,	%g7
	edge8ln	%l6,	%g1,	%i2
	fmovsg	%icc,	%f24,	%f12
	fnot2s	%f14,	%f17
	stb	%i4,	[%l7 + 0x6C]
	fmuld8ulx16	%f19,	%f26,	%f18
	xnorcc	%o0,	0x0A9D,	%i7
	fnegs	%f8,	%f28
	pdist	%f24,	%f28,	%f14
	pdist	%f14,	%f30,	%f28
	move	%icc,	%l4,	%o2
	xnorcc	%l1,	%o4,	%o3
	edge16l	%i0,	%g3,	%l3
	movleu	%icc,	%i5,	%o1
	movg	%icc,	%g2,	%o7
	udivx	%l0,	0x0650,	%l2
	movvs	%icc,	%l5,	%g4
	mova	%xcc,	%o6,	%i6
	edge32n	%o5,	%i1,	%i3
	andncc	%g6,	%g7,	%g5
	move	%icc,	%l6,	%g1
	movg	%icc,	%i4,	%o0
	lduh	[%l7 + 0x38],	%i7
	edge8	%l4,	%i2,	%o2
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	mova	%xcc,	%l1,	%g3
	fnot1s	%f0,	%f17
	fmovdge	%icc,	%f24,	%f14
	fmovs	%f29,	%f4
	movrgez	%l3,	%i5,	%i0
	fcmpne32	%f26,	%f16,	%o1
	fpadd16s	%f19,	%f17,	%f10
	fpack16	%f22,	%f23
	srax	%o7,	%g2,	%l2
	orn	%l5,	%l0,	%g4
	sllx	%i6,	%o5,	%o6
	alignaddrl	%i3,	%i1,	%g7
	udiv	%g5,	0x180D,	%l6
	addc	%g6,	0x032E,	%g1
	subcc	%i4,	0x1519,	%o0
	subccc	%l4,	0x1731,	%i7
	edge32ln	%o2,	%o4,	%i2
	lduw	[%l7 + 0x2C],	%l1
	movre	%g3,	0x058,	%o3
	movcs	%xcc,	%i5,	%i0
	fors	%f15,	%f19,	%f14
	ldd	[%l7 + 0x28],	%l2
	nop
	set	0x18, %i3
	stx	%o1,	[%l7 + %i3]
	movrlez	%g2,	%l2,	%o7
	lduw	[%l7 + 0x2C],	%l5
	umul	%g4,	0x197B,	%l0
	stw	%o5,	[%l7 + 0x34]
	std	%f22,	[%l7 + 0x38]
	bshuffle	%f26,	%f14,	%f30
	fmovdn	%xcc,	%f28,	%f9
	movvs	%icc,	%o6,	%i3
	movneg	%icc,	%i1,	%i6
	add	%g7,	%g5,	%g6
	edge16l	%l6,	%i4,	%o0
	fcmpgt32	%f26,	%f6,	%g1
	edge16ln	%i7,	%o2,	%o4
	or	%i2,	%l4,	%l1
	edge8l	%g3,	%i5,	%o3
	movleu	%icc,	%l3,	%o1
	stb	%i0,	[%l7 + 0x2A]
	subccc	%g2,	0x14D4,	%o7
	sdiv	%l2,	0x1B6C,	%l5
	sdivcc	%l0,	0x1960,	%o5
	fmovdgu	%icc,	%f3,	%f2
	xor	%g4,	0x151A,	%o6
	edge8n	%i3,	%i1,	%g7
	udiv	%g5,	0x17F3,	%i6
	fpsub32	%f28,	%f22,	%f28
	movleu	%icc,	%g6,	%l6
	std	%f20,	[%l7 + 0x10]
	fnot1	%f24,	%f4
	srl	%o0,	0x0D,	%g1
	smulcc	%i7,	0x0720,	%o2
	edge8n	%i4,	%i2,	%o4
	fmovdleu	%xcc,	%f12,	%f10
	ldsh	[%l7 + 0x2E],	%l4
	movneg	%icc,	%g3,	%i5
	xorcc	%l1,	0x15FA,	%l3
	movpos	%xcc,	%o3,	%o1
	fcmps	%fcc3,	%f27,	%f4
	stw	%i0,	[%l7 + 0x6C]
	sdivx	%g2,	0x0EDB,	%l2
	edge8	%o7,	%l0,	%l5
	fmovsl	%icc,	%f9,	%f2
	sdiv	%g4,	0x126F,	%o5
	movgu	%icc,	%o6,	%i1
	fmovdge	%icc,	%f30,	%f0
	fnegs	%f18,	%f15
	fmovrdne	%g7,	%f6,	%f22
	ld	[%l7 + 0x2C],	%f5
	bshuffle	%f22,	%f12,	%f30
	srl	%i3,	%i6,	%g6
	movleu	%xcc,	%g5,	%l6
	movneg	%icc,	%g1,	%i7
	fmovrdlez	%o2,	%f4,	%f30
	fandnot1s	%f3,	%f31,	%f4
	edge16l	%i4,	%o0,	%i2
	addcc	%l4,	%o4,	%g3
	stb	%l1,	[%l7 + 0x15]
	edge32n	%l3,	%o3,	%o1
	mulx	%i0,	0x0059,	%i5
	ldd	[%l7 + 0x70],	%f20
	add	%l2,	%g2,	%o7
	sethi	0x02E5,	%l0
	fmovrdlz	%l5,	%f18,	%f10
	movrgz	%o5,	%g4,	%o6
	alignaddrl	%i1,	%g7,	%i3
	orncc	%g6,	%i6,	%l6
	fmovdcs	%icc,	%f12,	%f29
	orn	%g1,	%g5,	%i7
	fcmps	%fcc2,	%f13,	%f20
	lduh	[%l7 + 0x7E],	%o2
	fmul8sux16	%f2,	%f8,	%f20
	edge16ln	%o0,	%i4,	%i2
	mulscc	%o4,	%l4,	%l1
	nop
	set	0x0D, %o3
	stb	%g3,	[%l7 + %o3]
	array16	%l3,	%o3,	%i0
	alignaddrl	%i5,	%l2,	%o1
	stw	%o7,	[%l7 + 0x44]
	srlx	%g2,	%l5,	%l0
	andcc	%g4,	0x00EC,	%o6
	addccc	%o5,	%i1,	%i3
	fornot2	%f6,	%f4,	%f0
	fmovdge	%icc,	%f25,	%f13
	alignaddr	%g6,	%g7,	%i6
	lduh	[%l7 + 0x62],	%l6
	ldsb	[%l7 + 0x37],	%g1
	xnor	%g5,	%o2,	%i7
	fmovdn	%icc,	%f2,	%f14
	restore %o0, %i2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1526,	%l4
	sdivcc	%i4,	0x1D1D,	%g3
	sllx	%l1,	%o3,	%i0
	std	%f24,	[%l7 + 0x18]
	edge32n	%l3,	%l2,	%i5
	ldsw	[%l7 + 0x1C],	%o1
	movgu	%icc,	%o7,	%l5
	edge8ln	%l0,	%g2,	%g4
	fmovsn	%xcc,	%f20,	%f5
	fmul8x16au	%f5,	%f16,	%f22
	st	%f17,	[%l7 + 0x74]
	srax	%o6,	0x07,	%o5
	mulx	%i1,	%i3,	%g6
	andn	%i6,	0x06B2,	%g7
	mova	%xcc,	%l6,	%g5
	ldd	[%l7 + 0x10],	%f12
	movle	%xcc,	%g1,	%i7
	edge16n	%o2,	%o0,	%o4
	edge8ln	%i2,	%i4,	%g3
	fmuld8sux16	%f17,	%f13,	%f4
	edge32ln	%l1,	%l4,	%i0
	srax	%o3,	0x04,	%l3
	edge32n	%i5,	%o1,	%o7
	fzero	%f8
	movg	%icc,	%l5,	%l0
	umulcc	%l2,	0x119F,	%g4
	edge32	%o6,	%o5,	%g2
	ldub	[%l7 + 0x4A],	%i1
	std	%f8,	[%l7 + 0x30]
	alignaddr	%i3,	%g6,	%g7
	sdivx	%i6,	0x16E3,	%g5
	sub	%g1,	%l6,	%o2
	movrgz	%i7,	0x03E,	%o0
	fmovdg	%xcc,	%f11,	%f11
	nop
	set	0x30, %g1
	ldd	[%l7 + %g1],	%o4
	movrgz	%i2,	%g3,	%l1
	edge16l	%i4,	%l4,	%o3
	addccc	%l3,	%i5,	%o1
	umulcc	%o7,	0x0370,	%i0
	ldub	[%l7 + 0x1E],	%l0
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	edge16ln	%g4,	%o6,	%o5
	fpsub16	%f22,	%f4,	%f12
	alignaddrl	%g2,	%i1,	%i3
	mulscc	%g6,	%g7,	%i6
	movcc	%icc,	%g5,	%l6
	and	%o2,	%g1,	%i7
	orcc	%o4,	%i2,	%o0
	udiv	%g3,	0x094B,	%i4
	fmovdcs	%icc,	%f14,	%f7
	sdiv	%l4,	0x0477,	%l1
	fabsd	%f22,	%f20
	fmovdge	%xcc,	%f29,	%f11
	sdivcc	%o3,	0x1E1E,	%i5
	ld	[%l7 + 0x78],	%f30
	fmul8sux16	%f2,	%f24,	%f4
	ldsh	[%l7 + 0x36],	%o1
	edge32n	%l3,	%i0,	%o7
	movrgz	%l5,	%l0,	%g4
	fxnor	%f24,	%f30,	%f14
	fmul8sux16	%f4,	%f14,	%f0
	srlx	%l2,	%o5,	%g2
	fcmped	%fcc0,	%f22,	%f28
	xor	%o6,	0x0821,	%i3
	ldub	[%l7 + 0x6C],	%g6
	umul	%g7,	0x1584,	%i6
	addc	%g5,	0x1AF9,	%i1
	stx	%o2,	[%l7 + 0x60]
	edge32ln	%g1,	%l6,	%i7
	movn	%icc,	%i2,	%o4
	movpos	%xcc,	%g3,	%i4
	movn	%icc,	%o0,	%l4
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%l0
	popc	%o3,	%o1
	std	%f30,	[%l7 + 0x20]
	fmul8sux16	%f24,	%f6,	%f22
	fsrc1s	%f21,	%f2
	edge16l	%l3,	%i0,	%i5
	mulscc	%l5,	0x1C8A,	%l0
	ldd	[%l7 + 0x10],	%o6
	fmovdcc	%xcc,	%f29,	%f17
	edge8	%l2,	%o5,	%g2
	fcmple32	%f8,	%f30,	%o6
	ldsb	[%l7 + 0x53],	%i3
	sethi	0x1B83,	%g4
	fabsd	%f2,	%f8
	or	%g7,	%g6,	%g5
	and	%i6,	%o2,	%i1
	edge8ln	%g1,	%i7,	%l6
	edge32l	%o4,	%g3,	%i2
	fabsd	%f20,	%f22
	sra	%i4,	%o0,	%l4
	ldsb	[%l7 + 0x7D],	%l1
	srl	%o1,	0x1A,	%o3
	sll	%i0,	%l3,	%l5
	and	%l0,	0x0AA5,	%i5
	andcc	%l2,	%o7,	%o5
	sir	0x0A50
	or	%o6,	0x0A6F,	%i3
	edge16ln	%g2,	%g7,	%g6
	array8	%g5,	%g4,	%i6
	movneg	%xcc,	%o2,	%i1
	srl	%g1,	0x1B,	%i7
	ldd	[%l7 + 0x78],	%f20
	movn	%xcc,	%o4,	%g3
	edge16n	%i2,	%i4,	%l6
	umul	%l4,	0x0EAA,	%o0
	fmul8x16	%f30,	%f4,	%f30
	fmovdcs	%icc,	%f6,	%f18
	stx	%l1,	[%l7 + 0x58]
	save %o1, %i0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o3,	0x392,	%l0
	alignaddrl	%l5,	%l2,	%o7
	edge16	%i5,	%o6,	%o5
	ldd	[%l7 + 0x58],	%f18
	addccc	%i3,	0x154B,	%g7
	fpadd32	%f20,	%f10,	%f4
	movl	%xcc,	%g6,	%g2
	edge16l	%g5,	%g4,	%o2
	edge16	%i6,	%g1,	%i7
	ldx	[%l7 + 0x30],	%i1
	fmovs	%f19,	%f6
	fcmpne32	%f6,	%f0,	%o4
	movcc	%xcc,	%i2,	%i4
	fmovsne	%icc,	%f30,	%f5
	umul	%l6,	0x0C2A,	%l4
	sub	%g3,	%o0,	%l1
	array16	%o1,	%l3,	%o3
	fpadd32s	%f31,	%f6,	%f1
	srlx	%l0,	%l5,	%l2
	sdivcc	%i0,	0x0E16,	%o7
	sll	%i5,	0x0D,	%o5
	xnor	%i3,	0x080D,	%g7
	orncc	%g6,	%o6,	%g5
	fcmped	%fcc0,	%f20,	%f18
	fmul8x16	%f27,	%f8,	%f16
	edge8ln	%g2,	%o2,	%g4
	andncc	%g1,	%i7,	%i1
	stw	%i6,	[%l7 + 0x4C]
	subccc	%o4,	%i4,	%l6
	mulx	%l4,	%g3,	%o0
	edge32	%i2,	%l1,	%l3
	fmuld8ulx16	%f16,	%f15,	%f24
	stx	%o1,	[%l7 + 0x38]
	add	%l0,	0x1DD4,	%l5
	subc	%l2,	%i0,	%o3
	popc	%o7,	%o5
	movge	%xcc,	%i3,	%i5
	movrlez	%g6,	0x35E,	%o6
	edge32l	%g5,	%g2,	%o2
	movrgez	%g4,	%g7,	%i7
	orcc	%g1,	%i1,	%i6
	fmovrdgz	%o4,	%f18,	%f0
	st	%f22,	[%l7 + 0x58]
	movl	%icc,	%i4,	%l4
	addcc	%g3,	%l6,	%o0
	fmovsvs	%xcc,	%f28,	%f29
	movvs	%xcc,	%l1,	%i2
	alignaddrl	%o1,	%l0,	%l5
	srax	%l2,	%l3,	%i0
	movrgz	%o7,	%o5,	%i3
	movcc	%xcc,	%i5,	%g6
	ldd	[%l7 + 0x20],	%f16
	mulx	%o6,	%o3,	%g2
	restore %o2, %g4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%g5,	%f6,	%f24
	fmovdn	%icc,	%f25,	%f29
	stx	%i7,	[%l7 + 0x40]
	xnor	%i1,	%g1,	%i6
	xnor	%o4,	0x1C19,	%i4
	edge32l	%l4,	%l6,	%o0
	sll	%l1,	0x1B,	%i2
	fornot1s	%f23,	%f4,	%f10
	edge16n	%o1,	%l0,	%l5
	ldd	[%l7 + 0x28],	%f20
	movrgez	%l2,	%l3,	%i0
	andn	%o7,	%g3,	%o5
	fmul8sux16	%f30,	%f2,	%f24
	fmovsneg	%icc,	%f29,	%f14
	smulcc	%i5,	%g6,	%o6
	stb	%o3,	[%l7 + 0x65]
	andn	%i3,	0x087B,	%g2
	for	%f30,	%f24,	%f28
	ldsb	[%l7 + 0x5D],	%g4
	sir	0x1E64
	sth	%g7,	[%l7 + 0x2C]
	alignaddr	%o2,	%g5,	%i7
	ld	[%l7 + 0x2C],	%f28
	orcc	%g1,	0x0DF0,	%i6
	umul	%i1,	0x0692,	%o4
	fmovrdgz	%l4,	%f10,	%f28
	fmovdcc	%icc,	%f8,	%f13
	srlx	%i4,	0x1C,	%o0
	fmovdcs	%xcc,	%f19,	%f7
	fcmple32	%f24,	%f4,	%l6
	fcmpes	%fcc1,	%f22,	%f13
	sll	%l1,	%i2,	%l0
	fnand	%f12,	%f24,	%f8
	popc	%l5,	%o1
	udivcc	%l3,	0x120B,	%i0
	sethi	0x0936,	%o7
	mova	%xcc,	%l2,	%g3
	ld	[%l7 + 0x08],	%f23
	fmul8x16	%f21,	%f18,	%f22
	sth	%i5,	[%l7 + 0x3C]
	movrgez	%o5,	%o6,	%g6
	ldd	[%l7 + 0x48],	%o2
	fnands	%f24,	%f1,	%f15
	alignaddr	%i3,	%g2,	%g4
	fmovrdgez	%o2,	%f6,	%f4
	mulx	%g5,	%g7,	%g1
	xnorcc	%i6,	%i7,	%o4
	fnor	%f26,	%f4,	%f30
	subccc	%i1,	0x03C2,	%l4
	addccc	%o0,	%l6,	%i4
	edge16ln	%l1,	%i2,	%l0
	srax	%o1,	0x15,	%l5
	sdivcc	%l3,	0x1B2A,	%i0
	popc	%l2,	%o7
	edge16l	%i5,	%g3,	%o5
	fmovrdgz	%g6,	%f12,	%f14
	sethi	0x05C4,	%o6
	xor	%i3,	%g2,	%o3
	stw	%o2,	[%l7 + 0x44]
	movleu	%xcc,	%g5,	%g4
	sll	%g1,	%g7,	%i6
	and	%o4,	0x007E,	%i1
	movrlz	%l4,	0x307,	%i7
	orcc	%l6,	%o0,	%i4
	smul	%i2,	0x19B2,	%l0
	movl	%xcc,	%o1,	%l5
	edge8n	%l1,	%l3,	%l2
	ldx	[%l7 + 0x10],	%o7
	andn	%i0,	0x02B6,	%i5
	movrlz	%g3,	%o5,	%g6
	movrgz	%i3,	%g2,	%o3
	andcc	%o6,	%g5,	%o2
	alignaddrl	%g4,	%g1,	%g7
	movne	%xcc,	%i6,	%i1
	stx	%l4,	[%l7 + 0x10]
	or	%o4,	0x140D,	%l6
	fmovsle	%xcc,	%f15,	%f4
	srax	%o0,	%i7,	%i4
	fmovsl	%xcc,	%f24,	%f1
	edge32l	%i2,	%o1,	%l0
	fmul8sux16	%f28,	%f12,	%f26
	srax	%l1,	%l5,	%l2
	ldsw	[%l7 + 0x64],	%l3
	alignaddrl	%i0,	%i5,	%g3
	movl	%icc,	%o5,	%o7
	move	%xcc,	%i3,	%g2
	stx	%g6,	[%l7 + 0x48]
	movgu	%xcc,	%o6,	%g5
	lduh	[%l7 + 0x18],	%o3
	stb	%g4,	[%l7 + 0x10]
	fmovdvs	%icc,	%f12,	%f4
	movvc	%icc,	%g1,	%g7
	mulscc	%o2,	0x08F0,	%i1
	fxor	%f30,	%f20,	%f4
	array32	%i6,	%l4,	%l6
	movgu	%xcc,	%o4,	%o0
	fmovdl	%xcc,	%f27,	%f5
	fmovrdne	%i4,	%f10,	%f14
	ldx	[%l7 + 0x18],	%i7
	array8	%i2,	%l0,	%o1
	edge32l	%l1,	%l2,	%l5
	ldsb	[%l7 + 0x70],	%l3
	array8	%i5,	%i0,	%o5
	fmul8x16au	%f14,	%f24,	%f10
	stx	%o7,	[%l7 + 0x60]
	edge16	%g3,	%i3,	%g2
	srl	%o6,	%g6,	%g5
	mova	%xcc,	%g4,	%g1
	edge8n	%o3,	%g7,	%i1
	nop
	set	0x38, %i4
	std	%f6,	[%l7 + %i4]
	xnor	%o2,	0x0C8C,	%l4
	fmovdcs	%icc,	%f5,	%f14
	st	%f27,	[%l7 + 0x18]
	srlx	%i6,	%l6,	%o0
	save %o4, 0x1EC3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f0,	[%l7 + 0x68]
	movvc	%xcc,	%i7,	%l0
	fnors	%f21,	%f0,	%f30
	edge8n	%i2,	%l1,	%o1
	array16	%l2,	%l3,	%i5
	movrlz	%l5,	%i0,	%o5
	lduw	[%l7 + 0x3C],	%o7
	edge16l	%g3,	%i3,	%g2
	lduw	[%l7 + 0x70],	%o6
	addccc	%g5,	0x1537,	%g4
	xorcc	%g6,	0x0C5E,	%g1
	subcc	%g7,	%i1,	%o2
	fmovdvc	%icc,	%f8,	%f10
	xnorcc	%o3,	0x0185,	%l4
	fpmerge	%f11,	%f14,	%f6
	ldsh	[%l7 + 0x6C],	%i6
	fxnors	%f10,	%f4,	%f11
	lduh	[%l7 + 0x10],	%o0
	array8	%o4,	%i4,	%i7
	movle	%xcc,	%l6,	%l0
	movcc	%icc,	%i2,	%o1
	fsrc2	%f20,	%f12
	edge8n	%l1,	%l3,	%l2
	fandnot2s	%f13,	%f15,	%f25
	srlx	%l5,	0x01,	%i5
	ldsb	[%l7 + 0x7E],	%o5
	fxor	%f30,	%f16,	%f10
	xnorcc	%o7,	%i0,	%g3
	sethi	0x12C6,	%g2
	fmovde	%icc,	%f23,	%f15
	fmul8x16au	%f4,	%f24,	%f22
	fnot2	%f6,	%f12
	andncc	%i3,	%g5,	%g4
	fxnors	%f5,	%f25,	%f6
	sub	%g6,	0x05B1,	%g1
	fpack32	%f30,	%f6,	%f20
	movrne	%g7,	0x39B,	%o6
	lduw	[%l7 + 0x50],	%o2
	edge8n	%i1,	%l4,	%o3
	edge8n	%i6,	%o0,	%o4
	move	%xcc,	%i7,	%i4
	andcc	%l6,	%l0,	%i2
	andncc	%o1,	%l1,	%l3
	edge16n	%l5,	%i5,	%o5
	alignaddrl	%o7,	%i0,	%g3
	fmovs	%f18,	%f14
	edge16n	%l2,	%i3,	%g5
	array16	%g4,	%g2,	%g1
	edge16l	%g6,	%g7,	%o6
	fandnot2s	%f20,	%f30,	%f22
	edge32ln	%o2,	%i1,	%l4
	move	%icc,	%i6,	%o0
	movrgz	%o3,	%o4,	%i4
	udivcc	%i7,	0x069F,	%l6
	umul	%i2,	%o1,	%l1
	edge16	%l3,	%l0,	%i5
	sub	%l5,	%o5,	%i0
	sllx	%g3,	0x19,	%l2
	fones	%f3
	sth	%i3,	[%l7 + 0x6E]
	fcmpeq16	%f12,	%f16,	%g5
	fmovda	%xcc,	%f1,	%f6
	ldd	[%l7 + 0x50],	%f14
	edge8l	%o7,	%g4,	%g2
	orn	%g6,	%g7,	%g1
	stb	%o6,	[%l7 + 0x1F]
	fmul8sux16	%f12,	%f8,	%f26
	sra	%i1,	0x09,	%l4
	alignaddr	%i6,	%o0,	%o2
	movneg	%icc,	%o4,	%o3
	movneg	%icc,	%i4,	%l6
	movrlez	%i2,	0x285,	%o1
	fors	%f18,	%f23,	%f29
	sub	%l1,	%l3,	%l0
	ld	[%l7 + 0x68],	%f27
	udivx	%i7,	0x0836,	%l5
	udivcc	%i5,	0x15CE,	%i0
	sllx	%g3,	0x0E,	%l2
	sub	%o5,	0x1109,	%g5
	movrgz	%i3,	%o7,	%g4
	lduh	[%l7 + 0x6C],	%g2
	sub	%g7,	%g1,	%g6
	movne	%icc,	%i1,	%l4
	stw	%o6,	[%l7 + 0x2C]
	ld	[%l7 + 0x5C],	%f18
	movne	%xcc,	%i6,	%o2
	movrlz	%o0,	%o3,	%i4
	srax	%l6,	0x1C,	%i2
	umulcc	%o1,	%l1,	%l3
	fmovdcc	%icc,	%f15,	%f21
	edge32ln	%l0,	%i7,	%l5
	fnegd	%f6,	%f28
	edge8	%o4,	%i5,	%i0
	umul	%g3,	0x1D5F,	%l2
	edge32	%o5,	%g5,	%i3
	lduh	[%l7 + 0x44],	%o7
	addcc	%g4,	0x0A12,	%g2
	sdiv	%g1,	0x14D5,	%g7
	array32	%g6,	%i1,	%o6
	fpsub32	%f0,	%f14,	%f28
	fnegd	%f24,	%f6
	fmovs	%f31,	%f0
	edge8l	%i6,	%l4,	%o0
	alignaddr	%o3,	%i4,	%o2
	edge16n	%l6,	%o1,	%i2
	srlx	%l3,	0x01,	%l1
	orncc	%i7,	%l5,	%o4
	udiv	%i5,	0x1314,	%l0
	sethi	0x0CD7,	%i0
	fpadd32s	%f13,	%f4,	%f26
	addc	%l2,	0x0F02,	%g3
	movrgez	%g5,	%o5,	%o7
	ldub	[%l7 + 0x7C],	%i3
	fsrc1s	%f25,	%f0
	fnegd	%f4,	%f4
	udivx	%g2,	0x0960,	%g1
	sdivx	%g7,	0x0D76,	%g4
	and	%g6,	%o6,	%i1
	fmovrde	%l4,	%f0,	%f24
	ldd	[%l7 + 0x38],	%f28
	mulx	%i6,	%o3,	%o0
	fornot1	%f10,	%f6,	%f8
	fandnot1s	%f25,	%f4,	%f28
	xnor	%o2,	0x04A4,	%i4
	ld	[%l7 + 0x1C],	%f25
	array32	%o1,	%l6,	%i2
	array8	%l1,	%l3,	%l5
	edge8n	%o4,	%i7,	%i5
	udiv	%l0,	0x09B4,	%l2
	and	%g3,	%g5,	%i0
	orncc	%o7,	0x082A,	%i3
	movne	%icc,	%o5,	%g2
	smulcc	%g7,	0x0278,	%g1
	array32	%g4,	%o6,	%g6
	movleu	%xcc,	%i1,	%i6
	movg	%xcc,	%l4,	%o3
	edge8l	%o0,	%o2,	%i4
	popc	%l6,	%o1
	addcc	%i2,	%l1,	%l5
	lduh	[%l7 + 0x0E],	%l3
	edge16	%o4,	%i7,	%l0
	ldd	[%l7 + 0x30],	%f6
	fnot2s	%f1,	%f6
	edge16ln	%l2,	%g3,	%g5
	lduh	[%l7 + 0x5C],	%i0
	fpadd16s	%f27,	%f5,	%f7
	nop
	set	0x38, %i1
	lduw	[%l7 + %i1],	%i5
	movne	%xcc,	%i3,	%o5
	nop
	set	0x70, %l4
	stx	%o7,	[%l7 + %l4]
	srax	%g7,	0x1A,	%g1
	sdivcc	%g4,	0x16EC,	%o6
	nop
	set	0x24, %i0
	ldsw	[%l7 + %i0],	%g6
	movcs	%xcc,	%g2,	%i6
	movle	%icc,	%i1,	%l4
	orn	%o3,	%o2,	%i4
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	siam	0x5
	fabsd	%f18,	%f26
	sir	0x0C5D
	movg	%icc,	%i2,	%l1
	andn	%o1,	0x133D,	%l3
	ldd	[%l7 + 0x58],	%o4
	edge8	%l5,	%i7,	%l0
	fmul8x16au	%f5,	%f26,	%f16
	orcc	%g3,	0x1187,	%l2
	addc	%g5,	%i0,	%i3
	alignaddrl	%o5,	%o7,	%i5
	movl	%icc,	%g7,	%g4
	lduh	[%l7 + 0x5E],	%g1
	fmovrdlz	%g6,	%f4,	%f18
	fxnor	%f26,	%f14,	%f12
	fnegd	%f22,	%f16
	srax	%g2,	%o6,	%i6
	alignaddrl	%l4,	%o3,	%i1
	stb	%o2,	[%l7 + 0x18]
	popc	%l6,	%i4
	umul	%o0,	%i2,	%o1
	addcc	%l3,	%o4,	%l1
	sir	0x19B6
	std	%f14,	[%l7 + 0x68]
	fmovdpos	%xcc,	%f28,	%f15
	subcc	%i7,	0x1C54,	%l0
	fmovdneg	%icc,	%f10,	%f31
	movvs	%icc,	%g3,	%l2
	edge8	%l5,	%g5,	%i0
	nop
	set	0x12, %g2
	sth	%i3,	[%l7 + %g2]
	popc	%o7,	%o5
	fcmpgt32	%f6,	%f12,	%i5
	st	%f1,	[%l7 + 0x60]
	edge16n	%g4,	%g7,	%g6
	srax	%g2,	0x0B,	%o6
	movle	%xcc,	%g1,	%l4
	ldd	[%l7 + 0x50],	%f20
	fmovsg	%xcc,	%f25,	%f3
	fmovrdne	%i6,	%f0,	%f4
	edge16n	%o3,	%i1,	%l6
	ldx	[%l7 + 0x68],	%i4
	edge32l	%o0,	%o2,	%i2
	save %o1, 0x0162, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l3,	[%l7 + 0x78]
	sth	%i7,	[%l7 + 0x26]
	movvs	%xcc,	%l0,	%g3
	fandnot2s	%f27,	%f10,	%f6
	sllx	%l1,	0x17,	%l2
	movgu	%xcc,	%l5,	%i0
	fmul8x16al	%f28,	%f10,	%f0
	sll	%g5,	0x18,	%i3
	fandnot1s	%f31,	%f8,	%f0
	srax	%o7,	0x1F,	%i5
	movge	%icc,	%o5,	%g7
	movneg	%icc,	%g6,	%g2
	edge16l	%g4,	%g1,	%o6
	movle	%xcc,	%i6,	%l4
	xnor	%o3,	%l6,	%i4
	sethi	0x1304,	%o0
	edge16n	%i1,	%o2,	%i2
	movrgz	%o4,	%o1,	%i7
	movcs	%xcc,	%l3,	%l0
	udivx	%l1,	0x16FA,	%l2
	lduh	[%l7 + 0x4A],	%l5
	fmovdg	%xcc,	%f8,	%f24
	orcc	%g3,	%g5,	%i0
	stx	%i3,	[%l7 + 0x70]
	ldsw	[%l7 + 0x78],	%i5
	sdivcc	%o7,	0x12D2,	%o5
	fxors	%f22,	%f14,	%f11
	edge8l	%g6,	%g2,	%g4
	nop
	set	0x3C, %g7
	stb	%g7,	[%l7 + %g7]
	subccc	%g1,	%i6,	%l4
	ldub	[%l7 + 0x51],	%o6
	movrne	%l6,	0x38E,	%o3
	array8	%o0,	%i4,	%o2
	ldsb	[%l7 + 0x2B],	%i2
	subcc	%o4,	%o1,	%i1
	andn	%l3,	%i7,	%l0
	movne	%icc,	%l1,	%l2
	xnorcc	%g3,	0x1AD2,	%g5
	mova	%xcc,	%l5,	%i3
	edge32l	%i0,	%o7,	%i5
	movrlez	%g6,	%g2,	%o5
	fmovdge	%icc,	%f29,	%f10
	and	%g4,	0x1E6A,	%g7
	andn	%i6,	0x1C6C,	%g1
	umul	%o6,	%l4,	%l6
	smul	%o0,	0x1566,	%i4
	stw	%o3,	[%l7 + 0x4C]
	nop
	set	0x70, %i7
	std	%f26,	[%l7 + %i7]
	movg	%icc,	%o2,	%i2
	faligndata	%f6,	%f28,	%f16
	orncc	%o1,	0x0564,	%o4
	mulscc	%l3,	0x0721,	%i1
	sll	%i7,	%l0,	%l2
	fcmped	%fcc1,	%f6,	%f28
	edge32n	%l1,	%g5,	%l5
	fmul8x16al	%f23,	%f18,	%f2
	fmovrsgz	%g3,	%f3,	%f0
	smulcc	%i0,	%o7,	%i5
	sra	%i3,	0x04,	%g6
	srlx	%o5,	%g2,	%g4
	movrlez	%g7,	0x3B6,	%g1
	mova	%icc,	%i6,	%l4
	udivx	%l6,	0x039D,	%o0
	movn	%icc,	%o6,	%i4
	sir	0x1497
	edge32ln	%o2,	%i2,	%o3
	xnor	%o4,	%o1,	%i1
	subcc	%l3,	%l0,	%l2
	fnands	%f12,	%f31,	%f24
	movrlez	%l1,	0x34F,	%g5
	edge8n	%i7,	%g3,	%l5
	add	%i0,	0x05AF,	%i5
	edge16n	%o7,	%g6,	%i3
	fpadd16s	%f27,	%f23,	%f19
	fmovsgu	%icc,	%f5,	%f14
	fandnot1	%f10,	%f10,	%f10
	movrlz	%o5,	%g2,	%g4
	sll	%g7,	0x17,	%i6
	lduw	[%l7 + 0x1C],	%l4
	mova	%icc,	%l6,	%g1
	fmul8x16	%f17,	%f16,	%f2
	srl	%o0,	0x03,	%i4
	ldsb	[%l7 + 0x4B],	%o6
	stb	%o2,	[%l7 + 0x1D]
	umulcc	%i2,	%o3,	%o4
	ldub	[%l7 + 0x28],	%o1
	fmovde	%xcc,	%f28,	%f1
	fmovrdgez	%i1,	%f16,	%f28
	movrgez	%l3,	%l0,	%l1
	smul	%l2,	%i7,	%g3
	fone	%f14
	orcc	%l5,	0x1EB4,	%g5
	sdiv	%i0,	0x06F5,	%i5
	xorcc	%o7,	0x0845,	%g6
	fornot2	%f10,	%f2,	%f6
	fmovsvc	%xcc,	%f3,	%f31
	fpadd32	%f0,	%f4,	%f2
	addccc	%o5,	0x021A,	%i3
	srlx	%g4,	%g7,	%i6
	movn	%xcc,	%l4,	%g2
	edge32ln	%g1,	%l6,	%i4
	lduw	[%l7 + 0x74],	%o6
	movgu	%xcc,	%o0,	%i2
	lduh	[%l7 + 0x38],	%o2
	fpack32	%f12,	%f14,	%f18
	edge16	%o3,	%o1,	%i1
	ldsb	[%l7 + 0x16],	%o4
	edge8l	%l3,	%l1,	%l0
	array16	%l2,	%i7,	%g3
	sth	%g5,	[%l7 + 0x7E]
	ldx	[%l7 + 0x58],	%i0
	pdist	%f10,	%f22,	%f26
	sllx	%i5,	%o7,	%g6
	edge32l	%o5,	%l5,	%i3
	sll	%g7,	%g4,	%l4
	fmovsleu	%xcc,	%f2,	%f12
	st	%f24,	[%l7 + 0x44]
	ldd	[%l7 + 0x38],	%f12
	add	%i6,	0x0D0C,	%g1
	udiv	%g2,	0x030B,	%i4
	movne	%xcc,	%o6,	%o0
	fmul8x16	%f27,	%f10,	%f2
	siam	0x7
	movcc	%icc,	%i2,	%o2
	mova	%xcc,	%o3,	%o1
	smulcc	%i1,	0x15A4,	%o4
	mulscc	%l6,	%l1,	%l3
	edge8n	%l2,	%l0,	%g3
	sub	%g5,	%i7,	%i5
	fcmpne32	%f6,	%f24,	%o7
	edge16l	%g6,	%i0,	%l5
	edge32ln	%i3,	%g7,	%g4
	alignaddrl	%l4,	%o5,	%g1
	orcc	%i6,	0x0878,	%g2
	move	%icc,	%o6,	%i4
	andcc	%o0,	%o2,	%o3
	restore %i2, 0x1E0A, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o4,	0x0C32,	%o1
	umulcc	%l1,	0x01A4,	%l6
	sllx	%l2,	0x17,	%l3
	stx	%l0,	[%l7 + 0x60]
	sdivx	%g5,	0x0E15,	%i7
	fmovsa	%icc,	%f18,	%f15
	sra	%g3,	%o7,	%g6
	edge16ln	%i0,	%i5,	%i3
	movrgz	%l5,	%g4,	%l4
	fmovrsgez	%g7,	%f14,	%f12
	fmovrsne	%g1,	%f23,	%f13
	sdivcc	%i6,	0x08FC,	%o5
	fmul8x16	%f14,	%f18,	%f28
	movgu	%xcc,	%o6,	%g2
	addc	%i4,	%o2,	%o3
	srl	%o0,	0x01,	%i1
	umulcc	%i2,	0x1B69,	%o4
	subccc	%l1,	0x18EF,	%l6
	edge32ln	%l2,	%l3,	%l0
	sdiv	%o1,	0x1963,	%i7
	std	%f30,	[%l7 + 0x30]
	movrne	%g3,	%o7,	%g5
	fmovrde	%g6,	%f2,	%f6
	movgu	%xcc,	%i0,	%i3
	fmovscc	%icc,	%f26,	%f9
	fmovscs	%icc,	%f2,	%f3
	alignaddrl	%l5,	%i5,	%g4
	ldsh	[%l7 + 0x28],	%l4
	and	%g7,	%i6,	%g1
	fpsub16s	%f21,	%f16,	%f6
	fpmerge	%f11,	%f6,	%f6
	fmovrslz	%o6,	%f5,	%f15
	fmovrslez	%o5,	%f19,	%f30
	nop
	set	0x30, %g6
	ldx	[%l7 + %g6],	%i4
	movrgz	%g2,	0x00A,	%o3
	movleu	%xcc,	%o0,	%i1
	subcc	%i2,	0x0021,	%o2
	sdivcc	%o4,	0x08EF,	%l6
	fandnot1	%f16,	%f24,	%f16
	andn	%l1,	%l3,	%l2
	fmuld8ulx16	%f5,	%f10,	%f2
	sdivcc	%l0,	0x0BE3,	%i7
	mova	%xcc,	%g3,	%o7
	edge8	%g5,	%g6,	%o1
	edge8n	%i0,	%l5,	%i3
	fpadd16	%f20,	%f28,	%f8
	movvc	%xcc,	%g4,	%i5
	fmovdcc	%xcc,	%f20,	%f29
	srax	%l4,	%g7,	%i6
	fnot1	%f18,	%f18
	xor	%o6,	%g1,	%o5
	fmovrse	%i4,	%f14,	%f18
	ldsh	[%l7 + 0x24],	%o3
	sth	%g2,	[%l7 + 0x22]
	fcmpes	%fcc2,	%f7,	%f3
	fmovdn	%icc,	%f0,	%f10
	stw	%i1,	[%l7 + 0x58]
	fmuld8sux16	%f0,	%f9,	%f8
	sra	%i2,	0x1A,	%o0
	ldd	[%l7 + 0x48],	%f30
	edge8l	%o2,	%o4,	%l1
	fpadd32s	%f12,	%f9,	%f21
	umul	%l3,	0x066A,	%l6
	nop
	set	0x2E, %o5
	lduh	[%l7 + %o5],	%l2
	sub	%i7,	0x1189,	%g3
	fmul8x16au	%f7,	%f17,	%f4
	edge8ln	%o7,	%g5,	%l0
	ldsb	[%l7 + 0x1E],	%g6
	movpos	%xcc,	%i0,	%o1
	array8	%i3,	%g4,	%l5
	mulscc	%i5,	0x074A,	%l4
	srax	%i6,	0x10,	%o6
	movl	%icc,	%g1,	%g7
	movcc	%icc,	%i4,	%o5
	xnorcc	%o3,	%i1,	%g2
	movrlez	%i2,	%o0,	%o2
	fcmpd	%fcc3,	%f2,	%f2
	fmovsgu	%icc,	%f10,	%f2
	fcmpgt16	%f28,	%f18,	%l1
	movle	%xcc,	%l3,	%l6
	edge32l	%o4,	%l2,	%i7
	sth	%o7,	[%l7 + 0x66]
	fmovdvs	%xcc,	%f13,	%f0
	edge8ln	%g3,	%g5,	%l0
	fmovdleu	%icc,	%f6,	%f28
	smulcc	%g6,	0x1833,	%o1
	udiv	%i0,	0x0D81,	%i3
	smulcc	%g4,	0x11A3,	%l5
	movrlez	%l4,	0x0FB,	%i6
	fpack32	%f22,	%f30,	%f16
	addc	%i5,	0x05A5,	%g1
	ldsh	[%l7 + 0x6A],	%g7
	sth	%o6,	[%l7 + 0x46]
	edge32n	%o5,	%o3,	%i4
	movpos	%xcc,	%i1,	%g2
	fmovsg	%icc,	%f22,	%f29
	edge16n	%i2,	%o0,	%o2
	addcc	%l3,	%l6,	%l1
	lduw	[%l7 + 0x40],	%l2
	fpack32	%f6,	%f4,	%f4
	fpackfix	%f28,	%f21
	alignaddrl	%o4,	%o7,	%i7
	andn	%g5,	0x0F48,	%l0
	xnorcc	%g6,	0x145A,	%g3
	orncc	%i0,	0x1919,	%i3
	fcmpes	%fcc0,	%f5,	%f18
	edge8	%o1,	%g4,	%l5
	ldx	[%l7 + 0x10],	%i6
	edge16l	%l4,	%i5,	%g7
	pdist	%f20,	%f26,	%f18
	addcc	%g1,	%o6,	%o3
	fabsd	%f0,	%f30
	smul	%i4,	0x0066,	%o5
	xnor	%i1,	%i2,	%o0
	edge16	%g2,	%o2,	%l3
	movl	%xcc,	%l1,	%l2
	umulcc	%o4,	0x057C,	%l6
	xor	%o7,	%i7,	%l0
	mulx	%g6,	0x14F3,	%g5
	ldd	[%l7 + 0x58],	%i0
	fcmple32	%f26,	%f20,	%g3
	sdivcc	%o1,	0x0D0F,	%g4
	movl	%xcc,	%i3,	%i6
	ldsb	[%l7 + 0x32],	%l4
	fpack16	%f28,	%f9
	ldd	[%l7 + 0x08],	%f30
	edge16	%i5,	%l5,	%g7
	fmuld8sux16	%f25,	%f26,	%f10
	xorcc	%g1,	0x09A4,	%o6
	addccc	%o3,	0x007C,	%o5
	ldsw	[%l7 + 0x7C],	%i1
	faligndata	%f16,	%f2,	%f16
	fxor	%f28,	%f12,	%f24
	array16	%i2,	%o0,	%g2
	movrlez	%o2,	0x1EF,	%i4
	umulcc	%l3,	%l2,	%l1
	movpos	%xcc,	%o4,	%o7
	lduw	[%l7 + 0x58],	%i7
	movcs	%icc,	%l0,	%g6
	sra	%l6,	%i0,	%g5
	ldsh	[%l7 + 0x12],	%g3
	edge32l	%g4,	%i3,	%i6
	srl	%o1,	0x1D,	%i5
	add	%l4,	%l5,	%g7
	movg	%icc,	%g1,	%o6
	and	%o5,	0x1285,	%i1
	fcmpgt32	%f0,	%f30,	%i2
	edge32l	%o0,	%o3,	%g2
	edge32l	%o2,	%l3,	%i4
	movvc	%xcc,	%l1,	%l2
	fcmpgt16	%f14,	%f12,	%o4
	st	%f16,	[%l7 + 0x34]
	fabsd	%f16,	%f8
	fmovda	%icc,	%f1,	%f29
	movge	%xcc,	%o7,	%l0
	addccc	%i7,	0x19AA,	%g6
	udiv	%i0,	0x0C3E,	%l6
	addcc	%g3,	%g4,	%g5
	fpackfix	%f20,	%f15
	andn	%i6,	%o1,	%i5
	addccc	%l4,	%l5,	%i3
	move	%icc,	%g7,	%g1
	fmovscc	%icc,	%f20,	%f8
	edge16	%o5,	%o6,	%i2
	fmovdleu	%icc,	%f0,	%f22
	std	%f28,	[%l7 + 0x78]
	fcmps	%fcc1,	%f5,	%f10
	movle	%xcc,	%i1,	%o3
	subccc	%o0,	%g2,	%l3
	save %o2, 0x0FAF, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x6A, %o4
	ldsh	[%l7 + %o4],	%i4
	movpos	%xcc,	%o4,	%o7
	movgu	%xcc,	%l2,	%l0
	sll	%g6,	0x1A,	%i0
	movvc	%xcc,	%l6,	%g3
	fmovrde	%i7,	%f2,	%f20
	addc	%g4,	%g5,	%i6
	fpsub16s	%f0,	%f10,	%f19
	xnor	%o1,	0x19C1,	%l4
	edge8n	%l5,	%i3,	%g7
	movle	%xcc,	%g1,	%i5
	subcc	%o6,	0x034A,	%o5
	andn	%i2,	%i1,	%o0
	movn	%icc,	%g2,	%o3
	udivcc	%l3,	0x1EDC,	%l1
	xnor	%i4,	%o4,	%o2
	movl	%xcc,	%o7,	%l0
	fmovdvs	%icc,	%f19,	%f21
	edge8n	%l2,	%i0,	%g6
	lduh	[%l7 + 0x66],	%l6
	fpadd16	%f4,	%f12,	%f0
	movvc	%icc,	%i7,	%g3
	mova	%icc,	%g5,	%g4
	edge32ln	%i6,	%l4,	%l5
	mulx	%o1,	0x018C,	%g7
	sub	%i3,	%g1,	%o6
	udivx	%o5,	0x1DBC,	%i5
	addcc	%i1,	%i2,	%g2
	std	%f28,	[%l7 + 0x60]
	movn	%icc,	%o3,	%l3
	umul	%o0,	%i4,	%l1
	orncc	%o4,	%o2,	%l0
	fabss	%f11,	%f18
	sdiv	%l2,	0x0B2D,	%i0
	fcmpd	%fcc0,	%f0,	%f24
	orcc	%o7,	0x0469,	%g6
	alignaddrl	%l6,	%g3,	%i7
	movge	%icc,	%g4,	%i6
	edge8	%l4,	%g5,	%l5
	movn	%xcc,	%o1,	%i3
	movpos	%icc,	%g7,	%o6
	movn	%icc,	%g1,	%i5
	ldd	[%l7 + 0x08],	%i0
	faligndata	%f30,	%f6,	%f30
	movleu	%icc,	%o5,	%i2
	fpsub16s	%f13,	%f23,	%f20
	edge8	%o3,	%l3,	%o0
	umulcc	%g2,	0x1CCA,	%l1
	srlx	%o4,	%o2,	%i4
	sra	%l0,	%l2,	%o7
	popc	0x001F,	%i0
	xnor	%l6,	0x02D2,	%g6
	fmovdpos	%icc,	%f14,	%f3
	orn	%g3,	%i7,	%g4
	andn	%i6,	%g5,	%l5
	andncc	%l4,	%i3,	%o1
	stw	%g7,	[%l7 + 0x28]
	fmovrslez	%o6,	%f29,	%f5
	xnorcc	%i5,	%g1,	%i1
	movre	%i2,	%o5,	%o3
	orcc	%o0,	%g2,	%l1
	ldx	[%l7 + 0x18],	%o4
	fzero	%f6
	or	%l3,	0x1BE8,	%i4
	std	%f26,	[%l7 + 0x18]
	movrgz	%o2,	%l2,	%o7
	movrgez	%l0,	%l6,	%i0
	ldd	[%l7 + 0x20],	%f6
	st	%f26,	[%l7 + 0x0C]
	fnot1	%f0,	%f8
	fones	%f19
	smul	%g3,	%i7,	%g4
	mova	%xcc,	%g6,	%i6
	movvc	%xcc,	%l5,	%g5
	fnot2	%f16,	%f8
	fcmpeq32	%f2,	%f26,	%l4
	edge8l	%o1,	%g7,	%o6
	xorcc	%i5,	%i3,	%g1
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%i2
	movre	%i1,	0x0DB,	%o5
	smul	%o0,	%o3,	%l1
	movrgez	%g2,	0x329,	%o4
	fandnot1s	%f18,	%f13,	%f16
	xnorcc	%i4,	%o2,	%l2
	fabsd	%f30,	%f12
	edge32n	%o7,	%l0,	%l3
	fxor	%f18,	%f8,	%f22
	addcc	%l6,	%g3,	%i7
	movrne	%i0,	0x024,	%g6
	st	%f24,	[%l7 + 0x38]
	ldd	[%l7 + 0x78],	%i6
	fpsub16	%f4,	%f12,	%f4
	addcc	%g4,	%g5,	%l4
	edge32n	%o1,	%g7,	%l5
	stb	%o6,	[%l7 + 0x53]
	and	%i5,	%g1,	%i3
	fxor	%f10,	%f18,	%f24
	lduw	[%l7 + 0x68],	%i2
	move	%xcc,	%o5,	%o0
	xorcc	%o3,	%l1,	%g2
	edge32n	%o4,	%i4,	%o2
	srl	%i1,	0x08,	%l2
	addccc	%o7,	%l3,	%l0
	fcmpne32	%f6,	%f2,	%l6
	srax	%g3,	0x06,	%i7
	movg	%xcc,	%g6,	%i6
	for	%f24,	%f22,	%f20
	fmovsvc	%icc,	%f4,	%f12
	fsrc2s	%f31,	%f5
	edge8ln	%i0,	%g5,	%g4
	xorcc	%l4,	0x1967,	%g7
	or	%o1,	%l5,	%o6
	array32	%i5,	%g1,	%i2
	fmovsne	%icc,	%f23,	%f12
	edge8l	%i3,	%o5,	%o3
	array16	%l1,	%o0,	%g2
	alignaddr	%o4,	%o2,	%i4
	subcc	%i1,	%l2,	%l3
	movre	%l0,	0x10D,	%o7
	ldsh	[%l7 + 0x0E],	%g3
	fnot1	%f24,	%f24
	fornot1	%f30,	%f18,	%f0
	fmovsa	%icc,	%f12,	%f30
	save %i7, 0x1D79, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i6,	%i0,	%g5
	lduh	[%l7 + 0x56],	%g4
	orncc	%l6,	%g7,	%o1
	xnor	%l5,	%o6,	%l4
	addccc	%g1,	0x1AA5,	%i2
	ldub	[%l7 + 0x78],	%i5
	fcmps	%fcc1,	%f1,	%f24
	alignaddrl	%i3,	%o5,	%l1
	movn	%icc,	%o0,	%o3
	mulscc	%o4,	0x1910,	%o2
	save %g2, %i4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f0,	%f8,	%f9
	fornot1s	%f9,	%f23,	%f28
	st	%f29,	[%l7 + 0x64]
	fands	%f22,	%f20,	%f30
	ldsw	[%l7 + 0x70],	%i1
	ldd	[%l7 + 0x10],	%l2
	ldx	[%l7 + 0x30],	%l0
	movrne	%o7,	0x25D,	%i7
	fzeros	%f28
	alignaddr	%g6,	%g3,	%i0
	fmovrsgz	%i6,	%f15,	%f28
	fmul8ulx16	%f18,	%f10,	%f16
	movne	%icc,	%g5,	%l6
	sth	%g7,	[%l7 + 0x72]
	movle	%xcc,	%o1,	%g4
	fmovscs	%xcc,	%f0,	%f25
	smulcc	%l5,	%l4,	%o6
	movvc	%xcc,	%i2,	%g1
	andcc	%i5,	%i3,	%l1
	sllx	%o0,	0x0E,	%o3
	movvc	%icc,	%o5,	%o2
	fnot1s	%f17,	%f15
	mulscc	%o4,	0x09A1,	%g2
	edge16ln	%i4,	%i1,	%l3
	fcmpd	%fcc2,	%f10,	%f6
	fnot1	%f4,	%f22
	fmovde	%xcc,	%f18,	%f1
	ldd	[%l7 + 0x08],	%l2
	movge	%xcc,	%l0,	%o7
	umul	%g6,	0x0785,	%i7
	andn	%i0,	0x099C,	%i6
	stb	%g3,	[%l7 + 0x68]
	addccc	%l6,	0x16DD,	%g7
	fmovsle	%xcc,	%f5,	%f17
	xor	%o1,	%g4,	%l5
	fnegd	%f20,	%f16
	mova	%icc,	%g5,	%l4
	fpadd16s	%f26,	%f28,	%f7
	smulcc	%o6,	0x177B,	%i2
	fsrc2	%f10,	%f0
	sll	%g1,	0x0F,	%i5
	subc	%l1,	0x00CA,	%i3
	sir	0x12E4
	andncc	%o0,	%o5,	%o3
	ldd	[%l7 + 0x50],	%o2
	movre	%g2,	%o4,	%i1
	sdivx	%i4,	0x0AE4,	%l2
	or	%l0,	%o7,	%l3
	subccc	%g6,	0x1806,	%i7
	xor	%i6,	0x1F99,	%g3
	fmovse	%icc,	%f29,	%f29
	ldsb	[%l7 + 0x3C],	%l6
	movgu	%icc,	%i0,	%g7
	lduh	[%l7 + 0x2E],	%o1
	fnot2	%f24,	%f6
	subc	%g4,	%l5,	%g5
	orcc	%o6,	%l4,	%i2
	fmovsg	%icc,	%f21,	%f0
	sllx	%i5,	%g1,	%l1
	smulcc	%i3,	0x1E88,	%o0
	sdiv	%o3,	0x11E3,	%o2
	edge8n	%g2,	%o4,	%i1
	andn	%i4,	0x11E1,	%o5
	mulx	%l0,	0x00D9,	%o7
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	orn	%i7,	%i6,	%l3
	fcmpes	%fcc3,	%f4,	%f8
	ldsb	[%l7 + 0x47],	%g3
	sll	%l6,	%g7,	%o1
	fnands	%f2,	%f29,	%f9
	stb	%i0,	[%l7 + 0x0C]
	edge8ln	%g4,	%l5,	%o6
	mulx	%l4,	%i2,	%g5
	fmul8x16	%f15,	%f0,	%f16
	srax	%i5,	%l1,	%i3
	alignaddrl	%g1,	%o0,	%o2
	fcmple32	%f22,	%f18,	%g2
	edge32n	%o4,	%i1,	%o3
	mova	%xcc,	%o5,	%l0
	fabsd	%f20,	%f14
	edge16ln	%i4,	%o7,	%l2
	movrgz	%i7,	0x236,	%g6
	andncc	%i6,	%l3,	%l6
	fnor	%f12,	%f22,	%f28
	lduw	[%l7 + 0x60],	%g7
	movrlz	%o1,	0x045,	%i0
	save %g3, %l5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%l4,	%f16,	%f12
	orcc	%g4,	0x1B17,	%i2
	sll	%g5,	%l1,	%i3
	fxors	%f13,	%f0,	%f18
	edge32l	%g1,	%o0,	%i5
	fones	%f15
	ldub	[%l7 + 0x35],	%g2
	fmul8x16al	%f0,	%f14,	%f24
	fmovsvc	%icc,	%f26,	%f16
	fmovdpos	%icc,	%f8,	%f26
	fandnot2s	%f21,	%f17,	%f29
	edge16ln	%o4,	%i1,	%o3
	stw	%o5,	[%l7 + 0x28]
	movcc	%xcc,	%l0,	%i4
	edge32ln	%o2,	%l2,	%o7
	fcmps	%fcc1,	%f28,	%f0
	movrgz	%g6,	%i6,	%i7
	ldsw	[%l7 + 0x28],	%l6
	ldd	[%l7 + 0x68],	%l2
	ldub	[%l7 + 0x1B],	%g7
	srl	%o1,	0x1B,	%i0
	edge32l	%l5,	%g3,	%l4
	mova	%xcc,	%g4,	%o6
	orncc	%i2,	0x1716,	%l1
	edge8	%g5,	%g1,	%i3
	movle	%icc,	%i5,	%g2
	fmovsvc	%xcc,	%f8,	%f27
	movrgez	%o0,	%o4,	%i1
	edge32ln	%o5,	%l0,	%o3
	fpsub16	%f24,	%f24,	%f0
	xor	%o2,	%l2,	%o7
	nop
	set	0x18, %l1
	sth	%g6,	[%l7 + %l1]
	umulcc	%i6,	%i7,	%i4
	movneg	%xcc,	%l6,	%g7
	movre	%o1,	0x3BB,	%i0
	std	%f22,	[%l7 + 0x18]
	nop
	set	0x21, %l0
	stb	%l5,	[%l7 + %l0]
	fnot2	%f6,	%f4
	fandnot1	%f20,	%f22,	%f20
	edge8n	%l3,	%l4,	%g3
	restore %o6, %g4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g5,	0x1634,	%i2
	smulcc	%i3,	%i5,	%g2
	edge32	%o0,	%o4,	%g1
	movrne	%i1,	%l0,	%o3
	mulscc	%o2,	%l2,	%o7
	fpack32	%f22,	%f6,	%f6
	fpsub16s	%f17,	%f13,	%f29
	fpadd16s	%f9,	%f2,	%f24
	sdivcc	%g6,	0x1DE4,	%o5
	nop
	set	0x19, %l3
	ldsb	[%l7 + %l3],	%i7
	addccc	%i6,	0x1BF2,	%i4
	ldd	[%l7 + 0x58],	%f28
	ldsw	[%l7 + 0x54],	%l6
	andncc	%o1,	%i0,	%l5
	subcc	%l3,	%g7,	%l4
	edge16	%o6,	%g3,	%g4
	fsrc2s	%f31,	%f27
	lduh	[%l7 + 0x0E],	%g5
	fmovde	%icc,	%f10,	%f24
	fmovrslz	%l1,	%f7,	%f23
	fmovse	%icc,	%f26,	%f27
	sth	%i3,	[%l7 + 0x46]
	movcc	%icc,	%i2,	%g2
	addcc	%o0,	0x0A88,	%o4
	srlx	%g1,	0x1D,	%i5
	fmul8sux16	%f20,	%f18,	%f2
	fmovrsgz	%i1,	%f18,	%f2
	or	%l0,	0x1E53,	%o3
	movn	%icc,	%o2,	%l2
	movrgz	%o7,	0x346,	%g6
	movn	%xcc,	%i7,	%i6
	movpos	%xcc,	%i4,	%o5
	st	%f22,	[%l7 + 0x68]
	fsrc1s	%f3,	%f16
	fpadd16s	%f28,	%f0,	%f27
	sllx	%o1,	%l6,	%i0
	movre	%l5,	0x16B,	%l3
	movvs	%icc,	%g7,	%l4
	sdivx	%o6,	0x1DCC,	%g3
	sir	0x0A0E
	add	%g5,	%l1,	%i3
	smul	%i2,	%g2,	%g4
	fcmpne32	%f18,	%f28,	%o0
	fmovsg	%icc,	%f12,	%f25
	smul	%g1,	%o4,	%i1
	fmovdge	%xcc,	%f6,	%f25
	subccc	%l0,	0x15F2,	%o3
	ldsb	[%l7 + 0x61],	%i5
	andncc	%o2,	%l2,	%g6
	movne	%icc,	%o7,	%i6
	smul	%i4,	%i7,	%o1
	movrne	%l6,	0x020,	%i0
	nop
	set	0x10, %o7
	lduw	[%l7 + %o7],	%l5
	movrgz	%o5,	0x02A,	%l3
	movge	%xcc,	%l4,	%o6
	ldd	[%l7 + 0x50],	%g2
	ldd	[%l7 + 0x60],	%f0
	edge8ln	%g7,	%g5,	%i3
	subcc	%l1,	%g2,	%g4
	alignaddrl	%o0,	%i2,	%g1
	alignaddrl	%o4,	%l0,	%i1
	ldsb	[%l7 + 0x2A],	%o3
	movrne	%i5,	%l2,	%g6
	ldsw	[%l7 + 0x5C],	%o7
	sub	%o2,	0x0BC0,	%i4
	alignaddr	%i6,	%i7,	%o1
	movne	%xcc,	%l6,	%l5
	fmovsge	%xcc,	%f8,	%f3
	add	%i0,	0x0778,	%o5
	orn	%l3,	0x1501,	%l4
	stw	%o6,	[%l7 + 0x1C]
	andncc	%g7,	%g5,	%i3
	movle	%xcc,	%l1,	%g3
	ldx	[%l7 + 0x78],	%g4
	add	%o0,	%g2,	%i2
	sdivx	%g1,	0x1214,	%l0
	movle	%icc,	%i1,	%o4
	ldd	[%l7 + 0x18],	%o2
	orcc	%l2,	0x1970,	%i5
	movrgez	%o7,	%o2,	%g6
	nop
	set	0x60, %o6
	ldx	[%l7 + %o6],	%i4
	fmovrsgz	%i6,	%f25,	%f11
	ldx	[%l7 + 0x50],	%o1
	umul	%i7,	%l5,	%l6
	nop
	set	0x0E, %l6
	lduh	[%l7 + %l6],	%i0
	srlx	%l3,	%l4,	%o6
	edge32ln	%g7,	%o5,	%g5
	movgu	%xcc,	%l1,	%g3
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%f24
	for	%f24,	%f20,	%f8
	orn	%i3,	0x0104,	%o0
	fcmps	%fcc1,	%f22,	%f13
	movl	%icc,	%g4,	%g2
	mulscc	%g1,	0x0A0E,	%l0
	siam	0x3
	array8	%i1,	%o4,	%o3
	st	%f29,	[%l7 + 0x1C]
	edge8l	%i2,	%l2,	%o7
	fmovsvc	%icc,	%f26,	%f31
	siam	0x6
	subcc	%i5,	0x08C9,	%g6
	andncc	%o2,	%i4,	%i6
	sllx	%i7,	%o1,	%l5
	array16	%l6,	%i0,	%l4
	array32	%o6,	%l3,	%o5
	ldub	[%l7 + 0x69],	%g5
	andcc	%l1,	0x1473,	%g3
	fmovsle	%icc,	%f12,	%f13
	fmovdcc	%xcc,	%f18,	%f20
	stb	%g7,	[%l7 + 0x6B]
	movvc	%xcc,	%i3,	%o0
	ldsw	[%l7 + 0x44],	%g2
	movne	%icc,	%g4,	%g1
	movpos	%icc,	%i1,	%l0
	st	%f15,	[%l7 + 0x2C]
	ldsh	[%l7 + 0x28],	%o3
	movvs	%xcc,	%o4,	%i2
	edge8	%o7,	%l2,	%i5
	addccc	%g6,	0x04BE,	%i4
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	mulx	%i6,	%l5,	%o1
	movrne	%i0,	0x3B1,	%l4
	fmovdne	%xcc,	%f6,	%f26
	sdiv	%o6,	0x1B9B,	%l6
	sir	0x00C9
	udivcc	%o5,	0x187F,	%g5
	movvc	%xcc,	%l1,	%l3
	edge8	%g7,	%i3,	%o0
	fmuld8sux16	%f10,	%f5,	%f16
	edge8n	%g3,	%g2,	%g4
	sub	%i1,	0x106F,	%g1
	fnegd	%f0,	%f22
	stb	%o3,	[%l7 + 0x4C]
	udiv	%l0,	0x12A7,	%i2
	movneg	%icc,	%o7,	%l2
	fandnot1s	%f23,	%f30,	%f26
	movg	%icc,	%o4,	%g6
	mova	%xcc,	%i4,	%o2
	srax	%i5,	%i6,	%l5
	movrlz	%o1,	0x04C,	%i0
	orn	%i7,	%o6,	%l4
	mova	%xcc,	%l6,	%o5
	siam	0x6
	stb	%g5,	[%l7 + 0x30]
	array16	%l3,	%l1,	%i3
	edge8l	%g7,	%o0,	%g3
	st	%f27,	[%l7 + 0x50]
	alignaddrl	%g2,	%i1,	%g4
	addcc	%g1,	0x168C,	%l0
	edge32ln	%i2,	%o3,	%l2
	subcc	%o4,	0x02EE,	%o7
	orn	%g6,	%o2,	%i4
	fmul8sux16	%f0,	%f22,	%f26
	ldub	[%l7 + 0x6E],	%i6
	fcmpne16	%f4,	%f10,	%l5
	movrlz	%i5,	0x3E3,	%o1
	movleu	%xcc,	%i7,	%o6
	ldsb	[%l7 + 0x31],	%i0
	sdivx	%l4,	0x10DA,	%l6
	addccc	%g5,	0x0385,	%o5
	movrne	%l3,	0x161,	%i3
	fmovsn	%icc,	%f22,	%f1
	andn	%g7,	0x1CBB,	%o0
	movrlz	%g3,	0x0B7,	%g2
	movcc	%icc,	%l1,	%g4
	xnorcc	%i1,	%l0,	%i2
	ldd	[%l7 + 0x28],	%f6
	nop
	set	0x12, %i6
	sth	%o3,	[%l7 + %i6]
	stb	%l2,	[%l7 + 0x33]
	pdist	%f0,	%f8,	%f24
	fmovrdgz	%g1,	%f4,	%f6
	ldd	[%l7 + 0x38],	%o6
	edge8	%g6,	%o2,	%o4
	mulx	%i4,	0x01ED,	%l5
	subccc	%i5,	%i6,	%i7
	edge8	%o6,	%i0,	%o1
	array8	%l6,	%l4,	%g5
	movleu	%icc,	%o5,	%l3
	fsrc1s	%f0,	%f21
	fmovrdlez	%i3,	%f20,	%f8
	movrgez	%o0,	%g3,	%g7
	fmovrdne	%l1,	%f26,	%f18
	andcc	%g2,	0x0442,	%i1
	movleu	%icc,	%g4,	%l0
	fmovdne	%icc,	%f12,	%f30
	movrne	%i2,	%o3,	%g1
	array32	%o7,	%g6,	%l2
	fmovdpos	%xcc,	%f7,	%f22
	xorcc	%o2,	0x0EE6,	%i4
	alignaddrl	%o4,	%l5,	%i6
	xnorcc	%i7,	%i5,	%i0
	edge32n	%o6,	%l6,	%o1
	fpack16	%f14,	%f21
	fcmpes	%fcc2,	%f2,	%f12
	ldx	[%l7 + 0x18],	%g5
	udiv	%o5,	0x03CE,	%l4
	movge	%xcc,	%i3,	%o0
	edge32l	%g3,	%g7,	%l1
	edge16l	%g2,	%l3,	%i1
	movrlz	%l0,	%i2,	%g4
	smul	%o3,	%o7,	%g6
	ldd	[%l7 + 0x68],	%l2
	mova	%xcc,	%o2,	%g1
	sethi	0x1E3A,	%i4
	sra	%l5,	0x1B,	%o4
	fands	%f4,	%f26,	%f29
	umulcc	%i7,	0x1C77,	%i6
	edge8	%i5,	%o6,	%l6
	move	%icc,	%i0,	%g5
	fsrc2	%f24,	%f26
	sdiv	%o1,	0x1366,	%o5
	movg	%icc,	%i3,	%o0
	movl	%xcc,	%l4,	%g3
	subc	%l1,	0x0D7A,	%g2
	edge32ln	%l3,	%i1,	%l0
	fnor	%f30,	%f22,	%f14
	umul	%i2,	%g7,	%g4
	edge8l	%o7,	%o3,	%g6
	mova	%xcc,	%l2,	%g1
	fmovrsgz	%i4,	%f4,	%f22
	fmul8x16	%f4,	%f6,	%f6
	xnorcc	%o2,	%l5,	%i7
	movg	%xcc,	%i6,	%o4
	fnot1	%f12,	%f24
	nop
	set	0x38, %i5
	stx	%o6,	[%l7 + %i5]
	sllx	%i5,	%i0,	%g5
	orn	%l6,	0x1C15,	%o5
	fzeros	%f23
	subccc	%i3,	0x15C5,	%o1
	movge	%icc,	%l4,	%o0
	movn	%xcc,	%l1,	%g2
	fabss	%f26,	%f16
	ld	[%l7 + 0x74],	%f30
	st	%f0,	[%l7 + 0x44]
	movleu	%xcc,	%l3,	%g3
	movl	%xcc,	%l0,	%i2
	ldsh	[%l7 + 0x5A],	%g7
	array16	%g4,	%i1,	%o3
	fmovdvs	%icc,	%f2,	%f9
	fnegd	%f20,	%f26
	orn	%o7,	%g6,	%l2
	fmovrdgz	%i4,	%f12,	%f16
	andncc	%o2,	%g1,	%l5
	udiv	%i7,	0x1C09,	%i6
	sdiv	%o4,	0x1730,	%o6
	fzero	%f26
	movvc	%xcc,	%i0,	%g5
	umul	%l6,	0x1068,	%o5
	andncc	%i5,	%o1,	%l4
	movrne	%o0,	%l1,	%g2
	addccc	%l3,	%g3,	%l0
	movre	%i2,	0x200,	%i3
	movrlez	%g7,	%i1,	%o3
	fcmps	%fcc1,	%f16,	%f28
	edge8n	%o7,	%g6,	%l2
	fandnot1s	%f4,	%f10,	%f0
	fcmpgt16	%f0,	%f20,	%i4
	fsrc2s	%f12,	%f14
	movrne	%g4,	%g1,	%o2
	fmovrde	%i7,	%f14,	%f28
	umul	%i6,	%l5,	%o4
	movne	%icc,	%o6,	%g5
	lduw	[%l7 + 0x38],	%i0
	popc	0x0C84,	%o5
	mulscc	%i5,	0x0F75,	%o1
	fmuld8sux16	%f23,	%f26,	%f18
	srax	%l4,	0x09,	%o0
	edge16	%l1,	%l6,	%l3
	sethi	0x0042,	%g3
	movvc	%icc,	%l0,	%g2
	fcmpd	%fcc1,	%f0,	%f10
	andncc	%i3,	%g7,	%i2
	save %i1, 0x11C6, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o3,	0x1D21,	%l2
	stx	%g6,	[%l7 + 0x30]
	andn	%i4,	%g1,	%g4
	umulcc	%o2,	%i7,	%l5
	ldx	[%l7 + 0x50],	%o4
	fabss	%f15,	%f4
	alignaddrl	%o6,	%g5,	%i0
	fmovdcs	%xcc,	%f18,	%f17
	edge8l	%o5,	%i6,	%o1
	movn	%icc,	%i5,	%o0
	edge8	%l4,	%l1,	%l3
	array16	%l6,	%l0,	%g2
	mulscc	%g3,	0x1057,	%g7
	fmovdvc	%icc,	%f27,	%f17
	sir	0x1BB9
	fornot1s	%f10,	%f16,	%f26
	fpadd32	%f20,	%f10,	%f24
	fmovdne	%xcc,	%f26,	%f30
	alignaddr	%i3,	%i1,	%o7
	faligndata	%f24,	%f12,	%f0
	srl	%o3,	0x0E,	%i2
	sth	%g6,	[%l7 + 0x2A]
	movrne	%i4,	0x2F6,	%g1
	andn	%g4,	%o2,	%l2
	alignaddrl	%l5,	%o4,	%i7
	fors	%f13,	%f19,	%f25
	ldub	[%l7 + 0x1E],	%g5
	sll	%o6,	0x05,	%i0
	ld	[%l7 + 0x3C],	%f16
	sir	0x0842
	nop
	set	0x0A, %o0
	ldsh	[%l7 + %o0],	%o5
	orn	%i6,	0x09BD,	%i5
	edge32	%o1,	%l4,	%l1
	save %o0, %l6, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%l0,	%g3,	%g7
	fmovrdne	%i3,	%f2,	%f24
	st	%f15,	[%l7 + 0x38]
	movn	%xcc,	%i1,	%g2
	fcmpeq32	%f4,	%f24,	%o7
	mova	%icc,	%i2,	%g6
	edge16l	%i4,	%o3,	%g1
	fnegs	%f20,	%f13
	fmovrsgez	%g4,	%f26,	%f11
	alignaddr	%l2,	%l5,	%o4
	edge8ln	%o2,	%g5,	%o6
	or	%i0,	0x0ED1,	%o5
	andncc	%i7,	%i5,	%o1
	array32	%i6,	%l4,	%l1
	umulcc	%l6,	%o0,	%l0
	sethi	0x0E62,	%l3
	fcmpeq32	%f0,	%f16,	%g3
	movrlez	%g7,	%i3,	%i1
	edge16n	%o7,	%g2,	%g6
	srl	%i2,	0x04,	%o3
	smul	%i4,	%g4,	%g1
	fmovde	%xcc,	%f19,	%f30
	movvc	%icc,	%l2,	%o4
	save %l5, 0x0A5B, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f8,	%f0,	%f12
	popc	0x1846,	%o6
	addcc	%g5,	%o5,	%i0
	fmovsneg	%xcc,	%f5,	%f17
	sllx	%i5,	0x14,	%i7
	movneg	%icc,	%i6,	%o1
	fpsub32s	%f22,	%f21,	%f7
	orcc	%l4,	%l6,	%o0
	ldsb	[%l7 + 0x7C],	%l1
	add	%l3,	%g3,	%l0
	edge32l	%g7,	%i1,	%i3
	movgu	%xcc,	%g2,	%g6
	movcs	%icc,	%i2,	%o7
	movleu	%xcc,	%o3,	%i4
	edge16l	%g4,	%g1,	%l2
	fpack32	%f20,	%f0,	%f8
	add	%l5,	0x00D3,	%o2
	ldsh	[%l7 + 0x72],	%o6
	fmovdpos	%xcc,	%f7,	%f30
	smulcc	%o4,	%o5,	%i0
	udiv	%i5,	0x1680,	%g5
	popc	0x106B,	%i7
	movne	%icc,	%i6,	%o1
	stb	%l6,	[%l7 + 0x54]
	stw	%l4,	[%l7 + 0x60]
	ldsw	[%l7 + 0x64],	%l1
	fmovscs	%icc,	%f25,	%f12
	lduh	[%l7 + 0x24],	%o0
	fmovdg	%xcc,	%f11,	%f15
	movge	%icc,	%l3,	%l0
	sth	%g3,	[%l7 + 0x72]
	save %i1, %i3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f8,	%f25,	%f22
	umulcc	%g6,	%i2,	%g2
	andcc	%o3,	0x0254,	%i4
	fornot2	%f14,	%f8,	%f24
	fmovrdne	%g4,	%f16,	%f30
	udivx	%o7,	0x1EE5,	%l2
	addcc	%g1,	%l5,	%o2
	fmul8x16al	%f15,	%f0,	%f24
	ldd	[%l7 + 0x40],	%f8
	add	%o6,	0x1E0B,	%o5
	xor	%o4,	0x04F3,	%i0
	movge	%xcc,	%i5,	%g5
	fxnor	%f10,	%f30,	%f22
	sdiv	%i7,	0x0DF0,	%o1
	fpack32	%f14,	%f20,	%f16
	fexpand	%f17,	%f24
	ld	[%l7 + 0x60],	%f22
	fpsub16	%f28,	%f8,	%f14
	mova	%icc,	%i6,	%l6
	fornot1	%f14,	%f16,	%f26
	subc	%l1,	%l4,	%l3
	orcc	%o0,	0x1493,	%l0
	ldx	[%l7 + 0x58],	%i1
	restore %g3, %i3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%g7,	%g2
	sllx	%o3,	0x05,	%i4
	orcc	%g4,	%o7,	%l2
	xorcc	%i2,	0x1613,	%g1
	movcc	%xcc,	%l5,	%o2
	orn	%o6,	%o4,	%o5
	ldsw	[%l7 + 0x1C],	%i0
	xorcc	%g5,	%i5,	%i7
	movneg	%xcc,	%o1,	%i6
	addcc	%l1,	0x1C77,	%l6
	edge8ln	%l4,	%l3,	%o0
	subccc	%i1,	0x085A,	%g3
	umul	%l0,	0x0F1B,	%i3
	fxnors	%f15,	%f31,	%f4
	movpos	%xcc,	%g7,	%g2
	sth	%o3,	[%l7 + 0x2A]
	array32	%i4,	%g4,	%o7
	fzero	%f24
	fornot1	%f22,	%f28,	%f18
	edge16ln	%g6,	%l2,	%g1
	edge32	%l5,	%i2,	%o2
	edge8l	%o6,	%o4,	%i0
	sra	%o5,	0x12,	%i5
	sdiv	%i7,	0x0E0B,	%o1
	edge16n	%i6,	%g5,	%l1
	popc	%l4,	%l3
	fmovdvc	%icc,	%f0,	%f24
	andn	%l6,	0x0180,	%i1
	mulx	%g3,	%o0,	%l0
	xor	%i3,	0x08C4,	%g7
	ld	[%l7 + 0x4C],	%f15
	edge16	%o3,	%i4,	%g4
	umulcc	%o7,	%g6,	%l2
	fcmple32	%f30,	%f6,	%g2
	subc	%g1,	%i2,	%o2
	ldsw	[%l7 + 0x18],	%o6
	stx	%l5,	[%l7 + 0x68]
	andncc	%o4,	%i0,	%i5
	ldx	[%l7 + 0x78],	%i7
	sdivcc	%o1,	0x1953,	%o5
	fcmpgt16	%f6,	%f30,	%g5
	edge8n	%i6,	%l1,	%l4
	movvc	%icc,	%l6,	%l3
	movrne	%g3,	0x12C,	%i1
	umul	%o0,	%l0,	%g7
	fmovsle	%icc,	%f31,	%f7
	mulx	%o3,	0x091F,	%i4
	fmovde	%xcc,	%f30,	%f26
	sdivx	%g4,	0x0153,	%o7
	fmul8x16au	%f12,	%f11,	%f16
	fpmerge	%f8,	%f19,	%f12
	andncc	%g6,	%i3,	%g2
	fmuld8ulx16	%f10,	%f6,	%f26
	movgu	%icc,	%l2,	%g1
	and	%i2,	%o6,	%l5
	movrne	%o2,	%i0,	%o4
	fcmpgt32	%f30,	%f16,	%i5
	fnot2s	%f3,	%f10
	fcmpgt32	%f10,	%f26,	%o1
	nop
	set	0x10, %l5
	std	%f26,	[%l7 + %l5]
	xnor	%o5,	0x1328,	%i7
	xorcc	%i6,	0x0542,	%l1
	xnor	%g5,	0x0167,	%l4
	movn	%icc,	%l6,	%l3
	sir	0x1F6A
	sdivx	%i1,	0x11D7,	%g3
	fandnot1	%f26,	%f20,	%f14
	andcc	%o0,	0x0776,	%g7
	stx	%o3,	[%l7 + 0x50]
	alignaddr	%l0,	%i4,	%o7
	subc	%g6,	%g4,	%g2
	udiv	%l2,	0x1F59,	%g1
	subccc	%i2,	%i3,	%o6
	addcc	%o2,	%l5,	%i0
	bshuffle	%f12,	%f12,	%f12
	addcc	%i5,	0x1C63,	%o4
	mova	%xcc,	%o5,	%o1
	fcmpne16	%f30,	%f24,	%i6
	stw	%l1,	[%l7 + 0x5C]
	edge16n	%i7,	%l4,	%g5
	udivx	%l3,	0x0128,	%i1
	array32	%l6,	%g3,	%o0
	xnor	%o3,	0x1452,	%l0
	movneg	%icc,	%g7,	%i4
	smulcc	%o7,	%g4,	%g6
	array8	%g2,	%l2,	%g1
	edge8ln	%i3,	%i2,	%o2
	sdivcc	%o6,	0x0BF2,	%i0
	movvs	%icc,	%i5,	%l5
	stw	%o4,	[%l7 + 0x48]
	fones	%f15
	edge16n	%o5,	%i6,	%o1
	mulscc	%l1,	%i7,	%l4
	move	%icc,	%g5,	%i1
	fxnor	%f12,	%f22,	%f22
	fcmple32	%f6,	%f16,	%l6
	alignaddrl	%l3,	%g3,	%o0
	sll	%l0,	%g7,	%o3
	addc	%o7,	%g4,	%i4
	fmovsne	%icc,	%f27,	%f31
	andn	%g2,	0x0F8E,	%l2
	smulcc	%g6,	%i3,	%g1
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	addccc	%i0,	0x0E25,	%l5
	edge8n	%o4,	%i5,	%i6
	srl	%o5,	%l1,	%o1
	array8	%i7,	%g5,	%i1
	andcc	%l4,	0x06AC,	%l3
	addcc	%l6,	%g3,	%o0
	subc	%l0,	%g7,	%o3
	edge8ln	%o7,	%i4,	%g2
	fnands	%f31,	%f10,	%f14
	fmovspos	%xcc,	%f22,	%f4
	movrne	%g4,	%l2,	%i3
	xor	%g1,	0x10EC,	%i2
	movgu	%xcc,	%g6,	%o6
	srlx	%o2,	0x00,	%i0
	udivcc	%o4,	0x0777,	%l5
	ldub	[%l7 + 0x2A],	%i6
	fcmpgt16	%f22,	%f2,	%i5
	fmovdne	%icc,	%f7,	%f9
	mulx	%l1,	0x1B62,	%o1
	movvs	%icc,	%o5,	%i7
	udiv	%g5,	0x0A2F,	%i1
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%f22
	edge8l	%l4,	%l6,	%l3
	srlx	%o0,	0x13,	%g3
	edge32n	%g7,	%l0,	%o7
	movg	%icc,	%i4,	%g2
	movcs	%icc,	%o3,	%g4
	fmovsle	%icc,	%f16,	%f23
	andcc	%l2,	0x1085,	%g1
	edge16n	%i3,	%i2,	%g6
	movleu	%icc,	%o2,	%i0
	fmovsvc	%icc,	%f24,	%f24
	sth	%o4,	[%l7 + 0x52]
	or	%o6,	0x13A0,	%l5
	udiv	%i6,	0x06A0,	%l1
	sdivcc	%i5,	0x194F,	%o1
	sra	%o5,	0x13,	%g5
	sdiv	%i7,	0x1115,	%l4
	fabsd	%f24,	%f16
	fmovsn	%xcc,	%f17,	%f15
	edge32l	%l6,	%l3,	%o0
	edge32l	%i1,	%g3,	%l0
	andn	%g7,	%o7,	%g2
	stx	%i4,	[%l7 + 0x28]
	std	%f16,	[%l7 + 0x18]
	st	%f14,	[%l7 + 0x14]
	fors	%f30,	%f19,	%f20
	movgu	%xcc,	%g4,	%l2
	stw	%g1,	[%l7 + 0x44]
	fnands	%f2,	%f28,	%f17
	xnor	%i3,	%i2,	%g6
	ldd	[%l7 + 0x58],	%o2
	fpsub16	%f16,	%f2,	%f0
	edge32ln	%o2,	%i0,	%o4
	edge16ln	%l5,	%i6,	%o6
	restore %l1, 0x10A2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o5,	%g5,	%o1
	edge16	%l4,	%l6,	%l3
	sethi	0x1457,	%i7
	addcc	%i1,	0x17F3,	%o0
	edge16	%l0,	%g7,	%g3
	addccc	%g2,	%i4,	%o7
	sdivcc	%l2,	0x0074,	%g4
	movpos	%xcc,	%i3,	%i2
	edge32l	%g1,	%o3,	%g6
	fcmple16	%f18,	%f6,	%i0
	umul	%o4,	0x0E9A,	%l5
	andncc	%o2,	%i6,	%l1
	edge16n	%o6,	%i5,	%o5
	movvc	%xcc,	%g5,	%l4
	fpsub32	%f20,	%f12,	%f2
	move	%xcc,	%o1,	%l6
	alignaddrl	%l3,	%i7,	%i1
	edge16ln	%l0,	%o0,	%g3
	movcc	%icc,	%g2,	%i4
	sth	%g7,	[%l7 + 0x60]
	lduh	[%l7 + 0x28],	%o7
	udivx	%l2,	0x034E,	%g4
	fmovsvs	%xcc,	%f30,	%f1
	fpadd32s	%f12,	%f5,	%f22
	fmovdvc	%icc,	%f16,	%f2
	array32	%i2,	%g1,	%o3
	sll	%g6,	%i0,	%i3
	addccc	%l5,	0x1482,	%o2
	ldsw	[%l7 + 0x30],	%i6
	ldub	[%l7 + 0x58],	%o4
	andcc	%l1,	0x1DA5,	%o6
	andcc	%o5,	0x0916,	%g5
	ldd	[%l7 + 0x10],	%l4
	movn	%icc,	%i5,	%l6
	umulcc	%l3,	0x1B1A,	%i7
	edge8ln	%i1,	%l0,	%o0
	mulscc	%o1,	%g3,	%i4
	add	%g2,	%g7,	%o7
	add	%g4,	0x1C54,	%l2
	sll	%g1,	%i2,	%o3
	fpackfix	%f6,	%f27
	sub	%i0,	0x1D75,	%i3
	ldd	[%l7 + 0x30],	%f10
	ldsb	[%l7 + 0x6A],	%g6
	fmovrslz	%o2,	%f1,	%f11
	sdivx	%l5,	0x16AD,	%o4
	fpsub32s	%f13,	%f2,	%f7
	umulcc	%i6,	0x1DD5,	%l1
	ld	[%l7 + 0x40],	%f10
	udivx	%o5,	0x1675,	%o6
	fandnot1s	%f12,	%f2,	%f20
	fzeros	%f26
	udiv	%l4,	0x069C,	%i5
	mova	%xcc,	%g5,	%l3
	edge8l	%i7,	%i1,	%l0
	fmovrsgz	%l6,	%f26,	%f24
	movgu	%icc,	%o1,	%g3
	edge8	%i4,	%o0,	%g7
	movg	%xcc,	%g2,	%g4
	edge32l	%o7,	%g1,	%l2
	fabss	%f30,	%f28
	st	%f2,	[%l7 + 0x24]
	edge8l	%i2,	%i0,	%i3
	movrne	%o3,	%g6,	%o2
	umulcc	%o4,	%l5,	%i6
	ld	[%l7 + 0x14],	%f21
	addcc	%l1,	%o5,	%o6
	fnands	%f19,	%f17,	%f19
	movvc	%icc,	%i5,	%g5
	movpos	%icc,	%l3,	%i7
	umul	%i1,	0x0AEA,	%l0
	smul	%l4,	0x1015,	%o1
	subc	%l6,	0x07E1,	%i4
	movvc	%icc,	%o0,	%g3
	edge8	%g7,	%g4,	%g2
	fpack32	%f20,	%f26,	%f4
	addcc	%o7,	0x1A22,	%l2
	movleu	%icc,	%i2,	%g1
	move	%xcc,	%i0,	%i3
	mova	%xcc,	%o3,	%o2
	move	%icc,	%o4,	%g6
	fands	%f26,	%f26,	%f10
	fmovrsgez	%i6,	%f10,	%f28
	edge32	%l5,	%o5,	%l1
	fmovsgu	%icc,	%f19,	%f12
	or	%i5,	%g5,	%o6
	udivx	%i7,	0x0636,	%i1
	edge32ln	%l0,	%l4,	%l3
	move	%icc,	%o1,	%i4
	fpackfix	%f12,	%f7
	stw	%l6,	[%l7 + 0x5C]
	fzero	%f14
	movge	%xcc,	%g3,	%o0
	fandnot1	%f6,	%f6,	%f26
	movre	%g4,	%g7,	%g2
	fandnot1	%f20,	%f12,	%f28
	xorcc	%o7,	0x1481,	%i2
	edge32	%g1,	%l2,	%i3
	fsrc1	%f4,	%f8
	edge16n	%o3,	%i0,	%o4
	movne	%icc,	%g6,	%i6
	movvc	%xcc,	%o2,	%l5
	fpadd32s	%f13,	%f4,	%f16
	edge8n	%o5,	%l1,	%g5
	edge32n	%o6,	%i7,	%i5
	stw	%i1,	[%l7 + 0x18]
	subcc	%l0,	%l4,	%l3
	fands	%f14,	%f31,	%f13
	sub	%i4,	0x0186,	%o1
	movvc	%xcc,	%g3,	%l6
	movleu	%xcc,	%o0,	%g4
	ldsb	[%l7 + 0x35],	%g7
	stw	%g2,	[%l7 + 0x28]
	array8	%i2,	%o7,	%l2
	udivx	%g1,	0x09D9,	%i3
	edge8ln	%o3,	%o4,	%g6
	ldsh	[%l7 + 0x08],	%i6
	andcc	%i0,	0x1AD3,	%o2
	fmovsvs	%xcc,	%f24,	%f7
	sra	%o5,	%l5,	%g5
	subc	%l1,	%o6,	%i5
	std	%f0,	[%l7 + 0x70]
	array8	%i7,	%l0,	%l4
	std	%f16,	[%l7 + 0x70]
	xnor	%i1,	%i4,	%l3
	udivx	%g3,	0x03A4,	%l6
	subc	%o0,	0x14C0,	%g4
	movge	%xcc,	%o1,	%g2
	subccc	%g7,	%o7,	%i2
	ldsh	[%l7 + 0x4C],	%l2
	fmovrdne	%i3,	%f22,	%f28
	sir	0x0635
	fmovsne	%icc,	%f13,	%f20
	array32	%o3,	%o4,	%g1
	sdivx	%g6,	0x1446,	%i0
	nop
	set	0x75, %g3
	ldsb	[%l7 + %g3],	%i6
	fpadd16	%f16,	%f12,	%f6
	faligndata	%f22,	%f0,	%f0
	andcc	%o2,	%o5,	%g5
	addccc	%l1,	0x0076,	%l5
	ldub	[%l7 + 0x12],	%o6
	xnorcc	%i5,	0x1732,	%i7
	subcc	%l0,	0x0CF3,	%i1
	xnorcc	%i4,	0x038D,	%l4
	andn	%g3,	%l3,	%l6
	ldub	[%l7 + 0x4F],	%o0
	fcmpes	%fcc0,	%f27,	%f16
	sllx	%g4,	0x09,	%g2
	stb	%g7,	[%l7 + 0x38]
	alignaddr	%o1,	%i2,	%l2
	edge16l	%i3,	%o3,	%o4
	andn	%o7,	%g1,	%i0
	fmovsa	%xcc,	%f12,	%f17
	movvc	%xcc,	%g6,	%o2
	ldsh	[%l7 + 0x36],	%i6
	fmovsl	%icc,	%f3,	%f8
	movrlz	%g5,	0x2C5,	%o5
	xnorcc	%l1,	0x023F,	%o6
	fors	%f21,	%f13,	%f29
	movcs	%icc,	%i5,	%l5
	movl	%icc,	%l0,	%i7
	umul	%i1,	0x1C9A,	%i4
	edge32n	%g3,	%l3,	%l4
	movcs	%icc,	%o0,	%l6
	sra	%g4,	%g2,	%g7
	fcmps	%fcc1,	%f8,	%f17
	movg	%icc,	%i2,	%o1
	std	%f10,	[%l7 + 0x08]
	movneg	%xcc,	%i3,	%o3
	ldx	[%l7 + 0x50],	%o4
	or	%o7,	%g1,	%i0
	mova	%xcc,	%g6,	%l2
	edge32n	%i6,	%g5,	%o5
	fmovdcs	%icc,	%f9,	%f25
	fsrc1s	%f20,	%f29
	movl	%xcc,	%l1,	%o2
	movcs	%xcc,	%o6,	%i5
	fmovd	%f16,	%f12
	movge	%icc,	%l0,	%i7
	alignaddr	%i1,	%l5,	%i4
	movcs	%icc,	%l3,	%l4
	movgu	%icc,	%g3,	%o0
	sth	%l6,	[%l7 + 0x7C]
	addc	%g4,	%g7,	%i2
	movl	%xcc,	%o1,	%g2
	nop
	set	0x6C, %l2
	ldub	[%l7 + %l2],	%i3
	srax	%o3,	%o4,	%o7
	srlx	%i0,	0x06,	%g6
	movne	%xcc,	%l2,	%g1
	fcmpne16	%f22,	%f14,	%g5
	movcc	%xcc,	%i6,	%o5
	orncc	%l1,	%o2,	%o6
	fcmpeq32	%f12,	%f26,	%i5
	stb	%i7,	[%l7 + 0x38]
	movg	%icc,	%l0,	%l5
	edge32l	%i4,	%l3,	%i1
	udivcc	%l4,	0x1B32,	%g3
	fsrc1s	%f19,	%f22
	edge32ln	%o0,	%g4,	%g7
	fmovdl	%icc,	%f20,	%f0
	andncc	%l6,	%o1,	%i2
	pdist	%f12,	%f28,	%f24
	add	%g2,	%i3,	%o3
	fmovrdlz	%o4,	%f24,	%f12
	fmovspos	%icc,	%f9,	%f1
	stb	%o7,	[%l7 + 0x0D]
	movpos	%xcc,	%i0,	%g6
	subcc	%g1,	0x177C,	%l2
	movneg	%icc,	%i6,	%g5
	fsrc2	%f6,	%f14
	edge8	%o5,	%o2,	%o6
	stb	%l1,	[%l7 + 0x5C]
	fmovdne	%xcc,	%f23,	%f1
	orncc	%i5,	0x1ECD,	%l0
	lduh	[%l7 + 0x6A],	%l5
	mulscc	%i4,	%i7,	%i1
	array16	%l4,	%l3,	%o0
	smul	%g4,	0x168F,	%g7
	ldd	[%l7 + 0x10],	%i6
	edge16ln	%o1,	%g3,	%g2
	sll	%i3,	%o3,	%i2
	fmovscc	%xcc,	%f24,	%f13
	mulx	%o7,	0x15C5,	%i0
	stb	%o4,	[%l7 + 0x3D]
	andn	%g6,	0x0EFD,	%l2
	fcmpne16	%f26,	%f28,	%g1
	stx	%g5,	[%l7 + 0x50]
	movleu	%xcc,	%o5,	%i6
	fmovda	%xcc,	%f20,	%f0
	sethi	0x1556,	%o6
	edge32n	%o2,	%l1,	%l0
	fmovdneg	%icc,	%f9,	%f27
	umulcc	%i5,	0x1D4F,	%i4
	orn	%l5,	0x0636,	%i7
	movg	%xcc,	%l4,	%l3
	fcmpeq16	%f10,	%f20,	%o0
	movrgez	%g4,	0x081,	%i1
	std	%f16,	[%l7 + 0x38]
	stb	%g7,	[%l7 + 0x48]
	fmovdne	%xcc,	%f20,	%f14
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	movcs	%icc,	%o1,	%i3
	fmul8sux16	%f8,	%f18,	%f20
	edge16	%o3,	%i2,	%o7
	sdivx	%g2,	0x1FED,	%o4
	edge32	%i0,	%l2,	%g1
	std	%f18,	[%l7 + 0x18]
	sllx	%g5,	0x17,	%g6
	subcc	%i6,	%o6,	%o2
	ldd	[%l7 + 0x60],	%f12
	ldub	[%l7 + 0x39],	%l1
	movrgz	%l0,	%i5,	%i4
	addc	%l5,	0x09B6,	%i7
	sra	%l4,	%l3,	%o5
	ldsh	[%l7 + 0x6C],	%o0
	srlx	%i1,	%g4,	%g7
	mulx	%l6,	%o1,	%g3
	fsrc1s	%f27,	%f3
	fpadd16s	%f13,	%f20,	%f0
	addcc	%o3,	0x185D,	%i3
	subcc	%o7,	%g2,	%o4
	edge16	%i0,	%l2,	%i2
	nop
	set	0x3C, %i3
	stw	%g5,	[%l7 + %i3]
	movn	%icc,	%g6,	%i6
	fors	%f18,	%f9,	%f30
	lduh	[%l7 + 0x40],	%g1
	umul	%o2,	%o6,	%l1
	sra	%i5,	%l0,	%l5
	umulcc	%i4,	0x0D1A,	%i7
	ldsb	[%l7 + 0x11],	%l4
	movrgez	%l3,	%o0,	%o5
	sdiv	%i1,	0x0AA6,	%g7
	array8	%g4,	%l6,	%g3
	movcc	%xcc,	%o3,	%i3
	fcmpd	%fcc0,	%f12,	%f6
	edge8ln	%o7,	%o1,	%o4
	stw	%i0,	[%l7 + 0x24]
	std	%f2,	[%l7 + 0x60]
	sll	%g2,	%l2,	%i2
	movleu	%icc,	%g6,	%i6
	xorcc	%g5,	0x0B7B,	%g1
	edge32l	%o2,	%o6,	%i5
	stw	%l1,	[%l7 + 0x6C]
	st	%f31,	[%l7 + 0x54]
	edge32n	%l5,	%i4,	%i7
	smul	%l4,	0x1ABD,	%l3
	fmovsne	%xcc,	%f23,	%f23
	fmovrdgz	%o0,	%f20,	%f6
	fmovrdgz	%l0,	%f22,	%f26
	sth	%o5,	[%l7 + 0x60]
	fmovse	%icc,	%f0,	%f30
	array32	%i1,	%g7,	%l6
	umulcc	%g3,	0x10B0,	%o3
	fandnot2s	%f21,	%f24,	%f3
	movge	%icc,	%g4,	%i3
	movrlez	%o1,	0x33F,	%o7
	fmovdneg	%xcc,	%f6,	%f26
	alignaddrl	%o4,	%g2,	%i0
	xnorcc	%i2,	%l2,	%i6
	ldsh	[%l7 + 0x5C],	%g5
	sll	%g6,	%g1,	%o6
	movn	%xcc,	%o2,	%l1
	stb	%l5,	[%l7 + 0x3A]
	ld	[%l7 + 0x44],	%f28
	edge16l	%i5,	%i7,	%l4
	udiv	%l3,	0x0CBE,	%i4
	fone	%f24
	orcc	%l0,	%o0,	%i1
	move	%xcc,	%o5,	%l6
	mova	%icc,	%g3,	%o3
	udiv	%g7,	0x17C7,	%i3
	xnor	%g4,	0x1E29,	%o1
	movne	%icc,	%o4,	%g2
	movl	%icc,	%i0,	%i2
	movrgz	%o7,	0x252,	%l2
	fmovsne	%icc,	%f0,	%f4
	movl	%icc,	%g5,	%i6
	save %g1, 0x0696, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o2,	%g6,	%l5
	movcs	%icc,	%l1,	%i5
	fcmpeq32	%f20,	%f14,	%i7
	ldsw	[%l7 + 0x54],	%l4
	udiv	%i4,	0x1CBD,	%l3
	ldd	[%l7 + 0x18],	%f18
	orcc	%o0,	%l0,	%i1
	ldx	[%l7 + 0x10],	%l6
	fmovsleu	%xcc,	%f6,	%f15
	fornot1s	%f13,	%f8,	%f28
	fmovsg	%icc,	%f19,	%f23
	popc	0x0359,	%o5
	movrgz	%o3,	%g3,	%i3
	subcc	%g4,	%g7,	%o1
	srax	%o4,	0x0E,	%i0
	subccc	%g2,	%i2,	%l2
	array8	%o7,	%i6,	%g1
	srl	%o6,	%g5,	%o2
	fmovrse	%l5,	%f21,	%f22
	edge32ln	%g6,	%i5,	%i7
	addccc	%l1,	%l4,	%i4
	fcmpd	%fcc1,	%f4,	%f28
	andn	%l3,	%o0,	%i1
	movneg	%xcc,	%l6,	%o5
	fmovsg	%xcc,	%f11,	%f14
	movvs	%icc,	%o3,	%l0
	movleu	%xcc,	%i3,	%g4
	popc	0x1EF8,	%g7
	subcc	%o1,	0x1ADA,	%g3
	edge16l	%o4,	%g2,	%i2
	mulx	%i0,	%l2,	%o7
	edge32n	%g1,	%i6,	%g5
	stx	%o2,	[%l7 + 0x20]
	move	%icc,	%l5,	%o6
	sth	%g6,	[%l7 + 0x20]
	nop
	set	0x68, %o3
	ldx	[%l7 + %o3],	%i7
	ldd	[%l7 + 0x48],	%l0
	ld	[%l7 + 0x10],	%f31
	pdist	%f0,	%f2,	%f8
	movge	%icc,	%i5,	%i4
	sllx	%l4,	0x07,	%l3
	addccc	%o0,	0x0CB6,	%l6
	movre	%o5,	%o3,	%l0
	fpadd32s	%f6,	%f8,	%f7
	fmovsn	%xcc,	%f25,	%f0
	fmovrdne	%i1,	%f26,	%f24
	ldsb	[%l7 + 0x28],	%i3
	orncc	%g4,	%o1,	%g3
	subcc	%g7,	%o4,	%g2
	movvs	%xcc,	%i0,	%l2
	movcs	%icc,	%o7,	%g1
	fpack16	%f4,	%f4
	sethi	0x0793,	%i2
	fpackfix	%f24,	%f11
	fzeros	%f24
	mulx	%i6,	0x0B0A,	%g5
	sir	0x16B7
	movrgez	%o2,	%o6,	%l5
	fcmple32	%f20,	%f4,	%g6
	movneg	%xcc,	%i7,	%l1
	xorcc	%i4,	%l4,	%l3
	fxnors	%f26,	%f26,	%f6
	fmovsneg	%icc,	%f22,	%f0
	fmovrdlez	%o0,	%f26,	%f30
	fabsd	%f12,	%f10
	ldub	[%l7 + 0x3A],	%l6
	sdivcc	%o5,	0x18B2,	%i5
	sub	%o3,	%l0,	%i3
	edge16	%i1,	%o1,	%g4
	edge16ln	%g7,	%g3,	%g2
	andncc	%o4,	%i0,	%o7
	save %g1, 0x0755, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i6,	%i2,	%o2
	edge8l	%o6,	%g5,	%l5
	addcc	%g6,	%i7,	%i4
	movgu	%xcc,	%l4,	%l1
	srax	%o0,	%l3,	%l6
	fmovsl	%xcc,	%f19,	%f13
	subc	%i5,	%o3,	%l0
	movrgez	%o5,	0x0EF,	%i3
	movvs	%xcc,	%o1,	%g4
	movrgz	%g7,	%g3,	%g2
	movneg	%xcc,	%o4,	%i0
	lduw	[%l7 + 0x48],	%o7
	edge16l	%i1,	%g1,	%i6
	movcs	%xcc,	%i2,	%l2
	stx	%o6,	[%l7 + 0x58]
	edge32l	%o2,	%l5,	%g5
	ldsb	[%l7 + 0x14],	%g6
	array32	%i4,	%l4,	%i7
	udiv	%o0,	0x14D7,	%l3
	std	%f12,	[%l7 + 0x60]
	sdivx	%l6,	0x18C5,	%i5
	fcmple32	%f16,	%f20,	%o3
	ldub	[%l7 + 0x1D],	%l0
	mulx	%l1,	%i3,	%o1
	movcc	%icc,	%o5,	%g4
	edge8	%g3,	%g2,	%g7
	xorcc	%o4,	%o7,	%i1
	fsrc1	%f10,	%f16
	alignaddr	%i0,	%i6,	%g1
	subc	%i2,	%l2,	%o2
	fpsub32s	%f17,	%f16,	%f27
	ldsw	[%l7 + 0x28],	%l5
	edge16ln	%o6,	%g6,	%g5
	ldsw	[%l7 + 0x40],	%i4
	addcc	%i7,	0x1418,	%l4
	fcmped	%fcc1,	%f10,	%f22
	orn	%o0,	0x0183,	%l6
	sethi	0x1EDB,	%i5
	fmul8x16al	%f14,	%f18,	%f14
	edge8l	%l3,	%l0,	%l1
	srl	%i3,	%o1,	%o3
	sir	0x0542
	stw	%g4,	[%l7 + 0x64]
	fandnot1	%f10,	%f10,	%f4
	orn	%o5,	%g3,	%g7
	fmovdneg	%xcc,	%f29,	%f18
	ld	[%l7 + 0x54],	%f0
	addcc	%g2,	0x1C5E,	%o7
	srax	%i1,	%o4,	%i0
	sra	%g1,	0x19,	%i2
	array16	%i6,	%o2,	%l5
	faligndata	%f22,	%f2,	%f28
	edge8ln	%o6,	%l2,	%g5
	xnor	%i4,	0x007D,	%g6
	nop
	set	0x14, %g5
	stw	%i7,	[%l7 + %g5]
	addccc	%o0,	0x0C54,	%l4
	mulx	%i5,	%l6,	%l0
	movcc	%icc,	%l3,	%l1
	xnor	%o1,	%o3,	%i3
	srlx	%o5,	%g3,	%g7
	fmovrslz	%g2,	%f28,	%f1
	movrgz	%g4,	0x07F,	%o7
	orn	%i1,	0x0C4F,	%i0
	movg	%xcc,	%o4,	%i2
	fands	%f15,	%f6,	%f16
	and	%i6,	%o2,	%l5
	fmovs	%f15,	%f18
	addccc	%g1,	0x0E1B,	%l2
	andn	%o6,	0x04BD,	%g5
	fmovse	%xcc,	%f22,	%f0
	xorcc	%g6,	%i7,	%i4
	and	%l4,	0x1B5E,	%i5
	xorcc	%o0,	%l0,	%l3
	move	%xcc,	%l1,	%o1
	sth	%o3,	[%l7 + 0x5E]
	orcc	%i3,	%o5,	%l6
	sdivcc	%g7,	0x08AD,	%g3
	smulcc	%g4,	0x156D,	%g2
	array32	%o7,	%i0,	%i1
	fcmped	%fcc3,	%f6,	%f26
	andcc	%o4,	0x130A,	%i2
	fmovspos	%icc,	%f11,	%f23
	orcc	%i6,	%l5,	%g1
	nop
	set	0x30, %o2
	ldsw	[%l7 + %o2],	%o2
	ldsb	[%l7 + 0x5C],	%l2
	ldsb	[%l7 + 0x4A],	%o6
	fcmpgt16	%f0,	%f4,	%g6
	movge	%icc,	%i7,	%g5
	fmovdvs	%icc,	%f13,	%f8
	array16	%l4,	%i5,	%o0
	sdiv	%l0,	0x152B,	%l3
	restore %i4, %l1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i3,	%o5,	%o1
	srl	%l6,	%g7,	%g3
	array16	%g2,	%o7,	%g4
	fxnor	%f6,	%f8,	%f22
	edge8	%i1,	%o4,	%i0
	srlx	%i6,	0x18,	%i2
	movn	%icc,	%g1,	%o2
	ldub	[%l7 + 0x7F],	%l5
	xnor	%l2,	0x0BCA,	%g6
	movrlez	%i7,	0x3CC,	%g5
	edge16n	%o6,	%l4,	%o0
	movre	%l0,	%i5,	%i4
	ldx	[%l7 + 0x68],	%l3
	movcc	%icc,	%l1,	%o3
	fmovdpos	%icc,	%f24,	%f2
	orncc	%i3,	%o5,	%o1
	srl	%g7,	%l6,	%g2
	array16	%g3,	%o7,	%i1
	udivcc	%o4,	0x10EA,	%i0
	edge8	%g4,	%i6,	%g1
	edge32l	%o2,	%l5,	%l2
	sra	%i2,	%g6,	%g5
	movvs	%icc,	%o6,	%l4
	fpmerge	%f4,	%f6,	%f18
	alignaddrl	%o0,	%i7,	%i5
	movle	%icc,	%i4,	%l3
	lduh	[%l7 + 0x26],	%l1
	save %l0, 0x03F2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o5,	%o1,	%i3
	movge	%xcc,	%g7,	%g2
	fpsub16s	%f13,	%f24,	%f14
	fornot2	%f16,	%f14,	%f26
	srl	%g3,	%l6,	%i1
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	ldub	[%l7 + 0x24],	%g4
	stx	%i6,	[%l7 + 0x08]
	edge32	%o2,	%g1,	%l5
	movneg	%icc,	%l2,	%i2
	fabss	%f8,	%f30
	movrgez	%g5,	0x021,	%o6
	edge8	%g6,	%l4,	%i7
	ldd	[%l7 + 0x38],	%f18
	edge32l	%o0,	%i5,	%l3
	xnorcc	%i4,	0x1A9D,	%l1
	fandnot1	%f6,	%f26,	%f16
	ldd	[%l7 + 0x68],	%f2
	subccc	%l0,	0x1458,	%o3
	movrlez	%o1,	%i3,	%o5
	edge32ln	%g7,	%g2,	%g3
	movrgez	%l6,	%i1,	%o7
	movrgez	%i0,	0x160,	%g4
	movle	%xcc,	%o4,	%i6
	fxor	%f30,	%f4,	%f4
	fpack16	%f28,	%f9
	fpmerge	%f28,	%f0,	%f0
	fmovsneg	%xcc,	%f10,	%f4
	lduh	[%l7 + 0x74],	%o2
	fandnot1	%f12,	%f20,	%f18
	fmovrsgz	%l5,	%f28,	%f31
	movn	%icc,	%g1,	%l2
	stw	%g5,	[%l7 + 0x14]
	edge16n	%o6,	%i2,	%g6
	lduw	[%l7 + 0x54],	%l4
	edge8	%i7,	%i5,	%l3
	edge16ln	%o0,	%l1,	%i4
	movge	%icc,	%l0,	%o3
	fabsd	%f18,	%f14
	fpack16	%f2,	%f25
	alignaddrl	%i3,	%o1,	%o5
	fcmpes	%fcc2,	%f31,	%f31
	move	%xcc,	%g2,	%g7
	sra	%l6,	0x02,	%i1
	fones	%f8
	orcc	%o7,	%i0,	%g3
	udivx	%g4,	0x05A6,	%i6
	edge32ln	%o2,	%l5,	%o4
	fmovscs	%xcc,	%f29,	%f23
	ldub	[%l7 + 0x4B],	%l2
	lduw	[%l7 + 0x24],	%g5
	movvc	%icc,	%g1,	%i2
	fsrc2	%f20,	%f0
	movre	%o6,	%g6,	%l4
	andcc	%i5,	0x161B,	%i7
	fmovrdlez	%l3,	%f6,	%f20
	array32	%o0,	%i4,	%l1
	mulx	%l0,	%o3,	%i3
	ldx	[%l7 + 0x48],	%o5
	sdivcc	%g2,	0x1885,	%g7
	movn	%icc,	%o1,	%i1
	movrgez	%l6,	0x39F,	%i0
	fmovrde	%o7,	%f0,	%f10
	edge16l	%g4,	%i6,	%o2
	subccc	%l5,	%o4,	%l2
	edge32n	%g3,	%g1,	%i2
	restore %g5, 0x13EE, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l4,	%o6,	%i5
	fcmpeq32	%f28,	%f2,	%i7
	xor	%o0,	0x0095,	%l3
	orncc	%i4,	0x1ED8,	%l0
	edge8n	%o3,	%l1,	%o5
	edge16	%i3,	%g7,	%g2
	nop
	set	0x4A, %i4
	ldsh	[%l7 + %i4],	%o1
	edge8ln	%l6,	%i0,	%i1
	edge16	%g4,	%i6,	%o7
	sdivcc	%l5,	0x06AB,	%o4
	orncc	%l2,	0x0B0E,	%o2
	edge8l	%g3,	%i2,	%g1
	stb	%g6,	[%l7 + 0x1B]
	fcmple16	%f12,	%f24,	%l4
	fpsub32	%f10,	%f4,	%f14
	fmuld8ulx16	%f28,	%f31,	%f0
	srlx	%g5,	0x1B,	%i5
	fmovsge	%xcc,	%f19,	%f6
	movre	%o6,	%i7,	%l3
	movrne	%o0,	0x25B,	%i4
	movrgz	%o3,	0x000,	%l0
	ldd	[%l7 + 0x10],	%f10
	udivcc	%o5,	0x1D16,	%l1
	fmovspos	%xcc,	%f16,	%f28
	ldub	[%l7 + 0x67],	%g7
	ld	[%l7 + 0x74],	%f30
	edge32l	%i3,	%o1,	%l6
	xnorcc	%g2,	%i0,	%g4
	fpadd16	%f8,	%f14,	%f14
	fsrc2	%f8,	%f0
	edge32l	%i1,	%o7,	%l5
	array8	%o4,	%i6,	%o2
	andcc	%g3,	%l2,	%g1
	st	%f28,	[%l7 + 0x28]
	fmovdneg	%icc,	%f8,	%f5
	smulcc	%g6,	%l4,	%g5
	fands	%f29,	%f4,	%f5
	andncc	%i5,	%o6,	%i2
	st	%f15,	[%l7 + 0x2C]
	edge8n	%l3,	%o0,	%i4
	edge32	%o3,	%i7,	%o5
	smulcc	%l1,	%g7,	%l0
	nop
	set	0x24, %i1
	ldsh	[%l7 + %i1],	%o1
	xor	%l6,	%i3,	%g2
	movl	%xcc,	%i0,	%g4
	fnot2s	%f23,	%f2
	sra	%o7,	%l5,	%o4
	ldd	[%l7 + 0x20],	%f16
	movcs	%icc,	%i6,	%i1
	ldsh	[%l7 + 0x52],	%g3
	fpack32	%f8,	%f18,	%f30
	edge8	%o2,	%g1,	%l2
	movcs	%xcc,	%g6,	%l4
	sdivx	%i5,	0x0848,	%g5
	addcc	%i2,	%l3,	%o0
	edge8n	%o6,	%i4,	%o3
	fnot2	%f16,	%f22
	fabss	%f10,	%f11
	ldd	[%l7 + 0x28],	%o4
	movl	%icc,	%l1,	%g7
	movrne	%l0,	%o1,	%i7
	umul	%l6,	0x1618,	%g2
	movvs	%icc,	%i0,	%g4
	fnand	%f30,	%f16,	%f30
	edge16n	%i3,	%o7,	%o4
	fpsub16s	%f20,	%f26,	%f0
	fnot2s	%f15,	%f16
	edge8l	%i6,	%l5,	%i1
	movle	%icc,	%g3,	%o2
	umul	%g1,	%l2,	%l4
	ldx	[%l7 + 0x68],	%g6
	udivx	%i5,	0x0106,	%g5
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	fexpand	%f27,	%f14
	nop
	set	0x5A, %l4
	lduh	[%l7 + %l4],	%o0
	movrlz	%i4,	%o6,	%o3
	xor	%o5,	%g7,	%l1
	fmuld8ulx16	%f20,	%f31,	%f22
	edge16n	%l0,	%o1,	%l6
	movvc	%icc,	%g2,	%i0
	movrlz	%i7,	%i3,	%g4
	save %o4, %o7, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i1,	0x292,	%g3
	addccc	%o2,	0x1786,	%g1
	ldub	[%l7 + 0x65],	%i6
	fabsd	%f30,	%f20
	edge32l	%l4,	%l2,	%g6
	movne	%icc,	%g5,	%i5
	fnor	%f18,	%f0,	%f26
	umul	%l3,	0x13EE,	%o0
	popc	%i2,	%i4
	sllx	%o6,	%o5,	%o3
	movneg	%xcc,	%g7,	%l0
	edge16n	%l1,	%o1,	%l6
	fmuld8ulx16	%f0,	%f10,	%f8
	srl	%i0,	0x1A,	%i7
	xorcc	%g2,	0x1B26,	%i3
	andcc	%o4,	0x14BD,	%g4
	ldd	[%l7 + 0x28],	%o6
	edge8n	%l5,	%g3,	%o2
	move	%xcc,	%g1,	%i1
	movne	%icc,	%l4,	%i6
	fandnot1s	%f15,	%f30,	%f22
	addccc	%l2,	0x130A,	%g6
	movneg	%icc,	%g5,	%i5
	movvs	%icc,	%l3,	%o0
	ld	[%l7 + 0x7C],	%f28
	edge8	%i4,	%o6,	%i2
	ldx	[%l7 + 0x68],	%o3
	addcc	%o5,	0x0E5E,	%l0
	movcs	%xcc,	%l1,	%g7
	movg	%xcc,	%l6,	%o1
	fmovdcs	%icc,	%f4,	%f27
	restore %i0, 0x1C36, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i3,	%i7,	%o4
	xor	%o7,	0x1606,	%g4
	movrlez	%l5,	%o2,	%g1
	save %g3, 0x0F7F, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i1,	%l2,	%i6
	addc	%g5,	%g6,	%i5
	fmovrdgz	%l3,	%f20,	%f8
	edge32ln	%o0,	%o6,	%i2
	ldx	[%l7 + 0x60],	%i4
	fandnot2	%f20,	%f22,	%f30
	addccc	%o3,	%l0,	%l1
	subc	%g7,	0x1A7B,	%o5
	fmovrsgz	%o1,	%f15,	%f6
	movpos	%xcc,	%l6,	%g2
	sdivcc	%i3,	0x15F4,	%i0
	or	%i7,	0x0FC6,	%o4
	sth	%g4,	[%l7 + 0x0E]
	umulcc	%l5,	0x1A9B,	%o2
	edge8	%g1,	%g3,	%l4
	array16	%o7,	%l2,	%i6
	srl	%g5,	0x05,	%i1
	xnorcc	%g6,	%i5,	%l3
	edge16ln	%o6,	%i2,	%o0
	umul	%o3,	%l0,	%l1
	fandnot1s	%f1,	%f5,	%f24
	mova	%icc,	%g7,	%o5
	smulcc	%o1,	%l6,	%i4
	udiv	%g2,	0x0623,	%i0
	fpadd16	%f0,	%f20,	%f10
	smulcc	%i3,	0x0DC3,	%i7
	fone	%f2
	xnor	%o4,	%g4,	%l5
	sdivx	%g1,	0x1D76,	%g3
	fnot2	%f30,	%f30
	mulscc	%o2,	0x1CE5,	%l4
	alignaddr	%o7,	%l2,	%i6
	fcmpeq16	%f20,	%f16,	%g5
	sdivx	%i1,	0x01EE,	%g6
	add	%i5,	0x0BF2,	%l3
	fmovrdgez	%o6,	%f22,	%f4
	addccc	%o0,	0x04A5,	%i2
	subccc	%l0,	0x1F7E,	%l1
	movg	%xcc,	%g7,	%o3
	edge8	%o1,	%l6,	%o5
	srlx	%i4,	0x12,	%g2
	fmul8x16al	%f15,	%f9,	%f26
	fmovdcs	%xcc,	%f13,	%f16
	fcmpeq16	%f0,	%f14,	%i3
	edge16n	%i7,	%o4,	%i0
	smul	%g4,	%l5,	%g3
	addccc	%o2,	0x0660,	%g1
	fmul8sux16	%f22,	%f24,	%f22
	udivcc	%o7,	0x0DB3,	%l4
	srlx	%i6,	0x06,	%g5
	edge8l	%i1,	%l2,	%g6
	fmovrdlez	%i5,	%f28,	%f14
	popc	%o6,	%o0
	andcc	%i2,	%l0,	%l3
	mova	%xcc,	%l1,	%o3
	movgu	%icc,	%o1,	%g7
	udiv	%o5,	0x19D1,	%l6
	movn	%icc,	%g2,	%i4
	nop
	set	0x44, %g1
	lduh	[%l7 + %g1],	%i3
	movcc	%xcc,	%o4,	%i7
	sllx	%g4,	%i0,	%g3
	movpos	%icc,	%l5,	%g1
	movgu	%icc,	%o2,	%l4
	movneg	%icc,	%i6,	%o7
	fmovsl	%xcc,	%f15,	%f30
	fmovrse	%g5,	%f13,	%f16
	movrlez	%l2,	%g6,	%i5
	for	%f8,	%f26,	%f30
	fornot1s	%f15,	%f24,	%f23
	fnor	%f20,	%f30,	%f28
	movleu	%icc,	%o6,	%o0
	andncc	%i2,	%i1,	%l3
	srl	%l1,	0x0C,	%l0
	andcc	%o3,	%g7,	%o5
	array32	%o1,	%g2,	%i4
	srax	%l6,	0x1A,	%o4
	addc	%i3,	0x10AC,	%i7
	edge16	%g4,	%g3,	%l5
	edge8l	%g1,	%o2,	%i0
	movrne	%l4,	%o7,	%i6
	sdiv	%l2,	0x1261,	%g5
	movcs	%icc,	%g6,	%i5
	movre	%o0,	%o6,	%i2
	srax	%l3,	%l1,	%l0
	movn	%xcc,	%i1,	%g7
	mulx	%o3,	%o5,	%o1
	umul	%i4,	%g2,	%o4
	and	%i3,	%i7,	%l6
	stw	%g3,	[%l7 + 0x30]
	edge8l	%g4,	%l5,	%g1
	edge8l	%i0,	%l4,	%o7
	fmovrdlz	%o2,	%f20,	%f8
	ldsh	[%l7 + 0x4C],	%l2
	fmuld8ulx16	%f6,	%f4,	%f30
	edge16ln	%i6,	%g5,	%i5
	subcc	%g6,	%o0,	%o6
	sra	%l3,	%l1,	%l0
	fandnot2s	%f7,	%f16,	%f18
	fmovsgu	%icc,	%f11,	%f27
	add	%i2,	0x1F34,	%g7
	orcc	%i1,	%o5,	%o3
	edge8n	%i4,	%o1,	%o4
	stx	%g2,	[%l7 + 0x78]
	lduw	[%l7 + 0x7C],	%i7
	sth	%i3,	[%l7 + 0x5A]
	for	%f18,	%f24,	%f8
	subc	%l6,	0x1516,	%g3
	fmovdcs	%icc,	%f19,	%f5
	alignaddr	%g4,	%l5,	%g1
	for	%f12,	%f18,	%f4
	movneg	%icc,	%i0,	%l4
	movn	%xcc,	%o7,	%l2
	sdiv	%o2,	0x0954,	%g5
	edge16ln	%i5,	%g6,	%i6
	umulcc	%o6,	0x0DDA,	%o0
	addcc	%l1,	%l3,	%l0
	add	%g7,	%i2,	%i1
	move	%icc,	%o3,	%i4
	mulscc	%o1,	0x07AF,	%o5
	fmovsge	%xcc,	%f1,	%f18
	move	%xcc,	%g2,	%o4
	movl	%xcc,	%i3,	%i7
	srlx	%l6,	0x05,	%g3
	ldsb	[%l7 + 0x4B],	%l5
	edge8ln	%g4,	%g1,	%i0
	movge	%xcc,	%l4,	%l2
	orncc	%o7,	0x02B3,	%g5
	bshuffle	%f16,	%f20,	%f4
	ldsw	[%l7 + 0x60],	%i5
	movcs	%xcc,	%o2,	%g6
	ldx	[%l7 + 0x78],	%i6
	edge8n	%o0,	%o6,	%l3
	fmovdge	%icc,	%f8,	%f4
	movl	%icc,	%l1,	%l0
	ld	[%l7 + 0x14],	%f16
	bshuffle	%f30,	%f18,	%f6
	fmovsleu	%icc,	%f2,	%f12
	fmovrsgz	%g7,	%f2,	%f11
	xor	%i2,	0x19FF,	%o3
	or	%i4,	%i1,	%o1
	orncc	%g2,	0x02FE,	%o4
	fands	%f13,	%f27,	%f5
	popc	%i3,	%i7
	edge32l	%l6,	%g3,	%l5
	edge32l	%g4,	%o5,	%i0
	st	%f26,	[%l7 + 0x5C]
	array32	%g1,	%l4,	%l2
	fnor	%f4,	%f26,	%f30
	xorcc	%o7,	0x01C4,	%g5
	movcc	%xcc,	%o2,	%g6
	movl	%xcc,	%i6,	%o0
	srlx	%i5,	0x14,	%l3
	alignaddrl	%o6,	%l1,	%l0
	fpsub32s	%f22,	%f28,	%f30
	sir	0x004A
	edge32ln	%g7,	%o3,	%i4
	edge16l	%i1,	%i2,	%g2
	fornot1	%f20,	%f18,	%f8
	edge32ln	%o4,	%i3,	%o1
	fmovdvs	%icc,	%f4,	%f10
	std	%f26,	[%l7 + 0x18]
	fmovrslez	%i7,	%f3,	%f1
	fnot1	%f18,	%f10
	umul	%l6,	%l5,	%g3
	array32	%o5,	%i0,	%g4
	ldub	[%l7 + 0x3C],	%l4
	array16	%l2,	%g1,	%o7
	st	%f1,	[%l7 + 0x14]
	edge32	%g5,	%o2,	%g6
	fmovdneg	%icc,	%f1,	%f3
	movleu	%icc,	%i6,	%o0
	fmovsge	%xcc,	%f21,	%f9
	xorcc	%l3,	%i5,	%o6
	fmovsvs	%xcc,	%f30,	%f31
	addcc	%l0,	%l1,	%g7
	fmovsle	%icc,	%f11,	%f10
	sllx	%i4,	0x0F,	%i1
	sth	%o3,	[%l7 + 0x3A]
	lduh	[%l7 + 0x08],	%g2
	ldsb	[%l7 + 0x54],	%o4
	and	%i2,	0x0660,	%i3
	move	%xcc,	%o1,	%i7
	ldsh	[%l7 + 0x68],	%l6
	lduh	[%l7 + 0x7A],	%g3
	udivcc	%l5,	0x009A,	%i0
	fpsub16	%f28,	%f4,	%f22
	movg	%icc,	%o5,	%g4
	fmovsle	%icc,	%f17,	%f18
	sir	0x0933
	udivcc	%l2,	0x01C4,	%l4
	edge16n	%o7,	%g1,	%g5
	addcc	%g6,	%i6,	%o2
	edge8n	%l3,	%o0,	%i5
	movre	%o6,	0x0C5,	%l0
	addcc	%g7,	%l1,	%i1
	std	%f8,	[%l7 + 0x78]
	stb	%i4,	[%l7 + 0x7A]
	sdiv	%g2,	0x13BF,	%o4
	fpsub16s	%f29,	%f4,	%f6
	stb	%i2,	[%l7 + 0x33]
	popc	%o3,	%o1
	sir	0x0C13
	ldd	[%l7 + 0x10],	%f14
	sllx	%i3,	0x09,	%i7
	sth	%l6,	[%l7 + 0x14]
	movgu	%icc,	%l5,	%g3
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	fmovscc	%icc,	%f19,	%f31
	edge32n	%l2,	%l4,	%o7
	fmovrdgz	%g4,	%f4,	%f12
	save %g1, 0x0275, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f6,	%f4
	sdivcc	%g6,	0x07C5,	%i6
	lduw	[%l7 + 0x28],	%o2
	orcc	%l3,	%i5,	%o6
	subccc	%o0,	0x1BB9,	%g7
	sra	%l0,	0x1B,	%l1
	fpadd32s	%f5,	%f3,	%f26
	edge16n	%i1,	%g2,	%o4
	nop
	set	0x10, %g2
	stx	%i2,	[%l7 + %g2]
	subcc	%i4,	0x0134,	%o1
	fexpand	%f11,	%f18
	ldx	[%l7 + 0x10],	%o3
	fzero	%f4
	mulscc	%i3,	%i7,	%l5
	ldub	[%l7 + 0x36],	%g3
	popc	0x11B6,	%i0
	udiv	%o5,	0x15AF,	%l2
	edge32ln	%l4,	%l6,	%g4
	fmovsgu	%icc,	%f31,	%f15
	ldx	[%l7 + 0x78],	%g1
	movneg	%icc,	%o7,	%g6
	xor	%g5,	0x0DA1,	%o2
	fones	%f21
	edge8l	%i6,	%l3,	%i5
	sub	%o0,	%o6,	%l0
	movrgz	%l1,	0x190,	%i1
	orncc	%g7,	%g2,	%i2
	popc	0x0A0E,	%o4
	mulx	%i4,	%o1,	%i3
	movvc	%xcc,	%o3,	%l5
	movg	%xcc,	%i7,	%g3
	edge8ln	%i0,	%o5,	%l4
	fmovsg	%icc,	%f14,	%f14
	movne	%icc,	%l6,	%l2
	umul	%g4,	0x0D91,	%o7
	orn	%g1,	%g5,	%g6
	fandnot1s	%f14,	%f8,	%f15
	fcmple32	%f20,	%f12,	%o2
	ldsh	[%l7 + 0x7C],	%i6
	movre	%i5,	%o0,	%l3
	ld	[%l7 + 0x5C],	%f27
	ldub	[%l7 + 0x13],	%o6
	sub	%l0,	%i1,	%g7
	orncc	%g2,	0x058C,	%l1
	sir	0x096A
	ldsh	[%l7 + 0x58],	%o4
	srlx	%i4,	0x09,	%o1
	ldsh	[%l7 + 0x56],	%i3
	edge16l	%i2,	%o3,	%i7
	subc	%g3,	%l5,	%i0
	add	%l4,	0x104B,	%l6
	popc	0x1CE3,	%o5
	subccc	%g4,	0x1803,	%o7
	save %l2, %g1, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o2,	%i6,	%g5
	movneg	%xcc,	%o0,	%i5
	ldsw	[%l7 + 0x14],	%o6
	stb	%l0,	[%l7 + 0x56]
	add	%l3,	0x1A0D,	%i1
	fcmpeq32	%f6,	%f16,	%g7
	srl	%l1,	%g2,	%i4
	nop
	set	0x18, %i0
	ldub	[%l7 + %i0],	%o1
	edge8n	%i3,	%o4,	%o3
	subccc	%i7,	%g3,	%i2
	edge8ln	%l5,	%i0,	%l6
	fsrc2	%f18,	%f20
	fxnor	%f20,	%f0,	%f20
	lduw	[%l7 + 0x0C],	%o5
	movg	%icc,	%g4,	%l4
	movcs	%xcc,	%l2,	%o7
	addc	%g6,	%g1,	%i6
	alignaddr	%g5,	%o2,	%i5
	fmovsne	%icc,	%f2,	%f29
	movn	%icc,	%o6,	%l0
	movle	%icc,	%o0,	%l3
	srl	%g7,	0x1D,	%l1
	fmovdgu	%xcc,	%f6,	%f27
	movcc	%xcc,	%g2,	%i1
	srl	%o1,	0x10,	%i4
	fmovdge	%icc,	%f25,	%f0
	edge32l	%o4,	%o3,	%i3
	sdivcc	%g3,	0x0829,	%i2
	fand	%f10,	%f16,	%f24
	movvc	%icc,	%i7,	%i0
	orn	%l6,	0x10C4,	%o5
	fnot1	%f18,	%f14
	movrgez	%l5,	%l4,	%g4
	edge32l	%l2,	%g6,	%o7
	lduh	[%l7 + 0x6E],	%i6
	fmovsn	%xcc,	%f0,	%f12
	fmul8x16al	%f12,	%f19,	%f6
	alignaddrl	%g1,	%o2,	%g5
	fpsub16s	%f31,	%f27,	%f7
	edge16n	%o6,	%l0,	%o0
	fmovdn	%xcc,	%f10,	%f21
	xnor	%i5,	0x0C83,	%g7
	fnor	%f28,	%f0,	%f10
	sllx	%l1,	0x19,	%l3
	movrlez	%g2,	%i1,	%i4
	edge16n	%o1,	%o3,	%i3
	movge	%icc,	%o4,	%i2
	movn	%icc,	%g3,	%i0
	edge32ln	%l6,	%o5,	%l5
	fcmps	%fcc3,	%f11,	%f31
	fxors	%f5,	%f24,	%f6
	for	%f22,	%f10,	%f20
	alignaddr	%i7,	%l4,	%l2
	fmovsneg	%icc,	%f9,	%f2
	andn	%g6,	0x1AE6,	%o7
	array8	%g4,	%g1,	%o2
	fmovrdgz	%g5,	%f16,	%f16
	fone	%f4
	mova	%xcc,	%o6,	%i6
	ldsh	[%l7 + 0x6E],	%o0
	save %i5, 0x1A69, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%l1,	%g7
	orncc	%g2,	0x1A95,	%i1
	movrlz	%i4,	0x185,	%l3
	srax	%o3,	%i3,	%o1
	movvs	%xcc,	%o4,	%i2
	andcc	%g3,	%i0,	%l6
	lduh	[%l7 + 0x48],	%l5
	ldsh	[%l7 + 0x16],	%o5
	sub	%l4,	%i7,	%g6
	xorcc	%o7,	0x1DA6,	%l2
	ldd	[%l7 + 0x08],	%g4
	movne	%xcc,	%o2,	%g1
	addc	%o6,	%g5,	%o0
	movvc	%icc,	%i6,	%l0
	fzero	%f12
	srlx	%l1,	0x00,	%i5
	edge32l	%g7,	%i1,	%i4
	lduh	[%l7 + 0x64],	%g2
	sll	%o3,	%i3,	%o1
	udiv	%o4,	0x0061,	%l3
	and	%i2,	0x01AB,	%g3
	movrgez	%i0,	%l6,	%o5
	movn	%icc,	%l5,	%i7
	alignaddrl	%l4,	%o7,	%g6
	addccc	%g4,	%l2,	%o2
	orn	%o6,	%g5,	%g1
	orncc	%o0,	0x026A,	%i6
	fmovrslez	%l0,	%f15,	%f15
	alignaddr	%l1,	%g7,	%i1
	umulcc	%i4,	0x0786,	%g2
	ldd	[%l7 + 0x68],	%o2
	smulcc	%i3,	%i5,	%o4
	subc	%o1,	0x1355,	%l3
	st	%f15,	[%l7 + 0x78]
	std	%f0,	[%l7 + 0x60]
	andncc	%i2,	%g3,	%l6
	fmul8x16al	%f25,	%f26,	%f26
	ldsh	[%l7 + 0x5A],	%i0
	srlx	%l5,	%i7,	%l4
	fmovsvc	%icc,	%f25,	%f9
	movneg	%xcc,	%o7,	%o5
	subcc	%g6,	%g4,	%o2
	alignaddr	%l2,	%o6,	%g1
	movle	%icc,	%g5,	%i6
	umul	%l0,	%o0,	%l1
	subc	%i1,	%g7,	%g2
	alignaddr	%i4,	%i3,	%i5
	movpos	%xcc,	%o4,	%o1
	edge32l	%l3,	%o3,	%g3
	movg	%xcc,	%i2,	%l6
	movle	%xcc,	%l5,	%i0
	xnor	%i7,	%l4,	%o5
	fcmpgt16	%f16,	%f12,	%o7
	addccc	%g6,	%o2,	%g4
	fnegs	%f28,	%f9
	umulcc	%l2,	%g1,	%o6
	fmovdcs	%icc,	%f14,	%f7
	fnors	%f26,	%f23,	%f16
	fmovdvc	%icc,	%f16,	%f23
	orcc	%g5,	0x0FAD,	%i6
	fmovrsne	%l0,	%f16,	%f19
	edge8ln	%l1,	%i1,	%g7
	fcmps	%fcc1,	%f6,	%f20
	or	%o0,	0x1931,	%i4
	and	%g2,	%i5,	%o4
	alignaddr	%i3,	%l3,	%o1
	subcc	%o3,	%g3,	%i2
	movrlz	%l5,	%l6,	%i0
	alignaddrl	%i7,	%l4,	%o7
	umul	%o5,	%g6,	%g4
	movrgez	%o2,	0x216,	%g1
	edge8ln	%l2,	%g5,	%o6
	array32	%l0,	%l1,	%i1
	sdivcc	%i6,	0x12C5,	%o0
	fpsub32s	%f3,	%f29,	%f1
	movrgz	%g7,	%i4,	%g2
	edge16n	%i5,	%i3,	%o4
	xnor	%l3,	%o3,	%o1
	edge8n	%g3,	%i2,	%l6
	popc	0x186F,	%l5
	fpack32	%f30,	%f22,	%f14
	movle	%xcc,	%i7,	%i0
	ldd	[%l7 + 0x68],	%l4
	subccc	%o5,	%g6,	%o7
	fmovdle	%xcc,	%f9,	%f30
	sdivcc	%o2,	0x1406,	%g4
	andncc	%l2,	%g1,	%o6
	fors	%f9,	%f23,	%f16
	popc	0x1C0D,	%g5
	save %l1, 0x07B8, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i6,	%i1,	%g7
	movvc	%icc,	%i4,	%g2
	umulcc	%i5,	0x0AC9,	%i3
	movle	%icc,	%o4,	%l3
	movrlez	%o0,	0x22F,	%o3
	udivx	%g3,	0x1973,	%o1
	andcc	%l6,	0x167F,	%i2
	udiv	%l5,	0x0C86,	%i0
	move	%xcc,	%i7,	%l4
	edge8	%g6,	%o5,	%o7
	movl	%xcc,	%g4,	%l2
	movpos	%icc,	%o2,	%o6
	fmovrdlz	%g5,	%f18,	%f8
	st	%f23,	[%l7 + 0x10]
	movge	%xcc,	%g1,	%l0
	orncc	%l1,	%i6,	%g7
	nop
	set	0x60, %i7
	ldsw	[%l7 + %i7],	%i4
	movcs	%icc,	%i1,	%i5
	xor	%g2,	%o4,	%i3
	fmovdpos	%xcc,	%f11,	%f3
	lduw	[%l7 + 0x38],	%o0
	alignaddr	%l3,	%g3,	%o3
	udivcc	%l6,	0x1CE5,	%i2
	save %l5, 0x009C, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%xcc,	%f14,	%f5
	mulx	%i0,	0x0472,	%i7
	movge	%icc,	%g6,	%o5
	and	%l4,	0x03D2,	%o7
	ldsw	[%l7 + 0x70],	%g4
	subcc	%o2,	%l2,	%o6
	nop
	set	0x50, %g6
	ldsh	[%l7 + %g6],	%g1
	udivcc	%g5,	0x0D06,	%l1
	sub	%l0,	0x1959,	%i6
	fcmpgt32	%f10,	%f4,	%i4
	movrgz	%i1,	0x1FA,	%i5
	fandnot2s	%f29,	%f6,	%f31
	ldsh	[%l7 + 0x0E],	%g2
	movrgz	%o4,	0x3E3,	%i3
	edge8ln	%o0,	%g7,	%l3
	movvc	%icc,	%g3,	%o3
	ld	[%l7 + 0x20],	%f22
	fands	%f6,	%f12,	%f21
	fmovsa	%icc,	%f8,	%f21
	for	%f30,	%f10,	%f24
	edge16ln	%l6,	%i2,	%o1
	orncc	%i0,	%l5,	%g6
	fandnot1	%f0,	%f6,	%f26
	restore %i7, %l4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%g4,	%o7
	xnorcc	%l2,	%o2,	%o6
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	movle	%icc,	%g5,	%i4
	andncc	%i6,	%i5,	%g2
	ldd	[%l7 + 0x18],	%f22
	popc	0x13F7,	%i1
	movle	%icc,	%i3,	%o0
	udivcc	%o4,	0x05D6,	%g7
	movpos	%xcc,	%l3,	%o3
	movge	%xcc,	%g3,	%l6
	sir	0x1FBC
	subccc	%i2,	%i0,	%o1
	edge16ln	%l5,	%i7,	%l4
	srlx	%g6,	0x16,	%o5
	ldsb	[%l7 + 0x58],	%o7
	subc	%l2,	0x0CC7,	%o2
	array8	%o6,	%g4,	%g1
	movrgez	%l1,	0x330,	%l0
	mulx	%i4,	%g5,	%i5
	edge16n	%g2,	%i6,	%i1
	and	%o0,	0x04B2,	%o4
	andn	%g7,	%l3,	%o3
	edge8l	%i3,	%g3,	%l6
	restore %i2, 0x07C0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l5,	%i0,	%l4
	stw	%i7,	[%l7 + 0x68]
	fmovsne	%icc,	%f29,	%f5
	stw	%o5,	[%l7 + 0x28]
	edge32n	%o7,	%l2,	%o2
	edge16	%o6,	%g4,	%g6
	movrlez	%l1,	%g1,	%l0
	fmovrse	%g5,	%f1,	%f3
	ldd	[%l7 + 0x08],	%i4
	ldd	[%l7 + 0x28],	%f6
	movvc	%icc,	%i4,	%g2
	movcc	%icc,	%i1,	%o0
	stb	%i6,	[%l7 + 0x40]
	ldsb	[%l7 + 0x4D],	%o4
	edge8ln	%g7,	%o3,	%l3
	fmovdle	%xcc,	%f27,	%f1
	movrlz	%i3,	%g3,	%l6
	fands	%f3,	%f2,	%f15
	srlx	%i2,	0x1F,	%l5
	fmovrsne	%i0,	%f18,	%f18
	andncc	%l4,	%o1,	%o5
	fmovspos	%icc,	%f15,	%f22
	array16	%i7,	%o7,	%o2
	stb	%o6,	[%l7 + 0x63]
	stx	%l2,	[%l7 + 0x10]
	movle	%icc,	%g4,	%l1
	fmovsge	%xcc,	%f26,	%f29
	udiv	%g1,	0x13C5,	%g6
	ldx	[%l7 + 0x40],	%g5
	srlx	%i5,	%l0,	%i4
	fmovdcs	%xcc,	%f27,	%f3
	edge32l	%i1,	%g2,	%i6
	edge16n	%o0,	%g7,	%o3
	move	%xcc,	%l3,	%o4
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	sllx	%g3,	0x1A,	%i0
	movrlez	%l5,	%l4,	%o1
	movrlz	%i7,	%o7,	%o5
	movcc	%xcc,	%o2,	%o6
	sub	%g4,	%l2,	%l1
	edge8	%g6,	%g1,	%g5
	fabss	%f8,	%f1
	movl	%xcc,	%i5,	%l0
	ldub	[%l7 + 0x47],	%i1
	fandnot2	%f4,	%f4,	%f0
	movvc	%xcc,	%g2,	%i6
	ldub	[%l7 + 0x08],	%i4
	mulscc	%o0,	%o3,	%g7
	array16	%l3,	%i3,	%o4
	movrlz	%i2,	%g3,	%l6
	sllx	%l5,	%l4,	%i0
	popc	0x064B,	%o1
	edge8l	%o7,	%o5,	%o2
	fcmpne16	%f0,	%f6,	%o6
	udiv	%i7,	0x01C2,	%l2
	andncc	%g4,	%l1,	%g1
	edge8n	%g6,	%g5,	%l0
	edge32	%i1,	%i5,	%i6
	mulscc	%g2,	0x050A,	%o0
	fornot2s	%f18,	%f13,	%f2
	sdiv	%i4,	0x07FE,	%g7
	movne	%xcc,	%l3,	%o3
	edge8n	%i3,	%i2,	%o4
	xor	%g3,	%l5,	%l4
	edge8l	%l6,	%o1,	%i0
	add	%o5,	%o2,	%o7
	smul	%o6,	0x03D6,	%i7
	movpos	%xcc,	%l2,	%l1
	array32	%g4,	%g6,	%g1
	fmovd	%f8,	%f8
	sub	%g5,	%i1,	%l0
	fmul8x16al	%f9,	%f3,	%f10
	ldx	[%l7 + 0x08],	%i5
	stb	%i6,	[%l7 + 0x3E]
	subcc	%g2,	0x11FE,	%o0
	ldub	[%l7 + 0x2A],	%g7
	movn	%xcc,	%i4,	%o3
	lduh	[%l7 + 0x68],	%i3
	fcmpd	%fcc0,	%f10,	%f24
	orcc	%l3,	%i2,	%o4
	edge8n	%g3,	%l5,	%l4
	alignaddr	%o1,	%i0,	%o5
	fnor	%f8,	%f16,	%f8
	movle	%icc,	%o2,	%o7
	movg	%icc,	%o6,	%l6
	srlx	%i7,	0x1A,	%l1
	movrlz	%l2,	%g4,	%g1
	movrgez	%g5,	%i1,	%l0
	sll	%i5,	0x17,	%g6
	sdivcc	%i6,	0x13D2,	%g2
	movrlez	%g7,	%o0,	%i4
	alignaddrl	%i3,	%l3,	%o3
	array8	%i2,	%g3,	%l5
	sdivcc	%o4,	0x01B5,	%l4
	fmovdgu	%icc,	%f25,	%f30
	move	%icc,	%o1,	%i0
	smulcc	%o2,	%o7,	%o5
	nop
	set	0x28, %g7
	stx	%o6,	[%l7 + %g7]
	movre	%i7,	%l1,	%l6
	movrne	%l2,	0x2E0,	%g4
	addccc	%g5,	%g1,	%l0
	fsrc2s	%f27,	%f26
	movneg	%icc,	%i1,	%g6
	movrlez	%i6,	%g2,	%i5
	smulcc	%g7,	0x1CCF,	%o0
	array16	%i4,	%i3,	%o3
	movre	%i2,	%l3,	%g3
	mova	%xcc,	%o4,	%l5
	movleu	%icc,	%o1,	%l4
	movvc	%xcc,	%o2,	%i0
	stb	%o5,	[%l7 + 0x7B]
	fmovdle	%xcc,	%f2,	%f24
	alignaddrl	%o6,	%o7,	%i7
	stb	%l1,	[%l7 + 0x28]
	popc	%l6,	%l2
	ldd	[%l7 + 0x40],	%g4
	mulx	%g4,	0x18E6,	%g1
	fpsub32s	%f3,	%f21,	%f31
	xorcc	%i1,	0x13B0,	%l0
	subccc	%i6,	0x18C1,	%g2
	fmul8x16al	%f5,	%f14,	%f20
	edge32	%i5,	%g6,	%g7
	sir	0x04F2
	fmovdvs	%xcc,	%f19,	%f25
	and	%o0,	%i3,	%i4
	movgu	%xcc,	%o3,	%i2
	array32	%g3,	%o4,	%l3
	edge32	%o1,	%l4,	%l5
	fnot2s	%f24,	%f21
	fandnot1	%f18,	%f22,	%f22
	srlx	%i0,	0x0A,	%o5
	edge32	%o6,	%o7,	%o2
	movleu	%xcc,	%l1,	%l6
	umul	%i7,	0x1623,	%l2
	sll	%g4,	0x14,	%g5
	movrne	%g1,	%l0,	%i1
	alignaddrl	%i6,	%i5,	%g6
	movcc	%icc,	%g7,	%g2
	movrlez	%i3,	0x058,	%i4
	add	%o0,	%i2,	%g3
	fone	%f4
	lduh	[%l7 + 0x08],	%o4
	ldub	[%l7 + 0x62],	%l3
	movrne	%o3,	%l4,	%l5
	movpos	%icc,	%o1,	%i0
	fcmpgt16	%f28,	%f26,	%o5
	movcs	%icc,	%o6,	%o2
	movvc	%xcc,	%l1,	%o7
	movrlz	%i7,	%l2,	%l6
	srax	%g5,	%g4,	%g1
	array32	%i1,	%l0,	%i6
	movcs	%xcc,	%i5,	%g6
	std	%f2,	[%l7 + 0x70]
	bshuffle	%f22,	%f26,	%f26
	fmovrslz	%g2,	%f25,	%f30
	movl	%icc,	%i3,	%g7
	stx	%o0,	[%l7 + 0x68]
	ldsh	[%l7 + 0x28],	%i2
	fmovsge	%xcc,	%f23,	%f25
	fandnot1s	%f9,	%f6,	%f29
	edge8	%g3,	%o4,	%i4
	movge	%icc,	%o3,	%l4
	xnorcc	%l5,	0x180E,	%l3
	andncc	%o1,	%o5,	%o6
	nop
	set	0x18, %o4
	std	%f2,	[%l7 + %o4]
	or	%o2,	0x1452,	%l1
	movle	%icc,	%i0,	%i7
	fpackfix	%f0,	%f10
	fzero	%f8
	move	%icc,	%l2,	%l6
	movvs	%xcc,	%o7,	%g4
	array32	%g1,	%g5,	%i1
	subc	%l0,	0x11D4,	%i5
	andn	%i6,	%g6,	%g2
	sethi	0x178F,	%g7
	movne	%xcc,	%o0,	%i2
	nop
	set	0x60, %o1
	ldsw	[%l7 + %o1],	%i3
	movle	%icc,	%g3,	%i4
	smul	%o4,	0x1467,	%l4
	fmovsn	%icc,	%f30,	%f26
	edge8	%o3,	%l3,	%l5
	xnorcc	%o5,	%o6,	%o2
	umulcc	%l1,	%i0,	%o1
	movgu	%xcc,	%i7,	%l6
	fmovdg	%xcc,	%f30,	%f19
	ldx	[%l7 + 0x70],	%l2
	movrgez	%o7,	%g1,	%g4
	movle	%xcc,	%g5,	%l0
	array8	%i5,	%i1,	%i6
	ldx	[%l7 + 0x38],	%g6
	move	%icc,	%g7,	%g2
	orn	%i2,	0x0240,	%i3
	stb	%o0,	[%l7 + 0x6B]
	addcc	%i4,	%g3,	%o4
	movleu	%xcc,	%l4,	%l3
	fmovde	%xcc,	%f28,	%f25
	fmovdne	%icc,	%f5,	%f23
	ldub	[%l7 + 0x4A],	%l5
	movrne	%o5,	0x39B,	%o6
	edge32ln	%o2,	%o3,	%i0
	edge16ln	%l1,	%i7,	%l6
	movn	%xcc,	%o1,	%o7
	movrlz	%l2,	%g1,	%g4
	move	%xcc,	%g5,	%l0
	subc	%i1,	%i5,	%i6
	fnand	%f14,	%f4,	%f2
	or	%g7,	0x13BB,	%g2
	xnor	%i2,	%i3,	%o0
	array16	%i4,	%g3,	%o4
	ldsh	[%l7 + 0x70],	%l4
	mulx	%g6,	%l5,	%l3
	edge32ln	%o5,	%o6,	%o3
	sir	0x1F29
	fpsub32s	%f18,	%f0,	%f12
	fnegs	%f9,	%f6
	edge8n	%i0,	%o2,	%l1
	ldsw	[%l7 + 0x74],	%l6
	add	%o1,	%i7,	%o7
	sra	%l2,	0x11,	%g4
	smulcc	%g5,	%l0,	%i1
	fmovda	%icc,	%f29,	%f2
	udivx	%i5,	0x159C,	%i6
	movrne	%g7,	0x3FA,	%g2
	movne	%icc,	%i2,	%i3
	ldsw	[%l7 + 0x40],	%o0
	movg	%xcc,	%i4,	%g1
	st	%f8,	[%l7 + 0x4C]
	edge8ln	%g3,	%l4,	%g6
	edge8ln	%l5,	%l3,	%o4
	movrne	%o5,	%o6,	%o3
	movrlz	%o2,	%i0,	%l1
	addc	%l6,	%o1,	%i7
	movcs	%xcc,	%o7,	%l2
	fmul8ulx16	%f10,	%f10,	%f0
	udivcc	%g5,	0x0A61,	%l0
	popc	%g4,	%i5
	ld	[%l7 + 0x3C],	%f29
	fones	%f2
	udiv	%i6,	0x0086,	%g7
	movle	%icc,	%g2,	%i1
	andncc	%i3,	%i2,	%i4
	srl	%o0,	0x16,	%g1
	addc	%l4,	0x0307,	%g6
	edge8	%g3,	%l5,	%o4
	movpos	%icc,	%o5,	%o6
	fmovsl	%icc,	%f9,	%f31
	nop
	set	0x40, %o5
	ldsw	[%l7 + %o5],	%o3
	popc	%l3,	%o2
	move	%xcc,	%i0,	%l6
	edge32n	%l1,	%i7,	%o1
	subccc	%o7,	%g5,	%l2
	movgu	%xcc,	%l0,	%i5
	ldsh	[%l7 + 0x4E],	%g4
	sdiv	%g7,	0x1F65,	%g2
	fmovscc	%icc,	%f6,	%f14
	subc	%i6,	%i1,	%i3
	nop
	set	0x44, %l0
	stb	%i4,	[%l7 + %l0]
	fnors	%f13,	%f18,	%f4
	fabss	%f8,	%f26
	lduw	[%l7 + 0x24],	%o0
	fcmps	%fcc3,	%f18,	%f12
	andncc	%i2,	%l4,	%g1
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%g6
	movpos	%xcc,	%g3,	%l5
	st	%f29,	[%l7 + 0x7C]
	xor	%o5,	%o6,	%o4
	udivcc	%o3,	0x177E,	%o2
	std	%f28,	[%l7 + 0x70]
	xor	%i0,	%l3,	%l1
	fmovscc	%xcc,	%f0,	%f5
	fcmpes	%fcc1,	%f0,	%f30
	orncc	%l6,	0x1C77,	%i7
	fmovrdgz	%o1,	%f26,	%f28
	stx	%g5,	[%l7 + 0x38]
	save %o7, %l0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g4,	[%l7 + 0x1C]
	orn	%l2,	%g2,	%g7
	alignaddr	%i6,	%i1,	%i4
	stw	%o0,	[%l7 + 0x24]
	edge8l	%i2,	%i3,	%l4
	stx	%g1,	[%l7 + 0x68]
	nop
	set	0x08, %l3
	ldd	[%l7 + %l3],	%f2
	fpadd16	%f12,	%f12,	%f18
	fandnot2s	%f23,	%f20,	%f14
	fpack32	%f2,	%f18,	%f8
	movge	%xcc,	%g3,	%l5
	movpos	%icc,	%o5,	%g6
	movcs	%icc,	%o6,	%o4
	movne	%icc,	%o3,	%i0
	srax	%l3,	0x0F,	%l1
	fands	%f1,	%f4,	%f17
	srl	%l6,	%i7,	%o2
	orn	%o1,	%o7,	%l0
	restore %g5, %g4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g2,	0x1A3F,	%g7
	fandnot2	%f2,	%f14,	%f28
	popc	%i6,	%i1
	fmovrdgz	%l2,	%f12,	%f0
	fpack16	%f22,	%f21
	movleu	%icc,	%i4,	%o0
	movrlz	%i2,	0x0FA,	%l4
	fmovde	%xcc,	%f8,	%f10
	sdivcc	%i3,	0x0813,	%g3
	fmovdne	%xcc,	%f1,	%f19
	save %g1, %o5, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%o6,	0x16,	%o4
	andcc	%g6,	0x1B1F,	%i0
	or	%l3,	%o3,	%l1
	sll	%i7,	%o2,	%o1
	edge16ln	%l6,	%o7,	%l0
	move	%icc,	%g4,	%g5
	edge16ln	%g2,	%i5,	%g7
	movle	%xcc,	%i6,	%i1
	stb	%l2,	[%l7 + 0x34]
	edge16n	%o0,	%i4,	%i2
	srl	%l4,	%g3,	%g1
	edge8	%i3,	%l5,	%o5
	fmovdg	%icc,	%f4,	%f26
	edge32l	%o6,	%g6,	%o4
	array8	%l3,	%o3,	%l1
	xorcc	%i7,	%i0,	%o2
	movleu	%icc,	%o1,	%o7
	st	%f10,	[%l7 + 0x44]
	faligndata	%f14,	%f6,	%f4
	fmovsle	%xcc,	%f24,	%f26
	fpack32	%f10,	%f0,	%f6
	ldsh	[%l7 + 0x68],	%l0
	movcs	%icc,	%g4,	%g5
	fcmpes	%fcc3,	%f16,	%f1
	fmuld8ulx16	%f31,	%f17,	%f24
	ldsh	[%l7 + 0x26],	%g2
	edge16ln	%i5,	%g7,	%l6
	fmul8sux16	%f0,	%f20,	%f14
	edge32ln	%i6,	%l2,	%i1
	or	%i4,	%i2,	%l4
	fmovsvs	%icc,	%f24,	%f4
	ldsh	[%l7 + 0x2A],	%o0
	fmovrdne	%g1,	%f2,	%f2
	save %i3, 0x0437, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%o5,	%g3
	fandnot1	%f10,	%f2,	%f0
	movgu	%icc,	%o6,	%o4
	srlx	%g6,	%l3,	%o3
	fornot2	%f14,	%f30,	%f12
	fpmerge	%f16,	%f3,	%f26
	array8	%l1,	%i7,	%i0
	movge	%xcc,	%o2,	%o7
	sethi	0x0D00,	%o1
	edge16n	%g4,	%l0,	%g2
	sub	%g5,	%i5,	%l6
	andcc	%i6,	%l2,	%g7
	array16	%i1,	%i2,	%i4
	smulcc	%l4,	0x0724,	%g1
	ldd	[%l7 + 0x48],	%i2
	sra	%o0,	%l5,	%g3
	array8	%o6,	%o5,	%o4
	siam	0x2
	fnot2s	%f7,	%f31
	srlx	%l3,	0x13,	%g6
	xnorcc	%l1,	%i7,	%o3
	fpack32	%f16,	%f6,	%f4
	movg	%xcc,	%i0,	%o7
	fmovsneg	%xcc,	%f25,	%f7
	movge	%icc,	%o2,	%o1
	nop
	set	0x30, %o7
	ldsw	[%l7 + %o7],	%l0
	udivcc	%g4,	0x08A7,	%g2
	fabss	%f23,	%f20
	edge16l	%g5,	%l6,	%i5
	fpsub16s	%f20,	%f29,	%f24
	fmul8x16	%f26,	%f26,	%f24
	xorcc	%i6,	0x1A87,	%l2
	movl	%xcc,	%i1,	%i2
	fpsub16	%f12,	%f12,	%f30
	edge32	%g7,	%l4,	%i4
	stx	%g1,	[%l7 + 0x38]
	std	%f12,	[%l7 + 0x08]
	fmovsn	%xcc,	%f20,	%f18
	orncc	%o0,	%i3,	%g3
	lduh	[%l7 + 0x74],	%l5
	fandnot2s	%f30,	%f3,	%f22
	ldsw	[%l7 + 0x54],	%o5
	orcc	%o6,	%o4,	%l3
	udivcc	%l1,	0x0146,	%g6
	st	%f26,	[%l7 + 0x18]
	fornot1s	%f18,	%f18,	%f15
	fsrc1s	%f30,	%f12
	fmul8sux16	%f30,	%f16,	%f16
	addc	%i7,	0x027D,	%i0
	fmovrslz	%o3,	%f0,	%f2
	movn	%icc,	%o7,	%o1
	sir	0x0544
	movleu	%xcc,	%o2,	%l0
	sra	%g2,	0x0B,	%g4
	fmovscc	%icc,	%f10,	%f15
	movrne	%g5,	%i5,	%l6
	siam	0x5
	popc	0x1721,	%l2
	fmul8x16al	%f17,	%f3,	%f20
	fmovd	%f16,	%f10
	array16	%i1,	%i2,	%i6
	movleu	%icc,	%g7,	%l4
	movvc	%icc,	%i4,	%o0
	addc	%i3,	0x0C71,	%g3
	movre	%g1,	%o5,	%o6
	srlx	%o4,	%l3,	%l5
	edge8n	%l1,	%i7,	%g6
	movne	%icc,	%o3,	%i0
	movge	%xcc,	%o7,	%o1
	ld	[%l7 + 0x38],	%f2
	add	%o2,	%g2,	%g4
	edge8l	%g5,	%l0,	%l6
	edge16l	%i5,	%l2,	%i1
	fnot2s	%f15,	%f18
	mulx	%i6,	%i2,	%g7
	ldsw	[%l7 + 0x28],	%i4
	andn	%o0,	0x00D5,	%i3
	fmovde	%icc,	%f7,	%f16
	fmul8x16au	%f14,	%f22,	%f8
	movpos	%icc,	%g3,	%l4
	xnorcc	%o5,	0x0B07,	%o6
	for	%f2,	%f22,	%f30
	addcc	%o4,	0x026F,	%g1
	xnor	%l5,	0x192C,	%l1
	addcc	%i7,	0x0A47,	%l3
	movpos	%xcc,	%g6,	%o3
	udivcc	%i0,	0x0F99,	%o7
	movrlez	%o1,	%g2,	%o2
	alignaddr	%g4,	%g5,	%l0
	stw	%i5,	[%l7 + 0x34]
	fmovrsne	%l6,	%f11,	%f21
	fzero	%f26
	edge16n	%l2,	%i6,	%i2
	ldsw	[%l7 + 0x7C],	%i1
	movvs	%icc,	%i4,	%o0
	orn	%g7,	%g3,	%l4
	edge8l	%o5,	%o6,	%o4
	movrgz	%i3,	0x37D,	%l5
	xor	%g1,	0x0A79,	%i7
	movrgez	%l3,	%g6,	%l1
	movgu	%icc,	%i0,	%o7
	fmovspos	%icc,	%f1,	%f19
	nop
	set	0x6A, %o6
	ldsh	[%l7 + %o6],	%o1
	or	%g2,	0x1339,	%o3
	ldsb	[%l7 + 0x2E],	%o2
	fpadd32s	%f0,	%f25,	%f23
	std	%f20,	[%l7 + 0x20]
	fpmerge	%f0,	%f28,	%f18
	ldx	[%l7 + 0x50],	%g5
	addcc	%g4,	%i5,	%l0
	orn	%l6,	0x1162,	%l2
	xnor	%i6,	0x01F2,	%i1
	subccc	%i4,	0x07A4,	%o0
	edge8l	%g7,	%g3,	%i2
	stb	%o5,	[%l7 + 0x4C]
	fabss	%f13,	%f18
	ld	[%l7 + 0x6C],	%f17
	andncc	%o6,	%l4,	%o4
	srax	%l5,	%g1,	%i3
	andncc	%l3,	%i7,	%g6
	mulscc	%l1,	0x11C9,	%i0
	xor	%o7,	%g2,	%o3
	sub	%o2,	%g5,	%g4
	fpadd16	%f26,	%f22,	%f12
	or	%o1,	0x1A99,	%i5
	movgu	%xcc,	%l6,	%l0
	fsrc1	%f24,	%f24
	srax	%i6,	0x16,	%i1
	fnot2s	%f23,	%f5
	fzero	%f8
	sra	%l2,	0x0C,	%i4
	srl	%o0,	%g7,	%i2
	alignaddr	%o5,	%g3,	%o6
	movvs	%xcc,	%o4,	%l5
	edge32l	%l4,	%g1,	%l3
	fcmps	%fcc3,	%f30,	%f19
	array8	%i7,	%g6,	%i3
	xor	%l1,	%i0,	%g2
	edge32l	%o7,	%o2,	%o3
	ldsw	[%l7 + 0x48],	%g4
	fcmpne16	%f20,	%f26,	%g5
	edge8ln	%i5,	%l6,	%o1
	lduh	[%l7 + 0x2C],	%i6
	srlx	%l0,	%l2,	%i4
	xnor	%o0,	0x0F89,	%g7
	edge32l	%i1,	%o5,	%g3
	movn	%xcc,	%o6,	%i2
	ldsb	[%l7 + 0x08],	%o4
	movcc	%icc,	%l5,	%l4
	fornot1s	%f26,	%f17,	%f16
	fmovdgu	%icc,	%f12,	%f24
	fcmpeq32	%f12,	%f4,	%l3
	orncc	%i7,	0x1859,	%g1
	addccc	%i3,	0x0311,	%l1
	movvc	%icc,	%i0,	%g6
	st	%f29,	[%l7 + 0x50]
	edge16l	%g2,	%o2,	%o7
	fornot2s	%f21,	%f26,	%f14
	mulscc	%o3,	%g4,	%i5
	fabsd	%f16,	%f26
	udivx	%g5,	0x14A9,	%l6
	movneg	%xcc,	%i6,	%l0
	movl	%icc,	%o1,	%i4
	mulscc	%l2,	0x050C,	%g7
	addc	%o0,	0x164D,	%i1
	fcmpne16	%f22,	%f26,	%o5
	edge16l	%g3,	%o6,	%i2
	fsrc1s	%f17,	%f1
	fcmpeq16	%f28,	%f22,	%o4
	fors	%f28,	%f2,	%f15
	umulcc	%l4,	%l3,	%i7
	mulscc	%l5,	%i3,	%g1
	popc	%l1,	%g6
	smul	%g2,	%i0,	%o7
	edge16ln	%o2,	%o3,	%i5
	sub	%g5,	%l6,	%g4
	andn	%l0,	0x09F1,	%i6
	movpos	%icc,	%o1,	%i4
	andncc	%l2,	%o0,	%g7
	xor	%i1,	%o5,	%o6
	array16	%i2,	%o4,	%g3
	fmovspos	%icc,	%f5,	%f4
	fpackfix	%f6,	%f7
	edge16	%l3,	%i7,	%l4
	fnot1s	%f31,	%f14
	movn	%icc,	%i3,	%l5
	edge8ln	%l1,	%g1,	%g6
	mulscc	%g2,	0x0550,	%i0
	movg	%icc,	%o2,	%o7
	fmovdg	%xcc,	%f6,	%f3
	srax	%o3,	%i5,	%l6
	movrlez	%g4,	0x2FF,	%g5
	subc	%i6,	0x0B59,	%o1
	alignaddr	%l0,	%l2,	%o0
	fpack16	%f12,	%f25
	fones	%f18
	edge16l	%i4,	%g7,	%i1
	edge8ln	%o5,	%i2,	%o6
	fnors	%f26,	%f8,	%f10
	mova	%xcc,	%g3,	%l3
	fnot2s	%f24,	%f18
	fmovdneg	%xcc,	%f11,	%f15
	andn	%i7,	%o4,	%l4
	lduw	[%l7 + 0x60],	%i3
	fpack16	%f18,	%f18
	xor	%l5,	%l1,	%g6
	edge32n	%g2,	%i0,	%g1
	fandnot2s	%f16,	%f25,	%f17
	sdivcc	%o7,	0x0669,	%o2
	movge	%xcc,	%o3,	%l6
	fcmpes	%fcc1,	%f0,	%f0
	array16	%g4,	%i5,	%g5
	stb	%o1,	[%l7 + 0x77]
	movle	%xcc,	%i6,	%l2
	addcc	%l0,	0x1527,	%o0
	edge16	%g7,	%i1,	%o5
	stw	%i2,	[%l7 + 0x68]
	srl	%o6,	%g3,	%i4
	array16	%i7,	%l3,	%l4
	fpackfix	%f16,	%f8
	sdivx	%o4,	0x1BB7,	%l5
	orncc	%l1,	0x1840,	%g6
	nop
	set	0x1C, %l6
	stw	%i3,	[%l7 + %l6]
	udiv	%i0,	0x16AE,	%g2
	sethi	0x0DC0,	%g1
	srlx	%o2,	%o7,	%l6
	ldsb	[%l7 + 0x0C],	%o3
	add	%g4,	%g5,	%o1
	xnor	%i6,	0x07FB,	%l2
	fnegs	%f18,	%f3
	umul	%i5,	0x18EB,	%l0
	add	%o0,	%g7,	%i1
	sub	%o5,	%o6,	%g3
	fmovsvs	%xcc,	%f26,	%f19
	addccc	%i4,	0x0D26,	%i2
	movrne	%i7,	%l4,	%o4
	sir	0x1892
	fmovsge	%icc,	%f9,	%f8
	and	%l3,	%l5,	%g6
	fcmped	%fcc2,	%f6,	%f24
	edge8n	%i3,	%i0,	%g2
	fmovrslz	%l1,	%f13,	%f30
	sll	%g1,	0x0F,	%o2
	edge32ln	%l6,	%o7,	%o3
	movleu	%icc,	%g5,	%g4
	movne	%icc,	%o1,	%i6
	array32	%i5,	%l0,	%l2
	ldsb	[%l7 + 0x55],	%g7
	udivcc	%i1,	0x0A00,	%o0
	edge16	%o6,	%g3,	%o5
	edge32ln	%i4,	%i2,	%l4
	sllx	%o4,	0x0A,	%i7
	edge32	%l3,	%l5,	%i3
	edge8	%g6,	%g2,	%l1
	udiv	%g1,	0x16E5,	%o2
	movle	%xcc,	%l6,	%o7
	add	%o3,	%i0,	%g5
	array16	%o1,	%g4,	%i5
	bshuffle	%f14,	%f8,	%f2
	edge16n	%l0,	%l2,	%g7
	movge	%xcc,	%i1,	%o0
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f20
	sdiv	%i6,	0x0049,	%o6
	ldub	[%l7 + 0x2D],	%g3
	fmovdg	%icc,	%f30,	%f31
	ldsw	[%l7 + 0x28],	%i4
	edge16ln	%i2,	%o5,	%l4
	movrne	%o4,	%l3,	%i7
	andn	%i3,	%l5,	%g2
	edge8	%g6,	%l1,	%g1
	sir	0x043B
	stx	%l6,	[%l7 + 0x28]
	orcc	%o7,	%o3,	%i0
	mulx	%o2,	%g5,	%o1
	fcmpeq16	%f18,	%f6,	%g4
	std	%f10,	[%l7 + 0x68]
	addc	%i5,	0x070D,	%l2
	smul	%g7,	0x1D99,	%i1
	lduw	[%l7 + 0x44],	%l0
	subccc	%i6,	0x0D04,	%o0
	sra	%o6,	%i4,	%g3
	fors	%f21,	%f20,	%f15
	fornot2	%f22,	%f10,	%f10
	sdiv	%o5,	0x136C,	%l4
	edge16l	%i2,	%l3,	%o4
	fpadd32s	%f6,	%f19,	%f22
	array32	%i3,	%i7,	%g2
	movcc	%xcc,	%g6,	%l5
	sra	%g1,	%l6,	%o7
	fpsub32s	%f8,	%f18,	%f30
	movleu	%icc,	%l1,	%o3
	fnors	%f7,	%f20,	%f12
	fpmerge	%f8,	%f7,	%f10
	ldx	[%l7 + 0x30],	%o2
	edge16	%i0,	%g5,	%o1
	sll	%g4,	0x0D,	%l2
	st	%f19,	[%l7 + 0x34]
	edge32l	%g7,	%i1,	%i5
	umul	%i6,	0x0550,	%o0
	addc	%o6,	%i4,	%g3
	andcc	%o5,	0x1E5A,	%l0
	movrlz	%i2,	%l3,	%o4
	fxnors	%f22,	%f16,	%f19
	sdivcc	%l4,	0x074A,	%i7
	xor	%i3,	0x123F,	%g2
	fands	%f8,	%f4,	%f31
	move	%icc,	%l5,	%g1
	smul	%l6,	0x0A91,	%g6
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	movneg	%xcc,	%i0,	%g5
	fmovrdgez	%o1,	%f8,	%f20
	ldub	[%l7 + 0x58],	%g4
	addccc	%l2,	%g7,	%i1
	xorcc	%i5,	%i6,	%o0
	udiv	%o2,	0x0F07,	%i4
	subccc	%o6,	%o5,	%g3
	array32	%i2,	%l0,	%o4
	fcmpne32	%f28,	%f4,	%l4
	stw	%l3,	[%l7 + 0x38]
	sethi	0x1035,	%i7
	udiv	%g2,	0x1FAA,	%i3
	edge8l	%g1,	%l6,	%l5
	ld	[%l7 + 0x68],	%f25
	movle	%xcc,	%g6,	%o7
	movge	%icc,	%l1,	%o3
	array32	%g5,	%o1,	%g4
	stw	%l2,	[%l7 + 0x20]
	fmovrdlez	%i0,	%f12,	%f16
	lduw	[%l7 + 0x70],	%g7
	edge8l	%i1,	%i6,	%i5
	pdist	%f4,	%f16,	%f2
	fcmple32	%f10,	%f18,	%o2
	movcc	%icc,	%i4,	%o0
	ldsh	[%l7 + 0x1E],	%o6
	save %g3, 0x1E95, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0582,	%i2
	fmovrdgz	%l0,	%f30,	%f8
	fcmpgt16	%f24,	%f16,	%o4
	or	%l4,	%l3,	%i7
	fmovrsgz	%g2,	%f12,	%f17
	fmovrsgz	%i3,	%f23,	%f2
	addccc	%l6,	0x00B0,	%l5
	ldsh	[%l7 + 0x7C],	%g6
	stb	%g1,	[%l7 + 0x6F]
	movne	%icc,	%o7,	%l1
	mulscc	%o3,	%g5,	%g4
	andcc	%l2,	%o1,	%g7
	add	%i0,	%i1,	%i6
	fors	%f3,	%f18,	%f4
	edge8l	%o2,	%i4,	%i5
	subcc	%o6,	%g3,	%o5
	ld	[%l7 + 0x20],	%f17
	edge16	%i2,	%o0,	%l0
	movrne	%l4,	0x003,	%l3
	fmovrsgz	%o4,	%f24,	%f30
	movcs	%xcc,	%i7,	%i3
	fxnors	%f29,	%f23,	%f7
	fmovdle	%icc,	%f14,	%f15
	fmovsa	%icc,	%f12,	%f3
	movrne	%g2,	%l5,	%l6
	sub	%g1,	0x0163,	%o7
	ldub	[%l7 + 0x58],	%g6
	edge16	%l1,	%o3,	%g5
	movrgz	%g4,	%o1,	%g7
	fmovd	%f16,	%f12
	sra	%i0,	0x1A,	%l2
	srlx	%i1,	%o2,	%i4
	sdivcc	%i5,	0x09BC,	%o6
	edge16ln	%i6,	%o5,	%i2
	udivcc	%g3,	0x15BE,	%l0
	xnorcc	%o0,	0x1C89,	%l3
	srax	%l4,	%i7,	%o4
	popc	0x1F84,	%i3
	movcc	%xcc,	%g2,	%l6
	srl	%g1,	%l5,	%g6
	restore %l1, %o3, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g4,	%g5,	%o1
	edge8	%g7,	%l2,	%i0
	st	%f24,	[%l7 + 0x64]
	fmovsg	%xcc,	%f9,	%f22
	save %o2, %i1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f22,	%f18,	%i4
	movvs	%icc,	%o6,	%o5
	srlx	%i6,	%i2,	%g3
	movg	%icc,	%l0,	%l3
	movrgez	%l4,	%o0,	%i7
	sdivx	%o4,	0x0C08,	%g2
	st	%f15,	[%l7 + 0x74]
	edge8	%i3,	%g1,	%l5
	ldd	[%l7 + 0x38],	%i6
	fandnot1	%f28,	%f12,	%f4
	andn	%g6,	%l1,	%o7
	ldx	[%l7 + 0x08],	%g4
	array32	%g5,	%o3,	%o1
	movleu	%xcc,	%l2,	%i0
	fmovrdlz	%o2,	%f10,	%f20
	fmovrdlz	%i1,	%f24,	%f16
	andcc	%i5,	%i4,	%g7
	move	%xcc,	%o6,	%o5
	edge16ln	%i2,	%i6,	%l0
	alignaddr	%l3,	%g3,	%l4
	edge32l	%o0,	%o4,	%i7
	andn	%g2,	0x17D9,	%g1
	edge32ln	%i3,	%l5,	%g6
	movg	%xcc,	%l1,	%o7
	nop
	set	0x28, %i6
	ldx	[%l7 + %i6],	%g4
	ldd	[%l7 + 0x58],	%f14
	smul	%g5,	%o3,	%l6
	save %o1, 0x1F6A, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o2,	%i1,	%i5
	fpack32	%f16,	%f20,	%f16
	andcc	%i0,	%g7,	%o6
	subccc	%o5,	%i4,	%i6
	xnor	%i2,	0x1EE7,	%l3
	subcc	%g3,	0x1DC6,	%l4
	save %l0, %o4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i7,	0x04AB,	%g2
	movrgz	%i3,	%g1,	%l5
	subc	%g6,	%o7,	%l1
	xorcc	%g5,	0x1688,	%g4
	movcc	%icc,	%l6,	%o3
	lduw	[%l7 + 0x38],	%o1
	andn	%l2,	0x00EA,	%i1
	andn	%i5,	%i0,	%o2
	fpack32	%f10,	%f12,	%f14
	movrgz	%o6,	0x25C,	%g7
	fzero	%f6
	edge8ln	%i4,	%o5,	%i6
	st	%f20,	[%l7 + 0x78]
	mova	%xcc,	%l3,	%i2
	movvs	%icc,	%g3,	%l0
	sub	%l4,	%o0,	%i7
	edge16n	%o4,	%i3,	%g2
	movcs	%xcc,	%l5,	%g1
	movge	%xcc,	%o7,	%l1
	fmovsge	%xcc,	%f19,	%f30
	fmovdcc	%icc,	%f22,	%f4
	subccc	%g6,	%g5,	%g4
	fmovsn	%xcc,	%f28,	%f13
	movvs	%icc,	%o3,	%l6
	movcs	%icc,	%l2,	%i1
	fzero	%f6
	mova	%xcc,	%o1,	%i0
	fmovd	%f4,	%f30
	bshuffle	%f28,	%f16,	%f18
	fpadd16s	%f24,	%f6,	%f29
	ldsw	[%l7 + 0x14],	%i5
	movpos	%xcc,	%o6,	%g7
	popc	0x03C6,	%i4
	fcmple32	%f30,	%f30,	%o2
	ld	[%l7 + 0x6C],	%f2
	orcc	%i6,	%l3,	%o5
	array16	%i2,	%l0,	%l4
	fmovsl	%icc,	%f31,	%f4
	movvs	%icc,	%o0,	%g3
	array16	%i7,	%i3,	%g2
	fmovrsgz	%o4,	%f9,	%f21
	movrlez	%l5,	%o7,	%g1
	add	%g6,	%l1,	%g5
	ldd	[%l7 + 0x10],	%f4
	sdivx	%g4,	0x14C5,	%l6
	lduw	[%l7 + 0x7C],	%l2
	movle	%icc,	%i1,	%o1
	fmul8x16al	%f13,	%f17,	%f28
	ldsh	[%l7 + 0x18],	%o3
	fmovsl	%icc,	%f9,	%f13
	fmovdvc	%icc,	%f28,	%f6
	sdivcc	%i0,	0x0135,	%o6
	movl	%xcc,	%g7,	%i5
	movre	%o2,	%i4,	%l3
	add	%i6,	%o5,	%i2
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	ldx	[%l7 + 0x28],	%g3
	edge16	%i7,	%o0,	%g2
	sdiv	%i3,	0x14D1,	%l5
	srax	%o7,	%g1,	%g6
	subcc	%l1,	%o4,	%g5
	fnands	%f22,	%f14,	%f12
	edge32	%l6,	%g4,	%i1
	smul	%l2,	0x0423,	%o3
	fone	%f28
	movge	%icc,	%i0,	%o1
	smul	%g7,	0x0841,	%i5
	andcc	%o2,	0x1538,	%i4
	sth	%l3,	[%l7 + 0x64]
	sir	0x1580
	alignaddrl	%o6,	%o5,	%i2
	std	%f2,	[%l7 + 0x40]
	movvc	%icc,	%l0,	%l4
	sth	%g3,	[%l7 + 0x0C]
	xnorcc	%i6,	%o0,	%g2
	movcs	%icc,	%i7,	%l5
	edge8	%o7,	%i3,	%g1
	srlx	%l1,	0x1A,	%g6
	movpos	%xcc,	%g5,	%o4
	movvc	%xcc,	%l6,	%i1
	fpadd16	%f14,	%f0,	%f26
	ldx	[%l7 + 0x28],	%g4
	fcmpd	%fcc2,	%f14,	%f26
	fone	%f20
	addccc	%l2,	0x1DAB,	%o3
	fmovrslez	%o1,	%f6,	%f28
	sub	%g7,	%i0,	%o2
	xor	%i4,	0x1693,	%i5
	movcc	%xcc,	%l3,	%o5
	fmovsa	%xcc,	%f21,	%f29
	save %i2, %l0, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l4,	%g3,	%o0
	movre	%i6,	0x39F,	%g2
	fmovdgu	%icc,	%f7,	%f26
	sra	%l5,	0x01,	%i7
	fmovrsgez	%o7,	%f12,	%f0
	sub	%g1,	0x1A3D,	%i3
	movg	%icc,	%l1,	%g6
	movrlez	%o4,	0x28E,	%g5
	sll	%i1,	%l6,	%l2
	movgu	%xcc,	%g4,	%o1
	fmovsg	%xcc,	%f29,	%f21
	ldd	[%l7 + 0x60],	%o2
	smulcc	%i0,	%g7,	%i4
	subcc	%i5,	%l3,	%o2
	andcc	%o5,	%i2,	%l0
	movrlz	%l4,	0x273,	%o6
	ld	[%l7 + 0x14],	%f29
	movre	%o0,	%g3,	%g2
	fcmpd	%fcc0,	%f14,	%f24
	fmovdl	%icc,	%f21,	%f28
	movpos	%icc,	%i6,	%l5
	edge8l	%o7,	%g1,	%i3
	fmovdcc	%xcc,	%f10,	%f19
	nop
	set	0x58, %i5
	std	%f30,	[%l7 + %i5]
	movcs	%xcc,	%l1,	%g6
	sdivcc	%o4,	0x0575,	%i7
	addccc	%g5,	%l6,	%i1
	alignaddr	%g4,	%l2,	%o1
	fandnot2s	%f1,	%f6,	%f10
	udivx	%i0,	0x0DEA,	%g7
	fcmpeq32	%f30,	%f12,	%i4
	ldsb	[%l7 + 0x32],	%o3
	orncc	%l3,	0x1DA4,	%i5
	xnorcc	%o2,	0x13AD,	%o5
	movgu	%xcc,	%i2,	%l0
	srax	%o6,	0x17,	%l4
	restore %g3, %g2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f21,	%f22,	%f7
	xorcc	%o0,	0x02C7,	%l5
	edge8l	%o7,	%g1,	%l1
	edge8	%g6,	%i3,	%o4
	edge32l	%g5,	%l6,	%i7
	movvs	%icc,	%g4,	%i1
	fmovdpos	%icc,	%f15,	%f13
	movneg	%xcc,	%l2,	%o1
	fmul8x16	%f14,	%f8,	%f26
	stb	%i0,	[%l7 + 0x35]
	xnor	%i4,	%g7,	%l3
	udivx	%o3,	0x191A,	%o2
	xnor	%o5,	0x10ED,	%i2
	addc	%l0,	%o6,	%i5
	fornot2s	%f25,	%f15,	%f12
	orncc	%l4,	%g3,	%i6
	sth	%g2,	[%l7 + 0x08]
	andncc	%l5,	%o7,	%o0
	fmovrdgez	%l1,	%f24,	%f30
	orncc	%g1,	%g6,	%i3
	movcc	%icc,	%o4,	%l6
	edge8	%g5,	%i7,	%i1
	edge32	%l2,	%o1,	%g4
	srax	%i0,	%i4,	%g7
	fmovde	%icc,	%f27,	%f8
	orncc	%o3,	%l3,	%o5
	edge8n	%i2,	%l0,	%o6
	fmuld8sux16	%f31,	%f13,	%f12
	nop
	set	0x31, %o0
	stb	%o2,	[%l7 + %o0]
	orcc	%l4,	0x1E3A,	%i5
	save %g3, 0x1C5D, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l5,	%i6
	orcc	%o7,	%l1,	%g1
	subcc	%g6,	%o0,	%o4
	fmovrdgez	%l6,	%f10,	%f10
	umul	%g5,	%i3,	%i7
	lduh	[%l7 + 0x62],	%l2
	udivcc	%i1,	0x12E4,	%g4
	smul	%i0,	%i4,	%g7
	std	%f24,	[%l7 + 0x60]
	edge8	%o1,	%l3,	%o3
	movpos	%xcc,	%o5,	%i2
	sub	%l0,	0x14A7,	%o6
	fmovrsne	%l4,	%f24,	%f7
	orcc	%i5,	%o2,	%g2
	movgu	%xcc,	%g3,	%i6
	ldub	[%l7 + 0x4D],	%l5
	fmovrslz	%l1,	%f28,	%f12
	subc	%g1,	%g6,	%o0
	movg	%icc,	%o7,	%o4
	fmovdneg	%xcc,	%f13,	%f23
	addcc	%g5,	%l6,	%i7
	fcmple16	%f14,	%f10,	%l2
	orcc	%i3,	0x1066,	%i1
	sir	0x0466
	udiv	%g4,	0x11B9,	%i4
	movne	%xcc,	%i0,	%o1
	move	%icc,	%g7,	%l3
	edge32n	%o5,	%i2,	%o3
	andn	%l0,	%o6,	%l4
	edge32	%o2,	%g2,	%g3
	ldd	[%l7 + 0x40],	%i6
	movvs	%xcc,	%i5,	%l1
	fsrc1	%f2,	%f16
	srlx	%g1,	%l5,	%g6
	fsrc1s	%f21,	%f13
	stw	%o7,	[%l7 + 0x78]
	udivcc	%o0,	0x0863,	%o4
	fcmps	%fcc2,	%f2,	%f1
	srlx	%g5,	%l6,	%i7
	lduh	[%l7 + 0x66],	%l2
	fxnor	%f0,	%f22,	%f28
	alignaddr	%i3,	%i1,	%g4
	ldd	[%l7 + 0x58],	%f16
	srax	%i4,	%o1,	%i0
	move	%icc,	%l3,	%o5
	array8	%i2,	%o3,	%l0
	fpsub32	%f8,	%f10,	%f20
	srax	%g7,	%l4,	%o2
	movn	%icc,	%o6,	%g2
	movcs	%xcc,	%g3,	%i5
	fmovdleu	%icc,	%f5,	%f27
	mulscc	%i6,	%l1,	%l5
	nop
	set	0x2A, %g4
	ldub	[%l7 + %g4],	%g1
	movge	%icc,	%g6,	%o7
	fmovrsne	%o4,	%f30,	%f26
	nop
	set	0x38, %l5
	stx	%g5,	[%l7 + %l5]
	fcmple32	%f2,	%f12,	%o0
	mulx	%l6,	0x1AE0,	%l2
	sll	%i7,	%i1,	%g4
	fand	%f24,	%f0,	%f4
	udivx	%i4,	0x03B6,	%i3
	fcmpgt16	%f0,	%f28,	%i0
	xnor	%l3,	%o1,	%i2
	mova	%icc,	%o5,	%l0
	umul	%g7,	%l4,	%o2
	nop
	set	0x5B, %g3
	stb	%o3,	[%l7 + %g3]
	sdivcc	%o6,	0x0589,	%g3
	edge16n	%i5,	%g2,	%i6
	or	%l5,	0x0B46,	%l1
	movneg	%xcc,	%g1,	%g6
	edge16n	%o4,	%o7,	%g5
	fnegs	%f0,	%f13
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	mova	%icc,	%i1,	%g4
	movrlz	%i7,	%i4,	%i3
	addccc	%i0,	%o1,	%i2
	ldub	[%l7 + 0x34],	%o5
	fcmpd	%fcc1,	%f8,	%f16
	fcmple16	%f8,	%f20,	%l3
	array16	%l0,	%g7,	%l4
	edge32ln	%o3,	%o6,	%o2
	lduw	[%l7 + 0x14],	%i5
	ldub	[%l7 + 0x16],	%g3
	edge32n	%i6,	%l5,	%l1
	addccc	%g1,	%g2,	%g6
	srax	%o4,	0x0F,	%g5
	fpack16	%f24,	%f8
	fmovsvc	%icc,	%f6,	%f3
	alignaddr	%o7,	%l6,	%l2
	fmovda	%icc,	%f26,	%f25
	fmovrdne	%o0,	%f14,	%f8
	fpsub16s	%f26,	%f19,	%f10
	movvs	%xcc,	%g4,	%i7
	fmovsneg	%xcc,	%f22,	%f15
	array16	%i4,	%i1,	%i0
	edge8n	%o1,	%i3,	%i2
	umulcc	%l3,	%o5,	%g7
	save %l0, 0x0115, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o3,	0x0597,	%o6
	fmovsge	%xcc,	%f9,	%f6
	fmovde	%icc,	%f14,	%f31
	sth	%o2,	[%l7 + 0x6A]
	movrne	%g3,	0x281,	%i5
	fornot2s	%f1,	%f29,	%f11
	movle	%xcc,	%i6,	%l1
	orncc	%l5,	0x1754,	%g2
	srl	%g6,	0x06,	%o4
	movrgez	%g5,	%o7,	%g1
	sdivcc	%l6,	0x09C2,	%l2
	array32	%g4,	%i7,	%o0
	or	%i4,	%i0,	%o1
	andncc	%i3,	%i2,	%l3
	popc	%i1,	%g7
	movneg	%icc,	%l0,	%o5
	fmovrslz	%l4,	%f17,	%f10
	stb	%o3,	[%l7 + 0x50]
	movl	%xcc,	%o6,	%g3
	restore %o2, %i5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%l5,	%i6
	ldsb	[%l7 + 0x0C],	%g6
	fands	%f5,	%f21,	%f31
	array8	%o4,	%g5,	%o7
	srlx	%g2,	0x0F,	%l6
	fornot1s	%f4,	%f27,	%f10
	stw	%l2,	[%l7 + 0x78]
	movvc	%xcc,	%g4,	%g1
	orn	%o0,	%i7,	%i0
	or	%i4,	0x16F7,	%o1
	andncc	%i3,	%l3,	%i2
	edge32l	%g7,	%i1,	%o5
	edge16l	%l0,	%l4,	%o6
	stw	%g3,	[%l7 + 0x3C]
	ldsh	[%l7 + 0x46],	%o2
	movl	%xcc,	%i5,	%l1
	fsrc1s	%f20,	%f29
	xor	%l5,	0x1126,	%o3
	fmovsge	%icc,	%f9,	%f15
	fcmpne16	%f4,	%f20,	%g6
	fmovrsgz	%o4,	%f16,	%f16
	stx	%g5,	[%l7 + 0x58]
	sth	%o7,	[%l7 + 0x2C]
	array32	%g2,	%i6,	%l6
	edge32	%l2,	%g1,	%o0
	save %g4, %i7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f12,	%f15,	%f23
	subcc	%i0,	%o1,	%l3
	fandnot2s	%f11,	%f0,	%f24
	edge16	%i2,	%g7,	%i1
	addc	%i3,	%l0,	%l4
	mulx	%o6,	0x04E3,	%g3
	udiv	%o5,	0x01EF,	%o2
	sllx	%l1,	%l5,	%o3
	alignaddrl	%g6,	%i5,	%o4
	nop
	set	0x78, %i3
	ldub	[%l7 + %i3],	%g5
	stx	%g2,	[%l7 + 0x70]
	edge32	%i6,	%l6,	%o7
	ldsb	[%l7 + 0x45],	%g1
	fmuld8ulx16	%f8,	%f24,	%f6
	lduw	[%l7 + 0x10],	%l2
	fpmerge	%f26,	%f15,	%f8
	ldd	[%l7 + 0x18],	%o0
	movcs	%icc,	%g4,	%i4
	edge8l	%i0,	%o1,	%i7
	fpsub16	%f10,	%f30,	%f14
	st	%f28,	[%l7 + 0x2C]
	orn	%i2,	%g7,	%i1
	ldsw	[%l7 + 0x1C],	%i3
	srl	%l3,	0x1B,	%l4
	fsrc2	%f16,	%f2
	sll	%o6,	0x1B,	%l0
	smulcc	%g3,	0x1432,	%o5
	mulx	%l1,	0x138B,	%l5
	ldsw	[%l7 + 0x7C],	%o3
	ldsw	[%l7 + 0x08],	%o2
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	mulscc	%o4,	%g5,	%i6
	fmovdn	%xcc,	%f30,	%f3
	srax	%g2,	0x1E,	%l6
	xnorcc	%g1,	0x0E41,	%o7
	fmovsvc	%icc,	%f27,	%f24
	movgu	%xcc,	%l2,	%o0
	sdivcc	%g4,	0x0CFB,	%i0
	andcc	%o1,	%i4,	%i2
	orcc	%i7,	0x0743,	%i1
	smulcc	%i3,	0x1487,	%g7
	fmovrdgez	%l3,	%f8,	%f20
	fmovsg	%icc,	%f4,	%f6
	nop
	set	0x08, %l2
	stw	%o6,	[%l7 + %l2]
	fmovrse	%l0,	%f20,	%f25
	xnor	%g3,	%o5,	%l1
	edge8	%l5,	%o3,	%o2
	andn	%g6,	%i5,	%o4
	save %l4, 0x12B6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g2,	%i6,	%g1
	edge8n	%o7,	%l6,	%l2
	sra	%o0,	0x1C,	%i0
	mulx	%o1,	0x19E1,	%g4
	sdiv	%i2,	0x140E,	%i7
	st	%f31,	[%l7 + 0x18]
	st	%f3,	[%l7 + 0x34]
	std	%f16,	[%l7 + 0x78]
	ldub	[%l7 + 0x28],	%i4
	fcmpgt32	%f10,	%f30,	%i1
	fpack32	%f20,	%f28,	%f14
	udiv	%i3,	0x1CB0,	%g7
	sth	%o6,	[%l7 + 0x7A]
	movl	%icc,	%l3,	%g3
	fmovdcc	%icc,	%f4,	%f26
	orn	%o5,	%l0,	%l1
	fmul8x16	%f4,	%f2,	%f16
	umul	%l5,	%o2,	%g6
	movge	%icc,	%i5,	%o3
	subcc	%o4,	%g5,	%g2
	edge32n	%l4,	%g1,	%o7
	movg	%xcc,	%l6,	%i6
	addccc	%l2,	%i0,	%o1
	srax	%g4,	%o0,	%i7
	umulcc	%i2,	0x0713,	%i1
	or	%i4,	0x1661,	%g7
	fpmerge	%f14,	%f7,	%f20
	movleu	%xcc,	%o6,	%i3
	movg	%xcc,	%l3,	%o5
	andcc	%l0,	%g3,	%l1
	movre	%o2,	0x3E6,	%g6
	fcmpne32	%f18,	%f6,	%i5
	fpadd16s	%f2,	%f28,	%f27
	fpsub32s	%f14,	%f9,	%f7
	ldsh	[%l7 + 0x6C],	%l5
	restore %o4, 0x16AA, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f29,	%f27
	fmul8x16au	%f22,	%f20,	%f8
	edge32ln	%g2,	%o3,	%g1
	array16	%l4,	%l6,	%i6
	movneg	%icc,	%o7,	%l2
	alignaddrl	%o1,	%g4,	%o0
	fnegd	%f6,	%f2
	ldsw	[%l7 + 0x6C],	%i0
	lduh	[%l7 + 0x34],	%i7
	stx	%i1,	[%l7 + 0x30]
	umulcc	%i4,	0x1835,	%i2
	sir	0x012F
	addccc	%o6,	0x032A,	%g7
	and	%l3,	0x0D67,	%o5
	edge8l	%i3,	%l0,	%g3
	movrlez	%l1,	0x26D,	%g6
	std	%f28,	[%l7 + 0x68]
	popc	%o2,	%i5
	move	%icc,	%o4,	%g5
	fcmpgt32	%f22,	%f14,	%g2
	movn	%icc,	%o3,	%g1
	xnorcc	%l5,	%l6,	%l4
	ldsw	[%l7 + 0x20],	%i6
	movrgz	%o7,	%o1,	%g4
	addccc	%l2,	0x1075,	%o0
	fmovdleu	%icc,	%f30,	%f8
	subccc	%i7,	%i0,	%i4
	edge32ln	%i2,	%i1,	%o6
	movcs	%icc,	%l3,	%g7
	ldsh	[%l7 + 0x74],	%i3
	ldub	[%l7 + 0x62],	%o5
	xor	%g3,	%l0,	%l1
	move	%xcc,	%o2,	%g6
	addc	%i5,	0x14FF,	%g5
	fmovdge	%xcc,	%f10,	%f10
	ld	[%l7 + 0x54],	%f23
	edge8	%g2,	%o4,	%o3
	alignaddr	%g1,	%l5,	%l4
	movgu	%xcc,	%i6,	%l6
	fcmpgt16	%f6,	%f30,	%o1
	andcc	%g4,	%l2,	%o0
	fmovdge	%icc,	%f15,	%f21
	addc	%o7,	0x140C,	%i0
	umulcc	%i4,	%i2,	%i7
	ldsb	[%l7 + 0x66],	%i1
	orcc	%l3,	%g7,	%o6
	edge8ln	%i3,	%o5,	%g3
	udivx	%l0,	0x1016,	%l1
	edge16l	%g6,	%i5,	%o2
	mulscc	%g5,	0x196A,	%g2
	sub	%o4,	%g1,	%o3
	movvs	%icc,	%l4,	%i6
	fxnors	%f17,	%f28,	%f6
	stx	%l5,	[%l7 + 0x18]
	sll	%o1,	0x0D,	%g4
	andncc	%l2,	%l6,	%o7
	srlx	%o0,	0x07,	%i0
	sdivx	%i2,	0x13D1,	%i7
	fmovsle	%icc,	%f7,	%f1
	umul	%i1,	%l3,	%g7
	subcc	%i4,	%i3,	%o5
	sdivx	%g3,	0x05DD,	%l0
	fpsub32s	%f14,	%f6,	%f13
	fmul8x16	%f28,	%f6,	%f8
	sth	%l1,	[%l7 + 0x66]
	sra	%o6,	0x1A,	%g6
	fmul8x16au	%f13,	%f5,	%f6
	subccc	%o2,	%i5,	%g2
	sra	%g5,	%g1,	%o4
	edge32l	%l4,	%i6,	%o3
	fnot2s	%f6,	%f17
	mulx	%l5,	%o1,	%g4
	movg	%xcc,	%l6,	%l2
	edge32ln	%o0,	%i0,	%i2
	move	%icc,	%o7,	%i1
	orn	%l3,	0x091D,	%i7
	subccc	%i4,	%g7,	%o5
	movgu	%xcc,	%i3,	%g3
	movrne	%l1,	%l0,	%g6
	move	%xcc,	%o2,	%i5
	edge32	%g2,	%o6,	%g5
	array16	%o4,	%g1,	%l4
	sir	0x14D8
	array8	%o3,	%i6,	%o1
	fpsub32s	%f25,	%f23,	%f15
	fone	%f20
	mova	%xcc,	%l5,	%g4
	sll	%l6,	%o0,	%l2
	movrlez	%i0,	%i2,	%o7
	andn	%l3,	0x1D17,	%i7
	edge16n	%i1,	%i4,	%o5
	umulcc	%i3,	0x0233,	%g7
	fmovscs	%xcc,	%f28,	%f3
	movcs	%icc,	%g3,	%l1
	and	%g6,	0x0C91,	%o2
	ldsb	[%l7 + 0x1B],	%i5
	sethi	0x0645,	%l0
	srlx	%g2,	%o6,	%g5
	ldd	[%l7 + 0x58],	%g0
	movvs	%xcc,	%o4,	%o3
	movrgez	%l4,	0x03C,	%o1
	movvs	%icc,	%l5,	%i6
	fpackfix	%f6,	%f7
	edge8ln	%g4,	%o0,	%l6
	andn	%l2,	0x0F52,	%i0
	sdivx	%i2,	0x1DF4,	%l3
	addccc	%o7,	0x1B56,	%i1
	subccc	%i7,	%o5,	%i4
	movgu	%icc,	%i3,	%g3
	save %g7, %g6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o2,	%i5
	orncc	%g2,	0x1B3C,	%o6
	movge	%xcc,	%l0,	%g5
	ldx	[%l7 + 0x68],	%o4
	edge16ln	%o3,	%l4,	%g1
	stw	%l5,	[%l7 + 0x28]
	edge8l	%o1,	%i6,	%g4
	nop
	set	0x72, %g5
	lduh	[%l7 + %g5],	%l6
	andcc	%l2,	0x0D5C,	%i0
	umulcc	%o0,	0x0298,	%i2
	fmul8x16al	%f28,	%f30,	%f22
	pdist	%f22,	%f14,	%f24
	smulcc	%l3,	%o7,	%i1
	edge32n	%i7,	%i4,	%o5
	movneg	%icc,	%g3,	%g7
	std	%f24,	[%l7 + 0x70]
	fnegd	%f24,	%f0
	umul	%g6,	%l1,	%i3
	fnot2	%f12,	%f0
	umulcc	%i5,	%g2,	%o2
	fmovse	%xcc,	%f16,	%f11
	fnand	%f24,	%f8,	%f16
	ldsw	[%l7 + 0x48],	%l0
	ldsb	[%l7 + 0x6C],	%g5
	bshuffle	%f0,	%f10,	%f24
	fpack16	%f6,	%f11
	fmovse	%icc,	%f30,	%f3
	sethi	0x16F6,	%o6
	ldsw	[%l7 + 0x34],	%o4
	edge8	%l4,	%o3,	%g1
	srl	%o1,	%i6,	%l5
	movleu	%icc,	%l6,	%g4
	sethi	0x19DD,	%l2
	nop
	set	0x08, %o2
	lduh	[%l7 + %o2],	%o0
	sdivx	%i2,	0x0EA4,	%l3
	ldx	[%l7 + 0x60],	%i0
	ldd	[%l7 + 0x10],	%f20
	addccc	%i1,	0x016B,	%i7
	or	%o7,	0x10E2,	%i4
	movle	%icc,	%o5,	%g7
	fsrc2	%f20,	%f18
	sir	0x092F
	sdivx	%g3,	0x1B93,	%g6
	udiv	%l1,	0x0E6E,	%i3
	fmul8x16	%f29,	%f14,	%f10
	movgu	%icc,	%i5,	%o2
	edge32n	%g2,	%l0,	%g5
	lduh	[%l7 + 0x68],	%o4
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%f20
	edge8ln	%l4,	%o3,	%o6
	edge8ln	%o1,	%g1,	%l5
	pdist	%f2,	%f28,	%f24
	lduh	[%l7 + 0x4E],	%i6
	ldsh	[%l7 + 0x2A],	%g4
	ldsh	[%l7 + 0x68],	%l6
	srl	%l2,	0x00,	%i2
	fnot1s	%f17,	%f13
	lduw	[%l7 + 0x28],	%l3
	movg	%xcc,	%o0,	%i1
	ldub	[%l7 + 0x0F],	%i0
	fcmpgt32	%f6,	%f30,	%i7
	fmovsg	%icc,	%f1,	%f6
	andncc	%o7,	%o5,	%i4
	movne	%icc,	%g7,	%g6
	subc	%l1,	0x076B,	%g3
	fmul8sux16	%f4,	%f20,	%f26
	movl	%xcc,	%i5,	%i3
	bshuffle	%f0,	%f12,	%f26
	st	%f4,	[%l7 + 0x30]
	faligndata	%f0,	%f4,	%f30
	smulcc	%o2,	%l0,	%g5
	fmovrdgez	%g2,	%f20,	%f10
	stb	%l4,	[%l7 + 0x66]
	orn	%o3,	%o6,	%o4
	edge16l	%g1,	%l5,	%i6
	fmovrdgz	%o1,	%f18,	%f8
	sth	%l6,	[%l7 + 0x3A]
	fmovrsne	%l2,	%f12,	%f11
	fmovdcc	%xcc,	%f28,	%f18
	movleu	%icc,	%i2,	%l3
	movneg	%icc,	%o0,	%g4
	fpsub16	%f8,	%f2,	%f10
	andncc	%i1,	%i7,	%i0
	xor	%o5,	%o7,	%g7
	or	%i4,	0x0E00,	%l1
	ldd	[%l7 + 0x40],	%f6
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	movre	%o2,	%l0,	%g5
	stw	%g2,	[%l7 + 0x64]
	popc	0x0DD8,	%l4
	umulcc	%i3,	0x19DB,	%o6
	ldsb	[%l7 + 0x79],	%o3
	andn	%o4,	%g1,	%l5
	fnot2	%f0,	%f18
	edge32	%o1,	%l6,	%i6
	movn	%xcc,	%l2,	%i2
	and	%l3,	0x1180,	%o0
	orn	%i1,	0x1C31,	%g4
	andncc	%i7,	%i0,	%o7
	fxors	%f29,	%f6,	%f0
	fmovsvc	%icc,	%f18,	%f19
	ld	[%l7 + 0x10],	%f20
	xnor	%o5,	0x07B1,	%g7
	srax	%l1,	0x18,	%i4
	srlx	%g6,	%g3,	%i5
	alignaddr	%l0,	%o2,	%g5
	edge8	%l4,	%g2,	%i3
	movle	%xcc,	%o3,	%o6
	lduw	[%l7 + 0x48],	%g1
	smulcc	%o4,	0x1A34,	%o1
	fnor	%f16,	%f10,	%f2
	fmovdvc	%icc,	%f1,	%f15
	movre	%l5,	0x015,	%i6
	stw	%l2,	[%l7 + 0x18]
	nop
	set	0x0B, %i1
	ldsb	[%l7 + %i1],	%i2
	edge8	%l3,	%l6,	%o0
	stb	%g4,	[%l7 + 0x6A]
	subccc	%i1,	0x0915,	%i7
	fmovsleu	%xcc,	%f18,	%f19
	movg	%xcc,	%o7,	%i0
	udiv	%o5,	0x15AB,	%g7
	ldx	[%l7 + 0x58],	%i4
	movne	%xcc,	%l1,	%g3
	movgu	%xcc,	%g6,	%i5
	edge16n	%l0,	%g5,	%l4
	fcmpgt32	%f22,	%f28,	%g2
	restore %i3, %o2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o3,	%o4,	%g1
	fmovdgu	%icc,	%f13,	%f11
	array8	%l5,	%i6,	%l2
	ldsw	[%l7 + 0x28],	%o1
	edge16n	%l3,	%i2,	%l6
	umul	%g4,	0x01B2,	%o0
	fand	%f4,	%f14,	%f16
	fnands	%f4,	%f31,	%f6
	xorcc	%i1,	0x1A77,	%i7
	addc	%o7,	0x05F1,	%i0
	stb	%o5,	[%l7 + 0x2D]
	array16	%g7,	%i4,	%l1
	sdivcc	%g6,	0x07FB,	%i5
	udivcc	%g3,	0x10D1,	%g5
	edge8ln	%l4,	%g2,	%l0
	stx	%i3,	[%l7 + 0x08]
	fandnot1s	%f27,	%f15,	%f1
	stb	%o2,	[%l7 + 0x63]
	edge8n	%o6,	%o4,	%g1
	movvc	%xcc,	%l5,	%o3
	movcs	%icc,	%i6,	%l2
	orncc	%l3,	0x158E,	%o1
	movvs	%icc,	%l6,	%g4
	addccc	%i2,	%o0,	%i7
	srlx	%i1,	%o7,	%o5
	sir	0x1CA2
	fcmple32	%f30,	%f26,	%i0
	andncc	%g7,	%l1,	%g6
	xorcc	%i4,	%i5,	%g5
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	restore %g3, %i3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l0,	0x0AAD,	%o4
	ld	[%l7 + 0x54],	%f30
	edge8ln	%g1,	%l5,	%o6
	umulcc	%o3,	0x10DD,	%i6
	movn	%xcc,	%l2,	%o1
	fmovrse	%l3,	%f23,	%f7
	xnorcc	%g4,	0x06FA,	%i2
	movvc	%xcc,	%l6,	%o0
	nop
	set	0x08, %i4
	lduh	[%l7 + %i4],	%i7
	lduh	[%l7 + 0x74],	%o7
	std	%f22,	[%l7 + 0x30]
	ldsb	[%l7 + 0x40],	%i1
	stb	%i0,	[%l7 + 0x7D]
	st	%f23,	[%l7 + 0x3C]
	array16	%o5,	%g7,	%l1
	orcc	%g6,	0x15C5,	%i5
	fxor	%f6,	%f6,	%f4
	popc	%i4,	%g5
	edge16l	%g2,	%l4,	%i3
	fmovrslz	%o2,	%f1,	%f18
	save %g3, %o4, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x49],	%l5
	movvc	%xcc,	%l0,	%o6
	sdiv	%i6,	0x1EA3,	%o3
	srl	%o1,	%l3,	%g4
	fmovdneg	%xcc,	%f24,	%f22
	sth	%l2,	[%l7 + 0x4C]
	ldx	[%l7 + 0x60],	%i2
	fmovdcs	%xcc,	%f23,	%f19
	subc	%o0,	%i7,	%l6
	st	%f31,	[%l7 + 0x70]
	fcmpne16	%f6,	%f16,	%i1
	srl	%i0,	0x14,	%o7
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	fpadd16s	%f3,	%f22,	%f25
	ldsw	[%l7 + 0x28],	%g6
	xor	%l1,	0x1612,	%i5
	fnegs	%f0,	%f9
	srlx	%i4,	0x09,	%g2
	movge	%xcc,	%g5,	%l4
	udiv	%o2,	0x14F9,	%i3
	xnor	%o4,	%g1,	%g3
	ldsh	[%l7 + 0x1E],	%l0
	movgu	%icc,	%o6,	%i6
	subccc	%l5,	%o1,	%l3
	andncc	%o3,	%g4,	%i2
	sethi	0x0C7E,	%o0
	movrgz	%i7,	0x373,	%l2
	fmovrslez	%l6,	%f26,	%f14
	orn	%i0,	%o7,	%o5
	subccc	%i1,	%g7,	%g6
	orn	%i5,	0x1DC5,	%i4
	andcc	%l1,	%g5,	%g2
	mova	%xcc,	%o2,	%l4
	ldub	[%l7 + 0x4B],	%o4
	fmovrsne	%g1,	%f24,	%f18
	array16	%i3,	%l0,	%g3
	alignaddr	%o6,	%i6,	%o1
	fpadd32	%f22,	%f14,	%f28
	sra	%l5,	%o3,	%l3
	xor	%i2,	%g4,	%i7
	mulx	%o0,	0x05DA,	%l2
	subccc	%l6,	%o7,	%i0
	sll	%o5,	%g7,	%g6
	movcc	%icc,	%i5,	%i4
	fmovrslez	%i1,	%f31,	%f15
	edge8ln	%g5,	%l1,	%o2
	movrgz	%g2,	%l4,	%o4
	fnot2s	%f6,	%f27
	movneg	%xcc,	%g1,	%i3
	fmovscc	%icc,	%f29,	%f25
	smulcc	%g3,	%o6,	%l0
	xnorcc	%o1,	%i6,	%o3
	movleu	%xcc,	%l3,	%i2
	sdiv	%l5,	0x0987,	%i7
	sra	%o0,	%l2,	%g4
	andn	%l6,	%o7,	%i0
	andncc	%o5,	%g7,	%i5
	fmovdge	%xcc,	%f20,	%f7
	edge8l	%i4,	%i1,	%g6
	fzero	%f20
	movle	%icc,	%g5,	%o2
	edge16ln	%g2,	%l4,	%o4
	movcc	%xcc,	%l1,	%g1
	fmuld8sux16	%f10,	%f16,	%f16
	mova	%xcc,	%g3,	%o6
	fabss	%f15,	%f23
	movl	%xcc,	%i3,	%o1
	movn	%icc,	%l0,	%i6
	xnorcc	%o3,	%l3,	%l5
	movg	%icc,	%i7,	%o0
	movge	%icc,	%l2,	%g4
	edge8l	%l6,	%i2,	%i0
	edge8ln	%o7,	%g7,	%i5
	restore %o5, %i1, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i4,	%o2,	%g2
	popc	0x0C2C,	%l4
	ldx	[%l7 + 0x18],	%g5
	fornot1s	%f12,	%f5,	%f19
	movvs	%xcc,	%o4,	%l1
	fmovsgu	%icc,	%f30,	%f23
	movre	%g3,	%g1,	%i3
	edge32	%o1,	%o6,	%i6
	edge16n	%o3,	%l3,	%l0
	array32	%i7,	%o0,	%l5
	fpadd32	%f2,	%f4,	%f30
	fandnot1s	%f2,	%f13,	%f29
	movcc	%xcc,	%g4,	%l6
	ldsb	[%l7 + 0x0F],	%l2
	smul	%i0,	%i2,	%g7
	array32	%o7,	%i5,	%i1
	fmovrse	%o5,	%f3,	%f26
	mova	%icc,	%i4,	%g6
	udivx	%o2,	0x0D4A,	%g2
	subccc	%g5,	0x064F,	%l4
	subccc	%o4,	%l1,	%g3
	fexpand	%f31,	%f8
	ldsw	[%l7 + 0x14],	%i3
	umulcc	%o1,	%g1,	%o6
	movre	%i6,	%l3,	%o3
	st	%f22,	[%l7 + 0x40]
	movrlez	%i7,	%l0,	%o0
	subc	%g4,	0x1DCF,	%l6
	movcs	%icc,	%l5,	%l2
	movvc	%xcc,	%i2,	%i0
	sra	%o7,	0x14,	%g7
	fcmpes	%fcc0,	%f25,	%f3
	addccc	%i5,	%i1,	%i4
	fmovdvs	%icc,	%f15,	%f27
	fmuld8ulx16	%f18,	%f3,	%f14
	fcmple16	%f6,	%f20,	%o5
	fmovdn	%xcc,	%f11,	%f6
	xorcc	%g6,	0x12BB,	%g2
	fmovrde	%o2,	%f26,	%f16
	smul	%l4,	%g5,	%o4
	array16	%g3,	%i3,	%l1
	umul	%g1,	%o1,	%i6
	stx	%l3,	[%l7 + 0x48]
	edge8ln	%o6,	%i7,	%o3
	movrgz	%l0,	0x336,	%g4
	subc	%o0,	%l5,	%l2
	movcc	%icc,	%i2,	%i0
	movcc	%xcc,	%l6,	%o7
	fmul8sux16	%f24,	%f24,	%f22
	fmul8ulx16	%f20,	%f28,	%f6
	fors	%f3,	%f22,	%f24
	and	%g7,	0x1157,	%i1
	fmul8sux16	%f4,	%f22,	%f12
	fpsub32	%f8,	%f30,	%f26
	srax	%i5,	0x09,	%o5
	fcmple32	%f16,	%f18,	%g6
	and	%i4,	0x0B15,	%o2
	movneg	%xcc,	%g2,	%g5
	fmul8sux16	%f22,	%f14,	%f30
	fmovdvc	%xcc,	%f26,	%f28
	sdivcc	%l4,	0x0D04,	%g3
	save %i3, %o4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o1,	%g1
	movrgez	%l3,	%o6,	%i7
	fones	%f18
	ldd	[%l7 + 0x50],	%f22
	fpackfix	%f8,	%f27
	lduh	[%l7 + 0x30],	%o3
	ldsb	[%l7 + 0x3B],	%i6
	movvc	%icc,	%l0,	%g4
	sir	0x04B3
	add	%o0,	0x118A,	%l5
	addcc	%l2,	%i0,	%l6
	sllx	%o7,	0x03,	%i2
	ldd	[%l7 + 0x08],	%f4
	edge16n	%i1,	%g7,	%o5
	edge16ln	%g6,	%i5,	%i4
	movre	%g2,	%g5,	%l4
	udivcc	%g3,	0x10B7,	%o2
	xor	%o4,	0x01C3,	%l1
	fmovrdgz	%i3,	%f6,	%f6
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	ld	[%l7 + 0x14],	%f13
	fornot2s	%f29,	%f14,	%f1
	movpos	%xcc,	%l3,	%i7
	fmovsneg	%icc,	%f18,	%f17
	andn	%o6,	0x14CB,	%i6
	movneg	%icc,	%o3,	%l0
	edge16	%g4,	%o0,	%l5
	movvs	%xcc,	%l2,	%l6
	save %i0, %i2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f12,	[%l7 + 0x18]
	srl	%g7,	%o7,	%g6
	addc	%i5,	%o5,	%g2
	edge16ln	%i4,	%g5,	%l4
	movneg	%xcc,	%o2,	%g3
	movpos	%icc,	%l1,	%i3
	fcmpeq32	%f24,	%f10,	%o4
	smulcc	%g1,	%o1,	%i7
	edge16	%l3,	%i6,	%o6
	smul	%o3,	0x1077,	%l0
	movleu	%icc,	%o0,	%g4
	fmovdl	%xcc,	%f19,	%f25
	subccc	%l5,	%l2,	%i0
	edge8	%l6,	%i1,	%g7
	sth	%i2,	[%l7 + 0x48]
	movcs	%xcc,	%g6,	%o7
	fnot2	%f20,	%f2
	ldsh	[%l7 + 0x74],	%i5
	fpsub16s	%f30,	%f2,	%f23
	ldsb	[%l7 + 0x3C],	%g2
	edge8l	%i4,	%o5,	%g5
	sdiv	%o2,	0x028E,	%g3
	edge16n	%l4,	%l1,	%i3
	sir	0x10C3
	ldd	[%l7 + 0x20],	%o4
	movvs	%xcc,	%o1,	%i7
	stx	%g1,	[%l7 + 0x60]
	fnegd	%f24,	%f0
	fornot1s	%f30,	%f8,	%f23
	edge32	%i6,	%l3,	%o6
	sdivx	%l0,	0x0BA5,	%o0
	ldd	[%l7 + 0x40],	%g4
	addc	%o3,	%l5,	%l2
	alignaddrl	%l6,	%i0,	%i1
	movleu	%xcc,	%i2,	%g6
	array8	%g7,	%i5,	%g2
	sethi	0x0A5C,	%i4
	fcmple32	%f14,	%f20,	%o7
	udivcc	%g5,	0x0958,	%o5
	fnot1	%f24,	%f20
	addccc	%o2,	0x0025,	%l4
	subccc	%g3,	0x05DF,	%l1
	ld	[%l7 + 0x50],	%f26
	alignaddrl	%i3,	%o1,	%o4
	stx	%g1,	[%l7 + 0x78]
	fmovde	%xcc,	%f12,	%f10
	sdivx	%i6,	0x084F,	%l3
	subccc	%o6,	0x116F,	%i7
	fnands	%f25,	%f0,	%f24
	xor	%o0,	0x01A8,	%g4
	fpsub16s	%f21,	%f24,	%f6
	sethi	0x0ECC,	%o3
	udivx	%l5,	0x1CD1,	%l0
	lduw	[%l7 + 0x54],	%l2
	srl	%l6,	%i0,	%i1
	nop
	set	0x1C, %g1
	stw	%i2,	[%l7 + %g1]
	andcc	%g6,	0x018E,	%g7
	ldub	[%l7 + 0x33],	%g2
	edge32n	%i5,	%o7,	%g5
	edge16	%o5,	%i4,	%o2
	alignaddrl	%g3,	%l4,	%i3
	st	%f28,	[%l7 + 0x60]
	ldub	[%l7 + 0x65],	%o1
	ld	[%l7 + 0x60],	%f9
	edge32l	%l1,	%g1,	%i6
	fmovsn	%icc,	%f8,	%f5
	fpackfix	%f16,	%f9
	array8	%l3,	%o6,	%i7
	fornot2	%f30,	%f16,	%f4
	fmovdcc	%xcc,	%f24,	%f18
	edge8	%o4,	%g4,	%o3
	fpsub16s	%f24,	%f30,	%f26
	movcc	%icc,	%l5,	%l0
	edge8	%o0,	%l6,	%i0
	fmovdle	%icc,	%f5,	%f17
	sub	%l2,	0x0659,	%i1
	fands	%f22,	%f25,	%f9
	addcc	%g6,	0x1786,	%i2
	xnorcc	%g2,	%i5,	%o7
	movneg	%icc,	%g7,	%g5
	sdivx	%i4,	0x0C13,	%o2
	movl	%icc,	%o5,	%g3
	st	%f29,	[%l7 + 0x2C]
	mova	%icc,	%i3,	%l4
	fpsub16s	%f20,	%f9,	%f5
	xnorcc	%o1,	0x1E06,	%g1
	fpsub32	%f8,	%f4,	%f6
	smul	%i6,	0x0C81,	%l3
	nop
	set	0x48, %l4
	stx	%o6,	[%l7 + %l4]
	array8	%l1,	%o4,	%i7
	srl	%o3,	%l5,	%l0
	fxnor	%f26,	%f10,	%f16
	fones	%f9
	udivcc	%o0,	0x0079,	%l6
	xorcc	%i0,	%g4,	%l2
	for	%f16,	%f20,	%f4
	mova	%icc,	%g6,	%i2
	orn	%i1,	0x043B,	%i5
	subcc	%o7,	%g7,	%g5
	movvc	%icc,	%g2,	%i4
	add	%o2,	%o5,	%i3
	movn	%icc,	%g3,	%o1
	movneg	%xcc,	%l4,	%i6
	mulx	%g1,	%l3,	%o6
	smul	%l1,	%o4,	%o3
	srl	%l5,	%i7,	%l0
	orncc	%l6,	%i0,	%o0
	subc	%l2,	0x0C23,	%g4
	fmovrdlez	%g6,	%f26,	%f10
	sdiv	%i1,	0x1589,	%i5
	or	%i2,	%o7,	%g5
	fmovrde	%g2,	%f0,	%f20
	movrlez	%g7,	%o2,	%i4
	srl	%i3,	%o5,	%o1
	sdivx	%l4,	0x01E3,	%i6
	srlx	%g3,	0x1C,	%g1
	movleu	%xcc,	%o6,	%l1
	andcc	%o4,	0x1FEE,	%l3
	edge32n	%l5,	%o3,	%l0
	movneg	%xcc,	%l6,	%i0
	sub	%o0,	0x04D7,	%l2
	movg	%xcc,	%g4,	%i7
	umul	%i1,	0x0149,	%g6
	movrne	%i5,	%i2,	%g5
	sub	%g2,	0x1A9D,	%g7
	st	%f19,	[%l7 + 0x1C]
	move	%xcc,	%o2,	%i4
	movrgz	%o7,	0x262,	%o5
	restore %o1, %i3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l4,	0x1199,	%g3
	ldd	[%l7 + 0x50],	%g0
	sethi	0x10F0,	%o6
	stw	%o4,	[%l7 + 0x48]
	xnor	%l1,	%l5,	%o3
	fcmple32	%f26,	%f4,	%l0
	udiv	%l6,	0x1758,	%l3
	st	%f11,	[%l7 + 0x50]
	fmul8x16al	%f25,	%f12,	%f4
	movle	%icc,	%o0,	%i0
	sethi	0x1D66,	%g4
	sth	%l2,	[%l7 + 0x3A]
	movre	%i1,	%g6,	%i7
	ldsb	[%l7 + 0x54],	%i5
	alignaddrl	%i2,	%g5,	%g7
	fmovrsgz	%o2,	%f1,	%f25
	fpsub16	%f20,	%f30,	%f18
	fands	%f6,	%f11,	%f4
	lduw	[%l7 + 0x28],	%i4
	fmovsa	%xcc,	%f4,	%f18
	array16	%g2,	%o7,	%o5
	save %i3, 0x08D0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%l4,	%g3
	umulcc	%i6,	0x0308,	%o6
	subc	%g1,	%o4,	%l5
	ldub	[%l7 + 0x20],	%l1
	pdist	%f28,	%f12,	%f24
	fnot1	%f24,	%f22
	orn	%l0,	%o3,	%l6
	srlx	%l3,	0x0A,	%o0
	fpack16	%f8,	%f23
	xnor	%g4,	0x0401,	%i0
	movcc	%icc,	%i1,	%l2
	edge32n	%i7,	%i5,	%i2
	edge32l	%g6,	%g5,	%o2
	fxnor	%f12,	%f20,	%f20
	ldub	[%l7 + 0x26],	%i4
	add	%g2,	0x19F0,	%o7
	stw	%o5,	[%l7 + 0x20]
	fpsub32	%f20,	%f30,	%f10
	movrlz	%i3,	%o1,	%l4
	orncc	%g7,	0x04BE,	%g3
	add	%i6,	%g1,	%o4
	movneg	%icc,	%o6,	%l5
	array16	%l1,	%l0,	%o3
	edge32ln	%l3,	%o0,	%g4
	movn	%icc,	%l6,	%i1
	fmovdvc	%xcc,	%f18,	%f28
	fands	%f6,	%f4,	%f30
	edge8ln	%i0,	%i7,	%i5
	array16	%i2,	%g6,	%g5
	mulscc	%o2,	0x00B2,	%i4
	for	%f22,	%f20,	%f22
	edge8l	%l2,	%g2,	%o5
	fexpand	%f19,	%f12
	udivx	%o7,	0x095C,	%i3
	fcmpne32	%f0,	%f30,	%o1
	ldd	[%l7 + 0x60],	%g6
	fmovdgu	%xcc,	%f16,	%f0
	sir	0x0B5A
	array16	%g3,	%l4,	%g1
	sra	%o4,	0x19,	%o6
	fand	%f16,	%f14,	%f10
	fpmerge	%f31,	%f23,	%f0
	movg	%icc,	%i6,	%l5
	movge	%xcc,	%l0,	%l1
	edge16ln	%o3,	%o0,	%g4
	faligndata	%f28,	%f10,	%f0
	movvc	%xcc,	%l6,	%i1
	st	%f30,	[%l7 + 0x2C]
	sdiv	%i0,	0x183C,	%l3
	fmul8x16	%f16,	%f26,	%f0
	mova	%xcc,	%i5,	%i7
	st	%f17,	[%l7 + 0x54]
	fandnot1s	%f9,	%f0,	%f23
	sllx	%i2,	%g6,	%g5
	or	%i4,	0x1E5A,	%o2
	movrgez	%g2,	0x1A9,	%l2
	movrne	%o7,	%o5,	%o1
	smulcc	%i3,	%g7,	%l4
	sllx	%g1,	0x09,	%g3
	fcmpes	%fcc3,	%f31,	%f25
	fxnor	%f2,	%f18,	%f22
	movcc	%xcc,	%o4,	%o6
	umulcc	%l5,	%i6,	%l1
	fsrc2	%f24,	%f20
	stx	%o3,	[%l7 + 0x10]
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%f6
	umulcc	%l0,	%g4,	%o0
	edge16ln	%i1,	%l6,	%i0
	fmovrdlez	%l3,	%f18,	%f12
	ld	[%l7 + 0x10],	%f2
	fmovrdgez	%i7,	%f20,	%f16
	move	%icc,	%i5,	%i2
	movvc	%xcc,	%g6,	%i4
	or	%g5,	0x08E7,	%o2
	lduh	[%l7 + 0x6C],	%l2
	edge16ln	%o7,	%o5,	%o1
	movrlz	%g2,	0x156,	%i3
	srl	%l4,	0x12,	%g1
	fcmple32	%f4,	%f26,	%g7
	movneg	%xcc,	%o4,	%o6
	movgu	%xcc,	%l5,	%g3
	fmovdpos	%icc,	%f16,	%f7
	mulx	%l1,	0x1782,	%o3
	orn	%l0,	%g4,	%o0
	fmovrdlez	%i1,	%f0,	%f0
	subc	%i6,	%i0,	%l6
	edge16ln	%l3,	%i5,	%i2
	addccc	%g6,	0x0981,	%i4
	ldsh	[%l7 + 0x14],	%g5
	movne	%icc,	%i7,	%o2
	ldsb	[%l7 + 0x1D],	%l2
	st	%f18,	[%l7 + 0x20]
	xorcc	%o5,	%o1,	%o7
	movl	%xcc,	%i3,	%g2
	subcc	%g1,	0x048E,	%g7
	movleu	%icc,	%o4,	%o6
	andncc	%l5,	%g3,	%l4
	save %o3, %l0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f11,	[%l7 + 0x30]
	fnot2	%f12,	%f20
	edge8l	%l1,	%o0,	%i6
	sth	%i1,	[%l7 + 0x68]
	fmovdl	%icc,	%f19,	%f0
	fmovdvc	%icc,	%f21,	%f20
	edge32n	%l6,	%i0,	%i5
	fmovsa	%icc,	%f8,	%f7
	andncc	%l3,	%i2,	%i4
	save %g5, 0x060D, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o2,	[%l7 + 0x10]
	alignaddr	%l2,	%g6,	%o1
	sdiv	%o7,	0x0702,	%o5
	fone	%f30
	xorcc	%i3,	%g2,	%g1
	fmovsge	%xcc,	%f22,	%f31
	addccc	%o4,	%g7,	%o6
	movrlez	%g3,	0x334,	%l5
	fnegd	%f16,	%f18
	fzero	%f18
	edge8l	%o3,	%l4,	%g4
	edge32l	%l1,	%o0,	%l0
	sth	%i6,	[%l7 + 0x3E]
	smulcc	%i1,	0x0549,	%l6
	ldsb	[%l7 + 0x6C],	%i0
	sethi	0x1C3F,	%l3
	fnor	%f0,	%f6,	%f8
	movne	%icc,	%i5,	%i2
	save %g5, %i7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l2,	0x1748,	%g6
	sra	%i4,	0x0E,	%o1
	sll	%o7,	%i3,	%g2
	std	%f18,	[%l7 + 0x58]
	movleu	%icc,	%g1,	%o4
	srlx	%g7,	%o5,	%g3
	fmovrslz	%l5,	%f13,	%f5
	srl	%o6,	%o3,	%g4
	st	%f14,	[%l7 + 0x08]
	srlx	%l1,	%l4,	%l0
	fones	%f30
	fsrc2s	%f5,	%f4
	sethi	0x1FC3,	%o0
	fors	%f13,	%f16,	%f10
	fpack32	%f2,	%f20,	%f28
	edge16l	%i6,	%i1,	%l6
	smulcc	%l3,	%i0,	%i5
	addcc	%g5,	0x1F39,	%i2
	srl	%i7,	0x1B,	%o2
	fcmpeq32	%f6,	%f22,	%l2
	alignaddrl	%i4,	%g6,	%o7
	movcc	%xcc,	%i3,	%g2
	movl	%icc,	%o1,	%g1
	movrgez	%g7,	0x3AF,	%o5
	andn	%g3,	%l5,	%o4
	subcc	%o3,	%o6,	%g4
	movgu	%xcc,	%l4,	%l1
	udivx	%o0,	0x0551,	%i6
	fcmpes	%fcc1,	%f8,	%f1
	movvs	%xcc,	%i1,	%l0
	smulcc	%l3,	%i0,	%i5
	movrlez	%g5,	%l6,	%i7
	fmovs	%f2,	%f19
	lduh	[%l7 + 0x7E],	%i2
	ld	[%l7 + 0x54],	%f5
	sllx	%l2,	0x12,	%o2
	movne	%xcc,	%i4,	%g6
	ldx	[%l7 + 0x38],	%o7
	ldsh	[%l7 + 0x16],	%g2
	ld	[%l7 + 0x1C],	%f2
	udivx	%i3,	0x0748,	%g1
	fnegd	%f26,	%f24
	movrlz	%o1,	0x076,	%o5
	xnor	%g3,	0x089A,	%l5
	fmovrsgz	%o4,	%f4,	%f30
	srl	%o3,	%g7,	%o6
	fcmpeq16	%f8,	%f14,	%l4
	sth	%g4,	[%l7 + 0x18]
	fmovdcc	%xcc,	%f16,	%f5
	movgu	%xcc,	%l1,	%i6
	array8	%o0,	%l0,	%l3
	and	%i0,	0x1FCF,	%i5
	movge	%icc,	%g5,	%i1
	sdivx	%l6,	0x1B80,	%i2
	stx	%i7,	[%l7 + 0x08]
	movge	%icc,	%l2,	%i4
	orn	%o2,	%o7,	%g6
	movleu	%icc,	%g2,	%i3
	ldx	[%l7 + 0x38],	%g1
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	edge32	%l5,	%o4,	%g7
	movg	%xcc,	%o3,	%l4
	movn	%icc,	%g4,	%l1
	fzero	%f26
	mulx	%o6,	%i6,	%l0
	movvs	%xcc,	%l3,	%i0
	srl	%i5,	%g5,	%o0
	st	%f30,	[%l7 + 0x44]
	stb	%i1,	[%l7 + 0x09]
	smulcc	%i2,	%l6,	%l2
	sdivcc	%i7,	0x11AF,	%i4
	edge8n	%o7,	%g6,	%g2
	nop
	set	0x68, %i0
	ldd	[%l7 + %i0],	%f2
	umul	%o2,	0x13BB,	%i3
	movvc	%xcc,	%o5,	%g1
	orn	%g3,	0x167C,	%o1
	ldd	[%l7 + 0x08],	%l4
	sll	%o4,	0x00,	%o3
	edge32	%g7,	%l4,	%l1
	fexpand	%f10,	%f20
	fabsd	%f8,	%f6
	movvc	%icc,	%g4,	%i6
	stx	%l0,	[%l7 + 0x60]
	stb	%o6,	[%l7 + 0x53]
	fone	%f20
	ldsw	[%l7 + 0x08],	%l3
	fmovdvc	%icc,	%f13,	%f2
	movpos	%xcc,	%i0,	%g5
	orcc	%o0,	0x10D9,	%i5
	xnorcc	%i1,	%i2,	%l2
	udiv	%l6,	0x12FA,	%i7
	fmovde	%icc,	%f28,	%f16
	alignaddrl	%i4,	%g6,	%g2
	movvc	%xcc,	%o2,	%o7
	movleu	%xcc,	%o5,	%g1
	subc	%g3,	%o1,	%l5
	lduh	[%l7 + 0x54],	%o4
	mulx	%i3,	%o3,	%g7
	edge16n	%l4,	%l1,	%g4
	stx	%i6,	[%l7 + 0x78]
	movge	%xcc,	%o6,	%l0
	fmovrse	%i0,	%f7,	%f12
	edge32ln	%l3,	%o0,	%g5
	xnorcc	%i5,	%i1,	%l2
	ldx	[%l7 + 0x40],	%l6
	alignaddrl	%i2,	%i7,	%g6
	ldd	[%l7 + 0x78],	%f24
	smulcc	%g2,	%i4,	%o7
	fnand	%f0,	%f6,	%f24
	sth	%o2,	[%l7 + 0x56]
	and	%g1,	%g3,	%o1
	fmovdg	%icc,	%f19,	%f16
	fmovrslez	%l5,	%f9,	%f13
	ldsw	[%l7 + 0x10],	%o4
	movl	%xcc,	%o5,	%o3
	fmovrdlz	%g7,	%f6,	%f14
	addccc	%l4,	%l1,	%i3
	sllx	%i6,	0x10,	%g4
	addc	%l0,	0x0F2C,	%i0
	ldsh	[%l7 + 0x4E],	%l3
	popc	%o6,	%g5
	movpos	%xcc,	%o0,	%i1
	fpmerge	%f25,	%f5,	%f6
	sra	%i5,	0x18,	%l6
	edge8ln	%l2,	%i7,	%g6
	udivx	%g2,	0x1974,	%i4
	ldsw	[%l7 + 0x7C],	%o7
	srlx	%i2,	0x10,	%o2
	andcc	%g3,	0x183D,	%o1
	subcc	%l5,	0x0098,	%g1
	movle	%xcc,	%o4,	%o5
	umulcc	%o3,	%l4,	%l1
	edge32l	%g7,	%i6,	%i3
	sdivcc	%l0,	0x0021,	%g4
	mova	%icc,	%i0,	%o6
	edge16n	%l3,	%o0,	%g5
	edge32l	%i1,	%i5,	%l6
	sllx	%l2,	%i7,	%g6
	srax	%i4,	%g2,	%o7
	smulcc	%i2,	0x1130,	%g3
	andn	%o1,	0x15B9,	%l5
	edge32n	%o2,	%g1,	%o4
	andn	%o5,	%o3,	%l4
	ldsb	[%l7 + 0x38],	%g7
	udivcc	%l1,	0x187D,	%i3
	srl	%l0,	0x0A,	%i6
	edge8ln	%g4,	%o6,	%i0
	faligndata	%f12,	%f14,	%f10
	sll	%o0,	0x03,	%l3
	xnorcc	%i1,	0x1A1F,	%g5
	fcmple16	%f26,	%f6,	%i5
	movre	%l2,	%l6,	%i7
	fcmple32	%f4,	%f24,	%i4
	smulcc	%g2,	%o7,	%g6
	edge16ln	%g3,	%i2,	%o1
	move	%xcc,	%l5,	%g1
	st	%f29,	[%l7 + 0x30]
	xorcc	%o4,	%o5,	%o3
	fmovde	%xcc,	%f16,	%f25
	movcs	%xcc,	%o2,	%g7
	xnorcc	%l1,	%l4,	%i3
	fmovrsne	%l0,	%f16,	%f12
	sll	%i6,	%o6,	%i0
	stb	%o0,	[%l7 + 0x3F]
	ld	[%l7 + 0x0C],	%f24
	fzeros	%f14
	movl	%xcc,	%l3,	%g4
	sdiv	%i1,	0x0E8B,	%i5
	movre	%g5,	0x3FC,	%l2
	mova	%icc,	%l6,	%i7
	fmovrse	%i4,	%f1,	%f27
	sethi	0x1F85,	%o7
	fnor	%f6,	%f2,	%f6
	movrgz	%g2,	0x1A8,	%g3
	edge8	%i2,	%o1,	%l5
	movneg	%icc,	%g6,	%o4
	movvs	%icc,	%o5,	%o3
	std	%f30,	[%l7 + 0x50]
	ldsw	[%l7 + 0x48],	%o2
	fabss	%f10,	%f30
	sth	%g1,	[%l7 + 0x30]
	fcmpeq32	%f4,	%f28,	%l1
	movrlz	%l4,	%g7,	%i3
	popc	%l0,	%o6
	fmul8ulx16	%f10,	%f20,	%f14
	for	%f12,	%f6,	%f28
	ldd	[%l7 + 0x38],	%f2
	udivx	%i6,	0x11C4,	%i0
	movle	%xcc,	%l3,	%g4
	edge16	%o0,	%i1,	%g5
	smul	%i5,	%l6,	%l2
	movcs	%icc,	%i4,	%o7
	sllx	%i7,	0x0B,	%g3
	smulcc	%i2,	%g2,	%l5
	umul	%g6,	%o4,	%o5
	umulcc	%o1,	0x1CC3,	%o2
	movle	%xcc,	%g1,	%o3
	edge16ln	%l1,	%l4,	%i3
	fnot1s	%f14,	%f7
	fpsub32	%f16,	%f28,	%f14
	movrne	%g7,	0x24E,	%l0
	xorcc	%o6,	%i6,	%l3
	lduh	[%l7 + 0x44],	%g4
	edge16ln	%i0,	%o0,	%g5
	movrlez	%i5,	%i1,	%l6
	fsrc1s	%f16,	%f22
	edge32ln	%l2,	%i4,	%i7
	smulcc	%g3,	%i2,	%g2
	ldub	[%l7 + 0x3A],	%o7
	fnegs	%f14,	%f17
	nop
	set	0x2B, %g6
	ldub	[%l7 + %g6],	%g6
	edge16	%l5,	%o5,	%o1
	sdiv	%o2,	0x05F4,	%o4
	addc	%g1,	0x01F4,	%l1
	xor	%l4,	%o3,	%i3
	sra	%g7,	%o6,	%i6
	pdist	%f26,	%f30,	%f16
	xorcc	%l0,	%g4,	%i0
	stb	%l3,	[%l7 + 0x6E]
	fmovrdgez	%g5,	%f28,	%f2
	srax	%o0,	0x1D,	%i1
	fandnot1s	%f18,	%f20,	%f26
	fmovdg	%icc,	%f24,	%f28
	movrlez	%l6,	0x110,	%l2
	edge8	%i5,	%i7,	%g3
	andncc	%i4,	%i2,	%g2
	fzeros	%f13
	movneg	%icc,	%g6,	%l5
	movrgez	%o7,	%o5,	%o1
	sllx	%o2,	0x13,	%g1
	stb	%l1,	[%l7 + 0x7E]
	nop
	set	0x54, %g7
	sth	%l4,	[%l7 + %g7]
	alignaddr	%o3,	%o4,	%i3
	fmul8x16au	%f16,	%f27,	%f16
	stx	%o6,	[%l7 + 0x60]
	orn	%i6,	%l0,	%g4
	alignaddrl	%i0,	%g7,	%g5
	fnegd	%f22,	%f20
	sdivx	%o0,	0x1D02,	%l3
	sll	%i1,	0x0A,	%l2
	edge8	%i5,	%i7,	%l6
	ldx	[%l7 + 0x08],	%i4
	ldsb	[%l7 + 0x7B],	%g3
	fcmple32	%f24,	%f2,	%i2
	alignaddrl	%g6,	%g2,	%l5
	std	%f0,	[%l7 + 0x70]
	fpack32	%f14,	%f28,	%f14
	stx	%o5,	[%l7 + 0x58]
	movrlz	%o7,	%o1,	%g1
	fmovdvc	%xcc,	%f15,	%f25
	movneg	%xcc,	%o2,	%l4
	for	%f24,	%f24,	%f14
	edge16	%o3,	%l1,	%i3
	movrgz	%o6,	0x24D,	%i6
	fpadd32	%f2,	%f12,	%f22
	srl	%o4,	0x18,	%l0
	fcmped	%fcc0,	%f4,	%f18
	fmovsvc	%xcc,	%f18,	%f18
	sll	%g4,	0x09,	%i0
	xnorcc	%g5,	%o0,	%g7
	and	%i1,	%l3,	%i5
	movrlz	%i7,	%l2,	%l6
	movn	%xcc,	%g3,	%i2
	orcc	%g6,	0x1969,	%i4
	add	%g2,	%o5,	%o7
	fandnot2	%f20,	%f20,	%f10
	stw	%l5,	[%l7 + 0x40]
	fcmpne32	%f26,	%f18,	%o1
	xorcc	%g1,	%o2,	%l4
	stb	%o3,	[%l7 + 0x56]
	subccc	%i3,	%l1,	%o6
	ldd	[%l7 + 0x60],	%f24
	array32	%o4,	%i6,	%l0
	fmovrdne	%g4,	%f20,	%f18
	srl	%g5,	%i0,	%o0
	addc	%i1,	0x0C21,	%l3
	edge16n	%i5,	%i7,	%l2
	smul	%l6,	0x1083,	%g3
	srl	%g7,	%g6,	%i4
	srax	%g2,	0x11,	%o5
	edge8l	%i2,	%l5,	%o1
	udiv	%g1,	0x1075,	%o7
	srax	%l4,	%o3,	%i3
	umul	%o2,	%l1,	%o6
	for	%f24,	%f24,	%f10
	sethi	0x1539,	%o4
	array8	%i6,	%g4,	%l0
	restore %i0, 0x1171, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%i1,	%l3
	edge32l	%g5,	%i5,	%i7
	ldx	[%l7 + 0x10],	%l6
	or	%l2,	0x1164,	%g3
	fcmped	%fcc0,	%f0,	%f8
	xnor	%g6,	%i4,	%g2
	mulx	%o5,	0x06A8,	%i2
	orcc	%g7,	%l5,	%o1
	edge32n	%o7,	%g1,	%o3
	sra	%i3,	0x17,	%l4
	mova	%icc,	%l1,	%o2
	stw	%o4,	[%l7 + 0x10]
	edge16l	%i6,	%o6,	%g4
	nop
	set	0x68, %i7
	lduw	[%l7 + %i7],	%l0
	srlx	%i0,	%o0,	%i1
	ldub	[%l7 + 0x34],	%g5
	andncc	%l3,	%i5,	%i7
	edge8l	%l2,	%l6,	%g3
	subccc	%g6,	%g2,	%i4
	addc	%i2,	%g7,	%l5
	fmovdvc	%icc,	%f2,	%f11
	stx	%o1,	[%l7 + 0x70]
	xnorcc	%o7,	0x009F,	%g1
	add	%o3,	0x10F5,	%o5
	stx	%i3,	[%l7 + 0x08]
	movvc	%icc,	%l1,	%o2
	movrlez	%l4,	%i6,	%o4
	srlx	%g4,	%l0,	%i0
	fmovsg	%xcc,	%f6,	%f15
	smul	%o6,	%i1,	%g5
	edge16	%o0,	%l3,	%i7
	edge8	%l2,	%l6,	%i5
	edge8n	%g3,	%g2,	%i4
	addc	%i2,	0x0A6E,	%g7
	array16	%g6,	%o1,	%l5
	fornot2s	%f9,	%f2,	%f15
	movvs	%icc,	%o7,	%g1
	edge32n	%o3,	%o5,	%i3
	fands	%f10,	%f11,	%f31
	mulx	%l1,	0x1427,	%o2
	sllx	%i6,	%o4,	%g4
	or	%l4,	%i0,	%l0
	fmovrdgz	%o6,	%f24,	%f26
	alignaddrl	%g5,	%o0,	%i1
	sllx	%i7,	%l2,	%l3
	fmovdgu	%icc,	%f20,	%f11
	fmovsvs	%xcc,	%f14,	%f29
	mulscc	%l6,	%i5,	%g3
	movcs	%icc,	%i4,	%g2
	andncc	%i2,	%g7,	%o1
	fnegs	%f2,	%f14
	movge	%xcc,	%g6,	%o7
	xnor	%l5,	0x1B19,	%o3
	mulscc	%o5,	0x1313,	%g1
	fmovrsgz	%l1,	%f26,	%f18
	fmovsne	%xcc,	%f23,	%f4
	srl	%i3,	%o2,	%o4
	fmovsg	%xcc,	%f13,	%f31
	smulcc	%i6,	%g4,	%i0
	bshuffle	%f6,	%f0,	%f26
	fnand	%f24,	%f20,	%f4
	fnegd	%f12,	%f30
	umul	%l4,	%l0,	%o6
	fmovde	%xcc,	%f16,	%f0
	fsrc2	%f10,	%f6
	orcc	%o0,	%i1,	%i7
	nop
	set	0x10, %o1
	lduw	[%l7 + %o1],	%l2
	movcs	%xcc,	%g5,	%l3
	fmuld8ulx16	%f31,	%f29,	%f10
	movrlz	%i5,	%g3,	%l6
	fmovde	%icc,	%f23,	%f30
	faligndata	%f30,	%f26,	%f2
	edge8ln	%i4,	%g2,	%i2
	stx	%g7,	[%l7 + 0x20]
	edge32n	%g6,	%o1,	%l5
	fpsub32	%f26,	%f18,	%f6
	bshuffle	%f0,	%f4,	%f18
	fpadd32	%f30,	%f30,	%f16
	array32	%o3,	%o5,	%g1
	fandnot1	%f0,	%f16,	%f4
	movpos	%xcc,	%o7,	%i3
	std	%f28,	[%l7 + 0x58]
	sth	%l1,	[%l7 + 0x62]
	ld	[%l7 + 0x1C],	%f16
	fand	%f10,	%f4,	%f6
	fmovdcc	%icc,	%f23,	%f22
	edge32ln	%o4,	%o2,	%i6
	movvc	%icc,	%g4,	%l4
	edge16l	%i0,	%l0,	%o0
	movn	%xcc,	%i1,	%o6
	fmovsleu	%icc,	%f16,	%f17
	array8	%l2,	%g5,	%i7
	fpackfix	%f28,	%f30
	movvs	%xcc,	%l3,	%i5
	ld	[%l7 + 0x24],	%f29
	sth	%g3,	[%l7 + 0x60]
	edge8ln	%l6,	%i4,	%g2
	array16	%i2,	%g6,	%o1
	nop
	set	0x20, %o5
	stx	%g7,	[%l7 + %o5]
	addcc	%l5,	%o5,	%g1
	movcs	%icc,	%o7,	%o3
	edge16ln	%l1,	%i3,	%o4
	alignaddrl	%o2,	%i6,	%g4
	lduw	[%l7 + 0x14],	%l4
	addccc	%i0,	%l0,	%o0
	ldsw	[%l7 + 0x0C],	%o6
	andn	%l2,	0x0834,	%i1
	nop
	set	0x78, %o4
	stx	%g5,	[%l7 + %o4]
	sethi	0x1C0E,	%l3
	fpadd16s	%f12,	%f15,	%f14
	edge8n	%i5,	%i7,	%g3
	movre	%i4,	0x252,	%g2
	edge16n	%l6,	%g6,	%i2
	stx	%g7,	[%l7 + 0x70]
	addcc	%l5,	%o5,	%o1
	movrgez	%o7,	0x250,	%o3
	fnand	%f20,	%f24,	%f26
	subccc	%l1,	%i3,	%o4
	movvs	%xcc,	%g1,	%i6
	xorcc	%o2,	0x048C,	%l4
	fnors	%f19,	%f8,	%f22
	st	%f11,	[%l7 + 0x14]
	edge8l	%g4,	%i0,	%l0
	movleu	%xcc,	%o6,	%o0
	ldsw	[%l7 + 0x1C],	%i1
	fnot2	%f28,	%f28
	movneg	%xcc,	%g5,	%l2
	movneg	%icc,	%i5,	%i7
	popc	0x0EDE,	%g3
	ldsb	[%l7 + 0x0A],	%l3
	alignaddrl	%i4,	%g2,	%l6
	movrne	%i2,	%g6,	%l5
	nop
	set	0x38, %l0
	sth	%o5,	[%l7 + %l0]
	addcc	%o1,	%o7,	%o3
	save %l1, 0x1162, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i3,	%o4,	%g1
	movrgez	%i6,	%o2,	%l4
	sethi	0x04EE,	%g4
	movle	%icc,	%l0,	%o6
	move	%xcc,	%o0,	%i0
	fandnot2s	%f31,	%f11,	%f2
	xnor	%g5,	0x07E9,	%i1
	ldx	[%l7 + 0x78],	%i5
	alignaddr	%i7,	%l2,	%g3
	fmovsgu	%xcc,	%f25,	%f20
	smulcc	%l3,	%g2,	%l6
	fnand	%f30,	%f28,	%f6
	xorcc	%i2,	%i4,	%l5
	movrlz	%o5,	0x181,	%g6
	edge16l	%o7,	%o1,	%l1
	fornot2	%f16,	%f0,	%f8
	array32	%g7,	%i3,	%o3
	srax	%o4,	0x13,	%i6
	movcc	%xcc,	%o2,	%l4
	movvc	%xcc,	%g1,	%l0
	fpsub32s	%f25,	%f22,	%f4
	edge32	%o6,	%o0,	%g4
	fmovsn	%icc,	%f8,	%f25
	orcc	%i0,	%i1,	%g5
	fornot2s	%f2,	%f19,	%f26
	popc	0x031B,	%i7
	edge16n	%l2,	%g3,	%i5
	lduw	[%l7 + 0x34],	%l3
	movcc	%xcc,	%l6,	%g2
	andn	%i4,	%l5,	%i2
	fnand	%f26,	%f10,	%f6
	fpadd16	%f6,	%f20,	%f10
	umulcc	%g6,	%o7,	%o1
	movrne	%o5,	0x33C,	%l1
	movg	%xcc,	%i3,	%o3
	movrne	%o4,	0x25D,	%i6
	movle	%xcc,	%o2,	%g7
	stb	%l4,	[%l7 + 0x30]
	subcc	%g1,	0x0105,	%l0
	andn	%o0,	%g4,	%i0
	umul	%i1,	%g5,	%o6
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%l2
	edge32ln	%g3,	%i7,	%i5
	orcc	%l3,	0x03CB,	%g2
	fmovdg	%xcc,	%f13,	%f22
	orcc	%i4,	0x1D5D,	%l6
	edge32l	%i2,	%g6,	%o7
	movrgez	%l5,	0x3BC,	%o1
	fmovrde	%l1,	%f18,	%f4
	edge32n	%o5,	%i3,	%o3
	fmovdgu	%xcc,	%f10,	%f23
	movrgez	%o4,	0x0D4,	%i6
	fornot1s	%f18,	%f17,	%f10
	umulcc	%o2,	%l4,	%g7
	fcmpeq32	%f16,	%f20,	%g1
	movgu	%icc,	%l0,	%g4
	movcc	%xcc,	%o0,	%i0
	fmovsle	%xcc,	%f20,	%f2
	edge32ln	%i1,	%g5,	%l2
	fmovrdgz	%o6,	%f24,	%f0
	ldsh	[%l7 + 0x5A],	%i7
	movl	%icc,	%g3,	%i5
	fmovsa	%icc,	%f5,	%f7
	edge32	%l3,	%i4,	%g2
	subcc	%l6,	%g6,	%o7
	edge16ln	%l5,	%i2,	%l1
	movrlz	%o5,	%i3,	%o3
	orn	%o1,	0x1626,	%o4
	std	%f6,	[%l7 + 0x78]
	popc	%o2,	%l4
	sllx	%i6,	0x17,	%g7
	ldsh	[%l7 + 0x52],	%g1
	array32	%l0,	%g4,	%o0
	fmuld8ulx16	%f4,	%f25,	%f4
	movpos	%xcc,	%i0,	%i1
	xor	%g5,	0x1F7F,	%l2
	sdivx	%o6,	0x08FE,	%g3
	fmovsle	%icc,	%f11,	%f8
	movg	%xcc,	%i7,	%l3
	movpos	%xcc,	%i4,	%g2
	movgu	%icc,	%l6,	%g6
	ldd	[%l7 + 0x60],	%f4
	ldd	[%l7 + 0x50],	%i4
	fandnot1s	%f26,	%f25,	%f28
	edge16l	%l5,	%i2,	%l1
	movl	%icc,	%o5,	%i3
	xnor	%o3,	0x013D,	%o1
	srl	%o4,	%o2,	%l4
	sir	0x1303
	mulscc	%o7,	0x006E,	%g7
	std	%f10,	[%l7 + 0x48]
	std	%f14,	[%l7 + 0x08]
	stw	%i6,	[%l7 + 0x74]
	subccc	%g1,	0x1B3F,	%l0
	stb	%o0,	[%l7 + 0x51]
	fmovdn	%xcc,	%f21,	%f15
	and	%g4,	%i1,	%g5
	edge32	%l2,	%o6,	%g3
	addc	%i0,	0x09D8,	%i7
	edge8n	%i4,	%g2,	%l3
	movrne	%l6,	%i5,	%g6
	fmovrde	%i2,	%f28,	%f28
	ldsb	[%l7 + 0x69],	%l1
	ldd	[%l7 + 0x58],	%f0
	fpadd32s	%f7,	%f9,	%f7
	fsrc1s	%f3,	%f25
	ldd	[%l7 + 0x68],	%l4
	ldd	[%l7 + 0x38],	%i2
	sir	0x0B91
	movle	%icc,	%o5,	%o3
	fcmpeq16	%f30,	%f18,	%o1
	subccc	%o4,	0x1BF3,	%l4
	movvs	%xcc,	%o2,	%g7
	ldd	[%l7 + 0x28],	%f22
	movre	%o7,	0x378,	%i6
	edge16ln	%g1,	%l0,	%o0
	mulx	%i1,	0x05FA,	%g4
	movcs	%xcc,	%g5,	%l2
	movrne	%g3,	%o6,	%i7
	edge32n	%i0,	%i4,	%g2
	fnot2	%f2,	%f22
	movrgz	%l3,	0x3F0,	%i5
	fexpand	%f30,	%f4
	edge8l	%l6,	%i2,	%g6
	alignaddrl	%l5,	%l1,	%i3
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	udivcc	%o4,	0x1F64,	%l4
	movg	%xcc,	%o2,	%o1
	mulscc	%g7,	%o7,	%i6
	mulscc	%l0,	0x1260,	%o0
	movrgz	%i1,	%g4,	%g1
	mova	%icc,	%l2,	%g3
	ldsh	[%l7 + 0x14],	%g5
	std	%f24,	[%l7 + 0x78]
	xnorcc	%o6,	0x1EF9,	%i7
	edge32ln	%i4,	%i0,	%g2
	bshuffle	%f2,	%f20,	%f2
	fmovscc	%xcc,	%f17,	%f31
	alignaddrl	%i5,	%l3,	%i2
	fnot2s	%f11,	%f4
	mulscc	%g6,	0x1487,	%l6
	sdivx	%l5,	0x0F55,	%l1
	edge32	%o5,	%i3,	%o4
	ldub	[%l7 + 0x3E],	%l4
	srl	%o3,	0x15,	%o1
	andn	%o2,	%g7,	%i6
	edge32	%o7,	%l0,	%i1
	popc	%g4,	%o0
	sra	%l2,	%g3,	%g5
	srax	%g1,	0x17,	%o6
	umul	%i4,	%i0,	%g2
	nop
	set	0x09, %l1
	ldub	[%l7 + %l1],	%i5
	fmovsle	%xcc,	%f22,	%f12
	fmul8x16	%f10,	%f28,	%f28
	fmovs	%f10,	%f17
	siam	0x4
	orn	%l3,	%i7,	%g6
	ldsb	[%l7 + 0x2A],	%l6
	fxnor	%f26,	%f12,	%f18
	movrgz	%i2,	%l5,	%l1
	smulcc	%o5,	%i3,	%o4
	udiv	%o3,	0x0167,	%l4
	xorcc	%o1,	%g7,	%i6
	ldx	[%l7 + 0x40],	%o2
	restore %o7, %i1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o0,	%l2,	%g3
	movrgz	%l0,	0x100,	%g5
	addc	%g1,	%o6,	%i0
	lduh	[%l7 + 0x4C],	%g2
	udivcc	%i4,	0x0968,	%l3
	edge16n	%i7,	%g6,	%i5
	srax	%l6,	%l5,	%i2
	mulx	%l1,	0x0E29,	%o5
	fandnot2	%f24,	%f22,	%f4
	fmuld8ulx16	%f5,	%f19,	%f14
	fmovrdgez	%o4,	%f20,	%f10
	movrne	%o3,	%i3,	%l4
	fnot1	%f10,	%f12
	fpackfix	%f4,	%f18
	sir	0x1F24
	edge8n	%g7,	%i6,	%o2
	mova	%icc,	%o1,	%i1
	ldsb	[%l7 + 0x0C],	%o7
	ldd	[%l7 + 0x58],	%f20
	addcc	%g4,	%o0,	%l2
	umulcc	%g3,	0x0B79,	%l0
	andn	%g1,	%o6,	%g5
	movn	%xcc,	%i0,	%g2
	movpos	%xcc,	%l3,	%i4
	sir	0x1177
	fabss	%f11,	%f19
	edge32l	%i7,	%i5,	%l6
	fcmpgt16	%f2,	%f26,	%g6
	sra	%i2,	0x07,	%l5
	lduh	[%l7 + 0x1C],	%o5
	fmovdge	%xcc,	%f21,	%f4
	stw	%o4,	[%l7 + 0x30]
	mulx	%l1,	0x0A34,	%i3
	add	%o3,	%l4,	%g7
	movrgez	%i6,	%o1,	%i1
	movre	%o7,	0x0CD,	%g4
	movne	%icc,	%o0,	%l2
	sth	%g3,	[%l7 + 0x2C]
	subc	%o2,	%l0,	%o6
	xnorcc	%g5,	0x011C,	%g1
	add	%g2,	0x1B71,	%l3
	fcmps	%fcc3,	%f21,	%f15
	ldsb	[%l7 + 0x4F],	%i4
	subc	%i0,	0x0AAF,	%i5
	movleu	%xcc,	%i7,	%g6
	movl	%icc,	%l6,	%l5
	fpadd32s	%f24,	%f30,	%f28
	addc	%i2,	0x0ACA,	%o5
	edge16l	%o4,	%l1,	%o3
	addcc	%i3,	%l4,	%g7
	subc	%i6,	0x1BFB,	%i1
	mova	%icc,	%o1,	%o7
	ldsb	[%l7 + 0x60],	%g4
	lduw	[%l7 + 0x50],	%l2
	fnegd	%f2,	%f22
	sra	%o0,	%o2,	%g3
	srax	%l0,	%g5,	%o6
	alignaddr	%g2,	%l3,	%g1
	or	%i4,	%i0,	%i5
	udivcc	%g6,	0x058F,	%l6
	movrlez	%i7,	0x327,	%i2
	movg	%xcc,	%o5,	%l5
	umulcc	%o4,	0x1888,	%o3
	move	%xcc,	%l1,	%l4
	movg	%xcc,	%g7,	%i3
	movgu	%xcc,	%i6,	%i1
	movle	%icc,	%o1,	%g4
	edge32l	%l2,	%o0,	%o7
	movcc	%xcc,	%o2,	%g3
	move	%icc,	%l0,	%o6
	fmovrse	%g2,	%f2,	%f11
	movrgz	%l3,	%g5,	%g1
	sdiv	%i4,	0x1519,	%i0
	orcc	%g6,	0x169A,	%i5
	mulx	%l6,	0x109F,	%i2
	alignaddr	%o5,	%l5,	%i7
	edge8n	%o3,	%o4,	%l4
	movrlz	%g7,	%i3,	%l1
	movne	%icc,	%i1,	%o1
	sth	%g4,	[%l7 + 0x72]
	fmovsl	%icc,	%f4,	%f19
	array32	%l2,	%i6,	%o0
	ldsh	[%l7 + 0x54],	%o7
	edge32	%g3,	%l0,	%o2
	ldub	[%l7 + 0x14],	%g2
	edge16l	%l3,	%o6,	%g1
	edge8l	%i4,	%i0,	%g6
	std	%f2,	[%l7 + 0x70]
	fzero	%f4
	umul	%i5,	%l6,	%g5
	movneg	%icc,	%i2,	%o5
	addcc	%i7,	%l5,	%o3
	and	%l4,	0x04BC,	%o4
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	smulcc	%g7,	0x0AA3,	%o1
	andncc	%g4,	%i1,	%i6
	edge16n	%o0,	%l2,	%g3
	fcmpes	%fcc2,	%f26,	%f28
	edge16n	%o7,	%l0,	%o2
	fmovdge	%icc,	%f15,	%f22
	smulcc	%g2,	0x0580,	%o6
	fmovsa	%icc,	%f5,	%f2
	fmovrsgez	%l3,	%f14,	%f25
	smulcc	%i4,	0x1686,	%g1
	fmovrdlz	%i0,	%f18,	%f4
	fzero	%f8
	fpsub32	%f8,	%f8,	%f12
	alignaddrl	%i5,	%g6,	%g5
	ldsh	[%l7 + 0x30],	%i2
	xnorcc	%o5,	%i7,	%l6
	fmovsl	%xcc,	%f0,	%f18
	andn	%o3,	0x1215,	%l4
	edge32	%o4,	%l5,	%l1
	srax	%i3,	0x1F,	%o1
	movvc	%icc,	%g7,	%g4
	fmovs	%f5,	%f2
	edge16	%i6,	%o0,	%l2
	save %i1, %o7, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x28],	%l0
	smulcc	%o2,	%o6,	%l3
	fnegd	%f6,	%f26
	array32	%i4,	%g1,	%g2
	srlx	%i0,	0x1E,	%g6
	edge32n	%g5,	%i5,	%i2
	ldsw	[%l7 + 0x4C],	%o5
	popc	%l6,	%o3
	sir	0x199A
	fpsub32s	%f18,	%f29,	%f25
	lduw	[%l7 + 0x5C],	%i7
	movgu	%xcc,	%o4,	%l4
	udivcc	%l5,	0x1A79,	%i3
	subcc	%l1,	0x0C85,	%g7
	restore %o1, 0x01BD, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o0,	0x01,	%l2
	edge16	%g4,	%i1,	%g3
	movvs	%xcc,	%l0,	%o2
	movl	%icc,	%o6,	%o7
	umul	%l3,	0x0952,	%g1
	stb	%i4,	[%l7 + 0x1E]
	xnor	%g2,	%g6,	%g5
	orncc	%i0,	%i5,	%i2
	array16	%l6,	%o5,	%o3
	fmovdneg	%icc,	%f23,	%f28
	sir	0x1CCC
	save %o4, %i7, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f2,	%f30,	%f18
	sethi	0x154E,	%l5
	movrlz	%i3,	0x08A,	%l1
	fcmps	%fcc0,	%f13,	%f18
	lduw	[%l7 + 0x34],	%g7
	udiv	%i6,	0x0CEE,	%o1
	edge16ln	%l2,	%g4,	%i1
	stx	%o0,	[%l7 + 0x50]
	nop
	set	0x3C, %o7
	sth	%g3,	[%l7 + %o7]
	xor	%l0,	0x0F0B,	%o2
	subcc	%o6,	%l3,	%o7
	or	%i4,	0x0FED,	%g2
	edge32	%g1,	%g5,	%i0
	nop
	set	0x14, %l6
	lduw	[%l7 + %l6],	%i5
	edge8	%i2,	%g6,	%o5
	ld	[%l7 + 0x20],	%f16
	movrgez	%l6,	0x2C2,	%o4
	edge8n	%i7,	%l4,	%l5
	andcc	%i3,	%l1,	%g7
	fmul8ulx16	%f8,	%f4,	%f12
	sdiv	%o3,	0x1972,	%i6
	siam	0x0
	movrlz	%o1,	0x108,	%l2
	sth	%i1,	[%l7 + 0x3A]
	std	%f14,	[%l7 + 0x68]
	sll	%o0,	0x03,	%g4
	and	%l0,	%g3,	%o2
	nop
	set	0x22, %i2
	stb	%l3,	[%l7 + %i2]
	fabsd	%f20,	%f26
	movle	%icc,	%o6,	%o7
	umul	%g2,	0x0445,	%g1
	andcc	%g5,	%i0,	%i4
	movneg	%icc,	%i5,	%i2
	fandnot2s	%f0,	%f15,	%f31
	sdiv	%g6,	0x011B,	%o5
	array8	%l6,	%o4,	%i7
	ldd	[%l7 + 0x48],	%l4
	sub	%l5,	%l1,	%g7
	udivcc	%i3,	0x01E1,	%i6
	movcc	%xcc,	%o1,	%l2
	for	%f6,	%f16,	%f14
	ldx	[%l7 + 0x60],	%o3
	fpadd16	%f6,	%f12,	%f24
	movre	%i1,	0x338,	%g4
	ldub	[%l7 + 0x56],	%l0
	fands	%f18,	%f27,	%f6
	sra	%o0,	%g3,	%o2
	fnors	%f16,	%f28,	%f29
	movleu	%icc,	%l3,	%o7
	udiv	%o6,	0x0685,	%g2
	sra	%g1,	0x09,	%i0
	udiv	%g5,	0x14B8,	%i4
	fornot1s	%f14,	%f25,	%f2
	xor	%i2,	%g6,	%o5
	mulscc	%i5,	%o4,	%l6
	ldsw	[%l7 + 0x60],	%i7
	sethi	0x125E,	%l4
	fpsub32s	%f2,	%f29,	%f10
	sdiv	%l1,	0x0B61,	%g7
	sir	0x069F
	movcc	%xcc,	%l5,	%i6
	sllx	%i3,	0x1D,	%l2
	movrgz	%o3,	%o1,	%g4
	mulscc	%i1,	%o0,	%g3
	move	%icc,	%o2,	%l0
	ldsh	[%l7 + 0x7A],	%o7
	edge16ln	%o6,	%l3,	%g1
	movne	%xcc,	%i0,	%g2
	ldsh	[%l7 + 0x7E],	%g5
	movrgz	%i2,	%g6,	%i4
	andncc	%o5,	%i5,	%o4
	mulscc	%i7,	0x1A60,	%l6
	sra	%l1,	%l4,	%g7
	lduh	[%l7 + 0x46],	%l5
	fpadd32	%f20,	%f18,	%f0
	fmovdl	%icc,	%f29,	%f26
	fzeros	%f21
	orncc	%i3,	%i6,	%o3
	edge8	%o1,	%g4,	%i1
	move	%xcc,	%o0,	%g3
	fzero	%f0
	movpos	%xcc,	%o2,	%l2
	movcs	%xcc,	%l0,	%o6
	fmul8sux16	%f6,	%f18,	%f24
	fmul8sux16	%f28,	%f26,	%f30
	movneg	%icc,	%l3,	%g1
	fzeros	%f7
	udiv	%o7,	0x1587,	%i0
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	fmovrsgez	%g5,	%f28,	%f10
	udivx	%g6,	0x1264,	%i4
	movg	%icc,	%o5,	%o4
	mova	%xcc,	%i7,	%i5
	umulcc	%l6,	%l4,	%g7
	umul	%l1,	%l5,	%i6
	edge32n	%i3,	%o3,	%o1
	fnand	%f30,	%f24,	%f18
	udivcc	%g4,	0x0A23,	%o0
	or	%g3,	0x0AFF,	%i1
	edge8l	%l2,	%l0,	%o2
	movpos	%xcc,	%o6,	%l3
	fpackfix	%f16,	%f2
	movne	%xcc,	%g1,	%i0
	srl	%g2,	0x19,	%i2
	edge32	%g5,	%o7,	%g6
	ldsb	[%l7 + 0x31],	%i4
	sub	%o4,	0x0695,	%o5
	sth	%i5,	[%l7 + 0x7E]
	addc	%l6,	0x0D34,	%l4
	movrlez	%i7,	0x3A4,	%l1
	orncc	%g7,	%l5,	%i6
	fmovsneg	%xcc,	%f11,	%f31
	edge16	%o3,	%i3,	%g4
	fcmple32	%f30,	%f24,	%o1
	stx	%g3,	[%l7 + 0x40]
	fmovrde	%o0,	%f24,	%f16
	movvs	%xcc,	%l2,	%l0
	xnor	%i1,	0x0F16,	%o2
	edge8	%l3,	%g1,	%o6
	lduh	[%l7 + 0x4A],	%i0
	and	%g2,	%g5,	%i2
	movleu	%xcc,	%g6,	%i4
	sdivx	%o7,	0x12D6,	%o5
	fmovdle	%xcc,	%f12,	%f5
	movvc	%icc,	%o4,	%l6
	fmovsge	%icc,	%f26,	%f19
	andncc	%i5,	%i7,	%l4
	smulcc	%l1,	%l5,	%g7
	addccc	%o3,	0x0281,	%i6
	ldsb	[%l7 + 0x53],	%i3
	movrne	%o1,	%g3,	%o0
	xorcc	%l2,	%g4,	%i1
	movrlz	%o2,	0x392,	%l3
	smulcc	%g1,	0x17B8,	%l0
	movrlz	%i0,	%o6,	%g2
	ldx	[%l7 + 0x38],	%i2
	edge32ln	%g5,	%g6,	%o7
	udivx	%i4,	0x1B9E,	%o4
	fmovda	%icc,	%f0,	%f23
	fmovrslez	%l6,	%f17,	%f26
	fmovsl	%icc,	%f18,	%f11
	edge32n	%i5,	%o5,	%i7
	fmovdgu	%icc,	%f23,	%f11
	sth	%l1,	[%l7 + 0x12]
	sdivx	%l5,	0x1027,	%l4
	fmovrdgz	%g7,	%f0,	%f26
	movrlz	%i6,	%i3,	%o1
	fpsub32s	%f10,	%f3,	%f10
	ldd	[%l7 + 0x18],	%f12
	add	%g3,	%o3,	%o0
	andncc	%l2,	%i1,	%g4
	array16	%o2,	%g1,	%l3
	fpsub16s	%f17,	%f12,	%f9
	fmovda	%xcc,	%f18,	%f17
	sll	%l0,	%i0,	%o6
	sub	%i2,	%g2,	%g5
	sllx	%o7,	%g6,	%i4
	save %l6, 0x0453, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o5,	%o4,	%l1
	movne	%icc,	%l5,	%i7
	xorcc	%g7,	0x0F76,	%l4
	edge32	%i6,	%i3,	%g3
	ldsh	[%l7 + 0x6E],	%o1
	orn	%o3,	%l2,	%o0
	srlx	%i1,	0x14,	%g4
	movrgz	%g1,	%l3,	%l0
	ldsw	[%l7 + 0x64],	%o2
	mulx	%i0,	%o6,	%g2
	add	%g5,	%i2,	%g6
	sir	0x170F
	edge32	%o7,	%l6,	%i4
	movcc	%xcc,	%i5,	%o4
	edge8ln	%o5,	%l5,	%l1
	array8	%i7,	%g7,	%i6
	movpos	%xcc,	%i3,	%l4
	fzero	%f26
	fmovs	%f6,	%f24
	save %g3, %o1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f14,	%f6
	std	%f16,	[%l7 + 0x58]
	smulcc	%l2,	0x0B13,	%o0
	xorcc	%g4,	0x0225,	%i1
	sth	%g1,	[%l7 + 0x78]
	addccc	%l0,	0x1FFC,	%l3
	st	%f30,	[%l7 + 0x38]
	xor	%i0,	%o2,	%g2
	orcc	%g5,	%i2,	%o6
	movvs	%xcc,	%o7,	%g6
	udivx	%l6,	0x1360,	%i4
	smul	%o4,	%o5,	%l5
	sethi	0x1227,	%l1
	edge8n	%i5,	%i7,	%g7
	edge16ln	%i3,	%l4,	%g3
	orn	%o1,	0x186E,	%o3
	srlx	%l2,	%i6,	%g4
	udivx	%o0,	0x0ED8,	%i1
	stx	%g1,	[%l7 + 0x40]
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%l0
	fmovdvs	%xcc,	%f25,	%f6
	alignaddrl	%l3,	%o2,	%i0
	subccc	%g2,	0x02B8,	%g5
	fmovdn	%xcc,	%f6,	%f23
	fnor	%f20,	%f2,	%f20
	sdivx	%o6,	0x0F5E,	%i2
	save %g6, %o7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o4,	%o5,	%l6
	movrlez	%l1,	%l5,	%i7
	fornot1	%f26,	%f4,	%f6
	movrlez	%i5,	%i3,	%l4
	mulx	%g7,	%o1,	%o3
	popc	%g3,	%i6
	st	%f26,	[%l7 + 0x3C]
	move	%xcc,	%g4,	%l2
	edge8	%o0,	%g1,	%l0
	edge32ln	%i1,	%l3,	%i0
	fmovscc	%xcc,	%f21,	%f11
	sub	%o2,	0x061F,	%g5
	std	%f28,	[%l7 + 0x48]
	xnorcc	%o6,	%g2,	%g6
	movn	%icc,	%o7,	%i2
	sdiv	%o4,	0x0168,	%o5
	movcc	%icc,	%i4,	%l1
	movge	%xcc,	%l6,	%l5
	umul	%i5,	0x0A4B,	%i3
	fcmpne32	%f22,	%f26,	%l4
	addcc	%i7,	%g7,	%o3
	ld	[%l7 + 0x64],	%f18
	movn	%icc,	%g3,	%i6
	mova	%icc,	%g4,	%o1
	edge32ln	%o0,	%l2,	%g1
	movg	%xcc,	%l0,	%l3
	fmovdvc	%xcc,	%f24,	%f21
	sra	%i1,	0x09,	%o2
	edge8l	%i0,	%o6,	%g2
	fmovdne	%icc,	%f25,	%f0
	umul	%g6,	0x1F4A,	%g5
	movrgz	%o7,	%o4,	%o5
	mulx	%i2,	%i4,	%l1
	andcc	%l6,	%i5,	%i3
	umul	%l5,	0x12D5,	%i7
	sdivcc	%l4,	0x09A1,	%o3
	fmovda	%xcc,	%f14,	%f0
	udivcc	%g3,	0x1600,	%g7
	alignaddr	%i6,	%g4,	%o0
	xor	%o1,	0x1B00,	%l2
	edge32ln	%l0,	%l3,	%i1
	movpos	%xcc,	%g1,	%i0
	movleu	%icc,	%o6,	%o2
	movrlz	%g2,	0x1ED,	%g5
	movcc	%icc,	%o7,	%g6
	fmovdvc	%xcc,	%f13,	%f14
	mulscc	%o4,	%o5,	%i2
	movl	%icc,	%i4,	%l1
	fpsub16s	%f2,	%f26,	%f7
	movrne	%i5,	%i3,	%l6
	array8	%l5,	%l4,	%o3
	st	%f29,	[%l7 + 0x10]
	edge32l	%i7,	%g3,	%i6
	fmovsleu	%xcc,	%f12,	%f13
	edge8ln	%g7,	%g4,	%o1
	orcc	%o0,	0x0486,	%l0
	umul	%l2,	%i1,	%g1
	move	%xcc,	%i0,	%l3
	fnot1s	%f8,	%f28
	ld	[%l7 + 0x50],	%f24
	stx	%o6,	[%l7 + 0x08]
	edge16l	%g2,	%o2,	%g5
	mova	%xcc,	%o7,	%o4
	fmovrde	%o5,	%f4,	%f30
	or	%i2,	0x03D3,	%g6
	sllx	%i4,	%i5,	%i3
	edge8ln	%l1,	%l6,	%l4
	sllx	%l5,	%o3,	%i7
	fmovde	%xcc,	%f10,	%f31
	orn	%g3,	0x1A16,	%i6
	sdiv	%g7,	0x0582,	%g4
	move	%icc,	%o1,	%l0
	movneg	%icc,	%o0,	%l2
	ldsh	[%l7 + 0x1E],	%i1
	mulx	%i0,	%g1,	%l3
	umulcc	%o6,	0x02AA,	%g2
	restore %g5, 0x0BBF, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o7,	0x0A3C,	%o5
	mulscc	%o4,	0x17FC,	%g6
	popc	0x0E8E,	%i4
	movge	%xcc,	%i5,	%i3
	alignaddrl	%i2,	%l1,	%l6
	fmovdneg	%icc,	%f7,	%f12
	ldsh	[%l7 + 0x56],	%l4
	edge8ln	%l5,	%o3,	%g3
	add	%i7,	0x03C4,	%i6
	smul	%g7,	0x118B,	%g4
	movrlz	%l0,	0x030,	%o0
	edge16ln	%o1,	%l2,	%i0
	fsrc2s	%f14,	%f10
	edge8ln	%g1,	%i1,	%l3
	ld	[%l7 + 0x10],	%f26
	movneg	%icc,	%g2,	%o6
	ldub	[%l7 + 0x36],	%g5
	and	%o2,	%o7,	%o4
	ldx	[%l7 + 0x50],	%o5
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	sir	0x19CD
	addcc	%i2,	0x07FA,	%l1
	udiv	%l6,	0x1BE9,	%l4
	edge16l	%l5,	%o3,	%i5
	sub	%i7,	0x0443,	%g3
	edge8l	%i6,	%g7,	%g4
	orncc	%o0,	0x1F7D,	%l0
	edge8	%l2,	%o1,	%i0
	edge32n	%g1,	%l3,	%i1
	xnorcc	%g2,	0x06DD,	%o6
	edge16n	%g5,	%o7,	%o4
	movl	%icc,	%o2,	%g6
	movre	%o5,	0x13E,	%i4
	edge32l	%i2,	%i3,	%l1
	fmovrde	%l6,	%f28,	%f30
	xorcc	%l5,	0x1D63,	%o3
	movcc	%icc,	%l4,	%i5
	ldx	[%l7 + 0x18],	%g3
	edge16	%i6,	%g7,	%g4
	smul	%o0,	0x0128,	%i7
	nop
	set	0x70, %i5
	stx	%l0,	[%l7 + %i5]
	sir	0x0DAD
	fmovsleu	%icc,	%f19,	%f26
	xor	%l2,	%i0,	%o1
	fpadd32	%f10,	%f2,	%f18
	fmovspos	%xcc,	%f16,	%f17
	fmovdg	%icc,	%f25,	%f21
	lduw	[%l7 + 0x14],	%g1
	ldd	[%l7 + 0x78],	%f12
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%i0
	array16	%l3,	%g2,	%g5
	fones	%f20
	mulscc	%o7,	%o4,	%o6
	sth	%g6,	[%l7 + 0x46]
	udivx	%o5,	0x14C9,	%o2
	srax	%i4,	0x01,	%i2
	fsrc1	%f16,	%f2
	movneg	%xcc,	%i3,	%l1
	movre	%l6,	%l5,	%l4
	sth	%i5,	[%l7 + 0x08]
	edge16	%g3,	%o3,	%i6
	movrgz	%g4,	0x1D6,	%g7
	ldsw	[%l7 + 0x60],	%o0
	fmovrslz	%l0,	%f8,	%f29
	fcmpne32	%f2,	%f8,	%l2
	alignaddrl	%i0,	%i7,	%o1
	ldub	[%l7 + 0x4A],	%i1
	fmovdl	%icc,	%f12,	%f18
	sethi	0x0CC7,	%g1
	sra	%l3,	0x1E,	%g5
	ldd	[%l7 + 0x50],	%f24
	srl	%o7,	0x1A,	%g2
	sdivx	%o4,	0x1214,	%g6
	addccc	%o6,	%o2,	%o5
	andn	%i4,	%i2,	%l1
	udivcc	%l6,	0x0830,	%i3
	andcc	%l4,	%l5,	%i5
	move	%xcc,	%g3,	%i6
	edge32ln	%o3,	%g7,	%g4
	subccc	%l0,	%o0,	%l2
	st	%f23,	[%l7 + 0x38]
	orn	%i0,	0x053F,	%o1
	movrne	%i7,	%i1,	%l3
	sdivx	%g1,	0x1690,	%o7
	movrgz	%g5,	%g2,	%o4
	fmovrse	%g6,	%f6,	%f14
	movl	%xcc,	%o2,	%o6
	smulcc	%o5,	0x10DC,	%i2
	stw	%i4,	[%l7 + 0x70]
	fzero	%f4
	edge8ln	%l6,	%l1,	%i3
	array8	%l5,	%l4,	%g3
	udivx	%i6,	0x170D,	%o3
	movle	%icc,	%i5,	%g4
	addcc	%g7,	%l0,	%o0
	edge32n	%l2,	%o1,	%i7
	movrlz	%i0,	0x230,	%l3
	std	%f12,	[%l7 + 0x28]
	addc	%i1,	%g1,	%g5
	subccc	%g2,	0x1A20,	%o4
	movn	%icc,	%o7,	%o2
	xor	%o6,	%o5,	%g6
	edge8n	%i4,	%i2,	%l6
	mulx	%i3,	%l5,	%l1
	edge16l	%g3,	%i6,	%o3
	movrgez	%l4,	%g4,	%i5
	fcmpgt16	%f30,	%f18,	%l0
	fmovsn	%xcc,	%f7,	%f21
	xnor	%g7,	%o0,	%o1
	fxnor	%f22,	%f8,	%f18
	addc	%i7,	%i0,	%l3
	movleu	%xcc,	%i1,	%l2
	array8	%g5,	%g1,	%o4
	lduh	[%l7 + 0x3C],	%o7
	fpadd32	%f6,	%f16,	%f26
	fnegs	%f14,	%f5
	or	%g2,	%o2,	%o5
	edge8l	%o6,	%i4,	%g6
	ldd	[%l7 + 0x68],	%i2
	movgu	%icc,	%l6,	%i3
	array16	%l1,	%g3,	%i6
	fsrc1	%f10,	%f12
	fmul8x16au	%f3,	%f28,	%f4
	fnot1	%f20,	%f4
	fsrc2s	%f9,	%f15
	fsrc1s	%f7,	%f21
	movre	%l5,	0x1B8,	%o3
	movleu	%icc,	%l4,	%i5
	movcs	%xcc,	%l0,	%g4
	std	%f14,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%f20
	movvs	%xcc,	%g7,	%o0
	andn	%i7,	0x1EE6,	%o1
	udivcc	%i0,	0x138A,	%l3
	xnorcc	%l2,	0x09D7,	%g5
	stw	%g1,	[%l7 + 0x5C]
	sdiv	%o4,	0x10CA,	%i1
	sethi	0x125C,	%g2
	ldx	[%l7 + 0x40],	%o2
	movn	%icc,	%o7,	%o5
	subcc	%o6,	%i4,	%i2
	sth	%g6,	[%l7 + 0x7A]
	stx	%i3,	[%l7 + 0x50]
	addc	%l6,	0x038D,	%l1
	faligndata	%f10,	%f20,	%f6
	sdivcc	%g3,	0x0EB7,	%l5
	array16	%i6,	%o3,	%l4
	array32	%l0,	%i5,	%g4
	edge8ln	%g7,	%o0,	%i7
	umul	%i0,	%l3,	%l2
	mulx	%o1,	%g5,	%g1
	sll	%i1,	%g2,	%o2
	ldx	[%l7 + 0x08],	%o7
	movvs	%icc,	%o5,	%o4
	sth	%i4,	[%l7 + 0x22]
	movneg	%xcc,	%i2,	%o6
	fpsub32	%f14,	%f28,	%f4
	edge32l	%g6,	%l6,	%i3
	array32	%l1,	%l5,	%i6
	move	%xcc,	%o3,	%l4
	fmovdge	%xcc,	%f0,	%f3
	fmovdne	%xcc,	%f23,	%f16
	fcmpd	%fcc3,	%f10,	%f0
	movl	%icc,	%l0,	%i5
	movvc	%icc,	%g3,	%g7
	fandnot1s	%f2,	%f14,	%f17
	mulx	%o0,	%g4,	%i0
	orcc	%i7,	0x1E3C,	%l3
	std	%f26,	[%l7 + 0x28]
	andncc	%l2,	%g5,	%g1
	mulx	%i1,	0x07B6,	%g2
	alignaddr	%o1,	%o7,	%o5
	subcc	%o4,	%i4,	%o2
	sra	%o6,	%g6,	%i2
	edge16n	%l6,	%i3,	%l5
	popc	%l1,	%o3
	andncc	%i6,	%l4,	%l0
	movre	%i5,	0x183,	%g3
	mova	%xcc,	%o0,	%g4
	alignaddr	%g7,	%i7,	%l3
	sdivcc	%l2,	0x0A30,	%g5
	edge8n	%i0,	%i1,	%g2
	array32	%g1,	%o7,	%o1
	alignaddrl	%o4,	%i4,	%o2
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%f10
	or	%o5,	0x1A30,	%g6
	movre	%i2,	0x35D,	%o6
	ldd	[%l7 + 0x40],	%f12
	fnot2	%f26,	%f26
	ldx	[%l7 + 0x50],	%l6
	andn	%l5,	%i3,	%l1
	fpackfix	%f30,	%f1
	movrne	%i6,	0x3E9,	%l4
	fmovdge	%xcc,	%f6,	%f5
	ldx	[%l7 + 0x20],	%o3
	udivx	%i5,	0x1153,	%g3
	xor	%o0,	0x020B,	%l0
	or	%g4,	%i7,	%l3
	array8	%g7,	%g5,	%l2
	edge8l	%i1,	%g2,	%g1
	addc	%o7,	0x0B6C,	%o1
	fandnot1	%f22,	%f24,	%f4
	fmovde	%xcc,	%f9,	%f7
	andn	%o4,	0x14A5,	%i4
	fmovsneg	%icc,	%f2,	%f3
	udivx	%i0,	0x0B3D,	%o5
	movpos	%icc,	%o2,	%g6
	edge16l	%o6,	%i2,	%l6
	edge8ln	%l5,	%l1,	%i3
	add	%l4,	0x18C1,	%o3
	fsrc2	%f4,	%f14
	stw	%i5,	[%l7 + 0x78]
	sll	%i6,	%g3,	%l0
	ldsb	[%l7 + 0x55],	%g4
	array16	%i7,	%o0,	%l3
	movcc	%xcc,	%g7,	%l2
	edge32l	%g5,	%i1,	%g1
	fmovd	%f28,	%f18
	fornot1s	%f15,	%f6,	%f30
	srl	%o7,	%o1,	%g2
	andcc	%i4,	0x15A7,	%i0
	addccc	%o5,	0x1F0C,	%o4
	edge16n	%g6,	%o6,	%i2
	fmovrse	%o2,	%f17,	%f12
	movrne	%l6,	0x12F,	%l5
	mulx	%l1,	%i3,	%l4
	ld	[%l7 + 0x08],	%f2
	movn	%icc,	%o3,	%i6
	ldd	[%l7 + 0x38],	%f20
	fmovrdlez	%g3,	%f18,	%f0
	edge16n	%l0,	%g4,	%i7
	srlx	%i5,	0x04,	%o0
	orncc	%l3,	0x11D8,	%l2
	srl	%g5,	0x14,	%g7
	edge8n	%g1,	%o7,	%i1
	sllx	%o1,	0x10,	%g2
	udivcc	%i0,	0x0395,	%i4
	udivx	%o5,	0x0781,	%o4
	andcc	%o6,	%i2,	%o2
	ldx	[%l7 + 0x38],	%g6
	fands	%f5,	%f16,	%f9
	movvc	%xcc,	%l6,	%l1
	edge16l	%i3,	%l4,	%o3
	edge16	%l5,	%g3,	%l0
	movvs	%icc,	%g4,	%i7
	fnot1	%f6,	%f12
	subc	%i6,	0x08A6,	%i5
	smulcc	%o0,	%l2,	%g5
	subcc	%g7,	%l3,	%g1
	xor	%i1,	%o1,	%o7
	movn	%xcc,	%g2,	%i4
	fpackfix	%f8,	%f9
	st	%f24,	[%l7 + 0x40]
	movre	%i0,	%o5,	%o4
	fcmpeq32	%f22,	%f24,	%o6
	movgu	%icc,	%i2,	%g6
	ldd	[%l7 + 0x38],	%f24
	sll	%o2,	0x05,	%l1
	addcc	%i3,	%l4,	%l6
	addccc	%l5,	%g3,	%o3
	ldsb	[%l7 + 0x27],	%g4
	movcs	%icc,	%i7,	%l0
	srl	%i6,	%o0,	%l2
	st	%f4,	[%l7 + 0x08]
	addcc	%i5,	%g5,	%l3
	ld	[%l7 + 0x30],	%f4
	movgu	%icc,	%g1,	%g7
	orcc	%i1,	0x16F3,	%o7
	edge32l	%g2,	%o1,	%i0
	fnegs	%f31,	%f15
	edge32	%i4,	%o5,	%o4
	fnand	%f6,	%f4,	%f22
	movrlz	%o6,	0x124,	%g6
	movvs	%icc,	%i2,	%l1
	ldsh	[%l7 + 0x10],	%i3
	movvs	%xcc,	%l4,	%o2
	fcmple32	%f28,	%f10,	%l5
	ldsh	[%l7 + 0x66],	%g3
	xnor	%o3,	%l6,	%g4
	movcs	%xcc,	%l0,	%i7
	array32	%o0,	%i6,	%i5
	andcc	%g5,	0x0A41,	%l2
	fpsub32	%f0,	%f18,	%f22
	popc	0x0F24,	%l3
	fnot2	%f28,	%f28
	fmovrde	%g1,	%f0,	%f10
	edge8n	%i1,	%o7,	%g2
	movrlz	%o1,	0x0AA,	%g7
	udiv	%i0,	0x1F0B,	%o5
	xorcc	%i4,	%o6,	%o4
	ldsw	[%l7 + 0x30],	%i2
	nop
	set	0x21, %l5
	stb	%g6,	[%l7 + %l5]
	movleu	%icc,	%l1,	%i3
	xnorcc	%l4,	0x0A08,	%o2
	ld	[%l7 + 0x44],	%f17
	add	%g3,	%l5,	%o3
	fmovda	%xcc,	%f26,	%f22
	movvs	%icc,	%l6,	%l0
	fmovdcc	%icc,	%f14,	%f17
	restore %i7, %g4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i5,	%g5
	st	%f1,	[%l7 + 0x08]
	save %o0, 0x0F97, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f18,	%f24,	%f0
	movge	%icc,	%l2,	%g1
	fabss	%f19,	%f31
	movneg	%icc,	%i1,	%o7
	movleu	%xcc,	%o1,	%g7
	fsrc1	%f30,	%f2
	addccc	%i0,	%g2,	%o5
	fmovsn	%xcc,	%f12,	%f18
	edge8ln	%o6,	%o4,	%i2
	ldd	[%l7 + 0x58],	%f4
	add	%i4,	%g6,	%i3
	movpos	%icc,	%l4,	%o2
	edge8ln	%g3,	%l5,	%l1
	or	%o3,	0x04A1,	%l0
	mulscc	%i7,	%l6,	%g4
	mova	%icc,	%i5,	%i6
	movre	%g5,	0x106,	%o0
	fabss	%f24,	%f6
	mulscc	%l3,	0x0366,	%l2
	movrgz	%i1,	%o7,	%g1
	ldx	[%l7 + 0x30],	%g7
	fnegs	%f8,	%f23
	edge8l	%i0,	%g2,	%o5
	and	%o6,	0x083C,	%o4
	sub	%o1,	0x1ED5,	%i4
	sub	%g6,	%i2,	%i3
	fzero	%f2
	edge8ln	%o2,	%g3,	%l4
	fmul8x16au	%f9,	%f21,	%f28
	siam	0x0
	umul	%l5,	0x0A85,	%l1
	ld	[%l7 + 0x08],	%f6
	movcc	%icc,	%l0,	%o3
	fmovsg	%icc,	%f18,	%f1
	fmovsne	%icc,	%f27,	%f27
	edge32ln	%l6,	%i7,	%i5
	movl	%icc,	%g4,	%i6
	edge8ln	%g5,	%l3,	%o0
	popc	%l2,	%i1
	lduw	[%l7 + 0x28],	%g1
	edge8n	%o7,	%i0,	%g7
	array32	%g2,	%o6,	%o5
	lduw	[%l7 + 0x3C],	%o1
	fandnot1s	%f28,	%f11,	%f14
	movrlz	%i4,	%g6,	%o4
	fandnot1s	%f1,	%f0,	%f10
	alignaddr	%i3,	%i2,	%g3
	edge32ln	%l4,	%o2,	%l5
	fmovrde	%l1,	%f18,	%f26
	addccc	%l0,	0x1E0C,	%o3
	movle	%icc,	%l6,	%i7
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	ldsw	[%l7 + 0x38],	%l3
	movrlez	%o0,	0x1C9,	%g5
	fmovscs	%xcc,	%f5,	%f6
	smul	%l2,	0x135C,	%i1
	addc	%o7,	%g1,	%i0
	movvc	%xcc,	%g2,	%o6
	andncc	%o5,	%g7,	%o1
	sdiv	%i4,	0x030A,	%g6
	xnor	%o4,	%i2,	%g3
	alignaddrl	%l4,	%o2,	%i3
	xorcc	%l1,	%l0,	%l5
	andcc	%l6,	%i7,	%g4
	stx	%i5,	[%l7 + 0x70]
	lduw	[%l7 + 0x74],	%o3
	sdivcc	%l3,	0x06CE,	%i6
	movg	%icc,	%o0,	%g5
	andncc	%i1,	%l2,	%g1
	movrne	%i0,	%o7,	%g2
	ldd	[%l7 + 0x48],	%f18
	lduh	[%l7 + 0x40],	%o5
	fnot1	%f28,	%f22
	edge8ln	%g7,	%o6,	%o1
	sethi	0x18C4,	%g6
	movge	%xcc,	%i4,	%o4
	fornot1	%f16,	%f2,	%f0
	sub	%g3,	%l4,	%i2
	sub	%i3,	%o2,	%l1
	xnorcc	%l0,	0x10D7,	%l6
	save %i7, %l5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i5,	0x0A,	%l3
	fsrc2	%f24,	%f6
	movl	%xcc,	%o3,	%i6
	lduw	[%l7 + 0x44],	%g5
	fmovrse	%i1,	%f30,	%f3
	popc	%o0,	%l2
	movle	%icc,	%g1,	%o7
	fpack32	%f24,	%f20,	%f4
	alignaddrl	%i0,	%o5,	%g2
	umul	%o6,	%o1,	%g6
	edge8l	%g7,	%i4,	%g3
	restore %o4, %i2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i3,	0x0E,	%o2
	movvc	%xcc,	%l1,	%l0
	fcmple16	%f14,	%f26,	%l6
	fmovdcc	%xcc,	%f13,	%f23
	xor	%l5,	%i7,	%g4
	udiv	%l3,	0x1834,	%i5
	std	%f8,	[%l7 + 0x68]
	subc	%o3,	%i6,	%g5
	movge	%icc,	%i1,	%o0
	add	%l2,	%o7,	%g1
	sethi	0x0BCD,	%i0
	xorcc	%g2,	%o6,	%o5
	udiv	%g6,	0x0627,	%o1
	std	%f28,	[%l7 + 0x38]
	array8	%g7,	%g3,	%o4
	edge16l	%i4,	%l4,	%i3
	edge8ln	%i2,	%l1,	%o2
	fcmple16	%f22,	%f0,	%l0
	popc	0x045A,	%l5
	movleu	%xcc,	%l6,	%i7
	fpadd32s	%f10,	%f27,	%f31
	array8	%g4,	%l3,	%o3
	movl	%xcc,	%i5,	%i6
	movrne	%i1,	0x0D1,	%g5
	alignaddr	%l2,	%o7,	%g1
	fsrc2	%f12,	%f6
	fmovdgu	%icc,	%f18,	%f13
	ldd	[%l7 + 0x68],	%f26
	edge16l	%o0,	%i0,	%o6
	stb	%o5,	[%l7 + 0x54]
	save %g6, 0x1285, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%icc,	%f1,	%f31
	edge8l	%g7,	%g3,	%o4
	umulcc	%i4,	0x196C,	%o1
	edge32l	%l4,	%i2,	%i3
	fcmple32	%f8,	%f12,	%l1
	fcmpd	%fcc2,	%f16,	%f28
	fnors	%f18,	%f30,	%f2
	andn	%o2,	%l5,	%l0
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	fmuld8ulx16	%f7,	%f0,	%f0
	add	%o3,	0x1836,	%l3
	sdiv	%i6,	0x152D,	%i5
	edge16	%g5,	%i1,	%l2
	xorcc	%g1,	%o0,	%o7
	edge32ln	%o6,	%o5,	%i0
	movg	%xcc,	%g6,	%g7
	orn	%g2,	%o4,	%g3
	movl	%icc,	%o1,	%l4
	fsrc2	%f24,	%f26
	fmovsvs	%xcc,	%f14,	%f23
	fmul8x16au	%f19,	%f26,	%f10
	st	%f21,	[%l7 + 0x6C]
	fmovrdgz	%i2,	%f24,	%f24
	movrlz	%i4,	0x326,	%i3
	subcc	%l1,	%l5,	%o2
	fsrc2s	%f1,	%f22
	sir	0x0423
	movrgz	%i7,	0x377,	%l0
	smul	%l6,	0x1120,	%o3
	alignaddr	%l3,	%g4,	%i5
	nop
	set	0x20, %i6
	ldsw	[%l7 + %i6],	%i6
	sll	%i1,	%g5,	%l2
	save %o0, 0x05AC, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%o6,	%o7
	subcc	%i0,	0x115B,	%g6
	or	%g7,	%g2,	%o5
	fexpand	%f26,	%f30
	xnor	%o4,	%g3,	%l4
	edge16ln	%o1,	%i4,	%i2
	lduw	[%l7 + 0x18],	%i3
	movrlz	%l5,	0x324,	%l1
	udiv	%i7,	0x12F8,	%l0
	ldub	[%l7 + 0x2B],	%l6
	fnot1	%f14,	%f4
	movneg	%icc,	%o2,	%l3
	lduh	[%l7 + 0x76],	%g4
	fmovdneg	%xcc,	%f22,	%f25
	fmul8x16au	%f24,	%f14,	%f12
	fmovrdgez	%i5,	%f26,	%f20
	movrlez	%i6,	0x28D,	%i1
	edge16l	%g5,	%o3,	%l2
	movrgz	%g1,	0x118,	%o0
	edge8	%o6,	%i0,	%o7
	edge16ln	%g6,	%g7,	%g2
	sir	0x0075
	andcc	%o5,	0x197B,	%o4
	fmovrsne	%g3,	%f8,	%f19
	restore %o1, %l4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0F02,	%i3
	edge8ln	%l5,	%l1,	%i7
	fcmpgt32	%f14,	%f8,	%i2
	movrne	%l0,	%o2,	%l3
	andncc	%l6,	%i5,	%i6
	edge32	%i1,	%g5,	%o3
	movpos	%icc,	%l2,	%g4
	movleu	%icc,	%g1,	%o6
	mulx	%o0,	0x1E06,	%i0
	edge32	%o7,	%g6,	%g7
	srlx	%o5,	0x03,	%o4
	fmovsle	%xcc,	%f30,	%f13
	sdiv	%g2,	0x1AED,	%g3
	movcs	%icc,	%o1,	%l4
	ldx	[%l7 + 0x48],	%i4
	addc	%l5,	%i3,	%i7
	sdivcc	%i2,	0x0CD0,	%l0
	siam	0x3
	fmovde	%icc,	%f25,	%f28
	ldsb	[%l7 + 0x2B],	%o2
	sub	%l3,	0x15FA,	%l6
	stw	%l1,	[%l7 + 0x6C]
	smul	%i5,	%i1,	%i6
	fabsd	%f28,	%f6
	udivcc	%g5,	0x1813,	%l2
	movge	%xcc,	%g4,	%o3
	fpack32	%f6,	%f14,	%f30
	lduh	[%l7 + 0x64],	%o6
	edge32l	%o0,	%g1,	%i0
	orcc	%g6,	0x07FF,	%g7
	alignaddrl	%o5,	%o7,	%g2
	movrlez	%o4,	%g3,	%o1
	ldsh	[%l7 + 0x68],	%l4
	fmuld8sux16	%f8,	%f30,	%f20
	fcmped	%fcc0,	%f18,	%f20
	fands	%f24,	%f4,	%f10
	fmovdne	%xcc,	%f13,	%f24
	fmovsle	%icc,	%f25,	%f20
	fxors	%f11,	%f5,	%f18
	edge32	%l5,	%i3,	%i4
	subcc	%i7,	%i2,	%l0
	ldub	[%l7 + 0x59],	%o2
	ldub	[%l7 + 0x40],	%l3
	alignaddr	%l6,	%l1,	%i1
	alignaddrl	%i5,	%g5,	%i6
	fmovrsgez	%l2,	%f28,	%f5
	movge	%icc,	%g4,	%o3
	udivx	%o6,	0x02DD,	%g1
	movcs	%icc,	%i0,	%g6
	xnor	%o0,	%g7,	%o7
	fmuld8sux16	%f9,	%f16,	%f24
	sth	%o5,	[%l7 + 0x3C]
	stb	%g2,	[%l7 + 0x7B]
	movcc	%icc,	%o4,	%g3
	movl	%xcc,	%o1,	%l4
	ld	[%l7 + 0x70],	%f20
	sdivcc	%i3,	0x045E,	%i4
	for	%f0,	%f24,	%f14
	ldsw	[%l7 + 0x7C],	%i7
	sub	%i2,	%l0,	%o2
	edge32n	%l3,	%l5,	%l6
	umul	%l1,	%i5,	%g5
	movrlz	%i1,	0x37A,	%l2
	ldx	[%l7 + 0x08],	%g4
	edge8ln	%i6,	%o6,	%o3
	movl	%icc,	%g1,	%g6
	fmovrdlz	%o0,	%f28,	%f18
	movl	%xcc,	%g7,	%i0
	lduw	[%l7 + 0x48],	%o7
	stb	%g2,	[%l7 + 0x08]
	movrgez	%o4,	%g3,	%o5
	alignaddrl	%l4,	%o1,	%i3
	sdivx	%i4,	0x191B,	%i2
	st	%f5,	[%l7 + 0x68]
	fcmpd	%fcc3,	%f18,	%f10
	edge8ln	%i7,	%l0,	%l3
	fandnot2s	%f29,	%f4,	%f15
	movvc	%icc,	%l5,	%l6
	fmovsge	%icc,	%f19,	%f27
	fmovdle	%icc,	%f24,	%f7
	fmovrslz	%o2,	%f27,	%f4
	popc	%i5,	%l1
	alignaddr	%i1,	%l2,	%g4
	fors	%f12,	%f9,	%f3
	movrlz	%i6,	%o6,	%g5
	udivcc	%g1,	0x12AE,	%g6
	sdivx	%o0,	0x1DFE,	%g7
	ldub	[%l7 + 0x53],	%i0
	nop
	set	0x4C, %i3
	lduw	[%l7 + %i3],	%o3
	fornot1s	%f7,	%f19,	%f8
	lduh	[%l7 + 0x12],	%o7
	mulscc	%o4,	0x0BE3,	%g3
	srlx	%g2,	0x04,	%o5
	sdiv	%o1,	0x18A6,	%i3
	array32	%l4,	%i4,	%i2
	mulx	%i7,	0x0053,	%l0
	edge8ln	%l5,	%l3,	%o2
	for	%f26,	%f4,	%f8
	movgu	%icc,	%i5,	%l1
	sub	%i1,	%l6,	%g4
	fcmpne32	%f2,	%f8,	%l2
	movneg	%xcc,	%i6,	%g5
	movvc	%xcc,	%o6,	%g1
	mulscc	%o0,	%g6,	%i0
	move	%icc,	%o3,	%o7
	fmovsne	%icc,	%f5,	%f19
	save %g7, 0x1D13, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f14,	%f16,	%g3
	udivx	%g2,	0x0B11,	%o1
	popc	0x0209,	%o5
	nop
	set	0x60, %g3
	ldsw	[%l7 + %g3],	%i3
	umulcc	%l4,	0x141B,	%i4
	fnot1	%f24,	%f0
	sub	%i2,	0x1F98,	%l0
	edge16l	%l5,	%i7,	%o2
	array16	%i5,	%l3,	%i1
	xorcc	%l1,	%l6,	%l2
	movneg	%icc,	%g4,	%i6
	edge16n	%g5,	%g1,	%o6
	stx	%g6,	[%l7 + 0x50]
	mova	%icc,	%i0,	%o3
	andncc	%o0,	%g7,	%o4
	movge	%icc,	%g3,	%g2
	edge32ln	%o1,	%o5,	%o7
	move	%xcc,	%i3,	%i4
	fcmpeq16	%f20,	%f10,	%l4
	fmovdvs	%xcc,	%f26,	%f15
	edge16ln	%l0,	%l5,	%i7
	fxnor	%f12,	%f16,	%f10
	movpos	%icc,	%o2,	%i2
	edge32ln	%l3,	%i1,	%l1
	fcmpeq32	%f8,	%f0,	%i5
	fnors	%f6,	%f5,	%f27
	edge32n	%l2,	%l6,	%g4
	fmovsl	%icc,	%f20,	%f17
	orncc	%i6,	0x0A08,	%g5
	movrne	%o6,	0x047,	%g1
	subccc	%g6,	%i0,	%o0
	xor	%o3,	0x1CAC,	%g7
	fnot1	%f0,	%f0
	movrlz	%g3,	0x2C2,	%g2
	st	%f9,	[%l7 + 0x20]
	fcmpne32	%f0,	%f8,	%o1
	fmovda	%icc,	%f21,	%f12
	movcc	%icc,	%o5,	%o7
	fmovrdne	%i3,	%f4,	%f18
	mulscc	%i4,	%o4,	%l0
	xnor	%l4,	0x0F09,	%l5
	st	%f11,	[%l7 + 0x54]
	fmovsvc	%xcc,	%f13,	%f7
	edge16n	%i7,	%i2,	%l3
	fxor	%f12,	%f6,	%f18
	array16	%o2,	%i1,	%i5
	xor	%l1,	0x14F2,	%l6
	or	%g4,	%l2,	%g5
	ldd	[%l7 + 0x48],	%f28
	addcc	%o6,	0x1BF7,	%g1
	subc	%g6,	0x1533,	%i6
	ldsw	[%l7 + 0x20],	%o0
	movl	%xcc,	%i0,	%g7
	edge16	%o3,	%g3,	%o1
	fmul8x16	%f22,	%f6,	%f10
	fandnot2s	%f24,	%f17,	%f1
	and	%o5,	0x0820,	%o7
	addc	%i3,	0x18AC,	%i4
	udivcc	%o4,	0x1D20,	%l0
	fabss	%f17,	%f31
	fmovsgu	%xcc,	%f6,	%f7
	subccc	%l4,	0x135C,	%l5
	fpack16	%f8,	%f21
	sth	%i7,	[%l7 + 0x1C]
	fmovsg	%icc,	%f29,	%f26
	stb	%g2,	[%l7 + 0x57]
	std	%f10,	[%l7 + 0x38]
	sir	0x1387
	sub	%i2,	%o2,	%l3
	fpadd32s	%f12,	%f9,	%f2
	movrne	%i1,	%i5,	%l1
	movcs	%icc,	%g4,	%l2
	orcc	%g5,	%l6,	%o6
	sir	0x10D9
	movleu	%xcc,	%g6,	%g1
	edge8n	%o0,	%i0,	%g7
	array32	%o3,	%g3,	%o1
	sth	%i6,	[%l7 + 0x18]
	alignaddrl	%o7,	%o5,	%i3
	ldsh	[%l7 + 0x32],	%o4
	movrne	%i4,	0x2F5,	%l0
	sub	%l4,	%i7,	%l5
	mulx	%g2,	0x0AA3,	%i2
	stx	%l3,	[%l7 + 0x20]
	subccc	%i1,	%o2,	%l1
	sll	%g4,	%l2,	%i5
	edge8	%g5,	%o6,	%g6
	sth	%g1,	[%l7 + 0x38]
	and	%l6,	%o0,	%g7
	popc	0x1FF5,	%i0
	edge16	%o3,	%o1,	%g3
	edge8	%i6,	%o5,	%i3
	srax	%o7,	%i4,	%l0
	edge8l	%l4,	%o4,	%l5
	add	%g2,	%i7,	%i2
	mulscc	%i1,	%l3,	%o2
	andcc	%l1,	%g4,	%l2
	edge8ln	%i5,	%g5,	%o6
	movrgz	%g1,	0x001,	%l6
	orn	%g6,	%o0,	%i0
	mulscc	%g7,	%o1,	%g3
	ldd	[%l7 + 0x08],	%f16
	fandnot1s	%f27,	%f8,	%f30
	fmovdcs	%icc,	%f17,	%f23
	smulcc	%i6,	%o3,	%i3
	fnot1s	%f19,	%f12
	fmovscc	%icc,	%f26,	%f29
	lduh	[%l7 + 0x2E],	%o5
	edge32n	%i4,	%o7,	%l4
	fmovrsgez	%l0,	%f19,	%f11
	movre	%l5,	%o4,	%i7
	movle	%xcc,	%i2,	%g2
	edge8n	%l3,	%i1,	%l1
	mova	%xcc,	%o2,	%l2
	popc	0x15E8,	%i5
	sll	%g5,	0x13,	%g4
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	movvc	%xcc,	%o0,	%i0
	nop
	set	0x74, %g5
	lduw	[%l7 + %g5],	%o6
	srax	%g7,	0x10,	%g3
	fmovrdgez	%i6,	%f30,	%f20
	orn	%o3,	%o1,	%i3
	andcc	%i4,	%o7,	%l4
	or	%o5,	%l5,	%l0
	sllx	%o4,	%i2,	%g2
	ldsh	[%l7 + 0x5C],	%i7
	and	%i1,	%l1,	%o2
	fmovsvc	%xcc,	%f12,	%f12
	st	%f12,	[%l7 + 0x58]
	fxnor	%f4,	%f6,	%f26
	movrgez	%l2,	%l3,	%g5
	fmul8ulx16	%f16,	%f2,	%f4
	sub	%i5,	%g1,	%l6
	movcc	%xcc,	%g6,	%o0
	or	%i0,	0x12F1,	%o6
	andn	%g7,	%g4,	%g3
	movneg	%xcc,	%o3,	%i6
	xor	%o1,	%i3,	%i4
	subc	%l4,	0x10EA,	%o7
	sdivcc	%l5,	0x0B04,	%l0
	subccc	%o4,	0x1C6C,	%o5
	orncc	%i2,	0x1ACC,	%i7
	subc	%g2,	%l1,	%i1
	fnegs	%f26,	%f13
	fmovdn	%xcc,	%f22,	%f13
	udiv	%o2,	0x1518,	%l2
	movl	%xcc,	%g5,	%i5
	edge16ln	%l3,	%g1,	%l6
	stb	%g6,	[%l7 + 0x4E]
	fabsd	%f26,	%f28
	edge8ln	%i0,	%o0,	%g7
	udivcc	%o6,	0x04A8,	%g3
	udivx	%g4,	0x1F69,	%o3
	ld	[%l7 + 0x38],	%f16
	edge8n	%o1,	%i6,	%i3
	std	%f2,	[%l7 + 0x08]
	movne	%xcc,	%l4,	%i4
	ldd	[%l7 + 0x08],	%l4
	fzeros	%f8
	alignaddr	%o7,	%l0,	%o4
	fmovda	%icc,	%f27,	%f20
	add	%o5,	%i2,	%i7
	edge8ln	%l1,	%g2,	%o2
	movg	%icc,	%i1,	%g5
	nop
	set	0x0C, %l2
	lduw	[%l7 + %l2],	%l2
	ldd	[%l7 + 0x38],	%f6
	movrne	%l3,	0x17B,	%i5
	movrlz	%l6,	%g1,	%i0
	orncc	%o0,	%g6,	%g7
	save %o6, 0x0098, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o3,	0x3AE,	%g3
	orncc	%i6,	0x0861,	%o1
	movcs	%xcc,	%i3,	%l4
	lduh	[%l7 + 0x48],	%i4
	stb	%o7,	[%l7 + 0x2F]
	addcc	%l0,	%l5,	%o5
	ldsh	[%l7 + 0x3E],	%i2
	movg	%icc,	%o4,	%i7
	addccc	%g2,	%l1,	%o2
	edge16l	%g5,	%i1,	%l2
	ldx	[%l7 + 0x68],	%l3
	andncc	%l6,	%g1,	%i0
	edge8	%i5,	%g6,	%g7
	srax	%o6,	0x19,	%o0
	mulscc	%o3,	0x04E8,	%g3
	edge16n	%g4,	%i6,	%o1
	array16	%l4,	%i4,	%i3
	udiv	%o7,	0x0B69,	%l5
	edge32n	%o5,	%l0,	%i2
	ldub	[%l7 + 0x50],	%o4
	fmovdne	%xcc,	%f29,	%f17
	andcc	%i7,	%l1,	%o2
	movvc	%xcc,	%g2,	%g5
	sdivcc	%l2,	0x16D8,	%l3
	ldd	[%l7 + 0x20],	%f20
	movg	%xcc,	%i1,	%g1
	ldub	[%l7 + 0x57],	%i0
	umul	%i5,	0x0EBA,	%g6
	array16	%l6,	%g7,	%o6
	stb	%o0,	[%l7 + 0x40]
	sethi	0x04DC,	%o3
	sdivcc	%g3,	0x1714,	%i6
	fmovde	%xcc,	%f22,	%f2
	fornot2	%f8,	%f10,	%f20
	udivcc	%g4,	0x06A4,	%l4
	ldd	[%l7 + 0x78],	%f28
	sethi	0x1234,	%i4
	fmovsvs	%xcc,	%f13,	%f1
	movge	%xcc,	%i3,	%o1
	fandnot2	%f30,	%f4,	%f2
	sdivcc	%l5,	0x16D6,	%o7
	addc	%l0,	0x08D2,	%i2
	movl	%xcc,	%o4,	%o5
	movvs	%icc,	%l1,	%o2
	stw	%g2,	[%l7 + 0x4C]
	edge8	%i7,	%l2,	%g5
	xnor	%l3,	%i1,	%i0
	fnand	%f22,	%f2,	%f22
	array16	%i5,	%g6,	%l6
	srax	%g1,	0x1A,	%g7
	mulscc	%o6,	0x1CC2,	%o3
	ldd	[%l7 + 0x48],	%g2
	edge32n	%o0,	%g4,	%l4
	fxor	%f26,	%f30,	%f30
	ldx	[%l7 + 0x68],	%i4
	srl	%i6,	%o1,	%i3
	sdivx	%l5,	0x0C52,	%o7
	sdivx	%i2,	0x0B41,	%l0
	udivcc	%o4,	0x02B1,	%o5
	movrne	%l1,	%o2,	%i7
	sdivx	%l2,	0x0D1B,	%g2
	array16	%l3,	%g5,	%i0
	subccc	%i1,	0x19AD,	%g6
	fmovscc	%xcc,	%f0,	%f17
	sub	%l6,	0x0412,	%i5
	movre	%g1,	%o6,	%o3
	fandnot1	%f30,	%f20,	%f20
	movrgez	%g3,	0x1FD,	%o0
	fmovscs	%xcc,	%f8,	%f16
	movn	%xcc,	%g7,	%l4
	fmul8x16	%f5,	%f2,	%f16
	stx	%i4,	[%l7 + 0x40]
	stx	%g4,	[%l7 + 0x18]
	ldsh	[%l7 + 0x0C],	%o1
	fpadd32	%f12,	%f22,	%f22
	restore %i3, %i6, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l5,	%l0,	%o4
	sll	%o5,	0x05,	%l1
	save %o2, 0x1D0F, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i2,	0x12,	%l2
	std	%f26,	[%l7 + 0x18]
	move	%xcc,	%l3,	%g2
	edge32n	%g5,	%i0,	%g6
	andn	%i1,	%l6,	%i5
	fmovsgu	%icc,	%f5,	%f9
	fcmpne32	%f0,	%f4,	%o6
	fmul8x16	%f12,	%f24,	%f26
	edge32	%g1,	%g3,	%o0
	ldx	[%l7 + 0x20],	%o3
	movleu	%xcc,	%g7,	%i4
	ldsw	[%l7 + 0x3C],	%l4
	movgu	%xcc,	%g4,	%o1
	fmovda	%icc,	%f2,	%f31
	fpadd32	%f8,	%f6,	%f0
	srax	%i3,	%o7,	%i6
	popc	0x10F6,	%l0
	fsrc1s	%f11,	%f25
	fors	%f11,	%f9,	%f7
	movg	%xcc,	%l5,	%o5
	udivcc	%l1,	0x03A4,	%o2
	fmovse	%xcc,	%f17,	%f7
	edge16l	%i7,	%o4,	%l2
	movvs	%xcc,	%l3,	%i2
	umul	%g5,	0x1476,	%i0
	fcmpeq32	%f20,	%f18,	%g2
	fcmpgt32	%f6,	%f14,	%i1
	ldd	[%l7 + 0x68],	%i6
	nop
	set	0x49, %o3
	stb	%i5,	[%l7 + %o3]
	pdist	%f16,	%f16,	%f12
	popc	0x0223,	%g6
	subc	%g1,	%g3,	%o6
	lduw	[%l7 + 0x78],	%o0
	srax	%g7,	%o3,	%l4
	fmovrslz	%i4,	%f24,	%f17
	movg	%icc,	%o1,	%g4
	movneg	%xcc,	%i3,	%i6
	movl	%icc,	%o7,	%l5
	st	%f3,	[%l7 + 0x6C]
	fmovs	%f19,	%f15
	sra	%l0,	0x07,	%o5
	lduw	[%l7 + 0x48],	%o2
	andcc	%l1,	%o4,	%i7
	movrgez	%l3,	0x313,	%i2
	fpsub32	%f26,	%f30,	%f18
	sllx	%l2,	0x1F,	%i0
	umul	%g5,	0x1A58,	%i1
	fsrc1	%f10,	%f26
	edge32n	%g2,	%l6,	%i5
	fmovsn	%xcc,	%f23,	%f30
	fxors	%f21,	%f28,	%f0
	edge16n	%g1,	%g3,	%o6
	edge16l	%o0,	%g6,	%o3
	movpos	%icc,	%l4,	%i4
	ldsb	[%l7 + 0x60],	%g7
	sdiv	%o1,	0x086E,	%i3
	and	%g4,	0x0A06,	%o7
	ldd	[%l7 + 0x28],	%i6
	fmovsgu	%xcc,	%f6,	%f31
	srax	%l0,	0x18,	%o5
	movneg	%xcc,	%l5,	%o2
	and	%l1,	%i7,	%l3
	fornot2s	%f12,	%f1,	%f30
	fmovdg	%xcc,	%f13,	%f28
	mova	%xcc,	%o4,	%i2
	mulx	%l2,	%g5,	%i1
	sdiv	%i0,	0x0242,	%l6
	sdivx	%i5,	0x15AE,	%g1
	andncc	%g2,	%g3,	%o0
	fmovsg	%icc,	%f10,	%f27
	edge16ln	%o6,	%o3,	%g6
	sll	%l4,	0x11,	%g7
	movvc	%xcc,	%o1,	%i3
	movrgz	%i4,	0x0D9,	%g4
	fands	%f4,	%f29,	%f18
	edge16l	%o7,	%i6,	%l0
	array32	%o5,	%l5,	%l1
	srax	%o2,	0x16,	%l3
	save %i7, %i2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l2,	%g5,	%i1
	edge32l	%l6,	%i5,	%g1
	movn	%xcc,	%g2,	%g3
	edge16l	%o0,	%i0,	%o3
	sethi	0x1C25,	%o6
	sll	%l4,	0x17,	%g6
	fmovdneg	%icc,	%f29,	%f16
	fsrc1	%f8,	%f20
	movrgez	%g7,	0x0BF,	%o1
	movvs	%xcc,	%i4,	%i3
	sdivcc	%o7,	0x0660,	%g4
	stb	%i6,	[%l7 + 0x31]
	andn	%o5,	0x0493,	%l0
	stx	%l5,	[%l7 + 0x40]
	array32	%l1,	%o2,	%l3
	sub	%i2,	%o4,	%i7
	orn	%l2,	0x02D7,	%g5
	movrlz	%l6,	0x32A,	%i1
	stx	%g1,	[%l7 + 0x40]
	fnor	%f12,	%f30,	%f14
	orn	%g2,	%g3,	%i5
	edge32	%i0,	%o0,	%o6
	orncc	%o3,	0x1675,	%g6
	sub	%g7,	0x0206,	%l4
	mulscc	%i4,	%o1,	%o7
	fpadd32s	%f13,	%f29,	%f25
	movle	%xcc,	%g4,	%i3
	mova	%xcc,	%o5,	%l0
	mulscc	%i6,	0x1C14,	%l5
	addccc	%l1,	0x0462,	%o2
	xnorcc	%i2,	%o4,	%l3
	sra	%i7,	0x1D,	%g5
	movle	%xcc,	%l6,	%i1
	sth	%g1,	[%l7 + 0x58]
	movre	%l2,	%g2,	%i5
	ldub	[%l7 + 0x51],	%g3
	fandnot1s	%f4,	%f18,	%f17
	edge32l	%o0,	%o6,	%i0
	alignaddrl	%o3,	%g6,	%l4
	edge8	%g7,	%i4,	%o7
	ldsh	[%l7 + 0x20],	%g4
	edge32	%o1,	%o5,	%i3
	sdiv	%l0,	0x0185,	%l5
	andcc	%i6,	%o2,	%i2
	ldsb	[%l7 + 0x3E],	%l1
	movcc	%xcc,	%l3,	%i7
	alignaddrl	%g5,	%l6,	%o4
	alignaddr	%g1,	%l2,	%i1
	ldd	[%l7 + 0x38],	%g2
	ldsw	[%l7 + 0x14],	%i5
	orcc	%g3,	%o0,	%o6
	movneg	%icc,	%i0,	%o3
	movcc	%xcc,	%l4,	%g6
	movvc	%xcc,	%g7,	%o7
	movn	%xcc,	%i4,	%g4
	sub	%o1,	0x00B3,	%o5
	stb	%l0,	[%l7 + 0x1B]
	fnands	%f12,	%f12,	%f18
	sll	%i3,	0x15,	%i6
	movrgz	%l5,	0x1F8,	%o2
	movcc	%xcc,	%i2,	%l3
	fxnor	%f28,	%f22,	%f12
	sethi	0x0F76,	%l1
	fmovsn	%icc,	%f0,	%f29
	subccc	%i7,	0x17AC,	%l6
	edge32l	%g5,	%g1,	%o4
	std	%f16,	[%l7 + 0x60]
	fnot2s	%f23,	%f13
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	sll	%l2,	0x04,	%g3
	ldsb	[%l7 + 0x09],	%o0
	udivx	%o6,	0x09D9,	%o3
	std	%f26,	[%l7 + 0x78]
	edge32l	%l4,	%i0,	%g7
	ldsh	[%l7 + 0x64],	%g6
	movrlez	%i4,	%g4,	%o7
	smulcc	%o1,	%o5,	%l0
	movrlez	%i3,	0x1E8,	%i6
	restore %o2, 0x02FA, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l5,	0x01,	%l1
	mulx	%l3,	%i7,	%l6
	sll	%g1,	%g5,	%o4
	ldd	[%l7 + 0x68],	%g2
	fmovrdgz	%i5,	%f24,	%f8
	subc	%l2,	%g3,	%o0
	udivx	%i1,	0x08E2,	%o3
	sra	%o6,	0x1A,	%i0
	lduw	[%l7 + 0x74],	%g7
	save %g6, 0x1DD8, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%g4,	%o7
	fmovsa	%xcc,	%f23,	%f28
	udivx	%l4,	0x10EB,	%o1
	sub	%l0,	%o5,	%i3
	movvc	%icc,	%o2,	%i6
	st	%f9,	[%l7 + 0x74]
	ld	[%l7 + 0x6C],	%f15
	popc	0x1527,	%l5
	xnorcc	%i2,	0x0D8B,	%l3
	array32	%l1,	%i7,	%g1
	edge16	%g5,	%l6,	%g2
	addcc	%i5,	%l2,	%g3
	movge	%xcc,	%o4,	%i1
	ld	[%l7 + 0x50],	%f7
	edge8ln	%o3,	%o0,	%i0
	udivx	%g7,	0x0FE2,	%o6
	umulcc	%i4,	0x059A,	%g4
	sth	%g6,	[%l7 + 0x72]
	fands	%f11,	%f30,	%f11
	sir	0x00DC
	fmovdge	%icc,	%f13,	%f12
	stb	%l4,	[%l7 + 0x70]
	movvc	%icc,	%o1,	%o7
	movne	%icc,	%l0,	%i3
	sdivx	%o5,	0x1445,	%i6
	sdivcc	%l5,	0x1CCE,	%o2
	movrne	%l3,	0x292,	%i2
	and	%l1,	%g1,	%i7
	movne	%icc,	%g5,	%g2
	movne	%icc,	%i5,	%l2
	add	%l6,	%g3,	%i1
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%o2
	fmovse	%icc,	%f29,	%f16
	udivx	%o4,	0x18B4,	%o0
	array32	%i0,	%o6,	%g7
	fmovda	%icc,	%f6,	%f12
	std	%f16,	[%l7 + 0x10]
	sdiv	%g4,	0x197F,	%i4
	alignaddrl	%l4,	%g6,	%o7
	fcmple32	%f6,	%f26,	%l0
	smulcc	%o1,	%i3,	%o5
	srlx	%l5,	%o2,	%l3
	movcs	%icc,	%i2,	%l1
	ld	[%l7 + 0x78],	%f31
	xnor	%i6,	0x1ECD,	%g1
	edge8l	%i7,	%g5,	%g2
	fpadd32	%f12,	%f8,	%f12
	lduw	[%l7 + 0x28],	%i5
	ldsb	[%l7 + 0x5F],	%l2
	move	%icc,	%l6,	%g3
	stw	%o3,	[%l7 + 0x54]
	stw	%i1,	[%l7 + 0x2C]
	mulx	%o0,	0x07CD,	%o4
	fcmpd	%fcc1,	%f26,	%f20
	st	%f5,	[%l7 + 0x3C]
	movne	%xcc,	%o6,	%i0
	fmovse	%xcc,	%f16,	%f28
	mova	%icc,	%g7,	%i4
	movcc	%xcc,	%l4,	%g4
	fpadd16s	%f18,	%f27,	%f22
	mova	%icc,	%g6,	%l0
	sub	%o7,	0x0138,	%i3
	move	%xcc,	%o5,	%l5
	xor	%o2,	0x001F,	%l3
	movle	%xcc,	%o1,	%i2
	xnorcc	%l1,	%g1,	%i7
	edge8l	%i6,	%g5,	%g2
	movleu	%icc,	%i5,	%l2
	movrgz	%l6,	%o3,	%g3
	alignaddrl	%i1,	%o4,	%o6
	sllx	%i0,	0x1C,	%g7
	movn	%xcc,	%i4,	%l4
	add	%g4,	0x094E,	%g6
	udivcc	%o0,	0x179C,	%o7
	fcmpne16	%f0,	%f4,	%l0
	fpsub16	%f8,	%f14,	%f10
	lduw	[%l7 + 0x70],	%o5
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	fsrc2s	%f31,	%f15
	movpos	%xcc,	%o1,	%i3
	sll	%i2,	0x16,	%l1
	fcmpgt16	%f8,	%f14,	%g1
	fandnot2s	%f23,	%f27,	%f7
	ldd	[%l7 + 0x18],	%i6
	movpos	%xcc,	%g5,	%g2
	movpos	%icc,	%i6,	%l2
	ldd	[%l7 + 0x40],	%f16
	udivx	%i5,	0x0358,	%o3
	array16	%g3,	%l6,	%o4
	fcmpne32	%f6,	%f16,	%o6
	edge32ln	%i1,	%g7,	%i4
	fone	%f24
	edge8ln	%l4,	%g4,	%g6
	ldd	[%l7 + 0x40],	%f30
	alignaddrl	%o0,	%o7,	%l0
	sllx	%o5,	0x1A,	%l5
	ldx	[%l7 + 0x38],	%i0
	bshuffle	%f26,	%f14,	%f14
	fnot2	%f10,	%f30
	ldd	[%l7 + 0x10],	%f22
	xnor	%l3,	%o2,	%o1
	edge32l	%i2,	%l1,	%i3
	fpsub32s	%f19,	%f24,	%f19
	sdivcc	%g1,	0x1E8F,	%i7
	ld	[%l7 + 0x08],	%f22
	fmovrdgez	%g2,	%f2,	%f28
	smulcc	%i6,	%g5,	%i5
	sllx	%l2,	%o3,	%l6
	edge16	%g3,	%o6,	%i1
	udivx	%o4,	0x0AAF,	%i4
	fmovrslz	%g7,	%f11,	%f18
	orn	%g4,	%l4,	%g6
	fnors	%f8,	%f20,	%f4
	xorcc	%o7,	%o0,	%o5
	movvc	%icc,	%l0,	%l5
	addccc	%i0,	0x1023,	%o2
	movrgez	%o1,	%l3,	%l1
	movl	%icc,	%i3,	%g1
	fmovsne	%xcc,	%f12,	%f21
	fmovsgu	%icc,	%f10,	%f10
	movvc	%icc,	%i2,	%i7
	movleu	%icc,	%g2,	%g5
	srlx	%i5,	0x0E,	%l2
	movcs	%icc,	%i6,	%o3
	movpos	%icc,	%l6,	%g3
	alignaddrl	%i1,	%o6,	%i4
	edge16	%g7,	%o4,	%g4
	fmovspos	%xcc,	%f19,	%f1
	sllx	%g6,	%o7,	%l4
	movre	%o0,	%o5,	%l5
	fxors	%f19,	%f26,	%f14
	sub	%l0,	%o2,	%i0
	fmovs	%f17,	%f17
	fmovsleu	%xcc,	%f18,	%f15
	sllx	%o1,	%l1,	%i3
	fornot1	%f4,	%f12,	%f14
	movl	%xcc,	%l3,	%i2
	fpsub16	%f2,	%f28,	%f20
	move	%icc,	%g1,	%g2
	fcmpd	%fcc3,	%f0,	%f28
	sdivx	%g5,	0x030E,	%i7
	add	%i5,	0x1FA6,	%l2
	ldsw	[%l7 + 0x0C],	%i6
	edge16	%l6,	%g3,	%i1
	ld	[%l7 + 0x4C],	%f30
	srl	%o6,	0x07,	%o3
	andcc	%i4,	%o4,	%g4
	edge16	%g6,	%g7,	%l4
	movrne	%o7,	%o0,	%l5
	ld	[%l7 + 0x74],	%f5
	fmovdge	%xcc,	%f3,	%f4
	nop
	set	0x2C, %o2
	ldub	[%l7 + %o2],	%o5
	smul	%o2,	%i0,	%l0
	nop
	set	0x30, %g1
	ldd	[%l7 + %g1],	%f30
	popc	%l1,	%o1
	movg	%xcc,	%l3,	%i2
	movne	%icc,	%g1,	%i3
	sra	%g5,	%g2,	%i5
	fmovsgu	%xcc,	%f3,	%f22
	edge32n	%i7,	%l2,	%l6
	fmovsg	%icc,	%f16,	%f10
	fmovspos	%xcc,	%f20,	%f23
	andcc	%g3,	0x0BDC,	%i1
	edge32ln	%o6,	%i6,	%i4
	xor	%o3,	0x05BC,	%g4
	movrlez	%o4,	0x1D9,	%g6
	edge16ln	%g7,	%l4,	%o0
	sethi	0x12B6,	%o7
	lduw	[%l7 + 0x6C],	%o5
	movle	%icc,	%l5,	%o2
	movrgz	%l0,	0x2FD,	%i0
	nop
	set	0x51, %l4
	ldsb	[%l7 + %l4],	%o1
	fnor	%f0,	%f20,	%f22
	ldsb	[%l7 + 0x62],	%l3
	movl	%icc,	%i2,	%g1
	or	%l1,	0x0EBB,	%g5
	ldsw	[%l7 + 0x44],	%i3
	fmovsn	%icc,	%f8,	%f15
	fnands	%f27,	%f26,	%f3
	movre	%i5,	%g2,	%l2
	fzeros	%f16
	fmovrse	%i7,	%f9,	%f27
	stb	%l6,	[%l7 + 0x34]
	fmovdleu	%icc,	%f28,	%f31
	ldsb	[%l7 + 0x29],	%g3
	movleu	%icc,	%o6,	%i6
	fmovrsgz	%i1,	%f28,	%f7
	fnot2	%f20,	%f18
	subc	%i4,	0x00C6,	%g4
	udivx	%o4,	0x093C,	%o3
	movle	%icc,	%g7,	%g6
	srl	%o0,	0x1F,	%l4
	andncc	%o7,	%o5,	%o2
	xor	%l0,	0x17A2,	%i0
	umulcc	%l5,	0x13D4,	%o1
	mulx	%l3,	%g1,	%i2
	add	%l1,	%i3,	%g5
	edge16ln	%g2,	%i5,	%l2
	movrlz	%i7,	%g3,	%l6
	save %o6, %i6, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i4,	0x05FF,	%g4
	smul	%o3,	%o4,	%g6
	array16	%g7,	%o0,	%l4
	fors	%f26,	%f13,	%f1
	movn	%xcc,	%o7,	%o5
	movg	%icc,	%l0,	%i0
	sethi	0x0CB5,	%l5
	fmovsneg	%xcc,	%f30,	%f4
	andcc	%o1,	%o2,	%g1
	movrgz	%i2,	%l1,	%l3
	movle	%xcc,	%g5,	%g2
	stw	%i3,	[%l7 + 0x40]
	stb	%i5,	[%l7 + 0x7C]
	pdist	%f8,	%f30,	%f22
	andcc	%i7,	0x132F,	%l2
	sir	0x08D2
	addcc	%l6,	0x1A1D,	%g3
	movneg	%icc,	%o6,	%i1
	fmul8x16au	%f18,	%f31,	%f28
	stx	%i6,	[%l7 + 0x10]
	andncc	%g4,	%o3,	%o4
	movle	%icc,	%g6,	%i4
	movne	%icc,	%o0,	%g7
	array32	%o7,	%o5,	%l4
	movl	%icc,	%i0,	%l5
	fcmpeq16	%f30,	%f22,	%o1
	fmovrslez	%l0,	%f15,	%f30
	movrlez	%g1,	0x107,	%i2
	bshuffle	%f0,	%f18,	%f12
	array16	%l1,	%l3,	%g5
	andn	%o2,	%g2,	%i5
	fmovrdgz	%i3,	%f30,	%f12
	fcmple16	%f24,	%f14,	%i7
	edge16	%l6,	%l2,	%g3
	sethi	0x1CCD,	%i1
	edge32l	%o6,	%i6,	%o3
	sethi	0x10B5,	%g4
	fmul8x16al	%f19,	%f2,	%f16
	fcmpeq32	%f16,	%f18,	%o4
	sethi	0x0EE0,	%g6
	fmovdpos	%icc,	%f7,	%f30
	movle	%xcc,	%o0,	%i4
	subccc	%o7,	%o5,	%g7
	movge	%xcc,	%i0,	%l5
	add	%l4,	%o1,	%l0
	movneg	%icc,	%i2,	%g1
	edge16ln	%l1,	%g5,	%o2
	fcmpgt16	%f26,	%f4,	%g2
	srax	%l3,	0x1E,	%i5
	array32	%i7,	%i3,	%l2
	fors	%f3,	%f1,	%f9
	addccc	%l6,	%g3,	%i1
	movrlz	%i6,	%o3,	%g4
	nop
	set	0x7C, %g2
	stw	%o6,	[%l7 + %g2]
	xorcc	%g6,	%o4,	%i4
	udivcc	%o0,	0x1A06,	%o5
	std	%f24,	[%l7 + 0x58]
	sir	0x1E43
	fmovdleu	%xcc,	%f12,	%f12
	sdivcc	%g7,	0x1A35,	%o7
	fxors	%f2,	%f31,	%f28
	fmovda	%icc,	%f9,	%f11
	stb	%i0,	[%l7 + 0x47]
	lduh	[%l7 + 0x78],	%l5
	fpack16	%f0,	%f31
	xorcc	%o1,	0x026B,	%l0
	movgu	%icc,	%l4,	%i2
	sir	0x1804
	movrgz	%g1,	%l1,	%g5
	orncc	%o2,	0x183E,	%g2
	fnor	%f4,	%f18,	%f8
	fmovdvc	%xcc,	%f24,	%f28
	fmovdle	%xcc,	%f20,	%f2
	sra	%i5,	%i7,	%l3
	addc	%l2,	0x1C28,	%i3
	stw	%g3,	[%l7 + 0x58]
	fmovdn	%xcc,	%f11,	%f5
	fmovscc	%icc,	%f1,	%f15
	ldub	[%l7 + 0x39],	%i1
	xnorcc	%i6,	%o3,	%g4
	ldsh	[%l7 + 0x08],	%o6
	edge8ln	%l6,	%o4,	%g6
	mulscc	%i4,	%o0,	%o5
	movge	%icc,	%o7,	%g7
	sra	%i0,	0x0E,	%l5
	movrgz	%o1,	%l4,	%i2
	fcmps	%fcc2,	%f0,	%f21
	udivx	%g1,	0x0F62,	%l1
	movcs	%xcc,	%g5,	%o2
	orn	%l0,	0x06CC,	%g2
	fmovrse	%i5,	%f31,	%f8
	sethi	0x0B82,	%i7
	fsrc1	%f24,	%f20
	xnor	%l3,	0x0A51,	%l2
	fmul8x16al	%f0,	%f8,	%f6
	sll	%i3,	%g3,	%i6
	orncc	%i1,	%g4,	%o3
	ld	[%l7 + 0x68],	%f26
	fcmpgt32	%f12,	%f2,	%l6
	movvc	%icc,	%o4,	%g6
	ldsb	[%l7 + 0x25],	%o6
	movleu	%icc,	%o0,	%i4
	popc	0x131F,	%o5
	subccc	%g7,	0x170B,	%i0
	save %o7, %o1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f18,	%f10,	%f28
	movleu	%xcc,	%l5,	%g1
	andn	%i2,	0x05E1,	%l1
	edge16	%o2,	%g5,	%g2
	mova	%xcc,	%i5,	%l0
	umul	%l3,	%l2,	%i3
	ld	[%l7 + 0x3C],	%f2
	orcc	%i7,	%g3,	%i1
	movcs	%icc,	%i6,	%g4
	addc	%o3,	0x0543,	%o4
	xor	%g6,	%o6,	%o0
	array16	%i4,	%o5,	%l6
	subcc	%g7,	%i0,	%o7
	movle	%icc,	%l4,	%o1
	movrne	%g1,	0x0BF,	%l5
	mulscc	%l1,	0x096C,	%i2
	xorcc	%g5,	%g2,	%i5
	fmovsne	%icc,	%f14,	%f5
	smulcc	%o2,	%l3,	%l0
	fpmerge	%f20,	%f13,	%f14
	movleu	%icc,	%i3,	%l2
	edge32n	%g3,	%i1,	%i6
	movgu	%icc,	%g4,	%o3
	and	%o4,	0x19F6,	%i7
	umul	%g6,	0x1429,	%o6
	array32	%o0,	%i4,	%l6
	srax	%g7,	%o5,	%o7
	std	%f4,	[%l7 + 0x40]
	mova	%icc,	%l4,	%o1
	movvs	%xcc,	%g1,	%l5
	stx	%i0,	[%l7 + 0x28]
	edge32ln	%i2,	%g5,	%g2
	movleu	%xcc,	%i5,	%o2
	edge32	%l1,	%l0,	%l3
	ld	[%l7 + 0x78],	%f6
	sra	%l2,	%g3,	%i1
	movcc	%xcc,	%i3,	%i6
	nop
	set	0x3F, %i4
	ldub	[%l7 + %i4],	%o3
	stw	%o4,	[%l7 + 0x30]
	fmovs	%f16,	%f31
	sub	%i7,	0x1E22,	%g4
	movrlz	%g6,	0x2B4,	%o0
	or	%i4,	%o6,	%l6
	movvs	%xcc,	%g7,	%o7
	movpos	%xcc,	%l4,	%o5
	fmul8sux16	%f16,	%f24,	%f16
	umulcc	%o1,	0x1C43,	%g1
	fpackfix	%f22,	%f27
	edge32n	%i0,	%l5,	%g5
	umul	%g2,	%i5,	%i2
	fnands	%f13,	%f5,	%f19
	addc	%o2,	0x0618,	%l0
	fmovdvc	%icc,	%f2,	%f19
	movn	%xcc,	%l3,	%l2
	fpadd32	%f12,	%f30,	%f4
	sdivcc	%g3,	0x0813,	%i1
	alignaddrl	%i3,	%i6,	%o3
	std	%f6,	[%l7 + 0x78]
	sir	0x12EA
	ldsh	[%l7 + 0x78],	%l1
	movneg	%icc,	%i7,	%g4
	sth	%o4,	[%l7 + 0x56]
	stx	%g6,	[%l7 + 0x40]
	lduw	[%l7 + 0x3C],	%i4
	ldd	[%l7 + 0x20],	%f26
	movrgz	%o6,	0x362,	%l6
	sir	0x1935
	subcc	%o0,	%o7,	%g7
	andn	%o5,	%l4,	%o1
	sdivx	%g1,	0x101C,	%i0
	edge16n	%g5,	%g2,	%l5
	bshuffle	%f18,	%f16,	%f16
	movcc	%xcc,	%i5,	%i2
	movvc	%xcc,	%l0,	%o2
	sdivx	%l3,	0x0C13,	%l2
	subc	%i1,	0x0A91,	%i3
	fsrc2s	%f29,	%f30
	ldsw	[%l7 + 0x58],	%i6
	movne	%xcc,	%o3,	%g3
	mulscc	%i7,	%l1,	%o4
	lduh	[%l7 + 0x46],	%g4
	fnor	%f12,	%f6,	%f4
	edge16l	%i4,	%g6,	%o6
	fpadd16	%f16,	%f24,	%f16
	array8	%o0,	%l6,	%o7
	srlx	%o5,	0x1E,	%l4
	fnand	%f30,	%f10,	%f26
	movleu	%xcc,	%o1,	%g7
	movcs	%icc,	%g1,	%g5
	ldx	[%l7 + 0x18],	%i0
	fpadd32s	%f21,	%f11,	%f27
	edge8l	%g2,	%i5,	%i2
	edge16l	%l5,	%l0,	%o2
	sdiv	%l3,	0x1EAB,	%i1
	movvs	%xcc,	%i3,	%l2
	movpos	%icc,	%o3,	%i6
	ldsw	[%l7 + 0x74],	%i7
	edge32	%l1,	%o4,	%g4
	stw	%i4,	[%l7 + 0x30]
	edge16n	%g6,	%o6,	%o0
	ldx	[%l7 + 0x20],	%l6
	fmovrse	%g3,	%f9,	%f21
	ldub	[%l7 + 0x41],	%o7
	edge8ln	%o5,	%o1,	%g7
	sllx	%g1,	%g5,	%l4
	movl	%xcc,	%i0,	%g2
	alignaddrl	%i5,	%i2,	%l5
	fcmpeq32	%f0,	%f18,	%o2
	subc	%l3,	0x186C,	%l0
	mova	%icc,	%i3,	%l2
	restore %o3, %i1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i6,	0x0FA2,	%l1
	orcc	%g4,	0x0508,	%i4
	edge32n	%o4,	%g6,	%o6
	udiv	%l6,	0x07A6,	%o0
	movre	%o7,	%o5,	%g3
	array8	%o1,	%g7,	%g5
	andn	%l4,	%g1,	%g2
	sdivcc	%i5,	0x0FA6,	%i2
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	udivx	%l5,	0x1150,	%l0
	edge32l	%l3,	%i3,	%o3
	fsrc1	%f30,	%f20
	andncc	%i1,	%i7,	%l2
	addccc	%i6,	%g4,	%l1
	lduw	[%l7 + 0x3C],	%i4
	fcmple32	%f16,	%f16,	%o4
	fpadd32	%f12,	%f12,	%f18
	udivcc	%o6,	0x0720,	%g6
	sth	%l6,	[%l7 + 0x32]
	save %o7, %o5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o1,	%o0,	%g7
	edge16l	%g5,	%l4,	%g1
	udiv	%i5,	0x14CA,	%g2
	movgu	%xcc,	%i2,	%i0
	ldd	[%l7 + 0x70],	%l4
	udiv	%l0,	0x12E8,	%l3
	alignaddr	%o2,	%o3,	%i3
	stb	%i7,	[%l7 + 0x73]
	sra	%i1,	0x1C,	%i6
	fcmpne32	%f12,	%f10,	%g4
	ld	[%l7 + 0x34],	%f29
	movg	%xcc,	%l1,	%l2
	movgu	%xcc,	%i4,	%o6
	addccc	%g6,	%l6,	%o4
	orncc	%o7,	0x116C,	%o5
	edge16n	%g3,	%o0,	%o1
	udivcc	%g7,	0x1830,	%g5
	movcs	%xcc,	%g1,	%l4
	xor	%g2,	%i2,	%i5
	fmovdle	%icc,	%f27,	%f9
	movcc	%icc,	%i0,	%l5
	sethi	0x1836,	%l3
	smulcc	%o2,	%l0,	%i3
	orncc	%o3,	0x1F1A,	%i1
	smul	%i6,	0x1057,	%g4
	edge32n	%l1,	%i7,	%i4
	ldx	[%l7 + 0x30],	%l2
	ldsb	[%l7 + 0x6A],	%o6
	fands	%f18,	%f6,	%f4
	movge	%xcc,	%g6,	%o4
	mulscc	%l6,	0x1B2C,	%o5
	sdivcc	%o7,	0x1BA6,	%o0
	edge32ln	%o1,	%g7,	%g3
	fcmple16	%f26,	%f26,	%g5
	edge32n	%l4,	%g1,	%g2
	srl	%i5,	%i0,	%l5
	addcc	%i2,	%l3,	%o2
	andcc	%l0,	%o3,	%i3
	addcc	%i6,	0x00CF,	%i1
	smulcc	%g4,	0x1A23,	%i7
	smulcc	%l1,	0x19AC,	%l2
	srax	%i4,	%g6,	%o6
	fmovsl	%xcc,	%f21,	%f22
	addcc	%o4,	0x1396,	%l6
	umul	%o5,	0x08F6,	%o0
	andn	%o7,	%o1,	%g3
	movre	%g7,	0x076,	%g5
	edge8l	%l4,	%g2,	%i5
	nop
	set	0x12, %i0
	sth	%g1,	[%l7 + %i0]
	movle	%xcc,	%i0,	%l5
	edge32ln	%i2,	%o2,	%l3
	smul	%l0,	%i3,	%o3
	srax	%i6,	%i1,	%i7
	st	%f8,	[%l7 + 0x30]
	edge32n	%g4,	%l1,	%l2
	array16	%g6,	%o6,	%o4
	udivx	%i4,	0x0F27,	%o5
	movre	%l6,	%o7,	%o0
	fpsub32	%f18,	%f0,	%f24
	movrlez	%o1,	%g7,	%g3
	fpadd32s	%f24,	%f31,	%f22
	sra	%g5,	%g2,	%i5
	movrlez	%l4,	0x09C,	%i0
	edge32ln	%g1,	%i2,	%l5
	array32	%o2,	%l0,	%l3
	std	%f0,	[%l7 + 0x30]
	lduw	[%l7 + 0x50],	%i3
	ldsh	[%l7 + 0x2A],	%o3
	edge8ln	%i1,	%i7,	%i6
	fxnor	%f24,	%f16,	%f12
	movvs	%xcc,	%g4,	%l1
	movvs	%icc,	%l2,	%o6
	andncc	%g6,	%i4,	%o5
	movge	%icc,	%l6,	%o4
	sra	%o0,	%o7,	%g7
	movvs	%icc,	%o1,	%g3
	umul	%g2,	0x1FF9,	%i5
	nop
	set	0x0C, %g6
	lduw	[%l7 + %g6],	%g5
	or	%l4,	0x1574,	%g1
	edge8n	%i0,	%l5,	%o2
	movneg	%xcc,	%l0,	%i2
	fcmps	%fcc1,	%f2,	%f31
	alignaddr	%i3,	%o3,	%i1
	fcmpgt16	%f6,	%f18,	%l3
	udiv	%i7,	0x0E2A,	%g4
	sdivcc	%l1,	0x1170,	%l2
	mulscc	%i6,	0x03E0,	%o6
	edge32n	%g6,	%o5,	%i4
	lduh	[%l7 + 0x3E],	%l6
	addccc	%o0,	%o4,	%o7
	lduw	[%l7 + 0x14],	%g7
	subcc	%g3,	0x1723,	%o1
	fmuld8ulx16	%f19,	%f3,	%f2
	movcc	%xcc,	%i5,	%g5
	movcc	%icc,	%g2,	%l4
	movleu	%icc,	%g1,	%i0
	fcmpne16	%f26,	%f16,	%o2
	movrgz	%l0,	0x3E2,	%i2
	subc	%i3,	0x0163,	%o3
	std	%f10,	[%l7 + 0x58]
	ldd	[%l7 + 0x68],	%f2
	edge16l	%i1,	%l3,	%l5
	edge16n	%g4,	%l1,	%i7
	save %i6, 0x1ECD, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f30,	[%l7 + 0x08]
	movvc	%icc,	%l2,	%g6
	xnor	%o5,	0x01EF,	%l6
	srlx	%i4,	0x0C,	%o4
	orncc	%o0,	0x149F,	%o7
	alignaddrl	%g7,	%g3,	%o1
	sllx	%i5,	%g2,	%l4
	ldsh	[%l7 + 0x54],	%g5
	mova	%icc,	%g1,	%i0
	fone	%f8
	movrlz	%l0,	%o2,	%i2
	smul	%o3,	0x1392,	%i1
	subccc	%l3,	%i3,	%l5
	fmovse	%xcc,	%f3,	%f24
	sra	%l1,	0x1D,	%g4
	movl	%icc,	%i7,	%i6
	sdivcc	%o6,	0x1324,	%l2
	edge32ln	%o5,	%g6,	%i4
	stw	%o4,	[%l7 + 0x08]
	smulcc	%l6,	0x0B2F,	%o0
	mulx	%g7,	%g3,	%o1
	ldx	[%l7 + 0x30],	%i5
	ld	[%l7 + 0x1C],	%f1
	stb	%o7,	[%l7 + 0x2A]
	srl	%g2,	%g5,	%g1
	movl	%icc,	%i0,	%l4
	srl	%l0,	0x1B,	%i2
	andn	%o2,	%o3,	%l3
	sdiv	%i1,	0x1D8E,	%l5
	edge8	%l1,	%i3,	%i7
	fmovsvs	%xcc,	%f17,	%f23
	fmovscs	%xcc,	%f11,	%f6
	alignaddr	%g4,	%o6,	%l2
	movvc	%xcc,	%o5,	%i6
	save %i4, 0x0ABD, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l6,	%g6,	%o0
	for	%f4,	%f20,	%f0
	fornot1s	%f23,	%f20,	%f30
	stx	%g3,	[%l7 + 0x70]
	movleu	%icc,	%g7,	%o1
	sdiv	%o7,	0x04B7,	%i5
	orcc	%g2,	0x0A43,	%g5
	sdivx	%g1,	0x18AC,	%i0
	array16	%l0,	%i2,	%o2
	fcmple16	%f12,	%f4,	%o3
	fmovscs	%xcc,	%f20,	%f9
	sdivx	%l3,	0x0C70,	%l4
	restore %i1, %l1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x7A],	%i7
	ldub	[%l7 + 0x35],	%l5
	fone	%f24
	edge32	%g4,	%l2,	%o6
	ldd	[%l7 + 0x10],	%i6
	alignaddr	%o5,	%o4,	%l6
	sll	%i4,	%g6,	%o0
	movrgez	%g3,	%g7,	%o1
	ldsh	[%l7 + 0x40],	%o7
	fmovsn	%icc,	%f9,	%f31
	st	%f4,	[%l7 + 0x78]
	fands	%f22,	%f26,	%f11
	smul	%g2,	0x0F58,	%g5
	movrlez	%g1,	0x055,	%i5
	fmovsgu	%xcc,	%f0,	%f26
	movre	%l0,	0x3CE,	%i2
	movle	%xcc,	%o2,	%o3
	add	%i0,	0x1609,	%l3
	fpadd32s	%f29,	%f6,	%f17
	alignaddr	%l4,	%l1,	%i3
	movne	%icc,	%i7,	%i1
	movle	%icc,	%g4,	%l5
	bshuffle	%f4,	%f4,	%f26
	fmuld8ulx16	%f9,	%f17,	%f14
	popc	0x0DD6,	%o6
	movrgz	%i6,	%o5,	%l2
	fpmerge	%f9,	%f22,	%f24
	edge8l	%o4,	%i4,	%l6
	add	%g6,	0x0F3F,	%o0
	movvc	%icc,	%g3,	%g7
	subccc	%o7,	%o1,	%g5
	ldsh	[%l7 + 0x56],	%g1
	add	%g2,	%l0,	%i5
	fsrc2	%f28,	%f16
	sethi	0x1873,	%o2
	fcmpeq16	%f30,	%f20,	%o3
	movleu	%icc,	%i2,	%l3
	xor	%i0,	0x01D0,	%l4
	fmovrde	%l1,	%f6,	%f4
	addccc	%i7,	%i3,	%g4
	move	%xcc,	%i1,	%o6
	edge8n	%l5,	%i6,	%l2
	fandnot2s	%f26,	%f31,	%f3
	fcmpgt16	%f14,	%f20,	%o4
	andcc	%o5,	%i4,	%g6
	fmovdle	%icc,	%f23,	%f13
	umulcc	%o0,	0x0270,	%g3
	udiv	%l6,	0x1F25,	%g7
	ldsw	[%l7 + 0x44],	%o7
	mulscc	%o1,	0x0539,	%g1
	srl	%g5,	%l0,	%i5
	sub	%g2,	%o3,	%o2
	udiv	%i2,	0x0A81,	%i0
	movn	%icc,	%l3,	%l4
	array16	%i7,	%l1,	%g4
	movleu	%xcc,	%i3,	%o6
	movne	%icc,	%l5,	%i1
	array8	%l2,	%o4,	%o5
	sth	%i6,	[%l7 + 0x7C]
	alignaddr	%i4,	%o0,	%g6
	alignaddr	%l6,	%g7,	%o7
	addccc	%g3,	%o1,	%g5
	st	%f10,	[%l7 + 0x3C]
	and	%l0,	%g1,	%g2
	stx	%o3,	[%l7 + 0x70]
	fmul8sux16	%f28,	%f10,	%f22
	mulx	%i5,	%o2,	%i2
	addccc	%i0,	0x1F38,	%l4
	edge8n	%i7,	%l1,	%g4
	fmul8sux16	%f10,	%f30,	%f16
	edge8	%i3,	%o6,	%l3
	edge8ln	%i1,	%l2,	%l5
	fcmpeq32	%f4,	%f4,	%o4
	lduh	[%l7 + 0x1E],	%o5
	fxor	%f26,	%f4,	%f26
	movge	%xcc,	%i4,	%i6
	movleu	%icc,	%o0,	%l6
	mova	%icc,	%g6,	%g7
	fone	%f18
	ldub	[%l7 + 0x7E],	%o7
	movg	%xcc,	%g3,	%g5
	lduw	[%l7 + 0x70],	%o1
	or	%g1,	0x0C27,	%l0
	xnor	%g2,	%i5,	%o3
	or	%o2,	%i0,	%i2
	smulcc	%i7,	%l4,	%l1
	movcc	%icc,	%g4,	%o6
	fpack16	%f26,	%f19
	movge	%xcc,	%l3,	%i3
	fpack32	%f28,	%f14,	%f22
	andn	%l2,	0x1C8C,	%l5
	srl	%i1,	%o5,	%o4
	mulscc	%i6,	%i4,	%o0
	lduw	[%l7 + 0x20],	%l6
	xnorcc	%g7,	0x1F8B,	%g6
	array32	%o7,	%g5,	%g3
	udivcc	%g1,	0x0C11,	%l0
	mulx	%o1,	0x1C2F,	%i5
	fornot2	%f8,	%f4,	%f24
	fcmpne16	%f16,	%f26,	%g2
	lduw	[%l7 + 0x08],	%o2
	movge	%icc,	%o3,	%i0
	stx	%i7,	[%l7 + 0x68]
	addccc	%l4,	%l1,	%g4
	ldx	[%l7 + 0x60],	%o6
	edge32	%i2,	%i3,	%l3
	subccc	%l5,	%l2,	%i1
	fmovsl	%xcc,	%f27,	%f19
	movcc	%xcc,	%o4,	%o5
	sllx	%i6,	0x01,	%i4
	fmovrse	%o0,	%f2,	%f20
	ld	[%l7 + 0x78],	%f14
	srl	%g7,	0x17,	%l6
	stw	%g6,	[%l7 + 0x74]
	edge8ln	%g5,	%o7,	%g1
	udivx	%l0,	0x05CC,	%g3
	fsrc2s	%f6,	%f25
	fmovdn	%xcc,	%f9,	%f20
	addc	%o1,	%i5,	%o2
	edge8n	%g2,	%o3,	%i0
	edge32n	%i7,	%l4,	%l1
	sllx	%g4,	%i2,	%o6
	fmovrsne	%i3,	%f25,	%f21
	edge8	%l3,	%l2,	%i1
	or	%l5,	%o4,	%i6
	alignaddrl	%o5,	%i4,	%o0
	fcmpne16	%f24,	%f12,	%g7
	xnorcc	%g6,	0x1D25,	%g5
	alignaddrl	%l6,	%o7,	%l0
	sra	%g3,	%o1,	%g1
	movrgez	%i5,	0x20E,	%g2
	ldd	[%l7 + 0x08],	%f10
	mulscc	%o2,	0x0567,	%o3
	smul	%i7,	0x07DC,	%i0
	fnegs	%f17,	%f13
	sir	0x06E6
	srlx	%l4,	%l1,	%g4
	ld	[%l7 + 0x2C],	%f29
	stx	%i2,	[%l7 + 0x60]
	array16	%o6,	%l3,	%i3
	siam	0x3
	fmul8x16al	%f17,	%f20,	%f16
	udivcc	%l2,	0x04C0,	%l5
	ldd	[%l7 + 0x40],	%o4
	movn	%xcc,	%i1,	%o5
	sdivcc	%i6,	0x1942,	%o0
	fmovdcc	%xcc,	%f8,	%f8
	fpadd32	%f26,	%f26,	%f8
	edge8n	%i4,	%g6,	%g5
	edge32	%l6,	%o7,	%g7
	fmovd	%f30,	%f30
	array8	%l0,	%g3,	%o1
	orncc	%i5,	%g2,	%g1
	edge16	%o3,	%o2,	%i7
	lduh	[%l7 + 0x4E],	%l4
	fcmpne32	%f26,	%f14,	%l1
	lduh	[%l7 + 0x72],	%i0
	sra	%g4,	0x0E,	%o6
	srlx	%l3,	0x07,	%i3
	fpadd16s	%f0,	%f22,	%f0
	movrlz	%i2,	0x1DB,	%l5
	smul	%o4,	0x0436,	%l2
	sdiv	%i1,	0x0260,	%o5
	fmovrsgz	%i6,	%f29,	%f3
	edge16	%o0,	%g6,	%g5
	mulscc	%i4,	0x0391,	%o7
	movcc	%xcc,	%l6,	%l0
	addcc	%g7,	%g3,	%i5
	sll	%g2,	%g1,	%o3
	fmovde	%icc,	%f7,	%f19
	ldd	[%l7 + 0x20],	%o2
	addc	%o1,	%i7,	%l4
	lduw	[%l7 + 0x4C],	%i0
	nop
	set	0x38, %g7
	ldsw	[%l7 + %g7],	%g4
	edge8n	%o6,	%l1,	%l3
	fmovd	%f20,	%f10
	fmovdn	%icc,	%f1,	%f2
	subc	%i3,	%l5,	%o4
	movvs	%xcc,	%i2,	%i1
	mulx	%l2,	0x1FE4,	%o5
	movg	%icc,	%o0,	%g6
	fmul8x16	%f30,	%f14,	%f28
	fxors	%f22,	%f0,	%f27
	movvs	%xcc,	%g5,	%i4
	udivcc	%o7,	0x0969,	%i6
	xorcc	%l6,	0x044E,	%l0
	fmovrdlz	%g7,	%f6,	%f26
	srl	%g3,	0x0E,	%i5
	umul	%g2,	0x1EA3,	%g1
	fpadd16s	%f27,	%f28,	%f23
	movrlz	%o2,	%o3,	%i7
	srl	%l4,	%o1,	%i0
	and	%o6,	%l1,	%g4
	addccc	%l3,	0x1213,	%i3
	subc	%o4,	%i2,	%i1
	fsrc1s	%f28,	%f2
	edge8l	%l5,	%l2,	%o5
	array8	%o0,	%g5,	%i4
	orncc	%g6,	%o7,	%l6
	addc	%i6,	%g7,	%l0
	st	%f26,	[%l7 + 0x48]
	fmovsge	%xcc,	%f30,	%f22
	movpos	%xcc,	%i5,	%g2
	fcmped	%fcc1,	%f24,	%f28
	fmul8x16al	%f29,	%f8,	%f22
	movrne	%g3,	0x238,	%o2
	edge32	%o3,	%g1,	%i7
	sth	%o1,	[%l7 + 0x5C]
	movleu	%xcc,	%i0,	%o6
	movrlez	%l1,	0x273,	%l4
	fmovs	%f7,	%f6
	subccc	%g4,	%l3,	%o4
	udivx	%i3,	0x19C7,	%i2
	udivcc	%l5,	0x1ECD,	%i1
	xnorcc	%o5,	0x15C9,	%o0
	fmuld8ulx16	%f28,	%f28,	%f30
	edge32ln	%g5,	%i4,	%l2
	edge32l	%g6,	%o7,	%i6
	fmovsa	%xcc,	%f16,	%f31
	ldsw	[%l7 + 0x40],	%g7
	nop
	set	0x65, %i7
	stb	%l0,	[%l7 + %i7]
	edge32ln	%i5,	%l6,	%g2
	movn	%xcc,	%g3,	%o3
	umulcc	%g1,	0x1EAB,	%o2
	movl	%icc,	%o1,	%i0
	addccc	%o6,	0x0161,	%l1
	fmovsleu	%icc,	%f20,	%f2
	fmovsge	%xcc,	%f3,	%f14
	st	%f6,	[%l7 + 0x58]
	umulcc	%l4,	%g4,	%i7
	lduw	[%l7 + 0x2C],	%o4
	popc	0x147D,	%i3
	mulscc	%l3,	0x0351,	%i2
	stb	%i1,	[%l7 + 0x66]
	fnor	%f6,	%f16,	%f10
	movl	%xcc,	%o5,	%l5
	fzeros	%f25
	nop
	set	0x30, %o1
	std	%f6,	[%l7 + %o1]
	ldsh	[%l7 + 0x66],	%o0
	st	%f4,	[%l7 + 0x14]
	edge8l	%g5,	%l2,	%i4
	sllx	%g6,	0x00,	%i6
	sdivx	%g7,	0x0C2C,	%o7
	edge8ln	%l0,	%l6,	%i5
	nop
	set	0x62, %o5
	ldsh	[%l7 + %o5],	%g2
	fcmpeq16	%f18,	%f2,	%o3
	fcmpeq16	%f16,	%f12,	%g3
	sub	%g1,	0x0D9C,	%o1
	fmovdne	%xcc,	%f11,	%f7
	alignaddr	%i0,	%o6,	%o2
	edge32n	%l1,	%l4,	%i7
	fmovdleu	%xcc,	%f10,	%f26
	movrgz	%g4,	0x2E7,	%o4
	edge8ln	%l3,	%i2,	%i3
	sllx	%i1,	0x00,	%o5
	movvc	%icc,	%o0,	%g5
	edge32ln	%l2,	%l5,	%g6
	srax	%i6,	0x16,	%g7
	sllx	%o7,	0x17,	%l0
	xorcc	%l6,	0x1610,	%i4
	fmovdn	%xcc,	%f31,	%f2
	edge16n	%i5,	%o3,	%g3
	pdist	%f4,	%f26,	%f14
	bshuffle	%f24,	%f22,	%f24
	fmovrde	%g2,	%f8,	%f22
	sdivcc	%g1,	0x1B37,	%o1
	orcc	%i0,	0x12A7,	%o2
	sdiv	%o6,	0x1576,	%l1
	movleu	%xcc,	%l4,	%g4
	xnorcc	%o4,	%i7,	%l3
	addccc	%i2,	%i1,	%o5
	fnot2	%f4,	%f26
	sir	0x0129
	fxnor	%f2,	%f22,	%f22
	lduw	[%l7 + 0x38],	%o0
	array32	%g5,	%i3,	%l5
	edge16ln	%l2,	%i6,	%g6
	umul	%o7,	0x1892,	%l0
	fzero	%f10
	addc	%g7,	%i4,	%i5
	fcmpne16	%f26,	%f0,	%l6
	ldsw	[%l7 + 0x08],	%o3
	fmovsge	%icc,	%f7,	%f3
	sth	%g2,	[%l7 + 0x26]
	fpsub32s	%f4,	%f22,	%f3
	movre	%g3,	0x365,	%o1
	fmovsg	%icc,	%f13,	%f28
	fmovsn	%icc,	%f16,	%f20
	fmovda	%xcc,	%f26,	%f24
	movrgez	%g1,	0x3F4,	%o2
	sra	%o6,	%l1,	%l4
	fmovsne	%icc,	%f0,	%f27
	andncc	%g4,	%o4,	%i0
	edge32ln	%l3,	%i7,	%i1
	edge8	%o5,	%i2,	%o0
	st	%f1,	[%l7 + 0x6C]
	movne	%xcc,	%g5,	%l5
	movl	%icc,	%l2,	%i6
	movle	%icc,	%i3,	%o7
	sdivx	%g6,	0x00CA,	%l0
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	fnand	%f26,	%f22,	%f24
	srax	%i5,	%o3,	%l6
	ldub	[%l7 + 0x1D],	%g3
	move	%icc,	%g2,	%g1
	lduw	[%l7 + 0x10],	%o1
	std	%f6,	[%l7 + 0x28]
	xnorcc	%o2,	%o6,	%l1
	edge16	%l4,	%g4,	%i0
	movne	%xcc,	%o4,	%l3
	orncc	%i7,	%i1,	%i2
	movne	%icc,	%o0,	%o5
	and	%l5,	0x0E73,	%l2
	lduh	[%l7 + 0x60],	%i6
	lduw	[%l7 + 0x74],	%g5
	stb	%o7,	[%l7 + 0x1F]
	array32	%g6,	%i3,	%i4
	movrlez	%l0,	0x04C,	%g7
	movpos	%icc,	%o3,	%l6
	edge16l	%g3,	%i5,	%g2
	andncc	%o1,	%g1,	%o2
	array16	%l1,	%o6,	%g4
	ldsh	[%l7 + 0x34],	%l4
	fcmpgt32	%f28,	%f24,	%o4
	lduw	[%l7 + 0x1C],	%i0
	array32	%l3,	%i7,	%i2
	movvs	%icc,	%i1,	%o5
	fmovrdne	%l5,	%f20,	%f30
	fmovdcc	%icc,	%f30,	%f22
	umulcc	%l2,	%o0,	%i6
	fpsub16s	%f13,	%f26,	%f19
	nop
	set	0x58, %l0
	lduw	[%l7 + %l0],	%g5
	subcc	%o7,	%i3,	%i4
	fmul8sux16	%f8,	%f4,	%f24
	lduh	[%l7 + 0x1A],	%l0
	movge	%xcc,	%g6,	%o3
	andcc	%g7,	0x0BE1,	%g3
	sll	%i5,	0x1C,	%g2
	and	%o1,	0x196A,	%g1
	alignaddrl	%l6,	%l1,	%o6
	andncc	%g4,	%o2,	%l4
	alignaddr	%i0,	%o4,	%l3
	addcc	%i2,	0x1832,	%i1
	fmovsgu	%icc,	%f11,	%f28
	fmul8x16	%f29,	%f14,	%f30
	fmovs	%f24,	%f22
	movle	%xcc,	%o5,	%l5
	movl	%xcc,	%i7,	%l2
	fxor	%f8,	%f14,	%f16
	ldub	[%l7 + 0x60],	%i6
	movle	%icc,	%g5,	%o7
	sir	0x038C
	fpack32	%f0,	%f12,	%f14
	or	%o0,	%i4,	%i3
	edge32	%l0,	%o3,	%g6
	fcmpeq32	%f8,	%f6,	%g3
	xnorcc	%g7,	0x0322,	%i5
	udiv	%g2,	0x0A79,	%g1
	alignaddrl	%o1,	%l1,	%l6
	ldsw	[%l7 + 0x58],	%o6
	movcc	%icc,	%o2,	%g4
	subcc	%l4,	%o4,	%i0
	orcc	%l3,	0x0845,	%i1
	fxnors	%f19,	%f5,	%f10
	stw	%o5,	[%l7 + 0x44]
	movcc	%xcc,	%l5,	%i2
	srl	%l2,	0x1B,	%i6
	udiv	%i7,	0x0808,	%g5
	edge8	%o0,	%o7,	%i4
	fmovdl	%icc,	%f23,	%f28
	array32	%i3,	%o3,	%g6
	sll	%l0,	0x0F,	%g3
	fmovspos	%icc,	%f26,	%f17
	fornot1s	%f12,	%f23,	%f1
	edge16l	%i5,	%g7,	%g2
	fnegs	%f29,	%f17
	movvs	%xcc,	%o1,	%g1
	srl	%l1,	0x00,	%o6
	sdiv	%l6,	0x1072,	%g4
	fnegd	%f4,	%f22
	movle	%xcc,	%l4,	%o4
	sdivcc	%o2,	0x1453,	%l3
	sll	%i0,	0x0D,	%o5
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%l4
	movrgz	%i2,	%i1,	%l2
	stw	%i6,	[%l7 + 0x44]
	ldd	[%l7 + 0x30],	%g4
	movneg	%xcc,	%i7,	%o7
	edge16l	%o0,	%i4,	%i3
	st	%f6,	[%l7 + 0x58]
	xorcc	%o3,	0x07D2,	%l0
	fxnors	%f18,	%f11,	%f1
	fxnors	%f12,	%f5,	%f21
	andcc	%g6,	0x142D,	%g3
	movcs	%icc,	%g7,	%g2
	subc	%o1,	%i5,	%l1
	ldsw	[%l7 + 0x14],	%g1
	ld	[%l7 + 0x5C],	%f25
	ldub	[%l7 + 0x36],	%l6
	andcc	%g4,	0x1AFD,	%o6
	sra	%o4,	0x18,	%l4
	save %l3, %o2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x3F],	%i0
	movle	%xcc,	%i2,	%l5
	ld	[%l7 + 0x6C],	%f10
	fone	%f4
	ldd	[%l7 + 0x48],	%i0
	ldsh	[%l7 + 0x4A],	%l2
	array16	%g5,	%i6,	%i7
	sdivcc	%o0,	0x12C8,	%o7
	movle	%icc,	%i4,	%i3
	movvs	%xcc,	%l0,	%g6
	lduw	[%l7 + 0x2C],	%g3
	edge16	%g7,	%o3,	%o1
	movcs	%icc,	%g2,	%i5
	popc	0x07FC,	%l1
	orncc	%l6,	%g1,	%g4
	fnors	%f24,	%f13,	%f1
	mova	%xcc,	%o6,	%l4
	array8	%l3,	%o4,	%o5
	fabss	%f22,	%f19
	st	%f0,	[%l7 + 0x78]
	stx	%i0,	[%l7 + 0x68]
	andncc	%o2,	%l5,	%i2
	fors	%f26,	%f14,	%f26
	fabsd	%f30,	%f22
	fmovsn	%icc,	%f11,	%f31
	smul	%l2,	0x182A,	%i1
	array32	%i6,	%g5,	%i7
	alignaddr	%o0,	%o7,	%i4
	fcmpne32	%f0,	%f16,	%i3
	movg	%xcc,	%l0,	%g6
	udivx	%g7,	0x19EC,	%o3
	nop
	set	0x74, %o4
	ldsb	[%l7 + %o4],	%g3
	sub	%o1,	%i5,	%g2
	movg	%icc,	%l1,	%l6
	xorcc	%g1,	%g4,	%l4
	edge32	%l3,	%o4,	%o6
	fnot2	%f24,	%f22
	fcmped	%fcc3,	%f20,	%f6
	subcc	%i0,	%o2,	%o5
	fcmpes	%fcc3,	%f25,	%f18
	edge32	%l5,	%l2,	%i1
	and	%i6,	%g5,	%i2
	sth	%i7,	[%l7 + 0x64]
	fpadd32s	%f30,	%f11,	%f2
	andncc	%o7,	%i4,	%o0
	movleu	%xcc,	%l0,	%i3
	fandnot1s	%f9,	%f12,	%f3
	subc	%g6,	%o3,	%g3
	fornot2	%f12,	%f12,	%f18
	alignaddr	%g7,	%i5,	%g2
	fmovdleu	%xcc,	%f21,	%f22
	edge16n	%l1,	%o1,	%g1
	smul	%g4,	0x0B35,	%l4
	edge8ln	%l6,	%l3,	%o6
	fmovsge	%icc,	%f16,	%f11
	array8	%i0,	%o4,	%o2
	move	%xcc,	%o5,	%l2
	sdivx	%i1,	0x14BD,	%l5
	sth	%g5,	[%l7 + 0x54]
	alignaddrl	%i6,	%i2,	%i7
	save %o7, 0x1538, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l0,	0x1BFB,	%i3
	movge	%xcc,	%o0,	%g6
	smul	%g3,	%g7,	%o3
	fmul8x16	%f10,	%f26,	%f26
	fandnot1s	%f3,	%f27,	%f16
	ldsh	[%l7 + 0x3E],	%g2
	lduw	[%l7 + 0x44],	%i5
	lduh	[%l7 + 0x4C],	%l1
	edge8	%g1,	%o1,	%l4
	movrne	%l6,	0x176,	%l3
	ldd	[%l7 + 0x78],	%g4
	mulscc	%i0,	%o4,	%o2
	fpack32	%f4,	%f26,	%f2
	fpsub16	%f18,	%f26,	%f0
	movne	%icc,	%o6,	%l2
	smul	%o5,	0x1788,	%i1
	move	%icc,	%g5,	%i6
	sdivcc	%i2,	0x097A,	%l5
	edge32l	%i7,	%o7,	%l0
	fornot2s	%f20,	%f19,	%f10
	fpsub32	%f8,	%f28,	%f6
	fabss	%f20,	%f23
	ld	[%l7 + 0x44],	%f25
	movcc	%icc,	%i3,	%o0
	fnand	%f28,	%f16,	%f12
	fzero	%f6
	fornot2	%f10,	%f4,	%f18
	xor	%i4,	%g6,	%g3
	edge8ln	%g7,	%o3,	%g2
	movrgez	%l1,	%g1,	%i5
	ldsb	[%l7 + 0x28],	%o1
	fsrc2s	%f17,	%f24
	fmovrdlz	%l6,	%f8,	%f6
	subcc	%l4,	0x13CD,	%l3
	sllx	%i0,	%g4,	%o2
	sra	%o6,	%o4,	%o5
	edge16ln	%l2,	%g5,	%i6
	movcc	%xcc,	%i1,	%i2
	movleu	%icc,	%i7,	%o7
	lduh	[%l7 + 0x72],	%l0
	ldub	[%l7 + 0x75],	%l5
	fcmpgt32	%f14,	%f20,	%i3
	edge16ln	%o0,	%i4,	%g6
	fxnor	%f24,	%f6,	%f12
	movcs	%xcc,	%g7,	%g3
	udivx	%g2,	0x1BF2,	%l1
	movcs	%xcc,	%g1,	%o3
	edge32n	%o1,	%l6,	%i5
	fmovscs	%icc,	%f16,	%f16
	fmovrdlz	%l4,	%f20,	%f24
	sllx	%l3,	0x04,	%i0
	ldsh	[%l7 + 0x44],	%o2
	addcc	%g4,	%o6,	%o5
	xnor	%o4,	0x1B28,	%g5
	fmovdcc	%xcc,	%f30,	%f27
	edge16n	%i6,	%i1,	%l2
	popc	%i7,	%i2
	fmovsgu	%icc,	%f11,	%f19
	or	%l0,	0x172D,	%o7
	sth	%i3,	[%l7 + 0x4E]
	edge8n	%o0,	%i4,	%l5
	ldsh	[%l7 + 0x5E],	%g6
	sllx	%g3,	0x11,	%g7
	edge16	%g2,	%g1,	%l1
	add	%o3,	%l6,	%o1
	edge8	%i5,	%l4,	%i0
	array32	%o2,	%l3,	%g4
	umul	%o5,	0x090A,	%o4
	array8	%g5,	%i6,	%o6
	edge16l	%i1,	%l2,	%i7
	ldd	[%l7 + 0x58],	%i2
	fmovdleu	%icc,	%f25,	%f1
	mova	%xcc,	%l0,	%i3
	edge16ln	%o7,	%o0,	%i4
	ld	[%l7 + 0x20],	%f21
	movle	%icc,	%g6,	%g3
	edge32l	%g7,	%l5,	%g1
	sdiv	%l1,	0x1787,	%o3
	edge32l	%g2,	%o1,	%i5
	array32	%l4,	%l6,	%i0
	umul	%o2,	0x0179,	%g4
	edge8	%l3,	%o5,	%g5
	sdiv	%o4,	0x0229,	%i6
	fmovsgu	%icc,	%f3,	%f7
	fmovdn	%icc,	%f23,	%f12
	xorcc	%i1,	%l2,	%o6
	movvs	%icc,	%i2,	%i7
	fzero	%f2
	movrne	%i3,	%o7,	%l0
	edge8ln	%o0,	%i4,	%g6
	subcc	%g7,	%g3,	%l5
	edge32n	%g1,	%o3,	%g2
	ld	[%l7 + 0x20],	%f5
	fcmple16	%f22,	%f28,	%l1
	movcc	%icc,	%i5,	%o1
	movcc	%icc,	%l4,	%l6
	fmul8sux16	%f18,	%f28,	%f28
	movrgz	%i0,	0x1A7,	%o2
	stb	%l3,	[%l7 + 0x4E]
	fandnot1	%f28,	%f22,	%f0
	edge32l	%g4,	%o5,	%g5
	bshuffle	%f20,	%f14,	%f28
	xnor	%o4,	0x10EF,	%i1
	fcmpgt16	%f0,	%f18,	%i6
	array8	%l2,	%o6,	%i7
	ldx	[%l7 + 0x28],	%i3
	udiv	%o7,	0x05BC,	%i2
	fmovsgu	%xcc,	%f15,	%f28
	subccc	%l0,	0x1DC0,	%i4
	restore %g6, 0x0167, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x44],	%g3
	stx	%l5,	[%l7 + 0x30]
	popc	0x1AF7,	%g1
	addccc	%o3,	0x0DCD,	%g2
	fmovdvs	%icc,	%f16,	%f12
	std	%f28,	[%l7 + 0x10]
	array32	%g7,	%l1,	%i5
	lduh	[%l7 + 0x46],	%l4
	fmul8sux16	%f16,	%f0,	%f14
	and	%l6,	0x1AAA,	%o1
	subcc	%o2,	%i0,	%l3
	movneg	%xcc,	%g4,	%g5
	mova	%icc,	%o4,	%i1
	alignaddrl	%i6,	%l2,	%o6
	edge32n	%o5,	%i3,	%o7
	array16	%i7,	%i2,	%l0
	stx	%i4,	[%l7 + 0x48]
	ldd	[%l7 + 0x60],	%o0
	movn	%xcc,	%g6,	%g3
	fsrc1s	%f19,	%f30
	lduh	[%l7 + 0x38],	%g1
	addcc	%l5,	0x1EDD,	%g2
	xorcc	%g7,	%l1,	%o3
	array16	%l4,	%i5,	%o1
	nop
	set	0x10, %o7
	std	%f26,	[%l7 + %o7]
	ldsb	[%l7 + 0x5B],	%l6
	addc	%i0,	0x0310,	%o2
	std	%f2,	[%l7 + 0x30]
	fexpand	%f8,	%f14
	lduw	[%l7 + 0x48],	%g4
	fandnot2s	%f2,	%f1,	%f1
	fmovsne	%icc,	%f22,	%f1
	edge32n	%g5,	%l3,	%i1
	edge32n	%i6,	%l2,	%o6
	fnot1	%f2,	%f28
	edge8	%o5,	%o4,	%i3
	ldd	[%l7 + 0x48],	%f8
	for	%f6,	%f20,	%f30
	movge	%xcc,	%o7,	%i2
	edge32ln	%i7,	%i4,	%o0
	sth	%l0,	[%l7 + 0x74]
	fpack16	%f10,	%f16
	movneg	%xcc,	%g3,	%g1
	nop
	set	0x08, %l1
	stw	%g6,	[%l7 + %l1]
	ldsh	[%l7 + 0x78],	%g2
	movge	%xcc,	%g7,	%l1
	fornot2	%f8,	%f4,	%f14
	srl	%l5,	%o3,	%l4
	smulcc	%o1,	%l6,	%i0
	fandnot1	%f26,	%f4,	%f8
	fsrc1s	%f28,	%f12
	fornot2	%f14,	%f26,	%f30
	subccc	%i5,	0x1027,	%o2
	edge16ln	%g4,	%g5,	%l3
	fornot1s	%f22,	%f26,	%f17
	fmul8sux16	%f22,	%f10,	%f24
	std	%f2,	[%l7 + 0x40]
	array32	%i6,	%l2,	%o6
	movpos	%icc,	%i1,	%o4
	fcmpne32	%f2,	%f4,	%o5
	lduw	[%l7 + 0x60],	%i3
	fmul8x16au	%f31,	%f27,	%f16
	fmovscs	%xcc,	%f8,	%f16
	movrgz	%i2,	0x068,	%o7
	movgu	%icc,	%i7,	%i4
	nop
	set	0x78, %i2
	ldsw	[%l7 + %i2],	%o0
	st	%f20,	[%l7 + 0x10]
	movpos	%xcc,	%l0,	%g3
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	fmovrdne	%g7,	%f12,	%f30
	mulscc	%l1,	%l5,	%o3
	edge16ln	%g1,	%o1,	%l6
	subccc	%i0,	%i5,	%l4
	ldd	[%l7 + 0x40],	%f18
	xorcc	%g4,	0x0A1F,	%g5
	fcmpne32	%f20,	%f2,	%o2
	alignaddrl	%l3,	%i6,	%l2
	mova	%xcc,	%o6,	%o4
	movcc	%icc,	%o5,	%i3
	edge16l	%i2,	%i1,	%o7
	fmovdgu	%icc,	%f11,	%f24
	edge32n	%i7,	%i4,	%o0
	movg	%xcc,	%g3,	%g6
	subccc	%l0,	%g7,	%l1
	umulcc	%l5,	%o3,	%g2
	movg	%xcc,	%o1,	%l6
	sll	%g1,	%i5,	%l4
	ldd	[%l7 + 0x20],	%f6
	movn	%xcc,	%g4,	%g5
	sth	%i0,	[%l7 + 0x20]
	sdiv	%o2,	0x0DB3,	%i6
	move	%xcc,	%l3,	%o6
	edge8l	%l2,	%o5,	%o4
	movcc	%icc,	%i3,	%i2
	nop
	set	0x54, %o6
	sth	%o7,	[%l7 + %o6]
	xnorcc	%i7,	0x1D37,	%i4
	edge8ln	%i1,	%g3,	%g6
	addc	%l0,	%g7,	%l1
	edge16ln	%l5,	%o3,	%g2
	edge16l	%o1,	%l6,	%o0
	ld	[%l7 + 0x64],	%f19
	orncc	%i5,	0x13A8,	%l4
	movrlz	%g4,	%g5,	%i0
	std	%f28,	[%l7 + 0x10]
	sir	0x1656
	smulcc	%o2,	0x0C9A,	%i6
	movvc	%xcc,	%g1,	%l3
	edge32	%o6,	%o5,	%o4
	mova	%icc,	%i3,	%i2
	fsrc2	%f4,	%f16
	edge32l	%l2,	%i7,	%o7
	ldd	[%l7 + 0x38],	%i4
	sdiv	%i1,	0x06F3,	%g3
	fmovsvs	%xcc,	%f18,	%f4
	movleu	%xcc,	%g6,	%g7
	fmovse	%icc,	%f14,	%f6
	orn	%l1,	%l5,	%o3
	movcs	%icc,	%g2,	%l0
	andcc	%o1,	0x09F3,	%o0
	fand	%f6,	%f12,	%f8
	andcc	%i5,	%l6,	%g4
	sth	%g5,	[%l7 + 0x42]
	fmovrse	%i0,	%f3,	%f7
	subc	%l4,	%i6,	%o2
	sdivx	%g1,	0x0186,	%o6
	ld	[%l7 + 0x58],	%f24
	edge32l	%l3,	%o4,	%i3
	movre	%o5,	0x1B5,	%l2
	movle	%icc,	%i2,	%i7
	sllx	%i4,	%i1,	%g3
	movl	%icc,	%g6,	%g7
	add	%l1,	%o7,	%o3
	fmuld8ulx16	%f6,	%f16,	%f14
	srl	%l5,	%g2,	%l0
	lduh	[%l7 + 0x74],	%o1
	sir	0x0D78
	addc	%o0,	0x0441,	%l6
	movre	%g4,	%i5,	%i0
	fmovsneg	%icc,	%f4,	%f17
	movne	%xcc,	%g5,	%i6
	std	%f24,	[%l7 + 0x78]
	movne	%icc,	%l4,	%o2
	sethi	0x0DEA,	%g1
	fcmpgt16	%f24,	%f16,	%l3
	restore %o6, 0x1BB5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i3,	0x2F2,	%l2
	fcmpeq16	%f24,	%f20,	%i2
	lduw	[%l7 + 0x40],	%o5
	movrgz	%i7,	0x328,	%i1
	fmovsn	%xcc,	%f13,	%f2
	fone	%f16
	fand	%f20,	%f6,	%f28
	nop
	set	0x78, %l6
	stx	%g3,	[%l7 + %l6]
	alignaddrl	%i4,	%g7,	%g6
	stb	%o7,	[%l7 + 0x4A]
	edge8l	%o3,	%l1,	%l5
	edge16l	%g2,	%o1,	%l0
	fmovrdne	%o0,	%f8,	%f6
	edge8l	%g4,	%l6,	%i5
	lduh	[%l7 + 0x78],	%i0
	fxnors	%f3,	%f24,	%f4
	movrgez	%i6,	0x1F4,	%l4
	movcs	%xcc,	%g5,	%g1
	movleu	%icc,	%o2,	%l3
	srlx	%o4,	0x19,	%o6
	umulcc	%l2,	%i2,	%i3
	movre	%i7,	%i1,	%g3
	alignaddrl	%o5,	%i4,	%g6
	edge16ln	%g7,	%o7,	%o3
	smul	%l1,	0x1FA3,	%l5
	movg	%icc,	%o1,	%g2
	sub	%l0,	0x06C4,	%o0
	fmovd	%f30,	%f6
	srl	%l6,	%i5,	%g4
	sdiv	%i6,	0x0E0E,	%l4
	fmul8x16al	%f23,	%f23,	%f30
	save %g5, %i0, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%icc,	%f4,	%f25
	std	%f6,	[%l7 + 0x08]
	ldx	[%l7 + 0x48],	%l3
	orn	%o4,	%o6,	%g1
	fmovrdgz	%l2,	%f14,	%f12
	fand	%f6,	%f28,	%f12
	edge8n	%i3,	%i2,	%i1
	movre	%g3,	%i7,	%i4
	fmovdg	%icc,	%f0,	%f17
	subcc	%g6,	0x1BB3,	%g7
	fandnot2	%f8,	%f30,	%f28
	umul	%o5,	0x1EE7,	%o7
	movl	%icc,	%o3,	%l5
	fornot2s	%f18,	%f21,	%f29
	movrgez	%o1,	0x376,	%l1
	fpadd32s	%f13,	%f4,	%f18
	sllx	%g2,	%l0,	%l6
	addccc	%o0,	0x0F40,	%i5
	movrlez	%i6,	0x266,	%l4
	udivcc	%g4,	0x1D5F,	%i0
	movre	%g5,	%l3,	%o2
	fmovdg	%xcc,	%f19,	%f25
	edge8ln	%o4,	%o6,	%g1
	smul	%l2,	%i2,	%i1
	edge16	%g3,	%i7,	%i3
	fpsub32	%f8,	%f12,	%f16
	array16	%i4,	%g6,	%o5
	ldsh	[%l7 + 0x70],	%o7
	fmovrse	%g7,	%f3,	%f31
	ld	[%l7 + 0x6C],	%f8
	mulx	%l5,	0x08E7,	%o3
	sdivx	%l1,	0x0ADA,	%g2
	sra	%l0,	%l6,	%o0
	ldsw	[%l7 + 0x5C],	%i5
	ldd	[%l7 + 0x18],	%f24
	sdivx	%o1,	0x1F9C,	%l4
	fandnot2	%f6,	%f24,	%f12
	edge32ln	%i6,	%i0,	%g5
	fpackfix	%f18,	%f23
	fcmpes	%fcc2,	%f12,	%f0
	ldub	[%l7 + 0x1C],	%l3
	movre	%o2,	0x073,	%o4
	ldsw	[%l7 + 0x78],	%o6
	mova	%xcc,	%g1,	%l2
	edge16	%i2,	%g4,	%i1
	ldd	[%l7 + 0x58],	%f14
	movcc	%icc,	%i7,	%i3
	edge16ln	%g3,	%i4,	%o5
	movvs	%xcc,	%g6,	%g7
	fmovs	%f24,	%f18
	mulscc	%o7,	%l5,	%o3
	andn	%l1,	%l0,	%l6
	fmovdge	%xcc,	%f20,	%f26
	movne	%icc,	%g2,	%i5
	fmul8ulx16	%f10,	%f30,	%f26
	sdivcc	%o1,	0x106F,	%o0
	ldsw	[%l7 + 0x3C],	%i6
	fnand	%f28,	%f8,	%f22
	movpos	%xcc,	%i0,	%g5
	edge8n	%l3,	%o2,	%l4
	edge8n	%o6,	%o4,	%g1
	udivcc	%l2,	0x14BD,	%i2
	fmovrdgez	%i1,	%f30,	%f30
	array16	%g4,	%i7,	%i3
	subc	%i4,	0x00FD,	%g3
	orncc	%o5,	0x16DB,	%g7
	sllx	%o7,	%l5,	%o3
	sdivcc	%g6,	0x0D0E,	%l0
	addc	%l1,	%l6,	%i5
	or	%o1,	%g2,	%o0
	movrgz	%i6,	0x394,	%i0
	udivcc	%l3,	0x00E0,	%g5
	udiv	%o2,	0x194C,	%l4
	edge8	%o6,	%g1,	%l2
	lduh	[%l7 + 0x32],	%o4
	srl	%i2,	%g4,	%i7
	udivcc	%i3,	0x1356,	%i4
	subcc	%g3,	%o5,	%g7
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	ld	[%l7 + 0x64],	%f26
	edge32	%o3,	%g6,	%l0
	movne	%xcc,	%l6,	%l1
	mova	%xcc,	%o1,	%i5
	edge16l	%g2,	%o0,	%i0
	andcc	%i6,	0x1EC8,	%g5
	mulx	%l3,	0x0D01,	%o2
	edge8	%o6,	%l4,	%g1
	fmovrslez	%o4,	%f31,	%f4
	fnor	%f18,	%f12,	%f0
	subccc	%i2,	0x1DD4,	%l2
	sra	%g4,	0x01,	%i3
	sdivcc	%i4,	0x1210,	%g3
	fmovrdne	%o5,	%f20,	%f10
	srl	%g7,	0x18,	%i7
	subcc	%o7,	0x1B48,	%l5
	orn	%o3,	%g6,	%l0
	fpackfix	%f20,	%f10
	andcc	%l6,	0x1AC5,	%l1
	movcc	%xcc,	%o1,	%i1
	sra	%g2,	0x1F,	%o0
	edge16	%i5,	%i6,	%i0
	array32	%g5,	%o2,	%o6
	edge32	%l4,	%g1,	%l3
	xorcc	%o4,	0x1319,	%i2
	fornot1	%f4,	%f14,	%f18
	sra	%l2,	%g4,	%i4
	fcmpeq16	%f14,	%f4,	%i3
	siam	0x7
	smulcc	%o5,	0x116B,	%g3
	array32	%g7,	%o7,	%i7
	mova	%xcc,	%o3,	%g6
	edge16	%l0,	%l5,	%l1
	subccc	%o1,	%i1,	%g2
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%o0
	sir	0x1C7D
	movge	%xcc,	%i5,	%i6
	fmul8ulx16	%f18,	%f2,	%f8
	fmovscs	%xcc,	%f2,	%f17
	edge16n	%i0,	%l6,	%g5
	movvs	%xcc,	%o2,	%o6
	sra	%g1,	0x17,	%l3
	srl	%l4,	%o4,	%i2
	ldd	[%l7 + 0x78],	%f26
	ldub	[%l7 + 0x5C],	%l2
	movpos	%xcc,	%g4,	%i4
	fmul8x16al	%f0,	%f19,	%f8
	orcc	%o5,	0x1826,	%i3
	edge32ln	%g3,	%g7,	%i7
	add	%o3,	%g6,	%o7
	movcc	%icc,	%l5,	%l1
	sra	%o1,	%i1,	%l0
	srlx	%o0,	%g2,	%i6
	edge16ln	%i5,	%l6,	%i0
	fcmpne16	%f2,	%f0,	%g5
	edge16ln	%o6,	%o2,	%g1
	st	%f29,	[%l7 + 0x70]
	fnot2	%f0,	%f8
	stw	%l4,	[%l7 + 0x10]
	movneg	%icc,	%l3,	%i2
	addccc	%l2,	%o4,	%i4
	subcc	%g4,	%i3,	%g3
	and	%o5,	%g7,	%o3
	edge8l	%g6,	%i7,	%l5
	subccc	%l1,	%o1,	%i1
	std	%f18,	[%l7 + 0x28]
	move	%icc,	%o7,	%o0
	edge8	%g2,	%i6,	%i5
	movge	%xcc,	%l6,	%l0
	edge32	%i0,	%o6,	%g5
	for	%f26,	%f20,	%f18
	std	%f28,	[%l7 + 0x50]
	edge16n	%o2,	%l4,	%g1
	movrlz	%i2,	0x034,	%l3
	srlx	%l2,	0x17,	%o4
	subcc	%i4,	0x053B,	%g4
	movne	%xcc,	%i3,	%o5
	edge32	%g3,	%g7,	%o3
	movle	%xcc,	%i7,	%l5
	alignaddr	%l1,	%g6,	%o1
	sth	%o7,	[%l7 + 0x1A]
	movvc	%icc,	%o0,	%g2
	xnorcc	%i6,	%i1,	%i5
	movleu	%icc,	%l0,	%l6
	fmovsne	%xcc,	%f15,	%f12
	mulx	%o6,	%i0,	%g5
	movcc	%icc,	%l4,	%o2
	movpos	%xcc,	%i2,	%g1
	ldsh	[%l7 + 0x16],	%l2
	mulx	%o4,	%i4,	%l3
	ldsb	[%l7 + 0x20],	%i3
	movrlz	%g4,	0x093,	%g3
	stb	%o5,	[%l7 + 0x28]
	movvs	%xcc,	%o3,	%g7
	andn	%l5,	%i7,	%l1
	fcmpd	%fcc0,	%f4,	%f6
	nop
	set	0x64, %g4
	ldsh	[%l7 + %g4],	%o1
	edge32	%o7,	%o0,	%g2
	addcc	%g6,	%i6,	%i1
	array32	%i5,	%l0,	%l6
	movrne	%i0,	0x0FF,	%o6
	ldd	[%l7 + 0x60],	%f30
	fornot1	%f20,	%f30,	%f24
	xor	%l4,	0x11F0,	%g5
	edge8n	%o2,	%i2,	%g1
	edge8	%l2,	%o4,	%l3
	ldx	[%l7 + 0x38],	%i3
	mova	%icc,	%g4,	%i4
	fcmpeq16	%f18,	%f30,	%o5
	srlx	%g3,	%g7,	%o3
	srlx	%i7,	%l5,	%o1
	alignaddr	%l1,	%o0,	%o7
	sdiv	%g2,	0x0BD9,	%g6
	ldsb	[%l7 + 0x68],	%i6
	ldsh	[%l7 + 0x48],	%i1
	pdist	%f10,	%f30,	%f6
	umul	%i5,	0x100E,	%l6
	fmovrde	%i0,	%f22,	%f14
	fmovdneg	%icc,	%f27,	%f9
	movgu	%icc,	%o6,	%l0
	movrlz	%g5,	0x35B,	%l4
	movrlez	%o2,	0x2C0,	%i2
	subc	%g1,	0x0D69,	%l2
	fpadd32s	%f14,	%f1,	%f0
	mulx	%l3,	0x16C8,	%i3
	ldd	[%l7 + 0x68],	%o4
	fmovspos	%xcc,	%f19,	%f11
	subc	%g4,	%i4,	%g3
	xnorcc	%g7,	%o5,	%o3
	or	%l5,	0x1449,	%i7
	lduw	[%l7 + 0x30],	%o1
	st	%f3,	[%l7 + 0x34]
	std	%f28,	[%l7 + 0x78]
	stb	%l1,	[%l7 + 0x6A]
	move	%xcc,	%o0,	%o7
	mova	%icc,	%g6,	%i6
	fmuld8ulx16	%f31,	%f2,	%f10
	nop
	set	0x70, %l5
	lduw	[%l7 + %l5],	%g2
	std	%f8,	[%l7 + 0x68]
	fmul8ulx16	%f22,	%f22,	%f30
	fmovdneg	%xcc,	%f1,	%f24
	movrgez	%i1,	%i5,	%l6
	sdivx	%o6,	0x030E,	%l0
	st	%f28,	[%l7 + 0x48]
	st	%f25,	[%l7 + 0x10]
	fmovrde	%g5,	%f26,	%f6
	fmovsvc	%icc,	%f7,	%f3
	addc	%l4,	%o2,	%i2
	ldx	[%l7 + 0x30],	%i0
	ldub	[%l7 + 0x73],	%g1
	sllx	%l3,	0x04,	%i3
	alignaddrl	%l2,	%o4,	%i4
	ldsb	[%l7 + 0x4B],	%g3
	addcc	%g4,	%o5,	%g7
	fpadd32	%f8,	%f12,	%f10
	stb	%l5,	[%l7 + 0x55]
	array32	%i7,	%o3,	%o1
	sllx	%o0,	%o7,	%l1
	save %g6, 0x1DE3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i1,	%i5,	%g2
	edge32ln	%o6,	%l6,	%g5
	edge16n	%l4,	%l0,	%o2
	xor	%i2,	%g1,	%l3
	movpos	%xcc,	%i3,	%l2
	fpack16	%f4,	%f23
	udiv	%o4,	0x1D8D,	%i4
	nop
	set	0x2E, %i5
	ldub	[%l7 + %i5],	%i0
	fmovdg	%icc,	%f27,	%f10
	edge8ln	%g3,	%g4,	%g7
	xorcc	%o5,	%l5,	%o3
	fzeros	%f19
	lduh	[%l7 + 0x42],	%o1
	orn	%o0,	0x1721,	%i7
	fmovdcs	%xcc,	%f7,	%f3
	move	%icc,	%l1,	%g6
	sdivcc	%o7,	0x0698,	%i6
	stx	%i5,	[%l7 + 0x48]
	array8	%g2,	%o6,	%l6
	or	%i1,	%l4,	%l0
	edge16n	%o2,	%g5,	%g1
	sdiv	%i2,	0x01BE,	%l3
	ldx	[%l7 + 0x48],	%i3
	fnegs	%f8,	%f9
	movcc	%icc,	%o4,	%i4
	movrgz	%l2,	%g3,	%g4
	fornot2s	%f20,	%f10,	%f22
	fands	%f8,	%f8,	%f9
	stb	%i0,	[%l7 + 0x79]
	edge8l	%o5,	%g7,	%o3
	fmovsvc	%icc,	%f23,	%f24
	fmovscs	%xcc,	%f6,	%f8
	fornot2s	%f16,	%f14,	%f13
	ld	[%l7 + 0x68],	%f10
	umul	%o1,	%o0,	%i7
	array8	%l1,	%g6,	%o7
	move	%xcc,	%i6,	%i5
	andncc	%g2,	%l5,	%l6
	or	%o6,	0x18AB,	%i1
	edge32n	%l4,	%o2,	%l0
	sub	%g5,	0x0E0A,	%g1
	mulscc	%l3,	%i2,	%o4
	mulx	%i3,	0x194E,	%l2
	fmovse	%xcc,	%f24,	%f2
	edge16n	%g3,	%i4,	%i0
	movne	%xcc,	%o5,	%g4
	edge32ln	%o3,	%o1,	%o0
	ldsw	[%l7 + 0x24],	%g7
	fandnot2s	%f1,	%f25,	%f10
	move	%xcc,	%l1,	%g6
	std	%f0,	[%l7 + 0x38]
	add	%o7,	0x19AD,	%i6
	stw	%i7,	[%l7 + 0x3C]
	stb	%i5,	[%l7 + 0x6D]
	sdivx	%g2,	0x1604,	%l5
	movvc	%xcc,	%o6,	%l6
	fmul8ulx16	%f12,	%f18,	%f22
	movrne	%i1,	%o2,	%l4
	srax	%l0,	0x0D,	%g5
	save %g1, 0x1A0B, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i2,	%o4
	xor	%l2,	%i3,	%g3
	edge8	%i0,	%o5,	%i4
	edge8l	%g4,	%o3,	%o0
	mova	%icc,	%g7,	%l1
	orncc	%o1,	%g6,	%o7
	stb	%i7,	[%l7 + 0x26]
	fnand	%f12,	%f8,	%f18
	ldub	[%l7 + 0x33],	%i5
	sll	%i6,	0x18,	%l5
	andncc	%g2,	%l6,	%o6
	st	%f1,	[%l7 + 0x64]
	fmul8x16	%f11,	%f8,	%f2
	edge32ln	%o2,	%i1,	%l4
	andn	%l0,	%g1,	%l3
	movcc	%icc,	%g5,	%i2
	orcc	%o4,	0x091C,	%i3
	fmovsne	%xcc,	%f30,	%f27
	fmovd	%f20,	%f26
	fmovsneg	%icc,	%f28,	%f25
	fmovrdgz	%g3,	%f4,	%f24
	move	%icc,	%i0,	%o5
	for	%f30,	%f10,	%f28
	sub	%l2,	0x172D,	%i4
	st	%f7,	[%l7 + 0x38]
	movrgez	%g4,	%o3,	%g7
	fmovsne	%icc,	%f7,	%f8
	movn	%icc,	%l1,	%o0
	fandnot1s	%f30,	%f21,	%f28
	fcmped	%fcc3,	%f20,	%f14
	movne	%xcc,	%o1,	%o7
	fmovrsgez	%i7,	%f14,	%f5
	edge16ln	%g6,	%i5,	%i6
	edge16l	%g2,	%l6,	%l5
	edge8l	%o6,	%i1,	%o2
	ldub	[%l7 + 0x79],	%l4
	array8	%l0,	%g1,	%l3
	fmovs	%f4,	%f16
	subccc	%i2,	0x02B6,	%g5
	movpos	%xcc,	%i3,	%o4
	umulcc	%g3,	%i0,	%o5
	edge16n	%l2,	%i4,	%o3
	movge	%icc,	%g4,	%g7
	edge16	%l1,	%o1,	%o0
	fmovsn	%xcc,	%f27,	%f20
	ld	[%l7 + 0x5C],	%f5
	lduw	[%l7 + 0x48],	%o7
	sll	%i7,	%i5,	%g6
	mulx	%g2,	%i6,	%l6
	edge32n	%o6,	%i1,	%o2
	edge16	%l5,	%l0,	%g1
	subccc	%l4,	0x1DB0,	%l3
	fmovda	%xcc,	%f4,	%f11
	smulcc	%g5,	%i3,	%i2
	ldub	[%l7 + 0x2D],	%g3
	stx	%o4,	[%l7 + 0x78]
	subcc	%i0,	0x047B,	%o5
	ldub	[%l7 + 0x44],	%l2
	sll	%i4,	0x1B,	%o3
	orcc	%g4,	%g7,	%o1
	array16	%l1,	%o7,	%o0
	stb	%i7,	[%l7 + 0x55]
	movrgez	%g6,	%i5,	%g2
	movl	%icc,	%l6,	%o6
	edge32n	%i6,	%o2,	%i1
	movg	%xcc,	%l5,	%g1
	and	%l0,	%l3,	%g5
	sllx	%i3,	%l4,	%g3
	ld	[%l7 + 0x78],	%f0
	mova	%xcc,	%i2,	%i0
	move	%xcc,	%o5,	%l2
	udivx	%i4,	0x16B2,	%o3
	ldsw	[%l7 + 0x7C],	%g4
	edge16	%g7,	%o4,	%l1
	fsrc2	%f20,	%f2
	srax	%o7,	%o1,	%i7
	ldd	[%l7 + 0x48],	%g6
	array16	%i5,	%g2,	%o0
	xnor	%o6,	0x0BC4,	%i6
	fornot2s	%f0,	%f15,	%f20
	sth	%l6,	[%l7 + 0x44]
	save %i1, 0x1CDB, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f28,	%f18,	%l5
	fnegd	%f4,	%f14
	umul	%l0,	0x0FBE,	%l3
	fxors	%f12,	%f29,	%f6
	sethi	0x079B,	%g1
	udiv	%i3,	0x1E29,	%l4
	ldsb	[%l7 + 0x23],	%g5
	fandnot2	%f10,	%f20,	%f16
	fcmpne16	%f24,	%f20,	%g3
	fcmpne16	%f2,	%f14,	%i0
	edge32l	%o5,	%i2,	%l2
	fnot2s	%f14,	%f8
	fcmpgt16	%f14,	%f16,	%i4
	subccc	%g4,	%o3,	%o4
	subccc	%g7,	%o7,	%l1
	udiv	%i7,	0x1008,	%g6
	fmovrdlez	%i5,	%f14,	%f10
	fnot1	%f22,	%f24
	fcmpd	%fcc3,	%f12,	%f8
	ldub	[%l7 + 0x3D],	%o1
	save %o0, %g2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i6,	%i1,	%o2
	fmovdpos	%xcc,	%f5,	%f8
	movre	%l6,	%l0,	%l3
	movvs	%xcc,	%l5,	%i3
	fxor	%f6,	%f6,	%f10
	movpos	%xcc,	%l4,	%g1
	popc	%g3,	%g5
	movcc	%xcc,	%i0,	%i2
	fmovdg	%icc,	%f12,	%f21
	movre	%l2,	%o5,	%i4
	umul	%o3,	%g4,	%g7
	array32	%o4,	%l1,	%o7
	movle	%icc,	%i7,	%i5
	fpmerge	%f4,	%f6,	%f18
	fcmps	%fcc1,	%f1,	%f6
	add	%g6,	%o1,	%g2
	movgu	%icc,	%o0,	%i6
	movcs	%icc,	%o6,	%o2
	sub	%i1,	%l6,	%l0
	sethi	0x1380,	%l5
	movre	%l3,	%i3,	%g1
	fpack16	%f22,	%f31
	edge8n	%l4,	%g3,	%g5
	ldd	[%l7 + 0x28],	%f18
	edge32n	%i2,	%l2,	%o5
	ldx	[%l7 + 0x70],	%i0
	fpack32	%f30,	%f2,	%f4
	restore %o3, 0x126C, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f22,	%f20,	%g7
	smulcc	%i4,	0x042E,	%o4
	fmovrslz	%l1,	%f22,	%f16
	edge32l	%o7,	%i7,	%g6
	edge8	%o1,	%i5,	%g2
	mova	%icc,	%i6,	%o6
	movge	%xcc,	%o2,	%i1
	and	%l6,	%o0,	%l0
	movrgez	%l3,	0x1E3,	%i3
	edge32l	%l5,	%l4,	%g3
	xnorcc	%g5,	0x1429,	%g1
	edge32	%l2,	%i2,	%i0
	addcc	%o5,	%g4,	%o3
	array32	%i4,	%o4,	%g7
	fabss	%f22,	%f18
	edge8	%l1,	%i7,	%o7
	fmovdne	%xcc,	%f7,	%f7
	edge16	%g6,	%o1,	%i5
	fcmple32	%f8,	%f0,	%i6
	alignaddrl	%g2,	%o2,	%o6
	sllx	%i1,	%l6,	%o0
	edge32ln	%l3,	%l0,	%i3
	fzeros	%f8
	fornot2s	%f22,	%f11,	%f29
	movrgz	%l4,	0x284,	%g3
	movpos	%xcc,	%g5,	%g1
	ldsb	[%l7 + 0x5C],	%l2
	fpsub16	%f4,	%f26,	%f26
	fcmpes	%fcc1,	%f28,	%f4
	fors	%f16,	%f2,	%f18
	sethi	0x1CC0,	%l5
	movl	%xcc,	%i0,	%i2
	movgu	%xcc,	%g4,	%o5
	umul	%i4,	0x0830,	%o3
	or	%o4,	0x07E6,	%g7
	smulcc	%l1,	0x045E,	%i7
	edge32l	%g6,	%o7,	%i5
	array32	%i6,	%o1,	%g2
	mova	%xcc,	%o2,	%i1
	movn	%xcc,	%l6,	%o6
	andncc	%l3,	%o0,	%l0
	srl	%i3,	%g3,	%g5
	ldx	[%l7 + 0x10],	%l4
	sllx	%l2,	0x18,	%g1
	movvc	%xcc,	%i0,	%i2
	sdivx	%l5,	0x020E,	%g4
	edge8l	%i4,	%o3,	%o5
	edge32ln	%g7,	%l1,	%o4
	or	%g6,	0x1235,	%o7
	movvs	%icc,	%i7,	%i5
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f22
	movrlz	%o1,	%i6,	%o2
	umulcc	%i1,	0x107D,	%g2
	alignaddr	%o6,	%l6,	%o0
	movre	%l0,	0x393,	%l3
	move	%icc,	%g3,	%i3
	edge16ln	%g5,	%l2,	%l4
	orn	%i0,	%i2,	%l5
	xnorcc	%g4,	0x0FB7,	%i4
	movleu	%xcc,	%o3,	%g1
	lduh	[%l7 + 0x20],	%o5
	stb	%g7,	[%l7 + 0x40]
	edge16ln	%o4,	%l1,	%o7
	movvc	%xcc,	%g6,	%i5
	array16	%o1,	%i7,	%o2
	popc	%i6,	%i1
	st	%f17,	[%l7 + 0x10]
	xnorcc	%g2,	%l6,	%o6
	fmovrdgez	%l0,	%f26,	%f8
	sra	%l3,	%o0,	%g3
	ldsb	[%l7 + 0x6C],	%i3
	srlx	%l2,	0x0F,	%l4
	edge16	%i0,	%g5,	%i2
	addcc	%g4,	0x0EED,	%l5
	sll	%o3,	%i4,	%g1
	xorcc	%g7,	0x09A9,	%o4
	movrne	%l1,	%o5,	%o7
	edge32ln	%g6,	%o1,	%i7
	stw	%i5,	[%l7 + 0x44]
	smul	%i6,	%o2,	%i1
	array16	%g2,	%o6,	%l6
	xor	%l3,	0x1F87,	%o0
	movcc	%xcc,	%g3,	%i3
	srl	%l0,	%l2,	%i0
	xnor	%l4,	0x1B1E,	%g5
	fmovdcs	%icc,	%f4,	%f29
	std	%f12,	[%l7 + 0x20]
	fmovrdne	%i2,	%f30,	%f26
	fpadd16s	%f28,	%f3,	%f15
	ldub	[%l7 + 0x74],	%g4
	ldub	[%l7 + 0x6F],	%o3
	nop
	set	0x2A, %i6
	lduh	[%l7 + %i6],	%l5
	fsrc1s	%f29,	%f13
	stw	%g1,	[%l7 + 0x08]
	orncc	%g7,	0x0770,	%i4
	fmuld8ulx16	%f6,	%f30,	%f4
	fmovsneg	%icc,	%f16,	%f16
	stb	%l1,	[%l7 + 0x6A]
	movleu	%icc,	%o5,	%o7
	andn	%g6,	%o1,	%o4
	ld	[%l7 + 0x40],	%f18
	edge16n	%i7,	%i5,	%o2
	orn	%i1,	0x025F,	%i6
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	udiv	%l6,	0x1BC7,	%l3
	sethi	0x1D92,	%g3
	fcmped	%fcc3,	%f22,	%f2
	fsrc1	%f6,	%f24
	fcmpes	%fcc2,	%f14,	%f8
	orn	%o0,	0x1A84,	%l0
	movn	%icc,	%i3,	%l2
	ldd	[%l7 + 0x50],	%f8
	fmovsge	%icc,	%f31,	%f20
	srlx	%i0,	%g5,	%i2
	stb	%g4,	[%l7 + 0x30]
	movge	%xcc,	%o3,	%l5
	fmovdpos	%icc,	%f20,	%f1
	subccc	%g1,	0x16C3,	%g7
	movn	%icc,	%l4,	%l1
	andn	%i4,	%o7,	%o5
	fsrc2	%f24,	%f14
	st	%f16,	[%l7 + 0x5C]
	mulx	%g6,	%o1,	%i7
	movl	%xcc,	%o4,	%i5
	ldsh	[%l7 + 0x14],	%i1
	siam	0x6
	movrgz	%i6,	0x1FC,	%o6
	edge8	%g2,	%o2,	%l3
	stw	%g3,	[%l7 + 0x58]
	fpackfix	%f22,	%f19
	edge32n	%o0,	%l0,	%i3
	sra	%l6,	%i0,	%l2
	ldsb	[%l7 + 0x5B],	%i2
	lduw	[%l7 + 0x50],	%g4
	alignaddrl	%o3,	%g5,	%g1
	alignaddrl	%g7,	%l5,	%l1
	umulcc	%i4,	0x1FFD,	%o7
	fpsub32	%f6,	%f26,	%f2
	ld	[%l7 + 0x24],	%f3
	stx	%o5,	[%l7 + 0x48]
	stb	%g6,	[%l7 + 0x1D]
	sdivx	%l4,	0x18AB,	%o1
	movn	%icc,	%o4,	%i7
	edge32n	%i1,	%i6,	%o6
	edge32ln	%g2,	%i5,	%o2
	sub	%l3,	0x1975,	%g3
	fmovdgu	%xcc,	%f14,	%f5
	lduh	[%l7 + 0x6A],	%o0
	addcc	%l0,	%l6,	%i3
	sdiv	%i0,	0x137E,	%l2
	umulcc	%g4,	%i2,	%o3
	subc	%g1,	0x14CB,	%g7
	lduw	[%l7 + 0x38],	%l5
	movcc	%icc,	%l1,	%i4
	st	%f10,	[%l7 + 0x74]
	and	%g5,	0x111C,	%o5
	srlx	%g6,	%l4,	%o7
	orncc	%o1,	%o4,	%i1
	array32	%i7,	%i6,	%g2
	fone	%f24
	fmovdpos	%xcc,	%f7,	%f3
	edge32l	%o6,	%o2,	%i5
	umul	%g3,	0x114E,	%l3
	fmovrsne	%l0,	%f18,	%f15
	save %l6, %i3, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o0,	%l2,	%i2
	faligndata	%f14,	%f20,	%f0
	and	%g4,	%g1,	%o3
	fmovrslz	%g7,	%f20,	%f2
	fmovscs	%xcc,	%f7,	%f24
	popc	%l5,	%l1
	fmovrdne	%i4,	%f6,	%f28
	nop
	set	0x60, %g3
	stx	%o5,	[%l7 + %g3]
	fmovdg	%xcc,	%f29,	%f19
	array32	%g6,	%l4,	%o7
	ld	[%l7 + 0x08],	%f19
	fmovdleu	%xcc,	%f19,	%f31
	movn	%xcc,	%o1,	%o4
	subcc	%g5,	0x0E13,	%i7
	pdist	%f20,	%f16,	%f18
	movle	%icc,	%i6,	%i1
	sll	%g2,	%o2,	%o6
	array16	%g3,	%i5,	%l3
	umul	%l0,	0x0617,	%l6
	fmovdle	%icc,	%f29,	%f17
	edge32l	%i3,	%o0,	%l2
	lduw	[%l7 + 0x50],	%i0
	andncc	%g4,	%i2,	%o3
	subccc	%g1,	0x1C2F,	%g7
	fabsd	%f8,	%f18
	edge8	%l1,	%l5,	%o5
	fmovsvs	%xcc,	%f9,	%f9
	nop
	set	0x30, %l2
	ldx	[%l7 + %l2],	%g6
	alignaddr	%i4,	%o7,	%o1
	fcmpd	%fcc3,	%f6,	%f24
	xorcc	%o4,	0x06AC,	%l4
	alignaddrl	%i7,	%i6,	%i1
	alignaddrl	%g5,	%g2,	%o2
	sub	%o6,	%i5,	%l3
	edge32n	%l0,	%g3,	%l6
	fnot2	%f28,	%f10
	edge8l	%i3,	%o0,	%l2
	nop
	set	0x62, %g5
	ldsb	[%l7 + %g5],	%i0
	fmovsle	%icc,	%f28,	%f29
	movl	%xcc,	%g4,	%i2
	sllx	%o3,	%g7,	%g1
	save %l1, %l5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f18,	%f2,	%f28
	orncc	%o5,	0x1B09,	%i4
	fmovdleu	%xcc,	%f17,	%f3
	andcc	%o7,	0x0028,	%o4
	sdiv	%l4,	0x1C62,	%i7
	edge32n	%o1,	%i1,	%g5
	edge16ln	%g2,	%i6,	%o6
	fmovde	%icc,	%f31,	%f15
	array32	%o2,	%l3,	%i5
	fmovsle	%icc,	%f27,	%f15
	stw	%g3,	[%l7 + 0x48]
	movpos	%icc,	%l0,	%i3
	fnor	%f22,	%f14,	%f0
	udivx	%l6,	0x05A4,	%o0
	alignaddr	%i0,	%l2,	%i2
	fcmpgt32	%f28,	%f16,	%g4
	st	%f0,	[%l7 + 0x40]
	ldsw	[%l7 + 0x3C],	%g7
	movle	%icc,	%o3,	%l1
	movneg	%icc,	%l5,	%g1
	st	%f20,	[%l7 + 0x7C]
	andcc	%g6,	0x01ED,	%o5
	save %o7, 0x1FCB, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i4,	0x03AC,	%i7
	fnot1	%f14,	%f22
	movl	%icc,	%o1,	%i1
	ldd	[%l7 + 0x50],	%g4
	edge8l	%l4,	%i6,	%g2
	sethi	0x070F,	%o2
	edge32ln	%o6,	%i5,	%g3
	movleu	%xcc,	%l3,	%i3
	smulcc	%l6,	0x0A1D,	%o0
	orn	%i0,	%l0,	%i2
	udivx	%g4,	0x0FE6,	%l2
	andcc	%g7,	%o3,	%l1
	smulcc	%g1,	0x1A5B,	%g6
	fzero	%f26
	edge16n	%o5,	%o7,	%o4
	edge16n	%i4,	%i7,	%l5
	edge16l	%i1,	%o1,	%l4
	movne	%xcc,	%i6,	%g2
	movl	%icc,	%g5,	%o6
	fcmpne16	%f16,	%f24,	%o2
	edge16n	%i5,	%g3,	%i3
	ld	[%l7 + 0x28],	%f2
	mulscc	%l3,	0x1318,	%l6
	fmovrsgez	%o0,	%f29,	%f12
	move	%icc,	%i0,	%i2
	movrlez	%g4,	%l2,	%l0
	movrlez	%g7,	%l1,	%o3
	sra	%g6,	0x08,	%o5
	fxor	%f10,	%f20,	%f4
	or	%o7,	0x0BE7,	%g1
	udiv	%o4,	0x1BB5,	%i7
	move	%icc,	%l5,	%i1
	srl	%o1,	%i4,	%i6
	move	%xcc,	%l4,	%g2
	movre	%g5,	0x3ED,	%o6
	orcc	%i5,	%g3,	%o2
	andcc	%l3,	%i3,	%l6
	movneg	%xcc,	%i0,	%o0
	lduw	[%l7 + 0x58],	%g4
	array8	%i2,	%l2,	%l0
	fcmpne16	%f30,	%f16,	%g7
	edge16	%l1,	%g6,	%o3
	movneg	%icc,	%o5,	%o7
	movg	%icc,	%o4,	%g1
	sub	%l5,	%i1,	%o1
	sethi	0x1057,	%i7
	movcc	%icc,	%i4,	%i6
	orn	%l4,	0x01EE,	%g2
	fpack32	%f20,	%f10,	%f10
	sdivx	%o6,	0x0997,	%i5
	xorcc	%g3,	0x0764,	%o2
	orn	%g5,	%l3,	%i3
	srlx	%l6,	%o0,	%g4
	sub	%i0,	0x0D65,	%i2
	mulx	%l0,	%g7,	%l1
	subc	%l2,	%o3,	%o5
	fabsd	%f6,	%f26
	orcc	%g6,	0x1F41,	%o7
	andcc	%g1,	%o4,	%l5
	stb	%i1,	[%l7 + 0x26]
	fpadd32	%f10,	%f14,	%f8
	udiv	%i7,	0x0242,	%i4
	movneg	%icc,	%i6,	%o1
	edge32	%g2,	%l4,	%i5
	edge16	%g3,	%o6,	%g5
	edge32	%o2,	%l3,	%i3
	fsrc1s	%f18,	%f22
	udiv	%o0,	0x04E2,	%l6
	movl	%icc,	%i0,	%g4
	nop
	set	0x2E, %i1
	ldsb	[%l7 + %i1],	%i2
	fone	%f12
	movl	%xcc,	%l0,	%l1
	fpsub32	%f24,	%f6,	%f2
	movvs	%xcc,	%l2,	%g7
	movre	%o5,	%o3,	%o7
	sll	%g1,	0x0E,	%o4
	orn	%g6,	0x0754,	%i1
	movle	%xcc,	%l5,	%i4
	xor	%i6,	%o1,	%g2
	movgu	%icc,	%i7,	%l4
	fmovscs	%icc,	%f25,	%f30
	umulcc	%i5,	0x1C7D,	%g3
	fmovrsne	%g5,	%f15,	%f1
	udiv	%o2,	0x1A79,	%l3
	ldsw	[%l7 + 0x08],	%o6
	fcmpne16	%f6,	%f14,	%i3
	addc	%o0,	0x046B,	%i0
	stx	%l6,	[%l7 + 0x48]
	fmovrslz	%i2,	%f1,	%f30
	sir	0x0FEA
	restore %l0, %g4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x58, %o2
	std	%f16,	[%l7 + %o2]
	edge16l	%l1,	%o5,	%o3
	move	%xcc,	%o7,	%g1
	popc	0x178A,	%g7
	mulscc	%o4,	0x1D31,	%g6
	sub	%l5,	%i1,	%i4
	orn	%o1,	%g2,	%i7
	st	%f4,	[%l7 + 0x08]
	movrlez	%i6,	%l4,	%g3
	xorcc	%g5,	%o2,	%l3
	movle	%icc,	%i5,	%o6
	sir	0x1DA2
	edge16n	%i3,	%i0,	%o0
	sllx	%l6,	%l0,	%i2
	alignaddr	%g4,	%l1,	%o5
	edge16l	%l2,	%o3,	%g1
	umulcc	%g7,	0x0EE8,	%o7
	sub	%g6,	%o4,	%i1
	stb	%i4,	[%l7 + 0x71]
	ldub	[%l7 + 0x73],	%o1
	movg	%xcc,	%l5,	%i7
	stw	%g2,	[%l7 + 0x7C]
	edge8n	%i6,	%g3,	%l4
	fpsub16	%f24,	%f28,	%f26
	fcmped	%fcc2,	%f30,	%f16
	fcmpgt32	%f2,	%f12,	%o2
	movcs	%icc,	%l3,	%g5
	movn	%xcc,	%i5,	%o6
	fmovrse	%i0,	%f0,	%f17
	sllx	%i3,	%o0,	%l0
	fxors	%f27,	%f0,	%f15
	fmovda	%xcc,	%f14,	%f31
	sll	%i2,	0x04,	%l6
	smulcc	%l1,	%g4,	%o5
	udiv	%l2,	0x1E1F,	%o3
	sdiv	%g1,	0x1EB3,	%o7
	fmovdcs	%xcc,	%f13,	%f23
	fpsub32s	%f7,	%f6,	%f18
	umul	%g6,	0x01CE,	%g7
	fornot1	%f26,	%f26,	%f0
	array32	%i1,	%o4,	%o1
	or	%i4,	0x051F,	%l5
	fpmerge	%f20,	%f4,	%f28
	addccc	%g2,	%i6,	%g3
	fmovsn	%icc,	%f3,	%f29
	andcc	%l4,	0x1E0A,	%o2
	edge8n	%i7,	%l3,	%g5
	array8	%o6,	%i5,	%i3
	movrgez	%o0,	%i0,	%i2
	movvc	%xcc,	%l0,	%l6
	orn	%l1,	0x00D7,	%g4
	array32	%l2,	%o3,	%g1
	movne	%icc,	%o5,	%o7
	fmovrdlez	%g6,	%f4,	%f10
	stw	%i1,	[%l7 + 0x44]
	st	%f8,	[%l7 + 0x54]
	subcc	%g7,	0x099F,	%o4
	mova	%xcc,	%i4,	%o1
	fnor	%f8,	%f20,	%f10
	faligndata	%f12,	%f30,	%f22
	fone	%f24
	sdiv	%l5,	0x052A,	%i6
	movne	%xcc,	%g2,	%l4
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	movrgez	%l3,	%o2,	%g5
	sdiv	%o6,	0x17F9,	%i5
	umulcc	%o0,	%i0,	%i2
	edge16ln	%i3,	%l6,	%l1
	movrgz	%g4,	%l2,	%o3
	movrlez	%g1,	0x30C,	%l0
	addcc	%o5,	%g6,	%o7
	sllx	%g7,	%o4,	%i1
	fmovsn	%xcc,	%f0,	%f25
	udivx	%o1,	0x1099,	%i4
	ld	[%l7 + 0x4C],	%f9
	movpos	%xcc,	%i6,	%g2
	mova	%xcc,	%l5,	%g3
	srax	%i7,	0x19,	%l3
	udivcc	%l4,	0x0441,	%g5
	ld	[%l7 + 0x18],	%f10
	xorcc	%o2,	%i5,	%o0
	sdivx	%i0,	0x101F,	%i2
	orcc	%i3,	%o6,	%l6
	movvc	%xcc,	%g4,	%l2
	orn	%o3,	0x1E2F,	%g1
	ldsw	[%l7 + 0x48],	%l1
	fcmpgt16	%f30,	%f4,	%l0
	movn	%xcc,	%o5,	%g6
	ldsh	[%l7 + 0x2A],	%o7
	sdiv	%g7,	0x05F8,	%o4
	sllx	%o1,	0x12,	%i1
	fmovd	%f2,	%f10
	movl	%icc,	%i4,	%i6
	and	%l5,	0x1329,	%g2
	udivx	%i7,	0x1D75,	%l3
	movre	%l4,	0x3A0,	%g5
	array16	%g3,	%i5,	%o2
	for	%f28,	%f16,	%f10
	lduw	[%l7 + 0x70],	%i0
	array16	%i2,	%i3,	%o6
	ldsb	[%l7 + 0x1C],	%o0
	movn	%icc,	%g4,	%l2
	move	%xcc,	%o3,	%l6
	fornot1	%f10,	%f16,	%f14
	xnorcc	%g1,	%l0,	%o5
	movge	%icc,	%g6,	%o7
	andn	%l1,	%o4,	%g7
	fmovsne	%xcc,	%f10,	%f19
	edge16l	%i1,	%o1,	%i4
	movneg	%xcc,	%i6,	%l5
	srax	%g2,	%i7,	%l3
	orcc	%l4,	%g5,	%g3
	edge32n	%i5,	%i0,	%i2
	srlx	%i3,	0x14,	%o6
	movg	%icc,	%o0,	%g4
	nop
	set	0x78, %g1
	ldx	[%l7 + %g1],	%o2
	popc	%l2,	%o3
	subcc	%l6,	0x0F8A,	%l0
	movvs	%xcc,	%o5,	%g6
	fmovs	%f25,	%f29
	fandnot2s	%f28,	%f4,	%f1
	xor	%g1,	%o7,	%o4
	edge8l	%l1,	%i1,	%o1
	move	%xcc,	%g7,	%i6
	ldd	[%l7 + 0x48],	%l4
	mulx	%i4,	0x0EE0,	%i7
	edge32n	%g2,	%l4,	%l3
	movrlz	%g5,	0x332,	%i5
	sth	%g3,	[%l7 + 0x42]
	srlx	%i2,	0x1F,	%i3
	orncc	%i0,	%o6,	%o0
	andn	%o2,	%g4,	%l2
	stw	%l6,	[%l7 + 0x30]
	sir	0x0801
	alignaddr	%l0,	%o5,	%g6
	subccc	%g1,	%o3,	%o7
	fandnot1	%f26,	%f20,	%f22
	movrgz	%o4,	0x36F,	%l1
	movneg	%xcc,	%o1,	%g7
	array32	%i1,	%i6,	%l5
	edge16n	%i4,	%g2,	%l4
	fpsub16	%f28,	%f16,	%f28
	save %i7, %l3, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%i5,	%g3
	mulscc	%i3,	0x0B91,	%i2
	edge32ln	%o6,	%o0,	%o2
	fcmpd	%fcc2,	%f26,	%f22
	fpsub16s	%f29,	%f25,	%f8
	restore %i0, 0x1EED, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l6,	%l2,	%o5
	array32	%g6,	%g1,	%o3
	movcs	%icc,	%o7,	%l0
	movgu	%icc,	%o4,	%l1
	xorcc	%g7,	0x0436,	%i1
	or	%i6,	0x15B8,	%l5
	movcc	%icc,	%o1,	%g2
	movrlz	%i4,	%i7,	%l4
	addcc	%g5,	%i5,	%l3
	stw	%i3,	[%l7 + 0x10]
	mulx	%i2,	%o6,	%g3
	ldd	[%l7 + 0x60],	%o0
	sll	%i0,	%g4,	%l6
	movrlz	%o2,	%l2,	%o5
	udiv	%g1,	0x1EA3,	%o3
	xnorcc	%o7,	0x1FB9,	%g6
	mova	%icc,	%o4,	%l0
	mulscc	%g7,	%l1,	%i1
	subcc	%i6,	0x1656,	%l5
	movleu	%xcc,	%o1,	%g2
	fcmple16	%f8,	%f20,	%i4
	edge32l	%l4,	%i7,	%i5
	fsrc1s	%f31,	%f27
	edge32	%g5,	%l3,	%i3
	movneg	%icc,	%i2,	%g3
	fpack32	%f16,	%f22,	%f10
	movcc	%icc,	%o6,	%i0
	andncc	%g4,	%o0,	%l6
	xnor	%o2,	0x1987,	%l2
	addccc	%g1,	%o5,	%o3
	lduh	[%l7 + 0x1C],	%g6
	mulscc	%o4,	0x03A8,	%l0
	ldx	[%l7 + 0x38],	%g7
	ldd	[%l7 + 0x68],	%o6
	save %i1, %i6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l1,	%g2,	%i4
	udivx	%l4,	0x0437,	%o1
	st	%f6,	[%l7 + 0x14]
	fmovdl	%icc,	%f28,	%f9
	sdivcc	%i7,	0x0CC5,	%g5
	nop
	set	0x14, %l4
	stw	%i5,	[%l7 + %l4]
	fmovspos	%xcc,	%f2,	%f20
	array8	%i3,	%l3,	%i2
	sth	%g3,	[%l7 + 0x7A]
	orncc	%o6,	0x143F,	%g4
	xorcc	%o0,	0x152C,	%i0
	fand	%f24,	%f26,	%f16
	fmovdpos	%icc,	%f21,	%f6
	array8	%o2,	%l2,	%g1
	edge32l	%o5,	%l6,	%o3
	fmovdvs	%xcc,	%f3,	%f11
	ldd	[%l7 + 0x20],	%f10
	st	%f5,	[%l7 + 0x50]
	sdiv	%o4,	0x0CEE,	%l0
	ldd	[%l7 + 0x50],	%f28
	fsrc2	%f28,	%f10
	fpsub16s	%f17,	%f7,	%f1
	fcmpgt32	%f6,	%f8,	%g7
	movgu	%xcc,	%g6,	%i1
	addcc	%o7,	0x171C,	%l5
	edge16	%l1,	%g2,	%i4
	addc	%l4,	0x1CD5,	%o1
	edge16ln	%i7,	%g5,	%i5
	alignaddr	%i3,	%i6,	%l3
	fands	%f22,	%f8,	%f20
	movcc	%xcc,	%g3,	%i2
	movn	%xcc,	%g4,	%o0
	orn	%o6,	%i0,	%o2
	addc	%l2,	0x0184,	%g1
	add	%l6,	0x18CB,	%o5
	edge8l	%o4,	%l0,	%o3
	ldsw	[%l7 + 0x2C],	%g7
	ldsh	[%l7 + 0x6E],	%i1
	movvs	%icc,	%o7,	%l5
	edge32ln	%g6,	%l1,	%g2
	mulscc	%l4,	0x07C4,	%o1
	sethi	0x047E,	%i7
	fxors	%f18,	%f4,	%f22
	mulx	%g5,	0x083F,	%i4
	move	%icc,	%i3,	%i5
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	movleu	%icc,	%i2,	%g4
	movrlz	%o0,	0x33D,	%i0
	faligndata	%f6,	%f2,	%f6
	fmovdg	%icc,	%f24,	%f10
	ldub	[%l7 + 0x52],	%o6
	lduh	[%l7 + 0x5A],	%o2
	fpadd16	%f20,	%f12,	%f4
	fmul8ulx16	%f8,	%f14,	%f24
	ldx	[%l7 + 0x68],	%g1
	fors	%f21,	%f0,	%f10
	fcmpes	%fcc2,	%f16,	%f21
	edge16ln	%l2,	%l6,	%o5
	ldsb	[%l7 + 0x36],	%l0
	movpos	%icc,	%o3,	%g7
	sethi	0x1175,	%o4
	ldd	[%l7 + 0x60],	%i0
	fcmpd	%fcc3,	%f10,	%f0
	fandnot1	%f28,	%f12,	%f2
	addccc	%l5,	0x1F5D,	%g6
	movrne	%o7,	%l1,	%g2
	ldub	[%l7 + 0x7A],	%l4
	lduh	[%l7 + 0x3E],	%i7
	movl	%icc,	%g5,	%i4
	fandnot1	%f16,	%f8,	%f28
	ldub	[%l7 + 0x23],	%o1
	edge32ln	%i5,	%i6,	%i3
	sra	%g3,	%l3,	%g4
	popc	%i2,	%o0
	lduh	[%l7 + 0x44],	%i0
	movneg	%xcc,	%o2,	%g1
	edge32n	%l2,	%l6,	%o5
	udivx	%o6,	0x0DEA,	%o3
	edge32l	%g7,	%l0,	%o4
	fmuld8sux16	%f18,	%f21,	%f30
	addcc	%l5,	%i1,	%o7
	fpsub32s	%f22,	%f24,	%f15
	orncc	%g6,	%l1,	%g2
	edge16	%l4,	%i7,	%i4
	ldsb	[%l7 + 0x25],	%o1
	movcs	%xcc,	%i5,	%g5
	movge	%xcc,	%i3,	%i6
	array16	%g3,	%l3,	%i2
	add	%g4,	0x0479,	%i0
	fmovsa	%xcc,	%f14,	%f10
	xnor	%o0,	%g1,	%l2
	array8	%o2,	%o5,	%l6
	or	%o3,	%g7,	%l0
	movle	%xcc,	%o6,	%l5
	mulx	%i1,	%o4,	%o7
	ldub	[%l7 + 0x4F],	%l1
	udivcc	%g2,	0x10CD,	%l4
	addcc	%g6,	0x017E,	%i7
	move	%xcc,	%i4,	%o1
	array32	%g5,	%i5,	%i6
	movl	%icc,	%g3,	%i3
	addccc	%l3,	%i2,	%i0
	add	%o0,	0x15B0,	%g4
	movvs	%xcc,	%g1,	%o2
	fmovde	%xcc,	%f17,	%f12
	edge16n	%l2,	%o5,	%o3
	array8	%l6,	%g7,	%o6
	ldsh	[%l7 + 0x0A],	%l5
	movre	%l0,	0x390,	%o4
	ldsw	[%l7 + 0x78],	%i1
	fmovrsne	%o7,	%f3,	%f31
	movpos	%icc,	%l1,	%g2
	fandnot1s	%f20,	%f29,	%f11
	lduw	[%l7 + 0x48],	%l4
	srl	%i7,	0x03,	%g6
	movcs	%xcc,	%o1,	%i4
	movrlz	%g5,	%i5,	%g3
	sir	0x08EF
	nop
	set	0x52, %g2
	sth	%i6,	[%l7 + %g2]
	sub	%l3,	0x1E7E,	%i2
	movneg	%icc,	%i0,	%o0
	subc	%i3,	%g1,	%g4
	edge32ln	%l2,	%o2,	%o5
	fxnor	%f14,	%f30,	%f0
	sub	%l6,	%g7,	%o3
	movrlez	%l5,	%l0,	%o4
	array32	%o6,	%i1,	%o7
	sth	%g2,	[%l7 + 0x20]
	udivcc	%l1,	0x11ED,	%l4
	addc	%g6,	%i7,	%o1
	edge32ln	%i4,	%g5,	%g3
	fcmpes	%fcc2,	%f15,	%f15
	lduh	[%l7 + 0x7A],	%i5
	ldsb	[%l7 + 0x7D],	%l3
	edge8ln	%i6,	%i2,	%o0
	fmovdne	%icc,	%f15,	%f2
	movcs	%icc,	%i3,	%g1
	srlx	%g4,	0x0A,	%l2
	sethi	0x1222,	%i0
	movne	%xcc,	%o2,	%o5
	stb	%l6,	[%l7 + 0x77]
	sdivcc	%o3,	0x1083,	%l5
	fmovsle	%xcc,	%f29,	%f3
	andcc	%l0,	0x15D4,	%o4
	array32	%g7,	%i1,	%o6
	andcc	%g2,	0x1FB7,	%l1
	andn	%o7,	%g6,	%i7
	subc	%l4,	%o1,	%i4
	fcmps	%fcc3,	%f19,	%f21
	movg	%icc,	%g3,	%g5
	fzero	%f10
	movn	%icc,	%i5,	%l3
	fcmple16	%f10,	%f2,	%i2
	fmovrslz	%i6,	%f15,	%f30
	fandnot2s	%f19,	%f27,	%f28
	and	%i3,	0x0998,	%g1
	std	%f4,	[%l7 + 0x30]
	edge8	%o0,	%g4,	%i0
	movrne	%o2,	0x344,	%o5
	udiv	%l2,	0x15CD,	%o3
	addcc	%l6,	%l0,	%l5
	edge32	%g7,	%i1,	%o6
	sir	0x1763
	array16	%o4,	%g2,	%o7
	sra	%l1,	%i7,	%l4
	fmovdvs	%xcc,	%f14,	%f25
	fcmpeq32	%f12,	%f14,	%o1
	andn	%i4,	0x09D9,	%g6
	nop
	set	0x78, %o3
	stx	%g3,	[%l7 + %o3]
	movpos	%xcc,	%i5,	%g5
	ldsh	[%l7 + 0x0E],	%l3
	sir	0x14D7
	fmovscc	%icc,	%f21,	%f21
	movrlz	%i6,	%i2,	%i3
	stx	%g1,	[%l7 + 0x10]
	edge16l	%g4,	%o0,	%o2
	fnot1	%f18,	%f30
	mulscc	%o5,	0x195E,	%l2
	sethi	0x12B0,	%o3
	fcmple16	%f30,	%f6,	%i0
	or	%l6,	%l0,	%l5
	alignaddr	%i1,	%g7,	%o6
	edge32n	%g2,	%o7,	%l1
	mova	%xcc,	%o4,	%i7
	andncc	%o1,	%l4,	%i4
	movrgz	%g6,	0x1F6,	%g3
	fmovdne	%icc,	%f15,	%f5
	movrgez	%i5,	%l3,	%g5
	xnorcc	%i6,	%i2,	%g1
	fcmpeq16	%f6,	%f26,	%i3
	fmul8sux16	%f30,	%f28,	%f0
	orn	%o0,	0x1C08,	%o2
	alignaddr	%g4,	%o5,	%o3
	lduw	[%l7 + 0x28],	%i0
	sir	0x0929
	fzeros	%f22
	save %l6, 0x1C0B, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l0,	%l5,	%i1
	bshuffle	%f18,	%f30,	%f2
	addccc	%o6,	0x109C,	%g2
	fmovrse	%g7,	%f19,	%f7
	ld	[%l7 + 0x30],	%f11
	sdivcc	%o7,	0x07E0,	%o4
	array8	%l1,	%i7,	%o1
	edge8l	%i4,	%l4,	%g6
	stw	%g3,	[%l7 + 0x60]
	fcmple32	%f20,	%f10,	%i5
	fmovsl	%icc,	%f18,	%f25
	udivx	%l3,	0x072B,	%i6
	udivcc	%g5,	0x1F2E,	%i2
	nop
	set	0x68, %i0
	lduw	[%l7 + %i0],	%i3
	and	%g1,	%o2,	%o0
	ldsb	[%l7 + 0x0C],	%g4
	lduh	[%l7 + 0x58],	%o3
	nop
	set	0x31, %i4
	stb	%o5,	[%l7 + %i4]
	sethi	0x09DA,	%l6
	subc	%i0,	%l2,	%l0
	alignaddrl	%l5,	%i1,	%g2
	mulscc	%o6,	%o7,	%o4
	stw	%g7,	[%l7 + 0x38]
	fpsub32	%f20,	%f4,	%f28
	movre	%l1,	0x27B,	%i7
	srax	%o1,	%l4,	%g6
	movvc	%xcc,	%g3,	%i5
	addcc	%l3,	%i4,	%g5
	stx	%i2,	[%l7 + 0x28]
	movre	%i6,	%i3,	%o2
	edge32l	%o0,	%g1,	%g4
	udivx	%o3,	0x0F74,	%o5
	alignaddrl	%l6,	%i0,	%l2
	edge8l	%l0,	%i1,	%g2
	movrlz	%o6,	0x226,	%o7
	and	%o4,	%l5,	%g7
	movcs	%icc,	%i7,	%l1
	fnegd	%f28,	%f0
	sdivx	%l4,	0x146F,	%g6
	edge32n	%o1,	%g3,	%i5
	edge32l	%l3,	%g5,	%i4
	alignaddr	%i2,	%i6,	%o2
	stb	%o0,	[%l7 + 0x39]
	movge	%xcc,	%i3,	%g4
	add	%g1,	0x1733,	%o5
	restore %o3, %l6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i0,	%l0,	%g2
	sra	%i1,	%o7,	%o6
	subccc	%l5,	%o4,	%g7
	fmovdvc	%icc,	%f18,	%f13
	movneg	%icc,	%l1,	%i7
	fsrc2s	%f12,	%f17
	movn	%xcc,	%g6,	%o1
	fmovdvs	%xcc,	%f26,	%f29
	fornot2	%f26,	%f20,	%f30
	fmovdg	%icc,	%f31,	%f25
	movcs	%xcc,	%l4,	%i5
	udivcc	%l3,	0x0791,	%g5
	array32	%i4,	%g3,	%i2
	move	%xcc,	%o2,	%o0
	ldsb	[%l7 + 0x35],	%i6
	fmovdgu	%icc,	%f27,	%f2
	orcc	%i3,	0x0D85,	%g1
	and	%o5,	%o3,	%g4
	stb	%l6,	[%l7 + 0x32]
	edge16	%i0,	%l2,	%g2
	sdivcc	%l0,	0x124B,	%o7
	movpos	%xcc,	%i1,	%o6
	edge8	%o4,	%g7,	%l5
	fandnot1s	%f11,	%f10,	%f1
	move	%xcc,	%i7,	%g6
	fpmerge	%f27,	%f3,	%f20
	fmovrde	%l1,	%f20,	%f18
	sdivcc	%l4,	0x157D,	%i5
	mulscc	%o1,	%g5,	%l3
	lduw	[%l7 + 0x74],	%i4
	lduh	[%l7 + 0x28],	%i2
	fmovrdlz	%g3,	%f10,	%f28
	fmovs	%f0,	%f14
	fnot2s	%f20,	%f12
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	move	%icc,	%o2,	%g1
	fsrc1s	%f6,	%f3
	fmovdvs	%xcc,	%f17,	%f29
	popc	0x1869,	%o5
	add	%o3,	0x04A9,	%i3
	sdivx	%g4,	0x1077,	%l6
	fexpand	%f30,	%f20
	and	%i0,	%l2,	%l0
	movl	%xcc,	%g2,	%o7
	edge16l	%i1,	%o4,	%o6
	sra	%l5,	%i7,	%g6
	and	%l1,	%g7,	%l4
	movrgz	%i5,	0x335,	%g5
	fnand	%f22,	%f8,	%f6
	fmovsne	%xcc,	%f5,	%f14
	edge16l	%o1,	%l3,	%i2
	udivcc	%g3,	0x0820,	%i4
	movcs	%icc,	%o0,	%i6
	sub	%o2,	0x1897,	%o5
	fmovs	%f7,	%f6
	movrne	%o3,	0x22E,	%g1
	ldsw	[%l7 + 0x34],	%i3
	fmovsvs	%xcc,	%f13,	%f14
	movcs	%icc,	%g4,	%i0
	movleu	%xcc,	%l6,	%l2
	sllx	%l0,	0x0D,	%g2
	and	%o7,	%i1,	%o4
	xnor	%o6,	%l5,	%i7
	udiv	%l1,	0x0181,	%g7
	array8	%l4,	%g6,	%g5
	sra	%i5,	0x1F,	%l3
	fmovsg	%xcc,	%f5,	%f28
	xnor	%o1,	0x089D,	%i2
	movrlez	%g3,	%i4,	%o0
	sdiv	%i6,	0x0B74,	%o5
	umul	%o2,	0x18B7,	%g1
	fxor	%f8,	%f4,	%f16
	mulscc	%i3,	%o3,	%i0
	orn	%g4,	0x1E18,	%l6
	fmovsvs	%icc,	%f2,	%f10
	fmovrdlez	%l2,	%f16,	%f2
	mova	%icc,	%l0,	%o7
	orncc	%i1,	%g2,	%o6
	movvs	%icc,	%l5,	%o4
	fmovdne	%xcc,	%f9,	%f14
	nop
	set	0x58, %g7
	stx	%i7,	[%l7 + %g7]
	movvs	%xcc,	%g7,	%l4
	edge8l	%l1,	%g6,	%g5
	udivcc	%i5,	0x0DEB,	%o1
	mulscc	%i2,	%g3,	%i4
	lduh	[%l7 + 0x3C],	%o0
	stb	%i6,	[%l7 + 0x28]
	nop
	set	0x60, %g6
	ldsh	[%l7 + %g6],	%l3
	fpadd16	%f0,	%f2,	%f14
	movrne	%o5,	%o2,	%g1
	popc	%o3,	%i0
	fzeros	%f15
	ldsw	[%l7 + 0x64],	%i3
	or	%l6,	0x1146,	%g4
	movrlz	%l2,	0x1B5,	%l0
	edge8ln	%o7,	%i1,	%o6
	addccc	%g2,	0x1A32,	%o4
	movgu	%icc,	%l5,	%g7
	fmovsgu	%xcc,	%f5,	%f13
	xor	%i7,	%l4,	%g6
	fmovsl	%xcc,	%f29,	%f24
	fpadd16	%f30,	%f24,	%f12
	fmovrsgz	%l1,	%f24,	%f11
	sth	%g5,	[%l7 + 0x3E]
	fnegs	%f3,	%f29
	movrgz	%o1,	0x035,	%i2
	edge8l	%g3,	%i5,	%i4
	subcc	%o0,	%l3,	%i6
	edge16	%o2,	%g1,	%o5
	fxnors	%f9,	%f1,	%f20
	udiv	%o3,	0x0D11,	%i0
	sdiv	%l6,	0x0CCB,	%g4
	udivcc	%l2,	0x1EFC,	%i3
	fmovdgu	%xcc,	%f7,	%f12
	mova	%xcc,	%o7,	%l0
	edge8ln	%i1,	%g2,	%o6
	edge16ln	%o4,	%l5,	%g7
	movre	%l4,	%g6,	%l1
	andncc	%g5,	%i7,	%o1
	fmovsn	%icc,	%f13,	%f27
	fsrc2s	%f14,	%f27
	edge8ln	%i2,	%g3,	%i5
	movne	%icc,	%o0,	%l3
	fornot2s	%f17,	%f20,	%f20
	ldub	[%l7 + 0x12],	%i6
	ldsb	[%l7 + 0x62],	%o2
	xor	%i4,	%g1,	%o5
	edge16l	%o3,	%i0,	%g4
	movn	%xcc,	%l2,	%l6
	addcc	%o7,	0x088B,	%l0
	fmovrdlz	%i3,	%f16,	%f20
	fpack32	%f10,	%f22,	%f24
	subc	%i1,	0x1CF5,	%o6
	xnorcc	%g2,	0x1FFF,	%o4
	addc	%l5,	0x0C21,	%l4
	fcmple32	%f10,	%f20,	%g6
	ldsb	[%l7 + 0x55],	%g7
	edge32ln	%l1,	%g5,	%o1
	movrgz	%i7,	0x260,	%g3
	restore %i2, %o0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i5,	0x380,	%i6
	subc	%i4,	0x0469,	%o2
	xnor	%g1,	%o3,	%i0
	std	%f26,	[%l7 + 0x58]
	addc	%g4,	%l2,	%o5
	subccc	%o7,	%l0,	%i3
	fmovrde	%l6,	%f24,	%f26
	smulcc	%o6,	0x0D6D,	%g2
	fcmpes	%fcc0,	%f30,	%f19
	fsrc2s	%f17,	%f24
	nop
	set	0x7E, %o1
	ldsb	[%l7 + %o1],	%i1
	sub	%l5,	0x18A2,	%l4
	add	%g6,	%g7,	%l1
	subccc	%o4,	0x0E7B,	%g5
	fmovrdgz	%i7,	%f24,	%f10
	stw	%g3,	[%l7 + 0x40]
	addc	%o1,	0x056D,	%o0
	subc	%i2,	%i5,	%l3
	fcmpeq32	%f26,	%f4,	%i4
	edge8ln	%o2,	%i6,	%g1
	fnot2s	%f24,	%f13
	mulscc	%o3,	0x1DEB,	%i0
	edge16n	%l2,	%g4,	%o7
	sdivcc	%l0,	0x1212,	%i3
	fmovsleu	%xcc,	%f23,	%f13
	subc	%o5,	0x1DC4,	%o6
	fpsub32	%f30,	%f8,	%f28
	umulcc	%g2,	0x000A,	%l6
	sethi	0x00CD,	%l5
	ldd	[%l7 + 0x28],	%f14
	andn	%l4,	0x1DD2,	%i1
	sdivcc	%g6,	0x19DA,	%g7
	andn	%o4,	%g5,	%l1
	movne	%xcc,	%g3,	%o1
	save %i7, 0x00C0, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x18],	%o0
	edge32ln	%l3,	%i4,	%o2
	sth	%i5,	[%l7 + 0x66]
	fmul8ulx16	%f18,	%f12,	%f20
	stb	%i6,	[%l7 + 0x15]
	movcc	%xcc,	%o3,	%g1
	fmovd	%f2,	%f4
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%i0
	edge32	%l2,	%o7,	%l0
	fcmpeq16	%f30,	%f6,	%i3
	fabsd	%f20,	%f2
	orcc	%g4,	%o6,	%o5
	smulcc	%g2,	%l5,	%l4
	movvs	%icc,	%l6,	%g6
	movcc	%xcc,	%g7,	%i1
	fmovrsgz	%o4,	%f7,	%f3
	movne	%icc,	%l1,	%g5
	srax	%o1,	0x09,	%g3
	and	%i7,	%o0,	%i2
	sethi	0x1F25,	%l3
	fmovsvc	%icc,	%f25,	%f4
	srl	%o2,	%i4,	%i6
	sir	0x0AAA
	movge	%icc,	%o3,	%i5
	lduh	[%l7 + 0x52],	%g1
	addccc	%l2,	0x1272,	%o7
	movneg	%icc,	%l0,	%i3
	subcc	%g4,	0x1566,	%o6
	ldd	[%l7 + 0x30],	%i0
	move	%icc,	%o5,	%l5
	movrgez	%l4,	0x157,	%l6
	addcc	%g2,	%g6,	%g7
	ldsh	[%l7 + 0x5A],	%i1
	sdiv	%l1,	0x12F9,	%g5
	or	%o1,	0x0634,	%g3
	movg	%icc,	%o4,	%o0
	ldd	[%l7 + 0x60],	%i6
	andncc	%l3,	%o2,	%i4
	fpsub16	%f28,	%f18,	%f22
	fsrc2s	%f11,	%f23
	ldub	[%l7 + 0x1E],	%i2
	move	%xcc,	%o3,	%i5
	srax	%i6,	0x12,	%g1
	umulcc	%o7,	0x1C2E,	%l0
	move	%icc,	%l2,	%i3
	edge16l	%g4,	%o6,	%o5
	movvc	%xcc,	%l5,	%i0
	sllx	%l6,	0x15,	%g2
	movpos	%icc,	%l4,	%g7
	movrgz	%i1,	%l1,	%g5
	fornot2	%f20,	%f8,	%f8
	fmovd	%f8,	%f24
	fsrc2	%f28,	%f22
	orncc	%o1,	0x0DA2,	%g6
	xnorcc	%g3,	%o4,	%o0
	xorcc	%i7,	%l3,	%o2
	umulcc	%i2,	%o3,	%i5
	fmovsne	%icc,	%f13,	%f1
	fmovd	%f30,	%f22
	udivx	%i4,	0x068C,	%g1
	stb	%o7,	[%l7 + 0x44]
	fmovrslz	%l0,	%f7,	%f12
	mulscc	%l2,	0x1374,	%i6
	umulcc	%g4,	0x1637,	%o6
	lduh	[%l7 + 0x3E],	%i3
	fpadd16	%f8,	%f2,	%f8
	addc	%l5,	%i0,	%o5
	movvs	%xcc,	%g2,	%l6
	sll	%l4,	%i1,	%l1
	orn	%g5,	%o1,	%g7
	edge8l	%g6,	%g3,	%o0
	udivx	%o4,	0x0DCA,	%i7
	fabss	%f0,	%f11
	ld	[%l7 + 0x50],	%f9
	fmovdcc	%icc,	%f26,	%f7
	fcmped	%fcc3,	%f2,	%f26
	alignaddr	%o2,	%i2,	%o3
	or	%l3,	0x1508,	%i5
	ldd	[%l7 + 0x50],	%f28
	udivcc	%g1,	0x1E70,	%o7
	fmovrse	%i4,	%f21,	%f17
	ldx	[%l7 + 0x40],	%l2
	sllx	%i6,	%l0,	%o6
	edge16ln	%g4,	%i3,	%l5
	stw	%o5,	[%l7 + 0x78]
	edge8	%g2,	%i0,	%l4
	ldd	[%l7 + 0x30],	%f30
	xnor	%i1,	0x0000,	%l6
	fmovrdlz	%g5,	%f28,	%f2
	fmovsg	%xcc,	%f26,	%f10
	xor	%o1,	0x1976,	%g7
	or	%g6,	%l1,	%o0
	ldub	[%l7 + 0x73],	%g3
	movre	%o4,	%o2,	%i2
	add	%o3,	0x1DC4,	%l3
	andncc	%i5,	%g1,	%o7
	udivx	%i7,	0x095A,	%i4
	andcc	%l2,	0x0975,	%l0
	fmul8sux16	%f16,	%f12,	%f2
	umulcc	%i6,	%o6,	%i3
	sdivx	%l5,	0x0B96,	%o5
	st	%f13,	[%l7 + 0x50]
	add	%g4,	0x049C,	%i0
	fmovrse	%g2,	%f9,	%f27
	sll	%l4,	%l6,	%i1
	fones	%f8
	save %o1, 0x0BC5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g5,	%l1,	%o0
	popc	0x044F,	%g3
	umulcc	%o4,	%g6,	%o2
	fmovsge	%icc,	%f14,	%f17
	fmovrsgz	%i2,	%f22,	%f25
	sub	%l3,	%i5,	%o3
	fmovsle	%icc,	%f1,	%f9
	edge16ln	%g1,	%i7,	%i4
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	fpack32	%f6,	%f12,	%f26
	save %l2, 0x15C7, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i6,	%i3
	xnor	%o5,	0x0D35,	%l5
	orn	%g4,	0x0517,	%g2
	stw	%l4,	[%l7 + 0x08]
	stw	%l6,	[%l7 + 0x64]
	movre	%i0,	0x377,	%o1
	stb	%i1,	[%l7 + 0x78]
	andncc	%g5,	%g7,	%o0
	edge32n	%g3,	%l1,	%o4
	sdivcc	%g6,	0x10D8,	%i2
	movrlz	%l3,	%i5,	%o3
	xor	%g1,	%i7,	%i4
	lduw	[%l7 + 0x0C],	%o2
	ldd	[%l7 + 0x30],	%f12
	std	%f8,	[%l7 + 0x20]
	movn	%icc,	%l0,	%l2
	lduw	[%l7 + 0x4C],	%o7
	edge16	%o6,	%i3,	%o5
	alignaddrl	%l5,	%g4,	%g2
	movgu	%xcc,	%l4,	%i6
	sra	%i0,	%l6,	%i1
	srax	%o1,	%g7,	%g5
	fmovdneg	%icc,	%f12,	%f16
	fmovrsne	%g3,	%f27,	%f8
	movl	%xcc,	%o0,	%l1
	edge32ln	%g6,	%o4,	%l3
	srax	%i5,	0x1A,	%o3
	fpmerge	%f5,	%f8,	%f8
	addc	%i2,	0x15C2,	%g1
	fand	%f18,	%f0,	%f20
	movrlz	%i7,	%i4,	%l0
	smulcc	%l2,	0x1255,	%o2
	movcs	%xcc,	%o6,	%o7
	movcs	%icc,	%o5,	%l5
	fmovda	%xcc,	%f27,	%f31
	movvc	%xcc,	%i3,	%g4
	edge16n	%g2,	%l4,	%i6
	fmovsn	%xcc,	%f16,	%f29
	movvc	%xcc,	%i0,	%l6
	edge32ln	%o1,	%g7,	%i1
	fpack16	%f16,	%f3
	udivx	%g3,	0x1BE2,	%g5
	stw	%l1,	[%l7 + 0x14]
	move	%xcc,	%g6,	%o0
	addccc	%o4,	%i5,	%o3
	edge32	%l3,	%g1,	%i7
	fnot2s	%f14,	%f23
	edge8l	%i2,	%l0,	%i4
	lduw	[%l7 + 0x60],	%l2
	ldx	[%l7 + 0x40],	%o2
	smul	%o7,	%o6,	%o5
	edge8l	%l5,	%g4,	%i3
	fmul8sux16	%f26,	%f14,	%f10
	restore %g2, 0x091E, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i0,	%l4,	%o1
	subc	%l6,	0x1A2E,	%i1
	addcc	%g7,	%g5,	%g3
	edge8l	%l1,	%o0,	%o4
	fornot1s	%f28,	%f20,	%f27
	stw	%g6,	[%l7 + 0x38]
	fmul8x16	%f27,	%f0,	%f4
	alignaddrl	%o3,	%l3,	%g1
	sir	0x0BC6
	umulcc	%i5,	0x0D36,	%i7
	orn	%i2,	%l0,	%l2
	udivx	%i4,	0x1288,	%o7
	movle	%xcc,	%o2,	%o6
	fmovdg	%xcc,	%f19,	%f8
	movvs	%icc,	%o5,	%l5
	alignaddr	%i3,	%g2,	%i6
	stb	%g4,	[%l7 + 0x63]
	umulcc	%i0,	%l4,	%o1
	and	%i1,	0x052C,	%l6
	lduw	[%l7 + 0x38],	%g5
	ld	[%l7 + 0x70],	%f5
	fpadd16s	%f1,	%f13,	%f30
	mova	%xcc,	%g7,	%l1
	fmovsn	%xcc,	%f5,	%f19
	movrgz	%o0,	%g3,	%g6
	fmovsa	%icc,	%f8,	%f18
	ldx	[%l7 + 0x30],	%o4
	mova	%icc,	%o3,	%g1
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	edge32n	%l3,	%i2,	%l0
	fands	%f11,	%f8,	%f23
	edge32	%i4,	%l2,	%o2
	udivcc	%o7,	0x0B31,	%o6
	edge8ln	%o5,	%i3,	%g2
	fpsub32	%f10,	%f26,	%f16
	fmovsg	%icc,	%f3,	%f15
	edge8l	%i6,	%g4,	%l5
	fmovsleu	%xcc,	%f19,	%f26
	ld	[%l7 + 0x50],	%f24
	sdivx	%l4,	0x1BA6,	%o1
	fmovrslez	%i1,	%f16,	%f14
	orncc	%i0,	%l6,	%g5
	fpsub32	%f16,	%f30,	%f20
	lduw	[%l7 + 0x7C],	%g7
	sth	%o0,	[%l7 + 0x7E]
	stx	%l1,	[%l7 + 0x10]
	edge16	%g3,	%g6,	%o4
	andcc	%g1,	0x1D7D,	%o3
	lduw	[%l7 + 0x74],	%i5
	movrne	%i7,	0x3CA,	%i2
	movge	%xcc,	%l0,	%l3
	movrlz	%i4,	0x017,	%o2
	srax	%o7,	%o6,	%o5
	fmul8x16au	%f8,	%f29,	%f6
	mova	%xcc,	%i3,	%l2
	fornot2	%f2,	%f2,	%f4
	movrgez	%i6,	0x149,	%g2
	edge16n	%l5,	%l4,	%g4
	ldsw	[%l7 + 0x78],	%i1
	xnor	%i0,	0x0C4F,	%l6
	subcc	%g5,	0x1515,	%g7
	subc	%o1,	%l1,	%g3
	movle	%icc,	%g6,	%o4
	movvc	%icc,	%g1,	%o3
	st	%f13,	[%l7 + 0x48]
	fmovdn	%xcc,	%f12,	%f13
	sll	%i5,	%o0,	%i7
	movl	%icc,	%i2,	%l0
	sllx	%l3,	0x18,	%i4
	orn	%o7,	%o2,	%o6
	or	%o5,	%l2,	%i3
	edge32	%i6,	%l5,	%g2
	movcs	%icc,	%g4,	%l4
	ldsw	[%l7 + 0x64],	%i0
	umulcc	%l6,	0x00CA,	%i1
	movl	%xcc,	%g7,	%g5
	nop
	set	0x3C, %o5
	sth	%o1,	[%l7 + %o5]
	bshuffle	%f14,	%f30,	%f2
	movg	%icc,	%g3,	%l1
	srax	%g6,	%g1,	%o4
	sll	%o3,	%o0,	%i7
	edge16l	%i2,	%i5,	%l0
	alignaddr	%l3,	%i4,	%o2
	ldd	[%l7 + 0x10],	%f28
	sdivx	%o7,	0x1B55,	%o6
	movrlz	%l2,	%o5,	%i6
	fmovdneg	%icc,	%f29,	%f12
	udivcc	%l5,	0x060F,	%g2
	sdiv	%g4,	0x1E50,	%l4
	fmovdl	%xcc,	%f21,	%f10
	fmovdvc	%xcc,	%f22,	%f2
	stw	%i3,	[%l7 + 0x0C]
	edge8	%l6,	%i0,	%g7
	subc	%i1,	0x1DF8,	%o1
	xnorcc	%g5,	0x1F27,	%l1
	array8	%g6,	%g1,	%o4
	stb	%g3,	[%l7 + 0x45]
	edge16n	%o0,	%o3,	%i7
	addcc	%i5,	0x1EA9,	%l0
	alignaddr	%l3,	%i2,	%i4
	fmul8x16	%f21,	%f16,	%f26
	movl	%icc,	%o2,	%o6
	udivx	%l2,	0x055B,	%o7
	umulcc	%i6,	%o5,	%g2
	sdivx	%l5,	0x01CE,	%l4
	addc	%g4,	0x1FF7,	%l6
	orn	%i3,	%g7,	%i0
	movrlez	%o1,	0x2CE,	%g5
	movcc	%xcc,	%i1,	%g6
	stx	%g1,	[%l7 + 0x30]
	movrlez	%o4,	%l1,	%o0
	fmovdcc	%xcc,	%f5,	%f26
	fsrc2	%f4,	%f26
	sir	0x113A
	movvc	%xcc,	%o3,	%i7
	movneg	%xcc,	%g3,	%l0
	edge16l	%i5,	%l3,	%i4
	movn	%icc,	%o2,	%i2
	movvc	%xcc,	%o6,	%l2
	fpsub16s	%f25,	%f26,	%f29
	fxor	%f10,	%f16,	%f0
	xor	%i6,	%o7,	%o5
	popc	0x0539,	%l5
	movleu	%xcc,	%l4,	%g2
	andncc	%l6,	%i3,	%g4
	edge8n	%g7,	%o1,	%i0
	orcc	%g5,	%g6,	%g1
	fnot1	%f26,	%f26
	fornot2	%f18,	%f30,	%f16
	subccc	%i1,	%l1,	%o4
	mulscc	%o3,	0x1AB5,	%i7
	subc	%g3,	%o0,	%l0
	smulcc	%i5,	%l3,	%i4
	add	%i2,	%o2,	%l2
	sub	%i6,	0x0F00,	%o6
	fands	%f21,	%f28,	%f24
	add	%o7,	%o5,	%l4
	orcc	%l5,	%g2,	%i3
	fone	%f14
	fpsub16s	%f20,	%f1,	%f0
	udivcc	%g4,	0x10E1,	%l6
	and	%g7,	%o1,	%g5
	smul	%i0,	%g1,	%i1
	addcc	%g6,	%o4,	%o3
	movgu	%xcc,	%l1,	%g3
	fmovsne	%xcc,	%f20,	%f22
	fmovscc	%xcc,	%f15,	%f10
	ldsh	[%l7 + 0x50],	%o0
	addc	%l0,	0x15C4,	%i5
	fzeros	%f9
	popc	0x156F,	%l3
	srlx	%i7,	0x05,	%i4
	sub	%i2,	%o2,	%i6
	fcmps	%fcc2,	%f8,	%f16
	sllx	%l2,	0x12,	%o7
	edge16n	%o5,	%o6,	%l4
	movle	%icc,	%l5,	%g2
	movcs	%icc,	%g4,	%i3
	movre	%l6,	0x0D8,	%o1
	ldub	[%l7 + 0x74],	%g5
	ldd	[%l7 + 0x08],	%f20
	array8	%g7,	%i0,	%g1
	andncc	%i1,	%g6,	%o4
	sethi	0x1C64,	%o3
	umul	%g3,	0x0B87,	%o0
	st	%f13,	[%l7 + 0x70]
	fsrc1	%f26,	%f2
	edge32	%l0,	%i5,	%l3
	movle	%icc,	%l1,	%i7
	movrlz	%i2,	%i4,	%o2
	mulscc	%i6,	0x1455,	%o7
	alignaddrl	%l2,	%o5,	%l4
	fexpand	%f21,	%f20
	movrgez	%o6,	%l5,	%g2
	sethi	0x18F1,	%g4
	edge8l	%i3,	%o1,	%l6
	fpadd32s	%f10,	%f8,	%f8
	mulscc	%g7,	0x1889,	%i0
	std	%f0,	[%l7 + 0x78]
	fnegd	%f0,	%f14
	udivx	%g5,	0x1DB5,	%g1
	fmovsvc	%icc,	%f10,	%f10
	stb	%i1,	[%l7 + 0x61]
	ldd	[%l7 + 0x68],	%f22
	edge8l	%o4,	%g6,	%g3
	edge16	%o0,	%l0,	%i5
	fmul8x16al	%f12,	%f22,	%f30
	sub	%l3,	%l1,	%i7
	fmul8ulx16	%f20,	%f14,	%f10
	fandnot2	%f28,	%f8,	%f2
	add	%o3,	0x0A9A,	%i2
	stb	%i4,	[%l7 + 0x7B]
	umul	%i6,	%o2,	%o7
	fpsub16s	%f1,	%f24,	%f11
	fcmped	%fcc0,	%f4,	%f16
	fmovdleu	%icc,	%f31,	%f6
	edge16l	%l2,	%o5,	%l4
	fsrc2	%f26,	%f8
	add	%o6,	%g2,	%g4
	fcmpgt32	%f18,	%f0,	%l5
	udivx	%o1,	0x1323,	%i3
	movn	%xcc,	%g7,	%l6
	array32	%i0,	%g5,	%g1
	movrlez	%o4,	0x160,	%i1
	mova	%icc,	%g3,	%g6
	orn	%o0,	%l0,	%i5
	edge16l	%l3,	%l1,	%o3
	movcs	%icc,	%i7,	%i2
	movne	%xcc,	%i4,	%o2
	edge8n	%i6,	%l2,	%o5
	alignaddr	%o7,	%l4,	%g2
	addc	%g4,	0x08D3,	%o6
	srlx	%o1,	%i3,	%g7
	xorcc	%l6,	%i0,	%l5
	sir	0x1F52
	xnorcc	%g1,	0x18D2,	%o4
	restore %i1, 0x1E81, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g6,	%o0
	edge32l	%g3,	%i5,	%l0
	fmovdne	%icc,	%f20,	%f2
	fnot2s	%f31,	%f5
	addc	%l3,	%l1,	%i7
	fors	%f16,	%f19,	%f13
	fsrc2	%f22,	%f2
	or	%i2,	0x0E1A,	%i4
	xorcc	%o2,	0x09FD,	%i6
	movg	%xcc,	%l2,	%o5
	fmovsge	%xcc,	%f28,	%f16
	fnot2s	%f8,	%f29
	fmovdg	%xcc,	%f26,	%f6
	ldx	[%l7 + 0x10],	%o3
	andn	%o7,	0x0F90,	%g2
	add	%g4,	0x1E0D,	%l4
	movvs	%xcc,	%o6,	%i3
	lduh	[%l7 + 0x18],	%o1
	edge16ln	%l6,	%i0,	%g7
	sethi	0x01AB,	%l5
	fsrc1s	%f7,	%f20
	array8	%g1,	%i1,	%o4
	movpos	%icc,	%g5,	%o0
	addcc	%g3,	0x0CC1,	%i5
	orncc	%g6,	0x0AC8,	%l0
	movrgez	%l1,	%i7,	%l3
	fcmpd	%fcc3,	%f6,	%f0
	orncc	%i2,	0x06F2,	%o2
	sir	0x199A
	fmovrdne	%i4,	%f26,	%f16
	subccc	%i6,	0x1BBD,	%l2
	ldub	[%l7 + 0x76],	%o5
	add	%o7,	0x0070,	%o3
	movrne	%g4,	0x30E,	%g2
	fsrc2s	%f5,	%f24
	fcmple32	%f24,	%f0,	%l4
	xorcc	%i3,	0x14D1,	%o6
	fcmple16	%f20,	%f4,	%o1
	srax	%i0,	0x1E,	%g7
	xnorcc	%l6,	%g1,	%i1
	fmuld8ulx16	%f4,	%f10,	%f28
	fmovrsne	%l5,	%f31,	%f25
	orcc	%o4,	0x0049,	%o0
	movl	%xcc,	%g5,	%g3
	fmovse	%icc,	%f21,	%f20
	subccc	%g6,	%i5,	%l0
	fsrc1s	%f31,	%f20
	orncc	%l1,	0x18C4,	%i7
	ldd	[%l7 + 0x38],	%f28
	srlx	%l3,	%i2,	%o2
	addc	%i4,	%l2,	%o5
	sth	%i6,	[%l7 + 0x52]
	srax	%o7,	%o3,	%g2
	stx	%l4,	[%l7 + 0x68]
	movne	%xcc,	%g4,	%i3
	array8	%o6,	%i0,	%g7
	array16	%l6,	%o1,	%i1
	fxors	%f21,	%f12,	%f0
	stb	%l5,	[%l7 + 0x5A]
	edge32	%o4,	%o0,	%g5
	ldsw	[%l7 + 0x40],	%g3
	movpos	%icc,	%g1,	%g6
	sra	%l0,	%l1,	%i5
	srl	%i7,	%l3,	%i2
	array16	%i4,	%l2,	%o5
	edge16n	%o2,	%i6,	%o3
	array32	%g2,	%l4,	%o7
	fornot1s	%f7,	%f8,	%f2
	fnors	%f10,	%f15,	%f4
	fabss	%f6,	%f19
	udiv	%i3,	0x1CC2,	%g4
	lduw	[%l7 + 0x1C],	%i0
	edge16l	%o6,	%g7,	%o1
	fmovse	%xcc,	%f5,	%f22
	or	%i1,	%l5,	%l6
	move	%xcc,	%o0,	%o4
	movrgz	%g3,	%g1,	%g6
	smul	%g5,	0x17F4,	%l1
	fmovrslez	%i5,	%f6,	%f29
	and	%l0,	0x1229,	%i7
	smul	%l3,	%i4,	%i2
	fpadd32	%f24,	%f4,	%f24
	srlx	%o5,	0x16,	%l2
	array32	%i6,	%o3,	%g2
	edge8n	%o2,	%l4,	%o7
	umul	%g4,	%i0,	%o6
	umul	%i3,	%o1,	%i1
	addcc	%l5,	%g7,	%l6
	edge8	%o4,	%g3,	%g1
	subc	%g6,	0x151B,	%o0
	ld	[%l7 + 0x10],	%f10
	fmovsa	%xcc,	%f11,	%f16
	fcmpeq16	%f2,	%f26,	%l1
	ld	[%l7 + 0x24],	%f6
	edge32l	%i5,	%l0,	%i7
	stx	%l3,	[%l7 + 0x28]
	fmovrdgz	%g5,	%f10,	%f26
	fnot2s	%f28,	%f21
	andncc	%i4,	%o5,	%i2
	fzeros	%f24
	srlx	%l2,	%o3,	%g2
	movrlz	%i6,	%l4,	%o7
	movge	%icc,	%g4,	%o2
	movne	%xcc,	%i0,	%o6
	fnot2	%f10,	%f10
	addcc	%o1,	0x06E1,	%i3
	ldsw	[%l7 + 0x50],	%l5
	fpadd32s	%f26,	%f26,	%f26
	xorcc	%g7,	%l6,	%i1
	move	%icc,	%g3,	%g1
	orncc	%g6,	0x08C0,	%o0
	ldub	[%l7 + 0x48],	%o4
	movgu	%icc,	%i5,	%l1
	lduh	[%l7 + 0x0A],	%l0
	mova	%xcc,	%i7,	%l3
	ld	[%l7 + 0x28],	%f31
	edge32l	%i4,	%o5,	%i2
	sra	%l2,	0x16,	%g5
	movre	%o3,	0x181,	%i6
	lduw	[%l7 + 0x38],	%g2
	udivcc	%o7,	0x1B2E,	%l4
	fmovrdgez	%g4,	%f28,	%f20
	sub	%o2,	%o6,	%o1
	movrgz	%i0,	0x214,	%l5
	movge	%icc,	%g7,	%l6
	smulcc	%i3,	%i1,	%g3
	fnot2s	%f20,	%f23
	ldsh	[%l7 + 0x14],	%g1
	array16	%o0,	%g6,	%i5
	array32	%l1,	%o4,	%l0
	sir	0x062E
	fnot2	%f8,	%f14
	addcc	%i7,	0x13A3,	%l3
	lduw	[%l7 + 0x54],	%o5
	lduh	[%l7 + 0x42],	%i4
	fxor	%f24,	%f26,	%f30
	fnot1	%f12,	%f18
	fmovsvs	%xcc,	%f6,	%f31
	fmovdvc	%icc,	%f14,	%f31
	fmovrdlez	%i2,	%f24,	%f0
	fpack32	%f30,	%f18,	%f12
	movne	%xcc,	%g5,	%l2
	ldsb	[%l7 + 0x1C],	%i6
	alignaddrl	%g2,	%o7,	%o3
	save %g4, %l4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	fmovscc	%icc,	%f11,	%f7
	fmovrsgez	%o1,	%f26,	%f24
	move	%icc,	%l5,	%l6
	move	%xcc,	%g7,	%i3
	fmovsg	%xcc,	%f1,	%f3
	ldsh	[%l7 + 0x6C],	%i1
	andncc	%g1,	%o0,	%g6
	movcc	%xcc,	%g3,	%l1
	sra	%i5,	0x15,	%l0
	fmovdvc	%xcc,	%f15,	%f11
	movrgez	%o4,	%i7,	%o5
	subccc	%l3,	0x0D78,	%i2
	fnot1s	%f26,	%f4
	sth	%i4,	[%l7 + 0x64]
	fmovsne	%xcc,	%f22,	%f19
	edge8ln	%l2,	%g5,	%i6
	fcmple16	%f16,	%f22,	%g2
	movg	%xcc,	%o7,	%o3
	movrlez	%l4,	0x1D9,	%o2
	movrlez	%g4,	%i0,	%o1
	movn	%xcc,	%o6,	%l6
	edge8n	%l5,	%i3,	%g7
	movcs	%icc,	%i1,	%o0
	ldd	[%l7 + 0x70],	%g6
	and	%g1,	0x043F,	%g3
	mulscc	%i5,	0x13B4,	%l0
	alignaddr	%o4,	%l1,	%o5
	save %l3, %i2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%icc,	%f18,	%f12
	move	%xcc,	%l2,	%g5
	fxnor	%f28,	%f8,	%f18
	edge16ln	%i7,	%i6,	%o7
	movrgz	%g2,	0x1F5,	%o3
	pdist	%f4,	%f12,	%f22
	srl	%l4,	0x14,	%o2
	ldub	[%l7 + 0x0D],	%g4
	edge32l	%o1,	%o6,	%i0
	add	%l6,	0x0EFF,	%l5
	array16	%i3,	%i1,	%o0
	fmovdleu	%icc,	%f20,	%f17
	fmovdcc	%xcc,	%f25,	%f6
	movleu	%icc,	%g6,	%g1
	fsrc1s	%f20,	%f28
	mulx	%g3,	0x1DE3,	%i5
	movrne	%l0,	0x156,	%g7
	xnorcc	%l1,	0x0CAC,	%o5
	sdivx	%o4,	0x0988,	%l3
	stw	%i4,	[%l7 + 0x08]
	fornot1	%f4,	%f12,	%f26
	subcc	%i2,	0x0945,	%l2
	alignaddr	%g5,	%i6,	%o7
	nop
	set	0x3C, %l3
	sth	%g2,	[%l7 + %l3]
	fnot2s	%f21,	%f6
	edge16ln	%i7,	%o3,	%o2
	fpackfix	%f30,	%f2
	movge	%icc,	%g4,	%l4
	movrlez	%o6,	0x231,	%i0
	ld	[%l7 + 0x38],	%f4
	edge8ln	%o1,	%l5,	%l6
	edge32ln	%i3,	%o0,	%g6
	movvs	%icc,	%g1,	%g3
	andcc	%i5,	%i1,	%l0
	sdiv	%g7,	0x012E,	%l1
	fnot1s	%f3,	%f10
	fornot2s	%f13,	%f18,	%f27
	edge16n	%o5,	%l3,	%i4
	fand	%f28,	%f6,	%f2
	edge32l	%o4,	%i2,	%g5
	ldsw	[%l7 + 0x54],	%i6
	array16	%l2,	%g2,	%i7
	fmovrsne	%o7,	%f0,	%f18
	mulx	%o3,	0x1FE8,	%o2
	srl	%g4,	0x1E,	%l4
	popc	0x0C2F,	%i0
	fnot1s	%f18,	%f16
	movvs	%icc,	%o1,	%o6
	and	%l5,	%i3,	%o0
	fmovrse	%l6,	%f17,	%f4
	fcmpeq32	%f12,	%f12,	%g6
	ldub	[%l7 + 0x76],	%g1
	fmovdcs	%xcc,	%f20,	%f11
	udivcc	%i5,	0x1FDA,	%g3
	ldd	[%l7 + 0x68],	%i0
	stw	%g7,	[%l7 + 0x60]
	edge8	%l1,	%l0,	%l3
	lduw	[%l7 + 0x34],	%i4
	movle	%icc,	%o4,	%o5
	fornot2	%f0,	%f18,	%f8
	fxnor	%f26,	%f0,	%f30
	edge16ln	%i2,	%g5,	%l2
	edge16l	%g2,	%i6,	%o7
	array8	%o3,	%o2,	%i7
	ldsw	[%l7 + 0x70],	%g4
	save %i0, 0x00ED, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o6,	%l5,	%i3
	umul	%o0,	%l6,	%l4
	sdivx	%g6,	0x07F0,	%i5
	std	%f8,	[%l7 + 0x08]
	fsrc2	%f22,	%f14
	mulx	%g1,	0x0AD5,	%i1
	fzeros	%f8
	ldsw	[%l7 + 0x7C],	%g7
	fmul8x16al	%f27,	%f18,	%f14
	movrne	%g3,	0x0C2,	%l0
	sdivx	%l3,	0x1DE8,	%i4
	st	%f24,	[%l7 + 0x3C]
	xor	%l1,	0x0218,	%o4
	mulscc	%o5,	%i2,	%g5
	or	%l2,	0x1B25,	%g2
	fmovrsgez	%i6,	%f22,	%f15
	movre	%o7,	%o3,	%i7
	fnot2s	%f23,	%f21
	movleu	%icc,	%g4,	%o2
	array32	%i0,	%o1,	%o6
	movrlz	%i3,	%l5,	%l6
	fmovsle	%icc,	%f12,	%f28
	fmovrdgz	%o0,	%f24,	%f2
	fmovsa	%xcc,	%f1,	%f2
	addccc	%l4,	%i5,	%g6
	fxors	%f2,	%f10,	%f8
	fmovs	%f11,	%f23
	or	%i1,	%g1,	%g7
	fandnot2	%f28,	%f22,	%f6
	fmovdgu	%icc,	%f13,	%f16
	fmovdpos	%xcc,	%f23,	%f19
	sethi	0x08BA,	%g3
	movg	%xcc,	%l0,	%i4
	stb	%l3,	[%l7 + 0x76]
	edge16n	%l1,	%o4,	%i2
	fmovspos	%xcc,	%f7,	%f6
	xor	%g5,	%o5,	%g2
	udiv	%l2,	0x1E4D,	%o7
	movre	%o3,	0x372,	%i6
	fmovsgu	%icc,	%f14,	%f27
	orn	%i7,	0x1115,	%g4
	sdivcc	%o2,	0x0755,	%o1
	udivcc	%i0,	0x1AEE,	%o6
	srlx	%l5,	0x15,	%i3
	alignaddrl	%l6,	%l4,	%i5
	movrlz	%o0,	0x165,	%i1
	fornot1s	%f29,	%f20,	%f14
	movrlz	%g1,	%g6,	%g3
	xorcc	%l0,	0x0104,	%i4
	xorcc	%l3,	0x093E,	%g7
	movpos	%icc,	%o4,	%l1
	ld	[%l7 + 0x34],	%f17
	stb	%i2,	[%l7 + 0x38]
	movneg	%icc,	%g5,	%o5
	sub	%l2,	0x1147,	%o7
	fpack16	%f18,	%f23
	fmovsg	%icc,	%f25,	%f31
	addc	%o3,	0x0AF0,	%i6
	movge	%xcc,	%g2,	%g4
	nop
	set	0x3A, %l0
	lduh	[%l7 + %l0],	%o2
	addccc	%i7,	0x0EBD,	%o1
	movre	%i0,	%l5,	%o6
	ldd	[%l7 + 0x58],	%i2
	fmovsge	%xcc,	%f16,	%f15
	movleu	%xcc,	%l6,	%l4
	mulx	%i5,	0x1016,	%i1
	edge8ln	%g1,	%g6,	%g3
	ldsh	[%l7 + 0x4A],	%l0
	fpmerge	%f26,	%f25,	%f22
	ldx	[%l7 + 0x50],	%i4
	subc	%l3,	0x1814,	%o0
	array32	%o4,	%g7,	%l1
	edge32ln	%i2,	%o5,	%g5
	orcc	%l2,	0x1C3C,	%o3
	edge16	%i6,	%o7,	%g2
	movre	%g4,	%i7,	%o1
	lduw	[%l7 + 0x68],	%o2
	sub	%i0,	0x00B4,	%o6
	fmovscs	%icc,	%f4,	%f7
	sethi	0x0C70,	%i3
	stw	%l6,	[%l7 + 0x34]
	array8	%l4,	%i5,	%l5
	edge32n	%g1,	%i1,	%g3
	movcs	%icc,	%l0,	%g6
	fcmple16	%f24,	%f26,	%i4
	array32	%o0,	%l3,	%g7
	popc	0x1AC7,	%o4
	st	%f13,	[%l7 + 0x28]
	movgu	%icc,	%i2,	%l1
	fzero	%f24
	movvc	%xcc,	%o5,	%l2
	lduh	[%l7 + 0x30],	%o3
	stb	%g5,	[%l7 + 0x32]
	orcc	%i6,	%g2,	%g4
	umulcc	%i7,	%o7,	%o2
	movge	%icc,	%o1,	%i0
	ldsh	[%l7 + 0x7A],	%o6
	sll	%l6,	%l4,	%i3
	srlx	%i5,	0x05,	%g1
	andn	%l5,	%g3,	%i1
	fmul8ulx16	%f18,	%f16,	%f10
	fpsub16	%f10,	%f0,	%f24
	ldd	[%l7 + 0x58],	%g6
	array8	%i4,	%l0,	%l3
	andncc	%o0,	%g7,	%i2
	lduh	[%l7 + 0x76],	%l1
	lduh	[%l7 + 0x18],	%o4
	ldsb	[%l7 + 0x24],	%o5
	sethi	0x1D57,	%l2
	or	%o3,	0x0602,	%i6
	fmul8x16al	%f10,	%f1,	%f18
	subccc	%g2,	%g5,	%i7
	lduh	[%l7 + 0x3E],	%o7
	fsrc1	%f22,	%f4
	edge32l	%g4,	%o2,	%i0
	fcmpeq16	%f30,	%f30,	%o6
	fpadd32	%f20,	%f16,	%f24
	addc	%o1,	0x15D9,	%l6
	orncc	%i3,	0x0DBF,	%l4
	mulx	%g1,	%i5,	%g3
	sra	%l5,	0x14,	%g6
	edge8ln	%i4,	%l0,	%i1
	movvc	%xcc,	%o0,	%l3
	movneg	%icc,	%g7,	%i2
	fmovspos	%icc,	%f14,	%f6
	andcc	%o4,	%o5,	%l2
	edge32	%l1,	%o3,	%i6
	sir	0x0307
	fandnot2	%f10,	%f6,	%f20
	and	%g5,	0x0656,	%i7
	std	%f24,	[%l7 + 0x58]
	fzeros	%f30
	movn	%icc,	%g2,	%g4
	movg	%xcc,	%o2,	%i0
	fandnot1s	%f28,	%f2,	%f16
	orncc	%o7,	%o1,	%o6
	edge8l	%l6,	%l4,	%g1
	fpsub16	%f20,	%f22,	%f2
	alignaddr	%i5,	%i3,	%g3
	lduw	[%l7 + 0x74],	%l5
	andcc	%g6,	%i4,	%i1
	udivx	%o0,	0x0A02,	%l3
	movgu	%icc,	%g7,	%l0
	pdist	%f6,	%f6,	%f16
	movge	%icc,	%i2,	%o4
	mova	%xcc,	%o5,	%l1
	stb	%o3,	[%l7 + 0x58]
	fmovrdgz	%i6,	%f8,	%f4
	orncc	%l2,	%i7,	%g5
	pdist	%f10,	%f22,	%f4
	fmovsg	%icc,	%f31,	%f14
	add	%g2,	%o2,	%g4
	fnot2	%f30,	%f28
	edge16	%i0,	%o7,	%o1
	movre	%o6,	%l4,	%g1
	movpos	%xcc,	%l6,	%i5
	popc	0x03B6,	%i3
	fcmpne16	%f16,	%f28,	%l5
	udivx	%g6,	0x0C1C,	%g3
	fmovdn	%xcc,	%f18,	%f29
	fmovrdlz	%i1,	%f0,	%f2
	mulx	%i4,	%l3,	%g7
	movrlz	%o0,	%i2,	%o4
	movrlez	%o5,	%l0,	%l1
	sdivx	%o3,	0x0309,	%i6
	fnot1	%f30,	%f4
	fpackfix	%f0,	%f22
	xor	%i7,	0x06FF,	%g5
	smulcc	%l2,	%g2,	%o2
	ldsw	[%l7 + 0x34],	%g4
	fmovsvc	%xcc,	%f2,	%f26
	srax	%o7,	0x0D,	%i0
	and	%o6,	%l4,	%g1
	ldx	[%l7 + 0x48],	%o1
	ldx	[%l7 + 0x68],	%i5
	mulx	%l6,	0x0060,	%l5
	movneg	%icc,	%g6,	%i3
	add	%g3,	0x13BF,	%i1
	addccc	%l3,	%g7,	%i4
	fpack16	%f12,	%f12
	st	%f7,	[%l7 + 0x5C]
	edge8ln	%o0,	%o4,	%o5
	lduw	[%l7 + 0x78],	%l0
	edge16l	%i2,	%l1,	%i6
	smul	%i7,	0x019A,	%o3
	movl	%icc,	%g5,	%g2
	fandnot1	%f16,	%f12,	%f14
	mova	%icc,	%o2,	%l2
	subccc	%g4,	0x08A6,	%o7
	xor	%i0,	0x1D41,	%o6
	movn	%icc,	%g1,	%o1
	orcc	%i5,	%l6,	%l4
	add	%g6,	%i3,	%l5
	ldub	[%l7 + 0x0A],	%i1
	fmovrdlz	%g3,	%f14,	%f8
	sth	%l3,	[%l7 + 0x5A]
	srax	%g7,	%i4,	%o4
	edge32	%o5,	%o0,	%i2
	array32	%l0,	%i6,	%l1
	fmovda	%icc,	%f28,	%f23
	movneg	%icc,	%o3,	%g5
	move	%xcc,	%i7,	%g2
	andcc	%l2,	%g4,	%o2
	movn	%xcc,	%i0,	%o7
	edge16	%o6,	%g1,	%o1
	std	%f16,	[%l7 + 0x58]
	stw	%i5,	[%l7 + 0x54]
	stw	%l6,	[%l7 + 0x74]
	std	%f30,	[%l7 + 0x18]
	move	%xcc,	%g6,	%i3
	srax	%l4,	%i1,	%l5
	ldd	[%l7 + 0x10],	%l2
	fcmpgt16	%f12,	%f22,	%g7
	lduh	[%l7 + 0x62],	%g3
	movleu	%icc,	%o4,	%i4
	ldd	[%l7 + 0x58],	%f8
	movrgez	%o5,	0x246,	%o0
	movrlz	%l0,	%i6,	%l1
	fnot1s	%f22,	%f26
	mova	%xcc,	%o3,	%i2
	movre	%i7,	0x2DC,	%g5
	sra	%g2,	%l2,	%g4
	fmovrdlz	%i0,	%f30,	%f30
	edge32l	%o2,	%o6,	%o7
	alignaddr	%g1,	%o1,	%i5
	movrlez	%l6,	0x11A,	%g6
	edge8ln	%i3,	%i1,	%l5
	mulscc	%l4,	0x085B,	%g7
	movrgz	%g3,	0x15F,	%l3
	fmovdgu	%xcc,	%f24,	%f29
	ldx	[%l7 + 0x60],	%o4
	fmovse	%icc,	%f6,	%f3
	stx	%o5,	[%l7 + 0x48]
	edge16n	%o0,	%i4,	%i6
	edge32	%l1,	%l0,	%i2
	smul	%i7,	0x0655,	%o3
	std	%f16,	[%l7 + 0x28]
	subccc	%g5,	0x0C7E,	%l2
	xorcc	%g2,	0x036A,	%i0
	fxnor	%f16,	%f4,	%f30
	fmovsle	%xcc,	%f26,	%f12
	andcc	%g4,	0x0CBE,	%o2
	fnegs	%f3,	%f15
	fmovs	%f19,	%f15
	fabsd	%f20,	%f6
	fmovsne	%icc,	%f23,	%f22
	ldd	[%l7 + 0x70],	%o6
	udivx	%o6,	0x1D16,	%o1
	ldd	[%l7 + 0x60],	%f20
	movle	%xcc,	%i5,	%g1
	edge8ln	%l6,	%g6,	%i1
	movg	%icc,	%l5,	%l4
	xorcc	%i3,	0x0F59,	%g7
	edge32n	%l3,	%g3,	%o5
	movle	%icc,	%o4,	%o0
	sdivcc	%i4,	0x1800,	%l1
	subcc	%i6,	0x01E4,	%l0
	movvc	%icc,	%i7,	%o3
	fmovsvs	%xcc,	%f7,	%f28
	orncc	%g5,	%i2,	%l2
	mulscc	%i0,	0x1DF8,	%g2
	fmovdleu	%icc,	%f13,	%f25
	fmovrsgez	%g4,	%f13,	%f14
	ldd	[%l7 + 0x78],	%o2
	sir	0x0014
	udivx	%o7,	0x0ABB,	%o1
	movle	%icc,	%o6,	%g1
	sdivx	%l6,	0x16DD,	%g6
	fmovdg	%xcc,	%f16,	%f27
	fmovdle	%xcc,	%f10,	%f2
	ldd	[%l7 + 0x58],	%f14
	fmovdpos	%xcc,	%f24,	%f26
	movn	%xcc,	%i1,	%i5
	stx	%l4,	[%l7 + 0x78]
	add	%i3,	%l5,	%g7
	andn	%l3,	0x0FA1,	%o5
	xor	%g3,	%o0,	%o4
	lduw	[%l7 + 0x18],	%i4
	edge32	%l1,	%l0,	%i6
	fnand	%f28,	%f20,	%f28
	sll	%i7,	0x0B,	%o3
	movcs	%xcc,	%i2,	%g5
	fpadd32s	%f31,	%f14,	%f26
	movcs	%icc,	%l2,	%i0
	srl	%g4,	%g2,	%o2
	movl	%icc,	%o7,	%o1
	fmovdg	%icc,	%f15,	%f12
	and	%g1,	%o6,	%g6
	edge16	%l6,	%i5,	%l4
	ldub	[%l7 + 0x6C],	%i1
	fornot2	%f18,	%f20,	%f20
	edge16	%i3,	%l5,	%g7
	ld	[%l7 + 0x58],	%f26
	movne	%icc,	%o5,	%g3
	movrlz	%l3,	0x008,	%o0
	movcs	%icc,	%o4,	%l1
	movvs	%xcc,	%i4,	%i6
	fmovspos	%xcc,	%f18,	%f21
	fmul8ulx16	%f6,	%f28,	%f6
	edge32	%l0,	%o3,	%i7
	nop
	set	0x24, %o4
	ldsh	[%l7 + %o4],	%g5
	fandnot1s	%f17,	%f2,	%f17
	fmovrslz	%i2,	%f27,	%f21
	movl	%xcc,	%i0,	%g4
	stw	%l2,	[%l7 + 0x20]
	fmuld8ulx16	%f23,	%f13,	%f22
	movleu	%icc,	%g2,	%o7
	add	%o2,	0x0CE0,	%o1
	subccc	%o6,	%g1,	%l6
	add	%i5,	%l4,	%i1
	edge16n	%g6,	%i3,	%l5
	addc	%g7,	0x0E81,	%g3
	mulx	%o5,	0x0857,	%o0
	srl	%o4,	%l3,	%i4
	ldsh	[%l7 + 0x24],	%l1
	alignaddr	%i6,	%o3,	%l0
	add	%g5,	%i7,	%i0
	alignaddr	%i2,	%g4,	%g2
	mulx	%o7,	%l2,	%o2
	fpadd32	%f6,	%f18,	%f26
	movrgez	%o1,	%g1,	%o6
	addcc	%l6,	%l4,	%i1
	array8	%i5,	%g6,	%i3
	fpack32	%f4,	%f12,	%f4
	movgu	%icc,	%l5,	%g7
	stx	%o5,	[%l7 + 0x70]
	udivcc	%o0,	0x0F14,	%o4
	movleu	%xcc,	%l3,	%i4
	alignaddrl	%g3,	%l1,	%i6
	ldsw	[%l7 + 0x38],	%l0
	movne	%xcc,	%o3,	%i7
	sub	%i0,	%i2,	%g4
	fmovrdgez	%g5,	%f0,	%f12
	movcc	%icc,	%g2,	%o7
	ldub	[%l7 + 0x09],	%l2
	fnand	%f26,	%f4,	%f14
	orncc	%o1,	0x06FE,	%g1
	fpsub16	%f8,	%f18,	%f10
	fmovdn	%icc,	%f20,	%f25
	ld	[%l7 + 0x24],	%f7
	movneg	%xcc,	%o6,	%l6
	edge8l	%o2,	%i1,	%i5
	sllx	%g6,	0x10,	%l4
	std	%f16,	[%l7 + 0x38]
	movre	%l5,	%i3,	%g7
	edge32	%o5,	%o4,	%l3
	stw	%i4,	[%l7 + 0x24]
	addcc	%o0,	%g3,	%l1
	fpadd16s	%f4,	%f7,	%f15
	sllx	%l0,	%i6,	%o3
	fmovdne	%icc,	%f12,	%f29
	fmovsne	%icc,	%f8,	%f22
	sdivcc	%i7,	0x07DA,	%i2
	srax	%g4,	0x0F,	%i0
	movrgz	%g2,	%o7,	%g5
	fmovde	%xcc,	%f3,	%f10
	movneg	%icc,	%o1,	%l2
	std	%f6,	[%l7 + 0x48]
	movrne	%g1,	%l6,	%o2
	ld	[%l7 + 0x30],	%f10
	edge8n	%i1,	%i5,	%g6
	for	%f22,	%f26,	%f26
	add	%o6,	0x1DE6,	%l4
	fmovrsne	%l5,	%f29,	%f17
	nop
	set	0x68, %l1
	lduw	[%l7 + %l1],	%i3
	sub	%o5,	0x08D4,	%g7
	subcc	%o4,	%l3,	%o0
	movle	%xcc,	%i4,	%l1
	fmovsne	%xcc,	%f2,	%f16
	array16	%g3,	%i6,	%l0
	mulx	%i7,	0x0A1E,	%o3
	alignaddrl	%i2,	%g4,	%i0
	restore %g2, %g5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o1,	0x155B,	%l2
	addc	%l6,	%g1,	%o2
	subcc	%i1,	%i5,	%g6
	movrlz	%o6,	%l4,	%i3
	fcmpeq16	%f6,	%f20,	%o5
	sdiv	%l5,	0x1EB2,	%g7
	fand	%f6,	%f24,	%f24
	movre	%l3,	0x310,	%o4
	fmovrde	%i4,	%f12,	%f16
	ldx	[%l7 + 0x10],	%l1
	movle	%xcc,	%o0,	%g3
	ldub	[%l7 + 0x5D],	%l0
	orcc	%i7,	%o3,	%i6
	ldx	[%l7 + 0x60],	%g4
	fmovrdgz	%i2,	%f6,	%f4
	udivx	%g2,	0x1AC9,	%g5
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%i0
	sdiv	%o1,	0x0F17,	%l2
	movle	%xcc,	%l6,	%o7
	fmovdvs	%icc,	%f14,	%f19
	addccc	%o2,	0x0D21,	%g1
	ldx	[%l7 + 0x50],	%i1
	movn	%icc,	%g6,	%o6
	xorcc	%l4,	%i3,	%i5
	nop
	set	0x08, %i2
	lduh	[%l7 + %i2],	%l5
	smul	%o5,	%l3,	%g7
	movrne	%o4,	0x225,	%i4
	sra	%l1,	%o0,	%g3
	movrgez	%l0,	%i7,	%o3
	stb	%g4,	[%l7 + 0x14]
	edge8	%i2,	%g2,	%i6
	fzeros	%f15
	std	%f18,	[%l7 + 0x30]
	movle	%xcc,	%g5,	%o1
	fmul8ulx16	%f4,	%f2,	%f22
	subcc	%i0,	%l2,	%l6
	movrlez	%o2,	0x2EA,	%o7
	ldd	[%l7 + 0x58],	%f30
	fmovsa	%xcc,	%f29,	%f10
	orcc	%g1,	0x166A,	%g6
	movrne	%i1,	0x202,	%o6
	sdivcc	%l4,	0x1986,	%i5
	movge	%xcc,	%l5,	%i3
	subcc	%l3,	%o5,	%g7
	movvc	%xcc,	%i4,	%o4
	fnot2s	%f25,	%f17
	sdiv	%l1,	0x138A,	%o0
	ldx	[%l7 + 0x70],	%g3
	st	%f11,	[%l7 + 0x38]
	andn	%i7,	%o3,	%l0
	subccc	%i2,	%g2,	%g4
	movcs	%xcc,	%i6,	%g5
	srlx	%i0,	0x02,	%o1
	fmovrsgz	%l6,	%f27,	%f20
	fones	%f31
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%o2
	mulscc	%o7,	%l2,	%g6
	edge8ln	%g1,	%o6,	%l4
	srl	%i5,	0x08,	%l5
	movle	%icc,	%i3,	%l3
	xorcc	%o5,	0x0882,	%g7
	edge8ln	%i1,	%o4,	%i4
	ldd	[%l7 + 0x28],	%f18
	movcs	%xcc,	%l1,	%o0
	udivx	%g3,	0x0816,	%o3
	xor	%l0,	0x14E0,	%i2
	udivx	%g2,	0x0642,	%g4
	alignaddrl	%i6,	%g5,	%i7
	sra	%o1,	0x15,	%l6
	andncc	%o2,	%i0,	%o7
	fmovsg	%icc,	%f1,	%f19
	umulcc	%l2,	%g1,	%g6
	sth	%o6,	[%l7 + 0x1C]
	sethi	0x1BC6,	%i5
	add	%l4,	%l5,	%l3
	umulcc	%o5,	0x0314,	%g7
	andcc	%i1,	0x0023,	%i3
	movrlez	%o4,	0x394,	%l1
	srax	%i4,	0x09,	%g3
	stw	%o0,	[%l7 + 0x78]
	fmovscs	%icc,	%f27,	%f10
	mulx	%o3,	0x0F58,	%l0
	stb	%g2,	[%l7 + 0x19]
	fcmpd	%fcc2,	%f4,	%f10
	sll	%g4,	%i6,	%g5
	st	%f31,	[%l7 + 0x30]
	movvs	%icc,	%i2,	%i7
	alignaddrl	%l6,	%o1,	%i0
	sdivx	%o2,	0x076B,	%o7
	save %g1, %g6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o6,	%l4,	%i5
	ldsw	[%l7 + 0x5C],	%l3
	edge16ln	%o5,	%l5,	%g7
	orcc	%i1,	%o4,	%l1
	xorcc	%i3,	0x0107,	%i4
	movle	%xcc,	%o0,	%g3
	fornot2s	%f27,	%f27,	%f30
	save %l0, 0x0CB8, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f8,	%f24
	xorcc	%g4,	%o3,	%i6
	umul	%g5,	0x0648,	%i2
	edge32	%i7,	%o1,	%i0
	move	%icc,	%o2,	%o7
	move	%icc,	%l6,	%g6
	fandnot1	%f16,	%f0,	%f8
	ldx	[%l7 + 0x30],	%g1
	mulx	%l2,	%o6,	%l4
	addcc	%l3,	%o5,	%i5
	srl	%g7,	0x1F,	%i1
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	mova	%icc,	%i3,	%o0
	edge8l	%g3,	%l0,	%i4
	and	%g2,	%o3,	%i6
	subc	%g5,	%g4,	%i7
	move	%xcc,	%i2,	%i0
	mova	%xcc,	%o1,	%o2
	std	%f16,	[%l7 + 0x78]
	orncc	%l6,	%o7,	%g1
	st	%f19,	[%l7 + 0x50]
	udiv	%g6,	0x129E,	%o6
	edge32l	%l2,	%l4,	%l3
	save %i5, 0x16E2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%g7,	%i1
	smulcc	%o4,	%l5,	%i3
	fmovsgu	%xcc,	%f4,	%f17
	smul	%o0,	0x0F23,	%g3
	array8	%l0,	%i4,	%l1
	subccc	%o3,	%i6,	%g2
	array32	%g5,	%i7,	%i2
	sdivx	%g4,	0x05E3,	%i0
	srax	%o1,	0x08,	%l6
	fmovsne	%icc,	%f9,	%f8
	movpos	%xcc,	%o7,	%o2
	ldx	[%l7 + 0x70],	%g1
	udivx	%o6,	0x1F94,	%l2
	movne	%xcc,	%g6,	%l4
	fors	%f19,	%f10,	%f0
	fcmpd	%fcc2,	%f10,	%f18
	array8	%i5,	%l3,	%o5
	for	%f30,	%f24,	%f10
	fcmpgt16	%f12,	%f2,	%g7
	ldsh	[%l7 + 0x2E],	%o4
	fmovrsgz	%i1,	%f31,	%f1
	ldx	[%l7 + 0x20],	%l5
	move	%xcc,	%o0,	%g3
	stx	%i3,	[%l7 + 0x28]
	fornot2s	%f20,	%f8,	%f28
	movre	%i4,	%l1,	%l0
	fandnot2	%f6,	%f12,	%f30
	stb	%o3,	[%l7 + 0x7F]
	lduw	[%l7 + 0x50],	%i6
	movrgz	%g2,	0x3BE,	%g5
	edge16n	%i7,	%g4,	%i2
	movge	%xcc,	%o1,	%l6
	movleu	%xcc,	%o7,	%i0
	subcc	%o2,	0x00D8,	%o6
	save %l2, 0x1991, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %g1, 0x1BC5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l3,	%i5,	%o5
	smulcc	%o4,	%i1,	%g7
	nop
	set	0x50, %o0
	std	%f12,	[%l7 + %o0]
	subccc	%o0,	%l5,	%i3
	fmovsvc	%xcc,	%f28,	%f3
	edge32ln	%i4,	%l1,	%g3
	andcc	%o3,	0x15B9,	%i6
	fabss	%f13,	%f13
	array16	%l0,	%g2,	%i7
	sll	%g4,	%i2,	%o1
	movne	%xcc,	%g5,	%l6
	st	%f14,	[%l7 + 0x50]
	orcc	%o7,	0x0196,	%i0
	subcc	%o2,	%l2,	%g6
	xnorcc	%o6,	0x10BE,	%g1
	orn	%l4,	%l3,	%i5
	sdiv	%o5,	0x1D6B,	%o4
	fpadd16s	%f15,	%f11,	%f24
	movgu	%xcc,	%i1,	%o0
	movne	%icc,	%l5,	%g7
	lduw	[%l7 + 0x68],	%i3
	movge	%icc,	%i4,	%g3
	movge	%xcc,	%l1,	%o3
	fcmped	%fcc0,	%f4,	%f24
	array32	%l0,	%i6,	%g2
	stw	%i7,	[%l7 + 0x08]
	fpadd32s	%f7,	%f25,	%f14
	move	%xcc,	%i2,	%o1
	srl	%g5,	%l6,	%g4
	fmovdle	%xcc,	%f28,	%f16
	array32	%i0,	%o7,	%o2
	udivcc	%g6,	0x0576,	%l2
	edge32l	%g1,	%o6,	%l3
	movgu	%xcc,	%i5,	%o5
	sllx	%l4,	%i1,	%o4
	sub	%o0,	%g7,	%i3
	edge32l	%l5,	%i4,	%l1
	sub	%g3,	0x1CEB,	%l0
	xor	%o3,	%g2,	%i6
	movl	%xcc,	%i7,	%i2
	movn	%xcc,	%o1,	%g5
	ld	[%l7 + 0x20],	%f26
	movge	%icc,	%g4,	%i0
	edge8l	%o7,	%l6,	%o2
	ldub	[%l7 + 0x38],	%l2
	edge16l	%g1,	%o6,	%l3
	move	%icc,	%g6,	%i5
	for	%f16,	%f22,	%f2
	movl	%icc,	%o5,	%i1
	movrlez	%l4,	%o0,	%o4
	umul	%i3,	%l5,	%i4
	movvc	%icc,	%l1,	%g3
	movg	%xcc,	%g7,	%l0
	addc	%o3,	%i6,	%g2
	lduh	[%l7 + 0x2A],	%i7
	udivcc	%i2,	0x1AC3,	%g5
	edge16l	%g4,	%o1,	%o7
	umul	%l6,	0x122E,	%i0
	edge32n	%l2,	%o2,	%o6
	fone	%f16
	mulx	%g1,	%g6,	%l3
	ld	[%l7 + 0x78],	%f30
	fsrc1s	%f23,	%f3
	edge32ln	%i5,	%i1,	%o5
	array8	%l4,	%o0,	%o4
	movn	%xcc,	%i3,	%l5
	mulx	%l1,	%g3,	%g7
	array8	%l0,	%i4,	%i6
	fpsub16	%f28,	%f18,	%f0
	edge16	%o3,	%g2,	%i7
	orcc	%i2,	%g4,	%o1
	fnegs	%f5,	%f14
	ldd	[%l7 + 0x78],	%f24
	ldub	[%l7 + 0x53],	%g5
	ldsb	[%l7 + 0x56],	%l6
	smul	%i0,	0x16C9,	%l2
	stx	%o2,	[%l7 + 0x78]
	pdist	%f18,	%f26,	%f0
	popc	0x151A,	%o7
	fexpand	%f18,	%f22
	movl	%icc,	%g1,	%g6
	xnorcc	%l3,	0x13BB,	%i5
	umulcc	%i1,	0x10BF,	%o5
	sdivcc	%o6,	0x01BB,	%o0
	stx	%o4,	[%l7 + 0x18]
	sdivx	%i3,	0x0A95,	%l5
	edge8	%l1,	%l4,	%g7
	ldd	[%l7 + 0x50],	%l0
	std	%f20,	[%l7 + 0x58]
	srl	%g3,	0x15,	%i4
	srlx	%o3,	0x0C,	%i6
	udiv	%g2,	0x0F44,	%i7
	subc	%g4,	0x0FDE,	%i2
	movl	%xcc,	%g5,	%o1
	ldsw	[%l7 + 0x2C],	%l6
	std	%f18,	[%l7 + 0x30]
	edge32l	%i0,	%l2,	%o2
	ldx	[%l7 + 0x50],	%g1
	fmovdneg	%icc,	%f29,	%f4
	nop
	set	0x4C, %l6
	ldsw	[%l7 + %l6],	%g6
	and	%l3,	0x0C73,	%o7
	fpackfix	%f28,	%f20
	sllx	%i5,	0x0F,	%o5
	edge8n	%i1,	%o6,	%o4
	fandnot2s	%f28,	%f14,	%f23
	lduw	[%l7 + 0x5C],	%o0
	sethi	0x1E61,	%i3
	mova	%xcc,	%l1,	%l5
	sra	%g7,	%l0,	%g3
	fmovsvc	%xcc,	%f25,	%f28
	xorcc	%l4,	0x0228,	%o3
	addcc	%i4,	%i6,	%i7
	fxnor	%f6,	%f6,	%f12
	fornot2	%f30,	%f6,	%f14
	mulscc	%g4,	0x16F2,	%g2
	movrgz	%i2,	%o1,	%l6
	addcc	%g5,	0x0D29,	%l2
	fmovrdgez	%i0,	%f10,	%f26
	sdivcc	%g1,	0x021A,	%o2
	fandnot2s	%f19,	%f21,	%f3
	subccc	%l3,	0x005F,	%o7
	umulcc	%g6,	%i5,	%o5
	fmovdleu	%icc,	%f4,	%f8
	udivcc	%i1,	0x1199,	%o6
	edge16ln	%o0,	%o4,	%i3
	ldd	[%l7 + 0x20],	%f26
	array16	%l1,	%l5,	%l0
	movge	%icc,	%g3,	%g7
	ldd	[%l7 + 0x60],	%l4
	movpos	%icc,	%i4,	%i6
	addc	%i7,	0x1619,	%g4
	fcmpgt32	%f26,	%f28,	%g2
	add	%i2,	0x13EC,	%o1
	ldsb	[%l7 + 0x2F],	%l6
	movn	%icc,	%g5,	%l2
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	movneg	%icc,	%l3,	%o7
	mulscc	%g6,	0x19F6,	%o2
	movleu	%xcc,	%o5,	%i5
	and	%o6,	%o0,	%o4
	fmovdvs	%xcc,	%f4,	%f5
	pdist	%f22,	%f12,	%f2
	array8	%i1,	%i3,	%l5
	edge16ln	%l1,	%l0,	%g3
	sir	0x0C95
	movre	%l4,	0x298,	%i4
	stx	%i6,	[%l7 + 0x38]
	umul	%i7,	%g7,	%g4
	fpackfix	%f4,	%f17
	fnot2	%f24,	%f22
	fnands	%f10,	%f17,	%f16
	array8	%i2,	%g2,	%o1
	smul	%l6,	%g5,	%l2
	subc	%g1,	%o3,	%i0
	mulx	%l3,	%o7,	%g6
	movrlez	%o5,	0x207,	%i5
	xnorcc	%o2,	0x1946,	%o6
	smulcc	%o0,	%o4,	%i3
	movcc	%icc,	%l5,	%l1
	fcmple32	%f8,	%f30,	%l0
	bshuffle	%f20,	%f18,	%f16
	movl	%xcc,	%i1,	%l4
	fmovscc	%icc,	%f4,	%f12
	xor	%i4,	%g3,	%i7
	alignaddr	%g7,	%i6,	%g4
	fpadd16	%f14,	%f12,	%f20
	xnor	%g2,	%i2,	%o1
	fnor	%f0,	%f4,	%f16
	andn	%g5,	0x190D,	%l6
	fornot2s	%f10,	%f11,	%f4
	restore %g1, %o3, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i0,	%o7
	fcmpd	%fcc2,	%f20,	%f28
	movgu	%icc,	%g6,	%o5
	movle	%icc,	%l3,	%i5
	movneg	%xcc,	%o2,	%o6
	movgu	%xcc,	%o4,	%i3
	edge32n	%o0,	%l1,	%l5
	fmovrsne	%i1,	%f21,	%f24
	save %l0, %i4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i7,	%g7,	%i6
	movpos	%xcc,	%g4,	%g2
	edge8l	%l4,	%o1,	%i2
	fpsub16s	%f13,	%f3,	%f16
	smul	%l6,	%g1,	%g5
	umulcc	%o3,	%i0,	%o7
	and	%l2,	0x0059,	%o5
	fmul8x16au	%f20,	%f0,	%f16
	fcmpne16	%f20,	%f20,	%l3
	fnor	%f12,	%f14,	%f18
	umulcc	%i5,	0x070A,	%o2
	pdist	%f2,	%f0,	%f6
	ldd	[%l7 + 0x18],	%f28
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%o6
	movrlz	%o4,	%g6,	%i3
	sdiv	%o0,	0x07F4,	%l1
	movne	%xcc,	%l5,	%i1
	ld	[%l7 + 0x30],	%f1
	edge32	%l0,	%g3,	%i7
	xorcc	%g7,	0x0EE0,	%i6
	array16	%g4,	%i4,	%l4
	fmovdpos	%xcc,	%f13,	%f3
	smulcc	%o1,	%g2,	%i2
	fsrc1s	%f6,	%f25
	orcc	%l6,	%g1,	%g5
	movrgez	%o3,	%i0,	%o7
	movn	%xcc,	%o5,	%l2
	edge32l	%i5,	%o2,	%l3
	std	%f16,	[%l7 + 0x68]
	fsrc2	%f24,	%f24
	stw	%o6,	[%l7 + 0x0C]
	mova	%icc,	%o4,	%i3
	xor	%g6,	%l1,	%o0
	movvc	%xcc,	%l5,	%l0
	movrlez	%g3,	0x090,	%i7
	stb	%i1,	[%l7 + 0x2F]
	lduh	[%l7 + 0x14],	%g7
	pdist	%f6,	%f10,	%f20
	fones	%f18
	mulx	%i6,	%i4,	%g4
	st	%f23,	[%l7 + 0x4C]
	add	%o1,	%g2,	%i2
	udivcc	%l6,	0x1B1B,	%g1
	fxnor	%f6,	%f6,	%f10
	movleu	%icc,	%g5,	%o3
	lduh	[%l7 + 0x7C],	%l4
	or	%o7,	0x1DF7,	%i0
	lduw	[%l7 + 0x18],	%l2
	alignaddr	%o5,	%i5,	%o2
	umul	%o6,	0x1586,	%l3
	array16	%i3,	%o4,	%g6
	ldd	[%l7 + 0x58],	%f28
	xnor	%o0,	%l1,	%l5
	fandnot1s	%f25,	%f21,	%f17
	alignaddrl	%l0,	%g3,	%i7
	sdivx	%i1,	0x0CD8,	%g7
	edge8n	%i4,	%i6,	%o1
	addcc	%g2,	%i2,	%l6
	sllx	%g4,	0x09,	%g1
	srlx	%o3,	%g5,	%o7
	sllx	%i0,	%l4,	%o5
	udiv	%i5,	0x1F40,	%l2
	alignaddr	%o2,	%o6,	%l3
	fmovsvc	%icc,	%f3,	%f5
	xor	%o4,	%g6,	%o0
	umul	%i3,	0x19C6,	%l1
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%l0
	sir	0x1A20
	edge8	%g3,	%i7,	%l5
	fmovda	%icc,	%f26,	%f29
	umulcc	%g7,	0x04C2,	%i4
	stx	%i6,	[%l7 + 0x68]
	fpsub32	%f30,	%f0,	%f24
	sllx	%o1,	0x01,	%i1
	fmovsg	%xcc,	%f19,	%f4
	fmovdgu	%xcc,	%f31,	%f8
	fnegd	%f6,	%f4
	ldd	[%l7 + 0x28],	%g2
	movleu	%xcc,	%l6,	%g4
	popc	0x0A9C,	%i2
	movcc	%icc,	%o3,	%g5
	smulcc	%o7,	%i0,	%g1
	sdivcc	%o5,	0x0ECA,	%i5
	movn	%icc,	%l4,	%l2
	movrgz	%o6,	0x12E,	%l3
	movpos	%xcc,	%o4,	%o2
	fnegd	%f2,	%f8
	stx	%g6,	[%l7 + 0x28]
	sethi	0x0813,	%o0
	edge32l	%l1,	%l0,	%g3
	or	%i7,	0x0C51,	%l5
	movrgz	%g7,	%i3,	%i4
	and	%i6,	0x0526,	%i1
	movpos	%icc,	%g2,	%l6
	stx	%g4,	[%l7 + 0x28]
	array16	%i2,	%o1,	%g5
	fmovsvs	%xcc,	%f27,	%f21
	mova	%icc,	%o7,	%i0
	movle	%icc,	%g1,	%o3
	movge	%xcc,	%i5,	%l4
	movl	%xcc,	%o5,	%l2
	edge32	%l3,	%o4,	%o6
	fmovsge	%icc,	%f3,	%f6
	ldub	[%l7 + 0x09],	%o2
	subcc	%o0,	%g6,	%l1
	udiv	%g3,	0x07C9,	%l0
	smul	%i7,	%l5,	%i3
	subccc	%i4,	%g7,	%i1
	umulcc	%g2,	%i6,	%l6
	edge8n	%g4,	%o1,	%i2
	edge8n	%o7,	%i0,	%g5
	mova	%icc,	%g1,	%i5
	fpsub32s	%f5,	%f31,	%f30
	st	%f20,	[%l7 + 0x44]
	edge8	%l4,	%o5,	%o3
	movle	%xcc,	%l3,	%o4
	fmovrdlez	%l2,	%f18,	%f0
	pdist	%f24,	%f0,	%f20
	fmul8x16al	%f25,	%f0,	%f16
	movne	%xcc,	%o6,	%o2
	edge8	%o0,	%g6,	%g3
	edge16l	%l0,	%l1,	%l5
	srax	%i3,	%i7,	%g7
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	sub	%i6,	%g2,	%l6
	alignaddr	%o1,	%g4,	%o7
	fands	%f4,	%f19,	%f26
	movpos	%xcc,	%i2,	%i0
	alignaddrl	%g5,	%g1,	%i5
	sdiv	%l4,	0x1822,	%o3
	udivcc	%o5,	0x05D8,	%l3
	umulcc	%l2,	%o4,	%o6
	ldd	[%l7 + 0x08],	%o0
	movge	%icc,	%g6,	%o2
	movvc	%xcc,	%g3,	%l0
	fnands	%f29,	%f21,	%f7
	srl	%l1,	0x0D,	%l5
	ldsh	[%l7 + 0x20],	%i7
	edge16l	%g7,	%i3,	%i4
	udiv	%i1,	0x1201,	%g2
	sllx	%i6,	%o1,	%g4
	movpos	%icc,	%l6,	%o7
	andcc	%i2,	0x0DCB,	%g5
	mulscc	%g1,	%i0,	%i5
	movg	%xcc,	%o3,	%o5
	movcc	%xcc,	%l4,	%l3
	movn	%xcc,	%o4,	%l2
	lduw	[%l7 + 0x48],	%o6
	stx	%g6,	[%l7 + 0x68]
	sth	%o2,	[%l7 + 0x0C]
	umulcc	%g3,	%o0,	%l0
	udiv	%l5,	0x0AA5,	%l1
	fpadd16s	%f25,	%f26,	%f16
	alignaddr	%i7,	%i3,	%g7
	umul	%i4,	0x0A01,	%i1
	fmovrdgz	%i6,	%f6,	%f18
	nop
	set	0x67, %i3
	stb	%o1,	[%l7 + %i3]
	addcc	%g4,	0x0FB4,	%g2
	movcc	%xcc,	%l6,	%o7
	std	%f14,	[%l7 + 0x28]
	fmovrse	%g5,	%f17,	%f19
	fmovrdlz	%i2,	%f4,	%f0
	fmovsl	%xcc,	%f20,	%f1
	addc	%g1,	0x1116,	%i0
	fcmps	%fcc1,	%f31,	%f2
	movre	%i5,	0x19D,	%o5
	movn	%xcc,	%o3,	%l4
	nop
	set	0x4C, %i6
	lduw	[%l7 + %i6],	%o4
	fzero	%f22
	smulcc	%l3,	%o6,	%l2
	udivx	%g6,	0x1CEC,	%g3
	edge16l	%o2,	%l0,	%l5
	fmovdg	%xcc,	%f2,	%f0
	fmovdgu	%xcc,	%f28,	%f6
	sdiv	%o0,	0x0941,	%i7
	fmovdcc	%icc,	%f2,	%f0
	movle	%icc,	%l1,	%g7
	movcc	%xcc,	%i3,	%i4
	xor	%i1,	%o1,	%g4
	umul	%g2,	0x1631,	%l6
	sir	0x0D43
	addcc	%i6,	%o7,	%g5
	xorcc	%i2,	%g1,	%i0
	mulx	%i5,	0x1355,	%o3
	fmovscc	%xcc,	%f15,	%f28
	fmul8x16au	%f17,	%f16,	%f30
	edge8n	%o5,	%o4,	%l4
	mulx	%l3,	0x0C27,	%l2
	andn	%o6,	0x1303,	%g6
	mova	%xcc,	%g3,	%l0
	array32	%l5,	%o2,	%o0
	sth	%i7,	[%l7 + 0x0C]
	srl	%g7,	%i3,	%i4
	ldsw	[%l7 + 0x34],	%l1
	umulcc	%o1,	0x0DF1,	%g4
	fcmpne16	%f28,	%f16,	%i1
	edge32ln	%g2,	%l6,	%o7
	fcmpd	%fcc3,	%f28,	%f28
	edge32n	%g5,	%i6,	%g1
	sir	0x14D4
	movrgez	%i2,	0x2CC,	%i0
	orn	%o3,	0x0105,	%i5
	movgu	%xcc,	%o4,	%o5
	fmovde	%icc,	%f23,	%f27
	fmovrdne	%l4,	%f26,	%f16
	stw	%l3,	[%l7 + 0x2C]
	addccc	%l2,	0x18D2,	%g6
	umul	%o6,	0x14D1,	%l0
	fnot2	%f10,	%f4
	fmovrdgez	%l5,	%f24,	%f8
	fsrc1	%f14,	%f14
	srl	%g3,	0x09,	%o0
	stx	%i7,	[%l7 + 0x70]
	ldsb	[%l7 + 0x51],	%o2
	fmovsg	%xcc,	%f2,	%f13
	fmovsneg	%icc,	%f2,	%f9
	sth	%i3,	[%l7 + 0x1C]
	movleu	%xcc,	%g7,	%i4
	movl	%xcc,	%l1,	%o1
	movn	%xcc,	%i1,	%g2
	sllx	%l6,	0x13,	%g4
	sdivcc	%o7,	0x0919,	%i6
	stw	%g5,	[%l7 + 0x34]
	movne	%icc,	%i2,	%g1
	subccc	%o3,	0x130F,	%i0
	edge16l	%o4,	%o5,	%i5
	xorcc	%l4,	0x18E9,	%l2
	fcmpne32	%f4,	%f20,	%g6
	addc	%o6,	%l0,	%l5
	fmovda	%icc,	%f15,	%f30
	srax	%l3,	0x1A,	%g3
	nop
	set	0x6C, %g3
	stb	%i7,	[%l7 + %g3]
	andcc	%o0,	0x1165,	%i3
	edge16ln	%g7,	%o2,	%l1
	edge8	%i4,	%o1,	%i1
	movg	%xcc,	%g2,	%l6
	xnor	%g4,	0x1DE1,	%o7
	fpack32	%f18,	%f16,	%f8
	movne	%xcc,	%g5,	%i6
	movn	%icc,	%i2,	%o3
	array16	%g1,	%i0,	%o4
	faligndata	%f30,	%f10,	%f2
	umulcc	%o5,	0x1A67,	%l4
	addccc	%i5,	%g6,	%o6
	andncc	%l2,	%l0,	%l3
	edge32l	%l5,	%g3,	%i7
	fcmpeq16	%f16,	%f24,	%i3
	nop
	set	0x34, %g4
	lduh	[%l7 + %g4],	%g7
	movrgez	%o0,	%l1,	%i4
	lduh	[%l7 + 0x7A],	%o2
	edge32n	%i1,	%g2,	%l6
	xnorcc	%g4,	%o7,	%o1
	movcs	%icc,	%i6,	%i2
	stx	%g5,	[%l7 + 0x18]
	sdiv	%o3,	0x0CBB,	%g1
	edge8	%i0,	%o4,	%l4
	array8	%o5,	%g6,	%i5
	movrlz	%o6,	0x0CD,	%l2
	fmovrsgz	%l0,	%f18,	%f29
	array16	%l5,	%g3,	%l3
	xorcc	%i3,	0x0A97,	%i7
	movge	%icc,	%o0,	%g7
	edge16ln	%l1,	%i4,	%o2
	movpos	%icc,	%g2,	%i1
	lduh	[%l7 + 0x3A],	%g4
	edge8	%o7,	%o1,	%l6
	andn	%i2,	0x18B8,	%g5
	restore %i6, 0x01D4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g1,	%o4,	%i0
	fabsd	%f20,	%f6
	xnorcc	%l4,	0x131C,	%o5
	subccc	%g6,	%i5,	%o6
	ldx	[%l7 + 0x20],	%l0
	sub	%l5,	0x1652,	%g3
	orcc	%l2,	%l3,	%i3
	sdiv	%o0,	0x0717,	%i7
	ldub	[%l7 + 0x5B],	%l1
	lduh	[%l7 + 0x74],	%i4
	stx	%g7,	[%l7 + 0x78]
	edge32ln	%g2,	%i1,	%o2
	addc	%o7,	0x05B1,	%g4
	fornot1s	%f18,	%f23,	%f6
	ldub	[%l7 + 0x61],	%o1
	subccc	%l6,	0x11D0,	%i2
	ldx	[%l7 + 0x10],	%i6
	fmovsne	%icc,	%f22,	%f14
	fmovsg	%xcc,	%f20,	%f26
	sethi	0x06D3,	%o3
	orn	%g5,	0x1A75,	%g1
	movrlez	%i0,	%o4,	%o5
	udiv	%g6,	0x0A7D,	%i5
	mova	%icc,	%l4,	%l0
	movpos	%icc,	%o6,	%g3
	array32	%l5,	%l2,	%i3
	fcmple16	%f8,	%f26,	%o0
	ldub	[%l7 + 0x1C],	%l3
	popc	0x1B86,	%l1
	smul	%i7,	%i4,	%g7
	popc	0x0C98,	%i1
	movrlez	%o2,	0x043,	%g2
	sra	%g4,	0x08,	%o7
	ldsw	[%l7 + 0x28],	%l6
	fabss	%f16,	%f14
	fmovse	%icc,	%f3,	%f30
	fsrc2s	%f9,	%f15
	xnorcc	%o1,	%i6,	%o3
	pdist	%f2,	%f12,	%f0
	fmovrdne	%g5,	%f12,	%f16
	andn	%i2,	0x08A3,	%g1
	fmul8ulx16	%f2,	%f12,	%f20
	movrlz	%i0,	%o4,	%g6
	fmovscc	%xcc,	%f3,	%f0
	fnot2s	%f22,	%f16
	andcc	%i5,	%l4,	%l0
	subccc	%o6,	0x10D5,	%g3
	add	%o5,	0x0D3E,	%l2
	fpadd16	%f12,	%f20,	%f14
	save %l5, %o0, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l3,	%l1,	%i4
	alignaddrl	%g7,	%i1,	%o2
	fmovdne	%icc,	%f26,	%f1
	smul	%g2,	0x1771,	%g4
	nop
	set	0x36, %l2
	ldub	[%l7 + %l2],	%o7
	movl	%icc,	%l6,	%i7
	add	%o1,	0x1262,	%i6
	movgu	%icc,	%o3,	%g5
	sdivcc	%i2,	0x0CC2,	%i0
	fone	%f12
	movre	%g1,	%g6,	%i5
	alignaddrl	%o4,	%l4,	%o6
	fpadd16	%f2,	%f4,	%f26
	siam	0x3
	edge16	%l0,	%g3,	%o5
	udiv	%l2,	0x0C67,	%o0
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	ldsw	[%l7 + 0x5C],	%l1
	movleu	%icc,	%l5,	%g7
	stx	%i1,	[%l7 + 0x70]
	alignaddrl	%i4,	%g2,	%g4
	fandnot1	%f16,	%f12,	%f6
	addcc	%o2,	%l6,	%o7
	fandnot1s	%f18,	%f2,	%f18
	movrgez	%o1,	%i7,	%i6
	fmovrslz	%g5,	%f12,	%f2
	movleu	%icc,	%o3,	%i2
	mulx	%g1,	%i0,	%g6
	movle	%icc,	%i5,	%o4
	andn	%l4,	%l0,	%g3
	movpos	%xcc,	%o6,	%o5
	movn	%xcc,	%l2,	%o0
	movleu	%xcc,	%l3,	%i3
	edge8	%l1,	%g7,	%i1
	movg	%icc,	%i4,	%g2
	movrne	%g4,	0x371,	%l5
	fmovrsgz	%l6,	%f27,	%f15
	srlx	%o7,	0x1F,	%o2
	popc	%i7,	%i6
	move	%xcc,	%g5,	%o1
	movvs	%icc,	%o3,	%g1
	movpos	%icc,	%i2,	%g6
	xnorcc	%i0,	0x1A9F,	%o4
	andncc	%l4,	%l0,	%g3
	edge32l	%o6,	%i5,	%l2
	stb	%o5,	[%l7 + 0x75]
	fmovrdgz	%l3,	%f12,	%f0
	movcc	%icc,	%o0,	%i3
	addccc	%l1,	%i1,	%g7
	fcmpgt32	%f26,	%f24,	%i4
	edge32l	%g4,	%l5,	%l6
	mova	%xcc,	%o7,	%g2
	stx	%o2,	[%l7 + 0x70]
	movleu	%icc,	%i7,	%g5
	sir	0x19F3
	movn	%xcc,	%i6,	%o1
	ldd	[%l7 + 0x70],	%g0
	srl	%o3,	0x05,	%i2
	ldsh	[%l7 + 0x0E],	%i0
	and	%g6,	%l4,	%l0
	array8	%o4,	%o6,	%g3
	sth	%l2,	[%l7 + 0x64]
	movg	%icc,	%i5,	%o5
	fmovrdlz	%l3,	%f14,	%f28
	mova	%icc,	%i3,	%l1
	lduw	[%l7 + 0x10],	%i1
	movcs	%icc,	%o0,	%g7
	subcc	%g4,	%l5,	%l6
	xorcc	%i4,	%g2,	%o7
	fnand	%f2,	%f2,	%f14
	fcmpes	%fcc2,	%f0,	%f15
	fmul8sux16	%f2,	%f4,	%f6
	movrne	%o2,	0x351,	%g5
	mova	%xcc,	%i6,	%o1
	orn	%i7,	0x0E83,	%g1
	orncc	%o3,	%i2,	%i0
	movvc	%xcc,	%l4,	%l0
	edge8ln	%g6,	%o4,	%o6
	movrne	%g3,	0x207,	%i5
	alignaddrl	%o5,	%l2,	%l3
	edge8n	%l1,	%i1,	%o0
	ldd	[%l7 + 0x30],	%f22
	save %g7, %g4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l6,	0x0CFC,	%i3
	smulcc	%i4,	0x0AAE,	%g2
	movcc	%xcc,	%o2,	%o7
	fnot1	%f20,	%f14
	stb	%g5,	[%l7 + 0x4B]
	umul	%o1,	0x17C8,	%i7
	sdivx	%g1,	0x1D1F,	%o3
	fmul8x16al	%f27,	%f15,	%f12
	sdivcc	%i2,	0x000A,	%i0
	edge16l	%l4,	%i6,	%g6
	fmovrdne	%o4,	%f16,	%f22
	smulcc	%l0,	0x0C3D,	%o6
	orcc	%g3,	%o5,	%i5
	umulcc	%l2,	0x0683,	%l3
	orcc	%l1,	0x08DE,	%i1
	srax	%o0,	0x05,	%g4
	srl	%g7,	%l5,	%i3
	mulx	%l6,	0x07D2,	%g2
	andncc	%i4,	%o7,	%g5
	array32	%o2,	%o1,	%i7
	xorcc	%o3,	%i2,	%i0
	edge8l	%l4,	%i6,	%g1
	andn	%g6,	0x01BB,	%o4
	movrlez	%l0,	0x257,	%g3
	movrgez	%o5,	0x3DC,	%i5
	mulscc	%o6,	%l2,	%l3
	sdivx	%i1,	0x105C,	%o0
	lduw	[%l7 + 0x5C],	%g4
	subccc	%g7,	%l1,	%i3
	movcc	%xcc,	%l5,	%l6
	array8	%g2,	%i4,	%g5
	ld	[%l7 + 0x6C],	%f31
	smul	%o2,	%o1,	%o7
	lduh	[%l7 + 0x3A],	%o3
	fmuld8sux16	%f18,	%f16,	%f14
	for	%f4,	%f16,	%f28
	edge32l	%i7,	%i2,	%i0
	movge	%icc,	%i6,	%l4
	fpack32	%f18,	%f28,	%f4
	movrne	%g6,	%g1,	%o4
	addccc	%l0,	0x1AEB,	%g3
	ldsb	[%l7 + 0x0B],	%o5
	fcmpd	%fcc3,	%f14,	%f14
	fmovdne	%icc,	%f7,	%f7
	ldx	[%l7 + 0x40],	%o6
	fnot2	%f20,	%f4
	srax	%l2,	%l3,	%i5
	udiv	%o0,	0x0EB1,	%i1
	andn	%g7,	%g4,	%i3
	edge8ln	%l1,	%l5,	%g2
	fnands	%f10,	%f3,	%f30
	fpadd32s	%f7,	%f14,	%f2
	alignaddr	%i4,	%g5,	%o2
	st	%f25,	[%l7 + 0x5C]
	fmovdge	%icc,	%f7,	%f27
	mulx	%o1,	0x055E,	%l6
	or	%o7,	0x1761,	%i7
	lduh	[%l7 + 0x2A],	%o3
	ldub	[%l7 + 0x22],	%i2
	fmovdge	%icc,	%f5,	%f10
	edge32n	%i0,	%i6,	%g6
	array8	%l4,	%o4,	%g1
	fzero	%f10
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%f10
	fmovdne	%icc,	%f2,	%f11
	subccc	%l0,	0x1FEF,	%g3
	and	%o5,	0x0F61,	%o6
	array32	%l2,	%i5,	%l3
	smul	%i1,	%o0,	%g7
	movrgz	%i3,	0x327,	%l1
	ldd	[%l7 + 0x20],	%l4
	movleu	%icc,	%g4,	%i4
	sub	%g2,	%o2,	%o1
	fors	%f0,	%f30,	%f22
	edge32l	%l6,	%o7,	%g5
	sdiv	%i7,	0x0D6D,	%o3
	ldsw	[%l7 + 0x0C],	%i0
	alignaddrl	%i6,	%i2,	%l4
	movn	%icc,	%g6,	%o4
	add	%l0,	0x0C8D,	%g1
	mulx	%o5,	%g3,	%o6
	sub	%i5,	%l3,	%l2
	fpsub32	%f18,	%f16,	%f28
	sdivx	%o0,	0x19D4,	%g7
	fzero	%f24
	array16	%i3,	%l1,	%l5
	mulscc	%i1,	0x136A,	%i4
	and	%g4,	%g2,	%o2
	sir	0x09AB
	sllx	%l6,	0x1B,	%o7
	ldsw	[%l7 + 0x78],	%g5
	move	%icc,	%o1,	%i7
	fmovdn	%icc,	%f6,	%f18
	addcc	%i0,	%o3,	%i6
	movl	%xcc,	%i2,	%g6
	fcmpgt16	%f6,	%f10,	%o4
	udivx	%l0,	0x08BA,	%l4
	fornot1s	%f30,	%f4,	%f9
	std	%f18,	[%l7 + 0x40]
	restore %o5, %g1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o6,	%i5,	%l3
	ld	[%l7 + 0x34],	%f3
	array32	%o0,	%g7,	%i3
	addcc	%l1,	%l5,	%l2
	movpos	%icc,	%i1,	%i4
	fpadd16s	%f19,	%f30,	%f16
	subc	%g4,	0x0405,	%o2
	movrne	%g2,	%l6,	%g5
	fnot2s	%f0,	%f26
	movrlz	%o1,	%o7,	%i0
	fmovrdne	%i7,	%f18,	%f28
	ldsh	[%l7 + 0x4C],	%i6
	movre	%i2,	0x318,	%o3
	ldsb	[%l7 + 0x0F],	%g6
	fpsub16s	%f3,	%f22,	%f20
	stb	%l0,	[%l7 + 0x4F]
	fmovrde	%l4,	%f4,	%f2
	andcc	%o4,	0x0739,	%o5
	ld	[%l7 + 0x50],	%f23
	fzero	%f12
	edge32ln	%g1,	%g3,	%i5
	fmovda	%xcc,	%f18,	%f22
	edge16	%l3,	%o0,	%o6
	fpsub16	%f28,	%f22,	%f4
	smul	%i3,	%l1,	%l5
	movn	%icc,	%l2,	%i1
	st	%f8,	[%l7 + 0x24]
	addc	%g7,	0x184E,	%i4
	stx	%o2,	[%l7 + 0x48]
	ldsb	[%l7 + 0x47],	%g2
	ldub	[%l7 + 0x62],	%l6
	srlx	%g4,	0x1E,	%o1
	orncc	%o7,	%g5,	%i0
	xnor	%i7,	0x0DA3,	%i2
	andcc	%i6,	0x1EED,	%g6
	movrgez	%l0,	%o3,	%o4
	stw	%o5,	[%l7 + 0x68]
	subc	%g1,	0x1B8F,	%g3
	movcc	%icc,	%l4,	%i5
	fmovrsgez	%l3,	%f27,	%f21
	addc	%o0,	%o6,	%l1
	subcc	%l5,	%l2,	%i1
	ldsh	[%l7 + 0x6E],	%i3
	ld	[%l7 + 0x70],	%f31
	srax	%g7,	0x16,	%o2
	fone	%f30
	or	%i4,	0x0E0E,	%g2
	movcs	%xcc,	%l6,	%o1
	lduh	[%l7 + 0x72],	%o7
	movcc	%xcc,	%g5,	%g4
	fmovsn	%icc,	%f9,	%f10
	xnor	%i0,	0x0F9C,	%i7
	ldub	[%l7 + 0x6E],	%i6
	addccc	%i2,	%g6,	%o3
	sll	%o4,	%l0,	%o5
	movgu	%xcc,	%g3,	%l4
	stb	%i5,	[%l7 + 0x22]
	fcmpeq32	%f12,	%f0,	%g1
	fmovdgu	%icc,	%f31,	%f14
	xorcc	%o0,	%l3,	%l1
	fcmple16	%f18,	%f4,	%o6
	std	%f4,	[%l7 + 0x60]
	save %l5, 0x1526, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x5D],	%i1
	movg	%xcc,	%i3,	%g7
	movge	%xcc,	%o2,	%i4
	mova	%xcc,	%l6,	%o1
	edge16ln	%g2,	%o7,	%g4
	movre	%i0,	%i7,	%i6
	move	%xcc,	%i2,	%g5
	sth	%g6,	[%l7 + 0x08]
	movl	%icc,	%o3,	%o4
	fpsub16s	%f21,	%f10,	%f10
	sdivx	%o5,	0x1D75,	%g3
	std	%f24,	[%l7 + 0x10]
	edge8ln	%l0,	%l4,	%g1
	lduh	[%l7 + 0x70],	%i5
	xor	%l3,	%l1,	%o0
	nop
	set	0x4C, %o2
	ldsw	[%l7 + %o2],	%l5
	mulx	%o6,	0x0EAF,	%i1
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%i2
	popc	0x0816,	%l2
	edge32n	%o2,	%i4,	%g7
	sth	%o1,	[%l7 + 0x2E]
	edge32l	%l6,	%g2,	%g4
	fmovsg	%xcc,	%f9,	%f24
	add	%i0,	0x0C04,	%o7
	sdivcc	%i7,	0x0BC4,	%i6
	fmovrdgz	%g5,	%f24,	%f20
	udiv	%i2,	0x13F5,	%o3
	movrgz	%g6,	%o5,	%o4
	movle	%icc,	%l0,	%l4
	sub	%g3,	%i5,	%l3
	ldd	[%l7 + 0x20],	%f8
	sra	%g1,	%l1,	%l5
	fmovrsne	%o0,	%f1,	%f3
	edge8l	%o6,	%i3,	%i1
	subccc	%o2,	0x119D,	%i4
	edge32ln	%g7,	%o1,	%l6
	sdiv	%l2,	0x0DE2,	%g2
	siam	0x0
	andn	%g4,	0x0638,	%i0
	edge8	%o7,	%i6,	%i7
	sll	%i2,	%o3,	%g6
	alignaddrl	%g5,	%o5,	%l0
	movpos	%xcc,	%o4,	%l4
	popc	%i5,	%l3
	movvc	%xcc,	%g3,	%g1
	lduw	[%l7 + 0x3C],	%l1
	lduh	[%l7 + 0x36],	%l5
	edge16	%o6,	%o0,	%i1
	popc	%i3,	%o2
	subcc	%i4,	%o1,	%l6
	st	%f13,	[%l7 + 0x78]
	fmul8sux16	%f18,	%f26,	%f30
	xor	%g7,	%l2,	%g4
	ldsh	[%l7 + 0x1E],	%g2
	movne	%icc,	%i0,	%o7
	orncc	%i6,	0x0D7F,	%i7
	sth	%i2,	[%l7 + 0x44]
	ld	[%l7 + 0x50],	%f29
	edge16ln	%o3,	%g5,	%g6
	fpsub16	%f30,	%f4,	%f26
	smul	%l0,	0x00D2,	%o5
	movcs	%xcc,	%l4,	%i5
	std	%f6,	[%l7 + 0x68]
	fmovscc	%xcc,	%f25,	%f2
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%l2
	alignaddr	%g3,	%o4,	%g1
	fnegs	%f5,	%f17
	movrgz	%l1,	0x2CB,	%l5
	lduh	[%l7 + 0x3C],	%o6
	xnorcc	%o0,	%i3,	%i1
	fmovd	%f12,	%f12
	fmuld8ulx16	%f21,	%f27,	%f4
	fmovrdlez	%i4,	%f20,	%f12
	sdivcc	%o2,	0x048A,	%l6
	nop
	set	0x08, %l4
	stx	%o1,	[%l7 + %l4]
	fcmpne32	%f2,	%f12,	%g7
	andcc	%l2,	0x1365,	%g4
	array16	%i0,	%o7,	%g2
	add	%i6,	%i7,	%o3
	movn	%icc,	%i2,	%g6
	stw	%g5,	[%l7 + 0x24]
	fmovsne	%icc,	%f25,	%f31
	ld	[%l7 + 0x14],	%f27
	fmovrsgz	%l0,	%f18,	%f26
	addc	%o5,	%l4,	%i5
	fone	%f30
	fmovs	%f21,	%f14
	srl	%l3,	0x00,	%o4
	fand	%f26,	%f26,	%f12
	alignaddr	%g3,	%l1,	%g1
	edge16	%l5,	%o0,	%i3
	sth	%i1,	[%l7 + 0x0E]
	sub	%o6,	0x091D,	%o2
	edge8n	%l6,	%i4,	%g7
	array32	%l2,	%g4,	%o1
	xnorcc	%i0,	0x1CCA,	%o7
	umul	%g2,	0x1FA5,	%i7
	andncc	%i6,	%o3,	%i2
	mulscc	%g6,	%g5,	%l0
	ld	[%l7 + 0x7C],	%f10
	xnorcc	%l4,	0x13F2,	%o5
	fors	%f21,	%f21,	%f23
	sll	%i5,	%l3,	%o4
	fexpand	%f28,	%f24
	popc	0x07B4,	%l1
	andncc	%g1,	%l5,	%o0
	fnot1	%f28,	%f6
	popc	0x03DC,	%g3
	edge8n	%i1,	%i3,	%o6
	sll	%l6,	0x15,	%i4
	xor	%o2,	%g7,	%l2
	ldsh	[%l7 + 0x22],	%g4
	fone	%f26
	fpmerge	%f4,	%f23,	%f30
	add	%i0,	%o1,	%g2
	andcc	%i7,	%o7,	%o3
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	movre	%g5,	%l0,	%l4
	subc	%o5,	0x1E3E,	%i5
	fornot1	%f18,	%f24,	%f0
	umul	%l3,	0x0BA1,	%o4
	fmovsg	%icc,	%f0,	%f29
	xnorcc	%l1,	0x16C5,	%g1
	srl	%l5,	%i6,	%g3
	movrlz	%o0,	0x06E,	%i3
	movle	%xcc,	%i1,	%o6
	fmovda	%xcc,	%f20,	%f8
	mova	%icc,	%i4,	%l6
	mulscc	%o2,	%l2,	%g7
	ldub	[%l7 + 0x43],	%g4
	lduh	[%l7 + 0x78],	%o1
	addc	%i0,	%i7,	%g2
	sra	%o7,	%o3,	%g6
	movrlez	%g5,	%i2,	%l0
	edge32l	%o5,	%l4,	%i5
	edge8n	%l3,	%o4,	%g1
	sll	%l1,	%i6,	%l5
	xor	%g3,	0x1C55,	%o0
	alignaddr	%i3,	%i1,	%o6
	movrgez	%i4,	%l6,	%o2
	array16	%l2,	%g4,	%g7
	save %o1, 0x01E2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i0,	%o7,	%o3
	sll	%g6,	0x1F,	%g5
	fmovdge	%xcc,	%f31,	%f17
	movn	%xcc,	%i2,	%l0
	fmovspos	%icc,	%f11,	%f17
	fxors	%f22,	%f13,	%f12
	sir	0x1ECE
	fcmps	%fcc2,	%f13,	%f18
	orncc	%o5,	0x1908,	%g2
	movle	%icc,	%i5,	%l4
	movgu	%xcc,	%o4,	%l3
	edge8l	%l1,	%g1,	%l5
	movg	%xcc,	%i6,	%g3
	movg	%icc,	%o0,	%i1
	edge32n	%o6,	%i4,	%l6
	fzeros	%f25
	ldsw	[%l7 + 0x68],	%o2
	fnot1s	%f22,	%f5
	ldx	[%l7 + 0x40],	%l2
	fmovrslz	%g4,	%f10,	%f1
	sub	%g7,	%i3,	%i7
	fmul8x16al	%f3,	%f16,	%f28
	stw	%i0,	[%l7 + 0x50]
	xor	%o7,	%o3,	%o1
	movgu	%icc,	%g6,	%i2
	smulcc	%l0,	0x0A0E,	%o5
	nop
	set	0x69, %o3
	ldsb	[%l7 + %o3],	%g5
	edge32n	%g2,	%l4,	%i5
	fmovdne	%xcc,	%f17,	%f28
	movge	%icc,	%l3,	%l1
	smul	%o4,	%g1,	%i6
	fmovrsgez	%l5,	%f13,	%f11
	lduh	[%l7 + 0x0E],	%o0
	ldsw	[%l7 + 0x10],	%g3
	movg	%icc,	%o6,	%i4
	edge8l	%i1,	%l6,	%l2
	edge8ln	%g4,	%g7,	%o2
	fpadd16	%f6,	%f24,	%f14
	and	%i3,	%i0,	%i7
	fornot2	%f10,	%f0,	%f4
	udivcc	%o7,	0x030B,	%o3
	fmovdge	%xcc,	%f26,	%f27
	xnor	%o1,	%g6,	%l0
	edge16	%i2,	%g5,	%g2
	movle	%icc,	%o5,	%l4
	smulcc	%l3,	%i5,	%l1
	edge8n	%g1,	%i6,	%l5
	fabss	%f2,	%f26
	addc	%o0,	0x0A23,	%g3
	udivx	%o4,	0x049B,	%o6
	fpmerge	%f15,	%f16,	%f10
	sdivx	%i4,	0x0A53,	%i1
	nop
	set	0x48, %i0
	stx	%l6,	[%l7 + %i0]
	or	%g4,	%l2,	%o2
	smulcc	%i3,	%g7,	%i7
	alignaddrl	%o7,	%i0,	%o3
	array32	%o1,	%g6,	%i2
	popc	0x0021,	%g5
	stw	%l0,	[%l7 + 0x0C]
	ldsw	[%l7 + 0x24],	%g2
	addccc	%o5,	%l3,	%i5
	edge32ln	%l4,	%g1,	%l1
	ldsw	[%l7 + 0x54],	%i6
	edge16l	%l5,	%o0,	%o4
	movle	%icc,	%o6,	%g3
	fmovse	%icc,	%f8,	%f3
	lduw	[%l7 + 0x68],	%i4
	siam	0x3
	smulcc	%i1,	0x1FF1,	%g4
	movle	%icc,	%l2,	%l6
	addccc	%i3,	0x12E3,	%g7
	udiv	%o2,	0x01A8,	%i7
	umulcc	%i0,	%o7,	%o3
	addc	%o1,	%i2,	%g5
	movrgz	%g6,	0x2E3,	%g2
	sth	%o5,	[%l7 + 0x5A]
	subc	%l0,	0x1D7D,	%i5
	sub	%l3,	0x05F9,	%l4
	and	%g1,	0x13DB,	%i6
	orcc	%l5,	0x151B,	%o0
	ldsh	[%l7 + 0x40],	%l1
	sdivcc	%o6,	0x1A71,	%g3
	udiv	%i4,	0x185A,	%o4
	edge32ln	%g4,	%l2,	%i1
	xnorcc	%l6,	%i3,	%o2
	st	%f20,	[%l7 + 0x4C]
	edge16n	%g7,	%i7,	%i0
	movrne	%o7,	%o1,	%o3
	movrlz	%g5,	%g6,	%i2
	movrlz	%g2,	%l0,	%o5
	edge16ln	%l3,	%i5,	%l4
	fpadd16	%f16,	%f22,	%f16
	movgu	%icc,	%g1,	%i6
	edge16l	%l5,	%l1,	%o6
	movrne	%o0,	%g3,	%i4
	xnorcc	%g4,	%l2,	%i1
	fmovsleu	%xcc,	%f20,	%f12
	umulcc	%o4,	0x1F37,	%l6
	and	%o2,	0x113A,	%g7
	mulx	%i7,	%i0,	%i3
	fcmpgt16	%f22,	%f14,	%o7
	edge16n	%o3,	%g5,	%g6
	st	%f5,	[%l7 + 0x30]
	fnors	%f8,	%f4,	%f29
	sir	0x1BD8
	movrlez	%o1,	0x3EC,	%g2
	orcc	%l0,	%o5,	%i2
	movrlez	%i5,	%l4,	%g1
	fmovs	%f28,	%f13
	fcmpeq16	%f16,	%f20,	%i6
	move	%xcc,	%l3,	%l5
	orn	%o6,	%l1,	%o0
	edge8ln	%i4,	%g4,	%l2
	fmovdn	%icc,	%f3,	%f15
	ld	[%l7 + 0x58],	%f26
	fmovrslez	%i1,	%f12,	%f14
	sub	%g3,	0x0091,	%o4
	mova	%icc,	%o2,	%g7
	movgu	%xcc,	%l6,	%i0
	udiv	%i7,	0x0A53,	%i3
	fmovs	%f0,	%f1
	addcc	%o7,	%o3,	%g5
	udivx	%g6,	0x013D,	%g2
	umul	%o1,	%l0,	%i2
	addc	%i5,	%o5,	%g1
	addccc	%i6,	0x0C42,	%l4
	sdivx	%l3,	0x0630,	%o6
	srlx	%l5,	%l1,	%i4
	addc	%g4,	0x1462,	%o0
	xnor	%i1,	%g3,	%l2
	edge8l	%o2,	%o4,	%l6
	mova	%xcc,	%i0,	%i7
	fnot1s	%f12,	%f23
	popc	0x1717,	%i3
	smulcc	%o7,	%g7,	%o3
	stb	%g6,	[%l7 + 0x2B]
	fmul8ulx16	%f22,	%f0,	%f24
	fmovdcs	%icc,	%f17,	%f3
	smul	%g2,	0x1166,	%o1
	xorcc	%l0,	%i2,	%g5
	fmovdg	%xcc,	%f16,	%f8
	ldsb	[%l7 + 0x28],	%i5
	andcc	%o5,	%g1,	%i6
	or	%l4,	%o6,	%l3
	sllx	%l1,	0x04,	%i4
	movrlz	%l5,	0x190,	%g4
	edge32	%i1,	%o0,	%g3
	addcc	%l2,	0x1E03,	%o4
	xnorcc	%l6,	0x1E6F,	%o2
	movne	%icc,	%i0,	%i3
	array16	%i7,	%g7,	%o7
	srl	%o3,	%g2,	%o1
	movre	%l0,	%g6,	%g5
	movrgez	%i2,	%o5,	%i5
	subc	%i6,	0x1426,	%l4
	sir	0x09A3
	fsrc1s	%f11,	%f21
	movvs	%icc,	%o6,	%g1
	fmovsle	%xcc,	%f22,	%f25
	orncc	%l3,	0x0B5F,	%l1
	fcmped	%fcc1,	%f0,	%f24
	subc	%i4,	0x021E,	%g4
	movrgez	%l5,	0x012,	%o0
	edge16	%i1,	%l2,	%o4
	srlx	%l6,	%g3,	%o2
	edge8ln	%i3,	%i7,	%g7
	move	%xcc,	%i0,	%o7
	movrlez	%o3,	0x319,	%g2
	movre	%l0,	0x1A7,	%o1
	stx	%g6,	[%l7 + 0x30]
	fmovsne	%icc,	%f20,	%f30
	array32	%i2,	%o5,	%g5
	movneg	%xcc,	%i5,	%i6
	fmovdl	%icc,	%f19,	%f27
	fpmerge	%f24,	%f21,	%f22
	ldx	[%l7 + 0x38],	%o6
	sub	%g1,	0x15C2,	%l3
	srl	%l4,	0x0D,	%l1
	edge16n	%i4,	%l5,	%g4
	addc	%o0,	0x123F,	%l2
	orn	%i1,	%o4,	%g3
	lduw	[%l7 + 0x6C],	%l6
	ldsh	[%l7 + 0x2A],	%o2
	alignaddr	%i3,	%g7,	%i7
	edge32	%i0,	%o7,	%g2
	ldsb	[%l7 + 0x30],	%l0
	umulcc	%o1,	0x1433,	%g6
	ldx	[%l7 + 0x60],	%i2
	fmovdcs	%xcc,	%f25,	%f6
	fmovdcs	%xcc,	%f3,	%f20
	andncc	%o5,	%o3,	%i5
	edge32n	%i6,	%g5,	%g1
	orn	%l3,	0x0315,	%l4
	movrgez	%l1,	%o6,	%l5
	fmuld8sux16	%f4,	%f13,	%f10
	ld	[%l7 + 0x2C],	%f9
	lduh	[%l7 + 0x3A],	%g4
	edge8l	%i4,	%l2,	%i1
	edge8l	%o0,	%g3,	%o4
	udiv	%o2,	0x1A21,	%i3
	srlx	%l6,	%g7,	%i7
	fmovdne	%xcc,	%f25,	%f30
	add	%i0,	%g2,	%o7
	lduh	[%l7 + 0x2A],	%l0
	fxnors	%f14,	%f15,	%f31
	lduh	[%l7 + 0x2C],	%g6
	edge16n	%i2,	%o1,	%o5
	sethi	0x0DBA,	%i5
	edge32	%o3,	%g5,	%i6
	st	%f20,	[%l7 + 0x2C]
	addcc	%l3,	0x0CFB,	%l4
	fcmped	%fcc3,	%f22,	%f26
	array8	%l1,	%g1,	%o6
	lduh	[%l7 + 0x1C],	%l5
	subccc	%g4,	0x125C,	%i4
	pdist	%f6,	%f18,	%f16
	sdivx	%i1,	0x0B1D,	%l2
	sub	%o0,	%o4,	%o2
	edge16ln	%g3,	%l6,	%i3
	mulx	%g7,	%i7,	%g2
	ld	[%l7 + 0x48],	%f13
	movle	%xcc,	%o7,	%i0
	andn	%l0,	0x1BCC,	%g6
	movrgz	%o1,	0x02F,	%i2
	movne	%xcc,	%o5,	%i5
	fmovscs	%icc,	%f27,	%f30
	stx	%o3,	[%l7 + 0x50]
	fsrc1s	%f3,	%f29
	srl	%i6,	0x18,	%l3
	movrgez	%g5,	%l4,	%l1
	edge16ln	%o6,	%g1,	%g4
	ldub	[%l7 + 0x35],	%l5
	andn	%i4,	%l2,	%i1
	stw	%o0,	[%l7 + 0x54]
	ldd	[%l7 + 0x60],	%f14
	fmovdvc	%xcc,	%f25,	%f8
	fmovrsne	%o2,	%f22,	%f16
	fcmped	%fcc2,	%f6,	%f6
	nop
	set	0x0A, %g2
	ldsb	[%l7 + %g2],	%o4
	st	%f4,	[%l7 + 0x30]
	fnegd	%f4,	%f2
	subccc	%g3,	%l6,	%i3
	movrgez	%i7,	%g2,	%g7
	mova	%icc,	%o7,	%i0
	movvs	%xcc,	%l0,	%o1
	fmovde	%icc,	%f19,	%f0
	edge16	%i2,	%g6,	%i5
	std	%f12,	[%l7 + 0x28]
	fcmpgt32	%f18,	%f26,	%o5
	movrlz	%o3,	0x360,	%l3
	orn	%g5,	0x1C84,	%i6
	sth	%l4,	[%l7 + 0x16]
	ldx	[%l7 + 0x28],	%l1
	udiv	%o6,	0x1615,	%g1
	edge8l	%l5,	%i4,	%l2
	ldsh	[%l7 + 0x5E],	%i1
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%o0
	edge32ln	%o2,	%o4,	%g3
	alignaddrl	%g4,	%i3,	%l6
	subccc	%i7,	%g7,	%o7
	edge32	%g2,	%i0,	%l0
	alignaddr	%i2,	%g6,	%i5
	sdivcc	%o1,	0x08EB,	%o5
	std	%f30,	[%l7 + 0x30]
	std	%f14,	[%l7 + 0x38]
	fmovdle	%icc,	%f4,	%f3
	edge8l	%l3,	%g5,	%i6
	movvc	%xcc,	%l4,	%l1
	edge32ln	%o6,	%o3,	%l5
	fcmped	%fcc2,	%f4,	%f6
	sra	%g1,	%l2,	%i4
	edge32l	%i1,	%o2,	%o4
	subccc	%o0,	%g3,	%i3
	subc	%l6,	%i7,	%g4
	ldub	[%l7 + 0x21],	%o7
	sll	%g7,	0x04,	%i0
	fmovsl	%xcc,	%f12,	%f18
	srl	%g2,	%i2,	%l0
	fmovrdgz	%g6,	%f26,	%f24
	movrgez	%o1,	0x269,	%i5
	sdivx	%o5,	0x1830,	%g5
	fnot2	%f24,	%f20
	lduw	[%l7 + 0x48],	%l3
	orcc	%l4,	0x0D4F,	%i6
	andcc	%o6,	%o3,	%l5
	mova	%xcc,	%g1,	%l2
	st	%f1,	[%l7 + 0x08]
	udiv	%i4,	0x0F47,	%l1
	sdiv	%o2,	0x1559,	%i1
	umul	%o4,	0x0911,	%o0
	move	%xcc,	%i3,	%g3
	edge32ln	%l6,	%i7,	%g4
	umul	%g7,	%o7,	%g2
	fmovrdgz	%i2,	%f4,	%f30
	mulx	%l0,	%i0,	%g6
	addccc	%o1,	0x1A8E,	%i5
	ldd	[%l7 + 0x50],	%g4
	movrlz	%o5,	%l3,	%i6
	fcmpd	%fcc1,	%f28,	%f18
	sdiv	%o6,	0x1FB2,	%l4
	alignaddrl	%o3,	%g1,	%l5
	umulcc	%l2,	0x0E0D,	%i4
	movrne	%l1,	0x2D2,	%o2
	mova	%xcc,	%o4,	%i1
	ldsh	[%l7 + 0x38],	%i3
	edge16ln	%g3,	%l6,	%i7
	fmovsl	%icc,	%f31,	%f3
	array16	%g4,	%g7,	%o7
	fnegd	%f0,	%f24
	array16	%o0,	%g2,	%i2
	fpadd32	%f10,	%f18,	%f14
	fmovs	%f30,	%f30
	edge32ln	%i0,	%g6,	%l0
	andcc	%i5,	%g5,	%o5
	movne	%xcc,	%l3,	%o1
	srax	%i6,	%l4,	%o3
	smulcc	%o6,	0x0128,	%l5
	andcc	%g1,	%l2,	%i4
	fand	%f10,	%f2,	%f24
	fsrc2	%f12,	%f14
	st	%f5,	[%l7 + 0x58]
	movneg	%xcc,	%l1,	%o2
	array8	%o4,	%i3,	%i1
	edge16n	%g3,	%l6,	%g4
	fones	%f1
	mulx	%g7,	%i7,	%o7
	movre	%g2,	%o0,	%i2
	srax	%g6,	0x1B,	%i0
	st	%f27,	[%l7 + 0x24]
	edge32n	%l0,	%i5,	%o5
	sdiv	%g5,	0x0283,	%l3
	movrgez	%o1,	%l4,	%i6
	srlx	%o3,	0x14,	%o6
	addcc	%g1,	%l2,	%l5
	udivcc	%i4,	0x19F7,	%l1
	and	%o2,	%o4,	%i3
	edge8n	%i1,	%g3,	%g4
	movne	%xcc,	%g7,	%l6
	edge8l	%i7,	%g2,	%o0
	edge16n	%o7,	%i2,	%g6
	orcc	%l0,	%i5,	%i0
	fpsub16s	%f20,	%f10,	%f30
	addccc	%g5,	0x19D9,	%o5
	sra	%o1,	0x1D,	%l3
	fmovrde	%i6,	%f2,	%f6
	fand	%f14,	%f22,	%f10
	edge16l	%l4,	%o6,	%o3
	sllx	%g1,	%l5,	%l2
	mulx	%i4,	0x1D7E,	%o2
	umulcc	%l1,	%o4,	%i3
	edge32	%g3,	%g4,	%i1
	edge16l	%g7,	%i7,	%l6
	array8	%o0,	%g2,	%i2
	movcc	%xcc,	%g6,	%o7
	edge16	%l0,	%i5,	%g5
	siam	0x5
	subccc	%i0,	0x1DAF,	%o1
	fmovsvs	%xcc,	%f2,	%f8
	orn	%l3,	0x0BFC,	%o5
	fsrc2	%f10,	%f18
	fcmpeq32	%f24,	%f24,	%i6
	fsrc1	%f16,	%f8
	stx	%o6,	[%l7 + 0x30]
	or	%l4,	%g1,	%l5
	movcc	%xcc,	%l2,	%o3
	movl	%icc,	%i4,	%l1
	fpadd32	%f30,	%f16,	%f2
	ldx	[%l7 + 0x60],	%o4
	orncc	%o2,	%g3,	%g4
	fcmple16	%f2,	%f12,	%i1
	fcmpeq16	%f16,	%f18,	%g7
	srax	%i7,	%l6,	%i3
	ldsw	[%l7 + 0x10],	%g2
	popc	%o0,	%g6
	umul	%o7,	%l0,	%i2
	umulcc	%i5,	0x0049,	%g5
	edge8	%o1,	%i0,	%o5
	movrgz	%l3,	0x27A,	%i6
	addc	%l4,	%g1,	%l5
	fmul8x16au	%f2,	%f20,	%f0
	srlx	%l2,	%o3,	%o6
	fmovsa	%xcc,	%f15,	%f31
	sub	%i4,	%l1,	%o4
	sub	%o2,	%g3,	%i1
	edge8l	%g4,	%g7,	%i7
	edge8ln	%l6,	%i3,	%o0
	save %g6, %g2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%i2
	stx	%l0,	[%l7 + 0x38]
	save %g5, %o1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i5,	0x1388,	%l3
	mulx	%i6,	0x1F0B,	%o5
	sdivx	%g1,	0x0ED5,	%l4
	umul	%l2,	%l5,	%o6
	srlx	%i4,	%o3,	%l1
	fmovrsgez	%o4,	%f17,	%f29
	movvc	%xcc,	%o2,	%g3
	movle	%xcc,	%i1,	%g7
	srl	%i7,	%g4,	%l6
	ldd	[%l7 + 0x08],	%f26
	fmovsn	%icc,	%f10,	%f29
	addccc	%i3,	%o0,	%g6
	fxor	%f10,	%f8,	%f14
	or	%o7,	0x0EC5,	%g2
	stb	%i2,	[%l7 + 0x51]
	edge32l	%g5,	%o1,	%i0
	sllx	%l0,	%i5,	%i6
	andcc	%l3,	%g1,	%l4
	udivx	%o5,	0x0802,	%l2
	sdivx	%o6,	0x0D16,	%l5
	orn	%o3,	0x021C,	%l1
	lduh	[%l7 + 0x44],	%o4
	bshuffle	%f0,	%f24,	%f8
	pdist	%f22,	%f18,	%f0
	stw	%i4,	[%l7 + 0x78]
	ldx	[%l7 + 0x48],	%g3
	mulx	%o2,	%g7,	%i7
	andncc	%i1,	%g4,	%l6
	andncc	%i3,	%g6,	%o7
	xnorcc	%g2,	0x04E9,	%o0
	ldub	[%l7 + 0x55],	%g5
	sll	%o1,	0x17,	%i0
	edge32l	%l0,	%i5,	%i2
	stx	%i6,	[%l7 + 0x28]
	movleu	%icc,	%g1,	%l4
	add	%o5,	0x14FF,	%l3
	edge32ln	%l2,	%l5,	%o6
	edge8l	%l1,	%o4,	%o3
	fmovdcc	%icc,	%f6,	%f13
	lduw	[%l7 + 0x34],	%g3
	edge32n	%o2,	%i4,	%g7
	nop
	set	0x68, %g6
	std	%f24,	[%l7 + %g6]
	fzero	%f30
	movrgz	%i7,	%i1,	%g4
	edge32	%i3,	%l6,	%o7
	smul	%g6,	%g2,	%o0
	array16	%g5,	%o1,	%i0
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%f24
	add	%i5,	%l0,	%i2
	fcmpeq16	%f24,	%f26,	%i6
	sdivx	%g1,	0x082D,	%l4
	fmovrse	%l3,	%f0,	%f31
	edge16	%o5,	%l5,	%l2
	fnegd	%f30,	%f24
	movge	%icc,	%o6,	%l1
	subccc	%o3,	0x0533,	%g3
	movpos	%xcc,	%o2,	%i4
	lduh	[%l7 + 0x12],	%o4
	xorcc	%i7,	%i1,	%g7
	ld	[%l7 + 0x2C],	%f4
	fmovdvc	%xcc,	%f13,	%f25
	fmovdneg	%xcc,	%f22,	%f10
	fmovsne	%xcc,	%f4,	%f5
	movcs	%icc,	%i3,	%g4
	popc	%o7,	%g6
	fcmpeq32	%f14,	%f26,	%l6
	or	%g2,	0x0208,	%g5
	movrlez	%o1,	0x2BF,	%i0
	edge16	%i5,	%l0,	%i2
	fmovrslez	%i6,	%f24,	%f0
	edge16	%g1,	%l4,	%o0
	subcc	%l3,	%l5,	%o5
	mova	%xcc,	%l2,	%l1
	movvs	%xcc,	%o3,	%o6
	fmovd	%f16,	%f28
	xor	%o2,	0x02F9,	%i4
	fmovde	%xcc,	%f24,	%f7
	fmovda	%xcc,	%f14,	%f7
	mulx	%g3,	%i7,	%o4
	or	%i1,	0x14F5,	%i3
	mova	%icc,	%g7,	%o7
	fmovdvc	%xcc,	%f18,	%f2
	ldub	[%l7 + 0x6F],	%g6
	fxors	%f9,	%f1,	%f17
	array16	%l6,	%g4,	%g2
	fmovdge	%xcc,	%f17,	%f23
	lduh	[%l7 + 0x6C],	%g5
	ldsb	[%l7 + 0x4D],	%o1
	fand	%f12,	%f2,	%f12
	srax	%i5,	0x04,	%i0
	stx	%i2,	[%l7 + 0x70]
	fmovdne	%icc,	%f0,	%f4
	stb	%i6,	[%l7 + 0x76]
	xnorcc	%g1,	0x17ED,	%l0
	orcc	%o0,	%l3,	%l4
	addccc	%o5,	0x15A3,	%l2
	fmul8x16au	%f25,	%f29,	%f26
	and	%l1,	0x18DE,	%l5
	andn	%o3,	%o6,	%o2
	popc	%g3,	%i4
	fmovdg	%icc,	%f25,	%f20
	ldd	[%l7 + 0x50],	%i6
	and	%o4,	0x06FC,	%i3
	lduh	[%l7 + 0x52],	%i1
	edge32n	%g7,	%g6,	%o7
	popc	%l6,	%g4
	edge16l	%g5,	%o1,	%i5
	ldd	[%l7 + 0x08],	%i0
	fmovsge	%icc,	%f2,	%f23
	st	%f22,	[%l7 + 0x40]
	add	%g2,	0x0DE0,	%i2
	stx	%i6,	[%l7 + 0x60]
	st	%f22,	[%l7 + 0x34]
	lduh	[%l7 + 0x1E],	%g1
	nop
	set	0x20, %o5
	ldsh	[%l7 + %o5],	%l0
	addcc	%l3,	0x027E,	%l4
	srax	%o0,	%l2,	%l1
	ldub	[%l7 + 0x20],	%l5
	movrlz	%o3,	0x3E3,	%o5
	or	%o6,	0x07AB,	%o2
	xnorcc	%g3,	0x050D,	%i4
	fpadd32	%f22,	%f2,	%f14
	movvc	%xcc,	%o4,	%i3
	movrne	%i1,	%g7,	%i7
	movl	%xcc,	%o7,	%l6
	sllx	%g4,	0x0C,	%g5
	sllx	%g6,	0x0B,	%o1
	movcc	%icc,	%i0,	%g2
	for	%f16,	%f4,	%f28
	sdivx	%i5,	0x0A16,	%i6
	orcc	%g1,	%i2,	%l0
	lduw	[%l7 + 0x10],	%l4
	alignaddr	%l3,	%o0,	%l1
	subccc	%l5,	0x1BE1,	%o3
	ld	[%l7 + 0x48],	%f8
	movvc	%xcc,	%o5,	%o6
	array16	%o2,	%l2,	%g3
	xnor	%i4,	%i3,	%i1
	andn	%o4,	0x102A,	%g7
	movleu	%icc,	%o7,	%l6
	ldub	[%l7 + 0x31],	%i7
	andn	%g5,	0x022D,	%g6
	xnor	%g4,	0x0FE4,	%i0
	srlx	%g2,	0x11,	%o1
	array32	%i5,	%i6,	%g1
	fmovdne	%icc,	%f24,	%f28
	sth	%l0,	[%l7 + 0x78]
	umulcc	%l4,	0x15EB,	%l3
	fxor	%f14,	%f10,	%f24
	edge8l	%i2,	%l1,	%o0
	sdiv	%o3,	0x098C,	%o5
	fmovdl	%xcc,	%f11,	%f14
	ldd	[%l7 + 0x10],	%f30
	andcc	%l5,	%o2,	%l2
	alignaddrl	%g3,	%o6,	%i3
	fmovsg	%xcc,	%f0,	%f9
	nop
	set	0x50, %l3
	ldx	[%l7 + %l3],	%i4
	mulscc	%i1,	0x0DFE,	%g7
	stb	%o7,	[%l7 + 0x54]
	fmovdn	%icc,	%f4,	%f17
	edge32l	%l6,	%i7,	%g5
	orcc	%g6,	0x0D53,	%o4
	ldd	[%l7 + 0x20],	%f4
	sdiv	%g4,	0x1E87,	%g2
	fandnot2s	%f5,	%f3,	%f11
	andncc	%i0,	%o1,	%i6
	fmovdneg	%icc,	%f25,	%f20
	fmovdgu	%icc,	%f17,	%f5
	addcc	%g1,	%l0,	%i5
	movcs	%icc,	%l3,	%l4
	ldd	[%l7 + 0x70],	%f2
	sdivcc	%i2,	0x1017,	%o0
	restore %o3, 0x04BD, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o5,	%o2,	%l5
	std	%f8,	[%l7 + 0x78]
	sub	%g3,	0x0D45,	%l2
	movrlez	%o6,	%i3,	%i4
	movne	%icc,	%i1,	%g7
	movcc	%xcc,	%o7,	%i7
	st	%f24,	[%l7 + 0x34]
	for	%f30,	%f10,	%f8
	fandnot1s	%f29,	%f9,	%f2
	movrne	%l6,	0x39B,	%g5
	movn	%xcc,	%g6,	%g4
	edge8n	%o4,	%i0,	%g2
	sub	%i6,	0x123B,	%o1
	orncc	%l0,	0x0028,	%i5
	fmovdgu	%xcc,	%f3,	%f29
	movcs	%icc,	%g1,	%l3
	movge	%icc,	%l4,	%o0
	lduh	[%l7 + 0x46],	%o3
	fexpand	%f13,	%f6
	orncc	%i2,	%l1,	%o5
	fmovsle	%icc,	%f16,	%f13
	addccc	%l5,	%o2,	%l2
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	restore %i4, %i1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g7,	%i7
	fmovsge	%icc,	%f21,	%f22
	movge	%icc,	%o7,	%l6
	addcc	%g5,	0x0A13,	%g4
	std	%f30,	[%l7 + 0x18]
	sub	%o4,	0x061E,	%i0
	stb	%g2,	[%l7 + 0x0B]
	edge32n	%i6,	%o1,	%l0
	xor	%g6,	%g1,	%l3
	smulcc	%i5,	0x1FDC,	%l4
	fands	%f21,	%f22,	%f4
	addcc	%o3,	%o0,	%i2
	fmul8x16al	%f4,	%f17,	%f24
	edge32n	%l1,	%l5,	%o5
	movge	%icc,	%l2,	%g3
	alignaddr	%o6,	%i4,	%o2
	fmovdvs	%xcc,	%f23,	%f28
	fmuld8sux16	%f6,	%f19,	%f16
	stw	%i3,	[%l7 + 0x2C]
	fmovdl	%icc,	%f22,	%f25
	movrne	%g7,	%i7,	%o7
	alignaddrl	%l6,	%g5,	%g4
	fmovdvc	%icc,	%f27,	%f2
	udiv	%i1,	0x0452,	%i0
	faligndata	%f10,	%f16,	%f8
	alignaddr	%o4,	%i6,	%g2
	movleu	%icc,	%l0,	%g6
	sethi	0x12E0,	%o1
	stx	%l3,	[%l7 + 0x40]
	edge8	%i5,	%l4,	%o3
	orcc	%o0,	0x0EEF,	%g1
	udiv	%i2,	0x1B88,	%l5
	movne	%icc,	%o5,	%l1
	popc	0x0ECF,	%g3
	fnors	%f19,	%f1,	%f30
	fors	%f17,	%f5,	%f20
	movl	%xcc,	%l2,	%o6
	sub	%i4,	0x11A8,	%i3
	ldd	[%l7 + 0x28],	%f16
	movn	%icc,	%o2,	%g7
	fmovsl	%icc,	%f30,	%f12
	popc	%o7,	%l6
	mulx	%i7,	0x068E,	%g5
	array32	%g4,	%i0,	%i1
	stw	%i6,	[%l7 + 0x4C]
	save %o4, 0x0E15, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x46],	%g6
	addccc	%g2,	0x17A4,	%o1
	or	%l3,	%i5,	%o3
	or	%o0,	0x189B,	%l4
	fmovdvc	%xcc,	%f1,	%f18
	srax	%g1,	%l5,	%o5
	xor	%l1,	0x0A4B,	%g3
	sra	%l2,	0x14,	%i2
	subcc	%i4,	%o6,	%i3
	andn	%o2,	0x0097,	%o7
	sra	%g7,	0x00,	%i7
	array16	%g5,	%g4,	%i0
	and	%l6,	%i1,	%o4
	fmul8sux16	%f28,	%f2,	%f2
	movgu	%xcc,	%l0,	%g6
	sth	%i6,	[%l7 + 0x4A]
	srl	%o1,	%l3,	%g2
	xnorcc	%o3,	%i5,	%o0
	sth	%l4,	[%l7 + 0x5E]
	edge32	%l5,	%g1,	%l1
	sub	%g3,	0x02E5,	%l2
	fmovda	%xcc,	%f25,	%f14
	ldsw	[%l7 + 0x74],	%o5
	nop
	set	0x60, %i7
	lduh	[%l7 + %i7],	%i4
	xor	%i2,	%i3,	%o2
	movrlz	%o7,	%o6,	%g7
	movleu	%icc,	%g5,	%i7
	movrlz	%i0,	0x155,	%l6
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%g4
	andn	%i1,	0x0B4F,	%l0
	fmovrsgz	%g6,	%f18,	%f23
	fmovsleu	%xcc,	%f7,	%f11
	movle	%xcc,	%o4,	%o1
	mova	%xcc,	%l3,	%i6
	sethi	0x1242,	%g2
	fcmpgt32	%f6,	%f16,	%o3
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	movn	%xcc,	%i5,	%l5
	stx	%g1,	[%l7 + 0x60]
	fpadd32	%f10,	%f4,	%f28
	fone	%f4
	umulcc	%g3,	0x039A,	%l2
	sllx	%l1,	%i4,	%i2
	nop
	set	0x45, %o4
	ldsb	[%l7 + %o4],	%i3
	ldsb	[%l7 + 0x4D],	%o2
	movrne	%o7,	%o5,	%o6
	movvs	%xcc,	%g5,	%g7
	move	%xcc,	%i0,	%l6
	lduh	[%l7 + 0x7A],	%g4
	movcc	%icc,	%i1,	%i7
	save %l0, %g6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o1,	%l3,	%i6
	andcc	%o3,	0x0F64,	%o0
	andcc	%l4,	%i5,	%g2
	lduw	[%l7 + 0x48],	%g1
	edge8n	%l5,	%g3,	%l1
	alignaddr	%i4,	%i2,	%i3
	add	%l2,	%o2,	%o7
	stw	%o6,	[%l7 + 0x50]
	edge8	%o5,	%g7,	%i0
	movleu	%xcc,	%l6,	%g5
	andncc	%i1,	%g4,	%l0
	restore %i7, %o4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g6,	0x1D98,	%l3
	ldsh	[%l7 + 0x52],	%o3
	fnot1s	%f30,	%f0
	movgu	%xcc,	%o0,	%l4
	sra	%i6,	%g2,	%i5
	srax	%g1,	%g3,	%l5
	addc	%i4,	%i2,	%i3
	movg	%icc,	%l2,	%l1
	movge	%icc,	%o7,	%o2
	edge32l	%o6,	%g7,	%o5
	fands	%f26,	%f16,	%f5
	edge32	%i0,	%g5,	%i1
	nop
	set	0x30, %l1
	ldx	[%l7 + %l1],	%g4
	umul	%l0,	0x087A,	%l6
	fpadd16	%f10,	%f20,	%f4
	edge16	%o4,	%o1,	%i7
	udivx	%g6,	0x11AA,	%l3
	movvs	%xcc,	%o0,	%o3
	fmul8x16	%f6,	%f12,	%f6
	movrlez	%i6,	%l4,	%i5
	addccc	%g1,	0x087D,	%g3
	movne	%icc,	%l5,	%i4
	addccc	%g2,	%i3,	%i2
	mulx	%l1,	0x055F,	%l2
	andcc	%o2,	%o6,	%o7
	subcc	%g7,	%o5,	%i0
	andn	%i1,	%g5,	%l0
	movge	%icc,	%l6,	%g4
	array16	%o4,	%o1,	%i7
	edge16l	%g6,	%o0,	%o3
	fmovsgu	%xcc,	%f25,	%f0
	fmul8x16	%f12,	%f10,	%f2
	ldsh	[%l7 + 0x30],	%l3
	stx	%l4,	[%l7 + 0x40]
	udiv	%i5,	0x1CED,	%i6
	sll	%g1,	%g3,	%i4
	fmovdvc	%xcc,	%f7,	%f25
	movvs	%xcc,	%l5,	%i3
	save %i2, 0x1A63, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l2, %l1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o7,	%g7,	%o2
	add	%o5,	%i0,	%g5
	sdiv	%i1,	0x1EF2,	%l0
	movvs	%xcc,	%g4,	%l6
	movleu	%icc,	%o1,	%i7
	fmul8ulx16	%f18,	%f20,	%f26
	fxor	%f14,	%f2,	%f16
	subc	%g6,	%o4,	%o3
	srl	%l3,	0x0C,	%l4
	edge8	%i5,	%o0,	%g1
	or	%i6,	%g3,	%l5
	subc	%i3,	0x1131,	%i4
	mulx	%i2,	0x19FA,	%g2
	andcc	%l2,	0x00FD,	%o6
	umul	%l1,	%o7,	%o2
	mulx	%g7,	0x1C0F,	%i0
	srax	%g5,	0x1B,	%o5
	fabsd	%f0,	%f26
	fmovrdlez	%i1,	%f16,	%f28
	edge16	%l0,	%l6,	%g4
	ld	[%l7 + 0x38],	%f25
	orncc	%o1,	%g6,	%i7
	srlx	%o4,	%o3,	%l3
	for	%f6,	%f28,	%f6
	sra	%l4,	%i5,	%g1
	sdivx	%o0,	0x1202,	%g3
	movcs	%icc,	%i6,	%i3
	and	%i4,	0x0C79,	%l5
	xorcc	%g2,	%l2,	%i2
	andn	%o6,	%l1,	%o2
	fpadd16	%f10,	%f20,	%f30
	nop
	set	0x34, %o7
	sth	%g7,	[%l7 + %o7]
	alignaddr	%i0,	%g5,	%o5
	addccc	%i1,	0x1760,	%l0
	sub	%l6,	0x1D7E,	%o7
	fsrc2s	%f15,	%f24
	movgu	%icc,	%o1,	%g4
	fnot2s	%f24,	%f5
	andcc	%g6,	%o4,	%o3
	smulcc	%i7,	%l4,	%l3
	array16	%g1,	%o0,	%i5
	udivcc	%g3,	0x039A,	%i6
	lduh	[%l7 + 0x1A],	%i3
	edge32ln	%i4,	%g2,	%l5
	xnorcc	%i2,	%o6,	%l1
	edge32n	%l2,	%o2,	%g7
	edge8	%g5,	%i0,	%i1
	edge32	%l0,	%o5,	%o7
	movg	%icc,	%l6,	%o1
	sra	%g6,	%o4,	%o3
	movgu	%xcc,	%g4,	%l4
	fmovrse	%l3,	%f3,	%f3
	movgu	%icc,	%i7,	%g1
	fcmpes	%fcc3,	%f20,	%f23
	edge8l	%i5,	%g3,	%o0
	mulx	%i6,	%i4,	%g2
	fmul8x16au	%f31,	%f10,	%f20
	fnor	%f14,	%f4,	%f12
	udiv	%i3,	0x0579,	%i2
	movn	%xcc,	%l5,	%o6
	edge16l	%l2,	%o2,	%l1
	movrlez	%g5,	%g7,	%i0
	mova	%icc,	%l0,	%o5
	srlx	%o7,	%l6,	%o1
	stb	%i1,	[%l7 + 0x7B]
	fmovrdne	%o4,	%f14,	%f18
	sdivcc	%g6,	0x11B1,	%g4
	edge16n	%o3,	%l4,	%i7
	fmovdvc	%xcc,	%f23,	%f31
	sll	%l3,	%g1,	%i5
	move	%icc,	%g3,	%o0
	fmovrsgz	%i6,	%f21,	%f13
	smul	%g2,	%i4,	%i3
	fcmps	%fcc1,	%f20,	%f16
	fmovrdlez	%i2,	%f22,	%f8
	orncc	%o6,	0x1162,	%l2
	fmovdgu	%icc,	%f16,	%f17
	ldx	[%l7 + 0x38],	%l5
	movleu	%icc,	%l1,	%g5
	fcmpgt16	%f12,	%f4,	%g7
	edge16n	%i0,	%l0,	%o2
	sethi	0x17E8,	%o7
	fcmps	%fcc2,	%f19,	%f17
	alignaddr	%l6,	%o1,	%o5
	edge8ln	%o4,	%i1,	%g4
	sll	%g6,	0x1B,	%o3
	subc	%i7,	%l4,	%g1
	fmovrdne	%i5,	%f28,	%f14
	movgu	%xcc,	%g3,	%l3
	fmovscs	%icc,	%f30,	%f25
	movcs	%icc,	%i6,	%g2
	movcc	%icc,	%i4,	%o0
	stb	%i3,	[%l7 + 0x0F]
	movl	%icc,	%i2,	%l2
	edge16	%l5,	%o6,	%g5
	edge8n	%g7,	%i0,	%l0
	fmovsa	%icc,	%f4,	%f4
	move	%xcc,	%o2,	%l1
	fmovdge	%icc,	%f14,	%f1
	xnor	%l6,	0x1FC1,	%o7
	fors	%f13,	%f7,	%f25
	movge	%icc,	%o1,	%o4
	movle	%icc,	%o5,	%i1
	xor	%g4,	%o3,	%i7
	movn	%xcc,	%g6,	%l4
	move	%icc,	%i5,	%g1
	stx	%g3,	[%l7 + 0x58]
	andcc	%i6,	%g2,	%i4
	fmovda	%xcc,	%f22,	%f8
	sdiv	%l3,	0x1E4D,	%o0
	fmovs	%f0,	%f7
	movrlez	%i3,	%l2,	%l5
	xor	%o6,	%i2,	%g7
	udivx	%i0,	0x1B1C,	%g5
	movre	%o2,	0x212,	%l0
	ld	[%l7 + 0x48],	%f18
	edge32l	%l6,	%o7,	%o1
	movrlez	%o4,	%o5,	%l1
	fmovdvs	%icc,	%f18,	%f10
	add	%i1,	0x14A0,	%o3
	edge16l	%g4,	%g6,	%i7
	fcmpd	%fcc3,	%f10,	%f14
	andncc	%i5,	%l4,	%g3
	udivcc	%g1,	0x1D67,	%i6
	ldx	[%l7 + 0x30],	%i4
	edge32n	%g2,	%l3,	%o0
	lduw	[%l7 + 0x28],	%i3
	movrlz	%l5,	%o6,	%i2
	movl	%xcc,	%l2,	%g7
	fpmerge	%f8,	%f9,	%f30
	movn	%xcc,	%i0,	%o2
	or	%l0,	0x124D,	%g5
	fmul8x16au	%f14,	%f18,	%f14
	fmovdcs	%icc,	%f7,	%f8
	ldd	[%l7 + 0x38],	%i6
	fxnors	%f3,	%f7,	%f4
	movneg	%icc,	%o7,	%o4
	popc	%o5,	%o1
	udiv	%i1,	0x0AEC,	%l1
	sdivx	%g4,	0x0B49,	%g6
	stw	%i7,	[%l7 + 0x78]
	movgu	%icc,	%o3,	%i5
	fmovrsgez	%l4,	%f16,	%f4
	xor	%g1,	0x18B1,	%g3
	stw	%i6,	[%l7 + 0x70]
	andncc	%g2,	%l3,	%o0
	fpadd32	%f20,	%f16,	%f26
	edge32l	%i3,	%i4,	%o6
	movneg	%icc,	%i2,	%l5
	subc	%g7,	%l2,	%o2
	movrlez	%i0,	%g5,	%l0
	edge32l	%l6,	%o7,	%o5
	fmovdvc	%xcc,	%f22,	%f3
	addccc	%o1,	0x0882,	%o4
	lduh	[%l7 + 0x14],	%i1
	fnors	%f2,	%f28,	%f31
	move	%xcc,	%g4,	%g6
	fxnor	%f6,	%f20,	%f16
	fnot1s	%f22,	%f31
	movleu	%icc,	%l1,	%o3
	movrne	%i5,	%l4,	%g1
	array32	%i7,	%i6,	%g2
	edge32l	%l3,	%g3,	%i3
	stw	%i4,	[%l7 + 0x3C]
	edge8ln	%o0,	%o6,	%i2
	ldub	[%l7 + 0x66],	%l5
	movne	%icc,	%l2,	%g7
	nop
	set	0x60, %i2
	std	%f8,	[%l7 + %i2]
	orcc	%o2,	%i0,	%l0
	fxors	%f11,	%f31,	%f0
	or	%g5,	0x08ED,	%l6
	orn	%o7,	0x1BBD,	%o5
	movge	%xcc,	%o4,	%o1
	orn	%i1,	0x0BC3,	%g4
	umulcc	%l1,	%o3,	%g6
	movcc	%xcc,	%l4,	%g1
	movgu	%icc,	%i5,	%i6
	edge8ln	%g2,	%i7,	%g3
	array32	%l3,	%i3,	%i4
	udivx	%o0,	0x1A9D,	%o6
	edge16ln	%i2,	%l2,	%l5
	mulscc	%o2,	%i0,	%l0
	movn	%xcc,	%g5,	%l6
	movrlez	%g7,	0x1CD,	%o7
	stb	%o5,	[%l7 + 0x46]
	andn	%o1,	0x0C45,	%o4
	srax	%i1,	%g4,	%l1
	movrgez	%g6,	%l4,	%g1
	srlx	%i5,	0x1D,	%o3
	array32	%i6,	%g2,	%i7
	addcc	%g3,	%l3,	%i3
	edge32n	%o0,	%i4,	%o6
	srlx	%i2,	0x18,	%l2
	xnor	%l5,	%i0,	%l0
	movvc	%xcc,	%o2,	%l6
	xorcc	%g5,	%g7,	%o5
	st	%f15,	[%l7 + 0x2C]
	fcmple32	%f12,	%f8,	%o1
	addc	%o7,	0x19AC,	%i1
	ldx	[%l7 + 0x58],	%o4
	fmovdcs	%xcc,	%f19,	%f22
	popc	%l1,	%g4
	movcc	%xcc,	%g6,	%g1
	fmuld8ulx16	%f20,	%f19,	%f16
	andcc	%l4,	0x1793,	%i5
	movpos	%icc,	%o3,	%i6
	alignaddr	%i7,	%g3,	%g2
	fpadd32	%f18,	%f18,	%f0
	ldsb	[%l7 + 0x56],	%i3
	lduw	[%l7 + 0x74],	%o0
	andcc	%i4,	%o6,	%i2
	subcc	%l3,	%l5,	%l2
	movpos	%xcc,	%l0,	%o2
	ldd	[%l7 + 0x60],	%f22
	lduh	[%l7 + 0x10],	%i0
	fpack32	%f28,	%f10,	%f4
	umulcc	%l6,	0x189C,	%g7
	fmuld8sux16	%f8,	%f10,	%f30
	lduw	[%l7 + 0x34],	%o5
	fcmple32	%f24,	%f2,	%g5
	srax	%o1,	%i1,	%o7
	movleu	%xcc,	%l1,	%g4
	sth	%g6,	[%l7 + 0x54]
	movcs	%icc,	%o4,	%l4
	ldsh	[%l7 + 0x48],	%i5
	array32	%g1,	%i6,	%i7
	ldx	[%l7 + 0x50],	%o3
	ld	[%l7 + 0x34],	%f12
	movrne	%g3,	0x377,	%g2
	fmovrde	%o0,	%f18,	%f8
	fmovsvs	%icc,	%f3,	%f9
	andcc	%i3,	0x031B,	%i4
	save %i2, 0x0568, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o6,	%l2,	%l5
	edge8n	%o2,	%i0,	%l0
	fmovdvs	%icc,	%f17,	%f29
	array8	%l6,	%g7,	%g5
	nop
	set	0x68, %o0
	std	%f6,	[%l7 + %o0]
	movne	%icc,	%o1,	%o5
	orcc	%o7,	0x05D2,	%i1
	sra	%g4,	0x0B,	%l1
	lduw	[%l7 + 0x34],	%o4
	srlx	%g6,	0x19,	%l4
	movre	%g1,	%i5,	%i7
	fcmpeq16	%f30,	%f4,	%o3
	xorcc	%i6,	0x1C75,	%g2
	movre	%o0,	0x287,	%i3
	fmovrdne	%g3,	%f18,	%f14
	movgu	%icc,	%i2,	%l3
	fmovrslz	%o6,	%f8,	%f14
	array16	%l2,	%l5,	%i4
	edge32l	%i0,	%l0,	%o2
	fmovrdlez	%l6,	%f6,	%f28
	movrne	%g7,	%g5,	%o5
	udivcc	%o7,	0x08DC,	%o1
	movcc	%icc,	%i1,	%l1
	movn	%icc,	%o4,	%g4
	sll	%l4,	0x1A,	%g1
	fmovsneg	%icc,	%f21,	%f11
	xnor	%i5,	%g6,	%i7
	sdivcc	%i6,	0x1964,	%o3
	bshuffle	%f14,	%f22,	%f2
	smulcc	%g2,	0x011E,	%i3
	edge8	%o0,	%i2,	%l3
	xnorcc	%g3,	%l2,	%l5
	movvs	%icc,	%o6,	%i4
	edge8ln	%i0,	%o2,	%l0
	edge32n	%l6,	%g5,	%g7
	bshuffle	%f18,	%f16,	%f28
	udivcc	%o5,	0x0875,	%o1
	array16	%o7,	%l1,	%i1
	xor	%o4,	%l4,	%g4
	fpackfix	%f18,	%f31
	xorcc	%i5,	%g1,	%i7
	orcc	%i6,	0x0653,	%o3
	movg	%icc,	%g6,	%i3
	subcc	%g2,	0x158C,	%i2
	srlx	%o0,	%l3,	%l2
	movpos	%icc,	%l5,	%g3
	ldsh	[%l7 + 0x62],	%o6
	sdivx	%i4,	0x1F25,	%o2
	sllx	%i0,	0x1A,	%l6
	fnand	%f30,	%f26,	%f0
	bshuffle	%f18,	%f18,	%f14
	fands	%f24,	%f22,	%f17
	sub	%g5,	0x1F93,	%g7
	fzero	%f24
	edge8	%o5,	%l0,	%o7
	sdivx	%o1,	0x073F,	%i1
	orncc	%l1,	%l4,	%o4
	umulcc	%g4,	%g1,	%i7
	edge16n	%i6,	%i5,	%o3
	fmovrdne	%i3,	%f24,	%f28
	orncc	%g6,	0x049A,	%i2
	edge16ln	%o0,	%l3,	%g2
	or	%l2,	%l5,	%g3
	umul	%i4,	%o6,	%i0
	st	%f19,	[%l7 + 0x50]
	movcs	%icc,	%o2,	%l6
	fcmple32	%f20,	%f22,	%g5
	fsrc2	%f24,	%f8
	edge32ln	%o5,	%g7,	%o7
	udivx	%o1,	0x15D7,	%l0
	sll	%i1,	%l1,	%l4
	edge16ln	%o4,	%g1,	%i7
	andncc	%g4,	%i5,	%o3
	array8	%i6,	%i3,	%g6
	or	%i2,	%l3,	%o0
	movcc	%icc,	%g2,	%l5
	st	%f12,	[%l7 + 0x78]
	fors	%f10,	%f6,	%f0
	edge16	%l2,	%i4,	%o6
	xnorcc	%g3,	0x010F,	%i0
	ldsh	[%l7 + 0x32],	%l6
	popc	%g5,	%o5
	movneg	%icc,	%g7,	%o2
	movpos	%xcc,	%o1,	%l0
	movcc	%icc,	%o7,	%i1
	array32	%l1,	%l4,	%o4
	movvs	%xcc,	%i7,	%g1
	faligndata	%f18,	%f30,	%f18
	nop
	set	0x54, %o6
	sth	%g4,	[%l7 + %o6]
	nop
	set	0x50, %l5
	ldx	[%l7 + %l5],	%i5
	fmovscc	%xcc,	%f2,	%f4
	fpmerge	%f0,	%f4,	%f14
	ldsw	[%l7 + 0x40],	%o3
	ld	[%l7 + 0x7C],	%f2
	fmul8ulx16	%f16,	%f28,	%f24
	stx	%i3,	[%l7 + 0x38]
	ldsh	[%l7 + 0x20],	%g6
	mulscc	%i2,	%l3,	%i6
	fmovrdne	%g2,	%f18,	%f30
	movl	%icc,	%l5,	%o0
	ldsh	[%l7 + 0x2E],	%i4
	save %l2, 0x1823, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g3,	%i0
	edge8n	%g5,	%l6,	%g7
	ld	[%l7 + 0x4C],	%f7
	stw	%o5,	[%l7 + 0x40]
	fmovdl	%xcc,	%f5,	%f23
	sth	%o1,	[%l7 + 0x70]
	addccc	%l0,	%o2,	%i1
	smul	%o7,	0x19CD,	%l1
	fpmerge	%f9,	%f5,	%f4
	orncc	%l4,	0x133B,	%i7
	udivcc	%g1,	0x09BC,	%o4
	stb	%g4,	[%l7 + 0x7F]
	smulcc	%o3,	0x06C0,	%i5
	ldub	[%l7 + 0x3C],	%i3
	array8	%g6,	%l3,	%i2
	edge32	%i6,	%g2,	%l5
	subcc	%i4,	0x1EF3,	%l2
	popc	%o0,	%g3
	addccc	%o6,	0x0F92,	%g5
	srlx	%l6,	%i0,	%g7
	andncc	%o1,	%l0,	%o5
	subccc	%o2,	%i1,	%l1
	fmovdgu	%icc,	%f15,	%f18
	fmul8x16	%f27,	%f22,	%f20
	fmul8x16al	%f1,	%f0,	%f26
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	fmovsvs	%icc,	%f6,	%f11
	fmul8x16	%f15,	%f2,	%f8
	fmovdgu	%xcc,	%f30,	%f23
	fmovsl	%xcc,	%f26,	%f7
	edge16	%g1,	%o4,	%l4
	move	%icc,	%g4,	%i5
	movl	%xcc,	%i3,	%g6
	fmuld8sux16	%f7,	%f5,	%f26
	fandnot2	%f8,	%f14,	%f2
	sdivx	%l3,	0x073D,	%o3
	fmovrdgez	%i2,	%f20,	%f4
	mova	%xcc,	%g2,	%l5
	ldsb	[%l7 + 0x21],	%i6
	sdivx	%l2,	0x0639,	%i4
	movg	%icc,	%o0,	%g3
	save %o6, %g5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%g7,	%o1
	std	%f18,	[%l7 + 0x60]
	ldub	[%l7 + 0x17],	%l0
	movcc	%icc,	%o5,	%l6
	andn	%o2,	0x0D4F,	%l1
	orcc	%o7,	0x0857,	%i1
	array8	%i7,	%g1,	%l4
	fmovdneg	%icc,	%f25,	%f27
	fcmple32	%f16,	%f20,	%o4
	movneg	%icc,	%g4,	%i3
	movcs	%icc,	%g6,	%i5
	movcc	%icc,	%l3,	%o3
	faligndata	%f10,	%f2,	%f18
	umul	%g2,	0x1AAF,	%l5
	fnegs	%f14,	%f31
	movgu	%xcc,	%i6,	%i2
	umul	%l2,	0x18AC,	%i4
	fmovrse	%o0,	%f21,	%f1
	fmovscc	%xcc,	%f9,	%f24
	stb	%o6,	[%l7 + 0x61]
	fzero	%f4
	xnorcc	%g5,	%i0,	%g7
	fcmple32	%f28,	%f24,	%o1
	alignaddr	%l0,	%o5,	%l6
	edge32l	%o2,	%l1,	%g3
	siam	0x1
	ldsb	[%l7 + 0x21],	%o7
	lduh	[%l7 + 0x3E],	%i7
	edge16ln	%i1,	%l4,	%o4
	ldub	[%l7 + 0x15],	%g1
	fmovrdgez	%g4,	%f4,	%f14
	edge32ln	%g6,	%i5,	%i3
	andn	%o3,	0x1233,	%l3
	movn	%icc,	%g2,	%i6
	fmovrdne	%i2,	%f6,	%f6
	or	%l5,	%l2,	%o0
	umul	%i4,	%g5,	%i0
	fmovsle	%xcc,	%f11,	%f30
	umul	%o6,	0x1BA4,	%o1
	fabss	%f1,	%f0
	smul	%g7,	%o5,	%l0
	xor	%l6,	%o2,	%g3
	fmovscc	%icc,	%f16,	%f16
	stw	%o7,	[%l7 + 0x5C]
	movrlz	%i7,	%i1,	%l1
	movpos	%icc,	%o4,	%g1
	st	%f8,	[%l7 + 0x24]
	fnegs	%f1,	%f22
	umul	%l4,	0x1319,	%g4
	mulscc	%g6,	0x00FF,	%i5
	ldd	[%l7 + 0x60],	%i2
	fpack16	%f28,	%f16
	std	%f8,	[%l7 + 0x60]
	movg	%xcc,	%l3,	%o3
	save %g2, 0x0906, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x13A2
	movrgez	%l5,	%l2,	%i6
	restore %o0, 0x112D, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i0,	%o6,	%i4
	alignaddrl	%g7,	%o1,	%l0
	save %l6, %o2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f29,	%f14
	lduh	[%l7 + 0x76],	%o7
	andcc	%i7,	%o5,	%l1
	andncc	%o4,	%i1,	%g1
	fpadd32s	%f16,	%f18,	%f28
	subc	%g4,	%l4,	%i5
	fnot1s	%f20,	%f18
	movre	%i3,	0x323,	%g6
	lduw	[%l7 + 0x0C],	%o3
	edge8l	%l3,	%i2,	%g2
	addc	%l5,	0x0A42,	%i6
	movrne	%l2,	0x1E1,	%o0
	stw	%i0,	[%l7 + 0x14]
	xnor	%o6,	0x1738,	%g5
	movcc	%icc,	%g7,	%i4
	fmovdcc	%xcc,	%f14,	%f26
	movneg	%xcc,	%o1,	%l6
	movvc	%xcc,	%l0,	%g3
	array8	%o2,	%o7,	%i7
	ldub	[%l7 + 0x40],	%l1
	move	%xcc,	%o4,	%i1
	movcs	%icc,	%o5,	%g4
	fmovrsgz	%l4,	%f20,	%f6
	addcc	%i5,	0x033C,	%g1
	movrgz	%g6,	%o3,	%l3
	fnegd	%f6,	%f16
	fmovsneg	%xcc,	%f7,	%f1
	movle	%icc,	%i2,	%g2
	sub	%l5,	0x08B1,	%i3
	fmovdcc	%icc,	%f3,	%f6
	ldub	[%l7 + 0x4A],	%i6
	sllx	%l2,	%i0,	%o6
	subc	%g5,	%g7,	%o0
	lduw	[%l7 + 0x60],	%i4
	movvc	%icc,	%o1,	%l0
	movleu	%xcc,	%l6,	%g3
	fmovdcs	%icc,	%f3,	%f3
	fmovsleu	%xcc,	%f25,	%f22
	movleu	%xcc,	%o7,	%i7
	ldub	[%l7 + 0x55],	%l1
	sir	0x164A
	movcs	%xcc,	%o4,	%o2
	edge32l	%o5,	%i1,	%l4
	nop
	set	0x52, %i5
	sth	%g4,	[%l7 + %i5]
	xnorcc	%i5,	%g1,	%o3
	edge32n	%l3,	%i2,	%g6
	fmul8x16al	%f4,	%f7,	%f10
	sllx	%l5,	%g2,	%i6
	movcc	%xcc,	%l2,	%i0
	subc	%i3,	0x0C4D,	%o6
	orcc	%g5,	%g7,	%o0
	edge8ln	%i4,	%o1,	%l6
	movn	%icc,	%l0,	%g3
	movcc	%icc,	%i7,	%o7
	sub	%l1,	%o4,	%o2
	movpos	%icc,	%i1,	%o5
	udiv	%l4,	0x1FE7,	%i5
	array32	%g1,	%g4,	%l3
	sll	%i2,	%o3,	%g6
	fone	%f8
	movvc	%xcc,	%l5,	%i6
	mova	%xcc,	%g2,	%i0
	orn	%l2,	%i3,	%o6
	mulscc	%g5,	0x102C,	%o0
	edge16	%i4,	%g7,	%l6
	sethi	0x0594,	%l0
	ld	[%l7 + 0x20],	%f1
	sdivcc	%g3,	0x0379,	%i7
	movne	%xcc,	%o7,	%o1
	movcs	%xcc,	%l1,	%o2
	fmul8sux16	%f8,	%f4,	%f2
	movge	%icc,	%o4,	%o5
	sth	%l4,	[%l7 + 0x48]
	fmovsleu	%icc,	%f0,	%f2
	mulscc	%i1,	0x139D,	%i5
	edge16	%g1,	%l3,	%g4
	array8	%o3,	%i2,	%l5
	nop
	set	0x5C, %i3
	lduw	[%l7 + %i3],	%g6
	movcs	%xcc,	%g2,	%i0
	movgu	%icc,	%l2,	%i6
	fmovrdlez	%o6,	%f26,	%f2
	edge8l	%i3,	%g5,	%o0
	udivx	%g7,	0x1414,	%i4
	andncc	%l6,	%g3,	%i7
	add	%o7,	%o1,	%l0
	sllx	%l1,	0x1B,	%o2
	edge16l	%o4,	%o5,	%i1
	sll	%l4,	0x10,	%i5
	srlx	%g1,	%g4,	%o3
	fxnors	%f8,	%f5,	%f10
	edge8l	%i2,	%l3,	%g6
	srax	%l5,	0x0D,	%g2
	fmovdcs	%xcc,	%f24,	%f4
	fmovrse	%i0,	%f25,	%f20
	movneg	%icc,	%i6,	%o6
	fmovdpos	%icc,	%f20,	%f29
	movne	%icc,	%i3,	%l2
	fmovsneg	%icc,	%f7,	%f30
	alignaddrl	%g5,	%g7,	%i4
	umulcc	%o0,	0x1DBE,	%l6
	ldx	[%l7 + 0x08],	%i7
	fsrc2	%f22,	%f0
	addcc	%g3,	%o7,	%l0
	umul	%o1,	0x163D,	%l1
	subc	%o4,	0x11F5,	%o2
	edge16	%o5,	%l4,	%i1
	edge32	%g1,	%i5,	%o3
	ldsb	[%l7 + 0x2A],	%g4
	umul	%i2,	0x05C6,	%g6
	fmovsne	%icc,	%f28,	%f30
	edge32l	%l3,	%g2,	%l5
	movrlz	%i0,	0x270,	%i6
	movgu	%icc,	%o6,	%i3
	edge8l	%l2,	%g5,	%g7
	edge8ln	%o0,	%i4,	%i7
	lduw	[%l7 + 0x74],	%l6
	movl	%icc,	%g3,	%o7
	add	%l0,	%o1,	%o4
	fmovrsne	%o2,	%f21,	%f29
	ldd	[%l7 + 0x58],	%o4
	fmovdl	%icc,	%f21,	%f1
	ldub	[%l7 + 0x38],	%l1
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	st	%f25,	[%l7 + 0x2C]
	ldub	[%l7 + 0x47],	%g1
	edge32n	%o3,	%g4,	%i5
	ldsb	[%l7 + 0x2D],	%g6
	movg	%icc,	%l3,	%g2
	and	%l5,	%i0,	%i2
	subccc	%o6,	%i3,	%l2
	lduh	[%l7 + 0x3C],	%i6
	mulscc	%g7,	%o0,	%g5
	fands	%f15,	%f28,	%f29
	fmul8sux16	%f12,	%f22,	%f0
	edge8	%i7,	%i4,	%g3
	umulcc	%l6,	%o7,	%l0
	fcmpd	%fcc0,	%f22,	%f10
	movneg	%icc,	%o1,	%o2
	orcc	%o4,	0x0126,	%l1
	udivx	%o5,	0x17CC,	%l4
	ldsb	[%l7 + 0x5E],	%i1
	andcc	%o3,	0x1FA1,	%g1
	movleu	%xcc,	%i5,	%g4
	movle	%icc,	%l3,	%g6
	movcs	%xcc,	%g2,	%i0
	or	%l5,	%i2,	%o6
	fmovrslz	%l2,	%f8,	%f21
	orncc	%i6,	0x19DE,	%g7
	smulcc	%i3,	0x0F5B,	%g5
	st	%f1,	[%l7 + 0x24]
	udiv	%o0,	0x12B0,	%i4
	movn	%icc,	%g3,	%i7
	fnegd	%f2,	%f14
	udivx	%l6,	0x0E65,	%l0
	edge32n	%o1,	%o2,	%o4
	nop
	set	0x48, %l6
	ldx	[%l7 + %l6],	%o7
	fsrc1	%f12,	%f0
	stx	%o5,	[%l7 + 0x18]
	movleu	%icc,	%l4,	%i1
	fmovse	%icc,	%f31,	%f0
	subcc	%o3,	%l1,	%i5
	fmovde	%xcc,	%f2,	%f7
	add	%g4,	0x0956,	%g1
	movg	%xcc,	%l3,	%g6
	movrgez	%g2,	%i0,	%l5
	movne	%xcc,	%o6,	%i2
	sllx	%i6,	%g7,	%l2
	ldub	[%l7 + 0x3F],	%i3
	movcc	%xcc,	%g5,	%o0
	movvs	%icc,	%g3,	%i4
	srax	%i7,	%l0,	%o1
	ldd	[%l7 + 0x78],	%o2
	srl	%l6,	0x0A,	%o4
	movle	%icc,	%o5,	%o7
	fcmped	%fcc1,	%f28,	%f28
	xnor	%l4,	%o3,	%l1
	save %i5, 0x078E, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g1,	0x2CB,	%i1
	fmovscs	%icc,	%f2,	%f16
	edge32ln	%l3,	%g6,	%g2
	edge8ln	%i0,	%l5,	%o6
	fsrc2s	%f22,	%f24
	movrgez	%i2,	0x0C6,	%i6
	umulcc	%g7,	%i3,	%l2
	fmovsg	%icc,	%f3,	%f19
	fandnot2	%f22,	%f6,	%f4
	array8	%o0,	%g5,	%i4
	subccc	%g3,	%i7,	%l0
	move	%xcc,	%o1,	%l6
	xnorcc	%o4,	%o5,	%o2
	edge8ln	%l4,	%o3,	%o7
	ldd	[%l7 + 0x30],	%l0
	fpadd16	%f26,	%f26,	%f22
	movneg	%xcc,	%i5,	%g4
	xor	%g1,	%l3,	%i1
	mova	%icc,	%g2,	%g6
	addcc	%l5,	0x1401,	%o6
	fexpand	%f23,	%f28
	orn	%i2,	0x0FE8,	%i6
	fmul8x16al	%f22,	%f31,	%f30
	mulscc	%i0,	%g7,	%l2
	add	%i3,	%o0,	%i4
	movn	%icc,	%g3,	%g5
	movn	%icc,	%i7,	%o1
	movrgez	%l6,	0x338,	%l0
	fmovrdgez	%o5,	%f2,	%f22
	edge16ln	%o4,	%l4,	%o2
	movle	%xcc,	%o3,	%l1
	umul	%i5,	%g4,	%g1
	sllx	%l3,	%o7,	%g2
	edge8ln	%i1,	%l5,	%o6
	umul	%g6,	0x1C02,	%i2
	addccc	%i6,	%g7,	%i0
	ldub	[%l7 + 0x29],	%i3
	edge32	%o0,	%l2,	%g3
	fxnor	%f26,	%f30,	%f8
	movrlz	%g5,	%i4,	%i7
	mova	%xcc,	%o1,	%l6
	ldd	[%l7 + 0x20],	%l0
	orncc	%o4,	0x1BDF,	%o5
	addc	%o2,	0x1A1B,	%l4
	fmuld8sux16	%f21,	%f28,	%f4
	udiv	%o3,	0x0241,	%l1
	ldsh	[%l7 + 0x20],	%i5
	alignaddrl	%g1,	%g4,	%o7
	fandnot2	%f4,	%f26,	%f18
	xorcc	%g2,	0x0642,	%l3
	movrlz	%l5,	%i1,	%g6
	xnor	%i2,	%i6,	%o6
	restore %i0, 0x081D, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o0,	%l2,	%g7
	subccc	%g5,	0x0A59,	%i4
	sra	%i7,	0x0F,	%o1
	umulcc	%g3,	0x1D60,	%l6
	fmovdvs	%xcc,	%f0,	%f6
	ldsh	[%l7 + 0x74],	%o4
	fmovdneg	%xcc,	%f27,	%f7
	stb	%l0,	[%l7 + 0x1E]
	xor	%o2,	%l4,	%o3
	udivcc	%o5,	0x08F2,	%l1
	smulcc	%i5,	%g1,	%o7
	edge16n	%g4,	%g2,	%l5
	edge16n	%i1,	%l3,	%i2
	movrgz	%g6,	%o6,	%i6
	movg	%icc,	%i0,	%i3
	sll	%o0,	%l2,	%g7
	alignaddr	%i4,	%g5,	%o1
	stb	%i7,	[%l7 + 0x4C]
	array8	%g3,	%o4,	%l0
	movvs	%xcc,	%l6,	%o2
	xnor	%o3,	%l4,	%o5
	edge16n	%l1,	%i5,	%o7
	movcs	%xcc,	%g4,	%g2
	sub	%g1,	0x1769,	%l5
	srlx	%l3,	0x13,	%i1
	udiv	%g6,	0x0F52,	%i2
	ldd	[%l7 + 0x48],	%f2
	umulcc	%o6,	%i6,	%i3
	sra	%i0,	0x06,	%o0
	movrgz	%g7,	0x3E2,	%i4
	edge16	%g5,	%l2,	%o1
	fpmerge	%f12,	%f13,	%f26
	ldsh	[%l7 + 0x38],	%i7
	sir	0x1882
	stb	%o4,	[%l7 + 0x5F]
	orn	%g3,	0x18AC,	%l6
	fcmpd	%fcc1,	%f28,	%f16
	fmovdvc	%xcc,	%f4,	%f26
	lduw	[%l7 + 0x74],	%l0
	fxnor	%f16,	%f26,	%f28
	edge32n	%o2,	%o3,	%o5
	subc	%l4,	0x0983,	%l1
	array16	%o7,	%g4,	%i5
	fcmpeq16	%f4,	%f18,	%g2
	movre	%l5,	0x26E,	%l3
	movge	%xcc,	%i1,	%g6
	ld	[%l7 + 0x7C],	%f6
	edge16n	%g1,	%i2,	%o6
	movne	%xcc,	%i6,	%i0
	st	%f22,	[%l7 + 0x14]
	edge16l	%o0,	%g7,	%i3
	stx	%g5,	[%l7 + 0x60]
	movvc	%xcc,	%l2,	%i4
	xnorcc	%i7,	%o1,	%g3
	fmuld8ulx16	%f25,	%f13,	%f20
	sll	%o4,	%l0,	%l6
	subccc	%o2,	%o3,	%o5
	stx	%l1,	[%l7 + 0x58]
	movg	%xcc,	%l4,	%g4
	edge32n	%i5,	%g2,	%o7
	movle	%xcc,	%l3,	%i1
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	ldsw	[%l7 + 0x08],	%o6
	srlx	%i6,	%i2,	%i0
	sdivx	%o0,	0x1AA8,	%i3
	nop
	set	0x4B, %i6
	ldub	[%l7 + %i6],	%g7
	fmul8x16au	%f9,	%f2,	%f10
	sll	%g5,	%i4,	%l2
	edge32l	%i7,	%g3,	%o4
	udivcc	%l0,	0x07A0,	%o1
	restore %l6, %o3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%l1,	%f16,	%f8
	subcc	%o2,	%g4,	%l4
	ldd	[%l7 + 0x20],	%f8
	movg	%icc,	%i5,	%g2
	nop
	set	0x50, %g4
	stw	%l3,	[%l7 + %g4]
	save %o7, 0x19DB, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%g1,	%f24,	%f30
	sdivx	%g6,	0x1C03,	%l5
	movn	%icc,	%i6,	%i2
	alignaddr	%i0,	%o6,	%i3
	movrgz	%g7,	0x024,	%g5
	andcc	%i4,	0x18D2,	%l2
	xorcc	%o0,	%i7,	%g3
	sra	%o4,	0x1A,	%o1
	lduw	[%l7 + 0x74],	%l0
	fands	%f2,	%f26,	%f11
	movn	%icc,	%o3,	%o5
	stx	%l1,	[%l7 + 0x50]
	movneg	%xcc,	%o2,	%g4
	movle	%xcc,	%l4,	%l6
	fmovdvs	%xcc,	%f8,	%f8
	andncc	%i5,	%l3,	%g2
	fmovdleu	%xcc,	%f7,	%f16
	sra	%i1,	0x1F,	%g1
	ld	[%l7 + 0x54],	%f3
	fmovrsne	%o7,	%f28,	%f25
	fpsub32s	%f14,	%f13,	%f19
	sdivx	%l5,	0x15BA,	%g6
	subcc	%i6,	%i0,	%i2
	lduw	[%l7 + 0x5C],	%i3
	array16	%g7,	%g5,	%o6
	stw	%i4,	[%l7 + 0x08]
	movge	%icc,	%l2,	%o0
	fmovsvc	%xcc,	%f21,	%f21
	and	%g3,	0x1306,	%o4
	popc	%o1,	%l0
	ldsh	[%l7 + 0x3E],	%o3
	mulscc	%o5,	%l1,	%o2
	movge	%icc,	%i7,	%l4
	edge16	%g4,	%l6,	%l3
	movrlez	%g2,	%i5,	%g1
	fabss	%f1,	%f17
	array8	%i1,	%o7,	%l5
	ldd	[%l7 + 0x38],	%g6
	movcs	%xcc,	%i6,	%i0
	movge	%icc,	%i3,	%i2
	move	%xcc,	%g5,	%g7
	orcc	%i4,	%o6,	%l2
	sub	%g3,	%o0,	%o1
	sdiv	%l0,	0x1A3A,	%o3
	fornot2s	%f23,	%f27,	%f15
	fmovsleu	%xcc,	%f10,	%f23
	sdivcc	%o4,	0x0444,	%o5
	umul	%l1,	0x012F,	%o2
	fpsub32	%f2,	%f2,	%f2
	fnor	%f18,	%f22,	%f0
	and	%l4,	%g4,	%l6
	lduh	[%l7 + 0x1E],	%l3
	array8	%i7,	%i5,	%g2
	st	%f15,	[%l7 + 0x7C]
	movcs	%xcc,	%g1,	%o7
	and	%i1,	%l5,	%g6
	movg	%icc,	%i6,	%i3
	edge8l	%i0,	%g5,	%i2
	movne	%xcc,	%g7,	%i4
	movne	%icc,	%l2,	%g3
	edge32ln	%o0,	%o1,	%l0
	ldsb	[%l7 + 0x3B],	%o6
	fmovspos	%icc,	%f27,	%f22
	edge32n	%o4,	%o5,	%l1
	movcs	%icc,	%o3,	%o2
	ldsb	[%l7 + 0x4E],	%g4
	array8	%l6,	%l3,	%l4
	edge32	%i7,	%g2,	%i5
	movrlez	%g1,	%o7,	%i1
	sub	%l5,	0x154E,	%g6
	edge32l	%i6,	%i3,	%i0
	addccc	%i2,	0x1D36,	%g7
	fabsd	%f30,	%f12
	edge32	%i4,	%g5,	%g3
	movvs	%icc,	%o0,	%l2
	sll	%l0,	%o6,	%o4
	orcc	%o5,	%l1,	%o3
	or	%o2,	%o1,	%l6
	smul	%l3,	0x15EA,	%l4
	move	%xcc,	%i7,	%g4
	subc	%g2,	%i5,	%o7
	fmovse	%icc,	%f25,	%f17
	sdivcc	%g1,	0x13C7,	%i1
	sllx	%g6,	%l5,	%i3
	sth	%i0,	[%l7 + 0x2A]
	edge16	%i2,	%i6,	%i4
	edge16l	%g5,	%g3,	%g7
	movleu	%icc,	%l2,	%l0
	fsrc1	%f18,	%f28
	udiv	%o0,	0x0AEF,	%o4
	srl	%o6,	%o5,	%o3
	stw	%o2,	[%l7 + 0x44]
	sdivcc	%o1,	0x158C,	%l1
	subccc	%l6,	0x09EA,	%l4
	xor	%l3,	0x0C25,	%i7
	fmovspos	%icc,	%f7,	%f10
	ldd	[%l7 + 0x48],	%g2
	umul	%i5,	%g4,	%g1
	movl	%xcc,	%o7,	%g6
	movrgez	%l5,	%i3,	%i1
	movpos	%icc,	%i2,	%i6
	sllx	%i4,	0x08,	%g5
	sdivx	%g3,	0x10C0,	%g7
	smul	%i0,	0x1659,	%l0
	orncc	%l2,	0x1691,	%o4
	move	%xcc,	%o6,	%o5
	ldsh	[%l7 + 0x2E],	%o3
	movne	%icc,	%o2,	%o0
	umul	%o1,	0x10DE,	%l1
	edge8n	%l4,	%l6,	%l3
	movl	%xcc,	%g2,	%i7
	sra	%i5,	%g4,	%o7
	sub	%g6,	0x1FE5,	%l5
	stx	%i3,	[%l7 + 0x68]
	nop
	set	0x6E, %l2
	stb	%g1,	[%l7 + %l2]
	edge8n	%i2,	%i6,	%i1
	lduw	[%l7 + 0x78],	%i4
	movrgz	%g5,	0x2B6,	%g7
	edge8ln	%g3,	%l0,	%i0
	sethi	0x1959,	%o4
	smul	%o6,	%l2,	%o5
	fmovrde	%o2,	%f18,	%f28
	fmovdpos	%xcc,	%f6,	%f7
	andcc	%o0,	0x0A07,	%o1
	fmovsne	%icc,	%f21,	%f9
	alignaddrl	%l1,	%o3,	%l4
	edge8	%l3,	%g2,	%l6
	movvc	%icc,	%i5,	%i7
	movcs	%xcc,	%o7,	%g6
	xor	%l5,	0x081B,	%g4
	fabsd	%f18,	%f4
	orn	%i3,	0x015A,	%g1
	xnorcc	%i2,	%i1,	%i4
	save %g5, %i6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x076A,	%g7
	fornot1	%f16,	%f18,	%f18
	ld	[%l7 + 0x10],	%f20
	orcc	%l0,	0x05D7,	%i0
	addc	%o6,	0x0677,	%l2
	edge8	%o5,	%o4,	%o2
	movrgez	%o0,	%l1,	%o1
	xor	%l4,	0x0F3F,	%o3
	or	%g2,	%l6,	%l3
	andcc	%i5,	0x0BCF,	%i7
	movl	%icc,	%o7,	%l5
	edge8l	%g4,	%g6,	%i3
	movge	%icc,	%i2,	%g1
	udiv	%i1,	0x193E,	%i4
	array8	%i6,	%g3,	%g7
	subc	%g5,	%i0,	%l0
	fmovdle	%icc,	%f16,	%f7
	addc	%l2,	%o6,	%o4
	fmovsl	%icc,	%f26,	%f0
	movrne	%o5,	%o2,	%o0
	xnorcc	%l1,	%o1,	%o3
	movn	%xcc,	%l4,	%l6
	sra	%l3,	%g2,	%i5
	fmovrdgez	%i7,	%f20,	%f26
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	stx	%i3,	[%l7 + 0x50]
	fabsd	%f2,	%f12
	edge8ln	%g4,	%i2,	%g1
	fmul8x16al	%f10,	%f3,	%f4
	movg	%xcc,	%i1,	%i6
	subcc	%i4,	%g3,	%g5
	movrne	%g7,	%i0,	%l2
	array16	%l0,	%o6,	%o5
	mulx	%o4,	%o0,	%o2
	movrne	%l1,	%o1,	%o3
	fone	%f24
	edge16n	%l4,	%l3,	%l6
	fmovsneg	%icc,	%f15,	%f24
	movrlez	%i5,	0x202,	%i7
	fors	%f28,	%f1,	%f26
	udiv	%g2,	0x1FA2,	%o7
	fors	%f26,	%f29,	%f13
	addcc	%l5,	%i3,	%g6
	movvc	%xcc,	%i2,	%g4
	xnorcc	%i1,	0x1AA7,	%g1
	siam	0x2
	edge8n	%i4,	%g3,	%g5
	umul	%g7,	0x1432,	%i6
	alignaddrl	%l2,	%l0,	%o6
	fsrc1s	%f16,	%f23
	stx	%i0,	[%l7 + 0x50]
	addc	%o4,	0x1815,	%o0
	fandnot1s	%f3,	%f25,	%f5
	mova	%xcc,	%o5,	%o2
	edge16ln	%o1,	%o3,	%l4
	srl	%l1,	%l3,	%l6
	fmovsn	%icc,	%f11,	%f3
	fnot2	%f10,	%f2
	nop
	set	0x3C, %i1
	stw	%i7,	[%l7 + %i1]
	movvc	%xcc,	%g2,	%i5
	fmovsleu	%icc,	%f24,	%f29
	umul	%l5,	0x1A13,	%o7
	movrgz	%g6,	0x226,	%i2
	orn	%g4,	0x126C,	%i1
	ldub	[%l7 + 0x1A],	%i3
	fnand	%f4,	%f6,	%f24
	movle	%xcc,	%g1,	%i4
	restore %g5, 0x0AF0, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f27,	%f18
	movvc	%icc,	%i6,	%l2
	srax	%g3,	0x19,	%l0
	sll	%i0,	%o6,	%o0
	movpos	%icc,	%o5,	%o4
	fpackfix	%f26,	%f28
	srlx	%o2,	%o3,	%l4
	array32	%l1,	%l3,	%o1
	movre	%i7,	%l6,	%g2
	faligndata	%f0,	%f24,	%f6
	movpos	%xcc,	%i5,	%o7
	ldsw	[%l7 + 0x30],	%l5
	edge16	%i2,	%g4,	%i1
	sllx	%i3,	%g1,	%i4
	movg	%xcc,	%g6,	%g7
	movcs	%xcc,	%g5,	%l2
	alignaddr	%i6,	%g3,	%i0
	fmovdpos	%xcc,	%f20,	%f19
	fmovde	%xcc,	%f15,	%f18
	sethi	0x0D51,	%o6
	edge16	%o0,	%l0,	%o5
	fpack16	%f16,	%f16
	lduh	[%l7 + 0x58],	%o4
	st	%f21,	[%l7 + 0x0C]
	mulx	%o2,	%l4,	%o3
	mulscc	%l1,	0x0DC8,	%l3
	edge16l	%i7,	%o1,	%l6
	movrgez	%i5,	0x2EE,	%o7
	alignaddr	%g2,	%i2,	%g4
	umulcc	%i1,	0x162B,	%i3
	array8	%l5,	%i4,	%g6
	fsrc2s	%f28,	%f22
	udivx	%g1,	0x06FF,	%g7
	subccc	%l2,	0x046B,	%g5
	fmul8x16al	%f4,	%f9,	%f8
	edge8	%i6,	%i0,	%o6
	srax	%o0,	0x12,	%g3
	ldx	[%l7 + 0x20],	%l0
	movg	%xcc,	%o4,	%o5
	edge16n	%l4,	%o3,	%o2
	fmovrsgz	%l3,	%f25,	%f7
	fmovse	%xcc,	%f2,	%f20
	st	%f14,	[%l7 + 0x18]
	orn	%l1,	0x1299,	%o1
	movrne	%l6,	0x154,	%i7
	movg	%xcc,	%i5,	%o7
	movne	%xcc,	%g2,	%i2
	fmovdl	%xcc,	%f3,	%f27
	edge8ln	%g4,	%i3,	%i1
	fands	%f6,	%f17,	%f26
	add	%i4,	0x16ED,	%g6
	addc	%g1,	0x0B0A,	%g7
	ldx	[%l7 + 0x30],	%l2
	movn	%xcc,	%l5,	%g5
	fmovrdlez	%i0,	%f16,	%f26
	umul	%o6,	0x15A8,	%i6
	st	%f23,	[%l7 + 0x34]
	and	%g3,	0x1B39,	%o0
	edge32	%o4,	%o5,	%l4
	udiv	%l0,	0x06C9,	%o3
	fpackfix	%f2,	%f3
	sub	%l3,	%o2,	%o1
	andcc	%l1,	%i7,	%l6
	pdist	%f4,	%f2,	%f2
	st	%f26,	[%l7 + 0x34]
	sra	%i5,	0x0E,	%o7
	movn	%icc,	%i2,	%g4
	array32	%g2,	%i3,	%i4
	fmovse	%icc,	%f26,	%f30
	udivcc	%i1,	0x1A6E,	%g1
	popc	0x0465,	%g7
	movleu	%xcc,	%l2,	%l5
	xorcc	%g5,	%i0,	%o6
	movne	%xcc,	%g6,	%g3
	or	%i6,	0x1909,	%o4
	orcc	%o5,	%o0,	%l0
	movg	%icc,	%o3,	%l3
	andncc	%l4,	%o2,	%l1
	fmovdvs	%icc,	%f14,	%f13
	fxors	%f4,	%f25,	%f17
	mulx	%o1,	0x0C4D,	%l6
	fcmpes	%fcc2,	%f25,	%f19
	fmovsge	%xcc,	%f23,	%f0
	fmovde	%xcc,	%f7,	%f17
	lduw	[%l7 + 0x0C],	%i5
	fnors	%f26,	%f9,	%f3
	fpadd32s	%f31,	%f9,	%f1
	xnorcc	%i7,	0x079E,	%i2
	mulx	%g4,	0x10BB,	%o7
	fmovse	%xcc,	%f14,	%f22
	subcc	%g2,	%i4,	%i3
	movn	%xcc,	%i1,	%g1
	edge16	%l2,	%g7,	%l5
	movle	%xcc,	%i0,	%o6
	ldsb	[%l7 + 0x7A],	%g5
	movgu	%xcc,	%g6,	%g3
	save %o4, 0x0459, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f24,	[%l7 + 0x40]
	std	%f4,	[%l7 + 0x58]
	movrlz	%o0,	%i6,	%l0
	edge8n	%o3,	%l3,	%o2
	fmovdleu	%xcc,	%f28,	%f4
	fxnors	%f4,	%f3,	%f28
	stw	%l1,	[%l7 + 0x30]
	ldsb	[%l7 + 0x61],	%o1
	sll	%l4,	0x1E,	%i5
	umul	%l6,	%i7,	%g4
	xnorcc	%o7,	0x0F94,	%g2
	srl	%i4,	0x0E,	%i2
	movneg	%icc,	%i3,	%i1
	fmovsgu	%icc,	%f25,	%f7
	udiv	%l2,	0x1A60,	%g1
	srlx	%l5,	0x02,	%i0
	movrgz	%g7,	0x141,	%o6
	fmovrslz	%g6,	%f25,	%f22
	stw	%g3,	[%l7 + 0x20]
	popc	0x036B,	%g5
	orn	%o4,	0x05F5,	%o5
	array8	%i6,	%o0,	%o3
	xnor	%l3,	0x1E9A,	%l0
	ldd	[%l7 + 0x68],	%f30
	mulscc	%l1,	0x1FF9,	%o1
	lduh	[%l7 + 0x48],	%o2
	fands	%f25,	%f23,	%f30
	lduh	[%l7 + 0x66],	%l4
	fpadd16	%f22,	%f14,	%f2
	fmovd	%f28,	%f4
	sub	%i5,	%i7,	%l6
	movcs	%icc,	%o7,	%g2
	and	%i4,	0x0365,	%g4
	ldsw	[%l7 + 0x3C],	%i3
	or	%i2,	0x120E,	%l2
	edge32n	%i1,	%g1,	%i0
	ldx	[%l7 + 0x38],	%g7
	fors	%f30,	%f9,	%f0
	addcc	%l5,	%g6,	%o6
	subccc	%g5,	%g3,	%o5
	and	%o4,	0x14E1,	%o0
	smulcc	%i6,	%l3,	%o3
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	sdiv	%o2,	0x0DF2,	%l4
	fmovrdgz	%i7,	%f26,	%f2
	srax	%l6,	0x1E,	%o7
	sub	%g2,	%i5,	%g4
	orn	%i4,	%i2,	%i3
	movrgez	%l2,	%g1,	%i0
	edge8l	%i1,	%g7,	%g6
	sth	%l5,	[%l7 + 0x2A]
	sub	%g5,	%g3,	%o6
	movvc	%xcc,	%o5,	%o0
	edge32ln	%i6,	%l3,	%o4
	edge16l	%o3,	%o1,	%l0
	movrlz	%o2,	0x061,	%l1
	mova	%xcc,	%i7,	%l6
	movvs	%icc,	%o7,	%g2
	movrgz	%i5,	0x094,	%l4
	popc	%g4,	%i4
	fmul8x16au	%f10,	%f3,	%f22
	movrgez	%i2,	0x361,	%i3
	fandnot1s	%f9,	%f14,	%f30
	fcmped	%fcc3,	%f20,	%f20
	movle	%icc,	%l2,	%g1
	movleu	%xcc,	%i1,	%g7
	std	%f16,	[%l7 + 0x68]
	ldsh	[%l7 + 0x10],	%g6
	movleu	%icc,	%i0,	%g5
	fmul8x16au	%f6,	%f11,	%f2
	movcs	%xcc,	%g3,	%l5
	fmovda	%xcc,	%f3,	%f15
	movl	%xcc,	%o6,	%o0
	edge16l	%i6,	%o5,	%l3
	smulcc	%o3,	%o1,	%o4
	sir	0x1B60
	fmul8sux16	%f6,	%f20,	%f2
	movre	%o2,	%l1,	%i7
	fnot1s	%f17,	%f4
	umul	%l6,	0x18B5,	%l0
	ldd	[%l7 + 0x48],	%g2
	fornot1s	%f15,	%f17,	%f8
	edge32ln	%i5,	%l4,	%o7
	andcc	%g4,	%i4,	%i2
	addccc	%i3,	%l2,	%g1
	orcc	%g7,	%g6,	%i0
	fnand	%f14,	%f12,	%f22
	xnor	%g5,	0x19C2,	%i1
	edge32ln	%g3,	%l5,	%o6
	move	%icc,	%o0,	%i6
	sir	0x0E7F
	fmovrdgz	%l3,	%f16,	%f14
	fmovsgu	%xcc,	%f4,	%f9
	and	%o3,	0x12E5,	%o1
	fornot1	%f2,	%f0,	%f2
	srax	%o5,	%o4,	%l1
	st	%f17,	[%l7 + 0x44]
	andcc	%i7,	%o2,	%l6
	subcc	%g2,	0x1386,	%i5
	movvs	%xcc,	%l0,	%l4
	fzeros	%f7
	movleu	%xcc,	%g4,	%i4
	andcc	%o7,	%i2,	%l2
	udiv	%i3,	0x03D2,	%g7
	fmul8sux16	%f20,	%f30,	%f2
	sub	%g1,	%i0,	%g5
	sub	%g6,	%i1,	%g3
	sllx	%l5,	%o6,	%o0
	xorcc	%i6,	0x10DB,	%o3
	ldx	[%l7 + 0x38],	%l3
	ldx	[%l7 + 0x18],	%o5
	subcc	%o1,	%o4,	%l1
	array8	%i7,	%o2,	%l6
	sub	%g2,	%i5,	%l4
	ldd	[%l7 + 0x10],	%f6
	stx	%g4,	[%l7 + 0x38]
	fcmpd	%fcc3,	%f8,	%f0
	movn	%xcc,	%l0,	%o7
	srlx	%i2,	%i4,	%i3
	umulcc	%l2,	0x1BFA,	%g1
	xnorcc	%i0,	%g7,	%g6
	edge16ln	%g5,	%g3,	%l5
	subcc	%i1,	%o0,	%i6
	array32	%o3,	%l3,	%o5
	sir	0x115B
	edge16n	%o6,	%o1,	%o4
	movrlz	%i7,	0x0AC,	%l1
	srax	%l6,	%o2,	%i5
	fzero	%f10
	movgu	%icc,	%l4,	%g2
	subc	%l0,	%o7,	%g4
	fxnors	%f12,	%f3,	%f11
	ldd	[%l7 + 0x10],	%f16
	and	%i4,	0x1223,	%i3
	movvs	%xcc,	%i2,	%g1
	subc	%i0,	0x16D5,	%g7
	fnegs	%f20,	%f1
	udivcc	%l2,	0x1A44,	%g6
	mulscc	%g5,	%g3,	%l5
	movrlz	%i1,	%o0,	%o3
	stb	%l3,	[%l7 + 0x7C]
	mova	%icc,	%o5,	%o6
	mova	%icc,	%i6,	%o1
	edge8l	%o4,	%l1,	%i7
	umul	%l6,	%i5,	%l4
	xor	%o2,	%g2,	%o7
	lduh	[%l7 + 0x32],	%l0
	restore %i4, %i3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f4
	movvs	%xcc,	%g1,	%i0
	fsrc2s	%f31,	%f8
	ldd	[%l7 + 0x20],	%g6
	fors	%f29,	%f28,	%f20
	edge8	%g4,	%l2,	%g5
	andn	%g6,	0x1061,	%g3
	subccc	%l5,	%o0,	%o3
	sdiv	%l3,	0x1FDB,	%o5
	fcmpgt16	%f30,	%f30,	%i1
	sub	%o6,	%i6,	%o4
	fnot2s	%f4,	%f13
	movre	%o1,	%i7,	%l6
	movl	%icc,	%i5,	%l4
	edge32ln	%l1,	%o2,	%g2
	nop
	set	0x58, %o2
	stw	%l0,	[%l7 + %o2]
	andncc	%o7,	%i4,	%i2
	edge32	%g1,	%i3,	%g7
	xor	%i0,	0x1592,	%l2
	sdiv	%g5,	0x0073,	%g4
	alignaddrl	%g3,	%l5,	%g6
	ldx	[%l7 + 0x70],	%o0
	srl	%o3,	%l3,	%i1
	movrlez	%o6,	%o5,	%i6
	alignaddr	%o1,	%i7,	%l6
	movpos	%xcc,	%i5,	%l4
	fmovda	%icc,	%f30,	%f9
	movvc	%xcc,	%l1,	%o4
	movge	%xcc,	%o2,	%l0
	orn	%g2,	%i4,	%i2
	movpos	%icc,	%o7,	%g1
	fpadd16	%f14,	%f28,	%f26
	udivcc	%g7,	0x0FB3,	%i0
	std	%f18,	[%l7 + 0x68]
	subccc	%i3,	0x1F24,	%l2
	fabss	%f4,	%f19
	sub	%g5,	0x08F0,	%g4
	save %g3, %g6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o3,	%l3,	%i1
	fmovsne	%xcc,	%f26,	%f25
	addccc	%o6,	0x06E8,	%o5
	movrgz	%i6,	%l5,	%i7
	ldd	[%l7 + 0x50],	%i6
	xnor	%o1,	0x0F28,	%i5
	or	%l4,	%l1,	%o4
	fands	%f27,	%f22,	%f27
	fmuld8ulx16	%f23,	%f20,	%f12
	addc	%l0,	0x1D5E,	%o2
	movcc	%xcc,	%g2,	%i2
	fmovspos	%xcc,	%f25,	%f21
	andncc	%i4,	%g1,	%g7
	movre	%o7,	0x005,	%i3
	edge32l	%i0,	%g5,	%g4
	andcc	%l2,	%g3,	%o0
	addc	%o3,	0x01A2,	%g6
	fpadd32	%f10,	%f10,	%f8
	xor	%i1,	0x1A06,	%l3
	fmovde	%icc,	%f27,	%f25
	movcs	%xcc,	%o5,	%o6
	movle	%xcc,	%i6,	%l5
	ldx	[%l7 + 0x60],	%l6
	srlx	%o1,	%i5,	%l4
	fmovrdlez	%i7,	%f14,	%f18
	movge	%icc,	%l1,	%l0
	orncc	%o4,	%g2,	%i2
	movle	%xcc,	%i4,	%g1
	fpsub16s	%f20,	%f14,	%f2
	xnorcc	%o2,	0x0F80,	%g7
	edge8n	%i3,	%o7,	%i0
	sdivx	%g5,	0x10D9,	%g4
	fmovscs	%icc,	%f20,	%f25
	addccc	%g3,	%o0,	%o3
	movrlez	%g6,	%i1,	%l3
	addccc	%o5,	0x10F5,	%o6
	movl	%xcc,	%l2,	%i6
	udivx	%l5,	0x1DF0,	%o1
	mova	%xcc,	%i5,	%l6
	movge	%icc,	%l4,	%i7
	add	%l0,	%o4,	%l1
	srlx	%g2,	%i2,	%i4
	fmovdneg	%icc,	%f12,	%f27
	ld	[%l7 + 0x0C],	%f23
	fmul8x16al	%f27,	%f28,	%f6
	movre	%o2,	0x269,	%g1
	mulscc	%i3,	0x1E84,	%g7
	movgu	%xcc,	%o7,	%g5
	sdivx	%i0,	0x152E,	%g4
	edge32ln	%o0,	%g3,	%o3
	orcc	%g6,	0x1AB6,	%i1
	ldd	[%l7 + 0x40],	%f8
	move	%icc,	%l3,	%o5
	udivcc	%o6,	0x0FC7,	%i6
	movre	%l2,	%o1,	%l5
	udivcc	%l6,	0x1CD9,	%l4
	fnor	%f18,	%f24,	%f12
	edge32n	%i7,	%i5,	%o4
	fcmped	%fcc1,	%f8,	%f26
	edge8ln	%l0,	%l1,	%g2
	move	%xcc,	%i4,	%i2
	sth	%g1,	[%l7 + 0x5A]
	fmovdg	%xcc,	%f1,	%f25
	sll	%o2,	0x13,	%i3
	andcc	%o7,	0x0DE8,	%g7
	sethi	0x19FF,	%i0
	movrlz	%g5,	0x21B,	%g4
	fornot1	%f2,	%f24,	%f10
	sdivx	%g3,	0x129E,	%o3
	nop
	set	0x5E, %g1
	ldub	[%l7 + %g1],	%o0
	sth	%g6,	[%l7 + 0x76]
	ldsw	[%l7 + 0x68],	%l3
	movl	%xcc,	%o5,	%i1
	fnot2s	%f20,	%f5
	fpack32	%f6,	%f28,	%f6
	addcc	%o6,	0x103D,	%l2
	ldsw	[%l7 + 0x70],	%i6
	or	%l5,	%l6,	%l4
	movvc	%xcc,	%i7,	%i5
	sdivx	%o4,	0x0F07,	%l0
	ldx	[%l7 + 0x50],	%l1
	umulcc	%o1,	0x1C72,	%g2
	sub	%i4,	0x172A,	%i2
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%f4
	fmovdvc	%icc,	%f2,	%f2
	fpadd16	%f2,	%f14,	%f24
	fmovdl	%xcc,	%f8,	%f25
	movne	%xcc,	%g1,	%i3
	movg	%xcc,	%o2,	%g7
	edge8n	%i0,	%o7,	%g4
	movcc	%icc,	%g5,	%g3
	srl	%o0,	%g6,	%l3
	edge8ln	%o5,	%i1,	%o6
	fpackfix	%f14,	%f29
	movvs	%icc,	%l2,	%o3
	udiv	%l5,	0x1F85,	%l6
	movrlez	%l4,	0x235,	%i6
	fandnot1	%f2,	%f24,	%f12
	movrgz	%i7,	0x1D5,	%o4
	array32	%i5,	%l0,	%l1
	movn	%xcc,	%o1,	%g2
	movrgz	%i4,	%g1,	%i3
	fabsd	%f30,	%f16
	stb	%i2,	[%l7 + 0x41]
	sir	0x06DA
	smul	%o2,	0x0F1F,	%g7
	fsrc2s	%f29,	%f27
	edge16n	%o7,	%g4,	%i0
	edge8ln	%g5,	%o0,	%g6
	popc	%l3,	%g3
	array8	%o5,	%o6,	%l2
	movneg	%icc,	%o3,	%l5
	addccc	%i1,	0x022F,	%l6
	for	%f22,	%f28,	%f14
	sethi	0x0F6E,	%i6
	movvs	%icc,	%l4,	%i7
	array16	%o4,	%i5,	%l1
	movle	%icc,	%o1,	%l0
	fexpand	%f22,	%f18
	srl	%g2,	%g1,	%i4
	movrlez	%i2,	%o2,	%g7
	fcmps	%fcc3,	%f23,	%f21
	xnor	%i3,	0x0DB4,	%g4
	save %o7, %i0, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o0,	0x14,	%l3
	fmovrdlez	%g6,	%f26,	%f22
	movvc	%icc,	%o5,	%g3
	fpmerge	%f12,	%f5,	%f10
	lduw	[%l7 + 0x68],	%o6
	sethi	0x03D7,	%l2
	ldx	[%l7 + 0x08],	%o3
	orcc	%l5,	%i1,	%l6
	andn	%l4,	%i7,	%i6
	udivcc	%i5,	0x14BA,	%l1
	smulcc	%o4,	0x0F5F,	%l0
	ldd	[%l7 + 0x58],	%f6
	fones	%f6
	subccc	%g2,	0x10D2,	%o1
	st	%f25,	[%l7 + 0x30]
	std	%f16,	[%l7 + 0x20]
	array32	%i4,	%g1,	%i2
	umulcc	%g7,	%o2,	%i3
	mulscc	%g4,	%i0,	%o7
	fmovdcc	%xcc,	%f29,	%f10
	fxors	%f17,	%f28,	%f0
	subc	%o0,	%g5,	%l3
	fnot2	%f6,	%f28
	lduw	[%l7 + 0x28],	%o5
	movleu	%icc,	%g3,	%o6
	andncc	%l2,	%o3,	%g6
	fnot1	%f30,	%f28
	ld	[%l7 + 0x28],	%f17
	move	%icc,	%l5,	%l6
	fmovdgu	%icc,	%f19,	%f11
	udivx	%l4,	0x0FF1,	%i1
	st	%f24,	[%l7 + 0x08]
	umulcc	%i6,	0x1F07,	%i5
	ld	[%l7 + 0x4C],	%f26
	fmovrdlz	%i7,	%f10,	%f10
	fmovrdlez	%l1,	%f14,	%f18
	stw	%o4,	[%l7 + 0x34]
	nop
	set	0x55, %l4
	ldub	[%l7 + %l4],	%g2
	stw	%o1,	[%l7 + 0x34]
	sir	0x0D33
	fnor	%f10,	%f24,	%f4
	and	%i4,	%l0,	%i2
	edge16ln	%g7,	%o2,	%g1
	movrgez	%g4,	0x3F0,	%i3
	movrne	%o7,	0x390,	%i0
	sdivx	%o0,	0x09F3,	%l3
	ldsb	[%l7 + 0x58],	%g5
	movge	%xcc,	%g3,	%o6
	smulcc	%o5,	%o3,	%l2
	ldsw	[%l7 + 0x68],	%l5
	array16	%l6,	%g6,	%l4
	fpadd32s	%f15,	%f24,	%f15
	orcc	%i6,	0x129D,	%i1
	popc	%i7,	%i5
	std	%f20,	[%l7 + 0x08]
	or	%o4,	%l1,	%g2
	for	%f0,	%f8,	%f30
	lduw	[%l7 + 0x18],	%i4
	movrne	%l0,	0x28F,	%i2
	addccc	%g7,	%o2,	%o1
	sub	%g1,	0x16C7,	%i3
	subccc	%g4,	0x1630,	%o7
	sdivcc	%o0,	0x1DEF,	%l3
	fcmpd	%fcc1,	%f30,	%f26
	edge8l	%i0,	%g3,	%g5
	edge16l	%o5,	%o3,	%l2
	movl	%xcc,	%o6,	%l5
	sth	%l6,	[%l7 + 0x22]
	movvc	%xcc,	%l4,	%g6
	std	%f20,	[%l7 + 0x40]
	xor	%i1,	%i7,	%i6
	movn	%icc,	%o4,	%i5
	sub	%l1,	0x1CD0,	%g2
	edge16l	%i4,	%i2,	%g7
	movn	%icc,	%l0,	%o1
	udivx	%g1,	0x0362,	%o2
	fmovsvs	%icc,	%f22,	%f27
	sll	%i3,	%o7,	%o0
	movrne	%g4,	%i0,	%l3
	fmovsleu	%xcc,	%f5,	%f4
	movcc	%icc,	%g5,	%g3
	movrne	%o3,	0x31B,	%o5
	move	%icc,	%l2,	%o6
	fpadd16	%f22,	%f22,	%f22
	fpsub16s	%f4,	%f10,	%f4
	udiv	%l6,	0x1457,	%l4
	smul	%l5,	0x1C7C,	%g6
	udivx	%i7,	0x0465,	%i6
	smul	%i1,	0x0DEF,	%i5
	addc	%o4,	%l1,	%i4
	movcc	%xcc,	%i2,	%g2
	fpadd32	%f28,	%f0,	%f10
	movrgz	%l0,	%g7,	%g1
	ldx	[%l7 + 0x78],	%o1
	udivx	%i3,	0x0FD2,	%o2
	mulscc	%o0,	%o7,	%g4
	addccc	%l3,	0x1202,	%g5
	subccc	%i0,	0x1A1C,	%o3
	sth	%g3,	[%l7 + 0x40]
	fmovdgu	%icc,	%f24,	%f30
	popc	0x1E05,	%l2
	xorcc	%o5,	0x1051,	%o6
	movleu	%icc,	%l4,	%l6
	ldd	[%l7 + 0x68],	%g6
	edge8ln	%l5,	%i7,	%i1
	ldd	[%l7 + 0x38],	%i4
	sll	%i6,	%o4,	%i4
	stw	%l1,	[%l7 + 0x1C]
	fmovdcc	%icc,	%f9,	%f14
	fmovrslez	%g2,	%f6,	%f16
	srax	%i2,	%l0,	%g7
	edge32l	%o1,	%g1,	%i3
	fmovrdgez	%o2,	%f2,	%f10
	popc	0x182E,	%o7
	std	%f8,	[%l7 + 0x28]
	fzeros	%f27
	ldsh	[%l7 + 0x10],	%o0
	save %g4, %l3, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o3,	%g5,	%l2
	alignaddrl	%o5,	%g3,	%l4
	sdivcc	%o6,	0x1EE0,	%g6
	edge16n	%l6,	%i7,	%l5
	udivcc	%i1,	0x145A,	%i6
	movrlz	%i5,	0x153,	%i4
	edge32n	%l1,	%g2,	%o4
	edge8	%l0,	%g7,	%i2
	fcmps	%fcc3,	%f23,	%f18
	andncc	%o1,	%i3,	%o2
	fpackfix	%f20,	%f9
	stw	%o7,	[%l7 + 0x68]
	fmovsg	%icc,	%f6,	%f11
	movrlz	%o0,	0x310,	%g4
	edge16n	%g1,	%i0,	%o3
	movvs	%icc,	%l3,	%g5
	lduw	[%l7 + 0x2C],	%o5
	sdivx	%l2,	0x0283,	%l4
	addccc	%o6,	0x072A,	%g3
	alignaddr	%l6,	%i7,	%l5
	and	%g6,	0x0B6A,	%i6
	xorcc	%i1,	0x09FC,	%i4
	movpos	%icc,	%i5,	%g2
	movrlz	%l1,	%o4,	%l0
	fpack16	%f24,	%f9
	fones	%f4
	ldub	[%l7 + 0x3E],	%i2
	edge32ln	%g7,	%i3,	%o1
	movrgez	%o2,	0x0C7,	%o7
	stx	%g4,	[%l7 + 0x78]
	movl	%xcc,	%g1,	%o0
	stw	%o3,	[%l7 + 0x40]
	fmul8x16au	%f3,	%f3,	%f26
	subc	%i0,	%l3,	%g5
	umulcc	%l2,	%l4,	%o6
	fnors	%f2,	%f21,	%f2
	xnorcc	%g3,	0x0F48,	%o5
	sll	%l6,	%l5,	%g6
	edge32l	%i7,	%i1,	%i4
	ldx	[%l7 + 0x08],	%i5
	ldd	[%l7 + 0x40],	%f0
	movneg	%xcc,	%g2,	%i6
	stx	%o4,	[%l7 + 0x78]
	sethi	0x0B4C,	%l1
	movrlz	%i2,	%l0,	%g7
	udivx	%i3,	0x1753,	%o1
	stb	%o2,	[%l7 + 0x77]
	xorcc	%g4,	0x081A,	%o7
	movn	%xcc,	%o0,	%o3
	sllx	%g1,	%l3,	%i0
	fpadd16s	%f2,	%f23,	%f7
	movrlz	%l2,	%g5,	%o6
	sll	%l4,	0x10,	%g3
	addc	%l6,	%l5,	%o5
	movvs	%xcc,	%i7,	%g6
	ldub	[%l7 + 0x71],	%i4
	movcs	%icc,	%i1,	%i5
	alignaddr	%i6,	%g2,	%o4
	movvs	%icc,	%l1,	%l0
	stb	%i2,	[%l7 + 0x55]
	udivcc	%g7,	0x0CB0,	%i3
	movcs	%icc,	%o1,	%g4
	fmovsa	%xcc,	%f23,	%f15
	andncc	%o7,	%o2,	%o3
	edge8ln	%g1,	%l3,	%i0
	fmovde	%icc,	%f8,	%f14
	fors	%f30,	%f30,	%f1
	ldsh	[%l7 + 0x38],	%l2
	xorcc	%o0,	%o6,	%l4
	movpos	%icc,	%g5,	%g3
	ldd	[%l7 + 0x18],	%i6
	fcmpne32	%f8,	%f8,	%o5
	fcmps	%fcc2,	%f19,	%f30
	array32	%i7,	%g6,	%l5
	add	%i1,	0x1F42,	%i5
	movrgez	%i6,	%g2,	%o4
	movleu	%icc,	%i4,	%l0
	smul	%i2,	0x0A60,	%l1
	add	%i3,	0x18B9,	%o1
	alignaddrl	%g7,	%o7,	%g4
	ldd	[%l7 + 0x28],	%f26
	mulscc	%o3,	%o2,	%g1
	movrlez	%l3,	0x1AE,	%i0
	fmovrslz	%o0,	%f14,	%f1
	fsrc1	%f20,	%f6
	ldsh	[%l7 + 0x6A],	%o6
	fmovrsgez	%l4,	%f16,	%f27
	fmovsg	%icc,	%f30,	%f29
	fcmpne32	%f0,	%f4,	%g5
	movcc	%xcc,	%g3,	%l6
	smulcc	%o5,	0x0885,	%l2
	edge16l	%i7,	%l5,	%g6
	xnorcc	%i1,	%i6,	%g2
	movrgez	%o4,	%i4,	%l0
	movl	%xcc,	%i5,	%i2
	sdivcc	%i3,	0x149C,	%l1
	edge8n	%g7,	%o1,	%o7
	xorcc	%g4,	%o3,	%o2
	fpackfix	%f12,	%f3
	fmovscs	%xcc,	%f16,	%f11
	srl	%l3,	%i0,	%o0
	array8	%g1,	%o6,	%g5
	lduh	[%l7 + 0x42],	%l4
	movcs	%xcc,	%g3,	%o5
	ld	[%l7 + 0x30],	%f20
	fmovrdne	%l6,	%f4,	%f16
	smulcc	%i7,	%l2,	%g6
	fmovdcc	%icc,	%f12,	%f7
	fandnot2s	%f5,	%f4,	%f27
	sll	%i1,	0x0A,	%l5
	edge32ln	%i6,	%o4,	%g2
	udivx	%l0,	0x1965,	%i5
	edge8n	%i2,	%i4,	%l1
	movpos	%xcc,	%g7,	%o1
	mulscc	%o7,	0x192C,	%g4
	alignaddr	%o3,	%i3,	%l3
	fmovsgu	%icc,	%f26,	%f8
	array32	%i0,	%o0,	%o2
	stw	%g1,	[%l7 + 0x28]
	sdivcc	%g5,	0x072F,	%o6
	edge16ln	%g3,	%l4,	%o5
	srax	%i7,	%l2,	%g6
	fmovdcs	%xcc,	%f12,	%f3
	array8	%l6,	%l5,	%i6
	sdivcc	%o4,	0x0982,	%i1
	stx	%l0,	[%l7 + 0x50]
	sdiv	%g2,	0x08A2,	%i5
	sir	0x11A1
	sdivx	%i4,	0x1F28,	%i2
	mova	%xcc,	%g7,	%o1
	fabsd	%f12,	%f6
	sll	%l1,	%g4,	%o7
	array8	%o3,	%l3,	%i3
	ld	[%l7 + 0x0C],	%f8
	fsrc1s	%f31,	%f6
	and	%o0,	%o2,	%g1
	andn	%g5,	%i0,	%g3
	ldsh	[%l7 + 0x6A],	%l4
	ldd	[%l7 + 0x60],	%o6
	edge32n	%i7,	%o5,	%g6
	popc	0x1B78,	%l6
	fone	%f2
	addcc	%l5,	0x064B,	%i6
	save %o4, %i1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l0,	%i5
	xorcc	%i4,	%i2,	%g2
	movrgz	%g7,	%l1,	%o1
	sethi	0x0131,	%g4
	xnor	%o7,	0x1587,	%o3
	stx	%l3,	[%l7 + 0x30]
	movl	%xcc,	%o0,	%i3
	alignaddr	%o2,	%g1,	%i0
	fmovde	%xcc,	%f10,	%f5
	ld	[%l7 + 0x64],	%f14
	fmovdpos	%icc,	%f6,	%f31
	array16	%g5,	%l4,	%o6
	fxors	%f16,	%f29,	%f31
	fmovrdgez	%i7,	%f8,	%f26
	fcmped	%fcc3,	%f26,	%f2
	movle	%icc,	%g3,	%o5
	fmuld8ulx16	%f27,	%f29,	%f12
	sllx	%l6,	0x0D,	%l5
	array8	%g6,	%i6,	%i1
	move	%icc,	%l2,	%o4
	array8	%i5,	%l0,	%i2
	andncc	%g2,	%i4,	%l1
	edge8n	%o1,	%g7,	%g4
	edge16ln	%o7,	%l3,	%o3
	fmul8sux16	%f18,	%f14,	%f12
	fmul8x16al	%f23,	%f10,	%f22
	fmovrdlez	%o0,	%f24,	%f10
	andncc	%i3,	%o2,	%g1
	fmovdle	%xcc,	%f14,	%f5
	movvs	%icc,	%g5,	%i0
	xorcc	%o6,	0x021C,	%i7
	popc	%g3,	%o5
	andncc	%l4,	%l6,	%l5
	ld	[%l7 + 0x7C],	%f22
	ldub	[%l7 + 0x75],	%i6
	fones	%f31
	movcc	%xcc,	%i1,	%l2
	sir	0x0BE4
	fsrc1	%f2,	%f10
	sth	%o4,	[%l7 + 0x62]
	ldsh	[%l7 + 0x5A],	%i5
	movg	%icc,	%l0,	%i2
	sll	%g2,	%g6,	%l1
	orcc	%i4,	%o1,	%g7
	sllx	%g4,	%l3,	%o7
	movpos	%icc,	%o3,	%o0
	mulx	%i3,	0x119F,	%g1
	sth	%g5,	[%l7 + 0x40]
	orncc	%i0,	0x087E,	%o6
	fsrc1s	%f2,	%f31
	fnands	%f28,	%f23,	%f12
	srl	%o2,	%g3,	%i7
	ldx	[%l7 + 0x48],	%o5
	movle	%icc,	%l6,	%l4
	movg	%xcc,	%l5,	%i6
	orcc	%i1,	%l2,	%o4
	fone	%f24
	sdivcc	%i5,	0x0931,	%i2
	smulcc	%g2,	0x0701,	%l0
	sdivcc	%l1,	0x1761,	%i4
	or	%o1,	0x1509,	%g7
	fmovrdlez	%g6,	%f18,	%f20
	movvs	%xcc,	%l3,	%g4
	mulx	%o7,	0x0C19,	%o3
	sdiv	%o0,	0x1F81,	%g1
	fands	%f29,	%f24,	%f4
	edge8ln	%i3,	%i0,	%o6
	edge16l	%g5,	%o2,	%i7
	fandnot1s	%f20,	%f21,	%f26
	udivcc	%g3,	0x0EED,	%l6
	xnor	%l4,	0x0F12,	%l5
	fpackfix	%f16,	%f12
	edge16	%o5,	%i1,	%l2
	movrlz	%o4,	%i6,	%i2
	edge32ln	%g2,	%l0,	%l1
	udiv	%i5,	0x0390,	%i4
	sll	%g7,	%g6,	%l3
	or	%o1,	%g4,	%o3
	smulcc	%o7,	%o0,	%i3
	subcc	%g1,	0x19AB,	%i0
	mova	%xcc,	%g5,	%o2
	movne	%xcc,	%i7,	%g3
	xorcc	%o6,	0x0F09,	%l4
	edge8l	%l6,	%l5,	%o5
	xorcc	%l2,	%o4,	%i1
	ldub	[%l7 + 0x2E],	%i6
	or	%i2,	%l0,	%g2
	edge32l	%l1,	%i5,	%g7
	lduw	[%l7 + 0x0C],	%g6
	udivcc	%l3,	0x06C2,	%i4
	srlx	%o1,	%g4,	%o7
	nop
	set	0x40, %g5
	stw	%o3,	[%l7 + %g5]
	and	%o0,	%g1,	%i0
	orn	%g5,	%i3,	%o2
	fones	%f9
	sethi	0x0991,	%i7
	movpos	%icc,	%o6,	%g3
	xnor	%l4,	%l6,	%l5
	array16	%o5,	%l2,	%i1
	movrne	%i6,	0x0EE,	%i2
	xor	%o4,	0x1B2C,	%l0
	move	%icc,	%g2,	%l1
	array16	%i5,	%g6,	%l3
	movpos	%icc,	%i4,	%o1
	fmovsge	%xcc,	%f10,	%f31
	udivx	%g4,	0x1F7C,	%o7
	orncc	%o3,	%o0,	%g7
	sdivx	%g1,	0x0F15,	%i0
	xnorcc	%i3,	%g5,	%o2
	sub	%o6,	%g3,	%l4
	movrgz	%l6,	%l5,	%i7
	fnot2s	%f18,	%f25
	fmovrsgz	%l2,	%f24,	%f23
	edge16l	%i1,	%i6,	%i2
	udiv	%o4,	0x0791,	%l0
	addcc	%o5,	%l1,	%g2
	movre	%i5,	0x094,	%l3
	edge32ln	%i4,	%g6,	%o1
	mova	%xcc,	%o7,	%o3
	sir	0x1F64
	fnot2	%f28,	%f2
	edge32ln	%o0,	%g7,	%g4
	nop
	set	0x0C, %o3
	lduw	[%l7 + %o3],	%g1
	orn	%i3,	0x1968,	%g5
	fcmpne32	%f10,	%f0,	%i0
	udivcc	%o6,	0x1F67,	%o2
	umul	%g3,	%l4,	%l6
	sdiv	%i7,	0x095C,	%l5
	fmovdn	%xcc,	%f21,	%f31
	ld	[%l7 + 0x08],	%f7
	fabsd	%f22,	%f30
	movvc	%icc,	%i1,	%l2
	movre	%i6,	0x0C4,	%o4
	ldub	[%l7 + 0x58],	%i2
	fmovsle	%xcc,	%f28,	%f13
	move	%xcc,	%o5,	%l0
	fmovd	%f30,	%f20
	sllx	%g2,	0x0E,	%l1
	andn	%i5,	%i4,	%l3
	xorcc	%g6,	0x0985,	%o1
	fzero	%f6
	edge8ln	%o3,	%o7,	%o0
	subcc	%g4,	0x1DD2,	%g7
	movrne	%i3,	0x20A,	%g5
	smul	%g1,	0x1ED5,	%o6
	xnor	%o2,	%g3,	%l4
	alignaddr	%l6,	%i7,	%i0
	stw	%i1,	[%l7 + 0x2C]
	fmovdl	%xcc,	%f6,	%f18
	ldsh	[%l7 + 0x6A],	%l2
	edge32n	%l5,	%o4,	%i2
	umul	%o5,	0x0589,	%l0
	udiv	%i6,	0x0425,	%l1
	popc	0x0EC5,	%g2
	xnorcc	%i4,	0x0A38,	%l3
	ldsh	[%l7 + 0x46],	%g6
	subc	%o1,	%o3,	%i5
	movvs	%icc,	%o0,	%g4
	ldub	[%l7 + 0x32],	%g7
	fnands	%f14,	%f24,	%f15
	smul	%o7,	0x19F4,	%g5
	sdivx	%i3,	0x1DB4,	%g1
	andncc	%o2,	%o6,	%l4
	xor	%l6,	0x130F,	%i7
	fmovsvs	%icc,	%f26,	%f17
	sub	%i0,	%g3,	%i1
	sra	%l2,	%l5,	%i2
	movg	%icc,	%o4,	%o5
	fcmpes	%fcc2,	%f16,	%f17
	fpsub16s	%f28,	%f29,	%f3
	sdiv	%l0,	0x16EE,	%i6
	udiv	%g2,	0x19A6,	%i4
	movleu	%xcc,	%l1,	%l3
	srl	%o1,	%o3,	%i5
	smul	%o0,	%g6,	%g4
	movvc	%icc,	%o7,	%g7
	ldx	[%l7 + 0x70],	%i3
	movrgez	%g1,	0x02A,	%g5
	orn	%o6,	0x1537,	%o2
	addccc	%l4,	%i7,	%l6
	movl	%xcc,	%i0,	%i1
	fpack16	%f20,	%f0
	fnands	%f15,	%f10,	%f3
	edge32l	%l2,	%g3,	%l5
	edge32l	%i2,	%o5,	%o4
	sdivx	%l0,	0x09A2,	%i6
	movrlez	%g2,	%i4,	%l1
	sub	%o1,	%o3,	%i5
	sethi	0x1C72,	%l3
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	srl	%o7,	0x0E,	%g4
	subc	%i3,	0x0A0A,	%g1
	addcc	%g5,	0x0015,	%o6
	sll	%g7,	0x02,	%l4
	or	%o2,	0x1DCF,	%l6
	sth	%i7,	[%l7 + 0x10]
	sub	%i1,	0x0446,	%l2
	sub	%i0,	0x010F,	%g3
	sth	%i2,	[%l7 + 0x7C]
	orncc	%l5,	0x0547,	%o4
	restore %l0, 0x12CC, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o5,	0x1501,	%i4
	fmovrdlz	%l1,	%f12,	%f14
	add	%g2,	%o3,	%i5
	fone	%f8
	andn	%l3,	0x1CA3,	%g6
	or	%o0,	%o7,	%o1
	sllx	%g4,	0x0F,	%g1
	udivcc	%i3,	0x1D47,	%g5
	movn	%icc,	%o6,	%g7
	sra	%l4,	0x0E,	%l6
	popc	%i7,	%i1
	movrlez	%o2,	0x3BC,	%l2
	udivcc	%g3,	0x0B2A,	%i2
	srlx	%l5,	0x06,	%i0
	movle	%icc,	%o4,	%l0
	fnegs	%f13,	%f27
	fmovrse	%i6,	%f29,	%f7
	movg	%icc,	%o5,	%l1
	movne	%icc,	%i4,	%o3
	subcc	%i5,	0x0332,	%g2
	and	%l3,	0x15B5,	%o0
	fnor	%f12,	%f16,	%f28
	orcc	%o7,	%o1,	%g6
	fmovrdlz	%g4,	%f14,	%f26
	lduw	[%l7 + 0x74],	%i3
	nop
	set	0x79, %i0
	ldub	[%l7 + %i0],	%g1
	fmovrdgz	%o6,	%f8,	%f12
	fxor	%f0,	%f0,	%f8
	subc	%g5,	%l4,	%l6
	movrgez	%g7,	0x13F,	%i1
	stx	%o2,	[%l7 + 0x20]
	movvs	%icc,	%l2,	%g3
	stx	%i7,	[%l7 + 0x50]
	subcc	%i2,	0x0612,	%i0
	stx	%l5,	[%l7 + 0x60]
	andcc	%l0,	0x0986,	%i6
	subc	%o5,	0x01DA,	%l1
	movvs	%icc,	%o4,	%i4
	orncc	%i5,	%o3,	%l3
	fmovs	%f10,	%f9
	edge16l	%g2,	%o0,	%o7
	sra	%o1,	0x0E,	%g4
	movcc	%xcc,	%i3,	%g1
	xnor	%o6,	%g6,	%l4
	sdivcc	%g5,	0x0B00,	%l6
	fpsub16	%f30,	%f6,	%f12
	lduh	[%l7 + 0x54],	%g7
	fsrc2s	%f3,	%f30
	fcmpne32	%f22,	%f24,	%o2
	movg	%xcc,	%i1,	%l2
	movcc	%icc,	%g3,	%i2
	fmovrdgez	%i7,	%f24,	%f2
	xor	%l5,	0x0F98,	%l0
	alignaddrl	%i0,	%o5,	%l1
	movrlz	%i6,	%o4,	%i5
	mova	%xcc,	%o3,	%i4
	srlx	%g2,	%l3,	%o7
	smulcc	%o1,	%o0,	%i3
	sra	%g4,	0x0A,	%o6
	edge16ln	%g6,	%l4,	%g1
	popc	0x143A,	%l6
	fcmpd	%fcc0,	%f14,	%f12
	movleu	%icc,	%g5,	%g7
	array16	%i1,	%o2,	%g3
	movne	%icc,	%i2,	%l2
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%l4
	movle	%xcc,	%i7,	%l0
	xorcc	%o5,	%l1,	%i6
	fmovs	%f23,	%f14
	smul	%o4,	0x01FF,	%i5
	array8	%i0,	%i4,	%o3
	edge8	%l3,	%g2,	%o7
	st	%f3,	[%l7 + 0x64]
	sdivcc	%o0,	0x1758,	%i3
	edge8ln	%o1,	%g4,	%g6
	st	%f25,	[%l7 + 0x38]
	stx	%l4,	[%l7 + 0x18]
	array8	%g1,	%l6,	%g5
	edge8n	%o6,	%i1,	%g7
	fmovdvs	%icc,	%f12,	%f17
	xorcc	%o2,	%i2,	%g3
	orn	%l2,	%i7,	%l0
	save %l5, %o5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x17],	%l1
	or	%o4,	%i0,	%i5
	movleu	%icc,	%o3,	%l3
	fmovdcc	%icc,	%f8,	%f21
	fmovrde	%g2,	%f6,	%f0
	xor	%o7,	0x0E54,	%i4
	sdivcc	%i3,	0x0800,	%o0
	smul	%o1,	%g4,	%g6
	array16	%l4,	%l6,	%g5
	and	%g1,	0x1FBA,	%i1
	movrne	%o6,	0x1FC,	%o2
	umul	%g7,	0x1391,	%i2
	edge8	%g3,	%i7,	%l2
	xorcc	%l0,	0x1938,	%o5
	sdiv	%l5,	0x1F49,	%i6
	sdivcc	%l1,	0x1B2D,	%o4
	sethi	0x14E3,	%i5
	srax	%i0,	%l3,	%o3
	alignaddrl	%g2,	%i4,	%o7
	fpadd32	%f10,	%f22,	%f30
	movne	%icc,	%i3,	%o1
	xorcc	%o0,	%g4,	%l4
	fnot1s	%f1,	%f29
	fnand	%f12,	%f8,	%f26
	movneg	%icc,	%l6,	%g5
	fpadd32s	%f4,	%f25,	%f19
	alignaddr	%g1,	%g6,	%i1
	movgu	%xcc,	%o2,	%o6
	fmovsvc	%xcc,	%f2,	%f30
	move	%xcc,	%i2,	%g3
	ldd	[%l7 + 0x70],	%f16
	ldsw	[%l7 + 0x24],	%g7
	fxnors	%f10,	%f4,	%f19
	sdivcc	%l2,	0x0AB6,	%l0
	edge32ln	%i7,	%o5,	%l5
	fmovsa	%xcc,	%f27,	%f23
	addc	%l1,	%o4,	%i6
	movn	%xcc,	%i0,	%i5
	movrlez	%o3,	0x20D,	%l3
	xnor	%g2,	%i4,	%i3
	xnorcc	%o1,	%o0,	%g4
	fmovdvs	%icc,	%f14,	%f31
	edge16n	%o7,	%l4,	%g5
	movrgz	%g1,	0x366,	%g6
	movre	%i1,	0x111,	%l6
	movrlz	%o2,	%o6,	%i2
	orn	%g3,	0x14C9,	%l2
	movrlez	%l0,	0x159,	%g7
	st	%f23,	[%l7 + 0x7C]
	sllx	%i7,	%o5,	%l1
	edge16ln	%l5,	%o4,	%i0
	fxor	%f2,	%f8,	%f12
	fmovsl	%icc,	%f24,	%f25
	fnors	%f28,	%f24,	%f31
	ldsb	[%l7 + 0x41],	%i6
	siam	0x6
	fsrc1	%f10,	%f6
	orn	%o3,	0x1378,	%i5
	subc	%g2,	%l3,	%i3
	edge8l	%i4,	%o1,	%o0
	fmovsg	%icc,	%f8,	%f16
	ldx	[%l7 + 0x70],	%o7
	array8	%g4,	%g5,	%g1
	sth	%l4,	[%l7 + 0x72]
	fmovrdlz	%i1,	%f28,	%f6
	sllx	%g6,	0x17,	%l6
	xnorcc	%o2,	%o6,	%g3
	orn	%l2,	0x0A47,	%i2
	fpackfix	%f14,	%f28
	lduw	[%l7 + 0x14],	%l0
	sethi	0x10FF,	%g7
	nop
	set	0x78, %g2
	stw	%i7,	[%l7 + %g2]
	movleu	%xcc,	%o5,	%l1
	fcmpgt16	%f0,	%f0,	%l5
	subccc	%i0,	%i6,	%o3
	fnot2	%f8,	%f2
	subcc	%i5,	%g2,	%l3
	fmovrse	%i3,	%f4,	%f11
	edge8l	%i4,	%o1,	%o0
	edge32	%o7,	%g4,	%o4
	addcc	%g1,	%l4,	%g5
	edge32ln	%i1,	%l6,	%g6
	subcc	%o6,	%g3,	%o2
	sdivcc	%l2,	0x18A0,	%l0
	addccc	%g7,	%i2,	%i7
	fmuld8ulx16	%f11,	%f9,	%f30
	movrlez	%o5,	0x1F6,	%l5
	fnors	%f17,	%f22,	%f26
	subccc	%i0,	0x0CA0,	%i6
	fmovse	%xcc,	%f30,	%f10
	movrgz	%o3,	%i5,	%l1
	ld	[%l7 + 0x0C],	%f7
	fpackfix	%f20,	%f5
	movrgez	%l3,	0x276,	%i3
	fmuld8ulx16	%f28,	%f26,	%f12
	lduh	[%l7 + 0x10],	%g2
	srax	%o1,	%i4,	%o7
	addc	%g4,	0x02FE,	%o0
	array8	%o4,	%g1,	%g5
	umulcc	%i1,	0x1BCC,	%l4
	fpadd32	%f30,	%f8,	%f18
	sll	%g6,	0x04,	%l6
	fcmpgt32	%f14,	%f14,	%o6
	fmovdge	%xcc,	%f18,	%f9
	fnegd	%f8,	%f26
	orcc	%o2,	0x197B,	%l2
	xorcc	%g3,	%l0,	%g7
	ldsw	[%l7 + 0x68],	%i7
	alignaddr	%i2,	%o5,	%i0
	sdivcc	%i6,	0x053C,	%o3
	andcc	%l5,	0x1442,	%l1
	andcc	%i5,	0x14BF,	%i3
	sub	%l3,	0x016A,	%o1
	and	%g2,	%i4,	%o7
	fmovrdlez	%g4,	%f16,	%f0
	smul	%o4,	0x04F3,	%g1
	movrlez	%o0,	0x3E7,	%g5
	fmovsn	%xcc,	%f29,	%f28
	fzeros	%f0
	fmovsle	%xcc,	%f11,	%f11
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	fnor	%f6,	%f14,	%f26
	movvs	%xcc,	%l6,	%g6
	fmovse	%xcc,	%f5,	%f16
	udivx	%o2,	0x1071,	%o6
	subcc	%l2,	%l0,	%g3
	sub	%g7,	%i2,	%o5
	ldsb	[%l7 + 0x0B],	%i7
	ldx	[%l7 + 0x28],	%i0
	stb	%i6,	[%l7 + 0x2A]
	std	%f6,	[%l7 + 0x48]
	and	%l5,	0x138B,	%o3
	fone	%f12
	movvc	%xcc,	%l1,	%i5
	movcs	%icc,	%l3,	%i3
	udivcc	%o1,	0x13FF,	%i4
	sllx	%g2,	0x17,	%o7
	fmovrdlez	%g4,	%f22,	%f20
	movcc	%xcc,	%o4,	%g1
	edge16ln	%g5,	%l4,	%i1
	fmovsle	%xcc,	%f21,	%f17
	fpack32	%f6,	%f30,	%f14
	save %o0, %l6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g6,	%o6,	%l0
	fsrc2	%f2,	%f10
	move	%xcc,	%g3,	%g7
	srlx	%l2,	0x11,	%i2
	smul	%o5,	%i7,	%i0
	alignaddr	%i6,	%o3,	%l1
	alignaddrl	%i5,	%l3,	%i3
	sub	%o1,	%i4,	%l5
	smulcc	%g2,	0x0A8E,	%g4
	movvc	%xcc,	%o7,	%o4
	edge8l	%g5,	%l4,	%g1
	udivcc	%i1,	0x1F3E,	%l6
	fandnot1	%f22,	%f4,	%f8
	movleu	%xcc,	%o0,	%o2
	fcmpd	%fcc3,	%f6,	%f30
	and	%o6,	%l0,	%g3
	ld	[%l7 + 0x70],	%f2
	fcmpgt32	%f14,	%f22,	%g6
	movge	%icc,	%l2,	%i2
	movre	%o5,	%i7,	%g7
	ldub	[%l7 + 0x18],	%i0
	fnot1	%f6,	%f2
	alignaddr	%i6,	%o3,	%i5
	alignaddrl	%l3,	%i3,	%l1
	array32	%i4,	%o1,	%g2
	fmovrsne	%l5,	%f11,	%f8
	array8	%o7,	%o4,	%g5
	array16	%g4,	%l4,	%g1
	subcc	%l6,	0x0052,	%o0
	fandnot2	%f6,	%f20,	%f2
	movvc	%icc,	%i1,	%o2
	lduh	[%l7 + 0x4E],	%l0
	alignaddr	%g3,	%g6,	%o6
	stx	%i2,	[%l7 + 0x20]
	ldub	[%l7 + 0x32],	%o5
	edge8ln	%l2,	%g7,	%i0
	edge8n	%i6,	%o3,	%i5
	subcc	%l3,	0x1FBC,	%i7
	movg	%icc,	%l1,	%i3
	sll	%o1,	0x05,	%g2
	srl	%i4,	%l5,	%o7
	movl	%icc,	%o4,	%g5
	movgu	%xcc,	%g4,	%g1
	mova	%xcc,	%l6,	%l4
	fornot2	%f28,	%f28,	%f18
	fmovdle	%xcc,	%f12,	%f22
	fmovrsgz	%i1,	%f1,	%f14
	array8	%o0,	%o2,	%l0
	subc	%g3,	%o6,	%g6
	move	%icc,	%o5,	%i2
	mulx	%l2,	%i0,	%g7
	movcs	%icc,	%o3,	%i6
	array16	%i5,	%i7,	%l1
	subccc	%i3,	%o1,	%l3
	fmovsne	%icc,	%f24,	%f12
	orn	%g2,	%l5,	%i4
	fpsub32	%f20,	%f4,	%f22
	andn	%o4,	0x17EE,	%g5
	andcc	%g4,	%g1,	%o7
	movrlz	%l4,	%l6,	%i1
	fmovdvc	%xcc,	%f2,	%f20
	movg	%icc,	%o2,	%l0
	edge32ln	%o0,	%g3,	%g6
	fxors	%f4,	%f29,	%f29
	st	%f8,	[%l7 + 0x20]
	fmovrdgez	%o5,	%f6,	%f6
	ldd	[%l7 + 0x60],	%f2
	fsrc1s	%f12,	%f21
	fmovdg	%icc,	%f10,	%f24
	ldub	[%l7 + 0x2B],	%i2
	alignaddr	%l2,	%i0,	%g7
	fcmps	%fcc2,	%f11,	%f5
	movpos	%xcc,	%o3,	%i6
	movne	%icc,	%o6,	%i5
	sra	%i7,	0x16,	%i3
	sll	%o1,	%l1,	%l3
	movrlz	%g2,	%l5,	%o4
	fmovrde	%i4,	%f0,	%f8
	or	%g4,	%g5,	%g1
	edge16l	%l4,	%o7,	%l6
	movn	%icc,	%i1,	%l0
	orcc	%o2,	0x00A4,	%o0
	nop
	set	0x72, %g7
	sth	%g6,	[%l7 + %g7]
	array8	%g3,	%o5,	%i2
	movgu	%icc,	%l2,	%g7
	alignaddr	%o3,	%i6,	%o6
	sra	%i0,	%i7,	%i5
	array8	%i3,	%l1,	%l3
	mova	%icc,	%o1,	%g2
	sub	%l5,	0x0954,	%o4
	sdiv	%i4,	0x0E92,	%g4
	fsrc2	%f8,	%f10
	movne	%icc,	%g5,	%l4
	lduw	[%l7 + 0x28],	%g1
	edge32ln	%o7,	%l6,	%i1
	addcc	%o2,	%o0,	%l0
	fpsub32s	%f12,	%f16,	%f17
	edge8ln	%g3,	%o5,	%g6
	sllx	%i2,	0x03,	%l2
	subccc	%o3,	0x05C2,	%i6
	udivcc	%o6,	0x1B0F,	%g7
	edge16	%i7,	%i5,	%i0
	ldx	[%l7 + 0x60],	%i3
	ldub	[%l7 + 0x5F],	%l1
	ldsh	[%l7 + 0x74],	%o1
	lduw	[%l7 + 0x78],	%g2
	fmovdvs	%icc,	%f31,	%f6
	fmul8x16al	%f23,	%f28,	%f12
	ldsh	[%l7 + 0x38],	%l3
	edge32l	%o4,	%l5,	%g4
	movrgez	%i4,	%g5,	%g1
	ldd	[%l7 + 0x30],	%f8
	fmovrsne	%l4,	%f15,	%f24
	srax	%l6,	%o7,	%i1
	movg	%xcc,	%o0,	%o2
	movneg	%xcc,	%g3,	%l0
	sub	%g6,	0x17C5,	%i2
	alignaddr	%l2,	%o5,	%o3
	fmovsle	%xcc,	%f0,	%f0
	alignaddr	%o6,	%g7,	%i7
	stw	%i5,	[%l7 + 0x40]
	fmovspos	%icc,	%f3,	%f11
	fpackfix	%f22,	%f19
	orncc	%i6,	0x15E5,	%i3
	srl	%i0,	0x01,	%l1
	xnorcc	%o1,	%l3,	%o4
	movpos	%xcc,	%g2,	%g4
	movneg	%xcc,	%i4,	%l5
	mulscc	%g1,	0x02F9,	%l4
	ld	[%l7 + 0x1C],	%f3
	movleu	%icc,	%g5,	%l6
	andncc	%o7,	%i1,	%o0
	array16	%o2,	%g3,	%g6
	movcs	%xcc,	%i2,	%l2
	addc	%o5,	%o3,	%l0
	stx	%o6,	[%l7 + 0x40]
	srlx	%i7,	%i5,	%i6
	movle	%icc,	%i3,	%g7
	st	%f17,	[%l7 + 0x60]
	fabsd	%f10,	%f4
	fmovs	%f26,	%f25
	fsrc2	%f20,	%f10
	movvs	%xcc,	%i0,	%l1
	movle	%icc,	%l3,	%o4
	fxors	%f25,	%f3,	%f8
	fnot2	%f16,	%f14
	edge8l	%o1,	%g2,	%i4
	mulscc	%l5,	0x1B8E,	%g4
	movleu	%icc,	%l4,	%g5
	fpsub16	%f0,	%f0,	%f26
	std	%f4,	[%l7 + 0x20]
	edge8l	%g1,	%l6,	%i1
	fmovdcs	%xcc,	%f5,	%f5
	bshuffle	%f14,	%f10,	%f28
	fmuld8ulx16	%f21,	%f3,	%f14
	fmovsne	%xcc,	%f13,	%f23
	xnor	%o7,	%o0,	%o2
	srax	%g6,	%g3,	%l2
	sethi	0x1244,	%i2
	fmovscc	%icc,	%f10,	%f14
	andcc	%o3,	%l0,	%o5
	edge16l	%o6,	%i5,	%i6
	edge8n	%i7,	%i3,	%g7
	movrgez	%i0,	%l1,	%l3
	stw	%o1,	[%l7 + 0x28]
	std	%f0,	[%l7 + 0x68]
	stw	%o4,	[%l7 + 0x38]
	movn	%icc,	%g2,	%i4
	ldd	[%l7 + 0x48],	%f20
	sdivx	%g4,	0x034E,	%l5
	nop
	set	0x50, %o1
	std	%f22,	[%l7 + %o1]
	sir	0x1A89
	edge8n	%g5,	%g1,	%l6
	faligndata	%f28,	%f12,	%f28
	edge8	%i1,	%l4,	%o7
	addccc	%o2,	0x1D7D,	%o0
	ldsw	[%l7 + 0x78],	%g3
	smul	%g6,	0x09A8,	%i2
	smul	%o3,	0x1F64,	%l2
	umulcc	%o5,	%o6,	%i5
	edge16l	%i6,	%i7,	%i3
	sir	0x0163
	srax	%l0,	0x09,	%g7
	subcc	%l1,	0x1A2B,	%i0
	and	%o1,	%l3,	%o4
	xnor	%i4,	%g4,	%g2
	edge16ln	%g5,	%l5,	%l6
	ldub	[%l7 + 0x68],	%g1
	movvc	%xcc,	%l4,	%o7
	movg	%icc,	%o2,	%i1
	udivx	%g3,	0x003F,	%o0
	fmovdg	%xcc,	%f12,	%f27
	fcmple32	%f2,	%f24,	%g6
	xnor	%o3,	%l2,	%i2
	ldub	[%l7 + 0x72],	%o5
	srax	%i5,	0x17,	%i6
	smul	%o6,	%i3,	%i7
	srl	%g7,	0x02,	%l1
	sra	%i0,	0x15,	%l0
	sdivx	%l3,	0x18FC,	%o4
	movgu	%xcc,	%o1,	%g4
	alignaddrl	%i4,	%g2,	%g5
	alignaddrl	%l6,	%g1,	%l4
	sir	0x0921
	xnorcc	%o7,	0x19B8,	%o2
	movrlz	%i1,	%g3,	%l5
	ldsw	[%l7 + 0x58],	%g6
	edge16l	%o0,	%o3,	%i2
	umulcc	%o5,	0x0D67,	%l2
	andncc	%i6,	%o6,	%i5
	sethi	0x0DAF,	%i7
	fmovdn	%xcc,	%f6,	%f21
	udiv	%i3,	0x107A,	%g7
	edge32ln	%i0,	%l0,	%l1
	ldsb	[%l7 + 0x32],	%l3
	ldub	[%l7 + 0x69],	%o1
	edge16l	%g4,	%o4,	%i4
	xnorcc	%g2,	%l6,	%g1
	sllx	%g5,	%l4,	%o2
	subcc	%o7,	%i1,	%g3
	udivcc	%g6,	0x079B,	%o0
	edge16l	%o3,	%l5,	%o5
	ldsb	[%l7 + 0x48],	%l2
	faligndata	%f26,	%f8,	%f30
	addcc	%i6,	0x1E31,	%o6
	mova	%xcc,	%i2,	%i7
	ldx	[%l7 + 0x38],	%i3
	fcmpeq32	%f14,	%f30,	%i5
	movgu	%icc,	%g7,	%l0
	xor	%l1,	%l3,	%i0
	andncc	%g4,	%o1,	%o4
	fmovrdgz	%g2,	%f10,	%f20
	st	%f27,	[%l7 + 0x7C]
	srl	%l6,	%g1,	%g5
	edge8ln	%i4,	%o2,	%l4
	edge32l	%i1,	%g3,	%g6
	edge16l	%o0,	%o7,	%l5
	bshuffle	%f28,	%f0,	%f16
	edge32l	%o3,	%o5,	%i6
	for	%f16,	%f20,	%f0
	nop
	set	0x4B, %g6
	ldub	[%l7 + %g6],	%o6
	movneg	%xcc,	%l2,	%i2
	array16	%i3,	%i5,	%i7
	smulcc	%l0,	%g7,	%l1
	fnand	%f28,	%f24,	%f18
	move	%icc,	%l3,	%g4
	fpsub16	%f14,	%f30,	%f10
	udivx	%o1,	0x0409,	%o4
	restore %i0, 0x0AE0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g1,	%g2,	%g5
	movrlz	%i4,	0x110,	%o2
	movn	%xcc,	%l4,	%g3
	array16	%g6,	%o0,	%o7
	movvs	%xcc,	%l5,	%o3
	movre	%o5,	%i1,	%i6
	movrlez	%l2,	0x04A,	%i2
	edge8n	%i3,	%o6,	%i5
	fmovrdlz	%l0,	%f14,	%f6
	ldx	[%l7 + 0x48],	%g7
	stw	%l1,	[%l7 + 0x1C]
	alignaddrl	%l3,	%i7,	%g4
	udivcc	%o1,	0x1284,	%o4
	stx	%i0,	[%l7 + 0x40]
	movrne	%g1,	0x05E,	%l6
	st	%f5,	[%l7 + 0x70]
	udiv	%g5,	0x14D0,	%g2
	movrgz	%i4,	%o2,	%g3
	ldsb	[%l7 + 0x56],	%g6
	fmovse	%icc,	%f8,	%f25
	mova	%xcc,	%o0,	%o7
	movg	%xcc,	%l5,	%o3
	sll	%o5,	%i1,	%i6
	mulx	%l2,	%i2,	%i3
	edge8ln	%l4,	%o6,	%l0
	orncc	%g7,	0x0888,	%l1
	fnand	%f0,	%f8,	%f16
	sdivx	%i5,	0x0BBC,	%i7
	movrgz	%g4,	%o1,	%o4
	movre	%i0,	0x060,	%g1
	fmovdvc	%xcc,	%f28,	%f24
	ldd	[%l7 + 0x08],	%f10
	subccc	%l6,	0x099E,	%l3
	movle	%icc,	%g2,	%g5
	edge32n	%o2,	%g3,	%i4
	stb	%g6,	[%l7 + 0x36]
	fcmpgt16	%f8,	%f8,	%o7
	movleu	%xcc,	%o0,	%o3
	or	%l5,	%i1,	%i6
	save %o5, %l2, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x60],	%i2
	movrlez	%l4,	0x21B,	%o6
	move	%icc,	%l0,	%l1
	xnorcc	%i5,	%g7,	%g4
	addcc	%i7,	0x0FCC,	%o4
	fmovsvs	%xcc,	%f9,	%f6
	edge32	%i0,	%o1,	%g1
	edge16ln	%l6,	%l3,	%g5
	fcmpes	%fcc3,	%f7,	%f9
	fmovrslez	%o2,	%f31,	%f28
	movge	%xcc,	%g2,	%g3
	andncc	%i4,	%o7,	%g6
	movcs	%icc,	%o0,	%o3
	mova	%xcc,	%l5,	%i6
	edge8n	%o5,	%i1,	%i2
	sdivcc	%i3,	0x1941,	%l2
	movrlz	%l4,	%o6,	%l0
	fmovdn	%xcc,	%f5,	%f23
	movg	%xcc,	%l1,	%g7
	ldsb	[%l7 + 0x23],	%i5
	sth	%g4,	[%l7 + 0x66]
	fmovrslez	%o4,	%f21,	%f23
	fmovrde	%i0,	%f4,	%f14
	srlx	%o1,	0x13,	%i7
	fzeros	%f19
	ldsb	[%l7 + 0x51],	%g1
	fmovspos	%icc,	%f28,	%f17
	fnot2	%f8,	%f2
	sethi	0x1C53,	%l6
	xnorcc	%l3,	%g5,	%o2
	movg	%xcc,	%g2,	%i4
	orcc	%o7,	%g6,	%g3
	orncc	%o0,	0x0A8B,	%o3
	movrne	%i6,	%o5,	%l5
	fmovsg	%icc,	%f22,	%f2
	smulcc	%i2,	0x0030,	%i1
	st	%f26,	[%l7 + 0x2C]
	movrgz	%i3,	0x36A,	%l2
	xnor	%l4,	%l0,	%o6
	andn	%g7,	0x1312,	%i5
	sllx	%g4,	0x05,	%o4
	ldx	[%l7 + 0x40],	%l1
	fcmpeq16	%f20,	%f2,	%i0
	orcc	%o1,	%g1,	%l6
	fnot1s	%f17,	%f29
	movrgz	%i7,	0x34C,	%l3
	mulscc	%o2,	0x1DE7,	%g2
	movpos	%xcc,	%i4,	%g5
	fcmpd	%fcc1,	%f22,	%f16
	stw	%g6,	[%l7 + 0x14]
	fmovrde	%g3,	%f22,	%f30
	movleu	%xcc,	%o7,	%o3
	lduw	[%l7 + 0x1C],	%i6
	fmovda	%xcc,	%f10,	%f20
	movneg	%xcc,	%o5,	%o0
	fmovdn	%xcc,	%f0,	%f19
	movpos	%xcc,	%l5,	%i2
	fcmple32	%f14,	%f30,	%i1
	movvs	%icc,	%i3,	%l4
	addc	%l2,	0x05E5,	%l0
	move	%xcc,	%o6,	%i5
	movl	%icc,	%g7,	%o4
	umulcc	%l1,	%i0,	%g4
	umul	%o1,	0x12FF,	%g1
	umulcc	%l6,	0x0942,	%l3
	udivx	%o2,	0x0B23,	%i7
	xorcc	%g2,	%i4,	%g5
	alignaddr	%g6,	%o7,	%o3
	ldsh	[%l7 + 0x7C],	%g3
	fmovrslz	%i6,	%f1,	%f25
	lduw	[%l7 + 0x74],	%o5
	and	%l5,	%i2,	%o0
	udiv	%i1,	0x1816,	%i3
	edge16	%l4,	%l2,	%o6
	fornot1	%f24,	%f30,	%f12
	xnor	%l0,	0x1BE9,	%g7
	subc	%o4,	0x0E1A,	%i5
	fxor	%f0,	%f18,	%f22
	array8	%l1,	%g4,	%i0
	stx	%o1,	[%l7 + 0x18]
	sdivx	%l6,	0x112F,	%l3
	ldd	[%l7 + 0x10],	%f20
	smulcc	%o2,	%g1,	%i7
	array8	%g2,	%i4,	%g5
	or	%o7,	%g6,	%g3
	lduh	[%l7 + 0x4C],	%o3
	add	%o5,	%i6,	%l5
	umulcc	%i2,	%i1,	%i3
	edge8n	%o0,	%l2,	%o6
	array32	%l0,	%g7,	%l4
	edge32ln	%i5,	%o4,	%g4
	srl	%l1,	%o1,	%i0
	popc	0x19D5,	%l3
	move	%icc,	%o2,	%g1
	ldub	[%l7 + 0x68],	%l6
	fcmpeq16	%f0,	%f8,	%g2
	movrne	%i4,	%g5,	%o7
	movpos	%icc,	%g6,	%i7
	array32	%g3,	%o5,	%o3
	stw	%i6,	[%l7 + 0x2C]
	lduh	[%l7 + 0x7A],	%l5
	srax	%i2,	0x1B,	%i3
	sth	%o0,	[%l7 + 0x20]
	fmovrde	%l2,	%f0,	%f18
	sllx	%i1,	0x1B,	%o6
	siam	0x0
	movgu	%xcc,	%l0,	%g7
	udivcc	%l4,	0x1504,	%i5
	siam	0x4
	stb	%g4,	[%l7 + 0x5D]
	ldd	[%l7 + 0x20],	%f10
	edge8	%o4,	%o1,	%l1
	orncc	%l3,	0x1C28,	%i0
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	fnegs	%f8,	%f15
	add	%l6,	%g2,	%g5
	sdivcc	%o7,	0x0D6F,	%i4
	edge16ln	%i7,	%g3,	%g6
	fpsub16s	%f2,	%f9,	%f27
	addc	%o5,	%i6,	%l5
	movge	%icc,	%o3,	%i2
	fmovrsne	%i3,	%f24,	%f4
	edge8ln	%l2,	%i1,	%o6
	lduw	[%l7 + 0x44],	%o0
	sub	%l0,	%l4,	%g7
	edge8	%i5,	%g4,	%o1
	array32	%o4,	%l1,	%l3
	ldsh	[%l7 + 0x68],	%i0
	fmovrsgz	%g1,	%f3,	%f22
	edge32l	%o2,	%l6,	%g2
	fmul8ulx16	%f30,	%f12,	%f2
	umul	%g5,	%i4,	%o7
	ldd	[%l7 + 0x78],	%i6
	ldub	[%l7 + 0x5C],	%g3
	smulcc	%g6,	0x0518,	%o5
	fcmped	%fcc1,	%f4,	%f16
	mova	%icc,	%i6,	%o3
	sir	0x0F16
	umul	%i2,	0x1E25,	%l5
	sdivcc	%i3,	0x0754,	%i1
	sllx	%o6,	0x1F,	%o0
	srlx	%l0,	%l4,	%g7
	ldsh	[%l7 + 0x22],	%l2
	and	%i5,	0x13A0,	%g4
	nop
	set	0x68, %o5
	std	%f2,	[%l7 + %o5]
	movcs	%icc,	%o1,	%o4
	edge16n	%l1,	%l3,	%i0
	fmovrdgz	%o2,	%f4,	%f18
	udivx	%g1,	0x1742,	%l6
	sdivx	%g2,	0x1550,	%g5
	fpackfix	%f18,	%f15
	movgu	%icc,	%i4,	%o7
	edge8n	%g3,	%g6,	%o5
	edge8l	%i7,	%i6,	%i2
	edge16n	%o3,	%l5,	%i3
	fmovdne	%xcc,	%f15,	%f25
	movrgez	%o6,	%i1,	%l0
	array32	%o0,	%l4,	%g7
	movrlz	%l2,	%i5,	%o1
	edge16l	%g4,	%l1,	%o4
	fmovrse	%i0,	%f7,	%f6
	xorcc	%o2,	0x05AA,	%g1
	umulcc	%l3,	0x1025,	%g2
	fmovrdne	%g5,	%f14,	%f16
	umul	%i4,	%o7,	%l6
	stx	%g3,	[%l7 + 0x20]
	alignaddr	%o5,	%i7,	%i6
	edge32l	%i2,	%o3,	%l5
	movneg	%icc,	%g6,	%o6
	subcc	%i1,	0x16F1,	%l0
	udiv	%i3,	0x171C,	%l4
	stb	%o0,	[%l7 + 0x49]
	alignaddrl	%g7,	%l2,	%i5
	orncc	%o1,	0x1801,	%l1
	lduw	[%l7 + 0x24],	%o4
	fmovsge	%xcc,	%f7,	%f7
	stb	%g4,	[%l7 + 0x64]
	stx	%i0,	[%l7 + 0x40]
	sll	%g1,	0x08,	%o2
	movrlez	%g2,	0x3BE,	%l3
	add	%i4,	0x0C18,	%g5
	ldx	[%l7 + 0x70],	%l6
	movrne	%g3,	0x257,	%o5
	addc	%o7,	%i7,	%i2
	movleu	%xcc,	%o3,	%l5
	fmovdle	%icc,	%f31,	%f0
	smulcc	%i6,	0x192F,	%o6
	nop
	set	0x4C, %i7
	lduw	[%l7 + %i7],	%i1
	udivcc	%g6,	0x0A8C,	%l0
	stx	%i3,	[%l7 + 0x60]
	fmovsvc	%icc,	%f14,	%f25
	movrgez	%l4,	0x301,	%o0
	mulscc	%l2,	0x1965,	%g7
	movre	%i5,	0x0A1,	%l1
	ldsh	[%l7 + 0x6C],	%o4
	array32	%g4,	%o1,	%g1
	ldsh	[%l7 + 0x68],	%o2
	move	%icc,	%i0,	%l3
	edge16	%i4,	%g5,	%l6
	fmovsl	%xcc,	%f7,	%f29
	fmovscc	%icc,	%f26,	%f7
	edge8l	%g3,	%o5,	%g2
	fone	%f2
	umulcc	%i7,	%i2,	%o7
	edge16l	%o3,	%l5,	%o6
	edge32ln	%i6,	%g6,	%l0
	array32	%i1,	%i3,	%l4
	addcc	%o0,	0x133C,	%g7
	std	%f12,	[%l7 + 0x48]
	subcc	%i5,	0x1FDE,	%l1
	smul	%o4,	0x1BF2,	%g4
	edge32ln	%o1,	%l2,	%g1
	ldd	[%l7 + 0x58],	%f0
	orcc	%o2,	%i0,	%l3
	fandnot2s	%f15,	%f12,	%f27
	edge8n	%i4,	%l6,	%g5
	alignaddr	%g3,	%g2,	%o5
	sra	%i2,	%o7,	%o3
	fmovdl	%xcc,	%f28,	%f22
	fmovde	%icc,	%f3,	%f19
	stw	%l5,	[%l7 + 0x20]
	movre	%o6,	%i6,	%i7
	smul	%l0,	%i1,	%g6
	edge32l	%l4,	%o0,	%i3
	and	%g7,	0x0668,	%i5
	movrne	%l1,	%o4,	%o1
	movge	%icc,	%g4,	%g1
	movcc	%xcc,	%o2,	%i0
	movrgez	%l3,	%l2,	%i4
	andn	%g5,	%l6,	%g2
	fpack32	%f28,	%f22,	%f20
	add	%g3,	%i2,	%o7
	array16	%o3,	%l5,	%o5
	edge16	%o6,	%i7,	%l0
	smulcc	%i6,	%g6,	%l4
	fxors	%f10,	%f28,	%f28
	array8	%o0,	%i1,	%i3
	movcs	%icc,	%i5,	%g7
	alignaddr	%l1,	%o4,	%o1
	fexpand	%f19,	%f16
	fmovdn	%xcc,	%f8,	%f29
	movne	%xcc,	%g4,	%o2
	xorcc	%g1,	0x1073,	%l3
	udivx	%i0,	0x1223,	%l2
	movvc	%xcc,	%i4,	%l6
	edge16n	%g2,	%g5,	%g3
	addc	%i2,	%o7,	%l5
	addcc	%o3,	%o5,	%o6
	andcc	%l0,	0x197E,	%i7
	nop
	set	0x28, %l3
	ldx	[%l7 + %l3],	%g6
	fnors	%f29,	%f24,	%f16
	movleu	%icc,	%i6,	%l4
	smul	%o0,	%i3,	%i1
	fmul8x16al	%f8,	%f31,	%f16
	ldsh	[%l7 + 0x16],	%i5
	fpadd32s	%f6,	%f27,	%f15
	array32	%g7,	%o4,	%o1
	movrne	%g4,	0x39A,	%o2
	save %l1, %g1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l2,	0x0F74,	%l3
	fmovdn	%xcc,	%f18,	%f26
	movle	%xcc,	%i4,	%l6
	edge8l	%g5,	%g2,	%i2
	mulscc	%o7,	0x0210,	%l5
	andn	%o3,	0x043D,	%o5
	movrlez	%o6,	0x21E,	%g3
	array32	%i7,	%g6,	%l0
	sll	%i6,	0x17,	%l4
	edge8n	%o0,	%i3,	%i5
	movl	%icc,	%i1,	%o4
	movrne	%g7,	%o1,	%o2
	ldx	[%l7 + 0x10],	%g4
	movn	%icc,	%l1,	%i0
	orcc	%g1,	%l2,	%l3
	movg	%xcc,	%i4,	%g5
	ldub	[%l7 + 0x18],	%l6
	fcmpeq16	%f22,	%f8,	%g2
	st	%f28,	[%l7 + 0x10]
	movrlez	%i2,	%o7,	%l5
	movpos	%icc,	%o3,	%o6
	fmovdneg	%icc,	%f0,	%f8
	orcc	%g3,	%o5,	%i7
	ldsw	[%l7 + 0x4C],	%l0
	movpos	%xcc,	%i6,	%l4
	fmovda	%xcc,	%f18,	%f22
	xor	%o0,	0x1548,	%g6
	movl	%icc,	%i3,	%i1
	movvc	%icc,	%o4,	%i5
	save %g7, 0x0B5F, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g4,	%l1,	%i0
	fors	%f18,	%f29,	%f20
	edge32	%g1,	%l2,	%l3
	sll	%i4,	%o2,	%l6
	stw	%g2,	[%l7 + 0x10]
	movge	%xcc,	%g5,	%i2
	fmovdvc	%icc,	%f6,	%f0
	sllx	%o7,	%l5,	%o6
	ldsb	[%l7 + 0x79],	%o3
	fmovrsgz	%g3,	%f0,	%f14
	andncc	%i7,	%l0,	%o5
	fmovsgu	%icc,	%f12,	%f22
	fand	%f18,	%f8,	%f22
	movre	%l4,	%i6,	%g6
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%o0
	movle	%xcc,	%i1,	%i3
	movre	%i5,	0x186,	%g7
	fnor	%f12,	%f0,	%f2
	srax	%o1,	0x1B,	%o4
	alignaddr	%g4,	%l1,	%g1
	stx	%l2,	[%l7 + 0x10]
	fpackfix	%f24,	%f6
	fmovscc	%icc,	%f20,	%f12
	fcmpes	%fcc1,	%f8,	%f15
	or	%l3,	0x1A0B,	%i0
	orncc	%i4,	%o2,	%l6
	stb	%g2,	[%l7 + 0x7A]
	xnorcc	%g5,	%o7,	%l5
	fxors	%f9,	%f18,	%f10
	ldsw	[%l7 + 0x0C],	%o6
	edge32	%o3,	%i2,	%i7
	fmovdle	%icc,	%f19,	%f28
	sra	%l0,	%g3,	%l4
	andcc	%i6,	%g6,	%o0
	andncc	%o5,	%i3,	%i5
	movvc	%xcc,	%g7,	%i1
	alignaddrl	%o1,	%g4,	%o4
	popc	0x03CD,	%l1
	addc	%l2,	0x0E28,	%l3
	xor	%g1,	%i0,	%o2
	nop
	set	0x68, %o4
	stx	%l6,	[%l7 + %o4]
	sdivcc	%i4,	0x1FB5,	%g2
	sdivcc	%g5,	0x128D,	%o7
	and	%o6,	0x01E8,	%l5
	fpsub32	%f10,	%f30,	%f26
	or	%o3,	%i2,	%i7
	ldd	[%l7 + 0x08],	%f14
	xnor	%g3,	0x10E8,	%l0
	fcmpeq16	%f0,	%f24,	%i6
	xnor	%g6,	0x1912,	%o0
	addcc	%l4,	0x1707,	%i3
	array16	%i5,	%o5,	%g7
	ldd	[%l7 + 0x68],	%i0
	fmovsa	%icc,	%f10,	%f3
	fpack32	%f0,	%f28,	%f24
	stx	%g4,	[%l7 + 0x78]
	std	%f14,	[%l7 + 0x30]
	siam	0x2
	add	%o4,	0x1B54,	%l1
	edge16l	%o1,	%l2,	%l3
	srlx	%i0,	0x0E,	%o2
	fmovsvs	%icc,	%f6,	%f3
	fnand	%f22,	%f20,	%f22
	edge32n	%g1,	%i4,	%g2
	fnors	%f3,	%f23,	%f22
	udivcc	%g5,	0x1EE9,	%l6
	fone	%f6
	umul	%o7,	%o6,	%l5
	sub	%i2,	%o3,	%g3
	movrgez	%l0,	0x386,	%i7
	nop
	set	0x6A, %o7
	ldsh	[%l7 + %o7],	%i6
	fmul8x16al	%f18,	%f3,	%f8
	fandnot1	%f12,	%f28,	%f14
	xor	%g6,	%l4,	%i3
	edge32l	%i5,	%o0,	%g7
	sra	%i1,	%o5,	%o4
	sub	%l1,	%g4,	%l2
	ldsb	[%l7 + 0x39],	%o1
	xnorcc	%i0,	0x0E5D,	%o2
	movre	%g1,	0x0A1,	%l3
	addcc	%i4,	%g5,	%l6
	and	%g2,	%o6,	%o7
	addc	%i2,	0x0A27,	%o3
	andncc	%l5,	%g3,	%i7
	stb	%l0,	[%l7 + 0x28]
	xnorcc	%i6,	%g6,	%l4
	edge16ln	%i5,	%i3,	%g7
	movgu	%icc,	%i1,	%o0
	subcc	%o5,	0x0108,	%o4
	fcmpgt32	%f26,	%f0,	%l1
	siam	0x3
	movrne	%l2,	%g4,	%o1
	stx	%o2,	[%l7 + 0x08]
	fmovsvc	%icc,	%f1,	%f21
	edge16n	%i0,	%g1,	%i4
	edge16	%l3,	%l6,	%g5
	std	%f8,	[%l7 + 0x18]
	mulscc	%g2,	0x17F8,	%o7
	orn	%i2,	%o3,	%o6
	fand	%f26,	%f20,	%f18
	ldub	[%l7 + 0x23],	%l5
	movrgez	%g3,	%l0,	%i7
	and	%g6,	%i6,	%i5
	movcs	%xcc,	%l4,	%i3
	edge32ln	%i1,	%g7,	%o5
	orn	%o4,	%l1,	%l2
	ldx	[%l7 + 0x40],	%g4
	mulscc	%o0,	%o2,	%o1
	fandnot2	%f24,	%f20,	%f28
	umulcc	%i0,	%i4,	%l3
	movleu	%icc,	%l6,	%g1
	umul	%g5,	0x1E1A,	%g2
	sllx	%o7,	0x00,	%o3
	fpadd16	%f0,	%f10,	%f6
	sra	%o6,	0x10,	%l5
	pdist	%f22,	%f0,	%f20
	ldsb	[%l7 + 0x0F],	%g3
	edge8ln	%l0,	%i2,	%i7
	orncc	%i6,	%i5,	%l4
	alignaddr	%g6,	%i3,	%g7
	xorcc	%o5,	%o4,	%i1
	restore %l1, 0x1DAE, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l2, 0x0385, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f4,	%f15,	%f3
	movre	%o2,	0x31D,	%i0
	sdivx	%i4,	0x1A92,	%l3
	fnot2	%f8,	%f10
	umul	%l6,	0x0DAE,	%o1
	fnot1s	%f27,	%f3
	xor	%g1,	0x0196,	%g5
	movg	%icc,	%o7,	%g2
	edge16n	%o3,	%o6,	%g3
	edge8ln	%l0,	%i2,	%l5
	fcmps	%fcc1,	%f8,	%f11
	edge8	%i7,	%i6,	%i5
	xnor	%l4,	0x0013,	%g6
	sll	%g7,	%i3,	%o5
	udivx	%i1,	0x01DB,	%o4
	edge16ln	%g4,	%l1,	%l2
	fmovdgu	%icc,	%f24,	%f30
	fands	%f23,	%f17,	%f23
	smulcc	%o0,	%i0,	%i4
	sth	%o2,	[%l7 + 0x2A]
	edge8l	%l6,	%l3,	%o1
	array32	%g1,	%g5,	%o7
	edge16l	%o3,	%o6,	%g3
	alignaddr	%g2,	%l0,	%i2
	sdivcc	%l5,	0x17EE,	%i6
	fmovrslz	%i7,	%f7,	%f13
	movre	%i5,	0x3FD,	%l4
	edge16ln	%g7,	%g6,	%o5
	popc	%i1,	%o4
	edge16n	%g4,	%i3,	%l1
	andn	%o0,	%l2,	%i4
	fcmpes	%fcc0,	%f11,	%f16
	ldub	[%l7 + 0x6A],	%i0
	udivcc	%l6,	0x1013,	%l3
	ldub	[%l7 + 0x69],	%o2
	srl	%g1,	%o1,	%g5
	movrne	%o7,	0x3ED,	%o3
	st	%f14,	[%l7 + 0x50]
	movle	%icc,	%o6,	%g3
	subccc	%g2,	%l0,	%i2
	fmovrsne	%l5,	%f2,	%f27
	edge8l	%i6,	%i7,	%l4
	edge32l	%i5,	%g6,	%o5
	mulscc	%g7,	%i1,	%o4
	mulscc	%g4,	%i3,	%o0
	sth	%l2,	[%l7 + 0x36]
	movpos	%xcc,	%i4,	%i0
	fmovdle	%icc,	%f21,	%f4
	sethi	0x0D40,	%l6
	fmovrde	%l1,	%f12,	%f4
	fmovdcs	%xcc,	%f9,	%f27
	udivcc	%o2,	0x19E9,	%l3
	subc	%g1,	0x1A87,	%o1
	udivcc	%o7,	0x0234,	%o3
	subcc	%g5,	0x0831,	%g3
	andncc	%g2,	%l0,	%o6
	add	%i2,	%l5,	%i7
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f14
	ldd	[%l7 + 0x60],	%f10
	edge32n	%i6,	%i5,	%l4
	or	%g6,	%o5,	%i1
	xorcc	%g7,	0x18A6,	%o4
	sir	0x0A2C
	fmovdneg	%icc,	%f5,	%f26
	srax	%g4,	0x14,	%i3
	fnot1s	%f30,	%f9
	fmovdn	%xcc,	%f21,	%f8
	edge32l	%l2,	%i4,	%i0
	sllx	%o0,	%l6,	%l1
	sdivcc	%l3,	0x1F0C,	%g1
	stw	%o2,	[%l7 + 0x7C]
	alignaddrl	%o1,	%o3,	%o7
	fandnot1	%f20,	%f16,	%f0
	xnorcc	%g3,	0x0A0D,	%g5
	ldsh	[%l7 + 0x6A],	%l0
	andncc	%o6,	%g2,	%l5
	sra	%i2,	0x06,	%i7
	andcc	%i5,	%i6,	%l4
	movge	%icc,	%g6,	%i1
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	udiv	%g7,	0x1DBB,	%g4
	alignaddrl	%l2,	%i4,	%i3
	xnorcc	%i0,	0x0187,	%o0
	edge16	%l1,	%l3,	%g1
	movrgez	%l6,	0x3D8,	%o2
	fxnor	%f10,	%f12,	%f6
	movvc	%xcc,	%o1,	%o3
	movvs	%icc,	%o7,	%g5
	movrne	%g3,	0x376,	%l0
	subcc	%o6,	0x1825,	%l5
	fmovrdgez	%i2,	%f20,	%f30
	edge32	%g2,	%i7,	%i6
	fmovsneg	%xcc,	%f10,	%f22
	fmovdle	%xcc,	%f31,	%f4
	restore %l4, 0x0310, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i1,	%g6
	ldsw	[%l7 + 0x30],	%o5
	array16	%g7,	%g4,	%o4
	subcc	%l2,	%i4,	%i0
	xorcc	%i3,	0x17B3,	%l1
	edge32l	%o0,	%l3,	%l6
	edge8ln	%g1,	%o2,	%o3
	orncc	%o7,	%o1,	%g3
	edge32ln	%g5,	%o6,	%l5
	andncc	%l0,	%g2,	%i7
	edge16l	%i2,	%l4,	%i6
	movne	%xcc,	%i5,	%g6
	fpmerge	%f8,	%f7,	%f28
	addc	%i1,	%o5,	%g4
	fcmpeq16	%f10,	%f18,	%o4
	fpsub16	%f0,	%f12,	%f26
	sllx	%l2,	0x17,	%g7
	movrlz	%i4,	%i0,	%i3
	movrne	%l1,	%l3,	%l6
	nop
	set	0x38, %l1
	sth	%o0,	[%l7 + %l1]
	smulcc	%o2,	0x109D,	%o3
	sth	%o7,	[%l7 + 0x70]
	fcmple32	%f4,	%f18,	%o1
	sllx	%g3,	0x16,	%g1
	fmovdn	%icc,	%f28,	%f23
	srax	%g5,	0x19,	%o6
	ldd	[%l7 + 0x10],	%l0
	ldsb	[%l7 + 0x48],	%l5
	fmovrsne	%i7,	%f17,	%f7
	edge8n	%g2,	%i2,	%l4
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	addcc	%o5,	%i1,	%o4
	fcmpeq32	%f24,	%f0,	%g4
	fmovde	%icc,	%f16,	%f31
	ld	[%l7 + 0x70],	%f19
	mulx	%l2,	%g7,	%i4
	mova	%icc,	%i3,	%i0
	smulcc	%l3,	0x0CE4,	%l6
	fmul8x16al	%f23,	%f19,	%f22
	movge	%icc,	%o0,	%l1
	andn	%o3,	0x0ACE,	%o7
	ldsb	[%l7 + 0x7F],	%o2
	edge32n	%g3,	%g1,	%g5
	edge8n	%o1,	%o6,	%l5
	movpos	%icc,	%i7,	%g2
	xor	%i2,	%l4,	%i5
	srax	%i6,	0x1F,	%g6
	fnands	%f8,	%f17,	%f29
	movrgz	%l0,	0x0AD,	%o5
	smul	%i1,	%o4,	%g4
	array32	%l2,	%i4,	%i3
	movge	%xcc,	%i0,	%g7
	array8	%l6,	%l3,	%l1
	sdivcc	%o0,	0x184B,	%o3
	ldub	[%l7 + 0x0E],	%o2
	smul	%g3,	0x0F58,	%g1
	udiv	%g5,	0x1E8A,	%o1
	fmovdleu	%xcc,	%f4,	%f22
	movvs	%xcc,	%o7,	%o6
	xorcc	%i7,	%g2,	%l5
	ldx	[%l7 + 0x20],	%i2
	add	%i5,	0x1EB5,	%i6
	fpsub32s	%f11,	%f21,	%f12
	orncc	%g6,	%l0,	%l4
	ldd	[%l7 + 0x28],	%i0
	addc	%o5,	0x113D,	%g4
	xnorcc	%o4,	0x04E6,	%l2
	fcmpes	%fcc1,	%f31,	%f29
	udivx	%i4,	0x142F,	%i0
	subc	%i3,	%g7,	%l3
	fsrc2	%f18,	%f26
	movcs	%icc,	%l6,	%o0
	fmul8x16au	%f2,	%f21,	%f6
	xorcc	%o3,	%l1,	%g3
	edge32	%o2,	%g1,	%o1
	sdiv	%o7,	0x0B24,	%o6
	xnor	%g5,	%i7,	%g2
	fxors	%f14,	%f20,	%f25
	fornot1s	%f18,	%f19,	%f26
	fcmpne32	%f2,	%f2,	%i2
	sub	%i5,	%i6,	%g6
	movle	%xcc,	%l5,	%l4
	movrgz	%i1,	0x3C9,	%o5
	lduh	[%l7 + 0x68],	%l0
	movrgez	%g4,	%l2,	%i4
	stx	%o4,	[%l7 + 0x40]
	srax	%i3,	%g7,	%l3
	mulx	%i0,	%l6,	%o3
	fpackfix	%f16,	%f6
	fmovrsgez	%o0,	%f29,	%f24
	movl	%icc,	%l1,	%g3
	movpos	%icc,	%o2,	%g1
	srax	%o7,	%o1,	%o6
	fcmpeq32	%f20,	%f24,	%i7
	andcc	%g2,	%g5,	%i5
	andcc	%i2,	%i6,	%g6
	movvc	%icc,	%l5,	%i1
	nop
	set	0x18, %o6
	ldx	[%l7 + %o6],	%l4
	srax	%o5,	0x09,	%g4
	fpadd16	%f2,	%f2,	%f6
	movrgez	%l0,	%i4,	%o4
	fmul8x16al	%f4,	%f22,	%f0
	fmovse	%icc,	%f10,	%f10
	restore %i3, 0x0868, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f31,	%f17,	%f4
	fxnor	%f6,	%f28,	%f22
	fabss	%f8,	%f22
	movvs	%icc,	%l2,	%l3
	sethi	0x1DB2,	%l6
	fnot1	%f6,	%f6
	subccc	%i0,	0x1DBB,	%o0
	edge32ln	%l1,	%o3,	%g3
	fmovdle	%xcc,	%f23,	%f7
	fandnot1s	%f10,	%f30,	%f15
	srax	%o2,	0x00,	%g1
	andcc	%o7,	%o6,	%o1
	edge32	%g2,	%i7,	%g5
	srax	%i2,	0x1C,	%i6
	fmovscs	%xcc,	%f18,	%f8
	fmovde	%xcc,	%f23,	%f10
	udivcc	%g6,	0x0B1C,	%l5
	smul	%i5,	0x0896,	%l4
	or	%i1,	0x0D6C,	%g4
	movvs	%icc,	%l0,	%o5
	ldub	[%l7 + 0x4F],	%i4
	udivcc	%i3,	0x147C,	%g7
	movrgz	%o4,	0x014,	%l3
	movpos	%xcc,	%l6,	%i0
	xnorcc	%l2,	%o0,	%l1
	mova	%icc,	%g3,	%o2
	fpmerge	%f27,	%f1,	%f8
	movvs	%icc,	%o3,	%o7
	edge32l	%o6,	%o1,	%g1
	xor	%i7,	0x1C02,	%g2
	subccc	%i2,	0x1029,	%g5
	movge	%icc,	%g6,	%i6
	fmovsneg	%icc,	%f14,	%f14
	alignaddr	%l5,	%i5,	%i1
	array16	%g4,	%l4,	%o5
	edge8l	%i4,	%i3,	%l0
	addcc	%g7,	%l3,	%o4
	edge16ln	%i0,	%l2,	%o0
	fsrc2s	%f16,	%f17
	sllx	%l6,	%l1,	%o2
	movcs	%xcc,	%o3,	%o7
	movle	%icc,	%o6,	%g3
	fcmpd	%fcc2,	%f22,	%f14
	srlx	%o1,	0x1F,	%i7
	movneg	%icc,	%g2,	%g1
	popc	%i2,	%g5
	edge16n	%g6,	%l5,	%i5
	subccc	%i1,	0x0ABC,	%g4
	ldsw	[%l7 + 0x30],	%i6
	addccc	%o5,	0x044B,	%i4
	sdivcc	%l4,	0x1F15,	%l0
	ldd	[%l7 + 0x60],	%f18
	fnot1s	%f29,	%f6
	fornot1	%f18,	%f0,	%f30
	ld	[%l7 + 0x60],	%f23
	ldsw	[%l7 + 0x74],	%i3
	ldsh	[%l7 + 0x3A],	%g7
	ldub	[%l7 + 0x7B],	%l3
	stb	%o4,	[%l7 + 0x47]
	movleu	%icc,	%l2,	%i0
	mulscc	%l6,	0x1169,	%l1
	fmovdge	%icc,	%f17,	%f11
	mova	%icc,	%o0,	%o2
	move	%xcc,	%o7,	%o3
	movvs	%icc,	%o6,	%o1
	std	%f20,	[%l7 + 0x18]
	fnands	%f13,	%f12,	%f23
	fmovrdgz	%i7,	%f14,	%f22
	sdiv	%g2,	0x1962,	%g1
	edge16	%g3,	%g5,	%g6
	edge16ln	%i2,	%l5,	%i1
	alignaddrl	%g4,	%i5,	%o5
	fnot1	%f28,	%f0
	stw	%i4,	[%l7 + 0x68]
	edge16ln	%i6,	%l4,	%l0
	sub	%g7,	0x1877,	%l3
	fcmpd	%fcc0,	%f22,	%f16
	subccc	%o4,	%i3,	%i0
	edge8	%l6,	%l2,	%l1
	movge	%icc,	%o2,	%o0
	fmovscc	%icc,	%f15,	%f3
	sth	%o7,	[%l7 + 0x56]
	movn	%xcc,	%o3,	%o1
	fmovsvc	%icc,	%f21,	%f31
	edge8ln	%i7,	%o6,	%g1
	ld	[%l7 + 0x4C],	%f4
	xnor	%g3,	%g2,	%g5
	sllx	%i2,	%l5,	%g6
	movg	%icc,	%i1,	%g4
	std	%f6,	[%l7 + 0x60]
	movrlz	%o5,	0x0DD,	%i4
	lduh	[%l7 + 0x1E],	%i6
	stb	%l4,	[%l7 + 0x4E]
	srax	%l0,	%i5,	%g7
	sllx	%o4,	%i3,	%l3
	ldsh	[%l7 + 0x54],	%i0
	sethi	0x0BCB,	%l2
	array32	%l1,	%o2,	%l6
	udivx	%o7,	0x019B,	%o0
	ldub	[%l7 + 0x26],	%o1
	fmovda	%xcc,	%f12,	%f16
	edge16ln	%o3,	%o6,	%i7
	edge32	%g3,	%g1,	%g5
	edge16ln	%g2,	%i2,	%l5
	array32	%g6,	%i1,	%g4
	ldd	[%l7 + 0x70],	%f6
	smul	%i4,	%o5,	%i6
	nop
	set	0x18, %o0
	stw	%l0,	[%l7 + %o0]
	fcmpgt32	%f26,	%f26,	%i5
	movrne	%l4,	0x04A,	%o4
	edge8n	%g7,	%l3,	%i3
	edge32l	%l2,	%l1,	%o2
	fsrc2	%f18,	%f22
	movre	%i0,	%l6,	%o7
	sdiv	%o1,	0x00D5,	%o0
	movrgz	%o3,	%i7,	%g3
	fcmpgt16	%f8,	%f22,	%g1
	fmovrsne	%o6,	%f10,	%f10
	move	%icc,	%g5,	%i2
	umulcc	%g2,	0x01D0,	%l5
	fexpand	%f8,	%f4
	edge32ln	%i1,	%g6,	%i4
	sdivcc	%g4,	0x0BD1,	%o5
	stw	%l0,	[%l7 + 0x60]
	fmovsgu	%icc,	%f0,	%f13
	move	%icc,	%i6,	%i5
	fsrc2	%f30,	%f6
	movrlz	%l4,	%o4,	%g7
	edge8ln	%i3,	%l2,	%l1
	stb	%l3,	[%l7 + 0x09]
	mulx	%i0,	%l6,	%o2
	smul	%o1,	%o7,	%o0
	ldsw	[%l7 + 0x60],	%o3
	subcc	%g3,	%i7,	%o6
	array32	%g1,	%i2,	%g5
	edge16l	%l5,	%i1,	%g6
	sll	%i4,	0x0C,	%g2
	fnot2s	%f1,	%f19
	xorcc	%g4,	0x0823,	%o5
	sdiv	%l0,	0x1133,	%i5
	orncc	%i6,	0x1EC8,	%l4
	movneg	%icc,	%g7,	%i3
	subc	%o4,	%l2,	%l1
	fmovsge	%xcc,	%f21,	%f8
	array16	%i0,	%l6,	%o2
	edge16ln	%l3,	%o1,	%o7
	edge16	%o3,	%g3,	%o0
	udivcc	%o6,	0x0145,	%g1
	fmovsg	%icc,	%f7,	%f7
	ldsb	[%l7 + 0x4F],	%i2
	movpos	%icc,	%g5,	%l5
	movleu	%icc,	%i7,	%i1
	udivx	%g6,	0x01C3,	%i4
	st	%f25,	[%l7 + 0x74]
	andcc	%g2,	%g4,	%l0
	popc	%i5,	%o5
	udivx	%l4,	0x1247,	%i6
	fpadd16	%f12,	%f24,	%f2
	fpsub32	%f28,	%f18,	%f12
	fxor	%f6,	%f26,	%f30
	andcc	%g7,	%i3,	%o4
	edge32n	%l1,	%i0,	%l2
	save %l6, %o2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o7,	[%l7 + 0x40]
	edge32n	%o1,	%g3,	%o3
	addcc	%o0,	0x089A,	%o6
	fcmpeq32	%f8,	%f10,	%g1
	xnor	%i2,	%g5,	%i7
	andn	%l5,	%i1,	%g6
	mulscc	%g2,	%i4,	%l0
	movge	%icc,	%i5,	%o5
	fxors	%f23,	%f4,	%f22
	ldx	[%l7 + 0x48],	%g4
	umulcc	%l4,	0x1344,	%i6
	st	%f8,	[%l7 + 0x34]
	fmuld8ulx16	%f14,	%f3,	%f18
	fmovdcs	%xcc,	%f5,	%f2
	edge16l	%g7,	%i3,	%l1
	movne	%icc,	%o4,	%l2
	sllx	%i0,	0x12,	%o2
	fands	%f9,	%f12,	%f28
	movleu	%xcc,	%l6,	%l3
	ldub	[%l7 + 0x3B],	%o1
	andn	%o7,	0x0653,	%o3
	fmul8x16al	%f22,	%f22,	%f4
	ldub	[%l7 + 0x25],	%g3
	fmovsvc	%icc,	%f8,	%f20
	fmovsvc	%icc,	%f29,	%f27
	movl	%xcc,	%o6,	%o0
	mulscc	%g1,	0x111F,	%i2
	srax	%g5,	%i7,	%i1
	edge16l	%l5,	%g6,	%g2
	umulcc	%i4,	%i5,	%l0
	andn	%g4,	0x19BA,	%o5
	fmovs	%f6,	%f5
	umul	%i6,	%g7,	%i3
	edge32n	%l1,	%o4,	%l2
	array32	%l4,	%i0,	%o2
	stx	%l6,	[%l7 + 0x18]
	fmovsne	%icc,	%f22,	%f19
	addccc	%l3,	0x10F5,	%o1
	subc	%o7,	%o3,	%g3
	umulcc	%o6,	%o0,	%g1
	sdivx	%i2,	0x08C0,	%i7
	fpsub32	%f16,	%f10,	%f20
	lduw	[%l7 + 0x7C],	%i1
	andn	%g5,	%g6,	%l5
	move	%xcc,	%g2,	%i5
	addcc	%i4,	0x17BF,	%g4
	xor	%o5,	0x12E4,	%i6
	edge8n	%l0,	%i3,	%g7
	array16	%l1,	%o4,	%l4
	orncc	%i0,	0x06B2,	%l2
	sub	%l6,	0x0808,	%o2
	subccc	%o1,	%l3,	%o7
	fpadd16	%f14,	%f8,	%f6
	sdivcc	%o3,	0x0271,	%o6
	sdivx	%g3,	0x07B2,	%g1
	ldub	[%l7 + 0x39],	%i2
	fcmped	%fcc1,	%f2,	%f26
	orcc	%o0,	0x182A,	%i1
	fcmpeq16	%f0,	%f20,	%i7
	ld	[%l7 + 0x58],	%f24
	movpos	%icc,	%g5,	%g6
	movle	%xcc,	%g2,	%i5
	fornot1s	%f6,	%f5,	%f6
	movrlz	%l5,	0x226,	%g4
	mulscc	%i4,	0x1426,	%i6
	movg	%icc,	%o5,	%l0
	edge32l	%i3,	%l1,	%g7
	srlx	%o4,	%l4,	%i0
	addcc	%l6,	0x1BD9,	%o2
	edge32ln	%o1,	%l2,	%o7
	fmovdleu	%xcc,	%f6,	%f28
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	fsrc2	%f0,	%f24
	sra	%o6,	0x05,	%g1
	ldd	[%l7 + 0x48],	%i2
	sir	0x1469
	movge	%icc,	%g3,	%o0
	edge8	%i7,	%g5,	%g6
	movrne	%g2,	0x26A,	%i1
	sdiv	%l5,	0x1448,	%g4
	edge8l	%i5,	%i4,	%o5
	fcmpgt16	%f8,	%f26,	%l0
	subcc	%i6,	0x1A46,	%i3
	sdivcc	%g7,	0x1BA3,	%o4
	movcc	%xcc,	%l1,	%l4
	restore %i0, %o2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%icc,	%f17,	%f15
	sra	%o1,	%o7,	%o3
	fmovrslez	%l3,	%f1,	%f10
	fnegd	%f18,	%f20
	edge16	%l2,	%o6,	%g1
	movne	%xcc,	%i2,	%o0
	move	%icc,	%g3,	%g5
	subc	%g6,	0x0A5B,	%i7
	lduw	[%l7 + 0x44],	%i1
	fmovdn	%xcc,	%f20,	%f19
	ld	[%l7 + 0x0C],	%f18
	lduh	[%l7 + 0x72],	%g2
	std	%f18,	[%l7 + 0x08]
	movne	%icc,	%l5,	%i5
	or	%i4,	0x16D5,	%o5
	addccc	%l0,	%i6,	%g4
	addcc	%g7,	0x0220,	%i3
	movrne	%l1,	%o4,	%l4
	movrlez	%i0,	0x3E5,	%l6
	mova	%icc,	%o1,	%o2
	ldd	[%l7 + 0x58],	%f6
	fmovda	%icc,	%f4,	%f8
	stb	%o3,	[%l7 + 0x6E]
	edge32ln	%o7,	%l2,	%o6
	std	%f16,	[%l7 + 0x60]
	mulscc	%l3,	0x1DAD,	%i2
	fnegs	%f22,	%f29
	movrne	%g1,	0x363,	%o0
	edge8	%g5,	%g3,	%i7
	faligndata	%f8,	%f22,	%f10
	sth	%g6,	[%l7 + 0x2A]
	sdiv	%i1,	0x07E5,	%l5
	udiv	%i5,	0x09BC,	%g2
	movvc	%icc,	%o5,	%i4
	sllx	%i6,	%g4,	%l0
	edge8l	%i3,	%g7,	%l1
	fmovrse	%o4,	%f29,	%f10
	udivcc	%i0,	0x023B,	%l4
	fmovs	%f11,	%f15
	movne	%xcc,	%l6,	%o2
	edge32ln	%o3,	%o7,	%o1
	stx	%l2,	[%l7 + 0x58]
	andncc	%l3,	%o6,	%g1
	movg	%icc,	%i2,	%o0
	srlx	%g5,	0x1C,	%i7
	edge16	%g3,	%i1,	%g6
	st	%f22,	[%l7 + 0x6C]
	fmul8x16au	%f8,	%f14,	%f24
	fandnot1	%f24,	%f10,	%f4
	subccc	%i5,	%l5,	%g2
	movg	%xcc,	%i4,	%i6
	fnegd	%f10,	%f20
	stx	%g4,	[%l7 + 0x40]
	edge32l	%l0,	%i3,	%g7
	fmovsgu	%xcc,	%f21,	%f1
	sdiv	%o5,	0x16F0,	%o4
	edge16ln	%i0,	%l4,	%l6
	fandnot2	%f8,	%f28,	%f26
	sllx	%o2,	%o3,	%l1
	fmovdneg	%icc,	%f5,	%f6
	move	%icc,	%o1,	%l2
	movg	%xcc,	%o7,	%l3
	ldsh	[%l7 + 0x20],	%o6
	stb	%i2,	[%l7 + 0x51]
	fzeros	%f3
	movne	%xcc,	%o0,	%g1
	nop
	set	0x48, %i5
	ldsh	[%l7 + %i5],	%i7
	udivx	%g5,	0x00ED,	%g3
	edge16	%i1,	%i5,	%g6
	fpmerge	%f3,	%f14,	%f22
	orncc	%g2,	0x10BB,	%i4
	xorcc	%i6,	0x0467,	%l5
	fmovdneg	%xcc,	%f10,	%f21
	add	%l0,	0x1BC0,	%g4
	xorcc	%g7,	%o5,	%i3
	edge16n	%i0,	%l4,	%o4
	ldub	[%l7 + 0x11],	%o2
	movneg	%xcc,	%l6,	%l1
	fcmple32	%f24,	%f24,	%o3
	fnegs	%f26,	%f27
	addc	%l2,	%o1,	%o7
	orn	%o6,	%i2,	%l3
	fmovdge	%xcc,	%f5,	%f25
	fpsub16s	%f5,	%f25,	%f13
	movrne	%g1,	0x206,	%o0
	fmovspos	%icc,	%f6,	%f29
	movrlz	%g5,	0x191,	%g3
	movge	%icc,	%i1,	%i7
	ldsb	[%l7 + 0x1A],	%i5
	fsrc2s	%f7,	%f20
	smul	%g6,	%i4,	%g2
	fabss	%f26,	%f9
	sllx	%i6,	0x0F,	%l5
	fmovsl	%xcc,	%f21,	%f20
	faligndata	%f8,	%f14,	%f28
	ldd	[%l7 + 0x70],	%l0
	move	%icc,	%g4,	%g7
	edge32ln	%o5,	%i0,	%i3
	ldsh	[%l7 + 0x5C],	%l4
	udiv	%o4,	0x1C6B,	%l6
	srlx	%o2,	%l1,	%l2
	movvc	%icc,	%o1,	%o7
	xorcc	%o3,	%i2,	%o6
	movrne	%g1,	0x129,	%l3
	fabss	%f2,	%f17
	move	%icc,	%o0,	%g3
	fornot2	%f16,	%f4,	%f20
	movpos	%xcc,	%i1,	%i7
	movvc	%xcc,	%g5,	%g6
	srl	%i5,	%g2,	%i4
	orn	%l5,	%l0,	%g4
	movrlz	%g7,	0x207,	%i6
	nop
	set	0x30, %l5
	std	%f6,	[%l7 + %l5]
	for	%f8,	%f30,	%f26
	sdivx	%i0,	0x07AA,	%o5
	fmovrslez	%i3,	%f1,	%f18
	fpadd32s	%f13,	%f5,	%f11
	subcc	%l4,	%o4,	%l6
	edge16l	%l1,	%l2,	%o1
	subccc	%o7,	%o2,	%o3
	movrlz	%o6,	%i2,	%l3
	alignaddrl	%o0,	%g3,	%g1
	edge32ln	%i7,	%g5,	%g6
	movne	%xcc,	%i5,	%g2
	edge32l	%i1,	%i4,	%l0
	orcc	%g4,	0x1ECE,	%l5
	movn	%icc,	%i6,	%g7
	edge16	%i0,	%i3,	%l4
	ldsh	[%l7 + 0x38],	%o4
	andn	%o5,	0x0A00,	%l6
	andncc	%l1,	%o1,	%o7
	stw	%l2,	[%l7 + 0x24]
	array8	%o2,	%o3,	%o6
	andcc	%l3,	0x14A3,	%o0
	fornot2	%f16,	%f6,	%f28
	movcs	%icc,	%g3,	%i2
	srlx	%i7,	0x15,	%g1
	fnegs	%f11,	%f3
	sir	0x1A54
	edge8ln	%g5,	%g6,	%g2
	sub	%i5,	0x0EFB,	%i4
	movrgez	%l0,	0x2B6,	%i1
	movrlez	%g4,	%l5,	%g7
	fornot2s	%f13,	%f10,	%f3
	sdivx	%i0,	0x0216,	%i3
	subcc	%l4,	%i6,	%o4
	alignaddr	%l6,	%l1,	%o5
	movl	%icc,	%o7,	%o1
	sll	%l2,	0x0B,	%o3
	mulscc	%o2,	0x0812,	%l3
	pdist	%f20,	%f8,	%f12
	fnands	%f24,	%f16,	%f0
	fornot1s	%f11,	%f20,	%f13
	sub	%o0,	%g3,	%i2
	movrgez	%o6,	%g1,	%g5
	movne	%xcc,	%i7,	%g2
	fmovrdgez	%i5,	%f24,	%f26
	lduw	[%l7 + 0x58],	%i4
	xorcc	%g6,	%i1,	%l0
	xor	%g4,	%l5,	%g7
	sub	%i0,	%i3,	%i6
	andcc	%l4,	%l6,	%o4
	nop
	set	0x30, %i3
	ldd	[%l7 + %i3],	%f8
	edge8ln	%o5,	%l1,	%o7
	fmul8ulx16	%f10,	%f14,	%f14
	fcmpne16	%f24,	%f18,	%o1
	fsrc1s	%f15,	%f2
	save %o3, 0x1426, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%l3,	%o2
	ldsb	[%l7 + 0x1B],	%g3
	andn	%i2,	0x0AF4,	%o0
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	edge32ln	%g1,	%i7,	%i5
	fmuld8sux16	%f6,	%f20,	%f10
	sth	%g2,	[%l7 + 0x4C]
	fmovdcs	%icc,	%f29,	%f28
	lduh	[%l7 + 0x60],	%g6
	edge16	%i1,	%l0,	%g4
	edge16ln	%l5,	%g7,	%i4
	fmovdvc	%icc,	%f9,	%f24
	smulcc	%i0,	0x1D70,	%i6
	lduh	[%l7 + 0x66],	%l4
	sth	%l6,	[%l7 + 0x34]
	udiv	%o4,	0x0CA0,	%o5
	edge8l	%l1,	%i3,	%o1
	edge8	%o7,	%l2,	%l3
	addcc	%o3,	0x09E5,	%o2
	andn	%i2,	%o0,	%o6
	movre	%g3,	%g5,	%i7
	sllx	%g1,	%i5,	%g6
	movn	%xcc,	%i1,	%l0
	fsrc1s	%f27,	%f18
	sdiv	%g4,	0x1BA4,	%l5
	nop
	set	0x30, %l6
	ldsh	[%l7 + %l6],	%g7
	fmovsge	%xcc,	%f0,	%f13
	fcmpne16	%f2,	%f28,	%g2
	fmovdcs	%icc,	%f31,	%f25
	movcc	%icc,	%i4,	%i6
	movre	%i0,	0x2B4,	%l6
	movrlz	%l4,	%o5,	%o4
	subcc	%i3,	%o1,	%l1
	andcc	%l2,	%l3,	%o7
	move	%xcc,	%o2,	%o3
	fmovdgu	%xcc,	%f18,	%f13
	movle	%icc,	%o0,	%i2
	movcc	%xcc,	%g3,	%o6
	movre	%i7,	0x384,	%g1
	save %g5, 0x10FA, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i1,	%i5,	%g4
	ldub	[%l7 + 0x0F],	%l5
	srax	%l0,	%g2,	%g7
	edge32ln	%i4,	%i0,	%l6
	ldsb	[%l7 + 0x7C],	%i6
	udivx	%l4,	0x0C5D,	%o5
	movle	%xcc,	%i3,	%o1
	fmovdpos	%icc,	%f13,	%f31
	umulcc	%o4,	%l1,	%l3
	andncc	%l2,	%o7,	%o3
	movcc	%icc,	%o0,	%i2
	addccc	%o2,	%o6,	%i7
	edge32n	%g3,	%g5,	%g1
	movre	%g6,	0x0F7,	%i5
	orcc	%g4,	0x1B4A,	%l5
	popc	%i1,	%g2
	sllx	%l0,	%i4,	%g7
	ldd	[%l7 + 0x50],	%i0
	subc	%i6,	0x1793,	%l6
	andcc	%o5,	0x1379,	%i3
	mova	%icc,	%o1,	%o4
	save %l4, 0x0916, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l3,	%o7,	%o3
	sll	%l2,	%o0,	%i2
	edge8n	%o6,	%o2,	%g3
	fmul8ulx16	%f16,	%f2,	%f0
	fcmpeq16	%f22,	%f22,	%i7
	movge	%xcc,	%g5,	%g1
	sdivcc	%g6,	0x0081,	%g4
	xnorcc	%i5,	0x124D,	%i1
	fmovsleu	%xcc,	%f22,	%f6
	movcc	%xcc,	%g2,	%l0
	movneg	%xcc,	%i4,	%g7
	fcmple16	%f0,	%f18,	%i0
	srax	%i6,	%l6,	%l5
	fmovrdlz	%i3,	%f22,	%f16
	xnor	%o5,	%o4,	%l4
	fmovrsne	%o1,	%f21,	%f12
	edge8l	%l3,	%o7,	%o3
	fmovsg	%icc,	%f12,	%f24
	or	%l2,	%l1,	%i2
	movvs	%icc,	%o0,	%o6
	array32	%o2,	%i7,	%g5
	movn	%icc,	%g1,	%g3
	lduh	[%l7 + 0x28],	%g6
	movpos	%xcc,	%g4,	%i1
	ldx	[%l7 + 0x18],	%g2
	sdivx	%i5,	0x0293,	%l0
	addc	%i4,	%g7,	%i0
	movl	%xcc,	%i6,	%l5
	subc	%l6,	0x0809,	%o5
	movvs	%icc,	%i3,	%o4
	andcc	%l4,	%o1,	%o7
	ldsw	[%l7 + 0x50],	%l3
	mova	%icc,	%l2,	%o3
	mulscc	%l1,	0x0BB7,	%i2
	movne	%xcc,	%o6,	%o2
	addccc	%i7,	%g5,	%o0
	edge32ln	%g3,	%g6,	%g1
	fcmpd	%fcc2,	%f16,	%f24
	srl	%i1,	0x1D,	%g2
	fmovrdlez	%i5,	%f18,	%f20
	fmovdvc	%icc,	%f17,	%f26
	srl	%l0,	%i4,	%g7
	fmul8sux16	%f2,	%f4,	%f20
	or	%i0,	%g4,	%l5
	movcc	%icc,	%i6,	%o5
	array16	%i3,	%o4,	%l6
	umul	%l4,	%o1,	%o7
	movne	%icc,	%l3,	%o3
	movrgz	%l2,	0x37A,	%i2
	lduw	[%l7 + 0x74],	%l1
	ldsw	[%l7 + 0x1C],	%o6
	fmovse	%xcc,	%f29,	%f26
	alignaddr	%i7,	%o2,	%g5
	mulx	%o0,	0x13DF,	%g3
	lduw	[%l7 + 0x70],	%g6
	sethi	0x1F8A,	%i1
	xnorcc	%g2,	%g1,	%l0
	udiv	%i5,	0x1235,	%g7
	sll	%i0,	%g4,	%i4
	fcmpgt16	%f6,	%f20,	%i6
	fnot1s	%f19,	%f13
	fpack32	%f16,	%f22,	%f2
	fmul8x16au	%f27,	%f2,	%f12
	movne	%xcc,	%o5,	%i3
	fcmpgt16	%f16,	%f28,	%o4
	edge32	%l6,	%l5,	%l4
	sth	%o7,	[%l7 + 0x6A]
	sethi	0x1CA4,	%o1
	array16	%l3,	%l2,	%o3
	sir	0x03F6
	ldx	[%l7 + 0x78],	%l1
	xnor	%i2,	0x18BD,	%o6
	movg	%icc,	%o2,	%g5
	fxnor	%f16,	%f22,	%f16
	addcc	%o0,	0x0FE3,	%i7
	edge8n	%g3,	%i1,	%g6
	movn	%xcc,	%g1,	%g2
	xorcc	%i5,	%g7,	%i0
	mulx	%l0,	0x0A2C,	%g4
	srax	%i6,	%i4,	%i3
	movrne	%o5,	0x0F4,	%l6
	movrlz	%o4,	0x142,	%l5
	alignaddrl	%o7,	%l4,	%l3
	movcc	%icc,	%l2,	%o3
	sethi	0x0E0D,	%l1
	srax	%i2,	0x0F,	%o6
	sdivcc	%o2,	0x0DBF,	%o1
	fmovse	%icc,	%f22,	%f27
	srlx	%g5,	0x0E,	%i7
	nop
	set	0x48, %i6
	lduh	[%l7 + %i6],	%o0
	mova	%xcc,	%i1,	%g3
	udivx	%g6,	0x1F8B,	%g2
	edge8n	%g1,	%i5,	%g7
	edge16ln	%i0,	%g4,	%i6
	movcs	%icc,	%i4,	%i3
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%o4
	stw	%l6,	[%l7 + 0x64]
	or	%o4,	0x0F74,	%l5
	edge8n	%l0,	%l4,	%l3
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%f20
	movcc	%icc,	%o7,	%l2
	alignaddrl	%l1,	%i2,	%o3
	fcmped	%fcc1,	%f24,	%f8
	sra	%o2,	%o6,	%o1
	mulscc	%g5,	%i7,	%i1
	array8	%o0,	%g3,	%g6
	fcmpgt16	%f16,	%f14,	%g2
	alignaddr	%g1,	%i5,	%g7
	movle	%xcc,	%i0,	%g4
	movrgez	%i6,	0x03E,	%i3
	movrlz	%o5,	0x2D2,	%i4
	fmovdg	%xcc,	%f20,	%f18
	ldsh	[%l7 + 0x5E],	%o4
	popc	0x19D3,	%l6
	movcs	%icc,	%l5,	%l4
	edge16	%l0,	%l3,	%o7
	ldsb	[%l7 + 0x7F],	%l2
	subccc	%l1,	%i2,	%o3
	fpsub32s	%f2,	%f4,	%f7
	smulcc	%o6,	%o1,	%g5
	fpsub16s	%f31,	%f18,	%f11
	edge8n	%i7,	%o2,	%o0
	fmovrslez	%g3,	%f3,	%f3
	udivx	%g6,	0x0251,	%g2
	edge16l	%i1,	%i5,	%g1
	udivx	%i0,	0x1E19,	%g7
	fmovsgu	%xcc,	%f18,	%f8
	andn	%g4,	0x0802,	%i3
	xnorcc	%i6,	%i4,	%o4
	alignaddrl	%o5,	%l6,	%l4
	movge	%xcc,	%l5,	%l0
	srl	%o7,	0x13,	%l3
	mulscc	%l1,	0x0913,	%l2
	movl	%icc,	%i2,	%o3
	save %o6, 0x1B03, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o1,	%o2,	%i7
	edge16	%o0,	%g6,	%g3
	movn	%icc,	%i1,	%i5
	ld	[%l7 + 0x10],	%f2
	edge32ln	%g2,	%i0,	%g1
	movg	%icc,	%g7,	%g4
	movrne	%i6,	0x335,	%i4
	movn	%icc,	%i3,	%o4
	mulscc	%o5,	0x0876,	%l6
	ldd	[%l7 + 0x40],	%l4
	edge32n	%l5,	%o7,	%l3
	udiv	%l1,	0x03B5,	%l0
	fmovrdne	%l2,	%f20,	%f6
	smul	%o3,	0x0EEA,	%o6
	srlx	%g5,	0x0A,	%i2
	fcmple32	%f8,	%f18,	%o2
	orn	%i7,	0x1C68,	%o0
	fmovsge	%xcc,	%f12,	%f12
	movrgez	%g6,	%g3,	%i1
	orn	%i5,	%g2,	%i0
	fmovd	%f20,	%f20
	andn	%o1,	0x181E,	%g1
	ldsh	[%l7 + 0x3A],	%g4
	movvc	%xcc,	%i6,	%i4
	movl	%xcc,	%g7,	%o4
	fornot2s	%f13,	%f19,	%f27
	fmul8x16al	%f7,	%f18,	%f26
	nop
	set	0x2A, %l2
	ldub	[%l7 + %l2],	%o5
	fmovdn	%icc,	%f15,	%f31
	srlx	%i3,	0x05,	%l4
	edge32l	%l6,	%l5,	%o7
	umulcc	%l3,	%l1,	%l2
	edge16ln	%l0,	%o3,	%o6
	fpsub32s	%f28,	%f27,	%f8
	movvc	%xcc,	%i2,	%o2
	ldd	[%l7 + 0x68],	%i6
	orn	%o0,	%g6,	%g3
	popc	%g5,	%i1
	fnot1	%f2,	%f10
	stb	%g2,	[%l7 + 0x32]
	fornot1	%f0,	%f20,	%f20
	edge32l	%i5,	%o1,	%g1
	movrlz	%i0,	0x1DE,	%i6
	sir	0x182D
	srax	%i4,	%g4,	%o4
	popc	%g7,	%i3
	mulx	%o5,	%l6,	%l5
	ld	[%l7 + 0x78],	%f12
	xor	%o7,	%l3,	%l4
	movvc	%xcc,	%l2,	%l0
	sir	0x16F4
	addc	%l1,	%o6,	%i2
	lduh	[%l7 + 0x7A],	%o2
	xorcc	%o3,	0x1109,	%i7
	fmovsleu	%xcc,	%f20,	%f3
	edge32l	%o0,	%g3,	%g5
	std	%f26,	[%l7 + 0x50]
	sth	%g6,	[%l7 + 0x30]
	fmovrse	%g2,	%f22,	%f0
	fcmple32	%f28,	%f18,	%i5
	fandnot1	%f20,	%f22,	%f12
	array8	%o1,	%i1,	%i0
	subc	%g1,	%i4,	%i6
	mova	%icc,	%g4,	%g7
	sir	0x1EB9
	faligndata	%f22,	%f30,	%f28
	ldub	[%l7 + 0x6D],	%i3
	movrgez	%o4,	%o5,	%l5
	fcmps	%fcc1,	%f14,	%f5
	movgu	%icc,	%o7,	%l3
	sra	%l6,	0x1D,	%l2
	lduw	[%l7 + 0x28],	%l4
	fcmple32	%f14,	%f28,	%l0
	ldsh	[%l7 + 0x34],	%o6
	stx	%i2,	[%l7 + 0x40]
	xnor	%l1,	0x01D2,	%o2
	fmovdpos	%icc,	%f16,	%f24
	ldsh	[%l7 + 0x14],	%o3
	edge32ln	%o0,	%g3,	%g5
	sllx	%g6,	%g2,	%i7
	ld	[%l7 + 0x58],	%f5
	subcc	%o1,	0x0110,	%i5
	or	%i1,	%g1,	%i0
	movrlez	%i6,	0x181,	%g4
	ldd	[%l7 + 0x78],	%g6
	movcc	%xcc,	%i4,	%i3
	ldsw	[%l7 + 0x08],	%o4
	edge16n	%l5,	%o7,	%o5
	or	%l3,	%l6,	%l2
	fmovrdlez	%l0,	%f0,	%f4
	fmul8x16au	%f19,	%f7,	%f10
	sllx	%o6,	0x07,	%i2
	edge32	%l1,	%l4,	%o3
	fsrc2	%f6,	%f2
	edge16l	%o2,	%g3,	%o0
	movrgz	%g5,	%g2,	%i7
	alignaddr	%g6,	%i5,	%i1
	fnegd	%f2,	%f14
	add	%o1,	0x05E7,	%i0
	save %i6, %g1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%g4,	%i4
	fcmpgt32	%f28,	%f0,	%i3
	fnor	%f22,	%f4,	%f18
	for	%f14,	%f2,	%f10
	movne	%xcc,	%o4,	%l5
	or	%o7,	%l3,	%o5
	umulcc	%l6,	%l2,	%l0
	fcmped	%fcc2,	%f2,	%f8
	movn	%icc,	%i2,	%l1
	lduh	[%l7 + 0x48],	%l4
	stb	%o3,	[%l7 + 0x5F]
	orncc	%o6,	%o2,	%o0
	subc	%g5,	%g2,	%g3
	subccc	%i7,	%i5,	%g6
	mulscc	%i1,	%o1,	%i6
	sethi	0x0688,	%g1
	fpadd32s	%f13,	%f21,	%f27
	movpos	%icc,	%i0,	%g4
	fcmpne32	%f16,	%f14,	%g7
	fornot1	%f12,	%f2,	%f24
	fornot1	%f4,	%f0,	%f28
	andncc	%i4,	%o4,	%i3
	andncc	%l5,	%l3,	%o7
	ldsw	[%l7 + 0x74],	%o5
	ldsh	[%l7 + 0x44],	%l6
	addcc	%l0,	%i2,	%l2
	fmovdleu	%xcc,	%f15,	%f27
	for	%f16,	%f22,	%f16
	or	%l1,	0x037D,	%o3
	fmul8sux16	%f6,	%f0,	%f24
	movrne	%o6,	%o2,	%l4
	nop
	set	0x20, %o2
	std	%f26,	[%l7 + %o2]
	fmovda	%icc,	%f5,	%f25
	ldd	[%l7 + 0x30],	%o0
	save %g5, %g2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i7,	0x1D17,	%g6
	subcc	%i5,	%o1,	%i6
	fmuld8sux16	%f2,	%f12,	%f18
	xorcc	%g1,	%i1,	%g4
	udivx	%i0,	0x12AB,	%g7
	edge32n	%o4,	%i4,	%i3
	nop
	set	0x5A, %g1
	lduh	[%l7 + %g1],	%l5
	sll	%l3,	0x1E,	%o7
	mulscc	%o5,	0x0506,	%l0
	movpos	%xcc,	%l6,	%l2
	andncc	%l1,	%i2,	%o6
	udivx	%o3,	0x0EB0,	%o2
	fand	%f8,	%f24,	%f16
	andn	%l4,	%g5,	%o0
	mulscc	%g3,	0x03D6,	%i7
	nop
	set	0x40, %g3
	lduh	[%l7 + %g3],	%g6
	fcmpgt32	%f12,	%f18,	%g2
	fcmpgt32	%f0,	%f20,	%i5
	fmovdgu	%icc,	%f22,	%f18
	fone	%f28
	fmovsle	%icc,	%f17,	%f12
	fmul8x16al	%f11,	%f13,	%f10
	movneg	%icc,	%i6,	%o1
	move	%icc,	%g1,	%i1
	fnot1	%f6,	%f18
	movl	%xcc,	%g4,	%g7
	andcc	%i0,	%i4,	%o4
	sdivx	%i3,	0x1B76,	%l5
	fmovsn	%xcc,	%f5,	%f26
	subccc	%l3,	0x0700,	%o5
	array32	%l0,	%l6,	%l2
	edge8	%o7,	%i2,	%l1
	ldub	[%l7 + 0x56],	%o6
	fcmped	%fcc0,	%f24,	%f0
	fxnors	%f26,	%f29,	%f13
	ldd	[%l7 + 0x58],	%o2
	stw	%o2,	[%l7 + 0x7C]
	sdivx	%l4,	0x13EF,	%g5
	restore %g3, %i7, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f6,	%f2,	%f0
	fzero	%f12
	fmuld8sux16	%f12,	%f19,	%f24
	sth	%g2,	[%l7 + 0x32]
	andn	%i5,	0x1340,	%o0
	or	%i6,	0x02B5,	%o1
	edge16n	%i1,	%g1,	%g4
	xnorcc	%g7,	%i0,	%i4
	fmovs	%f28,	%f25
	andcc	%o4,	%l5,	%i3
	fnor	%f2,	%f18,	%f6
	sdivx	%l3,	0x12A1,	%o5
	edge8	%l6,	%l0,	%l2
	edge16	%o7,	%i2,	%o6
	movvc	%icc,	%o3,	%l1
	and	%o2,	%g5,	%g3
	ldx	[%l7 + 0x40],	%i7
	edge8ln	%g6,	%g2,	%l4
	ldd	[%l7 + 0x70],	%o0
	subc	%i6,	%i5,	%i1
	st	%f22,	[%l7 + 0x20]
	edge32ln	%g1,	%o1,	%g7
	for	%f30,	%f2,	%f12
	andncc	%i0,	%g4,	%i4
	movrlz	%l5,	%o4,	%l3
	sub	%o5,	%i3,	%l6
	fcmps	%fcc2,	%f6,	%f2
	udiv	%l2,	0x0B28,	%l0
	srlx	%o7,	%i2,	%o3
	movrgez	%l1,	%o2,	%o6
	srl	%g3,	%i7,	%g6
	ldx	[%l7 + 0x68],	%g5
	srlx	%l4,	%o0,	%i6
	fmovdleu	%xcc,	%f29,	%f5
	movvs	%xcc,	%g2,	%i1
	addcc	%i5,	0x1C36,	%g1
	fmovsle	%xcc,	%f7,	%f3
	movneg	%xcc,	%o1,	%g7
	move	%xcc,	%g4,	%i0
	movne	%icc,	%l5,	%o4
	fnands	%f6,	%f12,	%f14
	fandnot1s	%f13,	%f29,	%f29
	sth	%i4,	[%l7 + 0x5A]
	fsrc2	%f22,	%f24
	subccc	%o5,	0x0E34,	%i3
	movvc	%icc,	%l3,	%l2
	edge16ln	%l0,	%l6,	%o7
	smulcc	%i2,	0x0573,	%l1
	movrne	%o2,	0x1D8,	%o3
	movcs	%xcc,	%g3,	%i7
	fnors	%f3,	%f1,	%f30
	mulscc	%o6,	%g6,	%l4
	udivx	%g5,	0x0045,	%o0
	edge32n	%g2,	%i6,	%i5
	fmovrslz	%g1,	%f24,	%f9
	or	%i1,	%g7,	%g4
	fxor	%f22,	%f24,	%f30
	edge8	%i0,	%l5,	%o4
	fmovrslez	%o1,	%f20,	%f10
	array8	%i4,	%o5,	%l3
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	edge8l	%o7,	%i2,	%l6
	edge16n	%l1,	%o2,	%o3
	sdivcc	%g3,	0x169B,	%i7
	ldsw	[%l7 + 0x68],	%g6
	orcc	%l4,	%g5,	%o6
	movleu	%icc,	%o0,	%i6
	movrne	%i5,	0x327,	%g1
	edge32l	%g2,	%i1,	%g7
	ldsw	[%l7 + 0x7C],	%g4
	fmovsa	%icc,	%f1,	%f12
	mova	%xcc,	%l5,	%i0
	subccc	%o1,	%o4,	%i4
	edge32	%l3,	%o5,	%i3
	ldx	[%l7 + 0x58],	%l2
	array8	%l0,	%i2,	%o7
	sra	%l6,	0x19,	%l1
	movre	%o2,	0x228,	%o3
	xnor	%g3,	0x028E,	%i7
	xorcc	%l4,	%g5,	%o6
	movcs	%xcc,	%o0,	%i6
	movn	%icc,	%g6,	%g1
	edge32l	%g2,	%i5,	%g7
	movrlez	%g4,	%i1,	%l5
	move	%icc,	%o1,	%o4
	ldd	[%l7 + 0x20],	%i0
	fmovsa	%icc,	%f25,	%f20
	fmovrdlez	%l3,	%f4,	%f10
	movne	%xcc,	%o5,	%i4
	nop
	set	0x79, %l4
	ldub	[%l7 + %l4],	%l2
	sub	%i3,	0x0341,	%i2
	fandnot1	%f26,	%f2,	%f20
	fmovdn	%xcc,	%f1,	%f1
	srlx	%o7,	0x09,	%l6
	ldsh	[%l7 + 0x64],	%l1
	fxnor	%f6,	%f12,	%f14
	movvs	%xcc,	%l0,	%o3
	sdivx	%o2,	0x1D76,	%g3
	stw	%i7,	[%l7 + 0x20]
	movpos	%xcc,	%l4,	%g5
	ldub	[%l7 + 0x5C],	%o6
	edge32	%o0,	%i6,	%g1
	ldd	[%l7 + 0x18],	%f8
	addcc	%g6,	%i5,	%g2
	movge	%xcc,	%g7,	%g4
	fsrc1	%f8,	%f0
	movg	%icc,	%l5,	%i1
	orcc	%o4,	%i0,	%l3
	andncc	%o1,	%o5,	%i4
	fmovsl	%xcc,	%f27,	%f22
	alignaddrl	%i3,	%l2,	%i2
	edge16l	%l6,	%l1,	%l0
	movne	%xcc,	%o3,	%o2
	fcmps	%fcc0,	%f7,	%f0
	fmovsleu	%icc,	%f28,	%f2
	mova	%icc,	%g3,	%o7
	add	%l4,	%i7,	%g5
	subcc	%o0,	%i6,	%g1
	fmovdgu	%xcc,	%f31,	%f16
	movg	%xcc,	%o6,	%i5
	move	%xcc,	%g6,	%g7
	sir	0x11D6
	st	%f7,	[%l7 + 0x44]
	movne	%icc,	%g2,	%g4
	fmovrdne	%i1,	%f6,	%f4
	and	%l5,	%i0,	%o4
	sethi	0x16E3,	%o1
	movgu	%xcc,	%o5,	%l3
	fnot1s	%f23,	%f28
	movgu	%xcc,	%i4,	%i3
	popc	0x1913,	%i2
	addccc	%l6,	0x0544,	%l2
	ldsh	[%l7 + 0x2E],	%l0
	fmovsge	%icc,	%f1,	%f12
	fxor	%f16,	%f20,	%f22
	edge16	%o3,	%o2,	%g3
	fmovrsne	%l1,	%f13,	%f31
	ldsw	[%l7 + 0x14],	%o7
	movg	%xcc,	%l4,	%g5
	ldd	[%l7 + 0x60],	%f20
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%i6
	sllx	%o0,	0x02,	%g1
	mulscc	%i6,	0x0944,	%o6
	st	%f12,	[%l7 + 0x54]
	nop
	set	0x4E, %i0
	ldsh	[%l7 + %i0],	%i5
	edge32n	%g7,	%g6,	%g4
	fmovdcc	%icc,	%f27,	%f6
	addc	%i1,	%g2,	%l5
	fmuld8sux16	%f14,	%f23,	%f16
	movge	%icc,	%i0,	%o1
	fandnot1s	%f18,	%f31,	%f25
	fmul8x16al	%f11,	%f5,	%f28
	ldub	[%l7 + 0x42],	%o4
	movleu	%xcc,	%l3,	%i4
	fmovdn	%xcc,	%f27,	%f25
	stw	%i3,	[%l7 + 0x08]
	save %i2, 0x046A, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%l2,	%o5
	sdivx	%l0,	0x1B84,	%o2
	movcc	%icc,	%o3,	%l1
	xor	%g3,	0x0F46,	%l4
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%o6
	edge8	%g5,	%o0,	%g1
	orn	%i7,	0x173B,	%i6
	edge8ln	%o6,	%g7,	%g6
	fmovrslz	%i5,	%f4,	%f28
	std	%f8,	[%l7 + 0x78]
	movneg	%icc,	%i1,	%g4
	xnorcc	%l5,	%i0,	%o1
	fxnor	%f22,	%f4,	%f16
	umul	%o4,	%g2,	%l3
	andncc	%i3,	%i4,	%i2
	movrlz	%l2,	%o5,	%l6
	alignaddrl	%l0,	%o2,	%l1
	umulcc	%g3,	%l4,	%o3
	lduw	[%l7 + 0x10],	%g5
	sethi	0x1045,	%o7
	ldub	[%l7 + 0x17],	%g1
	orncc	%i7,	%o0,	%i6
	ldd	[%l7 + 0x50],	%f6
	movvc	%xcc,	%g7,	%g6
	edge16n	%o6,	%i5,	%g4
	udiv	%l5,	0x0882,	%i1
	udivcc	%o1,	0x1B9F,	%i0
	srax	%o4,	%g2,	%l3
	movpos	%icc,	%i4,	%i3
	sethi	0x0105,	%i2
	movpos	%xcc,	%l2,	%o5
	stw	%l6,	[%l7 + 0x4C]
	andncc	%l0,	%l1,	%g3
	fmovde	%xcc,	%f24,	%f15
	edge16n	%o2,	%l4,	%g5
	fors	%f27,	%f20,	%f23
	array32	%o7,	%g1,	%o3
	udiv	%i7,	0x19C1,	%o0
	fexpand	%f30,	%f8
	and	%g7,	0x03E6,	%i6
	lduw	[%l7 + 0x60],	%o6
	addc	%g6,	0x1FAF,	%g4
	movrlez	%i5,	%l5,	%i1
	restore %o1, 0x1FE2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f16,	%f26,	%f4
	smulcc	%g2,	0x111B,	%l3
	sdivcc	%i4,	0x0D8B,	%i0
	lduw	[%l7 + 0x1C],	%i3
	nop
	set	0x30, %g5
	ldx	[%l7 + %g5],	%l2
	ldub	[%l7 + 0x56],	%i2
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	fexpand	%f20,	%f6
	siam	0x6
	save %l1, %o2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l4,	0x07A5,	%o7
	ldsh	[%l7 + 0x46],	%g5
	movl	%xcc,	%o3,	%i7
	orcc	%o0,	0x114D,	%g1
	andcc	%i6,	0x12B3,	%o6
	fmovscs	%xcc,	%f24,	%f28
	ldx	[%l7 + 0x50],	%g7
	fcmpeq32	%f10,	%f28,	%g4
	mova	%xcc,	%g6,	%l5
	movn	%xcc,	%i5,	%i1
	ldd	[%l7 + 0x40],	%o0
	srlx	%g2,	0x01,	%o4
	lduh	[%l7 + 0x10],	%i4
	edge32	%i0,	%l3,	%l2
	subcc	%i2,	0x1A3A,	%l6
	ld	[%l7 + 0x44],	%f19
	fmovdn	%icc,	%f17,	%f15
	movg	%xcc,	%o5,	%i3
	nop
	set	0x17, %g7
	ldub	[%l7 + %g7],	%l0
	edge32ln	%l1,	%g3,	%l4
	udiv	%o2,	0x0226,	%g5
	edge32	%o3,	%i7,	%o0
	sdivcc	%g1,	0x06E6,	%o7
	st	%f6,	[%l7 + 0x1C]
	fnand	%f24,	%f28,	%f26
	addc	%i6,	%g7,	%o6
	movrgez	%g4,	%g6,	%i5
	sdivcc	%l5,	0x0EFD,	%o1
	array32	%i1,	%g2,	%o4
	andn	%i0,	0x14ED,	%l3
	nop
	set	0x5A, %g2
	ldub	[%l7 + %g2],	%i4
	movrgez	%i2,	%l6,	%o5
	srax	%i3,	0x12,	%l2
	edge8ln	%l1,	%l0,	%l4
	stb	%o2,	[%l7 + 0x30]
	fcmpd	%fcc2,	%f12,	%f18
	xorcc	%g3,	0x125E,	%o3
	bshuffle	%f8,	%f2,	%f0
	sra	%g5,	%o0,	%i7
	fmovsvc	%xcc,	%f6,	%f21
	movrlz	%g1,	0x11B,	%o7
	fabsd	%f14,	%f8
	edge8	%g7,	%i6,	%o6
	nop
	set	0x5A, %g6
	stb	%g4,	[%l7 + %g6]
	nop
	set	0x28, %o5
	ldsh	[%l7 + %o5],	%g6
	edge16l	%l5,	%o1,	%i1
	sdiv	%i5,	0x0992,	%o4
	edge16l	%g2,	%i0,	%l3
	fnegd	%f0,	%f16
	edge8l	%i2,	%l6,	%o5
	fandnot2	%f6,	%f14,	%f12
	stx	%i3,	[%l7 + 0x70]
	subc	%i4,	0x08BC,	%l1
	movge	%icc,	%l0,	%l2
	edge32l	%o2,	%l4,	%g3
	movleu	%icc,	%g5,	%o3
	add	%i7,	%o0,	%g1
	fmovsg	%xcc,	%f18,	%f30
	subccc	%g7,	%i6,	%o7
	edge16	%o6,	%g4,	%l5
	edge8n	%o1,	%i1,	%i5
	sra	%g6,	%g2,	%i0
	ldsb	[%l7 + 0x67],	%l3
	fmovdgu	%icc,	%f14,	%f25
	fcmpgt32	%f18,	%f22,	%i2
	fsrc2	%f0,	%f0
	fxors	%f8,	%f23,	%f6
	movrlez	%l6,	%o4,	%o5
	xnor	%i4,	0x1262,	%i3
	fmul8x16au	%f6,	%f3,	%f24
	ldx	[%l7 + 0x40],	%l1
	alignaddr	%l0,	%o2,	%l4
	fmovrslz	%g3,	%f21,	%f3
	edge8l	%l2,	%o3,	%g5
	orcc	%o0,	%g1,	%g7
	fornot2s	%f31,	%f27,	%f11
	ldx	[%l7 + 0x08],	%i6
	array8	%i7,	%o6,	%g4
	st	%f29,	[%l7 + 0x28]
	ldd	[%l7 + 0x58],	%f16
	addccc	%l5,	%o7,	%o1
	sdiv	%i1,	0x00F4,	%g6
	smul	%g2,	0x045A,	%i5
	movrgz	%l3,	0x2C5,	%i2
	array8	%i0,	%l6,	%o4
	movrgez	%o5,	%i3,	%l1
	stb	%i4,	[%l7 + 0x38]
	fornot1s	%f22,	%f13,	%f14
	alignaddrl	%o2,	%l4,	%l0
	and	%l2,	0x1932,	%o3
	fzeros	%f16
	stx	%g3,	[%l7 + 0x48]
	movcc	%xcc,	%o0,	%g1
	xor	%g7,	%i6,	%i7
	fmovdne	%xcc,	%f12,	%f2
	srl	%g5,	%g4,	%o6
	fpsub32s	%f13,	%f26,	%f0
	sth	%o7,	[%l7 + 0x36]
	edge16l	%o1,	%l5,	%i1
	edge16l	%g2,	%g6,	%l3
	movgu	%xcc,	%i5,	%i2
	addc	%l6,	0x09CE,	%i0
	fnot2	%f8,	%f14
	movrgz	%o5,	0x2DE,	%o4
	movne	%icc,	%i3,	%i4
	movre	%o2,	%l1,	%l4
	fmovsl	%xcc,	%f6,	%f31
	ldd	[%l7 + 0x68],	%f20
	umul	%l0,	0x1425,	%o3
	smul	%g3,	%o0,	%l2
	ldd	[%l7 + 0x48],	%g6
	edge16n	%g1,	%i6,	%g5
	nop
	set	0x28, %o1
	lduw	[%l7 + %o1],	%i7
	movpos	%icc,	%o6,	%o7
	lduw	[%l7 + 0x0C],	%o1
	orcc	%l5,	0x0895,	%g4
	array32	%g2,	%g6,	%i1
	std	%f20,	[%l7 + 0x70]
	add	%i5,	%i2,	%l6
	ldd	[%l7 + 0x68],	%f6
	for	%f22,	%f2,	%f2
	fmovda	%icc,	%f21,	%f11
	andcc	%i0,	%o5,	%o4
	andncc	%i3,	%l3,	%i4
	alignaddrl	%l1,	%l4,	%o2
	movrlez	%o3,	0x0FF,	%g3
	save %o0, %l2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g1,	0x0052,	%l0
	xnor	%i6,	%i7,	%g5
	nop
	set	0x38, %i7
	stx	%o7,	[%l7 + %i7]
	movvc	%icc,	%o6,	%o1
	orcc	%g4,	0x1895,	%l5
	ldub	[%l7 + 0x6D],	%g6
	siam	0x1
	array8	%i1,	%g2,	%i5
	addccc	%i2,	0x1AE5,	%i0
	fcmpes	%fcc3,	%f22,	%f18
	sra	%l6,	0x1F,	%o4
	sll	%i3,	0x1A,	%l3
	subccc	%i4,	0x0DBD,	%o5
	umulcc	%l4,	0x088B,	%o2
	alignaddrl	%l1,	%o3,	%o0
	edge32l	%g3,	%g7,	%g1
	nop
	set	0x10, %l0
	stx	%l0,	[%l7 + %l0]
	fpsub16s	%f6,	%f12,	%f23
	stw	%i6,	[%l7 + 0x78]
	srax	%l2,	%g5,	%i7
	ldd	[%l7 + 0x58],	%f26
	fpackfix	%f6,	%f9
	fmovrsgz	%o6,	%f12,	%f23
	fors	%f14,	%f10,	%f14
	fornot1	%f28,	%f28,	%f16
	or	%o1,	%o7,	%g4
	st	%f31,	[%l7 + 0x2C]
	edge8n	%l5,	%g6,	%i1
	ldd	[%l7 + 0x60],	%g2
	st	%f4,	[%l7 + 0x24]
	andn	%i5,	%i2,	%i0
	mulx	%l6,	%o4,	%i3
	add	%l3,	%i4,	%o5
	subc	%l4,	0x0461,	%l1
	subc	%o2,	0x0C6F,	%o0
	movle	%xcc,	%o3,	%g7
	fornot2s	%f16,	%f14,	%f31
	ldsh	[%l7 + 0x26],	%g1
	mova	%xcc,	%l0,	%g3
	fcmpeq32	%f16,	%f20,	%i6
	umulcc	%l2,	%g5,	%i7
	ldx	[%l7 + 0x58],	%o6
	subc	%o1,	%g4,	%o7
	movrlez	%l5,	0x105,	%g6
	edge8n	%i1,	%i5,	%i2
	fmovsg	%xcc,	%f5,	%f3
	edge32ln	%i0,	%l6,	%g2
	umulcc	%o4,	%i3,	%i4
	fcmpeq32	%f26,	%f12,	%o5
	array16	%l3,	%l4,	%l1
	sll	%o0,	0x0E,	%o3
	edge8l	%g7,	%o2,	%l0
	stw	%g3,	[%l7 + 0x68]
	smulcc	%i6,	0x04FB,	%g1
	subccc	%g5,	0x10EF,	%i7
	ldsw	[%l7 + 0x34],	%l2
	movrgz	%o1,	%g4,	%o6
	movne	%icc,	%l5,	%g6
	orcc	%o7,	%i5,	%i1
	fcmple16	%f18,	%f28,	%i0
	fmul8x16al	%f28,	%f28,	%f18
	orncc	%i2,	%g2,	%l6
	edge8	%o4,	%i4,	%i3
	fors	%f2,	%f1,	%f0
	movne	%xcc,	%o5,	%l4
	alignaddrl	%l1,	%o0,	%l3
	fandnot2	%f8,	%f4,	%f26
	andcc	%g7,	%o3,	%o2
	udivcc	%g3,	0x0D4F,	%i6
	fmovscc	%icc,	%f30,	%f7
	fnot1s	%f6,	%f1
	movcc	%icc,	%l0,	%g5
	xor	%g1,	0x0ECF,	%l2
	mulscc	%o1,	0x1AA1,	%i7
	fnors	%f6,	%f16,	%f30
	smulcc	%o6,	%l5,	%g6
	ldub	[%l7 + 0x08],	%o7
	ldsb	[%l7 + 0x2B],	%i5
	fmovdleu	%xcc,	%f30,	%f29
	sir	0x0A3D
	subccc	%g4,	%i1,	%i2
	fpsub32s	%f21,	%f20,	%f8
	ldsh	[%l7 + 0x36],	%g2
	fmovrslz	%i0,	%f2,	%f22
	movcc	%icc,	%l6,	%i4
	xnorcc	%i3,	%o5,	%l4
	mova	%icc,	%o4,	%l1
	edge8l	%l3,	%o0,	%g7
	fnors	%f31,	%f26,	%f24
	fors	%f26,	%f8,	%f29
	alignaddr	%o3,	%g3,	%o2
	subc	%i6,	%l0,	%g1
	edge16n	%g5,	%l2,	%o1
	mulx	%o6,	0x00D3,	%i7
	fnegs	%f12,	%f3
	fnands	%f22,	%f15,	%f25
	sth	%g6,	[%l7 + 0x5A]
	movrgez	%o7,	0x37D,	%l5
	movre	%i5,	%i1,	%g4
	fsrc1s	%f21,	%f31
	fmovscs	%icc,	%f12,	%f18
	lduh	[%l7 + 0x32],	%i2
	movge	%icc,	%i0,	%g2
	ldd	[%l7 + 0x10],	%i4
	edge32	%l6,	%o5,	%l4
	addcc	%o4,	0x1F0F,	%i3
	edge32n	%l3,	%o0,	%g7
	fmovdne	%icc,	%f1,	%f26
	alignaddr	%o3,	%l1,	%o2
	mulx	%i6,	%l0,	%g1
	edge32l	%g5,	%l2,	%o1
	restore %o6, 0x1D72, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i7,	%g6,	%l5
	fmovsgu	%icc,	%f21,	%f15
	mulscc	%o7,	%i1,	%g4
	ldsh	[%l7 + 0x12],	%i2
	edge8n	%i5,	%i0,	%g2
	fmovsgu	%xcc,	%f25,	%f0
	ldd	[%l7 + 0x48],	%i6
	addcc	%o5,	0x1993,	%i4
	stb	%o4,	[%l7 + 0x0B]
	fmovrdgz	%l4,	%f2,	%f8
	lduw	[%l7 + 0x60],	%l3
	subccc	%o0,	0x0D65,	%g7
	fnot1	%f2,	%f0
	lduw	[%l7 + 0x2C],	%o3
	movpos	%xcc,	%l1,	%o2
	ldsh	[%l7 + 0x1C],	%i3
	edge8ln	%i6,	%g1,	%l0
	sir	0x1B92
	fxors	%f31,	%f5,	%f27
	stx	%g5,	[%l7 + 0x08]
	popc	%o1,	%l2
	popc	0x0B50,	%g3
	std	%f18,	[%l7 + 0x58]
	fmovsvc	%xcc,	%f20,	%f29
	std	%f22,	[%l7 + 0x70]
	edge8l	%i7,	%g6,	%l5
	mulscc	%o6,	0x10EF,	%i1
	andn	%o7,	0x03AA,	%i2
	fsrc2s	%f8,	%f21
	lduh	[%l7 + 0x2A],	%i5
	ldub	[%l7 + 0x12],	%i0
	edge16	%g2,	%l6,	%g4
	xnor	%i4,	0x003D,	%o4
	popc	0x055D,	%l4
	edge8	%o5,	%l3,	%g7
	edge8n	%o3,	%l1,	%o2
	save %o0, 0x0ED8, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%icc,	%f18,	%f21
	addcc	%g1,	0x0777,	%i3
	edge16l	%l0,	%o1,	%g5
	movrlz	%g3,	%i7,	%l2
	sethi	0x181F,	%l5
	srax	%g6,	0x0E,	%i1
	sdivcc	%o6,	0x1F4C,	%i2
	movne	%xcc,	%o7,	%i5
	movl	%icc,	%g2,	%i0
	st	%f12,	[%l7 + 0x08]
	alignaddrl	%l6,	%g4,	%i4
	edge16n	%o4,	%o5,	%l4
	fmovdpos	%xcc,	%f18,	%f23
	mulscc	%l3,	%o3,	%g7
	subcc	%l1,	0x0C76,	%o2
	sir	0x05D9
	st	%f9,	[%l7 + 0x60]
	fmul8x16au	%f12,	%f11,	%f10
	move	%icc,	%o0,	%g1
	edge16n	%i6,	%i3,	%o1
	andn	%l0,	0x0A92,	%g5
	edge8	%i7,	%l2,	%g3
	fcmple32	%f0,	%f4,	%l5
	stx	%g6,	[%l7 + 0x30]
	subc	%o6,	%i1,	%o7
	xorcc	%i5,	%i2,	%g2
	movrlz	%i0,	0x368,	%g4
	fcmps	%fcc1,	%f16,	%f21
	edge8	%l6,	%o4,	%o5
	edge16ln	%l4,	%i4,	%o3
	ldub	[%l7 + 0x1F],	%l3
	fzero	%f4
	srax	%l1,	0x04,	%o2
	fmovsne	%xcc,	%f20,	%f3
	subc	%o0,	%g7,	%g1
	mulx	%i6,	%o1,	%i3
	sra	%g5,	0x0B,	%i7
	xorcc	%l2,	0x135D,	%g3
	andncc	%l5,	%g6,	%l0
	move	%icc,	%i1,	%o6
	alignaddr	%i5,	%i2,	%g2
	ldub	[%l7 + 0x71],	%i0
	andn	%o7,	0x1F67,	%l6
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	fornot2	%f12,	%f6,	%f8
	andncc	%i4,	%l4,	%l3
	ldsb	[%l7 + 0x3B],	%l1
	srlx	%o2,	0x04,	%o3
	movcs	%icc,	%o0,	%g7
	fcmpd	%fcc2,	%f26,	%f4
	addcc	%g1,	%o1,	%i6
	and	%i3,	0x1013,	%g5
	sdivx	%l2,	0x0A09,	%i7
	fmovdl	%xcc,	%f13,	%f21
	stw	%g3,	[%l7 + 0x30]
	ldub	[%l7 + 0x53],	%g6
	stw	%l5,	[%l7 + 0x20]
	ldd	[%l7 + 0x10],	%i0
	mulx	%o6,	0x1BA8,	%i5
	udiv	%i2,	0x0CC3,	%l0
	addc	%i0,	0x180E,	%o7
	sth	%g2,	[%l7 + 0x78]
	sllx	%l6,	0x06,	%g4
	edge32	%o4,	%i4,	%o5
	subc	%l4,	0x1461,	%l1
	sth	%o2,	[%l7 + 0x0A]
	udiv	%l3,	0x07FE,	%o3
	movvs	%xcc,	%o0,	%g7
	nop
	set	0x1D, %l3
	ldsb	[%l7 + %l3],	%o1
	array16	%g1,	%i3,	%i6
	stb	%l2,	[%l7 + 0x20]
	sub	%g5,	%i7,	%g3
	umulcc	%g6,	0x1D53,	%i1
	edge32	%l5,	%i5,	%i2
	fmovdle	%xcc,	%f29,	%f24
	or	%o6,	%i0,	%o7
	array16	%l0,	%g2,	%l6
	siam	0x5
	and	%o4,	%i4,	%o5
	andcc	%l4,	%l1,	%g4
	fmovdg	%icc,	%f3,	%f23
	fmovscc	%xcc,	%f24,	%f18
	sdivx	%o2,	0x1C31,	%l3
	addccc	%o0,	%g7,	%o1
	move	%xcc,	%g1,	%i3
	movgu	%icc,	%o3,	%i6
	or	%g5,	0x1D89,	%i7
	edge16ln	%g3,	%l2,	%i1
	movge	%xcc,	%l5,	%i5
	fmovsge	%xcc,	%f4,	%f3
	fcmpeq16	%f4,	%f28,	%i2
	xnorcc	%g6,	0x11D0,	%o6
	fzero	%f22
	bshuffle	%f22,	%f14,	%f20
	or	%o7,	0x1DB4,	%l0
	edge8l	%i0,	%g2,	%o4
	ldsh	[%l7 + 0x18],	%l6
	fmovdne	%icc,	%f18,	%f10
	umulcc	%i4,	%l4,	%l1
	sdivcc	%o5,	0x0A57,	%o2
	edge8l	%g4,	%l3,	%g7
	fexpand	%f3,	%f18
	udiv	%o0,	0x08E5,	%g1
	fmovrsgz	%i3,	%f24,	%f20
	std	%f24,	[%l7 + 0x08]
	udiv	%o3,	0x0577,	%o1
	std	%f6,	[%l7 + 0x50]
	movrne	%g5,	0x237,	%i7
	fmovdvc	%icc,	%f31,	%f24
	mulx	%g3,	0x1D60,	%i6
	umulcc	%l2,	0x19E7,	%l5
	fornot2s	%f27,	%f12,	%f14
	fnot2	%f12,	%f14
	movrgez	%i1,	%i5,	%g6
	movrne	%i2,	%o7,	%l0
	smulcc	%i0,	0x0B13,	%g2
	andn	%o4,	0x0C62,	%l6
	edge16	%i4,	%l4,	%o6
	ldd	[%l7 + 0x30],	%o4
	movrlez	%o2,	%g4,	%l1
	movle	%xcc,	%g7,	%o0
	movpos	%icc,	%l3,	%i3
	fcmple32	%f20,	%f10,	%o3
	movle	%xcc,	%g1,	%o1
	fpackfix	%f12,	%f0
	addc	%g5,	0x0FB4,	%g3
	fornot1	%f24,	%f20,	%f16
	movrlez	%i6,	0x341,	%i7
	sth	%l2,	[%l7 + 0x78]
	fmovdpos	%icc,	%f20,	%f23
	stb	%l5,	[%l7 + 0x27]
	lduw	[%l7 + 0x68],	%i5
	fmovrsgez	%i1,	%f8,	%f13
	ldd	[%l7 + 0x58],	%g6
	fpsub16	%f0,	%f10,	%f8
	xnor	%o7,	%i2,	%l0
	movl	%icc,	%i0,	%g2
	fmovsvs	%icc,	%f9,	%f4
	edge32ln	%o4,	%i4,	%l4
	restore %o6, %l6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f26,	%f8
	edge8ln	%o5,	%g4,	%g7
	xnorcc	%l1,	0x0FF0,	%o0
	smulcc	%l3,	%o3,	%g1
	array16	%o1,	%g5,	%i3
	fandnot2s	%f2,	%f18,	%f25
	ldx	[%l7 + 0x78],	%g3
	movcc	%icc,	%i7,	%i6
	addcc	%l2,	%i5,	%i1
	movne	%xcc,	%l5,	%o7
	fandnot2	%f2,	%f16,	%f26
	fmovrsgez	%g6,	%f6,	%f18
	fmul8x16	%f21,	%f20,	%f16
	fexpand	%f18,	%f18
	movvc	%xcc,	%l0,	%i0
	subccc	%i2,	%g2,	%i4
	movrlz	%o4,	%o6,	%l4
	movn	%xcc,	%l6,	%o5
	smul	%o2,	0x0025,	%g7
	xor	%l1,	%o0,	%g4
	movrgez	%o3,	0x2C4,	%l3
	movl	%xcc,	%o1,	%g1
	movneg	%icc,	%g5,	%i3
	fandnot1s	%f4,	%f1,	%f29
	ldx	[%l7 + 0x70],	%i7
	mulx	%g3,	0x1520,	%i6
	fcmpeq32	%f8,	%f22,	%l2
	subc	%i5,	0x09B4,	%l5
	and	%o7,	0x0D3C,	%i1
	fmovrdlz	%l0,	%f22,	%f24
	save %i0, 0x0853, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g6,	%g2,	%i4
	ldub	[%l7 + 0x2B],	%o4
	edge32l	%l4,	%o6,	%l6
	movrgez	%o2,	0x014,	%o5
	lduh	[%l7 + 0x4C],	%l1
	st	%f5,	[%l7 + 0x68]
	fmovrslz	%g7,	%f11,	%f29
	fmovrde	%o0,	%f10,	%f2
	stb	%g4,	[%l7 + 0x6B]
	andn	%l3,	0x006F,	%o3
	edge32ln	%g1,	%o1,	%g5
	movg	%xcc,	%i7,	%g3
	ldx	[%l7 + 0x68],	%i6
	udivx	%i3,	0x1D86,	%l2
	addccc	%i5,	0x0F5C,	%o7
	array32	%i1,	%l5,	%l0
	edge32	%i2,	%i0,	%g2
	smul	%g6,	0x0D73,	%o4
	sllx	%l4,	0x1F,	%o6
	nop
	set	0x7D, %o4
	stb	%i4,	[%l7 + %o4]
	sra	%l6,	%o5,	%o2
	udivx	%g7,	0x089C,	%o0
	movgu	%icc,	%l1,	%g4
	edge16n	%o3,	%l3,	%o1
	edge16n	%g1,	%i7,	%g5
	fexpand	%f29,	%f16
	movpos	%icc,	%g3,	%i6
	fmul8sux16	%f30,	%f6,	%f6
	movle	%xcc,	%i3,	%i5
	addc	%l2,	0x08D6,	%i1
	movvc	%icc,	%l5,	%l0
	sllx	%o7,	0x01,	%i2
	movge	%icc,	%i0,	%g2
	andn	%o4,	0x01D1,	%l4
	srl	%o6,	%i4,	%l6
	srl	%o5,	%o2,	%g6
	movrgez	%o0,	0x1BC,	%l1
	std	%f22,	[%l7 + 0x70]
	edge8l	%g7,	%o3,	%g4
	fmovsgu	%xcc,	%f29,	%f22
	fands	%f23,	%f18,	%f31
	fmul8sux16	%f16,	%f2,	%f4
	movle	%icc,	%o1,	%l3
	srlx	%i7,	0x0D,	%g5
	sir	0x08EB
	fcmpeq32	%f0,	%f24,	%g1
	ldd	[%l7 + 0x40],	%i6
	edge8l	%i3,	%i5,	%l2
	fmul8x16	%f27,	%f20,	%f28
	fornot1s	%f9,	%f17,	%f8
	xnorcc	%i1,	%l5,	%g3
	fnot2	%f8,	%f12
	movleu	%xcc,	%o7,	%i2
	ld	[%l7 + 0x34],	%f6
	subcc	%i0,	%g2,	%l0
	fmovdneg	%icc,	%f13,	%f31
	fmovdvs	%icc,	%f1,	%f21
	movrlz	%o4,	0x1D9,	%l4
	sethi	0x038A,	%o6
	movge	%xcc,	%l6,	%i4
	movne	%icc,	%o2,	%g6
	udiv	%o5,	0x042A,	%o0
	umul	%g7,	0x10EE,	%o3
	stw	%l1,	[%l7 + 0x20]
	fmovdpos	%xcc,	%f23,	%f27
	fmovsa	%icc,	%f4,	%f19
	edge8ln	%o1,	%g4,	%i7
	edge32l	%g5,	%g1,	%i6
	orn	%l3,	%i5,	%i3
	andncc	%l2,	%i1,	%g3
	edge8ln	%l5,	%i2,	%o7
	movpos	%xcc,	%g2,	%l0
	move	%icc,	%o4,	%i0
	fmovdleu	%xcc,	%f31,	%f10
	mulscc	%o6,	%l4,	%l6
	addc	%i4,	%o2,	%o5
	fmovrsgez	%g6,	%f17,	%f10
	srl	%o0,	%g7,	%o3
	ldx	[%l7 + 0x50],	%l1
	ldd	[%l7 + 0x30],	%g4
	movneg	%icc,	%i7,	%g5
	fzeros	%f26
	smulcc	%o1,	%g1,	%l3
	fmovdvc	%icc,	%f2,	%f13
	and	%i6,	%i5,	%l2
	movvs	%icc,	%i3,	%g3
	fmovrde	%i1,	%f26,	%f10
	smulcc	%l5,	%i2,	%o7
	fandnot1s	%f2,	%f24,	%f31
	orn	%g2,	%l0,	%i0
	subcc	%o6,	0x132E,	%l4
	addc	%o4,	0x1F45,	%i4
	std	%f6,	[%l7 + 0x58]
	edge8	%o2,	%l6,	%g6
	array8	%o0,	%g7,	%o5
	fpack16	%f28,	%f31
	subccc	%o3,	0x1F42,	%g4
	fornot1s	%f31,	%f14,	%f18
	movrne	%l1,	0x2FA,	%i7
	alignaddr	%g5,	%g1,	%l3
	movcc	%icc,	%i6,	%i5
	lduh	[%l7 + 0x6C],	%l2
	movge	%xcc,	%i3,	%g3
	movrne	%o1,	0x28F,	%i1
	move	%xcc,	%l5,	%o7
	sir	0x033D
	array32	%i2,	%g2,	%l0
	srlx	%i0,	0x09,	%l4
	fsrc1	%f14,	%f10
	stx	%o4,	[%l7 + 0x68]
	edge8l	%i4,	%o2,	%l6
	std	%f20,	[%l7 + 0x68]
	movrlz	%g6,	0x06F,	%o6
	srax	%g7,	%o0,	%o3
	movrgz	%o5,	0x257,	%l1
	orcc	%g4,	0x10E3,	%g5
	udiv	%i7,	0x1AA8,	%g1
	alignaddrl	%i6,	%i5,	%l3
	fors	%f11,	%f22,	%f7
	fzeros	%f22
	sir	0x05DD
	fcmple32	%f22,	%f2,	%i3
	addccc	%g3,	0x0DFF,	%l2
	movl	%icc,	%i1,	%l5
	move	%icc,	%o7,	%o1
	fnor	%f2,	%f10,	%f4
	edge32ln	%g2,	%i2,	%l0
	andcc	%i0,	0x0A58,	%o4
	smulcc	%l4,	%i4,	%o2
	movgu	%icc,	%l6,	%o6
	fmuld8sux16	%f31,	%f20,	%f26
	move	%icc,	%g6,	%g7
	sth	%o0,	[%l7 + 0x4A]
	fmovdvc	%icc,	%f21,	%f2
	mulscc	%o3,	0x0A49,	%o5
	nop
	set	0x38, %i2
	stw	%g4,	[%l7 + %i2]
	edge16n	%g5,	%l1,	%g1
	fmovdcs	%icc,	%f0,	%f3
	array8	%i6,	%i7,	%l3
	stx	%i5,	[%l7 + 0x28]
	ldsw	[%l7 + 0x34],	%g3
	ldx	[%l7 + 0x20],	%l2
	udivx	%i3,	0x1016,	%i1
	fcmpne32	%f2,	%f22,	%o7
	smulcc	%l5,	0x18D8,	%o1
	movrlez	%i2,	0x39E,	%g2
	nop
	set	0x1B, %o7
	stb	%i0,	[%l7 + %o7]
	fmul8x16au	%f21,	%f1,	%f2
	sra	%o4,	%l4,	%l0
	fmuld8ulx16	%f31,	%f5,	%f18
	sdiv	%o2,	0x1426,	%l6
	array16	%i4,	%o6,	%g7
	ldd	[%l7 + 0x38],	%o0
	fmovdg	%icc,	%f28,	%f31
	umulcc	%o3,	%g6,	%g4
	fpadd16	%f18,	%f20,	%f18
	movcc	%icc,	%g5,	%l1
	ldsh	[%l7 + 0x10],	%g1
	movneg	%icc,	%o5,	%i6
	fmovdn	%icc,	%f24,	%f18
	movneg	%icc,	%l3,	%i5
	edge8n	%i7,	%l2,	%i3
	array16	%g3,	%i1,	%o7
	save %o1, 0x110E, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f29,	%f0,	%f16
	edge16	%i2,	%g2,	%i0
	movge	%icc,	%l4,	%l0
	edge32	%o4,	%o2,	%i4
	alignaddrl	%o6,	%g7,	%l6
	fcmps	%fcc2,	%f2,	%f16
	smul	%o0,	%g6,	%o3
	fornot2	%f14,	%f28,	%f16
	udivcc	%g4,	0x1C79,	%l1
	movl	%icc,	%g5,	%o5
	sdivx	%g1,	0x0128,	%i6
	srax	%i5,	0x0C,	%i7
	mova	%xcc,	%l2,	%l3
	movl	%xcc,	%g3,	%i1
	addccc	%o7,	0x11D8,	%i3
	andncc	%l5,	%o1,	%i2
	fmovse	%xcc,	%f16,	%f10
	movn	%xcc,	%i0,	%g2
	orncc	%l4,	%o4,	%l0
	fornot2s	%f30,	%f30,	%f8
	xorcc	%i4,	0x1617,	%o6
	movneg	%icc,	%g7,	%o2
	addcc	%o0,	%l6,	%g6
	st	%f10,	[%l7 + 0x6C]
	movrlez	%g4,	0x348,	%l1
	fabss	%f6,	%f25
	edge8l	%o3,	%o5,	%g1
	movvs	%icc,	%i6,	%g5
	movvc	%xcc,	%i7,	%i5
	addccc	%l2,	0x1FD1,	%l3
	fmovdg	%xcc,	%f0,	%f19
	fmovsvs	%xcc,	%f9,	%f30
	ldx	[%l7 + 0x08],	%i1
	andn	%o7,	%i3,	%l5
	fsrc2	%f4,	%f6
	movg	%icc,	%o1,	%i2
	edge8l	%i0,	%g2,	%l4
	fcmpeq32	%f22,	%f10,	%g3
	movg	%icc,	%l0,	%i4
	udivx	%o6,	0x19B4,	%g7
	sdivx	%o4,	0x0FAE,	%o2
	smulcc	%l6,	%g6,	%o0
	array16	%l1,	%o3,	%g4
	movcs	%xcc,	%g1,	%o5
	edge16n	%i6,	%i7,	%i5
	udivcc	%g5,	0x123A,	%l2
	lduh	[%l7 + 0x66],	%i1
	movgu	%icc,	%o7,	%i3
	sdivcc	%l3,	0x12D2,	%o1
	movn	%xcc,	%i2,	%i0
	srlx	%g2,	%l5,	%l4
	movgu	%icc,	%l0,	%g3
	fnands	%f31,	%f26,	%f4
	edge16	%i4,	%o6,	%g7
	subcc	%o4,	%l6,	%o2
	stw	%g6,	[%l7 + 0x18]
	std	%f30,	[%l7 + 0x28]
	std	%f26,	[%l7 + 0x10]
	udiv	%l1,	0x082A,	%o0
	udivx	%g4,	0x167F,	%o3
	fnegs	%f27,	%f27
	xnor	%o5,	%g1,	%i6
	st	%f3,	[%l7 + 0x28]
	addccc	%i5,	%i7,	%g5
	subcc	%i1,	%o7,	%i3
	movle	%xcc,	%l3,	%l2
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	addcc	%g2,	0x172B,	%i2
	ldub	[%l7 + 0x0D],	%l5
	fsrc2s	%f8,	%f30
	addc	%l4,	0x1AED,	%g3
	sir	0x1E47
	for	%f2,	%f14,	%f4
	fmovrdlz	%l0,	%f10,	%f16
	movrgez	%o6,	0x1FA,	%g7
	fmul8ulx16	%f24,	%f10,	%f18
	smulcc	%o4,	%l6,	%o2
	mulscc	%g6,	%i4,	%l1
	save %o0, %o3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g4,	%i6,	%i5
	move	%xcc,	%g1,	%g5
	andn	%i1,	%i7,	%o7
	array16	%i3,	%l2,	%l3
	movcc	%icc,	%o1,	%g2
	save %i0, %i2, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g3,	%l0,	%o6
	ldub	[%l7 + 0x70],	%g7
	movvc	%icc,	%l4,	%l6
	addccc	%o4,	0x1056,	%o2
	st	%f5,	[%l7 + 0x6C]
	ldsh	[%l7 + 0x0A],	%i4
	lduh	[%l7 + 0x22],	%l1
	fornot2s	%f30,	%f6,	%f10
	andcc	%g6,	%o3,	%o5
	and	%o0,	%g4,	%i6
	addc	%i5,	%g5,	%i1
	smulcc	%i7,	%g1,	%i3
	fmovsneg	%xcc,	%f11,	%f30
	umul	%l2,	%l3,	%o1
	addccc	%g2,	0x0A96,	%i0
	fcmpne16	%f22,	%f22,	%i2
	fmovsl	%xcc,	%f27,	%f12
	movrgez	%o7,	%g3,	%l5
	edge8n	%l0,	%g7,	%l4
	udiv	%o6,	0x02BB,	%o4
	sra	%l6,	%i4,	%o2
	edge32l	%l1,	%g6,	%o3
	edge16ln	%o0,	%o5,	%i6
	edge16ln	%i5,	%g4,	%i1
	edge16n	%i7,	%g1,	%g5
	sub	%l2,	%l3,	%i3
	edge8	%o1,	%i0,	%i2
	fmovscs	%icc,	%f19,	%f31
	addcc	%o7,	%g3,	%l5
	addccc	%g2,	%l0,	%g7
	addcc	%o6,	%o4,	%l4
	edge32n	%i4,	%o2,	%l1
	fands	%f21,	%f18,	%f3
	sll	%l6,	0x18,	%o3
	xor	%g6,	0x0569,	%o5
	andcc	%o0,	%i6,	%i5
	ld	[%l7 + 0x48],	%f2
	umulcc	%i1,	%i7,	%g1
	xnorcc	%g5,	0x0F08,	%g4
	subc	%l2,	0x1EF8,	%l3
	array16	%i3,	%o1,	%i2
	fors	%f17,	%f15,	%f16
	subc	%i0,	0x0CBF,	%o7
	movrlez	%l5,	0x1F3,	%g2
	movvs	%icc,	%g3,	%l0
	movge	%xcc,	%g7,	%o6
	movl	%xcc,	%l4,	%i4
	edge8l	%o4,	%o2,	%l6
	edge8	%o3,	%g6,	%l1
	addcc	%o0,	0x1910,	%o5
	movl	%xcc,	%i5,	%i1
	sdiv	%i7,	0x1C37,	%g1
	ldd	[%l7 + 0x40],	%g4
	alignaddrl	%g4,	%i6,	%l3
	edge16n	%i3,	%o1,	%l2
	stw	%i0,	[%l7 + 0x1C]
	movn	%xcc,	%o7,	%i2
	xnor	%l5,	%g3,	%l0
	fmuld8ulx16	%f7,	%f6,	%f26
	fmovrdgez	%g2,	%f18,	%f28
	stx	%o6,	[%l7 + 0x08]
	andncc	%l4,	%g7,	%o4
	fsrc2	%f0,	%f28
	xor	%i4,	0x1627,	%o2
	xnorcc	%l6,	%g6,	%l1
	popc	%o3,	%o5
	umulcc	%o0,	%i5,	%i7
	udivx	%i1,	0x0D0E,	%g5
	fmovsl	%icc,	%f4,	%f28
	restore %g1, %g4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x30],	%f31
	subc	%i3,	%l3,	%l2
	sdivcc	%i0,	0x1E86,	%o1
	sdiv	%o7,	0x1687,	%l5
	movge	%icc,	%g3,	%i2
	subccc	%g2,	0x0312,	%l0
	movleu	%xcc,	%l4,	%g7
	lduh	[%l7 + 0x34],	%o4
	umul	%i4,	0x1D1F,	%o2
	save %l6, %g6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o3,	0x2D3,	%o6
	fmovdvc	%xcc,	%f28,	%f20
	fmovrsgz	%o5,	%f11,	%f18
	sub	%o0,	%i7,	%i1
	subccc	%i5,	%g5,	%g1
	fmul8x16	%f11,	%f6,	%f22
	udivx	%i6,	0x085D,	%g4
	xnorcc	%i3,	%l3,	%i0
	edge8ln	%l2,	%o1,	%o7
	ldsh	[%l7 + 0x1A],	%l5
	addccc	%i2,	0x163A,	%g2
	movgu	%icc,	%l0,	%g3
	stx	%g7,	[%l7 + 0x28]
	srax	%l4,	0x0D,	%i4
	movle	%xcc,	%o2,	%l6
	orncc	%o4,	0x1CFE,	%g6
	andn	%o3,	0x0213,	%l1
	movrgez	%o6,	0x11B,	%o5
	edge16	%o0,	%i1,	%i7
	sub	%g5,	0x1FD9,	%g1
	movpos	%xcc,	%i6,	%i5
	subccc	%g4,	%i3,	%l3
	edge32n	%i0,	%o1,	%l2
	movrlez	%o7,	%l5,	%i2
	edge16	%l0,	%g3,	%g2
	and	%l4,	%i4,	%o2
	sllx	%g7,	0x16,	%o4
	sir	0x0E5E
	subc	%l6,	0x1B2B,	%o3
	srlx	%g6,	%o6,	%o5
	fcmpgt16	%f6,	%f28,	%l1
	movleu	%xcc,	%i1,	%i7
	ldsw	[%l7 + 0x70],	%g5
	ldsw	[%l7 + 0x10],	%g1
	umulcc	%o0,	0x067B,	%i5
	ldub	[%l7 + 0x4E],	%i6
	fmovsa	%icc,	%f14,	%f17
	fmovdvc	%xcc,	%f19,	%f22
	sth	%g4,	[%l7 + 0x6C]
	stw	%i3,	[%l7 + 0x10]
	fmul8x16	%f13,	%f12,	%f28
	udivx	%i0,	0x0BE2,	%o1
	movleu	%icc,	%l2,	%o7
	srax	%l3,	%l5,	%l0
	smulcc	%g3,	0x19AB,	%i2
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	add	%g7,	%o4,	%l6
	orncc	%o3,	%g6,	%o6
	edge16l	%o5,	%l1,	%i1
	smulcc	%i7,	%o2,	%g1
	fmovrde	%g5,	%f18,	%f18
	movn	%icc,	%o0,	%i5
	fabsd	%f16,	%f2
	array8	%g4,	%i6,	%i0
	movleu	%icc,	%i3,	%o1
	andn	%o7,	0x15B5,	%l2
	lduh	[%l7 + 0x42],	%l5
	array8	%l3,	%l0,	%i2
	fmovde	%icc,	%f20,	%f12
	edge16n	%g3,	%g2,	%l4
	orn	%g7,	%o4,	%i4
	or	%o3,	0x081D,	%l6
	fandnot2s	%f17,	%f16,	%f27
	save %g6, %o5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o6,	0x0E81,	%i1
	fsrc2s	%f18,	%f8
	edge8	%o2,	%g1,	%g5
	edge16ln	%i7,	%i5,	%o0
	edge16l	%g4,	%i6,	%i3
	umulcc	%i0,	%o7,	%o1
	edge16n	%l2,	%l5,	%l3
	srlx	%i2,	0x0B,	%l0
	sethi	0x0386,	%g3
	lduh	[%l7 + 0x46],	%l4
	orn	%g2,	%o4,	%i4
	sll	%g7,	%l6,	%g6
	sra	%o3,	%o5,	%l1
	fmovdg	%xcc,	%f28,	%f4
	ldd	[%l7 + 0x48],	%o6
	restore %i1, %g1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc3,	%f6,	%f2
	movcs	%icc,	%i7,	%i5
	umulcc	%o0,	0x03B2,	%o2
	movrlez	%i6,	%g4,	%i0
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	movvs	%icc,	%l5,	%l2
	sllx	%i2,	%l0,	%g3
	movne	%xcc,	%l4,	%l3
	edge16n	%g2,	%i4,	%g7
	srlx	%o4,	0x04,	%l6
	movl	%xcc,	%o3,	%o5
	xorcc	%g6,	%l1,	%i1
	fcmpgt32	%f0,	%f0,	%g1
	movcs	%xcc,	%g5,	%i7
	fornot2s	%f28,	%f17,	%f19
	ldsw	[%l7 + 0x38],	%i5
	movn	%xcc,	%o0,	%o6
	movgu	%xcc,	%o2,	%g4
	umul	%i0,	%o7,	%i6
	st	%f15,	[%l7 + 0x38]
	orncc	%o1,	%l5,	%l2
	movge	%xcc,	%i2,	%l0
	fmovdpos	%xcc,	%f24,	%f13
	sth	%g3,	[%l7 + 0x12]
	move	%xcc,	%l4,	%i3
	fmovrsgez	%g2,	%f13,	%f15
	addcc	%l3,	%i4,	%o4
	fones	%f17
	movle	%icc,	%l6,	%o3
	alignaddr	%g7,	%g6,	%o5
	mova	%xcc,	%l1,	%g1
	std	%f24,	[%l7 + 0x68]
	edge8	%i1,	%g5,	%i7
	movne	%icc,	%o0,	%o6
	ld	[%l7 + 0x20],	%f16
	mulx	%o2,	0x1DD6,	%g4
	andncc	%i5,	%o7,	%i0
	subccc	%o1,	%l5,	%l2
	fpsub16s	%f18,	%f17,	%f19
	fmovdgu	%xcc,	%f1,	%f17
	umul	%i6,	%l0,	%g3
	udiv	%i2,	0x1724,	%i3
	movg	%xcc,	%g2,	%l3
	sub	%i4,	0x114E,	%l4
	edge32n	%o4,	%l6,	%g7
	fmul8x16au	%f24,	%f3,	%f0
	edge16ln	%g6,	%o3,	%o5
	movrne	%g1,	%i1,	%g5
	edge32	%i7,	%l1,	%o6
	subccc	%o2,	0x0DD0,	%g4
	fmovrdgz	%o0,	%f16,	%f16
	ldd	[%l7 + 0x68],	%f22
	movvs	%xcc,	%i5,	%i0
	fmovsn	%icc,	%f14,	%f19
	pdist	%f0,	%f22,	%f22
	fcmple32	%f10,	%f28,	%o7
	ldsb	[%l7 + 0x3D],	%l5
	fands	%f6,	%f6,	%f21
	fands	%f15,	%f23,	%f22
	std	%f30,	[%l7 + 0x20]
	fcmpd	%fcc3,	%f16,	%f26
	fnot1s	%f29,	%f18
	move	%icc,	%o1,	%l2
	sub	%l0,	0x095E,	%i6
	fnegs	%f31,	%f21
	fnot2s	%f0,	%f28
	movneg	%icc,	%i2,	%i3
	or	%g3,	%l3,	%g2
	udiv	%l4,	0x06C8,	%i4
	std	%f4,	[%l7 + 0x70]
	mulscc	%l6,	%o4,	%g7
	movcs	%icc,	%o3,	%o5
	add	%g1,	0x00D8,	%i1
	move	%icc,	%g6,	%g5
	addc	%i7,	0x0D05,	%l1
	fmovdvs	%xcc,	%f13,	%f13
	alignaddrl	%o2,	%o6,	%o0
	xnor	%g4,	%i5,	%i0
	or	%l5,	0x0774,	%o7
	movrne	%l2,	0x125,	%o1
	array16	%i6,	%i2,	%l0
	movrgz	%g3,	%i3,	%g2
	fmovdle	%xcc,	%f18,	%f13
	edge8l	%l3,	%l4,	%l6
	movre	%i4,	%o4,	%o3
	sll	%o5,	%g1,	%i1
	andcc	%g7,	%g5,	%i7
	subccc	%g6,	0x1382,	%o2
	or	%l1,	%o6,	%o0
	edge8	%g4,	%i5,	%l5
	alignaddrl	%i0,	%l2,	%o1
	srax	%o7,	0x0E,	%i2
	edge16l	%l0,	%g3,	%i6
	fsrc1s	%f3,	%f28
	fmovdne	%icc,	%f20,	%f17
	edge8l	%g2,	%i3,	%l4
	sth	%l6,	[%l7 + 0x2E]
	fmovdg	%xcc,	%f20,	%f8
	fzeros	%f25
	edge32l	%l3,	%o4,	%o3
	udivcc	%o5,	0x0012,	%i4
	nop
	set	0x3C, %o6
	stw	%g1,	[%l7 + %o6]
	fmovdgu	%xcc,	%f12,	%f26
	fmovrsgez	%g7,	%f10,	%f16
	fmovsle	%xcc,	%f20,	%f30
	srax	%g5,	%i1,	%i7
	movcc	%xcc,	%g6,	%l1
	movrgz	%o6,	0x351,	%o2
	fmovdcc	%icc,	%f10,	%f18
	srl	%o0,	0x15,	%i5
	array32	%g4,	%i0,	%l2
	subccc	%o1,	0x11DA,	%l5
	sdivcc	%o7,	0x083F,	%i2
	udiv	%g3,	0x0EB7,	%l0
	edge16n	%g2,	%i3,	%l4
	umul	%i6,	%l6,	%o4
	movvs	%icc,	%o3,	%o5
	movleu	%xcc,	%l3,	%g1
	fpsub32	%f0,	%f0,	%f16
	xorcc	%i4,	%g7,	%i1
	ldx	[%l7 + 0x58],	%g5
	xor	%i7,	0x1B30,	%g6
	xnor	%l1,	%o6,	%o0
	andncc	%i5,	%g4,	%i0
	addc	%l2,	%o1,	%l5
	movvc	%xcc,	%o7,	%i2
	popc	%g3,	%o2
	fpmerge	%f20,	%f20,	%f20
	std	%f2,	[%l7 + 0x78]
	movre	%l0,	%i3,	%l4
	udiv	%g2,	0x1584,	%i6
	movvs	%icc,	%l6,	%o4
	orcc	%o5,	0x0DE4,	%l3
	sllx	%g1,	%i4,	%o3
	srlx	%i1,	%g5,	%i7
	addc	%g7,	0x16E9,	%g6
	sra	%o6,	0x0D,	%o0
	stb	%l1,	[%l7 + 0x51]
	movrgz	%i5,	0x157,	%i0
	lduw	[%l7 + 0x70],	%l2
	movrgez	%g4,	%o1,	%l5
	movcc	%xcc,	%i2,	%o7
	ldsw	[%l7 + 0x70],	%o2
	ldsw	[%l7 + 0x44],	%g3
	movrgz	%l0,	%i3,	%l4
	fpadd16s	%f20,	%f17,	%f26
	movrgz	%g2,	0x297,	%i6
	popc	%o4,	%l6
	sub	%o5,	%l3,	%i4
	sir	0x065D
	xnorcc	%o3,	%i1,	%g1
	edge32n	%g5,	%g7,	%g6
	nop
	set	0x76, %o0
	ldsb	[%l7 + %o0],	%i7
	and	%o0,	0x16D2,	%l1
	subcc	%o6,	%i5,	%i0
	fcmpne16	%f10,	%f26,	%l2
	fnegs	%f28,	%f2
	movleu	%icc,	%g4,	%l5
	smul	%i2,	0x1281,	%o1
	fornot1s	%f0,	%f9,	%f4
	fxnor	%f26,	%f24,	%f26
	ldd	[%l7 + 0x10],	%o2
	udiv	%o7,	0x04C4,	%l0
	edge32l	%i3,	%l4,	%g2
	movcs	%xcc,	%i6,	%o4
	movpos	%icc,	%g3,	%l6
	ldub	[%l7 + 0x11],	%l3
	sethi	0x0EEC,	%i4
	fpadd32	%f16,	%f24,	%f6
	umulcc	%o3,	%o5,	%g1
	std	%f18,	[%l7 + 0x28]
	addccc	%g5,	0x0FC2,	%i1
	edge32	%g6,	%g7,	%o0
	xnor	%i7,	0x03AD,	%o6
	movcc	%icc,	%l1,	%i5
	mova	%icc,	%l2,	%i0
	edge32l	%l5,	%g4,	%o1
	movne	%xcc,	%o2,	%o7
	movvs	%icc,	%i2,	%l0
	andncc	%i3,	%g2,	%l4
	fmovsl	%icc,	%f24,	%f16
	fmovscs	%icc,	%f31,	%f15
	udivx	%i6,	0x17D0,	%g3
	fxor	%f30,	%f6,	%f0
	movneg	%icc,	%o4,	%l6
	edge32l	%i4,	%l3,	%o3
	fpack32	%f8,	%f22,	%f22
	fmovsvc	%xcc,	%f7,	%f30
	addcc	%g1,	0x1CA0,	%o5
	srlx	%i1,	0x05,	%g5
	movpos	%icc,	%g6,	%o0
	fmovdcs	%icc,	%f18,	%f2
	orn	%i7,	%o6,	%l1
	andn	%i5,	%g7,	%i0
	fmovrdlez	%l5,	%f22,	%f14
	edge32n	%g4,	%o1,	%o2
	udivcc	%o7,	0x0746,	%i2
	srlx	%l2,	%l0,	%i3
	subccc	%g2,	0x1D7B,	%i6
	udiv	%l4,	0x1A42,	%g3
	edge16l	%o4,	%i4,	%l3
	fnegd	%f4,	%f8
	fmovde	%xcc,	%f29,	%f9
	orcc	%o3,	0x07F6,	%l6
	array8	%o5,	%g1,	%g5
	edge32n	%g6,	%o0,	%i1
	std	%f0,	[%l7 + 0x38]
	movle	%icc,	%i7,	%o6
	fmovsleu	%xcc,	%f18,	%f4
	subccc	%l1,	%i5,	%g7
	xnorcc	%l5,	%i0,	%g4
	faligndata	%f24,	%f24,	%f2
	sra	%o2,	%o1,	%o7
	andcc	%l2,	0x0DC2,	%i2
	orn	%i3,	0x12A7,	%l0
	std	%f20,	[%l7 + 0x18]
	srlx	%g2,	%l4,	%g3
	andncc	%o4,	%i6,	%l3
	fmovsge	%icc,	%f8,	%f29
	sdivcc	%o3,	0x0779,	%i4
	ld	[%l7 + 0x24],	%f28
	fmovscc	%xcc,	%f30,	%f11
	fmovscc	%icc,	%f23,	%f28
	move	%xcc,	%l6,	%g1
	fmovdvs	%icc,	%f9,	%f10
	edge8ln	%o5,	%g6,	%g5
	fpack32	%f4,	%f30,	%f2
	nop
	set	0x78, %l1
	stx	%o0,	[%l7 + %l1]
	umulcc	%i7,	0x1838,	%o6
	movle	%xcc,	%i1,	%l1
	sethi	0x1D08,	%i5
	fpadd16	%f20,	%f22,	%f22
	movg	%xcc,	%l5,	%g7
	sub	%g4,	0x04F7,	%o2
	array8	%i0,	%o7,	%l2
	srlx	%o1,	0x03,	%i3
	sdivx	%l0,	0x06C7,	%i2
	std	%f24,	[%l7 + 0x38]
	sdivcc	%l4,	0x0B29,	%g3
	smul	%g2,	%o4,	%l3
	movgu	%icc,	%i6,	%i4
	sir	0x0C17
	addc	%l6,	0x0177,	%o3
	udiv	%o5,	0x140F,	%g6
	smulcc	%g5,	0x0AF0,	%g1
	or	%o0,	%o6,	%i7
	andn	%l1,	%i1,	%i5
	andcc	%g7,	0x1909,	%l5
	movrgz	%g4,	0x375,	%i0
	restore %o2, 0x07EB, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o1,	0x186D,	%o7
	fandnot2	%f12,	%f22,	%f10
	pdist	%f18,	%f22,	%f26
	fmovsneg	%icc,	%f10,	%f11
	lduw	[%l7 + 0x40],	%i3
	ldsb	[%l7 + 0x1F],	%l0
	fsrc1	%f28,	%f18
	fpack32	%f24,	%f4,	%f26
	smulcc	%l4,	%g3,	%g2
	fnot1	%f30,	%f14
	xnorcc	%i2,	0x18FE,	%l3
	andn	%i6,	0x0447,	%i4
	edge32ln	%l6,	%o4,	%o3
	fmovrsgz	%g6,	%f0,	%f5
	st	%f11,	[%l7 + 0x38]
	movg	%xcc,	%o5,	%g1
	umul	%g5,	%o6,	%i7
	addccc	%l1,	0x142F,	%i1
	edge16	%i5,	%o0,	%l5
	addccc	%g7,	0x17BF,	%g4
	addc	%i0,	0x0C0C,	%l2
	ldsh	[%l7 + 0x5E],	%o2
	fones	%f13
	stx	%o7,	[%l7 + 0x20]
	fsrc2s	%f9,	%f1
	popc	%i3,	%o1
	andncc	%l4,	%g3,	%l0
	fnors	%f13,	%f20,	%f14
	fornot1	%f30,	%f28,	%f24
	alignaddr	%i2,	%g2,	%l3
	movrlez	%i6,	%i4,	%l6
	edge16l	%o4,	%o3,	%g6
	sdiv	%g1,	0x12C1,	%g5
	nop
	set	0x1E, %l5
	ldub	[%l7 + %l5],	%o6
	edge32l	%i7,	%o5,	%l1
	fmul8x16au	%f20,	%f18,	%f14
	edge8l	%i1,	%o0,	%i5
	fcmpne32	%f24,	%f12,	%l5
	orncc	%g4,	%g7,	%l2
	movl	%icc,	%i0,	%o7
	sdiv	%o2,	0x1561,	%o1
	addccc	%i3,	%l4,	%g3
	fmovscc	%icc,	%f18,	%f28
	srlx	%l0,	%g2,	%i2
	stw	%i6,	[%l7 + 0x4C]
	subc	%i4,	%l6,	%o4
	nop
	set	0x38, %i5
	stx	%o3,	[%l7 + %i5]
	array16	%l3,	%g1,	%g6
	edge8ln	%g5,	%i7,	%o6
	fmovrdgz	%o5,	%f30,	%f20
	smulcc	%l1,	0x1852,	%o0
	fcmped	%fcc0,	%f0,	%f8
	edge32	%i1,	%i5,	%g4
	ldsh	[%l7 + 0x08],	%g7
	movgu	%icc,	%l2,	%l5
	ldd	[%l7 + 0x68],	%f14
	stx	%i0,	[%l7 + 0x58]
	edge16	%o7,	%o2,	%i3
	movpos	%icc,	%l4,	%g3
	smulcc	%l0,	%o1,	%g2
	addc	%i2,	0x05B5,	%i4
	fmovrse	%i6,	%f28,	%f6
	movcc	%icc,	%o4,	%o3
	mulscc	%l6,	%l3,	%g6
	std	%f30,	[%l7 + 0x58]
	fmovsn	%icc,	%f23,	%f30
	sub	%g5,	%i7,	%g1
	smul	%o6,	0x1946,	%o5
	ld	[%l7 + 0x2C],	%f21
	movne	%icc,	%l1,	%o0
	mulx	%i1,	%g4,	%i5
	nop
	set	0x64, %i3
	ldsh	[%l7 + %i3],	%l2
	fxor	%f8,	%f16,	%f18
	udivx	%l5,	0x1A45,	%g7
	xorcc	%o7,	0x0520,	%i0
	mulx	%i3,	0x18BA,	%l4
	movneg	%xcc,	%g3,	%o2
	edge16ln	%o1,	%l0,	%g2
	umul	%i2,	%i6,	%i4
	sdivx	%o3,	0x1AE9,	%l6
	sll	%o4,	%l3,	%g6
	fcmpgt32	%f4,	%f10,	%i7
	andncc	%g1,	%g5,	%o6
	fmovdpos	%xcc,	%f14,	%f26
	movle	%icc,	%l1,	%o5
	save %i1, %g4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i5,	%l2,	%l5
	movg	%icc,	%g7,	%i0
	addccc	%o7,	%l4,	%g3
	xnor	%o2,	%o1,	%l0
	ldsh	[%l7 + 0x68],	%g2
	ld	[%l7 + 0x4C],	%f14
	movg	%icc,	%i2,	%i3
	subc	%i4,	%o3,	%l6
	movneg	%icc,	%i6,	%o4
	save %l3, 0x197C, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x36],	%g1
	movn	%icc,	%i7,	%g5
	movge	%icc,	%l1,	%o6
	fpsub32s	%f23,	%f23,	%f5
	pdist	%f2,	%f22,	%f24
	ldsh	[%l7 + 0x36],	%o5
	move	%xcc,	%i1,	%g4
	ldsh	[%l7 + 0x64],	%i5
	fcmpne16	%f26,	%f6,	%o0
	and	%l2,	%g7,	%i0
	fmovdpos	%xcc,	%f8,	%f6
	movleu	%xcc,	%o7,	%l5
	fmul8x16	%f28,	%f16,	%f4
	andn	%g3,	0x1D89,	%o2
	fpadd32s	%f10,	%f28,	%f24
	movrgez	%o1,	0x1E4,	%l0
	stw	%g2,	[%l7 + 0x64]
	movpos	%xcc,	%i2,	%l4
	edge8n	%i3,	%i4,	%l6
	fmovse	%icc,	%f1,	%f31
	movcs	%xcc,	%o3,	%o4
	fcmps	%fcc3,	%f11,	%f15
	srlx	%l3,	%i6,	%g6
	movne	%xcc,	%g1,	%i7
	nop
	set	0x4C, %l6
	stw	%g5,	[%l7 + %l6]
	edge8	%o6,	%o5,	%i1
	xnorcc	%l1,	0x0EDF,	%g4
	edge16n	%i5,	%l2,	%o0
	xnorcc	%i0,	0x1B6D,	%o7
	sdivcc	%l5,	0x02F3,	%g3
	fmovrdgz	%g7,	%f14,	%f2
	umul	%o1,	%l0,	%o2
	movleu	%icc,	%i2,	%g2
	sethi	0x1484,	%l4
	ldd	[%l7 + 0x38],	%i4
	addccc	%i3,	0x10F6,	%l6
	movl	%xcc,	%o4,	%o3
	ldsw	[%l7 + 0x40],	%i6
	and	%l3,	%g6,	%g1
	movge	%icc,	%g5,	%i7
	movle	%xcc,	%o5,	%o6
	movrgz	%i1,	0x06F,	%g4
	addcc	%l1,	%l2,	%i5
	fmovsgu	%xcc,	%f0,	%f26
	fmovdvs	%xcc,	%f11,	%f9
	ld	[%l7 + 0x0C],	%f22
	fnand	%f6,	%f2,	%f18
	movne	%icc,	%o0,	%i0
	umul	%o7,	%l5,	%g7
	edge8ln	%o1,	%l0,	%o2
	movne	%xcc,	%i2,	%g3
	umulcc	%l4,	0x0DBC,	%g2
	lduh	[%l7 + 0x48],	%i4
	alignaddr	%i3,	%l6,	%o4
	fmovsgu	%xcc,	%f0,	%f30
	edge32n	%o3,	%l3,	%g6
	subcc	%i6,	%g1,	%i7
	fcmps	%fcc1,	%f14,	%f2
	fcmpgt32	%f0,	%f22,	%g5
	fnand	%f14,	%f2,	%f28
	edge8	%o6,	%i1,	%g4
	movcc	%xcc,	%l1,	%o5
	sdivx	%i5,	0x0C9C,	%o0
	movrlez	%l2,	0x1BD,	%o7
	orncc	%i0,	%l5,	%g7
	movneg	%icc,	%o1,	%o2
	edge32ln	%i2,	%g3,	%l4
	std	%f18,	[%l7 + 0x20]
	move	%xcc,	%g2,	%l0
	or	%i3,	0x13B6,	%i4
	xor	%l6,	0x16F8,	%o4
	xor	%o3,	%l3,	%g6
	lduw	[%l7 + 0x1C],	%i6
	fmovrdgez	%i7,	%f16,	%f24
	lduw	[%l7 + 0x6C],	%g1
	orn	%g5,	%o6,	%i1
	ldsh	[%l7 + 0x1A],	%l1
	edge8	%g4,	%o5,	%o0
	ld	[%l7 + 0x64],	%f21
	edge16ln	%l2,	%i5,	%i0
	udivcc	%l5,	0x0680,	%g7
	ldd	[%l7 + 0x10],	%o6
	movrlz	%o1,	%i2,	%o2
	fmovdg	%icc,	%f8,	%f2
	mova	%xcc,	%g3,	%g2
	fmovdg	%icc,	%f28,	%f21
	fmovrdlez	%l0,	%f22,	%f28
	udivx	%i3,	0x1DEE,	%l4
	bshuffle	%f20,	%f8,	%f28
	movgu	%icc,	%i4,	%o4
	orncc	%l6,	0x1125,	%o3
	edge8l	%l3,	%i6,	%g6
	movle	%xcc,	%i7,	%g5
	sllx	%g1,	0x08,	%o6
	fandnot2	%f26,	%f2,	%f4
	fmovdle	%xcc,	%f30,	%f16
	addcc	%i1,	%l1,	%g4
	edge16n	%o5,	%o0,	%l2
	movge	%xcc,	%i5,	%i0
	alignaddrl	%l5,	%o7,	%g7
	edge8ln	%o1,	%i2,	%g3
	xor	%g2,	%o2,	%i3
	fmovsvs	%xcc,	%f0,	%f0
	xorcc	%l4,	%l0,	%o4
	nop
	set	0x7C, %g4
	lduh	[%l7 + %g4],	%l6
	fpsub16	%f18,	%f20,	%f20
	stx	%i4,	[%l7 + 0x28]
	movcs	%icc,	%o3,	%i6
	movrgez	%g6,	0x318,	%l3
	movle	%xcc,	%g5,	%g1
	fmul8x16al	%f21,	%f14,	%f22
	udivcc	%i7,	0x0C2B,	%o6
	mulx	%i1,	0x18FE,	%l1
	srlx	%o5,	0x15,	%g4
	ldub	[%l7 + 0x3B],	%o0
	addc	%l2,	%i5,	%l5
	addccc	%o7,	%g7,	%o1
	or	%i0,	0x101B,	%g3
	movcc	%xcc,	%i2,	%g2
	edge32ln	%o2,	%i3,	%l0
	movleu	%icc,	%l4,	%l6
	movg	%xcc,	%i4,	%o4
	array8	%i6,	%g6,	%o3
	popc	0x101E,	%g5
	smul	%l3,	0x1511,	%g1
	ldub	[%l7 + 0x46],	%o6
	lduw	[%l7 + 0x10],	%i1
	andn	%i7,	0x01F0,	%o5
	addcc	%l1,	%o0,	%l2
	movre	%i5,	%g4,	%l5
	edge16ln	%g7,	%o1,	%i0
	movre	%o7,	%i2,	%g3
	lduw	[%l7 + 0x40],	%g2
	sub	%i3,	0x07DE,	%o2
	fmovsge	%icc,	%f16,	%f21
	ldd	[%l7 + 0x78],	%f26
	ldsh	[%l7 + 0x5E],	%l4
	addc	%l0,	%l6,	%o4
	st	%f1,	[%l7 + 0x60]
	sllx	%i6,	0x0F,	%g6
	mulscc	%o3,	0x1B74,	%g5
	subc	%l3,	%i4,	%o6
	andcc	%g1,	0x1898,	%i1
	fmovrslez	%o5,	%f28,	%f26
	edge16	%l1,	%i7,	%o0
	movcs	%icc,	%l2,	%g4
	movpos	%icc,	%i5,	%g7
	ldd	[%l7 + 0x50],	%l4
	for	%f22,	%f6,	%f20
	edge16ln	%i0,	%o7,	%o1
	movpos	%icc,	%g3,	%i2
	array8	%g2,	%i3,	%l4
	smulcc	%o2,	%l6,	%o4
	xorcc	%l0,	0x0770,	%i6
	sdivcc	%g6,	0x1CB9,	%g5
	fmovsne	%icc,	%f30,	%f4
	fpadd32	%f14,	%f16,	%f10
	stb	%l3,	[%l7 + 0x15]
	sllx	%o3,	0x06,	%o6
	ldd	[%l7 + 0x68],	%f22
	movleu	%xcc,	%g1,	%i1
	ldsw	[%l7 + 0x70],	%i4
	fmovdge	%xcc,	%f11,	%f21
	movrne	%l1,	0x06B,	%o5
	andcc	%i7,	%l2,	%g4
	edge32l	%o0,	%g7,	%i5
	mulscc	%i0,	%l5,	%o1
	ld	[%l7 + 0x4C],	%f5
	mova	%icc,	%g3,	%o7
	alignaddrl	%g2,	%i2,	%l4
	lduw	[%l7 + 0x70],	%o2
	sllx	%i3,	0x1F,	%l6
	fcmple32	%f2,	%f16,	%l0
	fornot2s	%f4,	%f23,	%f21
	popc	0x1BDD,	%i6
	fmovrsgez	%g6,	%f8,	%f17
	fpack32	%f30,	%f12,	%f8
	movge	%xcc,	%g5,	%l3
	movn	%icc,	%o3,	%o4
	sir	0x1592
	mulscc	%o6,	%g1,	%i4
	orn	%i1,	0x1EB1,	%o5
	lduw	[%l7 + 0x10],	%l1
	sdivcc	%i7,	0x19C6,	%l2
	edge16l	%o0,	%g4,	%g7
	mulscc	%i5,	0x1ADC,	%l5
	movgu	%icc,	%i0,	%g3
	fone	%f24
	sethi	0x1377,	%o1
	fcmpgt32	%f8,	%f20,	%o7
	fsrc1	%f8,	%f26
	movle	%icc,	%i2,	%l4
	xnor	%g2,	0x1B46,	%o2
	edge8	%l6,	%l0,	%i6
	alignaddr	%g6,	%g5,	%i3
	movcc	%icc,	%o3,	%l3
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	fmul8ulx16	%f30,	%f20,	%f18
	edge32ln	%i4,	%i1,	%o5
	movpos	%icc,	%l1,	%i7
	fands	%f20,	%f27,	%f6
	sub	%l2,	0x044A,	%o4
	std	%f0,	[%l7 + 0x18]
	fcmpeq32	%f10,	%f20,	%g4
	stx	%o0,	[%l7 + 0x58]
	xnorcc	%g7,	%l5,	%i0
	fcmpd	%fcc1,	%f2,	%f26
	st	%f28,	[%l7 + 0x18]
	mulscc	%g3,	0x1FE3,	%i5
	fmovsn	%icc,	%f1,	%f5
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%o6
	subccc	%i2,	0x1508,	%o1
	save %g2, %l4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	siam	0x3
	srax	%l6,	0x16,	%l0
	fsrc2	%f16,	%f20
	fmovsl	%icc,	%f16,	%f30
	fmovsgu	%xcc,	%f17,	%f16
	subc	%i6,	%g6,	%i3
	edge32n	%o3,	%l3,	%g5
	edge32l	%o6,	%g1,	%i1
	fmovdvs	%xcc,	%f8,	%f2
	sir	0x1237
	fornot1	%f2,	%f20,	%f26
	edge16ln	%i4,	%l1,	%i7
	sllx	%o5,	%l2,	%g4
	std	%f2,	[%l7 + 0x60]
	bshuffle	%f26,	%f0,	%f0
	fcmple32	%f6,	%f26,	%o0
	add	%o4,	0x174B,	%l5
	ldsb	[%l7 + 0x24],	%g7
	mulx	%i0,	0x1DA6,	%i5
	fexpand	%f18,	%f20
	edge8l	%g3,	%i2,	%o7
	fpsub32	%f12,	%f28,	%f10
	edge16	%o1,	%l4,	%o2
	move	%icc,	%l6,	%l0
	sdivcc	%i6,	0x16D2,	%g6
	move	%xcc,	%g2,	%i3
	stb	%l3,	[%l7 + 0x16]
	xnor	%o3,	0x0289,	%o6
	sll	%g1,	%g5,	%i4
	ldd	[%l7 + 0x78],	%i0
	ldd	[%l7 + 0x58],	%i6
	fmovde	%xcc,	%f0,	%f31
	fmovspos	%icc,	%f7,	%f14
	subcc	%o5,	%l2,	%g4
	orncc	%o0,	0x0A9B,	%o4
	and	%l1,	0x198A,	%l5
	umul	%i0,	0x1F51,	%g7
	array16	%i5,	%i2,	%o7
	std	%f24,	[%l7 + 0x08]
	fmovsl	%xcc,	%f30,	%f10
	andn	%g3,	%l4,	%o2
	ldsh	[%l7 + 0x3A],	%l6
	fornot2	%f24,	%f18,	%f10
	alignaddr	%l0,	%o1,	%i6
	lduh	[%l7 + 0x78],	%g6
	udivcc	%i3,	0x19D0,	%g2
	sdiv	%l3,	0x0C1D,	%o3
	fsrc1s	%f19,	%f22
	ldub	[%l7 + 0x72],	%o6
	sll	%g5,	%i4,	%i1
	fmovsvc	%icc,	%f21,	%f1
	nop
	set	0x20, %i1
	ldx	[%l7 + %i1],	%i7
	fones	%f9
	fcmpne16	%f28,	%f6,	%g1
	fcmpgt32	%f28,	%f8,	%l2
	array8	%o5,	%o0,	%o4
	mova	%xcc,	%l1,	%g4
	subccc	%i0,	%g7,	%l5
	fmovdpos	%xcc,	%f20,	%f23
	sethi	0x0D03,	%i2
	movrlez	%i5,	%o7,	%g3
	fmovscc	%icc,	%f30,	%f10
	fmovrdgz	%l4,	%f6,	%f28
	sll	%l6,	0x1D,	%o2
	fand	%f0,	%f4,	%f6
	st	%f15,	[%l7 + 0x10]
	addc	%l0,	0x178B,	%i6
	ldsb	[%l7 + 0x35],	%o1
	lduh	[%l7 + 0x3E],	%g6
	sra	%g2,	%l3,	%i3
	movvs	%icc,	%o3,	%g5
	orncc	%i4,	0x095A,	%i1
	movne	%icc,	%i7,	%o6
	fmovdleu	%xcc,	%f1,	%f6
	umul	%l2,	0x1827,	%g1
	array16	%o5,	%o4,	%o0
	udivx	%g4,	0x1231,	%i0
	ldub	[%l7 + 0x73],	%g7
	movne	%icc,	%l1,	%i2
	sdiv	%l5,	0x19B3,	%o7
	fmovdgu	%xcc,	%f28,	%f14
	ldub	[%l7 + 0x67],	%i5
	ldx	[%l7 + 0x48],	%g3
	addc	%l4,	%l6,	%o2
	array16	%l0,	%i6,	%g6
	movl	%icc,	%o1,	%g2
	fmovsvs	%icc,	%f4,	%f17
	mova	%xcc,	%l3,	%i3
	smul	%o3,	0x0875,	%i4
	fmuld8sux16	%f0,	%f30,	%f0
	edge32l	%g5,	%i7,	%o6
	array16	%l2,	%i1,	%o5
	nop
	set	0x4B, %o2
	stb	%o4,	[%l7 + %o2]
	fnor	%f22,	%f8,	%f22
	movre	%o0,	0x101,	%g1
	lduw	[%l7 + 0x7C],	%i0
	fnegd	%f26,	%f14
	fmovrdlez	%g4,	%f4,	%f8
	restore %l1, 0x15F8, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l5,	%i2,	%i5
	ldd	[%l7 + 0x40],	%g2
	movrlz	%o7,	0x39E,	%l4
	fmul8x16	%f22,	%f2,	%f4
	edge8ln	%l6,	%o2,	%i6
	smulcc	%l0,	%o1,	%g6
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	fcmped	%fcc0,	%f16,	%f8
	movvc	%icc,	%o3,	%i4
	and	%g5,	0x192B,	%g2
	stw	%i7,	[%l7 + 0x60]
	edge16ln	%l2,	%i1,	%o6
	fmuld8sux16	%f17,	%f14,	%f28
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%o4
	alignaddrl	%o4,	%g1,	%o0
	fone	%f8
	fmovse	%xcc,	%f6,	%f27
	ldub	[%l7 + 0x5A],	%i0
	movle	%xcc,	%g4,	%l1
	andncc	%l5,	%g7,	%i5
	movneg	%xcc,	%g3,	%o7
	ldd	[%l7 + 0x58],	%f22
	stx	%i2,	[%l7 + 0x58]
	fmovs	%f9,	%f5
	umul	%l6,	%l4,	%i6
	fpack16	%f26,	%f2
	st	%f21,	[%l7 + 0x54]
	fzeros	%f13
	edge32n	%o2,	%o1,	%g6
	edge8ln	%l0,	%i3,	%o3
	ldub	[%l7 + 0x47],	%l3
	fmovsa	%xcc,	%f22,	%f28
	ld	[%l7 + 0x5C],	%f16
	movl	%icc,	%i4,	%g2
	fnegs	%f11,	%f1
	fpackfix	%f16,	%f5
	xnor	%i7,	%l2,	%i1
	umul	%o6,	%o5,	%g5
	array32	%g1,	%o0,	%i0
	fmovsneg	%xcc,	%f1,	%f11
	fpsub16s	%f17,	%f29,	%f18
	sdiv	%g4,	0x15AC,	%o4
	fnot1s	%f15,	%f14
	ldsb	[%l7 + 0x76],	%l1
	and	%g7,	0x0ECF,	%i5
	fmovrdgez	%l5,	%f18,	%f26
	fmovrsne	%o7,	%f31,	%f5
	fabss	%f27,	%f17
	umul	%g3,	0x0098,	%l6
	ld	[%l7 + 0x34],	%f8
	xor	%i2,	0x16CC,	%l4
	ldx	[%l7 + 0x08],	%o2
	fmovrde	%o1,	%f12,	%f0
	movpos	%xcc,	%g6,	%l0
	movrgz	%i6,	%i3,	%o3
	edge32n	%i4,	%l3,	%i7
	edge8ln	%l2,	%g2,	%o6
	edge8n	%i1,	%g5,	%o5
	fmovrdlz	%o0,	%f8,	%f16
	subc	%g1,	0x0229,	%g4
	fmovde	%xcc,	%f21,	%f24
	nop
	set	0x60, %l2
	std	%f2,	[%l7 + %l2]
	sra	%o4,	%l1,	%g7
	fmovspos	%icc,	%f26,	%f13
	ldx	[%l7 + 0x40],	%i0
	fmovrdgez	%i5,	%f24,	%f22
	orncc	%o7,	0x0347,	%g3
	movrlez	%l6,	0x3FF,	%l5
	sir	0x1BDC
	udivcc	%l4,	0x0DAA,	%o2
	array16	%o1,	%g6,	%l0
	edge32l	%i2,	%i6,	%i3
	nop
	set	0x14, %g3
	ldsw	[%l7 + %g3],	%i4
	xorcc	%o3,	%l3,	%i7
	movcs	%xcc,	%g2,	%o6
	movre	%i1,	0x2D4,	%g5
	stx	%o5,	[%l7 + 0x60]
	orcc	%l2,	0x18BD,	%g1
	fcmpes	%fcc2,	%f10,	%f19
	edge16ln	%o0,	%o4,	%g4
	movre	%g7,	%l1,	%i5
	subc	%i0,	0x0434,	%g3
	orncc	%l6,	0x0EA4,	%l5
	movvs	%icc,	%l4,	%o7
	ld	[%l7 + 0x1C],	%f28
	udivx	%o1,	0x16EC,	%o2
	array32	%l0,	%i2,	%i6
	addccc	%i3,	%g6,	%i4
	movge	%icc,	%l3,	%i7
	fmovrdlez	%o3,	%f14,	%f26
	movg	%xcc,	%g2,	%o6
	fmovdcs	%icc,	%f1,	%f5
	fpadd16s	%f19,	%f7,	%f10
	movg	%icc,	%g5,	%o5
	edge16ln	%l2,	%g1,	%o0
	sth	%i1,	[%l7 + 0x70]
	xor	%o4,	0x0EF8,	%g4
	movrlez	%l1,	0x394,	%i5
	fcmpne16	%f4,	%f6,	%i0
	faligndata	%f26,	%f4,	%f22
	movpos	%icc,	%g7,	%g3
	sir	0x093D
	andncc	%l6,	%l5,	%l4
	ldsh	[%l7 + 0x12],	%o1
	mulx	%o7,	0x15EF,	%l0
	fornot1s	%f31,	%f7,	%f0
	sdivx	%o2,	0x1FA6,	%i6
	fmovs	%f20,	%f13
	udivcc	%i3,	0x1530,	%g6
	stb	%i4,	[%l7 + 0x7B]
	movrne	%l3,	%i7,	%o3
	siam	0x3
	edge8ln	%g2,	%i2,	%o6
	movle	%xcc,	%o5,	%l2
	array32	%g1,	%g5,	%o0
	movrne	%i1,	0x3EF,	%g4
	fmovscc	%icc,	%f0,	%f2
	andcc	%l1,	%i5,	%i0
	movvc	%xcc,	%g7,	%g3
	sir	0x0466
	fmovsleu	%xcc,	%f23,	%f9
	mulx	%o4,	0x0522,	%l5
	andcc	%l6,	%l4,	%o1
	movrgez	%l0,	0x1B3,	%o2
	sdiv	%o7,	0x12D3,	%i6
	umul	%i3,	0x1BF2,	%i4
	fabsd	%f6,	%f30
	fnot2s	%f11,	%f19
	andncc	%l3,	%i7,	%o3
	movle	%xcc,	%g2,	%g6
	umulcc	%o6,	%o5,	%i2
	edge32l	%l2,	%g1,	%g5
	fnand	%f22,	%f2,	%f6
	movrlez	%o0,	%i1,	%g4
	orn	%l1,	%i0,	%i5
	subcc	%g7,	%o4,	%l5
	udiv	%l6,	0x1D28,	%g3
	ldd	[%l7 + 0x40],	%f4
	srax	%l4,	%l0,	%o2
	orcc	%o7,	%i6,	%o1
	sir	0x0C82
	sth	%i3,	[%l7 + 0x4E]
	udivx	%i4,	0x1231,	%l3
	fmul8x16au	%f27,	%f15,	%f26
	edge32n	%i7,	%o3,	%g2
	sdivx	%g6,	0x1827,	%o5
	orn	%o6,	%i2,	%g1
	srax	%l2,	0x1E,	%o0
	stb	%i1,	[%l7 + 0x5C]
	sdivx	%g4,	0x1F2A,	%g5
	sir	0x1A29
	move	%xcc,	%l1,	%i0
	fmovrsgez	%g7,	%f24,	%f3
	array32	%o4,	%l5,	%l6
	sllx	%i5,	0x0A,	%l4
	subcc	%g3,	%o2,	%l0
	srax	%i6,	0x0C,	%o1
	popc	0x0993,	%i3
	subcc	%o7,	0x0624,	%l3
	sll	%i4,	0x08,	%i7
	popc	%g2,	%o3
	fsrc1s	%f25,	%f24
	fnot1	%f2,	%f22
	movleu	%xcc,	%g6,	%o5
	fcmpeq16	%f6,	%f18,	%o6
	movge	%xcc,	%i2,	%g1
	mova	%xcc,	%l2,	%o0
	fmovdl	%xcc,	%f12,	%f13
	lduw	[%l7 + 0x14],	%i1
	fmovsne	%xcc,	%f8,	%f23
	movrlez	%g4,	%g5,	%i0
	ldub	[%l7 + 0x50],	%l1
	movrgz	%g7,	%l5,	%o4
	edge8l	%i5,	%l6,	%l4
	edge16l	%g3,	%l0,	%i6
	edge16n	%o1,	%i3,	%o2
	andncc	%o7,	%i4,	%i7
	fpsub32	%f6,	%f6,	%f4
	sth	%l3,	[%l7 + 0x5E]
	sethi	0x02C7,	%g2
	st	%f24,	[%l7 + 0x24]
	ldsw	[%l7 + 0x48],	%g6
	umulcc	%o3,	0x161B,	%o5
	sllx	%o6,	0x1B,	%g1
	restore %l2, %o0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g4,	%i2,	%g5
	fabss	%f6,	%f20
	alignaddr	%l1,	%i0,	%l5
	fandnot1s	%f23,	%f15,	%f15
	alignaddr	%o4,	%i5,	%g7
	movgu	%xcc,	%l6,	%l4
	movrne	%l0,	%g3,	%i6
	mulx	%o1,	0x151F,	%o2
	move	%xcc,	%i3,	%i4
	edge16n	%o7,	%i7,	%g2
	sethi	0x180E,	%g6
	ldsw	[%l7 + 0x6C],	%o3
	sth	%l3,	[%l7 + 0x12]
	edge16ln	%o5,	%o6,	%g1
	ld	[%l7 + 0x5C],	%f20
	xor	%l2,	0x04EB,	%o0
	array8	%i1,	%g4,	%i2
	movrgez	%g5,	0x3D9,	%l1
	popc	%l5,	%i0
	movl	%xcc,	%i5,	%g7
	fnegs	%f16,	%f3
	ld	[%l7 + 0x38],	%f1
	subc	%l6,	0x19F7,	%o4
	edge16l	%l4,	%l0,	%i6
	mova	%icc,	%g3,	%o2
	subcc	%o1,	0x1D9C,	%i3
	xnorcc	%o7,	%i7,	%i4
	movl	%xcc,	%g2,	%o3
	fornot2	%f14,	%f26,	%f16
	stw	%g6,	[%l7 + 0x74]
	movg	%icc,	%l3,	%o5
	move	%xcc,	%g1,	%l2
	fabss	%f23,	%f24
	movle	%icc,	%o6,	%i1
	mulscc	%o0,	%g4,	%i2
	addccc	%g5,	0x0984,	%l5
	xnorcc	%l1,	%i5,	%i0
	udivx	%l6,	0x0AD8,	%g7
	fpadd16s	%f29,	%f28,	%f19
	movrlez	%o4,	0x39D,	%l0
	xnor	%i6,	%g3,	%l4
	alignaddr	%o2,	%i3,	%o1
	stb	%o7,	[%l7 + 0x78]
	fmovdcs	%icc,	%f0,	%f29
	fmovdn	%xcc,	%f5,	%f23
	fnegd	%f30,	%f26
	edge8ln	%i4,	%i7,	%g2
	umul	%o3,	0x1FDC,	%g6
	fcmpeq32	%f0,	%f24,	%l3
	sdiv	%g1,	0x0897,	%o5
	addccc	%l2,	%o6,	%o0
	andncc	%g4,	%i1,	%i2
	andncc	%g5,	%l1,	%i5
	stb	%i0,	[%l7 + 0x3D]
	stw	%l6,	[%l7 + 0x40]
	std	%f4,	[%l7 + 0x58]
	edge32	%g7,	%o4,	%l0
	fmovdl	%icc,	%f17,	%f12
	fpadd32s	%f12,	%f10,	%f14
	ldx	[%l7 + 0x18],	%i6
	fmovs	%f27,	%f15
	sir	0x1293
	subcc	%l5,	%g3,	%o2
	alignaddrl	%l4,	%o1,	%o7
	smulcc	%i4,	0x1EE7,	%i3
	mulscc	%i7,	0x14B8,	%o3
	sllx	%g2,	0x12,	%g6
	sllx	%l3,	%g1,	%l2
	ldd	[%l7 + 0x58],	%f22
	ld	[%l7 + 0x4C],	%f14
	sth	%o5,	[%l7 + 0x1A]
	movrgez	%o6,	%g4,	%o0
	fpadd16s	%f7,	%f25,	%f20
	xnorcc	%i1,	%i2,	%g5
	move	%icc,	%l1,	%i5
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	edge16ln	%g7,	%l0,	%o4
	sir	0x13F1
	move	%icc,	%i6,	%g3
	andcc	%l5,	%o2,	%l4
	save %o1, %i4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f18,	%f6,	%f0
	fmovrdlez	%i7,	%f8,	%f24
	subc	%o3,	0x1604,	%g2
	fmovda	%icc,	%f25,	%f15
	movn	%xcc,	%i3,	%l3
	edge8	%g1,	%g6,	%o5
	add	%o6,	%l2,	%o0
	andn	%g4,	0x1D0D,	%i1
	alignaddrl	%i2,	%g5,	%l1
	fmul8x16al	%f25,	%f21,	%f12
	umulcc	%i5,	%i0,	%l6
	mulx	%l0,	%g7,	%i6
	siam	0x0
	sub	%o4,	%g3,	%l5
	fands	%f30,	%f28,	%f14
	movrne	%o2,	%l4,	%o1
	addccc	%o7,	0x1CED,	%i4
	fnands	%f22,	%f11,	%f12
	xor	%i7,	%g2,	%o3
	array32	%l3,	%i3,	%g6
	edge16l	%g1,	%o6,	%l2
	array8	%o5,	%g4,	%o0
	fmovsn	%xcc,	%f23,	%f2
	movrgez	%i2,	%g5,	%i1
	subccc	%i5,	%l1,	%i0
	mova	%xcc,	%l6,	%l0
	for	%f4,	%f18,	%f4
	addccc	%g7,	%o4,	%g3
	fmovscc	%icc,	%f14,	%f1
	srl	%i6,	0x15,	%l5
	ldd	[%l7 + 0x30],	%f16
	fpsub32s	%f19,	%f4,	%f24
	movl	%xcc,	%l4,	%o2
	ldd	[%l7 + 0x08],	%o6
	movge	%icc,	%o1,	%i4
	xor	%g2,	0x139E,	%i7
	fnot2s	%f7,	%f21
	sdivx	%l3,	0x06CA,	%i3
	fcmpeq32	%f6,	%f20,	%o3
	mova	%icc,	%g6,	%g1
	movre	%o6,	0x196,	%o5
	fmovrslz	%l2,	%f6,	%f15
	movl	%icc,	%g4,	%i2
	edge8ln	%g5,	%o0,	%i5
	alignaddrl	%i1,	%l1,	%l6
	edge8ln	%l0,	%g7,	%o4
	edge16	%g3,	%i0,	%i6
	movl	%icc,	%l5,	%l4
	movrgz	%o7,	0x1D3,	%o1
	fcmps	%fcc0,	%f3,	%f17
	edge16	%o2,	%g2,	%i4
	sll	%l3,	0x0E,	%i3
	fmovrde	%o3,	%f22,	%f12
	fmovrse	%g6,	%f11,	%f20
	fmovsle	%icc,	%f24,	%f0
	mova	%xcc,	%i7,	%g1
	stx	%o6,	[%l7 + 0x48]
	edge32l	%o5,	%g4,	%i2
	subc	%g5,	0x000C,	%o0
	fmovdneg	%icc,	%f16,	%f25
	movgu	%xcc,	%i5,	%i1
	nop
	set	0x40, %l4
	stx	%l2,	[%l7 + %l4]
	stb	%l6,	[%l7 + 0x68]
	udiv	%l0,	0x1E5F,	%l1
	array16	%g7,	%o4,	%i0
	edge32ln	%g3,	%l5,	%l4
	movleu	%icc,	%i6,	%o7
	ldd	[%l7 + 0x08],	%o2
	srlx	%g2,	%i4,	%o1
	movne	%xcc,	%l3,	%o3
	fmovda	%xcc,	%f15,	%f0
	fmovsl	%icc,	%f27,	%f3
	and	%g6,	%i3,	%i7
	movn	%icc,	%o6,	%g1
	ldsb	[%l7 + 0x33],	%g4
	ld	[%l7 + 0x6C],	%f5
	fpsub32	%f10,	%f4,	%f8
	sethi	0x10F8,	%o5
	fcmped	%fcc2,	%f28,	%f4
	lduw	[%l7 + 0x4C],	%i2
	ldd	[%l7 + 0x60],	%o0
	add	%i5,	%g5,	%l2
	sethi	0x1F26,	%l6
	fmovdge	%icc,	%f20,	%f19
	edge16	%i1,	%l0,	%g7
	fone	%f16
	stb	%o4,	[%l7 + 0x3E]
	fpadd16	%f30,	%f18,	%f24
	fmovs	%f2,	%f29
	movcs	%xcc,	%l1,	%g3
	mulscc	%l5,	0x1EBB,	%l4
	andcc	%i0,	%i6,	%o7
	movcc	%xcc,	%o2,	%i4
	fcmpeq32	%f22,	%f22,	%g2
	orcc	%l3,	%o3,	%o1
	addccc	%g6,	%i7,	%i3
	udivx	%g1,	0x016B,	%g4
	movrgez	%o5,	0x36D,	%o6
	restore %o0, %i5, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g5,	%l6,	%i1
	fsrc1s	%f5,	%f5
	fcmpd	%fcc3,	%f16,	%f14
	movge	%xcc,	%l2,	%g7
	xorcc	%o4,	0x1A9E,	%l0
	fandnot2s	%f23,	%f30,	%f22
	array16	%g3,	%l1,	%l4
	save %i0, 0x0321, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o7,	%l5,	%i4
	smul	%g2,	%o2,	%l3
	movre	%o1,	%o3,	%i7
	fnot2	%f30,	%f0
	movl	%icc,	%i3,	%g6
	fmovdvc	%icc,	%f28,	%f27
	fnegd	%f2,	%f4
	udivx	%g1,	0x07DA,	%g4
	srlx	%o5,	0x0C,	%o0
	add	%i5,	%i2,	%o6
	movrlez	%l6,	%g5,	%l2
	array16	%g7,	%i1,	%l0
	edge16ln	%o4,	%g3,	%l1
	edge8	%i0,	%l4,	%i6
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	fmovdgu	%icc,	%f7,	%f19
	xnor	%g2,	%o2,	%i4
	alignaddr	%o1,	%o3,	%l3
	ldx	[%l7 + 0x28],	%i3
	movgu	%xcc,	%i7,	%g1
	mulx	%g6,	%o5,	%g4
	movge	%icc,	%i5,	%o0
	andncc	%o6,	%i2,	%l6
	ldsb	[%l7 + 0x0B],	%l2
	srlx	%g7,	%g5,	%l0
	array32	%o4,	%i1,	%g3
	and	%l1,	0x1180,	%l4
	or	%i6,	%i0,	%l5
	smulcc	%o7,	0x0E4A,	%o2
	andcc	%g2,	%i4,	%o1
	ldsw	[%l7 + 0x18],	%o3
	save %l3, 0x1AB5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f14,	%f7
	ldd	[%l7 + 0x30],	%f24
	sdiv	%i7,	0x1063,	%g1
	fandnot1s	%f15,	%f20,	%f23
	movgu	%xcc,	%o5,	%g6
	edge16	%g4,	%i5,	%o0
	sth	%i2,	[%l7 + 0x1A]
	movcs	%icc,	%l6,	%l2
	array8	%g7,	%g5,	%o6
	movneg	%icc,	%o4,	%l0
	srl	%g3,	%l1,	%l4
	nop
	set	0x2E, %o3
	ldub	[%l7 + %o3],	%i6
	and	%i0,	0x12C8,	%i1
	fone	%f6
	umulcc	%l5,	%o7,	%g2
	fzeros	%f21
	fmovrdne	%o2,	%f16,	%f20
	sth	%o1,	[%l7 + 0x5E]
	movrne	%i4,	%o3,	%l3
	stb	%i7,	[%l7 + 0x5B]
	sir	0x00E5
	movrlez	%i3,	%o5,	%g1
	array16	%g4,	%i5,	%o0
	fandnot2s	%f7,	%f17,	%f31
	ldub	[%l7 + 0x0A],	%i2
	fpsub32	%f10,	%f30,	%f24
	fmovscc	%xcc,	%f21,	%f2
	movrgz	%l6,	0x120,	%g6
	movre	%g7,	0x0F5,	%g5
	fpmerge	%f10,	%f15,	%f16
	move	%xcc,	%o6,	%o4
	array8	%l0,	%g3,	%l2
	srax	%l4,	0x0A,	%l1
	sll	%i6,	0x1D,	%i1
	sdivcc	%i0,	0x013F,	%l5
	stw	%o7,	[%l7 + 0x6C]
	fmul8ulx16	%f12,	%f8,	%f20
	movge	%icc,	%g2,	%o1
	movne	%xcc,	%o2,	%o3
	movcs	%xcc,	%l3,	%i7
	array8	%i3,	%i4,	%g1
	fmul8ulx16	%f10,	%f22,	%f30
	movle	%xcc,	%o5,	%g4
	array32	%i5,	%i2,	%o0
	srax	%l6,	0x10,	%g7
	udivcc	%g5,	0x07F0,	%g6
	sll	%o6,	%o4,	%l0
	fcmpeq16	%f22,	%f0,	%l2
	popc	0x1B6F,	%l4
	for	%f20,	%f12,	%f18
	array8	%l1,	%g3,	%i6
	sth	%i0,	[%l7 + 0x52]
	restore %l5, %o7, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o1,	%g2
	srl	%o2,	%l3,	%i7
	movrlz	%o3,	0x2B2,	%i4
	fones	%f4
	movcs	%xcc,	%i3,	%o5
	movrlez	%g1,	%i5,	%i2
	save %o0, 0x1664, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g7,	0x03,	%l6
	fpadd16s	%f7,	%f12,	%f18
	fmovsleu	%icc,	%f30,	%f11
	array16	%g5,	%o6,	%o4
	movne	%icc,	%l0,	%g6
	sir	0x0DDF
	save %l4, %l2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i6,	%i0
	ldub	[%l7 + 0x69],	%g3
	fpsub16s	%f4,	%f31,	%f15
	edge8l	%l5,	%o7,	%o1
	orn	%i1,	0x0413,	%g2
	umul	%l3,	%i7,	%o2
	move	%icc,	%o3,	%i3
	edge8	%i4,	%o5,	%i5
	sra	%i2,	0x07,	%g1
	movg	%xcc,	%g4,	%o0
	mova	%icc,	%l6,	%g7
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	fcmpeq32	%f16,	%f14,	%g6
	edge8	%l0,	%l4,	%l2
	edge32l	%i6,	%i0,	%g3
	andn	%l5,	%l1,	%o7
	movrgz	%i1,	%o1,	%g2
	srl	%l3,	%i7,	%o2
	subc	%o3,	0x07AD,	%i4
	movvs	%xcc,	%o5,	%i3
	fabsd	%f6,	%f0
	movl	%icc,	%i2,	%g1
	smul	%i5,	%o0,	%g4
	add	%l6,	%g7,	%o6
	fandnot1s	%f8,	%f24,	%f5
	add	%g5,	%o4,	%l0
	fsrc1s	%f18,	%f19
	save %g6, %l2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i0,	%l4,	%g3
	edge16ln	%l1,	%o7,	%l5
	movrne	%o1,	0x3A9,	%i1
	fmovrslez	%l3,	%f23,	%f25
	mova	%xcc,	%i7,	%o2
	edge16n	%g2,	%i4,	%o3
	ldsh	[%l7 + 0x36],	%i3
	stb	%o5,	[%l7 + 0x2E]
	fnot2s	%f8,	%f19
	stb	%i2,	[%l7 + 0x2F]
	edge16l	%g1,	%o0,	%g4
	fmovsvs	%icc,	%f26,	%f13
	ldub	[%l7 + 0x56],	%i5
	or	%l6,	%o6,	%g7
	restore %g5, 0x0A50, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%g6,	0x1CD8,	%l2
	fnot1s	%f1,	%f13
	fpadd16s	%f13,	%f22,	%f19
	ldd	[%l7 + 0x60],	%i6
	movre	%i0,	0x17C,	%l0
	or	%g3,	%l4,	%o7
	fnors	%f31,	%f1,	%f17
	ldub	[%l7 + 0x6C],	%l5
	movne	%xcc,	%l1,	%i1
	movne	%icc,	%o1,	%l3
	movcs	%xcc,	%i7,	%g2
	sra	%o2,	%i4,	%o3
	ldd	[%l7 + 0x50],	%f6
	fmovsa	%icc,	%f3,	%f17
	movcs	%icc,	%i3,	%o5
	edge16l	%g1,	%i2,	%g4
	movvc	%icc,	%o0,	%l6
	movre	%i5,	%o6,	%g5
	fmovdcs	%icc,	%f24,	%f26
	movge	%icc,	%g7,	%g6
	smulcc	%l2,	%i6,	%i0
	fcmpne32	%f18,	%f28,	%l0
	edge16n	%g3,	%l4,	%o7
	fsrc2s	%f22,	%f3
	ldd	[%l7 + 0x08],	%f16
	fcmpgt32	%f22,	%f22,	%o4
	array16	%l1,	%i1,	%l5
	movrgz	%l3,	0x0A1,	%o1
	sllx	%i7,	0x1E,	%g2
	for	%f28,	%f2,	%f20
	orn	%i4,	%o2,	%o3
	fmovs	%f12,	%f30
	fcmpd	%fcc0,	%f10,	%f14
	fmuld8ulx16	%f1,	%f7,	%f12
	srlx	%i3,	0x0B,	%g1
	fpsub16s	%f16,	%f24,	%f3
	srlx	%i2,	0x00,	%o5
	edge32ln	%o0,	%g4,	%i5
	movrgez	%o6,	%g5,	%g7
	sra	%g6,	%l6,	%l2
	ldsb	[%l7 + 0x41],	%i0
	and	%i6,	%l0,	%l4
	sdivx	%g3,	0x0662,	%o4
	movrgez	%o7,	0x129,	%l1
	fmuld8sux16	%f30,	%f15,	%f8
	movne	%icc,	%l5,	%i1
	sub	%o1,	0x14CB,	%l3
	sdivcc	%g2,	0x14CE,	%i4
	add	%i7,	0x15E6,	%o3
	and	%o2,	0x0983,	%g1
	fabsd	%f0,	%f12
	orcc	%i2,	%i3,	%o0
	edge32ln	%g4,	%i5,	%o6
	st	%f26,	[%l7 + 0x3C]
	andcc	%o5,	0x028B,	%g7
	mulx	%g6,	%l6,	%l2
	andcc	%g5,	0x1F0F,	%i0
	movge	%xcc,	%l0,	%i6
	or	%l4,	%g3,	%o7
	fcmpgt32	%f22,	%f16,	%l1
	movrne	%o4,	0x210,	%l5
	sra	%o1,	0x01,	%i1
	srl	%g2,	0x10,	%i4
	edge8	%i7,	%l3,	%o3
	movn	%xcc,	%g1,	%o2
	sir	0x0FB6
	sdivx	%i3,	0x107C,	%i2
	xnor	%o0,	0x1CE2,	%i5
	fmul8x16	%f22,	%f24,	%f10
	fmovrslz	%o6,	%f27,	%f29
	ldsw	[%l7 + 0x18],	%o5
	sub	%g4,	%g7,	%g6
	smul	%l6,	%g5,	%l2
	movgu	%xcc,	%i0,	%l0
	fpsub16	%f0,	%f10,	%f14
	udivcc	%l4,	0x0BC3,	%g3
	fmovscs	%icc,	%f17,	%f11
	sra	%o7,	0x11,	%i6
	std	%f10,	[%l7 + 0x20]
	edge16n	%o4,	%l5,	%l1
	mulx	%i1,	%o1,	%g2
	or	%i7,	0x046F,	%i4
	fnand	%f24,	%f24,	%f24
	fcmple32	%f22,	%f0,	%o3
	fmovsg	%icc,	%f0,	%f15
	fpadd16	%f20,	%f0,	%f26
	addc	%l3,	%g1,	%o2
	sdivx	%i3,	0x098C,	%i2
	fmovrde	%i5,	%f16,	%f2
	fmovdl	%xcc,	%f2,	%f17
	movrgz	%o0,	0x3ED,	%o6
	edge8	%o5,	%g7,	%g6
	edge8ln	%g4,	%l6,	%l2
	sdiv	%i0,	0x05F4,	%l0
	edge32	%g5,	%l4,	%g3
	fexpand	%f17,	%f28
	movrne	%i6,	0x15D,	%o4
	fmul8sux16	%f18,	%f20,	%f24
	fnand	%f0,	%f26,	%f16
	lduw	[%l7 + 0x68],	%o7
	alignaddrl	%l5,	%l1,	%i1
	fornot2	%f10,	%f28,	%f24
	movrne	%o1,	%g2,	%i7
	movgu	%xcc,	%o3,	%i4
	sra	%l3,	%g1,	%i3
	ldsw	[%l7 + 0x18],	%i2
	orncc	%o2,	%i5,	%o0
	edge32l	%o6,	%g7,	%o5
	fnand	%f4,	%f10,	%f16
	movge	%xcc,	%g6,	%l6
	save %l2, %i0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l0,	%l4,	%g3
	fmovse	%icc,	%f4,	%f8
	sdivx	%g5,	0x0278,	%o4
	and	%i6,	%l5,	%o7
	fnot2	%f12,	%f8
	lduw	[%l7 + 0x60],	%l1
	fmovsne	%xcc,	%f22,	%f18
	fpack16	%f0,	%f14
	edge8	%o1,	%g2,	%i1
	fmovda	%xcc,	%f26,	%f21
	sdivx	%o3,	0x0C2C,	%i4
	mova	%icc,	%l3,	%g1
	udivx	%i7,	0x0E0B,	%i2
	fpackfix	%f10,	%f14
	add	%o2,	%i5,	%i3
	mulscc	%o0,	%o6,	%g7
	stx	%o5,	[%l7 + 0x70]
	fabsd	%f12,	%f30
	move	%xcc,	%l6,	%g6
	array8	%l2,	%g4,	%l0
	edge16ln	%i0,	%g3,	%l4
	edge8ln	%g5,	%i6,	%o4
	movcs	%xcc,	%o7,	%l1
	movle	%icc,	%l5,	%o1
	fcmpgt16	%f12,	%f28,	%i1
	movl	%icc,	%o3,	%i4
	array32	%l3,	%g2,	%i7
	fnot1	%f16,	%f0
	smulcc	%i2,	0x04C2,	%o2
	nop
	set	0x24, %i4
	lduw	[%l7 + %i4],	%i5
	movrlz	%i3,	%g1,	%o6
	alignaddrl	%o0,	%o5,	%l6
	array32	%g6,	%l2,	%g4
	edge32l	%l0,	%g7,	%g3
	or	%i0,	%g5,	%i6
	ldub	[%l7 + 0x11],	%l4
	movre	%o4,	0x082,	%o7
	movvc	%icc,	%l1,	%o1
	for	%f14,	%f20,	%f4
	edge16ln	%l5,	%i1,	%o3
	fcmpeq16	%f4,	%f12,	%i4
	ldub	[%l7 + 0x68],	%g2
	addccc	%i7,	0x1735,	%i2
	edge8n	%l3,	%i5,	%i3
	movre	%g1,	%o2,	%o6
	fnegd	%f10,	%f12
	fcmpne16	%f26,	%f14,	%o5
	smulcc	%l6,	%g6,	%o0
	edge8l	%l2,	%g4,	%l0
	edge8n	%g7,	%g3,	%g5
	fmul8x16al	%f29,	%f12,	%f6
	udivcc	%i0,	0x0EB3,	%i6
	xnor	%l4,	%o7,	%l1
	sra	%o1,	%l5,	%o4
	fpsub32s	%f22,	%f7,	%f1
	ldx	[%l7 + 0x28],	%i1
	sdivcc	%i4,	0x0E21,	%g2
	srlx	%o3,	%i7,	%i2
	udivcc	%i5,	0x1EFA,	%l3
	edge8	%i3,	%o2,	%o6
	std	%f4,	[%l7 + 0x50]
	ldsb	[%l7 + 0x73],	%o5
	fmovd	%f30,	%f14
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	orn	%o0,	0x0A54,	%g4
	movcs	%xcc,	%l0,	%g7
	popc	0x0D85,	%l2
	movre	%g3,	%g5,	%i0
	addcc	%l4,	%o7,	%l1
	fornot2	%f6,	%f8,	%f20
	edge8ln	%i6,	%l5,	%o4
	sra	%o1,	%i1,	%i4
	edge32ln	%o3,	%g2,	%i7
	srax	%i5,	%i2,	%l3
	movrgz	%o2,	0x2BB,	%i3
	move	%icc,	%o6,	%o5
	move	%xcc,	%g1,	%g6
	edge32n	%l6,	%o0,	%l0
	std	%f0,	[%l7 + 0x38]
	movcs	%xcc,	%g4,	%l2
	fmul8x16	%f28,	%f18,	%f18
	xorcc	%g7,	%g3,	%g5
	sllx	%l4,	%o7,	%l1
	movleu	%xcc,	%i6,	%i0
	subccc	%l5,	%o1,	%o4
	std	%f4,	[%l7 + 0x48]
	xnor	%i1,	0x1E32,	%i4
	xnor	%o3,	0x12B3,	%i7
	ldd	[%l7 + 0x18],	%i4
	sethi	0x1EA3,	%i2
	add	%l3,	%g2,	%i3
	siam	0x3
	sdiv	%o6,	0x0984,	%o5
	xorcc	%g1,	0x1C5E,	%o2
	stb	%l6,	[%l7 + 0x4D]
	mova	%xcc,	%g6,	%l0
	edge16l	%o0,	%l2,	%g4
	stb	%g3,	[%l7 + 0x45]
	movpos	%icc,	%g7,	%g5
	edge16ln	%o7,	%l4,	%i6
	movre	%i0,	%l1,	%l5
	edge8ln	%o1,	%o4,	%i4
	movcc	%icc,	%o3,	%i7
	fabss	%f23,	%f2
	nop
	set	0x10, %i0
	ldsh	[%l7 + %i0],	%i1
	fmovs	%f5,	%f1
	edge32	%i5,	%l3,	%i2
	edge16	%g2,	%i3,	%o5
	umul	%g1,	0x0471,	%o2
	fmovrslz	%o6,	%f2,	%f28
	edge32ln	%g6,	%l0,	%l6
	fmovdn	%icc,	%f26,	%f19
	movrlez	%o0,	0x3B0,	%l2
	movpos	%xcc,	%g3,	%g4
	movcc	%icc,	%g7,	%g5
	fpsub32	%f8,	%f24,	%f8
	array8	%l4,	%i6,	%o7
	umul	%l1,	0x1228,	%l5
	addcc	%i0,	%o1,	%i4
	lduw	[%l7 + 0x74],	%o3
	fxnors	%f12,	%f27,	%f16
	nop
	set	0x0C, %g5
	sth	%o4,	[%l7 + %g5]
	movvc	%icc,	%i1,	%i5
	fpsub32s	%f10,	%f0,	%f0
	fsrc2	%f24,	%f4
	smul	%l3,	%i7,	%g2
	stx	%i2,	[%l7 + 0x10]
	edge32	%i3,	%o5,	%g1
	movl	%xcc,	%o6,	%g6
	mulx	%o2,	0x0BED,	%l0
	edge8n	%l6,	%o0,	%g3
	stb	%g4,	[%l7 + 0x60]
	movvs	%xcc,	%g7,	%l2
	save %g5, %i6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l1,	%l5,	%i0
	umulcc	%o1,	%o7,	%o3
	sllx	%i4,	%i1,	%o4
	movl	%xcc,	%i5,	%i7
	fmovsleu	%xcc,	%f2,	%f25
	movn	%xcc,	%l3,	%g2
	mulx	%i2,	%i3,	%o5
	mulscc	%o6,	%g6,	%o2
	addcc	%l0,	0x04C5,	%g1
	addccc	%o0,	0x0918,	%g3
	sdiv	%l6,	0x0F43,	%g4
	movrne	%l2,	%g7,	%i6
	fnegs	%f21,	%f30
	srax	%l4,	0x16,	%g5
	movgu	%icc,	%l5,	%l1
	fmovdneg	%icc,	%f1,	%f19
	ldub	[%l7 + 0x4F],	%o1
	add	%i0,	%o7,	%o3
	movne	%icc,	%i4,	%i1
	subcc	%i5,	%i7,	%o4
	edge32l	%g2,	%i2,	%i3
	alignaddrl	%o5,	%o6,	%g6
	ldsh	[%l7 + 0x36],	%l3
	fmovscc	%xcc,	%f12,	%f9
	edge16n	%o2,	%l0,	%o0
	fmovdneg	%icc,	%f25,	%f30
	movleu	%xcc,	%g1,	%g3
	orcc	%g4,	%l6,	%l2
	st	%f13,	[%l7 + 0x08]
	subccc	%g7,	0x193A,	%l4
	srax	%i6,	%l5,	%g5
	ld	[%l7 + 0x58],	%f16
	edge32n	%l1,	%i0,	%o1
	movne	%xcc,	%o7,	%o3
	movleu	%xcc,	%i4,	%i1
	movge	%xcc,	%i7,	%o4
	lduh	[%l7 + 0x5C],	%g2
	movrgz	%i5,	0x084,	%i2
	fcmpes	%fcc2,	%f12,	%f21
	edge16	%i3,	%o6,	%o5
	sdivx	%g6,	0x06EE,	%o2
	sdivx	%l3,	0x0E31,	%o0
	fmovsleu	%icc,	%f29,	%f28
	movvs	%xcc,	%l0,	%g3
	addcc	%g1,	%g4,	%l6
	fmovsvc	%icc,	%f24,	%f31
	fcmpes	%fcc0,	%f0,	%f17
	xnor	%g7,	%l2,	%l4
	edge32	%l5,	%i6,	%g5
	sdivx	%l1,	0x045E,	%o1
	fabss	%f31,	%f3
	fmovda	%xcc,	%f24,	%f31
	edge8n	%o7,	%i0,	%i4
	movpos	%xcc,	%o3,	%i1
	fpsub16	%f12,	%f26,	%f20
	array8	%o4,	%i7,	%i5
	movrlz	%i2,	0x2D5,	%i3
	srax	%o6,	0x05,	%o5
	fnand	%f18,	%f0,	%f0
	movvs	%xcc,	%g6,	%o2
	edge32	%l3,	%o0,	%l0
	smul	%g2,	0x1100,	%g3
	xorcc	%g4,	%l6,	%g7
	smul	%g1,	0x1A6F,	%l2
	ldsb	[%l7 + 0x21],	%l4
	fnor	%f12,	%f6,	%f18
	ldsw	[%l7 + 0x74],	%l5
	fmovse	%xcc,	%f18,	%f28
	edge16	%i6,	%g5,	%o1
	edge16l	%l1,	%o7,	%i4
	sir	0x1929
	sub	%o3,	%i1,	%o4
	add	%i7,	%i5,	%i2
	fmovdpos	%xcc,	%f16,	%f7
	movcs	%xcc,	%i0,	%i3
	sdivcc	%o5,	0x1D9F,	%g6
	andncc	%o6,	%o2,	%l3
	umul	%o0,	%g2,	%g3
	edge32	%g4,	%l6,	%l0
	std	%f12,	[%l7 + 0x30]
	andcc	%g1,	%l2,	%l4
	sra	%g7,	0x19,	%i6
	sir	0x1F9C
	edge16n	%l5,	%g5,	%l1
	st	%f27,	[%l7 + 0x34]
	lduw	[%l7 + 0x20],	%o1
	and	%o7,	0x0759,	%i4
	fnegd	%f26,	%f12
	stb	%o3,	[%l7 + 0x1C]
	array8	%i1,	%i7,	%o4
	ldd	[%l7 + 0x50],	%i2
	st	%f8,	[%l7 + 0x4C]
	movvs	%icc,	%i5,	%i0
	movle	%xcc,	%i3,	%o5
	fmovde	%icc,	%f17,	%f3
	fmovrdne	%g6,	%f22,	%f26
	movrgez	%o6,	0x2E5,	%o2
	fmovdpos	%icc,	%f31,	%f16
	lduh	[%l7 + 0x34],	%l3
	movleu	%icc,	%o0,	%g2
	andn	%g4,	%g3,	%l0
	edge8ln	%l6,	%l2,	%l4
	xor	%g7,	0x0E7B,	%g1
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%l4
	xnor	%i6,	0x0D9C,	%l1
	subc	%o1,	0x050D,	%g5
	udivx	%o7,	0x049E,	%o3
	sra	%i1,	%i4,	%o4
	movg	%xcc,	%i7,	%i2
	add	%i0,	%i3,	%o5
	edge32ln	%i5,	%g6,	%o6
	umulcc	%o2,	%o0,	%l3
	fcmpgt16	%f6,	%f6,	%g4
	fmuld8ulx16	%f29,	%f18,	%f8
	edge8n	%g3,	%l0,	%g2
	nop
	set	0x5C, %g7
	ldsh	[%l7 + %g7],	%l6
	sir	0x0454
	array16	%l2,	%g7,	%l4
	fmovsvc	%icc,	%f20,	%f30
	fmovspos	%icc,	%f0,	%f24
	udivx	%g1,	0x1698,	%i6
	fandnot1s	%f28,	%f0,	%f13
	movcc	%icc,	%l1,	%o1
	ldx	[%l7 + 0x58],	%l5
	array8	%o7,	%g5,	%o3
	udivcc	%i1,	0x04A2,	%o4
	movgu	%xcc,	%i7,	%i2
	ldsb	[%l7 + 0x6B],	%i4
	ldd	[%l7 + 0x70],	%i0
	sdiv	%o5,	0x013A,	%i5
	fmovdleu	%xcc,	%f10,	%f23
	movg	%icc,	%i3,	%g6
	fandnot1	%f30,	%f20,	%f12
	sethi	0x0EBC,	%o6
	restore %o2, 0x103E, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%icc,	%f27,	%f18
	st	%f16,	[%l7 + 0x70]
	edge8l	%o0,	%g4,	%l0
	movrlez	%g2,	0x15D,	%l6
	array8	%g3,	%g7,	%l4
	sir	0x0C02
	sdivcc	%g1,	0x0657,	%i6
	fcmpne16	%f6,	%f30,	%l2
	movle	%icc,	%o1,	%l5
	movg	%xcc,	%o7,	%l1
	array16	%g5,	%o3,	%i1
	sdivx	%o4,	0x0860,	%i2
	movle	%xcc,	%i7,	%i0
	lduw	[%l7 + 0x64],	%i4
	edge16n	%i5,	%o5,	%g6
	move	%xcc,	%o6,	%i3
	add	%o2,	%o0,	%l3
	fpack32	%f8,	%f30,	%f4
	xor	%l0,	0x152D,	%g2
	andn	%g4,	%l6,	%g3
	movrne	%g7,	0x043,	%g1
	sdiv	%l4,	0x0A58,	%l2
	movgu	%icc,	%o1,	%l5
	nop
	set	0x3C, %o5
	stw	%o7,	[%l7 + %o5]
	movl	%xcc,	%i6,	%g5
	xnor	%o3,	0x0F91,	%i1
	udivcc	%o4,	0x1E20,	%l1
	mulscc	%i7,	%i2,	%i4
	srlx	%i5,	0x08,	%i0
	movrlez	%g6,	0x032,	%o5
	edge16ln	%i3,	%o6,	%o0
	movrne	%o2,	0x17D,	%l3
	ldd	[%l7 + 0x10],	%f20
	fxnors	%f1,	%f5,	%f1
	fmovdcs	%xcc,	%f0,	%f23
	fmovdl	%icc,	%f19,	%f30
	movre	%l0,	0x346,	%g4
	alignaddrl	%l6,	%g2,	%g7
	fone	%f10
	fzeros	%f20
	movrlez	%g3,	%l4,	%l2
	orncc	%g1,	0x1973,	%l5
	movg	%xcc,	%o1,	%i6
	array16	%o7,	%g5,	%o3
	subc	%o4,	%i1,	%i7
	popc	0x0B32,	%i2
	move	%icc,	%l1,	%i5
	alignaddrl	%i0,	%i4,	%o5
	fmovsl	%icc,	%f22,	%f31
	fpack16	%f24,	%f21
	movrlz	%i3,	0x38C,	%g6
	array8	%o0,	%o6,	%o2
	fsrc2s	%f26,	%f1
	xnor	%l0,	0x13FD,	%l3
	srax	%l6,	%g4,	%g7
	movneg	%xcc,	%g3,	%g2
	xor	%l4,	%l2,	%l5
	edge32n	%g1,	%o1,	%o7
	sdiv	%i6,	0x165A,	%o3
	ldx	[%l7 + 0x48],	%o4
	edge8l	%g5,	%i1,	%i7
	movneg	%icc,	%i2,	%l1
	setx loop_94, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_94: 	udiv	%i4,	0x0C51,	%o5
	ldsh	[%l7 + 0x4A],	%g6
	fmul8sux16	%f30,	%f28,	%f12
	sub	%i3,	%o0,	%o6
	move	%xcc,	%o2,	%l3
	movcc	%icc,	%l6,	%g4
	movneg	%xcc,	%l0,	%g7
	stb	%g2,	[%l7 + 0x0C]
	std	%f22,	[%l7 + 0x68]
	movcs	%icc,	%l4,	%l2
	std	%f30,	[%l7 + 0x38]
	edge8	%g3,	%g1,	%o1
	movrlez	%l5,	%i6,	%o3
	fmovd	%f26,	%f28
	move	%icc,	%o7,	%o4
	sll	%g5,	0x1B,	%i1
	mulscc	%i7,	0x0CE2,	%l1
	mova	%icc,	%i2,	%i5
	movre	%i4,	%o5,	%i0
	fmovdleu	%xcc,	%f20,	%f29
	movne	%icc,	%g6,	%o0
	andcc	%o6,	0x0641,	%o2
	fpsub32	%f28,	%f14,	%f6
	add	%i3,	%l3,	%g4
	movcs	%xcc,	%l6,	%l0
	fsrc1s	%f24,	%f2
	fexpand	%f6,	%f30
	udivx	%g7,	0x1B58,	%g2
	fornot1s	%f27,	%f5,	%f31
	fxnors	%f17,	%f2,	%f5
	udivx	%l2,	0x1D10,	%g3
	fmul8x16	%f22,	%f22,	%f20
	nop
	set	0x08, %o1
	stx	%g1,	[%l7 + %o1]
	orn	%l4,	0x0FEA,	%l5
	fmovdgu	%xcc,	%f5,	%f31
	movge	%xcc,	%i6,	%o3
	addccc	%o1,	%o4,	%o7
	sth	%i1,	[%l7 + 0x4C]
	mova	%icc,	%g5,	%i7
	edge8l	%l1,	%i2,	%i5
	xor	%o5,	0x1285,	%i0
	sdivx	%g6,	0x158D,	%i4
	andcc	%o6,	%o0,	%i3
	fpsub32s	%f6,	%f15,	%f23
	ldsw	[%l7 + 0x50],	%o2
	subccc	%g4,	0x15B1,	%l6
	andn	%l0,	%g7,	%g2
	array16	%l2,	%l3,	%g1
	andn	%l4,	%g3,	%l5
	udivcc	%i6,	0x0576,	%o3
	smulcc	%o1,	0x0A60,	%o7
	alignaddrl	%o4,	%i1,	%g5
	sra	%i7,	0x07,	%i2
	umulcc	%i5,	0x1A32,	%l1
	movrlz	%i0,	0x300,	%g6
	or	%i4,	%o6,	%o0
	movrne	%o5,	%o2,	%g4
	save %i3, 0x0D3F, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f20,	%f2
	fmovsvs	%xcc,	%f22,	%f17
	array32	%g7,	%l0,	%l2
	sir	0x113C
	sub	%g2,	0x138F,	%l3
	subccc	%l4,	0x1CC8,	%g3
	alignaddr	%g1,	%i6,	%l5
	array8	%o1,	%o7,	%o3
	fmovsne	%xcc,	%f12,	%f19
	umulcc	%o4,	%i1,	%g5
	sdiv	%i2,	0x023F,	%i5
	udivcc	%l1,	0x1C4D,	%i7
	orn	%i0,	%g6,	%o6
	xorcc	%i4,	0x1832,	%o5
	sdivx	%o2,	0x1148,	%o0
	edge8ln	%g4,	%i3,	%l6
	edge16n	%g7,	%l0,	%g2
	smulcc	%l3,	%l2,	%l4
	addc	%g1,	0x0242,	%i6
	umul	%g3,	0x1CB0,	%o1
	smul	%o7,	0x067B,	%o3
	std	%f20,	[%l7 + 0x40]
	edge16l	%o4,	%l5,	%i1
	or	%i2,	0x0F2A,	%i5
	movne	%icc,	%l1,	%i7
	fmul8sux16	%f20,	%f28,	%f2
	ldx	[%l7 + 0x70],	%g5
	st	%f15,	[%l7 + 0x68]
	movgu	%icc,	%i0,	%g6
	alignaddrl	%i4,	%o6,	%o2
	siam	0x1
	movvs	%icc,	%o5,	%o0
	sir	0x00D1
	fnot1s	%f15,	%f7
	edge16n	%g4,	%i3,	%l6
	movrgz	%l0,	0x3F4,	%g2
	movrne	%l3,	%g7,	%l4
	udiv	%g1,	0x0F52,	%i6
	addccc	%l2,	%o1,	%g3
	movle	%xcc,	%o7,	%o4
	subccc	%l5,	0x1D7A,	%o3
	mova	%icc,	%i1,	%i2
	udivx	%l1,	0x1725,	%i5
	movl	%xcc,	%g5,	%i7
	movge	%icc,	%i0,	%i4
	udivx	%g6,	0x0465,	%o6
	sir	0x185D
	ldd	[%l7 + 0x28],	%o4
	smulcc	%o2,	%g4,	%o0
	movvs	%xcc,	%l6,	%i3
	addcc	%l0,	%l3,	%g2
	nop
	set	0x40, %g6
	std	%f24,	[%l7 + %g6]
	fmovdpos	%xcc,	%f11,	%f10
	fand	%f26,	%f28,	%f20
	restore %l4, %g7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l2, 0x1AE2, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g3,	%o7,	%o4
	sub	%o1,	0x1D2F,	%o3
	umulcc	%i1,	0x16E7,	%l5
	stx	%i2,	[%l7 + 0x40]
	array8	%i5,	%l1,	%i7
	andncc	%i0,	%g5,	%g6
	edge32ln	%o6,	%o5,	%i4
	movneg	%icc,	%o2,	%g4
	fandnot2	%f22,	%f30,	%f30
	ldd	[%l7 + 0x08],	%i6
	siam	0x6
	fmovrslz	%o0,	%f23,	%f23
	setx loop_95, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_95: 	orn	%l4,	%i3,	%g7
	movre	%i6,	%g1,	%g3
	fmovs	%f22,	%f3
	fzero	%f16
	orn	%o7,	%l2,	%o4
	fmovspos	%icc,	%f27,	%f27
	fmovdcs	%xcc,	%f7,	%f5
	edge16	%o3,	%i1,	%o1
	edge8l	%l5,	%i5,	%i2
	sdiv	%l1,	0x1069,	%i0
	movcc	%icc,	%i7,	%g6
	andcc	%o6,	0x037B,	%g5
	movl	%icc,	%o5,	%o2
	mova	%icc,	%i4,	%g4
	andn	%o0,	0x0E7B,	%l0
	and	%l3,	0x18B0,	%g2
	edge32	%l4,	%i3,	%g7
	fsrc1	%f10,	%f24
	edge16l	%i6,	%l6,	%g3
	ldsb	[%l7 + 0x61],	%g1
	movgu	%xcc,	%l2,	%o4
	pdist	%f8,	%f0,	%f6
	movvc	%icc,	%o7,	%o3
	movcs	%icc,	%i1,	%l5
	fmul8sux16	%f30,	%f2,	%f8
	movle	%icc,	%o1,	%i5
	subcc	%l1,	0x141C,	%i0
	orcc	%i7,	0x01F6,	%g6
	std	%f6,	[%l7 + 0x10]
	movrlez	%i2,	0x1A2,	%g5
	ld	[%l7 + 0x34],	%f8
	fpadd16s	%f18,	%f1,	%f16
	movvs	%xcc,	%o6,	%o5
	sth	%o2,	[%l7 + 0x2C]
	save %g4, 0x1AB8, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f0,	%f30
	mulx	%l0,	%l3,	%g2
	edge32l	%i4,	%l4,	%i3
	fcmpeq16	%f14,	%f0,	%g7
	edge32ln	%l6,	%i6,	%g1
	fnot1s	%f19,	%f6
	fmovscc	%icc,	%f21,	%f1
	ldx	[%l7 + 0x38],	%g3
	udiv	%l2,	0x0AD5,	%o7
	fmovrde	%o3,	%f18,	%f8
	fmovde	%icc,	%f23,	%f11
	smulcc	%i1,	%l5,	%o4
	fabsd	%f26,	%f12
	fpadd16	%f6,	%f20,	%f16
	movl	%icc,	%i5,	%l1
	addccc	%o1,	0x09DB,	%i7
	fone	%f20
	edge32n	%g6,	%i0,	%g5
	sll	%o6,	0x14,	%i2
	orncc	%o2,	%g4,	%o5
	ldd	[%l7 + 0x70],	%o0
	xnorcc	%l0,	0x0816,	%g2
	movgu	%icc,	%i4,	%l4
	movre	%l3,	%g7,	%i3
	fandnot1	%f28,	%f24,	%f4
	addc	%l6,	%g1,	%i6
	stb	%g3,	[%l7 + 0x25]
	fmuld8ulx16	%f6,	%f31,	%f6
	fnot2	%f10,	%f6
	xorcc	%o7,	%o3,	%i1
	ldd	[%l7 + 0x08],	%f30
	alignaddrl	%l2,	%o4,	%l5
	ldsw	[%l7 + 0x44],	%i5
	alignaddrl	%l1,	%o1,	%g6
	sth	%i0,	[%l7 + 0x46]
	alignaddr	%g5,	%i7,	%i2
	sdiv	%o2,	0x13C8,	%o6
	movvc	%xcc,	%g4,	%o0
	edge16l	%l0,	%o5,	%i4
	andn	%l4,	%g2,	%l3
	edge8	%g7,	%i3,	%g1
	restore %i6, 0x1E17, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1756
	fmovsa	%icc,	%f14,	%f6
	alignaddr	%l6,	%o3,	%i1
	fcmps	%fcc1,	%f5,	%f11
	srl	%l2,	%o7,	%l5
	edge16	%i5,	%o4,	%o1
	and	%l1,	0x0B60,	%i0
	movle	%icc,	%g5,	%g6
	movl	%icc,	%i2,	%i7
	subc	%o2,	%g4,	%o6
	smul	%l0,	0x0BD6,	%o0
	movn	%xcc,	%o5,	%i4
	movvc	%icc,	%g2,	%l4
	fmovsne	%icc,	%f7,	%f20
	sir	0x1CF9
	addc	%l3,	0x090F,	%g7
	edge8ln	%i3,	%g1,	%i6
	addccc	%g3,	%l6,	%o3
	sll	%i1,	%o7,	%l5
	ldsw	[%l7 + 0x6C],	%i5
	stb	%o4,	[%l7 + 0x5B]
	add	%l2,	0x07D1,	%l1
	xnorcc	%i0,	0x067B,	%g5
	movl	%icc,	%o1,	%i2
	udiv	%i7,	0x1DE2,	%g6
	smulcc	%o2,	%g4,	%o6
	fmovdge	%xcc,	%f28,	%f7
	array8	%l0,	%o5,	%o0
	addcc	%i4,	0x0350,	%g2
	save %l4, 0x0B51, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %i3, 0x0900, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l3,	%i6,	%l6
	alignaddrl	%g3,	%o3,	%i1
	array16	%o7,	%i5,	%l5
	movn	%icc,	%o4,	%l2
	array16	%l1,	%i0,	%o1
	nop
	set	0x6C, %l0
	lduw	[%l7 + %l0],	%i2
	mulx	%g5,	0x168B,	%g6
	stb	%i7,	[%l7 + 0x39]
	fpmerge	%f19,	%f24,	%f20
	orncc	%g4,	0x0BCD,	%o2
	mulx	%l0,	0x0512,	%o5
	fabss	%f28,	%f24
	popc	0x1C71,	%o0
	add	%o6,	0x0D03,	%i4
	st	%f24,	[%l7 + 0x2C]
	fmovsleu	%icc,	%f4,	%f0
	edge8	%g2,	%l4,	%i3
	edge16n	%g1,	%g7,	%i6
	fmovdpos	%xcc,	%f7,	%f20
	edge16n	%l3,	%g3,	%l6
	mulx	%i1,	0x139A,	%o3
	fmovrsne	%o7,	%f17,	%f24
	subc	%i5,	0x07EC,	%l5
	ldsh	[%l7 + 0x1C],	%l2
	lduh	[%l7 + 0x68],	%o4
	movne	%xcc,	%i0,	%l1
	ldx	[%l7 + 0x08],	%i2
	st	%f28,	[%l7 + 0x30]
	umulcc	%o1,	%g6,	%i7
	xorcc	%g5,	%o2,	%l0
	subccc	%o5,	0x02AE,	%o0
	movneg	%xcc,	%o6,	%i4
	fandnot2s	%f11,	%f27,	%f25
	xorcc	%g2,	0x18F4,	%l4
	udiv	%g4,	0x12B3,	%g1
	std	%f2,	[%l7 + 0x08]
	save %g7, %i6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l3,	0x0A8E,	%g3
	subc	%i1,	%o3,	%o7
	lduw	[%l7 + 0x70],	%l6
	orn	%i5,	%l2,	%l5
	fnot2s	%f15,	%f1
	alignaddrl	%i0,	%o4,	%l1
	movrlz	%i2,	0x0AD,	%g6
	fpadd32	%f16,	%f28,	%f20
	ldd	[%l7 + 0x20],	%f10
	udiv	%i7,	0x146F,	%g5
	movvs	%icc,	%o1,	%o2
	or	%o5,	0x12CA,	%o0
	movvc	%xcc,	%l0,	%i4
	movle	%xcc,	%g2,	%l4
	sub	%o6,	%g1,	%g4
	movrgz	%i6,	%i3,	%l3
	ldsw	[%l7 + 0x6C],	%g7
	fone	%f24
	srlx	%g3,	0x09,	%i1
	fmovdle	%xcc,	%f10,	%f26
	fmovrde	%o3,	%f24,	%f22
	fnot2	%f4,	%f4
	addcc	%l6,	%i5,	%l2
	mulscc	%o7,	%i0,	%l5
	popc	%l1,	%i2
	andcc	%g6,	0x050A,	%o4
	addcc	%i7,	%g5,	%o2
	edge8	%o5,	%o0,	%l0
	sdiv	%i4,	0x0448,	%o1
	array16	%l4,	%g2,	%o6
	movrgz	%g4,	%g1,	%i6
	fpack16	%f10,	%f16
	edge32l	%l3,	%g7,	%g3
	andcc	%i3,	0x10CE,	%i1
	xor	%l6,	0x1D89,	%o3
	edge8ln	%l2,	%o7,	%i5
	mova	%xcc,	%i0,	%l1
	setx loop_96, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_96: 	stb	%i7,	[%l7 + 0x63]
	movrlez	%l5,	%g5,	%o5
	movvs	%xcc,	%o0,	%o2
	array32	%i4,	%l0,	%l4
	movre	%g2,	0x29A,	%o6
	addc	%o1,	0x1B84,	%g1
	fmovrdlz	%i6,	%f22,	%f14
	fmovrdgez	%g4,	%f14,	%f14
	save %l3, 0x1C3A, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x3A],	%i3
	addcc	%i1,	0x0CDB,	%l6
	fmovscs	%xcc,	%f10,	%f0
	addcc	%o3,	0x16BB,	%g3
	movrgz	%l2,	%o7,	%i0
	movrne	%i5,	0x1F6,	%i2
	movrne	%g6,	%l1,	%o4
	edge8l	%l5,	%i7,	%g5
	fcmpd	%fcc1,	%f4,	%f26
	array32	%o5,	%o2,	%i4
	udiv	%l0,	0x05E3,	%o0
	fcmpgt16	%f0,	%f6,	%l4
	lduw	[%l7 + 0x54],	%o6
	array16	%g2,	%o1,	%g1
	movrne	%i6,	0x192,	%l3
	edge8	%g4,	%i3,	%g7
	subc	%i1,	%o3,	%l6
	stw	%l2,	[%l7 + 0x40]
	ldsb	[%l7 + 0x73],	%g3
	sth	%o7,	[%l7 + 0x24]
	fmovrdgez	%i0,	%f24,	%f18
	edge16l	%i5,	%g6,	%i2
	edge8n	%o4,	%l1,	%i7
	movneg	%xcc,	%l5,	%g5
	xnorcc	%o2,	%i4,	%l0
	sethi	0x065F,	%o5
	movneg	%icc,	%l4,	%o6
	sth	%g2,	[%l7 + 0x6E]
	movrlez	%o1,	0x13A,	%o0
	fandnot2s	%f27,	%f26,	%f11
	xnorcc	%g1,	%i6,	%g4
	edge8ln	%l3,	%g7,	%i3
	fone	%f6
	movvc	%xcc,	%o3,	%i1
	nop
	set	0x50, %i7
	lduw	[%l7 + %i7],	%l2
	fand	%f4,	%f20,	%f6
	udivcc	%g3,	0x132A,	%l6
	and	%i0,	0x11B0,	%o7
	sll	%i5,	0x1A,	%i2
	alignaddr	%g6,	%o4,	%i7
	addc	%l1,	%l5,	%o2
	edge16ln	%i4,	%l0,	%o5
	movrgz	%g5,	0x127,	%l4
	pdist	%f6,	%f12,	%f20
	move	%icc,	%g2,	%o1
	movrlez	%o0,	0x2DD,	%o6
	movl	%xcc,	%g1,	%i6
	array8	%g4,	%l3,	%i3
	array16	%g7,	%i1,	%o3
	udivx	%l2,	0x1FB2,	%g3
	array32	%l6,	%o7,	%i0
	andcc	%i5,	%i2,	%g6
	and	%i7,	%l1,	%o4
	fors	%f5,	%f14,	%f25
	edge32	%o2,	%l5,	%l0
	andncc	%i4,	%g5,	%l4
	sllx	%g2,	%o5,	%o1
	subc	%o0,	0x0680,	%o6
	pdist	%f28,	%f4,	%f4
	lduh	[%l7 + 0x6A],	%g1
	ldub	[%l7 + 0x29],	%g4
	edge32ln	%l3,	%i6,	%i3
	fpadd32	%f28,	%f18,	%f10
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%g6
	popc	0x1FE7,	%o3
	sdivx	%l2,	0x0B24,	%g3
	fandnot2s	%f8,	%f12,	%f30
	edge8	%i1,	%l6,	%i0
	smulcc	%o7,	%i2,	%g6
	fpsub16	%f14,	%f6,	%f30
	fmovdleu	%icc,	%f1,	%f27
	restore %i7, 0x0DB6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i5,	%o4,	%l5
	fmul8sux16	%f26,	%f22,	%f26
	movcc	%xcc,	%l0,	%o2
	edge16ln	%i4,	%g5,	%l4
	andncc	%g2,	%o1,	%o0
	movre	%o5,	0x203,	%o6
	add	%g1,	%l3,	%g4
	lduw	[%l7 + 0x34],	%i3
	movvs	%icc,	%g7,	%o3
	ldsb	[%l7 + 0x58],	%i6
	orcc	%g3,	0x0B78,	%i1
	movrlez	%l2,	0x38F,	%l6
	sdiv	%i0,	0x1810,	%i2
	movcs	%icc,	%o7,	%i7
	alignaddrl	%g6,	%l1,	%o4
	srax	%i5,	%l5,	%l0
	movrlez	%i4,	%o2,	%g5
	fpack16	%f2,	%f14
	array32	%g2,	%l4,	%o1
	addc	%o0,	0x16C0,	%o5
	ldd	[%l7 + 0x60],	%f28
	fand	%f16,	%f2,	%f22
	edge32	%o6,	%l3,	%g4
	ldsw	[%l7 + 0x28],	%i3
	movrlez	%g7,	0x177,	%o3
	fmovsvs	%xcc,	%f2,	%f24
	edge16ln	%i6,	%g1,	%i1
	addc	%l2,	0x1045,	%g3
	sra	%i0,	%l6,	%o7
	add	%i2,	0x1861,	%g6
	ldx	[%l7 + 0x30],	%l1
	alignaddr	%o4,	%i7,	%i5
	edge32	%l0,	%i4,	%l5
	sethi	0x1A17,	%g5
	stb	%o2,	[%l7 + 0x3A]
	sll	%l4,	%o1,	%g2
	movge	%xcc,	%o0,	%o5
	andcc	%o6,	0x1FC0,	%l3
	mulx	%g4,	0x071E,	%g7
	movrgz	%o3,	%i3,	%g1
	ldsb	[%l7 + 0x14],	%i1
	movcs	%xcc,	%i6,	%g3
	fsrc1	%f14,	%f0
	ldub	[%l7 + 0x76],	%i0
	ldub	[%l7 + 0x2A],	%l6
	ldsh	[%l7 + 0x44],	%o7
	edge8	%l2,	%g6,	%i2
	sllx	%o4,	%l1,	%i7
	sethi	0x1C1C,	%l0
	sub	%i5,	%i4,	%g5
	edge32n	%o2,	%l4,	%l5
	subc	%g2,	%o1,	%o5
	fmovdge	%xcc,	%f3,	%f31
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%o6
	movpos	%icc,	%l3,	%o0
	edge8l	%g4,	%g7,	%i3
	edge16ln	%o3,	%i1,	%g1
	srax	%i6,	0x1B,	%g3
	edge16	%l6,	%o7,	%l2
	movrgz	%g6,	0x222,	%i0
	fcmple16	%f12,	%f12,	%o4
	fmovsge	%xcc,	%f9,	%f29
	srlx	%i2,	0x15,	%l1
	fmovscs	%xcc,	%f12,	%f22
	edge16ln	%l0,	%i7,	%i4
	edge16n	%i5,	%o2,	%g5
	subccc	%l5,	0x110F,	%g2
	fmovrdlz	%l4,	%f6,	%f28
	sll	%o5,	0x10,	%o1
	ldd	[%l7 + 0x48],	%f4
	movcs	%xcc,	%l3,	%o6
	andcc	%o0,	%g7,	%i3
	andn	%g4,	0x0C1F,	%o3
	bshuffle	%f16,	%f30,	%f0
	add	%i1,	0x0E37,	%i6
	movrgez	%g1,	0x12F,	%g3
	movrlz	%o7,	%l2,	%l6
	fcmpne16	%f16,	%f14,	%g6
	addccc	%i0,	0x18C5,	%o4
	movneg	%xcc,	%i2,	%l0
	sethi	0x0B71,	%i7
	movneg	%icc,	%l1,	%i5
	fmovrsgez	%o2,	%f13,	%f15
	edge16n	%g5,	%i4,	%g2
	sll	%l4,	%l5,	%o5
	fmovde	%icc,	%f1,	%f29
	movrlez	%o1,	%o6,	%o0
	siam	0x0
	edge32ln	%g7,	%l3,	%g4
	movneg	%xcc,	%i3,	%i1
	subccc	%o3,	%g1,	%g3
	movneg	%icc,	%o7,	%l2
	ldsb	[%l7 + 0x22],	%i6
	addccc	%g6,	0x0AE1,	%i0
	setx loop_97, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_97: 	movn	%xcc,	%i7,	%l0
	movrlez	%l1,	%i5,	%g5
	fmovdcs	%icc,	%f5,	%f3
	sdivcc	%o2,	0x1EB1,	%i4
	ldsh	[%l7 + 0x3E],	%l4
	st	%f8,	[%l7 + 0x08]
	fmovsleu	%icc,	%f23,	%f17
	fcmple16	%f4,	%f4,	%l5
	st	%f1,	[%l7 + 0x60]
	srax	%o5,	0x19,	%g2
	xor	%o6,	0x084E,	%o1
	fand	%f4,	%f14,	%f10
	ldsh	[%l7 + 0x68],	%g7
	movpos	%xcc,	%l3,	%o0
	movvs	%icc,	%i3,	%g4
	pdist	%f18,	%f28,	%f8
	stx	%o3,	[%l7 + 0x30]
	subcc	%g1,	%i1,	%o7
	ldd	[%l7 + 0x50],	%g2
	ldub	[%l7 + 0x5D],	%i6
	ld	[%l7 + 0x74],	%f20
	movcs	%icc,	%g6,	%i0
	or	%l2,	0x0442,	%o4
	movrne	%l6,	0x049,	%i2
	lduw	[%l7 + 0x10],	%i7
	fmovdvc	%icc,	%f9,	%f27
	movcs	%icc,	%l0,	%i5
	ldd	[%l7 + 0x48],	%g4
	mulscc	%l1,	%o2,	%l4
	movn	%xcc,	%i4,	%l5
	sth	%g2,	[%l7 + 0x3C]
	ldsw	[%l7 + 0x30],	%o6
	mulscc	%o5,	0x1001,	%g7
	movpos	%xcc,	%l3,	%o1
	ldsw	[%l7 + 0x64],	%o0
	fmovsne	%icc,	%f24,	%f20
	subcc	%i3,	%o3,	%g4
	stx	%g1,	[%l7 + 0x28]
	ldsb	[%l7 + 0x15],	%i1
	movleu	%icc,	%o7,	%g3
	subcc	%g6,	0x122B,	%i0
	ldd	[%l7 + 0x28],	%l2
	fones	%f9
	fmovd	%f28,	%f18
	fmovrdgz	%o4,	%f20,	%f26
	movg	%icc,	%i6,	%l6
	stb	%i7,	[%l7 + 0x18]
	xorcc	%l0,	0x0C0E,	%i2
	edge32n	%i5,	%g5,	%o2
	andcc	%l4,	%i4,	%l5
	mova	%xcc,	%l1,	%g2
	move	%xcc,	%o6,	%g7
	andcc	%o5,	%l3,	%o0
	fmul8x16au	%f21,	%f2,	%f26
	edge16n	%o1,	%i3,	%o3
	fones	%f27
	fmovdcc	%xcc,	%f5,	%f27
	edge8	%g1,	%g4,	%i1
	srax	%o7,	%g3,	%i0
	umulcc	%g6,	%l2,	%o4
	subcc	%i6,	0x1322,	%l6
	lduw	[%l7 + 0x1C],	%l0
	movrgz	%i7,	0x1CF,	%i5
	fmovdvc	%icc,	%f30,	%f14
	edge32l	%i2,	%o2,	%g5
	save %i4, 0x1B81, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x48],	%f10
	fmovdleu	%icc,	%f27,	%f19
	movvc	%icc,	%l4,	%l1
	edge8l	%o6,	%g2,	%o5
	movgu	%xcc,	%g7,	%o0
	fmovda	%icc,	%f24,	%f8
	stx	%l3,	[%l7 + 0x28]
	fmovdleu	%xcc,	%f29,	%f23
	popc	0x0AA5,	%o1
	sll	%i3,	0x1C,	%o3
	movrgz	%g4,	0x29A,	%i1
	movcc	%xcc,	%g1,	%o7
	edge8n	%i0,	%g6,	%l2
	stb	%o4,	[%l7 + 0x77]
	mulscc	%i6,	%g3,	%l0
	sra	%l6,	%i5,	%i7
	fnegs	%f9,	%f15
	srlx	%o2,	0x18,	%g5
	fmovdvc	%icc,	%f21,	%f5
	bshuffle	%f8,	%f18,	%f22
	subc	%i4,	%l5,	%i2
	ldx	[%l7 + 0x40],	%l1
	movvs	%xcc,	%l4,	%g2
	movrgz	%o6,	%o5,	%g7
	edge32n	%o0,	%l3,	%i3
	mulx	%o3,	%g4,	%i1
	edge8	%g1,	%o7,	%i0
	movne	%xcc,	%g6,	%o1
	fand	%f22,	%f28,	%f12
	fmovda	%icc,	%f21,	%f28
	lduh	[%l7 + 0x40],	%o4
	movge	%xcc,	%i6,	%l2
	fpsub32	%f6,	%f22,	%f14
	move	%icc,	%g3,	%l6
	sdivcc	%l0,	0x1AB3,	%i5
	edge8	%o2,	%i7,	%i4
	fcmple32	%f30,	%f10,	%l5
	fmovdcs	%xcc,	%f6,	%f27
	sdivcc	%i2,	0x0FFA,	%g5
	fandnot2s	%f22,	%f10,	%f20
	sra	%l4,	%g2,	%l1
	addc	%o5,	0x041E,	%g7
	edge32ln	%o0,	%l3,	%i3
	save %o3, 0x18DF, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f18,	%f18,	%f24
	array32	%g4,	%g1,	%i1
	ldd	[%l7 + 0x18],	%f12
	subccc	%i0,	%o7,	%g6
	srlx	%o4,	%i6,	%o1
	fcmpeq16	%f28,	%f16,	%g3
	move	%xcc,	%l6,	%l0
	umulcc	%l2,	0x1AD4,	%i5
	ldsb	[%l7 + 0x0A],	%i7
	popc	%i4,	%l5
	array8	%o2,	%g5,	%l4
	udivx	%g2,	0x1B92,	%l1
	sdivx	%i2,	0x1921,	%o5
	fmovsgu	%xcc,	%f1,	%f31
	ld	[%l7 + 0x30],	%f9
	fcmpgt32	%f4,	%f20,	%o0
	stb	%g7,	[%l7 + 0x5E]
	fmovsne	%xcc,	%f13,	%f22
	fmovsgu	%icc,	%f1,	%f8
	alignaddr	%l3,	%o3,	%i3
	movrlz	%g4,	%o6,	%i1
	fsrc1	%f16,	%f8
	stw	%g1,	[%l7 + 0x54]
	fpadd16	%f20,	%f18,	%f0
	ldub	[%l7 + 0x5C],	%i0
	ldsb	[%l7 + 0x14],	%g6
	movgu	%icc,	%o4,	%o7
	fmuld8ulx16	%f12,	%f29,	%f2
	fmovsle	%xcc,	%f13,	%f4
	ldub	[%l7 + 0x24],	%o1
	subcc	%i6,	0x17DA,	%l6
	restore %l0, %l2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i7,	0x18B5,	%g3
	ldx	[%l7 + 0x70],	%i4
	fmovrsgez	%o2,	%f9,	%f1
	xorcc	%l5,	0x0B5C,	%l4
	fmovsn	%icc,	%f26,	%f5
	alignaddrl	%g5,	%g2,	%l1
	smulcc	%i2,	%o0,	%o5
	andcc	%l3,	%o3,	%i3
	edge16	%g7,	%o6,	%g4
	edge16n	%g1,	%i0,	%g6
	or	%o4,	%o7,	%o1
	movge	%icc,	%i6,	%i1
	nop
	set	0x42, %i2
	ldsh	[%l7 + %i2],	%l6
	std	%f28,	[%l7 + 0x48]
	sdiv	%l0,	0x06A6,	%l2
	setx loop_98, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_98: 	fpackfix	%f24,	%f4
	edge32ln	%o2,	%i4,	%l5
	alignaddrl	%g5,	%g2,	%l4
	fnegs	%f8,	%f25
	array32	%l1,	%i2,	%o5
	udivx	%o0,	0x00AE,	%o3
	fpadd32s	%f28,	%f24,	%f4
	ldsw	[%l7 + 0x60],	%i3
	subcc	%g7,	0x1B8A,	%o6
	ldub	[%l7 + 0x34],	%g4
	fsrc2	%f16,	%f20
	andcc	%l3,	%g1,	%i0
	ldsb	[%l7 + 0x22],	%g6
	udivcc	%o4,	0x1F1A,	%o7
	fmovrdlz	%o1,	%f26,	%f26
	srlx	%i6,	%l6,	%l0
	stx	%i1,	[%l7 + 0x38]
	sdiv	%i5,	0x0E40,	%i7
	fmovdg	%icc,	%f21,	%f20
	fmovdvc	%xcc,	%f31,	%f8
	edge32n	%g3,	%o2,	%l2
	movvc	%xcc,	%i4,	%g5
	movcc	%xcc,	%l5,	%g2
	fmovsle	%icc,	%f15,	%f30
	array8	%l4,	%i2,	%l1
	umulcc	%o5,	%o0,	%o3
	sir	0x131E
	udivx	%i3,	0x1B25,	%o6
	fpack32	%f4,	%f30,	%f16
	umul	%g4,	0x1541,	%l3
	edge16ln	%g1,	%i0,	%g6
	andn	%g7,	%o7,	%o1
	movrgez	%i6,	0x370,	%o4
	xorcc	%l6,	%l0,	%i1
	subcc	%i7,	0x0C6D,	%i5
	smulcc	%g3,	%l2,	%i4
	movn	%xcc,	%g5,	%o2
	movge	%xcc,	%l5,	%g2
	xnorcc	%i2,	%l4,	%l1
	andn	%o0,	%o3,	%i3
	sll	%o5,	%g4,	%o6
	nop
	set	0x60, %o6
	stx	%l3,	[%l7 + %o6]
	movne	%xcc,	%i0,	%g6
	udivx	%g1,	0x1E38,	%o7
	andcc	%g7,	%i6,	%o1
	and	%o4,	0x1A07,	%l6
	std	%f6,	[%l7 + 0x68]
	movrgez	%i1,	%l0,	%i7
	movrlez	%g3,	0x385,	%i5
	movg	%icc,	%i4,	%g5
	std	%f12,	[%l7 + 0x38]
	fmovsg	%xcc,	%f15,	%f29
	edge16	%l2,	%l5,	%o2
	edge8ln	%g2,	%i2,	%l1
	fxnor	%f0,	%f2,	%f4
	fmovdcc	%xcc,	%f21,	%f31
	fmovdleu	%icc,	%f6,	%f2
	lduw	[%l7 + 0x68],	%o0
	restore %o3, 0x0918, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%o5,	%l4
	movne	%xcc,	%g4,	%o6
	edge32l	%i0,	%g6,	%g1
	subc	%o7,	%g7,	%l3
	add	%o1,	%o4,	%l6
	mulscc	%i6,	%l0,	%i1
	fmovrslz	%i7,	%f14,	%f29
	move	%xcc,	%i5,	%g3
	fcmpgt32	%f16,	%f10,	%g5
	fpack16	%f20,	%f27
	edge8ln	%l2,	%i4,	%l5
	fmovsge	%icc,	%f3,	%f13
	orcc	%o2,	%g2,	%i2
	movrne	%l1,	0x09B,	%o3
	alignaddrl	%i3,	%o5,	%o0
	fmovdcs	%icc,	%f14,	%f0
	edge16	%g4,	%l4,	%i0
	udivcc	%o6,	0x183B,	%g1
	movgu	%xcc,	%g6,	%o7
	xorcc	%l3,	0x134E,	%g7
	andncc	%o1,	%o4,	%i6
	edge8l	%l6,	%l0,	%i1
	edge16ln	%i7,	%g3,	%g5
	fpsub32s	%f28,	%f26,	%f9
	ldsw	[%l7 + 0x24],	%l2
	sth	%i5,	[%l7 + 0x5A]
	movvs	%xcc,	%i4,	%l5
	movn	%xcc,	%g2,	%o2
	andncc	%i2,	%o3,	%i3
	orn	%o5,	0x1C1F,	%o0
	fcmpes	%fcc3,	%f0,	%f15
	movcc	%xcc,	%l1,	%l4
	or	%g4,	%i0,	%g1
	ldx	[%l7 + 0x40],	%g6
	movrlz	%o6,	%l3,	%g7
	edge32l	%o1,	%o7,	%o4
	movle	%icc,	%l6,	%l0
	movne	%xcc,	%i1,	%i7
	movge	%xcc,	%i6,	%g5
	fmuld8ulx16	%f26,	%f20,	%f10
	edge16n	%l2,	%g3,	%i5
	movrgez	%i4,	%l5,	%o2
	fmovrdlez	%g2,	%f16,	%f8
	subc	%i2,	0x1BCD,	%o3
	edge8	%i3,	%o0,	%l1
	fpadd16s	%f31,	%f0,	%f4
	edge32n	%o5,	%l4,	%g4
	fand	%f28,	%f30,	%f26
	fmul8sux16	%f2,	%f0,	%f16
	mulx	%i0,	0x0A56,	%g1
	subcc	%g6,	0x1EDB,	%l3
	addc	%o6,	%o1,	%g7
	sdivcc	%o7,	0x0513,	%l6
	fpmerge	%f5,	%f27,	%f30
	ld	[%l7 + 0x30],	%f2
	siam	0x2
	fmovsvc	%icc,	%f18,	%f22
	srlx	%l0,	%i1,	%o4
	array16	%i6,	%i7,	%g5
	array32	%l2,	%i5,	%g3
	edge32	%l5,	%o2,	%i4
	fnegs	%f26,	%f20
	move	%xcc,	%g2,	%i2
	movgu	%icc,	%i3,	%o3
	addc	%l1,	0x0A75,	%o0
	movl	%xcc,	%o5,	%l4
	fnot2s	%f16,	%f14
	movneg	%icc,	%g4,	%i0
	or	%g6,	%l3,	%g1
	fmovdvs	%xcc,	%f26,	%f5
	fornot1s	%f5,	%f16,	%f11
	movcs	%icc,	%o6,	%g7
	ldd	[%l7 + 0x30],	%f16
	nop
	set	0x79, %o7
	ldub	[%l7 + %o7],	%o1
	ldsw	[%l7 + 0x78],	%l6
	udivcc	%l0,	0x02B0,	%o7
	udiv	%o4,	0x05EE,	%i6
	orcc	%i7,	0x00A5,	%i1
	edge16l	%g5,	%l2,	%i5
	srax	%g3,	%o2,	%i4
	mova	%xcc,	%l5,	%g2
	xorcc	%i2,	%i3,	%o3
	movrgz	%o0,	0x319,	%l1
	add	%l4,	0x0CD4,	%o5
	subcc	%g4,	%i0,	%l3
	movcc	%xcc,	%g6,	%g1
	ldub	[%l7 + 0x65],	%o6
	edge16l	%g7,	%l6,	%l0
	sth	%o1,	[%l7 + 0x22]
	std	%f24,	[%l7 + 0x70]
	edge32l	%o7,	%i6,	%i7
	sll	%i1,	0x09,	%g5
	fpmerge	%f27,	%f13,	%f12
	save %l2, %i5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%o4
	sir	0x04F0
	ldx	[%l7 + 0x78],	%i4
	subc	%l5,	%g2,	%o2
	or	%i3,	0x05DF,	%i2
	ldsb	[%l7 + 0x32],	%o3
	xnorcc	%l1,	%o0,	%o5
	st	%f23,	[%l7 + 0x28]
	alignaddr	%l4,	%g4,	%i0
	st	%f30,	[%l7 + 0x5C]
	movvs	%xcc,	%l3,	%g6
	ldsh	[%l7 + 0x14],	%g1
	and	%o6,	0x1669,	%l6
	edge16n	%l0,	%g7,	%o1
	fornot1	%f22,	%f24,	%f28
	fcmps	%fcc2,	%f2,	%f22
	udivcc	%i6,	0x17E1,	%i7
	umul	%o7,	%i1,	%g5
	fornot2s	%f19,	%f14,	%f24
	sdiv	%l2,	0x1982,	%g3
	or	%i5,	0x16D8,	%i4
	edge16ln	%o4,	%l5,	%g2
	alignaddrl	%i3,	%i2,	%o3
	umul	%o2,	0x17B0,	%l1
	movvc	%icc,	%o5,	%o0
	movne	%icc,	%g4,	%l4
	andn	%l3,	%g6,	%i0
	orn	%o6,	%g1,	%l0
	fandnot2	%f26,	%f20,	%f16
	udivx	%g7,	0x05E3,	%o1
	array8	%i6,	%l6,	%o7
	fpsub16	%f22,	%f18,	%f14
	fmovdgu	%xcc,	%f24,	%f5
	fmovrsne	%i1,	%f28,	%f31
	andn	%i7,	%l2,	%g3
	movrgz	%i5,	0x0CF,	%g5
	fornot1	%f18,	%f30,	%f30
	and	%o4,	%i4,	%l5
	save %i3, %i2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o2,	[%l7 + 0x44]
	fmovdl	%icc,	%f20,	%f3
	udivx	%g2,	0x1D00,	%l1
	fmovdge	%xcc,	%f11,	%f17
	stb	%o0,	[%l7 + 0x63]
	mova	%xcc,	%g4,	%l4
	and	%l3,	%o5,	%g6
	fabsd	%f30,	%f6
	fmovsvs	%icc,	%f26,	%f17
	fsrc1s	%f20,	%f4
	movl	%xcc,	%i0,	%g1
	subccc	%l0,	0x1D66,	%g7
	orncc	%o1,	%o6,	%l6
	fmovrsgz	%o7,	%f2,	%f14
	fmovrdlz	%i6,	%f0,	%f18
	edge16l	%i1,	%l2,	%i7
	movne	%xcc,	%i5,	%g5
	umulcc	%o4,	0x1354,	%i4
	movrlez	%g3,	0x170,	%i3
	fones	%f21
	movrne	%i2,	%l5,	%o2
	subccc	%o3,	0x0398,	%l1
	movre	%o0,	0x0AC,	%g2
	edge16ln	%g4,	%l3,	%o5
	movne	%icc,	%l4,	%i0
	movrlz	%g1,	0x10B,	%l0
	orcc	%g6,	%g7,	%o6
	save %l6, %o1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o7,	[%l7 + 0x18]
	sdiv	%i1,	0x00A2,	%l2
	fmul8x16al	%f2,	%f12,	%f16
	movle	%icc,	%i7,	%g5
	fpsub16s	%f5,	%f25,	%f5
	array32	%i5,	%o4,	%i4
	edge8ln	%g3,	%i2,	%i3
	movcc	%icc,	%l5,	%o3
	edge16l	%o2,	%l1,	%g2
	sra	%o0,	0x06,	%l3
	lduw	[%l7 + 0x54],	%g4
	andcc	%l4,	0x16D3,	%o5
	fone	%f22
	fmovdg	%xcc,	%f10,	%f24
	fcmpgt16	%f18,	%f30,	%g1
	sth	%l0,	[%l7 + 0x3C]
	fmul8sux16	%f28,	%f16,	%f12
	mova	%icc,	%g6,	%i0
	movl	%icc,	%o6,	%l6
	lduh	[%l7 + 0x7A],	%o1
	fnegd	%f28,	%f18
	edge32n	%i6,	%g7,	%i1
	srax	%o7,	0x04,	%i7
	movgu	%icc,	%g5,	%i5
	addc	%o4,	%l2,	%g3
	smul	%i4,	0x093F,	%i2
	or	%l5,	0x0F9D,	%i3
	umulcc	%o3,	%o2,	%g2
	edge32	%l1,	%o0,	%l3
	fpadd16s	%f13,	%f19,	%f5
	fmovrdgez	%l4,	%f8,	%f6
	addccc	%g4,	%o5,	%l0
	movrlz	%g1,	%i0,	%g6
	movgu	%icc,	%l6,	%o1
	fnor	%f22,	%f28,	%f22
	movvs	%xcc,	%o6,	%i6
	sethi	0x1DD7,	%g7
	fsrc2	%f24,	%f6
	edge32l	%i1,	%o7,	%i7
	movleu	%xcc,	%g5,	%i5
	edge32n	%l2,	%o4,	%g3
	fcmpes	%fcc3,	%f29,	%f5
	fpsub16s	%f31,	%f26,	%f3
	fmul8x16al	%f7,	%f25,	%f0
	udiv	%i4,	0x08F1,	%l5
	fmovsneg	%icc,	%f16,	%f22
	sir	0x1D9B
	fmul8x16al	%f14,	%f26,	%f26
	udivcc	%i3,	0x1435,	%o3
	fmul8x16	%f20,	%f18,	%f8
	lduw	[%l7 + 0x74],	%i2
	mulscc	%o2,	0x09DC,	%g2
	setx loop_99, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_99: 	edge32n	%g4,	%l4,	%o5
	subcc	%g1,	%l0,	%i0
	mulx	%g6,	0x0C0F,	%o1
	sll	%o6,	%i6,	%l6
	fcmpd	%fcc3,	%f28,	%f6
	movn	%xcc,	%g7,	%i1
	xnor	%i7,	0x02E6,	%g5
	mulscc	%i5,	0x06C3,	%o7
	udiv	%o4,	0x1EFA,	%l2
	fornot1	%f2,	%f24,	%f6
	array8	%g3,	%i4,	%i3
	sth	%l5,	[%l7 + 0x66]
	fcmpgt16	%f4,	%f12,	%i2
	fmul8sux16	%f30,	%f4,	%f12
	sth	%o2,	[%l7 + 0x58]
	movne	%icc,	%o3,	%g2
	sll	%l1,	%l3,	%o0
	fxnor	%f4,	%f16,	%f0
	umulcc	%l4,	%o5,	%g4
	fnegs	%f8,	%f24
	umul	%g1,	0x1162,	%l0
	subc	%g6,	0x009C,	%i0
	addc	%o1,	0x05A4,	%o6
	array8	%i6,	%g7,	%i1
	fnands	%f18,	%f20,	%f0
	fmovdpos	%xcc,	%f1,	%f23
	fmovrde	%l6,	%f20,	%f4
	andcc	%i7,	%g5,	%i5
	movl	%icc,	%o4,	%l2
	ldd	[%l7 + 0x78],	%o6
	movgu	%icc,	%i4,	%i3
	stx	%g3,	[%l7 + 0x28]
	fmovdpos	%icc,	%f14,	%f31
	stb	%i2,	[%l7 + 0x57]
	fmovdleu	%icc,	%f28,	%f19
	movcs	%icc,	%l5,	%o3
	edge8ln	%o2,	%g2,	%l1
	std	%f30,	[%l7 + 0x40]
	st	%f1,	[%l7 + 0x5C]
	addcc	%l3,	0x1505,	%o0
	movpos	%xcc,	%l4,	%g4
	umulcc	%g1,	0x170D,	%o5
	addc	%l0,	%g6,	%o1
	ldub	[%l7 + 0x1A],	%i0
	edge32l	%o6,	%i6,	%i1
	fpadd16	%f30,	%f20,	%f0
	subccc	%l6,	0x1E53,	%i7
	fnot2s	%f20,	%f29
	mulx	%g7,	%g5,	%i5
	fands	%f28,	%f28,	%f26
	orncc	%o4,	0x194D,	%o7
	mulscc	%i4,	0x02AB,	%i3
	fornot1s	%f25,	%f21,	%f8
	edge32l	%g3,	%i2,	%l2
	fcmpgt16	%f12,	%f24,	%l5
	addcc	%o3,	0x0517,	%o2
	orn	%g2,	%l3,	%o0
	srlx	%l4,	0x17,	%g4
	sdiv	%l1,	0x00C4,	%g1
	save %l0, 0x0A5F, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g6,	%i0,	%o6
	array16	%i6,	%i1,	%o1
	ldsb	[%l7 + 0x3E],	%i7
	fand	%f20,	%f8,	%f24
	orn	%g7,	%g5,	%l6
	edge8n	%o4,	%o7,	%i4
	mulx	%i5,	0x1576,	%g3
	fnor	%f26,	%f20,	%f24
	movgu	%xcc,	%i2,	%i3
	lduh	[%l7 + 0x4C],	%l5
	sra	%o3,	0x05,	%l2
	fmovsg	%xcc,	%f21,	%f17
	alignaddr	%g2,	%o2,	%o0
	move	%xcc,	%l3,	%g4
	move	%icc,	%l4,	%l1
	sllx	%g1,	0x17,	%l0
	lduw	[%l7 + 0x18],	%o5
	edge16l	%g6,	%i0,	%o6
	subcc	%i1,	0x1D4E,	%i6
	movvc	%xcc,	%o1,	%g7
	popc	0x0D03,	%g5
	udiv	%i7,	0x19DD,	%o4
	movpos	%icc,	%l6,	%o7
	sll	%i5,	%i4,	%i2
	sra	%g3,	%l5,	%i3
	alignaddrl	%o3,	%g2,	%o2
	edge8ln	%l2,	%l3,	%o0
	fcmpne32	%f2,	%f24,	%g4
	sllx	%l4,	0x13,	%l1
	srax	%g1,	0x11,	%o5
	movle	%icc,	%g6,	%i0
	fmovrsgz	%o6,	%f20,	%f15
	fnot2s	%f30,	%f12
	fmovda	%icc,	%f26,	%f1
	ldsh	[%l7 + 0x70],	%i1
	fnegs	%f0,	%f9
	sdivx	%l0,	0x0F89,	%i6
	andcc	%g7,	%g5,	%i7
	fnot1s	%f2,	%f15
	stx	%o4,	[%l7 + 0x18]
	movgu	%icc,	%o1,	%o7
	array8	%i5,	%i4,	%l6
	st	%f26,	[%l7 + 0x40]
	movrlz	%i2,	%g3,	%l5
	srl	%o3,	%g2,	%i3
	ldx	[%l7 + 0x30],	%l2
	edge32n	%o2,	%l3,	%g4
	fandnot2s	%f24,	%f29,	%f7
	fmul8ulx16	%f16,	%f0,	%f6
	fmovspos	%xcc,	%f30,	%f17
	fandnot2s	%f16,	%f16,	%f18
	fmovsneg	%icc,	%f9,	%f7
	movrne	%o0,	0x2FD,	%l4
	edge32n	%g1,	%o5,	%l1
	ldd	[%l7 + 0x60],	%f26
	fnot1	%f24,	%f18
	xor	%g6,	0x1A56,	%o6
	popc	%i1,	%i0
	fmovs	%f23,	%f17
	andn	%l0,	%i6,	%g7
	fpsub32	%f24,	%f30,	%f16
	movle	%xcc,	%i7,	%o4
	fmovse	%xcc,	%f9,	%f7
	sub	%o1,	0x017A,	%o7
	movne	%xcc,	%i5,	%g5
	stx	%i4,	[%l7 + 0x10]
	orcc	%i2,	0x1D06,	%l6
	restore %l5, %o3, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i3,	0x1E0B,	%l2
	move	%icc,	%o2,	%l3
	movcs	%xcc,	%g4,	%g2
	stb	%l4,	[%l7 + 0x21]
	fone	%f28
	sth	%g1,	[%l7 + 0x68]
	movle	%icc,	%o5,	%o0
	movre	%l1,	%g6,	%i1
	fmuld8sux16	%f18,	%f28,	%f30
	xor	%o6,	0x0BCB,	%i0
	xor	%l0,	%g7,	%i6
	movge	%icc,	%i7,	%o4
	popc	%o7,	%o1
	lduh	[%l7 + 0x2C],	%i5
	subc	%i4,	0x1BA3,	%g5
	lduw	[%l7 + 0x44],	%i2
	andn	%l6,	0x097B,	%l5
	movcs	%icc,	%g3,	%i3
	fmovdcs	%xcc,	%f16,	%f0
	andncc	%l2,	%o3,	%l3
	fsrc2s	%f23,	%f14
	setx loop_100, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_100: 	movl	%icc,	%g1,	%o5
	fmovse	%xcc,	%f6,	%f26
	movrgz	%g2,	%l1,	%g6
	pdist	%f2,	%f22,	%f22
	fxnors	%f28,	%f28,	%f27
	movn	%xcc,	%i1,	%o6
	movleu	%xcc,	%i0,	%l0
	sdivx	%g7,	0x0551,	%i6
	umul	%i7,	%o4,	%o0
	movn	%xcc,	%o1,	%o7
	sdivcc	%i5,	0x18A4,	%g5
	stw	%i2,	[%l7 + 0x1C]
	sdiv	%l6,	0x16C5,	%l5
	movrlz	%g3,	%i4,	%l2
	ldsw	[%l7 + 0x5C],	%o3
	mulscc	%i3,	%g4,	%o2
	fpadd32s	%f17,	%f0,	%f6
	fpsub16s	%f17,	%f18,	%f23
	ldsb	[%l7 + 0x37],	%l4
	ldsw	[%l7 + 0x2C],	%g1
	orncc	%l3,	%g2,	%o5
	fpadd16s	%f28,	%f9,	%f25
	addcc	%g6,	%l1,	%o6
	array8	%i1,	%l0,	%i0
	fpsub16s	%f23,	%f15,	%f2
	fmovsgu	%icc,	%f13,	%f1
	umul	%g7,	0x1420,	%i7
	save %o4, 0x0703, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%o0,	%f22,	%f28
	movrlez	%o1,	0x122,	%i5
	udivx	%o7,	0x050A,	%i2
	st	%f16,	[%l7 + 0x30]
	alignaddr	%g5,	%l6,	%g3
	sra	%l5,	%l2,	%i4
	movpos	%xcc,	%i3,	%g4
	array16	%o3,	%l4,	%o2
	fabsd	%f10,	%f12
	fpmerge	%f24,	%f23,	%f28
	movge	%icc,	%l3,	%g1
	fmovdne	%icc,	%f23,	%f24
	andncc	%g2,	%o5,	%l1
	mulx	%g6,	%i1,	%l0
	fmovrdlz	%o6,	%f12,	%f6
	xorcc	%i0,	%g7,	%i7
	fmovscc	%xcc,	%f22,	%f28
	andn	%o4,	%o0,	%o1
	sethi	0x100C,	%i6
	fmovdleu	%icc,	%f11,	%f2
	sra	%i5,	0x11,	%o7
	stb	%g5,	[%l7 + 0x60]
	umulcc	%l6,	%i2,	%l5
	sdivx	%l2,	0x05BB,	%g3
	movgu	%xcc,	%i4,	%g4
	fmovsge	%xcc,	%f5,	%f21
	edge8ln	%i3,	%l4,	%o3
	fnot1	%f8,	%f8
	fmovdleu	%xcc,	%f5,	%f11
	mulx	%o2,	0x06E1,	%g1
	movleu	%icc,	%g2,	%o5
	fandnot2	%f28,	%f20,	%f30
	save %l1, %l3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i1,	0x077C,	%l0
	movn	%xcc,	%i0,	%g7
	edge8l	%i7,	%o4,	%o0
	edge32l	%o1,	%o6,	%i5
	movvs	%icc,	%o7,	%i6
	edge32	%l6,	%i2,	%l5
	fsrc2s	%f31,	%f21
	edge16n	%l2,	%g5,	%g3
	movrlz	%i4,	%g4,	%i3
	srlx	%l4,	0x16,	%o3
	fand	%f22,	%f10,	%f18
	std	%f14,	[%l7 + 0x40]
	lduw	[%l7 + 0x38],	%o2
	edge8ln	%g1,	%g2,	%o5
	sir	0x0E3C
	andcc	%l3,	%g6,	%i1
	restore %l1, 0x1BE1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g7,	[%l7 + 0x38]
	edge8n	%i7,	%o4,	%o0
	udivx	%o1,	0x1BB2,	%l0
	addc	%i5,	0x0E6C,	%o7
	orcc	%o6,	0x114D,	%l6
	edge8n	%i2,	%l5,	%l2
	mova	%xcc,	%i6,	%g5
	stw	%i4,	[%l7 + 0x40]
	srlx	%g4,	0x19,	%g3
	addccc	%i3,	%l4,	%o3
	mulx	%g1,	%o2,	%g2
	array8	%l3,	%o5,	%g6
	movrgez	%i1,	%i0,	%g7
	movgu	%xcc,	%i7,	%o4
	movrlez	%l1,	%o1,	%o0
	orcc	%l0,	%o7,	%o6
	ldd	[%l7 + 0x08],	%i6
	edge32l	%i2,	%i5,	%l2
	stb	%i6,	[%l7 + 0x24]
	sth	%g5,	[%l7 + 0x1A]
	array32	%i4,	%l5,	%g3
	srax	%g4,	%l4,	%i3
	srl	%o3,	0x1D,	%g1
	smul	%g2,	0x064C,	%o2
	st	%f17,	[%l7 + 0x28]
	orncc	%o5,	%g6,	%i1
	movl	%xcc,	%l3,	%i0
	addcc	%i7,	%g7,	%l1
	fcmpgt32	%f16,	%f26,	%o4
	fmovs	%f21,	%f7
	fmovsvs	%icc,	%f21,	%f6
	ldd	[%l7 + 0x40],	%o0
	ldsw	[%l7 + 0x68],	%l0
	fcmpeq16	%f4,	%f20,	%o0
	fmuld8ulx16	%f13,	%f10,	%f0
	fmovscc	%xcc,	%f6,	%f0
	fcmple32	%f14,	%f16,	%o7
	fmovda	%icc,	%f0,	%f22
	sethi	0x132D,	%o6
	xorcc	%i2,	0x1272,	%l6
	edge8ln	%i5,	%i6,	%l2
	andcc	%i4,	%l5,	%g3
	smulcc	%g5,	%g4,	%i3
	sdivx	%o3,	0x1558,	%g1
	sllx	%g2,	0x14,	%o2
	udiv	%l4,	0x01DD,	%o5
	fandnot1	%f22,	%f24,	%f30
	sdiv	%i1,	0x078D,	%g6
	movle	%icc,	%i0,	%i7
	movg	%icc,	%g7,	%l3
	movle	%icc,	%o4,	%l1
	fmovspos	%icc,	%f5,	%f23
	udivx	%l0,	0x0CF8,	%o1
	fmovdne	%xcc,	%f4,	%f3
	movrgz	%o7,	%o0,	%o6
	xnorcc	%l6,	%i5,	%i2
	array16	%i6,	%l2,	%l5
	setx loop_101, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_101: 	fmovsne	%icc,	%f4,	%f29
	addc	%g4,	%g5,	%o3
	andncc	%g1,	%i3,	%g2
	movrlz	%o2,	0x23B,	%l4
	pdist	%f16,	%f6,	%f2
	restore %i1, 0x0424, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x2B],	%i0
	popc	0x1993,	%g6
	srl	%g7,	0x05,	%i7
	xnor	%o4,	0x110A,	%l1
	sub	%l0,	0x0C15,	%l3
	fmovrdgez	%o7,	%f4,	%f8
	ldx	[%l7 + 0x50],	%o1
	edge16n	%o0,	%l6,	%o6
	fpack16	%f18,	%f10
	popc	0x08B3,	%i2
	add	%i6,	0x0E58,	%i5
	fmovsgu	%icc,	%f11,	%f30
	add	%l2,	0x1D0E,	%l5
	fmovrdgez	%i4,	%f22,	%f30
	or	%g3,	0x0A60,	%g4
	array8	%o3,	%g5,	%i3
	save %g1, %g2, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%i1,	%f22,	%f28
	xnorcc	%o5,	%l4,	%i0
	ldsw	[%l7 + 0x08],	%g7
	movvs	%xcc,	%i7,	%g6
	sth	%l1,	[%l7 + 0x6E]
	udivx	%o4,	0x063B,	%l0
	fmovdle	%icc,	%f17,	%f28
	fnor	%f14,	%f12,	%f28
	movpos	%xcc,	%l3,	%o1
	movcc	%xcc,	%o0,	%o7
	sdiv	%l6,	0x19D2,	%o6
	edge8n	%i6,	%i2,	%l2
	nop
	set	0x2E, %o0
	lduh	[%l7 + %o0],	%l5
	subc	%i5,	%g3,	%g4
	movleu	%icc,	%o3,	%g5
	xnorcc	%i3,	0x1E76,	%g1
	movleu	%xcc,	%g2,	%i4
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%i0
	andncc	%o2,	%l4,	%i0
	ldub	[%l7 + 0x16],	%g7
	subccc	%i7,	%g6,	%l1
	edge32	%o5,	%o4,	%l0
	fpsub32	%f10,	%f14,	%f22
	fpadd16s	%f21,	%f26,	%f4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3585
!	Type f   	: 5330
!	Type i   	: 16085
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x65AEA1CC
.word 0xCA308B3E
.word 0x356EB2E2
.word 0x68B11CBC
.word 0x4127014D
.word 0x40618DE5
.word 0x93928BD7
.word 0x1F208F2E
.word 0x416ED442
.word 0x4DFC6042
.word 0x278A1625
.word 0x41A8BC6F
.word 0x9BCC9794
.word 0x7B6626CD
.word 0xACA31EF1
.word 0x6682C258
.word 0x51E005FD
.word 0x502D74DD
.word 0x8FE35FB9
.word 0x4C467E23
.word 0x4A2990C3
.word 0x2303F63C
.word 0x13B80A65
.word 0x1A02572E
.word 0xD89B3ADB
.word 0x33099959
.word 0xD7BDAEF2
.word 0xE78F2328
.word 0x65D4506A
.word 0x1146D8A7
.word 0x1AE18A58
.word 0xDF5C9F3F
.word 0x1C64DAFB
.word 0x9F3C044C
.word 0x8798002D
.word 0xA9247C29
.word 0xEDF73826
.word 0xD61992FE
.word 0x5CDCA2B7
.word 0xB9660784
.word 0xC322ED6E
.word 0xF3F59DF7
.word 0x09573DF3
.word 0x0E0483B8
.word 0x53184379
.word 0x7954AD6F
.word 0x4F1B0F33
.word 0x7900CA94
.word 0x725AE03A
.word 0xD3C22508
.word 0x52A01C87
.word 0x09F40521
.word 0xCB657C17
.word 0x8A3C0E54
.word 0x6761A1BB
.word 0x50F74DF5
.word 0xFFFFDD29
.word 0xF8C128A6
.word 0x641A2458
.word 0xFD0FCAC6
.word 0x680FE722
.word 0xF83F53BB
.word 0xF7C60ADA
.word 0xD9161713
.end
