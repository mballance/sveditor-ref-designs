/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f17.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f17.s,v 1.1 2007/05/11 17:22:37 drp Exp $"
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
	setx	0x2D6041F1B0451063,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xC,	%g1
	set	0xF,	%g2
	set	0x9,	%g3
	set	0x9,	%g4
	set	0xB,	%g5
	set	0xF,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x8,	%i1
	set	-0x5,	%i2
	set	-0xD,	%i3
	set	-0x7,	%i4
	set	-0x5,	%i5
	set	-0x9,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x1A1049CF,	%l0
	set	0x12D36F78,	%l1
	set	0x5B41CD6E,	%l2
	set	0x33A21C8F,	%l3
	set	0x17B06D73,	%l4
	set	0x57C09574,	%l5
	set	0x14639853,	%l6
	!# Output registers
	set	0x0E83,	%o0
	set	0x1E0D,	%o1
	set	-0x0812,	%o2
	set	0x01B4,	%o3
	set	-0x1BA0,	%o4
	set	-0x1C8A,	%o5
	set	-0x0A2F,	%o6
	set	-0x1032,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x358A2528E7ED6173)
	INIT_TH_FP_REG(%l7,%f2,0xB98FFDE69D312607)
	INIT_TH_FP_REG(%l7,%f4,0x4D203DFC979EDFA7)
	INIT_TH_FP_REG(%l7,%f6,0x5D788BE43E019DEF)
	INIT_TH_FP_REG(%l7,%f8,0xCFE4BE3531CA9231)
	INIT_TH_FP_REG(%l7,%f10,0xA30C9F22575153C3)
	INIT_TH_FP_REG(%l7,%f12,0xCB131AE311C0220C)
	INIT_TH_FP_REG(%l7,%f14,0x1C62C3B5110C13EB)
	INIT_TH_FP_REG(%l7,%f16,0xFA69D0B162021BAE)
	INIT_TH_FP_REG(%l7,%f18,0x7057197184B771AB)
	INIT_TH_FP_REG(%l7,%f20,0x241CA0B6C901E62E)
	INIT_TH_FP_REG(%l7,%f22,0xF905026D8CC4E402)
	INIT_TH_FP_REG(%l7,%f24,0xD912B469BCE4CFCB)
	INIT_TH_FP_REG(%l7,%f26,0x323348D0F757A53F)
	INIT_TH_FP_REG(%l7,%f28,0x9DFEF444170E60B3)
	INIT_TH_FP_REG(%l7,%f30,0xF10F0D16135D7CBD)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB64, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	edge8ln	%l5,	%o5,	%g4
	fmovsvs	%icc,	%f4,	%f21
	fnand	%f8,	%f24,	%f18
	sub	%g1,	%i1,	%o7
	udiv	%l2,	0x0F7F,	%i5
	fpsub16	%f0,	%f16,	%f2
	srlx	%i6,	0x19,	%g5
	fmovdcc	%icc,	%f27,	%f1
	addcc	%i0,	%l6,	%l4
	andncc	%l1,	%o2,	%g6
	fmovsvs	%icc,	%f12,	%f11
	fmovrdgez	%l3,	%f20,	%f20
	ld	[%l7 + 0x6C],	%f2
	st	%f10,	[%l7 + 0x60]
	edge8	%o1,	%g3,	%g7
	edge8n	%o0,	%i2,	%l0
	subc	%i7,	0x0758,	%i4
	move	%xcc,	%o4,	%o3
	fmovrse	%g2,	%f12,	%f15
	umul	%i3,	0x1864,	%o6
	fmovse	%xcc,	%f15,	%f6
	edge32ln	%l5,	%g4,	%g1
	array8	%o5,	%i1,	%o7
	sdiv	%i5,	0x0835,	%i6
	sdivx	%l2,	0x1E94,	%g5
	fone	%f26
	sdivcc	%l6,	0x03D8,	%l4
	save %l1, %o2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l3,	%o1,	%i0
	movvs	%icc,	%g7,	%o0
	movvs	%xcc,	%g3,	%i2
	udivcc	%i7,	0x0CC1,	%i4
	movpos	%xcc,	%l0,	%o4
	udivx	%o3,	0x0287,	%i3
	fornot1s	%f24,	%f31,	%f12
	addccc	%g2,	%l5,	%o6
	stw	%g4,	[%l7 + 0x3C]
	edge8n	%g1,	%i1,	%o5
	fnand	%f10,	%f28,	%f16
	fmovdcs	%xcc,	%f30,	%f11
	fmovrdgez	%o7,	%f18,	%f0
	fmul8x16au	%f6,	%f11,	%f26
	movle	%xcc,	%i5,	%i6
	fzeros	%f1
	andcc	%g5,	0x1E06,	%l2
	fmovsn	%icc,	%f22,	%f6
	srlx	%l6,	0x1A,	%l4
	subcc	%o2,	0x1932,	%g6
	ldsh	[%l7 + 0x76],	%l3
	array8	%o1,	%l1,	%i0
	edge8l	%g7,	%o0,	%i2
	edge32ln	%g3,	%i4,	%i7
	edge16l	%l0,	%o4,	%o3
	sllx	%g2,	%l5,	%i3
	edge16l	%o6,	%g4,	%g1
	or	%i1,	0x1CEA,	%o7
	ldsh	[%l7 + 0x18],	%i5
	and	%o5,	0x1100,	%i6
	mova	%xcc,	%g5,	%l6
	fmovrde	%l4,	%f2,	%f6
	sethi	0x1557,	%o2
	ldsw	[%l7 + 0x0C],	%l2
	sdiv	%l3,	0x0C41,	%g6
	fmovspos	%icc,	%f6,	%f9
	fcmps	%fcc3,	%f11,	%f1
	sll	%l1,	0x0F,	%i0
	fornot1	%f18,	%f6,	%f22
	stb	%o1,	[%l7 + 0x42]
	fmovsleu	%icc,	%f7,	%f23
	movle	%xcc,	%o0,	%g7
	fsrc2	%f8,	%f26
	movneg	%xcc,	%g3,	%i4
	mulscc	%i7,	0x08DF,	%l0
	edge16ln	%i2,	%o4,	%g2
	edge32l	%l5,	%i3,	%o6
	fnegs	%f4,	%f16
	fmovdpos	%xcc,	%f26,	%f3
	fxors	%f3,	%f25,	%f23
	move	%icc,	%g4,	%o3
	fmovrdgz	%g1,	%f26,	%f30
	fmovdg	%icc,	%f28,	%f14
	sth	%o7,	[%l7 + 0x3A]
	xorcc	%i1,	%o5,	%i5
	sdivcc	%g5,	0x1856,	%i6
	movvc	%xcc,	%l4,	%o2
	fsrc1	%f20,	%f28
	movl	%xcc,	%l2,	%l3
	array8	%l6,	%g6,	%l1
	ldub	[%l7 + 0x6A],	%o1
	ldsh	[%l7 + 0x74],	%i0
	edge8ln	%o0,	%g3,	%g7
	lduh	[%l7 + 0x7A],	%i4
	xor	%i7,	0x15F0,	%i2
	addccc	%l0,	%g2,	%o4
	movcc	%xcc,	%l5,	%o6
	edge32l	%i3,	%g4,	%o3
	fpack32	%f20,	%f16,	%f24
	andncc	%g1,	%o7,	%i1
	sllx	%o5,	%g5,	%i5
	alignaddr	%l4,	%i6,	%o2
	addcc	%l3,	0x10E7,	%l2
	sdivx	%l6,	0x10E4,	%l1
	array16	%o1,	%g6,	%o0
	movg	%xcc,	%i0,	%g3
	movneg	%xcc,	%g7,	%i4
	umul	%i2,	%l0,	%i7
	movg	%icc,	%g2,	%o4
	sdivx	%o6,	0x05D4,	%l5
	movre	%g4,	%o3,	%i3
	addc	%g1,	0x093F,	%i1
	ldx	[%l7 + 0x78],	%o7
	andcc	%o5,	%g5,	%l4
	movcc	%xcc,	%i6,	%i5
	movneg	%icc,	%o2,	%l2
	fmovrdne	%l3,	%f30,	%f24
	sir	0x1092
	sir	0x0092
	array32	%l6,	%l1,	%o1
	udivcc	%g6,	0x1DAC,	%o0
	movrgz	%g3,	%i0,	%i4
	addcc	%g7,	%l0,	%i7
	udivx	%g2,	0x1FAE,	%i2
	ldd	[%l7 + 0x20],	%o6
	fmovdvs	%icc,	%f10,	%f1
	fmovsl	%xcc,	%f27,	%f24
	fcmpne16	%f20,	%f2,	%l5
	sdivx	%g4,	0x08A9,	%o4
	fcmpes	%fcc0,	%f11,	%f15
	movcs	%icc,	%i3,	%g1
	and	%o3,	%i1,	%o7
	fsrc1s	%f3,	%f10
	array32	%g5,	%l4,	%o5
	movvs	%icc,	%i6,	%i5
	sdivx	%o2,	0x04D5,	%l2
	movcs	%xcc,	%l6,	%l3
	fmovdge	%icc,	%f14,	%f13
	xorcc	%l1,	%g6,	%o1
	and	%o0,	0x1F10,	%g3
	fornot1s	%f26,	%f8,	%f25
	ldsb	[%l7 + 0x69],	%i4
	fmovdne	%icc,	%f10,	%f23
	smulcc	%g7,	0x0717,	%i0
	fmovdge	%xcc,	%f0,	%f11
	sdiv	%i7,	0x187C,	%l0
	sdivx	%i2,	0x1A91,	%g2
	mulx	%l5,	0x1A85,	%g4
	fmovdcc	%icc,	%f28,	%f22
	and	%o6,	0x07F8,	%i3
	faligndata	%f28,	%f16,	%f6
	fmuld8sux16	%f7,	%f18,	%f8
	movrlz	%g1,	%o4,	%o3
	subc	%i1,	%o7,	%l4
	restore %o5, 0x1EEF, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x08],	%g4
	srax	%o2,	0x12,	%l2
	movrlz	%l6,	%l3,	%i5
	or	%g6,	0x0EC2,	%l1
	sll	%o1,	0x1B,	%o0
	movre	%i4,	0x30F,	%g7
	sll	%g3,	%i0,	%l0
	sdivx	%i2,	0x1B4B,	%g2
	edge16ln	%i7,	%g4,	%l5
	udiv	%i3,	0x04E7,	%o6
	lduh	[%l7 + 0x22],	%o4
	andcc	%o3,	0x0F58,	%i1
	nop
	set	0x6C, %i5
	ldsw	[%l7 + %i5],	%g1
	alignaddrl	%l4,	%o5,	%i6
	ldub	[%l7 + 0x23],	%o7
	lduw	[%l7 + 0x54],	%o2
	umul	%g5,	%l6,	%l3
	save %l2, 0x0CDD, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f6,	%f28
	fmovspos	%icc,	%f25,	%f24
	move	%icc,	%i5,	%l1
	edge16	%o0,	%o1,	%g7
	fnegd	%f14,	%f0
	udiv	%i4,	0x1956,	%g3
	movrlez	%i0,	0x185,	%i2
	movleu	%icc,	%g2,	%l0
	edge32l	%g4,	%l5,	%i3
	movn	%icc,	%i7,	%o6
	xnorcc	%o3,	0x1433,	%i1
	add	%g1,	%l4,	%o4
	ldsh	[%l7 + 0x22],	%o5
	mulscc	%o7,	0x1DDC,	%o2
	and	%g5,	%i6,	%l3
	stb	%l2,	[%l7 + 0x35]
	movn	%icc,	%g6,	%i5
	movn	%icc,	%l1,	%o0
	fsrc1	%f20,	%f2
	sir	0x0E7A
	alignaddr	%o1,	%g7,	%l6
	edge32ln	%g3,	%i0,	%i2
	edge32n	%g2,	%l0,	%g4
	sethi	0x0F06,	%i4
	sdiv	%l5,	0x09EB,	%i7
	move	%xcc,	%o6,	%o3
	xor	%i3,	0x1F8D,	%i1
	addcc	%l4,	0x039E,	%o4
	sth	%o5,	[%l7 + 0x46]
	and	%o7,	%g1,	%o2
	fmovsneg	%icc,	%f2,	%f4
	alignaddrl	%g5,	%l3,	%i6
	movrne	%l2,	%g6,	%i5
	fmovsle	%icc,	%f0,	%f4
	movgu	%icc,	%l1,	%o1
	movrgez	%o0,	%g7,	%l6
	sdivcc	%i0,	0x0485,	%g3
	addccc	%i2,	0x100F,	%g2
	and	%l0,	0x09CB,	%i4
	nop
	set	0x28, %i6
	stw	%l5,	[%l7 + %i6]
	ldsb	[%l7 + 0x14],	%i7
	movvs	%xcc,	%g4,	%o6
	movn	%icc,	%i3,	%i1
	movrgz	%o3,	0x3DE,	%l4
	mulscc	%o4,	%o7,	%o5
	fandnot1s	%f7,	%f28,	%f23
	fpadd16s	%f20,	%f26,	%f19
	sdiv	%o2,	0x1811,	%g1
	subccc	%l3,	0x0698,	%i6
	stb	%g5,	[%l7 + 0x72]
	movgu	%xcc,	%l2,	%g6
	lduw	[%l7 + 0x7C],	%i5
	movl	%icc,	%o1,	%l1
	fpsub16s	%f29,	%f13,	%f31
	edge8ln	%o0,	%g7,	%l6
	mulscc	%g3,	%i0,	%g2
	fnot1s	%f26,	%f20
	edge32n	%l0,	%i2,	%i4
	srax	%i7,	0x06,	%g4
	movgu	%icc,	%l5,	%o6
	movg	%xcc,	%i3,	%i1
	popc	%o3,	%o4
	srax	%l4,	%o5,	%o2
	ldd	[%l7 + 0x08],	%f2
	edge8n	%g1,	%o7,	%l3
	ldd	[%l7 + 0x28],	%f4
	fnegd	%f30,	%f20
	orncc	%g5,	%i6,	%l2
	edge32l	%g6,	%o1,	%l1
	addccc	%i5,	%o0,	%l6
	movcc	%xcc,	%g3,	%g7
	edge16	%g2,	%l0,	%i0
	edge16l	%i4,	%i7,	%g4
	fmovsneg	%icc,	%f22,	%f0
	addcc	%i2,	%l5,	%o6
	movcc	%icc,	%i3,	%i1
	fcmpes	%fcc3,	%f0,	%f25
	movge	%xcc,	%o3,	%l4
	or	%o4,	0x17CC,	%o5
	srax	%g1,	%o2,	%l3
	edge8ln	%g5,	%o7,	%l2
	fpackfix	%f26,	%f1
	or	%i6,	0x08D4,	%g6
	movgu	%xcc,	%o1,	%i5
	movn	%xcc,	%l1,	%o0
	ld	[%l7 + 0x70],	%f23
	alignaddr	%g3,	%g7,	%l6
	udiv	%g2,	0x060B,	%l0
	fpsub16	%f22,	%f22,	%f2
	edge8ln	%i0,	%i4,	%i7
	subcc	%i2,	%l5,	%g4
	srl	%i3,	0x12,	%o6
	fmovsa	%icc,	%f10,	%f0
	fnegd	%f4,	%f8
	ldd	[%l7 + 0x70],	%f4
	ldsb	[%l7 + 0x43],	%i1
	edge32	%l4,	%o4,	%o3
	ldsb	[%l7 + 0x5A],	%o5
	and	%g1,	0x13D4,	%o2
	edge16l	%g5,	%l3,	%o7
	addc	%l2,	0x1C88,	%i6
	sllx	%o1,	%g6,	%l1
	movpos	%icc,	%i5,	%g3
	edge16l	%g7,	%o0,	%g2
	umulcc	%l6,	0x003D,	%i0
	fmovrdlez	%i4,	%f4,	%f24
	fnot2s	%f3,	%f19
	fpack32	%f16,	%f20,	%f18
	ldsw	[%l7 + 0x24],	%l0
	fmovdg	%xcc,	%f17,	%f28
	fxor	%f2,	%f6,	%f30
	lduh	[%l7 + 0x7C],	%i7
	alignaddr	%i2,	%g4,	%l5
	andncc	%i3,	%o6,	%l4
	orn	%i1,	0x044B,	%o4
	lduw	[%l7 + 0x54],	%o3
	andncc	%o5,	%g1,	%o2
	edge16ln	%l3,	%g5,	%l2
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	sdivx	%g6,	0x1253,	%l1
	save %g3, 0x0DB2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g7,	%o0,	%l6
	ldx	[%l7 + 0x40],	%i0
	movn	%xcc,	%g2,	%l0
	fmovscc	%xcc,	%f4,	%f15
	movneg	%xcc,	%i7,	%i2
	fand	%f28,	%f22,	%f20
	movrne	%g4,	%i4,	%l5
	subccc	%o6,	0x1079,	%i3
	ldd	[%l7 + 0x68],	%f24
	sll	%i1,	0x18,	%o4
	mulscc	%o3,	0x0C39,	%o5
	and	%g1,	%o2,	%l3
	fmovrse	%g5,	%f14,	%f3
	stb	%l2,	[%l7 + 0x58]
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%f12
	or	%i6,	0x0772,	%o1
	movneg	%xcc,	%o7,	%g6
	restore %l4, %g3, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%g7,	%l1
	srax	%l6,	%i0,	%o0
	fmovscs	%xcc,	%f8,	%f21
	xnor	%l0,	%g2,	%i2
	and	%g4,	%i4,	%i7
	fcmpd	%fcc3,	%f2,	%f8
	fexpand	%f16,	%f6
	fmovsle	%icc,	%f5,	%f29
	ldsb	[%l7 + 0x78],	%l5
	srl	%i3,	0x06,	%o6
	smulcc	%o4,	0x0B29,	%o3
	movg	%icc,	%i1,	%o5
	fmovrdgez	%o2,	%f8,	%f18
	udivcc	%l3,	0x1E27,	%g1
	ldd	[%l7 + 0x18],	%g4
	fmovsg	%icc,	%f2,	%f4
	ldx	[%l7 + 0x48],	%i6
	fpsub16s	%f29,	%f16,	%f5
	or	%o1,	0x0D9B,	%l2
	sethi	0x13E8,	%o7
	umulcc	%l4,	0x0329,	%g6
	sdivx	%g3,	0x0316,	%g7
	fpadd32s	%f8,	%f24,	%f6
	fand	%f4,	%f4,	%f24
	stx	%l1,	[%l7 + 0x30]
	std	%f14,	[%l7 + 0x40]
	fmovdne	%icc,	%f17,	%f5
	subc	%i5,	0x0582,	%l6
	movre	%i0,	%o0,	%l0
	and	%i2,	0x18EA,	%g4
	nop
	set	0x12, %g4
	ldsb	[%l7 + %g4],	%i4
	movrlez	%g2,	0x1BC,	%l5
	fpadd16	%f24,	%f20,	%f10
	lduw	[%l7 + 0x64],	%i3
	movn	%icc,	%o6,	%i7
	edge32ln	%o3,	%o4,	%o5
	andncc	%i1,	%l3,	%g1
	sdiv	%o2,	0x1148,	%g5
	subccc	%o1,	0x1311,	%i6
	edge8	%o7,	%l2,	%g6
	sth	%g3,	[%l7 + 0x2E]
	ldsw	[%l7 + 0x38],	%g7
	ldd	[%l7 + 0x38],	%f20
	fnot2	%f26,	%f0
	movpos	%xcc,	%l4,	%i5
	movrgz	%l1,	%i0,	%l6
	ldsh	[%l7 + 0x6C],	%l0
	xorcc	%i2,	0x1438,	%o0
	subcc	%g4,	%g2,	%i4
	std	%f14,	[%l7 + 0x70]
	movvc	%icc,	%i3,	%l5
	fmovscc	%xcc,	%f16,	%f5
	lduw	[%l7 + 0x54],	%o6
	srlx	%o3,	%o4,	%i7
	fmuld8ulx16	%f6,	%f13,	%f12
	movl	%xcc,	%i1,	%l3
	andncc	%o5,	%g1,	%o2
	srl	%o1,	0x0B,	%i6
	fmovrde	%g5,	%f14,	%f12
	subcc	%l2,	0x1C07,	%g6
	srax	%g3,	0x0D,	%o7
	fmovdl	%icc,	%f29,	%f13
	sdiv	%l4,	0x05A5,	%g7
	movrgz	%i5,	0x1F5,	%i0
	mulx	%l6,	%l1,	%i2
	lduw	[%l7 + 0x74],	%l0
	save %o0, %g2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x4A],	%i3
	movrne	%l5,	%i4,	%o6
	sllx	%o3,	0x00,	%o4
	fmul8sux16	%f10,	%f2,	%f2
	smulcc	%i1,	%i7,	%l3
	ld	[%l7 + 0x2C],	%f19
	fmovsge	%xcc,	%f23,	%f8
	fmovrslz	%g1,	%f15,	%f14
	faligndata	%f10,	%f20,	%f6
	movge	%xcc,	%o2,	%o5
	edge16	%i6,	%g5,	%o1
	edge16l	%l2,	%g3,	%g6
	edge8	%o7,	%l4,	%g7
	fpack32	%f12,	%f6,	%f10
	addc	%i5,	%l6,	%l1
	addccc	%i0,	%l0,	%i2
	alignaddr	%g2,	%g4,	%o0
	ldd	[%l7 + 0x10],	%l4
	movge	%xcc,	%i3,	%i4
	umul	%o3,	%o4,	%o6
	fxors	%f28,	%f20,	%f2
	fmovda	%icc,	%f31,	%f7
	sra	%i1,	%l3,	%i7
	alignaddr	%o2,	%o5,	%i6
	popc	0x0490,	%g5
	movrgz	%o1,	0x178,	%g1
	smulcc	%l2,	0x07F9,	%g6
	movge	%xcc,	%o7,	%l4
	movvs	%xcc,	%g3,	%g7
	edge8l	%i5,	%l6,	%l1
	movcs	%icc,	%i0,	%l0
	std	%f22,	[%l7 + 0x10]
	umulcc	%g2,	%g4,	%o0
	fmovse	%xcc,	%f21,	%f21
	ldd	[%l7 + 0x10],	%i2
	fmovrsgz	%i3,	%f20,	%f3
	fands	%f29,	%f22,	%f1
	fandnot2	%f0,	%f20,	%f0
	sub	%i4,	%o3,	%o4
	edge8n	%l5,	%o6,	%l3
	sdivx	%i7,	0x1FCF,	%o2
	ldsw	[%l7 + 0x58],	%i1
	ld	[%l7 + 0x34],	%f18
	ldd	[%l7 + 0x18],	%i6
	xnor	%o5,	%o1,	%g1
	save %l2, %g6, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%l4,	%f26,	%f17
	ldsh	[%l7 + 0x78],	%g5
	movg	%icc,	%g7,	%i5
	edge32ln	%g3,	%l1,	%i0
	fnegd	%f10,	%f30
	movvs	%icc,	%l0,	%l6
	movre	%g2,	0x0A2,	%o0
	and	%i2,	0x0B4D,	%g4
	orncc	%i4,	0x058D,	%o3
	ld	[%l7 + 0x48],	%f15
	fmul8ulx16	%f10,	%f10,	%f22
	edge8n	%i3,	%o4,	%o6
	array16	%l3,	%l5,	%o2
	fmovdg	%icc,	%f23,	%f3
	umul	%i7,	%i1,	%o5
	fsrc1s	%f19,	%f0
	srax	%o1,	%g1,	%l2
	fpack16	%f24,	%f28
	ldx	[%l7 + 0x68],	%i6
	fmovse	%xcc,	%f18,	%f2
	movne	%icc,	%g6,	%l4
	fmovspos	%xcc,	%f31,	%f12
	popc	0x18D0,	%g5
	edge8	%g7,	%o7,	%g3
	fors	%f2,	%f31,	%f5
	ldsb	[%l7 + 0x63],	%l1
	sir	0x12DC
	nop
	set	0x68, %o4
	std	%f26,	[%l7 + %o4]
	udivcc	%i0,	0x0939,	%l0
	sllx	%i5,	%l6,	%g2
	fmovdleu	%icc,	%f30,	%f12
	fcmpgt16	%f14,	%f28,	%i2
	movleu	%icc,	%g4,	%o0
	edge32	%i4,	%i3,	%o4
	and	%o3,	0x0ABC,	%o6
	sra	%l3,	0x09,	%o2
	edge32ln	%l5,	%i7,	%i1
	ldub	[%l7 + 0x30],	%o5
	edge32l	%g1,	%o1,	%l2
	sll	%i6,	0x10,	%g6
	movcs	%icc,	%g5,	%g7
	fandnot1s	%f30,	%f7,	%f10
	subcc	%l4,	0x1DBC,	%o7
	edge16	%g3,	%l1,	%i0
	ldd	[%l7 + 0x68],	%l0
	addccc	%i5,	0x085D,	%g2
	edge16l	%l6,	%g4,	%i2
	movvs	%xcc,	%o0,	%i3
	movle	%icc,	%i4,	%o3
	movneg	%xcc,	%o6,	%o4
	mova	%icc,	%l3,	%o2
	movrlz	%i7,	0x065,	%i1
	move	%icc,	%o5,	%g1
	srlx	%l5,	%l2,	%i6
	movle	%icc,	%o1,	%g6
	sdiv	%g7,	0x1953,	%g5
	fand	%f28,	%f30,	%f4
	edge8n	%o7,	%l4,	%g3
	stb	%i0,	[%l7 + 0x7E]
	edge8ln	%l1,	%l0,	%i5
	udivx	%g2,	0x15B9,	%g4
	fmovrsne	%l6,	%f10,	%f14
	ldub	[%l7 + 0x13],	%i2
	alignaddrl	%i3,	%o0,	%i4
	edge32l	%o3,	%o6,	%o4
	movrne	%o2,	0x21D,	%i7
	ldub	[%l7 + 0x0C],	%l3
	stx	%o5,	[%l7 + 0x68]
	fmovrse	%g1,	%f19,	%f18
	movrne	%i1,	0x001,	%l5
	movg	%xcc,	%l2,	%i6
	lduh	[%l7 + 0x32],	%g6
	fmul8x16au	%f20,	%f6,	%f14
	or	%g7,	%g5,	%o7
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	umulcc	%l1,	%i0,	%l0
	movrgez	%g2,	%i5,	%g4
	edge8l	%l6,	%i2,	%o0
	movle	%icc,	%i4,	%o3
	nop
	set	0x18, %o5
	ldsw	[%l7 + %o5],	%o6
	fmovdvc	%xcc,	%f10,	%f12
	movcs	%xcc,	%i3,	%o2
	move	%xcc,	%i7,	%l3
	smulcc	%o4,	%g1,	%i1
	pdist	%f6,	%f12,	%f0
	movn	%icc,	%l5,	%o5
	subcc	%l2,	%g6,	%i6
	movleu	%xcc,	%g7,	%o7
	ldsb	[%l7 + 0x24],	%o1
	xor	%g5,	0x0460,	%g3
	xorcc	%l4,	%l1,	%l0
	mulscc	%g2,	0x1DCB,	%i0
	movg	%xcc,	%g4,	%i5
	ldsh	[%l7 + 0x66],	%l6
	and	%o0,	0x16EF,	%i2
	edge16n	%i4,	%o3,	%i3
	sllx	%o2,	%o6,	%i7
	sll	%o4,	0x0E,	%l3
	fpadd32	%f30,	%f30,	%f18
	edge8n	%g1,	%i1,	%l5
	movvc	%xcc,	%l2,	%o5
	ldsb	[%l7 + 0x41],	%g6
	fpsub16	%f10,	%f12,	%f12
	udivx	%i6,	0x0587,	%o7
	fmovscc	%xcc,	%f25,	%f14
	edge8l	%g7,	%o1,	%g5
	st	%f8,	[%l7 + 0x38]
	sll	%g3,	0x00,	%l1
	alignaddr	%l0,	%l4,	%i0
	fandnot2s	%f4,	%f14,	%f6
	andcc	%g4,	0x0577,	%i5
	movrlz	%g2,	%l6,	%i2
	ldd	[%l7 + 0x58],	%f2
	edge8	%o0,	%i4,	%i3
	movrgz	%o2,	%o3,	%o6
	and	%i7,	%o4,	%l3
	edge8n	%g1,	%i1,	%l2
	sdiv	%l5,	0x113A,	%o5
	fmovde	%icc,	%f26,	%f1
	ldsb	[%l7 + 0x63],	%g6
	movle	%icc,	%i6,	%o7
	sdiv	%g7,	0x137A,	%g5
	fcmpgt16	%f16,	%f10,	%g3
	array8	%o1,	%l0,	%l1
	fmovda	%xcc,	%f31,	%f9
	ldsh	[%l7 + 0x72],	%i0
	movcc	%icc,	%l4,	%i5
	udivcc	%g4,	0x0E42,	%l6
	save %i2, %g2, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i4,	%i3,	%o3
	addccc	%o6,	%i7,	%o4
	fornot1s	%f23,	%f12,	%f12
	fpack32	%f0,	%f22,	%f24
	fmuld8ulx16	%f9,	%f0,	%f14
	movvc	%xcc,	%l3,	%o2
	stb	%i1,	[%l7 + 0x6A]
	fmovde	%icc,	%f24,	%f21
	fnegd	%f30,	%f28
	sdivcc	%l2,	0x1F56,	%l5
	movl	%icc,	%o5,	%g6
	nop
	set	0x38, %i2
	lduw	[%l7 + %i2],	%g1
	edge16ln	%o7,	%i6,	%g7
	mova	%icc,	%g5,	%g3
	ldsh	[%l7 + 0x7A],	%l0
	movge	%xcc,	%o1,	%i0
	ld	[%l7 + 0x4C],	%f11
	umulcc	%l1,	%i5,	%g4
	fpsub16s	%f3,	%f0,	%f7
	edge32n	%l4,	%l6,	%i2
	fornot1	%f18,	%f6,	%f16
	subcc	%g2,	%i4,	%o0
	fcmpeq16	%f0,	%f10,	%o3
	movle	%xcc,	%o6,	%i3
	sethi	0x0940,	%i7
	ldd	[%l7 + 0x70],	%l2
	movvs	%icc,	%o2,	%i1
	fandnot2s	%f13,	%f20,	%f19
	edge32ln	%o4,	%l5,	%o5
	fmul8x16	%f11,	%f30,	%f20
	fmovsleu	%xcc,	%f20,	%f15
	fexpand	%f18,	%f14
	subcc	%g6,	0x0B7C,	%g1
	fmovda	%icc,	%f6,	%f21
	array32	%o7,	%i6,	%l2
	fornot1s	%f13,	%f30,	%f27
	array32	%g5,	%g3,	%g7
	fmovsl	%icc,	%f4,	%f29
	save %l0, %o1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i5,	%g4,	%i0
	edge16n	%l6,	%i2,	%g2
	movg	%icc,	%l4,	%i4
	movle	%icc,	%o3,	%o0
	movn	%xcc,	%o6,	%i7
	fpsub16	%f18,	%f10,	%f16
	sllx	%i3,	0x06,	%l3
	sethi	0x14D9,	%i1
	edge8l	%o4,	%l5,	%o2
	st	%f10,	[%l7 + 0x7C]
	edge16	%g6,	%g1,	%o5
	movrgez	%i6,	0x132,	%l2
	sdivx	%o7,	0x00ED,	%g5
	andcc	%g3,	%g7,	%l0
	addccc	%o1,	0x1AE3,	%l1
	nop
	set	0x44, %g2
	ldsw	[%l7 + %g2],	%g4
	sth	%i0,	[%l7 + 0x3A]
	ld	[%l7 + 0x64],	%f23
	movneg	%icc,	%i5,	%i2
	andcc	%g2,	0x19ED,	%l4
	restore %l6, %o3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o6,	%o0,	%i7
	sll	%i3,	%i1,	%l3
	fzeros	%f25
	edge32l	%o4,	%o2,	%l5
	xor	%g1,	%g6,	%o5
	and	%l2,	%o7,	%i6
	stw	%g5,	[%l7 + 0x50]
	srlx	%g7,	0x0F,	%l0
	fandnot2	%f4,	%f6,	%f20
	movn	%xcc,	%o1,	%l1
	edge8l	%g3,	%i0,	%g4
	ldsw	[%l7 + 0x24],	%i5
	ldsh	[%l7 + 0x30],	%i2
	edge16	%g2,	%l6,	%o3
	fmovdge	%icc,	%f1,	%f19
	fmovrse	%l4,	%f5,	%f29
	movcs	%xcc,	%i4,	%o0
	orcc	%o6,	%i7,	%i3
	fxnors	%f1,	%f29,	%f15
	std	%f18,	[%l7 + 0x38]
	addc	%i1,	%l3,	%o2
	siam	0x6
	xnorcc	%o4,	%g1,	%g6
	movrgez	%o5,	0x1DF,	%l2
	andcc	%o7,	%l5,	%i6
	movge	%xcc,	%g7,	%l0
	sdiv	%g5,	0x1208,	%l1
	movvc	%xcc,	%g3,	%o1
	andncc	%g4,	%i0,	%i5
	movvc	%xcc,	%g2,	%i2
	srax	%o3,	0x15,	%l6
	array8	%i4,	%l4,	%o0
	edge16n	%o6,	%i3,	%i7
	move	%icc,	%i1,	%l3
	fmovsge	%xcc,	%f24,	%f9
	orncc	%o2,	0x0515,	%o4
	movcs	%icc,	%g1,	%o5
	edge16ln	%l2,	%g6,	%o7
	edge8l	%l5,	%i6,	%l0
	movre	%g7,	%l1,	%g5
	movge	%xcc,	%g3,	%o1
	fcmps	%fcc0,	%f19,	%f6
	movvs	%icc,	%i0,	%g4
	orcc	%g2,	%i5,	%i2
	fnot1	%f6,	%f4
	sllx	%o3,	0x13,	%l6
	fcmple16	%f26,	%f6,	%l4
	movle	%icc,	%i4,	%o0
	mova	%icc,	%i3,	%i7
	movle	%icc,	%i1,	%l3
	fcmps	%fcc2,	%f21,	%f5
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	st	%f10,	[%l7 + 0x28]
	edge8l	%o5,	%l2,	%g6
	fcmpeq16	%f22,	%f8,	%g1
	movvs	%icc,	%l5,	%i6
	fpadd32	%f14,	%f20,	%f4
	umulcc	%l0,	0x1FDA,	%g7
	xorcc	%l1,	%o7,	%g3
	stw	%g5,	[%l7 + 0x70]
	fpadd32	%f18,	%f28,	%f28
	ldx	[%l7 + 0x40],	%o1
	movrne	%g4,	0x3EE,	%g2
	addccc	%i5,	0x100E,	%i2
	smul	%i0,	%l6,	%o3
	movcs	%icc,	%l4,	%i4
	fmul8x16au	%f26,	%f14,	%f14
	ldub	[%l7 + 0x3D],	%o0
	edge16	%i7,	%i3,	%i1
	edge32	%o2,	%l3,	%o6
	move	%xcc,	%o5,	%o4
	fxors	%f4,	%f11,	%f12
	fand	%f30,	%f0,	%f0
	alignaddr	%g6,	%g1,	%l2
	edge8ln	%l5,	%l0,	%g7
	edge8	%l1,	%o7,	%g3
	fmovdvs	%icc,	%f15,	%f16
	edge8l	%g5,	%o1,	%g4
	ld	[%l7 + 0x10],	%f4
	fexpand	%f29,	%f14
	edge16l	%g2,	%i5,	%i6
	sub	%i0,	0x0DCB,	%l6
	movcc	%icc,	%o3,	%i2
	sethi	0x0DD6,	%l4
	fmovdne	%xcc,	%f30,	%f31
	movrgz	%i4,	%o0,	%i3
	movpos	%icc,	%i7,	%i1
	alignaddrl	%o2,	%o6,	%l3
	fabss	%f2,	%f8
	ld	[%l7 + 0x6C],	%f14
	ldx	[%l7 + 0x40],	%o5
	sdivcc	%o4,	0x0354,	%g1
	fmovrde	%g6,	%f20,	%f12
	ldsb	[%l7 + 0x48],	%l5
	addc	%l0,	%g7,	%l1
	movrlz	%l2,	0x3FE,	%o7
	movg	%icc,	%g5,	%o1
	addcc	%g3,	%g2,	%g4
	std	%f22,	[%l7 + 0x08]
	and	%i5,	%i0,	%i6
	sllx	%o3,	0x1D,	%i2
	fmovde	%xcc,	%f0,	%f16
	andcc	%l4,	%i4,	%o0
	lduw	[%l7 + 0x10],	%i3
	umul	%i7,	0x07CC,	%i1
	edge32	%o2,	%l6,	%o6
	ldd	[%l7 + 0x48],	%f18
	srlx	%o5,	%o4,	%l3
	edge32	%g6,	%g1,	%l0
	movre	%l5,	%l1,	%g7
	subc	%l2,	%g5,	%o7
	xor	%o1,	0x1FEB,	%g2
	edge32	%g3,	%g4,	%i5
	fcmple16	%f16,	%f24,	%i6
	addccc	%o3,	%i2,	%i0
	fmovsa	%xcc,	%f24,	%f7
	move	%xcc,	%l4,	%o0
	nop
	set	0x1E, %o0
	lduh	[%l7 + %o0],	%i3
	fnands	%f8,	%f9,	%f8
	movrne	%i7,	%i1,	%i4
	addc	%o2,	0x079D,	%l6
	orn	%o5,	0x0E52,	%o4
	subcc	%o6,	%l3,	%g1
	sllx	%g6,	%l5,	%l0
	movneg	%xcc,	%g7,	%l1
	ld	[%l7 + 0x1C],	%f10
	sth	%l2,	[%l7 + 0x62]
	or	%o7,	%g5,	%o1
	array16	%g3,	%g4,	%g2
	movrlez	%i6,	0x1CE,	%o3
	srax	%i2,	%i5,	%l4
	edge8n	%o0,	%i3,	%i7
	movrgez	%i1,	0x1F2,	%i0
	sth	%i4,	[%l7 + 0x0C]
	fmovrse	%l6,	%f24,	%f24
	fmovdvs	%xcc,	%f20,	%f24
	smulcc	%o5,	%o2,	%o6
	movgu	%xcc,	%o4,	%l3
	fmuld8ulx16	%f23,	%f27,	%f16
	ldsh	[%l7 + 0x3C],	%g1
	xnorcc	%l5,	%g6,	%l0
	movrgz	%g7,	0x0B9,	%l1
	lduw	[%l7 + 0x2C],	%o7
	orncc	%l2,	%g5,	%g3
	ldd	[%l7 + 0x50],	%g4
	fxor	%f24,	%f28,	%f20
	fnand	%f14,	%f2,	%f20
	addccc	%o1,	%i6,	%g2
	edge32	%o3,	%i2,	%l4
	fmovdne	%icc,	%f7,	%f2
	fmovdle	%xcc,	%f23,	%f21
	edge32	%o0,	%i3,	%i7
	udiv	%i1,	0x131D,	%i5
	fnor	%f16,	%f12,	%f12
	movrlez	%i0,	0x2EC,	%l6
	movcc	%icc,	%o5,	%o2
	movle	%xcc,	%o6,	%i4
	fxor	%f26,	%f10,	%f28
	array16	%l3,	%g1,	%o4
	edge16n	%g6,	%l5,	%l0
	fpmerge	%f5,	%f20,	%f12
	fmovdcc	%xcc,	%f11,	%f30
	movne	%icc,	%g7,	%o7
	subcc	%l2,	%g5,	%l1
	or	%g3,	%g4,	%o1
	udivcc	%i6,	0x02D4,	%o3
	movvc	%xcc,	%g2,	%l4
	udivx	%i2,	0x074B,	%i3
	sdiv	%o0,	0x0C1E,	%i1
	xnorcc	%i5,	%i7,	%l6
	andcc	%o5,	0x1DC6,	%i0
	orn	%o2,	0x0410,	%i4
	and	%l3,	%o6,	%o4
	udivcc	%g6,	0x15F3,	%g1
	sir	0x0E34
	fmovsle	%xcc,	%f11,	%f17
	xnor	%l5,	%l0,	%g7
	fmovsneg	%xcc,	%f31,	%f9
	ldsb	[%l7 + 0x74],	%o7
	array8	%g5,	%l2,	%g3
	movre	%g4,	0x26B,	%o1
	fmuld8sux16	%f27,	%f29,	%f6
	fmovd	%f26,	%f30
	sethi	0x0F34,	%i6
	fnot2	%f20,	%f2
	smul	%l1,	0x1CE9,	%g2
	ldd	[%l7 + 0x20],	%f0
	fcmpgt32	%f26,	%f0,	%l4
	ldsh	[%l7 + 0x48],	%i2
	movn	%xcc,	%i3,	%o0
	sra	%i1,	0x0C,	%o3
	fors	%f0,	%f23,	%f29
	smul	%i7,	%i5,	%o5
	st	%f5,	[%l7 + 0x20]
	subcc	%l6,	%o2,	%i4
	siam	0x7
	andn	%l3,	%o6,	%o4
	xorcc	%i0,	0x09A3,	%g6
	fones	%f21
	movre	%g1,	%l5,	%l0
	sdivx	%g7,	0x17CE,	%o7
	edge16	%g5,	%g3,	%g4
	fnot2s	%f2,	%f23
	edge16	%l2,	%o1,	%l1
	lduw	[%l7 + 0x60],	%i6
	edge32ln	%l4,	%g2,	%i2
	subcc	%o0,	%i3,	%i1
	xorcc	%o3,	0x0B72,	%i7
	ld	[%l7 + 0x78],	%f0
	movle	%xcc,	%i5,	%l6
	srl	%o5,	0x1F,	%o2
	movneg	%icc,	%i4,	%o6
	fnot2	%f22,	%f12
	andcc	%o4,	0x16F6,	%l3
	fmovsg	%xcc,	%f5,	%f27
	xor	%i0,	0x1B91,	%g1
	fmovrsgz	%g6,	%f5,	%f4
	sdivcc	%l0,	0x0D8A,	%g7
	add	%o7,	0x131D,	%l5
	ldsh	[%l7 + 0x30],	%g5
	edge8	%g3,	%g4,	%o1
	ldsh	[%l7 + 0x26],	%l2
	fmovrdgez	%l1,	%f14,	%f30
	edge16n	%l4,	%g2,	%i2
	sethi	0x07D2,	%i6
	movneg	%xcc,	%i3,	%i1
	fandnot2	%f28,	%f18,	%f2
	ldd	[%l7 + 0x78],	%o0
	xnor	%o3,	0x1AF6,	%i5
	subccc	%l6,	%i7,	%o5
	ldsw	[%l7 + 0x7C],	%i4
	or	%o6,	0x11F1,	%o2
	ldd	[%l7 + 0x58],	%f18
	fmovd	%f26,	%f4
	fxnor	%f0,	%f0,	%f22
	ldx	[%l7 + 0x30],	%o4
	xnorcc	%i0,	%g1,	%g6
	subcc	%l0,	0x1351,	%l3
	fornot1s	%f2,	%f28,	%f23
	fmuld8sux16	%f12,	%f24,	%f28
	fzero	%f8
	popc	%g7,	%o7
	fcmps	%fcc2,	%f18,	%f22
	movle	%xcc,	%g5,	%l5
	edge32	%g4,	%g3,	%o1
	mova	%xcc,	%l1,	%l2
	movge	%xcc,	%g2,	%i2
	andn	%l4,	0x099A,	%i3
	movne	%icc,	%i1,	%i6
	ld	[%l7 + 0x38],	%f10
	move	%xcc,	%o3,	%i5
	array16	%o0,	%l6,	%i7
	movrgz	%o5,	0x19D,	%o6
	add	%o2,	0x1D69,	%i4
	ld	[%l7 + 0x28],	%f28
	movg	%xcc,	%i0,	%o4
	umulcc	%g1,	%l0,	%g6
	sdivx	%g7,	0x0889,	%l3
	edge32l	%g5,	%o7,	%g4
	st	%f11,	[%l7 + 0x20]
	ldsb	[%l7 + 0x12],	%g3
	fmovdge	%icc,	%f14,	%f22
	movrgez	%l5,	%o1,	%l2
	smul	%g2,	%l1,	%l4
	alignaddr	%i2,	%i3,	%i1
	movleu	%xcc,	%i6,	%o3
	xorcc	%o0,	%i5,	%i7
	sra	%l6,	0x12,	%o6
	andcc	%o5,	%i4,	%i0
	srlx	%o4,	%o2,	%l0
	addcc	%g1,	%g7,	%l3
	movn	%xcc,	%g5,	%g6
	movrgez	%g4,	%g3,	%o7
	umul	%l5,	0x1095,	%o1
	ldsb	[%l7 + 0x0C],	%g2
	movcc	%icc,	%l1,	%l4
	move	%icc,	%l2,	%i2
	fmovrslez	%i1,	%f28,	%f0
	fmovdle	%icc,	%f18,	%f6
	movgu	%xcc,	%i3,	%i6
	ldsw	[%l7 + 0x0C],	%o0
	xnorcc	%i5,	0x02BC,	%o3
	addc	%i7,	0x1F4F,	%l6
	mulx	%o5,	0x161A,	%o6
	fnot1s	%f0,	%f6
	fxnor	%f6,	%f16,	%f2
	xorcc	%i4,	%o4,	%o2
	mulx	%i0,	0x19E8,	%l0
	ld	[%l7 + 0x48],	%f23
	ldd	[%l7 + 0x20],	%f4
	udivx	%g7,	0x1FA6,	%l3
	movg	%icc,	%g1,	%g6
	movpos	%xcc,	%g4,	%g3
	movrgz	%g5,	%o7,	%o1
	fandnot1s	%f0,	%f13,	%f9
	xnor	%l5,	0x07FB,	%g2
	subcc	%l4,	%l2,	%i2
	fcmpne16	%f18,	%f24,	%i1
	ldd	[%l7 + 0x58],	%l0
	fandnot1	%f20,	%f30,	%f10
	edge32ln	%i6,	%i3,	%o0
	fsrc1s	%f24,	%f3
	fmovsn	%icc,	%f29,	%f0
	fcmpgt32	%f20,	%f6,	%i5
	fmovsg	%icc,	%f24,	%f4
	edge8n	%i7,	%o3,	%l6
	alignaddr	%o6,	%i4,	%o4
	fmovsge	%xcc,	%f25,	%f24
	movcc	%icc,	%o2,	%o5
	udivcc	%i0,	0x0235,	%l0
	movl	%xcc,	%g7,	%g1
	fnot1s	%f19,	%f27
	stw	%l3,	[%l7 + 0x0C]
	movrne	%g4,	0x204,	%g3
	array32	%g6,	%o7,	%o1
	edge8	%g5,	%g2,	%l5
	addccc	%l4,	%i2,	%l2
	edge8ln	%i1,	%l1,	%i6
	ldd	[%l7 + 0x28],	%i2
	movrlz	%i5,	0x017,	%o0
	movrgez	%o3,	%l6,	%i7
	fmovdn	%xcc,	%f19,	%f20
	edge32	%i4,	%o6,	%o4
	movl	%icc,	%o5,	%o2
	andncc	%i0,	%l0,	%g1
	movcc	%icc,	%l3,	%g7
	std	%f22,	[%l7 + 0x68]
	move	%xcc,	%g4,	%g6
	movrgz	%o7,	%o1,	%g5
	move	%icc,	%g3,	%g2
	fnot1s	%f31,	%f13
	udiv	%l5,	0x06D8,	%i2
	movcc	%xcc,	%l2,	%i1
	sdivcc	%l4,	0x07F7,	%l1
	mulx	%i3,	%i6,	%i5
	sethi	0x1FF2,	%o0
	sub	%o3,	0x12CC,	%l6
	sll	%i4,	0x0C,	%i7
	orcc	%o6,	%o4,	%o2
	fnor	%f18,	%f12,	%f28
	add	%i0,	%l0,	%g1
	restore %l3, 0x1511, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f2,	%f10,	%f20
	edge16	%g4,	%g6,	%o7
	umulcc	%o1,	0x0333,	%g5
	edge8n	%g3,	%g2,	%l5
	fnegd	%f4,	%f14
	fandnot1s	%f5,	%f20,	%f1
	umulcc	%o5,	%i2,	%l2
	fmovscs	%icc,	%f29,	%f13
	mulscc	%i1,	0x15E9,	%l4
	andcc	%l1,	%i6,	%i3
	or	%i5,	0x0E4E,	%o0
	edge32	%o3,	%l6,	%i4
	movvs	%icc,	%i7,	%o4
	movne	%xcc,	%o6,	%i0
	mulscc	%l0,	0x1614,	%o2
	xor	%g1,	%g7,	%l3
	udiv	%g4,	0x1BA2,	%o7
	ldx	[%l7 + 0x70],	%o1
	lduw	[%l7 + 0x0C],	%g5
	array16	%g3,	%g6,	%l5
	fornot2	%f16,	%f2,	%f10
	fornot1	%f26,	%f2,	%f10
	fpack32	%f20,	%f20,	%f24
	save %o5, %g2, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f8,	%f28,	%f18
	movgu	%xcc,	%i1,	%l2
	movre	%l4,	%i6,	%i3
	movgu	%icc,	%l1,	%i5
	and	%o3,	%l6,	%o0
	edge8n	%i7,	%o4,	%i4
	fmul8ulx16	%f24,	%f22,	%f22
	fmovscs	%icc,	%f17,	%f16
	smul	%i0,	%o6,	%o2
	fands	%f15,	%f13,	%f26
	faligndata	%f14,	%f28,	%f0
	addccc	%l0,	%g7,	%l3
	andncc	%g4,	%o7,	%o1
	lduh	[%l7 + 0x7E],	%g5
	fpack16	%f10,	%f27
	edge16ln	%g3,	%g6,	%g1
	addccc	%o5,	0x0431,	%l5
	sll	%g2,	%i1,	%l2
	for	%f16,	%f14,	%f24
	sdiv	%i2,	0x1A93,	%l4
	or	%i3,	0x02D3,	%i6
	movrlz	%i5,	0x071,	%o3
	mulx	%l1,	%o0,	%i7
	sll	%o4,	%l6,	%i0
	bshuffle	%f10,	%f16,	%f12
	smul	%i4,	0x0851,	%o6
	udivx	%o2,	0x14CB,	%g7
	xor	%l0,	0x0DA9,	%l3
	mulscc	%g4,	%o7,	%g5
	fmovrde	%g3,	%f30,	%f14
	movn	%xcc,	%g6,	%g1
	move	%xcc,	%o5,	%o1
	ld	[%l7 + 0x24],	%f1
	array16	%g2,	%l5,	%l2
	stw	%i2,	[%l7 + 0x2C]
	srl	%l4,	0x1A,	%i3
	udiv	%i1,	0x0381,	%i6
	smulcc	%o3,	0x1953,	%l1
	subc	%o0,	%i5,	%i7
	fpsub32	%f28,	%f18,	%f4
	sll	%o4,	%l6,	%i0
	fmovsle	%xcc,	%f10,	%f14
	edge16ln	%o6,	%o2,	%i4
	array16	%l0,	%g7,	%g4
	nop
	set	0x48, %i1
	ldsh	[%l7 + %i1],	%l3
	ldsh	[%l7 + 0x16],	%o7
	sub	%g5,	0x0B06,	%g3
	smulcc	%g1,	%o5,	%g6
	movn	%xcc,	%o1,	%l5
	fmuld8sux16	%f21,	%f6,	%f24
	sth	%l2,	[%l7 + 0x72]
	smulcc	%i2,	%l4,	%g2
	movre	%i1,	0x05B,	%i6
	fpsub32s	%f22,	%f26,	%f20
	array8	%o3,	%l1,	%i3
	edge16n	%o0,	%i7,	%o4
	movcc	%xcc,	%i5,	%l6
	add	%i0,	0x1E47,	%o2
	movne	%xcc,	%i4,	%l0
	movrgz	%o6,	0x33D,	%g7
	stx	%g4,	[%l7 + 0x58]
	movpos	%xcc,	%l3,	%o7
	stx	%g3,	[%l7 + 0x50]
	andncc	%g5,	%g1,	%g6
	and	%o1,	0x1815,	%l5
	ldd	[%l7 + 0x40],	%l2
	ldub	[%l7 + 0x4D],	%o5
	sdivx	%i2,	0x0559,	%l4
	fmovdcc	%icc,	%f3,	%f20
	movre	%i1,	0x337,	%i6
	subc	%g2,	0x0651,	%o3
	edge32ln	%i3,	%l1,	%o0
	movneg	%icc,	%o4,	%i5
	srl	%i7,	0x0B,	%i0
	mova	%icc,	%l6,	%i4
	srax	%o2,	%o6,	%g7
	umulcc	%g4,	0x1084,	%l3
	sdiv	%o7,	0x015D,	%g3
	smul	%l0,	0x0DEE,	%g1
	mova	%icc,	%g6,	%o1
	orcc	%g5,	%l5,	%o5
	alignaddrl	%i2,	%l2,	%i1
	edge8ln	%l4,	%i6,	%g2
	ld	[%l7 + 0x14],	%f24
	mulx	%o3,	0x0C95,	%i3
	fand	%f30,	%f30,	%f0
	movg	%icc,	%o0,	%l1
	ldd	[%l7 + 0x60],	%i4
	fmovse	%icc,	%f29,	%f24
	fmovscc	%xcc,	%f18,	%f17
	array32	%o4,	%i7,	%l6
	edge8ln	%i0,	%i4,	%o2
	ldd	[%l7 + 0x48],	%g6
	edge32ln	%g4,	%l3,	%o7
	andcc	%g3,	0x0CD7,	%l0
	sdivx	%g1,	0x149C,	%g6
	movleu	%xcc,	%o6,	%o1
	movgu	%xcc,	%g5,	%l5
	xnorcc	%i2,	%o5,	%l2
	movgu	%xcc,	%l4,	%i1
	udiv	%i6,	0x1329,	%g2
	ldub	[%l7 + 0x4C],	%i3
	or	%o3,	0x1D70,	%l1
	edge32l	%i5,	%o0,	%o4
	movrne	%i7,	0x2AF,	%i0
	andn	%i4,	0x035F,	%l6
	orncc	%o2,	%g4,	%g7
	fornot1s	%f25,	%f19,	%f12
	bshuffle	%f0,	%f18,	%f18
	ldd	[%l7 + 0x70],	%o6
	fmovscs	%icc,	%f6,	%f22
	edge16ln	%g3,	%l3,	%l0
	movgu	%icc,	%g6,	%o6
	fpadd16s	%f19,	%f2,	%f29
	umul	%g1,	%g5,	%l5
	andn	%o1,	%o5,	%i2
	edge32ln	%l4,	%i1,	%l2
	movle	%icc,	%g2,	%i6
	edge16n	%i3,	%l1,	%i5
	sth	%o0,	[%l7 + 0x56]
	fmovdneg	%icc,	%f10,	%f18
	stb	%o4,	[%l7 + 0x7B]
	edge16	%i7,	%o3,	%i0
	movg	%icc,	%i4,	%o2
	edge16l	%g4,	%l6,	%g7
	movn	%icc,	%o7,	%g3
	edge32ln	%l3,	%l0,	%o6
	stw	%g1,	[%l7 + 0x14]
	ldx	[%l7 + 0x40],	%g6
	andn	%l5,	%o1,	%g5
	movge	%icc,	%i2,	%o5
	sll	%i1,	%l4,	%l2
	movl	%icc,	%i6,	%i3
	udivx	%l1,	0x1992,	%g2
	xnor	%o0,	0x1895,	%o4
	orn	%i5,	%i7,	%o3
	fcmpeq16	%f2,	%f2,	%i0
	movpos	%xcc,	%o2,	%i4
	ldd	[%l7 + 0x48],	%g4
	smulcc	%g7,	0x09BC,	%l6
	lduh	[%l7 + 0x4A],	%g3
	bshuffle	%f0,	%f2,	%f24
	umulcc	%l3,	0x1EBF,	%o7
	lduh	[%l7 + 0x72],	%o6
	fmovdle	%icc,	%f31,	%f15
	srax	%g1,	0x1F,	%l0
	fmovdg	%icc,	%f4,	%f30
	sra	%l5,	%o1,	%g6
	popc	%i2,	%o5
	movne	%icc,	%g5,	%l4
	ldub	[%l7 + 0x28],	%i1
	orn	%l2,	0x037D,	%i6
	fpadd16	%f10,	%f8,	%f0
	sllx	%i3,	0x1B,	%g2
	fmovse	%icc,	%f12,	%f27
	movvc	%xcc,	%o0,	%l1
	fpsub32	%f2,	%f18,	%f6
	fnand	%f2,	%f2,	%f0
	movleu	%icc,	%i5,	%o4
	ldd	[%l7 + 0x20],	%f12
	edge16	%o3,	%i0,	%o2
	andn	%i4,	%g4,	%g7
	for	%f28,	%f2,	%f0
	movgu	%icc,	%l6,	%i7
	srlx	%g3,	0x05,	%l3
	movle	%icc,	%o7,	%g1
	fzeros	%f22
	fpadd32s	%f29,	%f21,	%f17
	lduh	[%l7 + 0x34],	%l0
	movge	%xcc,	%o6,	%l5
	fmul8ulx16	%f26,	%f16,	%f16
	xor	%o1,	%i2,	%g6
	array32	%g5,	%o5,	%l4
	fcmple32	%f6,	%f8,	%l2
	xnorcc	%i1,	%i3,	%i6
	movrgz	%o0,	%g2,	%i5
	movn	%xcc,	%o4,	%o3
	st	%f5,	[%l7 + 0x18]
	srlx	%l1,	0x06,	%o2
	fxors	%f22,	%f12,	%f12
	andcc	%i0,	0x0192,	%g4
	smul	%i4,	0x0CCE,	%g7
	fmovdvc	%icc,	%f17,	%f7
	edge32	%l6,	%i7,	%g3
	udivcc	%l3,	0x1F2E,	%g1
	addcc	%l0,	%o7,	%l5
	addcc	%o6,	%o1,	%g6
	st	%f29,	[%l7 + 0x64]
	nop
	set	0x74, %g5
	lduw	[%l7 + %g5],	%i2
	edge8n	%o5,	%g5,	%l4
	edge32n	%i1,	%l2,	%i3
	sra	%i6,	0x0D,	%o0
	faligndata	%f10,	%f16,	%f28
	fmovdl	%icc,	%f11,	%f30
	edge8	%i5,	%g2,	%o4
	movle	%xcc,	%o3,	%o2
	andncc	%l1,	%i0,	%g4
	add	%i4,	0x1976,	%l6
	udivx	%i7,	0x082E,	%g7
	andn	%l3,	0x0882,	%g1
	fmovsge	%xcc,	%f16,	%f12
	srax	%l0,	0x16,	%o7
	fpadd16s	%f27,	%f5,	%f2
	popc	%g3,	%o6
	edge16l	%l5,	%g6,	%o1
	edge16n	%i2,	%o5,	%g5
	movleu	%icc,	%i1,	%l4
	sll	%i3,	%i6,	%o0
	andcc	%l2,	%g2,	%i5
	ldd	[%l7 + 0x70],	%f26
	udiv	%o3,	0x1BD4,	%o4
	edge8	%l1,	%o2,	%i0
	ldd	[%l7 + 0x10],	%i4
	fxnors	%f8,	%f31,	%f14
	mova	%xcc,	%l6,	%i7
	fcmpne16	%f12,	%f8,	%g4
	mulscc	%g7,	0x16B8,	%g1
	fcmpd	%fcc2,	%f14,	%f16
	fones	%f22
	edge32l	%l0,	%l3,	%g3
	fmovsneg	%icc,	%f24,	%f0
	nop
	set	0x49, %i4
	ldsb	[%l7 + %i4],	%o7
	movrgez	%o6,	%g6,	%o1
	movvc	%xcc,	%i2,	%l5
	addccc	%o5,	%g5,	%l4
	edge16ln	%i3,	%i1,	%o0
	subc	%i6,	0x1910,	%l2
	srax	%g2,	0x1E,	%i5
	alignaddrl	%o3,	%o4,	%o2
	movrlz	%i0,	%l1,	%i4
	fandnot1	%f0,	%f10,	%f24
	st	%f29,	[%l7 + 0x60]
	movvs	%icc,	%l6,	%i7
	edge16	%g7,	%g1,	%g4
	subccc	%l0,	%l3,	%g3
	fnegs	%f14,	%f23
	edge32n	%o6,	%o7,	%g6
	fmuld8ulx16	%f21,	%f8,	%f14
	addc	%i2,	%o1,	%l5
	xnorcc	%g5,	0x0BA2,	%o5
	fcmpes	%fcc3,	%f1,	%f31
	move	%xcc,	%i3,	%l4
	alignaddr	%o0,	%i6,	%l2
	sub	%i1,	0x0BD3,	%g2
	fmovsa	%icc,	%f19,	%f6
	popc	%i5,	%o3
	andn	%o4,	0x0D4C,	%o2
	add	%i0,	%l1,	%l6
	ldd	[%l7 + 0x20],	%i6
	movleu	%icc,	%i4,	%g7
	movge	%xcc,	%g4,	%g1
	sdivx	%l3,	0x1654,	%l0
	or	%o6,	%g3,	%o7
	fmovsvs	%xcc,	%f4,	%f9
	fone	%f24
	edge8l	%g6,	%o1,	%i2
	fandnot2	%f10,	%f30,	%f22
	udiv	%l5,	0x162F,	%o5
	array8	%g5,	%i3,	%o0
	umulcc	%i6,	0x05FC,	%l4
	alignaddr	%i1,	%l2,	%g2
	subccc	%o3,	%o4,	%o2
	subc	%i5,	%i0,	%l1
	movre	%i7,	%l6,	%g7
	popc	%g4,	%g1
	movpos	%xcc,	%l3,	%l0
	mova	%icc,	%o6,	%i4
	movvs	%xcc,	%o7,	%g3
	fmovdl	%xcc,	%f18,	%f30
	movcs	%xcc,	%g6,	%o1
	xor	%l5,	0x0DA2,	%i2
	movle	%icc,	%g5,	%o5
	fcmpeq32	%f20,	%f22,	%i3
	movpos	%xcc,	%o0,	%i6
	fmovd	%f24,	%f16
	addccc	%i1,	%l2,	%g2
	stw	%o3,	[%l7 + 0x34]
	orn	%o4,	0x0449,	%l4
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	movrgez	%l1,	0x285,	%i5
	ldsh	[%l7 + 0x6C],	%l6
	movvc	%icc,	%g7,	%g4
	mova	%icc,	%i7,	%g1
	ld	[%l7 + 0x70],	%f6
	fandnot2	%f20,	%f12,	%f0
	sll	%l0,	%l3,	%i4
	umulcc	%o7,	0x05DF,	%o6
	fmovdgu	%xcc,	%f28,	%f14
	sdivx	%g3,	0x1FB5,	%g6
	movpos	%icc,	%l5,	%i2
	srlx	%g5,	0x1D,	%o5
	movrgez	%i3,	%o1,	%o0
	edge32ln	%i1,	%l2,	%g2
	fpadd16s	%f20,	%f3,	%f22
	movgu	%icc,	%i6,	%o4
	std	%f2,	[%l7 + 0x30]
	sdivx	%o3,	0x1DA2,	%l4
	lduh	[%l7 + 0x0E],	%i0
	subccc	%o2,	0x0427,	%l1
	movleu	%icc,	%i5,	%g7
	lduw	[%l7 + 0x30],	%l6
	fmovsleu	%icc,	%f9,	%f5
	ldx	[%l7 + 0x48],	%g4
	save %i7, %g1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f20,	%f7
	move	%icc,	%i4,	%l3
	nop
	set	0x28, %g3
	lduw	[%l7 + %g3],	%o7
	std	%f20,	[%l7 + 0x78]
	lduh	[%l7 + 0x22],	%g3
	udiv	%o6,	0x03E6,	%l5
	andncc	%i2,	%g5,	%g6
	and	%i3,	%o1,	%o5
	srl	%o0,	%l2,	%i1
	subc	%g2,	0x00AB,	%i6
	subccc	%o4,	0x10FE,	%l4
	std	%f2,	[%l7 + 0x68]
	move	%xcc,	%o3,	%i0
	fmovde	%xcc,	%f6,	%f4
	fmovdle	%icc,	%f24,	%f0
	std	%f10,	[%l7 + 0x70]
	ld	[%l7 + 0x0C],	%f4
	fcmps	%fcc0,	%f2,	%f8
	edge8ln	%l1,	%o2,	%g7
	edge32l	%i5,	%g4,	%l6
	movrlz	%i7,	%g1,	%i4
	alignaddr	%l3,	%o7,	%l0
	ld	[%l7 + 0x14],	%f21
	array16	%o6,	%l5,	%g3
	fabsd	%f2,	%f26
	lduh	[%l7 + 0x36],	%g5
	movre	%i2,	0x184,	%g6
	fmovrslz	%i3,	%f4,	%f2
	fones	%f22
	fxors	%f23,	%f15,	%f23
	siam	0x3
	edge8l	%o1,	%o5,	%o0
	xnor	%i1,	%g2,	%l2
	addc	%i6,	%l4,	%o3
	udivcc	%o4,	0x1547,	%i0
	edge8l	%o2,	%l1,	%i5
	movleu	%xcc,	%g7,	%g4
	movgu	%xcc,	%l6,	%g1
	addccc	%i7,	0x15EF,	%i4
	alignaddr	%o7,	%l3,	%l0
	ldub	[%l7 + 0x44],	%o6
	edge8	%l5,	%g5,	%g3
	movne	%xcc,	%i2,	%g6
	std	%f6,	[%l7 + 0x20]
	subcc	%o1,	%o5,	%i3
	fxor	%f24,	%f24,	%f10
	alignaddrl	%i1,	%g2,	%o0
	fors	%f20,	%f20,	%f10
	movn	%icc,	%i6,	%l4
	edge8n	%o3,	%o4,	%i0
	st	%f27,	[%l7 + 0x1C]
	srlx	%l2,	%o2,	%i5
	movn	%xcc,	%l1,	%g7
	xnorcc	%l6,	0x0AF5,	%g1
	fzeros	%f12
	fxnor	%f18,	%f30,	%f24
	sdivcc	%g4,	0x0376,	%i4
	move	%xcc,	%i7,	%l3
	udiv	%l0,	0x1D56,	%o6
	andncc	%o7,	%l5,	%g5
	smul	%g3,	%g6,	%i2
	sub	%o5,	%o1,	%i1
	alignaddrl	%g2,	%o0,	%i3
	alignaddr	%i6,	%l4,	%o3
	mova	%xcc,	%o4,	%i0
	fpsub32s	%f12,	%f29,	%f6
	fmovdgu	%xcc,	%f27,	%f26
	fornot2	%f30,	%f24,	%f22
	xor	%o2,	0x059B,	%i5
	fnand	%f16,	%f8,	%f24
	movne	%xcc,	%l2,	%l1
	udiv	%g7,	0x006D,	%g1
	stb	%g4,	[%l7 + 0x24]
	movvc	%icc,	%i4,	%i7
	subcc	%l6,	%l0,	%o6
	ldsh	[%l7 + 0x74],	%l3
	ldsw	[%l7 + 0x64],	%l5
	andcc	%g5,	%g3,	%o7
	mulx	%i2,	%g6,	%o5
	movcc	%icc,	%i1,	%o1
	sir	0x096B
	addcc	%g2,	0x0EDA,	%o0
	fmovdgu	%icc,	%f29,	%f17
	movl	%xcc,	%i3,	%l4
	fmul8x16al	%f31,	%f17,	%f28
	ldd	[%l7 + 0x38],	%i6
	movrgz	%o4,	0x3F5,	%o3
	fmul8x16	%f1,	%f22,	%f12
	andn	%i0,	%i5,	%l2
	movpos	%xcc,	%l1,	%o2
	edge8l	%g7,	%g4,	%g1
	fmovd	%f30,	%f14
	edge32ln	%i4,	%i7,	%l6
	lduh	[%l7 + 0x1A],	%o6
	fabsd	%f18,	%f16
	fmovde	%icc,	%f30,	%f13
	addc	%l3,	%l0,	%g5
	stw	%l5,	[%l7 + 0x28]
	xnorcc	%o7,	%g3,	%g6
	umulcc	%o5,	%i2,	%i1
	fmovrdlez	%g2,	%f24,	%f18
	movrlez	%o1,	0x013,	%i3
	popc	0x11DA,	%o0
	sub	%i6,	0x1AC7,	%l4
	fpsub32	%f30,	%f12,	%f30
	fcmple32	%f16,	%f18,	%o4
	stb	%o3,	[%l7 + 0x6B]
	sdivx	%i0,	0x0C86,	%l2
	movrgez	%l1,	0x25B,	%o2
	movl	%icc,	%i5,	%g7
	ldx	[%l7 + 0x48],	%g1
	xnorcc	%i4,	%i7,	%l6
	movle	%xcc,	%g4,	%o6
	mova	%xcc,	%l0,	%l3
	ldx	[%l7 + 0x60],	%l5
	sth	%g5,	[%l7 + 0x20]
	addcc	%g3,	%o7,	%g6
	udiv	%i2,	0x0EDC,	%i1
	alignaddrl	%g2,	%o5,	%i3
	bshuffle	%f30,	%f2,	%f16
	move	%icc,	%o1,	%i6
	movrgez	%o0,	0x011,	%l4
	ldsb	[%l7 + 0x0A],	%o3
	movcc	%icc,	%o4,	%l2
	sllx	%l1,	0x03,	%i0
	fmovsle	%icc,	%f14,	%f31
	ldx	[%l7 + 0x48],	%o2
	andcc	%i5,	0x1234,	%g7
	sllx	%g1,	%i4,	%i7
	umul	%l6,	%g4,	%o6
	srax	%l3,	%l5,	%l0
	movge	%icc,	%g3,	%g5
	nop
	set	0x5E, %i0
	sth	%g6,	[%l7 + %i0]
	fandnot1s	%f12,	%f9,	%f21
	stx	%i2,	[%l7 + 0x10]
	movvc	%xcc,	%o7,	%i1
	xorcc	%o5,	%g2,	%o1
	fcmpgt16	%f18,	%f10,	%i3
	move	%xcc,	%i6,	%l4
	fzeros	%f1
	lduw	[%l7 + 0x3C],	%o0
	movn	%icc,	%o3,	%o4
	fandnot1	%f2,	%f4,	%f18
	edge8l	%l1,	%i0,	%l2
	array32	%i5,	%o2,	%g1
	umul	%i4,	0x0AC9,	%i7
	sth	%l6,	[%l7 + 0x16]
	popc	%g4,	%o6
	umul	%g7,	%l3,	%l0
	movneg	%xcc,	%l5,	%g3
	movvc	%icc,	%g6,	%g5
	movrne	%o7,	%i2,	%i1
	fmovsleu	%icc,	%f4,	%f25
	fmovrsgz	%o5,	%f18,	%f4
	ldx	[%l7 + 0x40],	%g2
	sra	%i3,	0x17,	%o1
	edge8n	%i6,	%o0,	%l4
	fxor	%f22,	%f28,	%f26
	movge	%xcc,	%o3,	%o4
	fxnor	%f24,	%f30,	%f0
	movn	%icc,	%l1,	%l2
	ldsh	[%l7 + 0x48],	%i5
	movvs	%icc,	%i0,	%o2
	movpos	%icc,	%g1,	%i7
	fmovsl	%xcc,	%f24,	%f28
	udiv	%l6,	0x033B,	%i4
	subc	%o6,	%g4,	%g7
	udivcc	%l0,	0x1379,	%l5
	udivcc	%l3,	0x0C63,	%g3
	sdivx	%g5,	0x0D21,	%o7
	fpsub16	%f2,	%f22,	%f4
	edge32	%i2,	%g6,	%i1
	movre	%g2,	%i3,	%o1
	movrgez	%o5,	0x324,	%o0
	edge8l	%i6,	%l4,	%o4
	movge	%icc,	%o3,	%l2
	fcmpeq16	%f6,	%f0,	%i5
	movg	%icc,	%i0,	%o2
	fmovrdlez	%l1,	%f2,	%f2
	array8	%g1,	%i7,	%i4
	udivx	%o6,	0x1021,	%g4
	fmovdcs	%xcc,	%f21,	%f13
	fmovrdgez	%g7,	%f0,	%f30
	alignaddr	%l0,	%l5,	%l3
	fornot2s	%f16,	%f17,	%f8
	fnand	%f20,	%f6,	%f24
	fxnors	%f22,	%f18,	%f11
	movneg	%xcc,	%g3,	%l6
	popc	0x0A99,	%g5
	movgu	%icc,	%o7,	%g6
	sethi	0x0851,	%i1
	stx	%i2,	[%l7 + 0x78]
	sra	%g2,	0x10,	%o1
	udivx	%o5,	0x08AB,	%i3
	edge8n	%i6,	%o0,	%o4
	fabsd	%f0,	%f30
	fcmpgt32	%f4,	%f14,	%l4
	movre	%l2,	0x1D2,	%i5
	fnors	%f21,	%f16,	%f26
	fands	%f17,	%f22,	%f31
	edge8ln	%o3,	%o2,	%l1
	std	%f16,	[%l7 + 0x18]
	movpos	%icc,	%i0,	%i7
	sllx	%g1,	0x16,	%o6
	array16	%g4,	%g7,	%i4
	fcmple16	%f20,	%f14,	%l5
	fpmerge	%f25,	%f21,	%f26
	fnors	%f16,	%f22,	%f5
	umul	%l3,	0x1A03,	%g3
	smul	%l0,	0x0767,	%g5
	edge8n	%o7,	%g6,	%l6
	srlx	%i1,	%i2,	%o1
	fmovdleu	%xcc,	%f22,	%f23
	nop
	set	0x50, %l6
	std	%f0,	[%l7 + %l6]
	edge16n	%g2,	%i3,	%o5
	ldsh	[%l7 + 0x1E],	%o0
	xorcc	%i6,	%l4,	%o4
	movne	%icc,	%i5,	%o3
	fpadd32s	%f5,	%f15,	%f21
	subccc	%l2,	%o2,	%i0
	sub	%i7,	%g1,	%l1
	movneg	%xcc,	%o6,	%g7
	stw	%g4,	[%l7 + 0x30]
	movre	%l5,	0x2CC,	%l3
	restore %i4, 0x0D70, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x08D4,	%l0
	xorcc	%g5,	%g6,	%o7
	fmovs	%f30,	%f4
	addccc	%i1,	%i2,	%l6
	ldsb	[%l7 + 0x16],	%o1
	fnand	%f6,	%f20,	%f8
	fsrc2s	%f1,	%f11
	udiv	%i3,	0x1F97,	%g2
	movrgez	%o0,	0x06D,	%i6
	umulcc	%l4,	0x0284,	%o4
	movcs	%icc,	%i5,	%o3
	and	%l2,	0x0249,	%o5
	movcc	%xcc,	%i0,	%i7
	save %o2, %g1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g7,	0x0C49,	%o6
	fand	%f14,	%f12,	%f22
	std	%f30,	[%l7 + 0x30]
	stw	%g4,	[%l7 + 0x14]
	movvc	%icc,	%l3,	%l5
	movvs	%xcc,	%g3,	%i4
	sth	%l0,	[%l7 + 0x56]
	movleu	%icc,	%g5,	%g6
	movrlez	%o7,	%i2,	%l6
	fmovsleu	%icc,	%f31,	%f9
	xor	%o1,	0x0334,	%i1
	fpadd32s	%f24,	%f18,	%f3
	sir	0x1F05
	sth	%i3,	[%l7 + 0x76]
	fzero	%f12
	fmul8x16al	%f11,	%f29,	%f24
	umul	%o0,	%g2,	%l4
	movcc	%xcc,	%o4,	%i5
	stw	%o3,	[%l7 + 0x44]
	addc	%l2,	%i6,	%o5
	movrlez	%i0,	0x0FF,	%i7
	ldd	[%l7 + 0x58],	%o2
	xnorcc	%l1,	0x0C4D,	%g1
	fandnot2s	%f3,	%f9,	%f18
	ldsh	[%l7 + 0x4E],	%o6
	fmovsa	%icc,	%f31,	%f0
	fcmple32	%f10,	%f16,	%g4
	sra	%l3,	%g7,	%g3
	fabss	%f31,	%f2
	xorcc	%l5,	0x096D,	%l0
	movpos	%xcc,	%g5,	%i4
	fabsd	%f22,	%f8
	stb	%g6,	[%l7 + 0x29]
	alignaddrl	%o7,	%i2,	%o1
	subc	%l6,	%i1,	%i3
	stw	%g2,	[%l7 + 0x6C]
	edge32n	%l4,	%o0,	%i5
	ldub	[%l7 + 0x32],	%o4
	andn	%o3,	0x178C,	%l2
	movn	%xcc,	%i6,	%o5
	edge32l	%i7,	%i0,	%l1
	xnor	%g1,	%o6,	%g4
	nop
	set	0x20, %l0
	std	%f0,	[%l7 + %l0]
	bshuffle	%f2,	%f10,	%f0
	array8	%o2,	%l3,	%g7
	edge32ln	%l5,	%g3,	%l0
	nop
	set	0x1A, %g6
	ldsh	[%l7 + %g6],	%i4
	movne	%icc,	%g6,	%g5
	sdivcc	%o7,	0x0C16,	%o1
	fsrc1s	%f18,	%f9
	ld	[%l7 + 0x48],	%f8
	move	%icc,	%i2,	%i1
	sdiv	%l6,	0x1B3B,	%i3
	st	%f11,	[%l7 + 0x74]
	movne	%xcc,	%l4,	%o0
	smulcc	%g2,	%o4,	%i5
	edge8	%o3,	%i6,	%l2
	edge16ln	%o5,	%i0,	%i7
	ldsb	[%l7 + 0x7B],	%g1
	movvc	%xcc,	%o6,	%g4
	ld	[%l7 + 0x10],	%f9
	movleu	%icc,	%l1,	%l3
	fones	%f19
	sdivcc	%o2,	0x1695,	%l5
	st	%f28,	[%l7 + 0x54]
	pdist	%f10,	%f18,	%f30
	edge8	%g3,	%g7,	%l0
	stb	%g6,	[%l7 + 0x4C]
	fnegs	%f15,	%f6
	movne	%xcc,	%i4,	%o7
	edge32n	%o1,	%i2,	%i1
	fand	%f2,	%f2,	%f24
	ldsb	[%l7 + 0x2A],	%l6
	fmul8x16au	%f26,	%f2,	%f6
	movrlz	%i3,	%g5,	%l4
	sra	%g2,	0x00,	%o4
	andcc	%i5,	%o3,	%i6
	ldsw	[%l7 + 0x28],	%l2
	addccc	%o0,	%o5,	%i7
	add	%g1,	%o6,	%g4
	ldub	[%l7 + 0x2D],	%i0
	movrlez	%l1,	0x3D1,	%o2
	addcc	%l3,	0x1590,	%l5
	udivx	%g7,	0x1792,	%g3
	mulscc	%l0,	0x06FB,	%i4
	fmovdpos	%xcc,	%f6,	%f24
	fmovrsgez	%g6,	%f30,	%f0
	fmovrsgz	%o1,	%f22,	%f7
	xnorcc	%o7,	%i2,	%l6
	edge8ln	%i3,	%i1,	%l4
	movrlez	%g2,	0x1D8,	%g5
	edge16ln	%i5,	%o3,	%o4
	edge16ln	%l2,	%o0,	%i6
	edge16n	%o5,	%g1,	%i7
	edge32	%g4,	%i0,	%l1
	movcc	%icc,	%o6,	%o2
	fmovscc	%icc,	%f8,	%f12
	fzero	%f20
	sll	%l3,	%l5,	%g7
	xor	%l0,	%g3,	%i4
	umul	%g6,	%o1,	%i2
	st	%f17,	[%l7 + 0x40]
	sra	%l6,	%i3,	%i1
	edge8ln	%l4,	%g2,	%o7
	movcc	%xcc,	%g5,	%o3
	fmovde	%icc,	%f26,	%f5
	orn	%i5,	0x0E01,	%o4
	ldsb	[%l7 + 0x1E],	%o0
	and	%l2,	0x04F1,	%i6
	sra	%o5,	%g1,	%i7
	addcc	%g4,	%i0,	%o6
	fsrc1	%f12,	%f0
	add	%l1,	0x1853,	%o2
	popc	0x1B68,	%l5
	mova	%icc,	%l3,	%g7
	fmovdvc	%icc,	%f13,	%f29
	fnegs	%f25,	%f6
	movgu	%icc,	%l0,	%i4
	sth	%g3,	[%l7 + 0x36]
	movrgez	%o1,	%i2,	%g6
	save %l6, 0x01D7, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i3,	0x0EDF,	%g2
	edge16n	%l4,	%g5,	%o3
	sdivx	%o7,	0x1EC3,	%o4
	subc	%i5,	%l2,	%i6
	fmovd	%f20,	%f0
	stx	%o0,	[%l7 + 0x68]
	ldd	[%l7 + 0x30],	%f2
	umulcc	%g1,	%o5,	%g4
	fone	%f10
	ld	[%l7 + 0x2C],	%f3
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	movvc	%xcc,	%o6,	%o2
	srl	%l1,	0x11,	%l5
	array8	%g7,	%l0,	%i4
	movrlz	%g3,	%o1,	%i2
	srlx	%l3,	%g6,	%l6
	lduh	[%l7 + 0x76],	%i1
	xnor	%g2,	0x09A8,	%l4
	edge32ln	%g5,	%o3,	%i3
	andcc	%o7,	0x07F9,	%i5
	movneg	%xcc,	%l2,	%o4
	movne	%icc,	%o0,	%g1
	fmovscc	%xcc,	%f30,	%f11
	edge8ln	%o5,	%i6,	%i0
	fmovrdlez	%g4,	%f30,	%f26
	fpadd16s	%f14,	%f10,	%f26
	fabsd	%f28,	%f22
	edge16l	%o6,	%i7,	%o2
	andn	%l1,	0x1AE8,	%l5
	fxor	%f2,	%f18,	%f22
	fand	%f22,	%f20,	%f0
	fcmpne32	%f16,	%f24,	%l0
	or	%g7,	0x14DB,	%g3
	ldsb	[%l7 + 0x51],	%o1
	movrlez	%i2,	%l3,	%g6
	fmovdcc	%icc,	%f26,	%f31
	movcc	%xcc,	%i4,	%i1
	nop
	set	0x72, %o7
	ldub	[%l7 + %o7],	%l6
	fxors	%f26,	%f9,	%f6
	ldsw	[%l7 + 0x28],	%l4
	fmovsvc	%icc,	%f10,	%f7
	fmovdneg	%icc,	%f8,	%f7
	lduh	[%l7 + 0x34],	%g5
	edge16ln	%g2,	%i3,	%o7
	edge8ln	%o3,	%l2,	%o4
	orcc	%i5,	%o0,	%g1
	fmuld8ulx16	%f20,	%f28,	%f0
	fmovdvs	%xcc,	%f24,	%f23
	fnegs	%f1,	%f21
	fmul8x16au	%f13,	%f28,	%f0
	fmovdleu	%icc,	%f9,	%f19
	stb	%i6,	[%l7 + 0x5C]
	sdivcc	%i0,	0x04BF,	%g4
	smulcc	%o6,	%o5,	%o2
	edge32	%l1,	%l5,	%l0
	andcc	%g7,	0x1904,	%g3
	std	%f22,	[%l7 + 0x18]
	std	%f6,	[%l7 + 0x68]
	movvs	%icc,	%o1,	%i2
	fxnors	%f5,	%f11,	%f19
	srl	%l3,	0x1C,	%g6
	orn	%i7,	0x1C14,	%i4
	orn	%l6,	0x0C7C,	%l4
	fmovdle	%icc,	%f22,	%f17
	ldd	[%l7 + 0x40],	%i0
	subcc	%g2,	%i3,	%o7
	array16	%g5,	%o3,	%l2
	restore %i5, %o0, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i6,	0x0BEF,	%o4
	fpadd16s	%f10,	%f18,	%f7
	alignaddrl	%i0,	%g4,	%o6
	subc	%o5,	%l1,	%l5
	umulcc	%o2,	%l0,	%g3
	fmovdvc	%xcc,	%f23,	%f1
	srl	%o1,	%i2,	%g7
	fpackfix	%f12,	%f19
	orn	%l3,	%g6,	%i7
	movcs	%icc,	%i4,	%l4
	sethi	0x0A36,	%l6
	fmovsvc	%icc,	%f16,	%f1
	fcmpne16	%f6,	%f14,	%i1
	std	%f4,	[%l7 + 0x58]
	movpos	%xcc,	%g2,	%o7
	fzeros	%f23
	ldd	[%l7 + 0x60],	%i2
	andn	%o3,	0x19FE,	%l2
	fzeros	%f20
	andn	%i5,	0x1FF6,	%g5
	addc	%o0,	0x1E63,	%g1
	edge32ln	%i6,	%i0,	%g4
	edge8n	%o6,	%o5,	%o4
	popc	0x1CA6,	%l5
	nop
	set	0x18, %g1
	sth	%l1,	[%l7 + %g1]
	add	%o2,	%l0,	%g3
	move	%xcc,	%o1,	%g7
	stb	%l3,	[%l7 + 0x35]
	lduh	[%l7 + 0x6E],	%g6
	udiv	%i7,	0x0E39,	%i2
	fmovsn	%xcc,	%f26,	%f3
	edge16n	%i4,	%l6,	%l4
	or	%g2,	0x1B63,	%i1
	ldx	[%l7 + 0x18],	%o7
	edge8ln	%i3,	%l2,	%i5
	add	%o3,	0x1175,	%o0
	fmovdg	%icc,	%f17,	%f12
	fxnors	%f16,	%f9,	%f28
	movcc	%icc,	%g1,	%g5
	sdivcc	%i6,	0x1EC8,	%i0
	subccc	%o6,	%o5,	%g4
	add	%o4,	%l5,	%o2
	fmovsne	%xcc,	%f27,	%f28
	save %l0, 0x1877, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g3,	%g7,	%l3
	edge16l	%g6,	%i7,	%i2
	fmul8ulx16	%f0,	%f20,	%f30
	movneg	%xcc,	%i4,	%l6
	fmovrse	%o1,	%f26,	%f30
	fcmple32	%f8,	%f10,	%l4
	edge16l	%g2,	%i1,	%i3
	movrgz	%o7,	%i5,	%o3
	movrne	%o0,	%l2,	%g5
	movn	%icc,	%g1,	%i0
	xor	%i6,	0x0299,	%o6
	alignaddr	%g4,	%o5,	%o4
	alignaddr	%l5,	%o2,	%l0
	fpack32	%f26,	%f18,	%f8
	fmul8x16	%f21,	%f18,	%f18
	lduh	[%l7 + 0x48],	%g3
	sll	%l1,	0x01,	%g7
	fmovsn	%icc,	%f12,	%f24
	std	%f30,	[%l7 + 0x40]
	movneg	%xcc,	%l3,	%i7
	ldsh	[%l7 + 0x1A],	%i2
	movrne	%g6,	0x370,	%i4
	fpsub16s	%f20,	%f22,	%f14
	or	%l6,	0x134B,	%l4
	addc	%g2,	%o1,	%i1
	fmovde	%xcc,	%f26,	%f15
	movle	%xcc,	%i3,	%o7
	fcmple32	%f2,	%f2,	%i5
	edge32l	%o0,	%o3,	%l2
	orncc	%g1,	%i0,	%g5
	st	%f10,	[%l7 + 0x58]
	edge32	%o6,	%i6,	%g4
	ldsw	[%l7 + 0x58],	%o5
	fnot2	%f8,	%f2
	movcc	%xcc,	%o4,	%o2
	fmovsneg	%icc,	%f26,	%f26
	fmul8x16	%f13,	%f24,	%f28
	fpsub16	%f14,	%f2,	%f8
	orncc	%l5,	0x1A66,	%l0
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%f24
	ld	[%l7 + 0x4C],	%f4
	orncc	%g3,	%l1,	%l3
	edge8l	%i7,	%g7,	%i2
	umulcc	%g6,	%i4,	%l6
	edge16ln	%l4,	%g2,	%i1
	edge16	%i3,	%o7,	%i5
	edge16	%o0,	%o3,	%o1
	or	%l2,	%i0,	%g1
	ld	[%l7 + 0x10],	%f13
	movl	%xcc,	%o6,	%i6
	edge32n	%g4,	%g5,	%o5
	fnor	%f0,	%f6,	%f8
	edge32l	%o2,	%o4,	%l5
	array32	%g3,	%l1,	%l0
	edge16l	%i7,	%l3,	%i2
	alignaddrl	%g6,	%i4,	%g7
	movrlz	%l6,	0x221,	%g2
	edge16n	%i1,	%l4,	%i3
	movcs	%xcc,	%o7,	%i5
	edge8ln	%o0,	%o3,	%o1
	fornot1	%f24,	%f12,	%f28
	addcc	%l2,	0x0896,	%i0
	sethi	0x07F8,	%o6
	sra	%i6,	0x0A,	%g1
	xnor	%g5,	0x0322,	%o5
	for	%f8,	%f28,	%f6
	subccc	%o2,	0x1E14,	%g4
	udivcc	%l5,	0x0E40,	%g3
	movg	%xcc,	%o4,	%l0
	edge8	%i7,	%l3,	%i2
	mulscc	%l1,	%g6,	%i4
	sdiv	%g7,	0x1F8F,	%l6
	stb	%i1,	[%l7 + 0x11]
	sdiv	%l4,	0x033C,	%g2
	movg	%xcc,	%i3,	%i5
	orncc	%o0,	%o7,	%o1
	addc	%l2,	0x1DC8,	%i0
	sub	%o6,	0x03DE,	%o3
	sethi	0x0862,	%g1
	fcmpgt16	%f22,	%f4,	%g5
	add	%o5,	0x0DE1,	%o2
	sth	%g4,	[%l7 + 0x6A]
	movge	%xcc,	%i6,	%l5
	sdivx	%g3,	0x1697,	%l0
	movcc	%icc,	%i7,	%o4
	save %i2, %l1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i4,	[%l7 + 0x08]
	ldsh	[%l7 + 0x24],	%g7
	add	%l6,	0x164F,	%i1
	subccc	%g6,	%g2,	%i3
	xorcc	%l4,	%o0,	%i5
	fmovsa	%icc,	%f9,	%f0
	sra	%o7,	%l2,	%o1
	xnorcc	%o6,	0x0304,	%i0
	fandnot2s	%f14,	%f27,	%f2
	and	%g1,	0x06AB,	%o3
	srax	%o5,	0x15,	%g5
	fcmple32	%f14,	%f18,	%o2
	array8	%i6,	%l5,	%g3
	movre	%l0,	0x133,	%i7
	addcc	%g4,	0x1A49,	%i2
	sllx	%o4,	0x12,	%l1
	umul	%i4,	%g7,	%l6
	movgu	%xcc,	%l3,	%g6
	movcs	%xcc,	%i1,	%i3
	movleu	%icc,	%l4,	%o0
	fornot2s	%f4,	%f9,	%f11
	array8	%i5,	%o7,	%l2
	sethi	0x1A9F,	%g2
	subccc	%o6,	%i0,	%g1
	movre	%o3,	0x0E8,	%o5
	std	%f6,	[%l7 + 0x60]
	fnand	%f26,	%f22,	%f8
	udivx	%o1,	0x0437,	%g5
	xor	%o2,	0x0817,	%i6
	fxnor	%f12,	%f18,	%f26
	edge16	%l5,	%g3,	%l0
	stx	%g4,	[%l7 + 0x48]
	sdivx	%i2,	0x0F47,	%i7
	movrlz	%o4,	0x060,	%l1
	addccc	%i4,	0x1FF8,	%g7
	fnands	%f24,	%f14,	%f7
	fzeros	%f14
	edge16ln	%l6,	%g6,	%l3
	movrlez	%i3,	0x35D,	%l4
	save %o0, 0x001A, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f18,	%f14
	fmovda	%xcc,	%f21,	%f10
	popc	%i1,	%o7
	sdiv	%l2,	0x1FFA,	%o6
	udiv	%i0,	0x0D05,	%g1
	srlx	%g2,	%o5,	%o1
	subcc	%o3,	%g5,	%i6
	addc	%o2,	%l5,	%l0
	sdivcc	%g3,	0x0D11,	%g4
	movge	%icc,	%i2,	%i7
	edge16ln	%l1,	%i4,	%o4
	fmovdne	%xcc,	%f28,	%f3
	movcs	%xcc,	%g7,	%l6
	edge32n	%g6,	%i3,	%l4
	fnot1s	%f8,	%f18
	sdivcc	%o0,	0x1AA3,	%l3
	orn	%i5,	%i1,	%l2
	popc	%o6,	%o7
	sll	%g1,	0x12,	%i0
	movge	%xcc,	%o5,	%g2
	movrgz	%o1,	0x3C3,	%g5
	fmovsneg	%icc,	%f30,	%f7
	array8	%o3,	%o2,	%l5
	nop
	set	0x5E, %i3
	stb	%l0,	[%l7 + %i3]
	ldub	[%l7 + 0x4F],	%g3
	srl	%i6,	%g4,	%i7
	addcc	%i2,	%i4,	%o4
	edge8ln	%g7,	%l6,	%l1
	movre	%i3,	0x02D,	%g6
	andcc	%l4,	0x0DA7,	%l3
	movpos	%xcc,	%i5,	%i1
	edge8n	%o0,	%l2,	%o6
	movrgez	%g1,	0x2C7,	%o7
	fmovsvs	%xcc,	%f14,	%f14
	edge16n	%o5,	%i0,	%g2
	andcc	%o1,	%o3,	%o2
	umulcc	%l5,	%l0,	%g3
	movrlz	%g5,	0x2C4,	%g4
	sdivcc	%i6,	0x1716,	%i7
	movn	%icc,	%i4,	%i2
	edge32ln	%g7,	%o4,	%l6
	fornot2s	%f14,	%f26,	%f18
	fpadd32s	%f25,	%f6,	%f31
	movre	%i3,	%l1,	%l4
	fcmpd	%fcc3,	%f22,	%f8
	udivx	%l3,	0x1770,	%g6
	or	%i5,	%i1,	%l2
	edge8l	%o0,	%o6,	%o7
	movleu	%icc,	%o5,	%i0
	std	%f8,	[%l7 + 0x60]
	edge32l	%g2,	%g1,	%o1
	fmovsn	%xcc,	%f15,	%f24
	ldsh	[%l7 + 0x6A],	%o2
	std	%f24,	[%l7 + 0x78]
	orn	%l5,	%o3,	%g3
	array32	%g5,	%g4,	%i6
	ldsh	[%l7 + 0x2A],	%i7
	array32	%i4,	%l0,	%g7
	subccc	%i2,	%l6,	%o4
	udivx	%l1,	0x0935,	%l4
	udivcc	%i3,	0x147D,	%g6
	alignaddrl	%l3,	%i1,	%l2
	orcc	%o0,	%i5,	%o7
	fmovrdlz	%o5,	%f28,	%f20
	fmovsneg	%icc,	%f21,	%f29
	ldub	[%l7 + 0x47],	%o6
	stw	%i0,	[%l7 + 0x44]
	fmovdne	%xcc,	%f30,	%f14
	movpos	%icc,	%g1,	%g2
	movleu	%icc,	%o2,	%l5
	lduh	[%l7 + 0x34],	%o3
	nop
	set	0x18, %l3
	lduw	[%l7 + %l3],	%g3
	movrne	%o1,	0x16B,	%g5
	edge32	%g4,	%i7,	%i6
	xnorcc	%i4,	0x1D8D,	%l0
	ldd	[%l7 + 0x08],	%g6
	xnor	%l6,	%o4,	%i2
	xorcc	%l4,	%i3,	%g6
	ldx	[%l7 + 0x08],	%l3
	fmovrslez	%i1,	%f24,	%f10
	sllx	%l2,	0x11,	%o0
	nop
	set	0x3C, %l5
	ldub	[%l7 + %l5],	%i5
	sdivcc	%l1,	0x062E,	%o5
	udivcc	%o7,	0x15F6,	%i0
	movg	%xcc,	%o6,	%g2
	subccc	%g1,	%l5,	%o3
	array16	%o2,	%g3,	%o1
	ldsh	[%l7 + 0x32],	%g4
	array16	%g5,	%i7,	%i6
	movvc	%icc,	%l0,	%g7
	ldsb	[%l7 + 0x41],	%i4
	movrlez	%o4,	0x3C1,	%i2
	andn	%l4,	%i3,	%l6
	fnegd	%f28,	%f12
	sllx	%l3,	%g6,	%l2
	fnot2	%f10,	%f22
	fmovsl	%xcc,	%f10,	%f23
	subccc	%i1,	%o0,	%i5
	fornot1	%f8,	%f4,	%f10
	fcmpne16	%f30,	%f2,	%o5
	edge16	%l1,	%o7,	%o6
	ldx	[%l7 + 0x10],	%g2
	ldsh	[%l7 + 0x42],	%g1
	fmovsneg	%icc,	%f8,	%f22
	fmovsn	%xcc,	%f21,	%f18
	fmovdg	%xcc,	%f11,	%f10
	nop
	set	0x23, %o6
	ldub	[%l7 + %o6],	%i0
	ldx	[%l7 + 0x38],	%l5
	andcc	%o2,	%g3,	%o1
	movg	%xcc,	%o3,	%g5
	srlx	%i7,	%i6,	%l0
	array32	%g7,	%g4,	%o4
	sir	0x1A84
	edge8	%i4,	%i2,	%i3
	sethi	0x1D59,	%l4
	mulx	%l3,	0x1116,	%l6
	subc	%l2,	0x1F32,	%g6
	array32	%i1,	%o0,	%i5
	sdivx	%o5,	0x0039,	%o7
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	andcc	%g2,	%g1,	%l5
	fone	%f12
	popc	0x01F6,	%o2
	edge8ln	%i0,	%o1,	%o3
	edge16n	%g3,	%i7,	%g5
	sllx	%i6,	%l0,	%g4
	subccc	%o4,	%g7,	%i4
	array8	%i3,	%l4,	%i2
	addcc	%l3,	%l6,	%l2
	orn	%i1,	%o0,	%g6
	umulcc	%o5,	%i5,	%o7
	mova	%xcc,	%l1,	%g2
	fsrc1	%f0,	%f18
	fmovsvs	%xcc,	%f16,	%f0
	addccc	%g1,	%l5,	%o2
	orncc	%i0,	0x1613,	%o1
	fsrc1s	%f18,	%f3
	srax	%o6,	%o3,	%i7
	movcc	%xcc,	%g3,	%i6
	fmovrde	%l0,	%f6,	%f0
	fsrc2	%f2,	%f28
	array16	%g5,	%g4,	%g7
	fones	%f29
	umulcc	%o4,	%i3,	%i4
	movle	%icc,	%i2,	%l4
	mulx	%l6,	0x1CA4,	%l3
	movge	%icc,	%i1,	%o0
	fmovdneg	%icc,	%f5,	%f6
	xorcc	%l2,	0x0ACD,	%o5
	and	%i5,	%g6,	%l1
	movrgz	%g2,	%g1,	%l5
	fxor	%f12,	%f12,	%f0
	sth	%o2,	[%l7 + 0x1C]
	fnot2	%f2,	%f0
	movcs	%icc,	%o7,	%i0
	sdivx	%o1,	0x0732,	%o3
	subc	%i7,	%o6,	%g3
	fpadd32s	%f10,	%f1,	%f24
	std	%f4,	[%l7 + 0x48]
	stx	%l0,	[%l7 + 0x10]
	andncc	%i6,	%g5,	%g4
	fxor	%f30,	%f22,	%f8
	movpos	%xcc,	%g7,	%i3
	edge16ln	%i4,	%o4,	%i2
	fcmpne16	%f26,	%f2,	%l4
	srl	%l6,	%l3,	%o0
	restore %l2, %i1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g6,	0x24F,	%o5
	fnegs	%f7,	%f30
	xor	%l1,	%g1,	%g2
	edge32ln	%l5,	%o7,	%i0
	movrlez	%o1,	%o2,	%i7
	srax	%o6,	0x00,	%o3
	fzero	%f6
	movle	%xcc,	%l0,	%i6
	fpack32	%f8,	%f18,	%f4
	nop
	set	0x20, %i7
	stw	%g5,	[%l7 + %i7]
	orcc	%g3,	0x01E9,	%g7
	movvc	%xcc,	%i3,	%g4
	fcmps	%fcc0,	%f3,	%f23
	movrgz	%o4,	0x2CD,	%i4
	sdivx	%l4,	0x1CD6,	%i2
	orcc	%l6,	0x073E,	%l3
	stw	%o0,	[%l7 + 0x14]
	subcc	%l2,	%i1,	%g6
	sub	%i5,	%o5,	%l1
	andn	%g2,	0x0B7D,	%l5
	fnot1s	%f31,	%f20
	sth	%o7,	[%l7 + 0x52]
	bshuffle	%f22,	%f22,	%f18
	fmovdleu	%icc,	%f0,	%f11
	or	%i0,	%o1,	%o2
	ldsw	[%l7 + 0x68],	%i7
	orcc	%o6,	0x099E,	%g1
	andn	%o3,	0x11CC,	%i6
	addc	%g5,	%g3,	%g7
	bshuffle	%f0,	%f6,	%f30
	fmovdleu	%icc,	%f26,	%f4
	addcc	%i3,	0x0962,	%g4
	fmovsle	%icc,	%f4,	%f29
	edge32ln	%l0,	%o4,	%i4
	smulcc	%i2,	%l6,	%l3
	or	%o0,	%l4,	%i1
	array32	%l2,	%g6,	%o5
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	smulcc	%g2,	%i0,	%o7
	mulx	%o2,	0x112B,	%o1
	orncc	%i7,	0x1F2B,	%o6
	fmovdgu	%icc,	%f24,	%f28
	movneg	%icc,	%o3,	%g1
	xorcc	%i6,	0x16A1,	%g5
	movgu	%xcc,	%g3,	%i3
	add	%g4,	0x16A8,	%g7
	smulcc	%l0,	%i4,	%o4
	fones	%f19
	sth	%l6,	[%l7 + 0x2E]
	ld	[%l7 + 0x44],	%f2
	srl	%i2,	%o0,	%l3
	movrne	%l4,	%l2,	%g6
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%o4
	fnot1s	%f12,	%f24
	orncc	%i5,	%i1,	%l1
	smulcc	%l5,	%i0,	%o7
	edge16l	%o2,	%g2,	%o1
	ldd	[%l7 + 0x10],	%f26
	xorcc	%o6,	%i7,	%o3
	movrne	%i6,	%g5,	%g1
	movre	%g3,	0x3B5,	%g4
	add	%g7,	0x1A9D,	%i3
	smul	%i4,	%o4,	%l0
	edge16n	%i2,	%o0,	%l6
	movcs	%icc,	%l3,	%l4
	andcc	%l2,	0x064E,	%o5
	save %i5, %i1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g6,	0x06BC,	%i0
	sth	%o7,	[%l7 + 0x34]
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%l4
	mova	%icc,	%g2,	%o2
	sir	0x0D6A
	nop
	set	0x33, %o2
	ldub	[%l7 + %o2],	%o1
	smul	%i7,	0x04F4,	%o3
	subccc	%o6,	%g5,	%i6
	stx	%g1,	[%l7 + 0x30]
	andncc	%g3,	%g4,	%i3
	st	%f28,	[%l7 + 0x28]
	umul	%i4,	0x0328,	%g7
	fsrc1s	%f9,	%f21
	sdivx	%l0,	0x0F9C,	%o4
	fmuld8ulx16	%f26,	%f9,	%f10
	save %i2, 0x0C16, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l3,	%o0,	%l2
	subccc	%l4,	%i5,	%o5
	stb	%i1,	[%l7 + 0x6F]
	edge32l	%l1,	%i0,	%o7
	add	%g6,	%g2,	%o2
	fnegs	%f10,	%f30
	fmovsn	%xcc,	%f29,	%f29
	edge16	%l5,	%o1,	%o3
	fabsd	%f24,	%f6
	movle	%xcc,	%o6,	%g5
	edge16l	%i7,	%g1,	%i6
	andncc	%g4,	%i3,	%g3
	fmovrslz	%i4,	%f5,	%f21
	srlx	%l0,	%g7,	%o4
	save %l6, 0x1E57, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i2,	%l2,	%o0
	fmovsg	%xcc,	%f30,	%f29
	sllx	%l4,	%o5,	%i5
	st	%f14,	[%l7 + 0x38]
	std	%f10,	[%l7 + 0x30]
	sir	0x155F
	fcmped	%fcc0,	%f20,	%f14
	movrgz	%i1,	%i0,	%o7
	lduw	[%l7 + 0x6C],	%g6
	edge8	%l1,	%g2,	%o2
	edge32l	%l5,	%o3,	%o1
	mulscc	%g5,	%i7,	%o6
	sdivcc	%i6,	0x16A5,	%g4
	st	%f25,	[%l7 + 0x50]
	sth	%g1,	[%l7 + 0x40]
	alignaddr	%i3,	%g3,	%i4
	udivcc	%l0,	0x07F4,	%o4
	fmovsvs	%icc,	%f24,	%f30
	edge16ln	%l6,	%l3,	%g7
	movrne	%i2,	0x1DA,	%l2
	edge32	%l4,	%o5,	%o0
	array16	%i1,	%i5,	%i0
	sethi	0x0A62,	%o7
	orn	%g6,	%l1,	%o2
	srl	%l5,	0x03,	%g2
	fsrc2s	%f17,	%f0
	edge16ln	%o3,	%g5,	%o1
	udiv	%o6,	0x1C10,	%i7
	fmovsneg	%xcc,	%f18,	%f13
	sdiv	%g4,	0x1955,	%g1
	addc	%i6,	%i3,	%g3
	faligndata	%f4,	%f8,	%f26
	fmovdvc	%xcc,	%f28,	%f18
	sub	%l0,	%o4,	%i4
	edge8n	%l6,	%l3,	%i2
	fands	%f22,	%f18,	%f28
	fcmpes	%fcc2,	%f2,	%f5
	movge	%xcc,	%l2,	%g7
	sll	%o5,	%o0,	%l4
	edge32n	%i5,	%i0,	%o7
	smul	%i1,	0x18C8,	%l1
	fcmpgt32	%f30,	%f12,	%g6
	xnor	%o2,	%l5,	%g2
	sdiv	%g5,	0x1D18,	%o3
	edge8ln	%o6,	%o1,	%g4
	umulcc	%i7,	%i6,	%i3
	sll	%g1,	%l0,	%g3
	fpsub16s	%f19,	%f6,	%f21
	addc	%i4,	%l6,	%l3
	mova	%icc,	%o4,	%i2
	ldd	[%l7 + 0x18],	%l2
	fmovrdgez	%g7,	%f30,	%f2
	subcc	%o5,	%l4,	%i5
	nop
	set	0x46, %o1
	lduh	[%l7 + %o1],	%i0
	ld	[%l7 + 0x24],	%f4
	movrgez	%o0,	%o7,	%i1
	sdiv	%l1,	0x1BB2,	%o2
	fcmpne32	%f18,	%f16,	%g6
	edge8l	%g2,	%l5,	%o3
	smul	%g5,	%o1,	%o6
	movvs	%xcc,	%i7,	%i6
	popc	0x1285,	%g4
	fpack32	%f18,	%f6,	%f20
	movvs	%icc,	%i3,	%g1
	sir	0x0AC9
	xnorcc	%g3,	0x1582,	%i4
	movg	%xcc,	%l0,	%l3
	movrgz	%o4,	%l6,	%l2
	fabsd	%f8,	%f20
	umul	%i2,	%o5,	%g7
	sir	0x155C
	movge	%icc,	%i5,	%l4
	xor	%o0,	%i0,	%o7
	edge8n	%l1,	%i1,	%o2
	sub	%g6,	%g2,	%o3
	movge	%xcc,	%l5,	%g5
	lduw	[%l7 + 0x38],	%o6
	fcmple32	%f10,	%f6,	%o1
	edge8ln	%i7,	%i6,	%i3
	movre	%g1,	%g3,	%g4
	sdiv	%l0,	0x131A,	%i4
	std	%f30,	[%l7 + 0x40]
	nop
	set	0x18, %o3
	std	%f26,	[%l7 + %o3]
	mulscc	%l3,	0x1A59,	%l6
	movrlez	%l2,	0x3E2,	%i2
	sth	%o4,	[%l7 + 0x2A]
	mulx	%g7,	0x15E4,	%o5
	ldsw	[%l7 + 0x44],	%l4
	edge32ln	%o0,	%i5,	%o7
	fnand	%f4,	%f30,	%f12
	movrgez	%l1,	0x2C5,	%i1
	edge32l	%o2,	%g6,	%g2
	srl	%o3,	%i0,	%g5
	fexpand	%f10,	%f8
	edge16ln	%l5,	%o6,	%o1
	nop
	set	0x57, %i6
	ldsb	[%l7 + %i6],	%i7
	fmovsneg	%icc,	%f26,	%f29
	udivx	%i6,	0x0F20,	%i3
	fsrc1s	%f24,	%f7
	ldsh	[%l7 + 0x42],	%g1
	srax	%g3,	%g4,	%l0
	movge	%icc,	%l3,	%l6
	orn	%i4,	%l2,	%o4
	std	%f2,	[%l7 + 0x38]
	restore %i2, %o5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l4, 0x0F2C, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%o0,	%l1
	ld	[%l7 + 0x3C],	%f25
	orncc	%o7,	0x0743,	%i1
	smul	%g6,	0x1511,	%o2
	xor	%g2,	%o3,	%i0
	fmovdge	%icc,	%f28,	%f18
	edge8ln	%l5,	%o6,	%o1
	sdiv	%g5,	0x0E13,	%i6
	sdivcc	%i3,	0x1547,	%i7
	lduh	[%l7 + 0x46],	%g1
	sdiv	%g4,	0x0FB0,	%g3
	or	%l0,	%l6,	%i4
	fabsd	%f8,	%f12
	fcmpne16	%f20,	%f0,	%l3
	std	%f0,	[%l7 + 0x38]
	stx	%o4,	[%l7 + 0x70]
	smul	%i2,	0x0536,	%l2
	subcc	%g7,	0x1C77,	%l4
	orcc	%o5,	0x0ECC,	%o0
	nop
	set	0x20, %l2
	std	%f4,	[%l7 + %l2]
	ldsh	[%l7 + 0x08],	%i5
	fmovsg	%xcc,	%f7,	%f22
	orncc	%l1,	%o7,	%g6
	move	%xcc,	%o2,	%g2
	andncc	%i1,	%i0,	%o3
	edge16ln	%l5,	%o6,	%o1
	mova	%xcc,	%g5,	%i3
	move	%xcc,	%i6,	%i7
	fnors	%f25,	%f22,	%f17
	movn	%icc,	%g4,	%g3
	fmovdneg	%icc,	%f19,	%f12
	movrgez	%g1,	0x019,	%l0
	fzeros	%f31
	movrne	%l6,	0x006,	%l3
	movvc	%xcc,	%o4,	%i2
	fornot2	%f26,	%f22,	%f24
	fmovsl	%xcc,	%f31,	%f21
	addc	%l2,	0x0772,	%g7
	fornot1	%f16,	%f6,	%f28
	sub	%i4,	0x1C3E,	%o5
	lduh	[%l7 + 0x78],	%o0
	xorcc	%l4,	0x12DB,	%i5
	fmovdl	%xcc,	%f3,	%f11
	mulscc	%l1,	0x0EB4,	%o7
	movg	%icc,	%g6,	%g2
	fmovsleu	%xcc,	%f23,	%f11
	array32	%o2,	%i0,	%i1
	smul	%l5,	0x122D,	%o3
	subcc	%o1,	0x166E,	%o6
	edge16ln	%i3,	%g5,	%i7
	sra	%i6,	%g4,	%g3
	stw	%l0,	[%l7 + 0x60]
	xorcc	%g1,	0x0609,	%l3
	orn	%l6,	0x068E,	%i2
	fornot2s	%f6,	%f9,	%f12
	edge8	%l2,	%g7,	%i4
	sdivx	%o4,	0x0DD7,	%o5
	fornot1s	%f27,	%f22,	%f15
	movcs	%icc,	%l4,	%o0
	fmovdl	%xcc,	%f20,	%f24
	movpos	%icc,	%l1,	%i5
	sir	0x0D0D
	stx	%g6,	[%l7 + 0x20]
	move	%icc,	%g2,	%o2
	srax	%i0,	0x00,	%o7
	fmovrdgez	%i1,	%f4,	%f30
	fsrc1	%f20,	%f4
	sdiv	%l5,	0x1BF3,	%o3
	movrlz	%o6,	0x1F4,	%i3
	ldd	[%l7 + 0x60],	%o0
	fmovs	%f19,	%f11
	edge32n	%g5,	%i7,	%g4
	fone	%f8
	sra	%i6,	0x14,	%l0
	fandnot1	%f12,	%f26,	%f6
	sethi	0x15DA,	%g3
	xor	%g1,	%l3,	%i2
	subccc	%l2,	0x0155,	%l6
	edge8	%g7,	%o4,	%i4
	ldx	[%l7 + 0x10],	%o5
	ldd	[%l7 + 0x28],	%o0
	udivcc	%l4,	0x021D,	%i5
	movrlez	%l1,	0x28F,	%g2
	fnegs	%f5,	%f27
	xor	%o2,	%g6,	%o7
	udivcc	%i0,	0x03D2,	%i1
	movrne	%o3,	0x3CB,	%l5
	umulcc	%o6,	%i3,	%o1
	edge8n	%i7,	%g5,	%g4
	smulcc	%i6,	%l0,	%g1
	fmovsl	%xcc,	%f9,	%f0
	edge8l	%g3,	%l3,	%l2
	movge	%icc,	%l6,	%g7
	or	%o4,	0x101A,	%i2
	udiv	%o5,	0x1264,	%i4
	udivx	%o0,	0x12BF,	%l4
	fmovsn	%xcc,	%f14,	%f31
	movrgz	%i5,	0x180,	%g2
	fmovs	%f4,	%f4
	alignaddr	%l1,	%o2,	%o7
	smul	%i0,	%g6,	%o3
	movn	%xcc,	%i1,	%l5
	edge16	%i3,	%o6,	%o1
	save %g5, 0x1DB1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f18,	%f18,	%g4
	movre	%i6,	%l0,	%g1
	fmovdcc	%xcc,	%f26,	%f22
	edge8l	%l3,	%l2,	%g3
	edge32l	%l6,	%o4,	%i2
	umul	%g7,	0x1AB2,	%o5
	std	%f6,	[%l7 + 0x60]
	std	%f8,	[%l7 + 0x60]
	alignaddrl	%o0,	%i4,	%l4
	xnorcc	%g2,	0x1BF9,	%i5
	fpadd32s	%f23,	%f7,	%f15
	edge32l	%o2,	%o7,	%l1
	sth	%i0,	[%l7 + 0x12]
	stw	%g6,	[%l7 + 0x28]
	movge	%xcc,	%o3,	%l5
	fpack32	%f2,	%f8,	%f30
	ldx	[%l7 + 0x08],	%i3
	fmul8ulx16	%f4,	%f24,	%f22
	udivx	%o6,	0x0D73,	%i1
	ldx	[%l7 + 0x10],	%g5
	fmovdpos	%xcc,	%f29,	%f11
	ld	[%l7 + 0x44],	%f7
	and	%i7,	%g4,	%i6
	fxor	%f16,	%f20,	%f24
	movle	%icc,	%l0,	%g1
	fcmped	%fcc0,	%f14,	%f4
	fnot1	%f14,	%f24
	edge8l	%l3,	%l2,	%g3
	ldsh	[%l7 + 0x4C],	%l6
	sir	0x1914
	faligndata	%f24,	%f14,	%f18
	fmovrsgz	%o1,	%f3,	%f24
	movre	%o4,	%g7,	%o5
	movn	%xcc,	%i2,	%o0
	smul	%i4,	%l4,	%g2
	movrlez	%i5,	%o7,	%l1
	udivx	%o2,	0x0185,	%i0
	edge16	%g6,	%l5,	%o3
	movne	%icc,	%o6,	%i1
	edge16l	%g5,	%i7,	%g4
	edge32ln	%i3,	%i6,	%g1
	array16	%l0,	%l3,	%l2
	movleu	%icc,	%g3,	%l6
	fxnors	%f25,	%f9,	%f5
	fandnot1	%f0,	%f10,	%f8
	andcc	%o4,	%g7,	%o1
	edge8n	%i2,	%o0,	%o5
	srlx	%l4,	0x02,	%i4
	edge32ln	%i5,	%o7,	%g2
	umulcc	%o2,	0x1C1F,	%l1
	andn	%g6,	0x0D95,	%i0
	fmovsleu	%icc,	%f9,	%f8
	andncc	%l5,	%o3,	%o6
	srlx	%g5,	0x09,	%i7
	ldsh	[%l7 + 0x4E],	%i1
	srl	%i3,	%i6,	%g1
	movvs	%icc,	%g4,	%l0
	udiv	%l3,	0x098A,	%g3
	srl	%l6,	0x03,	%o4
	edge16ln	%g7,	%l2,	%i2
	edge8l	%o1,	%o0,	%o5
	array16	%i4,	%l4,	%i5
	ldsh	[%l7 + 0x3A],	%g2
	fnors	%f1,	%f27,	%f25
	fmovsgu	%icc,	%f10,	%f15
	ldx	[%l7 + 0x60],	%o2
	movn	%icc,	%l1,	%g6
	movl	%icc,	%o7,	%i0
	mulscc	%l5,	0x0CFF,	%o3
	subcc	%o6,	%i7,	%g5
	nop
	set	0x37, %g4
	ldub	[%l7 + %g4],	%i3
	movpos	%xcc,	%i1,	%i6
	smulcc	%g4,	%g1,	%l3
	fpsub16s	%f3,	%f9,	%f26
	movleu	%icc,	%l0,	%g3
	edge8ln	%l6,	%g7,	%l2
	edge32ln	%i2,	%o1,	%o4
	movpos	%icc,	%o0,	%i4
	edge16ln	%o5,	%i5,	%l4
	faligndata	%f14,	%f18,	%f18
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	fmovdcs	%xcc,	%f6,	%f26
	std	%f24,	[%l7 + 0x30]
	movpos	%xcc,	%g6,	%i0
	fcmpne16	%f28,	%f6,	%l5
	save %o7, %o6, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g5,	0x0578,	%i3
	ldsw	[%l7 + 0x24],	%i1
	movne	%xcc,	%o3,	%i6
	fpadd32	%f26,	%f10,	%f10
	sdivcc	%g1,	0x17ED,	%g4
	add	%l0,	0x0DF5,	%l3
	movrgz	%l6,	%g3,	%g7
	fors	%f27,	%f9,	%f3
	sdivcc	%l2,	0x00F1,	%o1
	and	%o4,	%i2,	%o0
	umul	%o5,	%i4,	%l4
	smulcc	%o2,	%l1,	%i5
	siam	0x1
	subc	%g2,	0x1A7F,	%g6
	fpackfix	%f18,	%f7
	movre	%l5,	0x317,	%o7
	edge32n	%i0,	%o6,	%i7
	fmovsgu	%xcc,	%f13,	%f0
	movleu	%icc,	%i3,	%i1
	and	%g5,	%o3,	%i6
	restore %g1, %l0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l3,	0x0717,	%l6
	andncc	%g7,	%l2,	%g3
	fornot2	%f18,	%f8,	%f12
	udivcc	%o1,	0x0E18,	%i2
	stx	%o0,	[%l7 + 0x10]
	movne	%xcc,	%o4,	%o5
	fone	%f12
	edge32n	%i4,	%l4,	%l1
	movpos	%xcc,	%o2,	%g2
	xnor	%g6,	%i5,	%o7
	stw	%i0,	[%l7 + 0x2C]
	siam	0x0
	edge8	%o6,	%l5,	%i7
	alignaddrl	%i1,	%g5,	%i3
	sra	%i6,	%g1,	%o3
	alignaddrl	%g4,	%l3,	%l6
	faligndata	%f0,	%f24,	%f20
	sth	%g7,	[%l7 + 0x3A]
	smul	%l2,	0x0D65,	%g3
	srlx	%o1,	0x1A,	%i2
	sdivx	%o0,	0x135F,	%o4
	fmovrde	%o5,	%f10,	%f2
	udivcc	%i4,	0x169E,	%l0
	edge16ln	%l4,	%l1,	%g2
	edge32ln	%g6,	%o2,	%i5
	for	%f18,	%f26,	%f22
	ldsb	[%l7 + 0x67],	%i0
	smul	%o6,	0x0F2A,	%l5
	fxor	%f2,	%f14,	%f22
	fmuld8sux16	%f12,	%f26,	%f4
	or	%i7,	%i1,	%o7
	fmul8x16al	%f12,	%f20,	%f4
	mulscc	%i3,	%g5,	%i6
	subccc	%o3,	0x0FAF,	%g1
	movge	%xcc,	%g4,	%l6
	sethi	0x1C32,	%g7
	movcc	%icc,	%l3,	%l2
	movvc	%icc,	%g3,	%o1
	ldsw	[%l7 + 0x18],	%o0
	edge8l	%o4,	%i2,	%o5
	fmul8x16al	%f15,	%f11,	%f16
	edge8l	%l0,	%i4,	%l4
	alignaddrl	%l1,	%g2,	%g6
	fmul8x16al	%f16,	%f13,	%f16
	movl	%xcc,	%i5,	%i0
	movrgez	%o6,	0x09A,	%o2
	fmovrde	%i7,	%f20,	%f8
	edge16n	%l5,	%o7,	%i1
	orcc	%g5,	%i3,	%o3
	stb	%i6,	[%l7 + 0x5F]
	fcmps	%fcc0,	%f9,	%f31
	ld	[%l7 + 0x24],	%f31
	fpackfix	%f30,	%f21
	stw	%g4,	[%l7 + 0x1C]
	subcc	%g1,	%l6,	%g7
	andncc	%l3,	%g3,	%o1
	and	%o0,	0x16BD,	%o4
	mulx	%i2,	0x1482,	%l2
	fors	%f26,	%f12,	%f20
	udivx	%l0,	0x1DF6,	%i4
	xorcc	%o5,	0x1033,	%l4
	sdiv	%l1,	0x10F9,	%g6
	addccc	%g2,	0x0B27,	%i0
	stb	%o6,	[%l7 + 0x1E]
	sdivcc	%o2,	0x0906,	%i5
	array8	%i7,	%o7,	%l5
	subcc	%g5,	0x0C63,	%i1
	addcc	%o3,	0x0DBF,	%i6
	alignaddrl	%i3,	%g4,	%l6
	lduh	[%l7 + 0x6C],	%g7
	edge16n	%l3,	%g1,	%g3
	movrlz	%o0,	%o1,	%i2
	movg	%xcc,	%o4,	%l0
	addccc	%l2,	%o5,	%i4
	array16	%l4,	%g6,	%l1
	udivx	%g2,	0x064B,	%i0
	orcc	%o6,	0x0ACF,	%o2
	edge32n	%i5,	%o7,	%l5
	ldx	[%l7 + 0x08],	%i7
	fsrc1s	%f12,	%f8
	ldub	[%l7 + 0x74],	%i1
	movge	%icc,	%g5,	%i6
	movleu	%xcc,	%o3,	%i3
	fmovdge	%icc,	%f12,	%f6
	movrlez	%l6,	%g4,	%l3
	subccc	%g1,	%g7,	%g3
	udivcc	%o0,	0x0E4C,	%o1
	popc	%o4,	%i2
	edge8n	%l0,	%o5,	%i4
	srl	%l2,	0x1E,	%g6
	movvs	%icc,	%l1,	%l4
	smulcc	%i0,	0x13AA,	%o6
	fmovsa	%xcc,	%f24,	%f22
	andncc	%o2,	%g2,	%i5
	edge8l	%l5,	%i7,	%o7
	addccc	%i1,	%i6,	%o3
	addccc	%i3,	0x1B67,	%l6
	movg	%icc,	%g4,	%l3
	movrlz	%g1,	0x046,	%g5
	movg	%icc,	%g3,	%o0
	lduw	[%l7 + 0x34],	%g7
	fmovsa	%icc,	%f22,	%f3
	xor	%o1,	0x0368,	%o4
	sdivcc	%i2,	0x12A2,	%l0
	movrlz	%i4,	%o5,	%l2
	move	%xcc,	%l1,	%l4
	fones	%f24
	fzeros	%f30
	sdivcc	%g6,	0x15EF,	%i0
	movvc	%xcc,	%o6,	%g2
	movle	%icc,	%i5,	%o2
	smulcc	%l5,	0x04FF,	%o7
	fandnot1s	%f21,	%f29,	%f3
	edge16n	%i1,	%i7,	%o3
	fpsub16s	%f16,	%f25,	%f17
	addcc	%i6,	%l6,	%g4
	fornot2	%f18,	%f6,	%f18
	lduh	[%l7 + 0x2C],	%i3
	stw	%l3,	[%l7 + 0x34]
	edge8n	%g5,	%g3,	%g1
	lduh	[%l7 + 0x72],	%g7
	xnorcc	%o0,	0x12A3,	%o4
	movrne	%i2,	0x3B5,	%l0
	movrlz	%i4,	%o1,	%o5
	ldub	[%l7 + 0x3F],	%l1
	movgu	%xcc,	%l4,	%g6
	movcc	%xcc,	%i0,	%o6
	sdivx	%l2,	0x0D80,	%g2
	edge32	%i5,	%o2,	%l5
	edge32ln	%i1,	%i7,	%o3
	ldx	[%l7 + 0x48],	%o7
	sdivx	%l6,	0x1340,	%i6
	movl	%icc,	%i3,	%l3
	movg	%xcc,	%g5,	%g4
	fmovrsgez	%g3,	%f11,	%f28
	movge	%icc,	%g1,	%g7
	fpackfix	%f26,	%f11
	fcmple32	%f24,	%f0,	%o4
	movre	%i2,	%l0,	%i4
	fsrc1	%f0,	%f24
	movrlz	%o0,	%o1,	%o5
	edge16	%l4,	%g6,	%l1
	fcmpd	%fcc2,	%f30,	%f12
	edge32n	%o6,	%l2,	%g2
	sir	0x059A
	movvs	%icc,	%i5,	%o2
	andn	%i0,	%i1,	%i7
	fmovdgu	%icc,	%f7,	%f29
	andcc	%o3,	0x0C22,	%o7
	st	%f21,	[%l7 + 0x0C]
	movcs	%icc,	%l6,	%i6
	movne	%xcc,	%l5,	%i3
	sllx	%g5,	0x12,	%l3
	edge8n	%g3,	%g4,	%g1
	orn	%o4,	0x0187,	%g7
	lduh	[%l7 + 0x3A],	%l0
	movneg	%xcc,	%i4,	%i2
	edge8n	%o0,	%o1,	%o5
	fpack16	%f18,	%f29
	subccc	%g6,	0x143E,	%l1
	nop
	set	0x0C, %o4
	ldsb	[%l7 + %o4],	%l4
	add	%l2,	0x0A7F,	%o6
	sethi	0x1AF0,	%g2
	addc	%o2,	%i5,	%i0
	ldub	[%l7 + 0x40],	%i1
	stw	%i7,	[%l7 + 0x40]
	fmovspos	%icc,	%f21,	%f28
	sub	%o3,	%o7,	%l6
	mulx	%i6,	%i3,	%g5
	fnot2	%f0,	%f2
	smulcc	%l3,	%l5,	%g4
	stw	%g3,	[%l7 + 0x6C]
	smul	%o4,	%g1,	%g7
	faligndata	%f14,	%f4,	%f22
	fmovs	%f20,	%f20
	fmovdge	%icc,	%f28,	%f7
	array32	%l0,	%i4,	%i2
	pdist	%f22,	%f6,	%f14
	fornot1s	%f22,	%f27,	%f31
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	ld	[%l7 + 0x28],	%f8
	movg	%xcc,	%o5,	%l1
	srl	%l4,	0x09,	%l2
	fpackfix	%f4,	%f8
	movg	%xcc,	%o6,	%g2
	fsrc1	%f20,	%f22
	edge16	%g6,	%i5,	%o2
	movne	%icc,	%i0,	%i7
	udivcc	%i1,	0x117C,	%o3
	subc	%o7,	%i6,	%l6
	nop
	set	0x7D, %i5
	ldsb	[%l7 + %i5],	%g5
	srl	%l3,	0x1D,	%l5
	addccc	%g4,	0x0161,	%g3
	subccc	%o4,	0x1172,	%i3
	mulx	%g1,	%g7,	%i4
	lduh	[%l7 + 0x08],	%i2
	fmul8ulx16	%f6,	%f16,	%f0
	movgu	%icc,	%o0,	%o1
	st	%f1,	[%l7 + 0x28]
	movcc	%icc,	%o5,	%l0
	edge16l	%l1,	%l4,	%o6
	ld	[%l7 + 0x3C],	%f12
	fmovdl	%xcc,	%f4,	%f8
	edge32ln	%l2,	%g2,	%i5
	fcmps	%fcc0,	%f15,	%f29
	fxnor	%f28,	%f6,	%f22
	movrgz	%g6,	0x354,	%i0
	xnor	%i7,	0x132E,	%o2
	fpsub16	%f28,	%f26,	%f0
	sll	%o3,	0x1E,	%i1
	fornot1	%f30,	%f18,	%f30
	fmovdle	%xcc,	%f0,	%f5
	sdivcc	%i6,	0x1D27,	%l6
	stw	%g5,	[%l7 + 0x60]
	ld	[%l7 + 0x24],	%f25
	movrne	%l3,	0x30E,	%o7
	edge16	%l5,	%g4,	%o4
	movvs	%icc,	%i3,	%g1
	movge	%icc,	%g7,	%i4
	smulcc	%i2,	0x0D24,	%g3
	st	%f15,	[%l7 + 0x20]
	fmovsle	%icc,	%f3,	%f9
	umulcc	%o1,	%o5,	%o0
	fnand	%f6,	%f8,	%f8
	srlx	%l1,	%l4,	%l0
	nop
	set	0x30, %i2
	sth	%o6,	[%l7 + %i2]
	fxors	%f28,	%f13,	%f1
	ldsb	[%l7 + 0x38],	%l2
	fxors	%f1,	%f4,	%f20
	umulcc	%i5,	%g6,	%g2
	movrgz	%i7,	%o2,	%o3
	sethi	0x0128,	%i1
	movl	%xcc,	%i0,	%l6
	edge32ln	%i6,	%l3,	%o7
	srl	%l5,	%g4,	%o4
	subccc	%g5,	%g1,	%g7
	movneg	%icc,	%i3,	%i2
	andncc	%g3,	%i4,	%o5
	addcc	%o1,	0x0B9E,	%o0
	fmovsneg	%xcc,	%f7,	%f2
	movl	%xcc,	%l1,	%l0
	array16	%l4,	%o6,	%l2
	movrlz	%i5,	%g6,	%i7
	sllx	%o2,	%o3,	%i1
	edge16n	%i0,	%g2,	%i6
	ldub	[%l7 + 0x14],	%l3
	umul	%o7,	%l5,	%g4
	subc	%o4,	%l6,	%g1
	edge16	%g7,	%i3,	%g5
	fsrc2s	%f6,	%f10
	movrgez	%i2,	%i4,	%g3
	movge	%xcc,	%o1,	%o5
	umul	%o0,	%l1,	%l4
	xor	%l0,	%l2,	%o6
	restore %i5, 0x0AED, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f27,	%f12
	srl	%o2,	0x12,	%g6
	andn	%o3,	%i1,	%i0
	save %i6, %l3, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f18,	%f14,	%f12
	edge8ln	%o7,	%g4,	%l5
	fnot2s	%f6,	%f7
	fmovsleu	%xcc,	%f4,	%f19
	fmovsge	%icc,	%f4,	%f5
	movre	%l6,	0x02E,	%o4
	fcmped	%fcc0,	%f4,	%f12
	movrgez	%g1,	%g7,	%i3
	subccc	%g5,	0x0F0A,	%i4
	fmovdle	%icc,	%f5,	%f9
	and	%g3,	%i2,	%o1
	movne	%icc,	%o0,	%l1
	movle	%xcc,	%l4,	%o5
	movge	%xcc,	%l0,	%o6
	stw	%i5,	[%l7 + 0x24]
	stb	%l2,	[%l7 + 0x55]
	fnors	%f20,	%f0,	%f26
	fandnot1	%f14,	%f30,	%f10
	stw	%i7,	[%l7 + 0x2C]
	movne	%xcc,	%g6,	%o3
	udivx	%i1,	0x027C,	%i0
	fnegs	%f22,	%f19
	fmovse	%icc,	%f14,	%f7
	smul	%i6,	0x0CC7,	%l3
	udivcc	%o2,	0x043A,	%o7
	edge8	%g4,	%l5,	%l6
	movpos	%xcc,	%o4,	%g2
	edge32l	%g7,	%i3,	%g1
	srlx	%i4,	%g3,	%g5
	sdivx	%o1,	0x1C98,	%o0
	ldx	[%l7 + 0x68],	%i2
	movvc	%xcc,	%l1,	%o5
	movge	%xcc,	%l4,	%l0
	edge32	%o6,	%i5,	%i7
	subcc	%l2,	%g6,	%i1
	siam	0x7
	ldd	[%l7 + 0x10],	%f24
	fmovdne	%icc,	%f25,	%f8
	movn	%xcc,	%i0,	%o3
	fmovsvc	%icc,	%f17,	%f22
	srl	%l3,	0x0F,	%o2
	subccc	%i6,	%o7,	%g4
	lduh	[%l7 + 0x24],	%l5
	edge32	%o4,	%g2,	%g7
	subccc	%l6,	%g1,	%i4
	orncc	%g3,	%g5,	%o1
	array32	%o0,	%i2,	%l1
	movrgez	%o5,	%l4,	%i3
	fpadd16s	%f1,	%f10,	%f10
	fmovdl	%icc,	%f6,	%f13
	srlx	%l0,	0x17,	%o6
	ldsw	[%l7 + 0x30],	%i5
	srax	%l2,	0x04,	%i7
	smul	%i1,	0x1463,	%i0
	nop
	set	0x2C, %o5
	ldsw	[%l7 + %o5],	%g6
	array8	%o3,	%o2,	%l3
	movrlez	%o7,	0x131,	%i6
	movvs	%xcc,	%l5,	%g4
	fnors	%f18,	%f17,	%f2
	fpmerge	%f0,	%f13,	%f24
	movpos	%xcc,	%g2,	%g7
	subccc	%l6,	%o4,	%g1
	mova	%xcc,	%i4,	%g5
	fsrc2s	%f0,	%f13
	edge16	%o1,	%o0,	%i2
	movg	%icc,	%g3,	%l1
	xnorcc	%l4,	0x02EC,	%o5
	movrgz	%i3,	0x11E,	%o6
	sir	0x02C9
	stb	%l0,	[%l7 + 0x1F]
	movrgz	%l2,	%i5,	%i7
	sra	%i1,	0x1C,	%i0
	movrgz	%g6,	%o2,	%o3
	movge	%icc,	%o7,	%i6
	xnor	%l3,	0x1960,	%g4
	udivcc	%l5,	0x0FD3,	%g2
	edge8ln	%g7,	%o4,	%l6
	movrne	%g1,	0x1BB,	%g5
	ld	[%l7 + 0x4C],	%f27
	fmovsn	%xcc,	%f7,	%f26
	ldub	[%l7 + 0x64],	%o1
	smulcc	%o0,	%i2,	%i4
	pdist	%f18,	%f6,	%f20
	save %l1, 0x139F, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g3,	%i3,	%o5
	edge8ln	%o6,	%l0,	%l2
	movge	%xcc,	%i7,	%i1
	andncc	%i0,	%i5,	%g6
	lduw	[%l7 + 0x1C],	%o3
	fcmpeq32	%f0,	%f24,	%o7
	sethi	0x1C17,	%o2
	sra	%l3,	%g4,	%l5
	udivx	%g2,	0x0182,	%g7
	andn	%i6,	0x0BAA,	%l6
	ldsw	[%l7 + 0x50],	%g1
	edge16ln	%g5,	%o1,	%o4
	fnegs	%f12,	%f5
	fmovrde	%i2,	%f24,	%f2
	std	%f24,	[%l7 + 0x58]
	fcmple16	%f10,	%f6,	%o0
	stw	%l1,	[%l7 + 0x14]
	movrlz	%i4,	%l4,	%i3
	movrgz	%o5,	0x080,	%o6
	fmovsvc	%icc,	%f26,	%f24
	std	%f8,	[%l7 + 0x70]
	sra	%l0,	0x08,	%g3
	movrgez	%l2,	%i7,	%i0
	lduw	[%l7 + 0x24],	%i1
	move	%icc,	%g6,	%o3
	andcc	%i5,	0x1C32,	%o2
	xorcc	%o7,	0x0260,	%l3
	fmul8x16	%f6,	%f10,	%f0
	edge32l	%l5,	%g2,	%g4
	array16	%i6,	%g7,	%g1
	movgu	%icc,	%l6,	%g5
	or	%o1,	%i2,	%o4
	alignaddrl	%l1,	%o0,	%i4
	edge32l	%l4,	%o5,	%i3
	ldsh	[%l7 + 0x6E],	%o6
	xnor	%l0,	0x025C,	%g3
	andn	%i7,	0x0BE6,	%i0
	sethi	0x0C9D,	%i1
	ldd	[%l7 + 0x58],	%f6
	ld	[%l7 + 0x10],	%f29
	sub	%g6,	0x17FB,	%o3
	and	%i5,	%o2,	%l2
	edge16n	%o7,	%l5,	%g2
	subcc	%l3,	0x1AC7,	%g4
	movvc	%xcc,	%i6,	%g1
	sub	%g7,	0x169D,	%l6
	movvs	%xcc,	%g5,	%o1
	fnands	%f20,	%f31,	%f28
	sll	%o4,	%l1,	%i2
	fpadd16s	%f15,	%f17,	%f12
	edge16n	%o0,	%l4,	%o5
	umulcc	%i4,	%i3,	%l0
	mulscc	%o6,	0x1B1E,	%g3
	movrlz	%i7,	0x0E7,	%i1
	movne	%xcc,	%g6,	%i0
	nop
	set	0x78, %g2
	lduw	[%l7 + %g2],	%i5
	movvc	%icc,	%o3,	%o2
	orn	%l2,	%o7,	%l5
	movvc	%icc,	%g2,	%g4
	udivx	%l3,	0x0B14,	%i6
	movn	%xcc,	%g1,	%l6
	smul	%g7,	%g5,	%o1
	fmovrsne	%o4,	%f13,	%f12
	ld	[%l7 + 0x54],	%f2
	save %l1, 0x13B8, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x64],	%i2
	movn	%xcc,	%o5,	%l4
	movrlez	%i4,	0x1D9,	%l0
	movrlz	%i3,	0x058,	%g3
	ldd	[%l7 + 0x78],	%f26
	move	%xcc,	%i7,	%o6
	sth	%g6,	[%l7 + 0x44]
	fcmpgt16	%f28,	%f14,	%i0
	alignaddr	%i5,	%o3,	%i1
	xnorcc	%o2,	0x1B0F,	%l2
	fones	%f14
	fsrc2s	%f22,	%f5
	fpmerge	%f30,	%f27,	%f10
	edge32l	%o7,	%l5,	%g2
	udivx	%g4,	0x175E,	%i6
	fmovrslz	%l3,	%f27,	%f29
	smulcc	%l6,	%g1,	%g7
	ldd	[%l7 + 0x28],	%g4
	std	%f6,	[%l7 + 0x10]
	fxors	%f8,	%f14,	%f21
	edge16	%o1,	%o4,	%o0
	edge8	%i2,	%l1,	%l4
	sdiv	%i4,	0x01FE,	%o5
	and	%l0,	0x0FF6,	%i3
	ldd	[%l7 + 0x40],	%f28
	movrgz	%g3,	%i7,	%o6
	xor	%i0,	%g6,	%o3
	movre	%i5,	%i1,	%l2
	edge32	%o2,	%o7,	%g2
	ld	[%l7 + 0x10],	%f27
	addccc	%l5,	%i6,	%l3
	edge8n	%l6,	%g1,	%g4
	andn	%g7,	0x1318,	%g5
	sdiv	%o4,	0x0874,	%o0
	fmovdle	%xcc,	%f6,	%f8
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	addccc	%l4,	%i4,	%l1
	movl	%icc,	%o5,	%i3
	and	%g3,	0x1A0F,	%i7
	sub	%l0,	0x02FA,	%i0
	mulscc	%g6,	%o3,	%i5
	ldub	[%l7 + 0x23],	%o6
	addccc	%l2,	%o2,	%o7
	movgu	%xcc,	%i1,	%l5
	fmul8x16	%f3,	%f14,	%f14
	ldd	[%l7 + 0x58],	%f16
	fcmpne16	%f0,	%f2,	%i6
	sllx	%l3,	0x1B,	%l6
	ldd	[%l7 + 0x30],	%g0
	movvs	%xcc,	%g2,	%g7
	popc	%g4,	%g5
	array8	%o0,	%i2,	%o4
	fmovdgu	%xcc,	%f23,	%f14
	subcc	%o1,	0x01D3,	%i4
	andncc	%l4,	%o5,	%i3
	add	%g3,	%i7,	%l0
	edge16	%l1,	%g6,	%o3
	umul	%i5,	0x0098,	%o6
	array16	%l2,	%i0,	%o2
	edge8ln	%o7,	%l5,	%i1
	ldx	[%l7 + 0x58],	%i6
	udiv	%l6,	0x11E8,	%l3
	edge8ln	%g1,	%g2,	%g7
	andncc	%g4,	%o0,	%i2
	restore %o4, 0x086C, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x50, %o0
	stx	%i4,	[%l7 + %o0]
	ldd	[%l7 + 0x38],	%o0
	stx	%l4,	[%l7 + 0x08]
	movvs	%xcc,	%o5,	%i3
	fmovdge	%xcc,	%f23,	%f12
	fmovrdlz	%g3,	%f26,	%f14
	fmovsleu	%xcc,	%f6,	%f6
	save %l0, 0x0C0E, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f0,	%f30,	%f4
	fpackfix	%f16,	%f18
	movle	%xcc,	%i7,	%g6
	addccc	%o3,	%o6,	%i5
	fmovdcs	%icc,	%f29,	%f24
	smul	%l2,	0x148D,	%i0
	stw	%o7,	[%l7 + 0x20]
	fnands	%f10,	%f13,	%f28
	udiv	%l5,	0x0C35,	%o2
	fmovsgu	%icc,	%f17,	%f24
	lduw	[%l7 + 0x10],	%i6
	nop
	set	0x60, %g5
	ldsb	[%l7 + %g5],	%l6
	lduw	[%l7 + 0x3C],	%l3
	fpsub32s	%f26,	%f16,	%f7
	sdiv	%g1,	0x117E,	%i1
	fmovdcs	%xcc,	%f10,	%f27
	smul	%g2,	0x0322,	%g4
	movleu	%xcc,	%o0,	%i2
	edge16ln	%g7,	%o4,	%i4
	sra	%g5,	0x08,	%o1
	movrgez	%l4,	0x164,	%i3
	fxor	%f26,	%f10,	%f22
	or	%g3,	0x1E67,	%o5
	or	%l1,	%i7,	%l0
	orcc	%g6,	0x02C7,	%o3
	movgu	%icc,	%o6,	%i5
	udivcc	%i0,	0x196C,	%o7
	ldsh	[%l7 + 0x36],	%l5
	edge32	%l2,	%o2,	%l6
	subcc	%l3,	%g1,	%i1
	fabsd	%f28,	%f10
	array8	%g2,	%i6,	%o0
	movrgz	%i2,	%g7,	%o4
	movrgez	%g4,	%i4,	%o1
	sra	%l4,	0x01,	%g5
	movrgez	%i3,	%o5,	%g3
	nop
	set	0x40, %i4
	ldx	[%l7 + %i4],	%i7
	movn	%xcc,	%l0,	%l1
	movcc	%icc,	%g6,	%o6
	orn	%i5,	0x07D8,	%i0
	ldsw	[%l7 + 0x5C],	%o3
	fnands	%f0,	%f15,	%f27
	fmovrdlez	%o7,	%f12,	%f20
	movrgez	%l2,	0x260,	%o2
	fnegd	%f0,	%f8
	smul	%l6,	%l3,	%l5
	fmovrde	%i1,	%f22,	%f26
	edge32	%g2,	%i6,	%g1
	xor	%i2,	0x10F4,	%g7
	edge16l	%o4,	%o0,	%g4
	xor	%o1,	0x0220,	%l4
	edge8l	%i4,	%g5,	%o5
	movpos	%xcc,	%g3,	%i7
	subc	%i3,	0x1A9E,	%l1
	move	%icc,	%l0,	%g6
	std	%f22,	[%l7 + 0x48]
	addc	%i5,	%i0,	%o6
	fmovrse	%o7,	%f8,	%f29
	srax	%o3,	%o2,	%l2
	orn	%l3,	0x1F23,	%l6
	array16	%i1,	%g2,	%l5
	sir	0x0DBF
	fcmpd	%fcc0,	%f12,	%f16
	andn	%i6,	%i2,	%g7
	edge8l	%g1,	%o4,	%o0
	movvc	%icc,	%g4,	%o1
	orncc	%l4,	0x14F4,	%i4
	add	%g5,	0x1FB5,	%g3
	fnegs	%f1,	%f14
	movg	%icc,	%i7,	%i3
	edge32ln	%o5,	%l0,	%g6
	andncc	%i5,	%l1,	%i0
	alignaddr	%o7,	%o3,	%o6
	std	%f24,	[%l7 + 0x08]
	movrgez	%o2,	%l3,	%l6
	array32	%i1,	%l2,	%l5
	movle	%xcc,	%i6,	%i2
	fnand	%f26,	%f24,	%f10
	sra	%g2,	0x1F,	%g1
	addccc	%o4,	0x0D44,	%g7
	fcmpgt16	%f24,	%f12,	%g4
	fmovs	%f13,	%f1
	fpackfix	%f0,	%f0
	fmovrslez	%o1,	%f31,	%f14
	add	%o0,	0x00B5,	%l4
	fmovscc	%icc,	%f24,	%f4
	mova	%icc,	%g5,	%g3
	mulscc	%i7,	0x03C5,	%i4
	fmul8x16	%f8,	%f2,	%f4
	fpsub16	%f28,	%f26,	%f16
	sdivx	%i3,	0x06F6,	%o5
	umulcc	%g6,	0x1260,	%i5
	srlx	%l1,	0x09,	%l0
	edge32	%o7,	%i0,	%o6
	sdiv	%o2,	0x126D,	%o3
	edge32n	%l3,	%i1,	%l2
	ldsh	[%l7 + 0x34],	%l5
	movn	%icc,	%l6,	%i2
	movvc	%xcc,	%g2,	%g1
	ldd	[%l7 + 0x08],	%f28
	xnor	%o4,	%i6,	%g7
	fmovsl	%xcc,	%f18,	%f15
	edge16l	%o1,	%o0,	%g4
	smul	%g5,	0x0792,	%g3
	fmovdgu	%xcc,	%f19,	%f27
	umulcc	%i7,	%i4,	%i3
	sdivx	%l4,	0x0417,	%o5
	movrlez	%g6,	0x04D,	%l1
	fornot2s	%f2,	%f23,	%f4
	smul	%l0,	0x0EE1,	%i5
	edge32	%o7,	%i0,	%o6
	subc	%o2,	%l3,	%i1
	fmovscc	%xcc,	%f26,	%f14
	xnorcc	%o3,	0x1694,	%l2
	movg	%xcc,	%l5,	%i2
	nop
	set	0x2F, %i1
	stb	%l6,	[%l7 + %i1]
	movne	%icc,	%g2,	%o4
	or	%i6,	%g7,	%g1
	fmuld8sux16	%f7,	%f8,	%f30
	sethi	0x038B,	%o1
	addccc	%o0,	0x06E2,	%g5
	save %g3, 0x04E6, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g4,	0x15EC,	%i3
	fnor	%f2,	%f26,	%f2
	sllx	%l4,	%i4,	%o5
	subccc	%l1,	0x0062,	%g6
	fmovsle	%icc,	%f5,	%f23
	mulx	%i5,	0x1282,	%o7
	andcc	%i0,	%l0,	%o2
	edge16	%o6,	%l3,	%o3
	movgu	%icc,	%i1,	%l2
	edge16	%l5,	%i2,	%g2
	fand	%f6,	%f26,	%f4
	orncc	%o4,	0x1F6B,	%i6
	sth	%l6,	[%l7 + 0x10]
	or	%g1,	%g7,	%o0
	array16	%o1,	%g5,	%g3
	movcc	%xcc,	%g4,	%i7
	fmovrslez	%i3,	%f4,	%f11
	xorcc	%l4,	0x1750,	%o5
	sethi	0x169E,	%l1
	orn	%g6,	%i5,	%i4
	movg	%icc,	%i0,	%l0
	alignaddrl	%o2,	%o7,	%o6
	lduw	[%l7 + 0x34],	%l3
	movcs	%xcc,	%o3,	%i1
	orcc	%l2,	0x15AD,	%l5
	movcc	%xcc,	%g2,	%o4
	ldsw	[%l7 + 0x54],	%i6
	movg	%xcc,	%i2,	%l6
	edge16ln	%g7,	%o0,	%g1
	fmovscs	%xcc,	%f29,	%f8
	edge32ln	%g5,	%g3,	%g4
	subcc	%o1,	0x1E9F,	%i7
	fors	%f8,	%f23,	%f20
	sir	0x0D7C
	sth	%i3,	[%l7 + 0x54]
	addc	%o5,	0x176D,	%l1
	alignaddrl	%g6,	%l4,	%i5
	ldsw	[%l7 + 0x58],	%i4
	edge8	%i0,	%o2,	%o7
	sll	%l0,	0x18,	%o6
	movre	%o3,	%l3,	%l2
	edge16l	%i1,	%l5,	%g2
	movvs	%icc,	%o4,	%i2
	std	%f30,	[%l7 + 0x50]
	fcmple32	%f16,	%f28,	%l6
	fnegd	%f2,	%f20
	movleu	%icc,	%i6,	%g7
	fcmpes	%fcc1,	%f30,	%f7
	movvs	%icc,	%o0,	%g1
	mulx	%g3,	0x14F7,	%g4
	stb	%g5,	[%l7 + 0x40]
	add	%o1,	0x15A3,	%i3
	edge8l	%o5,	%i7,	%l1
	movn	%xcc,	%g6,	%l4
	ldd	[%l7 + 0x08],	%f4
	movvc	%xcc,	%i4,	%i5
	fandnot1	%f18,	%f10,	%f24
	xorcc	%i0,	0x16F9,	%o7
	sra	%o2,	0x04,	%l0
	ldsh	[%l7 + 0x5A],	%o3
	fmovde	%icc,	%f16,	%f13
	stx	%l3,	[%l7 + 0x10]
	umul	%l2,	0x0E90,	%o6
	fxnors	%f13,	%f20,	%f7
	edge16	%i1,	%g2,	%l5
	sdivx	%o4,	0x1A18,	%l6
	and	%i2,	%g7,	%o0
	edge8l	%g1,	%g3,	%i6
	fpadd16s	%f2,	%f7,	%f30
	fcmpes	%fcc3,	%f8,	%f5
	movvc	%icc,	%g5,	%g4
	movpos	%xcc,	%o1,	%i3
	orcc	%i7,	0x0688,	%l1
	movgu	%icc,	%g6,	%o5
	std	%f6,	[%l7 + 0x50]
	fnot2s	%f17,	%f13
	movvc	%icc,	%i4,	%l4
	edge32n	%i5,	%o7,	%o2
	mulscc	%i0,	%l0,	%o3
	fmovdne	%icc,	%f4,	%f19
	edge16	%l2,	%l3,	%o6
	movl	%xcc,	%g2,	%l5
	edge8	%i1,	%l6,	%o4
	fcmple32	%f10,	%f28,	%g7
	fcmpgt16	%f22,	%f18,	%i2
	or	%o0,	0x1A66,	%g1
	edge32l	%g3,	%i6,	%g4
	ld	[%l7 + 0x14],	%f20
	sethi	0x070F,	%g5
	movle	%xcc,	%o1,	%i7
	edge16ln	%l1,	%g6,	%i3
	movvs	%icc,	%o5,	%l4
	alignaddr	%i4,	%o7,	%o2
	fzero	%f6
	fnegs	%f13,	%f13
	fmovdge	%icc,	%f26,	%f1
	addccc	%i0,	%l0,	%i5
	edge8ln	%l2,	%o3,	%l3
	sll	%o6,	%g2,	%l5
	xorcc	%i1,	%l6,	%o4
	smul	%i2,	%o0,	%g1
	std	%f0,	[%l7 + 0x68]
	udivcc	%g7,	0x0E8D,	%i6
	srlx	%g4,	0x07,	%g5
	movneg	%icc,	%o1,	%g3
	movgu	%icc,	%i7,	%g6
	st	%f13,	[%l7 + 0x1C]
	movgu	%icc,	%l1,	%o5
	movleu	%xcc,	%i3,	%l4
	fands	%f29,	%f21,	%f0
	ldsw	[%l7 + 0x20],	%i4
	edge16n	%o7,	%o2,	%l0
	movneg	%xcc,	%i0,	%l2
	fzeros	%f12
	fnors	%f14,	%f8,	%f9
	edge16	%i5,	%o3,	%l3
	and	%o6,	%l5,	%g2
	subc	%i1,	%o4,	%i2
	movcc	%icc,	%l6,	%o0
	movpos	%icc,	%g7,	%i6
	movge	%icc,	%g1,	%g4
	std	%f10,	[%l7 + 0x20]
	nop
	set	0x1A, %i0
	sth	%o1,	[%l7 + %i0]
	ldub	[%l7 + 0x6B],	%g3
	fmovrsgz	%g5,	%f19,	%f6
	siam	0x7
	movrlez	%g6,	%i7,	%l1
	movne	%icc,	%o5,	%l4
	fnot2s	%f3,	%f25
	std	%f10,	[%l7 + 0x40]
	fmovrsgz	%i3,	%f16,	%f3
	movle	%icc,	%i4,	%o7
	sll	%o2,	%l0,	%i0
	fmovdgu	%icc,	%f13,	%f19
	fmovse	%icc,	%f17,	%f14
	xnorcc	%i5,	0x05B5,	%l2
	st	%f15,	[%l7 + 0x14]
	sub	%l3,	0x0D9C,	%o6
	edge8l	%o3,	%l5,	%g2
	smul	%i1,	%o4,	%l6
	stw	%i2,	[%l7 + 0x6C]
	subc	%o0,	%i6,	%g1
	fzero	%f6
	fmovsvs	%xcc,	%f2,	%f4
	fmovsleu	%icc,	%f21,	%f23
	alignaddr	%g7,	%o1,	%g4
	edge32	%g3,	%g6,	%i7
	edge16ln	%g5,	%l1,	%o5
	fmovdleu	%xcc,	%f31,	%f13
	movvc	%xcc,	%i3,	%l4
	fmovdvs	%xcc,	%f5,	%f18
	fmovrdgez	%i4,	%f24,	%f22
	bshuffle	%f8,	%f8,	%f14
	srl	%o2,	%o7,	%i0
	srlx	%l0,	%l2,	%l3
	fsrc2	%f4,	%f18
	fcmpes	%fcc2,	%f12,	%f5
	alignaddr	%i5,	%o3,	%o6
	lduw	[%l7 + 0x7C],	%l5
	orcc	%i1,	0x0C53,	%o4
	alignaddrl	%l6,	%i2,	%g2
	edge8	%i6,	%o0,	%g1
	movvs	%xcc,	%o1,	%g4
	fmovsle	%icc,	%f12,	%f15
	nop
	set	0x4E, %l6
	lduh	[%l7 + %l6],	%g3
	orcc	%g7,	0x0CA4,	%g6
	array16	%g5,	%l1,	%o5
	subccc	%i3,	0x0E0F,	%i7
	edge8ln	%i4,	%l4,	%o2
	xnor	%i0,	%l0,	%l2
	fcmps	%fcc3,	%f26,	%f4
	movcs	%xcc,	%o7,	%l3
	sethi	0x1690,	%o3
	fpadd16	%f24,	%f14,	%f20
	move	%xcc,	%i5,	%l5
	lduw	[%l7 + 0x10],	%i1
	fcmple16	%f6,	%f12,	%o6
	movg	%xcc,	%l6,	%o4
	fmovrsne	%g2,	%f31,	%f16
	std	%f22,	[%l7 + 0x28]
	nop
	set	0x4B, %g3
	ldsb	[%l7 + %g3],	%i2
	fmovde	%icc,	%f6,	%f15
	movrgz	%i6,	%g1,	%o1
	srax	%o0,	%g3,	%g7
	subc	%g6,	%g5,	%l1
	fandnot2	%f18,	%f28,	%f4
	fones	%f8
	umul	%g4,	%o5,	%i3
	fmovrdgz	%i4,	%f4,	%f12
	xor	%i7,	%l4,	%o2
	fmovdcs	%icc,	%f9,	%f6
	movle	%xcc,	%l0,	%l2
	movpos	%icc,	%o7,	%l3
	movneg	%icc,	%i0,	%o3
	fpmerge	%f28,	%f31,	%f30
	xor	%l5,	%i1,	%i5
	edge8n	%o6,	%o4,	%l6
	edge16n	%g2,	%i2,	%g1
	sub	%i6,	%o1,	%o0
	edge8	%g7,	%g3,	%g6
	edge16ln	%g5,	%g4,	%o5
	fcmpne32	%f24,	%f0,	%l1
	move	%icc,	%i3,	%i7
	movvs	%xcc,	%l4,	%i4
	fmovrsgz	%l0,	%f22,	%f5
	mulscc	%l2,	%o2,	%o7
	fmovsneg	%xcc,	%f19,	%f21
	pdist	%f24,	%f10,	%f26
	movpos	%xcc,	%l3,	%o3
	fmovdg	%xcc,	%f15,	%f14
	ldsb	[%l7 + 0x49],	%l5
	umulcc	%i1,	%i0,	%i5
	array16	%o6,	%o4,	%l6
	movcc	%icc,	%g2,	%i2
	ldub	[%l7 + 0x22],	%g1
	movrne	%i6,	%o0,	%o1
	sdiv	%g7,	0x1FE9,	%g3
	ldd	[%l7 + 0x50],	%f8
	fcmpd	%fcc0,	%f8,	%f8
	edge32ln	%g6,	%g5,	%o5
	fmovdcc	%xcc,	%f30,	%f21
	movcc	%xcc,	%l1,	%i3
	udiv	%i7,	0x1860,	%g4
	ldsh	[%l7 + 0x12],	%l4
	fmul8x16	%f24,	%f10,	%f16
	fmuld8ulx16	%f18,	%f18,	%f20
	sll	%i4,	0x06,	%l0
	edge16n	%l2,	%o2,	%l3
	edge32	%o7,	%l5,	%o3
	array32	%i0,	%i1,	%o6
	movgu	%xcc,	%o4,	%l6
	sdivcc	%i5,	0x00F7,	%g2
	array16	%i2,	%i6,	%o0
	mova	%icc,	%o1,	%g1
	fmovdpos	%icc,	%f4,	%f18
	edge16ln	%g3,	%g6,	%g5
	fmovspos	%xcc,	%f23,	%f29
	fnegd	%f16,	%f10
	edge32	%g7,	%l1,	%o5
	sllx	%i3,	%i7,	%g4
	movvc	%icc,	%i4,	%l0
	movg	%xcc,	%l2,	%l4
	save %o2, 0x13EA, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0718,	%o7
	sir	0x086A
	fmovde	%xcc,	%f11,	%f7
	andncc	%l5,	%i0,	%i1
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	move	%icc,	%i5,	%l6
	sir	0x0407
	orncc	%i2,	0x1767,	%g2
	ld	[%l7 + 0x08],	%f16
	sra	%o0,	%i6,	%g1
	fand	%f24,	%f28,	%f30
	sethi	0x090C,	%o1
	fmovrdne	%g6,	%f20,	%f20
	subcc	%g3,	%g7,	%g5
	smulcc	%o5,	%l1,	%i7
	edge16ln	%i3,	%i4,	%l0
	sdivcc	%l2,	0x08F7,	%g4
	subccc	%l4,	%l3,	%o2
	sllx	%l5,	0x14,	%o7
	fcmple16	%f28,	%f8,	%i1
	fcmpne32	%f30,	%f28,	%o6
	fnegd	%f14,	%f16
	fmul8x16	%f27,	%f14,	%f16
	add	%o3,	%i0,	%i5
	ldsh	[%l7 + 0x72],	%l6
	fxnor	%f2,	%f30,	%f26
	ld	[%l7 + 0x18],	%f12
	udivcc	%i2,	0x1428,	%o4
	or	%o0,	0x0CFF,	%i6
	save %g1, 0x1647, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f22,	%f30,	%f29
	edge8	%o1,	%g3,	%g7
	movne	%icc,	%g5,	%o5
	movcs	%xcc,	%l1,	%g6
	sll	%i7,	0x0D,	%i3
	fmovrslz	%i4,	%f29,	%f15
	fpadd16	%f16,	%f18,	%f30
	array16	%l0,	%g4,	%l4
	movrgez	%l3,	0x2B4,	%o2
	subcc	%l2,	0x0070,	%o7
	umul	%i1,	0x1B02,	%o6
	stx	%l5,	[%l7 + 0x30]
	movcc	%icc,	%i0,	%o3
	movcc	%icc,	%l6,	%i5
	ldsh	[%l7 + 0x7A],	%o4
	or	%o0,	0x0D3A,	%i6
	fmovsg	%icc,	%f6,	%f18
	movn	%icc,	%i2,	%g2
	andn	%o1,	0x0D36,	%g1
	fabsd	%f4,	%f6
	fnot2s	%f17,	%f1
	edge16ln	%g7,	%g3,	%g5
	fmovdvc	%icc,	%f9,	%f19
	edge32	%o5,	%g6,	%i7
	addcc	%i3,	%i4,	%l0
	ldd	[%l7 + 0x20],	%l0
	std	%f12,	[%l7 + 0x28]
	movgu	%icc,	%l4,	%g4
	edge32l	%l3,	%o2,	%l2
	movcs	%xcc,	%i1,	%o7
	andcc	%l5,	%o6,	%i0
	movrlez	%l6,	0x1EC,	%i5
	movcs	%icc,	%o4,	%o3
	udivx	%i6,	0x0E42,	%o0
	xnor	%g2,	%i2,	%g1
	st	%f14,	[%l7 + 0x74]
	fzero	%f14
	fmovdgu	%icc,	%f24,	%f10
	popc	%o1,	%g3
	sdivcc	%g5,	0x04BF,	%g7
	mulscc	%o5,	0x1912,	%g6
	fpadd32	%f28,	%f18,	%f14
	movvc	%xcc,	%i7,	%i4
	ldsw	[%l7 + 0x50],	%l0
	udivx	%l1,	0x03B3,	%l4
	movle	%xcc,	%i3,	%l3
	fpadd32s	%f1,	%f16,	%f13
	udiv	%o2,	0x1E81,	%l2
	ldd	[%l7 + 0x20],	%g4
	ldsw	[%l7 + 0x34],	%i1
	fandnot2s	%f23,	%f28,	%f8
	fmovdle	%icc,	%f11,	%f17
	movcs	%icc,	%o7,	%o6
	restore %l5, %l6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o4,	%o3,	%i6
	sll	%o0,	0x1C,	%g2
	fzeros	%f14
	alignaddrl	%i2,	%i0,	%o1
	ldsh	[%l7 + 0x58],	%g3
	alignaddrl	%g5,	%g1,	%o5
	addcc	%g7,	%i7,	%i4
	ldsw	[%l7 + 0x3C],	%g6
	umul	%l1,	0x10A4,	%l4
	fmovdcs	%xcc,	%f27,	%f23
	orcc	%i3,	0x0DB7,	%l0
	and	%l3,	%l2,	%o2
	lduh	[%l7 + 0x0C],	%g4
	edge16ln	%o7,	%o6,	%i1
	movrlez	%l6,	0x064,	%i5
	srl	%l5,	0x06,	%o4
	movrne	%i6,	0x057,	%o0
	fmovrsne	%g2,	%f21,	%f13
	movl	%xcc,	%i2,	%o3
	fpmerge	%f5,	%f28,	%f24
	fmovsgu	%xcc,	%f13,	%f3
	edge8ln	%o1,	%g3,	%g5
	xnorcc	%i0,	%o5,	%g1
	edge16n	%g7,	%i7,	%g6
	fpadd32s	%f24,	%f1,	%f3
	sllx	%l1,	0x06,	%i4
	movrgz	%l4,	%l0,	%i3
	orncc	%l2,	0x0F35,	%l3
	subccc	%o2,	%o7,	%o6
	ldd	[%l7 + 0x28],	%f22
	fcmps	%fcc0,	%f29,	%f12
	fmovdcc	%xcc,	%f10,	%f2
	movcc	%xcc,	%i1,	%g4
	sdivx	%l6,	0x1FF5,	%l5
	fsrc1s	%f22,	%f12
	fcmpne16	%f20,	%f10,	%o4
	movvc	%icc,	%i5,	%o0
	ldsb	[%l7 + 0x11],	%i6
	ldd	[%l7 + 0x40],	%g2
	ldd	[%l7 + 0x38],	%o2
	sdiv	%i2,	0x133C,	%o1
	udiv	%g5,	0x07A8,	%g3
	st	%f5,	[%l7 + 0x10]
	fpmerge	%f5,	%f30,	%f28
	save %o5, 0x01B1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g1,	0x1FDC,	%g7
	movrgez	%g6,	0x3E2,	%i7
	movrgz	%l1,	0x3DB,	%i4
	alignaddr	%l0,	%l4,	%i3
	fpsub32s	%f29,	%f25,	%f24
	add	%l3,	0x0774,	%l2
	xorcc	%o2,	%o6,	%o7
	movre	%i1,	0x00B,	%l6
	movle	%xcc,	%g4,	%l5
	fandnot2	%f6,	%f12,	%f16
	nop
	set	0x60, %l0
	ldx	[%l7 + %l0],	%i5
	fors	%f30,	%f13,	%f23
	fmovdge	%xcc,	%f7,	%f13
	stb	%o4,	[%l7 + 0x1A]
	move	%xcc,	%i6,	%g2
	movg	%icc,	%o3,	%o0
	movneg	%icc,	%i2,	%o1
	movrlz	%g5,	0x1B3,	%g3
	movrne	%o5,	%i0,	%g1
	fnot1	%f10,	%f28
	fcmpgt16	%f8,	%f26,	%g6
	sdiv	%g7,	0x1FE5,	%i7
	popc	0x1D9F,	%l1
	stx	%l0,	[%l7 + 0x28]
	fcmple16	%f26,	%f4,	%l4
	edge32ln	%i3,	%i4,	%l2
	fcmpeq32	%f20,	%f20,	%o2
	edge8n	%l3,	%o6,	%i1
	movle	%icc,	%o7,	%g4
	movcc	%icc,	%l6,	%l5
	edge32ln	%i5,	%o4,	%g2
	fornot2s	%f21,	%f28,	%f19
	sra	%i6,	0x19,	%o0
	andcc	%i2,	%o1,	%g5
	sir	0x0173
	fcmpne32	%f8,	%f0,	%g3
	edge16l	%o3,	%i0,	%o5
	ldsb	[%l7 + 0x32],	%g6
	movg	%icc,	%g7,	%i7
	edge32n	%l1,	%g1,	%l4
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	movgu	%icc,	%l2,	%l0
	stb	%l3,	[%l7 + 0x73]
	addccc	%o2,	0x19D0,	%i1
	edge32n	%o6,	%o7,	%l6
	restore %g4, 0x0A0F, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f27,	%f10
	fnegs	%f21,	%f24
	smul	%l5,	0x1F20,	%o4
	sra	%i6,	%o0,	%i2
	fpadd16s	%f14,	%f19,	%f15
	orcc	%o1,	0x00BD,	%g2
	movleu	%xcc,	%g3,	%o3
	xnor	%g5,	%o5,	%g6
	fandnot2s	%f10,	%f30,	%f4
	sllx	%i0,	0x06,	%i7
	popc	%g7,	%g1
	fmovdcc	%icc,	%f17,	%f19
	edge8ln	%l1,	%i3,	%l4
	ldd	[%l7 + 0x18],	%f16
	std	%f4,	[%l7 + 0x30]
	edge16	%i4,	%l0,	%l2
	add	%l3,	0x0996,	%i1
	srlx	%o2,	%o7,	%l6
	movg	%xcc,	%o6,	%g4
	sir	0x1864
	edge32n	%l5,	%i5,	%i6
	udivcc	%o4,	0x0B6F,	%i2
	udivx	%o0,	0x148E,	%o1
	ldsw	[%l7 + 0x68],	%g3
	movneg	%icc,	%g2,	%g5
	fmovrslez	%o3,	%f12,	%f3
	movg	%icc,	%o5,	%g6
	fmovsle	%icc,	%f12,	%f27
	sth	%i7,	[%l7 + 0x58]
	edge32	%g7,	%g1,	%l1
	movpos	%xcc,	%i3,	%i0
	add	%l4,	0x017E,	%l0
	fmul8x16	%f7,	%f10,	%f20
	fmovdvs	%xcc,	%f17,	%f4
	movne	%xcc,	%i4,	%l3
	sdivx	%i1,	0x0D64,	%l2
	andn	%o7,	%o2,	%o6
	and	%g4,	%l6,	%l5
	ldub	[%l7 + 0x0E],	%i5
	fmovdgu	%icc,	%f8,	%f1
	movge	%icc,	%i6,	%o4
	ldd	[%l7 + 0x30],	%o0
	movvs	%xcc,	%o1,	%g3
	edge8	%g2,	%i2,	%o3
	stw	%o5,	[%l7 + 0x58]
	addccc	%g5,	%i7,	%g6
	edge32	%g7,	%l1,	%i3
	fmovrde	%g1,	%f12,	%f4
	edge32ln	%i0,	%l0,	%i4
	or	%l3,	0x1FE9,	%i1
	sdiv	%l4,	0x0EEF,	%l2
	edge8ln	%o7,	%o2,	%g4
	sub	%o6,	0x0FA1,	%l5
	edge16	%l6,	%i6,	%o4
	sll	%i5,	0x0A,	%o0
	movg	%xcc,	%g3,	%o1
	umulcc	%i2,	%g2,	%o5
	fxor	%f0,	%f10,	%f0
	sll	%g5,	%o3,	%i7
	xnorcc	%g6,	0x0949,	%l1
	sir	0x1BF7
	andncc	%g7,	%i3,	%g1
	movcc	%xcc,	%i0,	%i4
	mova	%icc,	%l0,	%i1
	edge16n	%l4,	%l2,	%l3
	movrgez	%o2,	0x151,	%g4
	st	%f14,	[%l7 + 0x50]
	fandnot2s	%f2,	%f6,	%f3
	array16	%o6,	%o7,	%l5
	sra	%i6,	%o4,	%l6
	save %o0, 0x1318, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g3,	%i2,	%o1
	sra	%g2,	%g5,	%o3
	fpackfix	%f16,	%f5
	or	%o5,	%i7,	%g6
	fmovdvc	%icc,	%f30,	%f7
	pdist	%f2,	%f24,	%f26
	andcc	%g7,	0x1385,	%i3
	andcc	%l1,	0x1800,	%i0
	or	%g1,	%l0,	%i1
	movrne	%l4,	%l2,	%i4
	smul	%o2,	0x11B8,	%l3
	edge16n	%o6,	%o7,	%l5
	edge16l	%g4,	%o4,	%l6
	movre	%o0,	%i6,	%i5
	sdiv	%g3,	0x1EDD,	%i2
	movcs	%xcc,	%o1,	%g2
	ldub	[%l7 + 0x37],	%g5
	fnegd	%f24,	%f18
	movle	%icc,	%o3,	%o5
	edge32n	%i7,	%g7,	%i3
	edge8l	%l1,	%i0,	%g6
	movrne	%g1,	0x0FE,	%i1
	nop
	set	0x30, %g6
	ldsb	[%l7 + %g6],	%l4
	fmovrdlz	%l0,	%f28,	%f8
	ldd	[%l7 + 0x28],	%f16
	array32	%l2,	%o2,	%i4
	sra	%l3,	0x0E,	%o6
	fmovrsgz	%l5,	%f17,	%f11
	fmovrsgz	%g4,	%f14,	%f29
	edge16n	%o7,	%l6,	%o0
	ldd	[%l7 + 0x58],	%o4
	fmovrde	%i6,	%f28,	%f2
	fmovsneg	%xcc,	%f21,	%f15
	sllx	%g3,	0x09,	%i5
	fmovd	%f26,	%f2
	ldsw	[%l7 + 0x10],	%i2
	lduw	[%l7 + 0x08],	%g2
	fabss	%f31,	%f25
	edge32	%o1,	%g5,	%o5
	umul	%o3,	0x0CF2,	%g7
	movn	%icc,	%i7,	%i3
	ld	[%l7 + 0x6C],	%f24
	xnor	%l1,	%i0,	%g6
	alignaddrl	%i1,	%l4,	%l0
	fcmpgt32	%f18,	%f30,	%l2
	fmovse	%xcc,	%f31,	%f25
	nop
	set	0x2E, %g1
	sth	%o2,	[%l7 + %g1]
	fmuld8ulx16	%f13,	%f0,	%f24
	movvc	%xcc,	%g1,	%l3
	addcc	%i4,	0x007C,	%o6
	fnegd	%f26,	%f12
	udiv	%g4,	0x042A,	%l5
	andn	%o7,	%l6,	%o4
	fzero	%f2
	nop
	set	0x60, %o7
	stx	%i6,	[%l7 + %o7]
	lduh	[%l7 + 0x6A],	%g3
	movvs	%xcc,	%o0,	%i2
	popc	0x0379,	%i5
	mulx	%g2,	0x1CE7,	%o1
	alignaddr	%g5,	%o3,	%o5
	edge32n	%g7,	%i7,	%l1
	fmovdvs	%xcc,	%f26,	%f9
	xnor	%i3,	%g6,	%i0
	fmovrdgez	%i1,	%f16,	%f26
	fxnors	%f22,	%f0,	%f4
	movneg	%xcc,	%l0,	%l2
	edge16	%l4,	%o2,	%g1
	edge32ln	%l3,	%o6,	%i4
	addccc	%l5,	0x1D8B,	%g4
	srl	%o7,	0x18,	%o4
	addc	%l6,	0x159D,	%i6
	ld	[%l7 + 0x20],	%f7
	movre	%o0,	0x2B2,	%g3
	movpos	%icc,	%i5,	%g2
	edge16n	%o1,	%g5,	%o3
	nop
	set	0x70, %g7
	std	%f2,	[%l7 + %g7]
	orncc	%o5,	%i2,	%i7
	alignaddr	%l1,	%g7,	%g6
	move	%icc,	%i0,	%i3
	sllx	%l0,	0x14,	%l2
	edge8l	%l4,	%o2,	%g1
	sethi	0x1A50,	%i1
	umul	%l3,	0x1200,	%o6
	st	%f10,	[%l7 + 0x4C]
	movle	%icc,	%l5,	%i4
	andn	%o7,	%g4,	%o4
	alignaddrl	%l6,	%i6,	%o0
	fmovdvs	%icc,	%f24,	%f10
	sth	%g3,	[%l7 + 0x46]
	ld	[%l7 + 0x24],	%f15
	subcc	%g2,	%o1,	%i5
	movrgz	%g5,	%o5,	%o3
	movpos	%xcc,	%i7,	%i2
	movg	%icc,	%l1,	%g7
	st	%f7,	[%l7 + 0x74]
	st	%f31,	[%l7 + 0x74]
	edge8l	%i0,	%i3,	%g6
	sdivcc	%l0,	0x185D,	%l4
	ld	[%l7 + 0x2C],	%f1
	umul	%l2,	%o2,	%i1
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	edge16n	%l5,	%l3,	%i4
	sub	%g4,	0x1734,	%o7
	movvs	%icc,	%l6,	%i6
	movvs	%icc,	%o4,	%o0
	fmovdleu	%xcc,	%f2,	%f4
	edge16ln	%g3,	%g2,	%i5
	movrne	%g5,	0x25B,	%o5
	stb	%o3,	[%l7 + 0x31]
	stb	%i7,	[%l7 + 0x4A]
	umulcc	%i2,	%o1,	%l1
	subcc	%i0,	%i3,	%g7
	fmovdg	%xcc,	%f11,	%f22
	ldsh	[%l7 + 0x26],	%l0
	movneg	%icc,	%l4,	%g6
	siam	0x4
	edge16l	%o2,	%i1,	%l2
	ld	[%l7 + 0x4C],	%f8
	movcs	%icc,	%g1,	%l5
	fmovsl	%xcc,	%f16,	%f31
	stx	%o6,	[%l7 + 0x08]
	xorcc	%l3,	%g4,	%i4
	stb	%l6,	[%l7 + 0x45]
	fmovsneg	%icc,	%f9,	%f8
	fcmpne32	%f2,	%f8,	%o7
	movge	%icc,	%i6,	%o0
	addc	%g3,	%o4,	%i5
	fmovsn	%icc,	%f22,	%f28
	edge32	%g2,	%o5,	%g5
	edge32ln	%i7,	%o3,	%i2
	fxnor	%f10,	%f0,	%f14
	std	%f16,	[%l7 + 0x68]
	ldub	[%l7 + 0x4C],	%l1
	xor	%i0,	%i3,	%g7
	ldsw	[%l7 + 0x74],	%l0
	mulx	%o1,	0x1DB4,	%l4
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%f14
	orncc	%g6,	%i1,	%o2
	fcmple16	%f28,	%f2,	%l2
	addc	%l5,	%o6,	%g1
	srlx	%l3,	0x10,	%i4
	nop
	set	0x28, %i3
	stx	%g4,	[%l7 + %i3]
	stb	%l6,	[%l7 + 0x26]
	subc	%o7,	%i6,	%o0
	fpadd16	%f28,	%f8,	%f22
	mova	%xcc,	%g3,	%i5
	srlx	%g2,	0x0D,	%o5
	edge32ln	%o4,	%i7,	%g5
	sdivcc	%i2,	0x03E1,	%o3
	array8	%l1,	%i0,	%i3
	movpos	%icc,	%l0,	%o1
	sethi	0x1D35,	%l4
	nop
	set	0x56, %o6
	lduh	[%l7 + %o6],	%g6
	sdiv	%g7,	0x1647,	%o2
	array32	%l2,	%l5,	%i1
	bshuffle	%f16,	%f12,	%f14
	fpadd16s	%f3,	%f26,	%f11
	srl	%o6,	0x14,	%g1
	ldsb	[%l7 + 0x5F],	%l3
	smul	%g4,	%i4,	%o7
	ldsw	[%l7 + 0x3C],	%l6
	ldx	[%l7 + 0x68],	%o0
	andncc	%i6,	%g3,	%g2
	xnor	%i5,	0x19C1,	%o5
	fcmple32	%f22,	%f6,	%i7
	fnands	%f14,	%f9,	%f5
	ldub	[%l7 + 0x1C],	%g5
	orcc	%o4,	0x1AFE,	%i2
	movn	%xcc,	%l1,	%o3
	fmovdle	%xcc,	%f17,	%f6
	ldsh	[%l7 + 0x7E],	%i0
	addcc	%i3,	%l0,	%o1
	addccc	%l4,	0x1386,	%g7
	movge	%xcc,	%g6,	%l2
	array32	%l5,	%i1,	%o2
	edge32l	%g1,	%o6,	%l3
	sir	0x0D0A
	addc	%g4,	%i4,	%o7
	edge16l	%o0,	%l6,	%g3
	lduh	[%l7 + 0x10],	%g2
	stw	%i5,	[%l7 + 0x3C]
	movrgz	%o5,	0x310,	%i7
	edge32	%g5,	%o4,	%i6
	fnot2	%f18,	%f6
	edge8ln	%i2,	%l1,	%i0
	ldsh	[%l7 + 0x2E],	%i3
	std	%f28,	[%l7 + 0x08]
	edge16l	%o3,	%l0,	%o1
	subccc	%g7,	0x109E,	%l4
	edge32ln	%g6,	%l2,	%l5
	fnegs	%f2,	%f5
	fmovscc	%icc,	%f11,	%f2
	mulscc	%o2,	%g1,	%i1
	fmovrslz	%l3,	%f30,	%f3
	movrgez	%g4,	%i4,	%o7
	xor	%o0,	0x1FBE,	%l6
	fpadd16s	%f27,	%f4,	%f25
	lduw	[%l7 + 0x7C],	%o6
	fmovdgu	%xcc,	%f24,	%f24
	andcc	%g2,	0x08F6,	%g3
	srax	%o5,	%i5,	%g5
	movrne	%o4,	0x2BD,	%i7
	fmul8x16	%f14,	%f26,	%f10
	sra	%i6,	0x1B,	%i2
	mulscc	%l1,	%i3,	%o3
	fmovrdlz	%i0,	%f26,	%f10
	srl	%o1,	%l0,	%l4
	movge	%xcc,	%g7,	%l2
	add	%l5,	%o2,	%g6
	edge32l	%i1,	%l3,	%g1
	ldd	[%l7 + 0x78],	%g4
	edge8ln	%o7,	%i4,	%l6
	movrgz	%o0,	%o6,	%g2
	std	%f24,	[%l7 + 0x48]
	ldub	[%l7 + 0x23],	%g3
	movrgez	%o5,	%g5,	%o4
	fmovd	%f4,	%f6
	fxor	%f2,	%f16,	%f2
	fabss	%f11,	%f28
	umul	%i5,	0x1A08,	%i6
	edge8n	%i2,	%l1,	%i7
	fpack16	%f10,	%f29
	movneg	%icc,	%o3,	%i0
	movn	%xcc,	%i3,	%l0
	udivcc	%l4,	0x1936,	%o1
	edge32l	%g7,	%l5,	%o2
	movl	%icc,	%g6,	%i1
	restore %l3, 0x0A34, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g1,	%o7
	ldsw	[%l7 + 0x70],	%i4
	srl	%l6,	%g4,	%o0
	save %g2, %o6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o5,	0x19A5,	%g5
	lduw	[%l7 + 0x68],	%i5
	edge16l	%i6,	%o4,	%i2
	fors	%f23,	%f5,	%f8
	movrgz	%l1,	0x327,	%o3
	xnor	%i0,	0x1504,	%i3
	addccc	%l0,	0x01DC,	%l4
	lduw	[%l7 + 0x24],	%o1
	srlx	%g7,	%i7,	%o2
	sir	0x06ED
	edge8	%l5,	%g6,	%l3
	stb	%l2,	[%l7 + 0x79]
	movcc	%xcc,	%g1,	%i1
	fmovsleu	%icc,	%f5,	%f10
	edge8l	%i4,	%l6,	%o7
	faligndata	%f12,	%f2,	%f4
	edge8	%o0,	%g4,	%g2
	addccc	%o6,	0x0B77,	%g3
	movne	%icc,	%o5,	%i5
	addc	%g5,	0x0832,	%i6
	sllx	%i2,	0x18,	%o4
	addc	%l1,	%i0,	%i3
	movrne	%o3,	%l0,	%o1
	save %g7, 0x0344, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x51],	%i7
	udiv	%l5,	0x12EC,	%g6
	fxnor	%f28,	%f8,	%f12
	and	%o2,	%l2,	%l3
	sethi	0x1395,	%i1
	alignaddrl	%i4,	%g1,	%o7
	movn	%icc,	%o0,	%l6
	udiv	%g4,	0x1870,	%g2
	movre	%g3,	0x278,	%o5
	lduw	[%l7 + 0x78],	%o6
	alignaddr	%g5,	%i6,	%i2
	edge8l	%i5,	%l1,	%o4
	nop
	set	0x6F, %i7
	ldub	[%l7 + %i7],	%i0
	ld	[%l7 + 0x48],	%f30
	sethi	0x06D5,	%o3
	alignaddr	%i3,	%l0,	%o1
	fmovsge	%xcc,	%f4,	%f21
	fnands	%f3,	%f9,	%f14
	edge8n	%l4,	%g7,	%i7
	ldx	[%l7 + 0x50],	%g6
	edge32ln	%o2,	%l2,	%l3
	alignaddrl	%l5,	%i4,	%g1
	array16	%o7,	%i1,	%l6
	mulx	%o0,	0x164B,	%g2
	mulx	%g3,	%g4,	%o6
	fmovsge	%xcc,	%f13,	%f26
	udivx	%o5,	0x12BE,	%i6
	movneg	%icc,	%i2,	%g5
	andcc	%l1,	%o4,	%i0
	mulx	%i5,	0x13C9,	%o3
	edge8ln	%i3,	%l0,	%o1
	srlx	%g7,	%l4,	%i7
	sll	%g6,	%l2,	%o2
	movleu	%icc,	%l5,	%i4
	nop
	set	0x20, %l1
	lduw	[%l7 + %l1],	%g1
	edge8n	%l3,	%i1,	%l6
	fmovrdgez	%o0,	%f2,	%f6
	smul	%o7,	%g2,	%g4
	add	%o6,	%g3,	%i6
	edge8ln	%o5,	%g5,	%i2
	fmovsgu	%xcc,	%f18,	%f26
	sdivcc	%l1,	0x0B03,	%o4
	std	%f16,	[%l7 + 0x20]
	orn	%i0,	%o3,	%i3
	stw	%l0,	[%l7 + 0x64]
	andn	%i5,	%g7,	%o1
	sethi	0x00DD,	%i7
	add	%g6,	%l4,	%o2
	fcmpd	%fcc0,	%f8,	%f10
	subcc	%l5,	%l2,	%i4
	sethi	0x18D7,	%g1
	edge8n	%i1,	%l3,	%o0
	andn	%l6,	%o7,	%g4
	fexpand	%f29,	%f6
	sub	%g2,	%o6,	%i6
	edge32	%o5,	%g5,	%i2
	xor	%g3,	0x0B7E,	%l1
	ldsw	[%l7 + 0x5C],	%i0
	sra	%o3,	%o4,	%l0
	smulcc	%i3,	0x0E7B,	%i5
	sub	%g7,	0x19FC,	%i7
	st	%f4,	[%l7 + 0x54]
	andn	%g6,	0x0077,	%o1
	fmovscs	%xcc,	%f19,	%f11
	xnorcc	%l4,	0x199F,	%l5
	ldsh	[%l7 + 0x34],	%l2
	fmovrslez	%o2,	%f15,	%f25
	and	%i4,	%g1,	%l3
	ldx	[%l7 + 0x48],	%i1
	fmovrsgez	%l6,	%f29,	%f15
	bshuffle	%f16,	%f28,	%f16
	mova	%icc,	%o7,	%o0
	smul	%g2,	0x19CB,	%g4
	alignaddr	%i6,	%o6,	%g5
	movrne	%i2,	%g3,	%l1
	xnor	%o5,	0x0562,	%i0
	for	%f20,	%f30,	%f8
	srl	%o4,	0x0D,	%l0
	subc	%o3,	%i5,	%g7
	movvc	%icc,	%i7,	%i3
	sdivcc	%g6,	0x081D,	%o1
	movcc	%icc,	%l4,	%l5
	edge8	%o2,	%i4,	%g1
	edge32n	%l3,	%l2,	%l6
	edge8	%o7,	%i1,	%o0
	movrlez	%g4,	0x12A,	%g2
	xorcc	%o6,	%g5,	%i2
	sir	0x1743
	orcc	%i6,	%l1,	%g3
	move	%icc,	%o5,	%o4
	stx	%l0,	[%l7 + 0x08]
	xnor	%o3,	%i0,	%g7
	fornot2s	%f25,	%f9,	%f26
	alignaddrl	%i7,	%i5,	%g6
	edge32ln	%i3,	%l4,	%l5
	subccc	%o2,	0x096C,	%o1
	or	%i4,	%l3,	%g1
	movrgz	%l2,	%l6,	%o7
	movpos	%xcc,	%o0,	%g4
	array32	%i1,	%o6,	%g2
	fone	%f22
	movg	%icc,	%g5,	%i6
	array8	%i2,	%l1,	%g3
	xnorcc	%o5,	0x1D36,	%l0
	sethi	0x1C6E,	%o4
	sth	%o3,	[%l7 + 0x3E]
	fxnors	%f9,	%f18,	%f3
	movrlz	%g7,	0x072,	%i7
	fmovdneg	%xcc,	%f17,	%f6
	edge8l	%i0,	%g6,	%i5
	ldd	[%l7 + 0x50],	%i2
	andn	%l4,	%l5,	%o1
	fmovs	%f22,	%f24
	edge8n	%i4,	%o2,	%g1
	ldx	[%l7 + 0x10],	%l2
	sll	%l3,	%o7,	%l6
	mova	%xcc,	%g4,	%i1
	and	%o6,	%o0,	%g5
	movpos	%xcc,	%i6,	%i2
	array32	%l1,	%g3,	%o5
	sllx	%g2,	0x18,	%l0
	fmovsneg	%xcc,	%f20,	%f11
	fmovsge	%icc,	%f17,	%f16
	stw	%o3,	[%l7 + 0x58]
	srax	%g7,	0x11,	%i7
	fmovsvc	%xcc,	%f11,	%f11
	fsrc1	%f8,	%f8
	orcc	%i0,	%o4,	%i5
	movge	%xcc,	%i3,	%l4
	edge8l	%l5,	%o1,	%g6
	edge32ln	%i4,	%o2,	%l2
	fpack16	%f0,	%f7
	add	%g1,	0x0413,	%o7
	fnand	%f26,	%f24,	%f10
	andcc	%l6,	%g4,	%i1
	add	%l3,	%o0,	%o6
	fmovdgu	%icc,	%f22,	%f4
	stx	%i6,	[%l7 + 0x48]
	fmovde	%xcc,	%f5,	%f14
	sethi	0x1B30,	%g5
	fcmple32	%f4,	%f26,	%i2
	fpsub32s	%f1,	%f30,	%f0
	fxor	%f10,	%f6,	%f8
	nop
	set	0x58, %l4
	std	%f30,	[%l7 + %l4]
	xorcc	%l1,	0x16F5,	%g3
	subc	%g2,	0x1873,	%l0
	ldsw	[%l7 + 0x44],	%o3
	ldsh	[%l7 + 0x38],	%o5
	umul	%i7,	%g7,	%o4
	edge32l	%i0,	%i3,	%l4
	sir	0x1437
	ldsb	[%l7 + 0x57],	%i5
	srl	%o1,	0x0C,	%g6
	ldd	[%l7 + 0x30],	%l4
	subcc	%i4,	%o2,	%g1
	fpsub16s	%f23,	%f18,	%f27
	umul	%o7,	%l2,	%l6
	edge16l	%i1,	%l3,	%g4
	edge8ln	%o6,	%o0,	%g5
	movn	%icc,	%i2,	%i6
	mulscc	%l1,	0x02A9,	%g2
	andcc	%l0,	%g3,	%o5
	nop
	set	0x62, %o2
	ldub	[%l7 + %o2],	%i7
	array16	%o3,	%o4,	%g7
	fmovrslz	%i0,	%f9,	%f21
	ldsb	[%l7 + 0x3C],	%l4
	fand	%f4,	%f22,	%f22
	xnorcc	%i3,	%o1,	%g6
	edge32n	%i5,	%l5,	%i4
	sir	0x0976
	movl	%xcc,	%o2,	%g1
	add	%l2,	%o7,	%l6
	array8	%l3,	%g4,	%o6
	fmovsl	%xcc,	%f6,	%f6
	fmovdg	%xcc,	%f3,	%f5
	ldd	[%l7 + 0x28],	%f0
	ldub	[%l7 + 0x7F],	%i1
	edge32l	%g5,	%o0,	%i2
	addc	%l1,	0x1F1A,	%i6
	array8	%l0,	%g3,	%g2
	array8	%i7,	%o5,	%o3
	subc	%o4,	%g7,	%l4
	fsrc2	%f8,	%f6
	fmovscc	%icc,	%f21,	%f4
	save %i0, %o1, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f7,	%f9
	edge16n	%i3,	%l5,	%i4
	mulx	%o2,	%g1,	%i5
	edge32	%l2,	%o7,	%l3
	sth	%g4,	[%l7 + 0x58]
	movgu	%xcc,	%o6,	%l6
	udiv	%g5,	0x16FC,	%o0
	and	%i1,	0x0A7C,	%l1
	xorcc	%i2,	0x1000,	%i6
	fnot1	%f28,	%f14
	fpsub16s	%f18,	%f5,	%f11
	sll	%g3,	0x1E,	%g2
	edge16	%l0,	%o5,	%o3
	orcc	%o4,	%i7,	%l4
	fnot2	%f20,	%f12
	andn	%g7,	0x091B,	%o1
	edge8ln	%i0,	%i3,	%l5
	fmovda	%icc,	%f16,	%f24
	fmovsgu	%icc,	%f28,	%f7
	fnors	%f19,	%f7,	%f10
	fmovdneg	%xcc,	%f6,	%f20
	fmul8x16al	%f24,	%f21,	%f8
	subcc	%i4,	%o2,	%g1
	array8	%i5,	%l2,	%g6
	subc	%l3,	0x1B23,	%g4
	fandnot2s	%f29,	%f27,	%f16
	andn	%o7,	%o6,	%g5
	sllx	%l6,	%i1,	%l1
	movcc	%icc,	%o0,	%i6
	and	%g3,	%i2,	%l0
	udivcc	%g2,	0x1965,	%o5
	alignaddr	%o4,	%o3,	%i7
	ldsb	[%l7 + 0x0C],	%g7
	sll	%o1,	%i0,	%l4
	array8	%l5,	%i4,	%o2
	fmovsg	%icc,	%f17,	%f6
	sub	%i3,	0x0CD8,	%i5
	nop
	set	0x0A, %l5
	ldsh	[%l7 + %l5],	%g1
	smulcc	%l2,	%g6,	%l3
	and	%o7,	0x1DAA,	%g4
	xor	%o6,	0x1205,	%g5
	umul	%i1,	%l6,	%l1
	edge32ln	%o0,	%g3,	%i6
	fnor	%f20,	%f2,	%f26
	sra	%i2,	%l0,	%o5
	movne	%xcc,	%o4,	%o3
	st	%f17,	[%l7 + 0x0C]
	srax	%g2,	0x13,	%g7
	andn	%o1,	%i0,	%i7
	addccc	%l4,	0x12F1,	%i4
	movcc	%icc,	%l5,	%o2
	movcc	%icc,	%i3,	%i5
	alignaddr	%g1,	%g6,	%l2
	orn	%l3,	%o7,	%o6
	addc	%g4,	0x18D8,	%g5
	move	%icc,	%i1,	%l1
	nop
	set	0x74, %o3
	stw	%l6,	[%l7 + %o3]
	fmovdg	%icc,	%f3,	%f26
	subccc	%g3,	0x004C,	%o0
	orn	%i2,	0x1284,	%i6
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	fors	%f0,	%f23,	%f25
	fmovdn	%icc,	%f18,	%f5
	xor	%o3,	0x0141,	%g2
	ldd	[%l7 + 0x18],	%g6
	fmovdleu	%icc,	%f22,	%f15
	movle	%xcc,	%i0,	%i7
	movne	%xcc,	%o1,	%i4
	fnot2s	%f13,	%f18
	ldub	[%l7 + 0x6A],	%l5
	sdiv	%o2,	0x1DEF,	%i3
	orncc	%i5,	0x0A01,	%g1
	xnorcc	%g6,	0x0D15,	%l2
	ld	[%l7 + 0x18],	%f9
	smulcc	%l4,	%o7,	%l3
	or	%o6,	0x1C8A,	%g5
	movvs	%icc,	%g4,	%i1
	fcmped	%fcc2,	%f30,	%f20
	fmovscs	%xcc,	%f26,	%f30
	edge16l	%l1,	%l6,	%g3
	bshuffle	%f22,	%f10,	%f30
	edge8	%i2,	%o0,	%o5
	sub	%l0,	%i6,	%o4
	movrgz	%g2,	0x15A,	%o3
	fornot2s	%f1,	%f5,	%f7
	std	%f8,	[%l7 + 0x30]
	movneg	%xcc,	%g7,	%i0
	orcc	%i7,	%i4,	%l5
	fsrc1	%f16,	%f18
	sethi	0x1E48,	%o2
	fmovscc	%icc,	%f7,	%f12
	addccc	%i3,	0x0177,	%i5
	edge32	%o1,	%g6,	%l2
	fsrc1s	%f0,	%f14
	movn	%xcc,	%g1,	%l4
	ldd	[%l7 + 0x50],	%l2
	faligndata	%f26,	%f20,	%f22
	fandnot1s	%f2,	%f27,	%f12
	movrne	%o7,	0x0C7,	%o6
	fmovda	%xcc,	%f1,	%f25
	andn	%g5,	%g4,	%i1
	movgu	%icc,	%l6,	%l1
	xorcc	%i2,	0x1B33,	%g3
	fcmpne32	%f20,	%f16,	%o0
	fmovdne	%icc,	%f10,	%f24
	sra	%o5,	0x16,	%l0
	fmovrdlz	%i6,	%f18,	%f26
	sdiv	%g2,	0x17FB,	%o4
	subccc	%o3,	%i0,	%g7
	fpsub32	%f2,	%f20,	%f2
	fpsub16	%f20,	%f16,	%f8
	andcc	%i7,	0x156D,	%l5
	sra	%i4,	0x12,	%o2
	ldub	[%l7 + 0x6E],	%i3
	movrgz	%o1,	0x148,	%i5
	restore %l2, %g6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%xcc,	%f27,	%f17
	edge32l	%g1,	%l3,	%o6
	ldd	[%l7 + 0x20],	%g4
	movrlz	%o7,	0x118,	%g4
	st	%f22,	[%l7 + 0x50]
	orn	%i1,	0x0AD5,	%l6
	siam	0x2
	fandnot2s	%f5,	%f21,	%f20
	stw	%i2,	[%l7 + 0x68]
	subcc	%g3,	0x1668,	%o0
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	movneg	%icc,	%i6,	%g2
	subccc	%o4,	0x0D58,	%l0
	save %o3, %g7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l5,	%i4,	%o2
	stw	%i0,	[%l7 + 0x54]
	sdivx	%o1,	0x02EC,	%i5
	ldx	[%l7 + 0x60],	%i3
	orcc	%l2,	0x0361,	%g6
	movge	%icc,	%l4,	%g1
	movcs	%xcc,	%l3,	%g5
	fnegd	%f8,	%f6
	movcs	%icc,	%o6,	%g4
	move	%xcc,	%o7,	%i1
	orcc	%i2,	%l6,	%o0
	nop
	set	0x10, %o1
	ldub	[%l7 + %o1],	%o5
	sra	%g3,	0x01,	%i6
	fmovdcc	%icc,	%f7,	%f29
	fmovsvc	%icc,	%f5,	%f12
	ldsw	[%l7 + 0x6C],	%l1
	mulx	%g2,	0x0C8D,	%o4
	ld	[%l7 + 0x28],	%f10
	sdivcc	%o3,	0x0B85,	%g7
	ldsb	[%l7 + 0x23],	%i7
	fmovsneg	%icc,	%f22,	%f28
	orn	%l0,	0x033A,	%i4
	movrne	%l5,	0x0BF,	%o2
	sethi	0x0387,	%i0
	edge8ln	%o1,	%i5,	%l2
	edge8n	%g6,	%i3,	%l4
	srlx	%l3,	0x08,	%g5
	fmovdpos	%icc,	%f24,	%f9
	ldx	[%l7 + 0x78],	%g1
	fcmpeq16	%f6,	%f10,	%g4
	sll	%o7,	%o6,	%i1
	ldsh	[%l7 + 0x26],	%l6
	sdivx	%o0,	0x162D,	%o5
	fnot1s	%f23,	%f31
	udivcc	%i2,	0x19AD,	%i6
	srl	%g3,	0x02,	%l1
	restore %g2, %o3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o4,	%l0,	%i7
	fmovdn	%icc,	%f2,	%f10
	fmovrsgz	%l5,	%f14,	%f26
	edge16n	%i4,	%i0,	%o1
	movl	%xcc,	%o2,	%i5
	fmovsleu	%xcc,	%f21,	%f12
	movge	%xcc,	%l2,	%i3
	movn	%xcc,	%l4,	%g6
	orcc	%l3,	0x05B9,	%g5
	alignaddrl	%g4,	%o7,	%g1
	fzero	%f6
	sub	%o6,	0x16DC,	%l6
	ld	[%l7 + 0x14],	%f15
	movrlz	%i1,	%o5,	%o0
	fnands	%f7,	%f17,	%f10
	movn	%xcc,	%i6,	%g3
	ldsb	[%l7 + 0x61],	%i2
	fxnor	%f24,	%f14,	%f26
	umulcc	%l1,	%g2,	%o3
	udivx	%o4,	0x1D19,	%g7
	movvs	%icc,	%l0,	%l5
	ldd	[%l7 + 0x78],	%i6
	fmovrdlez	%i4,	%f28,	%f22
	xor	%i0,	%o1,	%i5
	umul	%l2,	%o2,	%i3
	sllx	%l4,	%g6,	%g5
	edge16	%g4,	%o7,	%l3
	xnor	%o6,	0x0D93,	%l6
	edge16ln	%g1,	%o5,	%o0
	stw	%i1,	[%l7 + 0x64]
	fmovdle	%xcc,	%f21,	%f10
	fcmpes	%fcc2,	%f5,	%f24
	sdivx	%g3,	0x0191,	%i2
	std	%f12,	[%l7 + 0x50]
	st	%f23,	[%l7 + 0x10]
	movrgz	%l1,	%g2,	%o3
	sth	%i6,	[%l7 + 0x16]
	lduw	[%l7 + 0x70],	%o4
	movleu	%icc,	%l0,	%g7
	edge8ln	%l5,	%i4,	%i0
	ldd	[%l7 + 0x48],	%f4
	fmul8x16al	%f18,	%f30,	%f4
	fand	%f18,	%f26,	%f14
	fmovde	%xcc,	%f11,	%f5
	ldd	[%l7 + 0x08],	%o0
	fpsub32	%f4,	%f18,	%f20
	edge32n	%i7,	%l2,	%o2
	movrgez	%i5,	%l4,	%g6
	fmovdg	%xcc,	%f15,	%f0
	orn	%i3,	%g5,	%g4
	edge32	%l3,	%o7,	%o6
	movre	%l6,	%g1,	%o0
	fmovrdlez	%i1,	%f4,	%f2
	udivcc	%o5,	0x0765,	%i2
	fmovsge	%xcc,	%f4,	%f23
	addccc	%l1,	0x0679,	%g3
	andncc	%o3,	%g2,	%i6
	movl	%icc,	%l0,	%o4
	fornot2s	%f23,	%f7,	%f3
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f26
	edge32	%g7,	%l5,	%i0
	ldd	[%l7 + 0x78],	%o0
	fcmpgt32	%f0,	%f24,	%i4
	movl	%xcc,	%i7,	%o2
	stx	%l2,	[%l7 + 0x40]
	save %i5, %l4, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%icc,	%f29,	%f14
	andn	%g6,	0x0181,	%g4
	fmovrslez	%l3,	%f13,	%f31
	sdivx	%g5,	0x1429,	%o7
	xor	%o6,	%g1,	%o0
	fmovsge	%icc,	%f10,	%f6
	edge32l	%l6,	%i1,	%i2
	movcc	%xcc,	%o5,	%l1
	udivx	%g3,	0x1F99,	%o3
	lduh	[%l7 + 0x2E],	%g2
	edge32n	%i6,	%o4,	%l0
	fmovscc	%icc,	%f14,	%f28
	nop
	set	0x58, %g4
	lduw	[%l7 + %g4],	%l5
	fnors	%f29,	%f2,	%f19
	fpadd32	%f12,	%f16,	%f22
	sllx	%g7,	0x15,	%o1
	sra	%i4,	%i0,	%i7
	movl	%icc,	%l2,	%o2
	st	%f8,	[%l7 + 0x2C]
	ld	[%l7 + 0x50],	%f10
	umulcc	%i5,	0x1F9D,	%l4
	sdiv	%g6,	0x031D,	%i3
	udiv	%l3,	0x1F95,	%g5
	sdivx	%o7,	0x0A4D,	%g4
	movrgez	%o6,	%g1,	%l6
	sra	%i1,	0x08,	%i2
	ld	[%l7 + 0x68],	%f5
	edge8n	%o0,	%o5,	%g3
	addcc	%o3,	0x0925,	%l1
	addcc	%i6,	%g2,	%l0
	movrne	%l5,	0x3E2,	%g7
	smulcc	%o1,	%i4,	%o4
	smulcc	%i0,	0x1D00,	%l2
	fnot2s	%f1,	%f31
	edge8ln	%o2,	%i5,	%l4
	nop
	set	0x74, %o4
	ldsh	[%l7 + %o4],	%i7
	andcc	%g6,	%i3,	%l3
	edge32l	%g5,	%o7,	%o6
	std	%f18,	[%l7 + 0x68]
	fones	%f23
	movl	%icc,	%g4,	%l6
	mulscc	%i1,	%i2,	%g1
	fpsub32s	%f23,	%f9,	%f2
	ldsb	[%l7 + 0x0E],	%o0
	andcc	%g3,	%o5,	%o3
	ldub	[%l7 + 0x66],	%i6
	bshuffle	%f20,	%f4,	%f26
	subcc	%l1,	%l0,	%g2
	save %g7, %l5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o1,	%i0,	%o4
	addc	%o2,	0x1B81,	%l2
	xnorcc	%i5,	0x18DD,	%i7
	st	%f13,	[%l7 + 0x14]
	edge32	%g6,	%l4,	%i3
	sir	0x0508
	edge32l	%l3,	%g5,	%o7
	andcc	%g4,	0x145A,	%o6
	sdivx	%l6,	0x034D,	%i2
	std	%f4,	[%l7 + 0x20]
	movcs	%xcc,	%g1,	%o0
	movcs	%icc,	%g3,	%o5
	movrlz	%o3,	%i1,	%l1
	fcmpeq16	%f24,	%f26,	%l0
	umulcc	%i6,	%g7,	%l5
	lduh	[%l7 + 0x6E],	%g2
	sll	%i4,	%o1,	%i0
	st	%f12,	[%l7 + 0x14]
	move	%xcc,	%o2,	%o4
	addcc	%i5,	%i7,	%g6
	fcmpeq16	%f4,	%f22,	%l2
	orcc	%l4,	0x1420,	%l3
	save %i3, %o7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f10,	%f12,	%g4
	movrgz	%l6,	0x052,	%i2
	mova	%xcc,	%o6,	%g1
	fxnors	%f10,	%f31,	%f31
	edge8	%g3,	%o0,	%o3
	movrne	%i1,	%o5,	%l1
	sth	%l0,	[%l7 + 0x1A]
	andcc	%i6,	%g7,	%g2
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	ldsb	[%l7 + 0x37],	%i4
	fmovrdgez	%o2,	%f24,	%f6
	ld	[%l7 + 0x24],	%f16
	edge8ln	%o4,	%i7,	%g6
	movneg	%xcc,	%l2,	%i5
	addc	%l4,	0x0E91,	%i3
	movne	%xcc,	%o7,	%g5
	srl	%l3,	%g4,	%l6
	udiv	%o6,	0x10D1,	%i2
	fmul8x16	%f7,	%f30,	%f0
	orncc	%g3,	0x1BA8,	%g1
	udivcc	%o3,	0x0B7E,	%o0
	sth	%i1,	[%l7 + 0x3E]
	stb	%l1,	[%l7 + 0x71]
	save %o5, 0x001F, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%xcc,	%f13,	%f8
	st	%f1,	[%l7 + 0x2C]
	fexpand	%f23,	%f12
	movl	%xcc,	%g7,	%l0
	edge8l	%l5,	%o1,	%g2
	array32	%i4,	%o2,	%i0
	ldsb	[%l7 + 0x5C],	%o4
	ldsw	[%l7 + 0x48],	%i7
	sub	%l2,	0x13EA,	%i5
	movge	%xcc,	%g6,	%l4
	subcc	%i3,	0x0978,	%o7
	edge8ln	%g5,	%g4,	%l3
	fxors	%f6,	%f10,	%f16
	edge32l	%o6,	%i2,	%g3
	movg	%xcc,	%g1,	%l6
	fands	%f16,	%f3,	%f24
	sdiv	%o0,	0x0979,	%o3
	movneg	%icc,	%i1,	%o5
	array8	%l1,	%i6,	%g7
	edge16	%l0,	%o1,	%g2
	orn	%l5,	0x1B25,	%o2
	sdiv	%i0,	0x0F56,	%i4
	movrne	%o4,	0x369,	%i7
	edge32ln	%l2,	%i5,	%l4
	movge	%icc,	%g6,	%i3
	sll	%g5,	%g4,	%l3
	edge32ln	%o7,	%i2,	%g3
	fmovdpos	%xcc,	%f30,	%f31
	edge32ln	%g1,	%l6,	%o0
	smulcc	%o6,	%i1,	%o5
	ldsw	[%l7 + 0x74],	%l1
	mulx	%o3,	0x123E,	%g7
	fpadd16s	%f21,	%f2,	%f0
	st	%f13,	[%l7 + 0x48]
	fpsub16s	%f15,	%f23,	%f28
	fpsub32s	%f31,	%f21,	%f11
	ld	[%l7 + 0x58],	%f8
	edge32	%l0,	%i6,	%g2
	movneg	%icc,	%o1,	%o2
	restore %l5, %i4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i7,	%l2,	%o4
	subc	%i5,	0x18C8,	%l4
	fcmpeq32	%f4,	%f24,	%g6
	fandnot2	%f30,	%f22,	%f8
	fpsub16	%f0,	%f18,	%f2
	edge32l	%i3,	%g5,	%g4
	udivcc	%o7,	0x0CA3,	%i2
	orcc	%g3,	0x00A2,	%g1
	srl	%l6,	0x1E,	%l3
	or	%o0,	%o6,	%o5
	movvc	%icc,	%i1,	%l1
	edge32n	%o3,	%l0,	%i6
	srlx	%g7,	%o1,	%o2
	edge32n	%l5,	%i4,	%i0
	movge	%xcc,	%i7,	%l2
	movge	%icc,	%o4,	%i5
	stx	%l4,	[%l7 + 0x60]
	orcc	%g2,	%g6,	%i3
	stx	%g4,	[%l7 + 0x78]
	addccc	%o7,	0x1DFF,	%i2
	movneg	%xcc,	%g5,	%g3
	addc	%g1,	%l3,	%l6
	stx	%o0,	[%l7 + 0x20]
	movre	%o5,	%i1,	%l1
	andn	%o6,	0x1899,	%l0
	fmovrsgez	%o3,	%f12,	%f26
	srax	%g7,	0x08,	%i6
	movn	%xcc,	%o1,	%l5
	movn	%icc,	%o2,	%i4
	array8	%i0,	%l2,	%o4
	umul	%i5,	%i7,	%g2
	sdiv	%g6,	0x0B6C,	%i3
	edge16ln	%l4,	%o7,	%g4
	lduh	[%l7 + 0x4C],	%i2
	orncc	%g5,	0x10AD,	%g1
	stb	%l3,	[%l7 + 0x73]
	edge8ln	%g3,	%l6,	%o0
	array32	%o5,	%i1,	%l1
	umul	%o6,	0x16EF,	%o3
	movgu	%xcc,	%l0,	%i6
	edge16ln	%g7,	%o1,	%o2
	sir	0x1022
	edge16l	%i4,	%i0,	%l2
	srax	%l5,	%o4,	%i7
	orncc	%g2,	0x0F8E,	%i5
	sub	%g6,	0x109C,	%i3
	mulscc	%o7,	0x1A12,	%l4
	array8	%g4,	%g5,	%g1
	xnor	%l3,	%g3,	%i2
	orn	%l6,	0x0832,	%o0
	sdivx	%o5,	0x0E80,	%i1
	orcc	%l1,	%o6,	%l0
	array16	%i6,	%o3,	%g7
	save %o2, 0x062A, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o1,	%l2
	smulcc	%i0,	%o4,	%i7
	edge16l	%l5,	%g2,	%i5
	sra	%i3,	%g6,	%l4
	sdiv	%o7,	0x13F8,	%g5
	fpadd16	%f20,	%f22,	%f22
	sdivcc	%g1,	0x140E,	%g4
	fmovrslz	%g3,	%f6,	%f22
	fandnot1s	%f3,	%f5,	%f13
	and	%l3,	%l6,	%i2
	fmovdl	%icc,	%f16,	%f30
	fmovrdgz	%o5,	%f18,	%f28
	edge8ln	%o0,	%l1,	%o6
	array32	%i1,	%i6,	%l0
	addccc	%o3,	0x0B31,	%o2
	edge32ln	%g7,	%o1,	%l2
	stb	%i4,	[%l7 + 0x14]
	sllx	%o4,	%i7,	%l5
	andcc	%g2,	%i0,	%i5
	movl	%icc,	%i3,	%g6
	edge16l	%o7,	%g5,	%l4
	ldsh	[%l7 + 0x50],	%g1
	siam	0x0
	fnor	%f20,	%f24,	%f26
	fmovse	%icc,	%f14,	%f12
	alignaddr	%g3,	%g4,	%l6
	fmovdgu	%xcc,	%f19,	%f4
	mulscc	%l3,	%i2,	%o0
	edge8ln	%o5,	%o6,	%i1
	alignaddr	%l1,	%l0,	%o3
	add	%o2,	0x172C,	%i6
	movl	%xcc,	%o1,	%g7
	subc	%i4,	0x16A5,	%l2
	movrlz	%o4,	0x276,	%l5
	fpsub16s	%f12,	%f24,	%f9
	array8	%i7,	%g2,	%i0
	movl	%icc,	%i3,	%i5
	smul	%o7,	0x1FA9,	%g5
	faligndata	%f2,	%f24,	%f30
	fands	%f22,	%f9,	%f6
	edge8ln	%g6,	%g1,	%g3
	udivcc	%l4,	0x04AA,	%g4
	ldsb	[%l7 + 0x35],	%l3
	movl	%xcc,	%l6,	%o0
	movle	%xcc,	%i2,	%o5
	edge8	%i1,	%o6,	%l0
	st	%f0,	[%l7 + 0x18]
	sub	%o3,	0x0074,	%l1
	sth	%i6,	[%l7 + 0x48]
	edge32l	%o2,	%o1,	%g7
	sth	%i4,	[%l7 + 0x76]
	xnor	%o4,	%l5,	%l2
	fmovdvc	%icc,	%f3,	%f31
	ld	[%l7 + 0x0C],	%f19
	movle	%icc,	%i7,	%g2
	for	%f0,	%f0,	%f28
	orn	%i0,	%i5,	%i3
	fmovrsne	%o7,	%f16,	%f0
	sll	%g5,	0x02,	%g6
	sdivx	%g3,	0x0757,	%g1
	fmovdn	%xcc,	%f5,	%f27
	fpadd16	%f10,	%f4,	%f10
	xnor	%l4,	0x097D,	%l3
	mulscc	%l6,	%o0,	%g4
	edge16l	%i2,	%o5,	%o6
	fmuld8sux16	%f24,	%f2,	%f18
	fpsub32s	%f0,	%f0,	%f10
	addcc	%i1,	0x00EE,	%o3
	udivx	%l1,	0x0B88,	%l0
	sra	%o2,	0x14,	%i6
	sth	%g7,	[%l7 + 0x48]
	movg	%icc,	%i4,	%o4
	orn	%o1,	0x0DCC,	%l2
	edge32	%l5,	%i7,	%i0
	fcmpgt16	%f4,	%f20,	%g2
	udivx	%i5,	0x1271,	%o7
	ldsw	[%l7 + 0x0C],	%i3
	mulx	%g5,	0x01B5,	%g3
	smul	%g1,	0x12DA,	%g6
	orcc	%l4,	0x0519,	%l3
	alignaddrl	%l6,	%o0,	%g4
	lduh	[%l7 + 0x78],	%i2
	pdist	%f4,	%f20,	%f30
	addcc	%o5,	0x0349,	%o6
	ldsw	[%l7 + 0x58],	%i1
	srlx	%l1,	0x19,	%l0
	and	%o2,	%i6,	%o3
	alignaddr	%g7,	%o4,	%i4
	fmovrsgez	%l2,	%f23,	%f6
	addccc	%l5,	%i7,	%o1
	orcc	%i0,	0x0C38,	%i5
	xnorcc	%g2,	%i3,	%o7
	ldx	[%l7 + 0x50],	%g3
	xnor	%g1,	0x14E0,	%g5
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	add	%o0,	%l6,	%i2
	movne	%icc,	%g4,	%o5
	ldsw	[%l7 + 0x10],	%o6
	movvc	%icc,	%l1,	%i1
	xnorcc	%l0,	%i6,	%o3
	fmovdn	%xcc,	%f31,	%f20
	umulcc	%g7,	0x0D90,	%o4
	movvc	%xcc,	%i4,	%l2
	fpackfix	%f22,	%f15
	alignaddrl	%l5,	%o2,	%i7
	xor	%o1,	%i5,	%i0
	edge16l	%g2,	%o7,	%i3
	edge32	%g1,	%g5,	%g3
	umulcc	%l4,	%g6,	%o0
	st	%f9,	[%l7 + 0x1C]
	movrgz	%l3,	%l6,	%g4
	mulx	%o5,	0x0479,	%i2
	movgu	%icc,	%o6,	%l1
	xor	%i1,	0x0AC0,	%l0
	movrne	%o3,	0x246,	%i6
	movrgez	%g7,	0x340,	%o4
	addcc	%i4,	%l2,	%o2
	fpsub16	%f12,	%f28,	%f20
	fmovse	%xcc,	%f28,	%f7
	fmovsgu	%icc,	%f3,	%f15
	mulx	%l5,	0x0CDB,	%o1
	movrgz	%i5,	0x17F,	%i0
	ldx	[%l7 + 0x78],	%g2
	movre	%o7,	%i3,	%i7
	addccc	%g5,	%g3,	%g1
	fmovsgu	%icc,	%f4,	%f23
	and	%l4,	0x0BFB,	%o0
	movpos	%icc,	%l3,	%l6
	movpos	%icc,	%g4,	%g6
	movle	%xcc,	%i2,	%o5
	movrgez	%o6,	%i1,	%l0
	lduw	[%l7 + 0x1C],	%o3
	smulcc	%l1,	0x0F3A,	%i6
	fpadd32	%f0,	%f22,	%f14
	orn	%o4,	%i4,	%l2
	fsrc1s	%f2,	%f24
	faligndata	%f4,	%f0,	%f20
	addc	%g7,	0x14FB,	%o2
	fmovse	%xcc,	%f5,	%f4
	lduw	[%l7 + 0x24],	%o1
	orncc	%i5,	0x00C4,	%l5
	ldd	[%l7 + 0x18],	%i0
	fmovda	%xcc,	%f11,	%f27
	edge32	%g2,	%o7,	%i3
	movg	%icc,	%g5,	%i7
	std	%f26,	[%l7 + 0x30]
	fzero	%f24
	fmovda	%xcc,	%f22,	%f15
	edge32	%g3,	%g1,	%o0
	for	%f14,	%f6,	%f16
	subcc	%l3,	0x1F20,	%l4
	sir	0x107E
	movle	%xcc,	%g4,	%l6
	movl	%icc,	%i2,	%o5
	fcmped	%fcc3,	%f10,	%f0
	fcmpgt16	%f0,	%f26,	%g6
	movleu	%icc,	%o6,	%i1
	addccc	%l0,	0x1FBD,	%o3
	fmovrdne	%i6,	%f28,	%f14
	movleu	%xcc,	%o4,	%i4
	fsrc2	%f18,	%f8
	andcc	%l1,	%g7,	%o2
	edge8l	%o1,	%i5,	%l5
	movrlez	%i0,	%g2,	%l2
	movrgez	%o7,	0x001,	%i3
	fmovscs	%xcc,	%f25,	%f11
	edge32ln	%g5,	%g3,	%i7
	array32	%o0,	%l3,	%l4
	ldsb	[%l7 + 0x64],	%g4
	move	%xcc,	%l6,	%i2
	ldx	[%l7 + 0x08],	%g1
	edge16ln	%o5,	%g6,	%i1
	andn	%o6,	%l0,	%o3
	stx	%i6,	[%l7 + 0x10]
	fcmpne32	%f6,	%f6,	%o4
	edge8	%i4,	%l1,	%o2
	fmovrsgez	%g7,	%f17,	%f26
	movl	%xcc,	%i5,	%o1
	movg	%xcc,	%i0,	%l5
	edge16n	%g2,	%o7,	%i3
	andcc	%l2,	0x0CFA,	%g5
	fmovsg	%icc,	%f20,	%f14
	edge8n	%i7,	%o0,	%g3
	stb	%l3,	[%l7 + 0x6C]
	move	%xcc,	%l4,	%l6
	stb	%i2,	[%l7 + 0x21]
	edge8ln	%g4,	%g1,	%o5
	fmovsa	%xcc,	%f4,	%f7
	mulscc	%g6,	0x1133,	%i1
	fnand	%f14,	%f18,	%f22
	movneg	%icc,	%o6,	%o3
	movvs	%xcc,	%i6,	%l0
	xnor	%i4,	0x08E4,	%l1
	edge32l	%o4,	%g7,	%i5
	xor	%o2,	%i0,	%l5
	restore %o1, %g2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l2,	0x1C,	%g5
	edge16ln	%i7,	%o0,	%g3
	st	%f17,	[%l7 + 0x4C]
	edge8n	%l3,	%i3,	%l4
	srl	%i2,	%g4,	%l6
	fandnot2	%f20,	%f12,	%f14
	lduh	[%l7 + 0x52],	%o5
	addc	%g6,	%g1,	%i1
	fandnot2	%f14,	%f26,	%f16
	stw	%o3,	[%l7 + 0x4C]
	fpadd32	%f30,	%f30,	%f26
	movcc	%xcc,	%i6,	%l0
	edge32	%i4,	%o6,	%o4
	edge16l	%g7,	%l1,	%i5
	srl	%o2,	0x14,	%i0
	fmovs	%f16,	%f19
	and	%o1,	0x1313,	%l5
	sdivcc	%o7,	0x02AA,	%l2
	fnands	%f26,	%f23,	%f24
	fmovdcs	%xcc,	%f23,	%f21
	fmuld8sux16	%f20,	%f2,	%f16
	sllx	%g5,	%i7,	%o0
	edge32n	%g3,	%g2,	%i3
	xnorcc	%l4,	%i2,	%l3
	movneg	%icc,	%g4,	%l6
	orcc	%g6,	%o5,	%i1
	ldsb	[%l7 + 0x14],	%g1
	movgu	%icc,	%i6,	%o3
	udivcc	%l0,	0x024D,	%i4
	move	%icc,	%o6,	%o4
	movre	%l1,	0x3F8,	%g7
	ldsw	[%l7 + 0x6C],	%i5
	std	%f30,	[%l7 + 0x48]
	andncc	%o2,	%o1,	%l5
	fmovsvs	%icc,	%f16,	%f23
	addccc	%o7,	0x09CC,	%l2
	array32	%g5,	%i0,	%o0
	fcmpne16	%f22,	%f22,	%g3
	movrne	%g2,	%i3,	%l4
	array32	%i7,	%l3,	%i2
	fmovspos	%xcc,	%f4,	%f6
	std	%f22,	[%l7 + 0x08]
	save %g4, 0x15AA, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f0,	%f12,	%f10
	alignaddr	%l6,	%o5,	%g1
	popc	0x0973,	%i1
	fabss	%f16,	%f26
	orcc	%o3,	0x17DC,	%i6
	sethi	0x0DCD,	%i4
	lduh	[%l7 + 0x62],	%l0
	ldx	[%l7 + 0x10],	%o4
	array16	%l1,	%g7,	%o6
	fsrc2s	%f23,	%f25
	udiv	%o2,	0x183D,	%i5
	orn	%l5,	0x0177,	%o1
	edge32n	%l2,	%g5,	%i0
	movre	%o0,	%o7,	%g3
	edge32l	%g2,	%l4,	%i3
	fornot1s	%f14,	%f27,	%f23
	sir	0x0C63
	fpadd32s	%f11,	%f9,	%f19
	subccc	%i7,	0x1219,	%l3
	fmul8x16	%f2,	%f2,	%f24
	fmul8x16al	%f14,	%f13,	%f16
	edge8	%g4,	%g6,	%l6
	edge32ln	%o5,	%i2,	%g1
	orn	%i1,	%i6,	%o3
	mulscc	%i4,	0x1B81,	%l0
	movne	%icc,	%o4,	%l1
	srl	%o6,	0x03,	%o2
	srax	%g7,	%i5,	%l5
	sllx	%l2,	%g5,	%o1
	edge16	%o0,	%o7,	%i0
	edge16n	%g3,	%g2,	%l4
	fmovde	%icc,	%f23,	%f12
	fmul8ulx16	%f4,	%f4,	%f28
	edge8	%i7,	%l3,	%g4
	sethi	0x0C18,	%i3
	udivx	%l6,	0x1B93,	%g6
	xor	%i2,	%o5,	%g1
	udiv	%i6,	0x05A0,	%i1
	udiv	%o3,	0x170F,	%l0
	fmovsvc	%xcc,	%f19,	%f8
	edge16l	%o4,	%i4,	%l1
	srlx	%o6,	%o2,	%i5
	andcc	%l5,	%g7,	%g5
	subcc	%l2,	%o0,	%o1
	movg	%icc,	%i0,	%g3
	mova	%xcc,	%g2,	%o7
	movg	%icc,	%i7,	%l4
	fnot2s	%f4,	%f16
	movrgez	%l3,	0x2DF,	%i3
	addccc	%l6,	%g4,	%i2
	array16	%o5,	%g1,	%i6
	udivx	%g6,	0x1F31,	%o3
	fmovrdne	%l0,	%f24,	%f28
	fcmpeq32	%f0,	%f10,	%o4
	save %i4, %i1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o2,	%i5,	%l1
	or	%g7,	0x0182,	%g5
	umulcc	%l5,	%o0,	%l2
	mova	%icc,	%o1,	%g3
	fnegs	%f29,	%f29
	movneg	%icc,	%g2,	%o7
	fmovde	%icc,	%f18,	%f4
	mulscc	%i0,	%l4,	%i7
	fmovrde	%i3,	%f20,	%f24
	sethi	0x126D,	%l3
	fxnors	%f2,	%f9,	%f0
	fcmpne16	%f8,	%f22,	%l6
	smul	%g4,	%o5,	%i2
	movl	%xcc,	%i6,	%g1
	lduh	[%l7 + 0x34],	%g6
	alignaddrl	%l0,	%o4,	%o3
	ldsb	[%l7 + 0x29],	%i4
	movrlez	%i1,	%o2,	%i5
	addccc	%o6,	%g7,	%l1
	subccc	%g5,	%l5,	%o0
	movn	%xcc,	%o1,	%l2
	edge16l	%g3,	%o7,	%g2
	orn	%l4,	%i7,	%i0
	std	%f16,	[%l7 + 0x70]
	xor	%i3,	0x0AEB,	%l6
	popc	%l3,	%o5
	movpos	%icc,	%i2,	%i6
	sdivcc	%g4,	0x0768,	%g6
	fpsub16	%f28,	%f8,	%f28
	srlx	%g1,	0x05,	%l0
	fnot2	%f0,	%f22
	fand	%f8,	%f22,	%f20
	srlx	%o4,	%i4,	%i1
	andncc	%o2,	%o3,	%o6
	movcs	%xcc,	%g7,	%i5
	siam	0x0
	fabsd	%f18,	%f30
	fsrc1s	%f11,	%f3
	fpack16	%f8,	%f31
	xnorcc	%l1,	0x053E,	%g5
	mova	%icc,	%l5,	%o1
	or	%o0,	%g3,	%o7
	ldsb	[%l7 + 0x5E],	%l2
	edge8ln	%g2,	%l4,	%i7
	addcc	%i3,	0x0C04,	%i0
	fnot1	%f16,	%f16
	edge32ln	%l3,	%o5,	%l6
	movgu	%xcc,	%i6,	%g4
	fpadd16	%f22,	%f20,	%f0
	fpadd16	%f14,	%f2,	%f4
	sethi	0x147F,	%i2
	edge32ln	%g6,	%g1,	%l0
	fmovdgu	%xcc,	%f15,	%f20
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	movge	%icc,	%o2,	%o6
	lduw	[%l7 + 0x40],	%o3
	st	%f31,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%i4
	stx	%l1,	[%l7 + 0x20]
	siam	0x1
	ldub	[%l7 + 0x58],	%g7
	movle	%xcc,	%l5,	%o1
	sdiv	%g5,	0x1379,	%g3
	xor	%o0,	%o7,	%l2
	fcmpgt16	%f16,	%f4,	%g2
	fcmps	%fcc2,	%f9,	%f5
	movn	%icc,	%i7,	%l4
	edge32l	%i0,	%i3,	%l3
	movpos	%icc,	%o5,	%i6
	movneg	%icc,	%g4,	%i2
	or	%g6,	0x0B97,	%g1
	restore %l0, %l6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i4,	0x0105,	%o2
	ldsb	[%l7 + 0x13],	%i1
	xnorcc	%o3,	0x0369,	%i5
	sll	%l1,	%o6,	%g7
	stx	%l5,	[%l7 + 0x30]
	orn	%g5,	%o1,	%g3
	movvc	%icc,	%o7,	%o0
	fmovscc	%icc,	%f23,	%f5
	or	%g2,	%l2,	%i7
	ldsb	[%l7 + 0x0E],	%i0
	ld	[%l7 + 0x4C],	%f25
	xnor	%i3,	0x0B59,	%l4
	edge32	%o5,	%l3,	%i6
	xor	%g4,	0x1E3C,	%i2
	fone	%f8
	fones	%f21
	movrlz	%g6,	0x2CC,	%l0
	save %g1, 0x0D72, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f1,	%f23,	%f25
	xorcc	%o4,	%i4,	%i1
	orn	%o3,	0x00C4,	%o2
	nop
	set	0x50, %i5
	lduw	[%l7 + %i5],	%i5
	movvc	%icc,	%l1,	%g7
	mulscc	%l5,	%o6,	%o1
	std	%f22,	[%l7 + 0x60]
	and	%g5,	%o7,	%g3
	fnot2s	%f21,	%f13
	fmul8x16au	%f16,	%f7,	%f30
	umul	%o0,	0x1644,	%g2
	orcc	%i7,	0x177F,	%i0
	xnorcc	%l2,	%l4,	%i3
	xnor	%l3,	0x04C2,	%i6
	stb	%g4,	[%l7 + 0x78]
	movge	%xcc,	%o5,	%g6
	edge32ln	%i2,	%g1,	%l6
	or	%l0,	0x0DCC,	%i4
	smul	%i1,	0x198F,	%o4
	fcmple16	%f30,	%f16,	%o3
	edge16n	%o2,	%i5,	%g7
	fxor	%f30,	%f10,	%f10
	move	%xcc,	%l1,	%o6
	ldd	[%l7 + 0x08],	%f8
	sra	%o1,	%g5,	%l5
	ldsw	[%l7 + 0x1C],	%g3
	fmuld8sux16	%f18,	%f27,	%f8
	fmovdcc	%xcc,	%f4,	%f6
	and	%o7,	0x1C85,	%o0
	srl	%i7,	0x11,	%g2
	sllx	%i0,	%l2,	%i3
	sra	%l3,	%l4,	%g4
	fandnot2	%f8,	%f24,	%f0
	array32	%i6,	%o5,	%g6
	and	%i2,	0x0499,	%l6
	stb	%g1,	[%l7 + 0x5C]
	fandnot2	%f6,	%f12,	%f10
	fmovrsgz	%i4,	%f16,	%f29
	xor	%i1,	%l0,	%o3
	orncc	%o2,	0x0B3C,	%o4
	fpack32	%f26,	%f28,	%f24
	fnot2s	%f16,	%f15
	fcmpeq32	%f22,	%f28,	%i5
	array16	%l1,	%o6,	%g7
	fmovdvs	%icc,	%f5,	%f27
	xorcc	%o1,	0x0386,	%l5
	addc	%g5,	%o7,	%o0
	fnot2s	%f5,	%f16
	st	%f7,	[%l7 + 0x74]
	addc	%i7,	0x1BE9,	%g2
	movvc	%icc,	%g3,	%l2
	orn	%i0,	0x0100,	%l3
	fxors	%f1,	%f4,	%f18
	lduw	[%l7 + 0x0C],	%i3
	fornot2	%f6,	%f10,	%f24
	add	%g4,	%l4,	%o5
	addcc	%g6,	%i6,	%l6
	edge16	%g1,	%i2,	%i1
	movl	%xcc,	%l0,	%i4
	movcc	%icc,	%o2,	%o3
	movgu	%icc,	%i5,	%o4
	movvc	%xcc,	%l1,	%o6
	ldsb	[%l7 + 0x22],	%o1
	movneg	%xcc,	%l5,	%g7
	or	%g5,	%o0,	%i7
	fmovrdlez	%g2,	%f28,	%f18
	subccc	%g3,	0x1C03,	%l2
	sllx	%o7,	%i0,	%i3
	umul	%g4,	%l3,	%o5
	for	%f20,	%f12,	%f20
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%g6
	addcc	%i6,	0x0CAF,	%l6
	fmovdneg	%xcc,	%f15,	%f19
	fpack16	%f28,	%f1
	fmovsvc	%xcc,	%f20,	%f1
	subc	%g1,	%l4,	%i1
	array16	%l0,	%i4,	%i2
	sethi	0x1AB6,	%o2
	umulcc	%o3,	0x17B4,	%i5
	movcs	%icc,	%l1,	%o6
	fmovrse	%o1,	%f30,	%f16
	fmovsa	%icc,	%f30,	%f14
	srl	%l5,	%g7,	%o4
	movvc	%xcc,	%o0,	%g5
	movneg	%icc,	%g2,	%g3
	fmul8sux16	%f20,	%f0,	%f0
	sdiv	%l2,	0x09BA,	%o7
	alignaddrl	%i7,	%i3,	%i0
	movneg	%xcc,	%g4,	%l3
	edge32l	%g6,	%i6,	%o5
	and	%l6,	0x0813,	%l4
	fmovsleu	%icc,	%f15,	%f14
	fsrc1s	%f2,	%f5
	movre	%g1,	%i1,	%l0
	siam	0x3
	popc	%i2,	%o2
	orncc	%o3,	%i4,	%l1
	xorcc	%o6,	0x0799,	%i5
	add	%l5,	0x1F3E,	%g7
	or	%o4,	%o0,	%o1
	ldsb	[%l7 + 0x47],	%g2
	fmovsa	%xcc,	%f18,	%f23
	alignaddrl	%g5,	%g3,	%l2
	fcmps	%fcc2,	%f1,	%f5
	ldd	[%l7 + 0x08],	%f10
	sethi	0x1DCD,	%o7
	andncc	%i7,	%i0,	%i3
	fmovsge	%icc,	%f4,	%f25
	addc	%l3,	%g6,	%g4
	sir	0x0E56
	sdiv	%o5,	0x11BE,	%l6
	nop
	set	0x6C, %o5
	stw	%i6,	[%l7 + %o5]
	sdivx	%l4,	0x0B05,	%g1
	movle	%xcc,	%l0,	%i2
	edge8n	%i1,	%o2,	%i4
	movl	%icc,	%l1,	%o6
	fnegd	%f24,	%f16
	stw	%i5,	[%l7 + 0x74]
	ldub	[%l7 + 0x6A],	%o3
	fcmpne16	%f4,	%f30,	%g7
	ldx	[%l7 + 0x18],	%o4
	fmuld8sux16	%f15,	%f27,	%f22
	fmovsg	%xcc,	%f22,	%f18
	movl	%icc,	%l5,	%o1
	and	%o0,	%g5,	%g3
	fzero	%f6
	addc	%l2,	%g2,	%i7
	edge32	%i0,	%i3,	%o7
	sdivcc	%g6,	0x1D50,	%g4
	and	%l3,	%o5,	%l6
	andncc	%i6,	%g1,	%l0
	edge8ln	%l4,	%i1,	%i2
	xor	%i4,	0x1DC5,	%o2
	edge8n	%o6,	%l1,	%i5
	nop
	set	0x36, %g2
	stb	%g7,	[%l7 + %g2]
	fsrc2s	%f23,	%f31
	edge32ln	%o3,	%l5,	%o1
	ldd	[%l7 + 0x30],	%f28
	addcc	%o4,	0x1C7D,	%o0
	sdivcc	%g5,	0x1410,	%g3
	andn	%l2,	%i7,	%g2
	addcc	%i0,	%o7,	%g6
	smulcc	%g4,	%i3,	%l3
	ldx	[%l7 + 0x60],	%l6
	edge8n	%o5,	%i6,	%g1
	movrne	%l4,	%i1,	%i2
	lduh	[%l7 + 0x6E],	%l0
	sdivcc	%i4,	0x0E8D,	%o2
	edge16	%l1,	%o6,	%i5
	udivx	%g7,	0x08E1,	%l5
	stb	%o3,	[%l7 + 0x2A]
	fxors	%f25,	%f26,	%f13
	sll	%o4,	%o0,	%g5
	lduw	[%l7 + 0x6C],	%o1
	fmovdvc	%icc,	%f6,	%f22
	ldub	[%l7 + 0x3E],	%l2
	sllx	%i7,	0x16,	%g3
	umulcc	%i0,	0x020B,	%g2
	fnot1	%f26,	%f6
	fands	%f20,	%f31,	%f7
	movneg	%xcc,	%o7,	%g4
	movcs	%icc,	%i3,	%l3
	edge32ln	%l6,	%o5,	%i6
	edge32n	%g1,	%l4,	%i1
	edge32ln	%i2,	%l0,	%i4
	fornot2s	%f26,	%f5,	%f16
	sth	%o2,	[%l7 + 0x78]
	sdivx	%g6,	0x18E2,	%l1
	orcc	%o6,	0x1F08,	%g7
	udivx	%i5,	0x0710,	%l5
	add	%o3,	%o4,	%o0
	edge32n	%g5,	%l2,	%i7
	fcmpes	%fcc0,	%f22,	%f5
	fcmple32	%f16,	%f16,	%o1
	edge32n	%i0,	%g3,	%o7
	movcc	%xcc,	%g4,	%g2
	edge8	%i3,	%l6,	%o5
	movrlez	%l3,	0x20C,	%g1
	std	%f18,	[%l7 + 0x50]
	ldd	[%l7 + 0x28],	%f6
	movl	%icc,	%i6,	%l4
	fmovsvc	%icc,	%f17,	%f8
	movleu	%xcc,	%i1,	%i2
	ldsb	[%l7 + 0x0C],	%l0
	umulcc	%i4,	0x00D6,	%o2
	movrne	%l1,	%o6,	%g7
	edge8l	%i5,	%g6,	%o3
	edge16	%l5,	%o4,	%g5
	udivx	%o0,	0x0511,	%l2
	mova	%icc,	%o1,	%i7
	xnorcc	%i0,	0x0A2F,	%o7
	fnot2s	%f5,	%f26
	array8	%g4,	%g3,	%g2
	fnor	%f10,	%f20,	%f16
	fmovdl	%icc,	%f22,	%f22
	movvc	%xcc,	%l6,	%i3
	umulcc	%o5,	%g1,	%i6
	orcc	%l3,	0x084D,	%i1
	sll	%i2,	%l0,	%l4
	mova	%xcc,	%i4,	%l1
	move	%xcc,	%o6,	%g7
	sdivx	%o2,	0x1568,	%i5
	ldx	[%l7 + 0x30],	%o3
	fmovdgu	%xcc,	%f0,	%f17
	movge	%xcc,	%g6,	%o4
	edge8n	%l5,	%o0,	%l2
	fxor	%f14,	%f22,	%f18
	xorcc	%o1,	0x10F4,	%g5
	fnot1s	%f25,	%f1
	orn	%i0,	%i7,	%o7
	edge16l	%g4,	%g2,	%g3
	mova	%icc,	%i3,	%l6
	edge16n	%o5,	%g1,	%l3
	movne	%xcc,	%i1,	%i2
	array8	%l0,	%l4,	%i6
	sir	0x179B
	movrlez	%l1,	0x1EB,	%i4
	add	%o6,	%g7,	%o2
	movre	%i5,	%g6,	%o3
	fandnot1s	%f24,	%f29,	%f18
	fnor	%f18,	%f12,	%f22
	fmovsvc	%icc,	%f27,	%f8
	movrgez	%o4,	0x2B5,	%l5
	xorcc	%o0,	%l2,	%g5
	fmovdge	%xcc,	%f3,	%f31
	fmovdcc	%xcc,	%f8,	%f17
	fmovdneg	%xcc,	%f18,	%f12
	fzeros	%f8
	movre	%i0,	0x2F8,	%i7
	umul	%o7,	0x012D,	%g4
	lduh	[%l7 + 0x14],	%o1
	stw	%g3,	[%l7 + 0x70]
	or	%g2,	0x1B74,	%i3
	addcc	%o5,	%l6,	%g1
	sllx	%i1,	0x1B,	%i2
	fmovsleu	%icc,	%f11,	%f20
	mova	%icc,	%l3,	%l0
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	edge8	%i4,	%o6,	%g7
	fxor	%f24,	%f18,	%f30
	movcc	%xcc,	%i5,	%g6
	xnorcc	%o3,	%o2,	%o4
	movl	%icc,	%l5,	%l2
	fmovrdlz	%o0,	%f18,	%f4
	ldd	[%l7 + 0x78],	%f0
	fcmpd	%fcc0,	%f12,	%f2
	orn	%g5,	%i7,	%o7
	fmovsne	%xcc,	%f26,	%f10
	movvc	%xcc,	%i0,	%o1
	srax	%g3,	0x17,	%g2
	fcmps	%fcc3,	%f10,	%f23
	array8	%i3,	%g4,	%o5
	subcc	%l6,	0x0F4E,	%i1
	fmovrsgz	%g1,	%f22,	%f4
	movg	%xcc,	%i2,	%l0
	movge	%xcc,	%l3,	%i6
	move	%icc,	%l1,	%i4
	fxors	%f22,	%f0,	%f21
	movrne	%l4,	%o6,	%g7
	sllx	%g6,	%o3,	%i5
	andncc	%o4,	%l5,	%o2
	movre	%l2,	0x2C5,	%o0
	fmovrslez	%g5,	%f25,	%f13
	movneg	%xcc,	%i7,	%i0
	xor	%o1,	%o7,	%g2
	fpsub16	%f0,	%f20,	%f22
	add	%g3,	%g4,	%i3
	mova	%icc,	%o5,	%i1
	subcc	%g1,	0x0986,	%i2
	edge32n	%l6,	%l3,	%l0
	movrne	%l1,	0x086,	%i4
	movvs	%icc,	%l4,	%i6
	fmovrslz	%o6,	%f13,	%f4
	fcmps	%fcc3,	%f22,	%f2
	fmovrdgz	%g7,	%f30,	%f20
	addccc	%g6,	%o3,	%o4
	fmovrdlz	%l5,	%f24,	%f6
	addc	%i5,	%l2,	%o2
	edge16	%o0,	%i7,	%g5
	edge16l	%i0,	%o7,	%g2
	srax	%o1,	0x0E,	%g4
	ldx	[%l7 + 0x10],	%i3
	addc	%o5,	%i1,	%g3
	popc	%g1,	%i2
	movrlz	%l6,	0x17B,	%l3
	or	%l1,	%l0,	%l4
	edge32n	%i6,	%i4,	%g7
	fpadd32	%f16,	%f28,	%f18
	movn	%icc,	%g6,	%o3
	movn	%icc,	%o4,	%o6
	addccc	%i5,	%l5,	%o2
	pdist	%f6,	%f10,	%f14
	edge16n	%o0,	%i7,	%g5
	movrlz	%i0,	0x2EE,	%o7
	subcc	%g2,	0x11AD,	%o1
	fornot2	%f0,	%f6,	%f16
	srlx	%l2,	%g4,	%i3
	edge32l	%o5,	%g3,	%i1
	edge8l	%g1,	%l6,	%i2
	sth	%l1,	[%l7 + 0x2C]
	fmovsg	%icc,	%f26,	%f17
	fmul8sux16	%f22,	%f12,	%f14
	srl	%l0,	0x00,	%l3
	fmovsneg	%icc,	%f13,	%f13
	save %i6, 0x1558, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l4,	%g7,	%o3
	std	%f0,	[%l7 + 0x20]
	srax	%g6,	0x18,	%o4
	movpos	%xcc,	%i5,	%l5
	andn	%o2,	0x0F43,	%o6
	udivcc	%i7,	0x148E,	%o0
	stw	%g5,	[%l7 + 0x78]
	fmovrsgez	%o7,	%f14,	%f12
	umulcc	%g2,	0x08CF,	%o1
	ldd	[%l7 + 0x60],	%f8
	andcc	%l2,	0x16CE,	%i0
	edge16ln	%g4,	%o5,	%g3
	fmovdneg	%xcc,	%f18,	%f11
	movge	%icc,	%i3,	%i1
	fmovrslz	%g1,	%f25,	%f10
	fmul8ulx16	%f24,	%f16,	%f0
	movg	%icc,	%l6,	%i2
	movrgz	%l0,	0x2BA,	%l3
	alignaddrl	%l1,	%i4,	%l4
	movge	%xcc,	%i6,	%o3
	movrlez	%g6,	0x333,	%g7
	array16	%o4,	%l5,	%o2
	ldd	[%l7 + 0x60],	%f20
	sth	%i5,	[%l7 + 0x52]
	ldd	[%l7 + 0x70],	%i6
	udivcc	%o0,	0x1782,	%o6
	edge16	%g5,	%o7,	%g2
	restore %l2, 0x14F4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%g4,	%o5
	sub	%i0,	%g3,	%i1
	or	%g1,	%l6,	%i2
	movge	%icc,	%l0,	%l3
	fpadd16	%f24,	%f14,	%f30
	mulscc	%l1,	0x1D86,	%i4
	fnot2	%f16,	%f10
	edge32ln	%l4,	%i3,	%i6
	movcc	%icc,	%o3,	%g6
	fand	%f20,	%f30,	%f18
	addc	%g7,	%l5,	%o2
	sub	%o4,	%i5,	%o0
	edge16n	%i7,	%g5,	%o6
	fnegs	%f14,	%f14
	ldsh	[%l7 + 0x40],	%g2
	ldd	[%l7 + 0x30],	%l2
	edge8n	%o1,	%o7,	%o5
	array16	%i0,	%g4,	%i1
	sub	%g3,	0x1C21,	%l6
	and	%g1,	0x0B97,	%l0
	orn	%i2,	0x091A,	%l3
	sll	%i4,	%l4,	%l1
	edge8n	%i6,	%o3,	%i3
	subc	%g6,	%l5,	%g7
	xorcc	%o2,	%i5,	%o0
	mova	%xcc,	%o4,	%i7
	fcmpeq32	%f16,	%f22,	%o6
	orcc	%g2,	%l2,	%g5
	ldd	[%l7 + 0x50],	%o0
	sethi	0x065D,	%o5
	ldx	[%l7 + 0x10],	%o7
	movrlez	%i0,	0x3D8,	%i1
	movl	%icc,	%g4,	%g3
	andncc	%g1,	%l6,	%l0
	movpos	%icc,	%i2,	%i4
	fsrc1s	%f14,	%f11
	subccc	%l4,	%l3,	%i6
	std	%f12,	[%l7 + 0x18]
	ldsw	[%l7 + 0x44],	%o3
	umulcc	%i3,	0x1E1C,	%l1
	udivcc	%g6,	0x09BE,	%l5
	orcc	%g7,	%i5,	%o2
	ldsb	[%l7 + 0x51],	%o4
	ldsb	[%l7 + 0x3A],	%i7
	andn	%o6,	%o0,	%g2
	orncc	%l2,	%o1,	%o5
	sdiv	%o7,	0x02AC,	%g5
	smul	%i1,	%g4,	%i0
	fcmpne16	%f4,	%f18,	%g1
	sir	0x00EA
	move	%icc,	%l6,	%l0
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%g2
	movrgez	%i2,	0x064,	%i4
	fmovsa	%icc,	%f24,	%f18
	stw	%l3,	[%l7 + 0x4C]
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	movle	%icc,	%l1,	%g6
	lduh	[%l7 + 0x5E],	%o3
	fmovsgu	%icc,	%f21,	%f25
	movrgez	%l5,	%g7,	%o2
	udiv	%i5,	0x09AB,	%o4
	edge32l	%i7,	%o6,	%o0
	xorcc	%g2,	0x1869,	%o1
	edge32	%l2,	%o7,	%g5
	fors	%f29,	%f19,	%f27
	orcc	%i1,	%o5,	%g4
	subcc	%i0,	0x1D62,	%l6
	edge32ln	%l0,	%g3,	%g1
	edge32ln	%i2,	%i4,	%l4
	xnor	%i6,	0x0131,	%i3
	fmul8x16al	%f1,	%f21,	%f16
	edge32n	%l3,	%l1,	%o3
	movrgz	%g6,	%l5,	%g7
	fmovscs	%icc,	%f1,	%f13
	edge32	%i5,	%o4,	%o2
	movvs	%xcc,	%o6,	%o0
	movn	%icc,	%g2,	%i7
	orn	%l2,	0x07A0,	%o7
	edge16n	%g5,	%i1,	%o5
	fmovdne	%icc,	%f9,	%f23
	subc	%g4,	%i0,	%l6
	movl	%xcc,	%o1,	%g3
	movrne	%g1,	%i2,	%i4
	fsrc2	%f30,	%f8
	fcmple32	%f14,	%f26,	%l0
	edge8ln	%l4,	%i3,	%l3
	fmovsneg	%xcc,	%f6,	%f23
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%f10
	ld	[%l7 + 0x64],	%f20
	fnot1	%f12,	%f16
	movleu	%xcc,	%i6,	%l1
	movcs	%icc,	%o3,	%l5
	movpos	%xcc,	%g6,	%i5
	edge32	%g7,	%o4,	%o2
	fcmpeq16	%f12,	%f26,	%o0
	edge8l	%g2,	%o6,	%i7
	udivcc	%o7,	0x0FF6,	%l2
	bshuffle	%f8,	%f6,	%f2
	fornot2	%f0,	%f16,	%f6
	array32	%g5,	%i1,	%o5
	faligndata	%f4,	%f18,	%f12
	save %g4, %i0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%xcc,	%f12,	%f14
	movvc	%xcc,	%l6,	%g1
	ldx	[%l7 + 0x60],	%i2
	sdivx	%g3,	0x0FC2,	%l0
	array32	%l4,	%i4,	%l3
	edge8ln	%i3,	%i6,	%l1
	edge8ln	%o3,	%l5,	%g6
	fabss	%f0,	%f2
	sir	0x1B2B
	ld	[%l7 + 0x6C],	%f4
	udivcc	%i5,	0x0E80,	%o4
	movne	%xcc,	%o2,	%o0
	srax	%g2,	0x01,	%g7
	fmovrsgez	%i7,	%f19,	%f16
	alignaddrl	%o7,	%o6,	%g5
	movcc	%icc,	%l2,	%i1
	edge8n	%g4,	%o5,	%o1
	edge8l	%l6,	%i0,	%g1
	movrgz	%i2,	0x01A,	%g3
	movg	%xcc,	%l4,	%i4
	alignaddrl	%l3,	%l0,	%i3
	smul	%i6,	%l1,	%o3
	movcs	%xcc,	%l5,	%i5
	subc	%g6,	%o2,	%o4
	lduh	[%l7 + 0x14],	%o0
	xorcc	%g7,	%g2,	%o7
	fmovs	%f10,	%f20
	fmovdpos	%icc,	%f19,	%f21
	std	%f4,	[%l7 + 0x20]
	edge32n	%i7,	%g5,	%o6
	siam	0x5
	movrne	%i1,	0x2FC,	%g4
	fone	%f16
	xorcc	%l2,	0x0617,	%o1
	alignaddr	%l6,	%i0,	%o5
	fsrc2s	%f22,	%f16
	fone	%f4
	fmul8sux16	%f4,	%f20,	%f24
	addcc	%g1,	%g3,	%i2
	addcc	%l4,	%l3,	%l0
	umulcc	%i4,	0x18BA,	%i6
	stw	%l1,	[%l7 + 0x0C]
	movg	%xcc,	%o3,	%l5
	stw	%i5,	[%l7 + 0x4C]
	movcs	%xcc,	%i3,	%g6
	fcmpeq32	%f16,	%f18,	%o2
	stw	%o4,	[%l7 + 0x4C]
	movge	%xcc,	%o0,	%g2
	fnor	%f14,	%f20,	%f26
	sdiv	%o7,	0x0E67,	%g7
	fmovrslz	%g5,	%f16,	%f29
	sdivcc	%i7,	0x1C72,	%o6
	restore %i1, 0x04F4, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l2,	%o1,	%i0
	fmovde	%xcc,	%f1,	%f5
	edge16n	%l6,	%o5,	%g1
	edge16	%g3,	%l4,	%i2
	popc	%l3,	%l0
	movle	%icc,	%i6,	%i4
	srl	%o3,	%l1,	%l5
	fornot2s	%f11,	%f29,	%f10
	edge32n	%i5,	%i3,	%o2
	ldsb	[%l7 + 0x60],	%g6
	fmuld8ulx16	%f13,	%f0,	%f22
	move	%xcc,	%o0,	%o4
	move	%xcc,	%o7,	%g2
	udiv	%g7,	0x1193,	%i7
	andncc	%g5,	%i1,	%o6
	edge16l	%g4,	%o1,	%l2
	edge8n	%l6,	%i0,	%o5
	fabsd	%f2,	%f24
	orn	%g1,	0x1483,	%g3
	subc	%l4,	%i2,	%l0
	for	%f28,	%f22,	%f6
	sdivx	%i6,	0x138E,	%i4
	addccc	%o3,	%l1,	%l5
	movvs	%icc,	%i5,	%l3
	edge32ln	%i3,	%o2,	%g6
	subcc	%o4,	%o0,	%o7
	fmul8x16al	%f22,	%f14,	%f20
	bshuffle	%f0,	%f2,	%f10
	fcmpeq32	%f28,	%f30,	%g7
	fandnot2s	%f12,	%f22,	%f23
	lduh	[%l7 + 0x3C],	%i7
	save %g2, 0x1DB9, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%xcc,	%f26,	%f7
	move	%xcc,	%o6,	%g4
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%f12
	fmovdcs	%xcc,	%f9,	%f23
	fmovrsgz	%o1,	%f23,	%f14
	movcc	%xcc,	%l2,	%g5
	fmovrdne	%l6,	%f26,	%f6
	udiv	%i0,	0x0435,	%g1
	sdiv	%g3,	0x12B7,	%l4
	mova	%xcc,	%i2,	%l0
	edge16n	%o5,	%i4,	%o3
	move	%xcc,	%l1,	%l5
	movl	%xcc,	%i5,	%i6
	andn	%l3,	0x1CCF,	%i3
	xnorcc	%g6,	%o2,	%o4
	smulcc	%o7,	0x1909,	%g7
	fnot2	%f30,	%f16
	sdivcc	%o0,	0x1E94,	%i7
	ldsb	[%l7 + 0x73],	%i1
	andn	%g2,	%o6,	%g4
	sllx	%l2,	0x0C,	%o1
	sethi	0x1F1F,	%g5
	sdivcc	%i0,	0x1E44,	%g1
	ldub	[%l7 + 0x41],	%g3
	edge16ln	%l4,	%l6,	%i2
	movcs	%icc,	%o5,	%l0
	movvs	%icc,	%o3,	%l1
	fmovrde	%i4,	%f28,	%f2
	udivx	%i5,	0x151E,	%l5
	stb	%l3,	[%l7 + 0x46]
	edge8l	%i3,	%g6,	%o2
	ldsh	[%l7 + 0x70],	%i6
	move	%icc,	%o7,	%g7
	udiv	%o0,	0x175F,	%i7
	edge8ln	%i1,	%o4,	%g2
	srlx	%g4,	%l2,	%o1
	edge32	%g5,	%i0,	%o6
	movrgez	%g1,	%l4,	%g3
	stw	%l6,	[%l7 + 0x20]
	add	%o5,	0x1C0F,	%i2
	std	%f18,	[%l7 + 0x68]
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	stb	%i4,	[%l7 + 0x57]
	movrgz	%i5,	%l5,	%l3
	movvs	%icc,	%i3,	%o3
	subc	%g6,	0x17A7,	%o2
	addccc	%o7,	%g7,	%o0
	or	%i7,	%i6,	%i1
	movpos	%xcc,	%g2,	%g4
	popc	0x18D4,	%l2
	fmovrde	%o4,	%f14,	%f2
	ldsh	[%l7 + 0x50],	%g5
	fsrc2s	%f0,	%f26
	or	%i0,	0x1B4C,	%o1
	fornot1	%f20,	%f16,	%f2
	fmovda	%icc,	%f1,	%f23
	nop
	set	0x3F, %g5
	stb	%g1,	[%l7 + %g5]
	ldsw	[%l7 + 0x50],	%l4
	fmovdn	%xcc,	%f24,	%f21
	movge	%icc,	%o6,	%l6
	array16	%o5,	%g3,	%l0
	fcmpeq32	%f10,	%f14,	%l1
	sir	0x0C73
	xor	%i2,	%i5,	%i4
	mova	%icc,	%l3,	%i3
	mulscc	%o3,	0x1134,	%g6
	array8	%l5,	%o2,	%o7
	mulx	%o0,	0x0E06,	%i7
	fmovdleu	%xcc,	%f21,	%f21
	sll	%g7,	0x07,	%i1
	ld	[%l7 + 0x40],	%f12
	movgu	%xcc,	%g2,	%g4
	fmovsleu	%icc,	%f18,	%f8
	fmovsvc	%xcc,	%f10,	%f7
	edge32l	%i6,	%o4,	%g5
	fpadd32	%f24,	%f2,	%f2
	fone	%f14
	fpsub16s	%f30,	%f4,	%f27
	fnot2s	%f8,	%f29
	udiv	%i0,	0x0CA4,	%o1
	fexpand	%f15,	%f22
	fmovsgu	%xcc,	%f7,	%f22
	edge16n	%l2,	%g1,	%o6
	subcc	%l4,	0x06CE,	%l6
	save %g3, %o5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l0,	%i2,	%i5
	fmovdgu	%icc,	%f10,	%f10
	sub	%l3,	%i3,	%o3
	sllx	%i4,	0x08,	%l5
	xnor	%g6,	0x11C8,	%o2
	edge32l	%o7,	%i7,	%o0
	sra	%g7,	0x07,	%i1
	sdiv	%g2,	0x165E,	%i6
	orn	%o4,	0x17C9,	%g5
	fmovdcs	%icc,	%f29,	%f3
	ldsw	[%l7 + 0x38],	%g4
	fnor	%f8,	%f16,	%f2
	ldsh	[%l7 + 0x0A],	%o1
	srlx	%l2,	0x00,	%i0
	movgu	%icc,	%o6,	%g1
	udivx	%l6,	0x1487,	%l4
	orncc	%g3,	0x12FE,	%l1
	umulcc	%l0,	%o5,	%i2
	andncc	%l3,	%i3,	%i5
	movleu	%icc,	%o3,	%l5
	sllx	%g6,	0x10,	%o2
	sethi	0x1B9B,	%o7
	edge16ln	%i7,	%i4,	%g7
	std	%f4,	[%l7 + 0x58]
	mulscc	%i1,	%g2,	%o0
	andcc	%o4,	%i6,	%g5
	fcmpeq32	%f22,	%f18,	%o1
	ld	[%l7 + 0x2C],	%f16
	lduh	[%l7 + 0x42],	%g4
	edge8l	%l2,	%o6,	%g1
	movrne	%l6,	%i0,	%g3
	movrlz	%l4,	0x04D,	%l1
	add	%l0,	%i2,	%l3
	for	%f28,	%f0,	%f6
	fnegs	%f18,	%f4
	mulx	%i3,	0x1941,	%i5
	fmuld8ulx16	%f18,	%f8,	%f22
	subccc	%o3,	0x1357,	%l5
	for	%f2,	%f22,	%f14
	move	%icc,	%g6,	%o5
	sth	%o2,	[%l7 + 0x5C]
	udiv	%i7,	0x1D35,	%o7
	edge16ln	%g7,	%i4,	%i1
	save %o0, 0x03DE, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x6A],	%o4
	ldub	[%l7 + 0x58],	%g5
	fmovse	%xcc,	%f22,	%f22
	fmovdcs	%xcc,	%f23,	%f28
	ldsb	[%l7 + 0x08],	%o1
	orncc	%i6,	0x092D,	%l2
	std	%f16,	[%l7 + 0x48]
	fmovda	%icc,	%f3,	%f4
	fnands	%f15,	%f14,	%f7
	st	%f25,	[%l7 + 0x14]
	add	%o6,	%g1,	%l6
	edge32	%g4,	%i0,	%g3
	restore %l4, %l0, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%xcc,	%f29,	%f11
	movvs	%icc,	%i2,	%l3
	fmovsg	%xcc,	%f13,	%f5
	fmuld8sux16	%f16,	%f27,	%f2
	fxors	%f29,	%f26,	%f29
	ldd	[%l7 + 0x40],	%f14
	mulx	%i3,	0x1FCA,	%o3
	movg	%xcc,	%l5,	%g6
	add	%o5,	%i5,	%i7
	movvs	%icc,	%o2,	%o7
	std	%f8,	[%l7 + 0x48]
	srlx	%g7,	0x0F,	%i4
	udiv	%i1,	0x194A,	%g2
	stx	%o4,	[%l7 + 0x18]
	movre	%g5,	%o0,	%o1
	alignaddrl	%l2,	%o6,	%i6
	lduh	[%l7 + 0x24],	%l6
	edge8n	%g1,	%g4,	%i0
	sethi	0x1150,	%g3
	movpos	%icc,	%l4,	%l1
	ldx	[%l7 + 0x40],	%l0
	movgu	%xcc,	%i2,	%i3
	edge32ln	%o3,	%l5,	%g6
	mova	%xcc,	%o5,	%l3
	movg	%xcc,	%i5,	%o2
	andn	%o7,	%g7,	%i7
	smul	%i4,	%g2,	%o4
	movrgz	%g5,	%o0,	%o1
	fmovd	%f20,	%f14
	fmovsa	%xcc,	%f0,	%f31
	sllx	%i1,	0x18,	%l2
	edge32l	%i6,	%l6,	%o6
	addcc	%g4,	0x0378,	%g1
	fcmpne32	%f24,	%f26,	%i0
	fcmpeq16	%f4,	%f28,	%g3
	fmovda	%xcc,	%f28,	%f20
	fpsub32	%f0,	%f10,	%f6
	ldub	[%l7 + 0x6D],	%l1
	std	%f14,	[%l7 + 0x48]
	sdivcc	%l0,	0x04CB,	%l4
	udivcc	%i2,	0x1538,	%i3
	movcs	%icc,	%l5,	%g6
	ldd	[%l7 + 0x78],	%f2
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	fmovsleu	%icc,	%f8,	%f16
	movvs	%xcc,	%i5,	%o2
	ld	[%l7 + 0x18],	%f2
	edge16n	%o7,	%g7,	%i4
	fmovdvs	%icc,	%f18,	%f24
	sdivx	%g2,	0x17C9,	%o4
	xnorcc	%g5,	0x005D,	%o0
	movg	%icc,	%i7,	%o1
	fmovscs	%icc,	%f16,	%f20
	xnor	%l2,	0x1761,	%i6
	nop
	set	0x7B, %i1
	ldsb	[%l7 + %i1],	%l6
	alignaddrl	%i1,	%g4,	%g1
	addccc	%i0,	%g3,	%o6
	sdivcc	%l0,	0x1F57,	%l4
	edge16	%l1,	%i3,	%l5
	sllx	%g6,	0x1E,	%o3
	fmovdleu	%xcc,	%f30,	%f12
	fexpand	%f29,	%f22
	edge8l	%l3,	%o5,	%i2
	fandnot2	%f30,	%f18,	%f6
	ldsh	[%l7 + 0x6A],	%i5
	ldsh	[%l7 + 0x76],	%o2
	fmovdle	%xcc,	%f0,	%f20
	lduw	[%l7 + 0x5C],	%g7
	udivx	%i4,	0x1DB3,	%o7
	smulcc	%o4,	%g2,	%o0
	sll	%g5,	0x01,	%i7
	movleu	%icc,	%l2,	%o1
	xor	%i6,	%l6,	%g4
	addcc	%g1,	0x1369,	%i0
	movne	%icc,	%g3,	%o6
	movne	%xcc,	%l0,	%l4
	fmovdl	%xcc,	%f6,	%f23
	std	%f8,	[%l7 + 0x68]
	sll	%i1,	0x15,	%l1
	or	%l5,	0x0F87,	%i3
	fmovscc	%xcc,	%f8,	%f14
	fpsub32s	%f28,	%f14,	%f29
	fnors	%f6,	%f19,	%f19
	addccc	%o3,	0x0F9F,	%l3
	xnor	%o5,	%g6,	%i5
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%f16
	fnegd	%f22,	%f30
	edge16ln	%o2,	%i2,	%i4
	fmovrslz	%g7,	%f15,	%f10
	fmovrse	%o4,	%f14,	%f19
	stx	%o7,	[%l7 + 0x30]
	movge	%xcc,	%o0,	%g5
	movle	%icc,	%g2,	%i7
	srlx	%l2,	0x07,	%i6
	stb	%o1,	[%l7 + 0x2C]
	subc	%l6,	0x1F3F,	%g1
	sdivx	%g4,	0x0B0D,	%i0
	array16	%o6,	%g3,	%l4
	sethi	0x039B,	%l0
	stw	%l1,	[%l7 + 0x60]
	sub	%l5,	%i3,	%i1
	alignaddrl	%o3,	%l3,	%o5
	movg	%xcc,	%g6,	%o2
	sub	%i5,	0x020F,	%i4
	ld	[%l7 + 0x34],	%f27
	fnegs	%f16,	%f27
	fmovde	%xcc,	%f25,	%f13
	edge16ln	%i2,	%o4,	%g7
	fmovd	%f26,	%f14
	stb	%o0,	[%l7 + 0x09]
	lduw	[%l7 + 0x38],	%g5
	fnands	%f20,	%f30,	%f5
	edge16ln	%o7,	%i7,	%l2
	sir	0x166F
	add	%g2,	%i6,	%l6
	ldsh	[%l7 + 0x1E],	%g1
	edge8n	%o1,	%i0,	%g4
	addcc	%g3,	%o6,	%l4
	movge	%xcc,	%l0,	%l5
	udivx	%l1,	0x06E6,	%i1
	fornot2	%f30,	%f24,	%f10
	move	%icc,	%o3,	%i3
	movleu	%xcc,	%o5,	%g6
	sllx	%l3,	%o2,	%i5
	lduw	[%l7 + 0x74],	%i4
	fpadd16	%f4,	%f14,	%f18
	fcmpes	%fcc0,	%f16,	%f15
	sethi	0x0A8E,	%o4
	udivcc	%g7,	0x1844,	%o0
	movn	%icc,	%i2,	%o7
	sethi	0x0181,	%i7
	movg	%xcc,	%l2,	%g2
	subccc	%g5,	0x05CA,	%i6
	mulx	%g1,	0x1CA6,	%o1
	movrlz	%l6,	%i0,	%g4
	std	%f10,	[%l7 + 0x08]
	fzeros	%f15
	subccc	%g3,	%l4,	%l0
	smulcc	%o6,	0x0B40,	%l1
	edge16l	%l5,	%o3,	%i1
	ldd	[%l7 + 0x48],	%f6
	save %o5, %i3, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g6,	0x0037,	%o2
	subc	%i4,	0x036F,	%o4
	addcc	%g7,	0x0EC6,	%i5
	fxnors	%f16,	%f21,	%f0
	sethi	0x1DC4,	%i2
	movg	%xcc,	%o7,	%o0
	movcc	%icc,	%i7,	%l2
	xor	%g2,	%i6,	%g5
	xor	%g1,	0x1C9F,	%o1
	ldx	[%l7 + 0x08],	%i0
	stx	%l6,	[%l7 + 0x20]
	xnorcc	%g4,	0x19BB,	%g3
	umulcc	%l4,	0x04AA,	%o6
	fmovdne	%xcc,	%f8,	%f26
	fmovrsgez	%l1,	%f10,	%f26
	restore %l5, 0x0CE0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f12,	[%l7 + 0x28]
	nop
	set	0x70, %g3
	stw	%i1,	[%l7 + %g3]
	movl	%icc,	%o5,	%l0
	fnegd	%f14,	%f6
	ld	[%l7 + 0x5C],	%f10
	st	%f15,	[%l7 + 0x20]
	stw	%l3,	[%l7 + 0x20]
	fmovse	%icc,	%f22,	%f13
	lduh	[%l7 + 0x30],	%g6
	stb	%i3,	[%l7 + 0x72]
	sdivx	%i4,	0x08C3,	%o2
	fandnot2s	%f31,	%f27,	%f0
	edge8n	%o4,	%i5,	%i2
	and	%g7,	0x1BF8,	%o0
	stx	%o7,	[%l7 + 0x48]
	andcc	%i7,	%l2,	%i6
	fxnor	%f8,	%f28,	%f16
	movneg	%xcc,	%g5,	%g2
	movg	%xcc,	%o1,	%i0
	edge8	%l6,	%g4,	%g3
	fnors	%f31,	%f19,	%f4
	smul	%g1,	0x1CA0,	%o6
	ldx	[%l7 + 0x40],	%l1
	sir	0x18ED
	fmovde	%icc,	%f27,	%f15
	edge32	%l4,	%o3,	%i1
	movne	%icc,	%l5,	%l0
	mulx	%o5,	0x14CE,	%l3
	umul	%i3,	%i4,	%g6
	ld	[%l7 + 0x18],	%f31
	mulx	%o2,	0x042E,	%o4
	fornot2	%f28,	%f24,	%f10
	xorcc	%i2,	%g7,	%o0
	edge32n	%o7,	%i5,	%i7
	std	%f14,	[%l7 + 0x58]
	ldd	[%l7 + 0x68],	%f30
	andncc	%l2,	%i6,	%g5
	ldsb	[%l7 + 0x24],	%g2
	subccc	%i0,	%l6,	%g4
	fmovsleu	%xcc,	%f25,	%f28
	lduh	[%l7 + 0x1C],	%o1
	smulcc	%g1,	0x1DC9,	%g3
	andn	%o6,	%l1,	%o3
	fmovrse	%i1,	%f14,	%f13
	ldd	[%l7 + 0x18],	%l4
	popc	0x093F,	%l5
	addcc	%l0,	%o5,	%l3
	lduw	[%l7 + 0x7C],	%i3
	add	%i4,	0x1D22,	%o2
	fandnot1s	%f10,	%f28,	%f1
	ldsw	[%l7 + 0x38],	%g6
	movge	%xcc,	%i2,	%g7
	movg	%xcc,	%o4,	%o0
	ldx	[%l7 + 0x70],	%i5
	xorcc	%i7,	0x1B14,	%o7
	srl	%l2,	%i6,	%g5
	mulscc	%i0,	%g2,	%g4
	sethi	0x04CB,	%o1
	save %g1, 0x1509, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x55],	%g3
	sdivcc	%o6,	0x0151,	%o3
	edge8	%l1,	%i1,	%l4
	movn	%xcc,	%l0,	%o5
	xor	%l3,	0x15F0,	%i3
	movvs	%icc,	%l5,	%i4
	sllx	%g6,	%o2,	%i2
	fmovscs	%xcc,	%f16,	%f20
	fandnot2s	%f8,	%f28,	%f26
	sllx	%g7,	%o4,	%o0
	std	%f0,	[%l7 + 0x58]
	andcc	%i5,	%i7,	%l2
	xor	%i6,	%g5,	%o7
	fnegs	%f17,	%f23
	fmul8x16	%f21,	%f24,	%f12
	andcc	%i0,	0x1F8E,	%g2
	sth	%g4,	[%l7 + 0x74]
	fmovrde	%o1,	%f4,	%f18
	movvc	%icc,	%g1,	%g3
	and	%o6,	0x0486,	%l6
	sdiv	%o3,	0x056C,	%i1
	edge16ln	%l1,	%l0,	%l4
	fmovdvs	%xcc,	%f16,	%f25
	umulcc	%o5,	%i3,	%l3
	sllx	%i4,	0x0A,	%l5
	fmovd	%f24,	%f6
	movrlez	%g6,	0x054,	%i2
	andncc	%o2,	%g7,	%o0
	fmovrdne	%o4,	%f12,	%f24
	array32	%i7,	%l2,	%i6
	smulcc	%g5,	0x01BD,	%i5
	umulcc	%i0,	0x09FA,	%g2
	stw	%o7,	[%l7 + 0x5C]
	udivx	%o1,	0x0F90,	%g4
	xnor	%g1,	0x0B7E,	%g3
	stx	%o6,	[%l7 + 0x58]
	fmovrsne	%l6,	%f20,	%f5
	fnot2	%f24,	%f4
	fpsub16s	%f0,	%f29,	%f19
	umulcc	%i1,	0x1DBE,	%l1
	ldsb	[%l7 + 0x28],	%o3
	lduh	[%l7 + 0x48],	%l4
	sdivcc	%l0,	0x0B54,	%o5
	umulcc	%l3,	%i3,	%i4
	ldub	[%l7 + 0x38],	%l5
	array16	%g6,	%i2,	%g7
	movg	%icc,	%o2,	%o0
	edge16	%i7,	%l2,	%o4
	sra	%g5,	0x07,	%i5
	or	%i0,	0x0D1E,	%i6
	ldd	[%l7 + 0x28],	%f24
	ldsw	[%l7 + 0x40],	%o7
	fmovrse	%o1,	%f2,	%f27
	sll	%g2,	0x1F,	%g1
	mova	%xcc,	%g3,	%g4
	sdiv	%l6,	0x1440,	%o6
	addcc	%l1,	0x1E3F,	%o3
	fmovsneg	%xcc,	%f27,	%f3
	fpmerge	%f31,	%f16,	%f12
	xnorcc	%l4,	0x107A,	%i1
	save %o5, %l0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x50],	%i4
	nop
	set	0x48, %l0
	ldsw	[%l7 + %l0],	%l5
	edge16	%g6,	%i3,	%g7
	add	%i2,	0x09F5,	%o2
	addcc	%i7,	%l2,	%o4
	edge16l	%g5,	%i5,	%o0
	nop
	set	0x24, %g6
	stw	%i0,	[%l7 + %g6]
	fmovd	%f8,	%f6
	fmul8sux16	%f4,	%f0,	%f4
	sir	0x1484
	fmovdleu	%xcc,	%f13,	%f22
	sllx	%o7,	0x0F,	%i6
	array32	%g2,	%o1,	%g1
	edge8	%g4,	%g3,	%l6
	edge8n	%o6,	%l1,	%o3
	fands	%f12,	%f18,	%f2
	movne	%icc,	%i1,	%l4
	edge32ln	%l0,	%l3,	%i4
	fcmpes	%fcc3,	%f10,	%f25
	and	%o5,	0x1BA1,	%l5
	movl	%xcc,	%g6,	%i3
	edge32ln	%i2,	%o2,	%g7
	xorcc	%i7,	0x06FB,	%o4
	orn	%l2,	%g5,	%i5
	save %i0, %o0, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f4,	%f2,	%f2
	edge8	%g2,	%o7,	%o1
	fand	%f30,	%f20,	%f10
	subcc	%g1,	0x161D,	%g3
	fsrc1s	%f30,	%f19
	udiv	%l6,	0x0DC6,	%g4
	fmovscc	%xcc,	%f28,	%f10
	movcc	%xcc,	%l1,	%o6
	ldsb	[%l7 + 0x39],	%o3
	fnot1	%f4,	%f8
	fmovsne	%xcc,	%f15,	%f22
	sub	%l4,	%l0,	%l3
	movrlez	%i1,	%o5,	%l5
	sth	%i4,	[%l7 + 0x62]
	movrlz	%g6,	0x003,	%i3
	sra	%i2,	%o2,	%g7
	movcc	%xcc,	%o4,	%l2
	popc	0x1CE8,	%g5
	edge32n	%i5,	%i7,	%o0
	umul	%i0,	0x12F2,	%i6
	movrgz	%o7,	0x369,	%o1
	ld	[%l7 + 0x14],	%f2
	stx	%g2,	[%l7 + 0x50]
	xor	%g1,	0x1C51,	%g3
	array32	%g4,	%l1,	%l6
	movn	%xcc,	%o6,	%l4
	fmovdg	%icc,	%f1,	%f20
	addcc	%o3,	%l3,	%l0
	fornot2	%f26,	%f16,	%f14
	sllx	%o5,	0x15,	%i1
	fmul8x16au	%f31,	%f1,	%f26
	alignaddrl	%i4,	%l5,	%i3
	sethi	0x1FD7,	%i2
	stb	%g6,	[%l7 + 0x69]
	fmovrde	%g7,	%f30,	%f20
	fmovrse	%o4,	%f16,	%f23
	fpadd32	%f16,	%f30,	%f2
	siam	0x3
	add	%l2,	%o2,	%i5
	stw	%i7,	[%l7 + 0x68]
	xorcc	%o0,	0x022C,	%i0
	fpack32	%f16,	%f0,	%f8
	xorcc	%g5,	0x1990,	%i6
	movrne	%o7,	0x16D,	%o1
	ld	[%l7 + 0x24],	%f1
	xor	%g1,	%g2,	%g3
	array32	%l1,	%g4,	%l6
	faligndata	%f4,	%f28,	%f24
	fmovdg	%xcc,	%f9,	%f24
	xnor	%o6,	%l4,	%l3
	movrne	%o3,	%o5,	%l0
	srl	%i1,	0x10,	%i4
	and	%i3,	%i2,	%g6
	subc	%l5,	0x180A,	%o4
	lduh	[%l7 + 0x08],	%g7
	andncc	%l2,	%o2,	%i7
	orncc	%o0,	%i0,	%g5
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	array32	%o1,	%g1,	%g2
	fsrc2s	%f9,	%f0
	ldd	[%l7 + 0x60],	%o6
	movleu	%icc,	%g3,	%g4
	fpsub32s	%f10,	%f8,	%f16
	ldd	[%l7 + 0x68],	%l0
	edge16l	%o6,	%l6,	%l4
	ldx	[%l7 + 0x50],	%o3
	sll	%l3,	0x0C,	%l0
	fpackfix	%f20,	%f17
	fmovscs	%icc,	%f13,	%f22
	edge8l	%o5,	%i1,	%i3
	edge32n	%i2,	%g6,	%i4
	edge8ln	%o4,	%g7,	%l2
	ldsw	[%l7 + 0x14],	%l5
	mova	%xcc,	%i7,	%o2
	nop
	set	0x18, %i0
	stx	%i0,	[%l7 + %i0]
	umul	%o0,	0x0CA1,	%i6
	xnor	%g5,	%i5,	%g1
	movcc	%icc,	%g2,	%o1
	edge8ln	%g3,	%g4,	%l1
	fpadd32s	%f1,	%f26,	%f30
	addccc	%o6,	%o7,	%l6
	ldd	[%l7 + 0x40],	%l4
	fmovrdgz	%l3,	%f18,	%f22
	andn	%l0,	%o5,	%i1
	movge	%icc,	%o3,	%i2
	edge8l	%i3,	%i4,	%o4
	sllx	%g6,	%l2,	%l5
	lduh	[%l7 + 0x44],	%g7
	sllx	%i7,	%o2,	%o0
	andncc	%i6,	%g5,	%i0
	stb	%g1,	[%l7 + 0x0C]
	fmovdcc	%xcc,	%f4,	%f30
	ldsw	[%l7 + 0x54],	%i5
	addccc	%g2,	0x141D,	%o1
	fcmple16	%f18,	%f4,	%g4
	movg	%icc,	%l1,	%g3
	movrgez	%o7,	%l6,	%o6
	fmovdne	%icc,	%f0,	%f9
	movle	%icc,	%l3,	%l0
	fsrc1s	%f30,	%f30
	fornot2s	%f14,	%f26,	%f30
	edge32n	%l4,	%i1,	%o3
	udivcc	%i2,	0x086A,	%o5
	mulscc	%i3,	%i4,	%o4
	sub	%l2,	%g6,	%g7
	fmovd	%f24,	%f10
	sethi	0x15C6,	%l5
	fnors	%f1,	%f10,	%f15
	array8	%i7,	%o2,	%i6
	andcc	%o0,	%i0,	%g5
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%g0
	edge8l	%i5,	%g2,	%g4
	nop
	set	0x31, %g7
	stb	%o1,	[%l7 + %g7]
	fnot2	%f30,	%f22
	edge16ln	%l1,	%o7,	%l6
	sll	%o6,	%l3,	%l0
	movneg	%xcc,	%g3,	%i1
	fnands	%f16,	%f17,	%f13
	sir	0x1B94
	mova	%icc,	%o3,	%i2
	fpadd32s	%f5,	%f30,	%f27
	restore %o5, 0x020A, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%i4,	%o4
	subcc	%l4,	%g6,	%l2
	movn	%xcc,	%l5,	%i7
	array8	%g7,	%o2,	%i6
	edge8l	%i0,	%o0,	%g5
	fsrc2	%f20,	%f8
	movne	%icc,	%i5,	%g2
	edge8l	%g4,	%o1,	%l1
	movn	%xcc,	%o7,	%l6
	sdiv	%g1,	0x06AD,	%l3
	array8	%l0,	%g3,	%i1
	orn	%o6,	0x15FF,	%o3
	srlx	%i2,	0x14,	%o5
	orncc	%i3,	0x1B95,	%i4
	fmovsvs	%xcc,	%f18,	%f17
	sllx	%o4,	%g6,	%l2
	movcc	%xcc,	%l5,	%i7
	stx	%l4,	[%l7 + 0x78]
	fmovdneg	%xcc,	%f0,	%f16
	sir	0x12D2
	sdiv	%o2,	0x1991,	%g7
	sdivx	%i0,	0x1FDC,	%i6
	fmovse	%xcc,	%f26,	%f25
	movrlez	%g5,	0x1B5,	%i5
	ldd	[%l7 + 0x78],	%f30
	movvc	%icc,	%o0,	%g4
	subcc	%o1,	%g2,	%o7
	or	%l6,	0x06ED,	%l1
	srl	%l3,	%l0,	%g1
	edge32l	%g3,	%o6,	%o3
	ldsh	[%l7 + 0x10],	%i1
	addc	%i2,	0x113B,	%i3
	mulx	%o5,	%o4,	%i4
	sdiv	%l2,	0x0A16,	%g6
	movrne	%l5,	%i7,	%o2
	edge16n	%l4,	%g7,	%i0
	movle	%icc,	%g5,	%i6
	ldsw	[%l7 + 0x30],	%i5
	fcmpd	%fcc2,	%f12,	%f28
	stx	%g4,	[%l7 + 0x10]
	popc	0x085E,	%o0
	movcc	%icc,	%g2,	%o1
	fxnors	%f8,	%f24,	%f26
	fmovse	%xcc,	%f29,	%f21
	edge16n	%o7,	%l6,	%l1
	movneg	%xcc,	%l0,	%l3
	edge8	%g1,	%g3,	%o3
	fabss	%f29,	%f17
	movcc	%icc,	%i1,	%o6
	ld	[%l7 + 0x78],	%f21
	xnorcc	%i3,	0x07B5,	%i2
	std	%f4,	[%l7 + 0x68]
	sethi	0x02BC,	%o5
	fmovdne	%icc,	%f12,	%f7
	lduw	[%l7 + 0x78],	%o4
	udivcc	%l2,	0x1901,	%i4
	movle	%icc,	%l5,	%i7
	stw	%g6,	[%l7 + 0x10]
	orncc	%l4,	0x02B8,	%o2
	sth	%g7,	[%l7 + 0x2E]
	alignaddrl	%i0,	%g5,	%i6
	or	%i5,	0x178B,	%g4
	sth	%g2,	[%l7 + 0x0C]
	sub	%o1,	0x0FA3,	%o0
	fnot1s	%f3,	%f3
	array8	%o7,	%l1,	%l6
	sllx	%l3,	%l0,	%g1
	edge32l	%g3,	%i1,	%o6
	fandnot2s	%f31,	%f16,	%f12
	umulcc	%o3,	0x1FFB,	%i2
	addcc	%i3,	0x1254,	%o4
	array8	%o5,	%i4,	%l5
	fmovsvs	%xcc,	%f3,	%f7
	movvs	%icc,	%i7,	%g6
	edge16ln	%l4,	%l2,	%o2
	edge32n	%g7,	%g5,	%i0
	movgu	%icc,	%i6,	%g4
	mulscc	%i5,	0x1A53,	%g2
	fnors	%f0,	%f16,	%f17
	edge8l	%o1,	%o7,	%l1
	mulx	%o0,	0x0849,	%l3
	and	%l6,	%g1,	%l0
	sir	0x14DE
	andn	%g3,	0x1ABE,	%o6
	movneg	%icc,	%o3,	%i2
	fmovdneg	%xcc,	%f15,	%f20
	movcs	%icc,	%i3,	%i1
	alignaddr	%o5,	%o4,	%l5
	movvc	%icc,	%i4,	%i7
	udivx	%l4,	0x13BE,	%l2
	andncc	%o2,	%g6,	%g5
	movge	%xcc,	%g7,	%i6
	fornot1	%f2,	%f18,	%f0
	movneg	%xcc,	%g4,	%i5
	ldsh	[%l7 + 0x36],	%g2
	movvc	%xcc,	%o1,	%o7
	movcs	%icc,	%i0,	%o0
	addc	%l3,	%l1,	%l6
	movge	%xcc,	%g1,	%g3
	fsrc1s	%f28,	%f5
	move	%xcc,	%l0,	%o6
	umulcc	%i2,	%i3,	%o3
	sdivx	%i1,	0x072E,	%o4
	movcs	%xcc,	%o5,	%l5
	sth	%i4,	[%l7 + 0x6C]
	srax	%i7,	0x10,	%l4
	fmovsvs	%icc,	%f19,	%f6
	xnor	%l2,	0x0C05,	%o2
	ldsw	[%l7 + 0x40],	%g5
	fmovrslez	%g6,	%f9,	%f6
	fzeros	%f20
	movg	%xcc,	%i6,	%g4
	subc	%g7,	%g2,	%o1
	edge16ln	%i5,	%i0,	%o0
	movrlez	%o7,	0x2CA,	%l1
	or	%l3,	0x1990,	%l6
	udivcc	%g3,	0x0465,	%l0
	fmovdcc	%xcc,	%f31,	%f19
	umulcc	%o6,	0x13D9,	%g1
	nop
	set	0x18, %o7
	lduw	[%l7 + %o7],	%i2
	movrlz	%o3,	%i1,	%i3
	fxnor	%f8,	%f22,	%f14
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	ldsh	[%l7 + 0x78],	%i7
	array8	%l4,	%l2,	%i4
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%f4
	and	%o2,	%g5,	%g6
	st	%f20,	[%l7 + 0x78]
	alignaddr	%g4,	%g7,	%i6
	xor	%g2,	%o1,	%i0
	edge8n	%o0,	%o7,	%i5
	fcmple32	%f2,	%f22,	%l3
	sub	%l6,	%g3,	%l1
	edge8ln	%o6,	%g1,	%i2
	movle	%xcc,	%l0,	%o3
	stx	%i1,	[%l7 + 0x70]
	array16	%o4,	%i3,	%l5
	edge16n	%o5,	%l4,	%i7
	fnot1s	%f28,	%f26
	edge16	%l2,	%i4,	%o2
	array32	%g5,	%g4,	%g7
	mova	%icc,	%i6,	%g6
	fmovdcc	%xcc,	%f8,	%f23
	movl	%xcc,	%o1,	%g2
	ldsh	[%l7 + 0x36],	%o0
	fcmpes	%fcc3,	%f3,	%f25
	edge32l	%o7,	%i0,	%l3
	pdist	%f14,	%f10,	%f24
	movcc	%icc,	%i5,	%g3
	edge16ln	%l1,	%o6,	%l6
	xnor	%g1,	0x1BC7,	%l0
	stb	%o3,	[%l7 + 0x77]
	xnorcc	%i2,	%i1,	%i3
	movg	%icc,	%l5,	%o5
	lduh	[%l7 + 0x1A],	%o4
	fmovdvs	%xcc,	%f26,	%f11
	sth	%l4,	[%l7 + 0x18]
	array32	%i7,	%i4,	%l2
	stb	%o2,	[%l7 + 0x43]
	edge16l	%g4,	%g5,	%g7
	fpsub32s	%f31,	%f7,	%f3
	movre	%i6,	%g6,	%o1
	edge32n	%o0,	%g2,	%o7
	mulscc	%i0,	0x0CD2,	%i5
	fnors	%f12,	%f2,	%f3
	fpack16	%f16,	%f31
	lduw	[%l7 + 0x48],	%g3
	addc	%l1,	%l3,	%o6
	fmovspos	%xcc,	%f29,	%f28
	ldd	[%l7 + 0x20],	%i6
	fmovrdgz	%l0,	%f28,	%f14
	movrlz	%g1,	0x3A2,	%i2
	fmovrslez	%o3,	%f12,	%f5
	movcs	%icc,	%i3,	%l5
	andcc	%o5,	%o4,	%l4
	movcs	%xcc,	%i1,	%i4
	orncc	%l2,	%i7,	%g4
	smul	%g5,	0x1190,	%o2
	edge8	%g7,	%g6,	%i6
	umul	%o1,	0x096C,	%o0
	smulcc	%o7,	0x1DDA,	%i0
	movrgz	%g2,	%i5,	%g3
	xnorcc	%l1,	%l3,	%l6
	edge16n	%l0,	%o6,	%g1
	movpos	%icc,	%i2,	%o3
	orcc	%l5,	%i3,	%o5
	fpadd16	%f2,	%f20,	%f8
	xnorcc	%o4,	%i1,	%l4
	save %i4, 0x1AC5, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%g4,	%f10,	%f26
	movgu	%icc,	%g5,	%o2
	sir	0x1B7B
	addccc	%g7,	%g6,	%i6
	fxor	%f22,	%f16,	%f8
	edge32ln	%l2,	%o1,	%o7
	alignaddr	%i0,	%o0,	%g2
	fcmpd	%fcc2,	%f2,	%f24
	fabsd	%f22,	%f18
	ldub	[%l7 + 0x34],	%g3
	fmovrslz	%l1,	%f14,	%f21
	fpadd32	%f12,	%f30,	%f8
	edge8l	%i5,	%l3,	%l6
	fmuld8sux16	%f10,	%f21,	%f30
	movg	%xcc,	%l0,	%o6
	fmovrslez	%g1,	%f22,	%f23
	ldsw	[%l7 + 0x0C],	%o3
	mova	%icc,	%i2,	%i3
	sra	%l5,	0x04,	%o5
	fmovsneg	%icc,	%f31,	%f26
	restore %i1, %l4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i7,	%g4,	%g5
	fmovsvc	%xcc,	%f31,	%f31
	st	%f23,	[%l7 + 0x54]
	popc	0x1022,	%o2
	mulx	%i4,	0x1BC2,	%g7
	nop
	set	0x17, %i3
	stb	%g6,	[%l7 + %i3]
	sdivcc	%l2,	0x00D2,	%i6
	addc	%o7,	%i0,	%o1
	fmovrsgz	%o0,	%f17,	%f25
	sll	%g3,	0x13,	%g2
	fmovscc	%xcc,	%f1,	%f9
	mulx	%i5,	%l3,	%l1
	smul	%l6,	0x04EE,	%o6
	fornot1s	%f29,	%f24,	%f25
	fsrc2	%f12,	%f30
	fpadd16	%f12,	%f18,	%f8
	fabss	%f5,	%f24
	add	%g1,	%l0,	%i2
	sra	%i3,	%l5,	%o5
	edge16n	%o3,	%i1,	%l4
	nop
	set	0x48, %o6
	ldsw	[%l7 + %o6],	%o4
	fpsub16s	%f8,	%f26,	%f7
	xor	%g4,	%g5,	%o2
	fpmerge	%f9,	%f23,	%f0
	orncc	%i4,	0x07AF,	%g7
	subcc	%i7,	0x0E44,	%g6
	sdivx	%l2,	0x0F90,	%o7
	alignaddrl	%i0,	%i6,	%o1
	addc	%g3,	%g2,	%o0
	movleu	%xcc,	%i5,	%l1
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%f28
	std	%f26,	[%l7 + 0x40]
	movvc	%icc,	%l3,	%l6
	xnorcc	%o6,	0x1A6A,	%g1
	fmovrdne	%l0,	%f6,	%f16
	movne	%xcc,	%i3,	%i2
	orcc	%o5,	%o3,	%i1
	movgu	%icc,	%l4,	%l5
	subccc	%o4,	0x10CD,	%g5
	subcc	%g4,	%i4,	%g7
	sra	%o2,	0x0A,	%i7
	ldx	[%l7 + 0x38],	%g6
	fxors	%f8,	%f11,	%f3
	sll	%o7,	0x1B,	%i0
	save %i6, %l2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%o1,	%o0
	fpack32	%f22,	%f16,	%f28
	fexpand	%f25,	%f22
	stw	%i5,	[%l7 + 0x60]
	movge	%icc,	%l1,	%l3
	edge16l	%g2,	%l6,	%g1
	edge8ln	%o6,	%l0,	%i2
	subccc	%o5,	0x1FC0,	%o3
	addccc	%i1,	%l4,	%i3
	array8	%o4,	%g5,	%g4
	srl	%i4,	0x09,	%g7
	fsrc2s	%f14,	%f8
	alignaddr	%l5,	%i7,	%g6
	ldub	[%l7 + 0x34],	%o7
	sethi	0x1696,	%i0
	ldd	[%l7 + 0x48],	%f0
	srlx	%i6,	%o2,	%g3
	xor	%o1,	%l2,	%o0
	movg	%icc,	%i5,	%l3
	faligndata	%f16,	%f12,	%f26
	ldub	[%l7 + 0x1E],	%g2
	orn	%l1,	0x044A,	%g1
	fmovsleu	%xcc,	%f16,	%f29
	fcmped	%fcc0,	%f18,	%f22
	stb	%l6,	[%l7 + 0x2B]
	movgu	%icc,	%l0,	%o6
	lduw	[%l7 + 0x30],	%i2
	fmovrsgez	%o3,	%f24,	%f7
	alignaddr	%i1,	%o5,	%i3
	sdiv	%o4,	0x05DC,	%g5
	xor	%l4,	%i4,	%g7
	add	%l5,	0x0A3D,	%g4
	fmovscs	%xcc,	%f14,	%f15
	fpsub16s	%f15,	%f26,	%f30
	array8	%g6,	%o7,	%i7
	edge8l	%i0,	%o2,	%i6
	srl	%o1,	%l2,	%o0
	array32	%i5,	%g3,	%l3
	fmovsleu	%icc,	%f13,	%f21
	sub	%l1,	%g2,	%l6
	xorcc	%l0,	%o6,	%i2
	orn	%g1,	%i1,	%o3
	fornot1	%f30,	%f6,	%f26
	movpos	%xcc,	%o5,	%o4
	ld	[%l7 + 0x54],	%f24
	fornot1s	%f30,	%f27,	%f31
	edge16ln	%i3,	%g5,	%i4
	subc	%l4,	0x0BCD,	%l5
	sra	%g4,	%g7,	%o7
	umulcc	%g6,	%i0,	%i7
	fmuld8ulx16	%f20,	%f5,	%f0
	edge16l	%i6,	%o1,	%o2
	andncc	%o0,	%l2,	%g3
	movre	%i5,	%l1,	%l3
	movne	%icc,	%g2,	%l6
	fmovsa	%xcc,	%f31,	%f25
	movle	%icc,	%l0,	%i2
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	alignaddr	%o5,	%o4,	%i3
	edge16n	%o3,	%i4,	%l4
	movrlz	%g5,	%l5,	%g4
	movge	%xcc,	%o7,	%g7
	lduh	[%l7 + 0x0E],	%i0
	udivcc	%i7,	0x0070,	%i6
	fmovsvc	%xcc,	%f25,	%f19
	edge8	%o1,	%o2,	%g6
	stb	%l2,	[%l7 + 0x7C]
	stw	%g3,	[%l7 + 0x18]
	movvc	%xcc,	%i5,	%l1
	popc	%l3,	%o0
	std	%f6,	[%l7 + 0x78]
	mova	%icc,	%g2,	%l6
	fabss	%f20,	%f28
	edge16ln	%i2,	%l0,	%g1
	edge16ln	%o6,	%o5,	%i1
	movre	%i3,	%o3,	%o4
	udivx	%l4,	0x1D3B,	%i4
	sllx	%l5,	0x05,	%g4
	save %g5, %o7, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i7,	%i6,	%g7
	fmovrsgz	%o2,	%f24,	%f20
	sir	0x1F1A
	fmovsvs	%xcc,	%f29,	%f19
	umul	%g6,	0x0A88,	%o1
	movne	%icc,	%l2,	%g3
	fcmpne16	%f2,	%f30,	%l1
	movl	%icc,	%l3,	%i5
	fcmpgt16	%f14,	%f12,	%g2
	udiv	%o0,	0x142D,	%i2
	nop
	set	0x10, %l4
	stw	%l6,	[%l7 + %l4]
	sllx	%l0,	%o6,	%g1
	stb	%o5,	[%l7 + 0x16]
	umul	%i1,	0x0C3A,	%o3
	ldsb	[%l7 + 0x24],	%o4
	restore %i3, 0x0516, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l4,	0x11,	%l5
	movvs	%icc,	%g5,	%g4
	fmovsleu	%xcc,	%f5,	%f6
	lduh	[%l7 + 0x2C],	%i0
	fabsd	%f8,	%f26
	fmovdvs	%xcc,	%f4,	%f20
	move	%xcc,	%i7,	%o7
	udivcc	%g7,	0x1D48,	%i6
	fmovdcs	%xcc,	%f7,	%f9
	alignaddrl	%o2,	%o1,	%l2
	ldx	[%l7 + 0x40],	%g3
	fmovsne	%xcc,	%f19,	%f14
	udivx	%g6,	0x0290,	%l3
	fxnors	%f23,	%f3,	%f26
	fxor	%f4,	%f0,	%f14
	addcc	%i5,	0x0F91,	%g2
	alignaddrl	%o0,	%i2,	%l1
	edge8	%l0,	%l6,	%o6
	fmovsg	%icc,	%f2,	%f26
	fpsub16s	%f8,	%f12,	%f21
	std	%f12,	[%l7 + 0x08]
	edge16l	%g1,	%o5,	%o3
	and	%o4,	%i3,	%i4
	smulcc	%i1,	0x0CE5,	%l5
	edge32	%g5,	%g4,	%i0
	ldsh	[%l7 + 0x46],	%i7
	sethi	0x0E50,	%o7
	edge16	%l4,	%g7,	%i6
	fmovdg	%xcc,	%f30,	%f11
	ldsh	[%l7 + 0x30],	%o2
	ldx	[%l7 + 0x28],	%l2
	fornot2	%f20,	%f22,	%f8
	movleu	%xcc,	%o1,	%g6
	stb	%l3,	[%l7 + 0x68]
	movne	%xcc,	%g3,	%i5
	sir	0x051F
	fmuld8sux16	%f5,	%f4,	%f10
	sth	%o0,	[%l7 + 0x2C]
	movvc	%xcc,	%i2,	%l1
	edge32l	%g2,	%l6,	%l0
	ldd	[%l7 + 0x28],	%o6
	lduh	[%l7 + 0x7A],	%g1
	fnegs	%f25,	%f31
	sdiv	%o3,	0x047B,	%o4
	movvs	%icc,	%i3,	%o5
	edge8ln	%i4,	%l5,	%g5
	movrgez	%g4,	0x122,	%i0
	xorcc	%i1,	0x1F31,	%i7
	srl	%o7,	%g7,	%i6
	edge32l	%l4,	%o2,	%o1
	fnegd	%f22,	%f8
	fmovdcc	%xcc,	%f22,	%f20
	sethi	0x1EA1,	%g6
	ld	[%l7 + 0x48],	%f11
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	edge16n	%i5,	%i2,	%l1
	subc	%g2,	0x1FA6,	%o0
	ldd	[%l7 + 0x58],	%l0
	smul	%l6,	0x15B2,	%g1
	udivx	%o3,	0x1A86,	%o4
	movl	%icc,	%i3,	%o5
	edge8l	%o6,	%i4,	%g5
	sdivcc	%g4,	0x186A,	%l5
	sethi	0x10B0,	%i1
	mulscc	%i7,	%o7,	%g7
	ldsh	[%l7 + 0x14],	%i0
	alignaddrl	%i6,	%o2,	%o1
	sdiv	%g6,	0x1315,	%l3
	udivx	%l4,	0x03C0,	%g3
	addcc	%l2,	%i2,	%i5
	edge16n	%g2,	%o0,	%l0
	and	%l1,	%l6,	%o3
	fpadd32	%f22,	%f16,	%f0
	xnorcc	%g1,	0x1982,	%o4
	udivcc	%o5,	0x1B2C,	%o6
	movleu	%xcc,	%i4,	%i3
	xor	%g4,	%l5,	%g5
	movl	%xcc,	%i7,	%o7
	edge8	%i1,	%i0,	%i6
	sllx	%o2,	0x1E,	%o1
	movvs	%icc,	%g7,	%g6
	add	%l4,	%l3,	%l2
	movgu	%xcc,	%i2,	%i5
	fmovdle	%xcc,	%f2,	%f26
	xorcc	%g2,	%o0,	%l0
	sdivcc	%g3,	0x0D84,	%l6
	andn	%o3,	0x1979,	%l1
	sdivcc	%g1,	0x06BF,	%o4
	movg	%xcc,	%o5,	%i4
	xor	%o6,	%g4,	%l5
	fmovsle	%icc,	%f30,	%f22
	ld	[%l7 + 0x5C],	%f14
	movleu	%icc,	%i3,	%i7
	fmovse	%icc,	%f24,	%f13
	edge16n	%o7,	%g5,	%i1
	sdivcc	%i6,	0x0851,	%o2
	movge	%icc,	%o1,	%i0
	sdivx	%g7,	0x1412,	%g6
	fmovdl	%icc,	%f27,	%f31
	fnegd	%f0,	%f12
	orn	%l4,	0x1538,	%l2
	srax	%i2,	%i5,	%g2
	srlx	%o0,	%l3,	%g3
	movcc	%icc,	%l6,	%o3
	fabsd	%f28,	%f0
	orn	%l0,	0x083A,	%g1
	std	%f28,	[%l7 + 0x68]
	stw	%l1,	[%l7 + 0x3C]
	smulcc	%o5,	0x14C3,	%i4
	std	%f14,	[%l7 + 0x18]
	udiv	%o6,	0x0F4B,	%o4
	sdiv	%g4,	0x1308,	%i3
	st	%f4,	[%l7 + 0x70]
	mulscc	%l5,	%i7,	%g5
	fmovdge	%icc,	%f17,	%f27
	movcc	%icc,	%i1,	%i6
	orn	%o2,	%o7,	%o1
	xor	%i0,	%g7,	%g6
	movre	%l4,	%l2,	%i5
	edge16l	%g2,	%o0,	%l3
	fsrc1	%f26,	%f28
	xnorcc	%i2,	%g3,	%o3
	fpackfix	%f26,	%f21
	movgu	%xcc,	%l0,	%g1
	ldsh	[%l7 + 0x52],	%l6
	movl	%xcc,	%o5,	%l1
	movleu	%icc,	%o6,	%o4
	sra	%i4,	%g4,	%l5
	or	%i3,	0x005F,	%g5
	edge32n	%i7,	%i1,	%o2
	movre	%o7,	0x1CD,	%o1
	smul	%i0,	%g7,	%i6
	xnor	%g6,	%l4,	%i5
	fpsub32	%f6,	%f22,	%f26
	movpos	%icc,	%g2,	%o0
	fcmpes	%fcc3,	%f13,	%f31
	sub	%l3,	%l2,	%i2
	movvc	%icc,	%g3,	%l0
	movrlez	%o3,	%l6,	%g1
	edge32l	%l1,	%o5,	%o4
	orcc	%o6,	0x1C3C,	%g4
	fpackfix	%f24,	%f20
	lduh	[%l7 + 0x52],	%l5
	xor	%i3,	0x077B,	%g5
	array8	%i4,	%i1,	%o2
	sth	%i7,	[%l7 + 0x42]
	ldx	[%l7 + 0x58],	%o7
	movrgz	%i0,	0x0A5,	%g7
	fmovde	%xcc,	%f10,	%f29
	movcc	%xcc,	%i6,	%o1
	edge8l	%l4,	%g6,	%g2
	move	%icc,	%o0,	%i5
	fmuld8sux16	%f4,	%f29,	%f2
	fcmped	%fcc2,	%f4,	%f30
	fmovse	%icc,	%f2,	%f22
	fandnot1	%f16,	%f26,	%f4
	sethi	0x0DEF,	%l2
	sub	%l3,	%i2,	%g3
	edge32l	%o3,	%l0,	%g1
	edge8	%l6,	%o5,	%o4
	fmovsvs	%icc,	%f27,	%f2
	save %l1, 0x040C, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x34],	%o6
	movn	%icc,	%l5,	%g5
	xnor	%i4,	0x1B54,	%i3
	subc	%i1,	%o2,	%o7
	fmovs	%f20,	%f29
	srl	%i7,	%g7,	%i0
	ldx	[%l7 + 0x10],	%i6
	edge32l	%o1,	%g6,	%l4
	movleu	%icc,	%o0,	%g2
	lduh	[%l7 + 0x46],	%l2
	fcmps	%fcc0,	%f3,	%f28
	movre	%l3,	0x0A8,	%i2
	movrlez	%i5,	0x31C,	%o3
	edge8n	%g3,	%g1,	%l0
	fmovspos	%xcc,	%f2,	%f14
	faligndata	%f16,	%f24,	%f20
	movn	%xcc,	%l6,	%o4
	umulcc	%l1,	0x1602,	%g4
	nop
	set	0x6F, %o2
	stb	%o5,	[%l7 + %o2]
	movvc	%icc,	%o6,	%g5
	umul	%i4,	0x1444,	%i3
	fxor	%f28,	%f26,	%f2
	fmovsge	%icc,	%f27,	%f26
	stx	%i1,	[%l7 + 0x20]
	movvs	%xcc,	%o2,	%o7
	movpos	%xcc,	%l5,	%i7
	popc	0x036B,	%i0
	fone	%f10
	ld	[%l7 + 0x18],	%f27
	sethi	0x0A01,	%g7
	ldsb	[%l7 + 0x18],	%o1
	fmovse	%icc,	%f8,	%f21
	ldsh	[%l7 + 0x40],	%i6
	edge32n	%l4,	%o0,	%g6
	movpos	%icc,	%l2,	%g2
	edge32l	%l3,	%i5,	%o3
	srl	%i2,	0x1C,	%g1
	sll	%l0,	%g3,	%l6
	sll	%l1,	%o4,	%o5
	sra	%o6,	0x1F,	%g4
	fpack32	%f0,	%f4,	%f26
	sdiv	%g5,	0x0790,	%i4
	sub	%i1,	%i3,	%o7
	movvs	%xcc,	%l5,	%i7
	subccc	%o2,	%g7,	%i0
	add	%o1,	0x1C8A,	%i6
	sdivcc	%l4,	0x03F9,	%o0
	movcc	%icc,	%l2,	%g2
	xor	%g6,	%i5,	%o3
	st	%f5,	[%l7 + 0x24]
	ldub	[%l7 + 0x7A],	%i2
	addccc	%g1,	%l3,	%l0
	udivx	%g3,	0x11DE,	%l1
	ld	[%l7 + 0x48],	%f30
	lduh	[%l7 + 0x40],	%o4
	restore %l6, %o6, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g5,	0x016,	%i4
	alignaddrl	%i1,	%i3,	%o7
	fpsub32	%f2,	%f26,	%f0
	movvc	%icc,	%l5,	%i7
	movvs	%xcc,	%o2,	%g7
	sdiv	%o5,	0x1FC7,	%o1
	sdivx	%i6,	0x00D6,	%l4
	addc	%i0,	0x0F97,	%o0
	fnors	%f11,	%f20,	%f28
	sub	%g2,	0x0190,	%l2
	addccc	%i5,	0x157B,	%g6
	fmovrdlez	%i2,	%f20,	%f2
	srlx	%g1,	%o3,	%l0
	movrgez	%l3,	%g3,	%o4
	fmovs	%f10,	%f8
	andncc	%l6,	%l1,	%g4
	edge32n	%o6,	%i4,	%g5
	nop
	set	0x6F, %l5
	ldsb	[%l7 + %l5],	%i3
	orcc	%i1,	%o7,	%i7
	movvc	%xcc,	%l5,	%g7
	fmovdvs	%icc,	%f3,	%f10
	nop
	set	0x08, %l1
	lduw	[%l7 + %l1],	%o5
	movvs	%xcc,	%o2,	%o1
	fpadd16	%f18,	%f10,	%f10
	alignaddr	%i6,	%l4,	%o0
	stx	%g2,	[%l7 + 0x20]
	umulcc	%i0,	%i5,	%l2
	edge8ln	%g6,	%g1,	%o3
	edge16n	%i2,	%l0,	%g3
	edge16	%l3,	%o4,	%l1
	fnot1	%f16,	%f12
	orncc	%l6,	0x0B8A,	%o6
	fmovsle	%icc,	%f19,	%f22
	mulx	%i4,	0x0452,	%g4
	edge16l	%g5,	%i1,	%o7
	fmovdcs	%xcc,	%f9,	%f21
	std	%f8,	[%l7 + 0x38]
	fmovrdlez	%i3,	%f16,	%f28
	sra	%i7,	%g7,	%o5
	save %l5, %o2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f0,	%f20
	sub	%o1,	0x04E9,	%o0
	edge16l	%l4,	%g2,	%i5
	fpsub16s	%f31,	%f20,	%f3
	ldsw	[%l7 + 0x7C],	%i0
	subcc	%l2,	0x0298,	%g6
	xorcc	%g1,	0x030D,	%i2
	umul	%l0,	%g3,	%o3
	fmovscc	%xcc,	%f7,	%f1
	srlx	%l3,	0x11,	%o4
	movg	%xcc,	%l6,	%l1
	siam	0x5
	sllx	%i4,	0x04,	%g4
	sll	%g5,	0x02,	%o6
	movcs	%xcc,	%i1,	%o7
	lduh	[%l7 + 0x50],	%i7
	fnor	%f16,	%f12,	%f6
	fabss	%f15,	%f10
	edge16	%g7,	%i3,	%o5
	fsrc1	%f14,	%f12
	move	%icc,	%l5,	%i6
	xnor	%o2,	%o0,	%o1
	andcc	%l4,	0x097D,	%i5
	fmovdneg	%icc,	%f11,	%f5
	udiv	%i0,	0x1313,	%l2
	sethi	0x14B1,	%g6
	fcmple16	%f12,	%f30,	%g2
	sir	0x0490
	addcc	%g1,	0x1B6A,	%i2
	smulcc	%g3,	0x00B2,	%o3
	sdiv	%l3,	0x0FAA,	%o4
	umulcc	%l6,	0x0663,	%l1
	sethi	0x0107,	%i4
	edge8ln	%l0,	%g5,	%g4
	smulcc	%i1,	%o7,	%i7
	fpadd32s	%f22,	%f16,	%f28
	udivx	%o6,	0x0010,	%i3
	alignaddrl	%g7,	%l5,	%i6
	edge8n	%o5,	%o2,	%o1
	movrlz	%l4,	0x014,	%o0
	save %i0, %i5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%icc,	%f13,	%f23
	fmul8ulx16	%f6,	%f20,	%f6
	fcmped	%fcc1,	%f14,	%f0
	sdivx	%g2,	0x041A,	%l2
	move	%xcc,	%g1,	%g3
	fpmerge	%f21,	%f6,	%f26
	movcs	%icc,	%o3,	%i2
	edge16n	%l3,	%o4,	%l6
	umulcc	%i4,	0x167C,	%l0
	fmuld8ulx16	%f20,	%f22,	%f24
	srlx	%l1,	%g4,	%g5
	fmovde	%xcc,	%f2,	%f19
	fmovsl	%xcc,	%f19,	%f24
	edge32n	%o7,	%i7,	%i1
	movgu	%icc,	%o6,	%g7
	subc	%i3,	%i6,	%l5
	udivx	%o5,	0x1B5B,	%o1
	edge8n	%o2,	%o0,	%l4
	ldsb	[%l7 + 0x30],	%i5
	fnors	%f12,	%f26,	%f16
	array32	%i0,	%g6,	%g2
	ldsb	[%l7 + 0x7A],	%l2
	fmovrsne	%g3,	%f28,	%f29
	array8	%g1,	%o3,	%l3
	fcmps	%fcc2,	%f22,	%f3
	for	%f16,	%f30,	%f6
	sdivcc	%i2,	0x0EE7,	%o4
	edge16n	%i4,	%l0,	%l1
	andcc	%l6,	0x0AB5,	%g5
	edge32ln	%o7,	%g4,	%i7
	srax	%i1,	0x04,	%o6
	movn	%xcc,	%i3,	%i6
	array16	%l5,	%o5,	%o1
	fmovdvc	%xcc,	%f14,	%f14
	movre	%o2,	%o0,	%l4
	or	%g7,	0x0A74,	%i0
	srax	%i5,	%g6,	%l2
	fzero	%f20
	fand	%f20,	%f28,	%f28
	sra	%g3,	0x0C,	%g1
	edge8ln	%o3,	%l3,	%g2
	ldsw	[%l7 + 0x34],	%o4
	array16	%i4,	%i2,	%l0
	movne	%xcc,	%l1,	%g5
	fmul8ulx16	%f22,	%f10,	%f10
	edge16ln	%l6,	%g4,	%i7
	fmovsvc	%xcc,	%f9,	%f31
	fornot2s	%f4,	%f7,	%f30
	stx	%o7,	[%l7 + 0x38]
	addcc	%o6,	0x1D75,	%i3
	ldub	[%l7 + 0x6C],	%i1
	movrlz	%l5,	%o5,	%o1
	array16	%o2,	%i6,	%o0
	fmul8sux16	%f0,	%f22,	%f12
	save %l4, %i0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g6,	%g7,	%g3
	movcs	%xcc,	%l2,	%g1
	fmovrse	%l3,	%f1,	%f1
	xnor	%o3,	0x1877,	%o4
	fmovsleu	%icc,	%f7,	%f26
	sth	%g2,	[%l7 + 0x2C]
	sllx	%i2,	%l0,	%l1
	mova	%icc,	%i4,	%l6
	movne	%xcc,	%g4,	%g5
	st	%f21,	[%l7 + 0x6C]
	and	%i7,	0x0300,	%o7
	add	%o6,	0x077F,	%i1
	andncc	%l5,	%o5,	%o1
	movleu	%icc,	%i3,	%o2
	ldsb	[%l7 + 0x2D],	%o0
	popc	0x09E5,	%i6
	fands	%f12,	%f8,	%f12
	fnor	%f26,	%f12,	%f26
	movrgz	%i0,	%i5,	%l4
	orcc	%g6,	%g7,	%l2
	srl	%g1,	%l3,	%g3
	udiv	%o4,	0x0D1D,	%o3
	edge16n	%i2,	%l0,	%l1
	save %i4, 0x1CC2, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%xcc,	%f29,	%f12
	fmovsne	%icc,	%f26,	%f10
	udiv	%g4,	0x15A1,	%l6
	ldsh	[%l7 + 0x7C],	%g5
	srl	%i7,	0x02,	%o6
	fmovsge	%xcc,	%f8,	%f7
	udivcc	%o7,	0x1556,	%i1
	array16	%o5,	%l5,	%o1
	fands	%f29,	%f30,	%f27
	movgu	%icc,	%o2,	%i3
	array8	%i6,	%o0,	%i0
	lduh	[%l7 + 0x60],	%i5
	movrgz	%g6,	0x18D,	%g7
	stx	%l2,	[%l7 + 0x28]
	ldsh	[%l7 + 0x3E],	%l4
	fmovdpos	%icc,	%f29,	%f19
	movvc	%icc,	%g1,	%l3
	fpsub32s	%f15,	%f1,	%f16
	alignaddrl	%o4,	%o3,	%i2
	fnot2	%f8,	%f26
	movrlez	%g3,	%l1,	%l0
	edge16l	%i4,	%g4,	%l6
	sub	%g5,	%g2,	%i7
	srax	%o6,	%i1,	%o5
	edge8ln	%l5,	%o1,	%o7
	subccc	%o2,	0x151A,	%i3
	fmovdle	%icc,	%f3,	%f27
	fmovd	%f18,	%f22
	movrgez	%i6,	0x0CD,	%i0
	fornot2	%f24,	%f18,	%f10
	sir	0x0589
	orncc	%o0,	%i5,	%g7
	udivx	%l2,	0x12BF,	%g6
	ldsb	[%l7 + 0x1C],	%l4
	edge16n	%g1,	%o4,	%l3
	array16	%o3,	%g3,	%i2
	edge32	%l1,	%i4,	%g4
	addccc	%l0,	0x12D3,	%g5
	std	%f12,	[%l7 + 0x18]
	movrlz	%l6,	0x3D4,	%g2
	fand	%f2,	%f18,	%f22
	srlx	%i7,	%o6,	%o5
	fmovdn	%xcc,	%f13,	%f15
	udivx	%l5,	0x06AA,	%i1
	udivcc	%o1,	0x046D,	%o2
	xnor	%o7,	%i3,	%i0
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	fmovrse	%g7,	%f2,	%f2
	fmovdneg	%xcc,	%f11,	%f16
	mova	%icc,	%l2,	%o0
	addc	%l4,	0x07A1,	%g1
	array16	%g6,	%l3,	%o3
	movrgz	%g3,	%o4,	%i2
	movvs	%icc,	%l1,	%i4
	orcc	%l0,	0x12E0,	%g4
	lduw	[%l7 + 0x54],	%g5
	fmovsvs	%xcc,	%f21,	%f2
	fmovdn	%icc,	%f4,	%f17
	movne	%icc,	%g2,	%l6
	ldub	[%l7 + 0x2B],	%o6
	srax	%o5,	0x09,	%i7
	smul	%l5,	%o1,	%i1
	edge8ln	%o7,	%o2,	%i0
	sdivx	%i3,	0x0748,	%i5
	edge16ln	%i6,	%l2,	%g7
	array32	%o0,	%l4,	%g1
	sir	0x0A82
	alignaddrl	%l3,	%o3,	%g3
	xorcc	%o4,	0x0B5A,	%g6
	fpack32	%f26,	%f26,	%f2
	fandnot2	%f4,	%f18,	%f8
	edge8n	%l1,	%i2,	%l0
	sllx	%i4,	0x07,	%g5
	movne	%xcc,	%g4,	%l6
	orn	%g2,	0x1E3C,	%o6
	ldx	[%l7 + 0x48],	%i7
	movl	%xcc,	%l5,	%o1
	array32	%i1,	%o5,	%o2
	movvc	%icc,	%i0,	%o7
	andn	%i5,	%i6,	%i3
	ldub	[%l7 + 0x29],	%l2
	movre	%g7,	%l4,	%g1
	fmovrsgez	%o0,	%f2,	%f22
	movvs	%xcc,	%o3,	%l3
	movcc	%icc,	%o4,	%g3
	movle	%icc,	%l1,	%i2
	fmovrdgz	%g6,	%f2,	%f18
	smul	%l0,	0x0185,	%g5
	std	%f8,	[%l7 + 0x68]
	nop
	set	0x66, %o3
	sth	%g4,	[%l7 + %o3]
	mulscc	%l6,	0x157F,	%i4
	ldsh	[%l7 + 0x70],	%g2
	save %i7, 0x0B41, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%xcc,	%f14,	%f12
	umulcc	%o1,	0x13FF,	%i1
	movre	%o6,	0x13A,	%o5
	fmovdcc	%xcc,	%f29,	%f22
	fnor	%f14,	%f22,	%f26
	movpos	%icc,	%i0,	%o2
	fornot1	%f12,	%f0,	%f0
	add	%o7,	%i5,	%i6
	edge16n	%l2,	%g7,	%i3
	xor	%g1,	0x12F7,	%l4
	umul	%o3,	%l3,	%o4
	ld	[%l7 + 0x08],	%f9
	ldd	[%l7 + 0x70],	%f2
	fpadd16	%f24,	%f12,	%f0
	fcmpne32	%f26,	%f14,	%o0
	sll	%g3,	%l1,	%i2
	st	%f30,	[%l7 + 0x70]
	orcc	%l0,	0x0F61,	%g5
	edge32ln	%g6,	%l6,	%g4
	fandnot2s	%f1,	%f17,	%f17
	andcc	%g2,	0x123E,	%i4
	movrlz	%i7,	%l5,	%i1
	xor	%o1,	0x1E1F,	%o6
	andncc	%i0,	%o5,	%o7
	fcmpd	%fcc3,	%f28,	%f30
	sub	%i5,	0x0588,	%o2
	array16	%l2,	%g7,	%i6
	xnorcc	%g1,	%i3,	%o3
	movn	%icc,	%l3,	%o4
	ldd	[%l7 + 0x70],	%o0
	movn	%xcc,	%l4,	%l1
	fsrc1	%f30,	%f6
	alignaddr	%i2,	%g3,	%l0
	movvs	%icc,	%g5,	%g6
	fcmpgt16	%f18,	%f28,	%g4
	smulcc	%g2,	0x1C93,	%l6
	smul	%i7,	%l5,	%i4
	fmovdle	%icc,	%f29,	%f25
	fands	%f13,	%f20,	%f2
	fmovda	%xcc,	%f16,	%f3
	movre	%o1,	0x017,	%i1
	ldsh	[%l7 + 0x32],	%o6
	xnor	%o5,	%i0,	%o7
	edge16ln	%i5,	%l2,	%o2
	fnegd	%f2,	%f20
	xnorcc	%g7,	0x188C,	%g1
	move	%icc,	%i6,	%i3
	restore %l3, %o3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l4,	0x0CA2,	%o0
	ldd	[%l7 + 0x28],	%f18
	srlx	%l1,	0x03,	%g3
	pdist	%f2,	%f28,	%f26
	fpadd16s	%f0,	%f31,	%f28
	fsrc1	%f22,	%f0
	movpos	%icc,	%l0,	%i2
	fmovdgu	%icc,	%f2,	%f2
	movre	%g6,	0x2DF,	%g4
	or	%g2,	0x1838,	%g5
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	mulx	%o1,	%i1,	%i7
	ldsw	[%l7 + 0x64],	%o6
	or	%o5,	0x1C29,	%o7
	addcc	%i5,	%l2,	%o2
	srax	%g7,	%i0,	%g1
	umulcc	%i6,	%i3,	%l3
	movleu	%xcc,	%o3,	%l4
	edge32l	%o4,	%l1,	%o0
	xorcc	%l0,	%i2,	%g3
	move	%xcc,	%g6,	%g4
	edge8	%g2,	%g5,	%l6
	sdiv	%l5,	0x1332,	%i4
	fpackfix	%f6,	%f18
	ldd	[%l7 + 0x40],	%f26
	ldub	[%l7 + 0x11],	%o1
	restore %i1, %i7, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o7,	%i5,	%l2
	for	%f16,	%f26,	%f16
	fmovsl	%icc,	%f21,	%f16
	udivx	%o5,	0x0D87,	%o2
	movle	%icc,	%g7,	%i0
	array32	%g1,	%i6,	%l3
	fsrc1s	%f3,	%f4
	array8	%i3,	%l4,	%o3
	sdivcc	%o4,	0x1D67,	%o0
	subccc	%l1,	0x1CD7,	%l0
	move	%xcc,	%i2,	%g6
	pdist	%f28,	%f30,	%f22
	udivx	%g4,	0x172F,	%g3
	smulcc	%g5,	0x07D0,	%g2
	movn	%xcc,	%l6,	%l5
	bshuffle	%f20,	%f2,	%f16
	orncc	%i4,	0x03CC,	%i1
	edge16	%i7,	%o6,	%o1
	save %i5, %o7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%o5,	0x15,	%g7
	orncc	%i0,	%o2,	%g1
	edge32ln	%i6,	%l3,	%i3
	fmovd	%f16,	%f14
	addccc	%l4,	%o4,	%o3
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	restore %i2, %g6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g4,	%g3,	%g2
	fmovdleu	%icc,	%f28,	%f2
	sll	%l6,	%g5,	%l5
	edge16l	%i4,	%i1,	%o6
	srl	%o1,	%i5,	%o7
	stx	%i7,	[%l7 + 0x38]
	udiv	%l2,	0x1A66,	%g7
	fnors	%f8,	%f26,	%f28
	movn	%icc,	%i0,	%o2
	edge32n	%o5,	%g1,	%i6
	fcmple16	%f12,	%f20,	%i3
	movrlz	%l3,	%l4,	%o3
	movgu	%icc,	%o0,	%o4
	udivcc	%l0,	0x1CDF,	%i2
	faligndata	%f24,	%f14,	%f12
	std	%f20,	[%l7 + 0x20]
	fandnot1s	%f18,	%f4,	%f13
	array8	%g6,	%g4,	%l1
	fxor	%f14,	%f4,	%f24
	edge8l	%g2,	%g3,	%l6
	orncc	%l5,	%g5,	%i4
	edge32ln	%o6,	%i1,	%i5
	fmul8x16	%f22,	%f30,	%f10
	fones	%f13
	xorcc	%o7,	%i7,	%o1
	andncc	%g7,	%i0,	%o2
	sll	%o5,	%l2,	%g1
	movrne	%i6,	%l3,	%i3
	subc	%l4,	0x16D9,	%o0
	andn	%o4,	%o3,	%l0
	fxnors	%f12,	%f14,	%f3
	fmovd	%f26,	%f26
	fmovdcs	%icc,	%f7,	%f1
	sdiv	%i2,	0x14AD,	%g6
	fmovd	%f14,	%f12
	srl	%l1,	%g4,	%g2
	fsrc1s	%f26,	%f27
	fmovscc	%icc,	%f13,	%f0
	movrgz	%l6,	%g3,	%l5
	orncc	%g5,	%i4,	%i1
	popc	%o6,	%i5
	array32	%i7,	%o7,	%o1
	popc	%i0,	%g7
	std	%f8,	[%l7 + 0x18]
	xor	%o2,	0x0B90,	%o5
	movle	%icc,	%l2,	%g1
	edge32ln	%i6,	%i3,	%l3
	movleu	%icc,	%l4,	%o0
	fmovsne	%xcc,	%f27,	%f9
	movleu	%xcc,	%o3,	%l0
	xorcc	%i2,	%o4,	%g6
	movleu	%icc,	%g4,	%g2
	or	%l6,	%g3,	%l5
	fpack16	%f18,	%f3
	sllx	%l1,	%g5,	%i4
	xor	%i1,	0x0084,	%i5
	or	%o6,	0x0E07,	%o7
	mulscc	%o1,	%i7,	%i0
	lduw	[%l7 + 0x0C],	%o2
	movvs	%xcc,	%g7,	%o5
	fmovrdgz	%l2,	%f26,	%f28
	edge16ln	%i6,	%g1,	%l3
	or	%l4,	0x1053,	%o0
	movvc	%icc,	%o3,	%i3
	fmovda	%icc,	%f12,	%f1
	orncc	%i2,	0x10C5,	%l0
	mulscc	%g6,	0x1ED6,	%o4
	edge8	%g4,	%g2,	%l6
	array16	%l5,	%l1,	%g5
	ldsw	[%l7 + 0x10],	%g3
	xor	%i1,	0x0F52,	%i5
	ldsh	[%l7 + 0x48],	%o6
	ldsb	[%l7 + 0x6F],	%o7
	andcc	%o1,	0x0D61,	%i7
	fmovdge	%xcc,	%f25,	%f26
	movvc	%icc,	%i0,	%o2
	edge16ln	%g7,	%i4,	%l2
	xnor	%i6,	%o5,	%g1
	fmovscs	%xcc,	%f30,	%f13
	movne	%xcc,	%l3,	%o0
	sdivx	%l4,	0x07C4,	%o3
	movcc	%icc,	%i2,	%i3
	subccc	%l0,	%o4,	%g4
	fpadd16s	%f28,	%f23,	%f7
	edge16n	%g2,	%g6,	%l5
	lduw	[%l7 + 0x28],	%l1
	movl	%icc,	%l6,	%g5
	subc	%g3,	%i1,	%i5
	popc	%o7,	%o1
	st	%f31,	[%l7 + 0x38]
	movrgz	%o6,	0x15D,	%i0
	stb	%i7,	[%l7 + 0x51]
	mova	%xcc,	%o2,	%i4
	lduw	[%l7 + 0x50],	%l2
	fmovdvc	%xcc,	%f20,	%f5
	umulcc	%g7,	%i6,	%g1
	fabss	%f15,	%f26
	orcc	%o5,	0x0BB8,	%o0
	addccc	%l3,	0x1B2F,	%l4
	smul	%o3,	0x1FD1,	%i2
	fcmpeq16	%f4,	%f26,	%l0
	edge8n	%i3,	%o4,	%g2
	movle	%icc,	%g6,	%l5
	xor	%l1,	0x027B,	%g4
	stw	%g5,	[%l7 + 0x1C]
	srax	%l6,	%g3,	%i5
	sir	0x179E
	move	%icc,	%i1,	%o1
	movrgez	%o7,	0x13D,	%i0
	sll	%i7,	0x01,	%o2
	orn	%o6,	0x1ED1,	%i4
	fmovdne	%xcc,	%f4,	%f13
	movl	%xcc,	%l2,	%i6
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	fmovsle	%xcc,	%f16,	%f23
	xnor	%o0,	0x0DB0,	%g7
	sir	0x0339
	fmovdn	%icc,	%f0,	%f16
	fmovsvs	%xcc,	%f3,	%f20
	subcc	%l3,	%l4,	%i2
	save %o3, 0x185E, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%i3,	%o4
	sra	%g2,	0x16,	%g6
	xnorcc	%l1,	%g4,	%l5
	fandnot2s	%f7,	%f26,	%f17
	addccc	%l6,	%g5,	%g3
	andncc	%i5,	%i1,	%o7
	sir	0x0B78
	orncc	%i0,	0x1BE5,	%o1
	orcc	%o2,	0x1D9A,	%i7
	andncc	%i4,	%l2,	%i6
	udiv	%g1,	0x0797,	%o6
	fpsub16s	%f0,	%f0,	%f13
	srlx	%o0,	%o5,	%l3
	fmovdpos	%icc,	%f10,	%f30
	sir	0x0385
	subc	%l4,	0x02BF,	%i2
	ldsh	[%l7 + 0x5A],	%o3
	edge32	%g7,	%l0,	%i3
	ldsw	[%l7 + 0x78],	%g2
	save %o4, 0x1C75, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g4,	[%l7 + 0x54]
	addccc	%l5,	0x0D72,	%l6
	stx	%g5,	[%l7 + 0x28]
	edge16	%g3,	%g6,	%i1
	fmovsne	%xcc,	%f3,	%f19
	sll	%o7,	0x08,	%i0
	srl	%i5,	%o1,	%o2
	ldsw	[%l7 + 0x24],	%i4
	fxors	%f1,	%f8,	%f4
	fmovscs	%xcc,	%f26,	%f20
	smulcc	%l2,	0x1279,	%i6
	fmul8x16au	%f15,	%f5,	%f16
	udivx	%i7,	0x0A89,	%o6
	fandnot2s	%f20,	%f27,	%f1
	fpsub16s	%f13,	%f24,	%f11
	srl	%g1,	%o5,	%o0
	sdivcc	%l3,	0x0B1D,	%i2
	sub	%o3,	0x000B,	%l4
	stx	%l0,	[%l7 + 0x60]
	udivx	%i3,	0x0406,	%g2
	fandnot2s	%f29,	%f17,	%f18
	addc	%o4,	0x1180,	%l1
	fpack32	%f26,	%f8,	%f14
	fandnot2s	%f17,	%f30,	%f10
	fones	%f9
	xnor	%g4,	0x0BE0,	%g7
	movn	%icc,	%l6,	%g5
	addcc	%g3,	%l5,	%i1
	edge8n	%o7,	%g6,	%i5
	alignaddrl	%i0,	%o2,	%o1
	fmovrse	%l2,	%f14,	%f1
	sllx	%i6,	0x18,	%i7
	fmul8x16al	%f18,	%f5,	%f6
	fmovrse	%o6,	%f5,	%f17
	andn	%g1,	%i4,	%o5
	fsrc1	%f8,	%f2
	andn	%l3,	0x19DF,	%o0
	edge32l	%o3,	%l4,	%i2
	sdivx	%i3,	0x0ECB,	%g2
	fnegd	%f12,	%f28
	sllx	%o4,	0x01,	%l1
	siam	0x5
	edge16n	%g4,	%g7,	%l0
	fpsub16s	%f5,	%f6,	%f3
	fnot1s	%f30,	%f14
	fpsub32s	%f13,	%f10,	%f2
	andncc	%l6,	%g5,	%g3
	andn	%l5,	0x0C9E,	%o7
	subcc	%i1,	%g6,	%i0
	edge32ln	%i5,	%o1,	%l2
	andcc	%o2,	0x0EB2,	%i7
	umul	%i6,	0x02C4,	%o6
	subccc	%i4,	0x0468,	%o5
	fmovrsgez	%l3,	%f2,	%f28
	fandnot1s	%f24,	%f17,	%f9
	subcc	%g1,	0x1943,	%o0
	edge16l	%o3,	%i2,	%i3
	sdivcc	%g2,	0x1F42,	%o4
	array8	%l4,	%g4,	%g7
	edge16l	%l0,	%l6,	%l1
	sll	%g3,	0x1B,	%g5
	ldsw	[%l7 + 0x24],	%o7
	stw	%l5,	[%l7 + 0x14]
	faligndata	%f26,	%f2,	%f16
	sth	%g6,	[%l7 + 0x5C]
	subccc	%i0,	%i5,	%o1
	stb	%l2,	[%l7 + 0x19]
	movvc	%icc,	%o2,	%i7
	stx	%i6,	[%l7 + 0x60]
	xnor	%o6,	0x1C28,	%i1
	std	%f8,	[%l7 + 0x68]
	edge16	%i4,	%o5,	%g1
	fnegd	%f6,	%f2
	fxors	%f25,	%f30,	%f13
	udivx	%l3,	0x01B6,	%o3
	st	%f15,	[%l7 + 0x0C]
	add	%o0,	%i3,	%i2
	fsrc1s	%f29,	%f24
	movn	%xcc,	%g2,	%l4
	alignaddr	%o4,	%g4,	%g7
	umulcc	%l0,	%l1,	%g3
	xorcc	%g5,	0x066F,	%o7
	edge32l	%l5,	%g6,	%i0
	movrgez	%l6,	0x34A,	%o1
	edge16n	%i5,	%l2,	%i7
	xnor	%i6,	%o6,	%o2
	sdivx	%i4,	0x0E57,	%o5
	st	%f8,	[%l7 + 0x74]
	xnorcc	%i1,	0x10E8,	%l3
	sir	0x1D30
	fmovdn	%icc,	%f8,	%f6
	sethi	0x180E,	%g1
	mulscc	%o3,	0x1B3A,	%o0
	sub	%i3,	%i2,	%g2
	fors	%f18,	%f8,	%f23
	edge16ln	%o4,	%g4,	%g7
	ldd	[%l7 + 0x60],	%f4
	orn	%l4,	0x09D1,	%l1
	fxnor	%f12,	%f0,	%f24
	ldd	[%l7 + 0x68],	%f0
	std	%f16,	[%l7 + 0x20]
	ldsb	[%l7 + 0x5D],	%g3
	fcmps	%fcc1,	%f23,	%f23
	sth	%g5,	[%l7 + 0x4C]
	movneg	%xcc,	%l0,	%l5
	ldx	[%l7 + 0x18],	%o7
	umulcc	%g6,	0x16F8,	%l6
	xor	%i0,	0x08E4,	%i5
	movpos	%xcc,	%l2,	%i7
	or	%o1,	%o6,	%o2
	edge16n	%i6,	%i4,	%i1
	fmul8sux16	%f14,	%f4,	%f12
	ldub	[%l7 + 0x44],	%o5
	addc	%l3,	0x0C90,	%g1
	array32	%o0,	%o3,	%i2
	fpsub16s	%f31,	%f21,	%f15
	fnands	%f3,	%f18,	%f10
	edge8ln	%g2,	%i3,	%o4
	for	%f8,	%f6,	%f30
	sll	%g4,	0x1C,	%g7
	fsrc2	%f6,	%f12
	sth	%l4,	[%l7 + 0x4C]
	srax	%l1,	%g3,	%l0
	mova	%icc,	%g5,	%o7
	fzeros	%f25
	movvc	%icc,	%g6,	%l6
	udiv	%l5,	0x0A6B,	%i0
	smulcc	%l2,	%i7,	%i5
	edge16l	%o1,	%o2,	%o6
	edge8	%i4,	%i1,	%i6
	addccc	%o5,	0x10B0,	%l3
	movl	%xcc,	%g1,	%o0
	ldub	[%l7 + 0x4D],	%o3
	add	%i2,	%i3,	%o4
	alignaddr	%g4,	%g7,	%l4
	stx	%l1,	[%l7 + 0x70]
	andcc	%g2,	0x19A0,	%g3
	fcmpeq16	%f30,	%f28,	%g5
	stx	%l0,	[%l7 + 0x20]
	andn	%o7,	0x194F,	%l6
	add	%g6,	0x08E9,	%l5
	movle	%icc,	%l2,	%i0
	movleu	%xcc,	%i7,	%o1
	sdiv	%o2,	0x15CD,	%i5
	fnors	%f12,	%f21,	%f13
	fmovsa	%xcc,	%f12,	%f27
	fxnors	%f31,	%f12,	%f8
	fpsub16s	%f23,	%f31,	%f24
	udivx	%i4,	0x19ED,	%o6
	movneg	%icc,	%i1,	%o5
	fmovrdlez	%i6,	%f14,	%f12
	nop
	set	0x55, %o1
	stb	%g1,	[%l7 + %o1]
	movn	%icc,	%o0,	%o3
	movrlz	%i2,	0x39A,	%l3
	std	%f0,	[%l7 + 0x70]
	array8	%o4,	%i3,	%g4
	ld	[%l7 + 0x54],	%f23
	movleu	%icc,	%l4,	%l1
	fmovdl	%icc,	%f15,	%f14
	fmovrslz	%g7,	%f19,	%f31
	fmovsg	%icc,	%f18,	%f8
	udivx	%g3,	0x0F88,	%g2
	addccc	%l0,	%g5,	%o7
	edge32l	%g6,	%l6,	%l5
	popc	%l2,	%i7
	fors	%f19,	%f17,	%f27
	sra	%i0,	%o2,	%i5
	udivx	%o1,	0x1975,	%i4
	sub	%i1,	0x121B,	%o5
	ldsb	[%l7 + 0x6C],	%o6
	fcmpd	%fcc1,	%f22,	%f24
	edge16ln	%i6,	%o0,	%o3
	fmovdg	%xcc,	%f10,	%f14
	movle	%icc,	%g1,	%l3
	fmovdle	%icc,	%f21,	%f28
	sllx	%o4,	0x15,	%i2
	sub	%i3,	0x12AF,	%l4
	movl	%xcc,	%g4,	%g7
	movrlez	%g3,	%l1,	%l0
	fmuld8sux16	%f4,	%f16,	%f14
	movrne	%g2,	%o7,	%g5
	xorcc	%l6,	0x0DC2,	%g6
	fmovdge	%xcc,	%f10,	%f22
	srl	%l2,	%i7,	%l5
	xorcc	%i0,	%o2,	%i5
	and	%i4,	%o1,	%o5
	andncc	%i1,	%i6,	%o0
	fpsub16	%f20,	%f14,	%f10
	fpadd32	%f14,	%f8,	%f28
	alignaddr	%o6,	%o3,	%g1
	srlx	%l3,	0x1D,	%o4
	edge16ln	%i3,	%l4,	%g4
	array8	%g7,	%i2,	%g3
	xor	%l1,	%l0,	%o7
	fcmpeq32	%f28,	%f24,	%g2
	ldd	[%l7 + 0x18],	%f24
	edge16	%g5,	%l6,	%l2
	stb	%g6,	[%l7 + 0x3D]
	orncc	%l5,	%i7,	%i0
	movn	%icc,	%i5,	%o2
	ldsh	[%l7 + 0x74],	%o1
	umulcc	%o5,	0x1E92,	%i4
	popc	0x0A3C,	%i1
	edge8	%o0,	%o6,	%i6
	srlx	%g1,	%l3,	%o4
	fcmped	%fcc2,	%f10,	%f20
	fmovdge	%xcc,	%f5,	%f14
	umul	%o3,	%l4,	%i3
	orcc	%g7,	%i2,	%g4
	srax	%l1,	%l0,	%g3
	xnorcc	%o7,	%g2,	%l6
	fmul8x16al	%f8,	%f24,	%f28
	smul	%l2,	%g6,	%g5
	stx	%l5,	[%l7 + 0x48]
	fandnot1s	%f14,	%f28,	%f1
	orcc	%i0,	0x1332,	%i7
	subc	%i5,	%o1,	%o5
	movn	%xcc,	%o2,	%i4
	fnegd	%f28,	%f8
	array8	%i1,	%o6,	%i6
	ld	[%l7 + 0x68],	%f17
	movne	%xcc,	%o0,	%g1
	sdivx	%l3,	0x08AE,	%o4
	fors	%f5,	%f22,	%f14
	fnegd	%f14,	%f4
	fpmerge	%f28,	%f10,	%f12
	fmovrdgez	%o3,	%f20,	%f10
	movvc	%icc,	%l4,	%i3
	fmovrde	%i2,	%f4,	%f4
	and	%g7,	0x0CE6,	%g4
	ldsh	[%l7 + 0x46],	%l0
	sra	%l1,	0x1B,	%g3
	orcc	%g2,	%o7,	%l6
	smul	%g6,	%g5,	%l5
	alignaddr	%l2,	%i0,	%i7
	move	%icc,	%o1,	%o5
	edge8ln	%i5,	%o2,	%i1
	srlx	%i4,	%i6,	%o6
	fpadd32	%f0,	%f28,	%f2
	edge8n	%g1,	%o0,	%o4
	srlx	%l3,	%o3,	%i3
	orcc	%i2,	0x12C3,	%g7
	edge32	%g4,	%l0,	%l1
	addc	%l4,	0x1432,	%g2
	fcmps	%fcc2,	%f26,	%f24
	fsrc2s	%f6,	%f23
	fxor	%f4,	%f6,	%f2
	movcs	%xcc,	%g3,	%o7
	lduh	[%l7 + 0x3E],	%g6
	fmul8x16al	%f16,	%f17,	%f2
	fmovdn	%icc,	%f7,	%f15
	movn	%xcc,	%g5,	%l5
	fone	%f4
	sll	%l2,	%i0,	%i7
	movre	%l6,	%o5,	%o1
	fxnor	%f10,	%f24,	%f30
	edge8n	%o2,	%i1,	%i5
	fcmpeq32	%f8,	%f20,	%i4
	smul	%i6,	%g1,	%o0
	srlx	%o6,	0x1E,	%l3
	movcc	%icc,	%o4,	%o3
	subc	%i2,	%i3,	%g4
	fnor	%f26,	%f12,	%f30
	edge8	%l0,	%l1,	%g7
	xor	%g2,	0x1AFB,	%l4
	or	%g3,	0x1E2B,	%o7
	edge16l	%g5,	%g6,	%l5
	fpack16	%f12,	%f17
	nop
	set	0x58, %g4
	sth	%l2,	[%l7 + %g4]
	st	%f6,	[%l7 + 0x50]
	movrne	%i7,	%l6,	%o5
	addc	%o1,	0x1F0B,	%i0
	addc	%o2,	%i1,	%i4
	edge16n	%i5,	%i6,	%g1
	edge16l	%o6,	%l3,	%o0
	edge32	%o4,	%i2,	%i3
	fxnors	%f25,	%f12,	%f11
	lduw	[%l7 + 0x34],	%g4
	lduw	[%l7 + 0x0C],	%l0
	ldd	[%l7 + 0x50],	%f0
	movrlz	%o3,	%l1,	%g7
	and	%l4,	%g3,	%g2
	mulx	%g5,	%g6,	%o7
	ldub	[%l7 + 0x7E],	%l5
	lduw	[%l7 + 0x78],	%l2
	st	%f3,	[%l7 + 0x14]
	andcc	%l6,	%o5,	%i7
	movrlez	%o1,	0x068,	%i0
	movrlz	%i1,	%i4,	%i5
	save %i6, %g1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o6,	%l3,	%o4
	fzeros	%f24
	movrlez	%o0,	%i3,	%i2
	smulcc	%g4,	0x05F9,	%l0
	movrgez	%l1,	%o3,	%l4
	umulcc	%g3,	0x0705,	%g7
	xnor	%g5,	0x1521,	%g2
	fsrc1	%f18,	%f0
	movrlz	%o7,	0x15A,	%l5
	sll	%l2,	%g6,	%l6
	movg	%xcc,	%i7,	%o5
	fnot1	%f8,	%f30
	sethi	0x1BB3,	%o1
	fmovsleu	%icc,	%f22,	%f13
	movrlez	%i1,	0x1AC,	%i0
	ldsh	[%l7 + 0x0E],	%i5
	xor	%i6,	%i4,	%o2
	movvc	%icc,	%o6,	%l3
	edge32n	%o4,	%o0,	%i3
	andcc	%g1,	%i2,	%l0
	fexpand	%f7,	%f18
	fmovsleu	%icc,	%f8,	%f27
	udiv	%g4,	0x1501,	%o3
	fpackfix	%f0,	%f9
	fcmps	%fcc3,	%f2,	%f0
	fmovsne	%xcc,	%f5,	%f10
	udiv	%l1,	0x0AF9,	%g3
	addcc	%g7,	0x00D3,	%l4
	fsrc1	%f12,	%f12
	smul	%g5,	0x1CFA,	%g2
	ldub	[%l7 + 0x1B],	%l5
	fands	%f22,	%f21,	%f31
	fornot1	%f2,	%f14,	%f24
	std	%f18,	[%l7 + 0x68]
	udivcc	%o7,	0x1C37,	%g6
	edge16	%l6,	%i7,	%o5
	umulcc	%l2,	%i1,	%o1
	fcmple16	%f10,	%f8,	%i0
	lduh	[%l7 + 0x5A],	%i6
	srlx	%i4,	%i5,	%o2
	stb	%l3,	[%l7 + 0x5A]
	movvc	%xcc,	%o6,	%o4
	movrgz	%i3,	%o0,	%g1
	xnor	%l0,	0x1F8A,	%g4
	sll	%i2,	%o3,	%g3
	movrlez	%g7,	%l4,	%g5
	srax	%l1,	%l5,	%g2
	fmovrde	%o7,	%f14,	%f8
	movcs	%xcc,	%g6,	%l6
	fmovsg	%xcc,	%f18,	%f5
	ldsb	[%l7 + 0x76],	%i7
	sll	%l2,	%i1,	%o5
	stw	%i0,	[%l7 + 0x1C]
	ld	[%l7 + 0x20],	%f26
	fmovsg	%xcc,	%f28,	%f17
	udivcc	%o1,	0x0FFA,	%i6
	lduw	[%l7 + 0x38],	%i4
	movgu	%icc,	%o2,	%l3
	fsrc1s	%f7,	%f7
	edge8n	%i5,	%o4,	%o6
	alignaddrl	%i3,	%o0,	%l0
	mulscc	%g1,	%i2,	%g4
	mova	%icc,	%g3,	%o3
	fmovdg	%icc,	%f12,	%f26
	edge32ln	%g7,	%l4,	%l1
	andcc	%g5,	%l5,	%g2
	restore %o7, 0x1773, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g6,	%i7,	%l2
	movpos	%xcc,	%i1,	%i0
	std	%f8,	[%l7 + 0x38]
	ldsb	[%l7 + 0x0F],	%o5
	ld	[%l7 + 0x70],	%f23
	ldd	[%l7 + 0x70],	%i6
	srlx	%i4,	%o1,	%l3
	movre	%o2,	%i5,	%o4
	movle	%icc,	%o6,	%o0
	movrlez	%i3,	0x114,	%g1
	edge16l	%i2,	%g4,	%l0
	edge32l	%o3,	%g3,	%g7
	array16	%l1,	%g5,	%l4
	edge32	%l5,	%o7,	%l6
	fmovrdlz	%g2,	%f14,	%f30
	fornot2s	%f11,	%f0,	%f28
	andncc	%g6,	%i7,	%l2
	fmovrdlez	%i0,	%f8,	%f14
	ldsh	[%l7 + 0x32],	%o5
	fmovrsgz	%i1,	%f27,	%f16
	fmovrsgz	%i4,	%f25,	%f7
	edge32	%o1,	%i6,	%l3
	ldsw	[%l7 + 0x70],	%i5
	stx	%o4,	[%l7 + 0x38]
	and	%o2,	0x1818,	%o0
	ldsh	[%l7 + 0x4A],	%o6
	array16	%g1,	%i2,	%i3
	sdivx	%l0,	0x0D92,	%o3
	movle	%icc,	%g4,	%g3
	movrlz	%l1,	0x352,	%g5
	save %g7, 0x188B, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o7,	%l4,	%l6
	std	%f22,	[%l7 + 0x08]
	addc	%g6,	0x020E,	%g2
	edge32ln	%i7,	%i0,	%l2
	orcc	%o5,	0x1CA9,	%i1
	movvc	%icc,	%i4,	%i6
	fpadd32	%f8,	%f22,	%f24
	fcmps	%fcc0,	%f10,	%f5
	fpack32	%f26,	%f0,	%f24
	movl	%xcc,	%l3,	%i5
	stb	%o4,	[%l7 + 0x59]
	movrgez	%o2,	%o1,	%o0
	sub	%g1,	0x1D2D,	%i2
	edge32n	%o6,	%i3,	%l0
	movcs	%icc,	%o3,	%g3
	fandnot1s	%f12,	%f24,	%f18
	movneg	%xcc,	%l1,	%g5
	ldsw	[%l7 + 0x54],	%g4
	stw	%g7,	[%l7 + 0x5C]
	fnor	%f12,	%f30,	%f2
	andcc	%o7,	%l4,	%l6
	alignaddr	%l5,	%g6,	%i7
	edge8ln	%i0,	%g2,	%l2
	movleu	%icc,	%o5,	%i1
	fmul8x16au	%f14,	%f12,	%f24
	fmul8x16au	%f22,	%f15,	%f0
	fpadd16	%f4,	%f8,	%f26
	fands	%f28,	%f14,	%f25
	ld	[%l7 + 0x38],	%f16
	fmovdge	%xcc,	%f12,	%f2
	xnorcc	%i4,	0x1C23,	%l3
	addc	%i5,	0x08D5,	%i6
	sethi	0x1567,	%o4
	stw	%o1,	[%l7 + 0x10]
	subcc	%o2,	%g1,	%i2
	edge16l	%o0,	%o6,	%i3
	xnor	%l0,	%o3,	%g3
	or	%l1,	0x0F1A,	%g5
	std	%f8,	[%l7 + 0x50]
	or	%g4,	0x1B88,	%o7
	xor	%g7,	%l4,	%l5
	ldsw	[%l7 + 0x0C],	%g6
	fmovrdgz	%i7,	%f12,	%f24
	fornot2s	%f13,	%f12,	%f2
	fcmpes	%fcc1,	%f1,	%f1
	stw	%l6,	[%l7 + 0x24]
	movn	%xcc,	%g2,	%i0
	nop
	set	0x18, %o4
	ldsw	[%l7 + %o4],	%l2
	fmovsg	%xcc,	%f4,	%f1
	edge32	%i1,	%i4,	%o5
	and	%l3,	%i5,	%i6
	movrgz	%o1,	0x2BE,	%o2
	smul	%g1,	0x1274,	%o4
	fmovrsgz	%o0,	%f30,	%f2
	fmovda	%xcc,	%f5,	%f30
	orn	%i2,	0x18A1,	%i3
	stx	%o6,	[%l7 + 0x38]
	and	%l0,	%o3,	%g3
	orncc	%l1,	%g5,	%o7
	array32	%g7,	%l4,	%g4
	sir	0x0A3F
	fornot1	%f16,	%f8,	%f0
	sir	0x12B0
	st	%f7,	[%l7 + 0x1C]
	orncc	%l5,	%i7,	%l6
	fors	%f7,	%f23,	%f30
	or	%g2,	0x146E,	%i0
	addccc	%l2,	0x0330,	%i1
	addccc	%i4,	0x0637,	%o5
	movneg	%xcc,	%g6,	%i5
	movle	%icc,	%i6,	%o1
	ldsb	[%l7 + 0x1F],	%l3
	fnot2	%f18,	%f4
	subccc	%g1,	0x1B06,	%o4
	movge	%icc,	%o0,	%i2
	umul	%o2,	0x09B3,	%o6
	addc	%l0,	0x1EF0,	%i3
	subccc	%o3,	%g3,	%l1
	lduw	[%l7 + 0x54],	%o7
	fandnot2	%f28,	%f2,	%f26
	mova	%icc,	%g5,	%g7
	fone	%f8
	ldsh	[%l7 + 0x7A],	%g4
	andcc	%l5,	0x0901,	%l4
	sdiv	%i7,	0x13B4,	%g2
	movvc	%xcc,	%l6,	%i0
	edge32ln	%i1,	%i4,	%l2
	movleu	%icc,	%g6,	%o5
	movcs	%icc,	%i5,	%o1
	smulcc	%l3,	0x02AF,	%i6
	edge8ln	%g1,	%o4,	%i2
	fnot2s	%f28,	%f21
	ldx	[%l7 + 0x38],	%o0
	movrne	%o6,	0x151,	%l0
	stw	%o2,	[%l7 + 0x78]
	ldsw	[%l7 + 0x44],	%i3
	xorcc	%g3,	%l1,	%o7
	array16	%g5,	%g7,	%o3
	fcmps	%fcc3,	%f26,	%f30
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	sth	%l4,	[%l7 + 0x62]
	ldsh	[%l7 + 0x72],	%g2
	array32	%i7,	%l6,	%i0
	movge	%icc,	%i4,	%i1
	fcmpd	%fcc0,	%f28,	%f12
	fabss	%f20,	%f25
	sll	%g6,	0x00,	%o5
	sdivx	%l2,	0x1442,	%i5
	movl	%xcc,	%l3,	%o1
	andcc	%g1,	0x099F,	%i6
	restore %o4, %o0, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f6,	%f12,	%f30
	movvc	%xcc,	%l0,	%i2
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	ldub	[%l7 + 0x2B],	%l1
	edge8l	%g5,	%o7,	%g7
	sdivx	%l5,	0x0986,	%o3
	array32	%g4,	%g2,	%l4
	movre	%l6,	%i0,	%i7
	lduw	[%l7 + 0x2C],	%i4
	subccc	%g6,	0x0132,	%i1
	udiv	%l2,	0x07F0,	%i5
	movpos	%xcc,	%o5,	%l3
	udiv	%o1,	0x1A38,	%g1
	orn	%o4,	%o0,	%i6
	sth	%l0,	[%l7 + 0x4E]
	edge32l	%i2,	%o2,	%o6
	sethi	0x0139,	%i3
	save %g3, 0x0A9A, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o7,	%g7,	%l5
	edge32	%l1,	%o3,	%g4
	addccc	%g2,	%l4,	%i0
	umulcc	%i7,	0x16D5,	%l6
	addc	%i4,	%g6,	%i1
	move	%icc,	%i5,	%o5
	udivcc	%l2,	0x101A,	%o1
	movcc	%icc,	%l3,	%g1
	movle	%xcc,	%o4,	%i6
	sir	0x0E8C
	subc	%l0,	%i2,	%o0
	stw	%o2,	[%l7 + 0x78]
	sir	0x1B34
	srlx	%i3,	0x00,	%g3
	sub	%o6,	0x056D,	%o7
	ldd	[%l7 + 0x60],	%g6
	ldub	[%l7 + 0x2B],	%l5
	ldd	[%l7 + 0x28],	%l0
	fxnors	%f4,	%f30,	%f1
	nop
	set	0x44, %l2
	lduw	[%l7 + %l2],	%o3
	stw	%g4,	[%l7 + 0x60]
	orcc	%g5,	%g2,	%l4
	fandnot1	%f4,	%f16,	%f2
	bshuffle	%f12,	%f30,	%f22
	sir	0x0090
	fabsd	%f14,	%f0
	save %i7, %i0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f9,	%f7
	faligndata	%f2,	%f6,	%f4
	sllx	%i4,	%g6,	%i5
	umulcc	%o5,	0x18D4,	%l2
	fmovdvc	%icc,	%f30,	%f28
	xnorcc	%o1,	%l3,	%g1
	ldsw	[%l7 + 0x14],	%i1
	fornot2s	%f3,	%f24,	%f5
	fpsub32s	%f16,	%f25,	%f30
	edge8ln	%i6,	%l0,	%i2
	umul	%o0,	0x0254,	%o2
	sdivx	%o4,	0x1483,	%i3
	array16	%o6,	%g3,	%o7
	addc	%l5,	%g7,	%l1
	movrlez	%g4,	%o3,	%g5
	movg	%icc,	%g2,	%l4
	movvs	%xcc,	%i7,	%l6
	nop
	set	0x38, %i2
	lduw	[%l7 + %i2],	%i4
	srl	%i0,	0x01,	%i5
	fmovse	%icc,	%f7,	%f0
	lduw	[%l7 + 0x78],	%o5
	movrlez	%g6,	0x0BA,	%l2
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%f8
	andn	%l3,	%o1,	%i1
	movne	%icc,	%g1,	%l0
	fmovrdgez	%i2,	%f16,	%f28
	array32	%o0,	%o2,	%o4
	fmovrsne	%i6,	%f24,	%f22
	subc	%i3,	%g3,	%o7
	orn	%l5,	%o6,	%l1
	addccc	%g7,	%g4,	%g5
	sdiv	%g2,	0x07C7,	%o3
	movrlz	%i7,	0x316,	%l4
	subc	%i4,	%i0,	%l6
	sir	0x06F3
	stx	%o5,	[%l7 + 0x18]
	edge8	%g6,	%l2,	%i5
	fcmped	%fcc0,	%f6,	%f2
	fmul8ulx16	%f4,	%f2,	%f18
	addcc	%o1,	0x0CDD,	%i1
	edge16	%g1,	%l0,	%i2
	movrgz	%o0,	%o2,	%l3
	fexpand	%f2,	%f2
	xor	%i6,	0x1030,	%o4
	addc	%i3,	0x0443,	%o7
	movpos	%icc,	%g3,	%l5
	srax	%l1,	0x05,	%o6
	popc	%g4,	%g7
	ldd	[%l7 + 0x48],	%f2
	or	%g5,	%g2,	%o3
	array8	%i7,	%l4,	%i0
	ldsw	[%l7 + 0x44],	%i4
	addcc	%o5,	0x0D1F,	%g6
	fmovscs	%xcc,	%f26,	%f15
	movrne	%l6,	0x3F8,	%i5
	st	%f7,	[%l7 + 0x54]
	fnot1s	%f18,	%f29
	udivx	%l2,	0x122A,	%i1
	fxnors	%f26,	%f18,	%f24
	edge16	%g1,	%l0,	%i2
	ldub	[%l7 + 0x29],	%o0
	movrlz	%o1,	%l3,	%o2
	fmovsleu	%xcc,	%f7,	%f22
	fones	%f8
	fcmpeq32	%f26,	%f4,	%i6
	edge16	%i3,	%o4,	%o7
	or	%g3,	0x070E,	%l5
	stx	%l1,	[%l7 + 0x18]
	andn	%g4,	0x186F,	%o6
	edge8ln	%g7,	%g5,	%o3
	andncc	%i7,	%g2,	%i0
	fpack32	%f16,	%f12,	%f22
	fpadd16s	%f15,	%f24,	%f2
	mulx	%l4,	%i4,	%g6
	sub	%o5,	0x1F46,	%i5
	save %l2, 0x1EC8, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i1,	0x034,	%g1
	fmovde	%xcc,	%f5,	%f30
	addc	%l0,	0x018B,	%i2
	orncc	%o0,	%l3,	%o2
	movle	%xcc,	%o1,	%i3
	smulcc	%o4,	0x03CF,	%o7
	edge32ln	%g3,	%l5,	%l1
	fsrc2s	%f8,	%f18
	smulcc	%g4,	%o6,	%i6
	addccc	%g7,	%o3,	%g5
	movrlez	%i7,	%g2,	%l4
	restore %i0, %g6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i4,	0x04A1,	%l2
	xorcc	%i5,	%i1,	%l6
	umul	%g1,	0x1C44,	%l0
	edge32	%o0,	%i2,	%l3
	sub	%o2,	0x01D3,	%o1
	stw	%o4,	[%l7 + 0x44]
	fmovdge	%icc,	%f22,	%f15
	fxors	%f26,	%f2,	%f0
	movre	%i3,	0x115,	%g3
	nop
	set	0x5C, %o5
	lduw	[%l7 + %o5],	%l5
	movvc	%xcc,	%l1,	%o7
	movvc	%icc,	%g4,	%o6
	edge8	%i6,	%o3,	%g7
	ld	[%l7 + 0x44],	%f31
	fmovrslez	%g5,	%f5,	%f15
	movleu	%xcc,	%g2,	%l4
	edge32ln	%i7,	%i0,	%o5
	fpsub16s	%f27,	%f23,	%f22
	andcc	%g6,	%i4,	%i5
	fcmpne32	%f10,	%f20,	%l2
	edge8ln	%i1,	%g1,	%l0
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	fmovdpos	%xcc,	%f27,	%f26
	udivcc	%l3,	0x1998,	%o2
	movrne	%o1,	%o4,	%g3
	fsrc1	%f2,	%f0
	xor	%l5,	0x0EBC,	%l1
	std	%f16,	[%l7 + 0x08]
	fcmpgt32	%f10,	%f14,	%i3
	fpsub32	%f22,	%f8,	%f18
	fmuld8ulx16	%f23,	%f29,	%f0
	popc	%g4,	%o6
	fcmps	%fcc0,	%f22,	%f13
	or	%i6,	0x1C5D,	%o3
	sra	%o7,	%g5,	%g7
	fzeros	%f29
	ldsw	[%l7 + 0x14],	%g2
	ld	[%l7 + 0x40],	%f11
	xorcc	%i7,	0x19DD,	%l4
	ldd	[%l7 + 0x08],	%f0
	fmovsge	%icc,	%f8,	%f23
	fmovdvs	%xcc,	%f8,	%f2
	fcmpes	%fcc3,	%f17,	%f13
	stw	%i0,	[%l7 + 0x78]
	ldsw	[%l7 + 0x48],	%g6
	or	%i4,	0x0A24,	%i5
	edge16n	%o5,	%l2,	%i1
	fabsd	%f6,	%f2
	fmovdpos	%xcc,	%f23,	%f10
	addcc	%g1,	0x036D,	%o0
	edge16l	%l0,	%l6,	%l3
	edge8l	%o2,	%i2,	%o4
	array32	%o1,	%l5,	%l1
	orcc	%i3,	%g4,	%o6
	alignaddr	%i6,	%o3,	%o7
	array32	%g3,	%g7,	%g5
	array16	%i7,	%g2,	%i0
	orn	%l4,	%g6,	%i4
	ldd	[%l7 + 0x18],	%o4
	movcc	%icc,	%i5,	%l2
	fands	%f30,	%f27,	%f28
	fmul8ulx16	%f16,	%f18,	%f14
	movle	%xcc,	%g1,	%o0
	restore %l0, %i1, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x70],	%o2
	or	%l3,	0x1F38,	%i2
	save %o4, %l5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f9,	%f14,	%f30
	st	%f16,	[%l7 + 0x6C]
	fmovdcs	%icc,	%f3,	%f24
	edge16n	%i3,	%o1,	%g4
	addc	%o6,	%o3,	%o7
	alignaddrl	%i6,	%g3,	%g5
	xnor	%i7,	%g7,	%g2
	andn	%l4,	%i0,	%g6
	udivcc	%i4,	0x0423,	%o5
	ldsh	[%l7 + 0x3E],	%i5
	addccc	%g1,	%o0,	%l2
	movvs	%xcc,	%i1,	%l0
	fmovrdne	%l6,	%f26,	%f10
	udivx	%l3,	0x1FBC,	%o2
	fmovsge	%icc,	%f19,	%f20
	nop
	set	0x4A, %g2
	sth	%i2,	[%l7 + %g2]
	alignaddrl	%l5,	%o4,	%l1
	sdivcc	%o1,	0x1BA7,	%g4
	orcc	%i3,	0x1C04,	%o3
	sdivcc	%o7,	0x001F,	%o6
	save %i6, 0x10D7, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f8,	%f7,	%f15
	fsrc1s	%f30,	%f15
	fmovse	%xcc,	%f10,	%f5
	edge16	%i7,	%g7,	%g5
	lduh	[%l7 + 0x34],	%g2
	mova	%xcc,	%i0,	%g6
	stb	%l4,	[%l7 + 0x4D]
	addccc	%o5,	%i5,	%i4
	udivx	%o0,	0x0009,	%l2
	fmovdneg	%xcc,	%f8,	%f9
	fpsub32	%f8,	%f2,	%f16
	mulscc	%g1,	0x0F32,	%i1
	edge8ln	%l0,	%l6,	%o2
	and	%i2,	0x0B13,	%l5
	subc	%o4,	0x055A,	%l3
	alignaddrl	%l1,	%o1,	%i3
	movn	%xcc,	%g4,	%o7
	srax	%o6,	0x0C,	%o3
	andn	%g3,	%i6,	%g7
	sllx	%g5,	0x04,	%g2
	fnot2	%f20,	%f10
	or	%i7,	%g6,	%i0
	orncc	%o5,	0x0863,	%l4
	fnot1	%f30,	%f6
	srlx	%i5,	%o0,	%i4
	orncc	%l2,	0x0F59,	%g1
	srax	%i1,	0x16,	%l6
	fnand	%f16,	%f4,	%f4
	andncc	%o2,	%l0,	%i2
	add	%l5,	0x0940,	%l3
	stw	%l1,	[%l7 + 0x2C]
	movrne	%o1,	0x32F,	%i3
	fnor	%f10,	%f30,	%f6
	ldx	[%l7 + 0x78],	%o4
	movn	%xcc,	%g4,	%o7
	udivx	%o6,	0x0131,	%o3
	alignaddr	%i6,	%g7,	%g5
	addccc	%g2,	%g3,	%i7
	andcc	%g6,	0x017E,	%i0
	fmovrdne	%l4,	%f10,	%f4
	st	%f25,	[%l7 + 0x28]
	movcc	%xcc,	%o5,	%o0
	sra	%i4,	0x17,	%l2
	edge32	%g1,	%i5,	%l6
	edge16l	%o2,	%l0,	%i2
	nop
	set	0x45, %i6
	ldub	[%l7 + %i6],	%i1
	movn	%xcc,	%l3,	%l5
	ldd	[%l7 + 0x08],	%o0
	nop
	set	0x76, %i4
	ldsb	[%l7 + %i4],	%i3
	andncc	%l1,	%o4,	%g4
	edge8	%o7,	%o6,	%o3
	movleu	%xcc,	%i6,	%g5
	stx	%g2,	[%l7 + 0x30]
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%g2
	fabss	%f30,	%f17
	fmovdne	%icc,	%f7,	%f7
	fpsub16s	%f7,	%f21,	%f13
	ldd	[%l7 + 0x68],	%f20
	array16	%g7,	%i7,	%i0
	fnors	%f10,	%f16,	%f3
	edge8n	%g6,	%o5,	%l4
	fsrc1s	%f17,	%f22
	movrlz	%o0,	%i4,	%l2
	subc	%g1,	%i5,	%o2
	stw	%l6,	[%l7 + 0x4C]
	movrne	%i2,	0x039,	%l0
	sll	%i1,	%l3,	%l5
	movcc	%xcc,	%i3,	%o1
	fexpand	%f15,	%f12
	orcc	%l1,	%g4,	%o4
	fnands	%f7,	%f2,	%f26
	movne	%xcc,	%o6,	%o7
	subccc	%i6,	0x0BEC,	%o3
	edge32l	%g2,	%g3,	%g7
	lduw	[%l7 + 0x58],	%g5
	ldd	[%l7 + 0x40],	%i6
	ldsw	[%l7 + 0x70],	%i0
	ldd	[%l7 + 0x10],	%f4
	fmovspos	%icc,	%f23,	%f30
	fcmpeq32	%f26,	%f26,	%o5
	st	%f24,	[%l7 + 0x18]
	movrlz	%g6,	0x15D,	%l4
	movrgez	%i4,	%l2,	%o0
	movl	%xcc,	%i5,	%o2
	movcs	%icc,	%l6,	%i2
	movrlez	%l0,	0x294,	%i1
	sra	%g1,	0x1B,	%l3
	movrgz	%i3,	0x2B9,	%o1
	srl	%l5,	%g4,	%l1
	fxnor	%f0,	%f14,	%f24
	fmovrdlz	%o6,	%f26,	%f28
	edge32ln	%o4,	%i6,	%o7
	orncc	%g2,	%o3,	%g7
	edge32n	%g5,	%i7,	%i0
	fmul8x16al	%f10,	%f23,	%f8
	ldsb	[%l7 + 0x27],	%o5
	movrlz	%g6,	0x3C7,	%l4
	addc	%g3,	%l2,	%o0
	fmovrdne	%i4,	%f24,	%f4
	edge32ln	%o2,	%l6,	%i2
	orn	%l0,	0x150D,	%i1
	xnorcc	%i5,	0x0461,	%l3
	nop
	set	0x48, %g5
	stx	%i3,	[%l7 + %g5]
	edge32n	%g1,	%l5,	%g4
	lduh	[%l7 + 0x08],	%l1
	movle	%xcc,	%o6,	%o4
	fornot1s	%f16,	%f31,	%f4
	st	%f23,	[%l7 + 0x1C]
	ldsh	[%l7 + 0x54],	%i6
	fsrc1s	%f19,	%f4
	popc	%o7,	%g2
	mulscc	%o3,	0x1D0C,	%o1
	fmovdg	%xcc,	%f11,	%f21
	subccc	%g5,	%g7,	%i7
	addccc	%i0,	%g6,	%o5
	fmul8x16al	%f9,	%f5,	%f28
	mulscc	%l4,	%l2,	%o0
	fcmple32	%f28,	%f22,	%i4
	edge8	%o2,	%l6,	%i2
	alignaddr	%g3,	%l0,	%i5
	xnorcc	%l3,	0x1191,	%i1
	movle	%xcc,	%i3,	%g1
	srl	%g4,	%l5,	%l1
	movgu	%xcc,	%o4,	%o6
	andncc	%o7,	%i6,	%o3
	smul	%o1,	0x1229,	%g2
	alignaddr	%g7,	%g5,	%i7
	umul	%i0,	0x1BEC,	%o5
	std	%f22,	[%l7 + 0x58]
	fmul8x16al	%f14,	%f11,	%f18
	udivcc	%g6,	0x1EA0,	%l2
	movvc	%icc,	%l4,	%i4
	fmovsgu	%icc,	%f19,	%f11
	and	%o0,	0x1B6B,	%o2
	sra	%i2,	0x14,	%g3
	stx	%l6,	[%l7 + 0x48]
	fandnot2s	%f18,	%f8,	%f26
	ldd	[%l7 + 0x20],	%l0
	array8	%i5,	%i1,	%i3
	and	%l3,	%g1,	%l5
	edge16n	%l1,	%o4,	%g4
	xor	%o7,	%o6,	%i6
	movpos	%xcc,	%o1,	%g2
	smul	%o3,	%g7,	%i7
	ldx	[%l7 + 0x18],	%i0
	fmovdle	%xcc,	%f5,	%f19
	fandnot2	%f14,	%f26,	%f18
	ldsb	[%l7 + 0x79],	%g5
	orncc	%o5,	0x0E25,	%g6
	edge8l	%l4,	%l2,	%o0
	alignaddr	%i4,	%i2,	%o2
	fmovsne	%icc,	%f21,	%f18
	sra	%g3,	%l0,	%i5
	smul	%i1,	%l6,	%l3
	fmovdgu	%xcc,	%f2,	%f2
	ldd	[%l7 + 0x78],	%f20
	movne	%xcc,	%i3,	%g1
	ldsw	[%l7 + 0x14],	%l5
	mova	%icc,	%o4,	%g4
	fmovsge	%icc,	%f4,	%f28
	umul	%l1,	%o6,	%o7
	ldd	[%l7 + 0x58],	%o0
	lduw	[%l7 + 0x4C],	%i6
	sdivx	%g2,	0x0978,	%g7
	sdivx	%o3,	0x0093,	%i7
	fpsub16s	%f26,	%f2,	%f22
	edge16	%g5,	%i0,	%g6
	andncc	%l4,	%l2,	%o5
	st	%f28,	[%l7 + 0x3C]
	array8	%i4,	%o0,	%o2
	faligndata	%f30,	%f2,	%f2
	st	%f28,	[%l7 + 0x58]
	edge8n	%i2,	%l0,	%i5
	ldsb	[%l7 + 0x10],	%g3
	srl	%l6,	0x15,	%i1
	alignaddrl	%i3,	%g1,	%l5
	sra	%l3,	0x1C,	%g4
	umul	%l1,	%o4,	%o7
	smul	%o6,	0x07B5,	%i6
	fcmpeq16	%f24,	%f6,	%o1
	popc	0x060F,	%g2
	fcmple32	%f22,	%f28,	%o3
	orcc	%g7,	%i7,	%g5
	fmovsvs	%icc,	%f4,	%f17
	fmovsa	%icc,	%f2,	%f23
	movleu	%icc,	%g6,	%l4
	ldsb	[%l7 + 0x4E],	%i0
	edge16	%o5,	%i4,	%l2
	fmovrse	%o2,	%f5,	%f29
	fands	%f2,	%f15,	%f26
	smulcc	%o0,	0x0612,	%i2
	fmovrdgez	%l0,	%f8,	%f6
	subcc	%i5,	0x0F1A,	%g3
	sdivcc	%l6,	0x0699,	%i3
	xor	%g1,	%i1,	%l5
	array32	%g4,	%l1,	%l3
	sll	%o7,	0x16,	%o6
	fmul8x16	%f2,	%f4,	%f16
	fmovrdgz	%o4,	%f14,	%f10
	edge16ln	%o1,	%i6,	%o3
	fmovsle	%xcc,	%f9,	%f13
	std	%f2,	[%l7 + 0x08]
	movn	%xcc,	%g7,	%g2
	movrgez	%i7,	%g6,	%l4
	xor	%g5,	0x191E,	%i0
	fmovdg	%icc,	%f21,	%f29
	stw	%o5,	[%l7 + 0x7C]
	movgu	%icc,	%i4,	%o2
	edge32l	%o0,	%l2,	%l0
	faligndata	%f2,	%f22,	%f20
	movl	%xcc,	%i5,	%i2
	addccc	%l6,	%i3,	%g1
	sllx	%i1,	%l5,	%g4
	addc	%l1,	%l3,	%o7
	lduh	[%l7 + 0x7A],	%o6
	fmovsvc	%xcc,	%f10,	%f14
	movcc	%xcc,	%o4,	%o1
	udiv	%g3,	0x022B,	%i6
	fmovd	%f30,	%f8
	andn	%g7,	%g2,	%o3
	ld	[%l7 + 0x20],	%f20
	movle	%xcc,	%g6,	%i7
	movrgez	%g5,	0x3B2,	%i0
	nop
	set	0x1A, %l6
	lduh	[%l7 + %l6],	%l4
	fcmpgt32	%f4,	%f12,	%o5
	sethi	0x1D45,	%i4
	udiv	%o2,	0x0213,	%o0
	stw	%l0,	[%l7 + 0x10]
	std	%f22,	[%l7 + 0x28]
	or	%i5,	%i2,	%l6
	edge8	%i3,	%l2,	%g1
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	edge8	%l3,	%o7,	%o6
	movre	%o4,	0x218,	%o1
	nop
	set	0x54, %g3
	ldsw	[%l7 + %g3],	%l1
	srax	%g3,	%g7,	%g2
	ld	[%l7 + 0x38],	%f27
	sra	%i6,	0x10,	%g6
	fnand	%f4,	%f10,	%f0
	fpack32	%f18,	%f2,	%f28
	orncc	%o3,	0x0565,	%g5
	edge8ln	%i7,	%l4,	%o5
	fmovrsgez	%i0,	%f6,	%f19
	edge8	%i4,	%o0,	%l0
	array8	%o2,	%i2,	%i5
	andncc	%i3,	%l2,	%g1
	sethi	0x0222,	%l5
	sdivcc	%g4,	0x0AEF,	%i1
	ld	[%l7 + 0x1C],	%f25
	srax	%l6,	0x02,	%l3
	subcc	%o7,	0x1354,	%o6
	fmovsn	%xcc,	%f17,	%f31
	lduw	[%l7 + 0x60],	%o1
	umul	%l1,	0x1B22,	%g3
	movneg	%xcc,	%g7,	%o4
	movrlez	%g2,	%i6,	%o3
	edge16n	%g5,	%g6,	%l4
	sdiv	%o5,	0x0333,	%i0
	array8	%i7,	%o0,	%i4
	fmovsle	%icc,	%f25,	%f9
	edge8	%o2,	%l0,	%i2
	andncc	%i5,	%i3,	%g1
	alignaddrl	%l5,	%g4,	%i1
	fmovdcs	%xcc,	%f2,	%f3
	fpack16	%f4,	%f0
	alignaddrl	%l2,	%l6,	%o7
	andn	%o6,	0x0A1D,	%l3
	smulcc	%o1,	%g3,	%g7
	restore %l1, 0x11BD, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f24,	%f18,	%f16
	edge16	%g2,	%o3,	%g5
	edge8ln	%i6,	%g6,	%l4
	move	%icc,	%i0,	%i7
	udivcc	%o5,	0x04B3,	%o0
	ldd	[%l7 + 0x50],	%i4
	fnors	%f6,	%f13,	%f3
	movcc	%icc,	%l0,	%o2
	ld	[%l7 + 0x48],	%f0
	fmovrdlz	%i5,	%f0,	%f14
	andcc	%i3,	%i2,	%g1
	edge8	%g4,	%i1,	%l2
	umulcc	%l6,	0x0F7D,	%l5
	fmovdleu	%xcc,	%f28,	%f2
	move	%icc,	%o7,	%l3
	fmovdvs	%icc,	%f3,	%f18
	xor	%o1,	%o6,	%g7
	fmovdneg	%xcc,	%f11,	%f29
	edge16	%g3,	%o4,	%g2
	fexpand	%f3,	%f10
	movneg	%icc,	%o3,	%l1
	orn	%g5,	%g6,	%i6
	movrgz	%l4,	%i0,	%o5
	sra	%o0,	%i7,	%l0
	movrne	%i4,	%o2,	%i3
	edge32n	%i5,	%g1,	%i2
	movgu	%icc,	%g4,	%l2
	alignaddr	%l6,	%l5,	%i1
	movcc	%icc,	%l3,	%o1
	movcs	%icc,	%o6,	%o7
	or	%g7,	0x1A32,	%g3
	xnorcc	%g2,	0x034D,	%o4
	sllx	%o3,	0x1F,	%l1
	save %g5, %i6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x54],	%i0
	ldsw	[%l7 + 0x74],	%g6
	ldd	[%l7 + 0x10],	%f30
	nop
	set	0x6A, %l0
	stb	%o0,	[%l7 + %l0]
	fpackfix	%f16,	%f21
	movvs	%icc,	%i7,	%o5
	fmovrslz	%l0,	%f16,	%f25
	smul	%o2,	0x0E30,	%i4
	edge16n	%i5,	%i3,	%g1
	fandnot2s	%f26,	%f27,	%f25
	array32	%i2,	%l2,	%g4
	for	%f4,	%f0,	%f14
	fzeros	%f1
	subcc	%l6,	0x14AC,	%i1
	movleu	%xcc,	%l3,	%l5
	fands	%f12,	%f4,	%f3
	movle	%xcc,	%o6,	%o1
	edge16n	%g7,	%g3,	%o7
	movne	%icc,	%o4,	%g2
	popc	%o3,	%g5
	array16	%i6,	%l1,	%i0
	movrlz	%g6,	0x389,	%o0
	sethi	0x0034,	%i7
	udiv	%o5,	0x066F,	%l0
	sdivcc	%o2,	0x0FD9,	%i4
	addcc	%l4,	0x1A15,	%i5
	sir	0x0C50
	fmovdgu	%icc,	%f22,	%f31
	umul	%i3,	%i2,	%g1
	edge16	%l2,	%g4,	%l6
	fcmple16	%f4,	%f28,	%l3
	fmul8x16au	%f17,	%f8,	%f22
	srlx	%i1,	%l5,	%o6
	nop
	set	0x40, %i1
	stx	%o1,	[%l7 + %i1]
	orcc	%g7,	%g3,	%o4
	movcc	%xcc,	%g2,	%o3
	addc	%g5,	%i6,	%o7
	edge32n	%l1,	%g6,	%o0
	array32	%i0,	%o5,	%l0
	fmovrdgz	%o2,	%f24,	%f6
	ldub	[%l7 + 0x66],	%i7
	orn	%l4,	%i4,	%i3
	fmovdge	%icc,	%f19,	%f13
	or	%i5,	0x1631,	%i2
	udivx	%g1,	0x0F1A,	%g4
	movn	%icc,	%l2,	%l3
	fabss	%f31,	%f19
	fpadd16	%f10,	%f26,	%f20
	and	%i1,	%l5,	%o6
	addc	%o1,	0x0962,	%l6
	fxnors	%f17,	%f10,	%f6
	edge16n	%g7,	%o4,	%g2
	smul	%g3,	0x0927,	%o3
	edge8ln	%g5,	%i6,	%l1
	fcmple32	%f26,	%f4,	%o7
	addc	%o0,	0x076F,	%i0
	edge16ln	%g6,	%o5,	%o2
	sth	%i7,	[%l7 + 0x64]
	array32	%l4,	%i4,	%i3
	srl	%l0,	%i5,	%g1
	movl	%icc,	%i2,	%l2
	stw	%l3,	[%l7 + 0x70]
	std	%f18,	[%l7 + 0x18]
	lduw	[%l7 + 0x3C],	%i1
	sth	%g4,	[%l7 + 0x1C]
	movrne	%l5,	0x0C8,	%o6
	sll	%l6,	0x17,	%g7
	movvs	%icc,	%o4,	%o1
	fmovsne	%xcc,	%f25,	%f24
	movl	%icc,	%g2,	%o3
	move	%icc,	%g3,	%i6
	sllx	%g5,	%l1,	%o0
	array16	%o7,	%i0,	%g6
	fpadd16	%f14,	%f20,	%f4
	sethi	0x1A42,	%o2
	srlx	%i7,	0x14,	%l4
	fnegs	%f6,	%f3
	srl	%o5,	%i4,	%l0
	movpos	%icc,	%i5,	%i3
	fmul8sux16	%f14,	%f30,	%f0
	orncc	%g1,	%l2,	%i2
	ldub	[%l7 + 0x1F],	%i1
	nop
	set	0x6E, %i0
	ldub	[%l7 + %i0],	%g4
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	fmovspos	%icc,	%f12,	%f23
	lduw	[%l7 + 0x08],	%o6
	smulcc	%g7,	0x0ADB,	%o1
	fcmpeq32	%f22,	%f8,	%g2
	movvs	%xcc,	%o4,	%o3
	movrlez	%i6,	%g5,	%l1
	movcs	%xcc,	%g3,	%o7
	movl	%xcc,	%o0,	%g6
	lduw	[%l7 + 0x14],	%o2
	ld	[%l7 + 0x0C],	%f8
	orncc	%i0,	0x1556,	%i7
	movrlez	%o5,	%i4,	%l4
	movvs	%icc,	%l0,	%i3
	bshuffle	%f8,	%f8,	%f20
	and	%i5,	0x0022,	%g1
	andn	%l2,	0x0AAC,	%i2
	andncc	%g4,	%i1,	%l5
	xor	%l3,	%l6,	%g7
	ldub	[%l7 + 0x08],	%o6
	addc	%g2,	%o4,	%o3
	movrgez	%o1,	0x240,	%g5
	st	%f9,	[%l7 + 0x18]
	movleu	%icc,	%l1,	%i6
	lduh	[%l7 + 0x46],	%o7
	alignaddrl	%g3,	%o0,	%g6
	st	%f31,	[%l7 + 0x1C]
	ldsb	[%l7 + 0x77],	%o2
	edge32ln	%i0,	%o5,	%i4
	fmovdvs	%icc,	%f20,	%f20
	edge16n	%l4,	%i7,	%l0
	umul	%i5,	0x0EEF,	%i3
	xor	%g1,	0x01E2,	%i2
	ldsh	[%l7 + 0x44],	%l2
	edge32l	%g4,	%l5,	%i1
	edge16	%l3,	%l6,	%g7
	addc	%g2,	%o4,	%o6
	smulcc	%o3,	%g5,	%l1
	fornot1	%f16,	%f28,	%f22
	movvs	%xcc,	%i6,	%o7
	movpos	%xcc,	%g3,	%o1
	edge16n	%g6,	%o0,	%i0
	stx	%o5,	[%l7 + 0x70]
	and	%i4,	%l4,	%i7
	ldd	[%l7 + 0x10],	%f6
	edge32l	%l0,	%i5,	%o2
	fcmpeq32	%f26,	%f30,	%g1
	popc	0x059F,	%i3
	orcc	%l2,	%i2,	%l5
	array16	%g4,	%i1,	%l3
	umulcc	%g7,	%l6,	%o4
	fpackfix	%f18,	%f28
	movre	%o6,	%g2,	%g5
	edge32l	%l1,	%i6,	%o3
	fmovsl	%icc,	%f22,	%f5
	umulcc	%g3,	%o1,	%o7
	fxors	%f11,	%f6,	%f23
	edge16l	%g6,	%o0,	%o5
	andn	%i4,	0x0C51,	%i0
	fmovscc	%xcc,	%f17,	%f21
	stw	%i7,	[%l7 + 0x20]
	movleu	%xcc,	%l4,	%l0
	siam	0x2
	fnot2s	%f21,	%f30
	fnands	%f21,	%f30,	%f1
	orcc	%o2,	%g1,	%i5
	fpack16	%f28,	%f4
	fmovdl	%xcc,	%f11,	%f27
	ldub	[%l7 + 0x2E],	%l2
	umulcc	%i2,	%i3,	%l5
	movg	%icc,	%g4,	%i1
	udiv	%l3,	0x1619,	%g7
	umulcc	%o4,	%o6,	%g2
	edge16n	%l6,	%g5,	%i6
	ldd	[%l7 + 0x70],	%o2
	fcmped	%fcc2,	%f4,	%f22
	ldd	[%l7 + 0x28],	%f6
	fmovsa	%icc,	%f17,	%f0
	xnor	%l1,	0x1A79,	%o1
	sth	%o7,	[%l7 + 0x22]
	subccc	%g3,	0x1D79,	%g6
	mulx	%o0,	0x1FB1,	%o5
	movgu	%xcc,	%i4,	%i0
	xnor	%l4,	0x0874,	%i7
	movle	%xcc,	%o2,	%l0
	movrlz	%i5,	%g1,	%i2
	mulx	%i3,	%l2,	%l5
	srax	%g4,	0x08,	%i1
	movg	%xcc,	%l3,	%o4
	subcc	%g7,	0x103F,	%g2
	mulx	%o6,	%g5,	%i6
	movleu	%xcc,	%o3,	%l6
	st	%f0,	[%l7 + 0x2C]
	movneg	%xcc,	%l1,	%o7
	movrgez	%g3,	%g6,	%o1
	movle	%icc,	%o5,	%i4
	movle	%xcc,	%i0,	%o0
	fmovrse	%i7,	%f21,	%f6
	umulcc	%l4,	0x0041,	%l0
	faligndata	%f18,	%f12,	%f20
	bshuffle	%f4,	%f6,	%f20
	edge32	%i5,	%o2,	%i2
	orcc	%g1,	0x1358,	%i3
	edge32ln	%l2,	%g4,	%i1
	edge8ln	%l5,	%l3,	%g7
	ldsh	[%l7 + 0x74],	%o4
	fmovdn	%xcc,	%f8,	%f21
	sth	%g2,	[%l7 + 0x3E]
	fmovrsne	%o6,	%f21,	%f8
	addcc	%g5,	0x137E,	%o3
	fcmple32	%f28,	%f22,	%i6
	edge8n	%l6,	%l1,	%g3
	fpadd16	%f10,	%f26,	%f20
	edge32ln	%g6,	%o7,	%o5
	edge16n	%o1,	%i4,	%i0
	fmovrsgz	%i7,	%f18,	%f30
	alignaddrl	%o0,	%l4,	%i5
	fzero	%f14
	fmovrdgez	%l0,	%f8,	%f8
	add	%i2,	0x0420,	%o2
	mova	%xcc,	%g1,	%l2
	smul	%i3,	%i1,	%g4
	fnands	%f29,	%f23,	%f13
	movn	%xcc,	%l5,	%g7
	fmuld8ulx16	%f18,	%f23,	%f4
	udivcc	%l3,	0x04C9,	%o4
	popc	%g2,	%o6
	movrne	%g5,	0x165,	%o3
	addccc	%l6,	%l1,	%i6
	ld	[%l7 + 0x2C],	%f12
	movn	%xcc,	%g6,	%g3
	subccc	%o5,	0x0F4D,	%o1
	fmovdvs	%icc,	%f28,	%f5
	std	%f26,	[%l7 + 0x38]
	ld	[%l7 + 0x48],	%f24
	edge16l	%i4,	%o7,	%i7
	ldub	[%l7 + 0x6A],	%i0
	edge32l	%l4,	%o0,	%i5
	andncc	%i2,	%o2,	%g1
	ldsh	[%l7 + 0x68],	%l2
	andncc	%i3,	%i1,	%g4
	subcc	%l5,	0x16CE,	%l0
	sdivcc	%l3,	0x102B,	%g7
	fpsub16	%f24,	%f30,	%f28
	and	%o4,	0x144D,	%o6
	ldd	[%l7 + 0x40],	%f16
	sra	%g2,	%g5,	%l6
	save %l1, %o3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%g3,	%i6
	fmovdn	%xcc,	%f31,	%f14
	ldsb	[%l7 + 0x6D],	%o5
	sth	%i4,	[%l7 + 0x5C]
	xnorcc	%o7,	0x1D53,	%i7
	xor	%o1,	0x0C03,	%i0
	movrgz	%o0,	%i5,	%i2
	movleu	%xcc,	%l4,	%g1
	movgu	%xcc,	%o2,	%i3
	movrne	%l2,	0x265,	%g4
	edge8l	%l5,	%i1,	%l3
	orn	%l0,	0x11CB,	%o4
	edge32	%g7,	%o6,	%g5
	alignaddr	%l6,	%g2,	%o3
	nop
	set	0x10, %g1
	std	%f0,	[%l7 + %g1]
	movneg	%icc,	%g6,	%l1
	lduw	[%l7 + 0x54],	%i6
	save %g3, 0x0AD4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o5,	[%l7 + 0x50]
	edge8ln	%o7,	%i7,	%o1
	fornot2s	%f4,	%f8,	%f26
	movne	%icc,	%o0,	%i0
	movcc	%icc,	%i2,	%l4
	edge32l	%i5,	%o2,	%g1
	array16	%l2,	%g4,	%i3
	movrlez	%i1,	0x196,	%l3
	movpos	%icc,	%l0,	%o4
	umulcc	%l5,	%g7,	%g5
	movrgz	%o6,	%l6,	%g2
	std	%f14,	[%l7 + 0x48]
	fmovrdne	%o3,	%f20,	%f18
	or	%g6,	0x1B50,	%l1
	srl	%i6,	0x0D,	%g3
	fxnors	%f5,	%f16,	%f10
	movrne	%o5,	%i4,	%o7
	movpos	%xcc,	%i7,	%o0
	movgu	%icc,	%i0,	%o1
	fmovdcc	%xcc,	%f18,	%f24
	edge8ln	%i2,	%l4,	%i5
	udiv	%o2,	0x056E,	%l2
	fmovrsgz	%g4,	%f23,	%f14
	edge16n	%g1,	%i3,	%l3
	fmovrdlz	%i1,	%f10,	%f2
	addcc	%o4,	0x035D,	%l0
	movg	%xcc,	%l5,	%g7
	fone	%f2
	stb	%g5,	[%l7 + 0x13]
	edge32n	%o6,	%l6,	%o3
	mova	%icc,	%g6,	%g2
	xorcc	%l1,	0x1C94,	%i6
	edge16l	%g3,	%i4,	%o5
	fandnot2	%f6,	%f24,	%f26
	fxor	%f28,	%f30,	%f20
	smulcc	%i7,	%o0,	%i0
	edge8n	%o7,	%i2,	%o1
	edge8l	%i5,	%l4,	%l2
	alignaddr	%g4,	%g1,	%i3
	restore %l3, 0x1256, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f10,	%f3
	add	%o4,	%l0,	%o2
	array8	%l5,	%g5,	%g7
	udivcc	%o6,	0x0A04,	%o3
	nop
	set	0x5C, %g6
	ldsh	[%l7 + %g6],	%g6
	edge32l	%l6,	%g2,	%l1
	movgu	%xcc,	%i6,	%g3
	udivcc	%i4,	0x174A,	%i7
	movg	%xcc,	%o5,	%o0
	addccc	%i0,	%o7,	%o1
	movre	%i2,	0x2E4,	%i5
	ldx	[%l7 + 0x58],	%l4
	mova	%xcc,	%l2,	%g1
	save %i3, 0x171A, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%i1,	%o4
	movrlez	%l3,	0x10C,	%o2
	addccc	%l0,	%l5,	%g7
	fmovdvs	%xcc,	%f26,	%f11
	xnor	%g5,	%o6,	%o3
	movrlez	%l6,	%g2,	%g6
	fnot2	%f20,	%f22
	or	%i6,	%l1,	%g3
	udivcc	%i4,	0x1AA6,	%o5
	edge16	%o0,	%i0,	%i7
	ldd	[%l7 + 0x58],	%o6
	umulcc	%i2,	0x1B0E,	%i5
	umul	%o1,	0x1B57,	%l2
	or	%g1,	0x0D50,	%l4
	movge	%icc,	%i3,	%i1
	addccc	%o4,	0x18BA,	%l3
	sllx	%o2,	%g4,	%l5
	sllx	%g7,	0x12,	%g5
	fandnot2	%f8,	%f26,	%f30
	udivcc	%l0,	0x17D8,	%o3
	fmovrdne	%l6,	%f4,	%f8
	movrlez	%g2,	%g6,	%o6
	fxor	%f8,	%f16,	%f28
	fornot1	%f28,	%f18,	%f2
	smul	%l1,	0x0752,	%g3
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%i4
	movcc	%xcc,	%i6,	%o5
	fpadd16s	%f30,	%f16,	%f26
	edge16n	%o0,	%i7,	%i0
	movcs	%xcc,	%o7,	%i5
	siam	0x5
	umul	%i2,	%l2,	%o1
	lduw	[%l7 + 0x2C],	%l4
	fmovdleu	%icc,	%f21,	%f1
	alignaddr	%i3,	%g1,	%o4
	fmovdcc	%icc,	%f31,	%f29
	fnors	%f22,	%f0,	%f14
	ldd	[%l7 + 0x58],	%f2
	edge16	%l3,	%o2,	%g4
	udivcc	%l5,	0x18B7,	%g7
	andncc	%g5,	%i1,	%o3
	bshuffle	%f24,	%f16,	%f24
	fmovrdgez	%l0,	%f24,	%f16
	fnegd	%f30,	%f4
	sll	%l6,	0x00,	%g2
	fnor	%f24,	%f24,	%f10
	umul	%g6,	%l1,	%g3
	ldsw	[%l7 + 0x10],	%o6
	move	%xcc,	%i4,	%o5
	orn	%i6,	%o0,	%i0
	fmovrde	%o7,	%f28,	%f22
	sllx	%i5,	0x1D,	%i7
	fmovrslz	%i2,	%f7,	%f31
	srax	%l2,	%o1,	%l4
	andncc	%i3,	%o4,	%g1
	sth	%l3,	[%l7 + 0x70]
	movne	%icc,	%o2,	%g4
	sdiv	%g7,	0x0A16,	%l5
	udiv	%g5,	0x14CC,	%i1
	movne	%icc,	%l0,	%l6
	subccc	%g2,	%o3,	%g6
	fcmpd	%fcc2,	%f4,	%f16
	movcs	%icc,	%g3,	%l1
	umulcc	%o6,	%o5,	%i4
	sethi	0x1EA2,	%o0
	movgu	%xcc,	%i0,	%o7
	popc	0x1CFD,	%i6
	edge32ln	%i5,	%i2,	%l2
	edge8n	%i7,	%l4,	%i3
	andncc	%o1,	%g1,	%o4
	movvc	%icc,	%o2,	%l3
	sll	%g4,	%l5,	%g5
	ldub	[%l7 + 0x2E],	%g7
	fpack32	%f30,	%f12,	%f10
	sllx	%l0,	%l6,	%g2
	fnot2s	%f0,	%f28
	umulcc	%o3,	0x0012,	%i1
	movleu	%icc,	%g6,	%l1
	fnot2	%f18,	%f0
	smulcc	%g3,	0x1E73,	%o6
	ldub	[%l7 + 0x18],	%i4
	movn	%icc,	%o0,	%i0
	fcmpgt16	%f20,	%f28,	%o7
	for	%f8,	%f22,	%f10
	sdivcc	%i6,	0x154B,	%i5
	edge16ln	%o5,	%i2,	%i7
	srl	%l2,	0x19,	%i3
	mulscc	%l4,	0x122B,	%o1
	udivcc	%o4,	0x0CE4,	%o2
	edge32n	%l3,	%g1,	%g4
	edge16ln	%l5,	%g5,	%l0
	fornot2	%f6,	%f12,	%f10
	fmovdl	%icc,	%f30,	%f30
	udivx	%l6,	0x1AB5,	%g7
	srl	%g2,	%o3,	%i1
	array16	%g6,	%l1,	%o6
	movrne	%i4,	%g3,	%o0
	udivcc	%i0,	0x1EC8,	%o7
	stx	%i6,	[%l7 + 0x08]
	st	%f23,	[%l7 + 0x70]
	lduh	[%l7 + 0x1A],	%i5
	fandnot1s	%f31,	%f21,	%f3
	edge8n	%o5,	%i2,	%l2
	xnor	%i7,	%i3,	%l4
	movrne	%o4,	%o1,	%l3
	and	%o2,	0x1448,	%g1
	movrlez	%g4,	%g5,	%l5
	edge8n	%l0,	%l6,	%g7
	sdiv	%g2,	0x1525,	%o3
	sdivx	%g6,	0x09D3,	%i1
	movrgz	%o6,	%i4,	%l1
	fmovsgu	%icc,	%f31,	%f1
	lduh	[%l7 + 0x26],	%o0
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	fmovsg	%xcc,	%f18,	%f23
	fandnot1s	%f0,	%f25,	%f6
	edge8ln	%i5,	%i6,	%i2
	move	%icc,	%l2,	%o5
	subcc	%i7,	0x1E13,	%l4
	xor	%o4,	0x0E42,	%i3
	ldx	[%l7 + 0x48],	%l3
	movcs	%icc,	%o2,	%o1
	movgu	%icc,	%g4,	%g1
	or	%l5,	0x106D,	%g5
	movge	%icc,	%l0,	%l6
	fmovspos	%icc,	%f10,	%f30
	xnorcc	%g7,	%o3,	%g2
	srl	%g6,	0x14,	%o6
	movvc	%xcc,	%i1,	%i4
	stx	%l1,	[%l7 + 0x38]
	edge8n	%o0,	%i0,	%g3
	ldsb	[%l7 + 0x1A],	%o7
	lduw	[%l7 + 0x18],	%i5
	sth	%i2,	[%l7 + 0x18]
	save %i6, %l2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o5,	0x16EE,	%o4
	srlx	%i3,	%l4,	%l3
	sub	%o2,	%o1,	%g1
	fors	%f19,	%f26,	%f23
	nop
	set	0x1E, %l3
	stb	%g4,	[%l7 + %l3]
	lduh	[%l7 + 0x78],	%g5
	orn	%l0,	0x0BAD,	%l6
	fcmpes	%fcc2,	%f2,	%f28
	orn	%g7,	%o3,	%g2
	fmovdleu	%icc,	%f5,	%f26
	movcc	%xcc,	%l5,	%g6
	fnand	%f2,	%f22,	%f6
	add	%i1,	%i4,	%l1
	fpadd32s	%f19,	%f18,	%f30
	fornot1s	%f3,	%f8,	%f27
	sub	%o0,	%i0,	%g3
	movcs	%icc,	%o7,	%i5
	movl	%xcc,	%o6,	%i2
	ldd	[%l7 + 0x78],	%f4
	edge16ln	%i6,	%l2,	%o5
	fabsd	%f30,	%f24
	addc	%o4,	0x0DFD,	%i7
	movge	%xcc,	%i3,	%l4
	or	%l3,	%o2,	%g1
	movneg	%xcc,	%o1,	%g5
	movcc	%icc,	%l0,	%g4
	movcs	%icc,	%l6,	%o3
	ldsh	[%l7 + 0x7A],	%g7
	fornot1	%f12,	%f6,	%f10
	fnot2s	%f5,	%f12
	umul	%g2,	%g6,	%l5
	edge8	%i4,	%i1,	%l1
	addccc	%o0,	%g3,	%i0
	add	%i5,	%o6,	%i2
	addcc	%i6,	%o7,	%o5
	edge8n	%o4,	%i7,	%l2
	fcmpes	%fcc3,	%f23,	%f3
	edge8n	%l4,	%i3,	%l3
	srlx	%g1,	%o2,	%o1
	move	%icc,	%g5,	%g4
	edge8n	%l6,	%o3,	%g7
	edge8	%l0,	%g6,	%g2
	st	%f22,	[%l7 + 0x30]
	fcmple16	%f12,	%f0,	%l5
	ldub	[%l7 + 0x7B],	%i4
	fmovdgu	%icc,	%f24,	%f6
	st	%f22,	[%l7 + 0x7C]
	fmovdgu	%xcc,	%f17,	%f14
	sth	%l1,	[%l7 + 0x38]
	fnors	%f17,	%f31,	%f26
	fcmps	%fcc1,	%f12,	%f26
	edge32n	%i1,	%g3,	%i0
	fnot1s	%f1,	%f26
	st	%f15,	[%l7 + 0x10]
	mulscc	%i5,	0x1E8C,	%o0
	siam	0x1
	udivcc	%o6,	0x0493,	%i6
	movl	%icc,	%o7,	%o5
	umul	%o4,	0x01BB,	%i7
	bshuffle	%f16,	%f30,	%f26
	st	%f13,	[%l7 + 0x78]
	fmovsgu	%xcc,	%f20,	%f28
	ldd	[%l7 + 0x78],	%l2
	fmul8x16	%f21,	%f12,	%f28
	srlx	%i2,	0x1B,	%i3
	edge16ln	%l4,	%l3,	%g1
	edge8n	%o1,	%g5,	%o2
	fmovdne	%xcc,	%f3,	%f13
	edge32l	%g4,	%l6,	%o3
	sth	%l0,	[%l7 + 0x34]
	movn	%xcc,	%g7,	%g2
	xnor	%l5,	0x1C0A,	%g6
	fmuld8ulx16	%f21,	%f25,	%f20
	movcs	%xcc,	%i4,	%l1
	srl	%g3,	%i1,	%i5
	movre	%o0,	0x287,	%i0
	movpos	%icc,	%o6,	%i6
	fsrc1	%f22,	%f18
	movneg	%xcc,	%o5,	%o4
	ldx	[%l7 + 0x20],	%o7
	udivx	%l2,	0x0D71,	%i7
	movrlez	%i2,	0x1DB,	%i3
	stx	%l3,	[%l7 + 0x70]
	sethi	0x0DF9,	%l4
	addccc	%o1,	0x18AA,	%g1
	sir	0x0514
	sdivx	%g5,	0x1D95,	%g4
	move	%xcc,	%o2,	%l6
	movg	%xcc,	%o3,	%g7
	sub	%g2,	%l5,	%g6
	andcc	%i4,	0x049C,	%l0
	udivcc	%l1,	0x1F9A,	%i1
	edge32n	%i5,	%g3,	%o0
	movle	%icc,	%i0,	%o6
	movrgez	%i6,	0x27A,	%o4
	array16	%o7,	%l2,	%o5
	edge16l	%i2,	%i3,	%l3
	st	%f8,	[%l7 + 0x0C]
	umul	%i7,	%o1,	%l4
	mulx	%g1,	%g4,	%o2
	save %l6, %g5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g7,	%g2,	%g6
	edge32l	%l5,	%i4,	%l0
	pdist	%f30,	%f6,	%f8
	edge8n	%l1,	%i5,	%i1
	movrne	%o0,	%g3,	%i0
	subc	%i6,	%o4,	%o6
	edge32	%l2,	%o7,	%i2
	andcc	%o5,	%i3,	%i7
	subc	%l3,	0x1809,	%l4
	sth	%g1,	[%l7 + 0x5E]
	fmovrslz	%o1,	%f15,	%f0
	xorcc	%o2,	%l6,	%g4
	sub	%g5,	%o3,	%g2
	fzeros	%f2
	fandnot1	%f20,	%f0,	%f18
	xnorcc	%g6,	%g7,	%l5
	fnot1	%f0,	%f2
	fmovrsgez	%i4,	%f30,	%f20
	sra	%l1,	%l0,	%i5
	edge8l	%o0,	%g3,	%i0
	srax	%i1,	0x0E,	%o4
	edge32	%i6,	%o6,	%l2
	edge8	%i2,	%o5,	%o7
	st	%f1,	[%l7 + 0x0C]
	nop
	set	0x6F, %g7
	ldub	[%l7 + %g7],	%i7
	movpos	%xcc,	%i3,	%l3
	subc	%g1,	%o1,	%l4
	edge8l	%l6,	%o2,	%g5
	edge8l	%g4,	%g2,	%o3
	nop
	set	0x7C, %i3
	lduw	[%l7 + %i3],	%g7
	srax	%g6,	0x1C,	%i4
	orn	%l1,	%l0,	%l5
	movne	%xcc,	%o0,	%g3
	fmovsg	%icc,	%f19,	%f0
	udiv	%i5,	0x1A56,	%i0
	fmovda	%xcc,	%f5,	%f30
	addcc	%i1,	%i6,	%o6
	movne	%icc,	%o4,	%l2
	movle	%icc,	%i2,	%o5
	fnot2s	%f12,	%f1
	alignaddrl	%o7,	%i7,	%i3
	fmul8sux16	%f4,	%f14,	%f24
	ld	[%l7 + 0x48],	%f10
	alignaddrl	%g1,	%l3,	%l4
	andn	%o1,	0x0DB4,	%l6
	sll	%o2,	%g5,	%g2
	fmovrdgez	%g4,	%f20,	%f28
	faligndata	%f12,	%f22,	%f14
	fmul8x16	%f23,	%f14,	%f18
	sethi	0x1E39,	%o3
	edge32l	%g7,	%g6,	%i4
	movg	%icc,	%l0,	%l1
	movrne	%o0,	%g3,	%i5
	edge8ln	%i0,	%i1,	%l5
	alignaddr	%i6,	%o6,	%o4
	save %l2, 0x0A98, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o7,	%o5,	%i7
	movvs	%icc,	%i3,	%g1
	movleu	%icc,	%l3,	%l4
	save %o1, %l6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%g2,	%o2
	movrgez	%g4,	%o3,	%g6
	movcc	%icc,	%i4,	%l0
	ldsb	[%l7 + 0x4D],	%g7
	ld	[%l7 + 0x54],	%f10
	mova	%icc,	%l1,	%o0
	ldd	[%l7 + 0x50],	%g2
	movvc	%xcc,	%i0,	%i5
	movpos	%xcc,	%l5,	%i1
	sdivx	%i6,	0x0AB4,	%o4
	sdivx	%o6,	0x05AC,	%i2
	movrgez	%o7,	%o5,	%i7
	std	%f12,	[%l7 + 0x08]
	umul	%i3,	0x0A6D,	%l2
	srax	%l3,	0x0C,	%g1
	fmovdl	%icc,	%f30,	%f28
	smulcc	%o1,	%l6,	%l4
	stb	%g5,	[%l7 + 0x26]
	movpos	%xcc,	%g2,	%g4
	movvs	%xcc,	%o3,	%g6
	xor	%i4,	%o2,	%l0
	ldx	[%l7 + 0x08],	%l1
	movcs	%xcc,	%o0,	%g7
	st	%f29,	[%l7 + 0x5C]
	fnands	%f18,	%f12,	%f17
	lduh	[%l7 + 0x72],	%g3
	smul	%i0,	%i5,	%l5
	movge	%xcc,	%i6,	%i1
	movrgez	%o4,	0x1AB,	%o6
	stb	%o7,	[%l7 + 0x54]
	stx	%i2,	[%l7 + 0x40]
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%o4
	ldsb	[%l7 + 0x1A],	%i3
	ldsw	[%l7 + 0x74],	%i7
	smulcc	%l3,	%l2,	%o1
	movgu	%xcc,	%g1,	%l4
	mulscc	%g5,	%l6,	%g2
	fmovrdgez	%o3,	%f22,	%f24
	edge8ln	%g6,	%g4,	%i4
	alignaddr	%o2,	%l1,	%l0
	edge32ln	%o0,	%g7,	%i0
	edge8n	%g3,	%l5,	%i6
	movrgez	%i1,	0x210,	%o4
	ldsh	[%l7 + 0x36],	%i5
	xnor	%o6,	%o7,	%o5
	fmovdg	%xcc,	%f29,	%f25
	ldd	[%l7 + 0x08],	%i2
	array8	%i7,	%l3,	%i2
	array16	%o1,	%l2,	%l4
	subccc	%g1,	%g5,	%l6
	addc	%g2,	0x09B3,	%o3
	edge32	%g6,	%i4,	%o2
	andn	%g4,	%l1,	%o0
	subc	%l0,	%g7,	%g3
	edge16l	%l5,	%i0,	%i6
	movg	%icc,	%i1,	%i5
	smul	%o6,	%o4,	%o7
	fmovrde	%o5,	%f0,	%f0
	edge16	%i3,	%l3,	%i2
	restore %i7, %o1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g1,	0x07CA,	%g5
	sdivcc	%l4,	0x152E,	%g2
	srax	%o3,	0x1C,	%g6
	fpack32	%f26,	%f22,	%f8
	nop
	set	0x18, %o6
	stx	%l6,	[%l7 + %o6]
	edge16l	%i4,	%g4,	%o2
	xorcc	%l1,	0x0EC9,	%l0
	umul	%g7,	0x0078,	%g3
	sdivx	%l5,	0x032C,	%i0
	fmuld8ulx16	%f21,	%f14,	%f2
	fxnor	%f24,	%f22,	%f18
	fmovdne	%xcc,	%f7,	%f24
	sdivcc	%i6,	0x0240,	%i1
	nop
	set	0x78, %l4
	lduw	[%l7 + %l4],	%i5
	mulscc	%o0,	0x0448,	%o4
	ld	[%l7 + 0x54],	%f2
	fcmpgt32	%f4,	%f14,	%o7
	umulcc	%o5,	%i3,	%l3
	addcc	%o6,	0x11E6,	%i7
	srlx	%o1,	0x14,	%i2
	movvs	%xcc,	%g1,	%l2
	edge8l	%l4,	%g5,	%o3
	fornot1	%f4,	%f6,	%f30
	stx	%g6,	[%l7 + 0x08]
	movcc	%xcc,	%l6,	%i4
	fand	%f22,	%f14,	%f6
	addcc	%g4,	%g2,	%o2
	addc	%l1,	%g7,	%g3
	or	%l5,	%i0,	%l0
	sethi	0x11AC,	%i1
	sdivcc	%i5,	0x0C9C,	%i6
	alignaddrl	%o4,	%o7,	%o0
	movneg	%icc,	%i3,	%l3
	move	%xcc,	%o6,	%o5
	movge	%icc,	%i7,	%i2
	fors	%f2,	%f14,	%f30
	movl	%icc,	%g1,	%o1
	fones	%f19
	edge8ln	%l4,	%g5,	%o3
	ldd	[%l7 + 0x38],	%f10
	edge8l	%l2,	%l6,	%g6
	srlx	%i4,	%g2,	%g4
	fmovd	%f10,	%f30
	smul	%l1,	%g7,	%g3
	or	%l5,	0x0B86,	%i0
	stx	%l0,	[%l7 + 0x60]
	sdiv	%i1,	0x19C8,	%i5
	lduh	[%l7 + 0x5C],	%o2
	fmovsge	%icc,	%f8,	%f15
	edge32	%i6,	%o4,	%o7
	fandnot2s	%f24,	%f19,	%f26
	xor	%o0,	0x0922,	%l3
	sra	%i3,	%o6,	%o5
	fcmpd	%fcc2,	%f24,	%f2
	save %i7, 0x11E0, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x53],	%o1
	fmovdneg	%icc,	%f7,	%f20
	fmovdcc	%icc,	%f12,	%f20
	edge32	%i2,	%l4,	%o3
	nop
	set	0x78, %l5
	ldx	[%l7 + %l5],	%g5
	fandnot1s	%f29,	%f6,	%f4
	ldd	[%l7 + 0x30],	%i6
	fcmpes	%fcc0,	%f31,	%f22
	movcs	%xcc,	%l2,	%i4
	sdivx	%g2,	0x0E65,	%g4
	fpsub32s	%f10,	%f10,	%f21
	movvc	%icc,	%g6,	%l1
	udivcc	%g3,	0x0363,	%g7
	fnands	%f7,	%f6,	%f14
	fmovrde	%l5,	%f6,	%f22
	fxnors	%f4,	%f23,	%f18
	edge32n	%l0,	%i1,	%i5
	fmovspos	%icc,	%f29,	%f8
	fmovdge	%xcc,	%f31,	%f19
	ldsh	[%l7 + 0x14],	%o2
	mulx	%i0,	%o4,	%i6
	movge	%icc,	%o7,	%l3
	edge32ln	%i3,	%o0,	%o6
	movvc	%icc,	%i7,	%g1
	edge32ln	%o5,	%i2,	%l4
	ldx	[%l7 + 0x10],	%o3
	xnor	%g5,	0x092C,	%o1
	movle	%xcc,	%l6,	%i4
	ldub	[%l7 + 0x4A],	%g2
	orn	%g4,	%g6,	%l2
	array32	%l1,	%g7,	%l5
	udiv	%l0,	0x1BA6,	%i1
	edge16	%g3,	%i5,	%i0
	fmul8x16au	%f12,	%f31,	%f30
	fones	%f2
	movge	%icc,	%o2,	%o4
	and	%i6,	%l3,	%o7
	movrgez	%o0,	0x2A3,	%o6
	std	%f10,	[%l7 + 0x30]
	array32	%i3,	%i7,	%g1
	edge8ln	%o5,	%i2,	%l4
	or	%g5,	%o1,	%o3
	movcs	%xcc,	%i4,	%g2
	popc	%l6,	%g4
	fsrc1s	%f31,	%f30
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	movvc	%xcc,	%l5,	%l1
	sdivcc	%l0,	0x12CF,	%g3
	or	%i1,	0x155B,	%i0
	movneg	%icc,	%o2,	%i5
	move	%xcc,	%o4,	%i6
	fmovda	%icc,	%f6,	%f12
	move	%icc,	%l3,	%o7
	fxor	%f24,	%f16,	%f12
	subcc	%o6,	%i3,	%o0
	movpos	%xcc,	%g1,	%o5
	ldd	[%l7 + 0x50],	%f8
	fpadd16	%f14,	%f24,	%f22
	array8	%i7,	%l4,	%g5
	umulcc	%o1,	%o3,	%i4
	edge16	%g2,	%i2,	%g4
	movn	%icc,	%g6,	%l6
	stw	%g7,	[%l7 + 0x3C]
	fabsd	%f28,	%f26
	umul	%l5,	%l2,	%l1
	addccc	%g3,	0x0473,	%i1
	xor	%l0,	0x12A3,	%o2
	sethi	0x0EFD,	%i0
	fabsd	%f0,	%f2
	edge32l	%i5,	%o4,	%i6
	addccc	%o7,	0x0BE5,	%l3
	movneg	%icc,	%i3,	%o6
	xnor	%o0,	%g1,	%i7
	std	%f4,	[%l7 + 0x60]
	ldsh	[%l7 + 0x0A],	%o5
	fandnot2s	%f9,	%f0,	%f22
	sllx	%g5,	%o1,	%l4
	udivcc	%i4,	0x1407,	%g2
	stw	%i2,	[%l7 + 0x7C]
	ldd	[%l7 + 0x20],	%f8
	srlx	%g4,	%o3,	%l6
	save %g6, 0x140A, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l5,	0x0890,	%l2
	mova	%icc,	%l1,	%i1
	fcmpne16	%f30,	%f12,	%g3
	sra	%o2,	%l0,	%i5
	srl	%i0,	%o4,	%o7
	std	%f28,	[%l7 + 0x60]
	srax	%l3,	%i6,	%i3
	movre	%o6,	0x093,	%o0
	xnor	%g1,	%i7,	%o5
	add	%g5,	0x0EC9,	%o1
	array32	%i4,	%l4,	%g2
	mova	%icc,	%g4,	%o3
	edge32l	%i2,	%l6,	%g6
	addccc	%g7,	%l2,	%l1
	lduh	[%l7 + 0x18],	%l5
	fcmpeq16	%f8,	%f22,	%g3
	sub	%i1,	%l0,	%i5
	movn	%xcc,	%o2,	%i0
	movpos	%icc,	%o4,	%o7
	fmul8ulx16	%f8,	%f12,	%f6
	edge16ln	%l3,	%i3,	%o6
	orn	%o0,	0x1BFF,	%g1
	edge32	%i7,	%i6,	%g5
	restore %o5, %o1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i4,	0x137A,	%g4
	fpack16	%f12,	%f13
	sll	%g2,	0x08,	%o3
	ldx	[%l7 + 0x28],	%i2
	std	%f4,	[%l7 + 0x08]
	mova	%xcc,	%g6,	%l6
	udiv	%l2,	0x13AA,	%g7
	array8	%l1,	%g3,	%i1
	sth	%l0,	[%l7 + 0x7E]
	fmovsvs	%xcc,	%f31,	%f6
	ld	[%l7 + 0x18],	%f9
	sra	%l5,	%o2,	%i0
	movrlz	%o4,	%o7,	%i5
	movleu	%xcc,	%i3,	%l3
	movn	%icc,	%o0,	%o6
	fandnot1	%f0,	%f24,	%f22
	nop
	set	0x7C, %o2
	ldsh	[%l7 + %o2],	%i7
	orncc	%i6,	%g5,	%o5
	edge8n	%o1,	%l4,	%i4
	sethi	0x190B,	%g1
	sdivcc	%g4,	0x00BD,	%o3
	fmovrsgez	%g2,	%f4,	%f3
	fmovrde	%i2,	%f12,	%f16
	fmovde	%xcc,	%f26,	%f16
	movle	%xcc,	%l6,	%l2
	movrgez	%g7,	%g6,	%l1
	movrne	%g3,	0x040,	%l0
	sra	%l5,	%i1,	%o2
	movrlez	%i0,	0x0B6,	%o4
	movge	%icc,	%o7,	%i5
	movrgez	%l3,	%o0,	%o6
	edge32ln	%i3,	%i7,	%g5
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	fxnors	%f25,	%f18,	%f21
	sth	%i4,	[%l7 + 0x78]
	move	%icc,	%i6,	%g1
	nop
	set	0x38, %l1
	lduw	[%l7 + %l1],	%g4
	xorcc	%g2,	0x08E3,	%i2
	fmuld8sux16	%f6,	%f17,	%f4
	xorcc	%l6,	%l2,	%g7
	array32	%o3,	%g6,	%g3
	movne	%icc,	%l0,	%l1
	movneg	%xcc,	%l5,	%o2
	fcmpne16	%f20,	%f16,	%i1
	addccc	%i0,	%o7,	%i5
	ldx	[%l7 + 0x50],	%o4
	movne	%icc,	%l3,	%o6
	umulcc	%o0,	%i3,	%g5
	edge32ln	%o5,	%i7,	%l4
	move	%icc,	%o1,	%i4
	movrlz	%g1,	0x072,	%i6
	array32	%g4,	%g2,	%l6
	edge32	%i2,	%l2,	%g7
	fmovda	%icc,	%f13,	%f25
	restore %g6, %g3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l1,	0x19,	%l5
	movgu	%icc,	%o2,	%i1
	and	%l0,	%i0,	%i5
	andn	%o4,	0x09B9,	%o7
	movrgez	%o6,	0x017,	%o0
	umulcc	%i3,	0x1C26,	%g5
	edge8ln	%o5,	%l3,	%i7
	movg	%xcc,	%o1,	%l4
	st	%f7,	[%l7 + 0x68]
	xnorcc	%i4,	0x15AF,	%i6
	ldub	[%l7 + 0x26],	%g1
	movrne	%g2,	%g4,	%l6
	fmovrslez	%i2,	%f6,	%f30
	ld	[%l7 + 0x50],	%f26
	movleu	%icc,	%g7,	%l2
	fcmpne32	%f10,	%f20,	%g3
	edge8l	%o3,	%l1,	%l5
	addc	%g6,	0x0F02,	%o2
	orncc	%l0,	%i1,	%i5
	movgu	%xcc,	%o4,	%o7
	subcc	%o6,	0x1D5C,	%i0
	movcc	%icc,	%i3,	%o0
	sra	%g5,	%l3,	%o5
	fmovdneg	%xcc,	%f10,	%f0
	alignaddr	%i7,	%l4,	%i4
	umulcc	%o1,	%g1,	%i6
	orn	%g4,	0x15CA,	%g2
	mova	%icc,	%i2,	%g7
	fzeros	%f7
	sth	%l6,	[%l7 + 0x16]
	edge32n	%l2,	%g3,	%o3
	fcmped	%fcc0,	%f30,	%f14
	add	%l5,	0x0D8A,	%g6
	movle	%icc,	%l1,	%l0
	movle	%xcc,	%o2,	%i1
	faligndata	%f8,	%f2,	%f28
	movle	%icc,	%o4,	%o7
	ldd	[%l7 + 0x58],	%i4
	movvc	%icc,	%o6,	%i3
	andn	%i0,	%o0,	%g5
	fnegd	%f20,	%f28
	andn	%o5,	0x0DBC,	%l3
	movge	%xcc,	%i7,	%i4
	edge8ln	%o1,	%g1,	%l4
	edge16n	%i6,	%g2,	%g4
	srlx	%i2,	0x19,	%g7
	fnot2	%f22,	%f6
	edge16	%l2,	%l6,	%g3
	movneg	%icc,	%o3,	%l5
	stb	%l1,	[%l7 + 0x20]
	stb	%g6,	[%l7 + 0x64]
	array16	%l0,	%o2,	%o4
	sra	%i1,	%i5,	%o6
	andncc	%i3,	%i0,	%o7
	movcs	%icc,	%o0,	%g5
	movvc	%xcc,	%o5,	%i7
	movg	%icc,	%l3,	%i4
	stw	%o1,	[%l7 + 0x2C]
	save %l4, 0x15EF, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i6,	%g4,	%g2
	sethi	0x0BCE,	%g7
	movcs	%xcc,	%l2,	%l6
	stx	%i2,	[%l7 + 0x58]
	nop
	set	0x78, %o3
	stx	%g3,	[%l7 + %o3]
	fpack16	%f10,	%f4
	stw	%l5,	[%l7 + 0x18]
	fornot1	%f18,	%f24,	%f14
	for	%f28,	%f18,	%f16
	ld	[%l7 + 0x64],	%f15
	fpsub32	%f0,	%f2,	%f24
	movre	%o3,	0x007,	%g6
	st	%f28,	[%l7 + 0x60]
	smulcc	%l0,	0x0E39,	%l1
	umul	%o4,	0x04AA,	%i1
	edge8n	%i5,	%o2,	%o6
	srlx	%i3,	0x0F,	%i0
	fmovdne	%icc,	%f3,	%f14
	edge8	%o0,	%g5,	%o5
	movge	%icc,	%i7,	%o7
	alignaddr	%l3,	%i4,	%l4
	sll	%g1,	0x1F,	%i6
	fornot1s	%f27,	%f5,	%f5
	movrgz	%g4,	%o1,	%g7
	andn	%l2,	0x0972,	%l6
	orcc	%g2,	%i2,	%l5
	st	%f1,	[%l7 + 0x38]
	faligndata	%f28,	%f30,	%f2
	fmovscs	%icc,	%f9,	%f12
	fpadd32s	%f0,	%f20,	%f2
	subccc	%g3,	0x124D,	%g6
	ldsw	[%l7 + 0x0C],	%l0
	movg	%icc,	%l1,	%o3
	udivcc	%o4,	0x14CA,	%i1
	fors	%f3,	%f11,	%f31
	sir	0x0395
	movl	%xcc,	%i5,	%o2
	addcc	%i3,	%i0,	%o0
	udivcc	%g5,	0x0619,	%o6
	alignaddrl	%o5,	%o7,	%l3
	subccc	%i7,	0x1D8D,	%l4
	addccc	%i4,	0x0464,	%i6
	orcc	%g4,	0x0A78,	%g1
	popc	%g7,	%o1
	alignaddr	%l6,	%l2,	%i2
	ldsw	[%l7 + 0x40],	%g2
	fcmps	%fcc2,	%f10,	%f16
	orn	%l5,	0x0111,	%g6
	addc	%l0,	%g3,	%l1
	edge32l	%o4,	%i1,	%o3
	edge32ln	%o2,	%i5,	%i0
	movge	%xcc,	%i3,	%g5
	fmovrslz	%o0,	%f18,	%f10
	edge32ln	%o6,	%o7,	%l3
	movpos	%xcc,	%o5,	%i7
	xorcc	%i4,	%l4,	%g4
	smulcc	%g1,	0x0D9F,	%i6
	fcmpd	%fcc2,	%f6,	%f12
	fmovd	%f2,	%f0
	movpos	%icc,	%g7,	%l6
	fornot2	%f20,	%f10,	%f30
	edge16l	%o1,	%i2,	%g2
	ldub	[%l7 + 0x54],	%l2
	movl	%icc,	%g6,	%l0
	edge8	%g3,	%l1,	%l5
	movge	%icc,	%i1,	%o4
	mulx	%o2,	0x0D9C,	%i5
	fxnor	%f14,	%f8,	%f10
	andn	%i0,	%i3,	%g5
	sth	%o0,	[%l7 + 0x3C]
	array8	%o3,	%o7,	%l3
	movneg	%xcc,	%o6,	%o5
	edge8ln	%i4,	%l4,	%i7
	addccc	%g1,	0x0826,	%g4
	stx	%i6,	[%l7 + 0x30]
	srlx	%g7,	0x08,	%l6
	fcmpeq32	%f8,	%f26,	%i2
	movrlez	%g2,	%o1,	%g6
	smul	%l0,	0x1B80,	%g3
	stw	%l2,	[%l7 + 0x50]
	mulscc	%l1,	0x0238,	%i1
	stx	%o4,	[%l7 + 0x60]
	movvs	%xcc,	%l5,	%i5
	movne	%icc,	%o2,	%i3
	st	%f14,	[%l7 + 0x3C]
	add	%i0,	%g5,	%o3
	fnot2	%f4,	%f18
	popc	%o7,	%o0
	addccc	%l3,	%o5,	%o6
	fmovdcc	%xcc,	%f3,	%f26
	movneg	%icc,	%i4,	%i7
	udiv	%g1,	0x1348,	%g4
	st	%f13,	[%l7 + 0x30]
	xor	%l4,	%i6,	%l6
	save %g7, %i2, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g6,	%o1,	%g3
	fandnot2	%f16,	%f12,	%f24
	fcmpd	%fcc1,	%f16,	%f22
	orcc	%l0,	0x1AD0,	%l1
	movrlz	%l2,	0x057,	%o4
	ldsh	[%l7 + 0x48],	%l5
	subcc	%i5,	0x1BE9,	%o2
	ldsb	[%l7 + 0x5E],	%i1
	fpackfix	%f28,	%f0
	edge32l	%i0,	%i3,	%g5
	nop
	set	0x6A, %g4
	lduh	[%l7 + %g4],	%o7
	movpos	%icc,	%o0,	%o3
	srlx	%l3,	%o6,	%o5
	fpmerge	%f13,	%f10,	%f12
	movgu	%icc,	%i4,	%i7
	fmul8x16	%f10,	%f16,	%f12
	fand	%f28,	%f14,	%f10
	fpadd16	%f4,	%f0,	%f4
	movcc	%xcc,	%g4,	%g1
	fmovde	%icc,	%f22,	%f25
	sll	%i6,	%l4,	%l6
	fxnors	%f11,	%f8,	%f20
	umul	%g7,	0x104E,	%g2
	andcc	%g6,	0x1F84,	%o1
	movcs	%xcc,	%i2,	%g3
	fmovsle	%xcc,	%f27,	%f2
	std	%f22,	[%l7 + 0x48]
	fmovdcc	%xcc,	%f25,	%f1
	array32	%l1,	%l2,	%o4
	edge16ln	%l5,	%l0,	%i5
	array32	%o2,	%i1,	%i0
	movleu	%xcc,	%g5,	%i3
	fmovsleu	%xcc,	%f17,	%f5
	sub	%o7,	0x15F8,	%o3
	move	%icc,	%o0,	%o6
	stw	%l3,	[%l7 + 0x1C]
	mova	%xcc,	%i4,	%i7
	movre	%o5,	0x0A5,	%g4
	alignaddrl	%g1,	%i6,	%l4
	fcmpd	%fcc3,	%f26,	%f22
	movne	%xcc,	%g7,	%l6
	fors	%f12,	%f27,	%f31
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	edge32l	%i2,	%g3,	%o1
	edge16	%l2,	%o4,	%l1
	sra	%l5,	0x02,	%i5
	or	%o2,	0x0200,	%l0
	array32	%i1,	%i0,	%g5
	movcs	%xcc,	%i3,	%o7
	edge32l	%o0,	%o6,	%l3
	edge16ln	%i4,	%o3,	%o5
	fmovrde	%g4,	%f30,	%f8
	movcc	%icc,	%i7,	%i6
	movle	%xcc,	%l4,	%g1
	fmovsleu	%icc,	%f25,	%f2
	xor	%l6,	0x0C65,	%g7
	save %g2, 0x1A4E, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f14,	%f7,	%f6
	fmovd	%f2,	%f20
	ldd	[%l7 + 0x50],	%g6
	sllx	%o1,	%g3,	%l2
	fpadd16s	%f12,	%f13,	%f12
	fnot2s	%f17,	%f20
	fmovs	%f13,	%f26
	edge16	%l1,	%o4,	%l5
	fmovsn	%icc,	%f0,	%f3
	xnor	%i5,	%l0,	%o2
	std	%f18,	[%l7 + 0x58]
	edge8l	%i0,	%g5,	%i1
	movcc	%xcc,	%o7,	%o0
	sra	%o6,	%i3,	%i4
	fmul8x16au	%f14,	%f29,	%f20
	ldsb	[%l7 + 0x78],	%o3
	fmovdg	%icc,	%f23,	%f12
	fmovscs	%icc,	%f20,	%f2
	srax	%l3,	0x18,	%o5
	udivx	%i7,	0x1B52,	%i6
	movre	%l4,	0x210,	%g4
	ldd	[%l7 + 0x68],	%f14
	orn	%l6,	%g1,	%g7
	fandnot1	%f0,	%f8,	%f20
	popc	0x09E1,	%g2
	movvc	%xcc,	%i2,	%g6
	movre	%g3,	%o1,	%l2
	fnot2	%f0,	%f20
	sll	%l1,	0x1B,	%l5
	bshuffle	%f0,	%f6,	%f12
	subccc	%o4,	0x0E60,	%l0
	sdivx	%i5,	0x1778,	%o2
	edge8	%g5,	%i1,	%o7
	udivx	%o0,	0x036C,	%o6
	alignaddrl	%i0,	%i4,	%i3
	fcmpne16	%f14,	%f24,	%l3
	smul	%o5,	%o3,	%i7
	addc	%l4,	0x15B8,	%g4
	fsrc1	%f28,	%f16
	movn	%xcc,	%i6,	%g1
	fpsub32s	%f19,	%f15,	%f15
	fxnors	%f14,	%f1,	%f3
	st	%f20,	[%l7 + 0x24]
	ldd	[%l7 + 0x30],	%f24
	sdivcc	%g7,	0x0408,	%l6
	xorcc	%g2,	%i2,	%g3
	ld	[%l7 + 0x5C],	%f26
	edge32l	%g6,	%l2,	%o1
	fmovdgu	%xcc,	%f10,	%f3
	umul	%l5,	0x1740,	%l1
	stx	%l0,	[%l7 + 0x28]
	movg	%xcc,	%i5,	%o4
	ldsw	[%l7 + 0x2C],	%o2
	fmovsne	%xcc,	%f9,	%f18
	edge8l	%i1,	%g5,	%o7
	nop
	set	0x1C, %o4
	lduw	[%l7 + %o4],	%o6
	edge16ln	%o0,	%i4,	%i0
	movleu	%icc,	%i3,	%o5
	popc	%l3,	%o3
	movrgz	%i7,	%g4,	%i6
	edge16	%l4,	%g7,	%g1
	edge32	%l6,	%i2,	%g3
	fmovdpos	%icc,	%f21,	%f4
	sll	%g6,	%l2,	%g2
	fmovsg	%icc,	%f19,	%f5
	add	%o1,	0x1E90,	%l1
	sethi	0x15AB,	%l0
	ldsb	[%l7 + 0x69],	%l5
	st	%f2,	[%l7 + 0x74]
	srax	%i5,	%o2,	%o4
	sra	%i1,	0x1F,	%o7
	xor	%g5,	0x0C15,	%o6
	xnorcc	%i4,	%i0,	%i3
	mova	%icc,	%o5,	%o0
	smul	%o3,	0x07FA,	%i7
	fmovrde	%g4,	%f4,	%f24
	fnor	%f30,	%f26,	%f24
	array16	%i6,	%l4,	%l3
	add	%g1,	%g7,	%l6
	sdivx	%g3,	0x1A4A,	%g6
	movge	%icc,	%i2,	%g2
	fmovde	%xcc,	%f27,	%f5
	popc	0x0830,	%o1
	array16	%l2,	%l1,	%l5
	srl	%l0,	0x1E,	%o2
	movre	%o4,	0x061,	%i1
	sth	%o7,	[%l7 + 0x5A]
	andcc	%g5,	%o6,	%i5
	movn	%xcc,	%i0,	%i3
	ldsw	[%l7 + 0x10],	%o5
	fandnot1s	%f26,	%f23,	%f5
	fmovscs	%xcc,	%f21,	%f10
	movvs	%xcc,	%i4,	%o0
	subccc	%i7,	%o3,	%g4
	edge16ln	%l4,	%i6,	%l3
	movle	%icc,	%g7,	%g1
	movcc	%icc,	%g3,	%g6
	addccc	%l6,	0x1C35,	%g2
	sir	0x124D
	and	%i2,	0x0711,	%o1
	fpadd32	%f10,	%f12,	%f12
	smulcc	%l1,	0x19B7,	%l5
	movrne	%l2,	0x2FC,	%o2
	movcc	%icc,	%l0,	%o4
	fones	%f16
	movvc	%xcc,	%o7,	%g5
	fmovspos	%icc,	%f25,	%f31
	movne	%xcc,	%o6,	%i5
	subcc	%i1,	0x0DA6,	%i3
	sra	%i0,	0x0C,	%i4
	smulcc	%o5,	%o0,	%i7
	fmovdcs	%icc,	%f8,	%f28
	movg	%icc,	%o3,	%g4
	edge16	%l4,	%i6,	%g7
	fmovsl	%icc,	%f6,	%f15
	edge8n	%g1,	%g3,	%l3
	umulcc	%l6,	0x1404,	%g6
	add	%g2,	%o1,	%l1
	fmul8x16au	%f3,	%f29,	%f30
	orn	%l5,	%l2,	%i2
	array16	%o2,	%l0,	%o7
	andncc	%o4,	%o6,	%g5
	fmovrslz	%i5,	%f20,	%f1
	ldsw	[%l7 + 0x50],	%i3
	fmovdneg	%xcc,	%f13,	%f24
	movcc	%xcc,	%i0,	%i4
	movvs	%icc,	%i1,	%o0
	lduh	[%l7 + 0x1C],	%i7
	ldd	[%l7 + 0x60],	%f12
	movne	%xcc,	%o3,	%g4
	movcc	%icc,	%l4,	%i6
	ldx	[%l7 + 0x08],	%o5
	edge16ln	%g7,	%g3,	%g1
	fmovsa	%icc,	%f6,	%f20
	std	%f26,	[%l7 + 0x58]
	udiv	%l6,	0x17E9,	%l3
	edge8l	%g2,	%o1,	%l1
	fpsub32s	%f30,	%f17,	%f12
	xnorcc	%l5,	%l2,	%i2
	pdist	%f12,	%f18,	%f20
	xnorcc	%o2,	%l0,	%g6
	movvs	%icc,	%o7,	%o6
	fmovsvc	%icc,	%f18,	%f31
	fpackfix	%f0,	%f11
	movle	%icc,	%o4,	%g5
	fmovrdlz	%i3,	%f12,	%f6
	fnegs	%f27,	%f21
	lduw	[%l7 + 0x08],	%i5
	edge32n	%i4,	%i0,	%i1
	fzero	%f8
	movneg	%icc,	%o0,	%i7
	fmovrsgez	%g4,	%f24,	%f3
	movrgz	%l4,	%o3,	%o5
	fnors	%f18,	%f24,	%f10
	edge32l	%i6,	%g3,	%g1
	fmovrdne	%l6,	%f30,	%f2
	movre	%g7,	%l3,	%o1
	orcc	%l1,	0x1D18,	%g2
	movn	%xcc,	%l2,	%i2
	orn	%l5,	%o2,	%g6
	array16	%o7,	%o6,	%o4
	ldsh	[%l7 + 0x3E],	%g5
	edge16n	%l0,	%i3,	%i5
	movcs	%xcc,	%i0,	%i4
	movvs	%icc,	%i1,	%o0
	umulcc	%i7,	%l4,	%g4
	fzero	%f4
	ldsw	[%l7 + 0x38],	%o3
	fmuld8sux16	%f25,	%f14,	%f2
	sth	%o5,	[%l7 + 0x18]
	smulcc	%i6,	0x039D,	%g1
	udiv	%g3,	0x0F40,	%l6
	st	%f22,	[%l7 + 0x3C]
	smulcc	%g7,	%o1,	%l1
	addc	%g2,	0x0826,	%l3
	move	%xcc,	%i2,	%l5
	ldsb	[%l7 + 0x27],	%l2
	fnegd	%f18,	%f22
	movge	%xcc,	%g6,	%o2
	mulscc	%o7,	%o6,	%g5
	xnor	%o4,	%i3,	%l0
	movle	%icc,	%i5,	%i4
	andncc	%i1,	%i0,	%o0
	movrlez	%i7,	%g4,	%l4
	edge32	%o3,	%o5,	%g1
	mulx	%i6,	0x16DA,	%g3
	nop
	set	0x70, %l2
	stw	%l6,	[%l7 + %l2]
	stb	%o1,	[%l7 + 0x63]
	ldsb	[%l7 + 0x09],	%l1
	xnorcc	%g7,	%g2,	%l3
	orn	%l5,	%i2,	%g6
	sth	%l2,	[%l7 + 0x56]
	edge32l	%o2,	%o6,	%g5
	movle	%icc,	%o7,	%i3
	andn	%o4,	%i5,	%i4
	subccc	%l0,	%i0,	%o0
	edge8n	%i1,	%g4,	%i7
	xnor	%o3,	%o5,	%l4
	umul	%g1,	0x0839,	%g3
	mulx	%i6,	0x042E,	%l6
	fxor	%f18,	%f0,	%f0
	fabss	%f26,	%f15
	movrlez	%l1,	0x2C3,	%g7
	srax	%g2,	0x14,	%l3
	movvc	%xcc,	%l5,	%o1
	fmovdne	%icc,	%f12,	%f4
	srlx	%i2,	%l2,	%o2
	fnands	%f18,	%f5,	%f20
	movge	%xcc,	%o6,	%g5
	xnorcc	%o7,	%g6,	%o4
	sll	%i3,	0x13,	%i4
	ldsw	[%l7 + 0x48],	%i5
	ldub	[%l7 + 0x49],	%i0
	fmovrdlz	%l0,	%f2,	%f26
	movrne	%o0,	%i1,	%i7
	orncc	%g4,	%o5,	%l4
	andncc	%o3,	%g3,	%i6
	xor	%g1,	0x0C07,	%l6
	edge16l	%l1,	%g2,	%l3
	edge8n	%l5,	%o1,	%i2
	movrgz	%g7,	0x010,	%o2
	lduh	[%l7 + 0x3C],	%o6
	fpadd32s	%f3,	%f16,	%f22
	andncc	%l2,	%o7,	%g6
	movvs	%icc,	%o4,	%g5
	fmovdcc	%xcc,	%f3,	%f26
	fcmpne16	%f20,	%f28,	%i3
	sethi	0x0B2A,	%i4
	alignaddr	%i0,	%i5,	%o0
	udivcc	%l0,	0x1046,	%i7
	sllx	%i1,	0x16,	%o5
	edge8	%g4,	%l4,	%g3
	alignaddrl	%o3,	%g1,	%i6
	edge16n	%l1,	%l6,	%g2
	srlx	%l5,	0x04,	%l3
	fmovsneg	%xcc,	%f3,	%f9
	fmovde	%xcc,	%f30,	%f6
	fmovsleu	%icc,	%f25,	%f20
	movle	%icc,	%i2,	%g7
	udivcc	%o1,	0x13E4,	%o6
	udiv	%o2,	0x1F49,	%l2
	fmovd	%f2,	%f10
	ldsb	[%l7 + 0x2C],	%g6
	mulx	%o4,	0x07AD,	%g5
	fcmple32	%f18,	%f16,	%o7
	sethi	0x016C,	%i3
	fmovda	%icc,	%f2,	%f7
	movcc	%xcc,	%i4,	%i5
	fpsub32s	%f1,	%f5,	%f14
	movneg	%icc,	%i0,	%o0
	add	%i7,	%i1,	%o5
	add	%g4,	0x1787,	%l0
	array16	%g3,	%o3,	%l4
	fpadd32s	%f18,	%f19,	%f14
	sdivx	%i6,	0x103F,	%g1
	fxnors	%f1,	%f19,	%f4
	edge16l	%l6,	%g2,	%l1
	array32	%l3,	%l5,	%g7
	fmovsneg	%icc,	%f29,	%f17
	movge	%xcc,	%o1,	%i2
	sub	%o2,	0x14A0,	%l2
	fpadd16s	%f11,	%f2,	%f8
	ldd	[%l7 + 0x58],	%g6
	sub	%o4,	0x06BF,	%o6
	movrlez	%o7,	0x27B,	%g5
	and	%i4,	%i3,	%i5
	edge32l	%o0,	%i7,	%i1
	fcmpgt32	%f28,	%f4,	%i0
	subcc	%g4,	0x1E17,	%l0
	sir	0x162D
	edge16n	%g3,	%o3,	%l4
	movpos	%xcc,	%i6,	%o5
	edge8ln	%l6,	%g2,	%l1
	alignaddr	%l3,	%l5,	%g7
	udivx	%g1,	0x16E6,	%o1
	fpsub32	%f10,	%f12,	%f10
	ldsh	[%l7 + 0x0C],	%i2
	fmovdne	%icc,	%f20,	%f13
	faligndata	%f20,	%f4,	%f2
	fmovs	%f28,	%f9
	fmovs	%f6,	%f30
	movrgez	%l2,	0x22F,	%o2
	fmovdvc	%xcc,	%f28,	%f11
	movleu	%icc,	%g6,	%o6
	add	%o7,	0x1861,	%g5
	movvc	%xcc,	%i4,	%i3
	andncc	%i5,	%o4,	%i7
	fmul8x16al	%f3,	%f12,	%f0
	movpos	%icc,	%o0,	%i0
	edge8	%g4,	%i1,	%l0
	fmovrdgz	%o3,	%f2,	%f4
	fmovrdlez	%l4,	%f8,	%f26
	addccc	%i6,	0x03F3,	%g3
	fmovrde	%o5,	%f22,	%f24
	fnot1s	%f26,	%f15
	edge32n	%g2,	%l6,	%l3
	fnot1	%f4,	%f16
	andcc	%l1,	0x0BFE,	%g7
	ldsh	[%l7 + 0x72],	%g1
	alignaddr	%l5,	%i2,	%o1
	movne	%icc,	%l2,	%g6
	fsrc1s	%f20,	%f26
	stx	%o6,	[%l7 + 0x10]
	stw	%o2,	[%l7 + 0x24]
	ldx	[%l7 + 0x58],	%g5
	lduh	[%l7 + 0x48],	%o7
	fmovdneg	%xcc,	%f31,	%f29
	addc	%i3,	0x1560,	%i4
	fmovsleu	%icc,	%f12,	%f15
	fcmpes	%fcc3,	%f4,	%f4
	movre	%i5,	0x3A3,	%i7
	fmul8ulx16	%f22,	%f0,	%f14
	array16	%o0,	%o4,	%i0
	fmovsle	%icc,	%f5,	%f19
	fsrc1s	%f12,	%f5
	fpack16	%f6,	%f10
	ldx	[%l7 + 0x40],	%i1
	sth	%l0,	[%l7 + 0x70]
	movre	%g4,	0x1B2,	%l4
	fmovsg	%icc,	%f4,	%f18
	movrgez	%i6,	0x213,	%g3
	xorcc	%o5,	%o3,	%g2
	udivcc	%l6,	0x105C,	%l1
	movcs	%xcc,	%l3,	%g1
	movg	%icc,	%l5,	%i2
	stb	%g7,	[%l7 + 0x54]
	srlx	%l2,	%g6,	%o1
	fmovsgu	%xcc,	%f3,	%f10
	movvs	%icc,	%o6,	%o2
	movpos	%icc,	%g5,	%i3
	subc	%o7,	%i4,	%i5
	fmovsleu	%xcc,	%f11,	%f20
	std	%f30,	[%l7 + 0x18]
	alignaddrl	%o0,	%i7,	%o4
	movl	%xcc,	%i0,	%i1
	lduw	[%l7 + 0x5C],	%l0
	ldub	[%l7 + 0x7A],	%g4
	srlx	%i6,	0x13,	%g3
	sll	%o5,	%l4,	%o3
	sdivcc	%g2,	0x1DBC,	%l1
	edge32	%l6,	%l3,	%g1
	restore %i2, 0x1526, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x54],	%l2
	edge32l	%g6,	%o1,	%o6
	fmovsvs	%icc,	%f14,	%f2
	alignaddrl	%g7,	%o2,	%i3
	sll	%g5,	%i4,	%i5
	addc	%o7,	0x193F,	%i7
	move	%icc,	%o0,	%o4
	addc	%i1,	%i0,	%g4
	fmovrdgez	%i6,	%f4,	%f8
	stx	%l0,	[%l7 + 0x70]
	lduh	[%l7 + 0x38],	%g3
	subcc	%o5,	%l4,	%o3
	movn	%icc,	%l1,	%g2
	ldx	[%l7 + 0x48],	%l6
	movleu	%xcc,	%g1,	%l3
	orn	%l5,	0x1F6D,	%i2
	edge8l	%g6,	%l2,	%o6
	movvc	%icc,	%o1,	%g7
	andn	%o2,	%i3,	%i4
	movgu	%icc,	%i5,	%o7
	ldub	[%l7 + 0x71],	%g5
	st	%f6,	[%l7 + 0x20]
	movgu	%xcc,	%i7,	%o4
	movrgz	%i1,	%o0,	%i0
	umul	%i6,	%g4,	%g3
	ld	[%l7 + 0x50],	%f6
	edge16n	%l0,	%o5,	%l4
	lduh	[%l7 + 0x7A],	%l1
	movvc	%xcc,	%g2,	%l6
	alignaddrl	%o3,	%g1,	%l3
	edge8ln	%i2,	%l5,	%g6
	fpsub32	%f28,	%f4,	%f16
	subc	%o6,	%o1,	%g7
	edge32l	%o2,	%l2,	%i3
	edge8l	%i4,	%i5,	%g5
	sub	%o7,	0x0ABB,	%o4
	movle	%xcc,	%i7,	%i1
	andncc	%o0,	%i6,	%i0
	fcmple32	%f10,	%f2,	%g3
	sdivcc	%g4,	0x079E,	%l0
	fxnor	%f4,	%f2,	%f6
	xnor	%o5,	0x18FE,	%l1
	subc	%l4,	%l6,	%o3
	sub	%g2,	%l3,	%g1
	nop
	set	0x1C, %i2
	lduh	[%l7 + %i2],	%i2
	fabss	%f6,	%f9
	sra	%g6,	0x07,	%l5
	movcs	%xcc,	%o1,	%o6
	nop
	set	0x50, %o1
	ldd	[%l7 + %o1],	%o2
	edge16	%l2,	%i3,	%g7
	fmovd	%f26,	%f20
	fxnors	%f8,	%f26,	%f0
	movcc	%xcc,	%i4,	%i5
	nop
	set	0x1C, %o5
	sth	%o7,	[%l7 + %o5]
	edge16n	%o4,	%g5,	%i1
	std	%f20,	[%l7 + 0x18]
	fmovdvs	%xcc,	%f17,	%f14
	nop
	set	0x54, %i5
	ldsw	[%l7 + %i5],	%i7
	fnot1s	%f14,	%f8
	lduw	[%l7 + 0x6C],	%i6
	xorcc	%i0,	%o0,	%g3
	sub	%l0,	0x0C77,	%g4
	edge16ln	%o5,	%l4,	%l1
	fpsub32s	%f29,	%f1,	%f10
	edge8	%o3,	%l6,	%g2
	udivcc	%l3,	0x1082,	%g1
	or	%g6,	%i2,	%l5
	move	%icc,	%o6,	%o2
	movne	%xcc,	%l2,	%i3
	mulscc	%g7,	0x1874,	%i4
	subcc	%o1,	%o7,	%i5
	xnor	%g5,	%i1,	%i7
	smulcc	%i6,	0x17ED,	%i0
	movrne	%o4,	%o0,	%g3
	mulx	%l0,	0x0630,	%o5
	st	%f15,	[%l7 + 0x64]
	subccc	%g4,	0x16ED,	%l4
	movrgez	%l1,	%o3,	%l6
	edge32n	%g2,	%l3,	%g6
	edge32n	%i2,	%l5,	%g1
	movne	%xcc,	%o6,	%l2
	xorcc	%o2,	0x05E3,	%i3
	addc	%g7,	%i4,	%o1
	movn	%xcc,	%o7,	%i5
	ldsh	[%l7 + 0x74],	%i1
	fmovsvs	%icc,	%f28,	%f3
	smulcc	%i7,	%i6,	%g5
	umul	%o4,	%o0,	%i0
	movrlez	%g3,	0x34C,	%o5
	srl	%g4,	%l0,	%l1
	lduw	[%l7 + 0x4C],	%o3
	sllx	%l4,	%g2,	%l3
	sethi	0x0F16,	%l6
	fcmpgt32	%f20,	%f28,	%i2
	orcc	%l5,	0x02F4,	%g1
	movrgz	%o6,	0x241,	%g6
	sdivx	%o2,	0x13BF,	%l2
	nop
	set	0x4E, %i6
	lduh	[%l7 + %i6],	%i3
	andn	%g7,	%i4,	%o1
	subc	%o7,	0x1769,	%i5
	srl	%i1,	0x1C,	%i6
	srlx	%g5,	%o4,	%i7
	fsrc1s	%f31,	%f31
	array8	%o0,	%i0,	%g3
	umulcc	%o5,	%g4,	%l0
	fmovrdlez	%l1,	%f24,	%f18
	movgu	%xcc,	%l4,	%g2
	sdivcc	%l3,	0x1A30,	%l6
	movcc	%xcc,	%o3,	%i2
	mulscc	%g1,	%o6,	%g6
	xnorcc	%l5,	%l2,	%i3
	edge16l	%g7,	%o2,	%o1
	edge8	%i4,	%o7,	%i1
	srax	%i6,	0x00,	%g5
	array8	%i5,	%o4,	%o0
	fcmpeq16	%f10,	%f12,	%i7
	srlx	%i0,	%o5,	%g4
	add	%g3,	0x1492,	%l0
	fmovrsgez	%l4,	%f14,	%f17
	movvc	%xcc,	%l1,	%l3
	movvc	%xcc,	%l6,	%g2
	fabsd	%f18,	%f0
	ldsb	[%l7 + 0x16],	%i2
	fmovdn	%xcc,	%f4,	%f2
	sdivx	%g1,	0x0CE6,	%o3
	edge32	%g6,	%l5,	%o6
	movcs	%xcc,	%l2,	%i3
	mulscc	%g7,	%o1,	%i4
	fmovdneg	%xcc,	%f27,	%f12
	fxor	%f2,	%f18,	%f20
	movle	%icc,	%o7,	%i1
	fmovsn	%xcc,	%f24,	%f27
	or	%i6,	%o2,	%i5
	ldsb	[%l7 + 0x19],	%o4
	fnegd	%f0,	%f28
	umul	%g5,	0x114B,	%i7
	sir	0x019D
	sra	%i0,	0x0C,	%o5
	movrlez	%g4,	0x033,	%o0
	movrgz	%l0,	0x0CC,	%g3
	popc	%l4,	%l1
	sethi	0x0FDD,	%l3
	xor	%l6,	%g2,	%g1
	movrne	%i2,	0x3BB,	%g6
	alignaddrl	%l5,	%o6,	%o3
	add	%l2,	0x0165,	%g7
	ldsh	[%l7 + 0x46],	%i3
	xor	%o1,	%o7,	%i4
	fpadd16	%f16,	%f16,	%f12
	srax	%i6,	0x18,	%i1
	subccc	%i5,	%o2,	%o4
	fandnot2s	%f4,	%f13,	%f9
	movne	%icc,	%g5,	%i0
	orcc	%i7,	%o5,	%g4
	fmovs	%f9,	%f26
	edge8n	%l0,	%o0,	%l4
	andn	%g3,	%l1,	%l6
	fmovdn	%xcc,	%f3,	%f21
	fnand	%f18,	%f28,	%f2
	stw	%g2,	[%l7 + 0x34]
	movne	%icc,	%g1,	%i2
	srax	%g6,	0x18,	%l3
	fmovsl	%icc,	%f12,	%f29
	movvs	%xcc,	%l5,	%o6
	fnand	%f14,	%f18,	%f6
	fzero	%f2
	faligndata	%f16,	%f30,	%f12
	mulx	%o3,	0x025E,	%g7
	edge32ln	%l2,	%i3,	%o7
	fmovdl	%xcc,	%f16,	%f22
	fnot1	%f0,	%f10
	stw	%i4,	[%l7 + 0x6C]
	and	%i6,	0x0C0A,	%o1
	fmovsg	%icc,	%f6,	%f15
	ld	[%l7 + 0x0C],	%f3
	sll	%i5,	0x18,	%i1
	sdiv	%o4,	0x084F,	%g5
	movle	%icc,	%i0,	%o2
	fpackfix	%f8,	%f29
	mova	%xcc,	%i7,	%g4
	ldd	[%l7 + 0x38],	%f30
	stx	%o5,	[%l7 + 0x68]
	stb	%l0,	[%l7 + 0x7C]
	fmovse	%xcc,	%f18,	%f31
	orn	%o0,	0x17C7,	%g3
	addc	%l1,	0x04E7,	%l4
	fones	%f21
	fmovsgu	%icc,	%f22,	%f28
	mova	%icc,	%g2,	%l6
	movvs	%icc,	%g1,	%i2
	fpsub16	%f0,	%f18,	%f8
	alignaddrl	%l3,	%l5,	%g6
	alignaddrl	%o3,	%o6,	%g7
	orn	%i3,	0x1DCB,	%l2
	fsrc2	%f24,	%f12
	ldd	[%l7 + 0x38],	%o6
	udiv	%i6,	0x1C32,	%o1
	fmovrslez	%i5,	%f10,	%f27
	ldx	[%l7 + 0x08],	%i1
	srl	%i4,	0x00,	%g5
	movg	%icc,	%o4,	%i0
	movvs	%icc,	%o2,	%g4
	fpmerge	%f22,	%f25,	%f28
	alignaddrl	%o5,	%l0,	%o0
	sethi	0x1B70,	%g3
	movgu	%icc,	%i7,	%l4
	movl	%xcc,	%l1,	%g2
	orncc	%l6,	%i2,	%l3
	ldsb	[%l7 + 0x31],	%g1
	movvs	%xcc,	%g6,	%o3
	movl	%icc,	%l5,	%o6
	udiv	%i3,	0x11E0,	%l2
	for	%f28,	%f28,	%f28
	movvs	%icc,	%o7,	%g7
	movrne	%i6,	%o1,	%i1
	fmul8x16au	%f6,	%f29,	%f14
	sllx	%i5,	%i4,	%o4
	smulcc	%g5,	%o2,	%g4
	umul	%i0,	%l0,	%o0
	movcs	%xcc,	%g3,	%o5
	sub	%i7,	0x0A54,	%l1
	edge8ln	%g2,	%l4,	%i2
	fcmpgt32	%f10,	%f6,	%l3
	fornot2s	%f27,	%f25,	%f13
	fcmpeq32	%f20,	%f12,	%l6
	and	%g6,	0x133F,	%o3
	mova	%xcc,	%l5,	%g1
	movcc	%xcc,	%o6,	%i3
	fpadd16s	%f10,	%f18,	%f1
	save %l2, 0x0052, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%o7,	%i6
	add	%o1,	0x0162,	%i5
	fxors	%f19,	%f14,	%f12
	orcc	%i4,	%i1,	%g5
	movleu	%xcc,	%o2,	%o4
	movcc	%icc,	%i0,	%g4
	fcmpgt32	%f24,	%f30,	%o0
	sdivcc	%l0,	0x14F9,	%o5
	sdiv	%g3,	0x151D,	%i7
	sir	0x0039
	movvs	%xcc,	%l1,	%g2
	fmovrde	%i2,	%f0,	%f24
	edge8l	%l4,	%l6,	%g6
	subcc	%l3,	%o3,	%g1
	subcc	%o6,	0x1F30,	%i3
	st	%f28,	[%l7 + 0x20]
	xnor	%l5,	%g7,	%l2
	movrlez	%i6,	0x3E5,	%o7
	array32	%i5,	%o1,	%i1
	movvs	%icc,	%g5,	%o2
	stb	%i4,	[%l7 + 0x6C]
	srl	%i0,	0x0E,	%o4
	stx	%o0,	[%l7 + 0x10]
	movn	%icc,	%l0,	%o5
	movleu	%xcc,	%g3,	%i7
	array16	%l1,	%g4,	%g2
	sub	%l4,	0x14BC,	%l6
	array8	%g6,	%l3,	%o3
	movrgez	%i2,	%o6,	%g1
	popc	%l5,	%g7
	fmovrsne	%l2,	%f25,	%f19
	movvs	%xcc,	%i6,	%o7
	movl	%icc,	%i5,	%i3
	udivx	%o1,	0x1655,	%g5
	array32	%i1,	%i4,	%i0
	fmovse	%icc,	%f12,	%f14
	movge	%icc,	%o4,	%o0
	move	%xcc,	%l0,	%o5
	edge8ln	%o2,	%i7,	%g3
	fnegd	%f10,	%f24
	and	%l1,	%g2,	%g4
	ldsb	[%l7 + 0x63],	%l4
	subcc	%g6,	%l6,	%l3
	edge8n	%i2,	%o3,	%o6
	fabsd	%f6,	%f4
	xorcc	%g1,	%g7,	%l5
	movleu	%xcc,	%i6,	%o7
	fmuld8ulx16	%f21,	%f20,	%f24
	umulcc	%l2,	%i3,	%i5
	fpack32	%f4,	%f18,	%f12
	edge16n	%o1,	%g5,	%i1
	ldd	[%l7 + 0x08],	%f28
	ldsw	[%l7 + 0x60],	%i0
	faligndata	%f12,	%f16,	%f18
	fpadd16s	%f18,	%f15,	%f7
	movrgez	%i4,	%o0,	%o4
	fpsub16s	%f0,	%f11,	%f29
	udiv	%o5,	0x06B8,	%o2
	movn	%xcc,	%i7,	%g3
	save %l1, %l0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g2,	0x12EE,	%g6
	movrlz	%l4,	%l3,	%i2
	fmovdl	%icc,	%f24,	%f20
	edge8	%l6,	%o3,	%o6
	subcc	%g7,	0x1337,	%g1
	lduh	[%l7 + 0x0C],	%l5
	and	%o7,	0x0AF0,	%l2
	xnorcc	%i3,	%i5,	%i6
	or	%o1,	0x18C4,	%i1
	mulx	%i0,	0x179B,	%i4
	smulcc	%o0,	%o4,	%g5
	mulscc	%o2,	%i7,	%o5
	lduw	[%l7 + 0x2C],	%l1
	sir	0x0675
	mova	%xcc,	%g3,	%g4
	orn	%l0,	0x0DA0,	%g2
	alignaddrl	%l4,	%l3,	%i2
	stb	%g6,	[%l7 + 0x7F]
	movg	%xcc,	%l6,	%o6
	srax	%g7,	%g1,	%o3
	udivx	%l5,	0x0EFE,	%l2
	sdiv	%i3,	0x19F8,	%i5
	andncc	%i6,	%o7,	%o1
	sll	%i0,	%i1,	%i4
	array32	%o4,	%g5,	%o0
	xnorcc	%i7,	0x06FC,	%o2
	lduh	[%l7 + 0x5E],	%l1
	addc	%g3,	%g4,	%l0
	bshuffle	%f0,	%f30,	%f16
	srlx	%o5,	0x13,	%g2
	sra	%l4,	%i2,	%g6
	move	%xcc,	%l3,	%o6
	srax	%l6,	%g7,	%g1
	fcmpes	%fcc0,	%f7,	%f7
	array16	%l5,	%l2,	%o3
	nop
	set	0x5C, %i4
	stw	%i5,	[%l7 + %i4]
	fmovdge	%icc,	%f5,	%f19
	sra	%i6,	0x1E,	%o7
	sdiv	%o1,	0x1C7E,	%i0
	movrlz	%i1,	0x102,	%i3
	edge16n	%i4,	%g5,	%o4
	nop
	set	0x5E, %g2
	sth	%o0,	[%l7 + %g2]
	srlx	%o2,	%l1,	%i7
	ldub	[%l7 + 0x7D],	%g3
	sra	%g4,	%l0,	%g2
	sethi	0x1CB6,	%l4
	stw	%i2,	[%l7 + 0x6C]
	xnorcc	%g6,	0x0FCB,	%l3
	edge8l	%o6,	%l6,	%o5
	popc	0x04E4,	%g7
	ldd	[%l7 + 0x48],	%f12
	movvc	%icc,	%g1,	%l2
	sth	%o3,	[%l7 + 0x24]
	ld	[%l7 + 0x44],	%f24
	fpadd32	%f12,	%f16,	%f20
	fmovsneg	%xcc,	%f1,	%f11
	orn	%i5,	%l5,	%o7
	subccc	%o1,	%i6,	%i1
	edge8n	%i0,	%i4,	%i3
	sdiv	%g5,	0x1BF6,	%o0
	fmovsgu	%xcc,	%f26,	%f10
	ld	[%l7 + 0x58],	%f6
	movg	%xcc,	%o4,	%o2
	fcmpgt32	%f18,	%f8,	%l1
	sllx	%g3,	%i7,	%g4
	subcc	%l0,	0x0786,	%g2
	udivcc	%l4,	0x090D,	%g6
	fzero	%f16
	orn	%i2,	%l3,	%o6
	lduh	[%l7 + 0x1A],	%o5
	udivx	%g7,	0x071B,	%l6
	subccc	%g1,	0x1DCC,	%l2
	sll	%i5,	0x1A,	%l5
	edge16l	%o7,	%o1,	%i6
	ldsw	[%l7 + 0x20],	%o3
	smulcc	%i0,	0x0055,	%i1
	edge16ln	%i3,	%g5,	%i4
	edge16l	%o0,	%o4,	%l1
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	lduh	[%l7 + 0x7E],	%l0
	array8	%g2,	%o2,	%l4
	subc	%g6,	0x1DE3,	%l3
	edge32ln	%o6,	%o5,	%g7
	fmovdneg	%icc,	%f23,	%f1
	edge8n	%l6,	%g1,	%i2
	srax	%l2,	%i5,	%o7
	udiv	%o1,	0x0E92,	%i6
	fpadd16	%f18,	%f14,	%f12
	movvc	%icc,	%l5,	%o3
	movleu	%xcc,	%i1,	%i0
	ldsh	[%l7 + 0x26],	%g5
	fcmpd	%fcc2,	%f12,	%f22
	movcs	%xcc,	%i3,	%i4
	movg	%icc,	%o4,	%l1
	movne	%xcc,	%o0,	%i7
	fmovdne	%xcc,	%f2,	%f6
	stw	%g3,	[%l7 + 0x30]
	fmovrsgez	%g4,	%f15,	%f13
	edge32l	%g2,	%o2,	%l4
	fmovrsgez	%l0,	%f17,	%f18
	sub	%g6,	%o6,	%o5
	orn	%g7,	%l3,	%g1
	fmovse	%xcc,	%f3,	%f15
	fnegd	%f14,	%f2
	xnor	%l6,	0x0EFE,	%l2
	sdivcc	%i2,	0x0DFE,	%i5
	fpadd16	%f18,	%f6,	%f4
	sir	0x1F40
	movpos	%icc,	%o7,	%i6
	ldsb	[%l7 + 0x0A],	%l5
	edge8n	%o3,	%o1,	%i1
	fmul8x16au	%f16,	%f20,	%f8
	edge8	%i0,	%g5,	%i4
	fornot1s	%f17,	%f3,	%f9
	movrgz	%i3,	0x3AD,	%l1
	st	%f6,	[%l7 + 0x78]
	fnot1s	%f27,	%f11
	movge	%xcc,	%o0,	%i7
	fpsub16s	%f13,	%f27,	%f2
	fzero	%f0
	edge8	%g3,	%g4,	%o4
	movrgez	%o2,	%l4,	%g2
	udiv	%g6,	0x1CA4,	%o6
	fornot1s	%f30,	%f6,	%f17
	umul	%o5,	%g7,	%l3
	movcc	%xcc,	%g1,	%l0
	fpadd16	%f20,	%f20,	%f4
	xor	%l6,	%l2,	%i5
	orcc	%i2,	0x0670,	%i6
	fmovsa	%icc,	%f24,	%f19
	movrlez	%o7,	%o3,	%l5
	edge32l	%o1,	%i1,	%g5
	stb	%i4,	[%l7 + 0x46]
	fandnot1s	%f5,	%f27,	%f7
	addcc	%i3,	0x19F6,	%i0
	sth	%o0,	[%l7 + 0x5E]
	orn	%l1,	%i7,	%g4
	edge16n	%o4,	%o2,	%l4
	udiv	%g2,	0x0478,	%g3
	udiv	%g6,	0x1A0F,	%o6
	mulx	%o5,	%l3,	%g7
	mulx	%g1,	0x02A0,	%l6
	fnors	%f16,	%f24,	%f1
	xnorcc	%l0,	0x11C4,	%l2
	movneg	%xcc,	%i2,	%i6
	fornot2s	%f20,	%f11,	%f12
	fmovd	%f14,	%f6
	srax	%o7,	%o3,	%l5
	fmovsl	%icc,	%f14,	%f22
	movrgz	%o1,	%i5,	%i1
	or	%g5,	%i4,	%i3
	edge32n	%i0,	%l1,	%i7
	subccc	%o0,	0x14C3,	%g4
	edge8l	%o2,	%l4,	%o4
	fxors	%f16,	%f14,	%f21
	lduw	[%l7 + 0x5C],	%g2
	fnot1s	%f5,	%f4
	movrlz	%g6,	%g3,	%o6
	movneg	%xcc,	%l3,	%o5
	orcc	%g7,	%g1,	%l0
	ldd	[%l7 + 0x48],	%f2
	restore %l2, %l6, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i2,	%o7
	movrne	%o3,	%o1,	%i5
	or	%l5,	0x05DD,	%i1
	ld	[%l7 + 0x74],	%f23
	fmovsg	%icc,	%f13,	%f30
	movrne	%i4,	%g5,	%i3
	fcmple32	%f2,	%f6,	%l1
	fpadd32s	%f17,	%f18,	%f3
	fpsub16	%f0,	%f12,	%f6
	edge16ln	%i0,	%o0,	%g4
	udivx	%i7,	0x1BCD,	%l4
	fmovsl	%icc,	%f22,	%f10
	fxor	%f24,	%f26,	%f14
	sllx	%o4,	0x1E,	%o2
	std	%f24,	[%l7 + 0x20]
	alignaddrl	%g6,	%g3,	%g2
	fmovsvs	%xcc,	%f23,	%f27
	umul	%o6,	%o5,	%l3
	fmovdleu	%icc,	%f1,	%f10
	fandnot1	%f22,	%f10,	%f20
	mova	%icc,	%g7,	%l0
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	movpos	%icc,	%i6,	%l6
	sdiv	%o7,	0x1C34,	%o3
	sdivx	%o1,	0x0E99,	%i5
	andcc	%l5,	0x0813,	%i2
	subc	%i4,	0x10F1,	%g5
	edge16n	%i1,	%i3,	%i0
	fornot1	%f0,	%f18,	%f26
	stx	%o0,	[%l7 + 0x40]
	fmovsleu	%icc,	%f11,	%f14
	fmul8x16au	%f9,	%f29,	%f14
	mulscc	%l1,	%i7,	%l4
	edge8	%o4,	%o2,	%g6
	sra	%g3,	0x1C,	%g4
	edge16	%o6,	%o5,	%g2
	sdivx	%g7,	0x0B15,	%l3
	ld	[%l7 + 0x1C],	%f9
	fmovsleu	%xcc,	%f23,	%f4
	edge16n	%l2,	%l0,	%i6
	movrgez	%g1,	0x247,	%l6
	movne	%icc,	%o7,	%o1
	fmovrsne	%o3,	%f7,	%f9
	fmovrslez	%i5,	%f6,	%f4
	movpos	%xcc,	%l5,	%i4
	ldsb	[%l7 + 0x22],	%i2
	ldd	[%l7 + 0x60],	%i0
	movvc	%xcc,	%g5,	%i0
	movvs	%xcc,	%o0,	%l1
	fmovsvs	%xcc,	%f13,	%f20
	orn	%i3,	%l4,	%i7
	stx	%o4,	[%l7 + 0x58]
	fornot1	%f28,	%f24,	%f22
	lduw	[%l7 + 0x44],	%g6
	sll	%g3,	%o2,	%g4
	movg	%icc,	%o5,	%g2
	alignaddrl	%g7,	%o6,	%l3
	srlx	%l0,	%l2,	%i6
	stb	%g1,	[%l7 + 0x63]
	movrgez	%l6,	%o1,	%o7
	fmovsa	%icc,	%f12,	%f5
	andcc	%o3,	0x1231,	%l5
	fmovse	%icc,	%f26,	%f16
	umulcc	%i5,	0x0FD5,	%i4
	movcc	%icc,	%i1,	%i2
	std	%f0,	[%l7 + 0x38]
	fmovrslez	%g5,	%f1,	%f17
	fmovsneg	%icc,	%f18,	%f24
	ld	[%l7 + 0x08],	%f29
	mova	%icc,	%o0,	%i0
	sll	%l1,	%l4,	%i3
	udiv	%i7,	0x120A,	%g6
	fmovsg	%xcc,	%f21,	%f5
	edge8	%o4,	%o2,	%g4
	orncc	%g3,	0x0F58,	%g2
	ldd	[%l7 + 0x10],	%f4
	sdiv	%o5,	0x1691,	%g7
	addcc	%o6,	0x0689,	%l0
	udivcc	%l2,	0x19B0,	%l3
	movrlz	%i6,	0x314,	%g1
	srax	%o1,	%o7,	%o3
	fmovsvc	%icc,	%f29,	%f23
	mulscc	%l6,	0x1A40,	%i5
	addccc	%i4,	0x0232,	%i1
	std	%f10,	[%l7 + 0x60]
	movg	%icc,	%i2,	%g5
	fpadd16s	%f14,	%f16,	%f25
	udiv	%o0,	0x1AB6,	%l5
	umulcc	%l1,	%l4,	%i3
	ld	[%l7 + 0x5C],	%f9
	fmovdvc	%xcc,	%f11,	%f16
	edge16	%i7,	%g6,	%o4
	fmovsg	%xcc,	%f10,	%f30
	movvs	%xcc,	%i0,	%g4
	movvc	%icc,	%o2,	%g3
	fornot2	%f30,	%f18,	%f24
	xor	%g2,	0x1B31,	%g7
	movcs	%xcc,	%o5,	%l0
	movle	%xcc,	%o6,	%l2
	fmul8x16	%f28,	%f30,	%f10
	sdiv	%l3,	0x00EC,	%g1
	st	%f2,	[%l7 + 0x14]
	movge	%xcc,	%o1,	%i6
	edge16n	%o7,	%o3,	%l6
	movvs	%xcc,	%i4,	%i5
	sll	%i2,	0x1B,	%i1
	sll	%g5,	%o0,	%l5
	ldsw	[%l7 + 0x74],	%l4
	array8	%i3,	%i7,	%g6
	fmovsgu	%icc,	%f3,	%f0
	fmovsle	%xcc,	%f14,	%f7
	movne	%icc,	%o4,	%l1
	umul	%i0,	0x18C7,	%g4
	movle	%xcc,	%o2,	%g2
	ldub	[%l7 + 0x65],	%g7
	fxnor	%f20,	%f8,	%f2
	movrgez	%o5,	0x3D5,	%g3
	fabsd	%f24,	%f30
	andncc	%l0,	%l2,	%l3
	udiv	%o6,	0x0AB6,	%g1
	addccc	%o1,	%o7,	%o3
	udivx	%l6,	0x0D7C,	%i6
	fandnot2	%f24,	%f6,	%f30
	std	%f12,	[%l7 + 0x58]
	mova	%icc,	%i5,	%i4
	movpos	%xcc,	%i1,	%i2
	fornot2s	%f4,	%f13,	%f17
	andn	%g5,	0x05B5,	%o0
	movne	%xcc,	%l5,	%l4
	sdivcc	%i3,	0x17E5,	%i7
	subc	%g6,	%l1,	%i0
	fpackfix	%f22,	%f8
	stx	%g4,	[%l7 + 0x18]
	save %o4, 0x07AC, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o2,	%o5,	%g3
	edge8	%l0,	%g7,	%l3
	srax	%l2,	0x0A,	%o6
	lduh	[%l7 + 0x44],	%o1
	lduw	[%l7 + 0x3C],	%o7
	movneg	%icc,	%g1,	%o3
	move	%icc,	%l6,	%i6
	edge16l	%i5,	%i1,	%i2
	movrne	%i4,	0x234,	%g5
	sllx	%o0,	%l5,	%l4
	move	%icc,	%i3,	%g6
	edge32	%l1,	%i7,	%g4
	stw	%o4,	[%l7 + 0x30]
	ldsh	[%l7 + 0x50],	%g2
	edge16n	%i0,	%o2,	%g3
	move	%xcc,	%o5,	%l0
	umul	%l3,	%l2,	%o6
	and	%o1,	0x071D,	%g7
	movrgez	%g1,	0x3B1,	%o7
	fabsd	%f4,	%f20
	fcmpeq16	%f6,	%f2,	%l6
	movle	%xcc,	%o3,	%i5
	edge32ln	%i6,	%i2,	%i4
	fmovsg	%xcc,	%f1,	%f7
	andn	%g5,	%i1,	%o0
	fmovdgu	%icc,	%f17,	%f9
	ld	[%l7 + 0x08],	%f31
	sub	%l4,	0x19AE,	%l5
	fornot2	%f4,	%f30,	%f20
	sdivcc	%i3,	0x0FD8,	%g6
	xorcc	%l1,	0x175F,	%i7
	umul	%g4,	0x187F,	%g2
	edge16ln	%o4,	%o2,	%g3
	fpsub16s	%f21,	%f12,	%f31
	xnorcc	%i0,	%o5,	%l0
	movle	%xcc,	%l3,	%o6
	fcmped	%fcc2,	%f4,	%f4
	stx	%l2,	[%l7 + 0x48]
	udivx	%g7,	0x1EA6,	%o1
	movrlz	%g1,	0x00A,	%l6
	edge16	%o3,	%i5,	%i6
	orn	%i2,	0x0AD8,	%o7
	movn	%icc,	%i4,	%i1
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%f10
	sethi	0x1076,	%g5
	sdiv	%o0,	0x0E2A,	%l4
	fors	%f19,	%f29,	%f17
	ldd	[%l7 + 0x18],	%i2
	movrgez	%g6,	%l5,	%i7
	xnor	%l1,	%g4,	%g2
	fzero	%f10
	movgu	%icc,	%o4,	%o2
	movpos	%icc,	%g3,	%i0
	sdivcc	%l0,	0x06A7,	%o5
	array8	%o6,	%l2,	%g7
	fmovdl	%icc,	%f24,	%f31
	movn	%xcc,	%l3,	%o1
	ldsh	[%l7 + 0x08],	%l6
	movl	%icc,	%o3,	%i5
	smulcc	%g1,	%i6,	%i2
	orn	%i4,	0x0165,	%o7
	edge8n	%g5,	%o0,	%l4
	smul	%i3,	%g6,	%i1
	movcs	%icc,	%l5,	%l1
	sub	%i7,	0x0324,	%g4
	popc	%o4,	%o2
	movn	%xcc,	%g2,	%i0
	array16	%l0,	%g3,	%o5
	mulx	%o6,	%l2,	%l3
	umulcc	%o1,	%l6,	%g7
	sth	%i5,	[%l7 + 0x0E]
	sdivx	%g1,	0x10C8,	%i6
	orcc	%o3,	%i2,	%o7
	smulcc	%g5,	%o0,	%l4
	udivcc	%i3,	0x169B,	%i4
	fpackfix	%f10,	%f14
	subcc	%g6,	0x0B53,	%i1
	edge32l	%l5,	%i7,	%g4
	udivx	%o4,	0x0B60,	%l1
	srax	%g2,	0x07,	%o2
	ldsw	[%l7 + 0x14],	%l0
	save %i0, %o5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l2,	%l3,	%o1
	movpos	%icc,	%g3,	%g7
	stx	%l6,	[%l7 + 0x30]
	xnor	%i5,	%i6,	%g1
	ldd	[%l7 + 0x60],	%f10
	edge32l	%i2,	%o7,	%g5
	fmovrsgez	%o3,	%f24,	%f17
	fnot1	%f18,	%f20
	smulcc	%l4,	0x1608,	%i3
	movre	%i4,	%g6,	%o0
	movrgez	%i1,	0x297,	%i7
	fmovrslez	%l5,	%f9,	%f17
	mulx	%g4,	%o4,	%l1
	edge8	%g2,	%o2,	%l0
	movgu	%xcc,	%o5,	%o6
	movrgz	%l2,	%l3,	%o1
	and	%i0,	0x1B70,	%g3
	stx	%g7,	[%l7 + 0x30]
	lduh	[%l7 + 0x36],	%l6
	orn	%i6,	0x08B2,	%i5
	stb	%g1,	[%l7 + 0x1A]
	edge8ln	%i2,	%o7,	%o3
	mulx	%l4,	0x0800,	%g5
	fxnor	%f8,	%f16,	%f2
	ldsb	[%l7 + 0x4A],	%i4
	movl	%xcc,	%g6,	%i3
	fcmpne16	%f26,	%f0,	%i1
	bshuffle	%f14,	%f24,	%f16
	sdivx	%i7,	0x0A61,	%l5
	ldub	[%l7 + 0x5A],	%g4
	or	%o0,	0x07F4,	%o4
	mulx	%l1,	%o2,	%g2
	edge16n	%l0,	%o5,	%o6
	mulscc	%l2,	%l3,	%o1
	fmul8x16au	%f18,	%f26,	%f16
	fmovdgu	%xcc,	%f14,	%f1
	movrne	%i0,	%g3,	%l6
	umul	%i6,	0x1786,	%g7
	srlx	%i5,	0x03,	%g1
	xnor	%o7,	0x1B5A,	%o3
	alignaddrl	%l4,	%g5,	%i4
	or	%g6,	0x1E79,	%i2
	udiv	%i1,	0x16A3,	%i7
	ldd	[%l7 + 0x18],	%f18
	addccc	%l5,	%g4,	%i3
	fpadd32s	%f28,	%f26,	%f5
	std	%f6,	[%l7 + 0x60]
	array16	%o0,	%o4,	%o2
	sdivcc	%l1,	0x1064,	%g2
	edge32l	%l0,	%o6,	%l2
	array16	%o5,	%o1,	%i0
	fpack16	%f14,	%f23
	fpadd32s	%f9,	%f25,	%f29
	stb	%l3,	[%l7 + 0x38]
	ldd	[%l7 + 0x18],	%g2
	edge8l	%l6,	%g7,	%i5
	movneg	%xcc,	%g1,	%o7
	ldsw	[%l7 + 0x24],	%i6
	srlx	%o3,	0x1C,	%g5
	subccc	%i4,	%l4,	%g6
	xor	%i1,	%i7,	%i2
	movge	%icc,	%g4,	%l5
	edge8ln	%o0,	%o4,	%o2
	edge8l	%i3,	%l1,	%l0
	fpack16	%f4,	%f0
	array8	%o6,	%g2,	%o5
	edge32l	%l2,	%o1,	%l3
	fnegs	%f0,	%f3
	movpos	%icc,	%i0,	%g3
	edge8	%l6,	%g7,	%i5
	udivcc	%o7,	0x1B8D,	%i6
	movvc	%xcc,	%o3,	%g5
	fmovsneg	%xcc,	%f13,	%f10
	ldsw	[%l7 + 0x7C],	%g1
	umul	%l4,	%i4,	%i1
	fmovsa	%xcc,	%f25,	%f30
	sdivcc	%g6,	0x0E8B,	%i2
	fors	%f8,	%f13,	%f27
	sdivcc	%i7,	0x01E7,	%l5
	edge16l	%o0,	%g4,	%o2
	subcc	%o4,	0x1D19,	%l1
	fmovspos	%xcc,	%f4,	%f26
	sdiv	%i3,	0x012F,	%l0
	edge8	%g2,	%o6,	%l2
	mulscc	%o1,	%o5,	%l3
	umul	%g3,	0x0B0D,	%l6
	sllx	%g7,	0x1E,	%i0
	xor	%i5,	%o7,	%i6
	fone	%f14
	smulcc	%g5,	%g1,	%l4
	movpos	%xcc,	%o3,	%i1
	array8	%i4,	%g6,	%i7
	movcc	%icc,	%l5,	%i2
	movrlz	%o0,	0x2AC,	%o2
	andn	%o4,	%g4,	%l1
	fpadd16	%f28,	%f18,	%f8
	popc	%l0,	%g2
	lduw	[%l7 + 0x0C],	%o6
	srlx	%i3,	%l2,	%o5
	movpos	%xcc,	%l3,	%o1
	andcc	%g3,	0x0FC6,	%g7
	restore %l6, 0x124D, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f30,	%f4
	move	%icc,	%i5,	%i6
	fmovsne	%xcc,	%f0,	%f3
	xor	%o7,	%g5,	%g1
	for	%f20,	%f24,	%f12
	alignaddr	%l4,	%i1,	%o3
	sllx	%i4,	0x06,	%i7
	movrne	%l5,	%i2,	%o0
	save %o2, %g6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%xcc,	%f5,	%f22
	movg	%xcc,	%l1,	%l0
	fpack16	%f4,	%f0
	sub	%g2,	%g4,	%o6
	fandnot1	%f20,	%f28,	%f0
	edge32	%l2,	%i3,	%l3
	lduw	[%l7 + 0x1C],	%o5
	array8	%o1,	%g7,	%g3
	fmovdl	%icc,	%f8,	%f21
	fmovdcs	%icc,	%f12,	%f18
	stx	%l6,	[%l7 + 0x10]
	edge8l	%i5,	%i0,	%i6
	movrlez	%g5,	0x393,	%o7
	mulscc	%g1,	%l4,	%i1
	edge32ln	%i4,	%o3,	%i7
	ldub	[%l7 + 0x64],	%i2
	faligndata	%f10,	%f2,	%f30
	xorcc	%l5,	%o2,	%g6
	movle	%icc,	%o0,	%l1
	movrgez	%o4,	0x180,	%g2
	fmovsneg	%xcc,	%f22,	%f18
	fabsd	%f12,	%f28
	ldsh	[%l7 + 0x10],	%g4
	movrlz	%o6,	0x369,	%l2
	sdivx	%l0,	0x19C2,	%i3
	fmovdleu	%icc,	%f17,	%f13
	movrlez	%l3,	%o5,	%g7
	st	%f9,	[%l7 + 0x5C]
	array8	%g3,	%l6,	%i5
	alignaddr	%i0,	%o1,	%g5
	subccc	%i6,	0x0B30,	%o7
	movrlz	%g1,	%i1,	%l4
	ldd	[%l7 + 0x30],	%i4
	movvs	%xcc,	%o3,	%i2
	fmul8x16	%f8,	%f16,	%f28
	addccc	%i7,	0x1ACB,	%l5
	edge32n	%g6,	%o2,	%o0
	fmovsge	%icc,	%f0,	%f4
	movvc	%icc,	%l1,	%g2
	fpsub32	%f16,	%f22,	%f16
	sir	0x1F8A
	udivx	%o4,	0x1797,	%g4
	sth	%o6,	[%l7 + 0x08]
	fpadd32	%f4,	%f28,	%f26
	fmovrsgez	%l0,	%f10,	%f19
	udiv	%l2,	0x1ECE,	%l3
	ldd	[%l7 + 0x70],	%f16
	edge16	%o5,	%i3,	%g7
	subc	%l6,	%g3,	%i5
	movrlz	%i0,	%o1,	%g5
	fpadd32	%f30,	%f4,	%f12
	srax	%o7,	%g1,	%i6
	fcmpgt32	%f30,	%f16,	%i1
	fcmple16	%f18,	%f24,	%l4
	fmovda	%xcc,	%f23,	%f11
	siam	0x5
	alignaddrl	%i4,	%o3,	%i7
	movne	%icc,	%i2,	%g6
	fmovrdgz	%o2,	%f28,	%f2
	edge8l	%o0,	%l1,	%l5
	smul	%o4,	%g2,	%o6
	smulcc	%g4,	0x11EA,	%l2
	xorcc	%l3,	0x0516,	%o5
	mova	%xcc,	%i3,	%l0
	fmuld8sux16	%f17,	%f11,	%f22
	addcc	%g7,	0x1840,	%g3
	fpmerge	%f10,	%f27,	%f4
	sllx	%i5,	0x08,	%l6
	fandnot2s	%f23,	%f31,	%f5
	addc	%o1,	0x1362,	%g5
	movrlz	%o7,	%i0,	%i6
	edge16n	%g1,	%i1,	%i4
	movvc	%xcc,	%l4,	%o3
	fnands	%f31,	%f10,	%f17
	movgu	%icc,	%i2,	%g6
	edge16	%o2,	%o0,	%i7
	movg	%icc,	%l1,	%l5
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	stb	%o6,	[%l7 + 0x6A]
	fmovdn	%xcc,	%f0,	%f26
	fzeros	%f21
	st	%f11,	[%l7 + 0x68]
	std	%f12,	[%l7 + 0x30]
	move	%xcc,	%g4,	%l3
	fmovspos	%icc,	%f20,	%f16
	srax	%o5,	%i3,	%l0
	edge16l	%g7,	%l2,	%g3
	nop
	set	0x20, %g5
	stb	%i5,	[%l7 + %g5]
	edge32n	%l6,	%g5,	%o7
	movcc	%icc,	%i0,	%o1
	pdist	%f20,	%f26,	%f8
	add	%i6,	0x1175,	%i1
	srl	%g1,	0x1B,	%l4
	ldd	[%l7 + 0x20],	%f26
	sth	%i4,	[%l7 + 0x30]
	addcc	%o3,	%g6,	%o2
	fmul8x16au	%f13,	%f31,	%f2
	edge16l	%o0,	%i7,	%i2
	movn	%xcc,	%l1,	%l5
	edge32ln	%g2,	%o6,	%o4
	sdivcc	%l3,	0x09B3,	%g4
	lduw	[%l7 + 0x08],	%i3
	stw	%l0,	[%l7 + 0x18]
	fmuld8sux16	%f23,	%f0,	%f18
	or	%o5,	0x1BD0,	%l2
	fornot2	%f28,	%f0,	%f2
	subc	%g3,	0x126F,	%g7
	or	%l6,	0x1E86,	%g5
	sdivcc	%i5,	0x07BC,	%o7
	srl	%o1,	0x18,	%i6
	movneg	%icc,	%i1,	%g1
	movle	%xcc,	%i0,	%l4
	movrne	%i4,	0x1FF,	%o3
	alignaddrl	%g6,	%o0,	%o2
	edge32	%i7,	%l1,	%l5
	stw	%g2,	[%l7 + 0x78]
	xnor	%i2,	0x053F,	%o4
	orncc	%l3,	0x1180,	%g4
	movle	%icc,	%o6,	%i3
	sdivx	%l0,	0x1C8B,	%l2
	fnot1	%f30,	%f6
	fnor	%f10,	%f2,	%f12
	movrgz	%o5,	%g7,	%g3
	fmovd	%f24,	%f2
	movrgez	%g5,	%l6,	%i5
	sethi	0x05D8,	%o1
	umul	%o7,	0x1F09,	%i1
	sth	%i6,	[%l7 + 0x16]
	fmovrdlez	%i0,	%f8,	%f8
	fmovrdne	%g1,	%f24,	%f8
	stb	%i4,	[%l7 + 0x45]
	fxor	%f20,	%f26,	%f20
	alignaddr	%o3,	%g6,	%l4
	popc	0x095A,	%o2
	addccc	%i7,	%l1,	%l5
	movrgez	%o0,	%g2,	%o4
	movrne	%i2,	0x321,	%g4
	lduh	[%l7 + 0x4C],	%l3
	fxnor	%f14,	%f28,	%f18
	nop
	set	0x35, %g3
	stb	%o6,	[%l7 + %g3]
	fpsub16s	%f10,	%f26,	%f13
	ldsh	[%l7 + 0x1E],	%l0
	move	%xcc,	%l2,	%o5
	udiv	%g7,	0x0469,	%i3
	sdiv	%g3,	0x0979,	%g5
	fand	%f16,	%f2,	%f26
	sdiv	%l6,	0x096F,	%o1
	fmovrdgz	%o7,	%f20,	%f10
	xnor	%i1,	0x0AD9,	%i5
	sub	%i0,	0x18D3,	%i6
	edge32n	%g1,	%i4,	%o3
	udiv	%l4,	0x1184,	%o2
	fmovsne	%xcc,	%f8,	%f20
	fmovdcc	%icc,	%f28,	%f4
	and	%g6,	%l1,	%l5
	sdivcc	%i7,	0x1EE8,	%g2
	movcc	%icc,	%o0,	%i2
	umul	%o4,	0x110A,	%g4
	stb	%l3,	[%l7 + 0x73]
	array8	%o6,	%l2,	%o5
	fmul8x16	%f12,	%f0,	%f10
	ldsw	[%l7 + 0x3C],	%g7
	fcmpd	%fcc0,	%f22,	%f10
	movn	%xcc,	%i3,	%l0
	addcc	%g5,	0x0470,	%g3
	fmovsa	%xcc,	%f4,	%f5
	andcc	%l6,	0x1C12,	%o7
	alignaddrl	%o1,	%i5,	%i1
	fzero	%f22
	stw	%i6,	[%l7 + 0x40]
	fcmpd	%fcc1,	%f24,	%f6
	fcmpd	%fcc0,	%f6,	%f26
	add	%i0,	%i4,	%g1
	movrgz	%l4,	0x2B7,	%o3
	subc	%o2,	%l1,	%g6
	sub	%l5,	%i7,	%g2
	sethi	0x0847,	%o0
	mulscc	%o4,	0x15E3,	%i2
	ldx	[%l7 + 0x48],	%l3
	sdivx	%o6,	0x0EF6,	%g4
	ldx	[%l7 + 0x40],	%o5
	movrgz	%g7,	0x233,	%l2
	movg	%xcc,	%i3,	%l0
	lduh	[%l7 + 0x22],	%g3
	fabsd	%f24,	%f14
	ld	[%l7 + 0x58],	%f2
	movcc	%icc,	%l6,	%o7
	movl	%icc,	%o1,	%i5
	edge16n	%i1,	%i6,	%g5
	xorcc	%i4,	%g1,	%l4
	udiv	%o3,	0x1AF1,	%o2
	stw	%l1,	[%l7 + 0x3C]
	ldub	[%l7 + 0x5C],	%g6
	or	%i0,	%i7,	%l5
	edge32	%o0,	%g2,	%o4
	st	%f5,	[%l7 + 0x10]
	std	%f2,	[%l7 + 0x18]
	edge16ln	%i2,	%o6,	%g4
	fabsd	%f14,	%f28
	fpadd32s	%f26,	%f13,	%f1
	sllx	%o5,	0x05,	%g7
	fornot1s	%f4,	%f1,	%f25
	udivx	%l3,	0x1101,	%l2
	siam	0x0
	sth	%i3,	[%l7 + 0x08]
	addc	%g3,	%l6,	%o7
	fandnot2s	%f7,	%f3,	%f27
	addcc	%l0,	%o1,	%i1
	lduw	[%l7 + 0x28],	%i6
	ldx	[%l7 + 0x68],	%i5
	orn	%i4,	%g1,	%g5
	edge8l	%o3,	%l4,	%o2
	subcc	%l1,	%i0,	%i7
	lduh	[%l7 + 0x6E],	%l5
	edge32	%o0,	%g6,	%g2
	movcc	%xcc,	%o4,	%o6
	edge16	%i2,	%o5,	%g7
	move	%xcc,	%g4,	%l3
	movl	%icc,	%i3,	%l2
	add	%g3,	%l6,	%o7
	ldd	[%l7 + 0x30],	%l0
	movvc	%icc,	%o1,	%i6
	edge8n	%i1,	%i5,	%i4
	edge16ln	%g5,	%g1,	%l4
	array16	%o2,	%l1,	%i0
	movne	%xcc,	%o3,	%i7
	edge8ln	%l5,	%g6,	%g2
	edge32n	%o0,	%o4,	%i2
	alignaddrl	%o5,	%g7,	%g4
	edge32l	%l3,	%o6,	%i3
	orn	%g3,	%l2,	%l6
	srlx	%l0,	0x06,	%o1
	fand	%f0,	%f4,	%f24
	udivx	%o7,	0x1907,	%i6
	movl	%icc,	%i5,	%i4
	ldx	[%l7 + 0x70],	%i1
	fsrc1	%f0,	%f0
	and	%g1,	%l4,	%o2
	fmovsle	%icc,	%f13,	%f18
	movgu	%xcc,	%l1,	%i0
	movrlez	%o3,	0x2F5,	%g5
	st	%f15,	[%l7 + 0x24]
	mulx	%i7,	%g6,	%g2
	movgu	%xcc,	%o0,	%o4
	edge32	%l5,	%o5,	%g7
	sllx	%g4,	%i2,	%o6
	restore %i3, 0x05C0, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f28,	%f8
	array16	%l3,	%l2,	%l6
	ldd	[%l7 + 0x10],	%o0
	smul	%l0,	0x02F2,	%i6
	xnorcc	%o7,	%i4,	%i1
	fmovdcc	%xcc,	%f13,	%f2
	movg	%xcc,	%g1,	%l4
	movvs	%icc,	%i5,	%l1
	edge8l	%o2,	%o3,	%g5
	edge8n	%i7,	%g6,	%i0
	sllx	%o0,	%o4,	%l5
	subcc	%g2,	0x1717,	%g7
	fornot2s	%f17,	%f12,	%f25
	nop
	set	0x08, %l0
	stx	%o5,	[%l7 + %l0]
	fornot2	%f26,	%f20,	%f16
	subc	%g4,	%o6,	%i3
	movrlez	%g3,	%l3,	%i2
	movl	%xcc,	%l2,	%l6
	fcmpes	%fcc2,	%f11,	%f26
	movcc	%xcc,	%l0,	%o1
	lduh	[%l7 + 0x62],	%o7
	fmovsneg	%xcc,	%f4,	%f10
	fmul8x16au	%f1,	%f13,	%f8
	movrne	%i6,	%i4,	%g1
	st	%f11,	[%l7 + 0x44]
	lduh	[%l7 + 0x18],	%l4
	orn	%i5,	%l1,	%i1
	movl	%icc,	%o3,	%o2
	sra	%i7,	%g5,	%i0
	edge8l	%g6,	%o4,	%l5
	array8	%g2,	%o0,	%g7
	fmovdleu	%xcc,	%f20,	%f0
	srl	%g4,	%o5,	%o6
	movrlez	%g3,	%i3,	%l3
	movrgz	%l2,	0x3E4,	%i2
	ldx	[%l7 + 0x10],	%l0
	fmul8sux16	%f16,	%f6,	%f28
	movleu	%xcc,	%l6,	%o7
	ldub	[%l7 + 0x4D],	%i6
	fmovrdne	%o1,	%f28,	%f20
	orn	%g1,	%l4,	%i4
	stb	%l1,	[%l7 + 0x5E]
	alignaddr	%i1,	%o3,	%o2
	stb	%i5,	[%l7 + 0x5E]
	ldsb	[%l7 + 0x17],	%i7
	andncc	%i0,	%g5,	%o4
	ldd	[%l7 + 0x68],	%g6
	lduw	[%l7 + 0x30],	%l5
	fpadd32s	%f18,	%f25,	%f10
	sth	%g2,	[%l7 + 0x58]
	stx	%g7,	[%l7 + 0x58]
	movne	%xcc,	%g4,	%o0
	movrne	%o6,	%g3,	%o5
	ldd	[%l7 + 0x60],	%l2
	movvc	%icc,	%i3,	%l2
	save %i2, 0x0FFA, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o7,	%l6,	%o1
	fmovrse	%g1,	%f7,	%f2
	fmovda	%xcc,	%f16,	%f3
	subcc	%i6,	0x036C,	%i4
	movge	%icc,	%l4,	%l1
	subccc	%o3,	%o2,	%i1
	fmuld8ulx16	%f20,	%f14,	%f24
	and	%i5,	0x0CC0,	%i0
	fmovdpos	%xcc,	%f24,	%f31
	std	%f20,	[%l7 + 0x10]
	sdivcc	%i7,	0x0623,	%o4
	orcc	%g6,	%g5,	%g2
	fmovdpos	%icc,	%f24,	%f4
	movl	%xcc,	%g7,	%l5
	subcc	%g4,	%o6,	%g3
	and	%o0,	%l3,	%o5
	and	%i3,	0x16D9,	%i2
	sdivcc	%l0,	0x01B8,	%l2
	edge16l	%l6,	%o1,	%g1
	andncc	%i6,	%i4,	%l4
	udiv	%l1,	0x122F,	%o3
	movgu	%icc,	%o2,	%o7
	fmul8x16au	%f30,	%f6,	%f28
	movleu	%xcc,	%i1,	%i5
	movn	%icc,	%i0,	%i7
	fands	%f30,	%f6,	%f0
	edge16l	%g6,	%o4,	%g2
	orn	%g5,	0x050B,	%g7
	umul	%g4,	0x06EF,	%l5
	nop
	set	0x0C, %l6
	stb	%g3,	[%l7 + %l6]
	smul	%o6,	%o0,	%l3
	xorcc	%o5,	0x15AF,	%i3
	movcc	%xcc,	%l0,	%i2
	sth	%l2,	[%l7 + 0x5E]
	alignaddr	%o1,	%l6,	%i6
	subcc	%g1,	%i4,	%l4
	andn	%o3,	0x0721,	%l1
	movrlez	%o2,	%i1,	%i5
	ldd	[%l7 + 0x50],	%f30
	array16	%i0,	%o7,	%g6
	save %o4, %g2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g7,	%g4,	%l5
	xor	%i7,	0x19DF,	%o6
	fnands	%f10,	%f7,	%f14
	movrne	%o0,	0x145,	%l3
	fcmpeq16	%f30,	%f10,	%o5
	movrne	%g3,	0x050,	%i3
	ldub	[%l7 + 0x2C],	%l0
	fmovdn	%xcc,	%f21,	%f29
	fornot1	%f30,	%f2,	%f16
	fsrc2	%f2,	%f20
	edge8ln	%i2,	%l2,	%o1
	fmovsvs	%xcc,	%f29,	%f2
	fmovsvc	%icc,	%f17,	%f5
	movn	%icc,	%i6,	%l6
	movrlez	%i4,	0x3F1,	%g1
	or	%l4,	%o3,	%l1
	mulx	%i1,	0x097E,	%i5
	sth	%o2,	[%l7 + 0x22]
	mulscc	%o7,	%g6,	%i0
	stw	%g2,	[%l7 + 0x50]
	movrlz	%o4,	0x2EC,	%g5
	stw	%g4,	[%l7 + 0x7C]
	fcmpeq16	%f22,	%f30,	%l5
	umulcc	%g7,	%o6,	%o0
	ldd	[%l7 + 0x18],	%f2
	st	%f16,	[%l7 + 0x20]
	bshuffle	%f20,	%f26,	%f4
	ldub	[%l7 + 0x32],	%l3
	edge8n	%i7,	%g3,	%i3
	fpack16	%f6,	%f29
	save %l0, %i2, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%o1,	%i6
	move	%xcc,	%l6,	%i4
	fandnot2	%f26,	%f30,	%f8
	alignaddrl	%g1,	%o5,	%l4
	sllx	%l1,	0x1B,	%o3
	movrlez	%i5,	0x2A1,	%o2
	ldsb	[%l7 + 0x6F],	%i1
	fmovsne	%icc,	%f6,	%f14
	movrgz	%o7,	%i0,	%g6
	fpadd16s	%f15,	%f31,	%f6
	mulx	%g2,	0x1706,	%o4
	ldsh	[%l7 + 0x46],	%g5
	movleu	%xcc,	%g4,	%l5
	fmovsneg	%icc,	%f0,	%f7
	fmovdge	%xcc,	%f3,	%f4
	std	%f6,	[%l7 + 0x30]
	array8	%g7,	%o6,	%l3
	fmovs	%f1,	%f23
	udivcc	%i7,	0x1625,	%g3
	sth	%i3,	[%l7 + 0x6C]
	orn	%o0,	0x0C45,	%i2
	fcmpgt16	%f20,	%f20,	%l2
	stx	%o1,	[%l7 + 0x28]
	movleu	%icc,	%l0,	%l6
	movvs	%icc,	%i4,	%i6
	fmovsle	%icc,	%f16,	%f20
	edge8l	%o5,	%g1,	%l4
	fmovrslez	%o3,	%f7,	%f18
	movg	%icc,	%l1,	%i5
	mova	%icc,	%o2,	%o7
	fmovsgu	%icc,	%f10,	%f15
	ldx	[%l7 + 0x38],	%i0
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	addc	%g5,	0x1B7D,	%g4
	nop
	set	0x6C, %i1
	ldsw	[%l7 + %i1],	%l5
	stb	%g7,	[%l7 + 0x72]
	fpadd16s	%f8,	%f24,	%f11
	fpadd32	%f20,	%f4,	%f18
	array32	%o6,	%l3,	%o4
	movl	%xcc,	%i7,	%i3
	fpsub32	%f4,	%f4,	%f4
	movn	%icc,	%g3,	%o0
	edge16l	%l2,	%i2,	%o1
	movne	%icc,	%l0,	%l6
	fmovsg	%icc,	%f11,	%f18
	fmovrslez	%i6,	%f12,	%f5
	edge32l	%i4,	%o5,	%l4
	ldd	[%l7 + 0x38],	%g0
	sir	0x045D
	sir	0x1F96
	fmovda	%icc,	%f10,	%f12
	xnor	%o3,	0x1DE1,	%l1
	orcc	%o2,	%o7,	%i0
	movneg	%xcc,	%g6,	%g2
	fcmpeq32	%f24,	%f12,	%i5
	subccc	%g5,	0x0F8B,	%i1
	mulscc	%g4,	0x171F,	%l5
	array16	%o6,	%l3,	%o4
	movn	%xcc,	%g7,	%i3
	sub	%g3,	%i7,	%o0
	stx	%l2,	[%l7 + 0x68]
	or	%o1,	0x077F,	%i2
	fmovse	%xcc,	%f4,	%f0
	edge16n	%l0,	%l6,	%i4
	lduw	[%l7 + 0x08],	%o5
	ldsb	[%l7 + 0x11],	%l4
	fcmple16	%f10,	%f8,	%i6
	andcc	%g1,	%o3,	%l1
	movge	%icc,	%o7,	%i0
	add	%g6,	%g2,	%i5
	sdivcc	%g5,	0x1363,	%i1
	movleu	%icc,	%g4,	%o2
	movneg	%xcc,	%l5,	%o6
	movpos	%icc,	%o4,	%g7
	lduh	[%l7 + 0x3C],	%l3
	addccc	%i3,	%g3,	%o0
	fpmerge	%f5,	%f20,	%f20
	fmul8sux16	%f22,	%f14,	%f24
	edge16n	%l2,	%i7,	%o1
	edge16	%l0,	%l6,	%i4
	movrne	%i2,	0x28B,	%l4
	add	%i6,	%o5,	%o3
	xnorcc	%l1,	%g1,	%i0
	fpadd16	%f8,	%f28,	%f4
	fabss	%f23,	%f16
	movcs	%xcc,	%g6,	%o7
	fnot2	%f2,	%f30
	fzeros	%f18
	fmovsn	%xcc,	%f9,	%f15
	movrlz	%g2,	%g5,	%i1
	sll	%g4,	%i5,	%o2
	edge16n	%l5,	%o6,	%o4
	smul	%g7,	0x145D,	%i3
	fands	%f23,	%f26,	%f20
	movrlz	%g3,	0x156,	%l3
	umul	%o0,	%i7,	%l2
	addccc	%o1,	0x071F,	%l6
	mova	%xcc,	%l0,	%i2
	subc	%i4,	0x0155,	%l4
	fors	%f16,	%f16,	%f20
	edge8l	%o5,	%i6,	%o3
	movpos	%icc,	%g1,	%l1
	and	%i0,	0x1F69,	%o7
	movvc	%icc,	%g6,	%g2
	fmovrslz	%g5,	%f7,	%f17
	sir	0x0F3A
	sethi	0x1D0D,	%i1
	ld	[%l7 + 0x14],	%f19
	smul	%g4,	%o2,	%i5
	movre	%l5,	%o6,	%g7
	edge8ln	%i3,	%g3,	%l3
	edge8n	%o4,	%o0,	%i7
	fzero	%f30
	ldub	[%l7 + 0x2B],	%o1
	edge16n	%l6,	%l0,	%l2
	st	%f24,	[%l7 + 0x0C]
	addcc	%i4,	%i2,	%o5
	xnorcc	%l4,	0x117F,	%i6
	movl	%xcc,	%o3,	%g1
	sra	%l1,	%i0,	%o7
	orn	%g6,	0x0B55,	%g5
	fcmple32	%f8,	%f28,	%g2
	ldsb	[%l7 + 0x5D],	%g4
	lduh	[%l7 + 0x7A],	%i1
	sra	%o2,	0x04,	%l5
	sub	%i5,	%g7,	%o6
	sth	%i3,	[%l7 + 0x64]
	restore %l3, %o4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%icc,	%f22,	%f27
	movpos	%xcc,	%i7,	%o0
	fmovdleu	%xcc,	%f21,	%f5
	sub	%l6,	%o1,	%l0
	movleu	%xcc,	%i4,	%l2
	edge8n	%o5,	%i2,	%i6
	ldd	[%l7 + 0x68],	%f14
	sethi	0x0A93,	%l4
	nop
	set	0x20, %i0
	std	%f16,	[%l7 + %i0]
	subccc	%g1,	0x07DE,	%l1
	edge8l	%o3,	%o7,	%i0
	fmovrdlz	%g5,	%f18,	%f8
	lduh	[%l7 + 0x52],	%g2
	edge32n	%g6,	%g4,	%o2
	smulcc	%i1,	%i5,	%g7
	movl	%xcc,	%o6,	%l5
	xorcc	%i3,	%l3,	%o4
	std	%f28,	[%l7 + 0x58]
	movrlez	%i7,	0x2E8,	%o0
	addccc	%g3,	%l6,	%o1
	array8	%i4,	%l2,	%o5
	fmul8x16au	%f2,	%f26,	%f8
	fmovrse	%l0,	%f20,	%f12
	move	%icc,	%i6,	%l4
	movcs	%xcc,	%g1,	%i2
	fnot2	%f26,	%f24
	addccc	%o3,	0x1469,	%o7
	sllx	%i0,	%g5,	%l1
	ldsh	[%l7 + 0x42],	%g6
	movrne	%g2,	%o2,	%i1
	movrgz	%g4,	%g7,	%o6
	fmovsa	%icc,	%f3,	%f28
	mova	%xcc,	%l5,	%i5
	edge16l	%l3,	%i3,	%o4
	fpadd32	%f22,	%f2,	%f12
	mulx	%i7,	%g3,	%l6
	alignaddrl	%o1,	%o0,	%l2
	movrgez	%i4,	%o5,	%i6
	lduh	[%l7 + 0x6C],	%l0
	srl	%l4,	0x19,	%g1
	or	%o3,	0x037E,	%i2
	fors	%f6,	%f9,	%f11
	orcc	%i0,	0x1B74,	%o7
	subccc	%l1,	%g6,	%g2
	sth	%o2,	[%l7 + 0x38]
	udivx	%g5,	0x1578,	%i1
	mova	%icc,	%g4,	%g7
	sethi	0x044A,	%o6
	array16	%i5,	%l3,	%i3
	array8	%o4,	%i7,	%l5
	fors	%f4,	%f14,	%f16
	fmovrslz	%l6,	%f30,	%f12
	orcc	%g3,	%o0,	%o1
	fmovdgu	%icc,	%f12,	%f20
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%i4
	sdiv	%l2,	0x1DF6,	%o5
	andn	%i6,	0x1478,	%l4
	edge32l	%l0,	%o3,	%g1
	sllx	%i2,	%o7,	%l1
	fmovse	%xcc,	%f1,	%f14
	fnot1s	%f5,	%f12
	add	%i0,	%g2,	%g6
	ldsh	[%l7 + 0x1A],	%g5
	movrgz	%i1,	0x286,	%o2
	alignaddrl	%g7,	%o6,	%g4
	sir	0x01D5
	fone	%f6
	ld	[%l7 + 0x68],	%f6
	addcc	%i5,	%i3,	%o4
	stw	%l3,	[%l7 + 0x74]
	andn	%l5,	%l6,	%g3
	fmovsneg	%xcc,	%f11,	%f10
	fmovdgu	%xcc,	%f19,	%f23
	subc	%i7,	0x0454,	%o1
	fmovscs	%xcc,	%f21,	%f25
	alignaddr	%i4,	%l2,	%o5
	srl	%o0,	0x07,	%l4
	movrlz	%i6,	0x13A,	%o3
	umul	%l0,	0x1643,	%i2
	xorcc	%o7,	%g1,	%i0
	edge16n	%g2,	%g6,	%g5
	nop
	set	0x47, %o7
	stb	%i1,	[%l7 + %o7]
	movrgz	%l1,	%o2,	%g7
	fmovrdlz	%g4,	%f18,	%f30
	fornot2s	%f31,	%f29,	%f14
	orncc	%i5,	0x190D,	%i3
	andn	%o4,	%o6,	%l5
	ld	[%l7 + 0x4C],	%f12
	orn	%l6,	0x1875,	%g3
	addcc	%l3,	%i7,	%o1
	sllx	%i4,	%l2,	%o0
	orncc	%l4,	0x0220,	%o5
	sllx	%i6,	%o3,	%l0
	smulcc	%i2,	0x1690,	%o7
	srlx	%i0,	0x13,	%g2
	lduw	[%l7 + 0x70],	%g1
	or	%g6,	%g5,	%i1
	sub	%l1,	0x1588,	%g7
	srax	%g4,	%i5,	%o2
	srax	%o4,	%i3,	%l5
	udiv	%l6,	0x052B,	%o6
	mulscc	%g3,	0x1CF4,	%i7
	st	%f12,	[%l7 + 0x6C]
	movn	%xcc,	%l3,	%i4
	popc	%o1,	%l2
	edge16n	%o0,	%l4,	%i6
	ldd	[%l7 + 0x38],	%o2
	sll	%o5,	0x19,	%l0
	fcmpne16	%f8,	%f8,	%o7
	fnot2s	%f18,	%f10
	udivcc	%i2,	0x1BC6,	%i0
	move	%xcc,	%g1,	%g6
	subc	%g2,	0x1A67,	%i1
	edge16n	%l1,	%g5,	%g4
	udivx	%g7,	0x1849,	%o2
	orncc	%o4,	%i3,	%i5
	fmovrse	%l6,	%f23,	%f13
	sra	%l5,	%o6,	%g3
	stx	%i7,	[%l7 + 0x48]
	subcc	%l3,	%i4,	%o1
	addc	%l2,	0x072E,	%l4
	mulx	%i6,	0x01F5,	%o3
	fornot1s	%f14,	%f20,	%f19
	edge16ln	%o0,	%l0,	%o5
	orncc	%i2,	%o7,	%i0
	std	%f16,	[%l7 + 0x28]
	sth	%g6,	[%l7 + 0x22]
	mova	%icc,	%g1,	%i1
	fmovdvs	%xcc,	%f9,	%f2
	movpos	%icc,	%l1,	%g5
	lduh	[%l7 + 0x5C],	%g4
	sth	%g2,	[%l7 + 0x68]
	addccc	%g7,	0x0929,	%o4
	movpos	%icc,	%o2,	%i3
	ldsh	[%l7 + 0x20],	%i5
	fnegs	%f25,	%f24
	ldub	[%l7 + 0x71],	%l6
	mulscc	%l5,	0x1040,	%o6
	sra	%i7,	%g3,	%i4
	movrlez	%o1,	0x07C,	%l2
	ldx	[%l7 + 0x50],	%l4
	mulx	%i6,	0x0C7E,	%o3
	umul	%o0,	%l0,	%o5
	movl	%icc,	%l3,	%i2
	lduw	[%l7 + 0x0C],	%o7
	sir	0x029C
	udivx	%g6,	0x1AD7,	%i0
	fxor	%f18,	%f26,	%f4
	umul	%g1,	%i1,	%l1
	subccc	%g5,	%g4,	%g7
	fcmpeq16	%f22,	%f10,	%o4
	xnor	%o2,	%g2,	%i5
	ldsw	[%l7 + 0x58],	%l6
	ldsw	[%l7 + 0x3C],	%i3
	fors	%f23,	%f5,	%f1
	movvs	%xcc,	%l5,	%i7
	mulscc	%o6,	0x1ED9,	%g3
	udiv	%o1,	0x03B2,	%l2
	fmovsn	%icc,	%f1,	%f3
	udivx	%l4,	0x0E65,	%i4
	sethi	0x06FB,	%i6
	popc	%o3,	%l0
	orn	%o0,	%l3,	%i2
	fpadd16s	%f27,	%f25,	%f17
	ldd	[%l7 + 0x60],	%o4
	mulx	%g6,	0x04EF,	%o7
	fmul8sux16	%f22,	%f22,	%f22
	array8	%i0,	%i1,	%g1
	ldx	[%l7 + 0x68],	%l1
	andncc	%g4,	%g5,	%o4
	movrlez	%g7,	%g2,	%o2
	mova	%icc,	%i5,	%i3
	orcc	%l5,	0x1757,	%i7
	fmovsa	%icc,	%f26,	%f9
	movn	%icc,	%o6,	%g3
	ldub	[%l7 + 0x14],	%o1
	xnor	%l2,	%l4,	%i4
	xnorcc	%l6,	0x01AA,	%i6
	fpsub32	%f22,	%f8,	%f24
	add	%o3,	%l0,	%o0
	sra	%l3,	0x07,	%o5
	addc	%i2,	0x14FA,	%o7
	udiv	%i0,	0x033D,	%g6
	fmovsgu	%xcc,	%f31,	%f24
	fmovdne	%xcc,	%f13,	%f12
	xorcc	%g1,	%l1,	%g4
	fnors	%f21,	%f15,	%f16
	std	%f8,	[%l7 + 0x10]
	xnor	%g5,	0x09D9,	%o4
	movgu	%xcc,	%g7,	%g2
	movne	%xcc,	%o2,	%i1
	srl	%i3,	%i5,	%i7
	fornot1s	%f11,	%f21,	%f7
	subc	%l5,	%o6,	%g3
	and	%o1,	%l2,	%l4
	fpack32	%f12,	%f26,	%f6
	movne	%icc,	%l6,	%i6
	srl	%o3,	0x0E,	%l0
	movl	%icc,	%i4,	%o0
	fors	%f29,	%f16,	%f14
	edge32ln	%l3,	%i2,	%o5
	subcc	%o7,	0x0E89,	%g6
	andncc	%g1,	%l1,	%i0
	srax	%g5,	0x19,	%g4
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	ld	[%l7 + 0x4C],	%f11
	stb	%i1,	[%l7 + 0x4F]
	andn	%i3,	%i5,	%i7
	pdist	%f20,	%f10,	%f20
	movvs	%icc,	%o2,	%o6
	ldd	[%l7 + 0x70],	%f0
	udivx	%l5,	0x0EF7,	%g3
	mova	%xcc,	%o1,	%l4
	pdist	%f22,	%f22,	%f28
	ldd	[%l7 + 0x68],	%i6
	save %i6, %l2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f24,	%f2,	%f26
	add	%l0,	%o0,	%l3
	edge32l	%i2,	%i4,	%o5
	stw	%o7,	[%l7 + 0x40]
	fmovda	%xcc,	%f13,	%f23
	edge16l	%g1,	%l1,	%g6
	movrgez	%g5,	0x2B0,	%g4
	fpsub32s	%f16,	%f26,	%f18
	lduw	[%l7 + 0x78],	%o4
	movcc	%icc,	%g7,	%g2
	ld	[%l7 + 0x1C],	%f16
	edge16	%i1,	%i3,	%i0
	movpos	%icc,	%i7,	%i5
	stx	%o6,	[%l7 + 0x30]
	edge32	%l5,	%g3,	%o1
	xorcc	%l4,	%l6,	%o2
	subccc	%i6,	%l2,	%l0
	movleu	%icc,	%o3,	%o0
	sth	%i2,	[%l7 + 0x3A]
	siam	0x1
	ldd	[%l7 + 0x78],	%i4
	movl	%icc,	%l3,	%o5
	nop
	set	0x30, %g6
	ldsh	[%l7 + %g6],	%g1
	udivcc	%l1,	0x1A30,	%g6
	lduh	[%l7 + 0x34],	%o7
	add	%g5,	%o4,	%g7
	addcc	%g2,	%i1,	%i3
	stx	%g4,	[%l7 + 0x48]
	sth	%i7,	[%l7 + 0x08]
	umul	%i0,	%i5,	%l5
	sll	%g3,	0x1C,	%o1
	ld	[%l7 + 0x28],	%f17
	ldx	[%l7 + 0x20],	%l4
	udiv	%o6,	0x12A5,	%o2
	subcc	%l6,	%l2,	%l0
	ldub	[%l7 + 0x73],	%o3
	xor	%i6,	0x1F94,	%o0
	fpmerge	%f8,	%f15,	%f12
	alignaddr	%i4,	%l3,	%o5
	movle	%xcc,	%i2,	%g1
	andn	%l1,	%o7,	%g6
	fexpand	%f24,	%f18
	movpos	%icc,	%o4,	%g7
	fmovsa	%xcc,	%f11,	%f23
	edge16n	%g5,	%g2,	%i1
	fpadd32	%f8,	%f30,	%f26
	popc	0x1DCA,	%g4
	fmovrdgez	%i3,	%f12,	%f28
	edge16	%i0,	%i5,	%l5
	orcc	%i7,	0x02EB,	%g3
	xnor	%l4,	0x1A79,	%o6
	fmovdgu	%icc,	%f16,	%f17
	sllx	%o2,	%o1,	%l2
	orncc	%l0,	0x1E9B,	%o3
	smulcc	%i6,	0x03DC,	%o0
	sdivx	%l6,	0x15D0,	%l3
	movneg	%xcc,	%i4,	%o5
	fpsub32s	%f13,	%f15,	%f30
	andn	%g1,	0x11B9,	%i2
	restore %o7, %g6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g7,	%g5,	%g2
	udivx	%i1,	0x1C34,	%l1
	fnors	%f0,	%f14,	%f7
	array8	%i3,	%i0,	%i5
	movrlz	%l5,	0x297,	%i7
	movcc	%xcc,	%g3,	%g4
	fmovdgu	%xcc,	%f30,	%f0
	smul	%l4,	%o6,	%o2
	fpack16	%f22,	%f18
	fcmpgt32	%f26,	%f8,	%l2
	subccc	%o1,	%o3,	%i6
	st	%f11,	[%l7 + 0x74]
	sub	%o0,	0x045B,	%l6
	fcmpgt16	%f6,	%f14,	%l0
	movpos	%icc,	%l3,	%o5
	movle	%xcc,	%i4,	%i2
	edge32	%g1,	%o7,	%o4
	save %g7, 0x1379, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%g2,	%g5
	movvc	%icc,	%l1,	%i1
	fmovda	%xcc,	%f6,	%f9
	movre	%i0,	%i5,	%l5
	addccc	%i3,	0x0165,	%g3
	ldsb	[%l7 + 0x3E],	%g4
	edge16l	%i7,	%l4,	%o6
	orcc	%l2,	%o2,	%o1
	edge16l	%i6,	%o3,	%o0
	array32	%l6,	%l0,	%o5
	edge8n	%l3,	%i4,	%g1
	movre	%i2,	0x29D,	%o4
	orn	%o7,	%g7,	%g2
	array8	%g6,	%l1,	%g5
	popc	0x133E,	%i0
	smul	%i1,	0x0AB1,	%l5
	fabss	%f9,	%f7
	fmovscc	%icc,	%f18,	%f16
	fmovscs	%xcc,	%f21,	%f25
	edge8n	%i3,	%i5,	%g4
	movn	%icc,	%i7,	%g3
	fzeros	%f7
	sdivx	%l4,	0x0A35,	%o6
	sir	0x1F17
	ld	[%l7 + 0x0C],	%f29
	sdiv	%l2,	0x14E9,	%o1
	movle	%xcc,	%i6,	%o2
	fmovsgu	%icc,	%f23,	%f22
	array8	%o3,	%o0,	%l6
	ldd	[%l7 + 0x10],	%l0
	fmovsl	%icc,	%f2,	%f5
	movrne	%o5,	%l3,	%g1
	fpadd32	%f10,	%f12,	%f16
	movrgz	%i4,	0x02F,	%o4
	xnor	%i2,	%g7,	%g2
	popc	%g6,	%o7
	movl	%xcc,	%g5,	%l1
	udivcc	%i0,	0x1657,	%i1
	subc	%l5,	0x0854,	%i5
	sll	%i3,	0x04,	%i7
	alignaddrl	%g3,	%g4,	%l4
	or	%o6,	%o1,	%l2
	st	%f18,	[%l7 + 0x54]
	movleu	%icc,	%o2,	%o3
	fzeros	%f24
	st	%f12,	[%l7 + 0x30]
	st	%f25,	[%l7 + 0x10]
	fabss	%f31,	%f18
	ldsw	[%l7 + 0x5C],	%i6
	subc	%l6,	%l0,	%o5
	fmovdpos	%icc,	%f25,	%f27
	movrgez	%l3,	%g1,	%i4
	edge16	%o4,	%o0,	%i2
	sth	%g7,	[%l7 + 0x1C]
	umulcc	%g2,	%g6,	%g5
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%l0
	umulcc	%o7,	%i0,	%i1
	edge32ln	%i5,	%l5,	%i7
	ldsh	[%l7 + 0x0E],	%i3
	move	%xcc,	%g4,	%g3
	movgu	%xcc,	%l4,	%o6
	movpos	%xcc,	%o1,	%l2
	fpadd16	%f0,	%f6,	%f22
	movle	%xcc,	%o3,	%i6
	ld	[%l7 + 0x64],	%f11
	addccc	%l6,	0x1757,	%l0
	fzeros	%f23
	std	%f24,	[%l7 + 0x30]
	fmovdvc	%xcc,	%f28,	%f8
	fabsd	%f16,	%f2
	edge16ln	%o5,	%l3,	%g1
	movle	%xcc,	%o2,	%i4
	fmuld8sux16	%f31,	%f3,	%f4
	fmovrslez	%o0,	%f3,	%f5
	movrlez	%i2,	0x130,	%g7
	fmovdg	%icc,	%f16,	%f27
	movpos	%xcc,	%o4,	%g6
	sllx	%g2,	0x01,	%l1
	fzero	%f4
	fmovsa	%xcc,	%f15,	%f5
	movcc	%icc,	%g5,	%i0
	sdiv	%i1,	0x045E,	%o7
	ldub	[%l7 + 0x25],	%i5
	sdiv	%l5,	0x111E,	%i3
	fnot2s	%f20,	%f19
	movrgz	%i7,	0x34F,	%g4
	sdiv	%l4,	0x1E75,	%g3
	fmovrslz	%o6,	%f28,	%f17
	edge8ln	%l2,	%o3,	%i6
	edge8ln	%l6,	%o1,	%l0
	ldsb	[%l7 + 0x2E],	%o5
	movleu	%xcc,	%g1,	%o2
	addccc	%l3,	0x08DA,	%i4
	fcmple32	%f14,	%f18,	%i2
	andn	%o0,	0x01EA,	%g7
	edge16n	%o4,	%g6,	%g2
	fpadd16s	%f23,	%f12,	%f9
	xorcc	%g5,	%i0,	%i1
	orcc	%o7,	0x0B6A,	%l1
	sra	%l5,	%i3,	%i5
	subccc	%g4,	%l4,	%g3
	andcc	%o6,	0x0984,	%i7
	xorcc	%o3,	%i6,	%l2
	movl	%xcc,	%o1,	%l0
	sll	%o5,	%l6,	%g1
	fpadd16s	%f1,	%f0,	%f12
	xor	%o2,	0x1216,	%l3
	alignaddrl	%i2,	%i4,	%g7
	fones	%f2
	edge16ln	%o4,	%g6,	%o0
	for	%f16,	%f12,	%f4
	smulcc	%g5,	0x1A01,	%g2
	movleu	%icc,	%i1,	%i0
	xnor	%o7,	%l1,	%l5
	smulcc	%i5,	%i3,	%g4
	movvs	%xcc,	%l4,	%g3
	xnorcc	%o6,	%o3,	%i7
	ldsh	[%l7 + 0x3C],	%l2
	fmuld8sux16	%f20,	%f30,	%f18
	sllx	%o1,	%l0,	%o5
	fmuld8sux16	%f16,	%f31,	%f30
	fcmpeq32	%f0,	%f30,	%i6
	udivx	%l6,	0x05EF,	%o2
	movge	%icc,	%g1,	%i2
	edge16	%l3,	%g7,	%i4
	movgu	%icc,	%o4,	%o0
	alignaddr	%g6,	%g5,	%i1
	edge16l	%i0,	%o7,	%l1
	fmovsne	%xcc,	%f5,	%f29
	movneg	%xcc,	%l5,	%i5
	array8	%i3,	%g4,	%g2
	stw	%g3,	[%l7 + 0x18]
	lduh	[%l7 + 0x60],	%o6
	edge8ln	%l4,	%o3,	%i7
	movrgez	%o1,	0x395,	%l2
	srlx	%o5,	0x1C,	%i6
	xor	%l0,	%o2,	%l6
	umul	%i2,	0x052C,	%g1
	movgu	%xcc,	%g7,	%l3
	edge8ln	%o4,	%o0,	%g6
	fmovdge	%xcc,	%f15,	%f30
	movrne	%i4,	0x3FE,	%i1
	xorcc	%i0,	0x0D1E,	%g5
	move	%xcc,	%l1,	%l5
	sra	%o7,	0x03,	%i3
	movcs	%icc,	%i5,	%g2
	sethi	0x0A18,	%g4
	sllx	%o6,	%g3,	%l4
	fandnot2s	%f20,	%f6,	%f27
	save %o3, 0x0436, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o1,	%o5,	%l2
	ldsh	[%l7 + 0x0E],	%l0
	lduw	[%l7 + 0x2C],	%i6
	movgu	%xcc,	%l6,	%i2
	sethi	0x0F58,	%o2
	fxor	%f28,	%f10,	%f26
	edge16	%g7,	%g1,	%o4
	fmovrslez	%l3,	%f16,	%f26
	fmovsvc	%xcc,	%f2,	%f0
	popc	0x0762,	%o0
	addcc	%g6,	%i4,	%i1
	array16	%i0,	%g5,	%l1
	st	%f6,	[%l7 + 0x08]
	edge8	%l5,	%o7,	%i5
	or	%i3,	0x12AC,	%g2
	movre	%o6,	%g4,	%l4
	fmovrsgz	%o3,	%f25,	%f0
	xorcc	%i7,	%o1,	%o5
	fcmpgt16	%f10,	%f28,	%l2
	movrlez	%g3,	0x281,	%l0
	fmovrdgz	%i6,	%f24,	%f8
	faligndata	%f0,	%f8,	%f6
	st	%f25,	[%l7 + 0x74]
	add	%l6,	0x08F9,	%o2
	sth	%g7,	[%l7 + 0x6A]
	udivx	%g1,	0x02D9,	%i2
	edge8n	%o4,	%l3,	%o0
	movrgez	%g6,	%i4,	%i1
	mulscc	%i0,	%l1,	%l5
	ldsb	[%l7 + 0x73],	%o7
	movneg	%xcc,	%g5,	%i5
	fpsub32s	%f16,	%f14,	%f29
	fcmpgt32	%f16,	%f22,	%g2
	fmovrdgez	%o6,	%f22,	%f0
	ldd	[%l7 + 0x48],	%g4
	edge8l	%i3,	%l4,	%i7
	movrlz	%o1,	0x29D,	%o3
	ldx	[%l7 + 0x60],	%l2
	fcmpd	%fcc1,	%f22,	%f16
	fmovrdgz	%g3,	%f24,	%f30
	xor	%l0,	%i6,	%l6
	xnorcc	%o2,	%o5,	%g1
	fmovspos	%xcc,	%f27,	%f29
	alignaddrl	%i2,	%o4,	%g7
	subcc	%l3,	%o0,	%i4
	lduh	[%l7 + 0x36],	%g6
	stw	%i0,	[%l7 + 0x3C]
	movgu	%icc,	%l1,	%l5
	sethi	0x1C73,	%o7
	udivx	%g5,	0x15A2,	%i1
	fmul8x16au	%f25,	%f29,	%f22
	edge32	%g2,	%o6,	%i5
	fmovd	%f8,	%f4
	andn	%i3,	0x033E,	%l4
	ldsh	[%l7 + 0x5C],	%g4
	mova	%xcc,	%o1,	%i7
	fpsub16s	%f28,	%f16,	%f28
	umul	%o3,	%l2,	%g3
	umul	%i6,	%l6,	%o2
	xorcc	%o5,	%g1,	%l0
	movvc	%icc,	%i2,	%o4
	xnorcc	%g7,	%o0,	%i4
	smul	%l3,	%i0,	%l1
	movrlez	%l5,	0x171,	%o7
	orcc	%g5,	%g6,	%g2
	sdiv	%o6,	0x1695,	%i1
	mulx	%i3,	0x001F,	%i5
	sir	0x133F
	edge32	%g4,	%o1,	%l4
	nop
	set	0x48, %i3
	stx	%o3,	[%l7 + %i3]
	movle	%icc,	%l2,	%i7
	fandnot1	%f8,	%f0,	%f6
	edge32n	%g3,	%l6,	%i6
	fcmple32	%f16,	%f16,	%o5
	movvs	%icc,	%o2,	%l0
	andn	%g1,	0x06BB,	%o4
	xorcc	%g7,	0x1E50,	%o0
	sth	%i4,	[%l7 + 0x3E]
	fmovdvc	%xcc,	%f19,	%f6
	fmovde	%icc,	%f18,	%f11
	ldub	[%l7 + 0x2C],	%i2
	sllx	%i0,	%l3,	%l1
	andncc	%l5,	%g5,	%o7
	or	%g2,	0x1B16,	%g6
	stb	%i1,	[%l7 + 0x48]
	xorcc	%o6,	%i5,	%g4
	mulx	%o1,	%i3,	%l4
	alignaddrl	%o3,	%i7,	%l2
	popc	0x13A3,	%l6
	edge32l	%g3,	%i6,	%o5
	edge16	%o2,	%g1,	%l0
	and	%o4,	%g7,	%i4
	sll	%i2,	%i0,	%o0
	sub	%l1,	0x1088,	%l5
	udivx	%g5,	0x167B,	%o7
	srlx	%g2,	0x1A,	%l3
	sir	0x1C01
	movle	%icc,	%i1,	%o6
	fmovde	%xcc,	%f11,	%f6
	array8	%g6,	%g4,	%o1
	array8	%i5,	%l4,	%i3
	movvc	%xcc,	%o3,	%l2
	movcc	%icc,	%i7,	%l6
	subc	%g3,	0x1829,	%o5
	fmovrsgez	%o2,	%f6,	%f17
	subcc	%i6,	%g1,	%o4
	movre	%g7,	0x273,	%i4
	srax	%l0,	0x0A,	%i2
	ldd	[%l7 + 0x40],	%f18
	umul	%o0,	0x0D42,	%i0
	lduh	[%l7 + 0x7A],	%l1
	and	%l5,	%g5,	%g2
	xnorcc	%l3,	0x1DF6,	%o7
	movrgz	%o6,	%g6,	%g4
	movvs	%icc,	%i1,	%i5
	or	%o1,	0x0706,	%i3
	stx	%l4,	[%l7 + 0x78]
	movpos	%xcc,	%l2,	%i7
	edge8ln	%o3,	%l6,	%o5
	edge32ln	%o2,	%g3,	%i6
	fcmpgt32	%f16,	%f26,	%o4
	movvs	%icc,	%g7,	%i4
	andncc	%g1,	%l0,	%o0
	xorcc	%i2,	0x1717,	%l1
	ldsw	[%l7 + 0x2C],	%i0
	subcc	%g5,	%g2,	%l3
	save %o7, %o6, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f20
	sth	%l5,	[%l7 + 0x4E]
	sra	%i1,	0x1E,	%i5
	fornot1	%f6,	%f2,	%f26
	ldsb	[%l7 + 0x65],	%o1
	fmovde	%icc,	%f21,	%f2
	fmovdvc	%xcc,	%f10,	%f27
	fpadd32	%f22,	%f12,	%f2
	andn	%i3,	%l4,	%g4
	fcmple16	%f22,	%f4,	%i7
	fandnot2	%f30,	%f8,	%f22
	fmovsne	%icc,	%f18,	%f1
	sir	0x10FA
	movrgez	%o3,	0x16A,	%l2
	array32	%l6,	%o2,	%o5
	movge	%icc,	%g3,	%i6
	std	%f2,	[%l7 + 0x50]
	sdivx	%g7,	0x1476,	%o4
	edge32l	%g1,	%i4,	%l0
	fmovsvs	%xcc,	%f31,	%f0
	movcc	%icc,	%i2,	%o0
	fzeros	%f17
	umul	%l1,	0x004B,	%g5
	fmovsne	%xcc,	%f20,	%f8
	srl	%i0,	0x0C,	%l3
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	udivcc	%l5,	0x0A9E,	%i1
	fcmpgt16	%f8,	%f4,	%i5
	ldsb	[%l7 + 0x3A],	%o6
	edge32l	%i3,	%l4,	%o1
	andcc	%g4,	%o3,	%i7
	andn	%l6,	0x0242,	%l2
	lduw	[%l7 + 0x44],	%o5
	mova	%icc,	%g3,	%o2
	fmul8sux16	%f18,	%f2,	%f24
	ld	[%l7 + 0x20],	%f1
	sth	%i6,	[%l7 + 0x3C]
	fmul8sux16	%f16,	%f4,	%f4
	movle	%icc,	%g7,	%o4
	fmovdpos	%icc,	%f2,	%f13
	subcc	%g1,	0x14BF,	%i4
	fmovspos	%xcc,	%f30,	%f24
	fmovdleu	%xcc,	%f3,	%f11
	umulcc	%i2,	%o0,	%l1
	for	%f6,	%f22,	%f10
	fmovsgu	%icc,	%f2,	%f1
	sllx	%g5,	%l0,	%i0
	for	%f0,	%f6,	%f24
	save %l3, 0x0135, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g2,	%g6,	%i1
	smul	%l5,	%i5,	%o6
	movne	%icc,	%l4,	%o1
	edge8l	%g4,	%i3,	%o3
	udivcc	%i7,	0x1C78,	%l6
	andncc	%o5,	%g3,	%l2
	fmovd	%f24,	%f16
	subc	%i6,	0x174F,	%o2
	and	%o4,	%g7,	%i4
	sub	%i2,	%g1,	%o0
	ldd	[%l7 + 0x28],	%f6
	fmovdg	%xcc,	%f27,	%f20
	array8	%l1,	%l0,	%g5
	fone	%f14
	st	%f28,	[%l7 + 0x14]
	array8	%l3,	%o7,	%g2
	udivcc	%i0,	0x0F09,	%i1
	fmovrslz	%l5,	%f7,	%f4
	fmovrdgz	%i5,	%f8,	%f20
	edge8ln	%o6,	%l4,	%o1
	fmovscs	%xcc,	%f14,	%f5
	popc	%g4,	%g6
	udiv	%o3,	0x18DF,	%i7
	srax	%l6,	%o5,	%g3
	sub	%l2,	%i6,	%i3
	movle	%icc,	%o2,	%g7
	edge16	%o4,	%i4,	%i2
	restore %o0, 0x0863, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l0,	%g5,	%l3
	umul	%g1,	%g2,	%o7
	movl	%xcc,	%i1,	%l5
	fcmpd	%fcc0,	%f12,	%f4
	sra	%i5,	0x1D,	%i0
	st	%f1,	[%l7 + 0x38]
	st	%f22,	[%l7 + 0x64]
	mulscc	%l4,	%o6,	%g4
	lduw	[%l7 + 0x74],	%o1
	xorcc	%o3,	0x0595,	%i7
	edge16n	%g6,	%o5,	%g3
	fnot1s	%f15,	%f27
	fmovrdlez	%l2,	%f14,	%f20
	array8	%l6,	%i3,	%o2
	fmovrslez	%i6,	%f28,	%f27
	srax	%g7,	0x00,	%i4
	alignaddrl	%i2,	%o0,	%l1
	fcmpne32	%f6,	%f8,	%l0
	ld	[%l7 + 0x68],	%f29
	xnorcc	%g5,	%o4,	%g1
	st	%f6,	[%l7 + 0x58]
	stw	%l3,	[%l7 + 0x08]
	addcc	%g2,	0x002E,	%i1
	fmovda	%icc,	%f6,	%f8
	subccc	%o7,	0x1B18,	%l5
	movrne	%i5,	%l4,	%o6
	fzeros	%f6
	movne	%xcc,	%i0,	%g4
	fmovrse	%o3,	%f13,	%f0
	save %i7, 0x1162, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g6,	0x04C1,	%o5
	edge32l	%g3,	%l6,	%l2
	movgu	%icc,	%o2,	%i3
	fsrc1s	%f21,	%f17
	movrgez	%g7,	%i4,	%i6
	orn	%i2,	0x0393,	%l1
	edge16n	%o0,	%g5,	%o4
	orncc	%l0,	0x151F,	%l3
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	edge8ln	%i1,	%l5,	%l4
	and	%i5,	0x0514,	%o6
	srlx	%g4,	%i0,	%i7
	fcmpne16	%f22,	%f14,	%o3
	movn	%icc,	%o1,	%o5
	andncc	%g6,	%g3,	%l2
	sll	%o2,	%l6,	%g7
	fpadd16	%f8,	%f4,	%f28
	edge32l	%i3,	%i6,	%i4
	lduw	[%l7 + 0x3C],	%i2
	ldub	[%l7 + 0x1C],	%l1
	fmovdvs	%xcc,	%f6,	%f29
	srax	%g5,	%o4,	%l0
	edge32	%o0,	%l3,	%g2
	smulcc	%o7,	%i1,	%l5
	movrlez	%g1,	0x305,	%i5
	ldsh	[%l7 + 0x62],	%l4
	sll	%o6,	%i0,	%i7
	movrgez	%g4,	0x186,	%o3
	fmovde	%icc,	%f22,	%f8
	array32	%o1,	%o5,	%g3
	movg	%xcc,	%g6,	%l2
	restore %l6, %o2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %i6, %g7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l1,	%g5,	%i2
	sra	%o4,	%o0,	%l3
	andcc	%l0,	%o7,	%g2
	srax	%i1,	%l5,	%g1
	andcc	%l4,	0x0205,	%o6
	ld	[%l7 + 0x64],	%f1
	fpadd16s	%f24,	%f5,	%f6
	movcc	%icc,	%i0,	%i5
	fpack32	%f14,	%f0,	%f12
	movg	%icc,	%i7,	%g4
	movrgez	%o3,	%o1,	%o5
	movgu	%xcc,	%g6,	%g3
	subc	%l2,	0x0580,	%o2
	subc	%l6,	%i3,	%i6
	edge8ln	%i4,	%g7,	%g5
	fmovsg	%icc,	%f14,	%f14
	movrlz	%l1,	%i2,	%o4
	edge8l	%l3,	%o0,	%o7
	andn	%l0,	%i1,	%l5
	fornot2	%f22,	%f22,	%f30
	array32	%g2,	%g1,	%l4
	smul	%o6,	0x00CC,	%i0
	srax	%i5,	%i7,	%o3
	fmovrse	%g4,	%f15,	%f23
	fnot1s	%f19,	%f29
	save %o5, %o1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l2,	%g6,	%l6
	st	%f31,	[%l7 + 0x74]
	umul	%i3,	0x1E75,	%o2
	stw	%i6,	[%l7 + 0x08]
	popc	0x0DF6,	%g7
	movge	%icc,	%g5,	%l1
	fornot2s	%f23,	%f19,	%f21
	movrlez	%i2,	%o4,	%i4
	fmovdn	%xcc,	%f16,	%f5
	fmovscc	%xcc,	%f10,	%f27
	edge8	%l3,	%o0,	%l0
	std	%f26,	[%l7 + 0x08]
	edge16ln	%o7,	%i1,	%g2
	movvs	%icc,	%l5,	%l4
	add	%g1,	0x0DF4,	%i0
	udiv	%o6,	0x1439,	%i7
	movrgez	%o3,	0x2D5,	%g4
	addcc	%o5,	%i5,	%o1
	sdiv	%g3,	0x0F9D,	%g6
	movre	%l6,	0x007,	%l2
	ldsh	[%l7 + 0x18],	%i3
	fcmpd	%fcc2,	%f28,	%f18
	fmovdg	%xcc,	%f30,	%f14
	movrlz	%o2,	%g7,	%i6
	andn	%l1,	%i2,	%g5
	alignaddr	%o4,	%l3,	%i4
	sdivcc	%l0,	0x0306,	%o7
	fsrc2	%f20,	%f22
	fmovd	%f12,	%f6
	array16	%o0,	%i1,	%g2
	fsrc2	%f6,	%f24
	srlx	%l5,	0x01,	%g1
	movvs	%xcc,	%i0,	%l4
	ldsw	[%l7 + 0x10],	%i7
	movle	%icc,	%o3,	%o6
	ld	[%l7 + 0x50],	%f29
	sdiv	%g4,	0x1323,	%i5
	addccc	%o5,	0x0865,	%o1
	subccc	%g3,	%l6,	%l2
	movge	%xcc,	%g6,	%o2
	fxnor	%f30,	%f14,	%f14
	sub	%g7,	0x0242,	%i3
	xnor	%i6,	%i2,	%g5
	edge32n	%l1,	%o4,	%l3
	sll	%l0,	0x01,	%i4
	srl	%o0,	0x0B,	%i1
	xorcc	%o7,	%l5,	%g1
	fone	%f24
	lduh	[%l7 + 0x7E],	%i0
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	ld	[%l7 + 0x58],	%f8
	movg	%icc,	%i7,	%o3
	fmovsa	%xcc,	%f29,	%f4
	fmovscc	%xcc,	%f16,	%f30
	smul	%g4,	0x0971,	%o6
	movcc	%icc,	%o5,	%i5
	mova	%xcc,	%o1,	%l6
	edge16l	%l2,	%g6,	%o2
	ldd	[%l7 + 0x70],	%f4
	fmovrdne	%g3,	%f22,	%f18
	fandnot1	%f20,	%f22,	%f0
	fpsub16s	%f19,	%f24,	%f20
	edge8n	%i3,	%i6,	%g7
	edge8ln	%g5,	%l1,	%i2
	fmovsg	%icc,	%f24,	%f0
	ldd	[%l7 + 0x50],	%f2
	srl	%o4,	0x1E,	%l3
	fmovdl	%xcc,	%f3,	%f28
	orn	%i4,	0x1A9E,	%o0
	fmovse	%xcc,	%f3,	%f1
	edge32ln	%i1,	%l0,	%o7
	smulcc	%l5,	%g1,	%l4
	smulcc	%i0,	%i7,	%o3
	edge8ln	%g2,	%o6,	%o5
	orncc	%g4,	0x1D7C,	%i5
	movg	%icc,	%l6,	%l2
	save %o1, %g6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i3,	0x0B,	%i6
	sll	%g7,	%g5,	%o2
	movleu	%icc,	%i2,	%o4
	orn	%l1,	%l3,	%i4
	alignaddr	%i1,	%l0,	%o0
	mova	%icc,	%o7,	%l5
	edge8n	%l4,	%g1,	%i7
	sdivcc	%i0,	0x1BDB,	%g2
	fpadd32s	%f2,	%f11,	%f10
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%o2
	mulscc	%o5,	%o6,	%i5
	fnegd	%f6,	%f4
	fmovs	%f14,	%f19
	st	%f0,	[%l7 + 0x38]
	fcmpeq16	%f6,	%f28,	%g4
	edge32ln	%l6,	%o1,	%g6
	andncc	%g3,	%l2,	%i6
	fmovrdlez	%i3,	%f12,	%f2
	sdiv	%g7,	0x15B6,	%o2
	stx	%g5,	[%l7 + 0x50]
	sir	0x1584
	orn	%i2,	0x1EA6,	%o4
	movrgez	%l3,	0x30B,	%l1
	srl	%i4,	%l0,	%i1
	ldsw	[%l7 + 0x24],	%o7
	movneg	%icc,	%l5,	%l4
	movrne	%g1,	%o0,	%i7
	movcs	%icc,	%g2,	%o3
	xor	%i0,	0x1AA9,	%o6
	movvc	%icc,	%o5,	%g4
	fmul8sux16	%f12,	%f20,	%f12
	fcmpgt16	%f22,	%f14,	%i5
	movle	%xcc,	%o1,	%g6
	std	%f0,	[%l7 + 0x28]
	subc	%l6,	0x1A9F,	%l2
	addcc	%g3,	%i6,	%g7
	fmovsge	%icc,	%f8,	%f10
	ldd	[%l7 + 0x70],	%f18
	fcmpgt32	%f12,	%f14,	%i3
	umulcc	%g5,	%i2,	%o2
	sra	%o4,	%l1,	%l3
	addc	%l0,	%i1,	%o7
	fmovdleu	%icc,	%f18,	%f15
	add	%i4,	%l5,	%g1
	ldd	[%l7 + 0x20],	%f4
	edge16l	%o0,	%i7,	%l4
	stw	%o3,	[%l7 + 0x64]
	subc	%i0,	%g2,	%o6
	movneg	%icc,	%o5,	%i5
	xnorcc	%o1,	0x00F6,	%g4
	sir	0x0230
	fmovdvs	%xcc,	%f3,	%f6
	subccc	%g6,	%l6,	%l2
	sir	0x141C
	movpos	%icc,	%i6,	%g7
	srax	%i3,	%g3,	%i2
	srl	%o2,	0x02,	%o4
	orn	%g5,	0x03F8,	%l1
	sdiv	%l3,	0x0EAB,	%l0
	xor	%o7,	%i4,	%l5
	alignaddr	%i1,	%o0,	%i7
	fcmple32	%f30,	%f8,	%g1
	array32	%o3,	%l4,	%g2
	edge16l	%o6,	%i0,	%i5
	sllx	%o5,	0x19,	%o1
	edge32n	%g4,	%l6,	%g6
	fnot2s	%f5,	%f18
	udiv	%l2,	0x064E,	%i6
	movn	%icc,	%g7,	%i3
	sth	%i2,	[%l7 + 0x48]
	fmovdg	%xcc,	%f26,	%f12
	array16	%o2,	%o4,	%g3
	edge32	%g5,	%l1,	%l3
	movcc	%icc,	%l0,	%o7
	nop
	set	0x68, %o6
	lduh	[%l7 + %o6],	%l5
	xnorcc	%i1,	0x02B9,	%o0
	sdivcc	%i7,	0x0A59,	%g1
	andn	%i4,	%l4,	%g2
	movge	%icc,	%o3,	%o6
	fmovrdgz	%i5,	%f6,	%f6
	edge32	%o5,	%o1,	%g4
	udivx	%l6,	0x0E95,	%i0
	ldsh	[%l7 + 0x54],	%g6
	srlx	%i6,	0x02,	%l2
	alignaddrl	%i3,	%g7,	%o2
	fpsub32	%f22,	%f16,	%f4
	srlx	%o4,	%g3,	%g5
	xnorcc	%i2,	0x1754,	%l1
	add	%l0,	%o7,	%l3
	edge8n	%i1,	%o0,	%i7
	udivcc	%g1,	0x1537,	%l5
	edge16l	%i4,	%g2,	%l4
	sir	0x0238
	udivx	%o3,	0x04FA,	%o6
	subc	%o5,	0x0EB0,	%o1
	restore %i5, %l6, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%g6,	%i0
	stx	%l2,	[%l7 + 0x20]
	fmovdcs	%xcc,	%f31,	%f16
	alignaddrl	%i6,	%g7,	%i3
	ldsb	[%l7 + 0x28],	%o4
	fpadd16	%f14,	%f0,	%f10
	fmovrdlz	%o2,	%f14,	%f30
	fpack16	%f6,	%f23
	fmovrdgez	%g3,	%f22,	%f6
	fmovsvc	%xcc,	%f28,	%f0
	popc	%i2,	%l1
	movcc	%icc,	%g5,	%o7
	movle	%xcc,	%l3,	%i1
	edge8n	%l0,	%o0,	%g1
	sll	%i7,	0x1F,	%l5
	xorcc	%i4,	0x0343,	%g2
	sra	%o3,	%l4,	%o6
	fmul8x16	%f11,	%f14,	%f6
	subc	%o5,	%i5,	%l6
	sra	%g4,	0x04,	%o1
	movrne	%i0,	0x0E9,	%l2
	fpsub32s	%f29,	%f16,	%f21
	ldsh	[%l7 + 0x40],	%i6
	movne	%icc,	%g6,	%i3
	ldub	[%l7 + 0x25],	%g7
	fpsub16s	%f4,	%f5,	%f28
	fmovse	%xcc,	%f11,	%f16
	edge8l	%o2,	%g3,	%o4
	movrgz	%i2,	0x2B5,	%l1
	movcc	%xcc,	%o7,	%g5
	subccc	%l3,	%i1,	%o0
	udiv	%l0,	0x19FE,	%g1
	ldd	[%l7 + 0x70],	%i6
	srlx	%i4,	0x01,	%g2
	fmovse	%xcc,	%f15,	%f24
	edge8ln	%o3,	%l4,	%o6
	movle	%icc,	%l5,	%i5
	stw	%l6,	[%l7 + 0x6C]
	ldsw	[%l7 + 0x44],	%g4
	movre	%o5,	0x310,	%i0
	movle	%xcc,	%l2,	%o1
	ldd	[%l7 + 0x08],	%f20
	orncc	%i6,	%g6,	%i3
	edge8l	%o2,	%g7,	%g3
	fandnot1s	%f9,	%f19,	%f2
	ldx	[%l7 + 0x10],	%o4
	or	%l1,	0x1CA7,	%i2
	sub	%g5,	0x1E2A,	%l3
	or	%o7,	0x0A92,	%i1
	fcmpeq32	%f0,	%f18,	%l0
	orcc	%g1,	0x1076,	%i7
	move	%xcc,	%i4,	%o0
	array32	%o3,	%g2,	%l4
	stw	%o6,	[%l7 + 0x60]
	addccc	%i5,	%l5,	%g4
	movn	%icc,	%l6,	%i0
	fmovrdlz	%l2,	%f4,	%f12
	fcmpgt16	%f0,	%f22,	%o5
	ldsw	[%l7 + 0x5C],	%i6
	movre	%o1,	0x1F7,	%g6
	alignaddr	%o2,	%g7,	%i3
	movn	%icc,	%g3,	%o4
	popc	0x0ECF,	%l1
	sdivcc	%i2,	0x1216,	%g5
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	andn	%g1,	%l0,	%i4
	orncc	%i7,	0x021B,	%o0
	fxor	%f4,	%f24,	%f10
	edge8ln	%o3,	%l4,	%g2
	addc	%o6,	%i5,	%g4
	fmovdl	%icc,	%f28,	%f29
	udivx	%l5,	0x07FD,	%i0
	movrne	%l6,	%o5,	%i6
	addcc	%o1,	%g6,	%l2
	movneg	%icc,	%o2,	%g7
	movvc	%xcc,	%g3,	%o4
	movrne	%l1,	0x263,	%i3
	fmovrdgz	%g5,	%f28,	%f16
	movge	%xcc,	%o7,	%i2
	movne	%xcc,	%i1,	%g1
	ldub	[%l7 + 0x3C],	%l3
	xnorcc	%l0,	%i4,	%i7
	smul	%o3,	%o0,	%g2
	fcmpeq32	%f8,	%f20,	%l4
	xnor	%i5,	%g4,	%o6
	array16	%i0,	%l5,	%l6
	movrne	%o5,	0x26F,	%o1
	edge32	%i6,	%l2,	%g6
	srlx	%g7,	0x02,	%o2
	movrne	%o4,	0x318,	%g3
	ldsh	[%l7 + 0x4C],	%i3
	add	%l1,	%o7,	%i2
	movvc	%icc,	%i1,	%g1
	array8	%g5,	%l3,	%i4
	sra	%l0,	0x07,	%i7
	andn	%o3,	%g2,	%l4
	srax	%o0,	0x16,	%g4
	movleu	%icc,	%o6,	%i0
	sub	%l5,	%l6,	%i5
	movpos	%xcc,	%o5,	%o1
	fmovscs	%xcc,	%f27,	%f19
	movl	%icc,	%i6,	%l2
	array16	%g6,	%o2,	%g7
	orcc	%o4,	0x00E0,	%g3
	smulcc	%l1,	0x16CB,	%o7
	lduw	[%l7 + 0x4C],	%i2
	fabsd	%f22,	%f8
	ldsw	[%l7 + 0x44],	%i1
	fmovrsne	%g1,	%f7,	%f21
	movrgez	%i3,	0x2CA,	%l3
	movcc	%icc,	%g5,	%l0
	subcc	%i7,	0x078F,	%o3
	fxnors	%f3,	%f29,	%f16
	stb	%g2,	[%l7 + 0x3E]
	smulcc	%i4,	0x03F6,	%o0
	stb	%l4,	[%l7 + 0x0D]
	movvc	%xcc,	%o6,	%g4
	movl	%icc,	%l5,	%l6
	orcc	%i0,	0x1F6D,	%o5
	movg	%icc,	%i5,	%i6
	edge16ln	%o1,	%g6,	%o2
	mulx	%g7,	0x13F6,	%l2
	edge16l	%o4,	%g3,	%l1
	edge16n	%i2,	%i1,	%o7
	fnor	%f30,	%f8,	%f2
	fnor	%f26,	%f0,	%f30
	movcs	%icc,	%g1,	%l3
	movre	%i3,	%l0,	%i7
	fmovsge	%xcc,	%f12,	%f7
	xorcc	%g5,	%g2,	%o3
	ldsb	[%l7 + 0x31],	%o0
	siam	0x6
	fmovrslz	%i4,	%f9,	%f11
	nop
	set	0x6E, %i7
	sth	%o6,	[%l7 + %i7]
	fcmple16	%f8,	%f0,	%l4
	movn	%xcc,	%l5,	%l6
	fcmpes	%fcc1,	%f30,	%f20
	udivx	%i0,	0x14A8,	%g4
	sdiv	%i5,	0x072A,	%i6
	udiv	%o1,	0x1529,	%g6
	subcc	%o2,	0x043B,	%o5
	save %g7, 0x1D21, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g3,	%l1,	%o4
	edge16	%i1,	%i2,	%o7
	ldd	[%l7 + 0x60],	%f18
	fmovdgu	%icc,	%f8,	%f12
	movcc	%icc,	%l3,	%i3
	edge16l	%l0,	%i7,	%g1
	sethi	0x1FF8,	%g2
	fmovrdlz	%g5,	%f0,	%f4
	edge16n	%o3,	%i4,	%o0
	movrgez	%o6,	0x1C9,	%l5
	ldd	[%l7 + 0x48],	%f10
	move	%icc,	%l6,	%l4
	smul	%i0,	0x0F37,	%i5
	fmovrdlz	%g4,	%f30,	%f2
	edge32ln	%o1,	%g6,	%i6
	stx	%o5,	[%l7 + 0x78]
	orcc	%g7,	%l2,	%g3
	fandnot1s	%f3,	%f13,	%f31
	restore %o2, 0x0E87, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i1,	%i2
	fabss	%f15,	%f26
	fnot1	%f22,	%f22
	sdivx	%o7,	0x0F4C,	%l3
	fnegd	%f12,	%f22
	movg	%icc,	%i3,	%o4
	stx	%l0,	[%l7 + 0x20]
	movge	%icc,	%i7,	%g1
	movl	%xcc,	%g5,	%g2
	sdivcc	%i4,	0x1DC5,	%o0
	sir	0x0E42
	fsrc2s	%f7,	%f31
	addccc	%o3,	0x1DC2,	%l5
	mova	%icc,	%o6,	%l4
	edge32l	%l6,	%i5,	%g4
	fpadd16	%f8,	%f2,	%f22
	umulcc	%i0,	0x02D1,	%o1
	xnor	%g6,	0x032C,	%i6
	fpack16	%f22,	%f14
	fmovsn	%xcc,	%f18,	%f9
	movgu	%xcc,	%o5,	%l2
	orcc	%g7,	%g3,	%l1
	fmovrsne	%i1,	%f22,	%f10
	xorcc	%i2,	%o2,	%l3
	addc	%i3,	%o4,	%l0
	subc	%o7,	%i7,	%g5
	movg	%xcc,	%g2,	%i4
	alignaddr	%o0,	%g1,	%l5
	subc	%o3,	0x08F2,	%o6
	move	%icc,	%l4,	%i5
	fmovdcs	%xcc,	%f12,	%f26
	fornot1	%f16,	%f8,	%f26
	edge16n	%g4,	%i0,	%o1
	ldub	[%l7 + 0x5E],	%g6
	fmovsge	%xcc,	%f9,	%f21
	mulx	%i6,	0x02EF,	%o5
	udiv	%l6,	0x18FD,	%g7
	fands	%f0,	%f24,	%f17
	std	%f16,	[%l7 + 0x08]
	sllx	%g3,	%l1,	%l2
	movvc	%icc,	%i1,	%i2
	movcs	%icc,	%l3,	%i3
	addccc	%o2,	%o4,	%o7
	lduw	[%l7 + 0x40],	%l0
	movl	%icc,	%i7,	%g2
	edge16ln	%i4,	%o0,	%g5
	sra	%g1,	%o3,	%o6
	movpos	%icc,	%l4,	%l5
	ld	[%l7 + 0x1C],	%f23
	fexpand	%f3,	%f10
	sub	%i5,	0x12D5,	%i0
	addcc	%g4,	0x1E7C,	%g6
	st	%f28,	[%l7 + 0x74]
	fmovrdne	%o1,	%f6,	%f8
	smulcc	%i6,	%o5,	%g7
	andcc	%g3,	%l6,	%l2
	ldsh	[%l7 + 0x0A],	%i1
	edge16l	%l1,	%i2,	%l3
	movgu	%xcc,	%o2,	%o4
	xor	%o7,	0x1F2D,	%i3
	movle	%icc,	%l0,	%g2
	movl	%xcc,	%i4,	%o0
	movrne	%i7,	%g1,	%g5
	fmovsne	%xcc,	%f9,	%f27
	movrgz	%o3,	%l4,	%o6
	xor	%l5,	0x0435,	%i5
	movg	%xcc,	%g4,	%i0
	and	%o1,	0x00E8,	%g6
	edge32n	%o5,	%i6,	%g7
	array8	%g3,	%l6,	%l2
	movn	%xcc,	%i1,	%l1
	umulcc	%l3,	%o2,	%o4
	movn	%xcc,	%i2,	%o7
	edge16	%l0,	%i3,	%i4
	movre	%g2,	%i7,	%o0
	sra	%g5,	%o3,	%g1
	addccc	%o6,	%l5,	%l4
	xorcc	%g4,	%i0,	%o1
	addc	%i5,	0x1D20,	%g6
	ldd	[%l7 + 0x70],	%f20
	ldsh	[%l7 + 0x48],	%i6
	fmovrdlez	%o5,	%f4,	%f24
	xnor	%g7,	0x0C7A,	%g3
	fmovdg	%icc,	%f26,	%f4
	fmovsleu	%xcc,	%f31,	%f22
	save %l2, 0x1ED2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i1,	0x14CD,	%l1
	movvc	%xcc,	%o2,	%l3
	addccc	%o4,	%o7,	%i2
	movrgez	%l0,	%i3,	%g2
	andcc	%i4,	%i7,	%o0
	edge16	%g5,	%o3,	%o6
	stx	%l5,	[%l7 + 0x70]
	fandnot2s	%f3,	%f24,	%f18
	fcmped	%fcc0,	%f8,	%f16
	fmovse	%icc,	%f26,	%f31
	udivcc	%g1,	0x1804,	%g4
	andncc	%l4,	%o1,	%i5
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	array16	%o5,	%i6,	%g7
	movvs	%icc,	%l2,	%g3
	alignaddrl	%l6,	%i1,	%o2
	fpsub16s	%f26,	%f21,	%f14
	mulx	%l3,	%o4,	%l1
	movpos	%icc,	%i2,	%l0
	fmul8x16au	%f2,	%f9,	%f0
	fpadd32s	%f23,	%f5,	%f18
	popc	0x1426,	%i3
	fcmple16	%f20,	%f18,	%g2
	subccc	%i4,	0x0871,	%o7
	ldsw	[%l7 + 0x20],	%o0
	addcc	%i7,	0x156B,	%o3
	movne	%icc,	%o6,	%l5
	xorcc	%g1,	%g4,	%l4
	fcmpne16	%f10,	%f22,	%g5
	xnor	%o1,	%g6,	%i5
	smulcc	%i0,	0x0A36,	%o5
	ldsh	[%l7 + 0x64],	%i6
	edge16	%l2,	%g3,	%l6
	sdiv	%g7,	0x0C73,	%o2
	edge32ln	%l3,	%o4,	%i1
	movleu	%icc,	%l1,	%i2
	fpadd16s	%f6,	%f10,	%f0
	add	%i3,	0x11A4,	%g2
	sdiv	%l0,	0x1CAF,	%i4
	movre	%o7,	%o0,	%i7
	sth	%o3,	[%l7 + 0x64]
	sll	%o6,	%l5,	%g1
	sll	%l4,	%g5,	%g4
	fandnot2s	%f20,	%f31,	%f15
	sll	%o1,	%i5,	%g6
	sll	%o5,	%i6,	%l2
	andcc	%i0,	0x00F6,	%g3
	fmovdle	%icc,	%f30,	%f11
	srl	%g7,	%l6,	%o2
	sth	%o4,	[%l7 + 0x2C]
	fcmpne16	%f6,	%f2,	%i1
	addccc	%l1,	0x0D3D,	%i2
	sra	%i3,	%l3,	%g2
	fors	%f7,	%f29,	%f21
	movcs	%icc,	%i4,	%l0
	movl	%xcc,	%o7,	%o0
	sth	%o3,	[%l7 + 0x0E]
	bshuffle	%f6,	%f22,	%f0
	save %o6, 0x05A3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %g1, 0x0588, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%g5,	%l4
	fcmpes	%fcc2,	%f10,	%f8
	stx	%g4,	[%l7 + 0x18]
	sth	%o1,	[%l7 + 0x2E]
	srax	%g6,	%i5,	%i6
	edge8n	%l2,	%o5,	%g3
	fexpand	%f1,	%f10
	movrgez	%i0,	0x3A8,	%l6
	xorcc	%o2,	0x0692,	%o4
	udivx	%g7,	0x07B0,	%l1
	fmovs	%f25,	%f21
	fexpand	%f11,	%f26
	sethi	0x1847,	%i2
	ld	[%l7 + 0x7C],	%f2
	addccc	%i3,	0x07D4,	%l3
	sra	%g2,	0x00,	%i4
	fnegs	%f18,	%f5
	movcs	%icc,	%l0,	%i1
	movre	%o0,	%o3,	%o6
	srl	%o7,	%i7,	%g1
	umulcc	%g5,	0x1CD0,	%l5
	umulcc	%l4,	0x1DD3,	%g4
	fcmpgt32	%f20,	%f0,	%g6
	edge32l	%o1,	%i5,	%l2
	udiv	%o5,	0x0BB3,	%g3
	fmovsleu	%icc,	%f0,	%f17
	movcc	%icc,	%i0,	%l6
	umul	%o2,	0x085C,	%o4
	andn	%i6,	%g7,	%l1
	movvc	%icc,	%i2,	%l3
	subc	%g2,	%i4,	%i3
	std	%f24,	[%l7 + 0x30]
	movl	%icc,	%i1,	%l0
	fand	%f20,	%f22,	%f10
	andn	%o3,	%o0,	%o6
	sth	%o7,	[%l7 + 0x54]
	movle	%icc,	%g1,	%i7
	edge32ln	%l5,	%g5,	%l4
	movvc	%icc,	%g6,	%g4
	lduw	[%l7 + 0x2C],	%o1
	and	%i5,	0x0A68,	%o5
	sdivcc	%g3,	0x0993,	%i0
	movne	%icc,	%l6,	%l2
	ldsh	[%l7 + 0x26],	%o4
	stw	%i6,	[%l7 + 0x64]
	fxnor	%f10,	%f20,	%f22
	fmovsl	%xcc,	%f16,	%f10
	subcc	%g7,	%o2,	%i2
	sub	%l3,	%g2,	%l1
	addc	%i3,	%i4,	%l0
	fmovdn	%xcc,	%f19,	%f27
	movrgez	%i1,	0x04A,	%o3
	srlx	%o6,	%o0,	%g1
	move	%icc,	%o7,	%i7
	popc	0x140D,	%g5
	sethi	0x0680,	%l5
	ldd	[%l7 + 0x38],	%l4
	fmovsneg	%xcc,	%f20,	%f17
	sdiv	%g6,	0x04DA,	%o1
	edge16ln	%g4,	%o5,	%g3
	udivcc	%i5,	0x096A,	%i0
	nop
	set	0x54, %l4
	lduh	[%l7 + %l4],	%l6
	alignaddr	%o4,	%l2,	%g7
	edge16n	%o2,	%i6,	%l3
	movvc	%icc,	%g2,	%l1
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	mulx	%l0,	0x1327,	%i1
	srax	%i4,	%o6,	%o3
	fnegs	%f19,	%f28
	movrlez	%o0,	0x0F5,	%o7
	sth	%i7,	[%l7 + 0x1C]
	stb	%g1,	[%l7 + 0x2B]
	fsrc1s	%f1,	%f11
	alignaddrl	%g5,	%l5,	%g6
	umulcc	%l4,	%g4,	%o1
	edge32	%o5,	%g3,	%i0
	fpack16	%f2,	%f10
	faligndata	%f2,	%f16,	%f14
	movle	%icc,	%i5,	%l6
	save %o4, 0x182F, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l2,	%o2,	%i6
	fexpand	%f9,	%f18
	srl	%l3,	0x00,	%l1
	mulx	%g2,	%i2,	%i3
	edge16	%i1,	%i4,	%o6
	movrgez	%o3,	0x2BD,	%o0
	srl	%o7,	%l0,	%i7
	alignaddrl	%g5,	%l5,	%g6
	sth	%g1,	[%l7 + 0x3A]
	fpsub16	%f8,	%f6,	%f2
	orn	%g4,	0x1C36,	%o1
	edge16n	%o5,	%l4,	%i0
	fmovdgu	%icc,	%f19,	%f19
	xnorcc	%i5,	0x0A60,	%l6
	ldsw	[%l7 + 0x28],	%g3
	orcc	%g7,	0x010C,	%l2
	sll	%o2,	0x1E,	%o4
	st	%f10,	[%l7 + 0x4C]
	movvs	%icc,	%i6,	%l3
	sdivx	%l1,	0x133D,	%g2
	fmovsvs	%icc,	%f27,	%f28
	subcc	%i3,	%i2,	%i1
	fandnot2	%f14,	%f28,	%f2
	orcc	%o6,	%o3,	%i4
	ld	[%l7 + 0x34],	%f22
	fnot2	%f12,	%f2
	sllx	%o0,	0x05,	%l0
	nop
	set	0x10, %o2
	ldsb	[%l7 + %o2],	%o7
	stw	%i7,	[%l7 + 0x18]
	srax	%l5,	%g6,	%g1
	add	%g4,	%g5,	%o1
	fandnot1	%f0,	%f0,	%f0
	fnot1	%f24,	%f14
	srlx	%l4,	0x07,	%o5
	ldub	[%l7 + 0x24],	%i0
	fmovrslz	%l6,	%f2,	%f16
	fmovrdgez	%g3,	%f2,	%f30
	xnorcc	%i5,	%l2,	%g7
	fpadd32	%f26,	%f4,	%f30
	sra	%o4,	0x14,	%i6
	sir	0x0292
	lduw	[%l7 + 0x5C],	%o2
	fabss	%f21,	%f22
	sdivcc	%l3,	0x03CA,	%l1
	ldx	[%l7 + 0x30],	%i3
	udivcc	%g2,	0x0215,	%i1
	movl	%icc,	%i2,	%o3
	fmul8x16	%f26,	%f30,	%f18
	movrlz	%o6,	0x00F,	%i4
	movrgz	%o0,	%l0,	%o7
	fmovrdgez	%i7,	%f8,	%f14
	sllx	%l5,	%g6,	%g1
	edge16l	%g4,	%g5,	%l4
	edge16ln	%o5,	%o1,	%l6
	sir	0x160D
	movneg	%xcc,	%g3,	%i0
	fmul8sux16	%f6,	%f26,	%f2
	sll	%l2,	0x17,	%g7
	or	%i5,	%o4,	%o2
	sllx	%i6,	%l3,	%i3
	edge8ln	%l1,	%i1,	%i2
	ldd	[%l7 + 0x40],	%g2
	umulcc	%o3,	0x1E74,	%i4
	orncc	%o0,	%o6,	%l0
	orncc	%o7,	0x0BD7,	%i7
	edge32n	%g6,	%g1,	%l5
	movrlz	%g4,	0x05B,	%g5
	restore %l4, 0x1FBB, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l6,	0x087,	%g3
	ldd	[%l7 + 0x50],	%i0
	movgu	%icc,	%l2,	%g7
	sdiv	%i5,	0x039D,	%o1
	array32	%o2,	%i6,	%o4
	movre	%l3,	0x330,	%i3
	movle	%icc,	%i1,	%l1
	xorcc	%g2,	0x0677,	%i2
	lduw	[%l7 + 0x7C],	%o3
	subc	%o0,	0x0BCF,	%o6
	movle	%icc,	%l0,	%i4
	edge8ln	%i7,	%o7,	%g1
	fcmpd	%fcc0,	%f26,	%f0
	edge8n	%l5,	%g4,	%g6
	udiv	%l4,	0x0639,	%o5
	fxor	%f4,	%f28,	%f4
	mova	%xcc,	%l6,	%g3
	movl	%xcc,	%i0,	%g5
	edge32l	%l2,	%i5,	%g7
	movrgz	%o1,	0x11B,	%o2
	xnorcc	%o4,	%i6,	%l3
	udivcc	%i3,	0x0A5E,	%l1
	ldsw	[%l7 + 0x78],	%g2
	popc	%i1,	%i2
	stx	%o0,	[%l7 + 0x60]
	array32	%o6,	%l0,	%i4
	lduw	[%l7 + 0x78],	%o3
	array16	%o7,	%i7,	%l5
	fands	%f26,	%f20,	%f10
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%g4
	mulx	%g1,	0x0544,	%l4
	edge8l	%o5,	%l6,	%g6
	edge16n	%g3,	%i0,	%g5
	edge32n	%l2,	%g7,	%i5
	add	%o2,	%o4,	%i6
	stx	%l3,	[%l7 + 0x70]
	xor	%o1,	0x1A49,	%l1
	ldd	[%l7 + 0x10],	%g2
	edge32	%i1,	%i2,	%i3
	movrgez	%o6,	0x30A,	%l0
	fmovsle	%icc,	%f28,	%f29
	ldsh	[%l7 + 0x62],	%i4
	srl	%o3,	0x03,	%o7
	fsrc2	%f22,	%f2
	array16	%o0,	%i7,	%l5
	movcc	%xcc,	%g4,	%g1
	fnands	%f0,	%f3,	%f5
	edge8l	%o5,	%l6,	%g6
	movrgez	%g3,	%l4,	%i0
	fzero	%f16
	andncc	%g5,	%g7,	%i5
	udivcc	%l2,	0x0BCC,	%o2
	addccc	%o4,	%i6,	%o1
	edge32ln	%l1,	%g2,	%l3
	andn	%i1,	%i2,	%i3
	fsrc2	%f22,	%f4
	movre	%o6,	%l0,	%i4
	edge16	%o3,	%o0,	%i7
	orncc	%l5,	0x1673,	%o7
	movvs	%icc,	%g1,	%g4
	xnor	%l6,	%o5,	%g3
	st	%f14,	[%l7 + 0x74]
	sllx	%l4,	%i0,	%g5
	orcc	%g7,	0x1C56,	%i5
	movneg	%xcc,	%g6,	%o2
	fmovdle	%icc,	%f24,	%f26
	subccc	%l2,	%o4,	%i6
	movpos	%icc,	%l1,	%g2
	nop
	set	0x5B, %o3
	stb	%l3,	[%l7 + %o3]
	movl	%icc,	%o1,	%i2
	mulx	%i1,	0x0E06,	%i3
	movcc	%icc,	%l0,	%o6
	orncc	%o3,	%i4,	%o0
	move	%icc,	%l5,	%i7
	popc	%g1,	%o7
	addcc	%g4,	0x0E60,	%o5
	nop
	set	0x4A, %l1
	ldub	[%l7 + %l1],	%g3
	movcc	%icc,	%l6,	%l4
	fmovdleu	%xcc,	%f29,	%f29
	move	%xcc,	%i0,	%g7
	fmul8x16al	%f3,	%f13,	%f14
	std	%f30,	[%l7 + 0x40]
	edge8ln	%g5,	%i5,	%g6
	for	%f20,	%f14,	%f8
	andcc	%l2,	0x0D30,	%o4
	ldd	[%l7 + 0x60],	%i6
	umulcc	%l1,	%g2,	%o2
	andcc	%o1,	0x144D,	%l3
	move	%xcc,	%i1,	%i3
	and	%l0,	0x176B,	%o6
	and	%o3,	0x1E7F,	%i4
	fornot1	%f8,	%f20,	%f30
	edge8n	%o0,	%i2,	%l5
	subc	%i7,	%o7,	%g4
	addccc	%g1,	%g3,	%l6
	movneg	%icc,	%o5,	%i0
	sethi	0x1EEF,	%l4
	ldd	[%l7 + 0x28],	%f26
	umul	%g5,	0x07E9,	%i5
	fsrc2	%f28,	%f10
	srax	%g6,	%g7,	%l2
	sll	%i6,	0x07,	%o4
	edge32n	%l1,	%o2,	%g2
	movrne	%l3,	%i1,	%i3
	move	%xcc,	%o1,	%l0
	movrlz	%o6,	0x318,	%i4
	alignaddr	%o0,	%i2,	%l5
	sir	0x1E37
	movneg	%icc,	%o3,	%i7
	subccc	%o7,	%g1,	%g3
	stb	%g4,	[%l7 + 0x2C]
	edge32l	%o5,	%i0,	%l4
	sllx	%g5,	0x17,	%l6
	udivx	%i5,	0x0E34,	%g7
	fxnor	%f22,	%f30,	%f28
	movrlz	%g6,	%i6,	%l2
	for	%f20,	%f16,	%f30
	edge16l	%l1,	%o2,	%g2
	siam	0x4
	ld	[%l7 + 0x38],	%f9
	pdist	%f12,	%f20,	%f2
	mulx	%o4,	%i1,	%i3
	srax	%o1,	0x0D,	%l0
	movrgez	%l3,	0x37E,	%i4
	array16	%o0,	%o6,	%i2
	sub	%o3,	0x1555,	%i7
	popc	0x1577,	%l5
	popc	%o7,	%g3
	edge16ln	%g4,	%g1,	%i0
	andncc	%o5,	%g5,	%l6
	ldsw	[%l7 + 0x30],	%l4
	fmovdne	%icc,	%f28,	%f1
	xnor	%i5,	0x17C2,	%g6
	fmovrdgez	%i6,	%f2,	%f28
	alignaddrl	%l2,	%l1,	%o2
	fornot1	%f16,	%f24,	%f24
	fcmpne16	%f0,	%f8,	%g7
	addc	%o4,	0x1555,	%i1
	movcs	%icc,	%g2,	%i3
	fsrc2	%f2,	%f4
	st	%f12,	[%l7 + 0x7C]
	movvc	%xcc,	%o1,	%l3
	edge32ln	%i4,	%o0,	%l0
	fexpand	%f19,	%f22
	add	%i2,	0x1E09,	%o6
	move	%xcc,	%o3,	%i7
	array16	%l5,	%g3,	%o7
	add	%g1,	0x019B,	%i0
	lduh	[%l7 + 0x7E],	%g4
	fpsub32s	%f21,	%f19,	%f26
	smul	%g5,	0x182B,	%o5
	movrlez	%l4,	0x046,	%l6
	movrlez	%g6,	%i6,	%l2
	ldsh	[%l7 + 0x16],	%l1
	edge8l	%i5,	%o2,	%g7
	ldsw	[%l7 + 0x08],	%o4
	fmovrsne	%i1,	%f7,	%f2
	lduw	[%l7 + 0x64],	%i3
	stx	%o1,	[%l7 + 0x48]
	movre	%g2,	%i4,	%l3
	edge32ln	%l0,	%i2,	%o6
	movcc	%icc,	%o3,	%i7
	ld	[%l7 + 0x54],	%f22
	fpackfix	%f24,	%f28
	movge	%xcc,	%l5,	%g3
	orn	%o0,	0x1691,	%g1
	st	%f31,	[%l7 + 0x50]
	sllx	%i0,	%g4,	%o7
	movrgz	%o5,	%g5,	%l4
	udivx	%l6,	0x0AA9,	%i6
	array8	%g6,	%l2,	%i5
	ldd	[%l7 + 0x68],	%f8
	movrlez	%o2,	0x19D,	%g7
	edge8ln	%o4,	%l1,	%i3
	fsrc2	%f4,	%f16
	fmovd	%f20,	%f16
	fcmpeq32	%f12,	%f16,	%o1
	fmovsgu	%xcc,	%f8,	%f0
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%f30
	alignaddr	%i1,	%i4,	%g2
	addc	%l0,	0x165F,	%l3
	ld	[%l7 + 0x24],	%f12
	save %o6, 0x1F76, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i7,	0x0081,	%i2
	st	%f8,	[%l7 + 0x5C]
	sir	0x0B7D
	lduh	[%l7 + 0x6C],	%l5
	edge32	%o0,	%g3,	%g1
	edge16l	%i0,	%g4,	%o5
	movleu	%xcc,	%o7,	%g5
	fpack32	%f2,	%f10,	%f0
	andn	%l4,	0x12F7,	%l6
	fandnot2	%f2,	%f0,	%f28
	edge16l	%g6,	%l2,	%i5
	movn	%icc,	%o2,	%i6
	subcc	%o4,	%g7,	%i3
	fnot1	%f4,	%f28
	fmovrde	%l1,	%f30,	%f20
	sra	%o1,	0x10,	%i4
	addc	%g2,	%i1,	%l3
	ldd	[%l7 + 0x60],	%f14
	subcc	%l0,	%o3,	%i7
	fmovda	%icc,	%f12,	%f0
	movvc	%xcc,	%i2,	%l5
	movvs	%icc,	%o6,	%g3
	save %g1, 0x1625, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g4,	0x1663,	%o0
	srlx	%o7,	0x0E,	%g5
	edge16	%o5,	%l6,	%l4
	fmovda	%icc,	%f15,	%f16
	fands	%f11,	%f14,	%f22
	xnor	%g6,	0x1779,	%l2
	ldsb	[%l7 + 0x0C],	%o2
	xnorcc	%i5,	%o4,	%i6
	movg	%xcc,	%i3,	%g7
	movcc	%icc,	%o1,	%l1
	movvc	%xcc,	%g2,	%i4
	ldsh	[%l7 + 0x5A],	%i1
	fpadd16s	%f27,	%f24,	%f4
	sub	%l3,	%o3,	%i7
	edge16ln	%i2,	%l0,	%o6
	stb	%l5,	[%l7 + 0x18]
	fcmpne16	%f4,	%f6,	%g1
	ldx	[%l7 + 0x08],	%g3
	movgu	%xcc,	%g4,	%i0
	fmovrdlez	%o0,	%f22,	%f6
	edge8l	%g5,	%o5,	%o7
	movvc	%icc,	%l4,	%g6
	srl	%l2,	0x0E,	%l6
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%f16
	nop
	set	0x28, %g4
	std	%f16,	[%l7 + %g4]
	fabss	%f21,	%f25
	std	%f2,	[%l7 + 0x40]
	udivx	%o2,	0x1EE3,	%o4
	edge16	%i5,	%i6,	%g7
	movneg	%xcc,	%i3,	%o1
	ld	[%l7 + 0x60],	%f23
	orn	%g2,	0x112F,	%i4
	movre	%l1,	0x35E,	%i1
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	ldx	[%l7 + 0x38],	%l3
	ldsb	[%l7 + 0x77],	%i2
	movleu	%xcc,	%l0,	%o6
	movre	%l5,	0x3B1,	%g3
	nop
	set	0x53, %o1
	stb	%g4,	[%l7 + %o1]
	andncc	%g1,	%o0,	%g5
	udivcc	%o5,	0x14EB,	%i0
	movne	%icc,	%l4,	%o7
	orcc	%l2,	0x0ACD,	%g6
	movrgz	%o2,	0x06D,	%o4
	addccc	%l6,	%i5,	%i6
	lduw	[%l7 + 0x6C],	%i3
	subcc	%o1,	0x0FF0,	%g7
	mova	%xcc,	%i4,	%g2
	save %i1, 0x1FEF, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l1,	%l3,	%i7
	subcc	%l0,	%i2,	%l5
	sethi	0x0F81,	%g3
	ldsb	[%l7 + 0x32],	%o6
	smul	%g4,	%g1,	%g5
	fcmpd	%fcc0,	%f30,	%f2
	nop
	set	0x58, %i2
	stx	%o5,	[%l7 + %i2]
	fcmpgt32	%f12,	%f18,	%o0
	edge8n	%i0,	%o7,	%l4
	edge32ln	%g6,	%l2,	%o4
	orn	%o2,	%i5,	%l6
	edge16ln	%i3,	%o1,	%i6
	fcmple16	%f14,	%f2,	%g7
	movg	%icc,	%g2,	%i1
	move	%xcc,	%o3,	%i4
	fornot2	%f28,	%f6,	%f0
	stx	%l1,	[%l7 + 0x68]
	ldsb	[%l7 + 0x38],	%l3
	subcc	%i7,	%i2,	%l5
	fornot2s	%f5,	%f14,	%f12
	nop
	set	0x56, %o5
	lduh	[%l7 + %o5],	%l0
	edge16	%o6,	%g4,	%g1
	sethi	0x033F,	%g3
	stb	%o5,	[%l7 + 0x1E]
	udiv	%o0,	0x10AF,	%g5
	xorcc	%i0,	0x0589,	%o7
	fcmpne32	%f8,	%f0,	%l4
	edge32ln	%l2,	%g6,	%o2
	fmovsvc	%icc,	%f8,	%f27
	stb	%i5,	[%l7 + 0x4E]
	xorcc	%l6,	%o4,	%o1
	or	%i6,	0x0C82,	%i3
	fmuld8sux16	%f21,	%f24,	%f2
	movn	%xcc,	%g7,	%i1
	xorcc	%g2,	0x15B2,	%o3
	edge32n	%i4,	%l1,	%i7
	fmul8sux16	%f10,	%f24,	%f24
	alignaddrl	%l3,	%i2,	%l5
	edge16l	%l0,	%o6,	%g1
	edge16n	%g4,	%g3,	%o5
	edge16	%o0,	%i0,	%g5
	sdivx	%l4,	0x10DC,	%l2
	ld	[%l7 + 0x6C],	%f26
	fors	%f2,	%f17,	%f7
	save %o7, 0x0FAE, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i5,	0x1484,	%o2
	mulx	%o4,	0x0C3D,	%l6
	popc	%i6,	%o1
	fcmped	%fcc1,	%f8,	%f22
	subccc	%g7,	0x0140,	%i1
	stb	%g2,	[%l7 + 0x68]
	srlx	%i3,	%o3,	%i4
	orcc	%l1,	0x0C19,	%i7
	sdivcc	%l3,	0x1FC6,	%l5
	sllx	%l0,	0x11,	%o6
	smulcc	%g1,	0x1A04,	%g4
	orncc	%g3,	%o5,	%i2
	ldsb	[%l7 + 0x46],	%i0
	fmovda	%xcc,	%f12,	%f7
	nop
	set	0x19, %i6
	ldub	[%l7 + %i6],	%g5
	fpadd32s	%f31,	%f8,	%f26
	fpadd32	%f26,	%f24,	%f28
	fornot2s	%f29,	%f6,	%f6
	movcc	%icc,	%l4,	%o0
	fmovspos	%xcc,	%f29,	%f26
	xor	%l2,	%g6,	%o7
	fmovrsgz	%o2,	%f28,	%f15
	movrlz	%o4,	0x21B,	%i5
	fmovrde	%l6,	%f4,	%f20
	sub	%i6,	%o1,	%i1
	array16	%g2,	%g7,	%i3
	fsrc1	%f26,	%f26
	edge32ln	%o3,	%i4,	%l1
	std	%f0,	[%l7 + 0x28]
	fmovdvs	%xcc,	%f30,	%f5
	movvc	%icc,	%l3,	%i7
	alignaddrl	%l0,	%o6,	%l5
	ldsb	[%l7 + 0x13],	%g4
	fcmpne16	%f8,	%f14,	%g3
	fmovrsgez	%o5,	%f26,	%f10
	siam	0x4
	subc	%g1,	0x0ADA,	%i0
	fandnot1s	%f3,	%f2,	%f19
	fone	%f4
	stx	%g5,	[%l7 + 0x08]
	andcc	%l4,	0x0408,	%o0
	fmovrdne	%i2,	%f18,	%f18
	edge16	%g6,	%o7,	%o2
	movrne	%l2,	%i5,	%l6
	fmovsleu	%icc,	%f23,	%f8
	movleu	%icc,	%o4,	%o1
	fmovrslz	%i1,	%f3,	%f28
	xnorcc	%i6,	%g7,	%g2
	fmul8x16al	%f25,	%f2,	%f18
	nop
	set	0x78, %i5
	stx	%i3,	[%l7 + %i5]
	addcc	%i4,	0x077A,	%l1
	move	%xcc,	%l3,	%i7
	xnor	%l0,	%o6,	%l5
	movrgez	%g4,	0x3B9,	%o3
	udivx	%o5,	0x1F60,	%g3
	subc	%i0,	0x03F3,	%g1
	subccc	%g5,	%o0,	%i2
	fmovdgu	%xcc,	%f4,	%f27
	fmovdl	%xcc,	%f24,	%f27
	and	%l4,	%o7,	%o2
	movgu	%icc,	%l2,	%i5
	fpadd32	%f20,	%f22,	%f10
	srlx	%l6,	0x12,	%o4
	andn	%o1,	0x1045,	%g6
	movl	%icc,	%i6,	%i1
	st	%f16,	[%l7 + 0x24]
	edge16l	%g7,	%i3,	%i4
	stw	%g2,	[%l7 + 0x78]
	umulcc	%l3,	%l1,	%l0
	fmovse	%xcc,	%f23,	%f21
	fpsub16	%f2,	%f30,	%f2
	mulscc	%i7,	0x173B,	%l5
	movvs	%xcc,	%g4,	%o3
	edge32l	%o5,	%o6,	%g3
	pdist	%f6,	%f12,	%f22
	movcs	%xcc,	%g1,	%g5
	movge	%xcc,	%i0,	%i2
	subc	%o0,	0x1464,	%l4
	movle	%icc,	%o7,	%l2
	ldub	[%l7 + 0x3D],	%i5
	movvs	%xcc,	%l6,	%o2
	orcc	%o4,	%g6,	%o1
	fmovsle	%icc,	%f3,	%f14
	sdiv	%i6,	0x1296,	%i1
	movcs	%xcc,	%i3,	%i4
	mova	%icc,	%g2,	%g7
	andcc	%l3,	0x0DA3,	%l0
	ld	[%l7 + 0x58],	%f15
	udivx	%l1,	0x17E1,	%l5
	mulx	%g4,	0x1071,	%o3
	ldd	[%l7 + 0x30],	%f2
	srl	%i7,	%o6,	%o5
	edge8	%g1,	%g5,	%i0
	array32	%g3,	%o0,	%i2
	edge32	%l4,	%o7,	%l2
	xorcc	%i5,	0x1B4A,	%o2
	movl	%icc,	%l6,	%o4
	nop
	set	0x7A, %g2
	ldub	[%l7 + %g2],	%g6
	movgu	%xcc,	%i6,	%i1
	mulx	%o1,	0x1A30,	%i3
	xnor	%i4,	%g2,	%g7
	srlx	%l0,	0x12,	%l3
	edge16ln	%l1,	%g4,	%l5
	edge16n	%o3,	%o6,	%i7
	edge16l	%o5,	%g5,	%i0
	udivx	%g3,	0x010F,	%o0
	sth	%i2,	[%l7 + 0x64]
	alignaddr	%g1,	%l4,	%o7
	move	%icc,	%i5,	%l2
	udivx	%l6,	0x022B,	%o4
	std	%f24,	[%l7 + 0x60]
	movg	%xcc,	%o2,	%i6
	ld	[%l7 + 0x68],	%f8
	fmovs	%f2,	%f24
	ldd	[%l7 + 0x08],	%f20
	srax	%i1,	0x1D,	%g6
	nop
	set	0x17, %i4
	ldsb	[%l7 + %i4],	%o1
	addcc	%i3,	%g2,	%i4
	movleu	%icc,	%g7,	%l0
	sdivcc	%l3,	0x1E68,	%g4
	sdivx	%l5,	0x110D,	%o3
	movneg	%icc,	%l1,	%o6
	xnorcc	%i7,	%g5,	%i0
	edge8ln	%g3,	%o0,	%i2
	fone	%f30
	srax	%g1,	0x06,	%l4
	fmovrdlez	%o7,	%f14,	%f18
	stw	%o5,	[%l7 + 0x74]
	edge8ln	%i5,	%l6,	%l2
	sth	%o2,	[%l7 + 0x58]
	or	%o4,	0x15C9,	%i1
	fpsub32	%f16,	%f20,	%f0
	movleu	%xcc,	%g6,	%i6
	umul	%o1,	0x077B,	%g2
	fsrc1	%f14,	%f14
	xnorcc	%i3,	%g7,	%i4
	lduw	[%l7 + 0x58],	%l0
	ldd	[%l7 + 0x60],	%f0
	fxnors	%f19,	%f24,	%f5
	orcc	%g4,	%l3,	%o3
	movleu	%xcc,	%l1,	%l5
	restore %o6, 0x0FF5, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%i7,	%f3,	%f10
	fmovdvs	%xcc,	%f19,	%f10
	movrne	%g3,	0x0DD,	%o0
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	addccc	%o7,	%l4,	%o5
	std	%f6,	[%l7 + 0x60]
	fcmpgt16	%f8,	%f26,	%i5
	subc	%l2,	0x0507,	%o2
	save %l6, 0x1969, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f16,	%f9,	%f25
	andncc	%g6,	%i6,	%o1
	restore %g2, %i3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g7,	%i4,	%l0
	srax	%g4,	%o3,	%l3
	sth	%l5,	[%l7 + 0x58]
	fmul8x16au	%f13,	%f27,	%f8
	std	%f26,	[%l7 + 0x38]
	edge8ln	%o6,	%l1,	%i7
	lduw	[%l7 + 0x0C],	%g3
	sir	0x0DBA
	fandnot2	%f22,	%f28,	%f4
	fzero	%f2
	fxors	%f13,	%f0,	%f10
	mova	%icc,	%o0,	%g5
	or	%i0,	0x1AFE,	%g1
	fmovscs	%xcc,	%f27,	%f7
	edge8l	%i2,	%o7,	%l4
	edge32l	%i5,	%l2,	%o2
	fnot1s	%f22,	%f9
	movg	%xcc,	%l6,	%i1
	movvc	%xcc,	%o5,	%i6
	srax	%o1,	%g2,	%g6
	and	%o4,	0x1BEB,	%g7
	umulcc	%i3,	%i4,	%g4
	faligndata	%f8,	%f12,	%f30
	movle	%xcc,	%l0,	%l3
	save %l5, %o6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o3,	%g3
	fmovsvs	%xcc,	%f3,	%f2
	sir	0x04D1
	fmovsgu	%xcc,	%f24,	%f28
	array16	%o0,	%i7,	%i0
	sllx	%g1,	%g5,	%o7
	sra	%l4,	%i2,	%i5
	sdivx	%o2,	0x1900,	%l2
	addc	%l6,	0x1B1A,	%o5
	add	%i1,	0x0F5B,	%i6
	ldub	[%l7 + 0x49],	%g2
	move	%icc,	%o1,	%g6
	fcmpd	%fcc2,	%f26,	%f8
	orn	%o4,	0x066B,	%i3
	array32	%i4,	%g7,	%g4
	stw	%l3,	[%l7 + 0x30]
	ldd	[%l7 + 0x58],	%f20
	array32	%l5,	%l0,	%l1
	ldx	[%l7 + 0x70],	%o6
	fmul8x16au	%f7,	%f24,	%f2
	move	%icc,	%g3,	%o0
	edge8	%i7,	%i0,	%g1
	ldx	[%l7 + 0x08],	%o3
	fcmpeq32	%f14,	%f20,	%g5
	udivcc	%o7,	0x1A88,	%l4
	ldsh	[%l7 + 0x08],	%i5
	stx	%o2,	[%l7 + 0x18]
	fcmps	%fcc2,	%f28,	%f0
	sdiv	%i2,	0x18D4,	%l2
	xnorcc	%l6,	%i1,	%o5
	edge16	%i6,	%g2,	%g6
	sll	%o1,	0x0F,	%o4
	movn	%xcc,	%i3,	%i4
	movrlez	%g7,	0x2F2,	%l3
	ldsh	[%l7 + 0x78],	%l5
	movvs	%xcc,	%l0,	%g4
	subccc	%l1,	%g3,	%o0
	stx	%i7,	[%l7 + 0x40]
	fnor	%f8,	%f4,	%f8
	sth	%i0,	[%l7 + 0x3C]
	st	%f7,	[%l7 + 0x1C]
	edge32	%o6,	%g1,	%g5
	sdiv	%o3,	0x0EC0,	%o7
	edge16l	%i5,	%o2,	%l4
	movge	%icc,	%i2,	%l6
	save %i1, 0x1556, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%l2,	[%l7 + 0x1C]
	movvc	%xcc,	%g2,	%g6
	array16	%i6,	%o1,	%o4
	movgu	%xcc,	%i4,	%g7
	fornot1s	%f15,	%f16,	%f6
	fpadd16s	%f29,	%f19,	%f21
	ldsb	[%l7 + 0x15],	%i3
	xnorcc	%l5,	0x0FCD,	%l3
	lduw	[%l7 + 0x4C],	%l0
	umul	%g4,	%l1,	%g3
	addccc	%o0,	0x0D94,	%i7
	ldsh	[%l7 + 0x1E],	%i0
	or	%o6,	0x1038,	%g1
	ldsw	[%l7 + 0x1C],	%g5
	fpack16	%f28,	%f16
	lduw	[%l7 + 0x1C],	%o3
	nop
	set	0x5C, %g5
	stw	%i5,	[%l7 + %g5]
	andcc	%o2,	0x0377,	%l4
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	ldsb	[%l7 + 0x22],	%o7
	movne	%xcc,	%o5,	%i1
	mulx	%g2,	%l2,	%i6
	fxors	%f16,	%f11,	%f29
	sethi	0x1B6B,	%g6
	sub	%o1,	%o4,	%g7
	subccc	%i3,	0x05B3,	%l5
	movrlz	%i4,	0x352,	%l0
	fcmpne16	%f26,	%f14,	%l3
	subccc	%l1,	0x16A3,	%g3
	fmul8x16	%f18,	%f16,	%f2
	mulscc	%g4,	%i7,	%i0
	save %o6, %g1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o3,	%i5,	%o0
	ldsh	[%l7 + 0x50],	%l4
	movg	%xcc,	%o2,	%l6
	subc	%o7,	%o5,	%i1
	ldd	[%l7 + 0x10],	%f12
	movl	%icc,	%g2,	%l2
	subcc	%i6,	0x1B92,	%g6
	ldsh	[%l7 + 0x44],	%o1
	xor	%o4,	%i2,	%g7
	edge32l	%l5,	%i4,	%i3
	movrgz	%l3,	%l0,	%g3
	movl	%icc,	%l1,	%i7
	movrgez	%g4,	%i0,	%o6
	udivcc	%g5,	0x0A71,	%g1
	popc	0x125F,	%i5
	fmovscc	%xcc,	%f16,	%f20
	edge8n	%o0,	%l4,	%o3
	sethi	0x1A50,	%o2
	udiv	%l6,	0x1625,	%o7
	sir	0x0B33
	edge16l	%i1,	%g2,	%o5
	ldd	[%l7 + 0x20],	%l2
	restore %g6, 0x079B, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%i6,	%i2
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	sub	%i3,	%g7,	%l3
	mova	%xcc,	%g3,	%l1
	movle	%icc,	%i7,	%l0
	fornot2s	%f30,	%f1,	%f2
	fors	%f28,	%f15,	%f4
	umulcc	%g4,	%i0,	%g5
	restore %o6, %g1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i5,	%o3,	%o2
	stb	%l6,	[%l7 + 0x5A]
	edge16l	%o7,	%l4,	%i1
	srax	%o5,	0x13,	%l2
	sdiv	%g2,	0x1131,	%g6
	fmovdvs	%icc,	%f16,	%f30
	edge8	%i6,	%i2,	%o1
	fmovse	%xcc,	%f17,	%f3
	udivx	%l5,	0x02AC,	%o4
	movle	%xcc,	%i3,	%g7
	xnor	%i4,	0x17BF,	%g3
	andn	%l3,	%i7,	%l1
	fornot2s	%f29,	%f11,	%f11
	srlx	%l0,	%i0,	%g5
	edge32n	%g4,	%o6,	%o0
	sth	%g1,	[%l7 + 0x6A]
	movge	%icc,	%o3,	%o2
	ldx	[%l7 + 0x58],	%i5
	subccc	%l6,	0x08E8,	%o7
	subc	%l4,	0x1DFA,	%o5
	andcc	%l2,	%g2,	%i1
	subcc	%i6,	%i2,	%o1
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	nop
	set	0x24, %o0
	ldsh	[%l7 + %o0],	%g7
	subccc	%o4,	0x01AA,	%i4
	edge32n	%g3,	%l3,	%l1
	movge	%icc,	%i7,	%l0
	xnorcc	%g5,	0x0CEE,	%g4
	fcmpne32	%f8,	%f12,	%i0
	fmovrslz	%o0,	%f31,	%f21
	orcc	%o6,	%g1,	%o3
	sdiv	%o2,	0x1D24,	%l6
	edge8ln	%i5,	%o7,	%l4
	movleu	%icc,	%l2,	%g2
	fnegd	%f6,	%f4
	ldd	[%l7 + 0x08],	%i0
	subcc	%o5,	0x0CFA,	%i2
	fones	%f9
	movl	%xcc,	%i6,	%g6
	ldsw	[%l7 + 0x48],	%l5
	popc	0x1590,	%o1
	fabsd	%f8,	%f28
	andncc	%i3,	%g7,	%o4
	fmovsn	%icc,	%f3,	%f8
	fnot2	%f24,	%f28
	edge8l	%g3,	%i4,	%l3
	fnor	%f20,	%f28,	%f20
	fmovsa	%xcc,	%f15,	%f24
	alignaddrl	%l1,	%i7,	%g5
	stw	%l0,	[%l7 + 0x54]
	mulx	%g4,	0x1E2F,	%i0
	movre	%o0,	%o6,	%g1
	movle	%icc,	%o3,	%l6
	stw	%i5,	[%l7 + 0x2C]
	sdiv	%o7,	0x0EE0,	%l4
	fmovsneg	%xcc,	%f18,	%f4
	umulcc	%l2,	0x1488,	%o2
	fnot2	%f26,	%f6
	edge32n	%g2,	%i1,	%o5
	edge16ln	%i2,	%i6,	%g6
	xnor	%l5,	0x1236,	%o1
	sra	%i3,	0x1D,	%o4
	andncc	%g3,	%g7,	%l3
	movne	%xcc,	%l1,	%i4
	subccc	%i7,	%l0,	%g5
	bshuffle	%f28,	%f24,	%f4
	fmovdgu	%xcc,	%f21,	%f1
	ldd	[%l7 + 0x48],	%g4
	xnorcc	%o0,	%o6,	%g1
	sth	%i0,	[%l7 + 0x26]
	andncc	%l6,	%i5,	%o3
	alignaddr	%l4,	%o7,	%l2
	st	%f12,	[%l7 + 0x54]
	udiv	%o2,	0x1356,	%g2
	st	%f18,	[%l7 + 0x28]
	subc	%o5,	0x1299,	%i2
	alignaddr	%i6,	%i1,	%l5
	orcc	%g6,	0x0A07,	%o1
	movrgez	%i3,	%o4,	%g7
	mova	%xcc,	%l3,	%g3
	popc	0x0872,	%i4
	sethi	0x1AC7,	%i7
	fornot1s	%f27,	%f27,	%f29
	mulscc	%l1,	0x113D,	%g5
	xorcc	%g4,	%l0,	%o6
	alignaddr	%g1,	%o0,	%l6
	movl	%xcc,	%i5,	%i0
	sethi	0x1DDA,	%o3
	stb	%l4,	[%l7 + 0x70]
	std	%f16,	[%l7 + 0x20]
	mulscc	%l2,	0x0D15,	%o7
	orcc	%o2,	%o5,	%g2
	fmovdvc	%xcc,	%f20,	%f1
	fmovdneg	%icc,	%f17,	%f9
	sdivcc	%i2,	0x0A57,	%i6
	array16	%l5,	%i1,	%o1
	fnand	%f26,	%f6,	%f0
	movcc	%icc,	%g6,	%i3
	umul	%g7,	%l3,	%g3
	fcmpgt16	%f16,	%f8,	%o4
	edge32ln	%i4,	%i7,	%l1
	fmovrslez	%g4,	%f5,	%f14
	popc	%l0,	%o6
	edge16	%g1,	%g5,	%l6
	stb	%i5,	[%l7 + 0x54]
	lduw	[%l7 + 0x74],	%o0
	ldsb	[%l7 + 0x21],	%i0
	ld	[%l7 + 0x20],	%f4
	movne	%xcc,	%o3,	%l4
	ldd	[%l7 + 0x10],	%f14
	alignaddrl	%o7,	%l2,	%o5
	edge16ln	%g2,	%o2,	%i6
	fmovrdgez	%i2,	%f20,	%f16
	andn	%i1,	0x0D18,	%l5
	movg	%icc,	%o1,	%i3
	sth	%g7,	[%l7 + 0x26]
	fands	%f13,	%f7,	%f16
	fpadd32s	%f17,	%f3,	%f5
	andn	%g6,	%l3,	%o4
	orn	%i4,	%i7,	%g3
	fnor	%f2,	%f24,	%f4
	umul	%g4,	%l1,	%l0
	st	%f3,	[%l7 + 0x2C]
	umul	%o6,	%g1,	%l6
	fmovrdne	%g5,	%f22,	%f26
	udivcc	%i5,	0x05C9,	%o0
	fcmpgt16	%f4,	%f4,	%o3
	fmovrdgez	%l4,	%f0,	%f14
	fnot1s	%f16,	%f12
	mova	%xcc,	%o7,	%l2
	ldsh	[%l7 + 0x0C],	%o5
	xnorcc	%i0,	0x086B,	%g2
	xorcc	%o2,	%i6,	%i2
	fzeros	%f10
	fmovdg	%xcc,	%f4,	%f10
	mova	%xcc,	%i1,	%o1
	ldub	[%l7 + 0x30],	%l5
	orcc	%g7,	%i3,	%l3
	smul	%o4,	%g6,	%i4
	add	%g3,	%g4,	%l1
	movcs	%xcc,	%l0,	%o6
	move	%xcc,	%i7,	%g1
	edge8	%l6,	%i5,	%g5
	alignaddrl	%o3,	%l4,	%o7
	edge32	%l2,	%o5,	%o0
	fmuld8sux16	%f9,	%f26,	%f4
	move	%icc,	%g2,	%o2
	alignaddrl	%i0,	%i6,	%i1
	fmovdneg	%xcc,	%f25,	%f9
	andn	%i2,	%l5,	%o1
	ldsw	[%l7 + 0x34],	%g7
	movrlz	%l3,	0x1EA,	%o4
	edge16ln	%g6,	%i3,	%i4
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%f14
	edge8n	%g3,	%l1,	%l0
	udivx	%o6,	0x03FE,	%i7
	fmovdvc	%icc,	%f3,	%f30
	fmovsn	%xcc,	%f15,	%f6
	fabss	%f14,	%f2
	ld	[%l7 + 0x4C],	%f31
	umulcc	%g1,	%l6,	%g4
	edge16l	%i5,	%o3,	%l4
	fnor	%f14,	%f22,	%f10
	array16	%o7,	%l2,	%g5
	movl	%icc,	%o5,	%o0
	fmovrslz	%g2,	%f15,	%f11
	lduw	[%l7 + 0x28],	%o2
	mova	%icc,	%i0,	%i1
	movneg	%xcc,	%i6,	%i2
	xnorcc	%o1,	%g7,	%l5
	orcc	%l3,	0x034F,	%g6
	alignaddr	%o4,	%i3,	%i4
	xorcc	%l1,	%g3,	%l0
	ldd	[%l7 + 0x30],	%f6
	edge16l	%i7,	%g1,	%l6
	andcc	%o6,	%i5,	%o3
	fcmpeq16	%f22,	%f26,	%g4
	sdiv	%o7,	0x149A,	%l2
	srlx	%l4,	0x13,	%o5
	edge8	%o0,	%g2,	%o2
	orn	%g5,	0x1E25,	%i1
	ldd	[%l7 + 0x50],	%i6
	edge16n	%i0,	%i2,	%o1
	edge16l	%g7,	%l3,	%l5
	fcmple32	%f6,	%f4,	%g6
	edge32ln	%o4,	%i3,	%i4
	movle	%icc,	%g3,	%l0
	popc	0x0D9B,	%i7
	popc	%l1,	%g1
	xor	%o6,	%i5,	%o3
	udiv	%g4,	0x0E7E,	%o7
	xnor	%l6,	%l4,	%l2
	movvs	%xcc,	%o5,	%o0
	sub	%o2,	%g2,	%i1
	ldsb	[%l7 + 0x6F],	%i6
	movrne	%i0,	0x038,	%i2
	lduw	[%l7 + 0x64],	%o1
	edge32ln	%g5,	%g7,	%l3
	lduw	[%l7 + 0x70],	%g6
	edge16ln	%l5,	%i3,	%o4
	ldd	[%l7 + 0x60],	%g2
	edge8ln	%l0,	%i7,	%l1
	lduw	[%l7 + 0x18],	%g1
	std	%f8,	[%l7 + 0x10]
	alignaddr	%o6,	%i5,	%o3
	subcc	%g4,	%o7,	%l6
	std	%f24,	[%l7 + 0x58]
	edge16	%i4,	%l4,	%l2
	fmovrslz	%o0,	%f20,	%f9
	fmovsl	%xcc,	%f3,	%f15
	alignaddr	%o5,	%o2,	%g2
	lduh	[%l7 + 0x30],	%i1
	edge8ln	%i0,	%i2,	%i6
	movgu	%xcc,	%g5,	%g7
	edge16	%o1,	%l3,	%l5
	edge8	%g6,	%i3,	%o4
	udiv	%g3,	0x05CA,	%l0
	umul	%i7,	0x19E7,	%g1
	movge	%xcc,	%l1,	%i5
	st	%f20,	[%l7 + 0x48]
	fmuld8sux16	%f27,	%f28,	%f24
	udiv	%o6,	0x1F0B,	%o3
	movrgz	%o7,	0x201,	%g4
	fmovsvs	%xcc,	%f2,	%f9
	movcc	%xcc,	%l6,	%l4
	sdiv	%l2,	0x1DB3,	%o0
	fsrc1	%f12,	%f12
	edge32n	%o5,	%i4,	%o2
	movcc	%xcc,	%g2,	%i1
	edge16l	%i2,	%i0,	%i6
	or	%g7,	%o1,	%l3
	xnor	%g5,	0x1EED,	%g6
	st	%f26,	[%l7 + 0x68]
	movrlez	%l5,	%o4,	%g3
	restore %l0, %i3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc1,	%f6,	%f26
	sethi	0x12D0,	%l1
	sethi	0x00EC,	%i5
	udiv	%g1,	0x0706,	%o3
	stx	%o6,	[%l7 + 0x70]
	fone	%f8
	orn	%o7,	0x15F3,	%l6
	udivx	%g4,	0x006F,	%l2
	fmovdn	%icc,	%f17,	%f18
	movgu	%icc,	%o0,	%l4
	fsrc2s	%f19,	%f14
	fmul8sux16	%f18,	%f28,	%f22
	fmovsn	%icc,	%f25,	%f19
	movle	%xcc,	%o5,	%o2
	movn	%icc,	%i4,	%i1
	sub	%i2,	0x04EC,	%i0
	ldx	[%l7 + 0x50],	%i6
	umul	%g7,	0x0B1A,	%o1
	fmovdvc	%icc,	%f11,	%f21
	fornot2	%f16,	%f2,	%f0
	addccc	%g2,	%l3,	%g6
	save %g5, 0x0D4C, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o4,	%l0,	%i3
	or	%g3,	%l1,	%i5
	movrlz	%i7,	%g1,	%o3
	umul	%o7,	0x095D,	%o6
	movre	%g4,	%l2,	%o0
	sdiv	%l6,	0x124A,	%o5
	srax	%l4,	%i4,	%i1
	sethi	0x0E3C,	%i2
	movge	%xcc,	%o2,	%i6
	subc	%i0,	0x084A,	%o1
	pdist	%f16,	%f12,	%f18
	fornot2	%f28,	%f24,	%f16
	fxors	%f20,	%f20,	%f28
	for	%f24,	%f26,	%f0
	edge8l	%g7,	%g2,	%l3
	movle	%xcc,	%g5,	%l5
	edge32l	%o4,	%g6,	%l0
	fmovrdgz	%g3,	%f24,	%f12
	edge32	%i3,	%l1,	%i5
	sdiv	%i7,	0x07D5,	%o3
	srl	%g1,	%o6,	%g4
	subcc	%l2,	0x0414,	%o7
	sethi	0x1F74,	%l6
	fmovrslz	%o0,	%f12,	%f18
	movvc	%icc,	%o5,	%l4
	lduh	[%l7 + 0x5C],	%i4
	fxnors	%f30,	%f11,	%f17
	fmovrslz	%i2,	%f10,	%f9
	sdivcc	%i1,	0x18D6,	%i6
	addcc	%o2,	%o1,	%i0
	subccc	%g2,	0x0314,	%l3
	ldsw	[%l7 + 0x58],	%g5
	edge8ln	%l5,	%g7,	%o4
	sllx	%l0,	0x1E,	%g3
	fcmpne32	%f20,	%f8,	%i3
	fpack32	%f26,	%f6,	%f16
	sra	%g6,	%i5,	%l1
	orncc	%o3,	%g1,	%o6
	fcmpne16	%f22,	%f24,	%g4
	st	%f21,	[%l7 + 0x14]
	lduh	[%l7 + 0x76],	%i7
	sub	%l2,	0x1389,	%o7
	andncc	%o0,	%o5,	%l4
	nop
	set	0x50, %g3
	std	%f12,	[%l7 + %g3]
	xnorcc	%l6,	%i2,	%i4
	movrne	%i1,	%o2,	%i6
	nop
	set	0x08, %l6
	std	%f20,	[%l7 + %l6]
	movrlez	%o1,	0x344,	%i0
	movcc	%icc,	%g2,	%g5
	orcc	%l5,	%g7,	%l3
	stx	%l0,	[%l7 + 0x68]
	stb	%o4,	[%l7 + 0x2E]
	save %i3, 0x0707, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f6,	%f2,	%g6
	stw	%i5,	[%l7 + 0x5C]
	sdiv	%l1,	0x140B,	%g1
	fmovrdne	%o6,	%f16,	%f30
	fmul8x16au	%f25,	%f21,	%f26
	movge	%xcc,	%g4,	%i7
	andcc	%o3,	0x08AB,	%o7
	movcc	%xcc,	%o0,	%o5
	edge8l	%l4,	%l6,	%i2
	smul	%i4,	0x0348,	%i1
	sir	0x181F
	edge16	%o2,	%i6,	%o1
	sdivcc	%i0,	0x0AFE,	%l2
	movrne	%g5,	%g2,	%g7
	save %l3, %l0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l5,	0x1661,	%i3
	movrgz	%g6,	0x212,	%g3
	fmul8sux16	%f12,	%f30,	%f24
	umul	%i5,	0x02CC,	%g1
	edge16	%o6,	%g4,	%i7
	std	%f16,	[%l7 + 0x38]
	array8	%o3,	%o7,	%o0
	ldsw	[%l7 + 0x08],	%l1
	lduh	[%l7 + 0x48],	%l4
	srlx	%o5,	0x12,	%i2
	addc	%l6,	0x152D,	%i4
	fmuld8sux16	%f23,	%f16,	%f18
	fcmpgt32	%f8,	%f0,	%i1
	array32	%o2,	%o1,	%i6
	movre	%i0,	0x039,	%l2
	mova	%icc,	%g2,	%g7
	fcmple32	%f16,	%f10,	%g5
	move	%xcc,	%l3,	%l0
	movrlz	%l5,	%i3,	%g6
	movcc	%xcc,	%g3,	%o4
	movvc	%xcc,	%i5,	%o6
	stb	%g4,	[%l7 + 0x75]
	lduw	[%l7 + 0x50],	%i7
	subcc	%o3,	0x0D51,	%o7
	fnors	%f16,	%f2,	%f21
	ldx	[%l7 + 0x60],	%g1
	udiv	%o0,	0x12F9,	%l4
	subccc	%o5,	0x133D,	%l1
	umulcc	%i2,	0x0616,	%i4
	lduw	[%l7 + 0x40],	%l6
	fmovdgu	%icc,	%f8,	%f6
	ldsh	[%l7 + 0x22],	%i1
	movge	%icc,	%o1,	%o2
	udivcc	%i6,	0x0429,	%i0
	array16	%l2,	%g2,	%g5
	orn	%g7,	%l3,	%l5
	andn	%i3,	%g6,	%l0
	movvs	%icc,	%g3,	%i5
	mova	%xcc,	%o4,	%g4
	movne	%xcc,	%i7,	%o6
	srl	%o7,	%g1,	%o3
	lduw	[%l7 + 0x1C],	%o0
	save %o5, %l1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i4,	0x1015,	%l4
	subc	%l6,	0x197D,	%i1
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	mulscc	%o1,	%i0,	%l2
	fnors	%f30,	%f8,	%f0
	fornot2	%f30,	%f28,	%f26
	fmovdl	%icc,	%f9,	%f8
	sdivcc	%g2,	0x061E,	%g5
	ldd	[%l7 + 0x70],	%g6
	sub	%l3,	%i3,	%l5
	stw	%l0,	[%l7 + 0x78]
	movcs	%icc,	%g3,	%i5
	movrlz	%o4,	0x305,	%g4
	fpadd16s	%f11,	%f16,	%f30
	sdivx	%i7,	0x1AC4,	%o6
	andcc	%o7,	%g6,	%g1
	fandnot2	%f8,	%f2,	%f0
	sdiv	%o3,	0x013D,	%o5
	edge8l	%l1,	%o0,	%i4
	udivcc	%l4,	0x0A98,	%l6
	array32	%i1,	%i2,	%i6
	edge8n	%o2,	%o1,	%i0
	addccc	%g2,	0x0876,	%l2
	fmovdl	%icc,	%f27,	%f30
	ldd	[%l7 + 0x70],	%g4
	sdivx	%l3,	0x1E78,	%i3
	nop
	set	0x34, %i1
	ldsw	[%l7 + %i1],	%g7
	bshuffle	%f8,	%f30,	%f10
	fandnot1	%f30,	%f14,	%f14
	udivx	%l5,	0x16EA,	%l0
	fcmped	%fcc2,	%f18,	%f8
	movrlz	%i5,	0x26D,	%g3
	fpsub32s	%f11,	%f28,	%f15
	edge8ln	%g4,	%i7,	%o6
	fmul8x16au	%f11,	%f6,	%f6
	edge16ln	%o4,	%o7,	%g6
	edge8ln	%g1,	%o5,	%l1
	save %o0, %o3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l6,	0x0192,	%i1
	nop
	set	0x0B, %i0
	ldub	[%l7 + %i0],	%l4
	ldd	[%l7 + 0x40],	%i6
	xorcc	%i2,	%o2,	%o1
	edge8	%g2,	%i0,	%l2
	sra	%g5,	0x0F,	%l3
	edge8	%i3,	%l5,	%g7
	xorcc	%i5,	0x14AC,	%g3
	fmovse	%icc,	%f29,	%f14
	fmovsvc	%xcc,	%f21,	%f28
	andcc	%g4,	%i7,	%o6
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%l0
	alignaddr	%o7,	%o4,	%g6
	movpos	%xcc,	%o5,	%g1
	sdivx	%o0,	0x1685,	%o3
	fsrc1s	%f29,	%f8
	orcc	%i4,	0x1724,	%l1
	ldub	[%l7 + 0x54],	%l6
	lduh	[%l7 + 0x26],	%i1
	subcc	%l4,	%i2,	%i6
	smul	%o2,	0x0E75,	%g2
	movleu	%xcc,	%i0,	%l2
	sdiv	%o1,	0x1956,	%l3
	or	%i3,	0x1272,	%g5
	fmovde	%icc,	%f13,	%f14
	fmovdl	%icc,	%f9,	%f10
	ldub	[%l7 + 0x52],	%g7
	fmuld8ulx16	%f15,	%f29,	%f30
	sdivx	%i5,	0x1CEC,	%g3
	popc	0x1440,	%g4
	andn	%l5,	%i7,	%o6
	movvs	%xcc,	%o7,	%l0
	ldsw	[%l7 + 0x70],	%g6
	subccc	%o4,	0x0464,	%o5
	edge8	%o0,	%g1,	%o3
	movl	%icc,	%i4,	%l1
	stx	%l6,	[%l7 + 0x08]
	udivx	%i1,	0x1442,	%l4
	edge8	%i2,	%i6,	%o2
	ldub	[%l7 + 0x26],	%g2
	edge16l	%i0,	%l2,	%o1
	sdivcc	%l3,	0x0974,	%i3
	smulcc	%g5,	%i5,	%g3
	fnors	%f8,	%f28,	%f18
	srl	%g4,	0x0E,	%g7
	edge32ln	%i7,	%l5,	%o6
	stw	%o7,	[%l7 + 0x4C]
	movrgz	%g6,	0x00F,	%o4
	st	%f10,	[%l7 + 0x48]
	fmovsleu	%xcc,	%f29,	%f19
	array32	%l0,	%o5,	%o0
	array32	%o3,	%g1,	%l1
	st	%f11,	[%l7 + 0x44]
	mulx	%i4,	0x1C33,	%i1
	orcc	%l6,	%i2,	%l4
	movg	%xcc,	%o2,	%i6
	fmovdl	%xcc,	%f14,	%f31
	lduh	[%l7 + 0x2E],	%i0
	fnot1s	%f27,	%f7
	ldsb	[%l7 + 0x6B],	%g2
	mulscc	%o1,	0x1226,	%l3
	movcs	%xcc,	%i3,	%g5
	fxnors	%f24,	%f2,	%f5
	fone	%f4
	alignaddr	%i5,	%l2,	%g3
	fmovse	%xcc,	%f15,	%f9
	movrlez	%g4,	0x10D,	%g7
	movge	%icc,	%i7,	%l5
	ldsb	[%l7 + 0x0A],	%o6
	fcmpes	%fcc0,	%f27,	%f16
	movrlez	%g6,	0x351,	%o4
	fcmpeq32	%f8,	%f14,	%o7
	edge32l	%o5,	%l0,	%o3
	movrgez	%g1,	0x0E7,	%l1
	fmovscs	%xcc,	%f2,	%f25
	sdivx	%i4,	0x15F1,	%o0
	orn	%l6,	%i2,	%i1
	movleu	%xcc,	%l4,	%i6
	xorcc	%o2,	%g2,	%o1
	ldsw	[%l7 + 0x54],	%l3
	fmovde	%xcc,	%f26,	%f9
	sra	%i0,	0x0A,	%i3
	fpadd32	%f4,	%f16,	%f22
	movrlz	%i5,	0x088,	%l2
	alignaddrl	%g3,	%g4,	%g5
	lduw	[%l7 + 0x20],	%g7
	alignaddrl	%i7,	%l5,	%o6
	andcc	%g6,	%o4,	%o5
	movvs	%icc,	%l0,	%o3
	edge32	%g1,	%o7,	%l1
	sll	%i4,	%l6,	%o0
	sllx	%i2,	0x08,	%l4
	ldsw	[%l7 + 0x58],	%i6
	orncc	%o2,	%g2,	%i1
	fmovdne	%icc,	%f2,	%f27
	lduh	[%l7 + 0x1C],	%l3
	subcc	%i0,	0x0C36,	%i3
	orn	%i5,	%l2,	%g3
	array16	%g4,	%g5,	%g7
	udivx	%o1,	0x14D5,	%i7
	mulscc	%o6,	%l5,	%g6
	fmovsne	%xcc,	%f6,	%f15
	edge16l	%o5,	%l0,	%o4
	movn	%xcc,	%o3,	%g1
	addc	%l1,	0x145E,	%o7
	fmovdneg	%xcc,	%f31,	%f15
	mulscc	%l6,	%i4,	%o0
	movle	%xcc,	%l4,	%i6
	array8	%o2,	%g2,	%i1
	fmovsa	%icc,	%f1,	%f14
	fmovdgu	%xcc,	%f20,	%f21
	fandnot2s	%f6,	%f8,	%f2
	fmovrsgz	%i2,	%f26,	%f14
	fmovrdlez	%i0,	%f26,	%f4
	mulscc	%i3,	%l3,	%l2
	st	%f7,	[%l7 + 0x38]
	fandnot1	%f28,	%f6,	%f26
	sdivcc	%i5,	0x004D,	%g4
	movrgez	%g5,	%g3,	%o1
	edge32ln	%g7,	%o6,	%l5
	ldsw	[%l7 + 0x18],	%i7
	udiv	%g6,	0x1110,	%l0
	ldsh	[%l7 + 0x52],	%o4
	mova	%icc,	%o3,	%g1
	fandnot1	%f4,	%f12,	%f4
	fsrc1	%f30,	%f20
	or	%l1,	%o7,	%l6
	and	%o5,	0x0C50,	%o0
	addc	%i4,	%l4,	%o2
	edge32	%g2,	%i1,	%i6
	sdiv	%i2,	0x1601,	%i3
	movre	%i0,	0x196,	%l2
	mulx	%i5,	0x0F3E,	%g4
	sub	%l3,	%g3,	%g5
	edge32l	%o1,	%o6,	%g7
	movle	%xcc,	%l5,	%i7
	subc	%g6,	0x137F,	%o4
	fcmpes	%fcc1,	%f11,	%f30
	fcmpne32	%f0,	%f28,	%o3
	std	%f14,	[%l7 + 0x50]
	movgu	%icc,	%g1,	%l0
	srax	%o7,	%l6,	%o5
	fmovsg	%xcc,	%f9,	%f27
	movvs	%icc,	%l1,	%o0
	smul	%i4,	0x180E,	%l4
	nop
	set	0x47, %o7
	ldub	[%l7 + %o7],	%o2
	mulscc	%g2,	%i1,	%i6
	ldsh	[%l7 + 0x18],	%i2
	and	%i3,	%i0,	%i5
	xnorcc	%g4,	%l3,	%g3
	ldd	[%l7 + 0x40],	%g4
	andn	%o1,	0x11E9,	%l2
	smul	%g7,	%o6,	%i7
	fmovdcc	%xcc,	%f14,	%f10
	fmovrdlz	%g6,	%f26,	%f2
	nop
	set	0x70, %g6
	stx	%o4,	[%l7 + %g6]
	fnegs	%f27,	%f1
	movrne	%l5,	%g1,	%o3
	alignaddrl	%l0,	%l6,	%o5
	movg	%icc,	%o7,	%o0
	ldub	[%l7 + 0x3D],	%i4
	edge16n	%l4,	%o2,	%g2
	edge16l	%l1,	%i1,	%i2
	umulcc	%i6,	%i3,	%i5
	lduh	[%l7 + 0x5C],	%i0
	movne	%icc,	%g4,	%g3
	bshuffle	%f2,	%f8,	%f14
	movcs	%xcc,	%g5,	%o1
	movn	%xcc,	%l3,	%l2
	addccc	%o6,	%i7,	%g6
	std	%f30,	[%l7 + 0x48]
	nop
	set	0x40, %i3
	stx	%o4,	[%l7 + %i3]
	smulcc	%g7,	%l5,	%g1
	fxor	%f0,	%f14,	%f2
	mulx	%o3,	%l0,	%l6
	nop
	set	0x44, %l3
	ldsw	[%l7 + %l3],	%o7
	umulcc	%o0,	0x00D7,	%o5
	std	%f24,	[%l7 + 0x70]
	array16	%i4,	%o2,	%l4
	fornot1s	%f31,	%f15,	%f27
	alignaddrl	%g2,	%l1,	%i2
	sdivx	%i1,	0x0AD6,	%i3
	umul	%i5,	0x19CF,	%i6
	edge32ln	%g4,	%g3,	%i0
	ldd	[%l7 + 0x40],	%g4
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%o0
	orn	%l3,	%l2,	%i7
	fpadd32s	%f6,	%f23,	%f28
	sth	%g6,	[%l7 + 0x6E]
	orncc	%o4,	0x0B55,	%g7
	movg	%icc,	%o6,	%l5
	sir	0x0957
	movn	%icc,	%g1,	%l0
	edge8	%l6,	%o3,	%o7
	movneg	%icc,	%o5,	%o0
	sdiv	%i4,	0x0AF4,	%l4
	movpos	%icc,	%o2,	%l1
	smulcc	%i2,	%i1,	%g2
	nop
	set	0x20, %g7
	stx	%i3,	[%l7 + %g7]
	orncc	%i6,	0x08F7,	%g4
	udiv	%g3,	0x11CE,	%i5
	movrlez	%g5,	%i0,	%o1
	movpos	%xcc,	%l2,	%l3
	movle	%xcc,	%i7,	%g6
	sub	%g7,	0x0E4A,	%o6
	ld	[%l7 + 0x18],	%f11
	move	%icc,	%l5,	%o4
	fmovdpos	%icc,	%f22,	%f6
	andn	%g1,	0x069A,	%l0
	fmul8x16	%f8,	%f16,	%f0
	fmovrdgez	%l6,	%f8,	%f0
	and	%o7,	%o5,	%o0
	umulcc	%o3,	%i4,	%o2
	siam	0x4
	array16	%l4,	%i2,	%l1
	addc	%g2,	0x0221,	%i1
	sdivcc	%i3,	0x0AF0,	%i6
	srax	%g4,	0x09,	%g3
	orncc	%g5,	%i0,	%o1
	fmovscs	%icc,	%f15,	%f5
	srl	%i5,	0x07,	%l3
	fmovscc	%icc,	%f22,	%f23
	movcs	%xcc,	%i7,	%l2
	movgu	%xcc,	%g7,	%o6
	movl	%icc,	%g6,	%l5
	movge	%xcc,	%o4,	%g1
	movrlez	%l0,	%l6,	%o5
	fmovsl	%icc,	%f2,	%f12
	fand	%f14,	%f24,	%f0
	fmovsneg	%xcc,	%f17,	%f21
	movrgz	%o7,	%o3,	%i4
	fxors	%f13,	%f6,	%f2
	ldsh	[%l7 + 0x32],	%o2
	ldsw	[%l7 + 0x40],	%l4
	ldd	[%l7 + 0x48],	%f12
	add	%o0,	%i2,	%g2
	movg	%xcc,	%i1,	%i3
	subcc	%i6,	0x00AE,	%l1
	edge16n	%g4,	%g3,	%g5
	ldsh	[%l7 + 0x5C],	%o1
	movle	%icc,	%i0,	%l3
	sdivx	%i7,	0x18B5,	%i5
	movpos	%xcc,	%g7,	%l2
	orncc	%o6,	0x01AF,	%g6
	movrlz	%l5,	%o4,	%l0
	orcc	%g1,	%l6,	%o7
	movcs	%icc,	%o5,	%i4
	fmovrdlz	%o2,	%f20,	%f2
	fpsub16	%f20,	%f6,	%f20
	addcc	%o3,	%l4,	%o0
	edge16l	%i2,	%i1,	%i3
	alignaddrl	%i6,	%g2,	%g4
	fnot2s	%f2,	%f13
	ldsw	[%l7 + 0x34],	%g3
	movle	%xcc,	%g5,	%o1
	move	%icc,	%l1,	%l3
	fmovscc	%xcc,	%f13,	%f6
	fzero	%f12
	fmovdge	%xcc,	%f1,	%f2
	smulcc	%i7,	0x119B,	%i0
	sir	0x1921
	edge16l	%g7,	%i5,	%o6
	fmovdleu	%xcc,	%f11,	%f28
	movrgez	%l2,	%l5,	%o4
	fmovsne	%xcc,	%f18,	%f1
	fmuld8ulx16	%f0,	%f10,	%f22
	ldx	[%l7 + 0x78],	%g6
	xnor	%l0,	0x1970,	%g1
	addc	%l6,	%o5,	%i4
	edge32l	%o7,	%o2,	%l4
	fpack32	%f0,	%f12,	%f12
	edge8	%o3,	%i2,	%o0
	ldd	[%l7 + 0x60],	%i2
	save %i6, %i1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g3,	%g5
	fmovsgu	%icc,	%f11,	%f8
	umul	%o1,	0x0F6D,	%g4
	ldd	[%l7 + 0x48],	%l0
	fsrc2	%f22,	%f2
	udiv	%l3,	0x1B61,	%i0
	nop
	set	0x08, %i7
	stx	%i7,	[%l7 + %i7]
	ldsw	[%l7 + 0x74],	%g7
	movg	%icc,	%i5,	%o6
	popc	0x1272,	%l5
	edge32	%o4,	%l2,	%g6
	edge32ln	%l0,	%l6,	%g1
	fmovrdlez	%o5,	%f0,	%f24
	andncc	%o7,	%i4,	%o2
	sll	%o3,	%l4,	%i2
	add	%i3,	%o0,	%i6
	edge32ln	%g2,	%g3,	%i1
	fors	%f6,	%f9,	%f24
	movpos	%icc,	%o1,	%g4
	array8	%g5,	%l3,	%i0
	mulscc	%i7,	0x0B11,	%l1
	srax	%g7,	0x00,	%o6
	pdist	%f18,	%f26,	%f28
	fpadd16s	%f12,	%f10,	%f29
	fornot2	%f28,	%f4,	%f26
	movleu	%xcc,	%i5,	%l5
	mulscc	%l2,	0x08F7,	%o4
	movgu	%xcc,	%g6,	%l0
	fors	%f7,	%f25,	%f11
	movn	%icc,	%g1,	%l6
	fmovde	%xcc,	%f26,	%f5
	ldsb	[%l7 + 0x4A],	%o7
	fnot2	%f12,	%f12
	ldsw	[%l7 + 0x74],	%o5
	addcc	%o2,	%o3,	%l4
	stw	%i4,	[%l7 + 0x4C]
	array8	%i3,	%i2,	%o0
	st	%f0,	[%l7 + 0x6C]
	ldsh	[%l7 + 0x18],	%i6
	subc	%g3,	0x07ED,	%i1
	edge32n	%o1,	%g2,	%g5
	fandnot2s	%f16,	%f5,	%f18
	addc	%l3,	%i0,	%g4
	mova	%icc,	%l1,	%g7
	movrgz	%i7,	0x119,	%o6
	stx	%i5,	[%l7 + 0x20]
	sllx	%l2,	%l5,	%o4
	mulscc	%l0,	0x06FD,	%g1
	fmul8ulx16	%f30,	%f10,	%f28
	alignaddrl	%l6,	%o7,	%g6
	ldd	[%l7 + 0x48],	%f0
	udivcc	%o5,	0x046F,	%o3
	ldsh	[%l7 + 0x64],	%o2
	fmul8ulx16	%f14,	%f16,	%f6
	edge8ln	%l4,	%i4,	%i3
	array32	%i2,	%i6,	%o0
	movvs	%icc,	%g3,	%o1
	array32	%i1,	%g2,	%g5
	fpsub32s	%f18,	%f12,	%f11
	smul	%l3,	%g4,	%l1
	fpadd16s	%f5,	%f22,	%f25
	edge32	%i0,	%g7,	%i7
	movge	%xcc,	%o6,	%l2
	fmovrdne	%l5,	%f8,	%f26
	edge8	%i5,	%l0,	%g1
	fnor	%f0,	%f16,	%f14
	fmovrslez	%l6,	%f9,	%f12
	fcmpeq16	%f20,	%f22,	%o7
	movne	%xcc,	%o4,	%g6
	movre	%o5,	%o2,	%l4
	movrgz	%o3,	%i4,	%i3
	movg	%xcc,	%i6,	%i2
	movl	%xcc,	%o0,	%g3
	sllx	%o1,	0x13,	%g2
	fpsub16	%f4,	%f14,	%f24
	fornot1	%f0,	%f24,	%f18
	sdiv	%g5,	0x17FB,	%i1
	movleu	%xcc,	%g4,	%l3
	lduw	[%l7 + 0x3C],	%i0
	movge	%icc,	%g7,	%l1
	edge8n	%i7,	%l2,	%l5
	movle	%icc,	%i5,	%l0
	srlx	%o6,	%g1,	%l6
	edge32	%o4,	%g6,	%o5
	edge32n	%o7,	%o2,	%l4
	mova	%icc,	%o3,	%i4
	array8	%i6,	%i2,	%o0
	alignaddr	%g3,	%o1,	%g2
	movpos	%xcc,	%i3,	%g5
	udivx	%i1,	0x01F8,	%g4
	fmovsvc	%xcc,	%f29,	%f5
	stb	%l3,	[%l7 + 0x41]
	fmovdcs	%icc,	%f14,	%f27
	movcc	%xcc,	%g7,	%i0
	fmovsn	%xcc,	%f22,	%f0
	fcmpgt32	%f2,	%f14,	%l1
	mulx	%i7,	%l5,	%i5
	edge16ln	%l2,	%o6,	%l0
	xnor	%l6,	%o4,	%g1
	sth	%o5,	[%l7 + 0x72]
	edge8n	%g6,	%o2,	%o7
	movre	%o3,	%i4,	%i6
	movrlez	%i2,	0x00D,	%l4
	fmovsvs	%icc,	%f27,	%f25
	andncc	%o0,	%o1,	%g3
	mulx	%i3,	0x0D8A,	%g2
	edge8l	%g5,	%i1,	%g4
	movge	%xcc,	%l3,	%i0
	edge32l	%g7,	%i7,	%l1
	umul	%l5,	%l2,	%o6
	ldsb	[%l7 + 0x6F],	%l0
	restore %i5, %l6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f26,	%f4,	%f8
	edge16ln	%o5,	%g1,	%o2
	movleu	%icc,	%g6,	%o3
	movrlz	%o7,	0x0FD,	%i4
	edge8	%i6,	%i2,	%o0
	nop
	set	0x2A, %l4
	sth	%l4,	[%l7 + %l4]
	movcs	%xcc,	%o1,	%i3
	lduw	[%l7 + 0x28],	%g2
	fmovrsgz	%g5,	%f24,	%f21
	fands	%f27,	%f29,	%f24
	edge32l	%i1,	%g3,	%g4
	edge8	%l3,	%g7,	%i7
	fmovsle	%icc,	%f19,	%f3
	add	%i0,	%l5,	%l2
	movcs	%xcc,	%l1,	%o6
	edge32	%l0,	%l6,	%o4
	xnorcc	%o5,	%i5,	%g1
	edge32	%o2,	%o3,	%g6
	fnegd	%f14,	%f6
	edge16n	%i4,	%o7,	%i2
	srax	%o0,	%l4,	%i6
	smulcc	%o1,	%i3,	%g5
	ldub	[%l7 + 0x6F],	%i1
	lduh	[%l7 + 0x3A],	%g3
	fpack32	%f18,	%f22,	%f14
	movcc	%xcc,	%g2,	%l3
	sllx	%g7,	0x0F,	%g4
	sdivx	%i7,	0x105A,	%i0
	xnor	%l2,	%l5,	%l1
	fcmpd	%fcc2,	%f10,	%f10
	movcc	%xcc,	%l0,	%o6
	or	%l6,	0x0CF0,	%o5
	ld	[%l7 + 0x7C],	%f0
	srlx	%i5,	0x11,	%g1
	movrgz	%o2,	%o3,	%o4
	fands	%f28,	%f2,	%f9
	fzeros	%f11
	edge32n	%i4,	%g6,	%o7
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	faligndata	%f8,	%f22,	%f2
	edge8	%l4,	%i3,	%o1
	smulcc	%i1,	0x1A2D,	%g3
	add	%g2,	%g5,	%g7
	udiv	%l3,	0x0631,	%g4
	nop
	set	0x38, %l5
	lduw	[%l7 + %l5],	%i0
	edge16l	%l2,	%l5,	%l1
	edge8	%i7,	%o6,	%l0
	movrgz	%l6,	%o5,	%i5
	ldx	[%l7 + 0x20],	%o2
	array16	%g1,	%o3,	%o4
	sra	%g6,	%o7,	%i2
	fcmple32	%f16,	%f4,	%o0
	smulcc	%i4,	%i6,	%i3
	fpsub32	%f2,	%f26,	%f14
	sllx	%l4,	%o1,	%g3
	stx	%i1,	[%l7 + 0x58]
	sra	%g2,	0x04,	%g5
	edge16l	%g7,	%g4,	%l3
	movn	%xcc,	%l2,	%l5
	addcc	%i0,	%l1,	%o6
	fmovsneg	%xcc,	%f17,	%f29
	edge8ln	%l0,	%i7,	%l6
	movleu	%icc,	%i5,	%o5
	std	%f14,	[%l7 + 0x10]
	fnor	%f22,	%f30,	%f24
	srax	%g1,	%o3,	%o2
	ld	[%l7 + 0x50],	%f1
	fmovsleu	%icc,	%f18,	%f3
	ldub	[%l7 + 0x19],	%o4
	edge16ln	%o7,	%i2,	%o0
	andncc	%i4,	%i6,	%i3
	fmovsl	%icc,	%f11,	%f21
	udivx	%g6,	0x165A,	%l4
	fmovdleu	%xcc,	%f18,	%f16
	edge32l	%g3,	%o1,	%i1
	xnor	%g5,	0x0EB5,	%g2
	orncc	%g7,	0x1132,	%l3
	or	%g4,	0x03CC,	%l5
	lduh	[%l7 + 0x4E],	%i0
	edge32	%l1,	%o6,	%l2
	ldsh	[%l7 + 0x26],	%i7
	std	%f24,	[%l7 + 0x70]
	stb	%l0,	[%l7 + 0x79]
	subc	%i5,	%o5,	%g1
	popc	0x0791,	%l6
	lduh	[%l7 + 0x62],	%o3
	xor	%o2,	0x0EBF,	%o4
	movne	%xcc,	%o7,	%i2
	sth	%i4,	[%l7 + 0x6C]
	save %i6, 0x0349, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i3,	[%l7 + 0x20]
	ldx	[%l7 + 0x38],	%l4
	fsrc2	%f20,	%f10
	movleu	%icc,	%g3,	%o1
	fnegd	%f14,	%f26
	addcc	%i1,	0x05D7,	%g6
	andn	%g5,	%g7,	%g2
	fpadd16s	%f8,	%f3,	%f11
	fmovsgu	%xcc,	%f12,	%f0
	stw	%g4,	[%l7 + 0x0C]
	lduh	[%l7 + 0x2A],	%l5
	sdivcc	%l3,	0x0A28,	%i0
	fmovsle	%icc,	%f12,	%f31
	array32	%l1,	%o6,	%l2
	movcs	%xcc,	%l0,	%i7
	subcc	%o5,	0x0B0D,	%g1
	movvs	%xcc,	%l6,	%o3
	restore %o2, %o4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f21,	%f7,	%f21
	orncc	%i2,	%i4,	%i5
	movpos	%icc,	%o0,	%i6
	movcc	%xcc,	%i3,	%g3
	addcc	%l4,	%i1,	%g6
	edge16	%g5,	%o1,	%g2
	addcc	%g7,	0x16D3,	%g4
	fmovrdlz	%l5,	%f4,	%f20
	lduh	[%l7 + 0x34],	%i0
	udivx	%l1,	0x04B4,	%l3
	movg	%xcc,	%o6,	%l2
	fcmps	%fcc3,	%f27,	%f4
	ldd	[%l7 + 0x18],	%f26
	alignaddrl	%l0,	%o5,	%i7
	edge16l	%l6,	%o3,	%o2
	movleu	%xcc,	%o4,	%o7
	edge32	%i2,	%i4,	%i5
	andncc	%g1,	%o0,	%i3
	fmuld8ulx16	%f5,	%f27,	%f8
	fandnot2s	%f30,	%f26,	%f5
	fandnot1s	%f14,	%f14,	%f20
	xorcc	%i6,	0x0292,	%g3
	andn	%i1,	0x19D8,	%g6
	sethi	0x16BA,	%g5
	movneg	%icc,	%o1,	%g2
	udivcc	%g7,	0x15B9,	%l4
	subc	%l5,	0x16A7,	%g4
	smul	%l1,	%i0,	%l3
	siam	0x0
	array16	%o6,	%l0,	%o5
	fones	%f2
	movle	%xcc,	%l2,	%i7
	ldd	[%l7 + 0x30],	%i6
	fmovrsgz	%o2,	%f31,	%f22
	ldd	[%l7 + 0x78],	%o4
	std	%f16,	[%l7 + 0x08]
	fnot1	%f20,	%f18
	xorcc	%o7,	%i2,	%i4
	edge8l	%o3,	%g1,	%i5
	fmovsg	%icc,	%f7,	%f10
	save %o0, 0x05BB, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%i3,	%f26,	%f10
	sdivcc	%g3,	0x11EB,	%i1
	smul	%g6,	%o1,	%g2
	srax	%g7,	0x11,	%l4
	movg	%xcc,	%g5,	%g4
	movleu	%xcc,	%l1,	%l5
	movge	%xcc,	%l3,	%i0
	stb	%l0,	[%l7 + 0x5B]
	ldsw	[%l7 + 0x70],	%o5
	alignaddrl	%o6,	%i7,	%l2
	and	%l6,	%o4,	%o7
	movpos	%icc,	%o2,	%i4
	fnot1s	%f28,	%f10
	ld	[%l7 + 0x20],	%f13
	fmovrslez	%i2,	%f29,	%f13
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	fmovdneg	%icc,	%f7,	%f2
	udivcc	%i6,	0x12B1,	%i3
	xor	%g3,	0x1414,	%i1
	array8	%o3,	%o1,	%g6
	faligndata	%f14,	%f12,	%f18
	andn	%g2,	%g7,	%l4
	mulx	%g4,	%l1,	%l5
	ld	[%l7 + 0x60],	%f21
	fmovdgu	%icc,	%f24,	%f29
	fnors	%f18,	%f0,	%f9
	sra	%l3,	0x14,	%g5
	edge32	%i0,	%l0,	%o5
	array8	%i7,	%l2,	%o6
	movge	%xcc,	%l6,	%o7
	subccc	%o4,	0x050A,	%i4
	edge32l	%i2,	%g1,	%o2
	restore %i5, %o0, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i3,	%g3,	%i1
	fmovsl	%icc,	%f22,	%f26
	sdivx	%o1,	0x1D9F,	%g6
	sub	%o3,	%g7,	%g2
	fpadd16	%f22,	%f22,	%f30
	fmul8sux16	%f14,	%f22,	%f26
	lduh	[%l7 + 0x18],	%l4
	movcs	%xcc,	%g4,	%l1
	udiv	%l3,	0x12D2,	%l5
	movcs	%icc,	%g5,	%i0
	andn	%o5,	%l0,	%i7
	sdivcc	%o6,	0x0DCD,	%l2
	nop
	set	0x23, %o2
	stb	%o7,	[%l7 + %o2]
	udivcc	%l6,	0x1D2B,	%i4
	subccc	%i2,	%g1,	%o4
	smul	%i5,	%o2,	%i6
	ldsw	[%l7 + 0x34],	%o0
	lduh	[%l7 + 0x08],	%i3
	addcc	%g3,	0x0F94,	%i1
	movge	%xcc,	%o1,	%g6
	addc	%g7,	%o3,	%g2
	ldsw	[%l7 + 0x58],	%g4
	stx	%l4,	[%l7 + 0x48]
	fmovsvs	%xcc,	%f2,	%f17
	movvs	%xcc,	%l1,	%l5
	fors	%f20,	%f22,	%f5
	fcmpgt32	%f30,	%f20,	%l3
	udivcc	%i0,	0x0575,	%g5
	and	%l0,	0x1335,	%i7
	fmovrsne	%o5,	%f13,	%f8
	ldx	[%l7 + 0x48],	%o6
	sll	%l2,	0x16,	%o7
	fmovsleu	%icc,	%f0,	%f24
	stw	%l6,	[%l7 + 0x6C]
	std	%f26,	[%l7 + 0x10]
	movvc	%icc,	%i4,	%g1
	srax	%o4,	%i5,	%o2
	movne	%icc,	%i2,	%o0
	orncc	%i6,	%g3,	%i3
	fmovd	%f0,	%f20
	fmuld8sux16	%f19,	%f21,	%f8
	lduh	[%l7 + 0x3A],	%i1
	pdist	%f0,	%f10,	%f16
	addccc	%g6,	%g7,	%o1
	move	%icc,	%o3,	%g4
	mulscc	%g2,	%l4,	%l5
	andncc	%l3,	%l1,	%i0
	move	%icc,	%l0,	%g5
	or	%o5,	0x1A76,	%i7
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	ld	[%l7 + 0x30],	%f0
	subccc	%o6,	0x0F94,	%l6
	edge32n	%g1,	%o4,	%i5
	ldsw	[%l7 + 0x7C],	%i4
	move	%xcc,	%i2,	%o0
	xorcc	%i6,	0x0B1C,	%o2
	movrlez	%i3,	0x3FA,	%g3
	edge16	%i1,	%g6,	%g7
	edge16ln	%o3,	%o1,	%g4
	fmul8x16au	%f28,	%f25,	%f16
	popc	%g2,	%l5
	array32	%l4,	%l1,	%l3
	umulcc	%l0,	0x19B0,	%g5
	ldub	[%l7 + 0x49],	%i0
	sir	0x00E8
	srl	%i7,	0x09,	%l2
	movpos	%xcc,	%o5,	%o7
	fmovdgu	%icc,	%f2,	%f30
	array32	%l6,	%g1,	%o4
	alignaddrl	%i5,	%i4,	%o6
	fnot2	%f30,	%f12
	orn	%o0,	0x0A19,	%i6
	edge16ln	%o2,	%i3,	%g3
	edge16	%i2,	%i1,	%g7
	ldsh	[%l7 + 0x42],	%g6
	orncc	%o1,	0x08AD,	%o3
	alignaddrl	%g4,	%g2,	%l4
	movn	%xcc,	%l1,	%l5
	edge32n	%l0,	%g5,	%l3
	edge8l	%i0,	%i7,	%o5
	fmovrslez	%o7,	%f20,	%f4
	sll	%l6,	%g1,	%o4
	edge8l	%i5,	%l2,	%o6
	array8	%o0,	%i6,	%i4
	restore %i3, 0x05CD, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g3,	%i1,	%i2
	for	%f2,	%f12,	%f22
	sethi	0x0445,	%g6
	save %o1, %o3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x68],	%g2
	nop
	set	0x0A, %o3
	sth	%l4,	[%l7 + %o3]
	sub	%l1,	%l5,	%g7
	movcc	%icc,	%l0,	%l3
	fmovsvc	%xcc,	%f18,	%f5
	udiv	%g5,	0x1D6E,	%i7
	fmovde	%xcc,	%f7,	%f26
	sth	%o5,	[%l7 + 0x6E]
	movn	%icc,	%o7,	%l6
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	movrlez	%i5,	%l2,	%i0
	sdivx	%o0,	0x1623,	%i6
	ldd	[%l7 + 0x18],	%i4
	movrgz	%i3,	%o6,	%g3
	fandnot2	%f10,	%f16,	%f18
	alignaddr	%o2,	%i2,	%g6
	ldx	[%l7 + 0x28],	%i1
	movrlez	%o1,	%o3,	%g4
	edge32	%g2,	%l4,	%l1
	lduh	[%l7 + 0x78],	%l5
	udivcc	%g7,	0x1A0B,	%l0
	andncc	%g5,	%i7,	%o5
	xnor	%l3,	%l6,	%g1
	andcc	%o4,	0x1B78,	%i5
	fmovsl	%icc,	%f16,	%f15
	edge16n	%o7,	%l2,	%i0
	sllx	%i6,	0x14,	%o0
	alignaddrl	%i3,	%o6,	%i4
	fmovrde	%g3,	%f12,	%f22
	mulscc	%o2,	%g6,	%i1
	movvs	%icc,	%o1,	%i2
	fcmpd	%fcc2,	%f22,	%f30
	ldd	[%l7 + 0x50],	%g4
	array32	%g2,	%l4,	%l1
	fmovdcc	%icc,	%f31,	%f23
	stb	%o3,	[%l7 + 0x15]
	fmovsge	%icc,	%f31,	%f3
	nop
	set	0x0C, %l1
	stw	%l5,	[%l7 + %l1]
	edge16l	%g7,	%g5,	%i7
	ldx	[%l7 + 0x20],	%l0
	ldd	[%l7 + 0x20],	%f30
	edge32	%o5,	%l3,	%g1
	sdiv	%l6,	0x05B8,	%o4
	srl	%i5,	0x16,	%o7
	mova	%icc,	%l2,	%i0
	movcs	%xcc,	%i6,	%o0
	movrlez	%o6,	0x10D,	%i3
	fexpand	%f16,	%f4
	ldsw	[%l7 + 0x0C],	%i4
	fmovrsgez	%o2,	%f25,	%f15
	udivcc	%g6,	0x0871,	%i1
	fcmpgt16	%f14,	%f20,	%g3
	bshuffle	%f26,	%f16,	%f8
	movre	%o1,	%g4,	%g2
	sdivx	%l4,	0x1A81,	%l1
	array32	%i2,	%o3,	%g7
	fnand	%f6,	%f28,	%f22
	movpos	%xcc,	%l5,	%i7
	fmovrde	%g5,	%f10,	%f4
	add	%l0,	0x121E,	%l3
	nop
	set	0x50, %o4
	stw	%g1,	[%l7 + %o4]
	lduh	[%l7 + 0x4C],	%l6
	fcmps	%fcc1,	%f3,	%f3
	fxor	%f4,	%f2,	%f28
	edge16n	%o5,	%i5,	%o4
	xorcc	%l2,	%o7,	%i0
	movvc	%xcc,	%i6,	%o0
	smul	%i3,	0x1F22,	%i4
	xnor	%o6,	%o2,	%g6
	fmovde	%xcc,	%f20,	%f13
	alignaddr	%i1,	%o1,	%g3
	sub	%g4,	%g2,	%l4
	fnot2	%f12,	%f4
	stx	%l1,	[%l7 + 0x70]
	movrlz	%i2,	0x158,	%o3
	andncc	%g7,	%l5,	%i7
	addcc	%g5,	%l0,	%g1
	fandnot2s	%f5,	%f3,	%f24
	fmovrsgez	%l6,	%f2,	%f2
	sdivx	%l3,	0x109E,	%o5
	movle	%xcc,	%o4,	%i5
	xor	%o7,	%i0,	%i6
	fmovdge	%xcc,	%f10,	%f27
	fandnot1	%f4,	%f22,	%f10
	and	%o0,	0x0423,	%l2
	and	%i4,	%i3,	%o2
	fmul8x16	%f20,	%f22,	%f26
	fmovsge	%xcc,	%f11,	%f13
	lduw	[%l7 + 0x38],	%o6
	fmuld8sux16	%f0,	%f4,	%f8
	edge32l	%g6,	%o1,	%i1
	fmovdge	%xcc,	%f26,	%f27
	fandnot1s	%f28,	%f26,	%f13
	movcc	%icc,	%g3,	%g2
	mulscc	%l4,	%g4,	%i2
	fmovrdlz	%o3,	%f26,	%f0
	edge16	%g7,	%l1,	%l5
	edge32l	%i7,	%g5,	%l0
	fsrc1	%f10,	%f14
	umulcc	%g1,	0x1638,	%l3
	ldsw	[%l7 + 0x48],	%o5
	edge8l	%o4,	%i5,	%l6
	movleu	%icc,	%o7,	%i6
	edge32ln	%o0,	%l2,	%i4
	andcc	%i0,	0x19F3,	%i3
	sethi	0x1B94,	%o2
	sethi	0x19FA,	%g6
	mulx	%o6,	%i1,	%o1
	movne	%xcc,	%g2,	%l4
	alignaddrl	%g3,	%i2,	%g4
	umulcc	%o3,	0x0D14,	%l1
	umul	%g7,	%i7,	%l5
	ldd	[%l7 + 0x60],	%f18
	fmovdvc	%icc,	%f10,	%f2
	addccc	%g5,	0x1F07,	%l0
	ldub	[%l7 + 0x2A],	%l3
	array16	%g1,	%o4,	%o5
	popc	0x1FD6,	%i5
	edge32	%l6,	%o7,	%i6
	popc	%l2,	%o0
	movcc	%icc,	%i4,	%i3
	save %i0, 0x1C32, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x14],	%g6
	fabsd	%f26,	%f12
	sra	%o6,	%o1,	%g2
	array16	%l4,	%g3,	%i1
	addcc	%g4,	%o3,	%l1
	edge16ln	%i2,	%i7,	%l5
	udivcc	%g7,	0x0AED,	%g5
	array8	%l3,	%g1,	%l0
	fexpand	%f23,	%f20
	sir	0x04C7
	edge32ln	%o4,	%i5,	%o5
	movrgz	%l6,	%i6,	%l2
	movle	%icc,	%o7,	%i4
	movgu	%icc,	%i3,	%i0
	movge	%icc,	%o2,	%g6
	mulscc	%o0,	%o1,	%g2
	andncc	%o6,	%l4,	%g3
	fmovsleu	%xcc,	%f12,	%f26
	sdivx	%i1,	0x1EDC,	%g4
	movvs	%icc,	%l1,	%i2
	movl	%xcc,	%o3,	%l5
	fmovdvs	%icc,	%f21,	%f16
	movcs	%icc,	%g7,	%i7
	movrgez	%g5,	%l3,	%l0
	subccc	%g1,	0x0897,	%i5
	ldd	[%l7 + 0x78],	%f24
	sub	%o5,	0x063D,	%l6
	sllx	%o4,	%l2,	%i6
	movneg	%icc,	%i4,	%o7
	fcmpgt32	%f12,	%f2,	%i3
	movge	%icc,	%o2,	%i0
	fandnot1s	%f18,	%f21,	%f18
	sra	%o0,	%o1,	%g6
	orncc	%g2,	%o6,	%g3
	movn	%icc,	%l4,	%g4
	addc	%l1,	%i2,	%i1
	umul	%o3,	0x1C6E,	%l5
	orcc	%g7,	%g5,	%l3
	andn	%l0,	0x09CE,	%g1
	udivcc	%i7,	0x0105,	%i5
	edge32	%l6,	%o5,	%o4
	movleu	%xcc,	%l2,	%i6
	xor	%i4,	%i3,	%o7
	sir	0x06EE
	edge8	%i0,	%o0,	%o2
	edge32	%g6,	%g2,	%o6
	sllx	%o1,	%g3,	%g4
	movge	%icc,	%l1,	%i2
	subc	%l4,	0x00BD,	%i1
	fnand	%f10,	%f6,	%f20
	mova	%icc,	%o3,	%l5
	nop
	set	0x69, %g4
	ldub	[%l7 + %g4],	%g7
	stw	%l3,	[%l7 + 0x44]
	movge	%icc,	%g5,	%g1
	movre	%l0,	0x22C,	%i7
	movvc	%icc,	%l6,	%o5
	ldsw	[%l7 + 0x24],	%o4
	fxors	%f24,	%f25,	%f1
	fnot2s	%f1,	%f31
	fnot1s	%f24,	%f29
	addcc	%l2,	0x0994,	%i6
	addc	%i4,	0x1A89,	%i5
	movre	%i3,	%o7,	%i0
	movn	%xcc,	%o0,	%g6
	xorcc	%o2,	%o6,	%o1
	andcc	%g3,	%g4,	%g2
	restore %l1, %l4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i1,	0x16C1,	%l5
	subcc	%g7,	%o3,	%l3
	fmovsg	%icc,	%f4,	%f19
	srl	%g1,	0x00,	%g5
	ld	[%l7 + 0x08],	%f10
	addc	%i7,	%l0,	%l6
	edge32ln	%o5,	%o4,	%i6
	fmovdpos	%xcc,	%f8,	%f8
	fcmpgt32	%f0,	%f18,	%i4
	movg	%xcc,	%l2,	%i5
	movre	%i3,	0x21B,	%o7
	movrne	%o0,	0x092,	%g6
	and	%i0,	%o2,	%o6
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%f22
	fmul8x16au	%f11,	%f22,	%f28
	fnot1	%f0,	%f6
	srlx	%o1,	%g3,	%g2
	std	%f30,	[%l7 + 0x50]
	fmovsg	%icc,	%f27,	%f29
	fzero	%f6
	srl	%l1,	%l4,	%i2
	sllx	%i1,	%l5,	%g7
	udivx	%o3,	0x136C,	%g4
	ldd	[%l7 + 0x48],	%f6
	stx	%l3,	[%l7 + 0x70]
	addc	%g5,	%i7,	%g1
	sth	%l0,	[%l7 + 0x0C]
	andn	%l6,	%o4,	%o5
	movrlz	%i6,	%i4,	%l2
	edge16l	%i3,	%o7,	%i5
	movcc	%icc,	%g6,	%i0
	fmul8x16al	%f30,	%f23,	%f10
	addcc	%o0,	%o6,	%o2
	srlx	%o1,	0x0E,	%g2
	movne	%icc,	%l1,	%l4
	nop
	set	0x72, %i2
	sth	%g3,	[%l7 + %i2]
	array16	%i1,	%i2,	%l5
	movre	%g7,	%g4,	%l3
	movcs	%xcc,	%g5,	%i7
	movrlez	%o3,	%l0,	%l6
	smulcc	%g1,	%o4,	%o5
	movg	%xcc,	%i4,	%l2
	edge16	%i3,	%o7,	%i6
	orcc	%i5,	%i0,	%g6
	stb	%o6,	[%l7 + 0x47]
	addccc	%o0,	0x1001,	%o1
	fcmpgt32	%f26,	%f6,	%o2
	udivcc	%g2,	0x1481,	%l1
	andn	%l4,	%i1,	%g3
	fcmpd	%fcc3,	%f16,	%f20
	save %i2, %l5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g4,	0x0726,	%g5
	fmuld8sux16	%f28,	%f28,	%f12
	fmovdpos	%icc,	%f10,	%f17
	fmovs	%f5,	%f4
	edge32ln	%i7,	%l3,	%l0
	movrgez	%o3,	%l6,	%o4
	fmovsvc	%xcc,	%f22,	%f0
	fmovdg	%xcc,	%f4,	%f14
	xnorcc	%g1,	%o5,	%i4
	movrne	%i3,	%o7,	%i6
	fmovrse	%l2,	%f25,	%f5
	movvc	%xcc,	%i0,	%i5
	subc	%g6,	%o6,	%o1
	fandnot2	%f24,	%f16,	%f0
	fmovsn	%xcc,	%f10,	%f9
	fornot1s	%f1,	%f12,	%f30
	xorcc	%o2,	0x1CD9,	%o0
	movge	%xcc,	%l1,	%g2
	fpsub32s	%f6,	%f3,	%f3
	std	%f14,	[%l7 + 0x10]
	ld	[%l7 + 0x60],	%f18
	ldsb	[%l7 + 0x6D],	%i1
	fzero	%f24
	st	%f11,	[%l7 + 0x4C]
	fandnot1s	%f31,	%f6,	%f18
	sth	%g3,	[%l7 + 0x6C]
	fmul8ulx16	%f22,	%f4,	%f8
	mulx	%i2,	%l5,	%g7
	for	%f16,	%f30,	%f4
	sub	%g4,	%l4,	%i7
	subcc	%l3,	%g5,	%o3
	movleu	%xcc,	%l6,	%o4
	ldx	[%l7 + 0x18],	%g1
	fmovsge	%icc,	%f17,	%f14
	movn	%xcc,	%o5,	%l0
	edge8l	%i4,	%o7,	%i3
	sdivcc	%i6,	0x1D43,	%l2
	fmovdneg	%icc,	%f9,	%f17
	ld	[%l7 + 0x08],	%f17
	edge16ln	%i5,	%g6,	%o6
	edge32n	%o1,	%i0,	%o2
	fxnors	%f29,	%f5,	%f18
	edge16ln	%o0,	%g2,	%l1
	sllx	%i1,	0x1B,	%i2
	fandnot2s	%f21,	%f14,	%f0
	xnor	%g3,	%g7,	%g4
	ldub	[%l7 + 0x5D],	%l5
	movleu	%xcc,	%l4,	%l3
	addcc	%i7,	%g5,	%o3
	edge8	%o4,	%g1,	%o5
	edge16	%l0,	%i4,	%o7
	sdiv	%l6,	0x08A2,	%i6
	xor	%i3,	0x0190,	%i5
	edge8	%g6,	%l2,	%o6
	sra	%i0,	0x12,	%o2
	fmovdvs	%icc,	%f8,	%f29
	umul	%o1,	0x1CB0,	%g2
	fcmpes	%fcc3,	%f6,	%f11
	alignaddr	%o0,	%l1,	%i2
	movvs	%xcc,	%i1,	%g7
	ldsw	[%l7 + 0x7C],	%g3
	movle	%icc,	%l5,	%g4
	ldx	[%l7 + 0x60],	%l3
	fmul8sux16	%f4,	%f24,	%f6
	ldsb	[%l7 + 0x28],	%l4
	fabsd	%f30,	%f24
	movg	%xcc,	%g5,	%i7
	fpadd16s	%f10,	%f17,	%f30
	fmovspos	%xcc,	%f24,	%f26
	addccc	%o3,	%g1,	%o4
	for	%f24,	%f0,	%f10
	movcc	%xcc,	%l0,	%o5
	movl	%xcc,	%i4,	%o7
	popc	0x0DE9,	%l6
	sdivcc	%i6,	0x0AAC,	%i3
	popc	0x1EBA,	%g6
	lduh	[%l7 + 0x50],	%i5
	srlx	%o6,	%i0,	%o2
	smulcc	%o1,	%g2,	%l2
	fmovsvs	%xcc,	%f28,	%f2
	stb	%l1,	[%l7 + 0x63]
	movcs	%xcc,	%o0,	%i1
	fmovdn	%xcc,	%f21,	%f24
	addcc	%i2,	%g7,	%l5
	andcc	%g4,	0x06D4,	%l3
	movg	%icc,	%g3,	%l4
	stw	%g5,	[%l7 + 0x50]
	andncc	%o3,	%i7,	%o4
	fmovsa	%icc,	%f31,	%f0
	mulscc	%g1,	%l0,	%o5
	movrlez	%i4,	0x0C2,	%o7
	edge8ln	%i6,	%l6,	%g6
	edge16n	%i3,	%i5,	%o6
	andncc	%o2,	%o1,	%i0
	array8	%g2,	%l1,	%o0
	edge32ln	%i1,	%i2,	%g7
	popc	%l2,	%g4
	fandnot1s	%f19,	%f30,	%f8
	nop
	set	0x50, %o5
	std	%f4,	[%l7 + %o5]
	movrgez	%l5,	0x3CD,	%g3
	movvc	%icc,	%l4,	%g5
	movn	%icc,	%o3,	%l3
	std	%f30,	[%l7 + 0x60]
	udivx	%i7,	0x1942,	%o4
	lduw	[%l7 + 0x2C],	%l0
	mulx	%g1,	%i4,	%o5
	lduh	[%l7 + 0x6C],	%i6
	movl	%xcc,	%l6,	%g6
	movcs	%icc,	%i3,	%o7
	ldd	[%l7 + 0x78],	%f10
	fmovsa	%icc,	%f23,	%f7
	mulx	%i5,	0x0280,	%o6
	andcc	%o2,	%i0,	%g2
	movvs	%icc,	%o1,	%l1
	fors	%f15,	%f3,	%f29
	edge32	%i1,	%o0,	%g7
	ldsb	[%l7 + 0x5F],	%l2
	movg	%xcc,	%g4,	%i2
	add	%g3,	%l5,	%g5
	fmovrslez	%l4,	%f22,	%f26
	movn	%icc,	%o3,	%i7
	udiv	%l3,	0x07D9,	%o4
	movrgez	%g1,	0x3F2,	%i4
	nop
	set	0x50, %o1
	stx	%o5,	[%l7 + %o1]
	addc	%l0,	%l6,	%g6
	sdivcc	%i3,	0x025F,	%o7
	fpadd32s	%f5,	%f20,	%f27
	alignaddr	%i5,	%o6,	%i6
	st	%f12,	[%l7 + 0x0C]
	movcc	%xcc,	%i0,	%o2
	stw	%g2,	[%l7 + 0x74]
	xnorcc	%o1,	0x1BE4,	%l1
	fmul8ulx16	%f22,	%f16,	%f28
	popc	%i1,	%g7
	edge32l	%o0,	%l2,	%g4
	edge32l	%g3,	%l5,	%i2
	sth	%l4,	[%l7 + 0x1E]
	fzero	%f16
	lduw	[%l7 + 0x0C],	%g5
	mulscc	%o3,	0x0F95,	%l3
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	mulscc	%o5,	0x1708,	%l0
	movrlez	%i7,	0x041,	%g6
	sdiv	%l6,	0x1722,	%i3
	save %i5, %o7, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i6,	[%l7 + 0x10]
	array8	%o2,	%g2,	%o1
	sethi	0x021E,	%i0
	subc	%l1,	%i1,	%o0
	sra	%l2,	0x06,	%g7
	fsrc2	%f24,	%f8
	movn	%icc,	%g4,	%l5
	sllx	%g3,	%l4,	%g5
	popc	%o3,	%i2
	srl	%l3,	0x08,	%g1
	movrlez	%i4,	0x03A,	%o5
	edge32	%l0,	%i7,	%o4
	fpsub32s	%f12,	%f2,	%f1
	save %g6, %l6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i5,	0x0A76,	%o6
	xnor	%o7,	0x0C2D,	%o2
	subccc	%g2,	0x02C1,	%i6
	and	%i0,	0x0910,	%o1
	std	%f8,	[%l7 + 0x18]
	subc	%l1,	%o0,	%l2
	st	%f22,	[%l7 + 0x34]
	fmuld8ulx16	%f6,	%f24,	%f22
	fmovsne	%icc,	%f1,	%f13
	umul	%g7,	0x0650,	%g4
	fone	%f18
	fornot1s	%f1,	%f27,	%f31
	alignaddr	%i1,	%g3,	%l4
	fcmpne16	%f14,	%f2,	%l5
	orn	%g5,	%o3,	%l3
	movgu	%icc,	%g1,	%i4
	ldsb	[%l7 + 0x32],	%i2
	xorcc	%l0,	0x14A3,	%o5
	edge8ln	%i7,	%g6,	%l6
	udiv	%o4,	0x131E,	%i5
	stb	%o6,	[%l7 + 0x5A]
	lduw	[%l7 + 0x14],	%i3
	move	%xcc,	%o2,	%o7
	edge8	%g2,	%i0,	%i6
	movn	%xcc,	%o1,	%l1
	sethi	0x0D9E,	%l2
	ldsh	[%l7 + 0x58],	%g7
	ldsb	[%l7 + 0x13],	%g4
	stw	%o0,	[%l7 + 0x64]
	xorcc	%i1,	0x0110,	%l4
	sdivcc	%l5,	0x0082,	%g3
	movle	%xcc,	%g5,	%l3
	ld	[%l7 + 0x5C],	%f13
	ldd	[%l7 + 0x20],	%f20
	movle	%xcc,	%g1,	%o3
	edge16ln	%i2,	%i4,	%l0
	movrgz	%i7,	%g6,	%o5
	xnorcc	%o4,	%l6,	%i5
	ld	[%l7 + 0x34],	%f22
	fmovrdgez	%i3,	%f6,	%f20
	add	%o6,	%o7,	%g2
	fcmps	%fcc2,	%f3,	%f14
	andcc	%o2,	%i0,	%o1
	sth	%i6,	[%l7 + 0x22]
	fmul8x16al	%f26,	%f31,	%f28
	fornot1	%f6,	%f2,	%f28
	movleu	%xcc,	%l2,	%l1
	ldd	[%l7 + 0x50],	%f12
	movrlz	%g4,	0x2A7,	%o0
	ldsb	[%l7 + 0x4B],	%i1
	srlx	%g7,	%l4,	%g3
	xorcc	%l5,	0x0C41,	%l3
	fnot2s	%f18,	%f31
	addccc	%g5,	0x026F,	%g1
	edge32	%o3,	%i2,	%l0
	sub	%i4,	0x1086,	%i7
	ldd	[%l7 + 0x28],	%f10
	subc	%g6,	%o5,	%l6
	ldsw	[%l7 + 0x74],	%o4
	fmovda	%xcc,	%f14,	%f7
	ld	[%l7 + 0x08],	%f22
	fcmpeq16	%f8,	%f22,	%i3
	fmovdcc	%xcc,	%f18,	%f8
	sub	%i5,	0x1787,	%o6
	movre	%g2,	%o2,	%o7
	fmovrdlz	%i0,	%f24,	%f22
	fsrc1s	%f22,	%f11
	srlx	%o1,	0x01,	%l2
	movrgez	%l1,	0x3C9,	%i6
	mova	%icc,	%g4,	%o0
	stb	%i1,	[%l7 + 0x10]
	movvs	%xcc,	%g7,	%g3
	sdivcc	%l5,	0x0FE1,	%l4
	movrlz	%g5,	%g1,	%o3
	array32	%i2,	%l0,	%l3
	move	%xcc,	%i7,	%i4
	fmuld8ulx16	%f23,	%f8,	%f26
	smul	%g6,	0x00FB,	%l6
	movrgz	%o5,	0x2F8,	%o4
	fmovsgu	%icc,	%f2,	%f3
	addcc	%i3,	0x0E95,	%i5
	ldub	[%l7 + 0x0E],	%g2
	movcs	%xcc,	%o6,	%o2
	movcs	%icc,	%i0,	%o1
	restore %o7, %l2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g4,	%o0
	sir	0x07B9
	or	%i1,	%i6,	%g3
	movrlez	%l5,	0x33C,	%g7
	array16	%g5,	%l4,	%o3
	umulcc	%i2,	0x13D3,	%l0
	fcmped	%fcc0,	%f30,	%f22
	mova	%icc,	%g1,	%i7
	ldd	[%l7 + 0x40],	%i4
	srl	%g6,	%l3,	%o5
	fmovdl	%xcc,	%f3,	%f28
	edge16	%l6,	%o4,	%i5
	fsrc2s	%f4,	%f2
	st	%f13,	[%l7 + 0x2C]
	nop
	set	0x64, %i6
	sth	%i3,	[%l7 + %i6]
	ldd	[%l7 + 0x10],	%o6
	edge32l	%o2,	%g2,	%i0
	fmovdpos	%xcc,	%f10,	%f24
	xorcc	%o7,	0x036C,	%l2
	movneg	%icc,	%l1,	%o1
	nop
	set	0x4A, %i5
	lduh	[%l7 + %i5],	%o0
	fnot2s	%f31,	%f9
	edge8n	%i1,	%i6,	%g3
	fornot2s	%f14,	%f21,	%f28
	fcmple16	%f2,	%f16,	%g4
	fmovsne	%icc,	%f8,	%f4
	edge8	%g7,	%g5,	%l4
	movvc	%xcc,	%l5,	%o3
	orncc	%l0,	0x186D,	%g1
	fone	%f18
	edge8n	%i2,	%i7,	%g6
	srlx	%i4,	0x09,	%l3
	edge8ln	%l6,	%o4,	%i5
	ldub	[%l7 + 0x64],	%o5
	fmovspos	%icc,	%f1,	%f5
	fandnot1s	%f18,	%f14,	%f31
	nop
	set	0x46, %i4
	ldub	[%l7 + %i4],	%o6
	popc	%i3,	%g2
	movn	%icc,	%o2,	%o7
	movpos	%xcc,	%i0,	%l2
	faligndata	%f20,	%f12,	%f22
	udiv	%o1,	0x011B,	%l1
	movne	%xcc,	%o0,	%i6
	umulcc	%g3,	%g4,	%i1
	addcc	%g5,	%g7,	%l5
	fpmerge	%f7,	%f20,	%f6
	sth	%l4,	[%l7 + 0x1A]
	edge8	%l0,	%o3,	%g1
	sll	%i7,	0x0B,	%g6
	fsrc1s	%f26,	%f18
	fmovspos	%icc,	%f2,	%f23
	fmovsg	%xcc,	%f27,	%f18
	movg	%xcc,	%i2,	%i4
	movvs	%xcc,	%l6,	%o4
	ldsb	[%l7 + 0x79],	%l3
	sdivcc	%o5,	0x0461,	%o6
	array16	%i5,	%i3,	%g2
	fpsub16s	%f30,	%f20,	%f9
	sub	%o2,	0x19C0,	%o7
	srlx	%i0,	0x1B,	%o1
	orcc	%l1,	0x08A5,	%o0
	edge16	%l2,	%i6,	%g4
	array32	%i1,	%g5,	%g3
	ldub	[%l7 + 0x74],	%l5
	edge16ln	%l4,	%l0,	%g7
	add	%g1,	%o3,	%g6
	stx	%i7,	[%l7 + 0x48]
	mulscc	%i4,	0x156B,	%l6
	xnorcc	%o4,	0x0CAA,	%i2
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	subccc	%i3,	%i5,	%g2
	edge32ln	%o2,	%i0,	%o1
	movpos	%icc,	%o7,	%l1
	add	%o0,	0x1F5B,	%i6
	movvs	%xcc,	%l2,	%i1
	andcc	%g4,	%g3,	%l5
	subccc	%l4,	%g5,	%g7
	umul	%l0,	%g1,	%g6
	subcc	%i7,	0x1E8F,	%i4
	smul	%l6,	0x1135,	%o3
	fors	%f8,	%f12,	%f13
	sllx	%i2,	0x07,	%o4
	ldub	[%l7 + 0x26],	%o6
	movvc	%xcc,	%l3,	%i3
	orncc	%o5,	0x1DDB,	%g2
	std	%f18,	[%l7 + 0x50]
	andncc	%o2,	%i0,	%o1
	nop
	set	0x40, %g2
	lduw	[%l7 + %g2],	%i5
	addc	%l1,	0x1DDE,	%o7
	movvs	%icc,	%o0,	%i6
	andcc	%l2,	%g4,	%i1
	and	%l5,	%g3,	%l4
	sethi	0x136F,	%g5
	addccc	%g7,	0x0B54,	%g1
	ldsb	[%l7 + 0x32],	%g6
	fmul8x16	%f14,	%f30,	%f26
	edge8l	%l0,	%i7,	%i4
	ldsb	[%l7 + 0x17],	%l6
	alignaddrl	%i2,	%o4,	%o6
	save %o3, 0x1364, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l3,	%g2,	%o5
	fnegs	%f16,	%f31
	movpos	%icc,	%i0,	%o2
	fone	%f2
	sir	0x17DF
	nop
	set	0x08, %o0
	std	%f28,	[%l7 + %o0]
	movge	%icc,	%o1,	%l1
	bshuffle	%f28,	%f28,	%f0
	umul	%o7,	%i5,	%o0
	sra	%i6,	0x1F,	%l2
	sllx	%i1,	%g4,	%l5
	sir	0x1073
	smulcc	%l4,	0x1635,	%g5
	udivcc	%g7,	0x0D7F,	%g3
	add	%g1,	0x1C7D,	%g6
	stb	%i7,	[%l7 + 0x79]
	edge8	%i4,	%l0,	%l6
	movvs	%xcc,	%i2,	%o6
	xor	%o3,	0x0992,	%o4
	movre	%i3,	%l3,	%g2
	or	%o5,	0x1A70,	%o2
	fcmpeq32	%f26,	%f28,	%i0
	alignaddrl	%l1,	%o1,	%i5
	lduh	[%l7 + 0x4C],	%o7
	ldub	[%l7 + 0x3D],	%i6
	umulcc	%l2,	0x1B43,	%o0
	xnor	%g4,	0x0171,	%i1
	addcc	%l4,	%g5,	%l5
	edge16	%g7,	%g1,	%g3
	movvs	%icc,	%g6,	%i4
	movcs	%xcc,	%l0,	%l6
	xorcc	%i2,	%o6,	%i7
	fand	%f14,	%f26,	%f2
	edge32ln	%o4,	%o3,	%l3
	stb	%i3,	[%l7 + 0x5B]
	fmovsleu	%xcc,	%f16,	%f19
	ld	[%l7 + 0x0C],	%f18
	edge16	%g2,	%o5,	%i0
	fmovrdgz	%l1,	%f30,	%f6
	umulcc	%o2,	%i5,	%o7
	sdivcc	%o1,	0x11B6,	%l2
	mova	%icc,	%i6,	%g4
	subc	%o0,	%l4,	%i1
	edge16	%l5,	%g7,	%g1
	stw	%g3,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%g6
	lduh	[%l7 + 0x7C],	%i4
	fnegd	%f8,	%f4
	orcc	%l0,	%l6,	%g5
	mova	%icc,	%o6,	%i2
	lduh	[%l7 + 0x0E],	%o4
	addccc	%i7,	%l3,	%o3
	orncc	%g2,	%i3,	%o5
	ldub	[%l7 + 0x55],	%i0
	lduh	[%l7 + 0x18],	%o2
	fmovsge	%xcc,	%f18,	%f2
	mova	%icc,	%i5,	%l1
	movre	%o7,	0x1E8,	%l2
	xor	%o1,	0x091A,	%g4
	smul	%i6,	%l4,	%o0
	fmul8x16al	%f1,	%f31,	%f30
	movneg	%xcc,	%l5,	%g7
	fmuld8sux16	%f13,	%f26,	%f16
	movcc	%xcc,	%i1,	%g1
	movneg	%xcc,	%g6,	%i4
	fmovdcs	%xcc,	%f5,	%f5
	smul	%l0,	%l6,	%g3
	sub	%g5,	0x104B,	%i2
	movge	%icc,	%o4,	%o6
	save %i7, %o3, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l3,	%o5,	%i3
	fmovrdlz	%i0,	%f10,	%f2
	fxors	%f10,	%f13,	%f14
	edge8ln	%o2,	%l1,	%i5
	andcc	%l2,	0x1299,	%o1
	edge8l	%o7,	%i6,	%l4
	edge32n	%o0,	%l5,	%g7
	subccc	%i1,	0x1C7D,	%g4
	movg	%icc,	%g6,	%g1
	fmovd	%f0,	%f12
	movrlez	%i4,	0x209,	%l0
	subccc	%l6,	0x1661,	%g5
	smulcc	%i2,	0x0BFF,	%o4
	sdivcc	%g3,	0x1CB3,	%i7
	fmovdg	%xcc,	%f25,	%f10
	srl	%o3,	%o6,	%g2
	mova	%xcc,	%o5,	%l3
	sll	%i3,	%o2,	%i0
	lduw	[%l7 + 0x10],	%l1
	umul	%i5,	0x05FD,	%l2
	movle	%xcc,	%o1,	%i6
	sir	0x1C13
	fcmps	%fcc3,	%f30,	%f2
	sth	%l4,	[%l7 + 0x66]
	ldd	[%l7 + 0x38],	%f12
	fnor	%f16,	%f18,	%f16
	sllx	%o0,	%l5,	%g7
	movrgz	%i1,	0x3EF,	%o7
	and	%g6,	%g1,	%i4
	xor	%g4,	%l0,	%l6
	movrgez	%i2,	%g5,	%g3
	fnors	%f29,	%f4,	%f10
	mulx	%i7,	0x1F55,	%o3
	fpadd16	%f24,	%f2,	%f12
	movleu	%icc,	%o6,	%o4
	alignaddr	%g2,	%l3,	%o5
	nop
	set	0x60, %g5
	stx	%o2,	[%l7 + %g5]
	fxor	%f18,	%f24,	%f14
	subcc	%i0,	0x1B17,	%i3
	fnegd	%f14,	%f24
	mulx	%i5,	0x031D,	%l1
	andcc	%o1,	%l2,	%i6
	fmovrslz	%l4,	%f17,	%f18
	std	%f12,	[%l7 + 0x08]
	andncc	%l5,	%o0,	%i1
	movrgez	%g7,	0x3F9,	%o7
	sllx	%g1,	0x18,	%g6
	fandnot1s	%f8,	%f25,	%f21
	fmovdgu	%xcc,	%f14,	%f21
	edge16l	%i4,	%g4,	%l6
	fornot2	%f14,	%f24,	%f20
	mulscc	%i2,	0x03BE,	%l0
	sll	%g5,	%i7,	%o3
	xor	%g3,	%o4,	%o6
	std	%f0,	[%l7 + 0x68]
	restore %g2, 0x1F5A, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o5,	0x344,	%o2
	array8	%i0,	%i3,	%i5
	subccc	%l1,	%o1,	%i6
	movn	%xcc,	%l4,	%l5
	fandnot2	%f4,	%f12,	%f18
	fpsub16	%f0,	%f18,	%f22
	edge8l	%l2,	%i1,	%o0
	movrlez	%o7,	%g7,	%g1
	stx	%i4,	[%l7 + 0x60]
	fmovdne	%icc,	%f4,	%f8
	mulx	%g6,	%g4,	%i2
	orcc	%l0,	%g5,	%i7
	fmovrdne	%l6,	%f18,	%f26
	edge32ln	%g3,	%o4,	%o6
	sth	%o3,	[%l7 + 0x74]
	array16	%g2,	%o5,	%l3
	movn	%xcc,	%i0,	%o2
	udivx	%i3,	0x1DC2,	%l1
	fpadd32	%f4,	%f18,	%f18
	subccc	%o1,	0x08B1,	%i5
	stw	%i6,	[%l7 + 0x28]
	xnorcc	%l4,	%l2,	%i1
	array16	%o0,	%l5,	%g7
	edge16n	%o7,	%g1,	%g6
	movn	%xcc,	%g4,	%i2
	edge8l	%l0,	%g5,	%i7
	std	%f10,	[%l7 + 0x18]
	orncc	%i4,	0x14FB,	%g3
	fornot2s	%f14,	%f20,	%f10
	sdivcc	%l6,	0x0ED1,	%o6
	std	%f12,	[%l7 + 0x68]
	sllx	%o3,	%o4,	%o5
	save %g2, 0x19BD, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l3,	%o2,	%i3
	sethi	0x1B3E,	%l1
	edge8l	%o1,	%i6,	%i5
	fmovscs	%xcc,	%f17,	%f2
	popc	0x1B34,	%l4
	fmovsge	%icc,	%f16,	%f3
	stb	%l2,	[%l7 + 0x4B]
	movleu	%xcc,	%o0,	%i1
	addccc	%g7,	%l5,	%g1
	fsrc2	%f2,	%f6
	fmovdcc	%icc,	%f30,	%f11
	stx	%o7,	[%l7 + 0x28]
	fmovse	%xcc,	%f9,	%f15
	lduw	[%l7 + 0x48],	%g6
	fmovrslz	%i2,	%f10,	%f24
	sdiv	%g4,	0x08EE,	%l0
	fornot1s	%f5,	%f1,	%f16
	stb	%i7,	[%l7 + 0x7F]
	edge16l	%i4,	%g5,	%g3
	andn	%o6,	0x0676,	%l6
	save %o4, 0x18C2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f5,	[%l7 + 0x38]
	edge16ln	%o5,	%i0,	%g2
	movgu	%xcc,	%o2,	%i3
	srlx	%l3,	%l1,	%i6
	movgu	%xcc,	%i5,	%l4
	alignaddr	%o1,	%o0,	%i1
	addccc	%g7,	%l5,	%g1
	edge8ln	%l2,	%o7,	%g6
	fmovdvc	%xcc,	%f14,	%f23
	move	%icc,	%i2,	%g4
	fcmpgt16	%f6,	%f6,	%i7
	movrlz	%i4,	%l0,	%g3
	xor	%o6,	0x03D9,	%g5
	sll	%l6,	%o3,	%o5
	add	%i0,	0x1BC1,	%o4
	fmovdvc	%xcc,	%f26,	%f6
	edge32l	%o2,	%g2,	%i3
	fpsub32	%f2,	%f22,	%f12
	sethi	0x1AB8,	%l3
	edge16l	%i6,	%i5,	%l1
	sll	%l4,	%o1,	%i1
	alignaddrl	%o0,	%l5,	%g7
	movrlz	%l2,	0x2AC,	%o7
	array8	%g6,	%i2,	%g1
	movrgz	%i7,	0x05F,	%g4
	movge	%icc,	%i4,	%l0
	movrlez	%g3,	%o6,	%l6
	movn	%xcc,	%g5,	%o3
	movg	%icc,	%i0,	%o5
	fmovsneg	%icc,	%f26,	%f14
	sub	%o4,	0x0D47,	%g2
	subcc	%i3,	%o2,	%l3
	udivx	%i6,	0x14CE,	%i5
	xnor	%l1,	0x168A,	%l4
	st	%f22,	[%l7 + 0x68]
	st	%f20,	[%l7 + 0x24]
	srax	%o1,	0x1E,	%i1
	sdivcc	%o0,	0x167F,	%l5
	addcc	%l2,	%g7,	%o7
	ldd	[%l7 + 0x08],	%i2
	movg	%xcc,	%g1,	%i7
	and	%g6,	0x07FD,	%i4
	fmovsn	%xcc,	%f8,	%f18
	mova	%xcc,	%l0,	%g4
	sth	%g3,	[%l7 + 0x34]
	sth	%o6,	[%l7 + 0x54]
	subcc	%g5,	0x179A,	%l6
	popc	%o3,	%o5
	edge8n	%o4,	%g2,	%i0
	fnot2	%f4,	%f16
	stw	%o2,	[%l7 + 0x24]
	smulcc	%l3,	0x125B,	%i6
	subccc	%i3,	0x0EB5,	%i5
	save %l1, 0x1FB6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i1,	%o0,	%l4
	edge8ln	%l5,	%g7,	%o7
	fcmpne32	%f16,	%f4,	%l2
	addc	%i2,	0x1C6B,	%i7
	addcc	%g6,	0x1F7F,	%g1
	movrne	%l0,	%g4,	%g3
	fmovdcs	%icc,	%f21,	%f23
	fmuld8ulx16	%f28,	%f16,	%f26
	movrne	%i4,	%g5,	%o6
	ldsh	[%l7 + 0x2A],	%o3
	fandnot2s	%f26,	%f2,	%f9
	mulscc	%o5,	0x189C,	%l6
	andcc	%o4,	0x1CB6,	%g2
	edge32n	%o2,	%i0,	%l3
	fcmpd	%fcc3,	%f24,	%f14
	array16	%i3,	%i5,	%l1
	edge8	%i6,	%o1,	%i1
	edge8	%o0,	%l5,	%g7
	array32	%l4,	%o7,	%l2
	array8	%i2,	%g6,	%g1
	movcs	%icc,	%l0,	%i7
	array16	%g3,	%i4,	%g4
	move	%icc,	%o6,	%g5
	edge16	%o5,	%o3,	%l6
	movne	%xcc,	%g2,	%o4
	fnot2s	%f6,	%f19
	fcmpd	%fcc1,	%f20,	%f12
	fmovscc	%xcc,	%f6,	%f14
	move	%icc,	%o2,	%i0
	movleu	%xcc,	%l3,	%i3
	xorcc	%i5,	0x0720,	%i6
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	ld	[%l7 + 0x10],	%f13
	array8	%o0,	%o1,	%l5
	fmovdvc	%icc,	%f18,	%f20
	lduh	[%l7 + 0x50],	%g7
	andn	%l4,	%l2,	%i2
	fmul8x16al	%f26,	%f19,	%f28
	nop
	set	0x58, %l0
	ldx	[%l7 + %l0],	%g6
	ldsw	[%l7 + 0x10],	%o7
	ldd	[%l7 + 0x38],	%f24
	andcc	%g1,	%l0,	%g3
	movvs	%xcc,	%i4,	%g4
	addcc	%o6,	%g5,	%i7
	fmovda	%xcc,	%f31,	%f26
	fsrc1s	%f21,	%f22
	andcc	%o5,	%l6,	%g2
	udivx	%o3,	0x1DEF,	%o4
	andcc	%i0,	%o2,	%l3
	ldub	[%l7 + 0x6C],	%i5
	fmuld8ulx16	%f8,	%f21,	%f20
	edge32n	%i6,	%i3,	%l1
	fnand	%f28,	%f4,	%f24
	edge8	%o0,	%i1,	%l5
	xor	%o1,	0x0B81,	%l4
	fsrc1s	%f5,	%f16
	orn	%g7,	0x0EA5,	%l2
	movn	%xcc,	%g6,	%i2
	srax	%o7,	0x1A,	%g1
	fmul8x16	%f8,	%f14,	%f30
	fornot2	%f26,	%f18,	%f10
	array32	%l0,	%g3,	%i4
	restore %o6, 0x143A, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i7,	%o5,	%g5
	udivx	%l6,	0x161E,	%g2
	popc	0x0B29,	%o3
	movrgez	%i0,	%o2,	%o4
	fcmpeq16	%f10,	%f8,	%l3
	udivx	%i5,	0x0E4D,	%i3
	fcmpeq16	%f12,	%f16,	%i6
	edge16	%o0,	%i1,	%l5
	alignaddrl	%l1,	%l4,	%g7
	fmovdle	%icc,	%f17,	%f12
	andcc	%o1,	%l2,	%g6
	edge8	%o7,	%i2,	%l0
	edge16l	%g1,	%i4,	%o6
	fmul8sux16	%f10,	%f14,	%f18
	movrlz	%g4,	0x00E,	%i7
	edge32l	%o5,	%g3,	%g5
	fmovsle	%xcc,	%f4,	%f16
	udivx	%l6,	0x1F72,	%g2
	ldsb	[%l7 + 0x72],	%i0
	movcc	%xcc,	%o2,	%o3
	fcmpeq16	%f12,	%f0,	%o4
	udivx	%i5,	0x0A59,	%l3
	lduw	[%l7 + 0x5C],	%i3
	addcc	%i6,	%o0,	%i1
	movg	%xcc,	%l5,	%l4
	std	%f4,	[%l7 + 0x40]
	movn	%icc,	%l1,	%o1
	fnor	%f14,	%f22,	%f18
	fcmpgt16	%f8,	%f8,	%l2
	edge8l	%g6,	%o7,	%i2
	stw	%g7,	[%l7 + 0x58]
	ldd	[%l7 + 0x68],	%l0
	add	%i4,	0x0411,	%o6
	edge16n	%g4,	%g1,	%i7
	ldsw	[%l7 + 0x78],	%g3
	movneg	%icc,	%o5,	%l6
	fnor	%f0,	%f8,	%f20
	fcmple32	%f10,	%f20,	%g2
	save %i0, 0x02DC, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%g5,	%o3
	movl	%xcc,	%i5,	%o4
	fsrc2s	%f15,	%f11
	orcc	%i3,	%l3,	%i6
	movg	%icc,	%o0,	%i1
	move	%xcc,	%l4,	%l1
	fsrc2s	%f29,	%f26
	movre	%l5,	0x143,	%o1
	xnorcc	%l2,	0x1521,	%o7
	fsrc2s	%f14,	%f11
	fmovs	%f25,	%f19
	sethi	0x16C9,	%g6
	sdivcc	%i2,	0x002D,	%g7
	udiv	%l0,	0x139A,	%o6
	movcs	%icc,	%g4,	%g1
	fmovdleu	%icc,	%f28,	%f1
	fmovsvc	%icc,	%f22,	%f23
	movpos	%icc,	%i7,	%g3
	fandnot2	%f30,	%f16,	%f8
	srlx	%i4,	%l6,	%o5
	movle	%icc,	%g2,	%o2
	popc	0x0B52,	%g5
	umulcc	%o3,	%i0,	%o4
	sdiv	%i3,	0x1FBB,	%l3
	umulcc	%i5,	0x1D1C,	%i6
	fcmpd	%fcc3,	%f12,	%f28
	nop
	set	0x4C, %l6
	ldsw	[%l7 + %l6],	%o0
	edge8	%i1,	%l1,	%l4
	movg	%xcc,	%o1,	%l5
	edge16l	%l2,	%g6,	%o7
	xnorcc	%i2,	0x00BA,	%l0
	movrgz	%o6,	0x044,	%g4
	edge32ln	%g7,	%i7,	%g3
	srl	%g1,	0x1D,	%l6
	srax	%o5,	0x17,	%i4
	xorcc	%o2,	0x0933,	%g2
	smulcc	%g5,	0x1639,	%o3
	movn	%xcc,	%i0,	%o4
	edge8	%i3,	%i5,	%i6
	movleu	%icc,	%l3,	%i1
	edge16ln	%o0,	%l1,	%l4
	fmovrdlz	%l5,	%f16,	%f0
	add	%o1,	%g6,	%l2
	ldsh	[%l7 + 0x58],	%i2
	lduw	[%l7 + 0x7C],	%l0
	fmovsneg	%xcc,	%f3,	%f30
	fxor	%f28,	%f4,	%f8
	fnors	%f5,	%f7,	%f28
	edge16	%o7,	%o6,	%g4
	ldx	[%l7 + 0x50],	%g7
	stx	%i7,	[%l7 + 0x08]
	fmovrsgz	%g1,	%f11,	%f16
	srlx	%g3,	0x09,	%l6
	edge16ln	%o5,	%o2,	%i4
	fcmpgt32	%f26,	%f16,	%g5
	nop
	set	0x48, %g3
	stb	%o3,	[%l7 + %g3]
	udiv	%i0,	0x1930,	%g2
	edge16ln	%o4,	%i3,	%i5
	sth	%i6,	[%l7 + 0x08]
	fmovda	%xcc,	%f11,	%f27
	movpos	%xcc,	%l3,	%o0
	andncc	%l1,	%l4,	%i1
	fpsub16s	%f15,	%f19,	%f12
	movrgez	%l5,	0x3F5,	%o1
	fnegd	%f0,	%f8
	edge16n	%g6,	%l2,	%i2
	xnor	%l0,	%o6,	%g4
	movge	%xcc,	%o7,	%i7
	array16	%g7,	%g3,	%g1
	udiv	%l6,	0x1340,	%o5
	xnorcc	%o2,	%i4,	%o3
	movne	%icc,	%i0,	%g2
	fmovrdgz	%g5,	%f28,	%f28
	edge32	%i3,	%o4,	%i5
	movl	%icc,	%i6,	%l3
	pdist	%f22,	%f30,	%f6
	array32	%l1,	%o0,	%i1
	movg	%xcc,	%l5,	%o1
	fxors	%f25,	%f30,	%f15
	fpackfix	%f20,	%f17
	fmul8ulx16	%f26,	%f28,	%f4
	srlx	%l4,	0x13,	%g6
	fmovrdgz	%l2,	%f26,	%f20
	ldub	[%l7 + 0x08],	%l0
	fmovdgu	%xcc,	%f18,	%f8
	srlx	%o6,	%g4,	%i2
	movrlez	%o7,	0x383,	%g7
	sir	0x0930
	sdivcc	%g3,	0x1C99,	%i7
	fmovrsgz	%g1,	%f1,	%f22
	fmovs	%f2,	%f26
	smul	%o5,	0x0091,	%o2
	umul	%l6,	0x09C9,	%i4
	srl	%o3,	%g2,	%g5
	edge16l	%i3,	%i0,	%o4
	edge16ln	%i6,	%i5,	%l3
	edge16ln	%o0,	%l1,	%l5
	edge16ln	%i1,	%l4,	%o1
	movl	%xcc,	%g6,	%l0
	fornot2s	%f14,	%f1,	%f6
	ldx	[%l7 + 0x20],	%l2
	fnand	%f16,	%f14,	%f12
	add	%o6,	%i2,	%o7
	edge8ln	%g7,	%g4,	%i7
	edge32n	%g3,	%o5,	%g1
	edge8l	%o2,	%l6,	%i4
	movvs	%xcc,	%g2,	%g5
	fmul8ulx16	%f12,	%f4,	%f0
	and	%i3,	0x0BD7,	%i0
	popc	0x03B5,	%o3
	subc	%i6,	%i5,	%l3
	movrgez	%o0,	%o4,	%l5
	fandnot1	%f10,	%f16,	%f28
	fmovrde	%i1,	%f26,	%f14
	stx	%l4,	[%l7 + 0x38]
	sll	%l1,	0x17,	%o1
	edge8	%l0,	%g6,	%o6
	udivcc	%i2,	0x08EF,	%l2
	fxnor	%f30,	%f4,	%f30
	movcc	%icc,	%o7,	%g7
	sdiv	%i7,	0x0F42,	%g4
	edge8l	%o5,	%g1,	%g3
	movvc	%icc,	%l6,	%o2
	ldx	[%l7 + 0x70],	%i4
	sdivx	%g5,	0x18EB,	%i3
	subc	%g2,	0x070F,	%i0
	edge16ln	%i6,	%i5,	%o3
	srl	%o0,	0x00,	%o4
	alignaddrl	%l3,	%i1,	%l5
	save %l1, 0x04FF, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f17,	%f17,	%f19
	edge32l	%o1,	%l0,	%o6
	movrgz	%i2,	0x206,	%g6
	subccc	%l2,	%g7,	%o7
	move	%xcc,	%g4,	%o5
	srl	%g1,	0x0C,	%g3
	fmovrse	%i7,	%f25,	%f17
	edge16n	%o2,	%i4,	%l6
	for	%f30,	%f22,	%f18
	ldx	[%l7 + 0x38],	%i3
	addc	%g2,	0x11A7,	%i0
	fpack16	%f20,	%f13
	fnegd	%f14,	%f2
	ldub	[%l7 + 0x0F],	%g5
	alignaddr	%i5,	%i6,	%o0
	movgu	%xcc,	%o3,	%o4
	addccc	%l3,	%l5,	%l1
	faligndata	%f12,	%f10,	%f4
	stx	%i1,	[%l7 + 0x50]
	orcc	%o1,	0x1894,	%l0
	subcc	%o6,	0x0644,	%l4
	sethi	0x1A65,	%g6
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	movrne	%g7,	%o7,	%o5
	fnot2s	%f29,	%f30
	sdiv	%g4,	0x06D0,	%g1
	fsrc1	%f4,	%f24
	pdist	%f12,	%f2,	%f22
	and	%g3,	%i7,	%o2
	fones	%f28
	mulx	%l6,	%i4,	%g2
	ldd	[%l7 + 0x10],	%i0
	edge8n	%g5,	%i3,	%i5
	movrgez	%o0,	0x33C,	%i6
	subcc	%o3,	%o4,	%l5
	orncc	%l1,	%i1,	%l3
	andcc	%l0,	0x0145,	%o1
	edge32ln	%l4,	%o6,	%g6
	and	%i2,	%l2,	%o7
	xor	%o5,	0x1CDC,	%g7
	fors	%f9,	%f15,	%f12
	movcc	%xcc,	%g1,	%g4
	fcmpeq32	%f6,	%f0,	%g3
	add	%o2,	%l6,	%i4
	srlx	%i7,	%g2,	%g5
	addc	%i0,	0x1E9C,	%i3
	popc	%o0,	%i5
	fmovdcs	%xcc,	%f11,	%f15
	ldd	[%l7 + 0x18],	%i6
	movvs	%xcc,	%o4,	%l5
	fmovdle	%icc,	%f25,	%f29
	fnot2	%f8,	%f12
	movrlez	%l1,	0x3C0,	%o3
	fpsub16	%f8,	%f14,	%f24
	edge16n	%l3,	%l0,	%i1
	xnor	%l4,	0x1DCD,	%o6
	move	%icc,	%g6,	%o1
	fpadd16s	%f14,	%f7,	%f20
	sll	%l2,	0x1C,	%i2
	edge8ln	%o5,	%o7,	%g7
	movl	%icc,	%g4,	%g1
	fmovrsgez	%g3,	%f12,	%f14
	subc	%l6,	0x112F,	%o2
	umul	%i4,	%g2,	%i7
	fmovrsne	%g5,	%f8,	%f7
	fmovdle	%icc,	%f20,	%f21
	fsrc2s	%f8,	%f2
	fmovsvs	%xcc,	%f8,	%f8
	mulx	%i3,	%o0,	%i5
	movrgez	%i0,	%o4,	%l5
	ldub	[%l7 + 0x7B],	%i6
	sub	%o3,	0x0452,	%l1
	movrgz	%l3,	%l0,	%l4
	smulcc	%i1,	0x1877,	%o6
	udivx	%g6,	0x010C,	%l2
	fxor	%f0,	%f8,	%f20
	addc	%i2,	%o1,	%o5
	lduh	[%l7 + 0x64],	%o7
	std	%f30,	[%l7 + 0x18]
	mova	%xcc,	%g7,	%g1
	xor	%g4,	%l6,	%o2
	ldsb	[%l7 + 0x2C],	%g3
	edge8	%g2,	%i4,	%g5
	fcmpeq32	%f2,	%f18,	%i3
	edge16	%i7,	%o0,	%i0
	sub	%i5,	%o4,	%l5
	subccc	%i6,	0x1EDF,	%l1
	sub	%o3,	0x104B,	%l0
	edge8n	%l3,	%l4,	%i1
	ldsw	[%l7 + 0x44],	%o6
	movne	%icc,	%l2,	%g6
	lduw	[%l7 + 0x50],	%o1
	ld	[%l7 + 0x58],	%f11
	sir	0x1C89
	movneg	%icc,	%o5,	%o7
	udivcc	%i2,	0x0F8C,	%g1
	xnor	%g4,	0x0ADD,	%g7
	movre	%l6,	0x320,	%o2
	sir	0x1669
	movrne	%g3,	0x30D,	%g2
	edge16ln	%i4,	%i3,	%i7
	fmuld8sux16	%f16,	%f28,	%f14
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%o0
	xorcc	%i0,	%i5,	%o4
	edge32n	%l5,	%g5,	%l1
	movrlez	%i6,	0x1F4,	%o3
	movn	%xcc,	%l3,	%l4
	movrgz	%i1,	0x1DF,	%l0
	subc	%o6,	%g6,	%l2
	orcc	%o1,	0x0346,	%o7
	movrgez	%o5,	%g1,	%g4
	srax	%i2,	0x00,	%g7
	edge8l	%l6,	%g3,	%o2
	fandnot1s	%f7,	%f0,	%f25
	movvc	%icc,	%g2,	%i3
	ldub	[%l7 + 0x66],	%i7
	edge32l	%o0,	%i4,	%i0
	xor	%i5,	%o4,	%l5
	fmul8x16au	%f19,	%f0,	%f20
	edge8n	%l1,	%i6,	%o3
	movle	%xcc,	%g5,	%l4
	fxnors	%f31,	%f8,	%f0
	edge8	%l3,	%l0,	%i1
	edge16ln	%g6,	%o6,	%o1
	movg	%icc,	%o7,	%o5
	movle	%xcc,	%g1,	%l2
	fmovsvc	%xcc,	%f25,	%f12
	lduh	[%l7 + 0x2A],	%g4
	movrgez	%i2,	%g7,	%g3
	udivx	%o2,	0x011A,	%g2
	fmovda	%icc,	%f16,	%f23
	fmul8x16au	%f18,	%f8,	%f14
	subcc	%l6,	%i3,	%i7
	movvc	%icc,	%o0,	%i4
	fexpand	%f29,	%f30
	ldd	[%l7 + 0x70],	%i0
	fcmple16	%f8,	%f18,	%i5
	fnor	%f22,	%f10,	%f0
	ldsh	[%l7 + 0x2C],	%o4
	mulx	%l5,	0x0687,	%i6
	nop
	set	0x6C, %g1
	sth	%o3,	[%l7 + %g1]
	subccc	%g5,	0x1784,	%l1
	srax	%l3,	0x06,	%l0
	stw	%l4,	[%l7 + 0x38]
	orncc	%g6,	0x135F,	%i1
	andncc	%o6,	%o1,	%o7
	ldub	[%l7 + 0x6E],	%g1
	movne	%xcc,	%o5,	%l2
	fmovdvs	%xcc,	%f2,	%f12
	sdivcc	%i2,	0x0CD7,	%g4
	stx	%g3,	[%l7 + 0x38]
	add	%g7,	%g2,	%l6
	edge8l	%i3,	%i7,	%o2
	andcc	%o0,	%i0,	%i5
	sra	%i4,	0x01,	%l5
	xorcc	%o4,	%i6,	%g5
	edge8n	%o3,	%l3,	%l0
	move	%icc,	%l4,	%l1
	orn	%i1,	%g6,	%o6
	fmovsgu	%xcc,	%f5,	%f12
	srl	%o7,	%g1,	%o5
	edge8n	%o1,	%l2,	%g4
	add	%i2,	0x0D21,	%g3
	ldx	[%l7 + 0x40],	%g7
	orcc	%l6,	%g2,	%i3
	movle	%xcc,	%i7,	%o0
	srlx	%o2,	0x14,	%i5
	ldsw	[%l7 + 0x60],	%i0
	addccc	%l5,	%i4,	%i6
	fmovsvs	%xcc,	%f31,	%f12
	ldsb	[%l7 + 0x1A],	%o4
	fmovsge	%xcc,	%f2,	%f13
	subccc	%o3,	%g5,	%l0
	movcc	%icc,	%l4,	%l3
	movg	%icc,	%l1,	%i1
	and	%g6,	0x152B,	%o6
	stb	%g1,	[%l7 + 0x0C]
	fmul8x16al	%f15,	%f26,	%f18
	ldsw	[%l7 + 0x1C],	%o5
	movvc	%xcc,	%o1,	%o7
	movpos	%icc,	%g4,	%l2
	stb	%i2,	[%l7 + 0x37]
	std	%f20,	[%l7 + 0x38]
	std	%f22,	[%l7 + 0x38]
	fors	%f11,	%f18,	%f15
	fpackfix	%f22,	%f21
	fexpand	%f24,	%f26
	ldd	[%l7 + 0x40],	%g6
	movl	%icc,	%g3,	%l6
	fors	%f8,	%f26,	%f5
	and	%i3,	%i7,	%g2
	move	%icc,	%o0,	%i5
	edge32l	%o2,	%l5,	%i0
	movneg	%icc,	%i4,	%o4
	edge32ln	%o3,	%i6,	%l0
	orncc	%g5,	0x13F5,	%l4
	restore %l1, 0x1C66, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l3,	%o6,	%g1
	ldub	[%l7 + 0x5B],	%o5
	ldsb	[%l7 + 0x0F],	%g6
	orncc	%o7,	%g4,	%o1
	addccc	%i2,	0x0E47,	%g7
	addccc	%g3,	0x0ABE,	%l6
	sdivcc	%i3,	0x1EF1,	%i7
	sir	0x1F86
	popc	0x0D0A,	%l2
	movcc	%xcc,	%o0,	%i5
	movvs	%xcc,	%o2,	%g2
	fmovrsgz	%i0,	%f22,	%f9
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%i4
	ldd	[%l7 + 0x40],	%f26
	fcmped	%fcc0,	%f28,	%f14
	edge32l	%l5,	%o3,	%o4
	array16	%l0,	%i6,	%l4
	fands	%f26,	%f31,	%f18
	nop
	set	0x68, %g6
	ldsw	[%l7 + %g6],	%g5
	andcc	%l1,	%l3,	%i1
	movrlez	%g1,	%o5,	%g6
	sub	%o7,	0x0EFF,	%g4
	array32	%o1,	%o6,	%i2
	fmovdge	%xcc,	%f31,	%f27
	fzero	%f0
	movre	%g7,	%g3,	%l6
	popc	0x08ED,	%i3
	smulcc	%i7,	0x0F5F,	%o0
	move	%icc,	%i5,	%l2
	edge16n	%g2,	%o2,	%i0
	array8	%l5,	%i4,	%o3
	lduh	[%l7 + 0x48],	%o4
	movcs	%icc,	%l0,	%i6
	fpsub32s	%f9,	%f15,	%f17
	sra	%l4,	%g5,	%l1
	fzeros	%f1
	xnor	%i1,	0x1283,	%g1
	sub	%o5,	0x13D4,	%l3
	sdivx	%o7,	0x1C82,	%g4
	xnor	%o1,	0x0B1E,	%g6
	andn	%o6,	%g7,	%g3
	mulscc	%i2,	0x0270,	%i3
	alignaddrl	%l6,	%i7,	%o0
	smulcc	%i5,	0x14BF,	%g2
	move	%icc,	%o2,	%l2
	edge32ln	%i0,	%i4,	%l5
	fmovdl	%icc,	%f9,	%f6
	movleu	%icc,	%o4,	%o3
	fand	%f18,	%f24,	%f6
	movgu	%xcc,	%l0,	%l4
	add	%g5,	%i6,	%l1
	edge8ln	%g1,	%o5,	%i1
	alignaddrl	%o7,	%g4,	%o1
	srax	%l3,	0x12,	%o6
	movrgez	%g6,	%g3,	%i2
	subc	%i3,	%l6,	%g7
	sdivcc	%o0,	0x00DE,	%i7
	movcc	%xcc,	%g2,	%o2
	movrlez	%i5,	%i0,	%l2
	addccc	%i4,	%l5,	%o4
	sllx	%l0,	0x1C,	%o3
	movrgz	%g5,	%i6,	%l4
	popc	0x1E2A,	%g1
	fmovdg	%icc,	%f2,	%f4
	edge32l	%l1,	%i1,	%o7
	movcs	%xcc,	%o5,	%o1
	fmovrdgz	%l3,	%f14,	%f12
	movneg	%icc,	%o6,	%g6
	xnorcc	%g4,	%g3,	%i2
	fmovrslz	%l6,	%f9,	%f11
	sllx	%i3,	0x16,	%o0
	sllx	%i7,	%g2,	%o2
	subccc	%g7,	%i0,	%i5
	orcc	%i4,	%l2,	%o4
	ldd	[%l7 + 0x48],	%f26
	movrlz	%l5,	%o3,	%l0
	and	%i6,	%g5,	%g1
	addcc	%l1,	0x1C10,	%i1
	edge32l	%o7,	%l4,	%o5
	edge32l	%o1,	%l3,	%o6
	fmovdg	%xcc,	%f1,	%f16
	edge32	%g4,	%g3,	%g6
	edge8l	%i2,	%l6,	%o0
	fmovd	%f0,	%f6
	sra	%i3,	0x03,	%g2
	edge32n	%o2,	%i7,	%g7
	fpsub16s	%f1,	%f22,	%f16
	fmovdcs	%icc,	%f16,	%f24
	subcc	%i0,	%i5,	%l2
	movrlez	%o4,	%l5,	%i4
	srax	%o3,	0x16,	%i6
	fxnors	%f0,	%f17,	%f5
	sllx	%l0,	0x17,	%g5
	stx	%l1,	[%l7 + 0x58]
	addccc	%g1,	%i1,	%o7
	udiv	%l4,	0x1989,	%o1
	fmovdvc	%xcc,	%f14,	%f12
	for	%f16,	%f18,	%f30
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	movl	%icc,	%o6,	%g3
	xnor	%i2,	0x0EB1,	%g6
	subccc	%l6,	%i3,	%g2
	move	%icc,	%o0,	%o2
	stx	%g7,	[%l7 + 0x78]
	movcs	%xcc,	%i0,	%i7
	edge16ln	%i5,	%l2,	%l5
	umul	%i4,	%o3,	%i6
	array8	%l0,	%o4,	%l1
	srax	%g1,	0x07,	%i1
	fmovrdgz	%g5,	%f4,	%f0
	std	%f14,	[%l7 + 0x18]
	sll	%l4,	0x0B,	%o1
	umul	%o5,	%l3,	%o7
	subccc	%o6,	%g4,	%g3
	array8	%g6,	%i2,	%i3
	fcmpne16	%f10,	%f12,	%l6
	udivx	%g2,	0x13CF,	%o0
	ldd	[%l7 + 0x58],	%f26
	sir	0x012B
	xorcc	%g7,	0x0579,	%o2
	fmul8ulx16	%f0,	%f10,	%f18
	srax	%i7,	%i0,	%i5
	fandnot2s	%f20,	%f16,	%f11
	srlx	%l5,	%i4,	%o3
	fxnors	%f31,	%f25,	%f20
	movgu	%xcc,	%i6,	%l2
	movrgez	%o4,	%l1,	%l0
	subc	%i1,	0x070D,	%g1
	sll	%l4,	0x07,	%g5
	std	%f10,	[%l7 + 0x10]
	fmovdl	%xcc,	%f0,	%f13
	movrlz	%o1,	0x2B5,	%o5
	fmovdleu	%xcc,	%f19,	%f31
	movn	%xcc,	%o7,	%l3
	orn	%g4,	0x1339,	%o6
	array8	%g6,	%g3,	%i2
	ldx	[%l7 + 0x08],	%i3
	fmuld8ulx16	%f2,	%f3,	%f14
	fpadd16s	%f9,	%f7,	%f20
	edge32n	%g2,	%o0,	%g7
	movcc	%icc,	%l6,	%o2
	addcc	%i7,	0x0182,	%i5
	movcc	%icc,	%l5,	%i0
	sdiv	%i4,	0x1F85,	%o3
	fmul8x16al	%f3,	%f19,	%f4
	subc	%l2,	%i6,	%l1
	movrne	%l0,	0x3DC,	%i1
	mulscc	%g1,	0x1BD5,	%o4
	udiv	%g5,	0x07BD,	%l4
	sra	%o1,	0x09,	%o5
	fmovdpos	%icc,	%f12,	%f4
	fmovdl	%icc,	%f18,	%f11
	xor	%o7,	0x13E6,	%l3
	save %o6, 0x0193, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x40],	%g2
	stx	%g6,	[%l7 + 0x60]
	sub	%i2,	%g2,	%i3
	edge8n	%o0,	%g7,	%l6
	st	%f0,	[%l7 + 0x2C]
	movrgez	%o2,	0x18A,	%i5
	fmovrdne	%l5,	%f22,	%f10
	fmovrde	%i0,	%f28,	%f8
	fpack32	%f26,	%f26,	%f2
	fors	%f14,	%f6,	%f26
	fmovscs	%icc,	%f31,	%f17
	smul	%i4,	0x1883,	%o3
	udivcc	%l2,	0x06B7,	%i6
	or	%i7,	%l1,	%i1
	lduw	[%l7 + 0x14],	%l0
	fpadd16s	%f16,	%f17,	%f14
	subccc	%g1,	0x0DB6,	%g5
	movg	%icc,	%l4,	%o4
	subccc	%o5,	%o7,	%o1
	sra	%l3,	0x0C,	%g4
	edge16ln	%o6,	%g6,	%g3
	xor	%i2,	0x0982,	%g2
	st	%f0,	[%l7 + 0x20]
	or	%o0,	0x1119,	%i3
	movn	%xcc,	%g7,	%o2
	movrlz	%l6,	0x1D6,	%i5
	udivx	%i0,	0x0DB2,	%l5
	ldd	[%l7 + 0x58],	%f6
	edge16ln	%o3,	%l2,	%i4
	movvs	%xcc,	%i6,	%l1
	movle	%xcc,	%i1,	%l0
	fpmerge	%f12,	%f18,	%f16
	movgu	%xcc,	%i7,	%g5
	xorcc	%g1,	%l4,	%o4
	orcc	%o5,	0x0927,	%o1
	edge32	%l3,	%o7,	%g4
	array8	%o6,	%g3,	%g6
	sdivx	%g2,	0x06BB,	%o0
	addccc	%i2,	%i3,	%o2
	movgu	%xcc,	%g7,	%i5
	sll	%l6,	%l5,	%o3
	udiv	%l2,	0x12B4,	%i4
	movvc	%xcc,	%i0,	%l1
	fmovsle	%icc,	%f22,	%f7
	movrgz	%i1,	%i6,	%i7
	fmovrslez	%l0,	%f27,	%f28
	fornot1s	%f6,	%f30,	%f24
	fornot1s	%f30,	%f2,	%f22
	udiv	%g5,	0x1492,	%g1
	srax	%o4,	0x1B,	%l4
	and	%o1,	%l3,	%o7
	or	%o5,	%g4,	%o6
	fmovsvc	%xcc,	%f1,	%f16
	lduw	[%l7 + 0x68],	%g6
	fmovdcc	%icc,	%f24,	%f23
	movrne	%g3,	%o0,	%i2
	edge32ln	%g2,	%i3,	%g7
	fmovs	%f8,	%f15
	fsrc1s	%f31,	%f15
	sllx	%o2,	%i5,	%l6
	fmovrdgez	%l5,	%f8,	%f20
	movre	%o3,	%l2,	%i4
	sethi	0x19F9,	%l1
	fone	%f0
	umulcc	%i1,	%i0,	%i7
	smulcc	%i6,	%l0,	%g5
	ldub	[%l7 + 0x70],	%g1
	sllx	%l4,	0x16,	%o1
	ldsh	[%l7 + 0x20],	%o4
	stx	%o7,	[%l7 + 0x40]
	movvc	%xcc,	%l3,	%g4
	fcmpeq16	%f16,	%f6,	%o5
	sdiv	%o6,	0x1835,	%g3
	popc	%o0,	%i2
	fandnot2	%f18,	%f30,	%f8
	movg	%icc,	%g6,	%g2
	xorcc	%g7,	0x1B56,	%i3
	stw	%i5,	[%l7 + 0x5C]
	andn	%l6,	%o2,	%o3
	addccc	%l5,	0x11C1,	%i4
	lduw	[%l7 + 0x7C],	%l2
	edge16n	%l1,	%i0,	%i7
	xnorcc	%i6,	0x0FB2,	%i1
	sir	0x1FE1
	srl	%l0,	%g1,	%g5
	fnot1	%f24,	%f6
	xor	%l4,	%o4,	%o7
	fpadd16s	%f13,	%f18,	%f0
	movleu	%xcc,	%l3,	%g4
	movrgz	%o1,	%o6,	%g3
	nop
	set	0x57, %o7
	ldub	[%l7 + %o7],	%o0
	edge8ln	%i2,	%o5,	%g6
	array32	%g2,	%g7,	%i5
	sth	%i3,	[%l7 + 0x2A]
	movvs	%icc,	%l6,	%o3
	fmovdpos	%xcc,	%f27,	%f23
	srl	%o2,	0x04,	%i4
	srax	%l2,	0x0E,	%l5
	movn	%xcc,	%i0,	%l1
	lduh	[%l7 + 0x6A],	%i6
	movvs	%icc,	%i7,	%l0
	fpackfix	%f14,	%f22
	umulcc	%g1,	0x16D9,	%i1
	fmovdcs	%icc,	%f21,	%f8
	andn	%g5,	0x0800,	%o4
	umul	%o7,	0x0E1A,	%l4
	mulscc	%g4,	%l3,	%o1
	orn	%g3,	0x1E94,	%o0
	udivx	%i2,	0x0BAF,	%o5
	subc	%g6,	0x0AC9,	%o6
	andncc	%g7,	%g2,	%i3
	fornot1s	%f3,	%f15,	%f1
	fpack16	%f20,	%f16
	sdivx	%l6,	0x0695,	%o3
	fpadd32	%f10,	%f26,	%f12
	sll	%o2,	0x15,	%i4
	ldsw	[%l7 + 0x30],	%i5
	xnorcc	%l5,	%i0,	%l1
	smulcc	%i6,	%i7,	%l0
	movn	%xcc,	%g1,	%i1
	edge32l	%g5,	%o4,	%o7
	edge8	%l4,	%g4,	%l3
	fmul8ulx16	%f6,	%f24,	%f24
	movrne	%o1,	0x2D5,	%g3
	andncc	%o0,	%i2,	%l2
	stb	%o5,	[%l7 + 0x40]
	sth	%g6,	[%l7 + 0x28]
	movn	%icc,	%g7,	%g2
	subcc	%i3,	0x0AC9,	%l6
	edge16l	%o3,	%o2,	%o6
	addcc	%i4,	0x0853,	%l5
	movrne	%i0,	0x200,	%i5
	andn	%i6,	0x0F49,	%l1
	edge32	%i7,	%g1,	%i1
	ld	[%l7 + 0x5C],	%f7
	xorcc	%l0,	0x10CE,	%g5
	umulcc	%o4,	0x1E93,	%l4
	fmovsvc	%icc,	%f0,	%f26
	fmovsn	%xcc,	%f4,	%f13
	fmovsge	%icc,	%f10,	%f4
	edge32ln	%g4,	%l3,	%o7
	addc	%o1,	%o0,	%i2
	xnorcc	%g3,	%l2,	%o5
	ldsb	[%l7 + 0x43],	%g6
	edge16ln	%g2,	%i3,	%l6
	array16	%g7,	%o3,	%o6
	udivcc	%o2,	0x0206,	%i4
	fpadd16	%f12,	%f24,	%f8
	movneg	%icc,	%i0,	%l5
	subcc	%i5,	%l1,	%i6
	restore %g1, %i1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i7,	0x0062,	%g5
	edge16	%o4,	%l4,	%l3
	movvc	%icc,	%o7,	%o1
	faligndata	%f4,	%f18,	%f16
	srl	%o0,	0x0F,	%i2
	fones	%f29
	movneg	%icc,	%g3,	%g4
	fmovdneg	%icc,	%f19,	%f15
	movle	%xcc,	%l2,	%g6
	alignaddr	%o5,	%i3,	%l6
	movrne	%g2,	%g7,	%o6
	fmovsle	%xcc,	%f9,	%f19
	nop
	set	0x60, %l3
	ldsh	[%l7 + %l3],	%o3
	fmuld8ulx16	%f10,	%f1,	%f16
	movneg	%icc,	%o2,	%i0
	sll	%l5,	0x1F,	%i5
	smulcc	%i4,	0x0AEA,	%i6
	addcc	%g1,	0x1AC2,	%i1
	st	%f0,	[%l7 + 0x40]
	save %l0, %l1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g5,	%l4,	%l3
	andncc	%o4,	%o1,	%o7
	movg	%icc,	%o0,	%i2
	edge16	%g3,	%g4,	%g6
	mulscc	%o5,	0x191A,	%l2
	sdivx	%l6,	0x109D,	%g2
	edge8ln	%g7,	%o6,	%o3
	umul	%i3,	0x068B,	%i0
	movge	%icc,	%l5,	%o2
	edge16l	%i4,	%i5,	%i6
	edge16l	%i1,	%g1,	%l0
	fxnor	%f0,	%f10,	%f8
	srl	%l1,	%g5,	%i7
	sth	%l4,	[%l7 + 0x3E]
	andn	%l3,	%o4,	%o7
	sdivcc	%o0,	0x0FB9,	%i2
	movleu	%icc,	%o1,	%g4
	fmovdg	%icc,	%f9,	%f23
	sir	0x03C0
	edge32ln	%g3,	%o5,	%l2
	addccc	%l6,	0x0792,	%g6
	array8	%g2,	%o6,	%o3
	mova	%xcc,	%g7,	%i3
	udivcc	%l5,	0x0948,	%i0
	udivx	%o2,	0x0B68,	%i4
	movl	%xcc,	%i6,	%i1
	movleu	%xcc,	%i5,	%g1
	xnor	%l0,	%l1,	%i7
	ldd	[%l7 + 0x30],	%f30
	orncc	%g5,	%l4,	%o4
	siam	0x7
	fmovdcc	%xcc,	%f5,	%f24
	fmuld8sux16	%f17,	%f1,	%f4
	sdiv	%l3,	0x1DFE,	%o7
	for	%f24,	%f20,	%f26
	st	%f30,	[%l7 + 0x70]
	fcmpne32	%f20,	%f4,	%o0
	and	%i2,	0x0743,	%g4
	nop
	set	0x0E, %i3
	ldsb	[%l7 + %i3],	%o1
	andn	%g3,	0x1EEF,	%o5
	movpos	%icc,	%l6,	%g6
	fmovdcc	%icc,	%f22,	%f27
	movrgz	%l2,	%g2,	%o6
	addc	%o3,	%g7,	%i3
	ldsw	[%l7 + 0x54],	%l5
	movvc	%icc,	%o2,	%i4
	subcc	%i0,	0x1C12,	%i1
	edge8n	%i6,	%i5,	%g1
	smul	%l0,	%l1,	%g5
	fpmerge	%f2,	%f21,	%f6
	fmovdle	%icc,	%f28,	%f9
	fmovdge	%icc,	%f21,	%f4
	movre	%l4,	%o4,	%i7
	fmul8sux16	%f24,	%f8,	%f24
	subc	%l3,	0x02B9,	%o7
	edge8	%o0,	%g4,	%i2
	srlx	%o1,	0x0F,	%o5
	fcmped	%fcc3,	%f28,	%f30
	sll	%g3,	0x1F,	%g6
	movrgez	%l2,	0x19D,	%g2
	srl	%o6,	%l6,	%g7
	sra	%o3,	0x0D,	%l5
	ldub	[%l7 + 0x0E],	%o2
	add	%i4,	%i0,	%i3
	edge8n	%i1,	%i5,	%i6
	movrlz	%g1,	%l0,	%l1
	movrlz	%g5,	%l4,	%o4
	movvs	%icc,	%l3,	%i7
	fcmpne16	%f12,	%f6,	%o0
	movcs	%xcc,	%g4,	%o7
	ldx	[%l7 + 0x18],	%o1
	fmovd	%f26,	%f24
	andcc	%o5,	%g3,	%i2
	st	%f4,	[%l7 + 0x74]
	addc	%g6,	0x00F7,	%l2
	array16	%g2,	%l6,	%g7
	xnor	%o3,	0x0C20,	%o6
	std	%f8,	[%l7 + 0x48]
	fors	%f25,	%f14,	%f19
	movgu	%xcc,	%o2,	%l5
	srax	%i4,	0x1D,	%i0
	sub	%i3,	0x07BC,	%i5
	fcmple16	%f4,	%f4,	%i1
	edge16n	%g1,	%l0,	%l1
	fmovdl	%xcc,	%f28,	%f31
	edge32n	%i6,	%l4,	%o4
	edge8ln	%l3,	%i7,	%g5
	edge32n	%o0,	%g4,	%o7
	edge8ln	%o5,	%o1,	%i2
	edge8	%g3,	%g6,	%l2
	move	%xcc,	%l6,	%g7
	andn	%g2,	0x04DB,	%o6
	fmovrdne	%o3,	%f24,	%f14
	sdivx	%o2,	0x1A0D,	%i4
	smul	%i0,	%i3,	%l5
	fmovdne	%xcc,	%f25,	%f21
	ldsb	[%l7 + 0x34],	%i1
	stx	%g1,	[%l7 + 0x20]
	sdivcc	%i5,	0x06D1,	%l1
	ld	[%l7 + 0x60],	%f12
	movrlz	%i6,	0x06A,	%l0
	sll	%l4,	0x00,	%o4
	srl	%i7,	%l3,	%g5
	fpadd32	%f26,	%f18,	%f16
	fpsub32s	%f30,	%f11,	%f25
	lduh	[%l7 + 0x68],	%o0
	ld	[%l7 + 0x50],	%f4
	edge32ln	%o7,	%g4,	%o1
	fnands	%f7,	%f28,	%f16
	fnor	%f4,	%f12,	%f14
	stb	%i2,	[%l7 + 0x40]
	fmovrslez	%g3,	%f26,	%f7
	subcc	%g6,	%l2,	%l6
	stb	%g7,	[%l7 + 0x54]
	movn	%xcc,	%o5,	%g2
	movcc	%xcc,	%o3,	%o2
	st	%f29,	[%l7 + 0x74]
	std	%f6,	[%l7 + 0x60]
	fmovspos	%icc,	%f1,	%f19
	fmovdleu	%xcc,	%f16,	%f18
	edge16ln	%i4,	%o6,	%i3
	edge8	%l5,	%i1,	%g1
	fornot2s	%f30,	%f21,	%f4
	sdivcc	%i0,	0x0655,	%l1
	movcs	%icc,	%i6,	%i5
	add	%l0,	0x0A2E,	%l4
	save %i7, 0x141D, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%g5,	%f22,	%f8
	sdivx	%l3,	0x0201,	%o0
	movn	%icc,	%g4,	%o1
	sdivx	%o7,	0x0412,	%i2
	udivcc	%g6,	0x12BC,	%g3
	sth	%l2,	[%l7 + 0x14]
	udivx	%l6,	0x1B6F,	%g7
	xor	%o5,	%o3,	%o2
	fmovsleu	%xcc,	%f7,	%f17
	orcc	%i4,	0x021D,	%g2
	movrne	%i3,	%l5,	%o6
	fnot1	%f20,	%f22
	fabss	%f22,	%f25
	fsrc2s	%f14,	%f29
	edge8	%g1,	%i1,	%i0
	edge16ln	%i6,	%i5,	%l1
	subcc	%l4,	%i7,	%l0
	andcc	%o4,	0x05A0,	%l3
	sth	%o0,	[%l7 + 0x42]
	orncc	%g4,	%g5,	%o1
	fmovrdlz	%o7,	%f16,	%f20
	movn	%xcc,	%g6,	%i2
	srlx	%l2,	%g3,	%l6
	stw	%o5,	[%l7 + 0x1C]
	movpos	%icc,	%o3,	%g7
	array16	%o2,	%i4,	%g2
	movn	%xcc,	%l5,	%i3
	fpadd16	%f16,	%f10,	%f0
	edge16n	%o6,	%i1,	%i0
	fmovrdgz	%g1,	%f18,	%f12
	edge32ln	%i5,	%i6,	%l1
	edge8l	%i7,	%l0,	%o4
	mova	%icc,	%l4,	%o0
	add	%g4,	0x1B68,	%l3
	udivcc	%o1,	0x0F03,	%o7
	fxor	%f30,	%f0,	%f16
	ldsw	[%l7 + 0x18],	%g6
	fmul8sux16	%f4,	%f10,	%f16
	edge32	%i2,	%l2,	%g5
	move	%icc,	%g3,	%l6
	sub	%o5,	%g7,	%o3
	movrgez	%o2,	%g2,	%i4
	or	%i3,	0x0A1C,	%o6
	xorcc	%l5,	0x1DFD,	%i1
	and	%i0,	%g1,	%i6
	addcc	%i5,	0x1475,	%l1
	edge32	%l0,	%o4,	%i7
	sdivcc	%l4,	0x1B9F,	%o0
	add	%l3,	%o1,	%g4
	fmovsn	%icc,	%f14,	%f3
	array8	%g6,	%i2,	%l2
	fcmps	%fcc1,	%f21,	%f23
	fpack32	%f16,	%f20,	%f16
	fmovrsgez	%o7,	%f15,	%f15
	udivcc	%g5,	0x1628,	%l6
	edge32	%g3,	%g7,	%o3
	edge8n	%o2,	%o5,	%g2
	mova	%xcc,	%i3,	%i4
	array16	%o6,	%i1,	%l5
	movleu	%icc,	%g1,	%i0
	movneg	%xcc,	%i5,	%l1
	array16	%i6,	%o4,	%i7
	edge8ln	%l4,	%l0,	%o0
	fmovdvs	%xcc,	%f17,	%f25
	orncc	%o1,	0x19C4,	%l3
	ldsh	[%l7 + 0x5C],	%g4
	fnot2	%f10,	%f4
	srlx	%i2,	0x1C,	%l2
	movg	%icc,	%o7,	%g5
	sth	%g6,	[%l7 + 0x1C]
	movcs	%xcc,	%l6,	%g3
	sdivx	%g7,	0x0F2F,	%o2
	sub	%o5,	%o3,	%i3
	fmovdvc	%xcc,	%f5,	%f21
	andcc	%i4,	%o6,	%i1
	fnors	%f23,	%f5,	%f1
	ldd	[%l7 + 0x58],	%f2
	movre	%g2,	%l5,	%i0
	popc	0x13FB,	%g1
	fmovsneg	%icc,	%f30,	%f30
	array32	%l1,	%i5,	%o4
	ldsw	[%l7 + 0x6C],	%i7
	srlx	%l4,	%i6,	%o0
	orn	%o1,	0x1772,	%l0
	std	%f12,	[%l7 + 0x28]
	orncc	%l3,	0x0565,	%g4
	edge16	%i2,	%l2,	%g5
	movre	%o7,	0x0B5,	%g6
	fmovsa	%xcc,	%f31,	%f15
	fmovrsne	%g3,	%f29,	%f3
	fmovrsgez	%g7,	%f19,	%f16
	edge8l	%o2,	%o5,	%l6
	edge16l	%o3,	%i4,	%i3
	subcc	%o6,	%i1,	%l5
	edge32	%g2,	%i0,	%g1
	sll	%i5,	%l1,	%o4
	sllx	%l4,	%i6,	%o0
	and	%i7,	%o1,	%l0
	edge8l	%l3,	%i2,	%l2
	fmuld8ulx16	%f26,	%f8,	%f4
	fmovdcs	%xcc,	%f12,	%f12
	fornot1	%f0,	%f2,	%f26
	smulcc	%g5,	0x1B36,	%o7
	movrgz	%g4,	%g6,	%g3
	edge8l	%g7,	%o2,	%l6
	edge16	%o5,	%o3,	%i4
	xnor	%i3,	0x19D7,	%o6
	fmovdne	%icc,	%f7,	%f23
	sethi	0x1B5B,	%i1
	move	%icc,	%l5,	%g2
	popc	0x1681,	%g1
	orcc	%i0,	%i5,	%l1
	edge16ln	%l4,	%o4,	%i6
	xor	%o0,	0x09BC,	%i7
	srax	%l0,	%l3,	%i2
	sll	%o1,	0x0D,	%g5
	movleu	%icc,	%o7,	%l2
	movrlz	%g4,	%g3,	%g7
	srl	%o2,	0x11,	%l6
	add	%g6,	0x1CDF,	%o5
	udivcc	%o3,	0x1E5C,	%i3
	udiv	%o6,	0x1D6C,	%i1
	fmovdvs	%xcc,	%f11,	%f1
	smulcc	%l5,	0x0414,	%i4
	srax	%g2,	%g1,	%i5
	movcs	%xcc,	%l1,	%l4
	movcs	%icc,	%o4,	%i6
	or	%o0,	%i0,	%l0
	movleu	%xcc,	%i7,	%i2
	fcmpne32	%f16,	%f26,	%o1
	sir	0x189C
	udiv	%g5,	0x0294,	%o7
	umul	%l3,	0x0742,	%g4
	mulscc	%l2,	0x0578,	%g3
	move	%xcc,	%g7,	%l6
	xnor	%o2,	0x08AE,	%o5
	stw	%o3,	[%l7 + 0x60]
	fmovdleu	%icc,	%f6,	%f29
	fmuld8sux16	%f18,	%f11,	%f0
	ldd	[%l7 + 0x08],	%g6
	edge32	%o6,	%i3,	%i1
	fmuld8ulx16	%f30,	%f26,	%f18
	ldd	[%l7 + 0x28],	%l4
	addcc	%i4,	0x141F,	%g1
	fmovsneg	%xcc,	%f23,	%f7
	xnorcc	%i5,	%g2,	%l1
	fmovsvc	%xcc,	%f12,	%f9
	ldsh	[%l7 + 0x74],	%o4
	smulcc	%i6,	%o0,	%l4
	array32	%l0,	%i7,	%i2
	fmovrse	%o1,	%f22,	%f18
	movge	%xcc,	%g5,	%i0
	lduh	[%l7 + 0x46],	%l3
	movre	%g4,	%o7,	%l2
	nop
	set	0x4C, %g7
	ldsb	[%l7 + %g7],	%g3
	movpos	%icc,	%l6,	%o2
	andn	%g7,	%o3,	%o5
	nop
	set	0x25, %i7
	ldsb	[%l7 + %i7],	%g6
	udivx	%o6,	0x0841,	%i1
	movn	%icc,	%l5,	%i3
	movcc	%xcc,	%i4,	%g1
	fzeros	%f30
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	srax	%o4,	0x19,	%l1
	sethi	0x1452,	%i6
	mulx	%l4,	0x0331,	%l0
	fcmpne16	%f26,	%f12,	%o0
	alignaddrl	%i2,	%i7,	%o1
	add	%i0,	%g5,	%l3
	orncc	%g4,	0x060C,	%l2
	subccc	%o7,	%g3,	%l6
	movleu	%xcc,	%g7,	%o3
	fmovsneg	%icc,	%f8,	%f10
	sllx	%o5,	%g6,	%o6
	fcmple32	%f16,	%f26,	%o2
	edge32	%i1,	%l5,	%i4
	subcc	%i3,	%g1,	%g2
	mulscc	%o4,	0x19B9,	%i5
	addc	%l1,	%i6,	%l4
	andn	%l0,	%i2,	%i7
	sdiv	%o1,	0x167B,	%i0
	st	%f7,	[%l7 + 0x08]
	movrgez	%o0,	0x381,	%l3
	addc	%g5,	%g4,	%l2
	fornot2	%f2,	%f18,	%f22
	move	%xcc,	%o7,	%l6
	edge8	%g3,	%o3,	%o5
	andn	%g6,	0x1B34,	%g7
	udiv	%o2,	0x0E78,	%i1
	xnor	%o6,	0x1805,	%i4
	fmovdvs	%xcc,	%f1,	%f22
	fmovscc	%icc,	%f10,	%f11
	fpack16	%f28,	%f14
	fexpand	%f28,	%f28
	mulscc	%i3,	%g1,	%l5
	edge32n	%g2,	%o4,	%i5
	fmuld8sux16	%f12,	%f6,	%f18
	movle	%icc,	%l1,	%i6
	movneg	%xcc,	%l0,	%l4
	fnors	%f9,	%f29,	%f31
	umulcc	%i7,	0x1951,	%i2
	fmovrdgz	%o1,	%f12,	%f4
	movgu	%xcc,	%i0,	%o0
	mova	%icc,	%g5,	%g4
	movn	%icc,	%l2,	%l3
	movneg	%xcc,	%o7,	%g3
	fcmpne32	%f14,	%f24,	%o3
	movg	%xcc,	%l6,	%g6
	andcc	%o5,	%g7,	%o2
	fnot2s	%f13,	%f29
	edge32ln	%o6,	%i4,	%i1
	edge32	%g1,	%i3,	%l5
	orn	%g2,	0x1FBE,	%o4
	sethi	0x0555,	%i5
	udiv	%l1,	0x0555,	%i6
	movrlez	%l4,	0x14A,	%l0
	srlx	%i2,	0x04,	%i7
	fsrc1	%f8,	%f2
	addc	%o1,	%i0,	%g5
	fmovd	%f10,	%f12
	popc	0x1E72,	%g4
	nop
	set	0x61, %l4
	ldsb	[%l7 + %l4],	%o0
	ldub	[%l7 + 0x7A],	%l3
	srax	%o7,	%g3,	%o3
	array16	%l2,	%l6,	%g6
	movle	%icc,	%g7,	%o2
	std	%f4,	[%l7 + 0x18]
	mulx	%o5,	0x0C3A,	%o6
	ldsw	[%l7 + 0x50],	%i1
	stw	%i4,	[%l7 + 0x78]
	ldsb	[%l7 + 0x30],	%g1
	srl	%l5,	0x0C,	%g2
	fmul8x16au	%f20,	%f26,	%f28
	udivcc	%i3,	0x023A,	%i5
	movrgz	%l1,	0x2DA,	%o4
	srlx	%l4,	0x11,	%l0
	fpadd16s	%f17,	%f26,	%f0
	ldd	[%l7 + 0x10],	%i6
	movn	%icc,	%i7,	%i2
	bshuffle	%f30,	%f12,	%f4
	xorcc	%i0,	%g5,	%g4
	fmovdcc	%icc,	%f30,	%f8
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%o0
	addccc	%o0,	%o7,	%l3
	restore %g3, %o3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l2,	0x1A9F,	%g6
	andcc	%g7,	0x1888,	%o2
	movg	%icc,	%o6,	%o5
	smul	%i4,	0x04EA,	%i1
	movl	%icc,	%l5,	%g1
	movvc	%xcc,	%i3,	%g2
	movrlz	%i5,	0x38B,	%o4
	for	%f26,	%f26,	%f16
	srl	%l4,	0x0B,	%l0
	sdivcc	%i6,	0x0E83,	%i7
	edge32	%i2,	%i0,	%l1
	movrgz	%g4,	0x0CE,	%g5
	mulx	%o1,	%o0,	%l3
	ldx	[%l7 + 0x38],	%o7
	movg	%xcc,	%o3,	%l6
	ldsh	[%l7 + 0x56],	%g3
	sdivcc	%g6,	0x16AE,	%g7
	orn	%l2,	%o2,	%o6
	movge	%xcc,	%i4,	%i1
	subccc	%o5,	%l5,	%g1
	fpadd16s	%f1,	%f18,	%f0
	fcmple16	%f22,	%f0,	%g2
	edge8ln	%i3,	%o4,	%i5
	edge8l	%l4,	%l0,	%i7
	fmovdn	%icc,	%f14,	%f25
	subccc	%i6,	%i0,	%i2
	andn	%l1,	0x14D7,	%g4
	fmovrsne	%o1,	%f0,	%f11
	andncc	%g5,	%o0,	%o7
	sdivcc	%l3,	0x15AC,	%o3
	edge16l	%g3,	%g6,	%l6
	xor	%l2,	%o2,	%o6
	fcmpne16	%f12,	%f28,	%i4
	xnorcc	%i1,	0x105A,	%o5
	movrgz	%g7,	%g1,	%l5
	smulcc	%i3,	%o4,	%i5
	lduh	[%l7 + 0x46],	%l4
	ldd	[%l7 + 0x40],	%f6
	fandnot1s	%f30,	%f25,	%f15
	addccc	%g2,	0x1678,	%l0
	mulscc	%i7,	0x0599,	%i0
	sir	0x1733
	fnot2s	%f6,	%f9
	edge8n	%i2,	%i6,	%l1
	movcc	%icc,	%g4,	%o1
	subccc	%o0,	%g5,	%l3
	orn	%o3,	%g3,	%g6
	movneg	%xcc,	%o7,	%l6
	fmovsne	%xcc,	%f26,	%f1
	popc	%l2,	%o6
	andn	%i4,	%o2,	%o5
	addc	%g7,	0x1650,	%i1
	edge16	%g1,	%i3,	%o4
	umulcc	%l5,	0x1737,	%l4
	sub	%i5,	0x19E8,	%g2
	movne	%xcc,	%i7,	%i0
	edge16	%l0,	%i2,	%i6
	smul	%l1,	0x0320,	%g4
	lduh	[%l7 + 0x16],	%o1
	lduh	[%l7 + 0x78],	%o0
	fnor	%f4,	%f8,	%f12
	movre	%g5,	0x1CE,	%o3
	movpos	%xcc,	%l3,	%g3
	movge	%icc,	%o7,	%g6
	sdivcc	%l6,	0x15D0,	%l2
	ldd	[%l7 + 0x38],	%f24
	xnorcc	%o6,	%i4,	%o5
	xorcc	%o2,	0x1545,	%i1
	fpsub16	%f28,	%f2,	%f0
	edge32n	%g7,	%g1,	%o4
	udiv	%i3,	0x0F0E,	%l5
	alignaddr	%l4,	%i5,	%i7
	array8	%i0,	%g2,	%i2
	movle	%icc,	%i6,	%l1
	movre	%g4,	%l0,	%o0
	movrgez	%g5,	0x3CC,	%o1
	movn	%icc,	%o3,	%g3
	edge32ln	%l3,	%o7,	%l6
	ldx	[%l7 + 0x10],	%g6
	edge16	%l2,	%o6,	%i4
	subcc	%o2,	%o5,	%i1
	movrne	%g1,	%g7,	%o4
	xnor	%i3,	0x0F3E,	%l5
	movre	%l4,	0x14F,	%i5
	movneg	%icc,	%i7,	%i0
	udivx	%i2,	0x1E19,	%i6
	movvc	%xcc,	%g2,	%g4
	fabsd	%f6,	%f2
	xorcc	%l0,	%o0,	%g5
	addcc	%o1,	%l1,	%g3
	fmuld8ulx16	%f12,	%f2,	%f16
	fmovrdlez	%o3,	%f6,	%f18
	fmuld8sux16	%f22,	%f23,	%f16
	or	%l3,	%l6,	%o7
	ld	[%l7 + 0x5C],	%f19
	sdivcc	%l2,	0x03D0,	%o6
	orn	%i4,	%g6,	%o5
	edge32ln	%o2,	%i1,	%g1
	edge8l	%g7,	%o4,	%i3
	srl	%l5,	%l4,	%i7
	movrgez	%i0,	0x054,	%i5
	fpadd16	%f24,	%f6,	%f2
	fands	%f24,	%f15,	%f30
	movvs	%xcc,	%i6,	%g2
	ldd	[%l7 + 0x58],	%f24
	fpsub16	%f8,	%f10,	%f10
	sdivcc	%g4,	0x0293,	%i2
	addc	%o0,	%l0,	%g5
	srl	%l1,	0x0D,	%o1
	movneg	%icc,	%o3,	%g3
	fmovdl	%xcc,	%f0,	%f22
	xnorcc	%l6,	0x1D65,	%l3
	mova	%icc,	%o7,	%l2
	fmovrdne	%i4,	%f30,	%f18
	fabss	%f22,	%f26
	movre	%g6,	0x300,	%o6
	movne	%icc,	%o5,	%o2
	sra	%g1,	0x0B,	%g7
	fnot1	%f0,	%f12
	movrgz	%i1,	0x189,	%o4
	udiv	%i3,	0x0905,	%l5
	mulx	%i7,	%i0,	%l4
	movre	%i5,	%g2,	%g4
	fzeros	%f31
	fcmpne32	%f22,	%f22,	%i2
	or	%i6,	0x087D,	%o0
	or	%l0,	%g5,	%l1
	andcc	%o1,	0x0A7B,	%o3
	movrgez	%l6,	%l3,	%o7
	stx	%g3,	[%l7 + 0x68]
	sth	%i4,	[%l7 + 0x5A]
	orn	%l2,	%o6,	%g6
	stx	%o5,	[%l7 + 0x68]
	fcmps	%fcc2,	%f19,	%f23
	srlx	%g1,	%g7,	%i1
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	srlx	%l5,	%i3,	%i7
	sub	%i0,	0x07EF,	%l4
	fcmpd	%fcc0,	%f8,	%f26
	stx	%i5,	[%l7 + 0x20]
	subcc	%g2,	%g4,	%i6
	addcc	%i2,	%o0,	%g5
	srlx	%l0,	%o1,	%l1
	fmovdl	%icc,	%f31,	%f31
	movne	%xcc,	%o3,	%l3
	fornot2	%f30,	%f8,	%f20
	fpadd32	%f12,	%f18,	%f18
	movcs	%icc,	%o7,	%l6
	ldd	[%l7 + 0x60],	%g2
	save %i4, 0x0F91, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f11,	%f30,	%f21
	ldsh	[%l7 + 0x34],	%g6
	fpsub16s	%f0,	%f25,	%f22
	sub	%l2,	0x0224,	%o5
	and	%g7,	%i1,	%g1
	movrgez	%o2,	%l5,	%i3
	mulx	%o4,	0x125E,	%i7
	movre	%i0,	0x0C8,	%l4
	edge8l	%i5,	%g2,	%i6
	stw	%g4,	[%l7 + 0x20]
	udiv	%o0,	0x0233,	%i2
	fmovscc	%icc,	%f5,	%f3
	subccc	%l0,	0x0D11,	%g5
	fsrc1	%f4,	%f8
	movg	%icc,	%l1,	%o3
	edge32ln	%o1,	%o7,	%l6
	xorcc	%g3,	%l3,	%o6
	fmovsvs	%xcc,	%f14,	%f27
	movge	%xcc,	%i4,	%g6
	subc	%o5,	%g7,	%l2
	ldd	[%l7 + 0x28],	%g0
	ldsh	[%l7 + 0x30],	%o2
	edge16n	%i1,	%l5,	%i3
	alignaddrl	%o4,	%i0,	%i7
	srax	%i5,	0x0E,	%g2
	sethi	0x1E2C,	%l4
	alignaddr	%i6,	%o0,	%i2
	orcc	%g4,	0x13AA,	%l0
	fzero	%f10
	fmovdcc	%xcc,	%f30,	%f14
	or	%l1,	0x14DE,	%o3
	fabss	%f12,	%f1
	fcmpd	%fcc3,	%f22,	%f22
	sdiv	%g5,	0x1F30,	%o1
	edge16	%l6,	%g3,	%o7
	movrlz	%o6,	%i4,	%l3
	movgu	%xcc,	%g6,	%o5
	stx	%l2,	[%l7 + 0x40]
	smul	%g7,	%o2,	%g1
	fabsd	%f2,	%f2
	movle	%icc,	%i1,	%i3
	fnot1	%f16,	%f0
	movn	%xcc,	%l5,	%i0
	fmovdvc	%xcc,	%f5,	%f21
	ld	[%l7 + 0x40],	%f5
	fmovdn	%xcc,	%f0,	%f23
	movpos	%icc,	%i7,	%o4
	movrlez	%g2,	%i5,	%i6
	subc	%l4,	%i2,	%o0
	fcmps	%fcc2,	%f5,	%f20
	sllx	%g4,	0x16,	%l1
	udivcc	%o3,	0x15C6,	%g5
	sllx	%o1,	0x1C,	%l0
	sub	%l6,	0x0043,	%g3
	save %o7, %o6, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x20],	%i4
	fmovrdne	%g6,	%f22,	%f28
	array8	%l2,	%o5,	%g7
	subc	%o2,	0x0D57,	%i1
	sdivcc	%i3,	0x0C18,	%g1
	srlx	%l5,	0x1E,	%i0
	edge8l	%i7,	%g2,	%o4
	subcc	%i5,	%i6,	%l4
	fone	%f10
	sub	%o0,	%g4,	%i2
	ldub	[%l7 + 0x75],	%o3
	fsrc1s	%f31,	%f27
	srlx	%l1,	0x07,	%o1
	udivx	%l0,	0x0B4F,	%l6
	ldub	[%l7 + 0x69],	%g3
	fors	%f27,	%f3,	%f19
	edge32l	%g5,	%o6,	%o7
	smulcc	%l3,	0x1E1B,	%g6
	udivx	%l2,	0x162F,	%o5
	fmovdvs	%icc,	%f28,	%f20
	sethi	0x0D9E,	%i4
	ldsb	[%l7 + 0x71],	%o2
	udiv	%g7,	0x11B3,	%i1
	sllx	%g1,	0x15,	%i3
	addc	%i0,	0x123E,	%l5
	mulscc	%g2,	%o4,	%i5
	fpadd16s	%f4,	%f26,	%f9
	fnot1	%f12,	%f8
	array8	%i6,	%l4,	%o0
	edge32n	%g4,	%i7,	%o3
	movrne	%l1,	%o1,	%i2
	orcc	%l0,	0x0F08,	%g3
	edge32n	%g5,	%l6,	%o6
	movge	%xcc,	%l3,	%o7
	edge32ln	%l2,	%o5,	%i4
	ldsh	[%l7 + 0x4C],	%o2
	fxnor	%f18,	%f28,	%f20
	array16	%g6,	%i1,	%g1
	array32	%i3,	%g7,	%i0
	orncc	%g2,	%l5,	%i5
	movneg	%xcc,	%i6,	%l4
	movpos	%xcc,	%o4,	%o0
	fnand	%f4,	%f12,	%f2
	sethi	0x0B1D,	%i7
	edge32	%g4,	%l1,	%o3
	ld	[%l7 + 0x34],	%f2
	orn	%i2,	%o1,	%l0
	umulcc	%g3,	%g5,	%o6
	fpadd32s	%f7,	%f23,	%f18
	fmovsne	%xcc,	%f29,	%f6
	orcc	%l6,	0x0F10,	%o7
	movg	%icc,	%l2,	%o5
	xnor	%i4,	0x12F2,	%l3
	or	%g6,	0x1A96,	%i1
	ldd	[%l7 + 0x28],	%g0
	edge16n	%o2,	%g7,	%i0
	srl	%i3,	%l5,	%g2
	fmovdn	%xcc,	%f9,	%f0
	fxors	%f15,	%f9,	%f20
	movvc	%icc,	%i5,	%l4
	movcs	%icc,	%i6,	%o4
	stw	%i7,	[%l7 + 0x30]
	st	%f1,	[%l7 + 0x70]
	andn	%o0,	%g4,	%l1
	movneg	%xcc,	%i2,	%o1
	stb	%o3,	[%l7 + 0x3B]
	array32	%g3,	%l0,	%o6
	movrlz	%g5,	0x126,	%o7
	fandnot1	%f14,	%f2,	%f16
	sir	0x1A00
	xnor	%l6,	0x07B0,	%l2
	fmovsle	%icc,	%f28,	%f29
	std	%f10,	[%l7 + 0x50]
	edge32ln	%o5,	%i4,	%g6
	nop
	set	0x6C, %o2
	ldub	[%l7 + %o2],	%i1
	fmul8x16au	%f17,	%f14,	%f26
	fpsub32	%f24,	%f4,	%f2
	nop
	set	0x76, %l5
	lduh	[%l7 + %l5],	%l3
	subccc	%g1,	%o2,	%g7
	std	%f12,	[%l7 + 0x28]
	srl	%i3,	%i0,	%l5
	srax	%g2,	%i5,	%i6
	sdiv	%o4,	0x0C61,	%i7
	fmul8x16au	%f4,	%f25,	%f2
	sll	%l4,	0x03,	%o0
	mulscc	%g4,	%i2,	%o1
	edge32n	%l1,	%o3,	%g3
	fmovrsne	%l0,	%f21,	%f28
	udivcc	%o6,	0x0A94,	%g5
	ldx	[%l7 + 0x18],	%l6
	popc	%o7,	%o5
	orn	%l2,	0x134E,	%g6
	umul	%i1,	%i4,	%l3
	srlx	%o2,	0x05,	%g7
	fzero	%f0
	sra	%i3,	0x10,	%g1
	ld	[%l7 + 0x3C],	%f19
	sir	0x0D46
	ld	[%l7 + 0x24],	%f5
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%f4
	fmovdcs	%icc,	%f5,	%f4
	xor	%l5,	%g2,	%i0
	fpsub32	%f4,	%f24,	%f12
	sth	%i5,	[%l7 + 0x76]
	edge16ln	%o4,	%i6,	%l4
	udivcc	%i7,	0x1D22,	%g4
	movre	%i2,	0x01B,	%o0
	edge32n	%l1,	%o1,	%o3
	edge8n	%l0,	%g3,	%o6
	edge8l	%g5,	%l6,	%o7
	mulx	%o5,	%l2,	%i1
	addccc	%i4,	0x0F29,	%g6
	orn	%o2,	0x0CE2,	%g7
	fxnor	%f10,	%f28,	%f0
	movrgez	%i3,	%l3,	%g1
	addccc	%g2,	%l5,	%i5
	subc	%i0,	0x0182,	%o4
	fcmpgt16	%f24,	%f26,	%l4
	edge32ln	%i7,	%g4,	%i2
	alignaddrl	%i6,	%l1,	%o1
	movrne	%o3,	%l0,	%g3
	smulcc	%o0,	%g5,	%l6
	orn	%o7,	%o6,	%o5
	fmovrsgz	%i1,	%f29,	%f2
	srlx	%l2,	%i4,	%g6
	movl	%xcc,	%o2,	%i3
	popc	%l3,	%g7
	movcs	%icc,	%g2,	%g1
	movcc	%xcc,	%i5,	%l5
	movcc	%xcc,	%i0,	%l4
	movneg	%icc,	%i7,	%o4
	fmovrsne	%g4,	%f31,	%f18
	fmovrdne	%i6,	%f30,	%f10
	edge8n	%i2,	%o1,	%o3
	fnot2s	%f10,	%f1
	edge8ln	%l0,	%g3,	%l1
	fmovdvc	%icc,	%f21,	%f31
	xnor	%g5,	0x1045,	%o0
	move	%icc,	%l6,	%o6
	movre	%o7,	%o5,	%i1
	movne	%icc,	%l2,	%i4
	stw	%g6,	[%l7 + 0x54]
	srl	%o2,	0x14,	%i3
	sub	%g7,	0x09C3,	%l3
	fors	%f15,	%f29,	%f27
	fmul8ulx16	%f20,	%f2,	%f2
	lduh	[%l7 + 0x12],	%g2
	fcmple16	%f20,	%f12,	%g1
	ldsw	[%l7 + 0x30],	%l5
	edge16n	%i0,	%l4,	%i7
	move	%icc,	%o4,	%i5
	sir	0x11D8
	movrgz	%i6,	%i2,	%g4
	movrlez	%o1,	%o3,	%g3
	fmovrsgez	%l1,	%f18,	%f16
	andn	%l0,	0x1966,	%g5
	fnot1s	%f12,	%f4
	mulx	%l6,	0x1101,	%o6
	lduw	[%l7 + 0x2C],	%o0
	srax	%o5,	%i1,	%o7
	edge16	%i4,	%g6,	%o2
	mulx	%i3,	0x1118,	%l2
	movvs	%icc,	%g7,	%l3
	move	%icc,	%g2,	%g1
	movne	%icc,	%l5,	%l4
	movleu	%icc,	%i0,	%i7
	movl	%icc,	%i5,	%o4
	fmovsg	%xcc,	%f21,	%f15
	umulcc	%i2,	%i6,	%o1
	edge16n	%o3,	%g4,	%g3
	andcc	%l1,	0x1A5A,	%l0
	ld	[%l7 + 0x1C],	%f24
	sth	%l6,	[%l7 + 0x18]
	fmul8x16al	%f15,	%f21,	%f22
	ldsh	[%l7 + 0x52],	%g5
	fmovse	%icc,	%f11,	%f29
	ldd	[%l7 + 0x58],	%f8
	sth	%o6,	[%l7 + 0x70]
	movneg	%icc,	%o0,	%o5
	movl	%icc,	%o7,	%i1
	ldub	[%l7 + 0x49],	%i4
	edge16	%g6,	%o2,	%i3
	edge8n	%l2,	%l3,	%g7
	fmovdpos	%icc,	%f7,	%f28
	fmovrslz	%g2,	%f15,	%f27
	movpos	%xcc,	%g1,	%l4
	ldsb	[%l7 + 0x4A],	%l5
	orn	%i7,	0x03F4,	%i0
	fmovrslz	%o4,	%f11,	%f1
	fmovde	%icc,	%f20,	%f16
	xnorcc	%i2,	0x17BE,	%i5
	movcs	%icc,	%o1,	%i6
	edge16	%g4,	%g3,	%o3
	smulcc	%l1,	0x0F3E,	%l6
	srl	%g5,	0x10,	%o6
	movcs	%icc,	%l0,	%o5
	andncc	%o7,	%i1,	%i4
	or	%g6,	%o0,	%i3
	st	%f7,	[%l7 + 0x08]
	fmovrdgz	%o2,	%f10,	%f20
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%l2
	ldd	[%l7 + 0x08],	%f26
	or	%g7,	0x05A6,	%l3
	fcmps	%fcc3,	%f24,	%f27
	edge16	%g2,	%g1,	%l4
	fzero	%f20
	sir	0x0EB2
	movge	%xcc,	%i7,	%l5
	umul	%o4,	%i0,	%i5
	edge16	%i2,	%o1,	%i6
	stx	%g4,	[%l7 + 0x50]
	add	%o3,	%l1,	%g3
	addccc	%g5,	%l6,	%o6
	movrgz	%l0,	0x229,	%o7
	move	%icc,	%i1,	%i4
	sll	%g6,	%o0,	%i3
	ldub	[%l7 + 0x26],	%o5
	nop
	set	0x58, %o4
	ldsw	[%l7 + %o4],	%o2
	st	%f13,	[%l7 + 0x74]
	movcs	%icc,	%l2,	%l3
	add	%g7,	0x149E,	%g2
	sethi	0x1271,	%g1
	add	%i7,	%l5,	%o4
	ldub	[%l7 + 0x72],	%l4
	lduh	[%l7 + 0x3A],	%i5
	popc	%i2,	%i0
	fpsub32	%f20,	%f30,	%f6
	subccc	%i6,	0x138B,	%o1
	fcmple32	%f12,	%f16,	%o3
	move	%icc,	%g4,	%l1
	fmovrsgez	%g3,	%f11,	%f18
	pdist	%f20,	%f14,	%f8
	movleu	%xcc,	%l6,	%o6
	xorcc	%g5,	%o7,	%i1
	subcc	%i4,	%l0,	%g6
	ldub	[%l7 + 0x64],	%i3
	sdivx	%o5,	0x1C93,	%o2
	edge16l	%o0,	%l3,	%l2
	ldsh	[%l7 + 0x4A],	%g2
	andn	%g1,	0x0773,	%g7
	xor	%l5,	%o4,	%i7
	fmovsl	%icc,	%f4,	%f25
	edge32ln	%l4,	%i5,	%i0
	array16	%i2,	%o1,	%o3
	movvc	%icc,	%i6,	%g4
	edge16ln	%g3,	%l6,	%l1
	umul	%o6,	%g5,	%o7
	and	%i4,	0x01D5,	%i1
	edge8	%g6,	%i3,	%l0
	edge32n	%o5,	%o0,	%o2
	ldub	[%l7 + 0x44],	%l2
	ldd	[%l7 + 0x38],	%f18
	orncc	%l3,	%g1,	%g7
	andcc	%g2,	%o4,	%i7
	alignaddrl	%l4,	%i5,	%i0
	movne	%xcc,	%i2,	%o1
	xnor	%o3,	0x18F3,	%l5
	addc	%g4,	%i6,	%g3
	movvs	%icc,	%l1,	%o6
	fpack32	%f30,	%f16,	%f12
	movcs	%xcc,	%l6,	%g5
	mulscc	%o7,	0x1F18,	%i1
	stb	%i4,	[%l7 + 0x51]
	edge32n	%i3,	%l0,	%g6
	fmovdg	%xcc,	%f16,	%f10
	fmovsa	%icc,	%f7,	%f20
	movre	%o0,	0x0E4,	%o2
	st	%f10,	[%l7 + 0x10]
	fmuld8sux16	%f7,	%f3,	%f16
	sdivcc	%l2,	0x1A39,	%o5
	fmovrsgz	%g1,	%f30,	%f14
	fandnot2	%f2,	%f6,	%f22
	srax	%g7,	%l3,	%g2
	subccc	%i7,	%l4,	%o4
	subccc	%i5,	%i2,	%i0
	movneg	%icc,	%o3,	%l5
	ldd	[%l7 + 0x18],	%f28
	movvs	%icc,	%g4,	%o1
	srl	%g3,	0x17,	%l1
	fxors	%f5,	%f8,	%f5
	orn	%o6,	%l6,	%g5
	andn	%o7,	%i1,	%i4
	alignaddrl	%i3,	%i6,	%g6
	fxors	%f29,	%f1,	%f28
	edge16	%l0,	%o2,	%l2
	sir	0x018F
	fmovrsne	%o0,	%f25,	%f15
	udiv	%o5,	0x09E6,	%g7
	xnorcc	%l3,	%g2,	%i7
	xorcc	%l4,	%o4,	%g1
	mulx	%i2,	%i5,	%o3
	mulx	%l5,	%g4,	%i0
	fone	%f20
	fnor	%f0,	%f0,	%f16
	sdiv	%o1,	0x096D,	%l1
	movgu	%xcc,	%g3,	%l6
	fmovrse	%o6,	%f5,	%f13
	orncc	%o7,	0x1E86,	%g5
	fmovdvs	%icc,	%f1,	%f0
	move	%xcc,	%i1,	%i4
	alignaddr	%i6,	%i3,	%l0
	edge16ln	%o2,	%g6,	%o0
	sub	%o5,	0x13F5,	%l2
	lduh	[%l7 + 0x7E],	%l3
	sll	%g2,	0x18,	%g7
	lduw	[%l7 + 0x68],	%i7
	fmovrdlez	%l4,	%f26,	%f20
	fornot1s	%f4,	%f5,	%f7
	movrlez	%o4,	%i2,	%i5
	smulcc	%o3,	0x15F4,	%g1
	fmovsleu	%icc,	%f19,	%f19
	movrlez	%g4,	0x1AC,	%l5
	movvc	%icc,	%i0,	%o1
	fmovs	%f25,	%f8
	movge	%icc,	%l1,	%g3
	orncc	%l6,	0x0A45,	%o7
	movcc	%icc,	%o6,	%g5
	array32	%i4,	%i1,	%i3
	mova	%xcc,	%i6,	%o2
	fpackfix	%f16,	%f15
	movleu	%icc,	%l0,	%g6
	sth	%o0,	[%l7 + 0x64]
	fpsub16s	%f19,	%f8,	%f30
	fornot1s	%f2,	%f16,	%f15
	sdivcc	%l2,	0x1053,	%o5
	edge8	%l3,	%g2,	%g7
	edge16ln	%i7,	%o4,	%i2
	fmuld8sux16	%f14,	%f13,	%f6
	movrgz	%l4,	%i5,	%g1
	popc	%o3,	%g4
	ldd	[%l7 + 0x30],	%i0
	xnorcc	%l5,	0x0399,	%o1
	ldsh	[%l7 + 0x08],	%g3
	or	%l6,	0x1188,	%l1
	restore %o6, 0x0D6B, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i4,	%g5,	%i1
	fmul8sux16	%f24,	%f26,	%f22
	andn	%i6,	0x190C,	%i3
	edge32ln	%l0,	%o2,	%g6
	fmovrse	%l2,	%f12,	%f6
	fands	%f13,	%f21,	%f21
	movl	%icc,	%o5,	%l3
	xorcc	%g2,	%g7,	%o0
	movge	%xcc,	%i7,	%o4
	lduw	[%l7 + 0x5C],	%l4
	edge32l	%i5,	%g1,	%i2
	fmovrdne	%g4,	%f30,	%f8
	stb	%o3,	[%l7 + 0x3B]
	andcc	%l5,	0x0F1E,	%i0
	orncc	%g3,	%l6,	%l1
	udivx	%o1,	0x1878,	%o7
	fmovdg	%xcc,	%f13,	%f2
	fmovsneg	%icc,	%f16,	%f14
	sir	0x0692
	fmuld8ulx16	%f22,	%f22,	%f2
	srl	%i4,	%o6,	%i1
	edge16n	%i6,	%i3,	%l0
	for	%f2,	%f8,	%f10
	ldd	[%l7 + 0x08],	%o2
	ldsh	[%l7 + 0x62],	%g5
	lduw	[%l7 + 0x7C],	%l2
	fpsub16s	%f23,	%f2,	%f23
	smul	%o5,	0x1ABA,	%l3
	pdist	%f12,	%f12,	%f20
	movvs	%xcc,	%g6,	%g2
	udivx	%o0,	0x0A29,	%i7
	xor	%o4,	0x1040,	%l4
	sdivcc	%i5,	0x0135,	%g7
	fpsub32s	%f18,	%f22,	%f8
	fmovrsne	%g1,	%f20,	%f17
	std	%f16,	[%l7 + 0x68]
	udivcc	%i2,	0x1BE9,	%g4
	subccc	%o3,	0x1194,	%l5
	edge8ln	%i0,	%l6,	%l1
	stx	%g3,	[%l7 + 0x70]
	fones	%f14
	movgu	%icc,	%o7,	%o1
	fmovdvs	%icc,	%f22,	%f18
	popc	0x0B16,	%i4
	subc	%o6,	%i6,	%i1
	save %l0, 0x1D85, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o2,	%g5,	%l2
	edge32l	%o5,	%l3,	%g2
	fmovrse	%g6,	%f27,	%f16
	sllx	%o0,	0x1D,	%i7
	and	%l4,	%i5,	%g7
	udivx	%g1,	0x14C4,	%o4
	udiv	%g4,	0x1405,	%o3
	subcc	%l5,	0x1034,	%i0
	mova	%icc,	%l6,	%i2
	subccc	%l1,	0x1FEB,	%g3
	sethi	0x08B7,	%o7
	mulx	%o1,	0x17DA,	%o6
	udivx	%i4,	0x1D24,	%i1
	nop
	set	0x36, %g4
	stb	%i6,	[%l7 + %g4]
	smul	%l0,	%o2,	%g5
	edge8l	%l2,	%o5,	%i3
	movn	%xcc,	%l3,	%g6
	stb	%g2,	[%l7 + 0x3D]
	ld	[%l7 + 0x30],	%f1
	udivcc	%i7,	0x0AE8,	%l4
	edge16n	%i5,	%o0,	%g1
	movrlz	%g7,	0x091,	%g4
	fxor	%f18,	%f28,	%f6
	edge16n	%o3,	%o4,	%i0
	alignaddr	%l6,	%i2,	%l5
	ldd	[%l7 + 0x78],	%g2
	ld	[%l7 + 0x68],	%f13
	ldx	[%l7 + 0x38],	%o7
	st	%f13,	[%l7 + 0x18]
	xor	%o1,	0x0FD1,	%o6
	mulscc	%i4,	0x1373,	%l1
	lduw	[%l7 + 0x54],	%i6
	ldd	[%l7 + 0x60],	%f24
	fmovdg	%xcc,	%f27,	%f24
	subccc	%l0,	%i1,	%g5
	std	%f14,	[%l7 + 0x58]
	ld	[%l7 + 0x34],	%f28
	edge32n	%o2,	%o5,	%l2
	array32	%i3,	%l3,	%g2
	movvs	%icc,	%i7,	%g6
	fmovdcs	%icc,	%f28,	%f1
	sdiv	%i5,	0x1C91,	%l4
	edge32l	%g1,	%g7,	%g4
	fxors	%f0,	%f29,	%f20
	sdivcc	%o0,	0x1613,	%o4
	move	%xcc,	%i0,	%l6
	addc	%o3,	%l5,	%g3
	mulscc	%o7,	%o1,	%o6
	fmovdl	%icc,	%f28,	%f19
	fmovdleu	%xcc,	%f7,	%f22
	alignaddr	%i2,	%i4,	%i6
	edge8ln	%l1,	%i1,	%g5
	srlx	%l0,	%o2,	%o5
	stw	%l2,	[%l7 + 0x6C]
	std	%f30,	[%l7 + 0x08]
	ld	[%l7 + 0x3C],	%f25
	array32	%i3,	%l3,	%i7
	array16	%g6,	%g2,	%l4
	fmuld8sux16	%f5,	%f13,	%f28
	ldsw	[%l7 + 0x64],	%g1
	lduh	[%l7 + 0x22],	%g7
	movre	%g4,	0x23D,	%o0
	fmuld8ulx16	%f0,	%f4,	%f6
	array16	%o4,	%i5,	%l6
	fmovrdlez	%i0,	%f24,	%f4
	array8	%o3,	%g3,	%l5
	for	%f20,	%f24,	%f10
	alignaddr	%o1,	%o7,	%o6
	fornot1	%f14,	%f24,	%f26
	subc	%i2,	%i4,	%l1
	fmovrde	%i6,	%f0,	%f4
	sdiv	%i1,	0x05F3,	%g5
	srax	%l0,	%o2,	%l2
	movne	%icc,	%i3,	%l3
	edge16n	%i7,	%g6,	%g2
	subccc	%l4,	0x1B5C,	%o5
	addc	%g1,	%g4,	%g7
	stx	%o0,	[%l7 + 0x10]
	fnors	%f17,	%f29,	%f19
	save %i5, 0x078B, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f16,	%f0,	%f4
	subcc	%i0,	0x122C,	%o4
	movleu	%xcc,	%g3,	%o3
	umulcc	%l5,	0x116B,	%o7
	fmovrdne	%o1,	%f8,	%f30
	fnegs	%f28,	%f17
	fxor	%f14,	%f20,	%f16
	sdivx	%o6,	0x0F0F,	%i2
	fabsd	%f4,	%f28
	sir	0x1BBC
	addcc	%l1,	0x04EF,	%i6
	array32	%i4,	%i1,	%g5
	fnors	%f17,	%f10,	%f27
	udivx	%o2,	0x139B,	%l0
	mulscc	%l2,	%l3,	%i7
	lduh	[%l7 + 0x34],	%i3
	movrne	%g2,	0x29B,	%g6
	stx	%o5,	[%l7 + 0x70]
	movrlez	%l4,	%g1,	%g4
	sir	0x1144
	fmovrdgez	%g7,	%f18,	%f8
	fmovrsne	%i5,	%f8,	%f4
	fmovdleu	%icc,	%f20,	%f5
	faligndata	%f24,	%f20,	%f24
	alignaddr	%o0,	%l6,	%i0
	popc	0x0EF9,	%g3
	udivcc	%o4,	0x1A89,	%o3
	edge16n	%o7,	%o1,	%o6
	edge8l	%i2,	%l5,	%l1
	umulcc	%i4,	%i1,	%g5
	array16	%i6,	%o2,	%l0
	andcc	%l3,	0x1C0C,	%l2
	sll	%i7,	0x0C,	%i3
	edge16	%g2,	%o5,	%g6
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	subc	%g7,	0x0869,	%o0
	udivx	%l6,	0x1666,	%i0
	umulcc	%g3,	0x0EC5,	%i5
	fpack32	%f26,	%f8,	%f6
	or	%o4,	%o7,	%o3
	ldsh	[%l7 + 0x36],	%o6
	movrlez	%o1,	%l5,	%l1
	subccc	%i4,	%i1,	%i2
	andncc	%i6,	%g5,	%o2
	fmovda	%icc,	%f4,	%f20
	xnor	%l0,	%l3,	%i7
	mulx	%l2,	0x1D60,	%g2
	udivx	%i3,	0x0394,	%o5
	stw	%g6,	[%l7 + 0x0C]
	movrgez	%g4,	0x0AB,	%g1
	alignaddr	%g7,	%l4,	%l6
	sll	%o0,	0x13,	%i0
	ldd	[%l7 + 0x38],	%i4
	fpadd32s	%f31,	%f10,	%f12
	edge32ln	%g3,	%o4,	%o3
	ldsb	[%l7 + 0x10],	%o6
	stw	%o7,	[%l7 + 0x6C]
	alignaddrl	%o1,	%l1,	%l5
	fpsub32s	%f3,	%f4,	%f7
	srlx	%i1,	%i2,	%i4
	movge	%icc,	%g5,	%o2
	addcc	%i6,	%l3,	%l0
	ldsw	[%l7 + 0x48],	%i7
	st	%f15,	[%l7 + 0x20]
	fones	%f9
	xnor	%g2,	%l2,	%i3
	fandnot1s	%f9,	%f22,	%f12
	bshuffle	%f24,	%f18,	%f6
	srlx	%o5,	0x1E,	%g6
	array8	%g4,	%g1,	%l4
	alignaddr	%l6,	%g7,	%i0
	array16	%o0,	%i5,	%o4
	srax	%o3,	%o6,	%o7
	srl	%g3,	0x0B,	%l1
	movvs	%xcc,	%l5,	%i1
	fone	%f14
	fornot2s	%f10,	%f22,	%f21
	or	%o1,	0x1DE3,	%i4
	fandnot1	%f14,	%f10,	%f14
	edge32l	%i2,	%o2,	%g5
	ldub	[%l7 + 0x0E],	%l3
	ldx	[%l7 + 0x50],	%i6
	movgu	%xcc,	%i7,	%l0
	andcc	%g2,	%l2,	%o5
	movn	%icc,	%g6,	%i3
	movvc	%icc,	%g4,	%l4
	movle	%icc,	%g1,	%l6
	fsrc2s	%f5,	%f10
	sdivcc	%g7,	0x0287,	%o0
	fmovrde	%i0,	%f26,	%f6
	movrlez	%i5,	%o4,	%o3
	fornot2s	%f24,	%f9,	%f11
	movvc	%xcc,	%o7,	%g3
	edge32l	%o6,	%l5,	%i1
	stx	%o1,	[%l7 + 0x28]
	fmovdgu	%xcc,	%f10,	%f20
	fmovsa	%icc,	%f28,	%f14
	mova	%icc,	%l1,	%i4
	edge8l	%i2,	%g5,	%l3
	andcc	%o2,	%i6,	%l0
	fone	%f30
	edge32	%i7,	%g2,	%o5
	movre	%l2,	0x2AB,	%i3
	srl	%g4,	%l4,	%g6
	edge16n	%l6,	%g1,	%g7
	udiv	%i0,	0x0253,	%i5
	sll	%o0,	%o4,	%o7
	alignaddrl	%o3,	%g3,	%l5
	nop
	set	0x1D, %i2
	ldsb	[%l7 + %i2],	%i1
	movrlez	%o6,	0x035,	%l1
	edge16ln	%o1,	%i2,	%i4
	umulcc	%l3,	%o2,	%g5
	fpack32	%f18,	%f14,	%f22
	sllx	%l0,	%i6,	%i7
	addc	%o5,	%g2,	%i3
	popc	%g4,	%l2
	mulscc	%g6,	%l4,	%l6
	movvc	%icc,	%g7,	%i0
	edge8	%i5,	%o0,	%o4
	movpos	%xcc,	%g1,	%o3
	srl	%o7,	0x1F,	%g3
	stb	%l5,	[%l7 + 0x79]
	addccc	%i1,	0x0B96,	%l1
	addc	%o1,	%o6,	%i4
	fexpand	%f3,	%f18
	bshuffle	%f16,	%f22,	%f26
	addcc	%i2,	0x11FA,	%l3
	srl	%g5,	0x0E,	%o2
	fmovdg	%icc,	%f4,	%f28
	fcmps	%fcc2,	%f3,	%f3
	movvs	%icc,	%l0,	%i6
	fand	%f28,	%f8,	%f26
	fmovsa	%xcc,	%f7,	%f1
	ldd	[%l7 + 0x48],	%f30
	subcc	%o5,	%i7,	%i3
	fmovdcc	%xcc,	%f0,	%f16
	srax	%g2,	0x07,	%l2
	subcc	%g4,	%g6,	%l4
	andn	%l6,	%g7,	%i0
	fmovrde	%o0,	%f14,	%f26
	movle	%icc,	%i5,	%o4
	srlx	%o3,	0x14,	%o7
	fmovsvc	%xcc,	%f5,	%f15
	movgu	%xcc,	%g3,	%g1
	fxor	%f24,	%f20,	%f12
	movg	%xcc,	%l5,	%i1
	ldsb	[%l7 + 0x37],	%l1
	udivx	%o1,	0x049F,	%i4
	movcs	%icc,	%o6,	%i2
	smul	%g5,	0x006A,	%l3
	movrlz	%l0,	0x201,	%o2
	or	%o5,	0x0C84,	%i6
	edge8ln	%i7,	%g2,	%i3
	lduw	[%l7 + 0x78],	%l2
	movne	%xcc,	%g4,	%l4
	smul	%l6,	%g6,	%g7
	xor	%o0,	%i0,	%o4
	sdiv	%i5,	0x1C39,	%o7
	movle	%icc,	%g3,	%o3
	popc	%l5,	%i1
	ldd	[%l7 + 0x18],	%g0
	fnand	%f26,	%f2,	%f24
	smulcc	%l1,	%i4,	%o1
	fmovrsgz	%i2,	%f26,	%f21
	sra	%g5,	0x08,	%l3
	sdivx	%l0,	0x1B89,	%o6
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%f8
	fmovsn	%xcc,	%f0,	%f30
	movneg	%icc,	%o5,	%o2
	st	%f16,	[%l7 + 0x78]
	array16	%i7,	%g2,	%i6
	popc	%l2,	%g4
	subc	%i3,	%l6,	%g6
	fmovda	%icc,	%f16,	%f16
	udivx	%l4,	0x0065,	%o0
	andcc	%g7,	%i0,	%o4
	move	%xcc,	%o7,	%i5
	fmovdgu	%xcc,	%f11,	%f28
	fpadd32s	%f26,	%f28,	%f27
	edge8	%o3,	%l5,	%g3
	xorcc	%g1,	%l1,	%i4
	ldsb	[%l7 + 0x3A],	%o1
	and	%i2,	0x1A5D,	%i1
	nop
	set	0x29, %o5
	ldub	[%l7 + %o5],	%l3
	movrgz	%g5,	0x06E,	%l0
	edge32ln	%o6,	%o5,	%i7
	add	%g2,	%o2,	%l2
	edge32l	%i6,	%g4,	%i3
	fornot2	%f22,	%f18,	%f2
	lduw	[%l7 + 0x34],	%l6
	fsrc1s	%f8,	%f15
	fmovdpos	%icc,	%f23,	%f10
	umul	%l4,	%o0,	%g7
	alignaddrl	%g6,	%o4,	%o7
	edge32l	%i5,	%o3,	%i0
	sdiv	%l5,	0x08BE,	%g1
	addc	%g3,	%i4,	%l1
	fpsub32	%f30,	%f2,	%f26
	movne	%xcc,	%o1,	%i2
	xorcc	%i1,	0x0287,	%g5
	ld	[%l7 + 0x58],	%f8
	fpsub16s	%f5,	%f20,	%f31
	ldd	[%l7 + 0x58],	%l2
	fornot2s	%f11,	%f9,	%f11
	edge8l	%l0,	%o5,	%i7
	sra	%o6,	0x15,	%o2
	sethi	0x1CED,	%l2
	siam	0x0
	orcc	%i6,	%g4,	%g2
	ldsw	[%l7 + 0x1C],	%i3
	sub	%l6,	0x06ED,	%l4
	mova	%xcc,	%o0,	%g7
	array8	%o4,	%g6,	%o7
	nop
	set	0x78, %i6
	ldx	[%l7 + %i6],	%i5
	ldsb	[%l7 + 0x6F],	%o3
	save %i0, %l5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f9,	%f19
	movge	%icc,	%i4,	%g1
	edge32ln	%l1,	%i2,	%o1
	smulcc	%i1,	%l3,	%l0
	umulcc	%o5,	0x160F,	%i7
	pdist	%f28,	%f24,	%f2
	ldub	[%l7 + 0x77],	%o6
	srax	%o2,	%g5,	%i6
	movgu	%xcc,	%l2,	%g2
	ldsh	[%l7 + 0x76],	%g4
	edge32n	%i3,	%l6,	%o0
	srlx	%l4,	%g7,	%g6
	fone	%f12
	restore %o4, %i5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f5,	%f23,	%f3
	alignaddr	%i0,	%l5,	%g3
	andcc	%i4,	%g1,	%l1
	movrgez	%o7,	0x16A,	%i2
	xnorcc	%i1,	0x0EFF,	%o1
	pdist	%f28,	%f28,	%f10
	save %l0, %l3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f18,	%f20,	%f6
	std	%f18,	[%l7 + 0x40]
	nop
	set	0x58, %i5
	ldsw	[%l7 + %i5],	%o6
	ldub	[%l7 + 0x12],	%o2
	ldsw	[%l7 + 0x70],	%i7
	andcc	%i6,	%l2,	%g5
	fcmpgt16	%f0,	%f6,	%g2
	mulx	%g4,	0x16D2,	%i3
	and	%o0,	0x17AD,	%l4
	movrgez	%l6,	%g7,	%g6
	siam	0x0
	fandnot1s	%f0,	%f12,	%f28
	udivx	%o4,	0x09C7,	%i5
	andcc	%i0,	0x006A,	%o3
	fornot2	%f22,	%f26,	%f2
	stx	%l5,	[%l7 + 0x18]
	orncc	%i4,	0x0120,	%g3
	orncc	%l1,	%g1,	%o7
	popc	0x04B3,	%i2
	edge32n	%o1,	%l0,	%l3
	for	%f10,	%f18,	%f16
	move	%icc,	%o5,	%i1
	xorcc	%o2,	%o6,	%i7
	ldsb	[%l7 + 0x25],	%i6
	alignaddrl	%l2,	%g5,	%g4
	ldd	[%l7 + 0x10],	%f6
	edge16l	%g2,	%o0,	%l4
	andcc	%l6,	0x1003,	%g7
	stw	%i3,	[%l7 + 0x28]
	fpsub32s	%f2,	%f16,	%f6
	movpos	%xcc,	%o4,	%i5
	andcc	%g6,	%i0,	%o3
	movpos	%icc,	%i4,	%g3
	udivx	%l1,	0x0314,	%l5
	andcc	%o7,	0x1887,	%g1
	movcc	%icc,	%i2,	%o1
	smulcc	%l3,	%o5,	%i1
	subc	%l0,	0x1DA1,	%o6
	movneg	%xcc,	%i7,	%i6
	orcc	%o2,	%l2,	%g4
	orcc	%g5,	%o0,	%g2
	mova	%xcc,	%l6,	%g7
	fmovsge	%icc,	%f27,	%f16
	ldd	[%l7 + 0x68],	%l4
	srax	%o4,	0x05,	%i5
	movvc	%icc,	%i3,	%g6
	fmovdne	%xcc,	%f25,	%f16
	fmovrde	%i0,	%f4,	%f18
	fpack16	%f4,	%f3
	subcc	%i4,	0x1E87,	%g3
	ldub	[%l7 + 0x7A],	%o3
	array8	%l1,	%l5,	%g1
	movne	%xcc,	%o7,	%o1
	std	%f28,	[%l7 + 0x28]
	fcmpne16	%f0,	%f8,	%i2
	edge16ln	%o5,	%l3,	%l0
	ldsb	[%l7 + 0x5B],	%i1
	or	%o6,	0x0CC7,	%i6
	srax	%i7,	%o2,	%g4
	fcmpeq16	%f24,	%f12,	%g5
	movrgz	%o0,	0x15C,	%l2
	srlx	%g2,	0x05,	%l6
	sdivx	%l4,	0x08AE,	%g7
	sdiv	%i5,	0x108C,	%o4
	fmul8sux16	%f20,	%f18,	%f28
	umul	%g6,	%i0,	%i3
	sub	%g3,	%i4,	%o3
	movvs	%icc,	%l1,	%g1
	movrlez	%o7,	%l5,	%o1
	movrne	%o5,	%l3,	%i2
	ld	[%l7 + 0x68],	%f11
	or	%l0,	0x0DC4,	%i1
	fcmpne32	%f28,	%f12,	%i6
	edge32l	%i7,	%o2,	%g4
	movgu	%icc,	%o6,	%g5
	move	%icc,	%l2,	%g2
	ldx	[%l7 + 0x50],	%l6
	movcs	%xcc,	%o0,	%l4
	movne	%xcc,	%g7,	%o4
	movg	%icc,	%g6,	%i5
	movn	%icc,	%i0,	%g3
	edge32ln	%i4,	%i3,	%l1
	fxors	%f0,	%f5,	%f27
	movn	%icc,	%o3,	%o7
	stx	%g1,	[%l7 + 0x68]
	edge8ln	%o1,	%o5,	%l5
	fnegd	%f8,	%f12
	edge32l	%l3,	%l0,	%i2
	sra	%i1,	0x03,	%i7
	movvs	%icc,	%o2,	%i6
	subc	%o6,	0x0445,	%g4
	srax	%g5,	0x02,	%l2
	orncc	%g2,	0x1351,	%l6
	edge16l	%l4,	%g7,	%o0
	ld	[%l7 + 0x3C],	%f14
	mova	%icc,	%o4,	%i5
	fsrc2	%f24,	%f24
	fnegd	%f14,	%f10
	sll	%i0,	0x1F,	%g3
	fsrc1	%f6,	%f10
	andn	%i4,	0x1566,	%i3
	orn	%g6,	%o3,	%o7
	sub	%g1,	%l1,	%o5
	subcc	%l5,	0x1B34,	%o1
	andcc	%l0,	0x10F7,	%l3
	fcmped	%fcc2,	%f4,	%f26
	movg	%icc,	%i2,	%i7
	smul	%i1,	%i6,	%o6
	stw	%g4,	[%l7 + 0x50]
	addcc	%o2,	0x0EFA,	%g5
	fmovspos	%xcc,	%f0,	%f24
	fmuld8ulx16	%f14,	%f4,	%f28
	movre	%l2,	%l6,	%l4
	sll	%g2,	%g7,	%o4
	movrlz	%i5,	%i0,	%g3
	stw	%i4,	[%l7 + 0x44]
	xnorcc	%o0,	%i3,	%o3
	sethi	0x17F9,	%o7
	smulcc	%g6,	0x00F6,	%l1
	movge	%xcc,	%o5,	%g1
	subccc	%l5,	%o1,	%l3
	movre	%l0,	%i7,	%i1
	fmovrdgez	%i2,	%f30,	%f26
	edge32ln	%i6,	%g4,	%o2
	movrgez	%o6,	%l2,	%g5
	edge16	%l6,	%g2,	%l4
	ldub	[%l7 + 0x79],	%o4
	fmul8ulx16	%f16,	%f2,	%f2
	fandnot2	%f12,	%f22,	%f2
	sdivcc	%i5,	0x1980,	%i0
	movg	%icc,	%g3,	%i4
	fmovrsgz	%o0,	%f2,	%f20
	movrne	%g7,	%o3,	%o7
	movne	%xcc,	%g6,	%l1
	edge16	%o5,	%g1,	%l5
	edge16n	%i3,	%l3,	%o1
	save %l0, %i7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i6,	%i1,	%o2
	subcc	%o6,	%l2,	%g4
	xnorcc	%g5,	0x0C44,	%g2
	umulcc	%l6,	%o4,	%l4
	edge16	%i5,	%i0,	%i4
	fmovdneg	%icc,	%f12,	%f0
	srlx	%g3,	0x0B,	%o0
	movle	%icc,	%g7,	%o3
	fmovrse	%g6,	%f8,	%f29
	ldsh	[%l7 + 0x7E],	%l1
	edge8n	%o5,	%o7,	%g1
	fmovspos	%xcc,	%f8,	%f20
	sdivx	%l5,	0x0C4C,	%i3
	movn	%icc,	%l3,	%l0
	xnor	%i7,	0x00B1,	%i2
	fcmpgt32	%f0,	%f26,	%o1
	sub	%i1,	%o2,	%o6
	mulscc	%i6,	%l2,	%g4
	xorcc	%g2,	%g5,	%o4
	pdist	%f4,	%f8,	%f4
	stw	%l4,	[%l7 + 0x24]
	std	%f4,	[%l7 + 0x58]
	movvs	%icc,	%l6,	%i5
	ld	[%l7 + 0x18],	%f19
	lduh	[%l7 + 0x7A],	%i4
	movcc	%xcc,	%g3,	%o0
	movg	%icc,	%g7,	%o3
	stw	%i0,	[%l7 + 0x08]
	srlx	%l1,	%g6,	%o7
	subc	%o5,	0x0221,	%l5
	orncc	%g1,	%i3,	%l3
	array16	%i7,	%i2,	%l0
	orn	%o1,	%i1,	%o2
	ldsb	[%l7 + 0x5B],	%i6
	and	%o6,	%l2,	%g2
	edge8ln	%g4,	%g5,	%o4
	movg	%icc,	%l4,	%i5
	andcc	%l6,	0x0DA3,	%i4
	ldsb	[%l7 + 0x2B],	%g3
	mova	%xcc,	%g7,	%o0
	fmovrslz	%o3,	%f9,	%f14
	lduh	[%l7 + 0x2E],	%l1
	edge32	%g6,	%o7,	%i0
	save %o5, %g1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i3,	%l3,	%i2
	mova	%icc,	%i7,	%o1
	movne	%xcc,	%i1,	%l0
	sub	%o2,	%i6,	%l2
	orn	%g2,	0x05B9,	%o6
	movrlz	%g4,	%g5,	%l4
	movle	%xcc,	%i5,	%l6
	addccc	%o4,	%g3,	%i4
	andn	%g7,	0x1387,	%o0
	orcc	%l1,	%o3,	%o7
	array16	%i0,	%o5,	%g1
	array32	%l5,	%g6,	%l3
	ldsb	[%l7 + 0x7D],	%i2
	edge32	%i7,	%o1,	%i3
	umul	%l0,	0x1E59,	%o2
	stx	%i1,	[%l7 + 0x10]
	pdist	%f12,	%f22,	%f24
	fmovsvc	%icc,	%f10,	%f17
	fmovdne	%icc,	%f20,	%f3
	fmovrdgez	%l2,	%f24,	%f16
	udivx	%g2,	0x122F,	%i6
	fmovrdne	%g4,	%f12,	%f16
	fmovdneg	%icc,	%f29,	%f20
	fsrc2	%f10,	%f0
	fmovdpos	%xcc,	%f27,	%f28
	sra	%o6,	0x09,	%g5
	addc	%i5,	0x1D60,	%l4
	movre	%l6,	0x3A1,	%g3
	subc	%o4,	%i4,	%g7
	edge16	%l1,	%o0,	%o3
	fmovscc	%xcc,	%f4,	%f20
	lduw	[%l7 + 0x54],	%i0
	fnegd	%f30,	%f30
	movrne	%o7,	0x3D2,	%g1
	and	%o5,	0x10A7,	%l5
	edge16n	%l3,	%g6,	%i7
	fsrc1	%f4,	%f16
	movre	%o1,	0x186,	%i3
	orncc	%i2,	0x120F,	%l0
	smulcc	%i1,	0x0347,	%l2
	umulcc	%g2,	0x1BE0,	%i6
	fmovdgu	%xcc,	%f11,	%f14
	sllx	%g4,	%o6,	%o2
	xor	%g5,	0x0905,	%l4
	fornot1s	%f10,	%f28,	%f17
	srax	%l6,	%g3,	%o4
	fcmped	%fcc1,	%f20,	%f28
	edge8n	%i4,	%g7,	%l1
	movrlz	%i5,	0x1EC,	%o3
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	stb	%g1,	[%l7 + 0x5A]
	sll	%i0,	0x1F,	%l5
	andcc	%o5,	0x0C62,	%l3
	addccc	%g6,	%i7,	%i3
	stx	%i2,	[%l7 + 0x38]
	umul	%o1,	%i1,	%l0
	fmovdleu	%icc,	%f28,	%f27
	movcc	%icc,	%l2,	%i6
	ldub	[%l7 + 0x57],	%g4
	smulcc	%g2,	%o6,	%o2
	fnegd	%f16,	%f8
	movvc	%icc,	%g5,	%l6
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%l4
	popc	0x11B1,	%o4
	xor	%i4,	0x1BFC,	%g3
	ld	[%l7 + 0x44],	%f4
	edge16n	%g7,	%l1,	%o3
	edge16l	%o0,	%o7,	%i5
	edge16n	%g1,	%i0,	%o5
	movvc	%icc,	%l5,	%g6
	fmovrsgez	%l3,	%f7,	%f26
	andn	%i7,	%i3,	%i2
	movl	%icc,	%i1,	%l0
	movleu	%xcc,	%l2,	%i6
	umulcc	%o1,	0x0F4E,	%g2
	umulcc	%o6,	0x1888,	%g4
	fmovdl	%xcc,	%f14,	%f3
	movl	%xcc,	%o2,	%g5
	subcc	%l6,	0x0CFF,	%o4
	fxnors	%f4,	%f3,	%f12
	orncc	%l4,	%g3,	%i4
	edge16n	%l1,	%g7,	%o3
	edge8n	%o7,	%o0,	%i5
	movpos	%icc,	%i0,	%o5
	umulcc	%l5,	0x1601,	%g6
	movpos	%xcc,	%g1,	%i7
	xorcc	%i3,	0x0DCA,	%i2
	edge8l	%l3,	%l0,	%l2
	stx	%i1,	[%l7 + 0x78]
	save %i6, 0x1678, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f6,	[%l7 + 0x50]
	ldsb	[%l7 + 0x10],	%o1
	smulcc	%o6,	%g4,	%o2
	sll	%l6,	0x15,	%g5
	sth	%l4,	[%l7 + 0x1A]
	array32	%g3,	%i4,	%l1
	fnegs	%f4,	%f0
	fones	%f2
	fornot2	%f18,	%f26,	%f4
	array32	%o4,	%g7,	%o7
	andncc	%o3,	%o0,	%i5
	fmovse	%icc,	%f27,	%f12
	ld	[%l7 + 0x58],	%f3
	fmovrdgez	%o5,	%f8,	%f22
	movrgez	%i0,	0x081,	%l5
	movg	%xcc,	%g6,	%g1
	xorcc	%i7,	0x13C5,	%i2
	lduw	[%l7 + 0x5C],	%l3
	move	%xcc,	%l0,	%i3
	std	%f2,	[%l7 + 0x18]
	movleu	%icc,	%l2,	%i1
	sir	0x0BBF
	fmovdneg	%xcc,	%f18,	%f27
	movrlz	%i6,	0x255,	%o1
	smul	%o6,	0x087F,	%g2
	addc	%g4,	0x1531,	%l6
	lduw	[%l7 + 0x50],	%g5
	array8	%o2,	%l4,	%i4
	mulx	%g3,	0x0D8B,	%o4
	movpos	%icc,	%g7,	%o7
	umulcc	%o3,	0x0379,	%o0
	std	%f28,	[%l7 + 0x50]
	fmovse	%xcc,	%f12,	%f1
	edge32n	%i5,	%o5,	%l1
	smulcc	%i0,	0x0FA4,	%l5
	stx	%g6,	[%l7 + 0x68]
	edge8ln	%g1,	%i2,	%i7
	fmovspos	%icc,	%f29,	%f5
	movrne	%l3,	%i3,	%l0
	stx	%i1,	[%l7 + 0x58]
	nop
	set	0x46, %g2
	lduh	[%l7 + %g2],	%i6
	ldub	[%l7 + 0x63],	%o1
	udivx	%o6,	0x1A3F,	%l2
	ldsw	[%l7 + 0x64],	%g4
	xor	%g2,	%g5,	%o2
	movcc	%icc,	%l6,	%l4
	udivx	%g3,	0x1981,	%o4
	fmovdne	%icc,	%f19,	%f6
	std	%f12,	[%l7 + 0x10]
	ldsb	[%l7 + 0x25],	%i4
	movpos	%icc,	%g7,	%o7
	sll	%o3,	%o0,	%o5
	ldsb	[%l7 + 0x29],	%l1
	ldd	[%l7 + 0x30],	%f16
	or	%i0,	%i5,	%l5
	edge16	%g6,	%i2,	%g1
	edge16	%l3,	%i7,	%i3
	lduh	[%l7 + 0x2A],	%l0
	fxor	%f24,	%f28,	%f18
	sdivx	%i1,	0x0399,	%i6
	st	%f2,	[%l7 + 0x34]
	fmul8sux16	%f12,	%f8,	%f30
	edge32	%o1,	%l2,	%o6
	add	%g2,	0x07DA,	%g5
	edge32ln	%g4,	%l6,	%o2
	ld	[%l7 + 0x50],	%f10
	fmovdpos	%icc,	%f27,	%f11
	popc	0x0320,	%g3
	fmovdn	%xcc,	%f12,	%f29
	fpackfix	%f8,	%f29
	alignaddrl	%l4,	%o4,	%g7
	edge16ln	%i4,	%o7,	%o0
	orn	%o5,	0x1234,	%o3
	array16	%l1,	%i0,	%l5
	and	%i5,	%i2,	%g1
	movneg	%xcc,	%l3,	%i7
	sdiv	%i3,	0x1193,	%l0
	orncc	%g6,	%i6,	%i1
	orcc	%o1,	%l2,	%g2
	st	%f22,	[%l7 + 0x40]
	fmovdgu	%icc,	%f1,	%f15
	sdivx	%g5,	0x1D6B,	%g4
	array32	%l6,	%o6,	%o2
	fmul8sux16	%f8,	%f28,	%f20
	andn	%l4,	0x001D,	%o4
	fnand	%f16,	%f30,	%f12
	add	%g7,	0x1790,	%g3
	fcmped	%fcc2,	%f20,	%f30
	fmul8x16au	%f22,	%f10,	%f10
	fnot1s	%f17,	%f29
	xorcc	%o7,	0x0B21,	%o0
	fmovsge	%icc,	%f22,	%f21
	fmovsle	%icc,	%f9,	%f28
	lduw	[%l7 + 0x6C],	%i4
	subc	%o3,	0x070A,	%l1
	and	%o5,	0x1FF6,	%i0
	restore %i5, 0x065E, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f26,	%f10
	srax	%g1,	0x16,	%l3
	fmovrdlez	%i7,	%f10,	%f10
	movrlz	%i3,	%i2,	%g6
	ldd	[%l7 + 0x50],	%f28
	fmovsvs	%xcc,	%f16,	%f24
	movrgez	%i6,	%i1,	%l0
	sir	0x1A2D
	movn	%xcc,	%o1,	%l2
	xnor	%g2,	0x081B,	%g5
	sth	%l6,	[%l7 + 0x2E]
	fmovdcs	%icc,	%f5,	%f26
	mova	%xcc,	%o6,	%o2
	ldsh	[%l7 + 0x72],	%g4
	movrgz	%l4,	%g7,	%o4
	movge	%xcc,	%g3,	%o0
	subc	%o7,	%i4,	%l1
	xorcc	%o5,	0x16EE,	%i0
	fmovsle	%xcc,	%f11,	%f3
	fors	%f18,	%f0,	%f18
	ldx	[%l7 + 0x30],	%o3
	movrlez	%l5,	0x210,	%i5
	ldx	[%l7 + 0x50],	%g1
	subc	%i7,	0x13C6,	%i3
	movvc	%xcc,	%l3,	%i2
	movle	%xcc,	%i6,	%g6
	addccc	%l0,	%o1,	%i1
	movcc	%icc,	%g2,	%l2
	edge32l	%g5,	%l6,	%o6
	fmovsgu	%icc,	%f10,	%f6
	sllx	%o2,	0x1D,	%g4
	mova	%xcc,	%l4,	%o4
	array32	%g3,	%o0,	%o7
	stx	%g7,	[%l7 + 0x48]
	andcc	%l1,	%i4,	%o5
	stb	%o3,	[%l7 + 0x45]
	movgu	%xcc,	%i0,	%l5
	movg	%xcc,	%g1,	%i7
	fpack32	%f12,	%f0,	%f0
	fmovdvs	%xcc,	%f15,	%f0
	ldsb	[%l7 + 0x54],	%i5
	fpadd32	%f12,	%f26,	%f30
	move	%icc,	%i3,	%i2
	orcc	%l3,	0x1F95,	%g6
	alignaddr	%l0,	%i6,	%i1
	st	%f23,	[%l7 + 0x40]
	subcc	%g2,	%o1,	%l2
	mulscc	%g5,	%l6,	%o6
	addc	%o2,	0x1958,	%l4
	movg	%xcc,	%g4,	%o4
	edge8ln	%g3,	%o0,	%g7
	movpos	%icc,	%l1,	%o7
	lduw	[%l7 + 0x5C],	%o5
	save %o3, %i4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i0,	%i7,	%g1
	movrlz	%i5,	0x16E,	%i2
	sllx	%l3,	0x03,	%g6
	add	%l0,	0x0C8B,	%i6
	edge8ln	%i1,	%g2,	%o1
	sdivx	%l2,	0x0657,	%i3
	movrgz	%g5,	%l6,	%o2
	srl	%l4,	0x00,	%o6
	ldub	[%l7 + 0x23],	%g4
	movne	%xcc,	%o4,	%o0
	fcmpeq16	%f24,	%f6,	%g7
	andn	%l1,	%o7,	%g3
	addc	%o5,	%o3,	%l5
	movgu	%icc,	%i4,	%i0
	sllx	%i7,	0x10,	%i5
	ldsw	[%l7 + 0x3C],	%i2
	ldsw	[%l7 + 0x58],	%l3
	movrgz	%g1,	0x2EC,	%l0
	sdiv	%i6,	0x1F97,	%g6
	srax	%i1,	0x1B,	%g2
	movcc	%xcc,	%o1,	%l2
	edge32	%i3,	%g5,	%l6
	mulx	%l4,	0x1862,	%o6
	movrne	%o2,	0x214,	%o4
	fzero	%f4
	addc	%g4,	0x1B26,	%g7
	std	%f2,	[%l7 + 0x58]
	ld	[%l7 + 0x50],	%f4
	addccc	%l1,	%o7,	%o0
	movle	%icc,	%g3,	%o5
	std	%f20,	[%l7 + 0x48]
	or	%l5,	0x0374,	%i4
	alignaddr	%o3,	%i7,	%i5
	movleu	%xcc,	%i2,	%l3
	lduw	[%l7 + 0x08],	%i0
	smul	%g1,	0x1195,	%i6
	popc	0x06E2,	%l0
	edge32l	%i1,	%g6,	%g2
	movvc	%xcc,	%l2,	%i3
	udiv	%o1,	0x0F73,	%l6
	movgu	%icc,	%g5,	%o6
	movpos	%icc,	%o2,	%l4
	edge16n	%g4,	%g7,	%o4
	fsrc1s	%f16,	%f26
	movge	%xcc,	%l1,	%o7
	edge8l	%o0,	%o5,	%g3
	st	%f12,	[%l7 + 0x20]
	alignaddr	%l5,	%o3,	%i7
	orn	%i5,	%i4,	%i2
	udivcc	%l3,	0x07D8,	%g1
	fmuld8ulx16	%f9,	%f6,	%f4
	st	%f12,	[%l7 + 0x28]
	array8	%i6,	%i0,	%l0
	movcs	%xcc,	%g6,	%i1
	sdivx	%l2,	0x0738,	%g2
	movvc	%xcc,	%o1,	%l6
	subc	%i3,	0x0A17,	%g5
	fornot1s	%f20,	%f1,	%f19
	movrlez	%o2,	%o6,	%g4
	umul	%l4,	0x1D57,	%o4
	srax	%l1,	%g7,	%o7
	edge8n	%o5,	%g3,	%l5
	movrgez	%o3,	0x072,	%o0
	edge32l	%i5,	%i7,	%i4
	st	%f18,	[%l7 + 0x1C]
	ldd	[%l7 + 0x60],	%f0
	movrlez	%l3,	0x0AB,	%i2
	xnor	%i6,	%i0,	%g1
	stb	%l0,	[%l7 + 0x23]
	andcc	%g6,	0x0D3C,	%l2
	fornot1	%f20,	%f20,	%f18
	andncc	%g2,	%o1,	%l6
	fzero	%f6
	addcc	%i3,	0x1F92,	%i1
	movrgz	%o2,	0x21D,	%o6
	fmovrdlez	%g4,	%f4,	%f24
	fsrc1s	%f18,	%f6
	array8	%g5,	%l4,	%o4
	srax	%g7,	%l1,	%o5
	udiv	%g3,	0x0799,	%l5
	sllx	%o3,	0x16,	%o0
	movvc	%icc,	%o7,	%i5
	movg	%xcc,	%i7,	%i4
	fone	%f2
	sdivx	%l3,	0x1F07,	%i6
	fmovrdgez	%i0,	%f0,	%f18
	addcc	%i2,	0x02D1,	%g1
	udivx	%l0,	0x0F07,	%g6
	edge32ln	%g2,	%l2,	%o1
	fmovdg	%icc,	%f2,	%f11
	siam	0x7
	and	%i3,	%i1,	%l6
	fcmpeq16	%f26,	%f8,	%o6
	movvc	%xcc,	%o2,	%g5
	fxor	%f8,	%f26,	%f26
	ldd	[%l7 + 0x60],	%f2
	stb	%g4,	[%l7 + 0x6A]
	sdivcc	%o4,	0x0B89,	%g7
	addccc	%l4,	%l1,	%g3
	array16	%l5,	%o5,	%o0
	fnegd	%f28,	%f4
	fornot2s	%f3,	%f2,	%f12
	fsrc1	%f14,	%f28
	edge16ln	%o3,	%o7,	%i7
	fandnot2s	%f18,	%f4,	%f13
	sub	%i4,	0x1D35,	%i5
	umul	%l3,	%i0,	%i2
	movle	%xcc,	%i6,	%g1
	udiv	%l0,	0x1AE1,	%g2
	fmovrsgz	%l2,	%f11,	%f1
	smulcc	%o1,	0x1E9E,	%g6
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	movcs	%icc,	%o2,	%l6
	ldd	[%l7 + 0x08],	%f16
	std	%f8,	[%l7 + 0x08]
	mova	%icc,	%g5,	%g4
	fmovrsne	%g7,	%f16,	%f1
	addc	%o4,	%l1,	%l4
	udivx	%l5,	0x106D,	%o5
	std	%f28,	[%l7 + 0x50]
	addc	%o0,	0x0486,	%o3
	ldsb	[%l7 + 0x53],	%o7
	srlx	%i7,	%i4,	%i5
	edge8	%l3,	%i0,	%i2
	movg	%icc,	%i6,	%g1
	alignaddrl	%g3,	%l0,	%g2
	orncc	%l2,	%g6,	%o1
	movrlz	%i3,	%o6,	%i1
	fpsub32	%f24,	%f6,	%f26
	ldd	[%l7 + 0x08],	%i6
	or	%g5,	%g4,	%o2
	sdivx	%g7,	0x03D3,	%o4
	smul	%l4,	%l5,	%o5
	lduw	[%l7 + 0x54],	%o0
	fmovsne	%xcc,	%f31,	%f15
	edge32l	%o3,	%l1,	%i7
	fmovrdlez	%o7,	%f0,	%f12
	ldx	[%l7 + 0x68],	%i5
	fexpand	%f8,	%f20
	fcmps	%fcc1,	%f29,	%f7
	lduh	[%l7 + 0x1A],	%l3
	fornot1	%f14,	%f26,	%f24
	fnand	%f8,	%f2,	%f20
	fmovsne	%icc,	%f25,	%f16
	fmovs	%f6,	%f8
	edge8n	%i4,	%i2,	%i0
	addc	%g1,	0x134A,	%g3
	sdivcc	%l0,	0x013E,	%g2
	movcs	%xcc,	%i6,	%l2
	fabss	%f10,	%f25
	edge8n	%g6,	%i3,	%o1
	fmovdvs	%icc,	%f12,	%f9
	stw	%i1,	[%l7 + 0x50]
	sdivcc	%l6,	0x05B2,	%g5
	movrgez	%o6,	0x1D8,	%g4
	movrgez	%g7,	%o2,	%l4
	orn	%o4,	%l5,	%o5
	edge8	%o0,	%l1,	%o3
	fmovscc	%icc,	%f30,	%f27
	movl	%xcc,	%o7,	%i7
	movrlz	%l3,	0x2F1,	%i5
	fmovscs	%icc,	%f2,	%f26
	alignaddr	%i4,	%i2,	%i0
	ldsb	[%l7 + 0x35],	%g3
	stw	%l0,	[%l7 + 0x5C]
	sethi	0x019B,	%g2
	fcmpes	%fcc0,	%f4,	%f27
	udiv	%g1,	0x132C,	%l2
	movcs	%icc,	%g6,	%i6
	edge8n	%i3,	%o1,	%i1
	fmul8ulx16	%f8,	%f20,	%f2
	restore %l6, 0x03EF, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x6C],	%o6
	fmovrdlez	%g7,	%f8,	%f6
	add	%o2,	0x094E,	%g4
	andncc	%l4,	%l5,	%o4
	movrlz	%o5,	0x31B,	%l1
	fmovsa	%icc,	%f3,	%f30
	movrgez	%o0,	0x12A,	%o3
	addc	%o7,	0x1764,	%i7
	movneg	%xcc,	%i5,	%i4
	addcc	%l3,	0x0ADC,	%i0
	alignaddr	%g3,	%i2,	%l0
	sir	0x0D4F
	fcmped	%fcc0,	%f30,	%f4
	sdivcc	%g1,	0x144E,	%l2
	ldsh	[%l7 + 0x38],	%g2
	andncc	%g6,	%i3,	%i6
	alignaddrl	%o1,	%i1,	%l6
	orcc	%o6,	%g5,	%g7
	fcmpne16	%f6,	%f16,	%g4
	fmovrsgz	%o2,	%f12,	%f4
	edge16n	%l5,	%o4,	%l4
	fmovscc	%icc,	%f29,	%f2
	movgu	%xcc,	%o5,	%o0
	fmovsvs	%xcc,	%f8,	%f4
	movge	%xcc,	%l1,	%o3
	movl	%icc,	%i7,	%i5
	fcmpgt32	%f4,	%f18,	%i4
	or	%l3,	0x1412,	%o7
	movn	%icc,	%g3,	%i2
	movle	%icc,	%l0,	%g1
	sdivcc	%i0,	0x1E65,	%g2
	ldd	[%l7 + 0x70],	%l2
	and	%i3,	%g6,	%i6
	fand	%f4,	%f8,	%f18
	ldsb	[%l7 + 0x34],	%o1
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%i6
	fnegs	%f21,	%f3
	ldx	[%l7 + 0x48],	%o6
	movrne	%g5,	0x05C,	%g7
	movle	%icc,	%i1,	%o2
	and	%l5,	0x1093,	%g4
	movvs	%icc,	%o4,	%o5
	stb	%o0,	[%l7 + 0x32]
	sub	%l1,	0x0A07,	%l4
	xorcc	%o3,	%i5,	%i7
	move	%xcc,	%l3,	%i4
	array32	%o7,	%i2,	%l0
	movleu	%icc,	%g3,	%i0
	edge16n	%g1,	%l2,	%i3
	movrne	%g2,	0x3FC,	%i6
	fsrc1s	%f17,	%f25
	movne	%icc,	%g6,	%l6
	fone	%f18
	array32	%o6,	%o1,	%g5
	edge8ln	%i1,	%o2,	%l5
	subcc	%g7,	%g4,	%o5
	bshuffle	%f24,	%f2,	%f6
	std	%f16,	[%l7 + 0x28]
	ldd	[%l7 + 0x78],	%f10
	subcc	%o0,	%o4,	%l1
	popc	%l4,	%i5
	srl	%i7,	0x19,	%l3
	subcc	%i4,	0x1932,	%o3
	ldd	[%l7 + 0x78],	%i2
	fpadd32s	%f1,	%f30,	%f24
	fmovsg	%icc,	%f14,	%f19
	orcc	%o7,	%l0,	%g3
	fpadd32	%f0,	%f0,	%f4
	fmovsneg	%icc,	%f30,	%f12
	ldd	[%l7 + 0x78],	%f30
	subccc	%i0,	0x0EE0,	%l2
	nop
	set	0x72, %i4
	sth	%g1,	[%l7 + %i4]
	subcc	%g2,	0x14F7,	%i3
	st	%f29,	[%l7 + 0x28]
	movleu	%xcc,	%i6,	%g6
	fmovsg	%xcc,	%f28,	%f17
	movne	%icc,	%o6,	%l6
	fpadd32	%f18,	%f8,	%f8
	fandnot1	%f2,	%f16,	%f28
	fxnor	%f24,	%f20,	%f28
	smulcc	%g5,	0x1E2F,	%o1
	ldsb	[%l7 + 0x60],	%i1
	orcc	%o2,	0x152D,	%g7
	movpos	%icc,	%l5,	%o5
	sll	%o0,	0x10,	%o4
	sra	%l1,	%g4,	%i5
	fmovdneg	%xcc,	%f18,	%f8
	stx	%l4,	[%l7 + 0x50]
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	sethi	0x0353,	%l3
	edge16n	%i2,	%o7,	%g3
	fmovdg	%xcc,	%f30,	%f23
	sra	%l0,	0x10,	%i0
	xnorcc	%l2,	%g2,	%i3
	fmovsg	%icc,	%f1,	%f30
	lduw	[%l7 + 0x10],	%i6
	movcc	%icc,	%g1,	%o6
	fpack16	%f20,	%f29
	or	%l6,	0x157E,	%g5
	sdivcc	%o1,	0x1107,	%i1
	umulcc	%g6,	0x115B,	%g7
	orn	%o2,	0x12AF,	%o5
	array32	%o0,	%l5,	%l1
	edge16ln	%o4,	%i5,	%g4
	movle	%xcc,	%l4,	%i4
	array16	%i7,	%l3,	%o3
	popc	0x0D47,	%o7
	fpackfix	%f28,	%f13
	array16	%i2,	%l0,	%g3
	subc	%i0,	0x0BA6,	%l2
	addc	%g2,	%i6,	%i3
	xnorcc	%o6,	%g1,	%g5
	edge32l	%l6,	%i1,	%o1
	edge8l	%g7,	%g6,	%o5
	edge16ln	%o0,	%o2,	%l5
	ld	[%l7 + 0x38],	%f29
	edge8ln	%l1,	%i5,	%g4
	movvc	%xcc,	%o4,	%i4
	edge16l	%l4,	%i7,	%l3
	subccc	%o7,	%i2,	%o3
	movpos	%xcc,	%g3,	%l0
	alignaddrl	%l2,	%i0,	%g2
	sdiv	%i3,	0x12A7,	%o6
	restore %g1, %i6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%icc,	%f7,	%f8
	movvs	%xcc,	%g5,	%o1
	addccc	%g7,	0x10A9,	%i1
	sll	%g6,	%o0,	%o2
	fsrc2	%f0,	%f8
	sth	%l5,	[%l7 + 0x6C]
	srl	%l1,	0x1B,	%o5
	fmovdl	%xcc,	%f11,	%f30
	orncc	%g4,	0x16FF,	%o4
	orcc	%i4,	0x1226,	%l4
	fand	%f16,	%f30,	%f12
	udivcc	%i7,	0x0631,	%i5
	movrlez	%l3,	0x209,	%o7
	fmovdpos	%icc,	%f19,	%f0
	subc	%o3,	%i2,	%g3
	bshuffle	%f2,	%f10,	%f14
	fmovrse	%l0,	%f22,	%f5
	subccc	%l2,	0x1436,	%g2
	fands	%f16,	%f20,	%f6
	fxnors	%f15,	%f3,	%f0
	for	%f2,	%f8,	%f26
	mulscc	%i3,	%i0,	%o6
	fxnor	%f22,	%f8,	%f28
	movre	%g1,	0x195,	%i6
	srl	%l6,	0x05,	%g5
	fpackfix	%f6,	%f15
	orcc	%o1,	0x1172,	%g7
	ldsb	[%l7 + 0x13],	%i1
	fnands	%f31,	%f25,	%f0
	edge32n	%g6,	%o2,	%o0
	xorcc	%l5,	%o5,	%l1
	movrlz	%o4,	0x36B,	%g4
	ldx	[%l7 + 0x60],	%i4
	orcc	%i7,	0x0126,	%l4
	movne	%xcc,	%i5,	%o7
	movle	%icc,	%o3,	%l3
	alignaddrl	%g3,	%l0,	%l2
	sir	0x1677
	orn	%g2,	%i2,	%i0
	fxnors	%f29,	%f18,	%f22
	edge16ln	%i3,	%g1,	%i6
	movvs	%xcc,	%o6,	%l6
	movne	%icc,	%o1,	%g5
	movvs	%icc,	%i1,	%g6
	ldub	[%l7 + 0x56],	%o2
	movrne	%g7,	0x031,	%o0
	addccc	%o5,	%l1,	%o4
	movge	%icc,	%g4,	%l5
	sth	%i7,	[%l7 + 0x2A]
	fxor	%f28,	%f30,	%f0
	popc	0x135E,	%i4
	edge8l	%l4,	%o7,	%o3
	xnor	%l3,	%g3,	%i5
	fones	%f10
	fmovrsgz	%l2,	%f19,	%f29
	fmovsa	%xcc,	%f26,	%f28
	edge16l	%g2,	%i2,	%i0
	edge8l	%i3,	%g1,	%l0
	fpadd32s	%f2,	%f1,	%f8
	sth	%i6,	[%l7 + 0x48]
	fmuld8ulx16	%f31,	%f12,	%f26
	addc	%l6,	0x1AAD,	%o1
	subccc	%g5,	0x18E3,	%i1
	ldd	[%l7 + 0x10],	%f22
	movpos	%icc,	%g6,	%o6
	srl	%o2,	%o0,	%g7
	movne	%xcc,	%o5,	%l1
	orncc	%g4,	0x00C1,	%o4
	edge8ln	%i7,	%i4,	%l4
	ldx	[%l7 + 0x48],	%o7
	movg	%xcc,	%o3,	%l3
	fpack16	%f12,	%f5
	edge32l	%l5,	%g3,	%l2
	fcmple32	%f16,	%f8,	%g2
	ldsb	[%l7 + 0x1C],	%i5
	ldd	[%l7 + 0x10],	%f8
	andn	%i0,	0x191E,	%i2
	movl	%icc,	%i3,	%l0
	edge32ln	%g1,	%l6,	%o1
	movl	%xcc,	%g5,	%i1
	orncc	%g6,	0x1576,	%i6
	fmul8sux16	%f30,	%f12,	%f14
	add	%o2,	%o6,	%g7
	sir	0x0CBC
	edge32n	%o5,	%l1,	%g4
	faligndata	%f30,	%f14,	%f20
	movcc	%icc,	%o0,	%o4
	udiv	%i7,	0x1055,	%l4
	ld	[%l7 + 0x18],	%f23
	popc	0x1357,	%i4
	movre	%o7,	%o3,	%l3
	fnegs	%f20,	%f5
	subc	%l5,	0x1ABF,	%g3
	movne	%xcc,	%g2,	%i5
	fmovd	%f8,	%f14
	alignaddrl	%i0,	%i2,	%i3
	fmovdn	%icc,	%f7,	%f15
	edge32l	%l2,	%l0,	%l6
	sir	0x19DD
	movpos	%xcc,	%o1,	%g1
	movg	%icc,	%g5,	%g6
	fmovrdgez	%i1,	%f28,	%f20
	movvc	%icc,	%i6,	%o2
	movrgez	%o6,	%o5,	%l1
	alignaddr	%g7,	%o0,	%o4
	movge	%icc,	%g4,	%l4
	fmuld8sux16	%f6,	%f14,	%f22
	fabsd	%f26,	%f6
	fnegd	%f20,	%f8
	xorcc	%i7,	%i4,	%o3
	ldd	[%l7 + 0x30],	%l2
	mulx	%l5,	%o7,	%g2
	andncc	%i5,	%i0,	%i2
	fmovrslez	%g3,	%f17,	%f28
	fmovsne	%xcc,	%f30,	%f21
	edge8ln	%l2,	%l0,	%l6
	xor	%o1,	%i3,	%g1
	or	%g6,	0x0498,	%i1
	fors	%f2,	%f22,	%f19
	fpsub16s	%f29,	%f20,	%f31
	movvs	%xcc,	%g5,	%o2
	movvs	%xcc,	%i6,	%o6
	fand	%f6,	%f18,	%f22
	fcmped	%fcc0,	%f6,	%f0
	fmovrse	%o5,	%f26,	%f5
	edge32	%l1,	%g7,	%o4
	ldx	[%l7 + 0x30],	%o0
	std	%f8,	[%l7 + 0x50]
	fcmpgt32	%f4,	%f26,	%l4
	fsrc1s	%f7,	%f15
	xor	%i7,	%g4,	%o3
	srax	%i4,	%l5,	%l3
	edge8l	%g2,	%i5,	%o7
	sub	%i2,	%g3,	%l2
	movcc	%icc,	%l0,	%l6
	orn	%o1,	%i0,	%g1
	movle	%xcc,	%g6,	%i1
	fcmpes	%fcc2,	%f22,	%f19
	smul	%i3,	0x1368,	%o2
	sethi	0x018C,	%i6
	movn	%xcc,	%o6,	%o5
	movneg	%xcc,	%g5,	%g7
	addcc	%l1,	0x1894,	%o4
	fzeros	%f28
	sdiv	%o0,	0x1109,	%i7
	lduw	[%l7 + 0x44],	%g4
	andcc	%o3,	%i4,	%l4
	edge16n	%l5,	%g2,	%l3
	smulcc	%i5,	0x0CEE,	%i2
	array8	%g3,	%l2,	%l0
	orncc	%o7,	0x0179,	%o1
	stw	%l6,	[%l7 + 0x74]
	movrgez	%i0,	0x3B4,	%g6
	movl	%icc,	%g1,	%i1
	st	%f22,	[%l7 + 0x18]
	fsrc1s	%f11,	%f16
	edge16	%i3,	%o2,	%i6
	orcc	%o6,	%o5,	%g5
	mova	%icc,	%g7,	%o4
	orcc	%o0,	%i7,	%g4
	stw	%l1,	[%l7 + 0x5C]
	movleu	%xcc,	%o3,	%i4
	nop
	set	0x70, %g5
	lduh	[%l7 + %g5],	%l5
	fmovrdgez	%l4,	%f14,	%f16
	edge8l	%l3,	%i5,	%g2
	movgu	%icc,	%g3,	%i2
	array32	%l0,	%l2,	%o1
	sth	%l6,	[%l7 + 0x3E]
	sdivcc	%i0,	0x1CAC,	%o7
	array16	%g1,	%i1,	%i3
	stx	%g6,	[%l7 + 0x38]
	fpadd32	%f26,	%f18,	%f20
	lduh	[%l7 + 0x52],	%o2
	fmuld8ulx16	%f29,	%f10,	%f28
	ldub	[%l7 + 0x57],	%i6
	std	%f14,	[%l7 + 0x30]
	or	%o6,	0x1262,	%o5
	addcc	%g7,	0x1D61,	%o4
	sdiv	%g5,	0x1B87,	%i7
	fcmpeq16	%f2,	%f28,	%g4
	alignaddr	%l1,	%o0,	%o3
	fcmple16	%f20,	%f4,	%l5
	orn	%l4,	%l3,	%i4
	fcmple16	%f20,	%f28,	%g2
	ldub	[%l7 + 0x57],	%i5
	subc	%i2,	%g3,	%l2
	edge32	%l0,	%o1,	%i0
	sllx	%o7,	%l6,	%i1
	fnot2s	%f15,	%f18
	array32	%i3,	%g6,	%o2
	fcmpd	%fcc1,	%f0,	%f20
	srlx	%g1,	0x09,	%i6
	edge32ln	%o6,	%g7,	%o5
	sdivx	%o4,	0x15FB,	%i7
	ldsh	[%l7 + 0x60],	%g5
	movn	%xcc,	%l1,	%o0
	movg	%icc,	%g4,	%l5
	fmovrdne	%o3,	%f14,	%f14
	fcmple32	%f0,	%f8,	%l4
	edge16l	%i4,	%g2,	%l3
	sdiv	%i5,	0x0CC3,	%g3
	movl	%icc,	%l2,	%l0
	addccc	%o1,	%i0,	%i2
	andncc	%o7,	%l6,	%i1
	movrgz	%i3,	%g6,	%g1
	std	%f6,	[%l7 + 0x78]
	movg	%icc,	%o2,	%i6
	array32	%o6,	%g7,	%o5
	sllx	%i7,	0x14,	%o4
	subcc	%l1,	0x1345,	%o0
	lduh	[%l7 + 0x5C],	%g4
	stb	%g5,	[%l7 + 0x7E]
	edge16n	%o3,	%l5,	%i4
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	save %g3, %i5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x40],	%f10
	and	%l0,	%o1,	%i0
	fands	%f9,	%f22,	%f13
	ldd	[%l7 + 0x60],	%f16
	movrlz	%i2,	%o7,	%l6
	fmovsge	%icc,	%f13,	%f26
	or	%i3,	0x0D22,	%i1
	xnor	%g6,	%g1,	%o2
	ldd	[%l7 + 0x60],	%i6
	move	%icc,	%o6,	%o5
	fmul8x16	%f20,	%f16,	%f16
	sll	%i7,	%o4,	%l1
	movrlz	%o0,	0x37C,	%g4
	fmovrdne	%g7,	%f24,	%f30
	umulcc	%o3,	%l5,	%g5
	ldd	[%l7 + 0x50],	%f30
	udiv	%i4,	0x04F9,	%l4
	smulcc	%g2,	0x1538,	%l3
	movvs	%icc,	%g3,	%l2
	ldd	[%l7 + 0x50],	%l0
	addcc	%o1,	%i0,	%i5
	udivx	%i2,	0x0F20,	%o7
	andncc	%i3,	%l6,	%g6
	subcc	%i1,	%g1,	%o2
	stb	%i6,	[%l7 + 0x3C]
	restore %o6, %o5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f16,	%f0
	array8	%i7,	%o0,	%g4
	movrgez	%l1,	0x270,	%o3
	subcc	%g7,	0x1FCC,	%l5
	save %g5, %i4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g2,	%l3,	%l2
	orcc	%g3,	%l0,	%o1
	movneg	%xcc,	%i0,	%i2
	addc	%o7,	%i3,	%l6
	fmovrslez	%i5,	%f31,	%f27
	edge8n	%g6,	%i1,	%o2
	lduw	[%l7 + 0x0C],	%g1
	fmuld8sux16	%f5,	%f13,	%f28
	sub	%o6,	%i6,	%o4
	movcs	%icc,	%i7,	%o0
	movgu	%xcc,	%o5,	%l1
	fornot2s	%f28,	%f13,	%f6
	save %g4, 0x0B43, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l5,	0x15FF,	%g5
	fmovrse	%g7,	%f18,	%f21
	fmovd	%f26,	%f14
	andn	%i4,	0x1A71,	%l4
	edge32n	%g2,	%l3,	%l2
	fmul8x16au	%f17,	%f5,	%f12
	ldsw	[%l7 + 0x44],	%l0
	ldub	[%l7 + 0x42],	%g3
	subcc	%i0,	%o1,	%i2
	fmovsleu	%xcc,	%f24,	%f27
	xnor	%i3,	0x0BCC,	%l6
	srax	%i5,	%o7,	%g6
	add	%i1,	%g1,	%o6
	ldsh	[%l7 + 0x2C],	%o2
	xnor	%o4,	%i7,	%o0
	alignaddr	%o5,	%l1,	%g4
	fmovscs	%icc,	%f17,	%f7
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	umulcc	%o3,	0x067C,	%g5
	fzeros	%f9
	sdivcc	%i4,	0x0558,	%l4
	udivcc	%g2,	0x1136,	%l3
	lduw	[%l7 + 0x38],	%l2
	fmovrdgez	%l0,	%f4,	%f4
	movleu	%xcc,	%g7,	%i0
	fpadd16s	%f22,	%f1,	%f10
	st	%f7,	[%l7 + 0x2C]
	popc	0x1F7F,	%o1
	fnot2s	%f28,	%f9
	movvs	%xcc,	%i2,	%g3
	sra	%i3,	%l6,	%o7
	movrgez	%g6,	0x1E2,	%i1
	fmovrslez	%i5,	%f17,	%f10
	srax	%o6,	%g1,	%o4
	fpmerge	%f11,	%f27,	%f12
	lduh	[%l7 + 0x68],	%o2
	andcc	%o0,	%i7,	%o5
	movvc	%xcc,	%g4,	%l1
	ldsh	[%l7 + 0x3E],	%i6
	movvc	%icc,	%l5,	%g5
	fpsub16	%f26,	%f4,	%f26
	or	%i4,	%o3,	%g2
	movre	%l4,	0x244,	%l3
	andncc	%l0,	%g7,	%i0
	restore %l2, 0x0D5B, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g3,	%o1,	%l6
	sub	%o7,	%g6,	%i3
	sdivcc	%i5,	0x0341,	%i1
	sethi	0x0305,	%o6
	movvc	%icc,	%g1,	%o2
	andcc	%o0,	0x00EA,	%i7
	srl	%o4,	0x1C,	%o5
	fmovsl	%xcc,	%f13,	%f9
	sir	0x16B8
	udivcc	%g4,	0x0A2F,	%l1
	udivx	%l5,	0x1710,	%i6
	fpsub16s	%f24,	%f27,	%f12
	andn	%g5,	%o3,	%g2
	fcmpeq32	%f12,	%f12,	%i4
	edge32l	%l4,	%l3,	%g7
	array16	%i0,	%l0,	%l2
	umul	%i2,	%g3,	%o1
	ldsb	[%l7 + 0x15],	%l6
	edge8ln	%o7,	%g6,	%i3
	sethi	0x1787,	%i5
	orcc	%i1,	%o6,	%g1
	xorcc	%o0,	0x1B61,	%i7
	fmuld8sux16	%f9,	%f13,	%f14
	movn	%icc,	%o2,	%o5
	fnands	%f9,	%f21,	%f3
	fsrc1	%f20,	%f24
	and	%o4,	%l1,	%l5
	fmuld8ulx16	%f13,	%f18,	%f6
	movge	%icc,	%i6,	%g5
	umul	%g4,	0x05DE,	%g2
	fmovsl	%xcc,	%f21,	%f9
	movrgez	%o3,	0x319,	%i4
	mulscc	%l3,	%l4,	%g7
	orncc	%l0,	0x1259,	%l2
	fand	%f12,	%f28,	%f20
	fmovrde	%i0,	%f24,	%f22
	ldd	[%l7 + 0x68],	%i2
	edge32ln	%o1,	%g3,	%o7
	array16	%g6,	%l6,	%i3
	edge32n	%i1,	%i5,	%g1
	umul	%o0,	%o6,	%o2
	edge8n	%i7,	%o5,	%o4
	edge32n	%l1,	%i6,	%l5
	orn	%g4,	0x0EEA,	%g2
	srax	%o3,	%i4,	%l3
	movcs	%xcc,	%g5,	%g7
	ldd	[%l7 + 0x08],	%f28
	srl	%l4,	0x1D,	%l2
	and	%i0,	0x0692,	%i2
	sth	%o1,	[%l7 + 0x56]
	fandnot2s	%f9,	%f23,	%f2
	fxors	%f23,	%f17,	%f12
	or	%g3,	0x1D97,	%o7
	edge16l	%g6,	%l0,	%i3
	alignaddrl	%i1,	%l6,	%i5
	subc	%g1,	%o0,	%o6
	fmovsvs	%xcc,	%f3,	%f30
	fsrc2s	%f21,	%f22
	ldd	[%l7 + 0x78],	%i6
	edge16n	%o5,	%o2,	%l1
	movrlz	%i6,	%l5,	%o4
	smulcc	%g2,	%g4,	%i4
	movge	%icc,	%o3,	%g5
	movvs	%icc,	%g7,	%l3
	fmovsg	%xcc,	%f7,	%f4
	stb	%l2,	[%l7 + 0x44]
	ldub	[%l7 + 0x62],	%i0
	popc	0x0925,	%i2
	subc	%o1,	0x1394,	%l4
	edge16n	%g3,	%g6,	%l0
	edge32ln	%o7,	%i1,	%l6
	lduh	[%l7 + 0x5C],	%i5
	fandnot2s	%f11,	%f2,	%f2
	fmovdge	%icc,	%f25,	%f14
	umul	%g1,	0x0FBB,	%o0
	sra	%i3,	0x18,	%i7
	or	%o6,	0x0B1B,	%o5
	fcmps	%fcc1,	%f13,	%f14
	save %l1, %i6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l5,	0x3B2,	%g2
	srl	%o4,	0x07,	%i4
	srl	%g4,	0x15,	%o3
	srax	%g5,	0x1F,	%g7
	movvs	%icc,	%l2,	%i0
	subcc	%i2,	%o1,	%l4
	move	%xcc,	%l3,	%g3
	sll	%l0,	%o7,	%g6
	fornot2	%f24,	%f6,	%f20
	udiv	%i1,	0x1443,	%l6
	st	%f10,	[%l7 + 0x1C]
	udiv	%i5,	0x1297,	%g1
	edge8l	%o0,	%i3,	%i7
	movcs	%icc,	%o5,	%l1
	popc	0x1561,	%i6
	fmovrdlez	%o2,	%f26,	%f8
	alignaddrl	%l5,	%o6,	%o4
	fmovrsgz	%i4,	%f12,	%f14
	edge32n	%g4,	%g2,	%g5
	subcc	%o3,	0x0813,	%l2
	sdivx	%g7,	0x0E90,	%i0
	movrgz	%i2,	0x33B,	%o1
	fmovdgu	%icc,	%f27,	%f9
	edge32ln	%l4,	%l3,	%l0
	ldx	[%l7 + 0x28],	%g3
	srax	%o7,	%g6,	%l6
	sll	%i5,	%i1,	%g1
	fandnot1	%f8,	%f16,	%f28
	udivcc	%i3,	0x0EC8,	%i7
	fornot2	%f10,	%f10,	%f26
	add	%o0,	%l1,	%o5
	mova	%xcc,	%o2,	%l5
	fpackfix	%f0,	%f6
	edge32l	%i6,	%o4,	%i4
	movrgz	%o6,	0x233,	%g2
	movgu	%xcc,	%g5,	%o3
	stx	%l2,	[%l7 + 0x58]
	mulx	%g4,	0x1853,	%i0
	fmovde	%icc,	%f19,	%f11
	fmovdge	%icc,	%f5,	%f21
	movgu	%xcc,	%i2,	%o1
	fmovsg	%xcc,	%f13,	%f7
	and	%g7,	%l4,	%l0
	srl	%g3,	0x02,	%o7
	umulcc	%l3,	0x0044,	%l6
	sth	%g6,	[%l7 + 0x38]
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	siam	0x6
	movgu	%xcc,	%i3,	%i7
	edge16n	%i1,	%l1,	%o0
	alignaddr	%o5,	%l5,	%i6
	mova	%xcc,	%o2,	%o4
	fpadd32	%f14,	%f8,	%f2
	mulx	%i4,	%o6,	%g2
	sdiv	%o3,	0x0D8E,	%g5
	fzeros	%f4
	edge8ln	%l2,	%g4,	%i0
	fmovsg	%icc,	%f6,	%f8
	edge32ln	%o1,	%g7,	%i2
	sllx	%l4,	%l0,	%o7
	orn	%g3,	0x0905,	%l3
	sdivcc	%g6,	0x14EC,	%i5
	ldsw	[%l7 + 0x38],	%l6
	fcmped	%fcc0,	%f28,	%f8
	orcc	%i3,	%g1,	%i1
	fmovdvc	%icc,	%f8,	%f27
	sdivx	%i7,	0x02AF,	%l1
	array16	%o0,	%o5,	%i6
	fmovrdne	%l5,	%f20,	%f8
	edge16	%o2,	%i4,	%o6
	movgu	%icc,	%o4,	%g2
	udivx	%o3,	0x1EE0,	%l2
	fmovsvs	%xcc,	%f19,	%f15
	udivx	%g5,	0x0F81,	%g4
	movge	%xcc,	%o1,	%g7
	movneg	%xcc,	%i2,	%l4
	movcc	%xcc,	%i0,	%o7
	mulx	%l0,	0x09EA,	%l3
	orn	%g6,	0x1197,	%g3
	edge8ln	%i5,	%i3,	%g1
	ldub	[%l7 + 0x48],	%i1
	subc	%i7,	0x1F32,	%l6
	fmovrdgez	%l1,	%f26,	%f26
	andcc	%o5,	0x0769,	%o0
	edge16n	%i6,	%o2,	%l5
	movl	%icc,	%i4,	%o4
	udivcc	%g2,	0x019F,	%o6
	fmul8x16al	%f10,	%f19,	%f2
	ldsb	[%l7 + 0x46],	%o3
	xorcc	%g5,	%g4,	%o1
	fmovsg	%icc,	%f2,	%f4
	fmovdleu	%xcc,	%f6,	%f4
	fmovdl	%xcc,	%f17,	%f21
	nop
	set	0x74, %l0
	ldsw	[%l7 + %l0],	%g7
	xorcc	%l2,	%i2,	%l4
	add	%o7,	0x160B,	%l0
	move	%xcc,	%i0,	%g6
	sdiv	%l3,	0x10C7,	%g3
	movl	%xcc,	%i3,	%g1
	movrgez	%i1,	%i7,	%l6
	ldub	[%l7 + 0x59],	%l1
	fmul8x16	%f22,	%f4,	%f6
	fcmpes	%fcc1,	%f2,	%f2
	mulx	%o5,	0x1A3C,	%i5
	edge8l	%o0,	%i6,	%o2
	nop
	set	0x40, %l6
	lduh	[%l7 + %l6],	%l5
	save %o4, %g2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%icc,	%f28,	%f0
	xnorcc	%o6,	0x1362,	%o3
	orncc	%g4,	0x03E9,	%o1
	stb	%g5,	[%l7 + 0x61]
	lduh	[%l7 + 0x10],	%g7
	movcs	%xcc,	%i2,	%l2
	umul	%o7,	%l0,	%l4
	fcmpgt16	%f10,	%f20,	%g6
	movge	%xcc,	%l3,	%g3
	movrlz	%i3,	%g1,	%i1
	sth	%i7,	[%l7 + 0x48]
	std	%f12,	[%l7 + 0x70]
	subcc	%i0,	0x05C0,	%l1
	save %o5, 0x17A4, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i5,	0x0D6,	%o0
	edge16l	%o2,	%i6,	%l5
	movne	%xcc,	%o4,	%g2
	movvc	%icc,	%o6,	%i4
	edge32	%g4,	%o1,	%o3
	edge32n	%g5,	%i2,	%l2
	movleu	%xcc,	%g7,	%o7
	movpos	%xcc,	%l4,	%l0
	xor	%l3,	%g6,	%i3
	addccc	%g1,	0x0226,	%g3
	fxnors	%f26,	%f24,	%f24
	sllx	%i1,	%i7,	%i0
	fcmped	%fcc1,	%f2,	%f8
	fzero	%f26
	std	%f14,	[%l7 + 0x40]
	edge32l	%l1,	%o5,	%l6
	and	%i5,	0x05F3,	%o2
	sdivx	%i6,	0x0EF4,	%l5
	fmovdge	%icc,	%f8,	%f4
	edge8	%o0,	%g2,	%o4
	fcmped	%fcc2,	%f16,	%f8
	movn	%xcc,	%o6,	%i4
	edge16n	%g4,	%o3,	%o1
	smulcc	%i2,	0x080A,	%l2
	srlx	%g5,	%g7,	%l4
	subcc	%o7,	%l0,	%l3
	andncc	%i3,	%g1,	%g6
	ldsw	[%l7 + 0x14],	%g3
	sdivx	%i1,	0x0B32,	%i0
	sll	%i7,	0x13,	%o5
	movpos	%icc,	%l1,	%l6
	st	%f20,	[%l7 + 0x3C]
	movgu	%xcc,	%o2,	%i5
	orn	%i6,	0x0095,	%o0
	movge	%xcc,	%l5,	%o4
	array32	%o6,	%i4,	%g4
	addcc	%g2,	0x0EC1,	%o3
	addcc	%o1,	0x1EF2,	%i2
	edge8l	%l2,	%g5,	%l4
	stw	%o7,	[%l7 + 0x38]
	sra	%l0,	0x10,	%l3
	fsrc2s	%f5,	%f11
	nop
	set	0x7A, %g3
	ldub	[%l7 + %g3],	%i3
	array32	%g7,	%g6,	%g1
	or	%g3,	%i1,	%i0
	movgu	%xcc,	%o5,	%i7
	addccc	%l6,	%o2,	%i5
	movn	%icc,	%l1,	%o0
	sth	%l5,	[%l7 + 0x50]
	movne	%icc,	%o4,	%o6
	fcmpes	%fcc3,	%f26,	%f5
	edge16	%i4,	%i6,	%g4
	orcc	%g2,	0x03BD,	%o3
	srax	%i2,	0x00,	%l2
	fmovrdlez	%o1,	%f8,	%f24
	movcc	%icc,	%g5,	%l4
	movcs	%xcc,	%o7,	%l0
	edge32n	%l3,	%i3,	%g6
	pdist	%f2,	%f26,	%f28
	srl	%g1,	%g3,	%i1
	fmovsvc	%icc,	%f2,	%f1
	movre	%g7,	0x2E2,	%i0
	movrlz	%i7,	%o5,	%o2
	orncc	%l6,	%l1,	%o0
	addcc	%l5,	0x193F,	%o4
	fabss	%f15,	%f8
	edge8ln	%i5,	%i4,	%i6
	udiv	%o6,	0x02AE,	%g2
	sllx	%g4,	%o3,	%l2
	stb	%o1,	[%l7 + 0x4F]
	movcs	%xcc,	%g5,	%i2
	std	%f6,	[%l7 + 0x18]
	xnor	%l4,	0x1EF5,	%o7
	faligndata	%f0,	%f6,	%f0
	sra	%l3,	0x0A,	%i3
	sir	0x1489
	umulcc	%l0,	%g6,	%g3
	edge8l	%i1,	%g1,	%g7
	andn	%i0,	%o5,	%o2
	popc	0x143E,	%i7
	fmovrdne	%l1,	%f28,	%f0
	movre	%l6,	0x364,	%l5
	edge16l	%o4,	%i5,	%o0
	fmovrslz	%i6,	%f16,	%f13
	fmovrslez	%o6,	%f9,	%f31
	xor	%i4,	0x0B78,	%g2
	fmovsle	%icc,	%f28,	%f11
	ldx	[%l7 + 0x48],	%g4
	sth	%l2,	[%l7 + 0x72]
	fpsub32s	%f16,	%f8,	%f26
	fxnor	%f14,	%f22,	%f8
	edge16ln	%o3,	%g5,	%i2
	xor	%o1,	0x0752,	%o7
	xnorcc	%l4,	0x06F0,	%i3
	fones	%f30
	sdivx	%l0,	0x1275,	%l3
	array8	%g3,	%i1,	%g6
	udivx	%g1,	0x1DB5,	%g7
	orn	%i0,	%o2,	%o5
	orncc	%i7,	%l6,	%l1
	sll	%o4,	%l5,	%o0
	ldsh	[%l7 + 0x32],	%i5
	ldsb	[%l7 + 0x63],	%i6
	fandnot2s	%f24,	%f5,	%f28
	movleu	%icc,	%o6,	%i4
	add	%g4,	0x089E,	%g2
	edge32n	%o3,	%l2,	%g5
	edge8n	%o1,	%i2,	%o7
	alignaddrl	%i3,	%l0,	%l4
	nop
	set	0x3E, %i0
	ldsh	[%l7 + %i0],	%l3
	ldub	[%l7 + 0x14],	%g3
	fcmpne32	%f10,	%f2,	%i1
	fpadd16	%f2,	%f30,	%f6
	srl	%g1,	%g6,	%i0
	add	%g7,	0x0FE7,	%o2
	mulx	%i7,	0x1576,	%o5
	addc	%l6,	0x1C43,	%o4
	edge16n	%l5,	%o0,	%i5
	fmul8ulx16	%f8,	%f2,	%f20
	fsrc1s	%f26,	%f28
	save %l1, 0x00FC, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i4,	0x3D3,	%o6
	fcmpne16	%f10,	%f26,	%g4
	orn	%o3,	%g2,	%g5
	edge16ln	%o1,	%i2,	%o7
	array16	%l2,	%i3,	%l0
	mova	%xcc,	%l3,	%l4
	or	%g3,	0x06AD,	%i1
	sra	%g6,	%g1,	%i0
	ldsh	[%l7 + 0x5E],	%o2
	save %i7, 0x00D8, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l6,	%o5
	smul	%l5,	%o4,	%o0
	alignaddrl	%i5,	%i6,	%l1
	stx	%i4,	[%l7 + 0x48]
	lduw	[%l7 + 0x08],	%g4
	fxors	%f7,	%f9,	%f8
	nop
	set	0x38, %g1
	std	%f8,	[%l7 + %g1]
	smul	%o3,	%o6,	%g2
	fmovsleu	%xcc,	%f2,	%f16
	movleu	%icc,	%g5,	%o1
	movn	%xcc,	%i2,	%o7
	fone	%f30
	array16	%i3,	%l0,	%l2
	sth	%l4,	[%l7 + 0x0E]
	xnor	%l3,	%i1,	%g6
	fmovsleu	%icc,	%f0,	%f17
	edge16n	%g3,	%g1,	%o2
	ldsh	[%l7 + 0x22],	%i7
	movge	%xcc,	%g7,	%i0
	movg	%xcc,	%o5,	%l6
	fzero	%f0
	ldsh	[%l7 + 0x54],	%l5
	movg	%icc,	%o0,	%i5
	sir	0x0D24
	sethi	0x026F,	%o4
	fmovsne	%xcc,	%f20,	%f4
	ldd	[%l7 + 0x38],	%l0
	umul	%i6,	0x156C,	%i4
	array32	%o3,	%o6,	%g2
	fands	%f8,	%f12,	%f11
	and	%g5,	%g4,	%i2
	edge32ln	%o1,	%i3,	%l0
	edge16	%o7,	%l2,	%l4
	movcc	%xcc,	%i1,	%g6
	fpsub16	%f12,	%f14,	%f6
	xnorcc	%l3,	%g1,	%o2
	ldub	[%l7 + 0x4D],	%i7
	srlx	%g3,	%i0,	%g7
	fpsub16	%f22,	%f30,	%f6
	movrgz	%l6,	0x383,	%o5
	stb	%o0,	[%l7 + 0x2F]
	fmul8ulx16	%f26,	%f22,	%f12
	udivx	%l5,	0x08B2,	%o4
	fcmple16	%f12,	%f10,	%i5
	popc	0x0C96,	%l1
	ldub	[%l7 + 0x3D],	%i4
	ldub	[%l7 + 0x34],	%o3
	ldsw	[%l7 + 0x5C],	%o6
	movrlez	%g2,	0x0DC,	%g5
	movcc	%icc,	%i6,	%i2
	fzeros	%f24
	edge8n	%g4,	%o1,	%l0
	movvc	%icc,	%o7,	%l2
	addc	%i3,	0x0664,	%l4
	edge32l	%i1,	%g6,	%g1
	orcc	%o2,	0x1026,	%l3
	stb	%i7,	[%l7 + 0x44]
	edge16	%i0,	%g3,	%l6
	sdiv	%g7,	0x03F9,	%o0
	save %l5, %o4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o5,	%i4,	%o3
	ld	[%l7 + 0x3C],	%f5
	ldub	[%l7 + 0x1F],	%l1
	xnorcc	%g2,	%g5,	%i6
	movcc	%xcc,	%o6,	%i2
	movrlz	%g4,	0x15F,	%l0
	movleu	%icc,	%o1,	%o7
	andn	%l2,	0x169C,	%i3
	movpos	%xcc,	%l4,	%i1
	ldsb	[%l7 + 0x44],	%g6
	and	%g1,	0x06B3,	%o2
	fpack16	%f6,	%f1
	sub	%i7,	%i0,	%l3
	andn	%g3,	%l6,	%g7
	movn	%xcc,	%l5,	%o4
	fmul8x16al	%f22,	%f3,	%f10
	movgu	%xcc,	%o0,	%o5
	fmovrslez	%i4,	%f6,	%f31
	mulx	%i5,	0x00CE,	%l1
	ldx	[%l7 + 0x50],	%o3
	edge32l	%g5,	%g2,	%o6
	movne	%xcc,	%i6,	%g4
	andncc	%i2,	%o1,	%l0
	orn	%l2,	0x0D37,	%i3
	sth	%l4,	[%l7 + 0x1A]
	fmovdleu	%xcc,	%f28,	%f30
	fmovse	%xcc,	%f27,	%f5
	udivcc	%i1,	0x0752,	%g6
	sll	%g1,	0x1F,	%o2
	smulcc	%i7,	%o7,	%i0
	movgu	%icc,	%l3,	%l6
	nop
	set	0x70, %i1
	stw	%g3,	[%l7 + %i1]
	sdivcc	%g7,	0x03F0,	%l5
	xorcc	%o0,	0x10B8,	%o5
	fmovse	%icc,	%f20,	%f16
	movneg	%icc,	%o4,	%i5
	movle	%icc,	%l1,	%o3
	fmovsneg	%xcc,	%f5,	%f4
	lduh	[%l7 + 0x66],	%i4
	edge8n	%g2,	%g5,	%i6
	xnorcc	%g4,	%o6,	%o1
	xorcc	%l0,	0x1E45,	%l2
	ldub	[%l7 + 0x34],	%i3
	fpadd32	%f10,	%f28,	%f12
	fmovde	%icc,	%f0,	%f26
	movvs	%xcc,	%l4,	%i2
	ldsh	[%l7 + 0x08],	%g6
	movrlz	%g1,	0x245,	%i1
	and	%i7,	%o7,	%i0
	and	%o2,	%l6,	%l3
	fcmps	%fcc3,	%f15,	%f18
	subc	%g7,	0x1798,	%g3
	fandnot2s	%f13,	%f31,	%f11
	subccc	%o0,	%l5,	%o5
	fmovdgu	%xcc,	%f31,	%f26
	srl	%o4,	0x15,	%i5
	sir	0x06F5
	sdivx	%l1,	0x02DC,	%o3
	sdivx	%i4,	0x1F2E,	%g5
	movrlz	%g2,	0x397,	%i6
	alignaddrl	%o6,	%g4,	%o1
	movrgez	%l0,	0x323,	%l2
	fmuld8ulx16	%f1,	%f16,	%f28
	movcc	%xcc,	%i3,	%l4
	ldub	[%l7 + 0x0C],	%g6
	st	%f26,	[%l7 + 0x24]
	movrgz	%g1,	0x038,	%i1
	srax	%i7,	%i2,	%o7
	fnegs	%f5,	%f5
	fnands	%f16,	%f2,	%f31
	sra	%o2,	0x1A,	%i0
	restore %l6, 0x1D8C, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g3,	%g7
	nop
	set	0x14, %g6
	stw	%o0,	[%l7 + %g6]
	fzero	%f14
	edge8	%o5,	%o4,	%i5
	andncc	%l5,	%l1,	%o3
	fmovdvc	%icc,	%f19,	%f15
	movn	%xcc,	%g5,	%g2
	ldd	[%l7 + 0x50],	%f24
	edge8l	%i6,	%i4,	%g4
	fmovrdgez	%o1,	%f0,	%f22
	fmovdge	%icc,	%f24,	%f4
	fandnot2	%f4,	%f18,	%f6
	fmovdgu	%xcc,	%f8,	%f5
	sir	0x1CF4
	movrgez	%l0,	0x0B3,	%o6
	fmovsvs	%icc,	%f6,	%f15
	movcs	%xcc,	%i3,	%l4
	fmovdpos	%icc,	%f4,	%f20
	fnor	%f30,	%f14,	%f22
	fmovsleu	%xcc,	%f29,	%f22
	sdivcc	%g6,	0x00D5,	%g1
	array8	%l2,	%i7,	%i1
	fcmps	%fcc1,	%f27,	%f27
	edge32n	%o7,	%o2,	%i2
	subc	%i0,	0x1B1C,	%l6
	and	%g3,	%l3,	%o0
	ld	[%l7 + 0x2C],	%f28
	udivx	%o5,	0x12CC,	%o4
	movgu	%xcc,	%g7,	%i5
	movcc	%icc,	%l5,	%o3
	edge8l	%l1,	%g2,	%g5
	fand	%f4,	%f30,	%f8
	andcc	%i4,	0x16E2,	%i6
	sdiv	%o1,	0x1E69,	%l0
	nop
	set	0x39, %l3
	ldub	[%l7 + %l3],	%o6
	srl	%i3,	0x1A,	%g4
	fxors	%f0,	%f21,	%f21
	ldsb	[%l7 + 0x48],	%l4
	and	%g1,	0x10C4,	%g6
	movne	%xcc,	%i7,	%l2
	fxnors	%f8,	%f2,	%f11
	fcmpeq16	%f2,	%f20,	%i1
	fmovscc	%icc,	%f11,	%f17
	sdivcc	%o7,	0x0618,	%o2
	movl	%xcc,	%i2,	%l6
	ldsb	[%l7 + 0x7B],	%i0
	fpsub16	%f20,	%f4,	%f10
	orncc	%g3,	0x02AF,	%o0
	andncc	%o5,	%l3,	%o4
	movne	%xcc,	%g7,	%l5
	array8	%o3,	%i5,	%g2
	fcmple16	%f28,	%f6,	%l1
	sub	%g5,	0x0F75,	%i4
	sdiv	%o1,	0x0B31,	%i6
	fsrc1s	%f8,	%f25
	andcc	%o6,	%l0,	%i3
	movle	%xcc,	%g4,	%l4
	orcc	%g6,	0x1DBD,	%g1
	subccc	%l2,	%i1,	%o7
	fmul8x16au	%f14,	%f0,	%f28
	movg	%icc,	%o2,	%i7
	fand	%f30,	%f6,	%f2
	smul	%i2,	%i0,	%l6
	edge16l	%o0,	%o5,	%g3
	edge16	%o4,	%l3,	%g7
	xnor	%l5,	%o3,	%i5
	and	%l1,	%g5,	%i4
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	movrne	%i6,	%l0,	%i3
	edge32l	%o6,	%l4,	%g6
	array8	%g1,	%g4,	%l2
	restore %i1, %o2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f31,	%f23,	%f28
	add	%i2,	%i0,	%l6
	array16	%o0,	%o5,	%o7
	fmul8x16au	%f13,	%f12,	%f10
	fxnors	%f12,	%f24,	%f9
	fxnor	%f14,	%f18,	%f30
	lduh	[%l7 + 0x50],	%g3
	mova	%icc,	%l3,	%g7
	srax	%l5,	%o4,	%i5
	stb	%o3,	[%l7 + 0x12]
	fmovspos	%xcc,	%f26,	%f21
	edge8n	%l1,	%i4,	%g5
	nop
	set	0x40, %i3
	std	%f6,	[%l7 + %i3]
	array8	%g2,	%i6,	%l0
	fmovsgu	%icc,	%f17,	%f31
	fsrc1	%f30,	%f28
	movleu	%icc,	%i3,	%o1
	fmovrde	%o6,	%f16,	%f16
	edge8n	%l4,	%g6,	%g4
	movcc	%icc,	%l2,	%g1
	movrgez	%o2,	0x358,	%i1
	sllx	%i2,	%i7,	%i0
	edge8l	%l6,	%o0,	%o7
	fpack32	%f30,	%f0,	%f4
	edge32ln	%g3,	%l3,	%g7
	fpmerge	%f10,	%f21,	%f14
	array32	%l5,	%o4,	%i5
	fones	%f6
	orncc	%o5,	%l1,	%i4
	fandnot2s	%f23,	%f30,	%f17
	orn	%g5,	0x082E,	%o3
	smulcc	%i6,	%g2,	%l0
	movcs	%xcc,	%i3,	%o6
	movcs	%xcc,	%o1,	%l4
	fmovdpos	%xcc,	%f1,	%f6
	xorcc	%g4,	%l2,	%g6
	movrlez	%o2,	%i1,	%i2
	orn	%g1,	0x0F53,	%i0
	edge8	%i7,	%l6,	%o0
	fornot2s	%f7,	%f7,	%f29
	movpos	%icc,	%g3,	%o7
	addcc	%g7,	0x0C8C,	%l3
	fmovdg	%xcc,	%f7,	%f22
	addccc	%l5,	%i5,	%o5
	and	%l1,	%i4,	%o4
	ldub	[%l7 + 0x2E],	%g5
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	sllx	%o3,	0x06,	%i3
	sdiv	%l0,	0x14BA,	%o6
	movleu	%xcc,	%o1,	%l4
	edge8n	%l2,	%g6,	%o2
	sra	%g4,	%i2,	%i1
	sll	%i0,	0x0C,	%g1
	fcmple16	%f4,	%f18,	%l6
	sth	%o0,	[%l7 + 0x40]
	save %i7, %o7, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0785
	fmovdvc	%icc,	%f9,	%f10
	mulscc	%g7,	0x1ED6,	%l3
	xnorcc	%l5,	0x0000,	%o5
	edge16n	%i5,	%l1,	%i4
	fornot2	%f14,	%f14,	%f2
	fsrc1	%f4,	%f8
	srl	%g5,	0x0F,	%o4
	fmuld8ulx16	%f25,	%f27,	%f8
	fmovsa	%icc,	%f1,	%f28
	fandnot1	%f4,	%f16,	%f18
	edge16	%i6,	%o3,	%i3
	xor	%l0,	%o6,	%o1
	movneg	%icc,	%g2,	%l2
	andcc	%l4,	0x0451,	%g6
	addc	%o2,	%i2,	%i1
	subccc	%g4,	0x1297,	%i0
	fcmple16	%f2,	%f30,	%l6
	fmovrslez	%o0,	%f20,	%f8
	alignaddrl	%g1,	%i7,	%g3
	edge16l	%g7,	%o7,	%l3
	umulcc	%l5,	0x0482,	%i5
	edge32l	%l1,	%i4,	%o5
	array8	%g5,	%i6,	%o4
	or	%o3,	%l0,	%o6
	fabss	%f6,	%f7
	fmovrdlz	%o1,	%f28,	%f12
	mulx	%g2,	%i3,	%l4
	move	%icc,	%g6,	%l2
	movre	%i2,	%o2,	%g4
	movrlz	%i1,	0x330,	%l6
	sth	%i0,	[%l7 + 0x74]
	fcmple16	%f6,	%f26,	%g1
	addccc	%o0,	%g3,	%i7
	addccc	%g7,	%l3,	%o7
	fxnor	%f8,	%f8,	%f0
	fnot1s	%f23,	%f26
	movneg	%icc,	%i5,	%l5
	ldd	[%l7 + 0x10],	%l0
	alignaddrl	%i4,	%o5,	%g5
	sll	%o4,	0x0D,	%i6
	edge16	%o3,	%l0,	%o6
	alignaddr	%o1,	%i3,	%g2
	fmovdne	%icc,	%f3,	%f31
	fmovdle	%xcc,	%f14,	%f1
	orn	%g6,	%l2,	%l4
	mova	%xcc,	%i2,	%o2
	orn	%g4,	0x1663,	%l6
	edge32n	%i1,	%g1,	%i0
	mulx	%g3,	%o0,	%i7
	mulx	%g7,	%o7,	%l3
	stw	%l5,	[%l7 + 0x0C]
	fpsub32s	%f27,	%f24,	%f26
	fmovdcs	%icc,	%f8,	%f6
	edge8l	%l1,	%i5,	%i4
	movvc	%icc,	%g5,	%o5
	edge32	%o4,	%i6,	%o3
	movleu	%xcc,	%o6,	%l0
	alignaddrl	%o1,	%i3,	%g6
	fornot2s	%f23,	%f4,	%f18
	movrlez	%g2,	%l2,	%i2
	edge32ln	%o2,	%l4,	%g4
	fnegd	%f14,	%f24
	ldd	[%l7 + 0x70],	%f2
	sllx	%i1,	%l6,	%i0
	edge8	%g1,	%g3,	%o0
	edge8n	%g7,	%o7,	%i7
	ld	[%l7 + 0x10],	%f15
	stw	%l3,	[%l7 + 0x20]
	movcc	%icc,	%l5,	%l1
	movneg	%icc,	%i5,	%g5
	movgu	%icc,	%o5,	%o4
	fcmple16	%f2,	%f26,	%i6
	edge16ln	%i4,	%o3,	%l0
	edge8n	%o1,	%o6,	%g6
	xnorcc	%i3,	0x11DF,	%g2
	movpos	%xcc,	%i2,	%l2
	ldd	[%l7 + 0x18],	%f26
	fpsub32s	%f15,	%f29,	%f16
	sllx	%l4,	%o2,	%g4
	ldd	[%l7 + 0x58],	%f8
	fcmpne32	%f28,	%f16,	%l6
	array8	%i1,	%g1,	%i0
	sdiv	%g3,	0x0613,	%o0
	ldsw	[%l7 + 0x44],	%o7
	movcs	%icc,	%g7,	%i7
	fcmpne16	%f26,	%f18,	%l3
	udiv	%l1,	0x09DA,	%l5
	movrlz	%g5,	0x338,	%i5
	movne	%xcc,	%o4,	%i6
	subccc	%o5,	0x0F5A,	%o3
	fmovrdgz	%i4,	%f4,	%f8
	and	%o1,	%l0,	%g6
	save %i3, 0x17DF, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g2,	%i2,	%l4
	fnors	%f17,	%f24,	%f11
	popc	0x1BC5,	%o2
	xor	%l2,	%g4,	%i1
	addc	%l6,	0x1B07,	%i0
	xorcc	%g1,	0x02A0,	%o0
	fxors	%f10,	%f0,	%f21
	movvc	%icc,	%o7,	%g3
	sub	%i7,	%g7,	%l3
	movvs	%icc,	%l5,	%g5
	movrlz	%l1,	%o4,	%i6
	nop
	set	0x28, %g7
	ldd	[%l7 + %g7],	%i4
	andncc	%o5,	%i4,	%o3
	movrlz	%l0,	0x166,	%g6
	edge16ln	%o1,	%i3,	%g2
	movl	%icc,	%o6,	%l4
	pdist	%f2,	%f16,	%f4
	std	%f8,	[%l7 + 0x50]
	smul	%o2,	0x15D4,	%i2
	movg	%xcc,	%g4,	%i1
	fmovsgu	%xcc,	%f17,	%f2
	sllx	%l6,	%l2,	%i0
	fmovrslz	%o0,	%f22,	%f30
	stw	%g1,	[%l7 + 0x14]
	fmovsge	%xcc,	%f28,	%f0
	ld	[%l7 + 0x70],	%f31
	stb	%o7,	[%l7 + 0x49]
	xor	%i7,	0x110A,	%g3
	stb	%l3,	[%l7 + 0x7C]
	and	%l5,	%g7,	%l1
	alignaddr	%g5,	%i6,	%o4
	sdivx	%i5,	0x09D7,	%o5
	or	%i4,	%o3,	%l0
	fmul8sux16	%f10,	%f30,	%f8
	smulcc	%g6,	0x121C,	%i3
	addcc	%g2,	0x1211,	%o1
	alignaddrl	%l4,	%o6,	%i2
	udivx	%g4,	0x1836,	%i1
	edge32l	%l6,	%l2,	%o2
	movleu	%xcc,	%o0,	%g1
	fandnot2s	%f27,	%f15,	%f28
	andn	%i0,	%o7,	%g3
	array16	%l3,	%l5,	%g7
	subccc	%l1,	%g5,	%i7
	movrne	%i6,	%i5,	%o4
	and	%i4,	%o3,	%l0
	addccc	%o5,	%i3,	%g2
	xnor	%o1,	%l4,	%o6
	movrlz	%i2,	%g4,	%g6
	fmovsvc	%xcc,	%f19,	%f6
	fcmpes	%fcc0,	%f5,	%f7
	fxnors	%f16,	%f28,	%f23
	std	%f4,	[%l7 + 0x10]
	fmovdvs	%icc,	%f30,	%f2
	umulcc	%i1,	0x1F5D,	%l6
	and	%o2,	0x0E2A,	%o0
	edge8	%g1,	%i0,	%l2
	xnor	%o7,	%g3,	%l5
	mova	%xcc,	%g7,	%l1
	fcmpgt32	%f16,	%f0,	%g5
	ldx	[%l7 + 0x10],	%l3
	addc	%i6,	%i5,	%o4
	array32	%i7,	%i4,	%o3
	movrlez	%o5,	0x1E3,	%l0
	fmovdgu	%icc,	%f24,	%f13
	orncc	%i3,	0x0AB2,	%g2
	sdiv	%o1,	0x0BCD,	%o6
	orncc	%l4,	0x1246,	%g4
	fmovd	%f10,	%f6
	edge32n	%g6,	%i2,	%i1
	movn	%xcc,	%l6,	%o0
	smulcc	%g1,	%o2,	%l2
	orncc	%o7,	%i0,	%g3
	sdivcc	%g7,	0x18F2,	%l1
	alignaddrl	%g5,	%l3,	%i6
	ldsh	[%l7 + 0x4A],	%i5
	andn	%o4,	%i7,	%i4
	fmovdne	%icc,	%f6,	%f29
	movge	%icc,	%l5,	%o3
	andncc	%l0,	%i3,	%o5
	movre	%o1,	%g2,	%o6
	movcs	%xcc,	%l4,	%g4
	sll	%g6,	0x06,	%i2
	fmovdle	%xcc,	%f23,	%f11
	umulcc	%l6,	%i1,	%o0
	and	%o2,	0x0E08,	%g1
	movvc	%icc,	%l2,	%i0
	movne	%icc,	%o7,	%g3
	fmovrsgz	%l1,	%f4,	%f11
	array32	%g7,	%g5,	%i6
	fcmps	%fcc3,	%f12,	%f9
	mova	%xcc,	%l3,	%i5
	srl	%i7,	0x0C,	%o4
	movge	%icc,	%i4,	%o3
	fmovsne	%icc,	%f29,	%f13
	srl	%l5,	%l0,	%o5
	movrlez	%i3,	%g2,	%o6
	edge32l	%o1,	%l4,	%g6
	fmovdcs	%icc,	%f2,	%f22
	st	%f23,	[%l7 + 0x18]
	movrlez	%g4,	%l6,	%i1
	udiv	%o0,	0x0208,	%o2
	umul	%g1,	%i2,	%l2
	edge8l	%i0,	%g3,	%l1
	movpos	%icc,	%g7,	%g5
	movcc	%icc,	%o7,	%i6
	lduh	[%l7 + 0x56],	%l3
	ldsh	[%l7 + 0x3A],	%i5
	xorcc	%i7,	0x1D60,	%o4
	move	%xcc,	%o3,	%l5
	srax	%l0,	%i4,	%i3
	fmovrslez	%g2,	%f22,	%f8
	ldsw	[%l7 + 0x5C],	%o6
	movcc	%xcc,	%o1,	%o5
	edge8l	%l4,	%g6,	%g4
	movrne	%l6,	%i1,	%o2
	ldsb	[%l7 + 0x40],	%g1
	lduw	[%l7 + 0x0C],	%o0
	ldx	[%l7 + 0x20],	%i2
	edge32l	%i0,	%g3,	%l2
	movg	%xcc,	%g7,	%g5
	srax	%o7,	0x0C,	%i6
	movpos	%xcc,	%l1,	%i5
	st	%f20,	[%l7 + 0x68]
	movpos	%xcc,	%i7,	%l3
	fcmpgt16	%f20,	%f8,	%o4
	std	%f16,	[%l7 + 0x40]
	ldd	[%l7 + 0x50],	%f2
	andcc	%l5,	%o3,	%l0
	fmovdpos	%icc,	%f6,	%f7
	ldsh	[%l7 + 0x3C],	%i3
	udivcc	%i4,	0x1D45,	%o6
	move	%icc,	%g2,	%o5
	alignaddrl	%o1,	%l4,	%g6
	fcmped	%fcc0,	%f8,	%f14
	xorcc	%g4,	%i1,	%l6
	edge8ln	%o2,	%o0,	%i2
	fcmpeq32	%f26,	%f14,	%g1
	ldsb	[%l7 + 0x4E],	%g3
	orcc	%i0,	%g7,	%l2
	subccc	%g5,	0x1C24,	%i6
	udiv	%l1,	0x012B,	%o7
	mulscc	%i7,	%i5,	%l3
	ldsw	[%l7 + 0x70],	%o4
	fxors	%f25,	%f5,	%f1
	smulcc	%o3,	0x16D4,	%l0
	movleu	%xcc,	%l5,	%i4
	fpadd16s	%f1,	%f0,	%f25
	movrlz	%i3,	%g2,	%o6
	save %o5, %o1, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g4,	0x1C9F,	%l4
	alignaddr	%i1,	%l6,	%o0
	movrlez	%i2,	0x36F,	%o2
	fmovscc	%icc,	%f23,	%f8
	array16	%g1,	%g3,	%i0
	fmovrdgez	%g7,	%f8,	%f10
	edge32	%g5,	%l2,	%l1
	or	%o7,	%i7,	%i6
	nop
	set	0x44, %o7
	ldsw	[%l7 + %o7],	%i5
	movg	%xcc,	%l3,	%o3
	restore %l0, %o4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i4,	[%l7 + 0x64]
	ld	[%l7 + 0x30],	%f12
	ld	[%l7 + 0x28],	%f22
	srlx	%i3,	0x00,	%o6
	move	%icc,	%g2,	%o1
	fzeros	%f19
	ld	[%l7 + 0x1C],	%f27
	movpos	%xcc,	%o5,	%g4
	fpsub16	%f18,	%f30,	%f26
	movl	%xcc,	%l4,	%i1
	udivcc	%g6,	0x19D5,	%o0
	fpsub16	%f22,	%f14,	%f18
	mulscc	%i2,	%o2,	%l6
	sdiv	%g3,	0x011D,	%i0
	srax	%g1,	0x06,	%g5
	array16	%g7,	%l2,	%l1
	fcmple16	%f28,	%f2,	%i7
	movcc	%xcc,	%i6,	%o7
	srl	%l3,	0x06,	%o3
	movneg	%icc,	%l0,	%i5
	movg	%icc,	%l5,	%i4
	mulx	%i3,	%o4,	%g2
	stb	%o1,	[%l7 + 0x51]
	mulscc	%o5,	0x0F26,	%o6
	mova	%xcc,	%g4,	%l4
	fpadd32s	%f19,	%f25,	%f4
	xorcc	%i1,	0x13F3,	%o0
	srlx	%i2,	%o2,	%l6
	sir	0x0700
	sdivcc	%g3,	0x11D0,	%i0
	edge16ln	%g1,	%g6,	%g7
	sethi	0x0605,	%g5
	sethi	0x0FDD,	%l1
	srax	%l2,	%i6,	%i7
	fxnor	%f16,	%f18,	%f28
	ld	[%l7 + 0x08],	%f8
	fmovscs	%xcc,	%f8,	%f8
	movn	%xcc,	%l3,	%o7
	lduw	[%l7 + 0x14],	%l0
	umul	%i5,	%l5,	%o3
	stx	%i3,	[%l7 + 0x50]
	edge32n	%o4,	%i4,	%g2
	xnor	%o5,	0x079C,	%o1
	mova	%icc,	%g4,	%l4
	stx	%i1,	[%l7 + 0x70]
	add	%o6,	%i2,	%o2
	sdiv	%l6,	0x15B9,	%g3
	udivcc	%o0,	0x1E8D,	%i0
	popc	0x1520,	%g6
	orn	%g1,	0x1149,	%g7
	add	%g5,	0x1BE3,	%l1
	movrne	%l2,	%i6,	%l3
	array16	%i7,	%o7,	%i5
	fabss	%f24,	%f25
	sdiv	%l0,	0x057A,	%l5
	fmovrslz	%o3,	%f24,	%f3
	add	%i3,	0x19D8,	%i4
	xnor	%g2,	%o5,	%o1
	fpadd32s	%f8,	%f18,	%f20
	xnorcc	%o4,	0x18BF,	%l4
	edge16n	%g4,	%o6,	%i1
	movn	%xcc,	%o2,	%l6
	fpsub32	%f10,	%f6,	%f24
	movpos	%icc,	%g3,	%i2
	ldsh	[%l7 + 0x70],	%o0
	alignaddr	%g6,	%g1,	%i0
	array16	%g5,	%g7,	%l1
	fandnot1	%f0,	%f14,	%f26
	edge32ln	%l2,	%i6,	%l3
	movrlz	%o7,	0x384,	%i7
	xnor	%i5,	0x179D,	%l5
	fcmpgt32	%f0,	%f18,	%o3
	fmovsn	%icc,	%f22,	%f9
	lduw	[%l7 + 0x28],	%i3
	umul	%l0,	0x0DD6,	%i4
	edge32	%g2,	%o5,	%o4
	add	%l4,	0x05F9,	%g4
	movrlez	%o1,	%o6,	%o2
	udivx	%l6,	0x1D66,	%g3
	sra	%i2,	%o0,	%i1
	fmovdgu	%icc,	%f23,	%f12
	srl	%g1,	%i0,	%g5
	edge32ln	%g7,	%g6,	%l1
	fmovrslz	%l2,	%f25,	%f19
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	movgu	%icc,	%o7,	%i5
	edge32ln	%l5,	%i7,	%o3
	edge32l	%l0,	%i4,	%i3
	lduh	[%l7 + 0x34],	%g2
	movge	%xcc,	%o4,	%o5
	popc	%l4,	%o1
	sth	%g4,	[%l7 + 0x5E]
	movre	%o2,	%l6,	%o6
	edge32n	%i2,	%o0,	%g3
	std	%f4,	[%l7 + 0x08]
	umul	%i1,	0x0E93,	%g1
	fmovsleu	%icc,	%f18,	%f17
	sdivx	%g5,	0x0E31,	%g7
	fnegd	%f4,	%f20
	stx	%i0,	[%l7 + 0x50]
	ldsh	[%l7 + 0x1C],	%l1
	nop
	set	0x08, %l4
	stx	%g6,	[%l7 + %l4]
	edge8n	%i6,	%l2,	%o7
	fmovrdgz	%l3,	%f0,	%f20
	and	%l5,	%i5,	%i7
	fones	%f22
	orcc	%o3,	0x1C8C,	%l0
	fmovde	%xcc,	%f9,	%f5
	movne	%xcc,	%i3,	%g2
	udivcc	%i4,	0x0AA3,	%o4
	movne	%xcc,	%o5,	%l4
	sll	%g4,	0x0D,	%o1
	fmovdgu	%xcc,	%f21,	%f4
	movrne	%o2,	%o6,	%l6
	mova	%xcc,	%o0,	%g3
	sub	%i2,	%i1,	%g5
	save %g1, 0x06FB, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1E42,	%l1
	sub	%i0,	%g6,	%i6
	sllx	%o7,	0x12,	%l3
	ld	[%l7 + 0x14],	%f28
	mova	%icc,	%l2,	%i5
	fmul8x16al	%f7,	%f31,	%f8
	move	%icc,	%i7,	%l5
	fand	%f30,	%f14,	%f24
	edge32l	%l0,	%i3,	%g2
	xor	%o3,	%o4,	%o5
	sdivcc	%i4,	0x04DB,	%l4
	fpackfix	%f30,	%f12
	sethi	0x1684,	%g4
	fpadd32	%f28,	%f22,	%f24
	fornot2s	%f24,	%f10,	%f1
	movl	%icc,	%o2,	%o6
	movgu	%icc,	%o1,	%l6
	alignaddrl	%g3,	%o0,	%i1
	ldsb	[%l7 + 0x7C],	%g5
	and	%i2,	%g1,	%l1
	fmovse	%xcc,	%f9,	%f24
	movleu	%xcc,	%g7,	%g6
	fmovs	%f6,	%f16
	lduw	[%l7 + 0x48],	%i6
	movre	%o7,	0x25C,	%l3
	addc	%i0,	0x0446,	%i5
	edge16l	%l2,	%i7,	%l0
	fcmple32	%f30,	%f8,	%l5
	stx	%g2,	[%l7 + 0x30]
	addccc	%o3,	0x00F2,	%i3
	sir	0x107F
	xorcc	%o4,	%i4,	%o5
	and	%g4,	0x0BDF,	%l4
	sub	%o2,	0x1EC1,	%o1
	edge32l	%o6,	%l6,	%g3
	fcmped	%fcc1,	%f28,	%f24
	movrlez	%i1,	%g5,	%i2
	orncc	%g1,	0x0CA8,	%o0
	fsrc2s	%f29,	%f7
	movne	%xcc,	%g7,	%g6
	fzeros	%f4
	srl	%i6,	0x19,	%l1
	nop
	set	0x1E, %i7
	sth	%l3,	[%l7 + %i7]
	sdivx	%i0,	0x17A6,	%i5
	smul	%l2,	0x1FCB,	%i7
	and	%o7,	%l5,	%g2
	umul	%o3,	0x116A,	%i3
	save %o4, 0x1577, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l0,	%g4,	%l4
	movrgez	%o2,	0x080,	%o5
	fmovda	%icc,	%f3,	%f23
	addccc	%o1,	%o6,	%g3
	move	%icc,	%i1,	%l6
	fmovdl	%icc,	%f11,	%f25
	udivcc	%g5,	0x14FC,	%i2
	edge32l	%g1,	%g7,	%o0
	movne	%xcc,	%i6,	%g6
	srax	%l3,	0x1A,	%l1
	fmovsne	%xcc,	%f8,	%f10
	array8	%i0,	%l2,	%i7
	smul	%i5,	%o7,	%g2
	sdiv	%o3,	0x0064,	%l5
	stx	%o4,	[%l7 + 0x50]
	fcmpd	%fcc2,	%f10,	%f14
	ldd	[%l7 + 0x38],	%f0
	restore %i3, %l0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%l4,	%i4
	mulscc	%o5,	%o1,	%o6
	fmul8sux16	%f20,	%f18,	%f20
	xnorcc	%o2,	0x0DDC,	%i1
	srax	%l6,	%g5,	%g3
	movl	%xcc,	%g1,	%i2
	addc	%g7,	%i6,	%o0
	ldd	[%l7 + 0x40],	%l2
	edge32l	%l1,	%g6,	%l2
	edge32	%i7,	%i0,	%o7
	ldsw	[%l7 + 0x10],	%g2
	andncc	%i5,	%o3,	%l5
	array32	%o4,	%i3,	%l0
	udivcc	%g4,	0x12A4,	%i4
	ldub	[%l7 + 0x48],	%l4
	stx	%o5,	[%l7 + 0x08]
	fmovd	%f18,	%f4
	umulcc	%o1,	%o2,	%i1
	fmovsge	%icc,	%f2,	%f10
	fxors	%f26,	%f31,	%f13
	fmovdleu	%icc,	%f2,	%f21
	orcc	%o6,	0x1F8A,	%l6
	movrlz	%g5,	%g1,	%i2
	bshuffle	%f22,	%f6,	%f6
	addccc	%g3,	%i6,	%o0
	ldub	[%l7 + 0x50],	%g7
	edge8n	%l1,	%g6,	%l2
	fmovdleu	%xcc,	%f17,	%f16
	umul	%i7,	0x052D,	%l3
	movgu	%icc,	%i0,	%o7
	fsrc1s	%f14,	%f29
	fmovsge	%icc,	%f12,	%f4
	stx	%g2,	[%l7 + 0x60]
	move	%icc,	%i5,	%o3
	xorcc	%o4,	0x11C1,	%i3
	fmovrsgz	%l5,	%f25,	%f24
	st	%f6,	[%l7 + 0x60]
	fandnot1s	%f8,	%f21,	%f3
	fpadd16s	%f20,	%f19,	%f10
	edge16n	%g4,	%i4,	%l0
	movvs	%xcc,	%l4,	%o1
	smul	%o5,	%o2,	%i1
	fcmpeq16	%f10,	%f14,	%l6
	srl	%g5,	%o6,	%g1
	edge32	%i2,	%g3,	%i6
	ldsb	[%l7 + 0x5E],	%g7
	udivx	%o0,	0x1DD8,	%g6
	sll	%l2,	0x19,	%i7
	movpos	%xcc,	%l3,	%i0
	movrgz	%o7,	%l1,	%i5
	ldd	[%l7 + 0x48],	%o2
	fxnors	%f13,	%f16,	%f9
	add	%g2,	0x0815,	%o4
	st	%f0,	[%l7 + 0x24]
	sethi	0x1598,	%i3
	srlx	%g4,	0x0B,	%i4
	sir	0x1E0D
	movrne	%l5,	%l4,	%o1
	srl	%o5,	0x11,	%o2
	move	%xcc,	%i1,	%l0
	ldsh	[%l7 + 0x52],	%g5
	movneg	%xcc,	%o6,	%g1
	alignaddr	%i2,	%l6,	%g3
	edge8n	%i6,	%o0,	%g6
	fmovdvc	%xcc,	%f6,	%f7
	movne	%icc,	%l2,	%i7
	udiv	%g7,	0x05F7,	%l3
	umulcc	%o7,	%i0,	%i5
	fmovsl	%icc,	%f15,	%f4
	fsrc2s	%f7,	%f12
	movrlz	%o3,	%l1,	%o4
	edge16l	%g2,	%g4,	%i4
	edge8l	%l5,	%i3,	%o1
	andn	%o5,	0x1E8A,	%l4
	stw	%o2,	[%l7 + 0x1C]
	sdiv	%l0,	0x0200,	%g5
	ldub	[%l7 + 0x11],	%o6
	movne	%xcc,	%i1,	%i2
	udiv	%l6,	0x00D6,	%g1
	xor	%g3,	%i6,	%o0
	udiv	%g6,	0x16AC,	%i7
	orn	%g7,	%l2,	%l3
	fpsub16s	%f14,	%f21,	%f17
	fxnors	%f18,	%f7,	%f4
	edge16n	%i0,	%i5,	%o3
	xorcc	%o7,	%o4,	%l1
	movcs	%xcc,	%g4,	%i4
	ldsw	[%l7 + 0x28],	%g2
	movvc	%icc,	%l5,	%o1
	edge8n	%o5,	%l4,	%i3
	movrgz	%l0,	%o2,	%o6
	movl	%xcc,	%g5,	%i2
	edge16n	%l6,	%i1,	%g3
	movrne	%g1,	0x0F0,	%o0
	stw	%g6,	[%l7 + 0x74]
	ldsb	[%l7 + 0x1A],	%i6
	fxor	%f30,	%f22,	%f10
	ldsb	[%l7 + 0x61],	%i7
	movvc	%xcc,	%g7,	%l2
	stw	%i0,	[%l7 + 0x38]
	sdivcc	%l3,	0x0AAB,	%i5
	movpos	%xcc,	%o3,	%o4
	fones	%f23
	fmovrdlz	%l1,	%f4,	%f30
	fnot1s	%f20,	%f4
	lduh	[%l7 + 0x78],	%o7
	srax	%g4,	%g2,	%i4
	edge32n	%o1,	%o5,	%l4
	fxors	%f21,	%f16,	%f3
	array32	%l5,	%l0,	%i3
	array8	%o2,	%o6,	%i2
	movrlez	%l6,	%g5,	%i1
	subccc	%g1,	0x1442,	%g3
	fmovde	%icc,	%f9,	%f17
	udiv	%o0,	0x1B1A,	%i6
	nop
	set	0x3E, %o6
	ldub	[%l7 + %o6],	%g6
	sdiv	%g7,	0x1755,	%i7
	stx	%l2,	[%l7 + 0x28]
	fxnors	%f15,	%f8,	%f12
	edge32l	%l3,	%i0,	%o3
	fmovsvs	%icc,	%f16,	%f13
	alignaddrl	%o4,	%i5,	%o7
	movn	%icc,	%g4,	%l1
	st	%f19,	[%l7 + 0x3C]
	fmovrslz	%g2,	%f25,	%f8
	fmovsn	%xcc,	%f28,	%f11
	and	%i4,	%o5,	%l4
	fcmpeq16	%f4,	%f6,	%o1
	umulcc	%l5,	0x0B2F,	%l0
	sir	0x1318
	fmovrse	%o2,	%f28,	%f18
	fsrc1	%f20,	%f0
	movg	%xcc,	%o6,	%i2
	srax	%i3,	0x02,	%g5
	fabss	%f22,	%f15
	fandnot2s	%f9,	%f19,	%f6
	edge32ln	%l6,	%g1,	%i1
	alignaddr	%o0,	%g3,	%g6
	edge16l	%i6,	%g7,	%l2
	array8	%l3,	%i0,	%o3
	lduw	[%l7 + 0x38],	%i7
	orncc	%o4,	0x00D7,	%i5
	std	%f12,	[%l7 + 0x08]
	stx	%o7,	[%l7 + 0x08]
	xnorcc	%g4,	%l1,	%i4
	movvc	%icc,	%g2,	%o5
	fxnor	%f4,	%f22,	%f12
	and	%o1,	%l5,	%l4
	array32	%l0,	%o6,	%i2
	edge8n	%i3,	%o2,	%g5
	subccc	%g1,	%l6,	%i1
	sir	0x0EB4
	movcc	%xcc,	%o0,	%g3
	srlx	%i6,	0x1D,	%g7
	orcc	%l2,	%g6,	%l3
	movrlz	%i0,	%i7,	%o3
	xnor	%o4,	0x0005,	%i5
	movrne	%g4,	0x0A1,	%o7
	stb	%l1,	[%l7 + 0x2E]
	fmovscs	%icc,	%f21,	%f31
	xnorcc	%g2,	%i4,	%o1
	orcc	%l5,	0x0A3B,	%o5
	alignaddr	%l0,	%l4,	%i2
	fcmpne32	%f4,	%f26,	%i3
	add	%o6,	%g5,	%g1
	ldsh	[%l7 + 0x10],	%o2
	movrgez	%i1,	0x3C2,	%l6
	sethi	0x1F85,	%o0
	movvs	%icc,	%i6,	%g7
	movvc	%xcc,	%g3,	%g6
	sdiv	%l3,	0x04CE,	%l2
	edge8	%i7,	%i0,	%o4
	move	%icc,	%i5,	%g4
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	srlx	%l1,	0x07,	%o1
	movrne	%l5,	%i4,	%l0
	faligndata	%f26,	%f8,	%f22
	add	%o5,	0x1C05,	%l4
	movrlez	%i3,	0x111,	%i2
	lduh	[%l7 + 0x44],	%o6
	movgu	%icc,	%g1,	%g5
	movre	%i1,	0x1AE,	%l6
	add	%o2,	%o0,	%g7
	popc	%i6,	%g3
	stw	%g6,	[%l7 + 0x54]
	mulx	%l3,	0x0DFA,	%i7
	edge16n	%l2,	%i0,	%o4
	movgu	%xcc,	%i5,	%g4
	edge16	%o3,	%g2,	%l1
	st	%f5,	[%l7 + 0x48]
	fmovdcc	%icc,	%f5,	%f17
	addcc	%o1,	0x0334,	%o7
	ldd	[%l7 + 0x18],	%f6
	sdivx	%l5,	0x0346,	%i4
	sethi	0x0E0F,	%o5
	xnor	%l0,	%i3,	%i2
	st	%f12,	[%l7 + 0x34]
	srax	%o6,	%g1,	%g5
	fmovrdlez	%l4,	%f18,	%f18
	movrgez	%l6,	0x089,	%o2
	ldub	[%l7 + 0x0D],	%o0
	movn	%icc,	%g7,	%i1
	edge32l	%i6,	%g3,	%l3
	edge16ln	%g6,	%l2,	%i7
	restore %i0, %i5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o3,	%g2
	ldd	[%l7 + 0x38],	%f10
	umul	%o4,	%l1,	%o1
	sethi	0x0931,	%o7
	array8	%i4,	%o5,	%l5
	umul	%l0,	%i2,	%o6
	movvc	%icc,	%i3,	%g1
	movcc	%xcc,	%l4,	%g5
	edge16ln	%o2,	%o0,	%l6
	fmovscc	%xcc,	%f22,	%f22
	lduw	[%l7 + 0x34],	%i1
	sdivcc	%i6,	0x109F,	%g7
	movrgez	%l3,	0x097,	%g6
	fandnot2s	%f10,	%f4,	%f17
	movge	%xcc,	%g3,	%i7
	fandnot2	%f16,	%f12,	%f10
	orcc	%l2,	%i5,	%i0
	addccc	%g4,	%g2,	%o3
	movgu	%icc,	%l1,	%o1
	orn	%o4,	0x1C9F,	%i4
	movgu	%icc,	%o5,	%l5
	ldsb	[%l7 + 0x44],	%l0
	movvc	%xcc,	%i2,	%o7
	movle	%xcc,	%i3,	%o6
	xor	%l4,	0x0DC4,	%g5
	movcs	%xcc,	%o2,	%o0
	edge32n	%l6,	%g1,	%i1
	edge8n	%g7,	%i6,	%g6
	ld	[%l7 + 0x10],	%f8
	subccc	%l3,	%i7,	%l2
	addcc	%i5,	%i0,	%g4
	fmovdvs	%icc,	%f23,	%f12
	edge16ln	%g3,	%o3,	%g2
	st	%f14,	[%l7 + 0x24]
	addcc	%o1,	%l1,	%i4
	sethi	0x1380,	%o5
	fmuld8sux16	%f29,	%f19,	%f6
	fmovscc	%xcc,	%f21,	%f2
	fxnor	%f28,	%f24,	%f8
	edge16ln	%l5,	%l0,	%i2
	srax	%o4,	0x0B,	%o7
	movpos	%xcc,	%i3,	%l4
	movn	%icc,	%o6,	%o2
	edge8n	%o0,	%l6,	%g5
	srlx	%g1,	0x10,	%i1
	fmovdl	%icc,	%f15,	%f7
	lduh	[%l7 + 0x0A],	%i6
	edge16ln	%g6,	%l3,	%g7
	edge8ln	%i7,	%l2,	%i0
	ld	[%l7 + 0x0C],	%f27
	xorcc	%i5,	%g4,	%g3
	st	%f19,	[%l7 + 0x5C]
	mova	%icc,	%g2,	%o1
	movg	%icc,	%o3,	%i4
	fpadd32s	%f11,	%f12,	%f23
	movneg	%icc,	%o5,	%l5
	fandnot2	%f8,	%f2,	%f18
	sllx	%l0,	0x04,	%l1
	move	%icc,	%o4,	%i2
	popc	0x0B9B,	%o7
	fcmpes	%fcc3,	%f0,	%f8
	fmovdge	%icc,	%f4,	%f5
	movrlz	%l4,	%i3,	%o6
	movvs	%icc,	%o2,	%l6
	ldsh	[%l7 + 0x26],	%g5
	movne	%xcc,	%o0,	%g1
	edge16	%i6,	%g6,	%i1
	fmul8sux16	%f18,	%f26,	%f26
	edge32n	%g7,	%l3,	%i7
	ldd	[%l7 + 0x40],	%i0
	xor	%i5,	0x0C2A,	%g4
	movvs	%xcc,	%g3,	%l2
	edge16ln	%o1,	%g2,	%i4
	orn	%o3,	0x0516,	%l5
	move	%xcc,	%l0,	%o5
	add	%o4,	%i2,	%o7
	movge	%icc,	%l1,	%l4
	addcc	%i3,	%o6,	%l6
	udiv	%o2,	0x1A46,	%g5
	alignaddrl	%g1,	%i6,	%o0
	edge32n	%g6,	%g7,	%i1
	nop
	set	0x74, %l5
	lduh	[%l7 + %l5],	%l3
	movvs	%xcc,	%i7,	%i5
	edge8l	%g4,	%i0,	%g3
	movre	%o1,	0x125,	%g2
	udiv	%i4,	0x117A,	%o3
	movne	%xcc,	%l5,	%l0
	nop
	set	0x78, %l1
	stw	%o5,	[%l7 + %l1]
	edge16ln	%l2,	%o4,	%i2
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	udivx	%i3,	0x1100,	%l1
	alignaddr	%l6,	%o2,	%g5
	xor	%g1,	%i6,	%o0
	movrgz	%g6,	%o6,	%i1
	ldsw	[%l7 + 0x48],	%l3
	sdivx	%g7,	0x1D61,	%i7
	addccc	%i5,	%i0,	%g3
	movvs	%icc,	%o1,	%g4
	movvc	%icc,	%i4,	%g2
	movre	%l5,	%l0,	%o5
	ldsb	[%l7 + 0x49],	%o3
	array8	%o4,	%i2,	%o7
	edge16l	%l2,	%i3,	%l1
	fmovsgu	%icc,	%f0,	%f2
	edge8n	%l6,	%o2,	%g5
	array8	%g1,	%l4,	%i6
	fmovse	%xcc,	%f28,	%f10
	edge16l	%o0,	%g6,	%o6
	andn	%i1,	0x1FDC,	%l3
	xnorcc	%i7,	0x1945,	%i5
	fmovsa	%xcc,	%f13,	%f14
	sra	%i0,	0x1B,	%g3
	sllx	%g7,	%g4,	%o1
	movvs	%xcc,	%i4,	%g2
	edge32	%l0,	%o5,	%o3
	fmovrse	%o4,	%f4,	%f29
	fpmerge	%f23,	%f3,	%f4
	ldsh	[%l7 + 0x76],	%i2
	fmovdcc	%xcc,	%f18,	%f17
	fmovdpos	%icc,	%f6,	%f12
	ld	[%l7 + 0x10],	%f7
	xnor	%l5,	%o7,	%i3
	movvc	%xcc,	%l1,	%l2
	sethi	0x0ED6,	%o2
	sdivx	%g5,	0x0E04,	%g1
	xnorcc	%l4,	%l6,	%i6
	add	%g6,	0x0DFD,	%o0
	orn	%i1,	%l3,	%o6
	movrgez	%i7,	%i0,	%g3
	udiv	%g7,	0x149F,	%i5
	subccc	%o1,	0x1A29,	%i4
	movrlz	%g4,	%l0,	%g2
	edge8l	%o3,	%o5,	%o4
	movne	%xcc,	%i2,	%l5
	orncc	%o7,	%l1,	%l2
	sra	%o2,	0x1E,	%g5
	subc	%g1,	0x057B,	%i3
	ldub	[%l7 + 0x48],	%l4
	fnegd	%f28,	%f10
	subcc	%l6,	%g6,	%i6
	stw	%o0,	[%l7 + 0x44]
	fmovrdlez	%l3,	%f18,	%f10
	addc	%o6,	%i1,	%i0
	umul	%g3,	0x173A,	%i7
	addcc	%i5,	%o1,	%g7
	srl	%i4,	0x16,	%g4
	array32	%l0,	%o3,	%g2
	fzero	%f16
	fcmped	%fcc3,	%f4,	%f8
	mova	%xcc,	%o4,	%o5
	sdivcc	%l5,	0x1F67,	%i2
	xorcc	%l1,	%l2,	%o2
	move	%icc,	%g5,	%g1
	sth	%o7,	[%l7 + 0x44]
	mulscc	%i3,	0x0811,	%l4
	edge32	%l6,	%i6,	%g6
	lduw	[%l7 + 0x50],	%l3
	stb	%o0,	[%l7 + 0x24]
	edge8n	%i1,	%o6,	%i0
	movre	%i7,	%i5,	%g3
	movrlez	%o1,	0x311,	%g7
	movleu	%xcc,	%g4,	%l0
	movrgez	%i4,	%g2,	%o3
	movgu	%icc,	%o5,	%l5
	fpadd32	%f4,	%f4,	%f4
	fnot1	%f22,	%f16
	array8	%o4,	%l1,	%i2
	movle	%icc,	%o2,	%g5
	udivcc	%l2,	0x05F8,	%o7
	fcmpne32	%f4,	%f14,	%g1
	edge8l	%i3,	%l4,	%i6
	movre	%g6,	0x054,	%l3
	ldub	[%l7 + 0x61],	%l6
	sir	0x0B95
	movrgez	%i1,	0x0CB,	%o6
	srlx	%o0,	0x0F,	%i0
	ldd	[%l7 + 0x70],	%i4
	std	%f20,	[%l7 + 0x70]
	sra	%i7,	0x14,	%g3
	fmovsn	%icc,	%f10,	%f21
	movrgez	%g7,	0x0DD,	%g4
	stb	%l0,	[%l7 + 0x37]
	fpadd16s	%f7,	%f1,	%f4
	fand	%f24,	%f6,	%f0
	xor	%o1,	0x1BD0,	%g2
	movn	%icc,	%i4,	%o3
	movre	%l5,	%o5,	%o4
	movrne	%l1,	%o2,	%i2
	xor	%g5,	0x0975,	%l2
	movvs	%icc,	%o7,	%g1
	mulx	%i3,	0x1953,	%l4
	xnor	%g6,	%l3,	%i6
	fnot2	%f28,	%f18
	fmovscs	%icc,	%f23,	%f23
	edge32l	%l6,	%i1,	%o6
	edge16l	%i0,	%o0,	%i5
	sra	%g3,	0x11,	%g7
	xorcc	%g4,	0x035D,	%l0
	movpos	%icc,	%o1,	%i7
	sdivx	%g2,	0x0474,	%o3
	andncc	%l5,	%i4,	%o4
	save %o5, 0x17BE, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l1,	%i2,	%l2
	edge32n	%g5,	%o7,	%g1
	mova	%icc,	%i3,	%g6
	fmovdne	%icc,	%f26,	%f7
	and	%l4,	%l3,	%i6
	udivx	%l6,	0x0D41,	%i1
	movge	%icc,	%o6,	%i0
	movcc	%icc,	%i5,	%o0
	xnor	%g3,	%g7,	%g4
	umulcc	%o1,	0x1D4C,	%l0
	popc	0x1401,	%g2
	subccc	%i7,	0x0207,	%o3
	edge16ln	%l5,	%i4,	%o5
	edge32n	%o2,	%l1,	%o4
	orncc	%l2,	%g5,	%o7
	fmul8x16al	%f22,	%f4,	%f16
	fpadd32s	%f13,	%f13,	%f16
	andncc	%i2,	%g1,	%i3
	fpmerge	%f15,	%f12,	%f18
	fsrc2s	%f25,	%f29
	ld	[%l7 + 0x34],	%f3
	restore %l4, 0x0D2F, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i6,	%g6,	%l6
	ldd	[%l7 + 0x20],	%f26
	movneg	%xcc,	%i1,	%o6
	fmovdgu	%icc,	%f29,	%f26
	sdivcc	%i0,	0x0FF9,	%o0
	movrne	%i5,	%g3,	%g4
	udivx	%g7,	0x0CDD,	%l0
	movrgez	%g2,	0x32B,	%o1
	fpsub32s	%f6,	%f6,	%f21
	fmovrdlez	%o3,	%f10,	%f4
	subccc	%i7,	0x0191,	%i4
	edge16	%l5,	%o2,	%l1
	movvc	%icc,	%o4,	%o5
	sub	%l2,	0x123E,	%o7
	movl	%xcc,	%g5,	%g1
	umul	%i3,	0x03E3,	%i2
	movl	%icc,	%l4,	%l3
	umulcc	%g6,	0x1D92,	%l6
	xorcc	%i6,	%i1,	%i0
	ldx	[%l7 + 0x50],	%o6
	ldd	[%l7 + 0x18],	%f4
	movrlez	%i5,	0x2B7,	%g3
	sra	%o0,	0x04,	%g4
	edge16ln	%l0,	%g2,	%g7
	orcc	%o3,	%i7,	%o1
	movre	%l5,	0x1DF,	%o2
	andn	%l1,	0x076C,	%o4
	fmovrdgez	%o5,	%f28,	%f24
	ldd	[%l7 + 0x18],	%f20
	umulcc	%i4,	0x0A41,	%o7
	st	%f29,	[%l7 + 0x68]
	sethi	0x0FFC,	%l2
	udivcc	%g1,	0x0314,	%g5
	ldd	[%l7 + 0x08],	%f26
	fornot1	%f24,	%f4,	%f10
	fandnot1	%f8,	%f0,	%f0
	movre	%i2,	%i3,	%l3
	mova	%icc,	%l4,	%l6
	fmovscc	%icc,	%f23,	%f10
	xor	%g6,	0x1FD1,	%i6
	edge8n	%i0,	%i1,	%i5
	fsrc2s	%f20,	%f21
	sdivx	%g3,	0x1301,	%o6
	movpos	%icc,	%o0,	%g4
	movgu	%icc,	%l0,	%g2
	addccc	%g7,	0x1803,	%i7
	and	%o1,	0x09E0,	%l5
	fmovd	%f20,	%f12
	movleu	%xcc,	%o3,	%l1
	subccc	%o4,	%o5,	%i4
	andcc	%o2,	0x0BE0,	%l2
	st	%f1,	[%l7 + 0x48]
	edge32l	%g1,	%o7,	%g5
	movvs	%icc,	%i3,	%l3
	or	%i2,	0x132B,	%l6
	xnor	%g6,	%l4,	%i0
	udivcc	%i6,	0x0285,	%i1
	addccc	%g3,	0x093E,	%i5
	udivx	%o0,	0x0AE3,	%o6
	array16	%l0,	%g2,	%g4
	array8	%g7,	%i7,	%l5
	ld	[%l7 + 0x3C],	%f8
	fmovsg	%icc,	%f6,	%f16
	movl	%icc,	%o1,	%o3
	mova	%xcc,	%o4,	%o5
	sdivx	%l1,	0x15EC,	%i4
	fands	%f9,	%f16,	%f30
	sdiv	%o2,	0x0F22,	%l2
	pdist	%f18,	%f14,	%f26
	array32	%g1,	%g5,	%o7
	edge8	%i3,	%l3,	%l6
	subcc	%i2,	%g6,	%l4
	ldx	[%l7 + 0x18],	%i0
	sll	%i1,	%i6,	%g3
	sdivx	%o0,	0x0A5F,	%i5
	xnor	%l0,	%g2,	%o6
	stw	%g4,	[%l7 + 0x64]
	movgu	%xcc,	%g7,	%i7
	fmovsneg	%xcc,	%f13,	%f16
	srax	%l5,	0x0D,	%o1
	fmovsleu	%xcc,	%f19,	%f12
	fmuld8sux16	%f18,	%f5,	%f18
	fmovdcs	%icc,	%f18,	%f14
	st	%f5,	[%l7 + 0x40]
	sdivx	%o4,	0x1E07,	%o3
	addccc	%o5,	0x16FB,	%i4
	movle	%icc,	%o2,	%l2
	subcc	%l1,	0x0B9B,	%g5
	ldd	[%l7 + 0x08],	%o6
	smul	%g1,	%l3,	%l6
	fsrc1s	%f10,	%f18
	orcc	%i2,	%g6,	%l4
	save %i0, 0x10FF, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i3,	0x1EEE,	%i6
	movrgez	%g3,	%o0,	%l0
	faligndata	%f20,	%f20,	%f16
	edge16	%i5,	%g2,	%o6
	fnegs	%f4,	%f3
	alignaddr	%g7,	%i7,	%l5
	ld	[%l7 + 0x6C],	%f15
	subcc	%o1,	0x1E8E,	%o4
	srlx	%o3,	%g4,	%i4
	fmovsgu	%xcc,	%f27,	%f18
	orncc	%o5,	%o2,	%l1
	movrgz	%l2,	%g5,	%o7
	alignaddr	%l3,	%l6,	%g1
	edge16ln	%g6,	%l4,	%i0
	add	%i2,	%i3,	%i1
	ldx	[%l7 + 0x48],	%i6
	addcc	%o0,	0x053A,	%g3
	fmovda	%icc,	%f31,	%f2
	edge16n	%i5,	%g2,	%o6
	umulcc	%l0,	%g7,	%i7
	lduw	[%l7 + 0x28],	%o1
	udiv	%o4,	0x09B5,	%l5
	movg	%icc,	%o3,	%g4
	fmovrsgez	%i4,	%f23,	%f10
	sethi	0x1E86,	%o2
	subcc	%l1,	0x02E0,	%o5
	edge8l	%g5,	%l2,	%l3
	andcc	%o7,	%l6,	%g6
	sub	%g1,	%l4,	%i0
	fpadd32s	%f22,	%f21,	%f10
	array32	%i3,	%i2,	%i6
	xnorcc	%o0,	0x0303,	%i1
	movcs	%icc,	%g3,	%i5
	fmul8x16al	%f11,	%f31,	%f22
	movcs	%xcc,	%g2,	%o6
	ldx	[%l7 + 0x70],	%g7
	fcmps	%fcc3,	%f4,	%f22
	edge16	%l0,	%o1,	%i7
	movn	%icc,	%o4,	%o3
	subccc	%g4,	%l5,	%o2
	movn	%xcc,	%l1,	%o5
	ldx	[%l7 + 0x50],	%i4
	fone	%f14
	movg	%xcc,	%g5,	%l3
	move	%icc,	%o7,	%l2
	fmovdvs	%xcc,	%f3,	%f23
	fandnot2s	%f15,	%f22,	%f20
	sra	%l6,	%g1,	%l4
	array32	%g6,	%i0,	%i2
	edge8n	%i6,	%o0,	%i1
	movge	%xcc,	%g3,	%i5
	fcmps	%fcc1,	%f4,	%f22
	xorcc	%g2,	0x1E0D,	%o6
	movl	%xcc,	%g7,	%l0
	array32	%o1,	%i7,	%i3
	popc	0x001C,	%o3
	sll	%g4,	0x07,	%l5
	andncc	%o4,	%l1,	%o5
	st	%f10,	[%l7 + 0x14]
	movrlez	%i4,	0x05F,	%g5
	movrne	%l3,	0x0F5,	%o7
	addcc	%o2,	%l6,	%l2
	array32	%l4,	%g6,	%i0
	ldsw	[%l7 + 0x1C],	%g1
	fmovsa	%xcc,	%f0,	%f0
	edge16	%i6,	%o0,	%i2
	stb	%g3,	[%l7 + 0x46]
	edge16l	%i1,	%i5,	%g2
	sll	%o6,	0x00,	%g7
	array16	%l0,	%o1,	%i3
	movl	%xcc,	%i7,	%o3
	lduw	[%l7 + 0x48],	%g4
	xnor	%l5,	%o4,	%o5
	lduw	[%l7 + 0x78],	%i4
	sth	%l1,	[%l7 + 0x18]
	xor	%l3,	%g5,	%o2
	xor	%l6,	0x0B14,	%o7
	array8	%l4,	%l2,	%g6
	movvs	%xcc,	%i0,	%g1
	sdivx	%o0,	0x1D4B,	%i2
	sllx	%g3,	0x19,	%i1
	fsrc1s	%f1,	%f25
	lduh	[%l7 + 0x4C],	%i5
	fmovdpos	%icc,	%f6,	%f12
	sllx	%i6,	0x01,	%o6
	subc	%g2,	%g7,	%o1
	stb	%l0,	[%l7 + 0x33]
	movleu	%icc,	%i7,	%i3
	popc	%o3,	%g4
	alignaddr	%o4,	%l5,	%o5
	movcs	%icc,	%l1,	%l3
	andcc	%i4,	%g5,	%o2
	movrgz	%l6,	%o7,	%l4
	edge8l	%g6,	%l2,	%g1
	edge16n	%i0,	%i2,	%g3
	edge8n	%i1,	%i5,	%o0
	fnand	%f8,	%f22,	%f24
	sdiv	%o6,	0x1F76,	%i6
	fmovdl	%icc,	%f2,	%f25
	fcmps	%fcc2,	%f13,	%f22
	movcc	%icc,	%g7,	%o1
	sdivx	%g2,	0x1191,	%l0
	lduw	[%l7 + 0x30],	%i3
	ldsb	[%l7 + 0x3E],	%o3
	movpos	%icc,	%g4,	%i7
	ldub	[%l7 + 0x0C],	%o4
	udivcc	%l5,	0x0BD7,	%o5
	fornot2s	%f7,	%f19,	%f1
	alignaddr	%l3,	%l1,	%g5
	fpmerge	%f5,	%f28,	%f2
	movre	%i4,	%l6,	%o2
	edge32n	%l4,	%o7,	%l2
	smul	%g1,	0x078B,	%g6
	orncc	%i0,	0x1511,	%g3
	andcc	%i2,	%i1,	%i5
	edge8l	%o0,	%o6,	%g7
	sdivx	%o1,	0x1E60,	%g2
	movl	%xcc,	%i6,	%l0
	stx	%o3,	[%l7 + 0x40]
	fpackfix	%f24,	%f27
	for	%f24,	%f14,	%f10
	sdiv	%g4,	0x0555,	%i3
	movrgez	%o4,	%l5,	%o5
	sethi	0x1DB0,	%i7
	movre	%l3,	0x3E5,	%g5
	udivx	%i4,	0x0C87,	%l6
	edge8n	%l1,	%l4,	%o2
	fmovsleu	%icc,	%f11,	%f29
	addc	%o7,	0x0C3D,	%l2
	addcc	%g6,	0x0B7A,	%i0
	addc	%g1,	0x146B,	%i2
	umul	%i1,	%i5,	%g3
	sdiv	%o0,	0x129F,	%g7
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%o6
	movrlz	%o1,	%i6,	%l0
	movcs	%xcc,	%o3,	%g4
	add	%i3,	0x05C9,	%o4
	array8	%g2,	%l5,	%o5
	nop
	set	0x34, %o3
	ldsw	[%l7 + %o3],	%i7
	nop
	set	0x10, %o4
	stw	%g5,	[%l7 + %o4]
	andcc	%l3,	%l6,	%i4
	sll	%l1,	%l4,	%o2
	andcc	%l2,	0x0794,	%g6
	lduh	[%l7 + 0x22],	%i0
	st	%f22,	[%l7 + 0x18]
	std	%f12,	[%l7 + 0x60]
	movg	%xcc,	%g1,	%o7
	edge16ln	%i2,	%i5,	%g3
	stw	%i1,	[%l7 + 0x28]
	edge32n	%g7,	%o0,	%o1
	movg	%icc,	%o6,	%l0
	fmul8x16	%f1,	%f2,	%f0
	movcs	%icc,	%i6,	%o3
	addcc	%i3,	0x144B,	%g4
	stw	%o4,	[%l7 + 0x30]
	movl	%xcc,	%g2,	%l5
	fzeros	%f9
	fmovscs	%icc,	%f22,	%f19
	movvc	%xcc,	%i7,	%g5
	fone	%f30
	ldd	[%l7 + 0x20],	%o4
	udivx	%l6,	0x141A,	%i4
	fandnot1	%f12,	%f22,	%f6
	movvc	%icc,	%l3,	%l1
	sth	%l4,	[%l7 + 0x18]
	sdivcc	%o2,	0x1F05,	%l2
	or	%i0,	0x0FD5,	%g1
	std	%f24,	[%l7 + 0x50]
	smulcc	%g6,	%o7,	%i2
	ldx	[%l7 + 0x60],	%g3
	fxnors	%f13,	%f11,	%f4
	addcc	%i1,	%g7,	%i5
	orcc	%o0,	0x13B7,	%o1
	subcc	%l0,	0x1D61,	%i6
	array16	%o6,	%o3,	%g4
	addccc	%o4,	0x0C5E,	%i3
	orcc	%l5,	%g2,	%i7
	nop
	set	0x08, %g4
	ldx	[%l7 + %g4],	%g5
	fors	%f16,	%f13,	%f0
	movvc	%icc,	%l6,	%i4
	movne	%icc,	%o5,	%l3
	fpsub32	%f8,	%f8,	%f8
	edge16n	%l4,	%l1,	%l2
	movrlez	%i0,	0x3F4,	%g1
	sdivcc	%o2,	0x01A2,	%o7
	fmul8sux16	%f20,	%f10,	%f0
	srax	%g6,	%g3,	%i2
	subc	%i1,	%i5,	%o0
	sdivcc	%g7,	0x1DEF,	%o1
	movne	%xcc,	%l0,	%o6
	faligndata	%f20,	%f8,	%f14
	fsrc2s	%f0,	%f16
	movg	%xcc,	%o3,	%i6
	movn	%icc,	%o4,	%i3
	addcc	%l5,	%g2,	%i7
	array8	%g4,	%l6,	%g5
	sllx	%i4,	0x07,	%o5
	movge	%icc,	%l3,	%l4
	movrgz	%l1,	0x2CF,	%l2
	fmovsgu	%icc,	%f9,	%f20
	movrgez	%g1,	0x284,	%i0
	edge16ln	%o7,	%o2,	%g6
	ldsb	[%l7 + 0x48],	%i2
	sth	%i1,	[%l7 + 0x2A]
	fnands	%f2,	%f25,	%f9
	siam	0x2
	smulcc	%i5,	%g3,	%g7
	lduh	[%l7 + 0x40],	%o1
	smul	%l0,	0x088C,	%o6
	fmovrse	%o3,	%f0,	%f31
	movle	%xcc,	%o0,	%o4
	alignaddr	%i3,	%l5,	%g2
	movrne	%i7,	0x2AB,	%g4
	smul	%i6,	%l6,	%i4
	sth	%g5,	[%l7 + 0x24]
	movvs	%xcc,	%l3,	%l4
	fpadd16	%f22,	%f22,	%f8
	subccc	%l1,	0x1755,	%l2
	smulcc	%g1,	%o5,	%o7
	add	%i0,	%o2,	%i2
	fmovsvs	%xcc,	%f25,	%f18
	sllx	%g6,	0x07,	%i1
	ldd	[%l7 + 0x48],	%f28
	udivcc	%g3,	0x0E5E,	%i5
	mova	%icc,	%o1,	%g7
	addccc	%o6,	0x0E11,	%l0
	mulx	%o0,	%o4,	%o3
	umul	%i3,	%g2,	%l5
	ldx	[%l7 + 0x68],	%g4
	udiv	%i6,	0x1084,	%l6
	sllx	%i7,	0x19,	%g5
	movne	%xcc,	%l3,	%l4
	sdiv	%l1,	0x14AB,	%l2
	movn	%icc,	%g1,	%o5
	addcc	%i4,	%o7,	%o2
	fmovrslz	%i2,	%f4,	%f1
	save %g6, 0x08B9, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i0,	0x04BE,	%g3
	std	%f24,	[%l7 + 0x08]
	ldsw	[%l7 + 0x7C],	%o1
	orn	%i5,	0x1C8E,	%g7
	srl	%o6,	0x1F,	%l0
	fones	%f9
	sethi	0x1E3C,	%o4
	fnor	%f14,	%f10,	%f30
	movg	%xcc,	%o0,	%i3
	movne	%xcc,	%o3,	%g2
	ldub	[%l7 + 0x22],	%l5
	movcs	%xcc,	%i6,	%g4
	edge32ln	%i7,	%l6,	%l3
	fone	%f10
	ld	[%l7 + 0x34],	%f16
	edge8l	%g5,	%l4,	%l2
	movleu	%icc,	%g1,	%o5
	array8	%i4,	%o7,	%l1
	subcc	%i2,	%g6,	%o2
	move	%icc,	%i0,	%i1
	and	%o1,	0x0ED6,	%g3
	array16	%g7,	%o6,	%l0
	edge32	%i5,	%o0,	%o4
	fmovrsne	%o3,	%f11,	%f29
	add	%i3,	0x1D31,	%l5
	lduh	[%l7 + 0x12],	%i6
	umul	%g2,	0x137A,	%g4
	array32	%i7,	%l3,	%l6
	andcc	%l4,	%g5,	%g1
	fmovse	%xcc,	%f20,	%f23
	edge8	%l2,	%o5,	%i4
	xnor	%l1,	0x0ECF,	%o7
	smul	%g6,	0x05B1,	%i2
	ldsw	[%l7 + 0x10],	%i0
	fmovsleu	%xcc,	%f21,	%f31
	fnot2	%f16,	%f30
	fornot2	%f16,	%f4,	%f2
	nop
	set	0x6A, %l2
	ldub	[%l7 + %l2],	%i1
	fmovrdne	%o2,	%f18,	%f0
	umulcc	%o1,	0x0D8B,	%g7
	ldd	[%l7 + 0x18],	%g2
	st	%f13,	[%l7 + 0x38]
	movrlez	%l0,	0x221,	%i5
	fsrc2	%f20,	%f30
	edge32n	%o6,	%o4,	%o0
	edge32ln	%i3,	%l5,	%i6
	subcc	%o3,	0x06E3,	%g2
	udivx	%i7,	0x1A59,	%l3
	smulcc	%g4,	%l6,	%l4
	fpsub16	%f6,	%f4,	%f6
	xorcc	%g1,	0x1522,	%g5
	fmovrdgz	%l2,	%f2,	%f30
	edge16ln	%i4,	%o5,	%l1
	xnorcc	%o7,	%g6,	%i2
	movrlz	%i1,	0x22B,	%i0
	mulscc	%o2,	%o1,	%g7
	stw	%l0,	[%l7 + 0x20]
	mulx	%i5,	0x122B,	%g3
	fandnot2s	%f27,	%f3,	%f20
	addcc	%o6,	%o4,	%i3
	sth	%l5,	[%l7 + 0x50]
	addccc	%i6,	%o3,	%o0
	fmovdne	%icc,	%f28,	%f25
	movrne	%g2,	%i7,	%l3
	xorcc	%g4,	0x1912,	%l4
	umulcc	%l6,	0x0F66,	%g5
	fandnot2	%f20,	%f28,	%f26
	ldx	[%l7 + 0x68],	%g1
	ldsh	[%l7 + 0x14],	%l2
	popc	%i4,	%o5
	fcmpne32	%f24,	%f30,	%l1
	movrlz	%o7,	%i2,	%g6
	movgu	%xcc,	%i0,	%o2
	fmovsvs	%icc,	%f28,	%f18
	mulx	%o1,	%i1,	%l0
	and	%i5,	0x1403,	%g7
	fandnot2s	%f24,	%f25,	%f12
	fpsub32	%f24,	%f12,	%f30
	stx	%o6,	[%l7 + 0x10]
	edge32	%o4,	%i3,	%g3
	ldub	[%l7 + 0x5D],	%i6
	stx	%o3,	[%l7 + 0x78]
	movvs	%xcc,	%l5,	%g2
	st	%f29,	[%l7 + 0x28]
	fmovdg	%icc,	%f31,	%f31
	fnor	%f26,	%f26,	%f24
	fornot1s	%f20,	%f15,	%f25
	save %o0, 0x0738, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%xcc,	%f14,	%f25
	std	%f22,	[%l7 + 0x28]
	movrgez	%i7,	0x07E,	%l4
	edge8n	%l6,	%g5,	%g4
	fnot2	%f18,	%f12
	movleu	%xcc,	%g1,	%i4
	edge32n	%l2,	%l1,	%o7
	ldsb	[%l7 + 0x79],	%i2
	fmuld8ulx16	%f2,	%f12,	%f10
	nop
	set	0x60, %o5
	stx	%o5,	[%l7 + %o5]
	sub	%i0,	%o2,	%g6
	fmovrsgz	%o1,	%f23,	%f25
	array16	%i1,	%l0,	%g7
	fones	%f22
	ldx	[%l7 + 0x20],	%i5
	ldd	[%l7 + 0x30],	%o6
	ld	[%l7 + 0x54],	%f8
	sdivx	%i3,	0x0827,	%o4
	edge32n	%g3,	%i6,	%o3
	mulx	%l5,	0x1C63,	%o0
	array32	%l3,	%g2,	%i7
	fmovdgu	%xcc,	%f28,	%f31
	stw	%l6,	[%l7 + 0x58]
	subccc	%g5,	%g4,	%g1
	mova	%xcc,	%i4,	%l4
	save %l1, 0x1F85, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f4,	%f26,	%l2
	ldd	[%l7 + 0x48],	%o4
	lduh	[%l7 + 0x36],	%i2
	movne	%xcc,	%i0,	%g6
	fabsd	%f26,	%f16
	andcc	%o2,	0x0D1B,	%i1
	ldd	[%l7 + 0x60],	%o0
	or	%l0,	0x09BD,	%i5
	edge32	%g7,	%i3,	%o6
	ld	[%l7 + 0x28],	%f22
	andcc	%g3,	%o4,	%i6
	lduh	[%l7 + 0x50],	%l5
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	fpsub16	%f28,	%f24,	%f4
	smul	%g2,	0x1EC3,	%o0
	movg	%xcc,	%i7,	%l6
	movneg	%icc,	%g4,	%g1
	fsrc2	%f6,	%f0
	mulx	%i4,	0x1ACC,	%g5
	stb	%l1,	[%l7 + 0x58]
	fmul8x16au	%f18,	%f21,	%f18
	movcs	%icc,	%l4,	%o7
	ldd	[%l7 + 0x20],	%f22
	movre	%o5,	%i2,	%i0
	sll	%l2,	0x19,	%o2
	xnor	%g6,	%i1,	%l0
	fornot1	%f4,	%f28,	%f18
	fpmerge	%f22,	%f30,	%f26
	edge16l	%i5,	%o1,	%g7
	ldub	[%l7 + 0x75],	%i3
	fmovdcs	%xcc,	%f21,	%f24
	orn	%g3,	%o6,	%i6
	fmovrdgz	%o4,	%f22,	%f2
	sra	%l5,	%l3,	%o3
	array32	%g2,	%o0,	%l6
	fmovsneg	%icc,	%f1,	%f7
	array8	%g4,	%g1,	%i4
	array16	%i7,	%l1,	%l4
	udiv	%g5,	0x0315,	%o7
	xnorcc	%i2,	0x1D1B,	%i0
	subcc	%o5,	0x121E,	%l2
	udivcc	%o2,	0x0B38,	%i1
	edge8ln	%l0,	%i5,	%g6
	fnot1	%f8,	%f24
	movl	%icc,	%o1,	%g7
	fornot2s	%f7,	%f30,	%f0
	movrne	%g3,	0x070,	%o6
	movne	%xcc,	%i3,	%i6
	movrne	%l5,	%l3,	%o4
	ldx	[%l7 + 0x28],	%g2
	srax	%o3,	0x0D,	%o0
	mulx	%l6,	0x066A,	%g1
	movg	%xcc,	%i4,	%i7
	movne	%icc,	%g4,	%l4
	fmovdge	%xcc,	%f4,	%f19
	xnor	%g5,	%o7,	%i2
	movne	%xcc,	%l1,	%o5
	fand	%f8,	%f18,	%f22
	fnor	%f0,	%f30,	%f20
	orncc	%i0,	%l2,	%i1
	edge8ln	%l0,	%i5,	%o2
	stb	%g6,	[%l7 + 0x24]
	lduw	[%l7 + 0x18],	%o1
	fcmpne32	%f16,	%f22,	%g3
	udivcc	%o6,	0x127A,	%g7
	ldsh	[%l7 + 0x16],	%i3
	xnor	%i6,	%l3,	%l5
	sth	%o4,	[%l7 + 0x60]
	udivcc	%o3,	0x16EF,	%g2
	orn	%l6,	0x0E0C,	%g1
	edge8l	%o0,	%i4,	%i7
	fmovsvs	%xcc,	%f0,	%f18
	popc	0x0FF9,	%g4
	sdivx	%l4,	0x15BF,	%o7
	alignaddrl	%g5,	%l1,	%i2
	andn	%o5,	0x160F,	%l2
	smulcc	%i1,	%l0,	%i5
	alignaddr	%i0,	%o2,	%g6
	xnor	%g3,	0x0B06,	%o6
	sdiv	%o1,	0x054C,	%g7
	movneg	%xcc,	%i6,	%l3
	lduw	[%l7 + 0x1C],	%i3
	move	%icc,	%o4,	%o3
	srlx	%g2,	%l5,	%l6
	andn	%g1,	%i4,	%i7
	srlx	%g4,	%l4,	%o0
	fmul8sux16	%f10,	%f14,	%f0
	fands	%f5,	%f19,	%f21
	fmovdn	%xcc,	%f7,	%f0
	movgu	%icc,	%o7,	%g5
	sdivcc	%l1,	0x0323,	%i2
	and	%o5,	%l2,	%i1
	fmovdge	%xcc,	%f5,	%f21
	array16	%i5,	%l0,	%i0
	fmovsa	%xcc,	%f22,	%f13
	movrlez	%o2,	0x05C,	%g3
	edge32	%g6,	%o1,	%g7
	sdiv	%o6,	0x1595,	%l3
	ldub	[%l7 + 0x68],	%i3
	move	%xcc,	%i6,	%o4
	fmovsgu	%xcc,	%f29,	%f3
	movgu	%icc,	%o3,	%g2
	movgu	%xcc,	%l5,	%g1
	fandnot1	%f6,	%f0,	%f4
	edge16l	%l6,	%i7,	%i4
	fexpand	%f16,	%f2
	srlx	%l4,	%o0,	%g4
	fcmpne32	%f26,	%f30,	%g5
	movle	%icc,	%l1,	%o7
	ld	[%l7 + 0x20],	%f23
	umulcc	%o5,	0x0CF5,	%i2
	umul	%l2,	%i1,	%l0
	movre	%i0,	0x312,	%i5
	fpsub32	%f10,	%f10,	%f20
	and	%o2,	%g3,	%o1
	fmovsvc	%icc,	%f30,	%f0
	ld	[%l7 + 0x10],	%f21
	udivx	%g6,	0x19D2,	%o6
	smul	%g7,	%l3,	%i3
	sethi	0x1EB4,	%o4
	fnot1s	%f22,	%f29
	edge32	%o3,	%g2,	%l5
	addc	%g1,	0x15EA,	%l6
	alignaddr	%i7,	%i6,	%i4
	srax	%o0,	0x1A,	%g4
	or	%g5,	%l1,	%l4
	edge8l	%o7,	%o5,	%i2
	stx	%i1,	[%l7 + 0x68]
	andncc	%l0,	%i0,	%l2
	ldd	[%l7 + 0x28],	%i4
	xorcc	%g3,	%o2,	%g6
	and	%o6,	%g7,	%o1
	sdivx	%i3,	0x062B,	%l3
	udivx	%o3,	0x1198,	%g2
	movpos	%xcc,	%o4,	%l5
	orcc	%l6,	%i7,	%i6
	xnorcc	%i4,	0x19A1,	%o0
	stb	%g4,	[%l7 + 0x31]
	sethi	0x0B11,	%g5
	xnorcc	%l1,	%l4,	%g1
	sdiv	%o5,	0x0295,	%i2
	movge	%icc,	%i1,	%o7
	srlx	%l0,	0x02,	%l2
	edge32	%i5,	%i0,	%o2
	fmovscs	%xcc,	%f7,	%f11
	smul	%g3,	%g6,	%o6
	movleu	%icc,	%o1,	%i3
	ldsh	[%l7 + 0x68],	%g7
	edge8ln	%l3,	%o3,	%g2
	movvs	%xcc,	%o4,	%l6
	orn	%i7,	0x0CED,	%l5
	movleu	%icc,	%i6,	%o0
	fmovrdgez	%g4,	%f14,	%f16
	ldx	[%l7 + 0x38],	%g5
	fpadd16	%f24,	%f8,	%f12
	fmovsle	%icc,	%f20,	%f6
	addccc	%l1,	%l4,	%i4
	fmovdpos	%icc,	%f20,	%f5
	smulcc	%g1,	0x0886,	%i2
	fmovdge	%icc,	%f30,	%f12
	nop
	set	0x5A, %i2
	ldsb	[%l7 + %i2],	%o5
	ldd	[%l7 + 0x58],	%f8
	movneg	%xcc,	%o7,	%i1
	edge32	%l0,	%i5,	%i0
	ldsw	[%l7 + 0x30],	%o2
	alignaddr	%l2,	%g3,	%o6
	stw	%g6,	[%l7 + 0x3C]
	lduw	[%l7 + 0x7C],	%o1
	fmovsne	%icc,	%f4,	%f18
	orcc	%i3,	0x17FF,	%l3
	xnor	%o3,	0x0119,	%g7
	orcc	%g2,	0x1C95,	%l6
	fmovrsgz	%i7,	%f19,	%f13
	edge16l	%o4,	%i6,	%o0
	std	%f28,	[%l7 + 0x78]
	fors	%f26,	%f10,	%f22
	std	%f12,	[%l7 + 0x28]
	movge	%icc,	%l5,	%g4
	fmovscs	%icc,	%f19,	%f9
	addc	%l1,	%l4,	%i4
	fornot2	%f22,	%f22,	%f6
	fmovdcc	%xcc,	%f27,	%f5
	fmovscc	%icc,	%f11,	%f14
	movleu	%icc,	%g1,	%i2
	movrgez	%o5,	%g5,	%o7
	fornot1s	%f7,	%f3,	%f19
	fones	%f12
	fcmpgt16	%f24,	%f4,	%l0
	udiv	%i5,	0x126A,	%i0
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%i1
	stx	%l2,	[%l7 + 0x68]
	addccc	%g3,	0x10E3,	%o6
	srl	%o2,	%o1,	%g6
	movle	%icc,	%i3,	%o3
	restore %l3, %g2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%i7,	%l6
	movvs	%xcc,	%i6,	%o4
	edge16	%o0,	%g4,	%l5
	movrgz	%l1,	0x304,	%l4
	movleu	%icc,	%g1,	%i2
	edge8	%i4,	%o5,	%g5
	movcs	%icc,	%o7,	%i5
	ldd	[%l7 + 0x48],	%i0
	umul	%l0,	%i1,	%g3
	fcmps	%fcc0,	%f25,	%f4
	udiv	%l2,	0x1CE3,	%o2
	subccc	%o6,	%g6,	%i3
	orn	%o3,	0x1082,	%o1
	udivcc	%l3,	0x05B5,	%g7
	fmovde	%xcc,	%f30,	%f5
	srl	%i7,	%g2,	%i6
	lduw	[%l7 + 0x60],	%l6
	fmuld8sux16	%f18,	%f17,	%f12
	fcmpeq32	%f20,	%f10,	%o0
	array16	%o4,	%g4,	%l1
	movrgez	%l5,	%g1,	%l4
	movg	%icc,	%i2,	%o5
	subcc	%i4,	%o7,	%i5
	movn	%icc,	%g5,	%l0
	sdiv	%i0,	0x00B3,	%i1
	fxnors	%f22,	%f1,	%f2
	fnot2s	%f24,	%f17
	smulcc	%g3,	%l2,	%o2
	edge32l	%g6,	%i3,	%o3
	fsrc1	%f16,	%f4
	fmovs	%f8,	%f16
	edge32ln	%o6,	%l3,	%o1
	udivx	%i7,	0x19CB,	%g2
	movpos	%icc,	%g7,	%i6
	st	%f13,	[%l7 + 0x1C]
	movrgz	%l6,	0x1DA,	%o4
	add	%o0,	%l1,	%g4
	addcc	%l5,	0x0F48,	%g1
	subcc	%l4,	%i2,	%i4
	sdiv	%o7,	0x005F,	%i5
	movle	%xcc,	%g5,	%o5
	edge16l	%i0,	%l0,	%g3
	or	%i1,	%l2,	%o2
	fpmerge	%f23,	%f0,	%f22
	fone	%f24
	edge16	%i3,	%o3,	%g6
	movpos	%xcc,	%l3,	%o6
	edge16	%i7,	%o1,	%g2
	save %i6, 0x1D8C, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%icc,	%f10,	%f11
	popc	0x0A38,	%l6
	fcmpeq16	%f4,	%f12,	%o4
	ldub	[%l7 + 0x77],	%l1
	stx	%o0,	[%l7 + 0x28]
	ldd	[%l7 + 0x78],	%f2
	move	%icc,	%l5,	%g4
	andn	%l4,	0x18BA,	%g1
	sth	%i2,	[%l7 + 0x26]
	edge8n	%o7,	%i5,	%i4
	movne	%icc,	%o5,	%i0
	ldsh	[%l7 + 0x62],	%l0
	fpackfix	%f30,	%f20
	srl	%g3,	0x0F,	%g5
	edge8n	%i1,	%l2,	%i3
	fone	%f26
	alignaddr	%o3,	%o2,	%l3
	alignaddrl	%g6,	%o6,	%o1
	array32	%i7,	%i6,	%g2
	movrlez	%g7,	0x0F5,	%l6
	sdivx	%o4,	0x1E76,	%l1
	fsrc1	%f0,	%f12
	edge8	%l5,	%g4,	%o0
	sub	%g1,	0x1B42,	%i2
	orn	%o7,	0x1F82,	%l4
	xorcc	%i4,	%i5,	%i0
	lduh	[%l7 + 0x78],	%o5
	sll	%l0,	%g3,	%g5
	ldx	[%l7 + 0x68],	%l2
	edge32n	%i3,	%o3,	%o2
	srl	%l3,	0x08,	%i1
	fzero	%f30
	ldx	[%l7 + 0x70],	%g6
	std	%f0,	[%l7 + 0x10]
	fmovdl	%icc,	%f24,	%f1
	movle	%xcc,	%o1,	%i7
	movn	%xcc,	%i6,	%o6
	addc	%g2,	0x1E89,	%l6
	edge16n	%o4,	%g7,	%l5
	fxnor	%f6,	%f0,	%f4
	movrgez	%l1,	0x222,	%o0
	andncc	%g4,	%i2,	%o7
	movvc	%xcc,	%g1,	%l4
	ldx	[%l7 + 0x78],	%i5
	nop
	set	0x30, %i5
	ldx	[%l7 + %i5],	%i4
	fxnors	%f9,	%f15,	%f17
	fmovspos	%xcc,	%f2,	%f23
	fmovdl	%icc,	%f1,	%f10
	udivx	%i0,	0x029A,	%l0
	move	%icc,	%g3,	%o5
	umulcc	%l2,	%g5,	%i3
	fmovscs	%icc,	%f11,	%f4
	popc	%o2,	%l3
	movgu	%icc,	%i1,	%g6
	edge16n	%o1,	%i7,	%o3
	lduw	[%l7 + 0x44],	%o6
	fmovdn	%icc,	%f29,	%f18
	movle	%icc,	%i6,	%g2
	udiv	%l6,	0x0930,	%o4
	addccc	%l5,	%g7,	%o0
	fmovrdgez	%g4,	%f12,	%f16
	edge16	%i2,	%l1,	%o7
	array32	%g1,	%i5,	%i4
	movvc	%xcc,	%l4,	%l0
	fmovdvc	%icc,	%f2,	%f30
	edge16l	%i0,	%g3,	%o5
	nop
	set	0x68, %o1
	stb	%l2,	[%l7 + %o1]
	edge8l	%i3,	%o2,	%l3
	ldsb	[%l7 + 0x51],	%i1
	movrne	%g5,	0x34D,	%o1
	edge16l	%g6,	%i7,	%o6
	edge32ln	%i6,	%o3,	%l6
	sethi	0x13AC,	%g2
	movrgz	%l5,	0x2E3,	%o4
	movneg	%icc,	%g7,	%o0
	fmovdvs	%xcc,	%f23,	%f31
	movvc	%icc,	%i2,	%l1
	xnor	%o7,	%g4,	%i5
	popc	0x01E8,	%g1
	subccc	%l4,	%l0,	%i4
	ldub	[%l7 + 0x5A],	%g3
	xor	%i0,	%o5,	%i3
	srl	%o2,	0x13,	%l2
	edge16l	%l3,	%i1,	%o1
	fmovrdlz	%g6,	%f10,	%f16
	array8	%g5,	%o6,	%i7
	stb	%i6,	[%l7 + 0x2F]
	xnor	%l6,	%g2,	%l5
	movvs	%xcc,	%o3,	%o4
	addc	%o0,	%i2,	%l1
	subccc	%g7,	%o7,	%g4
	movn	%icc,	%i5,	%g1
	fpmerge	%f27,	%f2,	%f30
	movrgez	%l4,	%l0,	%g3
	movg	%xcc,	%i4,	%o5
	ldub	[%l7 + 0x3F],	%i0
	movle	%xcc,	%o2,	%i3
	movne	%xcc,	%l2,	%i1
	movgu	%icc,	%o1,	%g6
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	ldsb	[%l7 + 0x55],	%g5
	alignaddrl	%i7,	%i6,	%g2
	movvs	%xcc,	%l5,	%o3
	fornot2	%f16,	%f14,	%f10
	ld	[%l7 + 0x0C],	%f31
	movne	%icc,	%l6,	%o0
	fmovrsgz	%i2,	%f27,	%f10
	sra	%o4,	0x09,	%g7
	fcmpeq16	%f12,	%f30,	%o7
	edge32l	%l1,	%i5,	%g1
	edge32	%l4,	%g4,	%g3
	mulscc	%l0,	0x0F20,	%i4
	array16	%i0,	%o2,	%i3
	st	%f5,	[%l7 + 0x20]
	sth	%l2,	[%l7 + 0x54]
	movle	%icc,	%i1,	%o5
	fmovdvc	%icc,	%f14,	%f28
	move	%icc,	%o1,	%l3
	movneg	%icc,	%o6,	%g6
	sth	%i7,	[%l7 + 0x12]
	movrlez	%i6,	%g5,	%g2
	fmovdle	%xcc,	%f19,	%f27
	fmovdvs	%icc,	%f30,	%f20
	smulcc	%o3,	%l5,	%l6
	sub	%o0,	%i2,	%o4
	fornot1	%f14,	%f8,	%f4
	sllx	%g7,	0x1A,	%o7
	movcs	%icc,	%i5,	%g1
	sethi	0x1758,	%l4
	movpos	%icc,	%g4,	%g3
	sllx	%l0,	%i4,	%i0
	movneg	%xcc,	%o2,	%l1
	orncc	%i3,	0x0465,	%l2
	movne	%xcc,	%i1,	%o5
	array8	%l3,	%o6,	%g6
	ldd	[%l7 + 0x40],	%f18
	pdist	%f16,	%f14,	%f14
	alignaddr	%i7,	%o1,	%g5
	movrne	%i6,	0x027,	%o3
	srlx	%l5,	0x15,	%l6
	sth	%g2,	[%l7 + 0x70]
	fmuld8sux16	%f17,	%f22,	%f24
	movpos	%icc,	%i2,	%o4
	sth	%g7,	[%l7 + 0x64]
	stw	%o0,	[%l7 + 0x4C]
	fornot1	%f6,	%f8,	%f24
	umul	%o7,	0x1B1D,	%g1
	xor	%l4,	0x1668,	%i5
	ldsw	[%l7 + 0x5C],	%g3
	fcmpgt32	%f0,	%f10,	%g4
	movge	%xcc,	%l0,	%i0
	fpack16	%f22,	%f12
	movre	%i4,	%o2,	%i3
	ldd	[%l7 + 0x28],	%l0
	umulcc	%l2,	%i1,	%l3
	sll	%o5,	0x03,	%o6
	sdivx	%g6,	0x0D07,	%o1
	movre	%g5,	%i6,	%o3
	edge8l	%i7,	%l6,	%l5
	andn	%g2,	%i2,	%g7
	edge8n	%o4,	%o7,	%g1
	fnot2s	%f17,	%f30
	movle	%xcc,	%l4,	%i5
	movg	%xcc,	%g3,	%o0
	edge8ln	%l0,	%g4,	%i0
	fcmpne32	%f14,	%f4,	%i4
	andcc	%o2,	%l1,	%l2
	andcc	%i3,	0x12C3,	%i1
	movrne	%o5,	%o6,	%l3
	andncc	%o1,	%g5,	%i6
	xnor	%g6,	0x0711,	%i7
	edge8ln	%o3,	%l5,	%g2
	xnorcc	%l6,	0x1F20,	%g7
	sdivx	%i2,	0x049C,	%o7
	subc	%o4,	%g1,	%i5
	ldsw	[%l7 + 0x24],	%l4
	stw	%o0,	[%l7 + 0x28]
	edge32ln	%l0,	%g4,	%i0
	movrlz	%i4,	0x1A6,	%g3
	fcmpgt32	%f26,	%f0,	%l1
	lduh	[%l7 + 0x68],	%l2
	fnand	%f20,	%f2,	%f18
	movrgez	%i3,	0x368,	%i1
	alignaddrl	%o2,	%o6,	%l3
	lduh	[%l7 + 0x2C],	%o5
	fpsub16	%f22,	%f20,	%f28
	lduh	[%l7 + 0x26],	%o1
	movn	%xcc,	%g5,	%g6
	movcs	%icc,	%i7,	%i6
	sllx	%o3,	0x0F,	%g2
	umul	%l5,	0x0FF0,	%l6
	for	%f12,	%f10,	%f12
	movpos	%xcc,	%i2,	%g7
	udivx	%o4,	0x1FA4,	%g1
	fmovdcc	%xcc,	%f21,	%f24
	bshuffle	%f26,	%f6,	%f16
	subcc	%o7,	%i5,	%o0
	stx	%l0,	[%l7 + 0x60]
	fmul8x16al	%f10,	%f14,	%f14
	udiv	%l4,	0x01A2,	%g4
	ldub	[%l7 + 0x45],	%i0
	edge32	%g3,	%l1,	%l2
	sir	0x023C
	fpsub16	%f22,	%f2,	%f26
	movge	%xcc,	%i3,	%i1
	restore %i4, %o6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o5,	%l3,	%g5
	std	%f10,	[%l7 + 0x08]
	mulscc	%g6,	%i7,	%o1
	edge16l	%i6,	%o3,	%g2
	movle	%xcc,	%l6,	%i2
	popc	0x079F,	%g7
	fmovdgu	%xcc,	%f22,	%f15
	fcmpne16	%f24,	%f16,	%o4
	fands	%f15,	%f1,	%f11
	ldub	[%l7 + 0x55],	%l5
	edge8	%o7,	%i5,	%g1
	fmovrslez	%o0,	%f21,	%f17
	edge32n	%l0,	%g4,	%i0
	fzeros	%f9
	ldd	[%l7 + 0x68],	%f6
	mova	%xcc,	%l4,	%g3
	andn	%l1,	0x1631,	%i3
	xor	%i1,	%i4,	%o6
	fmovscc	%xcc,	%f14,	%f16
	fmovscs	%xcc,	%f31,	%f17
	movpos	%icc,	%l2,	%o5
	or	%o2,	0x14CA,	%g5
	std	%f14,	[%l7 + 0x38]
	ldsw	[%l7 + 0x64],	%l3
	smul	%g6,	0x12FE,	%o1
	udiv	%i7,	0x1515,	%i6
	fmovrslz	%g2,	%f0,	%f6
	orn	%l6,	0x1240,	%o3
	fcmpeq32	%f10,	%f20,	%i2
	fnot1s	%f10,	%f17
	edge32n	%g7,	%l5,	%o7
	fmovdn	%xcc,	%f11,	%f26
	andn	%o4,	0x1711,	%i5
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	ld	[%l7 + 0x2C],	%f0
	xnorcc	%g4,	0x01A9,	%i0
	udivx	%l0,	0x0096,	%l4
	sll	%g3,	%i3,	%i1
	array8	%l1,	%i4,	%o6
	mova	%icc,	%l2,	%o5
	fors	%f27,	%f24,	%f20
	edge16ln	%g5,	%l3,	%g6
	fpsub32	%f14,	%f18,	%f14
	lduh	[%l7 + 0x5A],	%o2
	fmovrse	%i7,	%f8,	%f2
	andn	%o1,	%i6,	%l6
	movge	%xcc,	%o3,	%i2
	fnegd	%f20,	%f24
	save %g7, 0x069D, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g2,	0x1156,	%o4
	fmovrdne	%i5,	%f16,	%f26
	movne	%xcc,	%o0,	%o7
	umulcc	%g1,	0x1002,	%i0
	addc	%l0,	0x0D21,	%g4
	movrgz	%l4,	0x2FF,	%g3
	orncc	%i3,	%i1,	%l1
	lduh	[%l7 + 0x7A],	%o6
	fmovdcs	%xcc,	%f7,	%f14
	addcc	%i4,	%o5,	%g5
	fcmpne32	%f2,	%f4,	%l3
	udivcc	%g6,	0x0765,	%o2
	xnorcc	%i7,	%o1,	%i6
	fpackfix	%f14,	%f22
	pdist	%f8,	%f20,	%f12
	srlx	%l6,	%l2,	%o3
	edge32	%i2,	%l5,	%g2
	edge32	%o4,	%i5,	%o0
	lduw	[%l7 + 0x40],	%g7
	sll	%o7,	0x16,	%i0
	movvc	%xcc,	%g1,	%g4
	umul	%l0,	0x1B91,	%g3
	faligndata	%f10,	%f0,	%f20
	fmovsle	%icc,	%f22,	%f22
	save %l4, 0x13BF, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l1,	0x0E2D,	%i1
	fsrc1	%f10,	%f30
	mulx	%o6,	%i4,	%g5
	movle	%icc,	%o5,	%g6
	fpack32	%f18,	%f6,	%f4
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%l2
	subccc	%o2,	%o1,	%i7
	edge16n	%i6,	%l6,	%o3
	stw	%i2,	[%l7 + 0x1C]
	srlx	%l5,	%l2,	%o4
	edge32l	%g2,	%i5,	%o0
	udivcc	%o7,	0x03E9,	%g7
	fmovspos	%xcc,	%f26,	%f25
	orn	%i0,	0x10C3,	%g4
	subcc	%l0,	%g3,	%l4
	fpackfix	%f10,	%f29
	edge8	%i3,	%l1,	%i1
	and	%g1,	0x0BCE,	%i4
	movneg	%xcc,	%g5,	%o6
	andn	%g6,	%l3,	%o2
	stb	%o5,	[%l7 + 0x27]
	umul	%i7,	%i6,	%o1
	movrgez	%l6,	%i2,	%l5
	fmovs	%f15,	%f29
	edge32	%o3,	%o4,	%g2
	edge8ln	%i5,	%l2,	%o7
	fmovsn	%icc,	%f6,	%f4
	udivx	%o0,	0x10E1,	%g7
	ldsb	[%l7 + 0x37],	%g4
	edge8ln	%i0,	%l0,	%g3
	andcc	%l4,	%i3,	%l1
	edge8	%g1,	%i1,	%g5
	movne	%icc,	%i4,	%o6
	xnor	%l3,	%o2,	%g6
	restore %o5, %i7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o1,	0x09D9,	%l6
	mulx	%i2,	%o3,	%o4
	array8	%l5,	%i5,	%l2
	andncc	%g2,	%o7,	%g7
	std	%f2,	[%l7 + 0x70]
	xnor	%g4,	%o0,	%l0
	addccc	%g3,	%i0,	%l4
	ld	[%l7 + 0x10],	%f4
	mulx	%l1,	%g1,	%i3
	fmovdge	%xcc,	%f30,	%f30
	alignaddr	%g5,	%i1,	%o6
	sub	%i4,	%l3,	%o2
	fmovscs	%xcc,	%f20,	%f0
	ldd	[%l7 + 0x78],	%f8
	move	%icc,	%o5,	%g6
	subc	%i6,	%o1,	%i7
	srlx	%l6,	%o3,	%o4
	movvc	%xcc,	%i2,	%l5
	fands	%f11,	%f17,	%f9
	fands	%f4,	%f3,	%f11
	edge32l	%l2,	%g2,	%i5
	sub	%g7,	0x0B24,	%o7
	movcs	%icc,	%o0,	%g4
	fmovdle	%icc,	%f6,	%f0
	fsrc2	%f6,	%f26
	fmul8ulx16	%f8,	%f26,	%f10
	and	%g3,	0x1EFB,	%i0
	movge	%icc,	%l0,	%l4
	ldx	[%l7 + 0x70],	%l1
	movrgz	%i3,	%g1,	%g5
	fsrc2	%f6,	%f8
	movrgez	%i1,	%o6,	%i4
	lduh	[%l7 + 0x5A],	%o2
	ldd	[%l7 + 0x48],	%f14
	movcc	%icc,	%l3,	%o5
	edge32l	%i6,	%g6,	%o1
	ldsb	[%l7 + 0x1A],	%l6
	umulcc	%o3,	%o4,	%i7
	fpsub32	%f22,	%f14,	%f30
	edge32n	%l5,	%l2,	%g2
	srl	%i5,	0x1B,	%g7
	addcc	%i2,	%o7,	%o0
	mova	%xcc,	%g4,	%g3
	st	%f3,	[%l7 + 0x40]
	std	%f16,	[%l7 + 0x70]
	movrlz	%l0,	0x285,	%i0
	orncc	%l4,	%l1,	%g1
	movgu	%icc,	%i3,	%g5
	fpack16	%f6,	%f14
	andn	%i1,	%o6,	%o2
	stx	%i4,	[%l7 + 0x30]
	popc	%l3,	%o5
	mulx	%i6,	0x0F05,	%g6
	movle	%xcc,	%o1,	%o3
	alignaddrl	%o4,	%i7,	%l5
	xor	%l6,	0x0E70,	%l2
	ldub	[%l7 + 0x19],	%i5
	xnor	%g2,	0x03E9,	%g7
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	fnot2	%f16,	%f10
	array32	%g4,	%o0,	%g3
	movvs	%icc,	%i0,	%l0
	movcs	%icc,	%l4,	%g1
	fmovsvs	%icc,	%f31,	%f21
	pdist	%f16,	%f30,	%f0
	stb	%l1,	[%l7 + 0x1D]
	edge8n	%i3,	%g5,	%o6
	fsrc2	%f10,	%f12
	fzero	%f16
	orncc	%i1,	%o2,	%l3
	mulscc	%o5,	0x0DF7,	%i6
	nop
	set	0x48, %i4
	ldx	[%l7 + %i4],	%g6
	sdivx	%i4,	0x078B,	%o1
	movleu	%xcc,	%o3,	%i7
	edge8l	%o4,	%l5,	%l6
	sdiv	%i5,	0x13EF,	%g2
	array8	%l2,	%g7,	%i2
	orn	%o7,	%o0,	%g3
	fnor	%f28,	%f8,	%f22
	udivcc	%g4,	0x1897,	%i0
	movrgz	%l0,	0x348,	%g1
	fpadd16	%f30,	%f4,	%f24
	movneg	%xcc,	%l1,	%l4
	fmovrdgz	%g5,	%f24,	%f2
	fmovs	%f24,	%f16
	xor	%i3,	0x0F23,	%i1
	movn	%icc,	%o6,	%o2
	movpos	%icc,	%o5,	%l3
	sth	%g6,	[%l7 + 0x68]
	sra	%i4,	%o1,	%o3
	movleu	%icc,	%i6,	%o4
	fmovsgu	%xcc,	%f12,	%f12
	fpsub32s	%f23,	%f18,	%f9
	fmovrdgz	%i7,	%f10,	%f26
	edge32	%l6,	%i5,	%g2
	sir	0x06D9
	fandnot2s	%f31,	%f28,	%f5
	movrlz	%l2,	0x161,	%l5
	xorcc	%g7,	%i2,	%o7
	nop
	set	0x4C, %o0
	stw	%o0,	[%l7 + %o0]
	ldsh	[%l7 + 0x5E],	%g3
	or	%i0,	0x0534,	%g4
	movpos	%xcc,	%g1,	%l0
	edge32l	%l4,	%l1,	%g5
	movrgz	%i3,	0x355,	%i1
	sdivcc	%o6,	0x1BB1,	%o5
	srax	%l3,	0x17,	%o2
	sdivcc	%i4,	0x1BE6,	%o1
	lduw	[%l7 + 0x70],	%o3
	sub	%i6,	0x0630,	%g6
	nop
	set	0x52, %l0
	ldsb	[%l7 + %l0],	%i7
	stx	%l6,	[%l7 + 0x08]
	ldsw	[%l7 + 0x1C],	%o4
	movrne	%i5,	0x3E0,	%l2
	or	%l5,	%g2,	%i2
	ldsb	[%l7 + 0x41],	%o7
	save %o0, %g7, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%i0,	%f28,	%f24
	fcmple32	%f10,	%f20,	%g4
	fpadd32	%f26,	%f12,	%f24
	subcc	%l0,	0x06C7,	%g1
	movvc	%xcc,	%l1,	%l4
	ldd	[%l7 + 0x58],	%g4
	alignaddrl	%i1,	%o6,	%o5
	fmovrde	%l3,	%f4,	%f26
	ldsh	[%l7 + 0x52],	%i3
	smul	%i4,	%o2,	%o3
	movrgz	%i6,	%o1,	%i7
	stb	%l6,	[%l7 + 0x29]
	movvs	%xcc,	%g6,	%i5
	andn	%o4,	0x0907,	%l5
	fmovdn	%icc,	%f30,	%f26
	movrgz	%g2,	%i2,	%o7
	sdivcc	%o0,	0x0C51,	%l2
	fmovscs	%icc,	%f29,	%f17
	udiv	%g7,	0x07F3,	%i0
	movrlz	%g3,	0x0B8,	%l0
	movrlez	%g4,	%g1,	%l4
	andn	%g5,	0x1274,	%i1
	fmovrslz	%l1,	%f30,	%f28
	bshuffle	%f24,	%f10,	%f30
	save %o6, %o5, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x7E, %l6
	lduh	[%l7 + %l6],	%i3
	movgu	%icc,	%i4,	%o2
	edge16	%o3,	%o1,	%i6
	ldsw	[%l7 + 0x18],	%l6
	movvs	%icc,	%i7,	%g6
	movvs	%icc,	%i5,	%l5
	sdivcc	%g2,	0x1E41,	%o4
	fpsub16	%f22,	%f12,	%f8
	movgu	%xcc,	%i2,	%o0
	ld	[%l7 + 0x44],	%f1
	fmovdneg	%xcc,	%f5,	%f20
	array8	%l2,	%g7,	%o7
	orcc	%i0,	%g3,	%g4
	fmovscc	%icc,	%f9,	%f17
	edge32l	%l0,	%g1,	%l4
	alignaddrl	%i1,	%l1,	%g5
	andncc	%o6,	%l3,	%i3
	movn	%xcc,	%o5,	%o2
	ldsw	[%l7 + 0x44],	%i4
	sdiv	%o3,	0x0745,	%i6
	stw	%l6,	[%l7 + 0x58]
	movrlez	%i7,	%g6,	%i5
	ldd	[%l7 + 0x20],	%o0
	sra	%l5,	%o4,	%i2
	xnor	%g2,	0x0D04,	%o0
	fpsub16	%f24,	%f18,	%f14
	smul	%g7,	0x05FB,	%o7
	stb	%l2,	[%l7 + 0x6D]
	ldd	[%l7 + 0x40],	%f2
	ldd	[%l7 + 0x50],	%g2
	orn	%i0,	0x064F,	%g4
	xorcc	%g1,	0x05CE,	%l0
	srax	%i1,	%l1,	%g5
	fzeros	%f8
	sdivcc	%o6,	0x0EC7,	%l4
	addc	%l3,	%i3,	%o5
	fmovdcc	%xcc,	%f17,	%f30
	movrlez	%i4,	0x017,	%o2
	fandnot1s	%f8,	%f29,	%f30
	andcc	%i6,	0x1D7C,	%o3
	movgu	%icc,	%l6,	%g6
	fcmped	%fcc3,	%f28,	%f22
	edge16l	%i5,	%o1,	%i7
	fmovsvc	%icc,	%f25,	%f24
	movleu	%xcc,	%o4,	%i2
	movcs	%xcc,	%l5,	%o0
	xorcc	%g7,	%o7,	%g2
	movvc	%icc,	%l2,	%i0
	array8	%g4,	%g3,	%g1
	fxor	%f4,	%f6,	%f12
	movge	%icc,	%l0,	%i1
	udivx	%g5,	0x1148,	%l1
	edge32	%l4,	%o6,	%l3
	sth	%i3,	[%l7 + 0x52]
	lduw	[%l7 + 0x54],	%i4
	popc	%o5,	%i6
	udivcc	%o2,	0x16D0,	%o3
	fmovscs	%xcc,	%f23,	%f21
	fmovrdlez	%g6,	%f4,	%f12
	fcmple16	%f8,	%f6,	%l6
	fmovdneg	%xcc,	%f23,	%f22
	movvc	%xcc,	%i5,	%o1
	orncc	%o4,	0x19AE,	%i2
	fmovdne	%icc,	%f26,	%f11
	edge32l	%l5,	%o0,	%g7
	smulcc	%o7,	%g2,	%l2
	fandnot1s	%f29,	%f7,	%f4
	nop
	set	0x42, %g5
	sth	%i7,	[%l7 + %g5]
	fcmped	%fcc1,	%f16,	%f24
	sllx	%i0,	%g4,	%g1
	xnorcc	%l0,	0x013E,	%i1
	stw	%g3,	[%l7 + 0x58]
	edge16l	%g5,	%l4,	%l1
	fpsub32s	%f23,	%f5,	%f12
	nop
	set	0x10, %g3
	ldx	[%l7 + %g3],	%l3
	subccc	%i3,	0x1F70,	%o6
	andn	%o5,	%i6,	%o2
	movcc	%icc,	%i4,	%g6
	smul	%l6,	0x0468,	%o3
	umul	%o1,	0x0FC5,	%o4
	movcc	%xcc,	%i2,	%i5
	fmovsle	%xcc,	%f19,	%f5
	xorcc	%o0,	%g7,	%o7
	movg	%icc,	%l5,	%g2
	restore %l2, 0x1050, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0519
	smulcc	%g4,	0x1FF2,	%i0
	srlx	%g1,	0x1B,	%l0
	nop
	set	0x38, %g1
	ldsh	[%l7 + %g1],	%i1
	edge16n	%g3,	%l4,	%l1
	movvs	%icc,	%g5,	%i3
	fcmped	%fcc3,	%f30,	%f30
	edge8	%o6,	%l3,	%o5
	andn	%o2,	0x0814,	%i4
	ldsh	[%l7 + 0x54],	%i6
	edge8ln	%l6,	%g6,	%o3
	alignaddrl	%o1,	%i2,	%o4
	movrgz	%o0,	%i5,	%o7
	fmovsle	%xcc,	%f26,	%f30
	sub	%l5,	%g2,	%g7
	fand	%f4,	%f30,	%f20
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	and	%i0,	0x1D87,	%l0
	xorcc	%i1,	%g3,	%g1
	save %l1, 0x118D, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g5,	0x08D3,	%o6
	ldd	[%l7 + 0x20],	%l2
	sll	%i3,	0x1C,	%o2
	movpos	%xcc,	%i4,	%o5
	addc	%i6,	%g6,	%o3
	popc	0x1F7A,	%l6
	add	%o1,	%i2,	%o0
	movpos	%xcc,	%o4,	%o7
	or	%l5,	%g2,	%g7
	movrgz	%i7,	0x1EF,	%l2
	ld	[%l7 + 0x0C],	%f22
	fmovsvc	%xcc,	%f14,	%f4
	ldub	[%l7 + 0x48],	%g4
	umul	%i0,	0x1316,	%i5
	umul	%l0,	%g3,	%g1
	fmovsl	%icc,	%f25,	%f15
	fmovsvc	%xcc,	%f9,	%f27
	srax	%l1,	%i1,	%g5
	umul	%l4,	0x1B03,	%o6
	lduw	[%l7 + 0x28],	%l3
	movle	%xcc,	%i3,	%o2
	movrgz	%o5,	0x21D,	%i4
	umul	%i6,	0x1047,	%g6
	orncc	%l6,	%o1,	%i2
	umul	%o3,	%o4,	%o7
	array16	%o0,	%g2,	%l5
	subcc	%i7,	0x1DEF,	%l2
	fcmpne32	%f16,	%f20,	%g7
	ldd	[%l7 + 0x70],	%g4
	nop
	set	0x28, %i1
	stx	%i0,	[%l7 + %i1]
	xnorcc	%i5,	0x1A45,	%g3
	fandnot1	%f30,	%f30,	%f2
	sll	%l0,	%g1,	%i1
	alignaddr	%l1,	%l4,	%o6
	fornot1s	%f19,	%f1,	%f6
	fsrc2	%f14,	%f22
	ldd	[%l7 + 0x10],	%l2
	ldd	[%l7 + 0x58],	%g4
	ld	[%l7 + 0x50],	%f25
	mulx	%i3,	%o5,	%i4
	movcs	%xcc,	%i6,	%g6
	edge16ln	%o2,	%l6,	%i2
	movne	%icc,	%o1,	%o3
	std	%f20,	[%l7 + 0x60]
	fandnot1s	%f17,	%f1,	%f23
	srlx	%o7,	%o0,	%g2
	alignaddr	%l5,	%o4,	%l2
	fnand	%f22,	%f22,	%f4
	alignaddr	%g7,	%i7,	%i0
	ldsw	[%l7 + 0x74],	%g4
	fmovsne	%icc,	%f20,	%f12
	fpadd32	%f22,	%f4,	%f28
	fmovda	%icc,	%f21,	%f29
	fmovdn	%icc,	%f2,	%f7
	subccc	%g3,	0x110F,	%l0
	andcc	%i5,	%i1,	%g1
	subc	%l4,	0x1FF3,	%l1
	movge	%xcc,	%l3,	%g5
	movrlez	%o6,	%o5,	%i4
	orn	%i3,	%g6,	%i6
	fpackfix	%f28,	%f12
	subccc	%l6,	0x1797,	%i2
	umulcc	%o2,	%o1,	%o7
	ld	[%l7 + 0x18],	%f27
	sra	%o3,	%o0,	%g2
	xnor	%l5,	0x0FA2,	%o4
	udivx	%l2,	0x1C88,	%g7
	sdivx	%i7,	0x13B3,	%i0
	fpackfix	%f0,	%f4
	sllx	%g3,	0x19,	%g4
	movgu	%icc,	%l0,	%i1
	fmovsge	%xcc,	%f3,	%f17
	addcc	%i5,	%g1,	%l1
	movge	%icc,	%l3,	%g5
	fpsub32	%f30,	%f24,	%f8
	array8	%l4,	%o5,	%o6
	andn	%i4,	0x19E3,	%i3
	fpack16	%f20,	%f0
	restore %g6, %l6, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%icc,	%f20,	%f24
	fcmple32	%f10,	%f22,	%i2
	ldsh	[%l7 + 0x7E],	%o1
	ldub	[%l7 + 0x6F],	%o7
	movrgez	%o2,	0x01D,	%o3
	udivx	%o0,	0x1D1C,	%l5
	fpmerge	%f29,	%f8,	%f12
	udiv	%g2,	0x0EEF,	%l2
	nop
	set	0x58, %i0
	stx	%g7,	[%l7 + %i0]
	alignaddrl	%i7,	%i0,	%o4
	xorcc	%g4,	0x1A0B,	%g3
	movcc	%icc,	%l0,	%i5
	xorcc	%i1,	0x1C67,	%l1
	fand	%f22,	%f22,	%f30
	movg	%icc,	%g1,	%l3
	addccc	%g5,	%o5,	%l4
	addccc	%o6,	0x0982,	%i3
	sub	%i4,	%l6,	%g6
	edge32ln	%i2,	%i6,	%o1
	movpos	%icc,	%o7,	%o3
	edge16ln	%o2,	%o0,	%l5
	ldx	[%l7 + 0x18],	%l2
	mova	%icc,	%g2,	%i7
	fand	%f8,	%f26,	%f26
	smulcc	%i0,	0x0997,	%g7
	umulcc	%g4,	0x1303,	%o4
	xorcc	%l0,	%g3,	%i5
	popc	%l1,	%i1
	edge32l	%l3,	%g5,	%o5
	subccc	%g1,	0x1D73,	%o6
	andn	%l4,	0x12A0,	%i3
	orcc	%i4,	%l6,	%i2
	movvc	%xcc,	%i6,	%g6
	stx	%o1,	[%l7 + 0x20]
	fandnot1	%f2,	%f4,	%f6
	edge16ln	%o7,	%o3,	%o0
	subc	%o2,	0x1106,	%l2
	udiv	%g2,	0x18C1,	%l5
	movvs	%xcc,	%i0,	%g7
	fmovsle	%icc,	%f14,	%f16
	srl	%g4,	%o4,	%l0
	xnor	%g3,	0x1D70,	%i5
	fcmpgt16	%f26,	%f28,	%l1
	orncc	%i7,	0x025A,	%i1
	xnor	%l3,	%g5,	%o5
	srl	%g1,	0x1C,	%o6
	movvc	%icc,	%i3,	%l4
	xnor	%i4,	%l6,	%i2
	fmovdl	%icc,	%f6,	%f18
	array32	%i6,	%g6,	%o1
	andncc	%o7,	%o3,	%o0
	movcc	%xcc,	%l2,	%o2
	udiv	%g2,	0x0455,	%l5
	andcc	%i0,	0x0E91,	%g7
	mulx	%o4,	0x07C4,	%g4
	addcc	%l0,	%g3,	%i5
	sdiv	%i7,	0x1F91,	%i1
	udiv	%l1,	0x0A73,	%g5
	mulx	%o5,	0x12F7,	%g1
	add	%o6,	0x00AE,	%l3
	ldd	[%l7 + 0x50],	%l4
	andn	%i3,	%l6,	%i4
	st	%f26,	[%l7 + 0x14]
	subc	%i2,	0x0253,	%g6
	movne	%xcc,	%i6,	%o7
	edge8ln	%o3,	%o0,	%l2
	fabsd	%f18,	%f4
	edge8ln	%o2,	%g2,	%o1
	movpos	%xcc,	%i0,	%g7
	bshuffle	%f12,	%f6,	%f6
	siam	0x3
	subc	%o4,	%g4,	%l0
	ldub	[%l7 + 0x58],	%l5
	subc	%i5,	%g3,	%i7
	faligndata	%f28,	%f28,	%f14
	sdivcc	%l1,	0x1AAA,	%i1
	srl	%g5,	%o5,	%g1
	edge8l	%o6,	%l3,	%i3
	fcmpgt16	%f18,	%f8,	%l4
	ldsw	[%l7 + 0x48],	%i4
	edge32ln	%l6,	%i2,	%i6
	fcmpne32	%f28,	%f26,	%g6
	edge32	%o7,	%o0,	%o3
	movrlez	%o2,	%l2,	%g2
	movne	%icc,	%i0,	%o1
	addcc	%o4,	0x032B,	%g4
	save %g7, 0x1F87, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l0,	%i5,	%g3
	movcs	%icc,	%i7,	%l1
	movrgez	%i1,	0x1D0,	%g5
	sdivcc	%g1,	0x19CE,	%o5
	sth	%o6,	[%l7 + 0x20]
	fcmpgt16	%f26,	%f24,	%l3
	edge32n	%i3,	%i4,	%l6
	fmovrsgz	%l4,	%f17,	%f11
	fmovdge	%icc,	%f28,	%f31
	stb	%i2,	[%l7 + 0x7B]
	srl	%g6,	0x06,	%o7
	udivx	%o0,	0x001C,	%i6
	ldsh	[%l7 + 0x70],	%o2
	ldd	[%l7 + 0x48],	%o2
	stb	%l2,	[%l7 + 0x16]
	orn	%i0,	%g2,	%o1
	fcmped	%fcc1,	%f16,	%f26
	movrgz	%g4,	0x105,	%o4
	lduw	[%l7 + 0x68],	%g7
	sll	%l0,	%i5,	%l5
	sllx	%i7,	%l1,	%i1
	srl	%g3,	%g1,	%o5
	fmovda	%icc,	%f0,	%f15
	sll	%g5,	%o6,	%i3
	stx	%l3,	[%l7 + 0x30]
	xnorcc	%l6,	0x0A25,	%i4
	movle	%icc,	%l4,	%i2
	subc	%g6,	%o7,	%o0
	sdiv	%o2,	0x074C,	%o3
	lduw	[%l7 + 0x2C],	%i6
	fmovdcs	%xcc,	%f31,	%f25
	mova	%xcc,	%l2,	%i0
	udiv	%o1,	0x0025,	%g2
	orncc	%g4,	0x0614,	%g7
	sllx	%o4,	%l0,	%i5
	fmovspos	%xcc,	%f0,	%f8
	srl	%l5,	0x0E,	%i7
	udivcc	%i1,	0x085C,	%l1
	fxor	%f10,	%f16,	%f16
	edge32	%g1,	%o5,	%g5
	movn	%icc,	%o6,	%g3
	edge8ln	%i3,	%l3,	%i4
	edge32n	%l4,	%l6,	%g6
	ldd	[%l7 + 0x78],	%o6
	smul	%i2,	%o0,	%o2
	edge16	%o3,	%i6,	%l2
	movcc	%icc,	%i0,	%o1
	ld	[%l7 + 0x34],	%f13
	st	%f11,	[%l7 + 0x40]
	fpadd16	%f8,	%f28,	%f22
	fmovrdgez	%g4,	%f24,	%f0
	sethi	0x1DD2,	%g7
	sdivx	%g2,	0x0C48,	%l0
	fcmple16	%f14,	%f30,	%i5
	add	%l5,	0x0603,	%i7
	srlx	%o4,	0x15,	%l1
	smulcc	%i1,	%o5,	%g5
	fexpand	%f1,	%f18
	fmovsvs	%xcc,	%f10,	%f0
	movrlez	%o6,	0x2D3,	%g3
	edge16ln	%g1,	%i3,	%l3
	andn	%l4,	%i4,	%l6
	fpsub16s	%f20,	%f7,	%f3
	srl	%o7,	0x1F,	%i2
	movvs	%icc,	%o0,	%o2
	fmovrsgez	%g6,	%f15,	%f2
	udiv	%o3,	0x0799,	%l2
	fmul8x16al	%f31,	%f17,	%f12
	save %i6, 0x0D2F, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i0,	%g4,	%g2
	addc	%g7,	0x0FD3,	%i5
	fmovrslz	%l0,	%f26,	%f12
	sllx	%l5,	0x1B,	%o4
	movl	%icc,	%l1,	%i1
	sdivcc	%i7,	0x0B86,	%g5
	and	%o6,	%o5,	%g1
	movrlz	%i3,	%g3,	%l3
	nop
	set	0x34, %l3
	stb	%l4,	[%l7 + %l3]
	fmovrde	%i4,	%f12,	%f22
	fmovspos	%icc,	%f15,	%f17
	fpadd32s	%f4,	%f25,	%f7
	fones	%f11
	movvs	%xcc,	%o7,	%l6
	nop
	set	0x2C, %i3
	lduw	[%l7 + %i3],	%o0
	edge16n	%o2,	%i2,	%g6
	movn	%icc,	%l2,	%o3
	and	%o1,	0x192B,	%i0
	addcc	%g4,	0x1B40,	%i6
	alignaddr	%g7,	%i5,	%g2
	fmovrslez	%l0,	%f10,	%f17
	sdivx	%o4,	0x129B,	%l5
	fpmerge	%f9,	%f20,	%f8
	fornot1	%f26,	%f16,	%f4
	mulscc	%l1,	%i1,	%g5
	fnand	%f4,	%f20,	%f6
	movge	%icc,	%i7,	%o5
	udivx	%o6,	0x09DF,	%i3
	nop
	set	0x48, %g6
	std	%f24,	[%l7 + %g6]
	srlx	%g3,	%g1,	%l3
	fmovsvs	%xcc,	%f25,	%f9
	movrlez	%i4,	0x1AF,	%o7
	for	%f0,	%f6,	%f28
	smul	%l6,	0x188D,	%o0
	edge32l	%o2,	%l4,	%i2
	subccc	%l2,	%g6,	%o1
	sllx	%i0,	%g4,	%i6
	fpadd32s	%f29,	%f9,	%f25
	ldsw	[%l7 + 0x14],	%o3
	subccc	%i5,	%g7,	%g2
	movg	%icc,	%l0,	%o4
	movre	%l5,	0x151,	%i1
	movcs	%icc,	%g5,	%l1
	lduw	[%l7 + 0x30],	%i7
	ldsh	[%l7 + 0x2C],	%o5
	xnor	%o6,	%g3,	%g1
	movge	%icc,	%l3,	%i4
	sth	%i3,	[%l7 + 0x34]
	ldub	[%l7 + 0x30],	%o7
	subc	%o0,	%l6,	%l4
	srl	%o2,	%i2,	%l2
	fpack32	%f12,	%f22,	%f10
	fmovrsgz	%o1,	%f28,	%f25
	for	%f26,	%f26,	%f24
	ldd	[%l7 + 0x60],	%f20
	smulcc	%g6,	%i0,	%i6
	move	%xcc,	%o3,	%i5
	movgu	%icc,	%g7,	%g4
	fcmpeq32	%f16,	%f2,	%g2
	array16	%o4,	%l5,	%i1
	sdivx	%g5,	0x021B,	%l0
	array32	%i7,	%o5,	%l1
	fmul8x16	%f9,	%f30,	%f8
	edge32n	%o6,	%g1,	%l3
	subcc	%g3,	0x00FB,	%i4
	edge16l	%i3,	%o0,	%l6
	movpos	%icc,	%l4,	%o2
	fpackfix	%f30,	%f21
	edge8n	%i2,	%l2,	%o1
	move	%icc,	%g6,	%i0
	orn	%o7,	0x0EF1,	%o3
	sdivx	%i6,	0x1DE7,	%i5
	movrlez	%g7,	0x309,	%g4
	movrgez	%g2,	%l5,	%i1
	fcmpes	%fcc0,	%f10,	%f10
	movgu	%icc,	%o4,	%l0
	fors	%f2,	%f13,	%f11
	movne	%icc,	%g5,	%i7
	fors	%f0,	%f15,	%f13
	movrlz	%l1,	%o5,	%g1
	srax	%o6,	0x1E,	%g3
	sll	%i4,	%l3,	%o0
	movvc	%icc,	%l6,	%l4
	andn	%o2,	%i3,	%l2
	andcc	%i2,	%g6,	%o1
	sub	%i0,	0x0FBF,	%o3
	add	%o7,	%i6,	%g7
	fmovrsgez	%g4,	%f13,	%f17
	fmuld8sux16	%f23,	%f8,	%f24
	sth	%i5,	[%l7 + 0x12]
	save %g2, %l5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x09D9,	%o4
	fmovd	%f0,	%f12
	udivx	%g5,	0x0C77,	%l0
	stx	%i7,	[%l7 + 0x70]
	add	%l1,	%g1,	%o5
	movrlez	%g3,	0x3C2,	%o6
	sdivcc	%i4,	0x1884,	%l3
	fpadd16s	%f27,	%f8,	%f5
	movne	%xcc,	%l6,	%l4
	sth	%o0,	[%l7 + 0x46]
	fors	%f10,	%f28,	%f0
	xorcc	%i3,	%l2,	%o2
	fmovsle	%xcc,	%f2,	%f4
	movrlez	%i2,	%g6,	%o1
	move	%icc,	%i0,	%o7
	movpos	%icc,	%o3,	%i6
	array8	%g4,	%i5,	%g2
	mulscc	%l5,	0x1B77,	%i1
	addc	%g7,	%o4,	%l0
	ldsh	[%l7 + 0x66],	%g5
	fandnot1	%f12,	%f0,	%f10
	movne	%xcc,	%l1,	%g1
	sll	%i7,	0x0E,	%o5
	udivcc	%g3,	0x15BF,	%i4
	movvs	%icc,	%l3,	%o6
	xor	%l4,	0x0440,	%o0
	ldsh	[%l7 + 0x32],	%l6
	move	%xcc,	%i3,	%o2
	fxnors	%f17,	%f11,	%f18
	umul	%l2,	0x1BE2,	%i2
	alignaddr	%g6,	%o1,	%i0
	fands	%f18,	%f25,	%f12
	ldd	[%l7 + 0x30],	%o6
	ldd	[%l7 + 0x50],	%f16
	andcc	%i6,	%g4,	%o3
	stw	%g2,	[%l7 + 0x0C]
	fmovsvc	%icc,	%f17,	%f29
	sdivcc	%l5,	0x1CB9,	%i1
	sdivx	%i5,	0x1948,	%g7
	lduw	[%l7 + 0x30],	%l0
	alignaddrl	%g5,	%l1,	%o4
	xorcc	%g1,	%o5,	%g3
	std	%f10,	[%l7 + 0x70]
	std	%f24,	[%l7 + 0x48]
	xor	%i7,	%l3,	%i4
	srl	%o6,	0x0C,	%l4
	ldsb	[%l7 + 0x69],	%o0
	sllx	%l6,	0x1D,	%i3
	movvs	%icc,	%l2,	%o2
	movg	%icc,	%i2,	%g6
	fcmpeq32	%f20,	%f8,	%i0
	movne	%icc,	%o1,	%o7
	fmovsn	%xcc,	%f4,	%f12
	array16	%i6,	%o3,	%g4
	fpadd16	%f6,	%f0,	%f20
	udivcc	%l5,	0x07AB,	%i1
	addc	%g2,	0x000D,	%g7
	ldd	[%l7 + 0x28],	%l0
	addccc	%i5,	%l1,	%g5
	orn	%o4,	%g1,	%g3
	ldsb	[%l7 + 0x3B],	%o5
	movre	%l3,	0x226,	%i7
	fmovdg	%icc,	%f10,	%f14
	movre	%o6,	%i4,	%l4
	xorcc	%l6,	0x1512,	%i3
	srax	%l2,	%o0,	%i2
	fandnot1s	%f26,	%f2,	%f11
	move	%icc,	%o2,	%g6
	fmovspos	%xcc,	%f9,	%f1
	movcc	%xcc,	%o1,	%o7
	faligndata	%f2,	%f2,	%f12
	umul	%i0,	0x0E07,	%o3
	xor	%g4,	0x08B8,	%i6
	subc	%l5,	0x15F3,	%g2
	move	%icc,	%g7,	%i1
	subc	%l0,	%l1,	%i5
	srax	%g5,	0x0A,	%g1
	umulcc	%g3,	%o4,	%l3
	or	%i7,	0x16CF,	%o6
	xor	%o5,	%l4,	%i4
	fpadd32	%f10,	%f28,	%f28
	fzero	%f4
	add	%l6,	%l2,	%i3
	movrgez	%o0,	0x234,	%i2
	movpos	%xcc,	%o2,	%o1
	sethi	0x0590,	%o7
	alignaddrl	%g6,	%i0,	%g4
	smulcc	%o3,	%i6,	%l5
	ldd	[%l7 + 0x40],	%g2
	addcc	%i1,	%l0,	%l1
	ldx	[%l7 + 0x28],	%i5
	movge	%xcc,	%g5,	%g7
	edge32ln	%g3,	%g1,	%o4
	fnegd	%f10,	%f2
	stx	%l3,	[%l7 + 0x20]
	movleu	%icc,	%o6,	%o5
	popc	0x188C,	%i7
	fcmpne32	%f22,	%f12,	%l4
	nop
	set	0x20, %g7
	sth	%l6,	[%l7 + %g7]
	fmovdcc	%xcc,	%f13,	%f16
	lduw	[%l7 + 0x64],	%i4
	fmovsg	%xcc,	%f30,	%f7
	subcc	%l2,	0x1417,	%i3
	xnor	%i2,	0x18CC,	%o2
	stx	%o1,	[%l7 + 0x20]
	smul	%o7,	0x1B7F,	%g6
	movre	%i0,	%o0,	%g4
	edge8n	%o3,	%i6,	%g2
	sll	%l5,	0x0A,	%i1
	andcc	%l1,	0x19D9,	%i5
	addc	%g5,	%l0,	%g3
	or	%g7,	0x1ABA,	%g1
	movpos	%icc,	%o4,	%l3
	edge16n	%o6,	%o5,	%i7
	ld	[%l7 + 0x0C],	%f9
	edge32	%l4,	%i4,	%l6
	edge16ln	%l2,	%i2,	%o2
	std	%f18,	[%l7 + 0x30]
	alignaddr	%o1,	%i3,	%g6
	andn	%i0,	0x18F0,	%o0
	lduh	[%l7 + 0x62],	%o7
	fnors	%f31,	%f0,	%f16
	ldd	[%l7 + 0x28],	%f8
	edge32l	%g4,	%i6,	%g2
	andncc	%l5,	%o3,	%i1
	xor	%l1,	%g5,	%l0
	movre	%g3,	0x38A,	%i5
	subcc	%g7,	%g1,	%l3
	fxnors	%f3,	%f20,	%f16
	movneg	%xcc,	%o6,	%o4
	movvc	%icc,	%o5,	%l4
	sub	%i7,	0x1F2C,	%l6
	movn	%icc,	%l2,	%i4
	ldx	[%l7 + 0x28],	%i2
	smul	%o1,	%o2,	%g6
	movn	%xcc,	%i3,	%i0
	fmul8sux16	%f4,	%f28,	%f12
	movl	%xcc,	%o0,	%o7
	edge16	%i6,	%g4,	%l5
	orcc	%o3,	%i1,	%g2
	fnand	%f14,	%f28,	%f24
	movl	%xcc,	%l1,	%l0
	sir	0x1D79
	edge16l	%g3,	%g5,	%g7
	mova	%icc,	%g1,	%l3
	orcc	%i5,	%o4,	%o6
	srax	%o5,	%i7,	%l4
	edge16l	%l2,	%l6,	%i2
	edge8	%i4,	%o1,	%g6
	fmovrdgz	%o2,	%f8,	%f20
	movn	%icc,	%i0,	%o0
	orn	%o7,	%i6,	%g4
	edge8ln	%i3,	%o3,	%l5
	andncc	%i1,	%g2,	%l1
	alignaddrl	%g3,	%g5,	%g7
	ld	[%l7 + 0x60],	%f26
	alignaddrl	%l0,	%l3,	%g1
	subcc	%i5,	%o6,	%o4
	xnorcc	%o5,	0x176C,	%i7
	movge	%icc,	%l4,	%l6
	movre	%l2,	%i4,	%i2
	edge8ln	%g6,	%o2,	%o1
	sub	%i0,	%o7,	%o0
	sdivcc	%g4,	0x1778,	%i6
	stx	%o3,	[%l7 + 0x38]
	movne	%icc,	%l5,	%i3
	movgu	%xcc,	%g2,	%i1
	movpos	%icc,	%l1,	%g3
	fornot2s	%f4,	%f25,	%f19
	fxnor	%f14,	%f14,	%f12
	xnor	%g5,	%l0,	%g7
	movleu	%icc,	%l3,	%g1
	edge32	%o6,	%o4,	%i5
	fmovdl	%xcc,	%f16,	%f11
	movcc	%icc,	%i7,	%l4
	srlx	%o5,	%l2,	%i4
	movpos	%xcc,	%i2,	%g6
	edge8l	%l6,	%o1,	%o2
	orcc	%i0,	0x1600,	%o7
	fmovsne	%icc,	%f7,	%f15
	smul	%g4,	%i6,	%o0
	edge32l	%l5,	%o3,	%i3
	andn	%g2,	0x1CFF,	%i1
	fsrc2s	%f2,	%f5
	fmovrdlz	%g3,	%f18,	%f6
	siam	0x1
	srlx	%g5,	%l0,	%g7
	xnor	%l3,	%l1,	%o6
	or	%g1,	0x0EAC,	%i5
	sllx	%i7,	0x0C,	%l4
	fxor	%f6,	%f0,	%f10
	movrne	%o4,	%o5,	%l2
	subcc	%i2,	0x0AE6,	%i4
	xnorcc	%g6,	%o1,	%o2
	lduw	[%l7 + 0x24],	%i0
	ldsh	[%l7 + 0x26],	%o7
	ldsb	[%l7 + 0x36],	%g4
	umul	%l6,	0x174E,	%i6
	ldub	[%l7 + 0x0E],	%o0
	umulcc	%l5,	0x0B0D,	%i3
	stw	%g2,	[%l7 + 0x78]
	fmovrdlez	%o3,	%f16,	%f4
	std	%f14,	[%l7 + 0x08]
	movle	%icc,	%i1,	%g5
	fmul8x16	%f31,	%f20,	%f18
	alignaddr	%g3,	%l0,	%g7
	ldsb	[%l7 + 0x57],	%l1
	orncc	%l3,	%g1,	%o6
	or	%i5,	%i7,	%o4
	fcmple16	%f16,	%f16,	%l4
	mulscc	%o5,	%i2,	%l2
	andn	%i4,	%g6,	%o1
	xor	%i0,	%o7,	%g4
	fmovdneg	%xcc,	%f30,	%f17
	sir	0x150D
	fnegs	%f15,	%f24
	edge32ln	%o2,	%i6,	%l6
	movn	%icc,	%o0,	%i3
	sdiv	%g2,	0x1D3D,	%l5
	ldsh	[%l7 + 0x76],	%i1
	movrgz	%g5,	0x0D5,	%o3
	fcmple32	%f12,	%f4,	%g3
	addccc	%l0,	0x0D28,	%l1
	movl	%icc,	%g7,	%g1
	fpackfix	%f30,	%f24
	alignaddr	%l3,	%i5,	%o6
	edge8ln	%o4,	%i7,	%l4
	movrlz	%o5,	0x086,	%l2
	fnot1s	%f8,	%f0
	edge32n	%i2,	%i4,	%o1
	sth	%i0,	[%l7 + 0x1A]
	ldd	[%l7 + 0x38],	%f16
	array8	%g6,	%o7,	%o2
	array8	%i6,	%l6,	%g4
	mulscc	%o0,	0x1591,	%i3
	movneg	%xcc,	%l5,	%g2
	nop
	set	0x66, %o7
	lduh	[%l7 + %o7],	%i1
	srlx	%g5,	%o3,	%g3
	srlx	%l0,	0x1D,	%g7
	stw	%g1,	[%l7 + 0x2C]
	sllx	%l1,	%l3,	%o6
	sir	0x1D52
	array16	%o4,	%i5,	%i7
	movrgz	%l4,	%o5,	%i2
	sll	%i4,	%o1,	%i0
	srlx	%l2,	%o7,	%o2
	movvc	%xcc,	%i6,	%g6
	movrlez	%l6,	%o0,	%g4
	sub	%l5,	%g2,	%i1
	fpsub32	%f10,	%f18,	%f22
	addc	%i3,	0x110B,	%g5
	smul	%o3,	0x0E20,	%l0
	xnor	%g3,	%g7,	%l1
	sethi	0x1E3D,	%l3
	lduh	[%l7 + 0x36],	%o6
	udivcc	%o4,	0x1388,	%i5
	umul	%g1,	0x1ABF,	%i7
	fmovsneg	%xcc,	%f22,	%f10
	fcmpeq32	%f22,	%f0,	%o5
	movl	%xcc,	%l4,	%i2
	fmovspos	%xcc,	%f20,	%f12
	movle	%xcc,	%o1,	%i0
	addc	%l2,	%i4,	%o7
	movrlez	%o2,	%i6,	%g6
	fnands	%f11,	%f23,	%f0
	edge32l	%o0,	%l6,	%l5
	fmovsle	%icc,	%f18,	%f20
	movvs	%xcc,	%g2,	%i1
	and	%i3,	%g5,	%g4
	movge	%icc,	%o3,	%g3
	movcs	%xcc,	%l0,	%g7
	udiv	%l3,	0x01E5,	%o6
	stw	%l1,	[%l7 + 0x70]
	mulscc	%i5,	%o4,	%i7
	srl	%o5,	0x04,	%g1
	sdivcc	%l4,	0x0681,	%o1
	fpsub32	%f24,	%f4,	%f26
	nop
	set	0x54, %i7
	stw	%i2,	[%l7 + %i7]
	std	%f4,	[%l7 + 0x70]
	sub	%l2,	0x0BE7,	%i4
	xorcc	%i0,	0x08E1,	%o2
	srl	%i6,	%g6,	%o7
	xnorcc	%o0,	0x1BC0,	%l6
	stw	%l5,	[%l7 + 0x20]
	sir	0x025C
	orcc	%i1,	0x10AC,	%i3
	fornot1	%f8,	%f14,	%f22
	fornot2	%f10,	%f8,	%f10
	umul	%g2,	0x17FE,	%g4
	popc	%g5,	%g3
	sdivcc	%o3,	0x0A0C,	%l0
	udivx	%l3,	0x00F5,	%g7
	andcc	%o6,	%i5,	%l1
	movcs	%xcc,	%i7,	%o5
	edge32	%o4,	%l4,	%g1
	siam	0x4
	udivx	%i2,	0x172C,	%l2
	movcs	%xcc,	%i4,	%o1
	fmovdne	%icc,	%f1,	%f20
	movrlz	%o2,	0x16A,	%i0
	movrgz	%g6,	%i6,	%o7
	ld	[%l7 + 0x2C],	%f6
	movrlez	%o0,	%l5,	%i1
	fmovrde	%i3,	%f30,	%f2
	lduh	[%l7 + 0x30],	%l6
	movne	%xcc,	%g2,	%g4
	edge32l	%g3,	%o3,	%l0
	fmovrsgez	%l3,	%f23,	%f4
	edge16ln	%g7,	%o6,	%i5
	movcs	%icc,	%l1,	%i7
	sth	%o5,	[%l7 + 0x0A]
	srlx	%g5,	0x12,	%o4
	sdivx	%g1,	0x171B,	%i2
	movg	%icc,	%l4,	%l2
	addc	%o1,	%o2,	%i4
	movrgz	%i0,	%g6,	%o7
	ldsb	[%l7 + 0x55],	%o0
	fmovde	%xcc,	%f13,	%f14
	edge16l	%l5,	%i1,	%i6
	mulscc	%i3,	%l6,	%g4
	fnot1	%f12,	%f22
	movcc	%xcc,	%g2,	%g3
	xorcc	%o3,	%l3,	%g7
	mulx	%o6,	%l0,	%i5
	fmul8x16au	%f16,	%f10,	%f18
	edge8	%i7,	%l1,	%g5
	lduh	[%l7 + 0x64],	%o5
	ldsw	[%l7 + 0x18],	%g1
	array32	%o4,	%i2,	%l4
	orncc	%o1,	%l2,	%o2
	movgu	%xcc,	%i0,	%i4
	xnor	%g6,	%o0,	%o7
	alignaddr	%i1,	%i6,	%i3
	fcmple16	%f14,	%f10,	%l5
	fmovdne	%icc,	%f30,	%f16
	mulscc	%g4,	%l6,	%g2
	movrgez	%o3,	0x1B9,	%l3
	fmovspos	%xcc,	%f10,	%f5
	fmovdvc	%xcc,	%f21,	%f19
	andn	%g7,	0x1649,	%o6
	ldsh	[%l7 + 0x10],	%g3
	stx	%i5,	[%l7 + 0x38]
	sth	%l0,	[%l7 + 0x24]
	popc	0x1BA8,	%l1
	movl	%icc,	%i7,	%g5
	movne	%xcc,	%g1,	%o4
	sth	%i2,	[%l7 + 0x1C]
	fmovrslz	%o5,	%f10,	%f8
	xorcc	%o1,	%l2,	%l4
	movneg	%icc,	%i0,	%o2
	movrgez	%g6,	0x3E9,	%i4
	movg	%icc,	%o7,	%i1
	sth	%o0,	[%l7 + 0x52]
	movne	%xcc,	%i3,	%l5
	edge32l	%g4,	%i6,	%l6
	edge32n	%o3,	%g2,	%g7
	udivcc	%l3,	0x0D3D,	%o6
	edge32	%g3,	%l0,	%i5
	save %i7, 0x1A53, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g1,	0x08,	%o4
	umul	%g5,	0x0ACF,	%i2
	srl	%o1,	0x17,	%o5
	fzeros	%f20
	sra	%l4,	%l2,	%i0
	std	%f8,	[%l7 + 0x68]
	alignaddrl	%g6,	%o2,	%i4
	fcmple32	%f4,	%f12,	%i1
	st	%f27,	[%l7 + 0x1C]
	movrlez	%o7,	%o0,	%l5
	movge	%xcc,	%i3,	%g4
	fmovsleu	%icc,	%f14,	%f19
	add	%l6,	0x1197,	%i6
	stx	%g2,	[%l7 + 0x60]
	movre	%g7,	0x1F1,	%o3
	edge16	%o6,	%g3,	%l3
	fnot2s	%f30,	%f2
	edge32ln	%i5,	%l0,	%i7
	fxnor	%f8,	%f20,	%f26
	ldsh	[%l7 + 0x44],	%g1
	ldsw	[%l7 + 0x20],	%o4
	movneg	%xcc,	%l1,	%g5
	movleu	%xcc,	%i2,	%o1
	andcc	%o5,	%l2,	%i0
	movrgez	%l4,	%o2,	%i4
	ld	[%l7 + 0x74],	%f23
	umul	%i1,	%g6,	%o0
	stb	%l5,	[%l7 + 0x20]
	fmovsvc	%xcc,	%f9,	%f27
	andn	%o7,	0x0A70,	%g4
	edge8n	%l6,	%i3,	%i6
	ld	[%l7 + 0x54],	%f17
	sll	%g7,	%o3,	%g2
	xnorcc	%g3,	%o6,	%i5
	movvs	%xcc,	%l3,	%l0
	fornot2	%f6,	%f16,	%f10
	xorcc	%g1,	0x1BB9,	%i7
	ld	[%l7 + 0x4C],	%f8
	fnot1s	%f21,	%f24
	st	%f5,	[%l7 + 0x14]
	and	%o4,	%l1,	%i2
	fmovdpos	%icc,	%f11,	%f0
	fmovrdne	%g5,	%f0,	%f12
	fxors	%f0,	%f17,	%f23
	movre	%o5,	0x094,	%o1
	movrgez	%l2,	0x00C,	%i0
	fpsub32s	%f16,	%f5,	%f26
	movg	%xcc,	%o2,	%l4
	fcmpeq32	%f16,	%f28,	%i1
	ld	[%l7 + 0x18],	%f7
	ldd	[%l7 + 0x78],	%i4
	movne	%xcc,	%g6,	%l5
	movrlz	%o7,	%g4,	%o0
	add	%i3,	0x0D85,	%l6
	movvc	%xcc,	%i6,	%g7
	fmuld8sux16	%f28,	%f3,	%f14
	edge8	%o3,	%g3,	%o6
	array8	%g2,	%l3,	%i5
	sir	0x0F17
	fmovrse	%g1,	%f31,	%f6
	movrgz	%l0,	%i7,	%l1
	fpack16	%f18,	%f11
	sth	%i2,	[%l7 + 0x42]
	xorcc	%o4,	%g5,	%o5
	mova	%icc,	%o1,	%l2
	ldd	[%l7 + 0x38],	%f22
	fnor	%f10,	%f18,	%f2
	stx	%i0,	[%l7 + 0x40]
	stx	%l4,	[%l7 + 0x60]
	sra	%o2,	%i1,	%g6
	and	%l5,	0x1496,	%o7
	edge32	%g4,	%o0,	%i4
	or	%l6,	0x008B,	%i6
	fnot2s	%f14,	%f0
	movvc	%xcc,	%i3,	%g7
	movcs	%icc,	%g3,	%o3
	stx	%g2,	[%l7 + 0x28]
	fands	%f1,	%f4,	%f26
	faligndata	%f22,	%f20,	%f0
	fexpand	%f20,	%f8
	popc	0x1626,	%o6
	fmovdgu	%xcc,	%f4,	%f2
	xnorcc	%l3,	0x0E35,	%g1
	fxor	%f8,	%f18,	%f10
	movneg	%icc,	%l0,	%i7
	ldx	[%l7 + 0x70],	%i5
	srlx	%l1,	0x0F,	%o4
	sdivx	%g5,	0x15AD,	%i2
	ld	[%l7 + 0x18],	%f26
	fmovdneg	%xcc,	%f11,	%f12
	ldd	[%l7 + 0x78],	%f8
	edge32	%o5,	%o1,	%i0
	andncc	%l4,	%o2,	%i1
	fmovsvc	%xcc,	%f18,	%f16
	orncc	%l2,	0x0A08,	%g6
	movrne	%o7,	%l5,	%o0
	fpadd32	%f30,	%f14,	%f6
	edge32ln	%i4,	%g4,	%i6
	movgu	%icc,	%l6,	%g7
	movg	%xcc,	%i3,	%g3
	sllx	%o3,	%o6,	%g2
	sll	%g1,	0x10,	%l3
	movcc	%xcc,	%l0,	%i5
	add	%i7,	0x1FED,	%l1
	ldsh	[%l7 + 0x54],	%o4
	movrgz	%g5,	%i2,	%o1
	ldd	[%l7 + 0x48],	%i0
	sth	%l4,	[%l7 + 0x12]
	stb	%o5,	[%l7 + 0x0C]
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	movrne	%g6,	%o7,	%l5
	fmovrde	%o0,	%f8,	%f0
	st	%f8,	[%l7 + 0x68]
	movl	%icc,	%i4,	%g4
	fcmped	%fcc1,	%f4,	%f28
	fcmpes	%fcc3,	%f13,	%f18
	fnegs	%f20,	%f10
	sub	%l2,	0x1051,	%i6
	nop
	set	0x60, %l4
	ldsw	[%l7 + %l4],	%g7
	edge32n	%i3,	%l6,	%g3
	fmul8x16al	%f0,	%f5,	%f6
	fxors	%f9,	%f15,	%f10
	fmovrsgz	%o6,	%f14,	%f10
	alignaddrl	%o3,	%g2,	%g1
	restore %l0, %i5, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f15,	%f12
	movrne	%l3,	0x30C,	%o4
	andcc	%g5,	0x0E35,	%i2
	orcc	%o1,	0x1D27,	%i0
	sub	%l1,	0x08CD,	%o5
	movpos	%xcc,	%i1,	%o2
	ldsb	[%l7 + 0x27],	%g6
	movneg	%xcc,	%o7,	%l4
	sir	0x1147
	mova	%icc,	%l5,	%o0
	edge32l	%g4,	%i4,	%i6
	edge16l	%l2,	%i3,	%l6
	orn	%g3,	0x04BA,	%g7
	save %o3, %g2, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%l0,	%i5
	movle	%icc,	%i7,	%l3
	movvc	%icc,	%o6,	%g5
	sub	%i2,	0x0060,	%o4
	save %o1, 0x19E6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o5,	%i1,	%i0
	add	%g6,	0x1110,	%o2
	fmovsle	%icc,	%f20,	%f31
	udivx	%o7,	0x16E8,	%l5
	bshuffle	%f4,	%f26,	%f16
	fcmped	%fcc1,	%f18,	%f2
	xnor	%o0,	0x104D,	%g4
	ldx	[%l7 + 0x08],	%l4
	xnor	%i6,	%l2,	%i3
	pdist	%f10,	%f14,	%f28
	subcc	%i4,	%g3,	%l6
	fpadd32s	%f11,	%f28,	%f8
	fones	%f4
	edge32n	%o3,	%g7,	%g1
	andcc	%g2,	%l0,	%i7
	movle	%icc,	%l3,	%o6
	mulscc	%g5,	%i2,	%o4
	movne	%xcc,	%o1,	%i5
	edge16n	%l1,	%o5,	%i0
	sub	%g6,	0x16B0,	%o2
	movgu	%xcc,	%o7,	%l5
	xor	%i1,	0x1308,	%o0
	lduh	[%l7 + 0x54],	%g4
	fmovd	%f26,	%f8
	or	%i6,	0x067B,	%l4
	ldsw	[%l7 + 0x2C],	%i3
	movn	%icc,	%l2,	%i4
	ldsb	[%l7 + 0x4A],	%g3
	xnor	%l6,	0x02C7,	%o3
	umul	%g7,	0x16E2,	%g1
	movleu	%icc,	%l0,	%g2
	edge32	%l3,	%i7,	%g5
	fmovrdne	%i2,	%f12,	%f10
	edge8	%o4,	%o1,	%i5
	movvc	%icc,	%o6,	%l1
	andn	%i0,	0x1956,	%o5
	smul	%g6,	0x05DB,	%o7
	st	%f7,	[%l7 + 0x28]
	alignaddrl	%l5,	%i1,	%o2
	fone	%f0
	ldsw	[%l7 + 0x1C],	%o0
	edge32ln	%g4,	%i6,	%l4
	movvc	%icc,	%l2,	%i3
	array32	%i4,	%g3,	%o3
	fmovdgu	%xcc,	%f17,	%f29
	ldd	[%l7 + 0x18],	%f28
	subcc	%g7,	%g1,	%l0
	ld	[%l7 + 0x34],	%f0
	fnot1	%f18,	%f22
	fmovsgu	%xcc,	%f2,	%f16
	udivcc	%l6,	0x0934,	%l3
	movrlz	%i7,	%g5,	%i2
	popc	%o4,	%o1
	stw	%g2,	[%l7 + 0x5C]
	andncc	%i5,	%l1,	%o6
	movgu	%xcc,	%i0,	%g6
	edge16ln	%o7,	%o5,	%i1
	ldx	[%l7 + 0x60],	%o2
	orncc	%o0,	%g4,	%l5
	array8	%l4,	%i6,	%i3
	smul	%l2,	0x097A,	%i4
	srlx	%g3,	%g7,	%o3
	srax	%g1,	0x10,	%l0
	srl	%l6,	0x0D,	%l3
	fornot2	%f26,	%f6,	%f24
	fmovdgu	%xcc,	%f0,	%f7
	array16	%g5,	%i7,	%o4
	alignaddr	%i2,	%o1,	%g2
	orcc	%i5,	%l1,	%i0
	or	%o6,	%g6,	%o5
	and	%i1,	%o2,	%o0
	andn	%o7,	0x1544,	%g4
	fcmpd	%fcc1,	%f12,	%f16
	fmovrdne	%l4,	%f26,	%f2
	movre	%i6,	0x008,	%i3
	movneg	%xcc,	%l5,	%l2
	siam	0x0
	fmovrslez	%i4,	%f6,	%f22
	andcc	%g3,	0x0D5E,	%o3
	movvc	%xcc,	%g1,	%l0
	movcc	%xcc,	%g7,	%l6
	edge32	%l3,	%g5,	%o4
	save %i2, %o1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i5,	%l1,	%i0
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	alignaddrl	%i1,	%o2,	%o0
	movrne	%g6,	0x171,	%g4
	fcmpeq16	%f2,	%f18,	%l4
	umul	%o7,	%i3,	%i6
	andcc	%l2,	0x09CF,	%i4
	stw	%l5,	[%l7 + 0x34]
	orncc	%o3,	%g1,	%g3
	ldub	[%l7 + 0x3D],	%g7
	ldsb	[%l7 + 0x56],	%l6
	fmovspos	%xcc,	%f28,	%f29
	fmovdge	%icc,	%f22,	%f2
	fmovrde	%l0,	%f20,	%f2
	stb	%l3,	[%l7 + 0x29]
	fmovsl	%xcc,	%f12,	%f17
	fcmpne32	%f18,	%f8,	%o4
	movrlez	%g5,	%o1,	%i2
	sethi	0x0B89,	%g2
	pdist	%f6,	%f24,	%f24
	fand	%f0,	%f10,	%f20
	fandnot2s	%f25,	%f3,	%f20
	andcc	%i5,	%i0,	%l1
	edge8	%i7,	%o5,	%o6
	movrgez	%o2,	%o0,	%g6
	array8	%g4,	%l4,	%i1
	mova	%xcc,	%o7,	%i3
	sdivcc	%i6,	0x17F5,	%i4
	movcs	%xcc,	%l2,	%o3
	movge	%icc,	%l5,	%g3
	fnot2s	%f11,	%f14
	stw	%g1,	[%l7 + 0x5C]
	fmovrdlz	%l6,	%f2,	%f14
	add	%l0,	0x1316,	%g7
	sir	0x1D51
	fcmple32	%f24,	%f20,	%l3
	fcmpgt16	%f4,	%f8,	%g5
	sra	%o1,	%o4,	%i2
	movrgez	%g2,	%i0,	%i5
	orn	%l1,	0x036C,	%i7
	xor	%o5,	%o6,	%o2
	movg	%xcc,	%g6,	%g4
	sethi	0x18E1,	%o0
	mulscc	%i1,	0x1ADF,	%l4
	movvc	%xcc,	%i3,	%o7
	sll	%i6,	0x17,	%i4
	edge32	%o3,	%l2,	%l5
	andcc	%g1,	0x0F56,	%l6
	sra	%g3,	%g7,	%l0
	ldd	[%l7 + 0x78],	%l2
	fmovrde	%o1,	%f18,	%f0
	fnor	%f22,	%f0,	%f26
	movl	%xcc,	%g5,	%o4
	edge8n	%g2,	%i2,	%i0
	mulscc	%l1,	%i7,	%o5
	xorcc	%o6,	%o2,	%i5
	sethi	0x1F84,	%g6
	restore %o0, %g4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i1,	0x0A7A,	%o7
	fmovsleu	%xcc,	%f27,	%f14
	edge16n	%i6,	%i3,	%i4
	movge	%icc,	%l2,	%l5
	edge32l	%o3,	%g1,	%l6
	edge16n	%g7,	%l0,	%l3
	fnegs	%f18,	%f10
	ldd	[%l7 + 0x10],	%f30
	move	%xcc,	%o1,	%g5
	lduh	[%l7 + 0x16],	%o4
	fmul8sux16	%f24,	%f20,	%f18
	sdivcc	%g2,	0x1B46,	%i2
	fcmpgt16	%f16,	%f12,	%i0
	fmovrdgez	%l1,	%f12,	%f0
	edge16n	%i7,	%o5,	%g3
	edge32ln	%o6,	%o2,	%g6
	add	%i5,	0x13F5,	%g4
	lduw	[%l7 + 0x30],	%o0
	edge8	%l4,	%o7,	%i1
	edge32n	%i6,	%i3,	%i4
	sll	%l5,	%o3,	%g1
	stx	%l2,	[%l7 + 0x10]
	fandnot1s	%f7,	%f27,	%f4
	std	%f0,	[%l7 + 0x08]
	sll	%g7,	%l6,	%l3
	fand	%f22,	%f16,	%f12
	sllx	%o1,	0x0F,	%g5
	edge16	%l0,	%o4,	%g2
	fcmped	%fcc0,	%f0,	%f26
	fmovdvs	%icc,	%f14,	%f25
	movleu	%icc,	%i0,	%i2
	xor	%i7,	0x03B5,	%l1
	ldsw	[%l7 + 0x18],	%g3
	array32	%o5,	%o6,	%g6
	fmovdne	%xcc,	%f22,	%f31
	alignaddr	%o2,	%g4,	%i5
	xorcc	%l4,	0x0374,	%o7
	movcc	%icc,	%i1,	%o0
	std	%f0,	[%l7 + 0x28]
	ldd	[%l7 + 0x50],	%i6
	srax	%i3,	%i4,	%o3
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	movre	%g7,	0x071,	%l2
	ld	[%l7 + 0x20],	%f15
	smul	%l3,	%l6,	%g5
	fsrc2	%f26,	%f14
	edge32ln	%l0,	%o4,	%o1
	movgu	%icc,	%g2,	%i0
	sllx	%i7,	%i2,	%g3
	orcc	%o5,	0x04F4,	%o6
	movneg	%icc,	%l1,	%o2
	movn	%icc,	%g4,	%i5
	or	%l4,	0x024F,	%o7
	umul	%i1,	0x08D7,	%o0
	mulx	%g6,	%i3,	%i4
	andn	%i6,	%o3,	%l5
	fmovsne	%icc,	%f6,	%f5
	movrlez	%g1,	0x3BA,	%g7
	ldd	[%l7 + 0x48],	%l2
	fxors	%f25,	%f20,	%f17
	fmovs	%f1,	%f28
	edge8ln	%l2,	%g5,	%l0
	fpsub16	%f2,	%f0,	%f22
	srlx	%l6,	%o1,	%g2
	ldx	[%l7 + 0x18],	%i0
	addccc	%o4,	0x09F3,	%i2
	edge32ln	%i7,	%o5,	%o6
	fcmpne16	%f10,	%f22,	%l1
	fmovrde	%o2,	%f30,	%f30
	fcmpgt16	%f2,	%f0,	%g4
	addc	%i5,	%g3,	%l4
	fmul8x16au	%f15,	%f5,	%f30
	mova	%icc,	%i1,	%o7
	edge8ln	%g6,	%i3,	%o0
	move	%icc,	%i4,	%i6
	fsrc2s	%f9,	%f5
	udivcc	%o3,	0x07E7,	%l5
	subccc	%g1,	0x091C,	%g7
	fmovsn	%xcc,	%f11,	%f27
	movge	%xcc,	%l2,	%g5
	sll	%l3,	0x06,	%l0
	subcc	%l6,	%o1,	%g2
	edge16ln	%o4,	%i2,	%i0
	movrlz	%o5,	%i7,	%o6
	fmovspos	%xcc,	%f9,	%f19
	fmovsn	%icc,	%f14,	%f25
	alignaddr	%l1,	%o2,	%i5
	for	%f24,	%f2,	%f16
	movvs	%icc,	%g3,	%g4
	mulx	%i1,	0x0B39,	%o7
	bshuffle	%f0,	%f12,	%f10
	umul	%g6,	0x09C8,	%l4
	popc	0x081D,	%o0
	movvs	%xcc,	%i4,	%i3
	ldd	[%l7 + 0x40],	%i6
	fmovsneg	%xcc,	%f23,	%f10
	orncc	%l5,	%g1,	%g7
	smul	%o3,	%l2,	%l3
	srlx	%g5,	%l6,	%o1
	sdiv	%g2,	0x1C19,	%o4
	edge8ln	%l0,	%i0,	%i2
	addccc	%i7,	0x1495,	%o6
	fxnor	%f10,	%f6,	%f16
	udiv	%o5,	0x0437,	%o2
	save %i5, %g3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%l1,	%i1
	alignaddrl	%o7,	%g6,	%l4
	std	%f28,	[%l7 + 0x38]
	edge32n	%o0,	%i3,	%i4
	movpos	%xcc,	%l5,	%g1
	fcmpgt32	%f14,	%f20,	%i6
	addc	%o3,	%l2,	%g7
	sdivx	%g5,	0x0897,	%l6
	xnorcc	%l3,	0x0D8F,	%g2
	movrlz	%o1,	0x27F,	%l0
	stw	%o4,	[%l7 + 0x14]
	smul	%i2,	0x0FC3,	%i0
	fzeros	%f3
	ldsh	[%l7 + 0x5C],	%i7
	movvs	%icc,	%o6,	%o5
	udivcc	%i5,	0x0F0A,	%g3
	lduh	[%l7 + 0x72],	%o2
	movleu	%icc,	%g4,	%i1
	stx	%o7,	[%l7 + 0x20]
	movrne	%l1,	0x34A,	%g6
	edge8l	%l4,	%i3,	%o0
	orcc	%i4,	%l5,	%g1
	faligndata	%f30,	%f12,	%f18
	movne	%icc,	%o3,	%l2
	srax	%i6,	%g5,	%l6
	lduw	[%l7 + 0x40],	%l3
	alignaddrl	%g2,	%g7,	%l0
	addcc	%o4,	%o1,	%i2
	movrlez	%i7,	0x06A,	%i0
	fcmple16	%f10,	%f4,	%o5
	xnor	%o6,	%i5,	%g3
	edge32	%o2,	%g4,	%o7
	ldd	[%l7 + 0x40],	%l0
	fxor	%f8,	%f30,	%f14
	movn	%xcc,	%i1,	%g6
	fmovsvs	%xcc,	%f11,	%f14
	sdivcc	%i3,	0x057E,	%o0
	andncc	%l4,	%i4,	%l5
	edge8l	%o3,	%g1,	%l2
	movge	%icc,	%i6,	%g5
	fxors	%f31,	%f25,	%f19
	addc	%l3,	0x012B,	%g2
	or	%g7,	%l6,	%o4
	mulscc	%l0,	0x1482,	%i2
	save %i7, %o1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f6,	%f30,	%o5
	or	%o6,	%i5,	%g3
	movrgz	%g4,	%o2,	%o7
	fand	%f26,	%f12,	%f24
	move	%icc,	%i1,	%g6
	movrgz	%l1,	0x0BD,	%o0
	xor	%l4,	%i3,	%l5
	addc	%i4,	0x0E3C,	%o3
	movrlez	%g1,	0x1E6,	%i6
	xor	%l2,	%l3,	%g5
	fornot1	%f28,	%f10,	%f0
	fcmple16	%f10,	%f22,	%g2
	movl	%xcc,	%g7,	%o4
	ldsh	[%l7 + 0x48],	%l0
	fxnors	%f3,	%f17,	%f24
	edge8ln	%i2,	%l6,	%o1
	srl	%i0,	0x09,	%i7
	alignaddr	%o6,	%i5,	%o5
	ldd	[%l7 + 0x20],	%g2
	xnorcc	%o2,	0x0FA5,	%o7
	lduh	[%l7 + 0x74],	%g4
	edge8	%g6,	%i1,	%o0
	ldd	[%l7 + 0x50],	%l0
	lduh	[%l7 + 0x46],	%l4
	sethi	0x0A40,	%l5
	movle	%icc,	%i3,	%o3
	movne	%xcc,	%i4,	%g1
	popc	%l2,	%l3
	st	%f6,	[%l7 + 0x08]
	addccc	%i6,	%g5,	%g2
	edge8	%o4,	%l0,	%i2
	edge16	%g7,	%l6,	%i0
	fcmpne32	%f16,	%f28,	%o1
	fxnors	%f4,	%f16,	%f30
	fmovdg	%icc,	%f15,	%f3
	sub	%i7,	0x177F,	%o6
	nop
	set	0x18, %l5
	ldx	[%l7 + %l5],	%o5
	movle	%xcc,	%g3,	%o2
	smul	%o7,	0x1392,	%g4
	fmovdcc	%xcc,	%f6,	%f15
	edge8l	%i5,	%i1,	%o0
	ldsb	[%l7 + 0x4B],	%l1
	movpos	%icc,	%g6,	%l5
	ldub	[%l7 + 0x65],	%l4
	movleu	%xcc,	%i3,	%i4
	edge32ln	%g1,	%o3,	%l2
	fpadd32s	%f8,	%f31,	%f27
	lduh	[%l7 + 0x52],	%l3
	sdiv	%g5,	0x108C,	%i6
	srl	%g2,	0x18,	%o4
	fornot2	%f30,	%f28,	%f10
	xnor	%l0,	%i2,	%l6
	edge16n	%i0,	%g7,	%o1
	subcc	%o6,	%o5,	%i7
	srax	%g3,	0x00,	%o7
	movpos	%xcc,	%g4,	%i5
	movleu	%xcc,	%i1,	%o2
	addccc	%o0,	%l1,	%g6
	ldd	[%l7 + 0x60],	%l4
	sra	%l5,	0x00,	%i3
	sth	%g1,	[%l7 + 0x0C]
	fabsd	%f2,	%f28
	fmovsgu	%xcc,	%f20,	%f23
	fpsub16s	%f20,	%f17,	%f4
	lduw	[%l7 + 0x44],	%o3
	smul	%l2,	0x1772,	%i4
	xnorcc	%g5,	%l3,	%i6
	addc	%g2,	0x0174,	%l0
	fmovsl	%icc,	%f19,	%f19
	sra	%i2,	0x1D,	%l6
	mulscc	%i0,	0x1606,	%o4
	fmovrsne	%o1,	%f5,	%f6
	movre	%g7,	%o5,	%o6
	srl	%g3,	0x09,	%i7
	addc	%o7,	0x0F46,	%i5
	udiv	%i1,	0x1124,	%g4
	movne	%icc,	%o2,	%o0
	movg	%xcc,	%l1,	%g6
	subc	%l4,	0x1CE2,	%l5
	fmovrse	%i3,	%f17,	%f1
	fnot1	%f4,	%f0
	movleu	%icc,	%o3,	%l2
	fcmple16	%f24,	%f18,	%i4
	sll	%g5,	%g1,	%l3
	edge16	%g2,	%l0,	%i2
	std	%f16,	[%l7 + 0x10]
	fcmpgt32	%f24,	%f0,	%i6
	sll	%l6,	%o4,	%i0
	fmovdvc	%icc,	%f0,	%f29
	fnegs	%f14,	%f11
	edge8n	%g7,	%o5,	%o1
	sll	%o6,	%g3,	%i7
	movcs	%xcc,	%o7,	%i1
	fornot1s	%f8,	%f24,	%f29
	restore %g4, %i5, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%l1,	%f17,	%f31
	sdiv	%o0,	0x0680,	%l4
	movvc	%icc,	%g6,	%l5
	fmovrsgz	%o3,	%f22,	%f21
	movle	%icc,	%i3,	%i4
	stw	%l2,	[%l7 + 0x38]
	edge16ln	%g1,	%l3,	%g2
	sll	%g5,	0x13,	%l0
	ldd	[%l7 + 0x78],	%f30
	fpmerge	%f20,	%f10,	%f28
	fandnot1	%f24,	%f24,	%f18
	fmovda	%icc,	%f11,	%f27
	fmovsg	%icc,	%f26,	%f21
	ldsh	[%l7 + 0x7A],	%i6
	fmovrdgez	%i2,	%f20,	%f0
	subccc	%l6,	%i0,	%o4
	sethi	0x0C2D,	%g7
	ldsw	[%l7 + 0x6C],	%o1
	mova	%xcc,	%o6,	%g3
	fnegs	%f15,	%f3
	umul	%i7,	0x0C49,	%o5
	movneg	%xcc,	%o7,	%i1
	umulcc	%i5,	%o2,	%l1
	stx	%g4,	[%l7 + 0x40]
	andn	%o0,	0x0DB8,	%l4
	fmovdneg	%xcc,	%f20,	%f16
	movvs	%xcc,	%g6,	%o3
	sra	%l5,	%i4,	%i3
	fcmpgt32	%f16,	%f4,	%l2
	movrne	%g1,	%g2,	%g5
	fpsub16s	%f15,	%f19,	%f10
	smul	%l0,	%i6,	%i2
	lduw	[%l7 + 0x68],	%l3
	lduh	[%l7 + 0x0C],	%l6
	subccc	%i0,	0x0035,	%o4
	andn	%o1,	0x0C89,	%o6
	mulx	%g3,	0x088B,	%i7
	xnor	%o5,	%o7,	%i1
	umul	%i5,	%o2,	%g7
	movn	%icc,	%l1,	%g4
	lduh	[%l7 + 0x22],	%o0
	fpsub32s	%f11,	%f27,	%f25
	array32	%g6,	%o3,	%l4
	nop
	set	0x20, %l1
	ldx	[%l7 + %l1],	%i4
	edge8l	%i3,	%l5,	%l2
	smulcc	%g1,	%g2,	%g5
	addcc	%i6,	0x1064,	%i2
	and	%l0,	0x139F,	%l6
	xnor	%l3,	%o4,	%o1
	udivx	%i0,	0x0204,	%g3
	movneg	%icc,	%i7,	%o5
	srax	%o6,	0x12,	%i1
	sllx	%i5,	0x02,	%o2
	fmovdn	%icc,	%f12,	%f17
	fmovrse	%g7,	%f14,	%f5
	addcc	%l1,	%g4,	%o7
	movvc	%icc,	%o0,	%g6
	srax	%o3,	%l4,	%i3
	subc	%l5,	%i4,	%l2
	movg	%xcc,	%g2,	%g1
	fornot1	%f6,	%f18,	%f14
	edge8ln	%g5,	%i6,	%i2
	ld	[%l7 + 0x68],	%f22
	orcc	%l0,	0x1E1F,	%l3
	fpadd32s	%f22,	%f15,	%f27
	fmovsg	%xcc,	%f27,	%f12
	fmuld8sux16	%f1,	%f19,	%f16
	ldsb	[%l7 + 0x51],	%l6
	subc	%o4,	%o1,	%i0
	fmovdvc	%xcc,	%f7,	%f8
	lduw	[%l7 + 0x78],	%i7
	mulx	%o5,	0x14E7,	%o6
	edge32ln	%i1,	%g3,	%i5
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	lduh	[%l7 + 0x64],	%o2
	pdist	%f0,	%f16,	%f18
	save %o0, 0x047D, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g6,	%o3,	%l4
	ldd	[%l7 + 0x60],	%l4
	edge32	%i3,	%l2,	%i4
	movl	%xcc,	%g2,	%g1
	movrgez	%i6,	%i2,	%l0
	xnor	%g5,	0x1CCD,	%l6
	ldsb	[%l7 + 0x60],	%o4
	fnot1s	%f1,	%f2
	move	%xcc,	%o1,	%l3
	edge16	%i7,	%i0,	%o6
	udiv	%i1,	0x1AB6,	%g3
	movrgez	%o5,	%i5,	%g7
	srl	%g4,	0x0E,	%l1
	orn	%o0,	0x02A6,	%o2
	fmul8ulx16	%f12,	%f26,	%f20
	movrlez	%o7,	0x2D7,	%o3
	st	%f1,	[%l7 + 0x40]
	mulx	%g6,	0x1B8C,	%l4
	movge	%xcc,	%i3,	%l5
	fmovdle	%icc,	%f12,	%f2
	addccc	%l2,	0x03F1,	%i4
	umulcc	%g1,	0x0350,	%g2
	fxor	%f16,	%f24,	%f18
	edge16ln	%i2,	%i6,	%g5
	fmovsvs	%xcc,	%f19,	%f30
	smulcc	%l6,	%l0,	%o1
	movrgz	%o4,	%i7,	%l3
	edge16ln	%i0,	%i1,	%g3
	fcmpes	%fcc1,	%f31,	%f9
	movpos	%xcc,	%o5,	%i5
	siam	0x7
	for	%f12,	%f28,	%f0
	sra	%o6,	%g7,	%l1
	fornot1s	%f21,	%f13,	%f16
	movrlez	%o0,	%o2,	%g4
	stw	%o3,	[%l7 + 0x08]
	fabsd	%f6,	%f10
	fmovrslz	%g6,	%f24,	%f17
	fmuld8ulx16	%f8,	%f17,	%f20
	fsrc2s	%f16,	%f25
	orcc	%l4,	0x0FEC,	%i3
	movrlez	%o7,	%l2,	%l5
	smul	%g1,	%i4,	%i2
	edge16	%i6,	%g5,	%l6
	ldub	[%l7 + 0x75],	%l0
	mova	%icc,	%g2,	%o1
	ld	[%l7 + 0x64],	%f28
	sdivcc	%o4,	0x0CBE,	%i7
	edge16n	%l3,	%i0,	%i1
	sub	%o5,	0x020C,	%i5
	nop
	set	0x08, %o2
	stw	%o6,	[%l7 + %o2]
	movl	%xcc,	%g3,	%g7
	udivcc	%l1,	0x0FDD,	%o0
	ldsw	[%l7 + 0x40],	%g4
	edge8n	%o2,	%o3,	%l4
	fsrc2	%f16,	%f14
	edge32n	%i3,	%o7,	%g6
	ldx	[%l7 + 0x58],	%l5
	fzero	%f30
	stx	%g1,	[%l7 + 0x08]
	edge16l	%l2,	%i4,	%i2
	lduw	[%l7 + 0x4C],	%i6
	subcc	%l6,	%g5,	%l0
	edge8n	%o1,	%g2,	%i7
	addccc	%l3,	0x0A47,	%o4
	fpadd16s	%f18,	%f8,	%f5
	fsrc2	%f30,	%f2
	movge	%icc,	%i1,	%o5
	ldd	[%l7 + 0x60],	%f24
	movneg	%xcc,	%i5,	%o6
	fnot1	%f22,	%f12
	ldd	[%l7 + 0x58],	%f20
	fpadd32	%f28,	%f8,	%f26
	sra	%i0,	0x18,	%g3
	add	%l1,	%g7,	%o0
	andcc	%o2,	0x1410,	%g4
	umulcc	%o3,	%l4,	%o7
	movrlz	%i3,	%g6,	%g1
	srax	%l2,	0x18,	%i4
	array8	%l5,	%i2,	%i6
	udivx	%g5,	0x01DB,	%l0
	ldd	[%l7 + 0x38],	%o0
	edge32l	%g2,	%i7,	%l3
	fmovd	%f24,	%f14
	orncc	%o4,	0x0511,	%i1
	fmovrdlez	%o5,	%f0,	%f4
	fpadd32s	%f10,	%f3,	%f24
	siam	0x0
	smulcc	%i5,	%o6,	%l6
	ldd	[%l7 + 0x70],	%f10
	mova	%icc,	%g3,	%i0
	edge32n	%g7,	%o0,	%o2
	stb	%l1,	[%l7 + 0x0B]
	umulcc	%g4,	%l4,	%o3
	movvs	%xcc,	%o7,	%g6
	and	%i3,	0x117F,	%l2
	movgu	%icc,	%i4,	%l5
	movvc	%xcc,	%g1,	%i6
	mulx	%g5,	0x00B9,	%i2
	movrlez	%o1,	0x15B,	%l0
	fcmpne32	%f4,	%f30,	%i7
	array8	%g2,	%l3,	%i1
	nop
	set	0x0C, %o3
	lduh	[%l7 + %o3],	%o5
	stb	%i5,	[%l7 + 0x77]
	movpos	%xcc,	%o4,	%l6
	fandnot1s	%f14,	%f23,	%f16
	fmovsge	%icc,	%f2,	%f12
	movgu	%xcc,	%o6,	%i0
	movg	%xcc,	%g3,	%o0
	movg	%xcc,	%o2,	%l1
	sdivx	%g4,	0x1AD1,	%l4
	edge32l	%g7,	%o3,	%g6
	sub	%o7,	0x08F5,	%l2
	fsrc2s	%f26,	%f14
	fmul8x16	%f17,	%f26,	%f22
	movrgz	%i3,	%l5,	%i4
	edge8n	%g1,	%g5,	%i6
	movne	%xcc,	%i2,	%o1
	popc	0x09FB,	%i7
	umul	%g2,	%l0,	%i1
	edge8	%o5,	%i5,	%l3
	or	%l6,	0x1726,	%o6
	fmovsneg	%xcc,	%f25,	%f7
	edge32ln	%i0,	%o4,	%g3
	fmul8ulx16	%f18,	%f12,	%f12
	fmovsvc	%xcc,	%f1,	%f10
	or	%o0,	%l1,	%o2
	umulcc	%l4,	%g4,	%g7
	addccc	%g6,	0x093B,	%o7
	lduh	[%l7 + 0x6E],	%o3
	fsrc1s	%f4,	%f4
	sub	%l2,	%i3,	%l5
	edge16ln	%i4,	%g1,	%g5
	smul	%i6,	0x0EFF,	%i2
	edge32ln	%i7,	%o1,	%l0
	mova	%xcc,	%i1,	%o5
	fmovrdlz	%g2,	%f0,	%f24
	sdivcc	%l3,	0x12FD,	%l6
	edge16l	%o6,	%i5,	%i0
	fnot2s	%f21,	%f27
	fmovde	%icc,	%f7,	%f15
	subc	%o4,	%o0,	%l1
	orn	%o2,	0x03C3,	%g3
	mulscc	%g4,	0x0F1C,	%l4
	fcmps	%fcc3,	%f5,	%f13
	movrlz	%g7,	0x05B,	%g6
	movrgz	%o3,	%l2,	%o7
	mulscc	%l5,	%i4,	%i3
	xor	%g5,	%i6,	%g1
	orncc	%i7,	0x1909,	%o1
	movvc	%xcc,	%l0,	%i1
	movgu	%icc,	%o5,	%i2
	edge8	%g2,	%l3,	%o6
	sdivx	%i5,	0x1832,	%i0
	edge32l	%o4,	%o0,	%l1
	or	%l6,	0x03AE,	%g3
	sir	0x16D4
	fzeros	%f20
	fmuld8ulx16	%f27,	%f27,	%f2
	movg	%icc,	%o2,	%l4
	subccc	%g4,	%g7,	%g6
	udiv	%o3,	0x16A7,	%l2
	movle	%xcc,	%l5,	%i4
	orcc	%o7,	0x1CEF,	%g5
	edge32n	%i6,	%g1,	%i3
	orn	%o1,	0x0830,	%l0
	edge8ln	%i7,	%o5,	%i1
	fmovrdgez	%g2,	%f24,	%f12
	movcc	%xcc,	%i2,	%l3
	fornot1	%f28,	%f30,	%f18
	sdiv	%i5,	0x00F3,	%i0
	orn	%o4,	0x0CA1,	%o0
	ldx	[%l7 + 0x20],	%o6
	movvs	%xcc,	%l1,	%l6
	fnot2	%f0,	%f6
	fmovsge	%xcc,	%f3,	%f14
	edge16l	%g3,	%o2,	%g4
	fmovrdne	%g7,	%f2,	%f18
	ldd	[%l7 + 0x78],	%f6
	fmovdl	%xcc,	%f25,	%f4
	umulcc	%l4,	0x10DC,	%o3
	edge8ln	%l2,	%g6,	%i4
	fmovrslez	%l5,	%f3,	%f12
	alignaddrl	%g5,	%o7,	%g1
	sth	%i6,	[%l7 + 0x2E]
	srlx	%i3,	0x15,	%o1
	alignaddr	%l0,	%o5,	%i7
	std	%f12,	[%l7 + 0x50]
	fmul8x16	%f28,	%f24,	%f24
	fmovrslez	%i1,	%f5,	%f23
	sub	%i2,	0x1851,	%l3
	srlx	%g2,	%i5,	%i0
	fxor	%f4,	%f18,	%f12
	fnor	%f26,	%f16,	%f18
	srl	%o0,	0x0D,	%o4
	fcmpgt16	%f22,	%f0,	%l1
	edge16l	%l6,	%g3,	%o2
	movleu	%icc,	%o6,	%g4
	ldsw	[%l7 + 0x68],	%g7
	andn	%l4,	%o3,	%l2
	array16	%i4,	%l5,	%g6
	ldd	[%l7 + 0x40],	%f30
	sll	%o7,	%g5,	%g1
	nop
	set	0x3C, %o6
	ldsw	[%l7 + %o6],	%i6
	ldsb	[%l7 + 0x30],	%i3
	fsrc1	%f16,	%f8
	save %l0, %o1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f26,	%f30,	%f30
	edge32	%i1,	%o5,	%l3
	smulcc	%i2,	%g2,	%i0
	smul	%o0,	0x18EF,	%o4
	umul	%l1,	%l6,	%i5
	lduh	[%l7 + 0x72],	%g3
	and	%o2,	%g4,	%o6
	sdivcc	%l4,	0x12B7,	%o3
	add	%g7,	%l2,	%i4
	xnor	%l5,	0x0DDA,	%g6
	andn	%o7,	%g5,	%i6
	stx	%g1,	[%l7 + 0x28]
	movre	%i3,	0x363,	%o1
	movpos	%xcc,	%i7,	%l0
	movg	%xcc,	%o5,	%l3
	movrlz	%i1,	%i2,	%g2
	edge32ln	%i0,	%o4,	%l1
	edge32ln	%l6,	%o0,	%i5
	array8	%o2,	%g4,	%g3
	orn	%l4,	0x19FB,	%o6
	popc	0x1E8A,	%o3
	edge32l	%g7,	%i4,	%l5
	sdivcc	%g6,	0x1B4F,	%o7
	mulx	%l2,	%g5,	%g1
	ldub	[%l7 + 0x11],	%i3
	sub	%i6,	0x0134,	%i7
	restore %o1, 0x1F39, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l3,	0x177A,	%l0
	udiv	%i1,	0x0B5D,	%i2
	mova	%icc,	%i0,	%o4
	move	%xcc,	%l1,	%l6
	stw	%g2,	[%l7 + 0x64]
	fmovrde	%o0,	%f2,	%f16
	sir	0x1415
	sll	%i5,	0x13,	%g4
	movrlz	%o2,	0x38D,	%g3
	fsrc2s	%f28,	%f18
	ld	[%l7 + 0x5C],	%f7
	fxors	%f2,	%f0,	%f17
	movrgz	%o6,	0x039,	%o3
	array32	%g7,	%l4,	%l5
	edge8	%g6,	%i4,	%o7
	edge8l	%l2,	%g5,	%g1
	ldx	[%l7 + 0x40],	%i6
	srl	%i3,	%o1,	%o5
	ldd	[%l7 + 0x38],	%l2
	edge8n	%l0,	%i7,	%i2
	array16	%i0,	%i1,	%o4
	alignaddrl	%l1,	%g2,	%o0
	fmovdg	%icc,	%f10,	%f17
	fcmpne32	%f22,	%f28,	%i5
	array32	%l6,	%g4,	%g3
	fmovscs	%xcc,	%f23,	%f16
	lduw	[%l7 + 0x70],	%o2
	lduh	[%l7 + 0x56],	%o3
	nop
	set	0x53, %o4
	stb	%o6,	[%l7 + %o4]
	edge32ln	%g7,	%l5,	%l4
	fors	%f28,	%f3,	%f7
	st	%f23,	[%l7 + 0x10]
	fxor	%f16,	%f30,	%f22
	movne	%icc,	%g6,	%i4
	fone	%f16
	mulx	%l2,	0x1411,	%o7
	xnor	%g1,	%i6,	%g5
	fnor	%f0,	%f20,	%f18
	movrlz	%o1,	0x3FF,	%i3
	array32	%l3,	%l0,	%o5
	sra	%i7,	0x0B,	%i2
	movne	%xcc,	%i1,	%i0
	edge16ln	%o4,	%l1,	%g2
	xnor	%i5,	%l6,	%g4
	movre	%g3,	%o0,	%o2
	fand	%f26,	%f22,	%f22
	edge8ln	%o3,	%g7,	%l5
	subccc	%l4,	%g6,	%i4
	movle	%xcc,	%l2,	%o7
	sir	0x10F9
	movleu	%icc,	%g1,	%i6
	lduh	[%l7 + 0x7A],	%g5
	fandnot1	%f30,	%f12,	%f26
	stw	%o6,	[%l7 + 0x4C]
	fmovrsgez	%i3,	%f1,	%f24
	movrlz	%l3,	%o1,	%o5
	movrgez	%l0,	%i7,	%i2
	edge8n	%i0,	%o4,	%i1
	movvc	%icc,	%l1,	%g2
	sllx	%i5,	%g4,	%g3
	udivcc	%o0,	0x1AD1,	%l6
	movle	%icc,	%o3,	%g7
	udivcc	%o2,	0x15B6,	%l5
	edge8	%l4,	%i4,	%l2
	fsrc1s	%f25,	%f8
	fmovdleu	%icc,	%f20,	%f24
	fmovspos	%xcc,	%f12,	%f19
	ldx	[%l7 + 0x48],	%g6
	movrlz	%g1,	0x279,	%i6
	st	%f2,	[%l7 + 0x48]
	addccc	%o7,	%o6,	%i3
	orncc	%g5,	%o1,	%o5
	ldub	[%l7 + 0x7C],	%l3
	andncc	%l0,	%i7,	%i0
	movcs	%icc,	%o4,	%i2
	fmovsa	%icc,	%f0,	%f16
	movle	%icc,	%i1,	%g2
	fpack32	%f22,	%f28,	%f14
	fmovdg	%xcc,	%f11,	%f6
	edge32n	%i5,	%l1,	%g3
	alignaddrl	%o0,	%g4,	%l6
	sra	%o3,	0x0E,	%o2
	edge32l	%l5,	%l4,	%g7
	save %l2, %g6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f16,	%f12,	%f4
	fmovrslz	%i4,	%f0,	%f23
	array16	%o7,	%o6,	%i3
	xnorcc	%g5,	0x1056,	%o1
	movcs	%icc,	%i6,	%l3
	edge32	%o5,	%i7,	%l0
	edge8n	%i0,	%i2,	%i1
	sub	%o4,	%g2,	%l1
	ldsh	[%l7 + 0x4A],	%i5
	movcc	%icc,	%o0,	%g3
	movge	%xcc,	%g4,	%l6
	std	%f2,	[%l7 + 0x60]
	fnand	%f16,	%f30,	%f18
	movrlz	%o2,	%l5,	%o3
	ldsb	[%l7 + 0x43],	%l4
	movrgez	%g7,	0x158,	%l2
	movleu	%icc,	%g6,	%g1
	ldd	[%l7 + 0x60],	%o6
	srax	%o6,	%i4,	%g5
	fmovrde	%i3,	%f26,	%f20
	movcs	%xcc,	%i6,	%o1
	move	%icc,	%o5,	%l3
	fnot1s	%f6,	%f31
	orcc	%l0,	0x0F40,	%i0
	fabsd	%f2,	%f8
	st	%f7,	[%l7 + 0x44]
	fcmple32	%f16,	%f28,	%i7
	array16	%i1,	%o4,	%g2
	fand	%f18,	%f14,	%f24
	movrgez	%i2,	%l1,	%i5
	udiv	%o0,	0x1F68,	%g4
	movle	%xcc,	%l6,	%o2
	edge32l	%g3,	%l5,	%l4
	smul	%g7,	%l2,	%g6
	movg	%xcc,	%o3,	%o7
	fpadd32	%f24,	%f20,	%f0
	mulx	%o6,	0x038C,	%i4
	fpadd16	%f14,	%f6,	%f4
	fsrc1	%f18,	%f18
	ldx	[%l7 + 0x18],	%g5
	movre	%i3,	0x3CB,	%g1
	sdivcc	%o1,	0x19EC,	%o5
	orncc	%l3,	0x1F10,	%l0
	movrlez	%i0,	%i6,	%i1
	xnor	%i7,	0x008B,	%g2
	lduw	[%l7 + 0x30],	%o4
	srlx	%l1,	%i2,	%i5
	xnor	%o0,	%l6,	%g4
	alignaddrl	%g3,	%l5,	%l4
	movvc	%icc,	%o2,	%g7
	fmuld8sux16	%f17,	%f13,	%f6
	fmovdl	%icc,	%f7,	%f3
	orcc	%g6,	%l2,	%o7
	udiv	%o6,	0x0EA6,	%i4
	ldsw	[%l7 + 0x3C],	%g5
	addc	%i3,	0x14B3,	%o3
	xorcc	%o1,	%g1,	%o5
	edge16l	%l0,	%i0,	%i6
	addc	%l3,	%i1,	%i7
	orcc	%o4,	%l1,	%g2
	movne	%icc,	%i2,	%o0
	array8	%i5,	%l6,	%g3
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	udivx	%l5,	0x0AB1,	%g6
	fmovde	%icc,	%f6,	%f15
	udiv	%l2,	0x068B,	%g7
	fmuld8sux16	%f3,	%f31,	%f0
	edge32ln	%o6,	%o7,	%g5
	movl	%xcc,	%i3,	%i4
	fpsub32	%f12,	%f26,	%f14
	movcc	%xcc,	%o3,	%o1
	fmovrde	%o5,	%f14,	%f28
	movvs	%icc,	%l0,	%i0
	fmovscc	%xcc,	%f1,	%f20
	and	%i6,	0x08F5,	%l3
	popc	%g1,	%i7
	addcc	%o4,	%i1,	%g2
	ldsw	[%l7 + 0x34],	%l1
	mulx	%o0,	0x0E5C,	%i2
	edge16n	%i5,	%g3,	%g4
	fxor	%f28,	%f30,	%f16
	fmovscc	%xcc,	%f21,	%f11
	movrlz	%l6,	0x33F,	%l4
	ldsh	[%l7 + 0x24],	%l5
	smulcc	%o2,	%g6,	%g7
	smul	%o6,	%l2,	%o7
	srlx	%g5,	%i3,	%i4
	lduw	[%l7 + 0x24],	%o1
	fzeros	%f27
	fabsd	%f2,	%f26
	movrgz	%o3,	0x085,	%l0
	fmovscc	%icc,	%f1,	%f1
	fmovdg	%icc,	%f12,	%f11
	fexpand	%f18,	%f20
	edge8ln	%o5,	%i6,	%l3
	udivcc	%g1,	0x0104,	%i0
	move	%xcc,	%i7,	%i1
	umul	%o4,	0x0E3A,	%l1
	sth	%g2,	[%l7 + 0x44]
	movre	%i2,	0x1CC,	%i5
	stb	%o0,	[%l7 + 0x61]
	nop
	set	0x14, %l2
	stw	%g3,	[%l7 + %l2]
	movcc	%icc,	%l6,	%g4
	edge8n	%l5,	%o2,	%l4
	subccc	%g6,	%o6,	%l2
	edge32n	%o7,	%g5,	%i3
	and	%i4,	%o1,	%o3
	sethi	0x0B6A,	%l0
	orncc	%o5,	%i6,	%l3
	fmul8x16al	%f5,	%f18,	%f28
	sll	%g7,	%g1,	%i7
	udivcc	%i0,	0x1B04,	%i1
	movpos	%xcc,	%l1,	%g2
	fpsub32s	%f3,	%f18,	%f17
	fxors	%f13,	%f6,	%f24
	subc	%o4,	0x192C,	%i2
	movleu	%xcc,	%i5,	%o0
	fmovrdlez	%g3,	%f30,	%f18
	andn	%g4,	%l6,	%l5
	fxnor	%f14,	%f16,	%f8
	orcc	%l4,	%g6,	%o6
	lduh	[%l7 + 0x4A],	%o2
	sdiv	%o7,	0x1B53,	%g5
	fpack32	%f22,	%f14,	%f14
	subc	%i3,	0x027F,	%l2
	fxnors	%f31,	%f11,	%f12
	movrlz	%o1,	%o3,	%i4
	ldsb	[%l7 + 0x53],	%l0
	ldsw	[%l7 + 0x60],	%i6
	fnot2s	%f4,	%f16
	move	%xcc,	%l3,	%g7
	umulcc	%o5,	%g1,	%i0
	edge32	%i7,	%i1,	%g2
	sdivcc	%l1,	0x02C5,	%i2
	sethi	0x1D0E,	%i5
	fcmpne16	%f24,	%f22,	%o0
	movrlz	%o4,	0x1A5,	%g3
	movl	%xcc,	%l6,	%l5
	xnorcc	%l4,	0x0EE1,	%g6
	ld	[%l7 + 0x74],	%f13
	movrlez	%o6,	0x37C,	%o2
	edge16	%g4,	%g5,	%i3
	ldsh	[%l7 + 0x22],	%o7
	fmovsvs	%icc,	%f1,	%f22
	fones	%f14
	fpsub16s	%f1,	%f18,	%f16
	edge8	%o1,	%o3,	%i4
	edge8ln	%l2,	%l0,	%l3
	xorcc	%g7,	0x0228,	%o5
	stx	%g1,	[%l7 + 0x50]
	edge16ln	%i0,	%i6,	%i7
	ldsw	[%l7 + 0x68],	%g2
	lduh	[%l7 + 0x1A],	%l1
	movrlez	%i2,	%i1,	%o0
	edge8	%i5,	%g3,	%l6
	edge32	%o4,	%l5,	%l4
	umul	%o6,	0x0BD3,	%g6
	edge16l	%o2,	%g5,	%g4
	fxnor	%f12,	%f16,	%f8
	stx	%o7,	[%l7 + 0x38]
	fmuld8ulx16	%f26,	%f28,	%f30
	edge32	%i3,	%o3,	%i4
	lduh	[%l7 + 0x46],	%o1
	lduw	[%l7 + 0x6C],	%l2
	mova	%xcc,	%l0,	%l3
	fpsub16	%f8,	%f10,	%f12
	st	%f27,	[%l7 + 0x7C]
	srlx	%g7,	%g1,	%o5
	stb	%i0,	[%l7 + 0x3C]
	addccc	%i6,	0x09E1,	%i7
	array32	%g2,	%i2,	%i1
	edge16l	%o0,	%i5,	%g3
	move	%icc,	%l1,	%l6
	fornot1s	%f19,	%f1,	%f3
	edge16n	%l5,	%l4,	%o6
	edge16	%o4,	%g6,	%o2
	movn	%xcc,	%g4,	%g5
	restore %i3, %o3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o7,	[%l7 + 0x18]
	fornot2	%f24,	%f28,	%f22
	xnor	%o1,	0x07ED,	%l2
	move	%xcc,	%l0,	%l3
	array32	%g1,	%o5,	%g7
	mova	%icc,	%i6,	%i7
	array32	%g2,	%i2,	%i1
	fnot1s	%f5,	%f19
	nop
	set	0x64, %g4
	stw	%o0,	[%l7 + %g4]
	sub	%i5,	0x165E,	%g3
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	sllx	%i0,	0x1F,	%l5
	xnor	%l4,	%o6,	%o4
	edge8ln	%o2,	%g4,	%g6
	and	%i3,	0x1FD6,	%g5
	for	%f18,	%f26,	%f24
	movcc	%xcc,	%o3,	%o7
	ldsb	[%l7 + 0x70],	%i4
	fnot1	%f0,	%f8
	srl	%l2,	%o1,	%l3
	ldsw	[%l7 + 0x7C],	%g1
	array32	%l0,	%g7,	%o5
	addcc	%i7,	0x04EB,	%g2
	xor	%i2,	0x0372,	%i6
	ld	[%l7 + 0x60],	%f11
	fsrc1	%f26,	%f26
	stx	%o0,	[%l7 + 0x48]
	edge16n	%i5,	%i1,	%l1
	movvc	%xcc,	%l6,	%g3
	fmovs	%f14,	%f16
	sra	%i0,	%l4,	%o6
	sth	%o4,	[%l7 + 0x7A]
	sdivx	%l5,	0x1A88,	%g4
	fsrc2	%f24,	%f22
	mulx	%o2,	%i3,	%g5
	andncc	%g6,	%o3,	%i4
	fmovsvs	%xcc,	%f9,	%f4
	movre	%o7,	0x228,	%o1
	fnand	%f14,	%f26,	%f0
	sth	%l3,	[%l7 + 0x54]
	fmovdne	%xcc,	%f6,	%f4
	fnand	%f26,	%f28,	%f12
	orcc	%g1,	%l2,	%l0
	ldsb	[%l7 + 0x28],	%g7
	ldub	[%l7 + 0x14],	%i7
	pdist	%f22,	%f6,	%f18
	fpadd16	%f30,	%f20,	%f30
	array8	%g2,	%i2,	%i6
	fsrc1	%f2,	%f20
	sth	%o0,	[%l7 + 0x1C]
	fnegd	%f12,	%f26
	fmovdl	%xcc,	%f3,	%f5
	subcc	%o5,	0x02FC,	%i1
	mulscc	%l1,	%l6,	%i5
	movrgz	%i0,	0x26C,	%l4
	or	%o6,	0x000A,	%o4
	edge16n	%l5,	%g3,	%g4
	fnands	%f7,	%f30,	%f7
	std	%f16,	[%l7 + 0x40]
	subccc	%i3,	0x1236,	%g5
	srlx	%o2,	%o3,	%g6
	stb	%o7,	[%l7 + 0x7B]
	fmovsn	%xcc,	%f10,	%f22
	or	%o1,	%i4,	%l3
	movpos	%xcc,	%g1,	%l2
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%g6
	srax	%l0,	0x01,	%g2
	mova	%icc,	%i7,	%i6
	movle	%xcc,	%o0,	%o5
	edge8n	%i1,	%l1,	%i2
	st	%f4,	[%l7 + 0x08]
	udivx	%l6,	0x1C2B,	%i5
	addc	%l4,	%o6,	%i0
	lduw	[%l7 + 0x50],	%o4
	udivx	%l5,	0x0EBE,	%g3
	umulcc	%i3,	%g4,	%o2
	edge8	%g5,	%o3,	%o7
	fmovsvc	%icc,	%f18,	%f2
	xorcc	%g6,	%i4,	%l3
	sllx	%g1,	0x07,	%o1
	xor	%g7,	%l0,	%l2
	movrne	%g2,	0x242,	%i7
	xorcc	%o0,	%o5,	%i6
	edge16n	%i1,	%i2,	%l1
	fornot2	%f6,	%f24,	%f26
	sra	%l6,	%l4,	%i5
	edge16	%i0,	%o4,	%o6
	fcmps	%fcc1,	%f17,	%f16
	movrlez	%l5,	%i3,	%g4
	umulcc	%g3,	0x188D,	%g5
	xorcc	%o2,	0x0FDA,	%o3
	udiv	%g6,	0x04AE,	%i4
	fmovsgu	%xcc,	%f31,	%f15
	ldsw	[%l7 + 0x54],	%o7
	movrlz	%l3,	0x256,	%o1
	restore %g7, 0x17B9, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l2,	0x12E7,	%l0
	andn	%i7,	%g2,	%o0
	orn	%o5,	0x146A,	%i6
	addcc	%i1,	%i2,	%l6
	stx	%l4,	[%l7 + 0x38]
	orn	%l1,	0x1116,	%i0
	ldsh	[%l7 + 0x3E],	%o4
	subc	%o6,	0x14B2,	%l5
	or	%i5,	%g4,	%i3
	addcc	%g5,	0x1459,	%g3
	array8	%o3,	%g6,	%i4
	or	%o2,	%o7,	%l3
	fmovrdlz	%g7,	%f2,	%f4
	smul	%g1,	%o1,	%l2
	edge16ln	%i7,	%g2,	%o0
	xnor	%o5,	%l0,	%i1
	ldd	[%l7 + 0x58],	%f0
	orcc	%i6,	0x0565,	%i2
	fmovdvc	%xcc,	%f22,	%f21
	ldsh	[%l7 + 0x14],	%l6
	sra	%l4,	%i0,	%l1
	movn	%xcc,	%o6,	%o4
	movvs	%xcc,	%l5,	%g4
	movl	%icc,	%i3,	%i5
	edge32l	%g3,	%o3,	%g5
	ld	[%l7 + 0x74],	%f10
	movrlz	%g6,	0x101,	%o2
	srl	%o7,	0x17,	%i4
	array32	%l3,	%g7,	%o1
	addc	%g1,	%i7,	%l2
	movg	%icc,	%g2,	%o0
	movpos	%icc,	%o5,	%i1
	andncc	%i6,	%i2,	%l0
	ldub	[%l7 + 0x6B],	%l6
	std	%f6,	[%l7 + 0x50]
	movgu	%icc,	%i0,	%l1
	sra	%l4,	%o4,	%l5
	mulx	%g4,	%o6,	%i3
	edge32	%g3,	%i5,	%o3
	save %g6, 0x0222, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f6,	%f12,	%o7
	edge16l	%o2,	%l3,	%i4
	umulcc	%g7,	0x100A,	%g1
	array16	%i7,	%o1,	%g2
	edge32ln	%o0,	%o5,	%i1
	umulcc	%i6,	%l2,	%i2
	smulcc	%l0,	%i0,	%l1
	fmovsg	%xcc,	%f3,	%f23
	srlx	%l4,	%l6,	%l5
	fnands	%f20,	%f5,	%f0
	save %o4, %o6, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g3,	0x1740,	%i3
	sub	%i5,	0x1613,	%o3
	stx	%g6,	[%l7 + 0x20]
	movvc	%xcc,	%g5,	%o7
	sdiv	%l3,	0x1963,	%i4
	udiv	%g7,	0x08DE,	%o2
	movvc	%xcc,	%i7,	%g1
	udiv	%g2,	0x0C66,	%o1
	faligndata	%f30,	%f22,	%f2
	sll	%o0,	0x0B,	%i1
	movcs	%icc,	%o5,	%i6
	mulscc	%i2,	%l2,	%l0
	ldsb	[%l7 + 0x40],	%l1
	edge16	%l4,	%i0,	%l5
	fnot2s	%f11,	%f2
	smul	%l6,	%o4,	%g4
	ldub	[%l7 + 0x2B],	%g3
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	umul	%g6,	0x1AFA,	%i5
	mulx	%g5,	%l3,	%i4
	fornot1s	%f25,	%f24,	%f26
	xor	%g7,	0x0ABD,	%o7
	fmovdn	%icc,	%f22,	%f25
	sll	%i7,	%o2,	%g1
	umul	%o1,	0x07C7,	%g2
	addccc	%i1,	0x0209,	%o0
	addc	%o5,	%i2,	%i6
	movre	%l0,	0x09F,	%l1
	edge16	%l2,	%i0,	%l5
	fcmpeq16	%f24,	%f30,	%l4
	edge32l	%l6,	%o4,	%g3
	movn	%icc,	%i3,	%o6
	movn	%xcc,	%g4,	%o3
	umulcc	%g6,	0x1B25,	%g5
	fmul8x16au	%f12,	%f4,	%f22
	movrgez	%l3,	0x3B1,	%i4
	subccc	%i5,	0x186F,	%o7
	andcc	%i7,	0x0BC8,	%g7
	fpack32	%f30,	%f16,	%f26
	udiv	%o2,	0x1E62,	%o1
	fmovrse	%g2,	%f30,	%f10
	std	%f14,	[%l7 + 0x68]
	fmovdle	%xcc,	%f30,	%f19
	fmovdle	%icc,	%f9,	%f3
	stx	%i1,	[%l7 + 0x40]
	fmovdneg	%icc,	%f4,	%f1
	umulcc	%g1,	0x004F,	%o0
	edge16n	%i2,	%o5,	%i6
	xnorcc	%l1,	%l0,	%l2
	array32	%i0,	%l5,	%l6
	array8	%o4,	%g3,	%l4
	sra	%i3,	0x0E,	%o6
	sdivx	%g4,	0x1462,	%o3
	sllx	%g5,	0x0E,	%g6
	stx	%l3,	[%l7 + 0x68]
	subcc	%i5,	0x01E4,	%o7
	movvc	%xcc,	%i7,	%g7
	umul	%i4,	%o2,	%g2
	movcs	%icc,	%i1,	%o1
	sll	%g1,	%i2,	%o0
	movrgez	%o5,	%i6,	%l0
	ldd	[%l7 + 0x50],	%f24
	std	%f14,	[%l7 + 0x38]
	udivcc	%l2,	0x14CF,	%i0
	movne	%xcc,	%l5,	%l6
	udiv	%l1,	0x14E3,	%o4
	edge16l	%l4,	%g3,	%o6
	mulscc	%i3,	%o3,	%g5
	fornot1s	%f29,	%f25,	%f29
	movrgez	%g6,	0x0D6,	%g4
	edge32n	%i5,	%o7,	%i7
	xor	%g7,	%i4,	%l3
	orn	%o2,	%g2,	%i1
	movvc	%xcc,	%g1,	%i2
	movge	%icc,	%o1,	%o5
	fexpand	%f10,	%f20
	fmovdg	%icc,	%f20,	%f18
	fornot2s	%f17,	%f22,	%f12
	fpackfix	%f26,	%f16
	movn	%icc,	%o0,	%i6
	ldsh	[%l7 + 0x36],	%l2
	ld	[%l7 + 0x5C],	%f19
	andncc	%i0,	%l5,	%l6
	or	%l1,	0x0C03,	%l0
	lduw	[%l7 + 0x74],	%o4
	subcc	%g3,	0x0DC3,	%l4
	sir	0x102B
	orcc	%o6,	%i3,	%g5
	fmovda	%icc,	%f17,	%f8
	fzeros	%f31
	movvs	%xcc,	%g6,	%o3
	subcc	%i5,	%g4,	%o7
	orn	%i7,	0x146A,	%i4
	fnand	%f2,	%f2,	%f8
	ld	[%l7 + 0x70],	%f13
	restore %l3, %o2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i1,	%g1,	%g2
	movvc	%icc,	%i2,	%o1
	fmul8x16al	%f7,	%f3,	%f22
	subc	%o5,	%o0,	%l2
	fmovde	%icc,	%f26,	%f9
	lduh	[%l7 + 0x22],	%i6
	movne	%icc,	%i0,	%l6
	mulx	%l5,	0x14FE,	%l1
	movgu	%xcc,	%l0,	%g3
	fcmple16	%f30,	%f28,	%l4
	move	%xcc,	%o6,	%i3
	alignaddrl	%g5,	%o4,	%o3
	movcc	%icc,	%i5,	%g6
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%o6
	fornot1	%f22,	%f20,	%f0
	sllx	%g4,	%i7,	%l3
	subcc	%o2,	%g7,	%i4
	sir	0x140E
	edge16ln	%i1,	%g1,	%i2
	fmovd	%f0,	%f4
	alignaddrl	%o1,	%g2,	%o5
	movle	%xcc,	%l2,	%o0
	udivx	%i0,	0x1A89,	%i6
	std	%f2,	[%l7 + 0x38]
	movl	%xcc,	%l5,	%l1
	edge16	%l0,	%g3,	%l4
	fmovsleu	%icc,	%f11,	%f24
	fnot2s	%f23,	%f26
	subcc	%l6,	0x16A3,	%i3
	umul	%g5,	%o6,	%o3
	subccc	%i5,	%g6,	%o7
	fmovdcs	%icc,	%f14,	%f31
	srax	%o4,	0x17,	%g4
	nop
	set	0x46, %i5
	ldsh	[%l7 + %i5],	%l3
	ldd	[%l7 + 0x48],	%f18
	mulscc	%i7,	0x113D,	%g7
	std	%f8,	[%l7 + 0x20]
	and	%i4,	0x11DD,	%o2
	addc	%i1,	%g1,	%i2
	smulcc	%o1,	0x05F6,	%g2
	fcmple16	%f30,	%f30,	%l2
	array16	%o0,	%i0,	%o5
	xnorcc	%i6,	0x07F7,	%l5
	subccc	%l0,	%g3,	%l1
	alignaddrl	%l6,	%l4,	%i3
	edge8l	%g5,	%o6,	%o3
	edge16n	%g6,	%i5,	%o4
	edge8	%g4,	%l3,	%o7
	popc	0x0ADA,	%g7
	fmovrse	%i4,	%f5,	%f10
	andn	%i7,	%o2,	%i1
	fmovscc	%icc,	%f8,	%f13
	movre	%i2,	0x310,	%o1
	movle	%icc,	%g2,	%l2
	edge16	%g1,	%o0,	%i0
	ldsb	[%l7 + 0x6D],	%o5
	addcc	%i6,	%l5,	%g3
	stw	%l1,	[%l7 + 0x40]
	edge32ln	%l6,	%l0,	%i3
	save %g5, 0x0FE8, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%o6,	%o3
	sra	%g6,	%i5,	%g4
	edge32ln	%l3,	%o4,	%g7
	umul	%i4,	%o7,	%i7
	edge32ln	%i1,	%i2,	%o2
	std	%f8,	[%l7 + 0x28]
	udiv	%g2,	0x0785,	%l2
	edge32n	%g1,	%o0,	%i0
	edge32l	%o5,	%o1,	%i6
	ldsh	[%l7 + 0x18],	%l5
	smulcc	%g3,	%l1,	%l0
	movrgez	%l6,	0x1B4,	%g5
	sdiv	%i3,	0x18BA,	%l4
	movne	%xcc,	%o6,	%o3
	edge16	%i5,	%g4,	%g6
	fpadd32s	%f25,	%f1,	%f16
	popc	%l3,	%o4
	orn	%g7,	%o7,	%i7
	stb	%i4,	[%l7 + 0x1E]
	movrgez	%i2,	0x3B5,	%o2
	udiv	%g2,	0x12EF,	%l2
	addccc	%g1,	0x053D,	%o0
	subcc	%i1,	0x0DE0,	%o5
	sethi	0x0A5A,	%i0
	alignaddrl	%i6,	%l5,	%o1
	st	%f15,	[%l7 + 0x10]
	xor	%g3,	0x0477,	%l0
	movle	%xcc,	%l1,	%g5
	lduw	[%l7 + 0x30],	%i3
	add	%l4,	0x1661,	%o6
	udiv	%o3,	0x0FB0,	%i5
	stw	%l6,	[%l7 + 0x14]
	xor	%g6,	%g4,	%l3
	fcmps	%fcc3,	%f29,	%f0
	ldd	[%l7 + 0x60],	%f8
	edge8l	%g7,	%o7,	%o4
	srax	%i4,	%i2,	%o2
	edge16	%i7,	%l2,	%g2
	xnorcc	%g1,	%o0,	%o5
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	sub	%l5,	0x1C17,	%o1
	movvs	%icc,	%i6,	%g3
	popc	0x0BA5,	%l0
	xor	%g5,	0x1F7F,	%l1
	xnorcc	%l4,	0x0406,	%o6
	ldd	[%l7 + 0x70],	%o2
	sethi	0x0D7C,	%i3
	fcmpne32	%f20,	%f12,	%l6
	mova	%icc,	%g6,	%g4
	fnot1	%f18,	%f20
	fmovdcs	%icc,	%f14,	%f11
	movrlez	%i5,	0x151,	%l3
	movrgz	%o7,	0x3FC,	%g7
	popc	0x0385,	%i4
	fmovdleu	%icc,	%f0,	%f10
	sll	%i2,	0x01,	%o4
	addccc	%o2,	0x0A16,	%i7
	subcc	%l2,	0x098D,	%g2
	orncc	%o0,	%g1,	%o5
	movle	%xcc,	%i1,	%l5
	ldd	[%l7 + 0x28],	%o0
	movneg	%xcc,	%i6,	%i0
	alignaddrl	%g3,	%g5,	%l0
	movn	%xcc,	%l1,	%l4
	ldd	[%l7 + 0x48],	%f20
	sth	%o3,	[%l7 + 0x0A]
	fcmple32	%f20,	%f8,	%o6
	fpackfix	%f20,	%f1
	addcc	%i3,	%g6,	%l6
	sra	%i5,	%l3,	%o7
	array32	%g7,	%g4,	%i2
	fcmps	%fcc0,	%f4,	%f31
	andcc	%i4,	0x1378,	%o2
	fpsub16s	%f10,	%f31,	%f24
	udivx	%o4,	0x1467,	%i7
	fmovdge	%icc,	%f10,	%f22
	sub	%g2,	0x1BFD,	%o0
	ldsb	[%l7 + 0x6D],	%l2
	edge32ln	%g1,	%o5,	%i1
	subccc	%l5,	%o1,	%i0
	orn	%g3,	%g5,	%i6
	addccc	%l1,	0x0D41,	%l4
	movrlz	%l0,	0x3F6,	%o3
	movrlez	%i3,	%o6,	%l6
	sth	%i5,	[%l7 + 0x0C]
	save %g6, 0x010B, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l3,	0x0A7,	%g7
	ldd	[%l7 + 0x28],	%f26
	sra	%i2,	0x19,	%g4
	sub	%i4,	0x1AB3,	%o4
	andcc	%o2,	%g2,	%i7
	array32	%l2,	%g1,	%o5
	ldd	[%l7 + 0x78],	%f6
	fmul8x16au	%f9,	%f8,	%f6
	or	%i1,	%o0,	%l5
	array32	%i0,	%g3,	%g5
	xnor	%o1,	0x1B55,	%l1
	fandnot2	%f22,	%f24,	%f18
	mulscc	%i6,	0x1AFC,	%l0
	fmovdge	%xcc,	%f26,	%f23
	movpos	%xcc,	%l4,	%o3
	udivx	%i3,	0x1B99,	%l6
	xnorcc	%o6,	%i5,	%o7
	ldsh	[%l7 + 0x72],	%l3
	srl	%g6,	0x0D,	%g7
	movleu	%xcc,	%g4,	%i4
	smul	%i2,	%o2,	%o4
	add	%i7,	0x0B99,	%l2
	orncc	%g1,	%g2,	%o5
	or	%i1,	%o0,	%i0
	st	%f10,	[%l7 + 0x1C]
	ldsb	[%l7 + 0x5E],	%l5
	stx	%g5,	[%l7 + 0x28]
	movrgz	%g3,	%l1,	%i6
	save %o1, %l4, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i3,	%l6,	%o6
	ldd	[%l7 + 0x60],	%o2
	movge	%xcc,	%o7,	%l3
	subc	%i5,	%g7,	%g6
	subccc	%i4,	0x0E7B,	%i2
	movrgez	%g4,	0x1DC,	%o2
	fcmpne16	%f26,	%f18,	%o4
	orncc	%l2,	0x03A8,	%g1
	fmovsl	%xcc,	%f30,	%f3
	sth	%i7,	[%l7 + 0x4E]
	sllx	%o5,	0x07,	%g2
	udivx	%i1,	0x10FE,	%o0
	fcmpd	%fcc3,	%f22,	%f24
	orcc	%l5,	0x1E71,	%g5
	fmovsvc	%icc,	%f25,	%f26
	ldsw	[%l7 + 0x70],	%i0
	sir	0x0C01
	srax	%g3,	0x18,	%l1
	fabsd	%f18,	%f16
	array8	%i6,	%o1,	%l0
	srl	%i3,	0x1E,	%l6
	sub	%l4,	0x0DD2,	%o3
	udivx	%o6,	0x093D,	%l3
	fones	%f31
	array16	%o7,	%i5,	%g6
	srlx	%g7,	0x1C,	%i2
	lduh	[%l7 + 0x34],	%g4
	movleu	%xcc,	%o2,	%i4
	nop
	set	0x0A, %o1
	lduh	[%l7 + %o1],	%l2
	subccc	%o4,	0x0D82,	%g1
	edge32	%i7,	%o5,	%i1
	movneg	%icc,	%g2,	%o0
	movpos	%icc,	%l5,	%g5
	fandnot1s	%f17,	%f26,	%f7
	or	%g3,	0x11DF,	%i0
	orcc	%i6,	0x0BF7,	%o1
	ldsb	[%l7 + 0x46],	%l0
	mulscc	%i3,	%l6,	%l4
	fmovsn	%icc,	%f4,	%f9
	fsrc1s	%f19,	%f0
	stw	%o3,	[%l7 + 0x50]
	fornot2	%f22,	%f2,	%f30
	xnorcc	%o6,	0x02F8,	%l1
	ldx	[%l7 + 0x08],	%o7
	movrlz	%i5,	%g6,	%l3
	subc	%g7,	%i2,	%g4
	edge16	%i4,	%o2,	%l2
	fmovrslez	%g1,	%f22,	%f27
	xorcc	%o4,	%i7,	%o5
	nop
	set	0x5C, %i6
	ldub	[%l7 + %i6],	%i1
	stx	%g2,	[%l7 + 0x70]
	movleu	%xcc,	%o0,	%g5
	for	%f20,	%f20,	%f4
	movge	%xcc,	%l5,	%i0
	and	%i6,	0x0591,	%g3
	stb	%o1,	[%l7 + 0x21]
	andn	%i3,	0x0736,	%l6
	mulx	%l4,	%l0,	%o3
	fmovdleu	%xcc,	%f19,	%f5
	edge8	%o6,	%l1,	%i5
	movge	%icc,	%o7,	%l3
	sdivx	%g6,	0x138F,	%g7
	orn	%g4,	%i2,	%o2
	for	%f0,	%f2,	%f8
	andn	%l2,	%i4,	%g1
	array8	%i7,	%o5,	%i1
	ldsh	[%l7 + 0x66],	%o4
	movneg	%icc,	%o0,	%g2
	fabsd	%f22,	%f24
	movre	%l5,	%i0,	%g5
	save %g3, %o1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%icc,	%f6,	%f8
	movre	%i3,	0x36E,	%l4
	mulx	%l0,	0x0D71,	%l6
	movneg	%icc,	%o6,	%l1
	fandnot1	%f2,	%f28,	%f22
	addc	%i5,	%o7,	%l3
	movleu	%icc,	%o3,	%g7
	ldsw	[%l7 + 0x14],	%g4
	addccc	%i2,	%o2,	%g6
	srlx	%i4,	0x14,	%l2
	sdivcc	%g1,	0x1117,	%i7
	sethi	0x0A6F,	%o5
	udivx	%i1,	0x0CFA,	%o0
	sth	%g2,	[%l7 + 0x5C]
	edge16l	%l5,	%o4,	%g5
	edge16n	%g3,	%o1,	%i0
	ld	[%l7 + 0x20],	%f9
	fmovrde	%i3,	%f8,	%f28
	mulx	%l4,	0x1E75,	%i6
	lduw	[%l7 + 0x3C],	%l6
	subc	%o6,	%l0,	%i5
	movre	%o7,	%l3,	%o3
	ld	[%l7 + 0x34],	%f18
	stx	%l1,	[%l7 + 0x20]
	edge32ln	%g7,	%g4,	%i2
	mulx	%o2,	%g6,	%l2
	fornot2	%f12,	%f10,	%f30
	edge32n	%g1,	%i7,	%i4
	fpsub32	%f26,	%f6,	%f10
	edge8l	%o5,	%o0,	%g2
	smul	%i1,	0x04DD,	%o4
	fmovsle	%icc,	%f18,	%f5
	sir	0x0514
	sub	%g5,	%l5,	%o1
	ld	[%l7 + 0x10],	%f31
	udiv	%i0,	0x0136,	%g3
	movleu	%icc,	%i3,	%l4
	movcc	%xcc,	%i6,	%l6
	edge32ln	%l0,	%o6,	%o7
	movrgz	%i5,	0x3E3,	%l3
	move	%icc,	%o3,	%g7
	fornot2s	%f31,	%f10,	%f18
	edge16ln	%l1,	%g4,	%i2
	movl	%icc,	%g6,	%l2
	movleu	%xcc,	%g1,	%o2
	add	%i7,	0x0991,	%o5
	and	%o0,	%g2,	%i4
	fmul8ulx16	%f2,	%f12,	%f0
	edge16ln	%o4,	%g5,	%i1
	movrlz	%o1,	0x22A,	%l5
	movleu	%xcc,	%g3,	%i0
	addc	%l4,	0x0737,	%i6
	movvc	%xcc,	%i3,	%l0
	andn	%o6,	0x1E89,	%l6
	xor	%o7,	0x020C,	%l3
	std	%f4,	[%l7 + 0x48]
	xnorcc	%o3,	0x15F1,	%g7
	std	%f6,	[%l7 + 0x28]
	xor	%l1,	%i5,	%i2
	ld	[%l7 + 0x48],	%f22
	movpos	%xcc,	%g6,	%g4
	movpos	%xcc,	%l2,	%g1
	udivcc	%i7,	0x166E,	%o5
	movge	%icc,	%o0,	%o2
	srax	%i4,	0x15,	%o4
	movg	%icc,	%g2,	%i1
	edge8	%g5,	%o1,	%g3
	fmovsle	%xcc,	%f13,	%f18
	xor	%i0,	0x04A0,	%l5
	movvc	%xcc,	%i6,	%i3
	edge32l	%l4,	%l0,	%o6
	xor	%o7,	%l6,	%l3
	edge8	%o3,	%l1,	%i5
	subc	%g7,	%i2,	%g4
	ldsb	[%l7 + 0x6D],	%l2
	movrlz	%g6,	%i7,	%o5
	fnot1s	%f14,	%f1
	edge16	%g1,	%o0,	%i4
	andn	%o4,	0x031B,	%o2
	fpadd32	%f22,	%f10,	%f12
	movcc	%xcc,	%i1,	%g2
	ldsw	[%l7 + 0x40],	%g5
	ldd	[%l7 + 0x38],	%g2
	movrlez	%o1,	%i0,	%i6
	movpos	%icc,	%i3,	%l5
	fpadd32s	%f14,	%f7,	%f13
	edge8	%l4,	%o6,	%o7
	ldx	[%l7 + 0x48],	%l6
	sll	%l3,	0x04,	%l0
	xnor	%o3,	%i5,	%g7
	movcs	%xcc,	%i2,	%l1
	save %l2, 0x1AF2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g6,	%o5,	%g1
	edge32l	%i7,	%i4,	%o0
	st	%f16,	[%l7 + 0x0C]
	umulcc	%o2,	%i1,	%o4
	fmovrse	%g2,	%f29,	%f7
	movg	%xcc,	%g5,	%g3
	movneg	%icc,	%i0,	%i6
	fmovsg	%icc,	%f12,	%f0
	fmul8ulx16	%f30,	%f12,	%f10
	ldub	[%l7 + 0x77],	%i3
	popc	%o1,	%l5
	edge32	%l4,	%o6,	%l6
	edge8n	%o7,	%l3,	%o3
	andcc	%l0,	0x0321,	%i5
	subcc	%i2,	%l1,	%l2
	edge16	%g4,	%g6,	%o5
	fmovrsgez	%g1,	%f31,	%f22
	xnor	%i7,	0x0104,	%g7
	fors	%f7,	%f12,	%f26
	orcc	%o0,	%o2,	%i4
	sdivx	%i1,	0x0B15,	%o4
	xorcc	%g5,	%g3,	%g2
	movl	%xcc,	%i0,	%i3
	save %o1, %l5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l4,	%o6,	%o7
	and	%l6,	%o3,	%l0
	fmovrdgez	%i5,	%f16,	%f10
	edge8ln	%i2,	%l1,	%l2
	stb	%l3,	[%l7 + 0x4E]
	fmuld8sux16	%f31,	%f1,	%f14
	move	%icc,	%g6,	%o5
	movn	%icc,	%g4,	%g1
	fcmpne16	%f0,	%f6,	%g7
	nop
	set	0x58, %i4
	stb	%i7,	[%l7 + %i4]
	sllx	%o2,	0x0F,	%i4
	mova	%xcc,	%o0,	%o4
	xnor	%g5,	%i1,	%g2
	udiv	%i0,	0x17B1,	%g3
	fmovdne	%xcc,	%f15,	%f7
	umulcc	%o1,	%l5,	%i6
	movge	%xcc,	%l4,	%o6
	edge16l	%i3,	%l6,	%o3
	movrne	%l0,	0x0F1,	%i5
	edge8ln	%o7,	%l1,	%i2
	edge8l	%l3,	%g6,	%o5
	or	%g4,	0x0113,	%l2
	movge	%xcc,	%g1,	%g7
	edge8l	%i7,	%o2,	%i4
	ldx	[%l7 + 0x58],	%o4
	movpos	%xcc,	%o0,	%i1
	edge8ln	%g5,	%g2,	%g3
	fmovs	%f1,	%f30
	fmovdl	%icc,	%f31,	%f25
	nop
	set	0x4A, %g2
	sth	%o1,	[%l7 + %g2]
	sdivx	%i0,	0x1CD7,	%i6
	sir	0x1E65
	bshuffle	%f10,	%f20,	%f10
	movvc	%xcc,	%l4,	%l5
	xor	%i3,	%l6,	%o3
	andn	%l0,	%o6,	%i5
	movne	%xcc,	%o7,	%l1
	edge16ln	%i2,	%g6,	%l3
	restore %g4, 0x19CB, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g1,	%l2,	%g7
	save %o2, 0x03E4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o4,	0x15E3,	%i7
	lduh	[%l7 + 0x2A],	%o0
	edge32l	%g5,	%g2,	%g3
	movg	%icc,	%o1,	%i1
	movrgez	%i0,	0x385,	%l4
	st	%f18,	[%l7 + 0x68]
	nop
	set	0x24, %l0
	lduh	[%l7 + %l0],	%i6
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	movne	%icc,	%l0,	%l6
	edge32	%i5,	%o6,	%l1
	ldd	[%l7 + 0x38],	%i2
	xorcc	%o7,	0x0A9D,	%l3
	sdiv	%g6,	0x0268,	%o5
	fmuld8ulx16	%f10,	%f25,	%f0
	fmul8sux16	%f16,	%f16,	%f0
	xor	%g1,	0x1B81,	%g4
	udiv	%g7,	0x1B93,	%o2
	udivx	%i4,	0x0446,	%l2
	subc	%i7,	%o4,	%o0
	sdivx	%g2,	0x1196,	%g3
	xorcc	%o1,	%i1,	%i0
	subcc	%g5,	0x03F1,	%l4
	fmovsneg	%icc,	%f17,	%f30
	movleu	%icc,	%l5,	%i3
	ldd	[%l7 + 0x50],	%f4
	sir	0x1BB9
	fcmple32	%f16,	%f26,	%o3
	fabss	%f14,	%f10
	alignaddr	%i6,	%l0,	%l6
	xorcc	%o6,	0x0EDD,	%i5
	add	%i2,	%o7,	%l3
	sllx	%g6,	0x1B,	%o5
	movrgz	%l1,	0x102,	%g1
	array8	%g4,	%o2,	%g7
	edge8ln	%i4,	%i7,	%l2
	sllx	%o0,	0x18,	%o4
	edge16n	%g3,	%g2,	%i1
	fmovrdlez	%i0,	%f4,	%f16
	srax	%g5,	%l4,	%o1
	movg	%icc,	%l5,	%i3
	orcc	%i6,	%l0,	%o3
	bshuffle	%f2,	%f30,	%f16
	faligndata	%f22,	%f18,	%f18
	alignaddrl	%o6,	%l6,	%i2
	fzeros	%f11
	movn	%xcc,	%i5,	%l3
	fmovrdne	%g6,	%f16,	%f10
	edge32l	%o5,	%l1,	%g1
	fnegd	%f2,	%f8
	fsrc1	%f22,	%f22
	movre	%o7,	%o2,	%g7
	movre	%i4,	0x29D,	%i7
	orncc	%l2,	%o0,	%o4
	movle	%xcc,	%g4,	%g3
	sdiv	%i1,	0x0228,	%g2
	ldx	[%l7 + 0x70],	%g5
	movrlez	%i0,	0x20C,	%l4
	ld	[%l7 + 0x20],	%f17
	udivcc	%l5,	0x1B4F,	%o1
	alignaddr	%i6,	%i3,	%l0
	movleu	%icc,	%o3,	%o6
	fzeros	%f26
	udiv	%l6,	0x08D1,	%i2
	move	%xcc,	%i5,	%l3
	sllx	%o5,	%g6,	%l1
	subc	%o7,	%g1,	%o2
	ldsb	[%l7 + 0x10],	%i4
	nop
	set	0x1C, %o0
	lduw	[%l7 + %o0],	%g7
	orn	%i7,	%l2,	%o0
	fmovrdgez	%o4,	%f20,	%f24
	movl	%xcc,	%g3,	%i1
	fcmple32	%f0,	%f10,	%g4
	sra	%g2,	0x02,	%i0
	ldsh	[%l7 + 0x1A],	%l4
	edge16	%g5,	%l5,	%o1
	srl	%i3,	%i6,	%l0
	edge32	%o3,	%l6,	%i2
	edge8n	%o6,	%l3,	%i5
	fxnor	%f0,	%f14,	%f0
	udivx	%o5,	0x1EDC,	%g6
	lduh	[%l7 + 0x4E],	%l1
	fnand	%f30,	%f24,	%f8
	add	%g1,	%o2,	%i4
	movre	%o7,	0x2A4,	%i7
	movre	%l2,	%g7,	%o4
	sth	%g3,	[%l7 + 0x0E]
	edge32	%i1,	%o0,	%g4
	movrne	%i0,	%l4,	%g2
	sra	%g5,	0x1D,	%l5
	sra	%o1,	%i6,	%i3
	movg	%icc,	%l0,	%o3
	stb	%i2,	[%l7 + 0x12]
	xnorcc	%o6,	0x0FDD,	%l6
	popc	0x118E,	%l3
	add	%i5,	%o5,	%l1
	sdivx	%g6,	0x118F,	%g1
	mova	%icc,	%o2,	%i4
	orncc	%i7,	%o7,	%g7
	pdist	%f18,	%f12,	%f16
	addcc	%l2,	0x02AC,	%g3
	mova	%xcc,	%i1,	%o4
	addcc	%g4,	%i0,	%o0
	movleu	%xcc,	%g2,	%g5
	fmovdneg	%xcc,	%f21,	%f14
	movre	%l4,	%l5,	%o1
	movge	%xcc,	%i6,	%i3
	udiv	%l0,	0x0E2A,	%i2
	alignaddrl	%o6,	%l6,	%o3
	edge16n	%i5,	%l3,	%o5
	andncc	%l1,	%g1,	%o2
	save %g6, 0x1695, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f26,	%f16,	%f18
	st	%f2,	[%l7 + 0x14]
	sth	%i4,	[%l7 + 0x36]
	fornot1	%f28,	%f24,	%f0
	orn	%g7,	%o7,	%l2
	edge32n	%g3,	%i1,	%g4
	array32	%i0,	%o0,	%o4
	alignaddr	%g5,	%g2,	%l5
	restore %o1, 0x1310, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i3,	[%l7 + 0x4A]
	movg	%xcc,	%l0,	%i2
	movle	%icc,	%o6,	%l4
	umul	%l6,	0x0CDD,	%o3
	movrgz	%l3,	0x1ED,	%o5
	edge32ln	%l1,	%i5,	%g1
	movrgez	%g6,	0x3C9,	%o2
	addccc	%i4,	%g7,	%o7
	fmovsneg	%xcc,	%f11,	%f0
	add	%l2,	0x1B89,	%i7
	edge16	%i1,	%g3,	%i0
	edge16l	%g4,	%o0,	%o4
	sub	%g5,	0x1321,	%l5
	fpadd32	%f2,	%f22,	%f22
	addcc	%g2,	0x0557,	%i6
	ldd	[%l7 + 0x48],	%f6
	fsrc1	%f26,	%f24
	xor	%o1,	%l0,	%i2
	fcmpd	%fcc3,	%f6,	%f2
	subc	%o6,	%i3,	%l4
	movpos	%icc,	%l6,	%l3
	udivcc	%o5,	0x0186,	%o3
	edge16l	%i5,	%g1,	%g6
	movrgz	%o2,	0x2F2,	%i4
	movrne	%l1,	%o7,	%g7
	orcc	%i7,	%l2,	%g3
	sth	%i1,	[%l7 + 0x12]
	fxnors	%f28,	%f11,	%f20
	movg	%xcc,	%i0,	%g4
	fmovrdlz	%o4,	%f0,	%f22
	fmovrdne	%o0,	%f12,	%f6
	fpack32	%f6,	%f18,	%f10
	fmovrdlez	%g5,	%f22,	%f16
	or	%l5,	0x0518,	%i6
	array32	%o1,	%l0,	%i2
	add	%o6,	0x0122,	%g2
	udivcc	%i3,	0x1F64,	%l4
	sethi	0x1A4E,	%l3
	udivcc	%o5,	0x0A54,	%o3
	fxnor	%f6,	%f4,	%f2
	sdiv	%l6,	0x1A5A,	%i5
	movn	%xcc,	%g6,	%g1
	fmovda	%xcc,	%f27,	%f3
	movvs	%icc,	%o2,	%l1
	movrgez	%i4,	0x14D,	%g7
	orcc	%o7,	%l2,	%g3
	umulcc	%i7,	%i1,	%i0
	pdist	%f26,	%f26,	%f2
	xor	%o4,	%o0,	%g4
	save %l5, %g5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x24],	%l0
	fpsub32	%f6,	%f16,	%f2
	orncc	%i2,	0x1331,	%o6
	edge16l	%g2,	%i3,	%l4
	fmovdneg	%icc,	%f14,	%f5
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	srl	%o5,	0x05,	%o3
	array16	%i5,	%l6,	%g1
	std	%f20,	[%l7 + 0x58]
	umul	%o2,	0x000A,	%g6
	movge	%icc,	%l1,	%i4
	xorcc	%o7,	0x04E5,	%l2
	movrlez	%g3,	0x1C9,	%i7
	alignaddrl	%g7,	%i1,	%o4
	movpos	%xcc,	%o0,	%g4
	ldub	[%l7 + 0x6C],	%l5
	ldsb	[%l7 + 0x30],	%g5
	smulcc	%i6,	0x0604,	%l0
	orncc	%i0,	0x1B44,	%o6
	smul	%g2,	%i3,	%l4
	udivcc	%l3,	0x142C,	%i2
	sethi	0x1148,	%o1
	alignaddr	%o5,	%i5,	%l6
	restore %o3, %g1, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%icc,	%f11,	%f8
	subccc	%o2,	%l1,	%i4
	array8	%o7,	%g3,	%i7
	fcmpne16	%f12,	%f20,	%g7
	move	%xcc,	%l2,	%i1
	array8	%o4,	%o0,	%l5
	xnor	%g4,	0x1313,	%g5
	mulscc	%l0,	%i0,	%i6
	array16	%g2,	%o6,	%l4
	movl	%icc,	%l3,	%i2
	fcmple16	%f30,	%f24,	%o1
	ld	[%l7 + 0x78],	%f23
	array32	%o5,	%i5,	%i3
	fornot1s	%f4,	%f14,	%f30
	fornot1	%f0,	%f22,	%f16
	andncc	%o3,	%g1,	%g6
	smul	%l6,	%l1,	%o2
	faligndata	%f24,	%f18,	%f22
	mova	%xcc,	%i4,	%o7
	ldsb	[%l7 + 0x27],	%i7
	and	%g7,	0x0705,	%l2
	addcc	%g3,	0x0802,	%i1
	edge16	%o0,	%o4,	%g4
	movle	%xcc,	%g5,	%l5
	sdivcc	%l0,	0x1A1F,	%i0
	alignaddrl	%g2,	%o6,	%i6
	sir	0x1E4D
	movne	%xcc,	%l3,	%l4
	stx	%o1,	[%l7 + 0x68]
	fand	%f0,	%f22,	%f6
	srl	%i2,	0x0C,	%o5
	lduw	[%l7 + 0x7C],	%i3
	stx	%i5,	[%l7 + 0x28]
	orcc	%o3,	0x1AD3,	%g1
	xor	%l6,	%g6,	%l1
	umul	%o2,	%i4,	%i7
	sra	%g7,	0x0B,	%l2
	stx	%g3,	[%l7 + 0x18]
	movle	%icc,	%o7,	%i1
	save %o4, %g4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o0,	0x0A78,	%l0
	fsrc1	%f26,	%f4
	ldub	[%l7 + 0x20],	%i0
	ldd	[%l7 + 0x28],	%g2
	fmovdl	%xcc,	%f25,	%f30
	mova	%xcc,	%l5,	%i6
	edge8n	%l3,	%o6,	%o1
	andn	%l4,	0x063A,	%o5
	movcs	%icc,	%i2,	%i5
	ldd	[%l7 + 0x60],	%f18
	sdivx	%o3,	0x1459,	%i3
	smul	%l6,	%g6,	%l1
	popc	0x11C4,	%g1
	ldub	[%l7 + 0x0E],	%o2
	sth	%i7,	[%l7 + 0x28]
	std	%f0,	[%l7 + 0x58]
	ldub	[%l7 + 0x24],	%g7
	xnor	%l2,	%i4,	%g3
	movcs	%icc,	%o7,	%i1
	setx loop_94, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_94: 	fcmpne16	%f2,	%f26,	%o0
	ld	[%l7 + 0x68],	%f22
	edge16n	%l0,	%i0,	%g2
	edge32l	%i6,	%l3,	%o6
	sllx	%o1,	%l5,	%l4
	fnegd	%f24,	%f28
	xorcc	%i2,	%i5,	%o3
	mulscc	%o5,	0x1969,	%l6
	fmovdg	%icc,	%f5,	%f6
	movrlez	%i3,	0x2E2,	%g6
	movneg	%icc,	%l1,	%o2
	fnors	%f19,	%f11,	%f5
	sethi	0x1F9E,	%i7
	fpsub32s	%f22,	%f10,	%f26
	sdivx	%g1,	0x026A,	%g7
	edge32l	%i4,	%l2,	%g3
	orcc	%i1,	0x1173,	%o7
	fcmpne32	%f24,	%f26,	%g4
	fcmpd	%fcc3,	%f8,	%f2
	movn	%xcc,	%o4,	%g5
	ldsh	[%l7 + 0x6A],	%o0
	addccc	%i0,	0x0584,	%l0
	std	%f8,	[%l7 + 0x68]
	movrgz	%g2,	0x252,	%i6
	array8	%o6,	%l3,	%o1
	movneg	%icc,	%l4,	%l5
	ldub	[%l7 + 0x3D],	%i2
	fmovsg	%icc,	%f12,	%f6
	movgu	%icc,	%i5,	%o3
	add	%o5,	0x0D0F,	%i3
	fmul8ulx16	%f10,	%f2,	%f12
	sub	%g6,	0x18B6,	%l1
	edge32n	%o2,	%i7,	%g1
	movvc	%icc,	%l6,	%g7
	fmovrdgz	%l2,	%f18,	%f12
	fmovsne	%icc,	%f18,	%f11
	movneg	%xcc,	%i4,	%g3
	xnor	%i1,	%o7,	%g4
	edge8n	%o4,	%o0,	%i0
	ldd	[%l7 + 0x20],	%f26
	edge16	%g5,	%l0,	%i6
	udivx	%o6,	0x0CD6,	%l3
	fmovrsne	%g2,	%f25,	%f27
	stw	%l4,	[%l7 + 0x08]
	movne	%xcc,	%l5,	%i2
	fcmple32	%f18,	%f4,	%o1
	sll	%i5,	0x04,	%o5
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%o3
	popc	0x1F7D,	%g6
	movneg	%xcc,	%l1,	%i3
	lduh	[%l7 + 0x56],	%i7
	movpos	%icc,	%o2,	%l6
	sethi	0x10DF,	%g7
	edge32n	%g1,	%i4,	%g3
	array8	%i1,	%o7,	%l2
	fcmpgt16	%f22,	%f8,	%o4
	and	%g4,	%i0,	%o0
	fmovdge	%icc,	%f2,	%f6
	smulcc	%l0,	0x02DA,	%i6
	addc	%g5,	%o6,	%l3
	movrgez	%g2,	0x0AE,	%l5
	sra	%l4,	%i2,	%i5
	ldsb	[%l7 + 0x45],	%o5
	movne	%icc,	%o1,	%o3
	fcmpgt32	%f10,	%f24,	%l1
	movne	%icc,	%g6,	%i7
	stx	%o2,	[%l7 + 0x48]
	edge32n	%i3,	%l6,	%g7
	sth	%i4,	[%l7 + 0x6A]
	std	%f22,	[%l7 + 0x18]
	lduw	[%l7 + 0x18],	%g1
	st	%f5,	[%l7 + 0x60]
	srl	%g3,	%i1,	%o7
	movrgez	%o4,	%g4,	%i0
	fmovscs	%xcc,	%f13,	%f14
	st	%f14,	[%l7 + 0x14]
	movpos	%xcc,	%o0,	%l2
	xnorcc	%i6,	0x0F50,	%g5
	fnegs	%f21,	%f13
	fornot1	%f0,	%f6,	%f14
	edge32l	%l0,	%l3,	%o6
	movcs	%icc,	%l5,	%g2
	subcc	%l4,	0x0EF0,	%i5
	andn	%i2,	0x06FF,	%o5
	movre	%o3,	%o1,	%l1
	fmovdle	%xcc,	%f4,	%f31
	sub	%i7,	0x0A97,	%g6
	orcc	%o2,	%i3,	%l6
	fmovs	%f19,	%f11
	alignaddrl	%g7,	%i4,	%g3
	fcmped	%fcc0,	%f4,	%f14
	ldd	[%l7 + 0x60],	%f10
	ldd	[%l7 + 0x40],	%g0
	array8	%o7,	%o4,	%i1
	movrgez	%g4,	0x236,	%i0
	st	%f24,	[%l7 + 0x20]
	edge8	%o0,	%l2,	%g5
	array8	%i6,	%l3,	%o6
	srl	%l0,	%g2,	%l5
	fmovrdne	%l4,	%f16,	%f26
	st	%f23,	[%l7 + 0x08]
	edge32	%i5,	%o5,	%o3
	edge8l	%o1,	%l1,	%i7
	save %g6, %i2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o2,	0x14,	%l6
	movvs	%xcc,	%g7,	%g3
	fsrc2s	%f5,	%f19
	fmovsgu	%icc,	%f30,	%f27
	addcc	%g1,	%i4,	%o4
	sir	0x1D75
	addc	%i1,	%o7,	%g4
	movg	%icc,	%i0,	%o0
	or	%l2,	0x1212,	%g5
	stw	%l3,	[%l7 + 0x68]
	smulcc	%o6,	0x0EC4,	%i6
	sllx	%g2,	0x11,	%l5
	ldsw	[%l7 + 0x38],	%l4
	movpos	%xcc,	%i5,	%o5
	movneg	%icc,	%l0,	%o1
	edge16n	%l1,	%i7,	%o3
	edge8	%i2,	%i3,	%g6
	umul	%l6,	%o2,	%g7
	ldd	[%l7 + 0x48],	%f20
	fpsub16	%f4,	%f0,	%f8
	restore %g3, 0x0E79, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x07CD,	%o4
	fpack32	%f10,	%f28,	%f24
	edge32ln	%i4,	%o7,	%g4
	edge8n	%i1,	%o0,	%i0
	ldd	[%l7 + 0x78],	%l2
	stw	%g5,	[%l7 + 0x1C]
	srl	%o6,	%i6,	%l3
	ldsw	[%l7 + 0x6C],	%l5
	fandnot1s	%f23,	%f23,	%f14
	fxnors	%f24,	%f25,	%f0
	movvc	%xcc,	%l4,	%g2
	fnor	%f18,	%f20,	%f30
	addcc	%o5,	%l0,	%o1
	stx	%i5,	[%l7 + 0x40]
	array32	%i7,	%o3,	%l1
	movl	%xcc,	%i3,	%g6
	mova	%icc,	%l6,	%i2
	nop
	set	0x21, %g5
	ldsb	[%l7 + %g5],	%o2
	fornot1	%f0,	%f12,	%f16
	subc	%g7,	0x13EB,	%g3
	andcc	%o4,	0x0315,	%i4
	movl	%icc,	%o7,	%g4
	andn	%i1,	0x0C48,	%o0
	addcc	%i0,	0x09C6,	%g1
	xor	%l2,	0x0673,	%o6
	fmovrdlez	%g5,	%f6,	%f4
	fmovsge	%icc,	%f16,	%f18
	fmovsn	%xcc,	%f23,	%f19
	srax	%i6,	0x03,	%l5
	fmovdleu	%icc,	%f23,	%f24
	andncc	%l4,	%g2,	%l3
	fmovde	%xcc,	%f2,	%f13
	movpos	%xcc,	%o5,	%l0
	ldx	[%l7 + 0x70],	%o1
	fandnot1s	%f7,	%f5,	%f21
	movg	%xcc,	%i7,	%i5
	fcmped	%fcc0,	%f2,	%f24
	movle	%icc,	%o3,	%i3
	mulx	%l1,	0x0D8E,	%g6
	lduh	[%l7 + 0x52],	%l6
	fmovrslez	%i2,	%f17,	%f11
	movgu	%xcc,	%g7,	%g3
	movpos	%icc,	%o2,	%i4
	ldub	[%l7 + 0x24],	%o7
	edge16ln	%o4,	%g4,	%i1
	addccc	%o0,	0x0893,	%g1
	fmovdvs	%xcc,	%f14,	%f28
	fmul8sux16	%f2,	%f28,	%f6
	udivx	%l2,	0x1E01,	%o6
	fmovrdgez	%g5,	%f4,	%f12
	st	%f14,	[%l7 + 0x6C]
	edge8ln	%i0,	%i6,	%l5
	edge8n	%l4,	%g2,	%l3
	edge8l	%l0,	%o5,	%i7
	edge32l	%o1,	%o3,	%i3
	fmovsgu	%icc,	%f4,	%f12
	movleu	%icc,	%l1,	%g6
	add	%l6,	0x1A7E,	%i5
	sra	%i2,	0x1C,	%g7
	siam	0x6
	lduh	[%l7 + 0x6E],	%g3
	ld	[%l7 + 0x6C],	%f9
	sdiv	%o2,	0x113B,	%o7
	sethi	0x0185,	%o4
	fmovsn	%icc,	%f28,	%f12
	fpadd16	%f14,	%f4,	%f14
	array8	%g4,	%i4,	%i1
	fmovscc	%icc,	%f24,	%f16
	ldd	[%l7 + 0x70],	%f4
	ldd	[%l7 + 0x68],	%f16
	edge16ln	%g1,	%o0,	%l2
	ldd	[%l7 + 0x48],	%f16
	fnot2	%f0,	%f30
	edge32ln	%g5,	%o6,	%i0
	edge16ln	%l5,	%l4,	%i6
	fmovsg	%xcc,	%f3,	%f11
	movvc	%xcc,	%l3,	%l0
	edge16ln	%o5,	%g2,	%o1
	fmovrdlez	%i7,	%f22,	%f30
	edge16	%o3,	%l1,	%i3
	movgu	%xcc,	%g6,	%l6
	addcc	%i2,	%g7,	%g3
	edge16n	%i5,	%o7,	%o2
	sra	%g4,	%i4,	%i1
	array8	%g1,	%o4,	%l2
	std	%f14,	[%l7 + 0x28]
	edge16l	%o0,	%g5,	%o6
	edge8	%i0,	%l4,	%i6
	edge8	%l5,	%l0,	%o5
	array16	%g2,	%l3,	%o1
	movcc	%icc,	%o3,	%l1
	xorcc	%i3,	0x08C0,	%g6
	fmovde	%icc,	%f18,	%f20
	andncc	%l6,	%i7,	%g7
	edge32l	%g3,	%i5,	%o7
	movgu	%icc,	%i2,	%g4
	movleu	%icc,	%i4,	%o2
	fmovrslez	%g1,	%f21,	%f0
	fmovrse	%o4,	%f13,	%f26
	movrlez	%i1,	%o0,	%l2
	movrlz	%o6,	0x1BE,	%g5
	movn	%xcc,	%i0,	%l4
	fmovdpos	%icc,	%f17,	%f18
	lduw	[%l7 + 0x10],	%l5
	ldsw	[%l7 + 0x7C],	%l0
	sllx	%o5,	0x14,	%i6
	mova	%xcc,	%g2,	%l3
	edge32	%o3,	%o1,	%l1
	andcc	%i3,	%l6,	%i7
	xnorcc	%g7,	0x0336,	%g6
	setx loop_95, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_95: 	and	%i2,	%i4,	%g4
	sra	%g1,	%o4,	%o2
	movgu	%icc,	%i1,	%l2
	movvs	%icc,	%o6,	%o0
	movg	%xcc,	%i0,	%g5
	fcmpes	%fcc2,	%f30,	%f24
	addc	%l4,	%l5,	%l0
	movvs	%xcc,	%i6,	%g2
	movre	%o5,	%l3,	%o3
	ldsw	[%l7 + 0x28],	%l1
	edge32n	%o1,	%l6,	%i7
	fmovd	%f12,	%f14
	addc	%i3,	%g7,	%g3
	smulcc	%o7,	0x0A9C,	%g6
	movre	%i2,	0x3F0,	%i5
	edge32n	%i4,	%g4,	%o4
	mova	%icc,	%g1,	%o2
	movrlez	%l2,	%o6,	%o0
	st	%f26,	[%l7 + 0x10]
	ldx	[%l7 + 0x08],	%i0
	movle	%xcc,	%i1,	%g5
	edge32ln	%l4,	%l5,	%i6
	xnor	%l0,	%o5,	%g2
	fmovrdlez	%o3,	%f8,	%f6
	fornot2	%f2,	%f18,	%f14
	edge8	%l3,	%o1,	%l1
	ldsb	[%l7 + 0x72],	%l6
	movcs	%icc,	%i3,	%g7
	stw	%i7,	[%l7 + 0x28]
	fones	%f29
	sllx	%o7,	%g6,	%i2
	movcs	%icc,	%i5,	%i4
	xor	%g4,	%o4,	%g3
	fmovsgu	%icc,	%f23,	%f20
	xnorcc	%o2,	%g1,	%o6
	movg	%icc,	%o0,	%i0
	ldsh	[%l7 + 0x52],	%l2
	edge32n	%i1,	%g5,	%l5
	fmovrse	%l4,	%f2,	%f5
	edge32n	%l0,	%o5,	%i6
	movgu	%icc,	%o3,	%l3
	fmovsa	%xcc,	%f0,	%f16
	smulcc	%g2,	0x1DCE,	%l1
	orncc	%o1,	0x0A76,	%i3
	fcmpeq16	%f24,	%f26,	%l6
	stw	%i7,	[%l7 + 0x48]
	addc	%g7,	%o7,	%i2
	mulx	%i5,	0x1EA1,	%g6
	edge16l	%g4,	%i4,	%g3
	ldsw	[%l7 + 0x40],	%o2
	lduw	[%l7 + 0x74],	%o4
	movvs	%xcc,	%o6,	%g1
	movvc	%icc,	%i0,	%o0
	orn	%i1,	0x0CDF,	%g5
	fmovdpos	%xcc,	%f4,	%f27
	fmovsneg	%xcc,	%f7,	%f13
	smul	%l2,	%l4,	%l5
	sra	%l0,	0x0E,	%o5
	fmovdcs	%icc,	%f6,	%f24
	xnor	%o3,	%i6,	%g2
	smulcc	%l1,	%o1,	%l3
	movg	%xcc,	%i3,	%i7
	for	%f6,	%f16,	%f20
	for	%f24,	%f4,	%f10
	movvs	%icc,	%g7,	%o7
	fcmpgt32	%f6,	%f16,	%i2
	srlx	%i5,	0x0E,	%g6
	fpadd32	%f10,	%f12,	%f4
	edge32n	%g4,	%l6,	%g3
	movrgz	%i4,	0x28B,	%o2
	edge32ln	%o6,	%o4,	%g1
	addccc	%i0,	0x0406,	%o0
	orncc	%g5,	%i1,	%l4
	ldd	[%l7 + 0x60],	%l4
	movpos	%icc,	%l0,	%l2
	udiv	%o3,	0x1A17,	%i6
	xnor	%o5,	0x0959,	%g2
	addc	%o1,	0x1ED8,	%l3
	ldd	[%l7 + 0x10],	%f22
	alignaddrl	%l1,	%i7,	%i3
	fpmerge	%f3,	%f18,	%f14
	srax	%g7,	%i2,	%o7
	fnands	%f30,	%f16,	%f4
	fornot2	%f28,	%f20,	%f16
	movcs	%icc,	%g6,	%i5
	fmovrdlez	%l6,	%f24,	%f22
	movrgez	%g3,	%i4,	%o2
	smulcc	%o6,	%o4,	%g4
	subccc	%i0,	%o0,	%g5
	addcc	%g1,	0x1E5B,	%l4
	fnors	%f30,	%f7,	%f13
	fmovda	%xcc,	%f12,	%f8
	andcc	%i1,	%l0,	%l5
	std	%f0,	[%l7 + 0x08]
	st	%f6,	[%l7 + 0x40]
	ldsb	[%l7 + 0x52],	%o3
	fpsub32s	%f23,	%f25,	%f24
	fmovdge	%xcc,	%f17,	%f28
	bshuffle	%f6,	%f4,	%f2
	fabsd	%f6,	%f20
	array32	%l2,	%i6,	%o5
	sethi	0x0D16,	%o1
	movleu	%xcc,	%g2,	%l3
	edge16n	%l1,	%i7,	%g7
	srlx	%i3,	%i2,	%g6
	stw	%o7,	[%l7 + 0x6C]
	edge16n	%l6,	%i5,	%g3
	faligndata	%f18,	%f18,	%f20
	fsrc1s	%f9,	%f31
	ldsw	[%l7 + 0x4C],	%o2
	edge8n	%o6,	%o4,	%i4
	smulcc	%i0,	%o0,	%g5
	movcc	%xcc,	%g1,	%g4
	ldd	[%l7 + 0x08],	%f20
	fmovdleu	%icc,	%f29,	%f20
	fmovdgu	%xcc,	%f11,	%f1
	edge8	%i1,	%l4,	%l0
	andcc	%o3,	0x1379,	%l2
	sub	%l5,	0x065B,	%i6
	sllx	%o5,	0x06,	%g2
	or	%o1,	%l1,	%l3
	edge32ln	%g7,	%i3,	%i2
	mova	%xcc,	%i7,	%g6
	ldd	[%l7 + 0x30],	%f8
	fmovde	%icc,	%f8,	%f8
	fmovsgu	%xcc,	%f25,	%f22
	move	%icc,	%o7,	%i5
	ldsw	[%l7 + 0x60],	%l6
	fmovsne	%icc,	%f22,	%f30
	fcmple16	%f6,	%f22,	%o2
	ldsw	[%l7 + 0x7C],	%g3
	orcc	%o4,	0x110C,	%i4
	subccc	%o6,	0x0EB1,	%o0
	or	%g5,	0x0B80,	%i0
	fxnor	%f24,	%f18,	%f30
	srl	%g4,	%i1,	%l4
	stb	%g1,	[%l7 + 0x6F]
	sra	%o3,	%l0,	%l2
	movvc	%icc,	%l5,	%o5
	sethi	0x07BB,	%g2
	smul	%o1,	0x0AC4,	%i6
	smulcc	%l3,	0x0865,	%l1
	sdiv	%i3,	0x077F,	%g7
	orn	%i2,	%g6,	%o7
	alignaddr	%i7,	%l6,	%i5
	movrlz	%g3,	0x29E,	%o2
	ldd	[%l7 + 0x20],	%i4
	sll	%o4,	0x02,	%o0
	restore %o6, %g5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i0,	%l4,	%i1
	movrgz	%g1,	%o3,	%l0
	movre	%l2,	%l5,	%o5
	fsrc2	%f16,	%f8
	ld	[%l7 + 0x38],	%f0
	fpadd16	%f14,	%f26,	%f24
	edge32ln	%o1,	%i6,	%l3
	movpos	%xcc,	%g2,	%i3
	fpadd16	%f4,	%f30,	%f28
	movre	%l1,	%i2,	%g6
	movgu	%xcc,	%g7,	%o7
	movpos	%icc,	%i7,	%i5
	sdivcc	%g3,	0x133C,	%l6
	ldsb	[%l7 + 0x27],	%i4
	alignaddr	%o4,	%o0,	%o6
	setx loop_96, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_96: 	edge32l	%l4,	%i1,	%i0
	stb	%g1,	[%l7 + 0x5F]
	ldx	[%l7 + 0x60],	%l0
	save %l2, %o3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o5,	%o1,	%l3
	addcc	%g2,	%i6,	%i3
	ldd	[%l7 + 0x20],	%l0
	fcmpne16	%f28,	%f16,	%g6
	or	%g7,	%i2,	%o7
	smulcc	%i7,	0x0303,	%i5
	ld	[%l7 + 0x3C],	%f29
	fornot2	%f30,	%f28,	%f6
	fnegs	%f14,	%f1
	fsrc1	%f12,	%f8
	fsrc1s	%f11,	%f18
	array32	%g3,	%i4,	%o4
	pdist	%f18,	%f24,	%f8
	sdiv	%l6,	0x1E47,	%o6
	ld	[%l7 + 0x44],	%f29
	andncc	%o0,	%g4,	%g5
	array8	%l4,	%i1,	%o2
	fxor	%f10,	%f6,	%f24
	edge8	%i0,	%g1,	%l0
	movre	%l2,	%l5,	%o3
	move	%xcc,	%o1,	%o5
	movvc	%icc,	%l3,	%g2
	or	%i6,	%i3,	%l1
	addcc	%g6,	0x15B7,	%i2
	movre	%o7,	0x15F,	%g7
	addc	%i5,	0x1167,	%i7
	orn	%g3,	0x1F21,	%i4
	movrgez	%l6,	%o6,	%o0
	andncc	%g4,	%o4,	%g5
	udivx	%i1,	0x0CC6,	%o2
	orncc	%l4,	%i0,	%l0
	movg	%icc,	%g1,	%l5
	fmuld8ulx16	%f4,	%f7,	%f20
	movgu	%xcc,	%o3,	%o1
	sllx	%o5,	0x0D,	%l3
	sll	%g2,	%l2,	%i6
	xor	%l1,	%i3,	%g6
	addccc	%i2,	0x1D54,	%g7
	movrlz	%i5,	%i7,	%o7
	ldsw	[%l7 + 0x74],	%g3
	fmovda	%xcc,	%f9,	%f6
	orcc	%i4,	0x0326,	%l6
	stx	%o0,	[%l7 + 0x40]
	orcc	%g4,	0x112B,	%o4
	fmovsl	%icc,	%f20,	%f0
	fmuld8ulx16	%f1,	%f7,	%f14
	fcmpeq16	%f0,	%f0,	%o6
	udivx	%i1,	0x1702,	%o2
	movvc	%xcc,	%g5,	%l4
	sethi	0x0E76,	%i0
	addc	%g1,	0x167B,	%l0
	fabsd	%f28,	%f2
	movrne	%l5,	%o3,	%o5
	movrlz	%l3,	0x112,	%o1
	fpadd16s	%f21,	%f2,	%f14
	sdivcc	%g2,	0x03C4,	%l2
	stb	%l1,	[%l7 + 0x15]
	umul	%i3,	0x10DC,	%i6
	udiv	%i2,	0x0544,	%g7
	array32	%i5,	%g6,	%i7
	movvc	%icc,	%g3,	%o7
	xorcc	%i4,	0x1C56,	%o0
	fmovrde	%l6,	%f22,	%f30
	fmovsge	%xcc,	%f16,	%f28
	edge16	%o4,	%o6,	%i1
	fpack16	%f6,	%f0
	subcc	%g4,	0x0C1A,	%g5
	alignaddr	%l4,	%i0,	%o2
	umul	%l0,	%g1,	%o3
	ldsh	[%l7 + 0x7A],	%l5
	orn	%l3,	0x1652,	%o5
	fmovrsgz	%o1,	%f10,	%f4
	edge16ln	%g2,	%l2,	%l1
	edge8	%i6,	%i3,	%i2
	srl	%i5,	%g6,	%i7
	fmul8ulx16	%f14,	%f18,	%f20
	mulx	%g7,	%g3,	%o7
	fnot2s	%f0,	%f3
	subcc	%i4,	%l6,	%o4
	sdivx	%o6,	0x0C4A,	%o0
	fmovsvs	%icc,	%f21,	%f17
	movrne	%g4,	0x3FB,	%i1
	edge16n	%l4,	%i0,	%o2
	fcmped	%fcc3,	%f6,	%f2
	fors	%f20,	%f12,	%f26
	edge16l	%l0,	%g5,	%o3
	fmovse	%xcc,	%f8,	%f6
	fmovsleu	%xcc,	%f15,	%f5
	sll	%g1,	%l5,	%o5
	lduh	[%l7 + 0x20],	%l3
	movl	%icc,	%g2,	%o1
	movl	%icc,	%l2,	%i6
	fmovspos	%icc,	%f12,	%f31
	fmovsg	%xcc,	%f17,	%f26
	movrlez	%i3,	0x3D5,	%i2
	or	%l1,	%i5,	%i7
	sub	%g7,	%g6,	%g3
	fmovsvc	%icc,	%f28,	%f30
	sllx	%i4,	0x0C,	%l6
	sllx	%o7,	%o4,	%o6
	xnor	%o0,	%g4,	%l4
	srlx	%i1,	0x14,	%o2
	array16	%l0,	%g5,	%o3
	fmovscc	%icc,	%f0,	%f16
	edge8ln	%i0,	%l5,	%o5
	movneg	%xcc,	%g1,	%l3
	fpsub32	%f20,	%f0,	%f12
	fmovde	%icc,	%f6,	%f22
	movrgez	%g2,	%l2,	%o1
	andn	%i3,	%i2,	%i6
	orncc	%l1,	0x0BE4,	%i7
	ldub	[%l7 + 0x1B],	%g7
	movre	%g6,	%g3,	%i4
	edge8	%i5,	%o7,	%o4
	umul	%o6,	0x0CF0,	%o0
	fnot2s	%f19,	%f6
	array8	%l6,	%g4,	%l4
	nop
	set	0x50, %g1
	std	%f24,	[%l7 + %g1]
	fexpand	%f25,	%f6
	fone	%f18
	edge32n	%i1,	%l0,	%o2
	sllx	%g5,	%i0,	%o3
	fnands	%f24,	%f0,	%f17
	fmovde	%icc,	%f27,	%f14
	fmul8sux16	%f28,	%f30,	%f18
	fcmpne32	%f10,	%f18,	%o5
	fmovd	%f30,	%f8
	fmovspos	%icc,	%f5,	%f27
	xnorcc	%l5,	0x0DB4,	%l3
	andncc	%g1,	%l2,	%g2
	fcmpeq16	%f20,	%f12,	%o1
	srlx	%i2,	0x00,	%i3
	movrgz	%l1,	%i6,	%i7
	sllx	%g7,	%g3,	%g6
	sethi	0x0CA7,	%i5
	movle	%icc,	%o7,	%i4
	fmul8sux16	%f2,	%f20,	%f2
	srlx	%o6,	%o0,	%o4
	fpadd32	%f6,	%f26,	%f28
	mulscc	%g4,	%l4,	%i1
	movpos	%xcc,	%l0,	%l6
	xnor	%g5,	%o2,	%o3
	stw	%o5,	[%l7 + 0x18]
	ldx	[%l7 + 0x48],	%l5
	mulscc	%i0,	0x1F72,	%g1
	movn	%icc,	%l3,	%g2
	movcc	%xcc,	%o1,	%l2
	ldd	[%l7 + 0x58],	%i2
	fmovdvc	%xcc,	%f23,	%f4
	fmovdl	%xcc,	%f23,	%f14
	movgu	%xcc,	%l1,	%i6
	fornot2s	%f23,	%f27,	%f7
	subccc	%i7,	%i2,	%g7
	ldsb	[%l7 + 0x25],	%g6
	ldub	[%l7 + 0x65],	%i5
	fmovsvs	%xcc,	%f10,	%f1
	movg	%xcc,	%g3,	%o7
	fxnor	%f14,	%f4,	%f0
	fmovdn	%icc,	%f26,	%f28
	fmuld8ulx16	%f13,	%f15,	%f16
	sethi	0x0964,	%o6
	andn	%o0,	%o4,	%g4
	array8	%i4,	%i1,	%l4
	popc	0x080F,	%l0
	array8	%l6,	%o2,	%o3
	srlx	%g5,	0x03,	%o5
	smulcc	%i0,	%l5,	%l3
	edge32ln	%g2,	%o1,	%g1
	ldsb	[%l7 + 0x5D],	%l2
	fexpand	%f15,	%f12
	movge	%icc,	%l1,	%i6
	edge16	%i3,	%i7,	%i2
	fpmerge	%f26,	%f11,	%f2
	sethi	0x02C9,	%g6
	mova	%xcc,	%i5,	%g3
	sdivcc	%g7,	0x0E03,	%o7
	array32	%o6,	%o0,	%o4
	move	%icc,	%i4,	%i1
	smul	%g4,	0x1CC7,	%l0
	fmovsleu	%xcc,	%f27,	%f14
	stb	%l6,	[%l7 + 0x61]
	mulscc	%l4,	%o3,	%o2
	or	%o5,	%g5,	%l5
	ldsb	[%l7 + 0x55],	%i0
	xnor	%g2,	%l3,	%o1
	fxors	%f23,	%f1,	%f25
	xorcc	%l2,	%l1,	%i6
	andcc	%g1,	%i3,	%i7
	edge32n	%i2,	%g6,	%i5
	fmul8x16	%f18,	%f10,	%f2
	xnorcc	%g7,	%o7,	%o6
	ldsw	[%l7 + 0x44],	%o0
	udiv	%g3,	0x08D3,	%i4
	fcmpne16	%f4,	%f30,	%o4
	add	%g4,	0x0EDE,	%i1
	fmovrde	%l6,	%f20,	%f16
	ldsw	[%l7 + 0x38],	%l0
	sdiv	%o3,	0x019A,	%l4
	alignaddr	%o2,	%g5,	%o5
	movn	%icc,	%i0,	%g2
	edge32n	%l3,	%l5,	%l2
	edge16l	%o1,	%l1,	%i6
	fones	%f0
	fpadd16s	%f27,	%f19,	%f1
	fmovdgu	%xcc,	%f6,	%f16
	edge32n	%g1,	%i7,	%i2
	fmovda	%xcc,	%f28,	%f1
	smulcc	%i3,	0x1531,	%g6
	udiv	%i5,	0x1399,	%o7
	fcmpeq32	%f4,	%f10,	%g7
	array16	%o6,	%o0,	%g3
	add	%i4,	0x0503,	%g4
	edge32n	%i1,	%l6,	%o4
	edge8ln	%l0,	%o3,	%l4
	movleu	%xcc,	%g5,	%o2
	movneg	%icc,	%i0,	%o5
	edge32n	%g2,	%l3,	%l5
	fmovdpos	%icc,	%f3,	%f1
	mova	%icc,	%o1,	%l1
	udiv	%l2,	0x0763,	%g1
	subcc	%i7,	0x1BEA,	%i2
	sra	%i6,	0x10,	%g6
	edge8n	%i3,	%i5,	%g7
	movl	%xcc,	%o6,	%o0
	fmovrdlez	%g3,	%f20,	%f10
	add	%o7,	0x1B31,	%g4
	edge8	%i1,	%i4,	%l6
	ldub	[%l7 + 0x43],	%l0
	fornot1s	%f19,	%f3,	%f25
	ldd	[%l7 + 0x78],	%f12
	edge16l	%o4,	%l4,	%o3
	movcc	%icc,	%g5,	%i0
	std	%f0,	[%l7 + 0x78]
	st	%f26,	[%l7 + 0x4C]
	sdivx	%o2,	0x1D59,	%o5
	movrne	%g2,	0x292,	%l5
	sdiv	%o1,	0x02D9,	%l3
	andncc	%l1,	%g1,	%l2
	sir	0x0093
	ldsw	[%l7 + 0x40],	%i2
	ldd	[%l7 + 0x58],	%f6
	fmovs	%f20,	%f27
	st	%f28,	[%l7 + 0x6C]
	movrgz	%i6,	0x0F8,	%i7
	xnor	%i3,	%i5,	%g6
	orcc	%g7,	%o6,	%o0
	fmovrslz	%g3,	%f17,	%f25
	movrlez	%g4,	0x3A2,	%o7
	alignaddrl	%i4,	%l6,	%i1
	lduh	[%l7 + 0x12],	%o4
	ldub	[%l7 + 0x71],	%l0
	smulcc	%o3,	%l4,	%i0
	sll	%o2,	%g5,	%o5
	fsrc1	%f2,	%f30
	fornot2s	%f22,	%f14,	%f9
	edge32	%g2,	%l5,	%l3
	orncc	%o1,	%l1,	%l2
	sdiv	%i2,	0x019C,	%i6
	array16	%i7,	%g1,	%i5
	movrgz	%i3,	0x050,	%g6
	lduw	[%l7 + 0x20],	%o6
	restore %o0, 0x0909, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g4,	%o7,	%g7
	edge16l	%l6,	%i4,	%i1
	movl	%xcc,	%l0,	%o3
	move	%xcc,	%o4,	%i0
	ldsb	[%l7 + 0x7A],	%o2
	alignaddrl	%l4,	%g5,	%o5
	edge16n	%g2,	%l3,	%o1
	addc	%l1,	%l2,	%i2
	umulcc	%l5,	%i6,	%g1
	ldub	[%l7 + 0x4B],	%i5
	subccc	%i3,	%i7,	%g6
	std	%f6,	[%l7 + 0x48]
	sub	%o0,	0x0DF3,	%g3
	popc	0x00C7,	%g4
	popc	%o6,	%g7
	ldx	[%l7 + 0x38],	%l6
	udiv	%i4,	0x0E8C,	%o7
	movrgez	%l0,	%i1,	%o3
	fornot1s	%f24,	%f11,	%f22
	fmovdneg	%icc,	%f26,	%f10
	fand	%f14,	%f16,	%f26
	fmuld8ulx16	%f4,	%f22,	%f26
	movrgez	%i0,	%o4,	%l4
	fpsub16s	%f11,	%f12,	%f12
	stb	%o2,	[%l7 + 0x42]
	mulx	%o5,	%g2,	%l3
	sdivcc	%g5,	0x0314,	%o1
	sub	%l2,	0x1AE5,	%l1
	edge8ln	%i2,	%i6,	%g1
	move	%xcc,	%i5,	%i3
	fcmpgt16	%f8,	%f22,	%l5
	andncc	%i7,	%g6,	%g3
	array8	%g4,	%o0,	%g7
	movrne	%l6,	%i4,	%o7
	edge32n	%l0,	%i1,	%o3
	fnands	%f4,	%f26,	%f3
	srl	%o6,	%i0,	%l4
	movne	%icc,	%o2,	%o4
	movrlz	%o5,	0x17E,	%l3
	fcmple16	%f2,	%f0,	%g2
	movle	%icc,	%g5,	%l2
	sra	%o1,	%i2,	%l1
	ldd	[%l7 + 0x50],	%f6
	xnorcc	%g1,	0x0AB5,	%i6
	sdiv	%i5,	0x01AD,	%i3
	movrgz	%l5,	0x378,	%i7
	edge8ln	%g3,	%g4,	%g6
	sll	%g7,	0x1C,	%o0
	edge32ln	%l6,	%o7,	%i4
	subc	%l0,	0x025A,	%i1
	fors	%f4,	%f23,	%f0
	orncc	%o6,	%i0,	%l4
	fmovdcc	%xcc,	%f4,	%f14
	movcs	%xcc,	%o3,	%o2
	ldsb	[%l7 + 0x7D],	%o4
	ldd	[%l7 + 0x68],	%l2
	fpsub32s	%f22,	%f19,	%f9
	ld	[%l7 + 0x20],	%f0
	st	%f15,	[%l7 + 0x70]
	alignaddrl	%o5,	%g5,	%l2
	orcc	%o1,	%i2,	%g2
	andncc	%l1,	%g1,	%i5
	fcmped	%fcc0,	%f22,	%f0
	fmovse	%icc,	%f9,	%f31
	save %i3, 0x1CFC, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f15,	%f9,	%f11
	subccc	%i6,	0x0C64,	%i7
	mulscc	%g3,	%g4,	%g6
	fmuld8sux16	%f25,	%f5,	%f28
	sdivx	%o0,	0x0335,	%g7
	lduh	[%l7 + 0x70],	%o7
	sdivcc	%i4,	0x0CC6,	%l0
	sethi	0x0289,	%l6
	movn	%icc,	%o6,	%i1
	sth	%i0,	[%l7 + 0x12]
	xor	%l4,	%o2,	%o3
	mova	%icc,	%l3,	%o4
	addcc	%g5,	%o5,	%o1
	or	%l2,	%g2,	%l1
	addcc	%i2,	%g1,	%i5
	smul	%l5,	0x1977,	%i6
	subc	%i3,	%g3,	%g4
	popc	0x0DF6,	%i7
	subcc	%o0,	%g7,	%g6
	sub	%o7,	%i4,	%l0
	fandnot2s	%f22,	%f5,	%f22
	setx loop_97, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_97: 	movge	%icc,	%l6,	%l4
	stw	%o2,	[%l7 + 0x7C]
	movleu	%xcc,	%i0,	%o3
	movrlz	%o4,	%g5,	%l3
	stx	%o1,	[%l7 + 0x50]
	mulscc	%o5,	%g2,	%l2
	subcc	%i2,	0x129A,	%l1
	movle	%icc,	%i5,	%l5
	save %i6, 0x1ACB, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0E1F,	%i3
	movrlz	%g3,	%i7,	%o0
	nop
	set	0x2A, %i1
	ldsb	[%l7 + %i1],	%g4
	movl	%icc,	%g7,	%o7
	fxor	%f4,	%f14,	%f0
	move	%xcc,	%i4,	%g6
	fpack16	%f6,	%f31
	fone	%f30
	fmovdpos	%xcc,	%f9,	%f20
	movrlez	%o6,	0x3AF,	%i1
	movle	%xcc,	%l6,	%l0
	alignaddrl	%o2,	%l4,	%i0
	fmul8ulx16	%f12,	%f14,	%f2
	array8	%o4,	%o3,	%l3
	fpack32	%f8,	%f20,	%f8
	udiv	%g5,	0x19B4,	%o1
	fmovrde	%o5,	%f22,	%f24
	subccc	%l2,	0x1EFB,	%i2
	edge16l	%g2,	%i5,	%l1
	subccc	%l5,	0x0F64,	%i6
	andcc	%i3,	%g1,	%i7
	mulscc	%o0,	%g3,	%g7
	sub	%g4,	0x08B4,	%o7
	fmovsneg	%xcc,	%f15,	%f28
	ld	[%l7 + 0x24],	%f22
	edge16l	%g6,	%i4,	%i1
	lduw	[%l7 + 0x60],	%l6
	lduw	[%l7 + 0x7C],	%o6
	stb	%l0,	[%l7 + 0x3C]
	movn	%xcc,	%o2,	%i0
	movcc	%icc,	%o4,	%l4
	sdivx	%l3,	0x002A,	%g5
	sdivx	%o3,	0x1223,	%o1
	ldsw	[%l7 + 0x10],	%l2
	ldub	[%l7 + 0x62],	%i2
	array32	%g2,	%o5,	%l1
	save %l5, 0x04A6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i6,	%g1,	%i3
	andn	%o0,	%i7,	%g3
	ld	[%l7 + 0x0C],	%f15
	edge8l	%g4,	%o7,	%g7
	movg	%xcc,	%g6,	%i1
	save %l6, 0x0310, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o6,	%o2,	%i0
	edge32ln	%l0,	%l4,	%o4
	movn	%icc,	%g5,	%l3
	alignaddrl	%o1,	%o3,	%i2
	save %g2, 0x1C3A, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%l1,	%f7,	%f31
	udivcc	%l2,	0x074A,	%l5
	ld	[%l7 + 0x3C],	%f3
	fmovsa	%icc,	%f13,	%f13
	mova	%xcc,	%i5,	%g1
	movne	%icc,	%i6,	%i3
	edge32ln	%o0,	%g3,	%g4
	movrlez	%i7,	%g7,	%g6
	sir	0x18CA
	movn	%xcc,	%o7,	%i1
	edge32ln	%i4,	%l6,	%o6
	fmovdge	%icc,	%f3,	%f31
	fmovda	%icc,	%f0,	%f23
	movrlez	%o2,	%l0,	%l4
	fmovs	%f9,	%f6
	stb	%i0,	[%l7 + 0x36]
	sll	%g5,	0x02,	%o4
	xnorcc	%l3,	%o3,	%i2
	add	%g2,	%o5,	%l1
	std	%f0,	[%l7 + 0x10]
	fcmple16	%f16,	%f30,	%o1
	fmovsg	%xcc,	%f9,	%f7
	fmovrsne	%l5,	%f31,	%f9
	addc	%i5,	%l2,	%g1
	udivx	%i6,	0x00BB,	%o0
	move	%xcc,	%i3,	%g3
	addc	%g4,	%g7,	%g6
	fandnot2s	%f15,	%f6,	%f21
	subcc	%o7,	%i7,	%i4
	xorcc	%i1,	%o6,	%o2
	movrne	%l6,	0x05E,	%l4
	edge16ln	%i0,	%l0,	%g5
	movre	%l3,	%o4,	%o3
	fcmpeq16	%f10,	%f4,	%g2
	sth	%o5,	[%l7 + 0x0C]
	fmovd	%f26,	%f20
	ldx	[%l7 + 0x50],	%l1
	ld	[%l7 + 0x50],	%f30
	fsrc2	%f26,	%f0
	movrlez	%i2,	%o1,	%l5
	edge32n	%i5,	%g1,	%i6
	andn	%o0,	%l2,	%i3
	movl	%xcc,	%g3,	%g4
	srlx	%g7,	%o7,	%i7
	fmovsvs	%xcc,	%f1,	%f27
	movcc	%xcc,	%g6,	%i1
	andncc	%o6,	%i4,	%o2
	add	%l6,	0x0A3B,	%l4
	andcc	%i0,	0x08C3,	%l0
	umulcc	%g5,	%o4,	%o3
	ldub	[%l7 + 0x63],	%l3
	andn	%g2,	0x1AA8,	%o5
	movcc	%xcc,	%l1,	%i2
	movvc	%icc,	%l5,	%o1
	ldsw	[%l7 + 0x14],	%i5
	edge16l	%i6,	%o0,	%l2
	movcs	%icc,	%i3,	%g1
	movrlez	%g4,	0x2B3,	%g7
	udivx	%o7,	0x12D3,	%i7
	sdivx	%g6,	0x1808,	%g3
	fzero	%f0
	edge32n	%o6,	%i1,	%i4
	fmovsg	%xcc,	%f27,	%f10
	sethi	0x0042,	%o2
	movle	%xcc,	%l6,	%i0
	subcc	%l0,	0x0C93,	%g5
	nop
	set	0x58, %i0
	std	%f6,	[%l7 + %i0]
	edge32n	%l4,	%o3,	%l3
	save %g2, %o4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i2,	%l5,	%o5
	movvs	%icc,	%i5,	%i6
	fpsub16s	%f1,	%f0,	%f24
	fnand	%f10,	%f14,	%f8
	edge8	%o0,	%l2,	%i3
	nop
	set	0x78, %l3
	std	%f4,	[%l7 + %l3]
	fpadd32	%f16,	%f4,	%f6
	movcs	%icc,	%o1,	%g4
	edge32n	%g7,	%o7,	%i7
	edge8n	%g1,	%g6,	%o6
	udivcc	%g3,	0x10A2,	%i4
	movvc	%icc,	%i1,	%o2
	stw	%i0,	[%l7 + 0x10]
	or	%l6,	%g5,	%l4
	restore %l0, %l3, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o4,	%l1,	%o3
	ldub	[%l7 + 0x47],	%l5
	mova	%icc,	%o5,	%i5
	movg	%xcc,	%i6,	%o0
	fmul8ulx16	%f16,	%f22,	%f6
	movg	%icc,	%l2,	%i2
	movrgez	%i3,	%o1,	%g4
	udivx	%g7,	0x0432,	%i7
	fmovsne	%xcc,	%f30,	%f11
	fmovrde	%g1,	%f12,	%f18
	udiv	%o7,	0x0B0F,	%o6
	srax	%g3,	0x09,	%i4
	sethi	0x1B80,	%i1
	xor	%g6,	0x13B6,	%o2
	movrlz	%l6,	0x1DC,	%g5
	edge32l	%l4,	%i0,	%l0
	sdiv	%l3,	0x162F,	%g2
	fzeros	%f22
	udivcc	%o4,	0x0869,	%l1
	sra	%l5,	0x0F,	%o3
	movcc	%icc,	%o5,	%i5
	and	%i6,	%l2,	%i2
	array32	%o0,	%i3,	%g4
	udivx	%o1,	0x1FD2,	%i7
	fandnot2	%f18,	%f20,	%f26
	move	%icc,	%g7,	%o7
	sir	0x1F26
	fcmpeq16	%f22,	%f6,	%g1
	movrlez	%g3,	0x3EB,	%o6
	fpack32	%f4,	%f24,	%f20
	ldd	[%l7 + 0x10],	%i4
	movl	%xcc,	%g6,	%o2
	fzeros	%f8
	fmovdpos	%icc,	%f5,	%f25
	umul	%l6,	%g5,	%l4
	addc	%i1,	0x05D1,	%i0
	fmovrsgz	%l0,	%f22,	%f6
	move	%xcc,	%l3,	%g2
	ldd	[%l7 + 0x58],	%f0
	movcs	%icc,	%o4,	%l5
	edge16ln	%l1,	%o3,	%i5
	fmul8x16	%f22,	%f4,	%f24
	nop
	set	0x0E, %g3
	ldsb	[%l7 + %g3],	%o5
	movvc	%xcc,	%i6,	%l2
	fpadd32s	%f3,	%f26,	%f15
	sdivcc	%i2,	0x1D6F,	%o0
	ldsw	[%l7 + 0x3C],	%i3
	move	%xcc,	%g4,	%i7
	add	%o1,	%o7,	%g1
	sdiv	%g7,	0x0977,	%g3
	sdivx	%i4,	0x000B,	%g6
	sth	%o2,	[%l7 + 0x6A]
	ldsb	[%l7 + 0x11],	%l6
	fabsd	%f18,	%f10
	movrgz	%o6,	0x31C,	%l4
	sllx	%g5,	0x16,	%i0
	xnorcc	%i1,	%l3,	%g2
	umul	%l0,	0x078D,	%l5
	sth	%o4,	[%l7 + 0x3C]
	smul	%l1,	0x177A,	%o3
	fcmple16	%f18,	%f18,	%o5
	array8	%i5,	%l2,	%i6
	sllx	%o0,	0x1E,	%i3
	movrlz	%i2,	0x27E,	%i7
	subccc	%g4,	%o7,	%o1
	popc	%g7,	%g1
	andn	%g3,	0x1878,	%g6
	edge32	%o2,	%i4,	%l6
	stw	%l4,	[%l7 + 0x20]
	edge16ln	%o6,	%g5,	%i0
	xnorcc	%l3,	0x0811,	%g2
	fmovrsgz	%i1,	%f25,	%f25
	movvs	%icc,	%l0,	%o4
	movvs	%xcc,	%l1,	%l5
	ldd	[%l7 + 0x08],	%o4
	lduw	[%l7 + 0x5C],	%o3
	addcc	%i5,	0x0BDA,	%l2
	edge32ln	%o0,	%i6,	%i2
	mova	%icc,	%i7,	%g4
	movrne	%i3,	0x0CB,	%o1
	movcs	%icc,	%o7,	%g1
	fsrc1	%f12,	%f2
	sth	%g7,	[%l7 + 0x50]
	edge8	%g3,	%o2,	%i4
	sdivx	%l6,	0x0C17,	%g6
	edge16ln	%l4,	%o6,	%i0
	subcc	%g5,	0x0D59,	%l3
	movcs	%xcc,	%g2,	%l0
	andncc	%o4,	%i1,	%l1
	orncc	%o5,	%o3,	%i5
	ld	[%l7 + 0x24],	%f2
	fpadd16s	%f14,	%f9,	%f14
	fmovdg	%xcc,	%f4,	%f31
	xnorcc	%l2,	0x0736,	%o0
	alignaddrl	%i6,	%l5,	%i7
	movrgez	%g4,	%i3,	%i2
	fmovdcc	%icc,	%f16,	%f19
	movrgz	%o7,	0x392,	%o1
	lduh	[%l7 + 0x18],	%g1
	xorcc	%g3,	%o2,	%i4
	fnand	%f22,	%f16,	%f24
	fcmple16	%f6,	%f24,	%g7
	smul	%l6,	%l4,	%o6
	fpsub32s	%f8,	%f9,	%f21
	fmovse	%xcc,	%f16,	%f28
	xnorcc	%i0,	%g6,	%g5
	orcc	%g2,	0x1D3A,	%l0
	sir	0x1991
	udivcc	%o4,	0x00AE,	%i1
	ldd	[%l7 + 0x50],	%l2
	fmovsg	%icc,	%f6,	%f18
	xorcc	%o5,	0x0FA8,	%l1
	edge16ln	%i5,	%o3,	%o0
	fmovdgu	%icc,	%f29,	%f11
	lduh	[%l7 + 0x12],	%i6
	array32	%l5,	%i7,	%l2
	nop
	set	0x40, %i3
	stw	%i3,	[%l7 + %i3]
	movle	%icc,	%g4,	%o7
	movrlz	%o1,	%i2,	%g1
	fmovdpos	%icc,	%f16,	%f11
	udivcc	%g3,	0x0A6D,	%i4
	fpadd16s	%f29,	%f18,	%f27
	smulcc	%g7,	%o2,	%l4
	ldsb	[%l7 + 0x1E],	%o6
	or	%l6,	0x137B,	%g6
	siam	0x5
	movcc	%xcc,	%i0,	%g2
	fandnot1	%f4,	%f16,	%f18
	andncc	%l0,	%o4,	%i1
	sethi	0x0C98,	%l3
	movneg	%icc,	%o5,	%l1
	movne	%xcc,	%i5,	%o3
	or	%o0,	0x08AF,	%g5
	sllx	%l5,	%i7,	%l2
	edge32ln	%i6,	%g4,	%o7
	subc	%i3,	%o1,	%g1
	fones	%f12
	stb	%g3,	[%l7 + 0x1E]
	ld	[%l7 + 0x18],	%f7
	smul	%i4,	0x171B,	%i2
	xorcc	%g7,	%o2,	%o6
	array32	%l4,	%g6,	%l6
	sth	%i0,	[%l7 + 0x16]
	fmovsn	%icc,	%f21,	%f4
	srax	%g2,	%l0,	%o4
	orn	%l3,	0x1788,	%o5
	movrgz	%l1,	0x019,	%i1
	ld	[%l7 + 0x6C],	%f21
	fcmpne32	%f26,	%f10,	%o3
	xor	%i5,	0x0427,	%g5
	fmovsn	%icc,	%f2,	%f21
	subccc	%o0,	%l5,	%i7
	edge32n	%l2,	%i6,	%g4
	alignaddr	%i3,	%o7,	%o1
	save %g3, %g1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i4,	0x1C83,	%g7
	udivx	%o2,	0x1443,	%o6
	fsrc1	%f2,	%f26
	movleu	%icc,	%g6,	%l4
	move	%xcc,	%l6,	%g2
	fmovdcc	%xcc,	%f24,	%f8
	move	%icc,	%l0,	%o4
	fxnor	%f18,	%f2,	%f2
	fcmped	%fcc2,	%f28,	%f22
	movleu	%xcc,	%i0,	%l3
	alignaddr	%l1,	%o5,	%o3
	orncc	%i1,	%g5,	%o0
	movcs	%xcc,	%l5,	%i7
	movneg	%xcc,	%l2,	%i6
	movrgz	%i5,	%g4,	%i3
	subc	%o1,	0x1AB9,	%g3
	mulscc	%g1,	%i2,	%o7
	ldub	[%l7 + 0x1C],	%g7
	stw	%i4,	[%l7 + 0x28]
	fmovdcs	%icc,	%f23,	%f4
	fmovdge	%xcc,	%f31,	%f8
	smulcc	%o6,	0x1EF7,	%o2
	edge32l	%g6,	%l6,	%g2
	fmovsvs	%icc,	%f15,	%f15
	fnor	%f26,	%f8,	%f18
	sdivx	%l4,	0x1A75,	%o4
	movrlz	%l0,	0x1E0,	%l3
	sdiv	%l1,	0x1E5D,	%i0
	edge16l	%o5,	%i1,	%g5
	fands	%f26,	%f9,	%f3
	umul	%o0,	0x0326,	%l5
	and	%o3,	0x0350,	%i7
	mova	%xcc,	%i6,	%l2
	edge16l	%i5,	%g4,	%o1
	fxors	%f27,	%f14,	%f6
	fnegs	%f25,	%f28
	pdist	%f24,	%f2,	%f30
	fmovdle	%xcc,	%f11,	%f6
	ld	[%l7 + 0x08],	%f19
	movrgz	%i3,	0x211,	%g1
	fmovrslz	%i2,	%f27,	%f16
	ldub	[%l7 + 0x2D],	%o7
	and	%g7,	0x1198,	%i4
	fnot1s	%f25,	%f5
	faligndata	%f28,	%f24,	%f10
	or	%g3,	%o2,	%g6
	xorcc	%l6,	0x01EF,	%g2
	fzeros	%f4
	alignaddrl	%l4,	%o6,	%l0
	ldd	[%l7 + 0x78],	%l2
	setx loop_98, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_98: 	restore %o4, 0x0840, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o0,	%l5
	movg	%icc,	%o3,	%g5
	movn	%xcc,	%i6,	%l2
	st	%f8,	[%l7 + 0x3C]
	movl	%xcc,	%i5,	%i7
	subccc	%o1,	%g4,	%g1
	ldsh	[%l7 + 0x66],	%i2
	movpos	%icc,	%o7,	%i3
	fcmple32	%f2,	%f4,	%i4
	fpmerge	%f31,	%f31,	%f18
	mulx	%g3,	%g7,	%o2
	andncc	%l6,	%g6,	%g2
	movcs	%xcc,	%o6,	%l4
	fxor	%f16,	%f30,	%f4
	fmovrdgz	%l3,	%f4,	%f20
	srax	%l0,	%i0,	%o5
	xor	%l1,	%o4,	%o0
	subccc	%l5,	%o3,	%g5
	andncc	%i6,	%i1,	%i5
	alignaddrl	%i7,	%o1,	%l2
	movcc	%icc,	%g1,	%i2
	fnot2s	%f1,	%f19
	fnot1s	%f1,	%f26
	movgu	%xcc,	%g4,	%o7
	movrne	%i4,	%g3,	%g7
	array32	%i3,	%o2,	%l6
	stb	%g2,	[%l7 + 0x24]
	andn	%g6,	0x1555,	%o6
	array16	%l3,	%l4,	%i0
	andcc	%l0,	0x0CD1,	%o5
	sra	%o4,	0x07,	%l1
	fmul8x16au	%f2,	%f1,	%f0
	edge16n	%l5,	%o0,	%o3
	movge	%xcc,	%g5,	%i6
	alignaddrl	%i5,	%i1,	%i7
	fmovrdlez	%o1,	%f26,	%f0
	movrne	%g1,	%l2,	%g4
	sdivcc	%i2,	0x13D4,	%o7
	umul	%g3,	%g7,	%i3
	setx loop_99, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_99: 	orcc	%g2,	0x1F7F,	%o2
	fxnor	%f10,	%f6,	%f0
	movg	%icc,	%o6,	%l3
	edge8ln	%l4,	%g6,	%l0
	fmul8x16al	%f27,	%f5,	%f0
	fnor	%f20,	%f14,	%f6
	fcmple16	%f2,	%f8,	%o5
	orncc	%i0,	%l1,	%l5
	lduw	[%l7 + 0x18],	%o0
	array8	%o4,	%o3,	%i6
	fone	%f20
	edge32	%i5,	%g5,	%i7
	movneg	%icc,	%i1,	%g1
	stx	%l2,	[%l7 + 0x48]
	faligndata	%f18,	%f2,	%f10
	udiv	%g4,	0x109B,	%i2
	sir	0x1BB9
	edge16l	%o7,	%g3,	%o1
	fmovdne	%icc,	%f16,	%f24
	fmovrsne	%g7,	%f7,	%f20
	lduw	[%l7 + 0x60],	%i3
	movcc	%xcc,	%i4,	%g2
	edge16ln	%o2,	%l6,	%l3
	movvs	%icc,	%o6,	%g6
	movle	%xcc,	%l0,	%l4
	fsrc2s	%f29,	%f5
	pdist	%f26,	%f18,	%f8
	fpsub16	%f18,	%f30,	%f2
	popc	%o5,	%l1
	movrgz	%i0,	%l5,	%o0
	nop
	set	0x24, %g6
	lduw	[%l7 + %g6],	%o3
	ldd	[%l7 + 0x18],	%f0
	orn	%i6,	%o4,	%i5
	xor	%i7,	0x0B17,	%i1
	std	%f20,	[%l7 + 0x60]
	edge16ln	%g5,	%g1,	%l2
	sethi	0x15B4,	%g4
	xnor	%o7,	0x17F7,	%i2
	movrlz	%o1,	%g7,	%g3
	udivx	%i4,	0x0C2E,	%i3
	subccc	%o2,	%l6,	%l3
	array8	%o6,	%g6,	%g2
	fornot1s	%f22,	%f2,	%f2
	fpadd16s	%f5,	%f19,	%f25
	fnegd	%f26,	%f12
	movrlez	%l0,	%l4,	%l1
	movre	%i0,	0x10B,	%o5
	ldd	[%l7 + 0x10],	%l4
	movneg	%icc,	%o3,	%i6
	move	%xcc,	%o4,	%i5
	subccc	%i7,	%i1,	%g5
	fpadd32	%f0,	%f30,	%f22
	popc	%o0,	%l2
	fpack16	%f26,	%f30
	bshuffle	%f20,	%f26,	%f12
	fmovrdlez	%g1,	%f2,	%f2
	fmovdg	%icc,	%f13,	%f15
	andn	%g4,	0x11B3,	%i2
	fmul8x16au	%f5,	%f7,	%f30
	ld	[%l7 + 0x10],	%f26
	movl	%icc,	%o7,	%o1
	sdivx	%g3,	0x0602,	%i4
	fmul8x16al	%f7,	%f13,	%f26
	orcc	%i3,	%g7,	%o2
	movg	%xcc,	%l6,	%o6
	fmovsgu	%xcc,	%f8,	%f2
	fcmpgt16	%f8,	%f8,	%g6
	andn	%l3,	%l0,	%l4
	movpos	%xcc,	%l1,	%i0
	srlx	%g2,	%o5,	%l5
	subcc	%i6,	0x1FE7,	%o3
	smul	%i5,	0x1466,	%i7
	fcmps	%fcc0,	%f0,	%f2
	udiv	%o4,	0x160D,	%i1
	fornot2	%f28,	%f18,	%f4
	ldub	[%l7 + 0x14],	%g5
	ldd	[%l7 + 0x78],	%o0
	popc	%g1,	%g4
	xnor	%l2,	%o7,	%i2
	fnegs	%f25,	%f1
	sdivx	%g3,	0x1646,	%i4
	addccc	%i3,	%o1,	%o2
	ldub	[%l7 + 0x6F],	%g7
	array8	%l6,	%o6,	%l3
	fmovdle	%icc,	%f24,	%f19
	udivcc	%g6,	0x16BD,	%l0
	xor	%l4,	%l1,	%g2
	xor	%i0,	0x135D,	%l5
	subc	%i6,	0x04CD,	%o3
	andn	%o5,	%i5,	%i7
	fnor	%f22,	%f20,	%f8
	sth	%o4,	[%l7 + 0x2C]
	movneg	%xcc,	%i1,	%g5
	mulx	%o0,	%g4,	%g1
	fmul8ulx16	%f24,	%f2,	%f16
	ldd	[%l7 + 0x08],	%l2
	edge32n	%o7,	%g3,	%i4
	subccc	%i3,	%i2,	%o1
	fzeros	%f6
	sdivx	%o2,	0x1F08,	%g7
	xorcc	%o6,	0x092C,	%l3
	fcmpgt32	%f6,	%f18,	%g6
	subc	%l6,	0x02D1,	%l0
	sub	%l1,	%l4,	%g2
	srlx	%l5,	0x02,	%i0
	fnor	%f24,	%f6,	%f0
	fpsub16	%f16,	%f26,	%f0
	edge32l	%i6,	%o3,	%o5
	srlx	%i7,	0x10,	%o4
	array16	%i5,	%i1,	%g5
	sir	0x14FB
	stx	%o0,	[%l7 + 0x38]
	umulcc	%g1,	0x1E15,	%g4
	ld	[%l7 + 0x34],	%f25
	addcc	%o7,	%l2,	%g3
	fmovrsne	%i3,	%f13,	%f15
	movpos	%xcc,	%i2,	%o1
	edge16	%i4,	%o2,	%o6
	lduw	[%l7 + 0x5C],	%l3
	fsrc1s	%f11,	%f10
	xnor	%g7,	%l6,	%g6
	subccc	%l1,	0x04E0,	%l4
	edge16n	%l0,	%l5,	%i0
	fand	%f6,	%f30,	%f24
	orn	%g2,	%o3,	%i6
	ldsb	[%l7 + 0x2D],	%i7
	fmovsl	%icc,	%f6,	%f30
	fmovsgu	%xcc,	%f19,	%f1
	pdist	%f2,	%f28,	%f18
	movrlz	%o4,	0x0F7,	%o5
	fcmpd	%fcc0,	%f24,	%f10
	edge8l	%i1,	%i5,	%g5
	movge	%icc,	%g1,	%g4
	movgu	%xcc,	%o0,	%l2
	sllx	%g3,	0x18,	%i3
	fmovd	%f22,	%f4
	lduh	[%l7 + 0x5E],	%i2
	siam	0x5
	udiv	%o1,	0x0D09,	%o7
	movrne	%o2,	0x00E,	%i4
	addccc	%o6,	%g7,	%l3
	orncc	%g6,	0x0422,	%l6
	sllx	%l1,	0x03,	%l4
	fcmpne32	%f30,	%f16,	%l5
	movrgz	%i0,	0x260,	%l0
	orcc	%o3,	%i6,	%g2
	alignaddrl	%i7,	%o5,	%o4
	sir	0x139F
	xor	%i5,	%g5,	%i1
	addccc	%g4,	0x0032,	%g1
	save %l2, %o0, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g3,	%i2,	%o7
	fmovsleu	%xcc,	%f22,	%f15
	mova	%xcc,	%o2,	%i4
	fcmpgt16	%f14,	%f12,	%o6
	edge16l	%g7,	%l3,	%o1
	edge16ln	%g6,	%l6,	%l4
	addc	%l5,	%l1,	%i0
	movl	%xcc,	%l0,	%i6
	orcc	%g2,	%o3,	%o5
	edge16n	%i7,	%i5,	%o4
	sth	%g5,	[%l7 + 0x76]
	addccc	%g4,	%i1,	%l2
	add	%g1,	%o0,	%i3
	lduw	[%l7 + 0x24],	%i2
	array32	%g3,	%o2,	%o7
	restore %i4, %o6, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g7,	0x1A14,	%o1
	subc	%l6,	0x1417,	%g6
	setx loop_100, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_100: 	xor	%l1,	%l0,	%g2
	udiv	%i6,	0x0CCF,	%o3
	fcmped	%fcc3,	%f2,	%f14
	smulcc	%i7,	%o5,	%i5
	fornot1	%f16,	%f24,	%f8
	fmovsle	%xcc,	%f31,	%f21
	nop
	set	0x5C, %o7
	stw	%g5,	[%l7 + %o7]
	xorcc	%g4,	%i1,	%o4
	srl	%l2,	0x0B,	%g1
	orncc	%i3,	0x00B5,	%i2
	fxnor	%f20,	%f8,	%f28
	stb	%o0,	[%l7 + 0x62]
	fmovrdgez	%o2,	%f30,	%f22
	srl	%o7,	%i4,	%o6
	sra	%g3,	0x1B,	%g7
	sir	0x1263
	fcmpd	%fcc0,	%f26,	%f22
	restore %l3, 0x09F1, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%g6,	%l6
	xorcc	%l5,	0x0C44,	%l4
	movl	%icc,	%i0,	%l0
	save %l1, 0x1D34, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f9,	%f25,	%f7
	fpadd32	%f14,	%f18,	%f30
	fmovrsgz	%i6,	%f20,	%f23
	movleu	%icc,	%o3,	%i7
	nop
	set	0x78, %g7
	ldx	[%l7 + %g7],	%i5
	fnors	%f4,	%f10,	%f29
	orn	%o5,	%g5,	%i1
	fmovsg	%xcc,	%f18,	%f27
	fmovrdgz	%g4,	%f0,	%f16
	smul	%o4,	%l2,	%i3
	array16	%i2,	%o0,	%g1
	sdivcc	%o2,	0x1899,	%i4
	movcs	%xcc,	%o7,	%g3
	fmovrdgez	%g7,	%f20,	%f12
	edge8ln	%o6,	%o1,	%l3
	lduh	[%l7 + 0x1E],	%g6
	nop
	set	0x10, %l4
	ldx	[%l7 + %l4],	%l6
	edge8l	%l4,	%l5,	%l0
	smulcc	%i0,	0x1011,	%g2
	movpos	%icc,	%i6,	%o3
	alignaddrl	%l1,	%i7,	%i5
	srlx	%g5,	%i1,	%o5
	orncc	%o4,	0x1AA4,	%g4
	edge16l	%l2,	%i3,	%i2
	stb	%o0,	[%l7 + 0x5F]
	andncc	%g1,	%o2,	%i4
	addccc	%g3,	%o7,	%o6
	stw	%o1,	[%l7 + 0x18]
	ldsh	[%l7 + 0x76],	%l3
	fmovrsgz	%g6,	%f15,	%f27
	addc	%l6,	%l4,	%l5
	smul	%g7,	0x08C2,	%l0
	sethi	0x11DD,	%g2
	movrlez	%i0,	%i6,	%l1
	edge8n	%o3,	%i7,	%g5
	sdivx	%i1,	0x1969,	%i5
	andncc	%o4,	%g4,	%o5
	andcc	%i3,	0x0EF4,	%l2
	srax	%o0,	0x03,	%i2
	movcc	%icc,	%o2,	%g1
	fmuld8sux16	%f10,	%f8,	%f22
	srl	%i4,	%g3,	%o6
	movcc	%xcc,	%o1,	%l3
	ldd	[%l7 + 0x78],	%g6
	lduh	[%l7 + 0x0C],	%l6
	ld	[%l7 + 0x10],	%f7
	fmovsg	%icc,	%f17,	%f12
	fmul8sux16	%f2,	%f4,	%f6
	fpackfix	%f12,	%f17
	fmovrdgz	%o7,	%f30,	%f18
	ldsb	[%l7 + 0x4C],	%l5
	smulcc	%l4,	%l0,	%g7
	andcc	%i0,	%i6,	%l1
	save %g2, %i7, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i1,	%i5,	%g5
	lduw	[%l7 + 0x2C],	%o4
	edge8	%o5,	%g4,	%i3
	edge16	%o0,	%i2,	%l2
	edge32n	%o2,	%i4,	%g3
	movrlez	%g1,	0x2B1,	%o1
	movge	%icc,	%o6,	%l3
	udivcc	%l6,	0x01EB,	%o7
	movgu	%xcc,	%l5,	%g6
	sub	%l0,	0x1EAA,	%g7
	edge16	%i0,	%l4,	%l1
	movrlez	%i6,	%i7,	%o3
	movne	%icc,	%i1,	%g2
	srax	%g5,	%i5,	%o4
	movvc	%icc,	%g4,	%o5
	alignaddrl	%o0,	%i3,	%l2
	movcc	%icc,	%i2,	%i4
	mulscc	%o2,	%g3,	%o1
	andn	%o6,	0x0F3E,	%g1
	movrlez	%l3,	%l6,	%l5
	movrlez	%g6,	0x3F6,	%o7
	fabss	%f14,	%f20
	edge16n	%l0,	%i0,	%l4
	stx	%l1,	[%l7 + 0x08]
	pdist	%f14,	%f4,	%f12
	ld	[%l7 + 0x68],	%f5
	array8	%g7,	%i7,	%i6
	movrlez	%i1,	0x20E,	%o3
	movvs	%xcc,	%g2,	%i5
	ldsw	[%l7 + 0x64],	%g5
	fornot1	%f14,	%f24,	%f2
	ld	[%l7 + 0x6C],	%f30
	ldsb	[%l7 + 0x25],	%o4
	fmovrdlez	%g4,	%f12,	%f22
	add	%o0,	0x1BCD,	%o5
	array8	%l2,	%i2,	%i4
	movgu	%xcc,	%i3,	%g3
	fmovrsgz	%o1,	%f6,	%f29
	movn	%xcc,	%o6,	%o2
	edge16	%g1,	%l6,	%l5
	fmovrde	%l3,	%f8,	%f12
	orncc	%o7,	%l0,	%i0
	xorcc	%g6,	%l4,	%g7
	ldub	[%l7 + 0x0F],	%l1
	and	%i6,	0x09D4,	%i7
	sll	%o3,	0x09,	%g2
	sethi	0x1CEE,	%i5
	umul	%g5,	0x1023,	%o4
	movrlez	%i1,	%g4,	%o5
	sdivx	%o0,	0x1BCD,	%i2
	subccc	%l2,	%i4,	%i3
	sll	%o1,	%g3,	%o6
	ldsh	[%l7 + 0x60],	%g1
	movcc	%icc,	%l6,	%l5
	popc	0x03AC,	%l3
	pdist	%f22,	%f4,	%f6
	fpack32	%f30,	%f26,	%f24
	mulscc	%o2,	%o7,	%l0
	edge8ln	%i0,	%g6,	%l4
	movcs	%icc,	%l1,	%g7
	srax	%i7,	0x14,	%i6
	mulscc	%g2,	0x0923,	%o3
	fcmpeq16	%f18,	%f18,	%i5
	ldx	[%l7 + 0x40],	%g5
	edge32	%o4,	%g4,	%o5
	sdivx	%i1,	0x167E,	%o0
	ldub	[%l7 + 0x7B],	%l2
	movne	%icc,	%i4,	%i2
	mulscc	%i3,	0x1A62,	%o1
	movre	%o6,	%g1,	%g3
	edge16l	%l5,	%l6,	%o2
	movpos	%icc,	%l3,	%o7
	sllx	%l0,	%g6,	%i0
	or	%l4,	0x1E54,	%g7
	sll	%l1,	0x0E,	%i7
	ldsh	[%l7 + 0x60],	%g2
	fnands	%f23,	%f1,	%f4
	edge8	%o3,	%i5,	%i6
	alignaddrl	%o4,	%g4,	%o5
	udiv	%i1,	0x1C78,	%o0
	fmovrdne	%l2,	%f16,	%f10
	ldsb	[%l7 + 0x0C],	%i4
	smul	%g5,	%i3,	%o1
	movrlez	%o6,	0x2D1,	%i2
	fabss	%f7,	%f15
	movrlez	%g1,	0x02E,	%l5
	movre	%g3,	0x30B,	%l6
	fand	%f8,	%f8,	%f4
	fzeros	%f16
	xorcc	%o2,	%o7,	%l3
	popc	%g6,	%i0
	movge	%xcc,	%l0,	%g7
	st	%f8,	[%l7 + 0x68]
	fmovscs	%icc,	%f8,	%f6
	fmovrdlz	%l1,	%f18,	%f2
	ldsw	[%l7 + 0x20],	%l4
	fpackfix	%f14,	%f20
	edge16n	%i7,	%g2,	%o3
	fmul8x16	%f3,	%f20,	%f14
	nop
	set	0x1E, %l5
	ldub	[%l7 + %l5],	%i5
	ldd	[%l7 + 0x30],	%o4
	edge8l	%i6,	%g4,	%o5
	fands	%f5,	%f12,	%f7
	fors	%f22,	%f17,	%f14
	fandnot2	%f26,	%f16,	%f18
	edge16l	%i1,	%l2,	%i4
	st	%f15,	[%l7 + 0x08]
	udivcc	%o0,	0x14BE,	%i3
	alignaddrl	%g5,	%o6,	%o1
	move	%icc,	%g1,	%i2
	fmovsg	%xcc,	%f3,	%f10
	ldub	[%l7 + 0x78],	%g3
	fpadd16	%f0,	%f2,	%f22
	edge8ln	%l6,	%o2,	%o7
	movcc	%icc,	%l3,	%l5
	ldx	[%l7 + 0x70],	%g6
	movrgz	%l0,	0x3FD,	%i0
	smulcc	%l1,	%g7,	%l4
	edge8n	%g2,	%o3,	%i7
	edge8l	%o4,	%i6,	%g4
	fmovscc	%xcc,	%f27,	%f28
	subccc	%i5,	0x0DF3,	%i1
	fmovsgu	%icc,	%f29,	%f3
	edge16	%l2,	%o5,	%o0
	sdivx	%i3,	0x0270,	%i4
	edge8	%g5,	%o1,	%o6
	fmuld8sux16	%f16,	%f19,	%f28
	sdivx	%i2,	0x0657,	%g3
	fmovsleu	%icc,	%f25,	%f0
	fandnot2	%f0,	%f20,	%f0
	movre	%l6,	0x0C3,	%g1
	movvc	%icc,	%o7,	%o2
	sllx	%l5,	0x01,	%l3
	stx	%l0,	[%l7 + 0x30]
	fornot1	%f14,	%f8,	%f14
	sth	%i0,	[%l7 + 0x2C]
	fsrc2	%f24,	%f2
	sethi	0x1360,	%g6
	addc	%l1,	0x1A15,	%l4
	movle	%xcc,	%g7,	%o3
	smulcc	%i7,	0x122A,	%o4
	nop
	set	0x60, %i7
	ldsh	[%l7 + %i7],	%i6
	udivx	%g2,	0x1903,	%i5
	orcc	%i1,	0x1FEE,	%l2
	movgu	%icc,	%g4,	%o0
	andcc	%o5,	0x0CAB,	%i3
	array8	%i4,	%g5,	%o6
	fmovdpos	%xcc,	%f17,	%f13
	sllx	%o1,	%i2,	%g3
	sdivx	%l6,	0x186F,	%g1
	sra	%o2,	%o7,	%l3
	edge8ln	%l0,	%i0,	%l5
	andn	%g6,	%l4,	%l1
	movneg	%xcc,	%o3,	%g7
	orn	%i7,	%i6,	%o4
	fmovrsgz	%i5,	%f8,	%f0
	srax	%g2,	%l2,	%i1
	fmovdcc	%xcc,	%f0,	%f0
	movrgez	%g4,	%o5,	%o0
	andn	%i3,	%g5,	%o6
	ldd	[%l7 + 0x10],	%f8
	ldx	[%l7 + 0x48],	%i4
	mova	%icc,	%i2,	%g3
	edge32n	%l6,	%g1,	%o2
	umul	%o1,	%o7,	%l0
	srl	%i0,	%l3,	%g6
	subc	%l4,	0x1FEF,	%l5
	movgu	%xcc,	%o3,	%g7
	sub	%i7,	%l1,	%i6
	xnorcc	%i5,	%g2,	%l2
	movcc	%icc,	%o4,	%g4
	srlx	%o5,	%i1,	%o0
	orncc	%i3,	0x1C2C,	%o6
	movl	%xcc,	%i4,	%i2
	alignaddr	%g5,	%g3,	%l6
	addcc	%g1,	%o2,	%o7
	ldd	[%l7 + 0x60],	%f14
	xnor	%o1,	%i0,	%l0
	mulscc	%g6,	%l3,	%l5
	fzero	%f0
	fandnot1s	%f26,	%f3,	%f27
	addccc	%o3,	%l4,	%g7
	andcc	%l1,	0x1DA2,	%i6
	movgu	%xcc,	%i5,	%i7
	fnegs	%f18,	%f8
	andcc	%l2,	0x1F8B,	%o4
	edge8	%g2,	%g4,	%o5
	movl	%xcc,	%i1,	%o0
	sdivx	%i3,	0x05BE,	%i4
	and	%o6,	0x03A5,	%g5
	sll	%i2,	%l6,	%g3
	movl	%icc,	%o2,	%g1
	fmovrse	%o7,	%f3,	%f16
	fmovsge	%xcc,	%f16,	%f11
	movge	%icc,	%i0,	%l0
	movcc	%xcc,	%g6,	%o1
	stb	%l5,	[%l7 + 0x51]
	movle	%icc,	%l3,	%l4
	fmovrsgez	%o3,	%f18,	%f5
	mulscc	%g7,	%l1,	%i5
	movgu	%icc,	%i6,	%i7
	fmovscs	%xcc,	%f31,	%f2
	movgu	%icc,	%l2,	%o4
	array16	%g4,	%g2,	%i1
	sir	0x00B4
	movre	%o5,	%o0,	%i4
	movrlz	%o6,	%g5,	%i2
	alignaddrl	%l6,	%g3,	%o2
	movpos	%icc,	%i3,	%o7
	fcmps	%fcc0,	%f28,	%f1
	xnorcc	%i0,	%g1,	%g6
	sll	%l0,	%o1,	%l3
	fmovrsgz	%l4,	%f14,	%f16
	ldd	[%l7 + 0x30],	%f24
	sdivcc	%o3,	0x0BBE,	%g7
	array16	%l1,	%i5,	%i6
	fmovsn	%icc,	%f28,	%f6
	sth	%l5,	[%l7 + 0x70]
	smulcc	%i7,	%o4,	%l2
	fmovdle	%xcc,	%f12,	%f9
	stx	%g2,	[%l7 + 0x28]
	stw	%g4,	[%l7 + 0x4C]
	sub	%i1,	%o5,	%o0
	ld	[%l7 + 0x6C],	%f1
	stx	%i4,	[%l7 + 0x18]
	addcc	%g5,	%o6,	%i2
	sub	%l6,	0x1ED1,	%o2
	movn	%xcc,	%i3,	%g3
	fmovdvc	%icc,	%f21,	%f22
	udiv	%o7,	0x0216,	%g1
	xorcc	%g6,	0x1F59,	%l0
	movrgez	%o1,	0x28F,	%l3
	edge32n	%i0,	%o3,	%g7
	movneg	%icc,	%l4,	%i5
	fmovdneg	%icc,	%f3,	%f17
	movgu	%icc,	%i6,	%l5
	movre	%i7,	%o4,	%l1
	fmovrdgez	%l2,	%f14,	%f4
	popc	%g4,	%i1
	ldd	[%l7 + 0x78],	%o4
	sdiv	%g2,	0x16E7,	%i4
	fnot1s	%f3,	%f28
	mulscc	%g5,	0x133E,	%o0
	alignaddr	%i2,	%l6,	%o6
	fmul8ulx16	%f24,	%f24,	%f14
	orncc	%o2,	0x0965,	%i3
	ld	[%l7 + 0x5C],	%f22
	edge8	%g3,	%g1,	%o7
	edge32l	%l0,	%g6,	%o1
	fnot1	%f16,	%f30
	movrlez	%l3,	0x048,	%i0
	fornot2	%f4,	%f26,	%f18
	movne	%xcc,	%g7,	%l4
	fmovdneg	%icc,	%f21,	%f12
	movvc	%icc,	%i5,	%i6
	fmovdne	%icc,	%f18,	%f30
	srl	%o3,	0x02,	%l5
	ldd	[%l7 + 0x60],	%f6
	pdist	%f16,	%f0,	%f14
	orncc	%i7,	0x0056,	%o4
	fmovrdlez	%l1,	%f18,	%f24
	sllx	%l2,	0x1A,	%g4
	lduw	[%l7 + 0x30],	%i1
	sll	%o5,	0x17,	%g2
	movge	%icc,	%i4,	%g5
	srlx	%o0,	%l6,	%i2
	movvc	%icc,	%o6,	%o2
	fmovrslez	%i3,	%f0,	%f3
	subccc	%g1,	0x1B3F,	%o7
	or	%g3,	0x1657,	%g6
	movcs	%icc,	%o1,	%l0
	edge8ln	%i0,	%g7,	%l3
	move	%xcc,	%i5,	%l4
	alignaddrl	%o3,	%l5,	%i7
	fmovsg	%icc,	%f17,	%f25
	stb	%i6,	[%l7 + 0x0A]
	array8	%l1,	%o4,	%g4
	fsrc1s	%f4,	%f25
	stx	%i1,	[%l7 + 0x30]
	smul	%l2,	0x0CC2,	%g2
	orn	%i4,	%g5,	%o0
	mulscc	%l6,	0x090B,	%o5
	edge8n	%i2,	%o2,	%i3
	fsrc2	%f24,	%f0
	stb	%o6,	[%l7 + 0x71]
	siam	0x4
	and	%o7,	0x0AFD,	%g1
	sth	%g3,	[%l7 + 0x38]
	addcc	%o1,	%l0,	%i0
	umul	%g6,	%g7,	%i5
	xorcc	%l3,	%l4,	%l5
	std	%f24,	[%l7 + 0x10]
	orcc	%i7,	%i6,	%o3
	lduw	[%l7 + 0x68],	%l1
	edge8	%g4,	%o4,	%i1
	addccc	%g2,	%i4,	%g5
	ldub	[%l7 + 0x31],	%o0
	ldsw	[%l7 + 0x48],	%l6
	fmovrdlez	%o5,	%f12,	%f26
	movvs	%xcc,	%i2,	%l2
	ldsh	[%l7 + 0x42],	%o2
	fmovdn	%icc,	%f20,	%f2
	ldd	[%l7 + 0x58],	%f16
	movvs	%icc,	%i3,	%o6
	movle	%xcc,	%o7,	%g3
	edge8l	%g1,	%o1,	%i0
	fmul8x16au	%f23,	%f5,	%f6
	fpsub32	%f16,	%f6,	%f8
	movrgez	%l0,	0x0A1,	%g6
	stx	%i5,	[%l7 + 0x40]
	edge32l	%l3,	%l4,	%g7
	srlx	%i7,	%i6,	%l5
	sub	%l1,	0x1677,	%o3
	ldd	[%l7 + 0x48],	%g4
	andn	%i1,	0x0CF5,	%o4
	edge16n	%i4,	%g2,	%g5
	movre	%l6,	0x001,	%o0
	stx	%o5,	[%l7 + 0x58]
	fone	%f6
	ldsh	[%l7 + 0x4E],	%l2
	setx loop_101, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_101: 	movrlz	%o7,	%g3,	%g1
	movle	%icc,	%o6,	%i0
	movvc	%xcc,	%l0,	%o1
	fmovdcc	%icc,	%f1,	%f28
	sir	0x0A22
	fpadd16s	%f29,	%f2,	%f7
	fsrc2	%f6,	%f12
	movle	%xcc,	%i5,	%g6
	smulcc	%l4,	%g7,	%l3
	lduw	[%l7 + 0x1C],	%i7
	array8	%l5,	%i6,	%l1
	xnor	%g4,	%o3,	%o4
	orcc	%i4,	%g2,	%i1
	movcs	%icc,	%l6,	%o0
	alignaddr	%o5,	%l2,	%i2
	ld	[%l7 + 0x34],	%f8
	sth	%g5,	[%l7 + 0x1A]
	movvc	%icc,	%i3,	%o2
	edge16n	%g3,	%g1,	%o7
	edge16ln	%i0,	%l0,	%o1
	mulx	%i5,	0x1A07,	%g6
	fmovse	%xcc,	%f22,	%f24
	fmovsvs	%xcc,	%f23,	%f27
	edge32l	%l4,	%o6,	%l3
	and	%g7,	0x07DD,	%i7
	fmovda	%xcc,	%f28,	%f30
	udiv	%l5,	0x1699,	%i6
	sethi	0x04A0,	%l1
	fnegd	%f8,	%f6
	stw	%g4,	[%l7 + 0x78]
	fpack16	%f18,	%f28
	st	%f15,	[%l7 + 0x54]
	mulx	%o3,	0x19A9,	%i4
	fcmpes	%fcc3,	%f3,	%f16
	fsrc2	%f6,	%f0
	umul	%g2,	0x0EDC,	%o4
	movneg	%xcc,	%i1,	%l6
	stx	%o5,	[%l7 + 0x30]
	movg	%xcc,	%o0,	%i2
	edge8n	%l2,	%i3,	%g5
	fmovdvc	%icc,	%f24,	%f3
	movrgz	%g3,	%o2,	%g1
	fandnot1	%f26,	%f12,	%f28
	udiv	%o7,	0x1293,	%l0
	fpackfix	%f30,	%f18
	ldd	[%l7 + 0x40],	%f18
	sub	%o1,	%i0,	%g6
	sir	0x01BA
	ldd	[%l7 + 0x38],	%f26
	edge32	%l4,	%o6,	%l3
	subcc	%g7,	0x16C6,	%i7
	fcmple16	%f14,	%f0,	%i5
	fxors	%f27,	%f1,	%f18
	movne	%xcc,	%l5,	%l1
	fsrc2	%f20,	%f4
	std	%f6,	[%l7 + 0x18]
	orn	%g4,	0x1CDF,	%i6
	udiv	%i4,	0x02DA,	%g2
	orn	%o3,	%i1,	%o4
	edge32ln	%l6,	%o5,	%o0
	movrne	%i2,	0x07A,	%l2
	sllx	%g5,	%i3,	%g3
	fpadd16	%f4,	%f20,	%f24
	fmul8x16	%f29,	%f30,	%f28
	srl	%g1,	0x02,	%o7
	addcc	%o2,	%l0,	%i0
	fpsub16s	%f7,	%f28,	%f13
	addcc	%g6,	0x0EB5,	%o1
	edge16	%l4,	%l3,	%g7
	edge32ln	%o6,	%i5,	%i7
	movvc	%xcc,	%l1,	%l5
	srax	%i6,	0x1A,	%g4
	edge8l	%i4,	%o3,	%g2
	andcc	%i1,	%o4,	%o5
	ldd	[%l7 + 0x08],	%f18
	array8	%o0,	%l6,	%l2
	fmul8ulx16	%f2,	%f24,	%f26
	subcc	%i2,	0x01D1,	%g5
	stx	%i3,	[%l7 + 0x70]
	sdiv	%g1,	0x0ECC,	%g3
	ldd	[%l7 + 0x30],	%o6
	save %o2, %i0, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %g6, 0x186E, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc0,	%f12,	%f30
	sethi	0x1590,	%l4
	or	%l3,	0x0C7B,	%g7
	movcs	%xcc,	%i5,	%i7
	alignaddr	%l1,	%o6,	%i6
	mulscc	%g4,	%i4,	%l5
	array16	%o3,	%i1,	%o4
	edge8l	%g2,	%o5,	%o0
	fnands	%f22,	%f11,	%f10
	mulx	%l2,	%i2,	%l6
	movrgez	%i3,	0x15C,	%g5
	alignaddr	%g3,	%g1,	%o7
	xorcc	%o2,	0x126D,	%i0
	movrne	%g6,	0x28F,	%l0
	andcc	%l4,	0x1336,	%l3
	srax	%o1,	%i5,	%i7
	srlx	%g7,	%l1,	%i6
	movgu	%xcc,	%o6,	%i4
	orcc	%g4,	0x0E9E,	%o3
	sir	0x0681
	alignaddr	%l5,	%i1,	%o4
	sth	%g2,	[%l7 + 0x58]
	fmovdge	%icc,	%f23,	%f31
	mulscc	%o5,	0x181C,	%o0
	subcc	%l2,	%l6,	%i2
	umul	%i3,	%g3,	%g5
	fpadd32	%f6,	%f28,	%f2
	fpadd32s	%f19,	%f0,	%f18
	setx loop_102, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_102: 	fmovsa	%xcc,	%f28,	%f23
	stx	%g1,	[%l7 + 0x30]
	umulcc	%i0,	%l0,	%g6
	sll	%l3,	%l4,	%o1
	movvc	%icc,	%i7,	%i5
	fnot1s	%f25,	%f12
	fmovrdlez	%g7,	%f22,	%f24
	orncc	%l1,	%o6,	%i6
	sllx	%i4,	0x11,	%o3
	ldub	[%l7 + 0x64],	%l5
	movgu	%icc,	%g4,	%o4
	udiv	%g2,	0x1C16,	%o5
	movn	%xcc,	%i1,	%l2
	ldub	[%l7 + 0x5B],	%l6
	ldsb	[%l7 + 0x4A],	%i2
	subccc	%i3,	0x0944,	%o0
	std	%f8,	[%l7 + 0x30]
	fmovsne	%xcc,	%f16,	%f11
	xnorcc	%g5,	0x16F9,	%g3
	fandnot2s	%f17,	%f6,	%f23
	fmovsl	%xcc,	%f24,	%f29
	mulx	%o7,	%g1,	%o2
	array16	%i0,	%l0,	%g6
	movrgz	%l3,	%o1,	%i7
	stw	%i5,	[%l7 + 0x38]
	xnorcc	%g7,	0x0456,	%l4
	fxnor	%f20,	%f0,	%f10
	srl	%o6,	%l1,	%i6
	movge	%icc,	%o3,	%l5
	save %i4, %g4, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o4,	%o5,	%l2
	movvs	%icc,	%i1,	%i2
	fmovrsne	%l6,	%f4,	%f19
	andn	%o0,	0x08BA,	%g5
	orcc	%i3,	%g3,	%g1
	addccc	%o7,	%i0,	%l0
	fmovrslez	%g6,	%f14,	%f19
	movne	%icc,	%l3,	%o2
	orcc	%i7,	0x1BB2,	%i5
	movneg	%xcc,	%g7,	%o1
	ld	[%l7 + 0x30],	%f17
	edge32n	%o6,	%l4,	%l1
	restore %o3, 0x06FA, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x50],	%i4
	lduw	[%l7 + 0x6C],	%i6
	fpack16	%f28,	%f1
	fmovrdgez	%g4,	%f24,	%f24
	movrgz	%o4,	%g2,	%l2
	orncc	%o5,	0x0E28,	%i1
	smulcc	%i2,	%o0,	%l6
	mulscc	%i3,	0x0EA4,	%g5
	fcmple32	%f14,	%f26,	%g3
	smul	%g1,	%i0,	%l0
	sub	%o7,	0x0B10,	%g6
	edge32l	%o2,	%i7,	%l3
	mulx	%g7,	0x0CB0,	%o1
	addcc	%o6,	0x0577,	%l4
	fmul8sux16	%f20,	%f22,	%f26
	std	%f20,	[%l7 + 0x60]
	movl	%icc,	%i5,	%l1
	alignaddrl	%l5,	%o3,	%i4
	edge8l	%g4,	%o4,	%i6
	fnand	%f28,	%f10,	%f30
	xnorcc	%g2,	%l2,	%o5
	movpos	%xcc,	%i2,	%o0
	edge8ln	%i1,	%l6,	%g5
	fxors	%f26,	%f21,	%f0
	edge8ln	%g3,	%g1,	%i0
	fcmps	%fcc1,	%f27,	%f26
	fpmerge	%f11,	%f15,	%f24
	edge16	%i3,	%o7,	%l0
	movn	%xcc,	%o2,	%i7
	alignaddrl	%l3,	%g6,	%g7
	fnot2s	%f20,	%f20
	movvs	%icc,	%o6,	%o1
	fones	%f24
	fmovse	%icc,	%f10,	%f12
	fmovdleu	%icc,	%f31,	%f21
	addc	%l4,	0x02AB,	%i5
	std	%f30,	[%l7 + 0x48]
	save %l5, 0x1D8A, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l1,	%g4,	%o4
	sth	%i4,	[%l7 + 0x4E]
	udivcc	%i6,	0x102A,	%l2
	edge16n	%o5,	%g2,	%o0
	sdivx	%i2,	0x0B1A,	%i1
	add	%g5,	0x0019,	%g3
	and	%l6,	%i0,	%g1
	movle	%xcc,	%o7,	%i3
	move	%icc,	%o2,	%l0
	addc	%l3,	%g6,	%g7
	fsrc2	%f2,	%f28
	ldsh	[%l7 + 0x3C],	%o6
	fmovsl	%icc,	%f8,	%f9
	sra	%i7,	0x06,	%l4
	xor	%o1,	0x0DE9,	%l5
	srl	%i5,	%l1,	%o3
	fmovrdlez	%o4,	%f10,	%f24
	udiv	%g4,	0x1F4B,	%i6
	fnegs	%f11,	%f16
	fmuld8sux16	%f27,	%f19,	%f22
	sub	%l2,	%o5,	%g2
	xnor	%o0,	%i2,	%i4
	edge32n	%i1,	%g3,	%g5
	ldsh	[%l7 + 0x58],	%l6
	sir	0x1E5C
	fmovdne	%icc,	%f8,	%f10
	xnorcc	%g1,	%i0,	%i3
	fnegd	%f28,	%f14
	sub	%o2,	%l0,	%o7
	edge8l	%g6,	%g7,	%l3
	nop
	set	0x09, %l1
	ldsb	[%l7 + %l1],	%i7
	movcs	%icc,	%o6,	%l4
	array32	%l5,	%i5,	%o1
	orncc	%l1,	%o3,	%g4
	fmovsne	%xcc,	%f4,	%f22
	subc	%o4,	%i6,	%o5
	addcc	%l2,	0x0E53,	%g2
	addc	%i2,	0x0414,	%o0
	xor	%i4,	0x1262,	%i1
	orn	%g3,	%g5,	%g1
	fmovsneg	%xcc,	%f7,	%f25
	movvs	%xcc,	%i0,	%i3
	addcc	%l6,	0x106B,	%l0
	subc	%o2,	%g6,	%g7
	edge32n	%o7,	%i7,	%l3
	fands	%f2,	%f16,	%f1
	movge	%icc,	%o6,	%l5
	fzero	%f6
	std	%f8,	[%l7 + 0x08]
	array16	%l4,	%i5,	%o1
	udivx	%l1,	0x1723,	%o3
	sir	0x1405
	movcs	%xcc,	%o4,	%i6
	mulscc	%g4,	0x0821,	%l2
	fmovse	%icc,	%f2,	%f18
	umul	%o5,	0x0E20,	%i2
	movrgz	%g2,	0x3F3,	%i4
	fxnors	%f17,	%f17,	%f24
	fmovdne	%xcc,	%f16,	%f14
	sdiv	%o0,	0x0D42,	%g3
	move	%xcc,	%i1,	%g5
	edge8l	%g1,	%i0,	%l6
	edge8l	%i3,	%l0,	%o2
	array16	%g6,	%o7,	%g7
	fandnot2	%f20,	%f28,	%f28
	move	%xcc,	%i7,	%o6
	fpsub16	%f24,	%f18,	%f10
	movleu	%icc,	%l5,	%l3
	mulx	%i5,	%l4,	%o1
	lduw	[%l7 + 0x44],	%l1
	fzeros	%f25
	fmovsvs	%icc,	%f22,	%f19
	move	%icc,	%o3,	%o4
	xnorcc	%i6,	0x0430,	%l2
	fcmps	%fcc2,	%f16,	%f17
	ldd	[%l7 + 0x50],	%f14
	movgu	%xcc,	%o5,	%g4
	fsrc1	%f26,	%f22
	std	%f10,	[%l7 + 0x58]
	subccc	%i2,	%g2,	%i4
	movrne	%o0,	%i1,	%g3
	movpos	%xcc,	%g5,	%g1
	edge16	%l6,	%i0,	%i3
	fmuld8sux16	%f3,	%f1,	%f0
	fmovrdne	%l0,	%f24,	%f4
	orncc	%g6,	%o7,	%o2
	sra	%g7,	%i7,	%l5
	movrne	%l3,	0x18D,	%o6
	fpadd16	%f30,	%f24,	%f2
	sdiv	%l4,	0x0F3E,	%o1
	fmovd	%f28,	%f10
	fxors	%f23,	%f11,	%f18
	for	%f22,	%f28,	%f0
	addccc	%l1,	0x0B1A,	%o3
	srlx	%i5,	0x0F,	%i6
	movleu	%xcc,	%l2,	%o4
	fmovsle	%icc,	%f3,	%f3
	sll	%o5,	0x11,	%g4
	fmovrslez	%g2,	%f21,	%f9
	addccc	%i2,	0x00B1,	%i4
	sdivx	%i1,	0x1596,	%o0
	sdiv	%g5,	0x04A6,	%g1
	fpadd16s	%f6,	%f7,	%f27
	edge16l	%l6,	%g3,	%i0
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%l0
	movcs	%xcc,	%g6,	%o7
	fmovsg	%icc,	%f30,	%f4
	subccc	%o2,	0x1C5D,	%g7
	edge16ln	%i3,	%l5,	%l3
	fmovda	%icc,	%f16,	%f6
	fnegd	%f16,	%f22
	orncc	%i7,	0x0F56,	%o6
	andncc	%l4,	%l1,	%o1
	fmovsl	%icc,	%f17,	%f16
	edge16ln	%o3,	%i5,	%i6
	fxor	%f18,	%f30,	%f22
	movgu	%icc,	%l2,	%o4
	fmovda	%icc,	%f3,	%f16
	andcc	%g4,	0x0979,	%o5
	sth	%i2,	[%l7 + 0x40]
	array32	%g2,	%i1,	%o0
	add	%g5,	%i4,	%l6
	xnorcc	%g3,	0x06CC,	%i0
	fmovrslez	%l0,	%f19,	%f26
	mulscc	%g6,	0x009C,	%o7
	movg	%icc,	%g1,	%o2
	umulcc	%g7,	%i3,	%l3
	fmovsne	%icc,	%f30,	%f17
	edge8n	%l5,	%o6,	%i7
	setx loop_103, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_103: 	sllx	%o1,	0x14,	%o3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3552
!	Type f   	: 5409
!	Type i   	: 16039
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x4141C3E5
.word 0x875A0910
.word 0x45739CAF
.word 0xADC2674F
.word 0x577C580D
.word 0x82CE4A2D
.word 0x4DB67FCA
.word 0x9F94815C
.word 0x252803F7
.word 0x472D2FC1
.word 0xACE043DE
.word 0x3E46BFC1
.word 0x8613F2A8
.word 0xD121CB93
.word 0xCF3512E2
.word 0x4872B726
.word 0x378E792A
.word 0xC62DE1E4
.word 0xBA22E1E8
.word 0xC79581F3
.word 0x80119E72
.word 0xD1A64886
.word 0x941E32ED
.word 0x923FE7DF
.word 0x6F9C858A
.word 0x985E70F8
.word 0xCB48CEC5
.word 0xF549ED5D
.word 0xC036A7AA
.word 0x84262096
.word 0x22723B61
.word 0x66D7287D
.word 0x0D6684A2
.word 0x83E8B6E0
.word 0xF6E65264
.word 0x47A79BB7
.word 0xD5D7940A
.word 0x039E0674
.word 0xA793BD83
.word 0x2AF3100F
.word 0x8A92DAE8
.word 0xA67646F1
.word 0xECF21444
.word 0x0E7ACD51
.word 0x6875D4BC
.word 0x85C23783
.word 0x1B872AEC
.word 0xA2A8CC03
.word 0x5A69536D
.word 0xEF3C7185
.word 0x166C183A
.word 0xE04C165F
.word 0x1A3EC4CA
.word 0x5C070B6A
.word 0x2F4E4933
.word 0xEF60E0ED
.word 0xEA99D705
.word 0xE756FC37
.word 0x4A8459B7
.word 0xE96E22B8
.word 0xDA9BDAA8
.word 0x26BBC172
.word 0x7C3B8118
.word 0x843A308A
.end
