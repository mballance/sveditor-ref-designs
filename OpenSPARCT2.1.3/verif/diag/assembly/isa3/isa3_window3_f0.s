/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f0.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f0.s,v 1.1 2007/05/11 17:22:35 drp Exp $"
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
	setx	0x2A12341AC0776461,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x3,	%g1
	set	0x9,	%g2
	set	0x2,	%g3
	set	0x1,	%g4
	set	0x0,	%g5
	set	0xE,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0x4,	%i1
	set	-0xC,	%i2
	set	-0xE,	%i3
	set	-0x3,	%i4
	set	-0x2,	%i5
	set	-0x3,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x28470BF8,	%l0
	set	0x787CB0BC,	%l1
	set	0x6C3107DA,	%l2
	set	0x288891CD,	%l3
	set	0x4F0AA806,	%l4
	set	0x283243E4,	%l5
	set	0x457A1655,	%l6
	!# Output registers
	set	0x12D0,	%o0
	set	0x0E50,	%o1
	set	-0x001A,	%o2
	set	0x131F,	%o3
	set	0x0E21,	%o4
	set	-0x08EB,	%o5
	set	0x11E5,	%o6
	set	-0x0273,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xD3E4C4B4191974B4)
	INIT_TH_FP_REG(%l7,%f2,0x0E04887388C30E83)
	INIT_TH_FP_REG(%l7,%f4,0xFFA80C160D2B7223)
	INIT_TH_FP_REG(%l7,%f6,0x304E3BFE37A4B444)
	INIT_TH_FP_REG(%l7,%f8,0xFB0402E171D0E9F8)
	INIT_TH_FP_REG(%l7,%f10,0x7FFB2FAD8E6CB707)
	INIT_TH_FP_REG(%l7,%f12,0x7217B707894B6543)
	INIT_TH_FP_REG(%l7,%f14,0xE559AB25B64E3D77)
	INIT_TH_FP_REG(%l7,%f16,0xDDA0A23356404E33)
	INIT_TH_FP_REG(%l7,%f18,0x9FE972D414CBA001)
	INIT_TH_FP_REG(%l7,%f20,0x5652F42AC64AFB11)
	INIT_TH_FP_REG(%l7,%f22,0xF32EE8138FFC85CC)
	INIT_TH_FP_REG(%l7,%f24,0xE49D04CB3FFABE73)
	INIT_TH_FP_REG(%l7,%f26,0x6DB90C422B227238)
	INIT_TH_FP_REG(%l7,%f28,0x621CAB470B09C96F)
	INIT_TH_FP_REG(%l7,%f30,0xAA4DD31BBBD8CF2D)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDCC, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	sllx	%g2,	0x1F,	%i7
	movne	%xcc,	%i0,	%o4
	mulscc	%l4,	0x04E6,	%g5
	array16	%g6,	%l2,	%l5
	fcmpes	%fcc0,	%f24,	%f15
	orncc	%i2,	%i3,	%o2
	movvs	%xcc,	%g4,	%o3
	ldx	[%l7 + 0x28],	%o0
	fpadd32	%f18,	%f0,	%f10
	sth	%i5,	[%l7 + 0x34]
	orcc	%g1,	0x023B,	%o6
	edge8ln	%g3,	%o5,	%o7
	addccc	%i4,	%g7,	%l3
	save %l1, %l0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%icc,	%f24,	%f12
	movrgz	%i6,	%l6,	%g2
	ld	[%l7 + 0x38],	%f5
	edge32ln	%i7,	%o1,	%i0
	sdiv	%o4,	0x101A,	%l4
	addcc	%g6,	%g5,	%l5
	array8	%i2,	%i3,	%l2
	movrne	%g4,	0x25A,	%o2
	andcc	%o0,	0x1647,	%o3
	edge8n	%i5,	%g1,	%o6
	addc	%g3,	0x1234,	%o5
	fmovdn	%xcc,	%f23,	%f26
	srlx	%o7,	0x03,	%i4
	movge	%icc,	%g7,	%l3
	fnot2	%f10,	%f24
	sllx	%l0,	%i1,	%l1
	movne	%xcc,	%i6,	%g2
	movge	%xcc,	%i7,	%l6
	movvc	%icc,	%o1,	%i0
	nop
	set	0x74, %o2
	ldsb	[%l7 + %o2],	%o4
	fmovrslez	%l4,	%f19,	%f17
	fmovsneg	%xcc,	%f10,	%f10
	fsrc1s	%f7,	%f17
	edge32ln	%g5,	%g6,	%l5
	subcc	%i2,	%i3,	%l2
	fors	%f18,	%f25,	%f25
	edge8ln	%g4,	%o2,	%o3
	smul	%o0,	%i5,	%g1
	alignaddrl	%o6,	%o5,	%o7
	fnands	%f25,	%f1,	%f3
	sll	%i4,	%g3,	%l3
	sll	%l0,	0x17,	%g7
	stw	%i1,	[%l7 + 0x14]
	subccc	%i6,	%l1,	%g2
	orn	%l6,	0x09A0,	%o1
	xor	%i7,	%o4,	%l4
	fcmpne16	%f26,	%f12,	%i0
	movvc	%icc,	%g5,	%g6
	movrlz	%i2,	%i3,	%l2
	movrgez	%l5,	%o2,	%g4
	movrne	%o0,	%i5,	%o3
	sdiv	%g1,	0x0B82,	%o5
	fsrc2	%f10,	%f28
	edge32ln	%o7,	%o6,	%i4
	edge16l	%g3,	%l3,	%g7
	edge16	%l0,	%i1,	%i6
	mulx	%l1,	0x1789,	%g2
	fzeros	%f10
	sdiv	%o1,	0x065C,	%l6
	orn	%o4,	%i7,	%l4
	fnegs	%f15,	%f3
	umul	%g5,	0x10AD,	%g6
	fmovda	%icc,	%f8,	%f17
	sdiv	%i0,	0x0BCB,	%i2
	ldub	[%l7 + 0x7F],	%i3
	stw	%l2,	[%l7 + 0x5C]
	edge8ln	%l5,	%o2,	%g4
	array8	%i5,	%o0,	%o3
	subc	%o5,	%g1,	%o7
	fones	%f19
	ldsb	[%l7 + 0x24],	%o6
	movrlz	%g3,	%i4,	%l3
	nop
	set	0x38, %o3
	stx	%l0,	[%l7 + %o3]
	edge16l	%g7,	%i1,	%i6
	fornot2s	%f4,	%f14,	%f28
	movvc	%icc,	%g2,	%o1
	stx	%l6,	[%l7 + 0x38]
	movn	%icc,	%o4,	%l1
	fmovsle	%icc,	%f17,	%f26
	subc	%i7,	%l4,	%g6
	udiv	%i0,	0x1D75,	%g5
	movpos	%icc,	%i2,	%l2
	ld	[%l7 + 0x30],	%f13
	srl	%l5,	%i3,	%o2
	sll	%g4,	0x01,	%o0
	std	%f0,	[%l7 + 0x18]
	andn	%o3,	%i5,	%g1
	andcc	%o7,	0x08A4,	%o5
	fmovdleu	%icc,	%f8,	%f12
	movgu	%xcc,	%o6,	%i4
	movg	%icc,	%l3,	%l0
	andcc	%g7,	0x11B6,	%i1
	sllx	%i6,	0x0B,	%g3
	xnorcc	%o1,	%g2,	%o4
	ldub	[%l7 + 0x1B],	%l1
	movl	%xcc,	%l6,	%l4
	movleu	%xcc,	%i7,	%g6
	fmul8x16al	%f17,	%f2,	%f6
	restore %g5, 0x0816, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i0,	0x13,	%l5
	movl	%icc,	%l2,	%o2
	fmovscc	%xcc,	%f29,	%f19
	subcc	%g4,	%o0,	%o3
	fmovrde	%i5,	%f10,	%f20
	movrgz	%g1,	%i3,	%o5
	fabss	%f12,	%f9
	fabss	%f21,	%f18
	edge8	%o7,	%i4,	%o6
	sllx	%l3,	%l0,	%i1
	stw	%i6,	[%l7 + 0x18]
	umulcc	%g7,	%o1,	%g3
	xnor	%g2,	%o4,	%l6
	fmovrsne	%l4,	%f16,	%f6
	fmovdleu	%xcc,	%f3,	%f3
	fmovsg	%icc,	%f6,	%f29
	edge16l	%l1,	%i7,	%g6
	array16	%i2,	%g5,	%l5
	srax	%i0,	0x1E,	%o2
	save %g4, 0x05D5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%xcc,	%f1,	%f15
	movrlez	%o3,	%o0,	%i5
	movl	%icc,	%i3,	%o5
	fpackfix	%f6,	%f12
	edge32n	%o7,	%g1,	%i4
	fnand	%f26,	%f12,	%f30
	movcs	%xcc,	%o6,	%l0
	array8	%i1,	%l3,	%i6
	movrgez	%o1,	%g7,	%g3
	movneg	%xcc,	%o4,	%g2
	edge8	%l4,	%l1,	%i7
	movvc	%icc,	%g6,	%i2
	ldd	[%l7 + 0x38],	%i6
	movrgez	%l5,	%i0,	%o2
	mulx	%g5,	0x13E4,	%g4
	subcc	%l2,	%o0,	%i5
	move	%icc,	%i3,	%o5
	udivx	%o7,	0x1DC3,	%o3
	lduw	[%l7 + 0x40],	%i4
	stx	%g1,	[%l7 + 0x18]
	movn	%icc,	%l0,	%o6
	andncc	%i1,	%i6,	%o1
	fxnors	%f10,	%f18,	%f25
	ldx	[%l7 + 0x40],	%l3
	fnors	%f5,	%f22,	%f12
	udiv	%g3,	0x1A39,	%o4
	movcs	%icc,	%g7,	%g2
	fcmpd	%fcc3,	%f8,	%f24
	movneg	%icc,	%l4,	%l1
	ldd	[%l7 + 0x50],	%g6
	addc	%i7,	%i2,	%l5
	movrgz	%i0,	%l6,	%o2
	edge32l	%g4,	%g5,	%o0
	fmovsle	%xcc,	%f5,	%f6
	movleu	%xcc,	%l2,	%i3
	fones	%f7
	xorcc	%o5,	0x18E3,	%o7
	smul	%o3,	%i5,	%i4
	movrlz	%g1,	0x1A6,	%o6
	andncc	%l0,	%i1,	%o1
	ldd	[%l7 + 0x30],	%f4
	sra	%l3,	0x11,	%g3
	stb	%o4,	[%l7 + 0x52]
	ld	[%l7 + 0x40],	%f0
	alignaddrl	%g7,	%g2,	%l4
	array16	%l1,	%i6,	%g6
	movrlez	%i2,	0x225,	%l5
	fcmps	%fcc2,	%f23,	%f9
	or	%i7,	%i0,	%l6
	smulcc	%o2,	0x1951,	%g4
	movneg	%icc,	%g5,	%l2
	fcmple32	%f8,	%f30,	%i3
	orncc	%o5,	0x047E,	%o7
	fmovsg	%xcc,	%f20,	%f1
	fmovsvs	%xcc,	%f7,	%f11
	orn	%o3,	0x0E5B,	%o0
	ldsw	[%l7 + 0x68],	%i4
	ldsh	[%l7 + 0x32],	%g1
	ldsh	[%l7 + 0x60],	%i5
	st	%f20,	[%l7 + 0x7C]
	movrlez	%o6,	%l0,	%o1
	sllx	%i1,	%l3,	%o4
	or	%g3,	0x09F7,	%g2
	movrgez	%g7,	0x2FC,	%l1
	movvs	%xcc,	%i6,	%l4
	edge8ln	%g6,	%i2,	%l5
	ldd	[%l7 + 0x60],	%f30
	sub	%i0,	%i7,	%o2
	mulx	%l6,	%g5,	%l2
	fmovsgu	%icc,	%f4,	%f0
	fmul8x16au	%f20,	%f24,	%f10
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%g4
	fmovspos	%icc,	%f6,	%f26
	faligndata	%f12,	%f14,	%f22
	fmovdcs	%xcc,	%f0,	%f16
	movl	%icc,	%o5,	%o7
	xor	%o3,	0x05C9,	%o0
	fmovrdgez	%i4,	%f18,	%f0
	edge8n	%g1,	%i5,	%o6
	popc	0x0C75,	%i3
	fmul8x16al	%f24,	%f8,	%f10
	mulscc	%l0,	%i1,	%o1
	fornot1s	%f29,	%f6,	%f5
	movgu	%icc,	%l3,	%o4
	sth	%g3,	[%l7 + 0x08]
	andcc	%g2,	0x15E8,	%l1
	for	%f26,	%f14,	%f20
	mulscc	%g7,	0x1BE3,	%i6
	fmovsneg	%icc,	%f20,	%f16
	movvs	%xcc,	%l4,	%g6
	orn	%i2,	0x13B8,	%i0
	fmovrdlz	%i7,	%f26,	%f14
	addc	%l5,	0x017E,	%l6
	nop
	set	0x42, %i3
	ldsh	[%l7 + %i3],	%g5
	fmovsne	%xcc,	%f9,	%f26
	fmovdg	%icc,	%f11,	%f23
	sdivcc	%o2,	0x02B3,	%l2
	andncc	%g4,	%o7,	%o5
	edge32l	%o3,	%i4,	%o0
	alignaddr	%i5,	%o6,	%i3
	sll	%g1,	0x16,	%i1
	edge32ln	%o1,	%l0,	%l3
	andn	%g3,	%g2,	%l1
	fpackfix	%f6,	%f7
	edge16ln	%g7,	%i6,	%o4
	stb	%g6,	[%l7 + 0x53]
	movrne	%l4,	%i2,	%i0
	array8	%l5,	%l6,	%g5
	std	%f28,	[%l7 + 0x50]
	or	%o2,	0x130C,	%i7
	fmovdn	%icc,	%f5,	%f0
	mulscc	%l2,	%g4,	%o7
	edge32l	%o5,	%o3,	%i4
	ldd	[%l7 + 0x38],	%o0
	edge16	%o6,	%i3,	%g1
	movvs	%xcc,	%i1,	%o1
	fmovsle	%xcc,	%f3,	%f10
	xnor	%l0,	0x04F5,	%l3
	ldsb	[%l7 + 0x38],	%i5
	subcc	%g2,	%l1,	%g3
	addccc	%g7,	0x0D7E,	%i6
	fnegd	%f2,	%f10
	movle	%icc,	%o4,	%l4
	movre	%i2,	0x351,	%i0
	ldsw	[%l7 + 0x54],	%g6
	st	%f30,	[%l7 + 0x10]
	fmovrdlez	%l6,	%f14,	%f14
	sdiv	%l5,	0x02B3,	%g5
	edge32l	%o2,	%l2,	%g4
	array8	%i7,	%o5,	%o7
	movrne	%i4,	%o3,	%o0
	movg	%icc,	%i3,	%o6
	or	%g1,	%i1,	%l0
	stw	%o1,	[%l7 + 0x1C]
	movrgez	%i5,	0x023,	%g2
	movg	%icc,	%l3,	%g3
	andcc	%l1,	0x0671,	%g7
	ldsh	[%l7 + 0x3C],	%o4
	srlx	%l4,	%i2,	%i0
	andncc	%g6,	%i6,	%l5
	and	%l6,	%g5,	%l2
	sra	%g4,	0x0A,	%i7
	fmovrsgez	%o5,	%f17,	%f29
	edge16n	%o2,	%o7,	%i4
	edge8l	%o0,	%i3,	%o3
	fsrc1	%f26,	%f12
	mulscc	%g1,	%o6,	%l0
	movgu	%xcc,	%o1,	%i5
	mulscc	%i1,	%g2,	%g3
	fmul8x16	%f0,	%f14,	%f26
	fnor	%f10,	%f8,	%f24
	ld	[%l7 + 0x40],	%f5
	edge32l	%l3,	%g7,	%l1
	edge32l	%o4,	%i2,	%i0
	fxnor	%f20,	%f18,	%f20
	movn	%icc,	%g6,	%l4
	add	%i6,	%l6,	%l5
	move	%xcc,	%l2,	%g5
	edge16	%i7,	%o5,	%g4
	movle	%xcc,	%o7,	%o2
	edge32ln	%o0,	%i4,	%o3
	mulx	%g1,	%o6,	%l0
	fmovrslez	%i3,	%f22,	%f4
	move	%xcc,	%i5,	%o1
	ldd	[%l7 + 0x08],	%g2
	fcmple32	%f20,	%f20,	%i1
	smulcc	%l3,	0x02F9,	%g7
	sub	%g3,	0x1B4A,	%o4
	fmovdne	%xcc,	%f2,	%f0
	fandnot2	%f16,	%f26,	%f30
	edge32n	%i2,	%l1,	%i0
	movrgz	%g6,	%i6,	%l4
	ldd	[%l7 + 0x30],	%f18
	popc	0x1BBD,	%l6
	edge8n	%l5,	%g5,	%l2
	movge	%xcc,	%o5,	%i7
	ldx	[%l7 + 0x18],	%o7
	fmovdvc	%icc,	%f30,	%f9
	fmul8sux16	%f12,	%f12,	%f14
	fmovdgu	%icc,	%f25,	%f27
	fxnors	%f19,	%f31,	%f25
	fmul8ulx16	%f2,	%f8,	%f20
	andncc	%g4,	%o0,	%i4
	edge8l	%o2,	%o3,	%o6
	stx	%l0,	[%l7 + 0x18]
	smul	%g1,	0x1FAC,	%i3
	ldx	[%l7 + 0x18],	%i5
	fandnot2s	%f25,	%f23,	%f11
	fsrc1s	%f0,	%f2
	stb	%o1,	[%l7 + 0x4A]
	fpadd32s	%f3,	%f4,	%f8
	stw	%i1,	[%l7 + 0x74]
	move	%icc,	%l3,	%g7
	fcmpd	%fcc3,	%f22,	%f28
	edge32ln	%g2,	%o4,	%g3
	xorcc	%i2,	0x100D,	%l1
	fnor	%f6,	%f30,	%f28
	edge8l	%i0,	%i6,	%l4
	addc	%l6,	0x0425,	%g6
	nop
	set	0x5C, %g7
	lduw	[%l7 + %g7],	%g5
	movcc	%xcc,	%l2,	%o5
	andn	%l5,	%o7,	%g4
	movcs	%xcc,	%i7,	%o0
	udivx	%i4,	0x12B4,	%o3
	umul	%o2,	%o6,	%g1
	udivcc	%i3,	0x17E8,	%i5
	srax	%l0,	0x1A,	%i1
	andcc	%l3,	%o1,	%g2
	fcmpgt16	%f16,	%f6,	%o4
	fsrc1	%f18,	%f8
	add	%g7,	%i2,	%g3
	xnor	%l1,	%i6,	%l4
	edge32ln	%l6,	%i0,	%g5
	array16	%l2,	%o5,	%g6
	udivx	%l5,	0x063B,	%o7
	sdivcc	%i7,	0x17E3,	%o0
	udiv	%g4,	0x0D79,	%i4
	for	%f10,	%f18,	%f26
	ldsw	[%l7 + 0x08],	%o3
	std	%f18,	[%l7 + 0x40]
	subcc	%o2,	0x1231,	%g1
	save %i3, 0x06AA, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x48],	%o6
	movne	%xcc,	%l0,	%i1
	fmovdcs	%icc,	%f6,	%f29
	movrlez	%o1,	%g2,	%l3
	subc	%o4,	0x097C,	%g7
	fmuld8sux16	%f19,	%f13,	%f16
	movgu	%icc,	%g3,	%i2
	sdivcc	%l1,	0x1902,	%l4
	popc	0x1CC1,	%l6
	fpsub32s	%f31,	%f2,	%f12
	fnegs	%f26,	%f24
	xorcc	%i0,	%i6,	%l2
	edge32l	%g5,	%o5,	%g6
	ldsw	[%l7 + 0x70],	%o7
	fpack16	%f10,	%f1
	fcmpes	%fcc3,	%f15,	%f10
	movcs	%xcc,	%l5,	%o0
	sllx	%g4,	0x01,	%i7
	stw	%i4,	[%l7 + 0x10]
	addcc	%o3,	%g1,	%o2
	sth	%i5,	[%l7 + 0x6E]
	edge32	%i3,	%o6,	%i1
	sub	%l0,	%g2,	%o1
	stw	%l3,	[%l7 + 0x44]
	movvc	%icc,	%g7,	%g3
	ldx	[%l7 + 0x48],	%o4
	edge32l	%i2,	%l1,	%l6
	edge8l	%l4,	%i0,	%i6
	srlx	%l2,	0x02,	%o5
	lduw	[%l7 + 0x4C],	%g6
	fpadd32s	%f0,	%f24,	%f17
	sub	%o7,	%l5,	%g5
	subc	%g4,	0x1369,	%i7
	fmovs	%f11,	%f11
	movcc	%xcc,	%o0,	%i4
	udivcc	%g1,	0x0DAE,	%o2
	movleu	%xcc,	%o3,	%i3
	fcmpd	%fcc1,	%f14,	%f8
	lduw	[%l7 + 0x50],	%o6
	movrlez	%i5,	0x1EE,	%l0
	movcc	%xcc,	%g2,	%o1
	ldd	[%l7 + 0x48],	%l2
	movcc	%xcc,	%i1,	%g7
	lduw	[%l7 + 0x70],	%g3
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	xnor	%l1,	%l6,	%l4
	fcmpes	%fcc3,	%f31,	%f16
	popc	%i0,	%l2
	addc	%i6,	0x071A,	%o5
	fmovsl	%xcc,	%f30,	%f26
	srlx	%g6,	%o7,	%l5
	fmul8x16al	%f19,	%f29,	%f14
	smul	%g4,	%i7,	%g5
	orn	%o0,	%g1,	%i4
	umul	%o2,	0x01FA,	%o3
	umulcc	%o6,	0x1579,	%i3
	fmovdl	%xcc,	%f20,	%f29
	subccc	%i5,	0x1942,	%g2
	fmovdge	%icc,	%f17,	%f14
	sir	0x1036
	ldsh	[%l7 + 0x42],	%o1
	udiv	%l0,	0x1D03,	%l3
	edge16n	%g7,	%g3,	%i2
	ldsb	[%l7 + 0x44],	%o4
	subc	%l1,	0x12AB,	%i1
	std	%f0,	[%l7 + 0x30]
	subcc	%l6,	%i0,	%l4
	fmovrdgz	%i6,	%f0,	%f14
	fandnot1s	%f25,	%f12,	%f2
	edge16n	%o5,	%l2,	%g6
	movcs	%icc,	%l5,	%o7
	subc	%i7,	%g5,	%o0
	orcc	%g4,	%i4,	%o2
	movneg	%icc,	%g1,	%o6
	array32	%i3,	%i5,	%o3
	movgu	%icc,	%g2,	%o1
	edge32ln	%l3,	%l0,	%g7
	ldsh	[%l7 + 0x78],	%i2
	andcc	%o4,	0x1BD6,	%g3
	mova	%icc,	%l1,	%i1
	fmuld8sux16	%f9,	%f7,	%f26
	udivx	%i0,	0x07A1,	%l6
	fnegd	%f2,	%f20
	orn	%i6,	%l4,	%o5
	ldub	[%l7 + 0x6C],	%l2
	movcs	%icc,	%g6,	%o7
	nop
	set	0x40, %i5
	stw	%l5,	[%l7 + %i5]
	sdiv	%g5,	0x1AC3,	%i7
	edge16ln	%g4,	%i4,	%o2
	mulx	%g1,	%o6,	%o0
	fpsub16	%f2,	%f12,	%f12
	movn	%icc,	%i3,	%i5
	mova	%xcc,	%g2,	%o3
	move	%icc,	%l3,	%o1
	sdivx	%l0,	0x0952,	%g7
	udiv	%i2,	0x1FA0,	%o4
	edge32l	%l1,	%i1,	%g3
	ldsh	[%l7 + 0x20],	%i0
	sir	0x1D62
	fpsub16	%f14,	%f0,	%f6
	and	%i6,	%l4,	%o5
	xnorcc	%l2,	0x11CB,	%g6
	fmovdpos	%icc,	%f28,	%f20
	andcc	%l6,	%l5,	%o7
	fandnot2	%f6,	%f16,	%f16
	movrne	%i7,	0x283,	%g5
	alignaddr	%g4,	%i4,	%o2
	lduw	[%l7 + 0x1C],	%o6
	movrlz	%o0,	0x11E,	%i3
	addcc	%i5,	%g2,	%o3
	fnand	%f8,	%f8,	%f12
	fpadd16s	%f4,	%f24,	%f28
	movrgez	%l3,	0x2D9,	%g1
	umulcc	%o1,	%g7,	%l0
	movleu	%xcc,	%o4,	%i2
	sll	%l1,	0x17,	%i1
	subcc	%g3,	%i0,	%l4
	edge32ln	%i6,	%l2,	%o5
	edge16	%g6,	%l5,	%l6
	srax	%i7,	%g5,	%o7
	movrlz	%i4,	%o2,	%g4
	fxors	%f31,	%f28,	%f28
	sth	%o6,	[%l7 + 0x32]
	sethi	0x0632,	%o0
	array32	%i3,	%g2,	%o3
	sth	%i5,	[%l7 + 0x6E]
	edge16ln	%g1,	%o1,	%g7
	andncc	%l3,	%l0,	%i2
	and	%l1,	%i1,	%g3
	fsrc1s	%f14,	%f8
	movcc	%icc,	%o4,	%i0
	movcc	%icc,	%l4,	%i6
	orcc	%l2,	0x0192,	%g6
	movne	%xcc,	%o5,	%l5
	srlx	%i7,	%l6,	%g5
	fmovrdgez	%o7,	%f10,	%f6
	for	%f18,	%f6,	%f4
	xor	%i4,	0x108A,	%o2
	subccc	%o6,	%g4,	%o0
	movvc	%icc,	%g2,	%i3
	sethi	0x00B9,	%o3
	popc	%g1,	%o1
	lduw	[%l7 + 0x64],	%i5
	fmul8x16al	%f13,	%f25,	%f2
	ldx	[%l7 + 0x60],	%l3
	fmovdcc	%icc,	%f7,	%f19
	xnor	%g7,	%l0,	%l1
	edge8l	%i2,	%g3,	%i1
	edge32ln	%o4,	%l4,	%i0
	movn	%xcc,	%l2,	%g6
	andn	%i6,	0x100F,	%o5
	fmuld8ulx16	%f25,	%f13,	%f4
	stx	%l5,	[%l7 + 0x58]
	array32	%l6,	%g5,	%i7
	stb	%i4,	[%l7 + 0x4F]
	andncc	%o7,	%o6,	%o2
	srlx	%o0,	%g2,	%i3
	edge32	%g4,	%o3,	%o1
	fmovrslez	%g1,	%f14,	%f20
	and	%i5,	0x1D54,	%g7
	array16	%l0,	%l1,	%i2
	mova	%icc,	%g3,	%i1
	edge32	%l3,	%l4,	%i0
	smul	%o4,	%l2,	%g6
	fmovdpos	%xcc,	%f22,	%f8
	fmuld8ulx16	%f12,	%f15,	%f16
	movneg	%xcc,	%i6,	%o5
	stb	%l5,	[%l7 + 0x14]
	movrlz	%l6,	0x2C6,	%g5
	edge8ln	%i7,	%i4,	%o6
	xnorcc	%o2,	%o7,	%o0
	fxor	%f10,	%f8,	%f12
	movrlez	%g2,	0x38D,	%g4
	fmovdpos	%xcc,	%f24,	%f10
	movrgez	%i3,	%o1,	%g1
	alignaddr	%o3,	%g7,	%i5
	movrne	%l1,	0x0B2,	%l0
	subc	%i2,	0x1883,	%g3
	fpsub16	%f2,	%f24,	%f4
	movrgz	%i1,	0x232,	%l4
	ldd	[%l7 + 0x38],	%f30
	movpos	%icc,	%i0,	%o4
	edge8ln	%l2,	%l3,	%g6
	andncc	%o5,	%i6,	%l6
	subcc	%l5,	0x01F1,	%g5
	stw	%i7,	[%l7 + 0x54]
	ldsw	[%l7 + 0x5C],	%o6
	movcs	%xcc,	%i4,	%o2
	sdivx	%o7,	0x07A4,	%g2
	subc	%g4,	%o0,	%o1
	andn	%i3,	0x18EE,	%o3
	popc	%g1,	%i5
	fmovrsne	%g7,	%f31,	%f25
	nop
	set	0x70, %o4
	stx	%l1,	[%l7 + %o4]
	edge16	%i2,	%l0,	%i1
	ldsh	[%l7 + 0x30],	%g3
	fpsub16s	%f17,	%f29,	%f8
	fmovdneg	%icc,	%f10,	%f6
	edge8l	%i0,	%o4,	%l4
	ldub	[%l7 + 0x6A],	%l2
	or	%l3,	0x0C09,	%g6
	fmovrdgz	%o5,	%f10,	%f10
	lduw	[%l7 + 0x34],	%l6
	xorcc	%l5,	0x1AF4,	%g5
	subc	%i6,	%i7,	%i4
	stb	%o2,	[%l7 + 0x2C]
	ld	[%l7 + 0x0C],	%f9
	move	%xcc,	%o6,	%o7
	fmovsl	%icc,	%f29,	%f14
	fmovdl	%icc,	%f20,	%f11
	movle	%icc,	%g2,	%o0
	movneg	%icc,	%g4,	%o1
	fcmps	%fcc3,	%f1,	%f25
	fmuld8ulx16	%f12,	%f20,	%f22
	array16	%o3,	%i3,	%i5
	array8	%g1,	%l1,	%g7
	fsrc2	%f30,	%f2
	edge8	%i2,	%l0,	%i1
	movl	%icc,	%g3,	%o4
	edge16ln	%i0,	%l2,	%l4
	sra	%l3,	%g6,	%o5
	and	%l6,	0x0C0B,	%g5
	xnorcc	%l5,	%i7,	%i4
	movge	%icc,	%i6,	%o2
	xnor	%o7,	%g2,	%o0
	ldd	[%l7 + 0x68],	%f16
	fmovrdlez	%o6,	%f12,	%f28
	array16	%o1,	%g4,	%i3
	ldub	[%l7 + 0x45],	%o3
	sth	%g1,	[%l7 + 0x76]
	xnor	%i5,	%l1,	%g7
	movge	%xcc,	%i2,	%i1
	popc	%g3,	%o4
	fmovdvs	%icc,	%f5,	%f27
	udiv	%i0,	0x03C9,	%l2
	subccc	%l4,	%l3,	%g6
	umul	%l0,	0x1380,	%o5
	fmovdgu	%xcc,	%f10,	%f24
	addccc	%g5,	0x030C,	%l6
	edge16l	%i7,	%i4,	%i6
	sdivcc	%l5,	0x189D,	%o2
	movrlez	%g2,	0x2B2,	%o7
	movrlez	%o0,	0x379,	%o6
	edge8ln	%g4,	%i3,	%o1
	addccc	%o3,	0x1CC2,	%g1
	edge8n	%l1,	%i5,	%i2
	movcs	%xcc,	%i1,	%g3
	movgu	%icc,	%g7,	%o4
	fmovsle	%xcc,	%f13,	%f1
	stb	%l2,	[%l7 + 0x7E]
	array8	%i0,	%l4,	%g6
	addcc	%l0,	%l3,	%o5
	sll	%l6,	0x03,	%g5
	edge8ln	%i4,	%i7,	%i6
	fcmple16	%f10,	%f20,	%l5
	sth	%g2,	[%l7 + 0x18]
	edge16n	%o2,	%o7,	%o0
	sir	0x163E
	addc	%o6,	%i3,	%o1
	ldsw	[%l7 + 0x1C],	%o3
	fmul8sux16	%f2,	%f0,	%f22
	fzero	%f16
	ldub	[%l7 + 0x77],	%g4
	fornot2s	%f25,	%f31,	%f31
	ldx	[%l7 + 0x08],	%g1
	restore %l1, 0x1EA6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x50],	%i1
	movleu	%icc,	%g3,	%g7
	subc	%i2,	%o4,	%i0
	or	%l4,	0x0E87,	%l2
	movne	%icc,	%g6,	%l3
	nop
	set	0x2C, %i1
	lduw	[%l7 + %i1],	%l0
	ldsw	[%l7 + 0x78],	%l6
	movrlz	%o5,	%g5,	%i4
	srl	%i6,	%l5,	%i7
	mulx	%g2,	0x01C8,	%o2
	fmovdpos	%xcc,	%f2,	%f29
	popc	0x167D,	%o0
	ldsh	[%l7 + 0x38],	%o6
	movvs	%xcc,	%o7,	%i3
	orncc	%o1,	0x0215,	%g4
	fands	%f23,	%f11,	%f27
	fmovrse	%g1,	%f13,	%f29
	fand	%f12,	%f10,	%f22
	srl	%o3,	0x1B,	%i5
	ldsw	[%l7 + 0x68],	%i1
	movl	%xcc,	%l1,	%g7
	addcc	%g3,	0x0B50,	%o4
	movrgez	%i2,	%l4,	%l2
	nop
	set	0x7C, %g1
	ldsh	[%l7 + %g1],	%g6
	sll	%l3,	0x04,	%i0
	lduh	[%l7 + 0x68],	%l0
	fones	%f21
	fcmpeq32	%f12,	%f26,	%o5
	movrlz	%g5,	0x337,	%l6
	subcc	%i4,	%i6,	%l5
	fpack16	%f2,	%f21
	sdiv	%i7,	0x126E,	%g2
	movne	%xcc,	%o0,	%o6
	mulx	%o7,	%i3,	%o1
	popc	0x054A,	%g4
	ldsb	[%l7 + 0x23],	%o2
	subccc	%g1,	0x0391,	%o3
	add	%i1,	0x0B88,	%i5
	sra	%g7,	0x13,	%l1
	xorcc	%g3,	0x18C1,	%o4
	xorcc	%i2,	0x1DFD,	%l4
	sll	%l2,	%l3,	%g6
	subcc	%i0,	0x1200,	%o5
	sub	%l0,	%g5,	%i4
	edge8l	%i6,	%l6,	%i7
	stx	%l5,	[%l7 + 0x58]
	edge16	%o0,	%o6,	%g2
	movrne	%o7,	%i3,	%g4
	sir	0x1B1C
	fcmpgt32	%f26,	%f16,	%o1
	fpadd32s	%f17,	%f16,	%f1
	movcs	%icc,	%g1,	%o3
	ldx	[%l7 + 0x50],	%i1
	mova	%icc,	%i5,	%o2
	movrne	%l1,	%g7,	%g3
	sll	%i2,	0x05,	%o4
	edge16l	%l2,	%l4,	%g6
	andncc	%i0,	%l3,	%o5
	movg	%xcc,	%l0,	%g5
	array32	%i4,	%l6,	%i6
	save %i7, %o0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o6,	%o7
	edge32n	%i3,	%g2,	%o1
	fandnot1	%f20,	%f30,	%f8
	addccc	%g4,	0x0385,	%o3
	subcc	%i1,	0x132E,	%g1
	udiv	%o2,	0x1A15,	%l1
	fmovsge	%xcc,	%f25,	%f31
	movgu	%xcc,	%g7,	%i5
	ld	[%l7 + 0x54],	%f9
	alignaddr	%i2,	%o4,	%g3
	movcs	%icc,	%l2,	%l4
	fmovrdgez	%g6,	%f0,	%f22
	alignaddr	%l3,	%i0,	%o5
	subccc	%l0,	%i4,	%l6
	ld	[%l7 + 0x7C],	%f16
	fpsub32s	%f12,	%f16,	%f0
	edge8n	%g5,	%i7,	%o0
	popc	%l5,	%o6
	fcmpgt32	%f28,	%f2,	%o7
	movpos	%icc,	%i3,	%i6
	fandnot2s	%f0,	%f11,	%f1
	ldsh	[%l7 + 0x64],	%g2
	edge16	%g4,	%o3,	%i1
	sra	%o1,	0x09,	%o2
	alignaddrl	%g1,	%g7,	%i5
	subcc	%l1,	%o4,	%g3
	fpadd32s	%f24,	%f25,	%f14
	udivx	%i2,	0x0151,	%l4
	fcmpeq16	%f16,	%f22,	%g6
	st	%f27,	[%l7 + 0x40]
	addcc	%l3,	%l2,	%i0
	or	%l0,	%i4,	%l6
	orncc	%o5,	0x0BE6,	%g5
	edge8n	%o0,	%l5,	%o6
	andcc	%i7,	0x0CF4,	%o7
	movcc	%icc,	%i3,	%g2
	movneg	%xcc,	%g4,	%o3
	movre	%i6,	%o1,	%o2
	andn	%g1,	%g7,	%i1
	ldsh	[%l7 + 0x72],	%l1
	srl	%i5,	%g3,	%o4
	ldsb	[%l7 + 0x1F],	%i2
	ldsb	[%l7 + 0x43],	%g6
	subccc	%l4,	%l2,	%l3
	fmul8ulx16	%f22,	%f30,	%f14
	edge16n	%l0,	%i4,	%i0
	sdivcc	%l6,	0x0EA3,	%g5
	fsrc1	%f12,	%f8
	orn	%o0,	0x1196,	%l5
	fcmpes	%fcc3,	%f6,	%f29
	xnorcc	%o5,	%i7,	%o6
	andncc	%i3,	%o7,	%g4
	movpos	%icc,	%g2,	%i6
	fones	%f19
	orcc	%o3,	%o1,	%g1
	fmovda	%xcc,	%f6,	%f11
	sethi	0x156F,	%g7
	xorcc	%i1,	0x055F,	%l1
	mulx	%o2,	0x1560,	%g3
	movrlz	%o4,	%i2,	%i5
	save %l4, 0x03D0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%l2,	%l3
	ldsw	[%l7 + 0x50],	%l0
	movle	%icc,	%i0,	%i4
	movne	%icc,	%l6,	%o0
	st	%f31,	[%l7 + 0x14]
	save %l5, %g5, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f19,	%f3,	%f22
	fandnot1s	%f4,	%f27,	%f20
	movrne	%o6,	%i7,	%i3
	mulx	%o7,	0x1382,	%g2
	fmovspos	%xcc,	%f17,	%f8
	and	%g4,	%o3,	%o1
	andcc	%i6,	0x1339,	%g7
	move	%xcc,	%i1,	%g1
	sethi	0x162D,	%o2
	sub	%g3,	0x1B6C,	%l1
	mulx	%i2,	0x0816,	%i5
	movrne	%o4,	%g6,	%l4
	fmovdn	%icc,	%f0,	%f0
	mulx	%l3,	%l2,	%i0
	move	%icc,	%l0,	%l6
	movre	%o0,	%l5,	%i4
	smulcc	%o5,	%g5,	%o6
	ldd	[%l7 + 0x58],	%f8
	fpadd32	%f28,	%f0,	%f28
	nop
	set	0x34, %g3
	ldsw	[%l7 + %g3],	%i7
	fexpand	%f14,	%f14
	fands	%f15,	%f23,	%f5
	sub	%o7,	0x0D95,	%g2
	sub	%g4,	%o3,	%o1
	edge16n	%i3,	%g7,	%i6
	edge32ln	%g1,	%o2,	%i1
	xor	%l1,	%g3,	%i5
	ldx	[%l7 + 0x68],	%i2
	edge16	%g6,	%o4,	%l4
	xnor	%l2,	%i0,	%l3
	orcc	%l0,	%o0,	%l6
	fpadd16s	%f15,	%f17,	%f26
	addc	%i4,	%l5,	%o5
	andncc	%g5,	%i7,	%o6
	fpadd32	%f22,	%f16,	%f30
	subcc	%g2,	0x16BF,	%o7
	addc	%o3,	0x04AC,	%o1
	edge32ln	%g4,	%g7,	%i3
	edge16n	%i6,	%o2,	%g1
	movg	%icc,	%l1,	%g3
	fxnor	%f4,	%f8,	%f20
	edge16ln	%i1,	%i5,	%g6
	addccc	%i2,	0x126A,	%o4
	fmovdvs	%xcc,	%f27,	%f25
	array16	%l2,	%i0,	%l4
	fmovdne	%icc,	%f18,	%f10
	umul	%l0,	%o0,	%l3
	fmovdgu	%xcc,	%f6,	%f0
	fmovdne	%icc,	%f19,	%f10
	ldsb	[%l7 + 0x36],	%l6
	fandnot1	%f16,	%f24,	%f20
	umulcc	%l5,	0x1319,	%i4
	xnor	%o5,	%i7,	%g5
	stx	%o6,	[%l7 + 0x10]
	alignaddrl	%o7,	%o3,	%o1
	movrlez	%g4,	0x020,	%g7
	orcc	%g2,	0x049E,	%i6
	subccc	%o2,	0x0A91,	%i3
	ldsb	[%l7 + 0x1B],	%l1
	stw	%g1,	[%l7 + 0x38]
	sub	%g3,	%i1,	%i5
	movge	%xcc,	%g6,	%o4
	popc	%l2,	%i0
	movcs	%xcc,	%i2,	%l0
	fornot2s	%f29,	%f4,	%f30
	faligndata	%f4,	%f20,	%f8
	srax	%o0,	%l4,	%l6
	popc	%l5,	%i4
	edge32	%l3,	%o5,	%i7
	edge8	%g5,	%o6,	%o3
	or	%o1,	0x1DE5,	%g4
	movn	%xcc,	%g7,	%o7
	fand	%f2,	%f4,	%f16
	addc	%i6,	0x073B,	%g2
	srax	%o2,	0x0F,	%i3
	movgu	%icc,	%l1,	%g1
	edge16ln	%i1,	%i5,	%g6
	edge16l	%o4,	%l2,	%i0
	movrlz	%i2,	%g3,	%l0
	fabsd	%f0,	%f10
	or	%l4,	0x130B,	%l6
	fmovrde	%l5,	%f0,	%f16
	fmovse	%xcc,	%f27,	%f15
	fmovdg	%icc,	%f21,	%f30
	ldsw	[%l7 + 0x0C],	%o0
	movcc	%xcc,	%l3,	%o5
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	lduh	[%l7 + 0x40],	%o3
	movl	%xcc,	%o1,	%o6
	movle	%xcc,	%g7,	%g4
	sdivcc	%o7,	0x0A60,	%i6
	edge32	%o2,	%i3,	%g2
	edge16l	%g1,	%l1,	%i5
	movpos	%icc,	%g6,	%i1
	edge32n	%l2,	%i0,	%o4
	movcs	%icc,	%g3,	%l0
	movn	%xcc,	%i2,	%l4
	orn	%l6,	%o0,	%l5
	add	%o5,	%l3,	%g5
	movrlz	%i4,	%i7,	%o3
	fands	%f18,	%f1,	%f0
	movneg	%xcc,	%o6,	%g7
	sir	0x08ED
	fcmps	%fcc0,	%f21,	%f27
	movrgz	%o1,	0x395,	%g4
	fmovsvc	%icc,	%f12,	%f31
	xnor	%o7,	%o2,	%i6
	fmovsne	%xcc,	%f25,	%f25
	subcc	%i3,	%g1,	%g2
	subc	%l1,	0x1653,	%g6
	sllx	%i5,	%l2,	%i0
	sdiv	%o4,	0x1104,	%g3
	fmovse	%icc,	%f15,	%f20
	movrne	%l0,	%i1,	%l4
	movvc	%xcc,	%l6,	%i2
	smul	%l5,	%o5,	%l3
	fmovrdlz	%g5,	%f18,	%f22
	lduw	[%l7 + 0x34],	%o0
	fcmple32	%f22,	%f22,	%i7
	umulcc	%i4,	0x1BAF,	%o6
	ldsh	[%l7 + 0x20],	%g7
	sir	0x1AB8
	alignaddr	%o3,	%o1,	%o7
	fpmerge	%f26,	%f18,	%f24
	fpsub32s	%f9,	%f15,	%f6
	umul	%g4,	%o2,	%i3
	smul	%i6,	0x01EC,	%g2
	fpsub32	%f18,	%f4,	%f28
	fnot2s	%f23,	%f7
	st	%f22,	[%l7 + 0x44]
	movleu	%xcc,	%l1,	%g1
	movre	%g6,	%l2,	%i0
	movrgz	%o4,	0x34E,	%i5
	movcs	%xcc,	%l0,	%g3
	movgu	%icc,	%l4,	%i1
	movn	%icc,	%i2,	%l6
	stw	%l5,	[%l7 + 0x34]
	subc	%l3,	0x00BD,	%g5
	fmul8x16al	%f18,	%f25,	%f0
	for	%f12,	%f26,	%f14
	alignaddr	%o5,	%o0,	%i4
	mulx	%o6,	%i7,	%o3
	edge8	%g7,	%o1,	%o7
	sdivx	%o2,	0x0C5F,	%g4
	subc	%i3,	0x15DE,	%g2
	xnorcc	%l1,	%g1,	%i6
	movne	%xcc,	%g6,	%i0
	fmul8ulx16	%f16,	%f0,	%f16
	ld	[%l7 + 0x0C],	%f1
	ldd	[%l7 + 0x38],	%o4
	andcc	%i5,	%l0,	%l2
	subc	%l4,	%i1,	%i2
	lduh	[%l7 + 0x52],	%l6
	save %g3, 0x1780, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l3,	%o5
	andncc	%g5,	%i4,	%o0
	array32	%o6,	%i7,	%o3
	movne	%icc,	%g7,	%o7
	add	%o1,	0x0FB0,	%o2
	fzero	%f22
	movpos	%xcc,	%g4,	%i3
	movleu	%xcc,	%l1,	%g2
	lduh	[%l7 + 0x78],	%g1
	fpsub16	%f12,	%f16,	%f0
	andncc	%i6,	%g6,	%o4
	ldx	[%l7 + 0x08],	%i5
	fors	%f25,	%f20,	%f6
	stx	%l0,	[%l7 + 0x58]
	fmuld8sux16	%f2,	%f2,	%f4
	edge32	%i0,	%l2,	%i1
	fnot2s	%f6,	%f3
	movrlz	%i2,	0x079,	%l6
	sth	%l4,	[%l7 + 0x4E]
	movneg	%icc,	%l5,	%l3
	movrgz	%g3,	0x07A,	%o5
	subcc	%g5,	%i4,	%o0
	fabsd	%f14,	%f20
	edge8l	%i7,	%o3,	%o6
	fmovrdne	%o7,	%f16,	%f26
	stw	%o1,	[%l7 + 0x70]
	fmovs	%f13,	%f30
	save %g7, 0x1F35, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%i3,	%l1
	ldd	[%l7 + 0x48],	%f14
	fmovrsgez	%o2,	%f21,	%f15
	fmovscc	%icc,	%f2,	%f28
	edge16n	%g2,	%i6,	%g6
	udivx	%o4,	0x1BE1,	%i5
	movge	%xcc,	%l0,	%g1
	fornot1	%f10,	%f20,	%f24
	fmovsn	%xcc,	%f31,	%f4
	ldd	[%l7 + 0x08],	%i0
	ld	[%l7 + 0x38],	%f25
	sll	%i1,	%l2,	%l6
	fnot2s	%f3,	%f13
	popc	0x0C5F,	%l4
	edge8ln	%i2,	%l3,	%g3
	addcc	%o5,	0x01D9,	%g5
	fcmpgt32	%f28,	%f26,	%i4
	fmovda	%icc,	%f1,	%f7
	sth	%o0,	[%l7 + 0x16]
	movpos	%xcc,	%l5,	%i7
	movcs	%icc,	%o3,	%o7
	fmovdgu	%icc,	%f23,	%f13
	edge16l	%o1,	%o6,	%g4
	addcc	%g7,	0x0359,	%i3
	movn	%xcc,	%l1,	%o2
	movrne	%i6,	0x27C,	%g6
	movl	%icc,	%g2,	%o4
	fcmpgt16	%f4,	%f10,	%i5
	array16	%g1,	%i0,	%i1
	fmovrdlz	%l2,	%f18,	%f2
	umul	%l6,	0x059E,	%l4
	mova	%xcc,	%l0,	%i2
	andncc	%l3,	%o5,	%g3
	fmuld8sux16	%f10,	%f20,	%f12
	subccc	%g5,	%i4,	%l5
	array8	%o0,	%o3,	%i7
	lduw	[%l7 + 0x6C],	%o7
	edge16ln	%o1,	%o6,	%g7
	fmovsvc	%icc,	%f26,	%f26
	andncc	%i3,	%g4,	%o2
	for	%f16,	%f24,	%f12
	stw	%i6,	[%l7 + 0x34]
	alignaddr	%g6,	%g2,	%l1
	mova	%icc,	%i5,	%o4
	udiv	%g1,	0x02FA,	%i0
	sir	0x0B8E
	subcc	%i1,	0x082F,	%l6
	sub	%l2,	0x0FBF,	%l4
	edge32ln	%i2,	%l3,	%l0
	ldsb	[%l7 + 0x09],	%g3
	edge32	%g5,	%o5,	%l5
	fpadd16s	%f28,	%f4,	%f4
	udiv	%o0,	0x18AD,	%o3
	fcmpd	%fcc0,	%f16,	%f30
	lduh	[%l7 + 0x24],	%i4
	edge32ln	%o7,	%o1,	%o6
	fmovdne	%icc,	%f30,	%f9
	alignaddrl	%g7,	%i3,	%i7
	fmovsgu	%icc,	%f0,	%f25
	srl	%o2,	%g4,	%i6
	sethi	0x069E,	%g2
	addcc	%g6,	0x070A,	%l1
	movrlez	%o4,	%i5,	%g1
	move	%icc,	%i1,	%i0
	add	%l6,	0x1F19,	%l4
	movrlez	%i2,	0x12D,	%l3
	fpadd32s	%f3,	%f5,	%f23
	umul	%l0,	%l2,	%g5
	movvs	%icc,	%g3,	%l5
	mulx	%o0,	%o5,	%o3
	movrne	%o7,	%o1,	%o6
	andcc	%g7,	0x1077,	%i3
	stw	%i7,	[%l7 + 0x4C]
	mulscc	%i4,	0x0864,	%g4
	edge8n	%i6,	%o2,	%g6
	edge32ln	%g2,	%o4,	%l1
	fcmpeq16	%f2,	%f24,	%g1
	add	%i5,	0x063E,	%i0
	stx	%i1,	[%l7 + 0x38]
	movpos	%xcc,	%l4,	%i2
	edge16l	%l3,	%l6,	%l0
	fandnot2s	%f30,	%f9,	%f20
	fandnot1s	%f10,	%f14,	%f31
	sdivx	%g5,	0x0601,	%l2
	edge32ln	%l5,	%g3,	%o5
	umul	%o3,	0x19D5,	%o7
	smulcc	%o1,	0x0823,	%o0
	edge32	%g7,	%i3,	%i7
	andncc	%i4,	%o6,	%g4
	movcc	%xcc,	%o2,	%i6
	addccc	%g6,	%o4,	%g2
	fpsub16s	%f30,	%f7,	%f22
	fxnors	%f15,	%f10,	%f17
	save %l1, 0x1F5C, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i0,	%i1,	%g1
	edge8ln	%l4,	%l3,	%i2
	edge16l	%l6,	%l0,	%g5
	orncc	%l5,	0x1DA2,	%g3
	srl	%l2,	0x15,	%o3
	lduh	[%l7 + 0x12],	%o5
	movre	%o1,	%o7,	%o0
	sdiv	%i3,	0x0C58,	%i7
	fpsub16s	%f22,	%f9,	%f30
	xnor	%i4,	%g7,	%g4
	srax	%o2,	0x03,	%o6
	ldsh	[%l7 + 0x52],	%i6
	movge	%xcc,	%g6,	%o4
	xor	%g2,	0x1FA2,	%i5
	fcmpeq32	%f24,	%f12,	%l1
	fnors	%f3,	%f24,	%f12
	edge8l	%i1,	%g1,	%i0
	edge8	%l3,	%i2,	%l4
	xnorcc	%l6,	0x1864,	%g5
	array16	%l0,	%g3,	%l5
	edge16ln	%l2,	%o3,	%o5
	std	%f16,	[%l7 + 0x18]
	stb	%o1,	[%l7 + 0x0B]
	movre	%o0,	0x02B,	%i3
	movne	%xcc,	%i7,	%i4
	mulscc	%g7,	%g4,	%o7
	stx	%o6,	[%l7 + 0x20]
	srlx	%o2,	0x07,	%g6
	orncc	%o4,	%g2,	%i6
	edge8l	%l1,	%i5,	%g1
	fmovs	%f13,	%f9
	sllx	%i1,	0x1C,	%l3
	sllx	%i0,	%i2,	%l6
	edge8	%g5,	%l0,	%l4
	andncc	%g3,	%l5,	%o3
	fmovd	%f8,	%f22
	fpadd32	%f28,	%f12,	%f12
	sth	%l2,	[%l7 + 0x18]
	array16	%o1,	%o5,	%o0
	fxors	%f17,	%f26,	%f25
	orcc	%i3,	%i4,	%g7
	st	%f21,	[%l7 + 0x18]
	fornot2s	%f2,	%f23,	%f6
	umulcc	%i7,	%o7,	%g4
	fcmple16	%f22,	%f4,	%o6
	movne	%icc,	%g6,	%o2
	fandnot2	%f8,	%f10,	%f4
	movcs	%icc,	%o4,	%i6
	move	%xcc,	%g2,	%i5
	fpmerge	%f13,	%f23,	%f26
	movneg	%icc,	%g1,	%l1
	movpos	%icc,	%l3,	%i0
	fmul8x16au	%f5,	%f25,	%f8
	fmovdvs	%xcc,	%f28,	%f16
	movrlz	%i2,	%l6,	%i1
	fmovsa	%xcc,	%f30,	%f0
	umul	%l0,	0x095C,	%l4
	popc	0x102E,	%g3
	alignaddr	%g5,	%o3,	%l2
	addccc	%l5,	0x144F,	%o5
	lduh	[%l7 + 0x34],	%o1
	and	%o0,	%i3,	%g7
	fmovscc	%icc,	%f14,	%f31
	fmovrslz	%i7,	%f4,	%f13
	sll	%o7,	%i4,	%g4
	stw	%g6,	[%l7 + 0x70]
	orncc	%o2,	0x192D,	%o4
	movrlez	%i6,	0x106,	%g2
	fmovdvc	%icc,	%f10,	%f3
	sir	0x0182
	fmul8ulx16	%f10,	%f2,	%f18
	move	%icc,	%o6,	%i5
	fmul8x16au	%f7,	%f15,	%f30
	nop
	set	0x58, %l5
	std	%f6,	[%l7 + %l5]
	ldx	[%l7 + 0x70],	%g1
	edge8ln	%l3,	%l1,	%i2
	fmovsgu	%xcc,	%f5,	%f1
	andncc	%l6,	%i1,	%l0
	stw	%i0,	[%l7 + 0x3C]
	sllx	%l4,	0x1A,	%g5
	ldsw	[%l7 + 0x50],	%g3
	movne	%icc,	%o3,	%l2
	sth	%l5,	[%l7 + 0x54]
	fone	%f22
	ldx	[%l7 + 0x28],	%o5
	subcc	%o0,	0x17C3,	%i3
	sdivx	%g7,	0x0B5E,	%i7
	pdist	%f16,	%f28,	%f22
	movcs	%icc,	%o7,	%i4
	movneg	%icc,	%g4,	%g6
	restore %o1, 0x0C08, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i6,	%g2,	%o4
	mulx	%o6,	%i5,	%l3
	xorcc	%l1,	0x1BF6,	%g1
	fmovdcs	%xcc,	%f6,	%f17
	xnor	%l6,	%i2,	%l0
	fornot2s	%f31,	%f24,	%f21
	ldd	[%l7 + 0x78],	%i0
	array32	%i0,	%g5,	%l4
	movrgz	%o3,	0x109,	%l2
	popc	0x10B4,	%g3
	sdivcc	%l5,	0x0570,	%o0
	save %o5, %g7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1C4B
	fors	%f0,	%f5,	%f8
	udiv	%o7,	0x0C1E,	%i4
	fcmpgt32	%f28,	%f28,	%i7
	movvc	%xcc,	%g4,	%g6
	edge32	%o2,	%i6,	%g2
	movle	%icc,	%o4,	%o6
	xnor	%o1,	%i5,	%l1
	stb	%l3,	[%l7 + 0x2C]
	movle	%icc,	%g1,	%l6
	movrne	%l0,	%i1,	%i0
	edge16l	%g5,	%l4,	%o3
	fnands	%f22,	%f19,	%f5
	fandnot1	%f28,	%f6,	%f22
	fmovsne	%icc,	%f9,	%f31
	fandnot2	%f14,	%f10,	%f6
	sir	0x1412
	sll	%l2,	%i2,	%l5
	fmuld8sux16	%f31,	%f10,	%f4
	fornot1	%f24,	%f26,	%f6
	sllx	%g3,	0x03,	%o0
	fcmpes	%fcc0,	%f3,	%f23
	sub	%g7,	0x1556,	%o5
	movvc	%xcc,	%i3,	%i4
	movne	%xcc,	%i7,	%g4
	fpadd32s	%f5,	%f16,	%f25
	lduw	[%l7 + 0x08],	%g6
	movn	%xcc,	%o2,	%i6
	edge16n	%g2,	%o4,	%o6
	fcmple16	%f30,	%f24,	%o7
	edge16n	%o1,	%i5,	%l1
	ldsb	[%l7 + 0x65],	%l3
	popc	%g1,	%l0
	lduw	[%l7 + 0x20],	%l6
	orcc	%i1,	0x13E4,	%i0
	movcs	%icc,	%l4,	%g5
	andncc	%l2,	%i2,	%o3
	andncc	%l5,	%o0,	%g7
	movl	%xcc,	%g3,	%i3
	movrgez	%o5,	%i7,	%i4
	movrlez	%g6,	%o2,	%i6
	movle	%xcc,	%g2,	%o4
	srax	%o6,	0x05,	%g4
	andn	%o7,	0x0481,	%o1
	fmul8sux16	%f26,	%f18,	%f10
	fmovdleu	%xcc,	%f11,	%f1
	or	%l1,	%l3,	%g1
	movrne	%l0,	0x384,	%l6
	edge32n	%i1,	%i5,	%i0
	stb	%g5,	[%l7 + 0x3F]
	movcc	%xcc,	%l2,	%i2
	ldd	[%l7 + 0x38],	%f26
	fmul8ulx16	%f10,	%f10,	%f2
	fmovrdlz	%l4,	%f8,	%f10
	sdivx	%l5,	0x032C,	%o3
	fxnor	%f22,	%f12,	%f8
	stx	%g7,	[%l7 + 0x70]
	fmul8x16	%f18,	%f30,	%f8
	sra	%o0,	%g3,	%o5
	sdiv	%i3,	0x1BF1,	%i4
	array16	%i7,	%g6,	%i6
	sdiv	%g2,	0x0AD4,	%o4
	movpos	%icc,	%o2,	%g4
	st	%f13,	[%l7 + 0x70]
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	fnands	%f17,	%f26,	%f1
	fmovrsgez	%o6,	%f5,	%f28
	array16	%l1,	%l3,	%l0
	fmovsvc	%xcc,	%f26,	%f26
	fandnot2	%f22,	%f12,	%f2
	edge16	%l6,	%i1,	%i5
	ldub	[%l7 + 0x5A],	%i0
	movvc	%icc,	%g1,	%g5
	mulscc	%l2,	0x197C,	%i2
	mulscc	%l5,	%o3,	%l4
	ldsw	[%l7 + 0x38],	%o0
	andcc	%g3,	%g7,	%o5
	ldd	[%l7 + 0x20],	%i4
	movrgez	%i7,	0x316,	%g6
	fmovrdgz	%i6,	%f0,	%f26
	sll	%g2,	0x19,	%i3
	sdivx	%o4,	0x1CA6,	%o2
	edge32	%o7,	%o1,	%o6
	fcmpd	%fcc2,	%f8,	%f12
	edge16n	%l1,	%g4,	%l3
	sdivx	%l0,	0x181F,	%l6
	fmovdl	%xcc,	%f7,	%f13
	ldx	[%l7 + 0x50],	%i5
	sir	0x0146
	fsrc1s	%f4,	%f31
	alignaddrl	%i1,	%i0,	%g1
	srl	%g5,	%i2,	%l2
	sdivx	%o3,	0x1C8A,	%l4
	edge16ln	%o0,	%l5,	%g3
	sllx	%g7,	%o5,	%i4
	movgu	%xcc,	%g6,	%i6
	edge32	%g2,	%i3,	%o4
	move	%icc,	%o2,	%i7
	sethi	0x189A,	%o7
	fmovse	%xcc,	%f11,	%f14
	movrne	%o1,	%l1,	%o6
	array32	%g4,	%l3,	%l6
	movg	%xcc,	%l0,	%i5
	subc	%i0,	0x1A71,	%g1
	or	%g5,	%i2,	%i1
	alignaddr	%o3,	%l4,	%l2
	lduh	[%l7 + 0x3E],	%l5
	subc	%g3,	0x11CB,	%g7
	subcc	%o0,	%i4,	%o5
	edge32	%g6,	%i6,	%i3
	edge8n	%o4,	%o2,	%i7
	sir	0x1E33
	sdiv	%o7,	0x1FB9,	%o1
	edge8n	%l1,	%g2,	%o6
	fcmple32	%f24,	%f0,	%g4
	sir	0x12ED
	movleu	%xcc,	%l6,	%l3
	edge16l	%l0,	%i5,	%i0
	stw	%g1,	[%l7 + 0x7C]
	movrne	%i2,	0x165,	%g5
	fmovrdlez	%i1,	%f22,	%f4
	fpsub16	%f14,	%f16,	%f24
	fmovda	%xcc,	%f11,	%f13
	movg	%xcc,	%o3,	%l2
	array8	%l5,	%l4,	%g7
	movrlez	%o0,	%g3,	%o5
	movcs	%icc,	%g6,	%i4
	fmovspos	%icc,	%f8,	%f18
	nop
	set	0x37, %l1
	stb	%i6,	[%l7 + %l1]
	fsrc2s	%f18,	%f11
	fcmpne16	%f14,	%f24,	%i3
	fmovdge	%xcc,	%f10,	%f3
	fmovrde	%o2,	%f18,	%f0
	fcmpes	%fcc3,	%f11,	%f27
	st	%f30,	[%l7 + 0x30]
	fmovrdlez	%o4,	%f2,	%f30
	fmovsvc	%icc,	%f6,	%f17
	sll	%o7,	%i7,	%o1
	movneg	%xcc,	%l1,	%o6
	nop
	set	0x60, %i2
	sth	%g2,	[%l7 + %i2]
	fpadd16s	%f26,	%f0,	%f24
	orcc	%g4,	0x18E6,	%l6
	udivcc	%l3,	0x0206,	%l0
	movrgez	%i0,	%i5,	%i2
	movvc	%icc,	%g1,	%i1
	sll	%g5,	%o3,	%l2
	subcc	%l5,	0x1BFE,	%g7
	edge16	%l4,	%o0,	%g3
	xnorcc	%g6,	0x147B,	%o5
	array32	%i4,	%i6,	%o2
	array32	%o4,	%o7,	%i3
	nop
	set	0x30, %o6
	ldsh	[%l7 + %o6],	%o1
	save %l1, 0x17A9, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%o6,	%g2,	%g4
	umulcc	%l3,	0x0C86,	%l0
	sllx	%l6,	0x0C,	%i0
	lduh	[%l7 + 0x0A],	%i2
	stb	%g1,	[%l7 + 0x1A]
	ldx	[%l7 + 0x30],	%i5
	movle	%icc,	%i1,	%o3
	subc	%g5,	0x01C7,	%l2
	edge32n	%l5,	%g7,	%o0
	fcmpgt16	%f24,	%f12,	%l4
	addcc	%g6,	0x09A0,	%o5
	fmovdcs	%icc,	%f18,	%f28
	nop
	set	0x3A, %g2
	ldsh	[%l7 + %g2],	%i4
	ldd	[%l7 + 0x08],	%i6
	xnorcc	%g3,	0x127E,	%o2
	ldd	[%l7 + 0x40],	%o6
	sth	%o4,	[%l7 + 0x7A]
	movne	%icc,	%i3,	%l1
	movg	%xcc,	%o1,	%i7
	fmovrdlez	%g2,	%f16,	%f28
	sdiv	%o6,	0x08BF,	%g4
	addc	%l0,	%l3,	%i0
	fmovde	%icc,	%f13,	%f20
	edge8n	%l6,	%g1,	%i2
	srl	%i5,	0x0E,	%i1
	subcc	%g5,	%l2,	%l5
	orn	%g7,	0x0C5E,	%o3
	addcc	%l4,	0x06EB,	%o0
	srl	%o5,	0x06,	%g6
	movn	%icc,	%i6,	%i4
	movrne	%g3,	%o2,	%o7
	fmovrdlez	%i3,	%f18,	%f22
	alignaddrl	%o4,	%o1,	%i7
	fandnot2s	%f26,	%f14,	%f30
	ldsb	[%l7 + 0x12],	%g2
	udivx	%l1,	0x149E,	%g4
	edge8	%o6,	%l0,	%i0
	fcmpne32	%f24,	%f30,	%l3
	movleu	%icc,	%l6,	%g1
	ldsb	[%l7 + 0x73],	%i5
	srlx	%i1,	%g5,	%l2
	alignaddrl	%i2,	%g7,	%l5
	umul	%o3,	0x18A2,	%o0
	popc	%l4,	%o5
	mulscc	%i6,	%g6,	%g3
	or	%i4,	%o7,	%i3
	movne	%icc,	%o4,	%o2
	edge32	%i7,	%o1,	%g2
	lduh	[%l7 + 0x0E],	%l1
	faligndata	%f30,	%f6,	%f12
	udiv	%o6,	0x027F,	%l0
	sll	%g4,	0x05,	%l3
	movre	%l6,	0x273,	%i0
	movrlz	%i5,	%i1,	%g5
	orncc	%g1,	0x0A52,	%i2
	movcs	%icc,	%g7,	%l5
	mulx	%o3,	0x1961,	%l2
	sll	%o0,	%o5,	%i6
	edge16l	%g6,	%l4,	%g3
	ld	[%l7 + 0x7C],	%f23
	movgu	%xcc,	%o7,	%i4
	nop
	set	0x74, %o1
	lduw	[%l7 + %o1],	%o4
	stw	%i3,	[%l7 + 0x4C]
	fpmerge	%f20,	%f29,	%f22
	udivcc	%i7,	0x1198,	%o2
	movrlez	%o1,	%l1,	%g2
	srl	%l0,	%g4,	%l3
	movpos	%icc,	%l6,	%o6
	movneg	%icc,	%i5,	%i0
	movvs	%icc,	%i1,	%g1
	mova	%xcc,	%g5,	%i2
	orn	%g7,	0x11CB,	%l5
	array8	%l2,	%o0,	%o5
	mulscc	%i6,	0x0DBC,	%o3
	edge16ln	%g6,	%l4,	%o7
	ldsh	[%l7 + 0x48],	%i4
	fcmped	%fcc2,	%f12,	%f20
	fmovdneg	%icc,	%f15,	%f30
	nop
	set	0x7D, %l3
	ldub	[%l7 + %l3],	%g3
	movge	%xcc,	%o4,	%i7
	fpack32	%f12,	%f24,	%f14
	movrlez	%i3,	%o2,	%l1
	sir	0x097A
	movn	%icc,	%g2,	%o1
	andcc	%l0,	0x03F1,	%l3
	stw	%l6,	[%l7 + 0x58]
	add	%o6,	0x143A,	%i5
	movcc	%xcc,	%g4,	%i1
	orcc	%g1,	0x07A0,	%i0
	fcmple16	%f4,	%f2,	%i2
	udivx	%g5,	0x01C3,	%g7
	restore %l2, %o0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o5,	0x0679,	%i6
	smulcc	%g6,	0x14AA,	%l4
	fcmple16	%f18,	%f26,	%o7
	alignaddr	%o3,	%g3,	%o4
	std	%f18,	[%l7 + 0x70]
	smulcc	%i7,	0x1A7F,	%i4
	movrlez	%o2,	0x353,	%i3
	movpos	%icc,	%g2,	%l1
	array32	%l0,	%l3,	%l6
	movrgz	%o6,	0x11A,	%o1
	edge32n	%i5,	%i1,	%g1
	fornot1	%f30,	%f30,	%f14
	std	%f28,	[%l7 + 0x08]
	fornot2s	%f8,	%f8,	%f1
	nop
	set	0x70, %i4
	ldsw	[%l7 + %i4],	%i0
	movgu	%xcc,	%g4,	%g5
	edge8	%i2,	%l2,	%g7
	udivcc	%o0,	0x0794,	%l5
	ld	[%l7 + 0x74],	%f24
	movrgez	%i6,	0x0E6,	%o5
	fornot1	%f26,	%f14,	%f24
	fmovdg	%xcc,	%f22,	%f10
	edge32n	%g6,	%l4,	%o3
	ldsw	[%l7 + 0x1C],	%g3
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	ld	[%l7 + 0x78],	%f25
	fornot2s	%f10,	%f15,	%f30
	movl	%icc,	%o2,	%i3
	fcmpd	%fcc3,	%f26,	%f6
	fand	%f10,	%f4,	%f26
	fmovsa	%icc,	%f15,	%f22
	fmovrsgz	%i4,	%f26,	%f6
	orcc	%l1,	%g2,	%l3
	st	%f9,	[%l7 + 0x1C]
	fnot1	%f30,	%f26
	move	%xcc,	%l0,	%o6
	fmovdvs	%icc,	%f14,	%f22
	edge16l	%o1,	%i5,	%l6
	sdivx	%i1,	0x02E5,	%i0
	sra	%g1,	%g4,	%g5
	nop
	set	0x62, %g4
	lduh	[%l7 + %g4],	%l2
	movleu	%xcc,	%i2,	%o0
	smul	%g7,	0x19EC,	%i6
	alignaddrl	%l5,	%g6,	%l4
	orncc	%o5,	0x07B2,	%g3
	array16	%o3,	%i7,	%o7
	sdivx	%o2,	0x1269,	%o4
	xnor	%i4,	%l1,	%i3
	lduh	[%l7 + 0x24],	%l3
	udivcc	%g2,	0x15AB,	%l0
	std	%f16,	[%l7 + 0x40]
	st	%f30,	[%l7 + 0x68]
	ldub	[%l7 + 0x3B],	%o6
	fnot1	%f20,	%f2
	fandnot1	%f24,	%f12,	%f2
	lduh	[%l7 + 0x4A],	%o1
	edge32n	%i5,	%i1,	%l6
	ldx	[%l7 + 0x20],	%g1
	array16	%i0,	%g5,	%g4
	movneg	%xcc,	%i2,	%o0
	fexpand	%f5,	%f12
	edge8l	%g7,	%i6,	%l5
	movcc	%xcc,	%g6,	%l2
	xnor	%l4,	%g3,	%o5
	sll	%i7,	0x01,	%o3
	lduw	[%l7 + 0x30],	%o2
	sdivcc	%o7,	0x1B07,	%i4
	mulx	%l1,	0x034E,	%i3
	ldd	[%l7 + 0x70],	%f6
	mova	%xcc,	%o4,	%g2
	fandnot2	%f22,	%f28,	%f18
	restore %l0, 0x0F32, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o1,	%l3,	%i1
	move	%xcc,	%l6,	%g1
	sdivx	%i0,	0x1F28,	%g5
	fmul8x16al	%f14,	%f19,	%f22
	fcmpgt16	%f2,	%f4,	%i5
	fors	%f28,	%f30,	%f10
	fmovrdlez	%i2,	%f12,	%f28
	movne	%icc,	%g4,	%g7
	sllx	%i6,	%l5,	%o0
	sll	%l2,	0x0D,	%g6
	edge32	%l4,	%g3,	%o5
	xnor	%i7,	0x0E64,	%o3
	edge32	%o2,	%i4,	%l1
	udivx	%i3,	0x105F,	%o4
	ldd	[%l7 + 0x58],	%g2
	andn	%l0,	%o6,	%o1
	fnot2s	%f28,	%f1
	alignaddrl	%l3,	%o7,	%i1
	and	%g1,	0x09D2,	%i0
	or	%l6,	0x1C5C,	%i5
	add	%i2,	0x02F8,	%g4
	movl	%xcc,	%g5,	%i6
	ld	[%l7 + 0x74],	%f9
	fmovda	%icc,	%f15,	%f23
	move	%icc,	%l5,	%o0
	addccc	%g7,	%l2,	%l4
	alignaddr	%g6,	%o5,	%i7
	movre	%g3,	0x144,	%o2
	fmovrslez	%i4,	%f1,	%f9
	save %o3, %l1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f5,	%f26,	%f16
	srax	%i3,	0x18,	%l0
	mova	%xcc,	%o6,	%g2
	fcmpeq16	%f26,	%f16,	%l3
	fmul8x16	%f1,	%f4,	%f14
	edge32	%o7,	%o1,	%g1
	fcmpgt16	%f20,	%f22,	%i1
	add	%i0,	0x0512,	%l6
	ldsb	[%l7 + 0x0C],	%i2
	movl	%icc,	%g4,	%i5
	orncc	%i6,	%l5,	%o0
	fexpand	%f21,	%f26
	nop
	set	0x78, %l4
	ldx	[%l7 + %l4],	%g7
	movrgez	%g5,	0x34A,	%l4
	sllx	%l2,	%g6,	%i7
	xor	%g3,	%o2,	%o5
	fpmerge	%f26,	%f0,	%f14
	and	%i4,	%l1,	%o3
	fcmpgt16	%f18,	%f14,	%i3
	ldx	[%l7 + 0x58],	%o4
	addc	%l0,	0x05ED,	%g2
	ldx	[%l7 + 0x78],	%o6
	movne	%xcc,	%l3,	%o7
	nop
	set	0x5C, %o5
	lduh	[%l7 + %o5],	%g1
	mulx	%o1,	0x16D7,	%i0
	smul	%l6,	%i2,	%g4
	ldd	[%l7 + 0x50],	%i0
	movg	%xcc,	%i5,	%l5
	stb	%o0,	[%l7 + 0x52]
	movrgz	%g7,	0x37F,	%i6
	edge8n	%l4,	%l2,	%g6
	or	%g5,	%g3,	%o2
	movge	%xcc,	%i7,	%i4
	movre	%l1,	%o5,	%i3
	edge8ln	%o4,	%l0,	%g2
	xorcc	%o6,	0x1C64,	%l3
	fsrc2	%f28,	%f0
	andncc	%o3,	%g1,	%o7
	or	%o1,	0x0F81,	%l6
	sll	%i2,	%g4,	%i1
	srax	%i0,	%l5,	%i5
	movcs	%xcc,	%g7,	%i6
	movcc	%icc,	%l4,	%o0
	xnorcc	%l2,	%g6,	%g3
	fmovdgu	%xcc,	%f11,	%f31
	edge32n	%o2,	%g5,	%i7
	orncc	%l1,	0x1AA6,	%i4
	fmovsg	%icc,	%f26,	%f12
	edge16	%o5,	%o4,	%l0
	movg	%icc,	%i3,	%o6
	edge8	%g2,	%o3,	%l3
	edge16ln	%o7,	%g1,	%l6
	fabsd	%f26,	%f6
	srlx	%o1,	%g4,	%i2
	fornot2s	%f4,	%f30,	%f22
	sub	%i1,	0x128A,	%l5
	movrlez	%i0,	%i5,	%i6
	movn	%icc,	%g7,	%l4
	movneg	%icc,	%l2,	%g6
	udivcc	%o0,	0x0F0A,	%g3
	movgu	%xcc,	%o2,	%i7
	mulx	%l1,	0x083C,	%g5
	sllx	%o5,	%o4,	%i4
	lduh	[%l7 + 0x18],	%i3
	movvs	%xcc,	%l0,	%o6
	popc	0x1A91,	%g2
	srax	%l3,	0x05,	%o7
	fpsub32	%f4,	%f0,	%f4
	fxnor	%f12,	%f30,	%f12
	srlx	%g1,	%o3,	%o1
	udivcc	%l6,	0x0004,	%g4
	orn	%i1,	%i2,	%i0
	srl	%i5,	0x0F,	%l5
	movpos	%xcc,	%i6,	%l4
	smulcc	%g7,	0x0A59,	%l2
	smul	%g6,	%g3,	%o2
	siam	0x1
	xor	%o0,	%i7,	%g5
	fmovsvc	%xcc,	%f6,	%f2
	alignaddrl	%o5,	%l1,	%o4
	ldsh	[%l7 + 0x0C],	%i3
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%f4
	subcc	%l0,	0x1134,	%i4
	fmovrslez	%g2,	%f7,	%f3
	srax	%l3,	%o7,	%g1
	fpmerge	%f16,	%f19,	%f20
	andcc	%o6,	0x081C,	%o3
	fxors	%f10,	%f0,	%f30
	movle	%icc,	%o1,	%g4
	movg	%xcc,	%l6,	%i1
	movneg	%xcc,	%i2,	%i0
	sethi	0x0FEB,	%l5
	umul	%i6,	%l4,	%g7
	fnands	%f12,	%f31,	%f0
	array16	%l2,	%i5,	%g3
	orncc	%o2,	0x1E32,	%g6
	xorcc	%o0,	0x0345,	%g5
	xnor	%i7,	0x1C76,	%l1
	ldsh	[%l7 + 0x14],	%o5
	siam	0x7
	or	%o4,	%i3,	%l0
	movvc	%icc,	%i4,	%l3
	fmovse	%xcc,	%f19,	%f25
	fxors	%f23,	%f17,	%f7
	ldsh	[%l7 + 0x44],	%o7
	ldsw	[%l7 + 0x40],	%g2
	movcs	%icc,	%o6,	%o3
	sll	%g1,	%g4,	%o1
	edge32l	%l6,	%i1,	%i2
	andcc	%i0,	%i6,	%l4
	alignaddrl	%l5,	%l2,	%i5
	edge32l	%g7,	%g3,	%o2
	movgu	%icc,	%g6,	%o0
	fnegs	%f6,	%f1
	st	%f19,	[%l7 + 0x4C]
	fmovd	%f28,	%f14
	subccc	%g5,	%i7,	%l1
	movcc	%xcc,	%o4,	%i3
	movcc	%icc,	%o5,	%l0
	stw	%l3,	[%l7 + 0x40]
	edge8n	%o7,	%g2,	%i4
	sub	%o6,	0x1B2B,	%g1
	ldx	[%l7 + 0x10],	%g4
	movl	%xcc,	%o1,	%o3
	edge8n	%i1,	%i2,	%i0
	alignaddrl	%i6,	%l4,	%l5
	sth	%l6,	[%l7 + 0x44]
	fxor	%f6,	%f22,	%f2
	edge8ln	%l2,	%i5,	%g7
	movre	%o2,	0x2E0,	%g6
	movvc	%xcc,	%o0,	%g3
	stx	%i7,	[%l7 + 0x38]
	fmul8x16al	%f19,	%f17,	%f2
	xnorcc	%l1,	%g5,	%i3
	fmovdle	%icc,	%f26,	%f20
	edge8ln	%o5,	%l0,	%l3
	for	%f22,	%f10,	%f2
	ldx	[%l7 + 0x50],	%o4
	srlx	%o7,	0x12,	%g2
	lduh	[%l7 + 0x26],	%i4
	fsrc1	%f8,	%f12
	xor	%g1,	%o6,	%o1
	movrgz	%o3,	%i1,	%g4
	fcmped	%fcc2,	%f4,	%f20
	sdiv	%i2,	0x09E2,	%i6
	sth	%i0,	[%l7 + 0x36]
	movl	%icc,	%l4,	%l6
	edge16l	%l5,	%i5,	%l2
	std	%f6,	[%l7 + 0x20]
	andncc	%g7,	%o2,	%o0
	fmovda	%xcc,	%f14,	%f0
	movrlez	%g3,	%g6,	%l1
	ldd	[%l7 + 0x08],	%f0
	sllx	%g5,	%i7,	%i3
	sir	0x055B
	smul	%l0,	%l3,	%o4
	srlx	%o7,	%g2,	%i4
	fcmpd	%fcc0,	%f4,	%f14
	subcc	%g1,	%o6,	%o5
	movrne	%o3,	0x20B,	%i1
	array16	%g4,	%o1,	%i2
	fsrc2	%f16,	%f24
	ldd	[%l7 + 0x20],	%f28
	movpos	%xcc,	%i6,	%l4
	smulcc	%i0,	%l6,	%i5
	ldx	[%l7 + 0x28],	%l5
	popc	0x02E8,	%l2
	sll	%g7,	%o0,	%o2
	srlx	%g6,	0x12,	%g3
	fmovsn	%xcc,	%f4,	%f14
	edge32	%g5,	%l1,	%i3
	smulcc	%l0,	0x11FC,	%l3
	sllx	%o4,	%o7,	%g2
	movleu	%xcc,	%i7,	%g1
	std	%f8,	[%l7 + 0x18]
	fandnot1s	%f1,	%f25,	%f1
	srax	%i4,	0x13,	%o6
	edge8	%o5,	%i1,	%o3
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%f20
	fnot1	%f10,	%f10
	fnot1	%f14,	%f28
	fornot1s	%f21,	%f9,	%f9
	sllx	%o1,	%g4,	%i2
	smulcc	%l4,	0x159F,	%i6
	xnor	%i0,	%i5,	%l6
	edge16l	%l2,	%g7,	%o0
	sir	0x1790
	andncc	%l5,	%o2,	%g6
	movcc	%icc,	%g5,	%g3
	alignaddrl	%l1,	%l0,	%i3
	lduh	[%l7 + 0x1E],	%o4
	udiv	%o7,	0x1784,	%l3
	sdivcc	%g2,	0x1A6E,	%g1
	sth	%i7,	[%l7 + 0x6C]
	sdiv	%i4,	0x0CEE,	%o6
	edge16	%o5,	%i1,	%o3
	movn	%icc,	%o1,	%i2
	addcc	%g4,	0x19AD,	%l4
	lduw	[%l7 + 0x24],	%i6
	fzeros	%f29
	fcmpgt16	%f0,	%f10,	%i5
	edge16ln	%i0,	%l6,	%g7
	andncc	%o0,	%l5,	%o2
	umulcc	%l2,	%g6,	%g3
	ldx	[%l7 + 0x10],	%l1
	or	%g5,	0x0D5D,	%l0
	fmovdvs	%xcc,	%f4,	%f0
	sdiv	%i3,	0x188D,	%o7
	movrne	%l3,	%o4,	%g2
	udivcc	%g1,	0x1AE9,	%i7
	movn	%xcc,	%o6,	%i4
	sethi	0x04D8,	%o5
	sra	%i1,	%o1,	%o3
	fmovse	%xcc,	%f29,	%f2
	fmovdleu	%icc,	%f6,	%f6
	ldsh	[%l7 + 0x38],	%i2
	sth	%l4,	[%l7 + 0x5E]
	movn	%xcc,	%i6,	%i5
	fpadd16	%f8,	%f12,	%f24
	movcs	%icc,	%i0,	%g4
	ldx	[%l7 + 0x58],	%l6
	fmul8sux16	%f24,	%f28,	%f10
	fornot1	%f18,	%f20,	%f10
	alignaddr	%o0,	%g7,	%o2
	lduh	[%l7 + 0x54],	%l5
	stb	%g6,	[%l7 + 0x1B]
	edge32ln	%g3,	%l2,	%g5
	edge16	%l1,	%l0,	%o7
	udivcc	%l3,	0x0806,	%o4
	nop
	set	0x61, %i7
	ldsb	[%l7 + %i7],	%i3
	fmul8sux16	%f30,	%f6,	%f20
	andcc	%g2,	%i7,	%o6
	edge16ln	%g1,	%i4,	%o5
	alignaddrl	%o1,	%o3,	%i1
	sub	%i2,	%l4,	%i6
	alignaddr	%i0,	%i5,	%g4
	movrgz	%o0,	%l6,	%o2
	movre	%l5,	%g7,	%g3
	array32	%l2,	%g6,	%g5
	movle	%icc,	%l0,	%o7
	fandnot2s	%f9,	%f12,	%f23
	edge16l	%l1,	%o4,	%l3
	fone	%f26
	fmovd	%f20,	%f28
	andn	%g2,	%i3,	%o6
	xorcc	%g1,	%i7,	%i4
	sub	%o1,	%o5,	%i1
	movrne	%i2,	%l4,	%o3
	fmovsvs	%icc,	%f15,	%f20
	stx	%i6,	[%l7 + 0x20]
	edge32	%i0,	%g4,	%i5
	xnorcc	%o0,	0x01E5,	%o2
	mova	%icc,	%l5,	%g7
	orncc	%g3,	0x03BA,	%l2
	fmovdcs	%xcc,	%f24,	%f22
	movn	%xcc,	%l6,	%g6
	movrlz	%l0,	0x076,	%o7
	movrlz	%l1,	0x2EA,	%o4
	udiv	%g5,	0x0A19,	%g2
	alignaddrl	%l3,	%i3,	%o6
	movre	%g1,	0x079,	%i4
	std	%f8,	[%l7 + 0x18]
	ldx	[%l7 + 0x70],	%i7
	movgu	%xcc,	%o1,	%i1
	edge16ln	%o5,	%i2,	%l4
	sdivx	%i6,	0x152F,	%i0
	ldd	[%l7 + 0x20],	%f14
	movrlez	%o3,	%g4,	%i5
	xor	%o0,	%l5,	%g7
	std	%f14,	[%l7 + 0x60]
	fzero	%f20
	edge32n	%g3,	%l2,	%l6
	array32	%g6,	%l0,	%o7
	fcmple16	%f24,	%f6,	%l1
	std	%f24,	[%l7 + 0x40]
	ldsh	[%l7 + 0x66],	%o2
	sdiv	%o4,	0x0069,	%g2
	edge32n	%l3,	%g5,	%i3
	stx	%o6,	[%l7 + 0x70]
	mulx	%g1,	0x05C3,	%i7
	fmul8sux16	%f26,	%f20,	%f18
	fmovdn	%xcc,	%f3,	%f28
	subc	%o1,	0x04FF,	%i4
	mova	%icc,	%i1,	%i2
	fmovsvs	%xcc,	%f22,	%f0
	sra	%o5,	0x1D,	%i6
	sdivx	%l4,	0x1E8C,	%i0
	movne	%icc,	%o3,	%g4
	addc	%o0,	0x152E,	%l5
	xnor	%g7,	0x0330,	%i5
	umulcc	%g3,	%l2,	%g6
	movgu	%icc,	%l0,	%o7
	movrne	%l1,	0x36D,	%l6
	edge8ln	%o4,	%g2,	%o2
	fpadd32s	%f30,	%f21,	%f23
	movrgez	%l3,	%g5,	%i3
	srl	%o6,	0x00,	%i7
	xorcc	%g1,	0x0EED,	%i4
	ldx	[%l7 + 0x08],	%o1
	mova	%xcc,	%i1,	%o5
	fmul8x16au	%f30,	%f31,	%f24
	movrne	%i2,	%l4,	%i0
	movneg	%icc,	%o3,	%i6
	st	%f7,	[%l7 + 0x44]
	addc	%g4,	0x00B5,	%o0
	xnorcc	%l5,	%i5,	%g7
	fmovsleu	%xcc,	%f17,	%f24
	fmovdvs	%xcc,	%f18,	%f19
	sdivcc	%l2,	0x042C,	%g3
	udiv	%g6,	0x04A1,	%o7
	smul	%l1,	%l6,	%o4
	addcc	%g2,	0x0BDA,	%o2
	fmuld8ulx16	%f18,	%f14,	%f16
	ld	[%l7 + 0x3C],	%f5
	sdiv	%l0,	0x131A,	%g5
	fcmpes	%fcc2,	%f28,	%f28
	fmovsleu	%xcc,	%f0,	%f30
	fmovs	%f3,	%f11
	movvs	%xcc,	%i3,	%l3
	fmovdcc	%icc,	%f16,	%f16
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%f14
	alignaddr	%i7,	%g1,	%i4
	addccc	%o1,	0x0192,	%i1
	ldd	[%l7 + 0x20],	%f20
	movvs	%icc,	%o5,	%i2
	orn	%o6,	%i0,	%l4
	addccc	%i6,	%g4,	%o3
	ldsw	[%l7 + 0x70],	%o0
	edge32	%i5,	%l5,	%g7
	andn	%g3,	%l2,	%g6
	fnot2	%f22,	%f30
	edge16l	%o7,	%l6,	%l1
	smul	%o4,	%g2,	%o2
	movleu	%xcc,	%l0,	%i3
	fmovdl	%icc,	%f0,	%f10
	fmovrde	%l3,	%f12,	%f12
	fcmple32	%f26,	%f4,	%g5
	movg	%xcc,	%g1,	%i4
	edge16l	%o1,	%i7,	%i1
	movrlz	%o5,	%o6,	%i2
	fnors	%f28,	%f27,	%f29
	mulx	%i0,	%i6,	%g4
	udiv	%l4,	0x1B66,	%o3
	st	%f11,	[%l7 + 0x64]
	fsrc2s	%f17,	%f29
	sllx	%o0,	%l5,	%i5
	movne	%icc,	%g3,	%g7
	udivcc	%g6,	0x0485,	%o7
	add	%l2,	%l1,	%l6
	srlx	%g2,	%o4,	%o2
	ldx	[%l7 + 0x48],	%l0
	fpackfix	%f28,	%f0
	st	%f3,	[%l7 + 0x70]
	edge32	%i3,	%l3,	%g5
	movl	%icc,	%i4,	%o1
	xorcc	%g1,	%i1,	%i7
	sdivcc	%o6,	0x1A88,	%o5
	edge16ln	%i2,	%i6,	%i0
	save %g4, %l4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%icc,	%f25,	%f16
	fpsub32s	%f13,	%f23,	%f15
	nop
	set	0x6A, %i6
	sth	%l5,	[%l7 + %i6]
	udiv	%o3,	0x0041,	%i5
	or	%g7,	%g3,	%o7
	mulx	%g6,	%l2,	%l1
	movrlez	%l6,	0x00F,	%o4
	pdist	%f24,	%f10,	%f30
	edge32n	%g2,	%o2,	%l0
	xor	%i3,	0x0311,	%l3
	movrne	%i4,	0x020,	%g5
	movrgez	%g1,	0x02B,	%i1
	popc	%i7,	%o6
	ldsb	[%l7 + 0x62],	%o1
	movn	%icc,	%i2,	%o5
	fmovrdne	%i6,	%f20,	%f6
	ldsb	[%l7 + 0x49],	%g4
	edge16n	%l4,	%o0,	%l5
	movg	%icc,	%o3,	%i5
	smulcc	%i0,	0x0889,	%g7
	movle	%icc,	%g3,	%g6
	fmovscc	%icc,	%f10,	%f26
	movrgez	%l2,	0x25C,	%o7
	alignaddrl	%l1,	%o4,	%g2
	subcc	%l6,	%l0,	%o2
	stx	%l3,	[%l7 + 0x70]
	srax	%i3,	%i4,	%g1
	movpos	%xcc,	%g5,	%i7
	andcc	%i1,	%o6,	%o1
	movleu	%xcc,	%o5,	%i2
	lduw	[%l7 + 0x08],	%g4
	movne	%icc,	%l4,	%o0
	movgu	%icc,	%l5,	%o3
	fmovdl	%xcc,	%f28,	%f1
	edge32ln	%i5,	%i6,	%i0
	movvs	%icc,	%g3,	%g6
	fmovrslz	%g7,	%f22,	%f2
	udivcc	%l2,	0x048F,	%l1
	fsrc2	%f0,	%f4
	popc	%o7,	%o4
	orncc	%l6,	%g2,	%l0
	mulscc	%o2,	%l3,	%i4
	movgu	%icc,	%g1,	%i3
	edge32	%i7,	%g5,	%o6
	fmuld8sux16	%f11,	%f12,	%f12
	fmul8sux16	%f28,	%f20,	%f26
	movn	%xcc,	%o1,	%o5
	lduh	[%l7 + 0x16],	%i1
	xnorcc	%g4,	0x01DA,	%i2
	sub	%o0,	0x08BE,	%l5
	st	%f10,	[%l7 + 0x54]
	orn	%l4,	%i5,	%o3
	movg	%xcc,	%i6,	%i0
	fmovsneg	%xcc,	%f3,	%f24
	array32	%g6,	%g3,	%g7
	fmovse	%icc,	%f24,	%f3
	movrne	%l2,	0x206,	%l1
	nop
	set	0x20, %l0
	ldsw	[%l7 + %l0],	%o4
	ld	[%l7 + 0x44],	%f9
	fnors	%f20,	%f24,	%f21
	sdiv	%l6,	0x0955,	%g2
	orcc	%l0,	%o7,	%l3
	edge32ln	%o2,	%i4,	%i3
	ld	[%l7 + 0x3C],	%f12
	ldd	[%l7 + 0x68],	%f2
	orn	%i7,	%g5,	%g1
	fnot1	%f14,	%f22
	udiv	%o6,	0x0057,	%o5
	nop
	set	0x68, %l2
	ldx	[%l7 + %l2],	%i1
	and	%o1,	%i2,	%o0
	andcc	%l5,	%g4,	%l4
	fmovdcs	%xcc,	%f0,	%f31
	movgu	%icc,	%o3,	%i6
	fpsub16	%f6,	%f26,	%f18
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	fnors	%f6,	%f0,	%f25
	fnot2	%f12,	%f16
	edge8	%g6,	%g7,	%l2
	fmovsge	%xcc,	%f23,	%f25
	ldub	[%l7 + 0x54],	%l1
	orncc	%g3,	%o4,	%g2
	andncc	%l6,	%o7,	%l0
	movrne	%o2,	%l3,	%i4
	std	%f18,	[%l7 + 0x70]
	edge8	%i3,	%i7,	%g1
	movg	%icc,	%g5,	%o6
	ldd	[%l7 + 0x70],	%f4
	andncc	%o5,	%i1,	%o1
	edge32l	%o0,	%i2,	%g4
	movvc	%icc,	%l5,	%l4
	edge8n	%i6,	%i5,	%i0
	fpmerge	%f24,	%f16,	%f4
	or	%o3,	0x1BBB,	%g6
	subcc	%g7,	%l2,	%l1
	ldsw	[%l7 + 0x28],	%g3
	fmuld8ulx16	%f28,	%f22,	%f6
	alignaddrl	%o4,	%g2,	%l6
	movrlz	%l0,	0x2EB,	%o2
	edge32l	%l3,	%i4,	%o7
	lduw	[%l7 + 0x38],	%i3
	edge16	%g1,	%i7,	%o6
	andcc	%o5,	%i1,	%g5
	subc	%o0,	0x0D4F,	%i2
	subcc	%o1,	0x1398,	%l5
	udiv	%g4,	0x0536,	%i6
	edge8l	%i5,	%l4,	%o3
	edge32ln	%g6,	%i0,	%g7
	lduh	[%l7 + 0x60],	%l2
	edge16n	%l1,	%g3,	%g2
	orcc	%l6,	0x0F93,	%l0
	ldx	[%l7 + 0x28],	%o2
	fmovdl	%icc,	%f13,	%f2
	edge8ln	%o4,	%i4,	%o7
	subccc	%l3,	%i3,	%g1
	save %o6, 0x04AE, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i1,	%o5,	%o0
	fandnot1s	%f23,	%f28,	%f8
	array16	%g5,	%o1,	%l5
	movne	%icc,	%i2,	%i6
	add	%g4,	%l4,	%i5
	edge16	%o3,	%g6,	%g7
	andn	%l2,	0x08CC,	%l1
	sdiv	%g3,	0x03C5,	%g2
	srl	%l6,	%i0,	%o2
	edge32ln	%l0,	%i4,	%o7
	add	%l3,	%o4,	%i3
	xnorcc	%g1,	0x0A52,	%o6
	andcc	%i1,	%i7,	%o5
	fpack16	%f2,	%f15
	fxnors	%f14,	%f4,	%f6
	srlx	%o0,	%g5,	%o1
	sra	%l5,	0x13,	%i6
	array8	%i2,	%g4,	%i5
	movvs	%icc,	%l4,	%g6
	movrlez	%g7,	%o3,	%l2
	srl	%l1,	0x00,	%g3
	sir	0x1DE6
	movleu	%icc,	%l6,	%g2
	movvc	%xcc,	%i0,	%o2
	udivx	%i4,	0x0510,	%l0
	edge32l	%o7,	%l3,	%i3
	xorcc	%g1,	%o6,	%i1
	fzero	%f0
	ld	[%l7 + 0x28],	%f12
	movpos	%xcc,	%o4,	%i7
	ldx	[%l7 + 0x48],	%o5
	fmovsge	%xcc,	%f24,	%f7
	fmovdcc	%icc,	%f25,	%f4
	ldd	[%l7 + 0x70],	%f24
	add	%o0,	%o1,	%l5
	ldsw	[%l7 + 0x74],	%i6
	mulx	%g5,	0x060F,	%i2
	sth	%i5,	[%l7 + 0x50]
	orncc	%g4,	%g6,	%g7
	and	%o3,	%l2,	%l4
	movleu	%xcc,	%g3,	%l6
	movpos	%icc,	%l1,	%g2
	ld	[%l7 + 0x78],	%f5
	movne	%xcc,	%i0,	%o2
	orn	%i4,	0x1BCF,	%o7
	andcc	%l3,	0x173F,	%l0
	fmovscs	%xcc,	%f25,	%f27
	movneg	%icc,	%i3,	%o6
	stw	%i1,	[%l7 + 0x0C]
	save %g1, %o4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o0,	0x0F66,	%o1
	ldub	[%l7 + 0x66],	%i7
	fpsub32s	%f13,	%f15,	%f18
	fcmps	%fcc0,	%f10,	%f10
	movrlez	%i6,	%l5,	%i2
	fsrc2	%f20,	%f14
	movleu	%xcc,	%i5,	%g4
	movneg	%xcc,	%g6,	%g5
	sub	%o3,	%l2,	%g7
	fpadd32s	%f23,	%f12,	%f9
	movgu	%icc,	%l4,	%g3
	restore %l6, %l1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i0,	%o2,	%i4
	array32	%l3,	%o7,	%l0
	fmuld8ulx16	%f16,	%f15,	%f30
	movrgez	%i3,	%i1,	%g1
	orn	%o4,	0x0159,	%o6
	edge8l	%o5,	%o0,	%i7
	fnegs	%f12,	%f20
	xorcc	%i6,	0x17D5,	%l5
	xorcc	%i2,	%o1,	%g4
	nop
	set	0x58, %o7
	sth	%i5,	[%l7 + %o7]
	save %g6, %o3, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f19,	%f25
	fmovscc	%xcc,	%f4,	%f11
	mulscc	%g7,	%l4,	%g5
	movgu	%xcc,	%g3,	%l1
	andcc	%g2,	0x0042,	%l6
	sth	%i0,	[%l7 + 0x2E]
	andcc	%o2,	%i4,	%l3
	ldx	[%l7 + 0x30],	%l0
	sir	0x1A15
	orncc	%o7,	0x192D,	%i1
	popc	0x0D1B,	%g1
	andn	%o4,	0x10AB,	%o6
	srax	%o5,	%i3,	%o0
	movg	%xcc,	%i7,	%l5
	edge16n	%i6,	%o1,	%i2
	stw	%i5,	[%l7 + 0x40]
	movrne	%g4,	0x30A,	%o3
	orcc	%g6,	0x0EF6,	%l2
	movgu	%icc,	%g7,	%g5
	movcc	%xcc,	%l4,	%g3
	fmovse	%xcc,	%f25,	%f13
	fpsub32	%f30,	%f30,	%f12
	srax	%l1,	0x18,	%l6
	movle	%xcc,	%i0,	%o2
	edge32	%g2,	%i4,	%l3
	movrgez	%o7,	0x124,	%l0
	movcc	%icc,	%g1,	%i1
	orncc	%o4,	0x0158,	%o5
	array8	%i3,	%o6,	%i7
	subc	%l5,	0x0D8F,	%i6
	fcmpne32	%f16,	%f28,	%o0
	subccc	%o1,	0x09CD,	%i2
	smulcc	%i5,	0x1F8B,	%o3
	array32	%g4,	%g6,	%l2
	ldsb	[%l7 + 0x45],	%g7
	fnors	%f9,	%f22,	%f30
	mulscc	%g5,	%g3,	%l4
	sethi	0x0143,	%l6
	movl	%icc,	%i0,	%o2
	subc	%g2,	0x1245,	%l1
	sll	%i4,	0x19,	%l3
	fand	%f26,	%f28,	%f20
	mulscc	%o7,	0x1C68,	%l0
	umul	%g1,	%i1,	%o5
	movne	%icc,	%o4,	%i3
	movre	%i7,	%o6,	%i6
	subc	%o0,	0x05E4,	%l5
	orn	%i2,	%i5,	%o1
	array8	%g4,	%o3,	%l2
	movrlez	%g7,	0x000,	%g6
	stw	%g3,	[%l7 + 0x34]
	fmovsneg	%xcc,	%f24,	%f30
	fmovdle	%icc,	%f6,	%f13
	sdivx	%g5,	0x1149,	%l4
	edge8n	%i0,	%o2,	%g2
	lduw	[%l7 + 0x50],	%l6
	fmovrsgez	%l1,	%f13,	%f1
	edge32l	%i4,	%o7,	%l3
	array32	%l0,	%i1,	%o5
	popc	0x030D,	%g1
	fcmpes	%fcc0,	%f26,	%f8
	sdiv	%i3,	0x1F04,	%i7
	sll	%o4,	%o6,	%i6
	xorcc	%l5,	0x02F4,	%i2
	movrne	%o0,	0x350,	%i5
	ldd	[%l7 + 0x40],	%g4
	edge8l	%o3,	%o1,	%l2
	fmovdge	%icc,	%f8,	%f19
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%f16
	fandnot1	%f0,	%f16,	%f4
	alignaddrl	%g6,	%g7,	%g5
	mulscc	%g3,	0x0785,	%l4
	subccc	%i0,	%o2,	%g2
	edge16ln	%l1,	%l6,	%o7
	st	%f0,	[%l7 + 0x38]
	srlx	%l3,	0x03,	%i4
	fmovrdgz	%i1,	%f0,	%f10
	std	%f8,	[%l7 + 0x78]
	movvc	%xcc,	%l0,	%o5
	movrne	%g1,	%i7,	%o4
	fzeros	%f11
	movrgez	%i3,	%o6,	%i6
	sdivcc	%i2,	0x04B2,	%o0
	subc	%i5,	0x05C7,	%l5
	smulcc	%g4,	0x0641,	%o3
	sethi	0x123F,	%o1
	fmovscs	%xcc,	%f23,	%f0
	fmovdgu	%xcc,	%f4,	%f19
	xnor	%l2,	%g6,	%g7
	array16	%g3,	%l4,	%g5
	smul	%o2,	%i0,	%l1
	smul	%g2,	0x16E4,	%l6
	stx	%o7,	[%l7 + 0x28]
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	subcc	%o5,	0x1C0A,	%i1
	array32	%g1,	%i7,	%o4
	fmuld8ulx16	%f23,	%f22,	%f14
	udivx	%i3,	0x01D9,	%i6
	sdiv	%o6,	0x0C59,	%o0
	movg	%icc,	%i2,	%l5
	movrlez	%g4,	%o3,	%o1
	mulx	%i5,	%g6,	%g7
	fmovs	%f16,	%f7
	fexpand	%f13,	%f0
	orcc	%g3,	0x13A2,	%l4
	edge32n	%l2,	%g5,	%i0
	stw	%o2,	[%l7 + 0x60]
	array32	%l1,	%g2,	%l6
	subccc	%l3,	%i4,	%l0
	array16	%o7,	%o5,	%g1
	movle	%icc,	%i7,	%i1
	sllx	%i3,	0x15,	%i6
	fmovsne	%xcc,	%f27,	%f9
	movrlez	%o6,	%o4,	%o0
	movre	%i2,	%l5,	%g4
	save %o1, 0x0FA2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%g6,	%g7,	%g3
	andncc	%l4,	%i5,	%g5
	andncc	%i0,	%l2,	%l1
	umulcc	%g2,	0x130F,	%l6
	movrlez	%l3,	%o2,	%l0
	sll	%i4,	0x1F,	%o5
	fmuld8ulx16	%f5,	%f6,	%f22
	addcc	%g1,	%i7,	%o7
	st	%f29,	[%l7 + 0x4C]
	sdiv	%i1,	0x0087,	%i3
	udivcc	%i6,	0x1574,	%o4
	andn	%o0,	0x0E75,	%i2
	edge32ln	%l5,	%g4,	%o6
	movpos	%icc,	%o1,	%o3
	add	%g7,	%g3,	%g6
	xorcc	%i5,	%l4,	%g5
	lduh	[%l7 + 0x1A],	%l2
	ldsh	[%l7 + 0x50],	%l1
	array32	%i0,	%g2,	%l6
	ldsh	[%l7 + 0x44],	%o2
	move	%xcc,	%l0,	%l3
	movrgz	%i4,	0x01D,	%o5
	sir	0x1D2B
	fmuld8ulx16	%f2,	%f12,	%f12
	mulx	%g1,	%o7,	%i1
	fzeros	%f1
	fmovrslz	%i7,	%f5,	%f2
	udiv	%i3,	0x1240,	%o4
	add	%o0,	0x1BC5,	%i6
	edge16	%i2,	%g4,	%o6
	sir	0x107E
	stb	%o1,	[%l7 + 0x3C]
	ldsb	[%l7 + 0x0F],	%l5
	srax	%g7,	0x08,	%o3
	fmovrde	%g6,	%f12,	%f18
	alignaddrl	%g3,	%l4,	%g5
	fornot2	%f22,	%f12,	%f4
	orcc	%i5,	%l2,	%l1
	umul	%g2,	%i0,	%l6
	sra	%o2,	%l3,	%l0
	fmovsvs	%icc,	%f10,	%f11
	stb	%i4,	[%l7 + 0x0B]
	edge32ln	%g1,	%o5,	%o7
	xorcc	%i7,	%i3,	%o4
	umul	%o0,	0x157F,	%i1
	ldd	[%l7 + 0x48],	%i2
	edge8n	%g4,	%o6,	%i6
	edge16l	%l5,	%o1,	%o3
	ldsw	[%l7 + 0x6C],	%g7
	fmovrdgz	%g3,	%f14,	%f0
	andn	%g6,	%l4,	%g5
	edge32n	%l2,	%l1,	%g2
	edge32n	%i0,	%l6,	%i5
	fone	%f22
	movg	%xcc,	%l3,	%o2
	move	%xcc,	%l0,	%i4
	movg	%xcc,	%o5,	%g1
	array32	%i7,	%i3,	%o7
	sub	%o4,	%i1,	%o0
	fornot1	%f12,	%f6,	%f4
	ldd	[%l7 + 0x38],	%f18
	edge16n	%i2,	%g4,	%i6
	fandnot1	%f2,	%f26,	%f18
	addcc	%l5,	0x1328,	%o6
	alignaddr	%o3,	%g7,	%o1
	smul	%g6,	%l4,	%g5
	ldd	[%l7 + 0x38],	%f18
	fcmpeq16	%f4,	%f8,	%g3
	addc	%l2,	%g2,	%l1
	sllx	%l6,	%i5,	%i0
	fmovrslz	%l3,	%f31,	%f27
	fcmpes	%fcc0,	%f15,	%f24
	movleu	%xcc,	%l0,	%o2
	fpack32	%f12,	%f26,	%f18
	fmuld8ulx16	%f31,	%f11,	%f26
	array32	%i4,	%o5,	%g1
	umulcc	%i3,	%i7,	%o4
	lduh	[%l7 + 0x74],	%o7
	addc	%o0,	%i1,	%g4
	move	%xcc,	%i2,	%i6
	mulscc	%l5,	0x1B36,	%o3
	ldx	[%l7 + 0x10],	%g7
	ldx	[%l7 + 0x08],	%o1
	subccc	%g6,	0x1C56,	%l4
	fmovdneg	%xcc,	%f21,	%f9
	sll	%g5,	%o6,	%l2
	fsrc2s	%f17,	%f30
	movn	%xcc,	%g3,	%l1
	nop
	set	0x2A, %g6
	lduh	[%l7 + %g6],	%g2
	movrlz	%i5,	0x116,	%i0
	fmovsge	%icc,	%f15,	%f19
	umul	%l3,	0x1F10,	%l6
	andncc	%o2,	%l0,	%i4
	fornot1s	%f3,	%f30,	%f25
	fandnot2s	%f29,	%f11,	%f3
	sll	%g1,	%o5,	%i3
	fmovrdgz	%o4,	%f24,	%f18
	mova	%xcc,	%o7,	%i7
	edge16ln	%o0,	%g4,	%i2
	array8	%i1,	%l5,	%i6
	fmovdvs	%xcc,	%f30,	%f5
	umul	%g7,	%o1,	%o3
	fmovdcs	%xcc,	%f16,	%f19
	ldub	[%l7 + 0x0E],	%l4
	movge	%icc,	%g6,	%g5
	subccc	%l2,	0x1AB9,	%g3
	movgu	%xcc,	%l1,	%g2
	xnor	%i5,	0x0E2A,	%i0
	sth	%o6,	[%l7 + 0x58]
	array16	%l6,	%l3,	%l0
	andcc	%i4,	0x0903,	%o2
	fcmpgt32	%f0,	%f28,	%g1
	fmovrsne	%o5,	%f15,	%f3
	stx	%o4,	[%l7 + 0x50]
	mulx	%o7,	0x0D60,	%i7
	movre	%i3,	%g4,	%i2
	array8	%o0,	%l5,	%i1
	fmovsl	%icc,	%f8,	%f21
	andn	%g7,	0x06D5,	%i6
	fcmpd	%fcc1,	%f4,	%f12
	movle	%xcc,	%o3,	%o1
	movge	%xcc,	%l4,	%g5
	movle	%xcc,	%l2,	%g6
	srlx	%l1,	%g2,	%g3
	andncc	%i0,	%o6,	%l6
	addccc	%i5,	%l3,	%i4
	xnorcc	%l0,	%g1,	%o5
	popc	%o2,	%o4
	subccc	%o7,	%i7,	%i3
	sub	%g4,	%i2,	%l5
	fmuld8ulx16	%f7,	%f22,	%f20
	popc	0x09C2,	%i1
	array16	%o0,	%i6,	%g7
	fmovsneg	%xcc,	%f2,	%f13
	edge16n	%o3,	%o1,	%g5
	udiv	%l4,	0x1525,	%g6
	edge16n	%l1,	%g2,	%g3
	std	%f14,	[%l7 + 0x48]
	for	%f18,	%f28,	%f0
	std	%f10,	[%l7 + 0x08]
	fmovdleu	%icc,	%f16,	%f18
	andcc	%i0,	%o6,	%l2
	fpack16	%f2,	%f7
	alignaddr	%l6,	%l3,	%i5
	ldsb	[%l7 + 0x16],	%i4
	andcc	%l0,	0x092D,	%g1
	fmovde	%xcc,	%f22,	%f1
	for	%f10,	%f16,	%f20
	ldsh	[%l7 + 0x36],	%o2
	fpsub32	%f26,	%f12,	%f16
	sllx	%o5,	0x1B,	%o4
	edge32n	%o7,	%i3,	%g4
	and	%i2,	0x099F,	%i7
	andncc	%i1,	%o0,	%l5
	ldd	[%l7 + 0x30],	%f30
	edge32n	%g7,	%i6,	%o1
	umul	%g5,	0x0AAC,	%l4
	udiv	%o3,	0x1A99,	%g6
	st	%f1,	[%l7 + 0x34]
	subc	%g2,	0x1EDF,	%l1
	sdivx	%i0,	0x1559,	%o6
	array8	%g3,	%l2,	%l6
	orn	%i5,	0x0886,	%l3
	movcc	%icc,	%l0,	%g1
	edge8	%i4,	%o5,	%o4
	smulcc	%o7,	0x13EF,	%i3
	fmovd	%f16,	%f10
	fmul8x16au	%f17,	%f23,	%f6
	sub	%g4,	%i2,	%i7
	movcc	%icc,	%i1,	%o0
	fnands	%f5,	%f21,	%f19
	sethi	0x08BB,	%l5
	bshuffle	%f22,	%f6,	%f30
	array8	%o2,	%i6,	%g7
	movrne	%o1,	%g5,	%o3
	edge8	%g6,	%l4,	%l1
	sub	%i0,	%o6,	%g2
	lduw	[%l7 + 0x60],	%l2
	movrne	%l6,	%g3,	%i5
	popc	0x0B0F,	%l3
	smul	%l0,	%i4,	%g1
	ldub	[%l7 + 0x36],	%o5
	movne	%xcc,	%o7,	%i3
	subc	%o4,	%i2,	%i7
	popc	0x0D4B,	%i1
	sll	%g4,	%l5,	%o2
	subc	%o0,	0x0634,	%i6
	popc	0x06EC,	%g7
	movcc	%xcc,	%g5,	%o3
	movcs	%xcc,	%o1,	%l4
	movvs	%xcc,	%l1,	%g6
	alignaddrl	%i0,	%o6,	%l2
	fpsub32s	%f24,	%f21,	%f19
	umul	%l6,	0x11A2,	%g3
	fnegd	%f0,	%f6
	stw	%g2,	[%l7 + 0x0C]
	addccc	%l3,	%l0,	%i5
	sra	%i4,	0x05,	%g1
	add	%o7,	0x0420,	%o5
	orn	%o4,	%i3,	%i7
	mulscc	%i2,	%g4,	%i1
	fmovscc	%icc,	%f27,	%f21
	udiv	%l5,	0x1201,	%o2
	movle	%xcc,	%i6,	%o0
	array32	%g5,	%o3,	%g7
	restore %o1, 0x0D80, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%g6,	%l1
	movn	%xcc,	%i0,	%o6
	subcc	%l2,	0x1C93,	%l6
	movne	%xcc,	%g2,	%g3
	sir	0x1EEA
	ldsw	[%l7 + 0x3C],	%l3
	srl	%i5,	%l0,	%g1
	mulx	%o7,	0x0F35,	%i4
	movl	%xcc,	%o5,	%i3
	lduw	[%l7 + 0x50],	%i7
	andcc	%o4,	0x1797,	%i2
	edge32n	%g4,	%l5,	%i1
	sir	0x0357
	subcc	%i6,	%o2,	%o0
	orncc	%o3,	%g7,	%o1
	movvc	%xcc,	%l4,	%g6
	umul	%l1,	0x180C,	%g5
	movpos	%xcc,	%o6,	%l2
	umulcc	%i0,	0x1B08,	%l6
	subccc	%g2,	0x0898,	%l3
	faligndata	%f20,	%f2,	%f30
	subc	%i5,	%g3,	%l0
	movcs	%xcc,	%g1,	%o7
	fmovda	%xcc,	%f15,	%f0
	fpmerge	%f11,	%f22,	%f22
	fmovrde	%i4,	%f10,	%f28
	nop
	set	0x5A, %o0
	ldsb	[%l7 + %o0],	%o5
	mulscc	%i3,	0x05E9,	%o4
	fmovsge	%xcc,	%f11,	%f18
	xor	%i2,	%i7,	%l5
	fmovsa	%xcc,	%f2,	%f20
	lduw	[%l7 + 0x64],	%i1
	edge32ln	%g4,	%i6,	%o2
	orncc	%o3,	0x097A,	%o0
	fandnot1	%f2,	%f24,	%f2
	movgu	%icc,	%o1,	%l4
	addcc	%g7,	0x1EB5,	%g6
	udivcc	%g5,	0x0099,	%o6
	movneg	%icc,	%l1,	%i0
	edge8ln	%l6,	%l2,	%l3
	ldx	[%l7 + 0x50],	%g2
	fmuld8ulx16	%f13,	%f10,	%f0
	move	%xcc,	%g3,	%l0
	fexpand	%f9,	%f20
	fandnot2	%f10,	%f8,	%f22
	fmovsa	%icc,	%f4,	%f27
	andn	%g1,	%i5,	%i4
	movvc	%icc,	%o7,	%i3
	alignaddrl	%o5,	%o4,	%i2
	fmovsg	%icc,	%f7,	%f26
	fnegs	%f1,	%f8
	movrne	%l5,	%i1,	%g4
	fmovsne	%xcc,	%f0,	%f16
	sdivcc	%i6,	0x0BA9,	%o2
	fpack16	%f14,	%f15
	xnor	%i7,	0x014A,	%o3
	edge32l	%o1,	%l4,	%o0
	sdivx	%g7,	0x0276,	%g5
	fmovsleu	%xcc,	%f5,	%f17
	mulx	%g6,	0x0DA1,	%o6
	fnor	%f24,	%f8,	%f28
	array16	%l1,	%i0,	%l6
	movle	%xcc,	%l3,	%l2
	sll	%g3,	%l0,	%g2
	subcc	%g1,	0x14DA,	%i5
	movrlz	%o7,	0x040,	%i4
	addc	%o5,	%o4,	%i2
	edge32l	%i3,	%l5,	%g4
	popc	0x1C3D,	%i1
	sdivx	%o2,	0x12B8,	%i6
	movre	%i7,	%o3,	%l4
	movrgez	%o1,	0x07B,	%o0
	movre	%g5,	%g7,	%o6
	ldd	[%l7 + 0x40],	%l0
	orn	%i0,	0x00AF,	%l6
	alignaddrl	%g6,	%l3,	%g3
	udivx	%l2,	0x0515,	%l0
	stx	%g2,	[%l7 + 0x30]
	fxor	%f22,	%f28,	%f28
	edge16	%g1,	%o7,	%i5
	movpos	%icc,	%o5,	%i4
	edge8n	%i2,	%o4,	%l5
	stx	%g4,	[%l7 + 0x18]
	fxnor	%f24,	%f0,	%f28
	popc	0x035C,	%i3
	subc	%o2,	%i1,	%i6
	edge8n	%i7,	%l4,	%o1
	movpos	%icc,	%o0,	%o3
	subccc	%g7,	%g5,	%o6
	fmovrdgez	%l1,	%f30,	%f20
	fsrc1	%f20,	%f30
	fexpand	%f8,	%f2
	popc	0x019D,	%l6
	movleu	%icc,	%g6,	%i0
	edge16n	%g3,	%l3,	%l2
	lduh	[%l7 + 0x22],	%l0
	movpos	%xcc,	%g2,	%o7
	edge32	%g1,	%o5,	%i5
	udivcc	%i4,	0x08F0,	%o4
	udiv	%i2,	0x1FEE,	%g4
	fmovscs	%xcc,	%f22,	%f5
	movvs	%icc,	%l5,	%o2
	ldsw	[%l7 + 0x54],	%i3
	ldd	[%l7 + 0x68],	%i0
	array8	%i7,	%i6,	%o1
	andcc	%o0,	%o3,	%g7
	movvc	%icc,	%g5,	%o6
	nop
	set	0x0C, %i3
	stw	%l1,	[%l7 + %i3]
	movgu	%xcc,	%l6,	%l4
	stw	%g6,	[%l7 + 0x4C]
	fcmple32	%f30,	%f26,	%g3
	fpackfix	%f10,	%f31
	mulx	%i0,	0x1210,	%l2
	addc	%l3,	%l0,	%o7
	movpos	%xcc,	%g1,	%g2
	ldsh	[%l7 + 0x50],	%o5
	andn	%i5,	0x125F,	%i4
	andncc	%i2,	%o4,	%g4
	fmovsvs	%icc,	%f24,	%f21
	srax	%o2,	0x1A,	%i3
	fmovsa	%icc,	%f2,	%f25
	array8	%l5,	%i1,	%i6
	srl	%i7,	0x1B,	%o1
	movrlz	%o3,	0x221,	%g7
	array16	%g5,	%o6,	%l1
	alignaddr	%l6,	%l4,	%g6
	movgu	%xcc,	%o0,	%i0
	movvs	%xcc,	%l2,	%l3
	smul	%g3,	%o7,	%g1
	movgu	%icc,	%l0,	%o5
	fmovrse	%g2,	%f21,	%f14
	sra	%i4,	%i2,	%i5
	sub	%g4,	0x0133,	%o4
	sdivx	%o2,	0x09F8,	%l5
	udivx	%i3,	0x08D0,	%i6
	edge8ln	%i7,	%o1,	%i1
	fnegd	%f2,	%f26
	movne	%icc,	%g7,	%g5
	sra	%o3,	%l1,	%o6
	edge32ln	%l6,	%g6,	%o0
	ld	[%l7 + 0x58],	%f11
	movg	%xcc,	%l4,	%i0
	srlx	%l3,	0x15,	%l2
	xor	%o7,	0x08AE,	%g1
	edge16ln	%g3,	%o5,	%l0
	fmovsvc	%icc,	%f1,	%f28
	fmovdvs	%icc,	%f21,	%f14
	sra	%g2,	%i4,	%i5
	lduh	[%l7 + 0x4A],	%g4
	addccc	%o4,	%o2,	%i2
	edge32ln	%l5,	%i3,	%i6
	array8	%o1,	%i7,	%i1
	edge8n	%g5,	%o3,	%g7
	sdivx	%o6,	0x0424,	%l1
	movrlz	%l6,	0x0F4,	%o0
	fmovdl	%xcc,	%f0,	%f30
	xnor	%g6,	0x115A,	%i0
	edge8n	%l4,	%l2,	%o7
	fcmple16	%f4,	%f30,	%g1
	edge16l	%l3,	%g3,	%l0
	sra	%g2,	%o5,	%i4
	orcc	%g4,	0x1DAB,	%o4
	st	%f17,	[%l7 + 0x50]
	movrlez	%o2,	0x2B8,	%i5
	fone	%f22
	movre	%i2,	0x169,	%l5
	movn	%xcc,	%i3,	%o1
	nop
	set	0x18, %g7
	ldsw	[%l7 + %g7],	%i7
	stb	%i1,	[%l7 + 0x5B]
	sub	%g5,	%o3,	%g7
	array32	%i6,	%l1,	%l6
	orncc	%o0,	0x1DAB,	%g6
	addcc	%o6,	%i0,	%l2
	fmovdcs	%icc,	%f12,	%f15
	fcmped	%fcc3,	%f6,	%f20
	orcc	%l4,	0x062B,	%g1
	lduw	[%l7 + 0x14],	%o7
	nop
	set	0x1A, %o3
	ldsb	[%l7 + %o3],	%g3
	edge32l	%l3,	%g2,	%o5
	alignaddrl	%l0,	%i4,	%g4
	lduw	[%l7 + 0x20],	%o4
	array16	%i5,	%o2,	%l5
	lduh	[%l7 + 0x26],	%i2
	andncc	%i3,	%i7,	%o1
	xorcc	%i1,	%g5,	%g7
	save %i6, 0x1D5F, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l6,	0x1508,	%o3
	array8	%g6,	%o6,	%i0
	fmovdg	%icc,	%f13,	%f21
	xorcc	%l2,	%l4,	%g1
	alignaddrl	%o0,	%o7,	%g3
	add	%g2,	0x1AC2,	%l3
	fcmpeq16	%f10,	%f10,	%l0
	stb	%o5,	[%l7 + 0x10]
	fone	%f20
	movrgez	%i4,	0x08D,	%o4
	xnorcc	%g4,	0x05AF,	%i5
	subccc	%l5,	0x1886,	%i2
	movrlez	%o2,	%i7,	%o1
	smulcc	%i3,	0x0C0C,	%i1
	orcc	%g7,	%i6,	%g5
	orcc	%l6,	0x1519,	%o3
	movvc	%xcc,	%g6,	%l1
	mulscc	%o6,	0x0137,	%i0
	ldsw	[%l7 + 0x58],	%l4
	edge32n	%l2,	%o0,	%g1
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	edge8	%l0,	%o5,	%l3
	for	%f28,	%f2,	%f22
	st	%f2,	[%l7 + 0x5C]
	fmovse	%xcc,	%f13,	%f20
	subcc	%o4,	0x09AB,	%g4
	fmovdle	%icc,	%f20,	%f1
	orncc	%i4,	%i5,	%i2
	save %o2, %l5, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %o1, %i1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f9,	%f16,	%f6
	fandnot2	%f8,	%f12,	%f24
	addc	%i6,	%g5,	%i3
	movvs	%icc,	%l6,	%g6
	subcc	%l1,	%o6,	%i0
	fnors	%f27,	%f26,	%f25
	stb	%l4,	[%l7 + 0x5E]
	orcc	%l2,	0x09CE,	%o3
	sth	%g1,	[%l7 + 0x6C]
	andncc	%o0,	%g2,	%o7
	movle	%xcc,	%l0,	%g3
	array16	%o5,	%o4,	%l3
	umul	%i4,	%g4,	%i5
	fandnot2	%f12,	%f14,	%f4
	fmovrse	%o2,	%f8,	%f5
	sdivx	%i2,	0x0B69,	%l5
	st	%f31,	[%l7 + 0x5C]
	movrne	%o1,	0x30B,	%i1
	addccc	%g7,	%i7,	%i6
	srax	%i3,	%l6,	%g5
	smul	%g6,	0x0AF1,	%l1
	lduw	[%l7 + 0x74],	%o6
	alignaddr	%l4,	%i0,	%o3
	stw	%l2,	[%l7 + 0x38]
	addccc	%o0,	0x15B7,	%g1
	orn	%g2,	0x0389,	%o7
	siam	0x3
	fcmpne16	%f22,	%f0,	%l0
	ldd	[%l7 + 0x28],	%f10
	movne	%icc,	%g3,	%o5
	sth	%o4,	[%l7 + 0x5C]
	udiv	%l3,	0x0A67,	%g4
	fxors	%f19,	%f27,	%f28
	move	%xcc,	%i5,	%o2
	edge16l	%i4,	%l5,	%i2
	fmovsvs	%xcc,	%f30,	%f9
	movl	%icc,	%i1,	%o1
	ld	[%l7 + 0x2C],	%f8
	sdiv	%g7,	0x02D7,	%i7
	ldd	[%l7 + 0x38],	%i2
	addc	%i6,	%g5,	%l6
	addcc	%g6,	0x1313,	%l1
	orcc	%l4,	0x19FD,	%i0
	xnorcc	%o6,	0x0EEE,	%o3
	movne	%icc,	%o0,	%l2
	fcmps	%fcc1,	%f6,	%f31
	alignaddr	%g1,	%g2,	%l0
	fmovsg	%icc,	%f1,	%f26
	movgu	%xcc,	%o7,	%o5
	fabss	%f14,	%f8
	edge32n	%o4,	%l3,	%g3
	sir	0x10F3
	sllx	%g4,	%o2,	%i4
	fmovdvs	%xcc,	%f29,	%f18
	fmovsneg	%icc,	%f28,	%f4
	udivx	%l5,	0x01DD,	%i5
	andncc	%i2,	%o1,	%g7
	fmuld8ulx16	%f23,	%f12,	%f2
	sub	%i7,	0x183C,	%i1
	edge8l	%i6,	%g5,	%l6
	movge	%xcc,	%i3,	%l1
	xnor	%l4,	%i0,	%g6
	sth	%o6,	[%l7 + 0x24]
	sethi	0x0803,	%o3
	edge8n	%o0,	%g1,	%l2
	edge8	%l0,	%g2,	%o5
	stw	%o7,	[%l7 + 0x34]
	lduh	[%l7 + 0x24],	%l3
	movre	%o4,	0x08C,	%g3
	movle	%xcc,	%o2,	%g4
	fpmerge	%f7,	%f23,	%f30
	ldsb	[%l7 + 0x3E],	%i4
	fmovdl	%xcc,	%f13,	%f8
	fandnot1	%f8,	%f6,	%f4
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	udivcc	%g7,	0x1484,	%i2
	fnors	%f14,	%f29,	%f27
	ldx	[%l7 + 0x38],	%i1
	xor	%i6,	0x15D4,	%g5
	xnorcc	%i7,	0x1646,	%i3
	nop
	set	0x20, %o4
	stx	%l6,	[%l7 + %o4]
	sdivx	%l4,	0x15BE,	%i0
	sdivcc	%l1,	0x0F95,	%o6
	fmovdne	%xcc,	%f19,	%f20
	fmovdneg	%xcc,	%f2,	%f25
	addcc	%o3,	0x19B4,	%g6
	std	%f4,	[%l7 + 0x18]
	edge32ln	%g1,	%l2,	%l0
	movle	%xcc,	%o0,	%o5
	fsrc1s	%f5,	%f7
	sth	%g2,	[%l7 + 0x0E]
	srax	%l3,	%o4,	%o7
	st	%f26,	[%l7 + 0x34]
	xorcc	%g3,	%g4,	%i4
	mova	%xcc,	%l5,	%o2
	alignaddr	%i5,	%g7,	%i2
	fxor	%f4,	%f20,	%f4
	andn	%o1,	0x036B,	%i6
	udiv	%i1,	0x09B1,	%i7
	fnot1s	%f21,	%f10
	st	%f26,	[%l7 + 0x0C]
	add	%g5,	0x160F,	%i3
	fands	%f15,	%f22,	%f21
	edge32l	%l4,	%l6,	%i0
	edge8	%o6,	%o3,	%g6
	fmovrslz	%l1,	%f5,	%f21
	sethi	0x0BB4,	%l2
	array32	%g1,	%o0,	%l0
	movgu	%icc,	%o5,	%g2
	array8	%o4,	%o7,	%l3
	movge	%icc,	%g3,	%i4
	movge	%icc,	%l5,	%o2
	edge32	%g4,	%i5,	%i2
	stw	%g7,	[%l7 + 0x70]
	and	%o1,	%i6,	%i7
	edge32l	%g5,	%i3,	%i1
	ldd	[%l7 + 0x48],	%f26
	srl	%l6,	0x13,	%l4
	alignaddrl	%o6,	%o3,	%i0
	edge16l	%g6,	%l1,	%l2
	stb	%o0,	[%l7 + 0x20]
	ldd	[%l7 + 0x58],	%g0
	fmovsvs	%icc,	%f13,	%f26
	restore %l0, 0x06CD, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g2,	%o7,	%l3
	edge16n	%g3,	%i4,	%l5
	subcc	%o2,	0x0BB2,	%o4
	edge32	%i5,	%i2,	%g7
	st	%f28,	[%l7 + 0x48]
	udivcc	%o1,	0x1121,	%i6
	and	%g4,	%i7,	%i3
	stx	%g5,	[%l7 + 0x38]
	alignaddrl	%i1,	%l4,	%o6
	addcc	%o3,	0x1D63,	%i0
	movn	%xcc,	%l6,	%g6
	movneg	%icc,	%l2,	%o0
	fmovsgu	%xcc,	%f15,	%f9
	srl	%l1,	0x1B,	%g1
	sdivcc	%l0,	0x04AD,	%g2
	lduh	[%l7 + 0x48],	%o5
	fmovrslz	%l3,	%f24,	%f27
	ldd	[%l7 + 0x08],	%g2
	mova	%icc,	%o7,	%i4
	edge16ln	%l5,	%o4,	%o2
	subc	%i2,	%g7,	%i5
	fmovsvs	%xcc,	%f28,	%f4
	lduh	[%l7 + 0x56],	%i6
	ldx	[%l7 + 0x08],	%o1
	fmovdvs	%icc,	%f29,	%f16
	mulscc	%i7,	%g4,	%i3
	umul	%i1,	0x118F,	%l4
	fmovscc	%xcc,	%f9,	%f0
	fmovsge	%xcc,	%f21,	%f29
	edge16n	%g5,	%o3,	%o6
	movrne	%i0,	0x0C6,	%l6
	popc	%g6,	%l2
	movrne	%o0,	%l1,	%l0
	bshuffle	%f30,	%f14,	%f0
	ldx	[%l7 + 0x48],	%g1
	udivcc	%g2,	0x083F,	%o5
	sdiv	%g3,	0x179F,	%l3
	sdivx	%o7,	0x002E,	%i4
	ld	[%l7 + 0x0C],	%f1
	umul	%o4,	0x0BEB,	%o2
	mulscc	%i2,	0x126F,	%l5
	movl	%icc,	%g7,	%i5
	edge8ln	%i6,	%i7,	%g4
	movrne	%o1,	0x1F4,	%i3
	fpack16	%f10,	%f2
	edge32ln	%i1,	%g5,	%l4
	movvs	%icc,	%o3,	%o6
	movgu	%icc,	%l6,	%i0
	st	%f2,	[%l7 + 0x18]
	st	%f6,	[%l7 + 0x14]
	movl	%xcc,	%l2,	%o0
	fmovsvc	%xcc,	%f9,	%f11
	stb	%l1,	[%l7 + 0x67]
	fornot2	%f22,	%f10,	%f16
	alignaddrl	%l0,	%g6,	%g2
	subcc	%g1,	0x1602,	%o5
	sll	%g3,	%l3,	%i4
	movn	%icc,	%o7,	%o4
	sethi	0x01DE,	%i2
	andcc	%o2,	%g7,	%i5
	or	%i6,	0x1E04,	%l5
	sub	%g4,	0x08A6,	%o1
	subc	%i3,	%i1,	%i7
	movvs	%icc,	%l4,	%o3
	udivcc	%g5,	0x030A,	%l6
	xorcc	%o6,	0x1773,	%l2
	movl	%xcc,	%i0,	%o0
	edge16	%l1,	%l0,	%g2
	edge16	%g6,	%g1,	%o5
	save %l3, 0x197C, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g3,	%o4,	%i2
	array8	%o2,	%o7,	%g7
	edge16l	%i5,	%l5,	%i6
	fmuld8sux16	%f12,	%f24,	%f0
	edge16l	%g4,	%o1,	%i1
	xorcc	%i7,	%i3,	%o3
	add	%g5,	0x1C0E,	%l6
	udiv	%o6,	0x15DB,	%l2
	movrlz	%l4,	%o0,	%l1
	movge	%xcc,	%i0,	%l0
	edge16n	%g6,	%g2,	%o5
	andn	%l3,	0x00E6,	%i4
	fandnot1	%f14,	%f14,	%f20
	fpsub16s	%f28,	%f1,	%f7
	movn	%icc,	%g3,	%g1
	smulcc	%o4,	0x093E,	%o2
	xnor	%o7,	0x1F6F,	%g7
	popc	%i2,	%i5
	ldsh	[%l7 + 0x68],	%l5
	sth	%g4,	[%l7 + 0x32]
	sth	%o1,	[%l7 + 0x50]
	and	%i1,	0x0130,	%i6
	ldsh	[%l7 + 0x2A],	%i3
	addccc	%o3,	0x14BD,	%g5
	fmovdge	%icc,	%f0,	%f7
	addccc	%l6,	%o6,	%i7
	fand	%f22,	%f12,	%f0
	bshuffle	%f8,	%f30,	%f24
	st	%f1,	[%l7 + 0x20]
	sll	%l2,	0x07,	%l4
	ldx	[%l7 + 0x48],	%o0
	umulcc	%l1,	%l0,	%i0
	movleu	%xcc,	%g6,	%o5
	stb	%g2,	[%l7 + 0x3C]
	mova	%icc,	%l3,	%g3
	fmovdgu	%xcc,	%f11,	%f30
	sllx	%i4,	%o4,	%o2
	mulx	%o7,	%g1,	%i2
	edge8n	%i5,	%g7,	%g4
	save %o1, 0x0A54, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i6,	%i1,	%o3
	andcc	%g5,	%i3,	%l6
	sub	%o6,	%i7,	%l2
	alignaddr	%l4,	%o0,	%l0
	fmovsne	%icc,	%f14,	%f30
	fmovdpos	%icc,	%f2,	%f27
	umulcc	%l1,	%i0,	%o5
	movvc	%xcc,	%g6,	%l3
	sdivx	%g3,	0x1D58,	%i4
	ldsw	[%l7 + 0x58],	%g2
	mulscc	%o2,	%o4,	%g1
	sethi	0x0F57,	%o7
	fnor	%f20,	%f2,	%f14
	sth	%i5,	[%l7 + 0x56]
	movg	%xcc,	%i2,	%g7
	edge8l	%g4,	%o1,	%l5
	fmovdvs	%xcc,	%f29,	%f9
	ldd	[%l7 + 0x40],	%i0
	fmovsleu	%xcc,	%f14,	%f20
	fxnor	%f16,	%f0,	%f6
	nop
	set	0x7A, %i1
	sth	%i6,	[%l7 + %i1]
	umulcc	%g5,	%o3,	%i3
	edge32ln	%o6,	%l6,	%l2
	ldx	[%l7 + 0x18],	%i7
	sdivcc	%l4,	0x0FC1,	%o0
	sth	%l1,	[%l7 + 0x4C]
	edge16	%i0,	%o5,	%l0
	fmovscs	%xcc,	%f15,	%f11
	movl	%xcc,	%g6,	%l3
	edge8	%g3,	%g2,	%o2
	orn	%o4,	0x0353,	%g1
	sdivx	%o7,	0x1E96,	%i4
	movrlez	%i2,	%i5,	%g4
	srl	%o1,	%g7,	%l5
	add	%i1,	%i6,	%g5
	edge32	%i3,	%o6,	%l6
	movrlz	%l2,	0x1EF,	%i7
	xnorcc	%l4,	0x176D,	%o3
	subc	%o0,	%i0,	%o5
	fmovrdlez	%l0,	%f28,	%f2
	fnot2s	%f1,	%f7
	stb	%l1,	[%l7 + 0x64]
	ld	[%l7 + 0x40],	%f7
	save %l3, 0x08AD, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x30],	%g6
	umulcc	%o2,	%g2,	%g1
	fmovsneg	%icc,	%f3,	%f25
	sra	%o7,	0x1F,	%o4
	fcmpne16	%f14,	%f8,	%i4
	subccc	%i5,	0x1B21,	%i2
	ldsb	[%l7 + 0x43],	%g4
	movne	%icc,	%g7,	%l5
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	fornot1s	%f30,	%f20,	%f8
	sra	%g5,	%o1,	%i3
	movleu	%xcc,	%l6,	%o6
	edge8	%l2,	%l4,	%o3
	subc	%o0,	0x0188,	%i0
	fpsub32	%f8,	%f4,	%f4
	movrgz	%o5,	%i7,	%l0
	edge32ln	%l3,	%g3,	%g6
	sdivx	%o2,	0x14D1,	%l1
	mova	%icc,	%g1,	%o7
	fnors	%f20,	%f18,	%f24
	stw	%o4,	[%l7 + 0x60]
	umulcc	%g2,	%i5,	%i2
	ld	[%l7 + 0x10],	%f7
	fmovdn	%xcc,	%f21,	%f21
	lduh	[%l7 + 0x22],	%g4
	fnot2	%f22,	%f20
	subc	%i4,	0x1E3D,	%g7
	sdiv	%l5,	0x136E,	%i6
	movg	%icc,	%i1,	%g5
	sethi	0x0A61,	%i3
	save %o1, %o6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%l4,	%l6
	andncc	%o0,	%o3,	%o5
	array32	%i7,	%l0,	%l3
	xnorcc	%g3,	0x1C67,	%g6
	fnor	%f2,	%f26,	%f24
	subcc	%i0,	%o2,	%g1
	movge	%icc,	%l1,	%o4
	mova	%xcc,	%o7,	%i5
	orn	%g2,	%g4,	%i4
	array32	%g7,	%i2,	%l5
	mulx	%i6,	0x1EDE,	%g5
	smul	%i3,	0x1398,	%i1
	fone	%f4
	edge32ln	%o1,	%l2,	%o6
	fmovscc	%xcc,	%f5,	%f4
	movcs	%xcc,	%l4,	%o0
	movvs	%xcc,	%l6,	%o5
	stx	%o3,	[%l7 + 0x10]
	xor	%i7,	0x118E,	%l0
	udiv	%g3,	0x1A84,	%g6
	orn	%i0,	%o2,	%g1
	movrgz	%l1,	0x019,	%l3
	fnot1s	%f23,	%f20
	fandnot2	%f30,	%f24,	%f18
	smul	%o4,	%o7,	%g2
	fmovsn	%xcc,	%f3,	%f27
	fmovrslez	%i5,	%f4,	%f22
	fxors	%f2,	%f29,	%f16
	edge16l	%g4,	%g7,	%i2
	subcc	%i4,	%i6,	%g5
	fpack16	%f4,	%f28
	smulcc	%l5,	%i3,	%o1
	xnorcc	%l2,	%o6,	%l4
	ldsw	[%l7 + 0x6C],	%o0
	fmuld8sux16	%f1,	%f0,	%f22
	movneg	%xcc,	%i1,	%l6
	sdivx	%o3,	0x1BAA,	%o5
	edge8	%i7,	%g3,	%g6
	fmovsneg	%icc,	%f7,	%f3
	array32	%l0,	%o2,	%i0
	movne	%xcc,	%l1,	%l3
	movrgez	%g1,	%o4,	%o7
	umulcc	%i5,	%g4,	%g2
	movne	%xcc,	%g7,	%i4
	andncc	%i6,	%g5,	%i2
	andcc	%l5,	%o1,	%l2
	movl	%xcc,	%i3,	%l4
	fmuld8sux16	%f0,	%f25,	%f8
	fsrc1	%f4,	%f2
	popc	%o6,	%o0
	movrgez	%l6,	0x2BD,	%i1
	edge32n	%o5,	%i7,	%o3
	srl	%g6,	%l0,	%o2
	udivx	%g3,	0x17D8,	%i0
	move	%icc,	%l3,	%g1
	fcmple16	%f26,	%f22,	%l1
	movrlez	%o4,	0x107,	%o7
	movleu	%xcc,	%g4,	%i5
	array32	%g2,	%i4,	%i6
	fcmps	%fcc3,	%f27,	%f23
	fandnot1	%f28,	%f24,	%f0
	movcs	%xcc,	%g5,	%g7
	movne	%xcc,	%l5,	%o1
	orncc	%i2,	0x03E8,	%l2
	mulscc	%i3,	0x0A45,	%o6
	or	%l4,	%l6,	%i1
	fmovdge	%xcc,	%f17,	%f4
	pdist	%f20,	%f18,	%f22
	addcc	%o5,	0x05D7,	%o0
	udivx	%o3,	0x11FD,	%g6
	st	%f19,	[%l7 + 0x18]
	array32	%l0,	%i7,	%g3
	umul	%o2,	%l3,	%i0
	ldsw	[%l7 + 0x64],	%g1
	fmovrdlz	%o4,	%f12,	%f8
	fpsub16	%f14,	%f0,	%f18
	srlx	%l1,	0x13,	%o7
	umulcc	%g4,	0x0ACC,	%i5
	orncc	%g2,	%i4,	%i6
	fmuld8sux16	%f22,	%f0,	%f8
	fand	%f2,	%f30,	%f6
	movre	%g7,	%l5,	%o1
	edge16n	%i2,	%l2,	%i3
	orcc	%g5,	0x1443,	%o6
	srlx	%l4,	0x06,	%i1
	fmovdvc	%xcc,	%f28,	%f9
	ldsb	[%l7 + 0x7C],	%o5
	alignaddrl	%l6,	%o0,	%o3
	array32	%g6,	%l0,	%g3
	umul	%o2,	%i7,	%i0
	edge32l	%g1,	%l3,	%o4
	andncc	%o7,	%g4,	%i5
	sdivcc	%l1,	0x13D2,	%g2
	move	%icc,	%i6,	%i4
	movcs	%xcc,	%l5,	%o1
	fmovrdgz	%i2,	%f0,	%f14
	nop
	set	0x20, %i5
	ldub	[%l7 + %i5],	%g7
	ldx	[%l7 + 0x70],	%i3
	array32	%l2,	%g5,	%o6
	sll	%l4,	%o5,	%i1
	mulscc	%o0,	%o3,	%l6
	srlx	%g6,	0x0C,	%l0
	movvc	%icc,	%o2,	%g3
	subcc	%i7,	0x0199,	%i0
	sethi	0x103B,	%g1
	movgu	%icc,	%o4,	%o7
	movgu	%icc,	%g4,	%i5
	ld	[%l7 + 0x34],	%f12
	alignaddrl	%l1,	%l3,	%g2
	fmovrsne	%i4,	%f14,	%f15
	sdivcc	%i6,	0x097B,	%l5
	fsrc1s	%f6,	%f9
	sdivcc	%i2,	0x0A29,	%g7
	edge8ln	%o1,	%i3,	%l2
	smulcc	%g5,	0x002B,	%l4
	smul	%o6,	%o5,	%o0
	movvc	%xcc,	%o3,	%i1
	stb	%g6,	[%l7 + 0x1C]
	nop
	set	0x54, %g1
	ldsw	[%l7 + %g1],	%l6
	srlx	%o2,	0x1F,	%g3
	siam	0x2
	fmovdg	%icc,	%f29,	%f30
	sdiv	%i7,	0x1E28,	%i0
	movrgez	%g1,	0x384,	%o4
	sth	%l0,	[%l7 + 0x5E]
	movge	%icc,	%o7,	%i5
	orncc	%l1,	%l3,	%g4
	alignaddrl	%i4,	%g2,	%l5
	alignaddrl	%i2,	%i6,	%g7
	edge16ln	%o1,	%i3,	%g5
	alignaddr	%l4,	%l2,	%o6
	fsrc2s	%f21,	%f22
	movle	%icc,	%o0,	%o3
	subc	%i1,	0x123C,	%o5
	movl	%xcc,	%g6,	%o2
	movl	%xcc,	%l6,	%i7
	ld	[%l7 + 0x24],	%f11
	nop
	set	0x72, %g3
	ldsh	[%l7 + %g3],	%i0
	fcmpes	%fcc0,	%f16,	%f17
	movg	%xcc,	%g1,	%o4
	ld	[%l7 + 0x18],	%f16
	edge16ln	%g3,	%o7,	%l0
	sdiv	%l1,	0x0802,	%l3
	subc	%i5,	%i4,	%g4
	xor	%g2,	%i2,	%i6
	edge32l	%l5,	%g7,	%o1
	add	%g5,	%i3,	%l2
	orncc	%o6,	%o0,	%l4
	sub	%o3,	%o5,	%i1
	movn	%icc,	%o2,	%g6
	fornot1	%f14,	%f16,	%f0
	movre	%i7,	0x139,	%l6
	sethi	0x0D48,	%i0
	movre	%o4,	%g3,	%g1
	std	%f30,	[%l7 + 0x20]
	sethi	0x0D42,	%o7
	std	%f22,	[%l7 + 0x20]
	edge32n	%l0,	%l3,	%i5
	lduw	[%l7 + 0x08],	%i4
	movleu	%xcc,	%g4,	%l1
	fandnot2	%f18,	%f12,	%f0
	ldd	[%l7 + 0x78],	%i2
	fmovsneg	%xcc,	%f21,	%f2
	addc	%i6,	%l5,	%g7
	ldsh	[%l7 + 0x60],	%g2
	fmovdne	%xcc,	%f18,	%f9
	stb	%o1,	[%l7 + 0x46]
	edge16n	%i3,	%g5,	%l2
	movneg	%icc,	%o6,	%o0
	movrgz	%l4,	0x2B4,	%o5
	restore %o3, 0x1F2C, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g6,	%i7,	%l6
	array32	%i1,	%i0,	%g3
	ldd	[%l7 + 0x20],	%o4
	lduh	[%l7 + 0x22],	%g1
	sub	%o7,	%l3,	%l0
	orncc	%i4,	0x15E3,	%g4
	stx	%i5,	[%l7 + 0x08]
	movneg	%xcc,	%l1,	%i6
	ldsb	[%l7 + 0x42],	%i2
	ldub	[%l7 + 0x1C],	%g7
	movl	%xcc,	%g2,	%o1
	edge16	%l5,	%i3,	%g5
	sdiv	%l2,	0x1631,	%o0
	fpadd16	%f6,	%f8,	%f4
	fxor	%f18,	%f24,	%f16
	fmovdgu	%icc,	%f28,	%f22
	fmovrdlez	%o6,	%f30,	%f2
	movn	%icc,	%o5,	%l4
	sdiv	%o2,	0x197B,	%g6
	andn	%o3,	%l6,	%i7
	fnegd	%f2,	%f28
	edge8	%i1,	%i0,	%g3
	srl	%o4,	%o7,	%l3
	sir	0x03A2
	addc	%g1,	0x1C4F,	%i4
	xnor	%l0,	0x0223,	%g4
	fmovsl	%xcc,	%f29,	%f15
	lduh	[%l7 + 0x7C],	%i5
	addc	%i6,	%l1,	%i2
	std	%f14,	[%l7 + 0x50]
	ldx	[%l7 + 0x48],	%g2
	edge8	%o1,	%g7,	%i3
	movcc	%xcc,	%g5,	%l2
	addccc	%o0,	%o6,	%l5
	fmovdne	%icc,	%f27,	%f1
	lduw	[%l7 + 0x08],	%o5
	lduw	[%l7 + 0x0C],	%o2
	ldsw	[%l7 + 0x50],	%l4
	movrne	%g6,	%l6,	%i7
	movrgz	%i1,	%o3,	%g3
	fsrc2s	%f29,	%f17
	umulcc	%i0,	%o4,	%o7
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	edge8ln	%i4,	%i5,	%g4
	nop
	set	0x50, %l5
	lduw	[%l7 + %l5],	%l1
	restore %i2, %i6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%icc,	%f1,	%f5
	fnegd	%f10,	%f20
	nop
	set	0x34, %l1
	ldsh	[%l7 + %l1],	%g7
	fmovs	%f30,	%f15
	alignaddr	%g2,	%g5,	%l2
	ldd	[%l7 + 0x20],	%f24
	movne	%icc,	%o0,	%i3
	edge32n	%l5,	%o6,	%o2
	ldsb	[%l7 + 0x62],	%o5
	fsrc2s	%f8,	%f16
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	subc	%i1,	0x0DCC,	%i7
	addcc	%g3,	0x0723,	%i0
	xnorcc	%o3,	%o4,	%g1
	movleu	%icc,	%o7,	%l0
	xorcc	%l3,	0x1792,	%i4
	fmovdcs	%xcc,	%f2,	%f23
	ldsb	[%l7 + 0x5D],	%i5
	mova	%icc,	%g4,	%l1
	fcmpes	%fcc3,	%f12,	%f13
	fandnot1s	%f28,	%f0,	%f8
	smul	%i6,	0x1ED3,	%i2
	sdivcc	%o1,	0x14F9,	%g7
	sethi	0x0E53,	%g5
	subccc	%l2,	%o0,	%i3
	alignaddrl	%g2,	%o6,	%o2
	edge8ln	%o5,	%l5,	%l4
	edge8l	%l6,	%g6,	%i7
	edge16ln	%i1,	%g3,	%i0
	sethi	0x0C75,	%o3
	and	%o4,	%o7,	%l0
	fnot1s	%f17,	%f11
	fmovdvs	%icc,	%f19,	%f28
	movn	%xcc,	%l3,	%g1
	movvs	%icc,	%i4,	%g4
	xor	%l1,	0x1D46,	%i6
	xnorcc	%i2,	0x044A,	%o1
	subccc	%i5,	%g5,	%g7
	restore %o0, 0x1D5B, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f18,	%f12,	%f18
	xor	%i3,	%g2,	%o6
	srax	%o2,	%l5,	%l4
	movrgz	%l6,	0x086,	%g6
	fmovscc	%xcc,	%f14,	%f26
	orncc	%i7,	%o5,	%g3
	srlx	%i1,	0x1C,	%i0
	edge16n	%o4,	%o7,	%o3
	sdiv	%l0,	0x12AC,	%l3
	orncc	%i4,	%g1,	%l1
	subccc	%g4,	0x14E7,	%i6
	xor	%o1,	%i5,	%i2
	sir	0x1B0F
	sth	%g5,	[%l7 + 0x08]
	sth	%g7,	[%l7 + 0x4E]
	array32	%o0,	%l2,	%g2
	ldd	[%l7 + 0x08],	%o6
	fmovdcs	%icc,	%f29,	%f14
	mulscc	%o2,	0x176B,	%l5
	edge32n	%i3,	%l6,	%g6
	umulcc	%l4,	0x13E1,	%i7
	ldub	[%l7 + 0x6B],	%o5
	fmovsge	%icc,	%f22,	%f2
	movrlz	%g3,	0x144,	%i1
	movcc	%icc,	%i0,	%o7
	xnor	%o4,	0x18ED,	%l0
	std	%f4,	[%l7 + 0x10]
	ld	[%l7 + 0x28],	%f13
	edge8	%o3,	%i4,	%g1
	alignaddrl	%l3,	%l1,	%g4
	edge32	%o1,	%i6,	%i5
	array8	%i2,	%g7,	%o0
	edge32ln	%l2,	%g5,	%g2
	fmovse	%xcc,	%f26,	%f24
	alignaddr	%o6,	%o2,	%l5
	movl	%icc,	%l6,	%g6
	movcc	%icc,	%i3,	%l4
	movneg	%icc,	%o5,	%i7
	fpsub16s	%f16,	%f5,	%f30
	addc	%i1,	%i0,	%o7
	ldx	[%l7 + 0x48],	%g3
	movg	%icc,	%l0,	%o3
	edge16	%i4,	%o4,	%g1
	ldsw	[%l7 + 0x58],	%l3
	movrne	%g4,	0x1EA,	%o1
	alignaddrl	%l1,	%i5,	%i6
	sra	%g7,	0x07,	%o0
	edge16	%i2,	%g5,	%g2
	addcc	%o6,	%l2,	%o2
	ldsb	[%l7 + 0x36],	%l5
	nop
	set	0x39, %o6
	ldsb	[%l7 + %o6],	%l6
	edge16	%g6,	%i3,	%o5
	sub	%l4,	%i1,	%i0
	lduw	[%l7 + 0x1C],	%i7
	movle	%icc,	%g3,	%o7
	stb	%o3,	[%l7 + 0x67]
	fmuld8sux16	%f27,	%f12,	%f18
	edge16ln	%i4,	%l0,	%o4
	fand	%f26,	%f18,	%f0
	movrgz	%g1,	%l3,	%g4
	xnor	%o1,	%i5,	%i6
	movn	%xcc,	%g7,	%l1
	movcs	%icc,	%i2,	%o0
	sub	%g2,	0x0FA5,	%o6
	ldsw	[%l7 + 0x50],	%l2
	andn	%o2,	%l5,	%l6
	sra	%g5,	0x12,	%i3
	andncc	%o5,	%l4,	%g6
	movl	%xcc,	%i0,	%i1
	sth	%i7,	[%l7 + 0x7E]
	edge8n	%o7,	%o3,	%g3
	movcc	%icc,	%i4,	%l0
	movgu	%icc,	%g1,	%o4
	movn	%icc,	%l3,	%g4
	save %o1, 0x0EAB, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f0,	%f31
	fcmple16	%f22,	%f4,	%g7
	sub	%l1,	0x0048,	%i2
	edge8	%i5,	%o0,	%o6
	movrlz	%g2,	%o2,	%l2
	ldsw	[%l7 + 0x3C],	%l5
	and	%l6,	%g5,	%o5
	orn	%i3,	0x1ABE,	%l4
	ldd	[%l7 + 0x20],	%f4
	lduw	[%l7 + 0x2C],	%i0
	sub	%i1,	0x090A,	%i7
	andncc	%g6,	%o7,	%g3
	save %o3, 0x1DAB, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g1,	%l0,	%o4
	movre	%l3,	0x1B4,	%g4
	movle	%icc,	%o1,	%i6
	umulcc	%l1,	%i2,	%i5
	fmovdvc	%xcc,	%f11,	%f14
	srlx	%g7,	0x0E,	%o6
	srax	%g2,	%o0,	%o2
	movpos	%xcc,	%l5,	%l2
	srlx	%l6,	0x15,	%o5
	fxnors	%f5,	%f17,	%f17
	edge32	%g5,	%l4,	%i3
	fcmple32	%f18,	%f6,	%i1
	smul	%i0,	0x1ED9,	%i7
	sdivx	%o7,	0x1FF1,	%g6
	fmovscs	%xcc,	%f25,	%f2
	subc	%o3,	%i4,	%g3
	xnorcc	%l0,	%g1,	%o4
	alignaddr	%l3,	%o1,	%i6
	addcc	%g4,	%i2,	%i5
	std	%f6,	[%l7 + 0x78]
	fpmerge	%f5,	%f28,	%f18
	umulcc	%l1,	0x0574,	%g7
	subc	%g2,	%o6,	%o2
	movvs	%xcc,	%l5,	%o0
	fnand	%f12,	%f12,	%f4
	edge32	%l6,	%l2,	%g5
	edge8ln	%o5,	%i3,	%i1
	movcs	%icc,	%i0,	%l4
	umulcc	%i7,	0x1ACA,	%g6
	mova	%icc,	%o3,	%i4
	smul	%o7,	0x023B,	%g3
	fmovrdne	%g1,	%f8,	%f30
	ldub	[%l7 + 0x30],	%o4
	addc	%l0,	0x1EE2,	%o1
	sdivx	%l3,	0x18A2,	%g4
	or	%i6,	0x041B,	%i5
	movge	%xcc,	%l1,	%i2
	bshuffle	%f16,	%f6,	%f10
	srax	%g2,	%g7,	%o6
	ldx	[%l7 + 0x28],	%o2
	mulx	%l5,	%o0,	%l6
	ldx	[%l7 + 0x20],	%g5
	mulx	%l2,	%o5,	%i3
	ldx	[%l7 + 0x58],	%i0
	lduh	[%l7 + 0x6C],	%i1
	movne	%xcc,	%i7,	%l4
	mova	%icc,	%g6,	%o3
	umulcc	%o7,	%g3,	%g1
	edge16	%o4,	%l0,	%o1
	ldsb	[%l7 + 0x6D],	%l3
	fmul8sux16	%f28,	%f14,	%f28
	subc	%g4,	0x1C19,	%i4
	fmovse	%xcc,	%f12,	%f19
	fcmpd	%fcc3,	%f20,	%f10
	udiv	%i5,	0x0D0B,	%i6
	edge32	%i2,	%g2,	%g7
	smul	%l1,	0x18AB,	%o6
	movleu	%xcc,	%l5,	%o0
	movcc	%icc,	%o2,	%g5
	ldd	[%l7 + 0x78],	%f16
	fone	%f8
	edge32l	%l2,	%l6,	%i3
	umul	%i0,	%i1,	%o5
	udivcc	%i7,	0x1843,	%l4
	fpsub16s	%f11,	%f14,	%f7
	fsrc2s	%f15,	%f18
	movpos	%xcc,	%o3,	%o7
	movrgez	%g3,	%g1,	%g6
	movre	%o4,	0x1A9,	%l0
	xorcc	%o1,	0x18DA,	%g4
	movl	%icc,	%l3,	%i4
	fcmpd	%fcc2,	%f16,	%f10
	andn	%i5,	%i6,	%i2
	ldd	[%l7 + 0x68],	%f12
	fmovdle	%icc,	%f18,	%f17
	subccc	%g7,	%g2,	%o6
	fmovrslz	%l1,	%f0,	%f18
	movge	%icc,	%o0,	%l5
	lduw	[%l7 + 0x48],	%o2
	movre	%g5,	0x078,	%l6
	edge16l	%i3,	%l2,	%i1
	std	%f30,	[%l7 + 0x70]
	orcc	%o5,	%i0,	%i7
	mulscc	%l4,	0x0E85,	%o3
	lduw	[%l7 + 0x30],	%o7
	mulscc	%g3,	%g1,	%o4
	mova	%icc,	%l0,	%g6
	srlx	%g4,	0x0F,	%o1
	move	%xcc,	%i4,	%i5
	st	%f2,	[%l7 + 0x24]
	subc	%l3,	0x03D8,	%i6
	movgu	%icc,	%g7,	%g2
	stw	%i2,	[%l7 + 0x14]
	sra	%o6,	0x02,	%l1
	movne	%xcc,	%o0,	%o2
	movge	%icc,	%g5,	%l6
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	addcc	%i1,	0x1FFD,	%o5
	movvs	%icc,	%l5,	%i0
	movge	%xcc,	%l4,	%i7
	edge8ln	%o7,	%g3,	%o3
	fnot1s	%f24,	%f15
	sll	%g1,	%l0,	%o4
	fxors	%f5,	%f13,	%f10
	srax	%g4,	0x1A,	%g6
	movl	%xcc,	%i4,	%i5
	edge8ln	%l3,	%i6,	%o1
	stw	%g7,	[%l7 + 0x38]
	srlx	%i2,	0x1A,	%o6
	movre	%g2,	0x190,	%o0
	udivcc	%l1,	0x127A,	%o2
	ldd	[%l7 + 0x58],	%f8
	xnorcc	%l6,	0x1FEB,	%g5
	sra	%i3,	0x06,	%i1
	ld	[%l7 + 0x58],	%f8
	edge8	%o5,	%l2,	%l5
	fpsub16s	%f8,	%f0,	%f6
	ldub	[%l7 + 0x34],	%l4
	edge8n	%i0,	%o7,	%i7
	stb	%o3,	[%l7 + 0x7C]
	andn	%g3,	0x0731,	%l0
	edge16	%o4,	%g4,	%g6
	fmovsg	%icc,	%f14,	%f10
	faligndata	%f0,	%f14,	%f22
	fmovsvc	%icc,	%f15,	%f13
	sdivcc	%g1,	0x00E6,	%i4
	addcc	%l3,	0x1ECD,	%i6
	or	%o1,	0x15FD,	%g7
	smul	%i2,	%o6,	%g2
	array8	%o0,	%l1,	%i5
	edge16	%l6,	%o2,	%g5
	fmovs	%f28,	%f15
	restore %i3, %o5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f29,	%f28
	fmovdvc	%icc,	%f25,	%f17
	sdivx	%l5,	0x0FAE,	%l2
	edge32	%i0,	%o7,	%l4
	xor	%i7,	0x0AAE,	%o3
	movleu	%icc,	%g3,	%l0
	fcmpne32	%f30,	%f16,	%o4
	addcc	%g6,	%g4,	%i4
	addc	%l3,	0x15F2,	%i6
	fnand	%f8,	%f28,	%f18
	subccc	%o1,	%g7,	%g1
	movrlz	%i2,	%o6,	%o0
	edge32n	%g2,	%i5,	%l1
	edge32l	%o2,	%g5,	%l6
	orncc	%o5,	%i1,	%i3
	movrgez	%l5,	0x21B,	%l2
	ld	[%l7 + 0x40],	%f28
	fnot1s	%f0,	%f11
	fands	%f12,	%f11,	%f17
	fnot1s	%f20,	%f3
	movrlz	%o7,	0x05F,	%i0
	fmovdg	%icc,	%f31,	%f9
	stb	%i7,	[%l7 + 0x37]
	udivx	%l4,	0x0200,	%o3
	edge16ln	%l0,	%o4,	%g3
	and	%g4,	0x1E37,	%g6
	ldsw	[%l7 + 0x0C],	%l3
	orcc	%i6,	%o1,	%g7
	movvs	%xcc,	%i4,	%g1
	addccc	%o6,	%i2,	%g2
	movrgez	%o0,	0x28E,	%l1
	fones	%f21
	sll	%o2,	%g5,	%l6
	sdivx	%i5,	0x19E5,	%o5
	movpos	%icc,	%i3,	%i1
	movrlez	%l2,	0x2AB,	%o7
	fcmps	%fcc1,	%f11,	%f16
	srl	%i0,	0x14,	%l5
	fpadd16s	%f30,	%f15,	%f0
	andn	%i7,	%l4,	%o3
	fmovrsne	%o4,	%f16,	%f10
	fpackfix	%f2,	%f29
	movrlz	%g3,	%g4,	%g6
	andcc	%l3,	0x0446,	%l0
	add	%o1,	0x1B90,	%g7
	movn	%xcc,	%i6,	%g1
	orncc	%o6,	%i2,	%g2
	array8	%o0,	%i4,	%o2
	andncc	%g5,	%l1,	%l6
	sdiv	%o5,	0x0003,	%i3
	fmovsvc	%xcc,	%f0,	%f16
	movleu	%icc,	%i1,	%l2
	smul	%o7,	%i0,	%i5
	ldub	[%l7 + 0x77],	%i7
	array16	%l4,	%o3,	%l5
	edge16	%g3,	%g4,	%g6
	sir	0x04DC
	orn	%l3,	%o4,	%o1
	fmovscc	%icc,	%f6,	%f7
	movgu	%xcc,	%l0,	%g7
	nop
	set	0x4E, %g2
	sth	%g1,	[%l7 + %g2]
	srl	%i6,	0x1E,	%i2
	stb	%o6,	[%l7 + 0x24]
	andncc	%o0,	%g2,	%o2
	fcmpne32	%f0,	%f4,	%g5
	edge32n	%l1,	%i4,	%l6
	movne	%xcc,	%i3,	%i1
	edge16ln	%o5,	%l2,	%i0
	edge32n	%i5,	%i7,	%l4
	fpadd16s	%f9,	%f11,	%f18
	fnand	%f30,	%f0,	%f18
	add	%o3,	0x13EE,	%l5
	xor	%g3,	%o7,	%g6
	movge	%icc,	%g4,	%o4
	udivx	%o1,	0x008F,	%l3
	and	%l0,	0x1F3F,	%g7
	fcmpne32	%f28,	%f16,	%g1
	fmovrslez	%i2,	%f21,	%f5
	fcmple16	%f18,	%f30,	%o6
	xor	%o0,	%i6,	%o2
	ldsh	[%l7 + 0x14],	%g2
	ld	[%l7 + 0x2C],	%f27
	movg	%icc,	%g5,	%i4
	nop
	set	0x4F, %i2
	ldsb	[%l7 + %i2],	%l1
	srlx	%i3,	%l6,	%o5
	fmovdge	%xcc,	%f8,	%f14
	fmovscc	%xcc,	%f9,	%f6
	xnorcc	%i1,	0x161C,	%i0
	srlx	%l2,	%i5,	%i7
	lduh	[%l7 + 0x78],	%l4
	xorcc	%l5,	%o3,	%g3
	save %g6, 0x059F, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o7,	%o1
	mulscc	%l3,	%l0,	%g7
	edge8ln	%o4,	%i2,	%g1
	movpos	%xcc,	%o6,	%i6
	sll	%o2,	0x15,	%o0
	movg	%icc,	%g2,	%g5
	edge8ln	%l1,	%i3,	%i4
	edge16l	%o5,	%i1,	%i0
	fabss	%f3,	%f12
	movrlez	%l6,	%i5,	%i7
	movneg	%xcc,	%l2,	%l5
	ldsb	[%l7 + 0x47],	%o3
	fpadd16s	%f14,	%f15,	%f2
	fcmple32	%f20,	%f8,	%l4
	mulscc	%g3,	%g4,	%o7
	stb	%g6,	[%l7 + 0x08]
	sub	%l3,	0x01AB,	%o1
	udivx	%g7,	0x1E84,	%l0
	save %o4, 0x0F5E, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0017,	%g1
	fmovsleu	%icc,	%f3,	%f19
	edge8n	%i6,	%o2,	%o0
	alignaddrl	%o6,	%g2,	%l1
	fmovs	%f0,	%f5
	andcc	%i3,	0x0E72,	%i4
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	fpsub16	%f16,	%f28,	%f24
	addcc	%l6,	0x1348,	%g5
	xorcc	%i5,	0x03C7,	%l2
	sra	%i7,	%o3,	%l4
	andncc	%g3,	%g4,	%l5
	array32	%g6,	%o7,	%l3
	xor	%g7,	0x134D,	%l0
	movleu	%icc,	%o1,	%i2
	ldd	[%l7 + 0x50],	%f12
	lduw	[%l7 + 0x60],	%g1
	udivcc	%o4,	0x14FC,	%o2
	fsrc2	%f6,	%f10
	movvs	%xcc,	%i6,	%o0
	sdivx	%g2,	0x0ED5,	%o6
	fmovrdgz	%l1,	%f0,	%f6
	edge32	%i4,	%o5,	%i1
	sth	%i3,	[%l7 + 0x1A]
	movleu	%xcc,	%l6,	%i0
	edge16n	%g5,	%l2,	%i5
	xorcc	%o3,	%i7,	%g3
	sra	%l4,	%l5,	%g4
	add	%o7,	0x1199,	%l3
	umul	%g7,	%l0,	%o1
	array8	%i2,	%g1,	%o4
	fmovda	%icc,	%f5,	%f25
	array32	%g6,	%o2,	%i6
	ldd	[%l7 + 0x68],	%f6
	fmovrdgz	%g2,	%f20,	%f10
	movn	%xcc,	%o6,	%l1
	fpadd16s	%f4,	%f6,	%f21
	xnor	%o0,	%o5,	%i4
	movrlz	%i1,	%l6,	%i3
	mulscc	%i0,	%g5,	%l2
	sir	0x0741
	ld	[%l7 + 0x1C],	%f28
	ldsb	[%l7 + 0x59],	%i5
	add	%i7,	%g3,	%o3
	srlx	%l5,	0x04,	%l4
	fcmpeq16	%f6,	%f20,	%g4
	srlx	%o7,	0x1B,	%l3
	st	%f8,	[%l7 + 0x34]
	and	%l0,	%g7,	%o1
	subccc	%g1,	%i2,	%g6
	ldsh	[%l7 + 0x5C],	%o4
	movge	%xcc,	%i6,	%o2
	fmovdgu	%xcc,	%f5,	%f15
	fmovrdne	%g2,	%f30,	%f20
	orcc	%l1,	%o6,	%o0
	ldsw	[%l7 + 0x34],	%o5
	alignaddrl	%i4,	%i1,	%i3
	ld	[%l7 + 0x6C],	%f6
	ldsb	[%l7 + 0x41],	%l6
	subcc	%g5,	%l2,	%i5
	movvs	%xcc,	%i7,	%i0
	array32	%g3,	%o3,	%l4
	movrne	%g4,	%l5,	%l3
	xorcc	%o7,	0x12D9,	%g7
	array32	%o1,	%l0,	%g1
	fornot1	%f2,	%f18,	%f26
	movre	%g6,	0x1C6,	%o4
	edge16ln	%i6,	%i2,	%g2
	udivx	%o2,	0x01A7,	%o6
	fmovsa	%xcc,	%f19,	%f3
	movvs	%icc,	%o0,	%l1
	movvs	%icc,	%o5,	%i1
	sdiv	%i4,	0x0F6D,	%l6
	addcc	%i3,	%g5,	%i5
	movleu	%icc,	%l2,	%i7
	umulcc	%i0,	0x1DA9,	%o3
	fornot2	%f8,	%f24,	%f4
	nop
	set	0x60, %o1
	std	%f2,	[%l7 + %o1]
	fmovdl	%xcc,	%f17,	%f24
	fmovdn	%icc,	%f15,	%f16
	fmul8sux16	%f6,	%f4,	%f4
	xnor	%g3,	%l4,	%g4
	add	%l5,	%l3,	%g7
	sra	%o1,	0x12,	%o7
	udiv	%g1,	0x0C08,	%l0
	ldsb	[%l7 + 0x2C],	%o4
	fnot1s	%f6,	%f3
	nop
	set	0x2C, %i4
	ldsw	[%l7 + %i4],	%i6
	lduw	[%l7 + 0x60],	%g6
	ldd	[%l7 + 0x20],	%f8
	fmovrde	%g2,	%f14,	%f20
	and	%i2,	%o2,	%o6
	ldx	[%l7 + 0x70],	%l1
	movl	%icc,	%o5,	%i1
	andn	%i4,	0x0B4D,	%l6
	fpack32	%f2,	%f14,	%f30
	sethi	0x0F4A,	%o0
	array8	%i3,	%i5,	%g5
	xnor	%i7,	0x1E80,	%i0
	edge32	%l2,	%o3,	%l4
	ldx	[%l7 + 0x68],	%g4
	fnot1	%f22,	%f30
	srl	%g3,	0x19,	%l3
	movrlez	%l5,	0x1DA,	%g7
	fmovrsgez	%o1,	%f19,	%f23
	mova	%icc,	%o7,	%g1
	for	%f2,	%f28,	%f12
	fmovsvc	%xcc,	%f11,	%f28
	umul	%o4,	0x0931,	%l0
	lduh	[%l7 + 0x28],	%i6
	ld	[%l7 + 0x14],	%f27
	movcc	%xcc,	%g2,	%g6
	smulcc	%o2,	0x0FEB,	%o6
	movne	%icc,	%i2,	%o5
	sdivcc	%i1,	0x064F,	%i4
	fcmpd	%fcc2,	%f8,	%f12
	sdivx	%l1,	0x0F10,	%o0
	edge16	%l6,	%i3,	%g5
	xnorcc	%i5,	%i0,	%l2
	fmovsn	%icc,	%f28,	%f24
	fpmerge	%f6,	%f4,	%f28
	ldub	[%l7 + 0x28],	%i7
	edge16n	%o3,	%l4,	%g3
	fcmpd	%fcc3,	%f26,	%f10
	movcc	%icc,	%g4,	%l3
	sub	%l5,	%g7,	%o7
	mova	%xcc,	%g1,	%o1
	orn	%l0,	%i6,	%o4
	edge16	%g6,	%g2,	%o6
	sll	%i2,	%o5,	%o2
	std	%f18,	[%l7 + 0x30]
	lduh	[%l7 + 0x2E],	%i1
	save %i4, %l1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f2,	%f28,	%f10
	movrne	%i3,	%g5,	%l6
	st	%f2,	[%l7 + 0x20]
	addc	%i0,	%l2,	%i5
	movcc	%xcc,	%o3,	%l4
	sir	0x1780
	fands	%f24,	%f10,	%f31
	alignaddr	%g3,	%i7,	%g4
	nop
	set	0x0B, %g4
	ldub	[%l7 + %g4],	%l5
	ldsw	[%l7 + 0x50],	%l3
	sra	%o7,	0x0F,	%g7
	andncc	%o1,	%g1,	%l0
	ldsw	[%l7 + 0x7C],	%i6
	xnorcc	%o4,	0x08D1,	%g6
	mova	%icc,	%o6,	%i2
	ld	[%l7 + 0x1C],	%f20
	movrlz	%g2,	%o5,	%i1
	ldx	[%l7 + 0x48],	%o2
	fnot2s	%f11,	%f31
	edge32n	%l1,	%o0,	%i4
	movne	%xcc,	%i3,	%g5
	move	%xcc,	%l6,	%l2
	srlx	%i5,	0x1F,	%o3
	subcc	%l4,	%g3,	%i0
	srax	%g4,	%i7,	%l3
	and	%l5,	0x1030,	%o7
	ldub	[%l7 + 0x39],	%o1
	save %g1, %l0, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g7,	[%l7 + 0x0A]
	fsrc2s	%f5,	%f10
	sra	%g6,	0x0B,	%o4
	movrgz	%o6,	%i2,	%o5
	fandnot2s	%f3,	%f17,	%f2
	ldx	[%l7 + 0x30],	%g2
	fornot2	%f16,	%f0,	%f20
	ldsh	[%l7 + 0x50],	%i1
	fornot1	%f20,	%f6,	%f2
	array8	%l1,	%o0,	%i4
	fmovspos	%icc,	%f25,	%f30
	fmovdn	%xcc,	%f23,	%f21
	fmovrsgez	%o2,	%f25,	%f28
	edge16l	%i3,	%l6,	%g5
	mulscc	%i5,	0x1C62,	%o3
	edge32n	%l2,	%l4,	%i0
	mulscc	%g4,	0x14F7,	%g3
	umulcc	%i7,	%l3,	%o7
	addcc	%o1,	0x1C11,	%l5
	fmovsg	%xcc,	%f24,	%f8
	fmovdcc	%icc,	%f23,	%f14
	fmovdn	%icc,	%f21,	%f22
	fandnot1s	%f5,	%f19,	%f1
	movrgez	%l0,	0x1EC,	%g1
	ldub	[%l7 + 0x6E],	%i6
	xnor	%g6,	0x1901,	%o4
	orcc	%o6,	%i2,	%o5
	std	%f24,	[%l7 + 0x68]
	fmovrdgz	%g7,	%f20,	%f26
	edge32	%i1,	%l1,	%o0
	sll	%i4,	0x06,	%o2
	orcc	%g2,	%i3,	%g5
	ldd	[%l7 + 0x10],	%f0
	fpadd32	%f8,	%f28,	%f8
	subccc	%i5,	%l6,	%l2
	edge32ln	%o3,	%l4,	%i0
	subc	%g3,	%i7,	%l3
	smulcc	%g4,	0x10B0,	%o7
	edge16ln	%o1,	%l5,	%g1
	movn	%icc,	%i6,	%l0
	ld	[%l7 + 0x18],	%f6
	fornot1	%f4,	%f2,	%f14
	subcc	%o4,	%g6,	%i2
	udiv	%o6,	0x1BC6,	%o5
	alignaddr	%g7,	%l1,	%o0
	sdiv	%i1,	0x0824,	%o2
	restore %g2, 0x148A, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g5,	%i4,	%i5
	andncc	%l6,	%l2,	%o3
	movle	%icc,	%l4,	%g3
	subcc	%i7,	%l3,	%i0
	popc	0x1F21,	%g4
	srl	%o7,	0x11,	%l5
	stx	%o1,	[%l7 + 0x68]
	stb	%i6,	[%l7 + 0x73]
	move	%icc,	%l0,	%g1
	std	%f22,	[%l7 + 0x20]
	nop
	set	0x40, %l4
	stx	%o4,	[%l7 + %l4]
	fmovrse	%i2,	%f10,	%f3
	mova	%xcc,	%o6,	%o5
	mova	%xcc,	%g6,	%l1
	fandnot2	%f22,	%f28,	%f28
	udivx	%o0,	0x1DB2,	%i1
	lduh	[%l7 + 0x22],	%g7
	edge8l	%g2,	%o2,	%i3
	movgu	%xcc,	%i4,	%g5
	edge16ln	%i5,	%l6,	%o3
	andcc	%l4,	0x12F1,	%g3
	fcmple32	%f6,	%f14,	%i7
	movcs	%icc,	%l3,	%l2
	addc	%g4,	%o7,	%i0
	mulx	%o1,	%l5,	%l0
	movre	%i6,	%o4,	%i2
	and	%g1,	0x123D,	%o5
	movrlz	%g6,	0x1EF,	%o6
	ldsb	[%l7 + 0x61],	%o0
	smul	%l1,	%i1,	%g2
	addccc	%o2,	0x0975,	%i3
	udiv	%g7,	0x1022,	%g5
	udivx	%i4,	0x0D39,	%l6
	fmovda	%xcc,	%f5,	%f23
	srax	%o3,	0x10,	%i5
	ldd	[%l7 + 0x50],	%f14
	movne	%xcc,	%l4,	%g3
	movleu	%icc,	%l3,	%l2
	movg	%xcc,	%g4,	%i7
	movgu	%icc,	%o7,	%o1
	subccc	%l5,	%i0,	%i6
	mova	%icc,	%o4,	%l0
	fone	%f24
	fands	%f23,	%f2,	%f20
	mulscc	%i2,	%g1,	%g6
	edge32l	%o6,	%o0,	%l1
	movcc	%icc,	%o5,	%g2
	movvc	%icc,	%o2,	%i3
	movg	%xcc,	%i1,	%g5
	movrlez	%i4,	%g7,	%l6
	stb	%i5,	[%l7 + 0x57]
	stx	%l4,	[%l7 + 0x60]
	srlx	%g3,	%l3,	%o3
	subccc	%l2,	%g4,	%i7
	andn	%o1,	%l5,	%i0
	addccc	%i6,	%o4,	%o7
	edge32	%i2,	%g1,	%g6
	fmovdl	%icc,	%f12,	%f26
	fmovdgu	%icc,	%f3,	%f17
	ldub	[%l7 + 0x6A],	%l0
	fmovdne	%icc,	%f16,	%f23
	addcc	%o0,	0x00BF,	%o6
	edge16n	%o5,	%g2,	%l1
	movle	%xcc,	%o2,	%i3
	edge32n	%g5,	%i4,	%g7
	movge	%xcc,	%l6,	%i1
	add	%i5,	0x1DB3,	%g3
	movge	%icc,	%l3,	%l4
	std	%f10,	[%l7 + 0x28]
	std	%f20,	[%l7 + 0x28]
	addcc	%l2,	%g4,	%i7
	sir	0x13C2
	srax	%o3,	%l5,	%o1
	movrne	%i0,	%i6,	%o7
	array8	%o4,	%i2,	%g6
	array8	%l0,	%g1,	%o6
	fmuld8ulx16	%f9,	%f29,	%f16
	fpackfix	%f22,	%f28
	movne	%icc,	%o5,	%g2
	movle	%xcc,	%l1,	%o0
	movcc	%xcc,	%i3,	%o2
	sll	%g5,	0x06,	%g7
	fmovsl	%xcc,	%f11,	%f20
	srlx	%l6,	0x0B,	%i1
	siam	0x0
	fnot2	%f22,	%f0
	movg	%xcc,	%i4,	%g3
	edge32n	%l3,	%i5,	%l4
	edge8n	%l2,	%i7,	%g4
	popc	%o3,	%o1
	xorcc	%i0,	0x02C5,	%l5
	umul	%i6,	%o4,	%o7
	xorcc	%i2,	%l0,	%g1
	fmovsg	%icc,	%f4,	%f22
	mova	%icc,	%o6,	%g6
	umul	%g2,	0x1D95,	%o5
	edge16ln	%l1,	%o0,	%o2
	or	%g5,	%g7,	%i3
	fmovsl	%xcc,	%f14,	%f16
	sub	%l6,	0x0629,	%i1
	sdivcc	%i4,	0x1685,	%l3
	alignaddr	%g3,	%l4,	%l2
	edge8	%i7,	%g4,	%i5
	stx	%o1,	[%l7 + 0x08]
	fandnot2	%f4,	%f22,	%f20
	fxor	%f30,	%f10,	%f30
	fmovrdgz	%i0,	%f10,	%f12
	edge32n	%l5,	%i6,	%o3
	ldsb	[%l7 + 0x31],	%o7
	xor	%o4,	%i2,	%l0
	andn	%g1,	0x110A,	%g6
	movrlz	%o6,	0x35D,	%o5
	andncc	%g2,	%o0,	%o2
	movvs	%xcc,	%g5,	%l1
	movl	%icc,	%g7,	%l6
	movrne	%i3,	%i1,	%l3
	sdivx	%g3,	0x1E8D,	%l4
	fpack32	%f4,	%f24,	%f6
	sra	%i4,	%l2,	%g4
	smulcc	%i5,	%o1,	%i7
	for	%f12,	%f28,	%f22
	fmul8sux16	%f0,	%f28,	%f0
	fmovdcc	%xcc,	%f31,	%f11
	fcmpne32	%f30,	%f28,	%i0
	fmovsvs	%icc,	%f9,	%f13
	smulcc	%l5,	0x05D0,	%o3
	ldd	[%l7 + 0x10],	%o6
	fmovdcc	%icc,	%f22,	%f5
	fcmpne32	%f4,	%f8,	%o4
	nop
	set	0x56, %l3
	lduh	[%l7 + %l3],	%i6
	fmovscs	%xcc,	%f10,	%f10
	fexpand	%f26,	%f30
	xorcc	%l0,	%g1,	%g6
	mulx	%i2,	0x09F7,	%o5
	st	%f13,	[%l7 + 0x68]
	orn	%g2,	%o6,	%o2
	fpsub32	%f20,	%f0,	%f22
	orncc	%o0,	%g5,	%l1
	addccc	%g7,	0x05EB,	%i3
	smul	%l6,	0x038D,	%l3
	edge32ln	%g3,	%l4,	%i4
	orncc	%i1,	0x028A,	%l2
	edge8	%g4,	%i5,	%o1
	sra	%i0,	%l5,	%i7
	fcmped	%fcc2,	%f28,	%f2
	andncc	%o7,	%o4,	%o3
	movg	%icc,	%i6,	%l0
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	movg	%icc,	%i2,	%o5
	edge8	%o6,	%g2,	%o2
	or	%o0,	0x191E,	%g5
	smulcc	%l1,	0x0E69,	%g7
	restore %i3, %l6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l4,	%l3,	%i1
	orcc	%l2,	0x0F7F,	%i4
	fmovrslz	%i5,	%f28,	%f31
	nop
	set	0x5C, %o5
	sth	%o1,	[%l7 + %o5]
	fmul8x16au	%f16,	%f26,	%f14
	sub	%i0,	%l5,	%g4
	movneg	%xcc,	%i7,	%o4
	fornot1	%f24,	%f28,	%f26
	fmovdgu	%icc,	%f23,	%f24
	movne	%icc,	%o3,	%o7
	movg	%xcc,	%i6,	%l0
	andn	%g1,	%i2,	%o5
	movcc	%xcc,	%g6,	%o6
	sub	%g2,	0x05BD,	%o2
	umulcc	%o0,	%g5,	%l1
	edge32ln	%g7,	%i3,	%l6
	udiv	%l4,	0x19B4,	%g3
	smul	%l3,	%l2,	%i4
	fmovsl	%icc,	%f13,	%f22
	movcs	%icc,	%i5,	%i1
	fandnot1s	%f23,	%f25,	%f17
	sethi	0x1B76,	%o1
	ldx	[%l7 + 0x60],	%l5
	sdiv	%i0,	0x08DC,	%i7
	mulx	%g4,	0x117E,	%o3
	andncc	%o7,	%o4,	%l0
	stb	%i6,	[%l7 + 0x0F]
	edge32	%g1,	%o5,	%g6
	lduh	[%l7 + 0x58],	%i2
	fnor	%f18,	%f30,	%f2
	sth	%g2,	[%l7 + 0x1A]
	sir	0x1B7E
	fmovde	%icc,	%f9,	%f20
	fnot1	%f6,	%f28
	orncc	%o6,	0x037E,	%o2
	addcc	%o0,	0x140B,	%g5
	orn	%l1,	%i3,	%g7
	fcmpeq32	%f14,	%f6,	%l6
	edge8n	%g3,	%l3,	%l2
	fexpand	%f8,	%f12
	movne	%icc,	%l4,	%i5
	mulscc	%i1,	0x0418,	%o1
	orn	%l5,	%i4,	%i7
	movgu	%icc,	%i0,	%g4
	orcc	%o7,	0x1F50,	%o3
	srlx	%l0,	0x13,	%o4
	edge32n	%i6,	%o5,	%g1
	alignaddrl	%g6,	%g2,	%i2
	edge32ln	%o2,	%o0,	%o6
	ldsh	[%l7 + 0x6E],	%g5
	move	%xcc,	%l1,	%i3
	fmovdpos	%icc,	%f18,	%f16
	edge8	%l6,	%g7,	%g3
	fmovdpos	%xcc,	%f23,	%f9
	addc	%l3,	%l4,	%l2
	movcs	%icc,	%i5,	%o1
	fmovdl	%xcc,	%f9,	%f4
	xorcc	%i1,	0x1550,	%i4
	andn	%i7,	0x0B1C,	%i0
	movrgz	%l5,	%g4,	%o3
	popc	%o7,	%o4
	orcc	%l0,	%i6,	%g1
	fmovdl	%xcc,	%f11,	%f8
	movrne	%g6,	0x2A7,	%g2
	umulcc	%o5,	%i2,	%o2
	st	%f31,	[%l7 + 0x10]
	std	%f28,	[%l7 + 0x08]
	movne	%icc,	%o0,	%o6
	umulcc	%l1,	0x1D4C,	%g5
	sethi	0x0AE3,	%i3
	subc	%g7,	0x072C,	%l6
	stx	%l3,	[%l7 + 0x30]
	edge16ln	%g3,	%l2,	%i5
	sll	%o1,	0x1E,	%i1
	xnorcc	%i4,	%i7,	%l4
	fmovrsne	%l5,	%f4,	%f20
	andncc	%g4,	%i0,	%o3
	sllx	%o4,	0x0B,	%o7
	fxnors	%f0,	%f13,	%f24
	array8	%i6,	%l0,	%g6
	array32	%g2,	%g1,	%o5
	sllx	%o2,	%i2,	%o6
	fsrc1s	%f6,	%f0
	xnorcc	%o0,	0x1593,	%g5
	add	%i3,	0x1150,	%g7
	subccc	%l6,	%l3,	%l1
	movrgz	%l2,	0x020,	%g3
	edge32ln	%i5,	%i1,	%i4
	stx	%i7,	[%l7 + 0x48]
	ld	[%l7 + 0x4C],	%f23
	fornot2	%f6,	%f14,	%f4
	movleu	%xcc,	%o1,	%l4
	movge	%icc,	%g4,	%i0
	movrgez	%l5,	%o3,	%o4
	or	%o7,	%l0,	%i6
	edge8ln	%g2,	%g6,	%g1
	add	%o5,	0x073F,	%i2
	movrgz	%o2,	0x05F,	%o6
	std	%f18,	[%l7 + 0x70]
	fmovsvc	%xcc,	%f1,	%f12
	movn	%icc,	%g5,	%o0
	stb	%i3,	[%l7 + 0x6B]
	fmovrslz	%g7,	%f9,	%f28
	udivcc	%l6,	0x0BB6,	%l3
	sra	%l1,	0x15,	%g3
	movne	%xcc,	%l2,	%i5
	xnor	%i4,	%i1,	%o1
	xor	%i7,	%l4,	%g4
	srax	%l5,	%i0,	%o4
	edge32	%o7,	%l0,	%i6
	fandnot2	%f24,	%f12,	%f4
	save %o3, %g6, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o5,	%g1,	%i2
	udivcc	%o2,	0x1560,	%o6
	std	%f8,	[%l7 + 0x68]
	fxor	%f4,	%f4,	%f12
	edge32l	%o0,	%i3,	%g7
	fnot2	%f6,	%f6
	ldub	[%l7 + 0x78],	%g5
	movrlez	%l6,	0x23C,	%l3
	sdivcc	%l1,	0x1560,	%l2
	edge16	%i5,	%g3,	%i4
	andncc	%o1,	%i7,	%l4
	stx	%i1,	[%l7 + 0x40]
	pdist	%f10,	%f30,	%f8
	fcmpne16	%f0,	%f6,	%g4
	fcmpgt32	%f24,	%f4,	%i0
	fcmple16	%f26,	%f28,	%o4
	pdist	%f6,	%f12,	%f6
	movpos	%xcc,	%l5,	%o7
	edge16	%i6,	%o3,	%g6
	xnor	%g2,	%o5,	%l0
	fand	%f18,	%f18,	%f18
	fmovrdlez	%g1,	%f14,	%f0
	std	%f2,	[%l7 + 0x40]
	orcc	%o2,	0x0AC9,	%o6
	movne	%xcc,	%o0,	%i3
	fpsub32s	%f17,	%f4,	%f28
	fands	%f19,	%f9,	%f22
	mova	%xcc,	%g7,	%g5
	st	%f26,	[%l7 + 0x58]
	st	%f3,	[%l7 + 0x34]
	udiv	%i2,	0x1D45,	%l3
	movne	%xcc,	%l6,	%l2
	ldx	[%l7 + 0x68],	%i5
	array16	%g3,	%l1,	%o1
	sub	%i7,	%i4,	%i1
	movge	%xcc,	%l4,	%g4
	popc	%i0,	%o4
	xorcc	%o7,	0x180A,	%l5
	stb	%o3,	[%l7 + 0x21]
	srl	%i6,	%g2,	%g6
	movcc	%icc,	%l0,	%g1
	sethi	0x081D,	%o2
	movl	%xcc,	%o6,	%o5
	alignaddr	%i3,	%o0,	%g7
	lduw	[%l7 + 0x6C],	%g5
	and	%l3,	%l6,	%l2
	fmovsa	%icc,	%f8,	%f9
	movrgz	%i2,	0x0C7,	%g3
	movrlez	%i5,	0x132,	%l1
	ldsh	[%l7 + 0x66],	%o1
	xnor	%i7,	%i4,	%i1
	movpos	%icc,	%l4,	%i0
	sth	%o4,	[%l7 + 0x78]
	fpadd16s	%f19,	%f17,	%f7
	xnor	%o7,	%l5,	%g4
	movrlz	%o3,	0x119,	%i6
	srl	%g6,	0x0B,	%g2
	movleu	%xcc,	%g1,	%l0
	sub	%o6,	%o5,	%o2
	mova	%xcc,	%o0,	%g7
	edge16l	%i3,	%l3,	%g5
	fmovsleu	%xcc,	%f2,	%f23
	movrlez	%l2,	0x1B9,	%i2
	movvc	%icc,	%l6,	%g3
	fmovrde	%i5,	%f28,	%f22
	fmovrde	%l1,	%f0,	%f30
	lduh	[%l7 + 0x0C],	%i7
	srl	%i4,	0x0A,	%o1
	fones	%f3
	srl	%i1,	%l4,	%o4
	movge	%xcc,	%i0,	%l5
	lduw	[%l7 + 0x38],	%g4
	fnot2s	%f23,	%f12
	edge8l	%o7,	%o3,	%g6
	orncc	%g2,	0x0CC0,	%i6
	stx	%g1,	[%l7 + 0x18]
	movrgz	%l0,	%o6,	%o5
	xnor	%o0,	%g7,	%i3
	edge32	%l3,	%o2,	%g5
	edge32n	%i2,	%l2,	%g3
	ldsb	[%l7 + 0x4A],	%i5
	edge8	%l1,	%i7,	%l6
	movn	%xcc,	%o1,	%i4
	edge32l	%l4,	%o4,	%i0
	fandnot2	%f30,	%f18,	%f20
	edge32n	%l5,	%i1,	%g4
	movrlz	%o7,	0x2B1,	%g6
	edge8ln	%o3,	%g2,	%i6
	bshuffle	%f4,	%f0,	%f22
	fxnors	%f25,	%f14,	%f5
	fandnot1	%f10,	%f2,	%f14
	srlx	%l0,	0x06,	%g1
	fcmpne32	%f24,	%f20,	%o5
	fnegd	%f2,	%f10
	fmovrslez	%o0,	%f12,	%f27
	add	%g7,	0x05F9,	%i3
	edge16l	%l3,	%o6,	%o2
	popc	0x1A4F,	%g5
	edge16l	%l2,	%g3,	%i2
	edge32	%l1,	%i5,	%i7
	movrgez	%o1,	0x3B2,	%l6
	sth	%i4,	[%l7 + 0x4C]
	fmovde	%xcc,	%f8,	%f29
	movl	%icc,	%o4,	%i0
	fmovsl	%icc,	%f21,	%f22
	mova	%icc,	%l5,	%l4
	xnor	%g4,	%i1,	%g6
	sth	%o7,	[%l7 + 0x38]
	edge16ln	%g2,	%i6,	%l0
	orncc	%g1,	0x0CB9,	%o3
	nop
	set	0x66, %i0
	lduh	[%l7 + %i0],	%o5
	movne	%xcc,	%g7,	%o0
	orncc	%l3,	%o6,	%o2
	fpackfix	%f4,	%f28
	popc	%g5,	%i3
	fmovrslez	%g3,	%f13,	%f21
	array16	%l2,	%l1,	%i5
	stb	%i2,	[%l7 + 0x4D]
	fmovde	%icc,	%f18,	%f1
	fmovdn	%icc,	%f28,	%f18
	fmovdge	%icc,	%f1,	%f17
	nop
	set	0x40, %l6
	lduh	[%l7 + %l6],	%o1
	fpmerge	%f3,	%f20,	%f30
	edge16l	%l6,	%i4,	%i7
	save %o4, 0x0AA7, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l5,	%l4,	%i1
	edge16	%g6,	%g4,	%o7
	fone	%f2
	movcs	%icc,	%i6,	%l0
	lduw	[%l7 + 0x3C],	%g1
	sir	0x13BC
	srax	%g2,	0x03,	%o3
	edge32ln	%o5,	%o0,	%l3
	umulcc	%g7,	0x056C,	%o6
	xnorcc	%g5,	0x12F0,	%i3
	movcc	%icc,	%g3,	%l2
	umulcc	%l1,	%o2,	%i2
	edge32l	%o1,	%l6,	%i5
	addc	%i7,	0x1316,	%i4
	fsrc1s	%f12,	%f17
	ldx	[%l7 + 0x58],	%i0
	movge	%icc,	%o4,	%l5
	sir	0x15E7
	srl	%l4,	%g6,	%i1
	fandnot1s	%f15,	%f31,	%f22
	fmovrdgz	%o7,	%f12,	%f20
	fornot1	%f30,	%f4,	%f24
	fmovsleu	%icc,	%f15,	%f28
	sdivx	%g4,	0x0BBB,	%l0
	alignaddr	%g1,	%g2,	%i6
	sdiv	%o3,	0x0EA1,	%o0
	edge8l	%o5,	%l3,	%o6
	subccc	%g7,	0x0F8F,	%i3
	and	%g5,	0x0EE0,	%l2
	edge32	%g3,	%l1,	%i2
	edge32n	%o2,	%l6,	%o1
	fandnot1	%f6,	%f20,	%f14
	for	%f8,	%f0,	%f12
	alignaddrl	%i7,	%i5,	%i0
	movvc	%icc,	%i4,	%o4
	fnand	%f22,	%f14,	%f22
	andcc	%l4,	0x14DD,	%g6
	fcmpgt32	%f30,	%f2,	%i1
	movcs	%icc,	%l5,	%g4
	xnor	%o7,	%g1,	%l0
	sub	%i6,	0x1162,	%o3
	fmovdl	%icc,	%f11,	%f10
	fxors	%f12,	%f13,	%f7
	add	%o0,	0x02BB,	%o5
	movvc	%icc,	%l3,	%o6
	edge8n	%g7,	%g2,	%i3
	edge32	%g5,	%l2,	%g3
	fmovdcs	%icc,	%f23,	%f1
	andn	%l1,	0x1BA9,	%i2
	alignaddrl	%o2,	%o1,	%l6
	movrlez	%i5,	0x12B,	%i0
	alignaddr	%i4,	%i7,	%l4
	edge32	%o4,	%g6,	%i1
	movle	%icc,	%l5,	%g4
	edge32l	%g1,	%o7,	%i6
	fmul8sux16	%f26,	%f26,	%f8
	sth	%o3,	[%l7 + 0x18]
	fsrc1	%f26,	%f0
	subcc	%l0,	0x052D,	%o5
	udiv	%o0,	0x1225,	%l3
	edge32	%g7,	%g2,	%o6
	stx	%g5,	[%l7 + 0x18]
	fcmpne32	%f22,	%f28,	%l2
	movrlez	%i3,	0x0C6,	%g3
	and	%l1,	0x1E44,	%i2
	fandnot2	%f2,	%f12,	%f26
	bshuffle	%f18,	%f10,	%f2
	xnorcc	%o1,	%o2,	%i5
	srl	%l6,	0x18,	%i0
	array32	%i4,	%i7,	%o4
	popc	0x11AB,	%l4
	andn	%g6,	%i1,	%g4
	std	%f30,	[%l7 + 0x28]
	stw	%l5,	[%l7 + 0x20]
	alignaddrl	%o7,	%g1,	%o3
	edge32	%l0,	%i6,	%o5
	movne	%icc,	%o0,	%l3
	ldub	[%l7 + 0x70],	%g2
	movl	%icc,	%g7,	%g5
	xnor	%o6,	0x0F26,	%i3
	orcc	%g3,	0x0A0A,	%l1
	orcc	%i2,	0x17E5,	%l2
	fpmerge	%f8,	%f13,	%f26
	stw	%o2,	[%l7 + 0x5C]
	ldsb	[%l7 + 0x58],	%o1
	fmovdvc	%icc,	%f27,	%f1
	stx	%l6,	[%l7 + 0x68]
	subcc	%i0,	%i5,	%i7
	edge32ln	%o4,	%i4,	%g6
	ldsb	[%l7 + 0x71],	%l4
	popc	0x13D5,	%i1
	xorcc	%g4,	%o7,	%l5
	fmovrse	%g1,	%f21,	%f2
	movneg	%xcc,	%o3,	%l0
	fmovrsgez	%o5,	%f13,	%f4
	array8	%i6,	%l3,	%g2
	orn	%g7,	0x17C9,	%o0
	andncc	%g5,	%o6,	%g3
	sdivcc	%l1,	0x008A,	%i2
	sll	%i3,	0x1D,	%o2
	fors	%f30,	%f5,	%f28
	add	%o1,	0x06A7,	%l2
	fnegd	%f6,	%f8
	edge8ln	%i0,	%l6,	%i7
	ldd	[%l7 + 0x28],	%f24
	movle	%icc,	%i5,	%i4
	fabsd	%f22,	%f18
	mulscc	%o4,	0x06F7,	%g6
	movrlez	%i1,	0x2D9,	%g4
	fmovrsgez	%l4,	%f8,	%f29
	fmovrdgz	%o7,	%f10,	%f20
	addccc	%l5,	0x0501,	%g1
	edge16	%l0,	%o5,	%i6
	sllx	%o3,	0x15,	%g2
	alignaddr	%g7,	%o0,	%g5
	nop
	set	0x38, %i7
	ldx	[%l7 + %i7],	%o6
	fandnot2s	%f14,	%f15,	%f4
	movgu	%icc,	%g3,	%l3
	fabss	%f0,	%f11
	addc	%i2,	%i3,	%o2
	xorcc	%o1,	0x1593,	%l2
	edge32n	%l1,	%l6,	%i0
	udiv	%i5,	0x0C7F,	%i7
	fmovrdlez	%o4,	%f4,	%f8
	array8	%g6,	%i4,	%g4
	move	%icc,	%l4,	%o7
	array8	%i1,	%l5,	%l0
	andn	%g1,	0x137C,	%o5
	movgu	%xcc,	%o3,	%i6
	sdivcc	%g7,	0x11CA,	%o0
	array8	%g5,	%g2,	%g3
	lduw	[%l7 + 0x44],	%l3
	fmovspos	%xcc,	%f11,	%f27
	and	%o6,	%i2,	%i3
	fmovdl	%icc,	%f7,	%f12
	movleu	%xcc,	%o2,	%l2
	edge8ln	%o1,	%l1,	%i0
	stx	%l6,	[%l7 + 0x20]
	edge32ln	%i5,	%o4,	%i7
	fand	%f4,	%f22,	%f0
	stx	%i4,	[%l7 + 0x68]
	fcmpd	%fcc0,	%f6,	%f14
	fandnot2	%f14,	%f8,	%f8
	orcc	%g6,	%g4,	%l4
	movne	%xcc,	%i1,	%l5
	st	%f24,	[%l7 + 0x20]
	movcc	%icc,	%o7,	%g1
	stw	%o5,	[%l7 + 0x54]
	fmovdn	%xcc,	%f21,	%f22
	movrne	%l0,	0x0B4,	%o3
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	lduh	[%l7 + 0x1A],	%g5
	movre	%g2,	0x172,	%g3
	movvs	%xcc,	%l3,	%i2
	xnorcc	%o6,	0x1526,	%o2
	xorcc	%l2,	%o1,	%i3
	sethi	0x07A7,	%l1
	sethi	0x097C,	%i0
	ldsw	[%l7 + 0x78],	%l6
	smul	%o4,	%i5,	%i4
	addc	%g6,	0x0121,	%i7
	edge8n	%g4,	%l4,	%l5
	fnot1	%f0,	%f10
	fmovdn	%icc,	%f15,	%f3
	stx	%i1,	[%l7 + 0x28]
	array16	%g1,	%o7,	%l0
	sll	%o3,	0x1E,	%g7
	xnor	%o5,	%i6,	%g5
	fpadd32s	%f11,	%f21,	%f0
	srax	%o0,	%g3,	%l3
	ldsh	[%l7 + 0x52],	%i2
	edge8n	%g2,	%o2,	%o6
	ldd	[%l7 + 0x30],	%f28
	fmovsvs	%xcc,	%f9,	%f14
	ldd	[%l7 + 0x40],	%o0
	udivx	%i3,	0x1480,	%l1
	udivx	%i0,	0x108C,	%l6
	ldd	[%l7 + 0x10],	%f20
	addcc	%o4,	%l2,	%i5
	fcmpeq32	%f14,	%f8,	%g6
	nop
	set	0x30, %i6
	stw	%i4,	[%l7 + %i6]
	andcc	%g4,	%i7,	%l4
	save %l5, 0x1122, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i1,	[%l7 + 0x34]
	nop
	set	0x0E, %l0
	lduh	[%l7 + %l0],	%l0
	addccc	%o3,	%g7,	%o7
	mulx	%o5,	0x1CD3,	%g5
	save %o0, %g3, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i2,	%g2,	%o2
	umul	%i6,	0x0BBF,	%o1
	fsrc1s	%f0,	%f13
	movge	%icc,	%o6,	%l1
	fmovrdlez	%i3,	%f0,	%f6
	sub	%i0,	%l6,	%l2
	fzero	%f8
	smul	%o4,	0x1792,	%i5
	movne	%xcc,	%i4,	%g4
	fsrc2	%f22,	%f22
	popc	0x150A,	%i7
	nop
	set	0x10, %l2
	stx	%g6,	[%l7 + %l2]
	fsrc2	%f26,	%f30
	orncc	%l4,	0x1117,	%g1
	andncc	%i1,	%l0,	%o3
	fxors	%f15,	%f3,	%f19
	addccc	%g7,	%l5,	%o5
	sir	0x0C3A
	smulcc	%g5,	0x034E,	%o7
	array32	%o0,	%g3,	%l3
	fmuld8ulx16	%f5,	%f11,	%f18
	edge8	%g2,	%o2,	%i2
	subc	%o1,	%i6,	%o6
	movle	%icc,	%i3,	%i0
	fmovsa	%xcc,	%f30,	%f21
	fpadd16s	%f14,	%f5,	%f15
	fmovrde	%l6,	%f2,	%f8
	std	%f12,	[%l7 + 0x28]
	edge16n	%l2,	%o4,	%l1
	smul	%i4,	%g4,	%i5
	edge32	%i7,	%l4,	%g1
	andncc	%i1,	%g6,	%l0
	restore %g7, 0x1C1E, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o5,	%g5,	%o7
	orncc	%o0,	%g3,	%l3
	std	%f2,	[%l7 + 0x60]
	sll	%g2,	%o2,	%i2
	fnot2s	%f3,	%f8
	ldsh	[%l7 + 0x54],	%l5
	xorcc	%i6,	0x1B81,	%o6
	xor	%o1,	0x12EE,	%i0
	movgu	%xcc,	%i3,	%l6
	movge	%icc,	%l2,	%l1
	movgu	%icc,	%o4,	%i4
	fmovsl	%icc,	%f30,	%f27
	sdivx	%i5,	0x1689,	%g4
	array32	%l4,	%g1,	%i7
	fmuld8ulx16	%f31,	%f27,	%f18
	edge32l	%i1,	%g6,	%g7
	stx	%l0,	[%l7 + 0x40]
	fmovrde	%o5,	%f10,	%f0
	xnor	%g5,	%o7,	%o0
	umul	%g3,	0x12D2,	%l3
	movcs	%icc,	%o3,	%o2
	movvc	%xcc,	%g2,	%l5
	or	%i6,	%i2,	%o1
	movcc	%icc,	%o6,	%i3
	edge32	%l6,	%i0,	%l2
	udivx	%o4,	0x0B1C,	%l1
	fmovde	%icc,	%f29,	%f25
	fmovdvc	%xcc,	%f8,	%f25
	movne	%icc,	%i5,	%i4
	edge16	%g4,	%g1,	%i7
	movle	%xcc,	%l4,	%i1
	edge32ln	%g6,	%l0,	%o5
	movn	%xcc,	%g5,	%o7
	sethi	0x0F27,	%g7
	subc	%o0,	0x1650,	%l3
	ldsw	[%l7 + 0x48],	%g3
	fmovsa	%icc,	%f22,	%f18
	array8	%o3,	%g2,	%l5
	movcc	%icc,	%i6,	%i2
	orcc	%o2,	0x1ACB,	%o1
	alignaddr	%i3,	%o6,	%l6
	ldsh	[%l7 + 0x16],	%l2
	nop
	set	0x6B, %g5
	ldub	[%l7 + %g5],	%i0
	edge8l	%o4,	%l1,	%i4
	sethi	0x08CC,	%g4
	movg	%icc,	%i5,	%g1
	subc	%i7,	%l4,	%i1
	andn	%l0,	%g6,	%g5
	sethi	0x1E54,	%o5
	std	%f10,	[%l7 + 0x38]
	umul	%o7,	%o0,	%g7
	smulcc	%l3,	0x1531,	%g3
	st	%f1,	[%l7 + 0x7C]
	popc	0x1616,	%o3
	umulcc	%l5,	%g2,	%i2
	edge16ln	%i6,	%o1,	%o2
	edge16	%o6,	%i3,	%l6
	movne	%xcc,	%i0,	%l2
	edge32	%o4,	%l1,	%g4
	fmovs	%f12,	%f7
	movge	%xcc,	%i5,	%i4
	movpos	%xcc,	%i7,	%g1
	movle	%xcc,	%l4,	%l0
	ldsw	[%l7 + 0x50],	%i1
	movge	%icc,	%g5,	%g6
	movre	%o7,	%o5,	%g7
	fmovspos	%xcc,	%f27,	%f15
	edge8n	%o0,	%l3,	%o3
	movge	%icc,	%g3,	%g2
	popc	0x160B,	%i2
	fmuld8sux16	%f24,	%f0,	%f10
	fabss	%f17,	%f11
	edge32n	%l5,	%i6,	%o2
	fpsub32	%f28,	%f0,	%f26
	umulcc	%o6,	%o1,	%l6
	fcmpeq16	%f24,	%f2,	%i3
	movre	%i0,	0x255,	%o4
	movrgz	%l1,	%g4,	%i5
	fandnot1	%f8,	%f10,	%f12
	st	%f17,	[%l7 + 0x14]
	subc	%i4,	%i7,	%g1
	stx	%l2,	[%l7 + 0x18]
	mulscc	%l0,	0x0F2B,	%i1
	edge16n	%l4,	%g6,	%o7
	fexpand	%f5,	%f8
	array32	%o5,	%g5,	%g7
	sir	0x1B55
	ldsw	[%l7 + 0x1C],	%o0
	fmovdleu	%xcc,	%f17,	%f4
	srlx	%o3,	0x14,	%l3
	udiv	%g3,	0x0962,	%g2
	fmovsleu	%icc,	%f13,	%f12
	movgu	%icc,	%l5,	%i2
	srax	%o2,	0x0E,	%i6
	sub	%o6,	0x1CE3,	%l6
	udivcc	%i3,	0x12FC,	%i0
	edge16n	%o4,	%o1,	%g4
	edge32ln	%l1,	%i5,	%i4
	fmovsvc	%icc,	%f0,	%f22
	fzero	%f0
	array32	%g1,	%l2,	%i7
	mova	%xcc,	%l0,	%i1
	lduw	[%l7 + 0x28],	%g6
	edge8l	%l4,	%o7,	%o5
	or	%g5,	%o0,	%o3
	fmuld8sux16	%f6,	%f30,	%f30
	std	%f10,	[%l7 + 0x78]
	fxor	%f26,	%f8,	%f10
	andcc	%g7,	0x109B,	%l3
	fornot1s	%f5,	%f17,	%f21
	movrlz	%g2,	0x0F6,	%g3
	fornot2	%f6,	%f0,	%f26
	fandnot2s	%f8,	%f26,	%f10
	nop
	set	0x3E, %o7
	stb	%i2,	[%l7 + %o7]
	xnor	%l5,	%o2,	%i6
	xor	%o6,	0x166A,	%i3
	fmul8x16	%f28,	%f4,	%f6
	andcc	%l6,	0x1DA9,	%o4
	nop
	set	0x26, %g6
	stb	%i0,	[%l7 + %g6]
	fmovdgu	%icc,	%f20,	%f3
	orcc	%g4,	0x1322,	%o1
	alignaddrl	%l1,	%i4,	%g1
	subcc	%l2,	%i7,	%l0
	edge8l	%i1,	%g6,	%l4
	alignaddrl	%i5,	%o7,	%o5
	movrlez	%o0,	%g5,	%g7
	subc	%o3,	%l3,	%g2
	mulscc	%g3,	0x081C,	%l5
	sir	0x17BE
	movgu	%icc,	%o2,	%i6
	fmovd	%f0,	%f22
	umul	%o6,	%i2,	%i3
	edge8ln	%o4,	%l6,	%g4
	fmovdle	%icc,	%f23,	%f27
	edge32	%i0,	%l1,	%i4
	array16	%o1,	%g1,	%l2
	fmovrdgez	%l0,	%f24,	%f16
	edge8	%i1,	%i7,	%l4
	udivx	%i5,	0x02E4,	%g6
	sethi	0x185C,	%o5
	orcc	%o0,	0x139C,	%o7
	srax	%g7,	%o3,	%l3
	movneg	%icc,	%g5,	%g2
	fxors	%f24,	%f16,	%f0
	edge16ln	%l5,	%g3,	%i6
	fcmple32	%f8,	%f20,	%o6
	ldsh	[%l7 + 0x22],	%i2
	popc	%i3,	%o2
	array32	%o4,	%g4,	%i0
	subccc	%l1,	%i4,	%l6
	fmovsleu	%icc,	%f16,	%f10
	fandnot2	%f6,	%f18,	%f30
	nop
	set	0x24, %o2
	lduh	[%l7 + %o2],	%g1
	fmovrsgez	%o1,	%f28,	%f26
	edge32n	%l0,	%i1,	%l2
	sth	%l4,	[%l7 + 0x24]
	fabss	%f1,	%f10
	ldub	[%l7 + 0x7F],	%i5
	edge16l	%i7,	%o5,	%o0
	or	%o7,	%g6,	%o3
	alignaddr	%g7,	%l3,	%g2
	udivx	%l5,	0x04EA,	%g5
	edge32n	%i6,	%g3,	%i2
	orcc	%i3,	0x1CD6,	%o2
	st	%f21,	[%l7 + 0x6C]
	movvc	%icc,	%o4,	%o6
	udivcc	%g4,	0x11FE,	%l1
	srl	%i4,	%l6,	%g1
	fmovrslz	%o1,	%f20,	%f19
	fabsd	%f28,	%f28
	pdist	%f10,	%f28,	%f14
	udivx	%i0,	0x0621,	%i1
	edge32	%l2,	%l0,	%i5
	addcc	%l4,	%o5,	%o0
	stx	%o7,	[%l7 + 0x28]
	ldub	[%l7 + 0x3B],	%g6
	smulcc	%i7,	0x04CE,	%o3
	andn	%l3,	%g2,	%l5
	fnors	%f29,	%f12,	%f24
	fmovrslz	%g7,	%f31,	%f28
	orcc	%g5,	%g3,	%i6
	fandnot1s	%f8,	%f0,	%f27
	sdivx	%i3,	0x06DC,	%i2
	xorcc	%o4,	0x1858,	%o6
	fnot1	%f20,	%f16
	fmovrslz	%g4,	%f22,	%f28
	srl	%o2,	%i4,	%l1
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	fmovsleu	%xcc,	%f27,	%f24
	fone	%f24
	fmovscs	%xcc,	%f13,	%f30
	orcc	%i0,	0x1260,	%o1
	lduw	[%l7 + 0x30],	%i1
	srlx	%l0,	%l2,	%i5
	stb	%o5,	[%l7 + 0x3C]
	movrne	%o0,	0x03B,	%o7
	edge8	%g6,	%i7,	%l4
	movl	%icc,	%o3,	%g2
	fabss	%f22,	%f7
	fmovdleu	%icc,	%f0,	%f30
	movrlez	%l5,	%l3,	%g7
	movle	%icc,	%g3,	%i6
	sdivx	%g5,	0x19BF,	%i3
	ldsb	[%l7 + 0x34],	%o4
	sdiv	%i2,	0x1CF8,	%g4
	edge32	%o6,	%i4,	%l1
	movrlz	%o2,	0x0D6,	%g1
	movrlz	%l6,	%i0,	%i1
	fpmerge	%f14,	%f27,	%f22
	faligndata	%f12,	%f10,	%f2
	movl	%xcc,	%o1,	%l0
	sdivcc	%i5,	0x043C,	%o5
	stw	%o0,	[%l7 + 0x60]
	alignaddr	%o7,	%g6,	%l2
	ldd	[%l7 + 0x58],	%f24
	movgu	%xcc,	%l4,	%o3
	movpos	%xcc,	%g2,	%l5
	andncc	%i7,	%g7,	%l3
	st	%f2,	[%l7 + 0x6C]
	fmovsa	%icc,	%f25,	%f1
	orcc	%i6,	0x116A,	%g3
	movre	%i3,	%g5,	%o4
	move	%icc,	%i2,	%g4
	alignaddrl	%i4,	%o6,	%o2
	movl	%icc,	%g1,	%l6
	fpmerge	%f24,	%f23,	%f0
	save %i0, 0x1D56, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o1,	%i1,	%l0
	movre	%i5,	%o5,	%o0
	edge16l	%o7,	%g6,	%l2
	movrne	%l4,	%o3,	%g2
	and	%i7,	%l5,	%g7
	edge32n	%i6,	%l3,	%i3
	ldd	[%l7 + 0x48],	%f16
	fnegs	%f31,	%f20
	movrlez	%g5,	%g3,	%o4
	siam	0x1
	mova	%xcc,	%g4,	%i2
	movneg	%xcc,	%i4,	%o2
	ldd	[%l7 + 0x40],	%o6
	alignaddr	%g1,	%l6,	%l1
	mova	%icc,	%i0,	%i1
	sub	%l0,	%o1,	%i5
	movcs	%icc,	%o5,	%o7
	popc	%o0,	%l2
	movge	%icc,	%g6,	%l4
	alignaddr	%g2,	%i7,	%o3
	st	%f14,	[%l7 + 0x74]
	movre	%l5,	0x022,	%i6
	sth	%g7,	[%l7 + 0x18]
	srl	%l3,	0x10,	%i3
	edge16n	%g5,	%o4,	%g4
	fmovrse	%g3,	%f15,	%f29
	movl	%xcc,	%i4,	%o2
	edge8	%i2,	%g1,	%l6
	ldsh	[%l7 + 0x44],	%o6
	fpadd32	%f2,	%f16,	%f28
	sub	%i0,	%l1,	%i1
	fnegd	%f2,	%f16
	umul	%o1,	%i5,	%l0
	movcc	%icc,	%o5,	%o0
	movvs	%icc,	%o7,	%g6
	xor	%l2,	0x0FD1,	%g2
	andncc	%i7,	%l4,	%o3
	sra	%l5,	%g7,	%l3
	mulscc	%i6,	%g5,	%i3
	fpack16	%f28,	%f0
	movrne	%g4,	0x2FD,	%o4
	xnorcc	%g3,	0x1A60,	%o2
	sdiv	%i2,	0x01E1,	%i4
	fnegd	%f18,	%f22
	smulcc	%l6,	0x0202,	%o6
	sllx	%i0,	%l1,	%g1
	movrgz	%i1,	0x31B,	%i5
	fands	%f10,	%f5,	%f21
	sdivx	%l0,	0x1EA5,	%o5
	lduh	[%l7 + 0x16],	%o0
	andncc	%o7,	%g6,	%o1
	udivcc	%g2,	0x08A4,	%l2
	fnand	%f8,	%f18,	%f4
	sdiv	%i7,	0x13C9,	%l4
	movl	%icc,	%l5,	%o3
	movrgz	%g7,	0x09C,	%l3
	mova	%icc,	%i6,	%g5
	movg	%xcc,	%i3,	%o4
	stw	%g3,	[%l7 + 0x14]
	array32	%o2,	%i2,	%i4
	movl	%icc,	%l6,	%g4
	nop
	set	0x1F, %o0
	ldsb	[%l7 + %o0],	%i0
	move	%icc,	%o6,	%l1
	fmovsa	%icc,	%f9,	%f15
	sdivcc	%i1,	0x1ED4,	%i5
	srax	%g1,	%l0,	%o0
	movgu	%icc,	%o7,	%o5
	srlx	%o1,	0x13,	%g2
	fcmpne16	%f10,	%f8,	%l2
	ld	[%l7 + 0x20],	%f4
	restore %g6, %i7, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l5,	%o3,	%l3
	mova	%icc,	%i6,	%g7
	udivx	%i3,	0x046D,	%g5
	sll	%g3,	%o2,	%o4
	fors	%f3,	%f24,	%f1
	sll	%i2,	0x1F,	%i4
	popc	0x067A,	%l6
	mulscc	%g4,	%i0,	%o6
	fcmpgt16	%f22,	%f2,	%i1
	movl	%xcc,	%i5,	%l1
	addccc	%l0,	%o0,	%g1
	smulcc	%o7,	%o5,	%o1
	movgu	%icc,	%l2,	%g2
	movge	%xcc,	%g6,	%i7
	mova	%icc,	%l4,	%o3
	edge16n	%l5,	%i6,	%g7
	movpos	%icc,	%l3,	%g5
	movl	%icc,	%g3,	%o2
	movrne	%i3,	0x05D,	%o4
	nop
	set	0x45, %g7
	ldub	[%l7 + %g7],	%i4
	fmovrslz	%l6,	%f5,	%f2
	bshuffle	%f22,	%f2,	%f16
	fandnot1	%f28,	%f20,	%f14
	popc	%g4,	%i0
	fmuld8sux16	%f13,	%f18,	%f12
	movrlz	%i2,	0x2F7,	%i1
	for	%f6,	%f4,	%f30
	alignaddr	%i5,	%l1,	%o6
	edge32ln	%l0,	%g1,	%o7
	move	%xcc,	%o0,	%o1
	move	%icc,	%o5,	%l2
	udiv	%g6,	0x0022,	%i7
	move	%icc,	%g2,	%o3
	movrgz	%l5,	%i6,	%l4
	fpadd16	%f14,	%f16,	%f16
	edge8	%g7,	%g5,	%g3
	edge32l	%l3,	%i3,	%o4
	fcmpgt32	%f16,	%f8,	%o2
	srl	%l6,	%i4,	%i0
	alignaddr	%i2,	%g4,	%i5
	ldd	[%l7 + 0x18],	%l0
	movg	%icc,	%o6,	%i1
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	movle	%icc,	%o0,	%o7
	popc	0x1208,	%o1
	array16	%l2,	%g6,	%o5
	subc	%g2,	%o3,	%i7
	movrne	%l5,	0x176,	%i6
	umulcc	%g7,	0x08FE,	%g5
	sdivx	%g3,	0x1CCA,	%l3
	ldx	[%l7 + 0x08],	%i3
	ldsb	[%l7 + 0x47],	%l4
	movcs	%icc,	%o4,	%l6
	sdiv	%i4,	0x11B1,	%o2
	andn	%i0,	0x180D,	%i2
	edge8l	%i5,	%g4,	%l1
	movcs	%xcc,	%o6,	%l0
	udiv	%g1,	0x083E,	%i1
	fmovd	%f18,	%f0
	movre	%o0,	%o7,	%l2
	movneg	%icc,	%o1,	%g6
	movneg	%xcc,	%g2,	%o3
	sdivcc	%o5,	0x0E63,	%l5
	subccc	%i6,	0x1A84,	%i7
	fones	%f27
	fmul8x16	%f21,	%f20,	%f30
	sth	%g7,	[%l7 + 0x22]
	movpos	%xcc,	%g5,	%g3
	stb	%i3,	[%l7 + 0x32]
	alignaddr	%l3,	%l4,	%o4
	sdivcc	%i4,	0x00E3,	%l6
	movvc	%xcc,	%i0,	%o2
	smul	%i2,	%i5,	%l1
	and	%g4,	%o6,	%g1
	umul	%l0,	0x04EC,	%o0
	or	%i1,	%l2,	%o1
	nop
	set	0x6C, %i3
	sth	%g6,	[%l7 + %i3]
	fxnor	%f12,	%f12,	%f6
	alignaddr	%o7,	%g2,	%o3
	movrne	%l5,	0x369,	%i6
	movcc	%xcc,	%o5,	%g7
	srlx	%i7,	%g5,	%g3
	addccc	%l3,	%i3,	%l4
	movl	%icc,	%i4,	%o4
	fzero	%f20
	fmul8ulx16	%f20,	%f12,	%f16
	fsrc2	%f28,	%f20
	fzero	%f22
	ld	[%l7 + 0x10],	%f2
	sethi	0x03F0,	%i0
	movn	%icc,	%l6,	%i2
	fors	%f27,	%f6,	%f15
	orn	%o2,	%i5,	%g4
	xnorcc	%o6,	%l1,	%g1
	sllx	%l0,	0x1D,	%i1
	xnorcc	%o0,	0x1133,	%l2
	edge8	%g6,	%o7,	%o1
	smul	%g2,	%l5,	%i6
	movn	%icc,	%o3,	%o5
	edge16	%g7,	%g5,	%i7
	ldd	[%l7 + 0x68],	%f26
	andcc	%l3,	%i3,	%l4
	mulscc	%i4,	%o4,	%g3
	fmuld8ulx16	%f9,	%f19,	%f10
	srlx	%l6,	%i2,	%o2
	sir	0x0A11
	andn	%i5,	%g4,	%o6
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%i0
	edge8ln	%l1,	%l0,	%g1
	ld	[%l7 + 0x60],	%f0
	fsrc2	%f18,	%f2
	ldsw	[%l7 + 0x44],	%i1
	movgu	%icc,	%o0,	%l2
	array8	%o7,	%g6,	%g2
	udivx	%o1,	0x0D09,	%l5
	srl	%i6,	%o5,	%o3
	xor	%g5,	%g7,	%l3
	xnor	%i7,	%l4,	%i4
	movneg	%icc,	%i3,	%g3
	addcc	%o4,	%i2,	%l6
	save %i5, 0x0307, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%o6,	%i0
	srax	%l1,	%o2,	%g1
	fzeros	%f20
	movne	%icc,	%l0,	%i1
	sdivx	%o0,	0x07A1,	%o7
	mulx	%g6,	%g2,	%o1
	fnegd	%f0,	%f6
	movgu	%icc,	%l2,	%i6
	ldx	[%l7 + 0x20],	%l5
	edge32	%o3,	%g5,	%g7
	subcc	%l3,	0x03CE,	%i7
	fornot1s	%f7,	%f9,	%f13
	edge16n	%o5,	%i4,	%i3
	smul	%l4,	%g3,	%o4
	edge16	%i2,	%l6,	%g4
	fmovrde	%o6,	%f12,	%f2
	udivcc	%i5,	0x15CD,	%i0
	edge8n	%l1,	%g1,	%o2
	fmovscc	%icc,	%f29,	%f19
	fexpand	%f28,	%f18
	movge	%xcc,	%i1,	%o0
	fpack32	%f12,	%f0,	%f0
	array16	%l0,	%o7,	%g6
	fmovse	%xcc,	%f7,	%f13
	mulx	%g2,	0x0AA1,	%l2
	srax	%i6,	%l5,	%o3
	movre	%o1,	%g5,	%g7
	movgu	%xcc,	%i7,	%o5
	addccc	%l3,	%i3,	%l4
	std	%f4,	[%l7 + 0x60]
	ldsh	[%l7 + 0x52],	%i4
	edge32ln	%g3,	%i2,	%o4
	fpadd16s	%f11,	%f24,	%f4
	fandnot1	%f14,	%f18,	%f10
	ldsb	[%l7 + 0x59],	%l6
	ldsw	[%l7 + 0x70],	%o6
	movpos	%icc,	%i5,	%i0
	edge32ln	%g4,	%l1,	%g1
	sdivcc	%o2,	0x1472,	%i1
	sra	%l0,	0x1E,	%o7
	sth	%o0,	[%l7 + 0x6A]
	sir	0x0E51
	fmovsl	%icc,	%f30,	%f22
	fmovrslez	%g2,	%f25,	%f13
	edge8	%l2,	%g6,	%i6
	sth	%l5,	[%l7 + 0x14]
	subccc	%o1,	0x0876,	%o3
	fmovdcc	%icc,	%f9,	%f12
	fmovrdne	%g7,	%f4,	%f0
	fpadd32s	%f16,	%f25,	%f15
	orn	%g5,	0x1DBD,	%o5
	fmovrdne	%i7,	%f16,	%f26
	sdivx	%i3,	0x115F,	%l4
	srax	%i4,	%g3,	%i2
	movrlz	%o4,	%l3,	%l6
	mulscc	%i5,	%o6,	%g4
	andncc	%i0,	%g1,	%o2
	add	%l1,	%i1,	%l0
	fmovdleu	%icc,	%f28,	%f20
	movvs	%icc,	%o7,	%o0
	add	%l2,	0x0A76,	%g2
	edge32n	%g6,	%l5,	%o1
	addccc	%i6,	0x1F45,	%g7
	fnegs	%f18,	%f10
	edge8n	%o3,	%o5,	%g5
	edge8	%i3,	%i7,	%l4
	fpadd32	%f12,	%f28,	%f18
	edge32	%i4,	%i2,	%o4
	lduh	[%l7 + 0x74],	%g3
	movn	%xcc,	%l6,	%i5
	edge32	%o6,	%g4,	%l3
	andcc	%g1,	%i0,	%o2
	ldsh	[%l7 + 0x1A],	%i1
	subc	%l0,	%l1,	%o7
	array16	%o0,	%l2,	%g6
	edge32	%g2,	%o1,	%l5
	srax	%g7,	%i6,	%o3
	restore %o5, %i3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l4,	0x03CD,	%g5
	sll	%i4,	0x05,	%o4
	fpadd32s	%f20,	%f11,	%f12
	fcmpne32	%f10,	%f30,	%i2
	alignaddrl	%g3,	%i5,	%o6
	fmovdgu	%icc,	%f20,	%f14
	fandnot1	%f26,	%f28,	%f30
	movvs	%icc,	%g4,	%l6
	movpos	%icc,	%g1,	%i0
	move	%icc,	%l3,	%o2
	array32	%i1,	%l0,	%l1
	subcc	%o0,	%o7,	%g6
	andn	%l2,	0x0AE9,	%o1
	andcc	%l5,	%g2,	%i6
	fmovrdgz	%g7,	%f28,	%f16
	xor	%o5,	%o3,	%i7
	fmovdvs	%icc,	%f14,	%f30
	array8	%i3,	%l4,	%i4
	sdivcc	%g5,	0x1A5D,	%i2
	smul	%g3,	%o4,	%i5
	fmovsleu	%xcc,	%f1,	%f5
	movrgz	%g4,	%o6,	%g1
	edge32n	%i0,	%l3,	%o2
	array8	%l6,	%i1,	%l0
	move	%icc,	%l1,	%o0
	fmovrsne	%g6,	%f20,	%f5
	movneg	%icc,	%o7,	%l2
	fmovd	%f10,	%f28
	mulscc	%l5,	%o1,	%i6
	edge8ln	%g2,	%o5,	%g7
	fcmpd	%fcc3,	%f30,	%f24
	sir	0x09B3
	smul	%o3,	%i3,	%i7
	fpsub16	%f12,	%f30,	%f18
	xor	%i4,	%l4,	%i2
	fpack16	%f20,	%f5
	umul	%g5,	%g3,	%i5
	save %g4, %o4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i0,	0x024B,	%l3
	edge16n	%g1,	%o2,	%i1
	movge	%icc,	%l6,	%l1
	movne	%icc,	%o0,	%g6
	sth	%l0,	[%l7 + 0x6C]
	fcmpes	%fcc3,	%f26,	%f8
	ldx	[%l7 + 0x58],	%l2
	sethi	0x054D,	%o7
	srl	%o1,	%i6,	%g2
	movneg	%xcc,	%o5,	%g7
	alignaddrl	%l5,	%i3,	%o3
	fxnors	%f30,	%f4,	%f25
	fmovdneg	%xcc,	%f24,	%f9
	save %i7, %i4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l4,	%g5,	%g3
	movne	%xcc,	%g4,	%o4
	sub	%o6,	%i0,	%i5
	subccc	%g1,	0x058D,	%l3
	save %o2, %i1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l6,	0x0E3E,	%g6
	ldsb	[%l7 + 0x13],	%o0
	fabss	%f29,	%f9
	fmovdleu	%icc,	%f23,	%f2
	edge32n	%l0,	%l2,	%o1
	sll	%o7,	0x19,	%i6
	ldub	[%l7 + 0x7E],	%g2
	fmovdcc	%icc,	%f18,	%f15
	fmovsneg	%icc,	%f4,	%f30
	edge16ln	%o5,	%g7,	%l5
	umulcc	%o3,	0x0E76,	%i3
	andncc	%i4,	%i7,	%i2
	xnorcc	%g5,	%g3,	%l4
	ldd	[%l7 + 0x78],	%o4
	mova	%icc,	%g4,	%o6
	sethi	0x027F,	%i0
	movrlz	%g1,	%i5,	%l3
	ldub	[%l7 + 0x56],	%i1
	movg	%xcc,	%o2,	%l1
	movvc	%xcc,	%l6,	%o0
	orcc	%l0,	0x03B5,	%l2
	fmovrsgz	%o1,	%f18,	%f20
	array8	%o7,	%g6,	%g2
	mulx	%i6,	0x1291,	%g7
	udivcc	%l5,	0x14D9,	%o5
	subc	%i3,	%i4,	%o3
	lduw	[%l7 + 0x10],	%i7
	fandnot1	%f4,	%f24,	%f0
	movcs	%icc,	%i2,	%g5
	sra	%g3,	%o4,	%l4
	mulscc	%g4,	0x074F,	%i0
	addcc	%g1,	0x16D8,	%i5
	fmovse	%icc,	%f13,	%f27
	udiv	%o6,	0x0775,	%l3
	add	%i1,	0x1C2A,	%l1
	fandnot1s	%f13,	%f17,	%f15
	fmovsvs	%xcc,	%f23,	%f18
	movvc	%xcc,	%o2,	%l6
	udivcc	%l0,	0x124E,	%o0
	umulcc	%o1,	%l2,	%g6
	movpos	%icc,	%o7,	%i6
	orn	%g2,	%l5,	%g7
	fpadd32s	%f19,	%f31,	%f19
	edge16ln	%i3,	%o5,	%o3
	stb	%i4,	[%l7 + 0x77]
	srax	%i7,	%i2,	%g3
	ldsh	[%l7 + 0x3A],	%o4
	sub	%g5,	0x03E3,	%l4
	fpsub32s	%f29,	%f8,	%f29
	sdiv	%g4,	0x1F98,	%i0
	ldx	[%l7 + 0x10],	%g1
	edge16	%i5,	%o6,	%l3
	edge16l	%l1,	%i1,	%o2
	move	%icc,	%l0,	%o0
	stx	%l6,	[%l7 + 0x78]
	movne	%xcc,	%o1,	%g6
	fsrc2s	%f22,	%f12
	edge16ln	%l2,	%o7,	%i6
	ldsw	[%l7 + 0x60],	%g2
	sdiv	%l5,	0x124C,	%g7
	add	%o5,	0x1FAA,	%o3
	sth	%i3,	[%l7 + 0x72]
	orn	%i4,	0x0ABF,	%i2
	fmul8sux16	%f24,	%f26,	%f26
	ldd	[%l7 + 0x20],	%f28
	movvs	%xcc,	%g3,	%i7
	andncc	%o4,	%g5,	%g4
	array16	%l4,	%i0,	%i5
	movl	%icc,	%o6,	%g1
	movvc	%icc,	%l3,	%i1
	smulcc	%o2,	0x1C73,	%l0
	udivx	%o0,	0x0912,	%l6
	andncc	%l1,	%g6,	%o1
	ldub	[%l7 + 0x53],	%l2
	fors	%f14,	%f4,	%f4
	nop
	set	0x44, %i1
	lduh	[%l7 + %i1],	%i6
	and	%g2,	0x0378,	%l5
	edge32	%g7,	%o5,	%o7
	movre	%o3,	0x1B4,	%i4
	sra	%i3,	%g3,	%i2
	ldx	[%l7 + 0x10],	%o4
	ldx	[%l7 + 0x48],	%i7
	movn	%xcc,	%g4,	%g5
	addcc	%l4,	0x1959,	%i5
	edge8n	%o6,	%i0,	%l3
	xnor	%i1,	0x199B,	%o2
	srl	%l0,	0x0D,	%o0
	movcc	%xcc,	%g1,	%l1
	sll	%l6,	0x1A,	%g6
	udivcc	%l2,	0x1D8B,	%o1
	srlx	%i6,	0x17,	%l5
	std	%f8,	[%l7 + 0x38]
	movre	%g7,	%o5,	%g2
	ldsb	[%l7 + 0x32],	%o3
	addcc	%o7,	%i3,	%i4
	sub	%i2,	0x0995,	%g3
	andncc	%i7,	%o4,	%g5
	ldd	[%l7 + 0x78],	%f4
	nop
	set	0x0C, %o3
	stb	%l4,	[%l7 + %o3]
	movrlez	%i5,	0x1E6,	%g4
	fcmpne16	%f26,	%f4,	%i0
	sll	%o6,	0x06,	%l3
	fcmpd	%fcc3,	%f18,	%f0
	movcc	%xcc,	%i1,	%l0
	sethi	0x071B,	%o0
	sll	%o2,	%g1,	%l1
	sll	%g6,	%l2,	%l6
	fornot1s	%f21,	%f22,	%f20
	fmovs	%f3,	%f19
	fmovdvs	%icc,	%f2,	%f13
	movrgz	%o1,	0x2A9,	%i6
	fpsub32	%f10,	%f2,	%f22
	ldsb	[%l7 + 0x2B],	%g7
	andncc	%o5,	%g2,	%o3
	andn	%l5,	%o7,	%i3
	xor	%i4,	0x002D,	%i2
	movrlez	%g3,	%i7,	%g5
	movcs	%icc,	%o4,	%l4
	fand	%f30,	%f8,	%f22
	udivcc	%g4,	0x1DB9,	%i0
	movg	%xcc,	%o6,	%l3
	movrlez	%i1,	0x107,	%l0
	sra	%o0,	%o2,	%g1
	edge8n	%l1,	%g6,	%l2
	movrlez	%i5,	%l6,	%i6
	edge32l	%o1,	%g7,	%o5
	movl	%icc,	%g2,	%o3
	lduh	[%l7 + 0x2E],	%l5
	movvc	%icc,	%o7,	%i4
	edge32	%i3,	%i2,	%g3
	sdivx	%i7,	0x0FEB,	%g5
	udivx	%o4,	0x1EA2,	%g4
	ld	[%l7 + 0x7C],	%f3
	movre	%i0,	0x083,	%o6
	ldd	[%l7 + 0x18],	%f24
	srlx	%l3,	0x0C,	%i1
	sra	%l0,	%o0,	%l4
	edge32	%o2,	%g1,	%g6
	sir	0x1822
	lduh	[%l7 + 0x40],	%l1
	xnor	%i5,	%l6,	%l2
	fmovsge	%xcc,	%f23,	%f5
	movgu	%xcc,	%o1,	%i6
	edge8l	%o5,	%g2,	%o3
	andcc	%g7,	0x0920,	%l5
	umulcc	%o7,	%i4,	%i2
	sdiv	%g3,	0x0342,	%i3
	mulx	%g5,	%o4,	%i7
	movrgez	%i0,	%o6,	%l3
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	umulcc	%o0,	%l4,	%o2
	or	%g6,	0x1919,	%g1
	movpos	%icc,	%l1,	%i5
	srlx	%l2,	%l6,	%i6
	edge16ln	%o1,	%g2,	%o5
	movvc	%icc,	%o3,	%l5
	mulx	%g7,	%o7,	%i4
	orn	%i2,	0x1C7C,	%g3
	sra	%i3,	%o4,	%i7
	fmovdcs	%icc,	%f18,	%f1
	sra	%i0,	%o6,	%l3
	addccc	%g5,	%g4,	%l0
	sll	%i1,	0x0C,	%o0
	edge8	%o2,	%g6,	%l4
	fmovdneg	%icc,	%f1,	%f10
	edge32	%l1,	%g1,	%l2
	movvc	%icc,	%l6,	%i5
	fpmerge	%f22,	%f30,	%f28
	orn	%i6,	0x1D7C,	%g2
	fpsub16	%f30,	%f24,	%f18
	xorcc	%o5,	%o1,	%o3
	smul	%l5,	%g7,	%i4
	and	%o7,	0x0925,	%g3
	subc	%i3,	0x1AC6,	%o4
	movge	%icc,	%i2,	%i0
	ldsh	[%l7 + 0x2A],	%i7
	srl	%l3,	0x05,	%g5
	movleu	%icc,	%g4,	%o6
	xnor	%i1,	0x0450,	%l0
	edge8n	%o2,	%g6,	%l4
	fmovdn	%xcc,	%f19,	%f19
	ldd	[%l7 + 0x40],	%l0
	ldsh	[%l7 + 0x70],	%o0
	fmovsgu	%icc,	%f10,	%f28
	addccc	%l2,	%l6,	%i5
	fmovsleu	%xcc,	%f7,	%f12
	edge32	%i6,	%g1,	%g2
	fmovdcc	%icc,	%f5,	%f0
	movvc	%xcc,	%o1,	%o3
	addccc	%l5,	%o5,	%g7
	movle	%icc,	%i4,	%o7
	smulcc	%g3,	%o4,	%i2
	fpadd16s	%f24,	%f28,	%f23
	stx	%i3,	[%l7 + 0x18]
	sdivx	%i0,	0x15EB,	%i7
	movre	%l3,	%g4,	%o6
	fcmpne32	%f0,	%f0,	%g5
	movpos	%xcc,	%i1,	%o2
	or	%g6,	0x0764,	%l4
	fandnot2s	%f2,	%f18,	%f30
	ldd	[%l7 + 0x78],	%f22
	sdivcc	%l1,	0x05FC,	%l0
	ld	[%l7 + 0x5C],	%f1
	fmul8x16	%f31,	%f18,	%f2
	fcmps	%fcc1,	%f0,	%f19
	ld	[%l7 + 0x40],	%f19
	fmovrde	%o0,	%f16,	%f8
	edge8n	%l2,	%i5,	%i6
	popc	%l6,	%g1
	movg	%xcc,	%g2,	%o1
	fnot2	%f0,	%f24
	movrgez	%l5,	%o5,	%o3
	fmovrde	%i4,	%f12,	%f6
	srax	%o7,	%g3,	%o4
	movcs	%icc,	%i2,	%g7
	fmovsvs	%icc,	%f17,	%f1
	edge16	%i0,	%i3,	%i7
	array16	%l3,	%g4,	%g5
	andn	%o6,	0x1C43,	%i1
	nop
	set	0x43, %i5
	stb	%g6,	[%l7 + %i5]
	move	%icc,	%l4,	%l1
	fornot1	%f28,	%f26,	%f16
	array8	%l0,	%o2,	%o0
	srlx	%i5,	%l2,	%l6
	add	%i6,	%g1,	%g2
	sth	%o1,	[%l7 + 0x5A]
	fmovs	%f26,	%f28
	addcc	%o5,	0x13EB,	%o3
	fmovsle	%icc,	%f8,	%f3
	addcc	%l5,	0x0087,	%o7
	nop
	set	0x30, %g1
	ldx	[%l7 + %g1],	%i4
	edge16l	%o4,	%g3,	%i2
	array32	%g7,	%i0,	%i7
	fnors	%f20,	%f11,	%f21
	fmovsvs	%icc,	%f11,	%f20
	subc	%i3,	0x02B6,	%g4
	udivcc	%l3,	0x106B,	%o6
	lduw	[%l7 + 0x64],	%i1
	fmovrdlz	%g6,	%f0,	%f22
	ldsw	[%l7 + 0x14],	%g5
	fmovsleu	%xcc,	%f31,	%f11
	srlx	%l4,	0x18,	%l0
	sdivx	%o2,	0x13E9,	%l1
	ld	[%l7 + 0x18],	%f28
	array16	%o0,	%l2,	%i5
	edge8n	%l6,	%i6,	%g2
	umulcc	%g1,	0x005F,	%o5
	ldsw	[%l7 + 0x54],	%o1
	ldsw	[%l7 + 0x68],	%l5
	ldub	[%l7 + 0x39],	%o3
	movneg	%xcc,	%i4,	%o4
	fcmpne16	%f26,	%f26,	%o7
	fmovdleu	%xcc,	%f18,	%f30
	andcc	%i2,	%g3,	%g7
	or	%i7,	0x1BB8,	%i0
	st	%f6,	[%l7 + 0x68]
	ldd	[%l7 + 0x28],	%i2
	fmovdg	%icc,	%f19,	%f18
	fmovdgu	%icc,	%f13,	%f16
	ldd	[%l7 + 0x08],	%f14
	xorcc	%g4,	0x0120,	%o6
	fcmpne16	%f2,	%f22,	%l3
	or	%i1,	%g6,	%g5
	and	%l4,	0x1857,	%l0
	andn	%l1,	0x05E2,	%o2
	sth	%l2,	[%l7 + 0x76]
	smul	%o0,	0x17CF,	%l6
	andcc	%i5,	0x15F7,	%g2
	fornot1	%f16,	%f28,	%f4
	alignaddrl	%g1,	%i6,	%o1
	ldd	[%l7 + 0x48],	%f24
	andcc	%o5,	%l5,	%o3
	subcc	%o4,	0x12AA,	%o7
	srlx	%i4,	%i2,	%g3
	edge8	%g7,	%i7,	%i0
	edge32ln	%i3,	%o6,	%l3
	movre	%i1,	%g6,	%g5
	udivcc	%l4,	0x0192,	%g4
	orncc	%l0,	%o2,	%l2
	movre	%o0,	%l6,	%l1
	fmovdvs	%xcc,	%f8,	%f12
	movrlz	%i5,	%g1,	%g2
	restore %i6, %o1, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%l5,	%f12,	%f10
	udivx	%o4,	0x171C,	%o7
	sub	%o3,	0x0F7A,	%i2
	fand	%f12,	%f10,	%f0
	movleu	%icc,	%g3,	%i4
	udiv	%i7,	0x02EF,	%i0
	fmovsl	%icc,	%f27,	%f0
	ldd	[%l7 + 0x78],	%i2
	edge32	%g7,	%o6,	%i1
	movcs	%icc,	%l3,	%g6
	fmovsvs	%icc,	%f30,	%f27
	array16	%g5,	%l4,	%l0
	movgu	%icc,	%g4,	%o2
	edge16l	%l2,	%o0,	%l6
	add	%i5,	0x11BB,	%g1
	movpos	%icc,	%g2,	%l1
	andncc	%i6,	%o1,	%o5
	fmovdleu	%icc,	%f15,	%f24
	fnot1s	%f3,	%f2
	fpackfix	%f22,	%f11
	movn	%icc,	%o4,	%o7
	fornot1	%f0,	%f14,	%f12
	movpos	%xcc,	%o3,	%i2
	ldd	[%l7 + 0x60],	%f6
	fnot1	%f14,	%f6
	fornot1	%f2,	%f6,	%f30
	or	%g3,	0x0B25,	%l5
	fpsub16	%f26,	%f18,	%f28
	and	%i7,	%i0,	%i4
	fpsub16s	%f8,	%f27,	%f12
	umulcc	%i3,	0x1ECC,	%o6
	edge8l	%i1,	%l3,	%g7
	movg	%icc,	%g6,	%g5
	smulcc	%l4,	%l0,	%g4
	alignaddrl	%l2,	%o2,	%l6
	smul	%i5,	0x19D2,	%o0
	std	%f8,	[%l7 + 0x48]
	fnot2	%f28,	%f24
	sir	0x1141
	fcmpeq32	%f30,	%f8,	%g2
	fpadd32	%f26,	%f14,	%f14
	subccc	%g1,	0x1D93,	%i6
	edge16ln	%o1,	%l1,	%o5
	array32	%o7,	%o3,	%i2
	fandnot1	%f22,	%f12,	%f8
	array8	%o4,	%g3,	%l5
	movge	%xcc,	%i7,	%i0
	orcc	%i4,	%o6,	%i1
	subc	%l3,	0x0799,	%g7
	fmovsa	%xcc,	%f23,	%f26
	ldsw	[%l7 + 0x78],	%g6
	edge16ln	%i3,	%l4,	%l0
	ld	[%l7 + 0x0C],	%f15
	and	%g4,	0x1B7C,	%g5
	sdiv	%o2,	0x0C81,	%l6
	ldsb	[%l7 + 0x1E],	%l2
	mulscc	%o0,	0x0926,	%i5
	sllx	%g1,	0x1E,	%g2
	edge32	%i6,	%o1,	%o5
	fmovdpos	%xcc,	%f11,	%f14
	array16	%l1,	%o7,	%i2
	edge16n	%o4,	%o3,	%l5
	udivx	%i7,	0x0573,	%g3
	movneg	%icc,	%i0,	%o6
	fmovrdlz	%i1,	%f10,	%f6
	movl	%xcc,	%l3,	%i4
	xorcc	%g6,	0x141A,	%g7
	fxors	%f31,	%f11,	%f17
	ldd	[%l7 + 0x70],	%f10
	sdiv	%i3,	0x13B1,	%l4
	sir	0x1047
	fsrc2s	%f5,	%f28
	movrlez	%l0,	%g5,	%o2
	edge16	%l6,	%g4,	%o0
	movvc	%xcc,	%i5,	%g1
	edge32	%l2,	%i6,	%o1
	movleu	%xcc,	%g2,	%o5
	umulcc	%o7,	0x016A,	%l1
	stb	%i2,	[%l7 + 0x78]
	movcs	%xcc,	%o3,	%l5
	srax	%o4,	0x19,	%i7
	sdiv	%g3,	0x1971,	%o6
	orn	%i1,	0x1A3F,	%i0
	movgu	%icc,	%i4,	%g6
	ldsh	[%l7 + 0x50],	%g7
	fmovdvc	%xcc,	%f25,	%f31
	movvs	%xcc,	%i3,	%l4
	fmovsle	%xcc,	%f28,	%f20
	lduh	[%l7 + 0x6E],	%l0
	fcmpeq32	%f16,	%f20,	%l3
	move	%icc,	%g5,	%o2
	ldsw	[%l7 + 0x34],	%g4
	movg	%icc,	%l6,	%i5
	movge	%xcc,	%o0,	%l2
	fsrc2s	%f12,	%f17
	ldsb	[%l7 + 0x18],	%g1
	array8	%i6,	%g2,	%o5
	smul	%o1,	%o7,	%l1
	orn	%o3,	%l5,	%o4
	fmovdvc	%xcc,	%f15,	%f22
	lduw	[%l7 + 0x70],	%i7
	mulx	%g3,	%i2,	%o6
	edge32n	%i0,	%i1,	%g6
	edge16ln	%g7,	%i3,	%l4
	umulcc	%i4,	0x0180,	%l3
	edge16l	%g5,	%o2,	%g4
	fmovrdlz	%l0,	%f28,	%f18
	fzeros	%f2
	addccc	%l6,	0x005B,	%i5
	subc	%o0,	0x0909,	%l2
	ldub	[%l7 + 0x37],	%i6
	udivcc	%g2,	0x016A,	%g1
	array16	%o5,	%o1,	%o7
	stx	%o3,	[%l7 + 0x20]
	movpos	%xcc,	%l5,	%l1
	movvs	%icc,	%i7,	%g3
	orcc	%o4,	0x0CCD,	%o6
	movl	%xcc,	%i2,	%i1
	edge8l	%i0,	%g7,	%i3
	smulcc	%l4,	0x0A73,	%i4
	udivcc	%g6,	0x01D6,	%l3
	fmovdne	%xcc,	%f14,	%f24
	udivx	%o2,	0x1AA9,	%g5
	andcc	%g4,	0x070E,	%l6
	edge16n	%i5,	%o0,	%l2
	edge16l	%i6,	%l0,	%g1
	fornot2s	%f24,	%f13,	%f13
	sll	%g2,	0x06,	%o1
	movg	%xcc,	%o7,	%o5
	udiv	%o3,	0x0455,	%l5
	movn	%icc,	%l1,	%i7
	fmovsle	%icc,	%f3,	%f0
	fmul8x16al	%f9,	%f28,	%f22
	xorcc	%o4,	0x0161,	%g3
	udiv	%i2,	0x1FAD,	%i1
	lduh	[%l7 + 0x08],	%o6
	popc	0x10B9,	%i0
	movvs	%xcc,	%i3,	%l4
	fmovrdlz	%i4,	%f12,	%f18
	edge32l	%g6,	%g7,	%o2
	ldsw	[%l7 + 0x20],	%g5
	umulcc	%g4,	0x1E85,	%l3
	movre	%l6,	%o0,	%i5
	fmovdneg	%icc,	%f9,	%f8
	xor	%l2,	%i6,	%l0
	orcc	%g2,	%g1,	%o1
	fxors	%f12,	%f15,	%f13
	move	%icc,	%o7,	%o5
	addcc	%o3,	%l5,	%i7
	edge8ln	%o4,	%l1,	%i2
	alignaddrl	%g3,	%o6,	%i0
	lduw	[%l7 + 0x70],	%i3
	orncc	%i1,	0x12E0,	%l4
	andn	%i4,	0x15C8,	%g6
	fmovdge	%xcc,	%f19,	%f28
	nop
	set	0x54, %l5
	stw	%g7,	[%l7 + %l5]
	mulx	%g5,	0x1401,	%o2
	popc	%g4,	%l3
	fmovdpos	%xcc,	%f9,	%f19
	orcc	%o0,	%l6,	%i5
	movpos	%icc,	%i6,	%l2
	edge32ln	%g2,	%g1,	%l0
	sub	%o7,	%o1,	%o3
	nop
	set	0x74, %g3
	ldsw	[%l7 + %g3],	%l5
	array32	%i7,	%o4,	%o5
	add	%i2,	%l1,	%o6
	subcc	%g3,	0x00FC,	%i0
	udivcc	%i1,	0x04B5,	%l4
	ldx	[%l7 + 0x18],	%i4
	sra	%i3,	%g7,	%g6
	edge32ln	%g5,	%o2,	%l3
	addcc	%g4,	%o0,	%l6
	andncc	%i5,	%i6,	%l2
	sethi	0x1A64,	%g1
	move	%icc,	%l0,	%o7
	edge16l	%o1,	%g2,	%o3
	xnorcc	%i7,	%l5,	%o5
	movg	%xcc,	%i2,	%l1
	subc	%o4,	%g3,	%o6
	fmuld8sux16	%f19,	%f26,	%f6
	fmovrslez	%i1,	%f26,	%f9
	and	%l4,	%i4,	%i3
	stw	%i0,	[%l7 + 0x4C]
	umulcc	%g6,	%g5,	%o2
	alignaddr	%l3,	%g7,	%o0
	movre	%l6,	%i5,	%i6
	array16	%g4,	%g1,	%l2
	xor	%o7,	%o1,	%g2
	fnor	%f28,	%f18,	%f28
	mulscc	%l0,	%i7,	%o3
	sub	%o5,	0x118B,	%i2
	fnand	%f24,	%f10,	%f12
	fsrc1	%f8,	%f30
	subccc	%l1,	0x0379,	%l5
	xor	%g3,	0x135D,	%o4
	nop
	set	0x78, %o6
	ldx	[%l7 + %o6],	%o6
	sth	%i1,	[%l7 + 0x58]
	fcmpd	%fcc2,	%f26,	%f24
	udiv	%l4,	0x1BCA,	%i4
	fmul8x16au	%f6,	%f26,	%f10
	fmovrdgez	%i3,	%f18,	%f24
	andcc	%g6,	%g5,	%i0
	sir	0x0FA5
	movrlz	%o2,	%l3,	%g7
	sth	%l6,	[%l7 + 0x26]
	edge16n	%i5,	%o0,	%g4
	smul	%g1,	0x131D,	%i6
	orn	%o7,	%o1,	%l2
	subcc	%g2,	%l0,	%o3
	fmuld8ulx16	%f4,	%f13,	%f0
	udiv	%i7,	0x17A6,	%i2
	movg	%xcc,	%o5,	%l5
	ldd	[%l7 + 0x40],	%f12
	umul	%g3,	%l1,	%o6
	smul	%i1,	0x004F,	%o4
	edge16l	%l4,	%i4,	%g6
	stx	%g5,	[%l7 + 0x30]
	movge	%xcc,	%i3,	%o2
	mulscc	%l3,	%g7,	%l6
	movrgez	%i0,	%o0,	%g4
	nop
	set	0x46, %g2
	ldub	[%l7 + %g2],	%i5
	fzeros	%f25
	udivx	%i6,	0x0C4F,	%o7
	movgu	%icc,	%g1,	%l2
	addcc	%o1,	%g2,	%o3
	sub	%l0,	0x1B52,	%i7
	nop
	set	0x30, %i2
	lduw	[%l7 + %i2],	%i2
	xor	%l5,	0x0F4C,	%o5
	movneg	%icc,	%l1,	%o6
	andncc	%g3,	%i1,	%o4
	andcc	%i4,	%g6,	%l4
	fmovrde	%i3,	%f6,	%f4
	umul	%g5,	%o2,	%l3
	movn	%icc,	%g7,	%l6
	xor	%o0,	0x1A68,	%g4
	fexpand	%f28,	%f6
	fmovdvc	%xcc,	%f11,	%f23
	subc	%i5,	0x16BB,	%i0
	movrne	%i6,	%g1,	%l2
	array16	%o7,	%g2,	%o3
	stw	%o1,	[%l7 + 0x24]
	ldsh	[%l7 + 0x3C],	%l0
	fmovrdgez	%i7,	%f4,	%f10
	xorcc	%i2,	0x176B,	%o5
	fmovrslz	%l5,	%f9,	%f12
	subccc	%l1,	0x13D7,	%g3
	fcmped	%fcc2,	%f18,	%f14
	subc	%o6,	0x0802,	%i1
	stw	%o4,	[%l7 + 0x64]
	edge8	%g6,	%i4,	%l4
	srl	%i3,	0x05,	%g5
	fpsub32	%f8,	%f26,	%f28
	movcc	%xcc,	%o2,	%l3
	fmovrsgz	%g7,	%f25,	%f22
	fxor	%f16,	%f26,	%f8
	st	%f20,	[%l7 + 0x0C]
	fzeros	%f11
	andncc	%o0,	%l6,	%g4
	alignaddrl	%i5,	%i0,	%g1
	array32	%l2,	%o7,	%g2
	ldsw	[%l7 + 0x60],	%i6
	sllx	%o1,	0x19,	%l0
	movle	%icc,	%o3,	%i2
	sllx	%o5,	%i7,	%l1
	fandnot1s	%f31,	%f5,	%f26
	nop
	set	0x58, %l1
	stx	%l5,	[%l7 + %l1]
	fandnot2s	%f14,	%f0,	%f8
	movneg	%icc,	%g3,	%i1
	mulscc	%o4,	%g6,	%i4
	ldsw	[%l7 + 0x48],	%l4
	nop
	set	0x60, %o1
	lduh	[%l7 + %o1],	%o6
	andncc	%g5,	%i3,	%o2
	sll	%g7,	0x13,	%l3
	andncc	%l6,	%o0,	%i5
	fandnot1s	%f28,	%f29,	%f0
	ldd	[%l7 + 0x20],	%i0
	movcc	%icc,	%g1,	%l2
	fandnot2	%f18,	%f2,	%f22
	fmovdpos	%icc,	%f11,	%f10
	pdist	%f20,	%f14,	%f6
	xor	%g4,	%o7,	%i6
	edge32n	%o1,	%g2,	%o3
	udivcc	%l0,	0x0D0F,	%o5
	popc	%i7,	%i2
	fmovrsgz	%l5,	%f27,	%f3
	ldsb	[%l7 + 0x48],	%g3
	umul	%l1,	0x0437,	%o4
	fmovrdlz	%i1,	%f14,	%f18
	array16	%g6,	%l4,	%o6
	fpack16	%f14,	%f6
	array16	%i4,	%i3,	%g5
	edge16ln	%g7,	%o2,	%l6
	fmovscc	%icc,	%f27,	%f22
	sethi	0x0B54,	%l3
	fornot1s	%f5,	%f24,	%f25
	fmovsg	%xcc,	%f19,	%f13
	faligndata	%f30,	%f16,	%f8
	movgu	%icc,	%o0,	%i0
	fmovdvc	%xcc,	%f15,	%f5
	subc	%i5,	%g1,	%g4
	edge16ln	%o7,	%i6,	%l2
	fmovsvc	%xcc,	%f25,	%f12
	fmovdvs	%icc,	%f5,	%f24
	sub	%o1,	0x009E,	%o3
	movg	%xcc,	%g2,	%l0
	fmovsneg	%icc,	%f2,	%f2
	addcc	%o5,	%i7,	%l5
	lduh	[%l7 + 0x30],	%g3
	array16	%l1,	%i2,	%i1
	movn	%xcc,	%o4,	%l4
	array8	%o6,	%i4,	%g6
	sra	%g5,	0x06,	%i3
	srax	%g7,	0x08,	%l6
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%f16
	stb	%o2,	[%l7 + 0x47]
	array8	%o0,	%i0,	%i5
	fcmple32	%f12,	%f8,	%l3
	xnor	%g1,	%g4,	%i6
	ldd	[%l7 + 0x78],	%f22
	sra	%l2,	%o7,	%o3
	alignaddrl	%o1,	%g2,	%o5
	fnands	%f3,	%f5,	%f30
	movrgz	%l0,	%l5,	%g3
	addc	%i7,	0x17DD,	%i2
	fsrc1	%f24,	%f26
	movvc	%xcc,	%l1,	%o4
	fmovde	%xcc,	%f21,	%f5
	movle	%icc,	%l4,	%o6
	movcc	%xcc,	%i1,	%i4
	sra	%g5,	%i3,	%g6
	edge8	%l6,	%o2,	%g7
	nop
	set	0x74, %l4
	ldsh	[%l7 + %l4],	%i0
	sir	0x1836
	fmovrsne	%o0,	%f22,	%f23
	fmovsvc	%xcc,	%f3,	%f14
	movrlz	%l3,	%i5,	%g4
	movrlz	%i6,	%g1,	%o7
	fmovrdne	%o3,	%f16,	%f22
	fand	%f14,	%f10,	%f20
	udivx	%l2,	0x13F8,	%g2
	array8	%o5,	%l0,	%l5
	or	%o1,	0x1B68,	%i7
	ldd	[%l7 + 0x68],	%f16
	srax	%i2,	0x1F,	%g3
	subcc	%o4,	%l1,	%o6
	movrlz	%i1,	0x165,	%i4
	move	%icc,	%l4,	%i3
	edge8n	%g5,	%g6,	%o2
	umul	%l6,	%i0,	%g7
	popc	%o0,	%l3
	edge32l	%i5,	%g4,	%g1
	ldx	[%l7 + 0x10],	%o7
	array16	%o3,	%l2,	%i6
	fmovrdlz	%g2,	%f0,	%f20
	edge32	%l0,	%l5,	%o5
	smulcc	%i7,	0x1D2E,	%o1
	save %i2, %o4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f10,	%f27,	%f6
	movpos	%xcc,	%g3,	%o6
	movre	%i1,	0x333,	%l4
	lduw	[%l7 + 0x14],	%i3
	edge8l	%g5,	%i4,	%o2
	srlx	%g6,	0x08,	%i0
	srlx	%l6,	%g7,	%o0
	fmovdg	%xcc,	%f23,	%f10
	andncc	%l3,	%i5,	%g1
	udivcc	%g4,	0x1ACA,	%o3
	udivx	%o7,	0x1BE4,	%i6
	fnegs	%f24,	%f26
	orncc	%g2,	%l0,	%l5
	xnorcc	%o5,	%l2,	%i7
	and	%i2,	0x19A2,	%o1
	edge8l	%l1,	%g3,	%o4
	mulx	%o6,	0x1749,	%l4
	fcmpes	%fcc1,	%f31,	%f22
	addc	%i1,	%g5,	%i3
	ld	[%l7 + 0x48],	%f14
	fmul8sux16	%f4,	%f6,	%f12
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	umul	%l6,	%g7,	%o0
	udivx	%l3,	0x0D41,	%i5
	movcc	%icc,	%g6,	%g1
	edge32n	%g4,	%o7,	%o3
	srl	%i6,	0x1B,	%l0
	movn	%icc,	%g2,	%o5
	fmul8x16	%f27,	%f8,	%f14
	sdivx	%l5,	0x047B,	%i7
	fmuld8sux16	%f9,	%f4,	%f6
	addcc	%l2,	%o1,	%i2
	orcc	%l1,	0x0288,	%o4
	fnegs	%f3,	%f28
	edge32n	%o6,	%g3,	%i1
	subcc	%l4,	0x06FB,	%g5
	ldub	[%l7 + 0x2F],	%i4
	restore %o2, 0x11E2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i0,	0x0BA5,	%g7
	mulx	%o0,	0x0797,	%l6
	sll	%l3,	0x06,	%i5
	movvs	%xcc,	%g6,	%g1
	movpos	%icc,	%o7,	%o3
	and	%g4,	%l0,	%g2
	alignaddr	%o5,	%i6,	%i7
	mulscc	%l2,	0x1180,	%l5
	movge	%xcc,	%o1,	%l1
	movne	%icc,	%o4,	%o6
	save %i2, 0x0202, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f26,	%f18,	%f8
	fmovsleu	%xcc,	%f12,	%f25
	udivcc	%g3,	0x0407,	%l4
	sll	%g5,	0x12,	%i4
	stb	%o2,	[%l7 + 0x5C]
	addccc	%i3,	0x1E32,	%g7
	fcmpne16	%f24,	%f2,	%o0
	subc	%l6,	0x0F56,	%l3
	edge8l	%i0,	%i5,	%g6
	mulscc	%o7,	0x1567,	%o3
	xnor	%g1,	%g4,	%g2
	edge32ln	%o5,	%i6,	%l0
	edge16ln	%i7,	%l5,	%l2
	fcmple16	%f14,	%f30,	%l1
	movrgez	%o1,	0x124,	%o6
	array16	%i2,	%o4,	%g3
	edge32n	%l4,	%g5,	%i4
	save %o2, %i3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o0,	%i1,	%l6
	nop
	set	0x28, %g4
	stx	%l3,	[%l7 + %g4]
	mulx	%i0,	%g6,	%i5
	edge16l	%o3,	%o7,	%g4
	edge8l	%g2,	%g1,	%o5
	edge16n	%l0,	%i6,	%l5
	fmovdg	%xcc,	%f4,	%f1
	mulx	%l2,	%l1,	%o1
	for	%f16,	%f4,	%f8
	fmovsa	%xcc,	%f17,	%f5
	umul	%o6,	%i7,	%o4
	fpack16	%f14,	%f30
	fand	%f14,	%f28,	%f4
	edge32n	%i2,	%g3,	%g5
	fcmpne32	%f28,	%f22,	%i4
	add	%o2,	%l4,	%g7
	array16	%o0,	%i3,	%l6
	fmovscc	%icc,	%f19,	%f30
	edge32	%i1,	%l3,	%g6
	edge8	%i5,	%i0,	%o3
	fsrc2	%f0,	%f0
	st	%f14,	[%l7 + 0x20]
	movg	%icc,	%g4,	%g2
	movneg	%icc,	%o7,	%g1
	subccc	%l0,	0x1FD0,	%o5
	smul	%l5,	0x0538,	%i6
	fpsub16	%f8,	%f10,	%f10
	movrlz	%l2,	0x387,	%l1
	fmovdcs	%icc,	%f10,	%f20
	fpadd16s	%f18,	%f10,	%f29
	smul	%o6,	%o1,	%o4
	umulcc	%i2,	0x1F9D,	%g3
	movcc	%xcc,	%g5,	%i7
	ldd	[%l7 + 0x50],	%o2
	lduh	[%l7 + 0x5C],	%i4
	sth	%g7,	[%l7 + 0x24]
	subc	%o0,	%l4,	%i3
	edge32l	%l6,	%l3,	%g6
	stb	%i1,	[%l7 + 0x2C]
	fcmpgt16	%f12,	%f14,	%i5
	orncc	%i0,	0x0BA0,	%g4
	fmovrdgez	%g2,	%f22,	%f18
	udiv	%o3,	0x1CC5,	%g1
	sub	%l0,	%o7,	%o5
	subc	%i6,	0x1628,	%l2
	movle	%icc,	%l1,	%l5
	smulcc	%o6,	%o4,	%o1
	fmovsgu	%xcc,	%f15,	%f24
	or	%g3,	%g5,	%i2
	fmovsgu	%xcc,	%f10,	%f5
	ldx	[%l7 + 0x58],	%o2
	edge32n	%i7,	%g7,	%i4
	array8	%l4,	%i3,	%o0
	edge8l	%l3,	%g6,	%i1
	fornot2	%f10,	%f10,	%f30
	fmovrdlz	%i5,	%f10,	%f26
	stb	%i0,	[%l7 + 0x32]
	andn	%g4,	0x0A7B,	%l6
	movrgez	%o3,	0x115,	%g2
	array32	%g1,	%o7,	%o5
	stb	%i6,	[%l7 + 0x3C]
	fmovs	%f22,	%f8
	movcc	%xcc,	%l2,	%l0
	edge8ln	%l1,	%l5,	%o4
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	addc	%g5,	%g3,	%i2
	movrne	%o2,	0x22D,	%g7
	udivx	%i7,	0x14E5,	%i4
	movle	%xcc,	%i3,	%o0
	bshuffle	%f2,	%f28,	%f26
	movge	%icc,	%l3,	%l4
	ldd	[%l7 + 0x38],	%f28
	mova	%icc,	%i1,	%g6
	sdivx	%i0,	0x01E1,	%i5
	orn	%l6,	0x1131,	%g4
	and	%g2,	%g1,	%o7
	movpos	%xcc,	%o5,	%i6
	edge32ln	%l2,	%o3,	%l1
	mova	%xcc,	%l5,	%l0
	sth	%o4,	[%l7 + 0x52]
	add	%o6,	0x0E3C,	%o1
	xnor	%g5,	%i2,	%o2
	edge8	%g7,	%i7,	%i4
	faligndata	%f18,	%f0,	%f2
	srlx	%g3,	0x1B,	%i3
	umulcc	%l3,	%o0,	%i1
	sir	0x1FF4
	fmovsg	%xcc,	%f9,	%f2
	movl	%icc,	%g6,	%i0
	fpsub32s	%f14,	%f3,	%f18
	movne	%xcc,	%l4,	%l6
	ldx	[%l7 + 0x60],	%g4
	movrlez	%g2,	%g1,	%i5
	addcc	%o5,	0x0AA0,	%i6
	xorcc	%l2,	%o7,	%l1
	add	%l5,	0x1DC3,	%l0
	sra	%o4,	%o6,	%o3
	ldsb	[%l7 + 0x0C],	%o1
	fmovrdlez	%i2,	%f30,	%f18
	sllx	%g5,	0x19,	%g7
	st	%f5,	[%l7 + 0x64]
	mova	%icc,	%i7,	%i4
	mulscc	%o2,	%g3,	%i3
	sir	0x0475
	andcc	%l3,	%o0,	%i1
	fnand	%f8,	%f30,	%f30
	movpos	%icc,	%g6,	%l4
	udivcc	%i0,	0x0C3B,	%l6
	alignaddrl	%g4,	%g2,	%i5
	edge32	%o5,	%i6,	%g1
	save %l2, %o7, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l1,	0x1415,	%o4
	fnot2	%f8,	%f6
	sllx	%o6,	%l0,	%o3
	pdist	%f6,	%f20,	%f0
	st	%f9,	[%l7 + 0x74]
	fpmerge	%f18,	%f0,	%f10
	edge8	%o1,	%g5,	%i2
	mulx	%i7,	0x1666,	%i4
	fmovrdgez	%o2,	%f24,	%f6
	fmovrde	%g3,	%f8,	%f26
	array16	%g7,	%l3,	%i3
	fmovdpos	%xcc,	%f3,	%f17
	alignaddr	%i1,	%o0,	%g6
	fabsd	%f0,	%f12
	fmuld8ulx16	%f17,	%f6,	%f0
	edge8ln	%l4,	%l6,	%i0
	andn	%g2,	0x1CA3,	%g4
	movrgz	%o5,	0x37A,	%i5
	edge32l	%g1,	%i6,	%l2
	edge16	%o7,	%l1,	%l5
	st	%f24,	[%l7 + 0x30]
	fmovsneg	%icc,	%f8,	%f18
	movrgz	%o4,	0x3FC,	%o6
	sethi	0x03C8,	%l0
	smul	%o1,	0x13CC,	%o3
	edge16ln	%i2,	%i7,	%g5
	smulcc	%o2,	0x1A0F,	%g3
	subc	%i4,	0x0407,	%l3
	udivx	%g7,	0x02FC,	%i3
	smul	%o0,	%i1,	%g6
	srl	%l6,	%l4,	%i0
	array16	%g4,	%g2,	%i5
	array16	%g1,	%o5,	%l2
	fmovrde	%i6,	%f14,	%f12
	orcc	%l1,	0x1A59,	%o7
	umul	%l5,	0x1577,	%o6
	fandnot1s	%f4,	%f17,	%f25
	srlx	%l0,	0x1A,	%o4
	pdist	%f18,	%f28,	%f22
	edge16l	%o3,	%i2,	%i7
	ldsh	[%l7 + 0x2C],	%g5
	edge8n	%o2,	%g3,	%o1
	edge32	%i4,	%g7,	%i3
	ldub	[%l7 + 0x1A],	%l3
	movrne	%i1,	%g6,	%o0
	umulcc	%l4,	0x059A,	%i0
	edge16	%l6,	%g2,	%g4
	array16	%g1,	%o5,	%l2
	fpadd32	%f10,	%f12,	%f30
	lduw	[%l7 + 0x68],	%i5
	for	%f18,	%f14,	%f20
	edge32	%i6,	%l1,	%o7
	movre	%o6,	%l0,	%l5
	fsrc1	%f26,	%f8
	fcmpne16	%f22,	%f2,	%o4
	std	%f4,	[%l7 + 0x40]
	edge8ln	%o3,	%i7,	%g5
	movre	%i2,	0x145,	%g3
	edge8	%o2,	%i4,	%g7
	std	%f26,	[%l7 + 0x30]
	andn	%i3,	0x180D,	%o1
	ldsh	[%l7 + 0x6C],	%l3
	movneg	%xcc,	%g6,	%i1
	ldd	[%l7 + 0x28],	%l4
	movg	%xcc,	%o0,	%l6
	udivx	%g2,	0x16ED,	%i0
	movleu	%icc,	%g4,	%g1
	fmovdcc	%xcc,	%f7,	%f4
	fmovs	%f14,	%f31
	udiv	%l2,	0x1A78,	%i5
	movrne	%o5,	%i6,	%l1
	movle	%xcc,	%o7,	%l0
	subccc	%l5,	%o6,	%o3
	array16	%o4,	%i7,	%i2
	movcc	%icc,	%g5,	%g3
	fabss	%f5,	%f0
	std	%f30,	[%l7 + 0x30]
	movgu	%xcc,	%o2,	%g7
	orcc	%i4,	%o1,	%l3
	subcc	%g6,	0x153B,	%i3
	edge8ln	%l4,	%o0,	%i1
	xnor	%l6,	0x12D9,	%g2
	movgu	%xcc,	%g4,	%i0
	nop
	set	0x5A, %o5
	stb	%l2,	[%l7 + %o5]
	edge16ln	%g1,	%i5,	%o5
	sethi	0x020A,	%i6
	sethi	0x1AC8,	%l1
	movrgez	%l0,	0x076,	%o7
	umul	%o6,	0x0A68,	%o3
	xnor	%l5,	0x16EC,	%o4
	sdivcc	%i2,	0x19AC,	%g5
	andn	%g3,	0x1084,	%i7
	ldsw	[%l7 + 0x48],	%o2
	movrgez	%i4,	0x078,	%o1
	orcc	%g7,	%g6,	%i3
	edge8l	%l3,	%o0,	%l4
	sra	%l6,	0x06,	%i1
	srax	%g2,	0x1D,	%g4
	array16	%i0,	%g1,	%i5
	movn	%icc,	%l2,	%i6
	ldsh	[%l7 + 0x62],	%l1
	orcc	%o5,	%o7,	%o6
	addcc	%l0,	%l5,	%o3
	movleu	%icc,	%i2,	%g5
	umul	%g3,	%o4,	%o2
	movcs	%icc,	%i4,	%o1
	fmovdne	%icc,	%f8,	%f10
	fpsub16	%f10,	%f6,	%f2
	movneg	%xcc,	%i7,	%g7
	fmovdle	%xcc,	%f4,	%f29
	movrlz	%g6,	0x335,	%l3
	xnor	%i3,	%l4,	%o0
	ldd	[%l7 + 0x08],	%f0
	sllx	%l6,	%i1,	%g2
	movvs	%xcc,	%i0,	%g1
	sdivcc	%g4,	0x0B87,	%i5
	movl	%icc,	%l2,	%i6
	fxnors	%f21,	%f20,	%f30
	alignaddr	%l1,	%o5,	%o6
	fornot2	%f28,	%f2,	%f20
	array32	%o7,	%l0,	%l5
	movge	%icc,	%o3,	%g5
	movrgez	%g3,	0x248,	%i2
	fsrc1	%f30,	%f26
	st	%f17,	[%l7 + 0x50]
	udivcc	%o4,	0x1841,	%o2
	alignaddrl	%i4,	%o1,	%g7
	ldsh	[%l7 + 0x14],	%g6
	fcmple16	%f28,	%f8,	%l3
	umulcc	%i3,	0x1FC4,	%i7
	fmovsa	%icc,	%f25,	%f22
	umul	%l4,	%l6,	%o0
	ldub	[%l7 + 0x5B],	%i1
	subcc	%i0,	%g1,	%g2
	movre	%g4,	0x102,	%l2
	movcc	%xcc,	%i6,	%l1
	ldub	[%l7 + 0x4A],	%o5
	sllx	%o6,	%i5,	%o7
	ldsb	[%l7 + 0x6F],	%l0
	movpos	%xcc,	%o3,	%g5
	ldx	[%l7 + 0x50],	%l5
	nop
	set	0x5C, %l3
	ldsh	[%l7 + %l3],	%i2
	stb	%o4,	[%l7 + 0x32]
	movcs	%icc,	%g3,	%i4
	umulcc	%o1,	%g7,	%o2
	edge32l	%l3,	%g6,	%i7
	edge8l	%l4,	%i3,	%o0
	fmul8sux16	%f4,	%f2,	%f30
	mulx	%i1,	%l6,	%g1
	fcmpgt16	%f26,	%f22,	%g2
	edge8n	%g4,	%l2,	%i6
	fandnot2s	%f30,	%f19,	%f25
	fandnot1	%f4,	%f24,	%f24
	srl	%i0,	%l1,	%o5
	array8	%i5,	%o7,	%o6
	edge8	%o3,	%l0,	%g5
	smulcc	%i2,	%o4,	%g3
	edge8	%i4,	%o1,	%g7
	fsrc1s	%f15,	%f15
	mova	%icc,	%l5,	%l3
	sethi	0x0E9A,	%g6
	ldx	[%l7 + 0x50],	%o2
	fxnors	%f6,	%f16,	%f7
	nop
	set	0x30, %i0
	lduh	[%l7 + %i0],	%l4
	edge8	%i3,	%i7,	%i1
	edge8ln	%l6,	%g1,	%o0
	andn	%g2,	%g4,	%i6
	subccc	%l2,	0x0824,	%l1
	mova	%icc,	%i0,	%o5
	umul	%i5,	0x1CFB,	%o6
	fmovrslez	%o3,	%f11,	%f28
	sdivcc	%l0,	0x1C4E,	%g5
	restore %i2, %o4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f4,	%f21,	%f6
	fandnot1	%f30,	%f4,	%f8
	fandnot1s	%f25,	%f11,	%f27
	orn	%o7,	%i4,	%g7
	subc	%l5,	0x0C7E,	%o1
	ldx	[%l7 + 0x50],	%g6
	fmovdcc	%xcc,	%f18,	%f31
	movrne	%l3,	0x28D,	%o2
	movleu	%icc,	%l4,	%i3
	fabsd	%f30,	%f2
	fornot1	%f0,	%f24,	%f8
	fpadd16	%f30,	%f28,	%f10
	fmovse	%xcc,	%f3,	%f28
	fpsub32s	%f10,	%f4,	%f4
	lduh	[%l7 + 0x7C],	%i1
	movne	%icc,	%i7,	%g1
	andncc	%o0,	%g2,	%l6
	xnor	%i6,	0x12ED,	%l2
	ldx	[%l7 + 0x78],	%g4
	mova	%icc,	%l1,	%o5
	stw	%i5,	[%l7 + 0x54]
	fmovrslz	%o6,	%f1,	%f15
	stx	%o3,	[%l7 + 0x40]
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	add	%i2,	%o4,	%g3
	fpsub16s	%f2,	%f16,	%f9
	fpack16	%f6,	%f20
	orn	%o7,	0x0461,	%i4
	andcc	%g7,	%l5,	%o1
	edge32	%g6,	%o2,	%l4
	lduh	[%l7 + 0x76],	%l3
	umulcc	%i3,	0x01A8,	%i7
	ldsw	[%l7 + 0x68],	%i1
	save %o0, 0x1F60, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x30],	%g1
	movrgz	%i6,	%l2,	%g4
	bshuffle	%f8,	%f14,	%f4
	and	%l6,	%l1,	%o5
	fmuld8ulx16	%f30,	%f15,	%f10
	subcc	%o6,	%i5,	%i0
	xorcc	%o3,	%l0,	%g5
	fmovrsgez	%i2,	%f3,	%f6
	smul	%o4,	0x1805,	%g3
	udiv	%o7,	0x16D1,	%g7
	alignaddr	%l5,	%o1,	%i4
	fpmerge	%f1,	%f23,	%f12
	udivcc	%o2,	0x0DAE,	%l4
	fcmpne32	%f0,	%f20,	%g6
	ldd	[%l7 + 0x38],	%l2
	sllx	%i7,	0x10,	%i1
	andcc	%o0,	%i3,	%g2
	fmovrslez	%g1,	%f10,	%f27
	edge32	%i6,	%l2,	%g4
	subcc	%l6,	%l1,	%o5
	array8	%o6,	%i5,	%i0
	srlx	%l0,	0x0C,	%o3
	andn	%i2,	%g5,	%o4
	edge16n	%g3,	%o7,	%l5
	add	%g7,	%i4,	%o1
	xor	%o2,	%g6,	%l4
	edge16n	%i7,	%i1,	%l3
	edge32n	%o0,	%i3,	%g1
	addcc	%i6,	%g2,	%l2
	movg	%xcc,	%l6,	%l1
	sdivcc	%g4,	0x189A,	%o5
	ldd	[%l7 + 0x58],	%f8
	fcmpne16	%f22,	%f8,	%o6
	edge32	%i5,	%i0,	%l0
	fnot2s	%f0,	%f1
	fmovdg	%icc,	%f16,	%f31
	ldub	[%l7 + 0x1A],	%i2
	fand	%f18,	%f2,	%f16
	srl	%g5,	0x15,	%o3
	fmovsvc	%icc,	%f16,	%f9
	movge	%xcc,	%g3,	%o7
	lduh	[%l7 + 0x52],	%o4
	sll	%g7,	%l5,	%i4
	ldsb	[%l7 + 0x68],	%o1
	movrlz	%o2,	0x33C,	%l4
	lduw	[%l7 + 0x58],	%i7
	nop
	set	0x14, %l6
	lduh	[%l7 + %l6],	%g6
	udivcc	%i1,	0x11E0,	%l3
	ldsh	[%l7 + 0x64],	%i3
	edge32	%o0,	%g1,	%g2
	movrlz	%l2,	%l6,	%l1
	popc	%i6,	%o5
	lduw	[%l7 + 0x14],	%o6
	movge	%xcc,	%i5,	%g4
	std	%f16,	[%l7 + 0x78]
	movn	%xcc,	%l0,	%i0
	st	%f31,	[%l7 + 0x10]
	add	%g5,	0x1DE3,	%i2
	edge16ln	%g3,	%o3,	%o4
	st	%f3,	[%l7 + 0x44]
	edge32n	%o7,	%g7,	%l5
	array32	%o1,	%o2,	%l4
	edge32l	%i4,	%i7,	%i1
	movn	%xcc,	%l3,	%i3
	smulcc	%g6,	0x16D2,	%o0
	siam	0x2
	xnorcc	%g1,	0x101B,	%g2
	orn	%l2,	0x0FCB,	%l6
	udivcc	%l1,	0x00E5,	%o5
	edge16ln	%i6,	%i5,	%o6
	edge8n	%l0,	%g4,	%g5
	edge8n	%i0,	%i2,	%g3
	movle	%icc,	%o4,	%o3
	udiv	%g7,	0x1736,	%o7
	or	%o1,	%l5,	%l4
	edge8n	%i4,	%o2,	%i1
	movrgz	%i7,	0x3E6,	%i3
	edge16	%g6,	%l3,	%g1
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%o0
	pdist	%f30,	%f8,	%f24
	fmovsne	%xcc,	%f0,	%f11
	edge32l	%g2,	%l2,	%l1
	edge8l	%l6,	%o5,	%i6
	fpsub16	%f0,	%f18,	%f0
	movg	%icc,	%o6,	%l0
	alignaddrl	%i5,	%g4,	%i0
	movge	%icc,	%g5,	%i2
	ldsw	[%l7 + 0x38],	%o4
	std	%f28,	[%l7 + 0x58]
	fmovdl	%xcc,	%f8,	%f12
	umul	%g3,	%o3,	%o7
	stb	%g7,	[%l7 + 0x1A]
	fcmpeq16	%f4,	%f8,	%l5
	sll	%o1,	%i4,	%l4
	edge16	%o2,	%i1,	%i7
	fpsub32s	%f23,	%f4,	%f29
	subc	%i3,	%g6,	%g1
	array16	%o0,	%g2,	%l2
	sir	0x1A95
	fpsub32	%f10,	%f4,	%f6
	fmovrdlz	%l1,	%f2,	%f10
	subc	%l6,	%o5,	%i6
	movrne	%o6,	%l0,	%i5
	array16	%g4,	%l3,	%i0
	fpack32	%f22,	%f2,	%f2
	movn	%xcc,	%i2,	%o4
	ldsw	[%l7 + 0x08],	%g5
	ldsh	[%l7 + 0x2C],	%o3
	restore %g3, 0x10BA, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l5,	%g7
	movvc	%icc,	%i4,	%l4
	st	%f30,	[%l7 + 0x38]
	addccc	%o1,	%o2,	%i1
	fpack32	%f4,	%f14,	%f8
	fmovsvs	%xcc,	%f18,	%f1
	edge8l	%i7,	%g6,	%i3
	xnorcc	%g1,	0x1833,	%o0
	movrne	%g2,	%l2,	%l1
	smul	%l6,	0x02E8,	%i6
	orcc	%o5,	%o6,	%i5
	movrgz	%l0,	%l3,	%i0
	movleu	%icc,	%i2,	%g4
	array8	%g5,	%o3,	%o4
	fsrc2	%f2,	%f20
	fnegs	%f25,	%f17
	fmovsne	%icc,	%f19,	%f22
	sth	%g3,	[%l7 + 0x18]
	stb	%l5,	[%l7 + 0x57]
	movrne	%g7,	0x17A,	%i4
	sra	%l4,	0x0C,	%o7
	movgu	%icc,	%o2,	%i1
	stb	%i7,	[%l7 + 0x63]
	add	%g6,	%o1,	%g1
	xor	%i3,	0x1C7C,	%o0
	movrlez	%g2,	0x2AD,	%l2
	xnorcc	%l6,	0x13B3,	%i6
	movvc	%xcc,	%o5,	%o6
	movvs	%icc,	%i5,	%l0
	subc	%l1,	%i0,	%i2
	movrlz	%g4,	%l3,	%g5
	sdiv	%o4,	0x07B1,	%g3
	xnor	%l5,	0x0D24,	%g7
	xnorcc	%o3,	0x1581,	%l4
	lduw	[%l7 + 0x7C],	%i4
	stb	%o2,	[%l7 + 0x09]
	ldd	[%l7 + 0x60],	%f4
	fmovrsgez	%o7,	%f9,	%f5
	ldsw	[%l7 + 0x28],	%i1
	andn	%g6,	%o1,	%i7
	movleu	%icc,	%g1,	%o0
	fpack32	%f2,	%f22,	%f26
	movcs	%xcc,	%i3,	%l2
	movrlez	%l6,	0x2C0,	%i6
	sdiv	%g2,	0x1312,	%o5
	edge32	%o6,	%l0,	%i5
	fmovse	%xcc,	%f15,	%f26
	smul	%i0,	0x1A0B,	%i2
	movcs	%icc,	%l1,	%l3
	stb	%g4,	[%l7 + 0x5B]
	movg	%xcc,	%o4,	%g5
	movvc	%icc,	%g3,	%g7
	movvs	%xcc,	%l5,	%o3
	bshuffle	%f28,	%f4,	%f0
	sth	%l4,	[%l7 + 0x6E]
	fpack16	%f10,	%f14
	srl	%i4,	0x0F,	%o2
	movvs	%xcc,	%i1,	%o7
	mulx	%o1,	%g6,	%i7
	sdiv	%g1,	0x066E,	%i3
	andncc	%o0,	%l6,	%l2
	edge8n	%g2,	%i6,	%o5
	edge32n	%o6,	%i5,	%l0
	fmul8sux16	%f26,	%f16,	%f12
	movgu	%icc,	%i0,	%i2
	andcc	%l1,	%l3,	%o4
	edge8l	%g4,	%g3,	%g7
	fxors	%f15,	%f14,	%f24
	udivcc	%l5,	0x1150,	%o3
	edge8ln	%g5,	%l4,	%o2
	save %i4, %i1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f26,	%f19
	stb	%g6,	[%l7 + 0x5A]
	sth	%i7,	[%l7 + 0x7E]
	subcc	%g1,	%o1,	%o0
	smul	%i3,	0x1712,	%l6
	ld	[%l7 + 0x30],	%f14
	addccc	%l2,	0x12F4,	%g2
	fmovrdgez	%i6,	%f20,	%f2
	ldub	[%l7 + 0x30],	%o6
	orcc	%o5,	%l0,	%i5
	fmovrslz	%i0,	%f1,	%f2
	ld	[%l7 + 0x08],	%f9
	ld	[%l7 + 0x38],	%f25
	movcc	%xcc,	%l1,	%l3
	edge16n	%i2,	%g4,	%o4
	sth	%g3,	[%l7 + 0x20]
	fxor	%f8,	%f6,	%f6
	fcmps	%fcc2,	%f8,	%f4
	sdivcc	%l5,	0x01BF,	%o3
	fnot2s	%f0,	%f3
	sth	%g5,	[%l7 + 0x6E]
	edge16	%g7,	%l4,	%o2
	fmovrdlez	%i1,	%f24,	%f16
	movvs	%xcc,	%o7,	%i4
	movrlez	%i7,	0x2F5,	%g1
	xnorcc	%g6,	%o1,	%o0
	orcc	%i3,	%l6,	%g2
	addccc	%i6,	%l2,	%o6
	lduw	[%l7 + 0x38],	%l0
	edge8n	%i5,	%i0,	%l1
	xor	%o5,	0x1865,	%l3
	srax	%g4,	0x0E,	%o4
	edge16l	%g3,	%l5,	%i2
	addccc	%o3,	0x1D4D,	%g5
	fmovsn	%xcc,	%f9,	%f12
	and	%g7,	0x077D,	%o2
	edge16	%i1,	%l4,	%o7
	ldx	[%l7 + 0x40],	%i4
	ldsh	[%l7 + 0x5A],	%i7
	array32	%g1,	%g6,	%o1
	array32	%o0,	%l6,	%i3
	smul	%g2,	0x0C2C,	%l2
	sth	%o6,	[%l7 + 0x0A]
	array16	%l0,	%i5,	%i6
	udivx	%l1,	0x0121,	%i0
	edge16ln	%l3,	%o5,	%g4
	edge32ln	%o4,	%g3,	%i2
	movcs	%icc,	%l5,	%g5
	fexpand	%f13,	%f14
	fmovdl	%icc,	%f19,	%f23
	fnands	%f13,	%f26,	%f25
	sir	0x10D1
	edge8n	%o3,	%o2,	%i1
	and	%l4,	%g7,	%o7
	add	%i7,	%i4,	%g6
	edge16n	%o1,	%o0,	%l6
	edge16	%g1,	%i3,	%g2
	addc	%l2,	0x0A5A,	%l0
	movge	%xcc,	%o6,	%i6
	xorcc	%i5,	%l1,	%l3
	movvs	%icc,	%o5,	%g4
	movneg	%xcc,	%i0,	%g3
	udivcc	%i2,	0x10F3,	%l5
	array16	%g5,	%o4,	%o2
	and	%o3,	%i1,	%g7
	fxor	%f18,	%f16,	%f16
	movrgz	%l4,	%i7,	%i4
	fnegd	%f14,	%f22
	fpadd16	%f26,	%f24,	%f28
	fpsub32s	%f26,	%f27,	%f1
	movn	%icc,	%o7,	%o1
	fands	%f24,	%f1,	%f28
	movneg	%xcc,	%o0,	%l6
	movl	%xcc,	%g6,	%i3
	fmovsleu	%xcc,	%f30,	%f6
	sll	%g1,	%l2,	%l0
	fmovrdgz	%o6,	%f8,	%f8
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	or	%i6,	%l3,	%l1
	edge8ln	%o5,	%i0,	%g4
	udiv	%i2,	0x0B5D,	%l5
	stx	%g5,	[%l7 + 0x28]
	or	%g3,	0x18AC,	%o2
	sdivx	%o3,	0x1E5C,	%i1
	edge32	%g7,	%l4,	%i7
	fandnot2	%f22,	%f18,	%f8
	movpos	%xcc,	%o4,	%i4
	movrlez	%o7,	0x30E,	%o1
	mulx	%l6,	%o0,	%g6
	addc	%i3,	%l2,	%g1
	fmovdne	%xcc,	%f19,	%f0
	fmuld8sux16	%f8,	%f0,	%f30
	fmovrdlz	%o6,	%f10,	%f4
	sethi	0x0D37,	%l0
	std	%f24,	[%l7 + 0x60]
	udiv	%i5,	0x07FB,	%i6
	sdiv	%l3,	0x10AE,	%l1
	movvc	%icc,	%o5,	%i0
	add	%g4,	%i2,	%l5
	andncc	%g2,	%g3,	%g5
	movgu	%icc,	%o3,	%o2
	fmovdpos	%icc,	%f25,	%f5
	xorcc	%g7,	%l4,	%i7
	ldub	[%l7 + 0x49],	%i1
	save %o4, %i4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l6,	[%l7 + 0x28]
	movgu	%xcc,	%o0,	%o1
	edge8	%i3,	%g6,	%l2
	edge8	%g1,	%l0,	%i5
	ldd	[%l7 + 0x40],	%i6
	smulcc	%o6,	0x16ED,	%l1
	fmul8x16	%f12,	%f20,	%f16
	smul	%l3,	%i0,	%o5
	movneg	%icc,	%g4,	%i2
	fmuld8ulx16	%f20,	%f21,	%f0
	fmovscs	%xcc,	%f14,	%f16
	udiv	%g2,	0x0FD8,	%l5
	array8	%g3,	%o3,	%o2
	movneg	%icc,	%g5,	%l4
	array8	%i7,	%g7,	%i1
	sub	%o4,	%o7,	%l6
	restore %o0, 0x188C, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o1,	%i3,	%g6
	fmovrslez	%l2,	%f22,	%f9
	fzeros	%f5
	bshuffle	%f6,	%f8,	%f6
	sdiv	%l0,	0x06B6,	%g1
	ld	[%l7 + 0x78],	%f19
	sllx	%i5,	0x00,	%o6
	andncc	%i6,	%l1,	%l3
	xnorcc	%o5,	%i0,	%i2
	nop
	set	0x50, %i7
	stx	%g2,	[%l7 + %i7]
	sra	%g4,	%l5,	%o3
	fmovsleu	%xcc,	%f0,	%f3
	andcc	%g3,	%o2,	%l4
	and	%g5,	0x19D0,	%g7
	fmovdle	%icc,	%f15,	%f17
	sra	%i7,	%o4,	%i1
	edge16n	%o7,	%o0,	%l6
	movneg	%icc,	%i4,	%i3
	umulcc	%o1,	0x0038,	%g6
	std	%f18,	[%l7 + 0x28]
	fmovsl	%icc,	%f1,	%f9
	xorcc	%l0,	%g1,	%i5
	fmovsl	%xcc,	%f1,	%f5
	stb	%l2,	[%l7 + 0x5C]
	ldd	[%l7 + 0x30],	%i6
	fmovrsgez	%o6,	%f12,	%f10
	fxors	%f1,	%f9,	%f6
	alignaddrl	%l1,	%o5,	%l3
	fnands	%f10,	%f17,	%f3
	orn	%i0,	0x1D5D,	%g2
	fmovse	%xcc,	%f24,	%f11
	udivcc	%i2,	0x127F,	%l5
	lduh	[%l7 + 0x14],	%g4
	edge8	%o3,	%g3,	%o2
	movn	%xcc,	%g5,	%g7
	edge8n	%l4,	%i7,	%i1
	ldsw	[%l7 + 0x54],	%o4
	movvc	%icc,	%o7,	%o0
	xor	%l6,	0x10C0,	%i3
	movne	%xcc,	%i4,	%g6
	lduw	[%l7 + 0x44],	%o1
	edge8ln	%g1,	%l0,	%l2
	fcmpne16	%f10,	%f24,	%i6
	udivx	%i5,	0x141E,	%o6
	ldd	[%l7 + 0x60],	%f4
	lduh	[%l7 + 0x3C],	%o5
	fornot1s	%f11,	%f2,	%f5
	popc	0x01F1,	%l1
	fcmpne32	%f20,	%f24,	%i0
	sra	%l3,	0x11,	%i2
	movrne	%g2,	0x3D1,	%g4
	ld	[%l7 + 0x5C],	%f23
	sdiv	%l5,	0x1228,	%g3
	edge32l	%o3,	%g5,	%g7
	fmovsle	%xcc,	%f4,	%f5
	orn	%l4,	0x1341,	%o2
	edge32l	%i7,	%i1,	%o7
	edge16	%o0,	%l6,	%o4
	sra	%i3,	%g6,	%i4
	ld	[%l7 + 0x38],	%f18
	fnegd	%f28,	%f2
	movleu	%icc,	%o1,	%g1
	fmovdle	%xcc,	%f0,	%f18
	movcs	%xcc,	%l0,	%l2
	movgu	%xcc,	%i6,	%i5
	subcc	%o6,	%l1,	%o5
	edge16l	%i0,	%l3,	%g2
	subccc	%i2,	%g4,	%l5
	ldd	[%l7 + 0x68],	%g2
	movpos	%xcc,	%o3,	%g7
	addccc	%g5,	0x1AF0,	%o2
	fpsub16	%f18,	%f8,	%f24
	movgu	%xcc,	%i7,	%l4
	udivx	%i1,	0x06C9,	%o7
	sethi	0x061B,	%l6
	movl	%xcc,	%o0,	%i3
	addccc	%g6,	%i4,	%o1
	fpsub16	%f22,	%f12,	%f14
	xnor	%g1,	0x16EF,	%l0
	lduw	[%l7 + 0x38],	%l2
	sethi	0x016B,	%i6
	sdivcc	%o4,	0x1E65,	%o6
	edge8l	%i5,	%l1,	%i0
	srlx	%o5,	0x13,	%g2
	movle	%xcc,	%l3,	%g4
	xorcc	%i2,	%l5,	%g3
	subccc	%g7,	0x1687,	%g5
	sdivcc	%o3,	0x0674,	%i7
	fmovsa	%icc,	%f11,	%f24
	fmovrslz	%o2,	%f30,	%f5
	andcc	%i1,	%l4,	%l6
	stw	%o0,	[%l7 + 0x20]
	edge16l	%o7,	%i3,	%g6
	edge16ln	%i4,	%g1,	%o1
	array32	%l0,	%i6,	%l2
	udivcc	%o4,	0x1947,	%i5
	udiv	%o6,	0x18D3,	%i0
	movrlez	%l1,	0x02F,	%g2
	fmovscc	%icc,	%f20,	%f13
	array16	%l3,	%g4,	%o5
	orcc	%l5,	%g3,	%i2
	movl	%icc,	%g5,	%o3
	mulscc	%g7,	0x1403,	%i7
	andcc	%i1,	0x1E65,	%o2
	fornot1	%f18,	%f22,	%f24
	sdiv	%l6,	0x00A5,	%o0
	srl	%l4,	0x14,	%i3
	movrne	%g6,	%i4,	%o7
	array16	%g1,	%o1,	%i6
	fmovdge	%icc,	%f14,	%f29
	fmovscc	%icc,	%f10,	%f1
	fmovsgu	%xcc,	%f8,	%f14
	fmovrsgz	%l0,	%f30,	%f4
	fpack16	%f18,	%f24
	udiv	%l2,	0x11E4,	%o4
	fcmped	%fcc3,	%f8,	%f22
	xor	%o6,	%i0,	%l1
	movl	%xcc,	%i5,	%l3
	ldx	[%l7 + 0x30],	%g2
	movvc	%icc,	%g4,	%o5
	addcc	%l5,	%i2,	%g5
	umul	%o3,	0x0772,	%g3
	smul	%g7,	0x0392,	%i7
	sethi	0x0B8E,	%o2
	nop
	set	0x08, %l0
	stx	%i1,	[%l7 + %l0]
	addcc	%l6,	%o0,	%l4
	st	%f18,	[%l7 + 0x34]
	movrne	%g6,	0x1FF,	%i4
	movleu	%xcc,	%i3,	%g1
	ldsw	[%l7 + 0x1C],	%o1
	lduw	[%l7 + 0x5C],	%o7
	ldsh	[%l7 + 0x64],	%i6
	fpsub32	%f2,	%f6,	%f4
	ldsw	[%l7 + 0x5C],	%l2
	movleu	%xcc,	%l0,	%o6
	xor	%o4,	%l1,	%i5
	sllx	%i0,	0x0E,	%g2
	lduw	[%l7 + 0x2C],	%l3
	edge8	%o5,	%g4,	%l5
	and	%i2,	0x1357,	%g5
	bshuffle	%f10,	%f22,	%f6
	ldsb	[%l7 + 0x25],	%o3
	ldx	[%l7 + 0x70],	%g7
	movrlez	%i7,	0x1C9,	%g3
	mova	%icc,	%o2,	%l6
	stb	%o0,	[%l7 + 0x6A]
	movrgez	%i1,	0x3A9,	%g6
	fmovdcs	%xcc,	%f31,	%f23
	movrgz	%i4,	%l4,	%i3
	ld	[%l7 + 0x48],	%f4
	subc	%o1,	0x1AE6,	%g1
	fornot2	%f22,	%f18,	%f24
	sdiv	%o7,	0x0358,	%l2
	nop
	set	0x6E, %l2
	sth	%i6,	[%l7 + %l2]
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%f14
	fandnot2s	%f9,	%f26,	%f5
	movgu	%xcc,	%o6,	%l0
	orcc	%l1,	0x089F,	%o4
	movrlz	%i0,	%i5,	%g2
	sethi	0x184B,	%l3
	addcc	%o5,	0x0007,	%l5
	edge16n	%g4,	%i2,	%g5
	stx	%g7,	[%l7 + 0x40]
	ldsh	[%l7 + 0x70],	%o3
	movvs	%xcc,	%g3,	%o2
	fone	%f26
	ldd	[%l7 + 0x70],	%i6
	udiv	%i7,	0x0C93,	%o0
	sdiv	%g6,	0x1409,	%i1
	xnor	%l4,	0x0B3F,	%i3
	orncc	%o1,	%i4,	%o7
	fcmpne32	%f26,	%f20,	%l2
	fmovsge	%xcc,	%f14,	%f1
	and	%i6,	%g1,	%l0
	edge32l	%l1,	%o4,	%i0
	andcc	%i5,	%g2,	%l3
	movleu	%xcc,	%o6,	%l5
	udivcc	%o5,	0x0FE1,	%i2
	movge	%icc,	%g5,	%g7
	edge8n	%g4,	%o3,	%g3
	umul	%o2,	0x0038,	%i7
	movn	%icc,	%o0,	%l6
	srlx	%i1,	%l4,	%g6
	add	%i3,	%i4,	%o7
	fmovsvc	%xcc,	%f5,	%f17
	stb	%l2,	[%l7 + 0x0A]
	siam	0x4
	movrne	%o1,	%g1,	%i6
	ldsw	[%l7 + 0x08],	%l0
	popc	0x026B,	%o4
	sdivx	%i0,	0x1845,	%l1
	sth	%i5,	[%l7 + 0x7E]
	fmovsne	%xcc,	%f7,	%f29
	movvc	%xcc,	%g2,	%o6
	edge16l	%l5,	%o5,	%i2
	xnorcc	%g5,	%g7,	%l3
	edge8n	%g4,	%o3,	%g3
	edge8	%o2,	%i7,	%l6
	ldub	[%l7 + 0x6A],	%i1
	edge8	%o0,	%g6,	%i3
	movrgz	%l4,	%i4,	%l2
	fzeros	%f27
	fandnot2s	%f11,	%f28,	%f27
	fpsub32s	%f27,	%f18,	%f2
	stb	%o1,	[%l7 + 0x26]
	st	%f2,	[%l7 + 0x70]
	sub	%o7,	0x1A81,	%g1
	movne	%icc,	%l0,	%o4
	ldsh	[%l7 + 0x4A],	%i0
	subc	%l1,	%i6,	%i5
	umul	%o6,	%g2,	%l5
	sll	%i2,	%g5,	%g7
	fandnot2s	%f30,	%f7,	%f31
	ldsh	[%l7 + 0x3A],	%o5
	fmovsa	%icc,	%f1,	%f20
	edge16	%g4,	%o3,	%l3
	edge32	%o2,	%g3,	%i7
	save %l6, %i1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f10,	%f8,	%f0
	sethi	0x1E59,	%i3
	edge32ln	%g6,	%l4,	%i4
	addccc	%o1,	%l2,	%g1
	fnors	%f4,	%f27,	%f27
	ldsh	[%l7 + 0x4E],	%o7
	movn	%icc,	%o4,	%l0
	movleu	%xcc,	%i0,	%l1
	addcc	%i5,	%i6,	%g2
	popc	%l5,	%i2
	ldsb	[%l7 + 0x7E],	%o6
	ldd	[%l7 + 0x58],	%g4
	save %g7, %g4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l3,	0x19D1,	%o5
	xnor	%g3,	0x0F1F,	%i7
	srl	%l6,	0x16,	%i1
	mulscc	%o0,	%i3,	%o2
	udivcc	%g6,	0x0D36,	%l4
	ldub	[%l7 + 0x19],	%o1
	movrgz	%l2,	%i4,	%g1
	popc	%o7,	%o4
	sdivx	%l0,	0x045F,	%i0
	fandnot2	%f16,	%f10,	%f18
	addcc	%i5,	0x10FF,	%l1
	lduw	[%l7 + 0x48],	%i6
	ldsh	[%l7 + 0x7A],	%g2
	movvc	%icc,	%i2,	%o6
	ldd	[%l7 + 0x08],	%f26
	movle	%icc,	%g5,	%l5
	andncc	%g4,	%g7,	%l3
	fcmple16	%f16,	%f30,	%o3
	edge32	%o5,	%g3,	%l6
	edge16n	%i1,	%o0,	%i3
	fmovdg	%xcc,	%f9,	%f4
	xnor	%i7,	%o2,	%g6
	movvs	%icc,	%o1,	%l2
	orcc	%l4,	%g1,	%o7
	edge8n	%o4,	%i4,	%i0
	or	%i5,	0x1B6C,	%l0
	edge16ln	%l1,	%i6,	%g2
	fornot1	%f8,	%f20,	%f26
	std	%f16,	[%l7 + 0x18]
	sir	0x0D92
	xnorcc	%o6,	0x19A1,	%i2
	popc	0x15B6,	%l5
	andncc	%g5,	%g4,	%g7
	fcmpgt16	%f12,	%f16,	%l3
	ldub	[%l7 + 0x2B],	%o5
	sra	%o3,	0x0E,	%g3
	xnor	%i1,	0x0DFD,	%o0
	alignaddr	%i3,	%i7,	%l6
	movcc	%xcc,	%g6,	%o1
	movrne	%o2,	%l4,	%l2
	fmovsvc	%icc,	%f27,	%f25
	sir	0x1F70
	fpsub16	%f14,	%f16,	%f2
	subc	%g1,	0x0F7D,	%o4
	movrlz	%o7,	0x21E,	%i4
	sdivcc	%i5,	0x1E4C,	%l0
	fnegs	%f10,	%f15
	movcs	%xcc,	%l1,	%i6
	movvs	%xcc,	%i0,	%g2
	edge32l	%o6,	%l5,	%i2
	movrne	%g5,	0x006,	%g4
	nop
	set	0x72, %g5
	sth	%g7,	[%l7 + %g5]
	edge32	%l3,	%o5,	%g3
	edge16ln	%i1,	%o3,	%i3
	udivcc	%i7,	0x186E,	%o0
	fexpand	%f17,	%f4
	edge16ln	%l6,	%o1,	%o2
	fornot2s	%f4,	%f31,	%f7
	udivcc	%g6,	0x05B2,	%l4
	edge16ln	%g1,	%o4,	%o7
	fsrc2s	%f9,	%f21
	or	%l2,	%i4,	%i5
	stx	%l1,	[%l7 + 0x60]
	ldub	[%l7 + 0x48],	%i6
	edge16l	%l0,	%g2,	%o6
	movpos	%xcc,	%l5,	%i2
	movrlez	%i0,	%g5,	%g4
	fpmerge	%f8,	%f3,	%f30
	ldsw	[%l7 + 0x10],	%l3
	subcc	%o5,	%g3,	%i1
	fmovsle	%icc,	%f19,	%f4
	fmovrsgez	%o3,	%f25,	%f20
	orn	%i3,	%g7,	%i7
	fexpand	%f3,	%f6
	edge32l	%o0,	%o1,	%l6
	movrne	%o2,	%g6,	%l4
	udivcc	%g1,	0x1A3C,	%o7
	alignaddrl	%o4,	%i4,	%i5
	edge16l	%l2,	%i6,	%l1
	ldsh	[%l7 + 0x1E],	%l0
	sdiv	%g2,	0x193C,	%l5
	stx	%i2,	[%l7 + 0x48]
	udivx	%o6,	0x188F,	%g5
	movrlez	%i0,	%g4,	%l3
	xorcc	%o5,	%g3,	%o3
	subccc	%i3,	%g7,	%i1
	ldsh	[%l7 + 0x44],	%i7
	fpsub32s	%f21,	%f19,	%f9
	ldd	[%l7 + 0x50],	%f24
	subc	%o0,	%o1,	%o2
	or	%g6,	0x0949,	%l6
	movre	%l4,	0x3EE,	%o7
	edge16ln	%g1,	%i4,	%i5
	nop
	set	0x0C, %g6
	ldsw	[%l7 + %g6],	%o4
	edge16l	%l2,	%i6,	%l0
	fpackfix	%f22,	%f9
	smul	%l1,	0x0B90,	%g2
	edge8l	%i2,	%l5,	%o6
	orn	%i0,	%g5,	%g4
	srl	%l3,	%o5,	%g3
	movn	%icc,	%i3,	%o3
	array16	%i1,	%i7,	%g7
	edge16l	%o0,	%o1,	%o2
	udivx	%l6,	0x1567,	%g6
	orcc	%l4,	0x1091,	%g1
	fmul8ulx16	%f6,	%f28,	%f22
	sdivcc	%i4,	0x0E05,	%i5
	edge8l	%o7,	%l2,	%o4
	edge16n	%l0,	%i6,	%g2
	fmovdn	%xcc,	%f10,	%f3
	andn	%l1,	0x1B42,	%l5
	smulcc	%i2,	%o6,	%i0
	st	%f5,	[%l7 + 0x78]
	movgu	%xcc,	%g5,	%l3
	movne	%xcc,	%o5,	%g4
	ldd	[%l7 + 0x08],	%g2
	ldub	[%l7 + 0x21],	%o3
	ldsw	[%l7 + 0x6C],	%i3
	stb	%i1,	[%l7 + 0x74]
	ldsb	[%l7 + 0x74],	%i7
	alignaddr	%o0,	%g7,	%o1
	fmovrsgz	%o2,	%f19,	%f22
	fxnor	%f8,	%f4,	%f0
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	sub	%g1,	%i4,	%i5
	xor	%g6,	0x07E9,	%l2
	fmovrslez	%o7,	%f9,	%f6
	lduw	[%l7 + 0x20],	%l0
	fabsd	%f0,	%f24
	fandnot2	%f4,	%f12,	%f30
	stb	%o4,	[%l7 + 0x73]
	array32	%g2,	%l1,	%l5
	sub	%i2,	0x01D4,	%i6
	movcc	%icc,	%i0,	%g5
	stb	%o6,	[%l7 + 0x78]
	fnands	%f9,	%f26,	%f11
	sdivcc	%o5,	0x0D91,	%g4
	ldx	[%l7 + 0x78],	%g3
	restore %o3, 0x0AB8, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l3,	0x1C02,	%i1
	fpack32	%f30,	%f6,	%f30
	xorcc	%o0,	%i7,	%o1
	orncc	%o2,	0x1F0B,	%l6
	edge8ln	%l4,	%g7,	%g1
	edge16ln	%i5,	%i4,	%l2
	subccc	%g6,	%o7,	%o4
	movrgez	%g2,	%l0,	%l5
	sir	0x0B20
	std	%f18,	[%l7 + 0x58]
	movneg	%xcc,	%l1,	%i6
	fandnot2	%f30,	%f0,	%f24
	srl	%i0,	%i2,	%o6
	fexpand	%f16,	%f20
	fmovsvs	%xcc,	%f1,	%f24
	bshuffle	%f20,	%f28,	%f12
	alignaddr	%o5,	%g4,	%g3
	umulcc	%g5,	0x0F58,	%i3
	popc	%o3,	%i1
	sdiv	%l3,	0x06E8,	%o0
	fmovs	%f12,	%f22
	edge8ln	%o1,	%o2,	%i7
	fmovscs	%icc,	%f21,	%f4
	movrne	%l6,	%g7,	%g1
	fandnot2s	%f29,	%f3,	%f15
	ldsb	[%l7 + 0x75],	%i5
	ldsw	[%l7 + 0x68],	%i4
	movne	%xcc,	%l4,	%g6
	ldsb	[%l7 + 0x29],	%o7
	sdivcc	%l2,	0x0999,	%g2
	movcc	%icc,	%l0,	%l5
	fmovdl	%xcc,	%f16,	%f18
	edge8	%o4,	%l1,	%i0
	xorcc	%i2,	0x099B,	%o6
	edge32	%o5,	%i6,	%g3
	movl	%xcc,	%g5,	%i3
	xor	%g4,	0x1D12,	%o3
	fmovdleu	%icc,	%f10,	%f7
	edge16	%l3,	%i1,	%o1
	xnorcc	%o0,	%i7,	%o2
	sethi	0x176C,	%g7
	fmovsleu	%icc,	%f10,	%f26
	movg	%icc,	%g1,	%l6
	smulcc	%i5,	0x19C4,	%l4
	movrlz	%g6,	%o7,	%l2
	andncc	%g2,	%i4,	%l0
	array8	%l5,	%l1,	%o4
	andn	%i2,	0x1600,	%o6
	movcs	%icc,	%i0,	%i6
	edge8n	%o5,	%g3,	%i3
	ldsh	[%l7 + 0x24],	%g4
	edge32n	%g5,	%o3,	%i1
	fmovsvc	%xcc,	%f0,	%f25
	edge16	%l3,	%o1,	%o0
	movleu	%icc,	%i7,	%o2
	stx	%g7,	[%l7 + 0x18]
	sdivx	%g1,	0x1E62,	%i5
	fpadd16	%f16,	%f28,	%f8
	fcmple16	%f14,	%f16,	%l6
	fcmple16	%f12,	%f10,	%g6
	srlx	%l4,	0x17,	%o7
	edge8ln	%g2,	%l2,	%l0
	fone	%f4
	mulscc	%i4,	%l5,	%l1
	addcc	%o4,	%o6,	%i0
	movvs	%xcc,	%i6,	%o5
	orncc	%i2,	%i3,	%g4
	movpos	%xcc,	%g5,	%g3
	stb	%i1,	[%l7 + 0x2D]
	fnors	%f29,	%f5,	%f9
	faligndata	%f30,	%f2,	%f12
	sth	%l3,	[%l7 + 0x0E]
	movcc	%xcc,	%o1,	%o0
	fmovdcs	%xcc,	%f13,	%f5
	addccc	%i7,	%o2,	%o3
	addc	%g1,	0x065A,	%g7
	edge16n	%l6,	%i5,	%g6
	fpadd16s	%f15,	%f11,	%f12
	array8	%o7,	%g2,	%l2
	mova	%xcc,	%l0,	%l4
	movn	%icc,	%i4,	%l5
	array16	%o4,	%l1,	%i0
	sdivx	%o6,	0x06F4,	%o5
	nop
	set	0x70, %o2
	lduw	[%l7 + %o2],	%i6
	fone	%f12
	fpadd32s	%f15,	%f26,	%f0
	mulx	%i2,	0x16F9,	%g4
	fornot2	%f28,	%f0,	%f30
	alignaddrl	%i3,	%g5,	%i1
	stb	%g3,	[%l7 + 0x2C]
	fmul8x16au	%f22,	%f6,	%f26
	umulcc	%o1,	0x1543,	%o0
	save %l3, 0x0382, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i7,	%o3,	%g7
	edge8ln	%l6,	%g1,	%i5
	fnot1s	%f14,	%f4
	fxnors	%f3,	%f12,	%f8
	ldd	[%l7 + 0x28],	%f12
	movrlez	%o7,	%g6,	%l2
	array32	%l0,	%l4,	%i4
	ldsw	[%l7 + 0x48],	%g2
	sdivx	%o4,	0x0E3F,	%l1
	fpsub16	%f14,	%f26,	%f16
	fones	%f20
	xor	%i0,	0x1B60,	%o6
	movcc	%icc,	%o5,	%i6
	array8	%l5,	%g4,	%i2
	fmovrslz	%i3,	%f1,	%f14
	movre	%i1,	0x214,	%g5
	orcc	%o1,	0x1D8D,	%o0
	andncc	%l3,	%o2,	%g3
	smul	%o3,	%i7,	%g7
	movge	%xcc,	%g1,	%i5
	movvs	%xcc,	%l6,	%o7
	srl	%l2,	0x01,	%g6
	orn	%l0,	%l4,	%i4
	alignaddrl	%o4,	%g2,	%l1
	subccc	%i0,	0x1EAF,	%o6
	movvc	%xcc,	%i6,	%o5
	movle	%icc,	%g4,	%l5
	stw	%i2,	[%l7 + 0x14]
	xor	%i3,	%g5,	%o1
	pdist	%f30,	%f30,	%f8
	sra	%i1,	0x0C,	%o0
	stw	%l3,	[%l7 + 0x20]
	movrne	%o2,	0x3A8,	%o3
	fornot2	%f0,	%f30,	%f4
	mulx	%g3,	0x0B7C,	%i7
	ldd	[%l7 + 0x30],	%g0
	fnor	%f30,	%f24,	%f8
	array16	%g7,	%i5,	%o7
	ldsw	[%l7 + 0x10],	%l6
	movgu	%icc,	%g6,	%l2
	udivcc	%l4,	0x1C7D,	%l0
	sll	%o4,	0x1A,	%g2
	faligndata	%f22,	%f6,	%f12
	stb	%l1,	[%l7 + 0x71]
	fnors	%f17,	%f19,	%f7
	nop
	set	0x38, %g7
	std	%f16,	[%l7 + %g7]
	sub	%i0,	0x0868,	%i4
	edge8l	%o6,	%i6,	%o5
	andncc	%l5,	%i2,	%g4
	udivx	%i3,	0x0D8E,	%o1
	fmovrse	%g5,	%f9,	%f10
	for	%f30,	%f22,	%f22
	ldx	[%l7 + 0x20],	%i1
	udiv	%o0,	0x16B8,	%l3
	smulcc	%o2,	%o3,	%g3
	fnegs	%f2,	%f25
	addccc	%g1,	0x127F,	%g7
	fandnot1s	%f18,	%f3,	%f19
	array16	%i7,	%i5,	%l6
	umulcc	%o7,	0x1D0C,	%g6
	fmovscs	%icc,	%f15,	%f28
	udivcc	%l2,	0x1739,	%l0
	stw	%o4,	[%l7 + 0x48]
	sdivx	%l4,	0x1691,	%l1
	xnor	%i0,	0x0EAB,	%g2
	fmovsleu	%xcc,	%f7,	%f29
	fone	%f28
	nop
	set	0x10, %o0
	stw	%o6,	[%l7 + %o0]
	popc	0x1938,	%i6
	edge8ln	%i4,	%l5,	%i2
	addc	%o5,	0x06AC,	%i3
	orcc	%g4,	%g5,	%i1
	movge	%xcc,	%o1,	%o0
	movl	%xcc,	%l3,	%o2
	fmovdge	%xcc,	%f19,	%f0
	array8	%o3,	%g1,	%g3
	fornot1	%f0,	%f8,	%f0
	fcmped	%fcc2,	%f30,	%f20
	ld	[%l7 + 0x7C],	%f10
	movne	%icc,	%i7,	%g7
	umul	%l6,	%i5,	%g6
	edge16	%o7,	%l2,	%o4
	fmovrse	%l0,	%f20,	%f19
	movrlz	%l4,	%i0,	%l1
	fmovdle	%xcc,	%f11,	%f15
	stx	%o6,	[%l7 + 0x60]
	edge32ln	%g2,	%i4,	%l5
	fmul8ulx16	%f30,	%f4,	%f16
	movneg	%xcc,	%i6,	%i2
	subccc	%o5,	%i3,	%g5
	fsrc1	%f18,	%f14
	st	%f22,	[%l7 + 0x7C]
	addccc	%g4,	0x03B4,	%i1
	movrgz	%o0,	0x2D6,	%l3
	lduh	[%l7 + 0x6A],	%o1
	xnorcc	%o2,	%g1,	%g3
	ldsw	[%l7 + 0x68],	%i7
	subccc	%o3,	%l6,	%g7
	ldd	[%l7 + 0x70],	%f10
	array32	%g6,	%i5,	%o7
	fornot1s	%f30,	%f10,	%f25
	fmovdge	%xcc,	%f13,	%f24
	edge16n	%l2,	%o4,	%l0
	movpos	%icc,	%i0,	%l4
	umulcc	%o6,	0x1042,	%l1
	edge32ln	%i4,	%l5,	%g2
	sub	%i2,	0x1A4B,	%i6
	andncc	%i3,	%o5,	%g5
	edge32n	%g4,	%o0,	%i1
	fzeros	%f7
	fcmpes	%fcc2,	%f10,	%f6
	st	%f19,	[%l7 + 0x50]
	array8	%l3,	%o2,	%g1
	sdiv	%o1,	0x0124,	%i7
	fmovsvs	%xcc,	%f13,	%f4
	movge	%xcc,	%g3,	%l6
	fmovs	%f22,	%f12
	addc	%g7,	0x1DF4,	%o3
	fnor	%f12,	%f0,	%f0
	subc	%g6,	0x0EC4,	%i5
	ldsb	[%l7 + 0x60],	%o7
	mulscc	%l2,	%l0,	%o4
	fabss	%f15,	%f23
	movvs	%xcc,	%i0,	%l4
	xor	%l1,	0x1FCE,	%i4
	popc	%o6,	%g2
	movrlz	%l5,	0x0DE,	%i6
	movre	%i3,	%o5,	%i2
	movl	%icc,	%g4,	%g5
	fmovrslez	%i1,	%f12,	%f5
	movg	%xcc,	%l3,	%o2
	fabsd	%f0,	%f20
	nop
	set	0x40, %i3
	stx	%o0,	[%l7 + %i3]
	fmovsgu	%icc,	%f17,	%f1
	edge16n	%g1,	%i7,	%g3
	popc	%l6,	%g7
	array16	%o3,	%o1,	%g6
	add	%i5,	%l2,	%l0
	edge8ln	%o7,	%o4,	%i0
	movle	%xcc,	%l4,	%l1
	andcc	%i4,	0x05D7,	%g2
	std	%f12,	[%l7 + 0x40]
	edge16	%l5,	%i6,	%o6
	smul	%o5,	%i2,	%i3
	movrlz	%g4,	0x1EF,	%i1
	movgu	%xcc,	%l3,	%o2
	movneg	%xcc,	%g5,	%o0
	fandnot2s	%f17,	%f21,	%f7
	movre	%i7,	0x1E0,	%g3
	movvc	%xcc,	%l6,	%g7
	edge8	%g1,	%o1,	%g6
	sra	%o3,	%i5,	%l2
	and	%l0,	%o7,	%i0
	fmul8sux16	%f20,	%f20,	%f6
	ldd	[%l7 + 0x20],	%f0
	ldsb	[%l7 + 0x3E],	%l4
	stx	%o4,	[%l7 + 0x58]
	fsrc2	%f2,	%f10
	ldub	[%l7 + 0x48],	%i4
	siam	0x3
	movne	%xcc,	%g2,	%l1
	lduh	[%l7 + 0x76],	%l5
	ldub	[%l7 + 0x64],	%o6
	sethi	0x0128,	%i6
	fmovdvc	%icc,	%f9,	%f30
	srlx	%i2,	%i3,	%g4
	sdiv	%i1,	0x1252,	%l3
	movneg	%icc,	%o2,	%g5
	udivcc	%o0,	0x1796,	%o5
	movrgz	%i7,	0x13A,	%l6
	andcc	%g7,	0x0CBD,	%g1
	orncc	%g3,	%o1,	%o3
	st	%f1,	[%l7 + 0x58]
	add	%g6,	%l2,	%i5
	move	%xcc,	%o7,	%l0
	and	%l4,	0x0A49,	%i0
	sth	%i4,	[%l7 + 0x30]
	fsrc2s	%f22,	%f18
	andn	%g2,	0x1F44,	%l1
	movneg	%xcc,	%l5,	%o4
	movcs	%xcc,	%i6,	%o6
	edge8n	%i2,	%i3,	%g4
	std	%f2,	[%l7 + 0x08]
	mova	%icc,	%i1,	%o2
	movgu	%icc,	%l3,	%g5
	srlx	%o5,	%o0,	%i7
	fmovrse	%l6,	%f13,	%f9
	pdist	%f4,	%f2,	%f26
	edge16n	%g7,	%g1,	%o1
	stx	%g3,	[%l7 + 0x28]
	umulcc	%o3,	%g6,	%i5
	fsrc1	%f14,	%f28
	movcs	%xcc,	%l2,	%l0
	movvs	%icc,	%o7,	%i0
	edge8	%i4,	%g2,	%l1
	movle	%icc,	%l4,	%l5
	sdiv	%o4,	0x1871,	%o6
	and	%i2,	%i6,	%g4
	fmul8ulx16	%f30,	%f24,	%f12
	movg	%xcc,	%i1,	%o2
	fmovda	%icc,	%f0,	%f3
	fabsd	%f30,	%f16
	edge32l	%i3,	%g5,	%o5
	smulcc	%l3,	%o0,	%i7
	stw	%l6,	[%l7 + 0x18]
	edge32ln	%g1,	%o1,	%g3
	movle	%xcc,	%g7,	%g6
	ldx	[%l7 + 0x40],	%i5
	fcmple16	%f0,	%f14,	%l2
	subccc	%o3,	%l0,	%o7
	ld	[%l7 + 0x74],	%f10
	movneg	%xcc,	%i0,	%i4
	edge8	%g2,	%l4,	%l1
	fmovdvs	%icc,	%f26,	%f27
	edge8ln	%l5,	%o4,	%i2
	fmovde	%icc,	%f31,	%f9
	srlx	%o6,	%g4,	%i6
	sll	%i1,	%o2,	%g5
	movg	%icc,	%o5,	%i3
	edge16	%l3,	%i7,	%l6
	orcc	%o0,	%g1,	%g3
	mulx	%g7,	0x0662,	%o1
	fmovdle	%xcc,	%f2,	%f20
	ldd	[%l7 + 0x38],	%g6
	faligndata	%f14,	%f12,	%f2
	addccc	%i5,	0x0A9F,	%o3
	fmovscs	%icc,	%f4,	%f20
	fmovrslez	%l2,	%f24,	%f31
	edge32n	%o7,	%i0,	%l0
	udivx	%i4,	0x09F7,	%g2
	xorcc	%l4,	%l1,	%l5
	sir	0x0DC1
	srax	%o4,	0x05,	%i2
	alignaddrl	%g4,	%i6,	%i1
	ldd	[%l7 + 0x60],	%f28
	addcc	%o6,	0x0E56,	%o2
	addccc	%g5,	0x0191,	%i3
	fmovd	%f26,	%f8
	fnot1s	%f20,	%f6
	fpadd16	%f24,	%f18,	%f26
	nop
	set	0x3A, %o4
	lduh	[%l7 + %o4],	%l3
	fmovspos	%xcc,	%f29,	%f3
	smulcc	%o5,	0x11A1,	%l6
	movrlz	%o0,	%g1,	%g3
	ldsb	[%l7 + 0x1F],	%i7
	std	%f20,	[%l7 + 0x70]
	lduw	[%l7 + 0x68],	%o1
	edge16n	%g6,	%i5,	%g7
	or	%o3,	0x0C2D,	%l2
	stw	%i0,	[%l7 + 0x14]
	sethi	0x1335,	%o7
	fnegs	%f31,	%f5
	subcc	%i4,	0x1269,	%l0
	stb	%l4,	[%l7 + 0x5B]
	movre	%g2,	0x3AE,	%l5
	xnorcc	%o4,	0x16B1,	%i2
	sdivcc	%g4,	0x1D0E,	%l1
	ldsb	[%l7 + 0x6F],	%i6
	fmovda	%xcc,	%f23,	%f6
	mova	%xcc,	%o6,	%i1
	movrne	%g5,	%o2,	%i3
	fmovse	%icc,	%f5,	%f22
	srl	%l3,	0x02,	%o5
	edge32ln	%l6,	%o0,	%g1
	movl	%xcc,	%g3,	%o1
	mulx	%i7,	0x1EA4,	%i5
	fmovspos	%icc,	%f24,	%f29
	addc	%g6,	%o3,	%g7
	mova	%xcc,	%i0,	%l2
	fmovspos	%icc,	%f2,	%f7
	ldx	[%l7 + 0x48],	%i4
	movne	%icc,	%l0,	%o7
	movrlz	%g2,	0x25F,	%l5
	subcc	%o4,	%i2,	%l4
	fandnot1	%f6,	%f28,	%f30
	fsrc1s	%f8,	%f31
	fcmpne32	%f8,	%f10,	%g4
	stx	%i6,	[%l7 + 0x70]
	ld	[%l7 + 0x4C],	%f12
	edge8	%o6,	%i1,	%g5
	subccc	%l1,	%o2,	%l3
	stb	%i3,	[%l7 + 0x54]
	edge16n	%l6,	%o5,	%g1
	orcc	%g3,	0x09F7,	%o1
	move	%icc,	%o0,	%i7
	subccc	%i5,	%o3,	%g6
	andcc	%i0,	%l2,	%i4
	edge16n	%g7,	%o7,	%g2
	fandnot2	%f28,	%f18,	%f22
	edge32l	%l0,	%o4,	%l5
	sth	%l4,	[%l7 + 0x52]
	sllx	%g4,	0x04,	%i6
	movvc	%icc,	%i2,	%i1
	fzeros	%f3
	xor	%o6,	%g5,	%l1
	fpsub16s	%f17,	%f4,	%f26
	umulcc	%l3,	0x0EF3,	%i3
	edge8l	%o2,	%o5,	%g1
	subccc	%l6,	0x1247,	%o1
	lduh	[%l7 + 0x0A],	%o0
	move	%xcc,	%i7,	%g3
	sra	%i5,	%g6,	%o3
	umulcc	%l2,	0x1E47,	%i0
	ldd	[%l7 + 0x20],	%g6
	andncc	%o7,	%i4,	%g2
	fmovrse	%o4,	%f25,	%f15
	edge8ln	%l0,	%l4,	%g4
	save %l5, %i2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i6,	%o6,	%g5
	ldsh	[%l7 + 0x18],	%l3
	edge32	%i3,	%l1,	%o2
	mova	%xcc,	%g1,	%o5
	fmovsneg	%icc,	%f29,	%f23
	fmovrslez	%o1,	%f13,	%f4
	ld	[%l7 + 0x1C],	%f31
	ldsw	[%l7 + 0x70],	%l6
	udivx	%o0,	0x1436,	%i7
	ldsh	[%l7 + 0x46],	%i5
	movvc	%xcc,	%g6,	%o3
	movg	%icc,	%g3,	%l2
	sir	0x0EF0
	edge8n	%i0,	%o7,	%i4
	fcmple16	%f22,	%f14,	%g2
	xorcc	%g7,	%l0,	%o4
	xnorcc	%g4,	%l5,	%l4
	movpos	%icc,	%i1,	%i6
	ldsb	[%l7 + 0x60],	%o6
	add	%i2,	%l3,	%g5
	stx	%l1,	[%l7 + 0x08]
	fpsub32s	%f12,	%f20,	%f20
	lduh	[%l7 + 0x62],	%i3
	udivx	%o2,	0x06DF,	%g1
	fexpand	%f31,	%f28
	addccc	%o5,	0x1104,	%l6
	ldsw	[%l7 + 0x48],	%o1
	xorcc	%i7,	%i5,	%o0
	and	%o3,	%g3,	%g6
	ldsw	[%l7 + 0x28],	%l2
	fmovsneg	%icc,	%f30,	%f26
	array32	%o7,	%i0,	%g2
	edge16l	%i4,	%l0,	%o4
	movrne	%g7,	%l5,	%l4
	stb	%g4,	[%l7 + 0x77]
	ldsw	[%l7 + 0x38],	%i6
	subcc	%i1,	%o6,	%l3
	udivcc	%i2,	0x1C97,	%g5
	lduh	[%l7 + 0x6E],	%l1
	smul	%o2,	0x15C0,	%i3
	sub	%o5,	0x058C,	%l6
	andcc	%o1,	%i7,	%g1
	fsrc1	%f18,	%f0
	fmovdge	%xcc,	%f3,	%f5
	andn	%i5,	0x1487,	%o3
	movg	%icc,	%o0,	%g6
	movpos	%icc,	%g3,	%l2
	movvs	%icc,	%o7,	%g2
	nop
	set	0x70, %i1
	stx	%i4,	[%l7 + %i1]
	orcc	%l0,	%i0,	%o4
	edge16l	%g7,	%l5,	%g4
	movre	%i6,	%i1,	%o6
	edge8ln	%l3,	%l4,	%g5
	mova	%icc,	%i2,	%l1
	sth	%o2,	[%l7 + 0x66]
	edge8ln	%i3,	%o5,	%l6
	add	%o1,	0x0270,	%g1
	movl	%icc,	%i7,	%o3
	nop
	set	0x54, %i5
	stw	%o0,	[%l7 + %i5]
	mova	%xcc,	%i5,	%g6
	sdiv	%g3,	0x071F,	%o7
	subc	%l2,	%i4,	%l0
	array32	%i0,	%o4,	%g7
	movgu	%xcc,	%g2,	%g4
	movle	%xcc,	%i6,	%i1
	movvc	%xcc,	%o6,	%l5
	fnor	%f4,	%f26,	%f10
	fmovs	%f3,	%f27
	fmovsleu	%xcc,	%f9,	%f10
	movre	%l3,	%g5,	%l4
	smul	%i2,	0x15D4,	%l1
	sdivcc	%o2,	0x0C0C,	%o5
	fcmpes	%fcc3,	%f28,	%f13
	alignaddr	%i3,	%o1,	%l6
	fmovdg	%xcc,	%f1,	%f10
	stx	%g1,	[%l7 + 0x10]
	mulx	%o3,	0x0FBE,	%o0
	movvs	%xcc,	%i7,	%g6
	fcmpeq32	%f6,	%f26,	%g3
	srlx	%o7,	0x0D,	%i5
	move	%icc,	%i4,	%l0
	fmovdpos	%xcc,	%f17,	%f24
	edge8ln	%l2,	%o4,	%g7
	stx	%i0,	[%l7 + 0x10]
	edge32ln	%g4,	%i6,	%i1
	edge16n	%g2,	%l5,	%l3
	srlx	%o6,	0x14,	%l4
	fmovdle	%xcc,	%f18,	%f7
	alignaddr	%g5,	%i2,	%o2
	fcmpgt16	%f28,	%f28,	%l1
	subccc	%i3,	%o5,	%l6
	fmovsl	%xcc,	%f2,	%f18
	lduw	[%l7 + 0x20],	%o1
	or	%o3,	0x09EB,	%g1
	movn	%icc,	%i7,	%g6
	subc	%g3,	%o0,	%i5
	bshuffle	%f14,	%f10,	%f24
	movneg	%icc,	%o7,	%l0
	udivx	%l2,	0x0D32,	%i4
	for	%f2,	%f0,	%f6
	nop
	set	0x58, %o3
	std	%f2,	[%l7 + %o3]
	subcc	%g7,	0x1858,	%o4
	sllx	%g4,	%i6,	%i0
	fcmpgt16	%f18,	%f22,	%i1
	movgu	%icc,	%g2,	%l5
	ld	[%l7 + 0x40],	%f27
	or	%o6,	%l4,	%l3
	fcmpes	%fcc0,	%f14,	%f25
	ldub	[%l7 + 0x2F],	%i2
	movgu	%icc,	%g5,	%o2
	movvc	%icc,	%i3,	%o5
	movneg	%icc,	%l6,	%l1
	sdiv	%o1,	0x1B2A,	%g1
	srax	%o3,	0x08,	%i7
	movle	%icc,	%g6,	%o0
	movleu	%xcc,	%g3,	%o7
	addc	%l0,	%i5,	%i4
	fabss	%f10,	%f8
	orncc	%g7,	0x1EB1,	%o4
	sll	%l2,	0x0F,	%i6
	xor	%g4,	%i0,	%g2
	sdivx	%l5,	0x14C7,	%i1
	ldd	[%l7 + 0x60],	%f6
	edge8	%l4,	%o6,	%l3
	udivx	%g5,	0x19C5,	%i2
	subc	%o2,	0x0777,	%o5
	xorcc	%l6,	%i3,	%o1
	sir	0x0327
	std	%f30,	[%l7 + 0x10]
	fsrc2	%f26,	%f6
	umulcc	%g1,	0x19F3,	%o3
	xor	%l1,	%i7,	%o0
	ldx	[%l7 + 0x18],	%g3
	edge16n	%o7,	%g6,	%i5
	and	%i4,	%g7,	%o4
	edge32ln	%l2,	%l0,	%i6
	ldx	[%l7 + 0x78],	%i0
	fmovrdlez	%g4,	%f4,	%f18
	edge16n	%g2,	%i1,	%l5
	andncc	%l4,	%o6,	%g5
	movne	%xcc,	%i2,	%o2
	smulcc	%o5,	%l6,	%i3
	sub	%l3,	0x1A7F,	%g1
	movl	%icc,	%o3,	%o1
	fnot1s	%f12,	%f31
	movvc	%xcc,	%l1,	%i7
	stb	%g3,	[%l7 + 0x2F]
	stx	%o7,	[%l7 + 0x38]
	andn	%o0,	%g6,	%i5
	ldx	[%l7 + 0x30],	%g7
	sdivcc	%o4,	0x084D,	%i4
	addcc	%l0,	%i6,	%l2
	sdiv	%g4,	0x090C,	%g2
	edge8l	%i0,	%i1,	%l5
	fmovdne	%icc,	%f6,	%f25
	subc	%l4,	0x1D1E,	%o6
	edge8n	%g5,	%i2,	%o5
	xorcc	%l6,	%i3,	%l3
	fmovspos	%icc,	%f27,	%f26
	edge32l	%g1,	%o3,	%o1
	sdiv	%l1,	0x160C,	%i7
	save %o2, 0x171F, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%o0,	%g6
	fors	%f24,	%f21,	%f3
	movg	%xcc,	%i5,	%g3
	sll	%g7,	0x15,	%i4
	movge	%xcc,	%o4,	%i6
	movrne	%l2,	%l0,	%g2
	mova	%icc,	%g4,	%i0
	orn	%l5,	%l4,	%i1
	fornot2	%f6,	%f18,	%f12
	xnor	%o6,	%g5,	%o5
	ld	[%l7 + 0x34],	%f6
	edge16l	%i2,	%i3,	%l3
	movrgz	%g1,	0x188,	%l6
	edge8	%o1,	%o3,	%l1
	movl	%xcc,	%i7,	%o7
	movl	%xcc,	%o0,	%o2
	ldd	[%l7 + 0x28],	%i4
	nop
	set	0x18, %l5
	stw	%g6,	[%l7 + %l5]
	edge8	%g7,	%g3,	%o4
	fmul8x16au	%f28,	%f31,	%f18
	nop
	set	0x40, %g1
	ldx	[%l7 + %g1],	%i4
	movle	%icc,	%l2,	%l0
	faligndata	%f0,	%f28,	%f8
	ldd	[%l7 + 0x60],	%f16
	sra	%g2,	0x1A,	%i6
	movn	%icc,	%g4,	%i0
	movvc	%xcc,	%l5,	%i1
	smul	%l4,	%g5,	%o5
	srax	%i2,	0x19,	%i3
	edge16l	%l3,	%o6,	%g1
	mulscc	%o1,	%l6,	%o3
	fnot1	%f20,	%f30
	xnor	%l1,	0x0CFC,	%i7
	nop
	set	0x70, %o6
	ldx	[%l7 + %o6],	%o0
	sdivx	%o2,	0x195E,	%o7
	movrlez	%i5,	%g6,	%g7
	orncc	%o4,	%i4,	%l2
	lduw	[%l7 + 0x44],	%g3
	mova	%icc,	%l0,	%g2
	sdivcc	%g4,	0x038B,	%i0
	movcc	%icc,	%l5,	%i6
	udiv	%i1,	0x1FCA,	%l4
	fmovrde	%g5,	%f10,	%f20
	alignaddrl	%o5,	%i2,	%l3
	alignaddrl	%i3,	%o6,	%g1
	fmovspos	%xcc,	%f24,	%f19
	movne	%icc,	%o1,	%l6
	lduw	[%l7 + 0x3C],	%l1
	ldsb	[%l7 + 0x23],	%i7
	movneg	%xcc,	%o3,	%o0
	sdivx	%o2,	0x0502,	%o7
	lduh	[%l7 + 0x2A],	%g6
	movrgz	%g7,	%i5,	%i4
	orcc	%l2,	0x0586,	%o4
	udiv	%g3,	0x0A32,	%l0
	sub	%g2,	0x008E,	%i0
	subc	%g4,	%i6,	%i1
	fpadd16	%f8,	%f30,	%f14
	array32	%l4,	%l5,	%o5
	ld	[%l7 + 0x14],	%f20
	orncc	%g5,	0x0D26,	%i2
	or	%l3,	%i3,	%o6
	umulcc	%o1,	%g1,	%l1
	save %l6, 0x0FAB, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o3,	0x262,	%o2
	fones	%f5
	edge8l	%o0,	%g6,	%o7
	subcc	%i5,	0x0001,	%i4
	edge32	%g7,	%o4,	%l2
	st	%f14,	[%l7 + 0x3C]
	edge16l	%l0,	%g2,	%g3
	fand	%f12,	%f2,	%f14
	xnorcc	%i0,	0x1CCC,	%i6
	umulcc	%i1,	%g4,	%l4
	movgu	%xcc,	%o5,	%l5
	save %i2, 0x146A, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i3,	%l3
	movrgz	%o6,	0x357,	%g1
	orncc	%o1,	0x129B,	%l6
	srlx	%i7,	0x19,	%l1
	xorcc	%o2,	%o3,	%g6
	fandnot1	%f16,	%f26,	%f14
	add	%o0,	%i5,	%o7
	xnorcc	%g7,	%o4,	%i4
	fnors	%f17,	%f8,	%f6
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	fmul8ulx16	%f26,	%f30,	%f10
	save %g2, %i0, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%i6,	%g4
	xnorcc	%i1,	%o5,	%l4
	ldd	[%l7 + 0x50],	%i2
	array32	%g5,	%l5,	%l3
	lduw	[%l7 + 0x2C],	%i3
	lduw	[%l7 + 0x7C],	%o6
	fnot1	%f20,	%f12
	addcc	%g1,	%l6,	%o1
	sdivcc	%l1,	0x1D67,	%i7
	or	%o3,	0x17D5,	%g6
	udivcc	%o0,	0x0133,	%o2
	sir	0x1BE3
	fors	%f3,	%f17,	%f16
	movrne	%i5,	%g7,	%o7
	sir	0x1513
	movvc	%xcc,	%o4,	%l2
	umul	%i4,	%g2,	%i0
	edge32ln	%l0,	%i6,	%g4
	edge8l	%i1,	%o5,	%g3
	edge8	%i2,	%g5,	%l4
	movrgz	%l5,	%l3,	%o6
	umul	%g1,	0x1204,	%l6
	subcc	%i3,	%o1,	%i7
	edge16n	%o3,	%g6,	%l1
	mulx	%o0,	%o2,	%g7
	fmul8x16	%f19,	%f28,	%f6
	stw	%o7,	[%l7 + 0x54]
	ldsb	[%l7 + 0x4F],	%o4
	fmovrdgz	%i5,	%f2,	%f14
	subcc	%i4,	%g2,	%i0
	mulx	%l2,	%l0,	%g4
	bshuffle	%f12,	%f24,	%f2
	fmovdg	%xcc,	%f0,	%f21
	fcmple16	%f24,	%f20,	%i6
	andcc	%o5,	%g3,	%i1
	movge	%icc,	%i2,	%g5
	edge16ln	%l4,	%l5,	%l3
	fabss	%f9,	%f12
	fzeros	%f25
	array16	%o6,	%g1,	%i3
	restore %l6, 0x1ADE, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o3,	%i7,	%l1
	sir	0x0F26
	edge8n	%g6,	%o2,	%g7
	udiv	%o0,	0x1E45,	%o4
	movre	%o7,	%i4,	%g2
	movvc	%xcc,	%i0,	%i5
	movvs	%icc,	%l0,	%l2
	fmul8ulx16	%f22,	%f2,	%f2
	fmovrse	%g4,	%f17,	%f5
	edge8ln	%o5,	%i6,	%g3
	fmovspos	%xcc,	%f6,	%f12
	pdist	%f2,	%f22,	%f10
	and	%i2,	%i1,	%l4
	fornot1s	%f11,	%f8,	%f18
	movrgez	%l5,	0x3E4,	%g5
	fandnot2	%f26,	%f12,	%f0
	fcmpes	%fcc0,	%f25,	%f13
	movne	%icc,	%l3,	%o6
	subc	%g1,	0x1DF4,	%l6
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	srax	%i7,	%l1,	%o3
	fmovsn	%icc,	%f23,	%f6
	edge16n	%o2,	%g7,	%g6
	xnorcc	%o4,	0x0391,	%o0
	for	%f8,	%f10,	%f4
	edge16	%i4,	%g2,	%o7
	edge32ln	%i5,	%i0,	%l0
	fands	%f20,	%f30,	%f17
	andncc	%l2,	%g4,	%i6
	lduh	[%l7 + 0x0E],	%o5
	addc	%i2,	0x1F5F,	%g3
	movleu	%xcc,	%l4,	%l5
	array16	%i1,	%l3,	%g5
	umul	%g1,	0x02EA,	%l6
	movrgez	%o1,	0x315,	%i3
	edge16n	%o6,	%i7,	%o3
	smul	%l1,	0x0B48,	%o2
	movrlz	%g7,	0x389,	%g6
	st	%f14,	[%l7 + 0x70]
	fxnor	%f10,	%f24,	%f16
	fmovsl	%xcc,	%f23,	%f12
	add	%o0,	%o4,	%i4
	st	%f17,	[%l7 + 0x34]
	add	%o7,	0x142C,	%g2
	array8	%i5,	%i0,	%l2
	nop
	set	0x14, %g3
	sth	%g4,	[%l7 + %g3]
	fcmpeq16	%f14,	%f12,	%l0
	array8	%i6,	%o5,	%g3
	std	%f6,	[%l7 + 0x70]
	movrlz	%i2,	0x3DB,	%l4
	udivx	%l5,	0x1DFD,	%l3
	and	%g5,	%g1,	%l6
	fnands	%f21,	%f31,	%f3
	fmovdpos	%icc,	%f11,	%f8
	ldub	[%l7 + 0x50],	%o1
	orn	%i1,	%i3,	%o6
	subc	%i7,	%o3,	%l1
	subc	%g7,	0x1D1A,	%o2
	popc	0x0049,	%o0
	movre	%g6,	0x0BA,	%o4
	stx	%i4,	[%l7 + 0x30]
	edge8n	%g2,	%o7,	%i0
	lduh	[%l7 + 0x12],	%i5
	fmovrslz	%g4,	%f15,	%f19
	fpack32	%f6,	%f14,	%f16
	fnor	%f12,	%f20,	%f0
	fmovda	%icc,	%f15,	%f29
	lduh	[%l7 + 0x46],	%l0
	edge16l	%l2,	%o5,	%g3
	movcs	%xcc,	%i2,	%i6
	fxnors	%f18,	%f21,	%f12
	edge8	%l5,	%l3,	%l4
	edge32n	%g1,	%g5,	%o1
	fmovse	%icc,	%f28,	%f25
	nop
	set	0x48, %i2
	stx	%l6,	[%l7 + %i2]
	fpsub16	%f6,	%f10,	%f10
	xor	%i3,	%i1,	%i7
	movrgz	%o6,	%o3,	%l1
	orcc	%g7,	%o2,	%o0
	fands	%f5,	%f30,	%f16
	alignaddr	%g6,	%o4,	%i4
	edge32n	%o7,	%g2,	%i5
	stb	%i0,	[%l7 + 0x42]
	edge8	%l0,	%g4,	%o5
	fpack16	%f10,	%f7
	lduh	[%l7 + 0x36],	%l2
	alignaddrl	%g3,	%i6,	%i2
	stb	%l5,	[%l7 + 0x4F]
	udivx	%l3,	0x04AE,	%g1
	srl	%g5,	%l4,	%l6
	movcc	%icc,	%o1,	%i3
	ld	[%l7 + 0x1C],	%f26
	edge32ln	%i1,	%o6,	%i7
	ldsb	[%l7 + 0x0F],	%o3
	edge16ln	%l1,	%g7,	%o0
	array16	%g6,	%o4,	%o2
	orn	%o7,	0x0E3E,	%g2
	movrne	%i4,	0x217,	%i5
	sdiv	%l0,	0x0A1B,	%g4
	sdivx	%i0,	0x059A,	%o5
	sub	%l2,	%i6,	%i2
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%l4
	fmovdleu	%icc,	%f25,	%f4
	fmovrdne	%l3,	%f14,	%f12
	xor	%g1,	0x1D9B,	%g3
	movvc	%icc,	%l4,	%g5
	andcc	%o1,	0x121A,	%i3
	add	%i1,	%l6,	%i7
	sll	%o3,	0x1D,	%o6
	edge8n	%g7,	%l1,	%g6
	fnor	%f20,	%f10,	%f20
	smul	%o0,	0x1BA4,	%o2
	edge32n	%o7,	%o4,	%g2
	edge16l	%i4,	%l0,	%i5
	alignaddrl	%i0,	%o5,	%l2
	sllx	%i6,	0x1C,	%i2
	subccc	%l5,	%l3,	%g1
	andcc	%g4,	%g3,	%l4
	edge16n	%o1,	%i3,	%i1
	ldsw	[%l7 + 0x70],	%l6
	edge32n	%g5,	%o3,	%i7
	subc	%g7,	%l1,	%g6
	array16	%o0,	%o2,	%o6
	restore %o7, %o4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g2,	%l0,	%i0
	smulcc	%i5,	%o5,	%l2
	fpadd32s	%f23,	%f19,	%f16
	srlx	%i2,	%i6,	%l5
	subc	%g1,	%l3,	%g3
	ldx	[%l7 + 0x78],	%g4
	fpadd16s	%f17,	%f0,	%f29
	srl	%l4,	%i3,	%i1
	sir	0x16D6
	fpmerge	%f3,	%f2,	%f0
	edge32l	%o1,	%g5,	%o3
	nop
	set	0x14, %o1
	lduw	[%l7 + %o1],	%i7
	movgu	%icc,	%l6,	%l1
	edge32	%g7,	%o0,	%g6
	fandnot2	%f10,	%f10,	%f10
	nop
	set	0x48, %i4
	stb	%o6,	[%l7 + %i4]
	fmovsne	%icc,	%f10,	%f18
	movrlz	%o7,	0x1E9,	%o2
	andncc	%i4,	%o4,	%g2
	lduh	[%l7 + 0x36],	%l0
	movgu	%xcc,	%i5,	%i0
	fmovdl	%icc,	%f30,	%f12
	alignaddrl	%l2,	%o5,	%i2
	addcc	%l5,	%i6,	%g1
	edge8	%g3,	%g4,	%l4
	edge32l	%i3,	%i1,	%l3
	movgu	%xcc,	%o1,	%g5
	sll	%o3,	0x13,	%i7
	sethi	0x0605,	%l1
	popc	0x0C01,	%l6
	edge8ln	%o0,	%g7,	%g6
	and	%o7,	%o2,	%i4
	fmovrsgz	%o4,	%f23,	%f26
	movrlez	%o6,	%l0,	%g2
	ldd	[%l7 + 0x10],	%i0
	fxor	%f0,	%f4,	%f14
	smul	%i5,	%l2,	%o5
	movleu	%xcc,	%i2,	%i6
	or	%l5,	0x1B65,	%g3
	subc	%g1,	0x036A,	%l4
	fmovdle	%icc,	%f18,	%f16
	srlx	%i3,	0x1E,	%i1
	fmovse	%xcc,	%f25,	%f6
	movg	%xcc,	%l3,	%g4
	fmul8ulx16	%f4,	%f10,	%f22
	orcc	%g5,	0x0281,	%o1
	fmovrslez	%o3,	%f31,	%f6
	srlx	%l1,	0x0F,	%i7
	movrgez	%l6,	%o0,	%g7
	movvs	%icc,	%o7,	%o2
	udivcc	%i4,	0x048E,	%g6
	stw	%o4,	[%l7 + 0x24]
	array16	%l0,	%o6,	%i0
	movne	%xcc,	%i5,	%l2
	move	%xcc,	%o5,	%i2
	move	%xcc,	%g2,	%l5
	array32	%i6,	%g1,	%l4
	fpadd32s	%f1,	%f14,	%f7
	movg	%xcc,	%g3,	%i3
	movrlez	%i1,	0x034,	%l3
	mulscc	%g4,	%g5,	%o1
	stb	%l1,	[%l7 + 0x0F]
	and	%o3,	%i7,	%o0
	sub	%g7,	%o7,	%o2
	movcs	%xcc,	%i4,	%g6
	sub	%l6,	0x145F,	%o4
	addcc	%o6,	0x007C,	%i0
	sub	%i5,	0x1DCF,	%l2
	ld	[%l7 + 0x34],	%f12
	fmovdge	%icc,	%f15,	%f25
	fmovrsne	%o5,	%f18,	%f6
	fnand	%f14,	%f16,	%f14
	xnorcc	%i2,	%l0,	%g2
	movrne	%i6,	%g1,	%l5
	fmuld8sux16	%f21,	%f10,	%f12
	sethi	0x1C50,	%l4
	xorcc	%i3,	0x1776,	%g3
	edge16l	%l3,	%g4,	%i1
	edge8n	%g5,	%l1,	%o3
	edge8ln	%o1,	%i7,	%o0
	movrlez	%g7,	%o2,	%i4
	fmovrde	%o7,	%f28,	%f28
	stx	%g6,	[%l7 + 0x10]
	fmul8ulx16	%f14,	%f18,	%f10
	sth	%l6,	[%l7 + 0x58]
	fand	%f28,	%f26,	%f12
	mulscc	%o6,	%o4,	%i5
	sllx	%l2,	0x0A,	%i0
	edge32l	%o5,	%i2,	%g2
	udivcc	%l0,	0x0C9F,	%g1
	subc	%l5,	%l4,	%i6
	fmul8x16au	%f11,	%f29,	%f8
	smul	%i3,	%l3,	%g3
	edge32n	%g4,	%i1,	%g5
	edge32	%l1,	%o1,	%o3
	fandnot2	%f2,	%f10,	%f22
	xnorcc	%o0,	0x12B2,	%i7
	udiv	%g7,	0x1881,	%i4
	fnor	%f10,	%f30,	%f14
	movrgz	%o7,	%g6,	%l6
	andn	%o6,	%o2,	%i5
	move	%icc,	%o4,	%l2
	stx	%o5,	[%l7 + 0x08]
	fmovsleu	%icc,	%f26,	%f19
	sdiv	%i0,	0x0472,	%i2
	sllx	%l0,	0x0F,	%g2
	orn	%g1,	0x1C2C,	%l5
	movg	%xcc,	%l4,	%i6
	xorcc	%l3,	0x0E6A,	%i3
	edge8l	%g4,	%g3,	%i1
	fnors	%f16,	%f12,	%f27
	alignaddrl	%l1,	%g5,	%o1
	ldub	[%l7 + 0x3A],	%o3
	sra	%i7,	0x0F,	%g7
	movneg	%xcc,	%i4,	%o7
	ldd	[%l7 + 0x50],	%g6
	ldub	[%l7 + 0x0C],	%o0
	fcmpes	%fcc2,	%f13,	%f12
	siam	0x5
	xor	%l6,	%o6,	%o2
	addc	%o4,	0x0EE2,	%i5
	sdivx	%l2,	0x0B55,	%i0
	mulx	%o5,	0x039B,	%i2
	lduh	[%l7 + 0x68],	%g2
	stx	%g1,	[%l7 + 0x10]
	ldsb	[%l7 + 0x79],	%l5
	movvs	%xcc,	%l4,	%i6
	sir	0x1025
	movvs	%xcc,	%l3,	%i3
	orn	%g4,	0x0842,	%l0
	nop
	set	0x3C, %l4
	ldsb	[%l7 + %l4],	%i1
	andcc	%l1,	0x0B48,	%g5
	save %g3, 0x187C, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i7,	%g7,	%i4
	movrgz	%o3,	%g6,	%o7
	alignaddrl	%o0,	%l6,	%o2
	bshuffle	%f6,	%f20,	%f28
	edge32ln	%o6,	%i5,	%o4
	sdivcc	%l2,	0x0CB5,	%o5
	addc	%i0,	%i2,	%g1
	movne	%xcc,	%l5,	%g2
	sub	%l4,	0x108F,	%i6
	ld	[%l7 + 0x34],	%f27
	xor	%i3,	0x0944,	%g4
	edge8ln	%l0,	%l3,	%l1
	udivx	%i1,	0x04E1,	%g3
	ldsh	[%l7 + 0x1A],	%o1
	stw	%g5,	[%l7 + 0x24]
	movvc	%icc,	%i7,	%g7
	fmovdne	%xcc,	%f27,	%f15
	ldsw	[%l7 + 0x18],	%o3
	movrne	%g6,	%o7,	%o0
	ldub	[%l7 + 0x17],	%i4
	movcs	%xcc,	%o2,	%o6
	fmovdneg	%icc,	%f19,	%f25
	udiv	%l6,	0x0BEC,	%i5
	stw	%l2,	[%l7 + 0x70]
	fornot2s	%f8,	%f18,	%f5
	sir	0x1C73
	stw	%o5,	[%l7 + 0x48]
	ldd	[%l7 + 0x50],	%f20
	fmovsn	%xcc,	%f5,	%f28
	subcc	%o4,	%i2,	%g1
	xor	%i0,	0x075C,	%g2
	fmovdne	%icc,	%f20,	%f29
	addcc	%l4,	0x0ABA,	%i6
	nop
	set	0x1C, %g2
	stw	%l5,	[%l7 + %g2]
	andncc	%g4,	%i3,	%l0
	edge8l	%l1,	%i1,	%g3
	sth	%o1,	[%l7 + 0x0C]
	fmovrde	%g5,	%f16,	%f20
	xorcc	%i7,	0x05A7,	%l3
	fnot1	%f6,	%f28
	fornot2s	%f6,	%f2,	%f21
	xnor	%o3,	0x0591,	%g7
	stw	%g6,	[%l7 + 0x34]
	umul	%o0,	0x01AE,	%o7
	fmuld8sux16	%f12,	%f19,	%f18
	fxor	%f0,	%f4,	%f18
	sethi	0x11FF,	%i4
	stx	%o6,	[%l7 + 0x20]
	edge8l	%l6,	%i5,	%l2
	ldsw	[%l7 + 0x18],	%o2
	edge32	%o5,	%i2,	%o4
	sub	%i0,	0x01FE,	%g2
	movn	%xcc,	%l4,	%i6
	mova	%icc,	%l5,	%g4
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	movrlz	%l1,	0x3D7,	%l0
	addccc	%g3,	%o1,	%g5
	sra	%i7,	%l3,	%o3
	lduh	[%l7 + 0x7A],	%g7
	mova	%icc,	%g6,	%o0
	fnot1	%f20,	%f0
	sdivx	%i1,	0x0BD0,	%o7
	movleu	%xcc,	%i4,	%o6
	fmovdne	%icc,	%f28,	%f11
	fmovsgu	%xcc,	%f9,	%f22
	fmovrslez	%i5,	%f24,	%f11
	fnands	%f17,	%f1,	%f2
	srax	%l6,	%o2,	%l2
	srax	%i2,	%o4,	%i0
	edge32ln	%o5,	%g2,	%l4
	edge8ln	%l5,	%i6,	%g1
	andcc	%i3,	0x1F3F,	%g4
	and	%l0,	%l1,	%g3
	stb	%g5,	[%l7 + 0x16]
	movvs	%icc,	%o1,	%i7
	edge32n	%o3,	%g7,	%g6
	add	%o0,	%i1,	%o7
	stw	%l3,	[%l7 + 0x58]
	fnors	%f21,	%f8,	%f10
	udivcc	%i4,	0x1EE9,	%o6
	sethi	0x0D62,	%i5
	edge8n	%o2,	%l2,	%i2
	alignaddrl	%l6,	%i0,	%o5
	mulx	%o4,	%l4,	%g2
	fpsub32s	%f4,	%f31,	%f10
	xnor	%l5,	0x0A0C,	%g1
	smulcc	%i6,	%i3,	%l0
	subcc	%g4,	%g3,	%l1
	addc	%o1,	0x0642,	%g5
	edge32	%o3,	%g7,	%i7
	movg	%icc,	%g6,	%i1
	edge8	%o0,	%l3,	%o7
	array16	%i4,	%o6,	%o2
	subc	%i5,	%i2,	%l2
	movg	%icc,	%i0,	%o5
	fmovsvs	%xcc,	%f9,	%f17
	movneg	%icc,	%l6,	%l4
	sub	%o4,	0x0BEE,	%l5
	fpsub16s	%f12,	%f22,	%f1
	fpsub16	%f16,	%f6,	%f0
	fmovsvc	%icc,	%f9,	%f6
	fmovs	%f10,	%f28
	fmovrdlz	%g2,	%f18,	%f28
	fandnot1s	%f7,	%f30,	%f8
	lduw	[%l7 + 0x14],	%i6
	andn	%i3,	0x1BFE,	%l0
	movvs	%icc,	%g4,	%g3
	sir	0x1488
	fornot1s	%f24,	%f30,	%f31
	movrne	%l1,	%o1,	%g5
	ldub	[%l7 + 0x2D],	%o3
	lduw	[%l7 + 0x78],	%g1
	array16	%g7,	%g6,	%i7
	sdiv	%o0,	0x0E27,	%i1
	edge32l	%o7,	%i4,	%o6
	edge32ln	%o2,	%l3,	%i5
	fmovrdgez	%l2,	%f12,	%f26
	sllx	%i2,	0x18,	%i0
	alignaddrl	%l6,	%l4,	%o5
	array16	%l5,	%g2,	%o4
	fcmped	%fcc3,	%f28,	%f6
	sth	%i6,	[%l7 + 0x40]
	sllx	%i3,	%g4,	%l0
	fmovsneg	%icc,	%f15,	%f17
	save %g3, 0x09BA, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f4,	%f14
	move	%icc,	%l1,	%g5
	ldd	[%l7 + 0x48],	%f4
	addc	%o3,	0x1A29,	%g7
	movl	%xcc,	%g1,	%g6
	fmovdcs	%xcc,	%f23,	%f30
	fmul8ulx16	%f16,	%f10,	%f24
	pdist	%f0,	%f8,	%f6
	udivx	%o0,	0x086D,	%i7
	movvc	%xcc,	%o7,	%i1
	restore %o6, 0x0D19, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o2,	%i5,	%l3
	xorcc	%l2,	0x1939,	%i2
	edge8ln	%l6,	%l4,	%o5
	fmovsleu	%xcc,	%f23,	%f2
	fsrc2	%f20,	%f20
	movvc	%icc,	%l5,	%i0
	alignaddr	%g2,	%o4,	%i3
	subcc	%g4,	0x0A03,	%l0
	st	%f13,	[%l7 + 0x50]
	srlx	%g3,	0x0D,	%o1
	fmovrslez	%l1,	%f19,	%f20
	subc	%i6,	%g5,	%g7
	fpadd32s	%f4,	%f29,	%f8
	xnorcc	%o3,	0x00D5,	%g1
	umulcc	%o0,	%g6,	%i7
	srlx	%i1,	%o6,	%o7
	fmovrde	%o2,	%f10,	%f2
	umulcc	%i5,	%i4,	%l3
	for	%f6,	%f8,	%f14
	fmovse	%icc,	%f12,	%f5
	stb	%i2,	[%l7 + 0x39]
	andn	%l6,	0x08E2,	%l2
	fors	%f26,	%f27,	%f14
	ldx	[%l7 + 0x20],	%l4
	std	%f4,	[%l7 + 0x70]
	fmovsleu	%icc,	%f26,	%f20
	subcc	%l5,	%i0,	%g2
	popc	0x021D,	%o5
	std	%f8,	[%l7 + 0x10]
	movvs	%xcc,	%o4,	%i3
	sethi	0x162D,	%g4
	and	%l0,	0x152C,	%g3
	movrlz	%o1,	0x155,	%l1
	ldx	[%l7 + 0x10],	%i6
	xor	%g7,	%g5,	%g1
	xorcc	%o3,	%o0,	%g6
	stw	%i7,	[%l7 + 0x44]
	fmovdge	%icc,	%f12,	%f29
	movre	%i1,	0x262,	%o7
	sdiv	%o2,	0x06CA,	%o6
	movvc	%xcc,	%i5,	%i4
	fandnot1s	%f23,	%f25,	%f16
	srlx	%i2,	%l3,	%l6
	std	%f4,	[%l7 + 0x18]
	movge	%icc,	%l2,	%l4
	fcmpd	%fcc2,	%f24,	%f20
	sethi	0x037E,	%l5
	move	%icc,	%i0,	%g2
	edge16l	%o5,	%o4,	%i3
	sth	%g4,	[%l7 + 0x20]
	edge16l	%l0,	%o1,	%g3
	fpackfix	%f28,	%f29
	ldsb	[%l7 + 0x0C],	%l1
	fcmps	%fcc0,	%f10,	%f30
	alignaddrl	%g7,	%i6,	%g5
	fmovsneg	%xcc,	%f11,	%f10
	movrne	%g1,	%o0,	%o3
	sir	0x1CC3
	nop
	set	0x50, %o5
	ldsw	[%l7 + %o5],	%g6
	nop
	set	0x10, %l3
	stx	%i7,	[%l7 + %l3]
	subc	%i1,	0x0CE9,	%o2
	mulscc	%o6,	0x0C0C,	%i5
	orcc	%i4,	0x15C9,	%i2
	smul	%l3,	%l6,	%l2
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	fornot1	%f2,	%f12,	%f2
	movge	%xcc,	%g2,	%o5
	ldsh	[%l7 + 0x2A],	%i0
	udiv	%i3,	0x1CD8,	%g4
	sra	%o4,	0x1F,	%l0
	array32	%g3,	%l1,	%g7
	andncc	%i6,	%o1,	%g1
	smul	%g5,	0x0479,	%o0
	edge8l	%o3,	%g6,	%i7
	orncc	%i1,	%o2,	%o6
	addccc	%i5,	%i4,	%i2
	fzero	%f6
	save %l6, %l2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l5,	%l4,	%g2
	edge32n	%l3,	%i0,	%i3
	nop
	set	0x40, %g4
	lduw	[%l7 + %g4],	%g4
	alignaddr	%o4,	%o5,	%l0
	movrlz	%g3,	0x224,	%l1
	umulcc	%g7,	0x099E,	%o1
	andn	%g1,	0x1AE2,	%i6
	ldd	[%l7 + 0x78],	%g4
	xnorcc	%o3,	0x0072,	%g6
	fmul8sux16	%f24,	%f30,	%f26
	movvc	%icc,	%o0,	%i7
	smul	%o2,	0x0685,	%o6
	xorcc	%i5,	%i1,	%i2
	movre	%l6,	0x2E1,	%l2
	movne	%xcc,	%o7,	%i4
	fmovspos	%icc,	%f3,	%f4
	for	%f10,	%f24,	%f26
	mulscc	%l5,	0x1DE2,	%g2
	edge32n	%l4,	%i0,	%i3
	lduw	[%l7 + 0x50],	%g4
	edge32ln	%l3,	%o4,	%o5
	movrne	%l0,	%g3,	%l1
	edge32n	%g7,	%o1,	%i6
	sra	%g5,	%o3,	%g1
	fpadd32s	%f26,	%f14,	%f12
	udivcc	%g6,	0x00C5,	%o0
	faligndata	%f30,	%f4,	%f28
	udivx	%i7,	0x0798,	%o6
	fsrc1	%f10,	%f24
	ld	[%l7 + 0x08],	%f27
	sethi	0x00A9,	%o2
	sth	%i1,	[%l7 + 0x50]
	sir	0x1F9E
	edge32n	%i2,	%l6,	%i5
	alignaddrl	%o7,	%i4,	%l2
	movneg	%icc,	%l5,	%g2
	movrgz	%l4,	0x08B,	%i0
	sth	%i3,	[%l7 + 0x34]
	edge8l	%l3,	%o4,	%o5
	sdivcc	%g4,	0x08D8,	%l0
	fcmpd	%fcc3,	%f24,	%f0
	movg	%icc,	%g3,	%g7
	edge16l	%l1,	%i6,	%o1
	st	%f5,	[%l7 + 0x24]
	mulx	%o3,	%g1,	%g6
	ldsw	[%l7 + 0x28],	%o0
	ldsb	[%l7 + 0x58],	%g5
	popc	%o6,	%i7
	alignaddrl	%i1,	%o2,	%l6
	xorcc	%i5,	%o7,	%i2
	xnorcc	%l2,	%l5,	%g2
	subccc	%l4,	0x15DB,	%i0
	sdivx	%i4,	0x1E90,	%l3
	edge16	%i3,	%o5,	%o4
	edge32l	%l0,	%g4,	%g7
	subc	%l1,	0x1F39,	%g3
	edge16	%i6,	%o1,	%o3
	umulcc	%g6,	%o0,	%g5
	array8	%g1,	%o6,	%i7
	udivcc	%o2,	0x1743,	%i1
	mova	%icc,	%l6,	%o7
	fmovsgu	%xcc,	%f18,	%f2
	edge8n	%i5,	%l2,	%i2
	sir	0x08B8
	fmovd	%f6,	%f26
	fmovsl	%xcc,	%f20,	%f8
	addccc	%g2,	0x14C6,	%l4
	stb	%l5,	[%l7 + 0x0C]
	or	%i0,	0x0DA1,	%l3
	udivcc	%i3,	0x0415,	%i4
	srlx	%o5,	0x19,	%o4
	movrgz	%l0,	0x06C,	%g7
	andcc	%l1,	%g4,	%i6
	sir	0x0273
	edge8l	%o1,	%o3,	%g6
	fmovrdlez	%g3,	%f30,	%f24
	xor	%o0,	%g5,	%g1
	ldub	[%l7 + 0x47],	%i7
	stw	%o2,	[%l7 + 0x20]
	fandnot2s	%f15,	%f30,	%f29
	add	%i1,	0x0A4D,	%l6
	movne	%icc,	%o6,	%o7
	movle	%xcc,	%i5,	%l2
	array16	%i2,	%l4,	%l5
	array8	%g2,	%l3,	%i0
	edge16n	%i3,	%o5,	%o4
	movcs	%xcc,	%l0,	%g7
	sth	%l1,	[%l7 + 0x4E]
	fcmpd	%fcc0,	%f24,	%f0
	movvs	%icc,	%i4,	%i6
	subccc	%g4,	0x0D4D,	%o1
	movrgez	%o3,	0x1FA,	%g6
	movcs	%icc,	%g3,	%g5
	subc	%g1,	%i7,	%o2
	srlx	%o0,	%i1,	%o6
	movle	%icc,	%l6,	%o7
	ldsw	[%l7 + 0x58],	%l2
	edge8ln	%i5,	%i2,	%l4
	ldx	[%l7 + 0x40],	%l5
	faligndata	%f10,	%f0,	%f26
	ldx	[%l7 + 0x20],	%g2
	ldd	[%l7 + 0x08],	%i0
	srl	%l3,	0x05,	%o5
	sub	%o4,	0x0C18,	%i3
	movleu	%icc,	%g7,	%l0
	edge32l	%i4,	%i6,	%l1
	edge16n	%g4,	%o1,	%g6
	fxor	%f30,	%f26,	%f16
	array8	%o3,	%g5,	%g3
	srlx	%g1,	0x1A,	%o2
	mova	%xcc,	%o0,	%i1
	umulcc	%i7,	%l6,	%o6
	for	%f26,	%f24,	%f2
	subcc	%l2,	%i5,	%o7
	fpsub32	%f0,	%f14,	%f28
	fsrc2	%f20,	%f16
	addc	%l4,	0x1C97,	%i2
	and	%l5,	0x076C,	%i0
	fmul8sux16	%f0,	%f28,	%f22
	edge8ln	%l3,	%o5,	%g2
	smulcc	%o4,	%g7,	%i3
	fmovsvs	%xcc,	%f31,	%f13
	movg	%icc,	%l0,	%i4
	umul	%i6,	0x057E,	%g4
	restore %o1, 0x1B35, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o3,	%l1,	%g5
	fmovd	%f20,	%f26
	popc	0x0D6A,	%g3
	stb	%o2,	[%l7 + 0x08]
	andcc	%o0,	0x1F6C,	%i1
	sdivcc	%g1,	0x003B,	%l6
	sethi	0x18A8,	%o6
	umul	%i7,	%l2,	%i5
	mulx	%l4,	0x1A9E,	%i2
	movrne	%l5,	0x1FD,	%i0
	fnegd	%f30,	%f28
	sth	%l3,	[%l7 + 0x62]
	movg	%xcc,	%o5,	%g2
	edge16n	%o4,	%g7,	%o7
	smulcc	%i3,	%l0,	%i6
	movn	%xcc,	%i4,	%o1
	alignaddr	%g4,	%o3,	%g6
	movg	%xcc,	%g5,	%l1
	movge	%xcc,	%g3,	%o2
	addccc	%i1,	%g1,	%o0
	nop
	set	0x27, %l6
	ldub	[%l7 + %l6],	%o6
	ldx	[%l7 + 0x18],	%i7
	fmul8x16au	%f17,	%f31,	%f6
	fmovsneg	%xcc,	%f21,	%f16
	movl	%xcc,	%l2,	%l6
	edge8ln	%i5,	%i2,	%l4
	stw	%i0,	[%l7 + 0x2C]
	subcc	%l3,	%l5,	%o5
	movle	%icc,	%g2,	%o4
	edge16ln	%g7,	%o7,	%i3
	movvc	%xcc,	%i6,	%l0
	array16	%i4,	%g4,	%o1
	sll	%o3,	%g6,	%g5
	mova	%icc,	%g3,	%o2
	srl	%i1,	%l1,	%o0
	alignaddrl	%g1,	%i7,	%o6
	sth	%l6,	[%l7 + 0x34]
	movrgz	%l2,	%i5,	%i2
	edge8l	%l4,	%i0,	%l5
	udiv	%o5,	0x0972,	%g2
	movle	%xcc,	%o4,	%l3
	movrne	%g7,	0x300,	%i3
	move	%xcc,	%o7,	%l0
	edge8l	%i6,	%g4,	%o1
	for	%f18,	%f26,	%f10
	movrne	%i4,	0x143,	%o3
	fmovdcc	%xcc,	%f24,	%f24
	addc	%g5,	%g6,	%g3
	movvs	%icc,	%i1,	%l1
	fmovsvs	%xcc,	%f0,	%f17
	umul	%o0,	0x1C5B,	%g1
	orcc	%o2,	%o6,	%i7
	ldsb	[%l7 + 0x4E],	%l2
	ldd	[%l7 + 0x68],	%i4
	sra	%l6,	%i2,	%l4
	fmul8x16al	%f0,	%f29,	%f6
	srax	%i0,	%l5,	%o5
	smul	%o4,	%g2,	%l3
	or	%i3,	%g7,	%l0
	ldsb	[%l7 + 0x39],	%o7
	movleu	%icc,	%g4,	%i6
	sethi	0x176E,	%o1
	array8	%o3,	%i4,	%g5
	ldub	[%l7 + 0x2F],	%g3
	array8	%g6,	%l1,	%i1
	fmovda	%xcc,	%f31,	%f9
	movg	%icc,	%o0,	%g1
	andn	%o2,	0x1349,	%i7
	mulx	%o6,	%i5,	%l6
	srl	%i2,	%l4,	%l2
	xnor	%i0,	0x0C3B,	%o5
	movrlz	%o4,	0x1C1,	%g2
	edge16	%l5,	%i3,	%l3
	add	%l0,	0x0CB2,	%o7
	sdiv	%g7,	0x0705,	%i6
	fmovsa	%xcc,	%f1,	%f3
	sdiv	%o1,	0x1348,	%g4
	ldd	[%l7 + 0x40],	%f14
	smulcc	%o3,	%g5,	%i4
	udivcc	%g6,	0x07BB,	%l1
	mova	%xcc,	%g3,	%i1
	sethi	0x020E,	%o0
	fcmps	%fcc3,	%f25,	%f3
	std	%f0,	[%l7 + 0x60]
	edge16l	%g1,	%i7,	%o2
	ldub	[%l7 + 0x2A],	%o6
	st	%f24,	[%l7 + 0x44]
	movge	%xcc,	%i5,	%i2
	add	%l6,	0x061E,	%l4
	addc	%l2,	0x1DCF,	%i0
	subc	%o4,	0x0C46,	%g2
	sdivx	%l5,	0x1472,	%i3
	movrgz	%l3,	%o5,	%l0
	mulx	%g7,	0x1C33,	%o7
	sth	%i6,	[%l7 + 0x34]
	addccc	%o1,	%g4,	%o3
	ldd	[%l7 + 0x30],	%f4
	movre	%i4,	0x37A,	%g5
	edge8n	%g6,	%l1,	%i1
	movn	%icc,	%o0,	%g1
	xor	%i7,	0x0C13,	%g3
	save %o6, 0x12CD, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i2,	%l6,	%l4
	movvs	%xcc,	%l2,	%i5
	or	%o4,	0x0218,	%g2
	xnor	%i0,	%l5,	%i3
	move	%xcc,	%l3,	%o5
	movn	%xcc,	%g7,	%o7
	subc	%i6,	0x1BFA,	%o1
	edge32	%g4,	%l0,	%i4
	fmovrsgz	%g5,	%f17,	%f13
	movcs	%icc,	%g6,	%o3
	ldd	[%l7 + 0x48],	%l0
	ld	[%l7 + 0x38],	%f13
	ldsb	[%l7 + 0x56],	%o0
	edge16n	%g1,	%i1,	%g3
	xorcc	%o6,	0x0E02,	%o2
	fcmpne32	%f20,	%f18,	%i7
	fmovs	%f6,	%f17
	edge32n	%i2,	%l4,	%l2
	andcc	%l6,	0x0DF2,	%i5
	umul	%o4,	%i0,	%l5
	ld	[%l7 + 0x24],	%f8
	edge8ln	%i3,	%g2,	%o5
	sub	%l3,	0x07B4,	%o7
	subcc	%i6,	%o1,	%g7
	fmovdgu	%icc,	%f15,	%f3
	smulcc	%g4,	0x0B76,	%l0
	edge32ln	%g5,	%i4,	%g6
	array32	%o3,	%o0,	%g1
	ldsb	[%l7 + 0x44],	%l1
	fcmped	%fcc0,	%f24,	%f26
	ldsw	[%l7 + 0x44],	%i1
	movl	%icc,	%o6,	%o2
	edge8	%g3,	%i2,	%i7
	movvs	%icc,	%l4,	%l2
	fornot2s	%f31,	%f6,	%f30
	movg	%icc,	%l6,	%o4
	fones	%f17
	udivcc	%i0,	0x1598,	%i5
	edge32ln	%l5,	%g2,	%i3
	movvs	%xcc,	%l3,	%o5
	movgu	%xcc,	%i6,	%o1
	edge32n	%o7,	%g4,	%g7
	array16	%l0,	%i4,	%g5
	fabsd	%f18,	%f12
	xnorcc	%g6,	0x0645,	%o3
	edge8l	%g1,	%l1,	%o0
	nop
	set	0x54, %i0
	lduw	[%l7 + %i0],	%o6
	sra	%o2,	%i1,	%g3
	fpadd32s	%f31,	%f25,	%f27
	fmovsgu	%xcc,	%f1,	%f19
	or	%i2,	%i7,	%l4
	nop
	set	0x50, %i6
	ldx	[%l7 + %i6],	%l2
	siam	0x7
	movne	%xcc,	%l6,	%o4
	udivx	%i0,	0x0C36,	%i5
	movrne	%l5,	0x26C,	%i3
	movge	%icc,	%l3,	%g2
	fexpand	%f17,	%f20
	mulx	%i6,	0x0179,	%o5
	movrgz	%o1,	%g4,	%g7
	edge8n	%o7,	%l0,	%i4
	fmovscc	%icc,	%f17,	%f2
	movrne	%g6,	%o3,	%g1
	or	%l1,	%g5,	%o0
	edge16ln	%o6,	%o2,	%i1
	fsrc2s	%f28,	%f31
	movneg	%icc,	%g3,	%i2
	save %l4, 0x183B, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%l6,	%i7
	orn	%o4,	%i0,	%l5
	sth	%i3,	[%l7 + 0x3E]
	ld	[%l7 + 0x18],	%f20
	movcc	%xcc,	%l3,	%g2
	ld	[%l7 + 0x30],	%f8
	nop
	set	0x4D, %i7
	ldsb	[%l7 + %i7],	%i6
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%f22
	fnot1	%f28,	%f22
	movcc	%xcc,	%o5,	%i5
	srl	%g4,	%g7,	%o7
	fornot2	%f16,	%f10,	%f26
	fpsub16s	%f13,	%f13,	%f17
	nop
	set	0x1C, %o7
	stw	%l0,	[%l7 + %o7]
	movn	%icc,	%o1,	%g6
	movpos	%icc,	%i4,	%g1
	movrlez	%o3,	0x126,	%g5
	udiv	%o0,	0x12A7,	%o6
	movl	%xcc,	%l1,	%o2
	bshuffle	%f4,	%f30,	%f24
	movle	%icc,	%g3,	%i1
	edge16	%l4,	%i2,	%l2
	edge8l	%l6,	%o4,	%i0
	add	%l5,	%i3,	%l3
	add	%g2,	0x1348,	%i7
	fpack32	%f30,	%f14,	%f16
	movgu	%icc,	%i6,	%i5
	fmul8x16	%f7,	%f0,	%f20
	orcc	%g4,	%o5,	%o7
	xnorcc	%l0,	%g7,	%o1
	movpos	%icc,	%g6,	%i4
	movrgz	%g1,	0x16A,	%g5
	fmovsvc	%icc,	%f2,	%f17
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	srax	%l1,	0x17,	%g3
	smulcc	%o2,	0x06A0,	%i1
	sll	%l4,	%i2,	%l6
	popc	%o4,	%l2
	udivcc	%l5,	0x1E61,	%i3
	ldsb	[%l7 + 0x7E],	%i0
	movn	%icc,	%l3,	%i7
	movrgz	%g2,	%i6,	%i5
	ldub	[%l7 + 0x3E],	%o5
	edge16ln	%g4,	%o7,	%g7
	restore %l0, 0x1A5A, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f14,	%f2,	%f4
	edge8	%i4,	%g6,	%g1
	xnor	%o3,	%g5,	%o0
	sllx	%o6,	%l1,	%g3
	movn	%xcc,	%i1,	%o2
	sub	%i2,	0x18FD,	%l4
	sub	%o4,	0x0B76,	%l6
	xorcc	%l5,	0x1A49,	%l2
	xorcc	%i3,	0x02B0,	%i0
	udiv	%i7,	0x0AD5,	%g2
	stx	%l3,	[%l7 + 0x50]
	array16	%i6,	%o5,	%i5
	mova	%xcc,	%g4,	%g7
	fpadd16s	%f12,	%f22,	%f15
	mova	%xcc,	%o7,	%l0
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%f18
	orncc	%o1,	%i4,	%g1
	fmovsle	%icc,	%f30,	%f29
	srl	%g6,	0x11,	%o3
	fmovrsgez	%o0,	%f15,	%f27
	movre	%o6,	0x1BB,	%l1
	or	%g3,	0x16A0,	%i1
	st	%f19,	[%l7 + 0x4C]
	mulscc	%g5,	%i2,	%l4
	subc	%o2,	0x145E,	%o4
	xor	%l6,	0x18B0,	%l5
	andcc	%i3,	0x05DB,	%i0
	movpos	%icc,	%l2,	%i7
	stx	%l3,	[%l7 + 0x08]
	st	%f26,	[%l7 + 0x34]
	edge16l	%i6,	%o5,	%g2
	nop
	set	0x6E, %g6
	ldub	[%l7 + %g6],	%g4
	fxnor	%f28,	%f20,	%f12
	edge16ln	%g7,	%o7,	%i5
	nop
	set	0x2C, %g5
	ldsw	[%l7 + %g5],	%l0
	edge32n	%o1,	%g1,	%i4
	lduh	[%l7 + 0x0C],	%o3
	or	%o0,	%o6,	%l1
	smulcc	%g6,	%i1,	%g3
	ldsb	[%l7 + 0x67],	%g5
	fmul8sux16	%f20,	%f26,	%f4
	fmovrslez	%i2,	%f28,	%f21
	edge8n	%o2,	%o4,	%l4
	movle	%icc,	%l6,	%l5
	udivcc	%i0,	0x04B2,	%i3
	popc	%l2,	%l3
	ld	[%l7 + 0x78],	%f13
	orn	%i7,	0x0F0E,	%o5
	edge8l	%g2,	%i6,	%g4
	movvs	%xcc,	%g7,	%i5
	edge16n	%l0,	%o1,	%o7
	sth	%i4,	[%l7 + 0x34]
	edge16ln	%g1,	%o0,	%o6
	movn	%xcc,	%l1,	%o3
	or	%g6,	%i1,	%g3
	fpackfix	%f16,	%f13
	nop
	set	0x58, %g7
	ldsw	[%l7 + %g7],	%i2
	fmovrdgez	%g5,	%f24,	%f28
	andcc	%o4,	%l4,	%l6
	xnorcc	%l5,	%i0,	%i3
	array8	%o2,	%l2,	%i7
	movrlz	%l3,	0x30A,	%g2
	faligndata	%f12,	%f14,	%f26
	add	%i6,	0x1860,	%o5
	fzero	%f14
	sdiv	%g7,	0x11C4,	%g4
	edge8ln	%l0,	%o1,	%i5
	orncc	%o7,	0x1B25,	%g1
	fnot2s	%f26,	%f1
	ld	[%l7 + 0x30],	%f4
	array8	%o0,	%o6,	%l1
	srax	%i4,	0x14,	%o3
	andncc	%g6,	%g3,	%i2
	fpsub16	%f26,	%f6,	%f24
	movvs	%icc,	%i1,	%o4
	fsrc2	%f6,	%f26
	edge8n	%g5,	%l6,	%l4
	smulcc	%l5,	0x0548,	%i3
	andn	%i0,	%l2,	%o2
	std	%f14,	[%l7 + 0x08]
	fcmple16	%f26,	%f12,	%i7
	movrne	%l3,	%g2,	%i6
	xnorcc	%o5,	%g4,	%g7
	array16	%o1,	%l0,	%i5
	pdist	%f12,	%f20,	%f26
	array32	%g1,	%o0,	%o7
	sir	0x1DB3
	edge8ln	%o6,	%i4,	%l1
	sir	0x165C
	ldub	[%l7 + 0x42],	%o3
	movrlz	%g6,	0x353,	%i2
	alignaddrl	%g3,	%i1,	%g5
	orncc	%l6,	0x09D9,	%o4
	movvc	%xcc,	%l4,	%i3
	and	%i0,	%l2,	%l5
	fnegs	%f27,	%f25
	and	%i7,	%o2,	%g2
	std	%f24,	[%l7 + 0x50]
	edge16ln	%l3,	%o5,	%g4
	edge32	%i6,	%o1,	%l0
	fmovdcs	%xcc,	%f16,	%f8
	orn	%i5,	0x099A,	%g7
	smul	%g1,	0x17EC,	%o7
	fcmped	%fcc0,	%f28,	%f10
	subccc	%o0,	0x15E7,	%i4
	ldsw	[%l7 + 0x54],	%o6
	movvc	%icc,	%o3,	%l1
	fmovsne	%xcc,	%f23,	%f1
	fpsub16s	%f17,	%f1,	%f8
	array16	%g6,	%g3,	%i2
	fmovsn	%icc,	%f19,	%f30
	siam	0x4
	fabsd	%f20,	%f14
	movleu	%xcc,	%g5,	%l6
	add	%i1,	0x198B,	%l4
	umulcc	%i3,	%i0,	%l2
	fnegd	%f22,	%f16
	fpsub32s	%f19,	%f26,	%f15
	lduh	[%l7 + 0x32],	%o4
	edge8ln	%l5,	%i7,	%o2
	edge8l	%l3,	%o5,	%g2
	orncc	%i6,	0x1998,	%o1
	sdiv	%g4,	0x0817,	%i5
	fmovs	%f17,	%f16
	edge32	%g7,	%g1,	%l0
	movcc	%icc,	%o7,	%i4
	or	%o0,	0x1B87,	%o3
	movg	%icc,	%o6,	%l1
	fmovrsgz	%g6,	%f23,	%f21
	xnorcc	%i2,	0x18A4,	%g5
	movneg	%xcc,	%l6,	%i1
	umul	%l4,	%g3,	%i3
	ld	[%l7 + 0x44],	%f27
	edge8	%l2,	%o4,	%i0
	sdivx	%l5,	0x197D,	%i7
	fnegs	%f27,	%f14
	fcmpeq16	%f30,	%f26,	%o2
	movrgez	%l3,	%o5,	%i6
	movcc	%icc,	%g2,	%g4
	fpackfix	%f22,	%f15
	fmovrdne	%i5,	%f26,	%f14
	sir	0x19C7
	ldx	[%l7 + 0x40],	%o1
	fandnot1s	%f31,	%f28,	%f2
	fpadd16	%f18,	%f18,	%f14
	edge8	%g1,	%g7,	%o7
	movle	%xcc,	%i4,	%l0
	movvs	%xcc,	%o3,	%o6
	alignaddr	%o0,	%l1,	%g6
	subc	%i2,	%g5,	%i1
	sdiv	%l6,	0x068A,	%g3
	movne	%icc,	%l4,	%i3
	xnor	%o4,	%l2,	%l5
	movrlz	%i0,	%i7,	%l3
	array16	%o2,	%i6,	%g2
	sra	%o5,	%i5,	%o1
	subccc	%g1,	0x1C2C,	%g7
	sll	%o7,	0x0F,	%i4
	sdiv	%g4,	0x0FE0,	%o3
	fcmpne32	%f10,	%f2,	%l0
	fmul8x16	%f15,	%f22,	%f0
	movcc	%icc,	%o0,	%l1
	edge8l	%g6,	%o6,	%g5
	movre	%i2,	0x38D,	%l6
	add	%g3,	%l4,	%i3
	edge16l	%o4,	%l2,	%l5
	movge	%icc,	%i1,	%i0
	mova	%icc,	%l3,	%o2
	lduh	[%l7 + 0x1C],	%i7
	fnands	%f20,	%f16,	%f11
	fmovscs	%icc,	%f28,	%f8
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%g2
	sdivcc	%o5,	0x1C2E,	%i6
	ldub	[%l7 + 0x12],	%i5
	alignaddr	%o1,	%g7,	%g1
	edge16ln	%i4,	%o7,	%g4
	fmovdcc	%xcc,	%f31,	%f21
	edge16n	%l0,	%o3,	%o0
	movl	%xcc,	%l1,	%g6
	fmovrsne	%o6,	%f16,	%f14
	edge16	%g5,	%l6,	%i2
	movre	%l4,	%g3,	%o4
	edge16n	%l2,	%i3,	%l5
	srl	%i1,	0x0A,	%i0
	fmovde	%xcc,	%f20,	%f14
	fands	%f27,	%f5,	%f12
	fmuld8sux16	%f24,	%f26,	%f10
	st	%f3,	[%l7 + 0x18]
	xorcc	%l3,	%o2,	%g2
	fmovsa	%xcc,	%f22,	%f31
	fmovrse	%i7,	%f29,	%f7
	fmovdcc	%icc,	%f14,	%f12
	movrgez	%o5,	0x04C,	%i6
	xor	%i5,	0x0224,	%o1
	save %g1, 0x0A0A, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x18],	%f20
	fone	%f18
	movl	%icc,	%i4,	%o7
	array32	%l0,	%o3,	%g4
	fsrc2s	%f3,	%f11
	movpos	%xcc,	%l1,	%g6
	orn	%o6,	%g5,	%o0
	lduh	[%l7 + 0x4C],	%i2
	smul	%l4,	0x07C7,	%g3
	std	%f18,	[%l7 + 0x48]
	umul	%o4,	%l6,	%l2
	fmovsa	%xcc,	%f7,	%f19
	movvs	%icc,	%l5,	%i3
	srl	%i0,	0x14,	%l3
	edge16n	%o2,	%i1,	%i7
	sethi	0x15ED,	%g2
	ldsb	[%l7 + 0x76],	%o5
	add	%i5,	%i6,	%g1
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%f18
	std	%f6,	[%l7 + 0x20]
	movpos	%icc,	%o1,	%i4
	edge8n	%g7,	%o7,	%l0
	move	%icc,	%g4,	%l1
	fmovsneg	%xcc,	%f18,	%f31
	udiv	%o3,	0x1780,	%g6
	edge32n	%o6,	%g5,	%i2
	fornot2s	%f4,	%f23,	%f13
	fabsd	%f20,	%f2
	fcmpne32	%f6,	%f8,	%o0
	ldsw	[%l7 + 0x54],	%l4
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%g3
	udiv	%l6,	0x1D2C,	%o4
	array16	%l5,	%i3,	%l2
	movre	%l3,	0x0DA,	%o2
	fmovsgu	%xcc,	%f3,	%f23
	fsrc1s	%f7,	%f18
	sth	%i0,	[%l7 + 0x30]
	sth	%i1,	[%l7 + 0x3A]
	fmul8x16	%f10,	%f2,	%f22
	sdivx	%g2,	0x008B,	%o5
	subcc	%i5,	%i6,	%g1
	addc	%o1,	0x039D,	%i7
	subccc	%g7,	0x00C0,	%i4
	fnot2	%f0,	%f6
	fpadd32s	%f3,	%f7,	%f23
	udivcc	%l0,	0x1F39,	%o7
	save %g4, 0x0528, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g6,	%o6,	%g5
	sdiv	%i2,	0x04E6,	%l1
	edge8	%l4,	%o0,	%l6
	fornot2	%f22,	%f26,	%f24
	andn	%o4,	0x0AE7,	%g3
	movleu	%xcc,	%i3,	%l5
	fpsub16	%f2,	%f6,	%f8
	subccc	%l3,	0x02C4,	%l2
	edge32	%i0,	%i1,	%o2
	stx	%g2,	[%l7 + 0x78]
	sdivx	%o5,	0x17A8,	%i5
	andcc	%g1,	%o1,	%i6
	ldsw	[%l7 + 0x78],	%g7
	udivx	%i4,	0x05CB,	%i7
	movcs	%xcc,	%o7,	%g4
	fmovdcs	%icc,	%f17,	%f27
	ldsb	[%l7 + 0x65],	%o3
	movgu	%xcc,	%g6,	%l0
	movrne	%g5,	0x378,	%i2
	movle	%icc,	%l1,	%o6
	nop
	set	0x0C, %i3
	ldsh	[%l7 + %i3],	%o0
	xnor	%l4,	0x0443,	%o4
	fmovdl	%icc,	%f11,	%f20
	fmovdg	%xcc,	%f16,	%f5
	fornot2s	%f28,	%f27,	%f31
	st	%f7,	[%l7 + 0x0C]
	movgu	%icc,	%l6,	%i3
	fmovdpos	%xcc,	%f7,	%f12
	addc	%g3,	%l5,	%l3
	fmovde	%xcc,	%f20,	%f16
	alignaddr	%l2,	%i1,	%o2
	edge32l	%g2,	%o5,	%i5
	movl	%icc,	%g1,	%o1
	fornot2s	%f20,	%f13,	%f20
	ldx	[%l7 + 0x68],	%i6
	sra	%g7,	%i0,	%i7
	sll	%i4,	%o7,	%g4
	movpos	%xcc,	%o3,	%g6
	fpack16	%f2,	%f24
	edge8n	%l0,	%i2,	%l1
	nop
	set	0x20, %i1
	lduw	[%l7 + %i1],	%o6
	bshuffle	%f0,	%f2,	%f4
	ldsb	[%l7 + 0x4A],	%g5
	ldx	[%l7 + 0x60],	%l4
	movcc	%xcc,	%o4,	%o0
	umul	%l6,	%i3,	%l5
	mulx	%g3,	0x0E8E,	%l2
	udivcc	%i1,	0x157B,	%l3
	movvs	%icc,	%o2,	%o5
	ldsb	[%l7 + 0x37],	%g2
	or	%g1,	%i5,	%i6
	movrlez	%o1,	%g7,	%i7
	xnor	%i0,	0x0C43,	%o7
	edge8l	%i4,	%g4,	%o3
	edge8n	%g6,	%i2,	%l0
	andn	%l1,	%g5,	%l4
	smul	%o4,	%o0,	%l6
	movrne	%i3,	%l5,	%g3
	fmovsleu	%xcc,	%f19,	%f6
	movvc	%icc,	%l2,	%o6
	srax	%i1,	0x0F,	%l3
	movn	%icc,	%o5,	%g2
	subccc	%o2,	0x0194,	%i5
	ldub	[%l7 + 0x7F],	%i6
	lduw	[%l7 + 0x20],	%g1
	udiv	%o1,	0x1CE3,	%i7
	addc	%g7,	%i0,	%o7
	sir	0x0C83
	andncc	%g4,	%o3,	%i4
	mulscc	%g6,	%i2,	%l1
	movg	%icc,	%g5,	%l4
	lduw	[%l7 + 0x74],	%l0
	movleu	%xcc,	%o4,	%o0
	nop
	set	0x58, %i5
	lduw	[%l7 + %i5],	%i3
	ld	[%l7 + 0x5C],	%f0
	ldd	[%l7 + 0x58],	%i6
	movrlez	%g3,	0x3F6,	%l2
	st	%f16,	[%l7 + 0x3C]
	movvc	%icc,	%o6,	%l5
	movre	%l3,	0x342,	%i1
	sra	%g2,	%o2,	%o5
	addc	%i5,	%g1,	%o1
	srl	%i7,	0x03,	%g7
	fsrc2s	%f17,	%f23
	sth	%i0,	[%l7 + 0x4C]
	subccc	%i6,	%o7,	%o3
	movcs	%xcc,	%g4,	%g6
	udivx	%i2,	0x1F15,	%i4
	orn	%g5,	0x1797,	%l1
	andcc	%l0,	%o4,	%l4
	fxnor	%f12,	%f10,	%f26
	ldsw	[%l7 + 0x54],	%o0
	xnor	%l6,	%i3,	%g3
	stw	%o6,	[%l7 + 0x1C]
	stb	%l5,	[%l7 + 0x41]
	srax	%l3,	0x16,	%i1
	fnot1s	%f5,	%f29
	orncc	%l2,	0x12A7,	%g2
	fpsub16s	%f24,	%f29,	%f6
	andn	%o2,	%i5,	%g1
	save %o1, 0x027B, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f16,	%f26,	%f2
	fmovsneg	%xcc,	%f2,	%f19
	fmovdgu	%icc,	%f10,	%f20
	xorcc	%g7,	%i0,	%o5
	fmovs	%f29,	%f0
	movl	%icc,	%o7,	%i6
	udiv	%g4,	0x093B,	%g6
	and	%i2,	%i4,	%o3
	subcc	%l1,	0x1243,	%g5
	and	%o4,	%l0,	%o0
	fmovrdlez	%l4,	%f28,	%f10
	alignaddrl	%i3,	%g3,	%l6
	movg	%xcc,	%o6,	%l5
	xor	%l3,	0x07AF,	%l2
	ldsw	[%l7 + 0x60],	%g2
	subccc	%o2,	0x105B,	%i1
	umul	%i5,	%g1,	%o1
	popc	%g7,	%i7
	movrne	%o5,	0x295,	%o7
	add	%i0,	0x1B33,	%g4
	movg	%icc,	%i6,	%g6
	xnorcc	%i2,	%o3,	%l1
	add	%g5,	%i4,	%l0
	fornot1s	%f13,	%f23,	%f31
	umulcc	%o4,	0x12CB,	%l4
	fnegd	%f4,	%f26
	st	%f27,	[%l7 + 0x3C]
	udiv	%o0,	0x04FE,	%i3
	fpsub16s	%f10,	%f4,	%f15
	fmovsleu	%icc,	%f5,	%f31
	fmovdleu	%xcc,	%f10,	%f23
	fmovsa	%xcc,	%f2,	%f15
	ldd	[%l7 + 0x48],	%f10
	srl	%l6,	0x1F,	%g3
	mulx	%o6,	%l3,	%l2
	fpackfix	%f24,	%f17
	movleu	%xcc,	%g2,	%o2
	pdist	%f20,	%f28,	%f14
	xor	%i1,	%l5,	%g1
	smulcc	%o1,	%i5,	%i7
	fpadd32s	%f0,	%f12,	%f21
	addc	%g7,	0x1D9F,	%o5
	smulcc	%i0,	0x0142,	%o7
	movrlez	%i6,	%g6,	%i2
	fnot1s	%f27,	%f21
	srax	%g4,	%o3,	%g5
	fnor	%f14,	%f20,	%f8
	fmovsneg	%icc,	%f8,	%f7
	stb	%i4,	[%l7 + 0x34]
	edge32n	%l0,	%l1,	%l4
	fabsd	%f30,	%f2
	stw	%o0,	[%l7 + 0x40]
	st	%f10,	[%l7 + 0x34]
	udivcc	%i3,	0x12B8,	%l6
	fnot1s	%f9,	%f3
	fornot1	%f10,	%f12,	%f18
	movrlz	%o4,	%g3,	%l3
	movrne	%l2,	%g2,	%o2
	srl	%o6,	0x1F,	%l5
	edge8	%g1,	%i1,	%i5
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	srax	%g7,	0x0A,	%o5
	sub	%i0,	%o7,	%g6
	array32	%i2,	%g4,	%o3
	alignaddrl	%i6,	%g5,	%l0
	sir	0x12CE
	ldx	[%l7 + 0x48],	%l1
	movpos	%icc,	%l4,	%i4
	ld	[%l7 + 0x30],	%f28
	mulx	%o0,	%i3,	%o4
	srax	%g3,	%l3,	%l6
	sth	%l2,	[%l7 + 0x50]
	edge16n	%g2,	%o2,	%l5
	fmovsvs	%icc,	%f16,	%f15
	edge32	%o6,	%g1,	%i1
	ld	[%l7 + 0x28],	%f25
	srax	%o1,	0x0E,	%i7
	edge16ln	%g7,	%o5,	%i5
	fmovdvc	%xcc,	%f4,	%f9
	std	%f12,	[%l7 + 0x68]
	orn	%o7,	0x07D9,	%i0
	andcc	%i2,	%g4,	%g6
	fnor	%f26,	%f16,	%f30
	move	%icc,	%o3,	%i6
	subc	%g5,	%l0,	%l1
	umul	%l4,	0x1325,	%i4
	smulcc	%i3,	0x1E24,	%o0
	subc	%g3,	0x026C,	%o4
	nop
	set	0x44, %o3
	lduh	[%l7 + %o3],	%l3
	fsrc1	%f28,	%f14
	srax	%l6,	0x13,	%g2
	array8	%o2,	%l5,	%o6
	mulscc	%g1,	0x1714,	%l2
	fmovdvs	%xcc,	%f24,	%f26
	sethi	0x03D6,	%o1
	sdivcc	%i1,	0x0BE7,	%g7
	mulx	%i7,	0x1DAA,	%i5
	fmovsle	%xcc,	%f6,	%f31
	subc	%o7,	%o5,	%i2
	andcc	%i0,	%g4,	%g6
	movvc	%xcc,	%o3,	%i6
	smulcc	%l0,	%g5,	%l4
	sdivcc	%i4,	0x19F0,	%i3
	ldx	[%l7 + 0x08],	%l1
	movrlz	%o0,	0x2FE,	%o4
	fmovrsgez	%g3,	%f5,	%f17
	movvc	%icc,	%l3,	%g2
	fxnors	%f19,	%f13,	%f0
	movne	%xcc,	%o2,	%l5
	xor	%o6,	0x026D,	%g1
	umulcc	%l2,	0x09BF,	%o1
	fnot1s	%f11,	%f4
	fand	%f2,	%f18,	%f0
	fpsub16s	%f0,	%f8,	%f25
	xnorcc	%l6,	%i1,	%g7
	movvc	%xcc,	%i5,	%i7
	popc	0x0475,	%o7
	movrgez	%i2,	%i0,	%g4
	fandnot1	%f8,	%f2,	%f18
	st	%f6,	[%l7 + 0x74]
	udivx	%g6,	0x1FA2,	%o3
	fornot2s	%f9,	%f15,	%f1
	smulcc	%o5,	%i6,	%l0
	sllx	%l4,	%g5,	%i4
	edge32	%l1,	%o0,	%o4
	stw	%g3,	[%l7 + 0x48]
	udivcc	%l3,	0x145C,	%g2
	fandnot1s	%f22,	%f1,	%f15
	fmovdvs	%icc,	%f18,	%f18
	sethi	0x0C0B,	%o2
	array32	%l5,	%i3,	%o6
	ldx	[%l7 + 0x60],	%l2
	subcc	%g1,	%o1,	%l6
	movpos	%icc,	%i1,	%g7
	srlx	%i7,	%i5,	%o7
	popc	0x19E7,	%i0
	array16	%i2,	%g4,	%o3
	movrgez	%o5,	0x3CE,	%g6
	movrne	%l0,	%i6,	%g5
	save %i4, %l4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o4,	%o0,	%l3
	edge8l	%g2,	%g3,	%l5
	sethi	0x00C3,	%o2
	sdivx	%i3,	0x102D,	%o6
	movvs	%icc,	%g1,	%o1
	fsrc2	%f22,	%f6
	stx	%l6,	[%l7 + 0x48]
	ldd	[%l7 + 0x48],	%f8
	umulcc	%l2,	%g7,	%i7
	movpos	%icc,	%i1,	%o7
	movrne	%i5,	%i2,	%i0
	umul	%g4,	0x04A9,	%o5
	alignaddrl	%o3,	%g6,	%l0
	edge8l	%g5,	%i4,	%l4
	sll	%i6,	%o4,	%o0
	fones	%f28
	addc	%l3,	%g2,	%g3
	fmuld8ulx16	%f23,	%f2,	%f8
	fmovdgu	%xcc,	%f24,	%f13
	sra	%l1,	0x0A,	%l5
	fcmple32	%f4,	%f18,	%o2
	movvc	%xcc,	%i3,	%o6
	edge32n	%o1,	%g1,	%l6
	mulx	%g7,	%i7,	%l2
	fmovdg	%xcc,	%f21,	%f24
	movneg	%icc,	%o7,	%i1
	fnor	%f16,	%f6,	%f10
	udiv	%i2,	0x0674,	%i5
	mulscc	%g4,	%i0,	%o3
	ldub	[%l7 + 0x78],	%g6
	udivx	%l0,	0x13A8,	%g5
	ldsb	[%l7 + 0x21],	%i4
	fmovsleu	%icc,	%f19,	%f10
	edge32	%l4,	%o5,	%o4
	mova	%icc,	%i6,	%o0
	fsrc2	%f30,	%f20
	fabss	%f0,	%f20
	movg	%icc,	%g2,	%l3
	edge8l	%g3,	%l5,	%o2
	nop
	set	0x26, %l5
	lduh	[%l7 + %l5],	%l1
	ldx	[%l7 + 0x60],	%o6
	fpmerge	%f6,	%f10,	%f6
	fpmerge	%f17,	%f6,	%f16
	mulx	%i3,	%g1,	%l6
	add	%o1,	0x1FCE,	%i7
	edge16n	%l2,	%g7,	%o7
	addccc	%i1,	0x091D,	%i5
	lduw	[%l7 + 0x60],	%i2
	umulcc	%g4,	%i0,	%o3
	sll	%g6,	%l0,	%g5
	edge32n	%l4,	%o5,	%i4
	stw	%o4,	[%l7 + 0x34]
	movrlz	%i6,	%o0,	%g2
	or	%g3,	%l5,	%o2
	edge32	%l1,	%l3,	%i3
	stx	%o6,	[%l7 + 0x70]
	sllx	%g1,	%l6,	%i7
	edge16	%o1,	%l2,	%o7
	subccc	%i1,	0x1858,	%g7
	ldd	[%l7 + 0x60],	%f8
	mulscc	%i5,	%g4,	%i0
	umul	%o3,	%i2,	%g6
	bshuffle	%f12,	%f16,	%f30
	edge32n	%l0,	%l4,	%g5
	fmovrdgez	%i4,	%f30,	%f8
	fnot2	%f0,	%f20
	fmul8ulx16	%f12,	%f0,	%f12
	srax	%o5,	0x00,	%i6
	ldsb	[%l7 + 0x19],	%o4
	edge8l	%o0,	%g2,	%g3
	movcs	%xcc,	%o2,	%l5
	alignaddrl	%l1,	%i3,	%l3
	ldd	[%l7 + 0x08],	%f26
	ld	[%l7 + 0x28],	%f21
	add	%g1,	%l6,	%o6
	ldd	[%l7 + 0x28],	%o0
	movn	%xcc,	%i7,	%o7
	movrgez	%l2,	%g7,	%i1
	movgu	%icc,	%g4,	%i5
	xor	%i0,	0x0CDA,	%i2
	addc	%o3,	0x0638,	%l0
	smul	%l4,	%g5,	%g6
	stw	%i4,	[%l7 + 0x0C]
	stx	%i6,	[%l7 + 0x18]
	udiv	%o4,	0x0EA6,	%o5
	addcc	%o0,	0x10E8,	%g3
	fmovdl	%icc,	%f4,	%f15
	movgu	%xcc,	%g2,	%o2
	fone	%f4
	add	%l5,	0x0D7A,	%i3
	edge32ln	%l3,	%l1,	%l6
	xor	%o6,	0x0B60,	%g1
	or	%o1,	%i7,	%l2
	movre	%g7,	0x370,	%o7
	sub	%i1,	0x011D,	%g4
	edge16l	%i0,	%i5,	%i2
	xorcc	%l0,	0x1A3A,	%o3
	nop
	set	0x50, %g1
	ldsw	[%l7 + %g1],	%g5
	sir	0x02A2
	xor	%g6,	%i4,	%i6
	fmovrdlez	%l4,	%f4,	%f0
	xor	%o5,	%o0,	%o4
	stb	%g2,	[%l7 + 0x46]
	sub	%o2,	0x0CE5,	%l5
	sra	%i3,	%g3,	%l3
	alignaddr	%l6,	%l1,	%o6
	movrgz	%g1,	0x15F,	%i7
	movneg	%icc,	%l2,	%g7
	stw	%o1,	[%l7 + 0x60]
	umulcc	%o7,	0x0847,	%i1
	srlx	%i0,	0x02,	%i5
	fornot1	%f10,	%f18,	%f30
	array8	%g4,	%l0,	%o3
	edge16	%i2,	%g5,	%i4
	movleu	%xcc,	%g6,	%l4
	addccc	%i6,	%o0,	%o4
	movpos	%icc,	%g2,	%o5
	ldub	[%l7 + 0x59],	%l5
	udivcc	%o2,	0x0F62,	%g3
	lduw	[%l7 + 0x08],	%i3
	movleu	%xcc,	%l6,	%l1
	ldd	[%l7 + 0x30],	%f30
	srax	%o6,	%l3,	%g1
	sub	%l2,	%i7,	%g7
	and	%o1,	%i1,	%o7
	movrlez	%i0,	0x108,	%i5
	stw	%l0,	[%l7 + 0x50]
	stw	%o3,	[%l7 + 0x0C]
	fmovdvc	%icc,	%f8,	%f9
	movvs	%icc,	%g4,	%g5
	sdivx	%i2,	0x0F4A,	%i4
	fmuld8sux16	%f22,	%f28,	%f26
	sir	0x0BA9
	lduw	[%l7 + 0x68],	%g6
	for	%f18,	%f16,	%f14
	alignaddr	%i6,	%l4,	%o0
	mulx	%g2,	0x0B03,	%o5
	sth	%o4,	[%l7 + 0x34]
	sethi	0x1660,	%o2
	edge32n	%l5,	%i3,	%g3
	array16	%l6,	%l1,	%o6
	fnegd	%f12,	%f20
	fmuld8sux16	%f10,	%f12,	%f6
	fmuld8ulx16	%f13,	%f21,	%f24
	lduh	[%l7 + 0x76],	%l3
	movrlez	%g1,	%i7,	%l2
	addccc	%g7,	%i1,	%o1
	fmovrdlez	%o7,	%f22,	%f4
	fmovspos	%icc,	%f20,	%f4
	subccc	%i0,	%l0,	%o3
	ldsw	[%l7 + 0x1C],	%g4
	movneg	%xcc,	%g5,	%i2
	movrgz	%i4,	0x28D,	%g6
	movpos	%icc,	%i6,	%l4
	fmovdle	%xcc,	%f3,	%f22
	movl	%xcc,	%o0,	%g2
	popc	0x0303,	%i5
	edge8n	%o4,	%o2,	%o5
	edge8n	%l5,	%g3,	%i3
	siam	0x5
	sth	%l6,	[%l7 + 0x66]
	fmovrdlez	%o6,	%f6,	%f22
	nop
	set	0x41, %g3
	ldsb	[%l7 + %g3],	%l1
	movvs	%xcc,	%g1,	%l3
	ldd	[%l7 + 0x28],	%i6
	lduh	[%l7 + 0x64],	%g7
	udiv	%i1,	0x191F,	%l2
	for	%f26,	%f4,	%f16
	fmuld8sux16	%f1,	%f4,	%f8
	edge8ln	%o1,	%o7,	%l0
	fmul8x16al	%f1,	%f24,	%f2
	fcmpd	%fcc1,	%f6,	%f2
	add	%o3,	0x0F15,	%i0
	movcs	%xcc,	%g5,	%i2
	orncc	%i4,	0x0030,	%g4
	fandnot2s	%f12,	%f8,	%f18
	edge32l	%i6,	%g6,	%l4
	srax	%o0,	%i5,	%o4
	movvc	%icc,	%o2,	%o5
	movre	%g2,	%l5,	%i3
	lduh	[%l7 + 0x78],	%l6
	ldx	[%l7 + 0x30],	%o6
	restore %g3, %g1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f10,	%f22,	%f22
	andn	%l1,	%i7,	%i1
	xorcc	%g7,	0x0656,	%l2
	movne	%icc,	%o1,	%o7
	movne	%icc,	%l0,	%i0
	movrgez	%o3,	%g5,	%i4
	mova	%xcc,	%i2,	%g4
	and	%i6,	0x0BDA,	%l4
	sra	%o0,	%i5,	%g6
	fcmpne16	%f14,	%f22,	%o4
	st	%f29,	[%l7 + 0x18]
	udiv	%o5,	0x14C6,	%o2
	add	%g2,	0x0F15,	%l5
	edge16	%i3,	%o6,	%l6
	st	%f14,	[%l7 + 0x28]
	st	%f1,	[%l7 + 0x78]
	movrne	%g1,	%l3,	%l1
	movn	%xcc,	%i7,	%i1
	ldd	[%l7 + 0x30],	%f18
	movrgz	%g7,	0x09A,	%l2
	movleu	%xcc,	%g3,	%o7
	movpos	%xcc,	%l0,	%o1
	nop
	set	0x45, %o6
	stb	%o3,	[%l7 + %o6]
	subcc	%i0,	0x0502,	%g5
	array16	%i2,	%i4,	%g4
	lduh	[%l7 + 0x68],	%i6
	xnorcc	%l4,	%o0,	%g6
	fmovscs	%xcc,	%f20,	%f23
	ldsb	[%l7 + 0x26],	%o4
	stw	%o5,	[%l7 + 0x7C]
	ldsb	[%l7 + 0x71],	%i5
	lduw	[%l7 + 0x5C],	%g2
	mova	%icc,	%l5,	%i3
	fmovsleu	%icc,	%f16,	%f30
	movgu	%xcc,	%o6,	%o2
	smulcc	%g1,	%l3,	%l1
	ldub	[%l7 + 0x29],	%l6
	edge8ln	%i1,	%g7,	%l2
	alignaddrl	%i7,	%g3,	%o7
	andncc	%l0,	%o3,	%o1
	movge	%icc,	%g5,	%i0
	xor	%i4,	0x16DF,	%i2
	movrlz	%g4,	0x3FA,	%l4
	sir	0x0C44
	smulcc	%o0,	%g6,	%o4
	edge8ln	%o5,	%i5,	%g2
	lduh	[%l7 + 0x08],	%i6
	movne	%icc,	%i3,	%l5
	sth	%o2,	[%l7 + 0x28]
	movg	%xcc,	%o6,	%g1
	fmul8x16au	%f0,	%f25,	%f28
	movg	%xcc,	%l3,	%l1
	sdivcc	%i1,	0x18DB,	%g7
	st	%f31,	[%l7 + 0x54]
	mova	%icc,	%l6,	%i7
	orn	%l2,	0x0AFC,	%o7
	movrgez	%l0,	%o3,	%g3
	fmul8sux16	%f10,	%f26,	%f30
	fpadd16s	%f31,	%f31,	%f10
	fornot1s	%f19,	%f9,	%f0
	umulcc	%o1,	0x08CC,	%i0
	stw	%i4,	[%l7 + 0x4C]
	fxnor	%f4,	%f14,	%f10
	sra	%g5,	%g4,	%i2
	lduh	[%l7 + 0x08],	%o0
	movrgz	%l4,	%g6,	%o4
	movl	%xcc,	%o5,	%g2
	movrne	%i5,	%i6,	%l5
	sdiv	%o2,	0x035A,	%o6
	fcmpeq32	%f8,	%f12,	%g1
	udivcc	%i3,	0x1EE2,	%l3
	edge8	%l1,	%g7,	%l6
	fabsd	%f10,	%f16
	movrlez	%i7,	0x3B9,	%i1
	edge32	%o7,	%l2,	%o3
	alignaddrl	%g3,	%l0,	%o1
	movrlez	%i0,	%i4,	%g5
	movrgez	%g4,	0x236,	%i2
	xnorcc	%o0,	0x0453,	%l4
	udiv	%g6,	0x144F,	%o5
	addc	%o4,	%g2,	%i6
	umulcc	%l5,	0x08CF,	%i5
	fmovdneg	%icc,	%f19,	%f9
	fcmpgt16	%f10,	%f24,	%o6
	ld	[%l7 + 0x68],	%f18
	mova	%xcc,	%g1,	%i3
	addcc	%l3,	0x0BB4,	%o2
	fornot2	%f6,	%f22,	%f4
	udivcc	%l1,	0x03D2,	%g7
	fmovd	%f28,	%f26
	fmovrdgez	%i7,	%f2,	%f20
	fornot1	%f2,	%f28,	%f26
	ldd	[%l7 + 0x60],	%i0
	edge8l	%o7,	%l6,	%l2
	xnorcc	%g3,	0x132E,	%l0
	movrgez	%o1,	0x26C,	%i0
	movrne	%i4,	0x2F9,	%o3
	movrne	%g5,	%i2,	%o0
	edge32ln	%l4,	%g6,	%o5
	fmovrsgz	%g4,	%f25,	%f17
	smul	%o4,	0x140E,	%i6
	addccc	%g2,	0x1922,	%i5
	sir	0x1359
	movre	%o6,	0x166,	%g1
	udivx	%i3,	0x1CB8,	%l5
	edge16	%o2,	%l3,	%l1
	fmovdn	%icc,	%f4,	%f0
	udiv	%i7,	0x1BD6,	%g7
	sdivcc	%o7,	0x01BF,	%i1
	lduh	[%l7 + 0x10],	%l6
	array16	%l2,	%l0,	%g3
	xnor	%i0,	0x16E7,	%o1
	fcmpgt16	%f12,	%f10,	%i4
	ld	[%l7 + 0x4C],	%f10
	ldd	[%l7 + 0x38],	%f4
	fmovdgu	%icc,	%f23,	%f17
	fornot2	%f10,	%f6,	%f6
	fmovsa	%icc,	%f28,	%f26
	xorcc	%o3,	0x0A90,	%i2
	sdiv	%o0,	0x16A2,	%g5
	movleu	%xcc,	%l4,	%o5
	fpsub16s	%f9,	%f19,	%f22
	fmovdcc	%xcc,	%f30,	%f3
	sir	0x0FB4
	sth	%g4,	[%l7 + 0x1E]
	xorcc	%o4,	0x09BA,	%i6
	array32	%g6,	%g2,	%i5
	ldd	[%l7 + 0x78],	%f14
	srlx	%g1,	%i3,	%o6
	sth	%l5,	[%l7 + 0x20]
	fnors	%f24,	%f28,	%f23
	movpos	%xcc,	%o2,	%l1
	fpadd16	%f16,	%f2,	%f6
	sir	0x1DE9
	fpadd32	%f2,	%f6,	%f10
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	movrlz	%i1,	0x197,	%o7
	restore %l6, 0x1057, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f6,	%f12,	%f2
	movn	%xcc,	%l2,	%i0
	andncc	%o1,	%i4,	%g3
	ldd	[%l7 + 0x20],	%o2
	smul	%o0,	%g5,	%i2
	sth	%l4,	[%l7 + 0x78]
	st	%f0,	[%l7 + 0x38]
	fmovrslz	%o5,	%f1,	%f21
	fmovrdgz	%g4,	%f8,	%f26
	sdivcc	%o4,	0x09B7,	%g6
	edge16	%i6,	%i5,	%g2
	mova	%icc,	%i3,	%g1
	sra	%l5,	%o2,	%o6
	addc	%i7,	%l1,	%l3
	fmovdpos	%xcc,	%f28,	%f10
	sdiv	%g7,	0x0081,	%o7
	movrgz	%i1,	0x07F,	%l6
	fcmpd	%fcc0,	%f12,	%f14
	ldsb	[%l7 + 0x79],	%l0
	orcc	%l2,	%i0,	%i4
	lduh	[%l7 + 0x3A],	%o1
	edge16ln	%o3,	%o0,	%g5
	fandnot2s	%f18,	%f28,	%f20
	fornot2s	%f31,	%f14,	%f11
	udivcc	%g3,	0x05AE,	%i2
	ldub	[%l7 + 0x10],	%l4
	sir	0x045F
	mulscc	%o5,	%g4,	%o4
	sth	%g6,	[%l7 + 0x56]
	sdivx	%i6,	0x1819,	%i5
	xorcc	%g2,	%g1,	%l5
	edge8l	%i3,	%o6,	%o2
	movrlez	%i7,	0x38A,	%l3
	save %l1, %o7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l6,	0x15,	%i1
	edge16n	%l0,	%i0,	%i4
	mova	%icc,	%l2,	%o1
	movpos	%icc,	%o3,	%g5
	save %g3, %i2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o5,	%g4,	%o0
	movrlz	%o4,	%g6,	%i5
	xor	%i6,	%g2,	%l5
	edge8ln	%i3,	%o6,	%g1
	movgu	%xcc,	%i7,	%o2
	orcc	%l1,	%l3,	%g7
	movneg	%icc,	%o7,	%i1
	or	%l0,	0x1A69,	%i0
	movleu	%xcc,	%l6,	%l2
	fmovsge	%icc,	%f2,	%f0
	umulcc	%i4,	%o3,	%o1
	xnorcc	%g3,	%g5,	%l4
	udivcc	%o5,	0x1484,	%i2
	lduh	[%l7 + 0x28],	%g4
	array32	%o0,	%g6,	%i5
	ldsw	[%l7 + 0x48],	%i6
	edge8l	%o4,	%l5,	%g2
	edge8ln	%i3,	%o6,	%g1
	edge16	%o2,	%i7,	%l1
	movrne	%l3,	%o7,	%g7
	movrgez	%i1,	%l0,	%i0
	lduw	[%l7 + 0x24],	%l2
	fpadd16	%f26,	%f0,	%f4
	movneg	%icc,	%l6,	%i4
	array8	%o3,	%o1,	%g3
	fpadd16s	%f9,	%f13,	%f14
	fpsub32	%f0,	%f8,	%f20
	fmovrse	%g5,	%f31,	%f29
	movgu	%xcc,	%l4,	%o5
	sll	%g4,	%i2,	%o0
	movrlez	%i5,	0x393,	%g6
	movcs	%xcc,	%i6,	%o4
	edge32	%g2,	%i3,	%o6
	stx	%l5,	[%l7 + 0x38]
	alignaddr	%o2,	%i7,	%l1
	movpos	%xcc,	%l3,	%o7
	sdivcc	%g7,	0x0550,	%i1
	smulcc	%l0,	0x10F5,	%i0
	smul	%g1,	0x17FC,	%l6
	sllx	%i4,	%l2,	%o1
	movvc	%icc,	%o3,	%g3
	edge8l	%l4,	%g5,	%o5
	sethi	0x0FC0,	%g4
	lduh	[%l7 + 0x70],	%o0
	fabss	%f1,	%f3
	fmovda	%icc,	%f29,	%f31
	edge16n	%i2,	%i5,	%g6
	movrlez	%o4,	%i6,	%g2
	edge16n	%i3,	%l5,	%o2
	stb	%i7,	[%l7 + 0x70]
	umulcc	%l1,	%o6,	%l3
	mulscc	%g7,	0x0F97,	%o7
	subc	%l0,	0x0A1C,	%i1
	stw	%i0,	[%l7 + 0x18]
	faligndata	%f18,	%f14,	%f24
	fsrc2s	%f24,	%f9
	alignaddrl	%l6,	%i4,	%g1
	edge16l	%o1,	%o3,	%l2
	movneg	%xcc,	%l4,	%g5
	alignaddrl	%g3,	%o5,	%o0
	nop
	set	0x0A, %l1
	lduh	[%l7 + %l1],	%g4
	movgu	%icc,	%i2,	%g6
	movleu	%xcc,	%i5,	%o4
	xorcc	%g2,	0x0B6E,	%i6
	addcc	%l5,	%i3,	%i7
	sth	%o2,	[%l7 + 0x38]
	movn	%icc,	%o6,	%l1
	movge	%icc,	%l3,	%g7
	fzero	%f14
	fcmpgt16	%f2,	%f16,	%o7
	sdiv	%l0,	0x0CAF,	%i1
	ldsb	[%l7 + 0x6B],	%l6
	fmovd	%f12,	%f6
	udiv	%i0,	0x1A67,	%g1
	fnot2	%f2,	%f28
	edge8ln	%o1,	%o3,	%l2
	mova	%icc,	%l4,	%i4
	move	%xcc,	%g3,	%g5
	array8	%o5,	%o0,	%g4
	movrgez	%i2,	0x324,	%i5
	edge8ln	%g6,	%g2,	%i6
	fmovdl	%xcc,	%f20,	%f8
	fnot2s	%f25,	%f29
	std	%f28,	[%l7 + 0x18]
	edge8	%o4,	%l5,	%i7
	movvs	%xcc,	%i3,	%o2
	smulcc	%o6,	%l1,	%l3
	smulcc	%g7,	0x14EA,	%o7
	mova	%icc,	%i1,	%l6
	fcmpd	%fcc2,	%f18,	%f4
	sth	%l0,	[%l7 + 0x50]
	ldd	[%l7 + 0x08],	%i0
	ldx	[%l7 + 0x20],	%g1
	edge16	%o1,	%o3,	%l2
	movpos	%xcc,	%l4,	%i4
	lduw	[%l7 + 0x10],	%g5
	fmovdcs	%xcc,	%f1,	%f18
	nop
	set	0x10, %i2
	std	%f8,	[%l7 + %i2]
	fmovsn	%xcc,	%f25,	%f1
	andn	%o5,	0x138B,	%o0
	mova	%icc,	%g4,	%i2
	movpos	%xcc,	%g3,	%g6
	add	%g2,	%i5,	%i6
	ld	[%l7 + 0x40],	%f2
	movre	%l5,	0x0F1,	%o4
	fmovde	%icc,	%f7,	%f5
	ldub	[%l7 + 0x36],	%i3
	movge	%icc,	%i7,	%o6
	edge8	%o2,	%l3,	%l1
	fpack16	%f20,	%f7
	or	%o7,	0x1036,	%g7
	edge8ln	%l6,	%i1,	%l0
	movrgez	%g1,	%i0,	%o1
	alignaddrl	%o3,	%l4,	%i4
	bshuffle	%f28,	%f8,	%f2
	movg	%xcc,	%g5,	%o5
	mulx	%o0,	%g4,	%i2
	movn	%xcc,	%g3,	%g6
	fnot2	%f18,	%f16
	array8	%g2,	%l2,	%i5
	sdivx	%l5,	0x164A,	%i6
	add	%o4,	0x1827,	%i3
	movne	%icc,	%i7,	%o2
	ldsh	[%l7 + 0x36],	%o6
	fmul8x16	%f27,	%f8,	%f12
	fmovscc	%xcc,	%f9,	%f23
	xnor	%l3,	%o7,	%g7
	orn	%l6,	%i1,	%l0
	sethi	0x113E,	%g1
	movl	%xcc,	%i0,	%o1
	sdivcc	%l1,	0x1198,	%l4
	udivcc	%o3,	0x0454,	%i4
	orcc	%o5,	0x0BC3,	%g5
	fcmpgt16	%f18,	%f2,	%g4
	fors	%f8,	%f14,	%f12
	smulcc	%o0,	0x1B49,	%g3
	alignaddrl	%i2,	%g2,	%g6
	edge8n	%i5,	%l2,	%i6
	edge32ln	%l5,	%o4,	%i3
	movvc	%icc,	%i7,	%o6
	nop
	set	0x08, %i4
	ldsw	[%l7 + %i4],	%o2
	sdiv	%l3,	0x0C79,	%g7
	smulcc	%o7,	%l6,	%i1
	movn	%xcc,	%l0,	%i0
	array16	%o1,	%l1,	%g1
	and	%l4,	%i4,	%o5
	udivx	%o3,	0x135F,	%g5
	fmovscc	%xcc,	%f13,	%f3
	udivx	%g4,	0x1540,	%o0
	andncc	%g3,	%i2,	%g6
	edge32ln	%i5,	%l2,	%g2
	alignaddr	%i6,	%l5,	%i3
	sra	%i7,	%o4,	%o2
	movg	%icc,	%o6,	%g7
	edge8n	%o7,	%l6,	%l3
	fpsub32s	%f17,	%f21,	%f7
	fmovsle	%xcc,	%f28,	%f22
	fpsub16s	%f5,	%f23,	%f18
	movrgez	%i1,	%l0,	%o1
	movcs	%xcc,	%l1,	%g1
	ldsw	[%l7 + 0x6C],	%i0
	andn	%l4,	%o5,	%o3
	fpsub16s	%f15,	%f21,	%f21
	ldsb	[%l7 + 0x65],	%g5
	movle	%icc,	%g4,	%o0
	ldsb	[%l7 + 0x22],	%g3
	srl	%i2,	0x08,	%g6
	edge16ln	%i5,	%i4,	%l2
	fmovsa	%xcc,	%f14,	%f21
	sub	%i6,	0x0D1A,	%g2
	srax	%l5,	%i7,	%o4
	addc	%i3,	%o6,	%g7
	mulscc	%o7,	%l6,	%l3
	xor	%i1,	%l0,	%o1
	edge32l	%o2,	%g1,	%i0
	edge8l	%l1,	%o5,	%o3
	ldx	[%l7 + 0x28],	%l4
	fmovdvc	%xcc,	%f29,	%f5
	movrgz	%g4,	%g5,	%o0
	edge32n	%g3,	%g6,	%i5
	add	%i4,	%l2,	%i6
	xnor	%g2,	%i2,	%l5
	edge8ln	%i7,	%o4,	%i3
	fmovsn	%xcc,	%f7,	%f22
	movrlez	%g7,	0x001,	%o6
	stw	%o7,	[%l7 + 0x58]
	edge32	%l3,	%l6,	%i1
	movre	%o1,	0x04D,	%o2
	edge8l	%g1,	%l0,	%l1
	edge32ln	%i0,	%o5,	%l4
	fpack32	%f30,	%f0,	%f0
	fnot2s	%f4,	%f22
	movre	%g4,	0x1E5,	%o3
	lduh	[%l7 + 0x74],	%g5
	move	%xcc,	%g3,	%g6
	fmovrdgz	%o0,	%f20,	%f0
	movcc	%icc,	%i4,	%i5
	fexpand	%f13,	%f22
	srlx	%l2,	0x1E,	%g2
	movle	%icc,	%i6,	%l5
	fmovsgu	%icc,	%f20,	%f28
	mulx	%i2,	%i7,	%i3
	addcc	%o4,	%g7,	%o6
	mulx	%o7,	%l3,	%l6
	ldsh	[%l7 + 0x08],	%i1
	xnorcc	%o2,	0x1BD2,	%o1
	movcs	%xcc,	%g1,	%l1
	sethi	0x1C76,	%l0
	addccc	%i0,	%o5,	%g4
	sir	0x07C7
	add	%l4,	%g5,	%g3
	lduh	[%l7 + 0x52],	%o3
	and	%g6,	%i4,	%i5
	fxor	%f2,	%f8,	%f4
	edge32l	%l2,	%o0,	%g2
	lduw	[%l7 + 0x2C],	%l5
	ld	[%l7 + 0x38],	%f8
	nop
	set	0x6B, %o1
	ldsb	[%l7 + %o1],	%i2
	movcs	%xcc,	%i6,	%i7
	srlx	%o4,	%g7,	%i3
	movrlz	%o6,	%l3,	%o7
	movrne	%i1,	0x151,	%o2
	addc	%o1,	%l6,	%l1
	sllx	%l0,	%i0,	%g1
	movvc	%xcc,	%o5,	%g4
	movge	%icc,	%l4,	%g5
	xorcc	%o3,	0x1208,	%g3
	fmovda	%icc,	%f29,	%f12
	subccc	%i4,	0x11BD,	%i5
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	fxnors	%f5,	%f9,	%f0
	umul	%o0,	%l5,	%i2
	movre	%i6,	0x3EA,	%o4
	movrne	%g7,	0x1C9,	%i3
	edge32l	%o6,	%i7,	%l3
	edge32l	%i1,	%o7,	%o1
	edge16l	%l6,	%l1,	%o2
	mova	%xcc,	%i0,	%l0
	fcmpgt16	%f0,	%f16,	%g1
	movpos	%icc,	%g4,	%l4
	fxnors	%f6,	%f8,	%f16
	umulcc	%g5,	%o5,	%g3
	array8	%o3,	%i4,	%g6
	sdivcc	%l2,	0x056A,	%i5
	add	%g2,	0x1072,	%o0
	edge32	%l5,	%i2,	%i6
	sll	%o4,	0x01,	%g7
	bshuffle	%f14,	%f22,	%f4
	fandnot1	%f0,	%f8,	%f26
	udiv	%i3,	0x03AA,	%o6
	sir	0x1E8D
	smul	%l3,	0x05A0,	%i7
	or	%i1,	%o1,	%o7
	addccc	%l1,	0x1E6C,	%l6
	xnorcc	%i0,	0x05AD,	%o2
	fsrc1s	%f31,	%f10
	stx	%g1,	[%l7 + 0x78]
	nop
	set	0x0C, %l4
	ldub	[%l7 + %l4],	%g4
	movre	%l4,	0x241,	%g5
	orn	%o5,	0x1C55,	%l0
	fmovdle	%xcc,	%f16,	%f22
	edge8ln	%g3,	%i4,	%o3
	umul	%l2,	0x0B3C,	%g6
	andncc	%i5,	%o0,	%l5
	or	%i2,	0x1C0C,	%g2
	andn	%o4,	%g7,	%i3
	umulcc	%i6,	0x11BA,	%l3
	ld	[%l7 + 0x30],	%f3
	umul	%i7,	0x1A9C,	%o6
	movre	%i1,	%o1,	%l1
	udiv	%o7,	0x0430,	%i0
	std	%f22,	[%l7 + 0x70]
	udivx	%o2,	0x0FDF,	%g1
	subccc	%l6,	0x0E6B,	%l4
	xor	%g5,	0x06B3,	%g4
	edge16ln	%l0,	%g3,	%i4
	nop
	set	0x18, %g2
	stw	%o3,	[%l7 + %g2]
	edge32ln	%o5,	%g6,	%l2
	bshuffle	%f18,	%f30,	%f20
	movleu	%xcc,	%o0,	%i5
	orncc	%i2,	%l5,	%o4
	movgu	%xcc,	%g7,	%g2
	fmovd	%f20,	%f2
	subccc	%i3,	0x0FF3,	%i6
	udiv	%l3,	0x0161,	%o6
	udiv	%i1,	0x03D3,	%o1
	lduw	[%l7 + 0x1C],	%l1
	mova	%icc,	%o7,	%i7
	movne	%xcc,	%i0,	%g1
	movle	%icc,	%o2,	%l6
	fmovrdgez	%g5,	%f18,	%f12
	fpackfix	%f2,	%f14
	fmul8sux16	%f24,	%f12,	%f20
	subcc	%g4,	%l0,	%l4
	andcc	%g3,	0x0BE6,	%i4
	fcmpd	%fcc3,	%f0,	%f22
	edge8ln	%o5,	%g6,	%o3
	fmovsn	%icc,	%f22,	%f17
	fpsub16	%f0,	%f8,	%f8
	srl	%l2,	0x0B,	%i5
	fnegd	%f26,	%f22
	movcs	%icc,	%o0,	%l5
	fornot2	%f16,	%f30,	%f0
	edge32n	%i2,	%o4,	%g2
	xor	%i3,	0x1605,	%g7
	movvs	%xcc,	%l3,	%o6
	move	%xcc,	%i6,	%i1
	st	%f27,	[%l7 + 0x18]
	ldd	[%l7 + 0x48],	%l0
	array8	%o7,	%i7,	%o1
	udivcc	%g1,	0x0AB1,	%o2
	addcc	%i0,	%l6,	%g4
	fpack16	%f4,	%f2
	umul	%l0,	%g5,	%l4
	sdiv	%i4,	0x053D,	%g3
	udivx	%o5,	0x168E,	%g6
	edge8l	%l2,	%i5,	%o0
	fzero	%f2
	fpsub32	%f22,	%f14,	%f6
	udivcc	%l5,	0x1AF2,	%o3
	edge32	%i2,	%g2,	%i3
	srlx	%o4,	0x0A,	%l3
	fmovsa	%xcc,	%f9,	%f4
	srl	%g7,	0x1C,	%o6
	st	%f26,	[%l7 + 0x18]
	fpadd32s	%f28,	%f27,	%f8
	popc	%i1,	%i6
	ldub	[%l7 + 0x0B],	%l1
	udiv	%i7,	0x0BD6,	%o7
	fzero	%f30
	movrgz	%g1,	0x083,	%o2
	edge16l	%i0,	%o1,	%g4
	add	%l0,	%l6,	%l4
	movrlz	%i4,	0x355,	%g3
	stb	%g5,	[%l7 + 0x12]
	sethi	0x1479,	%o5
	fmovrsgez	%l2,	%f25,	%f26
	fmul8sux16	%f20,	%f24,	%f0
	edge32ln	%g6,	%i5,	%o0
	addcc	%l5,	%i2,	%o3
	restore %g2, %o4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f0,	%f6,	%g7
	andcc	%i3,	0x130E,	%i1
	stb	%o6,	[%l7 + 0x38]
	edge8ln	%i6,	%i7,	%l1
	alignaddr	%g1,	%o7,	%i0
	fpsub16	%f20,	%f14,	%f8
	edge32	%o1,	%o2,	%l0
	sdiv	%l6,	0x1329,	%l4
	udiv	%i4,	0x01B6,	%g4
	nop
	set	0x50, %o5
	stx	%g3,	[%l7 + %o5]
	movrne	%g5,	%l2,	%o5
	alignaddr	%i5,	%g6,	%l5
	lduw	[%l7 + 0x20],	%o0
	ldd	[%l7 + 0x40],	%o2
	fnegd	%f4,	%f26
	edge32n	%g2,	%i2,	%o4
	edge16n	%l3,	%i3,	%g7
	edge32l	%o6,	%i6,	%i1
	lduh	[%l7 + 0x74],	%i7
	edge16ln	%l1,	%g1,	%i0
	alignaddrl	%o1,	%o7,	%o2
	st	%f0,	[%l7 + 0x20]
	ld	[%l7 + 0x3C],	%f17
	stx	%l6,	[%l7 + 0x20]
	lduh	[%l7 + 0x7E],	%l0
	ldx	[%l7 + 0x20],	%l4
	movrlz	%g4,	0x08A,	%i4
	fmovdgu	%icc,	%f11,	%f10
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	fxnor	%f22,	%f4,	%f30
	sth	%o5,	[%l7 + 0x50]
	std	%f12,	[%l7 + 0x48]
	ldx	[%l7 + 0x28],	%l2
	movrne	%g6,	0x157,	%l5
	movvs	%xcc,	%o0,	%i5
	fmovdvs	%icc,	%f26,	%f25
	fmovsvc	%xcc,	%f30,	%f4
	sll	%g2,	0x1D,	%o3
	stb	%o4,	[%l7 + 0x46]
	ld	[%l7 + 0x70],	%f19
	andcc	%l3,	0x1878,	%i3
	fands	%f0,	%f23,	%f12
	movrne	%i2,	0x22D,	%o6
	movle	%icc,	%i6,	%i1
	addc	%i7,	%g7,	%g1
	edge8	%i0,	%l1,	%o1
	movrlez	%o2,	%o7,	%l6
	movneg	%icc,	%l0,	%g4
	sth	%l4,	[%l7 + 0x58]
	xorcc	%g3,	%g5,	%i4
	movrgz	%l2,	%o5,	%l5
	fmovdvs	%icc,	%f11,	%f23
	lduh	[%l7 + 0x40],	%g6
	sth	%o0,	[%l7 + 0x20]
	alignaddr	%i5,	%o3,	%g2
	fmovsne	%xcc,	%f29,	%f5
	movgu	%xcc,	%o4,	%i3
	movvs	%xcc,	%l3,	%i2
	edge16	%i6,	%o6,	%i1
	edge16ln	%g7,	%i7,	%g1
	fxnor	%f26,	%f28,	%f6
	orn	%l1,	0x00B3,	%i0
	movcc	%icc,	%o2,	%o7
	fornot2	%f10,	%f30,	%f22
	sdivx	%o1,	0x0991,	%l0
	orcc	%g4,	0x03C3,	%l6
	edge16ln	%l4,	%g3,	%i4
	or	%g5,	%l2,	%o5
	srlx	%l5,	%g6,	%o0
	fmovdn	%icc,	%f27,	%f9
	andcc	%i5,	0x05F1,	%o3
	addccc	%o4,	0x0A1F,	%g2
	sethi	0x0C92,	%l3
	xor	%i2,	%i6,	%i3
	addcc	%i1,	0x17AF,	%o6
	srl	%g7,	0x1B,	%g1
	fnegs	%f9,	%f17
	stw	%l1,	[%l7 + 0x64]
	movne	%icc,	%i0,	%o2
	movcs	%xcc,	%o7,	%o1
	ldd	[%l7 + 0x08],	%l0
	addcc	%g4,	0x0B75,	%l6
	add	%l4,	%g3,	%i4
	edge8l	%i7,	%l2,	%g5
	srax	%o5,	%l5,	%g6
	sub	%o0,	%o3,	%o4
	andcc	%g2,	0x18F6,	%i5
	smulcc	%l3,	0x06B6,	%i6
	save %i3, %i2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g7,	0x0D,	%g1
	orncc	%i1,	0x1EFA,	%l1
	fandnot2	%f18,	%f10,	%f30
	movn	%icc,	%o2,	%o7
	fand	%f0,	%f20,	%f8
	or	%o1,	0x1BF8,	%i0
	xor	%g4,	0x0394,	%l0
	movre	%l6,	0x1C7,	%g3
	st	%f3,	[%l7 + 0x18]
	st	%f14,	[%l7 + 0x18]
	fmovsg	%xcc,	%f1,	%f25
	for	%f28,	%f24,	%f22
	umulcc	%i4,	0x1B63,	%i7
	std	%f10,	[%l7 + 0x08]
	smul	%l2,	0x02F1,	%l4
	udiv	%g5,	0x0558,	%l5
	fand	%f2,	%f2,	%f4
	popc	0x1F40,	%o5
	movrgez	%o0,	0x2B0,	%o3
	srl	%g6,	%o4,	%i5
	udivx	%g2,	0x1D57,	%l3
	fmuld8ulx16	%f30,	%f9,	%f30
	stb	%i6,	[%l7 + 0x60]
	sir	0x0A62
	array16	%i3,	%o6,	%g7
	fmovrdne	%i2,	%f12,	%f4
	stx	%g1,	[%l7 + 0x68]
	movrne	%i1,	0x3CC,	%l1
	mulx	%o2,	0x0BB4,	%o7
	edge16ln	%i0,	%g4,	%l0
	movvs	%icc,	%l6,	%g3
	st	%f3,	[%l7 + 0x24]
	or	%o1,	%i4,	%i7
	ldsh	[%l7 + 0x7C],	%l2
	srax	%l4,	%l5,	%g5
	sethi	0x0329,	%o0
	edge16n	%o5,	%o3,	%g6
	sth	%o4,	[%l7 + 0x38]
	edge32n	%i5,	%l3,	%g2
	srax	%i6,	0x09,	%i3
	alignaddrl	%g7,	%o6,	%g1
	movrgez	%i2,	%i1,	%l1
	stb	%o7,	[%l7 + 0x70]
	subc	%i0,	%o2,	%g4
	edge32n	%l0,	%g3,	%l6
	movvc	%xcc,	%i4,	%i7
	fnand	%f28,	%f22,	%f18
	xnorcc	%l2,	0x039E,	%o1
	stx	%l5,	[%l7 + 0x10]
	popc	%l4,	%o0
	fands	%f12,	%f6,	%f9
	orcc	%o5,	0x1993,	%g5
	alignaddrl	%o3,	%o4,	%g6
	sth	%i5,	[%l7 + 0x14]
	edge8l	%l3,	%i6,	%i3
	umulcc	%g2,	%o6,	%g1
	movrlez	%g7,	0x1B2,	%i2
	movrne	%i1,	%l1,	%o7
	andcc	%o2,	0x1108,	%i0
	movrlez	%g4,	%l0,	%l6
	ldsw	[%l7 + 0x50],	%i4
	alignaddr	%i7,	%l2,	%g3
	std	%f16,	[%l7 + 0x18]
	fmul8x16	%f9,	%f18,	%f22
	fpadd32s	%f25,	%f27,	%f26
	fsrc1	%f28,	%f8
	fpackfix	%f0,	%f11
	edge16n	%o1,	%l5,	%o0
	edge8ln	%l4,	%g5,	%o5
	movvc	%icc,	%o4,	%o3
	movneg	%xcc,	%i5,	%g6
	stb	%l3,	[%l7 + 0x57]
	movcc	%xcc,	%i3,	%g2
	fcmpgt16	%f28,	%f28,	%o6
	fmovde	%icc,	%f23,	%f10
	fandnot1s	%f0,	%f3,	%f31
	srl	%i6,	0x12,	%g7
	edge32l	%g1,	%i2,	%l1
	andcc	%i1,	%o7,	%o2
	fmuld8ulx16	%f4,	%f0,	%f0
	srlx	%i0,	%l0,	%g4
	fexpand	%f27,	%f16
	ldx	[%l7 + 0x30],	%l6
	fmovsleu	%xcc,	%f2,	%f6
	ldd	[%l7 + 0x50],	%f30
	fnegs	%f16,	%f5
	nop
	set	0x18, %l3
	ldx	[%l7 + %l3],	%i7
	alignaddr	%l2,	%g3,	%o1
	movgu	%xcc,	%l5,	%o0
	edge16n	%i4,	%g5,	%o5
	sub	%o4,	0x04EF,	%l4
	movrne	%i5,	%g6,	%l3
	movl	%icc,	%o3,	%i3
	alignaddr	%g2,	%o6,	%g7
	std	%f26,	[%l7 + 0x40]
	ldd	[%l7 + 0x48],	%f22
	umulcc	%i6,	%g1,	%l1
	fxnor	%f24,	%f16,	%f10
	xnor	%i1,	0x0A1E,	%o7
	sth	%i2,	[%l7 + 0x7E]
	smul	%o2,	0x003A,	%l0
	fandnot2s	%f19,	%f21,	%f4
	restore %g4, %i0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l6,	%g3,	%o1
	udivcc	%l5,	0x0ACA,	%l2
	addccc	%i4,	0x1FA0,	%g5
	movle	%icc,	%o5,	%o0
	stw	%o4,	[%l7 + 0x38]
	edge16l	%l4,	%i5,	%g6
	sra	%o3,	%i3,	%g2
	fcmpne32	%f16,	%f4,	%l3
	edge8n	%o6,	%g7,	%g1
	smul	%i6,	%l1,	%i1
	smulcc	%o7,	0x14BA,	%i2
	movn	%xcc,	%l0,	%o2
	fmovrslz	%i0,	%f13,	%f17
	ld	[%l7 + 0x1C],	%f26
	subc	%g4,	%l6,	%i7
	ldsb	[%l7 + 0x2E],	%o1
	movrgez	%l5,	%l2,	%g3
	fandnot2	%f4,	%f4,	%f2
	movrlez	%i4,	%g5,	%o0
	ldd	[%l7 + 0x38],	%o4
	movge	%icc,	%l4,	%i5
	smulcc	%g6,	%o3,	%o4
	movn	%icc,	%i3,	%g2
	smul	%o6,	0x137A,	%g7
	ldsw	[%l7 + 0x38],	%g1
	alignaddr	%l3,	%i6,	%l1
	fnot2	%f28,	%f30
	nop
	set	0x16, %g4
	lduh	[%l7 + %g4],	%o7
	smulcc	%i1,	0x162F,	%i2
	srl	%o2,	%i0,	%l0
	addcc	%l6,	0x0521,	%g4
	mulscc	%o1,	0x1A7E,	%l5
	movn	%icc,	%l2,	%i7
	xnorcc	%g3,	0x1425,	%g5
	or	%o0,	0x1318,	%o5
	andcc	%l4,	0x0EBC,	%i4
	fcmpgt32	%f4,	%f12,	%i5
	smulcc	%o3,	0x0464,	%g6
	xorcc	%o4,	%g2,	%i3
	array32	%g7,	%o6,	%g1
	edge8	%i6,	%l1,	%l3
	subccc	%o7,	0x0B6F,	%i2
	sdiv	%o2,	0x024F,	%i1
	smul	%l0,	%l6,	%g4
	fcmps	%fcc1,	%f21,	%f31
	edge32n	%o1,	%i0,	%l5
	xorcc	%l2,	%i7,	%g3
	xorcc	%o0,	%o5,	%g5
	movcs	%icc,	%l4,	%i5
	ld	[%l7 + 0x54],	%f5
	smul	%o3,	%g6,	%o4
	fnor	%f26,	%f10,	%f12
	lduh	[%l7 + 0x6C],	%i4
	std	%f24,	[%l7 + 0x18]
	xor	%g2,	%g7,	%o6
	sub	%i3,	%i6,	%g1
	edge16	%l1,	%o7,	%i2
	alignaddrl	%l3,	%i1,	%o2
	and	%l0,	%l6,	%g4
	edge16n	%o1,	%l5,	%l2
	fcmps	%fcc3,	%f7,	%f3
	ldsw	[%l7 + 0x0C],	%i0
	edge16n	%g3,	%o0,	%o5
	fmovsge	%icc,	%f23,	%f25
	fones	%f30
	std	%f28,	[%l7 + 0x10]
	umulcc	%g5,	0x05A0,	%l4
	edge32n	%i5,	%o3,	%g6
	mulscc	%i7,	0x0CEE,	%i4
	st	%f24,	[%l7 + 0x4C]
	fmovrslez	%o4,	%f18,	%f21
	xorcc	%g7,	%o6,	%g2
	or	%i6,	%g1,	%i3
	ldd	[%l7 + 0x68],	%f18
	sdiv	%o7,	0x0403,	%i2
	movle	%xcc,	%l1,	%l3
	mulscc	%i1,	%o2,	%l0
	movcc	%icc,	%l6,	%g4
	umulcc	%l5,	%o1,	%i0
	fnot2	%f18,	%f2
	movge	%icc,	%g3,	%l2
	edge16ln	%o5,	%g5,	%o0
	srax	%i5,	0x0B,	%l4
	edge8l	%g6,	%i7,	%i4
	fmovrsne	%o3,	%f19,	%f20
	movre	%g7,	0x1B3,	%o6
	fmovspos	%icc,	%f29,	%f30
	array16	%o4,	%g2,	%g1
	addc	%i6,	0x0D88,	%o7
	edge8	%i3,	%l1,	%l3
	srax	%i1,	%i2,	%o2
	srl	%l6,	%l0,	%g4
	movrgez	%o1,	0x287,	%l5
	sll	%i0,	%g3,	%l2
	fandnot1s	%f7,	%f1,	%f2
	fands	%f7,	%f10,	%f9
	edge32	%g5,	%o5,	%i5
	edge32	%l4,	%o0,	%g6
	movl	%icc,	%i4,	%i7
	fmovdg	%icc,	%f19,	%f11
	udiv	%g7,	0x0410,	%o3
	movvc	%xcc,	%o4,	%o6
	fmovscs	%xcc,	%f18,	%f27
	movrgez	%g2,	%g1,	%o7
	udivcc	%i6,	0x1CF7,	%i3
	sethi	0x0FCB,	%l1
	move	%icc,	%l3,	%i1
	edge32l	%o2,	%l6,	%i2
	movne	%xcc,	%g4,	%o1
	fcmpes	%fcc1,	%f24,	%f23
	fmovrdgez	%l5,	%f16,	%f12
	subc	%i0,	0x076A,	%l0
	array8	%g3,	%g5,	%o5
	add	%l2,	0x0CA7,	%l4
	movrlez	%i5,	%g6,	%o0
	edge8n	%i4,	%g7,	%o3
	movcs	%xcc,	%o4,	%i7
	sth	%g2,	[%l7 + 0x32]
	addc	%g1,	0x0939,	%o7
	ldsw	[%l7 + 0x44],	%o6
	fnot2s	%f8,	%f15
	edge32l	%i6,	%i3,	%l3
	ldd	[%l7 + 0x78],	%f6
	save %l1, 0x1E1A, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o2,	%i2,	%l6
	fors	%f12,	%f5,	%f23
	movpos	%icc,	%o1,	%l5
	or	%g4,	%l0,	%g3
	array8	%g5,	%o5,	%i0
	edge8ln	%l4,	%i5,	%l2
	sll	%o0,	%i4,	%g7
	ld	[%l7 + 0x68],	%f28
	movrlz	%o3,	%o4,	%i7
	save %g6, %g2, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o6,	%i6,	%i3
	movgu	%icc,	%l3,	%o7
	sllx	%l1,	0x0E,	%i1
	sdiv	%o2,	0x1EE0,	%i2
	edge16ln	%l6,	%o1,	%g4
	fnor	%f24,	%f16,	%f16
	sir	0x097E
	addc	%l5,	0x122F,	%l0
	mulx	%g5,	%g3,	%i0
	nop
	set	0x30, %l6
	std	%f6,	[%l7 + %l6]
	ldsw	[%l7 + 0x18],	%o5
	fpack16	%f6,	%f5
	movrlez	%l4,	0x090,	%l2
	movcs	%xcc,	%o0,	%i5
	fxors	%f20,	%f11,	%f25
	fmovsge	%xcc,	%f25,	%f31
	edge32l	%g7,	%o3,	%i4
	movl	%xcc,	%o4,	%i7
	fmovsg	%xcc,	%f25,	%f8
	edge8	%g6,	%g1,	%g2
	subc	%o6,	%i6,	%l3
	srl	%i3,	0x01,	%l1
	fcmpes	%fcc2,	%f0,	%f22
	lduh	[%l7 + 0x28],	%o7
	smul	%i1,	%o2,	%i2
	fmovsn	%xcc,	%f14,	%f11
	lduh	[%l7 + 0x10],	%l6
	nop
	set	0x62, %i6
	ldsb	[%l7 + %i6],	%g4
	movrlz	%l5,	0x399,	%l0
	st	%f31,	[%l7 + 0x08]
	ldd	[%l7 + 0x28],	%g4
	edge16n	%o1,	%g3,	%o5
	addcc	%i0,	%l4,	%o0
	srax	%i5,	0x0F,	%g7
	sub	%o3,	0x0E1C,	%l2
	fmovdneg	%icc,	%f23,	%f10
	orcc	%o4,	0x0A72,	%i4
	ldx	[%l7 + 0x18],	%i7
	array16	%g1,	%g2,	%o6
	fcmpes	%fcc3,	%f15,	%f24
	fmovdl	%icc,	%f18,	%f5
	edge16ln	%i6,	%g6,	%l3
	edge16	%i3,	%o7,	%l1
	fmovsleu	%icc,	%f30,	%f11
	edge16n	%i1,	%i2,	%o2
	udivx	%g4,	0x1A7D,	%l5
	subc	%l0,	0x01D0,	%g5
	edge16n	%o1,	%g3,	%l6
	fmovsneg	%icc,	%f23,	%f26
	movre	%i0,	0x3AE,	%o5
	movvc	%xcc,	%l4,	%i5
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f30
	mulscc	%g7,	0x0001,	%o0
	fandnot1s	%f20,	%f24,	%f10
	fpack16	%f10,	%f27
	movpos	%xcc,	%l2,	%o3
	movn	%icc,	%o4,	%i7
	movg	%icc,	%i4,	%g1
	subcc	%o6,	0x094F,	%g2
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%f26
	udivcc	%i6,	0x113A,	%l3
	and	%i3,	%g6,	%o7
	and	%l1,	0x1BE6,	%i1
	movpos	%xcc,	%i2,	%g4
	orn	%l5,	%l0,	%o2
	lduh	[%l7 + 0x5C],	%g5
	ldub	[%l7 + 0x4F],	%o1
	udivx	%g3,	0x0CEC,	%l6
	sethi	0x13B7,	%o5
	ldub	[%l7 + 0x7B],	%l4
	movne	%xcc,	%i5,	%g7
	st	%f25,	[%l7 + 0x44]
	subcc	%o0,	%l2,	%o3
	edge8	%i0,	%i7,	%o4
	sub	%i4,	0x063C,	%o6
	fpsub32s	%f26,	%f18,	%f29
	edge16	%g1,	%g2,	%l3
	edge16n	%i6,	%i3,	%o7
	mulscc	%g6,	%i1,	%i2
	movrgz	%g4,	%l5,	%l1
	fzeros	%f29
	andcc	%o2,	%l0,	%g5
	movleu	%xcc,	%g3,	%l6
	ld	[%l7 + 0x48],	%f13
	edge16ln	%o1,	%l4,	%i5
	umulcc	%g7,	0x0948,	%o0
	sdivcc	%o5,	0x082F,	%o3
	movg	%icc,	%i0,	%l2
	sir	0x15C4
	fmovspos	%xcc,	%f14,	%f26
	subcc	%i7,	0x13F1,	%i4
	xor	%o4,	%g1,	%g2
	movcc	%icc,	%o6,	%l3
	subc	%i3,	0x10C8,	%i6
	sdivcc	%g6,	0x1A37,	%o7
	sir	0x0343
	movcs	%xcc,	%i1,	%i2
	movrne	%g4,	0x2D3,	%l5
	fmovrsne	%l1,	%f16,	%f8
	movne	%xcc,	%l0,	%g5
	std	%f8,	[%l7 + 0x78]
	fcmpgt32	%f0,	%f8,	%g3
	edge32l	%o2,	%l6,	%l4
	sir	0x0D33
	fsrc2s	%f17,	%f25
	edge8ln	%o1,	%g7,	%i5
	fsrc2	%f10,	%f6
	st	%f11,	[%l7 + 0x64]
	movvs	%icc,	%o5,	%o3
	stw	%i0,	[%l7 + 0x70]
	edge32	%l2,	%o0,	%i4
	movrgez	%i7,	%g1,	%o4
	fmovrdgez	%g2,	%f2,	%f24
	edge32	%l3,	%o6,	%i6
	fmovrsgz	%g6,	%f0,	%f25
	movcs	%icc,	%o7,	%i1
	movvc	%xcc,	%i2,	%i3
	orncc	%g4,	0x127A,	%l1
	fmovsle	%xcc,	%f30,	%f26
	sethi	0x0A95,	%l5
	sdivx	%l0,	0x185D,	%g5
	movle	%icc,	%o2,	%g3
	fpmerge	%f7,	%f30,	%f14
	movn	%icc,	%l6,	%l4
	orn	%g7,	0x148D,	%o1
	xorcc	%o5,	%o3,	%i0
	movvs	%icc,	%i5,	%l2
	movrlez	%o0,	%i4,	%g1
	movre	%o4,	0x28D,	%i7
	addc	%l3,	%o6,	%i6
	fmovdleu	%icc,	%f9,	%f4
	array8	%g2,	%o7,	%i1
	ldx	[%l7 + 0x50],	%g6
	fcmpd	%fcc3,	%f0,	%f0
	fmovrse	%i3,	%f0,	%f10
	udiv	%i2,	0x0B7B,	%g4
	sllx	%l1,	0x1B,	%l5
	fpsub16s	%f25,	%f4,	%f2
	mulscc	%g5,	0x0849,	%o2
	array16	%l0,	%l6,	%g3
	edge16ln	%l4,	%o1,	%g7
	array32	%o3,	%i0,	%i5
	array8	%o5,	%o0,	%i4
	addcc	%g1,	0x1358,	%l2
	array16	%i7,	%o4,	%o6
	subcc	%l3,	0x028C,	%i6
	ldd	[%l7 + 0x68],	%o6
	fmovdgu	%xcc,	%f28,	%f8
	movl	%icc,	%g2,	%i1
	srl	%g6,	%i3,	%g4
	sdivx	%i2,	0x03B0,	%l5
	ldx	[%l7 + 0x50],	%g5
	movvs	%icc,	%o2,	%l0
	fmovdl	%icc,	%f8,	%f12
	fnand	%f22,	%f0,	%f20
	fmovsg	%xcc,	%f15,	%f29
	ldsh	[%l7 + 0x54],	%l1
	fpsub16s	%f18,	%f2,	%f8
	sir	0x1EDA
	orncc	%g3,	%l6,	%o1
	sll	%l4,	0x00,	%g7
	fcmpne16	%f20,	%f8,	%i0
	movvs	%icc,	%i5,	%o5
	smul	%o0,	%i4,	%g1
	edge32n	%l2,	%o3,	%o4
	movcc	%icc,	%i7,	%o6
	movrne	%l3,	0x084,	%i6
	movrne	%o7,	0x081,	%g2
	fmovscs	%icc,	%f1,	%f9
	movg	%icc,	%i1,	%g6
	edge32l	%g4,	%i3,	%l5
	smulcc	%i2,	%g5,	%l0
	movrgz	%l1,	%o2,	%l6
	orncc	%o1,	%l4,	%g7
	sdivx	%g3,	0x166A,	%i5
	umulcc	%i0,	%o5,	%o0
	edge16	%g1,	%i4,	%l2
	sir	0x1CD3
	fxnors	%f15,	%f21,	%f26
	sdivx	%o3,	0x0655,	%i7
	subcc	%o4,	%l3,	%o6
	edge16ln	%i6,	%o7,	%i1
	lduw	[%l7 + 0x34],	%g2
	popc	0x0962,	%g4
	udivcc	%g6,	0x0062,	%i3
	umul	%l5,	0x0FB3,	%g5
	movrlez	%i2,	0x2AE,	%l1
	fcmped	%fcc3,	%f26,	%f26
	save %o2, 0x0C35, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l0,	%l4,	%o1
	fmovrdlez	%g3,	%f8,	%f28
	ldx	[%l7 + 0x58],	%i5
	smul	%i0,	0x167C,	%g7
	movpos	%icc,	%o5,	%o0
	st	%f31,	[%l7 + 0x60]
	movle	%xcc,	%i4,	%g1
	movge	%icc,	%l2,	%o3
	movn	%icc,	%o4,	%i7
	movl	%icc,	%o6,	%i6
	sir	0x1E71
	xorcc	%o7,	0x1085,	%i1
	movleu	%xcc,	%g2,	%g4
	sra	%l3,	%g6,	%i3
	edge8	%l5,	%i2,	%l1
	or	%o2,	0x0034,	%l6
	andncc	%g5,	%l0,	%l4
	add	%g3,	%i5,	%i0
	movrgz	%o1,	%g7,	%o5
	popc	%i4,	%o0
	edge8n	%g1,	%l2,	%o3
	movre	%o4,	%i7,	%i6
	movvc	%xcc,	%o6,	%o7
	fcmple32	%f30,	%f4,	%g2
	fmovda	%icc,	%f21,	%f31
	movg	%icc,	%i1,	%l3
	movcs	%xcc,	%g4,	%g6
	fmul8ulx16	%f22,	%f12,	%f22
	edge32n	%i3,	%l5,	%i2
	udiv	%o2,	0x1B0A,	%l1
	add	%g5,	%l6,	%l0
	xorcc	%g3,	0x1592,	%l4
	fmovdle	%icc,	%f1,	%f4
	save %i5, 0x1255, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%icc,	%f11,	%f26
	popc	%g7,	%o5
	srax	%i0,	%i4,	%g1
	addcc	%l2,	%o3,	%o0
	edge16	%i7,	%i6,	%o4
	movg	%xcc,	%o7,	%g2
	ldub	[%l7 + 0x65],	%i1
	smulcc	%l3,	0x0A7F,	%o6
	fmovdcc	%xcc,	%f2,	%f8
	fmovdle	%xcc,	%f20,	%f1
	popc	%g6,	%g4
	fmovdn	%xcc,	%f0,	%f7
	array16	%i3,	%i2,	%o2
	andn	%l5,	%g5,	%l6
	ldd	[%l7 + 0x50],	%l0
	addcc	%g3,	0x1BFF,	%l4
	sir	0x194B
	sll	%i5,	0x10,	%l0
	mova	%icc,	%g7,	%o5
	alignaddrl	%i0,	%i4,	%o1
	andncc	%l2,	%o3,	%o0
	ldsw	[%l7 + 0x54],	%i7
	orn	%i6,	0x0C71,	%o4
	movrlez	%o7,	0x16D,	%g2
	srl	%g1,	%l3,	%i1
	movpos	%icc,	%o6,	%g6
	edge8	%i3,	%g4,	%i2
	movg	%icc,	%l5,	%g5
	edge16ln	%o2,	%l6,	%l1
	andn	%l4,	%i5,	%l0
	xnor	%g7,	%g3,	%i0
	umulcc	%i4,	0x0FAC,	%o5
	orn	%l2,	0x1A00,	%o1
	movl	%icc,	%o0,	%o3
	fcmps	%fcc2,	%f16,	%f31
	mulscc	%i7,	0x18AA,	%i6
	orncc	%o7,	%o4,	%g2
	fmovrdlz	%g1,	%f28,	%f4
	ldx	[%l7 + 0x58],	%l3
	movrgez	%i1,	%o6,	%g6
	movgu	%xcc,	%i3,	%g4
	nop
	set	0x6C, %l0
	lduw	[%l7 + %l0],	%i2
	umulcc	%l5,	%o2,	%l6
	movg	%icc,	%g5,	%l4
	edge16l	%l1,	%l0,	%i5
	or	%g7,	0x07CB,	%i0
	ldsh	[%l7 + 0x28],	%g3
	addccc	%o5,	%l2,	%i4
	sll	%o1,	%o3,	%i7
	fnot1s	%f24,	%f6
	srlx	%o0,	%i6,	%o7
	movre	%o4,	0x35C,	%g2
	edge8l	%l3,	%g1,	%i1
	ldub	[%l7 + 0x32],	%o6
	movneg	%icc,	%i3,	%g6
	fmul8sux16	%f8,	%f16,	%f10
	fpackfix	%f28,	%f2
	andcc	%g4,	%i2,	%l5
	movrne	%o2,	0x31A,	%g5
	ldsb	[%l7 + 0x23],	%l6
	mova	%xcc,	%l4,	%l1
	fxnor	%f10,	%f26,	%f4
	lduw	[%l7 + 0x50],	%l0
	fxors	%f22,	%f28,	%f14
	orncc	%g7,	%i0,	%g3
	umul	%i5,	0x10BC,	%o5
	fmovdpos	%xcc,	%f19,	%f17
	movleu	%icc,	%l2,	%o1
	ldx	[%l7 + 0x20],	%i4
	ldub	[%l7 + 0x71],	%o3
	andcc	%o0,	0x0F57,	%i7
	movg	%xcc,	%o7,	%o4
	nop
	set	0x41, %l2
	ldsb	[%l7 + %l2],	%g2
	movcs	%xcc,	%i6,	%l3
	edge16ln	%i1,	%g1,	%i3
	fmovdl	%xcc,	%f6,	%f29
	alignaddr	%g6,	%o6,	%i2
	move	%xcc,	%l5,	%o2
	movrgez	%g5,	%g4,	%l4
	edge16n	%l1,	%l0,	%g7
	movgu	%icc,	%l6,	%i0
	array16	%g3,	%i5,	%o5
	sllx	%l2,	0x1D,	%i4
	fmovdleu	%icc,	%f5,	%f8
	movge	%xcc,	%o3,	%o1
	fsrc2	%f0,	%f12
	sth	%o0,	[%l7 + 0x18]
	edge16n	%o7,	%o4,	%g2
	fcmped	%fcc2,	%f20,	%f6
	mova	%xcc,	%i6,	%i7
	ldub	[%l7 + 0x41],	%l3
	and	%i1,	%g1,	%i3
	move	%icc,	%g6,	%o6
	edge16ln	%i2,	%l5,	%o2
	movleu	%xcc,	%g4,	%l4
	fornot2s	%f31,	%f21,	%f0
	movrne	%l1,	0x02C,	%g5
	save %l0, 0x1AAA, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i0,	0x0ED0,	%g3
	movge	%icc,	%i5,	%o5
	udiv	%l2,	0x0AC0,	%i4
	movcs	%icc,	%o3,	%o1
	sdiv	%l6,	0x1EFB,	%o7
	sdivcc	%o0,	0x0017,	%o4
	edge32l	%i6,	%i7,	%g2
	fmovsvc	%icc,	%f23,	%f30
	ldd	[%l7 + 0x40],	%f4
	sra	%i1,	0x0B,	%l3
	fcmps	%fcc0,	%f8,	%f18
	fxors	%f2,	%f2,	%f19
	fabsd	%f12,	%f6
	movneg	%icc,	%g1,	%g6
	mulscc	%o6,	0x1FEF,	%i3
	fones	%f0
	movl	%icc,	%l5,	%i2
	and	%g4,	0x118F,	%l4
	fpack16	%f12,	%f9
	edge8l	%l1,	%o2,	%l0
	sub	%g7,	%i0,	%g5
	subcc	%i5,	%o5,	%g3
	ldub	[%l7 + 0x2B],	%l2
	lduh	[%l7 + 0x3A],	%i4
	alignaddrl	%o1,	%l6,	%o7
	fmovsge	%xcc,	%f26,	%f5
	srax	%o0,	%o4,	%o3
	lduh	[%l7 + 0x76],	%i6
	movrgz	%g2,	%i7,	%i1
	xor	%g1,	0x0973,	%g6
	fmovrde	%l3,	%f12,	%f8
	mulscc	%o6,	%l5,	%i3
	fnor	%f28,	%f20,	%f0
	addc	%g4,	0x0008,	%i2
	movneg	%xcc,	%l1,	%l4
	fabss	%f8,	%f20
	fpadd32s	%f17,	%f0,	%f5
	fpadd16s	%f12,	%f20,	%f6
	xnor	%l0,	%g7,	%i0
	edge8	%o2,	%i5,	%g5
	edge16l	%g3,	%o5,	%i4
	fandnot2s	%f23,	%f7,	%f31
	lduh	[%l7 + 0x38],	%l2
	fpsub16s	%f8,	%f5,	%f5
	movrlez	%l6,	0x1A3,	%o7
	srl	%o0,	%o1,	%o3
	edge32	%o4,	%i6,	%i7
	ldd	[%l7 + 0x48],	%i0
	orcc	%g1,	%g6,	%g2
	addcc	%o6,	%l3,	%l5
	movpos	%xcc,	%i3,	%i2
	srax	%g4,	%l1,	%l0
	sth	%g7,	[%l7 + 0x1C]
	edge16	%l4,	%o2,	%i0
	movg	%icc,	%i5,	%g5
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	movn	%xcc,	%l2,	%o5
	array32	%l6,	%o7,	%o1
	fmovdvc	%xcc,	%f25,	%f3
	fmovsneg	%xcc,	%f26,	%f6
	movgu	%icc,	%o0,	%o4
	orn	%i6,	0x1F59,	%o3
	st	%f29,	[%l7 + 0x14]
	nop
	set	0x5D, %g6
	ldsb	[%l7 + %g6],	%i7
	alignaddr	%i1,	%g1,	%g6
	movcs	%xcc,	%g2,	%o6
	srl	%l5,	%l3,	%i2
	mulscc	%g4,	%l1,	%i3
	array32	%g7,	%l0,	%l4
	ldsh	[%l7 + 0x44],	%o2
	fmuld8sux16	%f9,	%f26,	%f2
	fmovrsgez	%i5,	%f25,	%f26
	fmovrsgz	%g5,	%f18,	%f29
	edge32n	%g3,	%i4,	%i0
	xor	%o5,	0x0348,	%l6
	ldsb	[%l7 + 0x6F],	%l2
	sll	%o7,	%o0,	%o4
	fnands	%f2,	%f13,	%f17
	xorcc	%i6,	0x1E29,	%o1
	udivcc	%i7,	0x004B,	%o3
	umulcc	%i1,	%g6,	%g1
	srax	%o6,	%l5,	%l3
	movrgz	%i2,	%g2,	%g4
	movcs	%xcc,	%l1,	%g7
	movleu	%icc,	%i3,	%l4
	movleu	%icc,	%l0,	%o2
	sdivx	%i5,	0x005A,	%g5
	move	%xcc,	%i4,	%g3
	fmovsle	%icc,	%f15,	%f5
	smulcc	%i0,	%o5,	%l6
	sll	%o7,	%o0,	%l2
	popc	0x1462,	%i6
	fmovda	%xcc,	%f19,	%f3
	fmuld8sux16	%f26,	%f1,	%f14
	sth	%o4,	[%l7 + 0x5A]
	smul	%i7,	%o3,	%i1
	srl	%o1,	%g6,	%g1
	stw	%l5,	[%l7 + 0x58]
	ldub	[%l7 + 0x2E],	%l3
	andn	%i2,	0x0F35,	%g2
	srlx	%o6,	%g4,	%l1
	fpadd32	%f2,	%f30,	%f6
	alignaddr	%g7,	%i3,	%l0
	fmuld8ulx16	%f23,	%f0,	%f28
	ldsw	[%l7 + 0x10],	%l4
	udivcc	%o2,	0x18EB,	%g5
	subc	%i4,	%i5,	%i0
	st	%f13,	[%l7 + 0x4C]
	movcs	%icc,	%o5,	%g3
	movn	%icc,	%o7,	%o0
	alignaddr	%l2,	%i6,	%o4
	movgu	%icc,	%l6,	%i7
	stw	%o3,	[%l7 + 0x48]
	mulx	%o1,	%g6,	%i1
	fmovdle	%icc,	%f17,	%f4
	alignaddr	%g1,	%l5,	%i2
	fmovdl	%icc,	%f1,	%f11
	subcc	%g2,	0x1709,	%l3
	movrlez	%o6,	0x239,	%g4
	edge16l	%g7,	%l1,	%i3
	fornot2s	%f13,	%f7,	%f30
	fnot1	%f14,	%f0
	movrlez	%l4,	%l0,	%g5
	fcmpgt16	%f0,	%f24,	%o2
	udivcc	%i4,	0x0BA8,	%i5
	pdist	%f0,	%f26,	%f8
	edge8l	%o5,	%i0,	%o7
	andncc	%g3,	%l2,	%i6
	fcmpeq16	%f10,	%f12,	%o0
	srl	%l6,	%i7,	%o3
	sdiv	%o1,	0x0CFB,	%g6
	movpos	%xcc,	%i1,	%g1
	save %o4, %l5, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%l3,	%i2
	sdivx	%o6,	0x0BE0,	%g4
	sdivx	%l1,	0x16B9,	%i3
	srlx	%l4,	0x0A,	%l0
	srax	%g5,	%o2,	%i4
	orncc	%g7,	0x0539,	%i5
	fnands	%f19,	%f26,	%f17
	std	%f14,	[%l7 + 0x28]
	sth	%i0,	[%l7 + 0x4C]
	sdivcc	%o7,	0x104D,	%o5
	restore %l2, %g3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l6,	0x071F,	%i7
	array8	%o0,	%o3,	%g6
	std	%f0,	[%l7 + 0x60]
	udivx	%o1,	0x0F71,	%i1
	subcc	%g1,	%o4,	%g2
	lduh	[%l7 + 0x1C],	%l3
	save %l5, %o6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f2,	%f6,	%f16
	fmovscc	%icc,	%f17,	%f3
	fors	%f10,	%f24,	%f19
	fmovs	%f10,	%f28
	edge32ln	%g4,	%i3,	%l4
	mova	%icc,	%l1,	%g5
	fmovsa	%icc,	%f25,	%f2
	fmovdge	%icc,	%f15,	%f29
	fsrc1s	%f21,	%f15
	sub	%l0,	%o2,	%i4
	edge32l	%g7,	%i5,	%i0
	edge16	%o5,	%o7,	%g3
	fmovdvc	%xcc,	%f22,	%f17
	edge16n	%i6,	%l2,	%l6
	ldsb	[%l7 + 0x2A],	%i7
	ldsw	[%l7 + 0x28],	%o0
	movgu	%icc,	%g6,	%o3
	edge32ln	%i1,	%o1,	%o4
	array32	%g2,	%g1,	%l3
	edge16ln	%l5,	%i2,	%o6
	ldd	[%l7 + 0x48],	%i2
	mova	%xcc,	%l4,	%l1
	movle	%icc,	%g5,	%g4
	movle	%xcc,	%o2,	%i4
	movrlez	%l0,	%i5,	%i0
	std	%f18,	[%l7 + 0x68]
	xorcc	%o5,	0x1D25,	%o7
	fmovrslz	%g7,	%f15,	%f2
	fpadd32s	%f3,	%f1,	%f30
	sir	0x08EB
	sll	%g3,	0x00,	%l2
	addccc	%l6,	0x1B81,	%i6
	fcmpeq16	%f4,	%f2,	%i7
	fmovrse	%o0,	%f1,	%f15
	fmovdvs	%xcc,	%f27,	%f9
	ldsb	[%l7 + 0x51],	%g6
	fnegd	%f6,	%f12
	orn	%o3,	%o1,	%i1
	smulcc	%g2,	0x0C86,	%g1
	srl	%l3,	0x04,	%l5
	fcmpd	%fcc1,	%f6,	%f18
	orn	%o4,	%o6,	%i2
	array32	%i3,	%l4,	%g5
	array8	%l1,	%o2,	%i4
	movrgz	%l0,	0x393,	%i5
	xorcc	%g4,	0x1D55,	%o5
	movleu	%icc,	%i0,	%o7
	popc	0x109F,	%g7
	addcc	%l2,	0x0259,	%g3
	udiv	%i6,	0x0EDE,	%l6
	orncc	%o0,	%i7,	%g6
	edge16l	%o3,	%o1,	%i1
	ld	[%l7 + 0x10],	%f13
	movcc	%xcc,	%g2,	%g1
	mulx	%l3,	0x04F2,	%o4
	edge16	%o6,	%l5,	%i3
	and	%i2,	0x18C8,	%g5
	nop
	set	0x44, %o7
	stw	%l4,	[%l7 + %o7]
	ldd	[%l7 + 0x58],	%f16
	srax	%l1,	%o2,	%i4
	subcc	%l0,	0x1126,	%i5
	ldd	[%l7 + 0x08],	%o4
	subcc	%i0,	0x0CB2,	%g4
	stw	%o7,	[%l7 + 0x78]
	alignaddrl	%g7,	%g3,	%l2
	movneg	%icc,	%l6,	%i6
	andncc	%o0,	%g6,	%o3
	fmovdne	%icc,	%f10,	%f22
	std	%f28,	[%l7 + 0x50]
	fandnot1	%f10,	%f2,	%f6
	and	%i7,	0x0C39,	%o1
	movcs	%icc,	%i1,	%g2
	ldx	[%l7 + 0x18],	%g1
	addc	%l3,	%o6,	%l5
	smul	%i3,	0x17D5,	%o4
	stb	%i2,	[%l7 + 0x5C]
	stw	%l4,	[%l7 + 0x78]
	fnot1s	%f28,	%f28
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%f12
	siam	0x1
	srlx	%l1,	0x16,	%o2
	stx	%g5,	[%l7 + 0x28]
	fnand	%f10,	%f8,	%f30
	st	%f7,	[%l7 + 0x48]
	popc	0x1F47,	%i4
	popc	0x1B10,	%i5
	fcmpne16	%f6,	%f18,	%o5
	movre	%i0,	0x31D,	%l0
	udivcc	%g4,	0x0AD9,	%o7
	faligndata	%f12,	%f12,	%f2
	edge32n	%g7,	%l2,	%g3
	ldsb	[%l7 + 0x38],	%i6
	edge32	%o0,	%l6,	%g6
	movn	%icc,	%i7,	%o1
	xnorcc	%o3,	0x1DD2,	%i1
	subccc	%g1,	%l3,	%o6
	orn	%g2,	0x0A46,	%l5
	fmovsle	%icc,	%f18,	%f22
	st	%f22,	[%l7 + 0x5C]
	mova	%xcc,	%i3,	%i2
	edge16n	%o4,	%l1,	%o2
	movgu	%xcc,	%g5,	%i4
	lduh	[%l7 + 0x14],	%i5
	stx	%o5,	[%l7 + 0x48]
	std	%f12,	[%l7 + 0x20]
	xorcc	%l4,	0x1FE9,	%l0
	sll	%g4,	0x1B,	%o7
	addccc	%i0,	%l2,	%g3
	sdivcc	%i6,	0x1C52,	%o0
	edge8	%g7,	%g6,	%l6
	ld	[%l7 + 0x70],	%f0
	fpadd32s	%f22,	%f21,	%f20
	movrlz	%i7,	0x2E6,	%o1
	movcs	%xcc,	%i1,	%o3
	sllx	%g1,	%l3,	%g2
	sth	%o6,	[%l7 + 0x4E]
	mova	%icc,	%i3,	%i2
	edge16l	%l5,	%l1,	%o2
	or	%o4,	%i4,	%i5
	fmovspos	%xcc,	%f3,	%f1
	for	%f18,	%f4,	%f8
	movge	%xcc,	%o5,	%g5
	movrne	%l0,	0x349,	%l4
	edge16ln	%o7,	%g4,	%i0
	xor	%l2,	0x107C,	%i6
	fandnot2s	%f11,	%f30,	%f27
	and	%g3,	0x0D99,	%g7
	fcmple16	%f26,	%f0,	%g6
	xnorcc	%o0,	%l6,	%i7
	movvs	%icc,	%o1,	%i1
	subc	%g1,	%l3,	%g2
	fmovdvs	%xcc,	%f26,	%f26
	sir	0x1E37
	movleu	%xcc,	%o3,	%i3
	sra	%i2,	%o6,	%l1
	movrgz	%l5,	0x144,	%o2
	sub	%o4,	0x17F1,	%i4
	smul	%i5,	0x0E20,	%o5
	subcc	%g5,	0x0FE6,	%l4
	edge32l	%o7,	%g4,	%l0
	movn	%icc,	%l2,	%i0
	fmovrdgz	%g3,	%f2,	%f22
	sethi	0x0263,	%i6
	fnot1s	%f10,	%f3
	edge16l	%g7,	%o0,	%l6
	movle	%icc,	%g6,	%o1
	movrlez	%i1,	0x21A,	%g1
	udiv	%i7,	0x0545,	%l3
	fcmpne32	%f18,	%f12,	%g2
	move	%xcc,	%o3,	%i3
	fandnot1s	%f18,	%f2,	%f18
	orcc	%o6,	%l1,	%i2
	subccc	%l5,	0x0C9E,	%o2
	movpos	%xcc,	%o4,	%i5
	movge	%icc,	%i4,	%g5
	umulcc	%l4,	0x1D21,	%o5
	fmovsl	%icc,	%f10,	%f14
	fnand	%f22,	%f18,	%f30
	fcmpeq32	%f12,	%f8,	%g4
	umulcc	%o7,	%l0,	%i0
	fmovdge	%xcc,	%f25,	%f21
	movn	%xcc,	%g3,	%l2
	srl	%g7,	%o0,	%i6
	movvs	%xcc,	%l6,	%o1
	fmuld8ulx16	%f21,	%f28,	%f10
	nop
	set	0x78, %o2
	std	%f10,	[%l7 + %o2]
	popc	%g6,	%i1
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	orn	%g2,	%o3,	%i3
	movgu	%icc,	%l3,	%o6
	edge8l	%l1,	%l5,	%i2
	edge32n	%o4,	%i5,	%i4
	movrlz	%o2,	0x384,	%g5
	udivx	%o5,	0x0336,	%g4
	move	%icc,	%o7,	%l4
	stw	%i0,	[%l7 + 0x70]
	movrlez	%l0,	0x339,	%l2
	fmul8x16au	%f25,	%f28,	%f26
	ldd	[%l7 + 0x30],	%g2
	mulx	%o0,	%g7,	%i6
	fpack32	%f26,	%f20,	%f24
	movrne	%o1,	0x294,	%g6
	movgu	%xcc,	%i1,	%g1
	stx	%i7,	[%l7 + 0x70]
	nop
	set	0x70, %g5
	lduh	[%l7 + %g5],	%l6
	srl	%g2,	0x0F,	%o3
	subccc	%i3,	0x0793,	%o6
	subc	%l1,	0x1E2D,	%l3
	or	%i2,	%l5,	%i5
	fnot2s	%f8,	%f0
	movle	%icc,	%i4,	%o2
	andcc	%g5,	0x04EC,	%o4
	and	%o5,	0x0A21,	%g4
	subc	%l4,	0x0004,	%o7
	sra	%l0,	0x0D,	%l2
	std	%f8,	[%l7 + 0x18]
	fmul8x16al	%f16,	%f4,	%f14
	edge16n	%i0,	%o0,	%g7
	edge16	%g3,	%o1,	%g6
	nop
	set	0x78, %o0
	ldsb	[%l7 + %o0],	%i6
	andcc	%i1,	0x19A3,	%g1
	smul	%l6,	%i7,	%o3
	udivx	%i3,	0x060B,	%g2
	fpadd32	%f4,	%f8,	%f12
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%f26
	movvs	%xcc,	%l1,	%l3
	subccc	%i2,	0x1F7B,	%l5
	siam	0x5
	fmovsne	%icc,	%f4,	%f0
	subcc	%o6,	%i5,	%i4
	edge16ln	%g5,	%o2,	%o4
	fornot2	%f14,	%f10,	%f2
	std	%f8,	[%l7 + 0x40]
	movrlz	%g4,	0x352,	%o5
	udiv	%o7,	0x16BB,	%l0
	fmovsleu	%xcc,	%f16,	%f23
	edge32ln	%l2,	%i0,	%o0
	fmovda	%icc,	%f6,	%f18
	stw	%g7,	[%l7 + 0x08]
	sub	%g3,	%o1,	%g6
	sdivcc	%l4,	0x1EBF,	%i1
	edge32	%i6,	%l6,	%g1
	move	%icc,	%i7,	%i3
	fmovdneg	%xcc,	%f0,	%f24
	fmovdge	%xcc,	%f15,	%f19
	andn	%o3,	%l1,	%l3
	alignaddr	%g2,	%i2,	%o6
	movl	%icc,	%l5,	%i4
	ldub	[%l7 + 0x37],	%g5
	subcc	%o2,	%o4,	%i5
	subc	%g4,	0x13A1,	%o5
	ldsw	[%l7 + 0x18],	%o7
	sra	%l2,	0x0D,	%i0
	stw	%l0,	[%l7 + 0x24]
	fmovdpos	%icc,	%f14,	%f22
	edge32n	%g7,	%g3,	%o0
	fornot1	%f26,	%f16,	%f14
	addcc	%g6,	%o1,	%l4
	movrgez	%i6,	%i1,	%g1
	xorcc	%l6,	%i3,	%i7
	movn	%icc,	%o3,	%l3
	add	%l1,	0x04CF,	%g2
	fcmpne32	%f6,	%f4,	%i2
	fmovd	%f10,	%f12
	sethi	0x0D15,	%o6
	xor	%l5,	%g5,	%o2
	movvs	%xcc,	%o4,	%i5
	andncc	%g4,	%o5,	%i4
	array16	%o7,	%i0,	%l0
	movrgez	%l2,	0x075,	%g3
	andncc	%g7,	%g6,	%o1
	ldub	[%l7 + 0x6D],	%o0
	mova	%icc,	%l4,	%i1
	movn	%icc,	%g1,	%l6
	fmovrsne	%i3,	%f13,	%f3
	lduh	[%l7 + 0x6C],	%i7
	fmovsle	%xcc,	%f9,	%f8
	srax	%i6,	0x09,	%l3
	fmovrdgez	%l1,	%f10,	%f0
	fnot1	%f24,	%f2
	mova	%icc,	%o3,	%g2
	andn	%i2,	0x0D28,	%o6
	sdivx	%g5,	0x00C9,	%o2
	sub	%l5,	%i5,	%o4
	movrne	%o5,	0x196,	%g4
	sdivcc	%o7,	0x1111,	%i4
	array16	%i0,	%l0,	%l2
	movle	%xcc,	%g3,	%g7
	move	%xcc,	%g6,	%o1
	stb	%l4,	[%l7 + 0x7E]
	fpadd16	%f16,	%f14,	%f28
	fmovdle	%xcc,	%f30,	%f14
	movge	%icc,	%i1,	%o0
	ldsh	[%l7 + 0x66],	%l6
	popc	0x13C9,	%i3
	sllx	%g1,	%i6,	%i7
	fandnot1	%f22,	%f18,	%f24
	ldd	[%l7 + 0x10],	%l0
	or	%o3,	0x1311,	%l3
	fzeros	%f23
	umulcc	%i2,	%o6,	%g2
	movge	%xcc,	%g5,	%o2
	subccc	%i5,	%l5,	%o5
	movgu	%xcc,	%g4,	%o4
	sth	%o7,	[%l7 + 0x4E]
	popc	0x12CE,	%i4
	fxor	%f2,	%f4,	%f6
	or	%i0,	%l0,	%g3
	stw	%l2,	[%l7 + 0x28]
	udivcc	%g7,	0x1C53,	%g6
	srlx	%o1,	0x13,	%i1
	edge32l	%o0,	%l6,	%l4
	sll	%i3,	%i6,	%i7
	fone	%f24
	fnand	%f14,	%f10,	%f22
	umulcc	%l1,	0x0492,	%g1
	movrgez	%l3,	%i2,	%o6
	fnot2s	%f13,	%f25
	movre	%g2,	0x1CE,	%o3
	fmovd	%f6,	%f8
	xnor	%o2,	0x1C0E,	%i5
	sdivcc	%g5,	0x09B1,	%l5
	udiv	%g4,	0x0E4B,	%o5
	ldx	[%l7 + 0x28],	%o4
	ldsh	[%l7 + 0x4E],	%i4
	fxnors	%f20,	%f16,	%f31
	edge8l	%i0,	%o7,	%l0
	fmovrsgez	%g3,	%f12,	%f15
	array8	%g7,	%g6,	%o1
	umul	%i1,	0x17F4,	%o0
	udivcc	%l6,	0x1411,	%l2
	array32	%i3,	%i6,	%i7
	mulx	%l4,	0x0993,	%g1
	fmovrsgez	%l3,	%f6,	%f2
	movvs	%xcc,	%l1,	%i2
	fpsub32s	%f3,	%f24,	%f12
	fmovdle	%icc,	%f2,	%f30
	sir	0x19CA
	subc	%g2,	%o6,	%o2
	movcs	%icc,	%o3,	%g5
	restore %i5, 0x0DE2, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o5,	%g4,	%i4
	fone	%f20
	edge32ln	%i0,	%o7,	%o4
	array16	%g3,	%l0,	%g6
	edge32	%o1,	%g7,	%o0
	fmovdgu	%xcc,	%f27,	%f25
	fmovrslez	%i1,	%f13,	%f20
	ld	[%l7 + 0x74],	%f20
	movcs	%icc,	%l6,	%i3
	ldub	[%l7 + 0x7E],	%l2
	sub	%i6,	0x0E6C,	%i7
	ldsh	[%l7 + 0x58],	%g1
	ldx	[%l7 + 0x20],	%l3
	umul	%l1,	%l4,	%g2
	movrgz	%i2,	0x03D,	%o2
	array16	%o6,	%g5,	%i5
	fmovda	%xcc,	%f1,	%f20
	movcs	%icc,	%o3,	%l5
	fandnot2s	%f15,	%f28,	%f0
	movg	%icc,	%o5,	%i4
	ldd	[%l7 + 0x78],	%g4
	mova	%xcc,	%i0,	%o4
	xnorcc	%o7,	%l0,	%g6
	add	%g3,	%g7,	%o1
	fmovdvc	%icc,	%f1,	%f12
	movn	%icc,	%o0,	%l6
	addcc	%i3,	%i1,	%l2
	ldsb	[%l7 + 0x71],	%i6
	subc	%g1,	0x009F,	%i7
	edge16	%l1,	%l4,	%g2
	lduw	[%l7 + 0x54],	%l3
	movre	%o2,	0x0A0,	%i2
	andcc	%o6,	%i5,	%o3
	for	%f10,	%f26,	%f22
	edge8ln	%g5,	%o5,	%l5
	stw	%i4,	[%l7 + 0x1C]
	array8	%g4,	%i0,	%o7
	movne	%icc,	%l0,	%g6
	fandnot1	%f6,	%f2,	%f26
	srlx	%o4,	%g3,	%o1
	ldub	[%l7 + 0x67],	%g7
	movne	%xcc,	%o0,	%i3
	fmovsleu	%icc,	%f16,	%f0
	edge16	%l6,	%i1,	%i6
	save %g1, %i7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l1,	%g2,	%l3
	array16	%l4,	%o2,	%i2
	smul	%o6,	0x12CD,	%i5
	andncc	%o3,	%o5,	%l5
	xnorcc	%g5,	0x1CC6,	%g4
	sra	%i0,	0x0D,	%i4
	ldsh	[%l7 + 0x1E],	%o7
	umulcc	%g6,	%l0,	%o4
	srax	%g3,	0x09,	%g7
	movre	%o0,	%i3,	%l6
	srlx	%o1,	0x1F,	%i1
	add	%g1,	0x08FF,	%i6
	umulcc	%i7,	0x0792,	%l1
	fsrc2	%f6,	%f18
	faligndata	%f14,	%f26,	%f4
	movrlz	%g2,	%l3,	%l4
	edge32l	%l2,	%o2,	%i2
	fors	%f27,	%f20,	%f1
	pdist	%f16,	%f8,	%f30
	sdivcc	%i5,	0x03D6,	%o3
	stx	%o6,	[%l7 + 0x68]
	edge32ln	%o5,	%g5,	%g4
	movle	%xcc,	%l5,	%i0
	fnor	%f18,	%f22,	%f0
	add	%i4,	0x1266,	%g6
	alignaddr	%l0,	%o7,	%o4
	orncc	%g3,	0x0B4B,	%g7
	mulx	%i3,	0x1EE9,	%o0
	sir	0x165F
	edge32n	%o1,	%i1,	%g1
	fcmps	%fcc3,	%f9,	%f25
	movvs	%icc,	%i6,	%l6
	movgu	%icc,	%l1,	%g2
	edge8ln	%i7,	%l3,	%l4
	ldd	[%l7 + 0x38],	%l2
	addcc	%o2,	%i2,	%i5
	udivcc	%o3,	0x0236,	%o6
	movcc	%xcc,	%g5,	%o5
	ld	[%l7 + 0x40],	%f20
	movcs	%icc,	%l5,	%g4
	sth	%i0,	[%l7 + 0x6A]
	fxnor	%f20,	%f2,	%f26
	edge32ln	%i4,	%l0,	%o7
	udivcc	%o4,	0x0FDA,	%g6
	sethi	0x1AB9,	%g3
	fornot2	%f26,	%f30,	%f28
	ldsb	[%l7 + 0x49],	%g7
	andcc	%o0,	0x179F,	%i3
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f20
	xnor	%o1,	%i1,	%g1
	mova	%xcc,	%i6,	%l1
	for	%f8,	%f30,	%f28
	movrgz	%l6,	0x1C1,	%g2
	fpmerge	%f11,	%f6,	%f24
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	fpadd32	%f4,	%f8,	%f14
	nop
	set	0x08, %i5
	lduw	[%l7 + %i5],	%l2
	fmovrslz	%o2,	%f12,	%f7
	orncc	%i5,	%o3,	%o6
	movrlz	%i2,	%o5,	%g5
	addcc	%l5,	%i0,	%g4
	sethi	0x0EDA,	%l0
	fmul8x16au	%f30,	%f12,	%f26
	movrgez	%i4,	%o4,	%g6
	movrne	%g3,	%g7,	%o7
	array16	%o0,	%i3,	%o1
	smul	%i1,	0x0131,	%g1
	movcs	%icc,	%l1,	%l6
	movn	%icc,	%i6,	%g2
	xorcc	%l3,	%i7,	%l2
	stb	%o2,	[%l7 + 0x17]
	movl	%xcc,	%i5,	%o3
	movrgez	%o6,	%l4,	%i2
	move	%icc,	%o5,	%l5
	lduw	[%l7 + 0x44],	%g5
	sub	%g4,	0x0477,	%i0
	movcs	%xcc,	%l0,	%o4
	fxors	%f9,	%f8,	%f21
	sth	%i4,	[%l7 + 0x58]
	udivx	%g3,	0x0D1F,	%g7
	sdivx	%o7,	0x02D4,	%o0
	fmovrsgez	%g6,	%f16,	%f28
	fmul8x16au	%f30,	%f22,	%f4
	orn	%i3,	0x1456,	%o1
	fmovrde	%g1,	%f14,	%f4
	ldd	[%l7 + 0x78],	%l0
	save %l6, 0x112A, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%g2,	%l3
	udivcc	%i7,	0x1F40,	%l2
	fcmpgt16	%f28,	%f30,	%i1
	fsrc1	%f16,	%f28
	fpsub16	%f28,	%f12,	%f0
	srlx	%i5,	0x1C,	%o2
	edge16ln	%o3,	%l4,	%o6
	array32	%o5,	%i2,	%l5
	movre	%g5,	%i0,	%l0
	subcc	%o4,	%i4,	%g3
	mulx	%g4,	0x1641,	%o7
	fornot2s	%f31,	%f31,	%f20
	movrgez	%o0,	%g6,	%i3
	fand	%f28,	%f14,	%f14
	fabsd	%f4,	%f8
	fmovsneg	%xcc,	%f26,	%f18
	subcc	%o1,	0x079D,	%g7
	mulscc	%l1,	0x1D65,	%g1
	movneg	%icc,	%l6,	%i6
	edge16	%l3,	%i7,	%g2
	and	%l2,	0x1C7C,	%i1
	fmovrdgz	%o2,	%f16,	%f28
	mulscc	%i5,	%l4,	%o3
	st	%f18,	[%l7 + 0x34]
	movcs	%icc,	%o6,	%i2
	ld	[%l7 + 0x50],	%f25
	popc	%o5,	%g5
	edge16ln	%i0,	%l5,	%o4
	sdiv	%l0,	0x062D,	%g3
	fmovsge	%icc,	%f6,	%f30
	sdivcc	%i4,	0x1BA2,	%o7
	udivcc	%o0,	0x1255,	%g4
	movneg	%xcc,	%g6,	%o1
	smulcc	%g7,	%i3,	%l1
	movrgz	%l6,	0x368,	%g1
	edge32l	%l3,	%i6,	%g2
	xorcc	%i7,	%i1,	%l2
	movrgez	%i5,	0x24C,	%l4
	std	%f12,	[%l7 + 0x48]
	orncc	%o2,	%o6,	%o3
	edge16ln	%i2,	%o5,	%g5
	fmovscc	%xcc,	%f14,	%f5
	mova	%icc,	%i0,	%l5
	fmovdvc	%xcc,	%f5,	%f18
	fmovrsgez	%o4,	%f15,	%f29
	sub	%g3,	0x18DE,	%i4
	addc	%o7,	%o0,	%g4
	fors	%f12,	%f7,	%f7
	nop
	set	0x48, %o3
	lduh	[%l7 + %o3],	%g6
	ldsw	[%l7 + 0x48],	%o1
	fmovscc	%xcc,	%f4,	%f27
	edge8ln	%g7,	%i3,	%l0
	fsrc2	%f18,	%f26
	movleu	%xcc,	%l1,	%g1
	fxor	%f8,	%f0,	%f0
	edge8	%l3,	%l6,	%g2
	nop
	set	0x60, %o4
	ldx	[%l7 + %o4],	%i7
	movn	%icc,	%i6,	%i1
	smul	%l2,	0x0B40,	%i5
	movne	%icc,	%o2,	%o6
	ldx	[%l7 + 0x30],	%o3
	edge8ln	%i2,	%l4,	%g5
	fmovrslz	%i0,	%f11,	%f2
	ld	[%l7 + 0x68],	%f26
	fzeros	%f26
	ldsh	[%l7 + 0x32],	%o5
	xor	%o4,	%g3,	%i4
	fmovdleu	%icc,	%f9,	%f15
	sethi	0x11E7,	%l5
	xnorcc	%o0,	0x18CF,	%o7
	edge8l	%g4,	%o1,	%g6
	fcmple16	%f30,	%f26,	%i3
	fmovdn	%xcc,	%f23,	%f4
	movle	%xcc,	%g7,	%l1
	movrgz	%g1,	0x013,	%l0
	fmovrslz	%l3,	%f29,	%f5
	or	%l6,	%i7,	%i6
	fmovscc	%icc,	%f29,	%f10
	andn	%i1,	0x15BF,	%l2
	st	%f23,	[%l7 + 0x34]
	movrgz	%i5,	%g2,	%o6
	udivx	%o3,	0x0828,	%i2
	fmovsgu	%xcc,	%f11,	%f18
	orcc	%l4,	%g5,	%o2
	movcc	%xcc,	%i0,	%o4
	fmovdleu	%xcc,	%f17,	%f1
	udiv	%g3,	0x0E3A,	%o5
	movrgez	%l5,	0x3AB,	%o0
	fandnot2s	%f24,	%f16,	%f6
	mova	%icc,	%i4,	%g4
	edge16ln	%o1,	%o7,	%i3
	sllx	%g7,	0x01,	%l1
	movvs	%icc,	%g1,	%g6
	smul	%l3,	0x15E1,	%l0
	sir	0x0938
	ldd	[%l7 + 0x20],	%f18
	smulcc	%l6,	0x1A0F,	%i7
	st	%f11,	[%l7 + 0x50]
	fpack32	%f26,	%f2,	%f26
	stb	%i1,	[%l7 + 0x6A]
	movrlz	%l2,	%i6,	%i5
	xnorcc	%o6,	%g2,	%o3
	sethi	0x0D9D,	%l4
	movge	%xcc,	%g5,	%i2
	movre	%i0,	%o2,	%o4
	fpadd16s	%f24,	%f31,	%f8
	fsrc1	%f2,	%f4
	ldd	[%l7 + 0x20],	%f12
	alignaddr	%g3,	%o5,	%l5
	edge32n	%i4,	%g4,	%o0
	xor	%o1,	%o7,	%i3
	movne	%icc,	%g7,	%g1
	edge16	%l1,	%l3,	%l0
	orn	%g6,	%i7,	%l6
	mulx	%l2,	0x0575,	%i1
	stx	%i5,	[%l7 + 0x60]
	sllx	%i6,	0x1C,	%g2
	stw	%o6,	[%l7 + 0x4C]
	subccc	%l4,	%o3,	%i2
	xor	%i0,	0x08A6,	%g5
	sth	%o4,	[%l7 + 0x38]
	sll	%g3,	0x1B,	%o5
	subccc	%l5,	%o2,	%g4
	sethi	0x1AF5,	%i4
	fcmpeq16	%f26,	%f26,	%o0
	orcc	%o1,	%i3,	%o7
	ldd	[%l7 + 0x50],	%g0
	umulcc	%g7,	0x06B4,	%l1
	fmovde	%xcc,	%f1,	%f24
	ldx	[%l7 + 0x60],	%l3
	movn	%xcc,	%g6,	%l0
	movrlz	%l6,	0x107,	%l2
	ldsw	[%l7 + 0x50],	%i7
	alignaddr	%i1,	%i5,	%g2
	lduw	[%l7 + 0x7C],	%o6
	add	%l4,	%o3,	%i6
	move	%icc,	%i2,	%g5
	fmovdle	%icc,	%f10,	%f30
	addccc	%o4,	0x0CAC,	%g3
	movne	%icc,	%i0,	%o5
	sll	%l5,	0x15,	%g4
	fornot2	%f0,	%f10,	%f16
	ldsw	[%l7 + 0x18],	%i4
	movvc	%icc,	%o2,	%o0
	srax	%o1,	%o7,	%i3
	fsrc2	%f12,	%f14
	sra	%g1,	%g7,	%l1
	edge32n	%l3,	%g6,	%l6
	movcc	%icc,	%l2,	%l0
	edge32n	%i7,	%i5,	%i1
	smulcc	%g2,	%l4,	%o3
	array16	%i6,	%o6,	%i2
	movleu	%xcc,	%o4,	%g5
	sdivcc	%i0,	0x11B2,	%o5
	edge8	%l5,	%g4,	%i4
	movcc	%xcc,	%g3,	%o0
	sth	%o1,	[%l7 + 0x52]
	fmovdle	%xcc,	%f3,	%f28
	sra	%o2,	%i3,	%o7
	subccc	%g1,	0x05B1,	%g7
	xor	%l3,	0x1B52,	%g6
	std	%f2,	[%l7 + 0x50]
	fzero	%f26
	movvs	%icc,	%l1,	%l2
	edge16n	%l6,	%l0,	%i5
	fabsd	%f14,	%f22
	fmovdneg	%xcc,	%f29,	%f10
	edge32ln	%i1,	%i7,	%g2
	xorcc	%o3,	0x0DF7,	%i6
	movneg	%xcc,	%o6,	%l4
	andn	%o4,	%g5,	%i0
	edge8	%i2,	%o5,	%g4
	fpadd32s	%f18,	%f7,	%f24
	fcmpne16	%f16,	%f30,	%i4
	xorcc	%l5,	%g3,	%o1
	fcmple32	%f26,	%f12,	%o0
	xnor	%o2,	0x15CB,	%i3
	fmovsle	%icc,	%f8,	%f6
	fcmps	%fcc0,	%f1,	%f30
	edge8ln	%g1,	%g7,	%l3
	movvc	%icc,	%g6,	%o7
	edge16ln	%l1,	%l2,	%l6
	edge16ln	%l0,	%i1,	%i7
	fandnot1s	%f25,	%f13,	%f22
	movneg	%xcc,	%i5,	%g2
	fmovdpos	%xcc,	%f14,	%f5
	fornot1	%f16,	%f2,	%f0
	movpos	%xcc,	%o3,	%i6
	xor	%o6,	0x0202,	%o4
	addcc	%l4,	0x05D5,	%g5
	movle	%xcc,	%i2,	%i0
	andn	%o5,	%g4,	%l5
	smul	%g3,	%o1,	%i4
	edge32l	%o2,	%i3,	%o0
	stb	%g1,	[%l7 + 0x76]
	nop
	set	0x7B, %g1
	ldsb	[%l7 + %g1],	%g7
	fandnot2	%f16,	%f28,	%f28
	or	%l3,	%o7,	%g6
	movne	%xcc,	%l2,	%l1
	fornot2	%f2,	%f30,	%f20
	fmovrde	%l6,	%f0,	%f12
	umulcc	%l0,	0x189F,	%i1
	movne	%icc,	%i5,	%i7
	fmovdcs	%xcc,	%f19,	%f20
	andcc	%o3,	%g2,	%o6
	fcmple32	%f24,	%f24,	%o4
	udivcc	%l4,	0x1E53,	%g5
	fzeros	%f11
	mulscc	%i2,	%i0,	%o5
	nop
	set	0x5E, %g3
	sth	%g4,	[%l7 + %g3]
	movneg	%xcc,	%l5,	%g3
	movrgz	%o1,	0x3C9,	%i4
	fors	%f3,	%f5,	%f0
	or	%i6,	%i3,	%o0
	movvs	%icc,	%g1,	%o2
	sdivcc	%g7,	0x1F82,	%l3
	ldx	[%l7 + 0x20],	%o7
	fcmpeq32	%f0,	%f22,	%g6
	movneg	%icc,	%l2,	%l1
	move	%xcc,	%l6,	%l0
	edge8l	%i5,	%i1,	%o3
	ld	[%l7 + 0x64],	%f22
	fsrc2s	%f0,	%f0
	array8	%i7,	%o6,	%o4
	fmovrdgz	%g2,	%f8,	%f12
	movvc	%icc,	%g5,	%l4
	fones	%f17
	sethi	0x10DC,	%i0
	srlx	%i2,	%o5,	%g4
	fpadd32	%f14,	%f6,	%f22
	movrgez	%l5,	%g3,	%o1
	lduh	[%l7 + 0x7A],	%i6
	sethi	0x0071,	%i3
	udivcc	%i4,	0x1E7B,	%g1
	movneg	%xcc,	%o0,	%g7
	fmovd	%f14,	%f22
	movrlez	%l3,	0x2B4,	%o7
	xnorcc	%o2,	%l2,	%g6
	fmovdvs	%icc,	%f15,	%f2
	movl	%xcc,	%l1,	%l6
	orncc	%i5,	%i1,	%o3
	edge32n	%l0,	%o6,	%o4
	stb	%g2,	[%l7 + 0x4D]
	fnot1s	%f6,	%f18
	alignaddr	%g5,	%i7,	%i0
	movleu	%icc,	%l4,	%i2
	fmovscs	%xcc,	%f7,	%f23
	fpadd32	%f6,	%f22,	%f22
	sth	%g4,	[%l7 + 0x22]
	fmovdleu	%xcc,	%f18,	%f9
	addc	%o5,	%l5,	%o1
	ldd	[%l7 + 0x58],	%i6
	movgu	%xcc,	%g3,	%i3
	subccc	%g1,	%i4,	%g7
	sethi	0x0BFA,	%l3
	edge16l	%o7,	%o2,	%l2
	fors	%f9,	%f3,	%f16
	srax	%g6,	0x00,	%l1
	lduh	[%l7 + 0x0E],	%o0
	movpos	%icc,	%l6,	%i1
	fpadd32	%f30,	%f14,	%f24
	movg	%xcc,	%i5,	%o3
	orncc	%o6,	%o4,	%g2
	ldx	[%l7 + 0x60],	%g5
	pdist	%f22,	%f20,	%f14
	fmovsleu	%icc,	%f23,	%f16
	movrgez	%i7,	%l0,	%i0
	ldub	[%l7 + 0x12],	%l4
	movrlez	%g4,	0x2CE,	%i2
	orcc	%o5,	0x11DD,	%o1
	udivcc	%l5,	0x0EBD,	%g3
	fmovdleu	%xcc,	%f31,	%f6
	orncc	%i6,	0x1EC1,	%g1
	fmul8x16	%f27,	%f16,	%f10
	movne	%xcc,	%i3,	%i4
	array16	%l3,	%g7,	%o7
	st	%f1,	[%l7 + 0x74]
	faligndata	%f8,	%f2,	%f0
	fcmpd	%fcc0,	%f10,	%f8
	fors	%f2,	%f2,	%f7
	fmovdge	%icc,	%f24,	%f21
	movcc	%icc,	%o2,	%l2
	for	%f10,	%f10,	%f28
	movneg	%xcc,	%g6,	%l1
	addc	%l6,	0x1D20,	%i1
	movrgez	%i5,	%o0,	%o3
	edge16ln	%o6,	%g2,	%o4
	popc	%g5,	%i7
	alignaddr	%l0,	%l4,	%i0
	movleu	%icc,	%g4,	%i2
	edge8n	%o1,	%o5,	%g3
	ldd	[%l7 + 0x08],	%f6
	restore %l5, %g1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i4,	%i6,	%l3
	ldub	[%l7 + 0x43],	%o7
	fcmple16	%f0,	%f26,	%g7
	fmovrslz	%o2,	%f23,	%f24
	fpadd16	%f6,	%f10,	%f24
	edge8	%l2,	%g6,	%l6
	std	%f26,	[%l7 + 0x60]
	sir	0x0013
	sir	0x1F80
	fxnor	%f26,	%f6,	%f28
	sll	%i1,	0x0B,	%l1
	sir	0x1C83
	add	%i5,	0x0DA7,	%o3
	sll	%o0,	0x05,	%g2
	movrlz	%o6,	0x38A,	%g5
	addccc	%i7,	%o4,	%l0
	movle	%xcc,	%l4,	%g4
	fmovsa	%icc,	%f27,	%f30
	xorcc	%i0,	0x16AF,	%o1
	umul	%o5,	%g3,	%i2
	fpmerge	%f0,	%f26,	%f8
	bshuffle	%f12,	%f14,	%f26
	srax	%l5,	0x06,	%i3
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	edge8l	%i6,	%o7,	%l3
	sll	%o2,	%l2,	%g6
	fmul8x16al	%f17,	%f15,	%f20
	subccc	%g7,	%l6,	%l1
	smulcc	%i1,	0x0D07,	%o3
	fmovsvc	%icc,	%f29,	%f6
	sll	%i5,	%o0,	%o6
	edge8l	%g5,	%i7,	%o4
	mova	%icc,	%l0,	%l4
	fmovdpos	%icc,	%f12,	%f1
	movre	%g2,	%g4,	%i0
	std	%f28,	[%l7 + 0x48]
	movgu	%xcc,	%o1,	%g3
	fmovrdgz	%o5,	%f14,	%f14
	ld	[%l7 + 0x6C],	%f25
	orn	%l5,	%i3,	%g1
	fmul8x16au	%f30,	%f26,	%f16
	fmul8x16au	%f30,	%f15,	%f2
	fcmped	%fcc1,	%f28,	%f4
	movrlz	%i4,	%i6,	%i2
	popc	%o7,	%o2
	movvs	%icc,	%l3,	%g6
	movge	%xcc,	%l2,	%g7
	ldsw	[%l7 + 0x78],	%l6
	fors	%f26,	%f0,	%f21
	sdivx	%i1,	0x02DD,	%l1
	xnor	%o3,	0x11F6,	%o0
	add	%o6,	%g5,	%i7
	andcc	%i5,	%o4,	%l4
	fmovsvc	%icc,	%f5,	%f2
	movneg	%xcc,	%l0,	%g2
	subccc	%i0,	0x0FC4,	%o1
	sllx	%g4,	0x06,	%g3
	fcmpes	%fcc2,	%f7,	%f29
	edge8ln	%l5,	%i3,	%g1
	movl	%icc,	%o5,	%i4
	alignaddr	%i2,	%o7,	%i6
	orncc	%o2,	0x1FA9,	%g6
	orncc	%l2,	0x19EA,	%g7
	add	%l6,	%l3,	%l1
	fmovsvs	%xcc,	%f2,	%f12
	fornot1s	%f24,	%f3,	%f21
	movrlz	%i1,	%o0,	%o6
	fsrc1	%f14,	%f2
	addcc	%g5,	0x0688,	%o3
	stw	%i5,	[%l7 + 0x54]
	movrgz	%i7,	0x3D3,	%l4
	udivx	%l0,	0x14DA,	%o4
	fpackfix	%f2,	%f23
	fpsub32s	%f16,	%f20,	%f24
	fmovdn	%xcc,	%f11,	%f16
	for	%f0,	%f24,	%f10
	edge32ln	%i0,	%g2,	%o1
	movcs	%icc,	%g3,	%l5
	movneg	%icc,	%i3,	%g1
	ldsw	[%l7 + 0x54],	%o5
	add	%g4,	%i4,	%i2
	ldsw	[%l7 + 0x2C],	%i6
	ldsb	[%l7 + 0x26],	%o7
	movrne	%g6,	%l2,	%o2
	ld	[%l7 + 0x40],	%f31
	fmovrsne	%l6,	%f15,	%f31
	fmovd	%f22,	%f18
	xorcc	%l3,	0x0107,	%l1
	st	%f15,	[%l7 + 0x34]
	smulcc	%i1,	%g7,	%o6
	movne	%icc,	%o0,	%g5
	sub	%o3,	%i7,	%i5
	fcmpgt32	%f4,	%f20,	%l0
	movn	%icc,	%l4,	%i0
	edge32	%g2,	%o1,	%g3
	or	%o4,	%i3,	%g1
	movrgez	%o5,	0x228,	%l5
	fpadd16	%f4,	%f4,	%f10
	edge16ln	%g4,	%i2,	%i6
	orn	%i4,	0x0958,	%o7
	movg	%xcc,	%l2,	%g6
	andn	%o2,	0x1392,	%l6
	movgu	%icc,	%l1,	%l3
	fcmpeq32	%f26,	%f24,	%g7
	movcs	%icc,	%i1,	%o6
	fmovdn	%xcc,	%f4,	%f25
	add	%o0,	%o3,	%i7
	sethi	0x1C65,	%i5
	fornot1s	%f19,	%f14,	%f15
	stw	%l0,	[%l7 + 0x2C]
	fzero	%f18
	edge8l	%g5,	%i0,	%l4
	udiv	%o1,	0x1111,	%g3
	movne	%icc,	%g2,	%o4
	fcmps	%fcc1,	%f23,	%f11
	stx	%i3,	[%l7 + 0x40]
	sth	%g1,	[%l7 + 0x62]
	edge16	%o5,	%l5,	%g4
	fmul8x16al	%f11,	%f30,	%f24
	restore %i6, %i4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f20,	%f6,	%l2
	edge32ln	%g6,	%o2,	%l6
	sll	%l1,	0x17,	%l3
	fpack32	%f0,	%f10,	%f10
	fmovsneg	%xcc,	%f20,	%f6
	movrlz	%o7,	%g7,	%i1
	movg	%icc,	%o0,	%o3
	add	%i7,	%o6,	%i5
	movre	%l0,	%i0,	%l4
	or	%o1,	0x07D6,	%g5
	movleu	%xcc,	%g3,	%o4
	lduh	[%l7 + 0x70],	%i3
	alignaddr	%g1,	%g2,	%l5
	fands	%f29,	%f20,	%f15
	save %g4, 0x05E7, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i6,	%i2,	%l2
	movne	%xcc,	%i4,	%o2
	save %g6, %l6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%o7,	%g7
	edge32ln	%i1,	%o0,	%l3
	fmovdcc	%xcc,	%f20,	%f31
	fnot1s	%f26,	%f14
	sir	0x135D
	movne	%icc,	%o3,	%i7
	movrgz	%i5,	0x0DD,	%o6
	xorcc	%l0,	0x1022,	%i0
	std	%f24,	[%l7 + 0x40]
	fcmpd	%fcc1,	%f24,	%f20
	ldx	[%l7 + 0x70],	%l4
	edge16	%o1,	%g3,	%g5
	edge16ln	%o4,	%i3,	%g1
	srlx	%l5,	%g2,	%o5
	udivx	%i6,	0x0820,	%i2
	movcs	%icc,	%l2,	%g4
	movrgez	%i4,	0x01B,	%g6
	ldd	[%l7 + 0x18],	%o2
	movg	%icc,	%l1,	%o7
	movpos	%icc,	%g7,	%i1
	fxnors	%f7,	%f22,	%f7
	movgu	%xcc,	%o0,	%l3
	movneg	%icc,	%o3,	%l6
	fmul8x16al	%f25,	%f10,	%f20
	edge8n	%i7,	%o6,	%l0
	stx	%i5,	[%l7 + 0x28]
	mulx	%i0,	0x0334,	%o1
	movcs	%xcc,	%l4,	%g3
	addc	%g5,	0x1143,	%o4
	or	%i3,	0x15B2,	%l5
	add	%g2,	%g1,	%i6
	sub	%o5,	%i2,	%l2
	fmovrsgz	%g4,	%f27,	%f6
	fandnot1	%f6,	%f8,	%f20
	orncc	%i4,	%g6,	%l1
	ldsb	[%l7 + 0x46],	%o2
	edge16l	%g7,	%o7,	%i1
	andcc	%l3,	0x1E22,	%o3
	edge16ln	%o0,	%i7,	%o6
	fmovdgu	%xcc,	%f28,	%f18
	movl	%xcc,	%l6,	%i5
	add	%i0,	0x12F2,	%o1
	edge8ln	%l0,	%g3,	%l4
	edge16	%g5,	%i3,	%l5
	edge8n	%o4,	%g2,	%i6
	fmovrslez	%g1,	%f0,	%f26
	faligndata	%f12,	%f22,	%f14
	subc	%o5,	0x1977,	%i2
	fcmple32	%f0,	%f2,	%g4
	fmovdpos	%icc,	%f27,	%f5
	stx	%l2,	[%l7 + 0x60]
	fsrc1s	%f0,	%f3
	fandnot1s	%f9,	%f29,	%f13
	movleu	%icc,	%i4,	%g6
	smul	%l1,	0x0833,	%g7
	umulcc	%o2,	0x0B52,	%i1
	ldub	[%l7 + 0x11],	%l3
	movn	%icc,	%o3,	%o0
	alignaddrl	%i7,	%o7,	%o6
	fzeros	%f8
	umulcc	%i5,	%l6,	%i0
	move	%icc,	%o1,	%g3
	stx	%l4,	[%l7 + 0x68]
	mulscc	%l0,	0x001F,	%i3
	fpadd16	%f30,	%f4,	%f8
	xorcc	%g5,	%o4,	%g2
	fmovsne	%icc,	%f24,	%f25
	movneg	%icc,	%i6,	%l5
	subc	%g1,	%i2,	%g4
	edge8l	%o5,	%i4,	%l2
	fnot1s	%f24,	%f17
	edge8n	%l1,	%g6,	%g7
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	nop
	set	0x18, %o6
	std	%f16,	[%l7 + %o6]
	sdivcc	%o0,	0x0B74,	%l3
	movrlz	%i7,	0x368,	%o7
	smulcc	%i5,	%l6,	%i0
	srl	%o6,	%g3,	%o1
	and	%l4,	0x1089,	%i3
	udivcc	%g5,	0x0873,	%l0
	movrgz	%o4,	0x0DB,	%g2
	popc	%l5,	%g1
	fandnot1s	%f8,	%f22,	%f4
	movneg	%xcc,	%i2,	%g4
	ldx	[%l7 + 0x08],	%o5
	orn	%i6,	%i4,	%l2
	fpadd32s	%f20,	%f13,	%f13
	movrne	%g6,	0x15A,	%l1
	ldsh	[%l7 + 0x6A],	%g7
	lduw	[%l7 + 0x7C],	%o2
	ldsw	[%l7 + 0x64],	%i1
	array16	%o3,	%l3,	%i7
	array32	%o7,	%i5,	%o0
	edge32l	%i0,	%l6,	%g3
	fmovdn	%icc,	%f4,	%f1
	stw	%o1,	[%l7 + 0x3C]
	umul	%l4,	%o6,	%i3
	movrgez	%g5,	%o4,	%g2
	addc	%l5,	0x16EB,	%g1
	and	%i2,	%l0,	%g4
	fmovdg	%xcc,	%f15,	%f9
	fmovsvc	%icc,	%f26,	%f25
	movvc	%icc,	%o5,	%i4
	mulx	%l2,	%i6,	%l1
	fmovsge	%icc,	%f4,	%f14
	fmovdgu	%icc,	%f21,	%f23
	stb	%g7,	[%l7 + 0x22]
	edge8ln	%g6,	%o2,	%o3
	edge32	%i1,	%i7,	%l3
	fones	%f9
	st	%f28,	[%l7 + 0x4C]
	fxors	%f5,	%f15,	%f21
	edge8n	%i5,	%o7,	%o0
	fmovda	%icc,	%f16,	%f11
	sllx	%l6,	%i0,	%g3
	fmovdge	%xcc,	%f25,	%f22
	fmovdgu	%icc,	%f5,	%f9
	xorcc	%o1,	%l4,	%o6
	movre	%g5,	0x1CD,	%i3
	sth	%g2,	[%l7 + 0x24]
	orcc	%l5,	%g1,	%o4
	orncc	%i2,	%g4,	%l0
	fornot1s	%f5,	%f11,	%f9
	lduh	[%l7 + 0x4C],	%o5
	subccc	%l2,	0x02A4,	%i4
	addcc	%l1,	0x0C43,	%g7
	stb	%g6,	[%l7 + 0x16]
	fxnor	%f14,	%f18,	%f20
	srlx	%i6,	%o3,	%o2
	movvc	%xcc,	%i1,	%i7
	edge32n	%i5,	%l3,	%o7
	movne	%icc,	%l6,	%i0
	movvc	%xcc,	%o0,	%o1
	mulscc	%l4,	0x0A60,	%o6
	edge32n	%g5,	%g3,	%g2
	ldd	[%l7 + 0x70],	%l4
	movvs	%icc,	%g1,	%i3
	edge16ln	%i2,	%g4,	%o4
	ldsh	[%l7 + 0x4E],	%l0
	fmovdle	%xcc,	%f25,	%f9
	xorcc	%l2,	0x04D4,	%o5
	orn	%l1,	0x0E6B,	%i4
	fmovrdgz	%g6,	%f10,	%f30
	fpsub32	%f22,	%f16,	%f20
	stb	%i6,	[%l7 + 0x28]
	alignaddr	%g7,	%o2,	%o3
	edge16ln	%i1,	%i7,	%i5
	edge16n	%l3,	%l6,	%o7
	fmovscs	%icc,	%f27,	%f3
	fmovsn	%icc,	%f12,	%f18
	fmovrslez	%o0,	%f23,	%f7
	lduw	[%l7 + 0x24],	%i0
	edge32l	%l4,	%o1,	%g5
	movl	%icc,	%o6,	%g2
	movle	%icc,	%l5,	%g3
	smul	%g1,	0x0361,	%i2
	addc	%g4,	0x199C,	%i3
	ldx	[%l7 + 0x58],	%l0
	umulcc	%l2,	0x034E,	%o4
	fmuld8ulx16	%f29,	%f16,	%f6
	fmul8x16	%f30,	%f22,	%f12
	movvc	%xcc,	%o5,	%l1
	array16	%g6,	%i6,	%g7
	fpsub16	%f18,	%f24,	%f12
	movrlz	%i4,	0x207,	%o3
	fornot2s	%f25,	%f24,	%f27
	edge16n	%i1,	%o2,	%i5
	sdivcc	%i7,	0x15E9,	%l6
	mova	%xcc,	%o7,	%o0
	fmovspos	%icc,	%f22,	%f25
	lduw	[%l7 + 0x24],	%i0
	andncc	%l4,	%o1,	%g5
	sub	%o6,	0x003F,	%g2
	edge16	%l3,	%l5,	%g1
	or	%g3,	0x0C9C,	%i2
	andcc	%g4,	%l0,	%i3
	array8	%l2,	%o4,	%o5
	edge16	%l1,	%i6,	%g7
	andncc	%i4,	%o3,	%i1
	andncc	%g6,	%i5,	%i7
	edge16l	%o2,	%l6,	%o0
	sll	%i0,	0x0F,	%o7
	fnands	%f5,	%f31,	%f4
	movl	%icc,	%l4,	%o1
	movvc	%icc,	%g5,	%g2
	sra	%l3,	%o6,	%g1
	edge32ln	%l5,	%g3,	%i2
	sdivx	%g4,	0x0132,	%l0
	movcs	%icc,	%i3,	%l2
	edge16n	%o5,	%l1,	%o4
	xorcc	%g7,	%i4,	%o3
	ldd	[%l7 + 0x18],	%i6
	lduw	[%l7 + 0x74],	%i1
	sllx	%i5,	%g6,	%i7
	sir	0x1252
	add	%o2,	%l6,	%o0
	movrgz	%i0,	%l4,	%o1
	fmovdleu	%xcc,	%f0,	%f9
	sll	%g5,	%o7,	%g2
	lduw	[%l7 + 0x54],	%l3
	fmul8x16al	%f17,	%f26,	%f8
	fabsd	%f22,	%f6
	andn	%o6,	0x117C,	%g1
	sdiv	%l5,	0x1C31,	%i2
	nop
	set	0x18, %l1
	stx	%g3,	[%l7 + %l1]
	mulscc	%l0,	%i3,	%g4
	subccc	%l2,	%l1,	%o5
	andcc	%g7,	0x138F,	%i4
	sth	%o3,	[%l7 + 0x14]
	restore %i6, %i1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i5,	0x0F,	%g6
	fmovsvc	%xcc,	%f5,	%f27
	alignaddrl	%i7,	%l6,	%o2
	fmul8x16al	%f16,	%f24,	%f10
	sll	%i0,	%o0,	%o1
	ldd	[%l7 + 0x30],	%f0
	fand	%f4,	%f4,	%f28
	movcs	%xcc,	%g5,	%l4
	ldd	[%l7 + 0x38],	%f20
	addccc	%o7,	0x1A77,	%l3
	edge16ln	%o6,	%g2,	%l5
	sub	%g1,	0x0884,	%i2
	xor	%l0,	%i3,	%g3
	lduh	[%l7 + 0x2A],	%l2
	stb	%l1,	[%l7 + 0x58]
	sdivcc	%g4,	0x0EFB,	%g7
	umulcc	%o5,	%i4,	%o3
	stb	%i1,	[%l7 + 0x70]
	movge	%icc,	%o4,	%i6
	stx	%i5,	[%l7 + 0x18]
	sub	%g6,	0x11EC,	%i7
	fmovrsgez	%o2,	%f0,	%f0
	popc	%i0,	%l6
	subc	%o0,	%o1,	%l4
	edge16ln	%o7,	%g5,	%l3
	edge8l	%g2,	%o6,	%g1
	sra	%i2,	0x11,	%l5
	fmul8x16	%f10,	%f22,	%f16
	fmovdge	%xcc,	%f31,	%f21
	sdiv	%i3,	0x1A59,	%l0
	sethi	0x1A46,	%l2
	movrlz	%g3,	%g4,	%g7
	mova	%xcc,	%o5,	%i4
	alignaddrl	%o3,	%l1,	%i1
	stx	%i6,	[%l7 + 0x28]
	fmovd	%f6,	%f18
	fxnors	%f8,	%f15,	%f14
	movrlez	%o4,	0x170,	%g6
	move	%icc,	%i7,	%i5
	xorcc	%o2,	0x0809,	%i0
	st	%f22,	[%l7 + 0x48]
	movneg	%icc,	%o0,	%o1
	movrgz	%l4,	%o7,	%l6
	lduh	[%l7 + 0x54],	%g5
	fmovscs	%xcc,	%f3,	%f5
	save %l3, 0x1385, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o6,	[%l7 + 0x44]
	movle	%icc,	%g1,	%i2
	ld	[%l7 + 0x74],	%f8
	sllx	%l5,	%l0,	%l2
	alignaddrl	%i3,	%g4,	%g3
	fmovscc	%icc,	%f17,	%f26
	andn	%g7,	0x0620,	%i4
	mulscc	%o3,	%o5,	%l1
	movle	%xcc,	%i1,	%o4
	array32	%g6,	%i7,	%i5
	srl	%i6,	0x04,	%i0
	sdivcc	%o0,	0x0855,	%o1
	std	%f12,	[%l7 + 0x08]
	ldd	[%l7 + 0x40],	%l4
	movvc	%icc,	%o7,	%o2
	fmovd	%f22,	%f30
	movle	%icc,	%l6,	%g5
	lduw	[%l7 + 0x60],	%g2
	fmul8x16	%f7,	%f4,	%f18
	array32	%o6,	%l3,	%g1
	ldub	[%l7 + 0x2D],	%i2
	movrlz	%l0,	%l5,	%i3
	ldub	[%l7 + 0x45],	%g4
	sdiv	%g3,	0x13F2,	%g7
	movle	%xcc,	%i4,	%l2
	subc	%o3,	0x0DF6,	%l1
	sethi	0x1C3A,	%o5
	stx	%o4,	[%l7 + 0x50]
	srlx	%i1,	0x12,	%i7
	edge32	%g6,	%i6,	%i5
	stw	%i0,	[%l7 + 0x34]
	movrgz	%o0,	%o1,	%o7
	move	%icc,	%o2,	%l6
	fmovsne	%xcc,	%f28,	%f21
	lduw	[%l7 + 0x6C],	%l4
	sir	0x13B6
	movpos	%icc,	%g5,	%o6
	lduw	[%l7 + 0x14],	%g2
	movg	%icc,	%g1,	%l3
	movgu	%icc,	%l0,	%i2
	ld	[%l7 + 0x2C],	%f21
	andncc	%i3,	%l5,	%g3
	sra	%g7,	0x15,	%i4
	xnorcc	%g4,	0x18BB,	%l2
	movrlez	%l1,	%o5,	%o4
	addccc	%i1,	0x16FD,	%i7
	movn	%icc,	%o3,	%g6
	std	%f6,	[%l7 + 0x60]
	fpack32	%f28,	%f16,	%f0
	edge32l	%i6,	%i0,	%o0
	move	%xcc,	%o1,	%o7
	ldsb	[%l7 + 0x71],	%i5
	subccc	%o2,	0x0903,	%l4
	fxnor	%f6,	%f2,	%f0
	and	%g5,	%l6,	%o6
	addc	%g1,	0x104B,	%g2
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	movrlez	%i3,	%i2,	%l5
	smul	%g3,	0x1A95,	%g7
	fabsd	%f20,	%f26
	edge32	%g4,	%i4,	%l1
	move	%icc,	%l2,	%o4
	fcmpd	%fcc3,	%f2,	%f2
	sir	0x07EE
	ldd	[%l7 + 0x60],	%o4
	edge16n	%i1,	%o3,	%g6
	ldsw	[%l7 + 0x20],	%i7
	ldsw	[%l7 + 0x64],	%i6
	srlx	%i0,	%o0,	%o7
	addc	%o1,	%o2,	%l4
	xnor	%g5,	0x19D6,	%i5
	xor	%l6,	%o6,	%g2
	sth	%g1,	[%l7 + 0x30]
	st	%f0,	[%l7 + 0x34]
	addc	%l0,	0x0D2B,	%l3
	or	%i2,	%l5,	%g3
	udivcc	%i3,	0x16C5,	%g4
	fands	%f12,	%f7,	%f15
	and	%g7,	%i4,	%l1
	orncc	%l2,	%o4,	%i1
	fmul8x16	%f21,	%f20,	%f18
	sth	%o3,	[%l7 + 0x6A]
	movl	%icc,	%o5,	%i7
	fmovdleu	%icc,	%f29,	%f10
	ldx	[%l7 + 0x60],	%g6
	fcmps	%fcc1,	%f20,	%f29
	srlx	%i0,	0x19,	%i6
	srax	%o7,	%o0,	%o2
	edge8ln	%l4,	%g5,	%i5
	move	%xcc,	%l6,	%o1
	array32	%o6,	%g2,	%l0
	mulx	%g1,	0x027F,	%i2
	movre	%l5,	%l3,	%i3
	movrgez	%g4,	0x1E2,	%g7
	restore %i4, 0x10DD, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x3C, %i2
	lduh	[%l7 + %i2],	%g3
	ldx	[%l7 + 0x60],	%l2
	lduh	[%l7 + 0x56],	%o4
	edge16n	%i1,	%o3,	%o5
	or	%g6,	%i7,	%i0
	xnor	%i6,	%o7,	%o0
	save %o2, 0x1994, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g5,	%l6
	sir	0x1402
	sll	%o1,	0x0A,	%o6
	edge16ln	%g2,	%l0,	%i5
	edge16ln	%g1,	%i2,	%l3
	sdiv	%l5,	0x05C0,	%i3
	xnorcc	%g4,	0x0E8E,	%i4
	movrgz	%g7,	0x374,	%l1
	sethi	0x0631,	%l2
	edge32ln	%o4,	%i1,	%g3
	movrgez	%o3,	0x0AA,	%g6
	movneg	%xcc,	%o5,	%i7
	udivx	%i0,	0x1B3B,	%i6
	edge8l	%o7,	%o2,	%o0
	lduw	[%l7 + 0x34],	%l4
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%g4
	sdivx	%o1,	0x043A,	%l6
	stb	%g2,	[%l7 + 0x6C]
	movg	%xcc,	%o6,	%l0
	subc	%i5,	%i2,	%l3
	add	%g1,	%i3,	%l5
	movrgez	%i4,	%g7,	%l1
	srl	%g4,	%o4,	%l2
	ldub	[%l7 + 0x5F],	%i1
	stb	%g3,	[%l7 + 0x6C]
	umul	%o3,	0x0CC5,	%o5
	movl	%xcc,	%g6,	%i0
	udiv	%i7,	0x0385,	%o7
	array8	%i6,	%o2,	%o0
	or	%g5,	%l4,	%l6
	edge16ln	%g2,	%o1,	%l0
	ldsh	[%l7 + 0x6A],	%o6
	xor	%i5,	%l3,	%g1
	lduh	[%l7 + 0x14],	%i2
	alignaddrl	%l5,	%i3,	%i4
	andn	%g7,	%l1,	%g4
	array8	%o4,	%i1,	%l2
	subcc	%o3,	%o5,	%g6
	edge16n	%g3,	%i7,	%i0
	array32	%o7,	%i6,	%o2
	fnot2	%f24,	%f24
	srax	%o0,	0x08,	%g5
	stx	%l4,	[%l7 + 0x20]
	ldsh	[%l7 + 0x56],	%g2
	fnot1	%f18,	%f8
	fpmerge	%f19,	%f3,	%f14
	fnot2s	%f19,	%f8
	udivcc	%o1,	0x1182,	%l6
	edge16	%o6,	%i5,	%l0
	ldd	[%l7 + 0x30],	%f12
	ldsw	[%l7 + 0x14],	%l3
	movleu	%xcc,	%i2,	%g1
	edge32ln	%i3,	%l5,	%i4
	edge8n	%g7,	%g4,	%l1
	xnor	%o4,	%i1,	%l2
	alignaddrl	%o5,	%g6,	%g3
	movleu	%xcc,	%o3,	%i0
	edge32	%o7,	%i6,	%o2
	movrgz	%o0,	%i7,	%l4
	xor	%g2,	%g5,	%l6
	movcc	%icc,	%o1,	%i5
	or	%o6,	0x1AAE,	%l3
	movleu	%icc,	%l0,	%i2
	movvs	%xcc,	%g1,	%l5
	mova	%icc,	%i3,	%g7
	mulx	%g4,	%i4,	%o4
	movcs	%icc,	%l1,	%l2
	fzeros	%f7
	stb	%o5,	[%l7 + 0x27]
	ldsw	[%l7 + 0x48],	%g6
	edge32	%i1,	%g3,	%i0
	edge16l	%o7,	%i6,	%o2
	sth	%o3,	[%l7 + 0x62]
	sub	%i7,	0x043C,	%o0
	move	%icc,	%l4,	%g5
	edge32ln	%l6,	%g2,	%o1
	subccc	%o6,	0x01B7,	%i5
	movl	%icc,	%l3,	%l0
	ldub	[%l7 + 0x5E],	%g1
	fnot2	%f6,	%f22
	andn	%i2,	0x15BF,	%i3
	ldsb	[%l7 + 0x63],	%g7
	std	%f4,	[%l7 + 0x50]
	sll	%l5,	0x04,	%g4
	orn	%o4,	%i4,	%l1
	fmovrdlez	%l2,	%f30,	%f0
	movrne	%g6,	%i1,	%o5
	edge16n	%i0,	%o7,	%i6
	mulscc	%o2,	%o3,	%i7
	xnorcc	%o0,	%g3,	%l4
	xor	%l6,	0x1FF6,	%g5
	add	%o1,	%o6,	%i5
	or	%l3,	%g2,	%l0
	sub	%i2,	0x1BD8,	%i3
	movcs	%icc,	%g1,	%g7
	movgu	%icc,	%g4,	%o4
	xnorcc	%i4,	0x05EF,	%l1
	fpadd32	%f12,	%f10,	%f20
	ld	[%l7 + 0x78],	%f17
	move	%icc,	%l5,	%l2
	umul	%i1,	0x0393,	%g6
	fone	%f0
	fcmpgt32	%f14,	%f18,	%o5
	stb	%i0,	[%l7 + 0x7A]
	fpack32	%f16,	%f14,	%f20
	for	%f0,	%f8,	%f8
	fmovdneg	%icc,	%f18,	%f13
	umul	%i6,	%o7,	%o3
	fmovrdgez	%o2,	%f0,	%f8
	fmovdneg	%xcc,	%f25,	%f13
	edge32ln	%o0,	%g3,	%l4
	subc	%i7,	%g5,	%l6
	edge16l	%o1,	%o6,	%i5
	lduh	[%l7 + 0x76],	%l3
	sth	%l0,	[%l7 + 0x4E]
	st	%f12,	[%l7 + 0x20]
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	fmovsneg	%xcc,	%f18,	%f31
	movrlz	%g7,	%g4,	%g1
	mulscc	%i4,	0x1719,	%o4
	sllx	%l1,	%l5,	%i1
	movge	%icc,	%g6,	%l2
	sdivx	%i0,	0x14EC,	%i6
	movn	%xcc,	%o7,	%o5
	ldx	[%l7 + 0x38],	%o3
	addcc	%o0,	%g3,	%l4
	xor	%o2,	0x06CC,	%g5
	fmovsleu	%xcc,	%f21,	%f5
	fpadd32s	%f21,	%f3,	%f18
	sub	%l6,	0x0347,	%i7
	subc	%o1,	%i5,	%o6
	movrlez	%l0,	%i2,	%i3
	fandnot1s	%f3,	%f13,	%f19
	fands	%f5,	%f12,	%f8
	fnot1	%f10,	%f16
	movle	%xcc,	%g2,	%l3
	xnorcc	%g7,	%g1,	%i4
	edge8ln	%g4,	%l1,	%l5
	srlx	%i1,	0x13,	%g6
	fnot1s	%f11,	%f11
	fmovsle	%xcc,	%f9,	%f25
	addc	%l2,	0x1281,	%o4
	array16	%i6,	%i0,	%o7
	save %o3, %o0, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l4,	%o2
	array8	%g5,	%l6,	%i7
	fmovdneg	%xcc,	%f10,	%f31
	stw	%g3,	[%l7 + 0x70]
	mova	%icc,	%i5,	%o6
	edge32ln	%o1,	%i2,	%l0
	movneg	%xcc,	%i3,	%g2
	for	%f28,	%f0,	%f12
	edge32	%l3,	%g1,	%g7
	edge8	%i4,	%g4,	%l5
	srlx	%l1,	%i1,	%l2
	alignaddrl	%o4,	%g6,	%i0
	andn	%i6,	0x0191,	%o3
	save %o7, %o0, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o2,	0x0733,	%l4
	lduh	[%l7 + 0x2E],	%l6
	fmovd	%f30,	%f10
	xor	%i7,	%g3,	%g5
	addcc	%i5,	0x1AC9,	%o6
	xnor	%i2,	%o1,	%l0
	sdivx	%g2,	0x0250,	%i3
	edge8ln	%l3,	%g1,	%i4
	lduw	[%l7 + 0x08],	%g4
	ldub	[%l7 + 0x24],	%l5
	movge	%icc,	%g7,	%l1
	movne	%icc,	%l2,	%i1
	mulscc	%o4,	0x16BD,	%i0
	mulscc	%i6,	%o3,	%o7
	edge8	%g6,	%o5,	%o2
	smulcc	%o0,	0x1FA7,	%l4
	array32	%i7,	%l6,	%g3
	movrlez	%i5,	%g5,	%o6
	for	%f22,	%f16,	%f30
	xor	%o1,	0x0E41,	%i2
	fmovsvc	%xcc,	%f28,	%f0
	movn	%xcc,	%l0,	%i3
	orncc	%g2,	0x1E69,	%l3
	alignaddrl	%i4,	%g4,	%l5
	movrlez	%g7,	%l1,	%g1
	lduh	[%l7 + 0x2C],	%l2
	nop
	set	0x30, %l5
	stb	%o4,	[%l7 + %l5]
	move	%icc,	%i0,	%i6
	fnor	%f14,	%f14,	%f28
	edge32l	%o3,	%o7,	%g6
	movvc	%icc,	%i1,	%o2
	stx	%o5,	[%l7 + 0x40]
	udivx	%l4,	0x184E,	%i7
	udivx	%l6,	0x15F5,	%o0
	nop
	set	0x28, %o1
	stb	%g3,	[%l7 + %o1]
	subc	%i5,	0x13EA,	%g5
	subcc	%o1,	0x04E8,	%o6
	addccc	%i2,	%i3,	%g2
	srax	%l0,	%l3,	%g4
	ldd	[%l7 + 0x40],	%l4
	mova	%xcc,	%i4,	%l1
	udiv	%g7,	0x0EB9,	%g1
	movn	%icc,	%l2,	%o4
	sethi	0x02E1,	%i0
	ldx	[%l7 + 0x10],	%o3
	umul	%i6,	0x00CF,	%g6
	edge16n	%o7,	%o2,	%i1
	edge32l	%l4,	%i7,	%l6
	udiv	%o0,	0x0C41,	%o5
	array8	%g3,	%i5,	%o1
	xnorcc	%g5,	0x1FFA,	%i2
	save %i3, %o6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g2,	%l3,	%g4
	fmovsgu	%icc,	%f23,	%f9
	addc	%l5,	0x0A72,	%l1
	ld	[%l7 + 0x10],	%f9
	movg	%xcc,	%g7,	%g1
	ldd	[%l7 + 0x40],	%f28
	fcmpgt32	%f6,	%f20,	%i4
	and	%l2,	0x0B93,	%i0
	fnors	%f18,	%f6,	%f25
	subccc	%o3,	%i6,	%g6
	udivx	%o7,	0x1D80,	%o2
	alignaddr	%i1,	%o4,	%i7
	edge32l	%l6,	%l4,	%o5
	sth	%o0,	[%l7 + 0x1A]
	movrne	%g3,	%o1,	%i5
	nop
	set	0x18, %g2
	sth	%i2,	[%l7 + %g2]
	orn	%i3,	%o6,	%g5
	add	%l0,	%l3,	%g4
	movrlez	%l5,	0x13E,	%l1
	fmovdneg	%xcc,	%f6,	%f23
	fsrc1	%f22,	%f4
	xor	%g2,	%g7,	%g1
	sub	%i4,	%i0,	%o3
	edge8n	%l2,	%g6,	%i6
	subcc	%o2,	%o7,	%o4
	edge8l	%i1,	%l6,	%l4
	fmovrdne	%o5,	%f6,	%f18
	fmovdcs	%xcc,	%f12,	%f5
	movvc	%icc,	%i7,	%o0
	sir	0x0105
	stw	%g3,	[%l7 + 0x38]
	srlx	%o1,	0x01,	%i2
	xorcc	%i3,	0x0E20,	%i5
	edge16n	%o6,	%l0,	%g5
	nop
	set	0x5B, %l4
	stb	%g4,	[%l7 + %l4]
	edge8l	%l5,	%l1,	%g2
	array32	%g7,	%g1,	%i4
	xnor	%i0,	%o3,	%l3
	fnot2	%f18,	%f30
	orn	%l2,	0x0130,	%i6
	mulscc	%g6,	0x0310,	%o2
	orncc	%o4,	%o7,	%l6
	fmovsleu	%xcc,	%f11,	%f31
	movpos	%xcc,	%l4,	%i1
	edge8ln	%o5,	%o0,	%i7
	fmovdle	%icc,	%f22,	%f15
	movl	%icc,	%g3,	%i2
	sir	0x0793
	edge8n	%o1,	%i3,	%o6
	save %l0, 0x0902, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x10],	%f24
	fpadd16	%f16,	%f26,	%f0
	fmovde	%icc,	%f30,	%f25
	xnor	%g4,	0x115C,	%g5
	movgu	%xcc,	%l5,	%g2
	movle	%icc,	%l1,	%g1
	orncc	%g7,	0x1DCE,	%i4
	ldsb	[%l7 + 0x0B],	%o3
	restore %i0, %l2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g6,	%i6
	fmovse	%icc,	%f3,	%f2
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	movl	%xcc,	%l4,	%l6
	movg	%xcc,	%o5,	%i1
	sdivx	%o0,	0x0CD2,	%i7
	subccc	%g3,	0x0BB1,	%o1
	addcc	%i3,	%i2,	%l0
	movrlz	%o6,	%i5,	%g4
	srlx	%l5,	%g2,	%l1
	or	%g1,	%g5,	%g7
	fmul8x16au	%f11,	%f28,	%f14
	move	%icc,	%i4,	%o3
	subc	%i0,	%l2,	%g6
	fcmple16	%f0,	%f8,	%i6
	movrgez	%l3,	%o2,	%o7
	fnegd	%f0,	%f30
	sll	%o4,	%l4,	%l6
	mulscc	%o5,	%o0,	%i7
	movneg	%icc,	%g3,	%o1
	array32	%i3,	%i1,	%l0
	movrlez	%i2,	0x0B9,	%o6
	movle	%icc,	%i5,	%g4
	ldub	[%l7 + 0x41],	%g2
	ldd	[%l7 + 0x68],	%l0
	fpsub32s	%f21,	%f15,	%f12
	edge8ln	%l5,	%g5,	%g1
	mova	%xcc,	%g7,	%o3
	ldx	[%l7 + 0x18],	%i0
	fmovdl	%icc,	%f1,	%f11
	edge8l	%l2,	%g6,	%i4
	fmovdl	%xcc,	%f14,	%f17
	edge16ln	%i6,	%o2,	%o7
	fmovdleu	%icc,	%f31,	%f3
	edge32ln	%l3,	%o4,	%l6
	udiv	%l4,	0x0107,	%o0
	stb	%o5,	[%l7 + 0x40]
	movcs	%icc,	%i7,	%g3
	umul	%o1,	%i1,	%l0
	sth	%i2,	[%l7 + 0x70]
	fmovsvc	%icc,	%f28,	%f10
	alignaddrl	%o6,	%i3,	%g4
	addcc	%i5,	0x0029,	%l1
	array16	%l5,	%g5,	%g2
	movg	%xcc,	%g1,	%o3
	umul	%i0,	%g7,	%g6
	movrgz	%l2,	0x27F,	%i4
	subcc	%o2,	%o7,	%l3
	sllx	%i6,	%o4,	%l6
	edge8ln	%o0,	%o5,	%i7
	and	%g3,	0x15FD,	%o1
	array8	%l4,	%l0,	%i1
	movgu	%icc,	%i2,	%i3
	sub	%o6,	0x17BB,	%g4
	stb	%l1,	[%l7 + 0x0F]
	edge16l	%i5,	%g5,	%g2
	std	%f26,	[%l7 + 0x38]
	ldsb	[%l7 + 0x60],	%l5
	movcs	%icc,	%g1,	%o3
	xorcc	%i0,	%g6,	%l2
	xnor	%g7,	%o2,	%o7
	movrgez	%i4,	%l3,	%o4
	mulscc	%i6,	0x12E0,	%l6
	std	%f12,	[%l7 + 0x38]
	fxnor	%f8,	%f2,	%f20
	udiv	%o0,	0x000F,	%i7
	andn	%o5,	%g3,	%l4
	stw	%o1,	[%l7 + 0x18]
	movneg	%xcc,	%l0,	%i1
	movrgz	%i2,	%o6,	%i3
	addccc	%g4,	%i5,	%g5
	movgu	%xcc,	%l1,	%g2
	fcmpeq32	%f20,	%f16,	%g1
	edge32ln	%l5,	%i0,	%g6
	sethi	0x0131,	%l2
	addcc	%g7,	0x0776,	%o3
	andn	%o2,	0x05F4,	%o7
	xor	%i4,	%l3,	%o4
	movg	%icc,	%i6,	%o0
	ldsw	[%l7 + 0x48],	%i7
	or	%l6,	0x18BD,	%g3
	movrlz	%l4,	0x004,	%o1
	edge16	%o5,	%i1,	%i2
	mova	%icc,	%l0,	%i3
	mulscc	%o6,	%i5,	%g5
	edge8ln	%l1,	%g2,	%g1
	sub	%g4,	%l5,	%i0
	movl	%icc,	%g6,	%g7
	ldd	[%l7 + 0x18],	%f30
	edge16n	%o3,	%l2,	%o7
	fnot1	%f2,	%f10
	and	%o2,	%i4,	%o4
	nop
	set	0x70, %l3
	std	%f22,	[%l7 + %l3]
	umul	%i6,	0x183E,	%o0
	movrgez	%l3,	%i7,	%g3
	movrgez	%l4,	0x348,	%o1
	array32	%l6,	%i1,	%i2
	movgu	%xcc,	%o5,	%l0
	sub	%i3,	%i5,	%g5
	mulscc	%o6,	0x0161,	%g2
	xnor	%g1,	%g4,	%l1
	and	%l5,	0x0CBE,	%g6
	sll	%i0,	%o3,	%g7
	lduh	[%l7 + 0x5E],	%o7
	umulcc	%o2,	0x1DE6,	%l2
	array32	%o4,	%i4,	%o0
	popc	0x174E,	%l3
	fcmple32	%f30,	%f28,	%i6
	movgu	%icc,	%g3,	%i7
	ldub	[%l7 + 0x75],	%o1
	edge8	%l4,	%l6,	%i2
	fmul8ulx16	%f14,	%f22,	%f30
	movge	%xcc,	%o5,	%i1
	edge32	%i3,	%l0,	%i5
	movne	%xcc,	%g5,	%o6
	fpack16	%f20,	%f17
	fpadd16s	%f19,	%f16,	%f30
	ldx	[%l7 + 0x58],	%g1
	umul	%g4,	%g2,	%l1
	lduh	[%l7 + 0x78],	%g6
	ldd	[%l7 + 0x50],	%f14
	movpos	%xcc,	%l5,	%i0
	alignaddrl	%o3,	%g7,	%o2
	movge	%xcc,	%l2,	%o7
	andncc	%o4,	%i4,	%o0
	fmovdge	%xcc,	%f27,	%f18
	fsrc2	%f26,	%f8
	and	%i6,	0x0FF0,	%g3
	andcc	%l3,	0x0518,	%i7
	movn	%icc,	%o1,	%l4
	lduh	[%l7 + 0x1C],	%l6
	stw	%i2,	[%l7 + 0x6C]
	movle	%icc,	%i1,	%o5
	udiv	%l0,	0x15AC,	%i5
	save %g5, 0x0BA2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o6,	%g4,	%g1
	edge32l	%l1,	%g6,	%g2
	movrgez	%i0,	0x2CB,	%l5
	fpadd16s	%f1,	%f7,	%f1
	lduw	[%l7 + 0x40],	%o3
	fnot1s	%f16,	%f30
	xorcc	%o2,	%g7,	%l2
	xnor	%o7,	%o4,	%o0
	mulscc	%i4,	%i6,	%l3
	umulcc	%g3,	0x0FF7,	%i7
	ldd	[%l7 + 0x38],	%f10
	and	%l4,	%l6,	%o1
	udivx	%i2,	0x199F,	%i1
	srl	%l0,	0x04,	%i5
	movpos	%xcc,	%o5,	%g5
	fands	%f13,	%f0,	%f30
	ldd	[%l7 + 0x18],	%f26
	sdiv	%o6,	0x0693,	%i3
	movcc	%xcc,	%g1,	%l1
	fmovscs	%icc,	%f11,	%f23
	sra	%g6,	0x15,	%g4
	fxors	%f3,	%f27,	%f30
	array8	%g2,	%l5,	%o3
	ldsw	[%l7 + 0x30],	%o2
	alignaddrl	%g7,	%l2,	%o7
	sdivcc	%o4,	0x1A1D,	%o0
	edge32l	%i0,	%i6,	%l3
	edge8ln	%g3,	%i7,	%l4
	udiv	%i4,	0x18C8,	%l6
	fmovde	%icc,	%f17,	%f10
	fxnor	%f14,	%f26,	%f30
	std	%f10,	[%l7 + 0x18]
	fnegd	%f24,	%f14
	movvc	%xcc,	%i2,	%i1
	fmovdneg	%icc,	%f19,	%f23
	ldsh	[%l7 + 0x70],	%o1
	ldsw	[%l7 + 0x28],	%l0
	subc	%o5,	%g5,	%i5
	array32	%o6,	%g1,	%l1
	fands	%f18,	%f5,	%f16
	edge32	%i3,	%g6,	%g2
	xnorcc	%l5,	0x168A,	%g4
	sethi	0x06CD,	%o3
	addccc	%g7,	0x0674,	%l2
	array32	%o7,	%o2,	%o0
	srl	%o4,	%i0,	%l3
	sethi	0x148C,	%g3
	movgu	%xcc,	%i6,	%i7
	fxnors	%f15,	%f7,	%f9
	fmovsn	%xcc,	%f11,	%f2
	sir	0x1013
	sra	%l4,	%l6,	%i4
	movre	%i1,	0x398,	%o1
	sllx	%i2,	0x19,	%o5
	fpadd16s	%f14,	%f23,	%f19
	movneg	%icc,	%g5,	%i5
	movneg	%icc,	%l0,	%g1
	sth	%l1,	[%l7 + 0x2E]
	fmovsge	%icc,	%f8,	%f2
	orncc	%i3,	0x0A34,	%g6
	move	%icc,	%o6,	%g2
	movrlez	%l5,	%g4,	%g7
	movneg	%xcc,	%l2,	%o7
	alignaddr	%o2,	%o0,	%o4
	edge8ln	%o3,	%i0,	%l3
	ld	[%l7 + 0x70],	%f26
	sth	%g3,	[%l7 + 0x14]
	alignaddrl	%i6,	%l4,	%l6
	sdivx	%i4,	0x0EEA,	%i7
	subccc	%i1,	%i2,	%o1
	addcc	%g5,	0x1173,	%o5
	orncc	%i5,	%l0,	%l1
	movvc	%xcc,	%g1,	%i3
	array16	%o6,	%g2,	%g6
	fnot1	%f0,	%f14
	sra	%l5,	0x13,	%g4
	sllx	%g7,	0x0E,	%l2
	ldx	[%l7 + 0x18],	%o7
	add	%o0,	%o4,	%o2
	fmovdneg	%icc,	%f3,	%f22
	movpos	%xcc,	%o3,	%i0
	fnands	%f18,	%f5,	%f17
	pdist	%f20,	%f8,	%f14
	ldx	[%l7 + 0x58],	%g3
	std	%f24,	[%l7 + 0x20]
	sdiv	%i6,	0x03FC,	%l3
	restore %l4, 0x037A, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i4,	%i1
	ld	[%l7 + 0x48],	%f1
	fmovrsne	%i7,	%f25,	%f8
	ldub	[%l7 + 0x2C],	%i2
	st	%f7,	[%l7 + 0x0C]
	fmovrdgz	%o1,	%f24,	%f4
	fnands	%f1,	%f29,	%f12
	sdivcc	%o5,	0x0793,	%i5
	movrlz	%l0,	0x388,	%l1
	xorcc	%g5,	0x0992,	%g1
	sth	%o6,	[%l7 + 0x4A]
	sdivcc	%g2,	0x11EB,	%i3
	fxnor	%f10,	%f22,	%f26
	movrgez	%l5,	0x202,	%g4
	movcs	%xcc,	%g7,	%l2
	umul	%g6,	0x1F9F,	%o7
	stw	%o4,	[%l7 + 0x18]
	movcs	%xcc,	%o2,	%o0
	fmul8sux16	%f14,	%f16,	%f0
	fnand	%f6,	%f16,	%f6
	movrne	%i0,	%o3,	%i6
	move	%xcc,	%l3,	%l4
	mulscc	%g3,	0x0842,	%i4
	fpackfix	%f18,	%f25
	movcs	%xcc,	%l6,	%i1
	andcc	%i7,	0x1E24,	%o1
	xorcc	%i2,	0x1E17,	%o5
	edge16	%l0,	%i5,	%g5
	movgu	%icc,	%g1,	%o6
	fornot1	%f2,	%f12,	%f12
	fmovdleu	%xcc,	%f28,	%f14
	edge16l	%l1,	%i3,	%l5
	sir	0x1F84
	orcc	%g4,	%g7,	%l2
	ldsh	[%l7 + 0x34],	%g6
	fpadd16s	%f15,	%f16,	%f9
	std	%f12,	[%l7 + 0x60]
	alignaddrl	%g2,	%o4,	%o7
	alignaddrl	%o2,	%i0,	%o0
	movrne	%o3,	0x3C3,	%i6
	xnorcc	%l4,	0x049D,	%g3
	fcmpne32	%f2,	%f20,	%i4
	xnor	%l6,	%i1,	%l3
	srl	%o1,	%i7,	%i2
	fmovdleu	%xcc,	%f3,	%f7
	stx	%l0,	[%l7 + 0x10]
	andn	%i5,	0x1303,	%o5
	fmovsn	%xcc,	%f24,	%f14
	movleu	%icc,	%g1,	%o6
	fors	%f19,	%f25,	%f21
	movrgz	%l1,	0x34B,	%i3
	fpadd16s	%f12,	%f16,	%f6
	andcc	%g5,	0x0018,	%g4
	sra	%g7,	0x0C,	%l5
	fandnot2	%f10,	%f14,	%f8
	stw	%l2,	[%l7 + 0x6C]
	movcc	%xcc,	%g2,	%g6
	udiv	%o7,	0x0F48,	%o4
	mova	%icc,	%o2,	%i0
	ld	[%l7 + 0x38],	%f15
	alignaddr	%o0,	%o3,	%i6
	sth	%l4,	[%l7 + 0x24]
	fmovdne	%icc,	%f10,	%f9
	fmovdle	%xcc,	%f31,	%f7
	fnot2	%f6,	%f0
	std	%f30,	[%l7 + 0x58]
	fandnot2s	%f7,	%f7,	%f22
	xnorcc	%g3,	%l6,	%i4
	movcs	%xcc,	%i1,	%l3
	movgu	%icc,	%o1,	%i7
	ldx	[%l7 + 0x68],	%l0
	andncc	%i2,	%i5,	%o5
	save %o6, %l1, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i3,	%g5,	%g7
	movrlez	%g4,	0x162,	%l2
	movrgz	%l5,	%g6,	%o7
	movrlez	%o4,	0x191,	%o2
	fmovsgu	%xcc,	%f15,	%f8
	array32	%g2,	%i0,	%o0
	movleu	%xcc,	%o3,	%l4
	movrgez	%i6,	%g3,	%i4
	edge16	%l6,	%l3,	%i1
	mulx	%i7,	0x193C,	%o1
	srlx	%l0,	%i2,	%o5
	sdivcc	%o6,	0x1C25,	%i5
	xor	%l1,	0x081D,	%g1
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	fmovsvc	%icc,	%f14,	%f11
	movn	%icc,	%i3,	%l2
	lduw	[%l7 + 0x08],	%g4
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%f28
	srax	%l5,	%g6,	%o7
	movrgez	%o4,	0x34F,	%o2
	fcmpgt32	%f4,	%f28,	%i0
	movrlez	%o0,	%o3,	%l4
	fandnot2s	%f30,	%f22,	%f17
	xnorcc	%g2,	%g3,	%i6
	movn	%icc,	%l6,	%i4
	subccc	%l3,	0x0BC8,	%i1
	std	%f20,	[%l7 + 0x18]
	smul	%o1,	0x14A4,	%l0
	fnegs	%f27,	%f29
	andn	%i2,	0x03D9,	%o5
	edge32	%o6,	%i5,	%i7
	edge16ln	%g1,	%l1,	%g5
	movre	%i3,	%g7,	%l2
	sllx	%g4,	%g6,	%l5
	edge16	%o7,	%o4,	%o2
	addccc	%i0,	%o0,	%l4
	and	%o3,	0x1128,	%g3
	movneg	%icc,	%g2,	%l6
	fcmpgt16	%f28,	%f20,	%i6
	fmovrsgz	%i4,	%f24,	%f15
	fandnot1	%f28,	%f14,	%f6
	xor	%i1,	%o1,	%l0
	movrlz	%i2,	%o5,	%o6
	subccc	%i5,	0x04A1,	%l3
	array8	%i7,	%l1,	%g5
	mulx	%g1,	%i3,	%l2
	srl	%g4,	0x17,	%g6
	movrne	%l5,	%o7,	%g7
	umulcc	%o2,	%i0,	%o4
	array8	%o0,	%o3,	%g3
	fpack32	%f10,	%f18,	%f10
	sethi	0x126F,	%g2
	smulcc	%l4,	%i6,	%i4
	alignaddrl	%l6,	%o1,	%l0
	stw	%i2,	[%l7 + 0x38]
	fmovsg	%xcc,	%f15,	%f14
	fandnot2	%f12,	%f26,	%f6
	xnor	%o5,	%i1,	%o6
	add	%l3,	0x1C33,	%i7
	and	%l1,	%g5,	%g1
	fzeros	%f29
	alignaddr	%i3,	%l2,	%i5
	nop
	set	0x26, %l6
	sth	%g6,	[%l7 + %l6]
	lduh	[%l7 + 0x46],	%g4
	std	%f26,	[%l7 + 0x28]
	srl	%o7,	0x06,	%g7
	movrlez	%o2,	0x203,	%i0
	addc	%o4,	%o0,	%o3
	array16	%l5,	%g2,	%l4
	alignaddr	%g3,	%i6,	%i4
	xnor	%l6,	0x124E,	%o1
	movre	%l0,	%i2,	%i1
	xnor	%o5,	0x1E4D,	%o6
	fsrc1s	%f18,	%f24
	nop
	set	0x58, %i6
	ldsb	[%l7 + %i6],	%l3
	addcc	%i7,	0x0E4F,	%g5
	movn	%icc,	%l1,	%i3
	sdivx	%g1,	0x0746,	%i5
	xnorcc	%g6,	0x02ED,	%l2
	edge16	%g4,	%g7,	%o7
	fnegs	%f5,	%f25
	movl	%icc,	%o2,	%i0
	xnor	%o4,	%o0,	%o3
	mulscc	%l5,	%l4,	%g2
	edge32	%i6,	%i4,	%l6
	orn	%o1,	0x1D06,	%g3
	lduh	[%l7 + 0x38],	%l0
	fmovse	%icc,	%f7,	%f23
	movrgez	%i2,	0x04F,	%o5
	fpsub16s	%f15,	%f21,	%f7
	sth	%o6,	[%l7 + 0x7A]
	sll	%l3,	%i7,	%i1
	ldsb	[%l7 + 0x56],	%g5
	xor	%i3,	%g1,	%i5
	addc	%g6,	%l1,	%g4
	fpack32	%f18,	%f0,	%f16
	nop
	set	0x08, %g4
	ldsw	[%l7 + %g4],	%g7
	fnot2	%f8,	%f0
	xnorcc	%l2,	0x1DDF,	%o2
	restore %o7, %i0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f20,	%f24,	%f8
	alignaddrl	%o0,	%o3,	%l5
	edge32n	%g2,	%l4,	%i6
	mova	%xcc,	%l6,	%i4
	popc	0x1C54,	%o1
	andncc	%g3,	%l0,	%o5
	edge32	%i2,	%o6,	%i7
	ld	[%l7 + 0x14],	%f23
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	xor	%i3,	0x00BD,	%g1
	movleu	%icc,	%l3,	%g6
	array16	%i5,	%l1,	%g4
	orncc	%l2,	%g7,	%o2
	alignaddrl	%o7,	%o4,	%i0
	ldsb	[%l7 + 0x3B],	%o3
	sub	%o0,	0x0AD4,	%l5
	sra	%g2,	%l4,	%i6
	subc	%i4,	0x0371,	%l6
	save %o1, 0x0F2E, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%f24
	lduh	[%l7 + 0x20],	%o5
	array16	%i2,	%o6,	%l0
	fmovrdlez	%i7,	%f12,	%f2
	edge16	%i1,	%g5,	%g1
	movrgez	%l3,	%g6,	%i5
	fmul8x16al	%f12,	%f3,	%f26
	andn	%i3,	0x1020,	%g4
	xorcc	%l1,	%g7,	%l2
	edge16l	%o7,	%o4,	%i0
	xorcc	%o3,	0x1C41,	%o0
	movrlz	%o2,	0x15E,	%g2
	fmovdvc	%icc,	%f28,	%f27
	fmovsne	%xcc,	%f19,	%f29
	ld	[%l7 + 0x30],	%f18
	addc	%l4,	0x0F5B,	%i6
	sllx	%l5,	%i4,	%o1
	sllx	%g3,	0x18,	%o5
	sdivcc	%l6,	0x0BF1,	%o6
	movrgz	%i2,	0x2DB,	%i7
	alignaddrl	%l0,	%g5,	%i1
	fornot1	%f10,	%f30,	%f22
	fornot2	%f18,	%f24,	%f16
	fnand	%f18,	%f14,	%f30
	edge16ln	%g1,	%l3,	%g6
	movg	%icc,	%i5,	%g4
	edge8l	%l1,	%g7,	%i3
	fsrc1	%f4,	%f24
	orncc	%l2,	0x09DE,	%o7
	edge8l	%o4,	%i0,	%o3
	fmovda	%icc,	%f2,	%f18
	stx	%o2,	[%l7 + 0x78]
	ldd	[%l7 + 0x58],	%o0
	andn	%l4,	%g2,	%i6
	umulcc	%l5,	%o1,	%i4
	subcc	%g3,	%l6,	%o6
	orncc	%i2,	0x19D8,	%o5
	movle	%xcc,	%i7,	%l0
	udivcc	%i1,	0x10A9,	%g5
	nop
	set	0x20, %i0
	std	%f2,	[%l7 + %i0]
	fpadd32	%f26,	%f2,	%f20
	fmovrslz	%g1,	%f11,	%f29
	movge	%icc,	%g6,	%l3
	addccc	%i5,	%l1,	%g4
	edge8n	%i3,	%g7,	%o7
	andn	%l2,	0x00E2,	%o4
	xor	%o3,	0x1388,	%i0
	movle	%icc,	%o2,	%l4
	mulscc	%g2,	%i6,	%l5
	xnorcc	%o0,	%i4,	%g3
	ldx	[%l7 + 0x38],	%o1
	movleu	%xcc,	%o6,	%l6
	fcmpd	%fcc0,	%f16,	%f24
	movvs	%icc,	%i2,	%i7
	sra	%l0,	0x10,	%o5
	movrlz	%i1,	0x175,	%g1
	srlx	%g5,	%l3,	%i5
	sth	%l1,	[%l7 + 0x1C]
	addc	%g6,	%i3,	%g7
	subccc	%o7,	%g4,	%l2
	fmovsle	%icc,	%f5,	%f19
	stw	%o4,	[%l7 + 0x24]
	fmovsa	%xcc,	%f13,	%f24
	stx	%i0,	[%l7 + 0x10]
	edge16l	%o2,	%o3,	%l4
	orn	%i6,	%l5,	%o0
	or	%g2,	0x0334,	%i4
	fmovrdne	%o1,	%f0,	%f30
	fmovdg	%xcc,	%f26,	%f28
	edge8	%o6,	%g3,	%l6
	fands	%f13,	%f28,	%f26
	ldd	[%l7 + 0x70],	%f20
	fmovrsgez	%i2,	%f3,	%f6
	mulscc	%l0,	0x03B9,	%o5
	fabsd	%f6,	%f10
	and	%i1,	0x079E,	%i7
	sra	%g5,	%g1,	%l3
	movne	%xcc,	%i5,	%l1
	movleu	%icc,	%i3,	%g7
	and	%g6,	%g4,	%l2
	subcc	%o7,	%i0,	%o2
	movleu	%icc,	%o3,	%o4
	srl	%i6,	%l5,	%o0
	udivx	%g2,	0x1CD5,	%i4
	ldub	[%l7 + 0x17],	%o1
	ld	[%l7 + 0x64],	%f27
	array32	%l4,	%g3,	%l6
	fmul8x16	%f29,	%f16,	%f28
	fmovsge	%icc,	%f18,	%f1
	array16	%o6,	%l0,	%o5
	udivcc	%i2,	0x0427,	%i7
	fmovsl	%xcc,	%f11,	%f8
	edge8	%g5,	%g1,	%l3
	xor	%i5,	%l1,	%i1
	movrne	%i3,	0x1F6,	%g7
	std	%f26,	[%l7 + 0x28]
	movcs	%icc,	%g4,	%l2
	andcc	%o7,	%i0,	%o2
	popc	%o3,	%g6
	edge16n	%o4,	%i6,	%l5
	xnor	%g2,	%i4,	%o1
	edge32l	%o0,	%l4,	%g3
	edge32l	%l6,	%o6,	%l0
	movle	%xcc,	%i2,	%i7
	subcc	%g5,	%o5,	%l3
	movre	%i5,	0x11F,	%l1
	fcmps	%fcc1,	%f17,	%f27
	fpmerge	%f21,	%f1,	%f0
	popc	%g1,	%i3
	lduw	[%l7 + 0x60],	%g7
	movl	%xcc,	%i1,	%l2
	ldx	[%l7 + 0x48],	%g4
	edge8n	%o7,	%i0,	%o3
	movneg	%xcc,	%g6,	%o2
	or	%i6,	%l5,	%o4
	move	%icc,	%g2,	%o1
	fcmpne16	%f28,	%f24,	%i4
	std	%f6,	[%l7 + 0x40]
	andn	%o0,	0x166F,	%g3
	move	%xcc,	%l6,	%l4
	alignaddrl	%l0,	%o6,	%i7
	movre	%g5,	%i2,	%l3
	sdiv	%i5,	0x02A2,	%o5
	edge16l	%g1,	%i3,	%g7
	sub	%l1,	0x0772,	%i1
	movg	%xcc,	%l2,	%g4
	movcc	%xcc,	%o7,	%i0
	udivcc	%g6,	0x1007,	%o3
	movvs	%icc,	%i6,	%l5
	ldsh	[%l7 + 0x4E],	%o2
	alignaddr	%o4,	%o1,	%i4
	edge16	%g2,	%g3,	%o0
	edge32	%l4,	%l6,	%o6
	udivcc	%l0,	0x18C3,	%i7
	fmovdvc	%icc,	%f6,	%f7
	srlx	%i2,	%g5,	%i5
	fxors	%f8,	%f16,	%f24
	movle	%xcc,	%o5,	%g1
	movvc	%icc,	%l3,	%i3
	fcmpeq32	%f10,	%f12,	%g7
	edge16ln	%l1,	%l2,	%g4
	st	%f28,	[%l7 + 0x64]
	fornot2s	%f19,	%f17,	%f18
	edge32	%i1,	%o7,	%i0
	movre	%g6,	0x2FD,	%o3
	fsrc2s	%f26,	%f10
	fmovdleu	%xcc,	%f11,	%f13
	stx	%l5,	[%l7 + 0x68]
	udivcc	%i6,	0x1980,	%o2
	xnor	%o4,	%i4,	%o1
	edge16l	%g2,	%g3,	%o0
	edge32l	%l4,	%l6,	%l0
	ldsw	[%l7 + 0x74],	%o6
	subc	%i2,	0x1B98,	%i7
	fnegs	%f11,	%f22
	edge8	%i5,	%g5,	%g1
	subcc	%l3,	%o5,	%g7
	sir	0x07CB
	fmovsn	%icc,	%f13,	%f8
	mova	%icc,	%l1,	%l2
	edge8ln	%i3,	%g4,	%o7
	movvc	%icc,	%i1,	%g6
	add	%i0,	0x0885,	%l5
	movne	%xcc,	%o3,	%o2
	ldx	[%l7 + 0x38],	%o4
	movcc	%icc,	%i4,	%i6
	fmovsge	%icc,	%f8,	%f31
	udiv	%g2,	0x0774,	%g3
	lduh	[%l7 + 0x4E],	%o1
	movn	%xcc,	%o0,	%l4
	move	%icc,	%l6,	%l0
	andn	%o6,	0x077C,	%i2
	sra	%i7,	0x16,	%g5
	fmovdn	%icc,	%f27,	%f13
	st	%f3,	[%l7 + 0x78]
	addcc	%i5,	0x07DA,	%g1
	ld	[%l7 + 0x50],	%f26
	fpsub16	%f30,	%f14,	%f4
	ldsw	[%l7 + 0x68],	%o5
	faligndata	%f18,	%f16,	%f8
	edge8	%g7,	%l1,	%l2
	fpadd32	%f6,	%f20,	%f22
	ld	[%l7 + 0x20],	%f7
	srlx	%l3,	%g4,	%i3
	st	%f12,	[%l7 + 0x70]
	fmuld8ulx16	%f10,	%f11,	%f2
	alignaddrl	%i1,	%g6,	%o7
	fmovrdne	%i0,	%f24,	%f14
	ldub	[%l7 + 0x37],	%l5
	sllx	%o3,	0x02,	%o2
	ldsh	[%l7 + 0x12],	%i4
	sir	0x17D3
	fmovsne	%xcc,	%f5,	%f0
	alignaddr	%o4,	%g2,	%i6
	fnegd	%f0,	%f30
	andn	%g3,	%o1,	%o0
	array8	%l6,	%l4,	%l0
	add	%o6,	0x0D10,	%i7
	edge8	%i2,	%g5,	%i5
	sll	%g1,	0x18,	%o5
	add	%g7,	%l1,	%l2
	ldd	[%l7 + 0x70],	%l2
	array8	%i3,	%g4,	%g6
	fnot2s	%f19,	%f20
	movleu	%icc,	%o7,	%i0
	movgu	%xcc,	%l5,	%i1
	orncc	%o3,	0x0870,	%o2
	movvs	%xcc,	%o4,	%g2
	movcc	%xcc,	%i4,	%g3
	fmovrslez	%i6,	%f28,	%f11
	fcmpgt16	%f12,	%f12,	%o1
	fcmped	%fcc3,	%f10,	%f6
	andn	%o0,	%l6,	%l0
	lduh	[%l7 + 0x68],	%l4
	smul	%i7,	0x01C1,	%i2
	ld	[%l7 + 0x5C],	%f3
	movl	%icc,	%o6,	%g5
	edge8ln	%i5,	%o5,	%g7
	std	%f14,	[%l7 + 0x70]
	andn	%l1,	0x08FD,	%g1
	movpos	%xcc,	%l3,	%i3
	mulscc	%l2,	%g6,	%g4
	umulcc	%i0,	%l5,	%o7
	subcc	%i1,	%o2,	%o4
	fcmple16	%f18,	%f4,	%g2
	lduw	[%l7 + 0x58],	%i4
	sub	%g3,	%i6,	%o3
	fpsub32	%f18,	%f28,	%f30
	addc	%o0,	0x1CBC,	%o1
	movl	%icc,	%l0,	%l4
	fmovde	%xcc,	%f8,	%f11
	xorcc	%l6,	0x0788,	%i7
	mova	%xcc,	%o6,	%g5
	sth	%i2,	[%l7 + 0x40]
	ldsb	[%l7 + 0x5C],	%o5
	fpsub16	%f2,	%f14,	%f8
	fcmpes	%fcc0,	%f26,	%f23
	siam	0x5
	fzeros	%f11
	fmovsa	%xcc,	%f23,	%f26
	pdist	%f8,	%f30,	%f14
	fpack32	%f24,	%f8,	%f30
	ldd	[%l7 + 0x50],	%f12
	movleu	%xcc,	%g7,	%i5
	subc	%l1,	0x0560,	%g1
	ldd	[%l7 + 0x08],	%f10
	ldd	[%l7 + 0x08],	%l2
	fandnot1	%f16,	%f26,	%f26
	fmovsgu	%xcc,	%f5,	%f3
	std	%f16,	[%l7 + 0x40]
	subccc	%l2,	%i3,	%g6
	fmul8ulx16	%f30,	%f12,	%f4
	save %g4, 0x1D0B, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i0,	%i1,	%o7
	fnegs	%f6,	%f8
	fmovdn	%xcc,	%f6,	%f23
	edge32ln	%o2,	%g2,	%o4
	array32	%g3,	%i6,	%o3
	ld	[%l7 + 0x48],	%f22
	sethi	0x06F6,	%i4
	andcc	%o0,	%l0,	%o1
	movcs	%xcc,	%l6,	%l4
	array16	%i7,	%o6,	%g5
	andcc	%o5,	0x1DC4,	%i2
	movrlz	%g7,	%i5,	%l1
	fmul8x16	%f24,	%f0,	%f28
	fzero	%f4
	movre	%l3,	%g1,	%i3
	ld	[%l7 + 0x74],	%f0
	addccc	%l2,	%g4,	%g6
	nop
	set	0x52, %l0
	ldub	[%l7 + %l0],	%i0
	fmovscs	%xcc,	%f22,	%f22
	orcc	%i1,	%o7,	%l5
	ldx	[%l7 + 0x28],	%g2
	andcc	%o4,	0x0DA0,	%o2
	ldd	[%l7 + 0x38],	%i6
	movrne	%o3,	%g3,	%o0
	edge8n	%l0,	%i4,	%o1
	andcc	%l4,	0x13A2,	%l6
	movrgz	%i7,	0x102,	%o6
	sub	%g5,	0x06FB,	%o5
	array32	%i2,	%g7,	%i5
	movrlez	%l3,	0x13E,	%l1
	fornot2s	%f7,	%f19,	%f17
	fmovsleu	%xcc,	%f3,	%f15
	array8	%g1,	%l2,	%i3
	ldsw	[%l7 + 0x58],	%g4
	movcs	%xcc,	%g6,	%i1
	fmovrsgz	%i0,	%f23,	%f20
	movcs	%xcc,	%l5,	%o7
	addccc	%o4,	%g2,	%i6
	movrne	%o2,	%o3,	%g3
	fmul8x16	%f23,	%f26,	%f14
	movrgez	%o0,	%i4,	%l0
	stw	%l4,	[%l7 + 0x5C]
	movne	%icc,	%o1,	%l6
	stw	%o6,	[%l7 + 0x70]
	alignaddrl	%i7,	%o5,	%i2
	fmovsgu	%xcc,	%f31,	%f21
	edge32l	%g7,	%i5,	%g5
	sub	%l3,	0x0596,	%l1
	popc	%g1,	%i3
	sir	0x12BF
	edge8l	%l2,	%g4,	%g6
	movvc	%xcc,	%i0,	%l5
	fxors	%f3,	%f13,	%f8
	edge32l	%o7,	%i1,	%o4
	fpadd16	%f6,	%f12,	%f12
	sdivcc	%i6,	0x0889,	%o2
	array8	%o3,	%g3,	%o0
	smulcc	%i4,	0x1659,	%l0
	fornot1	%f6,	%f14,	%f20
	srl	%l4,	%o1,	%g2
	udivx	%l6,	0x079C,	%i7
	add	%o6,	%i2,	%o5
	sethi	0x1938,	%g7
	xorcc	%i5,	0x14BE,	%g5
	fnot1	%f26,	%f26
	smulcc	%l3,	0x09DF,	%l1
	fexpand	%f22,	%f26
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%f20
	movneg	%xcc,	%g1,	%i3
	stx	%g4,	[%l7 + 0x20]
	xorcc	%g6,	0x0E21,	%i0
	sub	%l5,	%o7,	%l2
	movg	%icc,	%o4,	%i1
	xorcc	%o2,	%i6,	%g3
	xorcc	%o0,	0x092B,	%o3
	sth	%i4,	[%l7 + 0x4A]
	srl	%l4,	%o1,	%g2
	faligndata	%f0,	%f20,	%f10
	lduh	[%l7 + 0x32],	%l6
	move	%xcc,	%i7,	%l0
	fmovsg	%icc,	%f11,	%f25
	sth	%i2,	[%l7 + 0x34]
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%f0
	xor	%o5,	%o6,	%g7
	sra	%g5,	0x01,	%l3
	andncc	%i5,	%g1,	%l1
	popc	%i3,	%g4
	move	%xcc,	%i0,	%l5
	fmovrdgz	%o7,	%f0,	%f30
	fxnor	%f26,	%f6,	%f22
	fnands	%f5,	%f29,	%f30
	orn	%g6,	0x097E,	%o4
	fmovdle	%xcc,	%f19,	%f25
	save %i1, %l2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f2,	%f25
	fcmpne16	%f20,	%f28,	%g3
	movcc	%xcc,	%o2,	%o3
	ldsw	[%l7 + 0x5C],	%i4
	sub	%o0,	0x10C6,	%o1
	edge8l	%l4,	%g2,	%i7
	movrne	%l6,	0x087,	%l0
	xor	%o5,	%i2,	%o6
	movrne	%g5,	0x018,	%l3
	stw	%g7,	[%l7 + 0x78]
	subcc	%g1,	0x095C,	%i5
	alignaddr	%i3,	%l1,	%i0
	movneg	%icc,	%l5,	%g4
	movgu	%icc,	%g6,	%o4
	edge32	%o7,	%i1,	%i6
	xnor	%l2,	%g3,	%o2
	fmovdgu	%icc,	%f2,	%f27
	sdivcc	%o3,	0x017E,	%i4
	move	%xcc,	%o1,	%l4
	sir	0x0718
	for	%f16,	%f20,	%f6
	fsrc1s	%f28,	%f2
	udivcc	%g2,	0x1743,	%o0
	movrgez	%l6,	%l0,	%i7
	edge32	%i2,	%o6,	%o5
	fmovdcc	%xcc,	%f12,	%f27
	fandnot1	%f16,	%f16,	%f30
	edge8n	%l3,	%g7,	%g5
	array8	%i5,	%i3,	%g1
	fmovdvc	%icc,	%f23,	%f15
	addcc	%i0,	0x183E,	%l1
	srl	%g4,	0x1E,	%l5
	udiv	%g6,	0x15EA,	%o7
	edge8n	%i1,	%i6,	%o4
	xorcc	%l2,	0x0344,	%g3
	move	%xcc,	%o2,	%i4
	movle	%xcc,	%o1,	%l4
	move	%xcc,	%o3,	%g2
	xor	%o0,	0x1CE3,	%l6
	andcc	%l0,	0x0C29,	%i7
	andn	%i2,	0x164C,	%o5
	or	%l3,	%g7,	%o6
	srl	%i5,	0x12,	%i3
	fsrc2	%f26,	%f0
	fmul8ulx16	%f28,	%f26,	%f8
	fcmpeq32	%f24,	%f2,	%g1
	udiv	%g5,	0x02DA,	%l1
	addcc	%g4,	%l5,	%i0
	smul	%o7,	%g6,	%i6
	edge8	%i1,	%o4,	%g3
	edge32n	%l2,	%o2,	%o1
	movvs	%xcc,	%l4,	%o3
	and	%g2,	0x02BF,	%i4
	movne	%icc,	%o0,	%l6
	fpackfix	%f20,	%f9
	fmovrdgez	%l0,	%f26,	%f16
	fornot1	%f28,	%f16,	%f22
	ld	[%l7 + 0x5C],	%f0
	sdivcc	%i7,	0x10D8,	%o5
	ldx	[%l7 + 0x70],	%l3
	fexpand	%f18,	%f30
	fmul8x16au	%f31,	%f26,	%f18
	save %g7, 0x1EDF, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i2,	0x0066,	%i5
	movne	%xcc,	%i3,	%g1
	movcc	%xcc,	%g5,	%g4
	fcmpne16	%f6,	%f22,	%l5
	andn	%i0,	0x1DD3,	%o7
	xnor	%g6,	%i6,	%i1
	edge16l	%l1,	%g3,	%o4
	addccc	%l2,	0x0114,	%o1
	xnor	%o2,	0x1673,	%l4
	ldsb	[%l7 + 0x0B],	%o3
	movg	%xcc,	%i4,	%g2
	subc	%l6,	%l0,	%o0
	movrne	%o5,	%i7,	%l3
	fnot1	%f28,	%f12
	addcc	%o6,	%g7,	%i5
	movl	%xcc,	%i2,	%g1
	mulscc	%g5,	%i3,	%g4
	alignaddr	%l5,	%o7,	%g6
	edge32	%i0,	%i6,	%l1
	edge32n	%i1,	%g3,	%o4
	sllx	%o1,	%o2,	%l4
	srax	%l2,	0x03,	%i4
	movneg	%icc,	%o3,	%l6
	movpos	%xcc,	%g2,	%l0
	stw	%o0,	[%l7 + 0x40]
	ldx	[%l7 + 0x30],	%o5
	fpadd32s	%f27,	%f2,	%f12
	save %l3, %o6, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g7,	%i5,	%i2
	edge16l	%g5,	%g1,	%g4
	sdivcc	%i3,	0x1C20,	%o7
	fornot2	%f24,	%f20,	%f26
	movcc	%xcc,	%l5,	%i0
	edge32	%g6,	%i6,	%l1
	fmovd	%f18,	%f20
	add	%i1,	0x1C95,	%o4
	edge8	%g3,	%o1,	%o2
	add	%l2,	%i4,	%o3
	fone	%f10
	sdivx	%l6,	0x01AB,	%l4
	fors	%f4,	%f13,	%f0
	fxors	%f7,	%f27,	%f5
	edge8ln	%l0,	%o0,	%o5
	ldd	[%l7 + 0x28],	%f20
	ldub	[%l7 + 0x57],	%g2
	fexpand	%f26,	%f14
	movre	%o6,	0x20D,	%l3
	movvc	%xcc,	%i7,	%i5
	edge8ln	%g7,	%g5,	%i2
	stb	%g4,	[%l7 + 0x1E]
	ld	[%l7 + 0x54],	%f4
	srlx	%i3,	%o7,	%l5
	stb	%i0,	[%l7 + 0x70]
	array8	%g1,	%g6,	%i6
	edge32n	%l1,	%i1,	%g3
	edge16l	%o4,	%o1,	%o2
	sth	%i4,	[%l7 + 0x44]
	sdivcc	%l2,	0x1D71,	%o3
	ld	[%l7 + 0x64],	%f13
	array16	%l4,	%l0,	%l6
	fpack16	%f22,	%f6
	fnors	%f1,	%f27,	%f17
	umulcc	%o5,	%g2,	%o6
	fpadd16s	%f3,	%f4,	%f11
	movcc	%xcc,	%o0,	%i7
	nop
	set	0x79, %i7
	ldsb	[%l7 + %i7],	%i5
	fcmpgt32	%f24,	%f26,	%l3
	xorcc	%g7,	%i2,	%g4
	fmovsge	%icc,	%f25,	%f17
	fmovdle	%xcc,	%f9,	%f3
	sir	0x17D1
	umul	%i3,	0x1707,	%g5
	and	%o7,	0x19B0,	%i0
	movle	%icc,	%l5,	%g6
	fmovscc	%icc,	%f7,	%f3
	ldsb	[%l7 + 0x18],	%g1
	orncc	%i6,	0x0B26,	%i1
	andn	%l1,	%g3,	%o1
	ld	[%l7 + 0x10],	%f5
	sir	0x0C15
	fmovdgu	%icc,	%f7,	%f15
	edge32n	%o2,	%i4,	%l2
	lduw	[%l7 + 0x08],	%o3
	andn	%l4,	0x0503,	%l0
	fmovscc	%icc,	%f27,	%f6
	andncc	%o4,	%o5,	%l6
	movrgz	%o6,	%g2,	%i7
	ldub	[%l7 + 0x1E],	%o0
	fpmerge	%f8,	%f10,	%f24
	sub	%i5,	%l3,	%g7
	sllx	%g4,	0x16,	%i2
	fmovdge	%icc,	%f14,	%f6
	movn	%icc,	%g5,	%o7
	udiv	%i0,	0x1111,	%l5
	movl	%xcc,	%i3,	%g1
	xorcc	%i6,	%i1,	%g6
	sll	%g3,	0x17,	%l1
	ldsh	[%l7 + 0x3C],	%o2
	popc	0x01BB,	%o1
	srl	%l2,	%o3,	%i4
	movrne	%l4,	0x369,	%l0
	mulscc	%o5,	0x10DA,	%l6
	ldub	[%l7 + 0x6F],	%o6
	umulcc	%o4,	0x0E25,	%g2
	sir	0x133A
	udiv	%i7,	0x182A,	%i5
	ldub	[%l7 + 0x7F],	%o0
	fpsub32s	%f26,	%f30,	%f15
	movge	%icc,	%l3,	%g4
	fmovrde	%g7,	%f0,	%f4
	restore %g5, %i2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o7,	%i3,	%g1
	movge	%icc,	%i6,	%i1
	ldsb	[%l7 + 0x6C],	%l5
	fcmpeq16	%f6,	%f8,	%g3
	xnor	%g6,	0x00B5,	%o2
	xorcc	%o1,	0x1AE4,	%l1
	fcmpes	%fcc0,	%f6,	%f4
	fmovs	%f14,	%f6
	movg	%xcc,	%l2,	%i4
	addcc	%o3,	0x13F6,	%l0
	sdivx	%o5,	0x04EF,	%l6
	movle	%icc,	%o6,	%o4
	nop
	set	0x30, %g7
	ldx	[%l7 + %g7],	%l4
	movvs	%icc,	%g2,	%i5
	udiv	%i7,	0x08EA,	%o0
	movleu	%xcc,	%l3,	%g4
	fmovdgu	%xcc,	%f8,	%f8
	sdivcc	%g7,	0x1674,	%g5
	fmul8ulx16	%f28,	%f20,	%f24
	move	%xcc,	%i2,	%i0
	array8	%i3,	%o7,	%g1
	fmul8x16au	%f30,	%f0,	%f28
	alignaddrl	%i6,	%i1,	%g3
	edge16l	%l5,	%g6,	%o1
	xorcc	%o2,	0x1D08,	%l1
	movvs	%icc,	%i4,	%o3
	xorcc	%l0,	0x094E,	%o5
	orn	%l6,	%l2,	%o6
	movrne	%l4,	%o4,	%i5
	fmovrdgz	%g2,	%f2,	%f12
	fnegs	%f11,	%f20
	andn	%i7,	%l3,	%g4
	andcc	%o0,	0x14C5,	%g7
	udivx	%i2,	0x0875,	%g5
	sra	%i0,	0x1D,	%o7
	ldx	[%l7 + 0x40],	%i3
	array16	%g1,	%i1,	%i6
	edge32ln	%g3,	%l5,	%g6
	smul	%o2,	%o1,	%i4
	ld	[%l7 + 0x68],	%f27
	andn	%l1,	%l0,	%o5
	sdiv	%o3,	0x0FF4,	%l2
	addc	%o6,	0x1C96,	%l4
	sllx	%l6,	%i5,	%g2
	fmovda	%xcc,	%f0,	%f17
	movpos	%xcc,	%i7,	%o4
	movleu	%xcc,	%l3,	%g4
	mulx	%g7,	%i2,	%o0
	sra	%i0,	0x18,	%o7
	subcc	%i3,	%g5,	%i1
	fandnot2s	%f3,	%f23,	%f3
	srl	%g1,	%i6,	%g3
	umulcc	%l5,	%g6,	%o2
	fmuld8ulx16	%f7,	%f5,	%f26
	sll	%o1,	%l1,	%l0
	fnors	%f21,	%f3,	%f6
	alignaddrl	%i4,	%o5,	%o3
	srl	%o6,	%l4,	%l2
	xnorcc	%i5,	0x0E5A,	%g2
	edge32ln	%l6,	%i7,	%l3
	movrne	%o4,	0x2C3,	%g7
	orn	%i2,	0x143D,	%g4
	mulx	%o0,	0x00DA,	%o7
	and	%i3,	%g5,	%i0
	udivcc	%i1,	0x1B0E,	%i6
	movg	%xcc,	%g1,	%l5
	stb	%g3,	[%l7 + 0x71]
	edge32	%o2,	%g6,	%l1
	fpmerge	%f19,	%f29,	%f24
	std	%f28,	[%l7 + 0x58]
	edge8ln	%o1,	%i4,	%l0
	fmovs	%f28,	%f21
	lduh	[%l7 + 0x52],	%o5
	fpadd16	%f8,	%f6,	%f22
	movre	%o3,	%l4,	%o6
	fcmpes	%fcc3,	%f25,	%f17
	fnand	%f24,	%f6,	%f16
	fmul8x16	%f23,	%f12,	%f0
	movcs	%icc,	%i5,	%g2
	fmovrsgez	%l2,	%f1,	%f14
	srax	%i7,	%l3,	%o4
	and	%g7,	0x0991,	%l6
	andcc	%i2,	%g4,	%o7
	movpos	%icc,	%i3,	%g5
	edge32n	%i0,	%o0,	%i1
	mulscc	%g1,	0x1BB3,	%i6
	movleu	%icc,	%l5,	%o2
	addccc	%g3,	%g6,	%l1
	udiv	%o1,	0x1A8B,	%l0
	udivcc	%i4,	0x0B72,	%o5
	movge	%icc,	%l4,	%o6
	movvc	%xcc,	%o3,	%g2
	mulx	%i5,	0x1CE1,	%i7
	nop
	set	0x4A, %o2
	lduh	[%l7 + %o2],	%l2
	stw	%o4,	[%l7 + 0x54]
	ldd	[%l7 + 0x78],	%g6
	sdivcc	%l6,	0x0F5E,	%i2
	sdivcc	%l3,	0x0BB0,	%o7
	movrgz	%g4,	0x3FB,	%i3
	movrgz	%g5,	0x1F5,	%o0
	stw	%i1,	[%l7 + 0x3C]
	edge32l	%i0,	%i6,	%g1
	srl	%o2,	%g3,	%g6
	umulcc	%l1,	0x0B65,	%o1
	xor	%l0,	%i4,	%l5
	sdivx	%l4,	0x131C,	%o5
	subccc	%o6,	%g2,	%i5
	orcc	%o3,	0x1245,	%l2
	lduh	[%l7 + 0x58],	%o4
	ldub	[%l7 + 0x4B],	%i7
	fands	%f13,	%f19,	%f21
	addccc	%l6,	0x0320,	%g7
	udivx	%i2,	0x1A95,	%o7
	ld	[%l7 + 0x7C],	%f31
	orn	%l3,	0x01DB,	%i3
	ldd	[%l7 + 0x20],	%g4
	std	%f28,	[%l7 + 0x70]
	stb	%o0,	[%l7 + 0x53]
	sra	%i1,	0x04,	%g4
	fmovspos	%icc,	%f13,	%f11
	andcc	%i6,	%i0,	%g1
	movn	%xcc,	%g3,	%g6
	fcmpeq32	%f26,	%f2,	%o2
	and	%o1,	%l0,	%l1
	mulx	%i4,	%l4,	%o5
	movcs	%xcc,	%o6,	%l5
	stw	%i5,	[%l7 + 0x70]
	move	%icc,	%g2,	%o3
	movrgz	%o4,	%l2,	%i7
	fmovsn	%icc,	%f27,	%f26
	movrgez	%l6,	0x0A5,	%i2
	save %o7, 0x0D19, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f31,	%f29,	%f21
	fmovdl	%xcc,	%f26,	%f30
	mulx	%g7,	%g5,	%o0
	ldx	[%l7 + 0x70],	%i1
	sdivcc	%i3,	0x090A,	%g4
	edge8l	%i0,	%g1,	%i6
	movle	%xcc,	%g3,	%o2
	addcc	%g6,	0x161B,	%o1
	fcmpeq16	%f26,	%f6,	%l0
	stb	%l1,	[%l7 + 0x52]
	fones	%f17
	lduw	[%l7 + 0x0C],	%l4
	fxnor	%f10,	%f18,	%f20
	xorcc	%i4,	%o6,	%o5
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	sir	0x048F
	fandnot2s	%f24,	%f1,	%f30
	st	%f26,	[%l7 + 0x44]
	movne	%xcc,	%i5,	%o4
	fmovrdlz	%l2,	%f10,	%f6
	fxnor	%f4,	%f18,	%f14
	movvs	%icc,	%o3,	%i7
	movleu	%xcc,	%l6,	%i2
	movpos	%xcc,	%l3,	%o7
	edge8n	%g5,	%o0,	%g7
	fnegs	%f28,	%f1
	fmovdcs	%xcc,	%f14,	%f1
	ldd	[%l7 + 0x10],	%f8
	ldd	[%l7 + 0x18],	%i0
	fcmpne16	%f28,	%f12,	%i3
	sdivx	%g4,	0x0C95,	%i0
	addc	%g1,	%g3,	%o2
	fcmps	%fcc0,	%f17,	%f17
	movvc	%icc,	%g6,	%o1
	addccc	%i6,	%l1,	%l0
	fmuld8sux16	%f30,	%f24,	%f26
	edge32	%l4,	%o6,	%i4
	xnorcc	%o5,	%l5,	%i5
	move	%icc,	%o4,	%l2
	movpos	%icc,	%o3,	%g2
	movrlez	%i7,	0x2CA,	%i2
	umul	%l3,	0x0BA5,	%l6
	alignaddr	%g5,	%o0,	%g7
	restore %o7, %i1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i3,	0x0B26,	%i0
	movge	%xcc,	%g3,	%o2
	addccc	%g6,	%o1,	%g1
	ldd	[%l7 + 0x58],	%i6
	add	%l1,	%l0,	%l4
	orcc	%o6,	%i4,	%l5
	movneg	%icc,	%i5,	%o5
	xnorcc	%o4,	%o3,	%g2
	edge8n	%i7,	%i2,	%l2
	movcs	%icc,	%l3,	%l6
	ldsb	[%l7 + 0x25],	%o0
	edge32ln	%g5,	%o7,	%g7
	fmovrdlez	%i1,	%f2,	%f22
	xor	%i3,	0x1717,	%i0
	fmovsne	%icc,	%f15,	%f27
	fxnor	%f14,	%f12,	%f16
	array32	%g4,	%o2,	%g6
	fpack32	%f0,	%f18,	%f24
	fmul8x16	%f5,	%f8,	%f12
	xnor	%g3,	%g1,	%o1
	umul	%i6,	0x0C5B,	%l1
	fcmpne32	%f12,	%f18,	%l4
	sra	%o6,	0x08,	%i4
	fmovsg	%icc,	%f8,	%f17
	movrgez	%l0,	%i5,	%l5
	and	%o5,	%o4,	%o3
	fnegs	%f30,	%f28
	udivcc	%g2,	0x0224,	%i7
	fmovdcs	%icc,	%f15,	%f19
	xnorcc	%l2,	0x1953,	%i2
	array32	%l6,	%o0,	%g5
	fmovsl	%icc,	%f10,	%f2
	stw	%o7,	[%l7 + 0x48]
	ldx	[%l7 + 0x28],	%l3
	xnorcc	%g7,	%i1,	%i0
	sdiv	%i3,	0x0975,	%o2
	movrgz	%g4,	0x2A9,	%g3
	edge16l	%g1,	%g6,	%o1
	fcmple16	%f22,	%f0,	%l1
	movpos	%xcc,	%i6,	%l4
	xorcc	%i4,	%o6,	%i5
	edge16	%l5,	%o5,	%o4
	sethi	0x15DE,	%l0
	movg	%icc,	%o3,	%g2
	save %l2, 0x1146, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i2,	0x0AA,	%o0
	fmovsleu	%xcc,	%f30,	%f14
	subccc	%g5,	0x0CCF,	%o7
	xnor	%l3,	0x1D1E,	%g7
	movvs	%xcc,	%i1,	%l6
	ldd	[%l7 + 0x30],	%f22
	array16	%i0,	%i3,	%o2
	array16	%g4,	%g3,	%g6
	fmovrdlz	%g1,	%f4,	%f8
	ldd	[%l7 + 0x68],	%f22
	fmul8x16al	%f0,	%f4,	%f22
	fmovdgu	%icc,	%f29,	%f23
	fmovdneg	%icc,	%f8,	%f6
	array32	%l1,	%i6,	%l4
	or	%o1,	%o6,	%i5
	fmovrdlz	%l5,	%f2,	%f2
	move	%icc,	%o5,	%i4
	ldsh	[%l7 + 0x34],	%l0
	for	%f8,	%f24,	%f24
	lduw	[%l7 + 0x3C],	%o4
	ldsh	[%l7 + 0x08],	%g2
	fandnot1	%f2,	%f2,	%f12
	ldub	[%l7 + 0x25],	%l2
	udiv	%i7,	0x0F70,	%i2
	fmovd	%f26,	%f30
	movrgz	%o3,	0x3C1,	%g5
	sdivx	%o0,	0x0AEF,	%o7
	udivcc	%g7,	0x1093,	%i1
	xorcc	%l3,	0x16C4,	%i0
	movrlz	%l6,	%i3,	%g4
	alignaddrl	%g3,	%g6,	%g1
	xor	%l1,	0x0BA4,	%i6
	fnot2	%f4,	%f26
	fmovscc	%icc,	%f25,	%f11
	array8	%o2,	%o1,	%o6
	udivcc	%l4,	0x189B,	%i5
	andn	%l5,	0x00DD,	%i4
	fmovsle	%xcc,	%f20,	%f29
	movle	%icc,	%l0,	%o5
	edge16	%o4,	%l2,	%g2
	nop
	set	0x08, %o7
	std	%f10,	[%l7 + %o7]
	edge32n	%i7,	%i2,	%o3
	sub	%g5,	%o0,	%o7
	sth	%g7,	[%l7 + 0x08]
	stw	%l3,	[%l7 + 0x50]
	add	%i1,	%i0,	%l6
	nop
	set	0x1C, %o0
	stw	%i3,	[%l7 + %o0]
	fmovdne	%icc,	%f0,	%f8
	andn	%g3,	%g6,	%g4
	array16	%l1,	%g1,	%i6
	sdiv	%o2,	0x177E,	%o1
	array16	%l4,	%i5,	%l5
	mova	%xcc,	%o6,	%i4
	edge16l	%o5,	%l0,	%l2
	smul	%o4,	%i7,	%g2
	mulscc	%i2,	0x07AD,	%g5
	fmovdleu	%xcc,	%f7,	%f22
	orncc	%o3,	%o7,	%g7
	xnor	%l3,	0x1CB0,	%o0
	edge8n	%i0,	%l6,	%i3
	array8	%i1,	%g3,	%g4
	edge8n	%l1,	%g1,	%i6
	array16	%g6,	%o2,	%o1
	movvs	%icc,	%i5,	%l5
	smulcc	%l4,	%i4,	%o5
	edge8ln	%o6,	%l0,	%l2
	subcc	%i7,	0x1E6F,	%g2
	sdivx	%i2,	0x09D9,	%o4
	umul	%o3,	%g5,	%o7
	movn	%icc,	%g7,	%l3
	fmovsne	%icc,	%f9,	%f5
	movgu	%xcc,	%o0,	%l6
	stx	%i0,	[%l7 + 0x08]
	addccc	%i1,	%g3,	%i3
	sdivx	%l1,	0x1EBA,	%g4
	movvc	%icc,	%i6,	%g1
	movrgez	%o2,	%o1,	%i5
	xnorcc	%l5,	0x1226,	%l4
	sdivx	%g6,	0x0B10,	%i4
	movneg	%icc,	%o6,	%l0
	array8	%l2,	%o5,	%g2
	movrgez	%i7,	%o4,	%i2
	subccc	%o3,	0x0D51,	%g5
	addc	%o7,	%g7,	%l3
	addc	%l6,	%i0,	%o0
	lduh	[%l7 + 0x0C],	%g3
	fmovrdlez	%i3,	%f30,	%f8
	udiv	%i1,	0x11D5,	%g4
	edge16	%i6,	%l1,	%o2
	fpack16	%f16,	%f22
	movgu	%icc,	%o1,	%g1
	fsrc2	%f10,	%f24
	movrgez	%l5,	0x20A,	%l4
	edge8	%i5,	%i4,	%g6
	smul	%l0,	%o6,	%l2
	edge8l	%o5,	%g2,	%i7
	movcs	%icc,	%i2,	%o3
	subcc	%g5,	%o4,	%o7
	mova	%icc,	%l3,	%l6
	mova	%icc,	%g7,	%o0
	fpackfix	%f12,	%f19
	sdiv	%i0,	0x0F10,	%g3
	fmovdpos	%icc,	%f15,	%f16
	umul	%i1,	0x0ED8,	%i3
	fcmpne32	%f8,	%f16,	%g4
	sethi	0x0B40,	%i6
	sra	%o2,	%o1,	%l1
	fmul8x16au	%f20,	%f0,	%f6
	fnot1s	%f18,	%f14
	addc	%l5,	%g1,	%l4
	fmovdg	%icc,	%f16,	%f8
	edge16ln	%i5,	%i4,	%l0
	edge16ln	%g6,	%l2,	%o5
	movcs	%xcc,	%o6,	%i7
	and	%i2,	0x0A1E,	%g2
	ldsw	[%l7 + 0x10],	%g5
	srlx	%o3,	0x0D,	%o7
	andncc	%o4,	%l3,	%g7
	srl	%l6,	0x0D,	%o0
	fands	%f29,	%f29,	%f17
	ldd	[%l7 + 0x50],	%g2
	mova	%icc,	%i0,	%i1
	fxors	%f6,	%f13,	%f6
	smul	%g4,	0x0DB5,	%i6
	stb	%o2,	[%l7 + 0x71]
	fsrc2	%f22,	%f28
	edge32ln	%i3,	%o1,	%l5
	subc	%l1,	%l4,	%g1
	add	%i4,	%i5,	%l0
	std	%f30,	[%l7 + 0x18]
	edge8ln	%l2,	%o5,	%o6
	movge	%icc,	%i7,	%g6
	sub	%g2,	%g5,	%i2
	lduw	[%l7 + 0x7C],	%o7
	fmovdle	%icc,	%f31,	%f18
	movvc	%xcc,	%o3,	%l3
	sra	%g7,	0x16,	%l6
	move	%icc,	%o4,	%o0
	movleu	%icc,	%g3,	%i0
	edge16ln	%g4,	%i1,	%o2
	fnot1s	%f14,	%f1
	movn	%icc,	%i3,	%o1
	fcmple32	%f24,	%f12,	%l5
	orn	%l1,	0x0B3D,	%l4
	ldsb	[%l7 + 0x67],	%i6
	movleu	%icc,	%g1,	%i4
	udivcc	%i5,	0x0A72,	%l0
	fnot2	%f6,	%f10
	fmovsge	%icc,	%f18,	%f7
	addc	%l2,	%o5,	%i7
	subcc	%o6,	0x0A30,	%g6
	sth	%g2,	[%l7 + 0x78]
	popc	%g5,	%i2
	fmul8sux16	%f20,	%f22,	%f10
	pdist	%f4,	%f4,	%f28
	xor	%o3,	0x1A99,	%l3
	movrgez	%o7,	%g7,	%l6
	fcmpeq32	%f26,	%f2,	%o4
	ldd	[%l7 + 0x38],	%g2
	sth	%o0,	[%l7 + 0x0E]
	movpos	%xcc,	%i0,	%i1
	sdivcc	%g4,	0x0949,	%o2
	ldx	[%l7 + 0x20],	%o1
	movne	%xcc,	%i3,	%l5
	sir	0x1D63
	sll	%l1,	0x04,	%l4
	sth	%i6,	[%l7 + 0x38]
	xnor	%i4,	%g1,	%l0
	ldub	[%l7 + 0x24],	%l2
	xnor	%o5,	0x1285,	%i5
	fmovrslz	%o6,	%f15,	%f2
	nop
	set	0x14, %g5
	ldsw	[%l7 + %g5],	%g6
	xnorcc	%i7,	0x1C67,	%g5
	fpack16	%f12,	%f8
	movrlz	%g2,	0x356,	%i2
	sll	%o3,	%l3,	%o7
	fmuld8ulx16	%f3,	%f30,	%f2
	movg	%icc,	%l6,	%g7
	fxor	%f8,	%f28,	%f10
	alignaddrl	%o4,	%g3,	%o0
	add	%i1,	0x1766,	%g4
	ldsh	[%l7 + 0x60],	%i0
	udiv	%o1,	0x06A5,	%o2
	movcs	%xcc,	%i3,	%l1
	fxnors	%f31,	%f28,	%f2
	mulx	%l5,	0x1EDB,	%l4
	edge16	%i4,	%i6,	%g1
	edge32l	%l0,	%o5,	%i5
	stx	%l2,	[%l7 + 0x60]
	sllx	%o6,	%i7,	%g5
	movne	%xcc,	%g6,	%g2
	movneg	%icc,	%i2,	%o3
	ld	[%l7 + 0x58],	%f8
	st	%f29,	[%l7 + 0x08]
	smulcc	%o7,	%l3,	%g7
	srax	%o4,	%l6,	%g3
	movpos	%xcc,	%o0,	%g4
	subc	%i1,	%o1,	%i0
	andncc	%i3,	%l1,	%o2
	edge32	%l5,	%i4,	%i6
	popc	0x0B43,	%l4
	movrgz	%l0,	%o5,	%g1
	alignaddr	%i5,	%l2,	%i7
	ldsw	[%l7 + 0x44],	%g5
	movl	%icc,	%g6,	%o6
	move	%icc,	%g2,	%o3
	movleu	%xcc,	%o7,	%i2
	movn	%icc,	%g7,	%o4
	nop
	set	0x10, %i1
	lduw	[%l7 + %i1],	%l6
	movl	%xcc,	%g3,	%o0
	edge16	%g4,	%i1,	%l3
	fsrc1s	%f8,	%f4
	addc	%i0,	0x1497,	%i3
	movle	%icc,	%o1,	%o2
	movneg	%icc,	%l5,	%i4
	edge16ln	%i6,	%l1,	%l4
	or	%o5,	%l0,	%i5
	xnorcc	%g1,	%l2,	%i7
	movrlez	%g5,	0x174,	%o6
	std	%f14,	[%l7 + 0x28]
	fandnot1s	%f9,	%f9,	%f26
	movcs	%xcc,	%g2,	%g6
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	movleu	%icc,	%o3,	%g7
	fmovspos	%xcc,	%f9,	%f21
	fandnot1	%f4,	%f26,	%f28
	fmovspos	%icc,	%f21,	%f28
	fmovscs	%xcc,	%f18,	%f3
	mulscc	%o4,	%l6,	%o0
	addc	%g3,	%i1,	%g4
	srl	%l3,	%i3,	%o1
	lduh	[%l7 + 0x76],	%o2
	fmovsle	%icc,	%f19,	%f10
	fones	%f5
	movrne	%l5,	%i4,	%i6
	addcc	%i0,	0x0E13,	%l4
	fcmple16	%f10,	%f26,	%l1
	movcc	%xcc,	%o5,	%l0
	ldub	[%l7 + 0x4B],	%i5
	siam	0x2
	fmovsvc	%icc,	%f22,	%f6
	fmovscc	%icc,	%f7,	%f23
	popc	0x00B5,	%l2
	fnot2	%f18,	%f30
	edge16	%g1,	%i7,	%g5
	movre	%o6,	%g2,	%g6
	fnors	%f10,	%f17,	%f24
	fnot2	%f26,	%f24
	fnot1s	%f0,	%f12
	fpack32	%f10,	%f26,	%f10
	movg	%icc,	%i2,	%o3
	fzero	%f20
	sub	%g7,	%o4,	%o7
	fabsd	%f4,	%f18
	fmovrde	%l6,	%f24,	%f14
	fsrc2	%f24,	%f20
	sdivx	%o0,	0x18F6,	%i1
	move	%icc,	%g4,	%g3
	add	%i3,	%o1,	%o2
	fmovrdgez	%l5,	%f26,	%f8
	udiv	%l3,	0x1612,	%i4
	fmovdne	%xcc,	%f31,	%f19
	edge32	%i0,	%i6,	%l4
	siam	0x7
	movrlz	%o5,	0x2F2,	%l0
	fmovrdgz	%i5,	%f10,	%f26
	movpos	%xcc,	%l1,	%g1
	movrgz	%i7,	%g5,	%l2
	fone	%f10
	addccc	%g2,	0x16F0,	%o6
	std	%f30,	[%l7 + 0x08]
	mulscc	%g6,	%i2,	%g7
	fmovse	%icc,	%f9,	%f30
	sub	%o3,	%o4,	%l6
	movle	%icc,	%o7,	%i1
	movne	%icc,	%g4,	%o0
	movgu	%xcc,	%i3,	%o1
	fcmpes	%fcc2,	%f28,	%f6
	sub	%g3,	%l5,	%l3
	sdivx	%i4,	0x0BD0,	%o2
	fmovrdgez	%i0,	%f20,	%f10
	fandnot2s	%f5,	%f23,	%f10
	addcc	%l4,	%i6,	%l0
	fnot1	%f24,	%f30
	smul	%o5,	0x1B13,	%l1
	array16	%i5,	%g1,	%i7
	add	%g5,	0x0571,	%l2
	fnegs	%f25,	%f28
	fmovdl	%xcc,	%f26,	%f22
	edge8l	%g2,	%o6,	%g6
	movre	%i2,	%o3,	%o4
	fmul8x16au	%f30,	%f2,	%f28
	movleu	%icc,	%g7,	%l6
	sra	%o7,	%i1,	%g4
	move	%icc,	%o0,	%i3
	smul	%g3,	%l5,	%o1
	ld	[%l7 + 0x44],	%f9
	movne	%xcc,	%l3,	%o2
	and	%i0,	0x0A8C,	%l4
	andn	%i4,	0x0367,	%l0
	umul	%o5,	0x08A7,	%i6
	ldd	[%l7 + 0x78],	%i4
	sdiv	%l1,	0x05E9,	%g1
	xnor	%g5,	%i7,	%l2
	movre	%o6,	%g6,	%g2
	lduw	[%l7 + 0x14],	%i2
	movne	%xcc,	%o3,	%o4
	alignaddr	%l6,	%g7,	%o7
	addcc	%g4,	0x0FCC,	%i1
	stw	%i3,	[%l7 + 0x14]
	fmovdcc	%icc,	%f22,	%f26
	udiv	%g3,	0x162C,	%o0
	ldsw	[%l7 + 0x68],	%o1
	sdivx	%l5,	0x1BD6,	%l3
	fnegs	%f14,	%f10
	sra	%i0,	0x02,	%l4
	sth	%i4,	[%l7 + 0x46]
	sdivx	%l0,	0x1EEB,	%o5
	edge16ln	%i6,	%o2,	%i5
	movge	%xcc,	%g1,	%g5
	xor	%l1,	%l2,	%o6
	edge16	%i7,	%g6,	%g2
	save %i2, 0x06FB, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o3,	%l6,	%g7
	fmul8sux16	%f10,	%f20,	%f8
	movcs	%xcc,	%o7,	%g4
	sth	%i3,	[%l7 + 0x08]
	movvs	%icc,	%i1,	%g3
	fmovse	%xcc,	%f1,	%f1
	movrne	%o0,	%o1,	%l5
	fmovrsgez	%l3,	%f20,	%f20
	orncc	%i0,	%i4,	%l0
	alignaddr	%o5,	%l4,	%o2
	fsrc1	%f6,	%f28
	movpos	%xcc,	%i6,	%i5
	ldsw	[%l7 + 0x1C],	%g5
	fmovse	%xcc,	%f28,	%f20
	array8	%g1,	%l1,	%o6
	orcc	%l2,	0x0735,	%g6
	orcc	%i7,	%i2,	%o4
	movneg	%icc,	%o3,	%g2
	movrgez	%l6,	0x158,	%g7
	fcmple16	%f14,	%f22,	%g4
	save %i3, %i1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f9,	%f25,	%f22
	sdiv	%o7,	0x1D8F,	%o1
	movvs	%xcc,	%o0,	%l5
	smulcc	%l3,	%i4,	%l0
	or	%i0,	%l4,	%o2
	addc	%o5,	%i6,	%i5
	movrne	%g5,	0x0BF,	%l1
	sethi	0x0DE8,	%o6
	fnot2	%f20,	%f16
	ld	[%l7 + 0x1C],	%f21
	movn	%icc,	%g1,	%l2
	add	%g6,	0x0152,	%i7
	ld	[%l7 + 0x0C],	%f6
	ldd	[%l7 + 0x38],	%i2
	fsrc1	%f8,	%f20
	edge32ln	%o3,	%o4,	%g2
	umulcc	%g7,	%g4,	%l6
	for	%f2,	%f4,	%f2
	andn	%i3,	0x03CD,	%i1
	edge8ln	%g3,	%o7,	%o1
	and	%l5,	0x0528,	%l3
	sra	%i4,	%o0,	%i0
	array16	%l0,	%l4,	%o5
	fabss	%f31,	%f4
	ldsw	[%l7 + 0x64],	%i6
	fmovda	%xcc,	%f25,	%f24
	sdiv	%i5,	0x01D1,	%g5
	addc	%o2,	%l1,	%o6
	xnorcc	%g1,	0x04AC,	%l2
	srax	%g6,	%i2,	%o3
	array8	%i7,	%g2,	%o4
	ldd	[%l7 + 0x18],	%g4
	subccc	%g7,	%l6,	%i3
	movrgez	%g3,	%o7,	%o1
	fmuld8ulx16	%f2,	%f3,	%f10
	udivx	%l5,	0x15B6,	%l3
	fmovda	%icc,	%f8,	%f29
	ldub	[%l7 + 0x35],	%i1
	xorcc	%i4,	0x007C,	%o0
	subccc	%l0,	0x1972,	%l4
	ldsw	[%l7 + 0x24],	%o5
	fcmple32	%f10,	%f12,	%i0
	edge16n	%i6,	%i5,	%o2
	movge	%xcc,	%g5,	%o6
	array8	%g1,	%l2,	%l1
	smulcc	%i2,	%g6,	%o3
	popc	%g2,	%o4
	movg	%xcc,	%i7,	%g7
	ldd	[%l7 + 0x20],	%f26
	xnorcc	%l6,	%g4,	%i3
	movneg	%xcc,	%g3,	%o7
	restore %l5, 0x196B, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i1,	%l3
	edge16ln	%o0,	%l0,	%l4
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	sir	0x1CD5
	edge8ln	%o5,	%i6,	%i5
	srlx	%o2,	0x06,	%g5
	andcc	%o6,	0x1C74,	%g1
	alignaddr	%l2,	%i2,	%l1
	orcc	%g6,	0x1F3B,	%o3
	fnand	%f24,	%f10,	%f4
	movcs	%xcc,	%o4,	%g2
	srl	%i7,	0x1B,	%l6
	andcc	%g4,	0x1BC3,	%i3
	fpack16	%f26,	%f11
	udivx	%g7,	0x1CD5,	%g3
	edge32	%l5,	%o1,	%i1
	stb	%o7,	[%l7 + 0x5A]
	mova	%icc,	%o0,	%l0
	orn	%l4,	%i4,	%l3
	fzeros	%f12
	movg	%icc,	%i0,	%i6
	xnor	%i5,	0x0C76,	%o2
	fmovsleu	%icc,	%f21,	%f23
	movvs	%icc,	%g5,	%o5
	fmovrdne	%g1,	%f30,	%f28
	udivcc	%l2,	0x0A4C,	%i2
	st	%f20,	[%l7 + 0x74]
	subcc	%o6,	%l1,	%g6
	sir	0x021F
	array8	%o3,	%o4,	%i7
	edge16	%g2,	%l6,	%i3
	movcc	%xcc,	%g7,	%g4
	sllx	%g3,	%l5,	%o1
	fmul8x16	%f29,	%f18,	%f28
	udivx	%i1,	0x1E34,	%o0
	std	%f18,	[%l7 + 0x70]
	array16	%l0,	%o7,	%l4
	edge16l	%i4,	%l3,	%i6
	movrlez	%i5,	%i0,	%o2
	fpadd32s	%f6,	%f28,	%f30
	fandnot2	%f2,	%f24,	%f6
	movrlz	%o5,	0x1C8,	%g5
	orn	%l2,	%g1,	%i2
	fmul8x16	%f4,	%f16,	%f16
	fzero	%f4
	restore %o6, 0x02EA, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g6,	%o3,	%o4
	orn	%i7,	%g2,	%l6
	st	%f19,	[%l7 + 0x34]
	movrlz	%g7,	0x0D3,	%g4
	edge16	%i3,	%g3,	%o1
	stw	%l5,	[%l7 + 0x5C]
	subcc	%o0,	0x17A7,	%i1
	fmovrse	%l0,	%f19,	%f5
	andcc	%o7,	%l4,	%l3
	and	%i4,	0x1DF7,	%i6
	fmovdpos	%icc,	%f14,	%f11
	srlx	%i0,	%i5,	%o5
	subc	%o2,	0x0B40,	%g5
	edge16	%l2,	%i2,	%o6
	ldx	[%l7 + 0x28],	%g1
	movcc	%icc,	%l1,	%g6
	addc	%o3,	0x1186,	%i7
	fmovsle	%xcc,	%f11,	%f1
	xnorcc	%o4,	0x14C7,	%l6
	fornot1	%f4,	%f10,	%f24
	edge8ln	%g2,	%g7,	%g4
	array8	%i3,	%g3,	%o1
	array8	%l5,	%i1,	%l0
	fnand	%f20,	%f0,	%f2
	fabss	%f20,	%f18
	stx	%o0,	[%l7 + 0x68]
	fcmpd	%fcc1,	%f24,	%f8
	or	%l4,	%l3,	%i4
	movrgez	%i6,	%o7,	%i5
	orcc	%i0,	%o2,	%o5
	sll	%l2,	%g5,	%o6
	ldsb	[%l7 + 0x19],	%g1
	fmovrse	%i2,	%f19,	%f5
	movcc	%xcc,	%l1,	%g6
	movge	%icc,	%o3,	%i7
	subcc	%o4,	0x0893,	%l6
	movrgez	%g7,	0x03A,	%g2
	movrlz	%i3,	%g4,	%g3
	ld	[%l7 + 0x34],	%f6
	fpadd16	%f18,	%f12,	%f2
	sth	%l5,	[%l7 + 0x3E]
	addccc	%o1,	0x1430,	%l0
	fors	%f29,	%f18,	%f25
	movvs	%icc,	%o0,	%l4
	ldsb	[%l7 + 0x09],	%i1
	fcmple16	%f0,	%f18,	%l3
	srlx	%i6,	0x11,	%o7
	mulx	%i4,	%i5,	%i0
	movrgez	%o2,	0x3F6,	%l2
	sir	0x009C
	mulx	%g5,	%o6,	%o5
	edge8l	%g1,	%i2,	%g6
	fmul8x16au	%f8,	%f31,	%f28
	xorcc	%o3,	0x14CA,	%i7
	movne	%icc,	%o4,	%l1
	sth	%l6,	[%l7 + 0x2C]
	edge8	%g7,	%g2,	%i3
	xorcc	%g4,	%l5,	%o1
	movre	%g3,	%o0,	%l4
	movleu	%icc,	%i1,	%l0
	fandnot1	%f2,	%f24,	%f18
	edge8n	%l3,	%i6,	%o7
	array8	%i4,	%i0,	%o2
	movrgz	%l2,	0x182,	%i5
	ldd	[%l7 + 0x30],	%g4
	or	%o5,	%g1,	%o6
	edge8n	%g6,	%i2,	%i7
	fmovdgu	%xcc,	%f15,	%f23
	mulx	%o3,	%l1,	%o4
	movgu	%icc,	%g7,	%l6
	edge16n	%g2,	%g4,	%l5
	edge16	%o1,	%i3,	%o0
	edge8l	%g3,	%l4,	%l0
	ldsh	[%l7 + 0x76],	%l3
	fnegd	%f22,	%f30
	edge16ln	%i1,	%i6,	%i4
	ldd	[%l7 + 0x38],	%o6
	lduw	[%l7 + 0x2C],	%o2
	subc	%i0,	0x145F,	%i5
	movgu	%xcc,	%g5,	%o5
	stb	%l2,	[%l7 + 0x16]
	fmovscs	%xcc,	%f27,	%f14
	movcs	%icc,	%g1,	%g6
	movneg	%xcc,	%o6,	%i2
	fornot1s	%f17,	%f27,	%f4
	fxnors	%f24,	%f6,	%f28
	movneg	%xcc,	%i7,	%l1
	array16	%o4,	%g7,	%o3
	fzero	%f18
	fcmpeq16	%f30,	%f12,	%g2
	mova	%icc,	%l6,	%g4
	sra	%o1,	%i3,	%o0
	edge16	%g3,	%l4,	%l5
	fandnot2	%f4,	%f2,	%f12
	fmovsle	%xcc,	%f7,	%f22
	xorcc	%l3,	%i1,	%l0
	edge8n	%i6,	%o7,	%o2
	movle	%icc,	%i0,	%i5
	fcmpes	%fcc0,	%f6,	%f1
	srax	%g5,	%i4,	%o5
	movvc	%xcc,	%g1,	%l2
	st	%f30,	[%l7 + 0x44]
	fmuld8ulx16	%f29,	%f2,	%f22
	or	%o6,	0x1266,	%i2
	st	%f2,	[%l7 + 0x6C]
	movne	%icc,	%i7,	%l1
	movle	%icc,	%o4,	%g7
	movge	%xcc,	%g6,	%g2
	sub	%l6,	0x159A,	%g4
	fxors	%f30,	%f16,	%f30
	andcc	%o1,	0x1F5F,	%o3
	fmovsgu	%icc,	%f2,	%f10
	addcc	%i3,	%o0,	%g3
	smul	%l4,	0x031D,	%l3
	save %i1, %l0, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o7,	0x14E7,	%o2
	udivcc	%i0,	0x1837,	%l5
	fmovsvs	%icc,	%f26,	%f0
	movvc	%xcc,	%i5,	%i4
	fmovsvc	%xcc,	%f3,	%f20
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	edge16l	%l2,	%o6,	%i2
	subc	%l1,	%o4,	%i7
	mulscc	%g6,	%g7,	%l6
	fsrc1	%f14,	%f10
	fcmpne32	%f12,	%f16,	%g4
	nop
	set	0x40, %i5
	lduw	[%l7 + %i5],	%o1
	subccc	%o3,	0x1612,	%i3
	movrgz	%o0,	%g2,	%l4
	fexpand	%f8,	%f14
	sra	%g3,	%l3,	%l0
	fxnor	%f6,	%f4,	%f20
	edge32	%i1,	%i6,	%o2
	popc	0x0C56,	%o7
	andncc	%i0,	%i5,	%i4
	movle	%icc,	%g5,	%l5
	smul	%o5,	%g1,	%l2
	stb	%i2,	[%l7 + 0x26]
	fnors	%f12,	%f20,	%f15
	addccc	%l1,	%o4,	%o6
	movrlz	%g6,	%g7,	%i7
	srlx	%g4,	0x1B,	%l6
	fmuld8sux16	%f25,	%f28,	%f6
	ldub	[%l7 + 0x0D],	%o3
	subccc	%i3,	0x1933,	%o1
	edge8n	%o0,	%l4,	%g2
	ldub	[%l7 + 0x16],	%l3
	fabsd	%f22,	%f2
	edge32ln	%l0,	%g3,	%i6
	fornot1	%f2,	%f28,	%f10
	movrlz	%i1,	%o2,	%i0
	sdivcc	%i5,	0x1E56,	%i4
	sethi	0x09D2,	%o7
	srax	%l5,	%g5,	%o5
	edge16	%l2,	%g1,	%i2
	movcs	%xcc,	%l1,	%o6
	subcc	%o4,	0x0A9A,	%g7
	fmovse	%icc,	%f5,	%f18
	fmovdcc	%xcc,	%f13,	%f5
	fmovscs	%icc,	%f0,	%f12
	movpos	%xcc,	%g6,	%i7
	move	%xcc,	%l6,	%g4
	edge8	%o3,	%i3,	%o0
	fcmpeq16	%f20,	%f4,	%o1
	and	%l4,	0x0E74,	%g2
	andn	%l0,	%g3,	%i6
	movcs	%icc,	%l3,	%o2
	or	%i1,	0x0393,	%i0
	movneg	%xcc,	%i5,	%i4
	fmovsvs	%icc,	%f21,	%f15
	alignaddr	%l5,	%g5,	%o7
	edge32ln	%o5,	%l2,	%i2
	fmul8x16	%f7,	%f16,	%f14
	movrne	%g1,	%l1,	%o4
	fpadd16	%f0,	%f8,	%f2
	xnorcc	%g7,	0x1AE8,	%g6
	move	%icc,	%i7,	%l6
	orncc	%g4,	0x1CC1,	%o3
	fmovsge	%icc,	%f16,	%f16
	umulcc	%o6,	0x01D6,	%o0
	addc	%o1,	0x1331,	%i3
	sllx	%g2,	0x05,	%l0
	xorcc	%g3,	%i6,	%l4
	fnegd	%f6,	%f10
	fmovsge	%xcc,	%f11,	%f28
	add	%l3,	%o2,	%i0
	fpadd16	%f4,	%f12,	%f2
	udivcc	%i5,	0x13DA,	%i4
	edge32n	%i1,	%g5,	%o7
	mulscc	%o5,	%l5,	%l2
	fcmpeq16	%f28,	%f2,	%g1
	subcc	%l1,	0x0927,	%i2
	movge	%xcc,	%g7,	%o4
	fpadd16	%f14,	%f26,	%f26
	mova	%icc,	%g6,	%i7
	fzeros	%f11
	popc	0x1B51,	%g4
	sdivx	%l6,	0x16AB,	%o3
	sethi	0x0965,	%o0
	mova	%xcc,	%o6,	%o1
	and	%i3,	%g2,	%g3
	subcc	%l0,	%i6,	%l3
	stx	%l4,	[%l7 + 0x68]
	edge16ln	%i0,	%o2,	%i5
	fmovrdlez	%i4,	%f4,	%f4
	movrlz	%g5,	0x1B0,	%i1
	stw	%o5,	[%l7 + 0x24]
	movgu	%xcc,	%l5,	%o7
	fmovrsgez	%g1,	%f7,	%f17
	sdivcc	%l2,	0x0A85,	%i2
	fnot1	%f18,	%f16
	smulcc	%l1,	0x0E8C,	%g7
	sdivx	%o4,	0x0D59,	%i7
	array32	%g6,	%g4,	%o3
	xor	%o0,	0x09C4,	%l6
	orn	%o1,	%o6,	%i3
	fnot1	%f20,	%f10
	array8	%g3,	%g2,	%i6
	udivcc	%l3,	0x08E3,	%l0
	edge32l	%i0,	%l4,	%o2
	lduh	[%l7 + 0x40],	%i5
	sll	%i4,	%i1,	%g5
	array32	%o5,	%o7,	%l5
	movn	%icc,	%l2,	%g1
	fmovsn	%icc,	%f4,	%f10
	array8	%l1,	%g7,	%i2
	subccc	%i7,	%o4,	%g4
	edge32	%g6,	%o3,	%o0
	sdiv	%o1,	0x164C,	%l6
	subc	%o6,	%g3,	%i3
	movrne	%g2,	%i6,	%l0
	ldub	[%l7 + 0x3D],	%l3
	edge16ln	%i0,	%o2,	%i5
	edge32n	%l4,	%i4,	%g5
	fcmped	%fcc3,	%f24,	%f8
	orcc	%o5,	%i1,	%o7
	stw	%l2,	[%l7 + 0x60]
	fcmpne32	%f24,	%f6,	%g1
	sth	%l1,	[%l7 + 0x0E]
	smulcc	%l5,	0x1151,	%g7
	edge16ln	%i2,	%o4,	%g4
	sir	0x0FBA
	edge32	%i7,	%o3,	%o0
	ldd	[%l7 + 0x68],	%f4
	sub	%o1,	0x164D,	%g6
	fmul8ulx16	%f26,	%f14,	%f6
	mulscc	%o6,	0x05B6,	%l6
	sir	0x0E3C
	xnorcc	%i3,	0x067A,	%g3
	movn	%icc,	%i6,	%g2
	srax	%l3,	0x06,	%i0
	edge8l	%o2,	%i5,	%l0
	edge32	%l4,	%g5,	%i4
	fmovsn	%icc,	%f13,	%f6
	fmovsle	%icc,	%f11,	%f0
	pdist	%f22,	%f14,	%f30
	movrne	%o5,	%o7,	%l2
	udiv	%i1,	0x08B2,	%l1
	xorcc	%g1,	%l5,	%g7
	ldd	[%l7 + 0x68],	%i2
	ldsh	[%l7 + 0x42],	%o4
	ldub	[%l7 + 0x2D],	%i7
	fxors	%f11,	%f12,	%f25
	st	%f10,	[%l7 + 0x78]
	fmovrdne	%g4,	%f28,	%f28
	sethi	0x03F4,	%o0
	edge8	%o1,	%g6,	%o3
	ldd	[%l7 + 0x60],	%i6
	fmovsneg	%icc,	%f14,	%f30
	movcc	%icc,	%i3,	%g3
	umulcc	%o6,	%i6,	%l3
	movn	%icc,	%i0,	%o2
	subc	%g2,	%i5,	%l0
	orcc	%l4,	%i4,	%g5
	movrgz	%o5,	0x213,	%o7
	fpsub32	%f14,	%f20,	%f30
	edge32	%i1,	%l2,	%g1
	faligndata	%f6,	%f10,	%f22
	edge32n	%l5,	%l1,	%g7
	fmovrsgez	%o4,	%f0,	%f27
	sdivx	%i7,	0x1380,	%i2
	edge32n	%g4,	%o0,	%o1
	udivcc	%o3,	0x1B69,	%l6
	xor	%i3,	%g3,	%o6
	fmovda	%xcc,	%f8,	%f6
	fmovdleu	%xcc,	%f4,	%f2
	fmovspos	%xcc,	%f15,	%f5
	std	%f12,	[%l7 + 0x40]
	umulcc	%i6,	%g6,	%l3
	addc	%o2,	0x14FA,	%i0
	sethi	0x018F,	%g2
	sdivcc	%l0,	0x08DE,	%l4
	mova	%xcc,	%i5,	%i4
	or	%g5,	%o5,	%i1
	umul	%l2,	0x092B,	%o7
	lduw	[%l7 + 0x6C],	%g1
	movrne	%l1,	0x234,	%g7
	ldsw	[%l7 + 0x20],	%o4
	orcc	%l5,	0x0CB0,	%i7
	st	%f13,	[%l7 + 0x28]
	subcc	%g4,	%o0,	%o1
	sth	%i2,	[%l7 + 0x56]
	subcc	%o3,	0x0E6D,	%i3
	mulx	%g3,	%l6,	%i6
	movrgz	%o6,	0x278,	%g6
	ldx	[%l7 + 0x50],	%o2
	smulcc	%i0,	%l3,	%l0
	fmovspos	%icc,	%f27,	%f24
	fcmpne16	%f2,	%f8,	%l4
	fnot1	%f28,	%f12
	fpsub16	%f4,	%f20,	%f30
	sdivx	%i5,	0x1E42,	%g2
	movrlz	%g5,	0x1B6,	%o5
	fmovsle	%icc,	%f4,	%f24
	siam	0x7
	fnand	%f14,	%f24,	%f10
	fmovrsgez	%i4,	%f10,	%f15
	smul	%l2,	%o7,	%g1
	xor	%l1,	0x056D,	%i1
	xorcc	%g7,	0x07BB,	%o4
	edge32n	%l5,	%g4,	%o0
	movrlez	%o1,	%i7,	%o3
	alignaddrl	%i2,	%i3,	%g3
	andn	%l6,	%o6,	%g6
	udiv	%i6,	0x190B,	%o2
	orn	%l3,	%i0,	%l0
	fpsub16s	%f31,	%f29,	%f13
	fmovrsne	%i5,	%f30,	%f31
	fmovsne	%icc,	%f25,	%f6
	fcmple32	%f16,	%f4,	%l4
	xnor	%g2,	%o5,	%i4
	udivx	%l2,	0x1D93,	%g5
	array32	%g1,	%o7,	%l1
	movpos	%xcc,	%i1,	%g7
	lduh	[%l7 + 0x28],	%l5
	subcc	%g4,	%o4,	%o0
	smul	%i7,	%o3,	%i2
	nop
	set	0x4C, %o3
	lduw	[%l7 + %o3],	%o1
	udiv	%i3,	0x0794,	%g3
	lduw	[%l7 + 0x40],	%l6
	srlx	%g6,	%o6,	%i6
	movcc	%xcc,	%l3,	%i0
	fornot2	%f0,	%f28,	%f6
	srax	%o2,	%i5,	%l4
	fmovdle	%icc,	%f22,	%f17
	sdiv	%g2,	0x0F0F,	%l0
	ld	[%l7 + 0x34],	%f8
	fones	%f18
	addc	%o5,	0x07AD,	%l2
	sll	%i4,	%g1,	%g5
	ldub	[%l7 + 0x51],	%l1
	nop
	set	0x15, %i3
	stb	%o7,	[%l7 + %i3]
	edge16	%g7,	%l5,	%g4
	movrlz	%i1,	0x0BE,	%o4
	alignaddr	%i7,	%o3,	%i2
	movvc	%icc,	%o1,	%o0
	fands	%f5,	%f17,	%f3
	edge8n	%g3,	%i3,	%g6
	ldub	[%l7 + 0x5A],	%l6
	edge16	%i6,	%l3,	%i0
	stb	%o6,	[%l7 + 0x79]
	movge	%xcc,	%i5,	%o2
	xnor	%l4,	0x029B,	%g2
	ldx	[%l7 + 0x68],	%l0
	ldx	[%l7 + 0x58],	%o5
	fsrc1s	%f25,	%f0
	ldsh	[%l7 + 0x1E],	%i4
	sdiv	%g1,	0x1728,	%l2
	edge8ln	%g5,	%o7,	%g7
	xnor	%l1,	%g4,	%i1
	fmovrdlz	%o4,	%f10,	%f20
	umul	%l5,	0x1F55,	%i7
	popc	0x1556,	%i2
	edge16n	%o3,	%o0,	%o1
	fmovdcc	%icc,	%f10,	%f19
	ld	[%l7 + 0x10],	%f17
	edge8	%g3,	%g6,	%i3
	sth	%l6,	[%l7 + 0x32]
	ldub	[%l7 + 0x35],	%i6
	restore %l3, %i0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o6,	%o2,	%l4
	fpsub16s	%f5,	%f18,	%f31
	edge8n	%g2,	%o5,	%l0
	movgu	%xcc,	%i4,	%l2
	edge8l	%g5,	%o7,	%g1
	fmovs	%f18,	%f25
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	edge32n	%g4,	%i1,	%l5
	fmul8x16	%f11,	%f24,	%f20
	orcc	%i7,	%i2,	%o3
	stw	%o0,	[%l7 + 0x74]
	srlx	%o4,	0x0A,	%g3
	movvs	%xcc,	%o1,	%i3
	edge8n	%l6,	%i6,	%l3
	sth	%g6,	[%l7 + 0x62]
	edge8l	%i5,	%o6,	%i0
	fmul8x16	%f31,	%f6,	%f12
	edge8	%o2,	%g2,	%l4
	ldsh	[%l7 + 0x50],	%l0
	fmovdleu	%xcc,	%f20,	%f6
	fmul8x16al	%f4,	%f20,	%f16
	and	%i4,	%l2,	%o5
	ldd	[%l7 + 0x60],	%f24
	movrne	%o7,	%g1,	%g7
	save %g5, %g4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i1,	[%l7 + 0x74]
	edge32n	%i7,	%i2,	%o3
	ldsh	[%l7 + 0x2E],	%l5
	edge8	%o0,	%o4,	%g3
	ld	[%l7 + 0x34],	%f29
	mulx	%o1,	%i3,	%i6
	sir	0x021F
	srax	%l3,	%g6,	%l6
	st	%f24,	[%l7 + 0x5C]
	edge8ln	%i5,	%i0,	%o6
	sll	%g2,	%o2,	%l0
	umul	%l4,	0x0949,	%i4
	edge16	%l2,	%o5,	%o7
	xorcc	%g1,	0x0016,	%g7
	andcc	%g4,	%g5,	%i1
	restore %i7, %l1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i2,	0x3EC,	%o0
	movcs	%icc,	%o4,	%l5
	movle	%icc,	%g3,	%o1
	ldx	[%l7 + 0x48],	%i3
	fmovdl	%xcc,	%f13,	%f8
	ld	[%l7 + 0x78],	%f0
	srl	%i6,	%l3,	%g6
	sra	%i5,	%l6,	%o6
	movne	%icc,	%i0,	%g2
	movl	%icc,	%o2,	%l4
	fcmped	%fcc2,	%f22,	%f12
	pdist	%f10,	%f20,	%f6
	fcmpgt16	%f26,	%f20,	%i4
	ldsh	[%l7 + 0x46],	%l0
	orncc	%l2,	0x148B,	%o7
	fpsub16	%f28,	%f16,	%f2
	sth	%o5,	[%l7 + 0x32]
	edge32	%g1,	%g4,	%g5
	srlx	%i1,	0x0A,	%i7
	st	%f15,	[%l7 + 0x28]
	subc	%l1,	%o3,	%i2
	xor	%o0,	%o4,	%l5
	sth	%g7,	[%l7 + 0x72]
	udiv	%o1,	0x0017,	%i3
	ldx	[%l7 + 0x68],	%g3
	fmovrdgez	%i6,	%f16,	%f10
	andn	%g6,	%i5,	%l6
	fmovscs	%xcc,	%f17,	%f24
	ldsw	[%l7 + 0x70],	%o6
	move	%icc,	%l3,	%g2
	subccc	%o2,	%i0,	%i4
	andcc	%l4,	0x07D6,	%l0
	fmovd	%f20,	%f26
	movn	%xcc,	%o7,	%l2
	sir	0x05F4
	edge8ln	%g1,	%g4,	%o5
	sethi	0x07C4,	%g5
	smulcc	%i7,	0x1617,	%l1
	fsrc1	%f28,	%f24
	movrgez	%o3,	0x304,	%i1
	ldsb	[%l7 + 0x4E],	%i2
	fmul8ulx16	%f22,	%f12,	%f2
	ld	[%l7 + 0x2C],	%f11
	addccc	%o0,	%l5,	%o4
	fpsub32s	%f2,	%f13,	%f0
	move	%icc,	%o1,	%g7
	or	%i3,	0x1F4D,	%g3
	udiv	%i6,	0x0C46,	%g6
	move	%icc,	%i5,	%l6
	movcs	%icc,	%l3,	%g2
	ldsw	[%l7 + 0x48],	%o6
	fmovsgu	%xcc,	%f10,	%f14
	lduw	[%l7 + 0x1C],	%o2
	movneg	%icc,	%i4,	%l4
	bshuffle	%f24,	%f2,	%f18
	fcmpd	%fcc1,	%f0,	%f12
	fmovrdgz	%l0,	%f12,	%f6
	fmovspos	%icc,	%f21,	%f6
	fcmped	%fcc1,	%f6,	%f28
	movpos	%xcc,	%o7,	%i0
	add	%l2,	%g4,	%o5
	umulcc	%g5,	0x10DD,	%i7
	std	%f0,	[%l7 + 0x28]
	smulcc	%l1,	0x1369,	%o3
	fcmple32	%f8,	%f24,	%i1
	ldx	[%l7 + 0x68],	%g1
	srlx	%i2,	0x0E,	%l5
	edge8l	%o4,	%o0,	%g7
	edge8	%o1,	%g3,	%i3
	fpadd32s	%f10,	%f8,	%f17
	fpadd16s	%f27,	%f7,	%f9
	subcc	%i6,	%i5,	%l6
	fzeros	%f13
	movrlez	%g6,	0x297,	%g2
	lduh	[%l7 + 0x2E],	%l3
	movrgez	%o2,	0x260,	%o6
	ldx	[%l7 + 0x18],	%l4
	ldsb	[%l7 + 0x21],	%i4
	popc	%l0,	%i0
	lduw	[%l7 + 0x50],	%o7
	addcc	%g4,	%l2,	%g5
	movgu	%xcc,	%i7,	%l1
	ld	[%l7 + 0x7C],	%f17
	smulcc	%o5,	0x1819,	%i1
	smulcc	%g1,	%i2,	%l5
	fmovsvs	%icc,	%f27,	%f14
	andn	%o3,	%o0,	%g7
	ldsb	[%l7 + 0x25],	%o4
	fandnot2	%f30,	%f22,	%f28
	mulx	%g3,	0x04DA,	%i3
	and	%i6,	%o1,	%l6
	srlx	%i5,	%g2,	%g6
	or	%o2,	0x19E6,	%o6
	and	%l4,	%l3,	%l0
	stx	%i4,	[%l7 + 0x28]
	alignaddr	%i0,	%o7,	%g4
	sdiv	%g5,	0x152B,	%i7
	xor	%l1,	%l2,	%i1
	ldsb	[%l7 + 0x37],	%o5
	movrlz	%g1,	0x032,	%l5
	movleu	%icc,	%o3,	%i2
	edge8	%g7,	%o4,	%g3
	edge32ln	%i3,	%o0,	%o1
	ldsw	[%l7 + 0x2C],	%l6
	std	%f24,	[%l7 + 0x68]
	nop
	set	0x38, %g1
	lduh	[%l7 + %g1],	%i5
	alignaddrl	%g2,	%g6,	%o2
	srlx	%o6,	0x09,	%i6
	movrne	%l4,	0x077,	%l3
	movg	%icc,	%l0,	%i4
	sdiv	%i0,	0x1FBE,	%g4
	fcmple32	%f4,	%f0,	%g5
	subc	%o7,	%l1,	%l2
	sdivx	%i1,	0x0505,	%i7
	ldsb	[%l7 + 0x5C],	%g1
	xnorcc	%l5,	0x0252,	%o5
	ldsw	[%l7 + 0x34],	%o3
	xorcc	%i2,	%o4,	%g7
	alignaddr	%g3,	%o0,	%i3
	sdiv	%o1,	0x1766,	%i5
	mulscc	%g2,	%g6,	%o2
	edge16l	%l6,	%i6,	%o6
	srlx	%l4,	%l0,	%i4
	edge16	%l3,	%i0,	%g5
	move	%icc,	%o7,	%g4
	ldx	[%l7 + 0x18],	%l2
	edge8l	%i1,	%i7,	%l1
	fmovsn	%xcc,	%f13,	%f22
	movrgez	%l5,	0x0D1,	%o5
	sra	%o3,	%i2,	%g1
	fmovsle	%xcc,	%f0,	%f2
	move	%icc,	%g7,	%g3
	and	%o0,	%o4,	%i3
	fmovsa	%xcc,	%f26,	%f15
	array32	%i5,	%g2,	%g6
	fandnot2s	%f1,	%f13,	%f28
	fmovdpos	%icc,	%f14,	%f23
	srlx	%o1,	%l6,	%i6
	stb	%o6,	[%l7 + 0x7B]
	movge	%xcc,	%l4,	%o2
	srax	%l0,	0x12,	%i4
	fnot2s	%f0,	%f6
	ldub	[%l7 + 0x57],	%i0
	umulcc	%l3,	%g5,	%o7
	movneg	%xcc,	%g4,	%i1
	st	%f3,	[%l7 + 0x34]
	xnorcc	%l2,	0x1EDF,	%i7
	sdivcc	%l5,	0x1F75,	%o5
	xnor	%o3,	%l1,	%i2
	movvs	%icc,	%g1,	%g7
	fmul8ulx16	%f6,	%f22,	%f28
	edge32n	%g3,	%o4,	%i3
	ldsw	[%l7 + 0x48],	%i5
	ldsw	[%l7 + 0x08],	%g2
	stw	%g6,	[%l7 + 0x08]
	movneg	%icc,	%o1,	%o0
	array16	%i6,	%l6,	%l4
	movrgz	%o2,	0x008,	%l0
	movgu	%xcc,	%i4,	%i0
	mova	%icc,	%l3,	%o6
	st	%f24,	[%l7 + 0x28]
	srax	%o7,	%g5,	%i1
	srl	%g4,	%l2,	%i7
	movleu	%icc,	%l5,	%o5
	movcs	%icc,	%o3,	%i2
	fabss	%f25,	%f21
	or	%g1,	%l1,	%g3
	movge	%xcc,	%o4,	%i3
	fmovsne	%xcc,	%f12,	%f29
	smulcc	%i5,	0x15DC,	%g2
	subc	%g7,	0x0636,	%g6
	andncc	%o1,	%i6,	%l6
	movre	%o0,	0x1A2,	%l4
	edge16ln	%o2,	%i4,	%i0
	stw	%l0,	[%l7 + 0x7C]
	fxors	%f26,	%f17,	%f4
	movgu	%xcc,	%l3,	%o7
	smul	%o6,	%i1,	%g4
	edge32ln	%l2,	%i7,	%l5
	orcc	%o5,	%o3,	%g5
	or	%i2,	%l1,	%g1
	fcmpgt16	%f4,	%f22,	%g3
	array8	%i3,	%i5,	%o4
	fmovdcc	%icc,	%f29,	%f11
	and	%g7,	0x174A,	%g2
	fcmpgt32	%f22,	%f0,	%g6
	edge16	%o1,	%i6,	%l6
	fmul8x16au	%f26,	%f10,	%f22
	fmovsne	%xcc,	%f29,	%f11
	fornot2	%f20,	%f28,	%f2
	ldsb	[%l7 + 0x60],	%l4
	srl	%o0,	0x02,	%i4
	alignaddrl	%i0,	%o2,	%l0
	edge8n	%o7,	%o6,	%l3
	add	%g4,	0x03D1,	%i1
	movne	%xcc,	%l2,	%l5
	movvs	%xcc,	%i7,	%o5
	edge32n	%g5,	%o3,	%l1
	edge16	%i2,	%g3,	%i3
	movvs	%icc,	%g1,	%o4
	mova	%icc,	%i5,	%g2
	addc	%g6,	0x111A,	%g7
	fmovdge	%xcc,	%f20,	%f4
	srax	%o1,	%l6,	%i6
	movre	%o0,	0x35B,	%l4
	edge8n	%i4,	%i0,	%o2
	orn	%l0,	%o6,	%l3
	or	%o7,	%g4,	%l2
	sth	%l5,	[%l7 + 0x48]
	srl	%i7,	0x01,	%i1
	mulx	%o5,	0x1223,	%o3
	fcmpne32	%f30,	%f10,	%g5
	orn	%l1,	%i2,	%g3
	ldsb	[%l7 + 0x52],	%g1
	array8	%i3,	%i5,	%g2
	udivx	%g6,	0x1E7C,	%o4
	addc	%g7,	%l6,	%i6
	ldub	[%l7 + 0x60],	%o1
	movpos	%xcc,	%l4,	%i4
	ldsb	[%l7 + 0x69],	%i0
	fsrc2s	%f16,	%f30
	sll	%o0,	%l0,	%o6
	orcc	%o2,	%l3,	%o7
	ldsw	[%l7 + 0x34],	%l2
	fnand	%f6,	%f0,	%f20
	fcmple16	%f30,	%f6,	%l5
	movge	%icc,	%i7,	%g4
	udivx	%o5,	0x1B36,	%i1
	sll	%g5,	0x01,	%l1
	edge16	%i2,	%o3,	%g3
	ld	[%l7 + 0x70],	%f1
	fpadd16	%f16,	%f30,	%f4
	smul	%g1,	%i5,	%i3
	or	%g6,	0x161F,	%o4
	fnot1	%f18,	%f30
	addccc	%g2,	0x154C,	%l6
	mulx	%g7,	0x135E,	%i6
	sll	%o1,	%l4,	%i4
	stw	%o0,	[%l7 + 0x30]
	fmovdneg	%xcc,	%f16,	%f27
	fornot1	%f26,	%f18,	%f22
	sth	%l0,	[%l7 + 0x5E]
	fmovse	%icc,	%f27,	%f19
	fcmple32	%f10,	%f30,	%i0
	array8	%o6,	%l3,	%o7
	edge32n	%o2,	%l5,	%l2
	sub	%i7,	%o5,	%i1
	udivx	%g4,	0x1D62,	%l1
	fnand	%f20,	%f0,	%f18
	fandnot2	%f26,	%f30,	%f30
	stb	%g5,	[%l7 + 0x77]
	movvc	%icc,	%i2,	%o3
	add	%g3,	%i5,	%g1
	ld	[%l7 + 0x74],	%f4
	ldd	[%l7 + 0x30],	%f30
	fzeros	%f11
	array8	%g6,	%i3,	%g2
	alignaddr	%o4,	%g7,	%i6
	edge16n	%l6,	%o1,	%l4
	movge	%icc,	%o0,	%i4
	orcc	%l0,	%i0,	%o6
	xnorcc	%l3,	0x0371,	%o2
	edge16	%o7,	%l2,	%i7
	xor	%o5,	0x1D89,	%l5
	umulcc	%i1,	0x0268,	%g4
	sra	%g5,	0x14,	%l1
	movgu	%icc,	%o3,	%i2
	ldx	[%l7 + 0x68],	%g3
	edge32	%g1,	%i5,	%i3
	sdivcc	%g2,	0x1691,	%o4
	umulcc	%g6,	%i6,	%g7
	edge8ln	%o1,	%l4,	%l6
	movcc	%icc,	%o0,	%l0
	movl	%icc,	%i0,	%o6
	movneg	%xcc,	%l3,	%o2
	fmovdl	%icc,	%f27,	%f20
	subcc	%o7,	0x1C7A,	%l2
	movpos	%icc,	%i7,	%o5
	fpmerge	%f2,	%f11,	%f22
	movvs	%xcc,	%i4,	%i1
	orn	%g4,	%g5,	%l5
	andcc	%o3,	0x03E3,	%i2
	array8	%l1,	%g1,	%i5
	orn	%i3,	%g2,	%o4
	movn	%icc,	%g6,	%g3
	edge8n	%i6,	%o1,	%g7
	xnorcc	%l4,	0x1D4D,	%l6
	save %l0, %i0, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%xcc,	%f23,	%f10
	movvc	%icc,	%l3,	%o2
	addcc	%o0,	%l2,	%o7
	move	%xcc,	%o5,	%i4
	udivcc	%i1,	0x13E6,	%g4
	movrne	%g5,	0x2A1,	%l5
	fmul8sux16	%f12,	%f20,	%f26
	edge8	%o3,	%i2,	%l1
	lduw	[%l7 + 0x2C],	%i7
	mulscc	%g1,	0x06A8,	%i5
	fpack32	%f18,	%f0,	%f12
	sra	%g2,	0x1A,	%o4
	movcc	%icc,	%g6,	%i3
	stx	%i6,	[%l7 + 0x58]
	xor	%g3,	0x1CFD,	%g7
	nop
	set	0x48, %g3
	lduw	[%l7 + %g3],	%l4
	sll	%o1,	%l6,	%l0
	edge32l	%o6,	%l3,	%i0
	fmovdvc	%icc,	%f23,	%f17
	edge16	%o2,	%l2,	%o0
	addccc	%o5,	0x095D,	%i4
	stw	%o7,	[%l7 + 0x44]
	andncc	%g4,	%i1,	%l5
	fmovrdne	%o3,	%f20,	%f24
	addccc	%g5,	%i2,	%i7
	subc	%g1,	0x129E,	%l1
	subccc	%g2,	%i5,	%o4
	fmovdcs	%xcc,	%f7,	%f6
	andncc	%g6,	%i3,	%g3
	ldd	[%l7 + 0x38],	%f12
	sdiv	%g7,	0x1863,	%i6
	fmovd	%f22,	%f22
	movrgz	%o1,	0x163,	%l4
	sethi	0x15D8,	%l6
	fandnot2	%f18,	%f18,	%f6
	movn	%xcc,	%l0,	%o6
	fand	%f22,	%f24,	%f4
	mova	%icc,	%l3,	%o2
	and	%i0,	0x0E61,	%l2
	std	%f4,	[%l7 + 0x20]
	ldd	[%l7 + 0x60],	%o4
	fmovrse	%o0,	%f6,	%f13
	move	%icc,	%o7,	%i4
	fmovrdgez	%i1,	%f24,	%f24
	xorcc	%l5,	0x1546,	%o3
	xnorcc	%g5,	0x16F8,	%i2
	stw	%i7,	[%l7 + 0x6C]
	fnot1s	%f27,	%f7
	xnor	%g1,	%g4,	%l1
	ldub	[%l7 + 0x1C],	%i5
	edge16l	%o4,	%g2,	%i3
	lduh	[%l7 + 0x34],	%g6
	movgu	%xcc,	%g3,	%g7
	fxors	%f0,	%f3,	%f21
	fnor	%f0,	%f0,	%f8
	movg	%icc,	%o1,	%i6
	add	%l6,	0x072B,	%l0
	edge32l	%l4,	%o6,	%l3
	lduh	[%l7 + 0x7C],	%o2
	or	%l2,	%i0,	%o5
	sdivcc	%o0,	0x1972,	%o7
	fmovsle	%xcc,	%f27,	%f17
	movle	%xcc,	%i1,	%l5
	sra	%o3,	%i4,	%g5
	mova	%xcc,	%i2,	%g1
	andcc	%i7,	0x0554,	%g4
	std	%f22,	[%l7 + 0x68]
	fexpand	%f13,	%f2
	umulcc	%l1,	0x1FF8,	%i5
	ldd	[%l7 + 0x48],	%o4
	fcmpne32	%f12,	%f6,	%g2
	edge32l	%i3,	%g6,	%g3
	edge16	%o1,	%g7,	%i6
	ldd	[%l7 + 0x18],	%i6
	ldub	[%l7 + 0x37],	%l4
	and	%l0,	%l3,	%o2
	fmovdneg	%xcc,	%f18,	%f25
	xor	%o6,	0x0A99,	%i0
	movrlz	%o5,	%l2,	%o7
	fmovsne	%icc,	%f14,	%f15
	edge8l	%i1,	%l5,	%o3
	movneg	%xcc,	%o0,	%i4
	stw	%g5,	[%l7 + 0x44]
	alignaddrl	%i2,	%g1,	%i7
	smulcc	%g4,	0x1C82,	%l1
	array8	%i5,	%g2,	%o4
	sub	%g6,	0x119C,	%g3
	array8	%i3,	%o1,	%i6
	sdivx	%g7,	0x0824,	%l4
	sdivcc	%l0,	0x0ED3,	%l6
	edge32	%o2,	%o6,	%i0
	addcc	%o5,	%l2,	%l3
	movgu	%icc,	%i1,	%l5
	orncc	%o3,	%o0,	%o7
	srl	%g5,	0x10,	%i4
	fmul8x16	%f26,	%f22,	%f10
	fmovsne	%xcc,	%f11,	%f25
	alignaddrl	%i2,	%i7,	%g4
	fnot2s	%f15,	%f27
	edge8ln	%g1,	%l1,	%g2
	fmovdge	%xcc,	%f23,	%f25
	udiv	%i5,	0x09F1,	%g6
	alignaddrl	%g3,	%i3,	%o4
	array32	%i6,	%o1,	%g7
	sdivx	%l4,	0x1CDB,	%l6
	lduw	[%l7 + 0x6C],	%l0
	sth	%o6,	[%l7 + 0x48]
	edge32n	%i0,	%o2,	%o5
	st	%f3,	[%l7 + 0x68]
	fnot2	%f20,	%f0
	xorcc	%l2,	%i1,	%l5
	edge32ln	%l3,	%o0,	%o7
	fxnors	%f16,	%f12,	%f27
	ld	[%l7 + 0x0C],	%f6
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	mulscc	%i4,	0x0B38,	%i2
	fors	%f19,	%f13,	%f31
	fcmpd	%fcc3,	%f26,	%f4
	fpadd16	%f4,	%f12,	%f20
	sdiv	%g4,	0x0AA9,	%g1
	movre	%i7,	0x2BB,	%l1
	movre	%i5,	0x2AE,	%g6
	xnor	%g3,	0x1547,	%i3
	st	%f10,	[%l7 + 0x48]
	add	%g2,	%i6,	%o4
	movre	%g7,	%o1,	%l4
	orcc	%l0,	%l6,	%o6
	fmovdne	%icc,	%f6,	%f27
	move	%xcc,	%i0,	%o2
	orncc	%l2,	%o5,	%l5
	nop
	set	0x6C, %o6
	sth	%l3,	[%l7 + %o6]
	andncc	%i1,	%o0,	%o7
	ldsh	[%l7 + 0x16],	%g5
	orcc	%i4,	%o3,	%g4
	siam	0x3
	sethi	0x0397,	%g1
	ldsh	[%l7 + 0x50],	%i2
	movneg	%xcc,	%i7,	%i5
	edge16	%g6,	%l1,	%i3
	srax	%g3,	0x15,	%i6
	sra	%g2,	%g7,	%o4
	sir	0x1A03
	srax	%o1,	0x05,	%l0
	edge8	%l4,	%o6,	%l6
	fmovdle	%xcc,	%f24,	%f9
	addccc	%i0,	0x0F89,	%l2
	ldx	[%l7 + 0x38],	%o2
	movn	%icc,	%o5,	%l5
	andcc	%l3,	0x1D19,	%o0
	orcc	%o7,	%g5,	%i1
	lduh	[%l7 + 0x4C],	%i4
	udivx	%o3,	0x1B40,	%g1
	fpsub32	%f10,	%f26,	%f12
	edge32n	%g4,	%i2,	%i5
	addc	%g6,	0x0FB1,	%l1
	umul	%i7,	%i3,	%g3
	udivcc	%i6,	0x0167,	%g2
	ldub	[%l7 + 0x4D],	%o4
	stb	%o1,	[%l7 + 0x6A]
	fxnors	%f11,	%f1,	%f27
	addc	%l0,	%g7,	%o6
	fornot2s	%f22,	%f14,	%f17
	ld	[%l7 + 0x28],	%f15
	subcc	%l4,	%l6,	%l2
	edge8ln	%o2,	%o5,	%i0
	move	%icc,	%l5,	%l3
	movle	%xcc,	%o7,	%g5
	fmovsle	%xcc,	%f23,	%f22
	popc	0x181C,	%o0
	xnorcc	%i1,	0x16BA,	%o3
	edge32l	%i4,	%g4,	%i2
	ldsb	[%l7 + 0x27],	%i5
	lduw	[%l7 + 0x78],	%g1
	or	%g6,	0x0E42,	%l1
	movrgez	%i3,	%i7,	%i6
	fmovdpos	%xcc,	%f24,	%f2
	sra	%g2,	0x08,	%g3
	fmovrsne	%o1,	%f8,	%f18
	movn	%xcc,	%o4,	%g7
	std	%f2,	[%l7 + 0x70]
	edge16	%l0,	%l4,	%l6
	edge8	%o6,	%o2,	%l2
	array16	%i0,	%l5,	%l3
	movvc	%xcc,	%o7,	%g5
	movrgz	%o5,	0x11C,	%o0
	xor	%o3,	0x090C,	%i4
	fxnor	%f8,	%f12,	%f0
	movrlez	%i1,	0x292,	%g4
	addccc	%i2,	%g1,	%i5
	addcc	%l1,	%g6,	%i3
	fmovdleu	%xcc,	%f29,	%f24
	sra	%i7,	0x0D,	%g2
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%i6
	save %g3, %o4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x18],	%o1
	ldsw	[%l7 + 0x44],	%l0
	xorcc	%l4,	%o6,	%l6
	edge32l	%l2,	%i0,	%l5
	umul	%o2,	%o7,	%l3
	ldd	[%l7 + 0x38],	%g4
	sth	%o0,	[%l7 + 0x32]
	edge32n	%o3,	%i4,	%i1
	movcc	%xcc,	%o5,	%i2
	fpsub16	%f14,	%f28,	%f30
	mulx	%g1,	%i5,	%g4
	fmovse	%icc,	%f27,	%f26
	smulcc	%g6,	%i3,	%l1
	fmovscc	%xcc,	%f18,	%f7
	movrne	%g2,	0x3CA,	%i7
	or	%g3,	%i6,	%o4
	umul	%g7,	%o1,	%l0
	popc	0x1D1D,	%l4
	movvs	%icc,	%o6,	%l6
	subccc	%l2,	%l5,	%i0
	movg	%icc,	%o2,	%l3
	orcc	%o7,	%g5,	%o3
	movcs	%icc,	%i4,	%i1
	fpack32	%f12,	%f24,	%f8
	sdiv	%o5,	0x1314,	%o0
	fpsub32	%f12,	%f10,	%f28
	movvs	%xcc,	%i2,	%g1
	xnor	%i5,	0x092C,	%g6
	edge8n	%g4,	%i3,	%l1
	edge8ln	%g2,	%g3,	%i7
	ldsh	[%l7 + 0x76],	%i6
	fpack32	%f6,	%f4,	%f8
	fnor	%f16,	%f16,	%f18
	ldd	[%l7 + 0x40],	%o4
	array32	%g7,	%l0,	%l4
	smulcc	%o1,	0x0DA9,	%o6
	orn	%l6,	%l2,	%i0
	ldsw	[%l7 + 0x20],	%o2
	edge8ln	%l5,	%l3,	%g5
	xnor	%o3,	0x0AFC,	%o7
	lduw	[%l7 + 0x78],	%i4
	stx	%o5,	[%l7 + 0x10]
	nop
	set	0x4C, %l1
	ldsb	[%l7 + %l1],	%o0
	smulcc	%i1,	%i2,	%g1
	mulx	%g6,	0x014A,	%g4
	fone	%f24
	save %i5, %l1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x7A],	%g3
	stw	%i7,	[%l7 + 0x28]
	mova	%icc,	%i6,	%i3
	edge16l	%o4,	%l0,	%l4
	movre	%o1,	0x02B,	%g7
	and	%l6,	%l2,	%i0
	xnorcc	%o6,	0x1634,	%l5
	xnor	%o2,	%g5,	%l3
	stx	%o7,	[%l7 + 0x60]
	lduw	[%l7 + 0x4C],	%i4
	stb	%o5,	[%l7 + 0x6A]
	edge16ln	%o0,	%i1,	%o3
	lduh	[%l7 + 0x10],	%g1
	array8	%i2,	%g6,	%g4
	movle	%xcc,	%i5,	%g2
	fxnor	%f24,	%f22,	%f22
	fnors	%f18,	%f26,	%f11
	array32	%l1,	%g3,	%i6
	fmovse	%xcc,	%f22,	%f20
	subccc	%i7,	%o4,	%l0
	fmovdcc	%icc,	%f25,	%f0
	edge32ln	%l4,	%o1,	%i3
	srlx	%l6,	0x0B,	%l2
	fornot1	%f6,	%f26,	%f22
	fxnor	%f20,	%f6,	%f18
	array32	%g7,	%i0,	%o6
	fcmpes	%fcc3,	%f5,	%f20
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f4
	sdiv	%l5,	0x1688,	%g5
	ldsb	[%l7 + 0x1D],	%o2
	fmovdvc	%xcc,	%f29,	%f6
	orn	%o7,	0x1E96,	%i4
	edge8n	%l3,	%o5,	%i1
	restore %o0, 0x03DA, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f18,	%f10,	%f0
	movle	%icc,	%i2,	%g6
	xor	%g4,	%i5,	%g2
	array16	%o3,	%l1,	%g3
	array16	%i6,	%i7,	%l0
	mulscc	%l4,	%o1,	%i3
	fornot2s	%f16,	%f31,	%f8
	fnot2	%f10,	%f2
	lduw	[%l7 + 0x44],	%l6
	stw	%o4,	[%l7 + 0x70]
	fmovsneg	%icc,	%f18,	%f11
	edge16ln	%l2,	%g7,	%i0
	or	%l5,	%g5,	%o6
	alignaddrl	%o7,	%i4,	%o2
	xnor	%o5,	%l3,	%o0
	movvc	%icc,	%g1,	%i2
	movrlz	%i1,	0x0B9,	%g6
	lduw	[%l7 + 0x5C],	%i5
	movrlez	%g4,	%o3,	%g2
	stx	%l1,	[%l7 + 0x60]
	stw	%g3,	[%l7 + 0x30]
	array16	%i7,	%l0,	%l4
	stw	%o1,	[%l7 + 0x20]
	andn	%i6,	%i3,	%o4
	ldx	[%l7 + 0x38],	%l6
	fsrc2	%f12,	%f2
	xnor	%l2,	%g7,	%i0
	fmul8sux16	%f2,	%f2,	%f12
	movrgz	%g5,	0x106,	%o6
	edge8l	%l5,	%i4,	%o7
	subc	%o2,	%l3,	%o0
	movcs	%icc,	%o5,	%i2
	movrlz	%i1,	%g6,	%g1
	array16	%i5,	%g4,	%g2
	lduw	[%l7 + 0x58],	%o3
	sethi	0x06BD,	%g3
	st	%f19,	[%l7 + 0x74]
	sdiv	%i7,	0x0F04,	%l1
	mova	%xcc,	%l0,	%o1
	edge8ln	%l4,	%i3,	%i6
	ldub	[%l7 + 0x59],	%o4
	movre	%l2,	%g7,	%i0
	fsrc2s	%f28,	%f17
	array16	%l6,	%o6,	%l5
	sdivcc	%i4,	0x03D9,	%o7
	save %g5, 0x1914, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o0,	%l3,	%o5
	movg	%xcc,	%i1,	%g6
	fxor	%f28,	%f16,	%f20
	addc	%i2,	%i5,	%g1
	addcc	%g2,	0x1ADC,	%o3
	andncc	%g4,	%i7,	%l1
	alignaddr	%l0,	%o1,	%l4
	movge	%icc,	%g3,	%i3
	edge8	%o4,	%l2,	%g7
	subccc	%i0,	%i6,	%l6
	add	%o6,	0x1382,	%i4
	lduh	[%l7 + 0x4C],	%o7
	fmovrsgez	%g5,	%f13,	%f20
	movg	%icc,	%l5,	%o0
	fpadd32	%f22,	%f24,	%f4
	ldub	[%l7 + 0x20],	%l3
	save %o5, %o2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i2,	%i5,	%g6
	add	%g2,	0x1043,	%o3
	pdist	%f8,	%f8,	%f16
	edge8	%g4,	%g1,	%i7
	movvs	%icc,	%l0,	%o1
	movvs	%icc,	%l1,	%g3
	array16	%i3,	%o4,	%l2
	array32	%l4,	%g7,	%i0
	movge	%xcc,	%i6,	%o6
	srl	%l6,	0x0F,	%i4
	array16	%g5,	%o7,	%o0
	smulcc	%l5,	0x002A,	%o5
	srlx	%l3,	0x01,	%o2
	sll	%i2,	%i1,	%i5
	srl	%g6,	0x0D,	%g2
	srl	%o3,	%g1,	%i7
	stx	%g4,	[%l7 + 0x70]
	fmovsle	%icc,	%f21,	%f25
	edge16l	%l0,	%o1,	%l1
	nop
	set	0x47, %l5
	ldub	[%l7 + %l5],	%g3
	sub	%o4,	%l2,	%l4
	movgu	%xcc,	%i3,	%i0
	movl	%xcc,	%i6,	%o6
	or	%g7,	%l6,	%i4
	alignaddrl	%g5,	%o0,	%o7
	fnegd	%f2,	%f18
	srax	%l5,	%o5,	%l3
	addcc	%i2,	0x1A36,	%i1
	and	%i5,	0x1DA4,	%o2
	std	%f30,	[%l7 + 0x40]
	movvc	%icc,	%g6,	%g2
	fmovdcc	%icc,	%f9,	%f22
	subc	%o3,	0x0DEC,	%g1
	movgu	%icc,	%g4,	%l0
	smulcc	%o1,	0x139B,	%l1
	edge32ln	%g3,	%o4,	%l2
	orcc	%i7,	%l4,	%i3
	movle	%icc,	%i6,	%o6
	alignaddr	%g7,	%l6,	%i4
	ld	[%l7 + 0x24],	%f26
	fpadd32	%f24,	%f4,	%f22
	alignaddr	%g5,	%o0,	%i0
	fands	%f16,	%f3,	%f0
	fabss	%f11,	%f13
	popc	%o7,	%o5
	movneg	%icc,	%l3,	%l5
	and	%i2,	0x018B,	%i1
	sdivx	%i5,	0x1B7F,	%o2
	sub	%g2,	%o3,	%g6
	edge16l	%g4,	%l0,	%o1
	umul	%l1,	0x1D29,	%g1
	stw	%o4,	[%l7 + 0x2C]
	edge32ln	%g3,	%l2,	%l4
	stb	%i7,	[%l7 + 0x46]
	xorcc	%i6,	%o6,	%i3
	edge8ln	%l6,	%i4,	%g7
	edge32ln	%g5,	%i0,	%o7
	umul	%o0,	%o5,	%l3
	movge	%xcc,	%l5,	%i2
	addccc	%i5,	%i1,	%g2
	edge8n	%o3,	%g6,	%g4
	udiv	%l0,	0x1E13,	%o2
	edge8n	%l1,	%o1,	%g1
	movle	%icc,	%o4,	%g3
	sth	%l4,	[%l7 + 0x0C]
	movne	%xcc,	%i7,	%i6
	movne	%xcc,	%l2,	%i3
	movleu	%icc,	%l6,	%i4
	movg	%xcc,	%g7,	%o6
	fpsub32	%f24,	%f6,	%f28
	fmovrsne	%g5,	%f24,	%f17
	movrlez	%o7,	%o0,	%i0
	subcc	%o5,	0x17B3,	%l3
	fmovspos	%icc,	%f29,	%f12
	movvs	%xcc,	%l5,	%i5
	addcc	%i2,	0x1B72,	%g2
	sdivcc	%o3,	0x1251,	%g6
	edge32ln	%i1,	%g4,	%l0
	smul	%l1,	0x1E99,	%o1
	smulcc	%o2,	%g1,	%g3
	movrlz	%o4,	0x1E9,	%l4
	fmovrdgz	%i7,	%f4,	%f30
	edge16	%l2,	%i6,	%i3
	fmovrsne	%l6,	%f15,	%f18
	mulx	%g7,	0x0A0E,	%i4
	ldsb	[%l7 + 0x24],	%g5
	movcc	%xcc,	%o7,	%o0
	edge8l	%o6,	%o5,	%l3
	fmovrsne	%l5,	%f8,	%f14
	fmovsleu	%icc,	%f15,	%f9
	mova	%icc,	%i0,	%i2
	fmovdpos	%icc,	%f23,	%f17
	movne	%xcc,	%i5,	%o3
	fmovse	%icc,	%f7,	%f9
	ldd	[%l7 + 0x68],	%g2
	movrlez	%g6,	%i1,	%g4
	udivx	%l1,	0x11F2,	%l0
	mova	%icc,	%o2,	%o1
	movcs	%icc,	%g1,	%o4
	bshuffle	%f10,	%f22,	%f6
	fexpand	%f9,	%f6
	movneg	%icc,	%l4,	%i7
	subc	%l2,	%i6,	%g3
	array8	%l6,	%i3,	%i4
	fornot1s	%f4,	%f9,	%f8
	save %g7, 0x19FE, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o0,	%o7,	%o5
	movrlez	%l3,	0x3F1,	%l5
	umul	%o6,	%i0,	%i5
	stb	%i2,	[%l7 + 0x49]
	sub	%o3,	0x0289,	%g2
	mulscc	%i1,	0x1884,	%g4
	sll	%g6,	%l0,	%l1
	andn	%o2,	%g1,	%o1
	sir	0x0268
	xnorcc	%l4,	%i7,	%o4
	ldsw	[%l7 + 0x30],	%i6
	stw	%g3,	[%l7 + 0x64]
	movcs	%xcc,	%l2,	%l6
	and	%i4,	0x0EEA,	%g7
	fand	%f12,	%f22,	%f10
	orncc	%i3,	%o0,	%g5
	array32	%o7,	%l3,	%o5
	or	%o6,	%i0,	%i5
	movpos	%icc,	%l5,	%i2
	sdivcc	%g2,	0x0EBD,	%o3
	fnegs	%f14,	%f30
	udivcc	%i1,	0x0A8D,	%g6
	ldx	[%l7 + 0x28],	%l0
	fnor	%f2,	%f18,	%f26
	edge8ln	%l1,	%g4,	%g1
	edge16n	%o2,	%o1,	%l4
	edge32ln	%i7,	%i6,	%g3
	ld	[%l7 + 0x58],	%f4
	srax	%o4,	0x06,	%l6
	movcc	%xcc,	%l2,	%g7
	movcc	%xcc,	%i4,	%o0
	edge32	%i3,	%g5,	%o7
	andncc	%l3,	%o5,	%i0
	edge16	%i5,	%l5,	%o6
	sllx	%g2,	%i2,	%i1
	orn	%o3,	%g6,	%l0
	movcc	%xcc,	%g4,	%l1
	edge16	%g1,	%o2,	%l4
	edge32	%o1,	%i7,	%g3
	edge32n	%i6,	%o4,	%l2
	fmul8x16au	%f19,	%f8,	%f26
	srl	%l6,	%i4,	%g7
	ldsb	[%l7 + 0x67],	%i3
	edge32n	%o0,	%g5,	%l3
	addccc	%o7,	%o5,	%i5
	edge8	%i0,	%l5,	%g2
	ldd	[%l7 + 0x18],	%f6
	edge8l	%o6,	%i1,	%i2
	movpos	%icc,	%o3,	%g6
	nop
	set	0x5E, %o1
	ldsh	[%l7 + %o1],	%l0
	xorcc	%g4,	%l1,	%g1
	fabss	%f28,	%f29
	movn	%icc,	%o2,	%o1
	movcs	%xcc,	%l4,	%i7
	lduh	[%l7 + 0x46],	%g3
	andcc	%o4,	0x0E6D,	%l2
	movcs	%xcc,	%i6,	%l6
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	fmuld8sux16	%f23,	%f28,	%f8
	xor	%i4,	%g5,	%l3
	umul	%o7,	%o5,	%i0
	faligndata	%f26,	%f28,	%f22
	orcc	%l5,	0x08B2,	%g2
	stx	%o6,	[%l7 + 0x08]
	movpos	%icc,	%i5,	%i2
	sdiv	%o3,	0x0758,	%g6
	sll	%i1,	%l0,	%l1
	andcc	%g1,	0x1483,	%o2
	movge	%icc,	%o1,	%g4
	umul	%l4,	%i7,	%o4
	ldsb	[%l7 + 0x22],	%g3
	andn	%i6,	%l6,	%g7
	fmovdle	%xcc,	%f10,	%f8
	stx	%i3,	[%l7 + 0x48]
	smulcc	%o0,	0x0398,	%i4
	st	%f5,	[%l7 + 0x38]
	udiv	%g5,	0x00D1,	%l3
	movrlez	%o7,	%o5,	%i0
	edge8n	%l5,	%g2,	%l2
	add	%o6,	%i2,	%o3
	ldub	[%l7 + 0x49],	%i5
	ld	[%l7 + 0x70],	%f5
	mova	%icc,	%i1,	%g6
	fmovsne	%xcc,	%f23,	%f21
	fmovdvs	%xcc,	%f29,	%f29
	udivcc	%l0,	0x1AFD,	%g1
	movrlez	%l1,	%o1,	%g4
	fnot1	%f24,	%f0
	movvc	%xcc,	%o2,	%i7
	stw	%l4,	[%l7 + 0x2C]
	sra	%o4,	%i6,	%g3
	orn	%g7,	%i3,	%l6
	edge32	%i4,	%g5,	%o0
	ldd	[%l7 + 0x08],	%f12
	edge8	%o7,	%l3,	%o5
	fmovdne	%icc,	%f16,	%f9
	movgu	%icc,	%i0,	%l5
	movrne	%l2,	0x21A,	%g2
	addcc	%o6,	0x1608,	%o3
	sra	%i2,	%i1,	%i5
	movle	%icc,	%g6,	%l0
	srax	%g1,	%o1,	%l1
	fandnot2	%f4,	%f16,	%f18
	nop
	set	0x4B, %g2
	stb	%o2,	[%l7 + %g2]
	movrne	%g4,	0x063,	%l4
	edge16n	%i7,	%i6,	%g3
	save %o4, 0x1707, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l6,	%i4,	%g7
	ldd	[%l7 + 0x18],	%g4
	movleu	%xcc,	%o7,	%l3
	andn	%o5,	0x1D46,	%o0
	edge8l	%l5,	%i0,	%l2
	ldsh	[%l7 + 0x2C],	%o6
	ldx	[%l7 + 0x48],	%g2
	movrgz	%i2,	%i1,	%o3
	addccc	%i5,	0x1337,	%g6
	movvc	%xcc,	%g1,	%o1
	movle	%xcc,	%l0,	%l1
	sir	0x006B
	movrlez	%o2,	0x241,	%l4
	edge8l	%i7,	%i6,	%g3
	orncc	%g4,	%o4,	%l6
	movle	%xcc,	%i3,	%g7
	sethi	0x19C2,	%g5
	xor	%i4,	0x1AD2,	%l3
	smulcc	%o7,	0x165A,	%o0
	movrgz	%o5,	%l5,	%i0
	mulscc	%l2,	%o6,	%g2
	ldd	[%l7 + 0x40],	%i0
	sll	%i2,	0x0D,	%o3
	movgu	%icc,	%i5,	%g6
	fmovscc	%icc,	%f8,	%f12
	for	%f28,	%f28,	%f30
	nop
	set	0x68, %i4
	std	%f22,	[%l7 + %i4]
	add	%o1,	%g1,	%l0
	movrlz	%o2,	%l1,	%i7
	edge8l	%l4,	%g3,	%g4
	andncc	%o4,	%i6,	%l6
	or	%g7,	0x0C12,	%g5
	fexpand	%f28,	%f6
	fcmple16	%f16,	%f6,	%i4
	ldd	[%l7 + 0x48],	%i2
	stx	%o7,	[%l7 + 0x50]
	edge8ln	%o0,	%l3,	%o5
	andncc	%l5,	%l2,	%i0
	movne	%icc,	%o6,	%g2
	fnand	%f22,	%f12,	%f14
	umul	%i2,	%i1,	%o3
	sir	0x0385
	sub	%i5,	0x0ED3,	%g6
	subc	%o1,	0x1F41,	%l0
	sth	%o2,	[%l7 + 0x4A]
	movneg	%icc,	%l1,	%g1
	edge8	%i7,	%l4,	%g4
	edge8	%o4,	%g3,	%i6
	fmovsne	%xcc,	%f3,	%f8
	fcmped	%fcc3,	%f28,	%f26
	fpsub16	%f14,	%f12,	%f2
	umul	%l6,	%g7,	%i4
	or	%i3,	%o7,	%g5
	move	%xcc,	%o0,	%o5
	ldub	[%l7 + 0x18],	%l3
	lduh	[%l7 + 0x48],	%l2
	fmovrde	%l5,	%f10,	%f4
	movrne	%o6,	0x3A2,	%g2
	udivcc	%i2,	0x12C9,	%i0
	srlx	%i1,	%o3,	%i5
	ldsh	[%l7 + 0x7C],	%o1
	ldd	[%l7 + 0x48],	%g6
	fmul8x16au	%f2,	%f4,	%f12
	subc	%l0,	0x143E,	%o2
	orn	%l1,	0x07FA,	%g1
	save %l4, %g4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f31,	%f28,	%f0
	xorcc	%g3,	0x1BE2,	%i6
	orncc	%l6,	%i7,	%i4
	fpsub16	%f24,	%f30,	%f30
	edge8ln	%g7,	%i3,	%g5
	stb	%o0,	[%l7 + 0x1C]
	move	%xcc,	%o7,	%o5
	sir	0x14D4
	edge16l	%l2,	%l5,	%l3
	edge8ln	%g2,	%i2,	%o6
	fmovrsgz	%i1,	%f2,	%f5
	move	%xcc,	%o3,	%i0
	fmuld8sux16	%f3,	%f4,	%f4
	subccc	%o1,	%i5,	%l0
	xorcc	%o2,	0x0F3F,	%l1
	edge8n	%g6,	%g1,	%g4
	udivcc	%o4,	0x12DF,	%g3
	movleu	%xcc,	%l4,	%i6
	fornot2	%f22,	%f18,	%f10
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%i6
	sllx	%l6,	0x15,	%g7
	addcc	%i4,	0x0ADE,	%i3
	andn	%g5,	%o0,	%o7
	or	%l2,	0x102E,	%l5
	stb	%l3,	[%l7 + 0x10]
	or	%o5,	0x19A4,	%i2
	stw	%g2,	[%l7 + 0x50]
	sdivcc	%i1,	0x1364,	%o6
	ldsb	[%l7 + 0x7B],	%o3
	orncc	%i0,	0x0939,	%o1
	smul	%i5,	0x1390,	%l0
	edge32n	%o2,	%g6,	%l1
	ldsw	[%l7 + 0x48],	%g4
	movpos	%icc,	%o4,	%g3
	edge32	%g1,	%l4,	%i6
	ldd	[%l7 + 0x78],	%f0
	orcc	%l6,	%i7,	%g7
	fmovse	%icc,	%f30,	%f7
	lduh	[%l7 + 0x3A],	%i3
	udivcc	%g5,	0x1DCF,	%i4
	mulx	%o0,	%l2,	%l5
	addcc	%l3,	0x0D73,	%o7
	ldx	[%l7 + 0x68],	%i2
	lduh	[%l7 + 0x4A],	%o5
	fpadd16	%f20,	%f4,	%f4
	fcmpeq16	%f6,	%f8,	%g2
	fnors	%f4,	%f10,	%f6
	subcc	%o6,	%o3,	%i1
	fmovdgu	%xcc,	%f29,	%f24
	edge8ln	%o1,	%i5,	%i0
	movrlz	%o2,	0x385,	%l0
	fcmpeq32	%f8,	%f26,	%g6
	array32	%l1,	%o4,	%g4
	srlx	%g3,	%g1,	%i6
	udiv	%l4,	0x0CD3,	%l6
	andncc	%g7,	%i7,	%i3
	add	%i4,	0x0103,	%o0
	mulx	%l2,	%g5,	%l3
	movpos	%xcc,	%o7,	%l5
	movneg	%xcc,	%o5,	%g2
	fmovscs	%icc,	%f24,	%f9
	fmovsvs	%xcc,	%f5,	%f29
	movg	%icc,	%o6,	%i2
	fnor	%f14,	%f16,	%f14
	fnor	%f22,	%f28,	%f0
	fcmpeq32	%f30,	%f18,	%i1
	ldsw	[%l7 + 0x50],	%o3
	edge8n	%o1,	%i5,	%o2
	array16	%i0,	%l0,	%g6
	subccc	%o4,	0x18FB,	%g4
	sir	0x1E06
	mova	%xcc,	%l1,	%g1
	sll	%g3,	%i6,	%l4
	fxnor	%f10,	%f30,	%f26
	subccc	%l6,	0x03D2,	%i7
	fnand	%f16,	%f30,	%f30
	movcc	%xcc,	%g7,	%i3
	restore %o0, 0x0795, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%g5,	%l3
	movle	%icc,	%o7,	%l5
	fpsub16s	%f2,	%f2,	%f11
	fzero	%f0
	movrlez	%l2,	0x24B,	%g2
	fors	%f1,	%f0,	%f23
	movge	%icc,	%o5,	%o6
	addcc	%i2,	0x14B0,	%o3
	edge16	%o1,	%i5,	%i1
	fmovrsgz	%o2,	%f16,	%f28
	fmovdg	%xcc,	%f26,	%f28
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	save %o4, %g4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%g1,	%f6,	%f24
	ldub	[%l7 + 0x2B],	%i6
	fmovdcs	%icc,	%f7,	%f21
	fors	%f15,	%f6,	%f14
	fmovdl	%xcc,	%f29,	%f26
	array16	%g3,	%l4,	%i7
	fpackfix	%f10,	%f27
	udiv	%g7,	0x1EB5,	%i3
	movneg	%icc,	%l6,	%i4
	movpos	%icc,	%o0,	%g5
	fcmpd	%fcc0,	%f0,	%f12
	fmovrsne	%l3,	%f10,	%f11
	xnorcc	%l5,	%l2,	%g2
	fmovse	%icc,	%f19,	%f8
	edge32ln	%o5,	%o7,	%i2
	fmovrdgz	%o6,	%f20,	%f20
	fcmple32	%f6,	%f26,	%o3
	edge16n	%o1,	%i1,	%i5
	sdivcc	%o2,	0x088F,	%i0
	movgu	%icc,	%l0,	%o4
	andn	%g6,	%g4,	%l1
	mulx	%g1,	%g3,	%l4
	orncc	%i6,	%g7,	%i7
	srl	%l6,	%i3,	%o0
	andcc	%i4,	0x1F1A,	%l3
	sth	%l5,	[%l7 + 0x54]
	ldsb	[%l7 + 0x51],	%g5
	smul	%g2,	0x1176,	%o5
	fpack32	%f4,	%f6,	%f2
	array32	%o7,	%i2,	%l2
	edge16ln	%o3,	%o6,	%o1
	sir	0x0860
	fnand	%f4,	%f28,	%f2
	xnorcc	%i5,	0x14C1,	%i1
	fmovda	%icc,	%f7,	%f12
	movvs	%xcc,	%i0,	%l0
	stx	%o4,	[%l7 + 0x78]
	fpsub16	%f6,	%f8,	%f2
	fpadd16s	%f12,	%f31,	%f4
	alignaddrl	%g6,	%o2,	%g4
	fzeros	%f1
	fnot2	%f24,	%f30
	fmovdneg	%xcc,	%f31,	%f29
	movleu	%icc,	%g1,	%l1
	fcmple16	%f16,	%f12,	%g3
	udivx	%l4,	0x1F8C,	%i6
	movre	%i7,	0x1EF,	%g7
	fxnors	%f4,	%f14,	%f10
	srl	%l6,	0x04,	%o0
	movle	%icc,	%i3,	%l3
	fzeros	%f30
	andcc	%i4,	0x09E6,	%l5
	andncc	%g5,	%o5,	%g2
	edge16n	%i2,	%l2,	%o7
	movrgz	%o3,	0x037,	%o6
	fmovdvs	%icc,	%f25,	%f8
	ldsw	[%l7 + 0x10],	%i5
	fsrc2	%f2,	%f20
	move	%icc,	%i1,	%o1
	std	%f8,	[%l7 + 0x30]
	movvc	%icc,	%l0,	%i0
	sethi	0x028C,	%g6
	movcc	%icc,	%o2,	%g4
	sethi	0x137F,	%o4
	fcmpgt16	%f6,	%f24,	%l1
	andn	%g1,	%g3,	%l4
	srax	%i6,	0x0A,	%i7
	movcc	%icc,	%g7,	%o0
	fandnot2s	%f27,	%f27,	%f21
	stb	%l6,	[%l7 + 0x73]
	sethi	0x1A12,	%l3
	fand	%f30,	%f0,	%f14
	lduw	[%l7 + 0x74],	%i4
	fmovdvs	%xcc,	%f14,	%f21
	edge8l	%l5,	%i3,	%g5
	movvs	%xcc,	%g2,	%i2
	edge16n	%o5,	%o7,	%l2
	xor	%o6,	%i5,	%i1
	movcc	%xcc,	%o1,	%l0
	movle	%xcc,	%o3,	%i0
	movcc	%xcc,	%g6,	%g4
	sth	%o2,	[%l7 + 0x32]
	udiv	%o4,	0x1194,	%l1
	movge	%icc,	%g1,	%g3
	movg	%icc,	%i6,	%l4
	fmuld8sux16	%f13,	%f7,	%f22
	fmovdcs	%icc,	%f22,	%f20
	popc	0x0F7D,	%g7
	andncc	%i7,	%o0,	%l3
	fmovdcs	%xcc,	%f4,	%f14
	fmul8x16al	%f1,	%f14,	%f10
	xnor	%l6,	0x06CB,	%i4
	sethi	0x04D5,	%i3
	andcc	%l5,	0x1109,	%g2
	ld	[%l7 + 0x18],	%f6
	fxnors	%f11,	%f6,	%f28
	fmovrde	%g5,	%f20,	%f28
	fxors	%f5,	%f7,	%f27
	addccc	%o5,	%o7,	%i2
	srl	%l2,	0x1B,	%i5
	edge8n	%i1,	%o6,	%l0
	fnot1	%f0,	%f28
	sra	%o1,	0x16,	%o3
	andcc	%g6,	%g4,	%i0
	fcmped	%fcc3,	%f6,	%f12
	fcmpeq32	%f10,	%f0,	%o2
	edge16ln	%o4,	%g1,	%g3
	array8	%i6,	%l4,	%l1
	fmovrde	%g7,	%f10,	%f6
	popc	0x1694,	%o0
	xnor	%l3,	%i7,	%l6
	alignaddr	%i3,	%i4,	%l5
	stb	%g5,	[%l7 + 0x17]
	mulscc	%o5,	%o7,	%g2
	alignaddr	%i2,	%l2,	%i1
	sra	%o6,	%l0,	%o1
	ldub	[%l7 + 0x39],	%i5
	srlx	%o3,	0x02,	%g4
	fands	%f4,	%f1,	%f22
	movvc	%icc,	%i0,	%o2
	fcmpeq32	%f18,	%f2,	%o4
	fxors	%f11,	%f21,	%f24
	alignaddrl	%g6,	%g3,	%i6
	lduw	[%l7 + 0x20],	%g1
	udivcc	%l4,	0x1A75,	%g7
	subccc	%l1,	0x1B88,	%l3
	fornot2s	%f23,	%f4,	%f1
	fmovsgu	%xcc,	%f27,	%f11
	addc	%i7,	%o0,	%i3
	ldub	[%l7 + 0x27],	%l6
	and	%i4,	%g5,	%o5
	subc	%l5,	%o7,	%g2
	fmovrdgez	%l2,	%f4,	%f0
	mulx	%i1,	0x1647,	%i2
	fpsub32s	%f4,	%f21,	%f16
	addc	%l0,	%o6,	%i5
	umul	%o3,	0x1569,	%g4
	movleu	%icc,	%o1,	%i0
	and	%o2,	%g6,	%o4
	edge8ln	%i6,	%g3,	%g1
	sll	%g7,	%l4,	%l3
	fandnot1	%f0,	%f4,	%f22
	edge32ln	%i7,	%o0,	%i3
	fmovdvc	%icc,	%f28,	%f23
	fmovdvs	%xcc,	%f4,	%f4
	movrgez	%l6,	%i4,	%l1
	ldsh	[%l7 + 0x10],	%g5
	edge32	%l5,	%o7,	%g2
	fzero	%f0
	sth	%o5,	[%l7 + 0x16]
	edge8l	%l2,	%i1,	%l0
	ldd	[%l7 + 0x20],	%i2
	move	%icc,	%i5,	%o6
	movrne	%g4,	0x033,	%o3
	fxnor	%f20,	%f4,	%f6
	fandnot1	%f26,	%f22,	%f4
	movrgez	%o1,	0x103,	%o2
	ldx	[%l7 + 0x18],	%g6
	ldd	[%l7 + 0x58],	%f0
	srl	%o4,	%i0,	%g3
	sub	%g1,	%g7,	%l4
	addc	%l3,	0x1DFD,	%i7
	movrgez	%i6,	%o0,	%l6
	fxnors	%f9,	%f4,	%f16
	fmovrsgez	%i3,	%f17,	%f25
	smul	%l1,	%i4,	%l5
	fmovdge	%icc,	%f1,	%f26
	umul	%g5,	%g2,	%o5
	movl	%xcc,	%o7,	%l2
	smul	%i1,	0x1B4A,	%i2
	move	%xcc,	%l0,	%o6
	movvc	%xcc,	%g4,	%o3
	fmovrse	%o1,	%f17,	%f25
	orncc	%o2,	0x0E11,	%g6
	array32	%o4,	%i5,	%i0
	edge16ln	%g1,	%g3,	%l4
	xor	%g7,	%l3,	%i7
	movre	%i6,	%o0,	%i3
	fmovs	%f5,	%f7
	movrlz	%l6,	0x1B8,	%l1
	fandnot2s	%f17,	%f24,	%f26
	udivcc	%l5,	0x0E09,	%i4
	movleu	%icc,	%g5,	%g2
	fands	%f30,	%f5,	%f5
	addcc	%o7,	%o5,	%l2
	andncc	%i2,	%i1,	%o6
	umulcc	%g4,	0x104B,	%o3
	ldsw	[%l7 + 0x08],	%l0
	fpadd16s	%f13,	%f20,	%f27
	fpsub32	%f22,	%f18,	%f10
	or	%o2,	0x1114,	%g6
	fpack16	%f4,	%f4
	umulcc	%o1,	%i5,	%i0
	movg	%icc,	%o4,	%g1
	umul	%l4,	0x1FBA,	%g7
	alignaddrl	%g3,	%l3,	%i6
	sllx	%i7,	%i3,	%l6
	movgu	%xcc,	%l1,	%o0
	lduh	[%l7 + 0x66],	%i4
	andncc	%g5,	%g2,	%l5
	fmuld8sux16	%f19,	%f31,	%f26
	fzero	%f14
	lduw	[%l7 + 0x70],	%o5
	save %o7, 0x0881, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i1,	%o6,	%i2
	fmovsle	%xcc,	%f17,	%f0
	array8	%o3,	%g4,	%o2
	edge8n	%l0,	%g6,	%i5
	edge32n	%o1,	%i0,	%g1
	edge32ln	%l4,	%o4,	%g7
	subcc	%l3,	%g3,	%i6
	fsrc1	%f30,	%f26
	andn	%i3,	%l6,	%i7
	move	%xcc,	%l1,	%o0
	movrlez	%g5,	0x223,	%g2
	edge8ln	%l5,	%o5,	%o7
	fmovscc	%xcc,	%f5,	%f18
	fmovsneg	%icc,	%f8,	%f8
	array32	%i4,	%i1,	%o6
	movvc	%icc,	%i2,	%l2
	edge8ln	%g4,	%o2,	%o3
	movcs	%xcc,	%l0,	%i5
	sth	%g6,	[%l7 + 0x70]
	fnors	%f26,	%f14,	%f12
	fandnot1	%f4,	%f8,	%f2
	fmul8ulx16	%f20,	%f0,	%f2
	sdivcc	%o1,	0x07E6,	%g1
	xnor	%i0,	%l4,	%o4
	ldd	[%l7 + 0x10],	%f10
	sll	%g7,	0x1A,	%g3
	movrlez	%l3,	%i6,	%l6
	edge32	%i3,	%l1,	%i7
	sth	%o0,	[%l7 + 0x1A]
	subcc	%g2,	0x1EF9,	%g5
	addcc	%l5,	%o7,	%o5
	fandnot1	%f14,	%f28,	%f24
	fands	%f15,	%f6,	%f28
	andn	%i1,	%o6,	%i2
	sra	%i4,	%l2,	%g4
	andn	%o2,	0x189A,	%o3
	udivcc	%i5,	0x1A61,	%g6
	fsrc1s	%f30,	%f30
	ldsh	[%l7 + 0x1E],	%l0
	movn	%icc,	%g1,	%i0
	sll	%o1,	0x10,	%o4
	edge32ln	%g7,	%l4,	%l3
	movrne	%g3,	0x2F7,	%l6
	fmovdcs	%xcc,	%f23,	%f10
	sllx	%i6,	%l1,	%i3
	fmovsn	%xcc,	%f19,	%f23
	mulx	%o0,	%g2,	%g5
	xorcc	%i7,	%o7,	%o5
	movrlz	%l5,	0x2C0,	%i1
	sra	%i2,	%i4,	%l2
	movrgz	%o6,	0x2A3,	%g4
	addcc	%o2,	%i5,	%g6
	fmovrslz	%o3,	%f31,	%f8
	sllx	%g1,	%l0,	%i0
	udivx	%o4,	0x0863,	%o1
	fmovdneg	%icc,	%f15,	%f16
	sdivx	%l4,	0x1A99,	%g7
	movrne	%l3,	%g3,	%i6
	edge32	%l6,	%i3,	%l1
	fmovrdlz	%g2,	%f30,	%f2
	smul	%g5,	0x03A9,	%o0
	xor	%i7,	%o5,	%l5
	movrlez	%i1,	%i2,	%i4
	array32	%l2,	%o7,	%o6
	srax	%g4,	%i5,	%g6
	fandnot1s	%f18,	%f14,	%f19
	xnorcc	%o2,	0x0D82,	%g1
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%f10
	edge8l	%o3,	%i0,	%l0
	xorcc	%o4,	0x0C82,	%o1
	fmovdl	%xcc,	%f28,	%f29
	movleu	%xcc,	%l4,	%l3
	orcc	%g3,	%g7,	%i6
	andncc	%l6,	%i3,	%l1
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%g4
	fzero	%f24
	alignaddr	%g2,	%o0,	%i7
	andncc	%l5,	%o5,	%i2
	stb	%i4,	[%l7 + 0x23]
	xnorcc	%i1,	0x0261,	%l2
	fmovrdgz	%o6,	%f24,	%f2
	edge16n	%g4,	%i5,	%o7
	mulx	%o2,	0x1F16,	%g1
	siam	0x2
	siam	0x2
	umulcc	%g6,	%i0,	%l0
	edge8n	%o4,	%o1,	%l4
	fnot1s	%f27,	%f19
	xorcc	%o3,	0x1325,	%g3
	movl	%xcc,	%g7,	%i6
	sethi	0x07EA,	%l6
	xnor	%i3,	0x0DF9,	%l3
	fmovdvc	%icc,	%f4,	%f1
	fmovrslez	%g5,	%f22,	%f5
	fabss	%f22,	%f27
	nop
	set	0x45, %i6
	ldsb	[%l7 + %i6],	%l1
	movg	%xcc,	%o0,	%i7
	edge32ln	%l5,	%o5,	%i2
	edge16n	%g2,	%i4,	%l2
	fnot1s	%f1,	%f18
	lduw	[%l7 + 0x7C],	%i1
	orcc	%o6,	%g4,	%i5
	fmul8x16	%f11,	%f30,	%f20
	ldsh	[%l7 + 0x1E],	%o2
	alignaddr	%o7,	%g6,	%g1
	edge32n	%l0,	%i0,	%o4
	fcmple16	%f2,	%f28,	%o1
	fnot2s	%f18,	%f24
	orncc	%o3,	%l4,	%g3
	nop
	set	0x65, %o5
	ldsb	[%l7 + %o5],	%g7
	mulscc	%l6,	0x1553,	%i3
	edge16n	%l3,	%i6,	%g5
	edge8	%l1,	%o0,	%l5
	edge16l	%o5,	%i7,	%i2
	fmovdne	%icc,	%f14,	%f20
	fornot2s	%f2,	%f25,	%f23
	orncc	%i4,	%l2,	%i1
	movl	%icc,	%g2,	%o6
	sra	%i5,	%g4,	%o7
	fmovda	%icc,	%f4,	%f14
	fandnot2	%f12,	%f16,	%f12
	addccc	%g6,	%o2,	%l0
	sir	0x08BB
	orncc	%g1,	%i0,	%o1
	sdivx	%o4,	0x0EE5,	%o3
	umulcc	%l4,	%g7,	%g3
	fmovsn	%xcc,	%f18,	%f25
	movleu	%icc,	%l6,	%l3
	mulx	%i3,	0x089C,	%g5
	sethi	0x13DE,	%i6
	ldd	[%l7 + 0x40],	%f30
	movleu	%xcc,	%l1,	%o0
	movl	%xcc,	%o5,	%i7
	xor	%l5,	%i2,	%l2
	mulx	%i4,	%i1,	%o6
	stb	%g2,	[%l7 + 0x4F]
	fmovrdlz	%i5,	%f16,	%f22
	fmovrdgz	%g4,	%f22,	%f20
	array8	%o7,	%g6,	%l0
	ldd	[%l7 + 0x60],	%g0
	alignaddr	%i0,	%o2,	%o1
	movgu	%icc,	%o4,	%l4
	ldub	[%l7 + 0x4D],	%g7
	fmovsge	%xcc,	%f7,	%f4
	ldd	[%l7 + 0x50],	%g2
	sethi	0x1F48,	%o3
	movrgz	%l3,	0x38C,	%i3
	subcc	%l6,	0x1A09,	%g5
	sir	0x0392
	ldub	[%l7 + 0x58],	%l1
	orcc	%o0,	0x045B,	%i6
	sllx	%i7,	%o5,	%i2
	fcmpgt32	%f10,	%f4,	%l5
	movvs	%icc,	%i4,	%i1
	sub	%l2,	0x0ACA,	%g2
	andncc	%i5,	%g4,	%o6
	edge8ln	%g6,	%l0,	%g1
	stb	%o7,	[%l7 + 0x29]
	udiv	%i0,	0x189D,	%o1
	fnot2	%f4,	%f10
	fornot2	%f0,	%f14,	%f14
	movrgez	%o4,	%l4,	%g7
	faligndata	%f10,	%f24,	%f14
	xnor	%o2,	0x1F4C,	%o3
	movpos	%xcc,	%l3,	%g3
	ldd	[%l7 + 0x70],	%i6
	umulcc	%i3,	0x08EE,	%l1
	lduw	[%l7 + 0x0C],	%g5
	movrgez	%i6,	%o0,	%i7
	udivcc	%o5,	0x1606,	%i2
	lduh	[%l7 + 0x20],	%i4
	fmovsne	%xcc,	%f20,	%f17
	subc	%l5,	%i1,	%g2
	fmovrdlez	%l2,	%f22,	%f14
	and	%g4,	%o6,	%i5
	orncc	%l0,	0x0CB5,	%g6
	stx	%g1,	[%l7 + 0x50]
	movg	%icc,	%o7,	%o1
	std	%f14,	[%l7 + 0x08]
	addccc	%i0,	0x191C,	%l4
	udivcc	%o4,	0x1F63,	%o2
	mova	%xcc,	%o3,	%l3
	subc	%g7,	0x03B1,	%g3
	andn	%i3,	0x0CC0,	%l1
	mulx	%l6,	%g5,	%i6
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%f18
	fpadd32	%f24,	%f10,	%f16
	add	%i7,	%o5,	%o0
	edge16l	%i4,	%i2,	%i1
	movneg	%xcc,	%l5,	%g2
	movne	%icc,	%g4,	%o6
	fmovse	%xcc,	%f2,	%f1
	fmul8x16	%f6,	%f18,	%f28
	restore %l2, %l0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i5,	%g1,	%o7
	edge8	%o1,	%i0,	%o4
	orcc	%l4,	0x0BC2,	%o3
	fpadd32s	%f11,	%f22,	%f3
	fmovsge	%xcc,	%f20,	%f6
	edge16	%l3,	%g7,	%o2
	edge32n	%i3,	%g3,	%l6
	andn	%l1,	%i6,	%g5
	srax	%o5,	0x12,	%o0
	array16	%i4,	%i2,	%i1
	edge8l	%i7,	%l5,	%g4
	sir	0x1447
	array16	%g2,	%o6,	%l0
	ldub	[%l7 + 0x76],	%g6
	movgu	%icc,	%i5,	%g1
	sethi	0x144D,	%o7
	fmul8sux16	%f6,	%f8,	%f0
	andcc	%l2,	0x1388,	%o1
	umulcc	%o4,	%i0,	%o3
	edge16	%l4,	%l3,	%g7
	andncc	%o2,	%g3,	%i3
	edge8n	%l6,	%i6,	%l1
	st	%f28,	[%l7 + 0x4C]
	edge32	%o5,	%g5,	%i4
	edge8	%i2,	%o0,	%i1
	andncc	%i7,	%l5,	%g2
	fcmple32	%f12,	%f30,	%g4
	add	%o6,	0x1125,	%g6
	orcc	%l0,	0x1D74,	%g1
	fnot2s	%f4,	%f17
	movrgz	%o7,	0x196,	%l2
	movrgz	%i5,	0x279,	%o4
	umul	%i0,	%o1,	%o3
	edge32l	%l3,	%l4,	%o2
	orncc	%g3,	%g7,	%l6
	edge8l	%i3,	%i6,	%o5
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%l0
	edge8n	%g5,	%i4,	%i2
	sllx	%i1,	%i7,	%o0
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	udiv	%g6,	0x06A1,	%g4
	fnot2	%f2,	%f20
	edge8	%g1,	%o7,	%l0
	fmul8x16	%f9,	%f26,	%f2
	edge32n	%i5,	%l2,	%o4
	orncc	%i0,	0x1BBB,	%o1
	sub	%o3,	0x17F4,	%l4
	udiv	%l3,	0x1490,	%o2
	xor	%g7,	%l6,	%i3
	fmovsvc	%icc,	%f21,	%f17
	alignaddr	%i6,	%g3,	%l1
	sub	%g5,	0x1C58,	%i4
	array32	%o5,	%i1,	%i7
	xnor	%o0,	0x0B3B,	%i2
	orn	%g2,	0x033D,	%l5
	mulscc	%o6,	%g4,	%g6
	subccc	%g1,	0x001F,	%o7
	sdivx	%i5,	0x0BDF,	%l0
	orn	%l2,	%o4,	%o1
	fxnor	%f26,	%f10,	%f28
	movrlz	%o3,	0x035,	%l4
	lduh	[%l7 + 0x18],	%l3
	mulscc	%o2,	0x0E48,	%g7
	lduh	[%l7 + 0x44],	%i0
	fcmps	%fcc0,	%f11,	%f24
	subccc	%i3,	%i6,	%l6
	fmovrdgez	%l1,	%f18,	%f0
	stw	%g3,	[%l7 + 0x20]
	fpackfix	%f22,	%f5
	movre	%g5,	0x0E3,	%i4
	xorcc	%i1,	0x1195,	%i7
	srax	%o0,	%o5,	%i2
	udivx	%l5,	0x0196,	%g2
	siam	0x6
	orn	%o6,	%g6,	%g1
	ldsb	[%l7 + 0x55],	%g4
	mulx	%i5,	%l0,	%o7
	movvc	%xcc,	%o4,	%l2
	fnors	%f24,	%f1,	%f18
	fmovdne	%xcc,	%f20,	%f1
	lduh	[%l7 + 0x44],	%o1
	stw	%l4,	[%l7 + 0x40]
	array16	%l3,	%o3,	%g7
	fmovdpos	%xcc,	%f29,	%f16
	ldsb	[%l7 + 0x3C],	%o2
	addcc	%i0,	0x0019,	%i3
	fmovrdgz	%l6,	%f6,	%f18
	movcs	%xcc,	%i6,	%g3
	edge32l	%g5,	%l1,	%i4
	sra	%i7,	%i1,	%o5
	sll	%o0,	0x05,	%l5
	nop
	set	0x34, %i0
	stw	%g2,	[%l7 + %i0]
	srax	%i2,	%g6,	%g1
	and	%o6,	0x1E64,	%i5
	addc	%g4,	%o7,	%o4
	subc	%l2,	0x1448,	%l0
	fornot1s	%f1,	%f20,	%f30
	movl	%icc,	%o1,	%l4
	udiv	%l3,	0x0C6C,	%g7
	subc	%o3,	%o2,	%i0
	fmovrdlz	%l6,	%f2,	%f10
	smulcc	%i3,	0x1974,	%i6
	orncc	%g3,	%g5,	%i4
	and	%i7,	0x0A14,	%l1
	ldd	[%l7 + 0x18],	%i0
	sth	%o0,	[%l7 + 0x7E]
	stb	%l5,	[%l7 + 0x75]
	ldd	[%l7 + 0x68],	%g2
	smul	%i2,	%o5,	%g1
	fcmpne32	%f8,	%f28,	%g6
	mova	%xcc,	%o6,	%i5
	subcc	%o7,	0x115D,	%o4
	udiv	%g4,	0x1117,	%l0
	fnor	%f24,	%f26,	%f14
	fpmerge	%f13,	%f17,	%f10
	udivx	%o1,	0x0A3D,	%l2
	fxor	%f4,	%f14,	%f2
	fmovse	%icc,	%f30,	%f4
	fmovsvc	%xcc,	%f2,	%f29
	edge16n	%l4,	%g7,	%o3
	udivx	%o2,	0x0747,	%l3
	edge32	%l6,	%i3,	%i6
	save %i0, %g5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i7,	%g3,	%i1
	movle	%icc,	%o0,	%l1
	orncc	%l5,	%g2,	%i2
	edge16l	%o5,	%g6,	%o6
	stb	%i5,	[%l7 + 0x7C]
	subcc	%g1,	0x1543,	%o4
	sub	%o7,	%l0,	%o1
	movcs	%icc,	%g4,	%l4
	movneg	%icc,	%g7,	%l2
	edge8	%o3,	%o2,	%l3
	andn	%i3,	%i6,	%i0
	mulx	%l6,	0x11C9,	%i4
	stx	%g5,	[%l7 + 0x10]
	nop
	set	0x20, %g6
	stx	%g3,	[%l7 + %g6]
	andcc	%i7,	0x103C,	%i1
	addc	%o0,	%l1,	%g2
	movrne	%l5,	%i2,	%o5
	movvs	%icc,	%o6,	%g6
	sth	%g1,	[%l7 + 0x64]
	stb	%i5,	[%l7 + 0x7A]
	ldd	[%l7 + 0x58],	%o4
	udivx	%o7,	0x1829,	%o1
	fcmpes	%fcc3,	%f17,	%f28
	ldsh	[%l7 + 0x1E],	%g4
	fmovdpos	%xcc,	%f28,	%f7
	srax	%l0,	0x0D,	%g7
	srax	%l4,	0x0A,	%o3
	movn	%xcc,	%o2,	%l3
	faligndata	%f0,	%f2,	%f8
	srax	%i3,	%i6,	%i0
	edge16ln	%l2,	%i4,	%g5
	sub	%l6,	%i7,	%i1
	ldsw	[%l7 + 0x10],	%g3
	restore %o0, 0x17BD, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l5,	0x1343,	%i2
	fcmpeq32	%f16,	%f14,	%l1
	fcmpgt32	%f22,	%f28,	%o5
	xnor	%g6,	%g1,	%o6
	movneg	%xcc,	%o4,	%o7
	ldsh	[%l7 + 0x7A],	%o1
	ldx	[%l7 + 0x38],	%i5
	movg	%xcc,	%g4,	%l0
	st	%f9,	[%l7 + 0x7C]
	addcc	%l4,	0x182D,	%g7
	popc	0x034F,	%o2
	edge8ln	%o3,	%l3,	%i6
	movl	%xcc,	%i0,	%l2
	stw	%i3,	[%l7 + 0x44]
	fmovrse	%i4,	%f10,	%f29
	edge16l	%l6,	%i7,	%i1
	ldsb	[%l7 + 0x4B],	%g5
	addccc	%o0,	0x18B2,	%g2
	xorcc	%l5,	0x05F5,	%i2
	fnot2s	%f7,	%f23
	srlx	%l1,	%o5,	%g6
	fmovsvc	%icc,	%f22,	%f2
	xorcc	%g1,	0x0F31,	%o6
	subccc	%g3,	0x0295,	%o4
	lduw	[%l7 + 0x10],	%o7
	lduw	[%l7 + 0x40],	%o1
	save %g4, %i5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f8,	%f2,	%f4
	movg	%xcc,	%g7,	%o2
	sethi	0x0F18,	%o3
	fmovsneg	%xcc,	%f4,	%f8
	stw	%l3,	[%l7 + 0x2C]
	fnot1s	%f21,	%f17
	sdivcc	%i6,	0x19DC,	%l4
	movrlz	%i0,	%l2,	%i4
	fxors	%f3,	%f28,	%f20
	edge32n	%i3,	%l6,	%i1
	fmovscs	%xcc,	%f8,	%f0
	orncc	%g5,	%o0,	%i7
	lduw	[%l7 + 0x74],	%g2
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	edge16n	%l5,	%g6,	%o5
	lduh	[%l7 + 0x58],	%g1
	edge8n	%o6,	%g3,	%o7
	movge	%xcc,	%o1,	%o4
	add	%g4,	0x1F17,	%l0
	mulscc	%i5,	0x06BB,	%o2
	movn	%icc,	%o3,	%l3
	srlx	%g7,	%i6,	%i0
	smul	%l4,	0x146B,	%l2
	mulx	%i3,	0x1C7F,	%i4
	sdivcc	%i1,	0x1BE8,	%l6
	orn	%g5,	%o0,	%g2
	movrlez	%i2,	%l1,	%l5
	fornot2s	%f18,	%f11,	%f11
	fcmped	%fcc2,	%f14,	%f20
	movge	%icc,	%g6,	%i7
	subccc	%g1,	0x19EE,	%o5
	movrgz	%g3,	0x0D4,	%o7
	fmovse	%icc,	%f31,	%f4
	udiv	%o6,	0x0C59,	%o1
	edge8n	%o4,	%g4,	%l0
	movne	%icc,	%o2,	%i5
	sethi	0x11AB,	%o3
	alignaddr	%g7,	%i6,	%i0
	xnor	%l4,	0x1E30,	%l2
	movcc	%xcc,	%l3,	%i4
	movrne	%i1,	%i3,	%l6
	ldx	[%l7 + 0x30],	%g5
	stw	%o0,	[%l7 + 0x28]
	fcmple32	%f16,	%f20,	%i2
	movcs	%icc,	%l1,	%g2
	movcs	%xcc,	%g6,	%l5
	fnors	%f10,	%f19,	%f11
	xnorcc	%g1,	0x1068,	%o5
	movle	%icc,	%i7,	%g3
	fsrc2s	%f16,	%f28
	fmovdl	%xcc,	%f3,	%f0
	srl	%o7,	0x15,	%o1
	edge8	%o4,	%o6,	%l0
	fnors	%f16,	%f31,	%f12
	edge16l	%o2,	%g4,	%i5
	addc	%o3,	0x0666,	%g7
	sdiv	%i0,	0x0244,	%i6
	movne	%icc,	%l4,	%l3
	orn	%i4,	%i1,	%l2
	movl	%icc,	%l6,	%i3
	edge8	%g5,	%i2,	%l1
	edge16	%g2,	%o0,	%l5
	movrne	%g6,	%o5,	%i7
	movrne	%g3,	0x2F7,	%g1
	fmovdneg	%icc,	%f21,	%f6
	array8	%o7,	%o1,	%o4
	fxor	%f12,	%f6,	%f22
	addc	%l0,	0x0C55,	%o2
	sethi	0x11FA,	%g4
	fmovrdne	%o6,	%f14,	%f30
	fmovdpos	%xcc,	%f30,	%f2
	xorcc	%i5,	0x1151,	%g7
	movvs	%icc,	%i0,	%o3
	fmovdpos	%icc,	%f4,	%f6
	mulx	%l4,	%i6,	%i4
	orncc	%i1,	0x1E19,	%l3
	ldub	[%l7 + 0x29],	%l2
	fmovspos	%xcc,	%f29,	%f8
	fmovsn	%icc,	%f0,	%f31
	subc	%i3,	%l6,	%i2
	fcmple32	%f14,	%f28,	%g5
	fmovdvs	%icc,	%f13,	%f9
	fcmpne32	%f6,	%f6,	%l1
	movre	%o0,	0x023,	%l5
	movle	%icc,	%g2,	%g6
	array8	%i7,	%g3,	%g1
	andn	%o5,	0x156A,	%o1
	st	%f31,	[%l7 + 0x54]
	movge	%xcc,	%o7,	%l0
	array16	%o4,	%g4,	%o6
	sll	%i5,	%g7,	%o2
	fmuld8ulx16	%f16,	%f31,	%f28
	movvs	%xcc,	%i0,	%l4
	sll	%i6,	%i4,	%i1
	fmovrsgz	%o3,	%f7,	%f12
	fmovdne	%xcc,	%f1,	%f23
	movge	%xcc,	%l2,	%l3
	udiv	%i3,	0x03BC,	%l6
	mova	%icc,	%g5,	%i2
	movneg	%xcc,	%o0,	%l1
	fmul8x16al	%f11,	%f17,	%f30
	ldsw	[%l7 + 0x58],	%g2
	smulcc	%g6,	0x09EE,	%l5
	movne	%icc,	%i7,	%g3
	save %o5, %o1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f16,	%f7
	edge32n	%l0,	%g1,	%o4
	andcc	%g4,	0x10C5,	%i5
	sethi	0x1B0F,	%g7
	xorcc	%o6,	%o2,	%i0
	fcmpeq16	%f10,	%f12,	%i6
	fpsub32	%f16,	%f30,	%f18
	popc	%i4,	%i1
	st	%f17,	[%l7 + 0x58]
	andn	%l4,	%l2,	%o3
	ldub	[%l7 + 0x18],	%l3
	fmovsn	%xcc,	%f26,	%f11
	umulcc	%l6,	0x16F3,	%g5
	edge8l	%i3,	%i2,	%o0
	fcmpne32	%f30,	%f2,	%l1
	edge8n	%g2,	%g6,	%l5
	move	%icc,	%g3,	%o5
	movvc	%icc,	%i7,	%o1
	popc	0x197A,	%l0
	edge16n	%o7,	%o4,	%g1
	popc	%i5,	%g7
	movg	%xcc,	%o6,	%g4
	addccc	%o2,	0x157D,	%i6
	movneg	%icc,	%i4,	%i1
	fmovsvc	%xcc,	%f10,	%f31
	edge8l	%l4,	%i0,	%o3
	umul	%l2,	%l3,	%l6
	fmovscs	%icc,	%f0,	%f4
	ld	[%l7 + 0x3C],	%f5
	move	%xcc,	%i3,	%i2
	edge16	%o0,	%l1,	%g2
	save %g6, 0x0459, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g3,	%g5,	%o5
	fmovrse	%i7,	%f29,	%f19
	srax	%l0,	0x00,	%o1
	udivcc	%o4,	0x008F,	%g1
	restore %o7, %g7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o6,	%g4,	%o2
	edge32	%i4,	%i1,	%i6
	mulscc	%i0,	%l4,	%o3
	subc	%l3,	0x1E97,	%l6
	addc	%i3,	%l2,	%i2
	movcc	%xcc,	%o0,	%l1
	sll	%g6,	0x1D,	%g2
	fmovrse	%l5,	%f4,	%f23
	fmovdg	%icc,	%f18,	%f26
	srl	%g3,	0x0E,	%o5
	popc	%g5,	%i7
	edge8n	%l0,	%o4,	%o1
	edge32l	%o7,	%g1,	%i5
	fmuld8sux16	%f0,	%f15,	%f0
	andn	%o6,	0x1AF1,	%g4
	fmovdge	%icc,	%f21,	%f25
	movrgez	%g7,	0x034,	%i4
	orn	%i1,	0x1511,	%o2
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	movvs	%icc,	%i6,	%l3
	alignaddr	%l6,	%i3,	%o3
	movrne	%i2,	%o0,	%l1
	movleu	%icc,	%g6,	%g2
	or	%l2,	%g3,	%o5
	fandnot2s	%f23,	%f18,	%f25
	movrne	%g5,	0x30D,	%l5
	fmovdneg	%icc,	%f27,	%f29
	srax	%i7,	0x19,	%o4
	movrgz	%o1,	%o7,	%l0
	mova	%xcc,	%i5,	%g1
	stb	%g4,	[%l7 + 0x30]
	move	%icc,	%g7,	%i4
	edge16l	%i1,	%o6,	%o2
	edge8l	%l4,	%i6,	%l3
	or	%l6,	0x1D18,	%i0
	fnor	%f18,	%f16,	%f20
	array16	%o3,	%i3,	%i2
	edge16	%o0,	%l1,	%g2
	ldsb	[%l7 + 0x6C],	%g6
	fmovrse	%l2,	%f5,	%f9
	edge8ln	%o5,	%g5,	%l5
	movrlz	%g3,	%i7,	%o1
	edge16n	%o4,	%l0,	%o7
	sra	%i5,	%g1,	%g7
	edge8	%i4,	%g4,	%o6
	edge16n	%o2,	%i1,	%l4
	addcc	%l3,	%i6,	%l6
	smul	%o3,	%i0,	%i2
	fmovdvc	%icc,	%f12,	%f12
	udivx	%i3,	0x1C25,	%l1
	sllx	%g2,	%g6,	%o0
	movcs	%icc,	%l2,	%g5
	sub	%o5,	%l5,	%g3
	fmovsvs	%xcc,	%f0,	%f13
	fzeros	%f19
	stb	%o1,	[%l7 + 0x2E]
	fmovrslez	%i7,	%f14,	%f29
	fmuld8sux16	%f25,	%f18,	%f30
	edge8	%l0,	%o7,	%i5
	fmovs	%f21,	%f24
	edge16ln	%o4,	%g7,	%g1
	ldd	[%l7 + 0x10],	%f26
	movn	%icc,	%i4,	%o6
	lduh	[%l7 + 0x60],	%o2
	xnorcc	%i1,	0x0946,	%g4
	sethi	0x0628,	%l3
	edge8l	%i6,	%l4,	%o3
	sub	%l6,	%i0,	%i2
	sll	%i3,	%l1,	%g6
	srlx	%g2,	%o0,	%g5
	movcs	%xcc,	%o5,	%l5
	ld	[%l7 + 0x10],	%f18
	addccc	%g3,	%l2,	%i7
	addc	%l0,	0x0945,	%o1
	movle	%icc,	%i5,	%o7
	fand	%f12,	%f8,	%f14
	sra	%o4,	0x00,	%g7
	edge32ln	%g1,	%i4,	%o2
	sra	%i1,	%o6,	%l3
	addccc	%i6,	0x088A,	%l4
	fmul8x16	%f13,	%f16,	%f16
	xorcc	%o3,	%g4,	%i0
	edge8l	%i2,	%l6,	%l1
	sdivx	%i3,	0x1EFB,	%g2
	nop
	set	0x48, %l2
	ldsw	[%l7 + %l2],	%o0
	st	%f12,	[%l7 + 0x68]
	movge	%xcc,	%g5,	%g6
	edge16	%o5,	%l5,	%g3
	movgu	%xcc,	%l2,	%l0
	edge16l	%i7,	%i5,	%o7
	for	%f0,	%f24,	%f16
	and	%o1,	0x08B5,	%g7
	movg	%icc,	%o4,	%i4
	alignaddrl	%o2,	%g1,	%i1
	ld	[%l7 + 0x6C],	%f26
	subccc	%l3,	0x1A55,	%i6
	orn	%l4,	%o6,	%o3
	xor	%i0,	%i2,	%g4
	ldsh	[%l7 + 0x38],	%l6
	movn	%icc,	%l1,	%i3
	sir	0x0100
	lduw	[%l7 + 0x7C],	%g2
	edge32n	%g5,	%g6,	%o0
	array16	%l5,	%o5,	%g3
	siam	0x1
	sll	%l0,	%i7,	%i5
	fmovrslez	%l2,	%f11,	%f7
	edge32	%o1,	%o7,	%g7
	movleu	%xcc,	%i4,	%o4
	mulscc	%o2,	0x1D81,	%g1
	orn	%l3,	0x0041,	%i6
	sdiv	%i1,	0x0303,	%o6
	fxnor	%f30,	%f6,	%f6
	mulscc	%l4,	0x176F,	%i0
	addcc	%o3,	0x0590,	%g4
	ldub	[%l7 + 0x23],	%i2
	movle	%xcc,	%l6,	%l1
	fandnot1	%f0,	%f24,	%f22
	alignaddrl	%i3,	%g2,	%g5
	stx	%o0,	[%l7 + 0x68]
	umulcc	%l5,	0x1244,	%g6
	udivcc	%o5,	0x17DA,	%l0
	mova	%icc,	%g3,	%i5
	mova	%xcc,	%l2,	%o1
	popc	0x0F1F,	%i7
	edge8n	%g7,	%o7,	%i4
	movcs	%icc,	%o4,	%g1
	xorcc	%l3,	0x04C3,	%i6
	fmul8x16	%f16,	%f26,	%f28
	movre	%o2,	%i1,	%o6
	fcmpgt16	%f12,	%f28,	%i0
	xor	%l4,	0x0E97,	%o3
	array32	%g4,	%l6,	%l1
	fcmple32	%f4,	%f8,	%i2
	fnegd	%f30,	%f12
	fxnor	%f0,	%f20,	%f2
	smul	%g2,	0x1E66,	%i3
	sdiv	%g5,	0x0457,	%o0
	fands	%f3,	%f11,	%f6
	movpos	%icc,	%l5,	%o5
	subcc	%g6,	0x153F,	%g3
	fcmple32	%f28,	%f20,	%i5
	movleu	%icc,	%l2,	%l0
	and	%i7,	%o1,	%o7
	add	%i4,	%o4,	%g1
	xor	%g7,	%l3,	%o2
	sth	%i6,	[%l7 + 0x18]
	movn	%icc,	%i1,	%o6
	udivx	%l4,	0x07D0,	%o3
	srl	%i0,	%g4,	%l1
	fmovrde	%l6,	%f10,	%f12
	mulscc	%g2,	0x0424,	%i3
	movge	%icc,	%i2,	%g5
	edge16ln	%l5,	%o0,	%g6
	movrlez	%o5,	0x247,	%g3
	fmovsl	%xcc,	%f3,	%f11
	movne	%icc,	%l2,	%l0
	sllx	%i5,	0x0D,	%o1
	udivcc	%o7,	0x0044,	%i4
	edge8n	%o4,	%i7,	%g7
	popc	0x01F7,	%l3
	udiv	%g1,	0x11E6,	%i6
	movrgz	%i1,	0x12B,	%o2
	edge8ln	%o6,	%o3,	%l4
	fands	%f0,	%f15,	%f31
	fcmpne16	%f14,	%f18,	%g4
	subccc	%l1,	%i0,	%g2
	fxor	%f6,	%f6,	%f6
	smul	%i3,	%l6,	%i2
	fmul8x16al	%f3,	%f16,	%f12
	fcmpgt16	%f14,	%f10,	%g5
	popc	%l5,	%o0
	fabsd	%f22,	%f14
	mulscc	%g6,	0x0CAE,	%o5
	movl	%icc,	%g3,	%l0
	edge16	%l2,	%o1,	%o7
	edge8	%i5,	%o4,	%i7
	lduh	[%l7 + 0x58],	%i4
	udivx	%g7,	0x0E9E,	%l3
	fxnors	%f20,	%f10,	%f23
	edge32ln	%i6,	%g1,	%o2
	addcc	%i1,	0x071D,	%o6
	sllx	%l4,	0x1F,	%o3
	popc	0x1054,	%g4
	fmovsvc	%xcc,	%f24,	%f13
	restore %i0, 0x1C44, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f6,	%f10,	%f20
	fmul8x16	%f7,	%f20,	%f4
	sethi	0x1768,	%i3
	sdivx	%l6,	0x063D,	%i2
	lduh	[%l7 + 0x62],	%g5
	movrlez	%l1,	%l5,	%o0
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	movrne	%l2,	0x18E,	%o1
	xor	%o7,	%g3,	%o4
	srax	%i7,	%i5,	%i4
	edge16ln	%g7,	%i6,	%g1
	ldd	[%l7 + 0x48],	%l2
	srlx	%i1,	0x0B,	%o6
	fmovsneg	%icc,	%f24,	%f9
	movneg	%xcc,	%o2,	%o3
	fnand	%f12,	%f28,	%f28
	sir	0x1499
	movre	%l4,	%i0,	%g2
	orcc	%g4,	0x02C9,	%l6
	addc	%i2,	%i3,	%l1
	movl	%xcc,	%g5,	%o0
	array32	%o5,	%g6,	%l0
	movneg	%icc,	%l5,	%o1
	ldsw	[%l7 + 0x24],	%o7
	xnorcc	%g3,	%l2,	%o4
	fsrc1	%f8,	%f12
	fors	%f21,	%f27,	%f1
	fmovdneg	%xcc,	%f15,	%f21
	sdivcc	%i7,	0x06DE,	%i4
	fornot1s	%f6,	%f24,	%f6
	fcmpne32	%f16,	%f8,	%i5
	mulx	%i6,	%g7,	%l3
	ldsb	[%l7 + 0x4A],	%i1
	movrlez	%g1,	%o2,	%o6
	srlx	%o3,	%i0,	%g2
	addcc	%l4,	0x0491,	%l6
	fpmerge	%f21,	%f2,	%f30
	alignaddrl	%g4,	%i3,	%l1
	add	%g5,	%i2,	%o0
	movpos	%xcc,	%g6,	%l0
	sllx	%o5,	%l5,	%o7
	ldd	[%l7 + 0x18],	%o0
	move	%icc,	%l2,	%g3
	and	%o4,	%i7,	%i5
	bshuffle	%f30,	%f20,	%f8
	fmovscc	%xcc,	%f20,	%f10
	array16	%i4,	%i6,	%l3
	array16	%g7,	%g1,	%o2
	srax	%i1,	0x16,	%o3
	movvc	%icc,	%i0,	%o6
	edge16	%l4,	%g2,	%g4
	movcc	%icc,	%i3,	%l6
	movleu	%icc,	%g5,	%l1
	movgu	%icc,	%i2,	%g6
	fmul8x16al	%f7,	%f18,	%f30
	alignaddr	%o0,	%l0,	%o5
	srlx	%l5,	0x10,	%o7
	stx	%o1,	[%l7 + 0x40]
	stb	%l2,	[%l7 + 0x11]
	fpadd16	%f18,	%f22,	%f10
	fmovrdlez	%o4,	%f28,	%f8
	fpadd32s	%f22,	%f10,	%f4
	mulscc	%g3,	0x0A28,	%i5
	movrlz	%i7,	%i4,	%i6
	edge16n	%g7,	%g1,	%l3
	edge8	%o2,	%i1,	%o3
	ldd	[%l7 + 0x60],	%o6
	and	%l4,	%g2,	%i0
	fpack16	%f30,	%f6
	and	%g4,	0x0E33,	%l6
	stx	%g5,	[%l7 + 0x08]
	st	%f1,	[%l7 + 0x78]
	edge16n	%i3,	%i2,	%l1
	movrgz	%o0,	0x071,	%g6
	fone	%f6
	ldd	[%l7 + 0x20],	%l0
	fand	%f20,	%f8,	%f28
	std	%f22,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%f26
	fzeros	%f14
	xor	%l5,	%o5,	%o1
	srl	%o7,	0x19,	%o4
	fmovdne	%xcc,	%f25,	%f26
	andn	%g3,	0x0FCD,	%l2
	andn	%i5,	0x00AD,	%i7
	mulx	%i6,	0x1AA7,	%g7
	std	%f26,	[%l7 + 0x48]
	mulscc	%i4,	%g1,	%l3
	alignaddr	%o2,	%o3,	%o6
	st	%f3,	[%l7 + 0x40]
	movl	%xcc,	%l4,	%i1
	fandnot2	%f0,	%f10,	%f24
	fmovsl	%xcc,	%f26,	%f0
	movl	%xcc,	%i0,	%g2
	save %g4, %l6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f18,	%f24,	%f20
	ld	[%l7 + 0x5C],	%f28
	fmovscc	%icc,	%f10,	%f17
	movgu	%icc,	%g5,	%i2
	edge16l	%o0,	%g6,	%l1
	edge32l	%l0,	%o5,	%l5
	fcmple32	%f10,	%f2,	%o1
	sdiv	%o4,	0x1D8F,	%g3
	sethi	0x0E03,	%l2
	fandnot1s	%f16,	%f7,	%f10
	fpsub16s	%f15,	%f15,	%f23
	xorcc	%i5,	0x1C05,	%i7
	array8	%o7,	%i6,	%i4
	movrgez	%g7,	0x274,	%l3
	smulcc	%o2,	%o3,	%o6
	movrgz	%g1,	0x380,	%l4
	xnorcc	%i1,	0x000D,	%g2
	movpos	%xcc,	%g4,	%l6
	fnot2s	%f3,	%f27
	sdivx	%i3,	0x06F5,	%i0
	addc	%g5,	%i2,	%g6
	edge32ln	%o0,	%l1,	%o5
	orn	%l5,	%l0,	%o4
	umulcc	%g3,	%l2,	%o1
	fcmple32	%f12,	%f12,	%i5
	sdivx	%o7,	0x101D,	%i7
	save %i6, %i4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f12,	%f24
	ldsw	[%l7 + 0x60],	%l3
	subc	%o3,	%o2,	%g1
	movre	%l4,	0x0AE,	%i1
	edge16l	%o6,	%g2,	%l6
	movle	%xcc,	%g4,	%i3
	sdiv	%i0,	0x0D32,	%i2
	fmovdvs	%xcc,	%f4,	%f26
	ldd	[%l7 + 0x38],	%g4
	movl	%icc,	%g6,	%l1
	sub	%o5,	%o0,	%l5
	movneg	%xcc,	%l0,	%o4
	movcs	%icc,	%g3,	%l2
	fpadd32s	%f20,	%f1,	%f5
	movcs	%icc,	%i5,	%o1
	umulcc	%i7,	%i6,	%i4
	ldsb	[%l7 + 0x0B],	%g7
	fsrc2s	%f8,	%f8
	stb	%o7,	[%l7 + 0x13]
	edge8ln	%l3,	%o2,	%o3
	save %l4, 0x183D, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%icc,	%f27,	%f1
	fmovdcc	%icc,	%f15,	%f13
	fpsub16s	%f8,	%f21,	%f31
	ldsh	[%l7 + 0x0E],	%g1
	edge16n	%g2,	%l6,	%o6
	subccc	%i3,	0x0D94,	%i0
	array32	%i2,	%g5,	%g6
	ldsb	[%l7 + 0x3B],	%g4
	movgu	%icc,	%l1,	%o0
	edge32	%l5,	%l0,	%o5
	ldd	[%l7 + 0x38],	%g2
	sdivcc	%l2,	0x0392,	%i5
	fmovrslz	%o1,	%f9,	%f23
	fcmple32	%f16,	%f2,	%i7
	fpack32	%f12,	%f14,	%f6
	fornot2	%f24,	%f28,	%f0
	add	%o4,	%i6,	%g7
	fmovdn	%xcc,	%f18,	%f22
	edge16ln	%i4,	%o7,	%l3
	st	%f2,	[%l7 + 0x3C]
	mulx	%o3,	%l4,	%o2
	fornot1	%f2,	%f24,	%f24
	sdivcc	%g1,	0x19B3,	%g2
	edge16n	%l6,	%i1,	%i3
	srax	%o6,	%i2,	%i0
	fxnors	%f22,	%f31,	%f15
	fmul8sux16	%f16,	%f24,	%f20
	edge8ln	%g5,	%g6,	%l1
	edge32ln	%g4,	%l5,	%l0
	stx	%o5,	[%l7 + 0x20]
	fmovdn	%icc,	%f9,	%f16
	mova	%icc,	%g3,	%l2
	fcmpd	%fcc2,	%f30,	%f16
	andcc	%o0,	%i5,	%o1
	movge	%xcc,	%i7,	%o4
	ldx	[%l7 + 0x38],	%i6
	orn	%g7,	%o7,	%l3
	movg	%xcc,	%i4,	%l4
	fmul8ulx16	%f16,	%f14,	%f18
	movl	%icc,	%o2,	%o3
	andncc	%g1,	%g2,	%i1
	edge8l	%l6,	%i3,	%o6
	fnors	%f0,	%f14,	%f31
	fandnot2	%f30,	%f24,	%f28
	edge32n	%i0,	%g5,	%g6
	lduh	[%l7 + 0x6C],	%l1
	fexpand	%f18,	%f14
	edge16ln	%i2,	%l5,	%g4
	movgu	%icc,	%l0,	%g3
	sra	%l2,	0x04,	%o0
	lduw	[%l7 + 0x3C],	%o5
	addccc	%i5,	0x0A96,	%i7
	fmovrde	%o1,	%f6,	%f26
	sethi	0x1C98,	%o4
	restore %g7, 0x05B3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f12,	%f18,	%f10
	edge32l	%l3,	%o7,	%l4
	fandnot1	%f12,	%f20,	%f30
	edge32n	%i4,	%o3,	%o2
	movn	%xcc,	%g1,	%i1
	array32	%l6,	%i3,	%g2
	fnor	%f6,	%f4,	%f6
	sllx	%o6,	0x12,	%g5
	lduw	[%l7 + 0x34],	%i0
	subcc	%l1,	%i2,	%g6
	fmovrdgz	%l5,	%f2,	%f20
	edge32ln	%g4,	%g3,	%l2
	andn	%o0,	0x0FBC,	%l0
	sll	%i5,	0x02,	%o5
	fcmpgt16	%f14,	%f24,	%i7
	orcc	%o1,	%o4,	%i6
	ldsb	[%l7 + 0x28],	%l3
	edge8ln	%g7,	%l4,	%i4
	sethi	0x13BD,	%o3
	movle	%xcc,	%o7,	%o2
	movrgez	%i1,	0x2C0,	%l6
	movvs	%xcc,	%i3,	%g1
	sllx	%g2,	0x0C,	%g5
	fabsd	%f18,	%f0
	st	%f6,	[%l7 + 0x58]
	movrgez	%o6,	%i0,	%l1
	edge8n	%i2,	%g6,	%l5
	ldd	[%l7 + 0x10],	%g2
	udivx	%g4,	0x18AE,	%l2
	xor	%o0,	0x08DB,	%l0
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%f30
	movrne	%o5,	0x008,	%i7
	edge32n	%o1,	%o4,	%i6
	movne	%icc,	%i5,	%l3
	or	%g7,	%i4,	%o3
	andcc	%o7,	0x0CCE,	%l4
	alignaddrl	%o2,	%i1,	%i3
	udiv	%l6,	0x1669,	%g2
	mova	%icc,	%g1,	%o6
	movneg	%xcc,	%i0,	%l1
	edge8l	%g5,	%g6,	%l5
	fcmple16	%f30,	%f2,	%g3
	edge16n	%i2,	%g4,	%o0
	fmovspos	%xcc,	%f24,	%f28
	fmovd	%f30,	%f12
	fpsub32s	%f10,	%f1,	%f27
	fcmps	%fcc0,	%f7,	%f26
	alignaddr	%l2,	%l0,	%i7
	or	%o5,	%o1,	%i6
	andn	%i5,	%o4,	%g7
	andn	%l3,	%i4,	%o7
	movle	%xcc,	%o3,	%o2
	std	%f0,	[%l7 + 0x48]
	fmuld8ulx16	%f20,	%f11,	%f26
	movneg	%xcc,	%l4,	%i3
	st	%f25,	[%l7 + 0x34]
	alignaddr	%i1,	%g2,	%l6
	andncc	%o6,	%i0,	%l1
	array16	%g5,	%g6,	%l5
	sir	0x1B8E
	movle	%xcc,	%g1,	%i2
	for	%f8,	%f18,	%f22
	fornot2s	%f17,	%f16,	%f26
	fnegs	%f4,	%f4
	fmovrslz	%g3,	%f14,	%f0
	lduh	[%l7 + 0x70],	%g4
	edge16ln	%o0,	%l2,	%l0
	edge8n	%o5,	%i7,	%i6
	addcc	%o1,	%o4,	%i5
	edge16ln	%g7,	%i4,	%l3
	umul	%o3,	%o7,	%l4
	fmovd	%f0,	%f8
	ldd	[%l7 + 0x08],	%f10
	orcc	%o2,	0x0D0E,	%i1
	pdist	%f30,	%f14,	%f2
	ld	[%l7 + 0x68],	%f0
	st	%f7,	[%l7 + 0x70]
	movneg	%xcc,	%g2,	%i3
	fpsub32	%f6,	%f6,	%f20
	sllx	%o6,	%l6,	%i0
	movge	%xcc,	%g5,	%g6
	movrne	%l1,	%g1,	%i2
	xorcc	%l5,	%g3,	%g4
	bshuffle	%f28,	%f22,	%f24
	lduw	[%l7 + 0x14],	%l2
	udivx	%o0,	0x0833,	%l0
	ldsh	[%l7 + 0x1C],	%o5
	fzero	%f10
	subccc	%i7,	%i6,	%o1
	edge8	%i5,	%o4,	%g7
	smul	%l3,	%o3,	%o7
	xnor	%l4,	0x1F87,	%i4
	alignaddr	%o2,	%i1,	%i3
	sdivcc	%o6,	0x0497,	%l6
	sir	0x0839
	movl	%xcc,	%i0,	%g5
	edge32n	%g2,	%l1,	%g1
	xor	%g6,	0x17F8,	%i2
	stw	%g3,	[%l7 + 0x60]
	subccc	%l5,	0x1405,	%l2
	movpos	%xcc,	%o0,	%g4
	udivx	%o5,	0x1583,	%i7
	xnorcc	%i6,	%l0,	%o1
	fexpand	%f13,	%f4
	fmovsa	%icc,	%f24,	%f24
	edge8l	%o4,	%i5,	%l3
	move	%icc,	%o3,	%o7
	fmovsvc	%icc,	%f21,	%f22
	movrgez	%l4,	0x2E7,	%i4
	xorcc	%o2,	%g7,	%i1
	movle	%icc,	%i3,	%o6
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%i6
	movl	%icc,	%i0,	%g2
	add	%g5,	%g1,	%g6
	edge16	%i2,	%g3,	%l1
	mulx	%l5,	%o0,	%l2
	srax	%g4,	0x0B,	%i7
	array32	%o5,	%i6,	%l0
	popc	%o1,	%o4
	movvc	%icc,	%l3,	%i5
	array16	%o3,	%l4,	%i4
	srlx	%o2,	%g7,	%i1
	addcc	%i3,	%o6,	%o7
	movleu	%icc,	%i0,	%g2
	udivcc	%l6,	0x0931,	%g5
	addc	%g6,	0x0543,	%i2
	nop
	set	0x32, %o7
	stb	%g3,	[%l7 + %o7]
	sth	%g1,	[%l7 + 0x4A]
	mulscc	%l5,	%l1,	%o0
	edge32ln	%l2,	%g4,	%o5
	fmovs	%f10,	%f30
	alignaddr	%i6,	%i7,	%l0
	sdiv	%o1,	0x1423,	%o4
	movcc	%xcc,	%l3,	%i5
	fcmple16	%f14,	%f26,	%o3
	movl	%icc,	%l4,	%o2
	edge8	%i4,	%g7,	%i1
	subccc	%o6,	0x14AD,	%o7
	array8	%i0,	%g2,	%l6
	ldub	[%l7 + 0x58],	%g5
	xor	%i3,	%i2,	%g6
	sdivx	%g3,	0x133C,	%g1
	ld	[%l7 + 0x6C],	%f6
	nop
	set	0x54, %o0
	stw	%l5,	[%l7 + %o0]
	movle	%icc,	%l1,	%l2
	fmovrde	%g4,	%f8,	%f10
	move	%icc,	%o0,	%o5
	xor	%i6,	%i7,	%o1
	sethi	0x070D,	%o4
	subccc	%l0,	%l3,	%i5
	ldsw	[%l7 + 0x30],	%o3
	udivcc	%o2,	0x183E,	%l4
	ldsh	[%l7 + 0x14],	%g7
	movrgz	%i1,	%i4,	%o6
	umul	%o7,	%g2,	%i0
	addccc	%l6,	0x09A4,	%i3
	fmovsle	%icc,	%f4,	%f8
	xor	%g5,	%i2,	%g6
	sll	%g1,	0x10,	%l5
	subcc	%g3,	0x0BC3,	%l2
	xorcc	%l1,	0x01B0,	%g4
	fcmpne32	%f12,	%f4,	%o0
	movrgz	%i6,	%o5,	%i7
	sdivx	%o1,	0x1DED,	%l0
	save %l3, 0x15FB, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f4
	edge32	%o3,	%i5,	%o2
	xnor	%l4,	%i1,	%g7
	xor	%i4,	%o7,	%o6
	movneg	%xcc,	%g2,	%l6
	movneg	%icc,	%i3,	%i0
	movneg	%icc,	%g5,	%i2
	addcc	%g1,	%g6,	%l5
	mova	%xcc,	%g3,	%l1
	mova	%xcc,	%g4,	%l2
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%f8
	fpackfix	%f18,	%f19
	addc	%o0,	%i6,	%i7
	movpos	%xcc,	%o1,	%l0
	fcmpd	%fcc1,	%f8,	%f28
	sll	%l3,	%o5,	%o4
	array8	%i5,	%o2,	%l4
	fabss	%f6,	%f5
	addcc	%i1,	%g7,	%o3
	edge8ln	%i4,	%o6,	%g2
	popc	0x0C9D,	%o7
	lduw	[%l7 + 0x18],	%i3
	edge8	%l6,	%i0,	%g5
	sth	%i2,	[%l7 + 0x2C]
	udivcc	%g6,	0x0DD8,	%g1
	movre	%l5,	%l1,	%g3
	edge8n	%l2,	%o0,	%g4
	srax	%i7,	0x0F,	%o1
	orcc	%l0,	%i6,	%o5
	sdivcc	%o4,	0x1D1C,	%l3
	movn	%xcc,	%i5,	%l4
	edge16l	%i1,	%o2,	%o3
	edge8	%g7,	%o6,	%i4
	addcc	%g2,	%i3,	%l6
	movl	%icc,	%o7,	%i0
	srlx	%g5,	%g6,	%g1
	mulx	%i2,	%l1,	%l5
	movl	%xcc,	%l2,	%o0
	andcc	%g3,	0x0D2C,	%g4
	edge32ln	%o1,	%l0,	%i7
	sth	%i6,	[%l7 + 0x6A]
	mulscc	%o5,	%o4,	%l3
	edge8	%i5,	%i1,	%l4
	smulcc	%o2,	%o3,	%g7
	movrlz	%i4,	0x0AC,	%g2
	fmovspos	%xcc,	%f25,	%f20
	sdiv	%o6,	0x1112,	%l6
	fmovscc	%icc,	%f24,	%f13
	lduh	[%l7 + 0x52],	%o7
	st	%f10,	[%l7 + 0x58]
	edge8	%i0,	%i3,	%g5
	andcc	%g6,	0x1908,	%g1
	mulx	%l1,	%l5,	%l2
	sub	%i2,	0x0457,	%o0
	array8	%g3,	%o1,	%g4
	xor	%l0,	%i6,	%o5
	alignaddrl	%i7,	%l3,	%o4
	fmovrdne	%i1,	%f20,	%f24
	xorcc	%l4,	%o2,	%o3
	movrlez	%i5,	0x179,	%g7
	movle	%xcc,	%i4,	%g2
	addc	%o6,	0x1EB3,	%o7
	orncc	%l6,	%i0,	%i3
	popc	%g5,	%g6
	movleu	%xcc,	%l1,	%g1
	edge8n	%l5,	%i2,	%l2
	nop
	set	0x40, %g7
	ldx	[%l7 + %g7],	%g3
	udivx	%o0,	0x18BD,	%o1
	andncc	%g4,	%l0,	%i6
	ldub	[%l7 + 0x64],	%o5
	sdivx	%i7,	0x1F4F,	%o4
	move	%xcc,	%i1,	%l3
	alignaddr	%o2,	%l4,	%i5
	or	%o3,	%g7,	%i4
	fmovrdne	%g2,	%f20,	%f10
	movre	%o6,	%l6,	%i0
	faligndata	%f10,	%f28,	%f14
	mova	%icc,	%i3,	%g5
	ldsh	[%l7 + 0x1E],	%g6
	sra	%o7,	0x0A,	%l1
	fmovsa	%icc,	%f20,	%f30
	mulx	%g1,	0x0569,	%i2
	fcmpgt32	%f26,	%f20,	%l2
	fnot1	%f0,	%f10
	sra	%l5,	0x15,	%o0
	fmovrse	%g3,	%f22,	%f18
	movneg	%xcc,	%o1,	%l0
	subc	%g4,	0x0365,	%i6
	edge32	%i7,	%o4,	%o5
	movrlez	%i1,	%l3,	%o2
	andcc	%l4,	%o3,	%i5
	movle	%xcc,	%g7,	%i4
	stb	%g2,	[%l7 + 0x2F]
	fcmpne16	%f4,	%f16,	%o6
	fcmpeq32	%f14,	%f2,	%l6
	xorcc	%i3,	0x0494,	%i0
	sra	%g6,	0x0D,	%g5
	alignaddrl	%o7,	%l1,	%i2
	sth	%g1,	[%l7 + 0x78]
	edge32l	%l2,	%l5,	%o0
	movne	%xcc,	%o1,	%l0
	udiv	%g4,	0x0C02,	%g3
	fzeros	%f2
	lduh	[%l7 + 0x1E],	%i6
	fcmpgt16	%f16,	%f6,	%i7
	srlx	%o4,	%i1,	%o5
	or	%o2,	0x0BEF,	%l4
	fmovdneg	%icc,	%f8,	%f27
	sll	%l3,	0x14,	%o3
	sllx	%i5,	%g7,	%i4
	stx	%g2,	[%l7 + 0x70]
	fmovsle	%icc,	%f27,	%f6
	fmovs	%f7,	%f22
	sdivx	%o6,	0x1446,	%l6
	smul	%i3,	0x120D,	%g6
	udivx	%i0,	0x1DF1,	%g5
	array16	%l1,	%o7,	%g1
	fcmple16	%f4,	%f22,	%i2
	movrlz	%l2,	0x131,	%l5
	stw	%o0,	[%l7 + 0x20]
	sub	%l0,	%o1,	%g4
	fmovdvs	%xcc,	%f31,	%f2
	edge8n	%i6,	%i7,	%o4
	subc	%i1,	0x0FAB,	%g3
	edge32ln	%o2,	%o5,	%l4
	fzero	%f28
	fands	%f8,	%f25,	%f10
	edge32ln	%o3,	%i5,	%g7
	st	%f11,	[%l7 + 0x1C]
	sethi	0x1DD0,	%l3
	fmovrse	%g2,	%f19,	%f29
	stw	%i4,	[%l7 + 0x3C]
	andncc	%o6,	%l6,	%i3
	fand	%f22,	%f0,	%f22
	movgu	%xcc,	%g6,	%g5
	movrne	%l1,	0x172,	%o7
	fmovdgu	%icc,	%f20,	%f17
	sdiv	%g1,	0x101B,	%i2
	ld	[%l7 + 0x78],	%f28
	edge16n	%l2,	%l5,	%i0
	save %l0, %o1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f2,	%f8
	array32	%o0,	%i7,	%i6
	fpack32	%f10,	%f28,	%f26
	fmovsn	%icc,	%f5,	%f21
	ldx	[%l7 + 0x18],	%o4
	ldsb	[%l7 + 0x77],	%g3
	array16	%o2,	%i1,	%o5
	movneg	%xcc,	%l4,	%i5
	lduh	[%l7 + 0x56],	%g7
	faligndata	%f26,	%f14,	%f20
	move	%icc,	%o3,	%l3
	fpsub16	%f14,	%f22,	%f8
	edge32ln	%g2,	%i4,	%l6
	addcc	%i3,	%o6,	%g5
	fmovdcc	%xcc,	%f12,	%f19
	lduh	[%l7 + 0x2C],	%l1
	st	%f11,	[%l7 + 0x74]
	fmovse	%xcc,	%f22,	%f14
	movvc	%xcc,	%o7,	%g6
	andn	%i2,	0x1F3D,	%l2
	fmuld8sux16	%f31,	%f10,	%f14
	edge32l	%g1,	%l5,	%i0
	sdiv	%o1,	0x01B9,	%l0
	stb	%o0,	[%l7 + 0x51]
	fmovsg	%icc,	%f6,	%f2
	fmovsne	%xcc,	%f25,	%f6
	smulcc	%g4,	0x129E,	%i6
	array32	%o4,	%i7,	%o2
	fandnot2	%f10,	%f20,	%f28
	fmovs	%f30,	%f22
	movrne	%g3,	0x37D,	%i1
	addcc	%l4,	0x1DBB,	%i5
	array32	%g7,	%o5,	%o3
	fandnot1	%f8,	%f20,	%f10
	sub	%l3,	%i4,	%g2
	movvc	%xcc,	%l6,	%i3
	xnor	%g5,	0x102C,	%l1
	udivcc	%o7,	0x0843,	%g6
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	ldd	[%l7 + 0x68],	%g0
	array16	%l5,	%i2,	%o1
	edge32n	%l0,	%o0,	%i0
	edge8l	%i6,	%g4,	%o4
	fmovdpos	%icc,	%f12,	%f15
	sdivcc	%o2,	0x1C53,	%i7
	array16	%i1,	%l4,	%g3
	lduh	[%l7 + 0x1A],	%i5
	movvc	%xcc,	%o5,	%g7
	fnot2s	%f18,	%f10
	orncc	%o3,	%i4,	%g2
	fmovrdlz	%l6,	%f6,	%f4
	movcs	%icc,	%i3,	%l3
	movvc	%xcc,	%l1,	%g5
	edge32ln	%o7,	%o6,	%l2
	mulscc	%g1,	0x1E39,	%g6
	sra	%l5,	0x0E,	%o1
	mulscc	%i2,	%o0,	%l0
	restore %i6, %g4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x4C],	%o4
	array32	%o2,	%i7,	%l4
	udivcc	%i1,	0x1F30,	%i5
	stb	%g3,	[%l7 + 0x37]
	edge16n	%o5,	%o3,	%i4
	edge16ln	%g7,	%l6,	%i3
	fcmped	%fcc3,	%f4,	%f22
	fmovdl	%xcc,	%f5,	%f18
	fmul8ulx16	%f2,	%f22,	%f22
	movrgez	%g2,	%l1,	%g5
	mulscc	%o7,	%l3,	%o6
	mulscc	%g1,	0x1988,	%l2
	add	%g6,	%l5,	%o1
	movcs	%icc,	%i2,	%l0
	alignaddr	%o0,	%i6,	%g4
	movn	%icc,	%i0,	%o2
	array8	%o4,	%i7,	%i1
	addcc	%l4,	%i5,	%g3
	array32	%o5,	%o3,	%g7
	array32	%l6,	%i3,	%g2
	sethi	0x11B1,	%l1
	movrlez	%g5,	%o7,	%l3
	udivx	%o6,	0x070B,	%i4
	udivcc	%g1,	0x0863,	%g6
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	sth	%i2,	[%l7 + 0x42]
	edge8n	%l0,	%o1,	%i6
	alignaddr	%g4,	%o0,	%i0
	subccc	%o2,	0x0BB7,	%i7
	move	%xcc,	%i1,	%o4
	nop
	set	0x14, %i5
	stw	%i5,	[%l7 + %i5]
	movl	%xcc,	%l4,	%g3
	mulx	%o3,	0x1EAC,	%g7
	subccc	%o5,	0x12F9,	%l6
	movvs	%icc,	%i3,	%l1
	array32	%g2,	%g5,	%o7
	fxor	%f12,	%f16,	%f24
	movg	%xcc,	%l3,	%i4
	fzero	%f14
	edge8n	%g1,	%o6,	%l5
	nop
	set	0x25, %i1
	stb	%l2,	[%l7 + %i1]
	sir	0x061E
	fmovrdne	%i2,	%f6,	%f8
	fmovrdgez	%l0,	%f26,	%f30
	std	%f30,	[%l7 + 0x30]
	fmovsvc	%xcc,	%f12,	%f5
	fmovsneg	%icc,	%f24,	%f14
	save %o1, 0x0B06, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i6,	0x05DF,	%g4
	subcc	%o0,	%o2,	%i0
	fmovdgu	%xcc,	%f27,	%f29
	restore %i7, 0x1F83, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i5,	%o4,	%l4
	fmovrse	%g3,	%f27,	%f18
	xnor	%o3,	%g7,	%o5
	ldsw	[%l7 + 0x4C],	%l6
	alignaddrl	%l1,	%g2,	%i3
	xnor	%g5,	0x07CC,	%o7
	ldsb	[%l7 + 0x38],	%l3
	ld	[%l7 + 0x2C],	%f16
	mulscc	%i4,	0x0781,	%g1
	movle	%icc,	%o6,	%l5
	fmovscc	%icc,	%f5,	%f3
	sll	%i2,	%l0,	%l2
	ldd	[%l7 + 0x40],	%f4
	mulscc	%o1,	%g6,	%g4
	fors	%f16,	%f28,	%f28
	fnor	%f22,	%f22,	%f16
	fmovsneg	%xcc,	%f27,	%f23
	save %o0, %i6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i7,	%o2
	fcmpes	%fcc3,	%f17,	%f24
	fmovrdne	%i5,	%f2,	%f0
	add	%o4,	%i1,	%g3
	udivcc	%l4,	0x0900,	%o3
	popc	%g7,	%l6
	sethi	0x090D,	%o5
	siam	0x2
	movrlez	%g2,	0x3C3,	%i3
	sethi	0x1068,	%g5
	fmovdgu	%icc,	%f11,	%f19
	sra	%o7,	0x03,	%l1
	udiv	%i4,	0x0E8E,	%l3
	orn	%o6,	%g1,	%i2
	smul	%l0,	%l2,	%o1
	sllx	%l5,	0x0F,	%g4
	stb	%o0,	[%l7 + 0x64]
	edge16n	%g6,	%i0,	%i6
	udivcc	%o2,	0x1648,	%i7
	movpos	%icc,	%i5,	%i1
	fsrc2s	%f18,	%f11
	ldd	[%l7 + 0x10],	%g2
	edge8ln	%o4,	%l4,	%o3
	array16	%g7,	%l6,	%g2
	srl	%i3,	%o5,	%o7
	edge8ln	%l1,	%i4,	%l3
	movrlez	%g5,	0x287,	%o6
	fmovrslez	%g1,	%f9,	%f18
	fcmpgt32	%f2,	%f24,	%i2
	sdivx	%l0,	0x1DB3,	%l2
	ld	[%l7 + 0x44],	%f18
	fpsub32	%f20,	%f2,	%f2
	xor	%o1,	%l5,	%o0
	subcc	%g6,	0x1B0C,	%i0
	edge32l	%g4,	%i6,	%o2
	popc	%i5,	%i1
	fornot2	%f6,	%f14,	%f12
	and	%i7,	0x03C4,	%o4
	mova	%xcc,	%g3,	%l4
	sub	%o3,	%g7,	%g2
	fnors	%f30,	%f10,	%f8
	edge16l	%l6,	%o5,	%i3
	andcc	%o7,	%i4,	%l1
	ldd	[%l7 + 0x20],	%f20
	fsrc2s	%f14,	%f23
	fcmps	%fcc1,	%f23,	%f4
	addc	%l3,	%o6,	%g1
	movge	%icc,	%i2,	%g5
	movrlz	%l2,	%l0,	%l5
	fmovrdlz	%o1,	%f2,	%f0
	fnand	%f26,	%f10,	%f28
	array32	%g6,	%o0,	%g4
	edge32n	%i0,	%o2,	%i5
	fcmpeq16	%f26,	%f22,	%i6
	xorcc	%i7,	%o4,	%i1
	xnor	%l4,	%o3,	%g7
	add	%g3,	0x0528,	%l6
	save %o5, 0x1387, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o7,	%g2,	%i4
	lduw	[%l7 + 0x70],	%l1
	movrgez	%l3,	0x0CA,	%o6
	sir	0x1F2F
	st	%f24,	[%l7 + 0x6C]
	movl	%icc,	%i2,	%g5
	array8	%g1,	%l2,	%l5
	movvs	%xcc,	%o1,	%g6
	smulcc	%o0,	0x179A,	%l0
	umulcc	%i0,	0x037A,	%g4
	movg	%icc,	%o2,	%i5
	fcmpne32	%f18,	%f18,	%i7
	fpadd16s	%f5,	%f4,	%f14
	sllx	%o4,	%i6,	%l4
	movgu	%xcc,	%o3,	%g7
	fabsd	%f14,	%f20
	sub	%g3,	%i1,	%o5
	movpos	%xcc,	%i3,	%l6
	fornot2s	%f29,	%f12,	%f15
	fmovdneg	%icc,	%f14,	%f24
	movneg	%icc,	%g2,	%i4
	movn	%xcc,	%l1,	%l3
	ldd	[%l7 + 0x10],	%o6
	andncc	%o7,	%i2,	%g5
	movpos	%icc,	%g1,	%l5
	movleu	%icc,	%o1,	%g6
	sdivx	%o0,	0x1D73,	%l0
	andncc	%l2,	%i0,	%g4
	edge8n	%i5,	%o2,	%o4
	xorcc	%i7,	0x13E5,	%i6
	subc	%o3,	0x0EA1,	%l4
	sdivx	%g3,	0x0526,	%i1
	edge16n	%g7,	%i3,	%l6
	movcc	%icc,	%o5,	%g2
	fmovrde	%i4,	%f30,	%f28
	for	%f10,	%f24,	%f16
	andcc	%l1,	%o6,	%o7
	sll	%i2,	0x05,	%l3
	ldd	[%l7 + 0x20],	%f20
	lduw	[%l7 + 0x2C],	%g1
	fpmerge	%f0,	%f7,	%f20
	udivcc	%g5,	0x024E,	%l5
	smul	%o1,	%g6,	%o0
	fexpand	%f2,	%f8
	nop
	set	0x64, %o3
	lduw	[%l7 + %o3],	%l0
	fcmpd	%fcc0,	%f6,	%f2
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	fmovscs	%xcc,	%f7,	%f30
	stx	%i0,	[%l7 + 0x60]
	edge16ln	%o2,	%o4,	%i6
	movvc	%xcc,	%i7,	%o3
	movleu	%icc,	%g3,	%i1
	andcc	%g7,	%i3,	%l6
	edge16ln	%o5,	%l4,	%g2
	fmovscs	%xcc,	%f19,	%f1
	edge8ln	%l1,	%i4,	%o6
	fpsub16s	%f18,	%f7,	%f24
	fmovrsgz	%o7,	%f15,	%f9
	edge32n	%i2,	%g1,	%g5
	umul	%l3,	0x05AC,	%o1
	fmovscc	%icc,	%f1,	%f25
	addccc	%l5,	0x14FB,	%g6
	sub	%l0,	0x11FD,	%o0
	add	%l2,	0x17DF,	%g4
	edge8ln	%i0,	%i5,	%o2
	movpos	%icc,	%i6,	%i7
	ldub	[%l7 + 0x6F],	%o3
	fmuld8ulx16	%f7,	%f5,	%f0
	edge32	%g3,	%o4,	%i1
	sllx	%g7,	%i3,	%l6
	movcs	%xcc,	%o5,	%l4
	fmuld8ulx16	%f3,	%f29,	%f18
	edge16n	%l1,	%i4,	%g2
	edge16n	%o6,	%i2,	%o7
	fmuld8ulx16	%f6,	%f3,	%f6
	sll	%g1,	%l3,	%o1
	fcmpne32	%f8,	%f8,	%l5
	nop
	set	0x34, %g1
	stw	%g5,	[%l7 + %g1]
	orcc	%g6,	0x18CD,	%l0
	orncc	%l2,	%g4,	%i0
	mova	%xcc,	%i5,	%o2
	lduw	[%l7 + 0x0C],	%i6
	edge8l	%i7,	%o3,	%o0
	edge8	%o4,	%i1,	%g3
	udiv	%i3,	0x18C3,	%g7
	movneg	%icc,	%l6,	%o5
	edge8n	%l4,	%i4,	%l1
	sdivcc	%o6,	0x00B0,	%g2
	xnorcc	%o7,	%i2,	%g1
	ldd	[%l7 + 0x18],	%f6
	sllx	%o1,	%l3,	%g5
	xnor	%l5,	0x04AF,	%g6
	addc	%l2,	%g4,	%i0
	xor	%l0,	0x0757,	%i5
	sll	%o2,	0x05,	%i6
	xnor	%i7,	%o3,	%o0
	xorcc	%o4,	%g3,	%i1
	orn	%i3,	0x1024,	%g7
	add	%l6,	%l4,	%o5
	stx	%i4,	[%l7 + 0x68]
	std	%f16,	[%l7 + 0x58]
	fandnot1	%f8,	%f8,	%f2
	movpos	%icc,	%l1,	%o6
	movrgz	%o7,	%g2,	%i2
	sll	%o1,	%l3,	%g1
	fexpand	%f0,	%f30
	fmovdl	%icc,	%f22,	%f23
	movre	%g5,	%g6,	%l2
	fmovrse	%l5,	%f11,	%f20
	stw	%i0,	[%l7 + 0x68]
	udivcc	%l0,	0x1DED,	%g4
	edge8l	%o2,	%i5,	%i7
	sllx	%o3,	0x18,	%o0
	edge16n	%o4,	%i6,	%g3
	fmovsa	%xcc,	%f27,	%f20
	srax	%i1,	%g7,	%i3
	xnorcc	%l6,	0x023D,	%l4
	fmovs	%f29,	%f25
	movrgz	%i4,	0x244,	%l1
	xnor	%o6,	0x089F,	%o7
	addc	%o5,	0x078D,	%i2
	movne	%icc,	%g2,	%l3
	movcs	%icc,	%g1,	%g5
	sir	0x1B9E
	mova	%xcc,	%o1,	%l2
	edge32l	%g6,	%l5,	%i0
	ldsw	[%l7 + 0x58],	%l0
	edge16	%g4,	%o2,	%i7
	movcs	%xcc,	%o3,	%i5
	array8	%o0,	%o4,	%g3
	mulx	%i1,	0x113A,	%g7
	andncc	%i3,	%i6,	%l4
	sub	%i4,	0x0DE4,	%l6
	movcc	%icc,	%l1,	%o6
	orncc	%o5,	%i2,	%o7
	array8	%l3,	%g1,	%g2
	udivcc	%g5,	0x1BFC,	%o1
	ldsw	[%l7 + 0x74],	%l2
	stx	%l5,	[%l7 + 0x38]
	fmovrde	%i0,	%f4,	%f20
	fmovsvc	%xcc,	%f30,	%f4
	edge16ln	%g6,	%l0,	%o2
	ldsh	[%l7 + 0x0C],	%g4
	edge16	%i7,	%i5,	%o0
	lduw	[%l7 + 0x34],	%o3
	sth	%g3,	[%l7 + 0x5A]
	smul	%o4,	%g7,	%i3
	fandnot2	%f26,	%f6,	%f14
	subcc	%i6,	0x0FF5,	%i1
	fmovrsne	%l4,	%f9,	%f15
	movleu	%icc,	%i4,	%l6
	srl	%o6,	%o5,	%l1
	ldd	[%l7 + 0x30],	%f26
	movle	%icc,	%i2,	%l3
	movre	%o7,	0x08E,	%g1
	xnor	%g2,	%g5,	%l2
	movl	%icc,	%o1,	%i0
	sra	%l5,	%g6,	%o2
	fmovsneg	%icc,	%f14,	%f13
	array8	%l0,	%i7,	%g4
	xnorcc	%o0,	0x0C91,	%o3
	mulx	%i5,	0x197B,	%o4
	restore %g3, %g7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i1,	%i6,	%l4
	sll	%i4,	%o6,	%l6
	fmovsn	%xcc,	%f9,	%f18
	movgu	%xcc,	%o5,	%i2
	ldub	[%l7 + 0x3E],	%l1
	lduh	[%l7 + 0x44],	%l3
	edge32ln	%g1,	%g2,	%g5
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	array16	%o7,	%l5,	%o2
	move	%xcc,	%l0,	%i7
	subc	%g6,	0x0F54,	%o0
	edge16	%g4,	%i5,	%o3
	sll	%g3,	%o4,	%g7
	fmovrsgz	%i3,	%f29,	%f19
	movge	%icc,	%i1,	%i6
	fmovsa	%icc,	%f18,	%f19
	lduw	[%l7 + 0x10],	%i4
	subc	%l4,	%l6,	%o5
	alignaddr	%o6,	%l1,	%l3
	fmuld8ulx16	%f20,	%f2,	%f22
	lduw	[%l7 + 0x44],	%i2
	orcc	%g2,	0x0E61,	%g1
	edge8ln	%l2,	%g5,	%i0
	edge32	%o7,	%l5,	%o1
	xor	%l0,	0x13B0,	%i7
	subccc	%o2,	0x185A,	%o0
	sra	%g4,	0x02,	%g6
	andncc	%i5,	%g3,	%o4
	add	%o3,	%g7,	%i3
	sra	%i6,	%i1,	%i4
	ldx	[%l7 + 0x40],	%l4
	addccc	%o5,	%o6,	%l6
	movneg	%xcc,	%l1,	%i2
	sub	%g2,	0x161A,	%l3
	edge32ln	%g1,	%l2,	%g5
	fcmpeq16	%f20,	%f16,	%i0
	edge32n	%o7,	%o1,	%l5
	stw	%i7,	[%l7 + 0x14]
	fsrc2	%f14,	%f8
	movrgez	%l0,	%o2,	%o0
	fpsub32s	%f11,	%f15,	%f27
	nop
	set	0x30, %g3
	ldsw	[%l7 + %g3],	%g4
	movcc	%xcc,	%i5,	%g6
	udivx	%o4,	0x048F,	%o3
	std	%f0,	[%l7 + 0x50]
	ldd	[%l7 + 0x30],	%g6
	edge32n	%g3,	%i6,	%i3
	fpadd16	%f28,	%f16,	%f0
	fnor	%f14,	%f12,	%f24
	fmuld8sux16	%f17,	%f11,	%f2
	xnorcc	%i1,	0x1194,	%l4
	edge8	%i4,	%o5,	%o6
	alignaddrl	%l6,	%l1,	%g2
	udivcc	%l3,	0x0720,	%i2
	andncc	%l2,	%g5,	%g1
	movne	%icc,	%i0,	%o7
	udivcc	%l5,	0x0E52,	%i7
	array8	%o1,	%o2,	%l0
	fmovsvc	%xcc,	%f17,	%f24
	srax	%g4,	0x18,	%o0
	fmovd	%f20,	%f10
	fpadd16s	%f21,	%f14,	%f15
	fsrc1s	%f26,	%f14
	andcc	%i5,	%o4,	%g6
	movcc	%icc,	%g7,	%g3
	andn	%o3,	0x13FD,	%i3
	andcc	%i6,	0x1106,	%l4
	subc	%i1,	0x041A,	%o5
	fpack16	%f20,	%f25
	orn	%o6,	0x0227,	%l6
	edge32ln	%l1,	%g2,	%i4
	std	%f0,	[%l7 + 0x28]
	fcmpne16	%f14,	%f8,	%l3
	ld	[%l7 + 0x4C],	%f22
	movn	%icc,	%i2,	%l2
	move	%xcc,	%g5,	%g1
	xnor	%i0,	%o7,	%l5
	edge16ln	%i7,	%o1,	%l0
	sethi	0x164D,	%o2
	fmovrdgz	%o0,	%f30,	%f8
	fmovdneg	%xcc,	%f15,	%f1
	movgu	%xcc,	%g4,	%i5
	orn	%o4,	0x16E4,	%g6
	save %g7, %g3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i3,	0x1283,	%i6
	movcs	%icc,	%l4,	%i1
	edge16ln	%o5,	%l6,	%l1
	fmovrslez	%o6,	%f22,	%f31
	sra	%g2,	%l3,	%i4
	movle	%icc,	%i2,	%l2
	fcmped	%fcc1,	%f8,	%f24
	array16	%g1,	%i0,	%g5
	popc	0x1970,	%l5
	mulscc	%o7,	0x0337,	%i7
	addc	%l0,	%o1,	%o2
	sdiv	%o0,	0x0E7E,	%g4
	edge32l	%i5,	%o4,	%g6
	fmovdg	%xcc,	%f17,	%f8
	fcmpgt16	%f10,	%f20,	%g3
	fornot2	%f20,	%f2,	%f26
	popc	0x0A57,	%o3
	fmovrsgez	%g7,	%f27,	%f15
	st	%f1,	[%l7 + 0x64]
	fpack32	%f6,	%f6,	%f24
	stx	%i3,	[%l7 + 0x28]
	for	%f6,	%f18,	%f20
	or	%l4,	0x1D78,	%i6
	srlx	%i1,	0x02,	%o5
	or	%l1,	%l6,	%g2
	sra	%l3,	%i4,	%i2
	movleu	%icc,	%l2,	%o6
	movrne	%i0,	0x33A,	%g1
	sllx	%g5,	0x0A,	%o7
	fnot2s	%f26,	%f2
	fzeros	%f0
	sdivx	%l5,	0x1C02,	%l0
	edge8n	%i7,	%o1,	%o2
	mova	%icc,	%g4,	%o0
	sir	0x0A37
	st	%f3,	[%l7 + 0x20]
	stw	%o4,	[%l7 + 0x20]
	movcs	%xcc,	%g6,	%g3
	movrlz	%i5,	0x266,	%g7
	edge16n	%o3,	%l4,	%i3
	movvc	%xcc,	%i6,	%o5
	movrne	%i1,	%l6,	%l1
	srl	%g2,	0x18,	%l3
	fmovdleu	%xcc,	%f18,	%f5
	ldx	[%l7 + 0x28],	%i2
	fcmpgt16	%f10,	%f14,	%i4
	stw	%o6,	[%l7 + 0x10]
	alignaddr	%l2,	%i0,	%g1
	ldub	[%l7 + 0x38],	%g5
	umul	%o7,	0x1066,	%l5
	fmul8x16au	%f14,	%f0,	%f4
	fmovdne	%icc,	%f24,	%f15
	sdiv	%i7,	0x1BCF,	%o1
	fnors	%f10,	%f19,	%f1
	ldsh	[%l7 + 0x40],	%o2
	fmovs	%f28,	%f28
	ldsh	[%l7 + 0x34],	%l0
	fnands	%f22,	%f13,	%f5
	mulx	%g4,	%o0,	%o4
	edge32	%g6,	%g3,	%g7
	movrlz	%i5,	0x009,	%o3
	sethi	0x16EA,	%i3
	andncc	%i6,	%l4,	%i1
	xnor	%l6,	%l1,	%o5
	movrgez	%g2,	0x2F7,	%i2
	array8	%l3,	%o6,	%i4
	orn	%i0,	%g1,	%g5
	addc	%l2,	0x1EA8,	%l5
	movrgz	%o7,	0x30F,	%o1
	ldx	[%l7 + 0x20],	%o2
	movrgez	%l0,	0x2E5,	%i7
	xnor	%g4,	%o4,	%o0
	movrgz	%g3,	%g6,	%g7
	edge8ln	%o3,	%i3,	%i5
	fnor	%f10,	%f6,	%f20
	fmul8x16au	%f24,	%f1,	%f4
	fpadd16	%f14,	%f18,	%f14
	array16	%l4,	%i6,	%i1
	fsrc1	%f4,	%f14
	sllx	%l6,	0x15,	%l1
	edge16ln	%g2,	%i2,	%l3
	lduw	[%l7 + 0x38],	%o5
	movvs	%xcc,	%o6,	%i0
	subccc	%i4,	%g5,	%l2
	xor	%g1,	%o7,	%o1
	edge32ln	%l5,	%o2,	%i7
	ldub	[%l7 + 0x0A],	%g4
	ldsw	[%l7 + 0x18],	%l0
	sdivx	%o0,	0x0B7A,	%o4
	sll	%g3,	%g6,	%g7
	move	%icc,	%i3,	%o3
	fmovdcc	%icc,	%f2,	%f18
	andncc	%i5,	%l4,	%i6
	edge8ln	%i1,	%l6,	%g2
	ldd	[%l7 + 0x28],	%i2
	fcmpgt32	%f16,	%f28,	%l3
	movne	%xcc,	%o5,	%l1
	fcmped	%fcc3,	%f14,	%f8
	smul	%i0,	%o6,	%g5
	fandnot2s	%f24,	%f17,	%f9
	fxor	%f12,	%f12,	%f20
	array8	%i4,	%g1,	%o7
	fcmps	%fcc0,	%f30,	%f19
	subc	%l2,	0x0AE8,	%l5
	fmovsvs	%icc,	%f23,	%f27
	xnorcc	%o1,	0x0C1E,	%o2
	fmovdle	%icc,	%f11,	%f16
	fmovspos	%icc,	%f10,	%f2
	fandnot2s	%f30,	%f4,	%f21
	orn	%g4,	%i7,	%o0
	array16	%o4,	%l0,	%g6
	fnand	%f16,	%f26,	%f0
	sdivcc	%g3,	0x0A43,	%g7
	sth	%o3,	[%l7 + 0x76]
	xor	%i3,	%l4,	%i6
	movleu	%icc,	%i5,	%i1
	andn	%g2,	0x1FB5,	%l6
	st	%f25,	[%l7 + 0x10]
	movne	%xcc,	%i2,	%o5
	ldd	[%l7 + 0x30],	%l2
	movgu	%icc,	%l1,	%o6
	andncc	%g5,	%i0,	%i4
	fmul8ulx16	%f2,	%f16,	%f12
	sethi	0x1815,	%g1
	edge16	%l2,	%l5,	%o7
	mulscc	%o2,	%g4,	%o1
	array32	%o0,	%o4,	%i7
	alignaddr	%g6,	%g3,	%l0
	std	%f14,	[%l7 + 0x60]
	move	%icc,	%g7,	%o3
	edge16l	%i3,	%l4,	%i5
	edge8l	%i1,	%i6,	%g2
	ldsw	[%l7 + 0x54],	%l6
	movge	%xcc,	%i2,	%o5
	movn	%icc,	%l1,	%o6
	xnor	%l3,	0x0475,	%g5
	lduw	[%l7 + 0x54],	%i0
	sub	%g1,	0x174D,	%l2
	andncc	%l5,	%i4,	%o7
	edge32	%o2,	%o1,	%o0
	fandnot1s	%f5,	%f6,	%f9
	orn	%g4,	0x1836,	%i7
	edge8	%o4,	%g6,	%l0
	fnot1s	%f4,	%f19
	movre	%g3,	%g7,	%o3
	fmovrdgez	%i3,	%f20,	%f10
	fexpand	%f15,	%f20
	fsrc1	%f14,	%f8
	udiv	%l4,	0x0104,	%i1
	stx	%i5,	[%l7 + 0x20]
	sub	%i6,	%l6,	%g2
	udiv	%o5,	0x0A8B,	%i2
	srl	%l1,	%l3,	%g5
	std	%f12,	[%l7 + 0x10]
	xor	%i0,	%g1,	%l2
	fmovrdgez	%o6,	%f6,	%f28
	std	%f10,	[%l7 + 0x10]
	ldsb	[%l7 + 0x11],	%l5
	movvs	%icc,	%o7,	%o2
	edge16	%o1,	%o0,	%g4
	fmovsn	%xcc,	%f1,	%f11
	fcmps	%fcc1,	%f16,	%f17
	lduh	[%l7 + 0x5A],	%i4
	subccc	%i7,	0x012C,	%o4
	subccc	%g6,	0x14D1,	%g3
	movre	%g7,	0x372,	%l0
	edge32n	%o3,	%i3,	%i1
	edge32n	%i5,	%i6,	%l6
	array8	%l4,	%o5,	%i2
	fmovsvc	%icc,	%f14,	%f29
	edge16n	%g2,	%l1,	%g5
	and	%i0,	0x0ED9,	%g1
	fmovdge	%icc,	%f30,	%f24
	udiv	%l3,	0x04F4,	%l2
	xnor	%o6,	%l5,	%o2
	andn	%o1,	0x1753,	%o0
	addcc	%o7,	0x18F2,	%i4
	and	%g4,	0x1CEF,	%o4
	popc	0x1A88,	%i7
	fmovs	%f30,	%f12
	fmovrde	%g3,	%f8,	%f2
	fzero	%f16
	movge	%icc,	%g7,	%l0
	movrgez	%o3,	0x135,	%i3
	alignaddr	%i1,	%i5,	%i6
	fand	%f28,	%f28,	%f6
	orn	%l6,	%l4,	%g6
	edge32n	%i2,	%o5,	%l1
	fmovrse	%g5,	%f1,	%f16
	xnorcc	%g2,	%g1,	%i0
	xor	%l2,	%o6,	%l3
	fmovdpos	%icc,	%f23,	%f25
	sllx	%l5,	%o2,	%o1
	array8	%o0,	%o7,	%i4
	add	%o4,	0x1711,	%g4
	orn	%i7,	%g3,	%g7
	fmovrdlez	%l0,	%f22,	%f30
	mulscc	%o3,	%i1,	%i3
	move	%xcc,	%i6,	%l6
	array16	%l4,	%i5,	%g6
	lduw	[%l7 + 0x20],	%o5
	movn	%xcc,	%i2,	%l1
	sth	%g5,	[%l7 + 0x5C]
	movn	%xcc,	%g2,	%g1
	fmul8x16	%f30,	%f26,	%f10
	lduh	[%l7 + 0x14],	%l2
	xnor	%o6,	0x0FCE,	%i0
	edge32ln	%l5,	%l3,	%o1
	xor	%o0,	%o2,	%o7
	movgu	%icc,	%i4,	%g4
	fcmple16	%f6,	%f10,	%i7
	edge32ln	%g3,	%o4,	%l0
	array32	%o3,	%g7,	%i1
	fpsub16s	%f5,	%f20,	%f9
	mulscc	%i6,	0x06B9,	%i3
	movre	%l6,	0x396,	%l4
	fmovrse	%i5,	%f28,	%f20
	and	%o5,	%g6,	%i2
	restore %g5, 0x1A26, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f25,	%f16
	subcc	%l1,	%l2,	%o6
	fmovrdlz	%g1,	%f26,	%f4
	fmul8x16	%f11,	%f14,	%f30
	movvs	%xcc,	%l5,	%i0
	fmul8x16	%f8,	%f20,	%f24
	fmovsleu	%xcc,	%f30,	%f27
	add	%l3,	%o0,	%o1
	popc	%o7,	%o2
	fpadd32s	%f13,	%f2,	%f28
	fmovsa	%xcc,	%f5,	%f29
	save %g4, 0x1B78, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i7,	0x1548,	%o4
	stw	%g3,	[%l7 + 0x5C]
	fxors	%f24,	%f8,	%f4
	movrlez	%l0,	0x310,	%g7
	edge8n	%o3,	%i6,	%i1
	xor	%i3,	%l4,	%l6
	sdivx	%i5,	0x03F5,	%g6
	movpos	%icc,	%o5,	%g5
	andn	%g2,	0x01CC,	%i2
	movrgz	%l2,	0x221,	%o6
	ldsh	[%l7 + 0x42],	%g1
	andncc	%l1,	%l5,	%l3
	ldub	[%l7 + 0x49],	%o0
	mulx	%o1,	0x11EE,	%o7
	umulcc	%i0,	%o2,	%i4
	save %i7, %g4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g3,	0x0170,	%l0
	add	%o3,	0x0824,	%g7
	and	%i1,	0x0B27,	%i6
	movrgez	%i3,	0x3AC,	%l6
	movrgez	%l4,	0x2E2,	%i5
	fmovdn	%xcc,	%f24,	%f0
	ldx	[%l7 + 0x18],	%g6
	movvc	%xcc,	%g5,	%o5
	orncc	%g2,	0x1E58,	%l2
	fcmpes	%fcc2,	%f3,	%f12
	movneg	%xcc,	%o6,	%i2
	umul	%g1,	0x137C,	%l1
	andcc	%l3,	0x119A,	%o0
	fnot2s	%f26,	%f16
	fmovdle	%icc,	%f22,	%f7
	mova	%icc,	%o1,	%o7
	movrne	%l5,	%o2,	%i4
	edge8ln	%i7,	%i0,	%o4
	addcc	%g4,	0x024E,	%g3
	edge16ln	%o3,	%l0,	%g7
	fcmpgt16	%f30,	%f18,	%i1
	for	%f12,	%f30,	%f4
	nop
	set	0x26, %o6
	lduh	[%l7 + %o6],	%i6
	lduh	[%l7 + 0x32],	%i3
	std	%f16,	[%l7 + 0x50]
	move	%icc,	%l4,	%l6
	fmovrdgz	%g6,	%f14,	%f0
	srl	%g5,	%o5,	%g2
	ld	[%l7 + 0x4C],	%f2
	ldsh	[%l7 + 0x26],	%i5
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%l2
	ldub	[%l7 + 0x65],	%o6
	stw	%i2,	[%l7 + 0x08]
	fnand	%f8,	%f18,	%f8
	fmul8sux16	%f24,	%f12,	%f12
	nop
	set	0x7A, %i3
	lduh	[%l7 + %i3],	%l1
	sdivcc	%l3,	0x04F3,	%o0
	alignaddrl	%g1,	%o1,	%l5
	fcmps	%fcc0,	%f18,	%f21
	fones	%f10
	movge	%icc,	%o2,	%i4
	sllx	%i7,	%i0,	%o4
	lduw	[%l7 + 0x28],	%o7
	fcmped	%fcc3,	%f6,	%f6
	sub	%g3,	%o3,	%g4
	movrlz	%g7,	%l0,	%i6
	fmovscc	%icc,	%f20,	%f28
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	ldsb	[%l7 + 0x62],	%i1
	array8	%l6,	%g5,	%o5
	addc	%g2,	0x0B19,	%i5
	umulcc	%l2,	0x1715,	%o6
	srlx	%g6,	%l1,	%l3
	orn	%o0,	%i2,	%g1
	movgu	%icc,	%l5,	%o2
	array32	%i4,	%i7,	%o1
	edge32	%i0,	%o7,	%g3
	popc	%o3,	%o4
	stb	%g7,	[%l7 + 0x7F]
	movgu	%xcc,	%g4,	%i6
	move	%icc,	%l0,	%l4
	sethi	0x1C46,	%i1
	movge	%icc,	%i3,	%g5
	ldsb	[%l7 + 0x53],	%o5
	movvc	%icc,	%g2,	%l6
	orncc	%l2,	0x1B34,	%i5
	edge16n	%g6,	%l1,	%o6
	fornot2s	%f1,	%f10,	%f30
	movpos	%icc,	%o0,	%i2
	fmovrdgez	%l3,	%f2,	%f2
	sub	%l5,	0x0FDD,	%o2
	st	%f31,	[%l7 + 0x7C]
	fpmerge	%f9,	%f0,	%f12
	fabsd	%f18,	%f28
	edge8n	%g1,	%i7,	%o1
	mulscc	%i4,	0x13A9,	%o7
	edge16ln	%g3,	%i0,	%o3
	orcc	%g7,	0x046B,	%g4
	popc	%o4,	%l0
	movvs	%icc,	%l4,	%i6
	movge	%xcc,	%i1,	%g5
	fmovse	%xcc,	%f20,	%f8
	alignaddrl	%o5,	%i3,	%g2
	xorcc	%l2,	%l6,	%i5
	fnands	%f27,	%f0,	%f23
	movleu	%xcc,	%l1,	%o6
	smulcc	%o0,	%i2,	%l3
	andncc	%l5,	%o2,	%g6
	movrgez	%i7,	%o1,	%i4
	ldsw	[%l7 + 0x78],	%g1
	subc	%g3,	0x1CEC,	%o7
	movrlez	%o3,	0x07E,	%g7
	subc	%i0,	0x1D92,	%g4
	fcmps	%fcc2,	%f2,	%f3
	sll	%l0,	0x0E,	%l4
	edge32	%i6,	%i1,	%o4
	mulx	%g5,	%i3,	%o5
	st	%f28,	[%l7 + 0x1C]
	ldsb	[%l7 + 0x1D],	%l2
	ldsb	[%l7 + 0x4E],	%l6
	fmovd	%f6,	%f0
	orcc	%i5,	%g2,	%l1
	ld	[%l7 + 0x08],	%f23
	sdivx	%o6,	0x0398,	%i2
	fmovrsgz	%o0,	%f21,	%f23
	xor	%l3,	0x0B5B,	%l5
	subccc	%o2,	0x0BE7,	%g6
	fsrc1s	%f15,	%f23
	fand	%f26,	%f28,	%f4
	fnot1s	%f2,	%f6
	movl	%xcc,	%o1,	%i7
	movrlez	%g1,	%i4,	%o7
	mulx	%g3,	%g7,	%o3
	movvc	%xcc,	%g4,	%i0
	sethi	0x0FD5,	%l0
	fmovsneg	%icc,	%f20,	%f8
	stw	%l4,	[%l7 + 0x24]
	fmovrsne	%i6,	%f7,	%f29
	movrgz	%o4,	0x00E,	%g5
	mulx	%i1,	%o5,	%l2
	subccc	%i3,	%l6,	%g2
	fmovrsne	%i5,	%f26,	%f29
	fmul8sux16	%f24,	%f18,	%f6
	sllx	%o6,	0x1F,	%l1
	st	%f21,	[%l7 + 0x44]
	st	%f13,	[%l7 + 0x78]
	edge8ln	%i2,	%l3,	%l5
	edge8	%o0,	%g6,	%o1
	movge	%xcc,	%o2,	%g1
	addccc	%i7,	%i4,	%g3
	edge8l	%o7,	%o3,	%g4
	subcc	%i0,	%l0,	%l4
	mulscc	%i6,	%o4,	%g7
	stx	%g5,	[%l7 + 0x38]
	smulcc	%i1,	%o5,	%i3
	sllx	%l2,	0x1A,	%g2
	ld	[%l7 + 0x40],	%f7
	save %l6, %i5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o6,	0x0263,	%l3
	popc	0x1720,	%l5
	movne	%xcc,	%i2,	%g6
	array8	%o0,	%o1,	%g1
	andncc	%i7,	%o2,	%g3
	add	%o7,	%o3,	%i4
	lduh	[%l7 + 0x0A],	%g4
	alignaddr	%i0,	%l0,	%l4
	movrlez	%i6,	%g7,	%o4
	srl	%i1,	%g5,	%i3
	fpackfix	%f28,	%f9
	mova	%xcc,	%o5,	%g2
	ldub	[%l7 + 0x58],	%l2
	mova	%icc,	%i5,	%l1
	movg	%xcc,	%l6,	%l3
	subc	%l5,	0x0A98,	%o6
	sra	%g6,	%i2,	%o0
	sub	%g1,	0x11E5,	%o1
	alignaddrl	%i7,	%g3,	%o7
	udiv	%o3,	0x1BF7,	%i4
	fcmpd	%fcc0,	%f6,	%f16
	fcmps	%fcc1,	%f29,	%f2
	ldsw	[%l7 + 0x14],	%g4
	orn	%i0,	0x00D2,	%l0
	xnorcc	%l4,	0x13F1,	%i6
	sll	%o2,	0x1F,	%o4
	array16	%g7,	%g5,	%i3
	popc	0x18F8,	%o5
	fcmpeq16	%f14,	%f24,	%i1
	movg	%xcc,	%g2,	%l2
	xnor	%i5,	0x1FEE,	%l1
	nop
	set	0x10, %i2
	std	%f20,	[%l7 + %i2]
	orn	%l3,	%l6,	%o6
	std	%f28,	[%l7 + 0x38]
	xor	%g6,	%l5,	%o0
	fmovscs	%icc,	%f1,	%f24
	ldx	[%l7 + 0x48],	%i2
	sethi	0x1ADD,	%o1
	fnot2	%f22,	%f18
	umul	%i7,	%g3,	%g1
	edge32n	%o3,	%i4,	%g4
	lduw	[%l7 + 0x5C],	%o7
	sth	%i0,	[%l7 + 0x58]
	fnors	%f29,	%f30,	%f14
	movg	%xcc,	%l0,	%i6
	xnor	%o2,	0x0AA8,	%o4
	movgu	%xcc,	%l4,	%g7
	edge16ln	%g5,	%i3,	%i1
	fzeros	%f19
	nop
	set	0x5A, %l1
	ldsb	[%l7 + %l1],	%o5
	movcs	%xcc,	%g2,	%l2
	alignaddrl	%i5,	%l3,	%l6
	movg	%icc,	%o6,	%g6
	udivcc	%l1,	0x1AA0,	%l5
	edge16l	%o0,	%i2,	%o1
	sdivx	%i7,	0x1CCF,	%g1
	sdivcc	%o3,	0x1B2D,	%g3
	sth	%g4,	[%l7 + 0x6C]
	movrne	%o7,	0x0ED,	%i4
	fcmpgt32	%f28,	%f28,	%l0
	movrlz	%i0,	%o2,	%i6
	orncc	%o4,	0x0D63,	%l4
	movleu	%xcc,	%g5,	%i3
	edge8ln	%i1,	%g7,	%o5
	ldd	[%l7 + 0x48],	%f26
	movrlz	%l2,	%g2,	%l3
	fmovdvc	%icc,	%f26,	%f18
	movcs	%icc,	%l6,	%o6
	movgu	%xcc,	%g6,	%i5
	st	%f11,	[%l7 + 0x34]
	sdiv	%l5,	0x12DF,	%l1
	movle	%icc,	%o0,	%o1
	orcc	%i2,	%i7,	%o3
	addc	%g1,	%g3,	%o7
	fmul8ulx16	%f6,	%f26,	%f14
	mova	%xcc,	%i4,	%l0
	fexpand	%f26,	%f28
	fand	%f0,	%f10,	%f22
	stb	%g4,	[%l7 + 0x2D]
	movg	%xcc,	%i0,	%i6
	fpsub32s	%f1,	%f2,	%f8
	movpos	%icc,	%o4,	%o2
	movcc	%xcc,	%l4,	%i3
	smulcc	%i1,	%g7,	%o5
	xor	%g5,	%l2,	%l3
	movrlz	%g2,	%l6,	%o6
	nop
	set	0x08, %l5
	stx	%i5,	[%l7 + %l5]
	xnor	%g6,	%l1,	%l5
	movrgez	%o1,	%o0,	%i7
	sdiv	%o3,	0x0297,	%i2
	srlx	%g1,	%o7,	%g3
	srax	%i4,	0x16,	%g4
	edge16ln	%i0,	%i6,	%l0
	sir	0x0BA0
	fornot1s	%f3,	%f12,	%f24
	fpsub32s	%f10,	%f31,	%f23
	andcc	%o2,	0x1398,	%o4
	ldd	[%l7 + 0x50],	%i2
	fmovsl	%xcc,	%f12,	%f14
	umulcc	%l4,	%g7,	%o5
	mulscc	%g5,	%i1,	%l3
	edge16ln	%l2,	%g2,	%l6
	std	%f12,	[%l7 + 0x48]
	movgu	%icc,	%i5,	%o6
	orcc	%g6,	%l1,	%l5
	movleu	%xcc,	%o1,	%o0
	alignaddr	%i7,	%o3,	%i2
	fandnot1s	%f15,	%f29,	%f15
	xor	%o7,	0x08E8,	%g3
	fnegd	%f10,	%f16
	restore %i4, 0x0F0D, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%i0,	%i6
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	movgu	%icc,	%o2,	%o4
	movvc	%icc,	%i3,	%g7
	smulcc	%l4,	%g5,	%o5
	sdivcc	%i1,	0x1298,	%l2
	fmovsgu	%xcc,	%f31,	%f25
	fmovrsgz	%l3,	%f14,	%f20
	srl	%l6,	0x06,	%g2
	movg	%icc,	%i5,	%o6
	mulx	%g6,	%l1,	%l5
	or	%o1,	0x1E2C,	%i7
	ldx	[%l7 + 0x10],	%o3
	mova	%xcc,	%o0,	%i2
	fcmpes	%fcc3,	%f30,	%f6
	popc	0x03F5,	%o7
	sdivx	%g3,	0x0AE9,	%i4
	std	%f26,	[%l7 + 0x78]
	orcc	%i0,	%i6,	%g1
	movneg	%xcc,	%l0,	%o2
	movrlz	%o4,	%g4,	%i3
	mova	%xcc,	%g7,	%g5
	nop
	set	0x78, %g2
	std	%f28,	[%l7 + %g2]
	orcc	%o5,	0x142B,	%i1
	fabss	%f15,	%f17
	mova	%xcc,	%l2,	%l3
	nop
	set	0x59, %i4
	ldsb	[%l7 + %i4],	%l4
	mulscc	%l6,	0x1BCF,	%g2
	nop
	set	0x48, %o1
	sth	%i5,	[%l7 + %o1]
	or	%g6,	%o6,	%l1
	addccc	%l5,	0x1FFC,	%o1
	fpsub16s	%f10,	%f0,	%f31
	srax	%o3,	%i7,	%i2
	fmovsge	%xcc,	%f19,	%f8
	edge32	%o7,	%o0,	%g3
	fmovrsgez	%i0,	%f30,	%f5
	ldd	[%l7 + 0x70],	%f4
	edge32n	%i4,	%g1,	%l0
	umulcc	%i6,	%o2,	%g4
	movrlz	%i3,	%g7,	%g5
	array32	%o5,	%o4,	%i1
	std	%f26,	[%l7 + 0x28]
	sth	%l2,	[%l7 + 0x16]
	sir	0x1697
	fmovscs	%xcc,	%f20,	%f17
	move	%icc,	%l3,	%l4
	fnot1	%f8,	%f26
	subcc	%g2,	0x103A,	%l6
	sra	%g6,	0x09,	%i5
	movvc	%xcc,	%l1,	%o6
	movleu	%xcc,	%l5,	%o3
	ldub	[%l7 + 0x41],	%o1
	movle	%xcc,	%i7,	%o7
	restore %i2, 0x0E59, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i0,	%i4
	stb	%g3,	[%l7 + 0x15]
	fmovdg	%xcc,	%f5,	%f22
	lduw	[%l7 + 0x64],	%l0
	smul	%i6,	0x04F5,	%o2
	andncc	%g4,	%i3,	%g1
	array16	%g5,	%g7,	%o4
	movge	%xcc,	%i1,	%o5
	fandnot1s	%f19,	%f30,	%f20
	movvs	%icc,	%l3,	%l2
	alignaddrl	%l4,	%l6,	%g6
	std	%f16,	[%l7 + 0x40]
	move	%xcc,	%g2,	%i5
	fcmple32	%f12,	%f2,	%o6
	movn	%icc,	%l1,	%o3
	edge16ln	%l5,	%i7,	%o7
	movg	%xcc,	%o1,	%i2
	stx	%o0,	[%l7 + 0x18]
	array32	%i0,	%i4,	%g3
	sdivcc	%i6,	0x0C43,	%o2
	fmovdg	%icc,	%f2,	%f10
	fors	%f11,	%f11,	%f7
	ldsb	[%l7 + 0x3C],	%g4
	nop
	set	0x16, %l4
	stb	%l0,	[%l7 + %l4]
	st	%f4,	[%l7 + 0x18]
	fpadd16s	%f1,	%f9,	%f6
	xorcc	%g1,	0x0EEE,	%i3
	save %g5, %g7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x7A],	%i1
	edge32l	%l3,	%o5,	%l4
	andn	%l2,	%g6,	%l6
	stw	%i5,	[%l7 + 0x4C]
	alignaddr	%o6,	%g2,	%o3
	movvs	%xcc,	%l5,	%i7
	sdiv	%l1,	0x1AE3,	%o1
	fpadd32s	%f23,	%f31,	%f15
	movpos	%xcc,	%o7,	%i2
	fandnot2s	%f13,	%f3,	%f12
	mulscc	%o0,	%i4,	%i0
	andcc	%g3,	0x0AA4,	%i6
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	ldd	[%l7 + 0x10],	%f2
	fmovd	%f12,	%f26
	sethi	0x02E6,	%l0
	st	%f0,	[%l7 + 0x14]
	movl	%icc,	%i3,	%g5
	ldsw	[%l7 + 0x3C],	%g7
	edge32ln	%o4,	%i1,	%l3
	xor	%g1,	0x1E5F,	%l4
	movvc	%icc,	%l2,	%g6
	smulcc	%l6,	0x1C15,	%i5
	edge8	%o6,	%g2,	%o5
	fmul8ulx16	%f18,	%f28,	%f2
	fmovscc	%xcc,	%f2,	%f17
	ldd	[%l7 + 0x38],	%f18
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%f10
	st	%f4,	[%l7 + 0x20]
	movcc	%icc,	%o3,	%i7
	addc	%l5,	%o1,	%o7
	sth	%i2,	[%l7 + 0x7A]
	array32	%o0,	%l1,	%i4
	xor	%i0,	%g3,	%o2
	smulcc	%i6,	0x0CF2,	%g4
	smul	%l0,	0x0643,	%i3
	srlx	%g7,	%o4,	%g5
	movneg	%icc,	%l3,	%i1
	movrlez	%l4,	%l2,	%g6
	fandnot2	%f16,	%f8,	%f16
	fornot2	%f28,	%f22,	%f2
	fmovdg	%xcc,	%f16,	%f1
	movrgez	%l6,	%i5,	%g1
	sdiv	%g2,	0x0702,	%o5
	movcs	%xcc,	%o6,	%o3
	fmovrsgz	%l5,	%f26,	%f22
	movcs	%icc,	%o1,	%i7
	fmovdne	%xcc,	%f21,	%f27
	movrgz	%o7,	%i2,	%l1
	fcmpeq16	%f18,	%f0,	%o0
	edge32n	%i0,	%g3,	%o2
	fmovde	%xcc,	%f23,	%f22
	nop
	set	0x38, %l6
	sth	%i6,	[%l7 + %l6]
	subc	%g4,	0x12A4,	%i4
	edge16ln	%i3,	%l0,	%o4
	movvs	%xcc,	%g5,	%l3
	orncc	%g7,	0x06CB,	%i1
	movcs	%xcc,	%l4,	%l2
	st	%f15,	[%l7 + 0x18]
	fmovrsgez	%l6,	%f12,	%f22
	movrlz	%i5,	0x2C5,	%g6
	andcc	%g2,	0x174F,	%o5
	subccc	%g1,	0x18BE,	%o3
	sir	0x1C95
	std	%f28,	[%l7 + 0x20]
	umul	%l5,	0x06D2,	%o1
	movn	%xcc,	%o6,	%i7
	fmovsvs	%icc,	%f27,	%f6
	andcc	%o7,	%l1,	%i2
	fandnot1s	%f3,	%f12,	%f31
	movge	%xcc,	%o0,	%g3
	umul	%i0,	%o2,	%g4
	srlx	%i4,	0x1C,	%i6
	fmovdleu	%xcc,	%f7,	%f2
	sdiv	%l0,	0x104F,	%o4
	addccc	%g5,	%i3,	%g7
	sra	%l3,	0x01,	%l4
	srl	%i1,	0x09,	%l2
	array8	%l6,	%i5,	%g2
	lduw	[%l7 + 0x40],	%o5
	movrlez	%g6,	0x3F9,	%g1
	move	%xcc,	%l5,	%o3
	movl	%icc,	%o6,	%i7
	add	%o1,	%o7,	%i2
	fornot2s	%f30,	%f30,	%f22
	movrgz	%l1,	%o0,	%i0
	udivx	%g3,	0x0322,	%o2
	fmovrsgez	%g4,	%f18,	%f26
	ldd	[%l7 + 0x78],	%i6
	sdiv	%i4,	0x04BE,	%l0
	sllx	%g5,	%o4,	%i3
	fmovrde	%g7,	%f10,	%f6
	fpmerge	%f24,	%f4,	%f12
	mova	%icc,	%l3,	%i1
	udiv	%l4,	0x1660,	%l6
	orn	%i5,	%l2,	%g2
	addc	%g6,	0x1134,	%o5
	fmuld8sux16	%f11,	%f14,	%f30
	srl	%g1,	%l5,	%o3
	or	%i7,	%o6,	%o1
	movcc	%icc,	%o7,	%l1
	andncc	%o0,	%i2,	%i0
	fmovdgu	%icc,	%f15,	%f26
	sll	%o2,	0x11,	%g4
	movrne	%g3,	0x241,	%i6
	fzero	%f18
	orncc	%i4,	0x0209,	%g5
	xorcc	%o4,	0x1221,	%i3
	fmovde	%xcc,	%f3,	%f9
	stb	%l0,	[%l7 + 0x48]
	movre	%l3,	%i1,	%l4
	subcc	%g7,	%l6,	%i5
	fmovd	%f22,	%f20
	movne	%icc,	%g2,	%l2
	save %o5, 0x06FE, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g1,	%l5,	%o3
	addc	%o6,	%i7,	%o7
	stb	%l1,	[%l7 + 0x5E]
	stw	%o1,	[%l7 + 0x60]
	subcc	%i2,	%o0,	%i0
	sdiv	%o2,	0x1916,	%g4
	edge16l	%g3,	%i6,	%i4
	fpack16	%f6,	%f0
	fmovdvc	%xcc,	%f8,	%f4
	lduh	[%l7 + 0x5E],	%o4
	restore %i3, 0x1AD7, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%xcc,	%f0,	%f9
	ld	[%l7 + 0x40],	%f0
	stw	%g5,	[%l7 + 0x20]
	fpadd16	%f6,	%f4,	%f14
	xorcc	%i1,	%l3,	%l4
	movpos	%icc,	%g7,	%l6
	array8	%g2,	%i5,	%o5
	umulcc	%l2,	0x029F,	%g1
	popc	0x1030,	%l5
	ldx	[%l7 + 0x78],	%g6
	orn	%o6,	%i7,	%o7
	addccc	%l1,	%o1,	%i2
	ldsb	[%l7 + 0x0E],	%o0
	edge32ln	%i0,	%o2,	%o3
	popc	%g3,	%g4
	movgu	%xcc,	%i6,	%i4
	fexpand	%f18,	%f2
	movrlez	%i3,	0x3A6,	%o4
	addcc	%l0,	0x1D3F,	%g5
	ldsb	[%l7 + 0x4A],	%i1
	addc	%l3,	%l4,	%g7
	xnorcc	%g2,	0x1A6F,	%l6
	mova	%xcc,	%o5,	%l2
	edge32ln	%g1,	%i5,	%l5
	addc	%g6,	%i7,	%o6
	movneg	%xcc,	%l1,	%o7
	ldub	[%l7 + 0x28],	%i2
	sdivx	%o1,	0x0353,	%i0
	subcc	%o2,	%o3,	%o0
	movl	%xcc,	%g3,	%g4
	sra	%i4,	0x1A,	%i6
	movl	%icc,	%o4,	%l0
	nop
	set	0x40, %i6
	ldx	[%l7 + %i6],	%i3
	fsrc1	%f8,	%f24
	edge8	%g5,	%l3,	%l4
	movn	%icc,	%g7,	%i1
	fnot2s	%f18,	%f20
	sdivx	%l6,	0x07F6,	%o5
	ldsb	[%l7 + 0x1F],	%l2
	fpack32	%f6,	%f30,	%f0
	fcmpd	%fcc2,	%f26,	%f2
	srl	%g1,	%g2,	%i5
	movrgez	%g6,	%l5,	%o6
	movrne	%l1,	%i7,	%i2
	for	%f24,	%f18,	%f16
	edge16l	%o7,	%i0,	%o2
	fmovdcs	%icc,	%f24,	%f0
	subc	%o3,	%o1,	%o0
	alignaddrl	%g3,	%g4,	%i4
	xor	%i6,	%o4,	%i3
	ldub	[%l7 + 0x38],	%l0
	sethi	0x0594,	%g5
	stw	%l4,	[%l7 + 0x30]
	srax	%l3,	%g7,	%i1
	movn	%xcc,	%o5,	%l6
	fmovse	%xcc,	%f5,	%f9
	siam	0x4
	orncc	%g1,	0x07BD,	%g2
	array8	%l2,	%g6,	%i5
	edge16ln	%o6,	%l1,	%i7
	fmovdcc	%xcc,	%f9,	%f15
	lduh	[%l7 + 0x7A],	%l5
	sra	%o7,	0x00,	%i0
	mova	%icc,	%o2,	%o3
	fmovsne	%xcc,	%f0,	%f24
	array8	%i2,	%o0,	%g3
	bshuffle	%f28,	%f14,	%f2
	lduh	[%l7 + 0x26],	%g4
	alignaddr	%i4,	%i6,	%o1
	array32	%i3,	%o4,	%g5
	andncc	%l0,	%l4,	%g7
	edge32l	%i1,	%o5,	%l3
	addc	%g1,	0x03CF,	%l6
	edge8l	%l2,	%g6,	%i5
	fmovsgu	%icc,	%f22,	%f19
	umul	%o6,	0x07DA,	%l1
	fornot1s	%f17,	%f26,	%f7
	sethi	0x1F53,	%i7
	fcmpne16	%f20,	%f18,	%g2
	edge32l	%l5,	%i0,	%o7
	edge8l	%o3,	%i2,	%o2
	faligndata	%f30,	%f0,	%f0
	srax	%g3,	0x12,	%g4
	movrgez	%i4,	0x382,	%o0
	or	%i6,	%o1,	%i3
	movre	%o4,	0x3B0,	%g5
	edge16l	%l0,	%l4,	%g7
	xor	%i1,	0x007F,	%o5
	fcmpgt16	%f6,	%f26,	%l3
	movleu	%icc,	%l6,	%g1
	smul	%g6,	0x041C,	%i5
	edge32l	%o6,	%l1,	%l2
	movl	%xcc,	%g2,	%i7
	add	%l5,	0x0F2B,	%o7
	edge8n	%i0,	%i2,	%o3
	movneg	%icc,	%o2,	%g3
	fmovrdlz	%i4,	%f18,	%f24
	fxnors	%f0,	%f19,	%f17
	fornot1s	%f9,	%f2,	%f6
	subcc	%o0,	%g4,	%o1
	array32	%i6,	%i3,	%g5
	ldub	[%l7 + 0x3C],	%o4
	fmovsneg	%icc,	%f0,	%f1
	sdivcc	%l0,	0x135A,	%g7
	addc	%i1,	%l4,	%o5
	andncc	%l6,	%l3,	%g1
	andncc	%g6,	%i5,	%l1
	movrne	%o6,	%l2,	%i7
	sll	%g2,	%o7,	%i0
	movle	%icc,	%i2,	%l5
	edge32n	%o2,	%o3,	%g3
	srl	%i4,	0x1E,	%o0
	fornot1	%f4,	%f28,	%f30
	fsrc1	%f30,	%f12
	fmovsge	%icc,	%f22,	%f1
	edge16l	%o1,	%i6,	%i3
	sethi	0x0A3B,	%g5
	edge16ln	%o4,	%g4,	%l0
	nop
	set	0x7C, %o5
	lduw	[%l7 + %o5],	%i1
	move	%icc,	%g7,	%l4
	andncc	%o5,	%l6,	%g1
	edge16n	%l3,	%i5,	%g6
	save %o6, 0x1A2C, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l1,	0x1722,	%i7
	movl	%icc,	%o7,	%g2
	fmovrslz	%i0,	%f4,	%f19
	mulscc	%l5,	0x02EF,	%i2
	popc	0x1841,	%o2
	fornot1	%f18,	%f16,	%f22
	umulcc	%g3,	%i4,	%o3
	fxnors	%f16,	%f6,	%f11
	fmovsl	%icc,	%f10,	%f10
	xnorcc	%o0,	0x0FFE,	%i6
	fmovrse	%i3,	%f30,	%f30
	movrgz	%g5,	%o4,	%g4
	save %o1, %i1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l0,	%o5,	%l6
	sub	%l4,	0x11A4,	%g1
	addcc	%i5,	0x0559,	%l3
	ldx	[%l7 + 0x20],	%g6
	fnand	%f14,	%f6,	%f24
	move	%xcc,	%l2,	%o6
	ldd	[%l7 + 0x68],	%i6
	sll	%o7,	%g2,	%l1
	movn	%icc,	%l5,	%i0
	ld	[%l7 + 0x7C],	%f29
	alignaddrl	%o2,	%g3,	%i4
	movcc	%icc,	%o3,	%o0
	sethi	0x0244,	%i2
	movre	%i6,	%i3,	%o4
	sir	0x061D
	array16	%g4,	%g5,	%i1
	movge	%icc,	%g7,	%l0
	smulcc	%o5,	0x11AB,	%o1
	fxors	%f6,	%f14,	%f15
	sub	%l6,	%g1,	%i5
	fpsub16s	%f24,	%f4,	%f26
	ldx	[%l7 + 0x18],	%l4
	sra	%l3,	0x0A,	%g6
	addccc	%l2,	%i7,	%o6
	sdiv	%g2,	0x1771,	%o7
	add	%l1,	0x13F2,	%i0
	fmovd	%f10,	%f30
	movpos	%icc,	%o2,	%l5
	sub	%g3,	%i4,	%o3
	movneg	%icc,	%i2,	%i6
	fnot1s	%f20,	%f21
	edge16l	%i3,	%o4,	%g4
	or	%g5,	%i1,	%g7
	array8	%l0,	%o5,	%o1
	fpsub32s	%f28,	%f1,	%f9
	addccc	%l6,	0x00FE,	%g1
	orcc	%i5,	0x1C41,	%o0
	edge16l	%l3,	%g6,	%l4
	fmovsneg	%icc,	%f27,	%f19
	edge8	%l2,	%o6,	%g2
	movrgez	%i7,	0x3A3,	%o7
	movl	%icc,	%l1,	%o2
	array16	%i0,	%g3,	%i4
	fmovsg	%xcc,	%f13,	%f27
	fxnors	%f31,	%f21,	%f1
	sra	%l5,	%o3,	%i6
	fandnot1s	%f6,	%f11,	%f7
	movgu	%xcc,	%i3,	%o4
	ldd	[%l7 + 0x50],	%i2
	siam	0x0
	fmovrdgz	%g5,	%f20,	%f30
	sll	%i1,	%g7,	%l0
	fmovsne	%icc,	%f21,	%f18
	movvc	%xcc,	%g4,	%o5
	move	%xcc,	%o1,	%l6
	srax	%i5,	0x1E,	%o0
	edge16	%l3,	%g1,	%g6
	sir	0x1916
	sll	%l4,	0x05,	%l2
	fpmerge	%f28,	%f15,	%f4
	movvc	%xcc,	%o6,	%i7
	ldsb	[%l7 + 0x40],	%g2
	movrgez	%l1,	0x362,	%o2
	fpackfix	%f26,	%f13
	movn	%xcc,	%i0,	%o7
	andn	%g3,	%l5,	%i4
	movvc	%xcc,	%o3,	%i3
	popc	0x1740,	%i6
	fcmpne16	%f6,	%f6,	%o4
	movvs	%xcc,	%g5,	%i2
	xor	%i1,	%l0,	%g7
	movleu	%icc,	%o5,	%g4
	array32	%l6,	%o1,	%i5
	sll	%o0,	0x04,	%g1
	lduh	[%l7 + 0x72],	%l3
	smulcc	%g6,	%l4,	%l2
	ldub	[%l7 + 0x6D],	%i7
	ldub	[%l7 + 0x64],	%o6
	fandnot1s	%f31,	%f29,	%f0
	fpsub32s	%f15,	%f9,	%f26
	array8	%l1,	%g2,	%i0
	ldsb	[%l7 + 0x6F],	%o7
	fpsub16s	%f12,	%f9,	%f6
	fmovscs	%xcc,	%f5,	%f10
	stx	%g3,	[%l7 + 0x28]
	fmovspos	%icc,	%f8,	%f17
	fcmple16	%f20,	%f26,	%o2
	andcc	%i4,	%l5,	%o3
	fnegd	%f8,	%f6
	movneg	%icc,	%i6,	%o4
	lduw	[%l7 + 0x14],	%i3
	movne	%icc,	%g5,	%i2
	fzeros	%f3
	srax	%i1,	0x03,	%l0
	ldx	[%l7 + 0x58],	%o5
	edge32ln	%g7,	%g4,	%l6
	nop
	set	0x42, %g4
	lduh	[%l7 + %g4],	%o1
	fcmpd	%fcc0,	%f26,	%f0
	movpos	%icc,	%i5,	%o0
	edge8	%g1,	%l3,	%g6
	movrlez	%l4,	0x268,	%l2
	movl	%icc,	%i7,	%o6
	stx	%l1,	[%l7 + 0x10]
	fmovde	%icc,	%f10,	%f19
	stw	%g2,	[%l7 + 0x14]
	movn	%xcc,	%i0,	%o7
	lduh	[%l7 + 0x62],	%g3
	movcc	%icc,	%o2,	%i4
	mulscc	%o3,	0x1F2B,	%l5
	srlx	%o4,	%i3,	%g5
	fmovrsne	%i2,	%f12,	%f10
	movg	%xcc,	%i1,	%i6
	fmovrsne	%o5,	%f6,	%f5
	fmovdn	%xcc,	%f26,	%f30
	fmovsg	%xcc,	%f13,	%f30
	alignaddr	%g7,	%g4,	%l0
	sth	%l6,	[%l7 + 0x20]
	fpackfix	%f14,	%f26
	movne	%icc,	%o1,	%i5
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	edge8	%l4,	%o0,	%l2
	fornot2s	%f2,	%f11,	%f20
	orcc	%i7,	0x0EC8,	%o6
	subccc	%l1,	0x0958,	%g2
	edge8n	%o7,	%i0,	%o2
	ldsb	[%l7 + 0x46],	%g3
	sll	%i4,	0x10,	%o3
	addc	%o4,	%l5,	%g5
	edge16ln	%i3,	%i1,	%i2
	ldd	[%l7 + 0x50],	%i6
	xnorcc	%g7,	0x0B13,	%o5
	umulcc	%g4,	0x00A0,	%l6
	fpsub32s	%f31,	%f21,	%f15
	ldx	[%l7 + 0x08],	%l0
	fmovdne	%xcc,	%f24,	%f28
	array16	%o1,	%i5,	%g1
	edge32	%l3,	%l4,	%o0
	fpackfix	%f10,	%f12
	edge16l	%l2,	%g6,	%o6
	edge16l	%l1,	%g2,	%o7
	movle	%xcc,	%i7,	%o2
	movneg	%xcc,	%g3,	%i4
	edge16l	%i0,	%o4,	%l5
	movcc	%icc,	%g5,	%o3
	addccc	%i3,	0x1358,	%i2
	orcc	%i1,	0x0FA4,	%g7
	stx	%i6,	[%l7 + 0x40]
	movvc	%icc,	%o5,	%g4
	sir	0x129E
	umul	%l6,	0x0FCD,	%o1
	alignaddrl	%l0,	%g1,	%i5
	addc	%l3,	0x0E42,	%o0
	movrlez	%l2,	%l4,	%o6
	sir	0x15FB
	subc	%g6,	0x1C2D,	%g2
	mova	%icc,	%o7,	%l1
	movpos	%icc,	%i7,	%g3
	add	%o2,	%i0,	%o4
	andncc	%i4,	%g5,	%o3
	fmovsa	%icc,	%f15,	%f30
	ldsh	[%l7 + 0x48],	%i3
	xor	%l5,	%i2,	%i1
	sth	%i6,	[%l7 + 0x36]
	andncc	%o5,	%g7,	%g4
	smul	%l6,	%l0,	%g1
	sll	%o1,	0x0C,	%l3
	fmovrse	%o0,	%f5,	%f24
	sdiv	%i5,	0x1EB5,	%l4
	ldsw	[%l7 + 0x74],	%l2
	srax	%o6,	%g6,	%o7
	movn	%xcc,	%l1,	%g2
	pdist	%f12,	%f14,	%f30
	fornot2	%f22,	%f12,	%f12
	xnor	%i7,	0x1D5C,	%o2
	umulcc	%g3,	0x1B96,	%i0
	fornot2	%f22,	%f28,	%f2
	fcmpes	%fcc1,	%f25,	%f7
	edge8n	%o4,	%g5,	%o3
	fcmps	%fcc2,	%f14,	%f5
	fmovspos	%icc,	%f18,	%f2
	fand	%f0,	%f14,	%f10
	fmovsn	%icc,	%f9,	%f19
	movrne	%i4,	%i3,	%l5
	udivcc	%i1,	0x01E2,	%i6
	sdiv	%o5,	0x09F8,	%i2
	add	%g7,	0x1FD2,	%g4
	movrne	%l0,	0x14F,	%g1
	fcmpeq32	%f22,	%f24,	%l6
	movpos	%xcc,	%l3,	%o1
	movvc	%icc,	%i5,	%o0
	smulcc	%l2,	%o6,	%g6
	alignaddr	%l4,	%l1,	%o7
	xor	%g2,	%i7,	%g3
	udiv	%o2,	0x0ADB,	%i0
	movvs	%icc,	%g5,	%o4
	udiv	%i4,	0x0749,	%i3
	edge8	%l5,	%i1,	%o3
	edge16ln	%i6,	%o5,	%i2
	fmovdle	%xcc,	%f1,	%f22
	popc	%g4,	%g7
	array32	%g1,	%l0,	%l3
	alignaddrl	%l6,	%i5,	%o1
	fpadd32	%f24,	%f2,	%f30
	edge8n	%l2,	%o6,	%o0
	popc	%g6,	%l1
	fands	%f21,	%f8,	%f17
	fmovrslz	%o7,	%f1,	%f22
	sllx	%g2,	0x1B,	%l4
	umulcc	%i7,	0x1769,	%g3
	stw	%i0,	[%l7 + 0x08]
	std	%f28,	[%l7 + 0x18]
	nop
	set	0x1C, %l0
	stw	%o2,	[%l7 + %l0]
	movre	%g5,	%o4,	%i4
	edge8n	%i3,	%l5,	%i1
	or	%o3,	0x0E47,	%i6
	udiv	%i2,	0x03EC,	%o5
	fpack16	%f12,	%f17
	fmovscc	%icc,	%f19,	%f4
	sra	%g7,	%g4,	%l0
	movne	%xcc,	%l3,	%l6
	edge32n	%g1,	%i5,	%o1
	edge32	%l2,	%o6,	%g6
	array32	%l1,	%o0,	%g2
	umul	%l4,	%o7,	%i7
	array16	%i0,	%o2,	%g5
	edge32	%o4,	%g3,	%i4
	fandnot2s	%f31,	%f16,	%f20
	fxnor	%f24,	%f26,	%f12
	addccc	%i3,	0x0512,	%l5
	umulcc	%o3,	%i1,	%i6
	movrne	%o5,	0x046,	%i2
	fornot1	%f20,	%f8,	%f24
	srlx	%g7,	0x07,	%l0
	for	%f16,	%f6,	%f24
	ldx	[%l7 + 0x28],	%l3
	edge8n	%g4,	%g1,	%i5
	fpmerge	%f8,	%f22,	%f20
	fmovdle	%xcc,	%f17,	%f13
	sethi	0x1352,	%l6
	umulcc	%o1,	%o6,	%l2
	edge16n	%g6,	%o0,	%l1
	fmovs	%f22,	%f21
	xor	%g2,	0x1E49,	%o7
	andcc	%l4,	%i0,	%i7
	sdivcc	%o2,	0x01E5,	%o4
	xnorcc	%g3,	0x1539,	%g5
	fabss	%f10,	%f14
	addcc	%i3,	0x16FA,	%i4
	umul	%o3,	%i1,	%l5
	edge32ln	%i6,	%o5,	%i2
	fors	%f21,	%f26,	%f0
	stw	%l0,	[%l7 + 0x28]
	subccc	%l3,	0x12C5,	%g4
	udivcc	%g1,	0x0BB3,	%g7
	andncc	%l6,	%i5,	%o6
	fmovde	%xcc,	%f3,	%f13
	movcc	%xcc,	%o1,	%l2
	fmovdpos	%icc,	%f28,	%f28
	edge16	%o0,	%l1,	%g2
	edge32ln	%o7,	%g6,	%i0
	movvs	%icc,	%l4,	%o2
	ldub	[%l7 + 0x3C],	%i7
	smulcc	%g3,	0x1714,	%g5
	sll	%o4,	0x0B,	%i3
	addc	%o3,	0x015B,	%i1
	ldub	[%l7 + 0x64],	%i4
	ldsb	[%l7 + 0x62],	%l5
	movneg	%xcc,	%o5,	%i2
	siam	0x5
	edge32ln	%i6,	%l3,	%l0
	fmovrdgez	%g1,	%f20,	%f14
	fpsub16	%f12,	%f30,	%f18
	andcc	%g4,	%g7,	%i5
	ldx	[%l7 + 0x40],	%o6
	movrlez	%l6,	%o1,	%l2
	fmovsle	%xcc,	%f21,	%f17
	nop
	set	0x20, %g6
	ldx	[%l7 + %g6],	%o0
	fxnor	%f20,	%f24,	%f0
	nop
	set	0x78, %l2
	std	%f14,	[%l7 + %l2]
	popc	%l1,	%g2
	edge8n	%g6,	%o7,	%i0
	addcc	%o2,	0x1C96,	%i7
	alignaddr	%g3,	%g5,	%o4
	sir	0x1FC4
	array32	%i3,	%o3,	%i1
	fmovda	%xcc,	%f10,	%f20
	edge8ln	%i4,	%l5,	%l4
	edge8	%o5,	%i6,	%l3
	sth	%l0,	[%l7 + 0x66]
	sllx	%i2,	0x02,	%g4
	mulscc	%g7,	%i5,	%g1
	addccc	%o6,	%l6,	%o1
	ldsh	[%l7 + 0x0A],	%o0
	fmovrsgz	%l1,	%f19,	%f25
	subcc	%g2,	0x1A63,	%l2
	stx	%g6,	[%l7 + 0x20]
	movvs	%icc,	%o7,	%o2
	alignaddr	%i7,	%g3,	%g5
	udivcc	%o4,	0x18AF,	%i3
	fmovdvs	%xcc,	%f20,	%f11
	or	%i0,	%i1,	%o3
	sub	%l5,	0x15A4,	%i4
	addc	%o5,	0x183C,	%l4
	stx	%i6,	[%l7 + 0x20]
	movle	%xcc,	%l0,	%i2
	edge8	%g4,	%l3,	%g7
	movre	%g1,	0x3FB,	%o6
	fmovse	%xcc,	%f21,	%f22
	add	%i5,	%o1,	%o0
	fnegs	%f11,	%f21
	stw	%l1,	[%l7 + 0x08]
	restore %l6, 0x17BF, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l2,	%o7,	%g6
	move	%icc,	%o2,	%i7
	fexpand	%f10,	%f0
	fmovrdne	%g3,	%f6,	%f26
	fmovsgu	%icc,	%f19,	%f23
	umul	%o4,	%i3,	%i0
	mova	%icc,	%i1,	%o3
	lduw	[%l7 + 0x2C],	%l5
	lduh	[%l7 + 0x7C],	%g5
	movrne	%i4,	%l4,	%o5
	smul	%l0,	0x0FC2,	%i6
	udiv	%i2,	0x0D8C,	%g4
	mulscc	%g7,	%l3,	%o6
	movre	%i5,	0x394,	%g1
	fnot1s	%f11,	%f0
	fmovrdgz	%o0,	%f26,	%f26
	fsrc2s	%f24,	%f19
	ldd	[%l7 + 0x20],	%f0
	fpsub16	%f24,	%f18,	%f0
	movrlz	%o1,	0x3F8,	%l6
	movn	%xcc,	%l1,	%g2
	fmovsvc	%xcc,	%f21,	%f7
	andn	%o7,	%g6,	%o2
	std	%f16,	[%l7 + 0x08]
	move	%xcc,	%i7,	%l2
	srax	%g3,	%i3,	%o4
	smul	%i0,	0x107D,	%o3
	umulcc	%l5,	%g5,	%i1
	fmovsn	%icc,	%f9,	%f27
	array16	%l4,	%i4,	%l0
	umul	%i6,	0x0741,	%o5
	srax	%g4,	%i2,	%g7
	fmovdpos	%icc,	%f26,	%f3
	andncc	%l3,	%o6,	%i5
	fornot1	%f28,	%f16,	%f30
	st	%f6,	[%l7 + 0x3C]
	fmovsneg	%icc,	%f30,	%f3
	movcs	%icc,	%o0,	%o1
	edge8n	%l6,	%l1,	%g2
	fmul8x16	%f27,	%f10,	%f0
	array32	%g1,	%g6,	%o2
	fmovdg	%xcc,	%f31,	%f23
	udivcc	%i7,	0x1791,	%o7
	add	%l2,	0x1E21,	%i3
	movl	%xcc,	%o4,	%i0
	movvc	%xcc,	%g3,	%l5
	fmuld8sux16	%f24,	%f19,	%f26
	edge16	%o3,	%g5,	%i1
	sra	%l4,	0x1B,	%i4
	fpsub16s	%f10,	%f8,	%f5
	fmovda	%xcc,	%f29,	%f1
	fnands	%f25,	%f13,	%f16
	fpadd16	%f24,	%f12,	%f28
	fnot1s	%f5,	%f26
	edge8n	%l0,	%i6,	%o5
	movpos	%xcc,	%g4,	%g7
	fmovdn	%icc,	%f16,	%f14
	edge8n	%i2,	%o6,	%i5
	nop
	set	0x38, %i0
	ldx	[%l7 + %i0],	%o0
	array32	%o1,	%l6,	%l1
	smul	%g2,	%l3,	%g1
	edge32ln	%g6,	%i7,	%o2
	mova	%icc,	%o7,	%l2
	movgu	%xcc,	%i3,	%o4
	array32	%i0,	%l5,	%o3
	movcc	%icc,	%g3,	%i1
	fmul8ulx16	%f30,	%f8,	%f10
	edge8l	%g5,	%i4,	%l4
	ldd	[%l7 + 0x38],	%f10
	smulcc	%i6,	%l0,	%g4
	fmovdleu	%xcc,	%f31,	%f30
	movrgz	%g7,	%i2,	%o6
	alignaddrl	%i5,	%o0,	%o5
	andncc	%o1,	%l6,	%l1
	fandnot1s	%f3,	%f30,	%f22
	sdivcc	%g2,	0x0DCE,	%g1
	movvc	%xcc,	%l3,	%g6
	edge32ln	%o2,	%i7,	%o7
	edge8l	%i3,	%l2,	%i0
	sdiv	%l5,	0x1C2C,	%o4
	fmovdgu	%xcc,	%f21,	%f25
	sdivcc	%o3,	0x09F3,	%g3
	movcs	%icc,	%g5,	%i1
	edge32	%i4,	%i6,	%l4
	or	%l0,	0x0180,	%g7
	xor	%i2,	0x1B96,	%o6
	sethi	0x15DE,	%i5
	stb	%o0,	[%l7 + 0x48]
	edge32	%g4,	%o5,	%l6
	popc	%l1,	%g2
	smul	%o1,	0x00EF,	%g1
	movrne	%g6,	%l3,	%o2
	edge8	%i7,	%i3,	%o7
	lduw	[%l7 + 0x08],	%i0
	stx	%l5,	[%l7 + 0x20]
	movcc	%xcc,	%l2,	%o3
	ldd	[%l7 + 0x18],	%f22
	edge16	%o4,	%g3,	%g5
	udivcc	%i4,	0x0A06,	%i6
	edge32ln	%i1,	%l4,	%l0
	umul	%i2,	0x15DF,	%o6
	addcc	%g7,	0x11B7,	%o0
	mova	%icc,	%g4,	%o5
	fcmpd	%fcc2,	%f14,	%f8
	movrgez	%l6,	0x0A9,	%l1
	movge	%icc,	%g2,	%o1
	movgu	%xcc,	%g1,	%i5
	srax	%l3,	0x11,	%o2
	alignaddrl	%g6,	%i3,	%i7
	addc	%i0,	%o7,	%l2
	movre	%o3,	0x052,	%l5
	save %g3, %o4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i6,	0x10,	%i1
	sllx	%l4,	0x0F,	%i4
	movge	%xcc,	%l0,	%i2
	add	%g7,	%o6,	%g4
	edge32l	%o5,	%o0,	%l1
	movge	%xcc,	%g2,	%l6
	alignaddrl	%o1,	%g1,	%l3
	movrgez	%o2,	0x104,	%i5
	move	%xcc,	%i3,	%i7
	movre	%g6,	0x224,	%o7
	edge16	%i0,	%o3,	%l5
	std	%f30,	[%l7 + 0x40]
	sub	%g3,	%l2,	%o4
	andn	%i6,	0x13DB,	%g5
	ldub	[%l7 + 0x3D],	%l4
	mulx	%i1,	%l0,	%i4
	lduw	[%l7 + 0x50],	%i2
	fmovsne	%xcc,	%f25,	%f31
	fors	%f5,	%f4,	%f2
	lduw	[%l7 + 0x0C],	%g7
	xnor	%o6,	%o5,	%g4
	udiv	%l1,	0x09E1,	%g2
	ld	[%l7 + 0x10],	%f21
	fmul8x16	%f25,	%f10,	%f10
	xnor	%l6,	0x0849,	%o0
	fxors	%f6,	%f26,	%f1
	move	%icc,	%o1,	%g1
	movn	%xcc,	%o2,	%i5
	stw	%i3,	[%l7 + 0x44]
	edge32l	%i7,	%g6,	%o7
	sethi	0x0DD6,	%i0
	fcmped	%fcc1,	%f22,	%f2
	fpadd32	%f28,	%f6,	%f22
	fmul8x16al	%f22,	%f1,	%f8
	movgu	%xcc,	%o3,	%l5
	sdivx	%g3,	0x0487,	%l2
	std	%f26,	[%l7 + 0x68]
	std	%f28,	[%l7 + 0x38]
	edge16l	%o4,	%i6,	%g5
	udiv	%l3,	0x0ED9,	%i1
	srax	%l0,	0x17,	%i4
	array16	%i2,	%l4,	%o6
	xnorcc	%g7,	%o5,	%g4
	ldsb	[%l7 + 0x24],	%g2
	fnot2s	%f17,	%f10
	fmovsleu	%xcc,	%f20,	%f28
	addc	%l6,	0x0D20,	%o0
	umul	%o1,	%l1,	%g1
	fmovdcc	%icc,	%f4,	%f17
	movrgz	%o2,	%i3,	%i7
	fmovscc	%xcc,	%f23,	%f5
	fmovsgu	%xcc,	%f4,	%f26
	stw	%i5,	[%l7 + 0x6C]
	edge32l	%o7,	%i0,	%g6
	ldsw	[%l7 + 0x6C],	%l5
	fones	%f15
	udivx	%g3,	0x1455,	%l2
	fandnot2s	%f15,	%f12,	%f20
	movge	%xcc,	%o4,	%i6
	movgu	%xcc,	%g5,	%o3
	ld	[%l7 + 0x18],	%f1
	sdivcc	%l3,	0x168A,	%l0
	fornot2s	%f21,	%f15,	%f19
	xnor	%i4,	0x0132,	%i1
	st	%f11,	[%l7 + 0x6C]
	edge8	%l4,	%i2,	%o6
	movrgz	%g7,	0x3A3,	%g4
	stb	%g2,	[%l7 + 0x35]
	fmovdpos	%icc,	%f1,	%f1
	fnors	%f5,	%f11,	%f23
	umul	%o5,	%l6,	%o1
	xor	%l1,	%g1,	%o2
	fmovsne	%xcc,	%f30,	%f3
	fmovsgu	%icc,	%f24,	%f18
	movl	%xcc,	%i3,	%o0
	and	%i5,	%i7,	%i0
	movg	%icc,	%g6,	%l5
	ldd	[%l7 + 0x18],	%f24
	fnot2	%f20,	%f22
	addcc	%o7,	%l2,	%g3
	edge16	%o4,	%g5,	%i6
	fabss	%f4,	%f18
	movl	%xcc,	%l3,	%o3
	edge16	%l0,	%i4,	%l4
	udivcc	%i1,	0x075E,	%o6
	umulcc	%g7,	0x0013,	%g4
	sdiv	%g2,	0x00A5,	%o5
	subc	%l6,	0x12DE,	%i2
	array32	%l1,	%o1,	%o2
	movvc	%xcc,	%g1,	%o0
	fcmpeq16	%f22,	%f24,	%i5
	edge8l	%i7,	%i3,	%i0
	srl	%l5,	0x1E,	%g6
	smul	%l2,	%o7,	%o4
	srl	%g5,	%i6,	%l3
	mulscc	%o3,	0x1F94,	%g3
	movl	%icc,	%i4,	%l4
	move	%xcc,	%i1,	%o6
	srax	%l0,	%g4,	%g2
	ldsh	[%l7 + 0x3A],	%o5
	move	%icc,	%g7,	%l6
	fmovse	%xcc,	%f26,	%f11
	ld	[%l7 + 0x4C],	%f23
	save %i2, %l1, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%o2,	%g1
	array32	%o0,	%i7,	%i3
	alignaddr	%i5,	%i0,	%l5
	fcmple32	%f26,	%f20,	%l2
	udivx	%o7,	0x19E8,	%o4
	movrgz	%g5,	0x098,	%g6
	movre	%l3,	%i6,	%g3
	ld	[%l7 + 0x7C],	%f5
	movcs	%icc,	%i4,	%o3
	orcc	%l4,	%i1,	%l0
	st	%f13,	[%l7 + 0x0C]
	edge32l	%g4,	%o6,	%g2
	movvc	%xcc,	%o5,	%g7
	edge16ln	%i2,	%l6,	%l1
	ldd	[%l7 + 0x08],	%f22
	fmovse	%icc,	%f28,	%f2
	movneg	%icc,	%o1,	%g1
	mulscc	%o2,	0x03E4,	%o0
	sdivcc	%i3,	0x1DC8,	%i5
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	sll	%l5,	0x1E,	%o4
	sth	%o7,	[%l7 + 0x50]
	movn	%icc,	%g6,	%g5
	fpmerge	%f8,	%f1,	%f24
	stx	%i6,	[%l7 + 0x60]
	sdiv	%l3,	0x14D3,	%i4
	andcc	%g3,	%o3,	%i1
	sdivx	%l4,	0x11E3,	%g4
	fmul8ulx16	%f26,	%f30,	%f20
	srl	%l0,	%g2,	%o5
	lduh	[%l7 + 0x58],	%g7
	fxnors	%f29,	%f28,	%f28
	std	%f2,	[%l7 + 0x40]
	fones	%f25
	popc	%o6,	%i2
	xnorcc	%l1,	%o1,	%l6
	edge16n	%o2,	%o0,	%g1
	sth	%i5,	[%l7 + 0x3A]
	pdist	%f18,	%f26,	%f26
	smulcc	%i3,	0x1F60,	%i0
	xnor	%l2,	0x11EF,	%l5
	std	%f28,	[%l7 + 0x58]
	movvs	%icc,	%i7,	%o7
	mova	%xcc,	%o4,	%g5
	srl	%i6,	%g6,	%l3
	or	%i4,	%g3,	%i1
	alignaddr	%o3,	%l4,	%l0
	fexpand	%f10,	%f10
	umul	%g2,	0x1E38,	%o5
	srax	%g4,	0x04,	%g7
	addc	%i2,	0x1F0E,	%o6
	array16	%l1,	%l6,	%o1
	sth	%o2,	[%l7 + 0x12]
	ld	[%l7 + 0x10],	%f24
	smul	%o0,	%g1,	%i3
	ldub	[%l7 + 0x18],	%i5
	movrgz	%l2,	0x33F,	%l5
	fmovsg	%xcc,	%f21,	%f1
	xorcc	%i0,	%o7,	%o4
	xnor	%g5,	%i7,	%i6
	sub	%g6,	0x1BEA,	%i4
	and	%l3,	0x06D8,	%i1
	sdiv	%o3,	0x05CB,	%l4
	fmovdle	%xcc,	%f31,	%f26
	movgu	%icc,	%g3,	%g2
	movrgez	%l0,	0x240,	%o5
	fnor	%f0,	%f24,	%f8
	movl	%icc,	%g7,	%i2
	udiv	%g4,	0x1108,	%l1
	alignaddr	%l6,	%o6,	%o1
	save %o2, 0x1AEE, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f0,	%f28,	%f30
	lduw	[%l7 + 0x6C],	%i3
	fxor	%f24,	%f18,	%f12
	movpos	%xcc,	%i5,	%l2
	mulx	%l5,	%o0,	%i0
	andncc	%o4,	%o7,	%g5
	edge32ln	%i6,	%g6,	%i7
	sllx	%l3,	0x17,	%i4
	movleu	%xcc,	%o3,	%l4
	fnot1s	%f11,	%f22
	ld	[%l7 + 0x40],	%f22
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f0
	ldub	[%l7 + 0x08],	%i1
	smulcc	%g3,	%g2,	%o5
	fmovrdgz	%l0,	%f28,	%f6
	movgu	%icc,	%g7,	%i2
	alignaddrl	%l1,	%l6,	%g4
	ldsh	[%l7 + 0x0E],	%o1
	fornot1s	%f19,	%f26,	%f8
	edge16n	%o2,	%g1,	%i3
	ldx	[%l7 + 0x78],	%i5
	edge16n	%o6,	%l5,	%o0
	fmovsvs	%icc,	%f19,	%f29
	movre	%l2,	0x3D1,	%i0
	sdivcc	%o4,	0x18B5,	%g5
	or	%o7,	0x1831,	%g6
	ldd	[%l7 + 0x48],	%i6
	umul	%i6,	%i4,	%o3
	xnor	%l3,	0x1AE2,	%l4
	sdiv	%i1,	0x14A4,	%g3
	smulcc	%o5,	%l0,	%g7
	umul	%i2,	%l1,	%g2
	fmovrslez	%l6,	%f11,	%f25
	umul	%o1,	0x11FB,	%o2
	movrgez	%g4,	0x032,	%i3
	movneg	%icc,	%g1,	%i5
	mulx	%o6,	0x0E08,	%o0
	movre	%l5,	0x144,	%i0
	or	%l2,	%o4,	%g5
	edge8n	%o7,	%i7,	%g6
	fmovdge	%icc,	%f2,	%f3
	sth	%i4,	[%l7 + 0x3E]
	ldd	[%l7 + 0x78],	%o2
	srax	%i6,	%l3,	%l4
	and	%i1,	0x14A1,	%g3
	ldd	[%l7 + 0x58],	%o4
	fcmple32	%f24,	%f24,	%l0
	sdiv	%g7,	0x1E2B,	%l1
	addcc	%i2,	%g2,	%o1
	fones	%f15
	subc	%l6,	%o2,	%i3
	edge8l	%g4,	%g1,	%i5
	srax	%o0,	%l5,	%i0
	srl	%l2,	%o4,	%o6
	orncc	%o7,	%i7,	%g5
	ldsb	[%l7 + 0x0A],	%g6
	stx	%i4,	[%l7 + 0x50]
	sll	%i6,	0x1A,	%l3
	udiv	%l4,	0x1516,	%o3
	fcmpgt16	%f20,	%f30,	%i1
	fand	%f18,	%f30,	%f26
	sub	%g3,	0x027F,	%o5
	umulcc	%l0,	0x1FC9,	%g7
	alignaddr	%l1,	%g2,	%i2
	mova	%xcc,	%l6,	%o1
	sub	%o2,	0x1A3B,	%g4
	udivx	%g1,	0x1DB9,	%i3
	stb	%i5,	[%l7 + 0x49]
	fmovdcc	%xcc,	%f28,	%f31
	sdivx	%l5,	0x0CC3,	%o0
	movg	%xcc,	%l2,	%o4
	nop
	set	0x78, %o7
	ldsb	[%l7 + %o7],	%i0
	array16	%o6,	%o7,	%g5
	movge	%icc,	%g6,	%i4
	fsrc1s	%f28,	%f18
	sdivx	%i7,	0x11A0,	%i6
	addccc	%l4,	%o3,	%l3
	std	%f28,	[%l7 + 0x78]
	edge32n	%i1,	%o5,	%l0
	fmovsgu	%xcc,	%f29,	%f22
	fmovsvs	%xcc,	%f7,	%f30
	edge16ln	%g3,	%l1,	%g2
	edge32ln	%i2,	%g7,	%l6
	mulx	%o1,	0x09CC,	%o2
	fabsd	%f4,	%f12
	array32	%g4,	%g1,	%i5
	mulscc	%i3,	%o0,	%l2
	edge32ln	%l5,	%o4,	%i0
	restore %o6, 0x09F3, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f20,	%f18,	%f8
	fmovdgu	%icc,	%f11,	%f11
	fnot1	%f10,	%f2
	udivx	%g6,	0x1EE2,	%i4
	udivcc	%i7,	0x070A,	%g5
	sdivx	%i6,	0x166D,	%l4
	fmul8x16al	%f16,	%f12,	%f30
	fxors	%f20,	%f1,	%f0
	fzeros	%f29
	fmovrdgez	%o3,	%f30,	%f12
	srlx	%l3,	0x13,	%i1
	movg	%xcc,	%l0,	%g3
	movvc	%icc,	%o5,	%g2
	mulscc	%i2,	0x12B0,	%g7
	fmovrsgez	%l1,	%f22,	%f17
	stb	%l6,	[%l7 + 0x36]
	orn	%o2,	%o1,	%g1
	fmovdpos	%xcc,	%f0,	%f0
	movrne	%i5,	0x086,	%g4
	array16	%o0,	%i3,	%l5
	movne	%xcc,	%o4,	%i0
	sdivx	%o6,	0x1791,	%l2
	sdiv	%g6,	0x1A17,	%o7
	sub	%i4,	%g5,	%i6
	movle	%xcc,	%i7,	%l4
	mova	%xcc,	%l3,	%o3
	stx	%l0,	[%l7 + 0x08]
	fmovsa	%xcc,	%f14,	%f2
	fpadd16	%f0,	%f28,	%f22
	orncc	%i1,	0x0052,	%o5
	fmul8x16	%f0,	%f8,	%f26
	edge8	%g3,	%i2,	%g7
	sdivcc	%g2,	0x15FF,	%l1
	ldd	[%l7 + 0x38],	%f20
	ldd	[%l7 + 0x70],	%o2
	array16	%l6,	%g1,	%o1
	sdiv	%g4,	0x0833,	%o0
	srax	%i5,	0x15,	%i3
	srlx	%l5,	%i0,	%o6
	movrgz	%l2,	%g6,	%o7
	orn	%o4,	0x041A,	%i4
	fnot1s	%f18,	%f2
	movcc	%xcc,	%i6,	%i7
	andn	%g5,	0x0AD3,	%l4
	fsrc1s	%f23,	%f26
	movrlez	%l3,	0x20E,	%o3
	std	%f28,	[%l7 + 0x78]
	fcmpgt32	%f26,	%f14,	%l0
	movge	%xcc,	%i1,	%g3
	orn	%i2,	%o5,	%g2
	subccc	%g7,	%o2,	%l1
	movre	%g1,	0x12D,	%l6
	edge16ln	%g4,	%o1,	%i5
	movl	%xcc,	%o0,	%l5
	ldub	[%l7 + 0x25],	%i0
	sth	%o6,	[%l7 + 0x6A]
	array16	%l2,	%g6,	%i3
	mova	%icc,	%o7,	%o4
	movrlez	%i6,	%i4,	%i7
	movvc	%icc,	%g5,	%l4
	mulscc	%l3,	%o3,	%l0
	movne	%icc,	%i1,	%i2
	fmovsleu	%xcc,	%f28,	%f4
	movg	%icc,	%o5,	%g3
	edge16n	%g7,	%o2,	%l1
	sdivcc	%g2,	0x1F49,	%l6
	edge32ln	%g4,	%g1,	%i5
	andn	%o1,	0x081A,	%o0
	move	%xcc,	%l5,	%o6
	andncc	%i0,	%l2,	%i3
	umulcc	%o7,	%o4,	%g6
	fpadd32s	%f20,	%f18,	%f25
	stw	%i4,	[%l7 + 0x1C]
	fandnot2	%f20,	%f4,	%f20
	array8	%i6,	%i7,	%g5
	fands	%f17,	%f21,	%f26
	movneg	%icc,	%l4,	%o3
	xnorcc	%l0,	0x166A,	%l3
	sdivcc	%i1,	0x1E26,	%i2
	andncc	%g3,	%g7,	%o5
	movleu	%xcc,	%l1,	%o2
	andcc	%l6,	0x1F14,	%g2
	fmovdg	%xcc,	%f11,	%f29
	ldsb	[%l7 + 0x17],	%g4
	smul	%g1,	%i5,	%o0
	fpsub32	%f6,	%f26,	%f0
	addccc	%l5,	%o1,	%o6
	lduh	[%l7 + 0x7A],	%l2
	movgu	%xcc,	%i3,	%o7
	array16	%i0,	%o4,	%i4
	fpsub16s	%f9,	%f20,	%f4
	fmovsgu	%xcc,	%f20,	%f2
	edge32	%i6,	%g6,	%i7
	andn	%l4,	%g5,	%o3
	fmovrsgz	%l0,	%f17,	%f24
	ldsb	[%l7 + 0x09],	%l3
	and	%i2,	%i1,	%g3
	sra	%o5,	%l1,	%g7
	fpadd32	%f26,	%f30,	%f2
	mova	%xcc,	%o2,	%g2
	srl	%l6,	0x05,	%g1
	add	%g4,	%o0,	%l5
	stx	%o1,	[%l7 + 0x40]
	and	%o6,	0x0CBC,	%i5
	andncc	%i3,	%l2,	%i0
	add	%o4,	%i4,	%i6
	movl	%xcc,	%g6,	%i7
	fmovdle	%icc,	%f15,	%f29
	fmul8x16au	%f30,	%f3,	%f12
	umulcc	%o7,	%g5,	%l4
	fxnor	%f18,	%f12,	%f12
	alignaddrl	%o3,	%l3,	%i2
	movrgez	%i1,	%g3,	%o5
	sll	%l0,	%l1,	%o2
	movrlez	%g7,	0x129,	%g2
	subc	%l6,	%g1,	%g4
	edge16ln	%l5,	%o0,	%o6
	subc	%i5,	%o1,	%i3
	andncc	%l2,	%i0,	%o4
	subccc	%i4,	0x0F69,	%g6
	sdivcc	%i7,	0x199A,	%i6
	fsrc2s	%f3,	%f0
	movpos	%xcc,	%g5,	%o7
	nop
	set	0x6F, %o0
	stb	%o3,	[%l7 + %o0]
	mulscc	%l3,	0x0B02,	%l4
	popc	0x048C,	%i1
	ldd	[%l7 + 0x08],	%f22
	and	%i2,	%g3,	%o5
	sdivx	%l1,	0x0063,	%o2
	xnorcc	%g7,	0x0168,	%g2
	array8	%l0,	%l6,	%g4
	array32	%g1,	%o0,	%o6
	addc	%i5,	%l5,	%o1
	st	%f15,	[%l7 + 0x4C]
	array8	%l2,	%i3,	%i0
	edge16l	%o4,	%i4,	%i7
	fandnot1	%f10,	%f2,	%f12
	and	%i6,	%g6,	%g5
	movrgez	%o3,	%o7,	%l3
	sth	%l4,	[%l7 + 0x76]
	fpack32	%f24,	%f26,	%f18
	edge8	%i1,	%g3,	%o5
	srax	%l1,	%i2,	%o2
	umul	%g7,	%l0,	%l6
	ld	[%l7 + 0x70],	%f26
	sll	%g4,	0x15,	%g2
	ld	[%l7 + 0x58],	%f15
	xnorcc	%o0,	0x1DF9,	%g1
	and	%o6,	%l5,	%o1
	udivx	%l2,	0x1E84,	%i3
	pdist	%f18,	%f10,	%f16
	srlx	%i0,	%i5,	%i4
	movn	%xcc,	%o4,	%i6
	fsrc2	%f2,	%f30
	smulcc	%g6,	%g5,	%o3
	edge32ln	%i7,	%l3,	%o7
	nop
	set	0x47, %i7
	ldub	[%l7 + %i7],	%i1
	movne	%xcc,	%g3,	%l4
	movne	%icc,	%l1,	%o5
	subcc	%o2,	%i2,	%l0
	movcc	%xcc,	%g7,	%g4
	pdist	%f24,	%f6,	%f30
	smul	%l6,	%o0,	%g1
	popc	%o6,	%l5
	ldx	[%l7 + 0x70],	%g2
	siam	0x6
	fmovse	%icc,	%f3,	%f7
	movrlz	%o1,	%i3,	%l2
	fmul8x16al	%f9,	%f10,	%f26
	ldsb	[%l7 + 0x3D],	%i5
	nop
	set	0x3C, %g7
	stw	%i4,	[%l7 + %g7]
	ldx	[%l7 + 0x18],	%o4
	std	%f30,	[%l7 + 0x20]
	udiv	%i6,	0x06EF,	%g6
	movpos	%icc,	%g5,	%i0
	umulcc	%i7,	%o3,	%o7
	fcmped	%fcc0,	%f26,	%f8
	move	%xcc,	%l3,	%g3
	fandnot1s	%f14,	%f14,	%f11
	addc	%i1,	%l4,	%o5
	fpsub32	%f10,	%f12,	%f2
	movleu	%icc,	%o2,	%i2
	alignaddr	%l0,	%g7,	%l1
	lduw	[%l7 + 0x74],	%g4
	edge32ln	%o0,	%g1,	%o6
	movg	%xcc,	%l5,	%g2
	sdivx	%o1,	0x0DCB,	%i3
	fsrc2	%f16,	%f18
	smulcc	%l2,	%l6,	%i4
	lduh	[%l7 + 0x6E],	%o4
	fmovrdne	%i5,	%f24,	%f12
	ldsh	[%l7 + 0x1E],	%i6
	movrgz	%g5,	0x126,	%g6
	edge32ln	%i0,	%i7,	%o3
	ldsh	[%l7 + 0x2A],	%l3
	mulscc	%g3,	%i1,	%o7
	fxor	%f20,	%f26,	%f16
	fnor	%f20,	%f30,	%f24
	movne	%xcc,	%l4,	%o2
	stw	%i2,	[%l7 + 0x34]
	stx	%l0,	[%l7 + 0x78]
	movcs	%xcc,	%o5,	%g7
	sth	%g4,	[%l7 + 0x70]
	ldub	[%l7 + 0x34],	%o0
	fornot1s	%f22,	%f13,	%f24
	array32	%l1,	%g1,	%l5
	sdivcc	%o6,	0x08B5,	%g2
	subc	%o1,	%l2,	%l6
	sth	%i4,	[%l7 + 0x42]
	mova	%xcc,	%i3,	%o4
	movleu	%xcc,	%i5,	%g5
	addcc	%g6,	0x199D,	%i0
	sdiv	%i7,	0x163B,	%i6
	fandnot1	%f22,	%f0,	%f10
	array16	%o3,	%g3,	%l3
	addccc	%o7,	%i1,	%o2
	mulx	%l4,	%l0,	%o5
	edge32l	%g7,	%g4,	%o0
	srl	%i2,	0x0D,	%l1
	ldd	[%l7 + 0x28],	%l4
	ldd	[%l7 + 0x10],	%f28
	fsrc1	%f2,	%f22
	add	%g1,	0x002A,	%g2
	save %o1, %l2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%i4,	%o6
	fnors	%f7,	%f4,	%f7
	array16	%i3,	%i5,	%g5
	movrgez	%o4,	%i0,	%g6
	fmovrdgz	%i6,	%f16,	%f20
	sllx	%o3,	%i7,	%l3
	subcc	%g3,	0x035A,	%i1
	xnor	%o2,	0x00C0,	%l4
	edge16l	%l0,	%o7,	%g7
	andcc	%g4,	0x1DD6,	%o0
	stb	%i2,	[%l7 + 0x33]
	edge32	%o5,	%l5,	%l1
	sub	%g2,	0x0124,	%o1
	xnor	%l2,	%l6,	%g1
	fmuld8ulx16	%f12,	%f21,	%f18
	add	%o6,	%i4,	%i3
	ld	[%l7 + 0x10],	%f0
	movrne	%g5,	0x115,	%o4
	subcc	%i5,	0x1680,	%i0
	stw	%i6,	[%l7 + 0x30]
	edge8l	%o3,	%g6,	%i7
	sdivcc	%g3,	0x1A01,	%i1
	fmovdgu	%icc,	%f27,	%f25
	movle	%icc,	%o2,	%l3
	fpmerge	%f14,	%f28,	%f26
	edge8l	%l4,	%o7,	%l0
	fmovrslz	%g4,	%f23,	%f31
	udiv	%o0,	0x0DC3,	%i2
	edge32n	%o5,	%l5,	%l1
	edge8n	%g7,	%g2,	%o1
	andn	%l2,	%l6,	%o6
	movpos	%icc,	%i4,	%g1
	st	%f13,	[%l7 + 0x2C]
	array16	%i3,	%o4,	%i5
	movne	%icc,	%i0,	%i6
	addccc	%o3,	0x105F,	%g5
	sth	%i7,	[%l7 + 0x7E]
	udiv	%g6,	0x19AE,	%g3
	edge8	%i1,	%l3,	%l4
	alignaddr	%o2,	%o7,	%l0
	and	%g4,	%o0,	%i2
	fmovrslez	%o5,	%f0,	%f20
	orn	%l1,	%g7,	%l5
	movg	%xcc,	%o1,	%l2
	orncc	%l6,	%g2,	%o6
	xnorcc	%g1,	%i4,	%i3
	orn	%o4,	0x0FCF,	%i0
	fnand	%f22,	%f18,	%f24
	sir	0x159D
	edge8	%i5,	%o3,	%g5
	andncc	%i6,	%g6,	%i7
	nop
	set	0x1C, %i5
	stw	%i1,	[%l7 + %i5]
	movrlez	%g3,	%l4,	%l3
	movrlez	%o7,	%o2,	%g4
	ldsh	[%l7 + 0x42],	%o0
	mova	%xcc,	%l0,	%i2
	subcc	%o5,	%l1,	%g7
	edge8	%o1,	%l2,	%l5
	edge16ln	%g2,	%l6,	%o6
	movne	%icc,	%g1,	%i3
	sub	%i4,	0x0D39,	%i0
	subc	%i5,	%o3,	%g5
	fmovde	%xcc,	%f11,	%f23
	fmovdne	%xcc,	%f18,	%f19
	fandnot1s	%f21,	%f2,	%f15
	for	%f10,	%f16,	%f22
	xnorcc	%i6,	0x1505,	%o4
	fornot2s	%f6,	%f21,	%f30
	fmovrsne	%g6,	%f9,	%f2
	edge8l	%i7,	%g3,	%l4
	fmovdcc	%icc,	%f28,	%f5
	movne	%xcc,	%i1,	%o7
	ldsb	[%l7 + 0x4E],	%l3
	fnot2s	%f2,	%f13
	smulcc	%o2,	%o0,	%g4
	xorcc	%i2,	%l0,	%l1
	srax	%g7,	%o1,	%l2
	ldsb	[%l7 + 0x39],	%o5
	movrlz	%g2,	%l6,	%o6
	fmul8x16au	%f2,	%f0,	%f28
	sub	%g1,	%i3,	%l5
	andcc	%i4,	%i0,	%o3
	array8	%g5,	%i6,	%i5
	edge32	%o4,	%i7,	%g3
	smulcc	%l4,	%i1,	%o7
	alignaddr	%l3,	%g6,	%o2
	sdivx	%o0,	0x04F1,	%i2
	umulcc	%g4,	%l0,	%l1
	edge32l	%g7,	%l2,	%o1
	umul	%g2,	0x1DF6,	%o5
	edge16ln	%o6,	%g1,	%i3
	mulscc	%l6,	0x01F6,	%i4
	or	%i0,	0x101B,	%l5
	xor	%o3,	0x0438,	%i6
	fmovrdgez	%g5,	%f10,	%f22
	fcmpeq16	%f16,	%f16,	%i5
	fors	%f12,	%f8,	%f6
	xnorcc	%o4,	%g3,	%l4
	fmul8x16al	%f8,	%f3,	%f10
	ldd	[%l7 + 0x10],	%f0
	udiv	%i7,	0x19C5,	%i1
	nop
	set	0x34, %i1
	sth	%l3,	[%l7 + %i1]
	ldub	[%l7 + 0x61],	%g6
	sdivcc	%o7,	0x1C61,	%o2
	fmovsne	%xcc,	%f1,	%f27
	movre	%o0,	%i2,	%l0
	fnot2s	%f25,	%f16
	sub	%g4,	0x1C98,	%l1
	movrne	%l2,	%o1,	%g7
	ldd	[%l7 + 0x58],	%f4
	andcc	%o5,	%g2,	%g1
	stw	%o6,	[%l7 + 0x20]
	xnor	%i3,	%i4,	%l6
	fnors	%f16,	%f19,	%f21
	xnor	%l5,	0x1475,	%i0
	save %i6, 0x0E75, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i5,	0x11,	%g5
	movcc	%icc,	%g3,	%o4
	fandnot1s	%f31,	%f0,	%f25
	stx	%i7,	[%l7 + 0x40]
	fcmps	%fcc1,	%f15,	%f5
	umul	%i1,	%l4,	%g6
	fmovdgu	%xcc,	%f1,	%f1
	subc	%o7,	%l3,	%o2
	fcmpne32	%f30,	%f26,	%o0
	lduw	[%l7 + 0x6C],	%l0
	movl	%icc,	%g4,	%i2
	movrlz	%l2,	0x36C,	%o1
	movcs	%xcc,	%l1,	%o5
	ldsh	[%l7 + 0x3E],	%g7
	fabsd	%f30,	%f28
	array8	%g1,	%o6,	%i3
	xnor	%g2,	0x0A4A,	%i4
	fcmps	%fcc3,	%f12,	%f21
	movleu	%icc,	%l6,	%i0
	movrgez	%i6,	%l5,	%o3
	srl	%g5,	%g3,	%i5
	fandnot1s	%f10,	%f31,	%f20
	sra	%o4,	0x1E,	%i1
	edge16	%i7,	%g6,	%o7
	alignaddr	%l3,	%o2,	%o0
	xor	%l0,	%l4,	%g4
	movre	%l2,	0x2D9,	%i2
	andn	%l1,	0x14A8,	%o1
	ldsb	[%l7 + 0x5B],	%g7
	movrlz	%o5,	0x170,	%g1
	ld	[%l7 + 0x14],	%f19
	udivcc	%o6,	0x02D0,	%i3
	addccc	%i4,	0x1A98,	%g2
	movleu	%xcc,	%l6,	%i6
	udivcc	%i0,	0x084F,	%l5
	movn	%icc,	%g5,	%g3
	sllx	%o3,	%o4,	%i1
	xorcc	%i5,	%g6,	%o7
	movrgz	%i7,	%l3,	%o2
	sllx	%o0,	%l4,	%l0
	stb	%g4,	[%l7 + 0x49]
	ldd	[%l7 + 0x18],	%l2
	fmovda	%icc,	%f1,	%f3
	fnands	%f18,	%f13,	%f28
	edge8	%i2,	%o1,	%g7
	fsrc1	%f24,	%f4
	edge32ln	%l1,	%o5,	%o6
	movre	%i3,	0x0CD,	%g1
	for	%f22,	%f0,	%f16
	udivcc	%i4,	0x123F,	%g2
	lduw	[%l7 + 0x70],	%l6
	mulx	%i0,	%i6,	%l5
	popc	%g3,	%o3
	movvc	%icc,	%g5,	%i1
	mulscc	%i5,	%o4,	%o7
	umul	%g6,	0x0BCB,	%l3
	bshuffle	%f4,	%f8,	%f22
	fpsub16	%f24,	%f16,	%f24
	array8	%o2,	%o0,	%l4
	mulx	%i7,	%g4,	%l2
	sdivcc	%l0,	0x0C23,	%o1
	ldsw	[%l7 + 0x2C],	%g7
	movcc	%icc,	%i2,	%l1
	alignaddrl	%o6,	%i3,	%g1
	srl	%i4,	0x00,	%g2
	ldx	[%l7 + 0x50],	%o5
	or	%l6,	0x1702,	%i6
	sll	%l5,	0x1E,	%g3
	movcc	%xcc,	%o3,	%i0
	srlx	%i1,	0x0B,	%i5
	fmovsl	%icc,	%f27,	%f15
	movrgz	%g5,	%o4,	%o7
	stx	%l3,	[%l7 + 0x30]
	lduh	[%l7 + 0x12],	%g6
	fmul8x16au	%f14,	%f22,	%f0
	fmovsvs	%icc,	%f28,	%f0
	fmovse	%icc,	%f7,	%f15
	or	%o0,	%o2,	%l4
	addcc	%g4,	0x0C45,	%l2
	lduh	[%l7 + 0x2E],	%l0
	fpack32	%f8,	%f4,	%f2
	fcmpeq16	%f14,	%f24,	%i7
	edge16	%g7,	%o1,	%l1
	fmovspos	%xcc,	%f11,	%f14
	ldsh	[%l7 + 0x16],	%o6
	movle	%icc,	%i3,	%i2
	sdivx	%g1,	0x17EC,	%i4
	addcc	%o5,	0x18C5,	%l6
	edge16n	%i6,	%l5,	%g2
	fpadd16	%f4,	%f14,	%f12
	fnegd	%f2,	%f2
	save %o3, %g3, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x4C],	%f6
	stw	%i5,	[%l7 + 0x50]
	fors	%f7,	%f8,	%f5
	movle	%icc,	%i1,	%g5
	fmovsne	%xcc,	%f17,	%f26
	fexpand	%f15,	%f8
	stw	%o7,	[%l7 + 0x64]
	save %o4, %g6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o2,	0x1DD5,	%l4
	umul	%l3,	0x013D,	%l2
	movg	%icc,	%l0,	%i7
	or	%g7,	%o1,	%l1
	std	%f14,	[%l7 + 0x70]
	orn	%g4,	%o6,	%i2
	fpadd32s	%f26,	%f30,	%f2
	ldub	[%l7 + 0x6B],	%g1
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	or	%l6,	0x060D,	%i6
	fornot1	%f6,	%f18,	%f4
	fmovsvc	%icc,	%f29,	%f28
	restore %l5, %o3, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i0,	0x17E,	%i5
	sethi	0x0075,	%g3
	movle	%xcc,	%g5,	%o7
	umul	%o4,	0x069A,	%g6
	alignaddr	%o0,	%o2,	%l4
	andcc	%i1,	%l3,	%l0
	orncc	%l2,	%i7,	%g7
	fexpand	%f11,	%f28
	edge8ln	%o1,	%g4,	%l1
	movl	%xcc,	%i2,	%o6
	ldub	[%l7 + 0x51],	%i3
	ldub	[%l7 + 0x1A],	%g1
	movrne	%i4,	%l6,	%i6
	udiv	%o5,	0x08A0,	%o3
	array32	%l5,	%i0,	%g2
	ldd	[%l7 + 0x38],	%f0
	fmul8x16au	%f1,	%f20,	%f26
	fmovde	%icc,	%f0,	%f21
	bshuffle	%f24,	%f26,	%f14
	array32	%i5,	%g3,	%o7
	fornot1	%f30,	%f8,	%f16
	movvc	%icc,	%o4,	%g5
	movneg	%icc,	%o0,	%o2
	edge8n	%g6,	%i1,	%l3
	umul	%l0,	0x0323,	%l2
	popc	0x1EEC,	%l4
	movcc	%icc,	%g7,	%o1
	smulcc	%g4,	%l1,	%i7
	sdiv	%i2,	0x030F,	%i3
	sth	%g1,	[%l7 + 0x0E]
	movn	%icc,	%o6,	%l6
	edge32	%i6,	%o5,	%o3
	movneg	%xcc,	%i4,	%i0
	sra	%g2,	0x1A,	%i5
	movgu	%xcc,	%l5,	%g3
	movvs	%xcc,	%o7,	%o4
	subc	%o0,	0x0291,	%o2
	smul	%g5,	%g6,	%i1
	andcc	%l3,	%l0,	%l4
	movrne	%g7,	%o1,	%l2
	subcc	%g4,	%i7,	%i2
	movleu	%icc,	%l1,	%i3
	smulcc	%g1,	%o6,	%i6
	edge8n	%l6,	%o3,	%i4
	sdivcc	%i0,	0x18A1,	%o5
	save %g2, 0x0B5A, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%g3,	[%l7 + 0x6A]
	edge16	%l5,	%o4,	%o7
	ldub	[%l7 + 0x78],	%o2
	add	%g5,	%g6,	%o0
	fands	%f20,	%f1,	%f14
	fxors	%f31,	%f19,	%f8
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	fxor	%f30,	%f24,	%f22
	edge16n	%l0,	%g7,	%o1
	andncc	%l2,	%l4,	%i7
	fmovsl	%xcc,	%f11,	%f14
	andn	%i2,	%g4,	%i3
	udivx	%g1,	0x0483,	%l1
	move	%icc,	%i6,	%l6
	fcmped	%fcc0,	%f30,	%f24
	edge32n	%o6,	%i4,	%i0
	movrgz	%o3,	0x001,	%g2
	st	%f14,	[%l7 + 0x7C]
	addc	%i5,	0x083E,	%g3
	fmovsge	%xcc,	%f27,	%f3
	edge8n	%l5,	%o5,	%o4
	movcs	%xcc,	%o7,	%o2
	fmovsne	%icc,	%f28,	%f3
	srl	%g6,	0x0C,	%g5
	fmovdneg	%icc,	%f18,	%f21
	fxors	%f28,	%f6,	%f15
	edge32	%l3,	%o0,	%i1
	add	%l0,	%g7,	%o1
	xnorcc	%l4,	0x0670,	%l2
	mulx	%i2,	0x0AF0,	%g4
	movrlz	%i7,	%g1,	%i3
	fmovsg	%xcc,	%f23,	%f8
	orn	%i6,	%l1,	%l6
	fmovrdlz	%o6,	%f22,	%f6
	edge8	%i4,	%o3,	%g2
	movn	%xcc,	%i5,	%g3
	popc	0x0509,	%i0
	andncc	%o5,	%o4,	%o7
	edge16ln	%l5,	%g6,	%o2
	movrgez	%l3,	0x38F,	%o0
	lduh	[%l7 + 0x6A],	%g5
	movrgz	%l0,	%i1,	%g7
	subcc	%l4,	%l2,	%i2
	add	%o1,	0x0256,	%g4
	movne	%icc,	%i7,	%i3
	stb	%i6,	[%l7 + 0x5F]
	movge	%icc,	%g1,	%l6
	movg	%icc,	%o6,	%i4
	ld	[%l7 + 0x6C],	%f30
	movvc	%xcc,	%l1,	%o3
	srl	%g2,	%g3,	%i0
	andcc	%i5,	%o5,	%o4
	ld	[%l7 + 0x14],	%f12
	ldd	[%l7 + 0x50],	%f26
	fpack16	%f20,	%f4
	bshuffle	%f28,	%f14,	%f6
	fmovrslz	%l5,	%f22,	%f16
	sethi	0x0A5D,	%g6
	edge16	%o7,	%l3,	%o0
	movcs	%xcc,	%o2,	%g5
	fmul8x16au	%f8,	%f24,	%f6
	fcmpgt32	%f2,	%f26,	%i1
	fnot2	%f24,	%f18
	nop
	set	0x34, %o3
	lduh	[%l7 + %o3],	%l0
	orcc	%g7,	0x0E1A,	%l2
	alignaddrl	%i2,	%l4,	%g4
	andncc	%o1,	%i7,	%i6
	array16	%i3,	%g1,	%o6
	subc	%l6,	0x0206,	%l1
	fpsub32	%f22,	%f12,	%f10
	ld	[%l7 + 0x14],	%f24
	fcmpeq16	%f8,	%f24,	%o3
	fmovsgu	%xcc,	%f23,	%f23
	siam	0x5
	movl	%xcc,	%g2,	%g3
	srl	%i0,	%i4,	%i5
	movgu	%xcc,	%o4,	%l5
	edge32n	%o5,	%o7,	%l3
	subcc	%g6,	%o0,	%o2
	srax	%i1,	%g5,	%l0
	movrgez	%l2,	0x17F,	%i2
	xor	%g7,	%l4,	%o1
	sdiv	%i7,	0x056A,	%g4
	fornot1	%f6,	%f26,	%f24
	edge8n	%i3,	%g1,	%o6
	for	%f6,	%f20,	%f4
	xor	%i6,	%l6,	%l1
	add	%g2,	%o3,	%g3
	addc	%i0,	0x1397,	%i4
	fxnor	%f8,	%f24,	%f22
	or	%i5,	0x1859,	%o4
	movleu	%icc,	%l5,	%o5
	edge16	%l3,	%g6,	%o0
	addc	%o7,	0x061A,	%o2
	fmovdle	%xcc,	%f19,	%f22
	alignaddrl	%g5,	%i1,	%l0
	umul	%l2,	%i2,	%g7
	edge8ln	%l4,	%o1,	%g4
	fands	%f11,	%f7,	%f20
	std	%f4,	[%l7 + 0x70]
	movvc	%xcc,	%i3,	%g1
	fones	%f25
	fpsub32s	%f23,	%f8,	%f10
	nop
	set	0x6C, %g5
	stw	%i7,	[%l7 + %g5]
	movre	%i6,	0x13A,	%l6
	xnor	%o6,	0x0A35,	%l1
	edge8	%o3,	%g2,	%g3
	udivcc	%i0,	0x0BA7,	%i4
	fcmpd	%fcc0,	%f26,	%f20
	andcc	%o4,	0x0282,	%i5
	smul	%l5,	%o5,	%l3
	ldsh	[%l7 + 0x32],	%o0
	mulscc	%o7,	0x1E29,	%g6
	edge32ln	%o2,	%i1,	%g5
	movne	%icc,	%l2,	%l0
	xor	%i2,	0x1AD8,	%g7
	fxor	%f4,	%f22,	%f8
	lduw	[%l7 + 0x24],	%o1
	sethi	0x0EDA,	%l4
	addcc	%g4,	0x01D8,	%g1
	movl	%icc,	%i3,	%i6
	movne	%icc,	%i7,	%o6
	fmovsn	%icc,	%f4,	%f9
	for	%f30,	%f6,	%f16
	fpack32	%f8,	%f26,	%f22
	st	%f29,	[%l7 + 0x74]
	sir	0x0B4D
	restore %l6, 0x03DE, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g2,	%o3,	%g3
	addcc	%i0,	0x062F,	%i4
	edge8n	%i5,	%o4,	%o5
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	stb	%o0,	[%l7 + 0x47]
	fmovsn	%icc,	%f29,	%f0
	fmovdgu	%icc,	%f5,	%f19
	fornot2s	%f10,	%f5,	%f31
	smulcc	%o2,	%g6,	%g5
	fmovspos	%icc,	%f20,	%f1
	movgu	%xcc,	%i1,	%l2
	fmovrdlez	%i2,	%f6,	%f22
	fsrc1	%f10,	%f6
	subc	%l0,	%g7,	%l4
	stw	%g4,	[%l7 + 0x0C]
	xor	%g1,	%i3,	%i6
	movrlez	%o1,	0x21B,	%i7
	stx	%l6,	[%l7 + 0x20]
	subcc	%o6,	%g2,	%o3
	save %l1, 0x11E4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f12,	[%l7 + 0x60]
	fmovsg	%icc,	%f2,	%f15
	sra	%g3,	%i4,	%o4
	sdivcc	%o5,	0x0442,	%i5
	orn	%l5,	%o7,	%l3
	fmovrslez	%o2,	%f4,	%f25
	edge32n	%g6,	%g5,	%o0
	andn	%l2,	0x13D4,	%i2
	edge8n	%i1,	%l0,	%g7
	edge8n	%g4,	%l4,	%i3
	andncc	%i6,	%o1,	%g1
	stx	%l6,	[%l7 + 0x70]
	and	%o6,	%i7,	%g2
	movvc	%xcc,	%o3,	%i0
	movpos	%icc,	%l1,	%i4
	mulscc	%o4,	0x0F44,	%o5
	umulcc	%g3,	%l5,	%i5
	ldsw	[%l7 + 0x10],	%o7
	movcs	%xcc,	%l3,	%g6
	mulscc	%o2,	0x1079,	%g5
	ldsb	[%l7 + 0x45],	%l2
	edge16n	%i2,	%o0,	%i1
	fmovrdgz	%g7,	%f16,	%f22
	fmovdgu	%xcc,	%f30,	%f9
	udivx	%g4,	0x07C9,	%l4
	edge16n	%i3,	%i6,	%o1
	edge16	%g1,	%l0,	%l6
	movcs	%xcc,	%i7,	%g2
	alignaddr	%o3,	%i0,	%o6
	andncc	%l1,	%o4,	%o5
	movre	%i4,	%g3,	%l5
	fpackfix	%f2,	%f24
	edge16l	%i5,	%o7,	%g6
	array32	%o2,	%g5,	%l2
	save %i2, 0x19FB, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%icc,	%f14,	%f31
	fnegd	%f16,	%f14
	edge8	%i1,	%l3,	%g7
	restore %l4, %i3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f14,	%f16,	%f30
	movcc	%icc,	%o1,	%i6
	xnor	%g1,	%l0,	%l6
	ldsw	[%l7 + 0x2C],	%g2
	sdiv	%i7,	0x046C,	%i0
	fmovdpos	%icc,	%f22,	%f30
	edge8l	%o6,	%o3,	%o4
	fpsub16s	%f15,	%f17,	%f20
	fpmerge	%f17,	%f29,	%f18
	mulscc	%l1,	%o5,	%i4
	fmovs	%f28,	%f31
	fmovde	%xcc,	%f5,	%f27
	movleu	%xcc,	%l5,	%g3
	edge16	%i5,	%g6,	%o2
	mova	%icc,	%o7,	%l2
	movrlez	%g5,	0x038,	%o0
	fornot2s	%f20,	%f12,	%f23
	fnors	%f11,	%f31,	%f4
	fmovscc	%icc,	%f2,	%f27
	fmovdleu	%icc,	%f30,	%f6
	fcmpne32	%f12,	%f6,	%i2
	faligndata	%f0,	%f26,	%f28
	movgu	%icc,	%i1,	%g7
	sethi	0x18FA,	%l3
	fcmpeq32	%f28,	%f4,	%l4
	edge8l	%g4,	%i3,	%i6
	st	%f31,	[%l7 + 0x44]
	fabsd	%f4,	%f10
	and	%o1,	0x1E8B,	%l0
	faligndata	%f10,	%f0,	%f18
	sra	%l6,	0x08,	%g2
	sra	%i7,	0x02,	%g1
	fnegs	%f20,	%f12
	edge16ln	%o6,	%o3,	%o4
	stb	%l1,	[%l7 + 0x35]
	fornot2s	%f9,	%f27,	%f14
	nop
	set	0x67, %g1
	ldsb	[%l7 + %g1],	%i0
	edge16	%i4,	%o5,	%l5
	udivx	%i5,	0x1F25,	%g3
	subccc	%o2,	0x0FE2,	%o7
	ldd	[%l7 + 0x60],	%l2
	ldd	[%l7 + 0x10],	%f2
	fpackfix	%f16,	%f24
	fnegd	%f26,	%f22
	movvs	%icc,	%g6,	%o0
	sethi	0x0634,	%g5
	sdivcc	%i2,	0x1CA4,	%i1
	fmovrsgz	%l3,	%f26,	%f6
	movrlez	%l4,	%g4,	%i3
	orncc	%g7,	0x1FEA,	%o1
	xnor	%i6,	0x1A14,	%l6
	ldd	[%l7 + 0x68],	%f4
	nop
	set	0x39, %g3
	ldsb	[%l7 + %g3],	%l0
	movcc	%icc,	%i7,	%g2
	sll	%g1,	0x1C,	%o3
	edge16ln	%o4,	%l1,	%o6
	fcmple32	%f2,	%f4,	%i0
	addcc	%i4,	%l5,	%i5
	sethi	0x0C57,	%g3
	movvc	%xcc,	%o5,	%o2
	sllx	%o7,	0x1C,	%g6
	movrgz	%o0,	%l2,	%g5
	movcs	%icc,	%i2,	%l3
	nop
	set	0x50, %o6
	std	%f16,	[%l7 + %o6]
	stx	%i1,	[%l7 + 0x60]
	st	%f19,	[%l7 + 0x68]
	nop
	set	0x14, %i3
	ldsh	[%l7 + %i3],	%g4
	mulscc	%i3,	%g7,	%o1
	fmovdvc	%icc,	%f27,	%f28
	for	%f26,	%f0,	%f2
	orn	%l4,	0x13FF,	%l6
	lduw	[%l7 + 0x28],	%l0
	edge8	%i6,	%g2,	%i7
	st	%f7,	[%l7 + 0x30]
	stx	%g1,	[%l7 + 0x50]
	array16	%o4,	%o3,	%o6
	addc	%l1,	0x0FB7,	%i0
	sdivx	%l5,	0x1138,	%i4
	fmovdne	%xcc,	%f27,	%f10
	smul	%g3,	0x195F,	%i5
	edge32n	%o5,	%o7,	%g6
	movrne	%o2,	%o0,	%l2
	add	%g5,	0x0591,	%l3
	sdivcc	%i1,	0x167E,	%i2
	movrgez	%i3,	%g4,	%g7
	and	%l4,	0x0297,	%o1
	lduh	[%l7 + 0x08],	%l0
	movg	%xcc,	%i6,	%g2
	fxors	%f12,	%f16,	%f7
	edge32ln	%l6,	%g1,	%o4
	movre	%o3,	%i7,	%o6
	mova	%icc,	%l1,	%i0
	movge	%icc,	%i4,	%l5
	edge16l	%g3,	%o5,	%i5
	sub	%g6,	0x137D,	%o2
	ldd	[%l7 + 0x20],	%f20
	std	%f8,	[%l7 + 0x20]
	addc	%o7,	%l2,	%o0
	movgu	%icc,	%l3,	%g5
	sra	%i1,	%i3,	%i2
	fmovdpos	%icc,	%f27,	%f9
	movn	%xcc,	%g4,	%g7
	sir	0x0616
	udivcc	%l4,	0x1F95,	%l0
	alignaddr	%i6,	%o1,	%g2
	subc	%g1,	0x1EF2,	%l6
	addc	%o4,	%i7,	%o3
	subcc	%o6,	%l1,	%i4
	udivcc	%l5,	0x000C,	%i0
	movne	%icc,	%o5,	%i5
	subccc	%g3,	0x1088,	%g6
	sub	%o7,	%o2,	%o0
	fmovdle	%xcc,	%f27,	%f17
	sdiv	%l2,	0x07CD,	%g5
	nop
	set	0x6C, %i2
	ldsw	[%l7 + %i2],	%i1
	std	%f26,	[%l7 + 0x48]
	movgu	%xcc,	%l3,	%i3
	lduh	[%l7 + 0x18],	%g4
	addc	%g7,	0x1F89,	%i2
	smul	%l4,	0x16E0,	%i6
	xnorcc	%o1,	0x1E3C,	%g2
	stb	%g1,	[%l7 + 0x27]
	sth	%l6,	[%l7 + 0x50]
	movg	%xcc,	%o4,	%i7
	movrgez	%l0,	%o3,	%o6
	fandnot1s	%f2,	%f2,	%f5
	movrgz	%i4,	%l1,	%l5
	smulcc	%o5,	%i5,	%g3
	movgu	%icc,	%i0,	%g6
	orncc	%o2,	%o7,	%l2
	fmovsle	%xcc,	%f27,	%f6
	fsrc2s	%f6,	%f19
	udivcc	%g5,	0x1412,	%i1
	edge32	%o0,	%i3,	%g4
	udiv	%g7,	0x0DD7,	%l3
	siam	0x1
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	xorcc	%g2,	%o1,	%g1
	pdist	%f4,	%f30,	%f12
	edge32ln	%l6,	%o4,	%l0
	edge32	%i7,	%o3,	%o6
	srl	%i4,	%l5,	%o5
	lduh	[%l7 + 0x28],	%l1
	orcc	%i5,	%i0,	%g6
	edge32l	%g3,	%o7,	%l2
	sdivcc	%g5,	0x0A12,	%i1
	restore %o2, %o0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i3,	%g7,	%l3
	stx	%i2,	[%l7 + 0x28]
	fnot2	%f8,	%f24
	movrlez	%i6,	0x072,	%g2
	edge32ln	%o1,	%g1,	%l6
	andncc	%o4,	%l0,	%i7
	orn	%o3,	0x1F05,	%l4
	fand	%f28,	%f12,	%f16
	fmovsl	%icc,	%f14,	%f10
	sir	0x0471
	ldx	[%l7 + 0x48],	%i4
	movge	%xcc,	%l5,	%o6
	movvs	%xcc,	%o5,	%i5
	alignaddr	%l1,	%g6,	%g3
	ldd	[%l7 + 0x40],	%i0
	fsrc2	%f4,	%f14
	movneg	%xcc,	%o7,	%l2
	subccc	%i1,	0x0FE7,	%g5
	fmovrdlez	%o0,	%f14,	%f10
	movgu	%icc,	%g4,	%o2
	fmovsleu	%icc,	%f27,	%f10
	fmovrsgz	%i3,	%f4,	%f28
	srax	%g7,	%l3,	%i2
	fmovsa	%icc,	%f25,	%f25
	fexpand	%f0,	%f4
	fcmpgt16	%f4,	%f8,	%g2
	movleu	%xcc,	%i6,	%o1
	udiv	%g1,	0x1EDC,	%o4
	movg	%xcc,	%l0,	%l6
	orncc	%i7,	%l4,	%o3
	edge8n	%i4,	%l5,	%o6
	xnor	%i5,	%o5,	%g6
	mova	%icc,	%l1,	%g3
	xnor	%i0,	0x11FE,	%o7
	fnot1s	%f13,	%f4
	fpadd16	%f10,	%f18,	%f6
	movgu	%xcc,	%i1,	%l2
	addc	%g5,	%g4,	%o2
	stw	%i3,	[%l7 + 0x68]
	fpadd32s	%f23,	%f11,	%f29
	addccc	%g7,	0x1B17,	%o0
	movleu	%xcc,	%l3,	%g2
	sdivcc	%i2,	0x019F,	%o1
	fmovdgu	%icc,	%f8,	%f7
	nop
	set	0x08, %l1
	ldsw	[%l7 + %l1],	%g1
	fnegs	%f13,	%f22
	and	%i6,	0x17B5,	%l0
	srax	%o4,	0x1C,	%l6
	addccc	%i7,	0x07CE,	%l4
	popc	0x0CA4,	%i4
	orn	%o3,	0x0027,	%o6
	array16	%l5,	%o5,	%i5
	addcc	%l1,	0x0AE4,	%g6
	fmovdgu	%xcc,	%f1,	%f11
	sethi	0x04D0,	%i0
	movrgz	%o7,	0x03A,	%g3
	fmovrsne	%l2,	%f10,	%f31
	addccc	%g5,	0x15EF,	%i1
	movne	%xcc,	%g4,	%o2
	subcc	%i3,	%o0,	%g7
	mova	%icc,	%g2,	%i2
	udiv	%o1,	0x0258,	%g1
	lduw	[%l7 + 0x0C],	%l3
	st	%f22,	[%l7 + 0x14]
	st	%f11,	[%l7 + 0x60]
	fmovscc	%icc,	%f14,	%f12
	array8	%i6,	%l0,	%o4
	srl	%i7,	%l4,	%l6
	srl	%o3,	%o6,	%l5
	movcs	%xcc,	%o5,	%i4
	edge16	%i5,	%g6,	%i0
	movge	%xcc,	%l1,	%o7
	save %l2, 0x0712, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i1,	0x000,	%g4
	edge16l	%o2,	%i3,	%g3
	fzeros	%f16
	movrgz	%o0,	0x1DD,	%g7
	orn	%g2,	%i2,	%o1
	fpmerge	%f0,	%f0,	%f12
	sllx	%l3,	%i6,	%l0
	movleu	%xcc,	%g1,	%o4
	fmovscs	%icc,	%f22,	%f0
	fmovdg	%icc,	%f20,	%f17
	andcc	%i7,	%l6,	%l4
	smul	%o3,	%o6,	%l5
	subcc	%i4,	0x0298,	%i5
	subc	%o5,	%i0,	%g6
	edge16l	%l1,	%l2,	%g5
	fmovde	%icc,	%f23,	%f19
	stb	%i1,	[%l7 + 0x2C]
	movg	%xcc,	%o7,	%g4
	fabsd	%f12,	%f6
	srl	%i3,	%o2,	%o0
	andcc	%g7,	%g2,	%g3
	sethi	0x0116,	%i2
	srlx	%l3,	%o1,	%l0
	fmul8x16	%f15,	%f12,	%f26
	fcmped	%fcc0,	%f26,	%f2
	fsrc1s	%f3,	%f6
	srax	%g1,	%o4,	%i7
	fcmpd	%fcc2,	%f28,	%f4
	movcc	%icc,	%i6,	%l6
	movle	%icc,	%o3,	%l4
	fmovdge	%xcc,	%f25,	%f25
	movge	%icc,	%o6,	%l5
	stx	%i4,	[%l7 + 0x60]
	movl	%xcc,	%i5,	%o5
	ldub	[%l7 + 0x19],	%i0
	array16	%l1,	%g6,	%g5
	faligndata	%f4,	%f8,	%f18
	movvc	%xcc,	%l2,	%i1
	sethi	0x1E56,	%o7
	alignaddr	%i3,	%o2,	%g4
	fnot2s	%f14,	%f7
	sth	%g7,	[%l7 + 0x14]
	orncc	%g2,	%g3,	%o0
	ldub	[%l7 + 0x2F],	%l3
	ldx	[%l7 + 0x48],	%i2
	andncc	%o1,	%l0,	%o4
	sdiv	%i7,	0x1FE2,	%i6
	movrgez	%g1,	0x13B,	%l6
	ldsw	[%l7 + 0x48],	%l4
	movrgz	%o3,	%l5,	%i4
	fcmpgt32	%f24,	%f28,	%i5
	array8	%o5,	%i0,	%o6
	ldx	[%l7 + 0x70],	%l1
	movge	%xcc,	%g5,	%g6
	mulscc	%i1,	0x1B90,	%l2
	fcmpd	%fcc3,	%f4,	%f12
	siam	0x5
	array16	%o7,	%o2,	%i3
	stw	%g7,	[%l7 + 0x20]
	fnor	%f0,	%f4,	%f22
	andncc	%g2,	%g3,	%g4
	sra	%o0,	0x09,	%i2
	addcc	%o1,	%l3,	%o4
	udiv	%l0,	0x1FAA,	%i6
	ldx	[%l7 + 0x70],	%g1
	movvc	%icc,	%i7,	%l6
	fcmpne16	%f22,	%f0,	%o3
	popc	%l5,	%i4
	sdivx	%l4,	0x0600,	%i5
	fmovdl	%xcc,	%f28,	%f19
	edge8l	%i0,	%o6,	%o5
	edge16	%g5,	%g6,	%l1
	nop
	set	0x50, %o4
	sth	%i1,	[%l7 + %o4]
	sdivx	%l2,	0x1B0F,	%o7
	fmovsn	%xcc,	%f11,	%f26
	ldd	[%l7 + 0x30],	%f22
	movrgz	%i3,	%o2,	%g2
	movvc	%xcc,	%g3,	%g7
	movleu	%icc,	%g4,	%o0
	stw	%o1,	[%l7 + 0x30]
	fandnot2	%f16,	%f6,	%f18
	st	%f12,	[%l7 + 0x48]
	fmovsleu	%icc,	%f9,	%f4
	bshuffle	%f4,	%f12,	%f20
	movn	%icc,	%l3,	%i2
	udiv	%o4,	0x1E21,	%l0
	save %i6, %g1, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i7,	0x1A7A,	%o3
	fcmpes	%fcc3,	%f29,	%f27
	smul	%i4,	0x0BE2,	%l5
	movpos	%icc,	%i5,	%i0
	sdivx	%l4,	0x09E3,	%o6
	lduw	[%l7 + 0x78],	%o5
	ldd	[%l7 + 0x28],	%g4
	or	%l1,	0x04A2,	%i1
	orcc	%g6,	0x00C9,	%o7
	udiv	%i3,	0x0DF5,	%l2
	movle	%xcc,	%o2,	%g2
	ldsh	[%l7 + 0x6C],	%g3
	addccc	%g4,	0x1F56,	%g7
	fpack16	%f18,	%f1
	addccc	%o0,	0x1EA3,	%o1
	ldd	[%l7 + 0x20],	%i2
	movrlz	%l3,	%o4,	%i6
	fcmpeq32	%f22,	%f4,	%g1
	sub	%l0,	0x1D01,	%l6
	ld	[%l7 + 0x2C],	%f1
	fxnors	%f8,	%f2,	%f5
	popc	0x0C76,	%i7
	save %o3, 0x1121, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l5,	%i0,	%i5
	fmovdn	%xcc,	%f26,	%f21
	movge	%xcc,	%l4,	%o6
	sra	%g5,	0x04,	%l1
	movpos	%xcc,	%i1,	%g6
	xnor	%o7,	%o5,	%i3
	fmovsvc	%icc,	%f1,	%f21
	subcc	%l2,	%o2,	%g3
	movrne	%g2,	0x0D3,	%g4
	fmovsg	%xcc,	%f25,	%f22
	fnegs	%f17,	%f0
	edge32l	%o0,	%o1,	%g7
	movne	%xcc,	%l3,	%o4
	lduw	[%l7 + 0x6C],	%i6
	std	%f28,	[%l7 + 0x08]
	edge32ln	%g1,	%l0,	%l6
	movrne	%i7,	0x38A,	%o3
	edge32l	%i4,	%i2,	%l5
	fors	%f18,	%f25,	%f9
	movle	%xcc,	%i5,	%i0
	sll	%l4,	0x0A,	%g5
	fnot2s	%f15,	%f13
	ldx	[%l7 + 0x30],	%l1
	andn	%i1,	0x0E4F,	%g6
	udivcc	%o6,	0x1554,	%o7
	sra	%i3,	0x07,	%o5
	addccc	%l2,	0x0DC9,	%g3
	movvc	%xcc,	%g2,	%g4
	subccc	%o2,	0x04E2,	%o1
	andcc	%g7,	0x1D71,	%o0
	sdivcc	%o4,	0x1C70,	%i6
	fcmpgt32	%f6,	%f22,	%l3
	nop
	set	0x5F, %l5
	ldsb	[%l7 + %l5],	%l0
	sdivx	%l6,	0x16B7,	%g1
	ldx	[%l7 + 0x70],	%i7
	xnor	%i4,	0x1042,	%i2
	edge16l	%l5,	%o3,	%i5
	fxnors	%f8,	%f26,	%f27
	edge8n	%i0,	%l4,	%l1
	alignaddrl	%i1,	%g5,	%o6
	movrgez	%g6,	%i3,	%o7
	fpackfix	%f4,	%f13
	fmovrdne	%o5,	%f22,	%f30
	sllx	%l2,	%g2,	%g3
	movcs	%xcc,	%g4,	%o1
	save %g7, 0x1AD1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f2,	%f15,	%f22
	movneg	%xcc,	%o0,	%i6
	movrgez	%l3,	%o4,	%l6
	fcmpeq32	%f8,	%f12,	%g1
	siam	0x0
	xnorcc	%l0,	0x0810,	%i4
	sir	0x068C
	fzeros	%f29
	mulx	%i2,	0x0C57,	%l5
	fmovsle	%xcc,	%f11,	%f15
	edge8n	%i7,	%o3,	%i0
	andcc	%l4,	%l1,	%i5
	umulcc	%i1,	%o6,	%g5
	fmovrsne	%g6,	%f10,	%f15
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	alignaddrl	%l2,	%g2,	%g3
	lduh	[%l7 + 0x0E],	%g4
	edge8	%g7,	%o1,	%o0
	sdiv	%i6,	0x117A,	%l3
	movge	%xcc,	%o2,	%o4
	edge8l	%g1,	%l6,	%l0
	fmovdge	%icc,	%f26,	%f5
	edge8l	%i4,	%l5,	%i7
	smul	%o3,	0x06D1,	%i2
	ldub	[%l7 + 0x08],	%l4
	edge8l	%l1,	%i0,	%i5
	stx	%o6,	[%l7 + 0x30]
	movre	%g5,	0x39D,	%i1
	umulcc	%o7,	0x0478,	%o5
	movne	%icc,	%i3,	%l2
	subccc	%g6,	0x02C8,	%g3
	fornot1s	%f16,	%f29,	%f6
	fpsub16s	%f8,	%f29,	%f7
	popc	0x1A86,	%g2
	sdivx	%g4,	0x16D2,	%g7
	lduh	[%l7 + 0x24],	%o1
	fnot2	%f6,	%f16
	fpack16	%f12,	%f6
	movcc	%icc,	%o0,	%i6
	fnors	%f3,	%f3,	%f27
	movrgez	%l3,	0x2DA,	%o2
	and	%o4,	0x03CC,	%g1
	alignaddr	%l0,	%i4,	%l5
	sll	%l6,	%o3,	%i7
	stb	%l4,	[%l7 + 0x17]
	addcc	%l1,	0x07EA,	%i2
	fmovrsgez	%i0,	%f11,	%f2
	movgu	%icc,	%o6,	%g5
	fmovsl	%xcc,	%f13,	%f22
	fmovdle	%icc,	%f27,	%f13
	ld	[%l7 + 0x34],	%f11
	ld	[%l7 + 0x28],	%f26
	fxors	%f15,	%f18,	%f3
	fzero	%f16
	movleu	%xcc,	%i5,	%i1
	andcc	%o5,	%i3,	%o7
	popc	%g6,	%l2
	ldsb	[%l7 + 0x18],	%g2
	movg	%icc,	%g3,	%g7
	edge8l	%g4,	%o0,	%i6
	andn	%o1,	0x1F3E,	%o2
	movle	%icc,	%o4,	%l3
	sth	%l0,	[%l7 + 0x1C]
	lduw	[%l7 + 0x20],	%i4
	smulcc	%l5,	0x118A,	%l6
	fpsub32s	%f21,	%f2,	%f7
	fmovrse	%o3,	%f18,	%f15
	movre	%g1,	0x0A8,	%l4
	addcc	%l1,	0x1A90,	%i7
	xnor	%i0,	%i2,	%g5
	movrlz	%i5,	%o6,	%i1
	sethi	0x14C4,	%o5
	ldub	[%l7 + 0x40],	%o7
	sth	%i3,	[%l7 + 0x16]
	pdist	%f4,	%f22,	%f22
	edge16l	%l2,	%g6,	%g2
	movrgz	%g3,	%g4,	%g7
	ldub	[%l7 + 0x77],	%i6
	popc	0x1790,	%o0
	sra	%o1,	%o4,	%o2
	srlx	%l3,	%i4,	%l0
	fpsub16	%f24,	%f2,	%f20
	edge16n	%l5,	%l6,	%o3
	ldsh	[%l7 + 0x40],	%g1
	sra	%l4,	0x0D,	%l1
	fors	%f18,	%f26,	%f29
	ld	[%l7 + 0x78],	%f27
	subcc	%i0,	0x1783,	%i2
	restore %g5, 0x1611, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o6,	%i7,	%o5
	fpsub16	%f2,	%f18,	%f4
	subcc	%i1,	%o7,	%l2
	add	%g6,	%g2,	%i3
	movrlz	%g3,	0x34C,	%g7
	umul	%g4,	%i6,	%o0
	sll	%o1,	0x02,	%o4
	movleu	%xcc,	%l3,	%i4
	fmovrsgz	%l0,	%f1,	%f10
	smul	%o2,	%l5,	%l6
	srl	%g1,	0x1E,	%l4
	edge8l	%l1,	%o3,	%i0
	mulx	%i2,	%g5,	%o6
	sir	0x0182
	udivcc	%i5,	0x1AB0,	%o5
	sethi	0x1641,	%i7
	ldsh	[%l7 + 0x32],	%o7
	addccc	%i1,	0x0213,	%l2
	fands	%f9,	%f14,	%f10
	sllx	%g2,	%g6,	%i3
	udiv	%g7,	0x0EC7,	%g3
	move	%icc,	%g4,	%i6
	lduw	[%l7 + 0x58],	%o0
	stw	%o4,	[%l7 + 0x50]
	fmovsneg	%icc,	%f14,	%f6
	movre	%o1,	%l3,	%i4
	edge16l	%o2,	%l0,	%l6
	sethi	0x1854,	%l5
	sdivx	%l4,	0x04B3,	%l1
	xnorcc	%g1,	0x1C50,	%i0
	sdivcc	%i2,	0x16AE,	%g5
	array8	%o3,	%i5,	%o6
	addcc	%o5,	0x1E09,	%i7
	movpos	%icc,	%i1,	%l2
	udiv	%o7,	0x1516,	%g2
	ld	[%l7 + 0x7C],	%f22
	xor	%i3,	%g6,	%g3
	xnor	%g4,	0x0976,	%g7
	lduh	[%l7 + 0x66],	%o0
	fmul8ulx16	%f18,	%f0,	%f16
	ldsh	[%l7 + 0x40],	%o4
	edge32	%i6,	%l3,	%i4
	ldd	[%l7 + 0x08],	%o2
	popc	0x0A85,	%o1
	orcc	%l0,	0x1B31,	%l5
	fxor	%f12,	%f4,	%f18
	movrgz	%l4,	%l6,	%l1
	fmovdpos	%xcc,	%f30,	%f8
	array32	%i0,	%g1,	%g5
	fornot1	%f16,	%f4,	%f30
	andcc	%i2,	%o3,	%i5
	edge8	%o5,	%i7,	%i1
	fornot1	%f16,	%f4,	%f12
	ldub	[%l7 + 0x65],	%l2
	edge8l	%o7,	%o6,	%i3
	xorcc	%g6,	0x13A1,	%g2
	fmovrdlez	%g3,	%f14,	%f20
	edge32l	%g4,	%g7,	%o0
	movrgez	%i6,	%o4,	%l3
	andn	%o2,	%o1,	%i4
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	nop
	set	0x18, %i4
	std	%f28,	[%l7 + %i4]
	fpsub32	%f16,	%f18,	%f8
	mulscc	%l4,	%i0,	%l1
	ld	[%l7 + 0x4C],	%f21
	xnor	%g1,	0x081C,	%i2
	fnors	%f24,	%f5,	%f0
	ld	[%l7 + 0x14],	%f16
	edge16l	%o3,	%i5,	%g5
	movleu	%xcc,	%o5,	%i7
	array8	%l2,	%i1,	%o6
	sdiv	%o7,	0x181E,	%i3
	ldsw	[%l7 + 0x20],	%g2
	srax	%g6,	0x1B,	%g4
	fmovspos	%xcc,	%f29,	%f31
	smul	%g3,	0x1FE7,	%g7
	alignaddr	%i6,	%o0,	%o4
	stb	%l3,	[%l7 + 0x6B]
	lduw	[%l7 + 0x1C],	%o2
	andcc	%i4,	0x1CE7,	%o1
	move	%icc,	%l5,	%l6
	movge	%icc,	%l0,	%i0
	mulx	%l4,	0x008F,	%g1
	popc	%i2,	%l1
	movleu	%icc,	%o3,	%i5
	array16	%o5,	%g5,	%l2
	umul	%i1,	%i7,	%o6
	smul	%o7,	0x0463,	%g2
	edge16	%i3,	%g6,	%g3
	fmovdpos	%xcc,	%f19,	%f29
	movrlez	%g4,	0x037,	%i6
	fmovdcc	%xcc,	%f0,	%f8
	movrgz	%o0,	%g7,	%l3
	edge16l	%o2,	%i4,	%o4
	sdiv	%o1,	0x05FF,	%l6
	movle	%xcc,	%l0,	%i0
	fmovsl	%xcc,	%f18,	%f25
	andn	%l5,	%g1,	%i2
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%f6
	sub	%l4,	0x1870,	%o3
	ldd	[%l7 + 0x58],	%l0
	fpackfix	%f28,	%f25
	movle	%icc,	%i5,	%g5
	fmovdcc	%xcc,	%f23,	%f23
	ldd	[%l7 + 0x50],	%o4
	xor	%l2,	0x1681,	%i7
	array8	%o6,	%o7,	%i1
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f6
	orncc	%g2,	%i3,	%g6
	ldsb	[%l7 + 0x25],	%g4
	edge16n	%i6,	%o0,	%g7
	fmovsl	%xcc,	%f25,	%f28
	movl	%icc,	%l3,	%g3
	movrgez	%i4,	0x007,	%o4
	umulcc	%o2,	%o1,	%l6
	smulcc	%l0,	%l5,	%g1
	movrgz	%i0,	0x036,	%l4
	edge16	%i2,	%l1,	%o3
	fcmpne32	%f28,	%f0,	%i5
	sdiv	%o5,	0x0F79,	%g5
	popc	0x1BAD,	%l2
	fmovsvs	%xcc,	%f5,	%f28
	ld	[%l7 + 0x74],	%f21
	fnot2s	%f8,	%f31
	fmovsleu	%icc,	%f5,	%f11
	movle	%xcc,	%i7,	%o6
	movcs	%icc,	%i1,	%o7
	nop
	set	0x18, %l4
	stb	%g2,	[%l7 + %l4]
	xorcc	%g6,	0x0457,	%g4
	fmovde	%icc,	%f5,	%f9
	sub	%i6,	0x094E,	%i3
	movvs	%xcc,	%o0,	%l3
	movvc	%xcc,	%g3,	%i4
	orn	%o4,	%o2,	%g7
	fors	%f11,	%f20,	%f9
	andcc	%l6,	%l0,	%o1
	fpadd32s	%f5,	%f31,	%f26
	sth	%g1,	[%l7 + 0x18]
	fmul8sux16	%f28,	%f10,	%f22
	fcmpes	%fcc1,	%f26,	%f19
	movge	%xcc,	%i0,	%l5
	movpos	%icc,	%i2,	%l1
	stx	%l4,	[%l7 + 0x10]
	fnors	%f17,	%f12,	%f3
	sllx	%i5,	0x0B,	%o3
	stw	%g5,	[%l7 + 0x70]
	array16	%l2,	%i7,	%o5
	sra	%i1,	%o6,	%g2
	fcmpne16	%f24,	%f0,	%g6
	movpos	%icc,	%o7,	%i6
	ldsh	[%l7 + 0x6A],	%i3
	alignaddrl	%g4,	%l3,	%g3
	array8	%o0,	%o4,	%o2
	fmul8x16au	%f15,	%f20,	%f6
	orcc	%g7,	0x1EE0,	%l6
	restore %l0, 0x1AAD, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o1,	0x39B,	%g1
	sdiv	%l5,	0x0608,	%i0
	stw	%l1,	[%l7 + 0x78]
	srax	%l4,	%i5,	%i2
	movgu	%icc,	%o3,	%l2
	movcs	%xcc,	%i7,	%o5
	mulscc	%g5,	0x1E10,	%i1
	fnors	%f4,	%f29,	%f8
	movn	%icc,	%o6,	%g2
	orncc	%g6,	0x1E92,	%o7
	orncc	%i6,	%g4,	%i3
	array16	%l3,	%g3,	%o4
	edge8l	%o0,	%o2,	%l6
	ldx	[%l7 + 0x38],	%g7
	udivx	%i4,	0x0DA7,	%l0
	fmovsa	%icc,	%f3,	%f22
	st	%f22,	[%l7 + 0x38]
	orcc	%g1,	%o1,	%i0
	subccc	%l1,	%l4,	%i5
	xorcc	%i2,	%l5,	%l2
	movge	%icc,	%i7,	%o3
	sll	%o5,	0x1D,	%g5
	umul	%o6,	0x0BE0,	%i1
	st	%f20,	[%l7 + 0x64]
	orcc	%g6,	0x1136,	%o7
	fmovsg	%xcc,	%f22,	%f7
	movne	%xcc,	%g2,	%i6
	udivcc	%g4,	0x04F1,	%i3
	movcs	%icc,	%l3,	%o4
	smul	%g3,	0x111E,	%o2
	sethi	0x0797,	%o0
	edge8	%g7,	%l6,	%l0
	fcmple32	%f6,	%f26,	%g1
	fornot2	%f24,	%f30,	%f14
	std	%f12,	[%l7 + 0x28]
	movneg	%icc,	%o1,	%i4
	addc	%l1,	%l4,	%i5
	save %i2, %i0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f4,	%f26,	%f26
	sethi	0x13AE,	%i7
	fpsub32	%f22,	%f12,	%f2
	addc	%l2,	0x11CF,	%o3
	fmovdneg	%xcc,	%f2,	%f0
	movg	%icc,	%g5,	%o6
	orcc	%i1,	0x0260,	%o5
	srax	%g6,	%g2,	%i6
	stb	%g4,	[%l7 + 0x56]
	fmovdn	%icc,	%f21,	%f7
	stw	%i3,	[%l7 + 0x30]
	movn	%icc,	%o7,	%o4
	movre	%l3,	%g3,	%o2
	sllx	%o0,	%g7,	%l0
	subcc	%l6,	0x0010,	%o1
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%g0
	smulcc	%i4,	0x0904,	%l4
	movrgez	%l1,	0x2CF,	%i2
	fcmpne16	%f20,	%f2,	%i5
	movne	%xcc,	%l5,	%i7
	lduw	[%l7 + 0x7C],	%i0
	fnot1	%f16,	%f8
	sdivx	%l2,	0x1558,	%o3
	movleu	%xcc,	%o6,	%g5
	edge8l	%o5,	%g6,	%g2
	edge8n	%i6,	%g4,	%i3
	save %o7, %o4, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%icc,	%f17,	%f19
	fxnor	%f2,	%f16,	%f10
	addcc	%g3,	%l3,	%o0
	sir	0x0C74
	fmovsvc	%icc,	%f11,	%f23
	st	%f2,	[%l7 + 0x14]
	fcmpd	%fcc0,	%f6,	%f16
	orcc	%g7,	%l0,	%o2
	movge	%icc,	%o1,	%l6
	ldsb	[%l7 + 0x4C],	%g1
	for	%f10,	%f16,	%f2
	alignaddr	%l4,	%l1,	%i4
	ldsb	[%l7 + 0x24],	%i5
	fcmps	%fcc3,	%f20,	%f4
	fmovdle	%xcc,	%f27,	%f23
	xor	%i2,	%l5,	%i0
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	sdivcc	%g5,	0x16A2,	%o5
	edge8ln	%o6,	%g2,	%i6
	srl	%g4,	0x0F,	%i3
	lduw	[%l7 + 0x68],	%g6
	orncc	%o4,	%o7,	%g3
	xnorcc	%i1,	%l3,	%g7
	udiv	%o0,	0x1AC6,	%l0
	andncc	%o1,	%o2,	%g1
	stw	%l4,	[%l7 + 0x68]
	subcc	%l6,	0x02DA,	%l1
	edge16	%i5,	%i2,	%l5
	stx	%i0,	[%l7 + 0x70]
	edge16	%i4,	%i7,	%o3
	movg	%xcc,	%g5,	%l2
	addc	%o5,	0x16C9,	%g2
	ldd	[%l7 + 0x30],	%o6
	movneg	%xcc,	%i6,	%i3
	movgu	%icc,	%g6,	%o4
	ldd	[%l7 + 0x68],	%o6
	movrlz	%g4,	0x262,	%g3
	edge32l	%l3,	%g7,	%o0
	stw	%i1,	[%l7 + 0x24]
	orcc	%l0,	%o2,	%o1
	smul	%g1,	0x1E10,	%l4
	edge16n	%l1,	%i5,	%i2
	edge32l	%l5,	%i0,	%i4
	addcc	%i7,	0x14B0,	%l6
	ldd	[%l7 + 0x60],	%f8
	movle	%icc,	%o3,	%g5
	edge16ln	%o5,	%g2,	%l2
	udivcc	%i6,	0x0A5C,	%i3
	sdiv	%g6,	0x0CE5,	%o4
	ld	[%l7 + 0x58],	%f28
	sdiv	%o6,	0x1463,	%g4
	fmuld8ulx16	%f9,	%f26,	%f16
	fmovsleu	%xcc,	%f1,	%f27
	sub	%o7,	0x1CAE,	%g3
	movne	%xcc,	%g7,	%o0
	mulx	%i1,	%l3,	%l0
	xor	%o2,	0x0DE5,	%g1
	fmul8sux16	%f20,	%f20,	%f12
	fpadd16	%f22,	%f12,	%f12
	ldsb	[%l7 + 0x29],	%l4
	udivx	%o1,	0x1F2B,	%l1
	fones	%f23
	movrne	%i2,	0x19B,	%l5
	movvc	%xcc,	%i0,	%i4
	add	%i5,	0x1F6A,	%i7
	sra	%o3,	0x13,	%l6
	sethi	0x17AB,	%g5
	orncc	%o5,	0x0103,	%l2
	movgu	%xcc,	%i6,	%g2
	xor	%i3,	0x0DFA,	%g6
	xor	%o6,	%g4,	%o4
	ldsb	[%l7 + 0x2C],	%o7
	fmovrde	%g3,	%f24,	%f18
	umulcc	%o0,	%g7,	%i1
	orncc	%l3,	0x07C4,	%l0
	restore %o2, %g1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o1,	%i2,	%l5
	fmovrdgez	%l1,	%f4,	%f26
	sdivx	%i4,	0x0A9C,	%i5
	mulx	%i0,	0x0B30,	%o3
	edge8ln	%i7,	%g5,	%l6
	movrlz	%l2,	%o5,	%i6
	movl	%xcc,	%i3,	%g2
	movrgez	%g6,	0x16F,	%g4
	stx	%o6,	[%l7 + 0x20]
	movvc	%icc,	%o7,	%o4
	fsrc2	%f28,	%f0
	andn	%g3,	0x0D0A,	%o0
	umulcc	%i1,	%g7,	%l3
	fmovrdgez	%o2,	%f20,	%f26
	array8	%g1,	%l4,	%o1
	fxor	%f10,	%f30,	%f6
	or	%i2,	0x0697,	%l0
	movleu	%xcc,	%l5,	%i4
	umulcc	%i5,	%i0,	%o3
	sll	%i7,	0x19,	%l1
	movrgz	%g5,	0x362,	%l2
	fnot2s	%f2,	%f17
	srlx	%l6,	0x1E,	%i6
	stw	%o5,	[%l7 + 0x60]
	save %g2, 0x00A1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f18,	%f10
	fmovrdne	%g6,	%f0,	%f18
	movgu	%xcc,	%g4,	%o7
	or	%o6,	0x15D3,	%o4
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%f8
	movl	%xcc,	%o0,	%i1
	fmovrdlez	%g3,	%f30,	%f0
	edge8ln	%l3,	%g7,	%g1
	movrlez	%o2,	0x049,	%o1
	edge32n	%i2,	%l4,	%l5
	nop
	set	0x76, %l3
	stb	%i4,	[%l7 + %l3]
	stb	%l0,	[%l7 + 0x29]
	array16	%i5,	%o3,	%i0
	or	%i7,	%l1,	%l2
	edge32n	%g5,	%i6,	%l6
	fand	%f30,	%f28,	%f14
	srl	%o5,	0x13,	%i3
	nop
	set	0x3E, %g4
	sth	%g2,	[%l7 + %g4]
	alignaddr	%g6,	%g4,	%o7
	xnor	%o6,	%o4,	%o0
	sdivcc	%g3,	0x0983,	%l3
	fmovsn	%xcc,	%f9,	%f24
	andncc	%i1,	%g7,	%o2
	edge8ln	%o1,	%g1,	%i2
	fornot1	%f22,	%f26,	%f14
	edge32l	%l4,	%i4,	%l0
	ldsb	[%l7 + 0x62],	%l5
	orcc	%i5,	%o3,	%i7
	edge8l	%l1,	%l2,	%i0
	movrlez	%i6,	0x207,	%g5
	stx	%l6,	[%l7 + 0x68]
	movgu	%xcc,	%i3,	%g2
	fandnot1s	%f11,	%f22,	%f4
	fnot2s	%f21,	%f6
	fmovsgu	%icc,	%f17,	%f0
	srlx	%o5,	0x10,	%g6
	fcmple32	%f8,	%f6,	%o7
	smul	%o6,	%o4,	%g4
	movvc	%xcc,	%g3,	%o0
	movleu	%xcc,	%i1,	%g7
	std	%f28,	[%l7 + 0x70]
	fcmpeq32	%f16,	%f30,	%l3
	st	%f3,	[%l7 + 0x1C]
	ldsw	[%l7 + 0x18],	%o1
	fands	%f8,	%f29,	%f23
	movl	%icc,	%o2,	%g1
	srl	%i2,	%l4,	%i4
	sir	0x1002
	edge32n	%l5,	%i5,	%l0
	ldsw	[%l7 + 0x20],	%i7
	movcs	%xcc,	%l1,	%o3
	smul	%l2,	0x19E1,	%i0
	movgu	%xcc,	%i6,	%l6
	std	%f16,	[%l7 + 0x60]
	smul	%g5,	0x0E83,	%i3
	sdivx	%g2,	0x1D95,	%g6
	movrgez	%o5,	0x126,	%o7
	movrgz	%o4,	%g4,	%o6
	edge8l	%g3,	%i1,	%g7
	edge8l	%o0,	%l3,	%o1
	fsrc2s	%f20,	%f11
	sdivx	%o2,	0x1CAF,	%i2
	or	%l4,	%i4,	%l5
	fmuld8sux16	%f21,	%f30,	%f8
	movgu	%icc,	%g1,	%i5
	ld	[%l7 + 0x14],	%f23
	smulcc	%l0,	%l1,	%i7
	addcc	%l2,	%o3,	%i6
	edge32	%i0,	%g5,	%i3
	fnor	%f10,	%f8,	%f12
	sdiv	%g2,	0x1D1A,	%g6
	edge16l	%l6,	%o5,	%o7
	sir	0x1A26
	movrgez	%g4,	0x1CE,	%o4
	edge16ln	%o6,	%i1,	%g7
	sir	0x0911
	ldsw	[%l7 + 0x4C],	%g3
	sllx	%o0,	0x17,	%o1
	movl	%xcc,	%o2,	%l3
	fmovsne	%xcc,	%f6,	%f4
	ldd	[%l7 + 0x78],	%f30
	movge	%icc,	%l4,	%i2
	siam	0x5
	movle	%icc,	%i4,	%l5
	smul	%i5,	0x091C,	%g1
	sub	%l0,	0x0662,	%i7
	fmovdne	%icc,	%f27,	%f6
	umulcc	%l2,	%l1,	%i6
	fcmpeq32	%f26,	%f2,	%i0
	popc	0x0F2F,	%o3
	movg	%xcc,	%g5,	%g2
	fone	%f18
	edge8n	%i3,	%l6,	%o5
	movre	%o7,	%g4,	%o4
	fmovdcs	%xcc,	%f25,	%f12
	udivcc	%g6,	0x0FF5,	%i1
	fandnot1	%f30,	%f28,	%f18
	edge8l	%o6,	%g7,	%o0
	edge16ln	%g3,	%o2,	%l3
	srax	%o1,	0x05,	%l4
	sdiv	%i4,	0x04C8,	%i2
	orn	%i5,	0x11EC,	%l5
	fxnors	%f18,	%f0,	%f27
	ldx	[%l7 + 0x48],	%g1
	fmovdpos	%xcc,	%f2,	%f18
	fmovdleu	%icc,	%f16,	%f7
	stb	%i7,	[%l7 + 0x5C]
	movrne	%l2,	0x26B,	%l1
	movrgz	%l0,	%i6,	%i0
	fpsub16s	%f20,	%f26,	%f12
	st	%f15,	[%l7 + 0x54]
	edge16l	%o3,	%g2,	%i3
	ldub	[%l7 + 0x28],	%g5
	mova	%xcc,	%l6,	%o7
	save %g4, 0x1334, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o4,	%g6,	%o6
	ldub	[%l7 + 0x4A],	%g7
	edge16	%i1,	%g3,	%o2
	move	%icc,	%l3,	%o0
	edge32n	%o1,	%l4,	%i4
	edge32	%i2,	%l5,	%g1
	for	%f6,	%f6,	%f28
	sll	%i5,	0x02,	%l2
	movne	%icc,	%l1,	%l0
	smulcc	%i7,	0x03CA,	%i6
	fcmped	%fcc2,	%f16,	%f2
	addccc	%o3,	0x0805,	%g2
	srl	%i3,	0x0E,	%i0
	nop
	set	0x30, %o5
	ldsh	[%l7 + %o5],	%l6
	ldsh	[%l7 + 0x78],	%g5
	array8	%g4,	%o5,	%o7
	orncc	%g6,	0x00CB,	%o4
	andn	%o6,	%i1,	%g3
	movrgz	%o2,	0x15A,	%l3
	sra	%o0,	0x18,	%o1
	edge32l	%g7,	%l4,	%i4
	ldsw	[%l7 + 0x14],	%i2
	sub	%g1,	0x101D,	%l5
	andncc	%l2,	%i5,	%l1
	movre	%i7,	%l0,	%o3
	sethi	0x1F13,	%g2
	xnor	%i6,	0x1D30,	%i3
	umulcc	%i0,	%g5,	%g4
	movrgz	%l6,	0x3CD,	%o7
	st	%f10,	[%l7 + 0x54]
	movg	%icc,	%g6,	%o4
	edge8n	%o5,	%i1,	%g3
	mova	%icc,	%o2,	%o6
	ldd	[%l7 + 0x50],	%f14
	mulscc	%l3,	%o1,	%g7
	movre	%l4,	0x395,	%o0
	movge	%xcc,	%i2,	%g1
	edge16ln	%l5,	%l2,	%i4
	fmovdcc	%icc,	%f22,	%f8
	fone	%f12
	st	%f12,	[%l7 + 0x68]
	xorcc	%i5,	0x0727,	%i7
	array16	%l1,	%o3,	%l0
	movneg	%icc,	%g2,	%i3
	fcmped	%fcc0,	%f16,	%f0
	fmul8ulx16	%f0,	%f24,	%f2
	alignaddr	%i0,	%g5,	%g4
	orncc	%l6,	%i6,	%g6
	xorcc	%o4,	%o5,	%o7
	addccc	%g3,	%o2,	%i1
	fnands	%f19,	%f10,	%f9
	movrlez	%o6,	%o1,	%l3
	andncc	%g7,	%l4,	%o0
	fcmple32	%f22,	%f6,	%g1
	add	%l5,	%l2,	%i2
	movvc	%xcc,	%i4,	%i7
	smul	%l1,	%i5,	%l0
	fcmpne32	%f12,	%f14,	%g2
	alignaddr	%i3,	%o3,	%i0
	fmovsvs	%xcc,	%f2,	%f29
	movrlez	%g5,	%l6,	%i6
	fxor	%f2,	%f26,	%f2
	movrlez	%g6,	0x08E,	%g4
	movleu	%xcc,	%o4,	%o5
	sir	0x1C4D
	popc	%g3,	%o2
	orncc	%o7,	%o6,	%o1
	ldd	[%l7 + 0x18],	%i0
	movgu	%icc,	%g7,	%l4
	ld	[%l7 + 0x70],	%f25
	udivx	%l3,	0x0FAF,	%o0
	edge16l	%g1,	%l2,	%l5
	std	%f28,	[%l7 + 0x48]
	std	%f16,	[%l7 + 0x20]
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	and	%l1,	0x0139,	%i7
	movrgz	%l0,	0x279,	%i5
	array16	%i3,	%g2,	%i0
	movle	%xcc,	%o3,	%l6
	edge16	%g5,	%i6,	%g6
	xor	%o4,	0x0C88,	%g4
	edge16ln	%g3,	%o5,	%o7
	or	%o6,	0x0724,	%o2
	ldsw	[%l7 + 0x0C],	%o1
	nop
	set	0x28, %l0
	ldsb	[%l7 + %l0],	%i1
	sra	%l4,	%g7,	%l3
	srax	%g1,	0x10,	%o0
	std	%f4,	[%l7 + 0x68]
	fmovscc	%xcc,	%f19,	%f29
	movneg	%xcc,	%l5,	%i2
	orn	%l2,	%l1,	%i7
	smul	%i4,	0x011D,	%i5
	edge16l	%l0,	%i3,	%i0
	fcmpne16	%f0,	%f28,	%g2
	xor	%l6,	0x1902,	%o3
	fmovsg	%xcc,	%f11,	%f4
	edge16	%i6,	%g6,	%o4
	edge32ln	%g5,	%g4,	%g3
	array8	%o5,	%o6,	%o2
	orncc	%o7,	%i1,	%o1
	umulcc	%l4,	%g7,	%l3
	fmovdvc	%icc,	%f12,	%f31
	movleu	%icc,	%g1,	%o0
	edge32ln	%i2,	%l5,	%l2
	fcmpes	%fcc1,	%f19,	%f1
	fabsd	%f8,	%f16
	movvc	%xcc,	%i7,	%i4
	xorcc	%l1,	%l0,	%i3
	sll	%i5,	%g2,	%l6
	restore %i0, 0x1E0E, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g6,	%o4,	%i6
	fmovrse	%g5,	%f2,	%f4
	pdist	%f12,	%f0,	%f20
	sdivx	%g3,	0x0D43,	%o5
	fmovrslz	%o6,	%f18,	%f0
	fmovrsgez	%g4,	%f12,	%f23
	movl	%xcc,	%o2,	%i1
	ld	[%l7 + 0x40],	%f21
	udivcc	%o1,	0x1529,	%l4
	umulcc	%g7,	%l3,	%o7
	ldsb	[%l7 + 0x44],	%g1
	movne	%icc,	%i2,	%o0
	alignaddr	%l2,	%i7,	%l5
	sdiv	%l1,	0x065D,	%l0
	edge16l	%i4,	%i3,	%g2
	movvc	%xcc,	%i5,	%l6
	fmovrslz	%i0,	%f0,	%f12
	ldx	[%l7 + 0x18],	%o3
	array32	%g6,	%o4,	%g5
	sllx	%g3,	%o5,	%o6
	ldd	[%l7 + 0x60],	%i6
	sub	%g4,	%o2,	%o1
	fmovsvs	%xcc,	%f22,	%f3
	ld	[%l7 + 0x34],	%f11
	edge32n	%l4,	%i1,	%g7
	ldd	[%l7 + 0x30],	%f16
	movn	%icc,	%o7,	%l3
	edge8l	%g1,	%i2,	%o0
	umulcc	%i7,	%l2,	%l5
	fmovdne	%icc,	%f7,	%f23
	sdivx	%l0,	0x1315,	%i4
	sra	%l1,	%g2,	%i5
	edge8	%i3,	%l6,	%i0
	movle	%icc,	%g6,	%o3
	ldx	[%l7 + 0x58],	%o4
	popc	0x1F1C,	%g5
	movneg	%icc,	%g3,	%o5
	srl	%o6,	0x14,	%i6
	fnand	%f28,	%f4,	%f12
	ldsh	[%l7 + 0x44],	%o2
	andncc	%g4,	%o1,	%i1
	orcc	%g7,	%l4,	%l3
	movne	%xcc,	%o7,	%g1
	movne	%xcc,	%i2,	%i7
	edge8	%o0,	%l2,	%l0
	addcc	%l5,	%i4,	%g2
	fandnot1s	%f23,	%f17,	%f20
	movrlz	%l1,	0x2AC,	%i3
	fcmpd	%fcc3,	%f24,	%f12
	orncc	%l6,	%i5,	%i0
	fmovsleu	%xcc,	%f20,	%f30
	fmovdge	%icc,	%f28,	%f31
	or	%o3,	%o4,	%g6
	movrne	%g3,	0x1BC,	%g5
	alignaddrl	%o6,	%o5,	%o2
	edge8n	%g4,	%i6,	%i1
	movcc	%icc,	%g7,	%o1
	movneg	%icc,	%l3,	%l4
	sth	%g1,	[%l7 + 0x32]
	ldsw	[%l7 + 0x7C],	%o7
	sll	%i7,	0x12,	%i2
	fzeros	%f15
	edge8n	%l2,	%o0,	%l0
	fmovsl	%xcc,	%f20,	%f5
	popc	%l5,	%i4
	fmovrdlez	%l1,	%f20,	%f10
	ldd	[%l7 + 0x60],	%g2
	edge32	%l6,	%i5,	%i0
	lduh	[%l7 + 0x6C],	%i3
	movcs	%icc,	%o3,	%g6
	lduw	[%l7 + 0x10],	%o4
	fcmpgt32	%f6,	%f30,	%g5
	movg	%xcc,	%g3,	%o5
	sdiv	%o6,	0x1B8E,	%g4
	sub	%i6,	0x0741,	%o2
	alignaddr	%i1,	%o1,	%g7
	movrne	%l3,	0x12C,	%g1
	fcmple32	%f2,	%f16,	%o7
	popc	0x0E03,	%i7
	movleu	%icc,	%l4,	%l2
	udiv	%o0,	0x017D,	%i2
	or	%l0,	0x0BE3,	%i4
	for	%f4,	%f10,	%f24
	ldsh	[%l7 + 0x10],	%l1
	and	%l5,	%g2,	%l6
	ldsb	[%l7 + 0x74],	%i5
	smulcc	%i3,	%i0,	%o3
	fpackfix	%f12,	%f25
	xnorcc	%g6,	%o4,	%g3
	alignaddr	%g5,	%o6,	%g4
	orcc	%o5,	0x07B2,	%o2
	movn	%icc,	%i1,	%i6
	movne	%xcc,	%g7,	%l3
	movrlz	%g1,	0x33A,	%o1
	addccc	%o7,	0x1572,	%i7
	edge8n	%l2,	%l4,	%o0
	and	%i2,	0x0886,	%l0
	fxors	%f23,	%f16,	%f17
	mova	%xcc,	%l1,	%l5
	edge16l	%g2,	%i4,	%l6
	subccc	%i5,	0x169D,	%i0
	edge32	%i3,	%o3,	%g6
	edge32	%o4,	%g5,	%o6
	fones	%f13
	ldsw	[%l7 + 0x44],	%g3
	movleu	%xcc,	%o5,	%o2
	fpsub16	%f28,	%f2,	%f14
	srax	%g4,	0x19,	%i6
	udivx	%i1,	0x1B98,	%g7
	edge16n	%g1,	%o1,	%l3
	fpsub32	%f18,	%f2,	%f28
	fsrc2	%f24,	%f22
	lduh	[%l7 + 0x68],	%i7
	srax	%o7,	%l4,	%l2
	edge32l	%i2,	%l0,	%o0
	stx	%l5,	[%l7 + 0x78]
	ldx	[%l7 + 0x30],	%g2
	fcmpd	%fcc1,	%f12,	%f0
	movvc	%icc,	%i4,	%l1
	subccc	%l6,	%i0,	%i3
	edge32	%o3,	%i5,	%g6
	edge16l	%o4,	%g5,	%g3
	popc	0x12CB,	%o6
	edge8l	%o2,	%g4,	%i6
	movneg	%icc,	%o5,	%g7
	movgu	%xcc,	%i1,	%g1
	fmovsa	%icc,	%f25,	%f4
	edge16	%o1,	%l3,	%o7
	save %l4, %l2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f8,	%f15
	orncc	%i2,	0x0AD8,	%o0
	movrlez	%l5,	%g2,	%l0
	popc	0x08A6,	%l1
	movl	%xcc,	%l6,	%i0
	sll	%i3,	0x0B,	%o3
	fcmps	%fcc0,	%f3,	%f18
	faligndata	%f30,	%f10,	%f14
	sra	%i5,	0x0E,	%g6
	and	%o4,	0x0A18,	%i4
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%g2
	fones	%f10
	srlx	%g5,	%o2,	%o6
	edge8l	%i6,	%o5,	%g7
	movg	%xcc,	%i1,	%g4
	addccc	%o1,	0x092D,	%l3
	udivx	%o7,	0x1F94,	%g1
	sethi	0x0062,	%l4
	mulscc	%i7,	%i2,	%l2
	or	%o0,	0x0317,	%l5
	fexpand	%f12,	%f10
	movrlez	%g2,	0x3E2,	%l0
	srlx	%l1,	0x02,	%i0
	fpack16	%f10,	%f3
	ld	[%l7 + 0x24],	%f29
	fcmpgt32	%f2,	%f30,	%i3
	fornot2s	%f6,	%f2,	%f4
	movvs	%xcc,	%l6,	%o3
	ldsb	[%l7 + 0x4B],	%i5
	fornot2s	%f0,	%f7,	%f25
	movre	%o4,	0x0FA,	%g6
	ldsw	[%l7 + 0x08],	%i4
	fmul8x16al	%f1,	%f9,	%f18
	movvs	%icc,	%g3,	%g5
	move	%xcc,	%o2,	%i6
	fmovdl	%icc,	%f13,	%f16
	srlx	%o6,	%g7,	%i1
	edge16	%g4,	%o5,	%o1
	fmovsa	%icc,	%f26,	%f10
	orcc	%l3,	%o7,	%l4
	fnors	%f18,	%f16,	%f12
	srlx	%i7,	%g1,	%l2
	fmovrdgez	%o0,	%f12,	%f6
	edge8l	%l5,	%g2,	%l0
	movcs	%xcc,	%l1,	%i0
	add	%i2,	0x08A4,	%i3
	sub	%o3,	%i5,	%l6
	and	%o4,	0x1281,	%g6
	sethi	0x1BE7,	%g3
	and	%i4,	%o2,	%i6
	smulcc	%o6,	0x094F,	%g5
	edge8l	%g7,	%i1,	%o5
	andncc	%g4,	%l3,	%o1
	or	%o7,	0x0A40,	%i7
	movvs	%icc,	%g1,	%l4
	orcc	%l2,	0x17D5,	%o0
	movrgz	%l5,	%l0,	%g2
	movrne	%i0,	0x29C,	%i2
	sub	%i3,	%o3,	%l1
	movn	%xcc,	%l6,	%o4
	sdiv	%g6,	0x146F,	%g3
	movleu	%xcc,	%i5,	%o2
	fmovdpos	%xcc,	%f4,	%f0
	addccc	%i6,	%o6,	%g5
	sllx	%g7,	0x13,	%i4
	subccc	%o5,	0x0FF5,	%g4
	fcmpd	%fcc3,	%f12,	%f6
	andcc	%i1,	%o1,	%l3
	edge8ln	%o7,	%i7,	%l4
	movl	%xcc,	%g1,	%o0
	lduh	[%l7 + 0x14],	%l5
	movne	%icc,	%l2,	%l0
	sethi	0x0E8B,	%g2
	fpack32	%f10,	%f20,	%f8
	edge8ln	%i2,	%i3,	%i0
	addcc	%o3,	%l6,	%l1
	orncc	%g6,	0x1884,	%g3
	xorcc	%o4,	0x0F2E,	%o2
	movrlez	%i6,	0x374,	%i5
	addccc	%o6,	%g5,	%i4
	mova	%icc,	%g7,	%g4
	movpos	%icc,	%i1,	%o5
	edge32	%l3,	%o7,	%i7
	fmovsl	%icc,	%f22,	%f2
	movvc	%icc,	%o1,	%l4
	fone	%f4
	lduh	[%l7 + 0x16],	%o0
	fpack32	%f22,	%f12,	%f30
	ldx	[%l7 + 0x10],	%l5
	sir	0x18B4
	sdivcc	%g1,	0x0E8F,	%l0
	srax	%g2,	%l2,	%i2
	or	%i0,	%o3,	%l6
	edge8l	%i3,	%g6,	%g3
	fmovrsne	%l1,	%f6,	%f14
	edge8l	%o4,	%i6,	%i5
	addcc	%o2,	%o6,	%g5
	movge	%xcc,	%g7,	%g4
	udiv	%i4,	0x08FB,	%i1
	stb	%l3,	[%l7 + 0x3E]
	fornot1s	%f3,	%f16,	%f6
	lduh	[%l7 + 0x3A],	%o7
	xor	%o5,	0x1BFB,	%i7
	sllx	%l4,	%o0,	%o1
	srl	%l5,	0x07,	%l0
	edge8n	%g1,	%g2,	%l2
	nop
	set	0x7C, %g6
	ldsh	[%l7 + %g6],	%i2
	sub	%i0,	%o3,	%l6
	movneg	%xcc,	%g6,	%g3
	edge16	%l1,	%o4,	%i3
	edge32ln	%i6,	%o2,	%o6
	fcmpeq32	%f24,	%f24,	%g5
	fcmpne32	%f0,	%f12,	%i5
	orn	%g4,	0x1012,	%i4
	fsrc2	%f10,	%f4
	udiv	%i1,	0x014D,	%g7
	edge8ln	%o7,	%o5,	%i7
	ld	[%l7 + 0x30],	%f28
	ldsw	[%l7 + 0x40],	%l4
	xorcc	%l3,	%o1,	%l5
	stw	%l0,	[%l7 + 0x1C]
	fmul8x16al	%f15,	%f16,	%f10
	edge8	%o0,	%g1,	%g2
	movrlz	%l2,	0x370,	%i2
	movrlez	%i0,	0x222,	%o3
	movvc	%xcc,	%g6,	%l6
	sth	%g3,	[%l7 + 0x3A]
	movrgz	%o4,	0x09F,	%i3
	movre	%l1,	0x0DB,	%o2
	alignaddrl	%i6,	%o6,	%i5
	fcmpes	%fcc1,	%f18,	%f27
	srlx	%g5,	%g4,	%i1
	fsrc1	%f22,	%f20
	smul	%i4,	0x09AE,	%o7
	array8	%o5,	%i7,	%g7
	fpadd32s	%f30,	%f4,	%f28
	ldd	[%l7 + 0x48],	%l2
	ld	[%l7 + 0x40],	%f18
	andcc	%l4,	0x1BA7,	%l5
	add	%l0,	0x1072,	%o0
	subccc	%o1,	%g2,	%l2
	movvc	%xcc,	%g1,	%i2
	edge32	%i0,	%o3,	%l6
	stw	%g6,	[%l7 + 0x40]
	fcmpne32	%f10,	%f22,	%g3
	std	%f28,	[%l7 + 0x68]
	andn	%i3,	%l1,	%o2
	movle	%icc,	%o4,	%o6
	fmovrdgz	%i6,	%f0,	%f28
	srl	%g5,	%g4,	%i1
	fpack16	%f16,	%f12
	movneg	%icc,	%i4,	%i5
	srlx	%o5,	%o7,	%g7
	movpos	%xcc,	%l3,	%i7
	fpadd16s	%f9,	%f17,	%f4
	edge32n	%l5,	%l0,	%l4
	orn	%o1,	%o0,	%g2
	edge8n	%g1,	%l2,	%i2
	fmovdge	%xcc,	%f0,	%f6
	ldd	[%l7 + 0x10],	%i0
	alignaddr	%o3,	%l6,	%g3
	xorcc	%i3,	0x148B,	%g6
	xnor	%o2,	%l1,	%o4
	edge8l	%o6,	%i6,	%g4
	fnors	%f9,	%f1,	%f5
	ldd	[%l7 + 0x38],	%f0
	orncc	%i1,	%g5,	%i4
	sth	%o5,	[%l7 + 0x6E]
	orn	%i5,	0x1339,	%g7
	movcs	%icc,	%o7,	%i7
	edge8l	%l3,	%l0,	%l4
	edge8l	%o1,	%o0,	%g2
	andncc	%l5,	%l2,	%g1
	addccc	%i2,	%o3,	%i0
	udivx	%l6,	0x13AF,	%i3
	subccc	%g3,	%g6,	%o2
	movre	%l1,	%o4,	%o6
	edge8l	%i6,	%i1,	%g5
	subcc	%g4,	%o5,	%i5
	fandnot1	%f0,	%f30,	%f0
	udiv	%i4,	0x1116,	%o7
	orncc	%i7,	0x19D9,	%g7
	xor	%l3,	0x1E03,	%l0
	stx	%o1,	[%l7 + 0x48]
	fmovsl	%xcc,	%f12,	%f4
	edge8ln	%l4,	%g2,	%o0
	andcc	%l2,	0x15EC,	%l5
	movre	%g1,	0x395,	%o3
	alignaddrl	%i2,	%i0,	%i3
	udivcc	%l6,	0x1458,	%g6
	movvs	%icc,	%g3,	%l1
	movleu	%icc,	%o4,	%o6
	movl	%xcc,	%o2,	%i6
	movne	%icc,	%g5,	%g4
	fmuld8sux16	%f19,	%f3,	%f18
	fpackfix	%f16,	%f0
	movle	%icc,	%o5,	%i1
	mulx	%i4,	%o7,	%i7
	fpsub16s	%f0,	%f18,	%f9
	edge32	%g7,	%l3,	%i5
	movrgez	%o1,	0x1F3,	%l0
	faligndata	%f8,	%f28,	%f12
	movcc	%icc,	%l4,	%g2
	alignaddr	%o0,	%l2,	%g1
	fmovrdlez	%o3,	%f26,	%f6
	smulcc	%i2,	0x110C,	%i0
	fmovdleu	%icc,	%f27,	%f12
	movneg	%xcc,	%i3,	%l6
	fcmpd	%fcc3,	%f2,	%f2
	fpsub32	%f20,	%f28,	%f28
	fmovdcc	%xcc,	%f2,	%f23
	movcs	%icc,	%l5,	%g3
	fmovrse	%g6,	%f29,	%f4
	lduh	[%l7 + 0x0E],	%o4
	fpsub32	%f26,	%f20,	%f30
	movvc	%xcc,	%l1,	%o6
	sub	%i6,	%o2,	%g5
	movl	%icc,	%g4,	%i1
	edge16ln	%i4,	%o7,	%o5
	fmovrse	%g7,	%f4,	%f23
	orn	%i7,	%i5,	%o1
	edge8n	%l3,	%l4,	%g2
	move	%icc,	%o0,	%l2
	movrlez	%g1,	0x1A9,	%l0
	alignaddrl	%i2,	%i0,	%i3
	ldd	[%l7 + 0x10],	%f16
	ldsb	[%l7 + 0x3D],	%l6
	fabsd	%f2,	%f30
	movrne	%l5,	0x02B,	%o3
	nop
	set	0x28, %i0
	ldx	[%l7 + %i0],	%g3
	andncc	%o4,	%l1,	%g6
	udivcc	%o6,	0x1775,	%o2
	sra	%i6,	0x08,	%g4
	ldsh	[%l7 + 0x76],	%i1
	movle	%xcc,	%g5,	%i4
	addc	%o7,	%o5,	%g7
	edge8	%i5,	%i7,	%l3
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	fand	%f10,	%f22,	%f16
	movpos	%xcc,	%l2,	%o0
	lduw	[%l7 + 0x6C],	%l0
	popc	%g1,	%i2
	fcmpne16	%f30,	%f10,	%i3
	srax	%i0,	0x1D,	%l5
	ldd	[%l7 + 0x10],	%i6
	movl	%icc,	%g3,	%o3
	ldsb	[%l7 + 0x61],	%o4
	movcs	%icc,	%g6,	%l1
	mulscc	%o6,	%i6,	%g4
	siam	0x2
	edge8	%o2,	%g5,	%i4
	sub	%i1,	%o7,	%o5
	fmovdcc	%xcc,	%f11,	%f21
	sdivx	%i5,	0x0614,	%i7
	ldx	[%l7 + 0x38],	%g7
	fcmple16	%f30,	%f28,	%l4
	fpack32	%f30,	%f12,	%f0
	sth	%o1,	[%l7 + 0x78]
	movl	%xcc,	%l3,	%g2
	fmovde	%icc,	%f7,	%f25
	and	%o0,	0x08F4,	%l0
	ldd	[%l7 + 0x08],	%f16
	lduw	[%l7 + 0x24],	%g1
	or	%l2,	%i2,	%i0
	add	%i3,	%l6,	%l5
	andcc	%o3,	0x043D,	%o4
	subccc	%g6,	0x1EB0,	%g3
	andn	%l1,	%o6,	%g4
	xor	%i6,	%o2,	%i4
	move	%xcc,	%i1,	%o7
	movleu	%icc,	%g5,	%o5
	fsrc1s	%f2,	%f30
	sllx	%i7,	0x0F,	%g7
	fmovdcc	%icc,	%f12,	%f1
	srlx	%l4,	%o1,	%i5
	umulcc	%l3,	0x108B,	%o0
	edge16l	%g2,	%g1,	%l0
	fornot1	%f6,	%f18,	%f26
	movg	%icc,	%i2,	%i0
	movcs	%icc,	%i3,	%l6
	st	%f0,	[%l7 + 0x58]
	xnor	%l2,	0x0B1C,	%l5
	srax	%o4,	0x16,	%g6
	sdivcc	%o3,	0x0EE7,	%g3
	lduh	[%l7 + 0x54],	%l1
	orncc	%g4,	%o6,	%i6
	movn	%icc,	%o2,	%i4
	alignaddr	%o7,	%i1,	%o5
	edge8l	%g5,	%i7,	%g7
	movgu	%xcc,	%o1,	%i5
	save %l3, %o0, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l4,	%g1,	%i2
	pdist	%f0,	%f12,	%f24
	array8	%l0,	%i3,	%l6
	udiv	%i0,	0x1453,	%l2
	fmovdle	%icc,	%f31,	%f19
	ldd	[%l7 + 0x68],	%o4
	mulx	%l5,	%g6,	%o3
	movvs	%xcc,	%g3,	%l1
	edge16	%g4,	%i6,	%o2
	movre	%o6,	0x324,	%o7
	restore %i4, 0x1B85, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%g5,	%i1
	fsrc1	%f28,	%f30
	lduw	[%l7 + 0x44],	%g7
	st	%f28,	[%l7 + 0x7C]
	fnands	%f7,	%f27,	%f23
	movrlz	%i7,	0x225,	%i5
	movrgz	%l3,	0x0B8,	%o0
	sdiv	%o1,	0x1E41,	%l4
	fnot2s	%f27,	%f18
	st	%f12,	[%l7 + 0x0C]
	movpos	%xcc,	%g2,	%i2
	edge8l	%g1,	%l0,	%i3
	movgu	%icc,	%i0,	%l6
	edge16n	%o4,	%l2,	%g6
	stb	%l5,	[%l7 + 0x76]
	udiv	%o3,	0x18B0,	%g3
	movvc	%icc,	%g4,	%l1
	smul	%i6,	%o2,	%o7
	ldx	[%l7 + 0x48],	%o6
	xorcc	%i4,	%g5,	%o5
	movle	%icc,	%i1,	%i7
	fmovdvc	%icc,	%f19,	%f21
	fmovrdlez	%g7,	%f30,	%f6
	orn	%i5,	%l3,	%o0
	fmovrsne	%o1,	%f25,	%f19
	andn	%l4,	%g2,	%g1
	edge16n	%l0,	%i3,	%i2
	andn	%i0,	%o4,	%l6
	edge16n	%l2,	%g6,	%o3
	edge16	%g3,	%g4,	%l5
	mulx	%i6,	%o2,	%o7
	edge16n	%l1,	%o6,	%i4
	stb	%g5,	[%l7 + 0x3D]
	lduw	[%l7 + 0x4C],	%i1
	or	%o5,	0x1348,	%g7
	lduw	[%l7 + 0x54],	%i5
	movl	%icc,	%l3,	%i7
	array16	%o1,	%o0,	%g2
	movne	%icc,	%g1,	%l0
	smul	%l4,	0x16A4,	%i3
	edge32	%i0,	%i2,	%o4
	or	%l6,	%g6,	%l2
	movrlez	%g3,	0x1EE,	%g4
	sth	%o3,	[%l7 + 0x7C]
	alignaddr	%i6,	%l5,	%o2
	sra	%l1,	0x17,	%o7
	movl	%xcc,	%i4,	%o6
	fmul8sux16	%f10,	%f14,	%f12
	fxnors	%f14,	%f30,	%f19
	sdivx	%g5,	0x12BA,	%o5
	udivx	%i1,	0x0063,	%g7
	movge	%icc,	%i5,	%i7
	or	%l3,	0x19E0,	%o0
	fnand	%f14,	%f20,	%f20
	movgu	%xcc,	%o1,	%g1
	ldd	[%l7 + 0x78],	%f24
	andcc	%g2,	%l4,	%l0
	movrlez	%i0,	0x296,	%i2
	movpos	%icc,	%o4,	%i3
	edge16n	%g6,	%l6,	%g3
	edge8	%l2,	%o3,	%g4
	lduw	[%l7 + 0x54],	%i6
	ldsh	[%l7 + 0x62],	%l5
	edge8ln	%l1,	%o7,	%i4
	alignaddr	%o2,	%o6,	%o5
	srlx	%i1,	%g5,	%g7
	lduw	[%l7 + 0x64],	%i7
	srlx	%l3,	%i5,	%o1
	fmovrde	%g1,	%f16,	%f24
	fnor	%f2,	%f0,	%f14
	srl	%o0,	%l4,	%l0
	subcc	%g2,	0x01B1,	%i2
	alignaddrl	%i0,	%o4,	%i3
	udivx	%l6,	0x1DA8,	%g3
	sir	0x11C6
	add	%l2,	0x16AA,	%o3
	fmovdle	%icc,	%f15,	%f23
	srlx	%g4,	0x1B,	%g6
	movg	%xcc,	%l5,	%l1
	fmul8x16al	%f14,	%f5,	%f2
	nop
	set	0x70, %o7
	ldx	[%l7 + %o7],	%o7
	ldd	[%l7 + 0x10],	%f14
	srlx	%i6,	0x1F,	%o2
	xnorcc	%i4,	%o6,	%i1
	lduh	[%l7 + 0x30],	%o5
	mulscc	%g5,	%i7,	%g7
	move	%xcc,	%i5,	%l3
	xorcc	%o1,	0x13DE,	%o0
	movleu	%icc,	%g1,	%l4
	fcmpne16	%f14,	%f20,	%g2
	fpsub16	%f0,	%f22,	%f8
	fmul8x16	%f23,	%f30,	%f10
	ldx	[%l7 + 0x40],	%i2
	movpos	%xcc,	%i0,	%o4
	addccc	%l0,	0x17B6,	%l6
	movcc	%icc,	%g3,	%l2
	mulx	%i3,	0x043D,	%o3
	udiv	%g4,	0x15D5,	%g6
	stb	%l5,	[%l7 + 0x15]
	edge8ln	%l1,	%i6,	%o2
	fmovdge	%icc,	%f2,	%f5
	add	%i4,	0x195F,	%o6
	movneg	%xcc,	%o7,	%o5
	fnot2	%f6,	%f26
	movvs	%xcc,	%i1,	%i7
	edge32l	%g5,	%i5,	%g7
	stb	%l3,	[%l7 + 0x20]
	movrlz	%o0,	%o1,	%g1
	fnot2s	%f5,	%f9
	andn	%g2,	%i2,	%l4
	sethi	0x1D56,	%i0
	faligndata	%f20,	%f6,	%f20
	movleu	%xcc,	%l0,	%l6
	sub	%o4,	%l2,	%i3
	fmovrslez	%g3,	%f0,	%f5
	movvc	%icc,	%g4,	%g6
	fexpand	%f14,	%f28
	sth	%o3,	[%l7 + 0x18]
	andncc	%l1,	%l5,	%i6
	fxnors	%f13,	%f22,	%f7
	fsrc2s	%f9,	%f24
	or	%i4,	%o6,	%o2
	sllx	%o5,	%o7,	%i7
	smulcc	%g5,	0x09A1,	%i5
	fmovsvs	%icc,	%f26,	%f18
	stx	%i1,	[%l7 + 0x18]
	fcmpgt32	%f16,	%f4,	%l3
	sll	%g7,	0x07,	%o0
	orn	%o1,	%g1,	%i2
	movpos	%xcc,	%g2,	%l4
	addcc	%i0,	%l6,	%o4
	movrgz	%l0,	0x00F,	%l2
	fcmpne16	%f26,	%f6,	%i3
	movn	%icc,	%g3,	%g4
	edge8	%o3,	%g6,	%l5
	fxnors	%f4,	%f11,	%f4
	orncc	%i6,	0x157C,	%l1
	edge8	%i4,	%o2,	%o6
	addcc	%o5,	0x1ADD,	%i7
	save %g5, 0x0781, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x24],	%i1
	edge16	%l3,	%g7,	%o7
	alignaddr	%o1,	%o0,	%i2
	movge	%xcc,	%g1,	%l4
	edge32ln	%g2,	%l6,	%i0
	fpsub16s	%f26,	%f19,	%f9
	fcmpd	%fcc2,	%f6,	%f16
	lduw	[%l7 + 0x6C],	%o4
	fmovs	%f28,	%f24
	ldd	[%l7 + 0x60],	%f6
	sir	0x09AE
	mulx	%l0,	0x09DD,	%l2
	edge16	%i3,	%g3,	%g4
	fmovdne	%icc,	%f14,	%f30
	srlx	%o3,	%l5,	%g6
	movrlz	%i6,	%i4,	%l1
	edge16l	%o2,	%o5,	%i7
	andcc	%g5,	0x09E8,	%i5
	umulcc	%o6,	0x095F,	%i1
	subcc	%g7,	0x1B19,	%l3
	movge	%xcc,	%o7,	%o0
	edge8	%o1,	%g1,	%l4
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	subccc	%i0,	0x026D,	%o4
	ldx	[%l7 + 0x50],	%l0
	xnorcc	%l6,	%l2,	%i3
	edge8	%g3,	%o3,	%g4
	smulcc	%l5,	0x06C7,	%g6
	movge	%xcc,	%i6,	%l1
	fnegd	%f10,	%f18
	sll	%o2,	0x1F,	%o5
	and	%i4,	%i7,	%g5
	fandnot1	%f22,	%f12,	%f8
	movrgez	%i5,	%i1,	%g7
	andn	%o6,	0x05DF,	%o7
	udivx	%l3,	0x02E8,	%o1
	ldsb	[%l7 + 0x0B],	%o0
	fmuld8sux16	%f14,	%f23,	%f6
	movg	%xcc,	%g1,	%l4
	movrgz	%g2,	%i0,	%o4
	udivcc	%i2,	0x0B36,	%l6
	addc	%l0,	%i3,	%g3
	move	%xcc,	%l2,	%o3
	movvs	%icc,	%g4,	%l5
	fpack32	%f22,	%f18,	%f2
	xor	%g6,	0x07EB,	%l1
	nop
	set	0x4C, %o0
	stw	%i6,	[%l7 + %o0]
	fsrc2s	%f10,	%f16
	fmovrde	%o2,	%f6,	%f20
	edge16ln	%i4,	%i7,	%g5
	fnand	%f24,	%f10,	%f8
	bshuffle	%f12,	%f28,	%f4
	srl	%i5,	%i1,	%g7
	sdivcc	%o6,	0x161F,	%o5
	edge32n	%l3,	%o7,	%o1
	sdivcc	%o0,	0x11E6,	%l4
	udivx	%g2,	0x0416,	%i0
	movcc	%xcc,	%o4,	%g1
	ldd	[%l7 + 0x60],	%i2
	array16	%l6,	%i3,	%g3
	edge16n	%l2,	%o3,	%l0
	movrlz	%g4,	0x0F6,	%g6
	sll	%l5,	0x04,	%l1
	fmovdcc	%icc,	%f7,	%f14
	andncc	%i6,	%o2,	%i7
	move	%xcc,	%i4,	%g5
	fands	%f16,	%f17,	%f30
	fmul8ulx16	%f0,	%f26,	%f24
	movge	%xcc,	%i1,	%g7
	srl	%i5,	0x10,	%o6
	movge	%icc,	%l3,	%o5
	movvc	%xcc,	%o7,	%o0
	fmul8ulx16	%f4,	%f4,	%f8
	orcc	%o1,	0x1362,	%l4
	umul	%g2,	%o4,	%g1
	edge32l	%i0,	%l6,	%i2
	andcc	%i3,	%l2,	%o3
	popc	0x1134,	%l0
	edge32n	%g4,	%g3,	%g6
	fpadd32	%f30,	%f12,	%f30
	fmovsvs	%icc,	%f20,	%f3
	udivx	%l1,	0x0B98,	%l5
	sth	%o2,	[%l7 + 0x72]
	ldsh	[%l7 + 0x7E],	%i7
	nop
	set	0x38, %o2
	lduh	[%l7 + %o2],	%i6
	movg	%xcc,	%g5,	%i4
	fcmple16	%f6,	%f10,	%i1
	orncc	%g7,	%i5,	%l3
	save %o5, 0x0E26, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o7,	%o0,	%l4
	sth	%o1,	[%l7 + 0x2C]
	udivx	%o4,	0x13E6,	%g2
	array32	%i0,	%g1,	%l6
	ldd	[%l7 + 0x10],	%f10
	fmul8x16al	%f10,	%f12,	%f16
	fexpand	%f10,	%f22
	edge8n	%i2,	%l2,	%i3
	orncc	%o3,	0x0E87,	%g4
	fmovdne	%icc,	%f21,	%f16
	movneg	%icc,	%g3,	%l0
	array16	%l1,	%g6,	%l5
	movcc	%icc,	%o2,	%i6
	and	%g5,	0x04AA,	%i4
	movrlez	%i7,	%g7,	%i5
	movre	%i1,	%o5,	%l3
	xorcc	%o7,	0x0563,	%o0
	ldsw	[%l7 + 0x7C],	%o6
	movrgz	%o1,	%o4,	%l4
	udiv	%g2,	0x0078,	%g1
	fornot1s	%f22,	%f20,	%f14
	or	%i0,	%i2,	%l6
	edge8ln	%i3,	%o3,	%g4
	alignaddrl	%g3,	%l0,	%l1
	fcmpeq16	%f26,	%f0,	%g6
	edge16l	%l2,	%o2,	%i6
	edge8	%g5,	%i4,	%l5
	ldsh	[%l7 + 0x40],	%i7
	addc	%g7,	%i1,	%o5
	fcmpne16	%f6,	%f8,	%l3
	fcmpd	%fcc2,	%f16,	%f20
	ld	[%l7 + 0x28],	%f1
	umulcc	%i5,	0x02F6,	%o0
	edge16l	%o7,	%o6,	%o1
	andcc	%o4,	0x0059,	%l4
	movre	%g2,	%i0,	%i2
	andcc	%g1,	%l6,	%i3
	popc	0x14B2,	%o3
	movcc	%xcc,	%g3,	%g4
	subc	%l1,	%g6,	%l0
	sdivcc	%l2,	0x02EE,	%i6
	fmovsvc	%icc,	%f17,	%f9
	fnegd	%f10,	%f6
	st	%f31,	[%l7 + 0x70]
	srax	%g5,	%o2,	%l5
	sth	%i4,	[%l7 + 0x52]
	movrne	%g7,	0x1B1,	%i1
	array8	%o5,	%l3,	%i5
	fmovrslez	%o0,	%f6,	%f20
	pdist	%f10,	%f6,	%f0
	movrlez	%i7,	%o7,	%o1
	xorcc	%o4,	0x0064,	%o6
	smul	%g2,	0x1A9C,	%i0
	movrlez	%i2,	%l4,	%l6
	movneg	%xcc,	%i3,	%o3
	fcmpne32	%f18,	%f26,	%g1
	orncc	%g4,	0x05D9,	%l1
	movre	%g6,	%l0,	%g3
	std	%f18,	[%l7 + 0x48]
	edge16ln	%l2,	%g5,	%i6
	array32	%o2,	%i4,	%g7
	array32	%l5,	%o5,	%i1
	and	%i5,	%o0,	%l3
	smulcc	%i7,	%o1,	%o4
	fabss	%f7,	%f28
	sll	%o6,	%o7,	%i0
	movle	%xcc,	%i2,	%g2
	sra	%l4,	%l6,	%i3
	srlx	%o3,	%g1,	%g4
	ld	[%l7 + 0x18],	%f2
	umulcc	%g6,	%l0,	%g3
	ldsw	[%l7 + 0x28],	%l1
	edge16ln	%g5,	%i6,	%o2
	ldub	[%l7 + 0x46],	%l2
	sll	%i4,	%l5,	%g7
	addccc	%i1,	%i5,	%o5
	orncc	%l3,	%o0,	%i7
	bshuffle	%f0,	%f4,	%f24
	mulx	%o1,	%o6,	%o7
	movre	%i0,	0x34F,	%i2
	fnands	%f12,	%f1,	%f18
	addc	%g2,	0x078E,	%l4
	mova	%icc,	%o4,	%l6
	movre	%i3,	%o3,	%g4
	smulcc	%g6,	0x0868,	%g1
	subccc	%l0,	%l1,	%g3
	orn	%i6,	%g5,	%o2
	movge	%icc,	%i4,	%l2
	umul	%g7,	%l5,	%i5
	edge16n	%o5,	%l3,	%o0
	edge32ln	%i1,	%o1,	%i7
	addccc	%o7,	0x0C52,	%o6
	std	%f2,	[%l7 + 0x50]
	edge8l	%i2,	%g2,	%i0
	movge	%xcc,	%o4,	%l6
	fmovdg	%xcc,	%f20,	%f18
	edge8l	%i3,	%o3,	%l4
	fmovda	%xcc,	%f13,	%f24
	fabss	%f7,	%f3
	array8	%g4,	%g1,	%l0
	ldsb	[%l7 + 0x77],	%g6
	stb	%l1,	[%l7 + 0x0D]
	movcs	%icc,	%i6,	%g3
	stw	%o2,	[%l7 + 0x0C]
	orn	%g5,	0x04A0,	%l2
	ld	[%l7 + 0x7C],	%f4
	edge8ln	%i4,	%g7,	%l5
	movpos	%xcc,	%o5,	%i5
	fornot1	%f14,	%f18,	%f2
	restore %l3, 0x0ACC, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o0,	[%l7 + 0x2C]
	fpadd32	%f16,	%f26,	%f10
	mova	%xcc,	%i7,	%o7
	st	%f8,	[%l7 + 0x68]
	xorcc	%o6,	%i2,	%g2
	movre	%i0,	%o1,	%o4
	sth	%i3,	[%l7 + 0x6A]
	array16	%o3,	%l6,	%l4
	movpos	%xcc,	%g4,	%g1
	ldsh	[%l7 + 0x46],	%l0
	xor	%g6,	%i6,	%g3
	fmovdleu	%icc,	%f4,	%f20
	srax	%l1,	%g5,	%o2
	fcmple16	%f16,	%f28,	%l2
	smul	%g7,	0x0CE3,	%l5
	edge16n	%i4,	%o5,	%i5
	edge16n	%i1,	%l3,	%o0
	srlx	%i7,	0x0C,	%o6
	lduw	[%l7 + 0x34],	%o7
	save %g2, 0x14ED, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%o1,	%i0
	ldd	[%l7 + 0x28],	%o4
	srax	%o3,	0x01,	%l6
	smul	%l4,	0x1824,	%i3
	fmul8x16al	%f20,	%f4,	%f18
	ldd	[%l7 + 0x38],	%g4
	movn	%xcc,	%l0,	%g1
	fmovs	%f0,	%f26
	fpsub16	%f28,	%f12,	%f12
	udiv	%i6,	0x0F40,	%g6
	edge32	%l1,	%g3,	%g5
	fxors	%f19,	%f18,	%f5
	edge16n	%o2,	%g7,	%l2
	subc	%l5,	0x1D6C,	%i4
	fpmerge	%f6,	%f0,	%f16
	fmovdl	%xcc,	%f11,	%f25
	fsrc2	%f12,	%f6
	add	%o5,	%i5,	%l3
	edge16n	%o0,	%i7,	%i1
	srax	%o7,	%g2,	%i2
	movrgez	%o1,	%i0,	%o6
	movre	%o4,	0x136,	%o3
	subc	%l4,	0x14E8,	%l6
	movn	%xcc,	%i3,	%l0
	or	%g4,	%i6,	%g1
	addccc	%l1,	0x174E,	%g3
	umulcc	%g6,	%g5,	%g7
	ldsb	[%l7 + 0x65],	%l2
	stx	%l5,	[%l7 + 0x68]
	save %o2, 0x180F, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i4,	0x0688,	%l3
	st	%f0,	[%l7 + 0x54]
	orn	%o0,	%i7,	%i1
	movvs	%xcc,	%o7,	%g2
	ldsh	[%l7 + 0x36],	%i5
	subc	%i2,	%o1,	%o6
	popc	%o4,	%o3
	fsrc1s	%f3,	%f11
	fandnot2s	%f29,	%f7,	%f3
	fmovsg	%icc,	%f21,	%f6
	lduw	[%l7 + 0x18],	%l4
	umul	%i0,	0x0259,	%i3
	fcmps	%fcc0,	%f12,	%f20
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	array8	%g1,	%l1,	%g3
	fmovrdgez	%i6,	%f18,	%f26
	subcc	%g6,	%g5,	%g7
	move	%xcc,	%l5,	%o2
	fpadd16	%f0,	%f2,	%f10
	fcmpgt16	%f10,	%f20,	%o5
	srlx	%l2,	0x1F,	%i4
	umulcc	%l3,	%o0,	%i7
	edge16	%o7,	%g2,	%i5
	array32	%i2,	%o1,	%i1
	edge8ln	%o4,	%o6,	%l4
	fmovdneg	%xcc,	%f17,	%f29
	movcs	%icc,	%i0,	%o3
	fmovdl	%icc,	%f26,	%f10
	fmovscs	%xcc,	%f2,	%f0
	edge16n	%l6,	%i3,	%l0
	edge16n	%g4,	%g1,	%l1
	array32	%i6,	%g3,	%g5
	movne	%xcc,	%g6,	%l5
	udivx	%g7,	0x02C4,	%o5
	fpadd16s	%f30,	%f4,	%f22
	edge16l	%l2,	%i4,	%o2
	add	%l3,	%o0,	%i7
	fmul8x16au	%f31,	%f11,	%f20
	orcc	%g2,	%o7,	%i5
	fmovsa	%xcc,	%f16,	%f26
	ldd	[%l7 + 0x40],	%o0
	st	%f5,	[%l7 + 0x4C]
	movgu	%xcc,	%i2,	%o4
	stx	%o6,	[%l7 + 0x60]
	movpos	%icc,	%i1,	%i0
	umul	%o3,	0x1214,	%l4
	movge	%xcc,	%i3,	%l0
	fmovsa	%icc,	%f10,	%f9
	edge16	%g4,	%l6,	%l1
	movneg	%icc,	%i6,	%g3
	movcs	%icc,	%g1,	%g5
	addccc	%g6,	%l5,	%o5
	stx	%l2,	[%l7 + 0x70]
	fmovdge	%xcc,	%f28,	%f21
	for	%f12,	%f28,	%f6
	andncc	%g7,	%i4,	%l3
	sll	%o0,	%i7,	%o2
	fpack32	%f28,	%f26,	%f18
	ldd	[%l7 + 0x48],	%f28
	sdivx	%o7,	0x09E7,	%i5
	mulx	%g2,	%i2,	%o1
	popc	0x15D0,	%o6
	fmovrdlz	%i1,	%f16,	%f26
	edge8l	%o4,	%i0,	%o3
	fone	%f30
	fnegd	%f12,	%f30
	pdist	%f20,	%f28,	%f18
	or	%i3,	0x0265,	%l0
	fpadd32s	%f25,	%f30,	%f19
	fmovsge	%icc,	%f11,	%f30
	srlx	%l4,	%l6,	%g4
	restore %l1, 0x1971, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g1,	[%l7 + 0x74]
	lduh	[%l7 + 0x26],	%g5
	movrgz	%g6,	%g3,	%l5
	fmovdgu	%icc,	%f20,	%f15
	save %l2, 0x09A2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%g7,	%l3
	fxor	%f16,	%f2,	%f26
	fmovrsne	%i4,	%f25,	%f21
	edge16	%o0,	%o2,	%o7
	sll	%i7,	%g2,	%i5
	ldsw	[%l7 + 0x6C],	%i2
	srax	%o1,	%i1,	%o4
	orncc	%o6,	0x0882,	%i0
	fabsd	%f16,	%f6
	fmovrdgz	%i3,	%f4,	%f2
	fmovdcc	%icc,	%f4,	%f16
	fone	%f26
	std	%f30,	[%l7 + 0x70]
	fmovsa	%xcc,	%f1,	%f27
	movvs	%xcc,	%o3,	%l0
	srl	%l6,	0x16,	%g4
	popc	%l4,	%i6
	edge32l	%l1,	%g5,	%g1
	fnors	%f15,	%f11,	%f3
	movneg	%xcc,	%g3,	%l5
	fmuld8ulx16	%f6,	%f19,	%f24
	sir	0x12E9
	umul	%g6,	0x1EAB,	%l2
	fmovdleu	%icc,	%f11,	%f28
	udivx	%o5,	0x035C,	%l3
	smulcc	%i4,	0x1F21,	%o0
	movvs	%icc,	%g7,	%o7
	movrgez	%o2,	0x163,	%g2
	umul	%i5,	%i7,	%i2
	fnor	%f18,	%f6,	%f18
	std	%f8,	[%l7 + 0x68]
	smul	%i1,	0x1C49,	%o1
	edge16l	%o4,	%i0,	%o6
	fmovsn	%xcc,	%f5,	%f4
	ldd	[%l7 + 0x20],	%f10
	add	%o3,	0x06DD,	%i3
	edge8ln	%l0,	%g4,	%l4
	fmovscc	%xcc,	%f12,	%f11
	fabsd	%f8,	%f16
	ldd	[%l7 + 0x08],	%i6
	movcs	%xcc,	%l1,	%g5
	orn	%g1,	0x170F,	%g3
	orncc	%l6,	0x08C2,	%g6
	array32	%l5,	%o5,	%l2
	orncc	%l3,	0x12B7,	%i4
	mulx	%g7,	%o7,	%o0
	movn	%icc,	%o2,	%i5
	array32	%g2,	%i2,	%i1
	alignaddrl	%i7,	%o1,	%i0
	std	%f18,	[%l7 + 0x18]
	movl	%icc,	%o4,	%o6
	fmovsle	%icc,	%f9,	%f12
	sdiv	%o3,	0x1ADF,	%l0
	edge8l	%g4,	%l4,	%i3
	subc	%i6,	0x17B5,	%g5
	andncc	%l1,	%g3,	%l6
	movgu	%xcc,	%g6,	%g1
	addcc	%o5,	%l2,	%l5
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	udivx	%g7,	0x04C6,	%o2
	udivcc	%i5,	0x0600,	%o0
	movvc	%icc,	%i2,	%i1
	array8	%g2,	%o1,	%i7
	fmovsvs	%xcc,	%f6,	%f16
	fmovse	%xcc,	%f26,	%f7
	sethi	0x0F17,	%o4
	smul	%i0,	0x05E7,	%o6
	edge16l	%l0,	%o3,	%g4
	orcc	%i3,	%i6,	%l4
	ldub	[%l7 + 0x6A],	%g5
	addccc	%l1,	0x0B37,	%l6
	lduw	[%l7 + 0x2C],	%g6
	umulcc	%g3,	%o5,	%g1
	sllx	%l5,	0x04,	%i4
	sra	%l2,	0x01,	%l3
	fmovrslz	%o7,	%f28,	%f11
	array16	%o2,	%i5,	%g7
	umulcc	%i2,	0x1F16,	%i1
	edge8ln	%o0,	%g2,	%o1
	movne	%xcc,	%i7,	%o4
	alignaddrl	%i0,	%l0,	%o3
	movrgz	%g4,	%o6,	%i6
	sra	%i3,	%g5,	%l4
	movne	%xcc,	%l6,	%g6
	addc	%g3,	%l1,	%g1
	mulx	%l5,	0x0FBC,	%i4
	fpsub32s	%f29,	%f23,	%f13
	movcc	%xcc,	%o5,	%l2
	movrlez	%o7,	0x043,	%l3
	movg	%xcc,	%o2,	%i5
	movrgez	%g7,	0x031,	%i2
	subc	%i1,	0x1F62,	%g2
	mova	%xcc,	%o0,	%o1
	edge8l	%o4,	%i7,	%i0
	ldsw	[%l7 + 0x44],	%l0
	ldd	[%l7 + 0x30],	%g4
	movrgez	%o6,	%o3,	%i3
	save %g5, %i6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f28,	%f0
	ldd	[%l7 + 0x68],	%f8
	subccc	%l6,	0x1CFC,	%g3
	orcc	%g6,	%g1,	%l5
	srax	%i4,	0x1D,	%o5
	array32	%l1,	%l2,	%o7
	sth	%o2,	[%l7 + 0x32]
	mova	%icc,	%i5,	%g7
	lduh	[%l7 + 0x72],	%i2
	sra	%i1,	%l3,	%o0
	addcc	%g2,	%o4,	%o1
	alignaddrl	%i7,	%l0,	%g4
	nop
	set	0x20, %g7
	stw	%o6,	[%l7 + %g7]
	xor	%o3,	%i0,	%g5
	fpadd16	%f26,	%f0,	%f24
	movl	%xcc,	%i3,	%i6
	sth	%l4,	[%l7 + 0x30]
	smul	%l6,	0x1A11,	%g6
	edge16ln	%g1,	%l5,	%i4
	umul	%g3,	%o5,	%l1
	sllx	%l2,	0x08,	%o2
	fpadd32	%f22,	%f8,	%f16
	edge8n	%i5,	%g7,	%i2
	andcc	%i1,	0x0AF0,	%l3
	orncc	%o0,	%g2,	%o4
	fpadd16s	%f28,	%f29,	%f11
	movl	%icc,	%o1,	%i7
	movn	%xcc,	%l0,	%g4
	lduh	[%l7 + 0x62],	%o6
	movrlz	%o7,	%i0,	%o3
	ldsb	[%l7 + 0x2E],	%i3
	array32	%g5,	%i6,	%l4
	movrgez	%g6,	%l6,	%g1
	bshuffle	%f8,	%f14,	%f6
	fmovda	%icc,	%f5,	%f22
	movvs	%xcc,	%l5,	%i4
	sub	%g3,	0x1A5C,	%l1
	fmul8sux16	%f12,	%f26,	%f12
	movvc	%icc,	%o5,	%o2
	edge32l	%i5,	%g7,	%l2
	movvs	%icc,	%i1,	%l3
	fmovdgu	%xcc,	%f12,	%f25
	xor	%i2,	0x0DD3,	%g2
	fmovdgu	%xcc,	%f17,	%f31
	movrgez	%o0,	0x266,	%o4
	ld	[%l7 + 0x74],	%f14
	orn	%o1,	0x1910,	%l0
	fpadd16	%f26,	%f30,	%f18
	save %g4, 0x04EE, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f31,	%f12
	ldsw	[%l7 + 0x70],	%i7
	addccc	%o7,	%i0,	%o3
	sub	%g5,	0x191F,	%i6
	ldd	[%l7 + 0x60],	%f26
	smul	%i3,	%l4,	%g6
	ldd	[%l7 + 0x28],	%f30
	movcs	%icc,	%l6,	%g1
	umul	%i4,	%g3,	%l5
	movn	%icc,	%o5,	%o2
	addccc	%i5,	0x16C4,	%l1
	array8	%g7,	%l2,	%l3
	movre	%i2,	%i1,	%o0
	sdivcc	%o4,	0x06EA,	%g2
	orn	%o1,	%l0,	%g4
	fandnot2	%f24,	%f8,	%f2
	xor	%i7,	%o6,	%o7
	movre	%i0,	%o3,	%i6
	movrlz	%i3,	%l4,	%g6
	for	%f24,	%f28,	%f20
	fmovdle	%icc,	%f25,	%f18
	fnors	%f26,	%f20,	%f2
	alignaddrl	%l6,	%g1,	%g5
	fmovd	%f8,	%f26
	andcc	%i4,	0x050E,	%l5
	movrlz	%g3,	0x39F,	%o5
	fmuld8ulx16	%f11,	%f20,	%f6
	mulx	%o2,	%l1,	%g7
	fmovrdgez	%l2,	%f4,	%f28
	udivx	%l3,	0x0A09,	%i5
	movrgz	%i2,	0x125,	%o0
	xnorcc	%i1,	%o4,	%g2
	srlx	%l0,	0x19,	%o1
	movge	%icc,	%i7,	%g4
	movl	%icc,	%o6,	%i0
	orn	%o7,	%o3,	%i3
	udivcc	%i6,	0x0131,	%g6
	ldsb	[%l7 + 0x3B],	%l6
	fmovdgu	%icc,	%f30,	%f29
	edge16l	%g1,	%l4,	%g5
	st	%f31,	[%l7 + 0x30]
	udivcc	%l5,	0x040A,	%i4
	edge8	%g3,	%o2,	%o5
	fpsub32s	%f26,	%f22,	%f29
	subccc	%l1,	%g7,	%l2
	addccc	%i5,	0x116E,	%l3
	stx	%i2,	[%l7 + 0x30]
	smul	%o0,	%o4,	%g2
	stw	%l0,	[%l7 + 0x58]
	edge8l	%i1,	%o1,	%i7
	orn	%g4,	%o6,	%i0
	fpsub16s	%f24,	%f19,	%f12
	addcc	%o7,	0x0423,	%o3
	fmul8ulx16	%f18,	%f12,	%f30
	fabsd	%f14,	%f22
	ldub	[%l7 + 0x40],	%i6
	fcmpeq32	%f24,	%f28,	%g6
	ldd	[%l7 + 0x28],	%f10
	subccc	%l6,	%g1,	%l4
	alignaddrl	%g5,	%i3,	%i4
	addccc	%g3,	0x11A8,	%l5
	array16	%o5,	%l1,	%g7
	sth	%o2,	[%l7 + 0x2E]
	edge32l	%l2,	%i5,	%l3
	ldx	[%l7 + 0x50],	%i2
	movvc	%icc,	%o0,	%o4
	add	%l0,	%g2,	%o1
	ld	[%l7 + 0x44],	%f10
	movpos	%xcc,	%i1,	%g4
	udivx	%i7,	0x04AA,	%o6
	movge	%xcc,	%o7,	%o3
	srlx	%i0,	0x0B,	%g6
	edge32ln	%i6,	%l6,	%g1
	and	%g5,	0x0B9D,	%i3
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%f20
	array8	%i4,	%l4,	%g3
	fmuld8sux16	%f6,	%f20,	%f4
	edge32ln	%l5,	%l1,	%g7
	movrlez	%o5,	0x1A2,	%o2
	udivx	%i5,	0x0D00,	%l2
	movle	%xcc,	%l3,	%i2
	array8	%o4,	%o0,	%l0
	umulcc	%g2,	%i1,	%o1
	srlx	%g4,	0x1F,	%o6
	fmovd	%f10,	%f12
	fmul8x16	%f24,	%f6,	%f16
	andcc	%i7,	0x15C7,	%o3
	edge16	%o7,	%g6,	%i6
	movrgz	%i0,	%g1,	%l6
	popc	0x1FCB,	%i3
	edge8l	%g5,	%i4,	%g3
	fcmpne32	%f22,	%f6,	%l4
	movpos	%icc,	%l5,	%g7
	xnorcc	%l1,	%o2,	%i5
	fmovsa	%xcc,	%f10,	%f23
	fmovse	%xcc,	%f7,	%f5
	fmovrdne	%l2,	%f8,	%f22
	orn	%l3,	0x0193,	%o5
	alignaddr	%o4,	%i2,	%l0
	smul	%g2,	%i1,	%o1
	smulcc	%g4,	0x0FD4,	%o0
	lduw	[%l7 + 0x10],	%i7
	edge16ln	%o3,	%o7,	%o6
	subcc	%g6,	0x0664,	%i6
	fmuld8ulx16	%f31,	%f6,	%f24
	sdivx	%g1,	0x0894,	%i0
	save %i3, %l6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f15,	%f18,	%f27
	edge16ln	%g3,	%i4,	%l4
	movrlz	%l5,	0x3F3,	%g7
	popc	%o2,	%i5
	fsrc1s	%f0,	%f15
	movcc	%icc,	%l2,	%l3
	fmovrse	%l1,	%f3,	%f21
	array8	%o5,	%o4,	%i2
	sra	%g2,	%l0,	%o1
	addcc	%g4,	%o0,	%i7
	fmovdg	%icc,	%f31,	%f6
	movrlez	%o3,	%i1,	%o7
	movrgez	%o6,	0x1F3,	%i6
	fcmpne32	%f8,	%f18,	%g1
	sth	%i0,	[%l7 + 0x18]
	sir	0x0717
	fcmple32	%f28,	%f10,	%g6
	srlx	%i3,	%l6,	%g3
	movne	%icc,	%g5,	%l4
	edge16l	%i4,	%g7,	%o2
	sethi	0x0A5A,	%l5
	sra	%i5,	0x0E,	%l2
	edge32l	%l3,	%o5,	%l1
	sdivcc	%i2,	0x1CF2,	%g2
	fandnot2s	%f21,	%f8,	%f8
	add	%o4,	0x1963,	%l0
	sll	%o1,	%o0,	%i7
	ldub	[%l7 + 0x60],	%o3
	movrgez	%g4,	%o7,	%i1
	array8	%i6,	%g1,	%i0
	movl	%xcc,	%g6,	%i3
	popc	%o6,	%l6
	stw	%g3,	[%l7 + 0x70]
	subc	%g5,	%i4,	%g7
	movg	%icc,	%l4,	%o2
	movpos	%xcc,	%i5,	%l5
	fmovrdgez	%l2,	%f4,	%f10
	edge8ln	%o5,	%l3,	%i2
	fpadd16s	%f12,	%f10,	%f19
	ldub	[%l7 + 0x34],	%l1
	fexpand	%f24,	%f26
	stx	%g2,	[%l7 + 0x78]
	fmovdn	%xcc,	%f27,	%f9
	umul	%o4,	%o1,	%l0
	mulx	%o0,	%o3,	%g4
	array8	%i7,	%o7,	%i6
	stx	%i1,	[%l7 + 0x10]
	xnorcc	%i0,	0x1AF4,	%g6
	sllx	%i3,	%g1,	%o6
	fpadd16s	%f8,	%f14,	%f31
	movpos	%xcc,	%l6,	%g5
	fmovscs	%icc,	%f15,	%f28
	restore %g3, %g7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o2,	%i5,	%l4
	edge8l	%l5,	%o5,	%l2
	edge8l	%l3,	%l1,	%i2
	xor	%g2,	%o1,	%l0
	movneg	%icc,	%o4,	%o3
	movvc	%icc,	%g4,	%o0
	stb	%o7,	[%l7 + 0x21]
	sth	%i7,	[%l7 + 0x08]
	ldsw	[%l7 + 0x40],	%i1
	fpsub32s	%f5,	%f19,	%f10
	sra	%i6,	0x0F,	%i0
	lduh	[%l7 + 0x2A],	%i3
	edge8ln	%g1,	%g6,	%l6
	stb	%g5,	[%l7 + 0x49]
	srlx	%o6,	0x16,	%g3
	edge32ln	%g7,	%i4,	%i5
	fmovsvc	%xcc,	%f5,	%f8
	fxnors	%f1,	%f8,	%f12
	fmovdleu	%icc,	%f12,	%f29
	sethi	0x0578,	%l4
	fmul8x16	%f18,	%f14,	%f8
	edge32ln	%l5,	%o5,	%o2
	andn	%l3,	%l2,	%i2
	sdiv	%l1,	0x1715,	%g2
	ldd	[%l7 + 0x08],	%l0
	array8	%o4,	%o1,	%o3
	edge8n	%o0,	%o7,	%i7
	movcs	%icc,	%i1,	%g4
	faligndata	%f26,	%f4,	%f28
	fmovrsgez	%i6,	%f19,	%f8
	addccc	%i3,	0x1C2D,	%i0
	orn	%g6,	0x1C67,	%l6
	popc	%g5,	%o6
	fmovs	%f8,	%f26
	fmovsa	%xcc,	%f30,	%f24
	std	%f26,	[%l7 + 0x18]
	movneg	%icc,	%g3,	%g7
	fmovrse	%g1,	%f17,	%f23
	fpsub16s	%f1,	%f12,	%f13
	st	%f19,	[%l7 + 0x6C]
	udivcc	%i5,	0x1B03,	%l4
	edge8l	%l5,	%o5,	%i4
	array16	%l3,	%o2,	%l2
	fmovrdgz	%i2,	%f4,	%f26
	movn	%icc,	%l1,	%g2
	edge16l	%l0,	%o4,	%o3
	edge16n	%o0,	%o7,	%i7
	sub	%o1,	0x0269,	%g4
	nop
	set	0x58, %i1
	ldsh	[%l7 + %i1],	%i6
	ldd	[%l7 + 0x28],	%f12
	srax	%i3,	0x1F,	%i0
	edge32ln	%i1,	%g6,	%l6
	array8	%g5,	%o6,	%g3
	fand	%f14,	%f10,	%f2
	fcmpes	%fcc2,	%f28,	%f21
	srlx	%g7,	0x18,	%g1
	fandnot2	%f0,	%f18,	%f6
	movgu	%icc,	%l4,	%i5
	mulx	%o5,	%i4,	%l5
	udivcc	%o2,	0x0F84,	%l2
	movre	%l3,	%i2,	%g2
	fcmpeq32	%f10,	%f28,	%l0
	std	%f2,	[%l7 + 0x18]
	fand	%f14,	%f10,	%f30
	nop
	set	0x48, %o3
	stx	%l1,	[%l7 + %o3]
	orncc	%o3,	0x029D,	%o0
	addc	%o4,	%i7,	%o7
	ldd	[%l7 + 0x28],	%g4
	movne	%icc,	%o1,	%i3
	fpadd16	%f30,	%f26,	%f4
	movrgez	%i0,	0x307,	%i1
	edge32ln	%g6,	%i6,	%g5
	fcmpeq16	%f12,	%f20,	%l6
	smul	%o6,	0x175F,	%g3
	edge16n	%g1,	%l4,	%i5
	xnorcc	%g7,	%i4,	%o5
	stb	%l5,	[%l7 + 0x61]
	fpadd16	%f4,	%f10,	%f22
	fmovdne	%xcc,	%f24,	%f13
	srl	%l2,	%l3,	%i2
	stx	%g2,	[%l7 + 0x08]
	fpack16	%f8,	%f9
	fexpand	%f0,	%f0
	fcmpgt16	%f24,	%f8,	%o2
	edge32ln	%l1,	%o3,	%o0
	udivx	%l0,	0x1A67,	%i7
	fmovsvs	%icc,	%f2,	%f12
	pdist	%f12,	%f16,	%f2
	movleu	%xcc,	%o7,	%o4
	std	%f22,	[%l7 + 0x10]
	umul	%g4,	0x15AE,	%i3
	sdivx	%o1,	0x094E,	%i1
	ldd	[%l7 + 0x78],	%i0
	fmovrdgez	%i6,	%f12,	%f18
	sll	%g6,	%g5,	%l6
	fcmpd	%fcc2,	%f10,	%f4
	edge16l	%o6,	%g1,	%g3
	orcc	%l4,	0x121D,	%g7
	addccc	%i5,	0x1115,	%o5
	movrne	%l5,	0x00C,	%i4
	fornot2	%f30,	%f6,	%f8
	edge8ln	%l3,	%l2,	%g2
	alignaddr	%i2,	%l1,	%o3
	fcmpne32	%f20,	%f30,	%o0
	andncc	%l0,	%i7,	%o7
	and	%o2,	%g4,	%i3
	movre	%o1,	%o4,	%i1
	edge8n	%i0,	%i6,	%g5
	xorcc	%l6,	0x1027,	%o6
	movleu	%icc,	%g6,	%g3
	smulcc	%g1,	0x1244,	%l4
	fmovsle	%xcc,	%f27,	%f20
	array8	%i5,	%g7,	%l5
	fmovrdlez	%i4,	%f16,	%f26
	orn	%o5,	0x15E1,	%l3
	array8	%l2,	%g2,	%l1
	edge16	%o3,	%i2,	%l0
	array16	%o0,	%o7,	%i7
	udiv	%g4,	0x1B3A,	%o2
	movpos	%icc,	%i3,	%o4
	std	%f2,	[%l7 + 0x18]
	sub	%o1,	%i1,	%i6
	fcmpeq32	%f16,	%f24,	%g5
	popc	%i0,	%o6
	srlx	%g6,	0x1D,	%l6
	fnot2s	%f25,	%f25
	or	%g1,	%g3,	%i5
	fcmpeq32	%f0,	%f22,	%g7
	xor	%l5,	%i4,	%o5
	andcc	%l3,	0x00EF,	%l4
	move	%xcc,	%g2,	%l1
	edge8l	%o3,	%i2,	%l0
	nop
	set	0x2C, %g5
	ldsw	[%l7 + %g5],	%l2
	ldsw	[%l7 + 0x0C],	%o0
	movvs	%xcc,	%i7,	%o7
	umul	%g4,	%i3,	%o2
	fornot2	%f26,	%f4,	%f20
	nop
	set	0x40, %g1
	ldx	[%l7 + %g1],	%o4
	fmovdle	%xcc,	%f10,	%f22
	fors	%f0,	%f22,	%f27
	fnot2s	%f25,	%f4
	fmuld8sux16	%f8,	%f31,	%f2
	sllx	%i1,	%i6,	%g5
	movrne	%o1,	%o6,	%g6
	xor	%i0,	%g1,	%g3
	movrne	%l6,	%g7,	%l5
	fandnot2	%f4,	%f8,	%f8
	stx	%i4,	[%l7 + 0x50]
	movne	%icc,	%o5,	%l3
	sdivcc	%l4,	0x18C1,	%i5
	ldsh	[%l7 + 0x5E],	%g2
	ld	[%l7 + 0x20],	%f2
	movcc	%icc,	%o3,	%i2
	edge8ln	%l0,	%l1,	%o0
	edge8l	%l2,	%i7,	%g4
	fmovsgu	%icc,	%f15,	%f15
	fmovrslz	%o7,	%f11,	%f26
	movpos	%icc,	%i3,	%o2
	fpadd32	%f0,	%f14,	%f12
	movrgz	%o4,	%i6,	%g5
	udivcc	%o1,	0x0C73,	%o6
	or	%i1,	%i0,	%g6
	fmovscc	%xcc,	%f14,	%f17
	andcc	%g1,	%g3,	%g7
	fmovsge	%xcc,	%f14,	%f19
	orncc	%l5,	0x0539,	%l6
	mulscc	%o5,	%l3,	%i4
	mulx	%l4,	%i5,	%o3
	nop
	set	0x64, %i7
	ldub	[%l7 + %i7],	%i2
	fmovrsne	%g2,	%f16,	%f16
	smulcc	%l0,	%o0,	%l2
	smulcc	%l1,	0x1508,	%g4
	movleu	%icc,	%o7,	%i3
	fnand	%f8,	%f14,	%f28
	fxnors	%f31,	%f1,	%f9
	andn	%o2,	0x0B90,	%o4
	edge8	%i7,	%i6,	%g5
	udivx	%o6,	0x064D,	%o1
	movge	%icc,	%i0,	%i1
	movvc	%icc,	%g6,	%g1
	orn	%g7,	%g3,	%l6
	array32	%o5,	%l5,	%i4
	orn	%l4,	0x0D44,	%i5
	movgu	%xcc,	%l3,	%i2
	ld	[%l7 + 0x64],	%f16
	movge	%xcc,	%g2,	%l0
	fpadd32s	%f7,	%f28,	%f21
	edge8l	%o3,	%o0,	%l1
	fpsub32s	%f24,	%f25,	%f9
	edge8l	%g4,	%o7,	%l2
	ldsb	[%l7 + 0x62],	%i3
	edge32ln	%o4,	%i7,	%o2
	movvs	%icc,	%g5,	%i6
	fzero	%f4
	move	%xcc,	%o6,	%i0
	orcc	%o1,	0x1F29,	%g6
	and	%i1,	0x0A7C,	%g7
	sll	%g3,	%l6,	%g1
	or	%l5,	0x073D,	%i4
	movrgez	%l4,	%o5,	%i5
	addc	%l3,	0x1FEF,	%g2
	movn	%xcc,	%i2,	%o3
	sub	%l0,	%o0,	%g4
	stw	%l1,	[%l7 + 0x2C]
	subc	%l2,	%o7,	%o4
	movrlz	%i7,	0x2D1,	%o2
	edge8	%i3,	%g5,	%o6
	nop
	set	0x58, %g3
	ldx	[%l7 + %g3],	%i6
	smulcc	%i0,	%g6,	%i1
	movrgez	%g7,	%g3,	%o1
	movn	%icc,	%l6,	%g1
	movg	%icc,	%l5,	%i4
	fands	%f28,	%f3,	%f2
	movl	%icc,	%l4,	%i5
	sdiv	%l3,	0x12F3,	%g2
	sth	%o5,	[%l7 + 0x70]
	ldd	[%l7 + 0x60],	%o2
	lduh	[%l7 + 0x1E],	%i2
	siam	0x2
	fmovdn	%icc,	%f31,	%f19
	movrgez	%l0,	%o0,	%l1
	ldd	[%l7 + 0x38],	%f12
	or	%l2,	0x09E8,	%g4
	ldub	[%l7 + 0x5B],	%o7
	fsrc2s	%f27,	%f23
	std	%f12,	[%l7 + 0x18]
	movle	%xcc,	%i7,	%o2
	std	%f0,	[%l7 + 0x20]
	stb	%i3,	[%l7 + 0x31]
	edge32ln	%g5,	%o4,	%i6
	edge16l	%o6,	%g6,	%i1
	std	%f24,	[%l7 + 0x70]
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	ldsb	[%l7 + 0x10],	%g3
	srl	%l6,	0x03,	%o1
	subcc	%l5,	0x08E6,	%g1
	udivcc	%i4,	0x0DEF,	%l4
	movvc	%xcc,	%l3,	%i5
	fpadd16s	%f23,	%f16,	%f11
	edge32l	%o5,	%o3,	%i2
	array32	%g2,	%l0,	%l1
	stb	%o0,	[%l7 + 0x7C]
	movpos	%xcc,	%l2,	%g4
	movvc	%xcc,	%o7,	%o2
	sth	%i3,	[%l7 + 0x22]
	fnands	%f4,	%f30,	%f28
	edge16n	%g5,	%i7,	%i6
	fmovdgu	%xcc,	%f1,	%f21
	fors	%f8,	%f13,	%f27
	movrne	%o4,	%o6,	%g6
	srl	%i0,	0x0D,	%g7
	edge32l	%g3,	%i1,	%o1
	movle	%icc,	%l6,	%g1
	addccc	%i4,	0x00F8,	%l5
	andn	%l3,	0x0F12,	%i5
	addcc	%o5,	%l4,	%i2
	subccc	%g2,	%o3,	%l1
	edge16	%l0,	%o0,	%g4
	fmovrse	%o7,	%f30,	%f9
	mulx	%o2,	%i3,	%l2
	fors	%f8,	%f23,	%f24
	lduw	[%l7 + 0x50],	%g5
	srlx	%i6,	%i7,	%o4
	orn	%g6,	%o6,	%g7
	array16	%g3,	%i0,	%i1
	andcc	%l6,	0x01CD,	%o1
	sub	%g1,	%l5,	%i4
	movle	%icc,	%i5,	%l3
	subcc	%o5,	%l4,	%g2
	fcmpes	%fcc2,	%f23,	%f31
	movgu	%xcc,	%i2,	%o3
	edge16	%l1,	%o0,	%g4
	fmovsge	%icc,	%f19,	%f15
	ldub	[%l7 + 0x5E],	%o7
	or	%l0,	0x1DB1,	%i3
	xor	%o2,	%l2,	%i6
	andcc	%g5,	0x0B22,	%i7
	edge8	%o4,	%g6,	%g7
	alignaddrl	%g3,	%i0,	%i1
	edge8ln	%o6,	%l6,	%o1
	fmovscc	%xcc,	%f8,	%f13
	xor	%l5,	%g1,	%i4
	std	%f8,	[%l7 + 0x70]
	movvs	%icc,	%l3,	%i5
	fmovsl	%icc,	%f26,	%f14
	movle	%xcc,	%l4,	%g2
	movvc	%xcc,	%i2,	%o5
	srl	%o3,	0x04,	%l1
	ld	[%l7 + 0x38],	%f26
	fmovrdgz	%o0,	%f8,	%f16
	save %g4, %o7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o2,	0x1DBA,	%l2
	sdiv	%i6,	0x0F07,	%g5
	smul	%i7,	%l0,	%g6
	stw	%g7,	[%l7 + 0x5C]
	xor	%g3,	%i0,	%o4
	add	%i1,	%o6,	%l6
	ldd	[%l7 + 0x10],	%l4
	array32	%g1,	%i4,	%o1
	fones	%f1
	sll	%i5,	%l3,	%g2
	fmul8ulx16	%f20,	%f0,	%f26
	add	%l4,	%i2,	%o5
	ldsw	[%l7 + 0x7C],	%o3
	fmovdg	%icc,	%f11,	%f17
	fpmerge	%f2,	%f2,	%f26
	orcc	%l1,	%o0,	%o7
	move	%xcc,	%i3,	%o2
	fmul8x16al	%f20,	%f3,	%f22
	movcc	%icc,	%l2,	%i6
	fmovdne	%xcc,	%f9,	%f26
	ldub	[%l7 + 0x2C],	%g4
	save %g5, %i7, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%icc,	%f9,	%f18
	popc	%g7,	%g3
	fmovdne	%xcc,	%f9,	%f28
	fcmped	%fcc0,	%f20,	%f8
	fmovsn	%xcc,	%f30,	%f19
	fsrc2	%f16,	%f18
	ldsb	[%l7 + 0x40],	%i0
	andncc	%o4,	%l0,	%i1
	movn	%xcc,	%o6,	%l5
	xnor	%l6,	0x0881,	%g1
	lduw	[%l7 + 0x2C],	%o1
	lduh	[%l7 + 0x52],	%i5
	umulcc	%i4,	0x002E,	%l3
	sllx	%l4,	%i2,	%g2
	movpos	%icc,	%o3,	%o5
	xorcc	%o0,	0x0849,	%o7
	subcc	%l1,	0x18B0,	%i3
	ldsb	[%l7 + 0x62],	%o2
	movge	%xcc,	%i6,	%g4
	subccc	%g5,	%l2,	%i7
	fnot2	%f8,	%f0
	fxnors	%f15,	%f18,	%f30
	restore %g7, 0x0519, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%g6,	%i0
	ldd	[%l7 + 0x78],	%f18
	edge16	%o4,	%l0,	%i1
	fcmpne16	%f16,	%f8,	%o6
	mulscc	%l5,	0x0EDB,	%l6
	fpadd16s	%f14,	%f1,	%f17
	orncc	%g1,	%i5,	%i4
	movle	%xcc,	%o1,	%l4
	subccc	%l3,	%g2,	%o3
	array8	%i2,	%o5,	%o0
	srax	%o7,	0x0D,	%l1
	movneg	%xcc,	%i3,	%i6
	ldsh	[%l7 + 0x5A],	%g4
	ldsh	[%l7 + 0x4E],	%g5
	alignaddr	%o2,	%i7,	%g7
	ldsh	[%l7 + 0x48],	%l2
	fnegs	%f21,	%f14
	movrlez	%g3,	%g6,	%o4
	fmovsa	%xcc,	%f7,	%f27
	fpsub32	%f14,	%f22,	%f16
	sllx	%l0,	%i1,	%i0
	nop
	set	0x71, %i3
	ldsb	[%l7 + %i3],	%l5
	ldub	[%l7 + 0x3C],	%o6
	fmul8x16	%f25,	%f2,	%f12
	orcc	%g1,	%i5,	%i4
	fornot2s	%f14,	%f26,	%f10
	fxnor	%f22,	%f26,	%f16
	fabsd	%f0,	%f20
	sth	%l6,	[%l7 + 0x22]
	add	%l4,	0x1303,	%l3
	fmul8x16	%f14,	%f22,	%f0
	lduw	[%l7 + 0x4C],	%g2
	edge32n	%o1,	%i2,	%o5
	fcmpne32	%f12,	%f2,	%o0
	udivx	%o3,	0x091B,	%l1
	udivx	%i3,	0x161D,	%i6
	ldd	[%l7 + 0x38],	%o6
	move	%xcc,	%g4,	%g5
	ldsh	[%l7 + 0x54],	%o2
	edge16n	%i7,	%g7,	%l2
	fmul8ulx16	%f10,	%f16,	%f30
	udiv	%g3,	0x1CC8,	%o4
	umul	%l0,	%i1,	%i0
	xorcc	%l5,	0x0138,	%g6
	edge8n	%g1,	%o6,	%i4
	movrgz	%l6,	%i5,	%l3
	st	%f21,	[%l7 + 0x50]
	umul	%g2,	0x1DE0,	%o1
	fcmpeq32	%f8,	%f8,	%i2
	fmovrsne	%l4,	%f16,	%f8
	sth	%o0,	[%l7 + 0x44]
	subc	%o3,	%o5,	%l1
	fandnot1s	%f6,	%f31,	%f0
	fcmpgt16	%f18,	%f10,	%i6
	fmul8x16au	%f15,	%f25,	%f24
	fmovsg	%icc,	%f28,	%f12
	sth	%i3,	[%l7 + 0x18]
	movrlez	%o7,	%g5,	%o2
	fxor	%f22,	%f26,	%f2
	fcmps	%fcc1,	%f13,	%f8
	umul	%g4,	%g7,	%l2
	movrlz	%g3,	%o4,	%l0
	fmovrsne	%i1,	%f7,	%f29
	sra	%i0,	%l5,	%i7
	fsrc2s	%f2,	%f16
	movle	%icc,	%g6,	%g1
	edge32n	%o6,	%i4,	%i5
	for	%f30,	%f26,	%f30
	sdiv	%l6,	0x0DF0,	%g2
	mova	%xcc,	%l3,	%i2
	fmovdgu	%icc,	%f26,	%f1
	sub	%o1,	%l4,	%o0
	ldd	[%l7 + 0x10],	%f24
	fmovda	%icc,	%f17,	%f31
	ldsb	[%l7 + 0x36],	%o3
	srax	%o5,	%i6,	%l1
	fmul8x16	%f12,	%f2,	%f4
	addccc	%o7,	0x1B1D,	%i3
	fcmpd	%fcc3,	%f20,	%f0
	edge16n	%g5,	%g4,	%g7
	edge8n	%l2,	%o2,	%g3
	movrgez	%o4,	0x344,	%i1
	xnor	%i0,	0x08CD,	%l0
	array32	%l5,	%g6,	%i7
	movrgz	%g1,	%o6,	%i5
	alignaddrl	%l6,	%g2,	%i4
	ld	[%l7 + 0x1C],	%f12
	movcc	%icc,	%i2,	%l3
	mulx	%o1,	0x0D43,	%o0
	lduh	[%l7 + 0x62],	%l4
	array8	%o3,	%i6,	%o5
	stb	%o7,	[%l7 + 0x72]
	fmovdleu	%icc,	%f1,	%f23
	addc	%l1,	%g5,	%i3
	movg	%icc,	%g4,	%l2
	ld	[%l7 + 0x30],	%f30
	srax	%g7,	%o2,	%g3
	movrlz	%i1,	0x344,	%i0
	fcmpgt16	%f2,	%f0,	%o4
	lduw	[%l7 + 0x40],	%l0
	xorcc	%g6,	0x1FD9,	%l5
	movvs	%icc,	%i7,	%o6
	fnot2	%f12,	%f18
	fabss	%f12,	%f1
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%f26
	sll	%i5,	%g1,	%l6
	udivx	%i4,	0x0DF4,	%i2
	stb	%g2,	[%l7 + 0x6D]
	subcc	%o1,	%o0,	%l3
	alignaddr	%l4,	%i6,	%o3
	movg	%icc,	%o5,	%l1
	fmovs	%f23,	%f21
	sdivcc	%o7,	0x0F8D,	%i3
	sub	%g5,	%g4,	%g7
	move	%icc,	%o2,	%l2
	xnor	%i1,	%i0,	%o4
	stx	%g3,	[%l7 + 0x70]
	fpadd32s	%f0,	%f9,	%f21
	udiv	%g6,	0x0CCC,	%l5
	fandnot2	%f26,	%f4,	%f6
	edge16	%l0,	%i7,	%o6
	fmovdg	%xcc,	%f1,	%f12
	andcc	%g1,	0x0A76,	%i5
	array32	%i4,	%i2,	%g2
	udiv	%o1,	0x1B3D,	%l6
	orncc	%o0,	%l3,	%l4
	xor	%i6,	0x0CC7,	%o3
	movcs	%xcc,	%o5,	%l1
	umulcc	%o7,	0x0711,	%i3
	stw	%g4,	[%l7 + 0x30]
	stx	%g5,	[%l7 + 0x50]
	ldsb	[%l7 + 0x42],	%g7
	edge16l	%o2,	%l2,	%i1
	for	%f20,	%f28,	%f16
	movgu	%icc,	%o4,	%g3
	orcc	%i0,	0x0810,	%g6
	movleu	%xcc,	%l0,	%i7
	stb	%o6,	[%l7 + 0x78]
	movn	%icc,	%g1,	%l5
	fors	%f13,	%f5,	%f14
	movn	%icc,	%i5,	%i2
	alignaddrl	%g2,	%i4,	%l6
	udivcc	%o0,	0x05CB,	%l3
	movcc	%xcc,	%l4,	%i6
	movrne	%o1,	0x32B,	%o3
	edge8ln	%o5,	%l1,	%i3
	movvs	%icc,	%o7,	%g5
	edge8l	%g4,	%o2,	%g7
	addcc	%i1,	0x05C8,	%o4
	orn	%g3,	%l2,	%i0
	fmovda	%icc,	%f7,	%f26
	fcmpgt16	%f8,	%f22,	%l0
	ldsw	[%l7 + 0x78],	%g6
	array32	%i7,	%g1,	%o6
	movcs	%icc,	%i5,	%i2
	fmul8x16au	%f1,	%f19,	%f18
	sra	%g2,	0x13,	%i4
	movre	%l5,	%o0,	%l6
	edge32	%l4,	%l3,	%i6
	movne	%xcc,	%o1,	%o3
	edge32n	%l1,	%o5,	%i3
	ldsb	[%l7 + 0x2F],	%o7
	movleu	%xcc,	%g5,	%g4
	sdivcc	%o2,	0x1161,	%g7
	udivcc	%o4,	0x03AA,	%i1
	srlx	%g3,	0x1F,	%i0
	and	%l2,	0x05F1,	%g6
	edge8ln	%i7,	%l0,	%o6
	fcmpeq32	%f24,	%f14,	%i5
	and	%i2,	%g1,	%g2
	srax	%i4,	%o0,	%l6
	save %l4, 0x0CEF, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f26,	[%l7 + 0x18]
	fcmpgt32	%f20,	%f6,	%l5
	sir	0x12A5
	fmovdpos	%icc,	%f14,	%f10
	popc	%i6,	%o3
	addccc	%o1,	%o5,	%i3
	fnot1s	%f23,	%f3
	fzeros	%f29
	orcc	%o7,	%l1,	%g4
	movcc	%icc,	%g5,	%g7
	lduh	[%l7 + 0x7A],	%o2
	addccc	%o4,	0x1C85,	%i1
	fxor	%f26,	%f10,	%f12
	edge16	%g3,	%l2,	%i0
	fmovdvc	%xcc,	%f16,	%f2
	popc	0x0582,	%g6
	fmovsneg	%xcc,	%f6,	%f5
	fmovde	%xcc,	%f8,	%f11
	udivcc	%l0,	0x028E,	%o6
	edge16l	%i5,	%i2,	%i7
	udivcc	%g2,	0x0762,	%g1
	edge16ln	%o0,	%i4,	%l6
	umulcc	%l3,	%l4,	%l5
	ldd	[%l7 + 0x08],	%o2
	nop
	set	0x56, %l1
	lduh	[%l7 + %l1],	%o1
	ldd	[%l7 + 0x20],	%o4
	edge16ln	%i6,	%o7,	%l1
	edge32l	%g4,	%g5,	%g7
	fpsub16s	%f31,	%f11,	%f26
	movpos	%xcc,	%i3,	%o2
	fmovdgu	%icc,	%f29,	%f22
	edge32n	%i1,	%g3,	%l2
	fmovrdgz	%i0,	%f10,	%f28
	array32	%o4,	%g6,	%l0
	edge8l	%i5,	%i2,	%i7
	xnorcc	%o6,	%g1,	%g2
	srlx	%o0,	0x0A,	%l6
	xorcc	%l3,	0x02A7,	%l4
	fnot2	%f20,	%f8
	subc	%i4,	0x0E3F,	%o3
	or	%o1,	%l5,	%i6
	movle	%icc,	%o7,	%l1
	movrlez	%o5,	%g4,	%g5
	xnorcc	%g7,	0x1001,	%o2
	ldsh	[%l7 + 0x4E],	%i1
	fmovde	%xcc,	%f13,	%f12
	andcc	%i3,	%g3,	%l2
	umulcc	%o4,	0x008F,	%g6
	fcmpne16	%f26,	%f24,	%l0
	sll	%i5,	%i0,	%i7
	fnands	%f19,	%f11,	%f16
	mulx	%i2,	%o6,	%g2
	sllx	%g1,	%l6,	%o0
	sdivx	%l3,	0x1620,	%l4
	movrgez	%i4,	%o3,	%o1
	fmovdge	%icc,	%f9,	%f16
	addc	%i6,	0x022A,	%l5
	fzeros	%f3
	ldsw	[%l7 + 0x64],	%l1
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	nop
	set	0x12, %o4
	ldub	[%l7 + %o4],	%g5
	edge8	%o5,	%o2,	%i1
	fzeros	%f14
	movneg	%icc,	%g7,	%i3
	array32	%l2,	%g3,	%g6
	smul	%o4,	0x1D79,	%i5
	umul	%l0,	0x0CFB,	%i0
	fmovsl	%xcc,	%f23,	%f8
	st	%f17,	[%l7 + 0x70]
	alignaddr	%i7,	%i2,	%g2
	edge8	%o6,	%l6,	%o0
	srlx	%l3,	%g1,	%l4
	fmovdne	%icc,	%f26,	%f22
	umul	%o3,	%o1,	%i4
	fcmpeq16	%f2,	%f2,	%l5
	move	%xcc,	%i6,	%o7
	save %g4, 0x0355, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%icc,	%f21,	%f9
	array16	%o5,	%o2,	%i1
	nop
	set	0x3D, %i2
	stb	%g7,	[%l7 + %i2]
	fmovrse	%g5,	%f27,	%f5
	srlx	%l2,	%i3,	%g6
	and	%o4,	0x021E,	%g3
	xorcc	%i5,	0x1B0D,	%i0
	edge32	%l0,	%i7,	%i2
	fpadd16	%f6,	%f24,	%f6
	fmul8sux16	%f8,	%f0,	%f24
	movle	%icc,	%o6,	%g2
	stb	%l6,	[%l7 + 0x0E]
	sub	%o0,	0x07A5,	%g1
	edge32l	%l4,	%l3,	%o3
	movpos	%xcc,	%i4,	%o1
	edge8ln	%i6,	%l5,	%g4
	fzero	%f26
	movcc	%icc,	%l1,	%o7
	fmovsle	%icc,	%f20,	%f19
	edge32ln	%o2,	%o5,	%g7
	save %i1, %g5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i3,	0x15,	%g6
	srl	%o4,	%g3,	%i5
	sub	%i0,	0x012A,	%l0
	st	%f12,	[%l7 + 0x48]
	movneg	%xcc,	%i2,	%o6
	ldd	[%l7 + 0x08],	%f22
	fmovdne	%icc,	%f7,	%f0
	movrlez	%i7,	0x20D,	%l6
	movg	%xcc,	%g2,	%o0
	edge16n	%g1,	%l4,	%o3
	edge8l	%i4,	%o1,	%i6
	stx	%l5,	[%l7 + 0x78]
	sllx	%l3,	%l1,	%o7
	subccc	%o2,	0x0B3A,	%g4
	fmovse	%icc,	%f11,	%f4
	xnor	%o5,	0x034D,	%g7
	save %i1, %g5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g6,	%o4,	%i3
	fmovse	%icc,	%f5,	%f30
	movrlz	%i5,	0x06F,	%g3
	restore %l0, %i2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x70],	%i7
	edge32	%i0,	%l6,	%g2
	edge16n	%o0,	%l4,	%o3
	st	%f22,	[%l7 + 0x70]
	movrgz	%g1,	0x269,	%i4
	edge16n	%i6,	%o1,	%l3
	mulscc	%l5,	%o7,	%o2
	subccc	%g4,	%l1,	%g7
	fmovsvs	%icc,	%f12,	%f28
	sdivx	%i1,	0x1708,	%g5
	ldsw	[%l7 + 0x50],	%l2
	sra	%g6,	0x08,	%o5
	fandnot2s	%f5,	%f10,	%f3
	srax	%i3,	%i5,	%o4
	sra	%g3,	%l0,	%i2
	or	%o6,	%i0,	%l6
	andncc	%g2,	%o0,	%l4
	subcc	%i7,	0x1D0F,	%g1
	andcc	%o3,	%i6,	%i4
	edge8l	%l3,	%o1,	%o7
	subc	%l5,	0x0CDE,	%o2
	fxnor	%f6,	%f28,	%f20
	orn	%l1,	%g7,	%g4
	umul	%g5,	%l2,	%g6
	fone	%f4
	movrne	%i1,	%o5,	%i5
	movgu	%icc,	%i3,	%o4
	fmovdg	%xcc,	%f5,	%f8
	xorcc	%g3,	%i2,	%o6
	edge32n	%i0,	%l6,	%l0
	orncc	%g2,	%o0,	%i7
	fmovrslz	%g1,	%f18,	%f29
	movge	%icc,	%o3,	%i6
	srl	%l4,	0x1E,	%i4
	mova	%icc,	%o1,	%l3
	st	%f16,	[%l7 + 0x0C]
	movgu	%icc,	%l5,	%o2
	sll	%l1,	0x01,	%g7
	subcc	%o7,	%g5,	%l2
	ldsh	[%l7 + 0x20],	%g4
	movvs	%xcc,	%g6,	%o5
	fmul8x16au	%f14,	%f4,	%f16
	sethi	0x128B,	%i5
	array32	%i3,	%o4,	%i1
	add	%g3,	%i2,	%i0
	stb	%o6,	[%l7 + 0x72]
	alignaddr	%l0,	%l6,	%g2
	edge16l	%i7,	%o0,	%g1
	fmovdne	%xcc,	%f25,	%f23
	move	%icc,	%o3,	%l4
	fmovscc	%icc,	%f22,	%f15
	movrlez	%i4,	0x24C,	%o1
	movne	%xcc,	%l3,	%l5
	xorcc	%i6,	0x0D3C,	%o2
	ld	[%l7 + 0x58],	%f14
	stx	%g7,	[%l7 + 0x50]
	sdiv	%l1,	0x0749,	%g5
	std	%f28,	[%l7 + 0x58]
	edge32ln	%l2,	%g4,	%g6
	fandnot2s	%f13,	%f6,	%f19
	fmovrsne	%o7,	%f30,	%f3
	edge8	%o5,	%i5,	%i3
	edge32	%o4,	%g3,	%i1
	sra	%i0,	0x17,	%o6
	movn	%icc,	%i2,	%l6
	umul	%g2,	%l0,	%i7
	sdivcc	%g1,	0x1BAC,	%o3
	fmuld8ulx16	%f31,	%f19,	%f18
	sethi	0x0D10,	%o0
	sdiv	%l4,	0x0CB5,	%i4
	sll	%o1,	0x1C,	%l3
	nop
	set	0x7C, %i4
	ldsw	[%l7 + %i4],	%l5
	smul	%i6,	%g7,	%l1
	fornot1	%f16,	%f24,	%f26
	lduh	[%l7 + 0x38],	%g5
	st	%f29,	[%l7 + 0x44]
	edge16	%l2,	%o2,	%g6
	lduw	[%l7 + 0x28],	%g4
	andncc	%o5,	%o7,	%i5
	subc	%o4,	%i3,	%g3
	edge32n	%i1,	%i0,	%o6
	fxnor	%f10,	%f18,	%f30
	srl	%l6,	0x0B,	%g2
	movg	%xcc,	%i2,	%l0
	fpsub16	%f16,	%f22,	%f4
	movcs	%xcc,	%g1,	%i7
	movrgez	%o0,	%l4,	%i4
	movge	%xcc,	%o3,	%l3
	alignaddrl	%l5,	%o1,	%g7
	sdivx	%l1,	0x17A9,	%i6
	fone	%f26
	orn	%g5,	%o2,	%g6
	movle	%icc,	%g4,	%l2
	sll	%o7,	0x0B,	%i5
	fmovsn	%icc,	%f30,	%f1
	fxnors	%f19,	%f12,	%f24
	fandnot2	%f4,	%f30,	%f14
	fmovdg	%icc,	%f13,	%f4
	fxnors	%f6,	%f11,	%f29
	and	%o5,	0x0140,	%i3
	fnot1s	%f21,	%f5
	popc	%o4,	%i1
	edge16ln	%i0,	%o6,	%l6
	umulcc	%g3,	0x03B3,	%i2
	edge32	%g2,	%l0,	%g1
	movvc	%icc,	%o0,	%l4
	udivcc	%i7,	0x0FC5,	%i4
	edge32l	%l3,	%o3,	%o1
	fpsub16s	%f25,	%f8,	%f19
	fmovsa	%xcc,	%f7,	%f11
	ldsh	[%l7 + 0x7A],	%g7
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	ldd	[%l7 + 0x60],	%i6
	fand	%f0,	%f16,	%f24
	movre	%o2,	0x0D9,	%g5
	umulcc	%g6,	0x1AD7,	%l2
	xnor	%o7,	%g4,	%i5
	srlx	%i3,	%o5,	%o4
	srl	%i1,	%o6,	%l6
	array8	%i0,	%g3,	%i2
	fmovsn	%xcc,	%f18,	%f9
	ldub	[%l7 + 0x59],	%g2
	sll	%l0,	0x00,	%o0
	lduw	[%l7 + 0x18],	%l4
	sll	%g1,	0x17,	%i4
	edge32ln	%l3,	%o3,	%i7
	lduw	[%l7 + 0x58],	%o1
	fcmpes	%fcc2,	%f24,	%f6
	alignaddr	%g7,	%l1,	%l5
	subc	%o2,	%g5,	%i6
	edge8l	%g6,	%l2,	%g4
	fexpand	%f21,	%f0
	sir	0x0A52
	fmovrse	%i5,	%f30,	%f28
	save %i3, 0x19AE, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o4,	%i1,	%o5
	movrlz	%l6,	0x292,	%o6
	xnorcc	%i0,	%g3,	%g2
	alignaddrl	%i2,	%l0,	%l4
	fmul8x16al	%f18,	%f18,	%f6
	fmovsl	%xcc,	%f14,	%f13
	fabss	%f7,	%f0
	fcmpgt16	%f16,	%f26,	%o0
	fpsub16	%f26,	%f22,	%f6
	sdivcc	%i4,	0x0BF8,	%g1
	movleu	%icc,	%o3,	%i7
	sll	%o1,	%l3,	%l1
	fmovrsgz	%l5,	%f28,	%f11
	fnand	%f18,	%f6,	%f22
	movn	%icc,	%g7,	%o2
	or	%g5,	0x14BF,	%g6
	fmovsgu	%icc,	%f31,	%f20
	xnor	%i6,	%l2,	%g4
	bshuffle	%f0,	%f12,	%f8
	edge8ln	%i5,	%i3,	%o7
	movg	%xcc,	%o4,	%i1
	xor	%l6,	0x1DF5,	%o6
	stx	%o5,	[%l7 + 0x28]
	fmovscc	%icc,	%f18,	%f24
	fmovsge	%icc,	%f21,	%f21
	ldub	[%l7 + 0x2E],	%i0
	movre	%g3,	%i2,	%g2
	and	%l4,	0x1374,	%o0
	udivcc	%l0,	0x11A4,	%g1
	nop
	set	0x60, %l5
	lduw	[%l7 + %l5],	%i4
	srlx	%i7,	%o3,	%o1
	mova	%icc,	%l3,	%l5
	stw	%g7,	[%l7 + 0x38]
	faligndata	%f12,	%f2,	%f22
	sll	%o2,	%l1,	%g6
	sethi	0x0C4A,	%i6
	srax	%g5,	%g4,	%l2
	udivcc	%i3,	0x0F8A,	%i5
	fmovd	%f0,	%f8
	fabsd	%f16,	%f0
	sdivcc	%o4,	0x0586,	%i1
	movrlez	%o7,	0x2CC,	%o6
	umul	%l6,	0x09D6,	%o5
	save %i0, 0x01C5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g2,	0x15,	%l4
	fmovrde	%i2,	%f0,	%f10
	srax	%l0,	%g1,	%o0
	nop
	set	0x68, %o1
	sth	%i7,	[%l7 + %o1]
	ldsh	[%l7 + 0x64],	%o3
	st	%f20,	[%l7 + 0x14]
	popc	0x0A4A,	%i4
	movge	%icc,	%l3,	%l5
	stw	%g7,	[%l7 + 0x6C]
	sir	0x0709
	fnors	%f3,	%f21,	%f1
	edge16	%o1,	%l1,	%o2
	fnands	%f0,	%f15,	%f17
	movrne	%i6,	0x1A1,	%g6
	sethi	0x11E9,	%g5
	movrlez	%g4,	%i3,	%i5
	edge32	%o4,	%l2,	%o7
	movne	%icc,	%i1,	%l6
	fornot2s	%f16,	%f25,	%f3
	smul	%o6,	%i0,	%o5
	movl	%icc,	%g2,	%g3
	movrlz	%i2,	%l4,	%g1
	lduw	[%l7 + 0x10],	%l0
	umul	%i7,	%o3,	%i4
	fcmple16	%f24,	%f12,	%o0
	std	%f6,	[%l7 + 0x50]
	andn	%l3,	0x1ED8,	%g7
	umul	%l5,	0x100E,	%o1
	std	%f12,	[%l7 + 0x78]
	movrgez	%o2,	0x070,	%l1
	fmovda	%icc,	%f17,	%f1
	srlx	%g6,	0x00,	%g5
	or	%g4,	0x1247,	%i6
	stw	%i3,	[%l7 + 0x14]
	fxnor	%f22,	%f4,	%f28
	and	%o4,	0x1DE6,	%l2
	xnor	%o7,	0x1E0F,	%i1
	ld	[%l7 + 0x38],	%f9
	fmovrsne	%i5,	%f12,	%f23
	or	%o6,	%l6,	%i0
	fmovsge	%xcc,	%f30,	%f16
	movrlez	%o5,	%g2,	%i2
	edge32	%g3,	%g1,	%l4
	fpadd16s	%f17,	%f25,	%f5
	array8	%l0,	%o3,	%i7
	umulcc	%o0,	0x1164,	%l3
	edge8ln	%i4,	%l5,	%o1
	fsrc1	%f22,	%f14
	array32	%o2,	%g7,	%l1
	subccc	%g6,	0x09DE,	%g4
	edge32	%g5,	%i6,	%o4
	stb	%l2,	[%l7 + 0x42]
	xnor	%i3,	%o7,	%i1
	edge16l	%i5,	%o6,	%i0
	sll	%l6,	0x15,	%g2
	fnand	%f26,	%f26,	%f24
	smulcc	%i2,	%o5,	%g1
	movn	%xcc,	%l4,	%g3
	fxnor	%f10,	%f2,	%f8
	movle	%xcc,	%o3,	%l0
	movvc	%icc,	%i7,	%o0
	ldub	[%l7 + 0x34],	%l3
	ldsw	[%l7 + 0x70],	%l5
	alignaddr	%i4,	%o1,	%o2
	fmovrslez	%g7,	%f11,	%f27
	fnot1s	%f7,	%f25
	edge16ln	%l1,	%g6,	%g5
	subc	%g4,	%i6,	%o4
	srlx	%i3,	0x1F,	%o7
	std	%f30,	[%l7 + 0x28]
	movleu	%xcc,	%i1,	%l2
	sll	%o6,	0x1A,	%i0
	movne	%icc,	%i5,	%l6
	ldsb	[%l7 + 0x10],	%i2
	orcc	%o5,	0x13F1,	%g1
	orn	%g2,	%l4,	%g3
	srax	%l0,	0x11,	%o3
	movrlz	%o0,	%i7,	%l3
	sdiv	%l5,	0x1803,	%i4
	fmovrdne	%o1,	%f0,	%f0
	sra	%o2,	0x10,	%g7
	xnorcc	%g6,	%l1,	%g5
	edge16	%g4,	%o4,	%i6
	smul	%o7,	%i3,	%i1
	srl	%l2,	0x06,	%o6
	fornot1	%f0,	%f2,	%f0
	sth	%i5,	[%l7 + 0x34]
	srl	%l6,	%i2,	%i0
	orncc	%g1,	%g2,	%o5
	sir	0x1294
	movleu	%xcc,	%l4,	%l0
	udivx	%o3,	0x13FA,	%g3
	fcmpgt16	%f4,	%f16,	%i7
	xnor	%o0,	%l3,	%i4
	ldd	[%l7 + 0x30],	%f14
	andn	%o1,	0x0C88,	%o2
	fcmpeq32	%f18,	%f30,	%l5
	orncc	%g6,	%l1,	%g7
	andncc	%g5,	%o4,	%g4
	sdivcc	%i6,	0x1699,	%i3
	sdivx	%o7,	0x16B7,	%l2
	alignaddr	%o6,	%i1,	%l6
	movre	%i5,	%i0,	%g1
	fsrc2	%f30,	%f22
	ldx	[%l7 + 0x60],	%i2
	mulx	%g2,	%l4,	%o5
	xnorcc	%l0,	0x0870,	%g3
	srlx	%o3,	%o0,	%i7
	fors	%f15,	%f2,	%f26
	fmovdpos	%icc,	%f31,	%f20
	subc	%i4,	0x1D50,	%o1
	array16	%o2,	%l3,	%l5
	fmovdleu	%xcc,	%f28,	%f6
	ldd	[%l7 + 0x40],	%g6
	and	%l1,	%g7,	%g5
	fmovrsgez	%g4,	%f16,	%f18
	fmovda	%icc,	%f16,	%f4
	and	%o4,	%i6,	%i3
	sllx	%l2,	%o7,	%o6
	pdist	%f14,	%f0,	%f28
	array8	%l6,	%i5,	%i1
	sdivcc	%i0,	0x003B,	%g1
	move	%icc,	%g2,	%l4
	alignaddrl	%i2,	%o5,	%l0
	sir	0x1D6B
	subcc	%g3,	0x19F0,	%o3
	edge16ln	%o0,	%i7,	%i4
	and	%o1,	%o2,	%l3
	stx	%g6,	[%l7 + 0x58]
	pdist	%f30,	%f6,	%f0
	fcmpne32	%f14,	%f12,	%l1
	array8	%g7,	%l5,	%g4
	xnor	%o4,	%g5,	%i6
	sllx	%l2,	0x01,	%i3
	faligndata	%f6,	%f22,	%f14
	fzeros	%f25
	fmuld8sux16	%f28,	%f18,	%f0
	ldsh	[%l7 + 0x24],	%o6
	fnot1s	%f2,	%f4
	nop
	set	0x62, %l4
	lduh	[%l7 + %l4],	%l6
	stb	%o7,	[%l7 + 0x61]
	fpack16	%f4,	%f23
	edge32	%i1,	%i5,	%g1
	fnot1s	%f4,	%f21
	fmovdl	%xcc,	%f30,	%f24
	edge8n	%i0,	%l4,	%i2
	sdiv	%g2,	0x130D,	%o5
	umulcc	%l0,	%g3,	%o3
	movrlez	%i7,	0x21F,	%o0
	fzero	%f18
	fsrc2	%f0,	%f0
	array8	%o1,	%o2,	%i4
	fors	%f20,	%f24,	%f21
	edge16ln	%g6,	%l3,	%g7
	xorcc	%l1,	%g4,	%l5
	fmovsle	%xcc,	%f13,	%f1
	subcc	%g5,	0x0D33,	%i6
	sethi	0x1A08,	%o4
	sdiv	%l2,	0x18F4,	%o6
	lduw	[%l7 + 0x6C],	%i3
	smulcc	%l6,	%o7,	%i1
	movrgez	%g1,	0x33B,	%i0
	ldsb	[%l7 + 0x30],	%i5
	ldsb	[%l7 + 0x1D],	%l4
	orncc	%i2,	%g2,	%o5
	xorcc	%l0,	0x1974,	%g3
	nop
	set	0x37, %g2
	stb	%i7,	[%l7 + %g2]
	addccc	%o3,	%o1,	%o2
	orn	%i4,	0x0134,	%g6
	movleu	%icc,	%o0,	%g7
	fcmpeq16	%f10,	%f28,	%l3
	array8	%l1,	%l5,	%g4
	movl	%icc,	%g5,	%i6
	popc	%l2,	%o4
	array16	%i3,	%l6,	%o7
	movgu	%xcc,	%i1,	%o6
	movl	%icc,	%i0,	%g1
	ldub	[%l7 + 0x57],	%i5
	udiv	%i2,	0x0B1C,	%g2
	array32	%l4,	%o5,	%l0
	addcc	%g3,	%i7,	%o1
	nop
	set	0x0E, %i6
	ldub	[%l7 + %i6],	%o3
	movg	%xcc,	%i4,	%g6
	fnegd	%f16,	%f12
	movrgz	%o2,	%o0,	%l3
	orncc	%g7,	%l1,	%g4
	andncc	%l5,	%g5,	%i6
	array8	%o4,	%l2,	%i3
	st	%f17,	[%l7 + 0x74]
	edge32n	%l6,	%i1,	%o7
	edge8n	%o6,	%i0,	%i5
	fmovsn	%xcc,	%f3,	%f21
	move	%xcc,	%g1,	%i2
	umulcc	%g2,	0x041F,	%l4
	udiv	%o5,	0x0AB5,	%l0
	fnegs	%f6,	%f22
	popc	%g3,	%o1
	sllx	%o3,	%i4,	%i7
	popc	0x055E,	%g6
	edge16ln	%o0,	%l3,	%g7
	ldsh	[%l7 + 0x32],	%o2
	movpos	%xcc,	%g4,	%l1
	alignaddr	%g5,	%l5,	%o4
	movgu	%xcc,	%l2,	%i3
	ldsh	[%l7 + 0x1A],	%i6
	andncc	%i1,	%o7,	%l6
	fcmpgt16	%f6,	%f12,	%o6
	fmovsvs	%xcc,	%f29,	%f15
	movvs	%xcc,	%i5,	%g1
	edge8ln	%i2,	%g2,	%l4
	fmovdneg	%xcc,	%f8,	%f3
	fmovdle	%icc,	%f7,	%f30
	fandnot1s	%f29,	%f18,	%f15
	movleu	%xcc,	%i0,	%l0
	srlx	%g3,	%o1,	%o5
	ldd	[%l7 + 0x18],	%f28
	fxor	%f18,	%f30,	%f4
	restore %o3, 0x0563, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%g6,	%f20,	%f19
	fpack32	%f18,	%f24,	%f10
	sra	%o0,	%l3,	%g7
	fmovrdlez	%o2,	%f14,	%f28
	movrgez	%g4,	0x1CD,	%i4
	fpadd16	%f4,	%f18,	%f8
	fand	%f20,	%f28,	%f12
	movcc	%icc,	%g5,	%l1
	fcmpes	%fcc1,	%f29,	%f0
	movg	%icc,	%o4,	%l2
	fmuld8sux16	%f5,	%f5,	%f22
	subc	%i3,	0x0CA0,	%l5
	movg	%xcc,	%i1,	%i6
	sdivcc	%l6,	0x03C3,	%o7
	fmovdge	%xcc,	%f28,	%f19
	sra	%i5,	%o6,	%i2
	fmovsle	%xcc,	%f23,	%f16
	xnor	%g2,	%l4,	%g1
	ldd	[%l7 + 0x48],	%f26
	smul	%i0,	0x1820,	%l0
	movgu	%xcc,	%g3,	%o5
	sllx	%o1,	%o3,	%i7
	alignaddr	%o0,	%g6,	%g7
	movneg	%xcc,	%l3,	%o2
	nop
	set	0x68, %l3
	ldx	[%l7 + %l3],	%i4
	fmovdpos	%icc,	%f15,	%f0
	movpos	%xcc,	%g5,	%g4
	movvc	%xcc,	%o4,	%l1
	edge16n	%l2,	%l5,	%i3
	fcmpne32	%f20,	%f22,	%i6
	popc	%l6,	%o7
	fmovspos	%xcc,	%f3,	%f20
	fmovdgu	%icc,	%f2,	%f10
	array32	%i5,	%o6,	%i2
	std	%f18,	[%l7 + 0x38]
	fmovsleu	%xcc,	%f10,	%f17
	edge32n	%i1,	%l4,	%g1
	movvc	%icc,	%g2,	%i0
	fmovsn	%xcc,	%f9,	%f10
	add	%l0,	%g3,	%o1
	sdiv	%o3,	0x0E26,	%i7
	add	%o0,	%o5,	%g6
	udivx	%l3,	0x06AD,	%g7
	smul	%o2,	0x0714,	%g5
	movle	%xcc,	%i4,	%g4
	movrgez	%l1,	0x20E,	%l2
	fmovscc	%icc,	%f7,	%f23
	subccc	%l5,	%o4,	%i6
	popc	%i3,	%l6
	fxor	%f10,	%f28,	%f20
	fpadd32	%f2,	%f0,	%f28
	ldsw	[%l7 + 0x10],	%o7
	pdist	%f2,	%f24,	%f2
	movne	%xcc,	%i5,	%i2
	movvc	%icc,	%o6,	%l4
	stx	%g1,	[%l7 + 0x58]
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	udivx	%l0,	0x06FD,	%g3
	array16	%i0,	%o3,	%o1
	mulx	%o0,	%i7,	%o5
	fmovsa	%icc,	%f28,	%f27
	ldsw	[%l7 + 0x3C],	%l3
	movne	%icc,	%g6,	%o2
	movrlz	%g7,	%g5,	%i4
	fmovrde	%g4,	%f14,	%f0
	mulx	%l2,	0x11FF,	%l5
	edge32	%l1,	%o4,	%i6
	srl	%i3,	%o7,	%l6
	edge16	%i5,	%o6,	%i2
	std	%f4,	[%l7 + 0x30]
	srlx	%l4,	%i1,	%g1
	srl	%g2,	%l0,	%g3
	fand	%f16,	%f30,	%f12
	fpadd16	%f28,	%f10,	%f30
	fnor	%f10,	%f4,	%f0
	movcc	%icc,	%o3,	%o1
	add	%o0,	%i7,	%o5
	fcmpes	%fcc1,	%f3,	%f24
	siam	0x6
	edge8ln	%i0,	%g6,	%l3
	movvc	%xcc,	%o2,	%g5
	fmovdcc	%icc,	%f2,	%f18
	stb	%g7,	[%l7 + 0x31]
	stb	%i4,	[%l7 + 0x42]
	sdiv	%l2,	0x0A26,	%l5
	sra	%g4,	0x15,	%o4
	lduw	[%l7 + 0x40],	%i6
	fandnot1s	%f7,	%f4,	%f7
	fmovdvs	%icc,	%f5,	%f26
	sdivx	%l1,	0x171F,	%i3
	fmovdg	%xcc,	%f4,	%f18
	fmovdvc	%xcc,	%f26,	%f29
	movrlz	%o7,	0x1D0,	%i5
	stb	%o6,	[%l7 + 0x67]
	movgu	%icc,	%i2,	%l6
	mulx	%i1,	%g1,	%l4
	and	%l0,	0x1803,	%g3
	andncc	%g2,	%o1,	%o0
	fnot1	%f20,	%f14
	edge32n	%o3,	%i7,	%o5
	xor	%g6,	%l3,	%o2
	movleu	%xcc,	%i0,	%g7
	sdivcc	%i4,	0x1763,	%g5
	addcc	%l2,	0x154E,	%l5
	fmovsa	%xcc,	%f2,	%f21
	movgu	%icc,	%o4,	%g4
	xor	%l1,	%i3,	%i6
	fpsub16	%f6,	%f2,	%f12
	andn	%i5,	0x157A,	%o7
	array8	%i2,	%o6,	%i1
	andncc	%l6,	%g1,	%l0
	smulcc	%l4,	0x13C8,	%g3
	fmovrdgz	%o1,	%f20,	%f26
	fandnot2s	%f29,	%f4,	%f15
	edge8n	%o0,	%g2,	%i7
	st	%f29,	[%l7 + 0x40]
	edge32l	%o3,	%o5,	%g6
	edge16ln	%o2,	%i0,	%g7
	xnorcc	%i4,	%g5,	%l2
	udiv	%l3,	0x0CFA,	%o4
	orn	%g4,	0x0F1F,	%l5
	popc	0x0A25,	%i3
	edge8n	%i6,	%i5,	%o7
	fpadd32	%f4,	%f0,	%f16
	edge32	%l1,	%i2,	%o6
	subccc	%i1,	%g1,	%l0
	fpsub16s	%f22,	%f9,	%f31
	or	%l6,	%g3,	%o1
	ldsb	[%l7 + 0x27],	%o0
	fmovrslz	%g2,	%f24,	%f6
	fmovdvc	%icc,	%f19,	%f23
	srlx	%i7,	%l4,	%o5
	fmovscc	%xcc,	%f29,	%f2
	ldx	[%l7 + 0x28],	%o3
	addcc	%g6,	%i0,	%o2
	lduw	[%l7 + 0x58],	%i4
	subcc	%g5,	0x1440,	%l2
	edge8	%g7,	%o4,	%l3
	edge16n	%g4,	%l5,	%i6
	smul	%i5,	0x183D,	%i3
	fcmple16	%f10,	%f24,	%o7
	umul	%i2,	0x07C7,	%l1
	fmovsle	%xcc,	%f2,	%f7
	movcc	%xcc,	%o6,	%i1
	lduw	[%l7 + 0x34],	%l0
	movn	%xcc,	%l6,	%g3
	movn	%xcc,	%g1,	%o0
	srax	%o1,	%g2,	%l4
	subccc	%i7,	%o5,	%o3
	movvc	%icc,	%g6,	%o2
	movre	%i0,	%g5,	%l2
	alignaddr	%i4,	%g7,	%l3
	sdivcc	%o4,	0x165D,	%l5
	array16	%i6,	%g4,	%i5
	fmovdl	%icc,	%f3,	%f25
	fmovdcs	%icc,	%f30,	%f10
	fpadd16	%f12,	%f20,	%f16
	edge16l	%i3,	%i2,	%o7
	movne	%xcc,	%l1,	%i1
	orcc	%l0,	%l6,	%o6
	fmovdl	%xcc,	%f4,	%f8
	fpack16	%f30,	%f11
	movvs	%icc,	%g1,	%g3
	for	%f2,	%f14,	%f24
	movvc	%icc,	%o1,	%o0
	fnands	%f9,	%f30,	%f27
	fxor	%f24,	%f0,	%f14
	movvs	%xcc,	%l4,	%g2
	subc	%o5,	%i7,	%o3
	sdivx	%o2,	0x11E6,	%i0
	fnegs	%f8,	%f6
	move	%icc,	%g5,	%l2
	fcmpeq32	%f0,	%f16,	%g6
	andncc	%i4,	%l3,	%o4
	movrlz	%g7,	%l5,	%i6
	fmovsg	%icc,	%f6,	%f19
	movg	%xcc,	%i5,	%i3
	subcc	%g4,	0x1422,	%o7
	fnegs	%f24,	%f2
	fmovrdgez	%l1,	%f0,	%f22
	andncc	%i1,	%l0,	%i2
	addc	%o6,	%g1,	%l6
	array16	%g3,	%o0,	%o1
	popc	%l4,	%o5
	movge	%xcc,	%i7,	%g2
	edge8	%o3,	%i0,	%g5
	fmovsvs	%xcc,	%f10,	%f18
	sth	%l2,	[%l7 + 0x18]
	edge16n	%g6,	%o2,	%i4
	add	%o4,	%g7,	%l5
	edge8ln	%l3,	%i6,	%i5
	fmovdcc	%xcc,	%f28,	%f2
	fzeros	%f15
	stw	%i3,	[%l7 + 0x48]
	ldd	[%l7 + 0x08],	%o6
	restore %g4, %l1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i1,	[%l7 + 0x68]
	srax	%o6,	0x1E,	%i2
	ldub	[%l7 + 0x3B],	%g1
	edge16l	%g3,	%l6,	%o1
	fpsub32	%f24,	%f10,	%f20
	sra	%l4,	%o5,	%o0
	edge32ln	%i7,	%g2,	%i0
	array32	%o3,	%g5,	%l2
	movrlez	%o2,	%g6,	%o4
	movg	%xcc,	%g7,	%i4
	movrgez	%l5,	0x3FD,	%i6
	fcmpne32	%f20,	%f14,	%i5
	edge32ln	%l3,	%i3,	%o7
	movneg	%icc,	%g4,	%l1
	ldub	[%l7 + 0x57],	%l0
	udiv	%i1,	0x076E,	%o6
	edge32l	%i2,	%g1,	%g3
	edge32l	%o1,	%l6,	%l4
	edge32n	%o0,	%i7,	%o5
	alignaddr	%i0,	%g2,	%g5
	mulx	%l2,	0x035E,	%o2
	fcmped	%fcc1,	%f0,	%f26
	array16	%o3,	%o4,	%g6
	ldx	[%l7 + 0x38],	%g7
	sllx	%i4,	0x0F,	%i6
	fzero	%f14
	fcmped	%fcc1,	%f4,	%f14
	array8	%i5,	%l3,	%i3
	fmovrdne	%o7,	%f24,	%f22
	andcc	%l5,	0x0A94,	%g4
	subcc	%l0,	0x18D6,	%l1
	fpsub16	%f8,	%f22,	%f26
	xnor	%i1,	%o6,	%g1
	add	%g3,	0x05A5,	%i2
	move	%icc,	%l6,	%o1
	movrgez	%l4,	%i7,	%o5
	sllx	%i0,	%o0,	%g5
	addccc	%g2,	%o2,	%o3
	sub	%o4,	%l2,	%g6
	movn	%xcc,	%g7,	%i6
	fsrc2s	%f3,	%f21
	stw	%i5,	[%l7 + 0x60]
	movvs	%xcc,	%i4,	%i3
	movneg	%xcc,	%o7,	%l3
	srl	%l5,	0x1A,	%l0
	movg	%icc,	%l1,	%g4
	edge32	%o6,	%g1,	%i1
	fpadd16	%f14,	%f14,	%f20
	movrne	%g3,	%i2,	%o1
	movg	%xcc,	%l4,	%l6
	sdivcc	%o5,	0x03A9,	%i0
	edge32ln	%i7,	%o0,	%g5
	movgu	%xcc,	%g2,	%o3
	fmovdneg	%icc,	%f13,	%f23
	array16	%o4,	%o2,	%g6
	sth	%l2,	[%l7 + 0x3A]
	udivx	%g7,	0x1631,	%i5
	fnands	%f26,	%f24,	%f25
	fmovda	%icc,	%f8,	%f4
	edge8	%i4,	%i3,	%i6
	fmul8x16au	%f16,	%f23,	%f6
	fmovrsne	%l3,	%f12,	%f26
	xnor	%o7,	0x0BA8,	%l5
	edge8	%l0,	%g4,	%o6
	stx	%g1,	[%l7 + 0x68]
	fmul8x16al	%f29,	%f20,	%f30
	sdivcc	%l1,	0x0E86,	%i1
	movrlez	%i2,	0x178,	%g3
	fmuld8ulx16	%f17,	%f13,	%f28
	fmovrde	%o1,	%f20,	%f16
	andcc	%l6,	0x116A,	%o5
	addccc	%l4,	%i0,	%i7
	subccc	%g5,	%g2,	%o3
	edge8n	%o4,	%o0,	%o2
	subcc	%g6,	%l2,	%g7
	fmovdle	%icc,	%f24,	%f19
	smulcc	%i5,	0x0B21,	%i3
	sllx	%i4,	%i6,	%o7
	edge8ln	%l5,	%l0,	%l3
	sdiv	%o6,	0x060E,	%g4
	smulcc	%g1,	%i1,	%l1
	fandnot2s	%f24,	%f3,	%f25
	fmovdvs	%icc,	%f15,	%f7
	xnorcc	%i2,	0x11AF,	%o1
	movrlz	%g3,	0x344,	%o5
	edge16	%l4,	%i0,	%i7
	sth	%g5,	[%l7 + 0x5E]
	movrne	%l6,	0x2BC,	%o3
	stw	%o4,	[%l7 + 0x58]
	subc	%o0,	0x0E88,	%o2
	fxnor	%f18,	%f26,	%f16
	fsrc1s	%f30,	%f31
	sdivx	%g6,	0x0B60,	%l2
	movle	%icc,	%g2,	%i5
	sra	%i3,	0x19,	%g7
	fmovscc	%xcc,	%f4,	%f22
	add	%i6,	0x1B89,	%o7
	movrne	%i4,	0x1BF,	%l0
	xnor	%l3,	%l5,	%g4
	movre	%o6,	0x381,	%g1
	movvc	%icc,	%l1,	%i2
	smulcc	%i1,	%o1,	%o5
	movleu	%xcc,	%g3,	%i0
	edge8	%i7,	%g5,	%l4
	sra	%o3,	%o4,	%l6
	fornot1	%f0,	%f20,	%f2
	movre	%o2,	0x02E,	%o0
	ldsh	[%l7 + 0x72],	%l2
	movvs	%xcc,	%g2,	%g6
	move	%xcc,	%i5,	%g7
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	nop
	set	0x74, %l6
	ldsw	[%l7 + %l6],	%l0
	std	%f20,	[%l7 + 0x70]
	subc	%o7,	%l3,	%g4
	subccc	%o6,	%l5,	%l1
	edge8n	%g1,	%i1,	%i2
	movneg	%xcc,	%o5,	%g3
	orn	%o1,	0x0449,	%i7
	fornot2	%f22,	%f30,	%f8
	sll	%i0,	0x08,	%l4
	popc	%g5,	%o4
	movne	%icc,	%o3,	%o2
	ldx	[%l7 + 0x20],	%l6
	fmovrde	%l2,	%f28,	%f28
	movgu	%xcc,	%o0,	%g6
	smulcc	%g2,	0x1ECD,	%i5
	smulcc	%g7,	%i3,	%i4
	edge32n	%l0,	%o7,	%l3
	fnors	%f25,	%f18,	%f5
	smul	%g4,	0x0E84,	%i6
	sllx	%o6,	%l1,	%g1
	ldd	[%l7 + 0x18],	%f18
	srax	%l5,	%i2,	%i1
	subccc	%o5,	%o1,	%g3
	stw	%i7,	[%l7 + 0x5C]
	ldsw	[%l7 + 0x6C],	%l4
	movvs	%icc,	%i0,	%o4
	fmovdcs	%icc,	%f15,	%f9
	fmovsg	%icc,	%f31,	%f4
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%o2
	udiv	%o2,	0x052D,	%l6
	ldsh	[%l7 + 0x76],	%l2
	fmovsgu	%icc,	%f15,	%f18
	fmovrdlez	%g5,	%f18,	%f0
	andn	%o0,	0x1EE1,	%g6
	movrne	%g2,	0x17B,	%g7
	fmul8x16al	%f8,	%f5,	%f22
	fabsd	%f26,	%f18
	fmul8x16	%f19,	%f4,	%f8
	andn	%i5,	0x0BF4,	%i3
	ldub	[%l7 + 0x44],	%i4
	ld	[%l7 + 0x60],	%f22
	andcc	%o7,	0x1A5E,	%l0
	fmul8x16al	%f15,	%f15,	%f22
	alignaddr	%g4,	%l3,	%i6
	movvs	%xcc,	%o6,	%l1
	sra	%g1,	%i2,	%l5
	alignaddrl	%i1,	%o1,	%o5
	sllx	%g3,	%i7,	%i0
	ld	[%l7 + 0x08],	%f29
	sethi	0x14CB,	%l4
	std	%f14,	[%l7 + 0x20]
	addc	%o4,	0x0BF5,	%o2
	fpack16	%f28,	%f27
	fsrc1s	%f29,	%f10
	udivx	%o3,	0x0DA2,	%l6
	movvc	%xcc,	%g5,	%l2
	sth	%o0,	[%l7 + 0x7A]
	sethi	0x13E3,	%g6
	addcc	%g2,	%i5,	%i3
	movvc	%xcc,	%i4,	%o7
	fcmpeq32	%f12,	%f8,	%g7
	movn	%xcc,	%g4,	%l3
	fmovdpos	%xcc,	%f2,	%f8
	fmovrde	%l0,	%f20,	%f24
	mova	%xcc,	%i6,	%o6
	lduh	[%l7 + 0x74],	%g1
	fmovsne	%xcc,	%f12,	%f17
	edge16ln	%i2,	%l1,	%l5
	stb	%i1,	[%l7 + 0x6E]
	movpos	%xcc,	%o5,	%o1
	array8	%g3,	%i0,	%l4
	movcc	%xcc,	%i7,	%o4
	add	%o3,	%l6,	%o2
	subc	%l2,	%o0,	%g6
	addccc	%g2,	0x14CF,	%i5
	fmul8ulx16	%f0,	%f4,	%f2
	orncc	%g5,	0x1164,	%i3
	ld	[%l7 + 0x48],	%f29
	movg	%icc,	%o7,	%g7
	andncc	%i4,	%l3,	%l0
	siam	0x3
	fmuld8ulx16	%f11,	%f24,	%f14
	or	%g4,	0x16BD,	%i6
	fmovda	%icc,	%f29,	%f24
	sdiv	%g1,	0x1049,	%o6
	fmovrsgz	%i2,	%f2,	%f18
	orncc	%l1,	0x0081,	%i1
	smul	%l5,	0x05BC,	%o1
	srlx	%o5,	%i0,	%g3
	edge32n	%l4,	%i7,	%o4
	movne	%xcc,	%o3,	%o2
	ldsb	[%l7 + 0x43],	%l2
	fpack32	%f4,	%f8,	%f20
	ldub	[%l7 + 0x10],	%l6
	fmovde	%icc,	%f17,	%f2
	movcs	%icc,	%g6,	%g2
	popc	%o0,	%g5
	ld	[%l7 + 0x20],	%f30
	mova	%xcc,	%i3,	%i5
	array8	%o7,	%g7,	%i4
	array16	%l3,	%g4,	%i6
	mulscc	%l0,	0x1E9F,	%g1
	edge8ln	%i2,	%l1,	%i1
	orncc	%o6,	%o1,	%o5
	fcmpne32	%f30,	%f26,	%i0
	srl	%l5,	0x18,	%g3
	fornot1s	%f26,	%f3,	%f21
	fnot2s	%f5,	%f16
	udivcc	%l4,	0x1544,	%i7
	smul	%o3,	%o4,	%o2
	orcc	%l2,	0x0B49,	%g6
	fnegd	%f22,	%f14
	subccc	%g2,	0x1C23,	%l6
	edge32ln	%o0,	%g5,	%i5
	alignaddr	%o7,	%g7,	%i4
	srlx	%i3,	0x08,	%g4
	sll	%l3,	%l0,	%g1
	fmovd	%f30,	%f28
	movle	%icc,	%i2,	%i6
	movneg	%xcc,	%l1,	%o6
	xorcc	%o1,	%i1,	%o5
	fmovrdlez	%i0,	%f22,	%f20
	fmovsge	%icc,	%f5,	%f27
	movge	%icc,	%g3,	%l4
	fmovsvc	%icc,	%f22,	%f31
	subccc	%i7,	%o3,	%l5
	udivcc	%o2,	0x0337,	%l2
	srl	%g6,	0x0E,	%g2
	edge32	%l6,	%o0,	%o4
	xnor	%g5,	0x0570,	%o7
	movrgez	%i5,	0x222,	%i4
	std	%f18,	[%l7 + 0x40]
	movg	%xcc,	%i3,	%g7
	edge8	%l3,	%g4,	%g1
	sethi	0x031B,	%l0
	ldx	[%l7 + 0x68],	%i6
	sdivcc	%l1,	0x1989,	%i2
	edge16l	%o1,	%o6,	%i1
	subc	%o5,	0x1FB3,	%i0
	array32	%g3,	%l4,	%o3
	sub	%l5,	%i7,	%o2
	fpsub16	%f28,	%f26,	%f10
	sdivx	%l2,	0x06D1,	%g6
	fmul8x16	%f12,	%f10,	%f26
	movvs	%icc,	%l6,	%g2
	ldd	[%l7 + 0x50],	%o4
	orn	%o0,	%o7,	%i5
	std	%f20,	[%l7 + 0x18]
	mova	%icc,	%g5,	%i3
	udivcc	%g7,	0x12AD,	%i4
	fpadd32	%f24,	%f8,	%f16
	fmuld8ulx16	%f12,	%f10,	%f6
	udivx	%l3,	0x0C91,	%g1
	bshuffle	%f30,	%f28,	%f30
	fmovsvs	%xcc,	%f18,	%f15
	stx	%l0,	[%l7 + 0x20]
	sdivcc	%g4,	0x01D5,	%i6
	alignaddrl	%l1,	%o1,	%i2
	ldsh	[%l7 + 0x4A],	%o6
	addccc	%i1,	0x1D1F,	%o5
	edge8n	%i0,	%g3,	%l4
	edge8n	%o3,	%l5,	%i7
	add	%l2,	%o2,	%g6
	mova	%icc,	%g2,	%l6
	udivx	%o4,	0x18E4,	%o0
	alignaddr	%i5,	%o7,	%g5
	fmovdg	%xcc,	%f7,	%f26
	ldub	[%l7 + 0x6B],	%i3
	fmovsgu	%icc,	%f24,	%f4
	xnorcc	%i4,	%l3,	%g7
	movcc	%xcc,	%l0,	%g1
	or	%g4,	%l1,	%i6
	movn	%xcc,	%i2,	%o6
	edge32	%i1,	%o1,	%i0
	andncc	%g3,	%o5,	%o3
	edge32n	%l4,	%i7,	%l2
	bshuffle	%f12,	%f2,	%f28
	add	%l5,	0x04FF,	%g6
	srax	%o2,	0x03,	%g2
	edge8ln	%l6,	%o4,	%o0
	edge16l	%i5,	%o7,	%g5
	udivx	%i3,	0x0193,	%l3
	sll	%g7,	0x15,	%l0
	smulcc	%g1,	%g4,	%i4
	movl	%icc,	%l1,	%i6
	ldd	[%l7 + 0x60],	%f14
	addccc	%o6,	0x1CF6,	%i1
	ldsh	[%l7 + 0x7A],	%i2
	sub	%i0,	%o1,	%g3
	movn	%icc,	%o5,	%l4
	fabss	%f0,	%f12
	edge16l	%i7,	%l2,	%l5
	sir	0x1E7C
	movg	%icc,	%g6,	%o3
	or	%o2,	0x0E7C,	%l6
	ldx	[%l7 + 0x10],	%g2
	fmovsneg	%xcc,	%f5,	%f7
	fmovspos	%xcc,	%f22,	%f12
	mova	%xcc,	%o0,	%o4
	ldub	[%l7 + 0x46],	%i5
	movrgez	%g5,	0x086,	%o7
	fmul8x16au	%f24,	%f0,	%f24
	sdivcc	%i3,	0x039C,	%l3
	movrgez	%g7,	0x2FC,	%l0
	fones	%f19
	bshuffle	%f4,	%f14,	%f24
	sdivx	%g1,	0x0845,	%g4
	nop
	set	0x6A, %l0
	sth	%l1,	[%l7 + %l0]
	subccc	%i6,	0x168E,	%i4
	xor	%o6,	%i1,	%i0
	orncc	%o1,	0x0883,	%i2
	movn	%xcc,	%g3,	%o5
	orncc	%l4,	%i7,	%l2
	fnot1s	%f7,	%f25
	st	%f13,	[%l7 + 0x64]
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%l4
	fmovda	%xcc,	%f16,	%f10
	fcmpeq16	%f20,	%f0,	%g6
	ldsw	[%l7 + 0x40],	%o3
	edge8n	%l6,	%g2,	%o0
	mulscc	%o2,	%i5,	%g5
	fmovscc	%xcc,	%f8,	%f16
	mulx	%o4,	0x0598,	%o7
	andcc	%l3,	%i3,	%l0
	sethi	0x0467,	%g1
	subccc	%g4,	%l1,	%i6
	movl	%xcc,	%g7,	%i4
	edge8n	%o6,	%i1,	%o1
	fmovdcs	%xcc,	%f17,	%f11
	movcc	%xcc,	%i2,	%i0
	ldx	[%l7 + 0x10],	%g3
	edge16ln	%o5,	%i7,	%l2
	fmovsa	%xcc,	%f0,	%f22
	andcc	%l4,	%g6,	%l5
	array8	%o3,	%g2,	%o0
	fmovrdlz	%o2,	%f30,	%f20
	or	%i5,	%l6,	%o4
	fmovsvs	%icc,	%f20,	%f3
	fxor	%f10,	%f26,	%f26
	xor	%o7,	%g5,	%i3
	sra	%l3,	%g1,	%g4
	sethi	0x1FFC,	%l1
	array32	%l0,	%g7,	%i6
	stw	%o6,	[%l7 + 0x74]
	array16	%i4,	%i1,	%i2
	lduh	[%l7 + 0x3A],	%i0
	addcc	%o1,	%g3,	%o5
	ldd	[%l7 + 0x70],	%i6
	fmovrdlez	%l4,	%f0,	%f20
	edge16	%l2,	%l5,	%g6
	sethi	0x165D,	%o3
	xnor	%o0,	0x01C2,	%o2
	sll	%i5,	%g2,	%o4
	fmovsl	%xcc,	%f24,	%f27
	edge8	%o7,	%g5,	%l6
	fornot1	%f14,	%f20,	%f26
	mulx	%i3,	0x0865,	%g1
	fsrc1	%f30,	%f0
	srl	%l3,	0x09,	%g4
	nop
	set	0x56, %g6
	ldsb	[%l7 + %g6],	%l1
	sdivcc	%l0,	0x0AE8,	%i6
	movne	%icc,	%o6,	%g7
	orncc	%i4,	0x1851,	%i1
	mova	%icc,	%i2,	%i0
	add	%g3,	%o1,	%i7
	andncc	%o5,	%l4,	%l2
	fmovrdgez	%l5,	%f28,	%f2
	movpos	%icc,	%g6,	%o3
	st	%f18,	[%l7 + 0x18]
	movvs	%xcc,	%o0,	%i5
	sll	%g2,	0x0C,	%o2
	alignaddr	%o4,	%g5,	%o7
	subc	%i3,	%g1,	%l3
	srlx	%g4,	%l1,	%l0
	sth	%l6,	[%l7 + 0x14]
	edge16	%o6,	%i6,	%g7
	array8	%i1,	%i4,	%i2
	andncc	%i0,	%g3,	%i7
	movrgz	%o5,	%l4,	%l2
	fmovdleu	%xcc,	%f2,	%f9
	smul	%l5,	0x07FA,	%o1
	edge16	%g6,	%o3,	%o0
	fnors	%f11,	%f6,	%f18
	movvc	%icc,	%g2,	%o2
	sdivcc	%i5,	0x17AA,	%o4
	edge8n	%o7,	%g5,	%g1
	stb	%i3,	[%l7 + 0x7A]
	add	%l3,	%l1,	%g4
	sethi	0x1C7F,	%l0
	edge16ln	%l6,	%o6,	%i6
	fmul8sux16	%f28,	%f16,	%f20
	andncc	%g7,	%i1,	%i2
	srl	%i0,	%i4,	%g3
	movcc	%icc,	%o5,	%i7
	fmovsl	%xcc,	%f19,	%f22
	ldx	[%l7 + 0x10],	%l2
	fmovrdne	%l4,	%f0,	%f20
	sth	%o1,	[%l7 + 0x66]
	ldd	[%l7 + 0x10],	%l4
	edge8	%o3,	%g6,	%o0
	fpsub32	%f14,	%f10,	%f10
	sdiv	%g2,	0x08B0,	%i5
	edge16	%o4,	%o2,	%o7
	smul	%g5,	%i3,	%l3
	alignaddr	%g1,	%g4,	%l1
	ldd	[%l7 + 0x58],	%f14
	sllx	%l6,	%l0,	%i6
	lduh	[%l7 + 0x5C],	%o6
	edge32	%g7,	%i2,	%i0
	movrne	%i1,	%i4,	%o5
	srax	%g3,	0x06,	%i7
	movrlez	%l2,	%o1,	%l5
	add	%o3,	0x0030,	%g6
	restore %o0, 0x0F6D, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i5,	0x1500,	%o4
	sra	%o2,	%o7,	%l4
	fmuld8ulx16	%f24,	%f2,	%f30
	movrlez	%i3,	%l3,	%g5
	edge8	%g4,	%l1,	%g1
	ldub	[%l7 + 0x5B],	%l0
	umul	%i6,	0x09B4,	%l6
	movgu	%icc,	%o6,	%i2
	sub	%g7,	0x1ABF,	%i0
	stb	%i4,	[%l7 + 0x71]
	fmovsvc	%xcc,	%f17,	%f21
	edge16l	%i1,	%g3,	%o5
	fzeros	%f15
	nop
	set	0x7F, %i0
	stb	%i7,	[%l7 + %i0]
	orn	%o1,	%l2,	%o3
	ldd	[%l7 + 0x58],	%g6
	mulscc	%o0,	%l5,	%g2
	sra	%o4,	%o2,	%i5
	fxnors	%f9,	%f18,	%f13
	fmovde	%icc,	%f2,	%f6
	fmovdg	%icc,	%f6,	%f6
	addcc	%o7,	%i3,	%l4
	movrlez	%l3,	%g5,	%l1
	std	%f4,	[%l7 + 0x68]
	movvc	%icc,	%g1,	%l0
	andn	%g4,	0x0AE8,	%i6
	move	%xcc,	%o6,	%i2
	fxor	%f2,	%f6,	%f24
	popc	0x01AC,	%l6
	umul	%i0,	%g7,	%i4
	fmovscs	%xcc,	%f12,	%f30
	edge32l	%g3,	%i1,	%o5
	ldsb	[%l7 + 0x56],	%i7
	andn	%l2,	0x1894,	%o3
	sll	%g6,	%o0,	%l5
	stx	%g2,	[%l7 + 0x08]
	edge16	%o4,	%o2,	%i5
	movvc	%icc,	%o1,	%o7
	save %l4, %i3, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l1,	%g5,	%g1
	addccc	%l0,	%g4,	%o6
	or	%i2,	0x18A7,	%i6
	udiv	%i0,	0x1007,	%g7
	sllx	%i4,	%g3,	%l6
	fnegs	%f28,	%f20
	srl	%o5,	%i7,	%i1
	fmovscc	%icc,	%f2,	%f6
	fpack16	%f30,	%f2
	movvs	%xcc,	%l2,	%o3
	xnor	%o0,	%l5,	%g6
	addc	%g2,	0x0C27,	%o2
	movleu	%icc,	%i5,	%o4
	sethi	0x1510,	%o7
	udivx	%l4,	0x1448,	%i3
	movrgez	%l3,	%l1,	%g5
	ldx	[%l7 + 0x08],	%o1
	xnorcc	%l0,	%g4,	%o6
	fcmpd	%fcc2,	%f2,	%f18
	lduh	[%l7 + 0x32],	%g1
	movneg	%xcc,	%i2,	%i0
	udivcc	%g7,	0x1F0D,	%i4
	sdiv	%i6,	0x1889,	%g3
	fcmpes	%fcc2,	%f21,	%f1
	edge32l	%o5,	%i7,	%i1
	std	%f16,	[%l7 + 0x68]
	alignaddrl	%l2,	%l6,	%o0
	fmul8sux16	%f6,	%f28,	%f14
	fcmpeq32	%f10,	%f10,	%o3
	fmul8ulx16	%f20,	%f2,	%f26
	orncc	%l5,	%g2,	%g6
	srl	%o2,	%o4,	%o7
	ldd	[%l7 + 0x20],	%f26
	movneg	%xcc,	%l4,	%i5
	sir	0x0F9B
	edge32	%l3,	%i3,	%l1
	fandnot1s	%f5,	%f16,	%f15
	addc	%g5,	%o1,	%l0
	sethi	0x1127,	%o6
	ldsw	[%l7 + 0x30],	%g4
	movne	%icc,	%i2,	%g1
	movrlez	%g7,	0x388,	%i4
	array32	%i6,	%i0,	%o5
	movrlz	%g3,	0x188,	%i7
	fornot1	%f18,	%f4,	%f24
	movrlez	%i1,	0x1FC,	%l2
	edge16ln	%l6,	%o0,	%o3
	fpadd16s	%f19,	%f21,	%f30
	andcc	%g2,	0x097C,	%l5
	stw	%g6,	[%l7 + 0x50]
	ldub	[%l7 + 0x49],	%o2
	ldub	[%l7 + 0x6B],	%o7
	andn	%o4,	0x18A0,	%l4
	addccc	%l3,	%i3,	%l1
	fpadd32s	%f7,	%f18,	%f9
	edge16l	%g5,	%i5,	%o1
	movrgez	%l0,	0x3A6,	%o6
	edge32ln	%i2,	%g1,	%g7
	move	%icc,	%g4,	%i4
	smulcc	%i6,	0x0A15,	%o5
	addccc	%i0,	%g3,	%i7
	xnor	%l2,	0x1D32,	%l6
	move	%xcc,	%i1,	%o0
	ld	[%l7 + 0x7C],	%f28
	movn	%xcc,	%o3,	%l5
	xor	%g2,	0x1B4B,	%g6
	std	%f2,	[%l7 + 0x18]
	edge32l	%o7,	%o2,	%o4
	alignaddr	%l3,	%i3,	%l1
	addccc	%g5,	%i5,	%o1
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	udiv	%o6,	0x1C85,	%i2
	xnor	%g1,	%g7,	%g4
	fmovdne	%icc,	%f13,	%f14
	srax	%i4,	%i6,	%i0
	fmovsleu	%xcc,	%f23,	%f1
	andcc	%g3,	0x19DE,	%i7
	ldd	[%l7 + 0x10],	%f14
	edge32	%o5,	%l6,	%i1
	faligndata	%f0,	%f4,	%f6
	andncc	%l2,	%o0,	%l5
	movn	%icc,	%o3,	%g2
	movrne	%o7,	%o2,	%g6
	popc	0x04D8,	%l3
	edge32l	%o4,	%l1,	%g5
	subccc	%i5,	%o1,	%l4
	fmovrsgz	%i3,	%f20,	%f20
	xorcc	%l0,	%o6,	%i2
	movg	%xcc,	%g7,	%g1
	sethi	0x1A75,	%g4
	stw	%i6,	[%l7 + 0x58]
	fornot2s	%f7,	%f26,	%f7
	ldd	[%l7 + 0x30],	%f30
	movg	%xcc,	%i4,	%g3
	stx	%i0,	[%l7 + 0x48]
	fmovrsgez	%i7,	%f13,	%f6
	udiv	%l6,	0x159D,	%i1
	move	%xcc,	%l2,	%o0
	sdivcc	%l5,	0x1F2A,	%o5
	mulscc	%g2,	%o3,	%o2
	movl	%xcc,	%o7,	%g6
	srl	%l3,	0x17,	%o4
	edge16n	%g5,	%l1,	%i5
	edge32l	%l4,	%o1,	%l0
	ldd	[%l7 + 0x08],	%f20
	smul	%o6,	0x0256,	%i2
	fcmpgt32	%f12,	%f8,	%g7
	movrlz	%g1,	%g4,	%i6
	smul	%i4,	%i3,	%g3
	movrgz	%i0,	%i7,	%i1
	array8	%l2,	%o0,	%l6
	fmovda	%xcc,	%f30,	%f4
	fmovsvs	%icc,	%f14,	%f20
	fmul8x16al	%f19,	%f29,	%f24
	movrne	%l5,	0x2ED,	%o5
	fmovrde	%o3,	%f10,	%f26
	ldd	[%l7 + 0x60],	%g2
	ldx	[%l7 + 0x50],	%o2
	subcc	%o7,	%l3,	%g6
	andncc	%g5,	%l1,	%o4
	udivcc	%l4,	0x1014,	%o1
	xorcc	%i5,	%l0,	%i2
	edge16ln	%g7,	%o6,	%g1
	xorcc	%g4,	0x0FF7,	%i6
	movn	%xcc,	%i3,	%g3
	sethi	0x0FCC,	%i4
	srax	%i0,	0x0E,	%i7
	srlx	%l2,	%o0,	%l6
	ldub	[%l7 + 0x4E],	%l5
	fnor	%f30,	%f0,	%f10
	andn	%i1,	%o3,	%o5
	edge8ln	%g2,	%o2,	%o7
	fmovdvs	%icc,	%f9,	%f11
	fmovsleu	%xcc,	%f4,	%f21
	fcmpgt32	%f14,	%f12,	%g6
	movrgz	%l3,	0x1F0,	%l1
	bshuffle	%f28,	%f6,	%f10
	udivcc	%o4,	0x0C94,	%g5
	lduw	[%l7 + 0x44],	%l4
	fsrc2	%f4,	%f26
	movn	%xcc,	%o1,	%l0
	add	%i2,	%g7,	%o6
	or	%i5,	0x1F32,	%g4
	edge8ln	%g1,	%i3,	%g3
	and	%i4,	%i0,	%i6
	movrlez	%i7,	%l2,	%l6
	addc	%l5,	0x0863,	%o0
	movrgez	%o3,	%o5,	%i1
	srl	%g2,	0x07,	%o2
	stw	%g6,	[%l7 + 0x30]
	ldd	[%l7 + 0x20],	%o6
	xorcc	%l1,	0x1705,	%l3
	fabsd	%f20,	%f10
	lduh	[%l7 + 0x10],	%o4
	srax	%l4,	0x06,	%g5
	sub	%o1,	%l0,	%g7
	fmovde	%icc,	%f10,	%f24
	srlx	%i2,	0x14,	%i5
	nop
	set	0x6C, %l2
	ldsh	[%l7 + %l2],	%g4
	movpos	%xcc,	%g1,	%o6
	save %i3, 0x0BD0, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x40],	%i0
	alignaddr	%g3,	%i7,	%l2
	subc	%i6,	%l5,	%l6
	sdivx	%o3,	0x0D3F,	%o5
	popc	0x0E6E,	%i1
	fmovdvs	%xcc,	%f28,	%f14
	ldsh	[%l7 + 0x20],	%o0
	umulcc	%g2,	%g6,	%o2
	addccc	%o7,	0x0715,	%l1
	umul	%o4,	0x1B45,	%l3
	udivx	%g5,	0x1C36,	%l4
	popc	%o1,	%l0
	movge	%xcc,	%g7,	%i5
	array16	%i2,	%g4,	%o6
	fmovsl	%xcc,	%f9,	%f11
	popc	%i3,	%i4
	umul	%g1,	0x0B21,	%g3
	edge16	%i7,	%i0,	%i6
	subcc	%l2,	0x0222,	%l6
	array32	%o3,	%o5,	%i1
	std	%f8,	[%l7 + 0x70]
	addcc	%l5,	%o0,	%g6
	umul	%g2,	0x0B15,	%o7
	fzero	%f26
	sir	0x1CBE
	fmovsl	%xcc,	%f11,	%f0
	fcmpgt32	%f12,	%f30,	%o2
	mova	%xcc,	%l1,	%o4
	fornot2s	%f20,	%f21,	%f30
	lduw	[%l7 + 0x30],	%l3
	sub	%l4,	%g5,	%l0
	movcc	%icc,	%g7,	%o1
	add	%i5,	%g4,	%i2
	umulcc	%i3,	%i4,	%g1
	fmovsa	%xcc,	%f4,	%f28
	subc	%g3,	0x0CE7,	%o6
	fsrc2	%f12,	%f0
	movrlz	%i0,	0x2D9,	%i7
	umul	%i6,	0x11AB,	%l2
	movre	%o3,	%o5,	%l6
	ldd	[%l7 + 0x60],	%f16
	movgu	%xcc,	%l5,	%o0
	edge16n	%g6,	%i1,	%g2
	fnot2	%f2,	%f22
	movn	%xcc,	%o2,	%o7
	movne	%xcc,	%l1,	%l3
	lduw	[%l7 + 0x3C],	%l4
	stx	%g5,	[%l7 + 0x40]
	std	%f14,	[%l7 + 0x60]
	sth	%l0,	[%l7 + 0x5C]
	movge	%xcc,	%o4,	%o1
	movvc	%xcc,	%i5,	%g4
	fcmpne16	%f0,	%f16,	%g7
	fmovdge	%xcc,	%f6,	%f17
	sdivx	%i2,	0x0C79,	%i4
	array16	%i3,	%g3,	%o6
	fpack32	%f28,	%f20,	%f20
	movre	%g1,	%i0,	%i6
	or	%l2,	0x1956,	%i7
	fnot1	%f10,	%f10
	sub	%o5,	0x0D0B,	%o3
	fnot1	%f30,	%f12
	fmovse	%icc,	%f22,	%f9
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%f12
	udivx	%l6,	0x043F,	%o0
	movrgez	%l5,	%i1,	%g2
	fmovs	%f19,	%f14
	movle	%icc,	%g6,	%o2
	fmul8sux16	%f4,	%f22,	%f16
	movcs	%icc,	%l1,	%o7
	st	%f29,	[%l7 + 0x30]
	udivx	%l3,	0x0764,	%g5
	edge8ln	%l4,	%o4,	%o1
	smul	%l0,	0x0EC1,	%g4
	andn	%i5,	%i2,	%i4
	fmovdcs	%xcc,	%f8,	%f2
	edge32	%i3,	%g7,	%o6
	andcc	%g3,	0x1FD1,	%i0
	udiv	%i6,	0x07DA,	%g1
	sub	%i7,	%l2,	%o5
	addcc	%l6,	0x1AF3,	%o3
	ldsh	[%l7 + 0x4E],	%l5
	edge16n	%o0,	%i1,	%g6
	move	%xcc,	%o2,	%l1
	edge32	%g2,	%l3,	%o7
	movcs	%xcc,	%l4,	%g5
	movge	%xcc,	%o4,	%o1
	mulx	%l0,	%i5,	%g4
	smul	%i2,	0x0900,	%i3
	orncc	%g7,	0x05AD,	%i4
	fmul8x16au	%f17,	%f0,	%f2
	ldx	[%l7 + 0x20],	%o6
	movrlez	%g3,	%i6,	%g1
	fmovdne	%xcc,	%f26,	%f13
	ldd	[%l7 + 0x40],	%i0
	fandnot2	%f12,	%f18,	%f6
	sub	%i7,	0x0DF8,	%l2
	edge16l	%o5,	%l6,	%l5
	movrlez	%o0,	0x240,	%i1
	fpadd16s	%f16,	%f23,	%f22
	fmovdn	%icc,	%f25,	%f20
	movrgez	%g6,	0x398,	%o2
	ldd	[%l7 + 0x10],	%f12
	stw	%o3,	[%l7 + 0x4C]
	edge16	%g2,	%l1,	%l3
	movg	%icc,	%o7,	%g5
	smulcc	%o4,	0x02DF,	%l4
	fnot1	%f2,	%f14
	ldx	[%l7 + 0x60],	%l0
	ldd	[%l7 + 0x60],	%i4
	movneg	%xcc,	%o1,	%i2
	mova	%xcc,	%i3,	%g4
	fzeros	%f12
	udivx	%g7,	0x1B22,	%o6
	nop
	set	0x40, %o0
	stx	%i4,	[%l7 + %o0]
	ld	[%l7 + 0x70],	%f6
	mulx	%g3,	0x12E8,	%g1
	edge16	%i6,	%i0,	%l2
	movrne	%i7,	0x126,	%o5
	ldx	[%l7 + 0x40],	%l5
	fmovsvc	%xcc,	%f27,	%f12
	fnot2	%f6,	%f12
	fmovrdlz	%o0,	%f22,	%f26
	fmovdl	%xcc,	%f13,	%f27
	ld	[%l7 + 0x4C],	%f5
	stw	%l6,	[%l7 + 0x50]
	fcmpeq16	%f18,	%f0,	%g6
	fmovrsne	%o2,	%f30,	%f7
	stx	%o3,	[%l7 + 0x60]
	sth	%g2,	[%l7 + 0x12]
	andcc	%l1,	0x1E72,	%i1
	orncc	%o7,	0x08EA,	%l3
	and	%g5,	%o4,	%l0
	edge16l	%i5,	%l4,	%o1
	movcs	%xcc,	%i2,	%i3
	movrlez	%g4,	0x2E4,	%o6
	lduh	[%l7 + 0x16],	%g7
	fmul8x16au	%f7,	%f14,	%f28
	fmovsneg	%xcc,	%f26,	%f7
	srl	%g3,	0x03,	%i4
	edge8ln	%i6,	%i0,	%l2
	fmovdge	%icc,	%f5,	%f2
	edge8l	%i7,	%g1,	%o5
	mova	%icc,	%o0,	%l5
	movrlez	%g6,	0x367,	%o2
	sir	0x13EF
	xnorcc	%o3,	0x0ECF,	%g2
	movcs	%icc,	%l6,	%l1
	alignaddrl	%o7,	%l3,	%i1
	xorcc	%g5,	%o4,	%i5
	srl	%l4,	%l0,	%i2
	move	%icc,	%i3,	%g4
	save %o1, %o6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f2,	%f2,	%f23
	sethi	0x1E95,	%g7
	fmovrdgez	%i4,	%f26,	%f2
	and	%i6,	0x0B53,	%i0
	stb	%i7,	[%l7 + 0x2D]
	smulcc	%g1,	0x1818,	%o5
	movgu	%icc,	%l2,	%o0
	stb	%g6,	[%l7 + 0x2D]
	move	%xcc,	%o2,	%l5
	srl	%o3,	%l6,	%l1
	restore %g2, 0x1913, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o7,	%g5
	st	%f12,	[%l7 + 0x58]
	ldsb	[%l7 + 0x72],	%o4
	fmovsne	%xcc,	%f11,	%f17
	fmovrse	%i5,	%f25,	%f11
	xnorcc	%l4,	%i1,	%i2
	ldsh	[%l7 + 0x26],	%i3
	fpack16	%f8,	%f9
	andn	%l0,	%g4,	%o6
	fmovsne	%xcc,	%f22,	%f17
	ldsh	[%l7 + 0x54],	%o1
	mulscc	%g3,	0x1E0A,	%i4
	sdivx	%g7,	0x0DC7,	%i0
	sdivcc	%i7,	0x1BDF,	%g1
	sdiv	%o5,	0x0240,	%l2
	fmovd	%f24,	%f16
	sethi	0x0754,	%i6
	stb	%g6,	[%l7 + 0x7D]
	xorcc	%o2,	0x118C,	%l5
	fone	%f22
	ldd	[%l7 + 0x20],	%o2
	movle	%icc,	%l6,	%o0
	subc	%g2,	0x0459,	%l1
	fmovs	%f19,	%f15
	mulscc	%l3,	%o7,	%g5
	fmul8x16al	%f30,	%f15,	%f20
	udivcc	%i5,	0x0A0A,	%o4
	siam	0x4
	add	%i1,	%l4,	%i2
	addc	%l0,	%g4,	%i3
	movrlez	%o1,	0x024,	%o6
	movneg	%icc,	%i4,	%g3
	movl	%xcc,	%g7,	%i7
	ldsb	[%l7 + 0x19],	%g1
	movrlz	%o5,	0x08A,	%l2
	edge16n	%i6,	%g6,	%o2
	fcmple16	%f10,	%f16,	%i0
	fpackfix	%f20,	%f12
	fors	%f7,	%f28,	%f10
	udivcc	%l5,	0x1619,	%l6
	movl	%xcc,	%o0,	%g2
	addccc	%l1,	%o3,	%l3
	fand	%f8,	%f2,	%f20
	fexpand	%f26,	%f18
	alignaddrl	%o7,	%i5,	%o4
	sth	%i1,	[%l7 + 0x5E]
	fmovscc	%icc,	%f7,	%f18
	fnot1s	%f0,	%f4
	ldx	[%l7 + 0x28],	%g5
	edge8	%i2,	%l4,	%l0
	movne	%icc,	%i3,	%g4
	srlx	%o1,	0x07,	%i4
	edge16l	%o6,	%g3,	%i7
	fnors	%f5,	%f10,	%f18
	popc	%g1,	%o5
	fpadd32s	%f16,	%f26,	%f19
	fmovsleu	%icc,	%f23,	%f13
	movl	%icc,	%l2,	%i6
	stx	%g7,	[%l7 + 0x70]
	edge32n	%g6,	%o2,	%i0
	ld	[%l7 + 0x18],	%f24
	sth	%l6,	[%l7 + 0x2A]
	or	%l5,	0x0FEC,	%g2
	fmovdvc	%icc,	%f25,	%f27
	alignaddr	%l1,	%o3,	%o0
	fmul8sux16	%f26,	%f2,	%f0
	andn	%o7,	%l3,	%i5
	fmovse	%xcc,	%f25,	%f28
	edge32l	%o4,	%g5,	%i1
	mulx	%l4,	%i2,	%l0
	fmovrdgez	%g4,	%f22,	%f12
	std	%f28,	[%l7 + 0x78]
	fmovspos	%icc,	%f11,	%f10
	sethi	0x0CB6,	%o1
	movpos	%icc,	%i4,	%o6
	and	%g3,	%i3,	%g1
	movpos	%xcc,	%o5,	%i7
	mulx	%i6,	%g7,	%g6
	sll	%l2,	0x04,	%o2
	edge16n	%i0,	%l5,	%l6
	edge16	%l1,	%o3,	%g2
	popc	0x0DE9,	%o7
	edge32n	%l3,	%o0,	%o4
	nop
	set	0x1E, %g7
	ldsh	[%l7 + %g7],	%i5
	edge32	%g5,	%i1,	%i2
	nop
	set	0x26, %o2
	lduh	[%l7 + %o2],	%l4
	addcc	%l0,	0x14F4,	%o1
	fxors	%f7,	%f23,	%f25
	array16	%i4,	%g4,	%g3
	ldd	[%l7 + 0x10],	%f12
	fcmpne32	%f30,	%f18,	%o6
	sll	%g1,	0x14,	%i3
	subcc	%i7,	0x0E24,	%o5
	stb	%i6,	[%l7 + 0x53]
	array8	%g7,	%g6,	%o2
	movge	%icc,	%i0,	%l2
	sdivx	%l6,	0x02C6,	%l5
	orncc	%l1,	0x0DE4,	%o3
	addccc	%o7,	%g2,	%l3
	fmovsg	%xcc,	%f0,	%f27
	movleu	%xcc,	%o4,	%i5
	ldd	[%l7 + 0x78],	%f10
	sdiv	%o0,	0x0F17,	%g5
	movleu	%icc,	%i2,	%l4
	edge16l	%l0,	%o1,	%i1
	edge32ln	%g4,	%i4,	%g3
	orncc	%o6,	0x18ED,	%i3
	ld	[%l7 + 0x30],	%f26
	movpos	%xcc,	%g1,	%i7
	array8	%o5,	%g7,	%i6
	fmovdcs	%icc,	%f11,	%f17
	sethi	0x0CC7,	%g6
	edge32ln	%o2,	%i0,	%l2
	sir	0x04EE
	ldsw	[%l7 + 0x54],	%l6
	smul	%l1,	0x14EF,	%l5
	orn	%o7,	0x073F,	%o3
	pdist	%f0,	%f10,	%f12
	xorcc	%g2,	0x0871,	%o4
	movl	%xcc,	%l3,	%o0
	udivx	%i5,	0x15B9,	%g5
	move	%icc,	%l4,	%l0
	udivcc	%i2,	0x00C5,	%i1
	movgu	%xcc,	%g4,	%i4
	alignaddrl	%o1,	%g3,	%o6
	mova	%xcc,	%g1,	%i7
	movre	%i3,	0x164,	%g7
	movneg	%icc,	%o5,	%i6
	ldsw	[%l7 + 0x08],	%g6
	umulcc	%i0,	%l2,	%o2
	nop
	set	0x38, %i5
	stx	%l1,	[%l7 + %i5]
	fmovdn	%xcc,	%f7,	%f1
	andncc	%l5,	%l6,	%o7
	srl	%g2,	0x13,	%o4
	srl	%l3,	%o3,	%i5
	movrgez	%g5,	0x09B,	%o0
	ldd	[%l7 + 0x20],	%f10
	mulx	%l4,	0x1233,	%l0
	array16	%i2,	%i1,	%i4
	orncc	%o1,	%g3,	%o6
	fxnor	%f2,	%f28,	%f26
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	movne	%xcc,	%g7,	%o5
	mova	%xcc,	%i6,	%g6
	lduh	[%l7 + 0x1A],	%i0
	save %i7, %l2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%xcc,	%f5,	%f25
	edge16ln	%o2,	%l5,	%o7
	srax	%g2,	%l6,	%o4
	ld	[%l7 + 0x48],	%f21
	ldd	[%l7 + 0x78],	%f16
	array32	%o3,	%l3,	%g5
	pdist	%f28,	%f16,	%f16
	ldd	[%l7 + 0x58],	%f26
	fnot1	%f30,	%f10
	orncc	%o0,	0x0F48,	%i5
	sra	%l4,	%i2,	%l0
	sub	%i1,	0x1D5A,	%o1
	ldx	[%l7 + 0x60],	%i4
	fmovsleu	%icc,	%f20,	%f6
	addcc	%o6,	0x1FA9,	%g3
	edge16l	%g4,	%g1,	%g7
	ldsh	[%l7 + 0x2E],	%o5
	fnands	%f20,	%f15,	%f23
	movneg	%icc,	%i3,	%g6
	movrlz	%i6,	%i0,	%i7
	std	%f2,	[%l7 + 0x08]
	movleu	%icc,	%l1,	%o2
	addccc	%l2,	%o7,	%l5
	movn	%xcc,	%g2,	%l6
	sethi	0x1963,	%o3
	fnot2	%f16,	%f12
	nop
	set	0x18, %i1
	stx	%l3,	[%l7 + %i1]
	udiv	%g5,	0x0907,	%o4
	lduh	[%l7 + 0x50],	%i5
	fmovdle	%xcc,	%f16,	%f16
	addccc	%l4,	%i2,	%o0
	ldsh	[%l7 + 0x2C],	%l0
	addcc	%i1,	0x1495,	%o1
	srax	%i4,	%o6,	%g3
	fsrc1s	%f20,	%f17
	fmovdpos	%xcc,	%f23,	%f5
	sethi	0x1EA7,	%g4
	orncc	%g1,	%o5,	%g7
	nop
	set	0x20, %o3
	stx	%g6,	[%l7 + %o3]
	udivx	%i3,	0x0DD9,	%i0
	movrne	%i7,	0x120,	%l1
	edge32l	%i6,	%l2,	%o7
	movge	%icc,	%l5,	%o2
	sir	0x1E3D
	edge32n	%g2,	%o3,	%l6
	alignaddrl	%g5,	%l3,	%o4
	edge32	%i5,	%l4,	%i2
	fmovsn	%xcc,	%f10,	%f26
	nop
	set	0x58, %g1
	stx	%o0,	[%l7 + %g1]
	addcc	%i1,	0x15B8,	%l0
	edge8n	%i4,	%o6,	%o1
	movvs	%icc,	%g4,	%g1
	xnorcc	%o5,	%g7,	%g6
	fmovdvc	%icc,	%f2,	%f26
	fmovdle	%icc,	%f31,	%f25
	and	%i3,	0x151C,	%i0
	movrlez	%g3,	0x055,	%l1
	movcs	%icc,	%i6,	%i7
	addc	%l2,	0x113E,	%o7
	sethi	0x1121,	%l5
	edge32l	%o2,	%o3,	%l6
	movrlz	%g5,	0x25F,	%l3
	subc	%g2,	0x0952,	%o4
	restore %l4, %i2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i1,	%l0,	%i4
	xor	%o6,	%o1,	%o0
	xor	%g4,	%o5,	%g1
	umul	%g6,	%i3,	%i0
	sll	%g3,	%g7,	%i6
	orncc	%l1,	0x157C,	%i7
	xorcc	%l2,	%l5,	%o2
	movn	%icc,	%o3,	%l6
	movvs	%icc,	%g5,	%o7
	xnor	%g2,	%l3,	%l4
	fnot2	%f28,	%f2
	fpadd16s	%f15,	%f30,	%f8
	std	%f6,	[%l7 + 0x28]
	movre	%o4,	0x283,	%i2
	mulx	%i1,	%l0,	%i4
	fnor	%f2,	%f10,	%f10
	mulx	%i5,	0x087B,	%o1
	movcc	%xcc,	%o6,	%o0
	fnot1	%f0,	%f12
	edge8ln	%g4,	%o5,	%g1
	orncc	%g6,	%i0,	%g3
	andcc	%g7,	0x0A79,	%i3
	ldd	[%l7 + 0x50],	%i6
	std	%f8,	[%l7 + 0x18]
	ldsb	[%l7 + 0x20],	%l1
	edge16n	%i7,	%l5,	%o2
	movcs	%icc,	%o3,	%l2
	movne	%xcc,	%g5,	%o7
	fmovdvs	%icc,	%f9,	%f21
	movne	%icc,	%g2,	%l3
	fxors	%f20,	%f24,	%f28
	lduw	[%l7 + 0x0C],	%l6
	movcc	%icc,	%l4,	%o4
	movg	%icc,	%i1,	%l0
	movcs	%xcc,	%i2,	%i4
	subcc	%o1,	%i5,	%o0
	array32	%g4,	%o6,	%g1
	fornot1	%f4,	%f12,	%f24
	udivx	%o5,	0x1130,	%g6
	movvs	%xcc,	%i0,	%g3
	sllx	%i3,	0x0C,	%g7
	sllx	%i6,	0x00,	%l1
	fmovrdlez	%l5,	%f6,	%f22
	stb	%i7,	[%l7 + 0x3A]
	umulcc	%o2,	0x0657,	%o3
	edge16ln	%g5,	%o7,	%g2
	movrlz	%l2,	%l3,	%l4
	movn	%icc,	%l6,	%i1
	umulcc	%l0,	0x00F9,	%i2
	movle	%icc,	%o4,	%i4
	lduw	[%l7 + 0x30],	%i5
	fmovsg	%icc,	%f2,	%f26
	edge32	%o0,	%o1,	%o6
	pdist	%f4,	%f6,	%f2
	smulcc	%g4,	%o5,	%g1
	stb	%g6,	[%l7 + 0x15]
	srl	%g3,	0x0B,	%i3
	add	%g7,	%i0,	%l1
	movne	%icc,	%i6,	%i7
	srax	%l5,	0x07,	%o3
	fnand	%f24,	%f0,	%f14
	movn	%icc,	%o2,	%o7
	std	%f24,	[%l7 + 0x58]
	array8	%g2,	%l2,	%l3
	fsrc1	%f6,	%f12
	sll	%g5,	%l6,	%l4
	addc	%i1,	0x08B2,	%i2
	movvs	%icc,	%l0,	%o4
	movg	%xcc,	%i5,	%i4
	udivcc	%o0,	0x0F25,	%o1
	fnegd	%f20,	%f0
	std	%f20,	[%l7 + 0x78]
	ldx	[%l7 + 0x50],	%g4
	movge	%xcc,	%o6,	%g1
	sll	%g6,	0x17,	%o5
	orn	%g3,	0x14F3,	%i3
	fnors	%f29,	%f25,	%f12
	addcc	%i0,	%l1,	%g7
	sth	%i6,	[%l7 + 0x4C]
	ldsh	[%l7 + 0x76],	%l5
	ldub	[%l7 + 0x26],	%i7
	ldx	[%l7 + 0x38],	%o2
	fcmpd	%fcc3,	%f16,	%f2
	fnegd	%f18,	%f14
	st	%f6,	[%l7 + 0x3C]
	fmovrdlz	%o7,	%f12,	%f2
	movleu	%xcc,	%o3,	%l2
	orn	%g2,	%g5,	%l3
	sdivcc	%l4,	0x01A5,	%l6
	bshuffle	%f24,	%f14,	%f6
	fmovsle	%icc,	%f25,	%f8
	edge8ln	%i2,	%i1,	%l0
	movne	%icc,	%i5,	%o4
	fmovsge	%xcc,	%f4,	%f3
	fexpand	%f2,	%f14
	xnorcc	%i4,	0x1FBB,	%o1
	fmul8x16	%f30,	%f30,	%f18
	srlx	%g4,	%o0,	%g1
	nop
	set	0x44, %i7
	stw	%g6,	[%l7 + %i7]
	orncc	%o5,	0x0CAC,	%o6
	movpos	%icc,	%g3,	%i0
	movleu	%xcc,	%i3,	%l1
	edge32ln	%i6,	%g7,	%l5
	alignaddrl	%o2,	%o7,	%o3
	movn	%icc,	%l2,	%i7
	udivcc	%g2,	0x0221,	%l3
	ldub	[%l7 + 0x69],	%l4
	addccc	%g5,	0x1169,	%i2
	smulcc	%i1,	0x079E,	%l0
	movrgz	%l6,	0x161,	%i5
	sdivx	%i4,	0x12AD,	%o4
	subc	%g4,	0x134A,	%o0
	andcc	%g1,	0x0BF8,	%g6
	movne	%xcc,	%o5,	%o1
	edge32l	%g3,	%o6,	%i0
	movrgz	%i3,	%l1,	%g7
	subccc	%l5,	0x18F1,	%i6
	fmovspos	%icc,	%f29,	%f28
	movn	%icc,	%o7,	%o2
	edge32l	%l2,	%o3,	%g2
	sth	%l3,	[%l7 + 0x2C]
	srax	%l4,	0x03,	%i7
	move	%xcc,	%g5,	%i1
	edge16ln	%l0,	%l6,	%i2
	edge16n	%i4,	%i5,	%o4
	ld	[%l7 + 0x48],	%f24
	fmuld8sux16	%f29,	%f27,	%f24
	edge32ln	%o0,	%g1,	%g4
	sdiv	%g6,	0x094C,	%o5
	fmovdl	%icc,	%f0,	%f5
	fone	%f22
	fmovdg	%icc,	%f23,	%f20
	fxors	%f12,	%f29,	%f17
	ldx	[%l7 + 0x20],	%g3
	ldx	[%l7 + 0x08],	%o1
	mulx	%o6,	%i3,	%i0
	xnor	%g7,	%l5,	%i6
	edge16ln	%o7,	%o2,	%l1
	fmovsg	%icc,	%f20,	%f16
	movvs	%xcc,	%o3,	%l2
	sdivx	%l3,	0x0012,	%l4
	srlx	%g2,	%g5,	%i1
	movgu	%icc,	%i7,	%l6
	array8	%l0,	%i4,	%i2
	orcc	%i5,	0x03E6,	%o4
	and	%g1,	%g4,	%o0
	movrgez	%o5,	%g6,	%g3
	movneg	%xcc,	%o6,	%i3
	movvs	%icc,	%o1,	%i0
	fnegs	%f1,	%f15
	subcc	%g7,	0x14D3,	%i6
	edge16n	%o7,	%l5,	%o2
	fmovscs	%icc,	%f14,	%f21
	sdiv	%l1,	0x0460,	%l2
	fpadd32	%f4,	%f28,	%f6
	andncc	%o3,	%l3,	%l4
	fcmpeq32	%f18,	%f20,	%g5
	popc	%g2,	%i7
	nop
	set	0x30, %g3
	stx	%l6,	[%l7 + %g3]
	movvc	%icc,	%i1,	%l0
	faligndata	%f20,	%f30,	%f4
	subccc	%i2,	0x11D2,	%i5
	fpack16	%f22,	%f26
	ldsw	[%l7 + 0x0C],	%o4
	sra	%i4,	0x03,	%g1
	edge32ln	%o0,	%o5,	%g6
	fornot2	%f18,	%f4,	%f2
	srlx	%g4,	%o6,	%i3
	movrne	%o1,	%g3,	%i0
	edge16l	%i6,	%g7,	%l5
	movg	%xcc,	%o7,	%l1
	sllx	%o2,	0x1E,	%l2
	smulcc	%l3,	%l4,	%g5
	sllx	%o3,	%g2,	%l6
	movvc	%icc,	%i7,	%l0
	save %i2, %i5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i1,	%g1
	sir	0x05F0
	xnorcc	%i4,	%o0,	%g6
	stb	%g4,	[%l7 + 0x43]
	ldsh	[%l7 + 0x16],	%o5
	fmul8sux16	%f8,	%f26,	%f4
	sllx	%o6,	0x11,	%i3
	andn	%g3,	%o1,	%i6
	movgu	%icc,	%g7,	%l5
	sllx	%o7,	0x00,	%l1
	subc	%i0,	0x149F,	%l2
	fmovsa	%icc,	%f9,	%f24
	movle	%xcc,	%o2,	%l4
	lduh	[%l7 + 0x22],	%g5
	edge32ln	%l3,	%o3,	%l6
	movvs	%xcc,	%g2,	%l0
	fnot1	%f10,	%f4
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	array32	%i7,	%g1,	%i4
	save %o0, %g6, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x4C],	%o5
	popc	0x1B3F,	%g4
	save %i3, %o6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%i6,	%g7
	subccc	%l5,	0x0566,	%o7
	edge32l	%l1,	%g3,	%i0
	sra	%l2,	%o2,	%g5
	movcs	%icc,	%l3,	%o3
	movneg	%xcc,	%l4,	%l6
	fcmpeq32	%f22,	%f26,	%l0
	fmovsvs	%xcc,	%f3,	%f24
	fnegd	%f24,	%f22
	subccc	%g2,	0x0E37,	%i2
	fmovsleu	%icc,	%f2,	%f27
	fmovsneg	%xcc,	%f9,	%f24
	fnor	%f8,	%f16,	%f30
	nop
	set	0x0A, %i3
	ldub	[%l7 + %i3],	%i5
	alignaddr	%o4,	%g1,	%i4
	stb	%o0,	[%l7 + 0x42]
	alignaddrl	%g6,	%i1,	%o5
	std	%f6,	[%l7 + 0x78]
	stw	%i7,	[%l7 + 0x3C]
	movg	%icc,	%g4,	%i3
	sll	%o6,	0x16,	%o1
	movrgez	%i6,	%l5,	%g7
	umulcc	%l1,	%g3,	%i0
	fmovdleu	%xcc,	%f30,	%f25
	movrgez	%o7,	%o2,	%g5
	nop
	set	0x10, %o6
	ldsw	[%l7 + %o6],	%l2
	edge16l	%l3,	%o3,	%l6
	or	%l4,	%g2,	%l0
	lduw	[%l7 + 0x0C],	%i5
	fmovdcc	%icc,	%f18,	%f30
	srlx	%i2,	%g1,	%i4
	stw	%o0,	[%l7 + 0x2C]
	movcs	%xcc,	%o4,	%i1
	edge16l	%o5,	%i7,	%g4
	fzeros	%f6
	movrlz	%g6,	%i3,	%o1
	fmovsgu	%icc,	%f12,	%f12
	fsrc1s	%f25,	%f22
	addccc	%i6,	0x046E,	%l5
	fmovsvc	%icc,	%f14,	%f14
	st	%f30,	[%l7 + 0x78]
	movl	%icc,	%o6,	%g7
	addccc	%l1,	0x05AA,	%g3
	ldx	[%l7 + 0x28],	%i0
	fandnot2	%f30,	%f26,	%f18
	addc	%o7,	%g5,	%o2
	movrlez	%l3,	%l2,	%o3
	fmovdgu	%icc,	%f1,	%f11
	movrlez	%l4,	0x17E,	%l6
	xnor	%l0,	%g2,	%i2
	restore %i5, %i4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f20,	[%l7 + 0x28]
	edge32n	%g1,	%o4,	%o5
	movre	%i1,	%g4,	%i7
	addc	%g6,	0x04C3,	%o1
	sdivx	%i6,	0x127E,	%i3
	stw	%o6,	[%l7 + 0x3C]
	movre	%l5,	%l1,	%g3
	sdiv	%i0,	0x02C8,	%o7
	fmovscs	%xcc,	%f24,	%f24
	fmuld8sux16	%f19,	%f24,	%f22
	fors	%f8,	%f31,	%f0
	movcc	%xcc,	%g5,	%o2
	array32	%g7,	%l2,	%l3
	umul	%l4,	0x0F1B,	%o3
	fmovdle	%icc,	%f28,	%f12
	sllx	%l6,	0x1C,	%l0
	xnorcc	%g2,	0x064A,	%i5
	movge	%icc,	%i2,	%o0
	movne	%xcc,	%i4,	%o4
	smul	%o5,	0x1428,	%g1
	movn	%xcc,	%g4,	%i1
	edge32	%g6,	%o1,	%i6
	st	%f1,	[%l7 + 0x68]
	movne	%icc,	%i3,	%i7
	xnorcc	%l5,	0x138C,	%l1
	fpackfix	%f18,	%f18
	edge16l	%o6,	%g3,	%o7
	sth	%g5,	[%l7 + 0x6E]
	movrgz	%o2,	%g7,	%i0
	subccc	%l2,	0x1C7C,	%l4
	edge16n	%l3,	%l6,	%l0
	fmovrdgez	%o3,	%f20,	%f26
	fpadd32s	%f27,	%f28,	%f20
	ldsw	[%l7 + 0x54],	%g2
	fmovrdgez	%i2,	%f30,	%f26
	fzero	%f22
	movrne	%i5,	%o0,	%i4
	move	%xcc,	%o5,	%o4
	movle	%xcc,	%g4,	%g1
	edge16l	%i1,	%g6,	%o1
	nop
	set	0x48, %l1
	stx	%i6,	[%l7 + %l1]
	fcmpd	%fcc1,	%f30,	%f20
	xnorcc	%i3,	0x158F,	%i7
	edge32n	%l5,	%o6,	%g3
	sdivcc	%o7,	0x1B82,	%g5
	fmovse	%icc,	%f10,	%f5
	fandnot2	%f0,	%f0,	%f4
	sll	%o2,	0x16,	%g7
	popc	0x0DE1,	%i0
	sll	%l1,	0x08,	%l4
	srlx	%l2,	0x0C,	%l6
	movrgez	%l3,	%o3,	%l0
	ldsh	[%l7 + 0x6A],	%g2
	subc	%i5,	%o0,	%i4
	fmovrdgez	%i2,	%f28,	%f26
	edge32l	%o4,	%o5,	%g4
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	edge16	%i6,	%i3,	%g1
	sdiv	%i7,	0x0D1B,	%o6
	fmovrsgez	%l5,	%f31,	%f22
	fxnors	%f20,	%f29,	%f8
	fornot1	%f10,	%f16,	%f20
	xorcc	%o7,	%g5,	%o2
	ldsw	[%l7 + 0x30],	%g7
	movcc	%xcc,	%i0,	%l1
	nop
	set	0x58, %o4
	ldx	[%l7 + %o4],	%l4
	edge8l	%l2,	%g3,	%l3
	addcc	%o3,	%l6,	%l0
	orcc	%i5,	0x04FA,	%g2
	xnor	%o0,	0x1C0D,	%i4
	edge16n	%o4,	%i2,	%o5
	movrgez	%g4,	%i1,	%g6
	ldub	[%l7 + 0x20],	%i6
	fmuld8ulx16	%f23,	%f24,	%f30
	sir	0x0B83
	and	%o1,	%i3,	%g1
	movneg	%xcc,	%i7,	%l5
	edge16ln	%o6,	%g5,	%o2
	addc	%g7,	0x0760,	%i0
	orcc	%l1,	0x0372,	%o7
	movgu	%icc,	%l4,	%l2
	edge16l	%g3,	%o3,	%l3
	movre	%l0,	0x2D0,	%i5
	for	%f0,	%f18,	%f16
	srax	%g2,	%l6,	%i4
	ldsw	[%l7 + 0x40],	%o0
	ldd	[%l7 + 0x70],	%o4
	ldsb	[%l7 + 0x74],	%o5
	edge8l	%i2,	%g4,	%i1
	array16	%g6,	%i6,	%i3
	edge8	%g1,	%i7,	%o1
	fornot1	%f8,	%f26,	%f30
	sra	%l5,	0x18,	%g5
	fmovsneg	%xcc,	%f24,	%f13
	movne	%xcc,	%o6,	%g7
	ld	[%l7 + 0x1C],	%f31
	array32	%o2,	%i0,	%o7
	fmovdle	%icc,	%f16,	%f28
	sdivx	%l1,	0x1D8D,	%l2
	movgu	%icc,	%l4,	%o3
	fornot1	%f2,	%f22,	%f6
	and	%g3,	%l3,	%l0
	fnand	%f22,	%f24,	%f12
	movrlz	%i5,	%g2,	%i4
	fmul8sux16	%f16,	%f2,	%f10
	alignaddrl	%l6,	%o4,	%o5
	fsrc2s	%f2,	%f15
	edge8l	%i2,	%g4,	%o0
	fmovsne	%xcc,	%f1,	%f11
	movne	%xcc,	%g6,	%i1
	xnor	%i6,	%g1,	%i3
	sra	%o1,	0x1C,	%l5
	smulcc	%g5,	%o6,	%i7
	fmovrdlz	%g7,	%f0,	%f26
	stx	%o2,	[%l7 + 0x70]
	edge16	%i0,	%o7,	%l2
	edge8n	%l4,	%l1,	%o3
	srl	%l3,	0x0C,	%g3
	andncc	%l0,	%i5,	%g2
	sdivx	%l6,	0x164E,	%o4
	for	%f8,	%f0,	%f16
	ldsw	[%l7 + 0x0C],	%o5
	udivcc	%i4,	0x014D,	%g4
	fnot2	%f22,	%f2
	fmovdl	%xcc,	%f21,	%f2
	orncc	%o0,	0x02F7,	%g6
	movrgz	%i1,	%i2,	%i6
	stx	%i3,	[%l7 + 0x60]
	srl	%g1,	%o1,	%g5
	fpadd16s	%f10,	%f27,	%f27
	fands	%f18,	%f12,	%f29
	fmovrdgz	%l5,	%f20,	%f12
	ld	[%l7 + 0x40],	%f2
	movcc	%icc,	%o6,	%i7
	movne	%xcc,	%g7,	%i0
	orcc	%o7,	%l2,	%o2
	orn	%l4,	0x06AD,	%o3
	edge8ln	%l1,	%g3,	%l0
	fpadd32s	%f8,	%f1,	%f28
	movvc	%xcc,	%i5,	%l3
	ld	[%l7 + 0x34],	%f11
	xnor	%g2,	0x0D7D,	%o4
	addcc	%l6,	%i4,	%o5
	umulcc	%o0,	0x0084,	%g6
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%g4
	orcc	%i2,	0x1E87,	%i6
	array8	%i1,	%i3,	%g1
	stw	%g5,	[%l7 + 0x10]
	andn	%l5,	0x06F0,	%o6
	fands	%f16,	%f15,	%f5
	sdiv	%o1,	0x0A66,	%i7
	edge8	%i0,	%g7,	%o7
	sub	%l2,	0x16CA,	%o2
	sllx	%l4,	%l1,	%o3
	orcc	%g3,	0x0055,	%i5
	subc	%l0,	0x07E1,	%l3
	movrlez	%o4,	0x2B7,	%g2
	orn	%i4,	%l6,	%o0
	fnor	%f4,	%f10,	%f0
	fmul8ulx16	%f30,	%f16,	%f16
	movrlez	%o5,	0x091,	%g4
	smulcc	%i2,	0x1D14,	%g6
	movrgz	%i1,	0x039,	%i6
	fzeros	%f26
	stw	%g1,	[%l7 + 0x40]
	mulx	%i3,	%g5,	%o6
	nop
	set	0x28, %i4
	std	%f22,	[%l7 + %i4]
	mova	%icc,	%l5,	%o1
	stw	%i0,	[%l7 + 0x28]
	fmovrslez	%g7,	%f1,	%f12
	smulcc	%i7,	%o7,	%l2
	fxnors	%f27,	%f15,	%f11
	fmovdvs	%icc,	%f27,	%f7
	fnors	%f11,	%f20,	%f21
	movle	%xcc,	%l4,	%l1
	andncc	%o2,	%g3,	%o3
	xorcc	%l0,	0x072A,	%i5
	edge32ln	%l3,	%g2,	%o4
	mulscc	%l6,	%o0,	%o5
	save %g4, 0x02A5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%i2,	%g6
	srax	%i1,	%g1,	%i6
	smulcc	%g5,	%i3,	%o6
	smulcc	%o1,	0x1FC0,	%l5
	srl	%i0,	0x04,	%i7
	alignaddrl	%g7,	%l2,	%l4
	array8	%l1,	%o2,	%o7
	xorcc	%o3,	%g3,	%i5
	movleu	%icc,	%l0,	%g2
	movg	%icc,	%o4,	%l6
	orn	%o0,	0x15F9,	%o5
	movn	%xcc,	%l3,	%i4
	restore %g4, %g6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%g1,	[%l7 + 0x38]
	or	%i1,	0x1E56,	%g5
	movge	%icc,	%i3,	%i6
	andncc	%o1,	%l5,	%o6
	andncc	%i0,	%g7,	%i7
	movvc	%xcc,	%l2,	%l1
	movrne	%l4,	%o2,	%o7
	srl	%o3,	0x01,	%i5
	add	%l0,	%g3,	%o4
	fxnor	%f0,	%f0,	%f12
	fpsub16s	%f29,	%f10,	%f17
	array8	%l6,	%o0,	%g2
	add	%o5,	0x0674,	%l3
	edge8	%g4,	%i4,	%i2
	alignaddr	%g6,	%i1,	%g1
	movrgz	%i3,	%i6,	%g5
	ldsw	[%l7 + 0x14],	%o1
	movrlez	%o6,	0x202,	%l5
	popc	0x1A44,	%g7
	edge8ln	%i0,	%i7,	%l1
	addcc	%l4,	0x0071,	%o2
	fmul8x16	%f2,	%f4,	%f24
	ldsb	[%l7 + 0x2E],	%l2
	and	%o7,	0x0356,	%i5
	andn	%o3,	0x16FD,	%l0
	edge16n	%g3,	%l6,	%o4
	orcc	%o0,	%o5,	%l3
	fmovsvs	%xcc,	%f15,	%f16
	udivx	%g2,	0x006D,	%i4
	fmuld8sux16	%f10,	%f4,	%f22
	movvc	%xcc,	%i2,	%g6
	orcc	%g4,	%g1,	%i3
	fmul8x16al	%f30,	%f21,	%f22
	sdivcc	%i1,	0x0401,	%g5
	addccc	%o1,	0x01F0,	%i6
	fsrc2s	%f10,	%f31
	stx	%l5,	[%l7 + 0x40]
	edge32l	%o6,	%g7,	%i0
	edge8n	%i7,	%l1,	%l4
	ldsh	[%l7 + 0x7A],	%o2
	array8	%o7,	%i5,	%l2
	movn	%icc,	%l0,	%g3
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%f8
	fmuld8ulx16	%f19,	%f18,	%f12
	save %o3, %o4, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%o0,	%l3
	xnorcc	%g2,	0x0F81,	%o5
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	fmovsg	%icc,	%f10,	%f31
	mova	%icc,	%i2,	%g4
	fabsd	%f14,	%f4
	fmovrsne	%g1,	%f10,	%f17
	umulcc	%i1,	0x0410,	%g5
	mova	%xcc,	%i3,	%o1
	movcs	%icc,	%l5,	%o6
	movne	%icc,	%i6,	%i0
	stx	%g7,	[%l7 + 0x68]
	nop
	set	0x7C, %o1
	lduw	[%l7 + %o1],	%i7
	subccc	%l4,	0x1AB8,	%o2
	andn	%l1,	0x1B8F,	%o7
	sll	%l2,	0x06,	%l0
	edge16	%i5,	%o3,	%o4
	srax	%g3,	%o0,	%l3
	alignaddrl	%g2,	%l6,	%i4
	fmovsg	%xcc,	%f15,	%f27
	add	%g6,	%i2,	%o5
	udiv	%g1,	0x14AA,	%i1
	fandnot2s	%f31,	%f22,	%f4
	movge	%xcc,	%g4,	%i3
	movrlz	%o1,	%l5,	%o6
	sethi	0x04F5,	%i6
	sth	%g5,	[%l7 + 0x66]
	edge16l	%g7,	%i0,	%l4
	ldx	[%l7 + 0x60],	%i7
	fmovsa	%xcc,	%f16,	%f0
	movvs	%icc,	%o2,	%o7
	smul	%l2,	0x1270,	%l1
	lduh	[%l7 + 0x7C],	%l0
	andn	%o3,	%i5,	%o4
	ldsb	[%l7 + 0x22],	%g3
	subc	%o0,	0x1E99,	%l3
	fmovrsgz	%g2,	%f28,	%f27
	sll	%i4,	%l6,	%i2
	udivx	%g6,	0x100C,	%o5
	fmovd	%f22,	%f6
	stw	%i1,	[%l7 + 0x68]
	umulcc	%g4,	0x0840,	%i3
	edge32l	%o1,	%l5,	%o6
	array32	%i6,	%g5,	%g1
	ldub	[%l7 + 0x71],	%g7
	fmovsgu	%icc,	%f4,	%f5
	stx	%i0,	[%l7 + 0x30]
	edge32	%l4,	%o2,	%i7
	sub	%o7,	%l1,	%l2
	movn	%icc,	%l0,	%i5
	orn	%o4,	0x1AD9,	%g3
	edge32ln	%o3,	%o0,	%l3
	ldx	[%l7 + 0x78],	%i4
	edge8n	%l6,	%g2,	%i2
	movvs	%xcc,	%o5,	%i1
	move	%xcc,	%g4,	%i3
	and	%o1,	%g6,	%l5
	subc	%i6,	%o6,	%g1
	move	%xcc,	%g7,	%g5
	array16	%i0,	%l4,	%i7
	movvs	%icc,	%o2,	%o7
	fnegs	%f23,	%f26
	mulscc	%l1,	%l0,	%i5
	movvc	%xcc,	%o4,	%g3
	addc	%o3,	0x02BF,	%l2
	fmovrde	%l3,	%f10,	%f28
	fcmple32	%f20,	%f18,	%o0
	smul	%l6,	0x0A26,	%i4
	fmovsneg	%xcc,	%f25,	%f10
	movcs	%icc,	%g2,	%i2
	udivx	%o5,	0x0757,	%g4
	ldd	[%l7 + 0x48],	%f16
	add	%i1,	%o1,	%i3
	fnors	%f21,	%f12,	%f6
	fandnot1	%f6,	%f2,	%f10
	sub	%g6,	0x1FBC,	%l5
	movgu	%icc,	%i6,	%g1
	movvs	%icc,	%g7,	%g5
	sdiv	%o6,	0x0E8A,	%i0
	fcmple16	%f22,	%f22,	%i7
	fcmpgt32	%f14,	%f14,	%o2
	subccc	%l4,	%l1,	%l0
	lduh	[%l7 + 0x4E],	%o7
	orncc	%i5,	%o4,	%g3
	srax	%o3,	%l2,	%o0
	lduh	[%l7 + 0x60],	%l6
	edge8ln	%i4,	%g2,	%l3
	umul	%i2,	0x0005,	%g4
	and	%o5,	0x1F1D,	%o1
	andncc	%i1,	%i3,	%l5
	udiv	%i6,	0x0F97,	%g6
	movgu	%icc,	%g1,	%g5
	fones	%f4
	movl	%xcc,	%g7,	%i0
	udivcc	%o6,	0x09E4,	%o2
	andn	%l4,	%l1,	%i7
	fmovdpos	%xcc,	%f12,	%f27
	stw	%o7,	[%l7 + 0x40]
	ldd	[%l7 + 0x20],	%i4
	fmovdcs	%xcc,	%f27,	%f9
	umulcc	%l0,	0x18F0,	%g3
	movleu	%xcc,	%o4,	%l2
	fcmpes	%fcc1,	%f20,	%f8
	ldd	[%l7 + 0x68],	%f10
	fmovde	%icc,	%f3,	%f22
	movpos	%xcc,	%o0,	%o3
	movcc	%xcc,	%i4,	%l6
	fmovspos	%xcc,	%f13,	%f7
	srlx	%g2,	%l3,	%g4
	st	%f4,	[%l7 + 0x34]
	movge	%xcc,	%i2,	%o5
	movl	%xcc,	%i1,	%o1
	fcmpes	%fcc1,	%f29,	%f24
	andn	%i3,	0x0E0B,	%l5
	xor	%i6,	%g6,	%g5
	fmul8sux16	%f6,	%f12,	%f20
	stb	%g1,	[%l7 + 0x55]
	fone	%f2
	fmovrse	%g7,	%f25,	%f17
	movrne	%i0,	%o6,	%l4
	sir	0x0597
	fmovdgu	%xcc,	%f24,	%f13
	lduw	[%l7 + 0x68],	%l1
	smulcc	%i7,	%o2,	%o7
	bshuffle	%f18,	%f24,	%f2
	ldub	[%l7 + 0x56],	%l0
	edge32l	%g3,	%o4,	%l2
	array8	%i5,	%o3,	%i4
	movrgez	%l6,	0x215,	%o0
	sth	%g2,	[%l7 + 0x48]
	movrne	%l3,	%g4,	%i2
	udivcc	%i1,	0x1B07,	%o5
	std	%f14,	[%l7 + 0x28]
	fmovsl	%icc,	%f7,	%f29
	movle	%icc,	%i3,	%l5
	sth	%o1,	[%l7 + 0x2A]
	orn	%i6,	0x0E91,	%g6
	edge32n	%g5,	%g1,	%g7
	fandnot2s	%f17,	%f13,	%f8
	orncc	%o6,	0x1E29,	%l4
	movle	%xcc,	%i0,	%i7
	subcc	%l1,	%o2,	%o7
	edge16ln	%g3,	%l0,	%o4
	movg	%xcc,	%i5,	%l2
	udiv	%i4,	0x13C4,	%l6
	sll	%o3,	0x0F,	%o0
	fandnot2s	%f17,	%f18,	%f5
	popc	%g2,	%l3
	udivcc	%i2,	0x1587,	%g4
	array16	%i1,	%o5,	%i3
	movleu	%xcc,	%l5,	%i6
	edge16	%o1,	%g5,	%g6
	edge16n	%g1,	%o6,	%l4
	nop
	set	0x0E, %l4
	stb	%g7,	[%l7 + %l4]
	udivcc	%i7,	0x0A9B,	%i0
	array16	%o2,	%l1,	%g3
	fzero	%f18
	mulscc	%l0,	0x18DC,	%o4
	fmovsvs	%icc,	%f31,	%f30
	edge16l	%i5,	%o7,	%i4
	udivx	%l6,	0x0CF9,	%o3
	array8	%l2,	%g2,	%o0
	edge32n	%l3,	%g4,	%i1
	movn	%xcc,	%i2,	%i3
	movrlez	%l5,	%i6,	%o1
	mova	%icc,	%o5,	%g5
	fpmerge	%f19,	%f14,	%f20
	fmovdge	%icc,	%f28,	%f12
	movrlez	%g6,	%g1,	%l4
	mulscc	%o6,	0x19FA,	%i7
	array8	%g7,	%o2,	%i0
	fnot2	%f8,	%f10
	fnors	%f3,	%f20,	%f0
	srl	%g3,	%l1,	%l0
	movvc	%icc,	%o4,	%i5
	xor	%i4,	%o7,	%l6
	fmovrdne	%o3,	%f8,	%f10
	fmovdl	%xcc,	%f14,	%f24
	fmovsgu	%icc,	%f10,	%f12
	addccc	%l2,	0x04C5,	%g2
	sra	%l3,	0x19,	%g4
	umul	%i1,	0x0458,	%i2
	addcc	%o0,	%l5,	%i6
	andncc	%i3,	%o1,	%o5
	movvc	%xcc,	%g5,	%g6
	movcc	%icc,	%l4,	%o6
	subccc	%g1,	%g7,	%i7
	orn	%i0,	%o2,	%l1
	edge32n	%l0,	%o4,	%i5
	movcs	%icc,	%i4,	%g3
	edge8ln	%o7,	%o3,	%l2
	movrgz	%l6,	0x115,	%g2
	andncc	%l3,	%i1,	%i2
	fmovscc	%icc,	%f22,	%f11
	array16	%o0,	%g4,	%l5
	ldsb	[%l7 + 0x0A],	%i6
	mulx	%i3,	%o5,	%o1
	fxors	%f31,	%f31,	%f25
	movcc	%xcc,	%g5,	%l4
	andncc	%g6,	%o6,	%g1
	edge32n	%g7,	%i0,	%i7
	smulcc	%l1,	0x08AB,	%o2
	fnor	%f30,	%f0,	%f12
	movrne	%o4,	0x336,	%l0
	orcc	%i4,	%g3,	%i5
	addcc	%o7,	0x0DE5,	%l2
	or	%o3,	0x167E,	%g2
	fmovsle	%xcc,	%f11,	%f31
	smul	%l3,	0x099A,	%l6
	umulcc	%i2,	0x0CDA,	%i1
	ldub	[%l7 + 0x0A],	%o0
	ldx	[%l7 + 0x70],	%l5
	edge8	%i6,	%i3,	%o5
	andn	%o1,	%g4,	%l4
	add	%g5,	%o6,	%g1
	mulscc	%g7,	0x18D6,	%i0
	srl	%i7,	0x19,	%g6
	sdivx	%l1,	0x0905,	%o2
	alignaddrl	%l0,	%i4,	%g3
	srlx	%o4,	0x03,	%o7
	ldd	[%l7 + 0x20],	%i4
	fmul8ulx16	%f28,	%f20,	%f8
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%f16
	movrlz	%l2,	0x195,	%g2
	stw	%o3,	[%l7 + 0x54]
	movpos	%xcc,	%l6,	%i2
	array16	%i1,	%l3,	%o0
	umul	%l5,	%i6,	%i3
	array32	%o5,	%o1,	%l4
	fmovdcs	%xcc,	%f7,	%f31
	mulscc	%g4,	%g5,	%o6
	sdivx	%g1,	0x14C3,	%i0
	srlx	%g7,	%i7,	%l1
	movvc	%xcc,	%g6,	%o2
	fornot1s	%f15,	%f18,	%f9
	movrgz	%l0,	0x195,	%i4
	fmul8x16au	%f31,	%f14,	%f26
	ldd	[%l7 + 0x18],	%g2
	save %o7, %o4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%g2,	%i5
	edge8ln	%o3,	%l6,	%i2
	edge16	%i1,	%l3,	%o0
	save %l5, %i3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %o1, 0x1517, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o5,	%g5,	%o6
	xorcc	%g4,	%i0,	%g1
	sll	%i7,	0x1D,	%l1
	sth	%g7,	[%l7 + 0x28]
	fsrc1	%f20,	%f2
	fxor	%f28,	%f0,	%f14
	srl	%g6,	0x14,	%l0
	lduw	[%l7 + 0x74],	%i4
	movvc	%xcc,	%g3,	%o2
	edge16n	%o4,	%o7,	%g2
	movge	%icc,	%l2,	%o3
	srl	%l6,	%i5,	%i1
	movrgez	%l3,	%o0,	%l5
	fmuld8sux16	%f7,	%f5,	%f12
	fcmpgt16	%f26,	%f26,	%i2
	fmovrdgz	%i6,	%f10,	%f10
	sra	%o1,	%l4,	%o5
	orncc	%i3,	0x13FE,	%o6
	fxnor	%f26,	%f14,	%f16
	fcmple16	%f12,	%f2,	%g4
	alignaddr	%i0,	%g5,	%i7
	umulcc	%g1,	0x05C2,	%l1
	mova	%icc,	%g6,	%l0
	fmovscc	%xcc,	%f8,	%f4
	srax	%i4,	%g3,	%o2
	stx	%o4,	[%l7 + 0x60]
	movgu	%icc,	%g7,	%g2
	fmovsg	%icc,	%f20,	%f12
	edge8n	%l2,	%o3,	%l6
	ldsh	[%l7 + 0x5E],	%i5
	sir	0x1BBB
	edge8	%i1,	%l3,	%o0
	fnor	%f16,	%f2,	%f6
	edge16ln	%o7,	%l5,	%i2
	orcc	%o1,	0x06F3,	%l4
	udivcc	%o5,	0x1721,	%i3
	fnot2	%f0,	%f20
	edge32	%i6,	%o6,	%i0
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	fsrc1	%f8,	%f18
	edge16l	%i7,	%l1,	%g6
	smulcc	%l0,	0x1FD5,	%i4
	or	%g1,	%g3,	%o2
	movl	%icc,	%o4,	%g2
	ldd	[%l7 + 0x40],	%f8
	sethi	0x1A6B,	%g7
	ldx	[%l7 + 0x10],	%o3
	edge32n	%l2,	%i5,	%i1
	movcc	%xcc,	%l3,	%l6
	orcc	%o7,	0x17C3,	%o0
	movcc	%icc,	%i2,	%l5
	lduh	[%l7 + 0x56],	%l4
	alignaddrl	%o5,	%o1,	%i3
	movgu	%icc,	%o6,	%i0
	fmovdg	%icc,	%f20,	%f14
	edge32	%g5,	%i6,	%i7
	movvs	%xcc,	%g4,	%g6
	fmovrdlez	%l1,	%f4,	%f2
	sllx	%i4,	%g1,	%g3
	fmovsvs	%icc,	%f5,	%f12
	movleu	%xcc,	%o2,	%l0
	srax	%g2,	0x05,	%o4
	andncc	%g7,	%o3,	%l2
	fmovdvc	%xcc,	%f25,	%f11
	fnegd	%f2,	%f20
	orn	%i5,	%i1,	%l3
	sub	%l6,	0x0929,	%o7
	movcc	%xcc,	%i2,	%o0
	fabss	%f10,	%f6
	movne	%xcc,	%l4,	%o5
	nop
	set	0x48, %i6
	ldsw	[%l7 + %i6],	%o1
	movg	%icc,	%i3,	%l5
	edge32l	%o6,	%i0,	%i6
	fzero	%f10
	fzeros	%f14
	movne	%icc,	%i7,	%g4
	movre	%g5,	0x0BD,	%g6
	fmovspos	%icc,	%f11,	%f2
	fmovrslez	%i4,	%f14,	%f22
	movrlz	%g1,	0x3BF,	%g3
	movrlez	%o2,	%l1,	%g2
	fcmple16	%f6,	%f0,	%l0
	srax	%o4,	0x07,	%g7
	smulcc	%l2,	%i5,	%i1
	fzeros	%f1
	sdivx	%o3,	0x0892,	%l6
	move	%xcc,	%o7,	%l3
	fnot2	%f24,	%f30
	ldd	[%l7 + 0x30],	%f20
	save %o0, 0x1F4D, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i2,	%o5
	edge8l	%o1,	%i3,	%o6
	array32	%i0,	%l5,	%i6
	movge	%icc,	%i7,	%g4
	sth	%g5,	[%l7 + 0x72]
	fones	%f3
	edge8	%g6,	%i4,	%g1
	fzeros	%f5
	udivx	%g3,	0x0BCB,	%o2
	movrne	%g2,	%l1,	%l0
	movrlez	%g7,	0x15B,	%o4
	alignaddr	%i5,	%i1,	%o3
	movvs	%icc,	%l2,	%o7
	ldub	[%l7 + 0x74],	%l6
	movgu	%icc,	%l3,	%l4
	add	%o0,	0x02E6,	%i2
	movpos	%xcc,	%o1,	%i3
	fmovrde	%o6,	%f24,	%f24
	fmovsvs	%xcc,	%f2,	%f18
	sethi	0x1FF0,	%i0
	and	%l5,	%i6,	%i7
	save %g4, 0x197A, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f5,	%f7,	%f11
	orcc	%g5,	0x1816,	%g6
	fnor	%f28,	%f18,	%f18
	or	%g1,	0x1C0B,	%i4
	ldd	[%l7 + 0x78],	%o2
	lduw	[%l7 + 0x38],	%g3
	popc	%g2,	%l0
	and	%l1,	0x0CFC,	%g7
	sll	%i5,	0x0F,	%i1
	nop
	set	0x34, %l3
	lduw	[%l7 + %l3],	%o4
	movcc	%xcc,	%o3,	%o7
	ldd	[%l7 + 0x40],	%i6
	andncc	%l3,	%l4,	%l2
	fmovscc	%xcc,	%f14,	%f26
	fsrc1s	%f9,	%f4
	fmovsn	%xcc,	%f28,	%f17
	edge16ln	%i2,	%o1,	%i3
	sub	%o6,	%o0,	%i0
	ldd	[%l7 + 0x60],	%f28
	alignaddrl	%i6,	%i7,	%l5
	edge16	%o5,	%g4,	%g5
	movre	%g1,	0x120,	%i4
	sdiv	%o2,	0x09EC,	%g3
	lduw	[%l7 + 0x28],	%g6
	smul	%g2,	%l0,	%l1
	sdiv	%i5,	0x047C,	%i1
	fpack16	%f16,	%f24
	nop
	set	0x16, %l5
	lduh	[%l7 + %l5],	%g7
	xnor	%o4,	%o7,	%l6
	fornot1s	%f15,	%f15,	%f22
	movrlz	%o3,	0x143,	%l3
	edge16n	%l4,	%i2,	%o1
	andcc	%i3,	0x0B1B,	%l2
	fmovscs	%icc,	%f19,	%f1
	nop
	set	0x17, %l6
	ldub	[%l7 + %l6],	%o6
	fcmpes	%fcc2,	%f0,	%f30
	fmovrdgz	%i0,	%f14,	%f12
	edge8	%o0,	%i7,	%i6
	fpsub16	%f24,	%f22,	%f10
	andcc	%l5,	%o5,	%g5
	mulx	%g4,	%g1,	%o2
	udivcc	%i4,	0x1C24,	%g3
	movrlz	%g6,	%l0,	%g2
	movvc	%icc,	%i5,	%i1
	fcmps	%fcc3,	%f7,	%f1
	edge8ln	%l1,	%g7,	%o4
	fxnor	%f12,	%f2,	%f24
	movleu	%icc,	%o7,	%o3
	restore %l3, %l6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o1,	0x17A3,	%i2
	movne	%xcc,	%i3,	%l2
	fmovde	%icc,	%f25,	%f12
	movneg	%xcc,	%o6,	%i0
	fandnot1	%f22,	%f20,	%f10
	fmovdvs	%xcc,	%f4,	%f16
	edge32n	%i7,	%o0,	%i6
	fmovsvc	%icc,	%f30,	%f17
	sll	%l5,	%o5,	%g4
	fmovrdlez	%g1,	%f26,	%f8
	mova	%xcc,	%g5,	%o2
	srlx	%g3,	%i4,	%g6
	edge32l	%l0,	%g2,	%i5
	srlx	%l1,	%g7,	%i1
	edge32n	%o4,	%o3,	%o7
	edge8n	%l6,	%l4,	%o1
	siam	0x2
	xorcc	%i2,	%l3,	%l2
	movrlez	%i3,	%o6,	%i7
	array8	%i0,	%o0,	%l5
	stw	%o5,	[%l7 + 0x18]
	nop
	set	0x38, %g4
	stx	%i6,	[%l7 + %g4]
	movn	%xcc,	%g1,	%g4
	udivcc	%g5,	0x0924,	%o2
	fxors	%f22,	%f16,	%f18
	movleu	%icc,	%g3,	%i4
	sra	%g6,	%g2,	%l0
	andncc	%i5,	%l1,	%i1
	edge8ln	%o4,	%g7,	%o7
	lduw	[%l7 + 0x1C],	%o3
	edge16l	%l4,	%o1,	%l6
	move	%xcc,	%i2,	%l2
	fpadd16	%f16,	%f24,	%f10
	andn	%i3,	%o6,	%i7
	fcmps	%fcc0,	%f30,	%f15
	fcmpeq16	%f14,	%f30,	%i0
	smul	%l3,	%o0,	%o5
	fmovdvc	%icc,	%f9,	%f29
	srlx	%l5,	0x1F,	%g1
	fzeros	%f14
	lduw	[%l7 + 0x24],	%i6
	fmovrse	%g4,	%f15,	%f6
	alignaddr	%o2,	%g3,	%i4
	lduw	[%l7 + 0x54],	%g5
	srl	%g2,	0x17,	%g6
	fmovrdlez	%i5,	%f14,	%f2
	movrgez	%l0,	0x262,	%l1
	fxor	%f20,	%f0,	%f4
	fxnor	%f16,	%f6,	%f20
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%i0
	movrlez	%g7,	%o4,	%o7
	fmovsvs	%xcc,	%f16,	%f26
	movgu	%xcc,	%o3,	%o1
	pdist	%f6,	%f16,	%f14
	edge8n	%l4,	%l6,	%l2
	movrlez	%i3,	0x1C4,	%o6
	sth	%i2,	[%l7 + 0x2C]
	edge8n	%i0,	%l3,	%i7
	fnot1	%f30,	%f6
	xnor	%o5,	%o0,	%l5
	smul	%i6,	0x0F45,	%g1
	fsrc2	%f8,	%f10
	edge32n	%o2,	%g3,	%g4
	movrgz	%i4,	0x2C2,	%g2
	edge16ln	%g5,	%i5,	%l0
	fmul8x16	%f28,	%f14,	%f12
	andn	%l1,	0x0797,	%g6
	save %i1, 0x0F0F, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o7,	%g7,	%o3
	array32	%o1,	%l6,	%l4
	movrlez	%i3,	%o6,	%l2
	xnor	%i2,	0x1A28,	%l3
	fnot2	%f28,	%f10
	movrgez	%i7,	0x0CB,	%i0
	fxor	%f30,	%f28,	%f22
	ldsw	[%l7 + 0x58],	%o0
	movcs	%icc,	%o5,	%l5
	lduw	[%l7 + 0x6C],	%i6
	smul	%g1,	0x10A9,	%o2
	sethi	0x15DD,	%g3
	sdivcc	%i4,	0x0086,	%g4
	movrgz	%g2,	%i5,	%g5
	movg	%xcc,	%l0,	%l1
	popc	0x0D6E,	%g6
	sra	%o4,	0x08,	%i1
	sub	%g7,	0x0CB8,	%o3
	sub	%o7,	%l6,	%l4
	fmovsle	%icc,	%f3,	%f5
	andn	%o1,	0x0BE6,	%o6
	movrlz	%i3,	0x317,	%i2
	mulscc	%l2,	0x1427,	%i7
	movg	%xcc,	%i0,	%o0
	movle	%xcc,	%l3,	%l5
	sllx	%o5,	0x12,	%g1
	movcc	%icc,	%o2,	%g3
	movle	%icc,	%i4,	%g4
	ld	[%l7 + 0x0C],	%f11
	stb	%i6,	[%l7 + 0x33]
	movneg	%xcc,	%i5,	%g5
	movrlez	%g2,	0x138,	%l0
	movl	%icc,	%l1,	%g6
	sub	%o4,	%g7,	%o3
	fmul8ulx16	%f24,	%f26,	%f28
	addcc	%o7,	%i1,	%l6
	popc	%o1,	%l4
	edge16ln	%i3,	%o6,	%l2
	edge16ln	%i2,	%i7,	%o0
	fpsub32s	%f3,	%f15,	%f15
	fmovdpos	%xcc,	%f24,	%f2
	fcmple32	%f30,	%f24,	%i0
	orn	%l5,	%l3,	%o5
	xnorcc	%o2,	0x0283,	%g3
	movrne	%i4,	%g1,	%i6
	edge8l	%g4,	%g5,	%g2
	edge32n	%l0,	%l1,	%i5
	fmovrde	%g6,	%f20,	%f2
	andcc	%o4,	0x0F35,	%o3
	orncc	%o7,	%g7,	%i1
	stw	%o1,	[%l7 + 0x28]
	st	%f15,	[%l7 + 0x70]
	fnot2s	%f7,	%f18
	edge8	%l6,	%l4,	%o6
	stw	%l2,	[%l7 + 0x78]
	stx	%i3,	[%l7 + 0x60]
	fmovscs	%xcc,	%f6,	%f2
	sra	%i7,	%o0,	%i2
	fmovsa	%icc,	%f5,	%f27
	fcmped	%fcc2,	%f8,	%f16
	array8	%l5,	%l3,	%o5
	smul	%i0,	0x1DCC,	%o2
	fsrc1s	%f6,	%f14
	mulscc	%g3,	%g1,	%i4
	fnot2	%f30,	%f14
	fmovdgu	%icc,	%f16,	%f6
	fmovsne	%xcc,	%f31,	%f0
	movrgez	%g4,	0x3D3,	%i6
	addccc	%g2,	%l0,	%g5
	addc	%i5,	%l1,	%g6
	movgu	%xcc,	%o3,	%o4
	srl	%g7,	%i1,	%o7
	fmovd	%f2,	%f18
	movneg	%icc,	%o1,	%l4
	addccc	%o6,	%l6,	%i3
	movrgz	%i7,	%l2,	%o0
	sth	%l5,	[%l7 + 0x48]
	move	%xcc,	%l3,	%o5
	array32	%i2,	%o2,	%i0
	ld	[%l7 + 0x14],	%f8
	add	%g1,	0x0E6E,	%i4
	movrlz	%g4,	%g3,	%i6
	fandnot2s	%f24,	%f16,	%f29
	umulcc	%g2,	%g5,	%l0
	addccc	%l1,	%i5,	%o3
	stb	%g6,	[%l7 + 0x7E]
	fnegd	%f8,	%f22
	array8	%g7,	%o4,	%o7
	fmovsleu	%icc,	%f26,	%f6
	fmovspos	%xcc,	%f22,	%f19
	edge16	%o1,	%i1,	%l4
	subccc	%l6,	0x04FA,	%o6
	fpmerge	%f15,	%f7,	%f30
	movvs	%xcc,	%i7,	%i3
	fpack16	%f8,	%f21
	addcc	%o0,	%l2,	%l3
	sll	%l5,	0x13,	%o5
	ldsb	[%l7 + 0x34],	%o2
	movre	%i2,	0x3BE,	%i0
	movvc	%xcc,	%g1,	%g4
	sth	%g3,	[%l7 + 0x76]
	edge16	%i4,	%g2,	%g5
	sir	0x00D5
	xnor	%i6,	%l1,	%l0
	fpadd16s	%f15,	%f23,	%f24
	ld	[%l7 + 0x78],	%f20
	fpadd32s	%f4,	%f20,	%f26
	sra	%o3,	0x03,	%g6
	movrlez	%i5,	0x1D2,	%o4
	srax	%g7,	%o1,	%o7
	movle	%icc,	%i1,	%l4
	mulx	%l6,	%i7,	%o6
	edge32ln	%o0,	%l2,	%l3
	stw	%l5,	[%l7 + 0x10]
	edge8ln	%i3,	%o2,	%o5
	save %i2, %g1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%g4,	%i4
	move	%xcc,	%g3,	%g2
	movle	%xcc,	%g5,	%i6
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	movge	%icc,	%i5,	%o4
	fnot1s	%f31,	%f31
	ldsw	[%l7 + 0x6C],	%g7
	array32	%g6,	%o7,	%o1
	movrlez	%l4,	%i1,	%l6
	popc	0x161B,	%i7
	stx	%o0,	[%l7 + 0x28]
	movneg	%icc,	%o6,	%l3
	fmuld8sux16	%f9,	%f31,	%f0
	xnor	%l2,	%i3,	%o2
	alignaddr	%l5,	%i2,	%o5
	fmovsge	%icc,	%f12,	%f25
	ldd	[%l7 + 0x30],	%f18
	subccc	%g1,	%g4,	%i4
	udiv	%i0,	0x1CAE,	%g3
	udiv	%g2,	0x1112,	%i6
	alignaddr	%l1,	%g5,	%o3
	movrlez	%l0,	0x073,	%o4
	mulscc	%g7,	0x0923,	%g6
	addc	%o7,	0x128E,	%o1
	sub	%l4,	%i1,	%l6
	ldsb	[%l7 + 0x35],	%i7
	movpos	%xcc,	%o0,	%i5
	fmul8sux16	%f14,	%f28,	%f4
	pdist	%f4,	%f20,	%f4
	udivx	%l3,	0x1C22,	%l2
	udivcc	%o6,	0x1511,	%o2
	subccc	%i3,	%i2,	%l5
	movl	%icc,	%g1,	%o5
	fpack16	%f22,	%f12
	fmovrdgez	%g4,	%f10,	%f6
	fmuld8ulx16	%f14,	%f12,	%f6
	edge32l	%i0,	%i4,	%g2
	movcc	%xcc,	%g3,	%l1
	sub	%i6,	%g5,	%o3
	xnorcc	%l0,	0x1EE2,	%o4
	sub	%g6,	0x1C45,	%g7
	fmovdge	%xcc,	%f17,	%f30
	fmovs	%f3,	%f20
	srax	%o1,	%o7,	%i1
	fmovrde	%l4,	%f12,	%f0
	xnorcc	%l6,	0x1734,	%o0
	edge32	%i5,	%l3,	%l2
	edge8n	%o6,	%i7,	%o2
	fpackfix	%f0,	%f22
	sth	%i3,	[%l7 + 0x60]
	fmovrsgez	%l5,	%f12,	%f21
	fpackfix	%f22,	%f20
	fcmpd	%fcc3,	%f28,	%f30
	fxor	%f16,	%f6,	%f10
	srax	%g1,	0x18,	%i2
	fxors	%f3,	%f22,	%f3
	fcmpne32	%f22,	%f22,	%o5
	array32	%g4,	%i0,	%g2
	popc	%g3,	%l1
	movle	%xcc,	%i4,	%g5
	sra	%o3,	%i6,	%o4
	orncc	%l0,	%g6,	%o1
	smulcc	%g7,	0x1C68,	%i1
	xor	%o7,	%l6,	%o0
	array32	%l4,	%l3,	%l2
	sub	%i5,	0x1A28,	%i7
	or	%o6,	0x0C27,	%i3
	movrgez	%o2,	0x0C9,	%l5
	movg	%icc,	%i2,	%o5
	ldsh	[%l7 + 0x24],	%g1
	udivx	%g4,	0x0F97,	%g2
	udivcc	%g3,	0x0F1D,	%l1
	ldsw	[%l7 + 0x1C],	%i4
	movcc	%xcc,	%g5,	%o3
	sub	%i6,	0x07FC,	%i0
	sllx	%l0,	%o4,	%o1
	movvc	%icc,	%g6,	%i1
	orn	%o7,	%g7,	%l6
	mulscc	%l4,	%l3,	%o0
	edge16ln	%l2,	%i7,	%o6
	smul	%i3,	0x0487,	%i5
	fmovrdlez	%o2,	%f18,	%f18
	fmovrdlez	%l5,	%f18,	%f2
	movpos	%xcc,	%i2,	%o5
	restore %g4, %g1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f19,	%f17
	nop
	set	0x10, %g6
	ldsw	[%l7 + %g6],	%g3
	sdivcc	%l1,	0x1E59,	%i4
	sdivcc	%g5,	0x166D,	%i6
	srlx	%i0,	0x1D,	%l0
	movpos	%icc,	%o4,	%o1
	orn	%o3,	0x1E24,	%i1
	fmuld8sux16	%f20,	%f11,	%f2
	sllx	%o7,	0x00,	%g6
	andn	%g7,	0x13FA,	%l4
	sdivcc	%l6,	0x1E3E,	%l3
	udiv	%l2,	0x1B8B,	%i7
	srl	%o0,	0x0E,	%o6
	array16	%i3,	%i5,	%l5
	fxor	%f20,	%f16,	%f14
	movcc	%icc,	%i2,	%o5
	sethi	0x083B,	%o2
	fmovsl	%icc,	%f31,	%f6
	add	%g4,	0x0A5F,	%g1
	sll	%g3,	%g2,	%l1
	lduw	[%l7 + 0x78],	%i4
	stx	%i6,	[%l7 + 0x70]
	srl	%g5,	%l0,	%i0
	smul	%o1,	0x0811,	%o4
	fcmped	%fcc3,	%f6,	%f28
	subc	%i1,	0x19BD,	%o3
	fmuld8sux16	%f4,	%f21,	%f4
	ld	[%l7 + 0x78],	%f16
	edge8l	%o7,	%g6,	%g7
	stw	%l6,	[%l7 + 0x10]
	movl	%xcc,	%l3,	%l2
	edge16n	%i7,	%l4,	%o0
	subccc	%i3,	%i5,	%l5
	movvc	%xcc,	%i2,	%o6
	ldsb	[%l7 + 0x21],	%o2
	xorcc	%g4,	%g1,	%g3
	sub	%g2,	%o5,	%l1
	array8	%i4,	%i6,	%g5
	sth	%l0,	[%l7 + 0x0E]
	ldsh	[%l7 + 0x52],	%i0
	andn	%o4,	0x18E4,	%o1
	smulcc	%i1,	0x19C9,	%o7
	movpos	%icc,	%g6,	%o3
	movrlez	%l6,	0x091,	%l3
	fmovda	%xcc,	%f0,	%f0
	edge32	%l2,	%i7,	%l4
	udivcc	%o0,	0x0F25,	%i3
	orn	%g7,	%l5,	%i5
	fandnot1	%f12,	%f26,	%f12
	edge16l	%i2,	%o2,	%o6
	sth	%g4,	[%l7 + 0x58]
	edge32	%g1,	%g2,	%g3
	subc	%o5,	%i4,	%l1
	mova	%icc,	%g5,	%i6
	fabsd	%f10,	%f28
	edge8n	%l0,	%i0,	%o4
	alignaddrl	%o1,	%i1,	%o7
	movgu	%icc,	%g6,	%l6
	fpadd16s	%f14,	%f0,	%f17
	fmovdle	%xcc,	%f26,	%f6
	fnor	%f20,	%f30,	%f18
	fxnors	%f20,	%f20,	%f2
	edge32l	%o3,	%l2,	%l3
	mulx	%i7,	0x0A4A,	%l4
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	mulx	%i5,	0x0A0C,	%g7
	fcmpeq32	%f14,	%f12,	%i2
	fpack32	%f30,	%f10,	%f14
	array8	%o2,	%o6,	%g4
	umulcc	%g2,	%g1,	%g3
	movge	%icc,	%o5,	%i4
	edge8	%l1,	%i6,	%l0
	xnorcc	%i0,	0x1984,	%o4
	andn	%o1,	%g5,	%i1
	sllx	%g6,	%l6,	%o3
	edge16ln	%o7,	%l3,	%i7
	movge	%xcc,	%l4,	%i3
	movrgez	%o0,	0x01D,	%l5
	orncc	%i5,	0x18A3,	%l2
	movge	%icc,	%i2,	%g7
	fpadd32s	%f30,	%f9,	%f8
	fmovsgu	%icc,	%f7,	%f0
	andcc	%o2,	0x1046,	%g4
	movpos	%xcc,	%o6,	%g2
	movl	%icc,	%g3,	%o5
	edge16n	%i4,	%l1,	%g1
	subc	%l0,	0x0535,	%i0
	fmovsvs	%icc,	%f9,	%f15
	and	%o4,	0x0E46,	%o1
	edge8ln	%i6,	%i1,	%g5
	array16	%l6,	%o3,	%g6
	movrgez	%l3,	%i7,	%o7
	movl	%icc,	%i3,	%o0
	fmovrdlez	%l5,	%f28,	%f12
	ld	[%l7 + 0x1C],	%f11
	nop
	set	0x0C, %o5
	ldsw	[%l7 + %o5],	%l4
	fornot2s	%f14,	%f10,	%f5
	edge32l	%i5,	%i2,	%g7
	movrne	%o2,	0x17D,	%g4
	fpsub32s	%f25,	%f25,	%f8
	andcc	%l2,	0x1942,	%g2
	fones	%f20
	array8	%g3,	%o6,	%i4
	edge8ln	%o5,	%l1,	%l0
	movvc	%xcc,	%g1,	%i0
	movrgez	%o4,	%i6,	%i1
	addccc	%g5,	%o1,	%o3
	movrne	%g6,	0x295,	%l3
	subccc	%i7,	%l6,	%i3
	xorcc	%o7,	0x1429,	%o0
	fandnot2	%f2,	%f20,	%f6
	movn	%xcc,	%l4,	%i5
	lduw	[%l7 + 0x58],	%l5
	fmovdvs	%icc,	%f15,	%f31
	sll	%i2,	0x0B,	%o2
	movcc	%xcc,	%g7,	%g4
	fcmped	%fcc0,	%f18,	%f12
	sth	%g2,	[%l7 + 0x4C]
	fmovsn	%xcc,	%f22,	%f30
	xnor	%g3,	0x0BD1,	%o6
	movcc	%xcc,	%i4,	%l2
	fmuld8ulx16	%f30,	%f1,	%f18
	std	%f22,	[%l7 + 0x68]
	smul	%o5,	0x019F,	%l0
	udivcc	%g1,	0x0818,	%i0
	movne	%xcc,	%l1,	%i6
	ldd	[%l7 + 0x50],	%f20
	sth	%o4,	[%l7 + 0x42]
	fpadd32	%f2,	%f14,	%f28
	array32	%i1,	%o1,	%o3
	fmovrdgz	%g6,	%f6,	%f30
	fmovd	%f28,	%f14
	edge32l	%g5,	%l3,	%l6
	st	%f31,	[%l7 + 0x14]
	faligndata	%f2,	%f0,	%f26
	movvs	%xcc,	%i3,	%o7
	nop
	set	0x5F, %l2
	stb	%o0,	[%l7 + %l2]
	edge32l	%l4,	%i5,	%l5
	xnorcc	%i2,	0x1F58,	%o2
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%i6
	fsrc1s	%f28,	%f18
	edge16ln	%g7,	%g4,	%g2
	fpsub32s	%f13,	%f31,	%f29
	std	%f20,	[%l7 + 0x48]
	sir	0x0833
	umul	%o6,	0x026D,	%g3
	edge16l	%l2,	%o5,	%l0
	fandnot2	%f2,	%f14,	%f16
	udivx	%i4,	0x1471,	%g1
	alignaddrl	%l1,	%i6,	%o4
	stb	%i1,	[%l7 + 0x2C]
	movleu	%xcc,	%i0,	%o1
	sth	%o3,	[%l7 + 0x0C]
	addc	%g5,	%g6,	%l3
	ldx	[%l7 + 0x20],	%l6
	movrgez	%o7,	%o0,	%i3
	ldd	[%l7 + 0x78],	%l4
	mova	%xcc,	%l5,	%i2
	fmovdge	%xcc,	%f13,	%f15
	edge16n	%i5,	%o2,	%g7
	fandnot1s	%f23,	%f12,	%f26
	srl	%g4,	0x1D,	%i7
	fpsub32	%f30,	%f20,	%f4
	fcmps	%fcc3,	%f17,	%f18
	fmovrdlz	%g2,	%f4,	%f22
	alignaddr	%o6,	%l2,	%g3
	movrgez	%o5,	%i4,	%g1
	edge32l	%l0,	%i6,	%l1
	ld	[%l7 + 0x30],	%f10
	sllx	%o4,	%i0,	%o1
	addcc	%o3,	0x142B,	%g5
	edge8l	%i1,	%g6,	%l6
	and	%o7,	%l3,	%o0
	fcmpd	%fcc0,	%f0,	%f14
	udivcc	%i3,	0x1D76,	%l4
	subc	%i2,	%i5,	%l5
	sethi	0x1F41,	%o2
	movpos	%xcc,	%g7,	%g4
	edge32	%g2,	%o6,	%i7
	sth	%g3,	[%l7 + 0x36]
	movrgz	%o5,	0x3CF,	%l2
	fpsub32s	%f19,	%f0,	%f6
	fxnor	%f18,	%f2,	%f14
	fmovrdlez	%i4,	%f22,	%f2
	ldd	[%l7 + 0x58],	%l0
	andcc	%g1,	0x146B,	%l1
	addc	%o4,	0x0D94,	%i0
	ldsb	[%l7 + 0x4E],	%o1
	udivx	%o3,	0x0172,	%i6
	fmovs	%f9,	%f4
	mulscc	%i1,	0x07BC,	%g5
	st	%f15,	[%l7 + 0x1C]
	umul	%g6,	%l6,	%l3
	edge32ln	%o0,	%o7,	%i3
	lduh	[%l7 + 0x1A],	%l4
	fxnor	%f26,	%f26,	%f4
	movre	%i5,	0x155,	%l5
	popc	0x14E5,	%o2
	umulcc	%i2,	%g7,	%g2
	movrlez	%g4,	%i7,	%o6
	mova	%xcc,	%g3,	%o5
	fmovdne	%xcc,	%f5,	%f26
	sdiv	%l2,	0x172A,	%i4
	edge8ln	%g1,	%l1,	%o4
	umulcc	%i0,	0x1753,	%o1
	edge8	%o3,	%i6,	%l0
	movcc	%icc,	%g5,	%g6
	ldsb	[%l7 + 0x62],	%i1
	ldub	[%l7 + 0x46],	%l3
	ld	[%l7 + 0x0C],	%f17
	fmovda	%icc,	%f31,	%f10
	alignaddr	%o0,	%l6,	%o7
	add	%i3,	%l4,	%i5
	xnor	%l5,	%o2,	%g7
	edge16ln	%i2,	%g2,	%g4
	movrlez	%i7,	0x07D,	%o6
	movrlez	%o5,	0x010,	%g3
	stw	%i4,	[%l7 + 0x1C]
	movl	%xcc,	%g1,	%l2
	ldd	[%l7 + 0x58],	%l0
	xnor	%i0,	%o1,	%o4
	nop
	set	0x50, %o7
	ldsw	[%l7 + %o7],	%o3
	fcmpeq16	%f20,	%f6,	%l0
	xor	%i6,	0x16B3,	%g6
	movgu	%xcc,	%i1,	%g5
	umulcc	%o0,	%l6,	%l3
	udivcc	%i3,	0x1C4E,	%l4
	fpadd16	%f2,	%f20,	%f16
	fzeros	%f9
	fornot1	%f30,	%f14,	%f24
	fmovsneg	%icc,	%f9,	%f7
	edge8l	%i5,	%l5,	%o2
	fornot2s	%f11,	%f23,	%f21
	alignaddrl	%o7,	%g7,	%g2
	edge16n	%i2,	%i7,	%o6
	edge16l	%o5,	%g3,	%i4
	edge32l	%g1,	%l2,	%l1
	movre	%g4,	0x246,	%i0
	edge32	%o1,	%o3,	%l0
	umulcc	%o4,	%g6,	%i6
	ldsw	[%l7 + 0x5C],	%g5
	movrne	%i1,	0x323,	%l6
	fmovde	%icc,	%f28,	%f4
	fxnor	%f12,	%f6,	%f12
	sth	%o0,	[%l7 + 0x56]
	sra	%i3,	0x19,	%l4
	stb	%i5,	[%l7 + 0x4E]
	save %l5, 0x116A, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o2,	%g7,	%o7
	ldd	[%l7 + 0x58],	%i2
	movl	%xcc,	%g2,	%i7
	fmul8x16al	%f8,	%f26,	%f0
	sub	%o5,	0x1FCC,	%g3
	edge8n	%o6,	%g1,	%l2
	fcmped	%fcc3,	%f6,	%f4
	movrgez	%l1,	%g4,	%i4
	smul	%o1,	0x0E82,	%i0
	smul	%o3,	%o4,	%l0
	edge8	%i6,	%g6,	%i1
	stw	%l6,	[%l7 + 0x38]
	ldsw	[%l7 + 0x3C],	%g5
	nop
	set	0x52, %o0
	sth	%o0,	[%l7 + %o0]
	movcc	%xcc,	%l4,	%i5
	fmovsne	%xcc,	%f11,	%f8
	fornot1	%f28,	%f14,	%f12
	movrlz	%l5,	0x242,	%i3
	movle	%xcc,	%o2,	%l3
	fnot2	%f22,	%f28
	mova	%xcc,	%o7,	%g7
	popc	%i2,	%i7
	andncc	%g2,	%g3,	%o6
	sub	%g1,	%l2,	%l1
	movge	%xcc,	%o5,	%g4
	fpadd32s	%f3,	%f14,	%f11
	edge16l	%o1,	%i4,	%o3
	alignaddrl	%o4,	%i0,	%i6
	movl	%icc,	%g6,	%l0
	edge16ln	%l6,	%g5,	%o0
	edge16	%l4,	%i1,	%i5
	edge16ln	%l5,	%o2,	%i3
	edge8ln	%o7,	%g7,	%i2
	edge32	%i7,	%l3,	%g2
	addcc	%g3,	%g1,	%l2
	ldsh	[%l7 + 0x76],	%l1
	xnor	%o6,	%o5,	%o1
	edge8ln	%i4,	%g4,	%o3
	fnot1s	%f14,	%f9
	sllx	%o4,	%i6,	%g6
	fmovsvc	%xcc,	%f27,	%f17
	ldx	[%l7 + 0x40],	%l0
	edge8n	%i0,	%l6,	%o0
	ld	[%l7 + 0x7C],	%f4
	sllx	%l4,	0x00,	%g5
	fmovdl	%icc,	%f19,	%f18
	save %i5, 0x00F6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f8,	%f31
	fpadd32	%f18,	%f16,	%f30
	andcc	%i1,	0x0D06,	%i3
	alignaddr	%o7,	%o2,	%g7
	smulcc	%i2,	%l3,	%g2
	fpsub16	%f20,	%f20,	%f8
	fzeros	%f17
	fmul8x16al	%f29,	%f3,	%f26
	sdiv	%i7,	0x1F3F,	%g3
	edge16	%g1,	%l2,	%l1
	sdiv	%o5,	0x0D3E,	%o1
	fxnors	%f12,	%f22,	%f20
	ldsw	[%l7 + 0x18],	%i4
	array32	%o6,	%g4,	%o4
	orcc	%o3,	0x07CF,	%i6
	ldsw	[%l7 + 0x64],	%l0
	fmovrslz	%i0,	%f0,	%f28
	fxor	%f30,	%f14,	%f14
	orncc	%g6,	%o0,	%l4
	sethi	0x0D55,	%l6
	bshuffle	%f6,	%f28,	%f20
	edge8	%g5,	%i5,	%i1
	edge32ln	%i3,	%l5,	%o2
	edge16	%o7,	%g7,	%i2
	srlx	%g2,	%l3,	%i7
	addcc	%g3,	0x0770,	%l2
	stx	%g1,	[%l7 + 0x60]
	fornot2	%f16,	%f8,	%f4
	movle	%icc,	%l1,	%o1
	edge8l	%o5,	%i4,	%g4
	fnot1	%f30,	%f26
	sdiv	%o4,	0x0997,	%o3
	xor	%o6,	0x0BC3,	%i6
	edge16ln	%l0,	%i0,	%o0
	stx	%l4,	[%l7 + 0x08]
	movvs	%icc,	%g6,	%g5
	edge32n	%l6,	%i1,	%i5
	udivcc	%i3,	0x093E,	%l5
	movre	%o7,	0x1F2,	%o2
	fmovdle	%xcc,	%f7,	%f28
	srlx	%g7,	0x00,	%g2
	sub	%l3,	%i2,	%g3
	smul	%i7,	0x09A9,	%l2
	edge32l	%l1,	%g1,	%o5
	sra	%o1,	0x01,	%g4
	movvc	%xcc,	%o4,	%o3
	movn	%xcc,	%i4,	%i6
	umul	%o6,	%l0,	%o0
	andcc	%l4,	0x0F7A,	%i0
	xnorcc	%g5,	0x1524,	%l6
	andcc	%i1,	%g6,	%i3
	sll	%i5,	%o7,	%l5
	fcmpgt32	%f0,	%f10,	%g7
	orn	%g2,	0x19BC,	%l3
	sdivx	%o2,	0x0518,	%g3
	edge8n	%i2,	%l2,	%l1
	fpadd16s	%f9,	%f18,	%f24
	movcc	%icc,	%g1,	%i7
	mova	%xcc,	%o1,	%g4
	addccc	%o5,	%o3,	%o4
	movn	%xcc,	%i4,	%i6
	smul	%o6,	0x10BC,	%o0
	array8	%l0,	%l4,	%g5
	fones	%f31
	sub	%l6,	0x13B4,	%i1
	movleu	%icc,	%i0,	%g6
	edge8l	%i5,	%o7,	%i3
	add	%l5,	0x1A46,	%g7
	movgu	%xcc,	%l3,	%o2
	fnot2	%f22,	%f12
	xorcc	%g3,	0x099E,	%g2
	and	%l2,	0x0C08,	%i2
	fmul8x16al	%f10,	%f5,	%f10
	sethi	0x02F3,	%l1
	st	%f1,	[%l7 + 0x70]
	lduw	[%l7 + 0x4C],	%i7
	movneg	%xcc,	%g1,	%o1
	ldsh	[%l7 + 0x36],	%o5
	fmovdcs	%xcc,	%f30,	%f18
	movrlz	%o3,	0x3BB,	%g4
	edge32	%i4,	%o4,	%o6
	edge8ln	%i6,	%l0,	%o0
	ldsb	[%l7 + 0x20],	%g5
	fmovrslez	%l4,	%f25,	%f19
	array32	%l6,	%i1,	%g6
	movg	%xcc,	%i5,	%o7
	lduw	[%l7 + 0x2C],	%i3
	movn	%xcc,	%l5,	%g7
	nop
	set	0x2C, %o2
	stw	%i0,	[%l7 + %o2]
	orcc	%o2,	0x0D27,	%g3
	movne	%xcc,	%g2,	%l3
	edge32ln	%i2,	%l1,	%l2
	fmovsne	%xcc,	%f3,	%f30
	udiv	%i7,	0x0BFA,	%g1
	fornot2	%f30,	%f24,	%f12
	udivx	%o5,	0x0F4C,	%o3
	lduw	[%l7 + 0x50],	%o1
	andncc	%g4,	%o4,	%o6
	srlx	%i4,	0x1F,	%l0
	subc	%o0,	%i6,	%l4
	or	%l6,	%i1,	%g5
	movre	%i5,	0x0F3,	%g6
	movrlz	%o7,	0x26B,	%l5
	movrlz	%i3,	%i0,	%o2
	movrgez	%g7,	0x0EC,	%g3
	fpsub16s	%f3,	%f6,	%f20
	movrlz	%l3,	%g2,	%i2
	srl	%l1,	%l2,	%g1
	fmul8sux16	%f26,	%f4,	%f2
	sth	%o5,	[%l7 + 0x2E]
	edge8n	%o3,	%o1,	%i7
	udiv	%o4,	0x1918,	%o6
	fmovs	%f17,	%f13
	lduw	[%l7 + 0x60],	%g4
	edge8n	%i4,	%l0,	%o0
	xorcc	%i6,	%l6,	%l4
	fornot1	%f26,	%f18,	%f2
	st	%f11,	[%l7 + 0x20]
	movrgz	%i1,	%g5,	%i5
	restore %g6, %o7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i0,	%l5,	%o2
	sll	%g7,	%l3,	%g2
	sth	%i2,	[%l7 + 0x32]
	edge32ln	%l1,	%g3,	%g1
	ldx	[%l7 + 0x28],	%l2
	nop
	set	0x08, %i5
	sth	%o5,	[%l7 + %i5]
	st	%f29,	[%l7 + 0x5C]
	fzeros	%f18
	movvc	%xcc,	%o3,	%o1
	ldd	[%l7 + 0x58],	%i6
	movvc	%icc,	%o6,	%g4
	add	%i4,	0x082A,	%l0
	for	%f12,	%f20,	%f28
	fornot1	%f28,	%f30,	%f20
	fands	%f8,	%f30,	%f29
	edge16ln	%o4,	%i6,	%o0
	xorcc	%l4,	%i1,	%g5
	movleu	%xcc,	%l6,	%g6
	alignaddr	%i5,	%i3,	%o7
	smul	%l5,	0x1C08,	%i0
	fmovsle	%icc,	%f3,	%f8
	smulcc	%o2,	%l3,	%g2
	movl	%xcc,	%i2,	%g7
	fmovdg	%icc,	%f28,	%f2
	movneg	%xcc,	%g3,	%g1
	movleu	%xcc,	%l2,	%l1
	lduh	[%l7 + 0x32],	%o3
	edge8	%o5,	%o1,	%o6
	fnot1	%f18,	%f2
	andn	%g4,	0x1C58,	%i4
	xor	%l0,	%o4,	%i7
	movpos	%xcc,	%i6,	%o0
	stx	%i1,	[%l7 + 0x50]
	movrgez	%l4,	0x093,	%g5
	ld	[%l7 + 0x68],	%f14
	fcmped	%fcc0,	%f6,	%f12
	orcc	%l6,	0x1D18,	%i5
	orcc	%g6,	%o7,	%i3
	edge8	%l5,	%i0,	%l3
	ldd	[%l7 + 0x60],	%f28
	xor	%o2,	%g2,	%i2
	udiv	%g7,	0x1A45,	%g3
	nop
	set	0x08, %i1
	stx	%l2,	[%l7 + %i1]
	sll	%l1,	%o3,	%o5
	edge32ln	%g1,	%o6,	%o1
	ldsb	[%l7 + 0x22],	%i4
	alignaddrl	%l0,	%g4,	%i7
	sth	%i6,	[%l7 + 0x08]
	save %o4, %o0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g5,	%i1,	%i5
	lduw	[%l7 + 0x58],	%l6
	sdivx	%g6,	0x19A6,	%o7
	movrlez	%i3,	%i0,	%l3
	fpadd16	%f30,	%f28,	%f26
	sra	%o2,	0x11,	%g2
	umul	%l5,	%g7,	%g3
	smul	%l2,	%l1,	%i2
	umulcc	%o3,	%g1,	%o5
	udivcc	%o6,	0x1A14,	%o1
	movl	%icc,	%i4,	%g4
	and	%l0,	%i7,	%i6
	nop
	set	0x70, %g7
	stw	%o4,	[%l7 + %g7]
	edge8ln	%l4,	%g5,	%i1
	popc	0x1904,	%o0
	edge32ln	%l6,	%g6,	%o7
	movge	%icc,	%i5,	%i0
	alignaddr	%i3,	%l3,	%o2
	smul	%l5,	0x123C,	%g7
	fmul8x16al	%f13,	%f31,	%f18
	fpadd32	%f16,	%f20,	%f4
	lduh	[%l7 + 0x52],	%g2
	array32	%g3,	%l1,	%i2
	sth	%o3,	[%l7 + 0x58]
	fpack32	%f24,	%f24,	%f28
	movneg	%xcc,	%l2,	%g1
	edge16	%o6,	%o5,	%i4
	sir	0x0EDE
	umul	%o1,	0x1737,	%l0
	movre	%g4,	0x1CE,	%i7
	mova	%xcc,	%o4,	%l4
	smul	%i6,	%g5,	%i1
	edge32ln	%l6,	%o0,	%g6
	and	%i5,	%o7,	%i3
	sra	%i0,	%o2,	%l3
	fandnot2s	%f19,	%f18,	%f11
	sdiv	%g7,	0x1A7F,	%l5
	movrne	%g3,	0x029,	%l1
	movpos	%xcc,	%i2,	%g2
	movrne	%o3,	%l2,	%g1
	fcmped	%fcc3,	%f24,	%f14
	andn	%o5,	0x0B1C,	%o6
	orn	%i4,	%l0,	%g4
	smulcc	%o1,	%i7,	%o4
	move	%icc,	%i6,	%l4
	edge32ln	%g5,	%l6,	%i1
	srlx	%g6,	0x03,	%o0
	fmovrdgz	%i5,	%f8,	%f18
	movcs	%xcc,	%o7,	%i3
	std	%f26,	[%l7 + 0x60]
	xorcc	%i0,	0x14C9,	%l3
	movne	%xcc,	%o2,	%l5
	movgu	%xcc,	%g3,	%g7
	sll	%l1,	%i2,	%g2
	fmovsg	%icc,	%f23,	%f1
	sra	%o3,	%l2,	%g1
	mova	%xcc,	%o6,	%o5
	sll	%l0,	0x1D,	%g4
	sdiv	%o1,	0x0CBC,	%i7
	array16	%i4,	%o4,	%l4
	udiv	%g5,	0x17B1,	%l6
	subccc	%i1,	0x14C3,	%i6
	fmuld8ulx16	%f3,	%f16,	%f10
	ldsw	[%l7 + 0x40],	%g6
	movpos	%xcc,	%o0,	%i5
	mulscc	%o7,	0x06B4,	%i3
	ld	[%l7 + 0x40],	%f28
	std	%f18,	[%l7 + 0x58]
	movne	%icc,	%l3,	%o2
	move	%icc,	%l5,	%g3
	andn	%i0,	%l1,	%g7
	edge16n	%g2,	%i2,	%l2
	fxnor	%f12,	%f10,	%f18
	alignaddr	%o3,	%g1,	%o5
	fmovdvc	%xcc,	%f28,	%f20
	addcc	%o6,	0x18A7,	%g4
	array32	%o1,	%i7,	%i4
	add	%o4,	0x1181,	%l4
	edge16	%g5,	%l0,	%l6
	movl	%xcc,	%i6,	%i1
	ld	[%l7 + 0x58],	%f1
	edge16ln	%g6,	%i5,	%o0
	fmovsgu	%icc,	%f10,	%f27
	sdivx	%o7,	0x1B01,	%i3
	array16	%l3,	%o2,	%l5
	udivcc	%g3,	0x069B,	%l1
	xorcc	%g7,	%i0,	%g2
	movl	%icc,	%l2,	%o3
	movneg	%icc,	%i2,	%g1
	addccc	%o5,	%o6,	%g4
	fornot1	%f18,	%f12,	%f10
	edge32ln	%i7,	%o1,	%o4
	fmovscs	%icc,	%f20,	%f13
	fmovrsgz	%i4,	%f24,	%f28
	sll	%g5,	%l4,	%l0
	or	%i6,	%l6,	%g6
	faligndata	%f16,	%f26,	%f18
	movpos	%xcc,	%i1,	%i5
	andn	%o7,	%i3,	%o0
	orncc	%l3,	%o2,	%g3
	for	%f18,	%f10,	%f30
	movne	%xcc,	%l1,	%g7
	sll	%i0,	%l5,	%l2
	subccc	%g2,	%i2,	%g1
	sll	%o5,	%o6,	%o3
	fmovscs	%icc,	%f9,	%f4
	movn	%xcc,	%g4,	%o1
	ldd	[%l7 + 0x30],	%o4
	nop
	set	0x4B, %g1
	ldub	[%l7 + %g1],	%i4
	udiv	%g5,	0x1B58,	%i7
	movneg	%icc,	%l4,	%i6
	alignaddr	%l0,	%l6,	%g6
	movne	%xcc,	%i1,	%o7
	ldsb	[%l7 + 0x4D],	%i5
	ld	[%l7 + 0x38],	%f29
	edge32ln	%i3,	%l3,	%o2
	fcmpgt16	%f4,	%f2,	%o0
	ldsh	[%l7 + 0x50],	%g3
	edge16n	%l1,	%i0,	%l5
	alignaddr	%l2,	%g7,	%g2
	udivcc	%g1,	0x053F,	%i2
	edge8	%o6,	%o3,	%g4
	movl	%xcc,	%o1,	%o4
	fnot1s	%f7,	%f25
	fmovsn	%icc,	%f13,	%f21
	fornot2s	%f28,	%f6,	%f17
	popc	%o5,	%g5
	fmovsne	%xcc,	%f31,	%f6
	edge32	%i4,	%l4,	%i7
	movrgz	%l0,	%l6,	%i6
	movcc	%icc,	%i1,	%o7
	sth	%i5,	[%l7 + 0x0A]
	sir	0x1DBA
	movneg	%xcc,	%i3,	%g6
	mulscc	%o2,	%o0,	%g3
	fmovrde	%l1,	%f4,	%f6
	udiv	%i0,	0x06F6,	%l3
	movg	%xcc,	%l2,	%l5
	udivcc	%g7,	0x077D,	%g1
	edge16n	%i2,	%g2,	%o6
	edge32l	%g4,	%o3,	%o1
	addc	%o5,	0x0E96,	%g5
	movgu	%icc,	%i4,	%l4
	xor	%i7,	0x003B,	%o4
	sir	0x0E2E
	ld	[%l7 + 0x20],	%f12
	edge8ln	%l6,	%l0,	%i1
	andcc	%o7,	%i6,	%i5
	save %i3, 0x1BB3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f22,	%f1
	movvs	%xcc,	%o0,	%o2
	ldub	[%l7 + 0x14],	%g3
	movg	%icc,	%i0,	%l1
	fnot2s	%f19,	%f12
	movne	%icc,	%l3,	%l5
	fmovdcc	%icc,	%f20,	%f18
	save %l2, %g1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g7,	0x0A62,	%g2
	andncc	%g4,	%o6,	%o1
	stb	%o5,	[%l7 + 0x1E]
	fmovsl	%icc,	%f11,	%f3
	sub	%g5,	%i4,	%o3
	fmovsneg	%icc,	%f31,	%f13
	movvc	%xcc,	%l4,	%i7
	alignaddrl	%o4,	%l6,	%l0
	movge	%icc,	%i1,	%o7
	fmovdneg	%xcc,	%f1,	%f23
	save %i6, 0x1244, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g6,	%i5,	%o2
	ldsh	[%l7 + 0x08],	%o0
	st	%f31,	[%l7 + 0x4C]
	sll	%g3,	%i0,	%l1
	srlx	%l3,	%l2,	%l5
	movrne	%g1,	0x0B1,	%g7
	ldd	[%l7 + 0x18],	%f24
	movpos	%icc,	%g2,	%i2
	edge32n	%g4,	%o1,	%o5
	fmovscs	%icc,	%f2,	%f18
	movrlez	%o6,	0x24C,	%i4
	stw	%o3,	[%l7 + 0x3C]
	fcmpes	%fcc2,	%f0,	%f5
	fors	%f0,	%f17,	%f25
	edge8l	%l4,	%g5,	%i7
	movrlz	%l6,	0x159,	%o4
	and	%l0,	0x09A5,	%o7
	srax	%i1,	0x17,	%i6
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	movrgz	%o2,	%i5,	%g3
	edge8l	%i0,	%l1,	%o0
	orncc	%l2,	%l3,	%l5
	stb	%g7,	[%l7 + 0x5C]
	xor	%g2,	%i2,	%g1
	srax	%g4,	%o1,	%o6
	alignaddrl	%i4,	%o5,	%l4
	fpsub16	%f30,	%f18,	%f0
	fmovsg	%xcc,	%f5,	%f25
	srlx	%g5,	%i7,	%o3
	lduw	[%l7 + 0x70],	%l6
	fmovdne	%xcc,	%f4,	%f10
	fpack16	%f0,	%f23
	fcmple16	%f10,	%f10,	%l0
	sir	0x1DA0
	stw	%o7,	[%l7 + 0x08]
	udiv	%o4,	0x0AA5,	%i6
	sra	%i3,	0x03,	%i1
	ldd	[%l7 + 0x18],	%f26
	addcc	%o2,	%g6,	%g3
	siam	0x3
	st	%f19,	[%l7 + 0x5C]
	xnorcc	%i5,	%i0,	%o0
	sra	%l1,	0x0D,	%l2
	nop
	set	0x08, %o3
	stx	%l5,	[%l7 + %o3]
	lduh	[%l7 + 0x1E],	%g7
	orcc	%g2,	0x182F,	%i2
	orncc	%g1,	0x150B,	%l3
	umulcc	%g4,	0x1070,	%o6
	array8	%o1,	%i4,	%l4
	array16	%o5,	%g5,	%i7
	fmovdpos	%xcc,	%f5,	%f23
	movvs	%xcc,	%l6,	%o3
	edge32l	%l0,	%o7,	%i6
	fmovsa	%icc,	%f6,	%f2
	edge8n	%i3,	%o4,	%o2
	fcmpes	%fcc0,	%f5,	%f3
	fmovsl	%xcc,	%f30,	%f29
	movne	%xcc,	%i1,	%g6
	sdivcc	%i5,	0x145F,	%g3
	fone	%f2
	sll	%o0,	%i0,	%l1
	movvc	%icc,	%l5,	%g7
	subcc	%g2,	%l2,	%g1
	movne	%icc,	%l3,	%i2
	array32	%g4,	%o6,	%o1
	fpsub32	%f6,	%f16,	%f8
	fmovsle	%icc,	%f26,	%f24
	stb	%l4,	[%l7 + 0x0A]
	ldd	[%l7 + 0x70],	%i4
	add	%g5,	%o5,	%i7
	array32	%l6,	%o3,	%o7
	udiv	%l0,	0x0FFF,	%i3
	andcc	%i6,	%o4,	%i1
	fmovrse	%g6,	%f23,	%f7
	smulcc	%o2,	0x04DD,	%i5
	edge16	%g3,	%i0,	%o0
	edge16ln	%l1,	%g7,	%l5
	save %g2, %g1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%i2,	%l2
	fmovdneg	%icc,	%f4,	%f20
	movg	%icc,	%o6,	%o1
	fmovscc	%icc,	%f10,	%f19
	edge8n	%g4,	%i4,	%g5
	fsrc1	%f4,	%f26
	movl	%xcc,	%o5,	%l4
	movre	%i7,	0x2B2,	%o3
	edge16ln	%l6,	%o7,	%i3
	fmovdn	%xcc,	%f9,	%f17
	movne	%icc,	%l0,	%i6
	edge16	%o4,	%g6,	%o2
	xorcc	%i5,	0x0591,	%g3
	fmovdn	%xcc,	%f14,	%f1
	ldsh	[%l7 + 0x42],	%i1
	fmovsg	%xcc,	%f3,	%f25
	lduh	[%l7 + 0x4E],	%o0
	sll	%l1,	%g7,	%l5
	sdiv	%i0,	0x0879,	%g1
	fmovrsgz	%l3,	%f24,	%f8
	fmovdcs	%icc,	%f4,	%f28
	ld	[%l7 + 0x4C],	%f9
	smul	%g2,	%i2,	%o6
	restore %o1, %l2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g4,	0x1313,	%o5
	movvs	%xcc,	%l4,	%i7
	edge16ln	%o3,	%l6,	%g5
	smul	%i3,	0x1BD4,	%o7
	movcs	%xcc,	%i6,	%o4
	lduw	[%l7 + 0x58],	%l0
	addc	%g6,	%i5,	%o2
	fmovrdlez	%i1,	%f18,	%f0
	ldub	[%l7 + 0x42],	%o0
	move	%xcc,	%g3,	%g7
	move	%xcc,	%l1,	%l5
	fpsub16	%f22,	%f10,	%f26
	sir	0x10AD
	orncc	%i0,	%g1,	%l3
	edge8ln	%i2,	%o6,	%o1
	sub	%g2,	0x0CDD,	%l2
	fsrc1	%f26,	%f18
	st	%f2,	[%l7 + 0x20]
	srax	%i4,	0x1D,	%o5
	movrgz	%g4,	0x188,	%i7
	fcmpes	%fcc2,	%f5,	%f18
	orncc	%l4,	0x14CE,	%l6
	smul	%g5,	%i3,	%o7
	fpack16	%f30,	%f27
	stx	%i6,	[%l7 + 0x70]
	edge16l	%o4,	%l0,	%g6
	ldd	[%l7 + 0x10],	%o2
	movleu	%icc,	%o2,	%i5
	fmuld8sux16	%f13,	%f22,	%f6
	fmovsneg	%xcc,	%f8,	%f21
	ldsw	[%l7 + 0x0C],	%o0
	fzeros	%f19
	fcmpgt16	%f20,	%f4,	%i1
	fzeros	%f15
	movne	%xcc,	%g7,	%l1
	save %l5, 0x1D3D, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g1,	%l3,	%i2
	srlx	%o6,	%i0,	%g2
	xnorcc	%o1,	%i4,	%l2
	ldsw	[%l7 + 0x20],	%g4
	fmovsn	%xcc,	%f19,	%f25
	addccc	%o5,	%l4,	%i7
	sdivx	%g5,	0x08CC,	%l6
	fmovdleu	%icc,	%f2,	%f24
	fpsub32s	%f18,	%f14,	%f23
	andcc	%o7,	%i6,	%i3
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	movrne	%o2,	%o3,	%o0
	ldsw	[%l7 + 0x08],	%i5
	fsrc2	%f4,	%f26
	edge32n	%g7,	%i1,	%l5
	sra	%l1,	%g1,	%g3
	move	%icc,	%i2,	%o6
	fpadd32s	%f31,	%f6,	%f23
	fpack32	%f6,	%f4,	%f24
	edge32l	%i0,	%g2,	%o1
	lduw	[%l7 + 0x78],	%l3
	ld	[%l7 + 0x58],	%f6
	edge8n	%l2,	%i4,	%g4
	edge16ln	%l4,	%o5,	%g5
	fmuld8sux16	%f16,	%f0,	%f20
	movl	%xcc,	%l6,	%i7
	mulx	%i6,	%i3,	%l0
	andcc	%g6,	0x09CA,	%o7
	mova	%icc,	%o2,	%o3
	restore %o0, 0x0209, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g7,	0x193,	%i1
	ldub	[%l7 + 0x2C],	%o4
	movcs	%icc,	%l5,	%g1
	sub	%g3,	%l1,	%i2
	edge16ln	%o6,	%g2,	%o1
	fones	%f28
	movleu	%xcc,	%l3,	%i0
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	udivx	%l4,	0x1A16,	%o5
	ld	[%l7 + 0x48],	%f17
	nop
	set	0x30, %i7
	stx	%l2,	[%l7 + %i7]
	or	%l6,	%i7,	%g5
	subccc	%i6,	0x1B1E,	%l0
	movgu	%xcc,	%g6,	%o7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3539
!	Type f   	: 5299
!	Type i   	: 16162
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x7347231A
.word 0xAE19807E
.word 0x3B996AEB
.word 0x445F03CB
.word 0xA7B01781
.word 0x3AAD7A77
.word 0xFA406C89
.word 0xB0F90BED
.word 0x188B3A57
.word 0x3DA37683
.word 0x40F03F61
.word 0x6BF90BEB
.word 0x2B64A70D
.word 0xA3F086BD
.word 0xDE7CCBB9
.word 0xD0F1C99F
.word 0xC58254E2
.word 0xDE1BCAE7
.word 0xC5C90529
.word 0x09CCF799
.word 0x152700DB
.word 0xEE3C06C0
.word 0x9C11C840
.word 0x14B0A9FF
.word 0xE14CA336
.word 0xCD94906F
.word 0xCA53311A
.word 0x2B3322F2
.word 0xC261C4D6
.word 0xD7A743B9
.word 0x031AB832
.word 0xC8D62CAF
.word 0x34A83634
.word 0x74925EE2
.word 0xED5E1F67
.word 0x4C7239D6
.word 0xC929D9C5
.word 0x488D7BAC
.word 0x5A3399DD
.word 0x4073A215
.word 0xB953A051
.word 0xD38230B2
.word 0xD07B1407
.word 0x1E89E617
.word 0xADEC4FA0
.word 0xEAD4B497
.word 0x26CF61EE
.word 0x13CC0ADE
.word 0xBFB81A8B
.word 0x7EC08194
.word 0x8C150554
.word 0x1E981DEE
.word 0x312AF67A
.word 0x07B64E26
.word 0x917AAF21
.word 0x607DDA0E
.word 0x72618D8C
.word 0x0B048B09
.word 0x30886E3A
.word 0xC0316C4F
.word 0xFB35DE6B
.word 0xD5323FA9
.word 0x2C6E5366
.word 0xDA177AC7
.end
