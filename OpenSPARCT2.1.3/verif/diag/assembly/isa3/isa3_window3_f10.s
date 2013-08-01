/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f10.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f10.s,v 1.1 2007/05/11 17:22:36 drp Exp $"
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
	setx	0xC69E2EC5706B1381,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x8,	%g1
	set	0x4,	%g2
	set	0xE,	%g3
	set	0x9,	%g4
	set	0xF,	%g5
	set	0xE,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0x3,	%i1
	set	-0x8,	%i2
	set	-0xC,	%i3
	set	-0x9,	%i4
	set	-0xF,	%i5
	set	-0x7,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x7CC3245E,	%l0
	set	0x2A7FCB04,	%l1
	set	0x1F346B38,	%l2
	set	0x6A5EDA42,	%l3
	set	0x475D6FF4,	%l4
	set	0x6F3169FC,	%l5
	set	0x698AF0E8,	%l6
	!# Output registers
	set	0x0A20,	%o0
	set	0x0D56,	%o1
	set	-0x0454,	%o2
	set	0x0ACB,	%o3
	set	0x07F1,	%o4
	set	-0x03CA,	%o5
	set	-0x155B,	%o6
	set	0x16CB,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x345A8B1FC9966019)
	INIT_TH_FP_REG(%l7,%f2,0x8174DFA6D5D60DCC)
	INIT_TH_FP_REG(%l7,%f4,0x9E3D01A733E8A0AE)
	INIT_TH_FP_REG(%l7,%f6,0xF1490523DBA227CE)
	INIT_TH_FP_REG(%l7,%f8,0x9D8EDC5FE29A9BF8)
	INIT_TH_FP_REG(%l7,%f10,0x31F0748EF89C7533)
	INIT_TH_FP_REG(%l7,%f12,0x65ADD35539600C27)
	INIT_TH_FP_REG(%l7,%f14,0x515E2043DDEEF099)
	INIT_TH_FP_REG(%l7,%f16,0x63BB312C02112F6B)
	INIT_TH_FP_REG(%l7,%f18,0x8CB2A1B04F0F7FDA)
	INIT_TH_FP_REG(%l7,%f20,0x98633FBBC403270C)
	INIT_TH_FP_REG(%l7,%f22,0xC8F40ECE237DD9E3)
	INIT_TH_FP_REG(%l7,%f24,0x368B651889F6E646)
	INIT_TH_FP_REG(%l7,%f26,0x66983C9A296348A5)
	INIT_TH_FP_REG(%l7,%f28,0xC3581AFCF179828F)
	INIT_TH_FP_REG(%l7,%f30,0xAA52B5B5B9C7CC64)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fcmps	%fcc3,	%f6,	%f0
	xor	%o2,	%i4,	%i3
	sdiv	%g2,	0x1139,	%g5
	alignaddrl	%i0,	%l0,	%l4
	st	%f1,	[%l7 + 0x0C]
	movle	%icc,	%l5,	%i5
	mulscc	%i1,	%o6,	%l6
	edge32ln	%o3,	%l3,	%g7
	edge32ln	%o7,	%o5,	%l1
	sethi	0x1FB2,	%i2
	movle	%xcc,	%l2,	%g3
	fmovs	%f15,	%f21
	lduw	[%l7 + 0x0C],	%i7
	movrlez	%g1,	%i6,	%o0
	addc	%g4,	0x03C7,	%g6
	edge16ln	%o4,	%o1,	%o2
	udivx	%i3,	0x1166,	%g2
	fnot1s	%f15,	%f30
	fzero	%f26
	and	%g5,	0x0B07,	%i0
	edge16n	%l0,	%l4,	%i4
	or	%i5,	0x040D,	%l5
	ldd	[%l7 + 0x70],	%f12
	edge8ln	%o6,	%i1,	%l6
	sethi	0x1E64,	%l3
	andncc	%o3,	%g7,	%o7
	movrlz	%o5,	0x3B6,	%l1
	fmovrdlez	%l2,	%f22,	%f2
	movvc	%xcc,	%i2,	%g3
	addcc	%i7,	0x0B58,	%i6
	edge8n	%o0,	%g1,	%g4
	stb	%o4,	[%l7 + 0x77]
	sethi	0x0CB9,	%g6
	or	%o2,	0x0EE7,	%i3
	or	%g2,	%g5,	%i0
	edge32l	%o1,	%l4,	%l0
	fandnot2s	%f19,	%f24,	%f19
	sdiv	%i5,	0x07E5,	%i4
	addc	%o6,	%l5,	%l6
	srax	%i1,	%o3,	%l3
	edge8l	%o7,	%o5,	%l1
	umul	%g7,	%l2,	%i2
	mulscc	%g3,	%i6,	%i7
	sra	%g1,	%o0,	%g4
	fpsub16	%f8,	%f8,	%f20
	edge32l	%g6,	%o4,	%i3
	fmovd	%f10,	%f6
	movvc	%icc,	%o2,	%g5
	edge32n	%i0,	%o1,	%g2
	edge16l	%l4,	%l0,	%i5
	mulscc	%i4,	%o6,	%l5
	xnorcc	%i1,	0x0835,	%l6
	ldub	[%l7 + 0x43],	%l3
	fand	%f0,	%f8,	%f4
	edge16	%o3,	%o7,	%l1
	ld	[%l7 + 0x70],	%f23
	array8	%o5,	%g7,	%l2
	fpsub32s	%f24,	%f17,	%f30
	movrgez	%i2,	0x166,	%g3
	smul	%i6,	0x02BF,	%g1
	fsrc1s	%f10,	%f12
	alignaddrl	%i7,	%g4,	%g6
	movcs	%xcc,	%o0,	%i3
	fcmpne32	%f30,	%f14,	%o2
	orncc	%o4,	%g5,	%o1
	ldd	[%l7 + 0x10],	%g2
	ldsw	[%l7 + 0x2C],	%i0
	xor	%l4,	%i5,	%i4
	movvc	%xcc,	%l0,	%l5
	movl	%icc,	%o6,	%i1
	fmovscc	%xcc,	%f14,	%f22
	bshuffle	%f14,	%f18,	%f20
	ldd	[%l7 + 0x30],	%f4
	movrne	%l3,	0x0DB,	%l6
	fxnors	%f2,	%f4,	%f11
	sub	%o3,	0x131C,	%o7
	fexpand	%f10,	%f4
	lduh	[%l7 + 0x10],	%o5
	fmovrdlez	%l1,	%f14,	%f20
	fpadd16	%f20,	%f28,	%f22
	srax	%l2,	%g7,	%g3
	fnands	%f1,	%f23,	%f1
	mova	%icc,	%i2,	%g1
	st	%f10,	[%l7 + 0x3C]
	xor	%i6,	0x1CE3,	%g4
	andn	%g6,	%o0,	%i7
	edge32n	%o2,	%i3,	%o4
	fnegs	%f9,	%f23
	sdivcc	%g5,	0x0E15,	%o1
	subccc	%g2,	%i0,	%l4
	fmovdge	%icc,	%f8,	%f2
	fpsub32s	%f15,	%f2,	%f27
	movre	%i5,	0x2DD,	%l0
	movl	%icc,	%l5,	%i4
	edge16	%o6,	%i1,	%l3
	save %o3, %l6, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l1,	%o5,	%g7
	mova	%xcc,	%g3,	%l2
	ldx	[%l7 + 0x18],	%i2
	movrlz	%g1,	%i6,	%g6
	edge8ln	%o0,	%g4,	%o2
	fmovsa	%icc,	%f16,	%f7
	ld	[%l7 + 0x28],	%f0
	movne	%xcc,	%i7,	%i3
	movvs	%xcc,	%o4,	%g5
	subc	%o1,	%i0,	%g2
	mova	%xcc,	%i5,	%l4
	popc	0x198B,	%l5
	movrgez	%i4,	%l0,	%o6
	edge8n	%l3,	%o3,	%l6
	srl	%o7,	%l1,	%o5
	movvc	%xcc,	%g7,	%i1
	udivcc	%g3,	0x0D68,	%i2
	stw	%l2,	[%l7 + 0x0C]
	orcc	%i6,	0x0720,	%g6
	movpos	%xcc,	%g1,	%g4
	lduh	[%l7 + 0x72],	%o0
	movrlz	%i7,	%o2,	%i3
	ldub	[%l7 + 0x6B],	%o4
	movn	%icc,	%o1,	%i0
	ldsh	[%l7 + 0x0A],	%g5
	lduh	[%l7 + 0x6A],	%i5
	sub	%l4,	0x03B0,	%g2
	st	%f23,	[%l7 + 0x7C]
	sdivcc	%l5,	0x172B,	%l0
	edge8n	%i4,	%o6,	%o3
	edge32l	%l6,	%o7,	%l1
	fmovrslez	%o5,	%f15,	%f23
	udiv	%g7,	0x1A24,	%i1
	fcmpne16	%f0,	%f24,	%l3
	movge	%xcc,	%g3,	%l2
	subc	%i2,	0x01C0,	%g6
	sllx	%g1,	0x19,	%i6
	sth	%g4,	[%l7 + 0x5C]
	lduh	[%l7 + 0x60],	%i7
	fmovsle	%xcc,	%f26,	%f19
	lduh	[%l7 + 0x16],	%o2
	fabss	%f22,	%f24
	andn	%i3,	0x1231,	%o0
	ldx	[%l7 + 0x58],	%o4
	edge16ln	%i0,	%o1,	%g5
	sub	%l4,	%g2,	%l5
	movleu	%icc,	%l0,	%i4
	add	%o6,	0x09CE,	%i5
	ldd	[%l7 + 0x68],	%f6
	array8	%l6,	%o7,	%o3
	ldsb	[%l7 + 0x34],	%l1
	edge16	%o5,	%g7,	%i1
	edge16ln	%l3,	%g3,	%i2
	xorcc	%g6,	0x01AA,	%l2
	ldsh	[%l7 + 0x1E],	%i6
	orn	%g4,	%g1,	%i7
	addcc	%o2,	0x1421,	%i3
	edge8n	%o0,	%i0,	%o4
	movn	%icc,	%o1,	%g5
	or	%l4,	%l5,	%l0
	movneg	%xcc,	%g2,	%i4
	fzeros	%f10
	movneg	%icc,	%i5,	%o6
	movcs	%xcc,	%l6,	%o7
	udiv	%o3,	0x0175,	%l1
	fzero	%f20
	movle	%xcc,	%g7,	%i1
	edge16ln	%o5,	%l3,	%g3
	fpackfix	%f4,	%f11
	fnor	%f20,	%f6,	%f30
	fmovdne	%xcc,	%f20,	%f31
	subcc	%i2,	%g6,	%l2
	fexpand	%f20,	%f0
	movl	%icc,	%g4,	%i6
	restore %i7, 0x128D, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i3,	0x1F28,	%g1
	orncc	%o0,	0x1745,	%o4
	sir	0x0F10
	andcc	%o1,	0x1558,	%g5
	xorcc	%i0,	0x12D7,	%l5
	movleu	%xcc,	%l0,	%g2
	fmovsn	%xcc,	%f16,	%f16
	movle	%icc,	%l4,	%i5
	smul	%i4,	%o6,	%o7
	sir	0x1439
	edge8ln	%o3,	%l1,	%g7
	move	%icc,	%i1,	%l6
	edge8	%l3,	%g3,	%o5
	movre	%g6,	%l2,	%g4
	st	%f17,	[%l7 + 0x14]
	fmovrslez	%i2,	%f9,	%f13
	ldsw	[%l7 + 0x78],	%i7
	andn	%i6,	0x0721,	%i3
	save %o2, 0x15DB, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f14,	%f4,	%o4
	movneg	%xcc,	%g1,	%g5
	fcmpes	%fcc2,	%f27,	%f3
	stb	%o1,	[%l7 + 0x54]
	movre	%i0,	0x237,	%l0
	edge16n	%g2,	%l4,	%i5
	popc	0x1885,	%i4
	orncc	%o6,	0x00AF,	%o7
	ld	[%l7 + 0x08],	%f15
	array32	%o3,	%l1,	%g7
	fmul8x16al	%f6,	%f19,	%f4
	fmovrsgez	%l5,	%f31,	%f25
	movneg	%icc,	%i1,	%l3
	for	%f10,	%f30,	%f6
	ldx	[%l7 + 0x70],	%l6
	move	%icc,	%g3,	%o5
	edge16ln	%g6,	%l2,	%i2
	ldub	[%l7 + 0x3E],	%i7
	fmovsle	%xcc,	%f21,	%f19
	fmovdg	%xcc,	%f5,	%f4
	movge	%xcc,	%g4,	%i6
	edge32n	%i3,	%o2,	%o0
	fornot2s	%f4,	%f12,	%f3
	fmul8ulx16	%f12,	%f2,	%f26
	alignaddr	%g1,	%o4,	%o1
	stb	%i0,	[%l7 + 0x0A]
	fmovs	%f18,	%f13
	edge8n	%l0,	%g5,	%g2
	fnegd	%f0,	%f28
	save %l4, 0x1F08, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o6,	0x18A7,	%o7
	st	%f19,	[%l7 + 0x28]
	save %o3, 0x1F34, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l1,	%g7,	%i1
	fandnot1s	%f5,	%f9,	%f24
	sll	%l3,	0x1B,	%l5
	movl	%xcc,	%l6,	%g3
	popc	0x0BC1,	%o5
	ldub	[%l7 + 0x38],	%l2
	xor	%i2,	%i7,	%g4
	edge16ln	%i6,	%i3,	%o2
	srlx	%g6,	%o0,	%g1
	popc	0x0A97,	%o4
	movn	%xcc,	%i0,	%l0
	srlx	%g5,	0x09,	%o1
	and	%g2,	%l4,	%o6
	srl	%i5,	0x10,	%o7
	xor	%o3,	%l1,	%i4
	fmovse	%xcc,	%f29,	%f20
	popc	%g7,	%l3
	edge8ln	%i1,	%l6,	%l5
	addccc	%o5,	0x1373,	%g3
	xnor	%l2,	%i7,	%i2
	movcc	%icc,	%g4,	%i3
	fmovrdlz	%i6,	%f2,	%f14
	mulx	%o2,	0x1AFC,	%o0
	ldx	[%l7 + 0x38],	%g1
	movrlez	%g6,	0x3A2,	%o4
	edge32n	%i0,	%l0,	%o1
	orncc	%g2,	%l4,	%o6
	nop
	set	0x4E, %o3
	stb	%g5,	[%l7 + %o3]
	fnand	%f22,	%f26,	%f30
	lduh	[%l7 + 0x5A],	%o7
	sub	%i5,	%o3,	%l1
	sra	%g7,	0x02,	%i4
	ldsh	[%l7 + 0x52],	%i1
	st	%f3,	[%l7 + 0x78]
	xnorcc	%l3,	%l5,	%l6
	movrgez	%o5,	0x261,	%g3
	movge	%icc,	%i7,	%i2
	fcmpgt32	%f2,	%f20,	%g4
	st	%f24,	[%l7 + 0x24]
	edge16ln	%l2,	%i3,	%o2
	edge16ln	%o0,	%i6,	%g1
	edge8n	%g6,	%i0,	%o4
	movleu	%icc,	%o1,	%l0
	udiv	%l4,	0x1FA6,	%o6
	ldsb	[%l7 + 0x1D],	%g2
	orn	%g5,	0x1A95,	%i5
	orncc	%o7,	0x0F5D,	%o3
	stw	%g7,	[%l7 + 0x08]
	subc	%i4,	%l1,	%i1
	array16	%l5,	%l3,	%o5
	edge8l	%l6,	%g3,	%i2
	movl	%xcc,	%g4,	%l2
	sethi	0x1226,	%i7
	sra	%o2,	0x1C,	%o0
	smulcc	%i3,	0x1CBA,	%i6
	subcc	%g1,	%i0,	%o4
	srax	%o1,	%l0,	%g6
	nop
	set	0x28, %i5
	std	%f14,	[%l7 + %i5]
	movle	%xcc,	%l4,	%g2
	movleu	%icc,	%g5,	%o6
	edge16	%i5,	%o3,	%o7
	fxnor	%f16,	%f6,	%f26
	mova	%icc,	%i4,	%l1
	array32	%g7,	%l5,	%l3
	alignaddr	%i1,	%l6,	%o5
	lduh	[%l7 + 0x12],	%g3
	sdivcc	%g4,	0x09E7,	%i2
	fmovrdgz	%l2,	%f24,	%f26
	movrgez	%i7,	%o0,	%i3
	sra	%i6,	%o2,	%g1
	ldsh	[%l7 + 0x7A],	%o4
	orn	%o1,	%l0,	%i0
	andncc	%g6,	%l4,	%g5
	popc	0x01C8,	%g2
	srl	%i5,	0x1C,	%o3
	array8	%o7,	%i4,	%l1
	movcs	%xcc,	%g7,	%o6
	ldd	[%l7 + 0x78],	%f20
	alignaddr	%l5,	%l3,	%l6
	or	%i1,	0x1F0B,	%g3
	fandnot2s	%f29,	%f8,	%f4
	stw	%o5,	[%l7 + 0x5C]
	sra	%g4,	%l2,	%i7
	movre	%i2,	0x1DF,	%o0
	fmovdle	%xcc,	%f29,	%f18
	fmovrsgz	%i3,	%f27,	%f20
	movle	%icc,	%i6,	%o2
	movleu	%icc,	%g1,	%o4
	addccc	%l0,	0x045F,	%i0
	edge8	%o1,	%g6,	%g5
	smulcc	%g2,	%i5,	%l4
	ldsh	[%l7 + 0x62],	%o7
	sra	%o3,	0x1E,	%i4
	fmovdg	%xcc,	%f7,	%f10
	movn	%icc,	%g7,	%o6
	fnands	%f6,	%f2,	%f18
	fmul8sux16	%f24,	%f8,	%f16
	fnot1s	%f23,	%f16
	orncc	%l1,	0x0292,	%l5
	movcs	%icc,	%l3,	%l6
	sdiv	%g3,	0x12E6,	%o5
	fors	%f0,	%f5,	%f1
	andn	%g4,	%i1,	%l2
	mulscc	%i2,	%i7,	%o0
	fmovrde	%i6,	%f4,	%f18
	ldsw	[%l7 + 0x18],	%o2
	sll	%i3,	0x02,	%o4
	move	%xcc,	%l0,	%i0
	movcs	%icc,	%o1,	%g1
	movl	%icc,	%g5,	%g6
	smulcc	%g2,	%i5,	%o7
	fmovrdlz	%l4,	%f4,	%f24
	mova	%xcc,	%i4,	%g7
	smul	%o3,	0x0A92,	%o6
	fcmple32	%f10,	%f16,	%l5
	udivx	%l1,	0x1F34,	%l6
	stx	%l3,	[%l7 + 0x08]
	fmovrdgz	%g3,	%f30,	%f0
	orn	%g4,	0x0317,	%i1
	subc	%o5,	%l2,	%i7
	xor	%i2,	%i6,	%o2
	ldx	[%l7 + 0x20],	%o0
	fmovrslz	%i3,	%f17,	%f9
	xorcc	%l0,	%i0,	%o4
	fmovde	%xcc,	%f16,	%f8
	movgu	%icc,	%o1,	%g5
	srl	%g6,	0x17,	%g1
	sth	%i5,	[%l7 + 0x72]
	sdiv	%g2,	0x0EF2,	%l4
	fmuld8sux16	%f23,	%f7,	%f4
	ldd	[%l7 + 0x10],	%f20
	fmovrde	%o7,	%f14,	%f14
	edge32ln	%g7,	%i4,	%o6
	st	%f12,	[%l7 + 0x5C]
	stb	%o3,	[%l7 + 0x4D]
	fmovsg	%xcc,	%f19,	%f30
	ldub	[%l7 + 0x45],	%l1
	subcc	%l6,	0x0E0C,	%l3
	edge16n	%l5,	%g4,	%g3
	movvs	%xcc,	%i1,	%o5
	array32	%i7,	%i2,	%i6
	subccc	%o2,	%l2,	%i3
	sethi	0x0021,	%o0
	subc	%l0,	%o4,	%o1
	edge32ln	%i0,	%g6,	%g1
	movge	%xcc,	%i5,	%g2
	ldd	[%l7 + 0x38],	%f24
	mulscc	%g5,	0x0CDC,	%l4
	edge16	%o7,	%g7,	%o6
	fcmpd	%fcc3,	%f0,	%f4
	movneg	%icc,	%i4,	%o3
	movl	%xcc,	%l1,	%l6
	orncc	%l5,	0x1C57,	%l3
	ldub	[%l7 + 0x12],	%g4
	movge	%xcc,	%i1,	%g3
	fmovsg	%xcc,	%f30,	%f16
	lduw	[%l7 + 0x24],	%o5
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	stw	%l2,	[%l7 + 0x6C]
	fpackfix	%f26,	%f15
	st	%f12,	[%l7 + 0x50]
	fnands	%f19,	%f23,	%f17
	mulscc	%i3,	%i6,	%o0
	mulscc	%l0,	%o4,	%o1
	sra	%i0,	%g6,	%g1
	ldub	[%l7 + 0x79],	%i5
	movleu	%xcc,	%g2,	%l4
	fmovdcc	%xcc,	%f7,	%f16
	fpsub16s	%f22,	%f9,	%f23
	pdist	%f4,	%f12,	%f4
	udivx	%g5,	0x07D7,	%o7
	smul	%g7,	%o6,	%o3
	umulcc	%i4,	%l6,	%l5
	mulx	%l1,	%l3,	%g4
	array8	%i1,	%g3,	%i2
	fmuld8ulx16	%f6,	%f13,	%f12
	fnand	%f6,	%f10,	%f24
	fmovrslez	%i7,	%f21,	%f31
	fcmpes	%fcc3,	%f30,	%f11
	nop
	set	0x1B, %l2
	ldub	[%l7 + %l2],	%o5
	fmovdleu	%xcc,	%f7,	%f14
	udivcc	%o2,	0x061F,	%i3
	movpos	%icc,	%i6,	%o0
	movrgz	%l0,	%l2,	%o1
	andn	%o4,	0x159A,	%g6
	movcs	%xcc,	%i0,	%i5
	move	%icc,	%g2,	%l4
	popc	%g1,	%o7
	movpos	%xcc,	%g7,	%g5
	fnegs	%f14,	%f17
	fmul8ulx16	%f8,	%f0,	%f20
	movne	%xcc,	%o6,	%o3
	fabss	%f23,	%f9
	edge8	%l6,	%l5,	%i4
	edge32	%l3,	%g4,	%l1
	or	%g3,	%i2,	%i1
	fnot2s	%f28,	%f1
	movpos	%icc,	%i7,	%o5
	movleu	%icc,	%o2,	%i3
	fmovda	%icc,	%f25,	%f20
	sethi	0x0E5C,	%i6
	subccc	%o0,	0x1B02,	%l2
	udiv	%o1,	0x0387,	%l0
	movgu	%xcc,	%o4,	%g6
	andn	%i5,	0x1E77,	%i0
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%l4
	xorcc	%g2,	%g1,	%g7
	movcs	%icc,	%o7,	%o6
	fnot2s	%f18,	%f31
	fmovdge	%icc,	%f12,	%f27
	movcs	%icc,	%o3,	%l6
	srax	%l5,	%g5,	%i4
	fpack32	%f26,	%f28,	%f16
	udivcc	%g4,	0x1E16,	%l3
	lduh	[%l7 + 0x2A],	%l1
	nop
	set	0x5C, %o6
	lduw	[%l7 + %o6],	%i2
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%f10
	ldd	[%l7 + 0x58],	%g2
	movgu	%xcc,	%i7,	%o5
	alignaddr	%i1,	%i3,	%i6
	addc	%o2,	0x11A5,	%l2
	ldsh	[%l7 + 0x68],	%o0
	umulcc	%o1,	0x0DEE,	%o4
	fcmpeq16	%f28,	%f0,	%l0
	sethi	0x1F10,	%g6
	fornot2s	%f10,	%f5,	%f6
	fsrc2s	%f18,	%f5
	sdiv	%i0,	0x02C0,	%i5
	mulx	%g2,	%l4,	%g1
	fandnot2	%f0,	%f14,	%f26
	fmovsa	%icc,	%f19,	%f12
	fcmped	%fcc1,	%f4,	%f18
	fsrc1s	%f25,	%f24
	stb	%g7,	[%l7 + 0x13]
	ld	[%l7 + 0x74],	%f3
	movrlez	%o7,	%o6,	%o3
	fmovsn	%icc,	%f0,	%f4
	stw	%l5,	[%l7 + 0x44]
	orn	%l6,	%i4,	%g4
	fcmpgt16	%f12,	%f16,	%l3
	fmovdcs	%icc,	%f29,	%f29
	addc	%l1,	%g5,	%i2
	sra	%g3,	0x1B,	%i7
	fxnors	%f24,	%f29,	%f0
	addccc	%i1,	0x0A4D,	%o5
	and	%i6,	%o2,	%l2
	fandnot2s	%f17,	%f7,	%f3
	edge8ln	%i3,	%o1,	%o4
	ldsh	[%l7 + 0x2C],	%o0
	udivx	%g6,	0x1D83,	%l0
	mulscc	%i0,	0x19CD,	%i5
	fmovdge	%icc,	%f5,	%f7
	fmovdpos	%xcc,	%f4,	%f31
	edge32l	%g2,	%l4,	%g1
	edge32n	%g7,	%o7,	%o3
	orcc	%o6,	%l6,	%i4
	addccc	%g4,	0x0E26,	%l5
	fmovdle	%icc,	%f31,	%f9
	array16	%l3,	%g5,	%i2
	sethi	0x1797,	%l1
	movge	%xcc,	%i7,	%g3
	movgu	%icc,	%o5,	%i1
	fpsub16s	%f0,	%f13,	%f25
	edge32ln	%i6,	%l2,	%o2
	fmovsgu	%xcc,	%f27,	%f20
	fcmpeq16	%f2,	%f10,	%i3
	xnor	%o4,	0x09C0,	%o0
	fandnot2s	%f0,	%f0,	%f11
	addcc	%g6,	0x0E2C,	%o1
	addccc	%l0,	%i0,	%g2
	fmovrde	%l4,	%f30,	%f0
	fcmpne32	%f30,	%f8,	%i5
	ldd	[%l7 + 0x78],	%f18
	sethi	0x07A7,	%g1
	movge	%xcc,	%o7,	%o3
	stx	%o6,	[%l7 + 0x60]
	movne	%icc,	%g7,	%i4
	sdivx	%l6,	0x0B00,	%g4
	movneg	%xcc,	%l3,	%g5
	lduh	[%l7 + 0x22],	%i2
	movl	%icc,	%l1,	%i7
	edge16l	%g3,	%o5,	%l5
	sth	%i1,	[%l7 + 0x1E]
	lduw	[%l7 + 0x68],	%l2
	array16	%i6,	%o2,	%o4
	sdiv	%i3,	0x030D,	%g6
	fmul8ulx16	%f2,	%f26,	%f24
	movre	%o1,	0x1B9,	%l0
	subccc	%i0,	0x1E44,	%g2
	fmovdle	%xcc,	%f17,	%f30
	addcc	%l4,	%o0,	%i5
	stw	%g1,	[%l7 + 0x30]
	subcc	%o3,	%o7,	%o6
	fmovsvs	%xcc,	%f5,	%f31
	fmovdge	%xcc,	%f11,	%f7
	fand	%f14,	%f24,	%f12
	fcmpgt16	%f30,	%f14,	%i4
	movvs	%xcc,	%g7,	%g4
	fornot2	%f6,	%f24,	%f18
	movne	%xcc,	%l6,	%g5
	addc	%i2,	0x17BA,	%l1
	fmovse	%xcc,	%f16,	%f11
	orcc	%l3,	0x07F8,	%g3
	orn	%i7,	0x117B,	%l5
	movrlz	%o5,	0x342,	%l2
	ldsb	[%l7 + 0x0F],	%i1
	fand	%f12,	%f14,	%f22
	udiv	%i6,	0x062B,	%o4
	restore %i3, 0x137F, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x14],	%o1
	fmovdgu	%icc,	%f14,	%f25
	andncc	%g6,	%l0,	%i0
	or	%g2,	0x0622,	%l4
	ldsh	[%l7 + 0x0E],	%i5
	fpmerge	%f13,	%f10,	%f30
	movge	%icc,	%o0,	%o3
	movn	%xcc,	%g1,	%o6
	stw	%o7,	[%l7 + 0x48]
	addcc	%g7,	%i4,	%l6
	fmovrsne	%g4,	%f15,	%f1
	andcc	%g5,	0x1D03,	%l1
	sra	%l3,	%g3,	%i2
	sub	%l5,	0x0C17,	%o5
	movrgz	%i7,	%i1,	%l2
	edge16ln	%i6,	%i3,	%o2
	edge16l	%o4,	%g6,	%o1
	ldsb	[%l7 + 0x45],	%l0
	udivcc	%g2,	0x0F3A,	%i0
	movre	%l4,	%o0,	%o3
	movrgz	%g1,	0x23A,	%i5
	fcmpne32	%f4,	%f16,	%o6
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	addc	%l6,	%g4,	%g5
	movleu	%xcc,	%o7,	%l3
	addcc	%g3,	%i2,	%l5
	movvs	%xcc,	%l1,	%o5
	sra	%i1,	0x05,	%l2
	movrne	%i6,	0x159,	%i3
	movleu	%xcc,	%i7,	%o4
	xnorcc	%o2,	%o1,	%l0
	fmovdneg	%icc,	%f25,	%f15
	mulx	%g6,	0x09D2,	%g2
	fmul8x16al	%f19,	%f4,	%f26
	movleu	%icc,	%l4,	%i0
	sra	%o0,	0x18,	%g1
	umulcc	%i5,	%o6,	%o3
	nop
	set	0x52, %g7
	stb	%g7,	[%l7 + %g7]
	sdivcc	%l6,	0x10CE,	%g4
	edge32	%g5,	%o7,	%i4
	movre	%g3,	%l3,	%i2
	fmovs	%f14,	%f23
	movg	%xcc,	%l1,	%o5
	udivx	%i1,	0x07F6,	%l2
	fmovsg	%icc,	%f12,	%f19
	addc	%l5,	%i3,	%i6
	andn	%o4,	%o2,	%i7
	mova	%icc,	%o1,	%g6
	fmovsvc	%icc,	%f11,	%f22
	addccc	%g2,	%l0,	%l4
	stx	%i0,	[%l7 + 0x08]
	ld	[%l7 + 0x74],	%f2
	edge16n	%o0,	%g1,	%i5
	bshuffle	%f22,	%f14,	%f0
	ldsb	[%l7 + 0x53],	%o6
	fmuld8ulx16	%f4,	%f26,	%f10
	fabsd	%f20,	%f16
	umulcc	%g7,	0x0917,	%l6
	umulcc	%g4,	0x0518,	%g5
	subccc	%o3,	%i4,	%o7
	fmovsgu	%xcc,	%f7,	%f13
	sll	%g3,	%i2,	%l3
	orn	%l1,	0x0B0C,	%i1
	sll	%l2,	%l5,	%i3
	addccc	%i6,	0x1C18,	%o5
	fxor	%f0,	%f8,	%f0
	sth	%o4,	[%l7 + 0x14]
	lduh	[%l7 + 0x62],	%o2
	array32	%o1,	%g6,	%i7
	edge16ln	%l0,	%g2,	%i0
	for	%f2,	%f24,	%f26
	sethi	0x1539,	%l4
	st	%f20,	[%l7 + 0x6C]
	mova	%icc,	%o0,	%i5
	movrlez	%g1,	%g7,	%o6
	edge8l	%l6,	%g5,	%g4
	udivcc	%o3,	0x0E80,	%o7
	subccc	%i4,	0x1B80,	%i2
	mulscc	%l3,	%l1,	%g3
	alignaddrl	%l2,	%i1,	%l5
	movvc	%xcc,	%i6,	%o5
	fsrc1	%f12,	%f4
	array16	%o4,	%o2,	%o1
	fone	%f4
	orcc	%i3,	0x1C51,	%g6
	mulscc	%i7,	0x0A2F,	%l0
	sir	0x0B32
	fnot1	%f12,	%f0
	ld	[%l7 + 0x44],	%f22
	stb	%g2,	[%l7 + 0x08]
	srax	%i0,	%l4,	%o0
	movge	%icc,	%i5,	%g7
	mulscc	%g1,	%l6,	%g5
	add	%o6,	%g4,	%o7
	udivx	%i4,	0x0800,	%o3
	sth	%l3,	[%l7 + 0x38]
	fandnot2	%f22,	%f16,	%f10
	edge16l	%i2,	%g3,	%l1
	ldsb	[%l7 + 0x11],	%i1
	save %l5, 0x1EA5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f4,	%f10
	stw	%o5,	[%l7 + 0x10]
	fnand	%f2,	%f28,	%f16
	fsrc1s	%f31,	%f3
	udiv	%l2,	0x011D,	%o4
	restore %o1, 0x0CB9, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i3,	0x0A4F,	%i7
	sra	%l0,	0x07,	%g6
	xor	%g2,	%i0,	%o0
	fmovdne	%icc,	%f8,	%f16
	andn	%l4,	%g7,	%g1
	sra	%i5,	%g5,	%l6
	sethi	0x10E8,	%o6
	sra	%g4,	%o7,	%i4
	fnegs	%f1,	%f16
	sethi	0x1E81,	%l3
	alignaddr	%o3,	%g3,	%i2
	udivcc	%i1,	0x15DA,	%l5
	array32	%i6,	%o5,	%l2
	fornot2	%f14,	%f4,	%f24
	ld	[%l7 + 0x5C],	%f24
	smulcc	%l1,	%o1,	%o2
	edge8	%i3,	%o4,	%i7
	lduh	[%l7 + 0x14],	%g6
	orcc	%g2,	0x1908,	%l0
	ldub	[%l7 + 0x10],	%o0
	fcmpd	%fcc1,	%f14,	%f6
	fcmpne32	%f30,	%f6,	%i0
	array16	%g7,	%l4,	%g1
	alignaddrl	%i5,	%l6,	%g5
	edge32ln	%o6,	%g4,	%i4
	udiv	%o7,	0x106E,	%o3
	fpackfix	%f30,	%f31
	fmovrdlz	%l3,	%f8,	%f2
	fmovda	%xcc,	%f13,	%f12
	fmovdle	%xcc,	%f1,	%f4
	subcc	%g3,	0x08A3,	%i1
	movcs	%xcc,	%i2,	%l5
	edge16l	%o5,	%i6,	%l2
	movleu	%xcc,	%l1,	%o2
	addc	%o1,	0x1108,	%o4
	fsrc2	%f22,	%f10
	fmovrdne	%i7,	%f12,	%f28
	alignaddr	%i3,	%g6,	%l0
	movrne	%o0,	%i0,	%g7
	fandnot1	%f2,	%f12,	%f14
	fsrc1	%f30,	%f10
	andcc	%g2,	%l4,	%i5
	array8	%g1,	%g5,	%o6
	movg	%xcc,	%l6,	%i4
	array8	%g4,	%o3,	%l3
	fmuld8sux16	%f4,	%f17,	%f0
	orcc	%o7,	%i1,	%i2
	movvs	%xcc,	%g3,	%l5
	nop
	set	0x70, %o5
	std	%f24,	[%l7 + %o5]
	save %o5, 0x0A7C, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l2,	%l1,	%o1
	and	%o2,	%o4,	%i7
	movrlez	%g6,	0x39A,	%l0
	edge8	%o0,	%i3,	%g7
	fcmpne32	%f22,	%f14,	%i0
	ldsb	[%l7 + 0x19],	%g2
	fsrc1	%f16,	%f28
	sub	%i5,	%g1,	%l4
	fmovrsne	%o6,	%f20,	%f19
	fsrc2	%f0,	%f16
	sir	0x0E30
	edge16ln	%g5,	%i4,	%l6
	ld	[%l7 + 0x10],	%f31
	umulcc	%o3,	%l3,	%g4
	movg	%icc,	%o7,	%i1
	andn	%i2,	0x062C,	%l5
	fmovrslz	%o5,	%f16,	%f12
	ldsb	[%l7 + 0x63],	%i6
	ldd	[%l7 + 0x58],	%l2
	umulcc	%l1,	0x029A,	%o1
	umulcc	%o2,	0x0BC5,	%g3
	srax	%i7,	%g6,	%o4
	fmovsl	%xcc,	%f3,	%f6
	array32	%o0,	%i3,	%l0
	srax	%i0,	%g2,	%i5
	ldsw	[%l7 + 0x30],	%g7
	umulcc	%l4,	0x0968,	%o6
	fmovdneg	%xcc,	%f26,	%f5
	fandnot1	%f10,	%f18,	%f14
	orcc	%g5,	%i4,	%l6
	sll	%o3,	%g1,	%l3
	fxor	%f18,	%f22,	%f4
	std	%f6,	[%l7 + 0x10]
	edge32ln	%g4,	%o7,	%i2
	edge8l	%i1,	%o5,	%i6
	popc	0x1C60,	%l2
	sub	%l1,	0x0170,	%l5
	fnegs	%f5,	%f26
	edge8n	%o1,	%o2,	%g3
	mova	%icc,	%i7,	%o4
	edge8n	%o0,	%i3,	%g6
	save %i0, %g2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%g7,	%i5
	orcc	%o6,	%g5,	%i4
	xnor	%l6,	0x0377,	%o3
	ldd	[%l7 + 0x30],	%f18
	smulcc	%g1,	0x1B72,	%l3
	fmovsn	%xcc,	%f17,	%f15
	srax	%l4,	0x0F,	%g4
	srlx	%o7,	0x19,	%i2
	fmovdcc	%icc,	%f11,	%f4
	udivx	%i1,	0x0B1B,	%o5
	movcs	%icc,	%i6,	%l2
	movg	%icc,	%l5,	%l1
	edge16	%o2,	%o1,	%i7
	movge	%xcc,	%g3,	%o0
	ldsh	[%l7 + 0x1A],	%i3
	fpsub16s	%f29,	%f17,	%f27
	movl	%icc,	%o4,	%g6
	fmovrslz	%g2,	%f3,	%f14
	pdist	%f6,	%f4,	%f6
	fandnot1s	%f24,	%f3,	%f6
	edge16l	%l0,	%g7,	%i0
	srl	%i5,	0x10,	%o6
	movl	%icc,	%g5,	%l6
	movneg	%icc,	%i4,	%o3
	andcc	%l3,	%l4,	%g4
	fnot2s	%f14,	%f6
	edge32l	%g1,	%i2,	%o7
	movvs	%xcc,	%o5,	%i6
	fornot1	%f26,	%f6,	%f20
	fabsd	%f6,	%f8
	srl	%i1,	%l2,	%l1
	andncc	%o2,	%o1,	%i7
	smulcc	%l5,	0x1653,	%g3
	sdivx	%o0,	0x19B8,	%o4
	fnands	%f1,	%f17,	%f3
	edge32	%i3,	%g2,	%l0
	fmovdpos	%icc,	%f7,	%f25
	fmul8sux16	%f2,	%f24,	%f4
	movrlz	%g7,	%i0,	%i5
	smulcc	%g6,	0x145C,	%g5
	addcc	%o6,	%l6,	%o3
	movge	%icc,	%i4,	%l3
	movre	%l4,	0x2DF,	%g1
	ldd	[%l7 + 0x20],	%f16
	fmovse	%icc,	%f23,	%f28
	sdivx	%i2,	0x1A18,	%o7
	movrlez	%g4,	%i6,	%i1
	addcc	%o5,	%l1,	%o2
	movgu	%icc,	%o1,	%i7
	mova	%xcc,	%l5,	%l2
	edge16l	%g3,	%o0,	%i3
	movcc	%icc,	%o4,	%l0
	movvc	%xcc,	%g2,	%g7
	andcc	%i0,	%i5,	%g5
	andn	%o6,	0x0599,	%g6
	fabss	%f9,	%f23
	smul	%o3,	%i4,	%l3
	subccc	%l6,	%g1,	%l4
	array8	%i2,	%o7,	%i6
	addcc	%i1,	%o5,	%l1
	movn	%xcc,	%g4,	%o1
	addc	%o2,	0x0C6D,	%i7
	fcmpgt32	%f4,	%f18,	%l5
	fmovdgu	%icc,	%f13,	%f15
	ld	[%l7 + 0x28],	%f28
	stb	%g3,	[%l7 + 0x68]
	xnorcc	%l2,	%o0,	%o4
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	xorcc	%g2,	%i0,	%g7
	sir	0x1F59
	fmul8ulx16	%f30,	%f22,	%f22
	fmovd	%f20,	%f10
	umulcc	%i5,	0x072E,	%g5
	edge16n	%o6,	%o3,	%g6
	std	%f4,	[%l7 + 0x08]
	ldd	[%l7 + 0x60],	%i4
	bshuffle	%f24,	%f24,	%f0
	fabsd	%f14,	%f4
	addcc	%l3,	%l6,	%g1
	movrne	%i2,	%l4,	%i6
	xnor	%i1,	%o7,	%l1
	movrgz	%o5,	0x384,	%g4
	st	%f29,	[%l7 + 0x5C]
	movvc	%xcc,	%o1,	%i7
	or	%o2,	%l5,	%l2
	fandnot2	%f20,	%f2,	%f22
	subcc	%o0,	0x10FB,	%g3
	fzeros	%f13
	stx	%l0,	[%l7 + 0x40]
	fmovdge	%icc,	%f2,	%f9
	movrlez	%i3,	0x103,	%g2
	fmuld8sux16	%f8,	%f14,	%f24
	save %o4, %g7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i0,	0x12E,	%g5
	addc	%o6,	%o3,	%g6
	sir	0x110D
	lduw	[%l7 + 0x34],	%l3
	subc	%i4,	%l6,	%g1
	addc	%i2,	0x031B,	%l4
	edge16	%i1,	%i6,	%l1
	fcmpeq32	%f4,	%f20,	%o5
	fxors	%f1,	%f16,	%f14
	edge16n	%o7,	%g4,	%o1
	fpadd16	%f6,	%f16,	%f10
	edge32ln	%o2,	%l5,	%i7
	std	%f0,	[%l7 + 0x38]
	movgu	%icc,	%l2,	%g3
	ldsw	[%l7 + 0x20],	%o0
	movvs	%icc,	%i3,	%l0
	xorcc	%o4,	0x1365,	%g7
	movleu	%xcc,	%g2,	%i5
	edge16	%g5,	%i0,	%o6
	ldsw	[%l7 + 0x70],	%o3
	ldsh	[%l7 + 0x44],	%l3
	movleu	%icc,	%g6,	%l6
	edge16n	%g1,	%i2,	%i4
	udivx	%i1,	0x0872,	%l4
	ldd	[%l7 + 0x48],	%i6
	movneg	%icc,	%o5,	%l1
	ldd	[%l7 + 0x38],	%o6
	subc	%g4,	%o1,	%l5
	edge16ln	%i7,	%l2,	%o2
	srlx	%o0,	0x02,	%i3
	sub	%l0,	%g3,	%g7
	orn	%o4,	0x0490,	%i5
	fandnot2s	%f22,	%f20,	%f14
	xnorcc	%g5,	0x05FB,	%g2
	fmul8x16	%f11,	%f6,	%f14
	mulscc	%o6,	0x03E1,	%i0
	sllx	%o3,	0x11,	%l3
	xnor	%l6,	%g1,	%g6
	fmovsle	%icc,	%f10,	%f2
	fsrc1	%f8,	%f10
	fmovsg	%icc,	%f17,	%f21
	movleu	%xcc,	%i2,	%i4
	addcc	%l4,	0x1C31,	%i6
	fornot1s	%f3,	%f3,	%f9
	fxor	%f22,	%f0,	%f28
	ldsb	[%l7 + 0x32],	%o5
	srlx	%l1,	0x1C,	%o7
	orncc	%g4,	%o1,	%i1
	fzero	%f0
	lduw	[%l7 + 0x28],	%l5
	umul	%l2,	0x0974,	%o2
	edge32ln	%i7,	%o0,	%l0
	fornot2	%f20,	%f14,	%f8
	array32	%g3,	%i3,	%g7
	mulscc	%i5,	0x19B9,	%o4
	nop
	set	0x24, %o7
	stw	%g5,	[%l7 + %o7]
	movvc	%icc,	%g2,	%o6
	pdist	%f14,	%f6,	%f0
	fmovdl	%icc,	%f18,	%f28
	ldub	[%l7 + 0x5D],	%i0
	movrgz	%o3,	0x006,	%l3
	st	%f30,	[%l7 + 0x78]
	or	%g1,	0x0570,	%g6
	fmovdgu	%icc,	%f2,	%f26
	ldsw	[%l7 + 0x40],	%l6
	fmovsgu	%xcc,	%f2,	%f19
	addcc	%i2,	0x1AE6,	%l4
	subcc	%i6,	%o5,	%i4
	fcmped	%fcc3,	%f22,	%f24
	movle	%xcc,	%o7,	%l1
	fmovrslez	%g4,	%f1,	%f21
	fcmpne32	%f22,	%f20,	%i1
	sir	0x1786
	edge8n	%l5,	%l2,	%o1
	movrgz	%o2,	0x3DE,	%i7
	xorcc	%l0,	0x104D,	%g3
	fmovdneg	%icc,	%f22,	%f10
	fornot2s	%f25,	%f19,	%f1
	move	%icc,	%i3,	%g7
	orncc	%o0,	0x1C65,	%o4
	or	%g5,	0x1AF5,	%g2
	edge16	%o6,	%i5,	%i0
	fcmpne32	%f6,	%f12,	%o3
	edge16ln	%g1,	%l3,	%l6
	andncc	%g6,	%i2,	%l4
	edge32l	%o5,	%i4,	%i6
	subcc	%l1,	%o7,	%i1
	movne	%xcc,	%g4,	%l5
	fxnor	%f28,	%f10,	%f2
	fnands	%f3,	%f30,	%f22
	andn	%l2,	0x0DDF,	%o2
	smul	%o1,	0x18A9,	%l0
	srl	%g3,	%i3,	%i7
	addcc	%o0,	%g7,	%g5
	udivcc	%o4,	0x1463,	%o6
	sub	%i5,	0x1B52,	%i0
	addcc	%g2,	0x19B6,	%g1
	std	%f20,	[%l7 + 0x38]
	sll	%o3,	%l3,	%g6
	ldsh	[%l7 + 0x46],	%i2
	edge8n	%l4,	%o5,	%l6
	smulcc	%i6,	%i4,	%o7
	and	%l1,	%g4,	%l5
	addccc	%l2,	0x12B0,	%i1
	addc	%o2,	0x0295,	%l0
	smul	%g3,	%i3,	%i7
	movg	%icc,	%o0,	%g7
	xnor	%g5,	0x194F,	%o4
	edge8	%o1,	%i5,	%o6
	mulscc	%i0,	%g1,	%g2
	restore %o3, %l3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l4,	%o5,	%l6
	xnorcc	%i2,	0x107C,	%i4
	srax	%o7,	0x0A,	%i6
	orcc	%g4,	%l1,	%l2
	stb	%i1,	[%l7 + 0x14]
	edge32ln	%l5,	%o2,	%g3
	fmovd	%f24,	%f22
	edge16n	%i3,	%l0,	%i7
	udivx	%o0,	0x1D31,	%g5
	movn	%icc,	%o4,	%o1
	subccc	%g7,	0x15A2,	%o6
	stb	%i5,	[%l7 + 0x78]
	movne	%xcc,	%g1,	%i0
	edge16	%o3,	%l3,	%g6
	ldub	[%l7 + 0x45],	%l4
	movre	%o5,	0x113,	%l6
	xnor	%g2,	0x0843,	%i4
	save %i2, %o7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%l1,	%l2
	fmul8x16au	%f21,	%f25,	%f22
	fabss	%f4,	%f27
	movvs	%icc,	%g4,	%l5
	edge32n	%i1,	%g3,	%o2
	fmovsl	%xcc,	%f10,	%f24
	popc	0x1F48,	%i3
	movneg	%icc,	%l0,	%i7
	or	%g5,	%o0,	%o1
	st	%f17,	[%l7 + 0x5C]
	fmul8x16	%f11,	%f30,	%f10
	fmovdle	%xcc,	%f20,	%f16
	sub	%o4,	%o6,	%g7
	addccc	%i5,	0x1213,	%i0
	edge8n	%o3,	%l3,	%g6
	movl	%icc,	%g1,	%o5
	movrne	%l4,	%l6,	%i4
	xnorcc	%g2,	%i2,	%o7
	fmul8ulx16	%f20,	%f2,	%f8
	fmovrdlz	%i6,	%f16,	%f26
	save %l2, %l1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x38],	%g4
	movrgez	%g3,	0x026,	%i1
	movrlz	%i3,	0x1E2,	%o2
	xnor	%i7,	%g5,	%l0
	orncc	%o1,	0x1758,	%o4
	sra	%o0,	0x05,	%g7
	fnegs	%f30,	%f19
	orcc	%o6,	%i5,	%o3
	fmovrdlz	%i0,	%f4,	%f2
	addc	%g6,	%l3,	%o5
	movleu	%xcc,	%g1,	%l6
	fmovdneg	%xcc,	%f12,	%f25
	srax	%i4,	0x0C,	%g2
	edge16ln	%l4,	%o7,	%i2
	andcc	%l2,	0x0B7A,	%i6
	srlx	%l1,	%g4,	%g3
	sir	0x1090
	fpsub16	%f20,	%f8,	%f28
	ldd	[%l7 + 0x30],	%f6
	fmovrdlz	%i1,	%f4,	%f20
	movcs	%xcc,	%i3,	%o2
	fpadd16s	%f19,	%f27,	%f1
	orn	%i7,	%g5,	%l0
	edge8ln	%o1,	%o4,	%o0
	movre	%g7,	%l5,	%o6
	xor	%i5,	%o3,	%i0
	sethi	0x1A29,	%g6
	sethi	0x071E,	%o5
	orncc	%l3,	%g1,	%l6
	ldsh	[%l7 + 0x6C],	%g2
	fpmerge	%f20,	%f14,	%f8
	fnegs	%f5,	%f21
	mulscc	%i4,	0x1AE9,	%o7
	fsrc1	%f4,	%f6
	or	%l4,	%l2,	%i2
	lduw	[%l7 + 0x40],	%l1
	udiv	%i6,	0x0267,	%g4
	alignaddrl	%i1,	%g3,	%i3
	sub	%o2,	%g5,	%i7
	smulcc	%o1,	0x0701,	%o4
	fxors	%f15,	%f21,	%f12
	srlx	%o0,	0x04,	%g7
	movrlz	%l5,	%l0,	%i5
	popc	0x036F,	%o6
	fpadd32	%f22,	%f24,	%f14
	sth	%i0,	[%l7 + 0x1A]
	andncc	%g6,	%o5,	%o3
	ldsw	[%l7 + 0x18],	%g1
	sra	%l6,	0x06,	%l3
	stb	%g2,	[%l7 + 0x3D]
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	lduw	[%l7 + 0x44],	%i2
	movle	%icc,	%l1,	%l2
	sdivx	%g4,	0x1737,	%i6
	orncc	%g3,	0x16B7,	%i3
	umul	%i1,	%g5,	%i7
	fpack16	%f2,	%f12
	movg	%xcc,	%o2,	%o1
	and	%o0,	0x1FD5,	%g7
	add	%o4,	0x13BC,	%l0
	andcc	%i5,	%o6,	%l5
	fmovsleu	%xcc,	%f18,	%f31
	orcc	%g6,	%o5,	%o3
	srl	%g1,	0x15,	%i0
	srl	%l3,	%l6,	%i4
	subc	%l4,	0x1974,	%o7
	sdivx	%i2,	0x1066,	%l1
	udivcc	%l2,	0x1FE7,	%g2
	ldsw	[%l7 + 0x28],	%i6
	fmovdvc	%icc,	%f6,	%f29
	lduw	[%l7 + 0x10],	%g4
	fmovrde	%g3,	%f10,	%f10
	orn	%i3,	0x0DC3,	%g5
	fcmpes	%fcc0,	%f26,	%f25
	andncc	%i1,	%i7,	%o1
	fmovdcc	%icc,	%f5,	%f17
	udiv	%o0,	0x1220,	%o2
	udiv	%o4,	0x1ECD,	%l0
	mulscc	%i5,	%g7,	%o6
	orn	%l5,	0x0E21,	%g6
	fnors	%f9,	%f26,	%f29
	lduw	[%l7 + 0x34],	%o3
	st	%f19,	[%l7 + 0x24]
	movneg	%xcc,	%o5,	%i0
	orn	%g1,	%l3,	%l6
	lduh	[%l7 + 0x52],	%l4
	fcmpeq16	%f16,	%f12,	%o7
	orncc	%i2,	%l1,	%l2
	andn	%i4,	0x0744,	%i6
	movne	%icc,	%g2,	%g3
	nop
	set	0x50, %o1
	ldsw	[%l7 + %o1],	%i3
	fmovrdlez	%g5,	%f20,	%f18
	and	%i1,	%i7,	%o1
	sethi	0x09B0,	%o0
	ldx	[%l7 + 0x48],	%o2
	andn	%o4,	%l0,	%i5
	movne	%xcc,	%g7,	%g4
	sdivcc	%l5,	0x0A86,	%o6
	fornot1	%f30,	%f10,	%f28
	subc	%o3,	%g6,	%i0
	srl	%g1,	%l3,	%l6
	fmovdle	%xcc,	%f7,	%f0
	or	%l4,	0x1324,	%o7
	fmovscs	%icc,	%f6,	%f17
	ldsb	[%l7 + 0x77],	%i2
	srl	%o5,	0x02,	%l1
	save %i4, %l2, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%i6,	%g3
	fpsub16	%f6,	%f2,	%f14
	fmovsa	%icc,	%f21,	%f26
	xor	%g5,	0x06BE,	%i3
	xnor	%i7,	0x0045,	%i1
	movge	%icc,	%o0,	%o1
	ldd	[%l7 + 0x68],	%f20
	stb	%o4,	[%l7 + 0x2E]
	ldd	[%l7 + 0x10],	%f30
	edge8	%o2,	%i5,	%l0
	st	%f13,	[%l7 + 0x20]
	addcc	%g4,	0x0D4F,	%g7
	subc	%o6,	0x048A,	%o3
	ld	[%l7 + 0x6C],	%f6
	movrlz	%g6,	0x163,	%i0
	fmovscs	%xcc,	%f31,	%f0
	sub	%g1,	%l5,	%l3
	mulx	%l6,	%l4,	%o7
	subccc	%o5,	%l1,	%i2
	lduh	[%l7 + 0x20],	%l2
	fcmple32	%f6,	%f4,	%i4
	movg	%xcc,	%i6,	%g3
	ldub	[%l7 + 0x0E],	%g5
	fmuld8sux16	%f21,	%f17,	%f6
	fmovrdgz	%i3,	%f20,	%f26
	sub	%i7,	0x0974,	%i1
	smulcc	%o0,	%g2,	%o4
	movle	%icc,	%o1,	%o2
	sll	%i5,	0x15,	%l0
	edge16ln	%g4,	%o6,	%o3
	subc	%g7,	0x0CBD,	%g6
	fornot2s	%f10,	%f4,	%f17
	edge16l	%i0,	%g1,	%l5
	fxnor	%f24,	%f30,	%f2
	addcc	%l3,	%l4,	%l6
	movcc	%icc,	%o5,	%l1
	sra	%i2,	0x0D,	%l2
	move	%icc,	%o7,	%i4
	fmovrslz	%i6,	%f4,	%f20
	lduw	[%l7 + 0x28],	%g5
	movvs	%icc,	%g3,	%i3
	ldd	[%l7 + 0x20],	%f0
	movcc	%xcc,	%i1,	%i7
	or	%o0,	0x1CBF,	%g2
	fmovsl	%xcc,	%f17,	%f6
	fandnot1	%f30,	%f24,	%f28
	stx	%o4,	[%l7 + 0x08]
	movrlez	%o1,	0x084,	%i5
	addcc	%o2,	0x19D6,	%g4
	array32	%l0,	%o6,	%o3
	edge16ln	%g6,	%i0,	%g7
	movvs	%xcc,	%l5,	%l3
	fcmpgt16	%f30,	%f26,	%l4
	movcc	%icc,	%g1,	%l6
	xor	%l1,	%i2,	%o5
	edge32	%l2,	%o7,	%i6
	movn	%icc,	%i4,	%g3
	edge32n	%g5,	%i1,	%i3
	stw	%o0,	[%l7 + 0x10]
	edge16ln	%g2,	%o4,	%i7
	xnor	%o1,	0x1830,	%i5
	lduw	[%l7 + 0x30],	%g4
	sra	%l0,	0x12,	%o6
	udivcc	%o3,	0x0025,	%g6
	umulcc	%i0,	%g7,	%o2
	array32	%l3,	%l4,	%l5
	sll	%g1,	%l1,	%i2
	ldx	[%l7 + 0x50],	%o5
	umul	%l6,	0x00CD,	%l2
	orn	%o7,	0x02F8,	%i4
	movge	%xcc,	%i6,	%g3
	srlx	%i1,	0x17,	%i3
	alignaddr	%g5,	%g2,	%o0
	array8	%o4,	%o1,	%i7
	movpos	%icc,	%i5,	%l0
	ld	[%l7 + 0x14],	%f23
	orcc	%g4,	0x0B3E,	%o6
	sth	%o3,	[%l7 + 0x44]
	ldsw	[%l7 + 0x60],	%i0
	ldd	[%l7 + 0x70],	%f26
	fmovdn	%xcc,	%f0,	%f27
	alignaddr	%g7,	%o2,	%l3
	sll	%g6,	0x06,	%l5
	movle	%icc,	%l4,	%g1
	fmovd	%f18,	%f10
	fmovsl	%xcc,	%f5,	%f13
	fcmpgt32	%f24,	%f8,	%l1
	addc	%o5,	%i2,	%l2
	st	%f19,	[%l7 + 0x6C]
	xor	%o7,	%i4,	%l6
	movvs	%icc,	%i6,	%i1
	fpack32	%f16,	%f18,	%f6
	sllx	%g3,	%i3,	%g2
	movne	%xcc,	%o0,	%g5
	edge8n	%o4,	%o1,	%i7
	nop
	set	0x28, %i1
	sth	%l0,	[%l7 + %i1]
	addccc	%i5,	0x02E1,	%g4
	addc	%o6,	%i0,	%g7
	movrgz	%o2,	0x362,	%l3
	smulcc	%g6,	%l5,	%l4
	fpack16	%f24,	%f7
	addcc	%o3,	%l1,	%g1
	smulcc	%i2,	%o5,	%o7
	alignaddrl	%l2,	%i4,	%l6
	stw	%i6,	[%l7 + 0x24]
	fpadd16s	%f3,	%f12,	%f9
	andcc	%i1,	%g3,	%g2
	srlx	%o0,	%i3,	%o4
	fabss	%f12,	%f22
	edge32l	%g5,	%i7,	%l0
	xnorcc	%o1,	0x1D93,	%g4
	mulscc	%i5,	%o6,	%i0
	subccc	%g7,	0x0D74,	%o2
	fmovsvs	%xcc,	%f23,	%f6
	xorcc	%l3,	0x1228,	%g6
	movleu	%icc,	%l4,	%o3
	sdivx	%l1,	0x04FD,	%l5
	udiv	%i2,	0x1729,	%g1
	sethi	0x1B80,	%o7
	fmovsl	%xcc,	%f15,	%f31
	movcc	%xcc,	%l2,	%i4
	edge16	%o5,	%l6,	%i1
	movl	%icc,	%i6,	%g2
	movg	%xcc,	%o0,	%i3
	addc	%o4,	%g3,	%g5
	ldsw	[%l7 + 0x38],	%i7
	fmovdn	%icc,	%f5,	%f13
	subc	%o1,	0x1480,	%g4
	fones	%f25
	xnor	%i5,	%o6,	%i0
	sll	%l0,	%o2,	%l3
	xor	%g7,	0x023B,	%g6
	addccc	%o3,	0x161A,	%l4
	movg	%xcc,	%l1,	%i2
	sll	%g1,	0x19,	%l5
	fpack32	%f10,	%f20,	%f0
	fmovrdgz	%l2,	%f24,	%f14
	fmovsa	%icc,	%f27,	%f0
	movneg	%xcc,	%o7,	%o5
	edge32	%l6,	%i1,	%i4
	fmovrsgz	%i6,	%f17,	%f6
	edge8	%o0,	%g2,	%i3
	udivcc	%o4,	0x10CE,	%g5
	fcmpes	%fcc3,	%f23,	%f12
	alignaddr	%i7,	%g3,	%g4
	sdiv	%i5,	0x1DC6,	%o6
	st	%f11,	[%l7 + 0x14]
	fmovdge	%xcc,	%f20,	%f8
	ld	[%l7 + 0x20],	%f1
	sir	0x1BF6
	orcc	%o1,	%i0,	%o2
	addc	%l3,	0x11FF,	%g7
	subccc	%l0,	%o3,	%l4
	xnorcc	%g6,	0x0ABD,	%l1
	mulx	%i2,	%l5,	%g1
	alignaddr	%o7,	%o5,	%l6
	edge8l	%l2,	%i4,	%i1
	stx	%o0,	[%l7 + 0x78]
	fmovsne	%xcc,	%f22,	%f8
	edge32l	%g2,	%i6,	%i3
	sdiv	%g5,	0x0984,	%o4
	xorcc	%i7,	0x1931,	%g4
	sdivx	%i5,	0x146B,	%o6
	andncc	%g3,	%i0,	%o1
	ldsh	[%l7 + 0x68],	%o2
	movrlz	%g7,	0x027,	%l3
	edge8	%o3,	%l4,	%g6
	lduw	[%l7 + 0x60],	%l1
	edge16ln	%i2,	%l0,	%l5
	fabsd	%f26,	%f26
	udivx	%g1,	0x1549,	%o5
	lduw	[%l7 + 0x48],	%o7
	movvs	%icc,	%l6,	%i4
	fmovdneg	%xcc,	%f15,	%f2
	sdivcc	%i1,	0x1E68,	%o0
	fnot1s	%f16,	%f0
	fmul8sux16	%f30,	%f30,	%f10
	edge16l	%l2,	%i6,	%g2
	movre	%g5,	0x20F,	%o4
	edge16	%i3,	%g4,	%i5
	fcmple32	%f14,	%f4,	%i7
	xorcc	%o6,	0x0CC4,	%g3
	fmovdcs	%icc,	%f16,	%f19
	array8	%i0,	%o1,	%g7
	movn	%xcc,	%l3,	%o2
	movne	%xcc,	%o3,	%g6
	nop
	set	0x10, %g5
	ldd	[%l7 + %g5],	%f22
	ldub	[%l7 + 0x7F],	%l4
	movcs	%icc,	%l1,	%i2
	xnor	%l0,	%l5,	%o5
	orcc	%g1,	%o7,	%l6
	orcc	%i4,	%o0,	%l2
	udivcc	%i1,	0x1F6D,	%g2
	movrlez	%i6,	0x2E1,	%o4
	ldub	[%l7 + 0x25],	%i3
	edge16l	%g4,	%g5,	%i5
	and	%i7,	%g3,	%o6
	fandnot1	%f10,	%f12,	%f30
	umul	%i0,	0x09AF,	%g7
	movle	%xcc,	%o1,	%o2
	lduw	[%l7 + 0x74],	%l3
	sth	%g6,	[%l7 + 0x22]
	fmuld8ulx16	%f19,	%f5,	%f4
	srax	%o3,	0x16,	%l1
	movrne	%l4,	0x27D,	%i2
	subc	%l5,	0x0940,	%l0
	movvc	%xcc,	%g1,	%o5
	mulx	%o7,	0x1D41,	%i4
	edge16l	%o0,	%l6,	%l2
	movg	%icc,	%i1,	%i6
	fmovscs	%icc,	%f25,	%f13
	and	%o4,	%i3,	%g2
	addcc	%g5,	0x1A1A,	%g4
	movre	%i5,	%i7,	%o6
	addcc	%g3,	%g7,	%i0
	movle	%icc,	%o2,	%o1
	movneg	%xcc,	%g6,	%l3
	ld	[%l7 + 0x0C],	%f31
	sub	%o3,	%l4,	%i2
	edge32l	%l5,	%l0,	%g1
	andcc	%o5,	0x1041,	%o7
	lduh	[%l7 + 0x42],	%i4
	move	%icc,	%l1,	%o0
	srl	%l2,	0x1D,	%l6
	edge32l	%i1,	%o4,	%i6
	subccc	%i3,	%g2,	%g4
	addc	%i5,	%i7,	%g5
	smulcc	%o6,	%g3,	%g7
	movrne	%i0,	%o1,	%o2
	mulx	%g6,	%l3,	%o3
	fmovrslz	%i2,	%f3,	%f1
	ldsb	[%l7 + 0x50],	%l5
	xor	%l4,	0x1F51,	%l0
	movrne	%g1,	0x1EE,	%o5
	umulcc	%o7,	%l1,	%o0
	movle	%xcc,	%i4,	%l6
	fmovsvc	%icc,	%f5,	%f13
	movn	%xcc,	%i1,	%l2
	edge32ln	%o4,	%i3,	%i6
	edge16ln	%g2,	%i5,	%g4
	mulscc	%g5,	%i7,	%o6
	ldsb	[%l7 + 0x4E],	%g7
	edge16ln	%i0,	%g3,	%o1
	movn	%xcc,	%o2,	%g6
	fmovscc	%xcc,	%f12,	%f8
	fmovrsgz	%l3,	%f7,	%f6
	edge32ln	%o3,	%i2,	%l5
	fmovscs	%xcc,	%f19,	%f6
	movg	%icc,	%l0,	%l4
	ldd	[%l7 + 0x58],	%g0
	edge32n	%o7,	%l1,	%o0
	fmul8x16au	%f9,	%f27,	%f10
	fxors	%f15,	%f12,	%f12
	and	%i4,	0x05B1,	%o5
	fmovsneg	%xcc,	%f2,	%f27
	movg	%xcc,	%i1,	%l6
	fmovs	%f31,	%f21
	xnorcc	%l2,	0x1465,	%o4
	alignaddrl	%i3,	%g2,	%i5
	move	%icc,	%g4,	%g5
	fnot2	%f14,	%f0
	stb	%i6,	[%l7 + 0x4D]
	mulscc	%o6,	%i7,	%g7
	edge8ln	%g3,	%i0,	%o1
	fnot2s	%f8,	%f25
	xorcc	%g6,	%o2,	%l3
	popc	%o3,	%i2
	fxors	%f13,	%f4,	%f7
	fpmerge	%f9,	%f28,	%f4
	fmovd	%f2,	%f22
	sdivx	%l0,	0x1D5F,	%l4
	fzero	%f18
	and	%l5,	0x1E92,	%g1
	fone	%f12
	edge8	%o7,	%o0,	%l1
	smulcc	%i4,	%o5,	%i1
	alignaddrl	%l6,	%o4,	%i3
	edge16	%l2,	%i5,	%g4
	andcc	%g2,	%g5,	%o6
	fone	%f28
	fpadd32	%f14,	%f8,	%f20
	udiv	%i6,	0x14B8,	%g7
	sethi	0x0E60,	%g3
	movn	%xcc,	%i7,	%o1
	movvs	%xcc,	%i0,	%o2
	array16	%l3,	%g6,	%o3
	fnot1s	%f10,	%f15
	sll	%l0,	%l4,	%l5
	movrgez	%g1,	%o7,	%i2
	fmovdne	%icc,	%f23,	%f3
	fnot2s	%f27,	%f7
	edge8n	%l1,	%o0,	%i4
	movneg	%icc,	%i1,	%l6
	fmovdvs	%xcc,	%f1,	%f0
	sra	%o4,	%i3,	%l2
	or	%i5,	0x1373,	%g4
	fsrc2s	%f30,	%f20
	or	%o5,	0x069C,	%g5
	array32	%o6,	%i6,	%g7
	srl	%g3,	%i7,	%g2
	fcmps	%fcc1,	%f8,	%f29
	movcc	%icc,	%o1,	%i0
	movge	%icc,	%o2,	%g6
	fands	%f2,	%f22,	%f14
	save %o3, %l0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l3,	%l5,	%g1
	fpadd32	%f18,	%f20,	%f16
	umulcc	%i2,	%l1,	%o0
	movre	%i4,	0x075,	%i1
	ldub	[%l7 + 0x42],	%l6
	movcs	%icc,	%o7,	%o4
	fpadd32s	%f16,	%f10,	%f8
	movcs	%xcc,	%i3,	%l2
	udiv	%i5,	0x046F,	%o5
	alignaddrl	%g4,	%g5,	%o6
	fmovdle	%xcc,	%f17,	%f27
	movrgz	%g7,	0x3F7,	%i6
	srax	%i7,	0x05,	%g3
	fxnors	%f8,	%f6,	%f31
	smulcc	%g2,	0x1708,	%o1
	stx	%o2,	[%l7 + 0x30]
	sdivx	%i0,	0x168E,	%g6
	smulcc	%l0,	0x09CA,	%o3
	movrgez	%l4,	%l5,	%l3
	movcs	%xcc,	%g1,	%i2
	fpsub16s	%f12,	%f22,	%f27
	lduw	[%l7 + 0x24],	%l1
	stb	%o0,	[%l7 + 0x4F]
	smul	%i4,	%l6,	%o7
	movge	%xcc,	%o4,	%i3
	subccc	%i1,	0x0195,	%l2
	add	%i5,	0x1B34,	%o5
	andn	%g5,	%g4,	%o6
	sra	%i6,	0x1F,	%g7
	xorcc	%g3,	%g2,	%i7
	sdiv	%o1,	0x1EB9,	%i0
	udivx	%g6,	0x0375,	%l0
	smulcc	%o2,	0x11D1,	%l4
	fmovdvc	%icc,	%f10,	%f15
	andcc	%l5,	0x12E9,	%l3
	sllx	%o3,	0x16,	%g1
	movvc	%xcc,	%l1,	%o0
	edge8ln	%i4,	%l6,	%i2
	movle	%icc,	%o7,	%i3
	nop
	set	0x38, %i2
	stx	%o4,	[%l7 + %i2]
	umulcc	%i1,	0x142A,	%l2
	sth	%o5,	[%l7 + 0x38]
	ldd	[%l7 + 0x18],	%i4
	movrne	%g4,	0x144,	%o6
	movrgz	%i6,	%g5,	%g3
	edge32	%g7,	%g2,	%o1
	fcmpne16	%f18,	%f6,	%i0
	movge	%xcc,	%g6,	%l0
	srlx	%i7,	0x1A,	%o2
	andncc	%l5,	%l4,	%o3
	udivcc	%l3,	0x0E73,	%g1
	move	%icc,	%o0,	%l1
	st	%f15,	[%l7 + 0x2C]
	udiv	%i4,	0x1FE9,	%i2
	xnorcc	%l6,	%i3,	%o4
	ldd	[%l7 + 0x30],	%o6
	movge	%icc,	%l2,	%o5
	edge32ln	%i5,	%g4,	%i1
	fpsub32	%f20,	%f8,	%f2
	andn	%o6,	%i6,	%g5
	fmul8x16	%f9,	%f16,	%f0
	fmovrslz	%g7,	%f7,	%f16
	array32	%g2,	%g3,	%i0
	addccc	%o1,	0x17E7,	%l0
	alignaddrl	%i7,	%g6,	%l5
	sth	%l4,	[%l7 + 0x70]
	fmovrdlz	%o2,	%f20,	%f8
	fnegs	%f29,	%f17
	sir	0x1DAB
	fpsub32s	%f13,	%f16,	%f3
	fmovse	%xcc,	%f11,	%f19
	fcmped	%fcc0,	%f6,	%f28
	mova	%icc,	%l3,	%g1
	fnot2s	%f15,	%f24
	or	%o3,	%l1,	%i4
	sir	0x0891
	ldsw	[%l7 + 0x44],	%o0
	fmovsl	%xcc,	%f0,	%f6
	edge32l	%l6,	%i2,	%i3
	ldsw	[%l7 + 0x68],	%o7
	save %o4, 0x0E14, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i5,	%g4,	%i1
	array32	%l2,	%i6,	%g5
	movg	%xcc,	%o6,	%g7
	std	%f26,	[%l7 + 0x48]
	sllx	%g3,	%i0,	%o1
	movrgez	%g2,	%l0,	%g6
	array32	%l5,	%i7,	%o2
	fcmpes	%fcc1,	%f15,	%f9
	lduw	[%l7 + 0x58],	%l4
	fmovsg	%icc,	%f0,	%f16
	std	%f0,	[%l7 + 0x58]
	ld	[%l7 + 0x44],	%f29
	edge32n	%g1,	%o3,	%l1
	fcmple32	%f0,	%f20,	%l3
	subc	%i4,	%o0,	%i2
	fmovda	%xcc,	%f2,	%f20
	sra	%l6,	%i3,	%o7
	st	%f16,	[%l7 + 0x6C]
	movvs	%icc,	%o4,	%i5
	lduw	[%l7 + 0x40],	%g4
	sra	%o5,	%i1,	%l2
	sethi	0x0CD8,	%i6
	orn	%o6,	0x08F4,	%g7
	edge32	%g5,	%g3,	%i0
	ldd	[%l7 + 0x10],	%o0
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%l0
	fmovrsgz	%g2,	%f21,	%f0
	fmovdgu	%icc,	%f19,	%f9
	smul	%g6,	%l5,	%i7
	edge8ln	%o2,	%l4,	%g1
	fsrc2	%f2,	%f12
	movne	%xcc,	%o3,	%l1
	ld	[%l7 + 0x68],	%f29
	smulcc	%i4,	0x06A9,	%l3
	ldsw	[%l7 + 0x58],	%i2
	umulcc	%l6,	0x0B62,	%o0
	edge16	%o7,	%i3,	%o4
	edge32	%g4,	%i5,	%i1
	fpadd16	%f22,	%f26,	%f4
	fpadd32s	%f12,	%f27,	%f29
	fandnot1s	%f21,	%f20,	%f17
	ldsb	[%l7 + 0x5A],	%l2
	addccc	%i6,	0x0596,	%o5
	udivx	%o6,	0x01BE,	%g5
	fmovspos	%icc,	%f30,	%f5
	popc	0x001A,	%g3
	movcc	%xcc,	%g7,	%o1
	lduw	[%l7 + 0x60],	%l0
	mulscc	%g2,	0x1986,	%i0
	movge	%icc,	%g6,	%l5
	movge	%xcc,	%o2,	%l4
	fmovsvc	%xcc,	%f12,	%f19
	sir	0x04BD
	edge32l	%i7,	%o3,	%l1
	movpos	%icc,	%g1,	%i4
	array8	%i2,	%l3,	%o0
	movg	%icc,	%o7,	%l6
	fpmerge	%f31,	%f9,	%f14
	sdivx	%i3,	0x14E0,	%o4
	subccc	%g4,	%i5,	%l2
	move	%icc,	%i6,	%o5
	alignaddr	%i1,	%o6,	%g3
	edge8n	%g7,	%g5,	%l0
	edge32n	%o1,	%g2,	%i0
	move	%xcc,	%l5,	%o2
	fnot2s	%f17,	%f14
	fxnors	%f9,	%f17,	%f31
	movvs	%xcc,	%l4,	%g6
	array32	%i7,	%o3,	%l1
	ldub	[%l7 + 0x4F],	%i4
	smulcc	%i2,	%l3,	%o0
	subc	%g1,	%o7,	%l6
	addcc	%o4,	%i3,	%i5
	fmuld8sux16	%f19,	%f18,	%f8
	ldd	[%l7 + 0x30],	%g4
	movrne	%i6,	%o5,	%i1
	fzero	%f18
	sllx	%l2,	0x01,	%g3
	movvs	%icc,	%g7,	%o6
	fmuld8ulx16	%f9,	%f5,	%f14
	movrgz	%l0,	0x186,	%o1
	srlx	%g2,	0x1C,	%i0
	movvs	%icc,	%g5,	%o2
	fmuld8ulx16	%f15,	%f31,	%f10
	edge16ln	%l4,	%l5,	%i7
	ldd	[%l7 + 0x70],	%o2
	fxor	%f26,	%f28,	%f18
	udiv	%l1,	0x0BE9,	%i4
	ldx	[%l7 + 0x08],	%i2
	fmovspos	%icc,	%f5,	%f19
	fand	%f14,	%f22,	%f26
	stx	%g6,	[%l7 + 0x18]
	fcmped	%fcc1,	%f22,	%f6
	fpsub16s	%f15,	%f27,	%f6
	movrgz	%l3,	%o0,	%g1
	edge16l	%o7,	%l6,	%i3
	mulx	%i5,	0x1068,	%g4
	fnands	%f23,	%f14,	%f8
	stw	%i6,	[%l7 + 0x28]
	fmovdn	%xcc,	%f12,	%f13
	xnorcc	%o5,	0x10AA,	%i1
	stb	%o4,	[%l7 + 0x4E]
	udiv	%l2,	0x0E4B,	%g7
	edge16ln	%g3,	%l0,	%o1
	st	%f30,	[%l7 + 0x6C]
	stb	%g2,	[%l7 + 0x51]
	std	%f30,	[%l7 + 0x48]
	fcmps	%fcc3,	%f8,	%f26
	addcc	%i0,	0x1649,	%g5
	movvc	%icc,	%o6,	%l4
	fcmpes	%fcc2,	%f25,	%f9
	fornot2s	%f1,	%f30,	%f2
	udivx	%l5,	0x0380,	%o2
	ldsw	[%l7 + 0x60],	%i7
	fcmpeq16	%f24,	%f24,	%l1
	ldub	[%l7 + 0x29],	%o3
	edge16n	%i4,	%g6,	%i2
	edge16	%o0,	%l3,	%g1
	lduw	[%l7 + 0x20],	%l6
	add	%o7,	0x061C,	%i3
	stb	%g4,	[%l7 + 0x26]
	umulcc	%i6,	0x0434,	%i5
	fmovs	%f17,	%f27
	edge8n	%o5,	%o4,	%i1
	movrlz	%l2,	%g7,	%l0
	fxor	%f24,	%f6,	%f8
	smul	%o1,	%g3,	%i0
	restore %g5, 0x00D9, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l4,	%l5,	%o6
	xor	%o2,	0x1E07,	%l1
	movvs	%xcc,	%o3,	%i7
	srl	%g6,	%i2,	%o0
	popc	0x1076,	%i4
	sra	%g1,	%l3,	%l6
	movcs	%xcc,	%o7,	%g4
	mulscc	%i3,	0x16DC,	%i5
	fnegd	%f28,	%f30
	fpack16	%f14,	%f12
	add	%o5,	%i6,	%o4
	sdiv	%i1,	0x03D6,	%g7
	fornot1s	%f22,	%f8,	%f7
	fcmpd	%fcc3,	%f4,	%f26
	fmul8x16	%f7,	%f6,	%f16
	udivx	%l0,	0x0878,	%l2
	orn	%g3,	0x1EB7,	%i0
	or	%o1,	0x0CCF,	%g2
	xnor	%l4,	0x06EA,	%l5
	edge32	%o6,	%g5,	%l1
	movrgez	%o3,	%i7,	%o2
	sdivcc	%i2,	0x1360,	%g6
	edge32n	%i4,	%o0,	%g1
	smulcc	%l3,	%l6,	%o7
	fnegs	%f0,	%f1
	movcc	%icc,	%i3,	%i5
	fmovscs	%icc,	%f25,	%f29
	sra	%o5,	%g4,	%o4
	alignaddr	%i6,	%g7,	%i1
	movrne	%l2,	%l0,	%i0
	fnor	%f22,	%f20,	%f2
	ldd	[%l7 + 0x58],	%g2
	fmul8x16au	%f18,	%f5,	%f10
	edge8n	%o1,	%g2,	%l4
	smul	%o6,	0x0239,	%g5
	edge16l	%l1,	%o3,	%l5
	movrlez	%i7,	%o2,	%g6
	edge8n	%i4,	%o0,	%g1
	fxnors	%f27,	%f31,	%f7
	fpadd32s	%f3,	%f10,	%f1
	movg	%xcc,	%l3,	%l6
	edge8l	%o7,	%i2,	%i3
	st	%f13,	[%l7 + 0x24]
	fpmerge	%f14,	%f1,	%f18
	sllx	%i5,	%o5,	%o4
	fpmerge	%f2,	%f14,	%f28
	movvc	%xcc,	%i6,	%g4
	edge16n	%g7,	%l2,	%l0
	sdivcc	%i0,	0x1584,	%g3
	srax	%o1,	%g2,	%l4
	sir	0x1CD2
	sdiv	%o6,	0x1F7B,	%g5
	sth	%i1,	[%l7 + 0x1E]
	sdivcc	%l1,	0x0CF4,	%o3
	movge	%xcc,	%i7,	%l5
	std	%f30,	[%l7 + 0x28]
	orn	%g6,	0x0467,	%i4
	udiv	%o0,	0x0700,	%o2
	orcc	%g1,	%l3,	%l6
	srl	%o7,	%i2,	%i5
	fpsub16s	%f12,	%f9,	%f9
	xnorcc	%i3,	%o5,	%o4
	movrlez	%g4,	0x229,	%g7
	ldsw	[%l7 + 0x3C],	%l2
	edge32ln	%l0,	%i6,	%i0
	movrlez	%g3,	%o1,	%g2
	stx	%o6,	[%l7 + 0x38]
	fmovsn	%xcc,	%f1,	%f7
	and	%g5,	0x13FF,	%i1
	fmovsg	%xcc,	%f31,	%f24
	ldx	[%l7 + 0x30],	%l4
	mulscc	%l1,	0x01EA,	%o3
	fabsd	%f26,	%f0
	fpadd32	%f4,	%f16,	%f16
	ldx	[%l7 + 0x60],	%i7
	fpack32	%f28,	%f20,	%f22
	fpadd16s	%f20,	%f28,	%f19
	fnegd	%f8,	%f28
	fmovsle	%xcc,	%f4,	%f10
	edge16l	%l5,	%g6,	%i4
	movge	%xcc,	%o0,	%o2
	lduh	[%l7 + 0x36],	%l3
	srax	%g1,	%l6,	%i2
	udiv	%i5,	0x160B,	%i3
	edge32n	%o5,	%o4,	%g4
	sir	0x017D
	movcs	%icc,	%o7,	%g7
	addccc	%l2,	%i6,	%l0
	sra	%g3,	%o1,	%i0
	edge16ln	%o6,	%g5,	%g2
	fmovrdne	%l4,	%f12,	%f2
	movg	%icc,	%l1,	%i1
	edge16	%i7,	%o3,	%g6
	movgu	%xcc,	%i4,	%l5
	add	%o2,	%l3,	%g1
	fmovrslez	%l6,	%f10,	%f26
	stx	%i2,	[%l7 + 0x40]
	fpsub16s	%f12,	%f16,	%f17
	xnor	%o0,	0x0699,	%i3
	fsrc1	%f24,	%f12
	sdivx	%o5,	0x002A,	%i5
	edge32n	%o4,	%g4,	%o7
	movpos	%xcc,	%g7,	%l2
	fand	%f6,	%f14,	%f12
	stb	%i6,	[%l7 + 0x10]
	subccc	%g3,	%o1,	%i0
	andncc	%o6,	%l0,	%g5
	fands	%f6,	%f5,	%f2
	movre	%g2,	%l1,	%i1
	sth	%i7,	[%l7 + 0x50]
	fmul8x16al	%f28,	%f23,	%f8
	st	%f17,	[%l7 + 0x08]
	fmovsa	%xcc,	%f12,	%f12
	fmovrse	%l4,	%f22,	%f16
	fmul8x16al	%f12,	%f30,	%f22
	ldsh	[%l7 + 0x64],	%o3
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%f2
	nop
	set	0x0E, %g1
	ldsh	[%l7 + %g1],	%g6
	sth	%l5,	[%l7 + 0x0C]
	mulx	%o2,	%l3,	%i4
	xnor	%l6,	0x0C7B,	%i2
	andncc	%g1,	%i3,	%o5
	fmovdcs	%icc,	%f5,	%f22
	fornot2	%f22,	%f2,	%f30
	alignaddrl	%i5,	%o4,	%g4
	fpackfix	%f0,	%f15
	movn	%xcc,	%o7,	%g7
	srl	%l2,	%i6,	%g3
	fmovsl	%xcc,	%f26,	%f23
	fpack32	%f4,	%f16,	%f12
	fmovsne	%icc,	%f9,	%f16
	fabsd	%f6,	%f10
	smul	%o0,	0x0A4E,	%o1
	alignaddr	%o6,	%i0,	%l0
	ldsb	[%l7 + 0x5C],	%g5
	edge8l	%l1,	%g2,	%i1
	srl	%l4,	0x18,	%i7
	andn	%g6,	0x001B,	%o3
	edge16l	%l5,	%o2,	%i4
	fnot2s	%f26,	%f20
	add	%l6,	0x06AD,	%i2
	fcmpes	%fcc3,	%f5,	%f15
	movcs	%icc,	%g1,	%i3
	xorcc	%l3,	0x0203,	%i5
	alignaddrl	%o5,	%g4,	%o7
	udiv	%g7,	0x0AA1,	%l2
	smulcc	%i6,	0x14C0,	%o4
	ldd	[%l7 + 0x78],	%f0
	movrlez	%o0,	0x3CD,	%o1
	edge16	%o6,	%i0,	%l0
	xorcc	%g5,	%g3,	%l1
	fmovrde	%g2,	%f18,	%f8
	movleu	%xcc,	%l4,	%i1
	sethi	0x1598,	%i7
	array16	%o3,	%l5,	%g6
	edge32l	%o2,	%l6,	%i2
	movre	%g1,	0x2D2,	%i3
	nop
	set	0x38, %i7
	lduw	[%l7 + %i7],	%l3
	andcc	%i4,	0x1F25,	%o5
	addcc	%i5,	0x1F9A,	%o7
	orcc	%g7,	%g4,	%i6
	subccc	%l2,	0x157A,	%o4
	fmovdge	%icc,	%f28,	%f7
	alignaddrl	%o1,	%o6,	%o0
	for	%f26,	%f4,	%f12
	movre	%l0,	0x350,	%g5
	sir	0x0F96
	edge32n	%i0,	%g3,	%g2
	xnor	%l4,	%l1,	%i7
	fsrc1	%f8,	%f30
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	fnands	%f21,	%f25,	%f30
	edge16l	%o2,	%l6,	%g6
	fmovsn	%xcc,	%f17,	%f28
	smul	%g1,	0x1863,	%i3
	fmovdn	%icc,	%f18,	%f30
	alignaddr	%l3,	%i4,	%o5
	smulcc	%i2,	%i5,	%g7
	sub	%g4,	0x1FAC,	%o7
	fmovd	%f16,	%f6
	mulscc	%l2,	0x1AC9,	%o4
	sdivx	%i6,	0x064D,	%o1
	fpadd16	%f6,	%f30,	%f0
	udivx	%o0,	0x04EF,	%l0
	umulcc	%o6,	0x1EDB,	%i0
	orncc	%g5,	%g3,	%l4
	movrgz	%l1,	%g2,	%o3
	sdivx	%i1,	0x0527,	%i7
	std	%f30,	[%l7 + 0x40]
	smul	%o2,	%l6,	%g6
	and	%g1,	0x11D6,	%i3
	sdiv	%l5,	0x1AE7,	%l3
	fxor	%f24,	%f6,	%f2
	sir	0x142E
	edge32ln	%o5,	%i4,	%i5
	edge32	%g7,	%g4,	%o7
	xnorcc	%i2,	%l2,	%o4
	save %i6, 0x1ADD, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l0,	%o1,	%i0
	udiv	%g5,	0x0489,	%o6
	fornot2	%f6,	%f14,	%f18
	fmovrde	%l4,	%f12,	%f28
	edge32l	%l1,	%g3,	%o3
	mulx	%g2,	0x0E13,	%i7
	xorcc	%o2,	%i1,	%l6
	sir	0x1E4D
	movge	%icc,	%g1,	%i3
	edge32l	%l5,	%l3,	%o5
	movg	%xcc,	%g6,	%i5
	fabss	%f26,	%f3
	udivcc	%g7,	0x0627,	%g4
	mulx	%o7,	0x0E08,	%i2
	ldd	[%l7 + 0x30],	%f4
	movrne	%i4,	0x2C7,	%o4
	movrne	%l2,	%o0,	%l0
	edge8n	%i6,	%o1,	%i0
	alignaddrl	%o6,	%g5,	%l1
	stw	%l4,	[%l7 + 0x2C]
	umul	%o3,	0x1AB1,	%g3
	fmovrde	%i7,	%f12,	%f26
	umulcc	%o2,	%g2,	%l6
	popc	0x00BA,	%g1
	andn	%i1,	%i3,	%l5
	sth	%o5,	[%l7 + 0x4A]
	sth	%l3,	[%l7 + 0x0A]
	ldsb	[%l7 + 0x45],	%i5
	add	%g6,	%g7,	%g4
	sethi	0x1FDA,	%i2
	movrgz	%o7,	0x3D5,	%i4
	movvc	%xcc,	%l2,	%o0
	sra	%o4,	0x1B,	%l0
	ldub	[%l7 + 0x3F],	%o1
	udiv	%i0,	0x1948,	%i6
	xorcc	%g5,	0x1446,	%o6
	sll	%l1,	0x09,	%l4
	lduh	[%l7 + 0x64],	%g3
	ldd	[%l7 + 0x70],	%o2
	fand	%f2,	%f22,	%f18
	fxnors	%f11,	%f20,	%f8
	edge8ln	%o2,	%g2,	%l6
	fcmpne16	%f22,	%f8,	%g1
	st	%f26,	[%l7 + 0x60]
	edge16ln	%i1,	%i7,	%l5
	sethi	0x166B,	%o5
	edge8	%i3,	%l3,	%g6
	srlx	%i5,	0x0D,	%g7
	fmovsleu	%icc,	%f22,	%f23
	nop
	set	0x0F, %l5
	stb	%g4,	[%l7 + %l5]
	fpack16	%f30,	%f1
	edge16ln	%i2,	%o7,	%i4
	fmuld8ulx16	%f16,	%f30,	%f24
	edge16n	%l2,	%o4,	%l0
	fmuld8ulx16	%f9,	%f0,	%f16
	fones	%f14
	sdiv	%o1,	0x143D,	%o0
	fsrc1	%f30,	%f18
	movcc	%icc,	%i0,	%i6
	sethi	0x03D2,	%g5
	orcc	%l1,	%o6,	%l4
	edge16n	%o3,	%g3,	%g2
	lduw	[%l7 + 0x34],	%o2
	fmovdne	%icc,	%f3,	%f30
	alignaddr	%g1,	%i1,	%l6
	move	%xcc,	%i7,	%o5
	fmovrslez	%l5,	%f18,	%f21
	srax	%i3,	%g6,	%i5
	lduh	[%l7 + 0x68],	%g7
	stx	%l3,	[%l7 + 0x20]
	mova	%icc,	%i2,	%g4
	ld	[%l7 + 0x24],	%f12
	edge16l	%o7,	%l2,	%i4
	and	%l0,	%o4,	%o0
	fmovsvs	%xcc,	%f8,	%f10
	movpos	%xcc,	%o1,	%i6
	stw	%i0,	[%l7 + 0x4C]
	restore %g5, 0x11EC, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x0C],	%l4
	edge16ln	%o6,	%o3,	%g2
	movrne	%g3,	%g1,	%o2
	subcc	%l6,	%i1,	%i7
	movrlez	%o5,	%l5,	%g6
	fmovdvc	%xcc,	%f25,	%f10
	subc	%i5,	0x0490,	%g7
	and	%l3,	0x1C2F,	%i3
	xnorcc	%g4,	%o7,	%l2
	movrlez	%i4,	%i2,	%l0
	movgu	%xcc,	%o4,	%o1
	sllx	%i6,	%i0,	%o0
	xnorcc	%g5,	%l4,	%o6
	sth	%o3,	[%l7 + 0x20]
	movre	%g2,	0x133,	%g3
	ldd	[%l7 + 0x30],	%l0
	xorcc	%g1,	%l6,	%i1
	for	%f4,	%f18,	%f24
	move	%icc,	%o2,	%i7
	udivx	%o5,	0x0E34,	%g6
	add	%l5,	0x1766,	%i5
	udivcc	%l3,	0x1EE8,	%g7
	subcc	%i3,	%g4,	%o7
	ldsh	[%l7 + 0x46],	%i4
	udivcc	%l2,	0x1F94,	%l0
	fmovsl	%xcc,	%f10,	%f19
	movl	%xcc,	%o4,	%i2
	ldsw	[%l7 + 0x58],	%i6
	addc	%i0,	0x1B74,	%o0
	st	%f31,	[%l7 + 0x78]
	edge16l	%g5,	%l4,	%o6
	add	%o3,	0x0B7F,	%g2
	movrgz	%g3,	0x156,	%l1
	fmul8x16au	%f31,	%f10,	%f14
	edge8ln	%o1,	%g1,	%l6
	sdiv	%i1,	0x0062,	%i7
	sth	%o2,	[%l7 + 0x62]
	smulcc	%o5,	%g6,	%l5
	fnot2	%f2,	%f12
	movle	%icc,	%i5,	%g7
	orcc	%l3,	%g4,	%o7
	udivcc	%i4,	0x0BA6,	%i3
	sdivcc	%l0,	0x1070,	%o4
	fmovrsgz	%l2,	%f29,	%f30
	fzeros	%f31
	movne	%xcc,	%i6,	%i0
	ldsh	[%l7 + 0x74],	%o0
	smul	%i2,	%g5,	%o6
	sdivx	%o3,	0x0B6B,	%l4
	sethi	0x0D60,	%g3
	fmovdvs	%xcc,	%f27,	%f9
	ldub	[%l7 + 0x4F],	%g2
	sethi	0x1C3D,	%o1
	fmovsl	%xcc,	%f22,	%f3
	fmovrsne	%l1,	%f29,	%f18
	movrgz	%g1,	%l6,	%i7
	fmovsl	%xcc,	%f20,	%f7
	edge16l	%i1,	%o5,	%g6
	ldd	[%l7 + 0x70],	%l4
	ldsw	[%l7 + 0x4C],	%i5
	movrgz	%g7,	0x084,	%o2
	sdiv	%l3,	0x03BA,	%o7
	movre	%g4,	%i4,	%i3
	edge32ln	%o4,	%l0,	%i6
	fpsub32s	%f28,	%f27,	%f16
	movl	%icc,	%l2,	%i0
	array8	%i2,	%g5,	%o0
	fones	%f8
	or	%o3,	0x12BD,	%l4
	pdist	%f8,	%f24,	%f22
	fmul8x16au	%f14,	%f7,	%f10
	fmovsg	%xcc,	%f12,	%f20
	ldx	[%l7 + 0x68],	%o6
	addccc	%g3,	0x14E1,	%o1
	movge	%icc,	%l1,	%g1
	movre	%l6,	%g2,	%i7
	ldub	[%l7 + 0x25],	%o5
	srlx	%g6,	0x14,	%l5
	addccc	%i1,	%g7,	%i5
	edge16n	%l3,	%o7,	%o2
	movcc	%icc,	%i4,	%i3
	edge32l	%o4,	%l0,	%g4
	fmuld8ulx16	%f29,	%f30,	%f30
	sethi	0x1537,	%l2
	fmovrdne	%i6,	%f22,	%f22
	movl	%icc,	%i0,	%i2
	std	%f18,	[%l7 + 0x20]
	edge32n	%o0,	%g5,	%o3
	movpos	%xcc,	%o6,	%l4
	sdiv	%o1,	0x1BBE,	%g3
	umul	%g1,	%l1,	%g2
	fmovsleu	%icc,	%f31,	%f7
	nop
	set	0x4C, %i0
	lduw	[%l7 + %i0],	%i7
	movvc	%xcc,	%o5,	%l6
	orn	%g6,	0x107A,	%i1
	fornot1s	%f24,	%f25,	%f9
	ldd	[%l7 + 0x28],	%f8
	std	%f2,	[%l7 + 0x48]
	fmovdcs	%icc,	%f19,	%f16
	movleu	%xcc,	%l5,	%g7
	fmovsvs	%icc,	%f12,	%f8
	addc	%l3,	%i5,	%o2
	xnor	%o7,	%i4,	%o4
	stx	%l0,	[%l7 + 0x78]
	sir	0x05E7
	fpmerge	%f12,	%f25,	%f18
	fmovdcc	%icc,	%f24,	%f27
	srax	%g4,	%i3,	%i6
	edge32n	%l2,	%i0,	%o0
	edge32ln	%g5,	%o3,	%o6
	ldx	[%l7 + 0x38],	%l4
	edge8l	%i2,	%g3,	%o1
	sra	%g1,	0x01,	%l1
	lduh	[%l7 + 0x1E],	%g2
	lduw	[%l7 + 0x58],	%o5
	umulcc	%i7,	0x1B08,	%g6
	fmovrslez	%l6,	%f11,	%f24
	fors	%f16,	%f31,	%f28
	stb	%i1,	[%l7 + 0x0E]
	popc	%l5,	%l3
	movgu	%icc,	%i5,	%g7
	srax	%o7,	0x04,	%o2
	sll	%o4,	0x07,	%i4
	sllx	%g4,	%i3,	%i6
	fmovrde	%l2,	%f0,	%f8
	movrgez	%l0,	%o0,	%i0
	fnands	%f8,	%f7,	%f28
	subccc	%o3,	%g5,	%o6
	mulscc	%l4,	0x00F6,	%i2
	ldub	[%l7 + 0x0D],	%g3
	fmovdle	%icc,	%f11,	%f7
	fmovdpos	%icc,	%f20,	%f26
	edge32l	%o1,	%g1,	%g2
	orncc	%o5,	%i7,	%l1
	popc	0x15CF,	%l6
	xorcc	%i1,	%g6,	%l5
	stw	%i5,	[%l7 + 0x34]
	fmovsgu	%icc,	%f21,	%f11
	ldx	[%l7 + 0x28],	%g7
	srlx	%l3,	0x01,	%o7
	edge16n	%o2,	%o4,	%g4
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	sethi	0x0AF3,	%l2
	sth	%i4,	[%l7 + 0x48]
	fmuld8sux16	%f29,	%f2,	%f10
	add	%l0,	%o0,	%i0
	stx	%o3,	[%l7 + 0x28]
	xorcc	%o6,	%g5,	%i2
	fmovrslez	%l4,	%f27,	%f4
	srl	%g3,	0x0D,	%g1
	sra	%o1,	0x1C,	%o5
	sll	%i7,	%l1,	%g2
	fandnot1s	%f10,	%f16,	%f28
	fmovdne	%icc,	%f17,	%f20
	fmovscc	%xcc,	%f18,	%f21
	edge8l	%l6,	%i1,	%g6
	stx	%i5,	[%l7 + 0x10]
	edge8n	%g7,	%l5,	%o7
	save %l3, %o4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i3,	%g4,	%l2
	edge32l	%i4,	%i6,	%l0
	sub	%i0,	0x1E42,	%o3
	fnand	%f8,	%f28,	%f12
	edge8	%o0,	%g5,	%o6
	andn	%i2,	0x0AAD,	%l4
	fmovdcs	%icc,	%f16,	%f6
	fone	%f4
	ldd	[%l7 + 0x50],	%f28
	move	%icc,	%g1,	%g3
	restore %o1, %i7, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o5,	%l6,	%g2
	subcc	%i1,	%i5,	%g6
	fornot1	%f8,	%f22,	%f6
	fcmps	%fcc2,	%f11,	%f20
	stw	%g7,	[%l7 + 0x3C]
	edge16ln	%l5,	%l3,	%o4
	ldsb	[%l7 + 0x79],	%o2
	movvc	%xcc,	%o7,	%g4
	movpos	%icc,	%i3,	%l2
	movvc	%xcc,	%i4,	%l0
	fmovdgu	%icc,	%f4,	%f11
	or	%i6,	0x0DDB,	%o3
	fxnors	%f10,	%f10,	%f21
	movne	%xcc,	%o0,	%i0
	ldd	[%l7 + 0x58],	%o6
	edge16ln	%g5,	%i2,	%l4
	orncc	%g1,	0x17A5,	%o1
	movrlez	%g3,	%i7,	%l1
	fmovse	%icc,	%f17,	%f15
	edge16n	%l6,	%g2,	%i1
	edge32	%i5,	%o5,	%g7
	fone	%f0
	ld	[%l7 + 0x10],	%f25
	alignaddrl	%g6,	%l3,	%o4
	fmovsn	%xcc,	%f24,	%f27
	edge16	%o2,	%l5,	%o7
	umulcc	%i3,	%g4,	%i4
	fandnot2s	%f26,	%f31,	%f26
	addc	%l2,	0x0E71,	%i6
	fands	%f11,	%f3,	%f20
	ldsb	[%l7 + 0x3C],	%l0
	orncc	%o0,	0x0788,	%i0
	edge8ln	%o6,	%o3,	%g5
	srlx	%i2,	0x1C,	%g1
	edge32	%l4,	%o1,	%i7
	and	%g3,	%l1,	%l6
	udivx	%g2,	0x1234,	%i1
	fsrc1	%f28,	%f8
	st	%f4,	[%l7 + 0x3C]
	edge16ln	%o5,	%i5,	%g6
	sdivx	%g7,	0x0314,	%o4
	subccc	%l3,	%l5,	%o2
	lduw	[%l7 + 0x54],	%o7
	orcc	%i3,	%i4,	%g4
	fcmpes	%fcc2,	%f22,	%f23
	movcs	%xcc,	%l2,	%i6
	movrgez	%l0,	%i0,	%o0
	umul	%o3,	0x0D90,	%g5
	orn	%o6,	%g1,	%i2
	ldd	[%l7 + 0x18],	%f16
	movcc	%icc,	%l4,	%i7
	stw	%o1,	[%l7 + 0x1C]
	fcmple16	%f30,	%f20,	%g3
	orncc	%l6,	%l1,	%i1
	fmovda	%icc,	%f31,	%f26
	movcc	%icc,	%g2,	%o5
	mulx	%i5,	0x0EC9,	%g7
	subcc	%g6,	%l3,	%o4
	sth	%o2,	[%l7 + 0x5E]
	edge8n	%l5,	%o7,	%i3
	movvc	%xcc,	%i4,	%l2
	movre	%g4,	%i6,	%i0
	fxnor	%f16,	%f18,	%f12
	stb	%o0,	[%l7 + 0x6B]
	sdivcc	%l0,	0x1C98,	%o3
	array8	%o6,	%g1,	%i2
	mova	%icc,	%l4,	%g5
	movg	%xcc,	%i7,	%g3
	xnorcc	%o1,	0x1439,	%l1
	smulcc	%l6,	%g2,	%o5
	movneg	%icc,	%i1,	%g7
	edge16n	%i5,	%g6,	%l3
	movvc	%icc,	%o4,	%o2
	fsrc1	%f6,	%f24
	xnorcc	%l5,	%i3,	%i4
	addccc	%l2,	%g4,	%i6
	edge32	%i0,	%o7,	%o0
	xnor	%l0,	0x1AB4,	%o3
	fornot2s	%f9,	%f15,	%f18
	mulscc	%g1,	0x041C,	%o6
	movcc	%xcc,	%l4,	%i2
	fpadd32s	%f19,	%f31,	%f18
	fpsub16	%f26,	%f16,	%f4
	fandnot1s	%f24,	%f17,	%f29
	movrgz	%g5,	0x26A,	%g3
	fcmpne32	%f24,	%f16,	%o1
	movgu	%xcc,	%i7,	%l1
	fornot2	%f14,	%f12,	%f4
	add	%l6,	0x0A32,	%g2
	srlx	%o5,	0x14,	%i1
	fmovsgu	%xcc,	%f28,	%f16
	sub	%g7,	%i5,	%l3
	fmovrslz	%g6,	%f11,	%f12
	stw	%o4,	[%l7 + 0x24]
	edge8ln	%o2,	%l5,	%i4
	alignaddrl	%i3,	%l2,	%g4
	add	%i0,	%o7,	%i6
	xnor	%o0,	%l0,	%g1
	orn	%o6,	%o3,	%l4
	srax	%g5,	%i2,	%o1
	fmovdl	%icc,	%f24,	%f11
	ldsb	[%l7 + 0x33],	%g3
	array32	%i7,	%l6,	%g2
	stx	%o5,	[%l7 + 0x10]
	umulcc	%i1,	0x143E,	%l1
	edge32n	%i5,	%l3,	%g7
	lduh	[%l7 + 0x46],	%g6
	fmovdvs	%icc,	%f22,	%f17
	movge	%xcc,	%o2,	%l5
	sllx	%o4,	0x10,	%i4
	ldsh	[%l7 + 0x22],	%l2
	fmovsvc	%xcc,	%f18,	%f29
	movpos	%icc,	%i3,	%g4
	array16	%o7,	%i0,	%o0
	array8	%l0,	%g1,	%i6
	array8	%o6,	%o3,	%g5
	fmovrdgz	%i2,	%f6,	%f26
	udivcc	%l4,	0x0916,	%g3
	fones	%f17
	umul	%i7,	0x0595,	%l6
	ldub	[%l7 + 0x2D],	%o1
	save %g2, %i1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i5,	%l3
	xnor	%g7,	%o5,	%g6
	xnor	%o2,	0x0BDE,	%l5
	umulcc	%o4,	%l2,	%i4
	fmovsg	%icc,	%f9,	%f1
	fnor	%f24,	%f28,	%f0
	fabsd	%f12,	%f10
	andcc	%i3,	%o7,	%g4
	edge8n	%i0,	%l0,	%o0
	lduw	[%l7 + 0x7C],	%g1
	udivcc	%i6,	0x0C70,	%o3
	fmovrde	%g5,	%f10,	%f24
	movge	%xcc,	%o6,	%i2
	ldx	[%l7 + 0x60],	%g3
	sethi	0x03BC,	%i7
	sra	%l6,	%o1,	%l4
	fmovdgu	%xcc,	%f19,	%f15
	array32	%g2,	%i1,	%i5
	sra	%l3,	%g7,	%l1
	movg	%xcc,	%g6,	%o2
	ldsw	[%l7 + 0x20],	%l5
	fmovsneg	%icc,	%f29,	%f7
	edge8l	%o4,	%l2,	%i4
	fcmpgt16	%f6,	%f0,	%o5
	array8	%i3,	%o7,	%i0
	movrgz	%l0,	%g4,	%g1
	fand	%f28,	%f22,	%f24
	orn	%i6,	0x01C7,	%o3
	edge16n	%g5,	%o6,	%i2
	edge8	%o0,	%i7,	%l6
	umulcc	%o1,	0x13A2,	%g3
	fmovse	%xcc,	%f19,	%f30
	movrgez	%l4,	%g2,	%i1
	add	%i5,	%g7,	%l3
	fcmpgt32	%f4,	%f12,	%g6
	fsrc1	%f26,	%f28
	fpack16	%f2,	%f10
	sth	%l1,	[%l7 + 0x6A]
	ldsw	[%l7 + 0x1C],	%l5
	lduh	[%l7 + 0x1C],	%o2
	array32	%o4,	%i4,	%l2
	srlx	%o5,	%i3,	%o7
	edge8ln	%l0,	%g4,	%i0
	ldd	[%l7 + 0x68],	%g0
	addc	%o3,	%i6,	%o6
	sdiv	%g5,	0x14E5,	%o0
	sdiv	%i2,	0x1E9D,	%i7
	fpack32	%f12,	%f18,	%f6
	fmovd	%f4,	%f24
	fmovdneg	%icc,	%f20,	%f5
	fmovscc	%icc,	%f4,	%f28
	std	%f20,	[%l7 + 0x08]
	edge8l	%o1,	%l6,	%l4
	or	%g2,	%i1,	%g3
	movre	%i5,	0x37E,	%g7
	mulx	%g6,	0x06CB,	%l1
	sdivcc	%l3,	0x0504,	%l5
	movrne	%o2,	0x1E9,	%o4
	mova	%xcc,	%i4,	%o5
	xnorcc	%l2,	0x0576,	%o7
	fxor	%f12,	%f12,	%f20
	movne	%icc,	%l0,	%i3
	array32	%g4,	%i0,	%o3
	movge	%icc,	%g1,	%i6
	srl	%g5,	0x14,	%o0
	edge16l	%i2,	%o6,	%i7
	movpos	%xcc,	%l6,	%o1
	umulcc	%g2,	0x061C,	%i1
	movle	%icc,	%g3,	%l4
	movleu	%xcc,	%i5,	%g7
	fmovscs	%icc,	%f19,	%f18
	fsrc1s	%f16,	%f9
	fmovdneg	%xcc,	%f4,	%f13
	sdivx	%l1,	0x00DF,	%g6
	sethi	0x0017,	%l3
	addc	%o2,	%o4,	%l5
	orncc	%i4,	%l2,	%o5
	movrgz	%l0,	0x335,	%o7
	movle	%icc,	%g4,	%i3
	fmovdgu	%xcc,	%f24,	%f24
	std	%f6,	[%l7 + 0x40]
	and	%o3,	0x10DD,	%i0
	andncc	%g1,	%g5,	%o0
	fcmped	%fcc2,	%f16,	%f12
	ldsh	[%l7 + 0x7C],	%i2
	edge32ln	%o6,	%i6,	%i7
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%f2
	fsrc2s	%f23,	%f29
	sub	%o1,	0x1249,	%g2
	orcc	%i1,	%g3,	%l6
	movn	%xcc,	%l4,	%i5
	fmovdcs	%icc,	%f11,	%f25
	srax	%l1,	%g6,	%l3
	udiv	%o2,	0x15CC,	%o4
	fpack16	%f4,	%f16
	movne	%xcc,	%l5,	%g7
	fmovdn	%icc,	%f0,	%f8
	subc	%l2,	%o5,	%i4
	orncc	%l0,	%g4,	%o7
	lduh	[%l7 + 0x4A],	%o3
	fmovdvs	%xcc,	%f6,	%f12
	sllx	%i3,	%g1,	%i0
	ldd	[%l7 + 0x60],	%g4
	xnor	%o0,	%o6,	%i2
	movcs	%xcc,	%i6,	%i7
	lduh	[%l7 + 0x32],	%o1
	sir	0x0003
	movne	%icc,	%g2,	%i1
	edge16n	%g3,	%l4,	%l6
	sllx	%l1,	%g6,	%i5
	edge8	%o2,	%o4,	%l3
	array8	%l5,	%g7,	%l2
	sdivcc	%i4,	0x1390,	%o5
	ldd	[%l7 + 0x28],	%f16
	umul	%l0,	0x0043,	%o7
	fmovsg	%xcc,	%f21,	%f31
	udiv	%g4,	0x13AE,	%o3
	fandnot2	%f0,	%f20,	%f28
	edge32ln	%i3,	%i0,	%g5
	popc	0x17C9,	%o0
	sdivcc	%o6,	0x1773,	%g1
	edge32l	%i6,	%i7,	%i2
	fmovdn	%icc,	%f14,	%f15
	movg	%xcc,	%g2,	%i1
	movgu	%icc,	%g3,	%o1
	st	%f5,	[%l7 + 0x60]
	fmovscc	%xcc,	%f24,	%f31
	movge	%icc,	%l4,	%l1
	xor	%g6,	%i5,	%o2
	udiv	%l6,	0x0D85,	%l3
	movrne	%l5,	%o4,	%l2
	subcc	%g7,	0x1F88,	%o5
	alignaddr	%l0,	%o7,	%i4
	addc	%g4,	0x0257,	%o3
	sir	0x0FD4
	fcmple16	%f24,	%f12,	%i0
	fnand	%f24,	%f2,	%f2
	movleu	%xcc,	%g5,	%o0
	move	%icc,	%o6,	%i3
	edge8ln	%g1,	%i7,	%i2
	movrgz	%g2,	0x284,	%i6
	alignaddr	%g3,	%o1,	%i1
	edge8n	%l4,	%l1,	%i5
	sth	%o2,	[%l7 + 0x0E]
	popc	0x1CE7,	%l6
	movcc	%xcc,	%l3,	%g6
	stb	%o4,	[%l7 + 0x41]
	movcs	%xcc,	%l5,	%g7
	udiv	%o5,	0x1EDE,	%l2
	umulcc	%o7,	0x121E,	%l0
	movpos	%xcc,	%g4,	%o3
	movleu	%icc,	%i4,	%g5
	alignaddrl	%i0,	%o0,	%o6
	fmovrse	%i3,	%f0,	%f7
	or	%i7,	0x0D68,	%g1
	stb	%g2,	[%l7 + 0x0B]
	fzeros	%f26
	fpadd32s	%f30,	%f12,	%f10
	movge	%icc,	%i6,	%g3
	movcc	%xcc,	%i2,	%i1
	smul	%l4,	%o1,	%l1
	movgu	%xcc,	%i5,	%o2
	movneg	%xcc,	%l3,	%g6
	movcc	%icc,	%o4,	%l6
	fmovrdne	%g7,	%f16,	%f6
	fmovrdgz	%o5,	%f20,	%f16
	fmovdg	%icc,	%f22,	%f25
	sub	%l2,	0x1483,	%o7
	or	%l5,	0x1845,	%l0
	ld	[%l7 + 0x24],	%f29
	ldub	[%l7 + 0x64],	%o3
	movrlez	%g4,	0x3AB,	%g5
	edge32n	%i4,	%i0,	%o6
	fxor	%f14,	%f22,	%f14
	movcc	%icc,	%o0,	%i3
	fcmps	%fcc0,	%f30,	%f17
	fmovsvs	%xcc,	%f4,	%f29
	subc	%g1,	%i7,	%i6
	edge16n	%g2,	%g3,	%i2
	addcc	%l4,	0x0911,	%o1
	movre	%i1,	%l1,	%o2
	movrlz	%l3,	0x323,	%g6
	fornot1s	%f16,	%f11,	%f10
	edge16ln	%i5,	%o4,	%g7
	fmovscs	%xcc,	%f3,	%f15
	fmovrslez	%o5,	%f28,	%f14
	subcc	%l6,	0x0AAC,	%l2
	sir	0x147B
	movgu	%xcc,	%o7,	%l5
	ldd	[%l7 + 0x78],	%f8
	movcc	%icc,	%l0,	%g4
	subcc	%o3,	%g5,	%i0
	faligndata	%f6,	%f4,	%f30
	umul	%o6,	%i4,	%i3
	faligndata	%f2,	%f14,	%f10
	fand	%f8,	%f26,	%f28
	sub	%o0,	%i7,	%i6
	fornot1	%f30,	%f16,	%f24
	sub	%g2,	%g3,	%g1
	sdivcc	%i2,	0x0396,	%o1
	udivx	%l4,	0x1F0E,	%l1
	movrne	%o2,	0x30B,	%i1
	orncc	%g6,	%l3,	%i5
	edge16n	%o4,	%g7,	%o5
	fmovsg	%icc,	%f25,	%f19
	array32	%l6,	%l2,	%l5
	or	%l0,	%g4,	%o7
	and	%o3,	%i0,	%o6
	xor	%i4,	%i3,	%g5
	fnot2	%f12,	%f30
	movleu	%xcc,	%i7,	%i6
	movrgez	%g2,	%o0,	%g3
	fnot1	%f10,	%f28
	fsrc1s	%f15,	%f18
	movge	%xcc,	%i2,	%g1
	stb	%l4,	[%l7 + 0x17]
	fmul8ulx16	%f2,	%f0,	%f20
	andn	%o1,	0x1651,	%o2
	edge32	%l1,	%i1,	%g6
	sdiv	%l3,	0x0F33,	%i5
	ldsb	[%l7 + 0x43],	%o4
	ldsw	[%l7 + 0x08],	%g7
	stb	%l6,	[%l7 + 0x79]
	smul	%o5,	0x1102,	%l5
	fandnot2s	%f11,	%f2,	%f17
	udiv	%l2,	0x1834,	%g4
	sir	0x18C3
	fnot2	%f0,	%f28
	movle	%icc,	%o7,	%o3
	edge8n	%i0,	%o6,	%l0
	addccc	%i4,	0x1CBD,	%i3
	array32	%g5,	%i6,	%g2
	fnegs	%f2,	%f9
	addcc	%o0,	%g3,	%i7
	udivcc	%i2,	0x1C45,	%l4
	stb	%o1,	[%l7 + 0x0A]
	fmovdle	%xcc,	%f7,	%f9
	ldx	[%l7 + 0x78],	%o2
	std	%f24,	[%l7 + 0x08]
	fand	%f18,	%f26,	%f22
	edge16l	%g1,	%l1,	%g6
	movl	%xcc,	%l3,	%i5
	fnor	%f8,	%f10,	%f8
	fmovscc	%icc,	%f2,	%f19
	fmovdne	%icc,	%f8,	%f3
	save %o4, 0x0C47, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f16,	[%l7 + 0x60]
	movle	%xcc,	%l6,	%g7
	mulscc	%o5,	%l5,	%g4
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	ld	[%l7 + 0x44],	%f9
	subc	%l2,	%o6,	%i0
	edge8	%i4,	%l0,	%g5
	movvs	%xcc,	%i6,	%g2
	fmovsvc	%icc,	%f20,	%f8
	array8	%i3,	%o0,	%i7
	ldsb	[%l7 + 0x61],	%g3
	orn	%l4,	%i2,	%o1
	movcs	%icc,	%g1,	%o2
	movle	%xcc,	%g6,	%l1
	ld	[%l7 + 0x7C],	%f31
	srax	%l3,	0x19,	%o4
	udiv	%i1,	0x0708,	%l6
	sll	%g7,	%o5,	%i5
	fmovscs	%icc,	%f3,	%f24
	edge16n	%g4,	%l5,	%o3
	fmovsge	%icc,	%f27,	%f2
	sub	%o7,	0x00BA,	%o6
	ldsw	[%l7 + 0x18],	%i0
	movleu	%icc,	%i4,	%l0
	subc	%g5,	%l2,	%i6
	faligndata	%f8,	%f28,	%f16
	fors	%f29,	%f26,	%f28
	sir	0x03FB
	edge8ln	%i3,	%g2,	%o0
	stw	%i7,	[%l7 + 0x74]
	fmovspos	%icc,	%f15,	%f15
	udivx	%g3,	0x05A3,	%l4
	movl	%icc,	%o1,	%i2
	edge8n	%g1,	%o2,	%l1
	orncc	%g6,	%l3,	%o4
	stb	%i1,	[%l7 + 0x35]
	umulcc	%g7,	0x0BA7,	%l6
	ld	[%l7 + 0x2C],	%f31
	fmovsge	%icc,	%f25,	%f1
	movn	%icc,	%o5,	%i5
	andncc	%g4,	%o3,	%o7
	movcc	%icc,	%l5,	%o6
	fmovrsne	%i0,	%f3,	%f25
	mova	%xcc,	%l0,	%i4
	array32	%g5,	%i6,	%l2
	sethi	0x0BDA,	%i3
	movge	%xcc,	%o0,	%g2
	srax	%g3,	%l4,	%i7
	lduh	[%l7 + 0x40],	%o1
	fmovda	%icc,	%f16,	%f23
	addc	%i2,	%g1,	%l1
	ldub	[%l7 + 0x3C],	%o2
	fcmpgt32	%f2,	%f26,	%g6
	sdivcc	%l3,	0x0F92,	%i1
	edge16	%g7,	%l6,	%o5
	fmovrse	%i5,	%f23,	%f19
	fornot2s	%f22,	%f10,	%f10
	movleu	%icc,	%o4,	%o3
	mulx	%o7,	%g4,	%o6
	for	%f22,	%f24,	%f14
	edge8n	%i0,	%l0,	%i4
	movvs	%icc,	%g5,	%l5
	edge16n	%l2,	%i6,	%i3
	xnor	%g2,	0x19C2,	%o0
	fone	%f20
	ldsh	[%l7 + 0x6C],	%l4
	srl	%g3,	%i7,	%o1
	edge8n	%i2,	%g1,	%l1
	subcc	%o2,	%g6,	%l3
	ldx	[%l7 + 0x78],	%i1
	array8	%l6,	%g7,	%i5
	ld	[%l7 + 0x2C],	%f4
	movre	%o5,	0x2B9,	%o3
	ldd	[%l7 + 0x70],	%o6
	ld	[%l7 + 0x24],	%f15
	ldsw	[%l7 + 0x1C],	%g4
	fmovsleu	%icc,	%f19,	%f1
	fzero	%f30
	ld	[%l7 + 0x34],	%f20
	faligndata	%f24,	%f0,	%f2
	ld	[%l7 + 0x38],	%f21
	fpackfix	%f24,	%f12
	array32	%o4,	%i0,	%l0
	edge32	%o6,	%g5,	%l5
	fmovrsne	%i4,	%f5,	%f29
	sdivx	%l2,	0x0043,	%i6
	alignaddrl	%i3,	%o0,	%l4
	subcc	%g2,	%i7,	%g3
	edge8l	%i2,	%g1,	%l1
	fnot2s	%f31,	%f29
	xnor	%o2,	%o1,	%g6
	edge32ln	%i1,	%l6,	%l3
	srlx	%g7,	%i5,	%o3
	bshuffle	%f14,	%f24,	%f12
	and	%o5,	%g4,	%o4
	edge16n	%i0,	%l0,	%o6
	edge32ln	%o7,	%l5,	%g5
	fmovsle	%xcc,	%f24,	%f23
	array8	%l2,	%i6,	%i4
	fornot1s	%f31,	%f31,	%f22
	alignaddrl	%o0,	%l4,	%g2
	ldx	[%l7 + 0x60],	%i3
	ldsb	[%l7 + 0x59],	%i7
	fmovrdlez	%i2,	%f12,	%f22
	fcmpne16	%f0,	%f2,	%g3
	fandnot1s	%f28,	%f5,	%f23
	movl	%xcc,	%g1,	%l1
	ldub	[%l7 + 0x79],	%o2
	movrlz	%g6,	%o1,	%l6
	fmovsvc	%icc,	%f27,	%f6
	ldub	[%l7 + 0x34],	%l3
	orcc	%g7,	0x1AB5,	%i1
	ldd	[%l7 + 0x18],	%i4
	movn	%xcc,	%o5,	%o3
	std	%f16,	[%l7 + 0x78]
	udiv	%g4,	0x035D,	%o4
	alignaddrl	%l0,	%o6,	%o7
	movrgez	%i0,	%g5,	%l5
	ldsw	[%l7 + 0x48],	%l2
	edge16n	%i4,	%i6,	%o0
	subcc	%g2,	%l4,	%i7
	ld	[%l7 + 0x34],	%f29
	array8	%i2,	%i3,	%g1
	move	%icc,	%l1,	%g3
	fmovrsgez	%g6,	%f20,	%f16
	ldsw	[%l7 + 0x58],	%o2
	edge16l	%l6,	%l3,	%o1
	sir	0x1FBD
	orcc	%g7,	%i1,	%i5
	lduw	[%l7 + 0x24],	%o5
	sth	%g4,	[%l7 + 0x42]
	subccc	%o3,	%l0,	%o6
	smulcc	%o4,	%i0,	%g5
	movg	%xcc,	%l5,	%l2
	fandnot2	%f22,	%f6,	%f26
	fmovda	%icc,	%f1,	%f12
	st	%f25,	[%l7 + 0x24]
	add	%o7,	%i4,	%i6
	udiv	%o0,	0x083F,	%g2
	fcmps	%fcc2,	%f29,	%f20
	fandnot1	%f0,	%f0,	%f10
	movne	%icc,	%i7,	%i2
	ldx	[%l7 + 0x68],	%i3
	fsrc2	%f20,	%f30
	save %g1, 0x11B0, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g3,	%l4,	%o2
	popc	%g6,	%l6
	fmuld8ulx16	%f0,	%f26,	%f24
	move	%xcc,	%o1,	%l3
	orn	%g7,	%i5,	%o5
	save %i1, 0x19E9, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g4,	%o6,	%l0
	fone	%f18
	ldub	[%l7 + 0x4C],	%i0
	fmovdgu	%xcc,	%f3,	%f16
	movleu	%xcc,	%o4,	%g5
	umul	%l2,	%o7,	%l5
	ld	[%l7 + 0x10],	%f5
	move	%xcc,	%i4,	%i6
	movrne	%o0,	%i7,	%g2
	fmovdvc	%icc,	%f0,	%f5
	edge8l	%i3,	%g1,	%l1
	restore %g3, 0x0416, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%o2,	%l4
	andn	%g6,	%o1,	%l3
	popc	%g7,	%l6
	fxor	%f26,	%f26,	%f4
	edge32ln	%i5,	%o5,	%i1
	fand	%f8,	%f8,	%f20
	umul	%g4,	%o6,	%o3
	save %i0, 0x143A, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f0,	%f12
	alignaddrl	%o4,	%g5,	%l2
	movcs	%icc,	%o7,	%i4
	xorcc	%l5,	%o0,	%i7
	fpsub32	%f30,	%f28,	%f16
	or	%i6,	0x10F7,	%g2
	stw	%i3,	[%l7 + 0x10]
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	fand	%f8,	%f28,	%f0
	fmovsleu	%icc,	%f23,	%f26
	save %g1, %i2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o2,	%g6
	fmovrde	%o1,	%f12,	%f8
	fcmpd	%fcc1,	%f26,	%f26
	mulx	%l3,	0x13A4,	%l6
	mova	%icc,	%g7,	%i5
	fmovdn	%xcc,	%f31,	%f2
	movn	%xcc,	%o5,	%i1
	movl	%icc,	%o6,	%o3
	fmovrdgez	%g4,	%f4,	%f8
	pdist	%f30,	%f18,	%f12
	udivx	%l0,	0x098E,	%o4
	fpadd16	%f4,	%f2,	%f0
	subc	%g5,	0x1914,	%i0
	fmovscs	%xcc,	%f20,	%f8
	movne	%icc,	%l2,	%i4
	ldub	[%l7 + 0x31],	%o7
	edge8n	%o0,	%l5,	%i6
	fcmpgt32	%f0,	%f6,	%i7
	sdivcc	%i3,	0x1A18,	%l1
	srlx	%g3,	%g2,	%i2
	udivx	%l4,	0x1CF4,	%g1
	ldd	[%l7 + 0x60],	%f4
	siam	0x1
	orcc	%o2,	0x00A5,	%o1
	movpos	%xcc,	%g6,	%l6
	edge8l	%l3,	%i5,	%g7
	edge8	%i1,	%o5,	%o3
	movrlez	%g4,	%l0,	%o4
	ldsh	[%l7 + 0x42],	%o6
	movrgz	%g5,	%l2,	%i0
	movrne	%o7,	%o0,	%l5
	lduh	[%l7 + 0x1C],	%i6
	movrgez	%i4,	0x37B,	%i7
	srlx	%l1,	%g3,	%i3
	movrgz	%i2,	0x0CD,	%l4
	edge8l	%g1,	%o2,	%o1
	udivx	%g6,	0x123F,	%g2
	udivcc	%l6,	0x0208,	%i5
	nop
	set	0x08, %o4
	ldsw	[%l7 + %o4],	%l3
	edge32	%i1,	%o5,	%g7
	fmovscc	%icc,	%f23,	%f0
	edge8n	%o3,	%g4,	%o4
	orn	%o6,	0x1A6E,	%l0
	fmovrsgz	%l2,	%f14,	%f28
	movvc	%xcc,	%i0,	%o7
	andcc	%g5,	0x040B,	%o0
	fmul8x16au	%f12,	%f20,	%f8
	edge8l	%l5,	%i4,	%i6
	sra	%l1,	0x1D,	%g3
	sub	%i7,	0x002F,	%i3
	subcc	%l4,	0x04D9,	%g1
	subcc	%o2,	0x0E98,	%o1
	movle	%xcc,	%i2,	%g2
	movrlez	%l6,	%i5,	%l3
	andncc	%i1,	%g6,	%g7
	or	%o3,	0x1FCF,	%g4
	edge16	%o5,	%o6,	%l0
	fexpand	%f4,	%f14
	movrlez	%l2,	0x07B,	%o4
	ldx	[%l7 + 0x68],	%o7
	movn	%xcc,	%g5,	%i0
	orn	%l5,	0x15DE,	%i4
	mova	%xcc,	%i6,	%o0
	mova	%icc,	%l1,	%i7
	orncc	%g3,	%l4,	%i3
	ldsb	[%l7 + 0x2A],	%o2
	mova	%xcc,	%g1,	%o1
	smul	%g2,	0x1686,	%l6
	edge16ln	%i2,	%i5,	%i1
	andncc	%l3,	%g6,	%g7
	orcc	%o3,	0x02BB,	%o5
	edge8l	%o6,	%g4,	%l2
	movgu	%xcc,	%l0,	%o4
	nop
	set	0x41, %l1
	ldsb	[%l7 + %l1],	%o7
	andn	%i0,	%g5,	%i4
	movl	%icc,	%l5,	%o0
	fmovsn	%icc,	%f11,	%f27
	stw	%l1,	[%l7 + 0x6C]
	popc	%i7,	%i6
	ldx	[%l7 + 0x40],	%g3
	stw	%l4,	[%l7 + 0x74]
	edge8ln	%i3,	%o2,	%o1
	restore %g1, 0x1DBE, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%i2,	%g2
	andncc	%i5,	%i1,	%l3
	movrlz	%g6,	%g7,	%o5
	array16	%o6,	%g4,	%o3
	movn	%icc,	%l0,	%l2
	udivcc	%o7,	0x0275,	%i0
	fmovdl	%xcc,	%f27,	%f12
	lduw	[%l7 + 0x54],	%g5
	movrgz	%i4,	%o4,	%o0
	fcmpd	%fcc0,	%f8,	%f10
	sllx	%l5,	0x06,	%l1
	fmuld8sux16	%f24,	%f5,	%f18
	fmovspos	%xcc,	%f5,	%f15
	nop
	set	0x20, %l6
	ldsh	[%l7 + %l6],	%i6
	fmovsgu	%xcc,	%f31,	%f8
	movne	%icc,	%i7,	%l4
	edge16l	%g3,	%o2,	%i3
	movrlez	%o1,	%l6,	%g1
	ldub	[%l7 + 0x7A],	%g2
	movrlz	%i2,	0x169,	%i5
	movpos	%icc,	%i1,	%g6
	movpos	%xcc,	%l3,	%o5
	edge8ln	%o6,	%g7,	%o3
	alignaddr	%l0,	%l2,	%o7
	or	%i0,	%g5,	%i4
	fmovsge	%icc,	%f26,	%f22
	ldsh	[%l7 + 0x46],	%g4
	fmovsl	%icc,	%f4,	%f20
	edge16ln	%o0,	%l5,	%l1
	mova	%icc,	%o4,	%i6
	sir	0x1814
	array16	%i7,	%g3,	%l4
	subcc	%o2,	0x1F6C,	%i3
	move	%icc,	%l6,	%o1
	fmovrslz	%g2,	%f29,	%f29
	movgu	%xcc,	%i2,	%i5
	andcc	%g1,	%i1,	%l3
	udivcc	%o5,	0x16D4,	%o6
	sdivx	%g7,	0x0A1A,	%g6
	ldsw	[%l7 + 0x08],	%o3
	fpmerge	%f5,	%f18,	%f28
	fmovsneg	%xcc,	%f26,	%f1
	edge8ln	%l2,	%l0,	%i0
	fmovrdlez	%o7,	%f22,	%f6
	lduw	[%l7 + 0x78],	%g5
	movrgz	%g4,	%i4,	%l5
	movl	%xcc,	%o0,	%l1
	addccc	%i6,	%o4,	%g3
	xorcc	%i7,	%l4,	%i3
	ldx	[%l7 + 0x58],	%o2
	fcmpeq32	%f10,	%f8,	%l6
	nop
	set	0x79, %g2
	ldub	[%l7 + %g2],	%o1
	movle	%icc,	%i2,	%i5
	fnot1s	%f6,	%f20
	fmovrdlz	%g1,	%f4,	%f4
	fmul8ulx16	%f6,	%f18,	%f4
	movre	%i1,	%g2,	%l3
	ld	[%l7 + 0x6C],	%f28
	edge16ln	%o5,	%g7,	%g6
	sdiv	%o6,	0x0133,	%l2
	movg	%xcc,	%l0,	%o3
	fones	%f20
	st	%f21,	[%l7 + 0x38]
	stx	%o7,	[%l7 + 0x20]
	movne	%xcc,	%g5,	%i0
	movpos	%xcc,	%i4,	%l5
	fsrc1	%f6,	%f26
	orn	%o0,	0x152B,	%g4
	umulcc	%i6,	0x1377,	%l1
	movrgz	%o4,	0x1D4,	%i7
	andncc	%g3,	%l4,	%o2
	orcc	%l6,	%o1,	%i3
	orn	%i2,	0x001C,	%g1
	edge16l	%i5,	%i1,	%l3
	fsrc1s	%f28,	%f31
	movrgz	%g2,	0x279,	%g7
	edge32n	%o5,	%o6,	%g6
	smulcc	%l2,	0x03A2,	%l0
	save %o7, %g5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i4,	0x10C3,	%i0
	edge8ln	%l5,	%g4,	%i6
	mova	%xcc,	%l1,	%o4
	alignaddr	%o0,	%i7,	%l4
	edge16n	%o2,	%g3,	%o1
	ldsw	[%l7 + 0x78],	%i3
	sub	%l6,	%g1,	%i5
	xnorcc	%i1,	%l3,	%i2
	lduh	[%l7 + 0x78],	%g7
	ldsh	[%l7 + 0x3E],	%g2
	fnor	%f18,	%f28,	%f20
	fpadd32	%f2,	%f10,	%f8
	stx	%o5,	[%l7 + 0x70]
	lduh	[%l7 + 0x32],	%g6
	array8	%o6,	%l2,	%l0
	umul	%g5,	%o3,	%i4
	fcmpeq32	%f4,	%f2,	%o7
	fpadd32s	%f9,	%f21,	%f17
	movneg	%xcc,	%i0,	%g4
	xnor	%l5,	%l1,	%o4
	smul	%i6,	0x0914,	%i7
	udivcc	%o0,	0x0BA5,	%o2
	edge32l	%l4,	%o1,	%g3
	fmovdpos	%icc,	%f24,	%f11
	ldsh	[%l7 + 0x52],	%i3
	ldsh	[%l7 + 0x22],	%l6
	std	%f14,	[%l7 + 0x28]
	movvs	%xcc,	%g1,	%i1
	stw	%l3,	[%l7 + 0x7C]
	movle	%xcc,	%i2,	%i5
	fmovsne	%xcc,	%f25,	%f22
	nop
	set	0x28, %o0
	ldsh	[%l7 + %o0],	%g2
	fmovse	%icc,	%f7,	%f17
	fandnot2s	%f13,	%f22,	%f3
	array16	%g7,	%o5,	%o6
	ldsw	[%l7 + 0x3C],	%l2
	fmovdcs	%xcc,	%f30,	%f19
	andcc	%g6,	%l0,	%o3
	fpadd32	%f0,	%f14,	%f12
	movg	%icc,	%g5,	%o7
	srax	%i4,	%i0,	%g4
	stw	%l5,	[%l7 + 0x2C]
	fnors	%f9,	%f4,	%f25
	array16	%o4,	%l1,	%i7
	fcmpne32	%f22,	%f0,	%i6
	movneg	%icc,	%o0,	%o2
	movge	%icc,	%l4,	%o1
	lduh	[%l7 + 0x6E],	%i3
	movrlz	%g3,	0x2CD,	%g1
	lduh	[%l7 + 0x2C],	%i1
	edge16	%l3,	%l6,	%i5
	movrlz	%i2,	0x196,	%g2
	subcc	%o5,	0x0B50,	%o6
	edge8n	%g7,	%g6,	%l2
	sdiv	%l0,	0x177B,	%o3
	ld	[%l7 + 0x40],	%f11
	xnor	%g5,	0x009A,	%o7
	addccc	%i0,	0x07CD,	%g4
	subc	%i4,	%o4,	%l5
	edge8	%i7,	%l1,	%o0
	udivcc	%o2,	0x17B4,	%l4
	ldd	[%l7 + 0x68],	%i6
	movne	%icc,	%o1,	%g3
	fcmpgt16	%f2,	%f14,	%i3
	movl	%icc,	%i1,	%l3
	mulscc	%l6,	0x0B33,	%i5
	ld	[%l7 + 0x58],	%f18
	move	%icc,	%g1,	%g2
	sdiv	%o5,	0x0CEE,	%o6
	stx	%g7,	[%l7 + 0x78]
	umulcc	%g6,	%i2,	%l2
	array32	%l0,	%o3,	%o7
	alignaddrl	%i0,	%g5,	%i4
	edge32l	%o4,	%g4,	%l5
	movg	%xcc,	%i7,	%l1
	movle	%xcc,	%o0,	%l4
	sethi	0x135E,	%o2
	edge8n	%i6,	%o1,	%i3
	fnors	%f24,	%f19,	%f20
	xor	%i1,	0x1A57,	%l3
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	sethi	0x1CC3,	%g2
	mulx	%o5,	%l6,	%o6
	movrlez	%g6,	0x0CE,	%g7
	edge16n	%l2,	%l0,	%i2
	orcc	%o3,	0x1DDD,	%o7
	add	%i0,	0x1272,	%g5
	st	%f4,	[%l7 + 0x58]
	fnot2s	%f29,	%f29
	sdivcc	%o4,	0x112C,	%i4
	movleu	%icc,	%l5,	%i7
	udivx	%g4,	0x1FB6,	%l1
	edge8ln	%o0,	%l4,	%o2
	edge16n	%i6,	%i3,	%o1
	andncc	%i1,	%g3,	%i5
	stw	%l3,	[%l7 + 0x28]
	popc	%g1,	%g2
	lduh	[%l7 + 0x28],	%o5
	fmovsne	%xcc,	%f24,	%f7
	addcc	%o6,	0x12CE,	%g6
	udivx	%g7,	0x1D89,	%l6
	andncc	%l0,	%i2,	%l2
	movleu	%xcc,	%o3,	%o7
	movcs	%xcc,	%g5,	%i0
	movvc	%xcc,	%o4,	%i4
	mulx	%i7,	0x00AA,	%l5
	fmovrsne	%g4,	%f8,	%f28
	sub	%o0,	%l1,	%l4
	fmovsle	%icc,	%f15,	%f6
	fabsd	%f28,	%f24
	fpadd32s	%f26,	%f2,	%f3
	fmovdne	%xcc,	%f27,	%f4
	fornot2	%f4,	%f24,	%f10
	fmovrdgz	%i6,	%f2,	%f12
	movleu	%xcc,	%o2,	%o1
	array32	%i1,	%i3,	%g3
	edge16l	%l3,	%i5,	%g1
	or	%o5,	%o6,	%g2
	xnorcc	%g6,	%l6,	%l0
	xnorcc	%g7,	0x0D3E,	%i2
	stw	%o3,	[%l7 + 0x0C]
	edge16	%l2,	%o7,	%i0
	ld	[%l7 + 0x18],	%f15
	fmovscs	%xcc,	%f10,	%f23
	ldd	[%l7 + 0x70],	%g4
	st	%f26,	[%l7 + 0x28]
	movneg	%xcc,	%o4,	%i7
	fmovda	%xcc,	%f27,	%f15
	movleu	%xcc,	%l5,	%i4
	movleu	%xcc,	%o0,	%l1
	smul	%g4,	0x1CD7,	%l4
	fnands	%f21,	%f16,	%f18
	sra	%i6,	%o1,	%i1
	andncc	%o2,	%i3,	%g3
	movn	%xcc,	%i5,	%g1
	movcc	%icc,	%o5,	%l3
	movneg	%xcc,	%g2,	%o6
	edge16	%g6,	%l6,	%l0
	movvs	%xcc,	%g7,	%i2
	ldsh	[%l7 + 0x20],	%l2
	addccc	%o7,	%o3,	%g5
	andn	%i0,	0x02BD,	%o4
	edge16n	%i7,	%l5,	%i4
	addc	%l1,	%o0,	%g4
	movrgez	%i6,	0x0DE,	%l4
	add	%i1,	0x017B,	%o1
	andn	%o2,	0x0BF6,	%i3
	sir	0x1AA5
	movneg	%icc,	%i5,	%g3
	mulscc	%g1,	0x0476,	%l3
	movrlz	%o5,	%o6,	%g6
	fcmple16	%f24,	%f20,	%l6
	xor	%l0,	0x0716,	%g2
	orcc	%g7,	0x0D95,	%i2
	ldub	[%l7 + 0x10],	%l2
	fcmpeq16	%f12,	%f30,	%o7
	sethi	0x0C8D,	%g5
	nop
	set	0x78, %i4
	stw	%i0,	[%l7 + %i4]
	sethi	0x182A,	%o4
	movpos	%icc,	%o3,	%l5
	st	%f31,	[%l7 + 0x68]
	orn	%i7,	%l1,	%o0
	udivx	%g4,	0x15B5,	%i4
	sdiv	%i6,	0x1323,	%l4
	fsrc1s	%f1,	%f14
	movl	%icc,	%o1,	%i1
	fabss	%f16,	%f25
	movgu	%icc,	%i3,	%o2
	fmovsle	%icc,	%f27,	%f3
	array8	%g3,	%g1,	%i5
	edge8l	%o5,	%o6,	%g6
	fmovdvc	%xcc,	%f7,	%f19
	sethi	0x1D6F,	%l3
	andcc	%l0,	%l6,	%g7
	edge8l	%g2,	%l2,	%o7
	movrlez	%i2,	%g5,	%o4
	movvs	%icc,	%o3,	%i0
	orn	%i7,	%l1,	%o0
	srax	%g4,	0x19,	%i4
	fmovsleu	%icc,	%f4,	%f18
	nop
	set	0x0C, %o2
	stw	%l5,	[%l7 + %o2]
	alignaddr	%i6,	%l4,	%o1
	edge8l	%i3,	%i1,	%o2
	ldsb	[%l7 + 0x2D],	%g3
	sub	%i5,	0x1BFB,	%o5
	fmul8x16al	%f19,	%f5,	%f14
	sdiv	%g1,	0x0C43,	%o6
	fnegs	%f24,	%f28
	fmovscs	%xcc,	%f8,	%f3
	restore %l3, 0x1270, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f10,	%f12,	%f6
	movrgez	%g6,	0x316,	%l6
	movneg	%icc,	%g2,	%l2
	edge8n	%o7,	%i2,	%g7
	sllx	%o4,	%o3,	%g5
	fone	%f20
	array32	%i0,	%i7,	%o0
	for	%f26,	%f14,	%f12
	movre	%l1,	%i4,	%l5
	array8	%g4,	%l4,	%i6
	array16	%i3,	%o1,	%i1
	alignaddr	%g3,	%i5,	%o2
	fnot2s	%f12,	%f13
	sub	%g1,	0x0FC1,	%o6
	ld	[%l7 + 0x60],	%f6
	ldsb	[%l7 + 0x69],	%l3
	movrgz	%l0,	%o5,	%g6
	st	%f12,	[%l7 + 0x38]
	fpmerge	%f22,	%f0,	%f8
	popc	0x13B3,	%l6
	array32	%g2,	%o7,	%i2
	sra	%g7,	0x02,	%l2
	sdiv	%o3,	0x005D,	%g5
	andcc	%i0,	0x1DB7,	%o4
	andcc	%i7,	0x131F,	%l1
	addccc	%i4,	%o0,	%g4
	xorcc	%l5,	%l4,	%i3
	popc	%o1,	%i6
	ldx	[%l7 + 0x18],	%g3
	nop
	set	0x18, %i6
	ldsw	[%l7 + %i6],	%i5
	andcc	%i1,	0x07CF,	%g1
	movrgez	%o6,	%l3,	%l0
	subc	%o2,	0x00A8,	%o5
	nop
	set	0x32, %g6
	ldsh	[%l7 + %g6],	%g6
	addccc	%g2,	%l6,	%i2
	fmovsvc	%xcc,	%f26,	%f9
	fones	%f30
	addc	%g7,	%o7,	%o3
	movrgez	%l2,	0x2EE,	%i0
	sdiv	%o4,	0x0038,	%i7
	sir	0x124F
	fandnot2	%f24,	%f28,	%f26
	sir	0x0204
	sllx	%g5,	0x1C,	%i4
	sdivcc	%o0,	0x12A4,	%l1
	ldd	[%l7 + 0x40],	%f20
	movcc	%icc,	%g4,	%l4
	ldsw	[%l7 + 0x38],	%l5
	ld	[%l7 + 0x38],	%f23
	sdivcc	%o1,	0x04A8,	%i3
	addc	%g3,	0x0D83,	%i5
	ldx	[%l7 + 0x08],	%i1
	edge16	%g1,	%i6,	%o6
	popc	%l0,	%o2
	movge	%xcc,	%l3,	%o5
	fmovdgu	%xcc,	%f1,	%f27
	edge8	%g6,	%g2,	%l6
	edge32ln	%i2,	%o7,	%g7
	fxnor	%f0,	%f18,	%f18
	movrlz	%l2,	0x285,	%i0
	sub	%o4,	0x1F8C,	%o3
	save %g5, %i4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0048,	%i7
	subcc	%l1,	%g4,	%l4
	udivcc	%l5,	0x1834,	%o1
	fmovspos	%icc,	%f14,	%f12
	move	%icc,	%i3,	%i5
	edge8n	%i1,	%g1,	%i6
	fsrc2	%f26,	%f2
	edge8n	%g3,	%l0,	%o2
	lduw	[%l7 + 0x6C],	%o6
	mulscc	%o5,	0x0526,	%l3
	sub	%g6,	0x1128,	%l6
	fmovdpos	%xcc,	%f17,	%f26
	ldd	[%l7 + 0x70],	%f6
	ldub	[%l7 + 0x2E],	%i2
	movle	%xcc,	%g2,	%g7
	fmovrde	%o7,	%f14,	%f14
	fxor	%f22,	%f8,	%f8
	movne	%xcc,	%i0,	%o4
	edge16l	%o3,	%g5,	%i4
	fnands	%f28,	%f23,	%f6
	array8	%o0,	%i7,	%l2
	movl	%icc,	%g4,	%l4
	movcs	%xcc,	%l1,	%o1
	std	%f6,	[%l7 + 0x38]
	save %l5, %i3, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i5,	%i6,	%g3
	movre	%l0,	0x207,	%o2
	edge16n	%g1,	%o5,	%o6
	andn	%g6,	0x1790,	%l6
	xnor	%l3,	0x115A,	%g2
	andn	%i2,	0x0678,	%g7
	array8	%o7,	%i0,	%o4
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	sir	0x103A
	movvs	%icc,	%i7,	%l2
	ldd	[%l7 + 0x30],	%f0
	fsrc1s	%f31,	%f17
	stx	%g4,	[%l7 + 0x58]
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%f8
	andncc	%i4,	%l4,	%l1
	fmovse	%icc,	%f6,	%f13
	movcc	%xcc,	%o1,	%i3
	fandnot2s	%f9,	%f8,	%f9
	siam	0x5
	udivx	%i1,	0x068A,	%l5
	nop
	set	0x49, %i5
	ldsb	[%l7 + %i5],	%i5
	edge32	%i6,	%l0,	%o2
	sdiv	%g3,	0x02E6,	%o5
	edge16	%o6,	%g1,	%l6
	umul	%g6,	0x1DD6,	%g2
	mulscc	%l3,	0x0649,	%i2
	or	%o7,	%g7,	%i0
	ldd	[%l7 + 0x30],	%o4
	movge	%icc,	%o3,	%o0
	movrgez	%g5,	0x3C2,	%i7
	restore %g4, 0x0940, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l4,	0x182B,	%l1
	addc	%l2,	0x03D6,	%o1
	fmovrsgez	%i3,	%f28,	%f17
	fandnot2	%f6,	%f14,	%f12
	sir	0x0A18
	edge8	%l5,	%i1,	%i5
	udiv	%l0,	0x1819,	%o2
	save %g3, 0x0FAC, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x28],	%o6
	mulscc	%g1,	%l6,	%o5
	fmovsg	%icc,	%f9,	%f3
	addcc	%g6,	%l3,	%g2
	movvs	%icc,	%o7,	%i2
	movleu	%xcc,	%i0,	%o4
	movle	%icc,	%g7,	%o3
	or	%g5,	%o0,	%g4
	or	%i4,	0x1B14,	%l4
	fcmped	%fcc1,	%f20,	%f26
	edge8	%l1,	%l2,	%o1
	move	%xcc,	%i3,	%i7
	smulcc	%i1,	%i5,	%l5
	mulscc	%o2,	0x05EB,	%l0
	edge32ln	%i6,	%g3,	%o6
	andncc	%l6,	%o5,	%g1
	ldub	[%l7 + 0x50],	%g6
	alignaddrl	%l3,	%g2,	%i2
	movg	%icc,	%o7,	%o4
	mova	%xcc,	%i0,	%o3
	stw	%g7,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%f20
	orncc	%g5,	0x1E5E,	%g4
	andn	%o0,	%i4,	%l4
	or	%l1,	%o1,	%i3
	stw	%i7,	[%l7 + 0x50]
	movrne	%i1,	%l2,	%l5
	fsrc2	%f22,	%f2
	movleu	%icc,	%i5,	%o2
	fmul8x16au	%f20,	%f31,	%f4
	std	%f20,	[%l7 + 0x58]
	sdivx	%i6,	0x12E9,	%l0
	edge16n	%o6,	%g3,	%o5
	alignaddr	%l6,	%g1,	%l3
	fpsub16s	%f18,	%f10,	%f4
	alignaddrl	%g6,	%i2,	%g2
	fmovdne	%xcc,	%f1,	%f17
	fpadd16	%f12,	%f26,	%f20
	fmul8x16al	%f0,	%f19,	%f24
	fcmpne32	%f2,	%f18,	%o4
	ldsh	[%l7 + 0x3A],	%i0
	udivcc	%o7,	0x1D7B,	%g7
	fcmpes	%fcc2,	%f3,	%f7
	sth	%g5,	[%l7 + 0x5C]
	fornot2s	%f10,	%f6,	%f1
	movne	%icc,	%g4,	%o0
	subccc	%i4,	0x1FE4,	%o3
	xorcc	%l4,	%o1,	%l1
	and	%i3,	%i7,	%l2
	subc	%l5,	0x1E72,	%i5
	addccc	%i1,	%i6,	%l0
	array8	%o6,	%g3,	%o5
	popc	0x05AA,	%l6
	movrgz	%o2,	%g1,	%g6
	fmovdvs	%icc,	%f1,	%f4
	movge	%icc,	%i2,	%l3
	subcc	%o4,	0x15B9,	%g2
	subcc	%i0,	%o7,	%g7
	edge8n	%g4,	%o0,	%g5
	stx	%i4,	[%l7 + 0x60]
	fmovdg	%icc,	%f9,	%f4
	movrgez	%l4,	%o1,	%o3
	umul	%l1,	0x1169,	%i3
	or	%l2,	0x1E7C,	%l5
	fpsub16s	%f14,	%f29,	%f7
	fones	%f4
	andncc	%i7,	%i5,	%i1
	umulcc	%i6,	0x00A8,	%o6
	fmovdl	%icc,	%f14,	%f14
	andncc	%g3,	%l0,	%l6
	fmovrde	%o5,	%f0,	%f10
	edge16	%g1,	%g6,	%o2
	edge32ln	%i2,	%o4,	%l3
	xorcc	%i0,	%o7,	%g2
	popc	0x07DB,	%g4
	fnegs	%f15,	%f28
	fnands	%f13,	%f19,	%f23
	movrgz	%g7,	%g5,	%o0
	ldsw	[%l7 + 0x54],	%l4
	sll	%o1,	0x07,	%o3
	movleu	%icc,	%i4,	%l1
	movleu	%xcc,	%l2,	%i3
	orcc	%l5,	0x184F,	%i5
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	st	%f16,	[%l7 + 0x38]
	udivcc	%g3,	0x067D,	%l0
	sra	%l6,	%i6,	%g1
	sth	%o5,	[%l7 + 0x1E]
	smul	%o2,	0x1F89,	%g6
	alignaddrl	%o4,	%l3,	%i2
	fzeros	%f22
	fcmpne16	%f6,	%f8,	%o7
	ldsh	[%l7 + 0x12],	%g2
	movvc	%icc,	%i0,	%g7
	movg	%xcc,	%g4,	%g5
	andn	%l4,	0x12DF,	%o1
	xnor	%o0,	0x149B,	%o3
	movn	%xcc,	%l1,	%i4
	lduh	[%l7 + 0x2E],	%l2
	movrlz	%i3,	0x071,	%i5
	mulx	%l5,	%i7,	%o6
	mova	%icc,	%i1,	%l0
	movre	%l6,	%g3,	%g1
	fmovdn	%xcc,	%f4,	%f15
	movgu	%xcc,	%i6,	%o5
	mulx	%o2,	0x1773,	%g6
	fcmps	%fcc0,	%f19,	%f21
	andcc	%l3,	0x0990,	%o4
	fpadd32s	%f0,	%f23,	%f17
	fmovd	%f8,	%f16
	umulcc	%o7,	%g2,	%i0
	fmovdge	%icc,	%f1,	%f15
	std	%f4,	[%l7 + 0x68]
	lduh	[%l7 + 0x4C],	%g7
	edge32l	%g4,	%g5,	%i2
	array8	%o1,	%o0,	%l4
	fsrc1	%f18,	%f12
	andn	%o3,	%i4,	%l1
	movl	%xcc,	%i3,	%i5
	stb	%l2,	[%l7 + 0x6D]
	fcmpeq16	%f0,	%f8,	%l5
	stb	%o6,	[%l7 + 0x37]
	mova	%xcc,	%i1,	%i7
	faligndata	%f22,	%f26,	%f4
	sdivcc	%l6,	0x1234,	%l0
	popc	%g1,	%g3
	or	%o5,	%i6,	%g6
	sth	%l3,	[%l7 + 0x0E]
	movrne	%o2,	0x018,	%o7
	edge16ln	%g2,	%o4,	%i0
	fzeros	%f15
	edge32ln	%g4,	%g5,	%g7
	edge16	%i2,	%o0,	%l4
	subc	%o1,	%i4,	%l1
	movrlez	%o3,	0x13D,	%i5
	movge	%xcc,	%i3,	%l2
	restore %o6, %l5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i7,	[%l7 + 0x30]
	fmovrsgez	%l6,	%f8,	%f31
	sra	%g1,	0x01,	%l0
	or	%o5,	0x1949,	%g3
	st	%f13,	[%l7 + 0x08]
	edge16	%i6,	%l3,	%g6
	fxnors	%f0,	%f6,	%f7
	st	%f14,	[%l7 + 0x30]
	ldsw	[%l7 + 0x18],	%o7
	fmovdn	%xcc,	%f5,	%f20
	array32	%o2,	%g2,	%o4
	std	%f6,	[%l7 + 0x50]
	andncc	%i0,	%g5,	%g7
	edge8l	%i2,	%g4,	%o0
	edge32	%o1,	%l4,	%l1
	sra	%o3,	0x0B,	%i5
	mulscc	%i3,	0x14B0,	%l2
	movneg	%xcc,	%o6,	%l5
	sdivcc	%i1,	0x059D,	%i7
	fpsub32s	%f18,	%f4,	%f10
	edge32	%l6,	%i4,	%g1
	fandnot1s	%f18,	%f29,	%f13
	alignaddr	%o5,	%g3,	%i6
	xor	%l0,	0x110C,	%l3
	fandnot2	%f2,	%f0,	%f30
	xnor	%g6,	%o7,	%o2
	srax	%g2,	%o4,	%i0
	fmovrslez	%g7,	%f24,	%f7
	lduw	[%l7 + 0x4C],	%g5
	pdist	%f4,	%f14,	%f4
	sdivx	%i2,	0x03E3,	%o0
	sra	%g4,	%l4,	%l1
	edge8ln	%o1,	%o3,	%i5
	edge8	%l2,	%i3,	%l5
	xorcc	%o6,	%i7,	%l6
	fnand	%f24,	%f22,	%f28
	st	%f29,	[%l7 + 0x70]
	fmovdpos	%icc,	%f31,	%f18
	sll	%i1,	%g1,	%o5
	sdivx	%g3,	0x0F41,	%i4
	ldsh	[%l7 + 0x5C],	%i6
	move	%xcc,	%l3,	%l0
	subcc	%g6,	%o7,	%g2
	ldd	[%l7 + 0x08],	%o2
	fmovdl	%icc,	%f13,	%f28
	subccc	%o4,	0x01C3,	%i0
	movne	%xcc,	%g5,	%g7
	popc	0x1303,	%i2
	andn	%o0,	%l4,	%l1
	mulx	%o1,	0x09D8,	%o3
	sdivx	%g4,	0x0BB8,	%l2
	fcmps	%fcc0,	%f3,	%f3
	and	%i3,	%l5,	%o6
	popc	%i7,	%l6
	fpsub32s	%f26,	%f3,	%f21
	ld	[%l7 + 0x6C],	%f16
	ld	[%l7 + 0x4C],	%f15
	sllx	%i1,	%i5,	%g1
	movcc	%icc,	%o5,	%g3
	movrgez	%i6,	0x3F8,	%i4
	fcmpd	%fcc0,	%f28,	%f8
	popc	0x1216,	%l0
	movvc	%icc,	%g6,	%l3
	sllx	%o7,	0x16,	%o2
	lduw	[%l7 + 0x70],	%o4
	edge32n	%i0,	%g2,	%g5
	srax	%i2,	%o0,	%l4
	subcc	%l1,	%o1,	%o3
	fmovsleu	%icc,	%f28,	%f30
	sra	%g4,	%l2,	%i3
	movcs	%xcc,	%g7,	%o6
	umulcc	%i7,	%l5,	%l6
	xorcc	%i5,	%g1,	%i1
	orncc	%o5,	%g3,	%i4
	edge8	%i6,	%l0,	%g6
	edge8l	%l3,	%o2,	%o4
	orcc	%i0,	0x0994,	%g2
	fmovrse	%o7,	%f7,	%f9
	fornot2	%f8,	%f12,	%f18
	alignaddrl	%g5,	%o0,	%l4
	movne	%xcc,	%l1,	%i2
	movvs	%icc,	%o3,	%g4
	ldd	[%l7 + 0x20],	%l2
	sir	0x037E
	mova	%icc,	%o1,	%i3
	ldsb	[%l7 + 0x13],	%g7
	save %i7, 0x17A6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f18,	%f30,	%o6
	edge16	%i5,	%g1,	%i1
	fcmpes	%fcc1,	%f31,	%f6
	ldx	[%l7 + 0x18],	%o5
	umulcc	%g3,	0x1139,	%l6
	subc	%i6,	0x1320,	%i4
	movvs	%icc,	%g6,	%l3
	stw	%l0,	[%l7 + 0x0C]
	udiv	%o4,	0x0B43,	%o2
	addc	%g2,	%i0,	%o7
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	movcs	%xcc,	%l1,	%o0
	ld	[%l7 + 0x14],	%f20
	or	%o3,	%g4,	%i2
	fmovsvc	%icc,	%f1,	%f2
	lduh	[%l7 + 0x0A],	%l2
	xorcc	%o1,	%i3,	%i7
	edge32n	%g7,	%l5,	%o6
	ldub	[%l7 + 0x1E],	%i5
	udivcc	%i1,	0x1FC3,	%g1
	sth	%g3,	[%l7 + 0x42]
	edge16n	%o5,	%l6,	%i6
	array16	%i4,	%g6,	%l3
	ldsh	[%l7 + 0x68],	%o4
	nop
	set	0x10, %l4
	lduw	[%l7 + %l4],	%l0
	std	%f6,	[%l7 + 0x48]
	fmovsge	%xcc,	%f25,	%f6
	movpos	%xcc,	%g2,	%o2
	faligndata	%f24,	%f24,	%f0
	edge32l	%o7,	%g5,	%l4
	array8	%i0,	%o0,	%o3
	fcmpgt16	%f18,	%f8,	%l1
	fpackfix	%f30,	%f17
	udiv	%g4,	0x0103,	%i2
	andn	%l2,	0x1F68,	%o1
	movcc	%icc,	%i3,	%i7
	ldub	[%l7 + 0x39],	%g7
	edge8	%l5,	%i5,	%o6
	sir	0x00F2
	smul	%g1,	%g3,	%o5
	movle	%xcc,	%l6,	%i1
	and	%i6,	%i4,	%l3
	st	%f22,	[%l7 + 0x10]
	ldx	[%l7 + 0x50],	%o4
	smul	%g6,	0x1C9F,	%l0
	ldsh	[%l7 + 0x0A],	%g2
	fcmpes	%fcc3,	%f6,	%f25
	fnand	%f12,	%f8,	%f26
	edge32	%o2,	%o7,	%l4
	fmovdcs	%icc,	%f22,	%f14
	edge8n	%i0,	%o0,	%g5
	fcmple16	%f10,	%f22,	%l1
	restore %g4, %i2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l2,	%o1,	%i3
	fmuld8sux16	%f2,	%f21,	%f4
	ldsw	[%l7 + 0x40],	%i7
	xnor	%g7,	0x1026,	%l5
	fmovdle	%icc,	%f7,	%f26
	subcc	%i5,	%o6,	%g3
	fmovdcs	%xcc,	%f15,	%f3
	movcs	%icc,	%o5,	%l6
	fones	%f13
	fcmpd	%fcc3,	%f12,	%f18
	edge16l	%i1,	%i6,	%g1
	popc	%l3,	%o4
	and	%i4,	0x1362,	%l0
	std	%f24,	[%l7 + 0x38]
	umul	%g6,	0x1CDD,	%o2
	fandnot2	%f16,	%f6,	%f2
	ldsb	[%l7 + 0x39],	%g2
	andcc	%l4,	%i0,	%o0
	st	%f12,	[%l7 + 0x3C]
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	stw	%g4,	[%l7 + 0x5C]
	fandnot2	%f30,	%f4,	%f18
	sir	0x1EDA
	siam	0x0
	movrgez	%i2,	%o3,	%o7
	save %l2, 0x1BAF, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o1,	0x18FB,	%i7
	lduh	[%l7 + 0x08],	%g7
	movre	%i5,	%o6,	%l5
	addc	%g3,	%l6,	%i1
	alignaddrl	%i6,	%o5,	%l3
	fmovscs	%icc,	%f16,	%f12
	udivx	%o4,	0x0871,	%i4
	fones	%f8
	movrne	%g1,	%l0,	%o2
	or	%g6,	0x1779,	%g2
	sll	%i0,	0x1D,	%o0
	xnor	%l4,	%l1,	%g4
	fmovsa	%xcc,	%f18,	%f24
	fmul8x16au	%f21,	%f4,	%f24
	popc	%i2,	%g5
	fpmerge	%f25,	%f24,	%f30
	nop
	set	0x18, %l2
	stx	%o3,	[%l7 + %l2]
	sdivcc	%o7,	0x03C8,	%i3
	smul	%l2,	0x1471,	%o1
	movgu	%icc,	%g7,	%i7
	mulscc	%o6,	%i5,	%l5
	xnor	%g3,	%l6,	%i1
	alignaddr	%i6,	%o5,	%o4
	srl	%i4,	%g1,	%l0
	fmovdn	%icc,	%f18,	%f30
	stb	%l3,	[%l7 + 0x45]
	mulx	%o2,	0x0A8D,	%g6
	edge8ln	%g2,	%o0,	%l4
	addcc	%i0,	0x1927,	%g4
	xnor	%i2,	%l1,	%g5
	st	%f17,	[%l7 + 0x64]
	addc	%o7,	%i3,	%o3
	restore %o1, %g7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%i7,	%f20,	%f6
	save %o6, %i5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l5,	%i1,	%l6
	edge16l	%o5,	%o4,	%i6
	movge	%icc,	%g1,	%i4
	smulcc	%l3,	0x1D69,	%o2
	alignaddr	%l0,	%g6,	%g2
	sdivcc	%l4,	0x14F9,	%o0
	move	%icc,	%g4,	%i0
	edge8ln	%i2,	%l1,	%o7
	xor	%g5,	%i3,	%o1
	popc	%g7,	%l2
	sir	0x1AD0
	array32	%i7,	%o3,	%i5
	edge32	%o6,	%l5,	%i1
	smulcc	%l6,	%o5,	%g3
	fmovse	%icc,	%f23,	%f7
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	andncc	%l3,	%o2,	%i4
	fcmpeq16	%f26,	%f16,	%g6
	ldx	[%l7 + 0x50],	%l0
	edge32l	%l4,	%o0,	%g2
	move	%xcc,	%g4,	%i0
	movrgez	%i2,	%l1,	%g5
	subc	%o7,	0x0EDF,	%i3
	edge16ln	%o1,	%g7,	%i7
	st	%f28,	[%l7 + 0x78]
	movrlez	%o3,	%l2,	%i5
	alignaddr	%l5,	%o6,	%l6
	xnor	%i1,	0x07A4,	%g3
	edge16l	%o5,	%g1,	%i6
	subc	%l3,	%o2,	%i4
	udivx	%g6,	0x1B08,	%l0
	mova	%xcc,	%o4,	%l4
	umul	%g2,	%o0,	%i0
	subc	%i2,	0x1823,	%l1
	orncc	%g4,	%g5,	%o7
	fmovrdgz	%i3,	%f12,	%f12
	subc	%g7,	0x00CF,	%i7
	movneg	%xcc,	%o3,	%o1
	udivx	%i5,	0x014B,	%l2
	fandnot2	%f26,	%f20,	%f8
	fcmpgt32	%f28,	%f22,	%l5
	orn	%o6,	0x1D07,	%i1
	fpsub16	%f12,	%f10,	%f8
	sub	%l6,	0x109B,	%g3
	array16	%o5,	%i6,	%g1
	fmovdle	%xcc,	%f16,	%f10
	movleu	%xcc,	%l3,	%i4
	fmovsvc	%icc,	%f25,	%f2
	andcc	%o2,	%l0,	%o4
	orncc	%g6,	%g2,	%l4
	stx	%o0,	[%l7 + 0x58]
	or	%i2,	%l1,	%g4
	or	%g5,	%i0,	%o7
	sdivcc	%g7,	0x197F,	%i7
	edge32	%o3,	%o1,	%i3
	orncc	%i5,	0x02E9,	%l2
	fone	%f2
	sdivcc	%l5,	0x0CAD,	%o6
	movne	%xcc,	%i1,	%l6
	movre	%g3,	%o5,	%g1
	std	%f14,	[%l7 + 0x28]
	stx	%l3,	[%l7 + 0x68]
	xnor	%i4,	%o2,	%i6
	edge32	%l0,	%o4,	%g6
	movre	%l4,	%o0,	%g2
	fmovdgu	%xcc,	%f19,	%f30
	movvc	%icc,	%i2,	%g4
	movvs	%icc,	%g5,	%i0
	fzeros	%f9
	nop
	set	0x18, %o6
	stx	%l1,	[%l7 + %o6]
	edge32ln	%o7,	%g7,	%i7
	edge32l	%o1,	%i3,	%o3
	fcmpgt32	%f16,	%f24,	%l2
	fsrc1s	%f5,	%f19
	fmovrdgz	%l5,	%f16,	%f0
	mova	%icc,	%o6,	%i1
	udiv	%l6,	0x1DF2,	%i5
	sir	0x1787
	smulcc	%o5,	%g3,	%g1
	array8	%i4,	%l3,	%i6
	movpos	%icc,	%l0,	%o4
	sra	%g6,	0x19,	%l4
	fabsd	%f18,	%f4
	fmovrdgz	%o2,	%f24,	%f4
	xorcc	%o0,	0x05B8,	%i2
	movcs	%icc,	%g2,	%g4
	edge8ln	%g5,	%l1,	%o7
	andncc	%g7,	%i0,	%o1
	fnands	%f16,	%f7,	%f26
	fmovdcs	%icc,	%f17,	%f20
	edge32n	%i7,	%o3,	%l2
	movrgez	%l5,	0x38D,	%o6
	movvc	%icc,	%i3,	%l6
	fmul8ulx16	%f30,	%f30,	%f20
	movcc	%xcc,	%i1,	%o5
	st	%f16,	[%l7 + 0x78]
	array8	%i5,	%g1,	%g3
	andcc	%i4,	0x0D64,	%l3
	fandnot1s	%f3,	%f7,	%f24
	xor	%i6,	%o4,	%g6
	st	%f8,	[%l7 + 0x4C]
	for	%f30,	%f28,	%f8
	fnor	%f4,	%f18,	%f22
	orncc	%l0,	%l4,	%o0
	sra	%o2,	%i2,	%g2
	sdiv	%g5,	0x0A49,	%l1
	fxnors	%f23,	%f5,	%f25
	fpsub16	%f30,	%f30,	%f26
	movne	%xcc,	%g4,	%o7
	ldsw	[%l7 + 0x70],	%i0
	smulcc	%o1,	%i7,	%g7
	move	%xcc,	%o3,	%l2
	sdiv	%o6,	0x0B39,	%i3
	std	%f2,	[%l7 + 0x10]
	movleu	%xcc,	%l6,	%l5
	edge16ln	%i1,	%i5,	%o5
	fxnor	%f0,	%f30,	%f24
	add	%g1,	%g3,	%i4
	fcmple16	%f4,	%f10,	%l3
	fzero	%f24
	edge8l	%i6,	%o4,	%g6
	sdivcc	%l4,	0x0536,	%o0
	fcmple16	%f10,	%f14,	%o2
	srl	%i2,	%g2,	%g5
	ldd	[%l7 + 0x08],	%f24
	movvs	%xcc,	%l0,	%g4
	sdivx	%l1,	0x1016,	%o7
	ldsb	[%l7 + 0x6B],	%o1
	fcmpd	%fcc1,	%f28,	%f24
	sll	%i0,	0x04,	%g7
	sll	%o3,	0x12,	%l2
	array32	%i7,	%o6,	%i3
	movrgez	%l6,	0x1B8,	%i1
	edge8ln	%i5,	%o5,	%l5
	addc	%g3,	%g1,	%l3
	andncc	%i4,	%i6,	%g6
	edge32	%l4,	%o0,	%o2
	sdivcc	%o4,	0x0D41,	%i2
	srlx	%g5,	0x11,	%g2
	xorcc	%g4,	%l0,	%l1
	fmovdle	%icc,	%f13,	%f19
	srlx	%o1,	0x11,	%i0
	addccc	%o7,	0x08BE,	%o3
	movrgz	%l2,	0x222,	%g7
	xorcc	%o6,	0x07C3,	%i3
	and	%i7,	%l6,	%i5
	movge	%icc,	%i1,	%l5
	fxor	%f0,	%f14,	%f8
	fnand	%f28,	%f0,	%f2
	fmul8x16al	%f4,	%f25,	%f16
	std	%f10,	[%l7 + 0x68]
	std	%f8,	[%l7 + 0x48]
	save %o5, %g3, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f3,	%f12,	%f28
	fmovrdgez	%l3,	%f26,	%f22
	edge8ln	%i6,	%i4,	%l4
	or	%o0,	0x0822,	%o2
	fmul8x16al	%f21,	%f19,	%f18
	udivx	%o4,	0x1926,	%g6
	movrlez	%i2,	0x3CA,	%g5
	sethi	0x1928,	%g4
	andcc	%l0,	0x0B15,	%g2
	fmovsne	%icc,	%f13,	%f31
	fmovsneg	%xcc,	%f1,	%f8
	fcmpd	%fcc0,	%f0,	%f18
	stx	%l1,	[%l7 + 0x78]
	movcc	%icc,	%o1,	%o7
	subc	%i0,	%l2,	%g7
	fmovrse	%o6,	%f0,	%f30
	fxnors	%f10,	%f24,	%f3
	smulcc	%o3,	%i3,	%l6
	restore %i7, 0x018C, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i5,	%o5,	%g3
	sll	%l5,	0x10,	%l3
	movvc	%icc,	%i6,	%i4
	subccc	%g1,	%o0,	%o2
	fmovsl	%xcc,	%f15,	%f3
	ldsw	[%l7 + 0x6C],	%o4
	smul	%l4,	0x17C7,	%g6
	movl	%icc,	%g5,	%i2
	srl	%l0,	0x01,	%g4
	movrgez	%l1,	0x2C5,	%o1
	movre	%o7,	%i0,	%g2
	movleu	%icc,	%g7,	%o6
	fmovdcs	%xcc,	%f6,	%f10
	add	%o3,	0x0C4F,	%l2
	sllx	%l6,	%i3,	%i1
	edge8	%i7,	%i5,	%g3
	movl	%xcc,	%l5,	%l3
	stb	%i6,	[%l7 + 0x46]
	for	%f6,	%f24,	%f30
	udiv	%o5,	0x1C40,	%g1
	srlx	%o0,	0x1F,	%i4
	fmovrde	%o2,	%f30,	%f20
	sllx	%l4,	0x16,	%o4
	fnot1	%f20,	%f12
	sra	%g6,	%g5,	%l0
	smul	%i2,	%l1,	%g4
	movne	%xcc,	%o7,	%i0
	st	%f14,	[%l7 + 0x10]
	addc	%g2,	0x1A04,	%o1
	andcc	%g7,	0x0C86,	%o6
	umul	%o3,	%l6,	%i3
	andncc	%i1,	%i7,	%l2
	sir	0x19D6
	movn	%icc,	%i5,	%l5
	std	%f30,	[%l7 + 0x28]
	or	%g3,	%l3,	%i6
	stw	%g1,	[%l7 + 0x08]
	xorcc	%o0,	%i4,	%o5
	addc	%l4,	0x08EB,	%o2
	movrgez	%g6,	0x355,	%g5
	array8	%o4,	%l0,	%i2
	movrlz	%g4,	%l1,	%i0
	faligndata	%f6,	%f12,	%f6
	fmovda	%xcc,	%f23,	%f22
	udivcc	%o7,	0x0698,	%g2
	ldsh	[%l7 + 0x62],	%o1
	srlx	%o6,	%o3,	%l6
	stx	%g7,	[%l7 + 0x10]
	fands	%f24,	%f9,	%f8
	save %i1, %i3, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i5,	0x0E71,	%l5
	fpsub16	%f12,	%f20,	%f10
	popc	%i7,	%l3
	udivx	%g3,	0x1771,	%g1
	stb	%i6,	[%l7 + 0x27]
	umul	%o0,	0x070B,	%i4
	sub	%l4,	0x1834,	%o2
	subccc	%g6,	%g5,	%o4
	movleu	%icc,	%l0,	%o5
	edge8l	%g4,	%i2,	%i0
	or	%l1,	%g2,	%o7
	xor	%o6,	0x0CA5,	%o1
	movn	%xcc,	%o3,	%l6
	movrgez	%g7,	%i3,	%l2
	fmovdcc	%xcc,	%f5,	%f3
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	sdiv	%i1,	0x18FD,	%l3
	edge8l	%g3,	%i6,	%g1
	fmovdgu	%icc,	%f5,	%f29
	movvs	%xcc,	%i4,	%o0
	sra	%l4,	%g6,	%g5
	edge16n	%o2,	%o4,	%o5
	lduh	[%l7 + 0x0E],	%l0
	edge32ln	%i2,	%g4,	%i0
	srl	%l1,	0x0C,	%g2
	nop
	set	0x6E, %i3
	ldsh	[%l7 + %i3],	%o6
	movn	%xcc,	%o7,	%o1
	addccc	%o3,	0x0157,	%l6
	movl	%icc,	%i3,	%g7
	movge	%xcc,	%i5,	%l5
	edge32n	%i7,	%l2,	%i1
	array8	%g3,	%l3,	%i6
	umul	%i4,	%o0,	%l4
	umul	%g6,	0x1AB8,	%g5
	sll	%g1,	0x00,	%o2
	smul	%o5,	%o4,	%i2
	fcmpgt32	%f18,	%f12,	%l0
	fmovscs	%xcc,	%f10,	%f27
	edge8n	%i0,	%l1,	%g4
	movpos	%xcc,	%g2,	%o7
	orn	%o1,	0x0D5D,	%o3
	andncc	%l6,	%i3,	%g7
	movn	%icc,	%i5,	%o6
	movne	%icc,	%l5,	%i7
	mova	%xcc,	%l2,	%g3
	andncc	%l3,	%i6,	%i4
	fmovrslez	%i1,	%f20,	%f23
	edge8ln	%o0,	%g6,	%g5
	mova	%icc,	%l4,	%o2
	srl	%o5,	%o4,	%i2
	mova	%icc,	%g1,	%l0
	movrlez	%l1,	%g4,	%g2
	fmovrde	%i0,	%f16,	%f22
	fcmpeq32	%f28,	%f16,	%o1
	fcmpeq16	%f30,	%f30,	%o7
	sra	%l6,	0x0C,	%i3
	subccc	%g7,	%i5,	%o6
	movg	%xcc,	%l5,	%o3
	fornot1	%f22,	%f26,	%f4
	edge32l	%i7,	%g3,	%l3
	movrlz	%i6,	%i4,	%i1
	sll	%o0,	0x0B,	%g6
	sra	%l2,	0x11,	%g5
	movrgz	%l4,	0x17C,	%o2
	sra	%o4,	%i2,	%o5
	fmovse	%icc,	%f31,	%f12
	lduh	[%l7 + 0x2E],	%l0
	edge32n	%g1,	%l1,	%g2
	movgu	%xcc,	%g4,	%o1
	andn	%o7,	0x0EBB,	%i0
	movvc	%xcc,	%l6,	%g7
	movle	%icc,	%i3,	%i5
	fxnor	%f16,	%f14,	%f16
	popc	%l5,	%o6
	faligndata	%f8,	%f0,	%f0
	srlx	%o3,	0x08,	%i7
	fpadd16	%f18,	%f10,	%f30
	fmovdgu	%xcc,	%f21,	%f1
	movrlz	%l3,	0x1EA,	%i6
	stx	%i4,	[%l7 + 0x30]
	movn	%xcc,	%g3,	%i1
	fpadd16s	%f14,	%f12,	%f7
	lduh	[%l7 + 0x12],	%g6
	edge32ln	%o0,	%g5,	%l2
	movrne	%l4,	0x155,	%o2
	edge16	%i2,	%o4,	%o5
	movrlez	%g1,	%l0,	%l1
	movrne	%g2,	%o1,	%g4
	sdivx	%o7,	0x08C2,	%i0
	subc	%l6,	0x0565,	%i3
	sra	%g7,	%i5,	%l5
	udivx	%o3,	0x0482,	%i7
	ldd	[%l7 + 0x28],	%f0
	fnand	%f28,	%f4,	%f4
	fmovsvc	%icc,	%f6,	%f19
	movne	%icc,	%o6,	%l3
	edge16ln	%i4,	%i6,	%i1
	addccc	%g6,	%g3,	%o0
	fmovdgu	%xcc,	%f25,	%f5
	movrne	%g5,	%l2,	%o2
	addccc	%i2,	%o4,	%l4
	andcc	%g1,	%l0,	%l1
	movrgez	%o5,	%o1,	%g4
	movpos	%icc,	%g2,	%i0
	std	%f26,	[%l7 + 0x20]
	mulscc	%l6,	0x0878,	%o7
	fmovsleu	%xcc,	%f0,	%f7
	add	%g7,	0x16A8,	%i3
	ldsh	[%l7 + 0x46],	%i5
	nop
	set	0x30, %g4
	stx	%l5,	[%l7 + %g4]
	save %i7, %o6, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i4,	%l3
	movre	%i6,	%g6,	%i1
	edge32	%o0,	%g5,	%g3
	movrlez	%o2,	%i2,	%o4
	movrgz	%l2,	0x196,	%l4
	movl	%xcc,	%l0,	%l1
	orncc	%g1,	0x0D17,	%o5
	movrlez	%o1,	0x187,	%g2
	addc	%g4,	%i0,	%o7
	movleu	%xcc,	%g7,	%i3
	fcmped	%fcc1,	%f20,	%f18
	alignaddrl	%l6,	%l5,	%i5
	movvs	%xcc,	%i7,	%o3
	edge32ln	%o6,	%i4,	%l3
	fmovdl	%icc,	%f31,	%f30
	subc	%g6,	0x0573,	%i6
	fmovsvc	%icc,	%f19,	%f17
	smulcc	%i1,	%g5,	%g3
	or	%o0,	0x0303,	%i2
	array16	%o2,	%o4,	%l2
	and	%l0,	0x0DE3,	%l1
	subcc	%g1,	0x04D3,	%o5
	ldsh	[%l7 + 0x7C],	%o1
	andncc	%g2,	%l4,	%i0
	stw	%g4,	[%l7 + 0x10]
	fmovse	%icc,	%f25,	%f0
	lduh	[%l7 + 0x62],	%g7
	ldd	[%l7 + 0x78],	%o6
	movne	%icc,	%i3,	%l6
	movn	%icc,	%l5,	%i7
	lduw	[%l7 + 0x68],	%o3
	movrne	%o6,	0x1FA,	%i4
	ldsw	[%l7 + 0x5C],	%i5
	subccc	%l3,	0x1320,	%i6
	fmovdgu	%icc,	%f3,	%f21
	addc	%i1,	%g6,	%g5
	std	%f20,	[%l7 + 0x10]
	fornot2	%f4,	%f18,	%f10
	ldx	[%l7 + 0x68],	%g3
	sir	0x0D50
	orn	%i2,	0x1A82,	%o0
	movvc	%xcc,	%o2,	%o4
	add	%l0,	%l1,	%l2
	edge32ln	%g1,	%o5,	%o1
	fmovdcc	%xcc,	%f24,	%f29
	movrlez	%g2,	%i0,	%l4
	movneg	%xcc,	%g7,	%o7
	sll	%g4,	0x02,	%i3
	or	%l6,	0x0BED,	%l5
	fmovs	%f16,	%f28
	array16	%i7,	%o6,	%i4
	array16	%i5,	%o3,	%l3
	ldx	[%l7 + 0x68],	%i1
	stw	%g6,	[%l7 + 0x1C]
	fpackfix	%f2,	%f31
	edge16ln	%i6,	%g3,	%i2
	andn	%g5,	%o2,	%o4
	movcs	%xcc,	%l0,	%o0
	fmovrdlz	%l1,	%f6,	%f16
	edge16l	%l2,	%o5,	%o1
	fmovdle	%icc,	%f17,	%f4
	fcmpes	%fcc3,	%f1,	%f22
	array32	%g1,	%i0,	%g2
	and	%g7,	%l4,	%o7
	movvc	%icc,	%i3,	%l6
	fabsd	%f4,	%f12
	move	%icc,	%l5,	%i7
	movre	%g4,	0x144,	%i4
	fcmpne32	%f14,	%f6,	%i5
	fmovrsgz	%o3,	%f3,	%f26
	andn	%l3,	%o6,	%g6
	movrlez	%i6,	0x229,	%g3
	edge32ln	%i2,	%g5,	%i1
	xor	%o4,	0x1E08,	%l0
	sra	%o0,	0x05,	%l1
	andncc	%o2,	%o5,	%o1
	fmovsleu	%xcc,	%f21,	%f19
	add	%l2,	%g1,	%i0
	movgu	%xcc,	%g2,	%g7
	andncc	%o7,	%i3,	%l6
	stb	%l5,	[%l7 + 0x36]
	ldsh	[%l7 + 0x64],	%l4
	smul	%g4,	%i4,	%i7
	orncc	%i5,	%l3,	%o6
	andn	%g6,	%o3,	%i6
	orn	%g3,	%i2,	%g5
	sdivx	%i1,	0x0B45,	%l0
	fnegd	%f16,	%f18
	movcs	%xcc,	%o0,	%l1
	array8	%o4,	%o2,	%o5
	fmovrde	%o1,	%f16,	%f16
	ldsw	[%l7 + 0x18],	%g1
	sub	%l2,	%g2,	%g7
	smul	%o7,	%i0,	%i3
	umulcc	%l6,	0x0C8E,	%l5
	movrne	%l4,	0x054,	%g4
	ldd	[%l7 + 0x10],	%i6
	lduh	[%l7 + 0x28],	%i5
	and	%i4,	%l3,	%o6
	movge	%xcc,	%o3,	%g6
	andcc	%g3,	%i6,	%g5
	xorcc	%i1,	%i2,	%l0
	umulcc	%o0,	0x1F0B,	%o4
	alignaddrl	%o2,	%o5,	%o1
	ldx	[%l7 + 0x28],	%g1
	addc	%l2,	%g2,	%g7
	move	%icc,	%o7,	%i0
	sra	%l1,	0x0C,	%i3
	movrlz	%l6,	%l5,	%g4
	move	%xcc,	%l4,	%i7
	movvs	%xcc,	%i5,	%i4
	edge8	%l3,	%o6,	%g6
	movpos	%icc,	%g3,	%o3
	alignaddrl	%g5,	%i1,	%i2
	array16	%i6,	%o0,	%l0
	andcc	%o4,	%o2,	%o5
	fornot1	%f20,	%f12,	%f4
	edge16	%g1,	%o1,	%g2
	fmovrdlz	%l2,	%f26,	%f12
	movrlz	%o7,	%g7,	%l1
	xnorcc	%i3,	%i0,	%l5
	edge8l	%g4,	%l6,	%i7
	fmovse	%icc,	%f17,	%f13
	movcs	%xcc,	%i5,	%l4
	alignaddr	%l3,	%i4,	%g6
	xor	%g3,	%o3,	%o6
	orncc	%g5,	0x0A20,	%i1
	sub	%i6,	0x0328,	%o0
	fmovrslz	%i2,	%f31,	%f7
	movl	%icc,	%l0,	%o4
	xorcc	%o2,	0x09C1,	%g1
	fnand	%f14,	%f2,	%f26
	fmovdle	%xcc,	%f13,	%f0
	sdivcc	%o1,	0x0F0E,	%o5
	movgu	%icc,	%l2,	%o7
	fand	%f24,	%f22,	%f14
	movrgez	%g7,	0x2D0,	%g2
	sllx	%i3,	%l1,	%l5
	fmovsle	%xcc,	%f20,	%f5
	movcs	%icc,	%i0,	%l6
	std	%f24,	[%l7 + 0x78]
	movrgz	%i7,	%g4,	%l4
	fmul8x16	%f20,	%f18,	%f24
	fcmpes	%fcc1,	%f6,	%f4
	array32	%i5,	%l3,	%i4
	array16	%g3,	%o3,	%o6
	edge16n	%g6,	%i1,	%g5
	fmovdvc	%icc,	%f5,	%f20
	movgu	%icc,	%i6,	%i2
	edge8ln	%o0,	%l0,	%o2
	lduh	[%l7 + 0x50],	%g1
	movrlez	%o4,	%o1,	%l2
	movne	%xcc,	%o7,	%g7
	fornot1	%f28,	%f0,	%f10
	for	%f0,	%f12,	%f28
	udivx	%g2,	0x0625,	%o5
	stw	%i3,	[%l7 + 0x30]
	edge32	%l1,	%i0,	%l5
	sir	0x1BF7
	sth	%l6,	[%l7 + 0x52]
	xorcc	%g4,	%l4,	%i7
	alignaddrl	%i5,	%l3,	%i4
	movpos	%xcc,	%g3,	%o6
	movge	%icc,	%o3,	%g6
	movrne	%i1,	%g5,	%i2
	alignaddr	%o0,	%l0,	%i6
	umulcc	%g1,	%o2,	%o4
	fmovdvs	%xcc,	%f29,	%f7
	movrlz	%l2,	%o1,	%o7
	movg	%icc,	%g2,	%o5
	fmovdcs	%xcc,	%f4,	%f8
	addccc	%i3,	0x02AC,	%l1
	ldx	[%l7 + 0x10],	%i0
	mulscc	%l5,	0x1BE6,	%g7
	mulx	%g4,	%l6,	%l4
	edge16l	%i5,	%i7,	%l3
	array8	%g3,	%i4,	%o3
	alignaddr	%g6,	%i1,	%g5
	movl	%xcc,	%i2,	%o0
	umulcc	%o6,	%l0,	%g1
	alignaddr	%o2,	%i6,	%l2
	edge8n	%o1,	%o4,	%o7
	ldsb	[%l7 + 0x1F],	%o5
	movleu	%icc,	%g2,	%i3
	xorcc	%i0,	0x1333,	%l1
	sth	%g7,	[%l7 + 0x78]
	xnor	%l5,	%l6,	%l4
	movcc	%xcc,	%i5,	%i7
	fmovrslz	%g4,	%f12,	%f19
	movl	%icc,	%g3,	%i4
	addcc	%l3,	%g6,	%i1
	array8	%g5,	%i2,	%o3
	movpos	%icc,	%o0,	%l0
	orncc	%o6,	%g1,	%i6
	edge32	%o2,	%l2,	%o4
	array32	%o1,	%o5,	%g2
	fpsub16	%f28,	%f6,	%f18
	mulscc	%i3,	%o7,	%i0
	fnot2s	%f7,	%f24
	popc	0x0C9C,	%g7
	movcc	%xcc,	%l1,	%l6
	nop
	set	0x40, %g7
	ldx	[%l7 + %g7],	%l4
	save %l5, 0x0E90, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i5,	%g3,	%g4
	fmul8ulx16	%f24,	%f16,	%f0
	sir	0x1042
	edge8ln	%l3,	%i4,	%i1
	xorcc	%g5,	%g6,	%o3
	save %o0, 0x1142, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o6,	%l0,	%i6
	edge16n	%g1,	%o2,	%l2
	and	%o4,	0x005B,	%o1
	fmovdle	%icc,	%f4,	%f3
	ldx	[%l7 + 0x48],	%o5
	fmovsg	%xcc,	%f19,	%f11
	movgu	%icc,	%g2,	%i3
	fandnot1s	%f8,	%f21,	%f19
	mulscc	%o7,	%i0,	%g7
	movcs	%icc,	%l6,	%l4
	umulcc	%l1,	0x095C,	%l5
	mova	%xcc,	%i5,	%g3
	restore %i7, %l3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i1,	0x1DC5,	%i4
	fmovsa	%icc,	%f28,	%f5
	stx	%g5,	[%l7 + 0x40]
	edge16ln	%g6,	%o0,	%i2
	add	%o3,	%l0,	%o6
	edge32ln	%i6,	%g1,	%l2
	sir	0x1216
	fmul8sux16	%f18,	%f4,	%f0
	edge32ln	%o4,	%o2,	%o5
	edge32l	%o1,	%i3,	%g2
	fpsub16	%f26,	%f18,	%f10
	srlx	%i0,	%o7,	%l6
	movvc	%icc,	%g7,	%l1
	sllx	%l4,	%i5,	%l5
	ld	[%l7 + 0x4C],	%f23
	movl	%xcc,	%g3,	%l3
	fmovsgu	%xcc,	%f27,	%f18
	edge16	%g4,	%i1,	%i4
	edge32	%i7,	%g5,	%g6
	edge8n	%o0,	%o3,	%i2
	edge16n	%o6,	%l0,	%g1
	edge32ln	%l2,	%i6,	%o4
	fcmpes	%fcc1,	%f16,	%f26
	movrlez	%o2,	0x175,	%o1
	movleu	%xcc,	%o5,	%i3
	stx	%i0,	[%l7 + 0x08]
	fmovrdgz	%o7,	%f26,	%f12
	fandnot2s	%f15,	%f7,	%f10
	ldub	[%l7 + 0x17],	%l6
	alignaddrl	%g2,	%l1,	%l4
	udiv	%g7,	0x086A,	%l5
	movvc	%xcc,	%i5,	%l3
	fcmpes	%fcc0,	%f14,	%f11
	fcmple16	%f2,	%f16,	%g4
	st	%f2,	[%l7 + 0x10]
	edge8n	%g3,	%i4,	%i7
	addcc	%i1,	0x1A56,	%g6
	fsrc2	%f12,	%f16
	add	%o0,	%o3,	%i2
	std	%f0,	[%l7 + 0x30]
	ldx	[%l7 + 0x18],	%o6
	movle	%xcc,	%l0,	%g5
	movle	%xcc,	%g1,	%l2
	andncc	%o4,	%i6,	%o2
	sth	%o1,	[%l7 + 0x32]
	fcmpd	%fcc0,	%f18,	%f28
	fmuld8ulx16	%f0,	%f31,	%f22
	fzero	%f18
	movl	%xcc,	%i3,	%i0
	udivcc	%o7,	0x0E96,	%o5
	edge16	%l6,	%g2,	%l4
	movleu	%icc,	%g7,	%l5
	fmovdvs	%xcc,	%f10,	%f1
	fmovsge	%icc,	%f27,	%f12
	movge	%icc,	%i5,	%l1
	udivx	%g4,	0x181C,	%g3
	movvc	%xcc,	%l3,	%i4
	andcc	%i1,	0x16FF,	%i7
	mulx	%o0,	0x1DFE,	%g6
	movcc	%icc,	%i2,	%o6
	fxors	%f14,	%f12,	%f0
	movleu	%xcc,	%l0,	%o3
	sub	%g5,	%g1,	%l2
	movn	%icc,	%o4,	%i6
	array16	%o1,	%i3,	%o2
	fpsub32	%f30,	%f2,	%f26
	sdivcc	%i0,	0x0F50,	%o7
	fcmped	%fcc0,	%f0,	%f0
	movge	%xcc,	%l6,	%o5
	sdivx	%l4,	0x166D,	%g7
	fcmpes	%fcc0,	%f4,	%f25
	sra	%g2,	%l5,	%i5
	xnorcc	%g4,	%l1,	%l3
	movcc	%icc,	%g3,	%i4
	and	%i1,	0x0B9A,	%o0
	udivx	%i7,	0x10B4,	%g6
	fexpand	%f21,	%f2
	mulx	%i2,	0x1D13,	%l0
	std	%f30,	[%l7 + 0x28]
	edge32	%o6,	%o3,	%g5
	umulcc	%g1,	0x0B83,	%l2
	edge8l	%o4,	%i6,	%i3
	sllx	%o1,	0x0C,	%i0
	ldd	[%l7 + 0x38],	%f0
	addccc	%o2,	0x015B,	%l6
	alignaddr	%o7,	%o5,	%g7
	fmovrslz	%g2,	%f4,	%f1
	movcs	%xcc,	%l5,	%l4
	fand	%f28,	%f8,	%f2
	fnot2s	%f6,	%f1
	andncc	%i5,	%g4,	%l1
	ldsw	[%l7 + 0x64],	%g3
	movpos	%xcc,	%l3,	%i4
	movn	%icc,	%o0,	%i7
	alignaddr	%g6,	%i2,	%i1
	addcc	%l0,	%o6,	%o3
	sdiv	%g5,	0x1C60,	%l2
	and	%g1,	%o4,	%i3
	fpsub32s	%f14,	%f26,	%f15
	fmovdpos	%icc,	%f27,	%f4
	fmovsleu	%xcc,	%f3,	%f5
	edge32l	%o1,	%i0,	%o2
	movvc	%xcc,	%i6,	%l6
	mulx	%o7,	%g7,	%g2
	movn	%icc,	%l5,	%o5
	fpack16	%f0,	%f3
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	movrlez	%l1,	0x0B7,	%l3
	fxnors	%f12,	%f27,	%f0
	ldd	[%l7 + 0x38],	%f20
	addccc	%g3,	0x1F3A,	%o0
	orcc	%i7,	%i4,	%i2
	ldsh	[%l7 + 0x42],	%g6
	fzero	%f4
	smul	%i1,	%l0,	%o6
	lduh	[%l7 + 0x34],	%o3
	fmovdleu	%icc,	%f11,	%f30
	orn	%l2,	%g5,	%g1
	srlx	%o4,	0x1D,	%o1
	ldub	[%l7 + 0x55],	%i0
	edge32n	%i3,	%o2,	%i6
	fornot1s	%f11,	%f9,	%f3
	nop
	set	0x18, %o7
	lduw	[%l7 + %o7],	%o7
	subccc	%l6,	%g2,	%l5
	fabss	%f29,	%f0
	fmul8ulx16	%f18,	%f12,	%f10
	array8	%o5,	%g7,	%i5
	sdivx	%l4,	0x141C,	%g4
	umulcc	%l1,	%l3,	%g3
	fabss	%f16,	%f5
	edge32ln	%i7,	%i4,	%i2
	move	%xcc,	%g6,	%i1
	stw	%o0,	[%l7 + 0x3C]
	mova	%xcc,	%o6,	%o3
	mulscc	%l0,	%l2,	%g1
	umulcc	%g5,	%o1,	%i0
	ldsb	[%l7 + 0x77],	%i3
	fcmple16	%f22,	%f0,	%o2
	smul	%i6,	%o4,	%o7
	mulscc	%l6,	%g2,	%o5
	fmovdvs	%icc,	%f1,	%f15
	subc	%l5,	0x1D69,	%i5
	andcc	%g7,	%l4,	%g4
	edge16	%l1,	%g3,	%l3
	edge32l	%i4,	%i2,	%g6
	lduw	[%l7 + 0x44],	%i1
	movge	%icc,	%i7,	%o0
	ldd	[%l7 + 0x28],	%f4
	fcmpeq16	%f28,	%f10,	%o3
	movg	%icc,	%l0,	%o6
	umulcc	%l2,	%g5,	%g1
	movvc	%icc,	%o1,	%i0
	sllx	%o2,	0x1C,	%i3
	srl	%o4,	0x19,	%i6
	ldx	[%l7 + 0x78],	%l6
	edge8l	%o7,	%g2,	%l5
	or	%i5,	0x1158,	%g7
	lduw	[%l7 + 0x68],	%l4
	andcc	%g4,	0x0822,	%l1
	fmovdle	%xcc,	%f20,	%f8
	movl	%icc,	%o5,	%g3
	movne	%xcc,	%i4,	%l3
	edge16n	%i2,	%i1,	%i7
	movcc	%icc,	%o0,	%o3
	movneg	%xcc,	%l0,	%g6
	movpos	%xcc,	%l2,	%o6
	andncc	%g1,	%g5,	%o1
	movle	%xcc,	%o2,	%i3
	fcmps	%fcc3,	%f28,	%f24
	movpos	%icc,	%o4,	%i6
	movcs	%icc,	%i0,	%l6
	movleu	%icc,	%o7,	%g2
	fandnot2	%f8,	%f10,	%f16
	ld	[%l7 + 0x2C],	%f13
	fxors	%f4,	%f10,	%f24
	movrgz	%l5,	0x32E,	%i5
	xnorcc	%l4,	%g4,	%l1
	srlx	%g7,	%g3,	%o5
	movne	%icc,	%l3,	%i2
	andcc	%i1,	%i4,	%o0
	edge16n	%i7,	%o3,	%g6
	fmovdne	%xcc,	%f31,	%f24
	xnorcc	%l2,	0x1EB8,	%o6
	andcc	%l0,	%g1,	%o1
	movrlez	%g5,	%o2,	%o4
	movrlez	%i6,	0x223,	%i3
	movcs	%xcc,	%l6,	%o7
	alignaddr	%g2,	%l5,	%i5
	movrlez	%i0,	%g4,	%l4
	fmovsa	%xcc,	%f4,	%f16
	xor	%l1,	%g7,	%g3
	movgu	%icc,	%l3,	%o5
	movcs	%icc,	%i2,	%i1
	srlx	%o0,	%i7,	%i4
	fmovsvc	%xcc,	%f11,	%f26
	ldd	[%l7 + 0x08],	%f30
	edge16	%g6,	%l2,	%o3
	movpos	%icc,	%l0,	%o6
	fmul8x16au	%f24,	%f31,	%f22
	andncc	%g1,	%g5,	%o1
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%o2
	fpmerge	%f22,	%f5,	%f16
	nop
	set	0x38, %o5
	lduw	[%l7 + %o5],	%i6
	or	%i3,	%o4,	%o7
	fcmped	%fcc2,	%f8,	%f30
	fnot2	%f28,	%f14
	fpsub16	%f4,	%f4,	%f26
	array16	%g2,	%l6,	%i5
	sir	0x0F27
	fmovdge	%xcc,	%f24,	%f30
	smulcc	%l5,	0x0A60,	%g4
	movrlez	%i0,	%l4,	%l1
	fmovde	%xcc,	%f28,	%f16
	ldsw	[%l7 + 0x6C],	%g3
	movrlz	%g7,	%o5,	%i2
	movle	%icc,	%i1,	%o0
	ldd	[%l7 + 0x70],	%l2
	movcc	%xcc,	%i7,	%g6
	sra	%i4,	0x0B,	%o3
	alignaddr	%l0,	%l2,	%o6
	edge32	%g1,	%g5,	%o1
	or	%o2,	0x0AD9,	%i6
	edge8ln	%o4,	%o7,	%g2
	ldx	[%l7 + 0x20],	%l6
	movre	%i5,	%l5,	%g4
	srlx	%i3,	%l4,	%i0
	movvc	%icc,	%l1,	%g3
	xnorcc	%o5,	%g7,	%i2
	and	%i1,	%l3,	%o0
	stb	%g6,	[%l7 + 0x3D]
	fsrc1	%f18,	%f30
	mulscc	%i7,	0x0E5D,	%i4
	alignaddr	%l0,	%l2,	%o3
	andcc	%o6,	%g1,	%o1
	popc	0x0705,	%o2
	udiv	%g5,	0x08E7,	%o4
	subc	%o7,	%i6,	%g2
	array16	%i5,	%l5,	%l6
	fxor	%f8,	%f16,	%f28
	stw	%i3,	[%l7 + 0x14]
	orncc	%l4,	%g4,	%l1
	ldd	[%l7 + 0x10],	%i0
	movrlz	%o5,	%g3,	%i2
	sllx	%g7,	%l3,	%o0
	addc	%g6,	%i1,	%i7
	addccc	%l0,	%l2,	%i4
	xorcc	%o6,	%o3,	%o1
	array8	%o2,	%g1,	%g5
	ldsw	[%l7 + 0x18],	%o4
	movcs	%xcc,	%o7,	%i6
	movrlez	%g2,	0x160,	%i5
	edge8ln	%l6,	%i3,	%l5
	fors	%f1,	%f28,	%f20
	fabss	%f29,	%f30
	movge	%icc,	%g4,	%l1
	mulscc	%l4,	0x0525,	%o5
	andn	%g3,	0x0886,	%i0
	fmovrsgz	%i2,	%f13,	%f4
	movleu	%xcc,	%l3,	%o0
	movne	%icc,	%g7,	%g6
	restore %i1, 0x1D2F, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f12,	%f4,	%l0
	add	%i4,	%l2,	%o3
	sdivx	%o1,	0x16FC,	%o2
	subccc	%o6,	0x0D8E,	%g5
	xnorcc	%g1,	0x1DF5,	%o7
	edge8	%o4,	%g2,	%i6
	edge32ln	%i5,	%l6,	%l5
	movre	%g4,	%l1,	%i3
	movne	%xcc,	%l4,	%o5
	fzero	%f26
	sllx	%g3,	%i0,	%l3
	edge16l	%i2,	%o0,	%g6
	sdivx	%g7,	0x1A32,	%i1
	movcc	%xcc,	%l0,	%i4
	sdivcc	%l2,	0x08C8,	%o3
	addcc	%i7,	0x1729,	%o2
	sllx	%o1,	0x1F,	%g5
	fpadd32	%f10,	%f30,	%f24
	ldd	[%l7 + 0x08],	%g0
	sdiv	%o7,	0x1528,	%o6
	andncc	%o4,	%i6,	%i5
	xorcc	%g2,	%l6,	%l5
	sth	%l1,	[%l7 + 0x16]
	edge8n	%g4,	%i3,	%l4
	alignaddr	%o5,	%g3,	%i0
	bshuffle	%f12,	%f14,	%f22
	mulx	%l3,	0x08D9,	%i2
	movrgez	%g6,	0x1CC,	%o0
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%f6
	lduw	[%l7 + 0x20],	%g7
	fmovsge	%icc,	%f26,	%f6
	orncc	%l0,	%i1,	%l2
	subcc	%i4,	%i7,	%o3
	edge8l	%o1,	%o2,	%g1
	xorcc	%o7,	0x0C54,	%o6
	movcs	%icc,	%o4,	%g5
	edge16n	%i6,	%i5,	%g2
	edge32l	%l6,	%l5,	%g4
	xnor	%i3,	%l4,	%l1
	and	%g3,	0x1776,	%o5
	mulscc	%i0,	%i2,	%l3
	movn	%xcc,	%g6,	%g7
	fabsd	%f10,	%f22
	fabsd	%f14,	%f8
	fmovda	%xcc,	%f8,	%f22
	fnors	%f28,	%f0,	%f17
	movg	%xcc,	%l0,	%i1
	edge8l	%o0,	%i4,	%i7
	srl	%o3,	0x01,	%o1
	fmovdne	%xcc,	%f1,	%f10
	fmovda	%xcc,	%f7,	%f8
	save %o2, %g1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f6,	%f11
	srlx	%l2,	%o4,	%o6
	andn	%i6,	0x1090,	%i5
	sth	%g2,	[%l7 + 0x5A]
	movrgz	%g5,	0x039,	%l6
	movpos	%xcc,	%g4,	%l5
	sdiv	%l4,	0x0B61,	%l1
	udivx	%i3,	0x14B5,	%o5
	andn	%i0,	0x0D1C,	%i2
	fmuld8ulx16	%f22,	%f24,	%f22
	ld	[%l7 + 0x7C],	%f0
	std	%f18,	[%l7 + 0x48]
	ldsw	[%l7 + 0x54],	%l3
	movvc	%icc,	%g3,	%g7
	faligndata	%f4,	%f26,	%f30
	array8	%l0,	%g6,	%i1
	fcmpgt16	%f10,	%f4,	%o0
	sllx	%i7,	%o3,	%o1
	orcc	%i4,	0x19FD,	%o2
	std	%f24,	[%l7 + 0x58]
	fcmpne32	%f12,	%f28,	%g1
	nop
	set	0x4C, %i2
	stw	%o7,	[%l7 + %i2]
	edge32ln	%o4,	%o6,	%i6
	lduh	[%l7 + 0x5A],	%i5
	movgu	%xcc,	%g2,	%g5
	mulscc	%l2,	0x1E8E,	%g4
	sll	%l6,	%l4,	%l5
	movle	%icc,	%i3,	%o5
	edge16n	%l1,	%i0,	%l3
	array16	%g3,	%i2,	%g7
	smulcc	%g6,	%i1,	%o0
	stb	%l0,	[%l7 + 0x73]
	andn	%i7,	%o3,	%o1
	movpos	%icc,	%i4,	%o2
	fpsub16	%f2,	%f26,	%f30
	stx	%o7,	[%l7 + 0x08]
	sethi	0x164C,	%g1
	movne	%xcc,	%o4,	%o6
	alignaddr	%i5,	%g2,	%g5
	ldx	[%l7 + 0x30],	%i6
	fmovda	%xcc,	%f15,	%f12
	andcc	%l2,	0x132D,	%g4
	edge32l	%l6,	%l4,	%l5
	fmovdneg	%icc,	%f12,	%f17
	andcc	%o5,	%i3,	%i0
	fmul8x16au	%f3,	%f3,	%f14
	movrlz	%l3,	0x2BD,	%g3
	addcc	%i2,	0x0759,	%g7
	stw	%g6,	[%l7 + 0x78]
	xnorcc	%i1,	%l1,	%l0
	fmovsle	%xcc,	%f6,	%f18
	movrne	%o0,	0x124,	%i7
	fcmps	%fcc2,	%f12,	%f4
	array16	%o3,	%i4,	%o1
	popc	%o7,	%o2
	edge8n	%g1,	%o6,	%o4
	addcc	%i5,	%g2,	%i6
	fmovrsgez	%l2,	%f21,	%f16
	movrne	%g4,	%l6,	%g5
	mulx	%l4,	0x06F0,	%o5
	xnor	%i3,	0x10E6,	%i0
	orncc	%l3,	%l5,	%g3
	subcc	%i2,	%g6,	%i1
	orncc	%l1,	%l0,	%o0
	sir	0x0468
	array8	%i7,	%g7,	%o3
	fnot2s	%f17,	%f25
	edge16ln	%i4,	%o1,	%o2
	srlx	%o7,	%o6,	%g1
	srlx	%o4,	0x0C,	%i5
	fmovdvc	%xcc,	%f8,	%f17
	array8	%i6,	%g2,	%g4
	sll	%l6,	0x15,	%l2
	umul	%l4,	0x1355,	%g5
	udivx	%i3,	0x1DD5,	%o5
	fmovrsgez	%i0,	%f0,	%f6
	smul	%l3,	0x01A8,	%l5
	smulcc	%g3,	%g6,	%i1
	srlx	%l1,	%l0,	%o0
	ld	[%l7 + 0x30],	%f1
	orcc	%i7,	%i2,	%o3
	fmovsleu	%icc,	%f8,	%f2
	movrlz	%g7,	%o1,	%o2
	edge32n	%o7,	%i4,	%g1
	addcc	%o4,	0x0BA4,	%i5
	edge16	%i6,	%g2,	%g4
	stb	%l6,	[%l7 + 0x48]
	edge32ln	%l2,	%l4,	%o6
	edge32l	%i3,	%o5,	%i0
	edge16ln	%l3,	%l5,	%g3
	ldsh	[%l7 + 0x44],	%g5
	edge8ln	%g6,	%i1,	%l1
	movrlz	%l0,	%i7,	%i2
	sdivcc	%o3,	0x182B,	%o0
	sllx	%g7,	0x08,	%o2
	movle	%icc,	%o1,	%i4
	mova	%xcc,	%o7,	%g1
	movrlez	%o4,	0x338,	%i5
	movre	%g2,	%i6,	%l6
	mova	%icc,	%l2,	%g4
	xnorcc	%l4,	0x1F0B,	%i3
	movg	%icc,	%o6,	%i0
	movne	%icc,	%l3,	%o5
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	movle	%xcc,	%g5,	%g6
	movl	%xcc,	%l1,	%i1
	fmovdn	%icc,	%f12,	%f20
	fmovsvs	%xcc,	%f27,	%f15
	array32	%i7,	%i2,	%l0
	edge32n	%o3,	%g7,	%o0
	movg	%icc,	%o2,	%i4
	edge16l	%o1,	%g1,	%o7
	sll	%i5,	%g2,	%o4
	ldub	[%l7 + 0x72],	%l6
	fmovdge	%icc,	%f9,	%f11
	array32	%i6,	%l2,	%g4
	sra	%l4,	%i3,	%i0
	fmovscs	%icc,	%f23,	%f31
	movvs	%xcc,	%o6,	%o5
	fmovdcc	%xcc,	%f27,	%f30
	xnorcc	%g3,	%l5,	%l3
	move	%xcc,	%g6,	%g5
	fones	%f11
	movl	%icc,	%i1,	%l1
	fpadd16	%f6,	%f30,	%f0
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%f14
	srl	%i2,	%i7,	%l0
	udiv	%g7,	0x0B10,	%o0
	movgu	%icc,	%o2,	%o3
	edge16ln	%i4,	%g1,	%o1
	fsrc1	%f26,	%f0
	array32	%o7,	%g2,	%i5
	fcmped	%fcc2,	%f22,	%f20
	array8	%l6,	%o4,	%l2
	edge32l	%g4,	%i6,	%i3
	addcc	%i0,	0x07F5,	%o6
	sllx	%l4,	0x0E,	%g3
	srlx	%l5,	0x0A,	%o5
	ldx	[%l7 + 0x48],	%g6
	movleu	%icc,	%g5,	%i1
	sdivcc	%l3,	0x0728,	%i2
	sub	%l1,	0x0A40,	%i7
	fmovrsne	%g7,	%f14,	%f19
	movrlz	%l0,	0x2BD,	%o2
	fxors	%f29,	%f13,	%f14
	fzeros	%f16
	fsrc2	%f14,	%f30
	xorcc	%o3,	0x110C,	%i4
	subccc	%o0,	%o1,	%o7
	edge32l	%g1,	%g2,	%l6
	edge8l	%i5,	%o4,	%l2
	movrlz	%i6,	%g4,	%i0
	movvc	%icc,	%i3,	%l4
	fcmped	%fcc0,	%f26,	%f6
	array8	%g3,	%l5,	%o6
	popc	%o5,	%g6
	udiv	%i1,	0x0768,	%l3
	array8	%i2,	%g5,	%i7
	siam	0x4
	fmul8x16	%f19,	%f6,	%f14
	stb	%l1,	[%l7 + 0x6E]
	movge	%icc,	%g7,	%o2
	andcc	%l0,	%i4,	%o0
	fmovrse	%o1,	%f24,	%f5
	fmovdpos	%xcc,	%f21,	%f24
	udivcc	%o7,	0x1B89,	%o3
	save %g1, %g2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f4,	%f13
	xnor	%o4,	%l2,	%l6
	movrne	%g4,	0x16A,	%i6
	movle	%xcc,	%i0,	%i3
	sra	%g3,	0x1C,	%l4
	fabsd	%f2,	%f18
	movge	%icc,	%o6,	%l5
	andncc	%g6,	%o5,	%l3
	movvc	%xcc,	%i1,	%i2
	smul	%g5,	%i7,	%l1
	addcc	%g7,	0x0340,	%o2
	fmovsvs	%icc,	%f30,	%f2
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%f2
	popc	%i4,	%l0
	movleu	%icc,	%o0,	%o1
	smul	%o7,	%o3,	%g2
	movrgez	%i5,	%o4,	%g1
	mulx	%l2,	%g4,	%l6
	edge32ln	%i0,	%i6,	%g3
	edge32l	%i3,	%l4,	%o6
	movvc	%xcc,	%l5,	%o5
	ldx	[%l7 + 0x50],	%g6
	add	%l3,	%i2,	%g5
	movrlez	%i1,	%i7,	%g7
	sdiv	%l1,	0x1A4C,	%o2
	ldsb	[%l7 + 0x4B],	%i4
	movg	%xcc,	%o0,	%o1
	edge8	%l0,	%o7,	%o3
	movrgez	%i5,	0x3AE,	%g2
	umulcc	%g1,	0x0394,	%o4
	movrne	%g4,	%l6,	%i0
	edge32	%l2,	%i6,	%i3
	edge32	%g3,	%l4,	%l5
	ldd	[%l7 + 0x70],	%o6
	stb	%o5,	[%l7 + 0x7F]
	movgu	%xcc,	%g6,	%l3
	mulscc	%i2,	0x075A,	%g5
	stx	%i7,	[%l7 + 0x18]
	fmovdn	%icc,	%f19,	%f18
	fnor	%f0,	%f2,	%f2
	fandnot1s	%f1,	%f1,	%f23
	ldd	[%l7 + 0x78],	%g6
	movle	%xcc,	%l1,	%o2
	fmovdn	%icc,	%f9,	%f15
	and	%i4,	0x1783,	%i1
	movneg	%icc,	%o1,	%l0
	movrne	%o0,	%o3,	%o7
	movne	%xcc,	%i5,	%g1
	movn	%icc,	%o4,	%g4
	movne	%xcc,	%g2,	%l6
	movvs	%xcc,	%l2,	%i0
	movrne	%i3,	%g3,	%l4
	fmovrde	%l5,	%f0,	%f4
	sdivx	%o6,	0x042B,	%o5
	edge16l	%i6,	%g6,	%l3
	sethi	0x1CA2,	%i2
	edge32l	%g5,	%g7,	%l1
	sub	%i7,	%o2,	%i1
	fcmpgt32	%f10,	%f14,	%o1
	fcmpgt16	%f24,	%f20,	%i4
	fpsub16	%f28,	%f30,	%f4
	movn	%xcc,	%o0,	%o3
	movre	%o7,	%i5,	%l0
	fmovdl	%xcc,	%f16,	%f30
	edge16ln	%g1,	%g4,	%g2
	movvc	%icc,	%o4,	%l6
	fmovsvc	%icc,	%f8,	%f21
	fornot1s	%f3,	%f15,	%f31
	restore %l2, 0x0DEC, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g3, %l4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	movn	%icc,	%i6,	%g6
	stw	%l3,	[%l7 + 0x4C]
	subcc	%g5,	%i2,	%g7
	sll	%i7,	%l1,	%i1
	fmovrsgez	%o2,	%f13,	%f27
	edge16ln	%o1,	%i4,	%o3
	sdivx	%o0,	0x15A2,	%i5
	ldd	[%l7 + 0x78],	%f10
	movg	%xcc,	%l0,	%o7
	fnand	%f8,	%f0,	%f2
	move	%icc,	%g1,	%g4
	fmovdcc	%icc,	%f20,	%f12
	fmovdneg	%icc,	%f12,	%f24
	ldsw	[%l7 + 0x10],	%g2
	edge16ln	%l6,	%o4,	%i3
	smul	%g3,	0x1147,	%l2
	alignaddrl	%l4,	%l5,	%o6
	fandnot2s	%f0,	%f31,	%f13
	movcc	%icc,	%i0,	%i6
	xorcc	%o5,	0x1E6C,	%l3
	fmovda	%xcc,	%f30,	%f3
	sra	%g6,	0x0D,	%i2
	stb	%g5,	[%l7 + 0x49]
	fnot1	%f2,	%f10
	sethi	0x1E71,	%i7
	popc	%g7,	%l1
	movle	%icc,	%o2,	%o1
	umulcc	%i1,	%o3,	%i4
	addc	%o0,	%l0,	%o7
	array32	%g1,	%i5,	%g4
	srax	%g2,	%o4,	%l6
	andn	%i3,	0x17E6,	%g3
	movpos	%xcc,	%l4,	%l2
	st	%f20,	[%l7 + 0x50]
	srax	%l5,	0x18,	%o6
	sll	%i0,	0x09,	%o5
	sdiv	%l3,	0x0C45,	%i6
	edge8l	%i2,	%g6,	%g5
	fmovdge	%xcc,	%f26,	%f22
	array16	%g7,	%l1,	%i7
	movge	%xcc,	%o2,	%i1
	fxor	%f20,	%f2,	%f6
	save %o3, 0x0AC4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f8,	%f22,	%o0
	array16	%l0,	%o7,	%g1
	movpos	%icc,	%o1,	%g4
	sub	%i5,	0x1687,	%o4
	fmovsne	%xcc,	%f0,	%f8
	fcmpeq16	%f6,	%f16,	%l6
	movne	%icc,	%g2,	%i3
	movrne	%l4,	%g3,	%l2
	sdivcc	%o6,	0x0C6C,	%l5
	edge16l	%i0,	%o5,	%l3
	edge16n	%i2,	%g6,	%i6
	sll	%g7,	0x02,	%g5
	ldsw	[%l7 + 0x60],	%i7
	ldd	[%l7 + 0x60],	%o2
	or	%l1,	0x039A,	%o3
	fcmpgt32	%f8,	%f28,	%i4
	fnegs	%f17,	%f24
	sllx	%o0,	0x10,	%i1
	fnot1	%f22,	%f28
	smul	%l0,	0x123D,	%o7
	move	%xcc,	%o1,	%g4
	fmovrdlz	%g1,	%f16,	%f20
	mulx	%o4,	%i5,	%l6
	movg	%xcc,	%g2,	%i3
	fcmpgt16	%f28,	%f8,	%l4
	fmuld8ulx16	%f30,	%f15,	%f16
	umulcc	%g3,	0x087E,	%l2
	add	%o6,	0x1CB0,	%i0
	fexpand	%f11,	%f0
	movre	%l5,	0x3A5,	%o5
	fcmpeq16	%f0,	%f20,	%l3
	sub	%g6,	0x1978,	%i6
	sir	0x0441
	sth	%g7,	[%l7 + 0x7C]
	sethi	0x0190,	%g5
	edge16n	%i2,	%i7,	%l1
	fmovsl	%xcc,	%f7,	%f8
	ldx	[%l7 + 0x70],	%o3
	movrgez	%i4,	0x382,	%o0
	edge8	%i1,	%l0,	%o2
	fzeros	%f5
	fnot2	%f10,	%f0
	lduw	[%l7 + 0x10],	%o1
	mova	%icc,	%g4,	%o7
	fmovrslez	%g1,	%f19,	%f12
	st	%f30,	[%l7 + 0x48]
	edge8	%i5,	%o4,	%l6
	sdiv	%g2,	0x1D5E,	%l4
	orncc	%g3,	0x1542,	%l2
	movl	%icc,	%i3,	%o6
	xorcc	%i0,	0x1D90,	%o5
	umul	%l3,	0x1CD2,	%l5
	siam	0x2
	array8	%g6,	%i6,	%g5
	lduw	[%l7 + 0x34],	%g7
	alignaddrl	%i2,	%l1,	%o3
	fcmpne16	%f2,	%f6,	%i4
	sdiv	%o0,	0x1B51,	%i1
	movneg	%icc,	%l0,	%o2
	fnegd	%f26,	%f26
	edge32	%o1,	%i7,	%g4
	stw	%g1,	[%l7 + 0x30]
	edge32ln	%i5,	%o7,	%l6
	srax	%g2,	0x16,	%l4
	array8	%o4,	%g3,	%i3
	sllx	%o6,	0x0D,	%l2
	edge16	%o5,	%i0,	%l5
	array32	%l3,	%g6,	%i6
	nop
	set	0x58, %g1
	stx	%g5,	[%l7 + %g1]
	lduw	[%l7 + 0x68],	%g7
	xnor	%l1,	%o3,	%i4
	sdivcc	%i2,	0x04E5,	%i1
	fmovdle	%icc,	%f23,	%f17
	movrne	%l0,	0x17F,	%o2
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%o0
	mulx	%i7,	0x01B6,	%g4
	fmovse	%xcc,	%f22,	%f22
	srlx	%o1,	%g1,	%i5
	umulcc	%o7,	%g2,	%l4
	edge16l	%l6,	%g3,	%i3
	edge8	%o6,	%o4,	%o5
	sir	0x159C
	sir	0x1525
	fornot2s	%f12,	%f17,	%f8
	movg	%icc,	%l2,	%l5
	fnot2	%f24,	%f28
	movpos	%icc,	%l3,	%g6
	sethi	0x1615,	%i0
	movge	%icc,	%g5,	%i6
	smul	%l1,	0x173D,	%o3
	sdivcc	%i4,	0x1323,	%g7
	movne	%icc,	%i2,	%l0
	or	%o2,	%o0,	%i1
	sdiv	%g4,	0x187B,	%o1
	nop
	set	0x6A, %l5
	stb	%g1,	[%l7 + %l5]
	smul	%i5,	0x1A96,	%o7
	subcc	%i7,	%l4,	%g2
	stx	%g3,	[%l7 + 0x30]
	edge16ln	%i3,	%o6,	%o4
	std	%f18,	[%l7 + 0x10]
	sllx	%o5,	%l2,	%l5
	ldsh	[%l7 + 0x4A],	%l6
	edge32	%g6,	%i0,	%g5
	andn	%i6,	%l3,	%l1
	or	%i4,	%o3,	%i2
	edge8n	%l0,	%o2,	%o0
	pdist	%f2,	%f4,	%f20
	movrlz	%g7,	%g4,	%i1
	fsrc1	%f16,	%f16
	umulcc	%o1,	%i5,	%g1
	subcc	%o7,	0x1459,	%l4
	and	%g2,	%i7,	%i3
	save %g3, %o4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o5,	0x0680,	%l5
	movpos	%icc,	%l6,	%g6
	edge8	%i0,	%g5,	%l2
	ldsb	[%l7 + 0x63],	%l3
	st	%f21,	[%l7 + 0x4C]
	fmovsa	%xcc,	%f6,	%f24
	mulscc	%l1,	%i4,	%o3
	st	%f25,	[%l7 + 0x08]
	fcmple32	%f20,	%f16,	%i6
	edge8n	%l0,	%i2,	%o0
	stx	%g7,	[%l7 + 0x50]
	stw	%o2,	[%l7 + 0x0C]
	fmovrslz	%i1,	%f5,	%f19
	subcc	%g4,	0x1D73,	%o1
	edge16n	%g1,	%o7,	%i5
	stx	%l4,	[%l7 + 0x38]
	addccc	%i7,	0x0AC6,	%i3
	movle	%xcc,	%g3,	%g2
	movneg	%xcc,	%o4,	%o5
	sth	%l5,	[%l7 + 0x30]
	srlx	%o6,	%g6,	%i0
	sethi	0x16FD,	%g5
	stw	%l6,	[%l7 + 0x60]
	sdiv	%l3,	0x0D61,	%l1
	smulcc	%i4,	0x0882,	%l2
	std	%f16,	[%l7 + 0x08]
	fmovdne	%xcc,	%f1,	%f5
	array16	%i6,	%o3,	%i2
	fmovdvc	%icc,	%f10,	%f20
	st	%f21,	[%l7 + 0x18]
	movcs	%icc,	%o0,	%l0
	fmovsle	%icc,	%f10,	%f11
	sdivcc	%g7,	0x104A,	%i1
	fcmpes	%fcc1,	%f8,	%f10
	edge16l	%g4,	%o1,	%o2
	move	%icc,	%o7,	%g1
	movn	%xcc,	%i5,	%l4
	add	%i3,	%i7,	%g3
	nop
	set	0x76, %i7
	ldsb	[%l7 + %i7],	%g2
	stw	%o4,	[%l7 + 0x2C]
	edge8l	%o5,	%o6,	%l5
	xor	%g6,	0x1B72,	%i0
	stw	%l6,	[%l7 + 0x7C]
	edge32l	%g5,	%l1,	%i4
	sub	%l3,	0x1EB3,	%l2
	mova	%icc,	%o3,	%i6
	ldd	[%l7 + 0x48],	%i2
	srlx	%l0,	0x1A,	%g7
	movle	%icc,	%o0,	%g4
	stw	%o1,	[%l7 + 0x3C]
	fnors	%f11,	%f31,	%f17
	nop
	set	0x5E, %l3
	ldsh	[%l7 + %l3],	%i1
	xnorcc	%o7,	0x0014,	%g1
	std	%f28,	[%l7 + 0x20]
	fandnot2	%f6,	%f6,	%f24
	bshuffle	%f20,	%f16,	%f16
	smul	%o2,	%i5,	%i3
	fmovsneg	%icc,	%f16,	%f19
	fmuld8sux16	%f2,	%f24,	%f30
	movgu	%icc,	%l4,	%i7
	fpsub32s	%f25,	%f12,	%f26
	fmovsa	%xcc,	%f15,	%f17
	sll	%g2,	0x00,	%g3
	fmovsneg	%xcc,	%f29,	%f14
	subc	%o4,	0x1A76,	%o6
	umul	%l5,	%g6,	%i0
	movvc	%xcc,	%l6,	%g5
	bshuffle	%f12,	%f28,	%f28
	edge16n	%o5,	%l1,	%i4
	movcs	%xcc,	%l3,	%o3
	fpadd32	%f20,	%f20,	%f22
	movge	%icc,	%i6,	%i2
	srl	%l0,	0x10,	%g7
	fmovd	%f20,	%f12
	movcc	%icc,	%o0,	%l2
	for	%f28,	%f14,	%f14
	sll	%o1,	%i1,	%g4
	fxor	%f28,	%f2,	%f2
	srl	%o7,	%o2,	%i5
	xnorcc	%g1,	%l4,	%i3
	xnor	%g2,	%g3,	%i7
	movrlez	%o6,	%o4,	%g6
	fsrc2s	%f0,	%f10
	fmovrdlz	%i0,	%f8,	%f24
	ldd	[%l7 + 0x60],	%f10
	addcc	%l5,	0x147B,	%l6
	for	%f28,	%f28,	%f16
	mulx	%o5,	%g5,	%i4
	stx	%l1,	[%l7 + 0x10]
	alignaddr	%l3,	%o3,	%i2
	restore %l0, %i6, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l2,	%o1,	%o0
	fmovsvc	%xcc,	%f0,	%f20
	movl	%icc,	%g4,	%i1
	ldx	[%l7 + 0x20],	%o2
	andcc	%i5,	0x08A3,	%o7
	movn	%xcc,	%g1,	%l4
	srax	%g2,	0x18,	%g3
	movl	%xcc,	%i3,	%i7
	srlx	%o6,	%o4,	%i0
	fands	%f10,	%f11,	%f15
	bshuffle	%f30,	%f0,	%f20
	sdivcc	%g6,	0x1E02,	%l5
	lduh	[%l7 + 0x42],	%l6
	fmovdneg	%icc,	%f5,	%f8
	edge32	%g5,	%i4,	%o5
	move	%xcc,	%l1,	%l3
	orcc	%i2,	%o3,	%l0
	fpadd32s	%f7,	%f27,	%f29
	movrgez	%g7,	0x332,	%i6
	umul	%l2,	0x10A0,	%o0
	subcc	%o1,	%g4,	%o2
	edge16ln	%i5,	%o7,	%i1
	edge16ln	%l4,	%g1,	%g2
	faligndata	%f12,	%f0,	%f10
	movl	%icc,	%i3,	%g3
	array32	%i7,	%o6,	%i0
	nop
	set	0x0C, %i0
	stb	%g6,	[%l7 + %i0]
	subcc	%l5,	%o4,	%l6
	movpos	%xcc,	%i4,	%o5
	edge16	%l1,	%g5,	%i2
	edge16n	%l3,	%o3,	%l0
	ldd	[%l7 + 0x08],	%i6
	fnegs	%f0,	%f14
	movl	%xcc,	%l2,	%g7
	umulcc	%o1,	0x058B,	%g4
	edge16n	%o0,	%o2,	%i5
	fmovdneg	%xcc,	%f30,	%f20
	edge8n	%i1,	%l4,	%o7
	sdiv	%g1,	0x19B3,	%i3
	fmovrslez	%g2,	%f30,	%f26
	stb	%i7,	[%l7 + 0x13]
	fnors	%f25,	%f5,	%f23
	movle	%icc,	%o6,	%g3
	orncc	%i0,	%g6,	%l5
	srlx	%l6,	%o4,	%o5
	srlx	%l1,	0x0D,	%i4
	ld	[%l7 + 0x5C],	%f20
	movrlz	%i2,	%g5,	%o3
	orncc	%l0,	0x1866,	%i6
	ldd	[%l7 + 0x48],	%f16
	sdiv	%l2,	0x0282,	%l3
	xnorcc	%g7,	%o1,	%g4
	edge8ln	%o2,	%o0,	%i1
	subcc	%i5,	%o7,	%l4
	sra	%g1,	%i3,	%i7
	lduh	[%l7 + 0x08],	%g2
	xnorcc	%o6,	%i0,	%g6
	movvs	%icc,	%g3,	%l6
	andncc	%o4,	%o5,	%l1
	movg	%xcc,	%i4,	%l5
	fmovdne	%icc,	%f27,	%f15
	add	%g5,	0x050F,	%i2
	fmovrsgz	%o3,	%f6,	%f2
	edge32ln	%l0,	%l2,	%l3
	edge32n	%g7,	%o1,	%g4
	edge16	%o2,	%i6,	%o0
	lduw	[%l7 + 0x74],	%i5
	edge32	%o7,	%i1,	%g1
	fones	%f6
	array32	%l4,	%i7,	%g2
	movvs	%xcc,	%i3,	%o6
	nop
	set	0x64, %o4
	lduw	[%l7 + %o4],	%g6
	sdiv	%g3,	0x091B,	%i0
	st	%f12,	[%l7 + 0x54]
	fsrc2	%f24,	%f10
	fexpand	%f7,	%f10
	fmovdneg	%icc,	%f22,	%f24
	ldsb	[%l7 + 0x33],	%o4
	move	%icc,	%o5,	%l6
	xnor	%i4,	%l1,	%l5
	edge16n	%i2,	%o3,	%l0
	fmul8x16al	%f16,	%f10,	%f24
	std	%f6,	[%l7 + 0x48]
	movle	%xcc,	%g5,	%l2
	fmovdg	%icc,	%f16,	%f12
	fpadd32	%f6,	%f0,	%f20
	xnorcc	%g7,	0x0D66,	%o1
	xorcc	%l3,	0x00B8,	%g4
	movrgz	%i6,	0x259,	%o2
	andncc	%o0,	%o7,	%i1
	movpos	%icc,	%g1,	%l4
	fmovrdgez	%i5,	%f24,	%f16
	fmul8ulx16	%f20,	%f22,	%f22
	fmovdcc	%xcc,	%f17,	%f25
	fmovsa	%icc,	%f22,	%f17
	addccc	%i7,	%i3,	%g2
	edge32	%g6,	%g3,	%o6
	sra	%o4,	%i0,	%o5
	udiv	%i4,	0x12F7,	%l6
	movneg	%icc,	%l5,	%i2
	movg	%icc,	%o3,	%l1
	sll	%g5,	%l2,	%l0
	movrlez	%g7,	%o1,	%g4
	ldsh	[%l7 + 0x64],	%i6
	fmovrslz	%o2,	%f5,	%f20
	fmovsn	%xcc,	%f15,	%f26
	ldd	[%l7 + 0x70],	%f18
	movre	%o0,	%l3,	%o7
	fandnot2	%f28,	%f8,	%f26
	fandnot1	%f30,	%f8,	%f28
	sra	%i1,	0x0A,	%g1
	fmovde	%xcc,	%f2,	%f25
	udiv	%l4,	0x03ED,	%i7
	fmovdneg	%xcc,	%f20,	%f27
	movle	%icc,	%i3,	%i5
	movg	%xcc,	%g6,	%g2
	fsrc2s	%f9,	%f14
	mulx	%o6,	0x02BF,	%o4
	movl	%xcc,	%g3,	%i0
	popc	%i4,	%o5
	srax	%l5,	0x09,	%l6
	smulcc	%o3,	%i2,	%g5
	fcmple32	%f14,	%f24,	%l1
	movrgz	%l0,	%g7,	%o1
	orncc	%l2,	%g4,	%o2
	lduw	[%l7 + 0x40],	%i6
	movl	%icc,	%l3,	%o0
	sth	%i1,	[%l7 + 0x1C]
	orn	%o7,	0x19DF,	%g1
	movrne	%l4,	0x3A5,	%i7
	movre	%i3,	%g6,	%g2
	array8	%o6,	%i5,	%g3
	fsrc1	%f26,	%f28
	subcc	%i0,	%i4,	%o5
	ldsb	[%l7 + 0x72],	%l5
	fcmped	%fcc1,	%f4,	%f16
	ldsh	[%l7 + 0x0A],	%l6
	fmovsg	%icc,	%f1,	%f8
	edge8n	%o4,	%o3,	%i2
	udivcc	%g5,	0x1BF0,	%l0
	sir	0x16D9
	ldx	[%l7 + 0x38],	%l1
	movge	%xcc,	%o1,	%g7
	std	%f10,	[%l7 + 0x28]
	addccc	%l2,	0x05CC,	%o2
	movre	%g4,	0x3A7,	%l3
	stw	%o0,	[%l7 + 0x3C]
	fxor	%f12,	%f2,	%f0
	andn	%i1,	0x1633,	%i6
	edge16l	%o7,	%g1,	%i7
	sllx	%l4,	%g6,	%g2
	movrgez	%i3,	%i5,	%o6
	fmuld8ulx16	%f8,	%f14,	%f20
	srlx	%g3,	0x11,	%i4
	ldd	[%l7 + 0x38],	%o4
	srl	%i0,	0x18,	%l5
	movn	%xcc,	%o4,	%l6
	fmovse	%xcc,	%f28,	%f15
	mulx	%i2,	%g5,	%l0
	orncc	%l1,	%o1,	%g7
	movcc	%xcc,	%l2,	%o2
	stx	%o3,	[%l7 + 0x18]
	fmovsgu	%xcc,	%f4,	%f23
	subc	%l3,	%g4,	%i1
	fmovdvc	%xcc,	%f15,	%f6
	umul	%i6,	%o0,	%o7
	std	%f20,	[%l7 + 0x40]
	fnegd	%f16,	%f24
	array32	%g1,	%i7,	%l4
	movcc	%icc,	%g6,	%g2
	edge16	%i3,	%i5,	%o6
	sth	%g3,	[%l7 + 0x74]
	movre	%o5,	0x20E,	%i0
	lduh	[%l7 + 0x34],	%l5
	sir	0x1134
	fxor	%f28,	%f24,	%f0
	edge32n	%o4,	%l6,	%i4
	movvs	%icc,	%i2,	%g5
	fors	%f11,	%f20,	%f17
	fmovrde	%l0,	%f18,	%f8
	fandnot1s	%f6,	%f23,	%f9
	fnot2s	%f6,	%f26
	fpsub16s	%f24,	%f27,	%f22
	movl	%icc,	%o1,	%g7
	edge8ln	%l1,	%l2,	%o2
	movre	%l3,	%o3,	%i1
	xorcc	%g4,	%o0,	%o7
	std	%f4,	[%l7 + 0x08]
	lduw	[%l7 + 0x18],	%g1
	sll	%i6,	%l4,	%i7
	std	%f0,	[%l7 + 0x10]
	ldub	[%l7 + 0x55],	%g6
	sethi	0x0BD3,	%g2
	mulscc	%i3,	%o6,	%i5
	and	%o5,	0x1A20,	%g3
	edge16ln	%l5,	%o4,	%i0
	bshuffle	%f16,	%f8,	%f20
	srl	%i4,	0x02,	%i2
	movrne	%g5,	0x243,	%l0
	smul	%o1,	0x0515,	%g7
	lduw	[%l7 + 0x20],	%l6
	fornot1s	%f26,	%f16,	%f24
	fmovdle	%icc,	%f25,	%f16
	xorcc	%l1,	0x0B6A,	%o2
	sth	%l2,	[%l7 + 0x46]
	edge32ln	%o3,	%i1,	%g4
	lduh	[%l7 + 0x58],	%o0
	subc	%l3,	0x0474,	%o7
	ld	[%l7 + 0x4C],	%f16
	edge8n	%i6,	%l4,	%i7
	orn	%g6,	%g1,	%g2
	movle	%icc,	%o6,	%i5
	movge	%xcc,	%o5,	%i3
	sth	%l5,	[%l7 + 0x18]
	fmovrslez	%g3,	%f29,	%f18
	lduh	[%l7 + 0x1A],	%i0
	addc	%o4,	0x1A8A,	%i2
	fmovdgu	%icc,	%f2,	%f22
	orncc	%g5,	0x19CC,	%i4
	ldsw	[%l7 + 0x74],	%o1
	ldsb	[%l7 + 0x48],	%l0
	popc	%g7,	%l6
	ldd	[%l7 + 0x60],	%f24
	fsrc1s	%f1,	%f27
	fcmple32	%f18,	%f26,	%l1
	addc	%o2,	0x1D88,	%l2
	lduw	[%l7 + 0x08],	%i1
	orncc	%g4,	0x007C,	%o0
	sdivcc	%l3,	0x0AD2,	%o7
	fnand	%f22,	%f28,	%f8
	addcc	%o3,	0x14FF,	%i6
	edge32ln	%i7,	%g6,	%l4
	subccc	%g2,	0x0402,	%g1
	addccc	%o6,	%o5,	%i5
	addccc	%i3,	%g3,	%i0
	ldx	[%l7 + 0x60],	%o4
	fmovdn	%xcc,	%f7,	%f18
	srl	%l5,	%g5,	%i2
	array32	%o1,	%i4,	%g7
	ldx	[%l7 + 0x70],	%l6
	edge32ln	%l1,	%l0,	%o2
	edge32l	%l2,	%i1,	%o0
	lduh	[%l7 + 0x72],	%l3
	save %o7, 0x017B, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i6,	%o3,	%g6
	orn	%l4,	%g2,	%g1
	ldx	[%l7 + 0x40],	%o6
	movpos	%icc,	%o5,	%i5
	ldsh	[%l7 + 0x44],	%i7
	popc	%g3,	%i0
	orcc	%i3,	%o4,	%g5
	xnorcc	%l5,	0x123F,	%o1
	udiv	%i4,	0x11B5,	%g7
	fcmpeq16	%f10,	%f24,	%l6
	sdivcc	%i2,	0x0CF6,	%l0
	alignaddrl	%o2,	%l1,	%l2
	fmovsvs	%xcc,	%f23,	%f3
	umulcc	%i1,	0x083F,	%l3
	umulcc	%o0,	%o7,	%i6
	fmovdvc	%xcc,	%f1,	%f15
	edge8l	%o3,	%g6,	%l4
	nop
	set	0x40, %l6
	ldx	[%l7 + %l6],	%g4
	fpadd32	%f26,	%f30,	%f8
	movn	%xcc,	%g1,	%g2
	andcc	%o5,	%i5,	%o6
	st	%f1,	[%l7 + 0x1C]
	movn	%xcc,	%i7,	%g3
	addccc	%i3,	%i0,	%o4
	fones	%f6
	xnorcc	%l5,	%g5,	%o1
	addc	%i4,	%l6,	%i2
	fmovsl	%icc,	%f15,	%f3
	udivcc	%l0,	0x1C40,	%o2
	fcmpne16	%f14,	%f12,	%l1
	ldsh	[%l7 + 0x08],	%g7
	ldsb	[%l7 + 0x13],	%l2
	ldd	[%l7 + 0x50],	%f16
	movrlz	%l3,	0x3A7,	%o0
	movre	%i1,	%i6,	%o7
	movne	%xcc,	%o3,	%g6
	movneg	%icc,	%g4,	%g1
	stw	%l4,	[%l7 + 0x3C]
	orn	%g2,	%o5,	%o6
	movg	%icc,	%i5,	%i7
	smul	%g3,	0x18D7,	%i0
	movge	%xcc,	%o4,	%i3
	movre	%g5,	%o1,	%l5
	movge	%icc,	%i4,	%i2
	edge32n	%l0,	%l6,	%o2
	udivcc	%g7,	0x0150,	%l1
	bshuffle	%f4,	%f24,	%f16
	movn	%xcc,	%l2,	%o0
	stb	%l3,	[%l7 + 0x0D]
	ldd	[%l7 + 0x38],	%i6
	movvc	%icc,	%i1,	%o7
	save %o3, 0x0173, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g6,	%g1,	%l4
	alignaddr	%o5,	%g2,	%o6
	sth	%i5,	[%l7 + 0x78]
	bshuffle	%f4,	%f12,	%f28
	std	%f28,	[%l7 + 0x38]
	movneg	%icc,	%g3,	%i0
	fmovdvs	%icc,	%f31,	%f20
	fzero	%f14
	fpadd16s	%f26,	%f30,	%f3
	xnor	%i7,	%o4,	%g5
	srlx	%o1,	0x08,	%i3
	movpos	%icc,	%i4,	%i2
	alignaddrl	%l0,	%l6,	%l5
	srl	%o2,	%g7,	%l2
	addccc	%l1,	%o0,	%i6
	fmovsl	%icc,	%f12,	%f28
	srax	%i1,	0x0C,	%l3
	edge16l	%o7,	%g4,	%o3
	orn	%g6,	0x0830,	%g1
	fpsub16	%f12,	%f30,	%f20
	movn	%icc,	%o5,	%l4
	addc	%o6,	%i5,	%g3
	lduh	[%l7 + 0x14],	%i0
	umul	%g2,	%i7,	%g5
	movcc	%icc,	%o1,	%o4
	fmovdcs	%icc,	%f10,	%f17
	fsrc2	%f10,	%f2
	sth	%i4,	[%l7 + 0x4C]
	edge16n	%i2,	%l0,	%i3
	edge16l	%l6,	%o2,	%g7
	lduh	[%l7 + 0x2C],	%l2
	movl	%icc,	%l5,	%o0
	movle	%xcc,	%i6,	%i1
	andncc	%l1,	%o7,	%g4
	xnor	%o3,	0x089A,	%g6
	ldsw	[%l7 + 0x44],	%l3
	movne	%xcc,	%o5,	%l4
	ldd	[%l7 + 0x50],	%f14
	ld	[%l7 + 0x10],	%f20
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	fmovsgu	%xcc,	%f10,	%f23
	ldub	[%l7 + 0x3D],	%g3
	std	%f26,	[%l7 + 0x08]
	stw	%g1,	[%l7 + 0x30]
	ldub	[%l7 + 0x59],	%i0
	nop
	set	0x24, %l1
	stw	%g2,	[%l7 + %l1]
	ldub	[%l7 + 0x09],	%i7
	lduw	[%l7 + 0x60],	%o1
	smul	%o4,	%g5,	%i2
	sethi	0x027D,	%i4
	popc	%l0,	%i3
	alignaddrl	%o2,	%g7,	%l2
	xor	%l6,	0x15F4,	%l5
	or	%i6,	%o0,	%i1
	mova	%icc,	%l1,	%o7
	lduw	[%l7 + 0x18],	%g4
	sub	%o3,	%l3,	%g6
	fmovsg	%xcc,	%f24,	%f8
	movcs	%icc,	%l4,	%o5
	srlx	%o6,	0x12,	%i5
	edge32n	%g1,	%i0,	%g2
	sra	%g3,	%o1,	%i7
	st	%f22,	[%l7 + 0x20]
	fmovdg	%icc,	%f22,	%f0
	fmovdleu	%icc,	%f11,	%f25
	ldx	[%l7 + 0x60],	%g5
	subccc	%o4,	%i2,	%l0
	smulcc	%i3,	%o2,	%i4
	fmovdpos	%icc,	%f30,	%f27
	faligndata	%f14,	%f18,	%f14
	ld	[%l7 + 0x48],	%f12
	sub	%l2,	%l6,	%l5
	mulscc	%g7,	0x09D7,	%i6
	movrlz	%i1,	0x3E2,	%o0
	fmul8x16al	%f29,	%f29,	%f4
	fpackfix	%f8,	%f11
	orncc	%l1,	%g4,	%o3
	ldd	[%l7 + 0x78],	%l2
	sllx	%o7,	0x1E,	%g6
	restore %l4, 0x1F6B, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i5,	0x0E6A,	%o5
	andcc	%i0,	0x173A,	%g1
	addccc	%g2,	0x012A,	%g3
	sth	%o1,	[%l7 + 0x48]
	alignaddrl	%i7,	%o4,	%g5
	fcmpd	%fcc0,	%f0,	%f28
	stw	%l0,	[%l7 + 0x4C]
	sll	%i2,	%o2,	%i4
	array16	%i3,	%l6,	%l2
	stx	%l5,	[%l7 + 0x20]
	fnor	%f24,	%f20,	%f12
	movne	%xcc,	%g7,	%i1
	subccc	%o0,	0x1339,	%i6
	fmovrdgez	%l1,	%f26,	%f6
	fmovrse	%g4,	%f31,	%f21
	fornot2	%f30,	%f12,	%f26
	movl	%xcc,	%o3,	%l3
	sll	%o7,	0x1C,	%g6
	fmovsgu	%icc,	%f16,	%f18
	andn	%l4,	0x00D9,	%i5
	sdiv	%o6,	0x1675,	%o5
	fmovdne	%icc,	%f21,	%f18
	st	%f4,	[%l7 + 0x20]
	edge32ln	%i0,	%g1,	%g3
	movpos	%xcc,	%g2,	%o1
	movn	%xcc,	%o4,	%g5
	orcc	%l0,	0x074E,	%i2
	lduh	[%l7 + 0x48],	%o2
	fmovda	%xcc,	%f20,	%f5
	edge16	%i7,	%i4,	%l6
	ldub	[%l7 + 0x7C],	%l2
	andcc	%i3,	%g7,	%l5
	udivx	%o0,	0x1738,	%i6
	fmovd	%f22,	%f26
	array16	%i1,	%l1,	%o3
	mova	%xcc,	%l3,	%g4
	xor	%g6,	0x1A38,	%l4
	xorcc	%i5,	%o7,	%o5
	fmovdne	%icc,	%f8,	%f1
	move	%xcc,	%o6,	%i0
	addc	%g3,	%g2,	%o1
	fmovsvs	%xcc,	%f1,	%f30
	subcc	%g1,	%g5,	%l0
	array32	%i2,	%o4,	%o2
	ldub	[%l7 + 0x1B],	%i7
	fpsub16s	%f30,	%f2,	%f6
	movgu	%icc,	%i4,	%l6
	fmovda	%icc,	%f3,	%f30
	fcmpgt16	%f4,	%f12,	%i3
	edge16	%g7,	%l2,	%l5
	orncc	%o0,	%i6,	%l1
	andn	%i1,	%l3,	%o3
	stb	%g6,	[%l7 + 0x36]
	orncc	%l4,	0x052E,	%g4
	add	%i5,	%o5,	%o7
	addccc	%o6,	0x086D,	%i0
	movrlz	%g2,	%g3,	%g1
	movne	%xcc,	%g5,	%o1
	ldx	[%l7 + 0x70],	%i2
	smulcc	%o4,	0x1A8F,	%o2
	srlx	%i7,	%l0,	%l6
	fpadd16s	%f30,	%f24,	%f15
	fpsub16s	%f29,	%f28,	%f3
	mulx	%i4,	0x0766,	%g7
	orncc	%l2,	%i3,	%o0
	movl	%xcc,	%i6,	%l5
	movleu	%icc,	%i1,	%l1
	edge16l	%l3,	%g6,	%l4
	fpsub32s	%f23,	%f14,	%f2
	sth	%g4,	[%l7 + 0x0A]
	xnorcc	%o3,	%o5,	%o7
	stb	%i5,	[%l7 + 0x7C]
	xnorcc	%i0,	%g2,	%g3
	ldsb	[%l7 + 0x36],	%g1
	edge32l	%g5,	%o6,	%i2
	save %o1, %o2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l0,	%i7,	%l6
	lduw	[%l7 + 0x48],	%g7
	addcc	%i4,	%l2,	%o0
	and	%i6,	%l5,	%i3
	fpack16	%f28,	%f6
	srlx	%l1,	0x08,	%l3
	fmuld8ulx16	%f20,	%f14,	%f30
	ldsh	[%l7 + 0x56],	%i1
	movrne	%l4,	0x17E,	%g4
	fmovd	%f10,	%f16
	addcc	%g6,	%o5,	%o7
	fsrc2s	%f25,	%f6
	udiv	%o3,	0x0885,	%i5
	subcc	%g2,	0x04B4,	%g3
	movneg	%icc,	%g1,	%g5
	pdist	%f12,	%f22,	%f16
	subcc	%o6,	%i2,	%i0
	smulcc	%o2,	0x1910,	%o1
	movrgez	%l0,	%i7,	%o4
	fpsub16	%f28,	%f24,	%f4
	udivcc	%l6,	0x17E5,	%i4
	fpadd32	%f14,	%f16,	%f20
	movre	%g7,	%o0,	%l2
	movgu	%icc,	%l5,	%i3
	nop
	set	0x1E, %o0
	lduh	[%l7 + %o0],	%l1
	ldsh	[%l7 + 0x7E],	%i6
	addcc	%i1,	0x1821,	%l3
	movrlz	%l4,	%g4,	%o5
	xorcc	%o7,	%g6,	%o3
	fnot2	%f18,	%f6
	alignaddr	%i5,	%g3,	%g1
	umulcc	%g2,	0x076D,	%o6
	edge16ln	%i2,	%g5,	%o2
	edge32l	%o1,	%i0,	%l0
	sir	0x0D92
	ldd	[%l7 + 0x08],	%f16
	fexpand	%f6,	%f0
	add	%i7,	%o4,	%l6
	andncc	%i4,	%o0,	%l2
	ldub	[%l7 + 0x48],	%g7
	edge32n	%l5,	%i3,	%i6
	edge8n	%l1,	%l3,	%l4
	fcmpne16	%f28,	%f4,	%g4
	edge16l	%i1,	%o5,	%g6
	mulx	%o3,	%o7,	%i5
	mova	%xcc,	%g1,	%g3
	nop
	set	0x0A, %i4
	lduh	[%l7 + %i4],	%g2
	stw	%i2,	[%l7 + 0x40]
	st	%f14,	[%l7 + 0x14]
	fpadd32s	%f7,	%f17,	%f11
	alignaddr	%o6,	%o2,	%o1
	fcmpne32	%f18,	%f16,	%i0
	array32	%g5,	%i7,	%l0
	fmovdvc	%xcc,	%f19,	%f31
	umul	%o4,	0x1F5B,	%l6
	subc	%o0,	0x1940,	%i4
	stx	%l2,	[%l7 + 0x70]
	movgu	%xcc,	%g7,	%l5
	ld	[%l7 + 0x58],	%f18
	fmovrsgz	%i6,	%f4,	%f23
	fmovrsgz	%l1,	%f16,	%f4
	movrlez	%l3,	%l4,	%i3
	subccc	%g4,	%i1,	%g6
	sll	%o5,	0x09,	%o7
	alignaddrl	%i5,	%g1,	%g3
	movn	%icc,	%g2,	%i2
	nop
	set	0x3A, %g2
	lduh	[%l7 + %g2],	%o3
	fnor	%f4,	%f0,	%f18
	ldsw	[%l7 + 0x5C],	%o6
	fnot1	%f24,	%f20
	mulscc	%o1,	0x0C0A,	%o2
	edge32ln	%g5,	%i0,	%l0
	srlx	%i7,	0x00,	%l6
	alignaddr	%o0,	%o4,	%l2
	movg	%icc,	%g7,	%l5
	fmovdvs	%xcc,	%f1,	%f4
	fmovdne	%icc,	%f0,	%f29
	smulcc	%i6,	%l1,	%l3
	edge32l	%i4,	%i3,	%l4
	movne	%xcc,	%g4,	%g6
	andcc	%o5,	0x16C2,	%i1
	edge8l	%o7,	%g1,	%g3
	sub	%g2,	%i2,	%i5
	fsrc2	%f18,	%f0
	subccc	%o6,	%o3,	%o2
	movne	%xcc,	%o1,	%i0
	fcmpes	%fcc1,	%f18,	%f15
	fmul8x16au	%f8,	%f15,	%f12
	edge8n	%l0,	%i7,	%g5
	and	%l6,	0x14A0,	%o0
	movrgz	%l2,	%g7,	%l5
	addc	%o4,	%l1,	%l3
	fsrc2	%f10,	%f2
	edge8l	%i4,	%i6,	%i3
	umul	%g4,	0x1017,	%l4
	fcmpeq32	%f22,	%f10,	%o5
	xorcc	%g6,	0x0CF1,	%o7
	fornot2s	%f26,	%f17,	%f31
	save %i1, 0x1855, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f20,	[%l7 + 0x60]
	sdivx	%g2,	0x1B47,	%i2
	edge16l	%i5,	%g1,	%o6
	or	%o2,	0x05B6,	%o1
	edge16n	%i0,	%l0,	%i7
	fpsub16	%f4,	%f26,	%f2
	movrgz	%o3,	%l6,	%o0
	fxnors	%f13,	%f14,	%f11
	stw	%g5,	[%l7 + 0x54]
	fpadd16	%f10,	%f30,	%f24
	fmovsgu	%icc,	%f2,	%f14
	fmovse	%icc,	%f13,	%f13
	fmovrsgz	%g7,	%f29,	%f22
	popc	%l5,	%l2
	movcc	%xcc,	%l1,	%l3
	fornot2	%f24,	%f4,	%f28
	fmovdvc	%icc,	%f26,	%f21
	save %o4, 0x0AEB, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i3,	0x01E5,	%i6
	add	%l4,	%o5,	%g4
	ldsb	[%l7 + 0x18],	%o7
	alignaddr	%g6,	%g3,	%g2
	andcc	%i2,	%i5,	%g1
	stx	%o6,	[%l7 + 0x48]
	ldx	[%l7 + 0x18],	%i1
	smul	%o2,	0x0C86,	%o1
	movg	%xcc,	%i0,	%i7
	edge8	%o3,	%l0,	%o0
	sub	%l6,	0x03DF,	%g7
	edge32l	%g5,	%l5,	%l1
	andn	%l2,	%o4,	%i4
	xnor	%l3,	0x172F,	%i6
	std	%f2,	[%l7 + 0x48]
	movl	%icc,	%l4,	%i3
	movcs	%xcc,	%o5,	%g4
	edge8l	%o7,	%g6,	%g3
	ldsh	[%l7 + 0x34],	%g2
	ldsh	[%l7 + 0x48],	%i2
	movl	%icc,	%g1,	%i5
	smulcc	%o6,	%o2,	%o1
	st	%f19,	[%l7 + 0x78]
	ldd	[%l7 + 0x50],	%f8
	udivx	%i0,	0x02C0,	%i7
	ldx	[%l7 + 0x30],	%o3
	edge16l	%l0,	%o0,	%i1
	addcc	%g7,	0x1134,	%l6
	movrlz	%g5,	%l5,	%l2
	movrgez	%o4,	0x011,	%i4
	umul	%l3,	0x0D28,	%i6
	fmovda	%xcc,	%f11,	%f29
	fand	%f28,	%f22,	%f6
	movrlez	%l4,	%i3,	%o5
	movl	%icc,	%l1,	%g4
	xorcc	%o7,	%g6,	%g2
	fmovsge	%xcc,	%f7,	%f14
	ldx	[%l7 + 0x30],	%g3
	fmuld8sux16	%f2,	%f2,	%f20
	array16	%g1,	%i2,	%i5
	xnor	%o6,	0x0B88,	%o2
	srl	%o1,	0x0A,	%i0
	andncc	%i7,	%l0,	%o3
	fpsub32	%f6,	%f2,	%f4
	ldsb	[%l7 + 0x26],	%o0
	fmovdl	%icc,	%f14,	%f2
	movge	%icc,	%g7,	%i1
	ld	[%l7 + 0x5C],	%f29
	fmovdleu	%xcc,	%f18,	%f14
	mova	%xcc,	%l6,	%g5
	sir	0x0A08
	sdivcc	%l5,	0x0FE1,	%o4
	fmul8sux16	%f18,	%f24,	%f10
	movle	%xcc,	%l2,	%i4
	sllx	%l3,	0x07,	%l4
	mulscc	%i3,	0x04AB,	%o5
	udivx	%l1,	0x1696,	%g4
	fmovscc	%icc,	%f26,	%f17
	subccc	%o7,	0x0154,	%g6
	popc	%g2,	%g3
	ldsb	[%l7 + 0x33],	%i6
	sethi	0x0818,	%i2
	srlx	%i5,	0x0A,	%o6
	save %g1, %o2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o1,	0x0154,	%i7
	lduw	[%l7 + 0x60],	%l0
	fabsd	%f18,	%f4
	srax	%o0,	%g7,	%i1
	st	%f2,	[%l7 + 0x60]
	fmovsge	%xcc,	%f28,	%f24
	fcmpeq32	%f6,	%f28,	%l6
	edge16ln	%o3,	%g5,	%l5
	mova	%xcc,	%l2,	%o4
	lduw	[%l7 + 0x74],	%i4
	sethi	0x12BF,	%l4
	orcc	%i3,	%l3,	%o5
	srlx	%l1,	%o7,	%g6
	movrlz	%g4,	0x16E,	%g3
	alignaddrl	%i6,	%i2,	%g2
	ldsb	[%l7 + 0x52],	%o6
	ldd	[%l7 + 0x10],	%f18
	subc	%g1,	%o2,	%i5
	orncc	%i0,	%i7,	%l0
	ldd	[%l7 + 0x10],	%o0
	fmovsneg	%xcc,	%f26,	%f16
	sll	%o1,	%g7,	%i1
	mulscc	%o3,	%l6,	%l5
	sethi	0x0DAC,	%g5
	movrne	%l2,	0x175,	%i4
	movcs	%xcc,	%o4,	%i3
	movg	%icc,	%l3,	%o5
	fmovdpos	%icc,	%f12,	%f0
	array16	%l1,	%l4,	%o7
	nop
	set	0x68, %o2
	ldsb	[%l7 + %o2],	%g4
	andncc	%g6,	%g3,	%i6
	sll	%i2,	0x11,	%g2
	subcc	%g1,	0x1B6D,	%o6
	movrgz	%i5,	0x173,	%o2
	or	%i7,	0x143D,	%i0
	movcs	%icc,	%l0,	%o0
	movrlz	%o1,	0x21F,	%i1
	movcc	%icc,	%o3,	%l6
	fcmped	%fcc2,	%f30,	%f8
	andcc	%l5,	0x0B3B,	%g5
	srlx	%l2,	0x14,	%i4
	sir	0x0694
	movrlz	%g7,	0x195,	%o4
	fmovrslez	%l3,	%f22,	%f24
	stw	%o5,	[%l7 + 0x14]
	movge	%xcc,	%l1,	%i3
	ldd	[%l7 + 0x20],	%l4
	st	%f20,	[%l7 + 0x6C]
	edge8	%g4,	%g6,	%o7
	array32	%i6,	%i2,	%g3
	array16	%g2,	%o6,	%i5
	movge	%xcc,	%o2,	%i7
	subcc	%g1,	%l0,	%o0
	umulcc	%o1,	0x0158,	%i1
	fmovdleu	%icc,	%f5,	%f24
	movrlez	%i0,	%o3,	%l6
	sll	%g5,	0x07,	%l2
	fornot1s	%f8,	%f8,	%f12
	stw	%i4,	[%l7 + 0x70]
	fnands	%f11,	%f18,	%f13
	stb	%g7,	[%l7 + 0x43]
	movrlez	%o4,	%l3,	%l5
	mulscc	%o5,	%i3,	%l1
	sth	%l4,	[%l7 + 0x36]
	udivcc	%g6,	0x01A4,	%o7
	subc	%i6,	0x1CB7,	%i2
	fpsub32s	%f10,	%f18,	%f22
	movrlz	%g3,	%g2,	%g4
	orn	%o6,	%o2,	%i5
	addccc	%i7,	%l0,	%g1
	movrlez	%o1,	0x03C,	%i1
	sethi	0x0E47,	%i0
	movl	%xcc,	%o3,	%o0
	movrgez	%g5,	0x1E1,	%l6
	movl	%icc,	%l2,	%g7
	mulx	%o4,	0x066F,	%i4
	st	%f20,	[%l7 + 0x44]
	sdivcc	%l3,	0x0110,	%o5
	xor	%i3,	%l1,	%l5
	movrne	%g6,	0x08C,	%l4
	movn	%xcc,	%o7,	%i6
	ldsh	[%l7 + 0x5C],	%i2
	sir	0x06FC
	fabsd	%f12,	%f30
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	fpackfix	%f2,	%f24
	fmovsvs	%icc,	%f17,	%f21
	sethi	0x0E79,	%g4
	movleu	%icc,	%o6,	%o2
	andcc	%i7,	%l0,	%g1
	alignaddrl	%i5,	%o1,	%i1
	fone	%f12
	movg	%xcc,	%o3,	%i0
	fmovdneg	%xcc,	%f1,	%f11
	movvs	%icc,	%g5,	%l6
	fmovrsne	%o0,	%f20,	%f29
	edge16n	%g7,	%l2,	%i4
	fmovscc	%icc,	%f30,	%f28
	ldsb	[%l7 + 0x48],	%o4
	andcc	%o5,	0x19B5,	%l3
	sir	0x00E0
	lduw	[%l7 + 0x1C],	%i3
	faligndata	%f2,	%f12,	%f8
	fmovsge	%icc,	%f10,	%f16
	add	%l1,	0x1684,	%g6
	movle	%xcc,	%l5,	%l4
	fmovrslz	%i6,	%f15,	%f24
	fandnot1	%f2,	%f10,	%f0
	srl	%o7,	%i2,	%g3
	st	%f29,	[%l7 + 0x58]
	st	%f28,	[%l7 + 0x28]
	array8	%g4,	%g2,	%o6
	array32	%i7,	%o2,	%l0
	fnot2s	%f27,	%f3
	edge16	%g1,	%i5,	%i1
	fcmple32	%f18,	%f18,	%o3
	edge8	%o1,	%i0,	%g5
	fnor	%f4,	%f0,	%f2
	edge16ln	%o0,	%g7,	%l6
	movcc	%icc,	%l2,	%i4
	udivcc	%o5,	0x0232,	%o4
	sethi	0x06EB,	%l3
	orncc	%l1,	%g6,	%l5
	edge32n	%i3,	%i6,	%o7
	addccc	%l4,	%i2,	%g3
	fmovdle	%icc,	%f2,	%f5
	movvs	%xcc,	%g4,	%g2
	udivcc	%i7,	0x0E63,	%o6
	fcmpeq32	%f26,	%f20,	%o2
	sethi	0x13E6,	%l0
	movl	%xcc,	%g1,	%i1
	sra	%o3,	0x19,	%o1
	movre	%i0,	0x106,	%g5
	sdiv	%i5,	0x1E3E,	%o0
	addc	%g7,	0x06DB,	%l2
	for	%f20,	%f10,	%f22
	sll	%l6,	%o5,	%o4
	srl	%l3,	0x1D,	%l1
	array8	%g6,	%i4,	%i3
	sdiv	%l5,	0x124E,	%o7
	orcc	%i6,	%l4,	%i2
	movcs	%icc,	%g3,	%g4
	ldsw	[%l7 + 0x0C],	%g2
	fpadd32s	%f30,	%f17,	%f27
	movcc	%xcc,	%i7,	%o2
	edge32ln	%l0,	%g1,	%o6
	faligndata	%f12,	%f14,	%f2
	udivx	%i1,	0x19BF,	%o3
	sra	%i0,	0x06,	%g5
	movle	%xcc,	%i5,	%o1
	alignaddrl	%o0,	%l2,	%l6
	sra	%o5,	0x00,	%g7
	fxnors	%f15,	%f22,	%f2
	movge	%xcc,	%o4,	%l3
	fmovscs	%icc,	%f11,	%f17
	andcc	%l1,	%i4,	%i3
	edge32l	%g6,	%o7,	%l5
	edge32l	%i6,	%l4,	%g3
	fmovdcc	%xcc,	%f27,	%f11
	ld	[%l7 + 0x68],	%f3
	alignaddrl	%i2,	%g2,	%i7
	sub	%g4,	%o2,	%g1
	lduw	[%l7 + 0x78],	%l0
	edge16n	%o6,	%o3,	%i1
	add	%g5,	%i5,	%i0
	orncc	%o1,	%o0,	%l6
	movleu	%xcc,	%o5,	%g7
	xor	%o4,	0x083B,	%l3
	edge16	%l2,	%i4,	%l1
	addccc	%g6,	0x0DA0,	%o7
	fpadd16s	%f22,	%f1,	%f23
	srl	%i3,	0x14,	%l5
	fxnor	%f0,	%f12,	%f24
	ldsb	[%l7 + 0x2A],	%i6
	edge16	%g3,	%i2,	%l4
	movg	%xcc,	%i7,	%g2
	fsrc2	%f20,	%f6
	nop
	set	0x30, %i6
	ldx	[%l7 + %i6],	%g4
	fmovrdlez	%o2,	%f14,	%f20
	fmovdne	%icc,	%f14,	%f29
	smulcc	%l0,	0x1037,	%o6
	fmuld8sux16	%f28,	%f2,	%f0
	movcc	%xcc,	%o3,	%g1
	addccc	%i1,	%g5,	%i5
	save %i0, 0x02DC, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l6,	0x049,	%o5
	udiv	%o1,	0x0096,	%g7
	fpadd32	%f28,	%f2,	%f26
	udivx	%l3,	0x0789,	%o4
	udivx	%i4,	0x0E9C,	%l1
	edge32l	%l2,	%g6,	%i3
	fmovrde	%o7,	%f22,	%f10
	fnor	%f28,	%f4,	%f16
	sll	%l5,	0x0F,	%g3
	edge32ln	%i6,	%i2,	%i7
	restore %l4, 0x048D, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	movrne	%o2,	0x3CA,	%o3
	edge16n	%g1,	%i1,	%o6
	smul	%g5,	0x15E9,	%i5
	fexpand	%f8,	%f26
	movrlz	%o0,	%i0,	%l6
	movrlez	%o1,	%g7,	%o5
	sdiv	%l3,	0x124A,	%i4
	lduw	[%l7 + 0x50],	%l1
	fors	%f0,	%f22,	%f11
	srl	%o4,	%g6,	%l2
	edge16ln	%o7,	%i3,	%g3
	sir	0x0B6B
	fpack16	%f2,	%f15
	and	%l5,	0x1237,	%i2
	movle	%xcc,	%i6,	%i7
	srl	%g4,	0x1B,	%l4
	st	%f1,	[%l7 + 0x4C]
	movcc	%icc,	%l0,	%g2
	nop
	set	0x78, %o3
	stw	%o3,	[%l7 + %o3]
	fmovdge	%icc,	%f7,	%f10
	fmovsne	%xcc,	%f21,	%f16
	fmovrsgez	%g1,	%f7,	%f19
	movne	%xcc,	%i1,	%o6
	edge8n	%o2,	%g5,	%o0
	fmovsneg	%icc,	%f28,	%f20
	addcc	%i5,	0x0A02,	%l6
	stw	%i0,	[%l7 + 0x7C]
	movrlz	%o1,	%g7,	%o5
	movvc	%xcc,	%l3,	%i4
	array32	%l1,	%o4,	%l2
	fone	%f24
	edge32l	%o7,	%g6,	%g3
	edge8l	%i3,	%l5,	%i6
	ldsb	[%l7 + 0x4F],	%i2
	alignaddr	%g4,	%l4,	%i7
	edge32	%l0,	%g2,	%g1
	and	%o3,	0x00C2,	%o6
	movne	%xcc,	%o2,	%i1
	fmovrslz	%g5,	%f13,	%f23
	andcc	%i5,	%o0,	%l6
	movn	%icc,	%i0,	%g7
	fpack32	%f20,	%f16,	%f22
	ldd	[%l7 + 0x18],	%f4
	ldsb	[%l7 + 0x1B],	%o5
	fmul8ulx16	%f20,	%f0,	%f16
	fmovs	%f31,	%f18
	xnor	%o1,	%l3,	%l1
	fnor	%f14,	%f2,	%f12
	fnot2s	%f5,	%f5
	orncc	%o4,	0x122C,	%l2
	fmovrdne	%i4,	%f10,	%f2
	smul	%o7,	%g6,	%i3
	ldub	[%l7 + 0x5A],	%g3
	edge16n	%i6,	%l5,	%g4
	movrgz	%i2,	0x17E,	%l4
	st	%f19,	[%l7 + 0x30]
	srax	%l0,	%i7,	%g1
	lduh	[%l7 + 0x6A],	%o3
	edge32	%o6,	%o2,	%g2
	mova	%icc,	%g5,	%i5
	movrgz	%o0,	0x3AE,	%i1
	movre	%l6,	%i0,	%g7
	ldd	[%l7 + 0x58],	%f14
	smulcc	%o5,	0x127B,	%o1
	edge8	%l3,	%o4,	%l1
	mulscc	%i4,	%l2,	%o7
	xorcc	%i3,	%g6,	%g3
	stx	%i6,	[%l7 + 0x60]
	fmovsa	%icc,	%f21,	%f15
	edge8l	%l5,	%i2,	%l4
	xnor	%l0,	0x1A99,	%g4
	srlx	%i7,	0x16,	%g1
	fpsub32	%f2,	%f26,	%f18
	movneg	%xcc,	%o3,	%o2
	array16	%o6,	%g5,	%i5
	movn	%xcc,	%o0,	%g2
	array8	%i1,	%i0,	%g7
	st	%f14,	[%l7 + 0x78]
	orncc	%l6,	0x0FAC,	%o5
	orn	%o1,	%l3,	%l1
	fsrc1s	%f17,	%f28
	fmul8ulx16	%f14,	%f20,	%f30
	fone	%f12
	edge32n	%i4,	%l2,	%o4
	udivcc	%o7,	0x13E4,	%i3
	mulx	%g3,	0x00C9,	%g6
	movrgez	%i6,	0x285,	%i2
	stx	%l5,	[%l7 + 0x48]
	addc	%l0,	%g4,	%i7
	srlx	%l4,	0x0B,	%o3
	alignaddr	%o2,	%g1,	%o6
	edge16	%i5,	%g5,	%o0
	array32	%i1,	%g2,	%i0
	fpmerge	%f24,	%f18,	%f24
	movpos	%icc,	%l6,	%g7
	st	%f24,	[%l7 + 0x6C]
	fmovdgu	%xcc,	%f15,	%f2
	ldsw	[%l7 + 0x18],	%o5
	fmovrsgez	%l3,	%f22,	%f11
	movl	%xcc,	%o1,	%l1
	edge8	%i4,	%l2,	%o4
	alignaddr	%i3,	%g3,	%g6
	fmovdpos	%icc,	%f20,	%f12
	xnor	%o7,	0x12AE,	%i2
	srax	%l5,	%i6,	%g4
	sir	0x0041
	add	%l0,	%i7,	%l4
	udiv	%o2,	0x1DDE,	%o3
	sub	%o6,	%i5,	%g1
	and	%g5,	%i1,	%o0
	stb	%i0,	[%l7 + 0x68]
	edge16l	%l6,	%g7,	%o5
	movneg	%xcc,	%l3,	%o1
	fcmpgt16	%f18,	%f16,	%l1
	movleu	%xcc,	%i4,	%g2
	sir	0x0942
	fcmple16	%f24,	%f6,	%l2
	sth	%o4,	[%l7 + 0x48]
	subcc	%g3,	%i3,	%o7
	edge16ln	%g6,	%l5,	%i2
	fnot1s	%f9,	%f8
	fpadd32	%f4,	%f24,	%f16
	addccc	%i6,	%g4,	%i7
	edge32ln	%l0,	%l4,	%o3
	fnot2	%f6,	%f28
	movgu	%icc,	%o6,	%i5
	sub	%o2,	0x0034,	%g1
	fornot2	%f4,	%f18,	%f26
	movneg	%xcc,	%i1,	%o0
	fxor	%f16,	%f14,	%f16
	ldd	[%l7 + 0x18],	%i0
	fcmple16	%f16,	%f6,	%l6
	edge16l	%g5,	%g7,	%o5
	fmovdcs	%xcc,	%f27,	%f12
	movvs	%xcc,	%l3,	%o1
	edge32n	%i4,	%l1,	%g2
	fcmpeq16	%f28,	%f26,	%o4
	umulcc	%l2,	%i3,	%o7
	sub	%g3,	0x102B,	%l5
	edge32l	%i2,	%i6,	%g4
	sll	%i7,	%g6,	%l4
	movrlez	%l0,	0x159,	%o3
	addcc	%i5,	%o2,	%o6
	fmovspos	%icc,	%f19,	%f15
	fmovse	%xcc,	%f21,	%f16
	fzeros	%f19
	mulscc	%g1,	0x1C6E,	%i1
	stb	%o0,	[%l7 + 0x7F]
	smulcc	%i0,	0x03A6,	%l6
	fornot1s	%f22,	%f1,	%f2
	stw	%g7,	[%l7 + 0x18]
	alignaddrl	%g5,	%l3,	%o1
	fpadd16	%f2,	%f2,	%f4
	fmovspos	%icc,	%f20,	%f8
	ldx	[%l7 + 0x70],	%o5
	fmovsge	%icc,	%f30,	%f2
	movle	%xcc,	%l1,	%i4
	fnegs	%f4,	%f29
	movle	%xcc,	%g2,	%o4
	fnands	%f24,	%f27,	%f4
	fone	%f28
	array16	%l2,	%o7,	%i3
	movn	%icc,	%l5,	%i2
	movrgez	%i6,	0x105,	%g3
	movle	%icc,	%g4,	%g6
	fornot1s	%f16,	%f6,	%f16
	edge32n	%i7,	%l0,	%l4
	alignaddrl	%i5,	%o3,	%o6
	umul	%g1,	0x0020,	%i1
	movn	%xcc,	%o2,	%i0
	sll	%o0,	%l6,	%g7
	andn	%l3,	0x1280,	%g5
	fmovdvs	%icc,	%f21,	%f29
	sdivx	%o5,	0x1E22,	%l1
	edge16ln	%i4,	%o1,	%g2
	sub	%o4,	0x1961,	%o7
	fmul8sux16	%f2,	%f24,	%f8
	orn	%l2,	%i3,	%l5
	sethi	0x065A,	%i2
	ldub	[%l7 + 0x3F],	%i6
	smul	%g3,	%g4,	%g6
	movg	%icc,	%i7,	%l0
	movre	%i5,	%l4,	%o3
	movn	%icc,	%o6,	%i1
	sth	%g1,	[%l7 + 0x16]
	movvc	%xcc,	%i0,	%o2
	fnot2	%f12,	%f6
	fpack32	%f4,	%f8,	%f20
	edge16ln	%o0,	%l6,	%g7
	array16	%g5,	%l3,	%l1
	popc	0x0EC3,	%o5
	ld	[%l7 + 0x28],	%f16
	fexpand	%f18,	%f10
	movvs	%icc,	%i4,	%o1
	edge8l	%g2,	%o7,	%o4
	fandnot2s	%f31,	%f10,	%f21
	umul	%i3,	%l5,	%i2
	stx	%i6,	[%l7 + 0x50]
	fmovrdgz	%l2,	%f28,	%f30
	addcc	%g3,	%g4,	%g6
	orcc	%i7,	0x1622,	%i5
	array8	%l0,	%o3,	%o6
	fcmpgt16	%f8,	%f4,	%i1
	subc	%g1,	%i0,	%l4
	edge8n	%o2,	%o0,	%g7
	array32	%l6,	%g5,	%l1
	ldsb	[%l7 + 0x48],	%l3
	edge16n	%o5,	%i4,	%o1
	st	%f22,	[%l7 + 0x28]
	lduh	[%l7 + 0x5A],	%g2
	restore %o7, 0x06BD, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l5,	0x0D4,	%i2
	movrlz	%i6,	%i3,	%l2
	nop
	set	0x28, %g6
	std	%f26,	[%l7 + %g6]
	movle	%icc,	%g3,	%g4
	subc	%g6,	0x0D5D,	%i5
	mulx	%l0,	0x12CB,	%i7
	movvs	%icc,	%o3,	%o6
	fand	%f20,	%f14,	%f20
	fcmpne16	%f28,	%f20,	%i1
	edge8l	%g1,	%l4,	%o2
	stx	%i0,	[%l7 + 0x10]
	addc	%o0,	%l6,	%g5
	sth	%g7,	[%l7 + 0x14]
	andncc	%l1,	%l3,	%i4
	edge8l	%o1,	%o5,	%o7
	movne	%xcc,	%o4,	%g2
	array8	%l5,	%i2,	%i3
	movle	%xcc,	%l2,	%i6
	add	%g3,	0x17F2,	%g6
	fcmpd	%fcc1,	%f30,	%f14
	fnors	%f1,	%f2,	%f28
	srax	%g4,	%l0,	%i7
	movrne	%i5,	0x019,	%o3
	fmovdl	%icc,	%f5,	%f29
	mulscc	%o6,	0x1888,	%g1
	save %i1, %l4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o0,	%i0,	%g5
	sra	%g7,	0x09,	%l6
	umulcc	%l3,	%i4,	%o1
	movg	%icc,	%o5,	%l1
	std	%f18,	[%l7 + 0x60]
	udivcc	%o7,	0x1037,	%o4
	stb	%g2,	[%l7 + 0x3C]
	fnors	%f21,	%f13,	%f1
	xorcc	%l5,	%i2,	%i3
	movle	%xcc,	%i6,	%l2
	movrgz	%g6,	%g4,	%l0
	sll	%g3,	0x09,	%i5
	mulscc	%o3,	%o6,	%i7
	movrgz	%i1,	0x1D3,	%l4
	movcc	%icc,	%o2,	%g1
	fmovsg	%xcc,	%f19,	%f17
	fnegd	%f14,	%f2
	fnand	%f24,	%f26,	%f18
	fmovsleu	%xcc,	%f30,	%f26
	movge	%icc,	%o0,	%i0
	ldsb	[%l7 + 0x26],	%g5
	movneg	%icc,	%g7,	%l3
	edge32	%l6,	%o1,	%i4
	fpack16	%f12,	%f23
	movpos	%icc,	%o5,	%l1
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	fmovsneg	%icc,	%f8,	%f11
	movl	%icc,	%l5,	%i2
	fnegd	%f14,	%f30
	fpack16	%f14,	%f25
	addccc	%i3,	0x1D3D,	%i6
	stx	%l2,	[%l7 + 0x60]
	popc	%g6,	%l0
	edge16n	%g4,	%g3,	%i5
	fmul8sux16	%f4,	%f4,	%f4
	sub	%o6,	0x1CB6,	%i7
	fzeros	%f18
	fmovde	%icc,	%f24,	%f22
	movne	%icc,	%o3,	%i1
	fmovspos	%xcc,	%f17,	%f20
	movneg	%xcc,	%l4,	%g1
	addccc	%o0,	%o2,	%g5
	stb	%g7,	[%l7 + 0x1B]
	udiv	%l3,	0x15E4,	%l6
	st	%f8,	[%l7 + 0x18]
	xnor	%i0,	%i4,	%o5
	fnegd	%f24,	%f22
	edge16ln	%o1,	%o4,	%o7
	sdivcc	%l1,	0x0434,	%g2
	edge32ln	%l5,	%i2,	%i3
	lduh	[%l7 + 0x2E],	%l2
	movre	%i6,	%l0,	%g6
	srax	%g3,	0x1F,	%g4
	movvs	%xcc,	%i5,	%o6
	ldub	[%l7 + 0x30],	%i7
	movre	%i1,	0x0AF,	%l4
	xnorcc	%g1,	%o3,	%o0
	fmovdcc	%xcc,	%f1,	%f30
	ldub	[%l7 + 0x46],	%g5
	movrgez	%o2,	%g7,	%l6
	array8	%i0,	%l3,	%o5
	and	%o1,	%i4,	%o4
	fmul8ulx16	%f30,	%f2,	%f12
	movvc	%icc,	%l1,	%o7
	fmovsa	%xcc,	%f13,	%f13
	orcc	%l5,	%g2,	%i3
	fnegs	%f30,	%f20
	movcs	%icc,	%l2,	%i6
	fxnor	%f22,	%f6,	%f22
	orcc	%i2,	%l0,	%g3
	edge8ln	%g6,	%i5,	%g4
	ldsw	[%l7 + 0x2C],	%o6
	umulcc	%i7,	%l4,	%i1
	edge16l	%o3,	%g1,	%g5
	edge32	%o0,	%g7,	%l6
	movrgz	%o2,	0x03E,	%i0
	movcc	%xcc,	%l3,	%o5
	ldd	[%l7 + 0x48],	%i4
	edge8	%o4,	%o1,	%o7
	fones	%f22
	ldsw	[%l7 + 0x48],	%l1
	sll	%g2,	0x13,	%l5
	fornot1s	%f18,	%f2,	%f23
	fmovrsgez	%l2,	%f19,	%f20
	srl	%i6,	%i2,	%i3
	sdivcc	%g3,	0x022F,	%g6
	ldx	[%l7 + 0x78],	%l0
	mulx	%g4,	%o6,	%i7
	ldsb	[%l7 + 0x7D],	%l4
	orcc	%i1,	0x0605,	%i5
	fmovsvs	%xcc,	%f23,	%f31
	addccc	%o3,	0x1CF3,	%g1
	mulscc	%g5,	0x0B76,	%g7
	orn	%l6,	0x197B,	%o0
	array32	%o2,	%l3,	%o5
	movge	%xcc,	%i0,	%o4
	fxors	%f12,	%f22,	%f6
	addccc	%i4,	%o1,	%o7
	st	%f12,	[%l7 + 0x54]
	orcc	%g2,	%l5,	%l1
	fmovdcc	%xcc,	%f27,	%f13
	edge32ln	%l2,	%i6,	%i2
	ldsb	[%l7 + 0x4C],	%g3
	nop
	set	0x7C, %i5
	stw	%i3,	[%l7 + %i5]
	fornot1s	%f25,	%f7,	%f16
	ldd	[%l7 + 0x78],	%f26
	movneg	%xcc,	%g6,	%l0
	orn	%o6,	0x031F,	%i7
	movgu	%icc,	%l4,	%g4
	orcc	%i1,	0x0820,	%o3
	fzeros	%f24
	ldsh	[%l7 + 0x34],	%i5
	array32	%g5,	%g7,	%l6
	orcc	%o0,	0x0FE1,	%o2
	addcc	%l3,	%g1,	%i0
	sth	%o5,	[%l7 + 0x36]
	sth	%o4,	[%l7 + 0x72]
	edge16n	%o1,	%o7,	%i4
	edge32n	%g2,	%l5,	%l2
	edge16ln	%l1,	%i2,	%g3
	ld	[%l7 + 0x20],	%f26
	addc	%i6,	0x0EF1,	%i3
	edge32l	%l0,	%g6,	%o6
	sll	%i7,	%g4,	%i1
	ldsw	[%l7 + 0x24],	%l4
	xnorcc	%o3,	%g5,	%g7
	fornot1s	%f31,	%f2,	%f0
	addc	%i5,	%o0,	%o2
	edge32	%l6,	%g1,	%l3
	fmovrdlez	%o5,	%f16,	%f30
	xor	%i0,	%o1,	%o4
	srl	%i4,	%g2,	%l5
	ldx	[%l7 + 0x08],	%l2
	sdivcc	%o7,	0x1ADB,	%i2
	array16	%g3,	%i6,	%i3
	ldd	[%l7 + 0x30],	%f2
	ldx	[%l7 + 0x70],	%l0
	movrgz	%g6,	0x04F,	%o6
	udiv	%l1,	0x1FEE,	%g4
	movgu	%xcc,	%i1,	%l4
	srl	%i7,	0x08,	%g5
	stb	%g7,	[%l7 + 0x7F]
	andn	%o3,	%i5,	%o2
	add	%o0,	0x0518,	%g1
	movleu	%icc,	%l6,	%l3
	popc	0x116D,	%i0
	fnot1	%f0,	%f12
	edge16	%o5,	%o4,	%o1
	movleu	%xcc,	%i4,	%l5
	udivcc	%g2,	0x0F13,	%o7
	addcc	%l2,	%i2,	%g3
	movpos	%icc,	%i6,	%i3
	addc	%g6,	0x1BFE,	%l0
	sub	%l1,	0x156B,	%o6
	stb	%i1,	[%l7 + 0x10]
	edge8l	%l4,	%i7,	%g5
	edge32l	%g7,	%o3,	%g4
	fzero	%f14
	sll	%o2,	%o0,	%g1
	movn	%xcc,	%i5,	%l3
	array16	%l6,	%i0,	%o5
	ld	[%l7 + 0x60],	%f30
	fsrc1	%f14,	%f10
	orn	%o1,	%o4,	%i4
	fmovdg	%xcc,	%f2,	%f11
	stb	%g2,	[%l7 + 0x22]
	ld	[%l7 + 0x58],	%f19
	mova	%xcc,	%l5,	%o7
	sra	%l2,	%g3,	%i2
	alignaddrl	%i6,	%i3,	%l0
	srax	%g6,	%l1,	%o6
	ldsh	[%l7 + 0x26],	%i1
	fmovdne	%icc,	%f23,	%f11
	andcc	%i7,	0x02BB,	%l4
	popc	%g5,	%g7
	fmovda	%icc,	%f1,	%f22
	nop
	set	0x42, %l4
	sth	%g4,	[%l7 + %l4]
	movrgz	%o2,	%o0,	%g1
	fpackfix	%f6,	%f0
	addccc	%o3,	0x1C07,	%l3
	edge8n	%i5,	%i0,	%o5
	movrlez	%o1,	0x29C,	%o4
	fone	%f6
	array8	%i4,	%g2,	%l6
	fnand	%f24,	%f24,	%f0
	xnor	%o7,	%l5,	%g3
	mulscc	%i2,	0x08A7,	%i6
	sdivx	%l2,	0x159E,	%i3
	andcc	%l0,	%l1,	%o6
	fnot1s	%f31,	%f19
	edge16n	%g6,	%i1,	%l4
	xnorcc	%i7,	%g5,	%g4
	stx	%o2,	[%l7 + 0x38]
	sub	%g7,	0x0C7B,	%o0
	subc	%o3,	%l3,	%g1
	edge8ln	%i0,	%o5,	%i5
	st	%f9,	[%l7 + 0x68]
	addcc	%o1,	%i4,	%o4
	fsrc2s	%f15,	%f7
	fcmpne16	%f14,	%f30,	%l6
	edge32n	%o7,	%g2,	%l5
	mova	%xcc,	%i2,	%g3
	movre	%l2,	%i3,	%i6
	ldsb	[%l7 + 0x5D],	%l0
	mulscc	%l1,	0x1988,	%o6
	stw	%i1,	[%l7 + 0x28]
	orcc	%g6,	%i7,	%g5
	movgu	%icc,	%l4,	%g4
	udivx	%g7,	0x06FF,	%o2
	movgu	%icc,	%o3,	%o0
	ld	[%l7 + 0x7C],	%f24
	movrgez	%l3,	%g1,	%i0
	edge32	%i5,	%o5,	%o1
	xor	%i4,	0x172F,	%o4
	fmuld8sux16	%f2,	%f9,	%f0
	andncc	%o7,	%l6,	%g2
	addccc	%l5,	%g3,	%i2
	fxnor	%f22,	%f28,	%f22
	fxor	%f8,	%f8,	%f8
	xnor	%l2,	%i6,	%i3
	ldd	[%l7 + 0x70],	%f20
	sdiv	%l0,	0x1E1F,	%o6
	movcc	%icc,	%l1,	%g6
	movl	%icc,	%i7,	%i1
	edge32l	%g5,	%l4,	%g7
	orn	%o2,	0x03A4,	%g4
	movrgez	%o3,	%l3,	%o0
	ldx	[%l7 + 0x70],	%g1
	fpsub32	%f16,	%f14,	%f0
	array16	%i5,	%i0,	%o5
	movn	%xcc,	%i4,	%o4
	movre	%o1,	0x049,	%o7
	movrlez	%l6,	%l5,	%g3
	addc	%g2,	%i2,	%i6
	nop
	set	0x7C, %o6
	stw	%i3,	[%l7 + %o6]
	subcc	%l0,	0x03FC,	%o6
	edge32l	%l1,	%l2,	%g6
	movvs	%icc,	%i7,	%g5
	movle	%xcc,	%l4,	%i1
	sllx	%o2,	%g4,	%g7
	move	%icc,	%l3,	%o0
	fmovrde	%g1,	%f0,	%f10
	movvc	%icc,	%i5,	%o3
	edge16n	%i0,	%o5,	%i4
	movrne	%o4,	0x13C,	%o7
	movpos	%icc,	%o1,	%l5
	edge8n	%g3,	%g2,	%l6
	fnegs	%f22,	%f23
	addc	%i2,	%i3,	%l0
	sethi	0x0BF6,	%o6
	edge32	%l1,	%i6,	%g6
	edge16	%l2,	%g5,	%i7
	ldub	[%l7 + 0x3F],	%l4
	ldub	[%l7 + 0x14],	%o2
	edge8n	%g4,	%i1,	%l3
	fmul8x16au	%f9,	%f27,	%f8
	add	%o0,	%g7,	%i5
	fcmpgt16	%f16,	%f28,	%o3
	save %g1, 0x1C27, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i4,	%o4,	%o5
	ld	[%l7 + 0x40],	%f22
	srax	%o1,	0x00,	%o7
	movpos	%icc,	%g3,	%g2
	edge32n	%l5,	%i2,	%l6
	fandnot2	%f12,	%f20,	%f18
	movg	%icc,	%l0,	%i3
	stx	%o6,	[%l7 + 0x68]
	fpack32	%f0,	%f30,	%f2
	movneg	%icc,	%i6,	%g6
	and	%l1,	0x143C,	%g5
	st	%f17,	[%l7 + 0x3C]
	addccc	%i7,	%l4,	%o2
	stw	%l2,	[%l7 + 0x30]
	umul	%g4,	%l3,	%o0
	mova	%icc,	%g7,	%i1
	fxnors	%f13,	%f14,	%f26
	ldsw	[%l7 + 0x78],	%i5
	array16	%o3,	%g1,	%i4
	udiv	%i0,	0x0157,	%o5
	restore %o1, %o4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o7,	0x139D,	%l5
	ldsh	[%l7 + 0x1C],	%i2
	ldx	[%l7 + 0x38],	%g2
	orcc	%l6,	%i3,	%l0
	srlx	%o6,	%i6,	%g6
	movn	%icc,	%l1,	%i7
	srlx	%l4,	0x06,	%o2
	sra	%g5,	0x13,	%g4
	fexpand	%f10,	%f24
	lduw	[%l7 + 0x4C],	%l3
	fands	%f30,	%f3,	%f8
	fexpand	%f13,	%f18
	stw	%l2,	[%l7 + 0x40]
	fornot1	%f20,	%f24,	%f30
	std	%f28,	[%l7 + 0x08]
	movl	%xcc,	%o0,	%g7
	umulcc	%i5,	%o3,	%i1
	umulcc	%g1,	0x11EA,	%i0
	or	%i4,	0x1DB3,	%o1
	faligndata	%f14,	%f20,	%f20
	fmovs	%f11,	%f15
	stw	%o5,	[%l7 + 0x28]
	orncc	%o4,	%g3,	%l5
	udivcc	%i2,	0x1D7B,	%g2
	lduh	[%l7 + 0x3A],	%l6
	edge8	%i3,	%o7,	%l0
	faligndata	%f10,	%f22,	%f28
	addccc	%i6,	0x0514,	%o6
	std	%f0,	[%l7 + 0x08]
	edge32n	%l1,	%i7,	%g6
	fnegd	%f0,	%f6
	fxnors	%f10,	%f31,	%f31
	edge8ln	%l4,	%o2,	%g5
	fcmpes	%fcc0,	%f14,	%f30
	ld	[%l7 + 0x6C],	%f29
	stx	%g4,	[%l7 + 0x18]
	std	%f10,	[%l7 + 0x38]
	srlx	%l2,	%o0,	%g7
	sdiv	%l3,	0x1194,	%o3
	edge8n	%i5,	%g1,	%i1
	fmuld8sux16	%f1,	%f22,	%f18
	move	%icc,	%i0,	%o1
	addcc	%i4,	%o5,	%g3
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%o4
	stx	%i2,	[%l7 + 0x78]
	ldd	[%l7 + 0x58],	%l4
	fsrc1s	%f26,	%f4
	edge32	%g2,	%l6,	%o7
	orn	%i3,	0x11EE,	%i6
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	movgu	%xcc,	%l1,	%g6
	ldsb	[%l7 + 0x2D],	%o2
	nop
	set	0x44, %g4
	ldsw	[%l7 + %g4],	%g5
	edge32l	%g4,	%l4,	%o0
	andn	%g7,	%l2,	%o3
	fpsub16s	%f8,	%f23,	%f25
	popc	0x0624,	%i5
	umul	%g1,	0x05B4,	%l3
	umul	%i0,	0x09F4,	%o1
	ldub	[%l7 + 0x58],	%i1
	fmovsle	%icc,	%f6,	%f25
	movvs	%icc,	%o5,	%i4
	udivx	%g3,	0x1CD8,	%i2
	alignaddr	%l5,	%o4,	%g2
	orcc	%l6,	0x0AB4,	%i3
	std	%f22,	[%l7 + 0x70]
	subccc	%o7,	0x1AED,	%i6
	subc	%o6,	%l0,	%l1
	movg	%xcc,	%g6,	%i7
	subcc	%g5,	%o2,	%l4
	fcmpeq16	%f8,	%f8,	%o0
	popc	%g7,	%g4
	orncc	%o3,	0x16C5,	%l2
	or	%g1,	0x1F55,	%i5
	move	%icc,	%l3,	%o1
	smul	%i0,	0x15A2,	%i1
	umul	%i4,	0x15F2,	%g3
	fones	%f6
	stw	%o5,	[%l7 + 0x4C]
	andcc	%l5,	0x03A5,	%o4
	movpos	%icc,	%g2,	%i2
	alignaddrl	%i3,	%o7,	%l6
	bshuffle	%f14,	%f28,	%f12
	sdivcc	%o6,	0x107E,	%l0
	ldd	[%l7 + 0x70],	%l0
	fmovdvc	%xcc,	%f4,	%f6
	edge32n	%i6,	%i7,	%g6
	movre	%g5,	0x0EC,	%o2
	mulscc	%l4,	%g7,	%o0
	movcc	%icc,	%o3,	%l2
	ldx	[%l7 + 0x40],	%g4
	sdivx	%i5,	0x1ED6,	%g1
	edge32l	%o1,	%l3,	%i0
	fmovsg	%icc,	%f19,	%f11
	smulcc	%i4,	%g3,	%i1
	srl	%l5,	0x11,	%o5
	movl	%icc,	%o4,	%g2
	fmovdneg	%xcc,	%f26,	%f26
	ldd	[%l7 + 0x60],	%i2
	edge16	%o7,	%l6,	%i3
	fandnot2s	%f30,	%f19,	%f2
	subcc	%o6,	0x11C2,	%l0
	xor	%l1,	0x1E88,	%i6
	sir	0x0851
	fcmpeq16	%f6,	%f16,	%g6
	fmovdn	%icc,	%f25,	%f22
	movn	%xcc,	%i7,	%o2
	srlx	%l4,	0x19,	%g5
	alignaddr	%o0,	%o3,	%l2
	lduw	[%l7 + 0x5C],	%g7
	sdivx	%i5,	0x0C34,	%g1
	movrlz	%g4,	%o1,	%i0
	smulcc	%l3,	%g3,	%i4
	fornot2s	%f29,	%f22,	%f4
	xorcc	%l5,	%o5,	%o4
	mulx	%i1,	%g2,	%i2
	movrne	%l6,	0x11D,	%i3
	movne	%xcc,	%o6,	%l0
	ldsb	[%l7 + 0x39],	%l1
	smulcc	%o7,	0x1B35,	%i6
	nop
	set	0x76, %g7
	ldsh	[%l7 + %g7],	%g6
	srl	%i7,	0x0D,	%o2
	fmovde	%icc,	%f25,	%f9
	movg	%xcc,	%g5,	%l4
	or	%o3,	%o0,	%l2
	xnor	%g7,	%i5,	%g4
	for	%f24,	%f10,	%f22
	st	%f18,	[%l7 + 0x6C]
	mulx	%o1,	0x09DC,	%g1
	ldd	[%l7 + 0x48],	%f18
	movrgz	%i0,	%l3,	%i4
	fmovspos	%xcc,	%f15,	%f23
	fors	%f20,	%f14,	%f3
	edge32ln	%g3,	%l5,	%o5
	movcc	%icc,	%i1,	%o4
	udiv	%g2,	0x0976,	%l6
	edge32n	%i2,	%i3,	%o6
	addccc	%l1,	0x0B63,	%l0
	lduh	[%l7 + 0x58],	%o7
	alignaddrl	%i6,	%i7,	%g6
	edge8n	%g5,	%o2,	%l4
	fxor	%f10,	%f8,	%f8
	fmul8ulx16	%f0,	%f16,	%f0
	or	%o3,	0x1AC7,	%l2
	srlx	%o0,	0x0D,	%i5
	subccc	%g4,	%g7,	%g1
	movl	%icc,	%o1,	%l3
	movrgz	%i4,	0x2C9,	%g3
	movrgez	%i0,	%o5,	%l5
	subccc	%i1,	0x062C,	%o4
	fnegs	%f9,	%f7
	fmovsg	%icc,	%f3,	%f24
	xnor	%l6,	0x1AAB,	%g2
	edge8n	%i3,	%i2,	%l1
	ldd	[%l7 + 0x28],	%f16
	sdivcc	%l0,	0x0F28,	%o7
	fnot2	%f12,	%f2
	save %o6, 0x03BD, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g6,	[%l7 + 0x4C]
	srl	%g5,	%i7,	%l4
	fcmpes	%fcc1,	%f29,	%f23
	edge8	%o3,	%l2,	%o2
	xnorcc	%i5,	0x1E1D,	%g4
	udivx	%o0,	0x0C8E,	%g1
	fornot2s	%f26,	%f1,	%f1
	fmul8x16al	%f2,	%f12,	%f8
	movle	%icc,	%o1,	%g7
	ldsh	[%l7 + 0x7C],	%l3
	fandnot2s	%f14,	%f26,	%f23
	save %i4, %i0, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%l5,	%i1
	fpadd32	%f20,	%f0,	%f24
	movrlz	%o5,	%l6,	%o4
	addcc	%i3,	%g2,	%l1
	edge32ln	%i2,	%o7,	%o6
	alignaddrl	%i6,	%l0,	%g5
	andn	%g6,	%i7,	%o3
	fmovsl	%xcc,	%f16,	%f0
	srax	%l4,	0x1F,	%l2
	movleu	%icc,	%o2,	%g4
	lduw	[%l7 + 0x7C],	%o0
	restore %g1, 0x0935, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%i5,	%l3
	edge8l	%i4,	%g7,	%g3
	udivx	%l5,	0x119F,	%i0
	edge32l	%i1,	%l6,	%o4
	movrgz	%i3,	0x15C,	%o5
	fcmple32	%f6,	%f14,	%l1
	movrlez	%g2,	0x083,	%o7
	fcmps	%fcc0,	%f28,	%f1
	fcmps	%fcc0,	%f28,	%f2
	stw	%o6,	[%l7 + 0x4C]
	smul	%i2,	%i6,	%g5
	ld	[%l7 + 0x4C],	%f0
	movneg	%icc,	%l0,	%g6
	xorcc	%o3,	%l4,	%i7
	sub	%l2,	0x1DDD,	%o2
	mulx	%g4,	0x18A3,	%g1
	edge32	%o0,	%i5,	%o1
	ldx	[%l7 + 0x30],	%l3
	fornot2	%f6,	%f22,	%f12
	addc	%i4,	%g7,	%l5
	edge16l	%i0,	%g3,	%i1
	fmul8ulx16	%f18,	%f24,	%f30
	ldx	[%l7 + 0x18],	%o4
	fmovrslez	%i3,	%f18,	%f23
	edge16ln	%o5,	%l1,	%g2
	move	%icc,	%o7,	%l6
	stw	%o6,	[%l7 + 0x14]
	andcc	%i6,	%i2,	%g5
	fmovda	%xcc,	%f13,	%f14
	sll	%g6,	0x01,	%o3
	popc	0x020A,	%l0
	stx	%l4,	[%l7 + 0x48]
	smul	%i7,	%l2,	%o2
	ldd	[%l7 + 0x18],	%g4
	lduw	[%l7 + 0x6C],	%o0
	edge32	%g1,	%o1,	%i5
	subc	%l3,	0x1963,	%g7
	orcc	%l5,	%i0,	%g3
	movg	%xcc,	%i1,	%i4
	stw	%i3,	[%l7 + 0x74]
	fmovrdgz	%o4,	%f18,	%f30
	xorcc	%l1,	0x0B9A,	%g2
	subcc	%o7,	%o5,	%l6
	subcc	%i6,	0x0018,	%i2
	fmovdcc	%icc,	%f20,	%f22
	movle	%icc,	%o6,	%g5
	std	%f16,	[%l7 + 0x30]
	fnot2s	%f6,	%f20
	sllx	%o3,	%g6,	%l0
	movcs	%xcc,	%i7,	%l2
	array8	%o2,	%l4,	%g4
	popc	0x0B5D,	%o0
	fmovd	%f22,	%f28
	fcmpne32	%f12,	%f8,	%g1
	andn	%o1,	0x080A,	%l3
	orcc	%g7,	%l5,	%i5
	lduh	[%l7 + 0x38],	%i0
	addc	%i1,	0x06A0,	%i4
	movrlz	%i3,	%o4,	%l1
	fpsub32	%f0,	%f8,	%f12
	edge8	%g2,	%g3,	%o5
	fcmpes	%fcc3,	%f11,	%f20
	fmovrdne	%l6,	%f28,	%f30
	fmuld8ulx16	%f21,	%f12,	%f14
	andncc	%i6,	%i2,	%o7
	ldd	[%l7 + 0x50],	%f18
	movg	%icc,	%o6,	%o3
	lduh	[%l7 + 0x46],	%g5
	fpsub16	%f28,	%f14,	%f18
	edge32l	%l0,	%i7,	%l2
	movg	%icc,	%o2,	%l4
	subc	%g6,	0x03E7,	%g4
	movvc	%icc,	%o0,	%o1
	movre	%l3,	%g7,	%g1
	mulscc	%i5,	%i0,	%i1
	ldsh	[%l7 + 0x30],	%l5
	and	%i4,	0x0BCA,	%o4
	movrgz	%l1,	0x0B6,	%i3
	andcc	%g3,	0x03A9,	%g2
	addc	%o5,	0x0C31,	%l6
	orncc	%i6,	%o7,	%o6
	fnot1	%f30,	%f0
	fnands	%f8,	%f24,	%f7
	edge16ln	%i2,	%o3,	%g5
	subc	%i7,	%l2,	%l0
	udivcc	%o2,	0x0D0B,	%l4
	fmovdpos	%icc,	%f8,	%f2
	movvc	%xcc,	%g4,	%o0
	fmovdgu	%icc,	%f15,	%f5
	movg	%xcc,	%o1,	%l3
	mulscc	%g6,	%g7,	%g1
	srax	%i0,	%i1,	%i5
	stw	%i4,	[%l7 + 0x2C]
	popc	0x1391,	%l5
	edge8l	%o4,	%l1,	%g3
	sdivx	%i3,	0x04AC,	%o5
	ldd	[%l7 + 0x08],	%i6
	orn	%i6,	%o7,	%g2
	umul	%i2,	0x045A,	%o3
	edge32n	%g5,	%i7,	%o6
	xnor	%l0,	%o2,	%l2
	srax	%g4,	0x06,	%o0
	sth	%o1,	[%l7 + 0x08]
	ld	[%l7 + 0x0C],	%f10
	mulscc	%l4,	%g6,	%l3
	fpadd32s	%f19,	%f15,	%f6
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	or	%i1,	%i0,	%i5
	umul	%i4,	0x1A92,	%o4
	fcmpeq32	%f0,	%f22,	%l5
	bshuffle	%f28,	%f12,	%f16
	movrne	%l1,	%g3,	%o5
	andcc	%i3,	%l6,	%o7
	movvc	%xcc,	%i6,	%g2
	save %o3, 0x1058, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i7,	%o6,	%l0
	andn	%g5,	0x07E2,	%l2
	fxor	%f6,	%f28,	%f30
	umul	%o2,	%g4,	%o1
	sllx	%l4,	0x0A,	%g6
	movneg	%icc,	%o0,	%l3
	stx	%g1,	[%l7 + 0x20]
	lduw	[%l7 + 0x38],	%i1
	stw	%g7,	[%l7 + 0x1C]
	movvs	%icc,	%i0,	%i4
	sethi	0x16A4,	%i5
	fcmpgt32	%f10,	%f28,	%o4
	fmovdg	%icc,	%f6,	%f26
	fmovsgu	%icc,	%f8,	%f22
	sdivcc	%l1,	0x008D,	%g3
	srax	%l5,	%i3,	%o5
	edge32l	%l6,	%i6,	%g2
	fmovdne	%icc,	%f22,	%f7
	andn	%o3,	%i2,	%o7
	umul	%i7,	0x0712,	%l0
	ldsw	[%l7 + 0x48],	%g5
	movrgez	%l2,	%o6,	%g4
	fmovrslz	%o2,	%f5,	%f15
	movleu	%icc,	%l4,	%g6
	movl	%xcc,	%o1,	%l3
	and	%o0,	%g1,	%g7
	fpsub16s	%f19,	%f31,	%f5
	mova	%xcc,	%i0,	%i1
	fmovrdgez	%i4,	%f16,	%f28
	lduh	[%l7 + 0x70],	%o4
	move	%xcc,	%i5,	%l1
	andncc	%l5,	%i3,	%o5
	save %l6, 0x17DD, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f20,	%f7
	xorcc	%g2,	0x0963,	%o3
	fmovsne	%icc,	%f19,	%f16
	movneg	%icc,	%i6,	%o7
	fmovsn	%icc,	%f24,	%f27
	fmovdl	%icc,	%f12,	%f31
	movgu	%xcc,	%i2,	%i7
	srax	%g5,	%l0,	%o6
	fmovdg	%xcc,	%f11,	%f8
	fmovde	%xcc,	%f26,	%f19
	lduh	[%l7 + 0x70],	%g4
	ldd	[%l7 + 0x60],	%l2
	movne	%icc,	%o2,	%l4
	fandnot2s	%f28,	%f28,	%f29
	umul	%g6,	0x1486,	%o1
	movvc	%icc,	%o0,	%g1
	sth	%l3,	[%l7 + 0x38]
	or	%g7,	0x02F4,	%i1
	fornot1s	%f15,	%f17,	%f16
	movvc	%icc,	%i0,	%o4
	umul	%i5,	%i4,	%l5
	smul	%i3,	%l1,	%o5
	stb	%l6,	[%l7 + 0x73]
	movre	%g3,	0x181,	%o3
	andn	%g2,	%o7,	%i2
	fmovrde	%i6,	%f22,	%f16
	array8	%i7,	%g5,	%l0
	and	%g4,	%o6,	%o2
	fabsd	%f10,	%f10
	movrlez	%l4,	0x3E5,	%l2
	sdivx	%o1,	0x01BB,	%o0
	bshuffle	%f20,	%f2,	%f6
	edge16l	%g1,	%g6,	%g7
	movrgz	%i1,	0x340,	%i0
	mulscc	%l3,	%o4,	%i4
	edge16ln	%i5,	%l5,	%i3
	fmul8x16	%f7,	%f24,	%f10
	fmovrsgez	%o5,	%f31,	%f0
	movcc	%icc,	%l1,	%g3
	movcc	%xcc,	%o3,	%l6
	fmovd	%f2,	%f18
	udivcc	%g2,	0x0B42,	%o7
	movrgez	%i2,	%i7,	%g5
	edge8n	%l0,	%g4,	%i6
	array8	%o2,	%o6,	%l2
	movvc	%xcc,	%o1,	%l4
	stx	%g1,	[%l7 + 0x10]
	fandnot2	%f26,	%f16,	%f18
	sllx	%o0,	0x05,	%g7
	fmovdge	%icc,	%f16,	%f19
	save %g6, %i1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i0,	%o4,	%i5
	fcmps	%fcc3,	%f3,	%f20
	sdivcc	%l5,	0x0575,	%i4
	addccc	%i3,	%l1,	%g3
	or	%o3,	0x1C74,	%l6
	stx	%g2,	[%l7 + 0x08]
	movneg	%icc,	%o7,	%o5
	movneg	%icc,	%i7,	%g5
	mulscc	%l0,	0x0CA0,	%i2
	movn	%xcc,	%i6,	%o2
	subccc	%o6,	%g4,	%o1
	xorcc	%l2,	%l4,	%g1
	ldx	[%l7 + 0x28],	%g7
	or	%g6,	%o0,	%l3
	movpos	%icc,	%i0,	%i1
	umulcc	%o4,	%l5,	%i4
	ldsb	[%l7 + 0x53],	%i3
	addccc	%i5,	%l1,	%o3
	ldsh	[%l7 + 0x46],	%g3
	movne	%icc,	%g2,	%l6
	edge32l	%o7,	%o5,	%g5
	alignaddr	%l0,	%i2,	%i7
	faligndata	%f6,	%f16,	%f22
	movrne	%o2,	0x092,	%i6
	fornot1	%f4,	%f26,	%f22
	fandnot1	%f10,	%f4,	%f4
	fexpand	%f6,	%f16
	alignaddrl	%o6,	%o1,	%l2
	add	%l4,	%g4,	%g1
	movcs	%icc,	%g6,	%o0
	movrlz	%l3,	%g7,	%i1
	movrne	%i0,	%l5,	%i4
	edge16n	%o4,	%i5,	%i3
	ldd	[%l7 + 0x18],	%f18
	fnands	%f31,	%f20,	%f6
	addccc	%l1,	%o3,	%g3
	ldsw	[%l7 + 0x20],	%l6
	restore %o7, %o5, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x4B],	%l0
	addc	%g5,	0x04B8,	%i7
	array32	%i2,	%i6,	%o6
	fpsub16	%f16,	%f22,	%f28
	ldx	[%l7 + 0x20],	%o2
	addc	%l2,	0x0BBE,	%o1
	movrgez	%l4,	0x106,	%g4
	edge32l	%g1,	%o0,	%g6
	srax	%g7,	%l3,	%i1
	add	%l5,	%i4,	%i0
	ldd	[%l7 + 0x40],	%f24
	edge32ln	%i5,	%i3,	%l1
	subc	%o3,	%o4,	%l6
	fnors	%f8,	%f27,	%f2
	movne	%icc,	%o7,	%o5
	srax	%g3,	0x00,	%g2
	ldd	[%l7 + 0x30],	%f28
	array8	%g5,	%l0,	%i2
	subcc	%i7,	0x080E,	%o6
	movleu	%xcc,	%o2,	%i6
	movleu	%icc,	%o1,	%l4
	movvs	%icc,	%l2,	%g4
	umul	%o0,	%g6,	%g1
	movrlez	%g7,	%i1,	%l5
	fsrc2	%f28,	%f18
	std	%f0,	[%l7 + 0x50]
	movvs	%icc,	%l3,	%i4
	std	%f10,	[%l7 + 0x50]
	add	%i5,	%i0,	%i3
	movg	%icc,	%l1,	%o4
	array32	%l6,	%o7,	%o5
	ldsh	[%l7 + 0x3E],	%o3
	fsrc1s	%f26,	%f11
	ldd	[%l7 + 0x10],	%f18
	movrlez	%g2,	0x1E2,	%g3
	or	%l0,	0x1F8D,	%i2
	sllx	%i7,	%g5,	%o2
	fzeros	%f14
	movge	%xcc,	%i6,	%o1
	fmovdpos	%xcc,	%f14,	%f30
	edge8l	%l4,	%o6,	%g4
	orcc	%l2,	%g6,	%o0
	movleu	%xcc,	%g7,	%i1
	subc	%g1,	%l5,	%l3
	movrlez	%i5,	0x012,	%i4
	mulscc	%i3,	%i0,	%o4
	edge32	%l6,	%l1,	%o7
	lduh	[%l7 + 0x1C],	%o3
	fmul8x16au	%f24,	%f24,	%f14
	sethi	0x1FBA,	%g2
	fmovsneg	%xcc,	%f9,	%f2
	save %o5, %g3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i2,	%i7,	%g5
	array32	%i6,	%o2,	%l4
	sdivcc	%o6,	0x0774,	%g4
	sethi	0x1E23,	%l2
	subcc	%g6,	0x1099,	%o1
	edge16l	%g7,	%i1,	%o0
	xorcc	%g1,	%l5,	%i5
	movn	%icc,	%i4,	%i3
	addc	%i0,	0x1798,	%l3
	fmovsge	%icc,	%f6,	%f26
	mulscc	%o4,	%l1,	%o7
	edge8n	%l6,	%g2,	%o5
	stw	%o3,	[%l7 + 0x44]
	movge	%icc,	%l0,	%i2
	fmovdcc	%xcc,	%f22,	%f22
	lduh	[%l7 + 0x78],	%i7
	fpsub16s	%f28,	%f15,	%f18
	popc	%g3,	%g5
	edge32n	%o2,	%i6,	%l4
	fmovscs	%xcc,	%f14,	%f21
	edge8l	%g4,	%o6,	%l2
	fcmpeq16	%f28,	%f10,	%o1
	or	%g6,	%i1,	%o0
	fone	%f6
	move	%xcc,	%g1,	%g7
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%l4
	lduh	[%l7 + 0x2A],	%i5
	alignaddr	%i3,	%i0,	%l3
	edge32n	%o4,	%i4,	%l1
	orn	%o7,	%g2,	%o5
	movg	%xcc,	%o3,	%l0
	fnor	%f22,	%f2,	%f26
	sub	%i2,	%i7,	%g3
	orncc	%g5,	%o2,	%i6
	udivcc	%l6,	0x1C5E,	%l4
	sethi	0x1C9D,	%g4
	fnegs	%f25,	%f4
	array8	%l2,	%o1,	%g6
	movn	%icc,	%i1,	%o6
	fmovscs	%xcc,	%f0,	%f27
	movpos	%icc,	%o0,	%g7
	movne	%icc,	%l5,	%i5
	sdivcc	%i3,	0x15E4,	%g1
	addcc	%i0,	0x0468,	%l3
	sir	0x11C6
	mova	%icc,	%o4,	%l1
	fmul8sux16	%f18,	%f2,	%f22
	movpos	%icc,	%i4,	%g2
	fmovdl	%icc,	%f24,	%f20
	movneg	%icc,	%o7,	%o5
	edge16l	%o3,	%i2,	%l0
	edge16n	%i7,	%g3,	%g5
	fmovda	%icc,	%f26,	%f9
	movpos	%xcc,	%i6,	%l6
	movn	%icc,	%l4,	%g4
	xnorcc	%l2,	%o1,	%o2
	edge32ln	%i1,	%g6,	%o0
	fcmple32	%f0,	%f2,	%g7
	mulx	%o6,	0x09D0,	%i5
	sethi	0x0E71,	%i3
	sdiv	%g1,	0x031F,	%i0
	xor	%l3,	%l5,	%o4
	sllx	%l1,	%g2,	%o7
	edge16l	%i4,	%o3,	%i2
	edge8ln	%o5,	%i7,	%l0
	sir	0x03DB
	ld	[%l7 + 0x44],	%f15
	or	%g3,	%g5,	%l6
	alignaddr	%i6,	%g4,	%l4
	save %l2, 0x0428, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o2,	%i1,	%g6
	mulscc	%o0,	%o6,	%g7
	edge16n	%i5,	%g1,	%i3
	movcc	%xcc,	%i0,	%l3
	movle	%xcc,	%o4,	%l1
	fmovdgu	%icc,	%f26,	%f29
	ldub	[%l7 + 0x62],	%l5
	andncc	%g2,	%o7,	%i4
	movrne	%i2,	0x2A6,	%o5
	fmovrdgz	%i7,	%f16,	%f12
	movvc	%icc,	%l0,	%g3
	fmovrde	%g5,	%f30,	%f28
	stw	%o3,	[%l7 + 0x38]
	subc	%l6,	%i6,	%g4
	andcc	%l4,	0x0D81,	%o1
	faligndata	%f0,	%f6,	%f2
	subcc	%l2,	0x0A92,	%o2
	fmovdn	%icc,	%f14,	%f6
	sllx	%g6,	%i1,	%o0
	orcc	%g7,	0x1148,	%i5
	st	%f13,	[%l7 + 0x28]
	ldsb	[%l7 + 0x2A],	%g1
	sth	%o6,	[%l7 + 0x24]
	fmul8ulx16	%f30,	%f0,	%f6
	fpsub32	%f4,	%f28,	%f10
	lduh	[%l7 + 0x16],	%i0
	fmovdleu	%xcc,	%f23,	%f27
	mova	%xcc,	%l3,	%i3
	movgu	%icc,	%o4,	%l1
	edge8l	%l5,	%g2,	%i4
	ldx	[%l7 + 0x38],	%i2
	nop
	set	0x34, %o7
	lduw	[%l7 + %o7],	%o5
	xnorcc	%i7,	0x0E48,	%o7
	sir	0x1E27
	edge16	%g3,	%l0,	%o3
	fpadd16	%f26,	%f6,	%f4
	srlx	%g5,	0x03,	%l6
	udivx	%i6,	0x1695,	%l4
	xor	%o1,	0x1356,	%g4
	movrgz	%o2,	%l2,	%i1
	srl	%g6,	%o0,	%g7
	udivcc	%i5,	0x1A48,	%o6
	ldsw	[%l7 + 0x74],	%i0
	udivx	%l3,	0x0F39,	%i3
	udivx	%o4,	0x143E,	%g1
	sub	%l1,	0x1F9D,	%l5
	fornot1s	%f15,	%f17,	%f16
	fmovrdne	%i4,	%f28,	%f4
	popc	%i2,	%g2
	edge8ln	%i7,	%o5,	%g3
	ldsh	[%l7 + 0x38],	%l0
	siam	0x1
	sll	%o3,	0x15,	%o7
	fmovdcc	%icc,	%f22,	%f29
	move	%xcc,	%l6,	%g5
	fnegd	%f12,	%f28
	udivx	%i6,	0x1E79,	%o1
	edge8l	%g4,	%o2,	%l2
	fcmple16	%f24,	%f24,	%l4
	sdiv	%g6,	0x02BB,	%i1
	fmovda	%xcc,	%f14,	%f22
	movge	%icc,	%g7,	%o0
	siam	0x7
	fnot2	%f4,	%f10
	movle	%xcc,	%o6,	%i0
	fmovdgu	%icc,	%f27,	%f23
	srlx	%l3,	%i3,	%i5
	movrlez	%o4,	0x3B3,	%l1
	fnegs	%f20,	%f30
	sub	%g1,	%i4,	%l5
	edge16l	%i2,	%g2,	%i7
	ldsh	[%l7 + 0x18],	%o5
	udivcc	%l0,	0x0BB1,	%g3
	orcc	%o3,	0x1CCA,	%l6
	ldx	[%l7 + 0x68],	%g5
	fmovsle	%xcc,	%f16,	%f22
	movn	%xcc,	%i6,	%o1
	fmovdle	%xcc,	%f28,	%f25
	edge8ln	%g4,	%o2,	%l2
	edge16	%o7,	%g6,	%i1
	stb	%l4,	[%l7 + 0x12]
	fandnot1	%f22,	%f30,	%f16
	stw	%o0,	[%l7 + 0x58]
	edge16l	%o6,	%g7,	%l3
	subccc	%i3,	%i5,	%o4
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	edge8n	%i4,	%l5,	%g2
	fpsub16s	%f16,	%f2,	%f3
	fmovrslz	%i2,	%f5,	%f5
	xnorcc	%i7,	%l0,	%g3
	edge16ln	%o5,	%l6,	%o3
	fmul8ulx16	%f0,	%f4,	%f20
	add	%i6,	0x144D,	%o1
	sdivx	%g5,	0x19D6,	%o2
	fcmpes	%fcc2,	%f26,	%f4
	edge16ln	%g4,	%l2,	%g6
	mulscc	%o7,	%l4,	%i1
	fmovrde	%o6,	%f24,	%f8
	edge32n	%g7,	%o0,	%l3
	sth	%i3,	[%l7 + 0x6A]
	andcc	%i5,	0x1351,	%l1
	fmovrslz	%g1,	%f31,	%f25
	addcc	%o4,	%i0,	%i4
	mova	%xcc,	%l5,	%i2
	mova	%xcc,	%i7,	%g2
	fpadd32	%f16,	%f14,	%f22
	mulscc	%g3,	0x1806,	%l0
	fmovrdgz	%l6,	%f28,	%f10
	movcs	%icc,	%o5,	%i6
	fmovsleu	%xcc,	%f0,	%f1
	movneg	%xcc,	%o3,	%g5
	sdiv	%o2,	0x0538,	%g4
	sllx	%l2,	0x1A,	%o1
	sethi	0x07DE,	%g6
	edge16ln	%o7,	%l4,	%o6
	ld	[%l7 + 0x6C],	%f27
	edge8ln	%i1,	%o0,	%l3
	and	%g7,	%i3,	%i5
	ldsw	[%l7 + 0x50],	%g1
	ldsh	[%l7 + 0x3E],	%o4
	fmul8x16au	%f14,	%f19,	%f4
	sll	%l1,	0x1C,	%i4
	andcc	%l5,	%i2,	%i7
	fmul8x16	%f17,	%f16,	%f16
	sir	0x0BF7
	fcmpes	%fcc3,	%f30,	%f16
	lduw	[%l7 + 0x3C],	%i0
	fpsub32	%f6,	%f8,	%f18
	sllx	%g2,	0x01,	%g3
	fone	%f6
	ldd	[%l7 + 0x70],	%f12
	array16	%l6,	%l0,	%i6
	edge16	%o5,	%g5,	%o2
	movgu	%xcc,	%g4,	%l2
	fandnot1	%f16,	%f6,	%f12
	edge16n	%o1,	%o3,	%o7
	movleu	%xcc,	%g6,	%l4
	fornot2s	%f7,	%f16,	%f5
	xor	%i1,	%o6,	%o0
	movgu	%icc,	%l3,	%i3
	edge32ln	%g7,	%g1,	%i5
	smulcc	%o4,	0x00A5,	%l1
	orcc	%i4,	0x07B0,	%i2
	srax	%l5,	%i7,	%i0
	movgu	%xcc,	%g2,	%l6
	and	%l0,	%g3,	%o5
	fmovrslz	%i6,	%f1,	%f10
	smulcc	%g5,	%g4,	%o2
	xorcc	%o1,	%o3,	%l2
	stb	%g6,	[%l7 + 0x75]
	sll	%l4,	%o7,	%i1
	lduw	[%l7 + 0x68],	%o0
	movgu	%icc,	%o6,	%l3
	fands	%f27,	%f25,	%f18
	sdivcc	%i3,	0x1A36,	%g7
	bshuffle	%f20,	%f6,	%f0
	fpmerge	%f30,	%f9,	%f10
	ldd	[%l7 + 0x78],	%i4
	srl	%g1,	%o4,	%i4
	edge16ln	%i2,	%l5,	%l1
	move	%xcc,	%i7,	%i0
	movcs	%icc,	%g2,	%l6
	stb	%g3,	[%l7 + 0x3C]
	ldx	[%l7 + 0x08],	%l0
	movrlz	%i6,	%o5,	%g4
	fcmpeq16	%f4,	%f10,	%g5
	movrgez	%o2,	%o3,	%l2
	fandnot2s	%f0,	%f31,	%f6
	xor	%o1,	%l4,	%g6
	andn	%o7,	%o0,	%i1
	save %l3, 0x04AC, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %g7, 0x1AEF, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i5,	0x0CEE,	%g1
	movvc	%icc,	%i4,	%i2
	fxors	%f14,	%f19,	%f14
	move	%icc,	%l5,	%o4
	and	%l1,	%i0,	%g2
	sir	0x0754
	movrgz	%i7,	%l6,	%g3
	std	%f6,	[%l7 + 0x68]
	subcc	%i6,	%o5,	%l0
	edge32l	%g5,	%g4,	%o3
	xnor	%l2,	0x0A94,	%o1
	fxor	%f20,	%f14,	%f10
	movge	%icc,	%l4,	%g6
	popc	%o2,	%o0
	edge32	%o7,	%i1,	%l3
	move	%xcc,	%g7,	%o6
	edge8	%i5,	%i3,	%i4
	fcmps	%fcc0,	%f26,	%f20
	edge32ln	%g1,	%i2,	%o4
	fpack16	%f16,	%f12
	orcc	%l1,	%i0,	%g2
	movg	%xcc,	%l5,	%l6
	array16	%i7,	%g3,	%i6
	orncc	%l0,	0x0E5D,	%g5
	andcc	%o5,	%g4,	%o3
	fnot2s	%f9,	%f10
	edge16l	%o1,	%l2,	%g6
	movgu	%xcc,	%o2,	%o0
	fcmpd	%fcc1,	%f24,	%f12
	subccc	%o7,	%i1,	%l3
	movrlez	%l4,	0x3CD,	%o6
	xnorcc	%g7,	%i3,	%i4
	movcc	%xcc,	%i5,	%i2
	srax	%g1,	0x18,	%o4
	lduw	[%l7 + 0x5C],	%l1
	orcc	%i0,	0x133D,	%l5
	fpadd16	%f12,	%f0,	%f4
	array16	%g2,	%i7,	%g3
	movcs	%xcc,	%l6,	%i6
	srlx	%l0,	%o5,	%g5
	movvs	%xcc,	%o3,	%g4
	ldd	[%l7 + 0x08],	%l2
	orncc	%o1,	%o2,	%o0
	edge8l	%g6,	%i1,	%l3
	fxnors	%f17,	%f6,	%f3
	popc	%l4,	%o7
	addccc	%g7,	%o6,	%i3
	lduw	[%l7 + 0x24],	%i5
	ldsh	[%l7 + 0x46],	%i4
	orn	%g1,	%i2,	%l1
	bshuffle	%f24,	%f12,	%f10
	movge	%xcc,	%o4,	%i0
	popc	%g2,	%i7
	movvs	%icc,	%g3,	%l5
	popc	%l6,	%l0
	movn	%icc,	%i6,	%g5
	movcc	%icc,	%o5,	%o3
	sth	%g4,	[%l7 + 0x0A]
	andn	%o1,	0x1580,	%o2
	fcmple16	%f14,	%f20,	%l2
	sra	%o0,	%g6,	%l3
	edge32	%i1,	%l4,	%o7
	sll	%g7,	0x15,	%o6
	mova	%icc,	%i3,	%i5
	edge8l	%g1,	%i4,	%l1
	ldx	[%l7 + 0x18],	%o4
	orcc	%i0,	0x0427,	%g2
	movn	%xcc,	%i2,	%g3
	lduw	[%l7 + 0x58],	%l5
	edge32n	%l6,	%l0,	%i7
	edge16	%i6,	%o5,	%g5
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	movgu	%icc,	%g4,	%l2
	andn	%o0,	%g6,	%l3
	movpos	%xcc,	%i1,	%o2
	movrlz	%o7,	0x0E5,	%g7
	addcc	%o6,	%l4,	%i3
	smulcc	%g1,	%i4,	%i5
	movl	%icc,	%o4,	%l1
	sethi	0x110F,	%g2
	fmovd	%f4,	%f22
	smul	%i0,	%i2,	%l5
	ldsh	[%l7 + 0x14],	%l6
	fpsub16s	%f18,	%f15,	%f27
	movl	%xcc,	%l0,	%g3
	movne	%icc,	%i7,	%o5
	sll	%g5,	%o3,	%i6
	lduw	[%l7 + 0x20],	%o1
	edge8n	%l2,	%g4,	%o0
	movneg	%icc,	%g6,	%l3
	lduh	[%l7 + 0x26],	%i1
	sra	%o7,	%o2,	%g7
	edge16	%o6,	%i3,	%l4
	srax	%i4,	%i5,	%g1
	movrlz	%l1,	%o4,	%g2
	xnor	%i2,	%l5,	%i0
	udivcc	%l0,	0x017A,	%l6
	fmovrse	%g3,	%f8,	%f22
	fmovsne	%xcc,	%f8,	%f30
	movrne	%i7,	0x0C6,	%o5
	sdiv	%o3,	0x1513,	%i6
	addc	%o1,	0x111A,	%g5
	fmovdle	%xcc,	%f19,	%f4
	ldd	[%l7 + 0x78],	%l2
	addcc	%o0,	%g6,	%l3
	movrlz	%i1,	%o7,	%o2
	ld	[%l7 + 0x78],	%f20
	or	%g7,	%g4,	%o6
	stx	%i3,	[%l7 + 0x68]
	sethi	0x0E0E,	%i4
	movre	%l4,	%g1,	%l1
	xor	%i5,	0x01AE,	%g2
	fpmerge	%f5,	%f20,	%f18
	fcmps	%fcc3,	%f5,	%f9
	st	%f2,	[%l7 + 0x14]
	add	%o4,	0x0B38,	%i2
	stw	%i0,	[%l7 + 0x6C]
	nop
	set	0x14, %o5
	ldsh	[%l7 + %o5],	%l5
	alignaddrl	%l0,	%g3,	%i7
	movre	%o5,	0x0A5,	%l6
	array8	%i6,	%o3,	%g5
	fnot2	%f12,	%f6
	and	%o1,	0x0A9E,	%l2
	fsrc1s	%f17,	%f23
	movvc	%icc,	%o0,	%g6
	andn	%i1,	%o7,	%l3
	sth	%o2,	[%l7 + 0x6A]
	save %g4, %o6, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i4,	%i3
	sra	%g1,	0x0D,	%l1
	lduw	[%l7 + 0x7C],	%i5
	movcc	%icc,	%l4,	%g2
	sra	%i2,	0x11,	%o4
	smulcc	%i0,	%l5,	%g3
	movle	%icc,	%i7,	%l0
	addcc	%o5,	0x01CE,	%l6
	sir	0x0061
	fone	%f24
	edge32ln	%o3,	%i6,	%o1
	fnegd	%f16,	%f24
	xor	%g5,	0x0B3A,	%l2
	fmul8x16	%f5,	%f16,	%f28
	fornot1s	%f21,	%f11,	%f2
	udivx	%g6,	0x1170,	%i1
	sra	%o7,	0x1A,	%l3
	restore %o2, %o0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x1C],	%g7
	array32	%o6,	%i4,	%i3
	xnor	%l1,	%i5,	%g1
	ldub	[%l7 + 0x7D],	%l4
	xnor	%i2,	%g2,	%o4
	xnor	%i0,	%l5,	%i7
	edge32l	%l0,	%o5,	%g3
	nop
	set	0x56, %i1
	lduh	[%l7 + %i1],	%o3
	save %l6, 0x00D3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x70],	%o1
	fmovdvs	%xcc,	%f12,	%f26
	sllx	%l2,	0x0F,	%g6
	movrlez	%i1,	0x0F5,	%o7
	fmovrde	%l3,	%f10,	%f4
	alignaddrl	%g5,	%o0,	%o2
	stx	%g7,	[%l7 + 0x40]
	lduw	[%l7 + 0x48],	%g4
	subcc	%o6,	0x17DD,	%i4
	movn	%xcc,	%i3,	%i5
	movge	%icc,	%g1,	%l4
	movgu	%xcc,	%i2,	%l1
	fmuld8ulx16	%f7,	%f4,	%f6
	alignaddrl	%g2,	%i0,	%o4
	sll	%i7,	%l5,	%o5
	orcc	%l0,	0x05CC,	%o3
	edge32	%g3,	%l6,	%o1
	movle	%xcc,	%i6,	%l2
	fmovdneg	%icc,	%f28,	%f7
	movvc	%xcc,	%g6,	%o7
	st	%f14,	[%l7 + 0x4C]
	edge16ln	%i1,	%l3,	%o0
	edge16n	%g5,	%g7,	%o2
	move	%xcc,	%o6,	%g4
	fpack32	%f30,	%f2,	%f16
	array16	%i3,	%i4,	%i5
	movgu	%icc,	%l4,	%g1
	ldx	[%l7 + 0x60],	%l1
	fmovdpos	%icc,	%f9,	%f2
	lduw	[%l7 + 0x24],	%g2
	edge16l	%i0,	%o4,	%i7
	save %l5, 0x0201, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l0,	0x0843,	%i2
	edge16n	%o3,	%l6,	%g3
	fcmple32	%f30,	%f30,	%o1
	ldsw	[%l7 + 0x4C],	%i6
	movgu	%xcc,	%l2,	%o7
	and	%g6,	%i1,	%l3
	faligndata	%f20,	%f24,	%f4
	addccc	%g5,	%g7,	%o0
	fcmpd	%fcc2,	%f10,	%f14
	fmovsgu	%xcc,	%f3,	%f27
	array8	%o2,	%g4,	%i3
	subc	%o6,	%i5,	%l4
	fxors	%f3,	%f0,	%f1
	sth	%i4,	[%l7 + 0x0C]
	fpmerge	%f13,	%f1,	%f14
	edge16n	%g1,	%l1,	%g2
	edge8	%o4,	%i0,	%l5
	xorcc	%o5,	0x0C5B,	%i7
	movvc	%icc,	%l0,	%i2
	fmuld8ulx16	%f20,	%f2,	%f0
	fmovrse	%o3,	%f21,	%f17
	movneg	%xcc,	%l6,	%o1
	sub	%g3,	%i6,	%l2
	fmovse	%xcc,	%f6,	%f16
	fmovdle	%xcc,	%f2,	%f25
	sdivx	%g6,	0x0D64,	%i1
	fandnot1s	%f8,	%f0,	%f7
	movrgez	%l3,	%o7,	%g5
	smulcc	%o0,	%g7,	%g4
	fandnot2s	%f25,	%f31,	%f12
	st	%f21,	[%l7 + 0x10]
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	edge16l	%i5,	%o6,	%l4
	movrgz	%i4,	%g1,	%l1
	nop
	set	0x44, %i2
	ldsb	[%l7 + %i2],	%g2
	fmul8x16au	%f12,	%f21,	%f24
	or	%i0,	%l5,	%o5
	edge8	%i7,	%o4,	%l0
	array16	%o3,	%l6,	%i2
	lduw	[%l7 + 0x7C],	%o1
	fnot2s	%f24,	%f7
	addccc	%g3,	%l2,	%i6
	sdivx	%i1,	0x1866,	%l3
	subcc	%g6,	%o7,	%g5
	addccc	%o0,	%g7,	%o2
	andcc	%i3,	0x1346,	%g4
	fmovdpos	%xcc,	%f8,	%f26
	sdiv	%o6,	0x1C06,	%l4
	movg	%icc,	%i5,	%i4
	sub	%l1,	%g1,	%g2
	movrgez	%i0,	%o5,	%i7
	fone	%f16
	movvc	%icc,	%l5,	%o4
	fand	%f18,	%f26,	%f0
	edge8	%o3,	%l0,	%l6
	ldsw	[%l7 + 0x2C],	%i2
	umulcc	%g3,	0x0809,	%l2
	edge32	%o1,	%i6,	%l3
	movvs	%icc,	%g6,	%o7
	fabss	%f25,	%f23
	movgu	%xcc,	%g5,	%o0
	sethi	0x18D3,	%i1
	ldub	[%l7 + 0x6B],	%g7
	fornot1s	%f21,	%f18,	%f17
	stw	%o2,	[%l7 + 0x24]
	fxors	%f9,	%f7,	%f2
	movneg	%icc,	%g4,	%o6
	movneg	%xcc,	%l4,	%i5
	or	%i4,	%l1,	%i3
	fmovdge	%xcc,	%f16,	%f28
	movg	%xcc,	%g1,	%g2
	fmovsg	%xcc,	%f12,	%f22
	sir	0x0DCF
	edge8l	%o5,	%i0,	%l5
	fnands	%f10,	%f12,	%f4
	fmovsgu	%xcc,	%f11,	%f7
	sethi	0x11CF,	%o4
	edge32	%i7,	%o3,	%l0
	fmovsa	%icc,	%f12,	%f12
	movgu	%xcc,	%l6,	%g3
	sllx	%i2,	0x05,	%l2
	ldub	[%l7 + 0x0E],	%o1
	alignaddr	%i6,	%l3,	%o7
	movpos	%xcc,	%g6,	%g5
	fcmps	%fcc0,	%f27,	%f11
	stb	%o0,	[%l7 + 0x0E]
	sethi	0x1BBB,	%i1
	subc	%o2,	0x1BD1,	%g7
	ldd	[%l7 + 0x38],	%g4
	fmovsne	%icc,	%f28,	%f14
	sdiv	%l4,	0x03C3,	%o6
	array32	%i4,	%i5,	%l1
	ldsh	[%l7 + 0x4E],	%g1
	or	%i3,	%g2,	%i0
	ldsh	[%l7 + 0x62],	%o5
	fcmpgt32	%f22,	%f10,	%o4
	fmovsne	%xcc,	%f19,	%f24
	fmovrse	%i7,	%f8,	%f3
	movg	%icc,	%o3,	%l5
	movrlez	%l6,	0x2E0,	%l0
	sra	%i2,	%g3,	%o1
	ldsh	[%l7 + 0x4C],	%i6
	fmovrslz	%l3,	%f2,	%f0
	edge16ln	%o7,	%l2,	%g5
	alignaddrl	%o0,	%g6,	%o2
	orcc	%i1,	0x0084,	%g7
	fnands	%f20,	%f13,	%f18
	movn	%xcc,	%l4,	%g4
	fcmpne16	%f20,	%f14,	%i4
	fmovdleu	%icc,	%f10,	%f16
	udivcc	%o6,	0x0314,	%l1
	or	%i5,	%g1,	%g2
	umul	%i0,	%i3,	%o5
	std	%f14,	[%l7 + 0x08]
	movre	%i7,	0x1F1,	%o4
	edge32	%l5,	%l6,	%l0
	popc	0x0DED,	%o3
	sllx	%i2,	0x04,	%g3
	edge16	%i6,	%o1,	%l3
	sir	0x0B4B
	edge8	%l2,	%o7,	%g5
	ldd	[%l7 + 0x28],	%f6
	edge8l	%g6,	%o2,	%o0
	orncc	%g7,	%l4,	%g4
	andncc	%i4,	%o6,	%l1
	udivx	%i1,	0x0B78,	%i5
	fandnot1s	%f8,	%f9,	%f18
	orncc	%g2,	0x0201,	%g1
	xorcc	%i0,	%i3,	%i7
	umulcc	%o5,	0x0CD2,	%l5
	array8	%l6,	%o4,	%l0
	movge	%icc,	%i2,	%g3
	fmovrdgz	%i6,	%f4,	%f24
	array32	%o1,	%o3,	%l3
	save %l2, 0x1654, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%xcc,	%f2,	%f20
	movl	%xcc,	%g6,	%g5
	fpadd32	%f2,	%f26,	%f0
	movgu	%xcc,	%o0,	%g7
	restore %o2, %g4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i4,	[%l7 + 0x74]
	fnot2s	%f25,	%f6
	stx	%l1,	[%l7 + 0x48]
	ldd	[%l7 + 0x30],	%f22
	movle	%xcc,	%i1,	%o6
	lduw	[%l7 + 0x38],	%g2
	edge16	%i5,	%i0,	%i3
	fmovd	%f24,	%f20
	movne	%xcc,	%i7,	%o5
	movne	%icc,	%g1,	%l5
	xnor	%o4,	%l6,	%l0
	orn	%i2,	%g3,	%i6
	fornot1	%f6,	%f14,	%f4
	movre	%o1,	%l3,	%l2
	sdivcc	%o7,	0x1C2B,	%g6
	movcc	%icc,	%g5,	%o0
	popc	0x0407,	%g7
	movrgez	%o3,	%o2,	%g4
	movgu	%xcc,	%i4,	%l1
	fandnot2	%f2,	%f6,	%f20
	sllx	%l4,	0x07,	%o6
	fmovsleu	%xcc,	%f5,	%f24
	subcc	%i1,	0x08E0,	%g2
	fmovdl	%xcc,	%f3,	%f11
	edge16l	%i5,	%i3,	%i0
	ldsb	[%l7 + 0x6B],	%i7
	fmovrslz	%o5,	%f24,	%f27
	sth	%l5,	[%l7 + 0x58]
	sllx	%o4,	0x11,	%l6
	popc	0x0DE3,	%l0
	fmuld8ulx16	%f20,	%f7,	%f24
	edge16l	%i2,	%g3,	%i6
	fmovdge	%xcc,	%f15,	%f20
	movl	%xcc,	%g1,	%o1
	array32	%l2,	%o7,	%g6
	subccc	%g5,	%l3,	%o0
	array16	%o3,	%o2,	%g7
	sethi	0x0581,	%i4
	fsrc2	%f14,	%f6
	movre	%l1,	0x106,	%l4
	orn	%o6,	%g4,	%i1
	xor	%g2,	%i3,	%i5
	ldx	[%l7 + 0x38],	%i0
	movpos	%xcc,	%i7,	%o5
	udivcc	%o4,	0x1D4E,	%l5
	movvc	%xcc,	%l6,	%l0
	movrlz	%i2,	0x059,	%g3
	movneg	%icc,	%g1,	%o1
	sll	%l2,	%o7,	%g6
	subc	%i6,	%g5,	%l3
	lduw	[%l7 + 0x3C],	%o0
	stw	%o2,	[%l7 + 0x3C]
	move	%xcc,	%g7,	%i4
	movvs	%icc,	%l1,	%l4
	subc	%o6,	0x029D,	%g4
	or	%i1,	%o3,	%i3
	fpack16	%f8,	%f3
	or	%i5,	0x0261,	%g2
	fmovrdgez	%i0,	%f6,	%f28
	movvs	%xcc,	%i7,	%o4
	movl	%xcc,	%l5,	%l6
	siam	0x0
	fnand	%f12,	%f20,	%f16
	edge32ln	%l0,	%o5,	%g3
	fmovdvc	%icc,	%f28,	%f22
	array32	%g1,	%o1,	%i2
	sdiv	%l2,	0x178F,	%o7
	fmovs	%f27,	%f6
	movneg	%xcc,	%i6,	%g5
	fcmpd	%fcc1,	%f24,	%f28
	popc	0x0EEF,	%g6
	orcc	%l3,	%o0,	%g7
	fpadd16s	%f15,	%f2,	%f17
	sll	%i4,	0x1A,	%l1
	orn	%l4,	0x010E,	%o2
	sra	%g4,	%i1,	%o3
	orncc	%i3,	0x144B,	%i5
	fmovsleu	%icc,	%f22,	%f17
	sdiv	%o6,	0x17FA,	%i0
	nop
	set	0x7B, %g5
	stb	%i7,	[%l7 + %g5]
	fmovdle	%xcc,	%f28,	%f26
	popc	%g2,	%o4
	mulscc	%l6,	0x1D6F,	%l0
	edge32ln	%l5,	%g3,	%g1
	fmovse	%icc,	%f7,	%f4
	fmovrdlz	%o1,	%f24,	%f14
	sdivcc	%o5,	0x0B63,	%i2
	movne	%xcc,	%o7,	%i6
	fsrc2s	%f19,	%f18
	edge8n	%l2,	%g5,	%l3
	movle	%icc,	%o0,	%g6
	fpadd32s	%f26,	%f21,	%f4
	movvc	%xcc,	%g7,	%i4
	movneg	%xcc,	%l1,	%l4
	fmovrslz	%o2,	%f22,	%f16
	andncc	%g4,	%o3,	%i3
	andncc	%i5,	%i1,	%i0
	addc	%i7,	%o6,	%g2
	udivcc	%l6,	0x0193,	%o4
	edge16n	%l5,	%l0,	%g1
	array32	%o1,	%g3,	%i2
	ldd	[%l7 + 0x78],	%o4
	fornot2	%f20,	%f30,	%f16
	fandnot2	%f0,	%f30,	%f20
	ldsb	[%l7 + 0x54],	%o7
	sdivcc	%i6,	0x1C7C,	%g5
	edge8n	%l2,	%l3,	%o0
	sra	%g6,	%g7,	%l1
	movrgz	%l4,	0x3A6,	%o2
	pdist	%f30,	%f28,	%f22
	sdivx	%g4,	0x1923,	%i4
	fmovdgu	%icc,	%f20,	%f18
	movle	%icc,	%i3,	%i5
	movcc	%xcc,	%i1,	%o3
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	lduw	[%l7 + 0x28],	%g2
	movre	%l6,	0x1BB,	%o4
	array8	%l5,	%l0,	%i7
	movgu	%xcc,	%o1,	%g1
	subccc	%i2,	0x0FD5,	%g3
	and	%o5,	0x17AF,	%i6
	fmovrdlz	%g5,	%f6,	%f10
	edge16l	%l2,	%o7,	%o0
	mulscc	%g6,	0x0FA3,	%l3
	alignaddrl	%l1,	%l4,	%g7
	edge32l	%g4,	%i4,	%o2
	fornot1	%f10,	%f16,	%f24
	orn	%i5,	%i1,	%i3
	edge16ln	%i0,	%o6,	%g2
	popc	%l6,	%o3
	movg	%xcc,	%l5,	%l0
	movrne	%o4,	0x088,	%i7
	orncc	%g1,	%o1,	%i2
	movg	%icc,	%g3,	%i6
	movl	%icc,	%g5,	%o5
	fmovdneg	%xcc,	%f14,	%f8
	edge8	%o7,	%o0,	%g6
	fabsd	%f4,	%f14
	save %l3, %l1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%xcc,	%f9,	%f13
	smulcc	%l2,	0x0FCC,	%g4
	for	%f18,	%f28,	%f20
	srlx	%i4,	%g7,	%i5
	movrlez	%o2,	0x28F,	%i3
	srl	%i0,	0x01,	%o6
	move	%icc,	%g2,	%l6
	fpsub32s	%f4,	%f11,	%f8
	andcc	%i1,	%o3,	%l5
	movl	%icc,	%o4,	%i7
	sll	%g1,	0x0F,	%l0
	movvs	%xcc,	%i2,	%g3
	addccc	%o1,	0x11AF,	%i6
	movrgz	%g5,	%o7,	%o5
	srax	%g6,	0x1C,	%l3
	srlx	%l1,	%l4,	%l2
	sethi	0x0FBA,	%o0
	array16	%i4,	%g7,	%i5
	addcc	%g4,	%o2,	%i0
	smul	%i3,	%g2,	%o6
	popc	0x0C69,	%l6
	movne	%icc,	%i1,	%l5
	movrgz	%o4,	0x04B,	%o3
	ldx	[%l7 + 0x30],	%g1
	xor	%l0,	%i2,	%i7
	for	%f6,	%f22,	%f2
	xor	%o1,	%i6,	%g3
	movgu	%xcc,	%g5,	%o5
	faligndata	%f20,	%f6,	%f14
	orcc	%g6,	0x151B,	%o7
	andncc	%l1,	%l4,	%l3
	smul	%l2,	%o0,	%i4
	sll	%i5,	%g4,	%o2
	movne	%xcc,	%g7,	%i0
	ldub	[%l7 + 0x40],	%g2
	sub	%o6,	0x03ED,	%i3
	mulx	%i1,	0x1AEE,	%l5
	movcs	%icc,	%o4,	%l6
	edge16n	%o3,	%g1,	%l0
	lduw	[%l7 + 0x2C],	%i7
	alignaddr	%i2,	%o1,	%g3
	movpos	%xcc,	%i6,	%o5
	udivx	%g5,	0x0CAE,	%g6
	alignaddrl	%l1,	%o7,	%l3
	sir	0x1014
	movrne	%l4,	%o0,	%l2
	sub	%i5,	%i4,	%o2
	mova	%icc,	%g7,	%g4
	or	%i0,	%o6,	%g2
	addc	%i3,	0x0F00,	%i1
	fmul8ulx16	%f26,	%f30,	%f2
	ldsb	[%l7 + 0x7F],	%o4
	save %l6, 0x1CE8, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g1,	%l0,	%l5
	sth	%i2,	[%l7 + 0x50]
	fcmpd	%fcc0,	%f14,	%f10
	movcs	%xcc,	%i7,	%o1
	sethi	0x1509,	%g3
	orncc	%o5,	%i6,	%g6
	fcmps	%fcc2,	%f23,	%f8
	st	%f16,	[%l7 + 0x74]
	movleu	%icc,	%g5,	%l1
	movcc	%xcc,	%l3,	%l4
	fmovrdgez	%o7,	%f2,	%f10
	movrne	%o0,	0x121,	%l2
	alignaddrl	%i5,	%o2,	%g7
	array32	%g4,	%i4,	%o6
	fxnor	%f10,	%f8,	%f4
	nop
	set	0x20, %l0
	std	%f12,	[%l7 + %l0]
	orn	%i0,	0x0940,	%i3
	std	%f2,	[%l7 + 0x70]
	andncc	%g2,	%i1,	%o4
	movg	%xcc,	%l6,	%g1
	st	%f15,	[%l7 + 0x1C]
	sub	%l0,	0x0026,	%l5
	fpadd16s	%f7,	%f31,	%f27
	ldsw	[%l7 + 0x5C],	%i2
	sir	0x1AFE
	ldx	[%l7 + 0x78],	%o3
	edge8l	%i7,	%o1,	%o5
	faligndata	%f16,	%f0,	%f26
	fxor	%f2,	%f30,	%f10
	edge32	%i6,	%g3,	%g5
	edge16n	%g6,	%l1,	%l3
	fxnor	%f16,	%f12,	%f8
	st	%f18,	[%l7 + 0x18]
	movgu	%xcc,	%l4,	%o7
	srl	%l2,	0x17,	%o0
	fpadd32	%f18,	%f16,	%f12
	fmovscc	%icc,	%f24,	%f5
	fmovsvc	%icc,	%f5,	%f17
	alignaddr	%i5,	%g7,	%o2
	srlx	%g4,	%o6,	%i4
	movle	%xcc,	%i0,	%i3
	movne	%icc,	%i1,	%o4
	movn	%xcc,	%l6,	%g1
	fcmpgt16	%f16,	%f28,	%l0
	udivcc	%l5,	0x0676,	%i2
	mova	%xcc,	%g2,	%i7
	fornot1	%f28,	%f28,	%f28
	movrne	%o1,	%o5,	%o3
	umulcc	%g3,	0x16FB,	%i6
	edge16	%g5,	%l1,	%l3
	movn	%icc,	%g6,	%l4
	fmovdpos	%icc,	%f16,	%f13
	umulcc	%o7,	%l2,	%i5
	edge8l	%o0,	%o2,	%g7
	mova	%icc,	%o6,	%g4
	fcmpes	%fcc2,	%f26,	%f8
	fmovrdlez	%i4,	%f0,	%f12
	fmuld8sux16	%f14,	%f10,	%f26
	sir	0x133E
	andn	%i0,	0x1B8F,	%i3
	edge16ln	%o4,	%i1,	%l6
	popc	0x1D69,	%g1
	fabss	%f18,	%f19
	mulx	%l5,	%l0,	%i2
	fmovsne	%xcc,	%f18,	%f7
	mulscc	%i7,	%g2,	%o1
	subc	%o3,	%g3,	%o5
	movne	%icc,	%g5,	%i6
	xnorcc	%l3,	0x07CF,	%l1
	edge16ln	%l4,	%g6,	%o7
	orncc	%i5,	%l2,	%o2
	addccc	%o0,	%o6,	%g7
	edge16l	%i4,	%g4,	%i3
	udiv	%i0,	0x09E1,	%i1
	orn	%o4,	%g1,	%l5
	lduh	[%l7 + 0x60],	%l6
	xnor	%i2,	%i7,	%l0
	movrlz	%o1,	0x12E,	%o3
	addccc	%g2,	0x1F8F,	%o5
	edge16	%g3,	%i6,	%g5
	subcc	%l1,	0x1FA8,	%l4
	movle	%xcc,	%l3,	%g6
	edge8l	%i5,	%o7,	%o2
	edge16	%l2,	%o0,	%g7
	sdivx	%i4,	0x0E8A,	%o6
	xor	%g4,	%i0,	%i3
	fabsd	%f4,	%f4
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f22
	edge32n	%o4,	%g1,	%l5
	mova	%icc,	%l6,	%i2
	movle	%icc,	%i7,	%l0
	umulcc	%o1,	0x069B,	%i1
	st	%f20,	[%l7 + 0x10]
	orcc	%g2,	0x022B,	%o3
	fmul8x16au	%f18,	%f21,	%f12
	restore %o5, %g3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f27,	[%l7 + 0x08]
	add	%l1,	0x082B,	%g5
	orncc	%l3,	%l4,	%i5
	movneg	%xcc,	%o7,	%g6
	smulcc	%o2,	0x0332,	%o0
	subccc	%g7,	0x016D,	%l2
	mulx	%o6,	0x170B,	%i4
	fmovsge	%xcc,	%f31,	%f31
	fornot1	%f12,	%f16,	%f6
	ld	[%l7 + 0x78],	%f12
	orn	%g4,	%i0,	%i3
	sll	%g1,	0x16,	%o4
	edge8n	%l6,	%l5,	%i7
	fmovs	%f25,	%f16
	or	%l0,	%o1,	%i1
	movvs	%xcc,	%g2,	%o3
	array32	%i2,	%o5,	%g3
	andcc	%l1,	0x1AE2,	%i6
	save %l3, %g5, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	stx	%l4,	[%l7 + 0x20]
	addccc	%o0,	0x1276,	%g7
	fzero	%f6
	mulx	%o2,	%o6,	%l2
	movcc	%icc,	%g4,	%i4
	srlx	%i3,	%i0,	%g1
	lduw	[%l7 + 0x54],	%o4
	andn	%l5,	0x07C6,	%l6
	array32	%i7,	%o1,	%i1
	movrgz	%g2,	0x366,	%l0
	srl	%i2,	0x0E,	%o3
	movcc	%icc,	%g3,	%l1
	and	%i6,	0x0934,	%l3
	fxor	%f10,	%f26,	%f30
	udivcc	%o5,	0x02F8,	%i5
	fxors	%f10,	%f23,	%f16
	andcc	%o7,	0x182E,	%g6
	udivcc	%l4,	0x08EF,	%o0
	array8	%g7,	%o2,	%o6
	movl	%icc,	%l2,	%g4
	subcc	%g5,	0x1F64,	%i4
	stb	%i0,	[%l7 + 0x41]
	add	%g1,	%i3,	%l5
	udiv	%o4,	0x06DB,	%i7
	fmovrdgz	%o1,	%f20,	%f6
	movrlez	%l6,	%i1,	%g2
	movne	%icc,	%i2,	%o3
	fnegs	%f19,	%f12
	sth	%l0,	[%l7 + 0x5A]
	fmovsg	%icc,	%f24,	%f6
	orn	%g3,	0x0570,	%i6
	umulcc	%l3,	%o5,	%l1
	movrlz	%i5,	0x330,	%o7
	movpos	%icc,	%l4,	%g6
	fabss	%f19,	%f2
	sdiv	%g7,	0x1819,	%o0
	for	%f24,	%f4,	%f4
	edge32l	%o6,	%o2,	%l2
	ldsw	[%l7 + 0x30],	%g4
	fmovsvc	%xcc,	%f3,	%f23
	movcs	%icc,	%i4,	%i0
	edge16	%g1,	%g5,	%i3
	sdivx	%o4,	0x1A85,	%l5
	movpos	%icc,	%i7,	%o1
	andcc	%i1,	%l6,	%i2
	stx	%g2,	[%l7 + 0x28]
	sdivcc	%l0,	0x1E1E,	%g3
	fxnor	%f18,	%f28,	%f20
	smul	%i6,	%l3,	%o5
	nop
	set	0x5C, %g3
	ldsw	[%l7 + %g3],	%o3
	movne	%icc,	%i5,	%l1
	mulscc	%l4,	%g6,	%g7
	fmovsvc	%icc,	%f8,	%f7
	alignaddrl	%o7,	%o6,	%o2
	udivcc	%l2,	0x1ECD,	%o0
	lduw	[%l7 + 0x68],	%i4
	fsrc1	%f4,	%f2
	movle	%icc,	%g4,	%i0
	mova	%xcc,	%g1,	%i3
	movcc	%icc,	%g5,	%o4
	andncc	%l5,	%i7,	%o1
	edge8l	%l6,	%i1,	%i2
	ld	[%l7 + 0x1C],	%f27
	xnorcc	%l0,	%g3,	%g2
	fnegd	%f8,	%f22
	ldx	[%l7 + 0x58],	%l3
	fmul8x16au	%f11,	%f0,	%f22
	subc	%i6,	0x083F,	%o3
	array8	%i5,	%o5,	%l4
	ldsh	[%l7 + 0x52],	%g6
	ldub	[%l7 + 0x5D],	%g7
	movle	%icc,	%l1,	%o7
	save %o2, %o6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i4,	0x11F6,	%g4
	sll	%i0,	%l2,	%i3
	xorcc	%g5,	%g1,	%o4
	srl	%l5,	0x03,	%i7
	movne	%xcc,	%o1,	%i1
	movpos	%icc,	%l6,	%i2
	movrlz	%g3,	0x2EF,	%g2
	fmovscc	%icc,	%f3,	%f30
	movrgz	%l3,	0x39F,	%i6
	umul	%l0,	0x1C48,	%i5
	fmovdleu	%xcc,	%f18,	%f31
	ldub	[%l7 + 0x1E],	%o5
	ldsh	[%l7 + 0x1C],	%l4
	umulcc	%o3,	0x01DD,	%g6
	subccc	%l1,	%o7,	%o2
	fmul8x16al	%f22,	%f23,	%f14
	fmovrdlz	%o6,	%f10,	%f0
	fpsub16	%f26,	%f18,	%f16
	movge	%icc,	%g7,	%i4
	movpos	%icc,	%g4,	%o0
	array16	%i0,	%l2,	%g5
	ldsw	[%l7 + 0x30],	%g1
	movle	%xcc,	%i3,	%o4
	movpos	%icc,	%l5,	%i7
	fmovsg	%xcc,	%f15,	%f26
	movl	%icc,	%o1,	%l6
	fabss	%f11,	%f5
	movle	%icc,	%i1,	%g3
	edge32n	%g2,	%l3,	%i2
	xor	%i6,	0x00F9,	%l0
	lduh	[%l7 + 0x58],	%i5
	sdivcc	%l4,	0x0EEC,	%o3
	subccc	%g6,	%o5,	%l1
	smulcc	%o7,	0x0BD1,	%o2
	xor	%g7,	0x16E5,	%i4
	fabss	%f31,	%f22
	edge8	%g4,	%o0,	%o6
	movle	%xcc,	%i0,	%l2
	movvs	%xcc,	%g1,	%i3
	sethi	0x1C14,	%o4
	movl	%xcc,	%g5,	%l5
	fnors	%f24,	%f16,	%f27
	ldd	[%l7 + 0x78],	%f4
	sdivx	%o1,	0x0238,	%i7
	fsrc2s	%f21,	%f18
	alignaddrl	%l6,	%g3,	%g2
	fmul8sux16	%f2,	%f14,	%f8
	mulx	%l3,	%i2,	%i6
	edge8ln	%l0,	%i1,	%l4
	andcc	%i5,	0x00D7,	%g6
	fmul8ulx16	%f4,	%f8,	%f28
	fcmpeq32	%f12,	%f8,	%o5
	xnor	%l1,	0x130F,	%o7
	sdivx	%o3,	0x1AAF,	%o2
	movl	%xcc,	%g7,	%g4
	fmuld8ulx16	%f6,	%f8,	%f4
	edge8	%o0,	%o6,	%i0
	sdiv	%i4,	0x0FC8,	%l2
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%i2
	add	%g1,	0x182A,	%g5
	movrlz	%l5,	%o1,	%i7
	movneg	%xcc,	%l6,	%g3
	sdivx	%o4,	0x05C1,	%g2
	fmovsvs	%icc,	%f15,	%f17
	edge8l	%i2,	%i6,	%l3
	udivx	%i1,	0x1791,	%l0
	edge32n	%l4,	%g6,	%o5
	fmovrse	%i5,	%f12,	%f31
	movvc	%xcc,	%o7,	%o3
	movne	%icc,	%l1,	%g7
	sdiv	%o2,	0x157A,	%g4
	alignaddrl	%o6,	%i0,	%i4
	movvs	%icc,	%o0,	%l2
	sra	%i3,	0x15,	%g5
	restore %g1, 0x1300, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x08],	%i6
	fnors	%f14,	%f27,	%f21
	movrlez	%l6,	%l5,	%g3
	fnot2	%f16,	%f30
	fmovrde	%g2,	%f12,	%f24
	edge16n	%i2,	%o4,	%i6
	umulcc	%i1,	%l3,	%l4
	ldub	[%l7 + 0x31],	%g6
	ldsh	[%l7 + 0x2A],	%o5
	array16	%l0,	%i5,	%o7
	edge32n	%l1,	%o3,	%g7
	faligndata	%f14,	%f18,	%f8
	mulscc	%o2,	0x1166,	%o6
	andn	%i0,	%g4,	%o0
	edge8l	%l2,	%i3,	%i4
	xorcc	%g5,	0x1DB3,	%g1
	sdiv	%i7,	0x0B70,	%l6
	movvs	%icc,	%l5,	%g3
	ldsh	[%l7 + 0x56],	%g2
	save %o1, %i2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i6,	0x03F2,	%i1
	umulcc	%l4,	%l3,	%g6
	edge16	%o5,	%l0,	%i5
	andncc	%l1,	%o3,	%o7
	fand	%f0,	%f4,	%f0
	stw	%o2,	[%l7 + 0x20]
	sll	%o6,	%i0,	%g4
	fxors	%f30,	%f25,	%f7
	fpsub32	%f22,	%f8,	%f2
	array8	%g7,	%l2,	%i3
	ldd	[%l7 + 0x40],	%f6
	edge32l	%i4,	%g5,	%o0
	smulcc	%i7,	%g1,	%l5
	faligndata	%f18,	%f10,	%f18
	and	%g3,	%g2,	%l6
	fmovdleu	%icc,	%f7,	%f4
	fxnor	%f4,	%f12,	%f20
	fpsub32s	%f9,	%f3,	%f10
	ldx	[%l7 + 0x20],	%o1
	movvs	%xcc,	%i2,	%i6
	fmovdn	%icc,	%f1,	%f31
	alignaddrl	%i1,	%o4,	%l4
	fxors	%f14,	%f26,	%f5
	stb	%l3,	[%l7 + 0x4A]
	movge	%icc,	%g6,	%l0
	std	%f16,	[%l7 + 0x70]
	edge32l	%i5,	%l1,	%o5
	xnor	%o3,	%o2,	%o7
	ldx	[%l7 + 0x48],	%i0
	umul	%o6,	0x1A90,	%g7
	movleu	%xcc,	%g4,	%i3
	edge32ln	%i4,	%g5,	%o0
	mulscc	%l2,	%g1,	%l5
	xnorcc	%g3,	0x00C8,	%i7
	st	%f23,	[%l7 + 0x24]
	sub	%g2,	0x1F0A,	%o1
	sra	%l6,	%i2,	%i6
	subccc	%o4,	0x1B76,	%i1
	fnegs	%f15,	%f7
	andcc	%l4,	0x1FE7,	%l3
	edge32	%g6,	%l0,	%i5
	fsrc2	%f6,	%f20
	orn	%o5,	0x1365,	%o3
	movn	%xcc,	%o2,	%l1
	alignaddrl	%o7,	%i0,	%o6
	ldsb	[%l7 + 0x4B],	%g7
	ldsb	[%l7 + 0x18],	%i3
	edge32l	%i4,	%g5,	%g4
	movcs	%icc,	%o0,	%g1
	udivcc	%l2,	0x1702,	%l5
	fmovscs	%icc,	%f23,	%f30
	mulscc	%g3,	0x0A98,	%i7
	fone	%f2
	srax	%g2,	%o1,	%i2
	fors	%f17,	%f31,	%f16
	movge	%xcc,	%l6,	%o4
	movvc	%xcc,	%i6,	%l4
	stw	%l3,	[%l7 + 0x28]
	fmovdvc	%xcc,	%f8,	%f19
	addc	%g6,	0x1DE0,	%i1
	ldsw	[%l7 + 0x24],	%i5
	edge16ln	%l0,	%o3,	%o2
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	stx	%i0,	[%l7 + 0x30]
	edge8	%o5,	%g7,	%o6
	fcmpgt32	%f24,	%f20,	%i3
	edge8l	%g5,	%g4,	%i4
	fone	%f6
	orncc	%o0,	%g1,	%l2
	array8	%g3,	%l5,	%g2
	andn	%i7,	%i2,	%o1
	movrne	%o4,	0x117,	%i6
	movvs	%icc,	%l6,	%l4
	fpack32	%f6,	%f12,	%f22
	edge16l	%l3,	%i1,	%i5
	popc	%l0,	%g6
	popc	%o3,	%l1
	fmovde	%xcc,	%f29,	%f8
	edge32l	%o7,	%i0,	%o2
	st	%f8,	[%l7 + 0x5C]
	srlx	%o5,	0x1D,	%o6
	addcc	%i3,	0x17E7,	%g7
	fmovdcc	%icc,	%f28,	%f12
	ldsw	[%l7 + 0x7C],	%g4
	movrgez	%g5,	0x35D,	%i4
	lduw	[%l7 + 0x28],	%g1
	mulx	%l2,	%o0,	%l5
	movvc	%xcc,	%g3,	%g2
	movneg	%xcc,	%i2,	%i7
	movneg	%icc,	%o1,	%o4
	subcc	%l6,	%l4,	%l3
	udiv	%i1,	0x0349,	%i6
	ldsb	[%l7 + 0x51],	%l0
	edge16ln	%i5,	%o3,	%l1
	udivx	%g6,	0x0C70,	%i0
	edge16ln	%o2,	%o5,	%o6
	fmovdl	%icc,	%f2,	%f14
	movg	%xcc,	%o7,	%i3
	movgu	%icc,	%g4,	%g5
	edge16ln	%i4,	%g7,	%l2
	movleu	%xcc,	%g1,	%l5
	nop
	set	0x1B, %l5
	stb	%o0,	[%l7 + %l5]
	or	%g2,	0x156D,	%g3
	edge32ln	%i7,	%o1,	%o4
	movre	%l6,	%i2,	%l4
	movrlz	%i1,	0x2F5,	%l3
	mova	%icc,	%l0,	%i5
	edge32	%o3,	%i6,	%g6
	lduh	[%l7 + 0x66],	%l1
	umul	%i0,	%o2,	%o6
	andncc	%o5,	%o7,	%i3
	udivcc	%g5,	0x1CF1,	%i4
	movrne	%g4,	0x2D2,	%l2
	fmovsg	%xcc,	%f11,	%f16
	restore %g7, %g1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f8,	%f0,	%f18
	fmovrdlez	%g2,	%f0,	%f4
	mulx	%g3,	%l5,	%o1
	fpsub32	%f12,	%f4,	%f18
	fone	%f28
	addc	%i7,	%o4,	%i2
	mova	%icc,	%l6,	%l4
	ld	[%l7 + 0x6C],	%f25
	bshuffle	%f4,	%f12,	%f18
	fmovd	%f2,	%f28
	fmovdleu	%icc,	%f27,	%f31
	ld	[%l7 + 0x5C],	%f28
	movle	%icc,	%l3,	%l0
	sdiv	%i1,	0x0434,	%i5
	fmovrslz	%o3,	%f12,	%f6
	fandnot2s	%f23,	%f27,	%f18
	fnot1	%f26,	%f14
	edge8ln	%g6,	%i6,	%l1
	fpadd32	%f30,	%f22,	%f18
	sethi	0x0378,	%o2
	ldsh	[%l7 + 0x24],	%i0
	sub	%o5,	0x1195,	%o7
	movcc	%xcc,	%i3,	%o6
	stx	%g5,	[%l7 + 0x70]
	sllx	%g4,	0x1F,	%i4
	srl	%g7,	0x05,	%l2
	edge16n	%o0,	%g2,	%g3
	fsrc2s	%f5,	%f31
	edge32n	%g1,	%o1,	%i7
	srlx	%l5,	0x05,	%o4
	pdist	%f2,	%f0,	%f4
	fcmpd	%fcc0,	%f22,	%f30
	alignaddrl	%l6,	%i2,	%l3
	alignaddr	%l0,	%l4,	%i1
	std	%f4,	[%l7 + 0x20]
	movvc	%xcc,	%i5,	%g6
	ldd	[%l7 + 0x28],	%f6
	fsrc2s	%f5,	%f6
	subc	%o3,	%i6,	%o2
	umulcc	%l1,	%o5,	%i0
	subc	%i3,	0x0A92,	%o7
	movre	%o6,	%g5,	%g4
	lduh	[%l7 + 0x76],	%g7
	ldd	[%l7 + 0x20],	%i4
	fpsub32	%f10,	%f4,	%f6
	st	%f15,	[%l7 + 0x0C]
	fmovda	%xcc,	%f20,	%f25
	movvs	%xcc,	%o0,	%l2
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	edge32	%g3,	%i7,	%o1
	subcc	%l5,	%o4,	%i2
	orcc	%l3,	%l6,	%l4
	movre	%i1,	%i5,	%l0
	fzero	%f6
	movgu	%xcc,	%g6,	%o3
	sth	%i6,	[%l7 + 0x68]
	fpsub16s	%f31,	%f29,	%f4
	fands	%f14,	%f18,	%f10
	sllx	%l1,	0x1C,	%o5
	ldsw	[%l7 + 0x0C],	%i0
	alignaddrl	%o2,	%o7,	%o6
	movneg	%icc,	%i3,	%g5
	xnor	%g4,	0x0C9C,	%g7
	andn	%i4,	0x122E,	%o0
	st	%f21,	[%l7 + 0x2C]
	subc	%g2,	%g1,	%g3
	movneg	%xcc,	%i7,	%o1
	subccc	%l5,	0x0D48,	%l2
	stx	%o4,	[%l7 + 0x48]
	addcc	%l3,	0x05A3,	%i2
	edge32ln	%l4,	%l6,	%i1
	sub	%l0,	0x131B,	%g6
	movrlz	%i5,	0x00F,	%i6
	movrlez	%o3,	%o5,	%i0
	movgu	%xcc,	%l1,	%o2
	sllx	%o7,	%i3,	%o6
	movneg	%xcc,	%g4,	%g7
	movrne	%g5,	%o0,	%i4
	subccc	%g1,	%g3,	%g2
	fmovrsne	%o1,	%f26,	%f15
	mova	%xcc,	%i7,	%l5
	udivcc	%o4,	0x0B2B,	%l2
	fmovrslz	%i2,	%f4,	%f15
	edge32l	%l3,	%l4,	%i1
	array32	%l0,	%l6,	%i5
	andncc	%g6,	%o3,	%o5
	edge32n	%i0,	%i6,	%l1
	fmovdl	%xcc,	%f1,	%f16
	edge8n	%o2,	%i3,	%o6
	popc	%o7,	%g4
	ld	[%l7 + 0x54],	%f26
	ldsb	[%l7 + 0x51],	%g5
	movleu	%icc,	%g7,	%i4
	movle	%icc,	%o0,	%g3
	array8	%g1,	%g2,	%i7
	move	%icc,	%l5,	%o1
	fabss	%f12,	%f27
	udivcc	%o4,	0x0E71,	%l2
	edge16	%i2,	%l4,	%i1
	xnor	%l0,	%l6,	%l3
	edge32n	%i5,	%g6,	%o5
	fmovdcs	%icc,	%f25,	%f26
	array16	%o3,	%i0,	%l1
	edge8	%o2,	%i3,	%i6
	edge16l	%o6,	%o7,	%g5
	addcc	%g7,	0x1F32,	%i4
	fpsub32	%f22,	%f22,	%f28
	smul	%o0,	0x0D31,	%g4
	array32	%g1,	%g3,	%i7
	ldx	[%l7 + 0x68],	%g2
	umul	%o1,	%l5,	%l2
	array8	%o4,	%i2,	%i1
	movre	%l4,	%l0,	%l3
	fors	%f24,	%f17,	%f15
	ld	[%l7 + 0x7C],	%f26
	udivcc	%i5,	0x1572,	%g6
	orcc	%l6,	0x1548,	%o5
	movrgz	%i0,	%l1,	%o2
	umul	%i3,	0x0DF8,	%i6
	sethi	0x0B7B,	%o6
	udivx	%o7,	0x09CF,	%o3
	subc	%g7,	0x172E,	%i4
	fcmple16	%f6,	%f10,	%g5
	fcmped	%fcc2,	%f26,	%f30
	save %g4, %g1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i7,	0x1B,	%g2
	fcmple32	%f28,	%f2,	%o0
	umul	%l5,	%l2,	%o4
	fmovsle	%icc,	%f17,	%f20
	udivx	%i2,	0x0971,	%o1
	movl	%xcc,	%i1,	%l4
	sir	0x00CD
	srlx	%l3,	0x05,	%l0
	edge16	%i5,	%g6,	%l6
	edge8	%o5,	%i0,	%o2
	xnor	%i3,	%l1,	%i6
	movcs	%icc,	%o7,	%o6
	fcmpgt16	%f6,	%f30,	%g7
	and	%o3,	0x0702,	%i4
	fmovscs	%xcc,	%f1,	%f31
	xorcc	%g4,	0x0FDF,	%g1
	movle	%icc,	%g3,	%i7
	fnor	%f4,	%f10,	%f8
	umulcc	%g5,	0x0FF9,	%o0
	sll	%g2,	0x16,	%l5
	sll	%l2,	%o4,	%o1
	fmovse	%icc,	%f1,	%f22
	movre	%i1,	0x245,	%l4
	fmovsvc	%xcc,	%f3,	%f12
	sth	%l3,	[%l7 + 0x44]
	fcmps	%fcc0,	%f8,	%f13
	orcc	%i2,	0x0057,	%l0
	umul	%i5,	0x1D44,	%l6
	fmovsne	%icc,	%f25,	%f0
	subcc	%o5,	%g6,	%i0
	fpadd16	%f10,	%f6,	%f6
	fmovs	%f26,	%f8
	fmovrslez	%i3,	%f16,	%f9
	std	%f30,	[%l7 + 0x38]
	movrlez	%o2,	%l1,	%o7
	umul	%o6,	%i6,	%g7
	ldx	[%l7 + 0x68],	%i4
	stx	%g4,	[%l7 + 0x40]
	movleu	%icc,	%o3,	%g3
	ld	[%l7 + 0x18],	%f1
	movge	%icc,	%i7,	%g5
	edge16	%g1,	%g2,	%o0
	smul	%l5,	0x11D7,	%l2
	addcc	%o1,	0x02EB,	%o4
	fxnor	%f22,	%f10,	%f18
	ldub	[%l7 + 0x76],	%i1
	alignaddr	%l3,	%i2,	%l0
	movn	%icc,	%l4,	%i5
	fnot1s	%f26,	%f29
	fmovrsgez	%o5,	%f10,	%f0
	xnor	%g6,	%i0,	%l6
	fmovrsne	%o2,	%f24,	%f20
	smul	%i3,	%o7,	%o6
	fpack32	%f16,	%f20,	%f4
	fors	%f5,	%f21,	%f4
	sdivcc	%l1,	0x1194,	%i6
	movrne	%i4,	0x0BB,	%g4
	xorcc	%g7,	0x0286,	%g3
	fmovrdne	%o3,	%f16,	%f10
	add	%i7,	0x1BB2,	%g1
	sll	%g2,	0x15,	%o0
	ldd	[%l7 + 0x60],	%l4
	sdivx	%l2,	0x19DB,	%o1
	sub	%g5,	0x1D09,	%o4
	save %i1, %i2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%xcc,	%f27,	%f10
	ldd	[%l7 + 0x68],	%f8
	andncc	%l4,	%l0,	%i5
	alignaddrl	%o5,	%i0,	%g6
	ld	[%l7 + 0x08],	%f10
	edge8n	%o2,	%i3,	%o7
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%o6
	movrne	%l6,	0x2E0,	%l1
	edge16l	%i4,	%i6,	%g4
	for	%f28,	%f4,	%f2
	movne	%icc,	%g7,	%o3
	popc	%i7,	%g3
	ldsb	[%l7 + 0x3A],	%g1
	st	%f17,	[%l7 + 0x18]
	edge8ln	%o0,	%g2,	%l5
	fmovsvs	%xcc,	%f25,	%f28
	sdivcc	%o1,	0x100E,	%g5
	fnegd	%f2,	%f0
	ldsb	[%l7 + 0x60],	%o4
	edge16	%i1,	%l2,	%l3
	fmovsg	%icc,	%f23,	%f31
	move	%xcc,	%i2,	%l4
	andn	%l0,	%i5,	%o5
	subc	%g6,	0x0BD7,	%o2
	edge16n	%i0,	%o7,	%o6
	ldub	[%l7 + 0x7C],	%i3
	move	%xcc,	%l6,	%l1
	popc	0x1B57,	%i4
	movleu	%xcc,	%i6,	%g7
	edge16ln	%g4,	%o3,	%i7
	fsrc1s	%f6,	%f25
	edge32n	%g3,	%g1,	%g2
	movrgez	%l5,	%o0,	%g5
	movne	%icc,	%o4,	%i1
	srl	%o1,	0x1F,	%l3
	fornot2s	%f14,	%f19,	%f1
	udivx	%i2,	0x1E6E,	%l4
	sub	%l0,	0x1D75,	%i5
	fnegs	%f17,	%f5
	sub	%l2,	%g6,	%o5
	fmovrdgez	%i0,	%f16,	%f0
	sll	%o2,	%o7,	%i3
	fzeros	%f26
	addcc	%o6,	0x1B4C,	%l1
	fmovrslez	%l6,	%f8,	%f26
	fzeros	%f13
	sir	0x0159
	stb	%i4,	[%l7 + 0x21]
	fmovdle	%xcc,	%f12,	%f5
	movle	%xcc,	%i6,	%g7
	edge16ln	%g4,	%o3,	%i7
	movl	%xcc,	%g3,	%g1
	subc	%g2,	%o0,	%l5
	lduw	[%l7 + 0x54],	%g5
	smulcc	%o4,	0x1882,	%i1
	sdivx	%o1,	0x1F0B,	%l3
	movre	%i2,	0x2C8,	%l0
	movre	%i5,	0x2D8,	%l4
	popc	%g6,	%o5
	array16	%i0,	%o2,	%o7
	xnor	%l2,	%i3,	%l1
	addcc	%l6,	%o6,	%i4
	orn	%i6,	0x0001,	%g4
	fmul8sux16	%f24,	%f10,	%f10
	ldd	[%l7 + 0x50],	%o2
	fmovdcc	%icc,	%f22,	%f1
	fpadd16	%f8,	%f24,	%f26
	edge32l	%i7,	%g3,	%g1
	sdivcc	%g7,	0x1602,	%g2
	fxnor	%f24,	%f14,	%f20
	andn	%l5,	%o0,	%o4
	smul	%g5,	%o1,	%l3
	save %i1, %l0, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x78],	%l4
	srax	%g6,	0x1E,	%o5
	fmuld8sux16	%f14,	%f5,	%f14
	movge	%icc,	%i5,	%o2
	movge	%icc,	%i0,	%l2
	movre	%i3,	%l1,	%o7
	popc	%o6,	%l6
	fmul8x16al	%f5,	%f14,	%f16
	ldd	[%l7 + 0x08],	%f22
	movrgez	%i4,	0x09B,	%g4
	orn	%i6,	%o3,	%g3
	sth	%g1,	[%l7 + 0x28]
	xnor	%g7,	0x1E8F,	%g2
	fmovdle	%icc,	%f3,	%f30
	fmul8sux16	%f16,	%f28,	%f4
	movre	%i7,	%l5,	%o0
	orn	%g5,	%o4,	%o1
	edge8ln	%l3,	%i1,	%i2
	ldsw	[%l7 + 0x5C],	%l0
	ldsh	[%l7 + 0x5A],	%g6
	edge16n	%l4,	%i5,	%o5
	fmovdgu	%xcc,	%f21,	%f1
	edge16	%o2,	%i0,	%l2
	ldd	[%l7 + 0x58],	%f20
	fcmpd	%fcc1,	%f4,	%f16
	sub	%l1,	0x150B,	%o7
	sdivx	%o6,	0x06ED,	%i3
	ldsb	[%l7 + 0x19],	%l6
	fmul8sux16	%f18,	%f6,	%f0
	fmovda	%xcc,	%f3,	%f27
	fmovrslz	%g4,	%f2,	%f22
	movne	%icc,	%i4,	%i6
	edge16	%o3,	%g1,	%g7
	edge16	%g2,	%i7,	%g3
	or	%o0,	%l5,	%g5
	restore %o1, %l3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x60],	%i2
	stx	%l0,	[%l7 + 0x70]
	xor	%g6,	0x133F,	%l4
	fmovdneg	%icc,	%f18,	%f13
	fnot2	%f4,	%f2
	orcc	%i1,	%i5,	%o5
	fxnors	%f12,	%f12,	%f21
	fcmped	%fcc3,	%f10,	%f16
	fcmpne32	%f16,	%f24,	%o2
	move	%xcc,	%i0,	%l1
	movleu	%icc,	%o7,	%l2
	for	%f18,	%f0,	%f20
	alignaddrl	%o6,	%l6,	%g4
	and	%i4,	0x01AC,	%i6
	movrlez	%o3,	0x31E,	%g1
	subccc	%g7,	0x0BD9,	%i3
	fnot1s	%f28,	%f2
	movleu	%xcc,	%i7,	%g3
	sir	0x1573
	smulcc	%g2,	0x15D5,	%l5
	fnands	%f31,	%f24,	%f11
	ldsw	[%l7 + 0x28],	%g5
	popc	0x0A62,	%o0
	edge32ln	%l3,	%o1,	%o4
	array16	%i2,	%l0,	%l4
	movn	%xcc,	%i1,	%i5
	edge8l	%o5,	%o2,	%g6
	subccc	%i0,	%l1,	%o7
	fmul8ulx16	%f28,	%f4,	%f10
	movpos	%icc,	%l2,	%l6
	edge8ln	%g4,	%o6,	%i4
	fmovdvs	%icc,	%f19,	%f6
	movrgz	%o3,	%i6,	%g7
	fmovdvs	%icc,	%f10,	%f30
	fnors	%f14,	%f2,	%f0
	st	%f17,	[%l7 + 0x18]
	movrlz	%g1,	%i7,	%g3
	subccc	%g2,	0x0D9A,	%i3
	lduw	[%l7 + 0x58],	%l5
	smul	%o0,	%l3,	%g5
	subc	%o1,	%i2,	%o4
	movrgz	%l0,	0x3CD,	%i1
	movrlz	%i5,	%o5,	%l4
	popc	0x0833,	%g6
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%f16
	sdivx	%i0,	0x19F3,	%o2
	movn	%icc,	%l1,	%l2
	pdist	%f18,	%f6,	%f20
	edge32n	%o7,	%g4,	%o6
	movvs	%icc,	%i4,	%o3
	movre	%l6,	%i6,	%g7
	move	%xcc,	%g1,	%i7
	udiv	%g2,	0x1E43,	%g3
	andcc	%l5,	%o0,	%i3
	movleu	%icc,	%l3,	%o1
	movne	%xcc,	%g5,	%o4
	movvs	%icc,	%i2,	%i1
	fnot1	%f16,	%f0
	fmovrdlz	%i5,	%f22,	%f18
	popc	0x1DA2,	%o5
	sllx	%l0,	%g6,	%l4
	edge8n	%i0,	%l1,	%l2
	st	%f10,	[%l7 + 0x60]
	xnorcc	%o7,	0x10B8,	%g4
	movgu	%xcc,	%o6,	%i4
	movcs	%xcc,	%o2,	%l6
	srax	%o3,	%i6,	%g1
	fmuld8ulx16	%f7,	%f14,	%f22
	stb	%i7,	[%l7 + 0x41]
	movleu	%icc,	%g7,	%g2
	addcc	%g3,	0x06CD,	%l5
	fmovdg	%icc,	%f6,	%f14
	fsrc2	%f26,	%f28
	movgu	%xcc,	%o0,	%i3
	fmul8x16	%f16,	%f4,	%f20
	ldd	[%l7 + 0x50],	%l2
	fmul8ulx16	%f14,	%f12,	%f2
	st	%f12,	[%l7 + 0x08]
	stb	%o1,	[%l7 + 0x2B]
	fpmerge	%f21,	%f2,	%f6
	movne	%xcc,	%g5,	%o4
	array16	%i2,	%i1,	%i5
	edge8l	%o5,	%g6,	%l4
	move	%icc,	%l0,	%i0
	edge32ln	%l2,	%l1,	%o7
	movle	%xcc,	%o6,	%i4
	ldsb	[%l7 + 0x38],	%o2
	addccc	%g4,	%l6,	%i6
	movrlz	%g1,	%i7,	%g7
	udivcc	%g2,	0x11A7,	%o3
	st	%f0,	[%l7 + 0x14]
	fxnors	%f9,	%f14,	%f5
	edge8ln	%l5,	%o0,	%i3
	ld	[%l7 + 0x40],	%f22
	ldsb	[%l7 + 0x0B],	%l3
	edge32n	%o1,	%g3,	%o4
	srl	%i2,	%g5,	%i5
	fornot1	%f4,	%f28,	%f2
	edge8	%o5,	%i1,	%l4
	nop
	set	0x20, %o4
	lduw	[%l7 + %o4],	%g6
	fmovrdlz	%l0,	%f2,	%f12
	orncc	%i0,	0x1C68,	%l2
	fpack16	%f30,	%f8
	fmovsgu	%icc,	%f20,	%f7
	fsrc1s	%f14,	%f21
	array32	%o7,	%o6,	%i4
	lduh	[%l7 + 0x3E],	%o2
	alignaddr	%g4,	%l6,	%l1
	sub	%i6,	%i7,	%g7
	sub	%g2,	0x1F99,	%o3
	array32	%g1,	%o0,	%i3
	std	%f24,	[%l7 + 0x20]
	ldsw	[%l7 + 0x3C],	%l5
	add	%o1,	%l3,	%o4
	edge8n	%i2,	%g3,	%g5
	movge	%icc,	%i5,	%o5
	mulscc	%i1,	%l4,	%l0
	sll	%i0,	%l2,	%g6
	ldd	[%l7 + 0x68],	%f16
	addccc	%o6,	%i4,	%o7
	edge16n	%o2,	%g4,	%l6
	fpmerge	%f8,	%f21,	%f0
	movne	%icc,	%l1,	%i7
	ldub	[%l7 + 0x6D],	%i6
	fpadd16s	%f2,	%f7,	%f2
	fmovsvc	%icc,	%f17,	%f25
	edge16ln	%g2,	%g7,	%o3
	movl	%icc,	%o0,	%i3
	movrgez	%l5,	%o1,	%l3
	sub	%o4,	0x0DF5,	%i2
	movre	%g3,	0x166,	%g5
	fxnor	%f30,	%f22,	%f20
	lduw	[%l7 + 0x6C],	%i5
	xnorcc	%g1,	0x1C7A,	%o5
	fmovdcc	%icc,	%f7,	%f6
	fcmpeq16	%f16,	%f10,	%i1
	array8	%l0,	%l4,	%i0
	xorcc	%l2,	0x183D,	%g6
	movvc	%icc,	%o6,	%i4
	andncc	%o2,	%o7,	%l6
	fandnot1	%f22,	%f20,	%f20
	movre	%l1,	%g4,	%i6
	alignaddr	%g2,	%i7,	%o3
	edge16ln	%o0,	%g7,	%i3
	stb	%o1,	[%l7 + 0x0C]
	mulx	%l5,	0x04AF,	%o4
	array8	%i2,	%l3,	%g5
	and	%g3,	%g1,	%i5
	addccc	%o5,	%l0,	%l4
	movpos	%icc,	%i1,	%l2
	movrgez	%i0,	%o6,	%i4
	lduw	[%l7 + 0x18],	%o2
	udivx	%o7,	0x01F1,	%l6
	fcmpeq32	%f0,	%f0,	%l1
	ldub	[%l7 + 0x7E],	%g6
	edge16	%g4,	%i6,	%i7
	fmovscs	%xcc,	%f13,	%f15
	movn	%xcc,	%g2,	%o0
	stw	%o3,	[%l7 + 0x4C]
	subccc	%g7,	%i3,	%l5
	movgu	%icc,	%o4,	%i2
	movg	%icc,	%l3,	%o1
	sethi	0x0F53,	%g5
	lduh	[%l7 + 0x0A],	%g1
	fpsub32s	%f31,	%f22,	%f25
	sra	%g3,	0x14,	%i5
	fors	%f27,	%f10,	%f9
	lduh	[%l7 + 0x14],	%l0
	movleu	%icc,	%o5,	%l4
	add	%i1,	0x09B4,	%l2
	edge16ln	%i0,	%i4,	%o6
	sra	%o2,	%l6,	%o7
	ldsh	[%l7 + 0x20],	%l1
	ldd	[%l7 + 0x30],	%f14
	sra	%g4,	0x0B,	%g6
	movcs	%xcc,	%i7,	%i6
	edge32l	%g2,	%o3,	%g7
	fxor	%f2,	%f18,	%f12
	movrlez	%i3,	0x13F,	%o0
	edge16l	%l5,	%i2,	%l3
	nop
	set	0x20, %l3
	stx	%o1,	[%l7 + %l3]
	smul	%o4,	0x19D8,	%g1
	sir	0x0C91
	fmovd	%f14,	%f8
	sth	%g5,	[%l7 + 0x1E]
	fcmpeq32	%f0,	%f2,	%i5
	fmovscc	%xcc,	%f2,	%f10
	fornot1	%f22,	%f26,	%f0
	edge16	%l0,	%o5,	%l4
	stx	%i1,	[%l7 + 0x20]
	orncc	%g3,	0x1B24,	%i0
	move	%icc,	%l2,	%i4
	fmovsgu	%icc,	%f20,	%f20
	movleu	%xcc,	%o2,	%l6
	edge32n	%o6,	%o7,	%l1
	ldx	[%l7 + 0x48],	%g4
	edge16	%i7,	%g6,	%g2
	fmovsge	%xcc,	%f30,	%f21
	andncc	%o3,	%i6,	%g7
	edge16ln	%i3,	%o0,	%l5
	fpack32	%f0,	%f10,	%f6
	ld	[%l7 + 0x10],	%f15
	fcmpgt32	%f14,	%f22,	%i2
	edge32ln	%o1,	%o4,	%l3
	lduh	[%l7 + 0x4C],	%g5
	andn	%g1,	0x101D,	%i5
	movle	%xcc,	%l0,	%o5
	ld	[%l7 + 0x44],	%f18
	edge16l	%l4,	%g3,	%i0
	sir	0x1062
	fornot2	%f22,	%f26,	%f26
	fnot2s	%f29,	%f29
	orcc	%i1,	%i4,	%l2
	fmovdne	%icc,	%f12,	%f25
	sllx	%o2,	0x0B,	%o6
	edge8ln	%o7,	%l6,	%l1
	sir	0x1BCF
	umul	%g4,	0x0AB0,	%i7
	edge16n	%g2,	%g6,	%o3
	popc	0x0A31,	%g7
	srl	%i6,	0x1E,	%o0
	fcmpd	%fcc2,	%f8,	%f18
	movpos	%icc,	%l5,	%i2
	sdiv	%i3,	0x03EB,	%o1
	sll	%l3,	%g5,	%o4
	xnorcc	%i5,	%l0,	%g1
	stw	%o5,	[%l7 + 0x60]
	edge8	%l4,	%g3,	%i1
	orcc	%i0,	%i4,	%l2
	srlx	%o2,	%o6,	%l6
	ld	[%l7 + 0x34],	%f27
	movneg	%icc,	%o7,	%g4
	xorcc	%i7,	0x0A8A,	%l1
	ldd	[%l7 + 0x10],	%f26
	movpos	%icc,	%g6,	%g2
	edge32n	%g7,	%i6,	%o0
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	mulx	%i3,	0x1059,	%o1
	fmovsl	%icc,	%f13,	%f21
	sdiv	%l3,	0x1E25,	%g5
	andncc	%i5,	%o4,	%g1
	fmuld8sux16	%f20,	%f25,	%f2
	xnor	%l0,	%o5,	%g3
	edge32n	%i1,	%i0,	%i4
	movn	%icc,	%l4,	%o2
	xorcc	%l2,	0x134B,	%o6
	fxnor	%f8,	%f20,	%f22
	andcc	%o7,	%g4,	%l6
	xnorcc	%l1,	%i7,	%g6
	smulcc	%g7,	%i6,	%o0
	nop
	set	0x1D, %l1
	ldsb	[%l7 + %l1],	%l5
	edge32n	%g2,	%i2,	%i3
	fmovsg	%icc,	%f0,	%f13
	subccc	%o3,	%l3,	%g5
	udiv	%o1,	0x1F1D,	%i5
	fmovsa	%xcc,	%f11,	%f23
	srlx	%o4,	0x1C,	%l0
	or	%g1,	%g3,	%i1
	movvc	%icc,	%i0,	%o5
	movrne	%l4,	0x23C,	%o2
	ldsw	[%l7 + 0x18],	%i4
	lduh	[%l7 + 0x76],	%l2
	mulx	%o7,	0x1D6F,	%g4
	save %o6, 0x052B, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i7,	%l6,	%g6
	mova	%icc,	%g7,	%o0
	save %l5, %g2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i3,	%o3
	fmovdvc	%icc,	%f8,	%f1
	movrgz	%l3,	%i2,	%o1
	fzero	%f4
	lduw	[%l7 + 0x70],	%g5
	sir	0x03D3
	ldd	[%l7 + 0x70],	%o4
	movcs	%xcc,	%i5,	%g1
	ldsh	[%l7 + 0x54],	%l0
	addcc	%i1,	%g3,	%o5
	movleu	%icc,	%l4,	%i0
	xnor	%o2,	0x0E5C,	%i4
	udiv	%o7,	0x0F16,	%g4
	xnor	%l2,	%o6,	%i7
	ldx	[%l7 + 0x70],	%l1
	fmovsvc	%xcc,	%f0,	%f21
	ldsh	[%l7 + 0x76],	%l6
	fmovrsgez	%g7,	%f5,	%f8
	edge8ln	%g6,	%o0,	%g2
	alignaddr	%l5,	%i3,	%o3
	stx	%i6,	[%l7 + 0x08]
	for	%f28,	%f28,	%f10
	umulcc	%l3,	%i2,	%g5
	addc	%o1,	0x0E12,	%o4
	movl	%icc,	%i5,	%l0
	smulcc	%g1,	%g3,	%o5
	movcs	%xcc,	%l4,	%i0
	xorcc	%o2,	0x0B68,	%i4
	movcc	%xcc,	%i1,	%o7
	movg	%icc,	%l2,	%o6
	sllx	%g4,	0x1A,	%l1
	movl	%icc,	%i7,	%g7
	movcc	%xcc,	%g6,	%o0
	edge16ln	%g2,	%l6,	%i3
	xnor	%l5,	%o3,	%i6
	xnor	%i2,	%g5,	%l3
	orn	%o1,	0x19FE,	%o4
	fcmpgt32	%f24,	%f30,	%i5
	srl	%g1,	%l0,	%o5
	movvs	%icc,	%g3,	%l4
	sra	%i0,	%i4,	%o2
	and	%i1,	0x0604,	%o7
	fzero	%f2
	movvs	%icc,	%l2,	%o6
	andcc	%l1,	%i7,	%g4
	movneg	%xcc,	%g7,	%g6
	fnor	%f8,	%f16,	%f18
	subcc	%o0,	%g2,	%i3
	st	%f8,	[%l7 + 0x64]
	movcc	%xcc,	%l5,	%l6
	edge16	%i6,	%i2,	%g5
	edge8ln	%l3,	%o1,	%o4
	sdiv	%i5,	0x0E8F,	%o3
	nop
	set	0x54, %l6
	stw	%l0,	[%l7 + %l6]
	umulcc	%g1,	0x1C0F,	%o5
	edge32l	%l4,	%g3,	%i4
	movrne	%o2,	%i1,	%o7
	addccc	%l2,	0x13A0,	%i0
	sethi	0x1DA4,	%l1
	fmovsge	%xcc,	%f11,	%f9
	alignaddrl	%o6,	%g4,	%g7
	fmovrdlez	%g6,	%f24,	%f18
	movn	%icc,	%o0,	%g2
	mulx	%i3,	%i7,	%l5
	udivx	%i6,	0x1833,	%i2
	orcc	%l6,	0x12AA,	%l3
	movre	%o1,	0x150,	%g5
	mulscc	%i5,	0x01F9,	%o3
	st	%f23,	[%l7 + 0x68]
	sdivx	%l0,	0x175E,	%g1
	movrlez	%o5,	%l4,	%g3
	fmovsg	%icc,	%f19,	%f14
	fmovd	%f18,	%f24
	edge16ln	%o4,	%o2,	%i4
	lduh	[%l7 + 0x12],	%i1
	sdivx	%l2,	0x1B80,	%o7
	andn	%l1,	0x194D,	%i0
	array8	%o6,	%g7,	%g6
	array16	%o0,	%g2,	%g4
	umulcc	%i3,	%i7,	%l5
	sdivx	%i6,	0x0607,	%i2
	movge	%icc,	%l3,	%l6
	subc	%g5,	0x0170,	%o1
	ldd	[%l7 + 0x10],	%f2
	sra	%o3,	0x0D,	%i5
	andncc	%l0,	%g1,	%l4
	edge16	%o5,	%g3,	%o4
	ldsb	[%l7 + 0x7A],	%i4
	fors	%f12,	%f3,	%f26
	movge	%icc,	%i1,	%l2
	array32	%o7,	%l1,	%o2
	edge32ln	%o6,	%i0,	%g6
	fandnot1	%f28,	%f6,	%f10
	fmul8x16	%f25,	%f22,	%f12
	sdivcc	%o0,	0x0A17,	%g2
	lduh	[%l7 + 0x1C],	%g7
	edge8l	%g4,	%i3,	%l5
	alignaddr	%i7,	%i6,	%l3
	srax	%i2,	%g5,	%o1
	movvs	%icc,	%o3,	%i5
	srax	%l6,	0x0F,	%l0
	movrlz	%g1,	0x1C0,	%l4
	edge8l	%o5,	%g3,	%i4
	edge32ln	%o4,	%i1,	%l2
	movg	%xcc,	%l1,	%o7
	ldub	[%l7 + 0x21],	%o2
	fmovsvs	%icc,	%f13,	%f23
	fandnot1s	%f13,	%f13,	%f22
	udivx	%i0,	0x12B0,	%g6
	edge16l	%o6,	%g2,	%o0
	addcc	%g4,	%g7,	%l5
	fmovd	%f24,	%f4
	movrgz	%i7,	%i6,	%l3
	fxors	%f31,	%f25,	%f3
	restore %i3, 0x1C9F, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x70, %o0
	std	%f14,	[%l7 + %o0]
	sth	%o1,	[%l7 + 0x18]
	edge32	%o3,	%i5,	%l6
	sethi	0x16FE,	%i2
	ldx	[%l7 + 0x10],	%g1
	addcc	%l4,	0x0355,	%l0
	stw	%o5,	[%l7 + 0x08]
	edge8n	%g3,	%o4,	%i4
	xnor	%i1,	%l1,	%o7
	edge32l	%o2,	%i0,	%l2
	sdivx	%o6,	0x0F8B,	%g6
	fcmple16	%f16,	%f16,	%g2
	edge8	%g4,	%o0,	%l5
	movrne	%i7,	0x1F6,	%g7
	addcc	%i6,	0x018D,	%l3
	andncc	%i3,	%g5,	%o1
	alignaddr	%o3,	%l6,	%i5
	andncc	%i2,	%l4,	%g1
	fnot2	%f14,	%f12
	ldsh	[%l7 + 0x4A],	%o5
	orcc	%g3,	0x04A9,	%l0
	srax	%o4,	0x16,	%i4
	fmovsleu	%icc,	%f6,	%f18
	st	%f5,	[%l7 + 0x7C]
	movg	%xcc,	%l1,	%i1
	udivx	%o7,	0x1EFC,	%i0
	alignaddrl	%o2,	%l2,	%g6
	srl	%o6,	%g4,	%o0
	movpos	%xcc,	%g2,	%i7
	ldub	[%l7 + 0x33],	%g7
	udiv	%l5,	0x0F44,	%i6
	ldsb	[%l7 + 0x09],	%i3
	subc	%l3,	0x0723,	%o1
	andcc	%o3,	0x0A52,	%l6
	movrne	%g5,	0x3BF,	%i2
	ld	[%l7 + 0x28],	%f25
	xnor	%l4,	%g1,	%o5
	umul	%i5,	0x0072,	%l0
	fxor	%f24,	%f22,	%f2
	movpos	%xcc,	%o4,	%g3
	ldd	[%l7 + 0x50],	%l0
	movle	%icc,	%i1,	%o7
	edge8ln	%i4,	%i0,	%o2
	alignaddr	%g6,	%o6,	%g4
	udivx	%l2,	0x12B2,	%o0
	ldx	[%l7 + 0x30],	%g2
	movpos	%icc,	%g7,	%l5
	movl	%xcc,	%i7,	%i6
	addc	%i3,	0x18B6,	%o1
	movle	%icc,	%l3,	%o3
	mulscc	%g5,	%i2,	%l4
	andn	%g1,	0x15AA,	%l6
	array16	%i5,	%o5,	%l0
	ldd	[%l7 + 0x38],	%g2
	movcs	%icc,	%o4,	%l1
	orn	%i1,	0x1364,	%i4
	movneg	%icc,	%i0,	%o7
	fmovrde	%o2,	%f30,	%f20
	fmovdle	%icc,	%f26,	%f2
	andn	%o6,	%g4,	%g6
	and	%l2,	%o0,	%g2
	and	%g7,	%l5,	%i7
	edge16n	%i3,	%i6,	%o1
	fmovdne	%icc,	%f21,	%f10
	movn	%xcc,	%l3,	%g5
	umul	%i2,	0x00F1,	%l4
	sllx	%o3,	0x15,	%g1
	srax	%i5,	0x15,	%o5
	movcs	%xcc,	%l6,	%g3
	movrlez	%o4,	0x121,	%l0
	ldd	[%l7 + 0x78],	%f20
	edge16n	%l1,	%i1,	%i0
	fmovdcc	%xcc,	%f25,	%f9
	sdiv	%i4,	0x045C,	%o7
	fnors	%f20,	%f28,	%f2
	sdivcc	%o2,	0x198A,	%g4
	andcc	%g6,	%o6,	%o0
	bshuffle	%f2,	%f0,	%f18
	fpadd16s	%f12,	%f27,	%f10
	udivx	%g2,	0x1DA0,	%g7
	addccc	%l2,	%l5,	%i7
	edge8ln	%i3,	%i6,	%o1
	orncc	%g5,	%i2,	%l3
	udivcc	%o3,	0x0F85,	%l4
	movcs	%xcc,	%g1,	%i5
	array8	%l6,	%g3,	%o4
	srlx	%o5,	0x10,	%l1
	ldd	[%l7 + 0x10],	%f10
	fmovrdgz	%l0,	%f30,	%f4
	andcc	%i1,	0x114A,	%i4
	or	%o7,	0x1DF1,	%i0
	fmovrdgez	%g4,	%f22,	%f10
	umulcc	%g6,	%o6,	%o2
	fmovrdlz	%o0,	%f12,	%f0
	xor	%g2,	0x0424,	%l2
	fnand	%f20,	%f8,	%f20
	fmovsvc	%icc,	%f27,	%f15
	movle	%icc,	%l5,	%g7
	fmovdgu	%icc,	%f27,	%f18
	array16	%i3,	%i6,	%o1
	array32	%i7,	%g5,	%i2
	ldsb	[%l7 + 0x3B],	%o3
	addc	%l3,	0x0084,	%g1
	movge	%icc,	%i5,	%l4
	edge16	%g3,	%o4,	%o5
	mulscc	%l1,	0x0EA7,	%l6
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	ldsh	[%l7 + 0x76],	%i0
	fexpand	%f14,	%f6
	fpadd32s	%f13,	%f5,	%f17
	orn	%l0,	%g6,	%o6
	edge8	%o2,	%g4,	%o0
	movrgz	%l2,	0x2E0,	%l5
	move	%icc,	%g2,	%g7
	movrne	%i6,	0x146,	%i3
	fcmpne16	%f4,	%f16,	%i7
	movrgez	%o1,	%i2,	%o3
	ld	[%l7 + 0x10],	%f1
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%l3
	ldd	[%l7 + 0x68],	%g4
	sdiv	%i5,	0x0550,	%l4
	orcc	%g3,	%o4,	%g1
	fmul8x16au	%f2,	%f30,	%f12
	fmovsge	%icc,	%f19,	%f7
	sdiv	%l1,	0x1AA0,	%l6
	fmovrdne	%i1,	%f6,	%f2
	ldsb	[%l7 + 0x65],	%o5
	ldd	[%l7 + 0x28],	%f0
	sir	0x01FC
	movre	%o7,	%i4,	%l0
	fors	%f16,	%f6,	%f29
	smulcc	%i0,	0x161F,	%o6
	orcc	%o2,	%g4,	%g6
	ldsb	[%l7 + 0x1A],	%o0
	xor	%l5,	0x0C8C,	%g2
	movvc	%xcc,	%g7,	%l2
	sir	0x0CF8
	restore %i3, 0x11FF, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o1,	%i7,	%i2
	ldub	[%l7 + 0x18],	%o3
	fsrc1s	%f3,	%f6
	or	%g5,	0x0818,	%i5
	addccc	%l4,	%g3,	%l3
	udivx	%g1,	0x1C75,	%o4
	fandnot1	%f30,	%f14,	%f4
	alignaddrl	%l6,	%i1,	%l1
	fmovrsne	%o7,	%f30,	%f24
	movcc	%icc,	%o5,	%l0
	srl	%i4,	0x03,	%i0
	ldsw	[%l7 + 0x18],	%o2
	fmovspos	%xcc,	%f5,	%f14
	ldub	[%l7 + 0x24],	%o6
	fmovdleu	%xcc,	%f0,	%f6
	sll	%g6,	0x07,	%g4
	fmovdgu	%xcc,	%f1,	%f31
	fpsub32	%f0,	%f14,	%f28
	movge	%xcc,	%l5,	%o0
	add	%g2,	%g7,	%l2
	save %i3, 0x0231, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%i7,	%f11,	%f17
	fmovdvc	%xcc,	%f2,	%f16
	fmovdl	%icc,	%f4,	%f4
	udivcc	%i2,	0x03DF,	%o3
	ld	[%l7 + 0x58],	%f31
	fmuld8ulx16	%f29,	%f25,	%f0
	edge32l	%o1,	%i5,	%g5
	fcmps	%fcc2,	%f24,	%f5
	fones	%f5
	udivx	%l4,	0x1E66,	%g3
	movrne	%l3,	%o4,	%g1
	fmovrslz	%i1,	%f7,	%f9
	ldx	[%l7 + 0x58],	%l1
	umulcc	%l6,	%o5,	%l0
	movcc	%xcc,	%i4,	%i0
	sth	%o2,	[%l7 + 0x22]
	lduh	[%l7 + 0x70],	%o7
	fnot1	%f18,	%f2
	ld	[%l7 + 0x58],	%f4
	movle	%icc,	%g6,	%o6
	st	%f8,	[%l7 + 0x58]
	edge8n	%g4,	%l5,	%o0
	orcc	%g7,	0x18AE,	%l2
	movl	%xcc,	%g2,	%i3
	save %i6, 0x13B1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i2,	%o3,	%o1
	ldsh	[%l7 + 0x38],	%i5
	sub	%l4,	%g3,	%g5
	movre	%o4,	%g1,	%l3
	srl	%l1,	%l6,	%i1
	movleu	%icc,	%l0,	%o5
	st	%f25,	[%l7 + 0x60]
	xnor	%i0,	0x19D7,	%i4
	movrgez	%o7,	%g6,	%o6
	umulcc	%o2,	0x0C85,	%g4
	lduh	[%l7 + 0x68],	%l5
	fnor	%f24,	%f22,	%f10
	movgu	%xcc,	%o0,	%g7
	fcmpne32	%f12,	%f12,	%g2
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	fone	%f28
	smul	%i7,	%i3,	%o3
	fornot2s	%f6,	%f28,	%f2
	xnorcc	%o1,	%i2,	%i5
	movrlz	%l4,	0x003,	%g5
	edge32n	%o4,	%g3,	%g1
	mulscc	%l3,	%l6,	%l1
	udivx	%l0,	0x0E58,	%i1
	fpadd16	%f8,	%f0,	%f26
	sdiv	%i0,	0x0429,	%o5
	fmovrdgez	%o7,	%f4,	%f12
	stx	%i4,	[%l7 + 0x68]
	xorcc	%g6,	%o2,	%g4
	edge16n	%l5,	%o6,	%g7
	sra	%o0,	%g2,	%l2
	sir	0x0AE5
	fmovd	%f24,	%f18
	fmovsneg	%icc,	%f24,	%f28
	movrlez	%i7,	%i3,	%i6
	movcc	%xcc,	%o3,	%i2
	mulscc	%i5,	0x01F7,	%o1
	save %l4, %o4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g5,	%g1,	%l6
	fmovsle	%xcc,	%f27,	%f30
	movrne	%l3,	%l0,	%l1
	andncc	%i0,	%o5,	%i1
	fnands	%f6,	%f1,	%f26
	ldd	[%l7 + 0x08],	%i4
	subcc	%o7,	%o2,	%g6
	ldx	[%l7 + 0x70],	%l5
	fmul8x16	%f1,	%f12,	%f6
	edge8l	%o6,	%g7,	%o0
	udivx	%g2,	0x02E9,	%l2
	srlx	%g4,	%i7,	%i3
	fmovsle	%icc,	%f31,	%f29
	orcc	%i6,	%i2,	%i5
	movrlz	%o1,	%o3,	%l4
	move	%xcc,	%o4,	%g3
	movrlz	%g5,	0x1B9,	%l6
	addc	%g1,	%l3,	%l1
	sllx	%i0,	0x07,	%o5
	ldsb	[%l7 + 0x2E],	%i1
	array32	%l0,	%o7,	%o2
	std	%f4,	[%l7 + 0x50]
	orn	%g6,	0x0A75,	%i4
	movrne	%o6,	0x131,	%l5
	fors	%f20,	%f24,	%f13
	umul	%o0,	%g2,	%l2
	fmovda	%icc,	%f1,	%f21
	fpsub16s	%f22,	%f8,	%f29
	fmovsvs	%xcc,	%f16,	%f21
	array16	%g4,	%g7,	%i3
	fmovrsgz	%i7,	%f4,	%f20
	restore %i6, 0x0F26, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x1F, %g2
	ldub	[%l7 + %g2],	%i2
	orcc	%o3,	%l4,	%o1
	std	%f2,	[%l7 + 0x60]
	fmovdge	%xcc,	%f9,	%f4
	fpackfix	%f24,	%f23
	movleu	%xcc,	%g3,	%g5
	and	%l6,	%o4,	%l3
	and	%l1,	0x1A14,	%i0
	fpadd16s	%f30,	%f19,	%f22
	stw	%o5,	[%l7 + 0x28]
	fpack32	%f12,	%f4,	%f14
	fmovrdgez	%i1,	%f22,	%f18
	sra	%g1,	0x0B,	%o7
	xnorcc	%l0,	0x0A6C,	%o2
	edge8n	%i4,	%o6,	%l5
	fmovse	%xcc,	%f4,	%f7
	movge	%xcc,	%o0,	%g2
	fmovsvs	%icc,	%f15,	%f11
	ldd	[%l7 + 0x10],	%g6
	ldx	[%l7 + 0x70],	%l2
	movg	%icc,	%g7,	%i3
	sdivx	%i7,	0x10E6,	%i6
	fabss	%f8,	%f5
	nop
	set	0x30, %o2
	stx	%i5,	[%l7 + %o2]
	fpsub32	%f20,	%f30,	%f14
	addc	%g4,	%o3,	%l4
	fmovdle	%xcc,	%f26,	%f13
	lduw	[%l7 + 0x48],	%o1
	ldsw	[%l7 + 0x78],	%i2
	movrlez	%g5,	%l6,	%o4
	umul	%g3,	0x0C7C,	%l1
	fmovrdgez	%i0,	%f22,	%f28
	movpos	%xcc,	%o5,	%i1
	array8	%g1,	%l3,	%o7
	alignaddrl	%l0,	%o2,	%i4
	edge16	%o6,	%l5,	%g2
	sub	%o0,	0x0BD2,	%l2
	sll	%g7,	%i3,	%g6
	edge8ln	%i7,	%i6,	%g4
	fnegs	%f8,	%f29
	edge16ln	%o3,	%l4,	%o1
	fmovrdgez	%i5,	%f22,	%f10
	movn	%xcc,	%i2,	%g5
	smulcc	%l6,	%o4,	%g3
	movneg	%xcc,	%l1,	%o5
	array16	%i0,	%g1,	%l3
	sdivcc	%i1,	0x10F7,	%l0
	sll	%o7,	0x13,	%o2
	fmovdle	%xcc,	%f14,	%f17
	srl	%o6,	%l5,	%i4
	orncc	%o0,	%l2,	%g7
	edge8l	%g2,	%g6,	%i3
	faligndata	%f16,	%f26,	%f12
	sll	%i7,	0x08,	%g4
	movn	%xcc,	%o3,	%i6
	fxor	%f12,	%f24,	%f0
	bshuffle	%f8,	%f10,	%f16
	addc	%o1,	%i5,	%l4
	fmul8x16al	%f22,	%f17,	%f10
	edge32l	%g5,	%l6,	%i2
	edge8n	%o4,	%g3,	%o5
	movleu	%xcc,	%l1,	%i0
	stw	%g1,	[%l7 + 0x40]
	andn	%l3,	0x15A9,	%l0
	save %o7, 0x0DD1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o6,	0x0667,	%l5
	srl	%i4,	0x02,	%o0
	sra	%l2,	0x01,	%i1
	srl	%g2,	0x16,	%g7
	addc	%g6,	0x12D0,	%i7
	fnand	%f26,	%f2,	%f26
	fmovrdlez	%g4,	%f24,	%f14
	movne	%xcc,	%i3,	%o3
	fmul8ulx16	%f30,	%f16,	%f26
	ldsb	[%l7 + 0x67],	%o1
	add	%i6,	%l4,	%i5
	srlx	%g5,	%i2,	%o4
	sra	%g3,	0x17,	%l6
	movrlz	%o5,	0x2A8,	%i0
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%l0
	andncc	%l3,	%g1,	%o7
	srlx	%o2,	0x15,	%l0
	sdivx	%l5,	0x1AAB,	%i4
	sethi	0x148F,	%o6
	sdivcc	%l2,	0x093A,	%i1
	or	%o0,	0x0CE2,	%g7
	udiv	%g2,	0x0FBA,	%g6
	fmovrslz	%i7,	%f20,	%f18
	sub	%i3,	0x0404,	%o3
	stx	%o1,	[%l7 + 0x70]
	ldub	[%l7 + 0x2B],	%g4
	edge16ln	%l4,	%i6,	%g5
	subccc	%i5,	0x130B,	%o4
	movrgez	%i2,	0x251,	%g3
	edge16l	%o5,	%l6,	%l1
	fmul8sux16	%f6,	%f30,	%f12
	edge8ln	%l3,	%g1,	%o7
	fsrc1	%f6,	%f30
	fornot2s	%f16,	%f22,	%f15
	std	%f20,	[%l7 + 0x58]
	movpos	%xcc,	%o2,	%i0
	fmul8x16al	%f26,	%f18,	%f26
	fpsub32s	%f3,	%f30,	%f15
	fmovdpos	%icc,	%f30,	%f24
	edge16l	%l5,	%l0,	%o6
	fmovsge	%xcc,	%f13,	%f4
	and	%l2,	0x0B5D,	%i4
	mulx	%o0,	0x03A6,	%i1
	std	%f26,	[%l7 + 0x30]
	edge8n	%g2,	%g7,	%g6
	andcc	%i3,	%i7,	%o3
	fnors	%f8,	%f16,	%f29
	lduw	[%l7 + 0x18],	%g4
	for	%f14,	%f6,	%f22
	alignaddr	%l4,	%i6,	%g5
	addc	%i5,	%o4,	%o1
	movge	%icc,	%i2,	%o5
	fmovrdlez	%l6,	%f14,	%f0
	movre	%l1,	0x22E,	%g3
	lduw	[%l7 + 0x2C],	%l3
	ldd	[%l7 + 0x38],	%f4
	mulx	%g1,	0x113D,	%o7
	smul	%o2,	%l5,	%l0
	fxor	%f14,	%f26,	%f22
	ldd	[%l7 + 0x60],	%o6
	fmul8x16al	%f11,	%f25,	%f14
	fcmpeq32	%f2,	%f0,	%i0
	movcs	%xcc,	%i4,	%o0
	ldub	[%l7 + 0x45],	%l2
	edge32n	%g2,	%g7,	%i1
	mulx	%g6,	0x0A49,	%i7
	edge8	%i3,	%g4,	%o3
	movle	%icc,	%l4,	%i6
	fpadd32s	%f31,	%f24,	%f4
	movneg	%icc,	%i5,	%o4
	fmovdpos	%xcc,	%f1,	%f31
	udivx	%o1,	0x003E,	%i2
	fmovdgu	%xcc,	%f1,	%f9
	fcmpes	%fcc2,	%f15,	%f15
	sdivx	%o5,	0x1445,	%g5
	movge	%icc,	%l6,	%l1
	ldd	[%l7 + 0x18],	%g2
	fcmpd	%fcc2,	%f30,	%f28
	sethi	0x189F,	%l3
	addc	%g1,	%o2,	%l5
	mulx	%l0,	%o7,	%i0
	xnor	%o6,	0x0E46,	%i4
	fors	%f13,	%f4,	%f24
	movrne	%l2,	%g2,	%o0
	movrlz	%i1,	0x27D,	%g6
	array32	%i7,	%i3,	%g4
	stw	%o3,	[%l7 + 0x20]
	fmovsl	%xcc,	%f2,	%f5
	srl	%g7,	%l4,	%i5
	lduh	[%l7 + 0x36],	%o4
	movg	%xcc,	%o1,	%i2
	fmovsg	%xcc,	%f30,	%f30
	movgu	%xcc,	%o5,	%g5
	stw	%l6,	[%l7 + 0x30]
	edge32l	%i6,	%l1,	%l3
	fcmpd	%fcc3,	%f6,	%f22
	movpos	%xcc,	%g1,	%g3
	fmovdcs	%icc,	%f22,	%f22
	movrlz	%o2,	0x060,	%l0
	edge16n	%o7,	%l5,	%o6
	fmovsa	%xcc,	%f5,	%f5
	movvs	%xcc,	%i0,	%l2
	subcc	%i4,	%o0,	%g2
	movcc	%icc,	%g6,	%i7
	fmovsa	%icc,	%f24,	%f22
	movle	%icc,	%i3,	%g4
	edge8	%o3,	%g7,	%i1
	for	%f14,	%f18,	%f16
	umul	%i5,	0x1B3B,	%o4
	movvs	%xcc,	%l4,	%i2
	fnegd	%f20,	%f24
	fnors	%f20,	%f3,	%f29
	fcmpgt32	%f20,	%f26,	%o1
	lduw	[%l7 + 0x54],	%o5
	stw	%l6,	[%l7 + 0x1C]
	sll	%i6,	%g5,	%l3
	lduh	[%l7 + 0x3A],	%g1
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	sdiv	%l1,	0x1F77,	%o7
	srl	%l0,	0x0C,	%l5
	fmovsn	%icc,	%f1,	%f17
	fcmpeq32	%f8,	%f16,	%o6
	and	%l2,	0x034D,	%i0
	xnor	%i4,	0x1E8E,	%g2
	fcmpgt32	%f24,	%f0,	%g6
	sll	%o0,	0x07,	%i3
	movl	%icc,	%g4,	%i7
	sll	%g7,	0x0B,	%o3
	stb	%i5,	[%l7 + 0x35]
	ldub	[%l7 + 0x45],	%o4
	movvc	%xcc,	%l4,	%i2
	fmovsg	%xcc,	%f31,	%f12
	movcs	%xcc,	%i1,	%o1
	edge8n	%l6,	%i6,	%g5
	movn	%xcc,	%l3,	%o5
	andn	%g1,	%g3,	%o2
	andcc	%o7,	%l1,	%l5
	sth	%o6,	[%l7 + 0x76]
	fandnot1	%f0,	%f20,	%f28
	ldsw	[%l7 + 0x6C],	%l2
	fzero	%f16
	smulcc	%l0,	0x1F87,	%i0
	movgu	%xcc,	%i4,	%g2
	fandnot1	%f16,	%f14,	%f30
	fmovd	%f24,	%f14
	srax	%o0,	0x10,	%i3
	smul	%g6,	%i7,	%g7
	orncc	%g4,	%o3,	%i5
	fcmpne32	%f18,	%f20,	%l4
	fcmple32	%f10,	%f30,	%i2
	sll	%o4,	0x01,	%o1
	srlx	%i1,	0x18,	%l6
	fmovsn	%icc,	%f2,	%f21
	fmovsl	%xcc,	%f29,	%f7
	movl	%icc,	%g5,	%l3
	movne	%xcc,	%o5,	%i6
	xorcc	%g3,	%o2,	%g1
	xnorcc	%l1,	%o7,	%l5
	smul	%o6,	%l2,	%i0
	edge32n	%l0,	%g2,	%i4
	orncc	%i3,	%o0,	%g6
	sir	0x1489
	udiv	%i7,	0x076E,	%g4
	movl	%icc,	%o3,	%g7
	movvc	%icc,	%l4,	%i5
	sth	%i2,	[%l7 + 0x52]
	movrgz	%o4,	%o1,	%i1
	edge16n	%g5,	%l6,	%l3
	movge	%icc,	%o5,	%g3
	fpackfix	%f12,	%f22
	srl	%i6,	%o2,	%l1
	sdiv	%g1,	0x14F8,	%l5
	edge16	%o7,	%o6,	%i0
	alignaddr	%l2,	%l0,	%g2
	edge32ln	%i4,	%i3,	%o0
	xor	%i7,	%g6,	%o3
	popc	0x0E70,	%g4
	xor	%g7,	0x091E,	%l4
	movrlz	%i5,	%o4,	%i2
	edge8	%o1,	%i1,	%g5
	or	%l6,	%o5,	%g3
	movvc	%xcc,	%i6,	%l3
	movcs	%xcc,	%l1,	%g1
	sth	%o2,	[%l7 + 0x4E]
	addc	%o7,	0x08D3,	%o6
	sdivcc	%i0,	0x119E,	%l2
	movle	%icc,	%l0,	%g2
	andncc	%i4,	%i3,	%o0
	movg	%xcc,	%i7,	%g6
	array8	%l5,	%g4,	%g7
	subcc	%l4,	%o3,	%i5
	popc	%i2,	%o1
	add	%i1,	%o4,	%g5
	and	%l6,	%g3,	%i6
	fmovdn	%xcc,	%f11,	%f27
	fmovdcs	%xcc,	%f13,	%f13
	xor	%o5,	0x01BA,	%l1
	popc	0x00C1,	%l3
	array32	%g1,	%o2,	%o6
	sra	%o7,	%l2,	%i0
	mulscc	%l0,	0x1240,	%i4
	movl	%xcc,	%i3,	%o0
	movrgz	%i7,	0x1D2,	%g2
	addc	%g6,	0x043C,	%l5
	sdiv	%g7,	0x13E2,	%l4
	xor	%g4,	%i5,	%o3
	subc	%i2,	%o1,	%o4
	xnor	%i1,	0x1A02,	%l6
	smul	%g3,	0x1E67,	%i6
	smulcc	%o5,	%g5,	%l1
	nop
	set	0x18, %g6
	std	%f16,	[%l7 + %g6]
	subcc	%g1,	0x109D,	%o2
	fmovrdlez	%l3,	%f28,	%f28
	pdist	%f28,	%f4,	%f4
	udivcc	%o6,	0x12E7,	%l2
	fands	%f20,	%f10,	%f2
	movrne	%i0,	%l0,	%o7
	popc	0x0838,	%i4
	andncc	%i3,	%i7,	%o0
	lduh	[%l7 + 0x22],	%g2
	xnor	%l5,	0x09FA,	%g7
	fxor	%f16,	%f4,	%f18
	movl	%icc,	%l4,	%g4
	movne	%xcc,	%i5,	%o3
	and	%g6,	%i2,	%o4
	ldx	[%l7 + 0x38],	%o1
	fmovdle	%xcc,	%f14,	%f16
	srl	%i1,	0x11,	%g3
	sir	0x078E
	fmovrdne	%l6,	%f22,	%f6
	move	%xcc,	%i6,	%o5
	sethi	0x0608,	%l1
	fmovrdlez	%g5,	%f22,	%f30
	srax	%o2,	%l3,	%o6
	orncc	%l2,	%g1,	%i0
	edge32l	%o7,	%i4,	%l0
	lduw	[%l7 + 0x3C],	%i3
	subc	%o0,	0x0D55,	%g2
	edge32ln	%l5,	%i7,	%l4
	udiv	%g4,	0x15D4,	%i5
	edge8l	%g7,	%g6,	%o3
	orn	%o4,	%o1,	%i1
	move	%xcc,	%i2,	%g3
	fmovrde	%i6,	%f26,	%f14
	xnorcc	%o5,	0x01C7,	%l1
	fnands	%f26,	%f29,	%f15
	fmovdg	%icc,	%f3,	%f4
	ldd	[%l7 + 0x10],	%i6
	addcc	%o2,	%l3,	%g5
	orcc	%o6,	%g1,	%i0
	srlx	%l2,	0x00,	%o7
	fpadd32	%f14,	%f30,	%f4
	movcc	%icc,	%l0,	%i4
	movgu	%xcc,	%o0,	%i3
	edge16ln	%l5,	%i7,	%g2
	ldsw	[%l7 + 0x28],	%l4
	mulx	%i5,	0x1C3B,	%g7
	subccc	%g4,	0x0494,	%g6
	movneg	%xcc,	%o3,	%o1
	sub	%o4,	0x0BB9,	%i1
	srax	%g3,	0x08,	%i2
	movrlez	%i6,	%o5,	%l1
	udiv	%l6,	0x1ECF,	%l3
	faligndata	%f20,	%f18,	%f22
	movcc	%icc,	%o2,	%o6
	movg	%xcc,	%g1,	%i0
	subc	%l2,	0x137E,	%g5
	fmovspos	%xcc,	%f11,	%f12
	sllx	%o7,	0x1E,	%i4
	udiv	%o0,	0x1E44,	%l0
	move	%xcc,	%i3,	%i7
	fmovdcc	%icc,	%f9,	%f3
	fmovdvc	%icc,	%f18,	%f24
	fmovsne	%icc,	%f0,	%f9
	udiv	%g2,	0x0745,	%l4
	edge16l	%i5,	%l5,	%g4
	add	%g7,	%g6,	%o3
	stb	%o1,	[%l7 + 0x32]
	srax	%i1,	0x1B,	%o4
	mova	%xcc,	%g3,	%i2
	movre	%i6,	%o5,	%l6
	srlx	%l1,	%l3,	%o2
	stw	%g1,	[%l7 + 0x6C]
	fands	%f2,	%f8,	%f20
	edge8l	%i0,	%o6,	%l2
	fmul8x16	%f0,	%f10,	%f26
	ldub	[%l7 + 0x2E],	%o7
	movn	%icc,	%g5,	%i4
	alignaddrl	%l0,	%i3,	%i7
	sll	%o0,	%g2,	%l4
	xnor	%l5,	%i5,	%g4
	sir	0x0792
	smul	%g7,	%o3,	%o1
	fmul8x16au	%f11,	%f20,	%f20
	edge32ln	%g6,	%o4,	%i1
	movrlez	%g3,	%i6,	%o5
	ldd	[%l7 + 0x18],	%f16
	fand	%f22,	%f12,	%f16
	movrlez	%i2,	0x074,	%l6
	edge8	%l3,	%o2,	%g1
	movrlez	%l1,	0x0D4,	%i0
	fcmpeq32	%f8,	%f10,	%o6
	mova	%xcc,	%l2,	%g5
	edge32l	%o7,	%i4,	%i3
	movpos	%icc,	%l0,	%i7
	fxor	%f28,	%f24,	%f8
	sdiv	%g2,	0x064B,	%o0
	addcc	%l4,	%i5,	%l5
	edge32n	%g4,	%g7,	%o1
	edge8ln	%g6,	%o3,	%o4
	orcc	%g3,	%i6,	%i1
	movrne	%i2,	%o5,	%l3
	movrne	%l6,	0x051,	%g1
	fcmpgt16	%f24,	%f14,	%o2
	edge32	%i0,	%l1,	%l2
	edge16	%o6,	%g5,	%i4
	array32	%o7,	%l0,	%i7
	ldx	[%l7 + 0x50],	%i3
	and	%o0,	0x0F97,	%l4
	edge16l	%i5,	%g2,	%l5
	array32	%g4,	%o1,	%g7
	sll	%g6,	%o3,	%o4
	srl	%i6,	0x04,	%g3
	ldd	[%l7 + 0x10],	%i0
	fmovrsgez	%i2,	%f20,	%f31
	movgu	%xcc,	%l3,	%o5
	movle	%icc,	%l6,	%g1
	fzero	%f28
	movgu	%xcc,	%o2,	%i0
	stw	%l2,	[%l7 + 0x34]
	fpadd32	%f30,	%f10,	%f18
	edge16l	%l1,	%g5,	%o6
	orn	%i4,	%o7,	%l0
	orn	%i7,	%i3,	%o0
	fxnors	%f30,	%f11,	%f23
	ldub	[%l7 + 0x77],	%l4
	fnands	%f26,	%f3,	%f17
	stx	%i5,	[%l7 + 0x20]
	fmovsa	%icc,	%f26,	%f14
	srl	%g2,	0x18,	%l5
	srl	%o1,	0x16,	%g4
	srl	%g7,	0x01,	%o3
	movgu	%icc,	%g6,	%o4
	movgu	%icc,	%i6,	%g3
	edge16n	%i1,	%i2,	%l3
	popc	%o5,	%l6
	edge8	%o2,	%g1,	%l2
	movl	%xcc,	%l1,	%i0
	movre	%o6,	0x16A,	%i4
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%g4
	array32	%o7,	%i7,	%i3
	mulx	%o0,	%l0,	%l4
	edge16n	%i5,	%g2,	%o1
	movre	%l5,	%g4,	%o3
	fcmple32	%f28,	%f20,	%g6
	fones	%f29
	lduh	[%l7 + 0x16],	%g7
	movle	%xcc,	%o4,	%i6
	fmovse	%xcc,	%f24,	%f13
	fpsub32s	%f2,	%f31,	%f6
	or	%i1,	0x058B,	%g3
	andn	%i2,	%o5,	%l3
	mulscc	%l6,	0x1136,	%g1
	stb	%o2,	[%l7 + 0x1B]
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%f24
	lduw	[%l7 + 0x08],	%l1
	ldsw	[%l7 + 0x20],	%l2
	srlx	%i0,	0x15,	%i4
	fmovsge	%icc,	%f30,	%f30
	orn	%o6,	0x0317,	%o7
	fnot2	%f30,	%f4
	andcc	%i7,	0x1C3B,	%g5
	movle	%icc,	%o0,	%i3
	subc	%l4,	%i5,	%l0
	edge8	%o1,	%l5,	%g2
	ldd	[%l7 + 0x68],	%f0
	sth	%o3,	[%l7 + 0x48]
	fmovscs	%icc,	%f25,	%f0
	edge16l	%g6,	%g7,	%o4
	ldd	[%l7 + 0x30],	%g4
	fmovdn	%icc,	%f26,	%f21
	fcmpne32	%f24,	%f26,	%i1
	save %g3, %i6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i2,	0x13B1,	%l3
	and	%g1,	0x1519,	%l6
	std	%f22,	[%l7 + 0x70]
	lduw	[%l7 + 0x58],	%l1
	edge32ln	%l2,	%i0,	%o2
	addcc	%i4,	0x1CE9,	%o6
	mulscc	%o7,	%g5,	%i7
	movrgz	%o0,	%l4,	%i5
	edge16	%l0,	%i3,	%o1
	fornot2s	%f16,	%f9,	%f21
	fmul8x16	%f23,	%f28,	%f18
	lduw	[%l7 + 0x38],	%g2
	movgu	%xcc,	%l5,	%g6
	movrlz	%g7,	0x226,	%o4
	sllx	%g4,	%i1,	%o3
	fornot2	%f28,	%f24,	%f14
	fpmerge	%f4,	%f25,	%f12
	stw	%i6,	[%l7 + 0x64]
	addcc	%o5,	0x16D7,	%i2
	fmovscc	%icc,	%f20,	%f3
	movpos	%xcc,	%g3,	%g1
	movgu	%icc,	%l6,	%l3
	movvc	%xcc,	%l2,	%l1
	ldsh	[%l7 + 0x64],	%i0
	mova	%xcc,	%o2,	%i4
	udiv	%o7,	0x0B4E,	%o6
	movcc	%xcc,	%g5,	%i7
	fmovdleu	%icc,	%f5,	%f23
	smul	%l4,	%o0,	%l0
	edge32ln	%i5,	%o1,	%i3
	nop
	set	0x28, %o6
	std	%f28,	[%l7 + %o6]
	fpadd16	%f0,	%f12,	%f8
	restore %g2, %l5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g7,	%g4,	%i1
	fornot2	%f30,	%f16,	%f26
	array32	%o3,	%o4,	%i6
	sir	0x0AC4
	array32	%i2,	%o5,	%g1
	movrlz	%g3,	0x301,	%l6
	fsrc1	%f28,	%f0
	fpack32	%f18,	%f0,	%f14
	andcc	%l3,	0x169E,	%l2
	fxors	%f10,	%f21,	%f1
	or	%l1,	0x1E54,	%o2
	or	%i0,	%i4,	%o7
	movcc	%xcc,	%g5,	%o6
	edge16n	%l4,	%o0,	%l0
	edge8l	%i7,	%i5,	%i3
	fmul8ulx16	%f28,	%f6,	%f24
	orncc	%g2,	0x1EF2,	%o1
	srlx	%g6,	0x08,	%l5
	andncc	%g7,	%i1,	%o3
	smul	%g4,	%i6,	%o4
	fmovdn	%icc,	%f26,	%f1
	movrlez	%o5,	%i2,	%g3
	fpack16	%f0,	%f31
	umul	%g1,	0x1A04,	%l3
	array8	%l6,	%l1,	%l2
	movle	%icc,	%o2,	%i4
	sdiv	%i0,	0x0DA5,	%o7
	fmovdge	%icc,	%f22,	%f10
	andcc	%o6,	%l4,	%o0
	movrne	%g5,	0x1D6,	%l0
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	mova	%xcc,	%o1,	%g6
	movpos	%xcc,	%l5,	%g7
	edge32	%i1,	%o3,	%g2
	movrgz	%i6,	0x2B9,	%g4
	alignaddr	%o4,	%i2,	%g3
	andcc	%g1,	%l3,	%o5
	fnors	%f0,	%f2,	%f6
	st	%f28,	[%l7 + 0x14]
	ldub	[%l7 + 0x21],	%l6
	movrgez	%l2,	%o2,	%l1
	andncc	%i0,	%o7,	%i4
	edge8	%o6,	%o0,	%g5
	move	%xcc,	%l4,	%i7
	fxor	%f22,	%f26,	%f18
	movrgz	%l0,	%i3,	%o1
	fornot2	%f24,	%f0,	%f24
	edge8	%i5,	%g6,	%g7
	movpos	%icc,	%i1,	%o3
	movcc	%xcc,	%g2,	%i6
	edge32	%g4,	%o4,	%l5
	udiv	%i2,	0x1854,	%g3
	stx	%g1,	[%l7 + 0x68]
	sdiv	%l3,	0x1954,	%l6
	addcc	%l2,	%o2,	%l1
	sdiv	%i0,	0x036C,	%o5
	edge8n	%o7,	%i4,	%o6
	fpmerge	%f7,	%f29,	%f18
	movge	%xcc,	%o0,	%l4
	edge16	%g5,	%i7,	%l0
	edge32l	%i3,	%o1,	%i5
	ld	[%l7 + 0x58],	%f15
	edge8ln	%g7,	%i1,	%g6
	edge8	%o3,	%i6,	%g4
	sra	%o4,	0x1A,	%g2
	fzeros	%f18
	movge	%xcc,	%i2,	%g3
	lduw	[%l7 + 0x4C],	%l5
	edge32	%l3,	%l6,	%l2
	andncc	%o2,	%g1,	%i0
	movre	%l1,	0x251,	%o7
	umul	%o5,	%i4,	%o0
	ldub	[%l7 + 0x70],	%o6
	umulcc	%l4,	0x0091,	%i7
	addcc	%l0,	0x0008,	%g5
	stb	%o1,	[%l7 + 0x3F]
	xor	%i3,	0x0D6A,	%i5
	udivx	%g7,	0x02A3,	%i1
	ldd	[%l7 + 0x78],	%o2
	st	%f22,	[%l7 + 0x44]
	udiv	%i6,	0x161C,	%g6
	movrlez	%o4,	%g4,	%i2
	fmovrdlz	%g3,	%f4,	%f22
	movg	%xcc,	%l5,	%l3
	lduh	[%l7 + 0x12],	%l6
	subccc	%l2,	%o2,	%g1
	sir	0x149F
	fpsub32	%f20,	%f14,	%f2
	udivcc	%i0,	0x08A4,	%g2
	movpos	%icc,	%o7,	%o5
	lduw	[%l7 + 0x1C],	%l1
	udiv	%i4,	0x05BE,	%o6
	xnor	%o0,	%l4,	%l0
	st	%f21,	[%l7 + 0x40]
	fmul8sux16	%f6,	%f22,	%f4
	movg	%xcc,	%g5,	%o1
	umulcc	%i7,	%i3,	%i5
	movrgez	%i1,	%o3,	%i6
	fmovdpos	%xcc,	%f18,	%f19
	std	%f20,	[%l7 + 0x28]
	xnorcc	%g6,	%g7,	%g4
	std	%f28,	[%l7 + 0x28]
	smulcc	%i2,	%g3,	%l5
	movcc	%icc,	%o4,	%l3
	fandnot2s	%f10,	%f6,	%f2
	movvc	%icc,	%l6,	%l2
	ldsw	[%l7 + 0x64],	%o2
	array16	%i0,	%g2,	%g1
	fnands	%f8,	%f7,	%f16
	fmovdleu	%xcc,	%f7,	%f22
	stb	%o5,	[%l7 + 0x77]
	subccc	%l1,	0x1A0F,	%i4
	mova	%xcc,	%o7,	%o0
	srax	%o6,	0x0A,	%l0
	movvc	%xcc,	%g5,	%o1
	srlx	%i7,	0x15,	%l4
	stw	%i3,	[%l7 + 0x20]
	subc	%i1,	0x1A0C,	%o3
	andncc	%i6,	%i5,	%g7
	movne	%xcc,	%g6,	%g4
	fpsub16	%f20,	%f18,	%f16
	alignaddrl	%i2,	%g3,	%l5
	sdivcc	%o4,	0x1827,	%l3
	fcmple16	%f20,	%f10,	%l2
	movgu	%xcc,	%o2,	%i0
	umul	%l6,	0x114C,	%g1
	movl	%xcc,	%o5,	%l1
	movcs	%icc,	%g2,	%i4
	restore %o0, 0x19E6, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o7,	%l0,	%o1
	movcc	%xcc,	%g5,	%l4
	movl	%xcc,	%i7,	%i3
	fmovd	%f12,	%f22
	andncc	%o3,	%i1,	%i6
	edge8l	%g7,	%i5,	%g6
	ldsb	[%l7 + 0x0E],	%i2
	lduw	[%l7 + 0x5C],	%g3
	ldd	[%l7 + 0x60],	%l4
	edge32ln	%g4,	%o4,	%l2
	movrne	%l3,	0x047,	%o2
	orncc	%i0,	0x024C,	%l6
	srax	%g1,	0x1C,	%o5
	sdiv	%g2,	0x05CB,	%i4
	srax	%o0,	0x16,	%o6
	sethi	0x0067,	%l1
	std	%f30,	[%l7 + 0x60]
	fsrc1s	%f10,	%f31
	sdivcc	%o7,	0x1A5A,	%l0
	fabsd	%f4,	%f4
	fandnot2	%f16,	%f12,	%f28
	array16	%o1,	%g5,	%i7
	fmovda	%icc,	%f22,	%f18
	addc	%l4,	%o3,	%i1
	smulcc	%i3,	0x0680,	%g7
	fmovda	%icc,	%f4,	%f2
	alignaddr	%i6,	%g6,	%i2
	fpackfix	%f22,	%f25
	sir	0x00C7
	fmovrse	%g3,	%f0,	%f0
	edge16ln	%i5,	%l5,	%o4
	udivcc	%l2,	0x10DA,	%l3
	ldd	[%l7 + 0x68],	%o2
	subcc	%i0,	%g4,	%g1
	ld	[%l7 + 0x78],	%f31
	edge32	%o5,	%l6,	%i4
	edge16n	%o0,	%g2,	%l1
	fmovsa	%xcc,	%f16,	%f24
	bshuffle	%f28,	%f14,	%f20
	movleu	%icc,	%o7,	%o6
	movn	%icc,	%l0,	%o1
	movneg	%icc,	%g5,	%i7
	sll	%l4,	%i1,	%i3
	fmul8x16	%f30,	%f12,	%f20
	andncc	%o3,	%g7,	%g6
	movvc	%xcc,	%i6,	%g3
	orcc	%i5,	%i2,	%l5
	edge8n	%l2,	%l3,	%o2
	save %o4, 0x1A5C, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i0,	[%l7 + 0x30]
	sllx	%o5,	%g1,	%i4
	movge	%icc,	%o0,	%g2
	movleu	%icc,	%l1,	%o7
	popc	%l6,	%l0
	movg	%xcc,	%o1,	%o6
	fpmerge	%f24,	%f20,	%f20
	ldd	[%l7 + 0x48],	%i6
	movn	%icc,	%g5,	%i1
	xnor	%i3,	0x0C6E,	%l4
	edge16n	%o3,	%g7,	%g6
	ldd	[%l7 + 0x20],	%f28
	ldd	[%l7 + 0x20],	%g2
	srlx	%i5,	0x1B,	%i6
	fpadd16	%f8,	%f28,	%f2
	xorcc	%l5,	0x16BF,	%i2
	sub	%l2,	0x1C7D,	%o2
	edge32ln	%l3,	%o4,	%i0
	udivx	%o5,	0x14DA,	%g1
	fxors	%f10,	%f14,	%f25
	movpos	%xcc,	%g4,	%o0
	movpos	%xcc,	%i4,	%g2
	move	%icc,	%o7,	%l6
	xnor	%l1,	0x1B5E,	%o1
	edge16	%l0,	%i7,	%g5
	alignaddrl	%i1,	%i3,	%l4
	stw	%o3,	[%l7 + 0x7C]
	edge8n	%g7,	%o6,	%g3
	udivx	%i5,	0x1767,	%g6
	ldd	[%l7 + 0x40],	%i6
	sth	%i2,	[%l7 + 0x58]
	andncc	%l5,	%o2,	%l3
	edge8l	%o4,	%i0,	%l2
	ldsb	[%l7 + 0x7D],	%g1
	movn	%xcc,	%g4,	%o5
	mulx	%o0,	%g2,	%o7
	ldsb	[%l7 + 0x67],	%l6
	movleu	%xcc,	%i4,	%o1
	andn	%l0,	%l1,	%g5
	movrlez	%i7,	%i1,	%i3
	st	%f13,	[%l7 + 0x28]
	ldd	[%l7 + 0x20],	%f28
	sub	%o3,	%l4,	%g7
	andncc	%g3,	%i5,	%g6
	fxors	%f3,	%f26,	%f25
	ld	[%l7 + 0x48],	%f11
	ldub	[%l7 + 0x5C],	%i6
	edge8l	%i2,	%l5,	%o2
	movvc	%xcc,	%l3,	%o4
	nop
	set	0x5C, %l2
	ldsh	[%l7 + %l2],	%i0
	fmovdleu	%icc,	%f17,	%f24
	sra	%l2,	%o6,	%g4
	ldsb	[%l7 + 0x25],	%o5
	edge16	%g1,	%o0,	%g2
	srlx	%o7,	0x10,	%l6
	save %o1, %i4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f30,	%f30
	move	%xcc,	%l0,	%g5
	edge16n	%i1,	%i3,	%i7
	movvc	%icc,	%l4,	%o3
	fxors	%f11,	%f15,	%f13
	ld	[%l7 + 0x7C],	%f30
	smul	%g3,	%i5,	%g7
	fmovrslez	%g6,	%f29,	%f18
	fcmpeq16	%f6,	%f18,	%i2
	popc	%l5,	%o2
	udivcc	%l3,	0x1944,	%i6
	lduh	[%l7 + 0x58],	%o4
	lduw	[%l7 + 0x48],	%i0
	subcc	%l2,	0x0719,	%g4
	sethi	0x12E5,	%o5
	sth	%g1,	[%l7 + 0x08]
	subcc	%o6,	%g2,	%o0
	fnor	%f26,	%f4,	%f28
	edge32	%l6,	%o7,	%o1
	sethi	0x1BDC,	%l1
	fcmpeq32	%f4,	%f30,	%l0
	lduh	[%l7 + 0x72],	%i4
	fones	%f17
	movleu	%xcc,	%i1,	%i3
	xorcc	%g5,	%l4,	%i7
	edge16ln	%o3,	%i5,	%g7
	smul	%g3,	0x1AAD,	%g6
	st	%f23,	[%l7 + 0x78]
	andcc	%i2,	0x1E3C,	%o2
	xnorcc	%l3,	%i6,	%o4
	edge8n	%i0,	%l5,	%l2
	edge8n	%g4,	%g1,	%o5
	subcc	%o6,	%g2,	%o0
	edge32l	%l6,	%o7,	%l1
	fmovsle	%xcc,	%f31,	%f19
	sdivx	%o1,	0x0E6C,	%i4
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%i1
	movcs	%icc,	%l0,	%i3
	mova	%icc,	%l4,	%g5
	fmovde	%xcc,	%f16,	%f16
	std	%f8,	[%l7 + 0x28]
	edge16n	%i7,	%i5,	%o3
	edge32	%g7,	%g3,	%g6
	ldsb	[%l7 + 0x15],	%o2
	subccc	%i2,	0x09CC,	%l3
	fxors	%f23,	%f3,	%f16
	udivcc	%i6,	0x0932,	%o4
	fnor	%f18,	%f2,	%f12
	move	%icc,	%l5,	%i0
	mulscc	%g4,	0x0620,	%g1
	fnegd	%f28,	%f28
	edge16n	%o5,	%o6,	%g2
	ldsw	[%l7 + 0x60],	%o0
	mulx	%l6,	0x0687,	%l2
	mulx	%l1,	0x07C3,	%o7
	fandnot1	%f28,	%f6,	%f16
	fmovrse	%i4,	%f9,	%f20
	fnand	%f18,	%f8,	%f6
	edge32n	%i1,	%o1,	%l0
	fmovdneg	%icc,	%f6,	%f8
	and	%i3,	0x031C,	%l4
	fmovsa	%icc,	%f17,	%f24
	lduw	[%l7 + 0x50],	%g5
	movl	%icc,	%i5,	%i7
	edge16n	%g7,	%o3,	%g3
	lduh	[%l7 + 0x5E],	%g6
	xor	%o2,	%i2,	%i6
	sth	%o4,	[%l7 + 0x7A]
	subcc	%l5,	%l3,	%g4
	ldub	[%l7 + 0x58],	%i0
	movvc	%icc,	%g1,	%o6
	movle	%xcc,	%g2,	%o0
	srl	%l6,	0x1D,	%l2
	movg	%xcc,	%o5,	%o7
	fmovsn	%icc,	%f18,	%f3
	fmovdle	%xcc,	%f8,	%f0
	xor	%l1,	%i1,	%i4
	xnor	%o1,	0x0C8C,	%l0
	nop
	set	0x20, %o3
	ldx	[%l7 + %o3],	%l4
	ld	[%l7 + 0x0C],	%f13
	alignaddr	%i3,	%g5,	%i7
	edge8	%g7,	%i5,	%o3
	fmovrdlz	%g3,	%f26,	%f30
	fcmpne16	%f24,	%f28,	%o2
	stx	%g6,	[%l7 + 0x60]
	edge32n	%i6,	%o4,	%l5
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	addccc	%i0,	%g1,	%g2
	ld	[%l7 + 0x14],	%f24
	udivx	%o0,	0x1696,	%l6
	restore %o6, %o5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l1,	0x118A,	%l2
	umulcc	%i4,	0x04EE,	%i1
	ldd	[%l7 + 0x20],	%f12
	edge32l	%o1,	%l4,	%l0
	mulscc	%g5,	%i3,	%i7
	nop
	set	0x48, %g7
	stx	%i5,	[%l7 + %g7]
	fmovdpos	%xcc,	%f15,	%f14
	fpsub16s	%f13,	%f12,	%f28
	sub	%g7,	%g3,	%o3
	fpackfix	%f8,	%f9
	sdivx	%g6,	0x0FB1,	%i6
	ldd	[%l7 + 0x08],	%o2
	movrgz	%o4,	%l5,	%g4
	movneg	%xcc,	%i2,	%i0
	sll	%l3,	0x01,	%g2
	fnegd	%f8,	%f6
	ldsb	[%l7 + 0x0F],	%o0
	orn	%l6,	0x0811,	%g1
	edge16ln	%o5,	%o6,	%l1
	nop
	set	0x10, %o7
	std	%f28,	[%l7 + %o7]
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	stw	%l2,	[%l7 + 0x38]
	fmovsge	%xcc,	%f2,	%f25
	udiv	%o1,	0x1130,	%l4
	fxors	%f23,	%f10,	%f5
	fmovdgu	%xcc,	%f2,	%f31
	fxnors	%f7,	%f23,	%f4
	lduh	[%l7 + 0x1E],	%i1
	sir	0x0959
	fmovsneg	%icc,	%f6,	%f0
	fpadd32s	%f2,	%f6,	%f20
	srl	%g5,	0x07,	%l0
	edge8n	%i3,	%i7,	%i5
	udivx	%g3,	0x05E3,	%g7
	ldsb	[%l7 + 0x25],	%o3
	orncc	%i6,	%g6,	%o4
	ldd	[%l7 + 0x10],	%o2
	edge32	%g4,	%i2,	%l5
	fmovscc	%icc,	%f30,	%f18
	array8	%l3,	%g2,	%i0
	fmovdcs	%xcc,	%f6,	%f5
	array16	%l6,	%g1,	%o5
	andcc	%o0,	%o6,	%l1
	fmovrdne	%o7,	%f30,	%f16
	nop
	set	0x3C, %o5
	lduw	[%l7 + %o5],	%i4
	fmovdg	%icc,	%f16,	%f4
	edge8ln	%o1,	%l4,	%l2
	umul	%g5,	%l0,	%i1
	edge16n	%i3,	%i7,	%i5
	edge32	%g7,	%g3,	%i6
	fmovsn	%icc,	%f29,	%f24
	fmovdleu	%icc,	%f26,	%f21
	subc	%o3,	0x0D9D,	%g6
	ldd	[%l7 + 0x78],	%o4
	fxnor	%f28,	%f6,	%f0
	fnands	%f2,	%f11,	%f21
	nop
	set	0x24, %i1
	ldub	[%l7 + %i1],	%o2
	movl	%icc,	%i2,	%l5
	fandnot2	%f30,	%f26,	%f16
	edge32l	%l3,	%g2,	%i0
	fmovrde	%g4,	%f14,	%f18
	ld	[%l7 + 0x50],	%f20
	fxnors	%f28,	%f30,	%f3
	fpackfix	%f12,	%f9
	fmul8x16al	%f31,	%f3,	%f28
	stw	%g1,	[%l7 + 0x58]
	subccc	%l6,	0x1310,	%o5
	ldsh	[%l7 + 0x1C],	%o0
	sdiv	%l1,	0x179B,	%o6
	fnands	%f23,	%f6,	%f0
	add	%i4,	%o7,	%o1
	ldsb	[%l7 + 0x3D],	%l4
	ldx	[%l7 + 0x78],	%l2
	save %l0, 0x121E, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i3,	%g5,	%i7
	fpadd32s	%f3,	%f21,	%f5
	movpos	%xcc,	%g7,	%g3
	edge32n	%i6,	%i5,	%g6
	edge32	%o4,	%o3,	%o2
	fmovsleu	%xcc,	%f10,	%f14
	movne	%icc,	%l5,	%l3
	fandnot1s	%f27,	%f10,	%f21
	movl	%icc,	%g2,	%i2
	movcc	%icc,	%i0,	%g1
	edge16l	%g4,	%o5,	%o0
	movrne	%l1,	0x229,	%o6
	fmovsg	%xcc,	%f16,	%f0
	mulx	%i4,	0x1B66,	%l6
	ld	[%l7 + 0x6C],	%f24
	movrlez	%o1,	0x147,	%o7
	fandnot2	%f0,	%f30,	%f6
	movl	%xcc,	%l4,	%l0
	ldd	[%l7 + 0x48],	%i0
	movrlz	%i3,	%l2,	%g5
	orncc	%i7,	%g7,	%g3
	movvc	%icc,	%i6,	%i5
	lduw	[%l7 + 0x24],	%g6
	fmovrslez	%o3,	%f0,	%f18
	subcc	%o4,	0x0B6C,	%o2
	mulx	%l3,	0x1D95,	%l5
	srax	%i2,	0x1E,	%g2
	edge8ln	%g1,	%g4,	%i0
	fmovdpos	%icc,	%f14,	%f8
	fmovsa	%xcc,	%f25,	%f8
	movge	%xcc,	%o5,	%o0
	add	%l1,	%o6,	%l6
	edge8n	%o1,	%o7,	%i4
	movl	%xcc,	%l0,	%i1
	xorcc	%i3,	0x15E5,	%l4
	umulcc	%l2,	%g5,	%g7
	andcc	%i7,	0x17F3,	%g3
	andn	%i6,	%i5,	%g6
	fmovd	%f12,	%f8
	movre	%o4,	%o3,	%o2
	edge8ln	%l5,	%i2,	%g2
	for	%f18,	%f18,	%f10
	fcmple16	%f16,	%f8,	%g1
	movneg	%icc,	%g4,	%i0
	movrlz	%l3,	%o0,	%l1
	ldx	[%l7 + 0x58],	%o6
	fpadd32s	%f3,	%f16,	%f21
	subccc	%l6,	0x003B,	%o1
	movrne	%o5,	%o7,	%l0
	xnorcc	%i4,	0x1516,	%i1
	save %i3, %l2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%g7,	%l4
	sdivx	%i7,	0x06E9,	%g3
	srax	%i6,	0x0B,	%i5
	ldd	[%l7 + 0x70],	%f8
	orn	%g6,	0x0001,	%o3
	orcc	%o2,	%o4,	%i2
	mulx	%l5,	0x114C,	%g2
	fnot2	%f4,	%f12
	subcc	%g1,	0x1CE9,	%i0
	umulcc	%l3,	%g4,	%o0
	fmovsg	%xcc,	%f15,	%f27
	fmovda	%icc,	%f6,	%f21
	std	%f26,	[%l7 + 0x10]
	smul	%l1,	%o6,	%l6
	edge16l	%o1,	%o7,	%l0
	mova	%icc,	%o5,	%i1
	srax	%i4,	%i3,	%l2
	fpack16	%f22,	%f22
	fmovdgu	%xcc,	%f29,	%f21
	orcc	%g5,	0x0A3D,	%g7
	subccc	%i7,	0x0DA2,	%g3
	and	%i6,	0x10DD,	%i5
	ldub	[%l7 + 0x0A],	%l4
	edge8n	%g6,	%o3,	%o2
	alignaddr	%i2,	%l5,	%g2
	edge32n	%o4,	%i0,	%g1
	lduh	[%l7 + 0x62],	%l3
	movle	%icc,	%g4,	%l1
	movvc	%xcc,	%o0,	%l6
	std	%f22,	[%l7 + 0x40]
	edge32n	%o6,	%o1,	%l0
	and	%o5,	0x0E31,	%o7
	srax	%i4,	%i1,	%i3
	movrne	%l2,	0x155,	%g7
	xor	%g5,	%i7,	%g3
	popc	%i6,	%l4
	movre	%g6,	0x0BD,	%o3
	sllx	%o2,	0x10,	%i2
	std	%f30,	[%l7 + 0x20]
	movrne	%i5,	%l5,	%o4
	subc	%g2,	0x180F,	%g1
	sdiv	%i0,	0x1E2C,	%g4
	edge8l	%l1,	%l3,	%o0
	ldd	[%l7 + 0x68],	%o6
	srl	%l6,	0x15,	%l0
	srax	%o5,	0x09,	%o7
	smul	%o1,	0x06E5,	%i4
	srlx	%i3,	0x18,	%l2
	fornot1	%f8,	%f20,	%f16
	mulx	%g7,	0x056B,	%g5
	fmovdgu	%icc,	%f13,	%f23
	movpos	%icc,	%i1,	%i7
	fmovdneg	%icc,	%f15,	%f22
	smul	%i6,	%l4,	%g6
	ldsb	[%l7 + 0x76],	%g3
	addc	%o3,	0x0D4E,	%o2
	restore %i5, 0x033E, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o4,	%i2,	%g1
	edge32	%i0,	%g4,	%g2
	fcmpgt16	%f12,	%f30,	%l1
	movvc	%icc,	%l3,	%o6
	addcc	%l6,	%l0,	%o0
	edge16	%o7,	%o1,	%i4
	movle	%icc,	%o5,	%l2
	movne	%xcc,	%i3,	%g5
	mulscc	%i1,	%i7,	%g7
	fornot2s	%f10,	%f11,	%f18
	fnor	%f30,	%f2,	%f10
	edge32	%l4,	%i6,	%g6
	siam	0x1
	ldub	[%l7 + 0x20],	%g3
	movrne	%o2,	%i5,	%l5
	xnorcc	%o4,	%o3,	%i2
	fornot1	%f30,	%f8,	%f6
	save %i0, %g4, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l1,	%l3,	%g2
	fnot2	%f28,	%f4
	fmul8sux16	%f8,	%f12,	%f0
	orn	%l6,	%o6,	%o0
	movneg	%xcc,	%l0,	%o7
	movrgz	%i4,	%o5,	%l2
	ldsh	[%l7 + 0x3E],	%o1
	edge8n	%g5,	%i3,	%i1
	fpsub16	%f0,	%f18,	%f16
	movpos	%icc,	%g7,	%i7
	array8	%i6,	%g6,	%g3
	fmovscs	%xcc,	%f3,	%f21
	fmovdcs	%icc,	%f30,	%f20
	movge	%icc,	%o2,	%i5
	fmul8x16	%f26,	%f2,	%f28
	xnor	%l5,	%l4,	%o4
	fmuld8ulx16	%f11,	%f17,	%f10
	fmovdleu	%icc,	%f1,	%f8
	fmovsne	%icc,	%f1,	%f9
	movneg	%xcc,	%i2,	%o3
	or	%i0,	0x1AE3,	%g1
	subccc	%l1,	%g4,	%g2
	orcc	%l6,	0x16D7,	%l3
	popc	%o0,	%o6
	movle	%icc,	%l0,	%i4
	udivcc	%o5,	0x0ABF,	%l2
	std	%f2,	[%l7 + 0x18]
	movl	%icc,	%o1,	%o7
	addccc	%i3,	%i1,	%g5
	mulx	%i7,	0x1DD6,	%g7
	andcc	%i6,	%g6,	%o2
	move	%xcc,	%g3,	%l5
	and	%i5,	0x0444,	%o4
	movrlez	%i2,	0x3D7,	%o3
	movvc	%icc,	%l4,	%g1
	movpos	%xcc,	%l1,	%g4
	xor	%g2,	0x0F38,	%i0
	movge	%icc,	%l6,	%l3
	fnor	%f26,	%f14,	%f10
	movl	%icc,	%o6,	%o0
	stb	%l0,	[%l7 + 0x4D]
	mulscc	%i4,	%l2,	%o1
	edge16l	%o5,	%i3,	%i1
	fpsub32	%f6,	%f2,	%f10
	sethi	0x0A22,	%g5
	fmovdg	%xcc,	%f2,	%f20
	fmovsg	%icc,	%f7,	%f11
	andn	%o7,	%i7,	%i6
	nop
	set	0x18, %i2
	std	%f4,	[%l7 + %i2]
	add	%g7,	0x155C,	%g6
	smul	%g3,	0x1262,	%o2
	edge8n	%l5,	%i5,	%o4
	movg	%icc,	%i2,	%o3
	addc	%l4,	0x07A6,	%g1
	srl	%g4,	%g2,	%l1
	sdiv	%l6,	0x1551,	%i0
	ldub	[%l7 + 0x41],	%o6
	fmovdvs	%xcc,	%f28,	%f2
	movleu	%icc,	%o0,	%l3
	srlx	%i4,	%l2,	%o1
	sllx	%o5,	0x1B,	%l0
	ldx	[%l7 + 0x58],	%i3
	srlx	%g5,	%i1,	%o7
	fmovs	%f2,	%f25
	fornot2	%f18,	%f2,	%f0
	movre	%i6,	0x211,	%g7
	addccc	%g6,	%i7,	%o2
	and	%l5,	0x012D,	%g3
	edge32ln	%i5,	%o4,	%i2
	sdivx	%l4,	0x077F,	%g1
	sra	%o3,	%g2,	%l1
	subccc	%l6,	0x0511,	%g4
	udivcc	%i0,	0x1734,	%o0
	edge32	%o6,	%i4,	%l3
	movge	%xcc,	%o1,	%l2
	array16	%o5,	%l0,	%g5
	sir	0x03A0
	fornot2s	%f6,	%f22,	%f3
	subccc	%i3,	%o7,	%i1
	edge8n	%i6,	%g7,	%i7
	fcmple32	%f18,	%f14,	%o2
	edge16ln	%l5,	%g3,	%i5
	fmovdge	%xcc,	%f31,	%f16
	movg	%icc,	%g6,	%o4
	fpadd16s	%f9,	%f24,	%f22
	srax	%i2,	%g1,	%o3
	movneg	%icc,	%g2,	%l4
	subcc	%l1,	%g4,	%i0
	alignaddr	%o0,	%l6,	%o6
	ldsb	[%l7 + 0x1B],	%i4
	movvc	%icc,	%o1,	%l2
	move	%xcc,	%o5,	%l0
	sethi	0x08F0,	%l3
	fmovdle	%icc,	%f19,	%f0
	fors	%f11,	%f8,	%f25
	array32	%i3,	%g5,	%o7
	srlx	%i1,	%g7,	%i6
	array32	%o2,	%l5,	%i7
	fcmpne16	%f0,	%f8,	%g3
	mulx	%g6,	0x189C,	%i5
	sdiv	%i2,	0x1F5E,	%g1
	movgu	%xcc,	%o4,	%o3
	movrlz	%l4,	0x321,	%l1
	xnorcc	%g4,	0x180A,	%g2
	movle	%icc,	%i0,	%l6
	andn	%o6,	%o0,	%i4
	ldd	[%l7 + 0x70],	%f0
	fsrc1s	%f16,	%f9
	fcmpeq32	%f20,	%f20,	%l2
	save %o5, %o1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f11,	%f15,	%f16
	fpack16	%f22,	%f4
	fnot1	%f10,	%f26
	movle	%xcc,	%l3,	%i3
	andncc	%o7,	%i1,	%g7
	edge16	%i6,	%g5,	%o2
	fmovsn	%icc,	%f12,	%f5
	xor	%l5,	0x0DE2,	%g3
	sdiv	%g6,	0x0FCF,	%i7
	edge32l	%i2,	%g1,	%i5
	edge32n	%o3,	%o4,	%l1
	pdist	%f14,	%f30,	%f24
	xnor	%l4,	%g2,	%i0
	edge16l	%g4,	%o6,	%o0
	array32	%l6,	%l2,	%i4
	movle	%xcc,	%o5,	%o1
	fmul8x16al	%f3,	%f11,	%f24
	ldx	[%l7 + 0x28],	%l3
	movleu	%icc,	%l0,	%o7
	fmul8x16al	%f31,	%f20,	%f24
	smul	%i3,	0x1787,	%g7
	edge32l	%i6,	%g5,	%i1
	udivx	%o2,	0x1071,	%l5
	movvs	%xcc,	%g3,	%i7
	movrlez	%i2,	%g1,	%g6
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	movpos	%xcc,	%l1,	%o3
	fnegd	%f4,	%f8
	movpos	%icc,	%l4,	%i0
	stw	%g2,	[%l7 + 0x48]
	orn	%g4,	0x1EAB,	%o6
	edge8l	%o0,	%l2,	%i4
	fcmple16	%f8,	%f28,	%o5
	edge8n	%o1,	%l3,	%l0
	fmul8ulx16	%f22,	%f4,	%f20
	movre	%l6,	%o7,	%i3
	sth	%i6,	[%l7 + 0x5A]
	sdiv	%g5,	0x18FE,	%g7
	fmovda	%xcc,	%f3,	%f0
	sdivx	%i1,	0x1250,	%o2
	mulscc	%l5,	%i7,	%i2
	movrgz	%g3,	%g6,	%g1
	fmovsle	%icc,	%f29,	%f0
	edge32ln	%i5,	%o4,	%l1
	alignaddr	%o3,	%i0,	%g2
	andncc	%g4,	%o6,	%l4
	move	%xcc,	%o0,	%l2
	fcmpgt32	%f20,	%f10,	%i4
	movn	%xcc,	%o1,	%o5
	alignaddrl	%l0,	%l6,	%o7
	subcc	%l3,	0x10ED,	%i6
	subcc	%g5,	%i3,	%i1
	edge16ln	%g7,	%o2,	%i7
	andncc	%l5,	%g3,	%i2
	fmovsle	%xcc,	%f28,	%f24
	sllx	%g6,	0x10,	%i5
	faligndata	%f2,	%f16,	%f18
	fabsd	%f0,	%f24
	fexpand	%f23,	%f14
	nop
	set	0x28, %g5
	lduw	[%l7 + %g5],	%g1
	sllx	%o4,	0x1A,	%o3
	udiv	%l1,	0x1FB0,	%g2
	fmovsleu	%xcc,	%f27,	%f23
	subc	%i0,	0x16E9,	%o6
	movvc	%xcc,	%g4,	%o0
	movrgez	%l2,	0x29B,	%l4
	movl	%icc,	%i4,	%o1
	movgu	%icc,	%o5,	%l0
	fmovse	%xcc,	%f18,	%f25
	movcs	%xcc,	%l6,	%l3
	andncc	%i6,	%g5,	%i3
	mulx	%i1,	0x0ADE,	%o7
	edge16ln	%o2,	%i7,	%l5
	array16	%g3,	%i2,	%g6
	movl	%icc,	%g7,	%g1
	movrlz	%i5,	0x226,	%o3
	movvs	%xcc,	%o4,	%g2
	addcc	%l1,	0x0DC0,	%i0
	sra	%o6,	%g4,	%o0
	udiv	%l4,	0x0A94,	%i4
	fpadd16	%f16,	%f6,	%f6
	movrlez	%o1,	0x3D4,	%o5
	xor	%l0,	%l6,	%l3
	array8	%l2,	%i6,	%i3
	subc	%i1,	%g5,	%o2
	sir	0x00B4
	movrgez	%i7,	0x163,	%l5
	movrgez	%o7,	%i2,	%g6
	std	%f22,	[%l7 + 0x40]
	mova	%xcc,	%g7,	%g1
	or	%i5,	0x13C5,	%o3
	srax	%g3,	0x18,	%o4
	movneg	%xcc,	%g2,	%i0
	ldub	[%l7 + 0x47],	%o6
	ldub	[%l7 + 0x7A],	%g4
	edge8n	%o0,	%l4,	%i4
	stw	%o1,	[%l7 + 0x0C]
	fmovda	%icc,	%f24,	%f7
	edge16l	%l1,	%l0,	%o5
	sethi	0x17E9,	%l3
	edge8	%l2,	%l6,	%i6
	subcc	%i3,	%g5,	%i1
	fand	%f30,	%f28,	%f18
	edge32	%o2,	%l5,	%o7
	edge32l	%i2,	%g6,	%g7
	edge16l	%i7,	%i5,	%o3
	fcmple16	%f16,	%f16,	%g1
	array16	%o4,	%g2,	%g3
	fpack16	%f22,	%f17
	sir	0x0C49
	fpsub16s	%f13,	%f18,	%f5
	movrgz	%i0,	%o6,	%g4
	fsrc1s	%f13,	%f25
	fmovdvc	%icc,	%f3,	%f31
	fmuld8sux16	%f27,	%f25,	%f12
	ldd	[%l7 + 0x30],	%f12
	srlx	%o0,	0x18,	%i4
	ldd	[%l7 + 0x60],	%f4
	edge16l	%o1,	%l1,	%l0
	array32	%l4,	%l3,	%o5
	fmovdne	%xcc,	%f15,	%f21
	movvs	%xcc,	%l2,	%i6
	edge16	%l6,	%i3,	%i1
	alignaddrl	%o2,	%g5,	%o7
	edge8	%i2,	%l5,	%g7
	addccc	%i7,	%g6,	%i5
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%f20
	movge	%xcc,	%g1,	%o4
	sethi	0x1B68,	%g2
	fabsd	%f10,	%f14
	sra	%g3,	0x1C,	%o3
	fmovrse	%o6,	%f15,	%f12
	movrne	%i0,	0x2B6,	%o0
	fornot2s	%f4,	%f16,	%f22
	fmul8ulx16	%f26,	%f20,	%f30
	movpos	%icc,	%i4,	%g4
	edge32l	%o1,	%l0,	%l1
	fsrc2s	%f10,	%f30
	addcc	%l3,	0x0EB3,	%o5
	sethi	0x096A,	%l2
	st	%f8,	[%l7 + 0x30]
	save %l4, %l6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i6,	%o2,	%i1
	fpackfix	%f26,	%f26
	movre	%g5,	0x18D,	%o7
	movgu	%xcc,	%i2,	%g7
	ldx	[%l7 + 0x20],	%i7
	movge	%xcc,	%g6,	%l5
	fmul8x16al	%f20,	%f20,	%f26
	udivcc	%g1,	0x0206,	%o4
	edge8	%i5,	%g3,	%g2
	fones	%f12
	orncc	%o6,	0x02F9,	%i0
	mulscc	%o3,	%o0,	%g4
	addccc	%i4,	%l0,	%o1
	std	%f30,	[%l7 + 0x58]
	subccc	%l1,	0x1E39,	%l3
	udivcc	%l2,	0x0D72,	%l4
	lduh	[%l7 + 0x28],	%o5
	umul	%l6,	%i6,	%o2
	ldsw	[%l7 + 0x38],	%i1
	nop
	set	0x2A, %g1
	ldub	[%l7 + %g1],	%i3
	stb	%o7,	[%l7 + 0x5D]
	movge	%xcc,	%i2,	%g7
	fpsub32	%f12,	%f22,	%f2
	addcc	%i7,	%g6,	%g5
	fmovd	%f28,	%f2
	movvc	%xcc,	%l5,	%o4
	movcs	%xcc,	%i5,	%g3
	lduh	[%l7 + 0x16],	%g1
	srax	%g2,	0x1D,	%o6
	sra	%o3,	0x1D,	%o0
	edge8n	%g4,	%i0,	%l0
	movvs	%xcc,	%i4,	%o1
	andncc	%l3,	%l2,	%l1
	ldd	[%l7 + 0x40],	%l4
	sllx	%l6,	%o5,	%o2
	fmovscc	%icc,	%f31,	%f2
	ld	[%l7 + 0x08],	%f5
	subccc	%i1,	%i6,	%i3
	nop
	set	0x77, %i3
	ldub	[%l7 + %i3],	%o7
	movneg	%icc,	%i2,	%g7
	nop
	set	0x28, %g3
	ldx	[%l7 + %g3],	%i7
	ldsh	[%l7 + 0x52],	%g5
	sth	%l5,	[%l7 + 0x0E]
	fcmple16	%f10,	%f24,	%g6
	ld	[%l7 + 0x40],	%f11
	fmovdneg	%xcc,	%f20,	%f20
	fmovrslz	%i5,	%f31,	%f10
	ldsb	[%l7 + 0x70],	%o4
	movcc	%icc,	%g1,	%g2
	fcmpgt16	%f0,	%f20,	%g3
	mulx	%o3,	%o0,	%o6
	lduw	[%l7 + 0x58],	%i0
	movgu	%icc,	%g4,	%i4
	fmovrdne	%l0,	%f16,	%f0
	alignaddrl	%o1,	%l3,	%l1
	sub	%l4,	%l6,	%l2
	movneg	%icc,	%o2,	%i1
	fors	%f18,	%f27,	%f17
	nop
	set	0x6C, %o1
	lduw	[%l7 + %o1],	%o5
	orcc	%i3,	0x164D,	%i6
	movrgez	%o7,	0x15A,	%i2
	array16	%g7,	%i7,	%l5
	movleu	%icc,	%g5,	%g6
	stw	%o4,	[%l7 + 0x4C]
	sdiv	%i5,	0x1462,	%g2
	srlx	%g1,	0x01,	%g3
	fmovdg	%xcc,	%f13,	%f9
	umul	%o3,	0x0721,	%o6
	edge8	%i0,	%g4,	%i4
	lduh	[%l7 + 0x1A],	%l0
	sdivx	%o0,	0x0170,	%l3
	udivx	%o1,	0x1E32,	%l1
	edge32l	%l4,	%l6,	%o2
	ldsw	[%l7 + 0x6C],	%l2
	fexpand	%f3,	%f2
	lduh	[%l7 + 0x3E],	%o5
	fmovrde	%i1,	%f24,	%f14
	andn	%i6,	%o7,	%i3
	orcc	%i2,	%g7,	%i7
	orncc	%g5,	%g6,	%l5
	movvs	%xcc,	%o4,	%g2
	movrlez	%g1,	0x076,	%g3
	edge8ln	%o3,	%i5,	%o6
	movne	%xcc,	%i0,	%i4
	sth	%g4,	[%l7 + 0x38]
	edge16n	%o0,	%l3,	%l0
	movgu	%icc,	%o1,	%l4
	restore %l6, %o2, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o5,	%i1,	%l1
	movg	%icc,	%o7,	%i6
	ldd	[%l7 + 0x50],	%i2
	movvc	%icc,	%i3,	%g7
	add	%g5,	%i7,	%l5
	fmovrsgez	%g6,	%f29,	%f22
	fmovdge	%icc,	%f21,	%f21
	save %g2, 0x0B4B, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g3,	%o4,	%i5
	movrlz	%o6,	%o3,	%i4
	mova	%xcc,	%g4,	%i0
	addcc	%l3,	%o0,	%l0
	fcmpes	%fcc0,	%f12,	%f31
	fpadd16	%f16,	%f22,	%f18
	xnorcc	%l4,	0x1F62,	%o1
	array32	%o2,	%l2,	%o5
	edge16n	%i1,	%l1,	%o7
	lduh	[%l7 + 0x60],	%l6
	fcmpeq16	%f2,	%f24,	%i2
	fcmpgt16	%f22,	%f4,	%i6
	lduh	[%l7 + 0x1E],	%g7
	umulcc	%g5,	0x1601,	%i7
	fcmpgt32	%f14,	%f0,	%i3
	fmovsvs	%xcc,	%f24,	%f4
	orncc	%g6,	%g2,	%l5
	xorcc	%g3,	%g1,	%o4
	fmovdvc	%xcc,	%f19,	%f4
	sdiv	%i5,	0x08D8,	%o6
	edge16n	%o3,	%i4,	%i0
	movle	%xcc,	%g4,	%o0
	fands	%f29,	%f28,	%f28
	movrne	%l0,	%l4,	%o1
	move	%xcc,	%o2,	%l2
	ldx	[%l7 + 0x08],	%l3
	fnor	%f22,	%f0,	%f12
	subcc	%o5,	0x1B73,	%i1
	andn	%o7,	%l1,	%i2
	lduh	[%l7 + 0x74],	%l6
	movcc	%xcc,	%g7,	%g5
	fabss	%f25,	%f16
	edge32ln	%i7,	%i3,	%i6
	fmovrdlz	%g6,	%f30,	%f18
	orcc	%l5,	0x08DA,	%g2
	edge32l	%g3,	%g1,	%i5
	orn	%o6,	0x13E9,	%o4
	lduw	[%l7 + 0x60],	%i4
	stx	%i0,	[%l7 + 0x18]
	subc	%o3,	0x0010,	%g4
	array8	%l0,	%l4,	%o1
	sllx	%o0,	0x07,	%l2
	sth	%l3,	[%l7 + 0x32]
	srl	%o5,	%o2,	%o7
	movrgez	%i1,	0x186,	%i2
	movleu	%xcc,	%l6,	%g7
	orncc	%l1,	0x158A,	%g5
	movleu	%icc,	%i7,	%i3
	sub	%g6,	0x0827,	%l5
	sdivx	%i6,	0x0C74,	%g3
	edge16n	%g2,	%i5,	%g1
	nop
	set	0x30, %i7
	stx	%o4,	[%l7 + %i7]
	umul	%i4,	%i0,	%o6
	stw	%g4,	[%l7 + 0x30]
	sdiv	%o3,	0x0DBC,	%l4
	movleu	%icc,	%l0,	%o0
	movleu	%icc,	%o1,	%l2
	movcs	%icc,	%o5,	%o2
	fmovrdlz	%l3,	%f12,	%f18
	ldub	[%l7 + 0x74],	%o7
	fmovse	%icc,	%f24,	%f5
	save %i1, 0x0DD7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g7, %l1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f18,	%f22,	%f30
	ld	[%l7 + 0x40],	%f0
	stw	%l6,	[%l7 + 0x60]
	array8	%i3,	%g6,	%l5
	array8	%i6,	%g3,	%g2
	edge32n	%i5,	%i7,	%g1
	srax	%i4,	0x11,	%i0
	fzero	%f24
	fabsd	%f16,	%f30
	sub	%o6,	0x1927,	%o4
	fmovrdlez	%o3,	%f20,	%f20
	movg	%icc,	%l4,	%l0
	ld	[%l7 + 0x5C],	%f29
	fmovrde	%g4,	%f4,	%f16
	xnorcc	%o1,	%l2,	%o0
	andn	%o2,	0x1F0F,	%l3
	orncc	%o5,	%o7,	%i1
	movvs	%xcc,	%g7,	%l1
	fands	%f27,	%f26,	%f20
	movgu	%xcc,	%i2,	%l6
	sethi	0x18C1,	%i3
	fpadd32	%f18,	%f2,	%f16
	fcmple32	%f10,	%f6,	%g5
	andcc	%g6,	%l5,	%g3
	movcc	%xcc,	%g2,	%i5
	xnorcc	%i7,	0x19C9,	%g1
	edge32n	%i4,	%i0,	%i6
	movneg	%xcc,	%o6,	%o3
	ldub	[%l7 + 0x53],	%o4
	fornot1	%f4,	%f0,	%f14
	sll	%l4,	%l0,	%o1
	addcc	%l2,	%g4,	%o2
	umulcc	%o0,	0x0BD3,	%l3
	sdivcc	%o7,	0x1623,	%i1
	array32	%g7,	%l1,	%i2
	subc	%o5,	0x081C,	%l6
	fmovdne	%xcc,	%f18,	%f2
	movpos	%xcc,	%g5,	%i3
	movrne	%l5,	0x13F,	%g6
	movrlz	%g2,	0x105,	%i5
	srax	%g3,	0x09,	%i7
	edge16ln	%i4,	%i0,	%g1
	mova	%icc,	%o6,	%i6
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	andn	%l0,	0x159C,	%o3
	lduw	[%l7 + 0x50],	%l2
	fcmpne16	%f4,	%f12,	%o1
	movrlez	%g4,	0x126,	%o0
	pdist	%f22,	%f2,	%f8
	orncc	%l3,	%o7,	%o2
	ldsw	[%l7 + 0x08],	%i1
	movrgz	%g7,	0x374,	%l1
	fmuld8ulx16	%f30,	%f15,	%f6
	orn	%o5,	%l6,	%i2
	fmovdl	%icc,	%f11,	%f25
	nop
	set	0x70, %l5
	stw	%g5,	[%l7 + %l5]
	andncc	%l5,	%g6,	%i3
	umulcc	%i5,	%g3,	%g2
	edge16	%i7,	%i0,	%i4
	std	%f24,	[%l7 + 0x78]
	fmovsne	%xcc,	%f19,	%f23
	xor	%o6,	%g1,	%o4
	fmovsleu	%icc,	%f30,	%f28
	sra	%i6,	0x1B,	%l4
	edge8n	%l0,	%l2,	%o3
	array16	%o1,	%g4,	%o0
	sdiv	%l3,	0x17FC,	%o2
	ldsw	[%l7 + 0x58],	%o7
	sir	0x0DEC
	xorcc	%i1,	%g7,	%l1
	edge16ln	%l6,	%o5,	%g5
	move	%xcc,	%i2,	%l5
	edge16l	%i3,	%i5,	%g6
	movrne	%g3,	0x062,	%g2
	fmovsleu	%xcc,	%f29,	%f26
	edge32	%i7,	%i4,	%o6
	udivcc	%g1,	0x1630,	%o4
	alignaddrl	%i0,	%i6,	%l4
	edge32n	%l0,	%o3,	%l2
	edge8ln	%g4,	%o0,	%l3
	for	%f24,	%f4,	%f12
	edge8	%o2,	%o1,	%i1
	smulcc	%o7,	%g7,	%l1
	fmovsvc	%xcc,	%f5,	%f17
	nop
	set	0x40, %o4
	ldd	[%l7 + %o4],	%o4
	fmuld8sux16	%f24,	%f31,	%f2
	st	%f20,	[%l7 + 0x5C]
	subccc	%g5,	%l6,	%l5
	lduh	[%l7 + 0x5E],	%i3
	sdivcc	%i2,	0x1DC2,	%i5
	array16	%g6,	%g2,	%i7
	ldd	[%l7 + 0x30],	%g2
	fpackfix	%f28,	%f14
	save %i4, 0x0AD1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g1,	0x07,	%o4
	sra	%i6,	%i0,	%l0
	udiv	%o3,	0x1E96,	%l2
	movre	%l4,	%g4,	%o0
	subcc	%l3,	%o2,	%i1
	ldsw	[%l7 + 0x10],	%o1
	fmovrdlz	%g7,	%f0,	%f24
	fmovspos	%xcc,	%f9,	%f23
	edge16l	%o7,	%l1,	%g5
	edge32	%l6,	%l5,	%o5
	movgu	%xcc,	%i3,	%i5
	nop
	set	0x40, %l3
	ldsw	[%l7 + %l3],	%g6
	movgu	%xcc,	%i2,	%i7
	lduw	[%l7 + 0x1C],	%g3
	andn	%i4,	%o6,	%g1
	edge32ln	%g2,	%i6,	%o4
	nop
	set	0x28, %l1
	ldx	[%l7 + %l1],	%i0
	sth	%o3,	[%l7 + 0x68]
	orncc	%l2,	%l0,	%l4
	ldd	[%l7 + 0x40],	%f28
	udivcc	%g4,	0x0C61,	%l3
	mova	%xcc,	%o2,	%i1
	fmovrdne	%o1,	%f24,	%f16
	edge8	%g7,	%o7,	%l1
	std	%f2,	[%l7 + 0x58]
	sdivx	%o0,	0x0DA1,	%l6
	array8	%g5,	%l5,	%i3
	andn	%i5,	0x031F,	%g6
	fpsub32	%f2,	%f28,	%f14
	nop
	set	0x70, %l6
	lduw	[%l7 + %l6],	%i2
	udivx	%o5,	0x0C4B,	%i7
	xor	%i4,	0x0F64,	%g3
	movpos	%icc,	%o6,	%g2
	xnorcc	%i6,	%g1,	%o4
	fpadd16s	%f10,	%f0,	%f0
	array32	%o3,	%i0,	%l0
	movrlez	%l2,	0x223,	%l4
	sdivx	%g4,	0x1521,	%o2
	move	%xcc,	%i1,	%l3
	st	%f16,	[%l7 + 0x2C]
	xorcc	%g7,	%o1,	%l1
	fmovrdne	%o0,	%f16,	%f26
	xnorcc	%l6,	%g5,	%o7
	fxnors	%f7,	%f18,	%f11
	andcc	%l5,	%i5,	%g6
	fmovse	%xcc,	%f26,	%f20
	fmovsle	%icc,	%f17,	%f20
	mova	%icc,	%i2,	%o5
	udivcc	%i7,	0x0785,	%i4
	restore %i3, 0x1B82, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x07CB,	%g2
	movrne	%i6,	%g1,	%g3
	add	%o3,	%i0,	%o4
	orn	%l2,	%l0,	%g4
	ldsh	[%l7 + 0x76],	%o2
	std	%f20,	[%l7 + 0x68]
	subcc	%i1,	0x0133,	%l3
	srlx	%g7,	0x14,	%l4
	movne	%xcc,	%o1,	%o0
	andn	%l1,	%g5,	%o7
	ldsw	[%l7 + 0x78],	%l6
	sethi	0x1CC6,	%l5
	array16	%g6,	%i2,	%o5
	ld	[%l7 + 0x24],	%f19
	sub	%i5,	0x1EAA,	%i4
	add	%i7,	%o6,	%g2
	movne	%xcc,	%i3,	%i6
	movcc	%xcc,	%g1,	%g3
	stw	%i0,	[%l7 + 0x34]
	array8	%o3,	%l2,	%o4
	fsrc1s	%f13,	%f22
	movvc	%xcc,	%l0,	%g4
	edge16ln	%o2,	%i1,	%l3
	fmovsvc	%xcc,	%f8,	%f0
	fmovsleu	%xcc,	%f12,	%f23
	movre	%g7,	%o1,	%l4
	sra	%o0,	%l1,	%o7
	movgu	%icc,	%l6,	%l5
	movgu	%icc,	%g5,	%g6
	edge16n	%i2,	%i5,	%i4
	srlx	%o5,	%i7,	%g2
	ldsh	[%l7 + 0x7C],	%i3
	stx	%i6,	[%l7 + 0x48]
	mova	%icc,	%o6,	%g1
	mulscc	%g3,	0x0F67,	%i0
	movgu	%xcc,	%l2,	%o3
	ld	[%l7 + 0x68],	%f11
	fnands	%f13,	%f15,	%f6
	sll	%l0,	0x10,	%g4
	fmovdvc	%icc,	%f20,	%f17
	movrlez	%o4,	0x1A1,	%o2
	sll	%l3,	%g7,	%o1
	add	%i1,	%o0,	%l4
	movcs	%icc,	%o7,	%l6
	addc	%l1,	%l5,	%g5
	fmovs	%f15,	%f14
	orn	%g6,	%i2,	%i4
	fands	%f16,	%f29,	%f5
	nop
	set	0x7A, %o0
	ldsh	[%l7 + %o0],	%o5
	fand	%f8,	%f20,	%f24
	popc	0x01CD,	%i5
	orncc	%g2,	0x089B,	%i7
	save %i3, 0x1617, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g1,	%o6,	%i0
	std	%f24,	[%l7 + 0x38]
	edge8l	%g3,	%l2,	%l0
	movvs	%icc,	%o3,	%o4
	fpadd16	%f22,	%f2,	%f28
	movvs	%xcc,	%o2,	%g4
	stx	%g7,	[%l7 + 0x70]
	fmovscc	%xcc,	%f11,	%f8
	fmul8ulx16	%f10,	%f20,	%f14
	array32	%l3,	%o1,	%i1
	fmovrdne	%o0,	%f2,	%f10
	edge32ln	%l4,	%o7,	%l1
	movcs	%xcc,	%l5,	%g5
	fpsub32s	%f25,	%f25,	%f18
	edge16	%g6,	%l6,	%i2
	movrlez	%i4,	%o5,	%g2
	fmovrsgez	%i5,	%f16,	%f30
	movgu	%icc,	%i3,	%i6
	or	%g1,	%i7,	%o6
	ldub	[%l7 + 0x79],	%i0
	orcc	%l2,	%g3,	%l0
	andcc	%o4,	%o3,	%g4
	movcc	%icc,	%o2,	%g7
	fpadd32s	%f26,	%f8,	%f7
	fmovdcs	%icc,	%f12,	%f26
	stw	%o1,	[%l7 + 0x28]
	mulscc	%i1,	0x1E69,	%l3
	srl	%o0,	0x10,	%o7
	edge32ln	%l1,	%l4,	%l5
	faligndata	%f12,	%f18,	%f18
	edge32ln	%g5,	%l6,	%i2
	fcmped	%fcc2,	%f18,	%f4
	sir	0x0D34
	movne	%icc,	%i4,	%o5
	fmovdl	%xcc,	%f3,	%f3
	sir	0x1BF4
	movvs	%xcc,	%g2,	%g6
	movl	%xcc,	%i3,	%i5
	and	%g1,	0x1F66,	%i7
	fmovrse	%o6,	%f25,	%f14
	xor	%i6,	%l2,	%g3
	alignaddrl	%l0,	%o4,	%o3
	ldd	[%l7 + 0x28],	%g4
	movre	%i0,	%o2,	%o1
	and	%g7,	0x0582,	%l3
	fmovde	%icc,	%f20,	%f27
	addcc	%o0,	0x1CF1,	%o7
	add	%l1,	%l4,	%l5
	ld	[%l7 + 0x1C],	%f14
	sdivx	%i1,	0x0EE6,	%l6
	st	%f30,	[%l7 + 0x58]
	ldub	[%l7 + 0x5A],	%i2
	popc	0x14FD,	%i4
	udivcc	%g5,	0x0B35,	%o5
	movrne	%g2,	%g6,	%i3
	fmul8sux16	%f24,	%f14,	%f26
	movrlz	%i5,	0x3FE,	%g1
	fmovsleu	%icc,	%f29,	%f7
	fmovda	%xcc,	%f3,	%f16
	popc	%o6,	%i6
	ldsh	[%l7 + 0x0C],	%i7
	fmuld8ulx16	%f25,	%f18,	%f26
	subc	%g3,	%l0,	%l2
	move	%icc,	%o3,	%o4
	alignaddr	%i0,	%g4,	%o1
	andn	%g7,	%o2,	%l3
	or	%o7,	0x149B,	%l1
	edge8	%l4,	%o0,	%i1
	sdivcc	%l5,	0x072B,	%l6
	edge32ln	%i2,	%g5,	%i4
	fzeros	%f9
	alignaddr	%o5,	%g2,	%g6
	std	%f24,	[%l7 + 0x20]
	movre	%i3,	0x07E,	%g1
	subcc	%i5,	%i6,	%i7
	fmovdcc	%xcc,	%f20,	%f31
	sth	%g3,	[%l7 + 0x0A]
	movg	%xcc,	%o6,	%l0
	edge16ln	%o3,	%l2,	%i0
	sdivx	%g4,	0x140E,	%o4
	udivcc	%o1,	0x079F,	%o2
	edge8	%l3,	%o7,	%l1
	smulcc	%l4,	%g7,	%o0
	addccc	%i1,	0x04BF,	%l6
	and	%i2,	%l5,	%i4
	xnorcc	%o5,	0x0189,	%g5
	movrgez	%g6,	0x0E0,	%g2
	fmovdg	%xcc,	%f10,	%f28
	movge	%icc,	%g1,	%i5
	xor	%i6,	0x1D30,	%i3
	movvs	%icc,	%g3,	%i7
	umulcc	%l0,	0x0012,	%o3
	stx	%l2,	[%l7 + 0x48]
	fmovdcc	%xcc,	%f31,	%f22
	udivx	%i0,	0x1372,	%o6
	mova	%xcc,	%g4,	%o4
	fpsub16s	%f25,	%f30,	%f1
	umulcc	%o1,	0x1A3C,	%l3
	movge	%icc,	%o2,	%l1
	umul	%o7,	0x0673,	%l4
	movrne	%o0,	%g7,	%l6
	sll	%i2,	%l5,	%i1
	edge8ln	%i4,	%o5,	%g6
	xor	%g5,	0x0262,	%g1
	or	%g2,	0x16E3,	%i6
	and	%i3,	%g3,	%i5
	srl	%l0,	%o3,	%i7
	srlx	%l2,	%o6,	%i0
	fmovrslz	%o4,	%f27,	%f27
	movl	%icc,	%g4,	%l3
	movgu	%icc,	%o1,	%l1
	movcc	%xcc,	%o2,	%o7
	udivx	%o0,	0x1B67,	%g7
	movcs	%icc,	%l4,	%l6
	udiv	%i2,	0x17F0,	%l5
	and	%i1,	0x0412,	%i4
	movrlz	%o5,	%g6,	%g5
	subcc	%g1,	%i6,	%g2
	sethi	0x18BA,	%g3
	umulcc	%i3,	0x19D9,	%l0
	orn	%o3,	0x14BF,	%i7
	orcc	%i5,	0x1F51,	%o6
	orn	%i0,	%l2,	%o4
	smul	%g4,	%o1,	%l3
	subc	%l1,	%o7,	%o0
	fmovsa	%icc,	%f0,	%f2
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	fmovdleu	%xcc,	%f30,	%f16
	fpadd16	%f20,	%f16,	%f26
	fabsd	%f26,	%f28
	or	%g7,	0x03D0,	%i2
	edge32	%l6,	%l5,	%i1
	save %o5, 0x1D1C, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i4,	%g5,	%i6
	edge16	%g1,	%g3,	%i3
	orn	%g2,	0x0FD4,	%o3
	fmul8ulx16	%f30,	%f22,	%f10
	movge	%icc,	%l0,	%i5
	movne	%xcc,	%o6,	%i7
	stx	%i0,	[%l7 + 0x78]
	fmovrdne	%l2,	%f22,	%f28
	ldsh	[%l7 + 0x6E],	%o4
	movcs	%xcc,	%g4,	%o1
	fpsub32	%f18,	%f12,	%f28
	move	%icc,	%l3,	%l1
	sethi	0x0224,	%o7
	edge16n	%o2,	%l4,	%g7
	smul	%i2,	0x07BF,	%l6
	smul	%l5,	0x1107,	%i1
	sir	0x1250
	ldsw	[%l7 + 0x64],	%o0
	array32	%o5,	%g6,	%i4
	xor	%g5,	%g1,	%i6
	fmovspos	%icc,	%f10,	%f18
	fandnot2s	%f11,	%f19,	%f19
	sub	%g3,	%i3,	%g2
	movrgz	%l0,	0x347,	%i5
	subccc	%o6,	%i7,	%i0
	fmovrslz	%o3,	%f13,	%f7
	smulcc	%o4,	%l2,	%o1
	edge16l	%g4,	%l1,	%l3
	edge32	%o7,	%o2,	%l4
	addc	%g7,	0x08BD,	%l6
	lduw	[%l7 + 0x6C],	%i2
	stb	%i1,	[%l7 + 0x4F]
	edge16ln	%o0,	%l5,	%o5
	edge8ln	%g6,	%i4,	%g1
	movg	%xcc,	%g5,	%i6
	srlx	%i3,	%g3,	%l0
	popc	0x033B,	%g2
	or	%i5,	0x0872,	%o6
	lduw	[%l7 + 0x30],	%i0
	umul	%i7,	0x0D8E,	%o4
	restore %l2, %o3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x5D],	%o1
	edge16l	%l3,	%o7,	%o2
	smulcc	%l4,	%l1,	%l6
	movl	%xcc,	%i2,	%g7
	fabss	%f8,	%f18
	fcmpd	%fcc0,	%f0,	%f22
	sll	%i1,	%l5,	%o0
	movrlz	%g6,	%o5,	%i4
	fmovsge	%xcc,	%f21,	%f25
	movge	%xcc,	%g1,	%i6
	array8	%i3,	%g3,	%l0
	srax	%g2,	0x0C,	%i5
	fpadd32	%f14,	%f4,	%f12
	alignaddr	%g5,	%i0,	%i7
	movgu	%icc,	%o6,	%l2
	sir	0x14B1
	movgu	%icc,	%o4,	%o3
	mulscc	%g4,	0x1245,	%l3
	fand	%f12,	%f18,	%f10
	movg	%icc,	%o1,	%o7
	orn	%o2,	0x1194,	%l4
	orcc	%l1,	0x08F0,	%i2
	edge8l	%g7,	%i1,	%l5
	sdivx	%o0,	0x1AC5,	%l6
	fmul8x16au	%f4,	%f31,	%f30
	orcc	%g6,	%o5,	%g1
	fpack32	%f2,	%f14,	%f18
	sra	%i6,	0x0D,	%i3
	std	%f28,	[%l7 + 0x58]
	edge16	%g3,	%l0,	%i4
	mulscc	%g2,	%g5,	%i0
	fcmpgt16	%f8,	%f2,	%i5
	fmovdvs	%xcc,	%f6,	%f10
	fpadd16	%f28,	%f6,	%f28
	fpsub16s	%f9,	%f5,	%f29
	movne	%xcc,	%i7,	%o6
	andcc	%l2,	%o4,	%o3
	movrgz	%g4,	%o1,	%o7
	alignaddr	%o2,	%l4,	%l3
	mulscc	%l1,	%g7,	%i1
	orcc	%i2,	%l5,	%l6
	subc	%o0,	%o5,	%g1
	andcc	%i6,	0x02D6,	%i3
	edge8n	%g3,	%g6,	%l0
	stx	%g2,	[%l7 + 0x18]
	sdivx	%g5,	0x11F3,	%i0
	add	%i4,	%i5,	%o6
	sra	%l2,	0x18,	%o4
	fmovrde	%o3,	%f10,	%f16
	stb	%i7,	[%l7 + 0x3E]
	edge32n	%o1,	%o7,	%o2
	add	%l4,	0x0147,	%g4
	fsrc1s	%f24,	%f11
	stw	%l1,	[%l7 + 0x14]
	sir	0x1C89
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	subc	%i2,	%l6,	%l5
	mova	%icc,	%o0,	%g1
	sdiv	%i6,	0x1EED,	%o5
	movgu	%icc,	%i3,	%g3
	movgu	%icc,	%l0,	%g2
	fnegs	%f19,	%f16
	smulcc	%g6,	0x0985,	%i0
	xnor	%g5,	%i4,	%o6
	xor	%i5,	0x19CD,	%o4
	andn	%o3,	%l2,	%o1
	sll	%i7,	%o7,	%l4
	subc	%o2,	0x0890,	%g4
	subcc	%l1,	0x1EC5,	%g7
	andncc	%l3,	%i2,	%l6
	edge16n	%l5,	%o0,	%i1
	movcs	%xcc,	%i6,	%o5
	edge16	%g1,	%g3,	%i3
	movcc	%icc,	%l0,	%g2
	edge32ln	%g6,	%g5,	%i0
	ldx	[%l7 + 0x78],	%i4
	edge8l	%o6,	%o4,	%o3
	ldsw	[%l7 + 0x1C],	%l2
	or	%o1,	0x1921,	%i5
	movvs	%xcc,	%o7,	%i7
	fpsub16s	%f11,	%f27,	%f12
	movgu	%icc,	%o2,	%g4
	fornot2s	%f11,	%f16,	%f12
	mulx	%l1,	0x1AD2,	%l4
	andn	%g7,	%l3,	%l6
	stb	%i2,	[%l7 + 0x12]
	popc	%o0,	%l5
	save %i6, %i1, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g3,	%i3,	%l0
	sth	%o5,	[%l7 + 0x36]
	lduh	[%l7 + 0x16],	%g6
	fmovsne	%xcc,	%f17,	%f18
	alignaddrl	%g5,	%i0,	%g2
	subccc	%o6,	%o4,	%o3
	movle	%icc,	%i4,	%l2
	sdiv	%i5,	0x0892,	%o7
	movleu	%icc,	%i7,	%o2
	ldd	[%l7 + 0x40],	%f24
	movcs	%icc,	%o1,	%l1
	bshuffle	%f30,	%f18,	%f6
	edge8	%g4,	%l4,	%g7
	udivcc	%l3,	0x08E4,	%i2
	fpack16	%f18,	%f19
	movcc	%xcc,	%o0,	%l6
	edge32l	%i6,	%l5,	%g1
	sth	%g3,	[%l7 + 0x5C]
	mova	%icc,	%i1,	%l0
	movvs	%icc,	%i3,	%g6
	smul	%g5,	0x197B,	%o5
	stw	%g2,	[%l7 + 0x08]
	movge	%icc,	%i0,	%o6
	fcmpne16	%f26,	%f24,	%o3
	sllx	%o4,	%l2,	%i5
	ld	[%l7 + 0x1C],	%f16
	fmul8sux16	%f26,	%f22,	%f8
	subcc	%o7,	%i7,	%o2
	ldsb	[%l7 + 0x3E],	%o1
	edge8	%i4,	%g4,	%l1
	movvc	%xcc,	%g7,	%l3
	lduh	[%l7 + 0x34],	%i2
	fcmpgt16	%f2,	%f2,	%o0
	st	%f8,	[%l7 + 0x34]
	fmovrdgz	%l4,	%f20,	%f18
	movle	%xcc,	%l6,	%i6
	siam	0x4
	movre	%g1,	0x170,	%g3
	fcmple16	%f4,	%f2,	%l5
	addccc	%l0,	%i1,	%i3
	or	%g5,	0x0B31,	%o5
	edge32l	%g2,	%g6,	%i0
	fcmpne16	%f14,	%f10,	%o6
	movcc	%icc,	%o4,	%l2
	ldsw	[%l7 + 0x0C],	%o3
	srl	%i5,	0x0D,	%o7
	lduw	[%l7 + 0x14],	%i7
	udiv	%o1,	0x1A79,	%o2
	subc	%g4,	0x0C90,	%i4
	fcmps	%fcc3,	%f7,	%f2
	fones	%f10
	fmovdge	%xcc,	%f17,	%f12
	umul	%l1,	0x0B44,	%g7
	movn	%icc,	%i2,	%l3
	stb	%l4,	[%l7 + 0x0A]
	orncc	%o0,	%l6,	%i6
	sth	%g3,	[%l7 + 0x24]
	srax	%l5,	%g1,	%i1
	mulx	%i3,	0x1C3A,	%l0
	alignaddr	%o5,	%g2,	%g5
	smulcc	%g6,	%i0,	%o6
	fornot2	%f12,	%f18,	%f2
	ldd	[%l7 + 0x70],	%l2
	ld	[%l7 + 0x38],	%f25
	xnor	%o3,	%i5,	%o7
	ldd	[%l7 + 0x68],	%i6
	sub	%o1,	%o2,	%g4
	save %i4, 0x1C14, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%g7,	%o4
	movg	%icc,	%l3,	%i2
	andcc	%o0,	%l4,	%i6
	sllx	%l6,	0x17,	%g3
	movn	%xcc,	%l5,	%g1
	edge32n	%i3,	%l0,	%o5
	sethi	0x0A6F,	%g2
	movl	%xcc,	%i1,	%g5
	array32	%g6,	%o6,	%l2
	edge32ln	%i0,	%i5,	%o7
	sllx	%o3,	%i7,	%o2
	fmovd	%f20,	%f4
	udivcc	%o1,	0x05EC,	%i4
	fsrc1s	%f12,	%f30
	umulcc	%l1,	%g4,	%o4
	movcc	%xcc,	%l3,	%g7
	mulx	%i2,	0x0871,	%l4
	edge32n	%o0,	%l6,	%g3
	nop
	set	0x50, %i0
	stx	%l5,	[%l7 + %i0]
	edge16l	%g1,	%i3,	%l0
	fnands	%f25,	%f1,	%f18
	movvc	%xcc,	%o5,	%i6
	orncc	%i1,	0x1831,	%g5
	sdivx	%g6,	0x0446,	%o6
	udivcc	%g2,	0x15E7,	%i0
	fmovrde	%i5,	%f22,	%f10
	movrgez	%o7,	%o3,	%i7
	addc	%o2,	%l2,	%i4
	movre	%o1,	0x2B2,	%g4
	ldd	[%l7 + 0x48],	%f4
	fsrc2s	%f1,	%f10
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%o4
	ldx	[%l7 + 0x28],	%l3
	stb	%g7,	[%l7 + 0x49]
	mova	%icc,	%l1,	%i2
	edge16l	%o0,	%l6,	%l4
	stw	%l5,	[%l7 + 0x44]
	orn	%g1,	0x16E9,	%i3
	fandnot2s	%f8,	%f29,	%f29
	movrgz	%l0,	%o5,	%g3
	and	%i6,	%g5,	%g6
	srax	%i1,	0x07,	%o6
	movrgez	%i0,	0x1C1,	%g2
	edge16	%o7,	%o3,	%i7
	movpos	%xcc,	%i5,	%o2
	ldsb	[%l7 + 0x27],	%i4
	fxor	%f18,	%f4,	%f26
	movle	%xcc,	%o1,	%g4
	stw	%o4,	[%l7 + 0x30]
	edge32l	%l3,	%l2,	%g7
	udiv	%i2,	0x0D38,	%o0
	stx	%l6,	[%l7 + 0x30]
	movn	%icc,	%l4,	%l5
	movg	%icc,	%g1,	%l1
	ldsw	[%l7 + 0x78],	%i3
	xor	%l0,	%o5,	%g3
	sir	0x1FD1
	edge32ln	%g5,	%i6,	%i1
	fsrc1	%f2,	%f2
	fxors	%f26,	%f22,	%f22
	ldd	[%l7 + 0x78],	%f10
	movrlez	%g6,	%o6,	%i0
	popc	%g2,	%o7
	movne	%icc,	%o3,	%i7
	fmovdneg	%xcc,	%f14,	%f20
	ldd	[%l7 + 0x28],	%o2
	edge16	%i5,	%o1,	%i4
	edge32	%o4,	%l3,	%l2
	udivcc	%g4,	0x197E,	%g7
	orncc	%o0,	0x183D,	%i2
	alignaddrl	%l4,	%l5,	%g1
	movrne	%l6,	%l1,	%l0
	subcc	%o5,	%g3,	%i3
	mulscc	%g5,	%i1,	%i6
	fornot2s	%f1,	%f29,	%f0
	movvc	%icc,	%o6,	%i0
	fmovde	%icc,	%f13,	%f15
	mulx	%g2,	0x1731,	%g6
	move	%xcc,	%o7,	%i7
	xor	%o3,	%o2,	%o1
	fcmped	%fcc2,	%f24,	%f2
	ldub	[%l7 + 0x73],	%i4
	edge8n	%o4,	%l3,	%l2
	edge32l	%i5,	%g4,	%g7
	movrgez	%i2,	0x05A,	%o0
	st	%f18,	[%l7 + 0x14]
	ldx	[%l7 + 0x18],	%l4
	alignaddr	%l5,	%l6,	%g1
	st	%f10,	[%l7 + 0x10]
	sethi	0x1E00,	%l1
	sdiv	%l0,	0x0E83,	%o5
	orcc	%g3,	%g5,	%i1
	lduw	[%l7 + 0x0C],	%i3
	fpack32	%f14,	%f26,	%f16
	fmovsge	%icc,	%f5,	%f11
	fones	%f1
	ldd	[%l7 + 0x58],	%i6
	fcmple16	%f4,	%f10,	%o6
	fzeros	%f28
	fmovde	%icc,	%f17,	%f10
	restore %i0, 0x0741, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x3C],	%f0
	fcmpgt16	%f18,	%f14,	%g6
	fmovdleu	%icc,	%f10,	%f0
	edge8n	%o7,	%i7,	%o3
	fmovsn	%xcc,	%f23,	%f9
	nop
	set	0x62, %o2
	stb	%o1,	[%l7 + %o2]
	fmul8x16	%f13,	%f22,	%f30
	sir	0x16C1
	subc	%i4,	%o2,	%l3
	udivx	%l2,	0x16BD,	%i5
	fsrc2s	%f7,	%f26
	edge32ln	%g4,	%o4,	%i2
	fandnot2	%f18,	%f26,	%f30
	movleu	%icc,	%g7,	%o0
	fmovdcc	%icc,	%f17,	%f6
	edge8n	%l5,	%l4,	%g1
	movrgez	%l1,	0x33A,	%l0
	edge16n	%o5,	%g3,	%l6
	movge	%icc,	%g5,	%i1
	umul	%i3,	%o6,	%i6
	sethi	0x17F5,	%i0
	edge32n	%g2,	%o7,	%g6
	edge32	%i7,	%o3,	%o1
	movcc	%xcc,	%i4,	%o2
	fmovrdgz	%l2,	%f4,	%f8
	fnot1	%f0,	%f22
	std	%f12,	[%l7 + 0x30]
	orcc	%l3,	0x1015,	%g4
	edge8l	%i5,	%o4,	%g7
	fmovrsgez	%o0,	%f4,	%f30
	mova	%icc,	%i2,	%l4
	fnands	%f8,	%f1,	%f30
	sllx	%l5,	0x1D,	%l1
	edge32ln	%g1,	%o5,	%l0
	nop
	set	0x43, %i4
	stb	%l6,	[%l7 + %i4]
	stw	%g3,	[%l7 + 0x58]
	edge32	%i1,	%g5,	%o6
	alignaddr	%i6,	%i0,	%g2
	fmovrde	%i3,	%f4,	%f30
	fmovs	%f31,	%f11
	orcc	%g6,	%o7,	%o3
	xnorcc	%i7,	0x1591,	%o1
	ldsw	[%l7 + 0x70],	%i4
	umulcc	%o2,	0x186C,	%l3
	ld	[%l7 + 0x28],	%f6
	ldub	[%l7 + 0x1B],	%l2
	sir	0x01C9
	fmul8ulx16	%f14,	%f16,	%f12
	fcmped	%fcc2,	%f16,	%f22
	fpmerge	%f20,	%f3,	%f12
	mulscc	%g4,	0x0AD1,	%o4
	lduh	[%l7 + 0x7E],	%i5
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	fmovdvc	%icc,	%f13,	%f4
	addccc	%l4,	0x0D6B,	%l5
	orncc	%l1,	0x1748,	%i2
	xnor	%g1,	%o5,	%l0
	udivx	%g3,	0x1DA1,	%l6
	fmovdn	%icc,	%f17,	%f11
	xorcc	%g5,	0x0055,	%o6
	fpackfix	%f16,	%f23
	mulscc	%i1,	0x0DF7,	%i0
	movre	%g2,	0x2E1,	%i3
	fnor	%f24,	%f24,	%f14
	movrgez	%g6,	0x013,	%i6
	or	%o3,	%i7,	%o1
	ldsh	[%l7 + 0x68],	%i4
	edge32ln	%o2,	%l3,	%l2
	and	%g4,	%o7,	%i5
	addc	%g7,	0x1909,	%o0
	alignaddr	%l4,	%l5,	%l1
	edge16	%o4,	%g1,	%i2
	movrgez	%o5,	0x307,	%l0
	movrlz	%l6,	0x16B,	%g3
	movge	%xcc,	%g5,	%o6
	andn	%i1,	0x14BD,	%g2
	edge32l	%i3,	%g6,	%i0
	subccc	%i6,	%o3,	%o1
	restore %i7, %i4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%l2,	%f12,	%f12
	fmovspos	%icc,	%f7,	%f28
	fmul8x16al	%f2,	%f21,	%f4
	srl	%g4,	0x0B,	%l3
	array8	%o7,	%i5,	%o0
	orncc	%l4,	%l5,	%g7
	movneg	%xcc,	%o4,	%l1
	fmovsa	%xcc,	%f15,	%f28
	srlx	%g1,	%o5,	%l0
	std	%f8,	[%l7 + 0x78]
	smulcc	%i2,	0x1095,	%l6
	movre	%g3,	%g5,	%i1
	save %o6, %g2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i0,	0x1D27,	%i3
	fmovrslez	%o3,	%f18,	%f12
	mulscc	%o1,	0x0718,	%i6
	fmovsne	%icc,	%f0,	%f7
	movcc	%xcc,	%i4,	%o2
	sir	0x1145
	fcmpne16	%f30,	%f28,	%i7
	nop
	set	0x10, %i6
	lduw	[%l7 + %i6],	%l2
	umulcc	%g4,	%l3,	%i5
	subc	%o7,	0x1D33,	%l4
	umulcc	%l5,	0x0A2F,	%g7
	fmuld8ulx16	%f5,	%f12,	%f12
	fmovrde	%o4,	%f28,	%f26
	xorcc	%o0,	%l1,	%g1
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	edge32n	%l6,	%g3,	%i2
	restore %g5, 0x02D1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g2,	0x07AB,	%g6
	edge8n	%i1,	%i3,	%o3
	addccc	%o1,	0x0438,	%i0
	fcmpd	%fcc3,	%f18,	%f30
	sdivx	%i4,	0x0482,	%o2
	sdivcc	%i6,	0x0084,	%i7
	edge16	%g4,	%l2,	%l3
	popc	%o7,	%l4
	edge32n	%i5,	%g7,	%o4
	udivx	%l5,	0x06CD,	%o0
	edge16ln	%g1,	%o5,	%l0
	array8	%l1,	%g3,	%l6
	subc	%i2,	0x1CA6,	%g5
	array8	%o6,	%g2,	%i1
	movvs	%xcc,	%g6,	%i3
	fornot2	%f2,	%f16,	%f4
	orcc	%o1,	%o3,	%i4
	movre	%o2,	0x067,	%i0
	ldub	[%l7 + 0x39],	%i6
	edge8n	%i7,	%l2,	%g4
	ldsb	[%l7 + 0x42],	%l3
	sllx	%o7,	%i5,	%l4
	stb	%o4,	[%l7 + 0x57]
	srl	%l5,	0x03,	%g7
	sub	%o0,	0x125F,	%g1
	ldsw	[%l7 + 0x5C],	%l0
	movge	%icc,	%l1,	%o5
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	fpsub16	%f20,	%f24,	%f26
	nop
	set	0x50, %g6
	ldsw	[%l7 + %g6],	%o6
	mova	%icc,	%g2,	%i1
	fmovspos	%icc,	%f8,	%f19
	addc	%g6,	%g5,	%o1
	sub	%i3,	0x184E,	%o3
	andn	%i4,	%o2,	%i6
	fmovrdne	%i7,	%f18,	%f22
	sdiv	%i0,	0x1B5E,	%g4
	alignaddr	%l2,	%l3,	%o7
	movrgez	%l4,	0x187,	%o4
	addcc	%i5,	0x128F,	%g7
	smulcc	%l5,	%o0,	%l0
	andn	%g1,	%o5,	%l6
	sra	%l1,	%g3,	%i2
	movleu	%icc,	%g2,	%o6
	smul	%i1,	0x0B79,	%g6
	umul	%o1,	%i3,	%o3
	lduh	[%l7 + 0x66],	%g5
	fmovs	%f24,	%f15
	edge32	%o2,	%i6,	%i4
	xor	%i0,	%g4,	%l2
	bshuffle	%f22,	%f28,	%f4
	sll	%l3,	%i7,	%o7
	udiv	%o4,	0x0478,	%l4
	movrlez	%g7,	0x340,	%l5
	srl	%o0,	0x1F,	%i5
	fpmerge	%f27,	%f16,	%f24
	ldd	[%l7 + 0x58],	%f22
	sub	%g1,	%l0,	%o5
	xnorcc	%l6,	%l1,	%g3
	movne	%xcc,	%g2,	%i2
	nop
	set	0x60, %i5
	ldx	[%l7 + %i5],	%i1
	ldub	[%l7 + 0x1C],	%o6
	edge32ln	%o1,	%g6,	%o3
	movpos	%icc,	%i3,	%g5
	addcc	%i6,	%i4,	%o2
	array8	%g4,	%i0,	%l2
	udivx	%i7,	0x16B9,	%l3
	edge16l	%o7,	%o4,	%l4
	ld	[%l7 + 0x1C],	%f28
	fmovsvc	%xcc,	%f13,	%f21
	subc	%l5,	0x1A28,	%o0
	edge32l	%i5,	%g7,	%l0
	movcs	%icc,	%g1,	%l6
	orncc	%l1,	%o5,	%g2
	ldx	[%l7 + 0x50],	%g3
	edge32ln	%i2,	%i1,	%o1
	movrlez	%g6,	0x295,	%o6
	and	%i3,	0x13EC,	%g5
	sll	%i6,	%i4,	%o2
	sllx	%o3,	%g4,	%i0
	andcc	%i7,	0x0029,	%l3
	array8	%l2,	%o7,	%o4
	movrgz	%l5,	%l4,	%o0
	mulx	%g7,	0x05F9,	%l0
	movneg	%xcc,	%i5,	%l6
	movle	%xcc,	%g1,	%l1
	umul	%g2,	%g3,	%i2
	edge8	%i1,	%o5,	%o1
	edge16n	%o6,	%i3,	%g6
	fmovrsgez	%g5,	%f12,	%f26
	stx	%i6,	[%l7 + 0x78]
	movneg	%xcc,	%o2,	%o3
	srlx	%g4,	0x00,	%i4
	movleu	%icc,	%i7,	%i0
	array32	%l3,	%o7,	%o4
	sethi	0x15FD,	%l5
	srax	%l2,	%o0,	%l4
	movcs	%xcc,	%g7,	%l0
	srlx	%i5,	0x0E,	%g1
	sub	%l1,	%l6,	%g2
	ldd	[%l7 + 0x40],	%i2
	edge16ln	%g3,	%o5,	%i1
	addccc	%o1,	%o6,	%i3
	fornot2	%f0,	%f12,	%f8
	movvc	%xcc,	%g5,	%g6
	andn	%o2,	0x1A43,	%o3
	subccc	%g4,	%i4,	%i6
	sethi	0x095E,	%i0
	movre	%i7,	0x049,	%o7
	fones	%f23
	movrgz	%l3,	0x236,	%l5
	movleu	%icc,	%o4,	%o0
	popc	%l2,	%g7
	movge	%xcc,	%l0,	%l4
	sllx	%g1,	%i5,	%l6
	edge16ln	%g2,	%i2,	%g3
	fcmpne16	%f20,	%f20,	%l1
	add	%o5,	0x0C57,	%o1
	srlx	%i1,	%i3,	%g5
	movrlez	%o6,	0x3E9,	%o2
	fmovrslez	%o3,	%f11,	%f25
	mova	%icc,	%g4,	%g6
	fmovdgu	%icc,	%f27,	%f3
	movre	%i4,	0x101,	%i6
	fmovdle	%xcc,	%f21,	%f12
	edge8ln	%i0,	%i7,	%l3
	sub	%l5,	0x0C0B,	%o4
	bshuffle	%f20,	%f10,	%f22
	subc	%o7,	%l2,	%o0
	ldd	[%l7 + 0x20],	%g6
	fpsub16	%f30,	%f30,	%f14
	sdiv	%l4,	0x190E,	%l0
	edge32l	%i5,	%g1,	%g2
	fmovsn	%xcc,	%f7,	%f4
	nop
	set	0x7A, %o6
	stb	%i2,	[%l7 + %o6]
	andn	%l6,	%l1,	%o5
	st	%f19,	[%l7 + 0x6C]
	st	%f13,	[%l7 + 0x28]
	edge8	%o1,	%g3,	%i3
	umulcc	%i1,	0x16AF,	%o6
	subc	%g5,	0x12A3,	%o3
	movrgz	%o2,	0x3EB,	%g4
	ld	[%l7 + 0x6C],	%f28
	mulx	%g6,	0x02CA,	%i6
	edge8l	%i0,	%i7,	%i4
	nop
	set	0x78, %l2
	stx	%l3,	[%l7 + %l2]
	udiv	%o4,	0x0121,	%l5
	fmul8ulx16	%f6,	%f18,	%f4
	add	%o7,	0x0CBC,	%l2
	fmovsleu	%icc,	%f15,	%f11
	fmovscc	%xcc,	%f7,	%f13
	subcc	%g7,	0x08EA,	%l4
	movrgez	%l0,	%o0,	%i5
	sll	%g1,	0x0A,	%i2
	save %l6, 0x0AD4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o5,	%o1,	%g3
	movvc	%xcc,	%g2,	%i1
	popc	%i3,	%g5
	addc	%o3,	%o2,	%o6
	sra	%g6,	%i6,	%i0
	add	%i7,	0x1438,	%i4
	fornot1	%f2,	%f22,	%f20
	movrne	%l3,	%g4,	%o4
	lduh	[%l7 + 0x3C],	%l5
	sdivx	%l2,	0x0BF2,	%o7
	movpos	%icc,	%g7,	%l4
	fmovrsgez	%l0,	%f23,	%f1
	array8	%o0,	%i5,	%i2
	edge16n	%g1,	%l1,	%l6
	subccc	%o5,	%g3,	%g2
	movg	%icc,	%i1,	%i3
	fpadd16	%f8,	%f18,	%f0
	move	%xcc,	%o1,	%o3
	mulx	%g5,	%o6,	%g6
	edge32n	%o2,	%i0,	%i7
	udiv	%i4,	0x134D,	%i6
	edge32	%g4,	%o4,	%l3
	andcc	%l2,	0x1B82,	%o7
	alignaddr	%g7,	%l4,	%l0
	sll	%l5,	%i5,	%i2
	ldsw	[%l7 + 0x24],	%o0
	ldsw	[%l7 + 0x34],	%g1
	sll	%l6,	0x05,	%o5
	addccc	%g3,	0x1342,	%l1
	movne	%xcc,	%g2,	%i3
	srax	%i1,	%o3,	%o1
	movge	%xcc,	%g5,	%o6
	sdiv	%o2,	0x18D5,	%i0
	or	%i7,	0x0CA0,	%g6
	alignaddrl	%i6,	%g4,	%i4
	restore %o4, 0x1A87, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f26,	%f30
	movl	%xcc,	%o7,	%g7
	popc	0x0013,	%l4
	edge8n	%l0,	%l3,	%l5
	xnor	%i2,	0x0A36,	%o0
	save %g1, 0x057D, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%l6,	%o5
	fmuld8sux16	%f29,	%f6,	%f10
	move	%xcc,	%l1,	%g3
	edge32	%i3,	%i1,	%g2
	fand	%f4,	%f0,	%f4
	ldsb	[%l7 + 0x6A],	%o3
	edge32	%o1,	%g5,	%o6
	or	%o2,	0x16BA,	%i0
	fmul8sux16	%f4,	%f18,	%f2
	andncc	%i7,	%g6,	%g4
	stw	%i6,	[%l7 + 0x50]
	mulx	%i4,	%o4,	%o7
	andncc	%g7,	%l4,	%l2
	lduw	[%l7 + 0x78],	%l0
	array32	%l5,	%l3,	%o0
	xnorcc	%g1,	%i2,	%l6
	fcmps	%fcc3,	%f5,	%f10
	ldsh	[%l7 + 0x36],	%o5
	array8	%l1,	%g3,	%i3
	edge32ln	%i1,	%i5,	%g2
	stb	%o1,	[%l7 + 0x5F]
	move	%icc,	%o3,	%g5
	edge8ln	%o6,	%o2,	%i7
	add	%i0,	%g6,	%i6
	movpos	%xcc,	%i4,	%g4
	ldx	[%l7 + 0x40],	%o7
	std	%f28,	[%l7 + 0x20]
	srl	%o4,	0x03,	%g7
	movrlz	%l2,	%l4,	%l5
	fmovdg	%icc,	%f25,	%f4
	xnorcc	%l3,	0x18A0,	%l0
	subcc	%g1,	0x0494,	%o0
	fpadd16s	%f10,	%f31,	%f3
	fmovsleu	%xcc,	%f17,	%f29
	sllx	%i2,	%l6,	%l1
	sdiv	%g3,	0x0AF5,	%o5
	fnot1	%f6,	%f4
	fxors	%f27,	%f10,	%f25
	and	%i3,	%i5,	%i1
	mova	%icc,	%o1,	%o3
	stb	%g2,	[%l7 + 0x4D]
	fmovdvc	%icc,	%f0,	%f8
	fcmpne32	%f8,	%f8,	%o6
	movrgez	%o2,	%g5,	%i7
	subccc	%i0,	0x0BE7,	%i6
	addccc	%g6,	%i4,	%o7
	ldub	[%l7 + 0x23],	%g4
	movrlez	%o4,	%g7,	%l4
	subcc	%l2,	0x1029,	%l3
	and	%l5,	0x0672,	%l0
	faligndata	%f20,	%f22,	%f24
	srax	%o0,	%i2,	%g1
	subcc	%l1,	0x1918,	%l6
	umulcc	%g3,	%i3,	%i5
	fsrc1	%f16,	%f14
	edge16ln	%i1,	%o1,	%o3
	edge8	%g2,	%o6,	%o5
	fcmpne16	%f10,	%f10,	%o2
	mulscc	%i7,	0x1764,	%g5
	udivx	%i0,	0x103E,	%g6
	edge32	%i4,	%i6,	%o7
	fmul8sux16	%f0,	%f10,	%f8
	fmovrsne	%o4,	%f25,	%f0
	alignaddr	%g4,	%l4,	%g7
	movrlz	%l3,	0x224,	%l5
	orncc	%l0,	%o0,	%i2
	edge32l	%l2,	%g1,	%l6
	orncc	%g3,	0x0D71,	%i3
	fcmpd	%fcc0,	%f20,	%f2
	fnegs	%f23,	%f0
	alignaddr	%l1,	%i5,	%i1
	edge8l	%o3,	%o1,	%o6
	movvs	%icc,	%g2,	%o5
	udivx	%i7,	0x07BD,	%o2
	subc	%i0,	%g5,	%i4
	array32	%i6,	%o7,	%o4
	fcmpeq32	%f20,	%f20,	%g6
	sethi	0x0611,	%g4
	stw	%l4,	[%l7 + 0x20]
	edge8n	%g7,	%l3,	%l0
	sdivcc	%o0,	0x108B,	%i2
	fpmerge	%f22,	%f27,	%f28
	move	%icc,	%l5,	%l2
	fcmple32	%f22,	%f24,	%g1
	edge32n	%g3,	%i3,	%l1
	movleu	%xcc,	%i5,	%i1
	fmovdn	%icc,	%f22,	%f16
	edge16l	%l6,	%o3,	%o6
	movre	%o1,	%o5,	%i7
	ld	[%l7 + 0x70],	%f17
	movcc	%xcc,	%g2,	%i0
	add	%g5,	0x18BF,	%o2
	and	%i6,	0x0C7B,	%i4
	movvs	%icc,	%o4,	%g6
	lduh	[%l7 + 0x1A],	%g4
	fcmpeq32	%f12,	%f26,	%o7
	fmovsvc	%xcc,	%f27,	%f23
	udivcc	%l4,	0x0B01,	%g7
	movgu	%xcc,	%l3,	%l0
	movpos	%xcc,	%o0,	%i2
	movge	%xcc,	%l5,	%g1
	movgu	%icc,	%g3,	%l2
	ldd	[%l7 + 0x70],	%i2
	edge32ln	%i5,	%l1,	%l6
	addc	%i1,	0x0A66,	%o6
	movle	%xcc,	%o1,	%o3
	fpadd32s	%f0,	%f30,	%f12
	ld	[%l7 + 0x50],	%f25
	move	%xcc,	%i7,	%g2
	ldd	[%l7 + 0x60],	%o4
	sdivcc	%i0,	0x09A3,	%o2
	stw	%g5,	[%l7 + 0x58]
	st	%f2,	[%l7 + 0x78]
	movleu	%xcc,	%i4,	%o4
	umul	%g6,	%g4,	%i6
	sub	%l4,	%g7,	%l3
	ldx	[%l7 + 0x08],	%o7
	movle	%xcc,	%l0,	%o0
	udiv	%l5,	0x1D4B,	%g1
	movvs	%icc,	%i2,	%g3
	edge8l	%i3,	%l2,	%l1
	andncc	%l6,	%i5,	%o6
	addcc	%i1,	%o1,	%i7
	sra	%g2,	0x08,	%o5
	orn	%o3,	0x0EB7,	%i0
	subccc	%g5,	0x1E85,	%i4
	fmovdleu	%xcc,	%f1,	%f14
	alignaddr	%o4,	%g6,	%g4
	udiv	%o2,	0x0DBD,	%i6
	movn	%xcc,	%l4,	%g7
	movl	%icc,	%l3,	%l0
	array8	%o0,	%o7,	%l5
	movneg	%icc,	%g1,	%i2
	lduw	[%l7 + 0x40],	%g3
	lduh	[%l7 + 0x1E],	%i3
	movre	%l2,	%l6,	%i5
	edge8n	%l1,	%i1,	%o6
	fmovdcc	%xcc,	%f23,	%f4
	srlx	%o1,	%g2,	%i7
	fmovdleu	%xcc,	%f3,	%f18
	smul	%o5,	0x0AB2,	%i0
	fmovdl	%xcc,	%f10,	%f23
	fmovdg	%xcc,	%f6,	%f23
	fmovsn	%xcc,	%f25,	%f30
	fornot2s	%f20,	%f12,	%f10
	udivx	%g5,	0x1C31,	%i4
	addcc	%o3,	%g6,	%o4
	edge8l	%g4,	%o2,	%i6
	movle	%icc,	%l4,	%g7
	addccc	%l0,	0x1063,	%o0
	srl	%o7,	0x11,	%l3
	fnot2	%f2,	%f4
	fmovrdgez	%l5,	%f12,	%f28
	addccc	%i2,	0x0E09,	%g1
	orcc	%i3,	0x1202,	%l2
	save %l6, %i5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l1,	%o6,	%o1
	xnor	%i1,	%i7,	%o5
	srlx	%g2,	%g5,	%i0
	sethi	0x152F,	%o3
	edge8	%g6,	%i4,	%g4
	udivcc	%o2,	0x18AF,	%o4
	movg	%icc,	%i6,	%l4
	fmovdne	%xcc,	%f7,	%f14
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	nop
	set	0x4A, %l4
	sth	%l3,	[%l7 + %l4]
	andncc	%o7,	%l5,	%i2
	ld	[%l7 + 0x34],	%f1
	edge16	%g1,	%i3,	%l6
	popc	0x1265,	%l2
	nop
	set	0x2B, %o3
	ldsb	[%l7 + %o3],	%i5
	srlx	%g3,	0x1D,	%l1
	fnot1s	%f2,	%f3
	movpos	%icc,	%o1,	%i1
	movn	%xcc,	%i7,	%o5
	udiv	%o6,	0x04D5,	%g2
	sll	%i0,	0x12,	%g5
	movg	%xcc,	%g6,	%i4
	movne	%icc,	%o3,	%o2
	fsrc2	%f12,	%f26
	edge32l	%g4,	%o4,	%i6
	fones	%f12
	edge16ln	%l4,	%l0,	%g7
	movrlez	%l3,	0x00C,	%o0
	edge32	%o7,	%l5,	%g1
	movleu	%xcc,	%i2,	%l6
	subcc	%l2,	0x1CFF,	%i5
	edge32	%i3,	%g3,	%l1
	srlx	%i1,	0x04,	%i7
	andncc	%o1,	%o6,	%g2
	fxnors	%f26,	%f7,	%f20
	andn	%o5,	%i0,	%g6
	fpadd16s	%f16,	%f20,	%f0
	addc	%i4,	%g5,	%o3
	array8	%g4,	%o2,	%i6
	addc	%o4,	0x039C,	%l4
	mulscc	%l0,	%g7,	%o0
	fnot2	%f8,	%f22
	movrne	%l3,	%o7,	%g1
	fmovdle	%icc,	%f6,	%f23
	srl	%i2,	0x00,	%l6
	sethi	0x14DC,	%l5
	movg	%icc,	%i5,	%l2
	fsrc1	%f16,	%f6
	sth	%g3,	[%l7 + 0x40]
	fmovde	%xcc,	%f25,	%f27
	edge16	%l1,	%i1,	%i3
	fcmped	%fcc1,	%f28,	%f20
	fmovdg	%icc,	%f19,	%f17
	umulcc	%i7,	%o6,	%o1
	subc	%g2,	0x0242,	%o5
	movrgz	%i0,	0x136,	%i4
	movvc	%icc,	%g6,	%o3
	fmuld8ulx16	%f12,	%f14,	%f16
	mulscc	%g4,	%g5,	%i6
	alignaddr	%o2,	%o4,	%l4
	addc	%g7,	%o0,	%l3
	ld	[%l7 + 0x0C],	%f3
	edge8ln	%l0,	%o7,	%g1
	popc	%l6,	%i2
	mulx	%l5,	0x116F,	%i5
	fmovdgu	%icc,	%f29,	%f15
	fmovsvc	%icc,	%f30,	%f18
	edge8l	%g3,	%l1,	%l2
	edge16ln	%i1,	%i3,	%i7
	movcs	%xcc,	%o6,	%o1
	udivcc	%o5,	0x0BC5,	%g2
	sdiv	%i0,	0x1823,	%i4
	orncc	%o3,	%g6,	%g5
	fmovdne	%icc,	%f21,	%f15
	andcc	%i6,	%o2,	%o4
	ldx	[%l7 + 0x40],	%l4
	array8	%g7,	%o0,	%l3
	ldsh	[%l7 + 0x60],	%l0
	subcc	%o7,	0x0B7F,	%g1
	andcc	%g4,	0x1425,	%l6
	ldx	[%l7 + 0x28],	%i2
	fmovrslez	%l5,	%f31,	%f21
	pdist	%f0,	%f24,	%f16
	lduw	[%l7 + 0x18],	%g3
	ldsb	[%l7 + 0x20],	%i5
	fand	%f24,	%f8,	%f30
	movge	%xcc,	%l2,	%i1
	srl	%i3,	%i7,	%l1
	udivx	%o1,	0x1048,	%o6
	xnor	%g2,	%o5,	%i4
	ldsh	[%l7 + 0x66],	%i0
	fexpand	%f3,	%f0
	udiv	%o3,	0x10AA,	%g6
	fnegd	%f28,	%f8
	mulscc	%i6,	%o2,	%o4
	ldsb	[%l7 + 0x45],	%l4
	edge32	%g7,	%o0,	%l3
	edge32	%l0,	%o7,	%g1
	movre	%g5,	0x272,	%l6
	stx	%g4,	[%l7 + 0x78]
	edge8ln	%i2,	%g3,	%l5
	andcc	%i5,	%l2,	%i1
	move	%xcc,	%i7,	%i3
	fcmple32	%f16,	%f4,	%o1
	edge32	%o6,	%l1,	%g2
	movpos	%xcc,	%i4,	%i0
	nop
	set	0x3A, %g7
	sth	%o5,	[%l7 + %g7]
	edge32l	%g6,	%o3,	%o2
	edge16l	%i6,	%l4,	%g7
	fmovrdgez	%o0,	%f12,	%f0
	fpadd16	%f8,	%f16,	%f4
	fmovdvs	%xcc,	%f5,	%f14
	array16	%l3,	%l0,	%o4
	fmovd	%f10,	%f22
	movrgz	%o7,	0x1DC,	%g1
	ldd	[%l7 + 0x18],	%f8
	sdivx	%l6,	0x1030,	%g5
	add	%g4,	0x09EA,	%i2
	movrgez	%g3,	%i5,	%l5
	fpack16	%f28,	%f15
	orncc	%i1,	%i7,	%l2
	fornot1s	%f16,	%f22,	%f26
	fnot2s	%f20,	%f5
	orncc	%i3,	%o1,	%l1
	orncc	%g2,	%i4,	%i0
	fxors	%f30,	%f9,	%f31
	movn	%icc,	%o5,	%g6
	alignaddr	%o6,	%o2,	%o3
	fexpand	%f24,	%f0
	edge32ln	%l4,	%i6,	%o0
	fcmple32	%f20,	%f14,	%g7
	sir	0x1C73
	sdiv	%l3,	0x11FD,	%l0
	addc	%o4,	%g1,	%l6
	mulx	%o7,	0x064C,	%g4
	movg	%icc,	%g5,	%g3
	fabsd	%f26,	%f12
	sdiv	%i2,	0x0511,	%i5
	movl	%xcc,	%i1,	%l5
	ldsh	[%l7 + 0x5A],	%l2
	movg	%xcc,	%i7,	%i3
	movneg	%icc,	%o1,	%g2
	movcs	%xcc,	%i4,	%l1
	movcs	%icc,	%o5,	%i0
	edge32n	%g6,	%o6,	%o2
	addcc	%o3,	0x0A08,	%l4
	array16	%o0,	%g7,	%l3
	subcc	%l0,	0x189A,	%o4
	addcc	%i6,	%l6,	%o7
	movre	%g4,	%g1,	%g3
	movpos	%xcc,	%i2,	%i5
	movrne	%g5,	%i1,	%l2
	xor	%i7,	%i3,	%l5
	fnot1s	%f26,	%f10
	orcc	%o1,	0x020C,	%g2
	ldsw	[%l7 + 0x74],	%l1
	fmovd	%f12,	%f22
	sra	%i4,	%o5,	%g6
	restore %i0, 0x1B96, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f6,	%f22,	%f28
	fmovsl	%xcc,	%f19,	%f8
	sethi	0x1E38,	%o3
	edge16	%o2,	%l4,	%o0
	udivcc	%l3,	0x165B,	%l0
	srl	%g7,	%i6,	%o4
	fmovdpos	%xcc,	%f1,	%f12
	udivcc	%o7,	0x0F3A,	%g4
	umul	%l6,	0x02DE,	%g1
	fpackfix	%f0,	%f13
	save %i2, 0x1369, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%g5,	%f20,	%f24
	mova	%icc,	%i5,	%i1
	movn	%xcc,	%i7,	%i3
	fmovsneg	%xcc,	%f20,	%f16
	array16	%l2,	%o1,	%g2
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	ldd	[%l7 + 0x48],	%f6
	andn	%i4,	%o5,	%i0
	orcc	%g6,	0x0DB8,	%o3
	edge16n	%o2,	%l4,	%o0
	lduw	[%l7 + 0x18],	%o6
	fpadd32s	%f1,	%f8,	%f27
	fcmpd	%fcc1,	%f28,	%f2
	fmovsl	%icc,	%f8,	%f14
	movle	%xcc,	%l3,	%l0
	fpadd32s	%f24,	%f12,	%f21
	fsrc2	%f2,	%f12
	sdivx	%i6,	0x0844,	%g7
	ldsb	[%l7 + 0x13],	%o4
	umulcc	%o7,	0x1C45,	%l6
	sethi	0x02ED,	%g4
	pdist	%f22,	%f18,	%f0
	edge8	%i2,	%g1,	%g5
	movre	%i5,	0x14F,	%i1
	xnorcc	%g3,	%i3,	%i7
	srax	%l2,	%o1,	%l5
	movg	%xcc,	%l1,	%i4
	fmovscc	%xcc,	%f22,	%f12
	movge	%icc,	%o5,	%g2
	fxnor	%f20,	%f24,	%f14
	fmovscc	%icc,	%f29,	%f0
	orncc	%g6,	0x1187,	%o3
	movle	%xcc,	%o2,	%l4
	ldx	[%l7 + 0x48],	%i0
	edge8l	%o6,	%l3,	%l0
	umulcc	%o0,	%i6,	%g7
	fmovdvc	%icc,	%f30,	%f20
	udivcc	%o7,	0x1496,	%l6
	sllx	%g4,	%i2,	%g1
	array8	%o4,	%g5,	%i1
	xorcc	%g3,	%i3,	%i5
	movge	%icc,	%l2,	%o1
	ldsh	[%l7 + 0x78],	%i7
	udivx	%l5,	0x102F,	%l1
	mulscc	%o5,	0x01C1,	%i4
	std	%f18,	[%l7 + 0x20]
	edge16ln	%g6,	%g2,	%o3
	sir	0x035A
	fmovsa	%icc,	%f7,	%f8
	movneg	%icc,	%l4,	%o2
	udiv	%i0,	0x16DE,	%l3
	stw	%l0,	[%l7 + 0x40]
	xorcc	%o6,	%i6,	%o0
	srax	%g7,	0x11,	%o7
	orncc	%g4,	0x0965,	%l6
	fmovdcc	%xcc,	%f4,	%f19
	array32	%g1,	%o4,	%i2
	or	%i1,	%g3,	%i3
	save %i5, 0x1389, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%g5,	%i7
	movgu	%icc,	%o1,	%l5
	movn	%xcc,	%l1,	%o5
	xorcc	%i4,	0x0A71,	%g6
	or	%g2,	0x002B,	%o3
	sdivx	%o2,	0x1C40,	%l4
	sll	%l3,	%l0,	%o6
	movrlz	%i0,	%o0,	%i6
	movleu	%xcc,	%g7,	%g4
	ld	[%l7 + 0x34],	%f25
	smul	%o7,	0x0DFB,	%l6
	mulx	%g1,	%i2,	%i1
	popc	0x0D11,	%g3
	edge16l	%o4,	%i5,	%l2
	andcc	%i3,	0x0A07,	%i7
	movle	%icc,	%o1,	%g5
	subcc	%l5,	0x16B2,	%o5
	movleu	%xcc,	%l1,	%g6
	movrlz	%g2,	%o3,	%o2
	fsrc1	%f22,	%f16
	movg	%icc,	%i4,	%l3
	umul	%l0,	0x1E82,	%o6
	movrgez	%i0,	%l4,	%i6
	sll	%g7,	0x09,	%g4
	addccc	%o0,	0x0585,	%o7
	ldsh	[%l7 + 0x5E],	%l6
	movrlez	%i2,	0x23C,	%g1
	orncc	%i1,	%o4,	%g3
	edge16n	%l2,	%i3,	%i7
	movrne	%o1,	%g5,	%l5
	udivcc	%i5,	0x1823,	%l1
	ldsh	[%l7 + 0x7A],	%g6
	andncc	%g2,	%o3,	%o2
	subcc	%o5,	%i4,	%l3
	fzeros	%f26
	xor	%l0,	0x1FCD,	%i0
	udiv	%o6,	0x1775,	%l4
	fmovrslez	%i6,	%f19,	%f25
	subc	%g4,	0x1FE8,	%g7
	ldsw	[%l7 + 0x5C],	%o0
	edge32ln	%o7,	%l6,	%g1
	fpsub16s	%f9,	%f26,	%f22
	fpsub16	%f6,	%f8,	%f24
	fmovsl	%xcc,	%f7,	%f8
	srl	%i2,	%o4,	%i1
	sll	%g3,	%l2,	%i7
	fmovdgu	%xcc,	%f26,	%f15
	movne	%xcc,	%i3,	%o1
	edge8	%g5,	%l5,	%i5
	fmuld8sux16	%f1,	%f20,	%f30
	srax	%g6,	%g2,	%o3
	orncc	%l1,	%o5,	%i4
	edge8ln	%l3,	%l0,	%i0
	add	%o6,	0x0C49,	%o2
	edge32ln	%i6,	%l4,	%g7
	siam	0x7
	nop
	set	0x16, %o7
	sth	%g4,	[%l7 + %o7]
	pdist	%f26,	%f8,	%f18
	fmovsa	%xcc,	%f3,	%f5
	pdist	%f28,	%f4,	%f30
	edge32	%o7,	%l6,	%g1
	array16	%o0,	%i2,	%o4
	movgu	%xcc,	%i1,	%l2
	sth	%i7,	[%l7 + 0x2A]
	edge8l	%i3,	%g3,	%g5
	fmovsgu	%xcc,	%f30,	%f5
	orn	%o1,	%i5,	%g6
	movn	%xcc,	%g2,	%o3
	std	%f30,	[%l7 + 0x58]
	ldsw	[%l7 + 0x10],	%l1
	ldx	[%l7 + 0x30],	%l5
	edge8n	%i4,	%l3,	%l0
	umulcc	%o5,	%i0,	%o6
	sub	%i6,	0x0BE2,	%l4
	smul	%g7,	0x0533,	%g4
	alignaddrl	%o2,	%l6,	%o7
	edge32l	%o0,	%i2,	%g1
	fnot1s	%f15,	%f3
	edge16l	%i1,	%l2,	%o4
	popc	%i3,	%g3
	fcmpes	%fcc2,	%f25,	%f0
	move	%xcc,	%i7,	%g5
	array16	%o1,	%i5,	%g6
	stw	%g2,	[%l7 + 0x2C]
	sth	%o3,	[%l7 + 0x7C]
	addccc	%l1,	0x151A,	%l5
	edge32	%l3,	%i4,	%o5
	movrlez	%l0,	0x06D,	%i0
	movcs	%icc,	%i6,	%o6
	fmovrde	%g7,	%f20,	%f2
	alignaddrl	%g4,	%l4,	%l6
	fmul8sux16	%f26,	%f2,	%f22
	movre	%o2,	0x311,	%o7
	std	%f22,	[%l7 + 0x48]
	fmovsvc	%icc,	%f0,	%f18
	fzeros	%f7
	orncc	%o0,	0x0AD1,	%i2
	edge16l	%i1,	%g1,	%o4
	restore %i3, %l2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%xcc,	%f12,	%f6
	lduw	[%l7 + 0x24],	%g5
	alignaddrl	%g3,	%o1,	%g6
	stx	%g2,	[%l7 + 0x50]
	sdivx	%i5,	0x0A88,	%l1
	movcs	%icc,	%l5,	%l3
	movg	%xcc,	%o3,	%i4
	movrgz	%o5,	%l0,	%i0
	movrgez	%o6,	0x3A3,	%i6
	orcc	%g7,	0x15CC,	%l4
	fmovsgu	%xcc,	%f5,	%f2
	sll	%g4,	%l6,	%o7
	edge16n	%o0,	%i2,	%o2
	fands	%f6,	%f6,	%f2
	stb	%i1,	[%l7 + 0x6C]
	addcc	%o4,	%i3,	%l2
	for	%f26,	%f16,	%f6
	ldd	[%l7 + 0x30],	%f6
	edge16ln	%g1,	%g5,	%g3
	srax	%i7,	0x1B,	%g6
	std	%f30,	[%l7 + 0x18]
	fmovdpos	%xcc,	%f14,	%f1
	xorcc	%o1,	%i5,	%g2
	edge16l	%l1,	%l5,	%l3
	udivcc	%o3,	0x16D3,	%o5
	fmovd	%f22,	%f28
	movg	%xcc,	%l0,	%i4
	fmovdneg	%icc,	%f0,	%f0
	mulscc	%o6,	%i6,	%i0
	xorcc	%l4,	%g7,	%g4
	sth	%l6,	[%l7 + 0x32]
	and	%o0,	0x16FE,	%i2
	fzero	%f6
	mulx	%o2,	%i1,	%o4
	movrlez	%o7,	%l2,	%i3
	fcmps	%fcc2,	%f2,	%f26
	fcmpeq32	%f10,	%f4,	%g5
	ldx	[%l7 + 0x70],	%g1
	movre	%i7,	%g3,	%o1
	fmovrdgez	%i5,	%f6,	%f10
	std	%f0,	[%l7 + 0x50]
	fcmple32	%f0,	%f12,	%g6
	save %g2, %l5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	save %o5, %i4, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i6,	0x0B,	%i0
	mulx	%l4,	%o6,	%g4
	udivcc	%g7,	0x07D1,	%l6
	fmovrdlz	%i2,	%f8,	%f28
	sub	%o2,	%i1,	%o4
	orncc	%o7,	%o0,	%l2
	sub	%g5,	0x1296,	%g1
	fones	%f8
	smulcc	%i3,	0x17CE,	%g3
	sth	%i7,	[%l7 + 0x78]
	xnorcc	%o1,	%i5,	%g6
	movneg	%icc,	%g2,	%l1
	fandnot1s	%f8,	%f12,	%f24
	popc	%o3,	%l3
	ldsw	[%l7 + 0x14],	%o5
	popc	%l5,	%i4
	subcc	%l0,	%i6,	%i0
	movn	%icc,	%o6,	%g4
	fmovrdlz	%g7,	%f8,	%f6
	ldx	[%l7 + 0x60],	%l4
	orn	%i2,	0x130D,	%o2
	siam	0x7
	mulscc	%l6,	0x0296,	%o4
	edge16n	%i1,	%o7,	%l2
	movgu	%icc,	%g5,	%o0
	sll	%i3,	0x1B,	%g1
	fmovdgu	%xcc,	%f17,	%f10
	fmovdgu	%icc,	%f20,	%f14
	umul	%i7,	%g3,	%i5
	movvs	%xcc,	%o1,	%g6
	ldx	[%l7 + 0x70],	%l1
	ldub	[%l7 + 0x59],	%g2
	movneg	%xcc,	%o3,	%o5
	movl	%icc,	%l3,	%l5
	movg	%icc,	%l0,	%i4
	movl	%icc,	%i0,	%o6
	fpsub32s	%f8,	%f25,	%f20
	or	%g4,	0x160B,	%i6
	edge16l	%g7,	%i2,	%o2
	nop
	set	0x68, %g4
	stx	%l6,	[%l7 + %g4]
	movre	%o4,	0x2C0,	%l4
	sll	%i1,	0x02,	%l2
	edge16	%g5,	%o0,	%i3
	movvs	%xcc,	%o7,	%i7
	edge32l	%g1,	%g3,	%i5
	xnor	%o1,	0x13C8,	%l1
	smul	%g2,	0x11F0,	%o3
	fmuld8ulx16	%f22,	%f14,	%f2
	movcc	%xcc,	%g6,	%l3
	edge16l	%o5,	%l0,	%i4
	umul	%i0,	%o6,	%g4
	addccc	%l5,	0x0448,	%i6
	move	%xcc,	%g7,	%o2
	orcc	%l6,	%i2,	%l4
	mulx	%o4,	0x0856,	%l2
	fmovdl	%xcc,	%f25,	%f14
	addc	%i1,	0x1C05,	%g5
	fcmpgt32	%f18,	%f26,	%i3
	sdiv	%o7,	0x177A,	%i7
	ldx	[%l7 + 0x30],	%g1
	fpadd16	%f26,	%f28,	%f18
	mova	%xcc,	%o0,	%i5
	ldd	[%l7 + 0x10],	%o0
	edge16l	%g3,	%g2,	%o3
	fcmple16	%f12,	%f30,	%l1
	addccc	%l3,	0x11A3,	%o5
	sir	0x0E74
	orcc	%g6,	%l0,	%i4
	fcmpeq32	%f8,	%f30,	%i0
	save %g4, %l5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x60],	%i6
	umulcc	%g7,	0x12E3,	%o2
	srl	%l6,	0x1E,	%l4
	movrlez	%i2,	%o4,	%l2
	udivcc	%g5,	0x1727,	%i1
	addccc	%i3,	0x1FBB,	%i7
	fnot1	%f14,	%f4
	mulscc	%o7,	0x0ED6,	%g1
	movrgez	%i5,	%o1,	%g3
	movrgez	%o0,	0x33C,	%g2
	subccc	%l1,	0x04CE,	%o3
	move	%icc,	%l3,	%o5
	mova	%xcc,	%l0,	%g6
	fcmpeq32	%f2,	%f20,	%i0
	fmovd	%f26,	%f28
	sll	%i4,	0x09,	%l5
	sdivx	%o6,	0x12A9,	%i6
	fpmerge	%f19,	%f29,	%f26
	fmovdl	%icc,	%f16,	%f15
	movne	%icc,	%g7,	%o2
	sdivcc	%g4,	0x14EC,	%l6
	movle	%icc,	%i2,	%l4
	stx	%l2,	[%l7 + 0x38]
	orncc	%g5,	%i1,	%i3
	ldsh	[%l7 + 0x36],	%i7
	ldsb	[%l7 + 0x52],	%o4
	stw	%o7,	[%l7 + 0x10]
	alignaddrl	%i5,	%o1,	%g3
	alignaddrl	%o0,	%g1,	%l1
	fmovse	%icc,	%f22,	%f25
	array16	%g2,	%o3,	%l3
	movge	%icc,	%l0,	%g6
	ldx	[%l7 + 0x50],	%i0
	ldsb	[%l7 + 0x63],	%i4
	edge16l	%l5,	%o5,	%o6
	restore %i6, 0x12E9, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o2,	%g4,	%i2
	ldx	[%l7 + 0x28],	%l4
	fmovdge	%xcc,	%f3,	%f6
	movre	%l6,	0x16C,	%l2
	fmovrsgz	%i1,	%f21,	%f28
	stx	%i3,	[%l7 + 0x10]
	sllx	%i7,	%o4,	%o7
	umul	%i5,	0x08A3,	%g5
	for	%f8,	%f0,	%f6
	umulcc	%o1,	0x193B,	%o0
	fmul8x16au	%f8,	%f23,	%f16
	sra	%g3,	0x0A,	%g1
	orcc	%g2,	%o3,	%l3
	mulx	%l0,	0x016D,	%l1
	movrgz	%i0,	0x269,	%g6
	edge32	%i4,	%l5,	%o5
	nop
	set	0x28, %o5
	ldsb	[%l7 + %o5],	%i6
	sir	0x1841
	sub	%g7,	%o2,	%g4
	nop
	set	0x08, %i1
	lduw	[%l7 + %i1],	%o6
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	edge32n	%l2,	%i1,	%i7
	for	%f16,	%f14,	%f18
	umul	%o4,	0x0E49,	%o7
	std	%f24,	[%l7 + 0x18]
	movcs	%icc,	%i3,	%i5
	nop
	set	0x28, %i2
	std	%f6,	[%l7 + %i2]
	pdist	%f0,	%f22,	%f28
	edge32	%o1,	%o0,	%g5
	movl	%icc,	%g1,	%g3
	nop
	set	0x6E, %g5
	ldsh	[%l7 + %g5],	%g2
	orcc	%l3,	%l0,	%o3
	fpsub16	%f28,	%f6,	%f8
	array32	%l1,	%g6,	%i4
	ld	[%l7 + 0x70],	%f10
	fnor	%f12,	%f6,	%f6
	std	%f12,	[%l7 + 0x70]
	sub	%i0,	%o5,	%i6
	and	%l5,	%o2,	%g7
	subcc	%g4,	0x0BC9,	%l4
	movne	%icc,	%o6,	%i2
	mova	%icc,	%l2,	%i1
	edge8n	%l6,	%i7,	%o4
	srlx	%o7,	%i3,	%i5
	ldsh	[%l7 + 0x48],	%o0
	addc	%o1,	0x05B0,	%g5
	addcc	%g1,	0x17D1,	%g2
	edge8l	%l3,	%l0,	%o3
	fmovdvc	%xcc,	%f19,	%f14
	xnor	%l1,	0x1847,	%g6
	sub	%g3,	0x137D,	%i0
	fmovrslez	%o5,	%f7,	%f4
	fandnot1	%f26,	%f26,	%f26
	movgu	%xcc,	%i4,	%i6
	subc	%l5,	%g7,	%o2
	stw	%g4,	[%l7 + 0x4C]
	udivcc	%l4,	0x0FAF,	%o6
	fmovscc	%xcc,	%f2,	%f3
	nop
	set	0x46, %g1
	lduh	[%l7 + %g1],	%l2
	movrgz	%i2,	0x10A,	%l6
	addc	%i7,	0x081D,	%i1
	fxnors	%f15,	%f10,	%f20
	sdivx	%o7,	0x1ACD,	%o4
	edge16l	%i5,	%o0,	%o1
	subcc	%i3,	0x0FE9,	%g1
	fmul8ulx16	%f28,	%f10,	%f14
	movneg	%icc,	%g5,	%l3
	fcmple32	%f2,	%f12,	%l0
	ldd	[%l7 + 0x38],	%f30
	movle	%xcc,	%o3,	%g2
	fcmped	%fcc2,	%f8,	%f18
	movvc	%xcc,	%g6,	%g3
	movleu	%xcc,	%i0,	%l1
	ldsh	[%l7 + 0x0A],	%i4
	mulscc	%i6,	%o5,	%l5
	movgu	%icc,	%o2,	%g7
	movcs	%icc,	%g4,	%o6
	fmul8x16au	%f6,	%f16,	%f20
	sdivx	%l2,	0x165A,	%l4
	ld	[%l7 + 0x6C],	%f5
	edge8ln	%i2,	%l6,	%i7
	save %i1, 0x0445, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i5,	%o4,	%o0
	movn	%xcc,	%i3,	%g1
	edge32ln	%o1,	%l3,	%l0
	array32	%g5,	%g2,	%o3
	movrgz	%g6,	0x050,	%g3
	andncc	%i0,	%l1,	%i6
	ldd	[%l7 + 0x48],	%i4
	st	%f22,	[%l7 + 0x5C]
	umulcc	%l5,	0x00C6,	%o2
	edge16l	%g7,	%g4,	%o6
	fmuld8sux16	%f2,	%f27,	%f2
	alignaddr	%l2,	%l4,	%o5
	ldx	[%l7 + 0x28],	%l6
	orncc	%i7,	%i2,	%i1
	fmovsvs	%icc,	%f21,	%f13
	ldd	[%l7 + 0x68],	%f18
	fpmerge	%f12,	%f23,	%f22
	umul	%i5,	%o4,	%o7
	ldsh	[%l7 + 0x5C],	%i3
	edge8ln	%g1,	%o1,	%o0
	edge8n	%l3,	%g5,	%g2
	mulscc	%l0,	0x0A23,	%g6
	edge16ln	%o3,	%g3,	%i0
	addccc	%i6,	%l1,	%l5
	fpadd32s	%f23,	%f26,	%f7
	and	%i4,	0x19E9,	%g7
	movrne	%o2,	%o6,	%g4
	add	%l2,	0x0E46,	%o5
	movpos	%icc,	%l6,	%i7
	fpsub32s	%f4,	%f7,	%f2
	edge8n	%i2,	%l4,	%i5
	fmul8sux16	%f30,	%f30,	%f26
	srlx	%i1,	%o7,	%o4
	fnot1	%f14,	%f16
	restore %g1, %o1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f12,	[%l7 + 0x08]
	fpsub16	%f0,	%f10,	%f14
	addccc	%l3,	0x0835,	%g5
	srl	%o0,	%g2,	%l0
	movgu	%xcc,	%g6,	%o3
	xnor	%g3,	0x011A,	%i0
	fmovrslz	%l1,	%f3,	%f25
	edge16n	%l5,	%i4,	%i6
	subc	%o2,	%o6,	%g4
	umul	%l2,	%o5,	%l6
	stw	%g7,	[%l7 + 0x34]
	stw	%i7,	[%l7 + 0x2C]
	sethi	0x01F4,	%i2
	movvs	%xcc,	%i5,	%i1
	ld	[%l7 + 0x0C],	%f11
	andncc	%l4,	%o7,	%g1
	fone	%f18
	movneg	%icc,	%o1,	%o4
	sth	%l3,	[%l7 + 0x72]
	sth	%g5,	[%l7 + 0x18]
	movrlz	%i3,	%g2,	%o0
	and	%g6,	%o3,	%l0
	movl	%icc,	%g3,	%l1
	movcc	%icc,	%i0,	%i4
	fpadd32s	%f28,	%f16,	%f8
	nop
	set	0x68, %l0
	stb	%i6,	[%l7 + %l0]
	fmovscc	%icc,	%f1,	%f20
	fmovrdlz	%o2,	%f18,	%f28
	addccc	%l5,	0x092B,	%g4
	fcmpd	%fcc1,	%f24,	%f26
	sdivcc	%o6,	0x1005,	%l2
	st	%f23,	[%l7 + 0x78]
	movrne	%o5,	%l6,	%i7
	fmuld8ulx16	%f31,	%f22,	%f26
	array8	%g7,	%i5,	%i2
	edge32l	%l4,	%i1,	%o7
	andncc	%o1,	%g1,	%o4
	movgu	%icc,	%g5,	%l3
	edge16l	%g2,	%o0,	%i3
	alignaddr	%g6,	%o3,	%g3
	stw	%l0,	[%l7 + 0x50]
	fornot2	%f26,	%f6,	%f0
	fmovsvs	%icc,	%f12,	%f14
	xorcc	%l1,	%i0,	%i4
	fmovrdgez	%i6,	%f18,	%f4
	fsrc2	%f16,	%f0
	smulcc	%l5,	0x1DDA,	%g4
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%o6
	alignaddr	%l2,	%o2,	%o5
	fmovd	%f0,	%f20
	mova	%xcc,	%l6,	%g7
	nop
	set	0x28, %o1
	stx	%i5,	[%l7 + %o1]
	movcs	%xcc,	%i7,	%i2
	std	%f24,	[%l7 + 0x28]
	edge8l	%i1,	%l4,	%o7
	fzero	%f26
	array8	%o1,	%g1,	%o4
	array16	%l3,	%g5,	%o0
	orcc	%g2,	0x1A46,	%g6
	mulx	%o3,	%i3,	%l0
	edge16	%l1,	%g3,	%i4
	subccc	%i0,	%i6,	%l5
	siam	0x3
	andn	%g4,	0x107C,	%o6
	sethi	0x0FA1,	%l2
	sllx	%o5,	0x15,	%o2
	xnorcc	%l6,	%g7,	%i7
	sdivcc	%i2,	0x1A7E,	%i5
	fnot1s	%f20,	%f29
	fcmple16	%f20,	%f0,	%l4
	ld	[%l7 + 0x0C],	%f17
	addcc	%i1,	%o1,	%o7
	edge8l	%o4,	%l3,	%g1
	movcs	%icc,	%g5,	%g2
	fmovdcs	%icc,	%f10,	%f18
	sir	0x155A
	movn	%icc,	%g6,	%o3
	array8	%o0,	%i3,	%l1
	edge16n	%g3,	%i4,	%l0
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%f24
	fmul8x16al	%f0,	%f0,	%f28
	sth	%i6,	[%l7 + 0x36]
	fmovdge	%icc,	%f23,	%f21
	add	%i0,	%l5,	%g4
	udivx	%l2,	0x0B8F,	%o5
	movvc	%icc,	%o6,	%o2
	nop
	set	0x68, %l5
	stx	%l6,	[%l7 + %l5]
	srax	%i7,	%g7,	%i5
	subc	%i2,	0x09BE,	%i1
	smulcc	%o1,	%l4,	%o4
	xnorcc	%l3,	0x1AD5,	%o7
	movleu	%icc,	%g1,	%g2
	or	%g6,	0x05A9,	%o3
	edge8n	%g5,	%o0,	%l1
	stw	%i3,	[%l7 + 0x1C]
	fsrc1	%f10,	%f26
	fxnor	%f6,	%f28,	%f0
	subccc	%i4,	%g3,	%i6
	xorcc	%l0,	%i0,	%l5
	fmovde	%xcc,	%f31,	%f31
	fnands	%f30,	%f11,	%f3
	fmovspos	%xcc,	%f20,	%f29
	udivcc	%g4,	0x1F99,	%o5
	sllx	%l2,	0x0C,	%o6
	ldsb	[%l7 + 0x35],	%o2
	fmovdle	%xcc,	%f9,	%f10
	fmovse	%icc,	%f19,	%f24
	and	%l6,	%i7,	%i5
	and	%g7,	0x17CF,	%i2
	smul	%i1,	%o1,	%o4
	ldd	[%l7 + 0x20],	%f24
	fmovsvc	%xcc,	%f7,	%f19
	array8	%l4,	%l3,	%g1
	stb	%g2,	[%l7 + 0x1E]
	movneg	%icc,	%o7,	%g6
	orncc	%g5,	0x07BF,	%o0
	addccc	%l1,	%o3,	%i3
	and	%i4,	%g3,	%i6
	andn	%l0,	%i0,	%g4
	movvc	%icc,	%l5,	%o5
	movneg	%icc,	%o6,	%o2
	edge8ln	%l6,	%l2,	%i7
	udivcc	%i5,	0x0D04,	%i2
	popc	%g7,	%i1
	edge32	%o4,	%l4,	%l3
	xnorcc	%o1,	%g2,	%o7
	save %g6, 0x0A28, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o0,	0x0D,	%g5
	smulcc	%o3,	0x1F9C,	%l1
	fmovsle	%xcc,	%f6,	%f11
	xorcc	%i3,	0x1102,	%g3
	movrgez	%i6,	0x301,	%l0
	srl	%i0,	0x0B,	%g4
	std	%f26,	[%l7 + 0x18]
	fsrc1	%f8,	%f12
	array8	%i4,	%o5,	%o6
	subcc	%l5,	0x089B,	%l6
	array8	%o2,	%i7,	%i5
	umul	%l2,	0x1D69,	%i2
	edge8l	%g7,	%i1,	%l4
	fones	%f6
	movcc	%icc,	%o4,	%l3
	fmovse	%icc,	%f27,	%f25
	fpadd16	%f6,	%f18,	%f28
	mulscc	%o1,	%o7,	%g2
	fmovdpos	%xcc,	%f3,	%f24
	sth	%g1,	[%l7 + 0x6E]
	edge16n	%o0,	%g6,	%o3
	nop
	set	0x78, %g3
	ldx	[%l7 + %g3],	%g5
	andcc	%i3,	%l1,	%g3
	movle	%xcc,	%l0,	%i0
	sethi	0x109E,	%i6
	fcmple32	%f0,	%f30,	%i4
	fpsub16s	%f4,	%f0,	%f19
	save %g4, 0x0131, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o6,	%l5,	%l6
	movrgz	%o2,	0x292,	%i5
	ldd	[%l7 + 0x50],	%l2
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	sth	%i2,	[%l7 + 0x2E]
	st	%f12,	[%l7 + 0x58]
	fmovda	%icc,	%f13,	%f3
	fpmerge	%f9,	%f29,	%f26
	ldub	[%l7 + 0x36],	%o4
	orncc	%l4,	%l3,	%o7
	ldd	[%l7 + 0x78],	%o0
	array32	%g2,	%g1,	%g6
	udivcc	%o3,	0x1DE8,	%g5
	subcc	%i3,	0x18DD,	%l1
	sll	%g3,	0x1A,	%l0
	fmul8sux16	%f4,	%f20,	%f28
	movl	%xcc,	%o0,	%i6
	movrne	%i0,	%g4,	%i4
	movrgez	%o5,	%o6,	%l5
	umulcc	%o2,	0x057B,	%i5
	xorcc	%l2,	%i7,	%g7
	movge	%icc,	%l6,	%i1
	edge16n	%o4,	%i2,	%l4
	fmul8sux16	%f6,	%f10,	%f12
	fors	%f6,	%f9,	%f29
	xorcc	%l3,	0x0309,	%o1
	orcc	%g2,	%g1,	%g6
	for	%f4,	%f14,	%f30
	fcmple16	%f2,	%f6,	%o7
	fpack32	%f14,	%f10,	%f16
	movvc	%icc,	%g5,	%o3
	fcmpgt32	%f28,	%f6,	%l1
	siam	0x1
	edge8n	%g3,	%l0,	%o0
	ldub	[%l7 + 0x42],	%i3
	array32	%i6,	%i0,	%i4
	movgu	%icc,	%g4,	%o5
	edge8	%o6,	%o2,	%i5
	sir	0x07C7
	movvs	%xcc,	%l2,	%i7
	sdivcc	%g7,	0x00FC,	%l6
	fmovse	%icc,	%f30,	%f22
	movrlez	%l5,	0x02B,	%i1
	movl	%icc,	%o4,	%i2
	movrne	%l3,	0x039,	%l4
	ldd	[%l7 + 0x30],	%o0
	edge8n	%g1,	%g2,	%g6
	lduw	[%l7 + 0x24],	%o7
	umulcc	%o3,	%g5,	%l1
	srax	%g3,	%o0,	%l0
	ldsh	[%l7 + 0x0E],	%i3
	fsrc2	%f28,	%f4
	mulx	%i0,	%i6,	%g4
	fmul8x16	%f27,	%f4,	%f6
	orncc	%i4,	0x1053,	%o6
	edge16l	%o5,	%o2,	%l2
	lduw	[%l7 + 0x64],	%i7
	edge16	%g7,	%i5,	%l6
	movleu	%icc,	%i1,	%o4
	sdiv	%i2,	0x0BC9,	%l5
	andncc	%l3,	%o1,	%g1
	sll	%l4,	%g2,	%o7
	xorcc	%o3,	0x0099,	%g5
	edge16n	%g6,	%l1,	%g3
	fmovsn	%xcc,	%f10,	%f6
	movpos	%icc,	%o0,	%i3
	fcmpd	%fcc3,	%f28,	%f20
	ldd	[%l7 + 0x60],	%f0
	orncc	%l0,	%i0,	%g4
	sethi	0x183E,	%i6
	edge8l	%i4,	%o5,	%o2
	edge32ln	%o6,	%l2,	%g7
	stb	%i5,	[%l7 + 0x77]
	smul	%l6,	%i1,	%o4
	smul	%i2,	%i7,	%l5
	andncc	%o1,	%l3,	%g1
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%f14
	sdivcc	%l4,	0x0EF8,	%g2
	fabss	%f18,	%f29
	smul	%o7,	0x0837,	%o3
	edge8ln	%g6,	%l1,	%g3
	save %o0, 0x0AE0, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l0,	%i0
	edge8ln	%g4,	%i3,	%i6
	movcc	%xcc,	%i4,	%o2
	movleu	%xcc,	%o6,	%o5
	movleu	%icc,	%l2,	%i5
	movneg	%icc,	%g7,	%i1
	st	%f16,	[%l7 + 0x54]
	fmovsle	%xcc,	%f31,	%f0
	movrgez	%l6,	%i2,	%i7
	xnorcc	%o4,	%o1,	%l5
	movrgz	%l3,	%l4,	%g1
	movrlez	%o7,	0x2BB,	%o3
	movcs	%icc,	%g6,	%l1
	fmovsgu	%xcc,	%f9,	%f0
	nop
	set	0x50, %l1
	stx	%g2,	[%l7 + %l1]
	std	%f30,	[%l7 + 0x50]
	movleu	%icc,	%o0,	%g5
	sllx	%l0,	0x10,	%g3
	umulcc	%g4,	%i0,	%i6
	subcc	%i4,	%i3,	%o2
	movle	%icc,	%o6,	%o5
	array32	%l2,	%i5,	%g7
	popc	%i1,	%l6
	addc	%i7,	%o4,	%i2
	addc	%l5,	0x03DB,	%o1
	addcc	%l4,	%g1,	%l3
	ldsw	[%l7 + 0x5C],	%o7
	st	%f23,	[%l7 + 0x18]
	ldsw	[%l7 + 0x10],	%g6
	add	%l1,	0x1467,	%g2
	fabss	%f14,	%f10
	and	%o3,	%g5,	%o0
	edge16ln	%l0,	%g4,	%i0
	fmovsleu	%xcc,	%f20,	%f16
	edge8	%i6,	%g3,	%i4
	edge8ln	%o2,	%i3,	%o6
	ldub	[%l7 + 0x36],	%l2
	movl	%icc,	%o5,	%i5
	move	%xcc,	%g7,	%i1
	movle	%xcc,	%l6,	%i7
	movrne	%i2,	0x12A,	%l5
	sllx	%o4,	0x17,	%l4
	movrgz	%o1,	%g1,	%o7
	subccc	%l3,	%l1,	%g2
	srl	%g6,	%o3,	%o0
	fandnot1s	%f22,	%f17,	%f27
	ld	[%l7 + 0x44],	%f7
	srlx	%l0,	0x0B,	%g4
	fmovs	%f15,	%f11
	sdivcc	%g5,	0x1051,	%i6
	edge16	%g3,	%i0,	%o2
	ld	[%l7 + 0x54],	%f1
	movn	%icc,	%i4,	%o6
	subccc	%i3,	0x1B6B,	%o5
	fands	%f3,	%f11,	%f13
	andncc	%l2,	%i5,	%g7
	ldd	[%l7 + 0x48],	%i0
	lduh	[%l7 + 0x18],	%l6
	udivx	%i7,	0x1E28,	%i2
	ldsb	[%l7 + 0x66],	%l5
	add	%o4,	0x0A21,	%l4
	move	%icc,	%o1,	%o7
	movrlz	%l3,	%g1,	%l1
	ld	[%l7 + 0x2C],	%f13
	move	%icc,	%g2,	%g6
	edge8	%o0,	%o3,	%g4
	sth	%g5,	[%l7 + 0x0C]
	movrgez	%i6,	%l0,	%g3
	lduw	[%l7 + 0x08],	%o2
	sdivx	%i4,	0x1631,	%i0
	movg	%xcc,	%o6,	%i3
	fmovda	%xcc,	%f31,	%f5
	or	%l2,	0x129C,	%o5
	sdiv	%i5,	0x0D73,	%i1
	movle	%icc,	%g7,	%l6
	addccc	%i2,	0x071D,	%l5
	and	%o4,	0x02A2,	%l4
	alignaddr	%o1,	%o7,	%i7
	fone	%f16
	fandnot1	%f22,	%f8,	%f4
	edge32ln	%g1,	%l1,	%g2
	ldsb	[%l7 + 0x2C],	%g6
	array32	%o0,	%l3,	%o3
	fxors	%f15,	%f19,	%f10
	restore %g5, %g4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f12,	%f6,	%f24
	sub	%l0,	%o2,	%i4
	subccc	%i0,	0x13EC,	%g3
	fsrc2	%f28,	%f12
	fnor	%f24,	%f12,	%f28
	ldx	[%l7 + 0x50],	%i3
	fmovsneg	%xcc,	%f30,	%f4
	popc	0x06C3,	%o6
	sra	%o5,	%l2,	%i5
	fandnot1	%f10,	%f24,	%f10
	movrlz	%g7,	0x217,	%l6
	mulscc	%i1,	0x05C8,	%i2
	fmul8sux16	%f24,	%f10,	%f10
	movrne	%o4,	%l5,	%l4
	fmovdcc	%icc,	%f25,	%f31
	lduw	[%l7 + 0x34],	%o1
	subccc	%i7,	%o7,	%l1
	edge8ln	%g1,	%g2,	%o0
	sdivx	%g6,	0x082F,	%o3
	srl	%l3,	%g4,	%i6
	udivcc	%g5,	0x08CB,	%l0
	edge32n	%o2,	%i0,	%i4
	mulx	%g3,	0x1F08,	%o6
	addc	%i3,	%l2,	%i5
	movle	%icc,	%g7,	%o5
	fzero	%f28
	save %l6, 0x0D43, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%xcc,	%f17,	%f5
	xnorcc	%i1,	0x1FAE,	%l5
	movre	%o4,	%o1,	%l4
	addccc	%o7,	%l1,	%i7
	umul	%g1,	0x0B9C,	%g2
	fmul8x16	%f29,	%f30,	%f2
	add	%o0,	0x1F54,	%o3
	xor	%g6,	0x1BE8,	%g4
	edge8	%i6,	%l3,	%l0
	udivx	%g5,	0x01EC,	%o2
	fmovrdgez	%i4,	%f26,	%f0
	lduw	[%l7 + 0x24],	%i0
	move	%icc,	%g3,	%o6
	stw	%l2,	[%l7 + 0x14]
	udivx	%i5,	0x0702,	%g7
	addccc	%o5,	0x0EF9,	%l6
	movle	%icc,	%i2,	%i3
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	siam	0x2
	subcc	%i1,	0x034E,	%o7
	movrgz	%l1,	%i7,	%l4
	nop
	set	0x40, %l3
	stw	%g2,	[%l7 + %l3]
	xor	%o0,	0x0AD8,	%g1
	array16	%g6,	%g4,	%i6
	edge32l	%o3,	%l3,	%g5
	sir	0x15EB
	sub	%o2,	%l0,	%i0
	movcs	%icc,	%i4,	%g3
	add	%l2,	0x0C3E,	%i5
	movrlz	%g7,	%o5,	%l6
	fmul8sux16	%f8,	%f30,	%f0
	fmovrsgz	%i2,	%f8,	%f5
	mova	%icc,	%o6,	%l5
	fmovrdgez	%o4,	%f20,	%f4
	xor	%i3,	0x1DF5,	%i1
	ldsw	[%l7 + 0x14],	%o7
	sir	0x0D73
	ldub	[%l7 + 0x53],	%l1
	movge	%xcc,	%i7,	%l4
	ldd	[%l7 + 0x30],	%g2
	orn	%o0,	0x048E,	%o1
	array16	%g6,	%g1,	%i6
	mulscc	%o3,	%l3,	%g4
	edge8	%g5,	%o2,	%i0
	fnot2s	%f7,	%f16
	movrlz	%l0,	0x01C,	%g3
	array8	%l2,	%i4,	%i5
	movn	%icc,	%g7,	%o5
	fsrc1	%f26,	%f6
	andn	%l6,	0x18D1,	%o6
	st	%f5,	[%l7 + 0x74]
	movrgz	%l5,	0x2FD,	%i2
	sethi	0x17E9,	%o4
	movleu	%icc,	%i1,	%o7
	movrgez	%l1,	%i3,	%l4
	xnor	%g2,	0x1E2E,	%i7
	movle	%xcc,	%o0,	%g6
	restore %o1, 0x0FA9, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o3,	%g1,	%l3
	srax	%g5,	%o2,	%i0
	alignaddr	%l0,	%g3,	%l2
	sll	%g4,	0x0D,	%i4
	fmovdn	%icc,	%f14,	%f14
	andcc	%g7,	%o5,	%l6
	edge32n	%i5,	%o6,	%l5
	move	%xcc,	%o4,	%i2
	fmovdg	%xcc,	%f31,	%f23
	fnot2	%f0,	%f8
	edge8ln	%o7,	%l1,	%i3
	for	%f8,	%f28,	%f4
	addcc	%i1,	0x1417,	%l4
	xnor	%i7,	%o0,	%g2
	fpsub16s	%f6,	%f16,	%f0
	fcmpne32	%f0,	%f8,	%o1
	fmovd	%f14,	%f16
	subc	%g6,	%i6,	%g1
	movcs	%icc,	%l3,	%o3
	srl	%g5,	%o2,	%i0
	movcc	%icc,	%g3,	%l0
	xnorcc	%l2,	%i4,	%g4
	ldd	[%l7 + 0x58],	%g6
	andncc	%o5,	%i5,	%l6
	andcc	%l5,	%o6,	%i2
	fmovdge	%icc,	%f29,	%f6
	fmovsneg	%xcc,	%f2,	%f14
	fpsub32s	%f0,	%f12,	%f3
	edge8ln	%o7,	%l1,	%i3
	stw	%o4,	[%l7 + 0x3C]
	ld	[%l7 + 0x60],	%f18
	alignaddrl	%l4,	%i1,	%o0
	edge8l	%i7,	%o1,	%g6
	alignaddrl	%i6,	%g1,	%l3
	sll	%g2,	%g5,	%o3
	fnand	%f20,	%f20,	%f2
	movrne	%i0,	0x20F,	%o2
	addcc	%l0,	0x1B84,	%l2
	fcmpgt32	%f18,	%f24,	%i4
	fabsd	%f22,	%f2
	fcmped	%fcc1,	%f18,	%f20
	fabsd	%f14,	%f4
	st	%f16,	[%l7 + 0x64]
	movn	%xcc,	%g4,	%g3
	udivx	%o5,	0x079A,	%g7
	subccc	%i5,	%l5,	%l6
	movcc	%xcc,	%o6,	%i2
	movcc	%icc,	%l1,	%i3
	movgu	%xcc,	%o4,	%l4
	xor	%i1,	%o7,	%o0
	fmul8sux16	%f0,	%f22,	%f22
	edge16	%i7,	%o1,	%i6
	srl	%g6,	0x19,	%l3
	movvc	%xcc,	%g1,	%g2
	addcc	%o3,	0x0BDC,	%g5
	and	%i0,	%l0,	%o2
	fmovdgu	%xcc,	%f9,	%f15
	fcmps	%fcc3,	%f25,	%f30
	xnor	%i4,	%g4,	%g3
	siam	0x3
	edge8	%o5,	%g7,	%i5
	save %l2, %l5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i2,	%l6,	%l1
	xorcc	%o4,	0x1693,	%i3
	subc	%l4,	%o7,	%o0
	udivx	%i1,	0x0DD9,	%o1
	sra	%i6,	0x1E,	%i7
	lduh	[%l7 + 0x76],	%g6
	fpsub16s	%f12,	%f14,	%f11
	smulcc	%g1,	0x093E,	%g2
	srlx	%o3,	0x1E,	%l3
	movge	%icc,	%i0,	%g5
	smulcc	%l0,	0x107E,	%o2
	popc	0x0ACD,	%i4
	movcs	%xcc,	%g3,	%g4
	fsrc2	%f26,	%f0
	xor	%o5,	0x0B8A,	%g7
	or	%i5,	%l2,	%l5
	add	%o6,	0x1782,	%l6
	edge8n	%i2,	%o4,	%i3
	umul	%l4,	0x0BAB,	%o7
	movvs	%xcc,	%o0,	%i1
	srl	%o1,	%i6,	%l1
	array32	%g6,	%i7,	%g1
	fmovrslz	%o3,	%f31,	%f17
	movre	%g2,	%l3,	%g5
	popc	0x14D0,	%i0
	addcc	%l0,	%o2,	%g3
	xorcc	%g4,	%i4,	%g7
	edge16n	%o5,	%i5,	%l2
	st	%f27,	[%l7 + 0x78]
	move	%icc,	%l5,	%l6
	st	%f10,	[%l7 + 0x30]
	smul	%i2,	0x09AA,	%o4
	orcc	%o6,	%i3,	%o7
	edge16ln	%o0,	%l4,	%i1
	fmovrdne	%o1,	%f22,	%f10
	sllx	%l1,	%i6,	%g6
	edge16	%i7,	%g1,	%g2
	sub	%l3,	%o3,	%i0
	subcc	%l0,	0x11C9,	%o2
	srlx	%g5,	0x09,	%g3
	ldd	[%l7 + 0x28],	%i4
	edge32n	%g4,	%g7,	%o5
	movrne	%l2,	0x177,	%l5
	ld	[%l7 + 0x08],	%f1
	sdiv	%l6,	0x17AF,	%i5
	sllx	%i2,	%o6,	%i3
	ldsb	[%l7 + 0x1A],	%o4
	movcc	%icc,	%o0,	%l4
	movg	%xcc,	%i1,	%o1
	edge8ln	%l1,	%i6,	%o7
	alignaddrl	%i7,	%g1,	%g2
	st	%f26,	[%l7 + 0x54]
	stw	%l3,	[%l7 + 0x68]
	st	%f30,	[%l7 + 0x34]
	umul	%g6,	%i0,	%l0
	udivcc	%o2,	0x02FA,	%g5
	xnor	%o3,	0x0D98,	%i4
	stw	%g3,	[%l7 + 0x60]
	edge32n	%g7,	%o5,	%l2
	sdivcc	%g4,	0x005B,	%l5
	addcc	%i5,	0x0370,	%l6
	st	%f0,	[%l7 + 0x70]
	subccc	%i2,	0x188F,	%i3
	fornot2	%f0,	%f8,	%f4
	xnor	%o6,	0x0A14,	%o0
	sdivcc	%l4,	0x131A,	%o4
	edge8n	%o1,	%i1,	%i6
	addcc	%o7,	0x1825,	%l1
	addc	%g1,	0x0392,	%i7
	std	%f20,	[%l7 + 0x48]
	movrlez	%g2,	0x2D7,	%l3
	fcmpne16	%f18,	%f4,	%g6
	fmovd	%f8,	%f22
	array16	%l0,	%i0,	%o2
	edge8ln	%o3,	%i4,	%g3
	edge16	%g7,	%o5,	%l2
	save %g5, 0x1ACC, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l5,	%l6,	%i2
	udivx	%i3,	0x14C1,	%o6
	xor	%i5,	%o0,	%o4
	lduh	[%l7 + 0x76],	%o1
	fnegs	%f10,	%f18
	movvc	%icc,	%i1,	%l4
	st	%f9,	[%l7 + 0x28]
	and	%i6,	%o7,	%g1
	subc	%i7,	0x0090,	%l1
	movleu	%icc,	%g2,	%g6
	umulcc	%l3,	%l0,	%i0
	udiv	%o2,	0x101C,	%i4
	udiv	%g3,	0x166F,	%g7
	addcc	%o3,	%l2,	%g5
	fnot2s	%f21,	%f9
	fmovscc	%xcc,	%f27,	%f29
	fmovd	%f28,	%f2
	ldub	[%l7 + 0x7B],	%o5
	fmovrdlez	%g4,	%f26,	%f8
	movrne	%l6,	0x0A0,	%l5
	st	%f12,	[%l7 + 0x68]
	nop
	set	0x10, %o0
	ldx	[%l7 + %o0],	%i2
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	udivx	%i5,	0x0F66,	%o4
	xor	%o0,	0x1333,	%i1
	udivx	%o1,	0x0F98,	%l4
	edge8l	%i6,	%g1,	%o7
	fnot1	%f2,	%f10
	udivcc	%i7,	0x0367,	%l1
	edge32l	%g2,	%l3,	%g6
	movcs	%xcc,	%l0,	%i0
	addcc	%o2,	%i4,	%g3
	edge32	%g7,	%o3,	%g5
	movcs	%xcc,	%o5,	%g4
	xnor	%l2,	%l6,	%l5
	fcmple16	%f16,	%f18,	%i3
	std	%f26,	[%l7 + 0x08]
	fmovdleu	%icc,	%f6,	%f7
	andn	%o6,	%i2,	%i5
	fmovsneg	%xcc,	%f22,	%f30
	stb	%o4,	[%l7 + 0x77]
	sdivcc	%o0,	0x1753,	%o1
	fornot2s	%f25,	%f28,	%f10
	for	%f26,	%f12,	%f14
	mulscc	%i1,	0x0554,	%i6
	sllx	%g1,	0x15,	%o7
	add	%l4,	0x11D0,	%i7
	edge8n	%l1,	%l3,	%g2
	fandnot1	%f18,	%f10,	%f2
	sra	%l0,	%i0,	%o2
	mova	%xcc,	%g6,	%g3
	andcc	%i4,	%o3,	%g5
	sethi	0x0577,	%g7
	ldd	[%l7 + 0x50],	%o4
	fmovda	%xcc,	%f7,	%f6
	movvs	%xcc,	%l2,	%g4
	movre	%l5,	0x3E0,	%i3
	fmovrslez	%o6,	%f31,	%f4
	sub	%i2,	0x055E,	%l6
	srax	%o4,	%i5,	%o0
	xnorcc	%o1,	0x0ECF,	%i6
	movvs	%icc,	%g1,	%o7
	fnors	%f3,	%f3,	%f10
	umulcc	%i1,	%l4,	%l1
	movvs	%icc,	%i7,	%l3
	orcc	%l0,	%g2,	%o2
	ldd	[%l7 + 0x48],	%g6
	smulcc	%g3,	0x153E,	%i0
	umul	%o3,	0x1196,	%i4
	movrlz	%g7,	0x310,	%g5
	movleu	%xcc,	%l2,	%o5
	st	%f12,	[%l7 + 0x40]
	movrne	%g4,	0x10A,	%l5
	move	%xcc,	%i3,	%i2
	fmovrdne	%o6,	%f4,	%f0
	popc	0x0E36,	%o4
	fzeros	%f19
	orn	%l6,	%o0,	%o1
	popc	0x0667,	%i6
	xnorcc	%g1,	0x160C,	%o7
	udivx	%i1,	0x0AC9,	%l4
	nop
	set	0x32, %l6
	ldsb	[%l7 + %l6],	%i5
	edge32l	%l1,	%i7,	%l3
	fone	%f0
	pdist	%f8,	%f16,	%f24
	fmovdle	%icc,	%f1,	%f28
	addcc	%l0,	0x0AB5,	%g2
	srax	%g6,	0x0B,	%o2
	movrlez	%i0,	%o3,	%i4
	udivcc	%g7,	0x1ABD,	%g5
	or	%l2,	0x154D,	%o5
	movne	%icc,	%g3,	%g4
	fmovsvc	%icc,	%f12,	%f31
	mulscc	%i3,	%l5,	%i2
	xnorcc	%o6,	%o4,	%o0
	lduw	[%l7 + 0x40],	%o1
	movge	%xcc,	%l6,	%i6
	movgu	%xcc,	%g1,	%i1
	sdivx	%o7,	0x021A,	%i5
	array16	%l1,	%l4,	%i7
	movneg	%icc,	%l3,	%g2
	fmovrslez	%l0,	%f15,	%f15
	fmovrdne	%g6,	%f16,	%f26
	std	%f22,	[%l7 + 0x78]
	fmovsl	%xcc,	%f23,	%f14
	edge16l	%i0,	%o2,	%o3
	smul	%g7,	0x056E,	%g5
	movre	%l2,	0x255,	%i4
	fabsd	%f6,	%f0
	sethi	0x133E,	%o5
	std	%f6,	[%l7 + 0x08]
	mulx	%g4,	%i3,	%g3
	fmovdge	%icc,	%f29,	%f26
	array32	%l5,	%o6,	%i2
	movrgez	%o0,	%o1,	%l6
	orcc	%o4,	%g1,	%i1
	fpack32	%f18,	%f6,	%f20
	fcmped	%fcc2,	%f12,	%f26
	add	%o7,	0x0869,	%i5
	movpos	%xcc,	%i6,	%l1
	addc	%l4,	%i7,	%l3
	movcs	%icc,	%l0,	%g2
	fmovde	%icc,	%f23,	%f3
	sdiv	%g6,	0x001C,	%i0
	fmovdleu	%icc,	%f28,	%f0
	fornot1s	%f14,	%f14,	%f10
	fcmpd	%fcc1,	%f20,	%f26
	nop
	set	0x30, %g2
	stw	%o2,	[%l7 + %g2]
	edge32n	%g7,	%g5,	%o3
	and	%l2,	0x13CB,	%i4
	edge16l	%g4,	%i3,	%g3
	movrlz	%l5,	%o5,	%o6
	movge	%icc,	%o0,	%i2
	movneg	%xcc,	%l6,	%o4
	fpmerge	%f20,	%f27,	%f4
	mulx	%g1,	0x12D6,	%i1
	array8	%o1,	%i5,	%o7
	andn	%l1,	%l4,	%i6
	edge16n	%l3,	%l0,	%i7
	edge16n	%g2,	%g6,	%o2
	fornot2s	%f3,	%f1,	%f19
	sdivx	%i0,	0x179F,	%g5
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%f12
	fcmpgt16	%f8,	%f16,	%o3
	std	%f2,	[%l7 + 0x40]
	fcmpgt32	%f22,	%f4,	%l2
	fmovdle	%xcc,	%f27,	%f15
	srlx	%i4,	%g4,	%i3
	fmovrsgez	%g7,	%f17,	%f27
	edge8ln	%l5,	%o5,	%o6
	smul	%g3,	%i2,	%l6
	movleu	%xcc,	%o4,	%g1
	ldub	[%l7 + 0x0E],	%o0
	umul	%o1,	0x068D,	%i5
	movvs	%icc,	%i1,	%o7
	movl	%xcc,	%l1,	%i6
	fmovsleu	%icc,	%f15,	%f11
	fpmerge	%f21,	%f17,	%f6
	lduh	[%l7 + 0x0C],	%l4
	fandnot2	%f28,	%f0,	%f18
	fmovsge	%icc,	%f19,	%f4
	array32	%l3,	%l0,	%i7
	sethi	0x0F6D,	%g2
	edge32	%o2,	%g6,	%g5
	fnot1	%f12,	%f0
	fmul8sux16	%f20,	%f2,	%f20
	udiv	%i0,	0x088F,	%l2
	fcmps	%fcc3,	%f0,	%f26
	movge	%icc,	%i4,	%g4
	subccc	%i3,	%g7,	%o3
	sra	%o5,	0x09,	%o6
	addccc	%l5,	%i2,	%l6
	srl	%g3,	%o4,	%o0
	edge16l	%g1,	%o1,	%i1
	sll	%o7,	%l1,	%i6
	movleu	%icc,	%i5,	%l3
	ldsb	[%l7 + 0x30],	%l0
	sdiv	%i7,	0x070C,	%l4
	add	%o2,	%g6,	%g2
	movrlez	%i0,	%l2,	%i4
	edge32	%g5,	%g4,	%g7
	umul	%i3,	%o3,	%o5
	edge32n	%o6,	%l5,	%l6
	srl	%g3,	0x13,	%o4
	fmovrslz	%o0,	%f16,	%f19
	movge	%icc,	%i2,	%g1
	fmovd	%f18,	%f16
	movneg	%icc,	%i1,	%o7
	edge32n	%l1,	%i6,	%i5
	fnot2s	%f13,	%f16
	move	%icc,	%l3,	%l0
	addccc	%i7,	%o1,	%o2
	fmovrdlez	%g6,	%f24,	%f10
	ldsb	[%l7 + 0x3C],	%l4
	ldx	[%l7 + 0x60],	%i0
	udivx	%l2,	0x1920,	%i4
	fmuld8ulx16	%f24,	%f14,	%f6
	stx	%g5,	[%l7 + 0x08]
	fmovsvs	%xcc,	%f25,	%f2
	andcc	%g2,	%g4,	%i3
	ldsb	[%l7 + 0x3F],	%o3
	umul	%g7,	0x0E44,	%o5
	movrlez	%l5,	0x13D,	%l6
	xorcc	%o6,	%g3,	%o4
	array32	%i2,	%g1,	%o0
	xor	%i1,	%l1,	%i6
	orcc	%i5,	%l3,	%o7
	movle	%xcc,	%l0,	%i7
	srlx	%o1,	%o2,	%l4
	sethi	0x1F88,	%i0
	umul	%l2,	0x0D63,	%i4
	edge16l	%g6,	%g5,	%g4
	edge8	%i3,	%o3,	%g2
	addc	%o5,	0x1250,	%l5
	addc	%l6,	0x1AAC,	%g7
	edge8ln	%o6,	%o4,	%i2
	save %g3, 0x1BFA, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x58],	%i1
	fnot1s	%f14,	%f18
	xnorcc	%g1,	0x003C,	%i6
	addc	%l1,	0x1663,	%l3
	fmovdge	%xcc,	%f19,	%f4
	sll	%o7,	0x0B,	%i5
	ldsw	[%l7 + 0x3C],	%l0
	orcc	%o1,	0x1ED0,	%o2
	sra	%l4,	0x10,	%i7
	addc	%i0,	0x1BA9,	%i4
	sll	%l2,	0x04,	%g6
	movcs	%icc,	%g4,	%g5
	edge16ln	%i3,	%o3,	%g2
	array16	%l5,	%l6,	%g7
	andncc	%o6,	%o4,	%o5
	fxors	%f1,	%f27,	%f3
	addc	%i2,	%o0,	%i1
	ldsw	[%l7 + 0x3C],	%g1
	fmovdgu	%icc,	%f15,	%f16
	srlx	%g3,	0x12,	%l1
	edge16	%i6,	%l3,	%i5
	fnands	%f18,	%f23,	%f2
	st	%f10,	[%l7 + 0x7C]
	movgu	%icc,	%l0,	%o7
	popc	%o2,	%o1
	ldd	[%l7 + 0x48],	%i6
	std	%f2,	[%l7 + 0x48]
	ldd	[%l7 + 0x20],	%i0
	mulx	%i4,	0x147F,	%l2
	edge32	%g6,	%l4,	%g5
	edge32ln	%g4,	%o3,	%i3
	array8	%g2,	%l6,	%l5
	movneg	%icc,	%g7,	%o4
	fmovdl	%xcc,	%f31,	%f3
	lduw	[%l7 + 0x58],	%o6
	orncc	%o5,	%o0,	%i2
	siam	0x6
	edge32	%g1,	%i1,	%l1
	movn	%xcc,	%i6,	%g3
	edge16ln	%l3,	%i5,	%o7
	ldd	[%l7 + 0x08],	%l0
	lduh	[%l7 + 0x7A],	%o1
	movle	%icc,	%i7,	%o2
	ldub	[%l7 + 0x3D],	%i0
	umul	%l2,	%g6,	%l4
	array32	%i4,	%g4,	%g5
	nop
	set	0x38, %i4
	lduh	[%l7 + %i4],	%o3
	fpmerge	%f14,	%f8,	%f28
	udivx	%g2,	0x1CF5,	%l6
	edge16n	%i3,	%g7,	%o4
	stw	%o6,	[%l7 + 0x70]
	movre	%o5,	0x021,	%l5
	mulx	%o0,	%i2,	%i1
	ldsh	[%l7 + 0x3C],	%l1
	movrgez	%i6,	0x315,	%g1
	orn	%g3,	0x08DC,	%i5
	add	%l3,	%l0,	%o1
	edge32l	%i7,	%o2,	%i0
	ld	[%l7 + 0x48],	%f8
	fxnor	%f14,	%f26,	%f30
	mulx	%o7,	0x185E,	%l2
	sdivcc	%l4,	0x0D69,	%i4
	fxor	%f26,	%f20,	%f18
	movg	%xcc,	%g6,	%g4
	edge32ln	%o3,	%g2,	%l6
	ldd	[%l7 + 0x30],	%f12
	movrne	%g5,	0x00B,	%i3
	sdivx	%o4,	0x0BD2,	%g7
	xnor	%o5,	0x01E2,	%o6
	mulscc	%o0,	0x1D0B,	%i2
	fpsub16	%f14,	%f4,	%f4
	edge8l	%i1,	%l5,	%i6
	movcs	%xcc,	%l1,	%g1
	array16	%g3,	%i5,	%l3
	fmovdcc	%xcc,	%f30,	%f15
	sllx	%l0,	%o1,	%i7
	andncc	%i0,	%o7,	%o2
	fmovdleu	%icc,	%f17,	%f31
	ldd	[%l7 + 0x30],	%f22
	smul	%l2,	%l4,	%g6
	orn	%i4,	%g4,	%g2
	srl	%l6,	%g5,	%i3
	ldd	[%l7 + 0x30],	%o2
	ldd	[%l7 + 0x38],	%f6
	fxnors	%f11,	%f11,	%f27
	move	%xcc,	%g7,	%o5
	orcc	%o6,	%o0,	%i2
	mulx	%i1,	0x0890,	%l5
	fcmple16	%f8,	%f18,	%o4
	movle	%icc,	%l1,	%g1
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%i6
	addcc	%i5,	%g3,	%l0
	fands	%f7,	%f0,	%f4
	smulcc	%o1,	0x033D,	%i7
	alignaddrl	%l3,	%o7,	%o2
	ldub	[%l7 + 0x1A],	%i0
	fmovrsne	%l2,	%f14,	%f18
	udiv	%g6,	0x0485,	%l4
	fmovdn	%xcc,	%f17,	%f19
	array16	%i4,	%g4,	%l6
	ldx	[%l7 + 0x78],	%g5
	edge32	%i3,	%o3,	%g7
	smul	%o5,	%g2,	%o6
	movrlz	%o0,	%i2,	%l5
	alignaddr	%o4,	%l1,	%g1
	addc	%i6,	0x1456,	%i5
	fandnot2s	%f2,	%f14,	%f2
	fpadd32s	%f29,	%f7,	%f0
	subcc	%i1,	0x16BE,	%l0
	fmovdvs	%icc,	%f18,	%f8
	xnorcc	%o1,	0x1674,	%i7
	fpadd32	%f8,	%f2,	%f0
	edge16ln	%g3,	%l3,	%o7
	fmuld8sux16	%f19,	%f8,	%f12
	andn	%i0,	%l2,	%o2
	fzero	%f6
	fmul8x16al	%f4,	%f22,	%f10
	addcc	%l4,	%g6,	%g4
	fcmpes	%fcc0,	%f3,	%f6
	stb	%l6,	[%l7 + 0x73]
	mulx	%g5,	0x0117,	%i4
	movg	%icc,	%o3,	%i3
	fcmpes	%fcc0,	%f20,	%f7
	edge16l	%o5,	%g2,	%g7
	andn	%o0,	%i2,	%l5
	fpsub32s	%f10,	%f0,	%f15
	sdiv	%o4,	0x1C85,	%l1
	movrgz	%g1,	0x3D9,	%o6
	edge16l	%i6,	%i1,	%i5
	sethi	0x1E7B,	%o1
	or	%i7,	%l0,	%l3
	ldsw	[%l7 + 0x68],	%o7
	addccc	%i0,	0x0381,	%l2
	orncc	%g3,	0x1122,	%o2
	fandnot2	%f30,	%f28,	%f8
	ld	[%l7 + 0x40],	%f28
	move	%xcc,	%g6,	%g4
	lduh	[%l7 + 0x16],	%l4
	movrlz	%g5,	%i4,	%o3
	movre	%i3,	0x3F2,	%l6
	edge16	%g2,	%o5,	%g7
	ldsh	[%l7 + 0x60],	%i2
	edge8l	%o0,	%o4,	%l1
	fmul8ulx16	%f2,	%f16,	%f22
	movrgz	%g1,	%l5,	%i6
	sdivcc	%o6,	0x1F90,	%i1
	fmovsleu	%xcc,	%f16,	%f31
	orn	%i5,	%o1,	%l0
	sra	%i7,	0x01,	%o7
	mulscc	%i0,	%l2,	%l3
	movgu	%xcc,	%g3,	%o2
	movvc	%xcc,	%g4,	%g6
	fmul8sux16	%f24,	%f16,	%f2
	ldd	[%l7 + 0x58],	%f4
	save %l4, 0x1C79, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g5,	%o3,	%i3
	edge8l	%l6,	%g2,	%o5
	fand	%f8,	%f4,	%f22
	array16	%i2,	%g7,	%o0
	fmovrslz	%o4,	%f20,	%f17
	ldd	[%l7 + 0x60],	%l0
	fpadd32s	%f21,	%f10,	%f16
	fabss	%f30,	%f13
	edge32	%g1,	%i6,	%o6
	movpos	%xcc,	%i1,	%l5
	fone	%f24
	edge32ln	%o1,	%l0,	%i7
	edge8n	%o7,	%i0,	%i5
	subc	%l2,	0x1A85,	%g3
	movg	%xcc,	%l3,	%o2
	fnegd	%f10,	%f2
	mulscc	%g6,	0x0E95,	%g4
	xnorcc	%l4,	%i4,	%o3
	movre	%i3,	0x0E1,	%l6
	xnor	%g5,	%g2,	%i2
	movcc	%xcc,	%g7,	%o0
	edge16ln	%o4,	%l1,	%o5
	movn	%xcc,	%i6,	%o6
	add	%g1,	0x083E,	%l5
	or	%i1,	0x1442,	%l0
	edge8ln	%o1,	%i7,	%o7
	alignaddrl	%i0,	%l2,	%i5
	stw	%l3,	[%l7 + 0x3C]
	subc	%o2,	%g3,	%g6
	movvc	%icc,	%g4,	%i4
	sll	%o3,	%i3,	%l6
	save %g5, 0x1E18, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x1C],	%f30
	move	%icc,	%g2,	%i2
	andcc	%o0,	%o4,	%g7
	edge8l	%o5,	%i6,	%o6
	mulscc	%l1,	%l5,	%i1
	movcs	%xcc,	%l0,	%o1
	fnot2	%f26,	%f16
	movre	%g1,	0x3B3,	%i7
	stx	%o7,	[%l7 + 0x60]
	stw	%l2,	[%l7 + 0x30]
	fnot2	%f4,	%f0
	alignaddr	%i5,	%l3,	%o2
	ld	[%l7 + 0x1C],	%f10
	mulscc	%i0,	%g3,	%g6
	ldsb	[%l7 + 0x36],	%g4
	sll	%o3,	%i3,	%i4
	edge16l	%g5,	%l6,	%l4
	smulcc	%i2,	0x05C1,	%o0
	nop
	set	0x18, %i6
	stw	%g2,	[%l7 + %i6]
	movrgez	%o4,	0x217,	%o5
	fmovrdgez	%g7,	%f16,	%f24
	movrlez	%o6,	0x273,	%l1
	sra	%i6,	%i1,	%l5
	subccc	%o1,	%l0,	%i7
	movrgez	%g1,	%l2,	%o7
	lduh	[%l7 + 0x1E],	%i5
	stb	%l3,	[%l7 + 0x7E]
	fabsd	%f18,	%f24
	ldx	[%l7 + 0x38],	%o2
	fnegs	%f28,	%f1
	movn	%xcc,	%g3,	%g6
	addccc	%i0,	%g4,	%i3
	fcmpes	%fcc3,	%f0,	%f19
	sdiv	%i4,	0x07B5,	%o3
	udivcc	%g5,	0x1826,	%l4
	orn	%i2,	0x13C0,	%o0
	edge32n	%g2,	%l6,	%o4
	movrlez	%g7,	%o6,	%o5
	sllx	%l1,	0x1B,	%i1
	sra	%i6,	0x0B,	%o1
	fmul8x16	%f2,	%f26,	%f18
	sdiv	%l5,	0x04A7,	%i7
	fmovrdgez	%g1,	%f18,	%f0
	ldd	[%l7 + 0x48],	%f18
	fmovdl	%icc,	%f6,	%f24
	or	%l0,	%l2,	%i5
	movne	%icc,	%l3,	%o7
	srl	%g3,	0x15,	%o2
	fmovscc	%xcc,	%f8,	%f21
	fmovde	%xcc,	%f0,	%f16
	movcc	%icc,	%i0,	%g4
	edge32n	%i3,	%i4,	%o3
	fpsub32	%f24,	%f16,	%f8
	mulscc	%g5,	0x1EA8,	%g6
	movrgez	%i2,	0x2FC,	%o0
	fmovrslez	%l4,	%f7,	%f0
	save %l6, %g2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f20,	%f20,	%f12
	movcs	%xcc,	%o6,	%o5
	sllx	%l1,	0x07,	%i1
	popc	%i6,	%o1
	movleu	%icc,	%l5,	%g7
	fcmple16	%f12,	%f0,	%g1
	udivx	%i7,	0x0767,	%l2
	udivcc	%i5,	0x1A24,	%l3
	movcc	%icc,	%o7,	%g3
	fpadd16	%f24,	%f2,	%f2
	xnor	%l0,	%i0,	%o2
	udivx	%i3,	0x0A41,	%g4
	ld	[%l7 + 0x68],	%f3
	sdivcc	%i4,	0x1110,	%g5
	movn	%icc,	%o3,	%i2
	fmovs	%f29,	%f10
	addcc	%g6,	0x13DF,	%o0
	movvc	%icc,	%l4,	%l6
	movre	%g2,	0x09A,	%o4
	udiv	%o5,	0x1251,	%o6
	popc	0x1101,	%l1
	sra	%i6,	0x09,	%i1
	lduh	[%l7 + 0x56],	%o1
	sll	%l5,	0x00,	%g7
	fmovrdgez	%i7,	%f4,	%f18
	fmovsne	%xcc,	%f29,	%f28
	mova	%icc,	%g1,	%i5
	srl	%l3,	0x1D,	%l2
	edge32	%g3,	%l0,	%i0
	alignaddr	%o7,	%o2,	%i3
	sdiv	%g4,	0x09A3,	%i4
	srl	%o3,	%i2,	%g6
	fnor	%f4,	%f18,	%f20
	sdivx	%g5,	0x15F3,	%l4
	umul	%o0,	%g2,	%l6
	movg	%xcc,	%o4,	%o6
	lduh	[%l7 + 0x32],	%o5
	fmul8x16al	%f22,	%f25,	%f12
	edge16l	%l1,	%i6,	%i1
	std	%f4,	[%l7 + 0x48]
	ldd	[%l7 + 0x18],	%f30
	alignaddr	%o1,	%g7,	%i7
	movvs	%icc,	%g1,	%l5
	siam	0x6
	mulx	%i5,	%l2,	%l3
	smulcc	%l0,	0x1204,	%g3
	addccc	%o7,	%i0,	%i3
	fpsub16s	%f28,	%f21,	%f14
	andn	%g4,	%o2,	%o3
	edge32n	%i2,	%g6,	%g5
	fabss	%f21,	%f1
	sllx	%l4,	%i4,	%g2
	movvs	%xcc,	%l6,	%o4
	addccc	%o0,	0x0A06,	%o6
	ldd	[%l7 + 0x30],	%f30
	sub	%l1,	0x1B3A,	%o5
	movpos	%icc,	%i1,	%i6
	lduw	[%l7 + 0x3C],	%o1
	edge32l	%i7,	%g7,	%g1
	siam	0x3
	andcc	%l5,	0x08F2,	%l2
	lduw	[%l7 + 0x4C],	%i5
	sdivx	%l3,	0x1D3D,	%l0
	edge16ln	%g3,	%o7,	%i0
	lduw	[%l7 + 0x20],	%g4
	sethi	0x1B28,	%o2
	edge16ln	%o3,	%i3,	%i2
	add	%g5,	%g6,	%i4
	move	%icc,	%g2,	%l4
	sub	%l6,	0x0E0F,	%o0
	umul	%o6,	0x0AFB,	%o4
	fmovrdgz	%o5,	%f10,	%f20
	std	%f8,	[%l7 + 0x10]
	orncc	%i1,	0x1B5C,	%l1
	movcc	%xcc,	%o1,	%i6
	movcs	%icc,	%i7,	%g1
	fnot2s	%f7,	%f27
	edge16l	%g7,	%l2,	%l5
	popc	%l3,	%i5
	sdivcc	%l0,	0x0E9B,	%g3
	andn	%i0,	0x10BD,	%o7
	ldd	[%l7 + 0x60],	%f30
	fpadd16	%f4,	%f6,	%f16
	andn	%o2,	%g4,	%o3
	sir	0x0044
	movrgez	%i2,	%i3,	%g6
	edge16l	%i4,	%g2,	%g5
	movg	%icc,	%l4,	%l6
	ldx	[%l7 + 0x38],	%o0
	and	%o6,	%o5,	%i1
	edge8	%l1,	%o4,	%o1
	fmovsl	%icc,	%f9,	%f0
	subcc	%i6,	0x1BBE,	%g1
	st	%f28,	[%l7 + 0x38]
	std	%f12,	[%l7 + 0x18]
	sdivx	%g7,	0x00D8,	%i7
	fornot2	%f14,	%f12,	%f28
	and	%l5,	%l2,	%i5
	ldsb	[%l7 + 0x3F],	%l0
	fmovrslez	%l3,	%f5,	%f6
	edge16	%g3,	%o7,	%o2
	edge8n	%g4,	%i0,	%i2
	fxor	%f20,	%f6,	%f12
	fnot1	%f18,	%f2
	stb	%o3,	[%l7 + 0x1E]
	fmovrdne	%i3,	%f2,	%f14
	movvs	%icc,	%i4,	%g6
	movre	%g5,	%g2,	%l4
	movl	%icc,	%o0,	%l6
	srax	%o5,	%i1,	%o6
	edge32ln	%o4,	%o1,	%l1
	sllx	%i6,	0x1B,	%g1
	movrgez	%g7,	%l5,	%i7
	movrgz	%i5,	0x3BA,	%l0
	std	%f20,	[%l7 + 0x48]
	ldd	[%l7 + 0x28],	%f26
	srl	%l3,	0x01,	%g3
	st	%f6,	[%l7 + 0x5C]
	addc	%l2,	0x17E4,	%o7
	ldd	[%l7 + 0x28],	%f4
	edge16ln	%g4,	%i0,	%i2
	fabss	%f9,	%f20
	array8	%o3,	%i3,	%o2
	movne	%icc,	%g6,	%g5
	movvc	%xcc,	%g2,	%i4
	edge32n	%l4,	%o0,	%o5
	fandnot2s	%f28,	%f13,	%f30
	edge32l	%l6,	%i1,	%o6
	movrne	%o4,	0x07C,	%o1
	xnorcc	%l1,	0x1DD2,	%g1
	stw	%i6,	[%l7 + 0x10]
	stb	%g7,	[%l7 + 0x14]
	subcc	%i7,	0x03B1,	%i5
	edge32	%l0,	%l5,	%g3
	addcc	%l2,	0x0E6F,	%o7
	udivcc	%l3,	0x0F97,	%i0
	fmovrdne	%i2,	%f18,	%f24
	orcc	%o3,	0x16E3,	%i3
	edge16l	%g4,	%g6,	%o2
	sra	%g2,	0x08,	%i4
	movvc	%xcc,	%l4,	%o0
	orn	%g5,	0x19E9,	%l6
	edge32	%o5,	%i1,	%o4
	fmovse	%xcc,	%f22,	%f31
	edge8	%o1,	%l1,	%g1
	fcmple16	%f18,	%f30,	%o6
	subc	%i6,	0x1712,	%g7
	movvc	%xcc,	%i5,	%l0
	restore %l5, %g3, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i7,	%l3,	%i0
	alignaddrl	%i2,	%o3,	%i3
	movrlz	%o7,	0x390,	%g4
	ldub	[%l7 + 0x0F],	%g6
	sll	%o2,	%g2,	%l4
	edge16	%o0,	%i4,	%g5
	ldd	[%l7 + 0x18],	%f2
	fcmpd	%fcc1,	%f30,	%f14
	fpsub32	%f28,	%f26,	%f18
	fxor	%f26,	%f28,	%f16
	fnegd	%f12,	%f4
	smulcc	%l6,	%i1,	%o5
	ldsw	[%l7 + 0x58],	%o1
	movne	%icc,	%l1,	%g1
	fcmps	%fcc2,	%f11,	%f2
	subcc	%o4,	%o6,	%i6
	smul	%i5,	%g7,	%l5
	movpos	%icc,	%l0,	%g3
	movpos	%xcc,	%i7,	%l2
	orcc	%i0,	0x1C35,	%l3
	fmovdcs	%icc,	%f30,	%f31
	edge16l	%o3,	%i2,	%o7
	ldx	[%l7 + 0x48],	%g4
	edge16n	%i3,	%g6,	%g2
	fand	%f28,	%f28,	%f20
	srlx	%o2,	%o0,	%i4
	fmovdle	%xcc,	%f4,	%f4
	movleu	%xcc,	%l4,	%g5
	fmovsa	%xcc,	%f25,	%f10
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	array8	%l1,	%i1,	%g1
	lduh	[%l7 + 0x20],	%o4
	movgu	%icc,	%o6,	%i6
	movg	%icc,	%i5,	%l5
	edge32n	%l0,	%g3,	%g7
	fmovde	%xcc,	%f2,	%f30
	movrgz	%i7,	0x2BA,	%l2
	edge32l	%i0,	%o3,	%l3
	fmovsa	%icc,	%f23,	%f22
	ld	[%l7 + 0x24],	%f12
	edge8ln	%i2,	%o7,	%g4
	fcmpeq16	%f8,	%f22,	%i3
	fsrc1s	%f7,	%f0
	addcc	%g6,	%g2,	%o0
	sethi	0x0E53,	%o2
	std	%f28,	[%l7 + 0x28]
	movvs	%xcc,	%l4,	%g5
	sll	%l6,	%o5,	%o1
	add	%i4,	0x1654,	%l1
	fmovse	%xcc,	%f22,	%f24
	fcmpeq16	%f26,	%f2,	%g1
	fxnors	%f14,	%f27,	%f11
	fmovdcs	%icc,	%f2,	%f9
	sllx	%o4,	%i1,	%o6
	popc	0x08FA,	%i5
	addcc	%l5,	%l0,	%i6
	fmovde	%icc,	%f26,	%f19
	sub	%g7,	%g3,	%i7
	movle	%xcc,	%l2,	%i0
	xorcc	%l3,	%o3,	%o7
	fornot2	%f26,	%f2,	%f2
	lduw	[%l7 + 0x4C],	%g4
	lduw	[%l7 + 0x30],	%i3
	ldsh	[%l7 + 0x68],	%i2
	fand	%f8,	%f12,	%f24
	edge16l	%g6,	%o0,	%g2
	sllx	%l4,	%g5,	%o2
	move	%xcc,	%o5,	%o1
	fcmpd	%fcc3,	%f28,	%f0
	fmovrdlez	%i4,	%f6,	%f14
	edge32ln	%l6,	%g1,	%l1
	alignaddr	%i1,	%o4,	%o6
	fmovrse	%i5,	%f23,	%f28
	sdivx	%l0,	0x18B6,	%l5
	stb	%i6,	[%l7 + 0x19]
	restore %g7, 0x084C, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i7,	0x1BDD,	%i0
	movge	%icc,	%l2,	%o3
	edge32	%o7,	%g4,	%l3
	xor	%i2,	%g6,	%i3
	udivcc	%o0,	0x0BBB,	%l4
	std	%f0,	[%l7 + 0x08]
	fcmple32	%f0,	%f24,	%g2
	udivx	%o2,	0x06D9,	%g5
	movle	%icc,	%o1,	%o5
	orcc	%l6,	%g1,	%i4
	udivx	%i1,	0x031E,	%l1
	ldd	[%l7 + 0x70],	%f4
	fmovdleu	%icc,	%f26,	%f1
	sth	%o4,	[%l7 + 0x64]
	mulx	%i5,	%o6,	%l5
	sdiv	%i6,	0x14DE,	%l0
	for	%f14,	%f4,	%f8
	movcc	%xcc,	%g3,	%i7
	fpsub16	%f8,	%f26,	%f8
	fpack16	%f22,	%f13
	st	%f21,	[%l7 + 0x14]
	udivx	%g7,	0x1EA6,	%i0
	fxor	%f10,	%f26,	%f16
	and	%l2,	%o7,	%o3
	sdivcc	%g4,	0x1976,	%i2
	xorcc	%l3,	0x05FB,	%i3
	xor	%o0,	%g6,	%g2
	movvc	%xcc,	%o2,	%g5
	edge32n	%l4,	%o5,	%l6
	edge32n	%g1,	%i4,	%i1
	nop
	set	0x12, %i5
	ldsh	[%l7 + %i5],	%o1
	edge32	%l1,	%o4,	%o6
	edge16	%l5,	%i6,	%l0
	movneg	%xcc,	%g3,	%i5
	fcmpne16	%f2,	%f24,	%i7
	ldsb	[%l7 + 0x72],	%g7
	fmovrdlz	%i0,	%f2,	%f20
	ldub	[%l7 + 0x66],	%l2
	xnor	%o7,	%o3,	%i2
	stb	%l3,	[%l7 + 0x4C]
	mulscc	%g4,	%i3,	%o0
	movvc	%xcc,	%g6,	%g2
	movrgez	%o2,	0x2D7,	%l4
	movvc	%xcc,	%o5,	%g5
	edge16l	%g1,	%i4,	%i1
	sdivcc	%o1,	0x0C96,	%l1
	sth	%l6,	[%l7 + 0x5C]
	edge32ln	%o6,	%l5,	%o4
	fpack32	%f30,	%f22,	%f28
	sdivcc	%l0,	0x1A12,	%i6
	subccc	%i5,	%g3,	%i7
	movrlez	%g7,	%l2,	%i0
	array16	%o3,	%o7,	%i2
	fmovsgu	%xcc,	%f31,	%f31
	subcc	%g4,	0x0BF6,	%l3
	sethi	0x00E6,	%i3
	andcc	%o0,	0x0AE4,	%g6
	ldsh	[%l7 + 0x30],	%o2
	movl	%icc,	%g2,	%l4
	addcc	%g5,	%g1,	%o5
	movrlez	%i1,	%o1,	%l1
	fxnors	%f24,	%f17,	%f18
	ldd	[%l7 + 0x40],	%f28
	udivcc	%i4,	0x010C,	%l6
	mova	%icc,	%l5,	%o4
	andn	%o6,	0x0D63,	%l0
	movpos	%icc,	%i5,	%g3
	fxnors	%f12,	%f27,	%f19
	addc	%i7,	%i6,	%g7
	sir	0x11A6
	addcc	%i0,	%o3,	%l2
	umulcc	%o7,	0x0B2F,	%i2
	smulcc	%l3,	0x16C8,	%i3
	xnor	%o0,	0x0BAD,	%g6
	fcmple16	%f24,	%f22,	%o2
	fands	%f14,	%f21,	%f27
	nop
	set	0x08, %g6
	sth	%g4,	[%l7 + %g6]
	subc	%l4,	%g5,	%g2
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	fzero	%f24
	fmovrdgz	%i1,	%f0,	%f10
	fpsub16s	%f19,	%f22,	%f5
	andn	%l1,	0x1BCB,	%i4
	stx	%o1,	[%l7 + 0x10]
	movg	%xcc,	%l6,	%l5
	movg	%icc,	%o6,	%l0
	fxor	%f16,	%f8,	%f4
	ldub	[%l7 + 0x2C],	%o4
	andcc	%g3,	0x05F5,	%i5
	andcc	%i7,	0x1DDE,	%g7
	ldd	[%l7 + 0x30],	%f12
	edge16	%i6,	%i0,	%o3
	fpadd16	%f26,	%f6,	%f22
	mova	%xcc,	%o7,	%l2
	sethi	0x11D0,	%i2
	sub	%i3,	%o0,	%l3
	movg	%xcc,	%g6,	%o2
	smulcc	%g4,	%g5,	%g2
	fmul8ulx16	%f6,	%f4,	%f30
	edge8ln	%o5,	%l4,	%g1
	movg	%xcc,	%l1,	%i1
	alignaddr	%i4,	%l6,	%l5
	fmovrslz	%o6,	%f20,	%f2
	stw	%o1,	[%l7 + 0x40]
	andn	%o4,	0x056F,	%g3
	fpsub16s	%f28,	%f8,	%f2
	xor	%l0,	0x1F74,	%i5
	ldd	[%l7 + 0x38],	%f10
	ldub	[%l7 + 0x47],	%g7
	movvs	%xcc,	%i6,	%i7
	stx	%i0,	[%l7 + 0x08]
	movre	%o7,	0x00E,	%l2
	sdivx	%i2,	0x0E16,	%o3
	movvs	%icc,	%i3,	%o0
	edge8	%g6,	%l3,	%o2
	fmovdge	%xcc,	%f4,	%f8
	and	%g5,	0x0D28,	%g2
	mulscc	%o5,	0x0F6F,	%g4
	orncc	%l4,	%g1,	%l1
	edge32l	%i1,	%i4,	%l6
	fmovspos	%icc,	%f13,	%f20
	srl	%o6,	%o1,	%o4
	edge16	%l5,	%g3,	%i5
	orncc	%g7,	0x1A25,	%l0
	fornot1	%f6,	%f16,	%f2
	addcc	%i6,	0x06F6,	%i0
	andn	%i7,	%l2,	%o7
	fmul8x16al	%f18,	%f24,	%f10
	stb	%i2,	[%l7 + 0x0C]
	andn	%o3,	0x102E,	%o0
	pdist	%f14,	%f14,	%f30
	fxors	%f19,	%f4,	%f27
	stb	%g6,	[%l7 + 0x6F]
	stb	%l3,	[%l7 + 0x4E]
	edge32ln	%i3,	%o2,	%g5
	fnors	%f27,	%f19,	%f13
	xnor	%g2,	%g4,	%o5
	movle	%icc,	%l4,	%l1
	movrgez	%i1,	0x39B,	%i4
	save %g1, %l6, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%o1,	%o4
	edge16l	%g3,	%l5,	%g7
	fpadd16	%f10,	%f6,	%f26
	or	%i5,	%l0,	%i6
	sdiv	%i7,	0x0885,	%i0
	mulx	%o7,	%l2,	%i2
	movpos	%xcc,	%o3,	%o0
	fsrc2	%f0,	%f2
	std	%f10,	[%l7 + 0x10]
	sll	%g6,	%l3,	%o2
	sub	%i3,	%g5,	%g2
	movcs	%icc,	%g4,	%l4
	sir	0x0968
	edge32l	%o5,	%i1,	%l1
	movge	%icc,	%g1,	%i4
	lduw	[%l7 + 0x2C],	%o6
	udivcc	%l6,	0x00BB,	%o1
	st	%f5,	[%l7 + 0x28]
	save %o4, 0x1771, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f2,	%f18
	sir	0x1E1F
	addc	%l5,	0x0CE2,	%i5
	stw	%g7,	[%l7 + 0x50]
	edge8ln	%l0,	%i7,	%i0
	sdiv	%o7,	0x051A,	%l2
	fcmpne32	%f2,	%f4,	%i6
	ldub	[%l7 + 0x17],	%o3
	movne	%icc,	%i2,	%g6
	addccc	%l3,	0x1FBD,	%o2
	movge	%xcc,	%i3,	%g5
	ldx	[%l7 + 0x30],	%g2
	movl	%icc,	%g4,	%o0
	std	%f14,	[%l7 + 0x50]
	movpos	%icc,	%l4,	%i1
	ldsb	[%l7 + 0x43],	%l1
	fornot1	%f16,	%f22,	%f22
	xor	%o5,	%g1,	%o6
	edge32l	%i4,	%l6,	%o1
	sdivx	%g3,	0x171D,	%o4
	ldd	[%l7 + 0x48],	%f20
	mulscc	%l5,	0x07D7,	%i5
	fsrc2	%f20,	%f14
	lduh	[%l7 + 0x68],	%g7
	edge16n	%l0,	%i0,	%i7
	addccc	%o7,	0x180B,	%l2
	st	%f31,	[%l7 + 0x4C]
	fones	%f30
	lduh	[%l7 + 0x16],	%o3
	xnor	%i6,	%g6,	%l3
	movrgz	%o2,	%i3,	%i2
	orn	%g2,	%g5,	%g4
	sub	%l4,	0x0A5B,	%o0
	fmovdvs	%icc,	%f15,	%f28
	xnorcc	%l1,	0x0E3C,	%i1
	fmovrdgz	%g1,	%f22,	%f2
	ldd	[%l7 + 0x30],	%o6
	edge8n	%o5,	%l6,	%i4
	faligndata	%f14,	%f0,	%f4
	movcs	%xcc,	%g3,	%o4
	array32	%l5,	%o1,	%g7
	sllx	%i5,	%i0,	%i7
	ldsw	[%l7 + 0x20],	%o7
	movne	%xcc,	%l2,	%l0
	subc	%i6,	%o3,	%g6
	alignaddrl	%o2,	%l3,	%i2
	ldd	[%l7 + 0x50],	%i2
	movrgz	%g5,	0x140,	%g4
	umul	%l4,	0x1031,	%o0
	edge16n	%l1,	%g2,	%i1
	fmovrdne	%g1,	%f16,	%f6
	alignaddrl	%o6,	%l6,	%i4
	edge32ln	%o5,	%o4,	%l5
	array8	%o1,	%g3,	%i5
	movl	%icc,	%g7,	%i7
	fnegd	%f0,	%f30
	stb	%i0,	[%l7 + 0x79]
	movleu	%icc,	%o7,	%l2
	movle	%icc,	%i6,	%o3
	movpos	%icc,	%g6,	%l0
	edge16ln	%l3,	%i2,	%i3
	movrgz	%o2,	0x083,	%g4
	sll	%l4,	%o0,	%l1
	sir	0x168C
	orncc	%g2,	%g5,	%g1
	bshuffle	%f6,	%f30,	%f30
	fnands	%f6,	%f29,	%f7
	edge16	%i1,	%o6,	%i4
	fpsub32	%f8,	%f6,	%f12
	fandnot1	%f24,	%f18,	%f18
	stw	%l6,	[%l7 + 0x34]
	siam	0x6
	sdivcc	%o5,	0x0F0F,	%o4
	fnot2	%f18,	%f6
	orncc	%o1,	0x0E83,	%l5
	edge8ln	%g3,	%i5,	%g7
	alignaddrl	%i0,	%o7,	%i7
	movcs	%icc,	%l2,	%o3
	ld	[%l7 + 0x44],	%f21
	fmovrdne	%g6,	%f12,	%f14
	sethi	0x071E,	%l0
	sir	0x1F23
	fxnor	%f22,	%f22,	%f4
	fors	%f15,	%f12,	%f22
	fmovsneg	%xcc,	%f30,	%f2
	array16	%l3,	%i6,	%i2
	umul	%i3,	0x063E,	%o2
	fmovdcc	%icc,	%f31,	%f18
	edge16	%g4,	%o0,	%l1
	fnegs	%f2,	%f22
	addc	%l4,	0x0CA8,	%g5
	lduw	[%l7 + 0x54],	%g2
	or	%g1,	0x1BA3,	%i1
	fmovd	%f10,	%f2
	udiv	%o6,	0x034C,	%l6
	fnot1	%f24,	%f30
	edge8ln	%i4,	%o5,	%o1
	movvs	%xcc,	%l5,	%g3
	save %i5, 0x11FE, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o4,	0x00A5,	%o7
	ldd	[%l7 + 0x68],	%i6
	ld	[%l7 + 0x30],	%f29
	movgu	%xcc,	%l2,	%o3
	addcc	%g6,	0x129D,	%i0
	fpmerge	%f11,	%f21,	%f6
	fmovsgu	%icc,	%f6,	%f29
	edge16ln	%l0,	%i6,	%l3
	movrgez	%i2,	0x136,	%o2
	mova	%xcc,	%i3,	%o0
	edge32l	%g4,	%l1,	%l4
	edge16l	%g2,	%g5,	%g1
	xorcc	%i1,	%l6,	%o6
	subc	%o5,	0x0F4C,	%o1
	ldsw	[%l7 + 0x24],	%i4
	add	%g3,	%l5,	%i5
	subc	%g7,	%o4,	%o7
	array8	%l2,	%o3,	%i7
	ldsw	[%l7 + 0x50],	%i0
	srlx	%l0,	%i6,	%g6
	sth	%l3,	[%l7 + 0x5C]
	lduh	[%l7 + 0x10],	%i2
	edge8ln	%o2,	%i3,	%o0
	sdiv	%l1,	0x16B0,	%g4
	ldsb	[%l7 + 0x79],	%g2
	sll	%l4,	%g5,	%i1
	std	%f4,	[%l7 + 0x40]
	fmovdvc	%icc,	%f0,	%f1
	fmovsne	%xcc,	%f28,	%f17
	fone	%f16
	nop
	set	0x20, %l2
	stw	%g1,	[%l7 + %l2]
	subc	%o6,	0x0AD3,	%l6
	ldx	[%l7 + 0x08],	%o5
	sll	%o1,	%i4,	%l5
	edge16	%g3,	%g7,	%i5
	ldsh	[%l7 + 0x5A],	%o7
	movne	%icc,	%o4,	%l2
	fmovrdgez	%i7,	%f18,	%f12
	movvc	%xcc,	%i0,	%o3
	fones	%f17
	fmovdneg	%icc,	%f4,	%f10
	edge16	%i6,	%l0,	%l3
	udivcc	%i2,	0x1BCC,	%o2
	array8	%i3,	%g6,	%o0
	fmovsa	%icc,	%f10,	%f30
	edge16n	%g4,	%l1,	%g2
	stb	%l4,	[%l7 + 0x4B]
	sth	%i1,	[%l7 + 0x3A]
	ldsw	[%l7 + 0x50],	%g5
	fcmped	%fcc3,	%f12,	%f16
	edge32ln	%o6,	%l6,	%g1
	ldsw	[%l7 + 0x4C],	%o1
	lduh	[%l7 + 0x36],	%i4
	fabsd	%f24,	%f14
	sethi	0x11E8,	%l5
	move	%xcc,	%o5,	%g7
	save %i5, %g3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x20],	%f8
	array8	%l2,	%i7,	%i0
	movn	%xcc,	%o3,	%i6
	movge	%xcc,	%l0,	%l3
	movrgz	%i2,	0x3B6,	%o7
	movpos	%xcc,	%o2,	%g6
	edge8l	%o0,	%i3,	%l1
	fexpand	%f15,	%f14
	edge8ln	%g4,	%l4,	%i1
	alignaddrl	%g5,	%g2,	%o6
	fcmps	%fcc2,	%f3,	%f27
	sub	%g1,	%l6,	%o1
	alignaddr	%i4,	%o5,	%l5
	nop
	set	0x7D, %l4
	stb	%g7,	[%l7 + %l4]
	nop
	set	0x4C, %o6
	ldsb	[%l7 + %o6],	%g3
	fcmped	%fcc1,	%f10,	%f26
	lduw	[%l7 + 0x54],	%o4
	andn	%l2,	%i7,	%i5
	sdiv	%o3,	0x02AF,	%i6
	udivcc	%l0,	0x07A0,	%l3
	alignaddr	%i2,	%o7,	%o2
	edge32n	%i0,	%g6,	%o0
	andcc	%i3,	0x1E16,	%l1
	sdiv	%g4,	0x133A,	%i1
	udivcc	%l4,	0x17D1,	%g5
	fmovdge	%icc,	%f20,	%f29
	udivx	%o6,	0x09F7,	%g1
	sir	0x18EF
	subccc	%g2,	0x0CE6,	%o1
	subc	%i4,	%l6,	%l5
	movleu	%xcc,	%g7,	%o5
	fpadd32s	%f26,	%f31,	%f2
	ldd	[%l7 + 0x38],	%f22
	movle	%xcc,	%o4,	%l2
	sdivcc	%i7,	0x00C7,	%i5
	fmovd	%f22,	%f8
	orcc	%o3,	%i6,	%l0
	array8	%g3,	%i2,	%o7
	movrlez	%l3,	%i0,	%g6
	ldx	[%l7 + 0x70],	%o2
	edge16	%o0,	%l1,	%i3
	sth	%g4,	[%l7 + 0x58]
	smulcc	%l4,	0x0FBB,	%g5
	fornot2s	%f23,	%f4,	%f31
	movrne	%o6,	0x0D7,	%i1
	xor	%g2,	0x0F8C,	%o1
	movne	%xcc,	%i4,	%g1
	movne	%xcc,	%l6,	%l5
	movn	%icc,	%o5,	%o4
	movge	%xcc,	%g7,	%i7
	movrlez	%l2,	%o3,	%i5
	movcc	%icc,	%l0,	%g3
	andncc	%i2,	%i6,	%o7
	ldsb	[%l7 + 0x59],	%l3
	fandnot1	%f4,	%f2,	%f8
	mulscc	%g6,	0x168A,	%o2
	st	%f14,	[%l7 + 0x48]
	edge16ln	%o0,	%i0,	%l1
	edge8l	%i3,	%l4,	%g5
	stx	%g4,	[%l7 + 0x10]
	srax	%o6,	0x12,	%i1
	sth	%g2,	[%l7 + 0x5A]
	movvc	%icc,	%i4,	%o1
	ld	[%l7 + 0x48],	%f2
	array16	%l6,	%l5,	%o5
	udivcc	%o4,	0x0BD2,	%g1
	stb	%i7,	[%l7 + 0x5A]
	movrlz	%l2,	%g7,	%i5
	fmovdne	%xcc,	%f3,	%f6
	fcmpgt16	%f28,	%f12,	%l0
	movrgz	%o3,	0x05C,	%g3
	movrgz	%i2,	%o7,	%i6
	fandnot2s	%f18,	%f9,	%f10
	srax	%g6,	%l3,	%o2
	edge8l	%o0,	%l1,	%i3
	stx	%l4,	[%l7 + 0x58]
	sethi	0x16F4,	%g5
	andcc	%i0,	0x187F,	%o6
	stb	%i1,	[%l7 + 0x4F]
	sdiv	%g2,	0x0D2E,	%g4
	sra	%i4,	%l6,	%o1
	fmovrdgez	%l5,	%f20,	%f16
	ldsh	[%l7 + 0x7A],	%o5
	fnors	%f31,	%f29,	%f3
	umulcc	%g1,	%i7,	%o4
	movn	%icc,	%l2,	%i5
	fmovrslz	%l0,	%f21,	%f26
	movleu	%icc,	%g7,	%o3
	movvc	%icc,	%i2,	%g3
	edge16ln	%i6,	%g6,	%l3
	edge16	%o7,	%o0,	%l1
	xor	%i3,	0x1623,	%l4
	array16	%g5,	%i0,	%o6
	edge8ln	%o2,	%g2,	%g4
	movgu	%xcc,	%i4,	%i1
	xnorcc	%l6,	0x101C,	%o1
	srlx	%l5,	%g1,	%i7
	sdivcc	%o4,	0x01E1,	%o5
	or	%i5,	0x0B17,	%l2
	fxor	%f26,	%f28,	%f6
	ldd	[%l7 + 0x78],	%f18
	fornot1	%f18,	%f26,	%f28
	subcc	%l0,	0x0A75,	%o3
	ldub	[%l7 + 0x74],	%g7
	xnor	%g3,	%i6,	%g6
	fsrc2s	%f1,	%f0
	alignaddr	%l3,	%i2,	%o0
	smulcc	%o7,	%l1,	%l4
	fmovd	%f16,	%f28
	st	%f24,	[%l7 + 0x58]
	edge32	%g5,	%i0,	%i3
	smulcc	%o2,	0x1D86,	%o6
	fpsub16	%f18,	%f2,	%f0
	edge8n	%g4,	%i4,	%g2
	movcs	%xcc,	%l6,	%i1
	movne	%icc,	%o1,	%l5
	edge8ln	%g1,	%i7,	%o5
	restore %i5, 0x075E, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l0,	0x0BBF,	%o3
	fmovsa	%icc,	%f29,	%f9
	udivcc	%g7,	0x03C4,	%g3
	sdivx	%o4,	0x097B,	%g6
	move	%xcc,	%i6,	%i2
	edge16l	%l3,	%o0,	%o7
	fnegd	%f6,	%f6
	fmovsl	%icc,	%f19,	%f16
	sdiv	%l4,	0x1BEA,	%g5
	movcc	%icc,	%i0,	%i3
	movrne	%l1,	%o2,	%o6
	ldsh	[%l7 + 0x54],	%i4
	edge16ln	%g4,	%l6,	%i1
	fand	%f10,	%f20,	%f10
	stx	%g2,	[%l7 + 0x28]
	orn	%o1,	0x16E3,	%g1
	fornot2s	%f23,	%f3,	%f14
	fcmpne16	%f20,	%f28,	%i7
	fmovdpos	%xcc,	%f9,	%f13
	movleu	%xcc,	%l5,	%o5
	subccc	%l2,	%l0,	%o3
	array16	%i5,	%g3,	%o4
	lduh	[%l7 + 0x0C],	%g7
	udivx	%i6,	0x09BE,	%i2
	subccc	%l3,	%o0,	%o7
	xorcc	%g6,	0x1703,	%g5
	fmovsne	%icc,	%f7,	%f9
	addccc	%l4,	0x168A,	%i0
	movne	%icc,	%l1,	%i3
	edge16l	%o6,	%o2,	%g4
	movrlz	%i4,	0x278,	%l6
	lduh	[%l7 + 0x50],	%g2
	fmovsvs	%icc,	%f26,	%f27
	fmuld8ulx16	%f5,	%f26,	%f16
	movneg	%icc,	%o1,	%i1
	array8	%g1,	%i7,	%l5
	ldsb	[%l7 + 0x1E],	%l2
	add	%l0,	0x14F1,	%o5
	ldx	[%l7 + 0x58],	%o3
	fmovsle	%icc,	%f13,	%f17
	std	%f0,	[%l7 + 0x10]
	fmovdpos	%icc,	%f31,	%f19
	sethi	0x1A26,	%i5
	stx	%g3,	[%l7 + 0x40]
	fmuld8ulx16	%f5,	%f26,	%f20
	orcc	%g7,	0x0DC3,	%o4
	movgu	%icc,	%i2,	%l3
	and	%o0,	%o7,	%g6
	stb	%i6,	[%l7 + 0x62]
	andncc	%g5,	%l4,	%l1
	stb	%i0,	[%l7 + 0x40]
	edge32	%i3,	%o2,	%o6
	edge8	%i4,	%g4,	%g2
	movleu	%xcc,	%l6,	%o1
	addcc	%g1,	0x076A,	%i7
	fmovsne	%icc,	%f4,	%f0
	orn	%i1,	%l2,	%l5
	ldx	[%l7 + 0x28],	%o5
	addcc	%o3,	0x0855,	%l0
	fxors	%f27,	%f24,	%f23
	array16	%g3,	%i5,	%g7
	array16	%o4,	%i2,	%o0
	sethi	0x0F78,	%l3
	andcc	%o7,	0x1F1C,	%i6
	fmovsvs	%xcc,	%f15,	%f27
	addccc	%g6,	0x060F,	%l4
	xnor	%l1,	%i0,	%g5
	edge16	%i3,	%o2,	%o6
	fmovrse	%g4,	%f22,	%f15
	nop
	set	0x49, %g7
	stb	%g2,	[%l7 + %g7]
	bshuffle	%f12,	%f30,	%f28
	fpsub32s	%f19,	%f8,	%f1
	smulcc	%l6,	0x110A,	%o1
	movrlez	%i4,	%g1,	%i1
	movcs	%icc,	%l2,	%i7
	udivx	%l5,	0x0D4D,	%o3
	edge32ln	%o5,	%g3,	%i5
	movneg	%xcc,	%g7,	%o4
	xnorcc	%l0,	%i2,	%o0
	subcc	%o7,	0x111D,	%l3
	fors	%f27,	%f21,	%f12
	ldd	[%l7 + 0x48],	%i6
	fcmpne32	%f22,	%f6,	%g6
	sll	%l1,	%i0,	%g5
	ldx	[%l7 + 0x30],	%i3
	movge	%xcc,	%o2,	%o6
	smulcc	%g4,	0x1EBC,	%g2
	ld	[%l7 + 0x40],	%f27
	lduh	[%l7 + 0x7E],	%l6
	edge16ln	%o1,	%i4,	%g1
	udiv	%i1,	0x11BB,	%l2
	sllx	%l4,	0x1C,	%i7
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	addccc	%o5,	0x15A9,	%g3
	fmovdgu	%icc,	%f14,	%f26
	fandnot2s	%f16,	%f15,	%f13
	sth	%i5,	[%l7 + 0x3E]
	restore %o4, %l0, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%i2,	%f0,	%f0
	udivx	%o0,	0x015A,	%l3
	andcc	%i6,	%g6,	%l1
	lduh	[%l7 + 0x5E],	%o7
	stb	%i0,	[%l7 + 0x31]
	subcc	%i3,	%g5,	%o2
	stw	%o6,	[%l7 + 0x54]
	fnors	%f29,	%f6,	%f26
	movge	%icc,	%g4,	%l6
	mulscc	%o1,	%i4,	%g2
	smul	%i1,	0x0B4E,	%l2
	lduh	[%l7 + 0x50],	%l4
	sub	%i7,	%o3,	%l5
	movrne	%g1,	0x18E,	%o5
	orncc	%i5,	%g3,	%o4
	umulcc	%l0,	0x0109,	%g7
	movleu	%icc,	%i2,	%l3
	edge32l	%i6,	%o0,	%g6
	edge8	%o7,	%i0,	%i3
	fmovrdlz	%g5,	%f0,	%f0
	edge16n	%l1,	%o2,	%o6
	sth	%g4,	[%l7 + 0x3C]
	ldx	[%l7 + 0x28],	%l6
	srax	%o1,	0x04,	%g2
	xorcc	%i4,	%l2,	%i1
	st	%f10,	[%l7 + 0x7C]
	srax	%i7,	0x1A,	%l4
	movl	%icc,	%o3,	%l5
	xorcc	%g1,	%o5,	%g3
	edge16ln	%i5,	%l0,	%o4
	edge16	%g7,	%l3,	%i2
	movvs	%icc,	%i6,	%g6
	fcmped	%fcc3,	%f12,	%f12
	srax	%o7,	0x05,	%o0
	edge16l	%i0,	%i3,	%l1
	popc	%o2,	%o6
	orncc	%g4,	0x1208,	%g5
	edge32ln	%o1,	%l6,	%g2
	fmovs	%f2,	%f8
	edge32	%i4,	%l2,	%i1
	st	%f1,	[%l7 + 0x1C]
	fmovda	%xcc,	%f11,	%f24
	smulcc	%i7,	0x0D19,	%l4
	movneg	%icc,	%o3,	%g1
	ld	[%l7 + 0x4C],	%f18
	ldd	[%l7 + 0x30],	%f28
	movcc	%icc,	%o5,	%g3
	andcc	%i5,	%l0,	%o4
	edge8	%l5,	%l3,	%g7
	addccc	%i6,	%g6,	%i2
	mulx	%o0,	0x0949,	%o7
	or	%i0,	%i3,	%l1
	ld	[%l7 + 0x78],	%f11
	sllx	%o2,	0x1C,	%g4
	fands	%f24,	%f9,	%f14
	ldsw	[%l7 + 0x10],	%o6
	alignaddr	%g5,	%o1,	%g2
	edge16	%l6,	%i4,	%i1
	fnot2	%f30,	%f20
	fmul8ulx16	%f12,	%f22,	%f26
	subc	%i7,	%l4,	%l2
	fpackfix	%f4,	%f1
	xnorcc	%o3,	%o5,	%g1
	ldx	[%l7 + 0x68],	%i5
	move	%icc,	%l0,	%o4
	edge8ln	%g3,	%l3,	%g7
	umul	%l5,	0x091F,	%g6
	movrgz	%i6,	%i2,	%o0
	ldd	[%l7 + 0x58],	%f20
	fmovdneg	%xcc,	%f26,	%f30
	addc	%o7,	%i3,	%i0
	fmovrsgz	%o2,	%f24,	%f2
	or	%l1,	%o6,	%g4
	fmovsa	%xcc,	%f22,	%f30
	orn	%g5,	0x0A4B,	%g2
	ldd	[%l7 + 0x58],	%f26
	movpos	%xcc,	%l6,	%i4
	umulcc	%i1,	%i7,	%o1
	add	%l4,	0x05E1,	%l2
	subccc	%o3,	0x1538,	%o5
	sdiv	%i5,	0x0BFD,	%l0
	sllx	%g1,	0x05,	%o4
	movrlz	%l3,	0x2EF,	%g3
	orcc	%g7,	0x07A9,	%g6
	orncc	%i6,	0x16F9,	%i2
	andncc	%o0,	%l5,	%i3
	sll	%i0,	0x1B,	%o7
	bshuffle	%f4,	%f12,	%f8
	array32	%l1,	%o2,	%g4
	udivx	%o6,	0x1B80,	%g2
	movrlez	%g5,	%i4,	%i1
	fmovdneg	%icc,	%f22,	%f24
	movl	%icc,	%l6,	%o1
	fmul8ulx16	%f24,	%f0,	%f6
	or	%l4,	%i7,	%l2
	edge16l	%o3,	%i5,	%l0
	fnot2s	%f22,	%f21
	fmovsn	%xcc,	%f31,	%f6
	mulx	%o5,	0x15C3,	%g1
	fmovrdlz	%l3,	%f14,	%f12
	movpos	%icc,	%o4,	%g7
	sth	%g6,	[%l7 + 0x2E]
	stb	%i6,	[%l7 + 0x4B]
	edge32	%i2,	%o0,	%l5
	subcc	%i3,	%i0,	%o7
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%g2
	stb	%l1,	[%l7 + 0x5C]
	umulcc	%g4,	%o6,	%o2
	ldsh	[%l7 + 0x32],	%g2
	sir	0x1D78
	fnot1s	%f28,	%f26
	sll	%g5,	%i1,	%i4
	fmovrde	%l6,	%f28,	%f8
	fmovrsgz	%l4,	%f9,	%f0
	ldd	[%l7 + 0x50],	%f12
	save %i7, 0x11D0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f8,	%f24,	%f12
	array32	%l2,	%i5,	%l0
	sir	0x09C2
	addccc	%o5,	%o3,	%g1
	fmovdvs	%icc,	%f17,	%f13
	stw	%l3,	[%l7 + 0x14]
	addc	%g7,	%o4,	%g6
	nop
	set	0x18, %o7
	std	%f30,	[%l7 + %o7]
	edge16l	%i6,	%o0,	%l5
	edge8n	%i2,	%i3,	%i0
	lduw	[%l7 + 0x5C],	%g3
	xor	%o7,	%g4,	%o6
	andn	%o2,	0x1310,	%g2
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%g4
	movne	%xcc,	%l1,	%i1
	ldd	[%l7 + 0x68],	%f30
	nop
	set	0x78, %i1
	ldx	[%l7 + %i1],	%i4
	stb	%l6,	[%l7 + 0x38]
	sth	%l4,	[%l7 + 0x62]
	movrgz	%o1,	%l2,	%i5
	lduw	[%l7 + 0x60],	%i7
	nop
	set	0x78, %i2
	stb	%l0,	[%l7 + %i2]
	edge32l	%o3,	%g1,	%o5
	sub	%g7,	0x0B40,	%o4
	orn	%l3,	0x1699,	%i6
	fsrc2	%f14,	%f16
	array32	%o0,	%g6,	%i2
	movrlez	%l5,	0x26A,	%i0
	ldsb	[%l7 + 0x6D],	%i3
	srlx	%o7,	0x02,	%g4
	xnor	%g3,	%o2,	%g2
	movrlez	%o6,	%g5,	%i1
	fmuld8sux16	%f13,	%f21,	%f28
	edge16n	%i4,	%l6,	%l4
	movpos	%icc,	%o1,	%l1
	addc	%i5,	%i7,	%l0
	sllx	%l2,	0x00,	%g1
	smulcc	%o5,	%o3,	%o4
	srax	%g7,	0x19,	%l3
	movg	%icc,	%o0,	%i6
	smulcc	%g6,	0x1254,	%l5
	mulx	%i0,	%i2,	%o7
	mova	%icc,	%g4,	%i3
	sth	%g3,	[%l7 + 0x0A]
	sdiv	%g2,	0x0C77,	%o6
	fpadd32	%f4,	%f18,	%f16
	edge16l	%o2,	%i1,	%i4
	sethi	0x0C73,	%g5
	udiv	%l4,	0x1E89,	%o1
	movgu	%xcc,	%l1,	%i5
	sub	%i7,	0x1BB4,	%l0
	sra	%l2,	0x0C,	%g1
	add	%o5,	%l6,	%o4
	add	%o3,	%l3,	%o0
	alignaddr	%i6,	%g6,	%g7
	sra	%i0,	0x18,	%l5
	orn	%o7,	%i2,	%i3
	smul	%g4,	%g2,	%o6
	subcc	%o2,	0x0201,	%g3
	movneg	%xcc,	%i4,	%g5
	fnot2	%f0,	%f24
	edge8ln	%l4,	%o1,	%l1
	ld	[%l7 + 0x38],	%f24
	alignaddrl	%i1,	%i7,	%l0
	fornot1	%f4,	%f0,	%f10
	edge16n	%i5,	%l2,	%o5
	array32	%g1,	%l6,	%o3
	bshuffle	%f2,	%f14,	%f24
	bshuffle	%f22,	%f2,	%f8
	xnorcc	%l3,	0x17BE,	%o0
	movn	%xcc,	%i6,	%o4
	movge	%xcc,	%g7,	%i0
	ld	[%l7 + 0x3C],	%f1
	stb	%g6,	[%l7 + 0x70]
	edge8	%l5,	%o7,	%i3
	fpadd32s	%f22,	%f16,	%f7
	movvs	%icc,	%g4,	%i2
	fmovrdgz	%g2,	%f24,	%f16
	sll	%o6,	%g3,	%i4
	edge8	%g5,	%l4,	%o2
	and	%o1,	0x132F,	%i1
	sdiv	%i7,	0x0159,	%l1
	fmovdcs	%icc,	%f9,	%f27
	mova	%xcc,	%l0,	%l2
	subccc	%i5,	0x016F,	%o5
	andn	%l6,	0x1045,	%g1
	movrne	%o3,	0x1E5,	%o0
	bshuffle	%f18,	%f10,	%f0
	edge8l	%l3,	%i6,	%o4
	smulcc	%i0,	%g6,	%g7
	addc	%l5,	0x161F,	%o7
	edge32n	%i3,	%g4,	%g2
	subccc	%i2,	%g3,	%i4
	subc	%o6,	%g5,	%o2
	fpackfix	%f0,	%f15
	fcmple16	%f20,	%f24,	%o1
	orncc	%i1,	%l4,	%l1
	ldsw	[%l7 + 0x40],	%l0
	fmuld8sux16	%f2,	%f22,	%f28
	ldd	[%l7 + 0x38],	%i6
	stx	%l2,	[%l7 + 0x38]
	fmovse	%xcc,	%f22,	%f6
	std	%f16,	[%l7 + 0x10]
	pdist	%f4,	%f4,	%f28
	fnot2s	%f18,	%f28
	save %i5, %l6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o3,	%g1,	%o0
	movl	%xcc,	%l3,	%o4
	edge8n	%i0,	%g6,	%i6
	movrne	%g7,	%o7,	%i3
	movrlz	%g4,	%g2,	%i2
	fsrc2	%f16,	%f4
	edge8ln	%l5,	%g3,	%i4
	sdivcc	%o6,	0x0CF6,	%o2
	or	%o1,	0x1A9D,	%i1
	edge8n	%g5,	%l1,	%l0
	edge8l	%l4,	%l2,	%i7
	udivcc	%i5,	0x1E86,	%o5
	udivcc	%l6,	0x019C,	%g1
	edge8l	%o3,	%l3,	%o4
	popc	0x12E8,	%i0
	orn	%o0,	0x010A,	%i6
	srl	%g6,	0x1C,	%o7
	movpos	%icc,	%g7,	%g4
	popc	0x1761,	%i3
	lduh	[%l7 + 0x64],	%i2
	xorcc	%l5,	0x0DA6,	%g2
	andncc	%i4,	%g3,	%o2
	move	%icc,	%o1,	%o6
	add	%i1,	%g5,	%l1
	srax	%l0,	%l2,	%i7
	ldd	[%l7 + 0x28],	%f30
	nop
	set	0x48, %g5
	stx	%i5,	[%l7 + %g5]
	movle	%icc,	%l4,	%o5
	or	%g1,	%o3,	%l3
	edge8	%o4,	%i0,	%o0
	edge16	%l6,	%g6,	%i6
	srax	%o7,	%g7,	%i3
	movl	%xcc,	%g4,	%i2
	edge32n	%g2,	%i4,	%g3
	xor	%o2,	0x1AE2,	%o1
	std	%f10,	[%l7 + 0x50]
	xnor	%l5,	%o6,	%i1
	smulcc	%l1,	0x15DA,	%g5
	udivcc	%l2,	0x1088,	%i7
	mulscc	%i5,	%l4,	%o5
	sub	%l0,	%o3,	%l3
	ldsh	[%l7 + 0x14],	%o4
	movne	%xcc,	%g1,	%i0
	fpsub32s	%f15,	%f21,	%f6
	fcmpeq16	%f26,	%f6,	%l6
	movleu	%xcc,	%o0,	%g6
	srl	%o7,	%i6,	%g7
	alignaddrl	%g4,	%i2,	%i3
	sdivcc	%i4,	0x1FF2,	%g3
	subc	%g2,	%o2,	%o1
	edge32	%o6,	%i1,	%l1
	fandnot2s	%f16,	%f31,	%f22
	srax	%l5,	%l2,	%i7
	fnot1	%f0,	%f14
	ldd	[%l7 + 0x28],	%g4
	umulcc	%i5,	0x0C2A,	%o5
	edge16ln	%l4,	%o3,	%l0
	fandnot2s	%f18,	%f15,	%f11
	movn	%icc,	%o4,	%g1
	udivcc	%i0,	0x0C36,	%l6
	xnor	%l3,	%g6,	%o7
	fxnors	%f7,	%f17,	%f28
	xor	%i6,	%g7,	%g4
	and	%o0,	0x0D8A,	%i3
	ldub	[%l7 + 0x53],	%i4
	fmovde	%icc,	%f19,	%f11
	sllx	%g3,	0x02,	%g2
	movl	%xcc,	%o2,	%i2
	bshuffle	%f2,	%f8,	%f20
	faligndata	%f24,	%f2,	%f30
	umul	%o1,	0x0B8E,	%o6
	pdist	%f26,	%f24,	%f2
	xor	%l1,	0x004B,	%i1
	sdiv	%l2,	0x0D66,	%i7
	ldd	[%l7 + 0x28],	%l4
	sllx	%g5,	%o5,	%l4
	umul	%i5,	0x0A31,	%o3
	movn	%xcc,	%o4,	%l0
	ld	[%l7 + 0x70],	%f30
	for	%f16,	%f14,	%f14
	movvc	%xcc,	%i0,	%g1
	fmovsleu	%xcc,	%f10,	%f13
	or	%l6,	%l3,	%g6
	fmovdg	%icc,	%f16,	%f20
	save %o7, %i6, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f24,	%f4,	%f16
	sethi	0x1E98,	%o0
	xor	%i3,	%i4,	%g3
	edge16l	%g2,	%g7,	%i2
	fmovsleu	%icc,	%f22,	%f14
	edge32l	%o2,	%o6,	%o1
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	std	%f12,	[%l7 + 0x70]
	srl	%i7,	%l5,	%g5
	ldsw	[%l7 + 0x44],	%o5
	mulx	%l2,	%l4,	%i5
	ldsb	[%l7 + 0x18],	%o3
	and	%o4,	%i0,	%g1
	popc	%l6,	%l0
	fmovsn	%icc,	%f14,	%f5
	fzero	%f0
	sdivcc	%l3,	0x19B3,	%g6
	udivx	%o7,	0x127A,	%i6
	fmovdcs	%xcc,	%f10,	%f10
	lduw	[%l7 + 0x24],	%g4
	fmovdvc	%xcc,	%f22,	%f1
	edge16ln	%o0,	%i3,	%g3
	edge8ln	%i4,	%g2,	%i2
	fmovscc	%icc,	%f4,	%f21
	fmovsn	%xcc,	%f22,	%f2
	edge16n	%g7,	%o6,	%o1
	stb	%l1,	[%l7 + 0x7C]
	fmovda	%xcc,	%f0,	%f0
	movrgez	%i1,	%o2,	%l5
	xnor	%g5,	%i7,	%l2
	umul	%o5,	%l4,	%o3
	sir	0x0E6D
	ldub	[%l7 + 0x35],	%i5
	edge8n	%i0,	%g1,	%l6
	movneg	%xcc,	%l0,	%l3
	orn	%o4,	0x08AC,	%g6
	edge8n	%i6,	%o7,	%o0
	fcmple16	%f12,	%f16,	%i3
	movn	%icc,	%g3,	%i4
	mulscc	%g2,	%i2,	%g4
	stw	%o6,	[%l7 + 0x58]
	fmovrsne	%o1,	%f28,	%f15
	mova	%xcc,	%l1,	%i1
	edge8	%o2,	%l5,	%g5
	lduw	[%l7 + 0x44],	%g7
	movge	%xcc,	%l2,	%i7
	fcmple32	%f0,	%f26,	%o5
	movrne	%l4,	0x0F1,	%i5
	movg	%icc,	%o3,	%g1
	fmovdn	%icc,	%f1,	%f9
	and	%i0,	0x1099,	%l6
	movcc	%xcc,	%l3,	%l0
	st	%f19,	[%l7 + 0x50]
	fexpand	%f9,	%f16
	edge8	%g6,	%i6,	%o7
	fsrc1	%f2,	%f16
	and	%o0,	%i3,	%o4
	movrlez	%i4,	0x0BC,	%g2
	edge16l	%i2,	%g4,	%g3
	nop
	set	0x62, %g1
	sth	%o1,	[%l7 + %g1]
	edge32ln	%l1,	%o6,	%i1
	fnot1	%f24,	%f26
	addc	%l5,	0x1391,	%g5
	fornot1s	%f5,	%f8,	%f3
	fmovdg	%xcc,	%f2,	%f4
	addc	%g7,	0x05EB,	%l2
	movge	%icc,	%o2,	%o5
	fmovsn	%icc,	%f24,	%f4
	bshuffle	%f4,	%f16,	%f14
	orcc	%l4,	%i5,	%i7
	add	%g1,	0x106B,	%i0
	mulx	%l6,	0x06CE,	%o3
	stx	%l3,	[%l7 + 0x10]
	movge	%icc,	%l0,	%g6
	edge32ln	%o7,	%i6,	%i3
	sub	%o4,	%o0,	%i4
	movrlez	%g2,	0x19A,	%i2
	srlx	%g3,	%g4,	%l1
	movrgez	%o1,	%i1,	%l5
	for	%f30,	%f20,	%f8
	ldsb	[%l7 + 0x24],	%o6
	edge16n	%g5,	%g7,	%l2
	add	%o2,	0x1B71,	%o5
	fmul8sux16	%f20,	%f24,	%f22
	fxnor	%f0,	%f20,	%f28
	add	%i5,	%l4,	%i7
	andcc	%i0,	%g1,	%l6
	fnot2s	%f17,	%f4
	movpos	%icc,	%o3,	%l3
	sra	%g6,	%o7,	%i6
	movne	%xcc,	%l0,	%i3
	movneg	%xcc,	%o4,	%i4
	edge32n	%o0,	%i2,	%g3
	sra	%g2,	0x01,	%g4
	fpadd32s	%f27,	%f24,	%f3
	save %l1, 0x0232, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o1,	%o6
	orn	%l5,	0x194B,	%g5
	sir	0x0585
	for	%f18,	%f2,	%f10
	fmovsleu	%icc,	%f30,	%f27
	fornot2s	%f0,	%f9,	%f2
	ldx	[%l7 + 0x60],	%l2
	ldd	[%l7 + 0x10],	%g6
	and	%o2,	0x02F9,	%i5
	movrlz	%l4,	%o5,	%i0
	movne	%icc,	%i7,	%l6
	fmovrdlez	%g1,	%f8,	%f6
	ldsh	[%l7 + 0x24],	%o3
	edge8	%g6,	%l3,	%o7
	fpmerge	%f24,	%f11,	%f12
	fcmpgt32	%f0,	%f14,	%l0
	fmovdl	%xcc,	%f20,	%f21
	srlx	%i6,	%i3,	%o4
	restore %o0, %i2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%g3,	%f2,	%f0
	fnot2s	%f15,	%f27
	xnorcc	%g2,	0x1EAA,	%g4
	edge8l	%i1,	%l1,	%o1
	subccc	%o6,	%l5,	%g5
	ldd	[%l7 + 0x38],	%l2
	sra	%o2,	%g7,	%l4
	fcmpgt16	%f4,	%f26,	%o5
	andn	%i0,	0x0EFB,	%i5
	srax	%i7,	%g1,	%l6
	addccc	%g6,	%o3,	%l3
	movvs	%xcc,	%o7,	%l0
	sth	%i3,	[%l7 + 0x0C]
	udivx	%o4,	0x0CE1,	%i6
	umulcc	%i2,	%i4,	%o0
	movleu	%xcc,	%g3,	%g2
	fmovdn	%icc,	%f8,	%f7
	movre	%i1,	0x33F,	%g4
	fcmpgt32	%f0,	%f8,	%l1
	ldub	[%l7 + 0x26],	%o6
	movle	%xcc,	%l5,	%o1
	move	%icc,	%l2,	%o2
	addc	%g7,	0x1E62,	%l4
	edge32ln	%g5,	%o5,	%i0
	udivcc	%i5,	0x03B3,	%g1
	sub	%i7,	0x17E9,	%g6
	fmovdvc	%xcc,	%f5,	%f27
	fmovdleu	%xcc,	%f0,	%f12
	mulscc	%l6,	0x0D31,	%l3
	movvs	%icc,	%o7,	%l0
	move	%xcc,	%i3,	%o3
	array32	%i6,	%o4,	%i2
	fand	%f4,	%f20,	%f18
	fcmpeq32	%f18,	%f8,	%o0
	andncc	%i4,	%g2,	%g3
	lduh	[%l7 + 0x2E],	%i1
	fcmple16	%f10,	%f6,	%l1
	sir	0x0DF3
	xnor	%g4,	0x04CF,	%o6
	std	%f10,	[%l7 + 0x18]
	stx	%l5,	[%l7 + 0x48]
	array16	%l2,	%o2,	%g7
	move	%xcc,	%l4,	%g5
	addc	%o1,	0x1882,	%o5
	edge8l	%i0,	%i5,	%i7
	edge16ln	%g6,	%l6,	%l3
	fabsd	%f0,	%f18
	addc	%o7,	0x1ECD,	%g1
	fnot1	%f28,	%f10
	subcc	%i3,	%o3,	%l0
	stw	%o4,	[%l7 + 0x6C]
	lduh	[%l7 + 0x3A],	%i2
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%f6
	movleu	%icc,	%i6,	%i4
	sdiv	%o0,	0x10A5,	%g3
	xnor	%i1,	%g2,	%l1
	st	%f29,	[%l7 + 0x68]
	st	%f0,	[%l7 + 0x38]
	mulscc	%o6,	%l5,	%l2
	edge32ln	%g4,	%o2,	%g7
	sethi	0x0A64,	%l4
	edge32	%g5,	%o5,	%o1
	fandnot2	%f12,	%f12,	%f2
	movleu	%xcc,	%i0,	%i5
	sdiv	%i7,	0x12FD,	%l6
	movrne	%l3,	%g6,	%g1
	andn	%i3,	0x0554,	%o3
	fornot1	%f10,	%f6,	%f14
	sub	%l0,	%o4,	%o7
	fmovda	%icc,	%f26,	%f29
	fmovsl	%xcc,	%f28,	%f13
	addc	%i6,	%i2,	%i4
	mulx	%o0,	%g3,	%i1
	or	%l1,	0x1CAD,	%o6
	fmovdpos	%icc,	%f31,	%f11
	movre	%l5,	0x2EB,	%l2
	sth	%g4,	[%l7 + 0x5C]
	edge16l	%g2,	%o2,	%l4
	array16	%g5,	%o5,	%o1
	fxnor	%f2,	%f26,	%f14
	stb	%g7,	[%l7 + 0x6E]
	movl	%icc,	%i5,	%i0
	xnorcc	%l6,	0x09E9,	%l3
	xor	%i7,	0x1144,	%g1
	movpos	%xcc,	%g6,	%i3
	and	%o3,	0x0831,	%l0
	array8	%o7,	%i6,	%o4
	fandnot2s	%f12,	%f1,	%f18
	fandnot1	%f4,	%f8,	%f6
	movrgez	%i2,	0x115,	%i4
	xnorcc	%o0,	%g3,	%l1
	sllx	%i1,	0x0F,	%l5
	fornot1s	%f14,	%f4,	%f28
	xnorcc	%l2,	%o6,	%g4
	andn	%g2,	%l4,	%o2
	sir	0x07C1
	movl	%xcc,	%g5,	%o5
	movle	%xcc,	%g7,	%o1
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	smul	%i5,	0x1505,	%g1
	ldx	[%l7 + 0x38],	%g6
	and	%i3,	%o3,	%i7
	ldd	[%l7 + 0x58],	%o6
	fpack32	%f16,	%f8,	%f26
	udivcc	%i6,	0x1F41,	%o4
	orncc	%l0,	0x0071,	%i2
	add	%i4,	0x0771,	%g3
	smulcc	%l1,	%o0,	%i1
	fpadd16	%f14,	%f26,	%f8
	edge32	%l2,	%l5,	%o6
	fxnor	%f14,	%f24,	%f26
	movrlz	%g4,	0x1DF,	%g2
	fmuld8ulx16	%f17,	%f2,	%f12
	fpadd16	%f28,	%f8,	%f0
	save %o2, %g5, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f20,	%f25
	movcs	%icc,	%g7,	%l4
	fornot1s	%f15,	%f17,	%f20
	edge8n	%i0,	%o1,	%l3
	fmovdn	%icc,	%f29,	%f2
	addcc	%l6,	%i5,	%g1
	array32	%i3,	%g6,	%i7
	sllx	%o7,	0x17,	%i6
	umulcc	%o3,	0x0946,	%o4
	fmovsgu	%icc,	%f0,	%f27
	ldd	[%l7 + 0x30],	%f2
	movneg	%icc,	%i2,	%i4
	save %g3, 0x07F9, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x48],	%f20
	alignaddrl	%l0,	%i1,	%o0
	fands	%f11,	%f1,	%f5
	sdivx	%l5,	0x00DC,	%l2
	fmul8ulx16	%f18,	%f30,	%f0
	fcmpgt16	%f4,	%f24,	%g4
	fmovsvc	%xcc,	%f17,	%f23
	stx	%g2,	[%l7 + 0x58]
	movre	%o6,	0x1C9,	%g5
	edge8	%o5,	%g7,	%o2
	sdivcc	%l4,	0x18FD,	%o1
	edge8	%l3,	%i0,	%l6
	movl	%xcc,	%g1,	%i5
	fnot2s	%f17,	%f20
	stx	%i3,	[%l7 + 0x28]
	fmul8x16al	%f5,	%f27,	%f28
	movneg	%icc,	%g6,	%i7
	andcc	%o7,	0x108F,	%i6
	subccc	%o3,	%i2,	%i4
	edge32	%o4,	%g3,	%l0
	orncc	%i1,	0x15B2,	%l1
	array16	%o0,	%l5,	%g4
	fmovdge	%icc,	%f17,	%f11
	xnorcc	%g2,	%o6,	%l2
	fcmpes	%fcc3,	%f15,	%f23
	andncc	%o5,	%g5,	%o2
	sth	%l4,	[%l7 + 0x46]
	fnegs	%f26,	%f0
	edge32ln	%g7,	%l3,	%o1
	restore %i0, %l6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i5,	0x0A8E,	%i3
	ldsh	[%l7 + 0x28],	%i7
	smulcc	%o7,	0x18E7,	%i6
	mulscc	%g6,	%i2,	%o3
	mova	%xcc,	%o4,	%i4
	lduw	[%l7 + 0x2C],	%g3
	addc	%i1,	%l0,	%o0
	pdist	%f26,	%f4,	%f12
	subc	%l5,	0x16A8,	%g4
	edge8l	%g2,	%o6,	%l1
	ldsb	[%l7 + 0x10],	%l2
	sethi	0x0C80,	%g5
	move	%xcc,	%o5,	%o2
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	st	%f2,	[%l7 + 0x08]
	sir	0x0521
	movge	%icc,	%l3,	%i0
	movgu	%icc,	%o1,	%l6
	sethi	0x0224,	%g1
	restore %i3, %i7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o7,	%g6,	%i6
	movrlez	%o3,	%i2,	%o4
	stb	%g3,	[%l7 + 0x17]
	nop
	set	0x44, %g4
	lduw	[%l7 + %g4],	%i1
	mulx	%i4,	0x02D4,	%l0
	movl	%icc,	%l5,	%g4
	movg	%icc,	%g2,	%o0
	stw	%o6,	[%l7 + 0x2C]
	sdivx	%l1,	0x11EA,	%g5
	movge	%xcc,	%o5,	%l2
	lduh	[%l7 + 0x12],	%g7
	umulcc	%l4,	%l3,	%o2
	fpadd32	%f8,	%f16,	%f8
	edge8n	%o1,	%l6,	%g1
	sub	%i3,	%i7,	%i0
	udivcc	%i5,	0x1236,	%o7
	ld	[%l7 + 0x38],	%f13
	ldsw	[%l7 + 0x70],	%g6
	bshuffle	%f26,	%f22,	%f2
	fxor	%f16,	%f26,	%f30
	edge32l	%o3,	%i2,	%o4
	udivx	%i6,	0x0539,	%g3
	movvc	%xcc,	%i4,	%i1
	ldsh	[%l7 + 0x3C],	%l5
	edge8l	%l0,	%g2,	%o0
	popc	0x0AE4,	%o6
	fmovdleu	%icc,	%f28,	%f29
	movl	%icc,	%g4,	%l1
	ldd	[%l7 + 0x30],	%f2
	mova	%icc,	%o5,	%g5
	sdivx	%g7,	0x01CA,	%l4
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	lduh	[%l7 + 0x5A],	%l6
	movcc	%icc,	%o1,	%g1
	nop
	set	0x38, %o1
	stw	%i7,	[%l7 + %o1]
	sdivx	%i0,	0x0B70,	%i5
	fones	%f6
	sdivx	%i3,	0x0FBE,	%o7
	lduw	[%l7 + 0x70],	%o3
	movrgz	%i2,	0x22E,	%g6
	xor	%o4,	0x0C01,	%g3
	smulcc	%i4,	%i6,	%l5
	subccc	%i1,	0x1098,	%g2
	andncc	%o0,	%l0,	%g4
	fnegd	%f12,	%f16
	popc	%l1,	%o5
	fpsub32	%f16,	%f6,	%f10
	fcmped	%fcc0,	%f28,	%f0
	srlx	%o6,	0x1B,	%g7
	fpmerge	%f12,	%f27,	%f12
	edge8l	%g5,	%l4,	%l2
	subcc	%l3,	0x027F,	%o2
	edge16l	%l6,	%o1,	%i7
	std	%f18,	[%l7 + 0x18]
	stw	%g1,	[%l7 + 0x3C]
	and	%i0,	%i5,	%i3
	array32	%o3,	%o7,	%i2
	stw	%g6,	[%l7 + 0x08]
	fmovrsgez	%g3,	%f4,	%f20
	fmovdvc	%xcc,	%f23,	%f19
	fmovrsgez	%o4,	%f29,	%f25
	fcmped	%fcc1,	%f8,	%f18
	siam	0x2
	srl	%i4,	0x0A,	%i6
	andcc	%l5,	%g2,	%o0
	std	%f28,	[%l7 + 0x18]
	movle	%xcc,	%i1,	%l0
	or	%g4,	%l1,	%o6
	addcc	%o5,	0x157D,	%g5
	sllx	%g7,	0x11,	%l4
	fmovsleu	%icc,	%f31,	%f11
	movleu	%icc,	%l3,	%l2
	fcmple16	%f6,	%f30,	%l6
	movvs	%icc,	%o1,	%i7
	sth	%g1,	[%l7 + 0x66]
	sth	%o2,	[%l7 + 0x16]
	movge	%icc,	%i5,	%i0
	stw	%i3,	[%l7 + 0x68]
	alignaddrl	%o3,	%i2,	%g6
	stw	%o7,	[%l7 + 0x24]
	movvc	%icc,	%g3,	%i4
	movne	%xcc,	%o4,	%l5
	andncc	%g2,	%o0,	%i1
	ld	[%l7 + 0x70],	%f12
	sra	%i6,	%l0,	%g4
	fandnot2	%f16,	%f8,	%f6
	fmovspos	%xcc,	%f3,	%f8
	fmuld8sux16	%f23,	%f31,	%f22
	fpadd32	%f2,	%f30,	%f6
	edge32n	%l1,	%o6,	%g5
	fabsd	%f6,	%f18
	fmovdn	%icc,	%f1,	%f9
	fmovdleu	%xcc,	%f28,	%f5
	orncc	%o5,	%l4,	%l3
	andn	%l2,	0x1B11,	%g7
	smul	%o1,	%i7,	%l6
	and	%o2,	0x12D4,	%i5
	fmovde	%xcc,	%f6,	%f24
	add	%i0,	%i3,	%g1
	sllx	%o3,	0x12,	%g6
	sethi	0x0D0E,	%i2
	fxors	%f20,	%f9,	%f7
	subc	%g3,	%o7,	%o4
	sub	%l5,	%i4,	%g2
	fpmerge	%f9,	%f3,	%f10
	fmovde	%xcc,	%f8,	%f16
	fmul8sux16	%f2,	%f18,	%f16
	nop
	set	0x50, %i3
	stw	%i1,	[%l7 + %i3]
	std	%f18,	[%l7 + 0x20]
	orcc	%o0,	0x0FF1,	%l0
	movrlz	%g4,	%i6,	%o6
	xnorcc	%g5,	%o5,	%l1
	movle	%icc,	%l4,	%l3
	udivx	%g7,	0x0683,	%o1
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f8
	fmovscs	%icc,	%f7,	%f20
	fabsd	%f26,	%f26
	array8	%l2,	%l6,	%i7
	edge8	%i5,	%o2,	%i0
	sdivx	%g1,	0x05BB,	%o3
	fcmpgt32	%f18,	%f12,	%g6
	addc	%i2,	%i3,	%g3
	xnor	%o7,	0x0802,	%o4
	edge16	%l5,	%i4,	%i1
	alignaddrl	%o0,	%l0,	%g2
	srax	%g4,	0x00,	%i6
	movle	%xcc,	%o6,	%o5
	sth	%l1,	[%l7 + 0x60]
	fcmpd	%fcc1,	%f30,	%f4
	fmovscc	%icc,	%f11,	%f17
	nop
	set	0x30, %g3
	stw	%g5,	[%l7 + %g3]
	edge8	%l4,	%l3,	%o1
	move	%xcc,	%g7,	%l6
	ldx	[%l7 + 0x38],	%i7
	fmul8ulx16	%f0,	%f14,	%f26
	movcc	%xcc,	%i5,	%o2
	edge32ln	%l2,	%i0,	%o3
	movne	%icc,	%g6,	%i2
	fmovdcs	%icc,	%f14,	%f1
	andncc	%g1,	%g3,	%i3
	movneg	%xcc,	%o4,	%l5
	movcc	%xcc,	%i4,	%i1
	subc	%o0,	%o7,	%g2
	orncc	%g4,	0x1F95,	%i6
	fandnot2s	%f29,	%f25,	%f6
	edge16ln	%o6,	%o5,	%l1
	andncc	%l0,	%g5,	%l3
	sdivcc	%l4,	0x1EA5,	%o1
	movge	%xcc,	%g7,	%i7
	stb	%i5,	[%l7 + 0x77]
	movcc	%xcc,	%l6,	%o2
	edge32l	%l2,	%o3,	%g6
	fnegs	%f10,	%f3
	edge16l	%i2,	%g1,	%g3
	movpos	%xcc,	%i3,	%o4
	fpsub16	%f6,	%f4,	%f6
	srax	%i0,	%i4,	%i1
	fmovrdgz	%l5,	%f26,	%f16
	andcc	%o0,	0x0061,	%o7
	fpadd32s	%f17,	%f27,	%f11
	sll	%g4,	0x19,	%g2
	ldx	[%l7 + 0x48],	%i6
	movrgz	%o5,	0x3AC,	%o6
	movrgez	%l1,	%l0,	%l3
	edge16n	%l4,	%g5,	%g7
	fornot1s	%f15,	%f11,	%f23
	lduw	[%l7 + 0x38],	%o1
	st	%f16,	[%l7 + 0x48]
	smul	%i7,	%l6,	%i5
	smulcc	%l2,	0x17A7,	%o2
	xorcc	%g6,	%i2,	%g1
	subccc	%o3,	%i3,	%g3
	fxnors	%f1,	%f15,	%f25
	fmovdg	%xcc,	%f15,	%f22
	movrlez	%o4,	%i4,	%i0
	mulscc	%l5,	0x0D20,	%i1
	movvs	%icc,	%o0,	%o7
	lduh	[%l7 + 0x14],	%g4
	and	%g2,	%i6,	%o6
	or	%l1,	%o5,	%l0
	fcmple32	%f8,	%f24,	%l3
	srl	%l4,	%g5,	%g7
	move	%icc,	%i7,	%l6
	andn	%i5,	%l2,	%o2
	fnot2	%f6,	%f28
	andn	%g6,	%o1,	%i2
	std	%f16,	[%l7 + 0x50]
	fmovrsgz	%g1,	%f9,	%f11
	ld	[%l7 + 0x18],	%f8
	and	%o3,	%i3,	%o4
	subc	%i4,	%i0,	%l5
	fones	%f28
	nop
	set	0x0A, %o4
	ldsb	[%l7 + %o4],	%g3
	edge8n	%i1,	%o7,	%g4
	lduw	[%l7 + 0x40],	%o0
	movpos	%icc,	%g2,	%o6
	andn	%i6,	%l1,	%l0
	addcc	%o5,	0x1511,	%l3
	or	%l4,	0x0D07,	%g7
	array16	%i7,	%g5,	%l6
	fnegd	%f0,	%f0
	sra	%i5,	0x05,	%o2
	srl	%l2,	0x07,	%o1
	addc	%i2,	%g6,	%g1
	fmovrsgz	%o3,	%f10,	%f20
	edge8	%o4,	%i4,	%i0
	add	%i3,	%l5,	%i1
	ldd	[%l7 + 0x30],	%f28
	edge8	%g3,	%o7,	%o0
	sth	%g4,	[%l7 + 0x0C]
	udiv	%g2,	0x03DB,	%i6
	movleu	%xcc,	%l1,	%o6
	movrne	%l0,	%o5,	%l4
	stb	%l3,	[%l7 + 0x5A]
	mulscc	%i7,	%g5,	%g7
	addccc	%i5,	%o2,	%l6
	ldsh	[%l7 + 0x66],	%l2
	xor	%o1,	%g6,	%g1
	subcc	%o3,	0x175C,	%o4
	movleu	%xcc,	%i2,	%i0
	sub	%i3,	0x1514,	%i4
	movrgz	%l5,	0x3B0,	%i1
	fmovdcs	%xcc,	%f26,	%f3
	fnot1s	%f3,	%f27
	and	%g3,	0x1358,	%o0
	edge32l	%o7,	%g4,	%g2
	lduw	[%l7 + 0x40],	%l1
	edge8n	%o6,	%i6,	%o5
	movcs	%icc,	%l4,	%l0
	umulcc	%i7,	%l3,	%g7
	fmovsvs	%icc,	%f21,	%f17
	and	%g5,	%i5,	%l6
	ldsb	[%l7 + 0x73],	%l2
	sub	%o1,	%g6,	%g1
	movgu	%xcc,	%o2,	%o3
	andn	%i2,	0x1CA5,	%o4
	ld	[%l7 + 0x30],	%f29
	udivx	%i3,	0x1979,	%i0
	fnands	%f8,	%f8,	%f18
	move	%xcc,	%l5,	%i4
	ldsh	[%l7 + 0x32],	%i1
	movvs	%icc,	%g3,	%o0
	andncc	%g4,	%o7,	%l1
	edge16ln	%o6,	%i6,	%o5
	movgu	%xcc,	%l4,	%g2
	sethi	0x1150,	%l0
	ldd	[%l7 + 0x38],	%l2
	addc	%i7,	%g5,	%g7
	srax	%i5,	0x18,	%l2
	edge32l	%o1,	%l6,	%g1
	ldd	[%l7 + 0x30],	%g6
	udivcc	%o2,	0x0D33,	%o3
	srax	%i2,	%o4,	%i3
	edge32l	%l5,	%i4,	%i1
	subccc	%i0,	0x04A2,	%o0
	addccc	%g3,	%o7,	%g4
	sth	%o6,	[%l7 + 0x6E]
	fpadd16s	%f19,	%f5,	%f12
	movrgz	%i6,	%o5,	%l4
	andncc	%g2,	%l0,	%l1
	fmovrdlz	%i7,	%f8,	%f26
	fcmpgt16	%f8,	%f16,	%g5
	addccc	%l3,	0x1728,	%g7
	sllx	%i5,	0x04,	%l2
	fmovsvs	%xcc,	%f6,	%f11
	or	%o1,	%l6,	%g6
	fors	%f16,	%f0,	%f17
	alignaddrl	%o2,	%g1,	%i2
	movrgz	%o4,	0x09B,	%o3
	alignaddrl	%l5,	%i4,	%i3
	fornot1s	%f12,	%f7,	%f17
	sub	%i0,	%o0,	%g3
	ldsh	[%l7 + 0x0C],	%i1
	std	%f22,	[%l7 + 0x50]
	fpsub32	%f14,	%f20,	%f30
	sdivcc	%g4,	0x16F9,	%o6
	sub	%i6,	0x1045,	%o5
	edge8n	%l4,	%o7,	%g2
	ldub	[%l7 + 0x63],	%l0
	fcmpeq16	%f26,	%f24,	%l1
	popc	0x1796,	%i7
	movrlez	%l3,	0x1F9,	%g5
	movpos	%icc,	%i5,	%l2
	and	%g7,	0x1F02,	%o1
	movge	%xcc,	%g6,	%l6
	movpos	%icc,	%g1,	%i2
	orcc	%o4,	%o3,	%l5
	srl	%o2,	%i4,	%i0
	stw	%i3,	[%l7 + 0x78]
	lduh	[%l7 + 0x14],	%g3
	nop
	set	0x58, %i7
	ldx	[%l7 + %i7],	%i1
	fmovsn	%xcc,	%f5,	%f21
	movl	%xcc,	%o0,	%o6
	movgu	%xcc,	%g4,	%i6
	st	%f23,	[%l7 + 0x3C]
	array32	%o5,	%o7,	%g2
	edge32ln	%l4,	%l0,	%l1
	addccc	%l3,	0x053A,	%g5
	nop
	set	0x68, %l1
	std	%f28,	[%l7 + %l1]
	fnor	%f18,	%f24,	%f22
	sll	%i5,	%i7,	%g7
	srl	%o1,	%g6,	%l6
	edge8n	%g1,	%l2,	%o4
	edge16n	%i2,	%o3,	%l5
	srl	%o2,	%i0,	%i4
	edge8l	%i3,	%g3,	%o0
	movl	%icc,	%i1,	%o6
	movleu	%xcc,	%i6,	%g4
	ldub	[%l7 + 0x67],	%o7
	orn	%o5,	0x1613,	%l4
	fmovrsgz	%g2,	%f17,	%f20
	sethi	0x0548,	%l1
	smul	%l3,	%g5,	%l0
	ldd	[%l7 + 0x38],	%i6
	ldd	[%l7 + 0x28],	%f20
	udiv	%g7,	0x1D17,	%i5
	sllx	%g6,	0x08,	%o1
	ldsb	[%l7 + 0x5A],	%l6
	array32	%g1,	%l2,	%i2
	restore %o3, 0x1215, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o2,	%i0,	%o4
	fcmple32	%f8,	%f22,	%i3
	nop
	set	0x1E, %o0
	sth	%g3,	[%l7 + %o0]
	edge8n	%o0,	%i4,	%o6
	sra	%i1,	%g4,	%i6
	movrgz	%o7,	0x2B6,	%l4
	movcc	%xcc,	%g2,	%l1
	movgu	%icc,	%o5,	%l3
	sdivcc	%l0,	0x006D,	%g5
	fmovrsgz	%g7,	%f24,	%f21
	stb	%i5,	[%l7 + 0x2D]
	addccc	%i7,	0x05FB,	%o1
	xnorcc	%g6,	%g1,	%l6
	xnorcc	%i2,	0x08EE,	%o3
	movgu	%xcc,	%l2,	%o2
	stw	%l5,	[%l7 + 0x3C]
	movvs	%icc,	%i0,	%o4
	or	%g3,	%o0,	%i4
	movvs	%icc,	%i3,	%i1
	fandnot2s	%f30,	%f10,	%f19
	movpos	%icc,	%g4,	%i6
	movre	%o7,	0x001,	%o6
	mulscc	%g2,	%l4,	%l1
	edge16	%o5,	%l3,	%g5
	stb	%l0,	[%l7 + 0x60]
	xnor	%i5,	0x0C6E,	%g7
	ldub	[%l7 + 0x28],	%o1
	stb	%i7,	[%l7 + 0x23]
	umul	%g6,	0x1A2C,	%g1
	sll	%l6,	%o3,	%i2
	movg	%icc,	%l2,	%o2
	sethi	0x07B3,	%l5
	fnot1	%f22,	%f6
	sdiv	%o4,	0x11FB,	%i0
	fmovrsgez	%o0,	%f15,	%f31
	xorcc	%g3,	0x0C79,	%i4
	movn	%icc,	%i1,	%i3
	nop
	set	0x40, %l6
	ldub	[%l7 + %l6],	%g4
	sdivx	%o7,	0x18BF,	%i6
	fmovsle	%icc,	%f5,	%f3
	ldx	[%l7 + 0x40],	%g2
	andn	%o6,	%l4,	%l1
	umul	%o5,	0x0044,	%l3
	alignaddrl	%g5,	%l0,	%i5
	ldd	[%l7 + 0x30],	%g6
	edge16	%i7,	%o1,	%g1
	movge	%xcc,	%g6,	%l6
	st	%f8,	[%l7 + 0x24]
	fandnot1	%f6,	%f22,	%f20
	lduh	[%l7 + 0x3A],	%o3
	srlx	%i2,	0x19,	%o2
	fmovsge	%xcc,	%f15,	%f16
	ldub	[%l7 + 0x41],	%l2
	sir	0x1133
	array16	%l5,	%i0,	%o4
	fsrc2s	%f0,	%f13
	or	%g3,	0x0D19,	%o0
	or	%i4,	0x04FE,	%i3
	edge8l	%g4,	%o7,	%i6
	ldd	[%l7 + 0x10],	%f20
	xorcc	%g2,	0x0E4E,	%o6
	umul	%i1,	%l4,	%o5
	andcc	%l1,	0x1377,	%l3
	lduh	[%l7 + 0x1E],	%g5
	ld	[%l7 + 0x64],	%f15
	fmul8x16au	%f3,	%f23,	%f4
	sdiv	%l0,	0x0DBB,	%i5
	movcs	%xcc,	%g7,	%i7
	sth	%g1,	[%l7 + 0x2C]
	fnegs	%f12,	%f12
	movrlez	%o1,	0x33D,	%g6
	fmovrsgz	%o3,	%f7,	%f1
	umulcc	%i2,	%l6,	%o2
	fmovsleu	%icc,	%f13,	%f29
	orn	%l5,	0x030E,	%l2
	ldx	[%l7 + 0x30],	%i0
	array32	%g3,	%o4,	%o0
	movre	%i4,	%g4,	%o7
	edge32	%i6,	%g2,	%i3
	sllx	%i1,	0x08,	%l4
	subcc	%o6,	0x043B,	%l1
	alignaddrl	%l3,	%o5,	%l0
	mulscc	%g5,	0x19B3,	%g7
	umulcc	%i5,	0x1D44,	%i7
	smul	%g1,	0x1300,	%o1
	edge32n	%g6,	%i2,	%l6
	xor	%o2,	%o3,	%l5
	sra	%l2,	%i0,	%o4
	save %o0, 0x061C, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x39],	%g4
	umul	%o7,	0x0E0B,	%i6
	movl	%xcc,	%g2,	%i3
	array16	%i4,	%i1,	%l4
	fnor	%f20,	%f6,	%f24
	sdivx	%o6,	0x1E44,	%l3
	save %o5, %l0, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g7,	%l1,	%i5
	andcc	%i7,	%o1,	%g6
	orncc	%g1,	%i2,	%o2
	fmovde	%icc,	%f18,	%f4
	movcc	%icc,	%l6,	%o3
	smul	%l5,	0x1A4D,	%i0
	fmovdleu	%xcc,	%f15,	%f25
	fmovdcs	%xcc,	%f16,	%f20
	subccc	%o4,	0x1F84,	%l2
	edge8	%o0,	%g3,	%o7
	ldsh	[%l7 + 0x6C],	%g4
	srl	%g2,	0x0F,	%i3
	subccc	%i6,	0x0F7F,	%i4
	smul	%i1,	%o6,	%l4
	ldsh	[%l7 + 0x08],	%l3
	edge16n	%o5,	%l0,	%g7
	umul	%l1,	0x0DBE,	%i5
	fmovdvs	%xcc,	%f26,	%f12
	sdivcc	%i7,	0x0804,	%g5
	fsrc1	%f0,	%f2
	sdivcc	%o1,	0x09EA,	%g6
	srl	%g1,	%i2,	%l6
	faligndata	%f12,	%f8,	%f16
	orn	%o2,	0x0E31,	%o3
	fands	%f23,	%f26,	%f3
	fnegd	%f2,	%f24
	xnor	%l5,	%i0,	%o4
	ldsw	[%l7 + 0x64],	%l2
	andn	%g3,	%o0,	%o7
	edge16n	%g4,	%i3,	%g2
	mulx	%i6,	%i4,	%o6
	udivcc	%l4,	0x14EC,	%i1
	move	%icc,	%l3,	%l0
	ldd	[%l7 + 0x18],	%f24
	lduw	[%l7 + 0x2C],	%g7
	fpmerge	%f14,	%f25,	%f2
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	movgu	%icc,	%i7,	%o1
	movvs	%xcc,	%g6,	%g5
	sdivcc	%i2,	0x1F56,	%l6
	ldsh	[%l7 + 0x0E],	%o2
	fornot2s	%f16,	%f0,	%f15
	fornot1s	%f3,	%f11,	%f18
	fmul8sux16	%f0,	%f10,	%f16
	movrgz	%o3,	0x06C,	%g1
	edge8	%l5,	%o4,	%l2
	fmovdle	%xcc,	%f24,	%f30
	edge32l	%g3,	%i0,	%o0
	edge16n	%o7,	%i3,	%g2
	sdivx	%g4,	0x0E2D,	%i6
	fcmpgt32	%f14,	%f12,	%i4
	fnands	%f4,	%f16,	%f0
	fandnot2s	%f4,	%f10,	%f19
	edge32l	%l4,	%o6,	%l3
	nop
	set	0x1B, %g2
	ldsb	[%l7 + %g2],	%l0
	movgu	%xcc,	%i1,	%o5
	xorcc	%g7,	%l1,	%i5
	movvc	%icc,	%o1,	%i7
	lduw	[%l7 + 0x08],	%g6
	addccc	%i2,	%g5,	%o2
	bshuffle	%f16,	%f28,	%f22
	movrgez	%o3,	%g1,	%l6
	orcc	%o4,	%l2,	%l5
	xorcc	%g3,	%i0,	%o7
	andn	%i3,	%g2,	%g4
	sub	%i6,	0x146E,	%i4
	orn	%o0,	0x0955,	%l4
	alignaddrl	%l3,	%o6,	%l0
	and	%i1,	%g7,	%l1
	alignaddr	%i5,	%o5,	%i7
	siam	0x4
	stw	%g6,	[%l7 + 0x60]
	movneg	%xcc,	%i2,	%o1
	array16	%g5,	%o2,	%g1
	fpack32	%f2,	%f18,	%f6
	fcmple32	%f22,	%f14,	%o3
	srlx	%l6,	%o4,	%l2
	st	%f11,	[%l7 + 0x54]
	subc	%l5,	%g3,	%o7
	fnot1s	%f21,	%f20
	movrne	%i0,	%i3,	%g4
	ldsb	[%l7 + 0x12],	%g2
	fmul8sux16	%f26,	%f10,	%f18
	fzero	%f6
	edge32l	%i4,	%o0,	%i6
	ldd	[%l7 + 0x30],	%l4
	move	%icc,	%l3,	%o6
	stx	%i1,	[%l7 + 0x38]
	srl	%g7,	%l1,	%i5
	fnot1s	%f7,	%f29
	movl	%xcc,	%l0,	%i7
	smulcc	%g6,	0x0F12,	%i2
	ld	[%l7 + 0x14],	%f5
	fones	%f1
	bshuffle	%f4,	%f8,	%f30
	sllx	%o5,	0x02,	%g5
	sra	%o1,	%o2,	%o3
	fnot2s	%f30,	%f31
	lduh	[%l7 + 0x68],	%l6
	fones	%f18
	movn	%xcc,	%g1,	%l2
	movre	%o4,	0x017,	%g3
	xnor	%l5,	%i0,	%o7
	fcmpne16	%f12,	%f2,	%i3
	alignaddrl	%g4,	%g2,	%o0
	edge8	%i6,	%l4,	%i4
	andncc	%o6,	%l3,	%g7
	fnot2	%f16,	%f6
	movcs	%xcc,	%i1,	%i5
	edge16	%l0,	%l1,	%g6
	movrlz	%i2,	0x390,	%o5
	addccc	%i7,	0x1582,	%o1
	ldd	[%l7 + 0x28],	%f20
	lduw	[%l7 + 0x2C],	%g5
	xnor	%o3,	%l6,	%o2
	orncc	%l2,	%g1,	%o4
	fmul8ulx16	%f28,	%f10,	%f24
	fmovdn	%icc,	%f3,	%f31
	movle	%icc,	%g3,	%l5
	subccc	%i0,	%i3,	%o7
	orcc	%g2,	%o0,	%i6
	fmul8sux16	%f22,	%f22,	%f8
	sub	%g4,	0x106B,	%l4
	xor	%o6,	0x0081,	%l3
	movne	%icc,	%i4,	%g7
	subc	%i1,	0x1F95,	%i5
	edge16l	%l1,	%l0,	%i2
	smul	%o5,	0x0F50,	%g6
	movleu	%xcc,	%i7,	%o1
	movrlez	%g5,	0x1E6,	%l6
	fmovsleu	%icc,	%f29,	%f19
	mulx	%o2,	0x07CA,	%o3
	andcc	%l2,	%o4,	%g3
	movcs	%icc,	%g1,	%i0
	fornot2s	%f20,	%f20,	%f31
	fzeros	%f21
	subccc	%l5,	0x1731,	%o7
	sth	%g2,	[%l7 + 0x1A]
	edge8	%i3,	%i6,	%g4
	movrne	%o0,	%o6,	%l4
	udivcc	%i4,	0x158A,	%l3
	fpsub32s	%f26,	%f31,	%f18
	edge32n	%i1,	%g7,	%l1
	fmul8ulx16	%f2,	%f30,	%f6
	edge16	%l0,	%i5,	%i2
	fmovscc	%icc,	%f10,	%f5
	array16	%o5,	%g6,	%i7
	array32	%g5,	%l6,	%o1
	umul	%o3,	0x1A61,	%l2
	addc	%o2,	0x1585,	%g3
	edge16n	%g1,	%o4,	%l5
	fmovsvc	%xcc,	%f1,	%f29
	orncc	%i0,	0x1F68,	%o7
	orncc	%g2,	0x09A3,	%i3
	fmovrdlz	%i6,	%f8,	%f20
	movg	%xcc,	%g4,	%o0
	fandnot1	%f14,	%f0,	%f6
	edge32n	%o6,	%i4,	%l3
	fandnot2	%f18,	%f4,	%f2
	edge8n	%l4,	%g7,	%i1
	smul	%l1,	0x0C29,	%l0
	andcc	%i2,	0x0A1C,	%o5
	ldx	[%l7 + 0x40],	%i5
	xnor	%g6,	0x1F9D,	%g5
	andcc	%l6,	%o1,	%i7
	fmovrdne	%l2,	%f14,	%f14
	fnot2s	%f20,	%f18
	ldsb	[%l7 + 0x66],	%o3
	fandnot2	%f30,	%f10,	%f14
	fcmpne16	%f22,	%f8,	%g3
	movre	%g1,	%o2,	%l5
	subccc	%i0,	0x1542,	%o7
	stx	%o4,	[%l7 + 0x60]
	movge	%xcc,	%g2,	%i6
	movrlez	%i3,	0x092,	%o0
	fmovse	%xcc,	%f5,	%f26
	edge8l	%g4,	%o6,	%l3
	fnot2s	%f13,	%f17
	st	%f26,	[%l7 + 0x5C]
	ldsh	[%l7 + 0x2A],	%l4
	fmovdcs	%xcc,	%f6,	%f26
	addc	%i4,	%g7,	%l1
	sra	%i1,	0x08,	%l0
	add	%i2,	0x0F66,	%i5
	ldsw	[%l7 + 0x30],	%g6
	subccc	%g5,	0x197E,	%o5
	fmovdleu	%xcc,	%f14,	%f14
	edge32n	%l6,	%o1,	%l2
	fmuld8ulx16	%f19,	%f18,	%f24
	movneg	%xcc,	%o3,	%i7
	lduh	[%l7 + 0x3C],	%g3
	movleu	%xcc,	%o2,	%g1
	popc	0x13EB,	%i0
	alignaddr	%o7,	%o4,	%l5
	restore %i6, 0x0EBF, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x04E6
	fmovsge	%icc,	%f4,	%f6
	fmul8x16al	%f1,	%f22,	%f22
	fxor	%f22,	%f0,	%f10
	srlx	%o0,	%i3,	%g4
	movvs	%xcc,	%l3,	%o6
	std	%f4,	[%l7 + 0x70]
	alignaddrl	%l4,	%g7,	%i4
	st	%f30,	[%l7 + 0x38]
	fpsub16	%f6,	%f10,	%f12
	array32	%l1,	%l0,	%i1
	movgu	%icc,	%i5,	%i2
	xor	%g6,	0x188A,	%o5
	srl	%g5,	%o1,	%l6
	edge32	%o3,	%l2,	%i7
	movne	%xcc,	%o2,	%g3
	ldd	[%l7 + 0x20],	%i0
	save %g1, %o4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o7,	%i6
	movle	%icc,	%o0,	%g2
	movleu	%xcc,	%g4,	%i3
	edge32ln	%o6,	%l3,	%l4
	mulscc	%g7,	%i4,	%l1
	stw	%i1,	[%l7 + 0x54]
	add	%l0,	0x0F8D,	%i5
	move	%icc,	%g6,	%i2
	addcc	%g5,	0x0015,	%o5
	fmovsgu	%icc,	%f10,	%f6
	fexpand	%f31,	%f30
	fabsd	%f4,	%f14
	movne	%icc,	%o1,	%o3
	fmovsvc	%xcc,	%f7,	%f18
	srl	%l2,	0x16,	%i7
	andncc	%l6,	%g3,	%i0
	fors	%f22,	%f5,	%f9
	orn	%o2,	0x0C96,	%o4
	subcc	%g1,	%l5,	%i6
	sdivx	%o7,	0x149E,	%o0
	edge16l	%g2,	%i3,	%g4
	siam	0x7
	fones	%f12
	movpos	%icc,	%o6,	%l4
	andn	%l3,	0x193A,	%g7
	smul	%i4,	0x195F,	%i1
	smulcc	%l0,	0x1808,	%i5
	andn	%g6,	%l1,	%i2
	movg	%icc,	%o5,	%g5
	fmovdl	%xcc,	%f12,	%f20
	sllx	%o1,	%o3,	%i7
	addccc	%l2,	0x0A55,	%l6
	andn	%i0,	%g3,	%o4
	fmovde	%xcc,	%f7,	%f21
	udiv	%o2,	0x063C,	%g1
	or	%i6,	%l5,	%o7
	fxors	%f4,	%f5,	%f5
	movg	%xcc,	%o0,	%i3
	subccc	%g2,	%g4,	%o6
	alignaddrl	%l3,	%l4,	%g7
	fcmpne32	%f2,	%f12,	%i4
	array16	%l0,	%i1,	%i5
	fcmpgt32	%f8,	%f12,	%g6
	fmovsvs	%xcc,	%f27,	%f20
	edge16	%i2,	%l1,	%g5
	popc	%o1,	%o3
	subc	%o5,	%l2,	%i7
	udivx	%i0,	0x17DA,	%l6
	xor	%o4,	%o2,	%g1
	fmovdle	%icc,	%f2,	%f11
	std	%f30,	[%l7 + 0x08]
	orcc	%i6,	%l5,	%o7
	orn	%g3,	%i3,	%o0
	srlx	%g2,	%g4,	%o6
	save %l4, 0x0548, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l3,	%l0,	%i1
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	stx	%l1,	[%l7 + 0x70]
	array8	%i2,	%o1,	%g5
	fxnor	%f8,	%f4,	%f28
	edge8ln	%o3,	%l2,	%i7
	xnor	%o5,	0x1778,	%i0
	move	%icc,	%o4,	%l6
	st	%f20,	[%l7 + 0x7C]
	stb	%o2,	[%l7 + 0x39]
	movcc	%xcc,	%g1,	%i6
	alignaddr	%o7,	%g3,	%l5
	movpos	%xcc,	%o0,	%i3
	edge16ln	%g4,	%g2,	%l4
	srlx	%o6,	%l3,	%l0
	smulcc	%g7,	%i4,	%i1
	fmovsa	%xcc,	%f14,	%f1
	sdivx	%g6,	0x0AC2,	%l1
	alignaddrl	%i2,	%i5,	%o1
	and	%o3,	0x0210,	%g5
	stx	%l2,	[%l7 + 0x68]
	subccc	%i7,	0x08EF,	%i0
	movrne	%o5,	0x0ED,	%o4
	sethi	0x0830,	%o2
	xnorcc	%l6,	%i6,	%g1
	xnorcc	%g3,	%l5,	%o7
	edge32l	%i3,	%o0,	%g2
	movleu	%icc,	%l4,	%o6
	array16	%l3,	%l0,	%g7
	srlx	%i4,	%g4,	%g6
	andn	%l1,	%i2,	%i1
	smul	%i5,	%o1,	%g5
	array8	%l2,	%i7,	%o3
	movle	%icc,	%o5,	%o4
	orcc	%o2,	%l6,	%i0
	smulcc	%g1,	0x1901,	%i6
	stw	%l5,	[%l7 + 0x60]
	movrgz	%g3,	%o7,	%i3
	ld	[%l7 + 0x08],	%f26
	orncc	%g2,	%o0,	%l4
	sdivx	%l3,	0x0DAD,	%o6
	restore %g7, 0x16A5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g4,	%g6,	%i4
	st	%f10,	[%l7 + 0x14]
	edge8l	%l1,	%i1,	%i2
	alignaddr	%o1,	%g5,	%l2
	stx	%i5,	[%l7 + 0x78]
	movvs	%xcc,	%o3,	%o5
	lduh	[%l7 + 0x72],	%i7
	edge8	%o2,	%l6,	%o4
	udivcc	%i0,	0x08ED,	%g1
	fnegd	%f22,	%f10
	edge32ln	%l5,	%g3,	%o7
	fmovsneg	%icc,	%f9,	%f12
	fmovdleu	%xcc,	%f25,	%f12
	edge8n	%i3,	%i6,	%g2
	movvc	%icc,	%l4,	%l3
	movre	%o0,	0x075,	%o6
	ldd	[%l7 + 0x68],	%f14
	fnegd	%f12,	%f2
	fxors	%f4,	%f10,	%f19
	edge8	%g7,	%g4,	%g6
	fmovrslz	%l0,	%f3,	%f4
	movle	%xcc,	%l1,	%i1
	add	%i4,	0x0DB0,	%i2
	xnorcc	%o1,	%g5,	%i5
	movneg	%icc,	%o3,	%l2
	fmovspos	%xcc,	%f2,	%f24
	ldsh	[%l7 + 0x5C],	%o5
	array16	%o2,	%i7,	%o4
	edge16ln	%l6,	%g1,	%i0
	movrgz	%g3,	0x044,	%o7
	movrgz	%l5,	0x0B3,	%i6
	fmul8ulx16	%f20,	%f28,	%f18
	edge16ln	%g2,	%l4,	%i3
	xnor	%l3,	%o6,	%o0
	array32	%g4,	%g6,	%l0
	sll	%l1,	0x1C,	%i1
	srax	%i4,	0x17,	%g7
	fcmpgt32	%f6,	%f16,	%i2
	edge32l	%g5,	%i5,	%o1
	sllx	%l2,	%o3,	%o2
	orn	%i7,	%o5,	%o4
	movrlz	%g1,	%l6,	%i0
	add	%o7,	0x1A3D,	%g3
	fmovrdlez	%l5,	%f8,	%f22
	fmovsne	%xcc,	%f25,	%f16
	movre	%g2,	%i6,	%l4
	sth	%l3,	[%l7 + 0x28]
	st	%f20,	[%l7 + 0x5C]
	fpadd16	%f22,	%f0,	%f14
	edge16ln	%i3,	%o0,	%g4
	movne	%xcc,	%g6,	%o6
	add	%l0,	0x076F,	%i1
	srax	%l1,	%i4,	%g7
	smul	%g5,	%i2,	%o1
	sdivx	%i5,	0x1883,	%o3
	fandnot1s	%f10,	%f25,	%f21
	sra	%l2,	%o2,	%o5
	movvs	%icc,	%i7,	%o4
	movne	%xcc,	%l6,	%i0
	orncc	%g1,	0x04D6,	%g3
	fmovsg	%icc,	%f11,	%f31
	fmovsg	%xcc,	%f28,	%f21
	edge8l	%l5,	%g2,	%o7
	sll	%l4,	0x0F,	%i6
	ldsh	[%l7 + 0x6C],	%l3
	umul	%i3,	%o0,	%g4
	fmovsleu	%icc,	%f30,	%f23
	fmul8x16	%f25,	%f22,	%f14
	sdivcc	%o6,	0x0C28,	%l0
	nop
	set	0x74, %o2
	ldsw	[%l7 + %o2],	%i1
	fpsub32	%f28,	%f2,	%f4
	sub	%l1,	%g6,	%i4
	fmul8x16	%f30,	%f28,	%f26
	umulcc	%g7,	%i2,	%g5
	save %i5, %o3, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o1,	%o2,	%i7
	movge	%xcc,	%o5,	%o4
	movle	%icc,	%l6,	%i0
	srax	%g1,	%g3,	%l5
	orn	%g2,	%o7,	%l4
	sll	%i6,	%l3,	%o0
	fornot1s	%f30,	%f12,	%f1
	sethi	0x0631,	%g4
	stb	%i3,	[%l7 + 0x60]
	fpsub32	%f24,	%f12,	%f30
	sra	%o6,	0x1D,	%i1
	st	%f21,	[%l7 + 0x48]
	addccc	%l0,	%l1,	%g6
	xnor	%i4,	0x1D13,	%i2
	fmovdneg	%xcc,	%f21,	%f21
	smulcc	%g7,	%i5,	%g5
	udivx	%l2,	0x0F32,	%o3
	subc	%o1,	%i7,	%o2
	andcc	%o4,	%l6,	%i0
	movcs	%icc,	%g1,	%o5
	sra	%l5,	%g3,	%g2
	fmovdle	%xcc,	%f29,	%f26
	edge16l	%l4,	%o7,	%l3
	sll	%o0,	0x0C,	%i6
	edge16n	%g4,	%o6,	%i1
	fnors	%f24,	%f22,	%f16
	std	%f28,	[%l7 + 0x78]
	udivcc	%l0,	0x0B4C,	%i3
	alignaddrl	%l1,	%g6,	%i4
	edge32l	%g7,	%i2,	%i5
	fmovsleu	%xcc,	%f7,	%f26
	movrgez	%l2,	0x224,	%g5
	movn	%icc,	%o1,	%i7
	fcmpne32	%f16,	%f28,	%o2
	stb	%o3,	[%l7 + 0x09]
	movvs	%icc,	%o4,	%l6
	sllx	%i0,	0x08,	%g1
	fnegd	%f22,	%f20
	fnot1s	%f21,	%f29
	mova	%xcc,	%l5,	%g3
	movle	%icc,	%g2,	%o5
	edge32l	%l4,	%o7,	%o0
	fmovdne	%xcc,	%f17,	%f27
	fpsub32	%f30,	%f10,	%f20
	sethi	0x08C0,	%i6
	alignaddr	%l3,	%o6,	%i1
	udiv	%g4,	0x0EDF,	%i3
	lduh	[%l7 + 0x28],	%l1
	movre	%g6,	0x04B,	%l0
	lduh	[%l7 + 0x3E],	%g7
	ldsb	[%l7 + 0x0C],	%i4
	edge32ln	%i2,	%i5,	%g5
	fxor	%f12,	%f4,	%f20
	orn	%l2,	%i7,	%o1
	fmul8x16al	%f18,	%f2,	%f10
	sllx	%o2,	0x16,	%o3
	andncc	%o4,	%l6,	%g1
	movn	%icc,	%i0,	%g3
	movvs	%xcc,	%l5,	%g2
	movrne	%o5,	%l4,	%o0
	movrlz	%i6,	%l3,	%o7
	fmovdcs	%xcc,	%f9,	%f7
	edge16l	%o6,	%i1,	%g4
	sub	%l1,	%g6,	%i3
	fnand	%f20,	%f6,	%f26
	fornot1s	%f20,	%f3,	%f7
	fmovsl	%icc,	%f4,	%f31
	sllx	%l0,	%g7,	%i4
	fmovrdlez	%i5,	%f24,	%f6
	sir	0x15EB
	popc	%g5,	%i2
	fand	%f22,	%f4,	%f28
	array32	%l2,	%o1,	%i7
	movle	%icc,	%o2,	%o4
	movneg	%icc,	%o3,	%g1
	udivcc	%i0,	0x074A,	%g3
	and	%l6,	0x0F42,	%l5
	ldsw	[%l7 + 0x18],	%o5
	save %g2, 0x086D, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i6,	[%l7 + 0x26]
	srax	%l3,	%o7,	%o0
	movne	%icc,	%i1,	%g4
	movl	%xcc,	%o6,	%l1
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%g6
	ld	[%l7 + 0x48],	%f18
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%l0
	edge8l	%g7,	%i3,	%i5
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	st	%f18,	[%l7 + 0x08]
	mova	%xcc,	%l2,	%i7
	fmovdleu	%xcc,	%f8,	%f23
	andcc	%o1,	0x1AE2,	%o2
	fmovsge	%xcc,	%f7,	%f16
	bshuffle	%f30,	%f0,	%f0
	xnor	%o4,	%o3,	%i0
	array16	%g1,	%l6,	%l5
	sdivcc	%o5,	0x1BCD,	%g3
	fcmple32	%f24,	%f0,	%l4
	movgu	%xcc,	%i6,	%l3
	sir	0x0271
	sdivcc	%o7,	0x1C1B,	%o0
	udiv	%i1,	0x0435,	%g4
	movneg	%icc,	%o6,	%g2
	movcs	%xcc,	%l1,	%g6
	st	%f30,	[%l7 + 0x48]
	andncc	%g7,	%l0,	%i3
	st	%f31,	[%l7 + 0x38]
	std	%f24,	[%l7 + 0x28]
	ldub	[%l7 + 0x4D],	%g5
	for	%f14,	%f0,	%f24
	udivcc	%i5,	0x0670,	%i2
	stx	%i4,	[%l7 + 0x40]
	movle	%icc,	%i7,	%o1
	subcc	%o2,	0x1CEE,	%o4
	sdiv	%o3,	0x037B,	%l2
	mova	%xcc,	%i0,	%g1
	fnor	%f22,	%f6,	%f20
	edge16ln	%l6,	%l5,	%g3
	movrgez	%l4,	%i6,	%l3
	fcmpd	%fcc1,	%f26,	%f14
	sdivx	%o7,	0x1CA7,	%o0
	fxors	%f12,	%f11,	%f18
	movrlz	%o5,	%g4,	%o6
	array8	%g2,	%i1,	%g6
	sdiv	%g7,	0x0620,	%l0
	st	%f0,	[%l7 + 0x30]
	sdiv	%i3,	0x199A,	%l1
	edge16	%g5,	%i5,	%i2
	fmovsge	%icc,	%f14,	%f16
	array32	%i4,	%o1,	%o2
	sth	%o4,	[%l7 + 0x58]
	sllx	%o3,	%l2,	%i0
	fpadd16s	%f17,	%f28,	%f1
	orn	%i7,	0x1D03,	%l6
	save %l5, 0x15F9, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%l4,	%f4,	%f15
	fmovdge	%icc,	%f0,	%f8
	andncc	%i6,	%g1,	%l3
	movrgz	%o7,	0x2E3,	%o5
	movpos	%xcc,	%o0,	%o6
	smulcc	%g4,	%g2,	%g6
	array16	%g7,	%l0,	%i3
	sdivx	%i1,	0x1AF7,	%g5
	fmovsvs	%xcc,	%f28,	%f26
	movge	%icc,	%i5,	%i2
	subc	%l1,	0x1E03,	%i4
	fandnot1	%f18,	%f8,	%f20
	fandnot2s	%f25,	%f13,	%f18
	fpadd16	%f12,	%f26,	%f24
	movgu	%xcc,	%o2,	%o1
	smulcc	%o3,	%o4,	%l2
	udiv	%i0,	0x0974,	%l6
	edge8	%i7,	%g3,	%l5
	ldsb	[%l7 + 0x26],	%i6
	alignaddrl	%g1,	%l3,	%o7
	andn	%l4,	%o0,	%o6
	ldx	[%l7 + 0x38],	%o5
	ldsh	[%l7 + 0x0E],	%g2
	fnors	%f17,	%f25,	%f13
	andn	%g6,	%g7,	%g4
	sra	%l0,	%i3,	%g5
	sllx	%i1,	0x1D,	%i2
	xnorcc	%i5,	0x1C2B,	%l1
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%o2
	movne	%icc,	%i4,	%o3
	fmovsge	%icc,	%f19,	%f19
	sethi	0x0480,	%o1
	andn	%l2,	%o4,	%i0
	fcmps	%fcc2,	%f11,	%f3
	st	%f9,	[%l7 + 0x58]
	ldsb	[%l7 + 0x3B],	%l6
	fornot2s	%f23,	%f20,	%f15
	movcs	%xcc,	%g3,	%l5
	save %i6, %g1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%icc,	%f25,	%f19
	fmovscc	%icc,	%f26,	%f23
	fpackfix	%f12,	%f17
	movrgz	%i7,	%o7,	%o0
	movle	%xcc,	%o6,	%o5
	movl	%icc,	%g2,	%l4
	edge32ln	%g6,	%g7,	%l0
	movpos	%icc,	%i3,	%g5
	andncc	%i1,	%g4,	%i5
	movrne	%i2,	%l1,	%i4
	or	%o2,	0x09EA,	%o1
	fmovs	%f25,	%f28
	movrlz	%o3,	%l2,	%i0
	movl	%icc,	%o4,	%l6
	fpmerge	%f21,	%f9,	%f20
	fornot2s	%f14,	%f20,	%f3
	popc	%l5,	%g3
	movg	%icc,	%g1,	%l3
	fcmpes	%fcc2,	%f14,	%f4
	sethi	0x1367,	%i6
	smulcc	%i7,	0x1019,	%o0
	xor	%o6,	%o5,	%g2
	fmovdg	%xcc,	%f12,	%f4
	mova	%xcc,	%l4,	%g6
	addccc	%o7,	%l0,	%g7
	addccc	%i3,	%g5,	%g4
	orcc	%i5,	0x038D,	%i2
	movle	%icc,	%l1,	%i1
	subc	%o2,	0x1431,	%o1
	fsrc1s	%f25,	%f6
	fmul8x16au	%f4,	%f6,	%f28
	edge16	%i4,	%o3,	%l2
	movleu	%xcc,	%o4,	%i0
	udivx	%l5,	0x0949,	%g3
	fcmps	%fcc2,	%f22,	%f19
	xorcc	%l6,	%g1,	%l3
	movl	%xcc,	%i6,	%i7
	addc	%o6,	0x10FF,	%o5
	and	%g2,	%l4,	%g6
	edge8ln	%o0,	%l0,	%o7
	addccc	%g7,	%g5,	%g4
	fmovrsgz	%i5,	%f28,	%f19
	movn	%xcc,	%i3,	%l1
	edge8l	%i2,	%o2,	%o1
	ldd	[%l7 + 0x18],	%f4
	srax	%i4,	%i1,	%l2
	edge16	%o3,	%o4,	%i0
	movne	%icc,	%g3,	%l6
	ldsh	[%l7 + 0x16],	%g1
	movge	%icc,	%l5,	%l3
	fpadd16	%f24,	%f20,	%f8
	andncc	%i7,	%i6,	%o5
	fsrc2	%f14,	%f10
	andcc	%o6,	%g2,	%g6
	movrne	%o0,	0x181,	%l0
	sir	0x077A
	edge16l	%l4,	%o7,	%g5
	fmovscs	%xcc,	%f28,	%f9
	addccc	%g4,	0x189F,	%i5
	fmovdl	%icc,	%f11,	%f12
	smul	%g7,	0x060E,	%i3
	alignaddrl	%l1,	%i2,	%o1
	movgu	%xcc,	%i4,	%o2
	edge8ln	%l2,	%i1,	%o3
	fcmpgt32	%f24,	%f22,	%i0
	movrgz	%o4,	0x3DF,	%l6
	srlx	%g1,	%l5,	%l3
	fcmple16	%f28,	%f28,	%i7
	stx	%i6,	[%l7 + 0x60]
	movvs	%xcc,	%g3,	%o5
	edge16ln	%g2,	%g6,	%o0
	addccc	%o6,	0x067B,	%l4
	sir	0x13D7
	udivx	%l0,	0x0058,	%g5
	mulscc	%o7,	0x0229,	%i5
	ldsw	[%l7 + 0x3C],	%g7
	fmovscs	%xcc,	%f21,	%f26
	ldsh	[%l7 + 0x36],	%g4
	stx	%i3,	[%l7 + 0x70]
	addc	%l1,	0x0579,	%i2
	nop
	set	0x38, %i4
	std	%f24,	[%l7 + %i4]
	andncc	%o1,	%o2,	%i4
	ldx	[%l7 + 0x78],	%l2
	mulx	%o3,	0x00E1,	%i0
	ldd	[%l7 + 0x58],	%f28
	orcc	%i1,	%l6,	%o4
	fmovdl	%xcc,	%f13,	%f14
	sdiv	%l5,	0x1A5B,	%g1
	movrgz	%i7,	0x3BF,	%l3
	edge16n	%i6,	%o5,	%g2
	sllx	%g6,	%o0,	%g3
	fornot1s	%f3,	%f14,	%f6
	array32	%o6,	%l0,	%l4
	alignaddr	%g5,	%o7,	%g7
	movneg	%icc,	%i5,	%i3
	alignaddrl	%g4,	%l1,	%o1
	movrgz	%o2,	0x06C,	%i2
	lduw	[%l7 + 0x74],	%l2
	sethi	0x03F8,	%i4
	fmovrse	%o3,	%f21,	%f30
	edge32n	%i0,	%l6,	%o4
	orn	%l5,	0x10FC,	%i1
	movrgz	%g1,	%l3,	%i6
	st	%f8,	[%l7 + 0x70]
	smulcc	%o5,	0x0407,	%g2
	sdiv	%i7,	0x1096,	%o0
	subccc	%g3,	0x09EF,	%o6
	fnot1s	%f29,	%f24
	movcs	%xcc,	%l0,	%l4
	fandnot1	%f8,	%f14,	%f16
	ldx	[%l7 + 0x20],	%g5
	lduw	[%l7 + 0x14],	%o7
	movrgz	%g6,	0x244,	%i5
	fmovdl	%icc,	%f5,	%f22
	fpsub32	%f22,	%f10,	%f26
	fors	%f24,	%f26,	%f11
	movrgez	%i3,	%g7,	%l1
	or	%o1,	0x0232,	%g4
	srl	%o2,	0x1B,	%l2
	movle	%icc,	%i2,	%o3
	edge16	%i4,	%l6,	%i0
	stx	%l5,	[%l7 + 0x40]
	edge16l	%o4,	%g1,	%i1
	movn	%icc,	%l3,	%o5
	pdist	%f12,	%f22,	%f24
	fpadd16	%f14,	%f14,	%f12
	movrgz	%g2,	0x2E1,	%i7
	edge8n	%i6,	%g3,	%o0
	ldd	[%l7 + 0x78],	%f18
	edge16l	%l0,	%o6,	%l4
	fmovsg	%icc,	%f14,	%f20
	ldsh	[%l7 + 0x28],	%g5
	for	%f22,	%f24,	%f0
	addcc	%o7,	0x1BBF,	%i5
	xorcc	%g6,	%i3,	%l1
	fpackfix	%f26,	%f12
	ldsh	[%l7 + 0x58],	%g7
	edge8l	%o1,	%o2,	%l2
	movrlez	%g4,	0x124,	%i2
	addcc	%i4,	0x1DAC,	%o3
	fmovde	%xcc,	%f31,	%f6
	addc	%i0,	%l6,	%l5
	edge32	%o4,	%i1,	%l3
	fxor	%f0,	%f0,	%f30
	alignaddr	%g1,	%g2,	%i7
	sir	0x086A
	movne	%xcc,	%i6,	%o5
	andcc	%g3,	%l0,	%o0
	edge32	%l4,	%o6,	%o7
	srl	%g5,	%g6,	%i5
	ldsh	[%l7 + 0x54],	%i3
	fmul8sux16	%f2,	%f20,	%f24
	ldsb	[%l7 + 0x46],	%g7
	movcs	%icc,	%o1,	%o2
	smulcc	%l2,	%g4,	%l1
	mova	%xcc,	%i2,	%o3
	array32	%i0,	%i4,	%l6
	sdivx	%o4,	0x1ECC,	%i1
	restore %l3, %l5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g2,	%i7,	%o5
	addc	%g3,	%l0,	%i6
	umul	%o0,	0x1D1E,	%o6
	fnegs	%f24,	%f24
	sdivcc	%o7,	0x1E4C,	%g5
	movcc	%icc,	%g6,	%i5
	fors	%f1,	%f22,	%f27
	fornot1s	%f10,	%f17,	%f16
	umulcc	%l4,	%g7,	%o1
	lduw	[%l7 + 0x28],	%i3
	array8	%o2,	%g4,	%l1
	xor	%i2,	0x0060,	%o3
	fmovdl	%icc,	%f24,	%f11
	movpos	%icc,	%i0,	%i4
	movcc	%icc,	%l6,	%l2
	ldd	[%l7 + 0x20],	%f22
	movrgz	%o4,	%i1,	%l3
	nop
	set	0x28, %i5
	std	%f24,	[%l7 + %i5]
	sir	0x1C6A
	edge8l	%g1,	%l5,	%g2
	addc	%o5,	0x0E6E,	%i7
	fsrc1s	%f1,	%f13
	movcs	%xcc,	%g3,	%i6
	or	%o0,	%o6,	%o7
	fnot1s	%f0,	%f12
	subcc	%g5,	0x1B0B,	%g6
	mulscc	%l0,	0x186A,	%i5
	edge16ln	%l4,	%o1,	%i3
	fnegs	%f17,	%f0
	edge8	%o2,	%g4,	%l1
	ldsb	[%l7 + 0x5F],	%g7
	movne	%icc,	%i2,	%o3
	save %i0, 0x159D, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l2,	0x1C45,	%o4
	movrlez	%i1,	%l6,	%l3
	udivx	%g1,	0x0AD2,	%l5
	bshuffle	%f6,	%f10,	%f22
	sll	%o5,	0x01,	%g2
	andcc	%i7,	%g3,	%o0
	mova	%xcc,	%o6,	%i6
	st	%f12,	[%l7 + 0x0C]
	movvs	%xcc,	%o7,	%g6
	bshuffle	%f26,	%f14,	%f12
	sir	0x1947
	ldub	[%l7 + 0x1A],	%g5
	udivx	%l0,	0x0C43,	%i5
	movpos	%xcc,	%l4,	%i3
	edge16ln	%o1,	%g4,	%o2
	fmovsle	%xcc,	%f30,	%f1
	sra	%l1,	%g7,	%i2
	edge32ln	%i0,	%o3,	%i4
	sdiv	%l2,	0x02C3,	%o4
	fandnot2	%f4,	%f2,	%f6
	movvc	%xcc,	%i1,	%l6
	sdiv	%g1,	0x037F,	%l3
	fnot2s	%f31,	%f6
	fornot2	%f12,	%f12,	%f16
	ld	[%l7 + 0x10],	%f13
	or	%l5,	%o5,	%i7
	andncc	%g3,	%g2,	%o6
	st	%f4,	[%l7 + 0x28]
	st	%f13,	[%l7 + 0x38]
	movne	%xcc,	%i6,	%o0
	edge32l	%o7,	%g6,	%g5
	fcmpd	%fcc2,	%f26,	%f16
	srlx	%l0,	0x1A,	%i5
	sll	%l4,	0x13,	%i3
	popc	0x0A70,	%g4
	ldsh	[%l7 + 0x5A],	%o1
	edge16	%l1,	%o2,	%g7
	subc	%i2,	%o3,	%i4
	std	%f22,	[%l7 + 0x38]
	movge	%xcc,	%l2,	%i0
	stb	%i1,	[%l7 + 0x63]
	xnor	%o4,	%l6,	%l3
	alignaddr	%l5,	%g1,	%i7
	andncc	%g3,	%g2,	%o6
	andcc	%i6,	0x1CE7,	%o5
	fmuld8ulx16	%f14,	%f28,	%f6
	mulscc	%o7,	%o0,	%g6
	sethi	0x01A1,	%l0
	andcc	%g5,	%i5,	%i3
	udivcc	%g4,	0x1CA1,	%l4
	fmovrsne	%l1,	%f22,	%f27
	alignaddrl	%o1,	%g7,	%o2
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%f24
	ldsh	[%l7 + 0x78],	%i2
	sub	%o3,	%i4,	%i0
	sth	%l2,	[%l7 + 0x4A]
	fornot1	%f24,	%f10,	%f6
	umul	%o4,	%i1,	%l3
	orn	%l6,	0x02F3,	%l5
	addc	%g1,	0x00DB,	%g3
	udivx	%i7,	0x0192,	%g2
	sra	%i6,	%o6,	%o7
	fmovsle	%xcc,	%f22,	%f14
	movrgez	%o5,	%o0,	%l0
	xnorcc	%g6,	%g5,	%i5
	alignaddrl	%g4,	%l4,	%l1
	fxnors	%f6,	%f16,	%f13
	lduh	[%l7 + 0x1C],	%o1
	st	%f7,	[%l7 + 0x20]
	udiv	%g7,	0x172E,	%i3
	edge16n	%o2,	%o3,	%i2
	movrlz	%i0,	0x16A,	%l2
	fsrc2s	%f18,	%f18
	orcc	%i4,	%i1,	%l3
	movge	%icc,	%l6,	%l5
	movcc	%xcc,	%o4,	%g3
	fmovdge	%xcc,	%f11,	%f29
	movge	%xcc,	%i7,	%g2
	edge32l	%g1,	%o6,	%o7
	addc	%i6,	%o5,	%o0
	alignaddrl	%g6,	%g5,	%l0
	sdivcc	%g4,	0x0373,	%l4
	movcs	%xcc,	%i5,	%o1
	srl	%g7,	%i3,	%l1
	ldsb	[%l7 + 0x6C],	%o2
	movge	%icc,	%i2,	%i0
	fzero	%f2
	and	%o3,	0x1CFB,	%l2
	ld	[%l7 + 0x70],	%f27
	fmovscc	%icc,	%f3,	%f13
	array32	%i4,	%i1,	%l3
	edge16	%l6,	%l5,	%o4
	ldsh	[%l7 + 0x74],	%i7
	popc	%g2,	%g3
	sethi	0x1015,	%g1
	save %o7, 0x1022, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o6,	%o5,	%g6
	sdivcc	%g5,	0x1EDF,	%o0
	movleu	%icc,	%l0,	%l4
	alignaddr	%i5,	%g4,	%g7
	fpack16	%f14,	%f16
	fcmpgt32	%f20,	%f8,	%i3
	ld	[%l7 + 0x54],	%f9
	mulscc	%l1,	%o2,	%i2
	subcc	%o1,	0x07EA,	%o3
	st	%f9,	[%l7 + 0x58]
	sdivx	%i0,	0x1022,	%l2
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	fxnors	%f21,	%f3,	%f19
	popc	0x1785,	%l6
	fmul8x16	%f25,	%f14,	%f22
	subccc	%l3,	0x1A4A,	%l5
	srl	%i7,	0x1B,	%g2
	sub	%o4,	%g1,	%o7
	fmovrsne	%g3,	%f15,	%f30
	sub	%i6,	%o5,	%g6
	sdivx	%g5,	0x1116,	%o6
	fmul8ulx16	%f14,	%f4,	%f30
	for	%f18,	%f8,	%f30
	fmovdg	%xcc,	%f1,	%f1
	move	%xcc,	%l0,	%o0
	edge8n	%l4,	%i5,	%g4
	edge16l	%i3,	%g7,	%l1
	fone	%f20
	add	%o2,	0x0A93,	%i2
	fmovsneg	%xcc,	%f3,	%f27
	orncc	%o1,	0x1B4B,	%i0
	ldsh	[%l7 + 0x54],	%l2
	movrlz	%o3,	0x382,	%i4
	edge32n	%l6,	%l3,	%i1
	movcc	%xcc,	%i7,	%l5
	fnot2	%f30,	%f10
	movne	%icc,	%g2,	%o4
	subc	%g1,	%g3,	%o7
	array8	%o5,	%i6,	%g5
	movgu	%icc,	%g6,	%l0
	ldub	[%l7 + 0x41],	%o0
	edge8	%o6,	%l4,	%g4
	edge16	%i5,	%i3,	%l1
	udiv	%o2,	0x1E5D,	%g7
	fmovdleu	%icc,	%f0,	%f7
	fnot1s	%f4,	%f9
	lduh	[%l7 + 0x52],	%o1
	sir	0x084D
	nop
	set	0x5C, %l4
	lduw	[%l7 + %l4],	%i2
	or	%i0,	%l2,	%o3
	fmul8x16au	%f25,	%f15,	%f4
	fzero	%f2
	edge32l	%l6,	%i4,	%i1
	fmovscs	%icc,	%f14,	%f5
	xnorcc	%l3,	%l5,	%g2
	fmovdneg	%icc,	%f17,	%f26
	xnor	%o4,	%i7,	%g1
	nop
	set	0x38, %l2
	std	%f22,	[%l7 + %l2]
	andcc	%o7,	0x0DB1,	%g3
	subccc	%i6,	0x0FEC,	%o5
	std	%f26,	[%l7 + 0x48]
	array32	%g5,	%g6,	%o0
	fcmpeq32	%f16,	%f20,	%l0
	movg	%xcc,	%l4,	%o6
	subcc	%i5,	%i3,	%g4
	fxnors	%f18,	%f30,	%f25
	orcc	%l1,	%o2,	%o1
	xnorcc	%i2,	0x12A4,	%i0
	xnorcc	%g7,	%o3,	%l6
	fmovsge	%xcc,	%f0,	%f14
	ldx	[%l7 + 0x78],	%l2
	mulx	%i1,	0x1AF0,	%l3
	udivx	%i4,	0x17ED,	%g2
	ldub	[%l7 + 0x18],	%l5
	siam	0x2
	movcs	%icc,	%i7,	%o4
	nop
	set	0x32, %o6
	sth	%g1,	[%l7 + %o6]
	sdivcc	%o7,	0x0124,	%g3
	srl	%i6,	0x15,	%o5
	movneg	%xcc,	%g6,	%o0
	ldx	[%l7 + 0x48],	%l0
	sir	0x0EAD
	andncc	%l4,	%g5,	%o6
	edge8	%i5,	%g4,	%l1
	orncc	%o2,	0x1E6E,	%o1
	array16	%i2,	%i0,	%i3
	edge16	%g7,	%l6,	%o3
	ldx	[%l7 + 0x40],	%l2
	fones	%f30
	edge32	%l3,	%i1,	%g2
	ldd	[%l7 + 0x58],	%f20
	ldsh	[%l7 + 0x30],	%i4
	ldx	[%l7 + 0x68],	%l5
	edge32n	%o4,	%i7,	%o7
	movre	%g3,	0x323,	%g1
	lduh	[%l7 + 0x0A],	%o5
	sllx	%i6,	%g6,	%o0
	fmovdneg	%icc,	%f10,	%f10
	edge8	%l0,	%l4,	%o6
	edge32l	%i5,	%g4,	%g5
	fnot2	%f4,	%f6
	srax	%o2,	0x08,	%o1
	umul	%l1,	0x1489,	%i2
	subcc	%i3,	%g7,	%i0
	movcc	%icc,	%l6,	%o3
	fmovse	%icc,	%f0,	%f15
	move	%icc,	%l2,	%i1
	sll	%l3,	0x0B,	%g2
	array16	%l5,	%i4,	%o4
	and	%i7,	%o7,	%g1
	mova	%xcc,	%o5,	%g3
	edge8l	%g6,	%o0,	%i6
	edge16l	%l0,	%o6,	%l4
	udivx	%i5,	0x052F,	%g5
	movrgez	%g4,	%o1,	%o2
	edge32n	%i2,	%l1,	%g7
	movn	%icc,	%i3,	%l6
	fpsub32	%f2,	%f4,	%f6
	subcc	%i0,	0x17E4,	%l2
	mulx	%o3,	0x1550,	%l3
	fors	%f12,	%f24,	%f31
	fmul8x16au	%f17,	%f31,	%f8
	udivx	%g2,	0x16F6,	%i1
	restore %i4, %o4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x38],	%f7
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	sll	%g3,	%g6,	%o0
	srl	%i6,	%l0,	%o5
	smulcc	%o6,	%l4,	%i5
	udivcc	%g5,	0x1BF5,	%o1
	edge8	%g4,	%i2,	%o2
	stw	%g7,	[%l7 + 0x7C]
	srl	%i3,	0x0C,	%l1
	add	%l6,	0x0C34,	%l2
	edge32ln	%o3,	%i0,	%g2
	orn	%i1,	0x0518,	%l3
	sir	0x01AF
	movcc	%icc,	%i4,	%o4
	fands	%f4,	%f7,	%f15
	edge8ln	%l5,	%i7,	%g1
	movne	%xcc,	%g3,	%o7
	fmovrslz	%g6,	%f9,	%f28
	sth	%i6,	[%l7 + 0x08]
	fmovsneg	%xcc,	%f17,	%f21
	movg	%xcc,	%l0,	%o5
	fmovdleu	%xcc,	%f15,	%f6
	fmovdne	%icc,	%f30,	%f2
	fnot1s	%f27,	%f18
	movrlz	%o6,	%l4,	%i5
	andcc	%o0,	0x1F31,	%o1
	std	%f28,	[%l7 + 0x70]
	and	%g5,	0x1BDA,	%i2
	array32	%o2,	%g4,	%i3
	sdivcc	%g7,	0x0945,	%l6
	sir	0x03D8
	array8	%l1,	%l2,	%o3
	fpack32	%f28,	%f24,	%f8
	alignaddr	%g2,	%i0,	%i1
	mova	%icc,	%i4,	%o4
	restore %l3, 0x041D, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l5,	%g3,	%o7
	subcc	%g1,	0x088C,	%g6
	std	%f16,	[%l7 + 0x18]
	fmovda	%xcc,	%f23,	%f24
	subccc	%i6,	0x18A7,	%o5
	ldsw	[%l7 + 0x6C],	%l0
	edge32n	%l4,	%i5,	%o0
	sdivx	%o6,	0x0D4F,	%o1
	stb	%g5,	[%l7 + 0x23]
	movne	%xcc,	%o2,	%i2
	movvc	%xcc,	%i3,	%g4
	sdivx	%l6,	0x1151,	%g7
	or	%l2,	0x0B63,	%l1
	xor	%g2,	0x1593,	%i0
	fmovdn	%xcc,	%f4,	%f7
	addccc	%o3,	%i1,	%i4
	movgu	%xcc,	%l3,	%o4
	movcs	%xcc,	%l5,	%i7
	fpadd32	%f10,	%f6,	%f28
	movne	%icc,	%g3,	%g1
	sdiv	%g6,	0x0888,	%i6
	fmovrsgez	%o5,	%f23,	%f12
	edge8	%o7,	%l0,	%i5
	nop
	set	0x7E, %g7
	stb	%o0,	[%l7 + %g7]
	sllx	%o6,	0x02,	%o1
	subcc	%l4,	%o2,	%i2
	movrlz	%i3,	0x2C8,	%g4
	fcmps	%fcc3,	%f0,	%f0
	edge16	%l6,	%g5,	%l2
	srax	%g7,	0x1F,	%l1
	lduh	[%l7 + 0x3A],	%g2
	fmovrsgz	%o3,	%f4,	%f4
	save %i0, 0x149A, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l3,	%o4,	%i4
	xnor	%l5,	%i7,	%g3
	addc	%g6,	%g1,	%i6
	sir	0x102A
	movge	%xcc,	%o5,	%o7
	mova	%icc,	%i5,	%o0
	and	%l0,	0x036C,	%o6
	alignaddr	%o1,	%o2,	%i2
	lduw	[%l7 + 0x14],	%i3
	fmul8ulx16	%f0,	%f28,	%f30
	lduh	[%l7 + 0x2C],	%l4
	edge8n	%g4,	%g5,	%l6
	fmovsleu	%xcc,	%f27,	%f30
	fornot2s	%f27,	%f9,	%f14
	or	%l2,	0x06C6,	%g7
	udivcc	%g2,	0x1B9A,	%o3
	sth	%i0,	[%l7 + 0x52]
	movg	%xcc,	%i1,	%l3
	fmovdgu	%icc,	%f4,	%f7
	fmul8x16	%f3,	%f22,	%f22
	fpsub16s	%f4,	%f8,	%f8
	array32	%l1,	%o4,	%i4
	srlx	%i7,	%g3,	%g6
	fpadd16	%f26,	%f18,	%f12
	srl	%l5,	0x10,	%g1
	orncc	%o5,	0x01A9,	%i6
	stx	%i5,	[%l7 + 0x40]
	orncc	%o0,	%o7,	%l0
	movl	%icc,	%o1,	%o2
	umul	%i2,	%i3,	%o6
	ldub	[%l7 + 0x71],	%l4
	mova	%icc,	%g5,	%g4
	subccc	%l6,	%l2,	%g7
	movrgz	%o3,	%i0,	%g2
	ldsw	[%l7 + 0x48],	%i1
	sll	%l1,	0x12,	%o4
	sdiv	%l3,	0x1813,	%i7
	smul	%g3,	0x19A2,	%g6
	smul	%i4,	0x0310,	%g1
	edge16	%l5,	%i6,	%i5
	stb	%o5,	[%l7 + 0x22]
	fmovrsne	%o0,	%f9,	%f7
	add	%o7,	0x08F1,	%o1
	edge8n	%l0,	%i2,	%o2
	fmovrdgz	%i3,	%f22,	%f30
	and	%o6,	0x06E6,	%g5
	or	%g4,	%l4,	%l2
	srax	%g7,	%o3,	%l6
	edge16	%g2,	%i1,	%l1
	movge	%xcc,	%i0,	%l3
	ldsw	[%l7 + 0x44],	%i7
	popc	%o4,	%g6
	fpadd32s	%f18,	%f0,	%f9
	subc	%i4,	%g3,	%g1
	edge32	%l5,	%i5,	%i6
	std	%f2,	[%l7 + 0x18]
	edge8n	%o5,	%o0,	%o1
	save %o7, 0x08BC, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o2,	0x0900,	%l0
	fmuld8sux16	%f27,	%f31,	%f18
	edge16l	%o6,	%i3,	%g4
	udiv	%g5,	0x1F30,	%l4
	st	%f4,	[%l7 + 0x4C]
	fcmpd	%fcc1,	%f12,	%f14
	fmovsvs	%icc,	%f0,	%f21
	fmovrslez	%g7,	%f1,	%f18
	movcs	%icc,	%o3,	%l6
	stw	%l2,	[%l7 + 0x10]
	addccc	%i1,	0x07AC,	%g2
	srax	%l1,	0x0C,	%l3
	fandnot1s	%f26,	%f10,	%f25
	srlx	%i0,	0x1A,	%o4
	srlx	%g6,	0x0F,	%i4
	edge16ln	%g3,	%g1,	%l5
	bshuffle	%f18,	%f28,	%f28
	sra	%i7,	0x02,	%i5
	edge32l	%o5,	%i6,	%o1
	ldsw	[%l7 + 0x18],	%o7
	fmovrdne	%o0,	%f20,	%f24
	edge8	%i2,	%o2,	%l0
	fmovrdlz	%o6,	%f22,	%f16
	fsrc1	%f26,	%f6
	popc	%i3,	%g5
	fxnor	%f0,	%f16,	%f6
	fmovsa	%icc,	%f19,	%f11
	movrgz	%g4,	%g7,	%l4
	and	%l6,	%o3,	%i1
	orn	%g2,	%l1,	%l2
	alignaddrl	%l3,	%o4,	%i0
	fornot1s	%f21,	%f8,	%f22
	stb	%i4,	[%l7 + 0x11]
	movg	%icc,	%g3,	%g6
	movge	%xcc,	%l5,	%i7
	fmovdn	%xcc,	%f19,	%f28
	array32	%g1,	%i5,	%o5
	edge16l	%i6,	%o7,	%o0
	fcmps	%fcc1,	%f4,	%f14
	mulscc	%i2,	0x18E6,	%o1
	movcs	%icc,	%o2,	%o6
	smul	%l0,	%g5,	%g4
	save %g7, %i3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%l4,	%i1
	movvc	%icc,	%g2,	%o3
	fpadd16	%f24,	%f2,	%f18
	array8	%l1,	%l3,	%o4
	alignaddrl	%l2,	%i4,	%i0
	nop
	set	0x6E, %o7
	ldsh	[%l7 + %o7],	%g6
	movpos	%xcc,	%l5,	%i7
	edge8l	%g1,	%i5,	%o5
	movgu	%icc,	%g3,	%o7
	edge8n	%o0,	%i6,	%o1
	fmovscs	%icc,	%f17,	%f30
	lduw	[%l7 + 0x0C],	%i2
	movrlz	%o2,	%o6,	%g5
	fmovda	%xcc,	%f28,	%f15
	array16	%g4,	%l0,	%g7
	fmovsneg	%xcc,	%f9,	%f24
	andncc	%i3,	%l4,	%l6
	smul	%i1,	%g2,	%o3
	edge32ln	%l3,	%o4,	%l1
	edge32n	%i4,	%i0,	%l2
	fmovsge	%xcc,	%f20,	%f6
	movrlz	%g6,	%l5,	%g1
	sdivx	%i5,	0x05D5,	%i7
	mova	%xcc,	%g3,	%o7
	sll	%o0,	0x1E,	%i6
	stw	%o1,	[%l7 + 0x1C]
	movrgz	%i2,	%o5,	%o2
	edge8	%g5,	%g4,	%l0
	fmovdle	%icc,	%f13,	%f14
	alignaddrl	%g7,	%o6,	%i3
	movvc	%icc,	%l6,	%i1
	orn	%l4,	%o3,	%l3
	movcc	%icc,	%o4,	%g2
	fmovdl	%icc,	%f23,	%f2
	fnot2s	%f29,	%f27
	lduw	[%l7 + 0x30],	%i4
	fmovse	%xcc,	%f22,	%f17
	movleu	%icc,	%i0,	%l2
	or	%l1,	0x0453,	%l5
	edge32n	%g6,	%g1,	%i5
	mulx	%i7,	0x0892,	%g3
	fmovsvc	%icc,	%f31,	%f6
	and	%o7,	%i6,	%o0
	fmovspos	%icc,	%f30,	%f18
	lduw	[%l7 + 0x58],	%i2
	array8	%o1,	%o2,	%g5
	sdivx	%g4,	0x1D7A,	%o5
	st	%f17,	[%l7 + 0x54]
	umul	%l0,	%o6,	%i3
	movpos	%icc,	%l6,	%i1
	movcs	%icc,	%g7,	%l4
	addc	%o3,	0x194C,	%l3
	orncc	%g2,	0x1EC1,	%i4
	fmovrsgz	%o4,	%f24,	%f26
	subccc	%i0,	0x0AFD,	%l1
	mulscc	%l2,	%g6,	%g1
	fabsd	%f20,	%f16
	fmovsl	%icc,	%f13,	%f17
	udivx	%i5,	0x096E,	%l5
	save %i7, %g3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f24,	%f20
	array8	%o7,	%o0,	%o1
	movcs	%xcc,	%i2,	%g5
	ld	[%l7 + 0x4C],	%f2
	addc	%g4,	0x1588,	%o5
	orncc	%l0,	0x00C3,	%o6
	stx	%o2,	[%l7 + 0x40]
	lduw	[%l7 + 0x28],	%l6
	addc	%i1,	%i3,	%g7
	srax	%l4,	0x13,	%o3
	fmovrsgz	%l3,	%f25,	%f21
	mulscc	%g2,	%o4,	%i4
	fornot1	%f18,	%f20,	%f30
	sth	%l1,	[%l7 + 0x44]
	fone	%f10
	movleu	%icc,	%i0,	%g6
	addccc	%l2,	%i5,	%l5
	stb	%i7,	[%l7 + 0x0A]
	sllx	%g1,	%i6,	%g3
	edge16	%o0,	%o7,	%o1
	sra	%g5,	0x10,	%i2
	sir	0x1643
	fmovdl	%xcc,	%f10,	%f24
	fnors	%f29,	%f6,	%f14
	fpsub32	%f6,	%f16,	%f14
	orn	%o5,	0x06C1,	%g4
	movle	%xcc,	%l0,	%o2
	add	%l6,	0x0518,	%i1
	orncc	%o6,	0x008B,	%g7
	fmovsgu	%xcc,	%f4,	%f16
	sdivx	%l4,	0x0998,	%i3
	stb	%l3,	[%l7 + 0x25]
	alignaddrl	%o3,	%o4,	%g2
	mulscc	%i4,	0x183A,	%i0
	edge32n	%g6,	%l1,	%l2
	lduh	[%l7 + 0x52],	%i5
	movne	%xcc,	%i7,	%l5
	stx	%g1,	[%l7 + 0x58]
	andcc	%i6,	0x1450,	%o0
	sdivcc	%o7,	0x1617,	%g3
	ldub	[%l7 + 0x59],	%o1
	andn	%g5,	0x1611,	%o5
	fmovsa	%xcc,	%f29,	%f31
	fmovdgu	%icc,	%f7,	%f17
	movge	%icc,	%i2,	%g4
	edge16n	%o2,	%l0,	%i1
	ldd	[%l7 + 0x58],	%f4
	addc	%l6,	%g7,	%l4
	fxor	%f14,	%f6,	%f18
	subccc	%i3,	%l3,	%o6
	stx	%o3,	[%l7 + 0x18]
	bshuffle	%f6,	%f2,	%f10
	mulx	%o4,	%i4,	%i0
	movre	%g6,	%g2,	%l1
	or	%i5,	%i7,	%l2
	fmovdneg	%xcc,	%f26,	%f1
	sth	%g1,	[%l7 + 0x76]
	fmovdle	%icc,	%f30,	%f11
	fmovdneg	%xcc,	%f19,	%f26
	xor	%l5,	%o0,	%o7
	sdivcc	%i6,	0x01C0,	%o1
	array32	%g3,	%o5,	%g5
	srl	%i2,	%g4,	%l0
	subcc	%o2,	%l6,	%g7
	edge32	%l4,	%i3,	%l3
	edge32	%o6,	%i1,	%o3
	ldub	[%l7 + 0x60],	%i4
	addccc	%o4,	0x0C73,	%i0
	orcc	%g2,	%g6,	%i5
	movre	%l1,	0x03E,	%l2
	fmovrslez	%g1,	%f30,	%f3
	edge8n	%i7,	%o0,	%o7
	edge16	%l5,	%i6,	%g3
	stb	%o5,	[%l7 + 0x77]
	sub	%g5,	%o1,	%i2
	addcc	%g4,	0x0D78,	%o2
	ldd	[%l7 + 0x30],	%f24
	array16	%l0,	%l6,	%l4
	movn	%icc,	%i3,	%g7
	srax	%o6,	%l3,	%i1
	fmovdpos	%xcc,	%f12,	%f12
	andncc	%o3,	%i4,	%o4
	addc	%g2,	0x0B71,	%g6
	movn	%xcc,	%i0,	%l1
	pdist	%f18,	%f26,	%f26
	movpos	%xcc,	%i5,	%g1
	popc	0x14FB,	%l2
	movrne	%i7,	0x22A,	%o7
	fmovrdne	%l5,	%f18,	%f22
	subc	%o0,	0x0D05,	%g3
	srlx	%o5,	%i6,	%o1
	udivx	%i2,	0x1FE3,	%g4
	fsrc2	%f18,	%f24
	orcc	%g5,	0x1BFF,	%l0
	movrlz	%l6,	%l4,	%i3
	udivcc	%o2,	0x0F2C,	%o6
	movcs	%xcc,	%l3,	%g7
	fcmple16	%f0,	%f30,	%i1
	stb	%i4,	[%l7 + 0x6F]
	addc	%o3,	%o4,	%g6
	fandnot2s	%f22,	%f31,	%f9
	ldsh	[%l7 + 0x64],	%g2
	for	%f8,	%f16,	%f30
	edge16	%i0,	%l1,	%g1
	fmovdl	%xcc,	%f19,	%f19
	std	%f12,	[%l7 + 0x40]
	mulscc	%l2,	%i5,	%i7
	movne	%icc,	%o7,	%l5
	fmovdg	%xcc,	%f28,	%f12
	ldsw	[%l7 + 0x48],	%g3
	umulcc	%o5,	%o0,	%o1
	fnegs	%f10,	%f19
	fzero	%f20
	movrgz	%i2,	0x0D1,	%g4
	sethi	0x0484,	%g5
	xnorcc	%i6,	0x1BB0,	%l0
	edge16	%l4,	%i3,	%o2
	movge	%icc,	%o6,	%l6
	fmovrdne	%g7,	%f26,	%f6
	edge16	%i1,	%i4,	%l3
	fmovscs	%xcc,	%f12,	%f28
	movrlz	%o4,	0x389,	%o3
	fnegs	%f3,	%f13
	fpsub32	%f28,	%f2,	%f2
	addc	%g6,	0x0B3D,	%i0
	edge16l	%l1,	%g1,	%l2
	edge8l	%i5,	%i7,	%g2
	andn	%l5,	0x0F66,	%g3
	xor	%o5,	%o7,	%o1
	fpadd16s	%f12,	%f2,	%f3
	fmul8x16	%f8,	%f26,	%f18
	fors	%f28,	%f4,	%f1
	fpackfix	%f22,	%f28
	movvs	%xcc,	%o0,	%i2
	edge16	%g4,	%i6,	%l0
	array8	%l4,	%i3,	%o2
	edge32l	%o6,	%g5,	%g7
	smul	%l6,	0x0B41,	%i4
	fcmpes	%fcc3,	%f12,	%f12
	movpos	%xcc,	%i1,	%o4
	fmovs	%f6,	%f8
	sdivcc	%l3,	0x1C80,	%o3
	addc	%g6,	%l1,	%i0
	fmovrde	%l2,	%f4,	%f12
	ldsh	[%l7 + 0x20],	%g1
	edge8ln	%i7,	%i5,	%l5
	fnot1s	%f2,	%f11
	ldsh	[%l7 + 0x7A],	%g3
	orncc	%o5,	%o7,	%g2
	movgu	%xcc,	%o1,	%i2
	edge32ln	%g4,	%i6,	%l0
	mulx	%o0,	%i3,	%l4
	stx	%o2,	[%l7 + 0x68]
	fmovrdlez	%o6,	%f6,	%f24
	sdivx	%g5,	0x0FD3,	%l6
	st	%f21,	[%l7 + 0x24]
	ldub	[%l7 + 0x1D],	%g7
	fmovdgu	%xcc,	%f13,	%f22
	stw	%i4,	[%l7 + 0x4C]
	array8	%i1,	%l3,	%o3
	subcc	%g6,	0x1B7E,	%l1
	sethi	0x139B,	%o4
	movre	%i0,	%l2,	%i7
	movrlez	%i5,	0x31A,	%g1
	fmovrsgz	%g3,	%f8,	%f3
	faligndata	%f30,	%f20,	%f0
	or	%o5,	0x154C,	%o7
	ldub	[%l7 + 0x39],	%l5
	movneg	%icc,	%o1,	%g2
	fpadd32s	%f23,	%f8,	%f22
	andncc	%g4,	%i2,	%l0
	sllx	%i6,	0x17,	%o0
	fmovdpos	%xcc,	%f12,	%f30
	ldsh	[%l7 + 0x50],	%i3
	ld	[%l7 + 0x70],	%f22
	movvs	%icc,	%o2,	%o6
	fzero	%f30
	lduw	[%l7 + 0x30],	%g5
	orcc	%l6,	0x0E2B,	%g7
	fcmpes	%fcc1,	%f20,	%f28
	fmovsg	%xcc,	%f20,	%f1
	srl	%i4,	%i1,	%l4
	array8	%l3,	%g6,	%o3
	fpmerge	%f9,	%f23,	%f28
	fpack32	%f6,	%f12,	%f4
	movvs	%icc,	%l1,	%i0
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	movcs	%xcc,	%o4,	%g3
	fmovdneg	%icc,	%f30,	%f10
	fmovsvs	%xcc,	%f21,	%f4
	movgu	%icc,	%o5,	%o7
	save %g1, 0x11DC, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g2,	%g4,	%i2
	movrlez	%l5,	0x1FD,	%l0
	fxnor	%f2,	%f4,	%f12
	ldsb	[%l7 + 0x5E],	%o0
	fmovdg	%xcc,	%f12,	%f8
	movl	%icc,	%i3,	%o2
	sth	%o6,	[%l7 + 0x6A]
	addc	%i6,	%g5,	%l6
	ldsb	[%l7 + 0x21],	%g7
	sdivcc	%i1,	0x0E62,	%i4
	edge32l	%l3,	%l4,	%g6
	ldx	[%l7 + 0x18],	%o3
	subccc	%l1,	0x0003,	%l2
	andncc	%i7,	%i0,	%o4
	umulcc	%g3,	0x1FF5,	%i5
	stw	%o7,	[%l7 + 0x60]
	addccc	%o5,	%o1,	%g1
	movvc	%icc,	%g2,	%g4
	addc	%i2,	%l5,	%l0
	udivx	%i3,	0x1B0A,	%o0
	fcmpeq32	%f16,	%f24,	%o6
	fands	%f6,	%f2,	%f15
	fornot2s	%f13,	%f24,	%f23
	orcc	%o2,	%g5,	%l6
	edge16n	%g7,	%i1,	%i4
	xnorcc	%i6,	0x0557,	%l4
	array16	%g6,	%l3,	%l1
	nop
	set	0x48, %o5
	stx	%l2,	[%l7 + %o5]
	edge16ln	%i7,	%i0,	%o3
	movrgz	%g3,	0x326,	%i5
	for	%f10,	%f16,	%f12
	movge	%icc,	%o7,	%o4
	array32	%o5,	%g1,	%g2
	and	%g4,	%i2,	%l5
	fmovrsne	%l0,	%f27,	%f31
	edge16	%i3,	%o1,	%o0
	array32	%o2,	%o6,	%l6
	fpsub16	%f18,	%f2,	%f0
	xor	%g5,	0x0C59,	%g7
	srl	%i1,	%i4,	%i6
	umulcc	%g6,	%l3,	%l1
	fpsub32s	%f2,	%f26,	%f22
	movl	%xcc,	%l4,	%l2
	ldsh	[%l7 + 0x74],	%i7
	ldd	[%l7 + 0x38],	%f2
	udivx	%o3,	0x11F0,	%g3
	lduw	[%l7 + 0x2C],	%i5
	array32	%o7,	%i0,	%o5
	movrlez	%o4,	0x3D4,	%g2
	movvs	%xcc,	%g1,	%i2
	pdist	%f26,	%f18,	%f8
	add	%l5,	0x0655,	%g4
	smul	%l0,	0x088A,	%o1
	fandnot2s	%f8,	%f4,	%f22
	restore %o0, 0x0F3D, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%o6,	%i3
	movpos	%icc,	%l6,	%g7
	edge32n	%g5,	%i4,	%i6
	edge32n	%i1,	%g6,	%l3
	fmovspos	%xcc,	%f1,	%f27
	edge32n	%l4,	%l1,	%i7
	alignaddrl	%o3,	%g3,	%i5
	fmovrse	%l2,	%f29,	%f7
	movrgez	%o7,	0x2BB,	%i0
	fornot2	%f2,	%f30,	%f12
	edge32	%o4,	%o5,	%g1
	array8	%g2,	%l5,	%i2
	movleu	%xcc,	%l0,	%o1
	edge8ln	%g4,	%o0,	%o2
	array16	%i3,	%l6,	%g7
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	fabss	%f11,	%f21
	udivx	%i6,	0x05FE,	%i4
	srax	%i1,	%l3,	%l4
	edge32l	%g6,	%i7,	%o3
	restore %g3, 0x1457, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l2,	0x110F,	%i5
	sir	0x0D65
	fmovdneg	%xcc,	%f0,	%f16
	orcc	%i0,	0x0737,	%o7
	subc	%o4,	%g1,	%o5
	edge32l	%l5,	%i2,	%g2
	ldsb	[%l7 + 0x41],	%o1
	movge	%icc,	%l0,	%g4
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	fmovdge	%xcc,	%f3,	%f3
	popc	%i3,	%g7
	fmovsvs	%xcc,	%f31,	%f20
	sth	%g5,	[%l7 + 0x46]
	siam	0x0
	ldub	[%l7 + 0x68],	%i6
	addccc	%i4,	%i1,	%l3
	fcmpes	%fcc0,	%f1,	%f22
	movrgz	%l4,	%o6,	%g6
	save %o3, %g3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i7,	%l2
	and	%i5,	0x0139,	%o7
	edge16	%i0,	%o4,	%o5
	fcmple16	%f4,	%f12,	%l5
	save %i2, %g2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g1,	%l0,	%g4
	sra	%o0,	%o2,	%i3
	ldsh	[%l7 + 0x5C],	%g7
	xor	%g5,	0x0C8B,	%l6
	smul	%i6,	%i1,	%i4
	ldub	[%l7 + 0x50],	%l3
	movrgz	%o6,	0x144,	%g6
	ldsw	[%l7 + 0x08],	%o3
	array8	%l4,	%g3,	%l1
	fnands	%f31,	%f26,	%f6
	ldub	[%l7 + 0x5C],	%l2
	orcc	%i5,	%i7,	%i0
	edge16l	%o7,	%o4,	%o5
	and	%i2,	0x0986,	%l5
	movcs	%icc,	%g2,	%o1
	xorcc	%l0,	0x0D06,	%g1
	sub	%g4,	0x185A,	%o2
	fmovsn	%icc,	%f10,	%f23
	stw	%o0,	[%l7 + 0x58]
	fmovsa	%icc,	%f7,	%f31
	sethi	0x14C4,	%g7
	movl	%icc,	%g5,	%i3
	movrgz	%i6,	0x336,	%l6
	orncc	%i4,	0x1272,	%l3
	xorcc	%o6,	0x13B8,	%g6
	fors	%f10,	%f10,	%f18
	edge8n	%i1,	%o3,	%l4
	alignaddr	%g3,	%l2,	%l1
	sethi	0x1B52,	%i5
	andcc	%i0,	0x0152,	%o7
	edge8	%o4,	%o5,	%i2
	srlx	%i7,	%g2,	%l5
	fmovrdlez	%l0,	%f14,	%f22
	fmovsn	%xcc,	%f6,	%f11
	mulscc	%g1,	%g4,	%o2
	fmovsl	%icc,	%f2,	%f16
	lduh	[%l7 + 0x70],	%o1
	popc	0x1965,	%o0
	add	%g7,	%g5,	%i6
	movn	%xcc,	%l6,	%i4
	nop
	set	0x65, %o3
	stb	%i3,	[%l7 + %o3]
	fpack16	%f8,	%f21
	faligndata	%f30,	%f8,	%f20
	movrgez	%o6,	0x2F9,	%g6
	stw	%i1,	[%l7 + 0x24]
	udiv	%l3,	0x195E,	%o3
	addcc	%g3,	0x1FAA,	%l4
	movne	%icc,	%l1,	%i5
	addccc	%i0,	%l2,	%o7
	movpos	%xcc,	%o4,	%i2
	srax	%i7,	%g2,	%l5
	andn	%l0,	0x14E0,	%o5
	udivcc	%g1,	0x0B1F,	%g4
	fmovsvc	%xcc,	%f13,	%f15
	subcc	%o2,	%o0,	%g7
	ld	[%l7 + 0x7C],	%f3
	ldsb	[%l7 + 0x5E],	%o1
	ldd	[%l7 + 0x20],	%f20
	andncc	%i6,	%l6,	%g5
	stb	%i3,	[%l7 + 0x32]
	udiv	%i4,	0x14F5,	%o6
	edge32	%g6,	%i1,	%l3
	move	%xcc,	%g3,	%l4
	edge32	%o3,	%i5,	%l1
	sdivcc	%i0,	0x16C4,	%l2
	addccc	%o4,	%o7,	%i7
	array8	%g2,	%i2,	%l5
	movcc	%icc,	%l0,	%o5
	xor	%g4,	0x1977,	%g1
	edge16n	%o2,	%o0,	%o1
	save %g7, %i6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x08],	%f12
	movvs	%xcc,	%g5,	%i4
	stx	%i3,	[%l7 + 0x60]
	andn	%o6,	0x1820,	%g6
	sdivcc	%l3,	0x0352,	%i1
	fmovse	%icc,	%f13,	%f13
	movre	%g3,	0x121,	%l4
	fornot2	%f8,	%f16,	%f10
	movleu	%icc,	%i5,	%o3
	alignaddr	%i0,	%l2,	%l1
	ldsh	[%l7 + 0x12],	%o4
	movleu	%icc,	%i7,	%g2
	movrlz	%o7,	0x24B,	%l5
	movg	%xcc,	%i2,	%o5
	fnot2s	%f19,	%f30
	movcc	%icc,	%g4,	%g1
	fsrc1s	%f25,	%f29
	subccc	%o2,	%o0,	%o1
	fsrc1	%f0,	%f14
	std	%f28,	[%l7 + 0x40]
	fcmpgt16	%f28,	%f22,	%g7
	fzeros	%f23
	array32	%l0,	%l6,	%i6
	nop
	set	0x48, %i1
	lduw	[%l7 + %i1],	%i4
	edge32n	%i3,	%o6,	%g6
	srlx	%l3,	%g5,	%i1
	movneg	%icc,	%g3,	%l4
	fmovrsgz	%o3,	%f15,	%f8
	orn	%i5,	0x12B5,	%i0
	mulx	%l1,	%l2,	%i7
	fmovdge	%icc,	%f27,	%f31
	movneg	%xcc,	%g2,	%o7
	fmovsne	%icc,	%f8,	%f25
	edge32	%o4,	%l5,	%i2
	array32	%o5,	%g1,	%g4
	fexpand	%f30,	%f12
	movcs	%xcc,	%o2,	%o1
	xor	%o0,	0x1B21,	%g7
	fnot2	%f30,	%f26
	srlx	%l6,	%i6,	%i4
	xnorcc	%i3,	0x069C,	%l0
	ldsw	[%l7 + 0x7C],	%g6
	sra	%l3,	0x11,	%o6
	movg	%xcc,	%g5,	%g3
	fcmpne32	%f10,	%f0,	%l4
	udivx	%o3,	0x16BD,	%i1
	fandnot1s	%f20,	%f1,	%f16
	fmovsvs	%xcc,	%f6,	%f18
	fcmpne32	%f10,	%f12,	%i0
	subc	%l1,	0x1D20,	%i5
	popc	%l2,	%i7
	movvs	%icc,	%o7,	%o4
	stb	%g2,	[%l7 + 0x6E]
	ldsw	[%l7 + 0x24],	%l5
	orcc	%o5,	%i2,	%g1
	ldsw	[%l7 + 0x70],	%o2
	sth	%g4,	[%l7 + 0x20]
	fcmpgt32	%f10,	%f2,	%o1
	sra	%o0,	0x11,	%g7
	fmul8x16al	%f15,	%f1,	%f8
	fnegd	%f20,	%f16
	fzeros	%f14
	fmovsne	%xcc,	%f8,	%f28
	subcc	%l6,	%i4,	%i3
	movrgez	%i6,	0x061,	%l0
	sra	%l3,	%o6,	%g5
	movgu	%icc,	%g6,	%g3
	movrne	%l4,	%i1,	%o3
	srlx	%i0,	0x09,	%l1
	ldd	[%l7 + 0x50],	%f28
	movre	%i5,	0x248,	%i7
	subccc	%o7,	%l2,	%g2
	fandnot2s	%f9,	%f1,	%f14
	fzero	%f20
	smul	%o4,	0x1CC2,	%l5
	movge	%xcc,	%o5,	%i2
	sth	%o2,	[%l7 + 0x0E]
	edge32	%g1,	%g4,	%o1
	save %o0, 0x191B, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f14,	%f12,	%f10
	xnor	%g7,	%i3,	%i4
	edge8l	%i6,	%l0,	%l3
	movl	%xcc,	%o6,	%g5
	alignaddr	%g6,	%l4,	%g3
	alignaddr	%i1,	%o3,	%i0
	fandnot1s	%f13,	%f5,	%f4
	movneg	%icc,	%i5,	%l1
	fmovdn	%icc,	%f12,	%f3
	fcmple32	%f0,	%f8,	%i7
	movre	%o7,	0x196,	%g2
	save %o4, %l2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l5,	%i2,	%o2
	fzeros	%f28
	fnot1	%f16,	%f12
	movrgz	%g4,	%g1,	%o1
	sll	%o0,	%g7,	%i3
	fmuld8sux16	%f0,	%f27,	%f18
	movleu	%xcc,	%i4,	%i6
	edge32	%l6,	%l0,	%o6
	udivcc	%l3,	0x0A69,	%g6
	array8	%g5,	%g3,	%i1
	movrne	%l4,	0x189,	%o3
	move	%icc,	%i0,	%l1
	ldsh	[%l7 + 0x52],	%i5
	bshuffle	%f4,	%f30,	%f24
	movleu	%xcc,	%i7,	%g2
	srax	%o7,	0x16,	%o4
	sra	%l2,	%l5,	%o5
	siam	0x0
	movcs	%xcc,	%o2,	%i2
	edge32n	%g4,	%o1,	%o0
	add	%g1,	%i3,	%i4
	movrgez	%g7,	%l6,	%i6
	srax	%l0,	0x04,	%o6
	edge8l	%g6,	%g5,	%g3
	fmuld8sux16	%f20,	%f28,	%f16
	mova	%icc,	%i1,	%l4
	subc	%l3,	%o3,	%i0
	stw	%l1,	[%l7 + 0x4C]
	xnor	%i7,	%i5,	%g2
	fmovdvs	%xcc,	%f21,	%f4
	mova	%xcc,	%o4,	%l2
	sub	%l5,	%o5,	%o7
	nop
	set	0x60, %i2
	stx	%i2,	[%l7 + %i2]
	fmovdl	%icc,	%f15,	%f26
	movne	%icc,	%o2,	%g4
	movne	%xcc,	%o1,	%g1
	subccc	%o0,	%i4,	%g7
	mulscc	%l6,	0x07D8,	%i3
	fmovsneg	%icc,	%f21,	%f26
	andncc	%i6,	%o6,	%l0
	move	%xcc,	%g5,	%g3
	sdivx	%i1,	0x0EB0,	%l4
	ld	[%l7 + 0x68],	%f3
	srax	%l3,	%o3,	%g6
	fmovdpos	%icc,	%f28,	%f31
	subcc	%l1,	0x0AB5,	%i7
	fnot1	%f30,	%f14
	fones	%f11
	orn	%i0,	0x058B,	%g2
	fmovsg	%xcc,	%f24,	%f14
	orn	%i5,	%o4,	%l2
	fmovrsne	%o5,	%f18,	%f18
	fmovrslz	%o7,	%f20,	%f20
	movrgez	%i2,	%o2,	%l5
	fmovdgu	%xcc,	%f19,	%f20
	movrgz	%g4,	0x1CC,	%g1
	edge16l	%o1,	%i4,	%o0
	fpsub16	%f2,	%f8,	%f8
	fmovsvs	%xcc,	%f2,	%f0
	fmovs	%f7,	%f0
	edge8n	%g7,	%l6,	%i6
	edge16n	%o6,	%l0,	%i3
	movpos	%icc,	%g3,	%g5
	edge8n	%i1,	%l3,	%o3
	edge16ln	%l4,	%l1,	%g6
	sdiv	%i0,	0x047E,	%g2
	lduh	[%l7 + 0x6C],	%i7
	fcmpes	%fcc3,	%f19,	%f17
	edge16	%i5,	%l2,	%o5
	std	%f16,	[%l7 + 0x10]
	movcc	%icc,	%o4,	%o7
	fmovdcs	%icc,	%f17,	%f12
	ldd	[%l7 + 0x30],	%f8
	lduw	[%l7 + 0x30],	%o2
	andncc	%l5,	%i2,	%g1
	fpsub32	%f16,	%f28,	%f4
	movrlz	%g4,	%i4,	%o0
	fmovrslz	%o1,	%f18,	%f26
	umul	%g7,	0x007E,	%i6
	fmovrse	%o6,	%f19,	%f27
	fpack16	%f22,	%f2
	xnorcc	%l0,	0x0041,	%i3
	array8	%g3,	%g5,	%i1
	restore %l6, 0x172D, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%l3,	%l4
	orncc	%g6,	0x0EB2,	%i0
	srlx	%l1,	0x0C,	%g2
	addc	%i5,	%l2,	%i7
	fmuld8ulx16	%f2,	%f28,	%f6
	xor	%o5,	%o7,	%o4
	edge8ln	%o2,	%i2,	%l5
	stx	%g4,	[%l7 + 0x70]
	fpsub16s	%f30,	%f14,	%f19
	fsrc2	%f14,	%f0
	srl	%i4,	%g1,	%o1
	fcmped	%fcc1,	%f10,	%f6
	movre	%g7,	%o0,	%o6
	fcmpne16	%f18,	%f6,	%l0
	umulcc	%i3,	%i6,	%g5
	ldsw	[%l7 + 0x4C],	%g3
	edge16ln	%l6,	%o3,	%i1
	edge16n	%l4,	%l3,	%g6
	bshuffle	%f14,	%f4,	%f14
	fxor	%f2,	%f12,	%f12
	save %i0, %l1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f26,	%f0
	ldd	[%l7 + 0x78],	%l2
	movneg	%icc,	%i5,	%o5
	udivx	%i7,	0x0E6A,	%o4
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	sll	%o2,	0x1D,	%g4
	edge16n	%l5,	%i4,	%g1
	edge8n	%o1,	%g7,	%o0
	ldd	[%l7 + 0x58],	%f16
	fandnot1s	%f16,	%f7,	%f13
	fxnors	%f25,	%f23,	%f24
	udivx	%l0,	0x172F,	%i3
	fmul8ulx16	%f16,	%f20,	%f12
	andn	%o6,	%i6,	%g3
	edge16	%g5,	%l6,	%o3
	movrgz	%l4,	%i1,	%g6
	sdiv	%l3,	0x0A99,	%i0
	fmovdcc	%icc,	%f12,	%f14
	movn	%xcc,	%g2,	%l2
	array16	%l1,	%o5,	%i5
	sth	%o4,	[%l7 + 0x52]
	edge16n	%i7,	%i2,	%o7
	fmovda	%xcc,	%f6,	%f9
	fmovrslz	%g4,	%f19,	%f29
	edge16ln	%l5,	%o2,	%i4
	fnand	%f14,	%f2,	%f4
	edge8l	%g1,	%g7,	%o1
	xnor	%l0,	%o0,	%o6
	movge	%icc,	%i6,	%g3
	alignaddr	%i3,	%l6,	%o3
	movgu	%xcc,	%l4,	%g5
	movge	%xcc,	%i1,	%g6
	movne	%xcc,	%i0,	%g2
	orcc	%l3,	%l2,	%l1
	fsrc2	%f4,	%f16
	edge8l	%o5,	%o4,	%i7
	save %i5, %o7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f12,	%f6,	%f10
	sdivcc	%l5,	0x16CB,	%o2
	fzero	%f20
	fpackfix	%f10,	%f7
	restore %g4, %g1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i4,	0x19F,	%l0
	sethi	0x05D0,	%o1
	udiv	%o6,	0x0224,	%o0
	ldsh	[%l7 + 0x0C],	%i6
	edge8n	%i3,	%g3,	%o3
	or	%l6,	0x0D7E,	%l4
	sir	0x1E33
	ldd	[%l7 + 0x68],	%g4
	smul	%i1,	%i0,	%g6
	edge8	%g2,	%l3,	%l1
	move	%xcc,	%o5,	%l2
	ldx	[%l7 + 0x08],	%i7
	alignaddr	%o4,	%o7,	%i2
	move	%icc,	%l5,	%i5
	movgu	%xcc,	%g4,	%g1
	fmovsg	%icc,	%f24,	%f22
	fmovs	%f24,	%f3
	andncc	%o2,	%g7,	%i4
	edge32ln	%o1,	%l0,	%o0
	stb	%o6,	[%l7 + 0x16]
	edge16l	%i3,	%i6,	%o3
	subccc	%g3,	%l4,	%l6
	fcmple16	%f16,	%f12,	%g5
	ldsh	[%l7 + 0x70],	%i1
	fcmpgt16	%f20,	%f18,	%g6
	movl	%icc,	%i0,	%l3
	udivcc	%l1,	0x02C8,	%o5
	fxors	%f7,	%f12,	%f14
	fpsub32	%f20,	%f8,	%f22
	lduw	[%l7 + 0x6C],	%l2
	edge16	%i7,	%g2,	%o4
	sll	%i2,	%l5,	%i5
	movcc	%xcc,	%g4,	%g1
	fornot2	%f22,	%f30,	%f4
	xnorcc	%o7,	%g7,	%i4
	fcmpne16	%f18,	%f6,	%o1
	save %l0, 0x12C1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o2,	%o6,	%i6
	fmovsgu	%icc,	%f13,	%f31
	orcc	%o3,	%i3,	%g3
	ldsw	[%l7 + 0x34],	%l6
	udivcc	%g5,	0x0C6C,	%l4
	nop
	set	0x7E, %g5
	ldub	[%l7 + %g5],	%i1
	stx	%g6,	[%l7 + 0x10]
	movneg	%xcc,	%i0,	%l3
	fcmpne16	%f20,	%f26,	%o5
	srlx	%l2,	%l1,	%g2
	fmovspos	%icc,	%f16,	%f1
	fmovrdgez	%o4,	%f16,	%f2
	st	%f3,	[%l7 + 0x48]
	lduh	[%l7 + 0x42],	%i7
	stb	%l5,	[%l7 + 0x4E]
	ldd	[%l7 + 0x30],	%f6
	fandnot1s	%f10,	%f15,	%f8
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	orncc	%o7,	%g1,	%i4
	save %g7, %l0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o2,	%o6,	%o0
	fcmple16	%f16,	%f12,	%i6
	mova	%icc,	%i3,	%g3
	srl	%l6,	%g5,	%o3
	alignaddrl	%i1,	%l4,	%g6
	sth	%i0,	[%l7 + 0x62]
	fmovrdne	%o5,	%f10,	%f24
	sir	0x1AC5
	sth	%l3,	[%l7 + 0x40]
	restore %l2, 0x108F, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l1,	0x10E3,	%o4
	andcc	%l5,	0x0DED,	%i7
	mova	%xcc,	%i5,	%i2
	movrlez	%g4,	0x312,	%g1
	ld	[%l7 + 0x54],	%f24
	fmovspos	%xcc,	%f14,	%f18
	fmovrsgz	%o7,	%f10,	%f9
	subccc	%i4,	0x02E8,	%l0
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%g6
	movrne	%o1,	%o2,	%o6
	lduh	[%l7 + 0x60],	%i6
	fornot2	%f22,	%f4,	%f2
	popc	%o0,	%i3
	sub	%l6,	0x0018,	%g3
	stw	%o3,	[%l7 + 0x6C]
	subccc	%i1,	%l4,	%g6
	andcc	%g5,	0x1683,	%i0
	ldsb	[%l7 + 0x16],	%l3
	orcc	%l2,	0x09E8,	%o5
	edge16n	%l1,	%o4,	%l5
	sdivx	%g2,	0x0FBA,	%i7
	addcc	%i5,	0x1B93,	%i2
	for	%f12,	%f28,	%f6
	sdiv	%g4,	0x0998,	%g1
	udivcc	%i4,	0x1C76,	%o7
	movleu	%xcc,	%g7,	%l0
	edge32	%o1,	%o6,	%o2
	fmovsn	%xcc,	%f28,	%f18
	fmovrdgez	%i6,	%f18,	%f26
	edge16l	%o0,	%l6,	%i3
	ldsh	[%l7 + 0x4E],	%g3
	edge8l	%i1,	%l4,	%g6
	umulcc	%g5,	%o3,	%l3
	movle	%icc,	%l2,	%o5
	subc	%l1,	%o4,	%l5
	fmovrslez	%i0,	%f25,	%f17
	movgu	%xcc,	%g2,	%i5
	fmul8x16al	%f10,	%f0,	%f14
	edge32ln	%i2,	%i7,	%g1
	orncc	%i4,	%o7,	%g7
	ldx	[%l7 + 0x68],	%l0
	array8	%g4,	%o1,	%o6
	udivx	%o2,	0x1738,	%i6
	subccc	%o0,	%l6,	%i3
	edge8ln	%g3,	%i1,	%g6
	mulscc	%g5,	0x07FA,	%o3
	fmovsle	%xcc,	%f29,	%f20
	movvs	%icc,	%l3,	%l4
	xnorcc	%o5,	%l2,	%o4
	andcc	%l5,	0x14A7,	%i0
	edge8	%g2,	%i5,	%l1
	sra	%i2,	%g1,	%i4
	sllx	%i7,	%o7,	%g7
	movn	%xcc,	%g4,	%l0
	movl	%icc,	%o1,	%o6
	orncc	%i6,	%o0,	%l6
	edge8	%i3,	%g3,	%o2
	umulcc	%g6,	0x09A6,	%g5
	addc	%i1,	0x1E00,	%l3
	movrne	%o3,	0x1D0,	%o5
	fcmple16	%f24,	%f18,	%l2
	subc	%o4,	%l5,	%i0
	fmovdcs	%xcc,	%f18,	%f1
	edge16ln	%l4,	%i5,	%g2
	and	%l1,	0x182A,	%g1
	fsrc1	%f20,	%f24
	fcmpne32	%f10,	%f2,	%i4
	fmovsl	%icc,	%f1,	%f1
	ldsb	[%l7 + 0x0D],	%i2
	movvs	%icc,	%i7,	%o7
	andn	%g4,	0x016B,	%l0
	stb	%o1,	[%l7 + 0x46]
	alignaddrl	%o6,	%i6,	%g7
	movrgez	%o0,	0x010,	%i3
	fmovs	%f8,	%f26
	alignaddrl	%g3,	%o2,	%l6
	edge16n	%g5,	%g6,	%l3
	fmovdcs	%xcc,	%f27,	%f6
	movpos	%xcc,	%i1,	%o3
	fabss	%f14,	%f5
	movrgz	%o5,	%o4,	%l2
	mulx	%l5,	0x06EA,	%l4
	st	%f31,	[%l7 + 0x2C]
	mova	%icc,	%i0,	%i5
	fmovrse	%g2,	%f17,	%f28
	movg	%icc,	%g1,	%i4
	edge8n	%l1,	%i7,	%i2
	fabsd	%f22,	%f14
	smulcc	%g4,	0x1477,	%l0
	fmovrsgez	%o7,	%f29,	%f21
	fmuld8ulx16	%f3,	%f3,	%f18
	add	%o1,	%i6,	%o6
	smulcc	%o0,	%i3,	%g7
	and	%g3,	0x0216,	%l6
	edge32l	%g5,	%g6,	%l3
	orcc	%o2,	0x0EA8,	%o3
	fxor	%f30,	%f4,	%f26
	andcc	%i1,	%o4,	%l2
	sdivx	%o5,	0x0322,	%l5
	ldsw	[%l7 + 0x48],	%i0
	fpack16	%f12,	%f14
	ld	[%l7 + 0x4C],	%f11
	sdivcc	%i5,	0x08A3,	%g2
	ldd	[%l7 + 0x50],	%f0
	movrgez	%l4,	%g1,	%i4
	movrgez	%l1,	0x313,	%i2
	std	%f28,	[%l7 + 0x70]
	sdivcc	%g4,	0x09DB,	%l0
	or	%o7,	%i7,	%o1
	sdiv	%i6,	0x0F65,	%o0
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	andcc	%g3,	%l6,	%g6
	xor	%l3,	%g5,	%o2
	srlx	%i1,	0x0B,	%o3
	or	%l2,	0x11D6,	%o4
	mova	%xcc,	%o5,	%i0
	sllx	%l5,	0x1D,	%g2
	fsrc2	%f22,	%f30
	alignaddrl	%l4,	%g1,	%i4
	movgu	%xcc,	%i5,	%i2
	addccc	%l1,	%g4,	%l0
	sdivcc	%o7,	0x169B,	%i7
	stw	%i6,	[%l7 + 0x60]
	movl	%xcc,	%o0,	%o6
	fcmpne32	%f18,	%f4,	%o1
	fmovrslz	%g7,	%f6,	%f6
	ldx	[%l7 + 0x68],	%g3
	xor	%l6,	%i3,	%l3
	ldsb	[%l7 + 0x63],	%g5
	movre	%o2,	0x0A0,	%g6
	save %o3, %i1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o4,	0x0C87,	%o5
	addc	%l5,	0x0928,	%i0
	movneg	%icc,	%l4,	%g2
	sllx	%g1,	0x19,	%i4
	xor	%i5,	0x0622,	%l1
	smul	%g4,	0x0574,	%l0
	ldsh	[%l7 + 0x48],	%i2
	xorcc	%o7,	0x0DD4,	%i6
	edge16l	%i7,	%o6,	%o0
	fmovrde	%g7,	%f30,	%f24
	fcmpd	%fcc3,	%f22,	%f0
	fmovdcs	%icc,	%f27,	%f19
	alignaddrl	%o1,	%g3,	%l6
	nop
	set	0x64, %l0
	stw	%i3,	[%l7 + %l0]
	xnorcc	%g5,	0x044E,	%o2
	fmovrsgez	%g6,	%f11,	%f19
	edge16	%l3,	%o3,	%l2
	mulscc	%o4,	%i1,	%o5
	sth	%i0,	[%l7 + 0x76]
	fmovrslz	%l5,	%f10,	%f30
	fnot2	%f2,	%f22
	fcmpeq16	%f30,	%f6,	%l4
	andncc	%g2,	%g1,	%i4
	fsrc2	%f14,	%f10
	sdiv	%l1,	0x0E14,	%g4
	subcc	%i5,	0x0539,	%l0
	array16	%i2,	%i6,	%i7
	ldx	[%l7 + 0x30],	%o7
	sth	%o0,	[%l7 + 0x5C]
	smulcc	%o6,	%g7,	%o1
	edge8n	%l6,	%g3,	%g5
	move	%xcc,	%o2,	%g6
	edge16ln	%l3,	%o3,	%i3
	edge8	%o4,	%l2,	%i1
	std	%f10,	[%l7 + 0x48]
	addc	%i0,	0x1987,	%l5
	xnorcc	%o5,	%l4,	%g2
	ld	[%l7 + 0x70],	%f9
	edge16l	%i4,	%l1,	%g4
	mova	%xcc,	%i5,	%l0
	edge16l	%g1,	%i6,	%i2
	movcs	%icc,	%o7,	%o0
	fmovdne	%icc,	%f22,	%f18
	udivx	%i7,	0x0C02,	%o6
	smulcc	%o1,	%l6,	%g3
	sdiv	%g5,	0x072F,	%g7
	and	%g6,	0x0027,	%l3
	sdivx	%o3,	0x1E8A,	%i3
	mulscc	%o2,	0x0E83,	%l2
	fnors	%f11,	%f21,	%f28
	movleu	%icc,	%o4,	%i0
	ldx	[%l7 + 0x28],	%l5
	xnorcc	%o5,	%l4,	%g2
	smul	%i4,	0x189C,	%l1
	andncc	%i1,	%i5,	%g4
	xnor	%g1,	%i6,	%i2
	fands	%f26,	%f4,	%f13
	orncc	%l0,	0x1B0A,	%o0
	fpackfix	%f18,	%f17
	movcc	%icc,	%o7,	%i7
	movvc	%xcc,	%o6,	%o1
	sra	%g3,	%g5,	%g7
	edge32n	%l6,	%g6,	%o3
	edge16	%i3,	%l3,	%o2
	movre	%l2,	%o4,	%i0
	stx	%o5,	[%l7 + 0x50]
	umulcc	%l5,	%l4,	%g2
	udiv	%i4,	0x0A26,	%i1
	edge8n	%l1,	%i5,	%g1
	lduh	[%l7 + 0x5C],	%i6
	array16	%i2,	%g4,	%l0
	edge8l	%o7,	%i7,	%o6
	fmovsgu	%xcc,	%f16,	%f4
	andncc	%o0,	%o1,	%g3
	fcmps	%fcc3,	%f0,	%f31
	stx	%g5,	[%l7 + 0x10]
	subcc	%l6,	%g6,	%o3
	edge8l	%i3,	%l3,	%o2
	sethi	0x0560,	%l2
	and	%g7,	%i0,	%o5
	array16	%l5,	%l4,	%o4
	move	%icc,	%i4,	%g2
	movgu	%xcc,	%i1,	%l1
	movle	%icc,	%g1,	%i5
	movvc	%xcc,	%i6,	%g4
	lduw	[%l7 + 0x74],	%l0
	sdivx	%o7,	0x1ECF,	%i7
	mulscc	%o6,	%o0,	%o1
	fmovscc	%xcc,	%f24,	%f17
	fabss	%f4,	%f20
	movge	%icc,	%i2,	%g5
	edge32ln	%g3,	%g6,	%l6
	fnand	%f4,	%f0,	%f12
	ldd	[%l7 + 0x20],	%i2
	ldsw	[%l7 + 0x3C],	%o3
	movle	%xcc,	%o2,	%l3
	sth	%l2,	[%l7 + 0x4C]
	movvs	%xcc,	%i0,	%o5
	movvc	%icc,	%l5,	%l4
	udivcc	%g7,	0x0DCA,	%i4
	movneg	%icc,	%o4,	%i1
	ldub	[%l7 + 0x78],	%l1
	orn	%g1,	0x1F77,	%i5
	lduh	[%l7 + 0x34],	%g2
	movrne	%i6,	0x27F,	%g4
	srax	%o7,	%l0,	%i7
	fandnot2	%f16,	%f14,	%f16
	subccc	%o0,	0x196F,	%o6
	movre	%i2,	%g5,	%g3
	sdiv	%o1,	0x1412,	%l6
	movleu	%xcc,	%g6,	%i3
	andcc	%o2,	%l3,	%o3
	subcc	%i0,	0x11F4,	%l2
	udiv	%l5,	0x08F6,	%l4
	edge16l	%o5,	%g7,	%o4
	mulscc	%i1,	0x027F,	%i4
	edge8n	%l1,	%i5,	%g2
	fmovsne	%icc,	%f21,	%f22
	fands	%f16,	%f29,	%f4
	sdivcc	%i6,	0x11A9,	%g4
	fmovdneg	%icc,	%f19,	%f6
	fmovs	%f3,	%f28
	stb	%o7,	[%l7 + 0x5A]
	fandnot1	%f2,	%f30,	%f12
	fmovscc	%icc,	%f1,	%f24
	st	%f30,	[%l7 + 0x08]
	movcc	%xcc,	%l0,	%g1
	fandnot2s	%f21,	%f24,	%f7
	ldx	[%l7 + 0x08],	%o0
	smul	%i7,	0x0BA2,	%i2
	orcc	%g5,	%o6,	%o1
	edge32ln	%l6,	%g6,	%i3
	movrlz	%o2,	0x2EE,	%l3
	movrgez	%o3,	%g3,	%l2
	xnorcc	%l5,	%i0,	%o5
	fmovsge	%xcc,	%f22,	%f22
	ldsb	[%l7 + 0x63],	%g7
	fxnors	%f8,	%f3,	%f26
	xor	%l4,	0x084E,	%o4
	fpackfix	%f16,	%f13
	edge16l	%i1,	%i4,	%l1
	fmovrdlez	%g2,	%f4,	%f6
	nop
	set	0x28, %g4
	lduw	[%l7 + %g4],	%i6
	movrgz	%g4,	%i5,	%o7
	fnands	%f10,	%f26,	%f29
	andn	%l0,	0x06E5,	%o0
	popc	%i7,	%g1
	movrlz	%i2,	%g5,	%o1
	lduh	[%l7 + 0x12],	%l6
	edge16	%g6,	%o6,	%i3
	movpos	%icc,	%l3,	%o3
	ldsb	[%l7 + 0x7D],	%o2
	sth	%g3,	[%l7 + 0x42]
	array32	%l5,	%i0,	%o5
	fmovdpos	%xcc,	%f21,	%f7
	sir	0x0014
	umul	%l2,	0x0883,	%g7
	ldx	[%l7 + 0x20],	%l4
	fandnot1	%f2,	%f2,	%f24
	movrlez	%i1,	0x244,	%i4
	fmovscc	%icc,	%f6,	%f29
	movrgz	%o4,	0x028,	%l1
	nop
	set	0x28, %o1
	ldsw	[%l7 + %o1],	%i6
	or	%g4,	%i5,	%o7
	ldsb	[%l7 + 0x4E],	%g2
	mulx	%o0,	%i7,	%l0
	edge8ln	%g1,	%g5,	%i2
	edge32n	%l6,	%g6,	%o1
	movleu	%xcc,	%i3,	%o6
	sra	%o3,	0x0D,	%l3
	fmovdvc	%xcc,	%f5,	%f13
	fmovd	%f12,	%f10
	movvs	%xcc,	%g3,	%o2
	sll	%i0,	0x13,	%l5
	alignaddrl	%o5,	%g7,	%l4
	sdiv	%i1,	0x06D1,	%i4
	movg	%xcc,	%o4,	%l2
	ldsb	[%l7 + 0x60],	%i6
	srl	%l1,	%g4,	%o7
	orn	%i5,	0x19BA,	%g2
	orn	%o0,	0x066F,	%l0
	fabss	%f22,	%f8
	lduh	[%l7 + 0x1A],	%i7
	movrgez	%g5,	%i2,	%g1
	edge8n	%g6,	%o1,	%l6
	fand	%f12,	%f26,	%f2
	ld	[%l7 + 0x5C],	%f26
	addcc	%i3,	0x0A6B,	%o6
	edge8ln	%o3,	%g3,	%l3
	smulcc	%i0,	0x049A,	%o2
	movgu	%icc,	%l5,	%g7
	sll	%l4,	0x0B,	%i1
	fandnot2	%f22,	%f12,	%f24
	umul	%o5,	%i4,	%l2
	fmovrdlez	%o4,	%f0,	%f4
	fmovrdlz	%l1,	%f0,	%f10
	xnorcc	%i6,	0x1DA5,	%o7
	mova	%icc,	%g4,	%g2
	srax	%o0,	0x07,	%i5
	movl	%xcc,	%i7,	%l0
	movgu	%xcc,	%i2,	%g5
	alignaddrl	%g6,	%o1,	%g1
	fone	%f30
	sdivcc	%l6,	0x1D93,	%i3
	ldd	[%l7 + 0x38],	%f16
	move	%icc,	%o3,	%g3
	xorcc	%o6,	%l3,	%o2
	array16	%l5,	%i0,	%l4
	movneg	%icc,	%i1,	%o5
	fmovrsgz	%g7,	%f14,	%f16
	fmovrsgez	%l2,	%f12,	%f31
	udiv	%o4,	0x0DF6,	%l1
	edge16n	%i4,	%o7,	%g4
	edge8n	%i6,	%g2,	%o0
	fxnor	%f30,	%f10,	%f10
	edge16ln	%i7,	%i5,	%i2
	fxnor	%f28,	%f0,	%f24
	st	%f18,	[%l7 + 0x4C]
	fmovd	%f8,	%f14
	fmovse	%icc,	%f31,	%f0
	xnor	%g5,	0x087E,	%l0
	andncc	%g6,	%g1,	%l6
	orn	%i3,	0x03C0,	%o1
	movrlez	%o3,	0x1A1,	%g3
	edge16n	%l3,	%o2,	%l5
	ldd	[%l7 + 0x20],	%i0
	andncc	%l4,	%o6,	%i1
	fmovdge	%xcc,	%f9,	%f25
	array8	%g7,	%l2,	%o5
	lduw	[%l7 + 0x10],	%o4
	umulcc	%l1,	0x1077,	%o7
	sll	%i4,	%g4,	%i6
	fmul8x16au	%f17,	%f17,	%f8
	alignaddrl	%o0,	%i7,	%i5
	edge8n	%i2,	%g2,	%g5
	subc	%g6,	%g1,	%l6
	fmovsge	%xcc,	%f1,	%f19
	sll	%i3,	0x0C,	%l0
	umulcc	%o3,	0x1047,	%g3
	nop
	set	0x24, %l5
	stw	%o1,	[%l7 + %l5]
	sethi	0x1244,	%l3
	ldsb	[%l7 + 0x2C],	%o2
	fnot1s	%f26,	%f12
	udiv	%i0,	0x00BE,	%l4
	fmovsge	%xcc,	%f24,	%f11
	lduh	[%l7 + 0x78],	%l5
	movrne	%o6,	0x058,	%i1
	sir	0x1E45
	ldsw	[%l7 + 0x24],	%g7
	or	%o5,	%o4,	%l1
	fmovdge	%xcc,	%f13,	%f17
	fmovrdne	%l2,	%f6,	%f4
	sdiv	%o7,	0x0F31,	%g4
	mova	%xcc,	%i6,	%o0
	fmovrdgz	%i7,	%f20,	%f20
	lduw	[%l7 + 0x2C],	%i5
	stb	%i4,	[%l7 + 0x53]
	sir	0x1CA8
	movneg	%icc,	%i2,	%g2
	movpos	%icc,	%g5,	%g6
	movrlez	%g1,	%l6,	%l0
	subcc	%i3,	0x1B1E,	%g3
	edge32l	%o3,	%l3,	%o2
	subcc	%i0,	%l4,	%o1
	popc	0x125D,	%l5
	fmovdcs	%icc,	%f6,	%f10
	udivcc	%i1,	0x0710,	%g7
	edge8l	%o5,	%o6,	%l1
	sub	%l2,	%o4,	%o7
	stw	%g4,	[%l7 + 0x50]
	or	%o0,	%i7,	%i5
	addccc	%i4,	0x1973,	%i2
	edge8n	%g2,	%g5,	%g6
	mulx	%i6,	0x1CDB,	%g1
	sethi	0x13FB,	%l6
	edge16ln	%l0,	%i3,	%o3
	movcc	%xcc,	%l3,	%o2
	fmovrdne	%i0,	%f28,	%f4
	andncc	%g3,	%l4,	%o1
	array8	%l5,	%i1,	%g7
	sth	%o5,	[%l7 + 0x56]
	movrlez	%l1,	%o6,	%l2
	movre	%o7,	0x354,	%g4
	fexpand	%f20,	%f28
	movneg	%xcc,	%o0,	%i7
	fcmped	%fcc1,	%f4,	%f8
	fmovdvs	%xcc,	%f27,	%f11
	fcmped	%fcc3,	%f18,	%f28
	sir	0x1314
	subcc	%o4,	0x16C1,	%i4
	ldsw	[%l7 + 0x5C],	%i2
	xor	%g2,	0x19FD,	%i5
	fexpand	%f28,	%f14
	udivx	%g5,	0x17F0,	%i6
	edge8	%g6,	%l6,	%l0
	stw	%i3,	[%l7 + 0x38]
	fmovsle	%xcc,	%f10,	%f15
	andcc	%g1,	%l3,	%o3
	st	%f25,	[%l7 + 0x6C]
	fmul8sux16	%f6,	%f0,	%f24
	ldd	[%l7 + 0x48],	%f2
	xor	%o2,	0x079F,	%i0
	movrgz	%g3,	0x0F0,	%l4
	subccc	%o1,	%l5,	%g7
	umulcc	%i1,	%o5,	%o6
	movrlez	%l2,	%l1,	%o7
	andncc	%g4,	%o0,	%o4
	ldsh	[%l7 + 0x68],	%i4
	subc	%i7,	%g2,	%i5
	edge16ln	%i2,	%i6,	%g5
	fandnot2s	%f18,	%f6,	%f27
	fpadd16s	%f2,	%f1,	%f23
	stx	%g6,	[%l7 + 0x18]
	and	%l0,	0x02E6,	%i3
	fmovrsgz	%l6,	%f26,	%f15
	ldsh	[%l7 + 0x64],	%g1
	edge8l	%o3,	%o2,	%i0
	movn	%icc,	%g3,	%l3
	orncc	%o1,	0x1D9F,	%l4
	umul	%l5,	%i1,	%o5
	fpackfix	%f30,	%f8
	xnorcc	%g7,	0x1071,	%o6
	fmovrse	%l1,	%f18,	%f25
	edge16	%o7,	%l2,	%g4
	sdivx	%o4,	0x077E,	%i4
	st	%f27,	[%l7 + 0x10]
	popc	%i7,	%o0
	array32	%g2,	%i2,	%i6
	mulx	%g5,	0x1C63,	%i5
	movrlez	%l0,	%i3,	%l6
	movg	%icc,	%g1,	%o3
	addcc	%o2,	0x0B8E,	%g6
	stw	%i0,	[%l7 + 0x18]
	udiv	%l3,	0x1CDC,	%o1
	sth	%l4,	[%l7 + 0x24]
	restore %l5, %i1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g7,	%o6,	%o5
	xor	%o7,	0x1DB9,	%l1
	udivcc	%g4,	0x0765,	%o4
	stw	%l2,	[%l7 + 0x08]
	mulx	%i7,	0x0C19,	%i4
	movl	%xcc,	%g2,	%o0
	edge32	%i6,	%i2,	%i5
	array32	%g5,	%l0,	%l6
	movne	%xcc,	%i3,	%o3
	sdiv	%o2,	0x063F,	%g6
	orncc	%i0,	0x1BCF,	%l3
	ldd	[%l7 + 0x40],	%o0
	movrlz	%l4,	%g1,	%l5
	movrgez	%g3,	%i1,	%o6
	fone	%f18
	ldsb	[%l7 + 0x24],	%g7
	or	%o5,	%o7,	%g4
	mulx	%l1,	%l2,	%o4
	xor	%i4,	0x112D,	%i7
	array32	%o0,	%g2,	%i6
	edge16n	%i2,	%g5,	%i5
	bshuffle	%f10,	%f10,	%f12
	array32	%l6,	%l0,	%i3
	srax	%o3,	%o2,	%g6
	fzero	%f12
	stw	%l3,	[%l7 + 0x20]
	edge16	%i0,	%l4,	%g1
	movvc	%icc,	%l5,	%o1
	sll	%g3,	%o6,	%i1
	movle	%xcc,	%o5,	%g7
	movneg	%xcc,	%g4,	%l1
	movleu	%xcc,	%l2,	%o4
	fmovsle	%icc,	%f19,	%f25
	movge	%icc,	%i4,	%o7
	alignaddrl	%i7,	%g2,	%i6
	fmovscc	%xcc,	%f19,	%f5
	srax	%o0,	%g5,	%i5
	alignaddr	%i2,	%l0,	%i3
	sdivx	%l6,	0x1F41,	%o2
	umulcc	%o3,	0x12A2,	%l3
	fmovsleu	%icc,	%f17,	%f8
	fnor	%f10,	%f8,	%f22
	movrlez	%i0,	0x1FE,	%g6
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	ld	[%l7 + 0x6C],	%f21
	sll	%l5,	0x1C,	%o1
	udivcc	%g3,	0x18B3,	%o6
	alignaddr	%i1,	%g7,	%o5
	mova	%icc,	%g4,	%l1
	orn	%l2,	%o4,	%o7
	smul	%i7,	0x194A,	%g2
	fpackfix	%f16,	%f17
	mova	%icc,	%i4,	%i6
	and	%o0,	0x1E2C,	%g5
	movne	%xcc,	%i5,	%l0
	restore %i3, %l6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i2,	%o3,	%l3
	fsrc1s	%f17,	%f14
	fnor	%f12,	%f18,	%f10
	fcmpgt16	%f6,	%f12,	%i0
	edge32ln	%l4,	%g6,	%l5
	ldub	[%l7 + 0x10],	%o1
	subcc	%g1,	0x122B,	%o6
	edge8ln	%i1,	%g3,	%g7
	fzeros	%f12
	sethi	0x1637,	%g4
	subc	%o5,	%l1,	%l2
	edge8	%o4,	%o7,	%i7
	movge	%xcc,	%i4,	%i6
	edge16n	%o0,	%g2,	%i5
	ldsh	[%l7 + 0x5E],	%l0
	srlx	%i3,	%l6,	%g5
	stw	%o2,	[%l7 + 0x60]
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	edge16	%l4,	%i0,	%g6
	stx	%l5,	[%l7 + 0x38]
	sll	%o1,	0x14,	%o6
	sethi	0x0586,	%g1
	fmovsgu	%icc,	%f29,	%f11
	movg	%xcc,	%i1,	%g3
	movge	%xcc,	%g4,	%g7
	fmovsvs	%xcc,	%f29,	%f25
	bshuffle	%f28,	%f28,	%f10
	movpos	%icc,	%l1,	%o5
	andn	%o4,	%o7,	%i7
	stw	%l2,	[%l7 + 0x5C]
	fone	%f22
	fzero	%f16
	for	%f10,	%f20,	%f4
	fsrc1s	%f27,	%f3
	fmovsvs	%icc,	%f19,	%f11
	orncc	%i6,	%i4,	%g2
	alignaddr	%o0,	%i5,	%i3
	fmovsneg	%xcc,	%f25,	%f31
	array8	%l6,	%g5,	%l0
	ldx	[%l7 + 0x18],	%i2
	alignaddrl	%o3,	%o2,	%l4
	umulcc	%l3,	%g6,	%i0
	movleu	%icc,	%o1,	%l5
	udiv	%o6,	0x0A5C,	%i1
	stx	%g3,	[%l7 + 0x20]
	subcc	%g4,	0x185F,	%g1
	sllx	%g7,	0x15,	%o5
	movcc	%icc,	%o4,	%o7
	addc	%i7,	0x1C94,	%l2
	srax	%l1,	%i6,	%g2
	fmul8ulx16	%f12,	%f18,	%f22
	edge32n	%o0,	%i5,	%i3
	addc	%i4,	0x1658,	%l6
	edge8l	%l0,	%g5,	%o3
	orcc	%i2,	0x124B,	%l4
	movvs	%xcc,	%o2,	%g6
	fsrc1s	%f19,	%f9
	fcmpes	%fcc3,	%f7,	%f10
	fmovde	%xcc,	%f12,	%f8
	edge16l	%l3,	%i0,	%l5
	ldub	[%l7 + 0x1C],	%o1
	popc	0x0F05,	%i1
	sdivcc	%o6,	0x17D1,	%g4
	orn	%g3,	0x0036,	%g7
	sdivx	%g1,	0x10B1,	%o4
	xor	%o5,	%i7,	%l2
	stb	%o7,	[%l7 + 0x0C]
	fsrc1	%f20,	%f28
	fmovsge	%icc,	%f13,	%f20
	add	%l1,	%g2,	%i6
	ldx	[%l7 + 0x30],	%o0
	movcs	%icc,	%i5,	%i4
	edge32	%i3,	%l0,	%l6
	andncc	%o3,	%i2,	%g5
	nop
	set	0x12, %i3
	ldsh	[%l7 + %i3],	%l4
	edge16	%o2,	%g6,	%l3
	lduw	[%l7 + 0x4C],	%i0
	st	%f4,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%l5
	fmovdcs	%icc,	%f16,	%f17
	movgu	%icc,	%i1,	%o6
	movre	%o1,	%g3,	%g7
	edge8l	%g1,	%o4,	%g4
	fmovsg	%icc,	%f17,	%f8
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%o4
	fands	%f16,	%f12,	%f10
	fcmps	%fcc3,	%f4,	%f17
	array8	%l2,	%i7,	%l1
	edge16	%g2,	%i6,	%o0
	fmovsg	%xcc,	%f0,	%f22
	fpadd32	%f26,	%f14,	%f30
	sdivx	%i5,	0x169B,	%i4
	smulcc	%i3,	%l0,	%l6
	andn	%o3,	%i2,	%g5
	fxor	%f10,	%f6,	%f26
	movle	%xcc,	%l4,	%o7
	mulscc	%g6,	%l3,	%o2
	stb	%i0,	[%l7 + 0x54]
	array8	%l5,	%o6,	%o1
	fcmped	%fcc3,	%f10,	%f8
	udivx	%g3,	0x006B,	%g7
	fand	%f12,	%f2,	%f4
	subccc	%i1,	%g1,	%g4
	andcc	%o5,	%o4,	%l2
	sth	%i7,	[%l7 + 0x2A]
	fcmpne16	%f4,	%f10,	%l1
	edge8ln	%g2,	%i6,	%i5
	fpsub32	%f18,	%f12,	%f0
	xorcc	%o0,	%i4,	%i3
	srl	%l0,	0x0C,	%o3
	movpos	%xcc,	%i2,	%g5
	lduh	[%l7 + 0x52],	%l6
	sra	%l4,	0x1F,	%g6
	movrlz	%o7,	0x2AB,	%l3
	udivcc	%i0,	0x12C1,	%l5
	alignaddr	%o2,	%o1,	%o6
	movcs	%icc,	%g3,	%i1
	srlx	%g7,	%g4,	%g1
	umul	%o5,	0x1DD2,	%o4
	movgu	%xcc,	%l2,	%l1
	movrlez	%i7,	%g2,	%i6
	edge16l	%o0,	%i5,	%i3
	sra	%i4,	0x03,	%l0
	orcc	%i2,	%o3,	%l6
	udivcc	%g5,	0x031F,	%l4
	sdivcc	%g6,	0x1D4C,	%o7
	alignaddrl	%l3,	%i0,	%l5
	fnor	%f10,	%f24,	%f8
	alignaddrl	%o2,	%o1,	%o6
	st	%f5,	[%l7 + 0x1C]
	std	%f16,	[%l7 + 0x08]
	fzero	%f28
	sllx	%g3,	0x18,	%g7
	ldsb	[%l7 + 0x68],	%i1
	movge	%xcc,	%g4,	%g1
	fpmerge	%f14,	%f17,	%f12
	ld	[%l7 + 0x30],	%f25
	alignaddr	%o4,	%o5,	%l2
	and	%l1,	%g2,	%i6
	movneg	%icc,	%o0,	%i7
	stx	%i3,	[%l7 + 0x28]
	pdist	%f24,	%f18,	%f12
	edge16ln	%i5,	%l0,	%i4
	fsrc2	%f12,	%f12
	smul	%i2,	0x0943,	%o3
	smul	%l6,	%l4,	%g5
	xnor	%o7,	%l3,	%i0
	std	%f16,	[%l7 + 0x58]
	sir	0x16AE
	umul	%g6,	%l5,	%o1
	fandnot1s	%f13,	%f23,	%f29
	udivx	%o2,	0x1BB2,	%o6
	fmovsn	%xcc,	%f27,	%f10
	movge	%icc,	%g7,	%i1
	mulx	%g3,	0x19A1,	%g4
	ld	[%l7 + 0x40],	%f9
	edge32ln	%g1,	%o4,	%l2
	fmovscc	%xcc,	%f19,	%f9
	fmovdpos	%xcc,	%f11,	%f7
	fandnot1	%f14,	%f24,	%f8
	fxnors	%f30,	%f17,	%f21
	mulx	%o5,	%g2,	%l1
	nop
	set	0x0D, %g3
	ldsb	[%l7 + %g3],	%i6
	fcmple16	%f2,	%f24,	%o0
	movvs	%icc,	%i7,	%i5
	fcmpgt16	%f4,	%f8,	%i3
	stb	%i4,	[%l7 + 0x5F]
	edge32	%i2,	%l0,	%o3
	mulscc	%l4,	%l6,	%g5
	sdivx	%o7,	0x186F,	%i0
	movge	%icc,	%l3,	%l5
	movge	%xcc,	%g6,	%o1
	lduw	[%l7 + 0x7C],	%o6
	movle	%icc,	%o2,	%g7
	srl	%i1,	0x18,	%g4
	sub	%g1,	0x1B93,	%g3
	movre	%o4,	%o5,	%g2
	ldub	[%l7 + 0x71],	%l2
	udivcc	%l1,	0x0B2F,	%i6
	movneg	%xcc,	%o0,	%i7
	udivx	%i3,	0x0C5E,	%i5
	fcmpgt32	%f16,	%f8,	%i2
	movrlez	%l0,	%o3,	%l4
	fmovde	%icc,	%f7,	%f9
	srl	%l6,	%i4,	%o7
	udiv	%g5,	0x1994,	%i0
	ldsb	[%l7 + 0x19],	%l3
	ldsb	[%l7 + 0x24],	%l5
	movl	%xcc,	%g6,	%o6
	pdist	%f20,	%f24,	%f6
	popc	%o1,	%o2
	movcs	%icc,	%i1,	%g4
	edge32l	%g1,	%g7,	%o4
	edge8	%o5,	%g3,	%l2
	movne	%icc,	%g2,	%l1
	xnor	%i6,	0x0B9D,	%i7
	movrlz	%i3,	0x3E8,	%o0
	and	%i5,	%l0,	%o3
	movcc	%xcc,	%l4,	%i2
	xnor	%i4,	0x0203,	%l6
	movrlz	%o7,	0x1E5,	%i0
	movn	%xcc,	%l3,	%l5
	movle	%icc,	%g5,	%g6
	movcc	%icc,	%o6,	%o2
	save %i1, 0x0446, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x48],	%g1
	sdivx	%g4,	0x0721,	%g7
	fnot2s	%f28,	%f26
	sllx	%o4,	%g3,	%l2
	fcmple32	%f0,	%f4,	%o5
	movcs	%xcc,	%g2,	%l1
	sdivcc	%i7,	0x03E6,	%i3
	fmovsleu	%icc,	%f25,	%f18
	movge	%xcc,	%i6,	%o0
	movrgez	%i5,	0x392,	%o3
	fzeros	%f19
	edge16ln	%l4,	%i2,	%i4
	subccc	%l0,	%o7,	%l6
	sdiv	%l3,	0x14EE,	%i0
	ldx	[%l7 + 0x60],	%l5
	stb	%g5,	[%l7 + 0x39]
	edge8n	%o6,	%g6,	%i1
	movg	%xcc,	%o2,	%g1
	fxnor	%f30,	%f6,	%f26
	edge32ln	%g4,	%o1,	%o4
	ldd	[%l7 + 0x40],	%g2
	ldx	[%l7 + 0x38],	%l2
	udiv	%g7,	0x0369,	%g2
	alignaddr	%l1,	%o5,	%i3
	fmovspos	%icc,	%f14,	%f7
	subccc	%i6,	0x1EBF,	%i7
	movvs	%xcc,	%i5,	%o0
	xnor	%l4,	0x043E,	%o3
	mulx	%i2,	%l0,	%o7
	stb	%i4,	[%l7 + 0x44]
	movle	%xcc,	%l6,	%l3
	popc	%i0,	%g5
	umulcc	%l5,	%o6,	%g6
	movl	%icc,	%i1,	%o2
	movg	%xcc,	%g4,	%o1
	sllx	%o4,	%g1,	%g3
	popc	%g7,	%l2
	movneg	%icc,	%l1,	%o5
	sdivcc	%g2,	0x07A8,	%i3
	movle	%xcc,	%i6,	%i5
	ldd	[%l7 + 0x48],	%f24
	movg	%icc,	%i7,	%o0
	movrgez	%o3,	0x160,	%i2
	or	%l4,	%l0,	%i4
	udivx	%l6,	0x0A5C,	%l3
	movvc	%icc,	%o7,	%g5
	fmul8ulx16	%f12,	%f30,	%f12
	ldsw	[%l7 + 0x6C],	%l5
	and	%o6,	0x05AC,	%g6
	fmovdcs	%xcc,	%f0,	%f29
	fcmpne32	%f10,	%f4,	%i1
	edge16ln	%o2,	%i0,	%o1
	movneg	%xcc,	%o4,	%g1
	xorcc	%g4,	0x088A,	%g7
	fmul8x16au	%f29,	%f14,	%f16
	edge8l	%l2,	%g3,	%l1
	fmovsvs	%icc,	%f28,	%f23
	andcc	%g2,	%i3,	%i6
	mova	%icc,	%i5,	%i7
	ldsh	[%l7 + 0x3C],	%o0
	movvs	%icc,	%o5,	%o3
	lduh	[%l7 + 0x40],	%i2
	ldd	[%l7 + 0x08],	%f8
	fmovdleu	%icc,	%f24,	%f15
	ldub	[%l7 + 0x1B],	%l4
	fmovs	%f16,	%f18
	siam	0x7
	edge8ln	%i4,	%l6,	%l3
	mova	%icc,	%o7,	%g5
	fones	%f30
	movneg	%xcc,	%l5,	%o6
	sethi	0x1ED2,	%l0
	fxnors	%f10,	%f28,	%f15
	movrlz	%i1,	0x04F,	%g6
	edge8	%i0,	%o1,	%o2
	nop
	set	0x60, %l1
	stx	%o4,	[%l7 + %l1]
	xnorcc	%g4,	%g1,	%l2
	movrlz	%g3,	%g7,	%g2
	fnor	%f8,	%f30,	%f20
	orcc	%l1,	0x054E,	%i6
	edge32	%i3,	%i7,	%i5
	stb	%o5,	[%l7 + 0x7D]
	sth	%o0,	[%l7 + 0x28]
	ldsb	[%l7 + 0x52],	%o3
	fornot1s	%f8,	%f19,	%f0
	mova	%icc,	%i2,	%i4
	movn	%icc,	%l6,	%l4
	fmovde	%xcc,	%f18,	%f26
	fmovsge	%icc,	%f11,	%f1
	xnorcc	%l3,	%g5,	%l5
	sra	%o7,	%l0,	%i1
	stb	%g6,	[%l7 + 0x33]
	fmovdneg	%xcc,	%f24,	%f23
	alignaddrl	%i0,	%o6,	%o2
	umulcc	%o4,	%o1,	%g4
	fxor	%f12,	%f24,	%f6
	fmovdcc	%xcc,	%f28,	%f28
	nop
	set	0x78, %o0
	ldsb	[%l7 + %o0],	%l2
	fmovscs	%xcc,	%f22,	%f10
	subccc	%g3,	%g7,	%g1
	fzero	%f8
	subccc	%l1,	0x0B5F,	%i6
	fmovda	%icc,	%f25,	%f15
	edge8ln	%i3,	%g2,	%i7
	fmovsvc	%icc,	%f21,	%f4
	andcc	%o5,	0x1510,	%o0
	array32	%o3,	%i2,	%i4
	ldx	[%l7 + 0x58],	%l6
	orn	%l4,	0x0CBC,	%i5
	edge8ln	%g5,	%l3,	%l5
	fmul8ulx16	%f18,	%f24,	%f4
	movre	%o7,	%l0,	%i1
	srlx	%g6,	0x1A,	%i0
	faligndata	%f26,	%f18,	%f26
	movre	%o2,	0x281,	%o6
	ldsw	[%l7 + 0x44],	%o1
	addccc	%g4,	0x143C,	%o4
	fmovdn	%xcc,	%f29,	%f7
	fmovrdgz	%l2,	%f26,	%f28
	movvc	%xcc,	%g3,	%g1
	sdiv	%g7,	0x0706,	%l1
	fpadd32s	%f6,	%f28,	%f21
	movrgez	%i3,	0x189,	%g2
	andncc	%i6,	%i7,	%o0
	addc	%o5,	0x0F27,	%o3
	ldd	[%l7 + 0x20],	%f22
	ldx	[%l7 + 0x60],	%i2
	edge16	%l6,	%l4,	%i4
	move	%xcc,	%g5,	%i5
	sllx	%l3,	%o7,	%l0
	movrne	%i1,	%l5,	%i0
	xor	%o2,	0x16EC,	%g6
	movcs	%icc,	%o6,	%g4
	movrlz	%o4,	0x351,	%o1
	srax	%g3,	0x17,	%l2
	sth	%g7,	[%l7 + 0x74]
	ldsh	[%l7 + 0x18],	%l1
	fmovsleu	%xcc,	%f25,	%f15
	umul	%i3,	0x08A0,	%g1
	edge16	%g2,	%i6,	%i7
	fmovs	%f14,	%f29
	movrlez	%o0,	0x112,	%o3
	orn	%o5,	%l6,	%l4
	udivcc	%i2,	0x1704,	%g5
	lduh	[%l7 + 0x3A],	%i4
	edge32	%i5,	%l3,	%o7
	mulscc	%i1,	%l0,	%i0
	fmovdgu	%xcc,	%f14,	%f22
	alignaddrl	%o2,	%l5,	%g6
	fabsd	%f22,	%f18
	sethi	0x1CE1,	%o6
	ldd	[%l7 + 0x28],	%f28
	edge8n	%o4,	%g4,	%o1
	smulcc	%g3,	%g7,	%l2
	mova	%xcc,	%i3,	%g1
	fandnot1s	%f10,	%f20,	%f3
	edge8	%g2,	%l1,	%i7
	fornot1s	%f27,	%f18,	%f0
	movleu	%xcc,	%i6,	%o0
	fmovdneg	%xcc,	%f25,	%f18
	fmovsvc	%icc,	%f4,	%f3
	movgu	%icc,	%o3,	%l6
	smulcc	%o5,	%i2,	%l4
	fmovdvc	%icc,	%f9,	%f27
	edge32	%g5,	%i5,	%i4
	sdiv	%o7,	0x1C05,	%l3
	ldsw	[%l7 + 0x20],	%i1
	udivx	%i0,	0x179C,	%l0
	srlx	%l5,	%o2,	%o6
	movrgz	%g6,	0x11F,	%o4
	movgu	%xcc,	%o1,	%g4
	movge	%icc,	%g3,	%g7
	edge32	%l2,	%i3,	%g1
	fnot1s	%f23,	%f30
	stx	%l1,	[%l7 + 0x10]
	edge16n	%g2,	%i7,	%o0
	subc	%i6,	%l6,	%o5
	fmovrde	%i2,	%f30,	%f20
	edge32l	%l4,	%g5,	%o3
	movneg	%icc,	%i5,	%i4
	udivcc	%l3,	0x0451,	%i1
	sir	0x0959
	edge16n	%i0,	%l0,	%o7
	ldx	[%l7 + 0x10],	%o2
	fmovsvc	%xcc,	%f5,	%f29
	fpsub32s	%f15,	%f5,	%f7
	nop
	set	0x76, %i7
	ldsh	[%l7 + %i7],	%o6
	movpos	%xcc,	%l5,	%g6
	mulscc	%o1,	0x145F,	%o4
	fornot1s	%f17,	%f22,	%f24
	movleu	%xcc,	%g3,	%g7
	movneg	%xcc,	%g4,	%i3
	fmul8x16al	%f31,	%f17,	%f10
	fmovdneg	%icc,	%f23,	%f21
	xnor	%l2,	%l1,	%g1
	fmovdl	%icc,	%f27,	%f8
	fmovrslz	%g2,	%f13,	%f17
	movrne	%o0,	%i6,	%i7
	fmul8x16au	%f18,	%f14,	%f26
	movg	%xcc,	%o5,	%l6
	movcc	%xcc,	%i2,	%l4
	restore %o3, %i5, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i4,	%l3,	%i0
	fmovrdgez	%l0,	%f24,	%f2
	sir	0x11F7
	fmul8sux16	%f28,	%f0,	%f2
	lduw	[%l7 + 0x24],	%i1
	ldsb	[%l7 + 0x30],	%o2
	subc	%o6,	%o7,	%g6
	movcs	%icc,	%l5,	%o1
	edge8ln	%g3,	%o4,	%g7
	nop
	set	0x6A, %l6
	ldsh	[%l7 + %l6],	%g4
	edge32l	%i3,	%l2,	%g1
	andncc	%l1,	%g2,	%o0
	xnor	%i7,	0x14EE,	%o5
	movrgez	%l6,	%i6,	%l4
	lduh	[%l7 + 0x5A],	%o3
	ldsh	[%l7 + 0x46],	%i5
	xorcc	%i2,	0x1F28,	%g5
	edge32	%i4,	%l3,	%l0
	addccc	%i1,	0x0284,	%o2
	stx	%o6,	[%l7 + 0x38]
	udivcc	%i0,	0x0DEA,	%g6
	addccc	%o7,	0x1B67,	%o1
	fpadd32s	%f19,	%f26,	%f21
	movcs	%xcc,	%g3,	%o4
	fmovrsgez	%l5,	%f19,	%f17
	subcc	%g7,	%g4,	%i3
	sth	%l2,	[%l7 + 0x2A]
	sth	%l1,	[%l7 + 0x74]
	movle	%icc,	%g2,	%g1
	fxnors	%f14,	%f26,	%f21
	and	%i7,	0x1E6C,	%o0
	fmovrdgz	%o5,	%f14,	%f14
	edge16ln	%l6,	%l4,	%o3
	save %i6, 0x173C, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g5, 0x0641, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l3,	0x155,	%l0
	fnegd	%f6,	%f4
	srlx	%i2,	0x01,	%o2
	srl	%i1,	%o6,	%i0
	lduw	[%l7 + 0x30],	%g6
	xnorcc	%o1,	0x1BE9,	%g3
	ldsw	[%l7 + 0x74],	%o4
	movg	%icc,	%o7,	%l5
	xor	%g7,	0x0A03,	%g4
	edge8ln	%i3,	%l1,	%g2
	sth	%l2,	[%l7 + 0x7E]
	movrgez	%i7,	%o0,	%g1
	movrgez	%l6,	%o5,	%l4
	udivx	%i6,	0x1C8D,	%i5
	edge32ln	%o3,	%i4,	%l3
	edge8n	%g5,	%i2,	%l0
	nop
	set	0x68, %g2
	lduh	[%l7 + %g2],	%i1
	fcmpeq32	%f12,	%f8,	%o2
	movl	%xcc,	%o6,	%i0
	movcc	%icc,	%o1,	%g6
	subc	%o4,	%o7,	%l5
	edge8	%g3,	%g7,	%i3
	fnands	%f25,	%f18,	%f29
	umulcc	%g4,	%l1,	%g2
	edge8l	%i7,	%o0,	%g1
	udivcc	%l6,	0x194A,	%l2
	edge16	%l4,	%i6,	%o5
	mova	%icc,	%i5,	%i4
	ld	[%l7 + 0x68],	%f1
	movl	%icc,	%o3,	%g5
	andcc	%l3,	%l0,	%i1
	ldx	[%l7 + 0x10],	%i2
	umulcc	%o6,	0x0091,	%i0
	udiv	%o2,	0x1F88,	%o1
	movne	%xcc,	%o4,	%o7
	fcmpeq16	%f18,	%f28,	%g6
	movle	%xcc,	%l5,	%g7
	sllx	%g3,	%i3,	%g4
	addccc	%l1,	0x15E4,	%g2
	fmovdleu	%xcc,	%f12,	%f24
	umul	%i7,	%o0,	%l6
	orn	%l2,	0x1CB3,	%g1
	andn	%l4,	0x0467,	%o5
	or	%i6,	0x0D4A,	%i5
	movvs	%icc,	%i4,	%o3
	fmovsneg	%xcc,	%f13,	%f23
	fcmpgt16	%f16,	%f0,	%l3
	fmovscs	%icc,	%f9,	%f12
	sdivx	%l0,	0x0F1F,	%i1
	alignaddrl	%g5,	%i2,	%o6
	ldd	[%l7 + 0x10],	%f4
	andncc	%i0,	%o1,	%o4
	fcmpd	%fcc0,	%f22,	%f14
	movrne	%o2,	0x101,	%o7
	movrne	%l5,	0x039,	%g6
	popc	%g7,	%g3
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	stx	%i7,	[%l7 + 0x60]
	edge16n	%i3,	%l6,	%o0
	xor	%l2,	%g1,	%l4
	fandnot2s	%f14,	%f26,	%f9
	edge32ln	%i6,	%i5,	%o5
	fornot1s	%f3,	%f28,	%f1
	edge32	%o3,	%i4,	%l0
	fmul8x16	%f30,	%f18,	%f20
	array32	%i1,	%g5,	%l3
	udivx	%o6,	0x19B8,	%i0
	sllx	%i2,	%o1,	%o2
	movpos	%icc,	%o4,	%o7
	fpsub32s	%f30,	%f10,	%f18
	fmovsl	%icc,	%f31,	%f28
	fmovdneg	%xcc,	%f15,	%f27
	movge	%xcc,	%g6,	%l5
	sub	%g3,	0x043D,	%g7
	fmovs	%f29,	%f4
	fmovsl	%icc,	%f3,	%f4
	smul	%g4,	0x0966,	%g2
	edge8l	%i7,	%i3,	%l1
	movleu	%icc,	%o0,	%l2
	addcc	%l6,	0x040A,	%l4
	stb	%g1,	[%l7 + 0x47]
	udivx	%i5,	0x01E6,	%i6
	fsrc1s	%f17,	%f6
	andncc	%o5,	%o3,	%i4
	andn	%i1,	%l0,	%g5
	fornot1	%f26,	%f26,	%f22
	ldd	[%l7 + 0x20],	%o6
	movcs	%xcc,	%l3,	%i2
	edge32	%i0,	%o1,	%o4
	edge8ln	%o2,	%g6,	%o7
	addc	%l5,	%g7,	%g4
	ld	[%l7 + 0x44],	%f1
	andncc	%g2,	%i7,	%i3
	save %l1, %o0, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f6,	%f16
	alignaddrl	%l6,	%l4,	%g1
	mova	%xcc,	%i5,	%l2
	edge32l	%o5,	%o3,	%i4
	orncc	%i6,	%i1,	%l0
	ldsw	[%l7 + 0x24],	%g5
	movcs	%icc,	%l3,	%i2
	fmul8sux16	%f6,	%f14,	%f8
	sth	%i0,	[%l7 + 0x6E]
	fmovrslez	%o1,	%f3,	%f29
	bshuffle	%f2,	%f30,	%f28
	umulcc	%o6,	%o2,	%o4
	restore %g6, 0x0D19, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%g7,	%g4
	movleu	%icc,	%g2,	%l5
	xor	%i7,	0x12D6,	%l1
	fabss	%f11,	%f31
	alignaddr	%o0,	%g3,	%l6
	xnorcc	%i3,	%l4,	%g1
	fmovsn	%icc,	%f2,	%f29
	fmovrdlez	%l2,	%f12,	%f24
	fmovdl	%xcc,	%f0,	%f22
	xor	%i5,	%o5,	%o3
	sdivx	%i6,	0x163D,	%i1
	edge16n	%l0,	%i4,	%l3
	or	%i2,	%i0,	%g5
	sub	%o6,	0x0379,	%o2
	fandnot1	%f14,	%f22,	%f4
	move	%icc,	%o1,	%o4
	ldub	[%l7 + 0x24],	%o7
	movn	%xcc,	%g6,	%g7
	fnors	%f27,	%f21,	%f21
	array8	%g4,	%l5,	%g2
	popc	%i7,	%o0
	sethi	0x0ADE,	%g3
	orncc	%l6,	0x0292,	%i3
	mulscc	%l1,	0x1469,	%l4
	movrgez	%g1,	0x336,	%i5
	fandnot2s	%f12,	%f8,	%f19
	movre	%o5,	0x07B,	%o3
	sllx	%i6,	0x17,	%l2
	edge32l	%i1,	%l0,	%l3
	edge32ln	%i2,	%i0,	%i4
	fmovd	%f6,	%f12
	fmovsl	%xcc,	%f16,	%f11
	movg	%xcc,	%o6,	%g5
	fnands	%f13,	%f28,	%f7
	subcc	%o1,	0x015F,	%o4
	sllx	%o2,	0x0A,	%o7
	srlx	%g6,	%g4,	%g7
	edge32l	%l5,	%i7,	%o0
	movrne	%g2,	%g3,	%l6
	sra	%i3,	0x06,	%l4
	movg	%icc,	%l1,	%i5
	edge32l	%g1,	%o3,	%i6
	sir	0x1C1F
	movrgez	%l2,	0x398,	%o5
	smulcc	%i1,	0x0C1D,	%l0
	edge16	%i2,	%i0,	%l3
	fmovdge	%icc,	%f0,	%f21
	addccc	%i4,	%o6,	%o1
	array32	%o4,	%o2,	%g5
	sir	0x1D84
	array16	%o7,	%g6,	%g7
	orncc	%l5,	0x0CF5,	%i7
	stx	%o0,	[%l7 + 0x60]
	fmovsleu	%icc,	%f22,	%f12
	edge16	%g4,	%g3,	%l6
	subc	%i3,	%g2,	%l4
	fmovdneg	%icc,	%f27,	%f14
	subc	%l1,	0x1973,	%g1
	save %i5, 0x0B25, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o3,	0x0DD6,	%l2
	save %i1, %l0, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%i2,	%l3
	fmovsvc	%icc,	%f21,	%f31
	or	%i0,	0x0A15,	%o6
	ldsh	[%l7 + 0x3C],	%o1
	udiv	%i4,	0x1A44,	%o4
	fones	%f11
	movrgz	%g5,	0x1A1,	%o7
	mova	%icc,	%o2,	%g6
	add	%g7,	%i7,	%o0
	mulscc	%l5,	%g3,	%g4
	edge32n	%l6,	%g2,	%i3
	movn	%icc,	%l4,	%g1
	fmovda	%xcc,	%f1,	%f19
	addccc	%l1,	0x1C53,	%i5
	st	%f23,	[%l7 + 0x54]
	srl	%o3,	0x13,	%i6
	smul	%i1,	0x0C72,	%l0
	addcc	%o5,	%i2,	%l2
	fcmpgt32	%f10,	%f30,	%i0
	fmovrdne	%l3,	%f6,	%f30
	movrne	%o6,	%i4,	%o4
	ldd	[%l7 + 0x10],	%f8
	fmovdpos	%xcc,	%f12,	%f19
	ldsh	[%l7 + 0x78],	%g5
	for	%f4,	%f22,	%f30
	sethi	0x0245,	%o7
	array32	%o1,	%o2,	%g6
	siam	0x7
	ldsb	[%l7 + 0x58],	%i7
	addc	%o0,	0x03DA,	%g7
	ldsb	[%l7 + 0x29],	%g3
	ldsw	[%l7 + 0x20],	%l5
	udivx	%l6,	0x0B70,	%g4
	addc	%g2,	%l4,	%g1
	lduh	[%l7 + 0x18],	%l1
	andcc	%i3,	%i5,	%i6
	std	%f16,	[%l7 + 0x28]
	std	%f18,	[%l7 + 0x20]
	fmovdn	%xcc,	%f15,	%f11
	edge32ln	%i1,	%o3,	%l0
	sir	0x1284
	mulscc	%o5,	%i2,	%i0
	sth	%l2,	[%l7 + 0x76]
	std	%f8,	[%l7 + 0x68]
	ld	[%l7 + 0x14],	%f8
	fmovscs	%icc,	%f18,	%f29
	add	%o6,	0x01DB,	%l3
	addccc	%o4,	%i4,	%o7
	xnorcc	%g5,	%o2,	%o1
	fnegd	%f18,	%f20
	movcs	%xcc,	%i7,	%o0
	movl	%xcc,	%g7,	%g6
	fzeros	%f18
	addccc	%l5,	%g3,	%l6
	movg	%xcc,	%g2,	%g4
	mulx	%l4,	0x1E04,	%g1
	edge32	%i3,	%l1,	%i5
	fmovse	%xcc,	%f10,	%f7
	fmovdl	%xcc,	%f12,	%f26
	movvs	%xcc,	%i6,	%o3
	sra	%l0,	0x13,	%o5
	sir	0x07D9
	ldsh	[%l7 + 0x4C],	%i1
	add	%i0,	0x04C5,	%i2
	fcmpgt32	%f12,	%f20,	%l2
	fpadd16	%f16,	%f6,	%f14
	edge8n	%l3,	%o6,	%o4
	movleu	%icc,	%i4,	%g5
	udivcc	%o7,	0x0545,	%o2
	sll	%i7,	0x06,	%o0
	sub	%o1,	%g7,	%g6
	ldd	[%l7 + 0x48],	%f20
	edge16	%l5,	%g3,	%l6
	fpackfix	%f20,	%f3
	xnor	%g2,	%g4,	%g1
	add	%l4,	0x1861,	%l1
	andncc	%i5,	%i6,	%i3
	movne	%xcc,	%l0,	%o3
	ld	[%l7 + 0x64],	%f8
	sir	0x0AEC
	fmovsl	%xcc,	%f27,	%f1
	udivcc	%o5,	0x1E6B,	%i0
	ld	[%l7 + 0x10],	%f16
	edge16	%i2,	%l2,	%l3
	andcc	%i1,	0x08F4,	%o4
	movgu	%xcc,	%i4,	%o6
	fnot1	%f22,	%f10
	ld	[%l7 + 0x10],	%f1
	xnor	%o7,	%g5,	%o2
	movcs	%icc,	%o0,	%o1
	movcs	%xcc,	%g7,	%g6
	st	%f21,	[%l7 + 0x0C]
	mulscc	%l5,	0x0088,	%i7
	fpsub32	%f18,	%f22,	%f4
	umulcc	%l6,	%g2,	%g3
	movvc	%icc,	%g1,	%l4
	edge16	%g4,	%l1,	%i5
	and	%i6,	0x1ABD,	%l0
	alignaddrl	%o3,	%i3,	%o5
	fsrc1s	%f27,	%f5
	lduw	[%l7 + 0x24],	%i2
	movvc	%xcc,	%l2,	%l3
	fmovdpos	%icc,	%f19,	%f21
	ldd	[%l7 + 0x28],	%f8
	sdiv	%i1,	0x1780,	%i0
	ldd	[%l7 + 0x20],	%o4
	movcs	%icc,	%i4,	%o7
	fmovrsne	%g5,	%f2,	%f28
	edge32l	%o2,	%o0,	%o6
	andn	%g7,	%o1,	%l5
	xnor	%i7,	%g6,	%g2
	add	%l6,	%g1,	%l4
	mulx	%g3,	%l1,	%g4
	fpsub32s	%f10,	%f4,	%f17
	addc	%i6,	0x1EBF,	%i5
	movgu	%icc,	%l0,	%o3
	movrgz	%i3,	%o5,	%l2
	sllx	%l3,	%i2,	%i0
	and	%i1,	0x0069,	%i4
	movn	%xcc,	%o4,	%g5
	sub	%o7,	0x09F1,	%o2
	andn	%o0,	0x04F6,	%o6
	ldd	[%l7 + 0x28],	%f0
	edge32	%o1,	%l5,	%g7
	movneg	%icc,	%g6,	%g2
	srlx	%i7,	%g1,	%l4
	movcs	%icc,	%g3,	%l1
	mulscc	%l6,	0x111A,	%i6
	fmovrde	%i5,	%f2,	%f28
	subcc	%g4,	%o3,	%i3
	xorcc	%o5,	0x0243,	%l0
	edge8l	%l3,	%i2,	%l2
	fmovsleu	%icc,	%f24,	%f8
	std	%f26,	[%l7 + 0x48]
	movl	%xcc,	%i0,	%i4
	movrne	%i1,	0x3E3,	%g5
	mulx	%o7,	%o4,	%o2
	mova	%icc,	%o6,	%o0
	movrgz	%o1,	0x13F,	%l5
	movre	%g6,	%g7,	%i7
	udivx	%g2,	0x0B63,	%l4
	xnor	%g3,	0x0C53,	%g1
	fmovdvc	%xcc,	%f7,	%f21
	edge8	%l6,	%l1,	%i5
	xor	%i6,	0x14BB,	%o3
	save %g4, %o5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l0,	%l3,	%l2
	array16	%i0,	%i4,	%i2
	movpos	%icc,	%g5,	%i1
	save %o7, %o4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o0,	0x0862,	%o1
	movneg	%icc,	%l5,	%o6
	ldsh	[%l7 + 0x48],	%g6
	sth	%g7,	[%l7 + 0x26]
	sdiv	%i7,	0x051A,	%l4
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	sra	%g2,	%l1,	%i5
	fmovsneg	%icc,	%f25,	%f0
	subcc	%o3,	%g4,	%i6
	xor	%i3,	%o5,	%l3
	edge8l	%l0,	%l2,	%i4
	movneg	%xcc,	%i2,	%i0
	udivx	%i1,	0x1CA9,	%o7
	edge32n	%g5,	%o2,	%o4
	ldd	[%l7 + 0x50],	%o0
	edge32n	%o0,	%l5,	%o6
	smul	%g7,	%i7,	%l4
	fmovrsne	%g3,	%f19,	%f14
	edge8l	%g1,	%l6,	%g2
	umul	%l1,	%i5,	%g6
	fxnor	%f14,	%f12,	%f18
	movleu	%xcc,	%g4,	%o3
	movleu	%xcc,	%i3,	%o5
	sub	%i6,	%l3,	%l2
	edge32	%i4,	%i2,	%i0
	lduw	[%l7 + 0x48],	%l0
	fmovsvc	%xcc,	%f30,	%f9
	edge8	%i1,	%g5,	%o2
	edge16	%o4,	%o7,	%o1
	fmovrse	%l5,	%f13,	%f19
	fnegs	%f4,	%f21
	stb	%o6,	[%l7 + 0x2C]
	sir	0x1302
	fmovsvc	%icc,	%f12,	%f1
	save %o0, %i7, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g7,	%g1,	%g3
	st	%f3,	[%l7 + 0x78]
	xnor	%g2,	0x03FA,	%l1
	subcc	%i5,	%g6,	%g4
	subcc	%l6,	%i3,	%o5
	array8	%i6,	%l3,	%l2
	sll	%o3,	%i2,	%i4
	movne	%xcc,	%i0,	%l0
	ldsb	[%l7 + 0x0C],	%g5
	fsrc1s	%f14,	%f22
	fpack16	%f24,	%f28
	sth	%o2,	[%l7 + 0x76]
	subccc	%i1,	0x1870,	%o7
	smulcc	%o1,	%o4,	%o6
	srax	%l5,	0x0E,	%i7
	ldsb	[%l7 + 0x6C],	%o0
	xor	%g7,	0x1CDB,	%g1
	edge16ln	%g3,	%l4,	%g2
	movcc	%xcc,	%i5,	%g6
	edge16ln	%g4,	%l1,	%i3
	ldub	[%l7 + 0x57],	%o5
	move	%xcc,	%i6,	%l3
	std	%f10,	[%l7 + 0x20]
	sllx	%l2,	%l6,	%i2
	mulx	%i4,	0x1972,	%o3
	nop
	set	0x30, %l3
	lduh	[%l7 + %l3],	%i0
	xnorcc	%l0,	0x0793,	%o2
	andncc	%i1,	%g5,	%o1
	umul	%o7,	0x148D,	%o4
	movleu	%icc,	%l5,	%i7
	edge32ln	%o6,	%o0,	%g1
	fors	%f8,	%f2,	%f4
	move	%xcc,	%g7,	%g3
	smul	%l4,	%g2,	%g6
	fcmpgt32	%f28,	%f8,	%g4
	ld	[%l7 + 0x3C],	%f24
	mova	%xcc,	%i5,	%l1
	fmovs	%f13,	%f17
	sub	%o5,	%i3,	%i6
	fnot1s	%f18,	%f14
	addccc	%l2,	0x1C99,	%l3
	andncc	%l6,	%i2,	%i4
	fand	%f26,	%f30,	%f26
	xor	%o3,	%i0,	%l0
	fmovdle	%xcc,	%f22,	%f21
	srl	%i1,	0x08,	%o2
	movrgez	%o1,	%o7,	%g5
	xnorcc	%l5,	0x0B6F,	%o4
	move	%xcc,	%o6,	%o0
	fandnot2s	%f23,	%f5,	%f26
	fcmple32	%f2,	%f26,	%i7
	andn	%g7,	0x1D0D,	%g1
	andcc	%g3,	0x0C42,	%l4
	edge16n	%g6,	%g4,	%g2
	edge16l	%i5,	%o5,	%l1
	ldd	[%l7 + 0x50],	%f10
	edge8l	%i3,	%l2,	%l3
	andcc	%i6,	0x096C,	%i2
	subcc	%i4,	0x1467,	%o3
	nop
	set	0x0C, %i0
	ldsh	[%l7 + %i0],	%l6
	fnors	%f8,	%f24,	%f17
	fmovscs	%xcc,	%f15,	%f13
	edge32n	%l0,	%i0,	%i1
	orncc	%o1,	%o2,	%g5
	and	%l5,	0x0BBE,	%o4
	movne	%xcc,	%o6,	%o7
	ldd	[%l7 + 0x20],	%f8
	movne	%xcc,	%i7,	%g7
	andcc	%g1,	0x0531,	%o0
	ld	[%l7 + 0x6C],	%f26
	sll	%g3,	0x16,	%g6
	fmovdneg	%xcc,	%f26,	%f7
	ldub	[%l7 + 0x49],	%l4
	orn	%g4,	0x0A50,	%i5
	edge32l	%g2,	%l1,	%o5
	addcc	%l2,	0x04AC,	%l3
	orn	%i3,	%i6,	%i2
	ldx	[%l7 + 0x28],	%i4
	ldsh	[%l7 + 0x2A],	%o3
	mulscc	%l6,	0x1C5F,	%l0
	orcc	%i0,	%o1,	%o2
	andncc	%g5,	%i1,	%o4
	fzeros	%f13
	fmovde	%xcc,	%f12,	%f13
	movrlez	%l5,	%o6,	%o7
	fcmpgt32	%f8,	%f8,	%i7
	nop
	set	0x6C, %i6
	lduw	[%l7 + %i6],	%g1
	mulx	%o0,	0x0D1F,	%g3
	restore %g6, 0x081D, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%l4,	%i5
	stx	%g4,	[%l7 + 0x48]
	subcc	%g2,	0x14C2,	%l1
	orn	%o5,	%l3,	%l2
	udivx	%i3,	0x1D64,	%i2
	stx	%i4,	[%l7 + 0x48]
	movg	%icc,	%i6,	%o3
	movneg	%icc,	%l6,	%i0
	ld	[%l7 + 0x24],	%f9
	edge32l	%o1,	%o2,	%l0
	mova	%icc,	%i1,	%o4
	stx	%l5,	[%l7 + 0x78]
	movn	%icc,	%g5,	%o7
	fmovsleu	%xcc,	%f16,	%f22
	movrgz	%o6,	0x183,	%g1
	orn	%o0,	0x02EC,	%i7
	xnorcc	%g3,	0x07DC,	%g7
	fone	%f30
	fmovsvc	%icc,	%f29,	%f12
	fcmpne32	%f26,	%f28,	%l4
	movcc	%icc,	%g6,	%g4
	fpack32	%f16,	%f6,	%f0
	ldd	[%l7 + 0x28],	%g2
	ldd	[%l7 + 0x38],	%l0
	fpsub16	%f24,	%f16,	%f12
	fand	%f16,	%f18,	%f22
	edge32l	%o5,	%l3,	%i5
	fnot2	%f0,	%f18
	subc	%l2,	0x003F,	%i2
	or	%i4,	%i3,	%o3
	fmovdcc	%xcc,	%f13,	%f12
	andn	%i6,	0x1A9A,	%i0
	stw	%l6,	[%l7 + 0x40]
	fmovdg	%xcc,	%f23,	%f5
	array32	%o1,	%o2,	%i1
	sth	%l0,	[%l7 + 0x1E]
	subc	%l5,	0x0322,	%o4
	fmovdcc	%icc,	%f11,	%f27
	edge8ln	%o7,	%o6,	%g1
	fandnot2	%f8,	%f0,	%f10
	fmovdcs	%xcc,	%f13,	%f12
	movrlz	%g5,	0x206,	%i7
	fpadd32	%f24,	%f12,	%f14
	movg	%xcc,	%g3,	%o0
	umulcc	%l4,	0x1146,	%g6
	std	%f0,	[%l7 + 0x40]
	edge8l	%g7,	%g4,	%l1
	edge8	%g2,	%l3,	%o5
	smul	%l2,	%i5,	%i4
	fcmpne16	%f20,	%f2,	%i3
	fnot1	%f14,	%f20
	movn	%icc,	%o3,	%i6
	sir	0x06CD
	xorcc	%i2,	%i0,	%l6
	movrlez	%o1,	0x382,	%i1
	ldub	[%l7 + 0x12],	%o2
	movgu	%icc,	%l0,	%l5
	fmovrde	%o4,	%f12,	%f20
	mulx	%o7,	%g1,	%g5
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%i7
	movvc	%icc,	%o6,	%o0
	movvs	%xcc,	%g3,	%g6
	ldd	[%l7 + 0x08],	%g6
	edge32ln	%g4,	%l1,	%g2
	edge16n	%l3,	%o5,	%l2
	movvc	%xcc,	%i5,	%i4
	edge32	%i3,	%o3,	%i6
	fmovdne	%xcc,	%f25,	%f19
	movcs	%icc,	%i2,	%i0
	fmuld8ulx16	%f30,	%f6,	%f12
	or	%l4,	0x05D6,	%o1
	movg	%xcc,	%l6,	%o2
	mova	%xcc,	%i1,	%l0
	or	%o4,	0x0385,	%o7
	udivx	%l5,	0x16FD,	%g1
	xnorcc	%i7,	%o6,	%o0
	movcs	%icc,	%g5,	%g3
	sllx	%g7,	%g4,	%l1
	lduh	[%l7 + 0x6C],	%g6
	popc	0x17BC,	%g2
	addc	%l3,	0x0495,	%l2
	sub	%o5,	0x10BD,	%i5
	movrne	%i4,	%i3,	%o3
	addccc	%i2,	0x092F,	%i0
	fmovsn	%icc,	%f8,	%f31
	st	%f3,	[%l7 + 0x28]
	edge16l	%i6,	%o1,	%l4
	orcc	%l6,	%o2,	%l0
	udivx	%o4,	0x062B,	%i1
	stb	%o7,	[%l7 + 0x44]
	fmovsl	%icc,	%f1,	%f9
	smulcc	%g1,	0x11DB,	%l5
	fzero	%f6
	udiv	%o6,	0x0DF3,	%i7
	sdivcc	%o0,	0x0813,	%g5
	xorcc	%g3,	%g7,	%g4
	movrgez	%g6,	0x328,	%l1
	sth	%g2,	[%l7 + 0x5E]
	fors	%f29,	%f28,	%f28
	xnor	%l3,	%l2,	%o5
	array8	%i4,	%i5,	%o3
	fmovsneg	%icc,	%f4,	%f13
	mulscc	%i3,	%i2,	%i0
	move	%icc,	%i6,	%o1
	subc	%l6,	%o2,	%l4
	alignaddr	%l0,	%o4,	%i1
	sllx	%g1,	%o7,	%l5
	movcc	%xcc,	%i7,	%o6
	subcc	%o0,	%g5,	%g3
	mulscc	%g7,	%g6,	%g4
	ldub	[%l7 + 0x2E],	%g2
	move	%icc,	%l3,	%l2
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	andncc	%i5,	%o3,	%l1
	and	%i2,	%i3,	%i0
	movleu	%xcc,	%i6,	%o1
	std	%f28,	[%l7 + 0x48]
	sllx	%l6,	0x01,	%o2
	array8	%l4,	%o4,	%l0
	ld	[%l7 + 0x64],	%f9
	movle	%icc,	%g1,	%i1
	fzeros	%f16
	sdiv	%l5,	0x0DC0,	%i7
	fmovsle	%icc,	%f11,	%f26
	movge	%xcc,	%o7,	%o6
	sub	%o0,	0x1094,	%g5
	fpadd32	%f26,	%f14,	%f28
	ldsh	[%l7 + 0x3C],	%g7
	fpackfix	%f16,	%f6
	movcs	%xcc,	%g6,	%g3
	edge8	%g4,	%g2,	%l2
	movleu	%xcc,	%o5,	%i4
	fnands	%f29,	%f21,	%f0
	stb	%i5,	[%l7 + 0x5F]
	sdiv	%o3,	0x0A5D,	%l3
	fmovrdgz	%i2,	%f2,	%f30
	stx	%i3,	[%l7 + 0x60]
	fcmpd	%fcc2,	%f10,	%f14
	array8	%l1,	%i0,	%o1
	fmul8sux16	%f24,	%f26,	%f2
	fpackfix	%f16,	%f11
	udivcc	%l6,	0x1E7E,	%o2
	edge8l	%l4,	%o4,	%i6
	fxors	%f1,	%f16,	%f31
	move	%xcc,	%g1,	%i1
	movcs	%xcc,	%l5,	%i7
	sra	%o7,	0x18,	%l0
	edge8n	%o6,	%g5,	%g7
	bshuffle	%f18,	%f24,	%f20
	fmovdleu	%xcc,	%f0,	%f26
	fandnot2s	%f29,	%f28,	%f27
	movvs	%xcc,	%g6,	%o0
	sdivcc	%g4,	0x0C6F,	%g3
	sdiv	%l2,	0x1227,	%o5
	fsrc1s	%f21,	%f15
	nop
	set	0x20, %o2
	sth	%g2,	[%l7 + %o2]
	movrne	%i5,	0x201,	%o3
	movrlez	%l3,	%i4,	%i3
	addc	%l1,	%i2,	%i0
	movn	%icc,	%o1,	%o2
	fmovsg	%xcc,	%f7,	%f20
	addcc	%l4,	%l6,	%o4
	std	%f4,	[%l7 + 0x50]
	umulcc	%g1,	%i6,	%l5
	smulcc	%i1,	0x0655,	%i7
	movre	%o7,	%o6,	%l0
	edge16ln	%g7,	%g6,	%g5
	movrgez	%o0,	0x3B0,	%g4
	fand	%f2,	%f2,	%f6
	addccc	%l2,	0x1F9E,	%o5
	fmovdleu	%xcc,	%f26,	%f11
	edge8n	%g3,	%g2,	%i5
	edge8n	%l3,	%i4,	%o3
	movl	%xcc,	%i3,	%l1
	fsrc1s	%f31,	%f28
	umul	%i0,	%o1,	%o2
	array16	%l4,	%i2,	%l6
	fone	%f30
	sra	%g1,	0x0A,	%i6
	movn	%xcc,	%l5,	%o4
	and	%i7,	%o7,	%i1
	edge16	%l0,	%o6,	%g6
	mulx	%g7,	0x170F,	%o0
	alignaddrl	%g5,	%g4,	%l2
	xor	%g3,	%o5,	%i5
	umulcc	%g2,	0x1D97,	%l3
	srl	%i4,	%o3,	%l1
	ldub	[%l7 + 0x0F],	%i3
	fmovdle	%xcc,	%f11,	%f30
	sdivcc	%o1,	0x1A55,	%i0
	andn	%o2,	0x1AA4,	%l4
	sub	%i2,	%l6,	%i6
	ld	[%l7 + 0x6C],	%f11
	movleu	%icc,	%l5,	%o4
	fmuld8sux16	%f14,	%f25,	%f24
	edge16	%i7,	%o7,	%i1
	edge32ln	%g1,	%l0,	%o6
	andn	%g7,	%g6,	%g5
	udiv	%o0,	0x1A05,	%g4
	movre	%g3,	0x0E0,	%l2
	sethi	0x04ED,	%o5
	movcs	%icc,	%i5,	%l3
	subccc	%g2,	0x186D,	%o3
	std	%f4,	[%l7 + 0x08]
	xnor	%l1,	0x1AB3,	%i4
	fpadd32s	%f26,	%f7,	%f3
	addcc	%i3,	0x0F8D,	%o1
	sdivx	%i0,	0x1328,	%l4
	edge8	%o2,	%l6,	%i2
	edge16n	%l5,	%o4,	%i7
	addccc	%o7,	0x0B13,	%i6
	fmovdvs	%icc,	%f29,	%f11
	save %g1, 0x161E, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l0,	0x15A7,	%g7
	andcc	%o6,	%g6,	%g5
	edge32n	%g4,	%g3,	%l2
	ldsb	[%l7 + 0x19],	%o0
	fexpand	%f10,	%f2
	mulx	%i5,	0x069B,	%o5
	movn	%xcc,	%l3,	%o3
	movrgez	%l1,	%i4,	%i3
	movge	%xcc,	%g2,	%i0
	stb	%o1,	[%l7 + 0x29]
	movrne	%o2,	%l6,	%l4
	srax	%l5,	0x05,	%i2
	fmovspos	%icc,	%f0,	%f7
	edge16ln	%i7,	%o4,	%i6
	movre	%o7,	%g1,	%i1
	sllx	%g7,	0x15,	%o6
	subc	%g6,	%g5,	%l0
	xnorcc	%g4,	0x15A8,	%g3
	udivx	%l2,	0x0C1B,	%o0
	movrgz	%i5,	%o5,	%o3
	edge16ln	%l1,	%i4,	%i3
	fmovrsne	%l3,	%f12,	%f10
	move	%icc,	%g2,	%o1
	faligndata	%f18,	%f28,	%f24
	edge32l	%o2,	%l6,	%l4
	ld	[%l7 + 0x70],	%f7
	udivx	%i0,	0x136D,	%i2
	st	%f9,	[%l7 + 0x14]
	movle	%icc,	%i7,	%o4
	fone	%f18
	array32	%l5,	%i6,	%o7
	xnorcc	%i1,	%g7,	%g1
	umul	%o6,	0x196F,	%g6
	udiv	%g5,	0x14DB,	%l0
	stw	%g3,	[%l7 + 0x50]
	ldsh	[%l7 + 0x4A],	%g4
	nop
	set	0x24, %i5
	stw	%o0,	[%l7 + %i5]
	movvc	%icc,	%l2,	%o5
	movrlz	%o3,	%l1,	%i4
	fmovrdgz	%i5,	%f24,	%f12
	subcc	%i3,	0x00C5,	%l3
	fmovrslez	%g2,	%f3,	%f3
	andn	%o2,	%l6,	%l4
	fsrc1s	%f16,	%f11
	sll	%i0,	%i2,	%o1
	fone	%f12
	ldub	[%l7 + 0x40],	%o4
	bshuffle	%f12,	%f14,	%f0
	edge8n	%l5,	%i6,	%i7
	srlx	%o7,	0x12,	%i1
	fmovsl	%xcc,	%f6,	%f8
	fnot1s	%f30,	%f14
	mulscc	%g1,	%o6,	%g7
	stw	%g6,	[%l7 + 0x7C]
	restore %l0, 0x194D, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g3,	%g4,	%o0
	fmovdgu	%icc,	%f19,	%f13
	orcc	%l2,	%o3,	%o5
	fmovrde	%i4,	%f26,	%f12
	sdivcc	%i5,	0x0E36,	%i3
	fpack32	%f12,	%f24,	%f20
	fmuld8ulx16	%f12,	%f31,	%f8
	fmovdleu	%xcc,	%f0,	%f24
	addcc	%l3,	0x1594,	%l1
	sdiv	%o2,	0x137D,	%g2
	stx	%l6,	[%l7 + 0x10]
	xorcc	%l4,	%i2,	%o1
	edge8n	%o4,	%l5,	%i0
	fmul8x16au	%f2,	%f7,	%f6
	ldsb	[%l7 + 0x47],	%i7
	srax	%i6,	0x09,	%i1
	sra	%g1,	0x12,	%o7
	ldsw	[%l7 + 0x64],	%o6
	movle	%icc,	%g7,	%l0
	xnor	%g6,	%g5,	%g3
	edge8ln	%o0,	%g4,	%l2
	movne	%icc,	%o3,	%o5
	fmovsleu	%xcc,	%f19,	%f27
	array16	%i4,	%i5,	%i3
	fmul8x16	%f3,	%f12,	%f28
	fcmpgt16	%f24,	%f22,	%l1
	edge8n	%l3,	%g2,	%l6
	movgu	%xcc,	%l4,	%i2
	sdiv	%o2,	0x1C9E,	%o4
	addc	%o1,	0x1DB7,	%i0
	lduh	[%l7 + 0x6A],	%l5
	stx	%i7,	[%l7 + 0x08]
	movleu	%icc,	%i6,	%i1
	edge8ln	%g1,	%o6,	%g7
	edge8n	%o7,	%l0,	%g6
	sll	%g5,	%o0,	%g3
	mova	%xcc,	%l2,	%o3
	ldsb	[%l7 + 0x3E],	%o5
	fmovd	%f2,	%f6
	subcc	%g4,	0x12A3,	%i4
	orncc	%i5,	0x1CCC,	%l1
	movrgz	%l3,	%g2,	%l6
	array16	%i3,	%i2,	%o2
	fands	%f17,	%f18,	%f8
	fxor	%f4,	%f24,	%f10
	ld	[%l7 + 0x14],	%f4
	lduh	[%l7 + 0x34],	%o4
	fmovrdgez	%l4,	%f22,	%f2
	movl	%xcc,	%o1,	%l5
	alignaddrl	%i0,	%i6,	%i7
	movne	%icc,	%g1,	%o6
	edge16l	%i1,	%o7,	%g7
	movl	%xcc,	%l0,	%g5
	ldub	[%l7 + 0x28],	%g6
	sllx	%g3,	0x13,	%l2
	fmovsge	%icc,	%f22,	%f16
	move	%xcc,	%o0,	%o5
	save %o3, %g4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f24,	%f24,	%f28
	movneg	%icc,	%i5,	%l3
	nop
	set	0x7D, %g6
	stb	%g2,	[%l7 + %g6]
	andncc	%l1,	%i3,	%i2
	edge8l	%l6,	%o2,	%o4
	andn	%o1,	0x0595,	%l5
	addcc	%l4,	0x09A6,	%i0
	edge8l	%i7,	%g1,	%o6
	ld	[%l7 + 0x3C],	%f29
	movn	%xcc,	%i1,	%o7
	stb	%i6,	[%l7 + 0x24]
	andcc	%l0,	0x0C2D,	%g5
	smulcc	%g7,	%g6,	%l2
	fmovdg	%xcc,	%f17,	%f2
	ldd	[%l7 + 0x10],	%o0
	and	%g3,	0x14F0,	%o5
	sethi	0x145E,	%o3
	fmovspos	%xcc,	%f28,	%f1
	movrgz	%i4,	%g4,	%i5
	ldsb	[%l7 + 0x29],	%l3
	sdivcc	%l1,	0x1183,	%i3
	fnors	%f16,	%f6,	%f21
	orcc	%i2,	0x0473,	%l6
	fmovspos	%xcc,	%f31,	%f9
	and	%g2,	0x0A94,	%o2
	fcmps	%fcc0,	%f1,	%f3
	ldsw	[%l7 + 0x40],	%o4
	udivx	%o1,	0x0063,	%l5
	edge16ln	%i0,	%l4,	%g1
	addccc	%i7,	%i1,	%o7
	sdivcc	%i6,	0x0585,	%o6
	ldsw	[%l7 + 0x08],	%g5
	edge8n	%g7,	%l0,	%g6
	movle	%icc,	%l2,	%g3
	movvs	%icc,	%o0,	%o5
	xorcc	%o3,	0x11E8,	%g4
	alignaddrl	%i5,	%i4,	%l1
	fcmpd	%fcc0,	%f24,	%f20
	xor	%l3,	0x1FFD,	%i3
	edge16n	%i2,	%g2,	%o2
	fmovrde	%o4,	%f14,	%f2
	movcs	%icc,	%o1,	%l6
	fandnot1	%f12,	%f28,	%f4
	std	%f18,	[%l7 + 0x50]
	addccc	%i0,	%l5,	%g1
	ldd	[%l7 + 0x40],	%f14
	mulscc	%l4,	%i1,	%o7
	movrgz	%i7,	%i6,	%g5
	umul	%g7,	0x0868,	%o6
	orncc	%l0,	%g6,	%g3
	alignaddrl	%l2,	%o0,	%o3
	udivx	%o5,	0x0656,	%i5
	umul	%i4,	0x1BD6,	%l1
	ldx	[%l7 + 0x70],	%l3
	fand	%f6,	%f8,	%f10
	fmul8x16au	%f4,	%f26,	%f28
	addcc	%i3,	0x0E5E,	%i2
	ldd	[%l7 + 0x28],	%g4
	array32	%g2,	%o4,	%o2
	udivx	%l6,	0x01F8,	%i0
	fsrc1s	%f15,	%f5
	movge	%icc,	%l5,	%o1
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	mulx	%l4,	0x0AC0,	%i7
	movg	%xcc,	%i6,	%g7
	xnorcc	%o6,	%g5,	%l0
	movle	%icc,	%g6,	%l2
	andcc	%o0,	0x1923,	%g3
	ldd	[%l7 + 0x60],	%o2
	srl	%i5,	%o5,	%l1
	stb	%l3,	[%l7 + 0x20]
	sethi	0x0D94,	%i3
	sra	%i4,	0x1E,	%g4
	movrlez	%i2,	0x014,	%g2
	fmovrse	%o2,	%f16,	%f31
	mulscc	%o4,	%i0,	%l5
	xor	%l6,	0x1D8E,	%o1
	array16	%i1,	%g1,	%l4
	fmovrde	%i7,	%f30,	%f2
	edge8	%o7,	%g7,	%i6
	sth	%g5,	[%l7 + 0x60]
	xorcc	%o6,	0x0793,	%g6
	for	%f14,	%f30,	%f8
	st	%f12,	[%l7 + 0x24]
	fmovdgu	%icc,	%f5,	%f25
	alignaddr	%l0,	%o0,	%l2
	fmovrsgez	%o3,	%f8,	%f5
	umul	%i5,	%g3,	%o5
	srl	%l1,	0x0E,	%i3
	ld	[%l7 + 0x14],	%f29
	st	%f2,	[%l7 + 0x14]
	fcmple32	%f4,	%f28,	%i4
	stx	%g4,	[%l7 + 0x08]
	movrgez	%i2,	%l3,	%g2
	lduw	[%l7 + 0x34],	%o4
	movpos	%xcc,	%i0,	%o2
	orn	%l5,	%o1,	%l6
	fcmpeq16	%f4,	%f30,	%i1
	fmovrsgz	%g1,	%f21,	%f15
	edge16	%l4,	%o7,	%g7
	mova	%xcc,	%i6,	%g5
	ldsh	[%l7 + 0x1E],	%o6
	andn	%i7,	0x06B4,	%g6
	sth	%l0,	[%l7 + 0x56]
	ldsw	[%l7 + 0x10],	%o0
	edge8	%o3,	%l2,	%g3
	movgu	%icc,	%o5,	%l1
	udivx	%i5,	0x1557,	%i3
	movrgez	%g4,	0x2B2,	%i4
	orncc	%i2,	0x18A6,	%l3
	orn	%g2,	0x115D,	%i0
	udivx	%o4,	0x062D,	%l5
	fxors	%f20,	%f4,	%f14
	sra	%o1,	0x13,	%l6
	smul	%o2,	%i1,	%g1
	orn	%o7,	%g7,	%i6
	ldd	[%l7 + 0x10],	%f12
	fnot2	%f28,	%f30
	mulscc	%l4,	%o6,	%g5
	xnorcc	%i7,	%l0,	%o0
	fzero	%f28
	edge32l	%o3,	%l2,	%g3
	sllx	%g6,	0x0C,	%l1
	fandnot2	%f22,	%f30,	%f30
	srlx	%o5,	%i3,	%g4
	nop
	set	0x16, %l2
	ldsh	[%l7 + %l2],	%i5
	edge32	%i2,	%i4,	%l3
	umul	%g2,	0x0CD5,	%o4
	fpsub16	%f4,	%f4,	%f26
	umul	%l5,	%o1,	%i0
	move	%icc,	%o2,	%i1
	fpadd32	%f20,	%f14,	%f30
	std	%f4,	[%l7 + 0x18]
	alignaddr	%g1,	%o7,	%g7
	fsrc1	%f10,	%f28
	udivcc	%l6,	0x0DB3,	%l4
	xorcc	%i6,	%g5,	%i7
	and	%o6,	%l0,	%o0
	ldsb	[%l7 + 0x5B],	%l2
	movvs	%icc,	%o3,	%g3
	fpack32	%f20,	%f4,	%f30
	fnot2	%f24,	%f8
	movgu	%icc,	%l1,	%g6
	movne	%icc,	%i3,	%o5
	ldd	[%l7 + 0x30],	%i4
	sub	%i2,	%g4,	%i4
	addc	%l3,	%o4,	%l5
	andncc	%g2,	%i0,	%o2
	movrgez	%i1,	0x3DF,	%g1
	sir	0x0C59
	movrgz	%o7,	0x32B,	%o1
	movgu	%icc,	%l6,	%g7
	movn	%xcc,	%i6,	%l4
	ldsh	[%l7 + 0x50],	%g5
	movle	%xcc,	%o6,	%l0
	movpos	%icc,	%o0,	%i7
	movrlez	%l2,	%g3,	%o3
	andncc	%l1,	%i3,	%g6
	movgu	%icc,	%i5,	%o5
	ldsh	[%l7 + 0x1E],	%g4
	xnor	%i2,	%i4,	%l3
	fandnot1	%f10,	%f2,	%f14
	movcs	%icc,	%l5,	%g2
	andncc	%i0,	%o2,	%i1
	srlx	%g1,	%o7,	%o4
	ldub	[%l7 + 0x1D],	%o1
	edge16l	%g7,	%i6,	%l4
	fpadd16	%f18,	%f20,	%f12
	fpsub16s	%f5,	%f26,	%f29
	or	%l6,	%o6,	%l0
	fmovrdne	%g5,	%f4,	%f14
	fpadd16	%f12,	%f30,	%f10
	edge8	%i7,	%l2,	%g3
	movpos	%xcc,	%o0,	%o3
	sth	%l1,	[%l7 + 0x3A]
	andn	%g6,	0x15C6,	%i3
	fmovdn	%icc,	%f21,	%f21
	smul	%o5,	%i5,	%g4
	fornot2	%f6,	%f26,	%f0
	lduw	[%l7 + 0x34],	%i4
	edge16ln	%i2,	%l5,	%l3
	st	%f28,	[%l7 + 0x50]
	fxors	%f4,	%f16,	%f6
	edge32l	%i0,	%g2,	%i1
	sdiv	%o2,	0x16F4,	%o7
	smulcc	%g1,	0x1C94,	%o1
	fmovsleu	%xcc,	%f27,	%f3
	edge8	%g7,	%i6,	%o4
	movre	%l6,	%o6,	%l0
	srax	%l4,	0x1A,	%g5
	fmovdge	%xcc,	%f21,	%f19
	fcmpes	%fcc0,	%f25,	%f6
	fmul8x16al	%f19,	%f4,	%f12
	st	%f10,	[%l7 + 0x24]
	mulscc	%i7,	0x0837,	%l2
	udiv	%g3,	0x1188,	%o3
	orncc	%l1,	%g6,	%o0
	array16	%i3,	%i5,	%g4
	alignaddrl	%i4,	%o5,	%l5
	addccc	%i2,	0x01DF,	%i0
	fmovdl	%icc,	%f3,	%f7
	fmovs	%f9,	%f3
	edge16l	%g2,	%l3,	%i1
	sdivcc	%o7,	0x1DD0,	%o2
	udiv	%g1,	0x0E88,	%o1
	fmovsgu	%xcc,	%f6,	%f26
	st	%f17,	[%l7 + 0x34]
	save %g7, 0x0D7E, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%o4,	%f4,	%f28
	sdiv	%o6,	0x10C3,	%l6
	array32	%l4,	%g5,	%l0
	movrgez	%l2,	0x3F7,	%i7
	movrgz	%o3,	0x335,	%l1
	fmul8ulx16	%f14,	%f0,	%f2
	orcc	%g3,	%g6,	%o0
	ldsw	[%l7 + 0x48],	%i5
	fornot2s	%f12,	%f13,	%f12
	movne	%icc,	%g4,	%i4
	movvs	%icc,	%o5,	%i3
	edge8n	%l5,	%i0,	%i2
	movcs	%icc,	%g2,	%i1
	orncc	%l3,	0x07E2,	%o7
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%f12
	edge8l	%o2,	%g1,	%o1
	fcmpne32	%f20,	%f14,	%i6
	fandnot2s	%f9,	%f9,	%f5
	addccc	%o4,	%g7,	%l6
	st	%f24,	[%l7 + 0x18]
	sethi	0x0B7F,	%o6
	fsrc2s	%f22,	%f12
	srl	%l4,	%g5,	%l0
	movn	%icc,	%i7,	%l2
	ldsh	[%l7 + 0x40],	%l1
	addcc	%g3,	0x13BD,	%o3
	ldsh	[%l7 + 0x1C],	%o0
	array16	%i5,	%g6,	%g4
	movl	%icc,	%o5,	%i4
	ldd	[%l7 + 0x18],	%i2
	sir	0x08F1
	movrlz	%i0,	0x221,	%l5
	addcc	%g2,	0x0D75,	%i1
	addc	%i2,	0x04B9,	%l3
	stw	%o7,	[%l7 + 0x28]
	fmul8x16al	%f6,	%f24,	%f16
	fnot1	%f12,	%f4
	edge8ln	%o2,	%o1,	%i6
	edge16l	%g1,	%o4,	%l6
	movvc	%icc,	%g7,	%o6
	lduh	[%l7 + 0x32],	%g5
	edge32	%l0,	%i7,	%l2
	srl	%l4,	%g3,	%l1
	orcc	%o3,	%o0,	%g6
	fmul8x16al	%f0,	%f16,	%f0
	edge16n	%i5,	%o5,	%i4
	xnor	%g4,	%i3,	%l5
	fmovdle	%xcc,	%f3,	%f31
	subccc	%i0,	0x1BDB,	%g2
	sub	%i1,	0x140B,	%i2
	umulcc	%l3,	0x03D1,	%o2
	alignaddrl	%o1,	%i6,	%o7
	movrgz	%o4,	%g1,	%g7
	or	%l6,	%o6,	%l0
	std	%f8,	[%l7 + 0x08]
	ldd	[%l7 + 0x68],	%g4
	popc	0x1ABD,	%i7
	fabsd	%f4,	%f26
	fmovrsgz	%l2,	%f5,	%f23
	edge8	%l4,	%g3,	%o3
	umul	%l1,	0x01D6,	%o0
	or	%g6,	0x0C63,	%i5
	sdivx	%i4,	0x017A,	%g4
	fmovrse	%i3,	%f3,	%f13
	nop
	set	0x72, %g7
	sth	%l5,	[%l7 + %g7]
	fcmped	%fcc2,	%f24,	%f24
	fmovrsne	%i0,	%f2,	%f0
	array16	%g2,	%i1,	%i2
	movpos	%icc,	%l3,	%o2
	edge8l	%o1,	%i6,	%o5
	edge8ln	%o7,	%g1,	%o4
	movrlez	%g7,	%l6,	%o6
	fpsub16s	%f5,	%f27,	%f24
	fornot2	%f2,	%f20,	%f22
	movvc	%xcc,	%l0,	%i7
	fmovdn	%xcc,	%f5,	%f18
	movvs	%xcc,	%g5,	%l2
	ldsh	[%l7 + 0x10],	%g3
	fandnot1	%f28,	%f28,	%f0
	subcc	%o3,	0x015F,	%l4
	or	%o0,	%l1,	%g6
	edge32	%i5,	%g4,	%i4
	fxors	%f5,	%f16,	%f14
	alignaddr	%i3,	%l5,	%g2
	sth	%i0,	[%l7 + 0x2E]
	srlx	%i1,	0x11,	%l3
	srlx	%o2,	0x00,	%o1
	st	%f20,	[%l7 + 0x18]
	and	%i2,	0x145E,	%i6
	array8	%o5,	%o7,	%o4
	fexpand	%f3,	%f22
	orcc	%g7,	%g1,	%l6
	alignaddrl	%o6,	%l0,	%g5
	addccc	%l2,	%i7,	%g3
	fmovrdne	%o3,	%f30,	%f20
	addcc	%l4,	0x127C,	%l1
	movvs	%xcc,	%g6,	%i5
	sdiv	%g4,	0x0BA1,	%i4
	andncc	%o0,	%l5,	%i3
	fandnot1	%f12,	%f30,	%f14
	movg	%icc,	%i0,	%g2
	movrgz	%i1,	0x27E,	%l3
	fpack32	%f24,	%f20,	%f10
	alignaddrl	%o1,	%i2,	%o2
	orcc	%i6,	%o5,	%o7
	sir	0x05A8
	mulx	%g7,	0x182A,	%g1
	fnot2	%f30,	%f18
	sir	0x05FB
	movleu	%icc,	%l6,	%o4
	fxnors	%f26,	%f17,	%f29
	fmovsg	%icc,	%f16,	%f5
	fmovdneg	%xcc,	%f21,	%f11
	edge32l	%o6,	%g5,	%l0
	fmul8ulx16	%f14,	%f4,	%f8
	fzeros	%f6
	movle	%xcc,	%l2,	%g3
	fcmpgt16	%f28,	%f30,	%o3
	xnor	%i7,	0x063C,	%l1
	smul	%g6,	0x1769,	%i5
	mova	%xcc,	%g4,	%l4
	ldsw	[%l7 + 0x58],	%i4
	umulcc	%o0,	%l5,	%i0
	fmovsge	%icc,	%f18,	%f30
	fmovdvc	%xcc,	%f18,	%f21
	nop
	set	0x5A, %l4
	lduh	[%l7 + %l4],	%i3
	orcc	%i1,	0x0C2B,	%g2
	edge16	%o1,	%i2,	%l3
	stw	%i6,	[%l7 + 0x58]
	movrlz	%o2,	0x11E,	%o5
	movn	%xcc,	%o7,	%g1
	ldsw	[%l7 + 0x18],	%g7
	lduh	[%l7 + 0x10],	%o4
	srlx	%o6,	0x02,	%g5
	fmovrdlz	%l6,	%f26,	%f16
	movg	%icc,	%l2,	%l0
	edge32	%o3,	%g3,	%l1
	fnot1	%f8,	%f6
	movle	%xcc,	%i7,	%g6
	udivcc	%i5,	0x1C7A,	%l4
	fmovsvc	%xcc,	%f15,	%f4
	add	%g4,	0x08D7,	%i4
	srl	%o0,	0x06,	%i0
	movrlz	%i3,	%i1,	%g2
	fmul8ulx16	%f18,	%f18,	%f14
	sethi	0x1051,	%l5
	array32	%i2,	%l3,	%o1
	edge8	%i6,	%o5,	%o2
	stb	%g1,	[%l7 + 0x22]
	ldx	[%l7 + 0x60],	%g7
	movrne	%o7,	%o6,	%g5
	orcc	%o4,	%l6,	%l2
	sll	%o3,	0x17,	%g3
	move	%xcc,	%l1,	%i7
	umul	%g6,	%l0,	%i5
	fmul8ulx16	%f0,	%f8,	%f30
	array8	%g4,	%l4,	%o0
	fornot2	%f14,	%f26,	%f16
	stb	%i4,	[%l7 + 0x2E]
	stb	%i0,	[%l7 + 0x71]
	xnorcc	%i3,	%g2,	%i1
	ldub	[%l7 + 0x24],	%l5
	save %l3, 0x1252, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i6,	%o5,	%o1
	andncc	%g1,	%g7,	%o2
	smulcc	%o7,	0x1C52,	%g5
	edge8n	%o6,	%l6,	%l2
	movleu	%icc,	%o3,	%o4
	stb	%l1,	[%l7 + 0x28]
	edge32ln	%i7,	%g3,	%l0
	faligndata	%f18,	%f8,	%f0
	ldd	[%l7 + 0x08],	%i4
	st	%f27,	[%l7 + 0x40]
	movn	%xcc,	%g6,	%g4
	movrgz	%l4,	%o0,	%i0
	movrlz	%i4,	0x280,	%i3
	umul	%g2,	0x1B36,	%l5
	movrne	%l3,	%i2,	%i1
	mulscc	%o5,	%o1,	%i6
	array32	%g7,	%g1,	%o2
	fmovsa	%icc,	%f5,	%f29
	orcc	%o7,	%o6,	%l6
	addc	%l2,	0x1D08,	%g5
	fnot2s	%f5,	%f29
	fmovd	%f2,	%f20
	movge	%xcc,	%o4,	%o3
	edge8l	%l1,	%g3,	%i7
	edge32	%i5,	%l0,	%g4
	movre	%l4,	%g6,	%i0
	restore %o0, 0x0F91, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%g2,	%i3
	udivx	%l5,	0x1100,	%l3
	fones	%f6
	srax	%i1,	%o5,	%o1
	fmul8sux16	%f6,	%f20,	%f22
	array8	%i6,	%i2,	%g1
	fxors	%f15,	%f28,	%f12
	addcc	%g7,	0x1873,	%o2
	movrgez	%o7,	%o6,	%l6
	movn	%xcc,	%l2,	%o4
	subcc	%o3,	%l1,	%g5
	udiv	%i7,	0x012C,	%g3
	srl	%l0,	%g4,	%i5
	sll	%g6,	0x13,	%i0
	ldx	[%l7 + 0x28],	%l4
	lduw	[%l7 + 0x38],	%i4
	smul	%o0,	%g2,	%l5
	fpack16	%f20,	%f0
	mulx	%l3,	0x0E5D,	%i3
	andncc	%i1,	%o5,	%o1
	fmovscc	%icc,	%f6,	%f19
	edge16l	%i6,	%g1,	%i2
	ldsb	[%l7 + 0x6A],	%o2
	umul	%g7,	%o7,	%o6
	fmovdl	%xcc,	%f16,	%f28
	movcc	%icc,	%l2,	%o4
	sub	%l6,	0x0685,	%l1
	movrne	%g5,	%o3,	%i7
	srl	%g3,	%l0,	%i5
	movrne	%g4,	0x24E,	%i0
	array16	%g6,	%l4,	%o0
	sllx	%i4,	%l5,	%l3
	ldsw	[%l7 + 0x20],	%g2
	edge32l	%i1,	%o5,	%i3
	sra	%i6,	%o1,	%g1
	move	%xcc,	%o2,	%i2
	sdivx	%o7,	0x0630,	%o6
	fmovrdlez	%l2,	%f16,	%f8
	array8	%o4,	%g7,	%l1
	edge8	%g5,	%l6,	%o3
	udivcc	%g3,	0x0230,	%l0
	fmovrdgz	%i5,	%f12,	%f26
	movge	%xcc,	%i7,	%g4
	movn	%xcc,	%g6,	%i0
	stx	%o0,	[%l7 + 0x40]
	addccc	%i4,	%l5,	%l3
	edge32n	%l4,	%g2,	%o5
	xnorcc	%i3,	0x0E67,	%i1
	movle	%xcc,	%o1,	%g1
	fmul8x16al	%f20,	%f5,	%f0
	edge8	%o2,	%i6,	%o7
	movvs	%icc,	%i2,	%o6
	fxnor	%f0,	%f28,	%f10
	umul	%l2,	%o4,	%g7
	sdivcc	%g5,	0x076B,	%l6
	andncc	%o3,	%l1,	%g3
	sdiv	%l0,	0x1FB4,	%i5
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	movgu	%icc,	%o0,	%i4
	ldd	[%l7 + 0x78],	%l4
	ldx	[%l7 + 0x78],	%i0
	fzero	%f14
	fornot1s	%f31,	%f26,	%f26
	movne	%xcc,	%l3,	%l4
	fsrc1	%f10,	%f22
	array32	%o5,	%g2,	%i3
	udivcc	%i1,	0x13E9,	%g1
	movpos	%xcc,	%o2,	%o1
	movn	%xcc,	%i6,	%i2
	fpmerge	%f15,	%f0,	%f2
	pdist	%f12,	%f24,	%f30
	fmovrdgez	%o7,	%f14,	%f12
	stx	%l2,	[%l7 + 0x48]
	sll	%o4,	%g7,	%g5
	sllx	%o6,	0x07,	%o3
	fcmpgt32	%f2,	%f8,	%l1
	fmovsneg	%xcc,	%f0,	%f26
	array32	%g3,	%l0,	%l6
	edge16n	%g4,	%i5,	%g6
	mulscc	%o0,	0x1D9A,	%i7
	addccc	%i4,	0x066C,	%l5
	mulx	%i0,	0x10E0,	%l4
	mulx	%l3,	%g2,	%o5
	orn	%i1,	0x0A11,	%i3
	sethi	0x0C13,	%g1
	nop
	set	0x60, %o5
	std	%f12,	[%l7 + %o5]
	and	%o1,	%o2,	%i2
	addc	%o7,	%i6,	%o4
	ldsh	[%l7 + 0x1E],	%g7
	fcmps	%fcc1,	%f9,	%f29
	xnorcc	%g5,	%o6,	%o3
	fmovdvs	%xcc,	%f14,	%f19
	movle	%xcc,	%l2,	%l1
	fcmpne16	%f4,	%f30,	%l0
	stw	%g3,	[%l7 + 0x58]
	fpsub16s	%f5,	%f17,	%f2
	sub	%l6,	0x0480,	%g4
	movle	%icc,	%i5,	%g6
	udiv	%i7,	0x07D4,	%i4
	smul	%l5,	%o0,	%i0
	edge32	%l4,	%l3,	%o5
	movre	%i1,	%g2,	%g1
	movvs	%xcc,	%o1,	%i3
	edge32n	%i2,	%o7,	%o2
	movrlez	%o4,	0x020,	%g7
	ldx	[%l7 + 0x60],	%g5
	edge32n	%i6,	%o6,	%o3
	andn	%l2,	0x0285,	%l0
	xnor	%g3,	0x1A68,	%l1
	movrgz	%l6,	0x163,	%g4
	movpos	%icc,	%g6,	%i5
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%f20
	srlx	%i7,	%l5,	%i4
	stb	%o0,	[%l7 + 0x45]
	nop
	set	0x7A, %o3
	sth	%l4,	[%l7 + %o3]
	fmovsa	%xcc,	%f25,	%f22
	fsrc2s	%f4,	%f17
	fmul8x16au	%f30,	%f0,	%f8
	movrgez	%l3,	0x216,	%i0
	sllx	%i1,	%o5,	%g2
	fcmpgt32	%f14,	%f26,	%g1
	movle	%icc,	%i3,	%o1
	fsrc1	%f0,	%f30
	mulscc	%i2,	0x0574,	%o7
	movvs	%xcc,	%o4,	%g7
	orn	%o2,	0x1FA6,	%g5
	popc	0x14C6,	%i6
	andncc	%o6,	%o3,	%l2
	orncc	%g3,	0x0B03,	%l1
	udiv	%l6,	0x1FCF,	%g4
	fcmple16	%f2,	%f2,	%l0
	ldsw	[%l7 + 0x7C],	%g6
	fsrc1	%f14,	%f6
	edge32ln	%i7,	%i5,	%i4
	movrlz	%o0,	%l4,	%l3
	fnegs	%f2,	%f30
	fmovsvs	%xcc,	%f21,	%f9
	edge8l	%l5,	%i1,	%o5
	movvs	%xcc,	%i0,	%g2
	fcmpgt32	%f24,	%f6,	%i3
	st	%f8,	[%l7 + 0x68]
	lduw	[%l7 + 0x28],	%o1
	fandnot1	%f30,	%f22,	%f28
	edge16ln	%g1,	%o7,	%i2
	edge32n	%o4,	%o2,	%g7
	andn	%g5,	%o6,	%i6
	movle	%icc,	%l2,	%g3
	smulcc	%o3,	%l6,	%g4
	fmovrde	%l1,	%f30,	%f8
	mulx	%g6,	0x1EC4,	%i7
	andncc	%i5,	%l0,	%o0
	edge16l	%i4,	%l4,	%l5
	orncc	%i1,	0x09D7,	%l3
	fmul8x16au	%f22,	%f24,	%f6
	fpadd16	%f0,	%f20,	%f24
	sethi	0x18E3,	%i0
	save %g2, %o5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g1,	%o7,	%i2
	array16	%o1,	%o4,	%o2
	fnot1	%f22,	%f14
	xorcc	%g5,	%g7,	%i6
	ldub	[%l7 + 0x65],	%o6
	movl	%icc,	%l2,	%g3
	sethi	0x04F7,	%o3
	array16	%g4,	%l6,	%l1
	fmovdvc	%xcc,	%f25,	%f16
	movcc	%xcc,	%g6,	%i7
	addcc	%l0,	0x13CA,	%i5
	ldd	[%l7 + 0x68],	%o0
	fmovrslz	%l4,	%f24,	%f18
	movrne	%i4,	%i1,	%l5
	mova	%icc,	%l3,	%g2
	sdiv	%o5,	0x1BFC,	%i0
	movcs	%icc,	%g1,	%i3
	movrgz	%i2,	%o1,	%o4
	restore %o7, %g5, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f13,	%f0
	movrgz	%i6,	%g7,	%l2
	fmovrdlez	%g3,	%f16,	%f8
	movl	%xcc,	%o3,	%g4
	edge8	%l6,	%o6,	%g6
	orcc	%l1,	0x1E86,	%l0
	edge16n	%i5,	%i7,	%l4
	popc	%o0,	%i4
	subccc	%l5,	%i1,	%g2
	fexpand	%f2,	%f12
	fexpand	%f7,	%f20
	fmovrde	%o5,	%f18,	%f8
	fmovrsgez	%l3,	%f25,	%f27
	xnorcc	%i0,	%g1,	%i2
	sllx	%o1,	0x15,	%i3
	fones	%f4
	edge32n	%o7,	%g5,	%o2
	fmovsl	%xcc,	%f0,	%f31
	edge16n	%i6,	%g7,	%l2
	orncc	%o4,	%g3,	%o3
	fnot1	%f30,	%f24
	movrne	%l6,	0x0D5,	%g4
	edge8	%g6,	%o6,	%l0
	xorcc	%i5,	0x1CD4,	%i7
	sth	%l1,	[%l7 + 0x60]
	movrgz	%l4,	%o0,	%i4
	sra	%l5,	0x0D,	%g2
	mova	%icc,	%i1,	%l3
	edge16	%i0,	%g1,	%i2
	movneg	%xcc,	%o1,	%o5
	ldsh	[%l7 + 0x48],	%i3
	fmovdn	%icc,	%f22,	%f28
	lduw	[%l7 + 0x28],	%g5
	movg	%xcc,	%o7,	%i6
	ld	[%l7 + 0x60],	%f7
	fmovsvc	%xcc,	%f22,	%f5
	orncc	%o2,	%l2,	%g7
	edge32	%g3,	%o4,	%o3
	srlx	%l6,	0x19,	%g4
	siam	0x0
	andn	%o6,	0x00F7,	%g6
	edge16	%l0,	%i5,	%l1
	xnorcc	%i7,	0x1379,	%l4
	movvc	%icc,	%o0,	%l5
	orcc	%i4,	0x1390,	%g2
	movrgez	%i1,	0x0B7,	%i0
	udivcc	%l3,	0x1F37,	%g1
	edge16ln	%i2,	%o5,	%o1
	sethi	0x1599,	%i3
	movg	%icc,	%g5,	%o7
	movvc	%icc,	%i6,	%l2
	ldd	[%l7 + 0x60],	%o2
	stx	%g3,	[%l7 + 0x40]
	edge32n	%o4,	%g7,	%l6
	fcmpeq16	%f16,	%f12,	%g4
	edge16l	%o3,	%g6,	%l0
	edge32ln	%i5,	%l1,	%i7
	movre	%l4,	0x348,	%o6
	fmovsle	%xcc,	%f20,	%f17
	umulcc	%l5,	%o0,	%g2
	fcmpgt32	%f28,	%f30,	%i4
	sir	0x13DB
	fabsd	%f8,	%f20
	srl	%i1,	0x12,	%l3
	sub	%g1,	0x07C9,	%i2
	subcc	%o5,	%o1,	%i0
	edge16n	%g5,	%o7,	%i6
	movrgez	%i3,	%l2,	%g3
	stb	%o2,	[%l7 + 0x21]
	subccc	%o4,	%g7,	%l6
	movrne	%g4,	0x21F,	%g6
	movrlez	%l0,	%o3,	%i5
	faligndata	%f0,	%f28,	%f4
	sth	%i7,	[%l7 + 0x36]
	fmovse	%icc,	%f15,	%f30
	fpadd16	%f20,	%f2,	%f2
	fzeros	%f22
	fnot1	%f26,	%f4
	fpadd32	%f6,	%f24,	%f20
	subc	%l4,	0x186B,	%l1
	ldsw	[%l7 + 0x14],	%o6
	ldsw	[%l7 + 0x20],	%l5
	movrgez	%g2,	%o0,	%i4
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	fnor	%f12,	%f4,	%f26
	ldd	[%l7 + 0x78],	%f6
	fmul8ulx16	%f20,	%f2,	%f12
	alignaddr	%i2,	%o5,	%g1
	sub	%i0,	%g5,	%o7
	umul	%i6,	0x134B,	%i3
	lduw	[%l7 + 0x1C],	%o1
	edge16l	%l2,	%o2,	%g3
	stx	%o4,	[%l7 + 0x58]
	smul	%g7,	%g4,	%l6
	siam	0x7
	movgu	%xcc,	%g6,	%l0
	mova	%xcc,	%i5,	%o3
	edge16ln	%l4,	%l1,	%o6
	movvs	%icc,	%i7,	%g2
	ldsh	[%l7 + 0x16],	%o0
	stx	%l5,	[%l7 + 0x08]
	fpackfix	%f26,	%f21
	umulcc	%i4,	0x1C07,	%l3
	movn	%icc,	%i1,	%i2
	edge32	%g1,	%i0,	%o5
	edge16	%o7,	%g5,	%i3
	movleu	%icc,	%o1,	%i6
	fcmpeq32	%f4,	%f6,	%l2
	sll	%g3,	%o2,	%g7
	srlx	%g4,	0x09,	%o4
	xor	%g6,	0x1C6C,	%l0
	fmovsvc	%icc,	%f8,	%f26
	andncc	%l6,	%o3,	%i5
	sdiv	%l1,	0x1B4E,	%l4
	fmuld8sux16	%f7,	%f3,	%f28
	fmovde	%icc,	%f14,	%f17
	movrlez	%o6,	0x2BA,	%i7
	add	%g2,	0x1F9F,	%o0
	ldd	[%l7 + 0x78],	%f2
	movn	%xcc,	%i4,	%l5
	edge8ln	%i1,	%i2,	%g1
	edge32l	%i0,	%l3,	%o7
	movcs	%xcc,	%g5,	%i3
	sth	%o1,	[%l7 + 0x4E]
	subccc	%o5,	%i6,	%g3
	orncc	%l2,	%g7,	%g4
	fors	%f26,	%f4,	%f14
	fxnor	%f8,	%f12,	%f12
	fandnot1	%f26,	%f14,	%f6
	edge16	%o2,	%g6,	%l0
	sethi	0x093F,	%o4
	udivcc	%l6,	0x07C5,	%i5
	and	%l1,	0x1A86,	%l4
	movrgz	%o3,	%i7,	%o6
	movrne	%o0,	0x39D,	%g2
	movre	%l5,	0x3C6,	%i1
	stw	%i4,	[%l7 + 0x08]
	lduw	[%l7 + 0x18],	%i2
	movpos	%icc,	%i0,	%l3
	array8	%g1,	%g5,	%i3
	fcmpgt16	%f20,	%f20,	%o1
	movvs	%icc,	%o7,	%o5
	udivx	%g3,	0x0347,	%i6
	movn	%xcc,	%g7,	%l2
	movge	%xcc,	%o2,	%g6
	xor	%l0,	%o4,	%g4
	fpack32	%f24,	%f30,	%f16
	edge8n	%i5,	%l1,	%l6
	ldsh	[%l7 + 0x4E],	%l4
	andn	%o3,	%o6,	%o0
	sdivcc	%i7,	0x0404,	%l5
	nop
	set	0x7C, %i1
	ldsw	[%l7 + %i1],	%i1
	edge8ln	%i4,	%i2,	%i0
	movneg	%icc,	%l3,	%g2
	movge	%icc,	%g1,	%i3
	movcc	%icc,	%o1,	%g5
	ldx	[%l7 + 0x50],	%o5
	fpack32	%f12,	%f22,	%f20
	edge8n	%o7,	%i6,	%g7
	lduh	[%l7 + 0x20],	%l2
	udivx	%g3,	0x0FB1,	%o2
	stx	%l0,	[%l7 + 0x58]
	fmovdcs	%xcc,	%f18,	%f2
	popc	%g6,	%g4
	stx	%i5,	[%l7 + 0x38]
	fmovrdlez	%l1,	%f6,	%f30
	edge16ln	%l6,	%l4,	%o3
	movle	%xcc,	%o4,	%o0
	srlx	%o6,	%i7,	%l5
	movleu	%xcc,	%i1,	%i2
	fmovs	%f19,	%f7
	fzeros	%f30
	movn	%icc,	%i0,	%i4
	fmovd	%f10,	%f4
	restore %g2, 0x1972, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x2C],	%g1
	ldx	[%l7 + 0x78],	%o1
	movneg	%icc,	%g5,	%o5
	movne	%xcc,	%o7,	%i6
	edge32ln	%i3,	%l2,	%g7
	edge16ln	%o2,	%l0,	%g3
	mulx	%g6,	%i5,	%g4
	udivx	%l1,	0x0BDA,	%l4
	fmovsgu	%icc,	%f27,	%f27
	orncc	%o3,	0x0E44,	%l6
	fmovsvs	%icc,	%f25,	%f17
	srax	%o0,	0x07,	%o4
	fmovdpos	%xcc,	%f27,	%f28
	fmovrdne	%i7,	%f12,	%f26
	fcmpd	%fcc0,	%f18,	%f30
	edge16n	%l5,	%o6,	%i1
	orncc	%i2,	%i4,	%i0
	sdivcc	%g2,	0x17E4,	%g1
	umul	%o1,	%g5,	%o5
	fand	%f4,	%f18,	%f24
	xnor	%l3,	0x1C90,	%i6
	udivcc	%o7,	0x0B96,	%l2
	movcs	%xcc,	%g7,	%o2
	fcmpeq32	%f20,	%f20,	%l0
	ldd	[%l7 + 0x40],	%i2
	edge16n	%g6,	%i5,	%g4
	array8	%g3,	%l1,	%o3
	srlx	%l6,	0x1B,	%o0
	udivx	%l4,	0x1D07,	%i7
	addc	%l5,	0x0E8D,	%o4
	alignaddrl	%i1,	%o6,	%i4
	ldd	[%l7 + 0x30],	%i2
	movpos	%xcc,	%i0,	%g2
	stw	%o1,	[%l7 + 0x14]
	edge32	%g1,	%g5,	%o5
	edge32	%i6,	%o7,	%l2
	fnand	%f4,	%f12,	%f6
	movge	%icc,	%g7,	%o2
	mulx	%l0,	0x187F,	%i3
	array16	%g6,	%l3,	%g4
	fmovsneg	%xcc,	%f30,	%f24
	fcmpeq32	%f2,	%f26,	%g3
	fors	%f29,	%f12,	%f13
	xor	%i5,	0x0BDB,	%l1
	udiv	%o3,	0x1186,	%o0
	addc	%l4,	%l6,	%i7
	ld	[%l7 + 0x60],	%f4
	sdivx	%l5,	0x1C1B,	%i1
	edge8ln	%o4,	%o6,	%i2
	fmovsneg	%icc,	%f23,	%f12
	movvc	%xcc,	%i0,	%g2
	ldx	[%l7 + 0x08],	%i4
	edge8l	%o1,	%g1,	%o5
	add	%g5,	%o7,	%i6
	edge16	%g7,	%l2,	%o2
	movre	%l0,	%i3,	%l3
	edge8l	%g4,	%g3,	%i5
	edge8	%g6,	%l1,	%o0
	lduh	[%l7 + 0x72],	%l4
	stb	%o3,	[%l7 + 0x53]
	movn	%icc,	%i7,	%l6
	st	%f22,	[%l7 + 0x38]
	andcc	%l5,	%o4,	%i1
	orn	%o6,	%i2,	%i0
	edge16l	%g2,	%i4,	%o1
	sdivx	%o5,	0x15F3,	%g1
	stx	%o7,	[%l7 + 0x48]
	movgu	%icc,	%i6,	%g5
	edge32	%g7,	%o2,	%l2
	movg	%icc,	%l0,	%i3
	fmovdleu	%icc,	%f19,	%f20
	edge16l	%l3,	%g3,	%i5
	lduh	[%l7 + 0x20],	%g6
	fmovrse	%l1,	%f7,	%f2
	or	%g4,	0x1024,	%l4
	popc	%o3,	%i7
	ldub	[%l7 + 0x28],	%o0
	edge8n	%l6,	%l5,	%i1
	fornot1	%f30,	%f22,	%f2
	srlx	%o4,	0x00,	%o6
	udivx	%i0,	0x0DC9,	%g2
	fandnot1	%f30,	%f12,	%f22
	umul	%i2,	%i4,	%o5
	fnot2s	%f31,	%f2
	subc	%o1,	%g1,	%i6
	st	%f29,	[%l7 + 0x40]
	xor	%o7,	%g5,	%o2
	udivcc	%g7,	0x06BA,	%l2
	movrne	%i3,	%l0,	%g3
	ldub	[%l7 + 0x7F],	%i5
	addcc	%l3,	0x1F0A,	%g6
	movrgez	%g4,	%l4,	%l1
	movrgez	%i7,	%o3,	%o0
	fxnor	%f8,	%f12,	%f16
	fones	%f23
	popc	0x028E,	%l6
	edge32n	%l5,	%i1,	%o4
	xorcc	%o6,	%i0,	%i2
	array16	%g2,	%o5,	%i4
	fmovsa	%icc,	%f31,	%f6
	subcc	%o1,	%g1,	%i6
	movvs	%icc,	%g5,	%o7
	andcc	%g7,	%o2,	%i3
	nop
	set	0x3A, %g5
	sth	%l0,	[%l7 + %g5]
	edge16l	%l2,	%i5,	%l3
	lduw	[%l7 + 0x7C],	%g3
	fsrc1	%f10,	%f24
	fmovrsgz	%g6,	%f14,	%f30
	save %l4, 0x0C9E, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g4,	[%l7 + 0x6C]
	andn	%o3,	%i7,	%l6
	nop
	set	0x20, %i2
	std	%f8,	[%l7 + %i2]
	edge8n	%l5,	%o0,	%i1
	sll	%o6,	%o4,	%i0
	andcc	%i2,	0x04C7,	%o5
	movleu	%icc,	%i4,	%g2
	movvs	%xcc,	%g1,	%o1
	ldub	[%l7 + 0x36],	%g5
	stx	%i6,	[%l7 + 0x08]
	ldd	[%l7 + 0x40],	%o6
	fmul8ulx16	%f14,	%f12,	%f28
	std	%f14,	[%l7 + 0x40]
	movne	%xcc,	%g7,	%i3
	mulx	%l0,	0x1968,	%l2
	fmovdneg	%xcc,	%f3,	%f13
	fmul8x16au	%f17,	%f6,	%f28
	sethi	0x14A6,	%o2
	sir	0x1548
	orn	%i5,	0x04EA,	%g3
	fzeros	%f13
	movpos	%icc,	%g6,	%l3
	movleu	%icc,	%l1,	%l4
	stx	%g4,	[%l7 + 0x38]
	andn	%o3,	0x1533,	%l6
	edge32n	%l5,	%o0,	%i7
	movrlez	%o6,	%i1,	%o4
	udivx	%i0,	0x0183,	%o5
	fabss	%f18,	%f2
	movgu	%xcc,	%i4,	%g2
	addc	%g1,	0x080F,	%i2
	fandnot1	%f20,	%f12,	%f22
	orncc	%o1,	0x00D6,	%g5
	st	%f22,	[%l7 + 0x68]
	or	%o7,	0x16AA,	%i6
	fpmerge	%f8,	%f10,	%f8
	movrne	%i3,	0x1AB,	%g7
	subccc	%l0,	%l2,	%i5
	sll	%o2,	%g3,	%l3
	fcmpgt16	%f16,	%f6,	%l1
	movvs	%icc,	%l4,	%g6
	fmovscc	%xcc,	%f25,	%f23
	fsrc2	%f0,	%f16
	addccc	%g4,	%l6,	%o3
	fornot1s	%f18,	%f5,	%f3
	save %o0, %l5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i1,	[%l7 + 0x63]
	siam	0x1
	fcmpgt32	%f8,	%f28,	%i7
	edge16n	%o4,	%i0,	%i4
	addccc	%g2,	0x1D4B,	%o5
	fornot2s	%f23,	%f28,	%f14
	edge32	%g1,	%i2,	%g5
	edge16ln	%o7,	%i6,	%i3
	fnot1	%f30,	%f22
	movrne	%o1,	0x3DB,	%g7
	fnegd	%f4,	%f24
	edge32n	%l2,	%i5,	%o2
	movn	%icc,	%l0,	%g3
	movleu	%icc,	%l1,	%l4
	mulscc	%l3,	%g4,	%l6
	fornot2	%f8,	%f16,	%f12
	srax	%g6,	%o0,	%o3
	orcc	%o6,	%l5,	%i7
	or	%i1,	0x1286,	%o4
	or	%i0,	%g2,	%i4
	sdiv	%g1,	0x1827,	%i2
	andn	%g5,	0x0B61,	%o7
	movrlz	%i6,	0x0B6,	%i3
	movge	%xcc,	%o1,	%o5
	smul	%g7,	0x1C0E,	%l2
	sllx	%o2,	%l0,	%g3
	movge	%xcc,	%l1,	%i5
	xnorcc	%l3,	0x069B,	%g4
	subcc	%l6,	0x07A5,	%g6
	movg	%xcc,	%l4,	%o3
	subc	%o6,	%o0,	%l5
	mova	%icc,	%i7,	%o4
	movle	%icc,	%i1,	%i0
	movneg	%icc,	%g2,	%i4
	edge8n	%g1,	%g5,	%i2
	sll	%o7,	%i3,	%i6
	array8	%o1,	%g7,	%l2
	smul	%o5,	%o2,	%g3
	udiv	%l1,	0x1AAC,	%l0
	ldd	[%l7 + 0x60],	%i4
	movcs	%icc,	%l3,	%l6
	fcmple16	%f16,	%f30,	%g6
	ldub	[%l7 + 0x3E],	%l4
	movne	%xcc,	%g4,	%o3
	xor	%o0,	%o6,	%l5
	fmovsge	%xcc,	%f3,	%f27
	edge16ln	%o4,	%i7,	%i1
	edge8n	%i0,	%i4,	%g2
	movrgz	%g5,	%g1,	%o7
	smul	%i2,	%i6,	%o1
	popc	%i3,	%l2
	or	%o5,	%g7,	%o2
	subc	%g3,	%l0,	%i5
	udivcc	%l1,	0x03DD,	%l6
	movg	%icc,	%l3,	%l4
	fnot2	%f16,	%f6
	ldsh	[%l7 + 0x4A],	%g6
	fone	%f14
	movcs	%icc,	%g4,	%o0
	edge8l	%o6,	%l5,	%o4
	subccc	%o3,	0x1B1B,	%i7
	bshuffle	%f0,	%f10,	%f12
	fmovdcc	%xcc,	%f18,	%f24
	edge16ln	%i1,	%i0,	%g2
	fcmpeq32	%f18,	%f26,	%g5
	popc	%i4,	%o7
	subcc	%g1,	%i6,	%i2
	ldd	[%l7 + 0x60],	%i2
	movn	%icc,	%o1,	%l2
	edge8n	%g7,	%o5,	%o2
	edge8l	%l0,	%g3,	%i5
	orcc	%l6,	0x1B8C,	%l3
	movre	%l4,	%l1,	%g6
	xnorcc	%o0,	0x039F,	%g4
	fmovdleu	%xcc,	%f23,	%f28
	lduw	[%l7 + 0x5C],	%l5
	edge16	%o4,	%o3,	%i7
	fsrc1	%f2,	%f16
	movpos	%xcc,	%o6,	%i1
	movrlez	%g2,	%i0,	%g5
	lduh	[%l7 + 0x36],	%i4
	fpsub16s	%f30,	%f11,	%f8
	movvs	%xcc,	%g1,	%o7
	fcmpeq32	%f18,	%f14,	%i6
	stx	%i2,	[%l7 + 0x60]
	array8	%i3,	%l2,	%g7
	fand	%f16,	%f26,	%f14
	ldd	[%l7 + 0x28],	%o4
	move	%icc,	%o2,	%o1
	fmovsg	%icc,	%f24,	%f14
	ldsw	[%l7 + 0x5C],	%l0
	movpos	%xcc,	%i5,	%l6
	popc	0x0CC0,	%l3
	orcc	%l4,	%g3,	%l1
	fexpand	%f14,	%f16
	fpsub32	%f4,	%f26,	%f6
	edge8l	%o0,	%g6,	%g4
	fmovsleu	%icc,	%f12,	%f18
	movrgz	%o4,	0x06D,	%l5
	fmovrdgz	%i7,	%f22,	%f4
	ldd	[%l7 + 0x28],	%o2
	movvc	%icc,	%o6,	%g2
	edge32n	%i0,	%g5,	%i1
	fornot1s	%f19,	%f30,	%f31
	andcc	%g1,	%i4,	%i6
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	edge8n	%o7,	%o5,	%g7
	fpack16	%f8,	%f13
	fmovrdlez	%o2,	%f8,	%f20
	orncc	%o1,	%l0,	%i5
	edge16n	%l6,	%l3,	%l4
	mulx	%g3,	0x1B59,	%o0
	xnor	%l1,	0x04D6,	%g4
	std	%f18,	[%l7 + 0x70]
	movn	%icc,	%o4,	%g6
	array32	%i7,	%l5,	%o3
	edge8l	%g2,	%i0,	%g5
	movge	%xcc,	%o6,	%g1
	movcc	%xcc,	%i1,	%i6
	fnegs	%f6,	%f24
	movrgez	%i2,	0x2CF,	%i4
	array16	%i3,	%o7,	%l2
	fpsub16	%f8,	%f20,	%f6
	movneg	%xcc,	%g7,	%o5
	fpsub16s	%f31,	%f27,	%f6
	sdivcc	%o1,	0x07B8,	%o2
	movrgez	%l0,	0x1AA,	%i5
	fmovsge	%xcc,	%f29,	%f2
	ldd	[%l7 + 0x38],	%i6
	movrlz	%l4,	%g3,	%o0
	fmovsn	%xcc,	%f21,	%f24
	sir	0x04AC
	fornot1s	%f29,	%f22,	%f25
	stb	%l3,	[%l7 + 0x61]
	sdiv	%g4,	0x0B1E,	%o4
	subcc	%l1,	0x07EC,	%g6
	edge16n	%l5,	%i7,	%o3
	fmul8x16al	%f26,	%f0,	%f6
	nop
	set	0x08, %g1
	ldx	[%l7 + %g1],	%i0
	edge8n	%g5,	%g2,	%g1
	edge32l	%i1,	%o6,	%i6
	fmuld8ulx16	%f3,	%f12,	%f26
	sub	%i2,	%i3,	%o7
	edge8n	%i4,	%l2,	%o5
	sll	%g7,	0x05,	%o1
	lduw	[%l7 + 0x48],	%o2
	srl	%l0,	%i5,	%l4
	stx	%g3,	[%l7 + 0x30]
	movgu	%xcc,	%o0,	%l3
	ldx	[%l7 + 0x10],	%l6
	ldx	[%l7 + 0x60],	%o4
	xnorcc	%l1,	%g4,	%l5
	udivcc	%i7,	0x1AD2,	%o3
	srlx	%g6,	%i0,	%g5
	addc	%g2,	0x0257,	%i1
	fmovdne	%icc,	%f14,	%f26
	fcmpd	%fcc3,	%f6,	%f20
	sllx	%g1,	%i6,	%o6
	bshuffle	%f18,	%f2,	%f22
	edge32l	%i3,	%i2,	%o7
	fpadd32s	%f22,	%f31,	%f29
	movn	%icc,	%l2,	%o5
	smul	%g7,	%o1,	%o2
	popc	%l0,	%i4
	fnot2s	%f8,	%f9
	mulscc	%l4,	0x1EC8,	%g3
	ldub	[%l7 + 0x4B],	%o0
	movrgez	%l3,	%l6,	%i5
	xorcc	%l1,	%g4,	%l5
	fsrc1s	%f11,	%f4
	udivx	%i7,	0x1360,	%o3
	movne	%xcc,	%g6,	%i0
	sdivx	%o4,	0x0348,	%g2
	movpos	%icc,	%i1,	%g1
	movre	%i6,	%o6,	%g5
	fmovdleu	%xcc,	%f26,	%f28
	edge8ln	%i3,	%o7,	%l2
	orncc	%i2,	%g7,	%o5
	fpack32	%f10,	%f6,	%f12
	movn	%xcc,	%o1,	%o2
	fornot1	%f16,	%f10,	%f8
	movleu	%icc,	%l0,	%i4
	sllx	%g3,	%l4,	%o0
	subcc	%l3,	0x0503,	%i5
	fornot2s	%f18,	%f8,	%f14
	xorcc	%l6,	0x0979,	%l1
	fsrc2	%f0,	%f10
	fmovdvs	%icc,	%f22,	%f6
	subcc	%l5,	%g4,	%i7
	mulx	%g6,	0x0064,	%o3
	edge8n	%i0,	%o4,	%g2
	ldx	[%l7 + 0x70],	%i1
	andncc	%g1,	%i6,	%g5
	subccc	%i3,	0x1D05,	%o6
	movrne	%l2,	0x1C5,	%i2
	subc	%g7,	0x1267,	%o7
	fmovs	%f5,	%f10
	movn	%xcc,	%o1,	%o5
	sdiv	%l0,	0x156E,	%i4
	andn	%g3,	0x100D,	%o2
	xnor	%o0,	0x0FFF,	%l4
	xnorcc	%i5,	%l3,	%l1
	umul	%l6,	0x032F,	%l5
	sdivx	%i7,	0x05C8,	%g6
	subc	%g4,	0x0655,	%i0
	xnorcc	%o4,	%o3,	%g2
	fmovdvc	%icc,	%f5,	%f13
	edge16ln	%g1,	%i6,	%i1
	srax	%g5,	%i3,	%o6
	movle	%icc,	%l2,	%i2
	fcmpes	%fcc2,	%f17,	%f0
	fmovsa	%icc,	%f19,	%f6
	alignaddrl	%g7,	%o7,	%o5
	orcc	%l0,	0x0AC3,	%o1
	orncc	%g3,	%i4,	%o2
	movn	%xcc,	%l4,	%i5
	andncc	%o0,	%l1,	%l3
	lduh	[%l7 + 0x2E],	%l6
	fnot2s	%f25,	%f3
	stb	%l5,	[%l7 + 0x3C]
	ldub	[%l7 + 0x47],	%g6
	fnot1s	%f1,	%f1
	std	%f2,	[%l7 + 0x68]
	fpsub16s	%f25,	%f12,	%f18
	fmovdne	%icc,	%f6,	%f12
	stb	%g4,	[%l7 + 0x75]
	stx	%i7,	[%l7 + 0x18]
	movne	%xcc,	%o4,	%i0
	sllx	%o3,	0x19,	%g1
	sdivx	%g2,	0x0E94,	%i6
	or	%i1,	%i3,	%g5
	subc	%o6,	0x0A01,	%l2
	andncc	%i2,	%o7,	%o5
	fmovrse	%l0,	%f8,	%f14
	alignaddrl	%o1,	%g3,	%i4
	srax	%g7,	%o2,	%i5
	alignaddrl	%o0,	%l4,	%l3
	mulscc	%l1,	%l6,	%g6
	andn	%g4,	0x1C5F,	%i7
	udivx	%l5,	0x0B80,	%o4
	sth	%i0,	[%l7 + 0x68]
	smulcc	%o3,	%g2,	%i6
	or	%i1,	0x1D34,	%i3
	movrlz	%g1,	0x385,	%o6
	smul	%l2,	0x179B,	%g5
	movre	%i2,	0x347,	%o5
	umul	%l0,	%o1,	%g3
	alignaddr	%i4,	%o7,	%o2
	subcc	%i5,	0x0AFC,	%g7
	mulscc	%o0,	0x0C1F,	%l3
	fmovrdgez	%l1,	%f28,	%f28
	edge8ln	%l4,	%l6,	%g6
	fmovdcs	%icc,	%f0,	%f2
	edge16l	%g4,	%i7,	%l5
	nop
	set	0x38, %g4
	lduw	[%l7 + %g4],	%i0
	udiv	%o3,	0x1F9C,	%o4
	fcmpes	%fcc3,	%f26,	%f26
	edge8ln	%g2,	%i6,	%i3
	movvs	%icc,	%i1,	%g1
	ldx	[%l7 + 0x18],	%l2
	ldsh	[%l7 + 0x56],	%o6
	andn	%g5,	%o5,	%i2
	save %l0, 0x1C15, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i4,	0x0DD9,	%o7
	movne	%icc,	%g3,	%o2
	andcc	%g7,	%i5,	%l3
	movcc	%xcc,	%o0,	%l1
	subc	%l4,	%l6,	%g4
	popc	0x0441,	%g6
	ldub	[%l7 + 0x33],	%i7
	ldsb	[%l7 + 0x0D],	%l5
	fmul8x16au	%f15,	%f18,	%f0
	fpsub16	%f12,	%f18,	%f0
	sdiv	%o3,	0x023F,	%o4
	ld	[%l7 + 0x14],	%f4
	fmovdge	%icc,	%f10,	%f30
	xorcc	%i0,	0x0B1D,	%i6
	fcmpeq16	%f20,	%f6,	%g2
	alignaddr	%i3,	%g1,	%l2
	movpos	%xcc,	%i1,	%g5
	movrlez	%o6,	%i2,	%o5
	edge16ln	%o1,	%i4,	%o7
	movleu	%icc,	%l0,	%g3
	move	%icc,	%o2,	%i5
	sdiv	%g7,	0x09BF,	%l3
	movvs	%xcc,	%l1,	%l4
	subccc	%o0,	%g4,	%l6
	movcs	%icc,	%i7,	%l5
	or	%o3,	0x0DE4,	%g6
	fmovsvs	%icc,	%f3,	%f14
	fxnor	%f10,	%f18,	%f16
	andcc	%o4,	0x1A72,	%i6
	sra	%i0,	0x14,	%g2
	sdiv	%g1,	0x11ED,	%i3
	addcc	%l2,	%g5,	%o6
	movcc	%icc,	%i1,	%i2
	sub	%o5,	%o1,	%o7
	srax	%l0,	%g3,	%i4
	subcc	%o2,	%i5,	%l3
	movne	%xcc,	%g7,	%l1
	xorcc	%l4,	0x17E2,	%g4
	fmovdle	%icc,	%f23,	%f20
	movneg	%xcc,	%o0,	%l6
	umulcc	%i7,	%o3,	%g6
	fmovsne	%xcc,	%f7,	%f20
	mulx	%o4,	%i6,	%i0
	array16	%l5,	%g2,	%i3
	fmovscs	%icc,	%f12,	%f22
	sdiv	%g1,	0x1CCF,	%l2
	popc	%g5,	%i1
	movleu	%icc,	%o6,	%i2
	movrlz	%o5,	0x1BB,	%o7
	udivx	%o1,	0x0FEE,	%g3
	fmul8x16	%f2,	%f2,	%f14
	lduw	[%l7 + 0x18],	%i4
	edge8n	%o2,	%l0,	%l3
	smulcc	%i5,	0x1024,	%g7
	sdiv	%l4,	0x00CD,	%g4
	fpadd16s	%f30,	%f3,	%f16
	fnot2s	%f6,	%f13
	stx	%l1,	[%l7 + 0x58]
	subc	%o0,	0x0475,	%l6
	fandnot2s	%f31,	%f2,	%f20
	movl	%icc,	%i7,	%g6
	xnor	%o3,	%o4,	%i0
	edge8	%l5,	%i6,	%i3
	sethi	0x01EC,	%g2
	bshuffle	%f26,	%f30,	%f30
	smul	%l2,	0x0F69,	%g5
	fmovdcc	%icc,	%f30,	%f31
	movvc	%xcc,	%i1,	%g1
	udivcc	%i2,	0x1773,	%o6
	udivx	%o7,	0x0CB5,	%o1
	edge32n	%g3,	%i4,	%o5
	movcc	%xcc,	%o2,	%l0
	srlx	%i5,	0x07,	%g7
	movleu	%icc,	%l3,	%g4
	ldsh	[%l7 + 0x7E],	%l4
	edge16l	%l1,	%l6,	%o0
	edge8n	%g6,	%o3,	%o4
	subccc	%i0,	%i7,	%i6
	fmovrsne	%l5,	%f7,	%f27
	movcs	%icc,	%g2,	%l2
	edge32ln	%i3,	%i1,	%g5
	addcc	%g1,	%o6,	%o7
	movrlz	%o1,	0x288,	%i2
	xnorcc	%i4,	0x0C4C,	%g3
	srlx	%o5,	%o2,	%l0
	array16	%i5,	%g7,	%l3
	movg	%xcc,	%l4,	%l1
	movrne	%g4,	%l6,	%g6
	or	%o3,	0x15C0,	%o4
	edge16l	%i0,	%i7,	%i6
	ldd	[%l7 + 0x78],	%f18
	addc	%l5,	0x1049,	%g2
	sdivcc	%o0,	0x013C,	%l2
	sra	%i3,	%g5,	%g1
	movleu	%icc,	%i1,	%o7
	movcc	%icc,	%o6,	%i2
	array16	%i4,	%g3,	%o5
	fpack16	%f8,	%f29
	fmovdneg	%xcc,	%f6,	%f14
	movvs	%xcc,	%o1,	%o2
	movcc	%xcc,	%i5,	%g7
	sub	%l0,	%l3,	%l4
	ldsh	[%l7 + 0x44],	%g4
	stw	%l6,	[%l7 + 0x64]
	edge32l	%l1,	%g6,	%o3
	fzeros	%f9
	srl	%i0,	%o4,	%i7
	fmovse	%icc,	%f30,	%f24
	umul	%l5,	%g2,	%i6
	fcmpeq32	%f24,	%f16,	%o0
	movre	%i3,	0x380,	%g5
	lduh	[%l7 + 0x40],	%g1
	movrlez	%i1,	%l2,	%o6
	alignaddrl	%o7,	%i2,	%i4
	fmovdge	%xcc,	%f14,	%f6
	fmovdleu	%icc,	%f11,	%f22
	fpsub16	%f6,	%f0,	%f2
	movrlz	%g3,	0x1EB,	%o1
	fcmpd	%fcc0,	%f6,	%f10
	movne	%xcc,	%o2,	%o5
	restore %g7, 0x0DEC, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l3,	0x1423,	%i5
	xorcc	%g4,	0x1EB7,	%l4
	std	%f28,	[%l7 + 0x50]
	ldsh	[%l7 + 0x16],	%l6
	smulcc	%g6,	%o3,	%l1
	movleu	%icc,	%i0,	%o4
	st	%f13,	[%l7 + 0x38]
	movg	%xcc,	%l5,	%i7
	fmul8sux16	%f26,	%f4,	%f26
	movn	%icc,	%g2,	%o0
	edge8n	%i3,	%i6,	%g5
	edge16ln	%g1,	%i1,	%o6
	ldx	[%l7 + 0x18],	%l2
	addc	%i2,	%i4,	%g3
	movgu	%xcc,	%o1,	%o7
	fandnot1s	%f11,	%f22,	%f20
	movleu	%xcc,	%o2,	%o5
	sra	%l0,	0x08,	%l3
	and	%i5,	0x1467,	%g4
	move	%xcc,	%l4,	%g7
	add	%g6,	0x0BDA,	%o3
	sdivcc	%l6,	0x00D5,	%i0
	array16	%o4,	%l1,	%i7
	fornot2	%f14,	%f18,	%f14
	fornot2	%f2,	%f4,	%f24
	nop
	set	0x3C, %l0
	stb	%l5,	[%l7 + %l0]
	fones	%f13
	nop
	set	0x6C, %o1
	ldsw	[%l7 + %o1],	%g2
	smulcc	%o0,	%i6,	%i3
	fnors	%f31,	%f26,	%f13
	xnor	%g1,	0x0B1A,	%i1
	save %o6, %l2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%i4,	%g3
	stx	%i2,	[%l7 + 0x48]
	fcmpeq32	%f0,	%f10,	%o1
	orcc	%o2,	0x107C,	%o7
	fornot2	%f4,	%f22,	%f28
	umul	%l0,	0x108B,	%o5
	popc	%l3,	%i5
	movvs	%xcc,	%l4,	%g4
	ldd	[%l7 + 0x50],	%f10
	std	%f14,	[%l7 + 0x60]
	fmuld8ulx16	%f16,	%f15,	%f16
	or	%g7,	%g6,	%o3
	xnor	%l6,	0x0069,	%i0
	st	%f25,	[%l7 + 0x2C]
	edge16n	%o4,	%i7,	%l5
	edge32	%g2,	%l1,	%i6
	ldsb	[%l7 + 0x4F],	%i3
	or	%o0,	%i1,	%o6
	alignaddrl	%g1,	%l2,	%i4
	udiv	%g3,	0x1A46,	%i2
	fmovdneg	%xcc,	%f7,	%f13
	edge32l	%g5,	%o2,	%o7
	fmul8x16au	%f1,	%f26,	%f18
	or	%o1,	%l0,	%o5
	movcc	%xcc,	%i5,	%l4
	move	%xcc,	%g4,	%g7
	edge16l	%g6,	%l3,	%l6
	popc	%i0,	%o4
	srax	%i7,	%o3,	%g2
	edge16l	%l5,	%i6,	%l1
	sir	0x046A
	movge	%xcc,	%i3,	%o0
	movrgez	%i1,	%g1,	%l2
	ldd	[%l7 + 0x38],	%i4
	fmul8ulx16	%f2,	%f14,	%f2
	andn	%g3,	0x0C34,	%o6
	nop
	set	0x56, %i3
	ldsb	[%l7 + %i3],	%i2
	move	%xcc,	%g5,	%o2
	edge8n	%o1,	%o7,	%l0
	stw	%o5,	[%l7 + 0x14]
	popc	%l4,	%i5
	movre	%g4,	0x225,	%g6
	fexpand	%f6,	%f14
	lduh	[%l7 + 0x44],	%l3
	xnorcc	%l6,	0x0F46,	%i0
	fmovsn	%xcc,	%f29,	%f10
	ldsw	[%l7 + 0x08],	%o4
	sethi	0x006F,	%g7
	movge	%xcc,	%i7,	%o3
	subcc	%g2,	0x1744,	%i6
	and	%l1,	0x1684,	%i3
	edge16	%o0,	%l5,	%g1
	mulscc	%i1,	%l2,	%g3
	movrgez	%o6,	%i4,	%g5
	andcc	%o2,	%i2,	%o1
	orn	%o7,	%l0,	%o5
	sth	%l4,	[%l7 + 0x5E]
	movg	%icc,	%i5,	%g4
	array16	%g6,	%l6,	%l3
	ldsh	[%l7 + 0x14],	%i0
	movne	%icc,	%o4,	%g7
	edge32	%o3,	%i7,	%g2
	alignaddrl	%l1,	%i3,	%o0
	movg	%xcc,	%i6,	%g1
	fcmpeq32	%f12,	%f12,	%l5
	ldd	[%l7 + 0x08],	%f22
	stx	%l2,	[%l7 + 0x48]
	movrlz	%i1,	%g3,	%o6
	edge8	%g5,	%i4,	%o2
	udiv	%o1,	0x141D,	%o7
	sra	%l0,	%i2,	%o5
	fnegs	%f16,	%f10
	fmovdl	%icc,	%f4,	%f27
	ldd	[%l7 + 0x20],	%i4
	fmul8x16al	%f18,	%f28,	%f30
	add	%l4,	%g4,	%g6
	movgu	%icc,	%l3,	%i0
	alignaddrl	%o4,	%l6,	%g7
	umul	%o3,	0x09AD,	%i7
	ldd	[%l7 + 0x08],	%f16
	fmovdneg	%icc,	%f28,	%f19
	subc	%g2,	0x05F8,	%l1
	fornot2s	%f15,	%f0,	%f18
	fcmpne32	%f28,	%f4,	%o0
	movcc	%icc,	%i3,	%i6
	mulscc	%l5,	0x19E4,	%g1
	sllx	%l2,	0x1C,	%i1
	xnorcc	%g3,	%g5,	%i4
	edge32	%o2,	%o6,	%o1
	alignaddr	%l0,	%i2,	%o7
	edge16l	%i5,	%o5,	%l4
	lduh	[%l7 + 0x66],	%g4
	andncc	%l3,	%i0,	%o4
	udiv	%g6,	0x131D,	%g7
	ldd	[%l7 + 0x30],	%i6
	move	%icc,	%o3,	%i7
	addcc	%g2,	%o0,	%i3
	movpos	%xcc,	%l1,	%i6
	fnot1	%f8,	%f0
	edge16l	%g1,	%l2,	%l5
	fmovrdne	%g3,	%f18,	%f8
	subc	%g5,	0x0554,	%i4
	fmovsn	%icc,	%f11,	%f15
	srl	%i1,	0x1D,	%o6
	fors	%f29,	%f13,	%f12
	umulcc	%o2,	%l0,	%o1
	addcc	%o7,	%i2,	%i5
	subcc	%l4,	0x15F6,	%o5
	orcc	%l3,	0x07F3,	%g4
	orn	%o4,	%i0,	%g6
	array16	%g7,	%l6,	%i7
	sdivcc	%g2,	0x1C1A,	%o0
	stx	%o3,	[%l7 + 0x48]
	sra	%l1,	0x0D,	%i3
	edge8	%i6,	%g1,	%l2
	orn	%g3,	0x1E51,	%g5
	subccc	%l5,	%i4,	%o6
	fmovrdlz	%o2,	%f16,	%f18
	xnorcc	%l0,	%o1,	%o7
	xnor	%i2,	%i1,	%l4
	sll	%i5,	%o5,	%g4
	movpos	%xcc,	%l3,	%i0
	lduh	[%l7 + 0x56],	%g6
	array8	%o4,	%g7,	%i7
	xnorcc	%l6,	%g2,	%o0
	std	%f10,	[%l7 + 0x30]
	st	%f5,	[%l7 + 0x08]
	movne	%xcc,	%l1,	%o3
	movpos	%icc,	%i3,	%g1
	movn	%xcc,	%l2,	%i6
	edge32n	%g3,	%g5,	%l5
	sll	%o6,	0x1F,	%i4
	movn	%xcc,	%o2,	%o1
	movpos	%xcc,	%o7,	%l0
	srlx	%i2,	%i1,	%i5
	stx	%o5,	[%l7 + 0x68]
	lduh	[%l7 + 0x5A],	%l4
	array32	%l3,	%i0,	%g4
	edge8n	%g6,	%o4,	%i7
	movge	%icc,	%g7,	%g2
	fpadd32s	%f30,	%f12,	%f27
	movg	%icc,	%o0,	%l6
	ldub	[%l7 + 0x10],	%l1
	movcs	%xcc,	%o3,	%i3
	andncc	%g1,	%i6,	%l2
	movrgez	%g5,	0x36F,	%l5
	movgu	%icc,	%g3,	%o6
	array32	%o2,	%i4,	%o1
	ldub	[%l7 + 0x3A],	%l0
	fcmpes	%fcc0,	%f17,	%f25
	edge16	%i2,	%o7,	%i5
	ldub	[%l7 + 0x3C],	%o5
	movneg	%icc,	%l4,	%l3
	ldub	[%l7 + 0x27],	%i1
	nop
	set	0x24, %l5
	stw	%g4,	[%l7 + %l5]
	fpack16	%f26,	%f14
	smulcc	%g6,	0x0E65,	%i0
	array32	%o4,	%i7,	%g7
	st	%f9,	[%l7 + 0x28]
	xorcc	%g2,	%l6,	%o0
	movgu	%icc,	%o3,	%l1
	addc	%i3,	0x031E,	%g1
	movge	%icc,	%l2,	%g5
	fmovsn	%icc,	%f22,	%f23
	subc	%l5,	0x0134,	%g3
	fmul8x16au	%f26,	%f6,	%f6
	xnor	%o6,	%i6,	%i4
	fpmerge	%f0,	%f10,	%f18
	edge32	%o2,	%l0,	%o1
	edge8n	%i2,	%i5,	%o7
	or	%o5,	0x0CF3,	%l3
	andcc	%l4,	0x1E11,	%i1
	movrlez	%g6,	0x399,	%i0
	movrgz	%g4,	%o4,	%i7
	move	%icc,	%g2,	%l6
	fmovdpos	%xcc,	%f26,	%f11
	movrgz	%o0,	0x119,	%o3
	sdivcc	%l1,	0x0E8B,	%i3
	movrne	%g7,	%l2,	%g1
	umulcc	%l5,	0x178F,	%g5
	movg	%icc,	%o6,	%g3
	fxnor	%f10,	%f26,	%f8
	fornot1s	%f25,	%f19,	%f28
	fmovsn	%xcc,	%f26,	%f18
	fmul8sux16	%f4,	%f20,	%f28
	fabss	%f16,	%f26
	sub	%i6,	0x0FBA,	%o2
	fpadd16s	%f1,	%f6,	%f16
	sir	0x000A
	udivx	%l0,	0x0DC9,	%o1
	ldub	[%l7 + 0x2B],	%i4
	fands	%f13,	%f29,	%f26
	subcc	%i2,	%i5,	%o7
	movne	%icc,	%o5,	%l3
	sra	%l4,	0x00,	%g6
	save %i1, 0x19CB, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o4,	0x0856,	%i0
	edge32	%i7,	%g2,	%l6
	ldub	[%l7 + 0x1A],	%o0
	umulcc	%o3,	%l1,	%i3
	edge8l	%l2,	%g1,	%l5
	mulx	%g5,	%o6,	%g7
	sub	%i6,	%o2,	%l0
	st	%f21,	[%l7 + 0x6C]
	movn	%icc,	%o1,	%i4
	array32	%i2,	%g3,	%o7
	sub	%i5,	0x1428,	%o5
	movne	%xcc,	%l3,	%g6
	movleu	%xcc,	%l4,	%i1
	sub	%o4,	0x1CAF,	%g4
	fmovsvc	%xcc,	%f26,	%f20
	movne	%xcc,	%i0,	%g2
	array16	%l6,	%i7,	%o3
	fxor	%f10,	%f28,	%f8
	edge32l	%l1,	%o0,	%l2
	udivcc	%g1,	0x173F,	%l5
	subccc	%i3,	0x1DCA,	%g5
	move	%icc,	%g7,	%i6
	fcmple16	%f22,	%f0,	%o6
	fcmped	%fcc0,	%f8,	%f20
	fmovda	%xcc,	%f9,	%f21
	ldsb	[%l7 + 0x6C],	%o2
	smulcc	%o1,	%i4,	%l0
	sth	%i2,	[%l7 + 0x4C]
	fmovdneg	%xcc,	%f16,	%f1
	fmul8sux16	%f4,	%f16,	%f12
	ldsw	[%l7 + 0x14],	%o7
	movge	%xcc,	%g3,	%i5
	movg	%xcc,	%o5,	%l3
	fzeros	%f16
	movpos	%xcc,	%l4,	%g6
	stw	%i1,	[%l7 + 0x5C]
	fmovdgu	%icc,	%f3,	%f3
	move	%icc,	%g4,	%o4
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	sub	%i7,	%l1,	%o3
	movvs	%xcc,	%o0,	%l2
	alignaddr	%l5,	%i3,	%g1
	smul	%g7,	0x0265,	%i6
	fmovsneg	%icc,	%f21,	%f7
	stx	%o6,	[%l7 + 0x78]
	fandnot2s	%f7,	%f8,	%f18
	edge16ln	%g5,	%o2,	%i4
	udivx	%o1,	0x0254,	%i2
	array8	%o7,	%l0,	%g3
	movrgz	%o5,	0x114,	%i5
	andncc	%l3,	%l4,	%g6
	fcmpne16	%f8,	%f28,	%i1
	array16	%o4,	%g4,	%l6
	edge16ln	%i0,	%g2,	%l1
	movg	%icc,	%o3,	%i7
	xnor	%o0,	0x1E07,	%l2
	stx	%l5,	[%l7 + 0x68]
	fpadd16	%f10,	%f10,	%f24
	xor	%i3,	0x1E2F,	%g1
	std	%f12,	[%l7 + 0x28]
	mulscc	%i6,	%g7,	%o6
	edge8ln	%o2,	%i4,	%g5
	umul	%i2,	0x0D46,	%o1
	movne	%icc,	%o7,	%g3
	sll	%l0,	0x0C,	%i5
	xor	%l3,	0x1C09,	%l4
	addc	%g6,	%i1,	%o5
	sdivx	%g4,	0x18B7,	%l6
	fpack32	%f24,	%f2,	%f2
	ldsw	[%l7 + 0x2C],	%i0
	edge16ln	%o4,	%l1,	%g2
	smulcc	%i7,	%o0,	%o3
	movg	%icc,	%l2,	%i3
	subccc	%l5,	0x1603,	%i6
	smulcc	%g1,	%g7,	%o6
	xnorcc	%o2,	0x1FA7,	%i4
	edge16n	%g5,	%i2,	%o1
	subcc	%o7,	%l0,	%g3
	add	%l3,	0x0CE9,	%i5
	orn	%l4,	0x1141,	%g6
	nop
	set	0x43, %o4
	ldsb	[%l7 + %o4],	%o5
	udivx	%g4,	0x09DC,	%l6
	umulcc	%i0,	%i1,	%o4
	mova	%icc,	%g2,	%l1
	stx	%o0,	[%l7 + 0x08]
	movvs	%xcc,	%i7,	%o3
	movneg	%icc,	%i3,	%l5
	movl	%xcc,	%i6,	%l2
	fors	%f30,	%f19,	%f6
	addc	%g1,	%g7,	%o6
	st	%f14,	[%l7 + 0x5C]
	st	%f22,	[%l7 + 0x64]
	or	%o2,	0x0CB0,	%g5
	fcmped	%fcc2,	%f28,	%f30
	movle	%xcc,	%i4,	%o1
	sethi	0x1F98,	%i2
	fmovsg	%icc,	%f1,	%f24
	popc	0x06AD,	%o7
	and	%g3,	0x10A3,	%l3
	srl	%i5,	%l4,	%g6
	addccc	%l0,	0x1483,	%g4
	srax	%o5,	0x01,	%l6
	xnor	%i0,	%o4,	%g2
	udivx	%i1,	0x1AAA,	%l1
	orn	%i7,	0x1DA3,	%o3
	umulcc	%i3,	0x004F,	%o0
	ldsb	[%l7 + 0x64],	%l5
	edge16n	%i6,	%l2,	%g7
	fmovsle	%icc,	%f15,	%f4
	ldd	[%l7 + 0x38],	%g0
	sth	%o2,	[%l7 + 0x42]
	alignaddr	%g5,	%i4,	%o1
	xnorcc	%o6,	0x04CD,	%o7
	array32	%i2,	%g3,	%l3
	fmovdn	%icc,	%f21,	%f1
	ldsb	[%l7 + 0x71],	%l4
	sir	0x1EEC
	ld	[%l7 + 0x28],	%f12
	fpsub32	%f22,	%f10,	%f2
	sethi	0x0879,	%i5
	smul	%l0,	%g6,	%g4
	sdivcc	%o5,	0x0CBD,	%l6
	xnorcc	%i0,	%o4,	%i1
	xnor	%l1,	%g2,	%i7
	ld	[%l7 + 0x14],	%f1
	fmovdleu	%xcc,	%f4,	%f21
	alignaddrl	%i3,	%o3,	%o0
	movrgz	%l5,	0x2FA,	%l2
	fxors	%f27,	%f2,	%f26
	sll	%i6,	0x1C,	%g1
	edge32	%g7,	%g5,	%o2
	sdiv	%o1,	0x160B,	%o6
	andncc	%i4,	%i2,	%g3
	fmovrsgz	%o7,	%f20,	%f11
	subc	%l4,	0x11C8,	%i5
	movvs	%xcc,	%l3,	%l0
	sdivcc	%g4,	0x1B7A,	%o5
	andncc	%g6,	%i0,	%o4
	orn	%l6,	0x01EA,	%i1
	fmovd	%f0,	%f10
	srax	%g2,	%i7,	%l1
	ld	[%l7 + 0x34],	%f1
	udivcc	%o3,	0x02BC,	%o0
	movcs	%icc,	%i3,	%l2
	stb	%l5,	[%l7 + 0x41]
	sth	%g1,	[%l7 + 0x3A]
	pdist	%f26,	%f8,	%f20
	fandnot2	%f24,	%f26,	%f14
	sub	%g7,	%g5,	%i6
	movcs	%xcc,	%o1,	%o6
	fandnot2	%f18,	%f10,	%f0
	fpadd32	%f10,	%f18,	%f2
	edge16n	%o2,	%i4,	%g3
	smul	%o7,	%i2,	%l4
	array8	%i5,	%l3,	%l0
	restore %o5, 0x1FF2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g4,	%o4,	%i0
	sdivx	%l6,	0x00A2,	%i1
	fmovrdgz	%g2,	%f10,	%f6
	smulcc	%i7,	%l1,	%o3
	movleu	%icc,	%o0,	%i3
	movvs	%icc,	%l2,	%g1
	edge32l	%g7,	%g5,	%i6
	movre	%o1,	0x0A3,	%l5
	smul	%o6,	%i4,	%g3
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	xorcc	%l4,	0x04DB,	%i5
	sllx	%l0,	0x08,	%o5
	fpsub16s	%f0,	%f30,	%f15
	fcmpd	%fcc0,	%f6,	%f10
	addccc	%g6,	0x0FFF,	%g4
	fabss	%f9,	%f1
	ldd	[%l7 + 0x50],	%f26
	ldub	[%l7 + 0x3A],	%o4
	save %l3, %i0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc0,	%f23,	%f5
	movneg	%icc,	%l6,	%g2
	fornot2s	%f18,	%f18,	%f5
	sub	%i7,	0x1A23,	%o3
	edge32n	%l1,	%o0,	%i3
	edge16n	%l2,	%g1,	%g5
	mulscc	%g7,	0x0FB5,	%i6
	udivcc	%o1,	0x091E,	%l5
	fmovdleu	%icc,	%f29,	%f24
	movge	%xcc,	%i4,	%o6
	stw	%o7,	[%l7 + 0x40]
	xnorcc	%g3,	%o2,	%i2
	popc	%l4,	%i5
	sub	%o5,	%l0,	%g6
	fnegd	%f2,	%f16
	addc	%g4,	%o4,	%i0
	fmovdn	%xcc,	%f9,	%f22
	udivcc	%l3,	0x1B9E,	%i1
	array32	%l6,	%g2,	%i7
	add	%o3,	0x0028,	%o0
	subc	%i3,	0x0132,	%l2
	smulcc	%l1,	%g1,	%g7
	edge16l	%g5,	%o1,	%l5
	fpack32	%f4,	%f22,	%f6
	fmovdne	%icc,	%f0,	%f3
	array16	%i6,	%o6,	%o7
	subcc	%i4,	%o2,	%g3
	fcmpeq16	%f28,	%f6,	%l4
	ldub	[%l7 + 0x08],	%i2
	fmovsneg	%icc,	%f18,	%f23
	fmovdne	%xcc,	%f6,	%f9
	edge16	%o5,	%l0,	%g6
	lduh	[%l7 + 0x66],	%i5
	xnorcc	%o4,	0x10EF,	%g4
	array16	%i0,	%i1,	%l6
	fmovdne	%icc,	%f20,	%f23
	move	%icc,	%l3,	%i7
	fornot1s	%f19,	%f14,	%f28
	edge8l	%g2,	%o3,	%o0
	addc	%i3,	0x0612,	%l1
	fmovspos	%icc,	%f27,	%f20
	edge32	%l2,	%g7,	%g5
	fabss	%f3,	%f12
	edge32l	%o1,	%g1,	%l5
	srax	%i6,	0x06,	%o6
	stw	%i4,	[%l7 + 0x20]
	ldsh	[%l7 + 0x58],	%o7
	movl	%xcc,	%o2,	%l4
	sdiv	%i2,	0x05D4,	%g3
	fmovrse	%o5,	%f6,	%f4
	fzero	%f16
	fmovdge	%xcc,	%f7,	%f29
	fcmpgt32	%f4,	%f30,	%l0
	mova	%icc,	%g6,	%o4
	movg	%icc,	%i5,	%g4
	fxnors	%f7,	%f11,	%f26
	orncc	%i0,	%i1,	%l3
	edge8ln	%i7,	%l6,	%o3
	edge8n	%o0,	%i3,	%g2
	sll	%l1,	%l2,	%g5
	st	%f29,	[%l7 + 0x64]
	sll	%g7,	%o1,	%l5
	fmuld8sux16	%f24,	%f10,	%f24
	srlx	%g1,	0x00,	%o6
	fmovrde	%i4,	%f16,	%f30
	edge16ln	%o7,	%o2,	%l4
	srax	%i2,	0x1F,	%g3
	movleu	%icc,	%o5,	%l0
	alignaddrl	%i6,	%o4,	%i5
	fornot2	%f12,	%f24,	%f26
	edge8l	%g4,	%i0,	%i1
	restore %l3, %g6, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o3,	%l6,	%o0
	smulcc	%g2,	%i3,	%l1
	fmovrdlez	%g5,	%f12,	%f0
	fxors	%f21,	%f16,	%f6
	sub	%l2,	0x0E65,	%o1
	sir	0x082F
	movcs	%xcc,	%g7,	%l5
	edge8	%o6,	%g1,	%o7
	add	%o2,	0x1B2E,	%l4
	udivcc	%i4,	0x16F2,	%g3
	sdivcc	%i2,	0x1CCB,	%l0
	srl	%i6,	%o5,	%i5
	sll	%o4,	%g4,	%i1
	fmovdne	%icc,	%f28,	%f6
	and	%l3,	0x1824,	%i0
	movl	%xcc,	%g6,	%o3
	fmuld8sux16	%f22,	%f3,	%f6
	addcc	%i7,	%l6,	%g2
	movneg	%xcc,	%i3,	%o0
	fmovdgu	%xcc,	%f19,	%f9
	movgu	%icc,	%g5,	%l1
	ldx	[%l7 + 0x20],	%o1
	movcs	%icc,	%g7,	%l2
	ldd	[%l7 + 0x30],	%l4
	andncc	%g1,	%o7,	%o6
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	sethi	0x0670,	%i2
	movg	%xcc,	%g3,	%l0
	edge8n	%i6,	%i5,	%o4
	fmovrde	%g4,	%f8,	%f24
	edge8l	%o5,	%i1,	%l3
	add	%g6,	0x0DB6,	%i0
	alignaddrl	%o3,	%i7,	%l6
	save %i3, 0x1E3C, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f26,	%f2,	%g2
	movcc	%icc,	%g5,	%l1
	fnor	%f24,	%f22,	%f6
	andn	%o1,	%g7,	%l5
	fmul8x16al	%f18,	%f10,	%f26
	ldx	[%l7 + 0x40],	%l2
	fmovdneg	%icc,	%f2,	%f7
	movrlez	%g1,	%o6,	%o7
	movge	%xcc,	%i4,	%l4
	subcc	%i2,	%g3,	%l0
	movl	%icc,	%o2,	%i6
	fmovdg	%icc,	%f19,	%f2
	edge8n	%i5,	%g4,	%o4
	sdivx	%i1,	0x1796,	%l3
	movrne	%g6,	%o5,	%i0
	fnegd	%f26,	%f14
	move	%xcc,	%i7,	%o3
	move	%xcc,	%l6,	%o0
	sdiv	%g2,	0x1FA3,	%g5
	edge16ln	%l1,	%o1,	%g7
	orcc	%i3,	0x1E0D,	%l2
	fxor	%f22,	%f14,	%f8
	alignaddr	%l5,	%o6,	%o7
	fmovsg	%icc,	%f2,	%f5
	movrlz	%i4,	%g1,	%l4
	stb	%i2,	[%l7 + 0x34]
	alignaddr	%g3,	%o2,	%i6
	movvc	%icc,	%i5,	%l0
	add	%o4,	%g4,	%l3
	stx	%i1,	[%l7 + 0x38]
	fands	%f21,	%f22,	%f19
	edge16n	%g6,	%i0,	%i7
	movrgz	%o5,	%l6,	%o3
	orncc	%g2,	%o0,	%g5
	sra	%o1,	%l1,	%g7
	siam	0x2
	sub	%i3,	%l5,	%l2
	fnegd	%f28,	%f28
	movrlz	%o6,	0x230,	%i4
	and	%o7,	0x0D39,	%g1
	save %i2, %g3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o2,	%i6
	sub	%i5,	0x039D,	%o4
	movg	%xcc,	%l0,	%l3
	andcc	%g4,	0x19C6,	%g6
	edge8	%i0,	%i7,	%i1
	fmovdvc	%icc,	%f25,	%f17
	fcmpes	%fcc1,	%f14,	%f17
	edge16ln	%l6,	%o3,	%g2
	lduh	[%l7 + 0x34],	%o0
	subc	%g5,	%o5,	%o1
	addc	%l1,	0x0820,	%g7
	save %i3, %l2, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i4,	%o7,	%g1
	edge8	%o6,	%g3,	%l4
	andncc	%i2,	%o2,	%i6
	mulscc	%o4,	0x1B49,	%l0
	sllx	%l3,	0x13,	%g4
	ldd	[%l7 + 0x58],	%g6
	movcs	%icc,	%i5,	%i0
	movrgez	%i7,	%i1,	%o3
	fcmpne16	%f0,	%f4,	%g2
	sethi	0x0DFC,	%o0
	edge8l	%g5,	%o5,	%o1
	movneg	%icc,	%l6,	%g7
	nop
	set	0x79, %g3
	stb	%i3,	[%l7 + %g3]
	fsrc2s	%f26,	%f17
	fsrc1s	%f0,	%f22
	smul	%l2,	%l5,	%l1
	movrlez	%o7,	%g1,	%i4
	fornot2	%f2,	%f10,	%f22
	edge32n	%g3,	%o6,	%i2
	lduh	[%l7 + 0x24],	%o2
	sra	%l4,	%o4,	%i6
	orn	%l0,	%g4,	%g6
	stw	%i5,	[%l7 + 0x40]
	popc	0x0CB3,	%i0
	st	%f9,	[%l7 + 0x18]
	sth	%l3,	[%l7 + 0x76]
	movleu	%icc,	%i7,	%i1
	fnot2	%f20,	%f22
	srlx	%g2,	%o3,	%g5
	mulscc	%o5,	%o0,	%o1
	srax	%g7,	0x1A,	%l6
	fcmpes	%fcc1,	%f5,	%f9
	movrlez	%i3,	%l2,	%l5
	array8	%o7,	%g1,	%i4
	ldd	[%l7 + 0x30],	%f16
	sth	%g3,	[%l7 + 0x6C]
	movg	%icc,	%o6,	%i2
	sdiv	%l1,	0x1AD6,	%o2
	movcc	%icc,	%o4,	%l4
	movpos	%icc,	%i6,	%l0
	fpmerge	%f3,	%f11,	%f4
	alignaddrl	%g4,	%i5,	%i0
	fmovd	%f4,	%f12
	movge	%icc,	%g6,	%i7
	fabss	%f25,	%f13
	movleu	%xcc,	%i1,	%g2
	fmovspos	%xcc,	%f0,	%f24
	movg	%xcc,	%l3,	%o3
	addccc	%o5,	%g5,	%o0
	restore %g7, 0x1227, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i3,	%l6,	%l2
	sdiv	%o7,	0x0FCD,	%l5
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	edge16l	%i2,	%o6,	%l1
	fnors	%f10,	%f9,	%f10
	edge16n	%o4,	%l4,	%o2
	ldx	[%l7 + 0x20],	%l0
	udiv	%i6,	0x1004,	%g4
	fmovrdgez	%i0,	%f8,	%f18
	lduh	[%l7 + 0x34],	%i5
	ldsh	[%l7 + 0x24],	%g6
	mova	%icc,	%i1,	%i7
	addcc	%l3,	0x1693,	%o3
	array16	%g2,	%o5,	%g5
	movg	%icc,	%o0,	%g7
	fcmpes	%fcc0,	%f1,	%f15
	sll	%i3,	%o1,	%l6
	sub	%l2,	0x0CC4,	%o7
	std	%f2,	[%l7 + 0x60]
	ldd	[%l7 + 0x40],	%f30
	smulcc	%i4,	0x184F,	%g3
	fcmpd	%fcc3,	%f22,	%f4
	ldsb	[%l7 + 0x5C],	%g1
	movvs	%xcc,	%i2,	%o6
	umulcc	%l5,	0x1818,	%l1
	fpadd32	%f26,	%f2,	%f16
	sir	0x15D9
	fmovde	%icc,	%f16,	%f1
	movrlz	%o4,	%l4,	%o2
	xnorcc	%i6,	%g4,	%i0
	subcc	%i5,	0x145C,	%l0
	fcmpeq16	%f4,	%f28,	%i1
	mulscc	%g6,	0x1BA1,	%i7
	xor	%l3,	0x0B57,	%o3
	orcc	%o5,	0x07D9,	%g2
	ldx	[%l7 + 0x08],	%o0
	ldd	[%l7 + 0x20],	%g4
	fnot1s	%f3,	%f5
	umulcc	%i3,	0x168D,	%g7
	addccc	%o1,	%l2,	%l6
	edge8ln	%o7,	%i4,	%g1
	andn	%g3,	%i2,	%o6
	addc	%l5,	%o4,	%l4
	ldsw	[%l7 + 0x70],	%l1
	sir	0x1FE3
	edge16n	%i6,	%o2,	%g4
	xnor	%i5,	0x0A9C,	%i0
	movcc	%icc,	%l0,	%i1
	sdiv	%i7,	0x0F63,	%g6
	edge16n	%o3,	%l3,	%g2
	smulcc	%o0,	%o5,	%g5
	movleu	%xcc,	%i3,	%o1
	popc	0x1C87,	%g7
	pdist	%f0,	%f16,	%f26
	movpos	%xcc,	%l2,	%o7
	xnor	%i4,	%l6,	%g1
	orncc	%i2,	%g3,	%o6
	fxnor	%f22,	%f0,	%f16
	fmuld8sux16	%f26,	%f20,	%f20
	andncc	%l5,	%o4,	%l1
	lduh	[%l7 + 0x60],	%l4
	sra	%i6,	%o2,	%i5
	mulx	%g4,	0x0F5E,	%l0
	udivx	%i0,	0x1931,	%i1
	movvc	%icc,	%g6,	%i7
	movre	%l3,	0x16A,	%o3
	ldsh	[%l7 + 0x44],	%o0
	sllx	%o5,	0x0C,	%g5
	stb	%i3,	[%l7 + 0x26]
	sdiv	%g2,	0x098F,	%o1
	sub	%l2,	%o7,	%g7
	subc	%i4,	0x0C78,	%g1
	fabss	%f3,	%f0
	xorcc	%i2,	%l6,	%o6
	ldd	[%l7 + 0x70],	%f0
	array16	%l5,	%g3,	%l1
	edge32	%l4,	%i6,	%o2
	edge8ln	%o4,	%i5,	%g4
	movn	%icc,	%l0,	%i1
	orncc	%g6,	0x1562,	%i0
	orn	%l3,	0x1F0A,	%i7
	srl	%o3,	0x1B,	%o5
	xnorcc	%g5,	0x07CA,	%o0
	movn	%xcc,	%i3,	%o1
	movle	%xcc,	%l2,	%g2
	lduw	[%l7 + 0x48],	%g7
	fcmps	%fcc2,	%f17,	%f7
	movle	%xcc,	%o7,	%g1
	andncc	%i4,	%i2,	%l6
	bshuffle	%f0,	%f14,	%f4
	subccc	%o6,	%g3,	%l5
	sdiv	%l4,	0x0684,	%l1
	edge32l	%i6,	%o2,	%o4
	restore %i5, %g4, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l0,	[%l7 + 0x0A]
	movleu	%icc,	%g6,	%l3
	fmovsvs	%xcc,	%f3,	%f10
	xor	%i0,	%i7,	%o3
	umulcc	%g5,	0x1CB7,	%o5
	ldsb	[%l7 + 0x77],	%i3
	edge32	%o1,	%o0,	%g2
	movre	%g7,	%l2,	%o7
	fmovsa	%icc,	%f13,	%f19
	edge32l	%i4,	%g1,	%l6
	srlx	%o6,	%i2,	%g3
	fmovsgu	%xcc,	%f18,	%f27
	smul	%l5,	%l4,	%l1
	movvc	%xcc,	%i6,	%o4
	movrlez	%o2,	%i5,	%g4
	edge16n	%l0,	%g6,	%i1
	fnegs	%f21,	%f30
	save %i0, 0x0DE2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1DDB,	%o3
	fzeros	%f9
	subc	%i7,	%o5,	%g5
	sdiv	%i3,	0x06FF,	%o0
	fmul8ulx16	%f20,	%f6,	%f16
	fmul8x16al	%f12,	%f30,	%f14
	movl	%icc,	%o1,	%g7
	addccc	%l2,	%o7,	%i4
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	udivcc	%g2,	0x07D6,	%i2
	smulcc	%g3,	0x16D9,	%o6
	fxor	%f18,	%f8,	%f18
	movl	%icc,	%l4,	%l1
	fmovrse	%l5,	%f29,	%f3
	movrgz	%i6,	%o2,	%i5
	ldsb	[%l7 + 0x29],	%g4
	fmovdgu	%icc,	%f20,	%f26
	alignaddrl	%l0,	%o4,	%g6
	lduh	[%l7 + 0x1E],	%i0
	udivx	%l3,	0x0250,	%o3
	fxnors	%f10,	%f14,	%f21
	fandnot2s	%f18,	%f7,	%f10
	move	%xcc,	%i1,	%o5
	orcc	%i7,	0x051A,	%g5
	udivx	%o0,	0x029C,	%i3
	addccc	%g7,	%o1,	%o7
	movvc	%icc,	%l2,	%i4
	edge32n	%g1,	%g2,	%i2
	edge32l	%g3,	%o6,	%l6
	fmovrsgez	%l4,	%f29,	%f26
	movn	%icc,	%l5,	%i6
	edge32n	%l1,	%i5,	%g4
	movl	%icc,	%o2,	%o4
	mulscc	%g6,	%i0,	%l3
	orcc	%o3,	%l0,	%o5
	subc	%i7,	0x110C,	%i1
	mulx	%g5,	%o0,	%g7
	umul	%o1,	0x1AE8,	%o7
	xnorcc	%l2,	%i4,	%i3
	movrgz	%g1,	%g2,	%i2
	sir	0x1B81
	sllx	%g3,	0x18,	%o6
	sth	%l4,	[%l7 + 0x4A]
	addccc	%l6,	0x1DEB,	%l5
	udivx	%l1,	0x1C97,	%i5
	movg	%xcc,	%i6,	%g4
	fnor	%f12,	%f22,	%f28
	fmovdge	%icc,	%f30,	%f30
	array8	%o4,	%g6,	%o2
	fcmpne16	%f6,	%f24,	%i0
	orcc	%o3,	%l0,	%o5
	faligndata	%f24,	%f0,	%f8
	subccc	%l3,	%i1,	%g5
	fmovdn	%xcc,	%f13,	%f3
	fnot1s	%f8,	%f21
	addc	%i7,	0x0D27,	%o0
	fmovs	%f0,	%f1
	movn	%xcc,	%o1,	%g7
	movcc	%xcc,	%l2,	%o7
	andcc	%i4,	%i3,	%g1
	addccc	%i2,	%g3,	%o6
	movn	%icc,	%l4,	%g2
	fmovscs	%xcc,	%f28,	%f20
	sdivcc	%l6,	0x0478,	%l1
	move	%xcc,	%i5,	%l5
	save %i6, 0x02BD, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%g6,	%f5,	%f16
	andn	%g4,	%o2,	%i0
	subcc	%l0,	%o5,	%o3
	smulcc	%l3,	%i1,	%i7
	edge8	%o0,	%o1,	%g5
	array8	%l2,	%g7,	%i4
	array8	%o7,	%g1,	%i3
	ldsb	[%l7 + 0x33],	%i2
	fabsd	%f8,	%f24
	subccc	%o6,	%g3,	%g2
	move	%icc,	%l6,	%l1
	umul	%i5,	%l4,	%i6
	movgu	%xcc,	%o4,	%g6
	save %g4, 0x1A95, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f9
	edge32n	%i0,	%l0,	%o5
	fones	%f13
	subc	%o3,	%l3,	%i1
	subccc	%i7,	0x0C94,	%o2
	fnot1	%f6,	%f10
	srl	%o1,	%g5,	%o0
	fmovdneg	%icc,	%f20,	%f4
	nop
	set	0x17, %o0
	ldub	[%l7 + %o0],	%g7
	fcmpd	%fcc1,	%f24,	%f30
	movrgz	%i4,	0x299,	%o7
	edge8l	%l2,	%i3,	%g1
	orncc	%o6,	0x1D1E,	%g3
	add	%i2,	0x0BFC,	%g2
	xnorcc	%l6,	%i5,	%l1
	pdist	%f8,	%f6,	%f2
	sth	%l4,	[%l7 + 0x5A]
	addccc	%o4,	%i6,	%g4
	fmovsn	%xcc,	%f12,	%f18
	fmovse	%xcc,	%f26,	%f31
	ldd	[%l7 + 0x18],	%f18
	ldd	[%l7 + 0x08],	%g6
	fmovdl	%icc,	%f8,	%f6
	sethi	0x0B7C,	%l5
	move	%xcc,	%l0,	%o5
	fmovsgu	%icc,	%f12,	%f15
	ldsb	[%l7 + 0x71],	%i0
	edge8	%l3,	%i1,	%o3
	edge32l	%o2,	%i7,	%g5
	fmovse	%icc,	%f6,	%f4
	lduh	[%l7 + 0x58],	%o1
	movre	%g7,	%i4,	%o7
	umul	%l2,	0x16F4,	%o0
	fmovrdlez	%i3,	%f6,	%f0
	fpmerge	%f27,	%f17,	%f18
	sir	0x1EF8
	restore %o6, %g3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g2,	0x1626,	%l6
	fmul8ulx16	%f30,	%f20,	%f8
	fmovrdlz	%i5,	%f20,	%f14
	fmovsgu	%icc,	%f6,	%f29
	ldd	[%l7 + 0x40],	%f8
	fmovsl	%icc,	%f26,	%f18
	sth	%l1,	[%l7 + 0x42]
	sdivcc	%l4,	0x1083,	%g1
	edge16l	%o4,	%i6,	%g4
	array32	%l5,	%g6,	%l0
	sdiv	%o5,	0x0F67,	%l3
	sdivcc	%i1,	0x17B4,	%i0
	siam	0x6
	nop
	set	0x34, %i7
	ldsw	[%l7 + %i7],	%o3
	popc	%o2,	%g5
	fmovrse	%i7,	%f20,	%f22
	move	%xcc,	%g7,	%i4
	mova	%icc,	%o7,	%l2
	srl	%o1,	0x0F,	%o0
	edge8	%i3,	%o6,	%g3
	fcmpgt32	%f26,	%f16,	%g2
	xnor	%i2,	0x1B65,	%i5
	sllx	%l1,	%l4,	%l6
	fmovda	%xcc,	%f31,	%f18
	fmovdneg	%icc,	%f21,	%f21
	std	%f24,	[%l7 + 0x18]
	movcs	%xcc,	%g1,	%i6
	alignaddr	%o4,	%g4,	%l5
	fnot1s	%f2,	%f0
	movrne	%l0,	%g6,	%l3
	smul	%o5,	%i1,	%o3
	movvc	%icc,	%i0,	%o2
	sdiv	%g5,	0x1737,	%g7
	ldub	[%l7 + 0x0A],	%i4
	movl	%xcc,	%i7,	%l2
	fmovda	%icc,	%f24,	%f15
	add	%o1,	0x0965,	%o0
	umul	%i3,	0x12FA,	%o7
	edge32	%o6,	%g3,	%i2
	stx	%g2,	[%l7 + 0x48]
	nop
	set	0x7F, %l6
	stb	%i5,	[%l7 + %l6]
	sdivx	%l1,	0x007A,	%l4
	edge8ln	%g1,	%l6,	%i6
	movrgz	%o4,	0x23F,	%g4
	ldd	[%l7 + 0x60],	%l0
	fpadd32	%f28,	%f22,	%f4
	orncc	%g6,	0x1EDC,	%l5
	add	%l3,	0x0D0A,	%o5
	addccc	%i1,	0x0503,	%o3
	ldx	[%l7 + 0x30],	%o2
	fsrc2	%f4,	%f2
	movg	%xcc,	%i0,	%g7
	fsrc2	%f2,	%f4
	fandnot1	%f24,	%f16,	%f4
	fmovde	%icc,	%f18,	%f3
	movcc	%xcc,	%g5,	%i4
	fmovspos	%xcc,	%f17,	%f16
	edge16ln	%i7,	%l2,	%o0
	orncc	%i3,	0x0DAD,	%o7
	edge8l	%o6,	%o1,	%g3
	sir	0x12C4
	alignaddr	%i2,	%g2,	%l1
	movleu	%xcc,	%i5,	%l4
	fcmpeq32	%f22,	%f10,	%l6
	nop
	set	0x4A, %l1
	stb	%g1,	[%l7 + %l1]
	fsrc1s	%f26,	%f0
	movcc	%xcc,	%i6,	%g4
	movl	%xcc,	%o4,	%g6
	fmovrslz	%l0,	%f13,	%f2
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	sub	%o3,	0x00F4,	%o2
	movg	%xcc,	%i0,	%g7
	fcmpgt16	%f4,	%f24,	%g5
	edge32n	%i4,	%i7,	%i1
	movn	%xcc,	%o0,	%i3
	stb	%o7,	[%l7 + 0x5E]
	ldd	[%l7 + 0x68],	%l2
	sdiv	%o1,	0x1487,	%o6
	movle	%icc,	%i2,	%g2
	ldsw	[%l7 + 0x5C],	%l1
	lduw	[%l7 + 0x10],	%i5
	xor	%g3,	%l6,	%g1
	xnor	%l4,	%i6,	%o4
	andcc	%g6,	0x0A15,	%g4
	sll	%l3,	%l0,	%o5
	fmovd	%f6,	%f6
	andcc	%o3,	0x1450,	%l5
	srlx	%o2,	0x14,	%g7
	edge8	%i0,	%g5,	%i4
	nop
	set	0x2C, %l3
	ldsb	[%l7 + %l3],	%i1
	movn	%xcc,	%i7,	%i3
	array16	%o7,	%o0,	%o1
	add	%l2,	%o6,	%i2
	fmovdvc	%icc,	%f13,	%f23
	movre	%l1,	0x202,	%g2
	edge32ln	%i5,	%l6,	%g3
	fone	%f6
	fmovdle	%xcc,	%f2,	%f24
	add	%g1,	0x17FB,	%l4
	ldsh	[%l7 + 0x7A],	%o4
	array16	%i6,	%g4,	%g6
	umul	%l3,	0x00D7,	%l0
	umulcc	%o3,	%o5,	%o2
	xor	%g7,	0x0FFB,	%i0
	fmovda	%xcc,	%f0,	%f0
	edge16ln	%l5,	%i4,	%g5
	movrlz	%i7,	%i1,	%o7
	st	%f12,	[%l7 + 0x44]
	addccc	%i3,	0x1EA2,	%o0
	xnor	%o1,	%l2,	%i2
	fmovdg	%icc,	%f17,	%f5
	fcmpne32	%f4,	%f28,	%l1
	andncc	%g2,	%o6,	%l6
	fones	%f21
	umul	%i5,	0x131A,	%g3
	stw	%l4,	[%l7 + 0x7C]
	array8	%g1,	%i6,	%o4
	fcmple16	%f12,	%f16,	%g4
	xnor	%l3,	%l0,	%o3
	array8	%o5,	%g6,	%o2
	ldsb	[%l7 + 0x75],	%i0
	fmovrdgez	%l5,	%f20,	%f26
	movn	%icc,	%i4,	%g5
	ldsb	[%l7 + 0x45],	%i7
	lduw	[%l7 + 0x54],	%g7
	mulx	%o7,	0x0111,	%i1
	xnor	%i3,	%o1,	%l2
	save %i2, %o0, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o6,	%l6
	addccc	%g2,	%i5,	%g3
	edge8ln	%g1,	%i6,	%o4
	movgu	%icc,	%g4,	%l4
	sra	%l0,	%o3,	%l3
	add	%o5,	%g6,	%o2
	bshuffle	%f26,	%f20,	%f4
	movrlez	%i0,	0x2A2,	%i4
	ldx	[%l7 + 0x08],	%g5
	subc	%i7,	0x043C,	%l5
	array32	%g7,	%o7,	%i1
	movrne	%i3,	%l2,	%i2
	sethi	0x0D49,	%o1
	subccc	%o0,	%l1,	%l6
	mulx	%o6,	%g2,	%g3
	fpadd16	%f4,	%f4,	%f30
	lduh	[%l7 + 0x6C],	%i5
	alignaddr	%g1,	%o4,	%g4
	fmovsg	%xcc,	%f16,	%f11
	movrgez	%i6,	0x283,	%l0
	sllx	%o3,	0x03,	%l3
	move	%icc,	%l4,	%g6
	st	%f2,	[%l7 + 0x68]
	subc	%o2,	%i0,	%o5
	fpack16	%f22,	%f17
	edge8ln	%g5,	%i7,	%i4
	addc	%g7,	0x1604,	%o7
	movre	%i1,	0x01C,	%i3
	orncc	%l5,	%i2,	%o1
	xnor	%o0,	%l1,	%l2
	fnot2s	%f8,	%f6
	edge32	%o6,	%l6,	%g2
	udivcc	%i5,	0x035B,	%g1
	mova	%icc,	%o4,	%g3
	fzeros	%f28
	stx	%i6,	[%l7 + 0x18]
	sll	%l0,	0x05,	%g4
	movne	%xcc,	%l3,	%l4
	fcmpgt32	%f14,	%f4,	%g6
	sth	%o3,	[%l7 + 0x08]
	st	%f31,	[%l7 + 0x5C]
	umulcc	%i0,	%o5,	%g5
	fnot1	%f4,	%f14
	mova	%icc,	%o2,	%i4
	st	%f14,	[%l7 + 0x40]
	popc	%g7,	%i7
	orncc	%o7,	%i3,	%l5
	andn	%i1,	%o1,	%o0
	sdivcc	%i2,	0x0032,	%l1
	xorcc	%l2,	0x1013,	%o6
	edge8n	%l6,	%i5,	%g1
	addcc	%o4,	%g3,	%g2
	sethi	0x0BB7,	%i6
	ldub	[%l7 + 0x4C],	%g4
	fcmpne32	%f6,	%f10,	%l0
	ldsw	[%l7 + 0x48],	%l3
	sll	%l4,	0x06,	%g6
	sll	%i0,	0x13,	%o3
	movrlz	%g5,	%o5,	%i4
	movvc	%icc,	%o2,	%g7
	edge16n	%i7,	%o7,	%i3
	mulx	%i1,	0x0A77,	%l5
	edge8ln	%o0,	%o1,	%l1
	stx	%i2,	[%l7 + 0x38]
	orn	%o6,	0x1B4C,	%l6
	subccc	%l2,	0x1238,	%i5
	addc	%g1,	0x100E,	%g3
	umul	%g2,	0x14FA,	%i6
	faligndata	%f22,	%f18,	%f4
	srl	%o4,	0x0F,	%l0
	fmovsgu	%xcc,	%f9,	%f22
	srax	%g4,	%l4,	%g6
	or	%i0,	%o3,	%g5
	fmovsleu	%xcc,	%f2,	%f20
	ldsw	[%l7 + 0x58],	%o5
	sll	%i4,	%l3,	%g7
	andncc	%i7,	%o2,	%o7
	sdivcc	%i3,	0x0A0C,	%l5
	fmul8sux16	%f26,	%f28,	%f12
	movgu	%icc,	%o0,	%o1
	edge32n	%l1,	%i2,	%i1
	fcmpeq32	%f12,	%f4,	%o6
	fmovsn	%xcc,	%f1,	%f4
	movge	%xcc,	%l6,	%l2
	movre	%g1,	%g3,	%i5
	fnor	%f24,	%f18,	%f10
	fors	%f3,	%f29,	%f25
	mulscc	%i6,	0x1194,	%g2
	sethi	0x0AE8,	%l0
	edge16ln	%g4,	%o4,	%l4
	fnot1	%f0,	%f8
	movpos	%icc,	%g6,	%i0
	subc	%o3,	0x1BE2,	%g5
	fmovrdgz	%o5,	%f22,	%f16
	subccc	%l3,	%i4,	%g7
	std	%f2,	[%l7 + 0x50]
	fnot1s	%f25,	%f2
	orcc	%i7,	%o7,	%i3
	movn	%icc,	%o2,	%o0
	fmovsne	%xcc,	%f3,	%f16
	alignaddrl	%l5,	%l1,	%i2
	fsrc1s	%f25,	%f5
	addc	%i1,	0x14CA,	%o6
	array16	%o1,	%l6,	%g1
	fmul8x16	%f27,	%f4,	%f6
	fnot2s	%f23,	%f9
	fcmps	%fcc3,	%f26,	%f9
	xnor	%g3,	0x15D0,	%i5
	fpadd16	%f22,	%f12,	%f2
	xor	%l2,	0x011E,	%i6
	edge8n	%l0,	%g4,	%o4
	xnorcc	%g2,	%g6,	%i0
	edge32n	%o3,	%g5,	%l4
	edge8n	%l3,	%i4,	%o5
	sir	0x0025
	addcc	%g7,	%i7,	%o7
	edge8ln	%i3,	%o0,	%o2
	fnands	%f5,	%f29,	%f28
	movrgez	%l5,	0x329,	%l1
	stw	%i1,	[%l7 + 0x68]
	fsrc2s	%f10,	%f28
	fcmped	%fcc1,	%f24,	%f2
	umul	%o6,	0x0C14,	%o1
	addcc	%l6,	%i2,	%g3
	add	%i5,	0x0A03,	%g1
	alignaddr	%l2,	%i6,	%l0
	subccc	%g4,	%g2,	%o4
	fmovd	%f22,	%f20
	alignaddrl	%i0,	%g6,	%g5
	fmovrsne	%o3,	%f4,	%f18
	movrgez	%l3,	0x345,	%i4
	andcc	%o5,	%l4,	%i7
	movvs	%xcc,	%o7,	%i3
	fand	%f26,	%f0,	%f22
	xnorcc	%g7,	%o2,	%l5
	fpackfix	%f6,	%f19
	fmuld8ulx16	%f30,	%f9,	%f0
	move	%xcc,	%o0,	%l1
	fmovsl	%icc,	%f30,	%f7
	fnot2s	%f17,	%f10
	addc	%i1,	0x1064,	%o1
	array32	%o6,	%l6,	%i2
	andcc	%g3,	0x1BB0,	%g1
	fands	%f15,	%f21,	%f12
	movre	%i5,	0x3D8,	%l2
	sth	%i6,	[%l7 + 0x38]
	movrlez	%l0,	0x043,	%g4
	stx	%o4,	[%l7 + 0x10]
	subc	%i0,	%g6,	%g5
	movpos	%icc,	%g2,	%l3
	addc	%i4,	%o3,	%o5
	srax	%l4,	%i7,	%i3
	fmovdg	%xcc,	%f12,	%f0
	srlx	%g7,	0x10,	%o2
	faligndata	%f0,	%f8,	%f22
	ldub	[%l7 + 0x0C],	%l5
	fandnot1	%f26,	%f28,	%f14
	lduh	[%l7 + 0x22],	%o7
	srl	%o0,	%l1,	%o1
	pdist	%f30,	%f28,	%f22
	xnor	%i1,	%l6,	%o6
	andn	%i2,	%g3,	%i5
	or	%l2,	%i6,	%g1
	or	%l0,	0x0626,	%o4
	fmovrde	%i0,	%f6,	%f30
	edge16n	%g6,	%g4,	%g5
	movcs	%icc,	%g2,	%l3
	sdiv	%o3,	0x10E2,	%o5
	movcs	%icc,	%l4,	%i7
	sdivcc	%i4,	0x0B7A,	%g7
	xnor	%o2,	0x00D7,	%l5
	fmuld8sux16	%f20,	%f17,	%f18
	stx	%i3,	[%l7 + 0x48]
	move	%icc,	%o7,	%l1
	orcc	%o1,	%i1,	%l6
	edge8ln	%o0,	%o6,	%g3
	smul	%i5,	0x0952,	%i2
	edge8ln	%l2,	%g1,	%l0
	movleu	%icc,	%i6,	%i0
	lduw	[%l7 + 0x70],	%o4
	movle	%xcc,	%g4,	%g5
	ldsb	[%l7 + 0x0D],	%g6
	edge16n	%g2,	%o3,	%o5
	mova	%icc,	%l4,	%i7
	movrlez	%i4,	%g7,	%l3
	edge16ln	%l5,	%i3,	%o7
	fmovda	%xcc,	%f13,	%f14
	movn	%xcc,	%o2,	%o1
	movcc	%icc,	%i1,	%l1
	udivcc	%o0,	0x09B6,	%o6
	mulscc	%l6,	%i5,	%g3
	fmovdne	%icc,	%f9,	%f29
	fmovsa	%xcc,	%f13,	%f5
	stb	%i2,	[%l7 + 0x7B]
	alignaddrl	%l2,	%g1,	%l0
	fandnot2s	%f2,	%f17,	%f30
	edge8l	%i0,	%i6,	%g4
	ldub	[%l7 + 0x4E],	%g5
	sethi	0x1E2D,	%g6
	fornot2s	%f26,	%f24,	%f2
	st	%f8,	[%l7 + 0x14]
	movle	%icc,	%o4,	%o3
	sllx	%o5,	0x07,	%l4
	movvc	%xcc,	%i7,	%g2
	movle	%icc,	%g7,	%l3
	fmul8x16au	%f8,	%f3,	%f12
	fmuld8sux16	%f26,	%f10,	%f30
	fnot2	%f18,	%f4
	fnot1	%f8,	%f8
	sethi	0x1F0B,	%i4
	movg	%icc,	%l5,	%o7
	andn	%i3,	%o2,	%i1
	movcc	%xcc,	%l1,	%o1
	nop
	set	0x36, %g2
	ldsh	[%l7 + %g2],	%o6
	lduh	[%l7 + 0x60],	%l6
	lduw	[%l7 + 0x20],	%o0
	orn	%i5,	%i2,	%g3
	ldsw	[%l7 + 0x3C],	%l2
	fpack32	%f14,	%f18,	%f12
	mulscc	%g1,	0x0B99,	%l0
	xnorcc	%i0,	%g4,	%g5
	fmovsleu	%xcc,	%f20,	%f14
	add	%g6,	0x0044,	%o4
	fandnot1s	%f22,	%f17,	%f31
	stx	%i6,	[%l7 + 0x20]
	ldd	[%l7 + 0x58],	%f2
	sub	%o5,	%l4,	%o3
	edge16l	%i7,	%g7,	%g2
	restore %l3, 0x0C40, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%l5,	[%l7 + 0x34]
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%f26
	fandnot2s	%f19,	%f11,	%f15
	add	%i3,	%o2,	%o7
	fabsd	%f24,	%f18
	subccc	%l1,	0x19D2,	%o1
	srax	%i1,	0x0E,	%o6
	fmovdl	%icc,	%f26,	%f11
	edge32ln	%o0,	%i5,	%l6
	orn	%i2,	0x1600,	%l2
	sll	%g3,	%l0,	%i0
	movcs	%xcc,	%g1,	%g5
	fmul8ulx16	%f22,	%f8,	%f6
	array16	%g4,	%g6,	%o4
	ldub	[%l7 + 0x44],	%i6
	edge32l	%l4,	%o3,	%o5
	srl	%i7,	0x06,	%g7
	movvs	%xcc,	%l3,	%g2
	fmovdge	%xcc,	%f22,	%f3
	nop
	set	0x18, %i4
	std	%f20,	[%l7 + %i4]
	srax	%l5,	0x0A,	%i3
	edge32	%i4,	%o7,	%l1
	fnot2	%f22,	%f30
	lduw	[%l7 + 0x34],	%o2
	std	%f24,	[%l7 + 0x60]
	sllx	%i1,	%o1,	%o6
	st	%f25,	[%l7 + 0x60]
	xnorcc	%i5,	%l6,	%i2
	fpadd32	%f22,	%f20,	%f26
	fnot2s	%f19,	%f28
	edge16ln	%o0,	%g3,	%l0
	st	%f29,	[%l7 + 0x68]
	fmovda	%xcc,	%f15,	%f24
	srax	%l2,	%i0,	%g5
	ldsh	[%l7 + 0x7C],	%g1
	mulscc	%g6,	0x0B0F,	%g4
	edge32	%i6,	%o4,	%o3
	movrne	%o5,	0x091,	%i7
	stx	%g7,	[%l7 + 0x28]
	movvs	%xcc,	%l3,	%g2
	mulx	%l4,	%l5,	%i3
	nop
	set	0x40, %i6
	stx	%i4,	[%l7 + %i6]
	movl	%icc,	%l1,	%o7
	edge16l	%o2,	%i1,	%o6
	fxnors	%f21,	%f28,	%f8
	udivcc	%o1,	0x0319,	%i5
	fnot2s	%f18,	%f22
	xor	%l6,	0x12B2,	%i2
	st	%f20,	[%l7 + 0x70]
	fmul8x16al	%f11,	%f27,	%f18
	sllx	%o0,	%l0,	%l2
	fmovrsne	%i0,	%f29,	%f31
	fandnot1s	%f9,	%f10,	%f16
	lduw	[%l7 + 0x5C],	%g5
	fmovdcc	%icc,	%f6,	%f30
	movre	%g3,	%g1,	%g4
	fors	%f19,	%f10,	%f27
	edge16n	%i6,	%g6,	%o4
	mulx	%o3,	%o5,	%i7
	movrne	%g7,	%g2,	%l4
	edge32n	%l3,	%l5,	%i4
	andcc	%i3,	%l1,	%o7
	fmuld8ulx16	%f14,	%f8,	%f20
	lduh	[%l7 + 0x5E],	%i1
	udivcc	%o6,	0x09D9,	%o1
	sethi	0x1598,	%i5
	sll	%l6,	0x0C,	%i2
	andncc	%o2,	%l0,	%l2
	edge8	%o0,	%i0,	%g5
	movcc	%icc,	%g3,	%g1
	fmovsge	%xcc,	%f9,	%f18
	fmovrdne	%g4,	%f26,	%f10
	move	%xcc,	%g6,	%i6
	movrgez	%o4,	%o5,	%i7
	srl	%g7,	%o3,	%l4
	movrlz	%g2,	0x390,	%l5
	orncc	%l3,	0x0ADF,	%i4
	movneg	%icc,	%i3,	%l1
	fnand	%f8,	%f4,	%f14
	std	%f28,	[%l7 + 0x78]
	movgu	%xcc,	%o7,	%o6
	ldd	[%l7 + 0x28],	%f4
	fmovsle	%icc,	%f26,	%f20
	movn	%xcc,	%o1,	%i1
	edge16n	%i5,	%l6,	%i2
	movrgez	%l0,	0x205,	%o2
	movre	%o0,	0x215,	%l2
	xnorcc	%g5,	0x0E2D,	%g3
	andncc	%i0,	%g1,	%g4
	fmovsleu	%xcc,	%f11,	%f15
	sll	%g6,	0x16,	%o4
	ldub	[%l7 + 0x36],	%i6
	sdiv	%i7,	0x05A6,	%o5
	udivcc	%g7,	0x0897,	%l4
	edge16l	%g2,	%o3,	%l5
	fmul8x16al	%f25,	%f7,	%f28
	fmovdneg	%icc,	%f23,	%f21
	movgu	%xcc,	%i4,	%l3
	array32	%l1,	%o7,	%o6
	orn	%i3,	0x1F64,	%i1
	edge32ln	%o1,	%i5,	%i2
	umulcc	%l6,	0x0055,	%l0
	fandnot1s	%f3,	%f19,	%f20
	fpadd32	%f4,	%f14,	%f16
	std	%f22,	[%l7 + 0x10]
	fxors	%f26,	%f19,	%f21
	pdist	%f20,	%f14,	%f28
	movg	%xcc,	%o2,	%l2
	movpos	%xcc,	%o0,	%g3
	faligndata	%f22,	%f30,	%f22
	ldsb	[%l7 + 0x66],	%g5
	mova	%xcc,	%i0,	%g4
	fmovsneg	%icc,	%f31,	%f15
	movrlez	%g6,	0x034,	%g1
	popc	0x0069,	%i6
	addccc	%i7,	%o5,	%o4
	stx	%g7,	[%l7 + 0x10]
	std	%f14,	[%l7 + 0x08]
	udiv	%g2,	0x1431,	%l4
	fnot1s	%f23,	%f3
	st	%f31,	[%l7 + 0x68]
	ldd	[%l7 + 0x28],	%f30
	fmovs	%f12,	%f13
	save %o3, %i4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l1,	[%l7 + 0x1A]
	fmul8ulx16	%f10,	%f12,	%f26
	fmovrslez	%l3,	%f16,	%f1
	xnorcc	%o6,	%i3,	%i1
	fpsub32	%f30,	%f8,	%f16
	ldd	[%l7 + 0x60],	%f16
	edge32	%o7,	%i5,	%i2
	orncc	%l6,	0x004D,	%o1
	ld	[%l7 + 0x40],	%f14
	xnorcc	%o2,	0x1EF6,	%l0
	srax	%l2,	%g3,	%g5
	ld	[%l7 + 0x30],	%f18
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	fmovdpos	%xcc,	%f10,	%f9
	mulx	%g6,	%i0,	%g1
	fmovrse	%i7,	%f17,	%f12
	andncc	%i6,	%o4,	%g7
	sub	%o5,	%l4,	%o3
	nop
	set	0x4E, %o2
	ldsh	[%l7 + %o2],	%g2
	st	%f22,	[%l7 + 0x3C]
	edge32n	%l5,	%l1,	%l3
	fornot1s	%f29,	%f5,	%f8
	fmovrdlez	%o6,	%f10,	%f22
	stw	%i3,	[%l7 + 0x18]
	movcc	%xcc,	%i1,	%i4
	sllx	%o7,	%i2,	%l6
	sll	%o1,	%i5,	%o2
	movge	%xcc,	%l2,	%l0
	ldsb	[%l7 + 0x17],	%g5
	array32	%o0,	%g3,	%g6
	movpos	%xcc,	%i0,	%g1
	edge32n	%i7,	%i6,	%g4
	udivcc	%o4,	0x0276,	%g7
	lduh	[%l7 + 0x46],	%l4
	add	%o3,	0x04AD,	%g2
	fmovrdgz	%o5,	%f24,	%f26
	edge8l	%l5,	%l1,	%l3
	fmovdg	%xcc,	%f20,	%f25
	fpsub32s	%f0,	%f16,	%f20
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%i2
	lduh	[%l7 + 0x78],	%o6
	xnor	%i1,	%o7,	%i2
	addccc	%l6,	%o1,	%i4
	nop
	set	0x70, %g6
	lduw	[%l7 + %g6],	%o2
	mulx	%i5,	%l2,	%l0
	edge8	%g5,	%g3,	%g6
	srlx	%o0,	%i0,	%i7
	fmovrde	%g1,	%f0,	%f22
	fmovsvs	%icc,	%f28,	%f2
	edge8	%i6,	%o4,	%g4
	fmovsa	%icc,	%f14,	%f12
	fmovde	%icc,	%f5,	%f8
	edge8n	%l4,	%o3,	%g7
	sub	%g2,	0x0437,	%o5
	ld	[%l7 + 0x1C],	%f5
	sllx	%l1,	%l5,	%i3
	add	%o6,	0x1C7D,	%i1
	fmovrdne	%o7,	%f6,	%f30
	movrlez	%l3,	%i2,	%l6
	edge16ln	%i4,	%o2,	%o1
	fmovspos	%icc,	%f3,	%f29
	stw	%i5,	[%l7 + 0x20]
	subc	%l0,	0x097A,	%g5
	mova	%xcc,	%l2,	%g6
	fnegs	%f25,	%f17
	ldsb	[%l7 + 0x1F],	%g3
	lduw	[%l7 + 0x2C],	%i0
	array16	%o0,	%g1,	%i7
	xorcc	%i6,	0x0CBA,	%g4
	ld	[%l7 + 0x7C],	%f27
	movleu	%xcc,	%l4,	%o4
	edge16ln	%o3,	%g2,	%g7
	movleu	%icc,	%o5,	%l5
	std	%f26,	[%l7 + 0x50]
	udivcc	%l1,	0x0650,	%o6
	movvc	%icc,	%i1,	%o7
	sll	%l3,	%i3,	%i2
	edge8	%l6,	%o2,	%i4
	movrne	%i5,	%o1,	%l0
	movgu	%xcc,	%g5,	%g6
	srl	%l2,	0x1C,	%i0
	movrlez	%o0,	0x17A,	%g3
	xnorcc	%g1,	%i6,	%i7
	edge32n	%l4,	%g4,	%o4
	movrgz	%o3,	%g7,	%o5
	srl	%l5,	0x04,	%l1
	movg	%icc,	%g2,	%o6
	movrne	%o7,	0x0CE,	%i1
	stw	%i3,	[%l7 + 0x10]
	add	%l3,	%l6,	%o2
	fnot2s	%f28,	%f29
	sdivx	%i2,	0x15B5,	%i4
	popc	%i5,	%l0
	mulx	%o1,	0x0DC4,	%g5
	fnors	%f8,	%f28,	%f3
	fmovdgu	%icc,	%f20,	%f16
	movl	%icc,	%l2,	%i0
	fmovrse	%g6,	%f17,	%f1
	alignaddr	%o0,	%g3,	%g1
	fnegd	%f12,	%f12
	fmul8x16	%f28,	%f0,	%f12
	movpos	%xcc,	%i6,	%i7
	lduh	[%l7 + 0x56],	%l4
	save %o4, 0x00AE, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%g7,	%o5
	movpos	%icc,	%g4,	%l1
	smulcc	%l5,	0x1387,	%g2
	fxnors	%f29,	%f31,	%f31
	ldd	[%l7 + 0x48],	%f24
	sllx	%o7,	0x0C,	%i1
	addccc	%i3,	%o6,	%l3
	fmovsvc	%icc,	%f12,	%f30
	ldx	[%l7 + 0x20],	%l6
	andn	%i2,	0x129A,	%i4
	subccc	%o2,	%i5,	%l0
	edge16	%g5,	%o1,	%l2
	movrne	%i0,	%g6,	%g3
	lduw	[%l7 + 0x08],	%o0
	mulx	%i6,	%i7,	%g1
	fpack32	%f26,	%f8,	%f28
	ldsb	[%l7 + 0x7F],	%l4
	fxnors	%f13,	%f9,	%f16
	movrgz	%o4,	%g7,	%o3
	std	%f8,	[%l7 + 0x78]
	xnor	%g4,	0x17F3,	%o5
	restore %l5, %g2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l1,	0x1C40,	%i1
	movrne	%i3,	%l3,	%l6
	add	%o6,	0x10FA,	%i2
	save %o2, 0x000F, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i5,	%l0,	%g5
	movrlez	%l2,	0x1F4,	%o1
	ld	[%l7 + 0x28],	%f28
	addc	%g6,	%g3,	%i0
	movn	%xcc,	%o0,	%i6
	edge32l	%i7,	%g1,	%l4
	alignaddrl	%g7,	%o3,	%o4
	movg	%icc,	%g4,	%o5
	udivx	%l5,	0x1989,	%g2
	edge32n	%o7,	%i1,	%l1
	nop
	set	0x30, %l2
	stx	%i3,	[%l7 + %l2]
	movpos	%icc,	%l3,	%o6
	sdivcc	%i2,	0x10C3,	%o2
	fcmple32	%f14,	%f10,	%i4
	siam	0x3
	fandnot2	%f20,	%f28,	%f6
	stw	%i5,	[%l7 + 0x74]
	stb	%l0,	[%l7 + 0x37]
	edge32n	%l6,	%g5,	%l2
	sra	%g6,	0x11,	%o1
	ldsb	[%l7 + 0x7B],	%i0
	siam	0x6
	sdivx	%o0,	0x0F50,	%i6
	orn	%i7,	0x11E6,	%g1
	movrne	%g3,	0x22E,	%l4
	sdivcc	%g7,	0x03BE,	%o3
	fmovdpos	%icc,	%f4,	%f24
	ldsw	[%l7 + 0x2C],	%o4
	and	%o5,	%l5,	%g2
	srax	%o7,	%i1,	%g4
	sth	%i3,	[%l7 + 0x36]
	fornot1	%f28,	%f6,	%f26
	andcc	%l3,	0x0A61,	%o6
	popc	0x128D,	%i2
	srax	%l1,	0x13,	%o2
	addccc	%i4,	%l0,	%i5
	xnorcc	%g5,	%l2,	%g6
	fmovrdlz	%l6,	%f16,	%f30
	array16	%i0,	%o1,	%o0
	fpsub16	%f2,	%f18,	%f30
	fmovdl	%xcc,	%f17,	%f27
	array16	%i7,	%i6,	%g1
	edge32	%g3,	%g7,	%l4
	edge8	%o4,	%o5,	%l5
	subccc	%o3,	0x188F,	%o7
	edge32ln	%g2,	%i1,	%i3
	fmovdgu	%xcc,	%f8,	%f24
	udivcc	%g4,	0x05C0,	%l3
	addcc	%i2,	0x188A,	%l1
	movre	%o6,	0x016,	%o2
	lduw	[%l7 + 0x28],	%i4
	udivx	%i5,	0x069F,	%g5
	srax	%l0,	%g6,	%l2
	xnor	%i0,	%l6,	%o1
	xnor	%i7,	0x1DD4,	%i6
	st	%f9,	[%l7 + 0x2C]
	sub	%g1,	0x0BB8,	%o0
	orncc	%g7,	%g3,	%l4
	ldd	[%l7 + 0x50],	%f10
	fmul8x16	%f20,	%f14,	%f26
	move	%xcc,	%o5,	%l5
	movvs	%icc,	%o3,	%o7
	fnands	%f4,	%f22,	%f4
	fmovdl	%icc,	%f25,	%f9
	orn	%o4,	0x0948,	%g2
	sth	%i3,	[%l7 + 0x70]
	sth	%i1,	[%l7 + 0x54]
	ldd	[%l7 + 0x08],	%l2
	movleu	%xcc,	%g4,	%i2
	umulcc	%l1,	0x14B0,	%o6
	sir	0x1D7F
	ldub	[%l7 + 0x26],	%o2
	umul	%i5,	0x0ABF,	%i4
	fcmpgt32	%f10,	%f6,	%l0
	edge8ln	%g5,	%g6,	%i0
	popc	0x0370,	%l2
	array32	%l6,	%i7,	%o1
	udivcc	%i6,	0x1CBE,	%g1
	ldx	[%l7 + 0x38],	%g7
	edge8n	%o0,	%l4,	%g3
	subcc	%l5,	%o5,	%o3
	sdiv	%o7,	0x0F74,	%o4
	sra	%g2,	%i3,	%i1
	fmovdge	%icc,	%f6,	%f31
	fmuld8ulx16	%f13,	%f7,	%f4
	or	%l3,	%i2,	%l1
	fandnot1s	%f23,	%f10,	%f2
	fmuld8sux16	%f4,	%f23,	%f12
	save %g4, %o2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i5,	0x1225,	%l0
	movrlz	%g5,	0x075,	%g6
	move	%icc,	%i4,	%i0
	movrlz	%l6,	%l2,	%o1
	fmovrse	%i7,	%f30,	%f23
	fmovd	%f24,	%f16
	sll	%i6,	%g7,	%g1
	movg	%icc,	%o0,	%g3
	fmuld8ulx16	%f14,	%f3,	%f20
	popc	%l4,	%o5
	xnorcc	%o3,	0x13C7,	%o7
	srax	%l5,	%o4,	%g2
	movcc	%icc,	%i1,	%i3
	ldsh	[%l7 + 0x52],	%l3
	sra	%i2,	%g4,	%o2
	movrlz	%o6,	%i5,	%l1
	fmovs	%f9,	%f4
	or	%g5,	%l0,	%g6
	stb	%i4,	[%l7 + 0x73]
	udivcc	%i0,	0x01D0,	%l6
	movg	%xcc,	%l2,	%o1
	orncc	%i7,	%i6,	%g7
	array16	%g1,	%o0,	%l4
	movgu	%icc,	%g3,	%o3
	and	%o7,	%o5,	%l5
	subcc	%o4,	%i1,	%g2
	ldsb	[%l7 + 0x6C],	%i3
	movl	%xcc,	%i2,	%l3
	faligndata	%f26,	%f22,	%f28
	sllx	%g4,	%o6,	%i5
	array16	%l1,	%o2,	%l0
	orcc	%g6,	%i4,	%i0
	fmuld8ulx16	%f21,	%f2,	%f12
	sdivcc	%g5,	0x160E,	%l2
	movcs	%xcc,	%o1,	%l6
	ld	[%l7 + 0x0C],	%f3
	fmovdcs	%icc,	%f13,	%f16
	fors	%f16,	%f26,	%f9
	sllx	%i7,	0x0D,	%g7
	edge32n	%g1,	%o0,	%i6
	ldsw	[%l7 + 0x70],	%l4
	fornot2s	%f12,	%f6,	%f1
	andn	%o3,	0x003D,	%g3
	fsrc1s	%f1,	%f13
	stw	%o5,	[%l7 + 0x30]
	ld	[%l7 + 0x60],	%f14
	sub	%l5,	%o4,	%i1
	movrlz	%o7,	0x130,	%g2
	fmovs	%f14,	%f6
	umulcc	%i2,	0x12AB,	%l3
	movrgz	%i3,	%g4,	%o6
	xor	%i5,	%l1,	%o2
	udivcc	%g6,	0x138A,	%i4
	edge32	%l0,	%i0,	%l2
	fabss	%f16,	%f11
	lduw	[%l7 + 0x74],	%g5
	andcc	%o1,	%l6,	%g7
	edge32	%g1,	%i7,	%o0
	edge32n	%l4,	%i6,	%g3
	ld	[%l7 + 0x50],	%f10
	movcc	%icc,	%o3,	%o5
	addc	%l5,	%i1,	%o7
	edge16n	%o4,	%g2,	%i2
	movneg	%xcc,	%i3,	%l3
	edge32	%o6,	%g4,	%i5
	fmovda	%icc,	%f29,	%f27
	smulcc	%l1,	%o2,	%g6
	fexpand	%f10,	%f30
	udiv	%i4,	0x1C7F,	%l0
	fmovsleu	%icc,	%f7,	%f0
	edge16l	%i0,	%g5,	%l2
	umulcc	%o1,	0x1A3D,	%g7
	xorcc	%l6,	%i7,	%o0
	edge16n	%l4,	%g1,	%i6
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%f2
	xnor	%g3,	%o5,	%o3
	ldsb	[%l7 + 0x16],	%i1
	addc	%o7,	0x1454,	%o4
	movne	%xcc,	%g2,	%i2
	addcc	%i3,	%l3,	%l5
	xnor	%o6,	%i5,	%l1
	movrlz	%o2,	%g4,	%g6
	mova	%icc,	%l0,	%i0
	ldsb	[%l7 + 0x33],	%i4
	sdivcc	%l2,	0x1ABB,	%o1
	add	%g7,	%g5,	%i7
	srax	%o0,	%l4,	%g1
	movne	%icc,	%l6,	%i6
	fpackfix	%f2,	%f0
	fmovrdlez	%g3,	%f4,	%f2
	std	%f6,	[%l7 + 0x10]
	udivcc	%o5,	0x0DA4,	%o3
	fmovspos	%icc,	%f30,	%f13
	save %o7, 0x0CED, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o4,	%i2,	%i3
	sub	%l3,	0x180C,	%l5
	siam	0x5
	sllx	%o6,	%g2,	%i5
	edge32	%o2,	%g4,	%g6
	andn	%l0,	0x0832,	%i0
	umul	%l1,	%i4,	%o1
	srl	%g7,	%l2,	%g5
	xor	%i7,	%o0,	%l4
	addcc	%g1,	0x0AC9,	%i6
	sdivcc	%l6,	0x0832,	%g3
	bshuffle	%f2,	%f16,	%f0
	fabsd	%f12,	%f24
	xorcc	%o5,	%o7,	%i1
	edge16n	%o4,	%i2,	%i3
	save %l3, %o3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f4,	%f16,	%f2
	fmovsvc	%icc,	%f19,	%f26
	alignaddr	%o6,	%g2,	%o2
	addccc	%g4,	%g6,	%l0
	subc	%i5,	0x0186,	%i0
	movneg	%xcc,	%l1,	%o1
	array32	%i4,	%l2,	%g7
	fandnot2	%f16,	%f16,	%f14
	udivx	%g5,	0x03C3,	%i7
	array32	%o0,	%l4,	%i6
	ldsb	[%l7 + 0x77],	%g1
	fzero	%f30
	pdist	%f12,	%f2,	%f22
	andcc	%g3,	0x0F95,	%o5
	st	%f6,	[%l7 + 0x7C]
	movn	%xcc,	%o7,	%i1
	edge16	%o4,	%l6,	%i2
	fpadd32s	%f0,	%f11,	%f17
	array32	%i3,	%l3,	%l5
	stw	%o3,	[%l7 + 0x74]
	udiv	%o6,	0x18FE,	%o2
	movn	%icc,	%g4,	%g6
	alignaddrl	%l0,	%i5,	%i0
	fand	%f22,	%f20,	%f4
	andcc	%l1,	%g2,	%o1
	fmul8x16	%f0,	%f18,	%f12
	lduw	[%l7 + 0x74],	%l2
	xnorcc	%g7,	0x1228,	%i4
	edge8ln	%i7,	%g5,	%o0
	fandnot1	%f20,	%f22,	%f22
	fcmps	%fcc3,	%f10,	%f2
	movrlez	%i6,	%l4,	%g3
	stw	%g1,	[%l7 + 0x44]
	fmovdleu	%xcc,	%f19,	%f6
	ldsw	[%l7 + 0x1C],	%o5
	ldsw	[%l7 + 0x70],	%i1
	fxors	%f10,	%f12,	%f23
	subccc	%o7,	0x0310,	%o4
	edge16l	%i2,	%l6,	%i3
	fands	%f2,	%f14,	%f5
	subc	%l5,	%o3,	%l3
	edge32n	%o6,	%o2,	%g6
	fmovspos	%xcc,	%f4,	%f17
	umul	%g4,	%l0,	%i0
	udivx	%l1,	0x1A37,	%i5
	movrgz	%g2,	0x06A,	%l2
	ldx	[%l7 + 0x08],	%o1
	edge8	%g7,	%i4,	%g5
	fmovscs	%xcc,	%f13,	%f22
	ldd	[%l7 + 0x28],	%i6
	edge8l	%i6,	%l4,	%o0
	move	%icc,	%g3,	%o5
	alignaddrl	%g1,	%i1,	%o4
	array16	%i2,	%l6,	%i3
	srl	%l5,	0x06,	%o3
	sdiv	%l3,	0x1423,	%o6
	edge8n	%o2,	%g6,	%g4
	edge16n	%l0,	%o7,	%l1
	movg	%icc,	%i5,	%i0
	fpack16	%f26,	%f24
	movle	%xcc,	%g2,	%o1
	sub	%l2,	0x0228,	%i4
	movle	%xcc,	%g7,	%g5
	srl	%i6,	0x13,	%i7
	movge	%xcc,	%l4,	%g3
	movrgz	%o0,	%o5,	%i1
	movn	%icc,	%g1,	%i2
	fmovrsne	%o4,	%f4,	%f18
	ldub	[%l7 + 0x17],	%l6
	nop
	set	0x1E, %l4
	ldsb	[%l7 + %l4],	%l5
	fsrc1	%f30,	%f4
	fcmpne32	%f12,	%f8,	%o3
	mulscc	%l3,	%i3,	%o6
	fmovda	%xcc,	%f11,	%f16
	xnorcc	%o2,	%g4,	%g6
	addccc	%o7,	%l1,	%i5
	sllx	%l0,	0x14,	%g2
	fcmpd	%fcc3,	%f12,	%f4
	stx	%o1,	[%l7 + 0x10]
	fmul8ulx16	%f26,	%f16,	%f24
	ldsw	[%l7 + 0x2C],	%l2
	ldsw	[%l7 + 0x48],	%i4
	edge8	%i0,	%g7,	%i6
	move	%icc,	%g5,	%l4
	movleu	%icc,	%g3,	%o0
	ldub	[%l7 + 0x0E],	%i7
	fmovscc	%icc,	%f1,	%f1
	stx	%o5,	[%l7 + 0x18]
	fmovrdne	%g1,	%f8,	%f4
	movleu	%icc,	%i1,	%i2
	addc	%o4,	%l6,	%o3
	movrgz	%l5,	%l3,	%o6
	fmovsne	%xcc,	%f1,	%f21
	edge16	%o2,	%i3,	%g6
	srlx	%g4,	0x02,	%o7
	movgu	%xcc,	%l1,	%i5
	udivcc	%g2,	0x0F8B,	%l0
	umulcc	%o1,	%l2,	%i0
	xorcc	%g7,	0x19D8,	%i4
	mova	%icc,	%g5,	%i6
	fxnor	%f4,	%f26,	%f2
	umul	%g3,	%o0,	%l4
	std	%f24,	[%l7 + 0x08]
	edge32n	%i7,	%o5,	%i1
	ldsh	[%l7 + 0x30],	%g1
	ldsb	[%l7 + 0x4E],	%i2
	fnot1	%f14,	%f22
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	srax	%l5,	0x08,	%o3
	xorcc	%l3,	%o2,	%o6
	fors	%f28,	%f29,	%f8
	fpadd16	%f16,	%f14,	%f20
	edge16	%i3,	%g6,	%o7
	movvc	%xcc,	%g4,	%l1
	edge8	%g2,	%l0,	%i5
	edge32n	%l2,	%i0,	%g7
	xor	%o1,	%g5,	%i4
	fcmpne16	%f0,	%f18,	%i6
	movre	%o0,	0x397,	%l4
	fcmpne32	%f20,	%f24,	%i7
	popc	0x1828,	%o5
	umulcc	%g3,	0x1695,	%i1
	and	%g1,	%i2,	%o4
	ld	[%l7 + 0x74],	%f0
	sub	%l6,	%o3,	%l5
	orncc	%o2,	0x1800,	%o6
	fmovdn	%xcc,	%f30,	%f8
	fmovrdgez	%i3,	%f4,	%f10
	fmovsl	%icc,	%f9,	%f27
	fcmpgt16	%f4,	%f6,	%g6
	ldub	[%l7 + 0x20],	%o7
	ldsb	[%l7 + 0x57],	%g4
	movcs	%icc,	%l3,	%l1
	edge16	%g2,	%i5,	%l0
	movgu	%icc,	%i0,	%l2
	stw	%o1,	[%l7 + 0x74]
	stw	%g5,	[%l7 + 0x44]
	fornot2	%f4,	%f12,	%f20
	save %g7, 0x1B14, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x68],	%i4
	movneg	%xcc,	%l4,	%o0
	movpos	%icc,	%i7,	%g3
	sra	%o5,	0x0F,	%i1
	sllx	%g1,	%i2,	%o4
	andcc	%l6,	0x005C,	%o3
	subcc	%o2,	%o6,	%i3
	edge32	%l5,	%o7,	%g6
	subc	%g4,	%l3,	%l1
	and	%g2,	%i5,	%i0
	edge8	%l0,	%o1,	%l2
	movne	%icc,	%g7,	%i6
	lduh	[%l7 + 0x58],	%i4
	edge32ln	%l4,	%g5,	%i7
	movcc	%xcc,	%g3,	%o5
	fcmpd	%fcc1,	%f18,	%f10
	fpsub16	%f24,	%f12,	%f22
	lduw	[%l7 + 0x7C],	%o0
	edge32ln	%g1,	%i2,	%o4
	sllx	%i1,	%l6,	%o3
	movge	%xcc,	%o6,	%o2
	sth	%l5,	[%l7 + 0x3C]
	srlx	%i3,	%g6,	%g4
	movvc	%icc,	%l3,	%o7
	mova	%icc,	%g2,	%i5
	movvc	%icc,	%i0,	%l1
	movrgez	%l0,	0x144,	%o1
	fmovrsne	%g7,	%f8,	%f9
	edge16	%l2,	%i4,	%l4
	movleu	%xcc,	%g5,	%i7
	fxor	%f18,	%f2,	%f14
	movcc	%icc,	%g3,	%o5
	fnegs	%f22,	%f20
	mulscc	%i6,	0x0E63,	%o0
	fxor	%f28,	%f18,	%f20
	movl	%xcc,	%i2,	%o4
	edge8	%i1,	%l6,	%g1
	array16	%o6,	%o2,	%o3
	andcc	%i3,	0x0B95,	%l5
	movrgz	%g6,	0x1B2,	%g4
	orcc	%l3,	0x1A98,	%o7
	edge8n	%g2,	%i5,	%i0
	umul	%l0,	0x1F1F,	%l1
	fabsd	%f28,	%f12
	or	%o1,	0x05F0,	%l2
	mulscc	%i4,	0x15A3,	%g7
	movre	%l4,	%g5,	%i7
	umul	%g3,	0x0215,	%o5
	movl	%xcc,	%o0,	%i6
	and	%o4,	0x002E,	%i1
	movvs	%icc,	%i2,	%g1
	xorcc	%o6,	%l6,	%o2
	edge16	%i3,	%o3,	%l5
	movl	%icc,	%g4,	%l3
	sdivcc	%o7,	0x0F54,	%g2
	lduh	[%l7 + 0x4A],	%i5
	ldx	[%l7 + 0x60],	%i0
	xnorcc	%g6,	0x119D,	%l1
	sdivx	%o1,	0x0328,	%l0
	sir	0x1DE1
	ldub	[%l7 + 0x39],	%l2
	pdist	%f10,	%f20,	%f6
	xor	%i4,	0x1005,	%l4
	edge32n	%g7,	%i7,	%g5
	fcmpgt16	%f24,	%f24,	%g3
	sra	%o0,	0x0B,	%o5
	movle	%xcc,	%i6,	%o4
	fzero	%f30
	movg	%icc,	%i2,	%i1
	movpos	%xcc,	%o6,	%l6
	udiv	%g1,	0x07A4,	%i3
	udivcc	%o3,	0x1796,	%o2
	save %g4, 0x0427, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l3,	%o7,	%g2
	and	%i0,	%g6,	%l1
	xnorcc	%o1,	0x1D70,	%l0
	srl	%l2,	%i5,	%l4
	smul	%g7,	0x1612,	%i4
	sdivx	%g5,	0x1D4B,	%i7
	sdivx	%o0,	0x078D,	%o5
	xor	%i6,	0x1C78,	%o4
	movvs	%icc,	%g3,	%i2
	ld	[%l7 + 0x6C],	%f23
	fsrc1s	%f15,	%f7
	edge8l	%o6,	%i1,	%g1
	subc	%i3,	0x139E,	%l6
	sdiv	%o2,	0x17DA,	%g4
	sll	%o3,	0x18,	%l3
	addc	%o7,	%g2,	%l5
	movrgez	%i0,	%g6,	%l1
	fxors	%f4,	%f31,	%f12
	fmovdleu	%icc,	%f18,	%f12
	move	%xcc,	%o1,	%l0
	movg	%xcc,	%l2,	%l4
	udiv	%g7,	0x190F,	%i4
	lduh	[%l7 + 0x76],	%g5
	and	%i5,	0x1EFF,	%o0
	edge8	%i7,	%o5,	%o4
	ldd	[%l7 + 0x28],	%f6
	faligndata	%f2,	%f6,	%f24
	fcmps	%fcc1,	%f5,	%f5
	edge16l	%i6,	%i2,	%g3
	movrgz	%o6,	0x223,	%i1
	subcc	%i3,	0x09DE,	%l6
	fmovs	%f3,	%f29
	movgu	%icc,	%o2,	%g1
	ldd	[%l7 + 0x58],	%f26
	edge8ln	%o3,	%g4,	%l3
	fornot2	%f18,	%f16,	%f14
	fmovde	%xcc,	%f25,	%f27
	movvc	%xcc,	%o7,	%g2
	nop
	set	0x58, %g7
	stx	%i0,	[%l7 + %g7]
	fmovs	%f29,	%f9
	fcmps	%fcc1,	%f20,	%f14
	orcc	%g6,	%l1,	%l5
	addc	%o1,	0x0685,	%l2
	fcmpne16	%f0,	%f16,	%l4
	st	%f14,	[%l7 + 0x40]
	orncc	%l0,	0x085B,	%i4
	fmovrsgz	%g5,	%f18,	%f31
	fsrc2s	%f2,	%f25
	and	%i5,	0x0225,	%g7
	smulcc	%i7,	%o0,	%o5
	fmovsvs	%xcc,	%f8,	%f29
	stb	%o4,	[%l7 + 0x2B]
	edge32ln	%i2,	%g3,	%i6
	edge8n	%i1,	%i3,	%o6
	orncc	%o2,	0x024F,	%l6
	addcc	%o3,	0x1E38,	%g4
	sub	%l3,	%g1,	%g2
	movge	%icc,	%i0,	%o7
	xor	%g6,	%l1,	%o1
	fmovsne	%xcc,	%f15,	%f9
	sll	%l2,	0x17,	%l4
	sll	%l5,	%i4,	%g5
	addcc	%l0,	%g7,	%i5
	and	%i7,	0x1962,	%o0
	orncc	%o5,	0x0C0E,	%i2
	fmovsa	%xcc,	%f30,	%f9
	alignaddrl	%g3,	%o4,	%i1
	movpos	%xcc,	%i6,	%i3
	movge	%xcc,	%o2,	%o6
	srl	%o3,	%l6,	%g4
	stb	%l3,	[%l7 + 0x71]
	fnot2s	%f21,	%f28
	mulscc	%g2,	0x0754,	%g1
	ldd	[%l7 + 0x10],	%f22
	ldd	[%l7 + 0x68],	%o6
	restore %i0, 0x1A52, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g6,	%o1,	%l2
	sethi	0x0C4C,	%l5
	sub	%i4,	0x0D21,	%g5
	udivcc	%l0,	0x0FB8,	%g7
	ldsh	[%l7 + 0x64],	%i5
	movne	%icc,	%i7,	%l4
	fmul8x16au	%f23,	%f26,	%f24
	ldsw	[%l7 + 0x34],	%o5
	movre	%i2,	%g3,	%o0
	lduw	[%l7 + 0x10],	%i1
	sethi	0x149E,	%o4
	udiv	%i6,	0x180A,	%i3
	stb	%o6,	[%l7 + 0x14]
	movrne	%o3,	%o2,	%g4
	fpadd32	%f2,	%f14,	%f28
	ldx	[%l7 + 0x28],	%l3
	array32	%l6,	%g2,	%o7
	udiv	%g1,	0x1BDE,	%i0
	movrlez	%g6,	0x169,	%o1
	fabsd	%f12,	%f20
	sir	0x190D
	fxnor	%f24,	%f18,	%f8
	addc	%l1,	0x05E7,	%l2
	movrne	%l5,	0x164,	%i4
	andncc	%l0,	%g5,	%g7
	array8	%i5,	%i7,	%l4
	andcc	%o5,	%i2,	%g3
	srl	%i1,	0x10,	%o0
	edge16	%o4,	%i6,	%i3
	fmovrse	%o3,	%f13,	%f28
	sethi	0x1534,	%o6
	ldsb	[%l7 + 0x70],	%g4
	xnorcc	%o2,	%l6,	%g2
	udivcc	%l3,	0x00BD,	%o7
	array8	%i0,	%g1,	%g6
	udiv	%l1,	0x08DD,	%l2
	fmovdne	%xcc,	%f9,	%f29
	alignaddr	%o1,	%l5,	%i4
	alignaddr	%l0,	%g5,	%i5
	fmovdge	%icc,	%f15,	%f25
	lduh	[%l7 + 0x74],	%i7
	edge16n	%l4,	%g7,	%o5
	movvs	%icc,	%i2,	%g3
	stw	%i1,	[%l7 + 0x5C]
	movl	%xcc,	%o4,	%o0
	stb	%i3,	[%l7 + 0x43]
	fmovdne	%xcc,	%f17,	%f5
	movne	%xcc,	%i6,	%o6
	ldub	[%l7 + 0x61],	%g4
	ldsb	[%l7 + 0x0F],	%o2
	fcmpeq32	%f4,	%f0,	%o3
	move	%xcc,	%l6,	%g2
	fnot2	%f18,	%f18
	movgu	%icc,	%o7,	%i0
	movcc	%icc,	%l3,	%g1
	nop
	set	0x20, %o5
	stb	%g6,	[%l7 + %o5]
	fmovrsgz	%l1,	%f13,	%f25
	fpsub32	%f0,	%f4,	%f18
	fcmpeq32	%f18,	%f20,	%o1
	sllx	%l5,	0x18,	%l2
	fmovrde	%l0,	%f8,	%f26
	fpack16	%f24,	%f11
	sra	%i4,	%i5,	%g5
	fmovsleu	%xcc,	%f7,	%f23
	for	%f2,	%f2,	%f24
	sra	%l4,	0x13,	%i7
	edge8ln	%o5,	%g7,	%i2
	fmovde	%icc,	%f31,	%f27
	smulcc	%g3,	%o4,	%o0
	alignaddrl	%i1,	%i3,	%i6
	fpsub16	%f28,	%f14,	%f26
	udivcc	%o6,	0x1315,	%o2
	andn	%g4,	0x09D2,	%l6
	ldsb	[%l7 + 0x2F],	%g2
	movn	%icc,	%o7,	%o3
	ldsh	[%l7 + 0x70],	%i0
	fpsub16s	%f3,	%f28,	%f10
	fpack32	%f28,	%f0,	%f10
	orncc	%g1,	0x0645,	%g6
	save %l1, %o1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l5,	%l0
	xnorcc	%i4,	%l2,	%g5
	array16	%l4,	%i5,	%o5
	stb	%i7,	[%l7 + 0x7B]
	array8	%g7,	%g3,	%i2
	sethi	0x1195,	%o0
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	fcmpeq32	%f2,	%f18,	%i1
	ldsw	[%l7 + 0x0C],	%i6
	andncc	%o6,	%g4,	%o2
	movge	%icc,	%g2,	%l6
	movgu	%xcc,	%o3,	%o7
	movre	%i0,	0x010,	%g1
	sllx	%g6,	%o1,	%l1
	smul	%l5,	0x054E,	%l0
	ldsh	[%l7 + 0x70],	%i4
	sdivx	%l3,	0x1A1A,	%l2
	or	%g5,	%i5,	%o5
	sra	%l4,	%i7,	%g3
	array16	%i2,	%g7,	%o4
	fmovsleu	%icc,	%f1,	%f17
	orn	%i3,	%i1,	%o0
	add	%i6,	0x1FB0,	%o6
	movre	%o2,	0x3C5,	%g2
	edge32	%g4,	%o3,	%o7
	movge	%icc,	%l6,	%i0
	for	%f20,	%f24,	%f24
	orcc	%g6,	%o1,	%g1
	ldd	[%l7 + 0x40],	%l4
	movrlez	%l1,	0x3CC,	%i4
	ld	[%l7 + 0x7C],	%f17
	subc	%l0,	%l2,	%l3
	sllx	%i5,	0x0E,	%o5
	movrgz	%g5,	%l4,	%g3
	movvc	%xcc,	%i7,	%i2
	addcc	%g7,	0x067D,	%o4
	nop
	set	0x60, %o3
	ldx	[%l7 + %o3],	%i1
	nop
	set	0x55, %o7
	stb	%o0,	[%l7 + %o7]
	fmovda	%icc,	%f6,	%f5
	fmovdpos	%icc,	%f3,	%f14
	fmul8ulx16	%f14,	%f22,	%f14
	ldsh	[%l7 + 0x34],	%i6
	sdivcc	%i3,	0x007B,	%o6
	fmuld8ulx16	%f11,	%f4,	%f14
	addccc	%o2,	%g2,	%o3
	std	%f28,	[%l7 + 0x30]
	subccc	%o7,	%l6,	%i0
	smul	%g4,	%g6,	%o1
	srl	%l5,	%l1,	%g1
	andcc	%i4,	%l0,	%l2
	fands	%f30,	%f27,	%f11
	edge16l	%l3,	%i5,	%g5
	movg	%xcc,	%l4,	%o5
	fmul8x16al	%f21,	%f5,	%f26
	fmovrslz	%i7,	%f19,	%f3
	save %i2, 0x1858, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g3,	[%l7 + 0x50]
	edge32n	%i1,	%o0,	%o4
	movneg	%xcc,	%i3,	%o6
	xorcc	%i6,	%o2,	%o3
	srl	%g2,	0x13,	%l6
	fandnot2	%f2,	%f30,	%f10
	movvc	%icc,	%i0,	%g4
	fornot1s	%f14,	%f7,	%f0
	alignaddr	%o7,	%g6,	%o1
	edge16l	%l5,	%g1,	%i4
	st	%f13,	[%l7 + 0x3C]
	st	%f9,	[%l7 + 0x10]
	addcc	%l0,	%l2,	%l3
	fmovrslez	%i5,	%f9,	%f31
	edge32n	%l1,	%l4,	%g5
	fmovse	%icc,	%f19,	%f29
	fmuld8ulx16	%f8,	%f9,	%f4
	fpadd32s	%f13,	%f20,	%f2
	fcmpes	%fcc1,	%f17,	%f18
	fmovsa	%icc,	%f8,	%f24
	fmovrslz	%o5,	%f25,	%f15
	movleu	%xcc,	%i2,	%i7
	addccc	%g7,	0x0C3D,	%g3
	fmovspos	%icc,	%f15,	%f26
	nop
	set	0x10, %i1
	ldsw	[%l7 + %i1],	%o0
	fzero	%f10
	udiv	%o4,	0x0A1A,	%i1
	mulscc	%o6,	%i3,	%o2
	orcc	%i6,	%g2,	%o3
	edge16	%i0,	%l6,	%g4
	fpack16	%f30,	%f24
	xnorcc	%g6,	0x1AC0,	%o7
	fmovrdgez	%o1,	%f28,	%f22
	sethi	0x1C3A,	%l5
	udiv	%i4,	0x17A9,	%l0
	movrne	%l2,	0x30E,	%g1
	stb	%i5,	[%l7 + 0x12]
	edge16n	%l3,	%l1,	%l4
	edge16ln	%g5,	%o5,	%i7
	ldsh	[%l7 + 0x3A],	%i2
	fsrc2s	%f8,	%f29
	array32	%g3,	%g7,	%o4
	smul	%o0,	%i1,	%i3
	popc	%o6,	%i6
	andcc	%o2,	%o3,	%i0
	mulscc	%l6,	%g2,	%g6
	fmovrsne	%o7,	%f12,	%f12
	smul	%o1,	0x0F9D,	%g4
	fnot2	%f30,	%f6
	fcmps	%fcc1,	%f29,	%f18
	udivcc	%i4,	0x1FBE,	%l0
	array16	%l2,	%g1,	%l5
	fmovrse	%l3,	%f19,	%f21
	movpos	%xcc,	%l1,	%i5
	fmovrde	%g5,	%f22,	%f2
	ldd	[%l7 + 0x18],	%f8
	fornot1	%f12,	%f20,	%f16
	movge	%icc,	%o5,	%l4
	subc	%i2,	%g3,	%g7
	edge16n	%o4,	%i7,	%i1
	movcc	%xcc,	%o0,	%i3
	srlx	%i6,	%o6,	%o3
	fmovdpos	%icc,	%f10,	%f9
	xnorcc	%i0,	0x1F3D,	%o2
	sub	%l6,	0x1504,	%g6
	stx	%o7,	[%l7 + 0x10]
	fmovdneg	%xcc,	%f18,	%f31
	movrlez	%g2,	%g4,	%o1
	stb	%l0,	[%l7 + 0x61]
	fmovscs	%icc,	%f4,	%f7
	fcmpd	%fcc1,	%f20,	%f16
	sethi	0x185E,	%i4
	movn	%icc,	%g1,	%l5
	sllx	%l3,	%l2,	%i5
	edge8l	%l1,	%o5,	%l4
	movn	%xcc,	%i2,	%g5
	fmovsge	%xcc,	%f1,	%f21
	fmovrsgz	%g3,	%f21,	%f24
	movl	%icc,	%o4,	%i7
	fandnot2	%f2,	%f24,	%f10
	sub	%g7,	%i1,	%o0
	sra	%i6,	0x1F,	%o6
	xnor	%o3,	0x05FA,	%i3
	xorcc	%o2,	%i0,	%g6
	udivcc	%l6,	0x078D,	%g2
	edge32n	%o7,	%o1,	%g4
	orcc	%l0,	0x12E2,	%g1
	array16	%l5,	%l3,	%l2
	orncc	%i5,	0x1634,	%l1
	sub	%i4,	%l4,	%i2
	fands	%f31,	%f0,	%f7
	alignaddrl	%g5,	%g3,	%o5
	smulcc	%o4,	%g7,	%i7
	addc	%i1,	%o0,	%i6
	fmul8x16	%f5,	%f16,	%f16
	movrlez	%o6,	0x016,	%o3
	xnor	%o2,	0x1929,	%i3
	movle	%icc,	%g6,	%l6
	movrne	%i0,	%o7,	%g2
	movge	%xcc,	%g4,	%o1
	edge8ln	%l0,	%g1,	%l5
	xnor	%l2,	0x000C,	%l3
	andcc	%i5,	%l1,	%i4
	xor	%l4,	%i2,	%g5
	st	%f16,	[%l7 + 0x6C]
	edge16n	%o5,	%g3,	%g7
	move	%icc,	%i7,	%i1
	array16	%o4,	%i6,	%o6
	fzeros	%f26
	fmovrslz	%o3,	%f25,	%f29
	stb	%o0,	[%l7 + 0x5A]
	ldd	[%l7 + 0x40],	%f14
	fandnot1	%f26,	%f8,	%f14
	mulscc	%i3,	%g6,	%o2
	movneg	%icc,	%i0,	%l6
	andcc	%o7,	%g2,	%o1
	smulcc	%l0,	0x005B,	%g1
	edge16n	%g4,	%l2,	%l3
	movg	%xcc,	%l5,	%l1
	xor	%i4,	0x073C,	%l4
	ld	[%l7 + 0x1C],	%f31
	ldsh	[%l7 + 0x2C],	%i5
	edge8	%i2,	%o5,	%g3
	smulcc	%g5,	%i7,	%g7
	movrgz	%i1,	%o4,	%i6
	fmovdvc	%xcc,	%f18,	%f11
	movgu	%xcc,	%o6,	%o0
	addccc	%o3,	%i3,	%g6
	edge8n	%i0,	%l6,	%o7
	ldsb	[%l7 + 0x48],	%o2
	movrlz	%g2,	%o1,	%l0
	fcmple16	%f18,	%f0,	%g1
	nop
	set	0x1C, %i2
	ldsh	[%l7 + %i2],	%l2
	fcmpgt32	%f12,	%f22,	%l3
	orn	%l5,	%g4,	%l1
	move	%icc,	%i4,	%l4
	stb	%i5,	[%l7 + 0x59]
	restore %i2, %g3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i7,	%g7,	%i1
	andncc	%g5,	%o4,	%i6
	movleu	%icc,	%o0,	%o3
	fabsd	%f18,	%f30
	movg	%icc,	%i3,	%o6
	xnorcc	%i0,	%g6,	%o7
	xnorcc	%l6,	0x0422,	%g2
	addcc	%o1,	%l0,	%g1
	lduh	[%l7 + 0x5A],	%o2
	xor	%l2,	%l3,	%l5
	stx	%g4,	[%l7 + 0x08]
	orncc	%i4,	0x143B,	%l1
	fxnor	%f22,	%f26,	%f18
	edge32l	%i5,	%i2,	%l4
	movle	%icc,	%o5,	%i7
	stb	%g3,	[%l7 + 0x56]
	movre	%i1,	%g5,	%o4
	add	%g7,	%i6,	%o3
	smulcc	%o0,	%o6,	%i3
	fmovdgu	%xcc,	%f6,	%f10
	mulx	%g6,	0x0D3B,	%i0
	ldsb	[%l7 + 0x3A],	%o7
	sdivcc	%g2,	0x19F8,	%l6
	sdivx	%o1,	0x0526,	%l0
	mulscc	%g1,	%o2,	%l2
	addccc	%l5,	%g4,	%i4
	addc	%l3,	0x051C,	%i5
	movleu	%icc,	%i2,	%l4
	fmovdpos	%icc,	%f7,	%f28
	movle	%icc,	%l1,	%o5
	edge16l	%i7,	%i1,	%g5
	fzero	%f8
	srax	%o4,	%g7,	%g3
	siam	0x0
	fmovspos	%icc,	%f0,	%f21
	nop
	set	0x3C, %g1
	lduw	[%l7 + %g1],	%i6
	udiv	%o0,	0x05AA,	%o6
	save %o3, %g6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	movrlz	%l6,	%o1,	%l0
	subcc	%g1,	%o2,	%l2
	orn	%i3,	0x02C5,	%l5
	fandnot2	%f26,	%f30,	%f30
	sll	%i4,	0x12,	%g4
	mulscc	%l3,	0x122E,	%i5
	andcc	%l4,	%i2,	%l1
	array16	%i7,	%i1,	%o5
	fmuld8sux16	%f11,	%f14,	%f10
	restore %o4, %g7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i6,	0x1098,	%o0
	sir	0x1F7A
	fcmple16	%f16,	%f12,	%g3
	sdivx	%o3,	0x0968,	%g6
	fnands	%f22,	%f6,	%f16
	sdivcc	%o6,	0x12EF,	%i0
	movpos	%icc,	%g2,	%l6
	orn	%o1,	%o7,	%g1
	fpsub16	%f14,	%f22,	%f0
	fpmerge	%f19,	%f26,	%f22
	array8	%o2,	%l0,	%l2
	edge8n	%i3,	%l5,	%i4
	movpos	%icc,	%g4,	%i5
	edge32n	%l4,	%l3,	%l1
	fnot1s	%f22,	%f20
	fmul8x16al	%f4,	%f22,	%f20
	movvc	%xcc,	%i7,	%i1
	ldsw	[%l7 + 0x54],	%o5
	andncc	%i2,	%g7,	%o4
	sdiv	%i6,	0x1CB0,	%g5
	edge8	%o0,	%g3,	%o3
	fxors	%f20,	%f23,	%f13
	edge16	%g6,	%i0,	%o6
	andcc	%l6,	%g2,	%o7
	stw	%o1,	[%l7 + 0x24]
	stw	%o2,	[%l7 + 0x64]
	add	%g1,	0x1026,	%l0
	movrlez	%l2,	%l5,	%i4
	movgu	%xcc,	%i3,	%i5
	movcs	%icc,	%l4,	%l3
	fmovrdgez	%l1,	%f26,	%f24
	edge8ln	%g4,	%i7,	%i1
	edge32ln	%o5,	%g7,	%i2
	array8	%i6,	%g5,	%o0
	udiv	%g3,	0x045C,	%o4
	save %o3, 0x0B7E, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o6,	[%l7 + 0x18]
	orcc	%g6,	0x1523,	%l6
	andcc	%g2,	%o1,	%o7
	sdivx	%o2,	0x0745,	%g1
	sub	%l0,	%l5,	%l2
	sdivcc	%i3,	0x15D2,	%i4
	popc	%l4,	%i5
	fmovdl	%icc,	%f27,	%f17
	movvc	%xcc,	%l1,	%l3
	stb	%g4,	[%l7 + 0x7A]
	srlx	%i7,	%i1,	%o5
	movre	%g7,	%i2,	%g5
	edge16n	%i6,	%g3,	%o4
	xnor	%o0,	0x083F,	%o3
	udivx	%o6,	0x1293,	%i0
	movne	%xcc,	%g6,	%g2
	movrgez	%o1,	0x34A,	%o7
	movleu	%xcc,	%o2,	%l6
	sllx	%g1,	%l5,	%l0
	sir	0x0022
	edge32ln	%i3,	%i4,	%l4
	ldd	[%l7 + 0x38],	%l2
	movl	%xcc,	%i5,	%l1
	fmovdge	%xcc,	%f23,	%f0
	move	%icc,	%l3,	%i7
	movrne	%g4,	0x290,	%i1
	mulscc	%g7,	%o5,	%g5
	sll	%i6,	%i2,	%g3
	fmovrdne	%o0,	%f6,	%f26
	fmovdcc	%xcc,	%f5,	%f11
	orcc	%o4,	%o6,	%o3
	std	%f10,	[%l7 + 0x10]
	srax	%g6,	0x1A,	%g2
	orncc	%i0,	%o1,	%o2
	fxnor	%f24,	%f6,	%f2
	fnegs	%f30,	%f5
	ldsb	[%l7 + 0x4C],	%l6
	ldx	[%l7 + 0x58],	%g1
	fpack32	%f12,	%f22,	%f8
	orn	%l5,	%o7,	%i3
	array16	%i4,	%l4,	%l2
	xor	%i5,	0x1754,	%l1
	sllx	%l3,	%i7,	%g4
	mova	%xcc,	%l0,	%i1
	edge32l	%o5,	%g5,	%g7
	nop
	set	0x70, %g5
	std	%f2,	[%l7 + %g5]
	xor	%i2,	%g3,	%i6
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	fmovrdne	%o4,	%f6,	%f10
	sdivcc	%g6,	0x0BB8,	%g2
	udiv	%o3,	0x0BB7,	%i0
	array8	%o2,	%o1,	%l6
	movrgez	%g1,	0x212,	%o7
	sdiv	%l5,	0x1BBA,	%i4
	edge16n	%l4,	%l2,	%i3
	stx	%i5,	[%l7 + 0x18]
	fnors	%f8,	%f3,	%f14
	fmovsvc	%xcc,	%f28,	%f7
	save %l3, %i7, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%l0
	edge8l	%i1,	%g4,	%o5
	movle	%icc,	%g7,	%g5
	movleu	%icc,	%g3,	%i6
	sllx	%i2,	%o0,	%o4
	movg	%xcc,	%g6,	%o6
	sub	%g2,	%i0,	%o3
	fnands	%f5,	%f3,	%f2
	movre	%o1,	0x2BC,	%o2
	ldx	[%l7 + 0x18],	%g1
	save %o7, 0x0E52, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpd	%fcc0,	%f22,	%f22
	edge8ln	%i4,	%l4,	%l6
	edge8l	%i3,	%i5,	%l3
	orncc	%i7,	0x0AC2,	%l2
	fnand	%f0,	%f14,	%f8
	fmovrsgz	%l0,	%f30,	%f19
	edge8ln	%l1,	%g4,	%o5
	lduh	[%l7 + 0x48],	%i1
	fmovspos	%icc,	%f24,	%f10
	st	%f23,	[%l7 + 0x30]
	movrgez	%g7,	0x361,	%g3
	fmovrsgz	%i6,	%f14,	%f21
	andn	%g5,	%i2,	%o4
	mova	%icc,	%o0,	%g6
	fcmpes	%fcc1,	%f31,	%f10
	for	%f30,	%f18,	%f0
	xorcc	%o6,	0x1EDE,	%g2
	fmovsg	%xcc,	%f20,	%f25
	array8	%i0,	%o1,	%o2
	edge8n	%o3,	%g1,	%o7
	fpadd32	%f16,	%f30,	%f24
	movcs	%icc,	%i4,	%l4
	fcmpes	%fcc3,	%f25,	%f12
	array16	%l5,	%l6,	%i5
	xnor	%i3,	%i7,	%l2
	fmovsle	%xcc,	%f9,	%f7
	subccc	%l0,	0x0E6B,	%l1
	subccc	%g4,	0x0D33,	%l3
	mova	%xcc,	%i1,	%o5
	movl	%icc,	%g3,	%g7
	xnor	%g5,	0x1CEC,	%i2
	fones	%f30
	popc	0x1F7E,	%o4
	fnegd	%f16,	%f20
	fand	%f24,	%f22,	%f0
	edge32n	%o0,	%g6,	%o6
	alignaddrl	%g2,	%i6,	%o1
	array32	%i0,	%o3,	%o2
	movne	%icc,	%g1,	%o7
	srl	%l4,	%i4,	%l5
	restore %i5, 0x0E9F, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i3,	%i7,	%l0
	udiv	%l1,	0x0BEC,	%l2
	movrlez	%g4,	%i1,	%l3
	udiv	%g3,	0x07B6,	%o5
	edge8	%g5,	%i2,	%o4
	popc	%g7,	%o0
	srl	%o6,	0x19,	%g2
	movpos	%icc,	%i6,	%g6
	ldsh	[%l7 + 0x64],	%o1
	addccc	%o3,	0x1699,	%i0
	movle	%xcc,	%g1,	%o2
	xorcc	%o7,	0x12C4,	%i4
	add	%l5,	%i5,	%l4
	movrne	%i3,	%i7,	%l6
	movrgez	%l0,	%l1,	%l2
	ldsw	[%l7 + 0x74],	%g4
	edge32l	%l3,	%i1,	%g3
	fcmpd	%fcc2,	%f18,	%f14
	sdivx	%g5,	0x0136,	%o5
	umulcc	%i2,	0x1EB3,	%g7
	movl	%xcc,	%o0,	%o6
	fpadd32	%f8,	%f16,	%f26
	stb	%o4,	[%l7 + 0x79]
	orncc	%i6,	%g2,	%o1
	udiv	%g6,	0x19DE,	%o3
	movn	%icc,	%g1,	%i0
	movcc	%xcc,	%o2,	%o7
	movpos	%xcc,	%l5,	%i5
	popc	%i4,	%l4
	movg	%xcc,	%i7,	%i3
	fabsd	%f6,	%f18
	sub	%l6,	0x0F1C,	%l0
	sir	0x1C53
	xnor	%l1,	0x09B1,	%l2
	edge32	%g4,	%i1,	%g3
	array32	%g5,	%o5,	%i2
	and	%g7,	%l3,	%o6
	mova	%xcc,	%o0,	%i6
	array32	%o4,	%g2,	%o1
	fcmpne32	%f16,	%f20,	%o3
	movne	%icc,	%g1,	%g6
	edge16l	%i0,	%o2,	%o7
	andcc	%i5,	0x0779,	%i4
	fcmpgt32	%f12,	%f6,	%l5
	and	%l4,	0x1835,	%i3
	lduh	[%l7 + 0x10],	%i7
	fone	%f8
	fmovsneg	%xcc,	%f9,	%f2
	xor	%l0,	%l6,	%l1
	ldd	[%l7 + 0x50],	%f20
	addc	%g4,	0x0563,	%l2
	ldsw	[%l7 + 0x24],	%g3
	movneg	%xcc,	%i1,	%g5
	edge8	%i2,	%g7,	%l3
	move	%icc,	%o6,	%o0
	xnor	%o5,	%i6,	%o4
	fpack32	%f0,	%f14,	%f8
	ld	[%l7 + 0x6C],	%f0
	xor	%o1,	%o3,	%g2
	sir	0x1F9A
	fnands	%f23,	%f6,	%f4
	movl	%icc,	%g1,	%i0
	array32	%o2,	%g6,	%i5
	xor	%o7,	%i4,	%l4
	stb	%i3,	[%l7 + 0x35]
	fsrc1s	%f31,	%f13
	movpos	%xcc,	%l5,	%i7
	srlx	%l0,	0x05,	%l1
	bshuffle	%f10,	%f0,	%f14
	save %l6, 0x189C, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%g4,	%g3
	fmul8x16	%f12,	%f18,	%f18
	subccc	%g5,	%i2,	%g7
	fpsub32s	%f31,	%f21,	%f9
	stw	%i1,	[%l7 + 0x7C]
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	ldsh	[%l7 + 0x64],	%o5
	movgu	%xcc,	%i6,	%o0
	fmovdle	%icc,	%f27,	%f15
	fmovdpos	%icc,	%f6,	%f28
	edge32n	%o1,	%o4,	%g2
	alignaddr	%o3,	%g1,	%o2
	andcc	%i0,	0x090B,	%i5
	udivcc	%o7,	0x0DAD,	%i4
	fnegs	%f10,	%f8
	fcmple32	%f20,	%f16,	%g6
	fmovrdne	%i3,	%f6,	%f20
	mulx	%l5,	%l4,	%l0
	edge8n	%l1,	%l6,	%i7
	movpos	%icc,	%l2,	%g3
	fmovrse	%g4,	%f18,	%f4
	movcc	%icc,	%i2,	%g7
	andcc	%i1,	%l3,	%o6
	sdivcc	%g5,	0x0814,	%i6
	add	%o5,	0x0941,	%o1
	fmovsvc	%icc,	%f19,	%f2
	fpadd32	%f24,	%f28,	%f16
	add	%o4,	%o0,	%g2
	subc	%g1,	0x1CED,	%o3
	fnors	%f0,	%f12,	%f1
	edge32n	%o2,	%i0,	%o7
	lduw	[%l7 + 0x6C],	%i4
	movg	%xcc,	%g6,	%i3
	movvs	%icc,	%i5,	%l5
	xor	%l0,	%l1,	%l6
	edge16ln	%l4,	%l2,	%i7
	smul	%g3,	0x0188,	%i2
	ldsb	[%l7 + 0x69],	%g4
	addccc	%i1,	0x16FD,	%l3
	movl	%xcc,	%o6,	%g7
	fsrc2	%f10,	%f4
	movcc	%xcc,	%i6,	%o5
	orn	%o1,	%g5,	%o0
	edge32n	%g2,	%g1,	%o3
	sll	%o2,	%i0,	%o7
	array16	%i4,	%o4,	%i3
	addcc	%i5,	0x0489,	%l5
	orn	%g6,	0x0A98,	%l0
	fmul8ulx16	%f28,	%f14,	%f20
	edge16n	%l1,	%l4,	%l6
	add	%l2,	%g3,	%i7
	popc	0x0BF0,	%g4
	movrgz	%i1,	%i2,	%o6
	faligndata	%f4,	%f2,	%f30
	fnands	%f29,	%f17,	%f13
	restore %g7, %i6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x045B,	%o1
	edge16l	%l3,	%g5,	%o0
	movn	%xcc,	%g2,	%o3
	xor	%g1,	%o2,	%i0
	fmovdcc	%icc,	%f22,	%f15
	orncc	%o7,	%o4,	%i3
	movn	%icc,	%i4,	%l5
	fnot1	%f28,	%f12
	ldsw	[%l7 + 0x30],	%i5
	movcs	%icc,	%g6,	%l1
	sllx	%l4,	%l0,	%l6
	addcc	%g3,	0x14F9,	%l2
	fpsub32s	%f9,	%f28,	%f24
	andn	%i7,	0x0889,	%i1
	movrgez	%g4,	%i2,	%o6
	edge32l	%i6,	%o5,	%g7
	fcmped	%fcc2,	%f14,	%f20
	orcc	%l3,	%o1,	%o0
	mulx	%g5,	%g2,	%o3
	fmul8x16al	%f16,	%f0,	%f30
	sth	%o2,	[%l7 + 0x08]
	orcc	%g1,	0x0D1C,	%o7
	movpos	%icc,	%i0,	%i3
	fcmpd	%fcc0,	%f12,	%f22
	movrgz	%i4,	%l5,	%i5
	fsrc1s	%f16,	%f12
	subc	%o4,	0x10A7,	%l1
	fnegs	%f25,	%f30
	movcc	%icc,	%l4,	%l0
	fmovse	%icc,	%f9,	%f21
	movrne	%g6,	%l6,	%l2
	smulcc	%i7,	0x184C,	%i1
	lduw	[%l7 + 0x58],	%g4
	mulx	%g3,	0x1F4D,	%i2
	stw	%o6,	[%l7 + 0x24]
	fnot1	%f20,	%f0
	movle	%icc,	%i6,	%o5
	stx	%g7,	[%l7 + 0x20]
	addc	%o1,	%l3,	%g5
	movvc	%xcc,	%g2,	%o0
	edge32n	%o2,	%g1,	%o3
	movrlez	%i0,	%i3,	%o7
	sub	%l5,	%i5,	%o4
	edge32ln	%l1,	%i4,	%l0
	xnor	%l4,	0x0E2E,	%g6
	mulscc	%l2,	%i7,	%l6
	edge32n	%i1,	%g4,	%i2
	addccc	%o6,	0x11D8,	%g3
	edge32n	%o5,	%i6,	%o1
	mova	%icc,	%g7,	%l3
	movleu	%xcc,	%g5,	%o0
	mulx	%g2,	0x13DB,	%o2
	orn	%o3,	%g1,	%i3
	subc	%i0,	0x1703,	%l5
	sra	%o7,	0x1F,	%o4
	array8	%l1,	%i5,	%l0
	fnegs	%f6,	%f18
	fandnot2s	%f13,	%f8,	%f5
	mova	%xcc,	%l4,	%i4
	fmovrsne	%l2,	%f6,	%f6
	fmovrslez	%i7,	%f3,	%f26
	movcs	%icc,	%l6,	%i1
	ldub	[%l7 + 0x7D],	%g4
	fmuld8ulx16	%f26,	%f13,	%f8
	fpackfix	%f20,	%f16
	andcc	%i2,	0x1D54,	%g6
	orncc	%g3,	0x16C6,	%o6
	save %i6, %o5, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g7,	%l3,	%o0
	pdist	%f14,	%f28,	%f26
	umulcc	%g5,	%o2,	%o3
	movrne	%g1,	%g2,	%i0
	movrne	%i3,	0x168,	%o7
	ldsh	[%l7 + 0x28],	%o4
	xnorcc	%l5,	0x1CD3,	%l1
	fmul8x16	%f2,	%f28,	%f30
	fornot2	%f24,	%f2,	%f0
	orn	%i5,	0x194D,	%l4
	movg	%xcc,	%l0,	%l2
	umul	%i4,	%l6,	%i1
	movleu	%icc,	%g4,	%i7
	sub	%i2,	0x01A3,	%g6
	movg	%xcc,	%g3,	%i6
	xor	%o6,	%o5,	%g7
	movle	%xcc,	%o1,	%o0
	fmovsleu	%xcc,	%f18,	%f21
	mova	%icc,	%l3,	%g5
	edge32ln	%o3,	%g1,	%o2
	fmovda	%xcc,	%f24,	%f15
	movrlez	%i0,	0x18C,	%g2
	movcc	%icc,	%i3,	%o4
	ldsh	[%l7 + 0x1E],	%l5
	sdivcc	%o7,	0x1B64,	%l1
	movle	%xcc,	%i5,	%l4
	fmovsl	%xcc,	%f3,	%f17
	movleu	%xcc,	%l0,	%i4
	movcs	%xcc,	%l2,	%i1
	ldsw	[%l7 + 0x64],	%g4
	fpsub32s	%f19,	%f31,	%f2
	movge	%xcc,	%l6,	%i7
	xor	%g6,	%i2,	%i6
	lduh	[%l7 + 0x3C],	%g3
	sdivx	%o6,	0x1BF3,	%g7
	st	%f7,	[%l7 + 0x5C]
	movcc	%xcc,	%o1,	%o5
	movle	%icc,	%o0,	%g5
	fmovsgu	%icc,	%f3,	%f28
	udiv	%o3,	0x1E1E,	%l3
	edge32l	%o2,	%g1,	%g2
	fornot2s	%f6,	%f18,	%f4
	srl	%i3,	0x1E,	%i0
	xorcc	%o4,	0x1562,	%l5
	fmovsa	%icc,	%f22,	%f13
	movpos	%xcc,	%o7,	%l1
	ld	[%l7 + 0x44],	%f2
	movgu	%icc,	%i5,	%l4
	movleu	%xcc,	%i4,	%l0
	stx	%i1,	[%l7 + 0x48]
	and	%l2,	0x02FE,	%l6
	edge8n	%i7,	%g6,	%g4
	edge16n	%i2,	%g3,	%i6
	orcc	%o6,	0x19DD,	%g7
	ld	[%l7 + 0x54],	%f4
	fmovdg	%xcc,	%f16,	%f19
	fmul8ulx16	%f24,	%f10,	%f28
	fpsub32s	%f29,	%f3,	%f13
	alignaddr	%o1,	%o0,	%g5
	ldsw	[%l7 + 0x30],	%o5
	fmovsn	%xcc,	%f25,	%f3
	popc	%l3,	%o3
	fandnot2	%f8,	%f6,	%f26
	edge8	%g1,	%o2,	%i3
	fmovrse	%i0,	%f13,	%f9
	add	%o4,	0x0A34,	%l5
	mova	%icc,	%o7,	%g2
	fnot1	%f20,	%f26
	movvc	%xcc,	%l1,	%i5
	smulcc	%l4,	0x0AA7,	%i4
	umulcc	%l0,	0x1403,	%l2
	edge32ln	%l6,	%i1,	%g6
	movrne	%g4,	0x034,	%i2
	fmovd	%f26,	%f28
	fornot2	%f14,	%f18,	%f8
	sdiv	%i7,	0x1772,	%i6
	ldsh	[%l7 + 0x5A],	%g3
	fxors	%f23,	%f29,	%f23
	addc	%o6,	%o1,	%g7
	pdist	%f14,	%f2,	%f16
	fpack16	%f6,	%f3
	sra	%g5,	%o5,	%l3
	sdivx	%o0,	0x06E5,	%g1
	movre	%o3,	0x0F0,	%o2
	ldx	[%l7 + 0x70],	%i0
	fcmpgt32	%f2,	%f16,	%o4
	orcc	%i3,	0x1050,	%o7
	sdivcc	%g2,	0x0197,	%l1
	fmuld8ulx16	%f11,	%f26,	%f26
	edge16ln	%i5,	%l4,	%i4
	ldsh	[%l7 + 0x1E],	%l0
	addcc	%l2,	0x1A19,	%l5
	std	%f16,	[%l7 + 0x10]
	fcmpgt32	%f4,	%f4,	%i1
	fmul8ulx16	%f18,	%f12,	%f30
	udivcc	%g6,	0x1392,	%g4
	stb	%l6,	[%l7 + 0x59]
	xor	%i2,	%i7,	%g3
	fmovrde	%i6,	%f8,	%f2
	orcc	%o6,	0x0829,	%o1
	fmovsgu	%icc,	%f7,	%f5
	orncc	%g7,	%o5,	%g5
	fandnot1s	%f22,	%f22,	%f9
	movrgz	%o0,	%l3,	%g1
	movle	%xcc,	%o3,	%o2
	sdivcc	%o4,	0x0999,	%i3
	ldsh	[%l7 + 0x50],	%i0
	fand	%f18,	%f4,	%f22
	fornot1s	%f29,	%f22,	%f4
	ldub	[%l7 + 0x33],	%g2
	stx	%o7,	[%l7 + 0x70]
	array8	%i5,	%l1,	%i4
	movrgz	%l4,	%l0,	%l2
	fmovrslz	%l5,	%f14,	%f25
	fmovscs	%xcc,	%f5,	%f28
	fmovdvs	%xcc,	%f26,	%f15
	xorcc	%g6,	0x1CA1,	%i1
	sdivx	%g4,	0x1311,	%i2
	mulscc	%l6,	0x01E9,	%g3
	std	%f20,	[%l7 + 0x60]
	fmul8x16	%f18,	%f2,	%f2
	fmovdle	%xcc,	%f15,	%f15
	movge	%icc,	%i6,	%o6
	stb	%i7,	[%l7 + 0x0F]
	edge8n	%o1,	%g7,	%g5
	stb	%o5,	[%l7 + 0x4F]
	ldsw	[%l7 + 0x18],	%l3
	edge8l	%o0,	%o3,	%g1
	array32	%o4,	%i3,	%i0
	fxnors	%f22,	%f8,	%f12
	fmul8ulx16	%f4,	%f20,	%f20
	fcmps	%fcc1,	%f13,	%f23
	xnorcc	%g2,	%o7,	%i5
	sdiv	%o2,	0x092A,	%i4
	edge16l	%l1,	%l0,	%l2
	srl	%l5,	0x05,	%l4
	movrgez	%g6,	0x0C7,	%g4
	stw	%i1,	[%l7 + 0x30]
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	ldsw	[%l7 + 0x2C],	%o6
	fmovdvc	%icc,	%f25,	%f22
	edge32ln	%i7,	%i2,	%o1
	fxnors	%f6,	%f24,	%f0
	sth	%g7,	[%l7 + 0x76]
	fmul8ulx16	%f6,	%f16,	%f24
	lduh	[%l7 + 0x38],	%g5
	smul	%l3,	%o0,	%o3
	ldub	[%l7 + 0x45],	%g1
	udivcc	%o4,	0x1E6A,	%o5
	subc	%i3,	0x0F62,	%i0
	umul	%g2,	%o7,	%o2
	ld	[%l7 + 0x48],	%f31
	ldx	[%l7 + 0x50],	%i5
	edge8	%l1,	%l0,	%i4
	stb	%l5,	[%l7 + 0x7E]
	move	%xcc,	%l2,	%l4
	fzeros	%f0
	movleu	%icc,	%g6,	%i1
	edge32ln	%g4,	%l6,	%g3
	fornot1	%f22,	%f8,	%f30
	array32	%o6,	%i7,	%i6
	edge8l	%o1,	%i2,	%g5
	xorcc	%l3,	%o0,	%g7
	popc	0x16D0,	%o3
	fmovsa	%icc,	%f3,	%f15
	movg	%icc,	%o4,	%g1
	udiv	%o5,	0x1A13,	%i0
	alignaddrl	%g2,	%o7,	%i3
	edge16l	%i5,	%l1,	%o2
	umul	%i4,	%l5,	%l2
	ldx	[%l7 + 0x28],	%l4
	array16	%l0,	%i1,	%g4
	srax	%g6,	%g3,	%l6
	umulcc	%o6,	0x1C17,	%i7
	popc	%o1,	%i6
	fmovrse	%g5,	%f4,	%f18
	restore %i2, %o0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o3,	%g7,	%g1
	fmovrsgz	%o5,	%f24,	%f31
	fmovse	%xcc,	%f16,	%f1
	ldub	[%l7 + 0x3E],	%o4
	or	%i0,	%g2,	%o7
	lduh	[%l7 + 0x58],	%i3
	edge8n	%l1,	%o2,	%i4
	movcc	%icc,	%l5,	%l2
	st	%f5,	[%l7 + 0x1C]
	fmovsg	%icc,	%f13,	%f20
	movcs	%icc,	%l4,	%i5
	orncc	%l0,	0x1BBB,	%g4
	ldd	[%l7 + 0x68],	%g6
	fmovsne	%xcc,	%f0,	%f21
	edge16	%i1,	%g3,	%l6
	srl	%o6,	%i7,	%o1
	udivx	%i6,	0x1968,	%i2
	fones	%f4
	add	%g5,	0x061B,	%l3
	fnegd	%f16,	%f16
	std	%f10,	[%l7 + 0x58]
	stx	%o3,	[%l7 + 0x60]
	subc	%g7,	%g1,	%o5
	and	%o0,	0x0752,	%i0
	nop
	set	0x34, %o1
	ldsh	[%l7 + %o1],	%g2
	movrgz	%o4,	%i3,	%o7
	fmovdpos	%icc,	%f7,	%f8
	move	%xcc,	%l1,	%o2
	ldsw	[%l7 + 0x60],	%l5
	orn	%l2,	0x1950,	%l4
	fnand	%f10,	%f26,	%f16
	add	%i5,	0x1103,	%l0
	fnor	%f0,	%f24,	%f4
	ldd	[%l7 + 0x10],	%f8
	fmovrdlez	%g4,	%f20,	%f4
	array16	%i4,	%g6,	%i1
	movl	%xcc,	%g3,	%l6
	pdist	%f28,	%f24,	%f30
	udivcc	%o6,	0x130F,	%i7
	fpackfix	%f10,	%f21
	fsrc2s	%f22,	%f18
	movrgz	%o1,	%i2,	%i6
	fpsub32	%f22,	%f0,	%f0
	orncc	%g5,	0x14A3,	%l3
	edge32l	%o3,	%g1,	%o5
	ldsw	[%l7 + 0x10],	%o0
	movleu	%xcc,	%g7,	%g2
	move	%xcc,	%o4,	%i0
	st	%f9,	[%l7 + 0x28]
	movl	%xcc,	%o7,	%l1
	udiv	%i3,	0x127C,	%l5
	movg	%xcc,	%l2,	%l4
	movge	%icc,	%o2,	%i5
	udivcc	%l0,	0x1003,	%i4
	stb	%g4,	[%l7 + 0x4E]
	ldd	[%l7 + 0x40],	%f0
	movleu	%xcc,	%g6,	%i1
	fcmple16	%f30,	%f20,	%l6
	mulscc	%g3,	0x02BB,	%o6
	alignaddr	%i7,	%o1,	%i6
	ldsb	[%l7 + 0x6A],	%i2
	addc	%g5,	%o3,	%g1
	fmovdcs	%icc,	%f1,	%f9
	orcc	%l3,	0x1C75,	%o0
	fmovrsne	%o5,	%f3,	%f0
	popc	%g2,	%g7
	fmul8x16al	%f31,	%f20,	%f2
	fmovdcs	%xcc,	%f25,	%f5
	orncc	%o4,	%i0,	%l1
	sdiv	%i3,	0x0698,	%o7
	movgu	%icc,	%l2,	%l5
	movrne	%o2,	0x226,	%i5
	fmovse	%xcc,	%f14,	%f4
	edge16l	%l4,	%l0,	%g4
	orncc	%i4,	%i1,	%l6
	edge16ln	%g6,	%o6,	%g3
	fornot1s	%f29,	%f5,	%f13
	ldx	[%l7 + 0x30],	%i7
	movcs	%xcc,	%o1,	%i2
	array16	%g5,	%i6,	%o3
	mulscc	%l3,	0x182C,	%o0
	addcc	%g1,	%g2,	%o5
	ldsw	[%l7 + 0x5C],	%o4
	orn	%g7,	0x1D01,	%l1
	subccc	%i3,	0x1551,	%i0
	addccc	%o7,	0x036B,	%l5
	udivx	%l2,	0x1CD5,	%i5
	smulcc	%l4,	%l0,	%g4
	std	%f30,	[%l7 + 0x18]
	fmovdl	%xcc,	%f15,	%f27
	udiv	%i4,	0x17D1,	%i1
	srl	%o2,	0x17,	%l6
	movneg	%icc,	%o6,	%g3
	fnand	%f16,	%f6,	%f14
	umulcc	%i7,	%o1,	%i2
	addcc	%g5,	0x1FC2,	%i6
	fcmpgt32	%f18,	%f30,	%g6
	popc	%l3,	%o0
	edge32	%g1,	%o3,	%g2
	orn	%o4,	0x0060,	%o5
	sir	0x1C60
	orncc	%l1,	0x114F,	%g7
	andn	%i0,	0x1ACC,	%i3
	mulx	%o7,	%l5,	%i5
	sub	%l2,	%l4,	%g4
	subc	%i4,	0x1269,	%l0
	xor	%i1,	%o2,	%o6
	fpackfix	%f30,	%f29
	edge32	%l6,	%g3,	%o1
	fmovdvs	%xcc,	%f0,	%f11
	fcmpne32	%f16,	%f24,	%i2
	ldsh	[%l7 + 0x2A],	%g5
	sllx	%i7,	0x07,	%i6
	stw	%l3,	[%l7 + 0x5C]
	sethi	0x1344,	%g6
	fzeros	%f25
	sll	%o0,	%o3,	%g2
	ldsw	[%l7 + 0x10],	%g1
	fpadd16s	%f6,	%f6,	%f10
	fandnot2s	%f18,	%f27,	%f25
	movrlz	%o5,	0x3E2,	%o4
	st	%f12,	[%l7 + 0x74]
	movneg	%icc,	%l1,	%g7
	st	%f22,	[%l7 + 0x2C]
	subc	%i3,	%i0,	%l5
	fmovrde	%i5,	%f0,	%f8
	sethi	0x0538,	%o7
	move	%xcc,	%l4,	%l2
	lduw	[%l7 + 0x34],	%g4
	fmovsvs	%icc,	%f27,	%f21
	stx	%i4,	[%l7 + 0x08]
	edge16l	%l0,	%i1,	%o6
	fmovsn	%xcc,	%f12,	%f20
	fzero	%f18
	movle	%icc,	%o2,	%g3
	ldsh	[%l7 + 0x2A],	%o1
	sdivx	%i2,	0x02C6,	%l6
	fands	%f25,	%f18,	%f5
	fmovdge	%icc,	%f2,	%f2
	sll	%g5,	%i7,	%i6
	or	%g6,	0x1126,	%o0
	srl	%o3,	%g2,	%l3
	ldub	[%l7 + 0x61],	%g1
	or	%o5,	0x1414,	%l1
	movrgez	%g7,	%i3,	%o4
	fmovda	%icc,	%f22,	%f21
	edge16	%i0,	%l5,	%i5
	fnot1s	%f18,	%f20
	fmovsvc	%xcc,	%f4,	%f19
	movcs	%icc,	%o7,	%l2
	fmovrslz	%g4,	%f2,	%f6
	stb	%i4,	[%l7 + 0x32]
	sra	%l0,	%i1,	%l4
	fnot2s	%f15,	%f5
	xorcc	%o6,	%g3,	%o1
	andn	%i2,	0x0830,	%l6
	fmul8x16al	%f16,	%f26,	%f26
	edge16ln	%g5,	%o2,	%i6
	fmovdleu	%xcc,	%f26,	%f10
	save %i7, %g6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o3,	0x1BE7,	%l3
	popc	0x1E81,	%g1
	ldd	[%l7 + 0x08],	%o4
	movrgez	%l1,	%g7,	%g2
	sir	0x08C7
	fzero	%f0
	sub	%o4,	%i3,	%i0
	xnorcc	%i5,	%o7,	%l5
	fnands	%f27,	%f24,	%f23
	edge8	%l2,	%g4,	%l0
	alignaddrl	%i4,	%l4,	%i1
	subcc	%o6,	0x1214,	%o1
	fmovrslz	%g3,	%f29,	%f20
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	andn	%o2,	0x1BE5,	%i7
	movge	%xcc,	%g6,	%i6
	movl	%xcc,	%o3,	%o0
	edge16ln	%g1,	%l3,	%o5
	edge16l	%l1,	%g7,	%g2
	movre	%i3,	%i0,	%i5
	fcmpne32	%f8,	%f16,	%o7
	xnor	%o4,	0x1A15,	%l5
	fmovda	%xcc,	%f17,	%f1
	fmovdcs	%xcc,	%f31,	%f24
	sra	%l2,	0x17,	%l0
	smulcc	%g4,	0x1F8B,	%i4
	ldd	[%l7 + 0x70],	%i0
	ldsh	[%l7 + 0x16],	%o6
	siam	0x4
	array32	%o1,	%l4,	%l6
	movneg	%xcc,	%g5,	%i2
	srl	%g3,	%i7,	%g6
	fmovdle	%icc,	%f23,	%f19
	fnors	%f24,	%f16,	%f4
	orncc	%o2,	0x011E,	%i6
	addc	%o0,	%g1,	%l3
	stw	%o5,	[%l7 + 0x08]
	edge8n	%l1,	%g7,	%g2
	movrne	%i3,	%o3,	%i5
	movpos	%icc,	%o7,	%i0
	sllx	%l5,	%o4,	%l2
	edge32	%l0,	%g4,	%i1
	edge32l	%o6,	%o1,	%l4
	fmovdcc	%xcc,	%f28,	%f24
	fpackfix	%f4,	%f6
	udiv	%i4,	0x0FB9,	%l6
	movl	%xcc,	%g5,	%i2
	fandnot2s	%f22,	%f29,	%f15
	fmovse	%xcc,	%f16,	%f1
	sth	%i7,	[%l7 + 0x78]
	movge	%xcc,	%g3,	%o2
	fpadd32	%f10,	%f18,	%f4
	edge16l	%i6,	%g6,	%g1
	sethi	0x0F7C,	%l3
	alignaddrl	%o5,	%o0,	%l1
	sub	%g2,	0x1551,	%g7
	sub	%o3,	%i5,	%i3
	movgu	%icc,	%o7,	%l5
	ldsb	[%l7 + 0x08],	%i0
	movpos	%icc,	%o4,	%l2
	movrne	%l0,	0x1DA,	%i1
	edge32n	%g4,	%o6,	%o1
	movrgz	%i4,	%l6,	%g5
	fornot1s	%f31,	%f30,	%f7
	lduh	[%l7 + 0x2A],	%i2
	st	%f18,	[%l7 + 0x50]
	movrgz	%l4,	0x0C4,	%i7
	movpos	%xcc,	%g3,	%i6
	sllx	%g6,	0x0F,	%g1
	nop
	set	0x59, %g4
	stb	%o2,	[%l7 + %g4]
	umul	%o5,	%l3,	%o0
	fcmpeq32	%f22,	%f0,	%g2
	xor	%l1,	0x0AF7,	%o3
	sethi	0x00BE,	%i5
	fandnot1	%f6,	%f10,	%f6
	mulscc	%g7,	%o7,	%i3
	movne	%icc,	%i0,	%o4
	fandnot1s	%f19,	%f5,	%f22
	movrgz	%l2,	%l5,	%l0
	ldd	[%l7 + 0x30],	%i0
	fmovsge	%xcc,	%f1,	%f20
	addcc	%g4,	%o6,	%o1
	movpos	%icc,	%i4,	%l6
	movrlez	%g5,	0x094,	%i2
	stx	%i7,	[%l7 + 0x48]
	ldsb	[%l7 + 0x49],	%l4
	sethi	0x105B,	%i6
	movrne	%g6,	0x2B2,	%g1
	add	%g3,	0x1F98,	%o5
	addcc	%o2,	%o0,	%g2
	subccc	%l1,	%o3,	%l3
	sllx	%g7,	%o7,	%i3
	alignaddr	%i5,	%i0,	%l2
	movcc	%icc,	%l5,	%o4
	add	%l0,	%g4,	%o6
	fandnot1s	%f10,	%f29,	%f16
	mova	%icc,	%o1,	%i4
	ldsb	[%l7 + 0x32],	%i1
	movl	%icc,	%g5,	%l6
	udiv	%i7,	0x1350,	%i2
	movle	%xcc,	%i6,	%l4
	fmuld8ulx16	%f26,	%f3,	%f28
	edge8	%g1,	%g6,	%o5
	sub	%g3,	%o2,	%g2
	mova	%icc,	%o0,	%l1
	popc	%l3,	%o3
	fzeros	%f31
	add	%o7,	%g7,	%i5
	stx	%i0,	[%l7 + 0x20]
	edge32ln	%l2,	%l5,	%i3
	fands	%f11,	%f17,	%f21
	sdiv	%l0,	0x0E72,	%o4
	ldsh	[%l7 + 0x36],	%g4
	edge8ln	%o1,	%o6,	%i4
	fornot2s	%f5,	%f6,	%f16
	andncc	%i1,	%g5,	%l6
	andn	%i2,	0x1D85,	%i6
	movre	%l4,	0x1F5,	%g1
	stb	%i7,	[%l7 + 0x60]
	srlx	%o5,	0x13,	%g6
	movvc	%icc,	%o2,	%g2
	edge32	%g3,	%o0,	%l1
	ld	[%l7 + 0x58],	%f7
	popc	0x07A4,	%o3
	subccc	%o7,	0x1B57,	%l3
	xor	%g7,	0x09AD,	%i0
	std	%f2,	[%l7 + 0x08]
	movrgz	%i5,	%l5,	%i3
	array16	%l0,	%o4,	%g4
	move	%xcc,	%o1,	%o6
	andcc	%i4,	0x09BF,	%l2
	fpsub32s	%f12,	%f16,	%f16
	addc	%i1,	0x17AE,	%l6
	popc	0x0680,	%g5
	fornot2	%f16,	%f22,	%f0
	fnot2s	%f16,	%f23
	nop
	set	0x08, %l5
	ldx	[%l7 + %l5],	%i2
	movvc	%icc,	%i6,	%l4
	srlx	%g1,	%i7,	%g6
	sdivx	%o5,	0x166C,	%g2
	alignaddr	%g3,	%o0,	%o2
	movgu	%xcc,	%l1,	%o3
	andncc	%l3,	%g7,	%i0
	fmovsvc	%xcc,	%f23,	%f21
	addccc	%i5,	%l5,	%o7
	array32	%l0,	%i3,	%o4
	movle	%icc,	%g4,	%o1
	ldsw	[%l7 + 0x1C],	%i4
	edge16ln	%l2,	%i1,	%l6
	orcc	%g5,	%o6,	%i6
	ldx	[%l7 + 0x60],	%i2
	movleu	%icc,	%l4,	%g1
	fpadd32s	%f12,	%f21,	%f5
	edge32ln	%g6,	%o5,	%i7
	alignaddr	%g2,	%o0,	%g3
	andcc	%o2,	%l1,	%o3
	sethi	0x074F,	%l3
	fmul8ulx16	%f24,	%f2,	%f6
	fzero	%f14
	movle	%icc,	%g7,	%i0
	fmovdle	%xcc,	%f29,	%f19
	fmovsge	%xcc,	%f5,	%f4
	fsrc1s	%f9,	%f22
	fmovsge	%icc,	%f29,	%f13
	edge16l	%l5,	%o7,	%l0
	lduh	[%l7 + 0x4A],	%i3
	xor	%o4,	0x0560,	%g4
	srax	%o1,	0x18,	%i5
	movpos	%icc,	%l2,	%i4
	movrlez	%i1,	%l6,	%o6
	udiv	%i6,	0x158E,	%i2
	std	%f4,	[%l7 + 0x28]
	umulcc	%l4,	0x12BB,	%g5
	add	%g1,	0x007E,	%g6
	xnor	%i7,	%g2,	%o0
	orncc	%o5,	%o2,	%g3
	movvs	%xcc,	%o3,	%l3
	fmovsge	%xcc,	%f5,	%f29
	andn	%g7,	0x0B07,	%i0
	andncc	%l1,	%o7,	%l5
	alignaddrl	%l0,	%o4,	%i3
	addc	%g4,	0x0EEB,	%o1
	lduh	[%l7 + 0x68],	%i5
	array16	%i4,	%i1,	%l6
	sll	%o6,	0x1A,	%l2
	array8	%i6,	%i2,	%l4
	movcs	%xcc,	%g1,	%g5
	stx	%g6,	[%l7 + 0x70]
	fmovdvc	%icc,	%f19,	%f8
	xnor	%g2,	0x1C27,	%i7
	edge16n	%o5,	%o2,	%g3
	movn	%icc,	%o0,	%o3
	ldd	[%l7 + 0x28],	%f2
	or	%l3,	%i0,	%g7
	edge8l	%o7,	%l5,	%l0
	fcmple16	%f28,	%f12,	%l1
	fmovsge	%xcc,	%f17,	%f10
	movvc	%icc,	%o4,	%i3
	fmuld8sux16	%f18,	%f28,	%f22
	sir	0x1F64
	fmul8x16au	%f18,	%f20,	%f2
	edge16	%o1,	%i5,	%g4
	udivcc	%i1,	0x192E,	%l6
	orcc	%i4,	%o6,	%i6
	smulcc	%l2,	%i2,	%l4
	orn	%g1,	%g6,	%g5
	andncc	%i7,	%g2,	%o2
	sllx	%o5,	%o0,	%o3
	ldd	[%l7 + 0x60],	%f18
	for	%f16,	%f8,	%f0
	ldsw	[%l7 + 0x30],	%l3
	movrlz	%i0,	0x06D,	%g7
	alignaddr	%o7,	%g3,	%l0
	srax	%l1,	%o4,	%l5
	fornot1s	%f1,	%f2,	%f7
	nop
	set	0x58, %o4
	ldx	[%l7 + %o4],	%i3
	edge32ln	%i5,	%o1,	%i1
	fmovsn	%icc,	%f10,	%f0
	alignaddr	%l6,	%i4,	%g4
	movpos	%icc,	%o6,	%i6
	fnot2	%f16,	%f16
	fmul8x16al	%f17,	%f13,	%f0
	edge32ln	%l2,	%i2,	%l4
	fmovrslez	%g1,	%f31,	%f25
	fpadd16s	%f8,	%f27,	%f26
	movvc	%icc,	%g5,	%g6
	ldsh	[%l7 + 0x08],	%g2
	fmovsvs	%icc,	%f20,	%f11
	edge16ln	%o2,	%i7,	%o0
	edge16	%o3,	%l3,	%o5
	xor	%g7,	0x13C3,	%i0
	stx	%o7,	[%l7 + 0x10]
	ldsw	[%l7 + 0x3C],	%g3
	orncc	%l1,	0x103B,	%o4
	fpadd32	%f28,	%f12,	%f8
	sdivcc	%l5,	0x1BFA,	%i3
	fmovdl	%icc,	%f11,	%f15
	and	%i5,	0x1067,	%o1
	fcmpes	%fcc2,	%f10,	%f2
	mova	%icc,	%l0,	%i1
	movle	%xcc,	%i4,	%l6
	movrne	%g4,	%i6,	%l2
	movg	%xcc,	%i2,	%l4
	stx	%o6,	[%l7 + 0x68]
	fand	%f18,	%f14,	%f0
	movne	%xcc,	%g5,	%g1
	fmovsleu	%xcc,	%f25,	%f7
	faligndata	%f20,	%f14,	%f8
	mova	%icc,	%g6,	%o2
	sllx	%i7,	%o0,	%o3
	edge32ln	%g2,	%o5,	%g7
	sll	%i0,	%l3,	%o7
	orn	%g3,	0x0B66,	%l1
	mulscc	%o4,	%i3,	%i5
	umul	%l5,	%o1,	%l0
	fabsd	%f12,	%f12
	sra	%i1,	0x15,	%i4
	fcmpeq16	%f0,	%f26,	%g4
	movg	%icc,	%l6,	%l2
	add	%i2,	0x0A5B,	%i6
	movrlz	%l4,	0x0CC,	%g5
	movge	%xcc,	%o6,	%g1
	sethi	0x0FD4,	%g6
	fornot1s	%f2,	%f9,	%f16
	st	%f10,	[%l7 + 0x0C]
	fmovdvs	%icc,	%f6,	%f8
	fxnors	%f15,	%f28,	%f9
	ldsw	[%l7 + 0x34],	%i7
	st	%f9,	[%l7 + 0x48]
	addc	%o2,	%o3,	%g2
	xor	%o0,	0x0A1A,	%g7
	orn	%o5,	0x17FB,	%i0
	siam	0x2
	xnor	%o7,	%l3,	%g3
	orn	%o4,	0x00A5,	%l1
	ldub	[%l7 + 0x5B],	%i5
	fmovsge	%xcc,	%f27,	%f31
	edge8l	%i3,	%l5,	%o1
	subccc	%i1,	%l0,	%g4
	fmovsge	%xcc,	%f18,	%f15
	edge32n	%i4,	%l6,	%l2
	std	%f24,	[%l7 + 0x58]
	array8	%i6,	%i2,	%l4
	sth	%o6,	[%l7 + 0x26]
	sdivcc	%g5,	0x1FD8,	%g6
	movg	%xcc,	%i7,	%o2
	movrgz	%o3,	%g1,	%g2
	popc	%g7,	%o5
	movge	%xcc,	%i0,	%o7
	fmuld8ulx16	%f22,	%f3,	%f6
	edge8n	%o0,	%l3,	%g3
	fsrc1	%f16,	%f28
	sir	0x01A9
	fmuld8sux16	%f14,	%f11,	%f6
	fornot1	%f20,	%f28,	%f26
	orcc	%o4,	0x132F,	%i5
	xnor	%l1,	0x03AD,	%l5
	fsrc2	%f26,	%f30
	sll	%i3,	%o1,	%l0
	fmovdcc	%icc,	%f4,	%f20
	or	%g4,	%i4,	%l6
	save %i1, %l2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%i2,	%l4
	udivcc	%o6,	0x0BFD,	%g5
	andncc	%i7,	%o2,	%o3
	array8	%g6,	%g1,	%g7
	or	%o5,	%i0,	%o7
	fmovspos	%icc,	%f28,	%f6
	xor	%g2,	%o0,	%g3
	subcc	%o4,	0x0AA4,	%i5
	ldsw	[%l7 + 0x60],	%l1
	andn	%l3,	%l5,	%i3
	fpmerge	%f8,	%f0,	%f14
	movn	%icc,	%l0,	%g4
	edge8ln	%o1,	%l6,	%i4
	restore %l2, 0x119A, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i2,	0x07E8,	%l4
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%i6
	movre	%g5,	0x10A,	%o6
	fmovrslz	%i7,	%f21,	%f21
	fmovdge	%icc,	%f17,	%f31
	fpsub32s	%f5,	%f8,	%f15
	edge32	%o3,	%g6,	%g1
	lduw	[%l7 + 0x78],	%g7
	andcc	%o5,	0x0AB5,	%i0
	movrgz	%o2,	%o7,	%o0
	fmovsne	%icc,	%f10,	%f29
	movle	%icc,	%g2,	%o4
	edge16n	%i5,	%g3,	%l1
	move	%icc,	%l5,	%i3
	srl	%l0,	0x14,	%g4
	movge	%xcc,	%o1,	%l6
	udivx	%l3,	0x133D,	%l2
	fnors	%f23,	%f3,	%f4
	movgu	%icc,	%i4,	%i1
	srlx	%l4,	0x14,	%i6
	smul	%g5,	0x0DB7,	%o6
	fmovdg	%icc,	%f24,	%f14
	fcmpeq16	%f30,	%f28,	%i7
	fxnors	%f14,	%f10,	%f23
	ldd	[%l7 + 0x68],	%o2
	xorcc	%g6,	%g1,	%g7
	stb	%i2,	[%l7 + 0x29]
	movrlz	%o5,	%i0,	%o2
	umul	%o0,	%o7,	%o4
	sdiv	%g2,	0x0B95,	%g3
	sub	%i5,	%l5,	%i3
	fmovde	%xcc,	%f15,	%f28
	movl	%xcc,	%l1,	%g4
	ldd	[%l7 + 0x48],	%l0
	fand	%f8,	%f8,	%f28
	array32	%l6,	%o1,	%l3
	udivcc	%l2,	0x00DF,	%i4
	subccc	%l4,	0x0D75,	%i1
	edge8ln	%g5,	%o6,	%i7
	fones	%f22
	smulcc	%i6,	%g6,	%o3
	smulcc	%g1,	%g7,	%o5
	array32	%i0,	%i2,	%o0
	edge32	%o2,	%o7,	%g2
	fxors	%f8,	%f1,	%f4
	edge32ln	%o4,	%i5,	%l5
	std	%f6,	[%l7 + 0x18]
	popc	%g3,	%i3
	fornot1	%f8,	%f4,	%f2
	fnot1s	%f31,	%f29
	save %g4, 0x0203, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l6,	0x155F,	%l1
	movne	%xcc,	%o1,	%l2
	smulcc	%l3,	0x060C,	%l4
	fnors	%f8,	%f15,	%f11
	stx	%i4,	[%l7 + 0x70]
	edge8	%g5,	%i1,	%i7
	srlx	%i6,	0x0D,	%g6
	addc	%o3,	%o6,	%g1
	movrgz	%g7,	%i0,	%o5
	movne	%xcc,	%o0,	%o2
	fmovdvs	%xcc,	%f6,	%f22
	movrgez	%o7,	%i2,	%o4
	movvc	%xcc,	%i5,	%g2
	umulcc	%l5,	0x0586,	%i3
	umulcc	%g4,	0x0680,	%l0
	sth	%g3,	[%l7 + 0x6A]
	fmovsg	%icc,	%f26,	%f15
	edge32l	%l6,	%l1,	%o1
	alignaddrl	%l2,	%l3,	%l4
	movneg	%icc,	%i4,	%g5
	fmovrdlez	%i7,	%f8,	%f10
	sir	0x1038
	ldsb	[%l7 + 0x19],	%i6
	sir	0x1EDA
	fxor	%f10,	%f20,	%f10
	movrne	%g6,	0x1E4,	%o3
	sll	%i1,	%g1,	%g7
	movpos	%icc,	%i0,	%o6
	subcc	%o5,	0x1739,	%o0
	andcc	%o2,	%o7,	%i2
	ldd	[%l7 + 0x68],	%o4
	umul	%i5,	0x0A55,	%l5
	subccc	%g2,	0x170F,	%g4
	bshuffle	%f30,	%f0,	%f20
	fnegs	%f30,	%f18
	array32	%i3,	%l0,	%l6
	addc	%l1,	0x0008,	%o1
	fmuld8ulx16	%f11,	%f7,	%f28
	edge32l	%g3,	%l3,	%l4
	popc	%i4,	%l2
	fmovrslez	%i7,	%f16,	%f30
	movcs	%xcc,	%i6,	%g6
	sdivx	%g5,	0x0A45,	%i1
	fnegd	%f30,	%f6
	fnors	%f7,	%f11,	%f27
	ldub	[%l7 + 0x5A],	%g1
	alignaddrl	%g7,	%i0,	%o3
	movge	%icc,	%o6,	%o0
	fmovrdne	%o2,	%f8,	%f2
	xnorcc	%o5,	%i2,	%o7
	xor	%i5,	%o4,	%l5
	movge	%xcc,	%g2,	%i3
	ld	[%l7 + 0x54],	%f24
	movrne	%g4,	0x13F,	%l6
	edge32n	%l1,	%l0,	%g3
	sir	0x06CD
	sub	%o1,	%l4,	%i4
	fsrc2	%f30,	%f12
	addc	%l3,	%i7,	%l2
	ldsh	[%l7 + 0x42],	%g6
	fcmpes	%fcc0,	%f22,	%f31
	fmovdle	%icc,	%f12,	%f28
	fornot2s	%f10,	%f19,	%f30
	subcc	%g5,	%i1,	%g1
	alignaddr	%g7,	%i0,	%o3
	fmovrslez	%i6,	%f18,	%f19
	movcc	%icc,	%o6,	%o0
	movn	%icc,	%o5,	%i2
	movrlez	%o7,	0x165,	%i5
	fmovsne	%icc,	%f3,	%f16
	movvc	%icc,	%o2,	%o4
	st	%f8,	[%l7 + 0x48]
	edge32l	%g2,	%i3,	%g4
	movl	%icc,	%l6,	%l5
	movl	%xcc,	%l1,	%l0
	subcc	%o1,	%l4,	%i4
	addc	%g3,	0x0366,	%l3
	edge32n	%l2,	%g6,	%g5
	subccc	%i7,	%i1,	%g1
	sub	%i0,	0x0725,	%o3
	xnor	%g7,	0x183C,	%o6
	andncc	%o0,	%i6,	%i2
	fpadd32s	%f30,	%f5,	%f7
	lduh	[%l7 + 0x50],	%o5
	fcmpd	%fcc3,	%f2,	%f30
	fornot2s	%f3,	%f21,	%f30
	movvc	%xcc,	%o7,	%o2
	nop
	set	0x08, %o0
	stw	%i5,	[%l7 + %o0]
	sir	0x143D
	lduw	[%l7 + 0x74],	%o4
	fmovd	%f24,	%f4
	fpsub32	%f24,	%f26,	%f16
	fsrc1	%f12,	%f2
	xnorcc	%i3,	0x0CEB,	%g4
	fandnot2	%f30,	%f26,	%f22
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	fmovsvs	%icc,	%f26,	%f6
	movvs	%icc,	%l0,	%l5
	edge32	%o1,	%i4,	%g3
	fpsub16	%f30,	%f18,	%f20
	stb	%l4,	[%l7 + 0x11]
	orncc	%l3,	%g6,	%l2
	umul	%i7,	0x043D,	%i1
	ldsb	[%l7 + 0x46],	%g5
	st	%f2,	[%l7 + 0x20]
	ldx	[%l7 + 0x38],	%g1
	orn	%o3,	%g7,	%o6
	fmovsa	%xcc,	%f10,	%f26
	fpadd32	%f20,	%f20,	%f30
	movrgz	%i0,	%o0,	%i2
	sth	%i6,	[%l7 + 0x2E]
	fmovrsgz	%o5,	%f27,	%f20
	andncc	%o7,	%i5,	%o2
	fnors	%f31,	%f4,	%f30
	edge8l	%o4,	%i3,	%g4
	orncc	%l6,	0x077A,	%l1
	edge16ln	%g2,	%l5,	%l0
	or	%o1,	%g3,	%i4
	udivx	%l3,	0x17B3,	%g6
	fandnot1	%f8,	%f16,	%f6
	orcc	%l2,	%l4,	%i1
	xnor	%i7,	0x018C,	%g1
	sdivcc	%g5,	0x0887,	%g7
	addccc	%o3,	0x0F2E,	%o6
	edge8	%o0,	%i0,	%i2
	edge32	%i6,	%o5,	%o7
	movrgz	%i5,	%o2,	%o4
	fmovrsgez	%i3,	%f17,	%f16
	subcc	%g4,	%l1,	%l6
	movre	%l5,	0x380,	%g2
	smulcc	%l0,	%o1,	%i4
	srl	%g3,	%l3,	%g6
	edge8l	%l4,	%l2,	%i7
	st	%f13,	[%l7 + 0x60]
	mulscc	%g1,	%i1,	%g7
	xorcc	%o3,	%o6,	%o0
	restore %i0, %i2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g5,	0x0ABB,	%o7
	edge16n	%i5,	%o2,	%o4
	std	%f24,	[%l7 + 0x38]
	subc	%o5,	%i3,	%l1
	edge32l	%g4,	%l6,	%g2
	stb	%l5,	[%l7 + 0x6E]
	edge8n	%l0,	%o1,	%i4
	fornot2s	%f17,	%f7,	%f14
	addccc	%l3,	%g3,	%g6
	nop
	set	0x72, %i7
	ldsh	[%l7 + %i7],	%l4
	sdiv	%i7,	0x1ABE,	%g1
	lduh	[%l7 + 0x0C],	%l2
	stw	%g7,	[%l7 + 0x34]
	movvs	%xcc,	%o3,	%o6
	ldsw	[%l7 + 0x14],	%o0
	umul	%i1,	%i0,	%i6
	subc	%g5,	%i2,	%o7
	edge8l	%i5,	%o2,	%o5
	edge8n	%i3,	%o4,	%g4
	mulx	%l1,	%l6,	%l5
	fpackfix	%f30,	%f28
	addccc	%g2,	0x1064,	%o1
	movvc	%icc,	%l0,	%i4
	fnors	%f29,	%f19,	%f14
	and	%g3,	0x0552,	%l3
	ldd	[%l7 + 0x58],	%f28
	alignaddrl	%l4,	%i7,	%g1
	edge16	%l2,	%g6,	%o3
	movne	%xcc,	%g7,	%o6
	movgu	%xcc,	%i1,	%i0
	mova	%xcc,	%o0,	%i6
	orncc	%g5,	0x1855,	%i2
	movre	%o7,	0x2E2,	%o2
	fmovs	%f22,	%f13
	fcmpeq32	%f16,	%f26,	%o5
	sub	%i5,	0x05C4,	%o4
	sll	%i3,	0x13,	%g4
	subccc	%l1,	%l5,	%g2
	sdiv	%o1,	0x0E96,	%l0
	sll	%i4,	%g3,	%l3
	fmul8x16au	%f3,	%f28,	%f16
	setx loop_94, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_94: 	fcmple32	%f14,	%f8,	%g1
	fmovrdne	%i7,	%f22,	%f18
	edge32l	%l2,	%o3,	%g7
	array16	%g6,	%i1,	%i0
	edge8l	%o0,	%i6,	%o6
	fzero	%f2
	fnot2s	%f31,	%f12
	smulcc	%i2,	0x0606,	%g5
	move	%icc,	%o2,	%o7
	movcc	%xcc,	%i5,	%o4
	andncc	%o5,	%i3,	%g4
	sethi	0x0F88,	%l1
	sll	%l5,	%g2,	%l0
	movl	%xcc,	%o1,	%i4
	edge8l	%l3,	%l6,	%g3
	edge8ln	%l4,	%g1,	%l2
	movrgz	%o3,	%g7,	%i7
	movrgz	%i1,	0x22C,	%i0
	edge8	%o0,	%i6,	%o6
	subccc	%i2,	0x1005,	%g5
	fmovdleu	%icc,	%f6,	%f20
	save %o2, 0x0EDB, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i5,	0x065A,	%o4
	movvs	%xcc,	%g6,	%i3
	fmuld8sux16	%f2,	%f23,	%f22
	edge32ln	%g4,	%o5,	%l1
	orn	%l5,	%g2,	%l0
	movn	%icc,	%o1,	%i4
	restore %l6, %g3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g1,	%l3,	%o3
	fmovsne	%xcc,	%f26,	%f17
	for	%f8,	%f12,	%f16
	nop
	set	0x20, %g3
	stw	%g7,	[%l7 + %g3]
	fandnot2s	%f16,	%f30,	%f14
	fzeros	%f4
	addccc	%i7,	0x1660,	%l2
	movge	%xcc,	%i0,	%i1
	movre	%o0,	0x054,	%i6
	udivcc	%i2,	0x01C3,	%o6
	stx	%o2,	[%l7 + 0x48]
	save %g5, %o7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i5,	0x1671,	%g6
	movvs	%icc,	%g4,	%i3
	movrgz	%l1,	%o5,	%l5
	nop
	set	0x58, %l6
	stw	%l0,	[%l7 + %l6]
	move	%icc,	%o1,	%i4
	fxor	%f28,	%f14,	%f20
	subcc	%g2,	%g3,	%l4
	nop
	set	0x19, %l1
	ldsb	[%l7 + %l1],	%l6
	array32	%g1,	%l3,	%o3
	edge32ln	%i7,	%g7,	%l2
	edge32ln	%i1,	%i0,	%o0
	orncc	%i6,	%o6,	%o2
	st	%f8,	[%l7 + 0x54]
	xnor	%i2,	0x1E2C,	%g5
	sll	%o7,	0x19,	%o4
	fmovdleu	%icc,	%f29,	%f17
	stw	%g6,	[%l7 + 0x30]
	sir	0x0C9E
	edge16l	%i5,	%i3,	%l1
	edge8n	%o5,	%g4,	%l0
	edge8l	%o1,	%l5,	%g2
	save %g3, %l4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l6,	0x1D14,	%g1
	movneg	%xcc,	%o3,	%l3
	edge16	%g7,	%i7,	%l2
	lduh	[%l7 + 0x38],	%i0
	addcc	%o0,	%i6,	%o6
	sub	%o2,	0x1598,	%i1
	ldx	[%l7 + 0x10],	%i2
	sethi	0x157B,	%g5
	fpadd16	%f14,	%f18,	%f12
	umulcc	%o4,	%o7,	%g6
	orcc	%i3,	%i5,	%l1
	or	%g4,	0x08AF,	%l0
	srl	%o1,	0x1E,	%l5
	sethi	0x1A0C,	%o5
	fornot2	%f0,	%f6,	%f28
	movge	%icc,	%g2,	%l4
	fnegs	%f19,	%f17
	alignaddrl	%i4,	%g3,	%g1
	std	%f28,	[%l7 + 0x60]
	stw	%o3,	[%l7 + 0x70]
	ldub	[%l7 + 0x48],	%l3
	movrlez	%l6,	0x09B,	%g7
	popc	0x1BD1,	%i7
	udivcc	%i0,	0x0326,	%o0
	edge32	%l2,	%i6,	%o6
	array32	%i1,	%o2,	%g5
	udivx	%i2,	0x06B1,	%o7
	lduw	[%l7 + 0x14],	%g6
	mulscc	%o4,	0x1EB1,	%i5
	fxors	%f9,	%f16,	%f18
	edge8l	%l1,	%g4,	%l0
	fornot1s	%f19,	%f17,	%f13
	sra	%i3,	0x1C,	%o1
	save %l5, %g2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l4,	0x00DB,	%g3
	edge16	%g1,	%i4,	%l3
	array32	%o3,	%l6,	%g7
	fnor	%f8,	%f26,	%f4
	fxnor	%f20,	%f2,	%f28
	ld	[%l7 + 0x58],	%f19
	fpack16	%f0,	%f19
	lduh	[%l7 + 0x44],	%i7
	xor	%o0,	%l2,	%i6
	fornot1s	%f11,	%f21,	%f11
	fornot2	%f10,	%f22,	%f2
	fcmpne32	%f24,	%f28,	%i0
	xorcc	%i1,	0x1A8C,	%o6
	fmovd	%f16,	%f18
	fmovda	%xcc,	%f4,	%f2
	movre	%o2,	%i2,	%o7
	fpack32	%f28,	%f26,	%f28
	edge8n	%g6,	%g5,	%i5
	edge8l	%o4,	%l1,	%g4
	fcmpes	%fcc3,	%f4,	%f7
	and	%l0,	0x195D,	%o1
	fpmerge	%f8,	%f17,	%f14
	fmovrde	%l5,	%f20,	%f16
	fands	%f4,	%f12,	%f3
	subccc	%g2,	%i3,	%o5
	std	%f2,	[%l7 + 0x60]
	edge16	%g3,	%g1,	%l4
	andn	%i4,	0x07AE,	%l3
	sub	%l6,	%g7,	%i7
	umul	%o0,	%l2,	%i6
	movre	%o3,	0x1EF,	%i0
	ldd	[%l7 + 0x30],	%o6
	movrne	%i1,	%o2,	%o7
	fornot1	%f10,	%f24,	%f10
	subcc	%i2,	%g6,	%g5
	srlx	%o4,	%l1,	%g4
	fands	%f22,	%f7,	%f5
	edge32l	%l0,	%i5,	%l5
	fmovdn	%xcc,	%f4,	%f4
	movleu	%xcc,	%o1,	%i3
	movleu	%xcc,	%o5,	%g3
	fpsub16	%f24,	%f4,	%f18
	std	%f8,	[%l7 + 0x28]
	sub	%g2,	0x1597,	%l4
	udivx	%i4,	0x18F9,	%g1
	stw	%l6,	[%l7 + 0x48]
	addcc	%l3,	0x098A,	%g7
	fornot1s	%f28,	%f8,	%f5
	fnands	%f30,	%f22,	%f19
	andncc	%i7,	%o0,	%i6
	fmovse	%xcc,	%f2,	%f18
	fmovrdne	%l2,	%f14,	%f0
	nop
	set	0x5E, %l3
	stb	%o3,	[%l7 + %l3]
	sllx	%i0,	0x14,	%o6
	sir	0x12F1
	fmovrdne	%i1,	%f24,	%f4
	fmul8ulx16	%f2,	%f30,	%f30
	edge16ln	%o7,	%o2,	%i2
	array32	%g5,	%o4,	%l1
	addcc	%g4,	0x04FD,	%g6
	movvs	%xcc,	%l0,	%i5
	edge32	%o1,	%i3,	%l5
	fmuld8ulx16	%f21,	%f13,	%f10
	fmovdcs	%xcc,	%f25,	%f16
	sra	%o5,	%g2,	%l4
	array16	%i4,	%g1,	%l6
	xnor	%g3,	0x1D3E,	%g7
	orncc	%i7,	0x076F,	%l3
	movre	%i6,	%l2,	%o3
	movrne	%i0,	%o6,	%o0
	movcc	%icc,	%i1,	%o2
	movrgez	%o7,	0x3A6,	%g5
	fmovrslz	%i2,	%f15,	%f16
	siam	0x5
	ldx	[%l7 + 0x40],	%o4
	movn	%xcc,	%g4,	%l1
	ldx	[%l7 + 0x18],	%g6
	xor	%l0,	0x1FF4,	%i5
	orcc	%o1,	0x1C55,	%i3
	fnands	%f27,	%f4,	%f8
	xnor	%l5,	%g2,	%o5
	array32	%i4,	%g1,	%l4
	edge8	%l6,	%g7,	%g3
	subc	%i7,	%i6,	%l2
	fornot1s	%f15,	%f17,	%f26
	fmul8x16au	%f31,	%f30,	%f22
	movre	%l3,	%i0,	%o3
	ldd	[%l7 + 0x30],	%o0
	array16	%i1,	%o2,	%o6
	movne	%icc,	%g5,	%i2
	fmovrslz	%o4,	%f29,	%f27
	sdiv	%o7,	0x08A0,	%g4
	edge8l	%g6,	%l1,	%l0
	ldub	[%l7 + 0x0B],	%i5
	addc	%i3,	%o1,	%l5
	xor	%o5,	0x003E,	%g2
	fmovrdlz	%g1,	%f12,	%f24
	orncc	%i4,	%l4,	%g7
	lduw	[%l7 + 0x48],	%l6
	fmul8sux16	%f30,	%f0,	%f8
	fxnor	%f20,	%f22,	%f28
	sll	%g3,	%i7,	%l2
	fcmpgt16	%f16,	%f8,	%l3
	subcc	%i6,	%o3,	%i0
	sth	%o0,	[%l7 + 0x14]
	xnorcc	%i1,	0x0C17,	%o6
	mulscc	%o2,	0x1BF6,	%g5
	fmovdge	%xcc,	%f31,	%f27
	mulscc	%i2,	%o4,	%g4
	addcc	%o7,	%l1,	%g6
	alignaddr	%l0,	%i3,	%i5
	smulcc	%o1,	%l5,	%o5
	umul	%g1,	%i4,	%g2
	lduh	[%l7 + 0x6C],	%g7
	movgu	%xcc,	%l4,	%g3
	smulcc	%l6,	%l2,	%l3
	orcc	%i6,	0x0103,	%o3
	movpos	%xcc,	%i7,	%o0
	popc	%i0,	%o6
	fpadd32	%f16,	%f12,	%f22
	xnor	%o2,	0x03C6,	%i1
	std	%f6,	[%l7 + 0x28]
	fabss	%f21,	%f22
	fsrc1	%f30,	%f10
	udivcc	%i2,	0x10F2,	%g5
	lduw	[%l7 + 0x64],	%o4
	xnorcc	%o7,	0x0E75,	%l1
	lduw	[%l7 + 0x30],	%g4
	udivx	%l0,	0x0EAF,	%i3
	movneg	%icc,	%i5,	%o1
	smulcc	%g6,	%o5,	%g1
	udivcc	%l5,	0x1B99,	%i4
	ld	[%l7 + 0x5C],	%f9
	ldub	[%l7 + 0x53],	%g7
	sllx	%g2,	0x0B,	%g3
	move	%icc,	%l4,	%l2
	movrlez	%l6,	%l3,	%o3
	edge32	%i7,	%i6,	%o0
	movge	%icc,	%o6,	%o2
	ldsb	[%l7 + 0x1A],	%i0
	move	%icc,	%i1,	%i2
	subc	%o4,	0x1A97,	%g5
	fpack32	%f22,	%f18,	%f12
	fpmerge	%f26,	%f10,	%f20
	fmovs	%f15,	%f28
	stx	%l1,	[%l7 + 0x40]
	movn	%icc,	%g4,	%o7
	edge16n	%i3,	%l0,	%o1
	movleu	%xcc,	%g6,	%o5
	fcmped	%fcc2,	%f8,	%f24
	movvs	%icc,	%i5,	%l5
	save %i4, %g7, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g3, 0x02D0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_95, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_95: 	add	%o3,	0x1B92,	%i7
	movvc	%icc,	%l3,	%i6
	sth	%o6,	[%l7 + 0x3E]
	ldsh	[%l7 + 0x3E],	%o0
	nop
	set	0x5E, %g2
	ldsh	[%l7 + %g2],	%o2
	ldub	[%l7 + 0x7F],	%i0
	umulcc	%i2,	%i1,	%g5
	movg	%icc,	%l1,	%g4
	edge32	%o7,	%i3,	%o4
	fexpand	%f11,	%f26
	sdivcc	%o1,	0x0B0D,	%l0
	sth	%o5,	[%l7 + 0x3C]
	lduh	[%l7 + 0x24],	%g6
	lduh	[%l7 + 0x40],	%l5
	udivcc	%i4,	0x1918,	%g7
	sdivx	%i5,	0x028C,	%g3
	movgu	%icc,	%g1,	%l4
	fexpand	%f31,	%f24
	movleu	%icc,	%l6,	%g2
	ldd	[%l7 + 0x78],	%o2
	alignaddr	%l2,	%i7,	%l3
	fcmpgt16	%f18,	%f10,	%o6
	fnand	%f6,	%f16,	%f30
	ld	[%l7 + 0x30],	%f28
	orn	%o0,	%i6,	%o2
	sub	%i2,	%i0,	%i1
	fnand	%f18,	%f0,	%f22
	fpackfix	%f28,	%f11
	fmovda	%icc,	%f4,	%f26
	ldx	[%l7 + 0x28],	%l1
	srax	%g5,	0x07,	%g4
	movrlez	%i3,	0x317,	%o4
	edge8	%o1,	%l0,	%o7
	edge16l	%g6,	%l5,	%o5
	sdivcc	%g7,	0x1354,	%i4
	movleu	%xcc,	%g3,	%i5
	movvs	%icc,	%l4,	%g1
	sll	%l6,	%o3,	%g2
	movg	%xcc,	%i7,	%l2
	smulcc	%l3,	0x0DF2,	%o6
	std	%f10,	[%l7 + 0x60]
	edge16l	%i6,	%o2,	%o0
	ldsb	[%l7 + 0x1B],	%i0
	ldsw	[%l7 + 0x58],	%i1
	fnor	%f4,	%f2,	%f14
	orn	%l1,	%g5,	%g4
	or	%i3,	0x072F,	%o4
	fmovdge	%xcc,	%f14,	%f30
	sllx	%i2,	%l0,	%o1
	ld	[%l7 + 0x68],	%f13
	addccc	%o7,	0x08D9,	%g6
	addcc	%l5,	%o5,	%g7
	or	%g3,	%i4,	%i5
	restore %g1, 0x14DD, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f1,	%f31,	%f4
	movrgz	%o3,	0x10D,	%g2
	movrlez	%i7,	0x34D,	%l6
	movle	%xcc,	%l2,	%o6
	xnor	%l3,	0x1570,	%o2
	smul	%o0,	0x1314,	%i0
	sdivcc	%i1,	0x0CDD,	%l1
	sir	0x1176
	fors	%f5,	%f31,	%f26
	edge16	%g5,	%g4,	%i6
	sdivx	%i3,	0x0E0B,	%o4
	std	%f24,	[%l7 + 0x20]
	srlx	%i2,	0x0F,	%o1
	fmovrde	%l0,	%f16,	%f18
	xor	%g6,	0x1380,	%o7
	movge	%xcc,	%o5,	%l5
	movg	%xcc,	%g7,	%g3
	fzeros	%f0
	movvs	%icc,	%i4,	%i5
	fmovrslez	%l4,	%f11,	%f0
	xnor	%g1,	%o3,	%i7
	stb	%l6,	[%l7 + 0x3C]
	popc	%l2,	%o6
	movrne	%g2,	0x14C,	%o2
	srlx	%o0,	0x17,	%l3
	st	%f11,	[%l7 + 0x0C]
	subccc	%i0,	%l1,	%g5
	andn	%i1,	0x0774,	%i6
	array16	%i3,	%g4,	%o4
	edge8ln	%o1,	%l0,	%g6
	movpos	%icc,	%o7,	%o5
	add	%l5,	0x0D46,	%g7
	sdiv	%i2,	0x00CB,	%g3
	umul	%i4,	0x06B5,	%l4
	movgu	%icc,	%g1,	%i5
	fors	%f11,	%f26,	%f8
	alignaddrl	%i7,	%l6,	%l2
	ldsw	[%l7 + 0x2C],	%o6
	fmovda	%icc,	%f27,	%f19
	ld	[%l7 + 0x40],	%f21
	alignaddrl	%g2,	%o2,	%o3
	umul	%l3,	%o0,	%i0
	srl	%g5,	0x01,	%l1
	faligndata	%f12,	%f0,	%f14
	xor	%i6,	0x00F5,	%i1
	alignaddrl	%i3,	%o4,	%o1
	fmovdge	%xcc,	%f23,	%f11
	ldsb	[%l7 + 0x34],	%l0
	fmovrdgez	%g4,	%f26,	%f8
	edge8l	%g6,	%o5,	%l5
	fand	%f22,	%f4,	%f30
	movvc	%xcc,	%g7,	%i2
	fabss	%f28,	%f5
	ldsh	[%l7 + 0x26],	%g3
	or	%i4,	0x0984,	%l4
	lduw	[%l7 + 0x74],	%g1
	movvc	%icc,	%o7,	%i5
	movre	%i7,	%l6,	%l2
	sdivx	%g2,	0x092A,	%o2
	alignaddrl	%o6,	%l3,	%o3
	srlx	%i0,	0x09,	%o0
	fmovsleu	%xcc,	%f9,	%f3
	orn	%l1,	0x0DAF,	%g5
	fcmpeq16	%f10,	%f18,	%i1
	subcc	%i3,	%i6,	%o4
	movne	%icc,	%l0,	%g4
	edge16ln	%g6,	%o1,	%l5
	movvs	%xcc,	%o5,	%g7
	edge16ln	%g3,	%i4,	%i2
	movrgez	%l4,	0x244,	%o7
	umulcc	%i5,	0x0E55,	%g1
	fpadd32	%f24,	%f2,	%f26
	and	%i7,	0x194C,	%l6
	andcc	%l2,	0x087B,	%o2
	sir	0x0416
	fmovdneg	%xcc,	%f26,	%f3
	xorcc	%o6,	0x14CE,	%l3
	movleu	%xcc,	%o3,	%i0
	alignaddr	%o0,	%g2,	%l1
	edge8n	%i1,	%g5,	%i6
	ldsw	[%l7 + 0x58],	%o4
	fmul8sux16	%f4,	%f30,	%f24
	and	%l0,	%g4,	%i3
	ldd	[%l7 + 0x38],	%f0
	ldub	[%l7 + 0x23],	%g6
	fpack32	%f10,	%f28,	%f4
	udivcc	%o1,	0x1EDD,	%o5
	std	%f8,	[%l7 + 0x08]
	edge8	%g7,	%l5,	%i4
	fmovda	%icc,	%f7,	%f7
	faligndata	%f0,	%f14,	%f22
	array32	%g3,	%l4,	%o7
	ld	[%l7 + 0x58],	%f26
	movcs	%xcc,	%i2,	%i5
	ldd	[%l7 + 0x38],	%f8
	srax	%i7,	%l6,	%l2
	ldsb	[%l7 + 0x09],	%g1
	udiv	%o6,	0x1BA8,	%l3
	smul	%o2,	0x12B1,	%i0
	ldd	[%l7 + 0x28],	%o2
	edge16ln	%g2,	%l1,	%i1
	fcmpne32	%f16,	%f14,	%o0
	andcc	%g5,	0x11D6,	%i6
	movvs	%icc,	%l0,	%g4
	fcmpne32	%f6,	%f16,	%i3
	xorcc	%o4,	0x1374,	%o1
	edge32	%o5,	%g6,	%l5
	fmovda	%icc,	%f10,	%f12
	sll	%g7,	%g3,	%i4
	movge	%xcc,	%o7,	%i2
	mova	%icc,	%i5,	%i7
	edge32ln	%l4,	%l2,	%g1
	sdiv	%l6,	0x177F,	%o6
	lduw	[%l7 + 0x0C],	%o2
	ldsw	[%l7 + 0x30],	%l3
	xnorcc	%o3,	%i0,	%g2
	smulcc	%l1,	0x165F,	%i1
	orncc	%g5,	0x15C3,	%i6
	sdivx	%o0,	0x1146,	%l0
	move	%xcc,	%i3,	%o4
	stb	%g4,	[%l7 + 0x46]
	nop
	set	0x20, %i4
	std	%f28,	[%l7 + %i4]
	sll	%o1,	%o5,	%g6
	movne	%icc,	%l5,	%g7
	movn	%icc,	%i4,	%o7
	popc	%i2,	%i5
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%f20
	movpos	%xcc,	%i7,	%l4
	fmovdn	%icc,	%f29,	%f12
	fcmple32	%f30,	%f26,	%g3
	sll	%g1,	0x09,	%l6
	fornot2s	%f17,	%f30,	%f19
	sir	0x0354
	orcc	%o6,	%o2,	%l3
	fnegs	%f11,	%f7
	fmovrsgz	%o3,	%f10,	%f1
	array16	%l2,	%g2,	%i0
	fxnor	%f16,	%f28,	%f30
	ldd	[%l7 + 0x20],	%i0
	fmovdgu	%xcc,	%f30,	%f24
	fpsub32	%f26,	%f14,	%f2
	fnor	%f30,	%f18,	%f18
	addccc	%l1,	0x1865,	%i6
	fandnot1	%f6,	%f8,	%f6
	umul	%g5,	0x058A,	%o0
	movrne	%i3,	%o4,	%g4
	edge8l	%l0,	%o1,	%g6
	ld	[%l7 + 0x44],	%f18
	fands	%f5,	%f10,	%f0
	save %l5, %o5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f7,	%f4
	movgu	%icc,	%o7,	%i4
	std	%f10,	[%l7 + 0x28]
	movrgez	%i2,	0x286,	%i7
	orcc	%l4,	0x0143,	%g3
	and	%g1,	%l6,	%o6
	mulx	%i5,	%o2,	%l3
	ldd	[%l7 + 0x78],	%f4
	edge16n	%l2,	%g2,	%i0
	movle	%xcc,	%i1,	%l1
	fmovrdne	%i6,	%f16,	%f22
	mulx	%o3,	%o0,	%g5
	ldub	[%l7 + 0x7F],	%o4
	subcc	%i3,	0x190F,	%g4
	movcs	%xcc,	%o1,	%l0
	srax	%g6,	%o5,	%g7
	array8	%o7,	%i4,	%i2
	fandnot2s	%f0,	%f4,	%f15
	popc	0x05A4,	%i7
	fands	%f24,	%f8,	%f8
	fsrc2s	%f5,	%f0
	movvs	%xcc,	%l5,	%g3
	movrne	%g1,	0x361,	%l6
	save %o6, %l4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o2,	%l2,	%l3
	xor	%g2,	0x039C,	%i0
	orn	%i1,	%i6,	%l1
	st	%f20,	[%l7 + 0x7C]
	movrgz	%o0,	0x2DB,	%g5
	fmovrslez	%o4,	%f10,	%f25
	fcmpeq16	%f14,	%f12,	%i3
	fmul8x16	%f1,	%f6,	%f26
	fabsd	%f14,	%f16
	xnorcc	%g4,	%o1,	%o3
	fmovrdlz	%l0,	%f26,	%f4
	xnorcc	%o5,	%g7,	%g6
	or	%i4,	0x0AC0,	%o7
	fmovrdgez	%i7,	%f26,	%f28
	mulx	%i2,	%g3,	%g1
	fmovdneg	%icc,	%f9,	%f19
	lduh	[%l7 + 0x12],	%l6
	udiv	%l5,	0x1AC2,	%o6
	xor	%i5,	%l4,	%o2
	edge8n	%l3,	%l2,	%i0
	stb	%g2,	[%l7 + 0x50]
	subccc	%i6,	0x1125,	%l1
	alignaddr	%i1,	%o0,	%g5
	stw	%i3,	[%l7 + 0x48]
	edge32ln	%g4,	%o1,	%o4
	ldd	[%l7 + 0x50],	%f24
	movpos	%icc,	%o3,	%l0
	addc	%o5,	0x15CB,	%g6
	edge8n	%i4,	%o7,	%i7
	subccc	%g7,	0x1910,	%g3
	alignaddr	%i2,	%l6,	%g1
	movpos	%icc,	%l5,	%i5
	addccc	%l4,	%o2,	%o6
	edge16l	%l3,	%i0,	%g2
	fmovscc	%icc,	%f15,	%f26
	alignaddrl	%l2,	%l1,	%i1
	fpadd16	%f4,	%f26,	%f24
	sth	%i6,	[%l7 + 0x54]
	sll	%g5,	0x0C,	%o0
	addcc	%g4,	%o1,	%o4
	mulx	%o3,	0x0D4F,	%l0
	stb	%o5,	[%l7 + 0x5F]
	movrgz	%i3,	0x058,	%i4
	fandnot1s	%f0,	%f0,	%f19
	fpackfix	%f24,	%f8
	movcc	%xcc,	%o7,	%g6
	orcc	%i7,	0x05F5,	%g7
	movre	%i2,	%g3,	%l6
	stb	%l5,	[%l7 + 0x2F]
	subccc	%i5,	%l4,	%o2
	edge32ln	%o6,	%l3,	%i0
	addccc	%g1,	%l2,	%g2
	fnands	%f18,	%f6,	%f15
	lduw	[%l7 + 0x14],	%l1
	smulcc	%i6,	%g5,	%o0
	movne	%icc,	%i1,	%g4
	fpack16	%f20,	%f4
	ldsh	[%l7 + 0x68],	%o4
	movre	%o3,	0x38C,	%o1
	sll	%o5,	%l0,	%i3
	edge16	%o7,	%g6,	%i4
	movvc	%icc,	%g7,	%i2
	sethi	0x0AB6,	%i7
	ldd	[%l7 + 0x60],	%g2
	edge16l	%l5,	%i5,	%l6
	fcmps	%fcc1,	%f25,	%f5
	fmovrsgz	%o2,	%f28,	%f7
	ldsw	[%l7 + 0x1C],	%o6
	fnand	%f10,	%f0,	%f16
	fmovdcc	%xcc,	%f11,	%f0
	mulscc	%l4,	%l3,	%i0
	subcc	%g1,	0x1D5C,	%l2
	addcc	%g2,	%l1,	%g5
	movgu	%icc,	%o0,	%i6
	subc	%i1,	%g4,	%o3
	fmovdg	%xcc,	%f6,	%f24
	fandnot2	%f20,	%f8,	%f10
	fcmped	%fcc1,	%f24,	%f0
	edge16	%o1,	%o5,	%o4
	edge16n	%i3,	%l0,	%o7
	edge32l	%i4,	%g7,	%g6
	stw	%i7,	[%l7 + 0x20]
	umul	%g3,	0x0110,	%l5
	umulcc	%i5,	%l6,	%o2
	movl	%xcc,	%o6,	%l4
	fmovse	%xcc,	%f2,	%f24
	ldx	[%l7 + 0x68],	%i2
	popc	%i0,	%g1
	sdivx	%l2,	0x1297,	%l3
	fpsub32	%f14,	%f24,	%f10
	addcc	%l1,	%g5,	%g2
	movrlez	%o0,	0x119,	%i1
	addcc	%g4,	%o3,	%i6
	fxors	%f2,	%f1,	%f12
	smul	%o1,	%o5,	%o4
	addc	%l0,	%o7,	%i3
	mulscc	%i4,	%g6,	%i7
	addcc	%g7,	%g3,	%l5
	sll	%i5,	0x16,	%l6
	fandnot2	%f14,	%f30,	%f18
	orncc	%o6,	0x098A,	%o2
	orcc	%l4,	%i0,	%i2
	fmovrdne	%g1,	%f18,	%f24
	sdivx	%l3,	0x0EAE,	%l1
	movle	%xcc,	%l2,	%g2
	sll	%o0,	0x08,	%g5
	siam	0x5
	movcc	%xcc,	%i1,	%g4
	array32	%o3,	%i6,	%o1
	fsrc2	%f8,	%f8
	or	%o5,	%l0,	%o7
	ldsw	[%l7 + 0x14],	%o4
	sir	0x1CDE
	movgu	%xcc,	%i4,	%g6
	edge8	%i7,	%g7,	%i3
	move	%icc,	%g3,	%i5
	fornot2	%f18,	%f28,	%f22
	fmovrslz	%l6,	%f26,	%f9
	movrlz	%l5,	0x050,	%o6
	ld	[%l7 + 0x3C],	%f10
	xor	%o2,	%i0,	%i2
	sethi	0x199C,	%l4
	addccc	%l3,	0x0740,	%g1
	fmovdleu	%xcc,	%f20,	%f11
	movrlez	%l1,	%g2,	%l2
	movn	%icc,	%g5,	%i1
	fmovrse	%o0,	%f22,	%f22
	array8	%g4,	%i6,	%o3
	sth	%o5,	[%l7 + 0x12]
	fxor	%f24,	%f8,	%f4
	subcc	%l0,	0x1AFF,	%o7
	edge32n	%o1,	%i4,	%o4
	orn	%i7,	%g6,	%i3
	alignaddrl	%g7,	%g3,	%l6
	sethi	0x12BB,	%i5
	edge32n	%o6,	%l5,	%o2
	sdivcc	%i0,	0x005A,	%i2
	lduw	[%l7 + 0x64],	%l3
	smul	%g1,	%l4,	%g2
	addccc	%l2,	0x0BA8,	%g5
	andncc	%l1,	%o0,	%i1
	fandnot2	%f18,	%f0,	%f4
	edge32l	%g4,	%o3,	%i6
	st	%f23,	[%l7 + 0x44]
	fnot1	%f0,	%f30
	srl	%l0,	%o5,	%o1
	edge32l	%i4,	%o4,	%o7
	fmul8sux16	%f2,	%f0,	%f26
	orcc	%g6,	%i3,	%i7
	move	%icc,	%g7,	%l6
	srlx	%i5,	0x18,	%g3
	fcmpgt32	%f20,	%f22,	%o6
	mova	%xcc,	%l5,	%o2
	movle	%xcc,	%i2,	%l3
	edge32l	%i0,	%l4,	%g1
	ldub	[%l7 + 0x3C],	%g2
	movpos	%xcc,	%l2,	%g5
	udivcc	%l1,	0x1E75,	%o0
	subccc	%i1,	%o3,	%g4
	smulcc	%i6,	0x1F32,	%o5
	sth	%l0,	[%l7 + 0x58]
	movleu	%xcc,	%o1,	%i4
	fcmpgt32	%f12,	%f20,	%o4
	movrlez	%g6,	%i3,	%o7
	stx	%g7,	[%l7 + 0x70]
	fmovs	%f11,	%f23
	fnors	%f17,	%f1,	%f10
	movrgz	%l6,	0x1EB,	%i7
	stw	%i5,	[%l7 + 0x54]
	edge32	%o6,	%g3,	%o2
	movn	%icc,	%i2,	%l5
	fpadd16s	%f31,	%f3,	%f5
	sir	0x1370
	umulcc	%l3,	%l4,	%g1
	subcc	%i0,	%g2,	%g5
	alignaddr	%l2,	%l1,	%o0
	movrne	%o3,	%g4,	%i6
	edge16	%o5,	%l0,	%o1
	edge32l	%i1,	%o4,	%i4
	fors	%f15,	%f10,	%f29
	smul	%g6,	%o7,	%i3
	fcmpgt16	%f18,	%f14,	%g7
	subccc	%i7,	%i5,	%o6
	umulcc	%g3,	%o2,	%i2
	movpos	%icc,	%l6,	%l3
	movre	%l5,	%g1,	%i0
	fcmpgt32	%f22,	%f6,	%l4
	add	%g2,	%g5,	%l2
	edge8n	%l1,	%o3,	%o0
	movle	%xcc,	%g4,	%o5
	movgu	%xcc,	%i6,	%o1
	andncc	%i1,	%l0,	%o4
	xorcc	%i4,	0x06DF,	%g6
	subccc	%i3,	0x1737,	%o7
	orncc	%i7,	%i5,	%g7
	edge16l	%o6,	%g3,	%i2
	fxnors	%f29,	%f5,	%f6
	edge16n	%l6,	%o2,	%l5
	fzero	%f2
	fmovrdlz	%g1,	%f0,	%f26
	fpadd32	%f10,	%f28,	%f18
	addc	%i0,	%l3,	%g2
	sub	%g5,	%l2,	%l1
	sdiv	%l4,	0x096D,	%o0
	movre	%g4,	0x015,	%o5
	movvc	%icc,	%o3,	%i6
	sir	0x0688
	std	%f2,	[%l7 + 0x10]
	orcc	%i1,	%l0,	%o4
	movrlz	%o1,	0x381,	%g6
	movleu	%icc,	%i4,	%i3
	ld	[%l7 + 0x24],	%f24
	udivcc	%i7,	0x04B3,	%o7
	umul	%i5,	%o6,	%g7
	smulcc	%i2,	%g3,	%l6
	edge32n	%l5,	%g1,	%i0
	ldd	[%l7 + 0x08],	%f10
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%o2
	sir	0x18E6
	sdivx	%g2,	0x0149,	%g5
	movrgez	%l3,	0x36A,	%l1
	fcmped	%fcc1,	%f6,	%f30
	fmovdl	%icc,	%f9,	%f8
	xor	%l4,	%l2,	%g4
	sdiv	%o5,	0x140F,	%o0
	edge32l	%i6,	%o3,	%l0
	movgu	%xcc,	%o4,	%i1
	movneg	%xcc,	%g6,	%o1
	srlx	%i3,	0x11,	%i7
	sra	%i4,	%o7,	%i5
	edge32ln	%o6,	%g7,	%i2
	fmovspos	%xcc,	%f17,	%f17
	fmovde	%icc,	%f24,	%f17
	fmul8x16al	%f8,	%f19,	%f16
	movrlez	%l6,	0x24A,	%l5
	lduh	[%l7 + 0x48],	%g1
	stw	%g3,	[%l7 + 0x0C]
	fcmple32	%f0,	%f16,	%i0
	fandnot1	%f2,	%f2,	%f16
	udivcc	%g2,	0x0FFA,	%o2
	udivx	%l3,	0x1AEB,	%l1
	orcc	%g5,	0x1009,	%l2
	setx loop_96, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_96: 	edge8l	%o0,	%l4,	%o3
	andn	%l0,	%o4,	%i6
	fmovsge	%xcc,	%f2,	%f2
	sethi	0x0F37,	%i1
	edge8	%o1,	%g6,	%i3
	edge32	%i7,	%o7,	%i4
	sdivx	%i5,	0x174F,	%o6
	ldd	[%l7 + 0x38],	%f28
	fmovdvs	%xcc,	%f15,	%f15
	ldub	[%l7 + 0x55],	%i2
	xnor	%l6,	%g7,	%g1
	andcc	%l5,	0x1517,	%g3
	andcc	%i0,	%o2,	%l3
	xnor	%l1,	0x10A6,	%g2
	movn	%icc,	%g5,	%l2
	and	%o5,	0x1700,	%g4
	lduh	[%l7 + 0x70],	%l4
	fpsub32	%f0,	%f28,	%f18
	stx	%o0,	[%l7 + 0x40]
	edge32ln	%o3,	%o4,	%i6
	addcc	%l0,	0x0679,	%i1
	edge16ln	%g6,	%o1,	%i3
	udivx	%o7,	0x0D72,	%i7
	alignaddr	%i5,	%o6,	%i2
	xnor	%l6,	0x0C59,	%i4
	movrne	%g7,	0x0B5,	%g1
	ldsw	[%l7 + 0x50],	%g3
	ldsw	[%l7 + 0x34],	%i0
	fmovdne	%xcc,	%f5,	%f31
	fmuld8ulx16	%f27,	%f13,	%f10
	mulx	%o2,	0x16A9,	%l5
	edge16n	%l3,	%g2,	%l1
	movneg	%icc,	%g5,	%o5
	smulcc	%g4,	0x0FF1,	%l2
	fzeros	%f12
	fmovsle	%icc,	%f9,	%f1
	lduh	[%l7 + 0x42],	%o0
	mulscc	%l4,	0x0D9D,	%o3
	ld	[%l7 + 0x74],	%f1
	fmuld8sux16	%f19,	%f14,	%f4
	udivx	%o4,	0x15DF,	%l0
	st	%f25,	[%l7 + 0x54]
	udivx	%i6,	0x0ED7,	%i1
	edge8	%o1,	%i3,	%o7
	st	%f31,	[%l7 + 0x40]
	movle	%icc,	%i7,	%g6
	or	%i5,	0x0249,	%i2
	xnor	%o6,	0x18CA,	%i4
	ldd	[%l7 + 0x40],	%f24
	fmovdgu	%xcc,	%f8,	%f0
	xnor	%l6,	%g1,	%g7
	edge16	%i0,	%g3,	%l5
	stw	%o2,	[%l7 + 0x28]
	stb	%l3,	[%l7 + 0x6A]
	movrgez	%l1,	0x3F8,	%g5
	movcs	%icc,	%g2,	%g4
	udivx	%o5,	0x083E,	%o0
	smul	%l2,	0x1653,	%o3
	fzeros	%f10
	stx	%l4,	[%l7 + 0x10]
	array32	%o4,	%l0,	%i1
	sth	%o1,	[%l7 + 0x54]
	movg	%icc,	%i3,	%o7
	fnot2	%f28,	%f24
	fcmped	%fcc0,	%f18,	%f6
	and	%i6,	0x080C,	%i7
	sra	%g6,	%i2,	%o6
	umulcc	%i4,	0x1D7F,	%i5
	lduw	[%l7 + 0x5C],	%l6
	ldx	[%l7 + 0x38],	%g1
	st	%f6,	[%l7 + 0x30]
	stw	%i0,	[%l7 + 0x24]
	fpack16	%f2,	%f2
	bshuffle	%f26,	%f22,	%f4
	fmovrse	%g3,	%f6,	%f22
	sth	%g7,	[%l7 + 0x08]
	stx	%l5,	[%l7 + 0x18]
	udiv	%o2,	0x1D69,	%l3
	smulcc	%g5,	%g2,	%l1
	andcc	%o5,	0x1449,	%g4
	movneg	%icc,	%l2,	%o0
	movle	%icc,	%l4,	%o3
	xnor	%o4,	%i1,	%l0
	sth	%o1,	[%l7 + 0x48]
	edge16ln	%i3,	%i6,	%o7
	edge8l	%i7,	%i2,	%g6
	edge16	%i4,	%i5,	%l6
	edge8ln	%g1,	%o6,	%g3
	sub	%i0,	%g7,	%o2
	fpsub16s	%f0,	%f11,	%f5
	nop
	set	0x60, %i0
	ldx	[%l7 + %i0],	%l5
	movrlz	%g5,	0x0BD,	%l3
	edge8	%g2,	%o5,	%l1
	movre	%g4,	0x074,	%l2
	fone	%f26
	movle	%icc,	%l4,	%o0
	movrgz	%o3,	%i1,	%o4
	movre	%l0,	%i3,	%i6
	movleu	%icc,	%o1,	%o7
	fcmpne32	%f2,	%f18,	%i7
	fmovrdlez	%g6,	%f14,	%f4
	fabsd	%f2,	%f8
	movleu	%xcc,	%i2,	%i5
	orn	%l6,	0x144A,	%i4
	fmovrdgez	%o6,	%f10,	%f4
	stw	%g3,	[%l7 + 0x4C]
	movrgez	%i0,	%g7,	%o2
	edge8ln	%l5,	%g1,	%l3
	edge32l	%g2,	%g5,	%o5
	fexpand	%f21,	%f26
	edge32l	%g4,	%l1,	%l2
	fmovdneg	%xcc,	%f4,	%f24
	lduw	[%l7 + 0x34],	%l4
	alignaddr	%o3,	%i1,	%o4
	movvc	%xcc,	%o0,	%i3
	fnot2s	%f21,	%f25
	movpos	%icc,	%l0,	%i6
	fabss	%f15,	%f26
	restore %o1, %o7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f30,	%f0
	movvs	%xcc,	%i2,	%g6
	udivcc	%l6,	0x00EA,	%i4
	move	%xcc,	%o6,	%g3
	nop
	set	0x2E, %g6
	lduh	[%l7 + %g6],	%i5
	array16	%i0,	%o2,	%g7
	nop
	set	0x10, %l2
	ldx	[%l7 + %l2],	%g1
	xorcc	%l5,	%g2,	%l3
	stw	%o5,	[%l7 + 0x6C]
	sra	%g5,	0x1F,	%l1
	fxors	%f5,	%f2,	%f10
	sra	%l2,	%l4,	%g4
	andn	%i1,	%o4,	%o0
	movrlz	%o3,	%l0,	%i3
	addc	%i6,	0x0567,	%o7
	fmovsneg	%icc,	%f16,	%f10
	udivx	%i7,	0x061F,	%o1
	fmovsvc	%icc,	%f1,	%f15
	andncc	%i2,	%l6,	%i4
	add	%g6,	0x0D3B,	%g3
	array16	%i5,	%i0,	%o2
	edge8n	%g7,	%g1,	%l5
	udivx	%o6,	0x130A,	%l3
	fmovspos	%icc,	%f31,	%f3
	stx	%g2,	[%l7 + 0x08]
	fands	%f0,	%f4,	%f13
	subcc	%g5,	%o5,	%l1
	fmovrse	%l4,	%f7,	%f6
	stx	%l2,	[%l7 + 0x60]
	movge	%xcc,	%g4,	%o4
	popc	%o0,	%o3
	fzeros	%f12
	popc	0x1BDF,	%i1
	andncc	%l0,	%i3,	%o7
	mulx	%i6,	%o1,	%i2
	srlx	%l6,	%i7,	%i4
	edge16ln	%g6,	%g3,	%i0
	movne	%xcc,	%o2,	%i5
	smulcc	%g7,	0x042C,	%g1
	edge32ln	%l5,	%l3,	%g2
	edge32	%g5,	%o5,	%l1
	fabss	%f25,	%f27
	lduh	[%l7 + 0x08],	%l4
	movrlz	%o6,	0x1B3,	%g4
	edge8ln	%l2,	%o4,	%o3
	movrgz	%i1,	%l0,	%o0
	udivx	%o7,	0x149E,	%i6
	movneg	%icc,	%o1,	%i2
	edge32n	%i3,	%i7,	%i4
	sdivx	%g6,	0x076D,	%g3
	edge32n	%i0,	%l6,	%i5
	alignaddr	%o2,	%g1,	%g7
	movrlz	%l5,	%g2,	%g5
	edge32ln	%o5,	%l1,	%l4
	ldub	[%l7 + 0x22],	%o6
	fmul8x16al	%f19,	%f26,	%f28
	edge32n	%g4,	%l3,	%o4
	sdivcc	%l2,	0x17B5,	%o3
	fmovsvs	%icc,	%f19,	%f28
	ldd	[%l7 + 0x40],	%l0
	lduh	[%l7 + 0x0C],	%o0
	lduw	[%l7 + 0x44],	%o7
	fmovrsgz	%i6,	%f23,	%f25
	edge32l	%o1,	%i2,	%i1
	ldx	[%l7 + 0x50],	%i7
	lduw	[%l7 + 0x68],	%i3
	ld	[%l7 + 0x58],	%f31
	andncc	%g6,	%g3,	%i4
	edge32l	%l6,	%i0,	%o2
	lduh	[%l7 + 0x3E],	%i5
	smul	%g7,	0x1F14,	%g1
	stx	%g2,	[%l7 + 0x60]
	movvc	%icc,	%g5,	%l5
	fandnot1	%f26,	%f6,	%f0
	movge	%icc,	%o5,	%l4
	umul	%l1,	%g4,	%l3
	srl	%o6,	%l2,	%o4
	fmovda	%icc,	%f17,	%f28
	movcc	%icc,	%o3,	%o0
	fxors	%f26,	%f26,	%f16
	faligndata	%f26,	%f12,	%f4
	fnot2	%f4,	%f14
	movge	%icc,	%l0,	%i6
	smulcc	%o1,	%i2,	%o7
	alignaddrl	%i1,	%i3,	%g6
	fsrc1s	%f12,	%f3
	movne	%icc,	%g3,	%i4
	fpsub32	%f2,	%f0,	%f4
	movn	%icc,	%i7,	%l6
	ld	[%l7 + 0x20],	%f21
	subcc	%i0,	%o2,	%g7
	edge32l	%i5,	%g2,	%g5
	sub	%g1,	0x192E,	%o5
	andn	%l5,	0x1DE5,	%l4
	lduw	[%l7 + 0x0C],	%l1
	fmul8ulx16	%f22,	%f30,	%f0
	movg	%icc,	%l3,	%o6
	srax	%l2,	%o4,	%g4
	movcs	%xcc,	%o3,	%l0
	st	%f24,	[%l7 + 0x4C]
	fnot2	%f24,	%f4
	sll	%o0,	0x0B,	%i6
	addc	%o1,	%o7,	%i2
	siam	0x0
	fand	%f8,	%f14,	%f20
	movge	%xcc,	%i3,	%g6
	orncc	%i1,	%i4,	%g3
	subcc	%i7,	%l6,	%o2
	udivx	%g7,	0x0B28,	%i0
	fnand	%f18,	%f6,	%f0
	fcmpgt16	%f24,	%f12,	%i5
	st	%f28,	[%l7 + 0x18]
	fmovscs	%xcc,	%f14,	%f11
	sth	%g2,	[%l7 + 0x5A]
	xor	%g5,	%g1,	%l5
	subcc	%o5,	0x1D29,	%l4
	movne	%icc,	%l3,	%o6
	andcc	%l2,	%l1,	%g4
	sll	%o4,	%l0,	%o3
	sethi	0x1223,	%o0
	ldub	[%l7 + 0x1C],	%i6
	or	%o7,	0x102E,	%o1
	st	%f4,	[%l7 + 0x10]
	fcmpgt32	%f6,	%f22,	%i2
	srlx	%i3,	%g6,	%i4
	ld	[%l7 + 0x1C],	%f12
	edge32	%i1,	%i7,	%g3
	addcc	%o2,	0x0FFD,	%l6
	movneg	%xcc,	%i0,	%i5
	fmovsa	%xcc,	%f1,	%f1
	srlx	%g7,	%g2,	%g5
	edge8ln	%l5,	%o5,	%l4
	ldsh	[%l7 + 0x54],	%g1
	save %o6, 0x0D99, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x5E],	%l1
	srl	%g4,	%o4,	%l0
	fmovs	%f24,	%f26
	edge8	%l2,	%o0,	%i6
	move	%xcc,	%o7,	%o3
	fxnors	%f21,	%f15,	%f15
	edge32n	%i2,	%o1,	%g6
	movrlz	%i4,	%i3,	%i1
	fornot1s	%f22,	%f1,	%f4
	movne	%icc,	%i7,	%o2
	fandnot1s	%f2,	%f11,	%f16
	fnot2	%f10,	%f20
	lduw	[%l7 + 0x78],	%l6
	orcc	%g3,	0x0918,	%i0
	subc	%i5,	%g7,	%g2
	stx	%g5,	[%l7 + 0x58]
	fpsub16	%f6,	%f16,	%f12
	udivcc	%o5,	0x024C,	%l5
	smulcc	%g1,	%o6,	%l3
	sir	0x14DC
	xorcc	%l4,	%l1,	%o4
	umulcc	%g4,	%l0,	%o0
	edge16ln	%i6,	%l2,	%o7
	ldsb	[%l7 + 0x78],	%i2
	subccc	%o1,	0x0F8E,	%o3
	fpack16	%f16,	%f1
	fxor	%f10,	%f2,	%f0
	smulcc	%g6,	%i4,	%i1
	movrne	%i7,	%i3,	%l6
	ldx	[%l7 + 0x50],	%g3
	save %i0, 0x0868, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x40],	%i5
	fmovdge	%icc,	%f14,	%f3
	movre	%g2,	%g7,	%g5
	movne	%xcc,	%l5,	%g1
	fpsub32	%f2,	%f24,	%f12
	fmovrdlez	%o6,	%f28,	%f30
	sllx	%o5,	%l4,	%l3
	movrne	%l1,	0x136,	%o4
	movcc	%xcc,	%g4,	%l0
	ldx	[%l7 + 0x68],	%i6
	movleu	%icc,	%o0,	%l2
	ldd	[%l7 + 0x70],	%f6
	for	%f14,	%f28,	%f2
	ldsw	[%l7 + 0x74],	%i2
	edge32ln	%o1,	%o7,	%g6
	sdiv	%i4,	0x1B3B,	%i1
	add	%o3,	0x10A0,	%i7
	ld	[%l7 + 0x14],	%f31
	movle	%xcc,	%i3,	%g3
	fpackfix	%f18,	%f22
	ldsh	[%l7 + 0x3E],	%i0
	alignaddr	%l6,	%o2,	%g2
	xor	%i5,	%g5,	%g7
	srlx	%l5,	%g1,	%o5
	sdivx	%o6,	0x07EE,	%l4
	sdivx	%l1,	0x1A5C,	%l3
	std	%f26,	[%l7 + 0x18]
	ldsh	[%l7 + 0x16],	%g4
	sth	%l0,	[%l7 + 0x52]
	movrne	%o4,	0x1E1,	%i6
	xnor	%o0,	0x0EAD,	%l2
	sir	0x1436
	fmovdne	%xcc,	%f26,	%f30
	std	%f26,	[%l7 + 0x58]
	lduh	[%l7 + 0x18],	%i2
	movvs	%xcc,	%o1,	%g6
	fexpand	%f17,	%f28
	orncc	%o7,	0x0351,	%i4
	xor	%i1,	%o3,	%i7
	fmovdneg	%xcc,	%f14,	%f0
	movcs	%xcc,	%i3,	%i0
	nop
	set	0x74, %o6
	lduw	[%l7 + %o6],	%l6
	fmovdne	%xcc,	%f4,	%f21
	subcc	%g3,	0x0AB1,	%o2
	fmovdl	%icc,	%f21,	%f10
	addc	%g2,	%i5,	%g5
	subc	%g7,	0x180C,	%g1
	fmovscc	%xcc,	%f22,	%f13
	fmovsle	%icc,	%f25,	%f15
	stw	%o5,	[%l7 + 0x38]
	andncc	%o6,	%l4,	%l5
	fsrc1	%f12,	%f0
	subccc	%l1,	%l3,	%g4
	fmovdvs	%xcc,	%f22,	%f26
	alignaddrl	%l0,	%i6,	%o0
	popc	0x029E,	%o4
	addcc	%i2,	0x1AED,	%l2
	ldx	[%l7 + 0x68],	%g6
	fcmpd	%fcc3,	%f10,	%f22
	edge8ln	%o1,	%o7,	%i1
	sub	%i4,	%o3,	%i7
	movrlez	%i3,	0x1EA,	%i0
	fmovrdgz	%l6,	%f2,	%f0
	movg	%xcc,	%o2,	%g3
	sdivcc	%g2,	0x16D9,	%i5
	movl	%icc,	%g5,	%g1
	ldsw	[%l7 + 0x5C],	%o5
	mulscc	%g7,	0x0F74,	%o6
	addc	%l5,	%l4,	%l1
	ldx	[%l7 + 0x20],	%l3
	ldd	[%l7 + 0x60],	%f20
	subccc	%l0,	0x1626,	%i6
	edge32l	%o0,	%g4,	%i2
	popc	%o4,	%l2
	movn	%icc,	%o1,	%g6
	move	%icc,	%o7,	%i4
	lduw	[%l7 + 0x58],	%o3
	srl	%i1,	%i7,	%i0
	array8	%l6,	%o2,	%g3
	udivcc	%g2,	0x1765,	%i3
	udiv	%i5,	0x05D9,	%g5
	xorcc	%g1,	0x16F0,	%g7
	nop
	set	0x30, %l4
	sth	%o6,	[%l7 + %l4]
	mulscc	%o5,	0x0DAE,	%l4
	fmul8sux16	%f8,	%f26,	%f12
	umul	%l1,	0x1082,	%l3
	movvs	%icc,	%l0,	%i6
	sth	%l5,	[%l7 + 0x36]
	movrne	%o0,	0x08E,	%i2
	fmovsne	%icc,	%f23,	%f21
	movneg	%xcc,	%g4,	%o4
	array32	%l2,	%g6,	%o7
	fnor	%f26,	%f8,	%f2
	ldub	[%l7 + 0x40],	%o1
	fsrc2s	%f11,	%f16
	fpack16	%f30,	%f30
	ldd	[%l7 + 0x30],	%o2
	movg	%icc,	%i1,	%i7
	alignaddr	%i4,	%i0,	%l6
	udiv	%o2,	0x1A3A,	%g2
	srl	%g3,	%i3,	%i5
	xnor	%g5,	0x0B86,	%g7
	mova	%xcc,	%o6,	%o5
	ldx	[%l7 + 0x10],	%l4
	edge16l	%l1,	%l3,	%g1
	fmovse	%xcc,	%f8,	%f18
	sdivx	%l0,	0x07B9,	%l5
	fornot1	%f24,	%f18,	%f22
	andcc	%i6,	0x04AA,	%o0
	edge16ln	%g4,	%o4,	%i2
	sth	%g6,	[%l7 + 0x5C]
	fandnot2	%f20,	%f8,	%f20
	movvs	%xcc,	%o7,	%o1
	fxnor	%f2,	%f4,	%f30
	ldd	[%l7 + 0x08],	%f14
	for	%f8,	%f28,	%f12
	movcc	%xcc,	%o3,	%l2
	movpos	%xcc,	%i7,	%i1
	udivx	%i4,	0x07BF,	%l6
	andncc	%o2,	%g2,	%g3
	subccc	%i0,	%i3,	%g5
	sdivcc	%g7,	0x0DF1,	%i5
	fcmpne32	%f12,	%f26,	%o6
	subcc	%o5,	0x1B6D,	%l4
	std	%f20,	[%l7 + 0x60]
	fmovsvs	%xcc,	%f30,	%f21
	nop
	set	0x38, %i5
	stw	%l1,	[%l7 + %i5]
	orn	%l3,	0x120B,	%l0
	edge8	%l5,	%g1,	%i6
	fmovsge	%xcc,	%f4,	%f16
	fmovdne	%icc,	%f18,	%f10
	fmovrdgz	%o0,	%f2,	%f28
	edge8n	%g4,	%i2,	%g6
	fmovdl	%icc,	%f2,	%f9
	mova	%icc,	%o7,	%o4
	sub	%o1,	0x188A,	%l2
	fcmple16	%f18,	%f6,	%i7
	edge32ln	%i1,	%i4,	%o3
	nop
	set	0x30, %g7
	ldx	[%l7 + %g7],	%o2
	ldsh	[%l7 + 0x1A],	%g2
	sub	%g3,	0x1EF4,	%l6
	movg	%xcc,	%i3,	%i0
	edge16	%g5,	%i5,	%g7
	fmovsgu	%xcc,	%f14,	%f5
	fmovs	%f20,	%f6
	ldx	[%l7 + 0x78],	%o6
	ldx	[%l7 + 0x58],	%o5
	udiv	%l1,	0x012B,	%l3
	smulcc	%l0,	%l4,	%g1
	st	%f29,	[%l7 + 0x2C]
	fmovscc	%icc,	%f12,	%f15
	umul	%l5,	%i6,	%o0
	movgu	%xcc,	%i2,	%g4
	sra	%o7,	0x11,	%o4
	fmovdne	%xcc,	%f8,	%f6
	faligndata	%f10,	%f8,	%f10
	st	%f20,	[%l7 + 0x34]
	udiv	%o1,	0x176F,	%l2
	movpos	%icc,	%g6,	%i7
	ldub	[%l7 + 0x3F],	%i1
	andncc	%i4,	%o3,	%o2
	srax	%g2,	0x10,	%g3
	fmovse	%xcc,	%f2,	%f31
	movg	%icc,	%l6,	%i0
	edge32	%g5,	%i5,	%i3
	edge32	%g7,	%o6,	%o5
	srl	%l3,	0x05,	%l1
	movle	%icc,	%l4,	%g1
	popc	0x1100,	%l0
	array32	%l5,	%i6,	%i2
	movrgz	%o0,	0x1C1,	%g4
	edge16l	%o7,	%o4,	%o1
	movn	%xcc,	%g6,	%i7
	movne	%icc,	%l2,	%i4
	stb	%i1,	[%l7 + 0x50]
	andncc	%o3,	%g2,	%o2
	sir	0x17C5
	umul	%l6,	%g3,	%i0
	edge8n	%i5,	%g5,	%g7
	srl	%i3,	0x0D,	%o6
	ldsb	[%l7 + 0x40],	%l3
	array32	%o5,	%l4,	%l1
	ldsw	[%l7 + 0x1C],	%g1
	subccc	%l5,	0x02CD,	%i6
	edge32l	%l0,	%i2,	%o0
	stx	%o7,	[%l7 + 0x28]
	sth	%o4,	[%l7 + 0x5E]
	ldsw	[%l7 + 0x74],	%g4
	andncc	%o1,	%g6,	%l2
	setx loop_97, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_97: 	fandnot1s	%f6,	%f17,	%f3
	xor	%i1,	0x0651,	%o2
	lduh	[%l7 + 0x26],	%g2
	xnor	%g3,	%l6,	%i0
	sra	%i5,	0x0E,	%g5
	mulx	%g7,	%i3,	%o6
	faligndata	%f24,	%f0,	%f30
	fornot1s	%f14,	%f6,	%f16
	alignaddrl	%o5,	%l4,	%l1
	or	%g1,	%l5,	%l3
	sub	%l0,	0x1420,	%i2
	and	%o0,	%i6,	%o4
	ldsh	[%l7 + 0x5C],	%g4
	sra	%o7,	%g6,	%o1
	edge8	%l2,	%i4,	%o3
	fmovdne	%xcc,	%f3,	%f9
	subc	%i1,	%o2,	%g2
	mulscc	%g3,	0x1A10,	%l6
	subc	%i7,	0x00A2,	%i5
	edge16n	%g5,	%i0,	%g7
	edge8	%i3,	%o6,	%l4
	movleu	%xcc,	%o5,	%l1
	fpadd16	%f18,	%f4,	%f16
	andncc	%l5,	%l3,	%g1
	edge16n	%i2,	%o0,	%i6
	edge8ln	%l0,	%g4,	%o7
	restore %g6, 0x085D, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f22,	%f29
	edge16	%l2,	%i4,	%o3
	ldx	[%l7 + 0x60],	%o4
	edge16l	%o2,	%g2,	%i1
	udiv	%l6,	0x1AEB,	%g3
	movn	%xcc,	%i7,	%g5
	edge32l	%i5,	%g7,	%i3
	fmovrdgz	%i0,	%f28,	%f20
	ldub	[%l7 + 0x3C],	%o6
	and	%l4,	%o5,	%l1
	alignaddr	%l3,	%g1,	%i2
	array8	%l5,	%o0,	%l0
	alignaddrl	%g4,	%i6,	%o7
	edge32	%g6,	%l2,	%o1
	xnorcc	%i4,	0x10B0,	%o4
	sdivx	%o3,	0x0D93,	%o2
	fmovde	%xcc,	%f18,	%f5
	ldd	[%l7 + 0x38],	%f18
	fnot2s	%f12,	%f11
	movrlez	%i1,	%g2,	%l6
	udivcc	%g3,	0x0CBF,	%g5
	ldub	[%l7 + 0x56],	%i5
	lduh	[%l7 + 0x5C],	%g7
	orncc	%i7,	%i0,	%i3
	fmovsa	%icc,	%f9,	%f17
	fnand	%f20,	%f10,	%f18
	orncc	%l4,	%o6,	%l1
	srl	%o5,	%g1,	%i2
	ldd	[%l7 + 0x10],	%f10
	edge8	%l3,	%o0,	%l5
	mulx	%g4,	%l0,	%o7
	fmul8sux16	%f16,	%f24,	%f30
	fpack16	%f6,	%f25
	fnegd	%f10,	%f8
	fcmple32	%f12,	%f26,	%i6
	movneg	%xcc,	%l2,	%g6
	fmovrslz	%i4,	%f14,	%f28
	alignaddrl	%o4,	%o3,	%o2
	sir	0x0B15
	fnegs	%f23,	%f26
	nop
	set	0x28, %o5
	lduw	[%l7 + %o5],	%o1
	srax	%g2,	%l6,	%g3
	alignaddrl	%g5,	%i1,	%g7
	and	%i7,	%i0,	%i3
	fmovrse	%l4,	%f1,	%f3
	mulscc	%i5,	%l1,	%o5
	fmovdleu	%xcc,	%f0,	%f19
	movvc	%xcc,	%o6,	%i2
	movrlz	%l3,	0x255,	%o0
	popc	0x1CD6,	%g1
	st	%f20,	[%l7 + 0x70]
	fnot1	%f6,	%f12
	fcmpeq32	%f26,	%f14,	%l5
	std	%f16,	[%l7 + 0x10]
	ld	[%l7 + 0x78],	%f13
	fmovsa	%icc,	%f30,	%f26
	xnor	%g4,	%o7,	%l0
	mulscc	%i6,	0x153B,	%l2
	stx	%g6,	[%l7 + 0x58]
	edge8ln	%i4,	%o3,	%o2
	siam	0x5
	fpmerge	%f19,	%f27,	%f6
	setx loop_98, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_98: 	sdiv	%g3,	0x0DD8,	%l6
	movge	%icc,	%i1,	%g7
	edge8ln	%g5,	%i0,	%i7
	edge32	%i3,	%l4,	%i5
	restore %o5, %o6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc0,	%f19,	%f14
	stw	%l3,	[%l7 + 0x50]
	movre	%i2,	%g1,	%o0
	ldsh	[%l7 + 0x74],	%l5
	ldx	[%l7 + 0x68],	%g4
	srl	%o7,	0x0B,	%l0
	srax	%l2,	%i6,	%g6
	and	%o3,	0x131D,	%i4
	srl	%o2,	%o1,	%o4
	movgu	%icc,	%g2,	%g3
	sll	%l6,	%g7,	%i1
	fmovspos	%icc,	%f9,	%f24
	sll	%i0,	%i7,	%g5
	popc	0x0BD2,	%i3
	edge16	%i5,	%l4,	%o6
	movrlz	%l1,	%o5,	%i2
	sdivcc	%l3,	0x068A,	%g1
	ldd	[%l7 + 0x70],	%l4
	movrgz	%g4,	%o7,	%o0
	ldsw	[%l7 + 0x70],	%l0
	movrgez	%l2,	0x01F,	%i6
	fmovsle	%icc,	%f12,	%f1
	mulx	%g6,	0x02F6,	%o3
	move	%xcc,	%o2,	%o1
	xor	%i4,	0x15BC,	%o4
	sra	%g2,	%l6,	%g3
	edge8n	%g7,	%i0,	%i1
	orn	%i7,	%i3,	%g5
	and	%i5,	%l4,	%l1
	fmovse	%xcc,	%f20,	%f29
	siam	0x3
	alignaddrl	%o5,	%i2,	%l3
	sdiv	%g1,	0x1943,	%l5
	array32	%g4,	%o7,	%o6
	umulcc	%l0,	0x11E3,	%o0
	edge16l	%i6,	%l2,	%o3
	edge32l	%g6,	%o2,	%i4
	array32	%o1,	%g2,	%o4
	sdiv	%l6,	0x049B,	%g7
	fmovsge	%xcc,	%f5,	%f8
	ldd	[%l7 + 0x48],	%f20
	sdivcc	%g3,	0x02D1,	%i0
	ldub	[%l7 + 0x51],	%i1
	fandnot2s	%f13,	%f21,	%f11
	sub	%i7,	%g5,	%i5
	edge16n	%i3,	%l4,	%o5
	movre	%l1,	%i2,	%l3
	umul	%g1,	%l5,	%g4
	xorcc	%o6,	%l0,	%o7
	fones	%f25
	fmuld8ulx16	%f30,	%f29,	%f0
	movrlz	%i6,	%o0,	%o3
	ldd	[%l7 + 0x28],	%f14
	ldsb	[%l7 + 0x29],	%g6
	fpsub32s	%f20,	%f8,	%f8
	sllx	%l2,	0x07,	%o2
	fnors	%f5,	%f15,	%f12
	movg	%xcc,	%i4,	%g2
	movcs	%xcc,	%o1,	%o4
	lduw	[%l7 + 0x14],	%g7
	bshuffle	%f0,	%f4,	%f18
	udiv	%g3,	0x0B66,	%i0
	movcs	%icc,	%i1,	%l6
	fcmpeq16	%f0,	%f0,	%g5
	movvs	%icc,	%i7,	%i5
	fandnot2s	%f23,	%f7,	%f9
	movvc	%icc,	%i3,	%o5
	ld	[%l7 + 0x6C],	%f15
	andncc	%l1,	%i2,	%l4
	movneg	%xcc,	%g1,	%l5
	sdiv	%l3,	0x1F91,	%g4
	subc	%l0,	0x0ECB,	%o7
	fnot1	%f30,	%f20
	ldsh	[%l7 + 0x44],	%o6
	srax	%o0,	%i6,	%g6
	edge16	%l2,	%o2,	%o3
	ldsw	[%l7 + 0x50],	%i4
	movvs	%xcc,	%o1,	%o4
	ldsb	[%l7 + 0x38],	%g2
	sdiv	%g7,	0x08DB,	%i0
	movne	%icc,	%i1,	%l6
	addc	%g5,	0x0D3E,	%i7
	orn	%i5,	0x01A5,	%i3
	fones	%f1
	lduw	[%l7 + 0x34],	%o5
	edge32l	%l1,	%i2,	%l4
	array32	%g3,	%l5,	%l3
	fandnot2s	%f7,	%f14,	%f26
	movn	%icc,	%g1,	%l0
	sllx	%o7,	%g4,	%o0
	orn	%i6,	%o6,	%g6
	fpadd32s	%f0,	%f29,	%f0
	xorcc	%o2,	%o3,	%i4
	fmovrdgez	%l2,	%f4,	%f8
	mulx	%o1,	0x0E1D,	%g2
	fmovrsne	%g7,	%f28,	%f16
	fcmpeq16	%f6,	%f24,	%o4
	fzero	%f0
	orn	%i0,	0x17C1,	%i1
	array32	%l6,	%g5,	%i5
	smul	%i3,	%o5,	%i7
	smulcc	%i2,	%l4,	%l1
	fzeros	%f13
	subcc	%g3,	0x08A5,	%l5
	popc	0x1E42,	%g1
	ldsb	[%l7 + 0x5B],	%l3
	bshuffle	%f24,	%f20,	%f16
	fxnor	%f18,	%f28,	%f22
	setx loop_99, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_99: 	fmovsg	%icc,	%f2,	%f30
	subcc	%o0,	%i6,	%o7
	movge	%icc,	%g6,	%o6
	sir	0x184B
	fnot2s	%f30,	%f4
	fmovsle	%xcc,	%f22,	%f28
	for	%f2,	%f28,	%f0
	fmovrsgz	%o3,	%f29,	%f3
	movcc	%icc,	%i4,	%l2
	srax	%o1,	0x0E,	%o2
	movrgz	%g7,	%o4,	%g2
	movrne	%i1,	%i0,	%g5
	smul	%i5,	%i3,	%l6
	lduw	[%l7 + 0x1C],	%i7
	movrgez	%o5,	0x279,	%l4
	fmovrsgz	%l1,	%f19,	%f7
	edge16	%i2,	%l5,	%g1
	mulscc	%g3,	%l3,	%l0
	movl	%icc,	%o0,	%i6
	edge16ln	%g4,	%o7,	%g6
	sub	%o6,	0x153F,	%o3
	mulscc	%l2,	0x042C,	%o1
	array32	%o2,	%i4,	%o4
	ldx	[%l7 + 0x68],	%g2
	save %i1, 0x1D4E, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f13,	%f12,	%f1
	edge8l	%g5,	%i5,	%i3
	sub	%g7,	0x14C8,	%i7
	array16	%o5,	%l6,	%l1
	movcs	%icc,	%l4,	%l5
	addc	%i2,	%g3,	%l3
	fmovrdne	%l0,	%f22,	%f16
	andn	%o0,	%i6,	%g4
	edge8	%o7,	%g1,	%g6
	edge32	%o3,	%l2,	%o6
	save %o1, 0x0C8E, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x66],	%o4
	mulscc	%i4,	0x1163,	%g2
	or	%i0,	%i1,	%i5
	restore %g5, 0x114E, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g7,	%o5,	%l6
	mulx	%i7,	%l4,	%l5
	array32	%i2,	%g3,	%l1
	stb	%l3,	[%l7 + 0x6A]
	fpmerge	%f26,	%f2,	%f4
	srax	%o0,	0x09,	%l0
	fpadd32s	%f20,	%f8,	%f0
	xorcc	%g4,	%i6,	%g1
	movneg	%icc,	%o7,	%g6
	subccc	%o3,	%o6,	%l2
	fmovdcc	%icc,	%f8,	%f23
	fmovsl	%xcc,	%f10,	%f23
	umul	%o2,	0x0E19,	%o4
	array32	%i4,	%g2,	%i0
	fpsub16	%f20,	%f14,	%f26
	st	%f12,	[%l7 + 0x18]
	fmul8sux16	%f2,	%f30,	%f4
	andncc	%i1,	%i5,	%g5
	udivcc	%o1,	0x012B,	%i3
	popc	0x13DF,	%o5
	stb	%l6,	[%l7 + 0x73]
	movre	%i7,	%g7,	%l4
	addcc	%i2,	0x1F68,	%g3
	movg	%xcc,	%l1,	%l5
	move	%xcc,	%l3,	%l0
	movle	%xcc,	%o0,	%i6
	movne	%icc,	%g4,	%o7
	mulscc	%g6,	%g1,	%o6
	andn	%o3,	%l2,	%o4
	fpmerge	%f6,	%f22,	%f28
	movrlez	%o2,	%i4,	%i0
	sub	%i1,	%g2,	%g5
	edge8	%o1,	%i3,	%o5
	fmovdleu	%icc,	%f14,	%f25
	array32	%l6,	%i5,	%g7
	fmovsvc	%xcc,	%f25,	%f13
	fmul8x16au	%f5,	%f23,	%f24
	edge16ln	%l4,	%i2,	%g3
	movneg	%xcc,	%i7,	%l1
	fmovdle	%xcc,	%f25,	%f17
	ld	[%l7 + 0x24],	%f15
	andn	%l3,	%l5,	%l0
	mulx	%o0,	0x023F,	%i6
	srl	%g4,	%o7,	%g6
	stw	%g1,	[%l7 + 0x6C]
	edge16ln	%o3,	%o6,	%l2
	ldx	[%l7 + 0x20],	%o2
	fcmple16	%f28,	%f18,	%o4
	fmovsn	%icc,	%f7,	%f28
	sub	%i4,	%i1,	%g2
	bshuffle	%f26,	%f12,	%f18
	popc	0x0F0A,	%g5
	nop
	set	0x12, %o7
	sth	%i0,	[%l7 + %o7]
	popc	%i3,	%o5
	subcc	%l6,	0x1F87,	%i5
	array32	%g7,	%o1,	%l4
	edge16n	%g3,	%i7,	%l1
	sir	0x1A8A
	fcmpgt16	%f6,	%f20,	%l3
	movn	%xcc,	%l5,	%l0
	fpadd16s	%f24,	%f15,	%f29
	edge8l	%o0,	%i6,	%g4
	movrne	%i2,	0x269,	%g6
	ldd	[%l7 + 0x10],	%o6
	movrlez	%o3,	0x364,	%g1
	setx loop_100, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_100: 	xor	%i4,	0x01F6,	%o2
	smul	%g2,	%i1,	%i0
	and	%i3,	%g5,	%l6
	edge16n	%o5,	%i5,	%g7
	fmovdcs	%xcc,	%f6,	%f0
	sll	%o1,	0x14,	%g3
	srl	%l4,	%l1,	%i7
	fnot1s	%f5,	%f24
	fsrc1	%f8,	%f8
	sra	%l3,	0x1E,	%l5
	subc	%l0,	0x0C24,	%o0
	ldd	[%l7 + 0x40],	%f14
	xnor	%i6,	0x06AD,	%i2
	array32	%g4,	%o7,	%o3
	fsrc1	%f22,	%f8
	udiv	%g6,	0x0BBB,	%g1
	move	%xcc,	%o6,	%o4
	edge32	%i4,	%l2,	%o2
	movrlz	%i1,	%i0,	%g2
	umulcc	%i3,	%l6,	%o5
	fcmpne32	%f24,	%f6,	%i5
	sdivx	%g5,	0x0BD4,	%o1
	movgu	%icc,	%g3,	%g7
	fornot2s	%f4,	%f9,	%f7
	edge16	%l4,	%i7,	%l3
	movrlez	%l1,	0x0DA,	%l0
	array32	%l5,	%o0,	%i6
	movn	%xcc,	%g4,	%i2
	alignaddrl	%o7,	%o3,	%g6
	edge32ln	%g1,	%o6,	%o4
	move	%icc,	%i4,	%l2
	subcc	%o2,	0x0F9A,	%i1
	srl	%g2,	%i3,	%l6
	movcs	%xcc,	%o5,	%i5
	move	%icc,	%i0,	%g5
	ldsh	[%l7 + 0x66],	%g3
	ld	[%l7 + 0x0C],	%f6
	udiv	%g7,	0x0E31,	%l4
	fmovrdgez	%i7,	%f0,	%f22
	edge8l	%o1,	%l1,	%l0
	edge16n	%l5,	%l3,	%i6
	udiv	%g4,	0x17F4,	%i2
	subcc	%o0,	%o3,	%g6
	subcc	%o7,	%g1,	%o6
	movcs	%xcc,	%o4,	%l2
	xnor	%i4,	0x07F7,	%o2
	move	%icc,	%g2,	%i1
	orn	%i3,	0x19F5,	%l6
	movn	%icc,	%i5,	%i0
	stb	%g5,	[%l7 + 0x55]
	ldsw	[%l7 + 0x20],	%o5
	fmovrdgz	%g7,	%f28,	%f28
	sir	0x1963
	fmovde	%xcc,	%f2,	%f3
	andcc	%g3,	%l4,	%i7
	for	%f2,	%f2,	%f6
	fone	%f24
	sra	%l1,	%l0,	%l5
	edge8l	%l3,	%o1,	%i6
	sdiv	%g4,	0x0129,	%i2
	subc	%o0,	%g6,	%o7
	edge8	%g1,	%o6,	%o4
	movg	%icc,	%l2,	%i4
	sir	0x1682
	movrlez	%o3,	%g2,	%i1
	edge32	%i3,	%o2,	%i5
	subcc	%i0,	%g5,	%o5
	fornot2	%f26,	%f12,	%f8
	fxnors	%f23,	%f0,	%f19
	smulcc	%g7,	%g3,	%l4
	movgu	%xcc,	%i7,	%l1
	array8	%l6,	%l0,	%l5
	ld	[%l7 + 0x08],	%f6
	fcmpeq16	%f8,	%f10,	%l3
	edge16	%o1,	%i6,	%g4
	movg	%icc,	%i2,	%o0
	alignaddrl	%g6,	%g1,	%o7
	srl	%o4,	0x11,	%l2
	fornot2s	%f31,	%f8,	%f0
	fornot1	%f6,	%f12,	%f26
	movn	%xcc,	%o6,	%i4
	save %o3, %i1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o2,	[%l7 + 0x2F]
	movrgz	%g2,	%i5,	%g5
	edge32l	%o5,	%g7,	%g3
	ld	[%l7 + 0x5C],	%f26
	nop
	set	0x74, %o3
	lduh	[%l7 + %o3],	%l4
	stw	%i0,	[%l7 + 0x30]
	udivx	%i7,	0x11CD,	%l1
	mulscc	%l0,	%l5,	%l6
	sdivx	%l3,	0x0E70,	%o1
	movcc	%xcc,	%i6,	%i2
	umulcc	%o0,	%g4,	%g6
	subccc	%g1,	%o4,	%o7
	movge	%icc,	%o6,	%i4
	edge32l	%o3,	%i1,	%l2
	umulcc	%o2,	0x14F5,	%g2
	fpsub16s	%f4,	%f9,	%f7
	movrlz	%i5,	0x16E,	%g5
	fmul8x16	%f29,	%f30,	%f22
	alignaddr	%o5,	%i3,	%g7
	fabss	%f7,	%f27
	restore %g3, 0x15B7, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i7,	%l4,	%l1
	edge16	%l0,	%l6,	%l5
	andcc	%l3,	%o1,	%i2
	fnegs	%f27,	%f23
	alignaddrl	%o0,	%i6,	%g4
	array8	%g6,	%g1,	%o7
	alignaddrl	%o6,	%o4,	%o3
	stw	%i4,	[%l7 + 0x2C]
	xor	%l2,	%o2,	%i1
	fnot2s	%f0,	%f31
	movleu	%xcc,	%g2,	%g5
	ldub	[%l7 + 0x49],	%i5
	st	%f30,	[%l7 + 0x40]
	lduh	[%l7 + 0x6A],	%i3
	fandnot1s	%f24,	%f11,	%f25
	std	%f2,	[%l7 + 0x78]
	movg	%icc,	%g7,	%o5
	movrne	%i0,	0x14D,	%g3
	nop
	set	0x28, %i1
	ldsb	[%l7 + %i1],	%i7
	umulcc	%l1,	0x04C4,	%l0
	subcc	%l6,	0x124D,	%l4
	ldsw	[%l7 + 0x3C],	%l5
	edge16l	%o1,	%i2,	%o0
	fmovdge	%icc,	%f8,	%f5
	movrgez	%l3,	0x006,	%i6
	xor	%g4,	%g6,	%g1
	edge8n	%o7,	%o6,	%o4
	sub	%i4,	0x1C4E,	%o3
	alignaddrl	%o2,	%l2,	%g2
	edge16n	%g5,	%i5,	%i1
	movre	%g7,	0x30B,	%o5
	fandnot2	%f4,	%f14,	%f2
	st	%f18,	[%l7 + 0x28]
	movcc	%icc,	%i3,	%g3
	movrlez	%i0,	%i7,	%l0
	ldsh	[%l7 + 0x6E],	%l1
	lduh	[%l7 + 0x2A],	%l6
	movle	%xcc,	%l4,	%o1
	edge32l	%l5,	%i2,	%o0
	movvc	%icc,	%l3,	%i6
	movrgez	%g4,	%g1,	%o7
	fmovdleu	%icc,	%f12,	%f29
	alignaddrl	%g6,	%o4,	%i4
	fmovrde	%o6,	%f10,	%f12
	movgu	%xcc,	%o3,	%l2
	alignaddr	%g2,	%g5,	%i5
	movvs	%xcc,	%i1,	%g7
	fmovdcc	%xcc,	%f10,	%f8
	fmovsg	%icc,	%f9,	%f26
	fmul8x16al	%f22,	%f2,	%f18
	movn	%icc,	%o2,	%o5
	movg	%icc,	%i3,	%i0
	fzeros	%f18
	ldub	[%l7 + 0x1F],	%g3
	movvc	%xcc,	%l0,	%l1
	array8	%l6,	%l4,	%i7
	alignaddrl	%o1,	%i2,	%o0
	mulscc	%l3,	%l5,	%g4
	ldsw	[%l7 + 0x30],	%g1
	addcc	%o7,	%g6,	%o4
	srax	%i4,	0x0A,	%i6
	fands	%f24,	%f24,	%f15
	ldsh	[%l7 + 0x2E],	%o6
	lduw	[%l7 + 0x68],	%o3
	movl	%xcc,	%g2,	%l2
	sra	%g5,	%i1,	%i5
	ldub	[%l7 + 0x49],	%o2
	edge8ln	%o5,	%g7,	%i3
	addc	%g3,	%l0,	%i0
	fmovsa	%icc,	%f19,	%f2
	save %l6, %l1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l4,	%i2
	addccc	%o1,	0x1744,	%l3
	fmul8ulx16	%f14,	%f18,	%f18
	sllx	%l5,	0x17,	%o0
	sdivx	%g1,	0x02A2,	%g4
	fmovda	%xcc,	%f18,	%f1
	movvc	%icc,	%g6,	%o7
	movg	%xcc,	%i4,	%o4
	edge32	%o6,	%i6,	%o3
	fmovse	%xcc,	%f22,	%f31
	movne	%xcc,	%g2,	%g5
	ldsw	[%l7 + 0x44],	%l2
	fpsub32	%f18,	%f22,	%f18
	array32	%i5,	%o2,	%o5
	edge8n	%i1,	%g7,	%g3
	fnands	%f8,	%f3,	%f21
	stw	%i3,	[%l7 + 0x74]
	sllx	%i0,	0x0C,	%l6
	ldsb	[%l7 + 0x74],	%l1
	st	%f5,	[%l7 + 0x40]
	edge8l	%i7,	%l0,	%i2
	fmul8sux16	%f14,	%f6,	%f10
	movne	%xcc,	%l4,	%l3
	movrlez	%l5,	%o1,	%g1
	movvs	%xcc,	%g4,	%g6
	movge	%xcc,	%o7,	%i4
	edge16	%o4,	%o6,	%o0
	ldsh	[%l7 + 0x1C],	%i6
	mulscc	%o3,	0x1E01,	%g5
	nop
	set	0x08, %i2
	stx	%l2,	[%l7 + %i2]
	addc	%i5,	0x0200,	%o2
	fmul8x16	%f12,	%f20,	%f28
	edge8ln	%g2,	%o5,	%i1
	array8	%g3,	%i3,	%g7
	udivx	%i0,	0x0754,	%l1
	edge32n	%l6,	%l0,	%i7
	edge8	%l4,	%l3,	%i2
	addcc	%o1,	0x0D8A,	%g1
	smul	%g4,	0x1847,	%g6
	fxors	%f24,	%f9,	%f17
	srl	%o7,	%i4,	%l5
	fmovdvc	%icc,	%f2,	%f0
	stx	%o6,	[%l7 + 0x78]
	fmovse	%icc,	%f24,	%f31
	stx	%o0,	[%l7 + 0x70]
	xnor	%i6,	0x1B2A,	%o4
	sllx	%o3,	%g5,	%l2
	setx loop_101, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_101: 	movne	%icc,	%g2,	%i1
	movgu	%icc,	%i3,	%g3
	fsrc1	%f26,	%f12
	stx	%g7,	[%l7 + 0x38]
	addccc	%i0,	%l1,	%l6
	fpadd32s	%f5,	%f27,	%f17
	fpsub32s	%f2,	%f8,	%f15
	movle	%xcc,	%l0,	%i7
	array16	%l3,	%l4,	%o1
	ldd	[%l7 + 0x78],	%g0
	fpack32	%f16,	%f24,	%f12
	movge	%icc,	%i2,	%g4
	fmovdleu	%icc,	%f22,	%f12
	fnot2	%f24,	%f26
	edge32	%o7,	%g6,	%i4
	fmuld8sux16	%f9,	%f15,	%f0
	alignaddrl	%l5,	%o0,	%i6
	sir	0x1D56
	mova	%xcc,	%o4,	%o6
	array32	%g5,	%o3,	%l2
	xnor	%o2,	%o5,	%g2
	subc	%i5,	%i1,	%g3
	array32	%g7,	%i0,	%l1
	smulcc	%i3,	0x1416,	%l0
	edge32ln	%i7,	%l3,	%l4
	sdivx	%o1,	0x0392,	%l6
	ldd	[%l7 + 0x78],	%i2
	fornot1	%f0,	%f8,	%f18
	fcmpne32	%f24,	%f26,	%g4
	fornot2	%f26,	%f28,	%f10
	array32	%g1,	%g6,	%i4
	movpos	%xcc,	%l5,	%o7
	fnegs	%f25,	%f23
	udivx	%i6,	0x1588,	%o4
	and	%o6,	%o0,	%o3
	sth	%l2,	[%l7 + 0x0E]
	edge16l	%o2,	%g5,	%o5
	orncc	%i5,	0x1A4A,	%i1
	fmovda	%icc,	%f17,	%f16
	mulscc	%g3,	0x043F,	%g7
	edge16ln	%g2,	%i0,	%l1
	fpmerge	%f24,	%f14,	%f20
	fmovrse	%i3,	%f6,	%f5
	fxnor	%f20,	%f24,	%f8
	fmovsne	%icc,	%f12,	%f8
	nop
	set	0x38, %g5
	ldx	[%l7 + %g5],	%l0
	sth	%i7,	[%l7 + 0x6C]
	fzero	%f14
	srl	%l4,	%l3,	%o1
	stw	%i2,	[%l7 + 0x74]
	movrlz	%l6,	%g4,	%g1
	edge16n	%g6,	%i4,	%l5
	lduw	[%l7 + 0x3C],	%o7
	alignaddrl	%o4,	%i6,	%o0
	ldsb	[%l7 + 0x1D],	%o3
	movg	%xcc,	%o6,	%l2
	sllx	%o2,	0x1A,	%o5
	udivcc	%i5,	0x12C2,	%g5
	edge8l	%i1,	%g3,	%g7
	movneg	%xcc,	%g2,	%i0
	movvs	%xcc,	%i3,	%l1
	movrgez	%l0,	0x36F,	%i7
	andncc	%l4,	%o1,	%i2
	fxors	%f3,	%f11,	%f15
	std	%f10,	[%l7 + 0x78]
	mulscc	%l6,	0x1242,	%g4
	sra	%l3,	0x07,	%g1
	fornot2	%f14,	%f2,	%f28
	edge8n	%g6,	%l5,	%o7
	movpos	%xcc,	%i4,	%o4
	movge	%icc,	%i6,	%o0
	save %o3, 0x0656, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc3,	%f17,	%f1
	subccc	%o6,	%o2,	%i5
	movn	%icc,	%o5,	%g5
	or	%g3,	0x005C,	%g7
	fnot1s	%f11,	%f29
	lduh	[%l7 + 0x44],	%i1
	movvc	%xcc,	%g2,	%i3
	edge8ln	%i0,	%l1,	%i7
	movcs	%icc,	%l0,	%o1
	movvs	%icc,	%l4,	%l6
	fornot1	%f22,	%f8,	%f8
	fandnot2	%f0,	%f20,	%f28
	orncc	%i2,	%l3,	%g1
	movcs	%icc,	%g6,	%l5
	for	%f2,	%f22,	%f28
	subcc	%o7,	%i4,	%g4
	edge8	%o4,	%i6,	%o3
	sra	%o0,	0x09,	%l2
	and	%o6,	%i5,	%o2
	ld	[%l7 + 0x5C],	%f5
	edge8n	%g5,	%g3,	%g7
	fmul8x16al	%f1,	%f17,	%f22
	edge32ln	%o5,	%i1,	%g2
	movcc	%xcc,	%i0,	%i3
	fandnot1s	%f4,	%f31,	%f22
	array8	%l1,	%i7,	%l0
	movvc	%xcc,	%o1,	%l6
	ldsw	[%l7 + 0x54],	%i2
	movrgez	%l3,	0x07D,	%g1
	edge32ln	%l4,	%l5,	%g6
	fmovrsne	%i4,	%f2,	%f2
	umulcc	%o7,	%o4,	%g4
	array32	%o3,	%i6,	%o0
	movge	%xcc,	%l2,	%i5
	array16	%o2,	%g5,	%o6
	edge16	%g3,	%o5,	%g7
	edge16	%i1,	%i0,	%i3
	fxor	%f26,	%f14,	%f0
	mulscc	%g2,	0x0E5A,	%i7
	movrgz	%l0,	%l1,	%o1
	movne	%xcc,	%i2,	%l3
	fabss	%f24,	%f22
	fmovsg	%xcc,	%f12,	%f29
	edge16	%g1,	%l6,	%l5
	addc	%l4,	0x14C2,	%i4
	movrgz	%g6,	0x088,	%o4
	movge	%xcc,	%g4,	%o3
	faligndata	%f28,	%f20,	%f20
	ldsh	[%l7 + 0x4E],	%i6
	array32	%o7,	%o0,	%i5
	movrlez	%l2,	%o2,	%o6
	lduh	[%l7 + 0x56],	%g3
	edge16l	%g5,	%o5,	%g7
	std	%f12,	[%l7 + 0x10]
	edge16l	%i1,	%i0,	%i3
	fmovspos	%xcc,	%f5,	%f8
	movne	%xcc,	%i7,	%l0
	movg	%xcc,	%l1,	%o1
	edge16	%i2,	%l3,	%g1
	st	%f31,	[%l7 + 0x58]
	stw	%g2,	[%l7 + 0x6C]
	save %l6, %l4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%l5,	%f10,	%f24
	udivcc	%o4,	0x158A,	%g6
	fmovd	%f26,	%f24
	fmovrslez	%g4,	%f27,	%f6
	edge32l	%i6,	%o7,	%o0
	fmul8ulx16	%f2,	%f20,	%f22
	movvs	%xcc,	%o3,	%l2
	movcc	%xcc,	%i5,	%o6
	movcc	%xcc,	%o2,	%g3
	movn	%xcc,	%o5,	%g5
	movn	%icc,	%i1,	%g7
	fabsd	%f18,	%f2
	movre	%i3,	0x2D8,	%i0
	movrne	%i7,	0x38F,	%l0
	addcc	%o1,	%i2,	%l3
	fmovdl	%icc,	%f30,	%f6
	edge16n	%l1,	%g1,	%l6
	edge32ln	%g2,	%i4,	%l5
	stw	%o4,	[%l7 + 0x20]
	edge16ln	%g6,	%l4,	%g4
	fmovdcs	%xcc,	%f28,	%f12
	edge16	%i6,	%o7,	%o0
	udivcc	%l2,	0x0AF2,	%o3
	array32	%i5,	%o2,	%o6
	movcc	%xcc,	%o5,	%g3
	fmovde	%icc,	%f1,	%f2
	fpadd16s	%f11,	%f12,	%f23
	restore %i1, 0x0B78, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x3C],	%f24
	movrlz	%i3,	0x3FA,	%g7
	sdivcc	%i7,	0x0A87,	%l0
	fones	%f29
	edge8n	%o1,	%i0,	%l3
	movleu	%xcc,	%i2,	%g1
	umul	%l1,	%l6,	%g2
	lduw	[%l7 + 0x74],	%l5
	stw	%o4,	[%l7 + 0x7C]
	movrne	%i4,	%g6,	%l4
	stx	%i6,	[%l7 + 0x30]
	fand	%f8,	%f2,	%f18
	fnors	%f20,	%f27,	%f31
	movvc	%xcc,	%g4,	%o0
	popc	%o7,	%o3
	fcmpne16	%f8,	%f26,	%i5
	fmovrdgez	%o2,	%f28,	%f16
	addc	%o6,	0x0D9E,	%o5
	fmovrse	%g3,	%f16,	%f23
	umul	%l2,	%i1,	%i3
	movgu	%icc,	%g7,	%g5
	movl	%xcc,	%l0,	%o1
	fpadd16	%f16,	%f8,	%f24
	lduh	[%l7 + 0x7A],	%i0
	mulscc	%i7,	%i2,	%g1
	sethi	0x0EFD,	%l3
	sdiv	%l1,	0x0B24,	%l6
	movvc	%xcc,	%l5,	%o4
	movn	%icc,	%i4,	%g2
	movvs	%xcc,	%l4,	%g6
	edge16n	%i6,	%o0,	%o7
	movn	%xcc,	%g4,	%o3
	edge32l	%o2,	%o6,	%i5
	xnor	%g3,	0x1299,	%l2
	srax	%o5,	0x09,	%i3
	xor	%g7,	%g5,	%i1
	fpadd32s	%f10,	%f1,	%f19
	fmovrse	%o1,	%f2,	%f17
	ldsw	[%l7 + 0x24],	%i0
	alignaddrl	%l0,	%i2,	%i7
	xorcc	%l3,	0x1A2E,	%g1
	sllx	%l1,	0x12,	%l6
	xorcc	%o4,	%l5,	%i4
	stw	%g2,	[%l7 + 0x40]
	fmovrsgez	%l4,	%f16,	%f17
	srl	%i6,	%g6,	%o0
	faligndata	%f10,	%f10,	%f24
	or	%o7,	0x1835,	%o3
	addcc	%o2,	0x11F7,	%o6
	and	%g4,	%i5,	%l2
	fmul8x16al	%f7,	%f16,	%f2
	st	%f27,	[%l7 + 0x6C]
	movne	%icc,	%g3,	%i3
	st	%f13,	[%l7 + 0x54]
	udivx	%o5,	0x0BE7,	%g7
	andcc	%g5,	0x03C2,	%i1
	movcc	%icc,	%o1,	%l0
	alignaddr	%i2,	%i7,	%i0
	sdivx	%g1,	0x0DA2,	%l3
	sdivx	%l1,	0x05D7,	%l6
	sllx	%l5,	%o4,	%i4
	fmovsg	%xcc,	%f16,	%f2
	array8	%g2,	%i6,	%l4
	stb	%o0,	[%l7 + 0x28]
	sth	%g6,	[%l7 + 0x34]
	alignaddrl	%o3,	%o7,	%o6
	fand	%f20,	%f28,	%f0
	fmovsgu	%xcc,	%f4,	%f17
	movgu	%xcc,	%o2,	%g4
	fxnor	%f28,	%f14,	%f10
	add	%i5,	%l2,	%i3
	fzeros	%f0
	addcc	%o5,	0x079B,	%g7
	fzeros	%f6
	ldx	[%l7 + 0x68],	%g5
	fornot2s	%f27,	%f9,	%f19
	fmovsgu	%icc,	%f27,	%f5
	movrne	%i1,	%o1,	%g3
	fmovsle	%icc,	%f15,	%f0
	edge16n	%i2,	%i7,	%l0
	andn	%g1,	%l3,	%l1
	sdivcc	%l6,	0x0C85,	%l5
	andcc	%o4,	0x1543,	%i0
	subccc	%g2,	%i4,	%l4
	ldub	[%l7 + 0x5F],	%o0
	xor	%g6,	0x13E9,	%o3
	movge	%xcc,	%i6,	%o7
	fnot2	%f14,	%f8
	fcmpgt16	%f20,	%f4,	%o2
	fmovsa	%icc,	%f13,	%f23
	edge32n	%o6,	%i5,	%l2
	and	%g4,	0x1BF0,	%o5
	movgu	%xcc,	%g7,	%i3
	ldsw	[%l7 + 0x38],	%g5
	edge32	%i1,	%o1,	%g3
	edge16ln	%i2,	%i7,	%l0
	movle	%icc,	%g1,	%l1
	xorcc	%l3,	0x0CC1,	%l5
	orncc	%o4,	0x1015,	%i0
	subc	%l6,	%g2,	%l4
	udivx	%i4,	0x1C34,	%g6
	ld	[%l7 + 0x4C],	%f16
	addccc	%o3,	0x09FD,	%o0
	sdivx	%o7,	0x08BF,	%o2
	fcmpes	%fcc2,	%f31,	%f31
	fexpand	%f21,	%f10
	fmovrsgz	%i6,	%f17,	%f14
	mova	%icc,	%o6,	%i5
	movn	%xcc,	%g4,	%l2
	edge8ln	%o5,	%i3,	%g5
	movvs	%icc,	%g7,	%o1
	xnorcc	%i1,	0x015A,	%i2
	fpmerge	%f8,	%f14,	%f22
	sdiv	%g3,	0x1673,	%l0
	movrlz	%i7,	0x3B2,	%g1
	udivcc	%l3,	0x11FA,	%l5
	edge16	%o4,	%i0,	%l1
	movpos	%icc,	%l6,	%l4
	movleu	%xcc,	%g2,	%g6
	addccc	%i4,	%o0,	%o7
	fpsub16	%f26,	%f4,	%f6
	and	%o2,	0x075B,	%o3
	faligndata	%f18,	%f4,	%f10
	add	%i6,	0x18B7,	%i5
	fpsub16	%f28,	%f6,	%f14
	fmovdne	%icc,	%f27,	%f0
	ldsb	[%l7 + 0x35],	%g4
	smulcc	%o6,	0x14FE,	%l2
	fand	%f10,	%f26,	%f30
	sdivx	%i3,	0x1A67,	%g5
	fandnot1	%f18,	%f28,	%f12
	fornot1s	%f31,	%f28,	%f2
	sdivx	%g7,	0x1BDE,	%o5
	fmul8x16au	%f6,	%f12,	%f24
	setx loop_102, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_102: 	movne	%icc,	%i2,	%g3
	orcc	%i7,	0x032C,	%l0
	subc	%g1,	%l5,	%l3
	fmovsne	%xcc,	%f21,	%f4
	edge32l	%o4,	%i0,	%l6
	fmovdvs	%xcc,	%f12,	%f28
	edge8l	%l1,	%l4,	%g2
	orncc	%i4,	%o0,	%g6
	fmovrsne	%o2,	%f24,	%f20
	sdiv	%o3,	0x095C,	%i6
	save %i5, %o7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l2,	%i3,	%o6
	movrne	%g7,	0x16D,	%g5
	movrgez	%o5,	0x3DD,	%o1
	edge8n	%i1,	%g3,	%i2
	edge16ln	%l0,	%g1,	%i7
	xorcc	%l5,	%l3,	%i0
	movcc	%icc,	%l6,	%o4
	nop
	set	0x49, %g1
	ldub	[%l7 + %g1],	%l1
	siam	0x4
	fmovde	%icc,	%f7,	%f2
	sth	%g2,	[%l7 + 0x78]
	movrgez	%i4,	0x1AC,	%o0
	fmovrslez	%l4,	%f19,	%f25
	orncc	%g6,	0x0C6C,	%o2
	siam	0x1
	pdist	%f14,	%f0,	%f2
	addc	%i6,	0x18A2,	%o3
	or	%o7,	0x0173,	%i5
	movcs	%icc,	%l2,	%i3
	fcmpgt16	%f6,	%f18,	%o6
	movne	%icc,	%g4,	%g7
	fsrc1	%f0,	%f22
	fzeros	%f30
	movneg	%xcc,	%o5,	%o1
	andncc	%g5,	%i1,	%g3
	movrlz	%i2,	0x1A7,	%l0
	fmovsvs	%xcc,	%f23,	%f11
	array16	%i7,	%g1,	%l5
	subcc	%l3,	0x0003,	%i0
	lduh	[%l7 + 0x5A],	%l6
	sub	%o4,	%l1,	%g2
	orncc	%o0,	%i4,	%g6
	edge32ln	%o2,	%i6,	%l4
	fexpand	%f25,	%f28
	fornot2s	%f4,	%f12,	%f27
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3545
!	Type f   	: 5431
!	Type i   	: 16024
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x8A273929
.word 0xA7866DBE
.word 0x8E01C1CB
.word 0x628264AA
.word 0xF22065D5
.word 0xFAA81B52
.word 0xB03E6294
.word 0xB6E7BD5E
.word 0xF81193D3
.word 0x1A33C0D2
.word 0x6CAB0F46
.word 0xC72A4153
.word 0x935B9D95
.word 0xD4FC5BE7
.word 0xCFE0919F
.word 0xDA5B5A8A
.word 0x99A3CFFD
.word 0x00E8B172
.word 0x7A1AFF18
.word 0x2C73CBF2
.word 0x6F6D559D
.word 0xA481DD92
.word 0x3F0271CE
.word 0x654244A4
.word 0xE50F49C3
.word 0x53DD6011
.word 0xAADA9BF6
.word 0xFD38C105
.word 0x5984D61D
.word 0x4635B997
.word 0x9B3F14FE
.word 0x0F4637DC
.word 0xBE0944BB
.word 0xAEA1CE8C
.word 0xA0CBE20B
.word 0xAB709073
.word 0xE34331F7
.word 0xBE890DA8
.word 0xB14A0050
.word 0x54BD86CA
.word 0x9DEA9C67
.word 0x5E97C692
.word 0x7EE68FD0
.word 0x4220FD08
.word 0xF4D5DDDB
.word 0xDC9CE9F1
.word 0x7FA9AFA3
.word 0xFA1D487C
.word 0x302067B6
.word 0x552B82E7
.word 0xB8AACC3B
.word 0x5EBFC852
.word 0x68C707C3
.word 0x97CA441F
.word 0xE033C368
.word 0x91B9F516
.word 0x1AF3783D
.word 0x506B5C52
.word 0x826E2989
.word 0xC0D50695
.word 0x556ED909
.word 0xD00F0704
.word 0xE28C911B
.word 0xD79C2AA9
.end
